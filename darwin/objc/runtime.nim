import macros, strutils

{.passL: "-framework Foundation".}

const
  YES* = true
  NO* = false

type
    NSObject* {.pure, inheritable.} = ptr object 
    ObjcClass* = ptr object of NSObject

    NSString* = ptr object of NSObject

    Method* = distinct pointer
    Ivar* = distinct pointer
    Category* = distinct pointer
    IMP* = proc(id: ID, selector: SEL): ID {.cdecl, varargs.}
    Protocol* = distinct pointer
    ID* = pointer
    SEL* = distinct pointer
    STR* = ptr char
    arith_t* = int
    uarith_t* = uint
    ptrdiff_t* = int
    BOOL* = bool

    NSInteger* = int
    NSUInteger* = uint

    objc_method_description = object
      name: SEL
      types: cstring

    MethodDescription* = object
      name*: SEL
      types*: string

    Property* = distinct pointer

    ObjcSuper* = object
        receiver*: ID
        superClass*: ObjcClass

    objc_property_attribute_t* = object
        name*: cstring
        value*: cstring

    PropertyAttribute* = object
        name*: string
        value*: string

    objc_exception_functions_t* = object
        version: cint
        throw_exc: proc(id: ID) {.cdecl.}
        try_enter: proc(p: pointer) {.cdecl.}
        try_exit: proc(p: pointer) {.cdecl.}
        extract: proc(p: pointer): ID {.cdecl.}
        match: proc(class: ObjcClass, id: ID): cint {.cdecl.}

    objc_AssociationPolicy* {.size: sizeof(cuint).} = enum
        OBJC_ASSOCIATION_ASSIGN = 0
        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1
        OBJC_ASSOCIATION_COPY_NONATOMIC = 3
        OBJC_ASSOCIATION_RETAIN = 01401
        OBJC_ASSOCIATION_COPY = 01403

proc isNil*(a: ObjcClass): bool =
  result = a.pointer == nil

proc c_free(p: pointer) {.importc: "free", header: "<stdlib.h>".}

proc class_getName(cls: ObjcClass): cstring {.cdecl, importc.}
proc getName*(cls: ObjcClass): string =
  result = $class_getName(cls)

proc `$`*(cls: ObjcClass): string =
  getName(cls)

proc class_getSuperclass(cls: ObjcClass): ObjcClass {.cdecl, importc.}
template getSuperclass*(cls: ObjcClass): untyped =
  class_getSuperClass(cls)

proc class_isMetaClass(cls: ObjcClass): bool {.cdecl, importc.}
template isMetaClass*(cls: ObjcClass): untyped =
  class_isMetaClass(cls)

proc class_getInstanceSize(cls: ObjcClass): csize_t {.cdecl, importc.}
proc getInstanceSize*(cls: ObjcClass): int = class_getInstanceSize(cls).int

proc class_getInstanceVariable(cls: ObjcClass; name: cstring): Ivar {.cdecl, importc.}
template getIvar*(cls: ObjcClass, name: string): untyped =
  class_getInstanceVariable(cls, name.cstring)

proc class_getClassVariable(cls: ObjcClass; name: cstring): Ivar {.cdecl, importc.}
template getClassVariable*(cls: ObjcClass; name: string): untyped =
  class_getClassVariable(cls, name.cstring)

proc class_addIvar(cls: ObjcClass; name: cstring; size: csize_t; alignment: uint8; types: cstring): bool {.cdecl, importc.}
proc addIvar*(cls: ObjcClass; name: string; size: int; alignment: int; types: string): bool =
  class_addIvar(cls, name.cstring, size.csize_t, alignment.uint8, types.cstring) == YES

proc class_copyIvarList(cls: ObjcClass; outCount: var cuint): ptr Ivar {.cdecl, importc.}
proc ivarList*(cls: ObjcClass): seq[Ivar] =
  var
    count = 0.cuint
    ivars = class_copyIvarList(cls, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Ivar](count)
  copyMem(result[0].addr, ivars, sizeof(Ivar) * count.int)
  c_free(ivars)

proc class_getIvarLayout*(cls: ObjcClass): ptr uint8 {.cdecl, importc.}
proc class_getWeakIvarLayout*(cls: ObjcClass): ptr uint8 {.cdecl, importc.}
proc class_setIvarLayout*(cls: ObjcClass; layout: ptr uint8) {.cdecl, importc.}
proc class_setWeakIvarLayout*(cls: ObjcClass; layout: ptr uint8) {.cdecl, importc.}

