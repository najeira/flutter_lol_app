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
