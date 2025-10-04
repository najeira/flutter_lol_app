//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'team_id.g.dart';

class TeamID extends EnumClass {

  /// Team identification
  @BuiltValueEnumConst(wireName: r'UNKNOWN')
  static const TeamID UNKNOWN = _$UNKNOWN;
  /// Team identification
  @BuiltValueEnumConst(wireName: r'ORDER')
  static const TeamID ORDER = _$ORDER;
  /// Team identification
  @BuiltValueEnumConst(wireName: r'CHAOS')
  static const TeamID CHAOS = _$CHAOS;
  /// Team identification
  @BuiltValueEnumConst(wireName: r'NEUTRAL')
  static const TeamID NEUTRAL = _$NEUTRAL;
  /// Team identification
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const TeamID unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<TeamID> get serializer => _$teamIDSerializer;

  const TeamID._(String name): super(name);

  static BuiltSet<TeamID> get values => _$values;
  static TeamID valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TeamIDMixin = Object with _$TeamIDMixin;

