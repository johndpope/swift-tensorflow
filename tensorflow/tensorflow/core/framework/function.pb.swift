/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: tensorflow/core/framework/function.proto
 *
 */

import Foundation
import SwiftProtobuf


///   A library is a set of named functions.
struct Tensorflow_FunctionDefLibrary: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Tensorflow_FunctionDefLibrary"}
  public var protoMessageName: String {return "FunctionDefLibrary"}
  public var protoPackageName: String {return "tensorflow"}
  public var jsonFieldNames: [String: Int] {return [
    "function": 1,
    "gradient": 2,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "function": 1,
    "gradient": 2,
  ]}

  public var function: [Tensorflow_FunctionDef] = []

  public var gradient: [Tensorflow_GradientDef] = []

  public init() {}

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    let handled: Bool
    switch protoFieldNumber {
    case 1: handled = try setter.decodeRepeatedMessageField(fieldType: Tensorflow_FunctionDef.self, value: &function)
    case 2: handled = try setter.decodeRepeatedMessageField(fieldType: Tensorflow_GradientDef.self, value: &gradient)
    default:
      handled = false
    }
    return handled
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    if !function.isEmpty {
      try visitor.visitRepeatedMessageField(value: function, protoFieldNumber: 1, protoFieldName: "function", jsonFieldName: "function", swiftFieldName: "function")
    }
    if !gradient.isEmpty {
      try visitor.visitRepeatedMessageField(value: gradient, protoFieldNumber: 2, protoFieldName: "gradient", jsonFieldName: "gradient", swiftFieldName: "gradient")
    }
  }

  public func _protoc_generated_isEqualTo(other: Tensorflow_FunctionDefLibrary) -> Bool {
    if function != other.function {return false}
    if gradient != other.gradient {return false}
    return true
  }
}

