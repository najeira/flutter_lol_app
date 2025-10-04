// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_help_format.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BindingHelpFormat _$full = const BindingHelpFormat._('full');
const BindingHelpFormat _$epytext = const BindingHelpFormat._('epytext');
const BindingHelpFormat _$unknownDefaultOpenApi =
    const BindingHelpFormat._('unknownDefaultOpenApi');

BindingHelpFormat _$valueOf(String name) {
  switch (name) {
    case 'full':
      return _$full;
    case 'epytext':
      return _$epytext;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<BindingHelpFormat> _$values =
    BuiltSet<BindingHelpFormat>(const <BindingHelpFormat>[
  _$full,
  _$epytext,
  _$unknownDefaultOpenApi,
]);

class _$BindingHelpFormatMeta {
  const _$BindingHelpFormatMeta();
  BindingHelpFormat get full => _$full;
  BindingHelpFormat get epytext => _$epytext;
  BindingHelpFormat get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  BindingHelpFormat valueOf(String name) => _$valueOf(name);
  BuiltSet<BindingHelpFormat> get values => _$values;
}

abstract class _$BindingHelpFormatMixin {
  // ignore: non_constant_identifier_names
  _$BindingHelpFormatMeta get BindingHelpFormat =>
      const _$BindingHelpFormatMeta();
}

Serializer<BindingHelpFormat> _$bindingHelpFormatSerializer =
    _$BindingHelpFormatSerializer();

class _$BindingHelpFormatSerializer
    implements PrimitiveSerializer<BindingHelpFormat> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'full': 'Full',
    'epytext': 'Epytext',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Full': 'full',
    'Epytext': 'epytext',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[BindingHelpFormat];
  @override
  final String wireName = 'BindingHelpFormat';

  @override
  Object serialize(Serializers serializers, BindingHelpFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BindingHelpFormat deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BindingHelpFormat.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
