import ../darwin/foundation
import ../darwin/objc/blocks

let a = NSString("hello")
let b = NSString("bye")
let arr = arrayWithObjects(a, b)
doAssert($arr[0] == "hello")
doAssert(arr.len == 2)

proc test() =
  var elems = newSeq[string]()
  let bl = toBlock() do(o: NSString, idx: uint, stop: var bool):
    elems.add($o)

  arr.enumerateObjectsUsingBlock(bl)
  bl.release()
  doAssert(elems == @["hello", "bye"])

  let bl2 = toBlock() do(o: NSString, idx: uint, stop: var bool):
    # Here we test that the block created as of the same exact
    # type as above despite this callback being not closure
    discard

  arr.enumerateObjectsUsingBlock(bl2)
  bl2.release()

  elems = @[]
  arr.enumerateObjectsUsingBlock() do(o: NSString, idx: uint, stop: var bool):
    elems.add($o)
  doAssert(elems == @["hello", "bye"])

test()
