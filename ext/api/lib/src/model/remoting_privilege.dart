//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remoting_privilege.g.dart';

class RemotingPrivilege extends EnumClass {

  /// Well-known privilege levels for bindable functions.
  @BuiltValueEnumConst(wireName: r'None')
  static const RemotingPrivilege none = _$none;
  /// Well-known privilege levels for bindable functions.
  @BuiltValueEnumConst(wireName: r'User')
  static const RemotingPrivilege user = _$user;
  /// Well-known privilege levels for bindable functions.
  @BuiltValueEnumConst(wireName: r'Admin')
  static const RemotingPrivilege admin = _$admin;
  /// Well-known privilege levels for bindable functions.
  @BuiltValueEnumConst(wireName: r'Local')
  static const RemotingPrivilege local = _$local;
  /// Well-known privilege levels for bindable functions.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const RemotingPrivilege unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<RemotingPrivilege> get serializer => _$remotingPrivilegeSerializer;

  const RemotingPrivilege._(String name): super(name);

  static BuiltSet<RemotingPrivilege> get values => _$values;
  static RemotingPrivilege valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RemotingPrivilegeMixin = Object with _$RemotingPrivilegeMixin;

