import '../utils/json.dart';

class GameData {
  const GameData({
    required this.gameMode,
    required this.gameTime,
    required this.mapName,
    required this.mapNumber,
    required this.mapTerrain,
  });

  final String gameMode;
  final double gameTime;
  final String mapName;
  final int mapNumber;
  final String mapTerrain;

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
    gameMode: asString(json['gameMode']),
    gameTime: asDouble(json['gameTime']),
    mapName: asString(json['mapName']),
    mapNumber: asInt(json['mapNumber']),
    mapTerrain: asString(json['mapTerrain']),
  );

  Map<String, dynamic> toJson() => {
    'gameMode': gameMode,
    'gameTime': gameTime,
    'mapName': mapName,
    'mapNumber': mapNumber,
    'mapTerrain': mapTerrain,
  };
}
