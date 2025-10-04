// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_generic_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingGenericEvent extends BindingGenericEvent {
  @override
  final BuiltMap<String, JsonObject?>? data;

  factory _$BindingGenericEvent(
          [void Function(BindingGenericEventBuilder)? updates]) =>
      (BindingGenericEventBuilder()..update(updates))._build();

  _$BindingGenericEvent._({this.data}) : super._();
  @override
  BindingGenericEvent rebuild(
          void Function(BindingGenericEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingGenericEventBuilder toBuilder() =>
      BindingGenericEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingGenericEvent && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingGenericEvent')
          ..add('data', data))
        .toString();
  }
}

class BindingGenericEventBuilder
    implements Builder<BindingGenericEvent, BindingGenericEventBuilder> {
  _$BindingGenericEvent? _$v;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  BindingGenericEventBuilder() {
    BindingGenericEvent._defaults(this);
  }

  BindingGenericEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingGenericEvent other) {
    _$v = other as _$BindingGenericEvent;
  }

  @override
  void update(void Function(BindingGenericEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingGenericEvent build() => _build();

  _$BindingGenericEvent _build() {
    _$BindingGenericEvent _$result;
    try {
      _$result = _$v ??
          _$BindingGenericEvent._(
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingGenericEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
