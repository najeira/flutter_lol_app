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
      q: AbilityInfo.fromJson((json['Q'] as Map<String, dynamic>? ?? const {})),
      w: AbilityInfo.fromJson((json['W'] as Map<String, dynamic>? ?? const {})),
      e: AbilityInfo.fromJson((json['E'] as Map<String, dynamic>? ?? const {})),
      r: AbilityInfo.fromJson((json['R'] as Map<String, dynamic>? ?? const {})),
      passive: AbilityInfo.fromJson((json['Passive'] as Map<String, dynamic>? ?? const {})),
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
