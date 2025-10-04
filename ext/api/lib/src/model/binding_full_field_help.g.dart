// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_field_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullFieldHelp extends BindingFullFieldHelp {
  @override
  final String? description;
  @override
  final String? name;
  @override
  final int? offset;
  @override
  final bool? optional;
  @override
  final BindingFullTypeIdentifier? type;

  factory _$BindingFullFieldHelp(
          [void Function(BindingFullFieldHelpBuilder)? updates]) =>
      (BindingFullFieldHelpBuilder()..update(updates))._build();

  _$BindingFullFieldHelp._(
      {this.description, this.name, this.offset, this.optional, this.type})
      : super._();
  @override
  BindingFullFieldHelp rebuild(
          void Function(BindingFullFieldHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullFieldHelpBuilder toBuilder() =>
      BindingFullFieldHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullFieldHelp &&
        description == other.description &&
        name == other.name &&
        offset == other.offset &&
        optional == other.optional &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, optional.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullFieldHelp')
          ..add('description', description)
          ..add('name', name)
          ..add('offset', offset)
          ..add('optional', optional)
          ..add('type', type))
        .toString();
  }
}

class BindingFullFieldHelpBuilder
    implements Builder<BindingFullFieldHelp, BindingFullFieldHelpBuilder> {
  _$BindingFullFieldHelp? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  bool? _optional;
  bool? get optional => _$this._optional;
  set optional(bool? optional) => _$this._optional = optional;

  BindingFullTypeIdentifierBuilder? _type;
  BindingFullTypeIdentifierBuilder get type =>
      _$this._type ??= BindingFullTypeIdentifierBuilder();
  set type(BindingFullTypeIdentifierBuilder? type) => _$this._type = type;

  BindingFullFieldHelpBuilder() {
    BindingFullFieldHelp._defaults(this);
  }

  BindingFullFieldHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _name = $v.name;
      _offset = $v.offset;
      _optional = $v.optional;
      _type = $v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullFieldHelp other) {
    _$v = other as _$BindingFullFieldHelp;
  }

  @override
  void update(void Function(BindingFullFieldHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullFieldHelp build() => _build();

  _$BindingFullFieldHelp _build() {
    _$BindingFullFieldHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullFieldHelp._(
            description: description,
            name: name,
            offset: offset,
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
            r'BindingFullFieldHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
