// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector4f.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Vector4f extends Vector4f {
  @override
  final double? w;
  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? z;

  factory _$Vector4f([void Function(Vector4fBuilder)? updates]) =>
      (Vector4fBuilder()..update(updates))._build();

  _$Vector4f._({this.w, this.x, this.y, this.z}) : super._();
  @override
  Vector4f rebuild(void Function(Vector4fBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Vector4fBuilder toBuilder() => Vector4fBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vector4f &&
        w == other.w &&
        x == other.x &&
        y == other.y &&
        z == other.z;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, w.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, z.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Vector4f')
          ..add('w', w)
          ..add('x', x)
          ..add('y', y)
          ..add('z', z))
        .toString();
  }
}

class Vector4fBuilder implements Builder<Vector4f, Vector4fBuilder> {
  _$Vector4f? _$v;

  double? _w;
  double? get w => _$this._w;
  set w(double? w) => _$this._w = w;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  double? _z;
  double? get z => _$this._z;
  set z(double? z) => _$this._z = z;

  Vector4fBuilder() {
    Vector4f._defaults(this);
  }

  Vector4fBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _w = $v.w;
      _x = $v.x;
      _y = $v.y;
      _z = $v.z;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vector4f other) {
    _$v = other as _$Vector4f;
  }

  @override
  void update(void Function(Vector4fBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Vector4f build() => _build();

  _$Vector4f _build() {
    final _$result = _$v ??
        _$Vector4f._(
          w: w,
          x: x,
          y: y,
          z: z,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
