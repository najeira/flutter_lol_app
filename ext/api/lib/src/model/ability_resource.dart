//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ability_resource.g.dart';

class AbilityResource extends EnumClass {

  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'MANA')
  static const AbilityResource MANA = _$MANA;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'ENERGY')
  static const AbilityResource ENERGY = _$ENERGY;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'NONE')
  static const AbilityResource NONE = _$NONE;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'SHIELD')
  static const AbilityResource SHIELD = _$SHIELD;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'BATTLEFURY')
  static const AbilityResource BATTLEFURY = _$BATTLEFURY;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'DRAGONFURY')
  static const AbilityResource DRAGONFURY = _$DRAGONFURY;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'RAGE')
  static const AbilityResource RAGE = _$RAGE;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'HEAT')
  static const AbilityResource HEAT = _$HEAT;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'GNARFURY')
  static const AbilityResource GNARFURY = _$GNARFURY;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'FEROCITY')
  static const AbilityResource FEROCITY = _$FEROCITY;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'BLOODWELL')
  static const AbilityResource BLOODWELL = _$BLOODWELL;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'WIND')
  static const AbilityResource WIND = _$WIND;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'AMMO')
  static const AbilityResource AMMO = _$AMMO;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'MOONLIGHT')
  static const AbilityResource MOONLIGHT = _$MOONLIGHT;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'OTHER')
  static const AbilityResource OTHER = _$OTHER;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'MAX')
  static const AbilityResource MAX = _$MAX;
  /// Ability Resource
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const AbilityResource unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<AbilityResource> get serializer => _$abilityResourceSerializer;

  const AbilityResource._(String name): super(name);

  static BuiltSet<AbilityResource> get values => _$values;
  static AbilityResource valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AbilityResourceMixin = Object with _$AbilityResourceMixin;

