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
      abilities: Abilities.fromJson(json['abilities'] as Map<String, dynamic>),
      championStats: ChampionStats.fromJson(json['championStats'] as Map<String, dynamic>),
      currentGold: (json['currentGold'] as num? ?? 0),
      fullRunes: FullRunes.fromJson(json['fullRunes'] as Map<String, dynamic>),
      level: (json['level'] as num? ?? 0).toInt(),
      riotId: (json['riotId'] as String?) ?? '',
      riotIdGameName: (json['riotIdGameName'] as String?) ?? '',
      riotIdTagLine: (json['riotIdTagLine'] as String?) ?? '',
      summonerName: (json['summonerName'] as String?) ?? '',
      teamRelativeColors: (json['teamRelativeColors'] as bool?) ?? false,
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
