// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remoting_help_format.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RemotingHelpFormat _$full = const RemotingHelpFormat._('full');
const RemotingHelpFormat _$epytext = const RemotingHelpFormat._('epytext');
const RemotingHelpFormat _$brief = const RemotingHelpFormat._('brief');
const RemotingHelpFormat _$console = const RemotingHelpFormat._('console');
const RemotingHelpFormat _$unknownDefaultOpenApi =
    const RemotingHelpFormat._('unknownDefaultOpenApi');

RemotingHelpFormat _$valueOf(String name) {
  switch (name) {
    case 'full':
      return _$full;
    case 'epytext':
      return _$epytext;
    case 'brief':
      return _$brief;
    case 'console':
      return _$console;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<RemotingHelpFormat> _$values =
    BuiltSet<RemotingHelpFormat>(const <RemotingHelpFormat>[
  _$full,
  _$epytext,
  _$brief,
  _$console,
  _$unknownDefaultOpenApi,
]);

class _$RemotingHelpFormatMeta {
  const _$RemotingHelpFormatMeta();
  RemotingHelpFormat get full => _$full;
  RemotingHelpFormat get epytext => _$epytext;
  RemotingHelpFormat get brief => _$brief;
  RemotingHelpFormat get console => _$console;
  RemotingHelpFormat get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  RemotingHelpFormat valueOf(String name) => _$valueOf(name);
  BuiltSet<RemotingHelpFormat> get values => _$values;
}

abstract class _$RemotingHelpFormatMixin {
  // ignore: non_constant_identifier_names
  _$RemotingHelpFormatMeta get RemotingHelpFormat =>
      const _$RemotingHelpFormatMeta();
}

Serializer<RemotingHelpFormat> _$remotingHelpFormatSerializer =
    _$RemotingHelpFormatSerializer();

class _$RemotingHelpFormatSerializer
    implements PrimitiveSerializer<RemotingHelpFormat> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'full': 'Full',
    'epytext': 'Epytext',
    'brief': 'Brief',
    'console': 'Console',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Full': 'full',
    'Epytext': 'epytext',
    'Brief': 'brief',
    'Console': 'console',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[RemotingHelpFormat];
  @override
  final String wireName = 'RemotingHelpFormat';

  @override
  Object serialize(Serializers serializers, RemotingHelpFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RemotingHelpFormat deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RemotingHelpFormat.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
