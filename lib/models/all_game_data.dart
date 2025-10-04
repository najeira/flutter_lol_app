// Data models for the Live Client Data (/allgamedata) response and JSON decoding.
// This is based on the example in allgamedata.json at the project root.
//
// Note: These models intentionally focus on fields present in the example and common
// ones from the Live Client Data API. Unknown or extra fields in JSON are ignored.
// Numeric fields are parsed as num (or double) to accommodate int/double values.

import 'dart:convert';

import 'active_player.dart';
import 'game_data.dart';
import 'live_events.dart';
import 'player.dart';

AllGameData allGameDataFromJsonString(String source) =>
    AllGameData.fromJson(json.decode(source) as Map<String, dynamic>);

class AllGameData {
  const AllGameData({
    required this.activePlayer,
    required this.allPlayers,
    required this.events,
    required this.gameData,
  });

  final ActivePlayer activePlayer;
  final List<Player> allPlayers;
  final LiveEvents events;
  final GameData gameData;

  factory AllGameData.fromJson(Map<String, dynamic> json) {
    return AllGameData(
      activePlayer: ActivePlayer.fromJson(json['activePlayer'] as Map<String, dynamic>),
      allPlayers: (json['allPlayers'] as List<dynamic>? ?? const [])
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: LiveEvents.fromJson(json['events'] as Map<String, dynamic>),
      gameData: GameData.fromJson(json['gameData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'activePlayer': activePlayer.toJson(),
        'allPlayers': allPlayers.map((e) => e.toJson()).toList(),
        'events': events.toJson(),
        'gameData': gameData.toJson(),
      };
}
