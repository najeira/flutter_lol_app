// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_api_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullApiHelp extends BindingFullApiHelp {
  @override
  final BuiltList<BindingFullEventHelp>? events;
  @override
  final BuiltList<BindingFullFunctionHelp>? functions;
  @override
  final BuiltList<BindingFullTypeHelp>? types;

  factory _$BindingFullApiHelp(
          [void Function(BindingFullApiHelpBuilder)? updates]) =>
      (BindingFullApiHelpBuilder()..update(updates))._build();

  _$BindingFullApiHelp._({this.events, this.functions, this.types}) : super._();
  @override
  BindingFullApiHelp rebuild(
          void Function(BindingFullApiHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullApiHelpBuilder toBuilder() =>
      BindingFullApiHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullApiHelp &&
        events == other.events &&
        functions == other.functions &&
        types == other.types;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullApiHelp')
          ..add('events', events)
          ..add('functions', functions)
          ..add('types', types))
        .toString();
  }
}

class BindingFullApiHelpBuilder
    implements Builder<BindingFullApiHelp, BindingFullApiHelpBuilder> {
  _$BindingFullApiHelp? _$v;

  ListBuilder<BindingFullEventHelp>? _events;
  ListBuilder<BindingFullEventHelp> get events =>
      _$this._events ??= ListBuilder<BindingFullEventHelp>();
  set events(ListBuilder<BindingFullEventHelp>? events) =>
      _$this._events = events;

  ListBuilder<BindingFullFunctionHelp>? _functions;
  ListBuilder<BindingFullFunctionHelp> get functions =>
      _$this._functions ??= ListBuilder<BindingFullFunctionHelp>();
  set functions(ListBuilder<BindingFullFunctionHelp>? functions) =>
      _$this._functions = functions;

  ListBuilder<BindingFullTypeHelp>? _types;
  ListBuilder<BindingFullTypeHelp> get types =>
      _$this._types ??= ListBuilder<BindingFullTypeHelp>();
  set types(ListBuilder<BindingFullTypeHelp>? types) => _$this._types = types;

  BindingFullApiHelpBuilder() {
    BindingFullApiHelp._defaults(this);
  }

  BindingFullApiHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _events = $v.events?.toBuilder();
      _functions = $v.functions?.toBuilder();
      _types = $v.types?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullApiHelp other) {
    _$v = other as _$BindingFullApiHelp;
  }

  @override
  void update(void Function(BindingFullApiHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullApiHelp build() => _build();

  _$BindingFullApiHelp _build() {
    _$BindingFullApiHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullApiHelp._(
            events: _events?.build(),
            functions: _functions?.build(),
            types: _types?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'events';
        _events?.build();
        _$failedField = 'functions';
        _functions?.build();
        _$failedField = 'types';
        _types?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingFullApiHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