proc class_getProperty(cls: ObjcClass; name: cstring): Property {.cdecl, importc.}
template getProperty*(cls: ObjcClass; name: string): untyped =
  class_getProperty(cls, name.cstring)
proc class_copyPropertyList*(cls: ObjcClass, outCount: var cuint): ptr Property {.cdecl, importc.}
proc propertyList*(cls: ObjcClass): seq[Property] =
  var
    count = 0.cuint
    props = class_copyPropertyList(cls, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Property](count)
  copyMem(result[0].addr, props, sizeof(Property) * count.int)
  c_free(props)

proc class_addMethod(cls: ObjcClass; name: SEL; imp: IMP; types: cstring): bool {.cdecl, importc.}
template addMethod*(cls: ObjcClass; name: SEL; imp: IMP; types: string): typed =
  class_addMethod(cls, name, imp, types.cstring)

proc class_getInstanceMethod(cls: ObjcClass; name: SEL): Method {.cdecl, importc.}
template getInstanceMethod*(cls: ObjcClass; name: SEL): untyped =
  class_getInstanceMethod(cls, name)

proc class_getClassMethod(cls: ObjcClass; name: SEL): Method {.cdecl, importc.}
template getClassMethod*(cls: ObjcClass; name: SEL): untyped =
  class_getClassMethod(cls, name)

proc class_copyMethodList(cls: ObjcClass; outCount: var cuint): ptr Method {.cdecl, importc.}
proc methodList*(cls: ObjcClass): seq[Method] =
  var
    count = 0.cuint
    procs = class_copyMethodList(cls, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Method](count)
  copyMem(result[0].addr, procs, sizeof(Method) * count.int)
  c_free(procs)

proc class_replaceMethod(cls: ObjcClass; name: SEL; imp: IMP; types: cstring): IMP {.cdecl, importc.}
template replaceMethod*(cls: ObjcClass; name: SEL; imp: IMP; types: string): untyped =
  class_replaceMethod(cls, name, imp, types.cstring)

proc class_getMethodImplementation(cls: ObjcClass; name: SEL): IMP {.cdecl, importc.}
template getMethodImplementation*(cls: ObjcClass; name: SEL): untyped =
  class_getMethodImplementation(cls, name)

proc class_getMethodImplementation_stret*(cls: ObjcClass; name: SEL): IMP {.cdecl, importc.}

proc class_respondsToSelector(cls: ObjcClass; sel: SEL): bool {.cdecl, importc.}
template respondsToSelector*(cls: ObjcClass; sel: SEL): untyped =
  class_respondsToSelector(cls, sel)

proc class_addProtocol(cls: ObjcClass; protocol: Protocol): bool {.cdecl, importc.}
template addProtocol*(cls: ObjcClass; protocol: Protocol): untyped =
  class_addProtocol(cls, protocol)

proc class_addProperty(cls: ObjcClass; name: cstring;
                       attributes: ptr objc_property_attribute_t;
                       attributeCount: cuint): bool {.cdecl, importc.}

proc addProperty*(cls: ObjcClass; name: string; attributes: openArray[objc_property_attribute_t]): bool =
  class_addProperty(cls, name.cstring, attributes[0].unsafeAddr, attributes.len.cuint) == YES


proc class_replaceProperty(cls: ObjcClass; name: cstring;
                           attributes: ptr objc_property_attribute_t;
                           attributeCount: cuint) {.cdecl, importc.}

proc replaceProperty*(cls: ObjcClass; name: string; attributes: openArray[objc_property_attribute_t]) =
  class_replaceProperty(cls, name.cstring, attributes[0].unsafeAddr, attributes.len.cuint)

proc class_conformsToProtocol(cls: ObjcClass; protocol: Protocol): bool {.cdecl, importc.}
template conformsToProtocol*(cls: ObjcClass; protocol: Protocol): bool =
  class_conformsToProtocol(cls, protocol) == YES

proc class_copyProtocolList(cls: ObjcClass; outCount: var cuint): ptr Protocol {.cdecl, importc.}
proc protocolList*(cls: ObjcClass): seq[Protocol] =
  var
    count = 0.cuint
    prots = class_copyProtocolList(cls, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Protocol](count)
  copyMem(result[0].addr, prots, sizeof(Protocol) * count.int)
  c_free(prots)

proc class_getVersion(cls: ObjcClass): cint {.cdecl, importc.}
template getVersion*(cls: ObjcClass): untyped =
  class_getVersion(cls).int

