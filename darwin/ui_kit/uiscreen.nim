import ../objc/runtime
import ../core_graphics/cggeometry

type UIScreen* = ptr object of NSObject

proc mainScreen*(n: typedesc[UIScreen]): UIScreen {.objc: "mainScreen".}
proc mainScreen*(): UIScreen {.inline.} = UIScreen.mainScreen()
proc nativeScale(s: UIScreen): CGFloat {.objc: "nativeScale".}
proc scaleFactor*(s: UIScreen): CGFloat =
    if s.respondsToSelector("nativeScale"):
        result = s.nativeScale()
    else:
        result = 1
