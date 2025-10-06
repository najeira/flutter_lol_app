import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

class WindowManagerListener with WindowListener {
  WindowManagerListener();

  Timer? _debounce;

  void _scheduleSave() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), _save);
  }

  Future<void> _save() async {
    // フルスクリーン/最大化を先に確認
    final isFull = await windowManager.isFullScreen();
    final isMax = await windowManager.isMaximized();

    // フルスクリーン・最大化時は bounds が論理値として不要なことも
    // ありますが、ここでは常に記録しておきます
    final size = await windowManager.getSize();
    final pos = await windowManager.getPosition();

    final state = WindowPreference(
      x: pos.dx,
      y: pos.dy,
      w: size.width,
      h: size.height,
      isMaximized: isMax,
      isFullScreen: isFull,
    );
    await state.saveToPrefs();
  }

  @override
  void onWindowMoved() => _scheduleSave();

  @override
  void onWindowResized() => _scheduleSave();

  @override
  void onWindowMaximize() => _scheduleSave();

  @override
  void onWindowUnmaximize() => _scheduleSave();

  @override
  void onWindowEnterFullScreen() => _scheduleSave();

  @override
  void onWindowLeaveFullScreen() => _scheduleSave();
}

class WindowPreference {
  const WindowPreference({
    this.x = 0.0,
    this.y = 0.0,
    this.w = 0.0,
    this.h = 0.0,
    this.isMaximized = false,
    this.isFullScreen = false,
  });

  static const String _prefsKey = 'win.state';

  final double x;
  final double y;
  final double w;
  final double h;
  final bool isMaximized;
  final bool isFullScreen;

  bool get hasBounds => w > 0.0 && h > 0.0;

  Rect toRect() => Rect.fromLTWH(x, y, w, h);

  Map<String, dynamic> toMap() => {
    'x': x,
    'y': y,
    'w': w,
    'h': h,
    'max': isMaximized,
    'full': isFullScreen,
  };

  factory WindowPreference.fromJson(Map<String, dynamic> json) {
    return WindowPreference(
      x: _toDouble(json['x']),
      y: _toDouble(json['y']),
      w: _toDouble(json['w']),
      h: _toDouble(json['h']),
      isMaximized: _toBool(json['max']),
      isFullScreen: _toBool(json['full']),
    );
  }

  Future<void> saveToPrefs() async {
    final str = json.encode(toMap());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, str);
  }

  static Future<WindowPreference> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString(_prefsKey);
    if (str == null || str.isEmpty) {
      return const WindowPreference();
    }
    try {
      final decoded = json.decode(str);
      if (decoded is Map<String, dynamic>) {
        return WindowPreference.fromJson(decoded);
      }
    } catch (_) {
      // ignore malformed data
    }
    return const WindowPreference();
  }
}

double _toDouble(dynamic v) {
  if (v is num) {
    return v.toDouble();
  }
  return 0.0;
}

bool _toBool(dynamic v) {
  if (v is bool) {
    return v;
  }
  return false;
}
