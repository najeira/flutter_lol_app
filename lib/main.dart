import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'screens/game.dart';
import 'services/window.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 読み込みを開始しておく
  unawaited(SharedPreferences.getInstance());

  // Window
  await windowManager.ensureInitialized();
  await windowManager.waitUntilReadyToShow(
    const WindowOptions(size: Size(300, 800), title: "Rift Pulse"),
    _onWindowReady,
  );

  // 以降の変更を監視して保存
  windowManager.addListener(WindowManagerListener());

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _onWindowReady() async {
  final ws = await WindowPreference.loadFromPrefs();

  // 保存済みの位置・サイズがあれば適用（表示前/直後に適用するのが自然）
  if (ws.hasBounds) {
    await windowManager.setBounds(ws.toRect(), animate: false);
  }

  // 最大化/フルスクリーンの復元は bounds より後に
  if (ws.isFullScreen) {
    await windowManager.setFullScreen(true);
  } else if (ws.isMaximized) {
    await windowManager.maximize();
  }

  await windowManager.show();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rift Pulse',
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const LiveGameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