///   A function can be instantiated when the runtime can bind every attr
///   with a value. When a GraphDef has a call to a function, it must
///   have binding for every attr defined in the signature.
///  
///   TODO(zhifengc):
///     * device spec, etc.
struct Tensorflow_FunctionDef: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Tensorflow_FunctionDef"}
  public var protoMessageName: String {return "FunctionDef"}
  public var protoPackageName: String {return "tensorflow"}
  public var jsonFieldNames: [String: Int] {return [
    "signature": 1,
    "node": 2,
    "nodeDef": 3,
    "ret": 4,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "signature": 1,
    "node": 2,
    "node_def": 3,
    "ret": 4,
  ]}

  private class _StorageClass {
    typealias ProtobufExtendedMessage = Tensorflow_FunctionDef
    var _signature: Tensorflow_OpDef? = nil
    var _node: [Tensorflow_FunctionDef.Node] = []
    var _nodeDef: [Tensorflow_NodeDef] = []
    var _ret: Dictionary<String,String> = [:]

    init() {}

    func decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
      let handled: Bool
      switch protoFieldNumber {
      case 1: handled = try setter.decodeSingularMessageField(fieldType: Tensorflow_OpDef.self, value: &_signature)
      case 2: handled = try setter.decodeRepeatedMessageField(fieldType: Tensorflow_FunctionDef.Node.self, value: &_node)
      case 3: handled = try setter.decodeRepeatedMessageField(fieldType: Tensorflow_NodeDef.self, value: &_nodeDef)
      case 4: handled = try setter.decodeMapField(fieldType: ProtobufMap<ProtobufString,ProtobufString>.self, value: &_ret)
      default:
        handled = false
      }
      return handled
    }

    func traverse(visitor: inout ProtobufVisitor) throws {
      if let v = _signature {
        try visitor.visitSingularMessageField(value: v, protoFieldNumber: 1, protoFieldName: "signature", jsonFieldName: "signature", swiftFieldName: "signature")
      }
      if !_node.isEmpty {
        try visitor.visitRepeatedMessageField(value: _node, protoFieldNumber: 2, protoFieldName: "node", jsonFieldName: "node", swiftFieldName: "node")
      }
      if !_nodeDef.isEmpty {
        try visitor.visitRepeatedMessageField(value: _nodeDef, protoFieldNumber: 3, protoFieldName: "node_def", jsonFieldName: "nodeDef", swiftFieldName: "nodeDef")
      }
      if !_ret.isEmpty {
        try visitor.visitMapField(fieldType: ProtobufMap<ProtobufString,ProtobufString>.self, value: _ret, protoFieldNumber: 4, protoFieldName: "ret", jsonFieldName: "ret", swiftFieldName: "ret")
      }
    }

    func isEqualTo(other: _StorageClass) -> Bool {
      if _signature != other._signature {return false}
      if _node != other._node {return false}
      if _nodeDef != other._nodeDef {return false}
      if _ret != other._ret {return false}
      return true
    }

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._signature = _signature
      clone._node = _node
      clone._nodeDef = _nodeDef
      clone._ret = _ret
      return clone
    }
  }

  private var _storage = _StorageClass()

  ///   A node is a multi-value assignment:
  ///     (ret[0], ret[1], ...) = func(arg[0], arg[1], ...)
  ///  
  ///   By convention, "func" is resolved by consulting with a user-defined
  ///   library first. If not resolved, "func" is assumed to be a builtin op.
  struct Node: ProtobufGeneratedMessage {
    public var swiftClassName: String {return "Tensorflow_FunctionDef.Node"}
    public var protoMessageName: String {return "Node"}
    public var protoPackageName: String {return "tensorflow"}
    public var jsonFieldNames: [String: Int] {return [
      "ret": 1,
      "op": 2,
      "arg": 3,
      "dep": 4,
      "attr": 5,
    ]}
    public var protoFieldNames: [String: Int] {return [
      "ret": 1,
      "op": 2,
      "arg": 3,
      "dep": 4,
      "attr": 5,
    ]}

    ///   This node produces multiple outputs. They are named ret[0],
    ///   ret[1], ..., etc.
    ///  
    ///   REQUIRES: function.node.ret[*] are unique across all nodes.
    ///   REQUIRES: ret.size == func/op def's number of output args.
    public var ret: [String] = []

    ///   The op/function name.
    public var op: String = ""

    ///   Arguments passed to this func/op.
    ///  
    ///   arg[i] must be either one of
    ///   function.signature.input_args[*].name or one of
    ///   function.node[*].ret[*].
    ///  
    ///   REQUIRES: arg.size == func/op def's number of input args.
    public var arg: [String] = []

    ///   Control dependencies.
    ///  
    ///   dep[i] must be one of function.node[*].ret[*] or one of
    ///   function.signature.input_args[*].name.
    public var dep: [String] = []

    ///   Attrs.
    ///  
    ///   'attr' maps names defined by 'func's attr defs to attr values.
    ///   attr values may have placeholders which are substituted
    ///   recursively by concrete values when this node is instantiated.
    ///   These placeholders must name an attr listed in the FunctionDef's
    ///   signature.
    public var attr: Dictionary<String,Tensorflow_AttrValue> = [:]

    public init() {}

    public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
      let handled: Bool
      switch protoFieldNumber {
      case 1: handled = try setter.decodeRepeatedField(fieldType: ProtobufString.self, value: &ret)
      case 2: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &op)
      case 3: handled = try setter.decodeRepeatedField(fieldType: ProtobufString.self, value: &arg)
      case 4: handled = try setter.decodeRepeatedField(fieldType: ProtobufString.self, value: &dep)
      case 5: handled = try setter.decodeMapField(fieldType: ProtobufMap<ProtobufString,Tensorflow_AttrValue>.self, value: &attr)
      default:
        handled = false
      }
      return handled
    }

    public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
      if !ret.isEmpty {
        try visitor.visitRepeatedField(fieldType: ProtobufString.self, value: ret, protoFieldNumber: 1, protoFieldName: "ret", jsonFieldName: "ret", swiftFieldName: "ret")
      }
      if op != "" {
        try visitor.visitSingularField(fieldType: ProtobufString.self, value: op, protoFieldNumber: 2, protoFieldName: "op", jsonFieldName: "op", swiftFieldName: "op")
      }
      if !arg.isEmpty {
        try visitor.visitRepeatedField(fieldType: ProtobufString.self, value: arg, protoFieldNumber: 3, protoFieldName: "arg", jsonFieldName: "arg", swiftFieldName: "arg")
      }
      if !dep.isEmpty {
        try visitor.visitRepeatedField(fieldType: ProtobufString.self, value: dep, protoFieldNumber: 4, protoFieldName: "dep", jsonFieldName: "dep", swiftFieldName: "dep")
      }
      if !attr.isEmpty {
        try visitor.visitMapField(fieldType: ProtobufMap<ProtobufString,Tensorflow_AttrValue>.self, value: attr, protoFieldNumber: 5, protoFieldName: "attr", jsonFieldName: "attr", swiftFieldName: "attr")
      }
    }

    public func _protoc_generated_isEqualTo(other: Tensorflow_FunctionDef.Node) -> Bool {
      if ret != other.ret {return false}
      if op != other.op {return false}
      if arg != other.arg {return false}
      if dep != other.dep {return false}
      if attr != other.attr {return false}
      return true
    }
  }

  ///   The definition of the function's name, arguments, return values,
  ///   attrs etc.
  public var signature: Tensorflow_OpDef {
    get {return _storage._signature ?? Tensorflow_OpDef()}
    set {_uniqueStorage()._signature = newValue}
  }
  public var hasSignature: Bool {
    return _storage._signature != nil
  }
  public mutating func clearSignature() {
    return _storage._signature = nil
  }

  //  TO BE REPLACED

  ///   The body of the function.
  public var node: [Tensorflow_FunctionDef.Node] {
    get {return _storage._node}
    set {_uniqueStorage()._node = newValue}
  }

  //  WILL REPLACE THE ABOVE

  //  If node_def is present, and the consumer is at GraphDef version
  //  >= 12, then these fields are used and `node` is ignored.  If the
  //  consumer's GraphDef version is < 12 or this field is empty, then
  //  `node` is used.  This allows producers to fill both fields to
  //  remain compatible with old consumers.  At some future GraphDef
  //  version, `node` will be ignored even if `node_def` is empty.
  //  TODO(josh11b): Finish this transition.

  //  In both of the following fields, there is the need to specify an
  //  output that is used as either the input to another node (in
  //  `node_def`) or as a return value of the function (in `ret`).
  //  Unlike the NodeDefs in GraphDef, we need to be able to specify a
  //  list in some cases (instead of just single outputs).  Also, we
  //  need to be able to deal with lists of unknown length (so the
  //  output index may not be known at function definition time).  So
  //  we use the following format instead:
  //  * "fun_in" where "fun_in" is the name of a function input arg in
  //    the `signature` field above.  This represents that input, whether
  //    it is a single tensor or a list.
  //  * "fun_in:0" gives the first element of a function input arg (a
  //    non-list input is considered a list of length 1 for these
  //    purposes).
  //  * "node:out" where "node" is the name of a node in `node_def` and
  //    "out" is the name one of its op's output arguments (the name
  //    comes from the OpDef of the node's op). This represents that
  //    node's output, whether it is a single tensor or a list.
  //    Note: We enforce that an op's output arguments are never
  //    renamed in the backwards-compatibility test.
  //  * "node:out:0" gives the first element of a node output arg (a
  //    non-list output is considered a list of length 1 for these
  //    purposes).
  // 
  //  NOT CURRENTLY SUPPORTED (but may be in the future):
  //  * "node:out:-1" gives last element in a node output list
  //  * "node:out:1:" gives a list with all but the first element in a
  //    node output list
  //  * "node:out::-1" gives a list with all but the last element in a
  //    node output list

  ///   The body of the function.  Unlike the NodeDefs in a GraphDef, attrs
  ///   may have values of type `placeholder` and the `input` field uses
  ///   the "output" format above.
  public var nodeDef: [Tensorflow_NodeDef] {
    get {return _storage._nodeDef}
    set {_uniqueStorage()._nodeDef = newValue}
  }

  ///   A mapping from the output arg names from `signature` to the
  ///   outputs from `node_def` that should be returned by the function.
  public var ret: Dictionary<String,String> {
    get {return _storage._ret}
    set {_uniqueStorage()._ret = newValue}
  }

  public init() {}

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    return try _uniqueStorage().decodeField(setter: &setter, protoFieldNumber: protoFieldNumber)
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    try _storage.traverse(visitor: &visitor)
  }

  public func _protoc_generated_isEqualTo(other: Tensorflow_FunctionDef) -> Bool {
    return _storage === other._storage || _storage.isEqualTo(other: other._storage)
  }

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }
}

