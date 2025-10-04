//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/binding_full_type_identifier.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_event_help.g.dart';

/// Describes an event.
///
/// Properties:
/// * [description] 
/// * [name] 
/// * [nameSpace] 
/// * [tags] 
/// * [type] 
@BuiltValue()
abstract class BindingFullEventHelp implements Built<BindingFullEventHelp, BindingFullEventHelpBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'nameSpace')
  String? get nameSpace;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  @BuiltValueField(wireName: r'type')
  BindingFullTypeIdentifier? get type;

  BindingFullEventHelp._();

  factory BindingFullEventHelp([void updates(BindingFullEventHelpBuilder b)]) = _$BindingFullEventHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullEventHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullEventHelp> get serializer => _$BindingFullEventHelpSerializer();
}

class _$BindingFullEventHelpSerializer implements PrimitiveSerializer<BindingFullEventHelp> {
  @override
  final Iterable<Type> types = const [BindingFullEventHelp, _$BindingFullEventHelp];

  @override
  final String wireName = r'BindingFullEventHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullEventHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
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
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(BindingFullTypeIdentifier),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullEventHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullEventHelpBuilder result,
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
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BindingFullTypeIdentifier),
          ) as BindingFullTypeIdentifier;
          result.type.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullEventHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullEventHelpBuilder();
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

