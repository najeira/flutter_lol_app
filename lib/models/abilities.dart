import '../utils/json.dart';
import 'ability_info.dart';

class Abilities {
  const Abilities({
    required this.q,
    required this.w,
    required this.e,
    required this.r,
    required this.passive,
  });

  final AbilityInfo q;
  final AbilityInfo w;
  final AbilityInfo e;
  final AbilityInfo r;
  final AbilityInfo passive;

  factory Abilities.fromJson(Map<String, dynamic> json) {
    // Keys could be uppercase Q/W/E/R or localized; we follow example.
    return Abilities(
      q: AbilityInfo.fromJson(asMap(json['Q'])),
      w: AbilityInfo.fromJson(asMap(json['W'])),
      e: AbilityInfo.fromJson(asMap(json['E'])),
      r: AbilityInfo.fromJson(asMap(json['R'])),
      passive: AbilityInfo.fromJson(asMap(json['Passive'])),
    );
  }

  Map<String, dynamic> toJson() => {
    'Q': q.toJson(),
    'W': w.toJson(),
    'E': e.toJson(),
    'R': r.toJson(),
    'Passive': passive.toJson(),
  };
}
