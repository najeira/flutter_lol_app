//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_callback_event.g.dart';

/// Represents the parameters of a call to a provided callback.
///
/// Properties:
/// * [id] - ID of the callback being invoked
/// * [parameters] - Callback parameters
@BuiltValue()
abstract class BindingCallbackEvent implements Built<BindingCallbackEvent, BindingCallbackEventBuilder> {
  /// ID of the callback being invoked
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Callback parameters
  @BuiltValueField(wireName: r'parameters')
  BuiltList<BuiltMap<String, JsonObject?>>? get parameters;

  BindingCallbackEvent._();

  factory BindingCallbackEvent([void updates(BindingCallbackEventBuilder b)]) = _$BindingCallbackEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingCallbackEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingCallbackEvent> get serializer => _$BindingCallbackEventSerializer();
}

class _$BindingCallbackEventSerializer implements PrimitiveSerializer<BindingCallbackEvent> {
  @override
  final Iterable<Type> types = const [BindingCallbackEvent, _$BindingCallbackEvent];

  @override
  final String wireName = r'BindingCallbackEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingCallbackEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.parameters != null) {
      yield r'parameters';
      yield serializers.serialize(
        object.parameters,
        specifiedType: const FullType(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingCallbackEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingCallbackEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'parameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])]),
          ) as BuiltList<BuiltMap<String, JsonObject?>>;
          result.parameters.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingCallbackEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingCallbackEventBuilder();
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

