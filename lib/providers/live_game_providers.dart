import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/all_game_data.dart';
import '../services/live_client_service.dart';

const _kRefreshInterval = Duration(seconds: 3);

// Emits latest live game data by polling getAllGameData periodically.
// Poll interval: 2 seconds.
final gameDataProvider = StreamProvider.autoDispose<AllGameData>((ref) async* {
  final controller = StreamController<AllGameData>();
  Timer? timer;

  Future<void> fetch() async {
    await _fetch(controller);
  }

  Future<void> start() async {
    if (timer == null) {
      await fetch();
      timer = Timer.periodic(_kRefreshInterval, (_) => fetch());
    }
  }

  // 初回開始
  await start();

  // 購読が無ければ停止
  ref.onCancel(() {
    timer?.cancel();
    timer = null;
  });

  // 再購読で再開
  ref.onResume(start);

  ref.onDispose(() {
    timer?.cancel();
    timer = null;
    controller.close();
  });

  yield* controller.stream;
});

Future<void> _fetch(StreamSink<AllGameData> sink) async {
  try {
    final data = await getAllGameData();
    sink.add(AllGameData.fromJson(data));
  } catch (e, st) {
    sink.addError(e, st);
  }
}
