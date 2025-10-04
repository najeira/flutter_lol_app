//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/binding_full_function_help.dart';
import 'package:openapi/src/model/binding_full_event_help.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/binding_full_type_help.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_full_api_help.g.dart';

/// Describes the exposed native API.
///
/// Properties:
/// * [events] 
/// * [functions] 
/// * [types] 
@BuiltValue()
abstract class BindingFullApiHelp implements Built<BindingFullApiHelp, BindingFullApiHelpBuilder> {
  @BuiltValueField(wireName: r'events')
  BuiltList<BindingFullEventHelp>? get events;

  @BuiltValueField(wireName: r'functions')
  BuiltList<BindingFullFunctionHelp>? get functions;

  @BuiltValueField(wireName: r'types')
  BuiltList<BindingFullTypeHelp>? get types;

  BindingFullApiHelp._();

  factory BindingFullApiHelp([void updates(BindingFullApiHelpBuilder b)]) = _$BindingFullApiHelp;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BindingFullApiHelpBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BindingFullApiHelp> get serializer => _$BindingFullApiHelpSerializer();
}

class _$BindingFullApiHelpSerializer implements PrimitiveSerializer<BindingFullApiHelp> {
  @override
  final Iterable<Type> types = const [BindingFullApiHelp, _$BindingFullApiHelp];

  @override
  final String wireName = r'BindingFullApiHelp';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BindingFullApiHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.events != null) {
      yield r'events';
      yield serializers.serialize(
        object.events,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullEventHelp)]),
      );
    }
    if (object.functions != null) {
      yield r'functions';
      yield serializers.serialize(
        object.functions,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullFunctionHelp)]),
      );
    }
    if (object.types != null) {
      yield r'types';
      yield serializers.serialize(
        object.types,
        specifiedType: const FullType(BuiltList, [FullType(BindingFullTypeHelp)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BindingFullApiHelp object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BindingFullApiHelpBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'events':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullEventHelp)]),
          ) as BuiltList<BindingFullEventHelp>;
          result.events.replace(valueDes);
          break;
        case r'functions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullFunctionHelp)]),
          ) as BuiltList<BindingFullFunctionHelp>;
          result.functions.replace(valueDes);
          break;
        case r'types':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BindingFullTypeHelp)]),
          ) as BuiltList<BindingFullTypeHelp>;
          result.types.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BindingFullApiHelp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BindingFullApiHelpBuilder();
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

