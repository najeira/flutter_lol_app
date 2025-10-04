// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_async_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BindingAsyncState _$none = const BindingAsyncState._('none');
const BindingAsyncState _$running = const BindingAsyncState._('running');
const BindingAsyncState _$cancelling = const BindingAsyncState._('cancelling');
const BindingAsyncState _$cancelled = const BindingAsyncState._('cancelled');
const BindingAsyncState _$succeeded = const BindingAsyncState._('succeeded');
const BindingAsyncState _$failed = const BindingAsyncState._('failed');
const BindingAsyncState _$unknownDefaultOpenApi =
    const BindingAsyncState._('unknownDefaultOpenApi');

BindingAsyncState _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'running':
      return _$running;
    case 'cancelling':
      return _$cancelling;
    case 'cancelled':
      return _$cancelled;
    case 'succeeded':
      return _$succeeded;
    case 'failed':
      return _$failed;
    case 'unknownDefaultOpenApi':
      return _$unknownDefaultOpenApi;
    default:
      return _$unknownDefaultOpenApi;
  }
}

final BuiltSet<BindingAsyncState> _$values =
    BuiltSet<BindingAsyncState>(const <BindingAsyncState>[
  _$none,
  _$running,
  _$cancelling,
  _$cancelled,
  _$succeeded,
  _$failed,
  _$unknownDefaultOpenApi,
]);

class _$BindingAsyncStateMeta {
  const _$BindingAsyncStateMeta();
  BindingAsyncState get none => _$none;
  BindingAsyncState get running => _$running;
  BindingAsyncState get cancelling => _$cancelling;
  BindingAsyncState get cancelled => _$cancelled;
  BindingAsyncState get succeeded => _$succeeded;
  BindingAsyncState get failed => _$failed;
  BindingAsyncState get unknownDefaultOpenApi => _$unknownDefaultOpenApi;
  BindingAsyncState valueOf(String name) => _$valueOf(name);
  BuiltSet<BindingAsyncState> get values => _$values;
}

abstract class _$BindingAsyncStateMixin {
  // ignore: non_constant_identifier_names
  _$BindingAsyncStateMeta get BindingAsyncState =>
      const _$BindingAsyncStateMeta();
}

Serializer<BindingAsyncState> _$bindingAsyncStateSerializer =
    _$BindingAsyncStateSerializer();

class _$BindingAsyncStateSerializer
    implements PrimitiveSerializer<BindingAsyncState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'None',
    'running': 'Running',
    'cancelling': 'Cancelling',
    'cancelled': 'Cancelled',
    'succeeded': 'Succeeded',
    'failed': 'Failed',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'None': 'none',
    'Running': 'running',
    'Cancelling': 'cancelling',
    'Cancelled': 'cancelled',
    'Succeeded': 'succeeded',
    'Failed': 'failed',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[BindingAsyncState];
  @override
  final String wireName = 'BindingAsyncState';

  @override
  Object serialize(Serializers serializers, BindingAsyncState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BindingAsyncState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BindingAsyncState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
