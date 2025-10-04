import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/live_client_service.dart';

/// DI: Service provider
final liveClientServiceProvider = Provider<LiveClientService>((ref) {
  return LiveClientService();
});

class LiveGameData {
  LiveGameData({
    required this.players,
    required this.gameStats,
    required this.activePlayerName,
  });

  final List<dynamic> players;
  final Map<String, dynamic> gameStats;
  final String? activePlayerName;
}

/// Manages fetching and periodic refreshing of live game data.
class LiveGameNotifier extends AsyncNotifier<LiveGameData?> {
  Timer? _timer;

  @override
  Future<LiveGameData?> build() async {
    // Start periodic refresh
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      // silent background refresh; ignore errors
      _refreshSilently();
    });
    ref.onDispose(() {
      _timer?.cancel();
    });

    return _fetch();
  }

  Future<LiveGameData?> _fetch() async {
    final service = ref.read(liveClientServiceProvider);
    final results = await Future.wait([
      service.getPlayerList(),
      service.getGameStats(),
      service.getActivePlayerName(),
    ]);
    return LiveGameData(
      players: results[0] as List<dynamic>,
      gameStats: results[1] as Map<String, dynamic>,
      activePlayerName: results[2] as String?,
    );
  }

  Future<void> refresh() async {
    // Expose manual refresh for pull-to-refresh and button
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }

  Future<void> _refreshSilently() async {
    try {
      final data = await _fetch();
      // Do not show loading; just replace data.
      state = AsyncData(data);
    } catch (_) {
      // ignore background refresh errors
    }
  }
}

final liveGameProvider = AsyncNotifierProvider<LiveGameNotifier, LiveGameData?>(
  LiveGameNotifier.new,
);
