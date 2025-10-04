// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector3f.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Vector3f extends Vector3f {
  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? z;

  factory _$Vector3f([void Function(Vector3fBuilder)? updates]) =>
      (Vector3fBuilder()..update(updates))._build();

  _$Vector3f._({this.x, this.y, this.z}) : super._();
  @override
  Vector3f rebuild(void Function(Vector3fBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Vector3fBuilder toBuilder() => Vector3fBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vector3f && x == other.x && y == other.y && z == other.z;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, z.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Vector3f')
          ..add('x', x)
          ..add('y', y)
          ..add('z', z))
        .toString();
  }
}

class Vector3fBuilder implements Builder<Vector3f, Vector3fBuilder> {
  _$Vector3f? _$v;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  double? _z;
  double? get z => _$this._z;
  set z(double? z) => _$this._z = z;

  Vector3fBuilder() {
    Vector3f._defaults(this);
  }

  Vector3fBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _z = $v.z;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vector3f other) {
    _$v = other as _$Vector3f;
  }

  @override
  void update(void Function(Vector3fBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Vector3f build() => _build();

  _$Vector3f _build() {
    final _$result = _$v ??
        _$Vector3f._(
          x: x,
          y: y,
          z: z,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
