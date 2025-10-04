//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'binding_help_format.g.dart';

class BindingHelpFormat extends EnumClass {

  /// Help format for binding functions and types.
  @BuiltValueEnumConst(wireName: r'Full')
  static const BindingHelpFormat full = _$full;
  /// Help format for binding functions and types.
  @BuiltValueEnumConst(wireName: r'Epytext')
  static const BindingHelpFormat epytext = _$epytext;
  /// Help format for binding functions and types.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const BindingHelpFormat unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<BindingHelpFormat> get serializer => _$bindingHelpFormatSerializer;

  const BindingHelpFormat._(String name): super(name);

  static BuiltSet<BindingHelpFormat> get values => _$values;
  static BindingHelpFormat valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class BindingHelpFormatMixin = Object with _$BindingHelpFormatMixin;

