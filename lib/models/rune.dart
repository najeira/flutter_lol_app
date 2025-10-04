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
