// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_event_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullEventHelp extends BindingFullEventHelp {
  @override
  final String? description;
  @override
  final String? name;
  @override
  final String? nameSpace;
  @override
  final BuiltList<String>? tags;
  @override
  final BindingFullTypeIdentifier? type;

  factory _$BindingFullEventHelp(
          [void Function(BindingFullEventHelpBuilder)? updates]) =>
      (BindingFullEventHelpBuilder()..update(updates))._build();

  _$BindingFullEventHelp._(
      {this.description, this.name, this.nameSpace, this.tags, this.type})
      : super._();
  @override
  BindingFullEventHelp rebuild(
          void Function(BindingFullEventHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullEventHelpBuilder toBuilder() =>
      BindingFullEventHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullEventHelp &&
        description == other.description &&
        name == other.name &&
        nameSpace == other.nameSpace &&
        tags == other.tags &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameSpace.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullEventHelp')
          ..add('description', description)
          ..add('name', name)
          ..add('nameSpace', nameSpace)
          ..add('tags', tags)
          ..add('type', type))
        .toString();
  }
}

class BindingFullEventHelpBuilder
    implements Builder<BindingFullEventHelp, BindingFullEventHelpBuilder> {
  _$BindingFullEventHelp? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameSpace;
  String? get nameSpace => _$this._nameSpace;
  set nameSpace(String? nameSpace) => _$this._nameSpace = nameSpace;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  BindingFullTypeIdentifierBuilder? _type;
  BindingFullTypeIdentifierBuilder get type =>
      _$this._type ??= BindingFullTypeIdentifierBuilder();
  set type(BindingFullTypeIdentifierBuilder? type) => _$this._type = type;

  BindingFullEventHelpBuilder() {
    BindingFullEventHelp._defaults(this);
  }

  BindingFullEventHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _name = $v.name;
      _nameSpace = $v.nameSpace;
      _tags = $v.tags?.toBuilder();
      _type = $v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullEventHelp other) {
    _$v = other as _$BindingFullEventHelp;
  }

  @override
  void update(void Function(BindingFullEventHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullEventHelp build() => _build();

  _$BindingFullEventHelp _build() {
    _$BindingFullEventHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullEventHelp._(
            description: description,
            name: name,
            nameSpace: nameSpace,
            tags: _tags?.build(),
            type: _type?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingFullEventHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
