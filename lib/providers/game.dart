import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/all_game_data.dart';
import '../services/game.dart';

const _kRefreshInterval = Duration(seconds: 2);
const _kMaxIntervalSecs = 30;

// Emits latest game data by polling getAllGameData periodically.
final gameDataProvider =
    AsyncNotifierProvider.autoDispose<GameDataNotifier, AllGameData>(() {
      return GameDataNotifier();
    });

class GameDataNotifier extends AutoDisposeAsyncNotifier<AllGameData> {
  Timer? _timer;
  Duration _interval = _kRefreshInterval;

  @override
  Future<AllGameData> build() async {
    try {
      final data = await getAllGameData();
      // 成功したら間隔をリセット
      _interval = _kRefreshInterval;
      return AllGameData.fromJson(data);
    } catch (e, st) {
      debugPrint(e.toString());
      // 失敗: 次回のポーリング間隔を指数バックオフ
      final doubled = _interval.inSeconds * 2;
      final secs = math.min(doubled, _kMaxIntervalSecs);
      _interval = Duration(seconds: secs);
      // エラーはそのまま投げる（UI で `error` として受け取れる）
      Error.throwWithStackTrace(e, st);
    } finally {
      _scheduleNextRefresh();
    }
  }

  void _startTimer() {
    // ignore: prefer_conditional_assignment
    if (_timer == null) {
      _timer = Timer(_interval, () {
        // 自分自身を無効化して build をやり直す
        ref.invalidateSelf();
      });
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _scheduleNextRefresh() {
    // 既存タイマーをキャンセルしてから再予約
    _cancelTimer();

    // Provider 破棄時にタイマー後始末
    ref.onDispose(_cancelTimer);

    // 購読が無ければ停止
    ref.onCancel(_cancelTimer);

    // 再購読で再開
    ref.onResume(_startTimer);

    _startTimer();
  }

  // 手動で即時更新したいときに使えるヘルパー
  void refreshNow() {
    _cancelTimer();
    _interval = _kRefreshInterval; // 次回は通常間隔から再開
    ref.invalidateSelf();
  }
}
