//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_type_identifier.g.dart';

/// Describes the type of a value.
///
/// Properties:
/// * [elementType] 
/// * [type] 
@BuiltValue()
abstract class BindingFullTypeIdentifier implements Built<BindingFullTypeIdentifier, BindingFullTypeIdentifierBuilder> {
  @BuiltValueField(wireName: r'elementType')
  String? get elementType;

  @BuiltValueField(wireName: r'type')
  String? get type;

  BindingFullTypeIdentifier._();

  factory BindingFullTypeIdentifier([void updates(BindingFullTypeIdentifierBuilder b)]) = _$BindingFullTypeIdentifier;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullTypeIdentifierBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullTypeIdentifier> get serializer => _$BindingFullTypeIdentifierSerializer();
}

class _$BindingFullTypeIdentifierSerializer implements PrimitiveSerializer<BindingFullTypeIdentifier> {
  @override
  final Iterable<Type> types = const [BindingFullTypeIdentifier, _$BindingFullTypeIdentifier];

  @override
  final String wireName = r'BindingFullTypeIdentifier';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullTypeIdentifier object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.elementType != null) {
      yield r'elementType';
      yield serializers.serialize(
        object.elementType,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullTypeIdentifier object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullTypeIdentifierBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'elementType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.elementType = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullTypeIdentifier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullTypeIdentifierBuilder();
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

