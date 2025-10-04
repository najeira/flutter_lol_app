//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remoting_help_format.g.dart';

class RemotingHelpFormat extends EnumClass {

  /// Help format for remoting functions and types.
  @BuiltValueEnumConst(wireName: r'Full')
  static const RemotingHelpFormat full = _$full;
  /// Help format for remoting functions and types.
  @BuiltValueEnumConst(wireName: r'Epytext')
  static const RemotingHelpFormat epytext = _$epytext;
  /// Help format for remoting functions and types.
  @BuiltValueEnumConst(wireName: r'Brief')
  static const RemotingHelpFormat brief = _$brief;
  /// Help format for remoting functions and types.
  @BuiltValueEnumConst(wireName: r'Console')
  static const RemotingHelpFormat console = _$console;
  /// Help format for remoting functions and types.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const RemotingHelpFormat unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<RemotingHelpFormat> get serializer => _$remotingHelpFormatSerializer;

  const RemotingHelpFormat._(String name): super(name);

  static BuiltSet<RemotingHelpFormat> get values => _$values;
  static RemotingHelpFormat valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RemotingHelpFormatMixin = Object with _$RemotingHelpFormatMixin;

