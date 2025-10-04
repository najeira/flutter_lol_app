//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/ability_resource.dart';
import 'package:openapi/src/model/binding_async_cancel_event.dart';
import 'package:openapi/src/model/binding_async_failure_event.dart';
import 'package:openapi/src/model/binding_async_state.dart';
import 'package:openapi/src/model/binding_callback_event.dart';
import 'package:openapi/src/model/binding_full_api_help.dart';
import 'package:openapi/src/model/binding_full_argument_help.dart';
import 'package:openapi/src/model/binding_full_enum_value_help.dart';
import 'package:openapi/src/model/binding_full_event_help.dart';
import 'package:openapi/src/model/binding_full_field_help.dart';
import 'package:openapi/src/model/binding_full_function_help.dart';
import 'package:openapi/src/model/binding_full_type_help.dart';
import 'package:openapi/src/model/binding_full_type_identifier.dart';
import 'package:openapi/src/model/binding_generic_async_event.dart';
import 'package:openapi/src/model/binding_generic_event.dart';
import 'package:openapi/src/model/binding_help_format.dart';
import 'package:openapi/src/model/color.dart';
import 'package:openapi/src/model/remoting_help_format.dart';
import 'package:openapi/src/model/remoting_privilege.dart';
import 'package:openapi/src/model/remoting_serialized_format.dart';
import 'package:openapi/src/model/team_id.dart';
import 'package:openapi/src/model/vector2f.dart';
import 'package:openapi/src/model/vector3f.dart';
import 'package:openapi/src/model/vector4f.dart';

part 'serializers.g.dart';

@SerializersFor([
  AbilityResource,
  BindingAsyncCancelEvent,
  BindingAsyncFailureEvent,
  BindingAsyncState,
  BindingCallbackEvent,
  BindingFullApiHelp,
  BindingFullArgumentHelp,
  BindingFullEnumValueHelp,
  BindingFullEventHelp,
  BindingFullFieldHelp,
  BindingFullFunctionHelp,
  BindingFullTypeHelp,
  BindingFullTypeIdentifier,
  BindingGenericAsyncEvent,
  BindingGenericEvent,
  BindingHelpFormat,
  Color,
  RemotingHelpFormat,
  RemotingPrivilege,
  RemotingSerializedFormat,
  TeamID,
  Vector2f,
  Vector3f,
  Vector4f,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
        () => MapBuilder<String, JsonObject>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
