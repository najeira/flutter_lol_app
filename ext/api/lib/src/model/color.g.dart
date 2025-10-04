// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Color extends Color {
  @override
  final int? a;
  @override
  final int? b;
  @override
  final int? g;
  @override
  final int? r;

  factory _$Color([void Function(ColorBuilder)? updates]) =>
      (ColorBuilder()..update(updates))._build();

  _$Color._({this.a, this.b, this.g, this.r}) : super._();
  @override
  Color rebuild(void Function(ColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColorBuilder toBuilder() => ColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Color &&
        a == other.a &&
        b == other.b &&
        g == other.g &&
        r == other.r;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, a.hashCode);
    _$hash = $jc(_$hash, b.hashCode);
    _$hash = $jc(_$hash, g.hashCode);
    _$hash = $jc(_$hash, r.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Color')
          ..add('a', a)
          ..add('b', b)
          ..add('g', g)
          ..add('r', r))
        .toString();
  }
}

class ColorBuilder implements Builder<Color, ColorBuilder> {
  _$Color? _$v;

  int? _a;
  int? get a => _$this._a;
  set a(int? a) => _$this._a = a;

  int? _b;
  int? get b => _$this._b;
  set b(int? b) => _$this._b = b;

  int? _g;
  int? get g => _$this._g;
  set g(int? g) => _$this._g = g;

  int? _r;
  int? get r => _$this._r;
  set r(int? r) => _$this._r = r;

  ColorBuilder() {
    Color._defaults(this);
  }

  ColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _a = $v.a;
      _b = $v.b;
      _g = $v.g;
      _r = $v.r;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Color other) {
    _$v = other as _$Color;
  }

  @override
  void update(void Function(ColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Color build() => _build();

  _$Color _build() {
    final _$result = _$v ??
        _$Color._(
          a: a,
          b: b,
          g: g,
          r: r,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
