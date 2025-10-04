// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_full_type_identifier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BindingFullTypeIdentifier extends BindingFullTypeIdentifier {
  @override
  final String? elementType;
  @override
  final String? type;

  factory _$BindingFullTypeIdentifier(
          [void Function(BindingFullTypeIdentifierBuilder)? updates]) =>
      (BindingFullTypeIdentifierBuilder()..update(updates))._build();

  _$BindingFullTypeIdentifier._({this.elementType, this.type}) : super._();
  @override
  BindingFullTypeIdentifier rebuild(
          void Function(BindingFullTypeIdentifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BindingFullTypeIdentifierBuilder toBuilder() =>
      BindingFullTypeIdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BindingFullTypeIdentifier &&
        elementType == other.elementType &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, elementType.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BindingFullTypeIdentifier')
          ..add('elementType', elementType)
          ..add('type', type))
        .toString();
  }
}

class BindingFullTypeIdentifierBuilder
    implements
        Builder<BindingFullTypeIdentifier, BindingFullTypeIdentifierBuilder> {
  _$BindingFullTypeIdentifier? _$v;

  String? _elementType;
  String? get elementType => _$this._elementType;
  set elementType(String? elementType) => _$this._elementType = elementType;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  BindingFullTypeIdentifierBuilder() {
    BindingFullTypeIdentifier._defaults(this);
  }

  BindingFullTypeIdentifierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _elementType = $v.elementType;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BindingFullTypeIdentifier other) {
    _$v = other as _$BindingFullTypeIdentifier;
  }

  @override
  void update(void Function(BindingFullTypeIdentifierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BindingFullTypeIdentifier build() => _build();

  _$BindingFullTypeIdentifier _build() {
    final _$result = _$v ??
        _$BindingFullTypeIdentifier._(
          elementType: elementType,
          type: type,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
