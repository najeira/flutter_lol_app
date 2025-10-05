import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'screens/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    size: Size(300, 800),
    title: "LoL Live Helper",
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    // await windowManager.focus();
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoL Live Game Helper',
      theme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const LiveGameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
