//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_async_cancel_event.g.dart';

/// Represents a cancelled asynchronous operation.
///
/// Properties:
/// * [asyncToken] - Asynchronous operation token
@BuiltValue()
abstract class BindingAsyncCancelEvent implements Built<BindingAsyncCancelEvent, BindingAsyncCancelEventBuilder> {
  /// Asynchronous operation token
  @BuiltValueField(wireName: r'asyncToken')
  int? get asyncToken;

  BindingAsyncCancelEvent._();

  factory BindingAsyncCancelEvent([void updates(BindingAsyncCancelEventBuilder b)]) = _$BindingAsyncCancelEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingAsyncCancelEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingAsyncCancelEvent> get serializer => _$BindingAsyncCancelEventSerializer();
}

class _$BindingAsyncCancelEventSerializer implements PrimitiveSerializer<BindingAsyncCancelEvent> {
  @override
  final Iterable<Type> types = const [BindingAsyncCancelEvent, _$BindingAsyncCancelEvent];

  @override
  final String wireName = r'BindingAsyncCancelEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingAsyncCancelEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.asyncToken != null) {
      yield r'asyncToken';
      yield serializers.serialize(
        object.asyncToken,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingAsyncCancelEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingAsyncCancelEventBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingAsyncCancelEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingAsyncCancelEventBuilder();
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

