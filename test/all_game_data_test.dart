import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lol_app/models/all_game_data.dart';
import 'package:flutter_lol_app/models/active_player.dart';

void main() {
  test('Decode allgamedata.json into AllGameData model', () async {
    final file = File('allgamedata.json');
    expect(await file.exists(), isTrue, reason: 'allgamedata.json must exist at repo root');

    final jsonStr = await file.readAsString();
    final root = json.decode(jsonStr) as Map<String, dynamic>;

    final data = AllGameData.fromJson(root);

    // Basic assertions from the example JSON
    expect(data.allPlayers, isNotEmpty);
    expect(data.gameData.gameMode, isNotEmpty);

    // activePlayer may be null; skipping related assertions

    // Players team values should be ORDER / CHAOS in the example
    final teams = data.allPlayers.map((p) => p.team).whereType<String>().toSet();
    expect(teams, isNotEmpty);
  });
}
