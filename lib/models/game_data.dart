class GameData {
  const GameData({required this.gameMode, required this.gameTime, required this.mapName, required this.mapNumber, required this.mapTerrain});

  final String gameMode;
  final double gameTime;
  final String mapName;
  final int mapNumber;
  final String mapTerrain;

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        gameMode: (json['gameMode'] as String?) ?? '',
        gameTime:
            (json['gameTime'] is num) ? (json['gameTime'] as num).toDouble() : 0.0,
        mapName: (json['mapName'] as String?) ?? '',
        mapNumber: (json['mapNumber'] as num?)?.toInt() ?? 0,
        mapTerrain: (json['mapTerrain'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'gameMode': gameMode,
        'gameTime': gameTime,
        'mapName': mapName,
        'mapNumber': mapNumber,
        'mapTerrain': mapTerrain,
      };
}
