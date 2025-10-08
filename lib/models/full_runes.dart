import '../utils/json.dart';
import 'rune.dart';
import 'stat_rune.dart';

class FullRunes {
  const FullRunes({
    required this.generalRunes,
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
    required this.statRunes,
  });

  final List<Rune> generalRunes;
  final Rune keystone;
  final Rune primaryRuneTree;
  final Rune secondaryRuneTree;
  final List<StatRune> statRunes;

  factory FullRunes.fromJson(Map<String, dynamic> json) => FullRunes(
    generalRunes: (json['generalRunes'] as List<dynamic>? ?? const [])
        .map((e) => Rune.fromJson(asMap(e)))
        .toList(),
    keystone: Rune.fromJson(asMap(json['keystone'])),
    primaryRuneTree: Rune.fromJson(asMap(json['primaryRuneTree'])),
    secondaryRuneTree: Rune.fromJson(asMap(json['secondaryRuneTree'])),
    statRunes: (json['statRunes'] as List<dynamic>? ?? const [])
        .map((e) => StatRune.fromJson(asMap(e)))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'generalRunes': generalRunes.map((e) => e.toJson()).toList(),
    'keystone': keystone.toJson(),
    'primaryRuneTree': primaryRuneTree.toJson(),
    'secondaryRuneTree': secondaryRuneTree.toJson(),
    'statRunes': statRunes.map((e) => e.toJson()).toList(),
  };
}
