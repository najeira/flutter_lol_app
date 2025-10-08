import '../utils/json.dart';
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
    keystone: Rune.fromJson(asMap(json['keystone'])),
    primaryRuneTree: Rune.fromJson(asMap(json['primaryRuneTree'])),
    secondaryRuneTree: Rune.fromJson(asMap(json['secondaryRuneTree'])),
  );

  Map<String, dynamic> toJson() => {
    'keystone': keystone.toJson(),
    'primaryRuneTree': primaryRuneTree.toJson(),
    'secondaryRuneTree': secondaryRuneTree.toJson(),
  };
}
