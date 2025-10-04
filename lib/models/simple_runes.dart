import 'rune.dart';

class SimpleRunes {
  const SimpleRunes({
    required this.keystone,
    required this.primaryRuneTree,
    required this.secondaryRuneTree,
  });

  final Rune keystone;
  final Rune primaryRuneTree;
  final Rune secondaryRuneTree;

  factory SimpleRunes.fromJson(Map<String, dynamic> json) => SimpleRunes(
        keystone: Rune.fromJson(json['keystone'] as Map<String, dynamic>),
        primaryRuneTree:
            Rune.fromJson(json['primaryRuneTree'] as Map<String, dynamic>),
        secondaryRuneTree:
            Rune.fromJson(json['secondaryRuneTree'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'keystone': keystone.toJson(),
        'primaryRuneTree': primaryRuneTree.toJson(),
        'secondaryRuneTree': secondaryRuneTree.toJson(),
      };
}
