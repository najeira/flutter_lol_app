//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remoting_serialized_format.g.dart';

class RemotingSerializedFormat extends EnumClass {

  /// Serialization format for remoting requests and results.
  @BuiltValueEnumConst(wireName: r'JSON')
  static const RemotingSerializedFormat JSON = _$JSON;
  /// Serialization format for remoting requests and results.
  @BuiltValueEnumConst(wireName: r'YAML')
  static const RemotingSerializedFormat YAML = _$YAML;
  /// Serialization format for remoting requests and results.
  @BuiltValueEnumConst(wireName: r'MsgPack')
  static const RemotingSerializedFormat msgPack = _$msgPack;
  /// Serialization format for remoting requests and results.
  @BuiltValueEnumConst(wireName: r'unknown_default_open_api', fallback: true)
  static const RemotingSerializedFormat unknownDefaultOpenApi = _$unknownDefaultOpenApi;

  static Serializer<RemotingSerializedFormat> get serializer => _$remotingSerializedFormatSerializer;

  const RemotingSerializedFormat._(String name): super(name);

  static BuiltSet<RemotingSerializedFormat> get values => _$values;
  static RemotingSerializedFormat valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RemotingSerializedFormatMixin = Object with _$RemotingSerializedFormatMixin;

