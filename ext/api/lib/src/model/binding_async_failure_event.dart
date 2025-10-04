//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_async_failure_event.g.dart';

/// Represents a failed asynchronous operation.
///
/// Properties:
/// * [asyncToken] - Asynchronous operation token
/// * [error] - Error message
@BuiltValue()
abstract class BindingAsyncFailureEvent implements Built<BindingAsyncFailureEvent, BindingAsyncFailureEventBuilder> {
  /// Asynchronous operation token
  @BuiltValueField(wireName: r'asyncToken')
  int? get asyncToken;

  /// Error message
  @BuiltValueField(wireName: r'error')
  String? get error;

  BindingAsyncFailureEvent._();

  factory BindingAsyncFailureEvent([void updates(BindingAsyncFailureEventBuilder b)]) = _$BindingAsyncFailureEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingAsyncFailureEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingAsyncFailureEvent> get serializer => _$BindingAsyncFailureEventSerializer();
}

class _$BindingAsyncFailureEventSerializer implements PrimitiveSerializer<BindingAsyncFailureEvent> {
  @override
  final Iterable<Type> types = const [BindingAsyncFailureEvent, _$BindingAsyncFailureEvent];

  @override
  final String wireName = r'BindingAsyncFailureEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingAsyncFailureEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.asyncToken != null) {
      yield r'asyncToken';
      yield serializers.serialize(
        object.asyncToken,
        specifiedType: const FullType(int),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingAsyncFailureEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingAsyncFailureEventBuilder result,
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
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.error = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingAsyncFailureEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingAsyncFailureEventBuilder();
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

