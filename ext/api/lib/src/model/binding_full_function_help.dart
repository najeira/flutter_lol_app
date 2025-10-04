//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/binding_full_argument_help.dart';
import 'package:openapi/src/model/binding_full_type_identifier.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_function_help.g.dart';

/// Describes a function.
///
/// Properties:
/// * [arguments] 
/// * [async_] 
/// * [description] 
/// * [help] 
/// * [name] 
/// * [nameSpace] 
/// * [returns] 
/// * [tags] 
/// * [threadSafe] 
@BuiltValue()
abstract class BindingFullFunctionHelp implements Built<BindingFullFunctionHelp, BindingFullFunctionHelpBuilder> {
  @BuiltValueField(wireName: r'arguments')
  BuiltList<BindingFullArgumentHelp>? get arguments;

  @BuiltValueField(wireName: r'async')
  String? get async_;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'help')
  String? get help;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'nameSpace')
  String? get nameSpace;

  @BuiltValueField(wireName: r'returns')
  BindingFullTypeIdentifier? get returns;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  @BuiltValueField(wireName: r'threadSafe')
  bool? get threadSafe;

  BindingFullFunctionHelp._();

  factory BindingFullFunctionHelp([void updates(BindingFullFunctionHelpBuilder b)]) = _$BindingFullFunctionHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullFunctionHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullFunctionHelp> get serializer => _$BindingFullFunctionHelpSerializer();
}

class _$BindingFullFunctionHelpSerializer implements PrimitiveSerializer<BindingFullFunctionHelp> {
  @override
  final Iterable<Type> types = const [BindingFullFunctionHelp, _$BindingFullFunctionHelp];

  @override
  final String wireName = r'BindingFullFunctionHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullFunctionHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.arguments != null) {
      yield r'arguments';
      yield serializers.serialize(
        object.arguments,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullArgumentHelp)]),
      );
    }
    if (object.async_ != null) {
      yield r'async';
      yield serializers.serialize(
        object.async_,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.help != null) {
      yield r'help';
      yield serializers.serialize(
        object.help,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.nameSpace != null) {
      yield r'nameSpace';
      yield serializers.serialize(
        object.nameSpace,
        specifiedType: const FullType(String),
      );
    }
    if (object.returns != null) {
      yield r'returns';
      yield serializers.serialize(
        object.returns,
        specifiedType: const FullType(BindingFullTypeIdentifier),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.threadSafe != null) {
      yield r'threadSafe';
      yield serializers.serialize(
        object.threadSafe,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullFunctionHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullFunctionHelpBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'arguments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullArgumentHelp)]),
          ) as BuiltList<BindingFullArgumentHelp>;
          result.arguments.replace(valueDes);
          break;
        case r'async':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.async_ = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'help':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.help = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'nameSpace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameSpace = valueDes;
          break;
        case r'returns':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BindingFullTypeIdentifier),
          ) as BindingFullTypeIdentifier;
          result.returns.replace(valueDes);
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        case r'threadSafe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.threadSafe = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullFunctionHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullFunctionHelpBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