///   GradientDef defines the gradient function of a function defined in
///   a function library.
///  
///   A gradient function g (specified by gradient_func) for a function f
///   (specified by function_name) must follow the following:
///  
///   The function 'f' must be a numerical function which takes N inputs
///   and produces M outputs. Its gradient function 'g', which is a
///   function taking N + M inputs and produces N outputs.
///  
///   I.e. if we have
///      (y1, y2, ..., y_M) = f(x1, x2, ..., x_N),
///   then, g is
///      (dL/dx1, dL/dx2, ..., dL/dx_N) = g(x1, x2, ..., x_N,
///                                        dL/dy1, dL/dy2, ..., dL/dy_M),
///   where L is a scalar-value function of (x1, x2, ..., xN) (e.g., the
///   loss function). dL/dx_i is the partial derivative of L with respect
///   to x_i.
struct Tensorflow_GradientDef: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Tensorflow_GradientDef"}
  public var protoMessageName: String {return "GradientDef"}
  public var protoPackageName: String {return "tensorflow"}
  public var jsonFieldNames: [String: Int] {return [
    "functionName": 1,
    "gradientFunc": 2,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "function_name": 1,
    "gradient_func": 2,
  ]}

  ///   The function name.
  public var functionName: String = ""

  ///   The gradient function's name.
  public var gradientFunc: String = ""

  public init() {}

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    let handled: Bool
    switch protoFieldNumber {
    case 1: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &functionName)
    case 2: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &gradientFunc)
    default:
      handled = false
    }
    return handled
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    if functionName != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: functionName, protoFieldNumber: 1, protoFieldName: "function_name", jsonFieldName: "functionName", swiftFieldName: "functionName")
    }
    if gradientFunc != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: gradientFunc, protoFieldNumber: 2, protoFieldName: "gradient_func", jsonFieldName: "gradientFunc", swiftFieldName: "gradientFunc")
    }
  }

  public func _protoc_generated_isEqualTo(other: Tensorflow_GradientDef) -> Bool {
    if functionName != other.functionName {return false}
    if gradientFunc != other.gradientFunc {return false}
    return true
  }
}
