import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player.dart';
import '../providers/game.dart';
import '../services/player.dart';

import 'item.dart';

const _orderIndex = {
  'TOP': 0,
  'JUNGLE': 1,
  'MIDDLE': 2,
  'BOTTOM': 3,
  'UTILITY': 4,
};

final _allPlayersProvider = Provider.autoDispose<AsyncValue<List<PlayerData>>>((
  ref,
) {
  final itemMaster = ref.watch(itemMasterProvider);
  final gameData = ref.watch(gameDataProvider);
  return itemMaster.when(
    skipLoadingOnReload: true,
    skipLoadingOnRefresh: true,
    skipError: true,
    data: (im) => gameData.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: true,
      skipError: true,
      data: (gd) => AsyncData(computePlayersPower(gd, im)),
      loading: () => AsyncLoading(),
      error: (error, stackTrace) => AsyncError(error, stackTrace),
    ),
    loading: () => AsyncLoading(),
    error: (error, stackTrace) => AsyncError(error, stackTrace),
  );
});

extension PlayerExtension on Player {
  int get positionOrder {
    final pos = position.toUpperCase();
    return _orderIndex[pos] ?? _orderIndex.length;
  }
}

class PlayersData {
  const PlayersData({required this.blue, required this.red});

  final List<PlayerData> blue;
  final List<PlayerData> red;

  bool get isEmpty {
    return blue.isEmpty && red.isEmpty;
  }
}

/// _allPlayersProvider を監視し、team ごとにプレイヤーを分割し、
/// かつ position の順番でソートした結果を返します。
final playersProvider = Provider.autoDispose<AsyncValue<PlayersData>>((
  ref,
) {
  final playersAsync = ref.watch(_allPlayersProvider);
  return playersAsync.when(
    data: (players) {
      final blue = <PlayerData>[];
      final red = <PlayerData>[];

      for (final p in players) {
        final team = p.player.team.toUpperCase();
        if (team == "ORDER") {
          blue.add(p);
        } else {
          red.add(p);
        }
      }

      // Sort each team list by position order
      blue.sort(_compare);
      red.sort(_compare);
      return AsyncData(PlayersData(blue: blue, red: red));
    },
    loading: () => const AsyncLoading(),
    error: (e, st) => AsyncError(e, st),
  );
});

int _compare(PlayerData a, PlayerData b) {
  return a.player.positionOrder.compareTo(b.player.positionOrder);
}
