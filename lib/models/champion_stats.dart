import '../utils/json.dart';

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

  factory ChampionStats.fromJson(Map<String, dynamic> json) => ChampionStats(
        abilityHaste: asDouble(json['abilityHaste']),
        abilityPower: asDouble(json['abilityPower']),
        armor: asDouble(json['armor']),
        armorPenetrationFlat: asDouble(json['armorPenetrationFlat']),
        armorPenetrationPercent: asDouble(json['armorPenetrationPercent']),
        attackDamage: asDouble(json['attackDamage']),
        attackRange: asDouble(json['attackRange']),
        attackSpeed: asDouble(json['attackSpeed']),
        bonusArmorPenetrationPercent: asDouble(json['bonusArmorPenetrationPercent']),
        bonusMagicPenetrationPercent: asDouble(json['bonusMagicPenetrationPercent']),
        critChance: asDouble(json['critChance']),
        critDamage: asDouble(json['critDamage']),
        currentHealth: asDouble(json['currentHealth']),
        healShieldPower: asDouble(json['healShieldPower']),
        healthRegenRate: asDouble(json['healthRegenRate']),
        lifeSteal: asDouble(json['lifeSteal']),
        magicLethality: asDouble(json['magicLethality']),
        magicPenetrationFlat: asDouble(json['magicPenetrationFlat']),
        magicPenetrationPercent: asDouble(json['magicPenetrationPercent']),
        magicResist: asDouble(json['magicResist']),
        maxHealth: asDouble(json['maxHealth']),
        moveSpeed: asDouble(json['moveSpeed']),
        omnivamp: asDouble(json['omnivamp']),
        physicalLethality: asDouble(json['physicalLethality']),
        physicalVamp: asDouble(json['physicalVamp']),
        resourceMax: asDouble(json['resourceMax']),
        resourceRegenRate: asDouble(json['resourceRegenRate']),
        resourceType: asString(json['resourceType']),
        resourceValue: asDouble(json['resourceValue']),
        spellVamp: asDouble(json['spellVamp']),
        tenacity: asDouble(json['tenacity']),
      );

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
