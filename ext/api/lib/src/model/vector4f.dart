//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vector4f.g.dart';

/// 4D vector
///
/// Properties:
/// * [w] 
/// * [x] 
/// * [y] 
/// * [z] 
@BuiltValue()
abstract class Vector4f implements Built<Vector4f, Vector4fBuilder> {
  @BuiltValueField(wireName: r'w')
  double? get w;

  @BuiltValueField(wireName: r'x')
  double? get x;

  @BuiltValueField(wireName: r'y')
  double? get y;

  @BuiltValueField(wireName: r'z')
  double? get z;

  Vector4f._();

  factory Vector4f([void updates(Vector4fBuilder b)]) = _$Vector4f;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(Vector4fBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Vector4f> get serializer => _$Vector4fSerializer();
}

class _$Vector4fSerializer implements PrimitiveSerializer<Vector4f> {
  @override
  final Iterable<Type> types = const [Vector4f, _$Vector4f];

  @override
  final String wireName = r'Vector4f';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Vector4f object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.w != null) {
      yield r'w';
      yield serializers.serialize(
        object.w,
        specifiedType: const FullType(double),
      );
    }
    if (object.x != null) {
      yield r'x';
      yield serializers.serialize(
        object.x,
        specifiedType: const FullType(double),
      );
    }
    if (object.y != null) {
      yield r'y';
      yield serializers.serialize(
        object.y,
        specifiedType: const FullType(double),
      );
    }
    if (object.z != null) {
      yield r'z';
      yield serializers.serialize(
        object.z,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Vector4f object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required Vector4fBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'w':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.w = valueDes;
          break;
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.y = valueDes;
          break;
        case r'z':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.z = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Vector4f deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = Vector4fBuilder();
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

