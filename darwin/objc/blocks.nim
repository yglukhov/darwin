import runtime, macros

type
  Block*[T: proc] = ptr object of NSObject

  BlockLiteral[T] = object
    isa: pointer
    flags: cint
    reserved: cint
    invoke: pointer
    descriptor: ptr BlockDescriptor
    # imported variables
    h: ClosureHolder[T]

  # This wrapper is only needed because we can't GC_ref closures
  ClosureHolder[T] = ref object
    p: T

  BlockDescriptor = object
    reserved: culong
    size: culong
    copy_helper: proc(dst, src: pointer) {.cdecl.}
    dispose_helper: proc(src: pointer) {.cdecl.}
    signature: cstring

# Reference: https://clang.llvm.org/docs/Block-ABI-Apple.html

proc copyHelper[T](dst, src: pointer) {.cdecl.} =
  cast[ptr BlockLiteral[T]](dst)[] = cast[ptr BlockLiteral[T]](src)[]

proc disposeHelper[T](dst: pointer) {.cdecl.} =
  let blk = cast[ptr BlockLiteral[T]](dst)
  let h = blk.h
  blk.h = nil
  GC_unref(h)

proc getSignature(t: typedesc): cstring =
  # TODO: Should this be implemented???
  ""

proc stripSinkFromArgType(t: NimNode): NimNode =
  result = t
  if result.kind == nnkBracketExpr and result.len == 2 and result[0].kind == nnkSym and $result[0] == "sink":
    result = result[1]

iterator arguments(formalParams: NimNode): tuple[idx: int, name, typ, default: NimNode] =
  formalParams.expectKind(nnkFormalParams)
  var iParam = 0
  for i in 1 ..< formalParams.len:
    let pp = formalParams[i]
    for j in 0 .. pp.len - 3:
      yield (iParam, pp[j], copyNimTree(stripSinkFromArgType(pp[^2])), pp[^1])
      inc iParam

macro implementInvoke(T: typedesc): untyped =
  let t = getTypeImpl(T)[1]

  let call = newCall(newDotExpr(newDotExpr(ident"blk", ident"h"), ident"p"))
  let params = copyNimTree(t[0])
  result = newProc(ident"invoke", body = call)
  let newParams = newTree(nnkFormalParams, params[0])
  newParams.add(newIdentDefs(ident"blk", ident"TBlock"))

  for _, n, t, _ in arguments(params):
    call.add(ident($n))
    newParams.add(newIdentDefs(ident($n), t))

  result.params = newParams
  result.addPragma(ident"cdecl")

  result = newTree(nnkStmtList, result)
  result.add quote do:
    result = invoke

proc getInvoke(T: typedesc): pointer =
  type TBlock = ptr BlockLiteral[T]
  implementInvoke(T)

proc createBlockDescriptor(T: typedesc): BlockDescriptor =
  BlockDescriptor(
    size: culong(sizeof(BlockLiteral[T])),
    copy_helper: copyHelper[T],
    dispose_helper: disposeHelper[T],
    signature: getSignature(T)
  )

proc getBlockDescriptor(T: typedesc): ptr BlockDescriptor =
  var bd {.global.} = createBlockDescriptor(T)
  addr bd

var NSConcreteStackBlock {.importc: "_NSConcreteStackBlock".}: ptr pointer
proc copyBlock(blk: pointer): pointer {.importc: "_Block_copy".}

const
  BLOCK_IS_NOESCAPE      =  (1 shl 23)

  BLOCK_HAS_COPY_DISPOSE =  (1 shl 25)
  BLOCK_HAS_CTOR =          (1 shl 26)
  BLOCK_IS_GLOBAL =         (1 shl 28)
  BLOCK_HAS_STRET =         (1 shl 29) # IFF BLOCK_HAS_SIGNATURE
  BLOCK_HAS_SIGNATURE =     (1 shl 30)

proc toBlockFromClosure[T](v: T): Block[T] =
  var blk = BlockLiteral[T](
    isa: NSConcreteStackBlock,
    flags: BLOCK_HAS_COPY_DISPOSE,
    invoke: getInvoke(T),
    descriptor: getBlockDescriptor(T),
    h: ClosureHolder[T](p: v)
  )
  GC_ref(blk.h)
  cast[Block[T]](copyBlock(addr blk))

macro convertToClosure(v: typed): untyped =
  let t = getTypeImpl(v)

  var hasClosurePragma = false
  for n in t.pragma:
    if t.kind in {nnkIdent, nnkSym} and $t == "closure":
      hasClosurePragma = true
      break

  let params = t[0]
  let newParams = newTree(nnkFormalParams, params[0])

  for _, n, t, _ in arguments(params):
    newParams.add(newIdentDefs(ident($n), t))
  t[0] = newParams

  if not hasClosurePragma:
    t.addPragma(ident"closure")
  result = quote do:
    var a: `t` = `v`
    toBlockFromClosure(a)

proc toBlock*[T: proc](v: T): auto =
  ## Returns Block[T {.closure.}]
  convertToClosure(v)
