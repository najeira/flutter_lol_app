// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_type_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullTypeHelp extends BindingFullTypeHelp {
  @override
  final String? description;
  @override
  final BuiltList<BindingFullFieldHelp>? fields;
  @override
  final String? name;
  @override
  final String? nameSpace;
  @override
  final int? size;
  @override
  final BuiltList<String>? tags;
  @override
  final BuiltList<BindingFullEnumValueHelp>? values;

  factory _$BindingFullTypeHelp(
          [void Function(BindingFullTypeHelpBuilder)? updates]) =>
      (BindingFullTypeHelpBuilder()..update(updates))._build();

  _$BindingFullTypeHelp._(
      {this.description,
      this.fields,
      this.name,
      this.nameSpace,
      this.size,
      this.tags,
      this.values})
      : super._();
  @override
  BindingFullTypeHelp rebuild(
          void Function(BindingFullTypeHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullTypeHelpBuilder toBuilder() =>
      BindingFullTypeHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullTypeHelp &&
        description == other.description &&
        fields == other.fields &&
        name == other.name &&
        nameSpace == other.nameSpace &&
        size == other.size &&
        tags == other.tags &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameSpace.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullTypeHelp')
          ..add('description', description)
          ..add('fields', fields)
          ..add('name', name)
          ..add('nameSpace', nameSpace)
          ..add('size', size)
          ..add('tags', tags)
          ..add('values', values))
        .toString();
  }
}

class BindingFullTypeHelpBuilder
    implements Builder<BindingFullTypeHelp, BindingFullTypeHelpBuilder> {
  _$BindingFullTypeHelp? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<BindingFullFieldHelp>? _fields;
  ListBuilder<BindingFullFieldHelp> get fields =>
      _$this._fields ??= ListBuilder<BindingFullFieldHelp>();
  set fields(ListBuilder<BindingFullFieldHelp>? fields) =>
      _$this._fields = fields;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameSpace;
  String? get nameSpace => _$this._nameSpace;
  set nameSpace(String? nameSpace) => _$this._nameSpace = nameSpace;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  ListBuilder<BindingFullEnumValueHelp>? _values;
  ListBuilder<BindingFullEnumValueHelp> get values =>
      _$this._values ??= ListBuilder<BindingFullEnumValueHelp>();
  set values(ListBuilder<BindingFullEnumValueHelp>? values) =>
      _$this._values = values;

  BindingFullTypeHelpBuilder() {
    BindingFullTypeHelp._defaults(this);
  }

  BindingFullTypeHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _fields = $v.fields?.toBuilder();
      _name = $v.name;
      _nameSpace = $v.nameSpace;
      _size = $v.size;
      _tags = $v.tags?.toBuilder();
      _values = $v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullTypeHelp other) {
    _$v = other as _$BindingFullTypeHelp;
  }

  @override
  void update(void Function(BindingFullTypeHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullTypeHelp build() => _build();

  _$BindingFullTypeHelp _build() {
    _$BindingFullTypeHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullTypeHelp._(
            description: description,
            fields: _fields?.build(),
            name: name,
            nameSpace: nameSpace,
            size: size,
            tags: _tags?.build(),
            values: _values?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();

        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingFullTypeHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
