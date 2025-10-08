import '../utils/json.dart';

class StatRune {
  const StatRune({required this.id, required this.rawDescription});

  final int id;
  final String rawDescription;

  factory StatRune.fromJson(Map<String, dynamic> json) => StatRune(
    id: asInt(json['id']),
    rawDescription: asString(json['rawDescription']),
  );

  Map<String, dynamic> toJson() => {'id': id, 'rawDescription': rawDescription};
}
