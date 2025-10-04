// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remoting_serialized_format.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RemotingSerializedFormat _$JSON =
    const RemotingSerializedFormat._('JSON');
const RemotingSerializedFormat _$YAML =
    const RemotingSerializedFormat._('YAML');
const RemotingSerializedFormat _$msgPack =
    const RemotingSerializedFormat._('msgPack');
const RemotingSerializedFormat _$unknownDefaultOpenApi =
    const RemotingSerializedFormat._('unknownDefaultOpenApi');

RemotingSerializedFormat _$valueOf(String name) {
  switch (name) {
    case 'JSON':
      return _$JSON;
    case 'YAML':
      return _$YAML;
    case 'msgPack':
      return _$msgPack;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<RemotingSerializedFormat> _$values =
    BuiltSet<RemotingSerializedFormat>(const <RemotingSerializedFormat>[
  _$JSON,
  _$YAML,
  _$msgPack,
  _$unknownDefaultOpenApi,
]);

class _$RemotingSerializedFormatMeta {
  const _$RemotingSerializedFormatMeta();
  RemotingSerializedFormat get JSON => _$JSON;
  RemotingSerializedFormat get YAML => _$YAML;
  RemotingSerializedFormat get msgPack => _$msgPack;
  RemotingSerializedFormat get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  RemotingSerializedFormat valueOf(String name) => _$valueOf(name);
  BuiltSet<RemotingSerializedFormat> get values => _$values;
}

abstract class _$RemotingSerializedFormatMixin {
  // ignore: non_constant_identifier_names
  _$RemotingSerializedFormatMeta get RemotingSerializedFormat =>
      const _$RemotingSerializedFormatMeta();
}

Serializer<RemotingSerializedFormat> _$remotingSerializedFormatSerializer =
    _$RemotingSerializedFormatSerializer();

class _$RemotingSerializedFormatSerializer
    implements PrimitiveSerializer<RemotingSerializedFormat> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'JSON': 'JSON',
    'YAML': 'YAML',
    'msgPack': 'MsgPack',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'JSON': 'JSON',
    'YAML': 'YAML',
    'MsgPack': 'msgPack',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[RemotingSerializedFormat];
  @override
  final String wireName = 'RemotingSerializedFormat';

  @override
  Object serialize(Serializers serializers, RemotingSerializedFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RemotingSerializedFormat deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RemotingSerializedFormat.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
