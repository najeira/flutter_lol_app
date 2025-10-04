// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AbilityResource _$MANA = const AbilityResource._('MANA');
const AbilityResource _$ENERGY = const AbilityResource._('ENERGY');
const AbilityResource _$NONE = const AbilityResource._('NONE');
const AbilityResource _$SHIELD = const AbilityResource._('SHIELD');
const AbilityResource _$BATTLEFURY = const AbilityResource._('BATTLEFURY');
const AbilityResource _$DRAGONFURY = const AbilityResource._('DRAGONFURY');
const AbilityResource _$RAGE = const AbilityResource._('RAGE');
const AbilityResource _$HEAT = const AbilityResource._('HEAT');
const AbilityResource _$GNARFURY = const AbilityResource._('GNARFURY');
const AbilityResource _$FEROCITY = const AbilityResource._('FEROCITY');
const AbilityResource _$BLOODWELL = const AbilityResource._('BLOODWELL');
const AbilityResource _$WIND = const AbilityResource._('WIND');
const AbilityResource _$AMMO = const AbilityResource._('AMMO');
const AbilityResource _$MOONLIGHT = const AbilityResource._('MOONLIGHT');
const AbilityResource _$OTHER = const AbilityResource._('OTHER');
const AbilityResource _$MAX = const AbilityResource._('MAX');
const AbilityResource _$unknownDefaultOpenApi =
    const AbilityResource._('unknownDefaultOpenApi');

AbilityResource _$valueOf(String name) {
  switch (name) {
    case 'MANA':
      return _$MANA;
    case 'ENERGY':
      return _$ENERGY;
    case 'NONE':
      return _$NONE;
    case 'SHIELD':
      return _$SHIELD;
    case 'BATTLEFURY':
      return _$BATTLEFURY;
    case 'DRAGONFURY':
      return _$DRAGONFURY;
    case 'RAGE':
      return _$RAGE;
    case 'HEAT':
      return _$HEAT;
    case 'GNARFURY':
      return _$GNARFURY;
    case 'FEROCITY':
      return _$FEROCITY;
    case 'BLOODWELL':
      return _$BLOODWELL;
    case 'WIND':
      return _$WIND;
    case 'AMMO':
      return _$AMMO;
    case 'MOONLIGHT':
      return _$MOONLIGHT;
    case 'OTHER':
      return _$OTHER;
    case 'MAX':
      return _$MAX;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<AbilityResource> _$values =
    BuiltSet<AbilityResource>(const <AbilityResource>[
  _$MANA,
  _$ENERGY,
  _$NONE,
  _$SHIELD,
  _$BATTLEFURY,
  _$DRAGONFURY,
  _$RAGE,
  _$HEAT,
  _$GNARFURY,
  _$FEROCITY,
  _$BLOODWELL,
  _$WIND,
  _$AMMO,
  _$MOONLIGHT,
  _$OTHER,
  _$MAX,
  _$unknownDefaultOpenApi,
]);

class _$AbilityResourceMeta {
  const _$AbilityResourceMeta();
  AbilityResource get MANA => _$MANA;
  AbilityResource get ENERGY => _$ENERGY;
  AbilityResource get NONE => _$NONE;
  AbilityResource get SHIELD => _$SHIELD;
  AbilityResource get BATTLEFURY => _$BATTLEFURY;
  AbilityResource get DRAGONFURY => _$DRAGONFURY;
  AbilityResource get RAGE => _$RAGE;
  AbilityResource get HEAT => _$HEAT;
  AbilityResource get GNARFURY => _$GNARFURY;
  AbilityResource get FEROCITY => _$FEROCITY;
  AbilityResource get BLOODWELL => _$BLOODWELL;
  AbilityResource get WIND => _$WIND;
  AbilityResource get AMMO => _$AMMO;
  AbilityResource get MOONLIGHT => _$MOONLIGHT;
  AbilityResource get OTHER => _$OTHER;
  AbilityResource get MAX => _$MAX;
  AbilityResource get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  AbilityResource valueOf(String name) => _$valueOf(name);
  BuiltSet<AbilityResource> get values => _$values;
}

abstract class _$AbilityResourceMixin {
  // ignore: non_constant_identifier_names
  _$AbilityResourceMeta get AbilityResource => const _$AbilityResourceMeta();
}

Serializer<AbilityResource> _$abilityResourceSerializer =
    _$AbilityResourceSerializer();

class _$AbilityResourceSerializer
    implements PrimitiveSerializer<AbilityResource> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'MANA': 'MANA',
    'ENERGY': 'ENERGY',
    'NONE': 'NONE',
    'SHIELD': 'SHIELD',
    'BATTLEFURY': 'BATTLEFURY',
    'DRAGONFURY': 'DRAGONFURY',
    'RAGE': 'RAGE',
    'HEAT': 'HEAT',
    'GNARFURY': 'GNARFURY',
    'FEROCITY': 'FEROCITY',
    'BLOODWELL': 'BLOODWELL',
    'WIND': 'WIND',
    'AMMO': 'AMMO',
    'MOONLIGHT': 'MOONLIGHT',
    'OTHER': 'OTHER',
    'MAX': 'MAX',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'MANA': 'MANA',
    'ENERGY': 'ENERGY',
    'NONE': 'NONE',
    'SHIELD': 'SHIELD',
    'BATTLEFURY': 'BATTLEFURY',
    'DRAGONFURY': 'DRAGONFURY',
    'RAGE': 'RAGE',
    'HEAT': 'HEAT',
    'GNARFURY': 'GNARFURY',
    'FEROCITY': 'FEROCITY',
    'BLOODWELL': 'BLOODWELL',
    'WIND': 'WIND',
    'AMMO': 'AMMO',
    'MOONLIGHT': 'MOONLIGHT',
    'OTHER': 'OTHER',
    'MAX': 'MAX',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[AbilityResource];
  @override
  final String wireName = 'AbilityResource';

  @override
  Object serialize(Serializers serializers, AbilityResource object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AbilityResource deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AbilityResource.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
