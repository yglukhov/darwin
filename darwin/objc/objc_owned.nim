## Helpers for managing Objective-C object lifetimes from Nim ARC/ORC code.
##
## `ObjcOwned[T]` is a small RAII wrapper around a raw Objective-C pointer `T`.
## On destruction it calls Objective-C `release`, and on copy it calls `retain`.
## This lets Nim values own Objective-C objects safely without manual `release`
## calls in every code path.
##
## Ownership conventions:
## - Use `fromRetained` / `resetRetained` when the pointer is already +1
##   retained (for example `alloc/init`, `new*`, or APIs documented as retained).
## - Use `fromBorrowed` / `resetBorrowed` for borrowed/autoreleased (+0) objects.
##   These APIs retain internally so the wrapper becomes the owner.
## - Use `borrow` to pass the raw pointer to Objective-C calls without changing
##   ownership.
##
## Autorelease pools:
## - Use `withAutoreleasePool:` (or `autoreleasepool:` alias) around code that
##   may create temporary autoreleased Objective-C objects.
## - The pool is always popped via `finally`, even when exceptions occur.
##
## Example:
## ```nim
## var s = fromBorrowed(NSString.withUTF8String("hello"))
## echo $cast[NSString](s.borrow)
## # released automatically when `s` goes out of scope
## ```
import ./runtime

{.passL: "-lobjc".}

proc objc_autoreleasePoolPush(): pointer {.importc, cdecl.}
proc objc_autoreleasePoolPop(pool: pointer) {.importc, cdecl.}

type AutoreleasePool* = object
  handle: pointer

proc start*(p: var AutoreleasePool) =
  if p.handle != nil:
    return
  p.handle = objc_autoreleasePoolPush()

proc stop*(p: var AutoreleasePool) =
  if p.handle == nil:
    return
  objc_autoreleasePoolPop(p.handle)
  p.handle = nil

proc `=destroy`*(p: var AutoreleasePool) =
  p.stop()

template withAutoreleasePool*(body: untyped) =
  block:
    var pool = AutoreleasePool()
    pool.start()
    try:
      body
    finally:
      pool.stop()

template autoreleasepool*(body: untyped) =
  withAutoreleasePool:
    body

type ObjcOwned*[T] = object
  ## A minimal retain/release wrapper for Objective-C objects when using Nim ARC/ORC.
  ## This does not interact with Swift ARC; it only calls Objective-C retain/release.
  p: T

func isNil*[T](o: ObjcOwned[T]): bool =
  cast[pointer](o.p) == nil

func borrow*[T](o: ObjcOwned[T]): T =
  o.p

proc clear*[T](o: var ObjcOwned[T]) =
  if cast[pointer](o.p) != nil:
    {.cast(raises: []).}:
      release(cast[NSObject](o.p))
    o.p = cast[T](nil)

proc resetRetained*[T](o: var ObjcOwned[T], p: T) =
  ## Sets to an already-retained (+1) ObjC object.
  if o.p == p:
    return
  o.clear()
  o.p = p

proc resetBorrowed*[T](o: var ObjcOwned[T], p: T) =
  ## Sets to a borrowed (+0/autoreleased) ObjC object by retaining it.
  if o.p == p:
    return
  o.clear()
  o.p = (
    if cast[pointer](p) == nil:
      cast[T](nil)
    else:
      cast[T](retain(cast[NSObject](p)))
  )

proc fromRetained*[T](p: T): ObjcOwned[T] =
  ObjcOwned[T](p: p)

proc fromBorrowed*[T](p: T): ObjcOwned[T] =
  ObjcOwned[T](
    p: (
      if cast[pointer](p) == nil:
        cast[T](nil)
      else:
        cast[T](retain(cast[NSObject](p)))
    )
  )

proc `=destroy`*[T](o: var ObjcOwned[T]) =
  o.clear()

proc `=copy`*[T](dst: var ObjcOwned[T], src: ObjcOwned[T]) =
  if dst.p == src.p:
    return
  dst.clear()
  dst.p = (
    if cast[pointer](src.p) == nil:
      cast[T](nil)
    else:
      cast[T](retain(cast[NSObject](src.p)))
  )

proc `=sink`*[T](dst: var ObjcOwned[T], src: ObjcOwned[T]) =
  dst.clear()
  dst.p = src.p
  # `=sink` requires immutable `src`; null it out via address so `src` does not release.
  cast[ptr ObjcOwned[T]](unsafeAddr src)[].p = cast[T](nil)
