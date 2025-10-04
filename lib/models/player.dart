import 'item.dart';
import 'scores.dart';
import 'simple_runes.dart';
import 'summoner_spells.dart';

class Player {
  const Player({
    required this.championName,
    required this.isBot,
    required this.isDead,
    required this.items,
    required this.level,
    required this.position,
    required this.rawChampionName,
    required this.rawSkinName,
    required this.respawnTimer,
    required this.riotId,
    required this.riotIdGameName,
    required this.riotIdTagLine,
    required this.runes,
    required this.scores,
    required this.skinID,
    required this.skinName,
    required this.summonerName,
    required this.summonerSpells,
    required this.team,
  });

  final String championName;
  final bool isBot;
  final bool isDead;
  final List<Item> items;
  final int level;
  final String position;
  final String rawChampionName;
  final String rawSkinName;
  final double respawnTimer;
  final String riotId;
  final String riotIdGameName;
  final String riotIdTagLine;
  final SimpleRunes runes;
  final Scores scores;
  final int skinID;
  final String skinName;
  final String summonerName;
  final SummonerSpells summonerSpells;
  final String team;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        championName: (json['championName'] as String?) ?? '',
        isBot: (json['isBot'] as bool? ?? false),
        isDead: (json['isDead'] as bool? ?? false),
        items: (json['items'] as List<dynamic>? ?? const [])
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        level: (json['level'] as num?)?.toInt() ?? 0,
        position: (json['position'] as String?) ?? '',
        rawChampionName: (json['rawChampionName'] as String?) ?? '',
        rawSkinName: (json['rawSkinName'] as String?) ?? '',
        respawnTimer: (json['respawnTimer'] is num)
            ? (json['respawnTimer'] as num).toDouble()
            : 0.0,
        riotId: (json['riotId'] as String?) ?? '',
        riotIdGameName: (json['riotIdGameName'] as String?) ?? '',
        riotIdTagLine: (json['riotIdTagLine'] as String?) ?? '',
        runes: SimpleRunes.fromJson(json['runes'] as Map<String, dynamic>),
        scores: Scores.fromJson(json['scores'] as Map<String, dynamic>),
        skinID: (json['skinID'] as num?)?.toInt() ?? 0,
        skinName: (json['skinName'] as String?) ?? '',
        summonerName: (json['summonerName'] as String?) ?? '',
        summonerSpells: SummonerSpells.fromJson(
          json['summonerSpells'] as Map<String, dynamic>,
        ),
        team: (json['team'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'championName': championName,
        'isBot': isBot,
        'isDead': isDead,
        'items': items.map((e) => e.toJson()).toList(),
        'level': level,
        'position': position,
        'rawChampionName': rawChampionName,
        'rawSkinName': rawSkinName,
        'respawnTimer': respawnTimer,
        'riotId': riotId,
        'riotIdGameName': riotIdGameName,
        'riotIdTagLine': riotIdTagLine,
        'runes': runes.toJson(),
        'scores': scores.toJson(),
        'skinID': skinID,
        'skinName': skinName,
        'summonerName': summonerName,
        'summonerSpells': summonerSpells.toJson(),
        'team': team,
      };
}
