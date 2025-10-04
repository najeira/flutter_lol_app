// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_function_help.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullFunctionHelp extends BindingFullFunctionHelp {
  @override
  final BuiltList<BindingFullArgumentHelp>? arguments;
  @override
  final String? async_;
  @override
  final String? description;
  @override
  final String? help;
  @override
  final String? name;
  @override
  final String? nameSpace;
  @override
  final BindingFullTypeIdentifier? returns;
  @override
  final BuiltList<String>? tags;
  @override
  final bool? threadSafe;

  factory _$BindingFullFunctionHelp(
          [void Function(BindingFullFunctionHelpBuilder)? updates]) =>
      (BindingFullFunctionHelpBuilder()..update(updates))._build();

  _$BindingFullFunctionHelp._(
      {this.arguments,
      this.async_,
      this.description,
      this.help,
      this.name,
      this.nameSpace,
      this.returns,
      this.tags,
      this.threadSafe})
      : super._();
  @override
  BindingFullFunctionHelp rebuild(
          void Function(BindingFullFunctionHelpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullFunctionHelpBuilder toBuilder() =>
      BindingFullFunctionHelpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullFunctionHelp &&
        arguments == other.arguments &&
        async_ == other.async_ &&
        description == other.description &&
        help == other.help &&
        name == other.name &&
        nameSpace == other.nameSpace &&
        returns == other.returns &&
        tags == other.tags &&
        threadSafe == other.threadSafe;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, arguments.hashCode);
    _$hash = $jc(_$hash, async_.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, help.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameSpace.hashCode);
    _$hash = $jc(_$hash, returns.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, threadSafe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullFunctionHelp')
          ..add('arguments', arguments)
          ..add('async_', async_)
          ..add('description', description)
          ..add('help', help)
          ..add('name', name)
          ..add('nameSpace', nameSpace)
          ..add('returns', returns)
          ..add('tags', tags)
          ..add('threadSafe', threadSafe))
        .toString();
  }
}

class BindingFullFunctionHelpBuilder
    implements
        Builder<BindingFullFunctionHelp, BindingFullFunctionHelpBuilder> {
  _$BindingFullFunctionHelp? _$v;

  ListBuilder<BindingFullArgumentHelp>? _arguments;
  ListBuilder<BindingFullArgumentHelp> get arguments =>
      _$this._arguments ??= ListBuilder<BindingFullArgumentHelp>();
  set arguments(ListBuilder<BindingFullArgumentHelp>? arguments) =>
      _$this._arguments = arguments;

  String? _async_;
  String? get async_ => _$this._async_;
  set async_(String? async_) => _$this._async_ = async_;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _help;
  String? get help => _$this._help;
  set help(String? help) => _$this._help = help;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameSpace;
  String? get nameSpace => _$this._nameSpace;
  set nameSpace(String? nameSpace) => _$this._nameSpace = nameSpace;

  BindingFullTypeIdentifierBuilder? _returns;
  BindingFullTypeIdentifierBuilder get returns =>
      _$this._returns ??= BindingFullTypeIdentifierBuilder();
  set returns(BindingFullTypeIdentifierBuilder? returns) =>
      _$this._returns = returns;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  bool? _threadSafe;
  bool? get threadSafe => _$this._threadSafe;
  set threadSafe(bool? threadSafe) => _$this._threadSafe = threadSafe;

  BindingFullFunctionHelpBuilder() {
    BindingFullFunctionHelp._defaults(this);
  }

  BindingFullFunctionHelpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _arguments = $v.arguments?.toBuilder();
      _async_ = $v.async_;
      _description = $v.description;
      _help = $v.help;
      _name = $v.name;
      _nameSpace = $v.nameSpace;
      _returns = $v.returns?.toBuilder();
      _tags = $v.tags?.toBuilder();
      _threadSafe = $v.threadSafe;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullFunctionHelp other) {
    _$v = other as _$BindingFullFunctionHelp;
  }

  @override
  void update(void Function(BindingFullFunctionHelpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullFunctionHelp build() => _build();

  _$BindingFullFunctionHelp _build() {
    _$BindingFullFunctionHelp _$result;
    try {
      _$result = _$v ??
          _$BindingFullFunctionHelp._(
            arguments: _arguments?.build(),
            async_: async_,
            description: description,
            help: help,
            name: name,
            nameSpace: nameSpace,
            returns: _returns?.build(),
            tags: _tags?.build(),
            threadSafe: threadSafe,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'arguments';
        _arguments?.build();

        _$failedField = 'returns';
        _returns?.build();
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BindingFullFunctionHelp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
