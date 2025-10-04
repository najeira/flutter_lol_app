// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_async_cancel_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingAsyncCancelEvent extends BindingAsyncCancelEvent {
  @override
  final int? asyncToken;

  factory _$BindingAsyncCancelEvent(
          [void Function(BindingAsyncCancelEventBuilder)? updates]) =>
      (BindingAsyncCancelEventBuilder()..update(updates))._build();

  _$BindingAsyncCancelEvent._({this.asyncToken}) : super._();
  @override
  BindingAsyncCancelEvent rebuild(
          void Function(BindingAsyncCancelEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingAsyncCancelEventBuilder toBuilder() =>
      BindingAsyncCancelEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingAsyncCancelEvent && asyncToken == other.asyncToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, asyncToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingAsyncCancelEvent')
          ..add('asyncToken', asyncToken))
        .toString();
  }
}

class BindingAsyncCancelEventBuilder
    implements
        Builder<BindingAsyncCancelEvent, BindingAsyncCancelEventBuilder> {
  _$BindingAsyncCancelEvent? _$v;

  int? _asyncToken;
  int? get asyncToken => _$this._asyncToken;
  set asyncToken(int? asyncToken) => _$this._asyncToken = asyncToken;

  BindingAsyncCancelEventBuilder() {
    BindingAsyncCancelEvent._defaults(this);
  }

  BindingAsyncCancelEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _asyncToken = $v.asyncToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingAsyncCancelEvent other) {
    _$v = other as _$BindingAsyncCancelEvent;
  }

  @override
  void update(void Function(BindingAsyncCancelEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingAsyncCancelEvent build() => _build();

  _$BindingAsyncCancelEvent _build() {
    final _$result = _$v ??
        _$BindingAsyncCancelEvent._(
          asyncToken: asyncToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
