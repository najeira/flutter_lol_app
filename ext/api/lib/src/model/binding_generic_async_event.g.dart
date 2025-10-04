// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_generic_async_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingGenericAsyncEvent extends BindingGenericAsyncEvent {
  @override
  final int? asyncToken;
  @override
  final BuiltMap<String, JsonObject?>? data;

  factory _$BindingGenericAsyncEvent(
          [void Function(BindingGenericAsyncEventBuilder)? updates]) =>
      (BindingGenericAsyncEventBuilder()..update(updates))._build();

  _$BindingGenericAsyncEvent._({this.asyncToken, this.data}) : super._();
  @override
  BindingGenericAsyncEvent rebuild(
          void Function(BindingGenericAsyncEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingGenericAsyncEventBuilder toBuilder() =>
      BindingGenericAsyncEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingGenericAsyncEvent &&
        asyncToken == other.asyncToken &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, asyncToken.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingGenericAsyncEvent')
          ..add('asyncToken', asyncToken)
          ..add('data', data))
        .toString();
  }
}

class BindingGenericAsyncEventBuilder
    implements
        Builder<BindingGenericAsyncEvent, BindingGenericAsyncEventBuilder> {
  _$BindingGenericAsyncEvent? _$v;

  int? _asyncToken;
  int? get asyncToken => _$this._asyncToken;
  set asyncToken(int? asyncToken) => _$this._asyncToken = asyncToken;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  BindingGenericAsyncEventBuilder() {
    BindingGenericAsyncEvent._defaults(this);
  }

  BindingGenericAsyncEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _asyncToken = $v.asyncToken;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingGenericAsyncEvent other) {
    _$v = other as _$BindingGenericAsyncEvent;
  }

  @override
  void update(void Function(BindingGenericAsyncEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingGenericAsyncEvent build() => _build();

  _$BindingGenericAsyncEvent _build() {
    _$BindingGenericAsyncEvent _$result;
    try {
      _$result = _$v ??
          _$BindingGenericAsyncEvent._(
            asyncToken: asyncToken,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingGenericAsyncEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
