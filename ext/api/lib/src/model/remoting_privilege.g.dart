// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remoting_privilege.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RemotingPrivilege _$none = const RemotingPrivilege._('none');
const RemotingPrivilege _$user = const RemotingPrivilege._('user');
const RemotingPrivilege _$admin = const RemotingPrivilege._('admin');
const RemotingPrivilege _$local = const RemotingPrivilege._('local');
const RemotingPrivilege _$unknownDefaultOpenApi =
    const RemotingPrivilege._('unknownDefaultOpenApi');

RemotingPrivilege _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'user':
      return _$user;
    case 'admin':
      return _$admin;
    case 'local':
      return _$local;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<RemotingPrivilege> _$values =
    BuiltSet<RemotingPrivilege>(const <RemotingPrivilege>[
  _$none,
  _$user,
  _$admin,
  _$local,
  _$unknownDefaultOpenApi,
]);

class _$RemotingPrivilegeMeta {
  const _$RemotingPrivilegeMeta();
  RemotingPrivilege get none => _$none;
  RemotingPrivilege get user => _$user;
  RemotingPrivilege get admin => _$admin;
  RemotingPrivilege get local => _$local;
  RemotingPrivilege get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  RemotingPrivilege valueOf(String name) => _$valueOf(name);
  BuiltSet<RemotingPrivilege> get values => _$values;
}

abstract class _$RemotingPrivilegeMixin {
  // ignore: non_constant_identifier_names
  _$RemotingPrivilegeMeta get RemotingPrivilege =>
      const _$RemotingPrivilegeMeta();
}

Serializer<RemotingPrivilege> _$remotingPrivilegeSerializer =
    _$RemotingPrivilegeSerializer();

class _$RemotingPrivilegeSerializer
    implements PrimitiveSerializer<RemotingPrivilege> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'None',
    'user': 'User',
    'admin': 'Admin',
    'local': 'Local',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'None': 'none',
    'User': 'user',
    'Admin': 'admin',
    'Local': 'local',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[RemotingPrivilege];
  @override
  final String wireName = 'RemotingPrivilege';

  @override
  Object serialize(Serializers serializers, RemotingPrivilege object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RemotingPrivilege deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RemotingPrivilege.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
