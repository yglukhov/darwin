import ../darwin/foundation

let a = NSString("hello")
let b = NSString("bye")
let arr = arrayWithObjects(a, b)
doAssert($arr[0] == "hello")
doAssert(arr.len == 2)
