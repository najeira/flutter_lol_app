import '../models/all_game_data.dart';
import '../models/item.dart';
import '../models/item_master.dart';
import '../models/player.dart';

class PlayerData {
  const PlayerData({required this.player, required this.power});

  final Player player;
  final double power;
}

/// AllGameData から全プレイヤーの強さを算出して返します。
List<PlayerData> computePlayersPower(
  AllGameData allGameData,
  ItemMaster itemMaster,
) {
  return allGameData.allPlayers.map((p) {
    return PlayerData(player: p, power: _computePlayerPower(p, itemMaster));
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
