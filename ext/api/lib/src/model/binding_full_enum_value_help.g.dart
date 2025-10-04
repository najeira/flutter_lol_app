// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_enum_value_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullEnumValueHelp extends BindingFullEnumValueHelp {
  @override
  final String? description;
  @override
  final String? name;
  @override
  final int? value;

  factory _$BindingFullEnumValueHelp(
          [void Function(BindingFullEnumValueHelpBuilder)? updates]) =>
      (BindingFullEnumValueHelpBuilder()..update(updates))._build();

  _$BindingFullEnumValueHelp._({this.description, this.name, this.value})
      : super._();
  @override
  BindingFullEnumValueHelp rebuild(
          void Function(BindingFullEnumValueHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullEnumValueHelpBuilder toBuilder() =>
      BindingFullEnumValueHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullEnumValueHelp &&
        description == other.description &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullEnumValueHelp')
          ..add('description', description)
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class BindingFullEnumValueHelpBuilder
    implements
        Builder<BindingFullEnumValueHelp, BindingFullEnumValueHelpBuilder> {
  _$BindingFullEnumValueHelp? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  BindingFullEnumValueHelpBuilder() {
    BindingFullEnumValueHelp._defaults(this);
  }

  BindingFullEnumValueHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullEnumValueHelp other) {
    _$v = other as _$BindingFullEnumValueHelp;
  }

  @override
  void update(void Function(BindingFullEnumValueHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullEnumValueHelp build() => _build();

  _$BindingFullEnumValueHelp _build() {
    final _$result = _$v ??
        _$BindingFullEnumValueHelp._(
          description: description,
          name: name,
          value: value,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
