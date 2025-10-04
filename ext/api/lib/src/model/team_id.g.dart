// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TeamID _$UNKNOWN = const TeamID._('UNKNOWN');
const TeamID _$ORDER = const TeamID._('ORDER');
const TeamID _$CHAOS = const TeamID._('CHAOS');
const TeamID _$NEUTRAL = const TeamID._('NEUTRAL');
const TeamID _$unknownDefaultOpenApi = const TeamID._('unknownDefaultOpenApi');

TeamID _$valueOf(String name) {
  switch (name) {
    case 'UNKNOWN':
      return _$UNKNOWN;
    case 'ORDER':
      return _$ORDER;
    case 'CHAOS':
      return _$CHAOS;
    case 'NEUTRAL':
      return _$NEUTRAL;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<TeamID> _$values = BuiltSet<TeamID>(const <TeamID>[
  _$UNKNOWN,
  _$ORDER,
  _$CHAOS,
  _$NEUTRAL,
  _$unknownDefaultOpenApi,
]);

class _$TeamIDMeta {
  const _$TeamIDMeta();
  TeamID get UNKNOWN => _$UNKNOWN;
  TeamID get ORDER => _$ORDER;
  TeamID get CHAOS => _$CHAOS;
  TeamID get NEUTRAL => _$NEUTRAL;
  TeamID get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  TeamID valueOf(String name) => _$valueOf(name);
  BuiltSet<TeamID> get values => _$values;
}

abstract class _$TeamIDMixin {
  // ignore: non_constant_identifier_names
  _$TeamIDMeta get TeamID => const _$TeamIDMeta();
}

Serializer<TeamID> _$teamIDSerializer = _$TeamIDSerializer();

class _$TeamIDSerializer implements PrimitiveSerializer<TeamID> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'UNKNOWN': 'UNKNOWN',
    'ORDER': 'ORDER',
    'CHAOS': 'CHAOS',
    'NEUTRAL': 'NEUTRAL',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'UNKNOWN': 'UNKNOWN',
    'ORDER': 'ORDER',
    'CHAOS': 'CHAOS',
    'NEUTRAL': 'NEUTRAL',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[TeamID];
  @override
  final String wireName = 'TeamID';

  @override
  Object serialize(Serializers serializers, TeamID object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TeamID deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TeamID.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
