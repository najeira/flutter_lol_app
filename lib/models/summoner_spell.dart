import '../utils/json.dart';

class SummonerSpell {
  const SummonerSpell({required this.displayName, required this.rawDescription, required this.rawDisplayName});

  final String displayName;
  final String rawDescription;
  final String rawDisplayName;

  factory SummonerSpell.fromJson(Map<String, dynamic> json) => SummonerSpell(
        displayName: asString(json['displayName']),
        rawDescription: asString(json['rawDescription']),
        rawDisplayName: asString(json['rawDisplayName']),
      );

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
      };
}
