import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player.dart';
import '../providers/game.dart';
import '../services/player.dart';

import 'item.dart';

final playersProvider = Provider.autoDispose<AsyncValue<List<PlayerData>>>((
  ref,
) {
  final itemMaster = ref.watch(itemMasterProvider);
  final gameData = ref.watch(gameDataProvider);
  return itemMaster.when(
    data: (im) => gameData.when(
      data: (gd) => AsyncData(computePlayersPower(gd, im)),
      loading: () => AsyncLoading(),
      error: (error, stackTrace) => AsyncError(error, stackTrace),
    ),
    loading: () => AsyncLoading(),
    error: (error, stackTrace) => AsyncError(error, stackTrace),
  );
});

const _orderIndex = {
  'TOP': 0,
  'JUNGLE': 1,
  'MIDDLE': 2,
  'BOTTOM': 3,
  'UTILITY': 4,
};

int _positionOrder(Player p) {
  final pos = p.position.toUpperCase();
  return _orderIndex[pos] ?? _orderIndex.length;
}

extension PlayerExtension on Player {
  int get positionOrder {
    return _positionOrder(this);
  }
}

/// playersProvider を監視し、team ごとにプレイヤーを分割し、
/// かつ position の順番 (TOP, JUNGLE, MID, BOT, SUPPORT, NONE) でソートした結果を返します。
final playersByTeamProvider =
    Provider.autoDispose<AsyncValue<List<List<PlayerData>>>>((ref) {
      final playersAsync = ref.watch(playersProvider);
      return playersAsync.when(
        data: (players) {
          final grouped = <String, List<PlayerData>>{};
          for (final pd in players) {
            final team = pd.player.team.toUpperCase();
            grouped.putIfAbsent(team, () => <PlayerData>[]).add(pd);
          }

          // Sort each team list by position order
          final rows = grouped.values.toList();
          for (final row in rows) {
            row.sort(
              (a, b) =>
                  a.player.positionOrder.compareTo(b.player.positionOrder),
            );
          }

          return AsyncData(rows);
        },
        loading: () => const AsyncLoading(),
        error: (e, st) => AsyncError(e, st),
      );
    });