proc class_setVersion(cls: ObjcClass; version: cint) {.cdecl, importc.}
template setVersion*(cls: ObjcClass; version: int) =
  class_setVersion(cls, version.cint)

proc objc_getFutureClass(name: cstring): ObjcClass {.cdecl, importc.}
template getFutureClass*(name: string): untyped =
  objc_getFutureClass(name.cstring)

proc objc_allocateClassPair(superclass: ObjcClass, name: cstring, extraBytes: csize_t): ObjcClass {.cdecl, importc.}
template allocateClassPair*(superclass: ObjcClass, name: string, extraBytes: int): untyped =
  objc_allocateClassPair(superclass, name.cstring, extrabytes.csize_t)

proc objc_disposeClassPair(cls: ObjcClass) {.cdecl, importc.}
template disposeClassPair*(cls: ObjcClass) =
  objc_disposeClassPair(cls)

proc objc_registerClassPair(cls: ObjcClass) {.cdecl, importc.}
template registerClassPair*(cls: ObjcClass) =
  objc_registerClassPair(cls)

proc objc_duplicateClass(original: ObjcClass; name: cstring; extraBytes: csize_t): ObjcClass {.cdecl, importc.}
template duplicateClass*(original: ObjcClass; name: string; extraBytes: int): untyped =
  objc_duplicateClass(original, name.cstring, extraBytes.csize_t)

proc class_createInstance(cls: ObjcClass; extraBytes: csize_t): ID {.cdecl, importc.}
template createInstance*(cls: ObjcClass; extraBytes: csize_t): untyped =
  class_createInstance(cls, extraBytes.csize_t)

proc objc_constructInstance(cls: ObjcClass; bytes: pointer): ID {.cdecl, importc.}
template constructInstance*(cls: ObjcClass; bytes: pointer): untyped =
  objc_constructInstance(cls, bytes)

proc objc_destructInstance(obj: ID): pointer {.cdecl, importc.}
template destructInstance*(obj: ID): untyped =
  objc_destructInstance(obj)

proc object_copy(obj: ID; size: csize_t): ID {.cdecl, importc.}
template copy*(obj: ID; size: csize_t): untyped =
  object_copy(obj, size.csize_t)

proc object_dispose(obj: ID): ID {.cdecl, importc.}
template dispose*(obj: ID): untyped =
  object_dispose(obj)

proc object_setInstanceVariable(obj: ID; name: cstring; value: pointer): Ivar {.cdecl, importc.}
template setInstanceVariable*(obj: ID; name: string; value: pointer): untyped =
  object_setInstanceVariable(obj, name.cstring, value)

proc object_getInstanceVariable(obj: ID; name: cstring; outValue: var pointer): Ivar {.cdecl, importc.}
template getInstanceVariable*(obj: ID; name: string; outValue: var pointer): untyped =
  object_getInstanceVariable(obj, name.cstring, outValue)

proc object_getIndexedIvars(obj: ID): pointer {.cdecl, importc.}
template getIndexedIvars*(obj: ID): untyped =
  object_getIndexedIvars(obj)

proc object_getIvar(obj: ID; ivar: Ivar): ID {.cdecl, importc.}
template getIvar*(obj: ID; ivar: Ivar): untyped =
  object_getIvar(obj, ivar)

proc object_setIvar(obj: ID; ivar: Ivar; value: ID) {.cdecl, importc.}
template setIvar*(obj: ID; ivar: Ivar; value: ID) =
  object_setIvar(obj, ivar, value)

proc object_getClassName(obj: ID): cstring {.cdecl, importc.}
proc getClassName*(obj: ID): string =
  result = $object_getClassName(obj)

proc objc_getClass(name: cstring): ObjcClass {.cdecl, importc.}
template getClass*(name: string): untyped =
  objc_getClass(name.cstring)

proc object_setClass(obj: ID; cls: ObjcClass): ObjcClass {.cdecl, importc.}
template setClass*(obj: ID; cls: ObjcClass): untyped =
  object_setClass(obj, cls)

proc objc_getClassList(buffer: ptr ObjcClass; bufferCount: cint): cint {.cdecl, importc.}
proc getClassList*(): seq[ObjcClass] =
  let count = objc_getClassList(nil, 0.cint)
  if count == 0:
    result = @[]
    return result
  result = newSeq[ObjcClass](count)
  discard objc_getClassList(result[0].addr, result.len.cint)

