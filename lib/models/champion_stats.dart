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
