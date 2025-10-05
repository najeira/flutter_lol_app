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
