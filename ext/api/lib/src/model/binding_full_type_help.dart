//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/binding_full_enum_value_help.dart';
import 'package:openapi/src/model/binding_full_field_help.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_type_help.g.dart';

/// Describes a struct or enum type.
///
/// Properties:
/// * [description] 
/// * [fields] 
/// * [name] 
/// * [nameSpace] 
/// * [size] 
/// * [tags] 
/// * [values] 
@BuiltValue()
abstract class BindingFullTypeHelp implements Built<BindingFullTypeHelp, BindingFullTypeHelpBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'fields')
  BuiltList<BindingFullFieldHelp>? get fields;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'nameSpace')
  String? get nameSpace;

  @BuiltValueField(wireName: r'size')
  int? get size;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  @BuiltValueField(wireName: r'values')
  BuiltList<BindingFullEnumValueHelp>? get values;

  BindingFullTypeHelp._();

  factory BindingFullTypeHelp([void updates(BindingFullTypeHelpBuilder b)]) = _$BindingFullTypeHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullTypeHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullTypeHelp> get serializer => _$BindingFullTypeHelpSerializer();
}

class _$BindingFullTypeHelpSerializer implements PrimitiveSerializer<BindingFullTypeHelp> {
  @override
  final Iterable<Type> types = const [BindingFullTypeHelp, _$BindingFullTypeHelp];

  @override
  final String wireName = r'BindingFullTypeHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullTypeHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.fields != null) {
      yield r'fields';
      yield serializers.serialize(
        object.fields,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullFieldHelp)]),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.nameSpace != null) {
      yield r'nameSpace';
      yield serializers.serialize(
        object.nameSpace,
        specifiedType: const FullType(String),
      );
    }
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType(int),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.values != null) {
      yield r'values';
      yield serializers.serialize(
        object.values,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullEnumValueHelp)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullTypeHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullTypeHelpBuilder result,
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
        case r'fields':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullFieldHelp)]),
          ) as BuiltList<BindingFullFieldHelp>;
          result.fields.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'nameSpace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameSpace = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        case r'values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullEnumValueHelp)]),
          ) as BuiltList<BindingFullEnumValueHelp>;
          result.values.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullTypeHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullTypeHelpBuilder();
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

