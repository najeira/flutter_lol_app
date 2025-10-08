import '../utils/json.dart';

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
        assists: asInt(json['assists']),
        creepScore: asInt(json['creepScore']),
        deaths: asInt(json['deaths']),
        kills: asInt(json['kills']),
        wardScore: asDouble(json['wardScore']),
      );

  Map<String, dynamic> toJson() => {
        'assists': assists,
        'creepScore': creepScore,
        'deaths': deaths,
        'kills': kills,
        'wardScore': wardScore,
      };
}
