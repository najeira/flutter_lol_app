import '../utils/json.dart';

class AbilityInfo {
  const AbilityInfo({
    required this.abilityLevel,
    required this.displayName,
    required this.id,
    required this.rawDescription,
    required this.rawDisplayName,
  });

  final int abilityLevel;
  final String displayName;
  final String id;
  final String rawDescription;
  final String rawDisplayName;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) {
    return AbilityInfo(
      abilityLevel: asInt(json['abilityLevel']),
      displayName: asString(json['displayName']),
      id: asString(json['id']),
      rawDescription: asString(json['rawDescription']),
      rawDisplayName: asString(json['rawDisplayName']),
    );
  }

  Map<String, dynamic> toJson() => {
        'abilityLevel': abilityLevel,
        'displayName': displayName,
        'id': id,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
      };
}
