// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_argument_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullArgumentHelp extends BindingFullArgumentHelp {
  @override
  final String? description;
  @override
  final String? name;
  @override
  final bool? optional;
  @override
  final BindingFullTypeIdentifier? type;

  factory _$BindingFullArgumentHelp(
          [void Function(BindingFullArgumentHelpBuilder)? updates]) =>
      (BindingFullArgumentHelpBuilder()..update(updates))._build();

  _$BindingFullArgumentHelp._(
      {this.description, this.name, this.optional, this.type})
      : super._();
  @override
  BindingFullArgumentHelp rebuild(
          void Function(BindingFullArgumentHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullArgumentHelpBuilder toBuilder() =>
      BindingFullArgumentHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullArgumentHelp &&
        description == other.description &&
        name == other.name &&
        optional == other.optional &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, optional.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullArgumentHelp')
          ..add('description', description)
          ..add('name', name)
          ..add('optional', optional)
          ..add('type', type))
        .toString();
  }
}

class BindingFullArgumentHelpBuilder
    implements
        Builder<BindingFullArgumentHelp, BindingFullArgumentHelpBuilder> {
  _$BindingFullArgumentHelp? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _optional;
  bool? get optional => _$this._optional;
  set optional(bool? optional) => _$this._optional = optional;

  BindingFullTypeIdentifierBuilder? _type;
  BindingFullTypeIdentifierBuilder get type =>
      _$this._type ??= BindingFullTypeIdentifierBuilder();
  set type(BindingFullTypeIdentifierBuilder? type) => _$this._type = type;

  BindingFullArgumentHelpBuilder() {
    BindingFullArgumentHelp._defaults(this);
  }

  BindingFullArgumentHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _name = $v.name;
      _optional = $v.optional;
      _type = $v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullArgumentHelp other) {
    _$v = other as _$BindingFullArgumentHelp;
  }

  @override
  void update(void Function(BindingFullArgumentHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullArgumentHelp build() => _build();

  _$BindingFullArgumentHelp _build() {
    _$BindingFullArgumentHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullArgumentHelp._(
            description: description,
            name: name,
            optional: optional,
            type: _type?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingFullArgumentHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
