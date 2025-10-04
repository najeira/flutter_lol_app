//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'color.g.dart';

/// Color
///
/// Properties:
/// * [a] 
/// * [b] 
/// * [g] 
/// * [r] 
@BuiltValue()
abstract class Color implements Built<Color, ColorBuilder> {
  @BuiltValueField(wireName: r'a')
  int? get a;

  @BuiltValueField(wireName: r'b')
  int? get b;

  @BuiltValueField(wireName: r'g')
  int? get g;

  @BuiltValueField(wireName: r'r')
  int? get r;

  Color._();

  factory Color([void updates(ColorBuilder b)]) = _$Color;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ColorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Color> get serializer => _$ColorSerializer();
}

class _$ColorSerializer implements PrimitiveSerializer<Color> {
  @override
  final Iterable<Type> types = const [Color, _$Color];

  @override
  final String wireName = r'Color';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Color object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.a != null) {
      yield r'a';
      yield serializers.serialize(
        object.a,
        specifiedType: const FullType(int),
      );
    }
    if (object.b != null) {
      yield r'b';
      yield serializers.serialize(
        object.b,
        specifiedType: const FullType(int),
      );
    }
    if (object.g != null) {
      yield r'g';
      yield serializers.serialize(
        object.g,
        specifiedType: const FullType(int),
      );
    }
    if (object.r != null) {
      yield r'r';
      yield serializers.serialize(
        object.r,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Color object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ColorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'a':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.a = valueDes;
          break;
        case r'b':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.b = valueDes;
          break;
        case r'g':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.g = valueDes;
          break;
        case r'r':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.r = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Color deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ColorBuilder();
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

