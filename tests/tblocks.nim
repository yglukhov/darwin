import ../darwin/objc/blocks

####
proc testBlock() =
  var v = 5
  let bl = toBlock() do(a: int):
    v = v + a
  bl.call(123)
  doAssert(v == 128)

testBlock()

####
type MyBlock = proc(a:int): void
proc testBlock2(cb: Block[MyBlock]) =
  cb.call(123)

var v = 5
let bl = toBlock() do(a: int):
  v = v + a
testBlock2(bl)
doAssert(v == 128)

####
type MyBlock2 = proc(): void

proc testBlock3(cb: Block[MyBlock2]) =
  cb.call()

var v2 = 5
let bl2 = toBlock() do():
  v2 = v2 + 1
testBlock3(bl2)
doAssert(v2 == 6)
