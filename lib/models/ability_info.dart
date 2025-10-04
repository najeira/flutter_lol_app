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
