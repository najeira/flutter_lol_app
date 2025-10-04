//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/binding_full_type_identifier.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_field_help.g.dart';

/// Describes a member of a struct.
///
/// Properties:
/// * [description] 
/// * [name] 
/// * [offset] 
/// * [optional] 
/// * [type] 
@BuiltValue()
abstract class BindingFullFieldHelp implements Built<BindingFullFieldHelp, BindingFullFieldHelpBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'offset')
  int? get offset;

  @BuiltValueField(wireName: r'optional')
  bool? get optional;

  @BuiltValueField(wireName: r'type')
  BindingFullTypeIdentifier? get type;

  BindingFullFieldHelp._();

  factory BindingFullFieldHelp([void updates(BindingFullFieldHelpBuilder b)]) = _$BindingFullFieldHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullFieldHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullFieldHelp> get serializer => _$BindingFullFieldHelpSerializer();
}

class _$BindingFullFieldHelpSerializer implements PrimitiveSerializer<BindingFullFieldHelp> {
  @override
  final Iterable<Type> types = const [BindingFullFieldHelp, _$BindingFullFieldHelp];

  @override
  final String wireName = r'BindingFullFieldHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullFieldHelp object, {
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
    if (object.offset != null) {
      yield r'offset';
      yield serializers.serialize(
        object.offset,
        specifiedType: const FullType(int),
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
    BindingFullFieldHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullFieldHelpBuilder result,
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
        case r'offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.offset = valueDes;
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
  BindingFullFieldHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullFieldHelpBuilder();
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

