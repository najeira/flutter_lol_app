// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_async_failure_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingAsyncFailureEvent extends BindingAsyncFailureEvent {
  @override
  final int? asyncToken;
  @override
  final String? error;

  factory _$BindingAsyncFailureEvent(
          [void Function(BindingAsyncFailureEventBuilder)? updates]) =>
      (BindingAsyncFailureEventBuilder()..update(updates))._build();

  _$BindingAsyncFailureEvent._({this.asyncToken, this.error}) : super._();
  @override
  BindingAsyncFailureEvent rebuild(
          void Function(BindingAsyncFailureEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingAsyncFailureEventBuilder toBuilder() =>
      BindingAsyncFailureEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingAsyncFailureEvent &&
        asyncToken == other.asyncToken &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, asyncToken.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingAsyncFailureEvent')
          ..add('asyncToken', asyncToken)
          ..add('error', error))
        .toString();
  }
}

class BindingAsyncFailureEventBuilder
    implements
        Builder<BindingAsyncFailureEvent, BindingAsyncFailureEventBuilder> {
  _$BindingAsyncFailureEvent? _$v;

  int? _asyncToken;
  int? get asyncToken => _$this._asyncToken;
  set asyncToken(int? asyncToken) => _$this._asyncToken = asyncToken;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  BindingAsyncFailureEventBuilder() {
    BindingAsyncFailureEvent._defaults(this);
  }

  BindingAsyncFailureEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _asyncToken = $v.asyncToken;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingAsyncFailureEvent other) {
    _$v = other as _$BindingAsyncFailureEvent;
  }

  @override
  void update(void Function(BindingAsyncFailureEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingAsyncFailureEvent build() => _build();

  _$BindingAsyncFailureEvent _build() {
    final _$result = _$v ??
        _$BindingAsyncFailureEvent._(
          asyncToken: asyncToken,
          error: error,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
