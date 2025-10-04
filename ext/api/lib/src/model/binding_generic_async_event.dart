//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_generic_async_event.g.dart';

/// Represents generic data for an asynchronous event.
///
/// Properties:
/// * [asyncToken] - Asynchronous operation token
/// * [data] - Event data
@BuiltValue()
abstract class BindingGenericAsyncEvent implements Built<BindingGenericAsyncEvent, BindingGenericAsyncEventBuilder> {
  /// Asynchronous operation token
  @BuiltValueField(wireName: r'asyncToken')
  int? get asyncToken;

  /// Event data
  @BuiltValueField(wireName: r'data')
  BuiltMap<String, JsonObject?>? get data;

  BindingGenericAsyncEvent._();

  factory BindingGenericAsyncEvent([void updates(BindingGenericAsyncEventBuilder b)]) = _$BindingGenericAsyncEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingGenericAsyncEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingGenericAsyncEvent> get serializer => _$BindingGenericAsyncEventSerializer();
}

class _$BindingGenericAsyncEventSerializer implements PrimitiveSerializer<BindingGenericAsyncEvent> {
  @override
  final Iterable<Type> types = const [BindingGenericAsyncEvent, _$BindingGenericAsyncEvent];

  @override
  final String wireName = r'BindingGenericAsyncEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingGenericAsyncEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.asyncToken != null) {
      yield r'asyncToken';
      yield serializers.serialize(
        object.asyncToken,
        specifiedType: const FullType(int),
      );
    }
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
    BindingGenericAsyncEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingGenericAsyncEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asyncToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.asyncToken = valueDes;
          break;
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
  BindingGenericAsyncEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingGenericAsyncEventBuilder();
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

