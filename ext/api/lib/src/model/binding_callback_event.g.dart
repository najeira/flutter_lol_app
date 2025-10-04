// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_callback_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingCallbackEvent extends BindingCallbackEvent {
  @override
  final int? id;
  @override
  final BuiltList<BuiltMap<String, JsonObject?>>? parameters;

  factory _$BindingCallbackEvent(
          [void Function(BindingCallbackEventBuilder)? updates]) =>
      (BindingCallbackEventBuilder()..update(updates))._build();

  _$BindingCallbackEvent._({this.id, this.parameters}) : super._();
  @override
  BindingCallbackEvent rebuild(
          void Function(BindingCallbackEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingCallbackEventBuilder toBuilder() =>
      BindingCallbackEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingCallbackEvent &&
        id == other.id &&
        parameters == other.parameters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingCallbackEvent')
          ..add('id', id)
          ..add('parameters', parameters))
        .toString();
  }
}

class BindingCallbackEventBuilder
    implements Builder<BindingCallbackEvent, BindingCallbackEventBuilder> {
  _$BindingCallbackEvent? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<BuiltMap<String, JsonObject?>>? _parameters;
  ListBuilder<BuiltMap<String, JsonObject?>> get parameters =>
      _$this._parameters ??= ListBuilder<BuiltMap<String, JsonObject?>>();
  set parameters(ListBuilder<BuiltMap<String, JsonObject?>>? parameters) =>
      _$this._parameters = parameters;

  BindingCallbackEventBuilder() {
    BindingCallbackEvent._defaults(this);
  }

  BindingCallbackEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _parameters = $v.parameters?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingCallbackEvent other) {
    _$v = other as _$BindingCallbackEvent;
  }

  @override
  void update(void Function(BindingCallbackEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingCallbackEvent build() => _build();

  _$BindingCallbackEvent _build() {
    _$BindingCallbackEvent _$result;
    try {
      _$result = _$v ??
          _$BindingCallbackEvent._(
            id: id,
            parameters: _parameters?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parameters';
        _parameters?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingCallbackEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
