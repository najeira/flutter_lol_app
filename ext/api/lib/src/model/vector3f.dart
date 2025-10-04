//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'vector3f.g.dart';

/// 3D vector
///
/// Properties:
/// * [x] 
/// * [y] 
/// * [z] 
@BuiltValue()
abstract class Vector3f implements Built<Vector3f, Vector3fBuilder> {
  @BuiltValueField(wireName: r'x')
  double? get x;

  @BuiltValueField(wireName: r'y')
  double? get y;

  @BuiltValueField(wireName: r'z')
  double? get z;

  Vector3f._();

  factory Vector3f([void updates(Vector3fBuilder b)]) = _$Vector3f;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(Vector3fBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Vector3f> get serializer => _$Vector3fSerializer();
}

class _$Vector3fSerializer implements PrimitiveSerializer<Vector3f> {
  @override
  final Iterable<Type> types = const [Vector3f, _$Vector3f];

  @override
  final String wireName = r'Vector3f';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Vector3f object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    Vector3f object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required Vector3fBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  Vector3f deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = Vector3fBuilder();
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

