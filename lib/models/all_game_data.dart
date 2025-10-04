// Data models for the Live Client Data (/allgamedata) response and JSON decoding.
// This is based on the example in allgamedata.json at the project root.
//
// Note: These models intentionally focus on fields present in the example and common
// ones from the Live Client Data API. Unknown or extra fields in JSON are ignored.
// Numeric fields are parsed as num (or double) to accommodate int/double values.

import 'dart:convert';

AllGameData allGameDataFromJsonString(String source) =>
    AllGameData.fromJson(json.decode(source) as Map<String, dynamic>);

class AllGameData {
  AllGameData({
    required this.activePlayer,
    required this.allPlayers,
    required this.events,
    required this.gameData,
  });

  final ActivePlayer activePlayer;
  final List<Player> allPlayers;
  final LiveEvents events;
  final GameData gameData;

  factory AllGameData.fromJson(Map<String, dynamic> json) {
    return AllGameData(
      activePlayer: ActivePlayer.fromJson(json['activePlayer'] as Map<String, dynamic>),
      allPlayers: (json['allPlayers'] as List<dynamic>? ?? const [])
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: LiveEvents.fromJson(json['events'] as Map<String, dynamic>),
      gameData: GameData.fromJson(json['gameData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'activePlayer': activePlayer.toJson(),
        'allPlayers': allPlayers.map((e) => e.toJson()).toList(),
        'events': events.toJson(),
        'gameData': gameData.toJson(),
      };
}

class ActivePlayer {
  ActivePlayer({
    required this.abilities,
    required this.championStats,
    required this.currentGold,
    required this.fullRunes,
    required this.level,
    this.riotId,
    this.riotIdGameName,
    this.riotIdTagLine,
    this.summonerName,
    this.teamRelativeColors,
  });

  final Abilities abilities;
  final ChampionStats championStats;
  final num currentGold;
  final FullRunes fullRunes;
  final int level;
  final String? riotId;
  final String? riotIdGameName;
  final String? riotIdTagLine;
  final String? summonerName;
  final bool? teamRelativeColors;

  factory ActivePlayer.fromJson(Map<String, dynamic> json) {
    return ActivePlayer(
      abilities: Abilities.fromJson(json['abilities'] as Map<String, dynamic>),
      championStats: ChampionStats.fromJson(json['championStats'] as Map<String, dynamic>),
      currentGold: (json['currentGold'] as num? ?? 0),
      fullRunes: FullRunes.fromJson(json['fullRunes'] as Map<String, dynamic>),
      level: (json['level'] as num? ?? 0).toInt(),
      riotId: json['riotId'] as String?,
      riotIdGameName: json['riotIdGameName'] as String?,
      riotIdTagLine: json['riotIdTagLine'] as String?,
      summonerName: json['summonerName'] as String?,
      teamRelativeColors: json['teamRelativeColors'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'abilities': abilities.toJson(),
        'championStats': championStats.toJson(),
        'currentGold': currentGold,
        'fullRunes': fullRunes.toJson(),
        'level': level,
        if (riotId != null) 'riotId': riotId,
        if (riotIdGameName != null) 'riotIdGameName': riotIdGameName,
        if (riotIdTagLine != null) 'riotIdTagLine': riotIdTagLine,
        if (summonerName != null) 'summonerName': summonerName,
        if (teamRelativeColors != null) 'teamRelativeColors': teamRelativeColors,
      };
}

class Abilities {
  Abilities({this.q, this.w, this.e, this.r, this.passive});

  AbilityInfo? q;
  AbilityInfo? w;
  AbilityInfo? e;
  AbilityInfo? r;
  AbilityInfo? passive;

  factory Abilities.fromJson(Map<String, dynamic> json) {
    // Keys could be uppercase Q/W/E/R or localized; we follow example.
    return Abilities(
      q: json['Q'] != null ? AbilityInfo.fromJson(json['Q'] as Map<String, dynamic>) : null,
      w: json['W'] != null ? AbilityInfo.fromJson(json['W'] as Map<String, dynamic>) : null,
      e: json['E'] != null ? AbilityInfo.fromJson(json['E'] as Map<String, dynamic>) : null,
      r: json['R'] != null ? AbilityInfo.fromJson(json['R'] as Map<String, dynamic>) : null,
      passive: json['Passive'] != null
          ? AbilityInfo.fromJson(json['Passive'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        if (q != null) 'Q': q!.toJson(),
        if (w != null) 'W': w!.toJson(),
        if (e != null) 'E': e!.toJson(),
        if (r != null) 'R': r!.toJson(),
        if (passive != null) 'Passive': passive!.toJson(),
      };
}

class AbilityInfo {
  AbilityInfo({
    this.abilityLevel,
    this.displayName,
    this.id,
    this.rawDescription,
    this.rawDisplayName,
  });

  int? abilityLevel;
  String? displayName;
  String? id;
  String? rawDescription;
  String? rawDisplayName;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) {
    return AbilityInfo(
      abilityLevel: (json['abilityLevel'] as num?)?.toInt(),
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      rawDescription: json['rawDescription'] as String?,
      rawDisplayName: json['rawDisplayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        if (abilityLevel != null) 'abilityLevel': abilityLevel,
        if (displayName != null) 'displayName': displayName,
        if (id != null) 'id': id,
        if (rawDescription != null) 'rawDescription': rawDescription,
        if (rawDisplayName != null) 'rawDisplayName': rawDisplayName,
      };
}

class ChampionStats {
  ChampionStats({
    this.abilityHaste,
    this.abilityPower,
    this.armor,
    this.armorPenetrationFlat,
    this.armorPenetrationPercent,
    this.attackDamage,
    this.attackRange,
    this.attackSpeed,
    this.bonusArmorPenetrationPercent,
    this.bonusMagicPenetrationPercent,
    this.critChance,
    this.critDamage,
    this.currentHealth,
    this.healShieldPower,
    this.healthRegenRate,
    this.lifeSteal,
    this.magicLethality,
    this.magicPenetrationFlat,
    this.magicPenetrationPercent,
    this.magicResist,
    this.maxHealth,
    this.moveSpeed,
    this.omnivamp,
    this.physicalLethality,
    this.physicalVamp,
    this.resourceMax,
    this.resourceRegenRate,
    this.resourceType,
    this.resourceValue,
    this.spellVamp,
    this.tenacity,
  });

  double? abilityHaste;
  double? abilityPower;
  double? armor;
  double? armorPenetrationFlat;
  double? armorPenetrationPercent;
  double? attackDamage;
  double? attackRange;
  double? attackSpeed;
  double? bonusArmorPenetrationPercent;
  double? bonusMagicPenetrationPercent;
  double? critChance;
  double? critDamage;
  double? currentHealth;
  double? healShieldPower;
  double? healthRegenRate;
  double? lifeSteal;
  double? magicLethality;
  double? magicPenetrationFlat;
  double? magicPenetrationPercent;
  double? magicResist;
  double? maxHealth;
  double? moveSpeed;
  double? omnivamp;
  double? physicalLethality;
  double? physicalVamp;
  double? resourceMax;
  double? resourceRegenRate;
  String? resourceType;
  double? resourceValue;
  double? spellVamp;
  double? tenacity;

  factory ChampionStats.fromJson(Map<String, dynamic> json) {
    double? d(dynamic v) => (v is num) ? v.toDouble() : null;
    return ChampionStats(
      abilityHaste: d(json['abilityHaste']),
      abilityPower: d(json['abilityPower']),
      armor: d(json['armor']),
      armorPenetrationFlat: d(json['armorPenetrationFlat']),
      armorPenetrationPercent: d(json['armorPenetrationPercent']),
      attackDamage: d(json['attackDamage']),
      attackRange: d(json['attackRange']),
      attackSpeed: d(json['attackSpeed']),
      bonusArmorPenetrationPercent: d(json['bonusArmorPenetrationPercent']),
      bonusMagicPenetrationPercent: d(json['bonusMagicPenetrationPercent']),
      critChance: d(json['critChance']),
      critDamage: d(json['critDamage']),
      currentHealth: d(json['currentHealth']),
      healShieldPower: d(json['healShieldPower']),
      healthRegenRate: d(json['healthRegenRate']),
      lifeSteal: d(json['lifeSteal']),
      magicLethality: d(json['magicLethality']),
      magicPenetrationFlat: d(json['magicPenetrationFlat']),
      magicPenetrationPercent: d(json['magicPenetrationPercent']),
      magicResist: d(json['magicResist']),
      maxHealth: d(json['maxHealth']),
      moveSpeed: d(json['moveSpeed']),
      omnivamp: d(json['omnivamp']),
      physicalLethality: d(json['physicalLethality']),
      physicalVamp: d(json['physicalVamp']),
      resourceMax: d(json['resourceMax']),
      resourceRegenRate: d(json['resourceRegenRate']),
      resourceType: json['resourceType'] as String?,
      resourceValue: d(json['resourceValue']),
      spellVamp: d(json['spellVamp']),
      tenacity: d(json['tenacity']),
    );
  }

  Map<String, dynamic> toJson() => {
        if (abilityHaste != null) 'abilityHaste': abilityHaste,
        if (abilityPower != null) 'abilityPower': abilityPower,
        if (armor != null) 'armor': armor,
        if (armorPenetrationFlat != null) 'armorPenetrationFlat': armorPenetrationFlat,
        if (armorPenetrationPercent != null) 'armorPenetrationPercent': armorPenetrationPercent,
        if (attackDamage != null) 'attackDamage': attackDamage,
        if (attackRange != null) 'attackRange': attackRange,
        if (attackSpeed != null) 'attackSpeed': attackSpeed,
        if (bonusArmorPenetrationPercent != null)
          'bonusArmorPenetrationPercent': bonusArmorPenetrationPercent,
        if (bonusMagicPenetrationPercent != null)
          'bonusMagicPenetrationPercent': bonusMagicPenetrationPercent,
        if (critChance != null) 'critChance': critChance,
        if (critDamage != null) 'critDamage': critDamage,
        if (currentHealth != null) 'currentHealth': currentHealth,
        if (healShieldPower != null) 'healShieldPower': healShieldPower,
        if (healthRegenRate != null) 'healthRegenRate': healthRegenRate,
        if (lifeSteal != null) 'lifeSteal': lifeSteal,
        if (magicLethality != null) 'magicLethality': magicLethality,
        if (magicPenetrationFlat != null) 'magicPenetrationFlat': magicPenetrationFlat,
        if (magicPenetrationPercent != null) 'magicPenetrationPercent': magicPenetrationPercent,
        if (magicResist != null) 'magicResist': magicResist,
        if (maxHealth != null) 'maxHealth': maxHealth,
        if (moveSpeed != null) 'moveSpeed': moveSpeed,
        if (omnivamp != null) 'omnivamp': omnivamp,
        if (physicalLethality != null) 'physicalLethality': physicalLethality,
        if (physicalVamp != null) 'physicalVamp': physicalVamp,
        if (resourceMax != null) 'resourceMax': resourceMax,
        if (resourceRegenRate != null) 'resourceRegenRate': resourceRegenRate,
        if (resourceType != null) 'resourceType': resourceType,
        if (resourceValue != null) 'resourceValue': resourceValue,
        if (spellVamp != null) 'spellVamp': spellVamp,
        if (tenacity != null) 'tenacity': tenacity,
      };
}

class FullRunes {
  FullRunes({
    required this.generalRunes,
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
    required this.statRunes,
  });

  final List<Rune> generalRunes;
  final Rune keystone;
  final Rune primaryRuneTree;
  final Rune secondaryRuneTree;
  final List<StatRune> statRunes;

  factory FullRunes.fromJson(Map<String, dynamic> json) => FullRunes(
        generalRunes: (json['generalRunes'] as List<dynamic>? ?? const [])
            .map((e) => Rune.fromJson(e as Map<String, dynamic>))
            .toList(),
        keystone: Rune.fromJson(json['keystone'] as Map<String, dynamic>),
        primaryRuneTree:
            Rune.fromJson(json['primaryRuneTree'] as Map<String, dynamic>),
        secondaryRuneTree:
            Rune.fromJson(json['secondaryRuneTree'] as Map<String, dynamic>),
        statRunes: (json['statRunes'] as List<dynamic>? ?? const [])
            .map((e) => StatRune.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'generalRunes': generalRunes.map((e) => e.toJson()).toList(),
        'keystone': keystone.toJson(),
        'primaryRuneTree': primaryRuneTree.toJson(),
        'secondaryRuneTree': secondaryRuneTree.toJson(),
        'statRunes': statRunes.map((e) => e.toJson()).toList(),
      };
}

class Rune {
  Rune({this.displayName, this.id, this.rawDescription, this.rawDisplayName});

  String? displayName;
  int? id;
  String? rawDescription;
  String? rawDisplayName;

  factory Rune.fromJson(Map<String, dynamic> json) => Rune(
        displayName: json['displayName'] as String?,
        id: (json['id'] as num?)?.toInt(),
        rawDescription: json['rawDescription'] as String?,
        rawDisplayName: json['rawDisplayName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (displayName != null) 'displayName': displayName,
        if (id != null) 'id': id,
        if (rawDescription != null) 'rawDescription': rawDescription,
        if (rawDisplayName != null) 'rawDisplayName': rawDisplayName,
      };
}

class StatRune {
  StatRune({this.id, this.rawDescription});

  int? id;
  String? rawDescription;

  factory StatRune.fromJson(Map<String, dynamic> json) => StatRune(
        id: (json['id'] as num?)?.toInt(),
        rawDescription: json['rawDescription'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (rawDescription != null) 'rawDescription': rawDescription,
      };
}

class Player {
  Player({
    this.championName,
    required this.isBot,
    required this.isDead,
    required this.items,
    required this.level,
    this.position,
    this.rawChampionName,
    this.rawSkinName,
    this.respawnTimer,
    this.riotId,
    this.riotIdGameName,
    this.riotIdTagLine,
    this.runes,
    this.scores,
    this.skinID,
    this.skinName,
    this.summonerName,
    this.summonerSpells,
    this.team,
  });

  String? championName;
  bool isBot;
  bool isDead;
  List<Item> items;
  int level;
  String? position;
  String? rawChampionName;
  String? rawSkinName;
  double? respawnTimer;
  String? riotId;
  String? riotIdGameName;
  String? riotIdTagLine;
  SimpleRunes? runes;
  Scores? scores;
  int? skinID;
  String? skinName;
  String? summonerName;
  SummonerSpells? summonerSpells;
  String? team;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        championName: json['championName'] as String?,
        isBot: (json['isBot'] as bool? ?? false),
        isDead: (json['isDead'] as bool? ?? false),
        items: (json['items'] as List<dynamic>? ?? const [])
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        level: (json['level'] as num? ?? 0).toInt(),
        position: json['position'] as String?,
        rawChampionName: json['rawChampionName'] as String?,
        rawSkinName: json['rawSkinName'] as String?,
        respawnTimer: (json['respawnTimer'] is num)
            ? (json['respawnTimer'] as num).toDouble()
            : null,
        riotId: json['riotId'] as String?,
        riotIdGameName: json['riotIdGameName'] as String?,
        riotIdTagLine: json['riotIdTagLine'] as String?,
        runes: json['runes'] != null
            ? SimpleRunes.fromJson(json['runes'] as Map<String, dynamic>)
            : null,
        scores: json['scores'] != null
            ? Scores.fromJson(json['scores'] as Map<String, dynamic>)
            : null,
        skinID: (json['skinID'] as num?)?.toInt(),
        skinName: json['skinName'] as String?,
        summonerName: json['summonerName'] as String?,
        summonerSpells: json['summonerSpells'] != null
            ? SummonerSpells.fromJson(
                json['summonerSpells'] as Map<String, dynamic>,
              )
            : null,
        team: json['team'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (championName != null) 'championName': championName,
        'isBot': isBot,
        'isDead': isDead,
        'items': items.map((e) => e.toJson()).toList(),
        'level': level,
        if (position != null) 'position': position,
        if (rawChampionName != null) 'rawChampionName': rawChampionName,
        if (rawSkinName != null) 'rawSkinName': rawSkinName,
        if (respawnTimer != null) 'respawnTimer': respawnTimer,
        if (riotId != null) 'riotId': riotId,
        if (riotIdGameName != null) 'riotIdGameName': riotIdGameName,
        if (riotIdTagLine != null) 'riotIdTagLine': riotIdTagLine,
        if (runes != null) 'runes': runes!.toJson(),
        if (scores != null) 'scores': scores!.toJson(),
        if (skinID != null) 'skinID': skinID,
        if (skinName != null) 'skinName': skinName,
        if (summonerName != null) 'summonerName': summonerName,
        if (summonerSpells != null) 'summonerSpells': summonerSpells!.toJson(),
        if (team != null) 'team': team,
      };
}

class Item {
  Item({
    required this.canUse,
    required this.consumable,
    required this.count,
    this.displayName,
    required this.itemID,
    required this.price,
    this.rawDescription,
    this.rawDisplayName,
    required this.slot,
  });

  bool canUse;
  bool consumable;
  int count;
  String? displayName;
  int itemID;
  int price;
  String? rawDescription;
  String? rawDisplayName;
  int slot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        canUse: (json['canUse'] as bool? ?? false),
        consumable: (json['consumable'] as bool? ?? false),
        count: (json['count'] as num? ?? 0).toInt(),
        displayName: json['displayName'] as String?,
        itemID: (json['itemID'] as num? ?? 0).toInt(),
        price: (json['price'] as num? ?? 0).toInt(),
        rawDescription: json['rawDescription'] as String?,
        rawDisplayName: json['rawDisplayName'] as String?,
        slot: (json['slot'] as num? ?? 0).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'canUse': canUse,
        'consumable': consumable,
        'count': count,
        if (displayName != null) 'displayName': displayName,
        'itemID': itemID,
        'price': price,
        if (rawDescription != null) 'rawDescription': rawDescription,
        if (rawDisplayName != null) 'rawDisplayName': rawDisplayName,
        'slot': slot,
      };
}

class SimpleRunes {
  SimpleRunes({
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
  });

  final Rune keystone;
  final Rune primaryRuneTree;
  final Rune secondaryRuneTree;

  factory SimpleRunes.fromJson(Map<String, dynamic> json) => SimpleRunes(
        keystone: Rune.fromJson(json['keystone'] as Map<String, dynamic>),
        primaryRuneTree:
            Rune.fromJson(json['primaryRuneTree'] as Map<String, dynamic>),
        secondaryRuneTree:
            Rune.fromJson(json['secondaryRuneTree'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'keystone': keystone.toJson(),
        'primaryRuneTree': primaryRuneTree.toJson(),
        'secondaryRuneTree': secondaryRuneTree.toJson(),
      };
}

class Scores {
  Scores({this.assists, this.creepScore, this.deaths, this.kills, this.wardScore});

  int? assists;
  int? creepScore;
  int? deaths;
  int? kills;
  double? wardScore;

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        assists: (json['assists'] as num?)?.toInt(),
        creepScore: (json['creepScore'] as num?)?.toInt(),
        deaths: (json['deaths'] as num?)?.toInt(),
        kills: (json['kills'] as num?)?.toInt(),
        wardScore: (json['wardScore'] is num)
            ? (json['wardScore'] as num).toDouble()
            : null,
      );

  Map<String, dynamic> toJson() => {
        if (assists != null) 'assists': assists,
        if (creepScore != null) 'creepScore': creepScore,
        if (deaths != null) 'deaths': deaths,
        if (kills != null) 'kills': kills,
        if (wardScore != null) 'wardScore': wardScore,
      };
}

class SummonerSpells {
  SummonerSpells({required this.summonerSpellOne, required this.summonerSpellTwo});

  final SummonerSpell summonerSpellOne;
  final SummonerSpell summonerSpellTwo;

  factory SummonerSpells.fromJson(Map<String, dynamic> json) => SummonerSpells(
        summonerSpellOne:
            SummonerSpell.fromJson(json['summonerSpellOne'] as Map<String, dynamic>),
        summonerSpellTwo:
            SummonerSpell.fromJson(json['summonerSpellTwo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'summonerSpellOne': summonerSpellOne.toJson(),
        'summonerSpellTwo': summonerSpellTwo.toJson(),
      };
}

class SummonerSpell {
  SummonerSpell({this.displayName, this.rawDescription, this.rawDisplayName});

  String? displayName;
  String? rawDescription;
  String? rawDisplayName;

  factory SummonerSpell.fromJson(Map<String, dynamic> json) => SummonerSpell(
        displayName: json['displayName'] as String?,
        rawDescription: json['rawDescription'] as String?,
        rawDisplayName: json['rawDisplayName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (displayName != null) 'displayName': displayName,
        if (rawDescription != null) 'rawDescription': rawDescription,
        if (rawDisplayName != null) 'rawDisplayName': rawDisplayName,
      };
}

class LiveEvents {
  LiveEvents({required this.events});

  final List<GameEvent> events;

  factory LiveEvents.fromJson(Map<String, dynamic> json) => LiveEvents(
        events: (json['Events'] as List<dynamic>? ?? const [])
            .map((e) => GameEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Events': events.map((e) => e.toJson()).toList(),
      };
}

class GameEvent {
  GameEvent({this.eventID, this.eventName, this.eventTime});

  int? eventID;
  String? eventName;
  double? eventTime;

  factory GameEvent.fromJson(Map<String, dynamic> json) => GameEvent(
        eventID: (json['EventID'] as num?)?.toInt(),
        eventName: json['EventName'] as String?,
        eventTime: (json['EventTime'] is num)
            ? (json['EventTime'] as num).toDouble()
            : null,
      );

  Map<String, dynamic> toJson() => {
        if (eventID != null) 'EventID': eventID,
        if (eventName != null) 'EventName': eventName,
        if (eventTime != null) 'EventTime': eventTime,
      };
}

class GameData {
  GameData({this.gameMode, this.gameTime, this.mapName, this.mapNumber, this.mapTerrain});

  String? gameMode;
  double? gameTime;
  String? mapName;
  int? mapNumber;
  String? mapTerrain;

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        gameMode: json['gameMode'] as String?,
        gameTime: (json['gameTime'] is num) ? (json['gameTime'] as num).toDouble() : null,
        mapName: json['mapName'] as String?,
        mapNumber: (json['mapNumber'] as num?)?.toInt(),
        mapTerrain: json['mapTerrain'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (gameMode != null) 'gameMode': gameMode,
        if (gameTime != null) 'gameTime': gameTime,
        if (mapName != null) 'mapName': mapName,
        if (mapNumber != null) 'mapNumber': mapNumber,
        if (mapTerrain != null) 'mapTerrain': mapTerrain,
      };
}
