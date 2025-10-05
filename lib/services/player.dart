import 'dart:math' as math;

import 'package:collection/collection.dart';

import '../models/all_game_data.dart';
import '../models/item.dart';
import '../models/item_master.dart';
import '../models/player.dart';

class PlayerData {
  const PlayerData({
    required this.player,
    required this.power,
    required this.gold,
    required this.value,
  });

  final Player player;
  final int power;
  final int gold;
  final int value;
}

/// AllGameData から全プレイヤーの強さを算出して返します。
List<PlayerData> computePlayersPower(
  AllGameData allGameData,
  ItemMaster itemMaster,
) {
  // まず全プレイヤーのパワーを計算
  final powers = allGameData.allPlayers.map(
    (p) => _computePlayerPower(p, itemMaster),
  );

  // 平均値
  final totalPower = powers.fold(0.0, (a, b) => a + b.total);
  final averagePower = totalPower / powers.length;

  // 各スコアと平均値との差の2乗の合計（分散の分子）を求める
  final varianceSum = powers
      .map((e) => math.pow(e.total - averagePower, 2))
      .reduce((a, b) => a + b);

  // 分散
  final variance = varianceSum / powers.length;

  // 標準偏差
  final stddev = math.sqrt(variance);

  return powers.mapIndexed((i, e) {
    final player = allGameData.allPlayers[i];
    return PlayerData(
      player: player,
      power: e.total,
      gold: e.gold,
      value: _deviation(e.total, averagePower, stddev).round(),
    );
  }).toList();
}

class Power {
  Power({required this.items, required this.level, required this.gold});

  final int items;
  final int level;
  final int gold;

  int get total => items + level;
}

/// 単一プレイヤーの強さを算出します。
Power _computePlayerPower(Player player, ItemMaster itemMaster) {
  double itemsPower = 0.0;
  int itemsGold = 0;
  for (final item in player.items) {
    itemsPower += _powerOfItem(item, itemMaster);
    itemsGold += _goldOfItem(item, itemMaster);
  }
  final levelPower = _levelScores[player.level - 1];
  return Power(items: itemsPower.round(), level: levelPower, gold: itemsGold);
}

extension ItemExtension on Item {
  int get priceTotal => price * math.max(count, 1);
}

int _goldOfItem(Item item, ItemMaster master) {
  final data = master[item.itemID];
  if (data == null) {
    return item.priceTotal;
  }
  return data.gold.total;
}

double _powerOfItem(Item item, ItemMaster master) {
  final data = master[item.itemID];
  if (data == null) {
    return item.priceTotal.toDouble();
  }

  final price = data.gold.total.toDouble();
  if (data.depth <= 0 || data.consumed) {
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

const _levelScores = <int>[
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

double _deviation(int score, double mean, double stddev) {
  // 標準偏差が小さすぎる場合の過剰な振れを抑えるため、最小値で下駄を履かせる
  const floor = 1000.0;
  // final safeStddev = math.sqrt(stddev * stddev + floor * floor);
  final safeStddev = math.max(stddev, floor);
  return (score.toDouble() - mean) / safeStddev * 10.0 + 50.0;
}
