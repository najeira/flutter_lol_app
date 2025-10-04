import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/all_game_data.dart';
import '../services/live_client_service.dart';

const _kRefreshInterval = Duration(seconds: 3);

// Emits latest game data by polling getAllGameData periodically.
final gameDataProvider = StreamProvider.autoDispose<AllGameData>((ref) async* {
  final controller = StreamController<AllGameData>();

  // one-shot timer to schedule next tick after current finishes
  Timer? timer;

  // whether the polling loop should continue
  bool running = false;

  Future<void> tick() async {
    await _fetch(controller);

    // Schedule next tick only after the current one completes
    if (running) {
      timer?.cancel();
      timer = Timer(_kRefreshInterval, tick);
    }
  }

  Future<void> start() async {
    if (!running) {
      running = true;
      await tick();
    }
  }

  void stop() {
    running = false;
    timer?.cancel();
    timer = null;
  }

  // 初回開始
  await start();

  // 購読が無ければ停止
  ref.onCancel(() {
    stop();
  });

  // 再購読で再開
  ref.onResume(start);

  ref.onDispose(() {
    stop();
    controller.close();
  });

  yield* controller.stream;
});

Future<void> _fetch(StreamController<AllGameData> controller) async {
  // If the provider is disposed while a fetch is in-flight, the controller may be
  // closed before we try to emit. Guard against adding to a closed controller.
  if (controller.isClosed) {
    return;
  }

  try {
    final data = await getAllGameData();
    if (!controller.isClosed) {
      controller.add(AllGameData.fromJson(data));
    }
  } catch (e, st) {
    debugPrint(e.toString());
    if (!controller.isClosed) {
      controller.addError(e, st);
    }
  }
}
