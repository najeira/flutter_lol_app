import '../utils/json.dart';

class Rune {
  const Rune({
    required this.displayName,
    required this.id,
    required this.rawDescription,
    required this.rawDisplayName,
  });

  final String displayName;
  final int id;
  final String rawDescription;
  final String rawDisplayName;

  factory Rune.fromJson(Map<String, dynamic> json) => Rune(
    displayName: asString(json['displayName']),
    id: asInt(json['id']),
    rawDescription: asString(json['rawDescription']),
    rawDisplayName: asString(json['rawDisplayName']),
  );

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'id': id,
    'rawDescription': rawDescription,
    'rawDisplayName': rawDisplayName,
  };
}
