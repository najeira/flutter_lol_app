import 'dart:math' as math;

import '../models/all_game_data.dart';
import '../models/item.dart';
import '../models/item_master.dart';
import '../models/player.dart';

class PlayerData {
  const PlayerData({
    required this.player,
    required this.power,
    required this.value,
  });

  final Player player;
  final double power;
  final double value;
}

/// AllGameData から全プレイヤーの強さを算出して返します。
List<PlayerData> computePlayersPower(
  AllGameData allGameData,
  ItemMaster itemMaster,
) {
  final entries = allGameData.allPlayers.map((p) {
    return MapEntry(p, _computePlayerPower(p, itemMaster));
  });

  // 平均値
  final totalPower = entries.fold(0.0, (a, b) => a + b.value);
  final averagePower = totalPower / entries.length;

  // 各スコアと平均値との差の2乗の合計（分散の分子）を求める
  final varianceSum = entries
      .map((e) => math.pow(e.value - averagePower, 2))
      .reduce((a, b) => a + b);

  // 分散
  final variance = varianceSum / entries.length;

  // 標準偏差
  final stddev = math.sqrt(variance);

  return entries.map((e) {
    final value = _deviation(e.value, averagePower, stddev);
    return PlayerData(
      player: e.key,
      power: e.value,
      value: value,
    );
  }).toList();
}

/// 単一プレイヤーの強さを算出します。
double _computePlayerPower(Player player, ItemMaster itemMaster) {
  final itemsPower = player.items
      .map((it) => _entryForItem(it, itemMaster))
      .reduce((a, b) => a + b);
  final levelPower = _levelScores[player.level - 1];
  return itemsPower + levelPower;
}

double _entryForItem(Item item, ItemMaster master) {
  final data = master[item.itemID];
  if (data == null) {
    return 0.0;
  }

  // 消費アイテムは計算しない
  if (data.consumed) {
    return 0.0;
  }

  final price = data.gold.total.toDouble();
  if (data.depth <= 0) {
    return price;
  }

  switch (data.depth) {
    case 3:
      return price * 1.16;
    case 2:
      return price * 1.08;
    default:
      return price;
  }
}

final _levelScores = <int>[
  0,
  350,
  700,
  1075,
  1450,
  2450,
  2850,
  3250,
  3650,
  4050,
  4750,
  5200,
  5650,
  6100,
  6550,
  7250,
  7650,
  8050,
];

double _deviation(double score, double mean, double stddev) {
  // 標準偏差が0の場合（全員が同じスコアなど）は、偏差値は50
  if (stddev == 0) {
    return 50.0;
  }
  return (score - mean) / stddev * 10 + 50;
}
