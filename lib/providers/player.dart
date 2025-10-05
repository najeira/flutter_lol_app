import 'package:flutter_riverpod/flutter_riverpod.dart';

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
