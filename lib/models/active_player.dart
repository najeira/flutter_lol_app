import '../utils/json.dart';
import 'abilities.dart';
import 'champion_stats.dart';
import 'full_runes.dart';

class ActivePlayer {
  const ActivePlayer({
    required this.abilities,
    required this.championStats,
    required this.currentGold,
    required this.fullRunes,
    required this.level,
    required this.riotId,
    required this.riotIdGameName,
    required this.riotIdTagLine,
    required this.summonerName,
    required this.teamRelativeColors,
  });

  final Abilities abilities;
  final ChampionStats championStats;
  final num currentGold;
  final FullRunes fullRunes;
  final int level;
  final String riotId;
  final String riotIdGameName;
  final String riotIdTagLine;
  final String summonerName;
  final bool teamRelativeColors;

  factory ActivePlayer.fromJson(Map<String, dynamic> json) {
    return ActivePlayer(
      abilities: Abilities.fromJson(asMap(json['abilities'])),
      championStats: ChampionStats.fromJson(asMap(json['championStats'])),
      currentGold: asDouble(json['currentGold']),
      fullRunes: FullRunes.fromJson(asMap(json['fullRunes'])),
      level: asInt(json['level']),
      riotId: asString(json['riotId']),
      riotIdGameName: asString(json['riotIdGameName']),
      riotIdTagLine: asString(json['riotIdTagLine']),
      summonerName: asString(json['summonerName']),
      teamRelativeColors: asBool(json['teamRelativeColors']),
    );
  }

  Map<String, dynamic> toJson() => {
    'abilities': abilities.toJson(),
    'championStats': championStats.toJson(),
    'currentGold': currentGold,
    'fullRunes': fullRunes.toJson(),
    'level': level,
    'riotId': riotId,
    'riotIdGameName': riotIdGameName,
    'riotIdTagLine': riotIdTagLine,
    'summonerName': summonerName,
    'teamRelativeColors': teamRelativeColors,
  };
}
