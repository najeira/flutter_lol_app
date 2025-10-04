// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector2f.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Vector2f extends Vector2f {
  @override
  final double? x;
  @override
  final double? y;

  factory _$Vector2f([void Function(Vector2fBuilder)? updates]) =>
      (Vector2fBuilder()..update(updates))._build();

  _$Vector2f._({this.x, this.y}) : super._();
  @override
  Vector2f rebuild(void Function(Vector2fBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Vector2fBuilder toBuilder() => Vector2fBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vector2f && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Vector2f')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class Vector2fBuilder implements Builder<Vector2f, Vector2fBuilder> {
  _$Vector2f? _$v;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  Vector2fBuilder() {
    Vector2f._defaults(this);
  }

  Vector2fBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vector2f other) {
    _$v = other as _$Vector2f;
  }

  @override
  void update(void Function(Vector2fBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Vector2f build() => _build();

  _$Vector2f _build() {
    final _$result = _$v ??
        _$Vector2f._(
          x: x,
          y: y,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
