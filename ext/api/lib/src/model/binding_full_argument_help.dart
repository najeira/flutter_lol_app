//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/binding_full_type_identifier.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_argument_help.g.dart';

/// Describes a function parameter.
///
/// Properties:
/// * [description] 
/// * [name] 
/// * [optional] 
/// * [type] 
@BuiltValue()
abstract class BindingFullArgumentHelp implements Built<BindingFullArgumentHelp, BindingFullArgumentHelpBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'optional')
  bool? get optional;

  @BuiltValueField(wireName: r'type')
  BindingFullTypeIdentifier? get type;

  BindingFullArgumentHelp._();

  factory BindingFullArgumentHelp([void updates(BindingFullArgumentHelpBuilder b)]) = _$BindingFullArgumentHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullArgumentHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullArgumentHelp> get serializer => _$BindingFullArgumentHelpSerializer();
}

class _$BindingFullArgumentHelpSerializer implements PrimitiveSerializer<BindingFullArgumentHelp> {
  @override
  final Iterable<Type> types = const [BindingFullArgumentHelp, _$BindingFullArgumentHelp];

  @override
  final String wireName = r'BindingFullArgumentHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullArgumentHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
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
    if (object.optional != null) {
      yield r'optional';
      yield serializers.serialize(
        object.optional,
        specifiedType: const FullType(bool),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(BindingFullTypeIdentifier),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullArgumentHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullArgumentHelpBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'optional':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.optional = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BindingFullTypeIdentifier),
          ) as BindingFullTypeIdentifier;
          result.type.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullArgumentHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullArgumentHelpBuilder();
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

