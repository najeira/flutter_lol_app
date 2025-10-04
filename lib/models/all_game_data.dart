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
  const AllGameData({
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

class Abilities {
  const Abilities({
    required this.q,
    required this.w,
    required this.e,
    required this.r,
    required this.passive,
  });

  final AbilityInfo q;
  final AbilityInfo w;
  final AbilityInfo e;
  final AbilityInfo r;
  final AbilityInfo passive;

  factory Abilities.fromJson(Map<String, dynamic> json) {
    // Keys could be uppercase Q/W/E/R or localized; we follow example.
    return Abilities(
      q: AbilityInfo.fromJson((json['Q'] as Map<String, dynamic>? ?? const {})),
      w: AbilityInfo.fromJson((json['W'] as Map<String, dynamic>? ?? const {})),
      e: AbilityInfo.fromJson((json['E'] as Map<String, dynamic>? ?? const {})),
      r: AbilityInfo.fromJson((json['R'] as Map<String, dynamic>? ?? const {})),
      passive: AbilityInfo.fromJson((json['Passive'] as Map<String, dynamic>? ?? const {})),
    );
  }

  Map<String, dynamic> toJson() => {
        'Q': q.toJson(),
        'W': w.toJson(),
        'E': e.toJson(),
        'R': r.toJson(),
        'Passive': passive.toJson(),
      };
}

class AbilityInfo {
  const AbilityInfo({
    this.abilityLevel,
    required this.displayName,
    required this.id,
    required this.rawDescription,
    required this.rawDisplayName,
  });

  final int? abilityLevel;
  final String displayName;
  final String id;
  final String rawDescription;
  final String rawDisplayName;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) {
    return AbilityInfo(
      abilityLevel: (json['abilityLevel'] as num?)?.toInt(),
      displayName: (json['displayName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      rawDescription: (json['rawDescription'] as String?) ?? '',
      rawDisplayName: (json['rawDisplayName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        if (abilityLevel != null) 'abilityLevel': abilityLevel,
        'displayName': displayName,
        'id': id,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
      };
}

class ChampionStats {
  const ChampionStats({
    required this.abilityHaste,
    required this.abilityPower,
    required this.armor,
    required this.armorPenetrationFlat,
    required this.armorPenetrationPercent,
    required this.attackDamage,
    required this.attackRange,
    required this.attackSpeed,
    required this.bonusArmorPenetrationPercent,
    required this.bonusMagicPenetrationPercent,
    required this.critChance,
    required this.critDamage,
    required this.currentHealth,
    required this.healShieldPower,
    required this.healthRegenRate,
    required this.lifeSteal,
    required this.magicLethality,
    required this.magicPenetrationFlat,
    required this.magicPenetrationPercent,
    required this.magicResist,
    required this.maxHealth,
    required this.moveSpeed,
    required this.omnivamp,
    required this.physicalLethality,
    required this.physicalVamp,
    required this.resourceMax,
    required this.resourceRegenRate,
    required this.resourceType,
    required this.resourceValue,
    required this.spellVamp,
    required this.tenacity,
  });

  final double abilityHaste;
  final double abilityPower;
  final double armor;
  final double armorPenetrationFlat;
  final double armorPenetrationPercent;
  final double attackDamage;
  final double attackRange;
  final double attackSpeed;
  final double bonusArmorPenetrationPercent;
  final double bonusMagicPenetrationPercent;
  final double critChance;
  final double critDamage;
  final double currentHealth;
  final double healShieldPower;
  final double healthRegenRate;
  final double lifeSteal;
  final double magicLethality;
  final double magicPenetrationFlat;
  final double magicPenetrationPercent;
  final double magicResist;
  final double maxHealth;
  final double moveSpeed;
  final double omnivamp;
  final double physicalLethality;
  final double physicalVamp;
  final double resourceMax;
  final double resourceRegenRate;
  final String resourceType;
  final double resourceValue;
  final double spellVamp;
  final double tenacity;

  factory ChampionStats.fromJson(Map<String, dynamic> json) {
    double d(dynamic v) => (v is num) ? v.toDouble() : 0.0;
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
      resourceType: (json['resourceType'] as String?) ?? '',
      resourceValue: d(json['resourceValue']),
      spellVamp: d(json['spellVamp']),
      tenacity: d(json['tenacity']),
    );
  }

  Map<String, dynamic> toJson() => {
        'abilityHaste': abilityHaste,
        'abilityPower': abilityPower,
        'armor': armor,
        'armorPenetrationFlat': armorPenetrationFlat,
        'armorPenetrationPercent': armorPenetrationPercent,
        'attackDamage': attackDamage,
        'attackRange': attackRange,
        'attackSpeed': attackSpeed,
        'bonusArmorPenetrationPercent': bonusArmorPenetrationPercent,
        'bonusMagicPenetrationPercent': bonusMagicPenetrationPercent,
        'critChance': critChance,
        'critDamage': critDamage,
        'currentHealth': currentHealth,
        'healShieldPower': healShieldPower,
        'healthRegenRate': healthRegenRate,
        'lifeSteal': lifeSteal,
        'magicLethality': magicLethality,
        'magicPenetrationFlat': magicPenetrationFlat,
        'magicPenetrationPercent': magicPenetrationPercent,
        'magicResist': magicResist,
        'maxHealth': maxHealth,
        'moveSpeed': moveSpeed,
        'omnivamp': omnivamp,
        'physicalLethality': physicalLethality,
        'physicalVamp': physicalVamp,
        'resourceMax': resourceMax,
        'resourceRegenRate': resourceRegenRate,
        'resourceType': resourceType,
        'resourceValue': resourceValue,
        'spellVamp': spellVamp,
        'tenacity': tenacity,
      };
}

class FullRunes {
  const FullRunes({
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
  const Rune({required this.displayName, required this.id, required this.rawDescription, required this.rawDisplayName});

  final String displayName;
  final int id;
  final String rawDescription;
  final String rawDisplayName;

  factory Rune.fromJson(Map<String, dynamic> json) => Rune(
        displayName: (json['displayName'] as String?) ?? '',
        id: (json['id'] as num?)?.toInt() ?? 0,
        rawDescription: (json['rawDescription'] as String?) ?? '',
        rawDisplayName: (json['rawDisplayName'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'id': id,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
      };
}

class StatRune {
  const StatRune({required this.id, required this.rawDescription});

  final int id;
  final String rawDescription;

  factory StatRune.fromJson(Map<String, dynamic> json) => StatRune(
        id: (json['id'] as num?)?.toInt() ?? 0,
        rawDescription: (json['rawDescription'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'rawDescription': rawDescription,
      };
}

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

class Item {
  const Item({
    required this.canUse,
    required this.consumable,
    required this.count,
    required this.displayName,
    required this.itemID,
    required this.price,
    required this.rawDescription,
    required this.rawDisplayName,
    required this.slot,
  });

  final bool canUse;
  final bool consumable;
  final int count;
  final String displayName;
  final int itemID;
  final int price;
  final String rawDescription;
  final String rawDisplayName;
  final int slot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        canUse: (json['canUse'] as bool? ?? false),
        consumable: (json['consumable'] as bool? ?? false),
        count: (json['count'] as num? ?? 0).toInt(),
        displayName: (json['displayName'] as String?) ?? '',
        itemID: (json['itemID'] as num?)?.toInt() ?? 0,
        price: (json['price'] as num?)?.toInt() ?? 0,
        rawDescription: (json['rawDescription'] as String?) ?? '',
        rawDisplayName: (json['rawDisplayName'] as String?) ?? '',
        slot: (json['slot'] as num? ?? 0).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'canUse': canUse,
        'consumable': consumable,
        'count': count,
        'displayName': displayName,
        'itemID': itemID,
        'price': price,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
        'slot': slot,
      };
}

class SimpleRunes {
  const SimpleRunes({
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
  const Scores({
    required this.assists,
    required this.creepScore,
    required this.deaths,
    required this.kills,
    required this.wardScore,
  });

  final int assists;
  final int creepScore;
  final int deaths;
  final int kills;
  final double wardScore;

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        assists: (json['assists'] as num?)?.toInt() ?? 0,
        creepScore: (json['creepScore'] as num?)?.toInt() ?? 0,
        deaths: (json['deaths'] as num?)?.toInt() ?? 0,
        kills: (json['kills'] as num?)?.toInt() ?? 0,
        wardScore:
            (json['wardScore'] is num) ? (json['wardScore'] as num).toDouble() : 0.0,
      );

  Map<String, dynamic> toJson() => {
        'assists': assists,
        'creepScore': creepScore,
        'deaths': deaths,
        'kills': kills,
        'wardScore': wardScore,
      };
}

class SummonerSpells {
  const SummonerSpells({required this.summonerSpellOne, required this.summonerSpellTwo});

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
  const SummonerSpell({required this.displayName, required this.rawDescription, required this.rawDisplayName});

  final String displayName;
  final String rawDescription;
  final String rawDisplayName;

  factory SummonerSpell.fromJson(Map<String, dynamic> json) => SummonerSpell(
        displayName: (json['displayName'] as String?) ?? '',
        rawDescription: (json['rawDescription'] as String?) ?? '',
        rawDisplayName: (json['rawDisplayName'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
      };
}

class LiveEvents {
  const LiveEvents({required this.events});

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
  const GameEvent({required this.eventID, required this.eventName, required this.eventTime});

  final int eventID;
  final String eventName;
  final double eventTime;

  factory GameEvent.fromJson(Map<String, dynamic> json) => GameEvent(
        eventID: (json['EventID'] as num?)?.toInt() ?? 0,
        eventName: (json['EventName'] as String?) ?? '',
        eventTime: (json['EventTime'] is num)
            ? (json['EventTime'] as num).toDouble()
            : 0.0,
      );

  Map<String, dynamic> toJson() => {
        'EventID': eventID,
        'EventName': eventName,
        'EventTime': eventTime,
      };
}

class GameData {
  const GameData({required this.gameMode, required this.gameTime, required this.mapName, required this.mapNumber, required this.mapTerrain});

  final String gameMode;
  final double gameTime;
  final String mapName;
  final int mapNumber;
  final String mapTerrain;

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        gameMode: (json['gameMode'] as String?) ?? '',
        gameTime:
            (json['gameTime'] is num) ? (json['gameTime'] as num).toDouble() : 0.0,
        mapName: (json['mapName'] as String?) ?? '',
        mapNumber: (json['mapNumber'] as num?)?.toInt() ?? 0,
        mapTerrain: (json['mapTerrain'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'gameMode': gameMode,
        'gameTime': gameTime,
        'mapName': mapName,
        'mapNumber': mapNumber,
        'mapTerrain': mapTerrain,
      };
}
