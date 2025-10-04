//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_generic_event.g.dart';

/// Represents generic data for an event.
///
/// Properties:
/// * [data] - Event data
@BuiltValue()
abstract class BindingGenericEvent implements Built<BindingGenericEvent, BindingGenericEventBuilder> {
  /// Event data
  @BuiltValueField(wireName: r'data')
  BuiltMap<String, JsonObject?>? get data;

  BindingGenericEvent._();

  factory BindingGenericEvent([void updates(BindingGenericEventBuilder b)]) = _$BindingGenericEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingGenericEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingGenericEvent> get serializer => _$BindingGenericEventSerializer();
}

class _$BindingGenericEventSerializer implements PrimitiveSerializer<BindingGenericEvent> {
  @override
  final Iterable<Type> types = const [BindingGenericEvent, _$BindingGenericEvent];

  @override
  final String wireName = r'BindingGenericEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingGenericEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingGenericEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingGenericEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingGenericEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingGenericEventBuilder();
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

