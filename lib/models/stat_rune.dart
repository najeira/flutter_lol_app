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
