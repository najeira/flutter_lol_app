// Data models for the Live Client Data (/allgamedata) response and JSON decoding.
// This is based on the example in allgamedata.json at the project root.
//
// Note: These models intentionally focus on fields present in the example and common
// ones from the Live Client Data API. Unknown or extra fields in JSON are ignored.
// Numeric fields are parsed as num (or double) to accommodate int/double values.

import 'dart:convert';

import '../utils/json.dart';
import 'active_player.dart';
import 'game_data.dart';
import 'live_events.dart';
import 'player.dart';

AllGameData allGameDataFromJsonString(String source) =>
    AllGameData.fromJson(asMap(json.decode(source)));

class AllGameData {
  const AllGameData({
    required this.activePlayer,
    required this.allPlayers,
    required this.events,
    required this.gameData,
  });

  final ActivePlayer? activePlayer;
  final List<Player> allPlayers;
  final LiveEvents events;
  final GameData gameData;

  factory AllGameData.fromJson(Map<String, dynamic> json) {
    final ap = _activePlayer(json);
    return AllGameData(
      activePlayer: ap == null ? null : ActivePlayer.fromJson(ap),
      allPlayers: (json['allPlayers'] as List<dynamic>? ?? const [])
          .map((e) => Player.fromJson(asMap(e)))
          .toList(),
      events: LiveEvents.fromJson(asMap(json['events'])),
      gameData: GameData.fromJson(asMap(json['gameData'])),
    );
  }

  Map<String, dynamic> toJson() => {
    'activePlayer': activePlayer?.toJson(),
    'allPlayers': allPlayers.map((e) => e.toJson()).toList(),
    'events': events.toJson(),
    'gameData': gameData.toJson(),
  };
}

Map<String, dynamic>? _activePlayer(Map<String, dynamic> json) {
  final raw = json['activePlayer'];
  if (raw == null) {
    return null;
  }
  final ap = asMap(raw);
  if (ap['error'] != null) {
    return null;
  }
  return ap;
}