proc objc_copyClassList(outCount: var cuint): ptr ObjcClass {.cdecl, importc.}

proc copyClassList*(): seq[ObjcClass] =
  var
    count = 0.cuint
    classes = objc_copyClassList(count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[ObjcClass](count)
  copyMem(result[0].addr, classes, sizeof(ObjcClass) * count.int)
  c_free(classes)

proc objc_lookUpClass(name: cstring): ObjcClass {.cdecl, importc.}
template lookUpClass*(name: cstring): untyped =
  objc_lookUpClass(name.cstring)

proc object_getClass(obj: ID): ObjcClass {.cdecl, importc.}
template getClass*(obj: ID): untyped =
  object_getClass(obj)

proc objc_getRequiredClass(name: cstring): ObjcClass {.cdecl, importc.}
template getRequiredClass*(name: string): untyped =
  objc_getRequiredClass(name.cstring)

proc objc_getMetaClass(name: cstring): ObjcClass {.cdecl, importc.}
template getMetaClass*(name: string): untyped =
  objc_getMetaClass(name.cstring)

proc ivar_getName(v: Ivar): cstring {.cdecl, importc.}
template getName*(v: Ivar): untyped =
  $ivar_getName(v)

proc `$`*(v: Ivar): string =
  getName(v)

proc ivar_getTypeEncoding(v: Ivar): cstring {.cdecl, importc.}
template getTypeEncoding*(v: Ivar): untyped =
  $ivar_getTypeEncoding(v)

proc ivar_getOffset(v: Ivar): ptrdiff_t {.cdecl, importc.}
template getOffset*(v: Ivar): untyped =
  ivar_getOffset(v)

proc objc_setAssociatedObject(obj: ID; key: pointer; value: ID; policy: objc_AssociationPolicy) {.cdecl, importc.}
template setAssociatedObject*(obj: ID; key: pointer; value: ID; policy: objc_AssociationPolicy) =
  objc_setAssociatedObject(obj, key, value, policy)

proc objc_getAssociatedObject(obj: ID; key: pointer): ID {.cdecl, importc.}
template getAssociatedObject*(obj: ID; key: pointer): untyped =
  objc_getAssociatedObject(obj, key)

proc objc_removeAssociatedObjects(obj: ID) {.cdecl, importc.}
template removeAssociatedObjects*(obj: ID) =
  objc_removeAssociatedObjects(obj)

proc objc_msgSend*(self: ID; op: SEL): ID {.cdecl, importc, discardable, varargs.}
proc objc_msgSend_fpret*(self: ID; op: SEL): cdouble {.cdecl, importc, varargs.}
proc objc_msgSend_stret*(self: ID; op: SEL) {.cdecl, importc, varargs.}
proc objc_msgSendSuper*(super: var ObjcSuper; op: SEL): ID {.cdecl, importc, varargs.}
proc objc_msgSendSuper_stret*(super: var ObjcSuper; op: SEL) {.cdecl, importc, varargs.}
proc method_invoke*(receiver: ID; m: Method): ID {.cdecl, importc, varargs.}
proc method_invoke_stret*(receiver: ID; m: Method) {.cdecl, importc, varargs.}

proc sel_getName*(sel: SEL): cstring {.cdecl, importc.}
template getName*(sel: SEL): untyped =
  $sel_getName(sel)

proc `$`*(sel: SEL): string =
  getName(sel)

proc sel_registerName*(str: cstring): SEL {.cdecl, importc.}
template registerName*(str: string): untyped =
  sel_registerName(str.cstring)

proc `$$`*(str: string): SEL =
  sel_registerName(str.cstring)

proc sel_getUid(str: cstring): SEL {.cdecl, importc.}
template getUid*(str: string): untyped =
  sel_getUid(str.cstring)

proc sel_isEqual(lhs: SEL; rhs: SEL): bool {.cdecl, importc.}
template isEqual*(lhs, rhs: SEL): untyped =
  sel_isEqual(lhs, rhs)

proc method_getName(m: Method): SEL {.cdecl, importc.}
template getName*(m: Method): untyped =
  $method_getName(m)

proc `$`*(m: Method): string =
  getName(m)

proc method_getImplementation(m: Method): IMP {.cdecl, importc.}
template getImplementation*(m: Method): untyped =
  method_getImplementation(m)

proc method_getTypeEncoding(m: Method): cstring {.cdecl, importc.}
template getTypeEncoding*(m: Method): untyped =
  $method_getTypeEncoding(m)

proc method_copyReturnType(m: Method): cstring {.cdecl, importc.}
proc copyReturnType*(m: Method): string =
  var ret = method_copyReturnType(m)
  result = $ret
  c_free(ret)

proc method_copyArgumentType(m: Method; index: cuint): cstring {.cdecl, importc.}
proc copyArgumentType*(m: Method; index: int): string =
  var ret = method_copyArgumentType(m, index.cuint)
  result = $ret
  c_free(ret)

proc method_getReturnType(m: Method; dst: cstring; dst_len: csize_t) {.cdecl, importc.}
proc getReturnType*(m: Method): string =
  var ret: array[100, char]
  method_getReturnType(m, cast[cstring](ret[0].addr), sizeof(ret).csize_t)
  result = $(cast[cstring](ret[0].addr))

proc method_getNumberOfArguments(m: Method): cuint {.cdecl, importc.}
template getNumberOfArguments*(m: Method): untyped =
  method_getNumberOfArguments(m).int

proc method_getArgumentType(m: Method; index: cuint; dst: cstring; dst_len: csize_t) {.cdecl, importc.}
proc getArgumentType*(m: Method; index: int): string =
  var ret: array[100, char]
  method_getArgumentType(m, index.cuint, cast[cstring](ret[0].addr), sizeof(ret).csize_t)
  result = $(cast[cstring](ret[0].addr))

proc argumentTypes*(m: Method): seq[string] =
  let count = getNumberOfArguments(m)
  result = newSeq[string](count)
  if count == 0:
    result = @[]
    return result
  for i in 0 ..< count:
    result[i] = getArgumentType(m, i)

proc method_getDescription(m: Method): ptr objc_method_description {.cdecl, importc.}
proc getDescription*(m: Method): MethodDescription =
  var p = method_getDescription(m)
  result.name = p.name
  result.types = $p.types

proc method_setImplementation(m: Method; imp: IMP): IMP {.cdecl, importc.}
template setImplementation*(m: Method; imp: IMP): untyped =
  method_setImplementation(m, imp)

proc method_exchangeImplementations(m1: Method; m2: Method) {.cdecl, importc.}
template exchangeImplementations*(m1: Method; m2: Method) =
  method_exchangeImplementations(m1, m2)

proc objc_copyImageNames(outCount: var cuint): cstringArray {.cdecl, importc.}
proc imageNames*(): seq[string] =
  var
    count = 0.cuint
    images = objc_copyImageNames(count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[string](count.int)
  for i in 0 ..< result.len:
    result[i] = $images[i]

proc class_getImageName(cls: ObjcClass): cstring {.cdecl, importc.}
template getImageName*(cls: ObjcClass): untyped =
  $class_getImageName(cls)

proc objc_copyClassNamesForImage(image: cstring; outCount: var cuint): cstringArray {.cdecl, importc.}
proc classNamesForImage*(image: string): seq[string] =
  var
    count = 0.cuint
    classes = objc_copyClassNamesForImage(image.cstring, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[string](count.int)
  for i in 0 ..< result.len:
    result[i] = $classes[i]

proc objc_getProtocol(name: cstring): Protocol {.cdecl, importc.}
template getProtocol*(name: string): untyped =
  objc_getProtocol(name.cstring)

proc objc_copyProtocolList(outCount: var cuint): ptr Protocol {.cdecl, importc.}
proc protocolList*(): seq[Protocol] =
  var
    count = 0.cuint
    prots = objc_copyProtocolList(count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Protocol](count.int)
  copyMem(result[0].addr, prots, result.len * sizeof(Protocol))
  c_free(prots)

proc objc_allocateProtocol(name: cstring): Protocol {.cdecl, importc.}
template allocateProtocol*(name: string): untyped =
  objc_allocateProtocol(name.cstring)

proc objc_registerProtocol*(proto: Protocol) {.cdecl, importc.}
template registerProtocol*(proto: Protocol) =
  objc_registerProtocol(proto)

proc protocol_addMethodDescription(proto: Protocol; name: SEL; types: cstring;
                                   isRequiredMethod, isInstanceMethod: bool) {.cdecl, importc.}

template addMethodDescription*(proto: Protocol; name: SEL; types: string;
                                   isRequiredMethod, isInstanceMethod: bool) =
  protocol_addMethodDescription(proto, name, types.cstring, isRequiredMethod, isInstanceMethod)

proc protocol_addProtocol(proto, addition: Protocol) {.cdecl, importc.}
template addProtocol*(proto, addition: Protocol) =
  protocol_addProtocol(proto, addition)

proc protocol_addProperty(proto: Protocol; name: cstring;
                          attributes: ptr objc_property_attribute_t;
                          attributeCount: cuint; isRequiredProperty: bool;
                          isInstanceProperty: bool) {.cdecl, importc.}

proc addProperty*(proto: Protocol; name: string; attributes: openArray[objc_property_attribute_t],
                          isRequiredProperty, isInstanceProperty: bool) =
  protocol_addProperty(proto, name, attributes[0].unsafeAddr, attributes.len.cuint,
    isRequiredProperty, isInstanceProperty)

proc protocol_getName(p: Protocol): cstring {.cdecl, importc.}
template getName*(p: Protocol): untyped =
  $protocol_getName(p)

proc `$`*(p: Protocol): string =
  getName(p)

proc protocol_isEqual(proto, other: Protocol): bool {.cdecl, importc.}
template isEqual*(proto, other: Protocol): untyped =
  protocol_isEqual(proto, other)

proc protocol_copyMethodDescriptionList(p: Protocol; isRequiredMethod, isInstanceMethod: bool;
  outCount: var cuint): ptr objc_method_description {.cdecl, importc.}

proc methodDescriptionList*(p: Protocol; isRequiredMethod, isInstanceMethod: bool): seq[MethodDescription] =
  type
    DescT = array[0..0, objc_method_description]
  var
    count = 0.cuint
    raw = protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, count)
    descs = cast[DescT](raw)
  if count == 0:
    result = @[]
    return result
  result = newSeq[MethodDescription](count.int)
  for i in 0 ..< count.int:
    result[i] = MethodDescription(name: descs[i].name, types: $descs[i].types)
  c_free(raw)

proc protocol_getMethodDescription(p: Protocol; aSel: SEL;
  isRequiredMethod, isInstanceMethod: bool): objc_method_description {.cdecl, importc.}

template getMethodDescription*(p: Protocol; aSel: SEL; isRequiredMethod, isInstanceMethod: bool): untyped =
  protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod)

proc protocol_copyPropertyList(proto: Protocol; outCount: var cuint): ptr Property {.cdecl, importc.}
proc propertyList*(proto: Protocol): seq[Property] =
  var
    count = 0.cuint
    props = protocol_copyPropertyList(proto, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Property](count.int)
  copyMem(result[0].addr, props, result.len * sizeof(Property))
  c_free(props)

proc protocol_getProperty(proto: Protocol; name: cstring; isRequiredProperty, isInstanceProperty: bool): Property {.cdecl, importc.}
template getProperty*(proto: Protocol; name: string; isRequiredProperty, isInstanceProperty: bool): untyped =
  protocol_getProperty(proto, name.cstring, isRequiredProperty, isInstanceProperty)

proc protocol_copyProtocolList*(proto: Protocol, outCount: var cuint): ptr Protocol {.cdecl, importc.}
proc protocolList*(proto: Protocol): seq[Protocol] =
  var
    count = 0.cuint
    prots = protocol_copyProtocolList(proto, count)
  if count == 0:
    result = @[]
    return result
  result = newSeq[Protocol](count.int)
  copyMem(result[0].addr, prots, result.len * sizeof(Protocol))
  c_free(prots)

proc protocol_conformsToProtocol(proto, other: Protocol): bool {.cdecl, importc.}
template conformsToProtocol*(proto, other: Protocol): untyped =
  protocol_conformsToProtocol(proto, other)

proc property_getName(property: Property): cstring {.cdecl, importc.}
template getName*(property: Property): untyped =
  $property_getName(property)

proc `$`*(property: Property): string =
  getName(property)

proc property_getAttributes(property: Property): cstring {.cdecl, importc.}
template getAttributes*(property: Property): untyped =
  $property_getAttributes(property)

proc property_copyAttributeList(property: Property; outCount: var cuint): ptr objc_property_attribute_t {.cdecl, importc.}
proc attributeList*(property: Property): seq[PropertyAttribute] =
  type AttrT = array[0..0, objc_property_attribute_t]
  var
    count = 0.cuint
    raw = property_copyAttributeList(property, count)
    attrs = cast[AttrT](raw)
  if count == 0:
    result = @[]
    return result
  result = newSeq[PropertyAttribute](count.int)
  for i in 0 ..< count.int:
    result[i] = PropertyAttribute(name: $attrs[i].name, value: $attrs[i].value)
  c_free(raw)

proc property_copyAttributeValue(property: Property; attributeName: cstring): cstring {.cdecl, importc.}
proc attributeValue*(property: Property; attributeName: string): string =
  var res = property_copyAttributeValue(property, attributeName.cstring)
  result = $res
  c_free(res)

proc objc_enumerationMutation(obj: ID) {.cdecl, importc.}
template enumerationMutation*(obj: ID) =
  objc_enumerationMutation(obj)

type
  EnumerationHandler = proc(a2: ID) {.cdecl.}

proc objc_setEnumerationMutationHandler(handler: EnumerationHandler) {.cdecl, importc.}
template setEnumerationMutationHandler*(handler: EnumerationHandler) =
  objc_setEnumerationMutationHandler(handler)

proc imp_implementationWithBlock(blok: ID): IMP {.cdecl, importc.}
template implementationWithBlock*(blok: ID): untyped =
  imp_implementationWithBlock(blok)

proc imp_getBlock(anImp: IMP): ID {.cdecl, importc.}
template getBlock*(anImp: IMP): untyped =
  imp_getBlock(anImp)

proc imp_removeBlock(anImp: IMP): bool {.cdecl, importc.}
template removeBlock*(anImp: IMP): untyped =
  imp_removeBlock(anImp)

proc objc_loadWeak(location: var ID): ID {.cdecl, importc.}
template loadWeak*(location: var ID): untyped =
  objc_loadWeak(location)

proc objc_storeWeak(location: var ID; obj: ID): ID {.cdecl, importc.}
template storeWeak*(location: var ID; obj: ID): untyped =
  objc_storeWeak(location, obj)

{.push stackTrace: off.}
# These procs should better be inlined, but there's a Nim bug #5945

proc objcClass*(name: static[string]): ObjcClass =
    var c {.global.} = objc_getClass(name)
    return c

proc objcClass*[T](t: typedesc[T]): ObjcClass {.inline.} = objcClass($T)

proc getSelector(name: static[string]): SEL =
    var s {.global.}: SEL
    if pointer(s).isNil:
        s = sel_registerName(name)
    return s

proc respondsToSelector*(obj: NSObject, selector: static[string]): bool =
    class_respondsToSelector(object_getClass(obj), sel_registerName(selector))

{.pop.}

proc getArgsAndTypes(routine: NimNode): (NimNode, NimNode) =
    let args = newNimNode(nnkStmtList)
    let types = newNimNode(nnkStmtList)
    let params = routine.params
    for a in 1 ..< params.len:
        let p = params[a]
        for i in 0 .. p.len - 3:
            args.add(p[i])
            types.add(p[^2])
    result = (args, types)

proc unpackPragmaParams(p1, p2: NimNode): (string, NimNode) =
    if p2.kind == nnkNilLit: ("", p1) else: ($p1, p2)

proc guessSelectorNameFromProc(p: NimNode): string =
    var pName = p.name
    if pName.kind == nnkPostfix:
        pName = pName[^1]
    result = $pName

type ObjCMsgSendFlavor = enum
    normal
    fpret
    stret

template msgSendFlavorForRetType(retType: typedesc): ObjCMsgSendFlavor =
    when (retType is float | float32 | float64 | cfloat | cdouble) and hostCPU == "i386":
        ObjCMsgSendFlavor.fpret
    elif (retType is object | tuple) and sizeof(retType) > sizeof(pointer) * 2: # TODO: sizeof check is a dangerous guess here! Please help.
        ObjCMsgSendFlavor.stret
    else:
        ObjCMsgSendFlavor.normal

macro objcAux(flavor: static[ObjCMsgSendFlavor], firstArg: typed, name: static[string], body: untyped): untyped =
    var name = name

    let performSend = ident"performSend"

    let senderParams = newNimNode(nnkFormalParams)
    if flavor == stret:
        senderParams.add(ident"void")
        senderParams.add(newIdentDefs(ident"_", ident"pointer"))
    else:
        senderParams.add(copyNimTree(body.params[0]))
    senderParams.add(newIdentDefs(ident"self", bindSym"NSObject"))
    senderParams.add(newIdentDefs(ident"selector", bindSym"SEL"))

    let procTy = newTree(nnkProcTy, senderParams)
    procTy.add(newTree(nnkPragma, ident"cdecl", ident"gcsafe"))

    let objcSendProc = case flavor
        of fpret: bindSym"objc_msgSend_fpret"
        of stret: bindSym"objc_msgSend_stret"
        else: bindSym"objc_msgSend"

    let sendProc = newTree(nnkCast, procTy, objcSendProc)

    let castSendProc = newTree(nnkLetSection, newIdentDefs(performSend, newEmptyNode(), sendProc))

    let call = newCall(performSend)

    let (args, argTypes) = body.getArgsAndTypes()

    if flavor == stret:
        call.add(newCall("addr", ident"result"))

    call.add(firstArg)

    if name.len == 0:
        name = guessSelectorNameFromProc(body)

    call.add(newCall(bindSym"getSelector", newLit(name))) # selector

    for i in 1 ..< args.len:
        senderParams.add(newIdentDefs(args[i], argTypes[i], newEmptyNode()))
        call.add(args[i])

    result = newStmtList(castSendProc, call)

macro objc*(name: untyped, body: untyped = nil): untyped =
    var (name, body) = unpackPragmaParams(name, body)
    var retType = body.params[0]
    if retType.kind == nnkEmpty: retType = ident"void"

    let (args, argTypes) = body.getArgsAndTypes()

    let firstArgTyp = argTypes[0]
    let isStatic = firstArgTyp.kind == nnkBracketExpr and firstArgTyp[0].kind == nnkIdent and $(firstArgTyp[0]) == "typedesc"
    let firstArg = if isStatic:
            newCall(ident"objcClass", args[0])
        else:
            args[0]

    result = copyNimTree(body)
    result.body = newCall(bindSym"objcAux",
        newCall(bindSym"msgSendFlavorForRetType", retType),
        firstArg,
        newLit(name), body)
    result.addPragma(ident"inline")

proc NSLog*(str: NSString) {.importc, varargs.}

proc retainAux(o: NSObject): NSObject {.objc: "retain".}
template retain*[T: NSObject](o: T): T = cast[T](retainAux(o))
proc release*(o: NSObject) {.objc.}
proc alloc*[T: NSObject](n: typedesc[T]): T {.objc: "alloc".}
proc initAux(v: NSObject): NSObject {.objc: "init".}
proc init*[T: NSObject](v: T): T {.inline.} = cast[T](initAux(v))

proc isKindOfClass(o: NSObject, c: ObjcClass): bool {.objc: "isKindOfClass:".}
proc isKindOfClass*(o: NSObject, c: typedesc): bool = o.isKindOfClass(c.objcClass())
proc encodeType*[T](t:typedesc[T]):string =
  # https://nshipster.com/type-encodings/
  when t is char:
    return "c"
  elif t is uint8:
    return "C"
  elif t is int:
    return "i"
  elif t is uint:
    return "I"
  elif t is cshort:
    return "s"
  elif t is cushort:
    return "S"
  elif t is int32:
    return "l"
  elif t is uint32:
    return "L"
  elif t is int64:
    return "q"
  elif t is uint64:
    return "Q"
  elif t is cfloat:
    return "f"
  elif t is cdouble:
    return "d"
  elif t is bool:
    return "B"
  elif t is cstring:
    return "*"
  elif t is ObjcClass:
    return "#"
  elif t is typedesc[NSObject]:
    return "#"
  elif t is NSObject:
    return "@"
  elif t is ID:
    return "@"
  elif t is SEL:
    return ":"
  elif t is void:
    return "v"

macro getProcEncode*(y: typed): untyped =
  y.expectKind {nnkSym, nnkCast}
  var x = if y.kind == nnkSym: y.getImpl() else: y[1].getImpl()
  var j = newCall(bindSym"join")
  let encode = bindSym"encodeType"
  var ab = nnkBracket.newTree()
  x.expectKind nnkProcDef
  for p in x.params:
    if p.kind == nnkIdentDefs:
      ab.add newCall(encode, newCall(ident"type", p[1]))
    elif p.kind == nnkEmpty:
      ab.add newCall(encode, ident"void")
    elif p.kind == nnkSym:
      ab.add newCall(encode, newCall(ident"type", p))
  j.add ab
  result = nnkStaticExpr.newTree(j)

template addMethod*[T](cls: ObjcClass; name: SEL; imp: T): bool =
  class_addMethod(cls, name, cast[IMP](imp), getProcEncode(imp))

template replaceMethod*[T](cls: ObjcClass; name: SEL; imp: T): IMP =
  class_replaceMethod(cls, name, cast[IMP](imp), getProcEncode(imp))
