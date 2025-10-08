import '../utils/json.dart';
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
    championName: asString(json['championName']),
    isBot: asBool(json['isBot']),
    isDead: asBool(json['isDead']),
    items: asList(json['items']).map((e) => Item.fromJson(asMap(e))).toList(),
    level: asInt(json['level']),
    position: asString(json['position']),
    rawChampionName: asString(json['rawChampionName']),
    rawSkinName: asString(json['rawSkinName']),
    respawnTimer: asDouble(json['respawnTimer']),
    riotId: asString(json['riotId']),
    riotIdGameName: asString(json['riotIdGameName']),
    riotIdTagLine: asString(json['riotIdTagLine']),
    runes: SimpleRunes.fromJson(asMap(json['runes'])),
    scores: Scores.fromJson(asMap(json['scores'])),
    skinID: asInt(json['skinID']),
    skinName: asString(json['skinName']),
    summonerName: asString(json['summonerName']),
    summonerSpells: SummonerSpells.fromJson(asMap(json['summonerSpells'])),
    team: asString(json['team']),
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
