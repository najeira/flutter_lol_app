import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_lol_app/models/player.dart';
import 'package:flutter_lol_app/services/player.dart';
import 'champion_image.dart';

/// Displays teams as multiple rows using playersByTeamProvider.
///
/// - Single-team widget: [_TeamRow] shows one team's players.
/// - Multi-row widget: [TeamsSideBySide] stacks multiple teams vertically.
class TeamsSideBySide extends StatelessWidget {
  const TeamsSideBySide({super.key, required this.rows, this.meName});

  /// players grouped by team, already sorted by position.
  final List<List<PlayerData>> rows;

  /// Optional: player name to highlight (e.g., active player).
  final String? meName;

  Color _teamColor(ThemeData theme, String team) {
    switch (team.toUpperCase()) {
      case 'ORDER':
        return theme.colorScheme.primary;
      case 'CHAOS':
        return theme.colorScheme.secondary;
      default:
        return theme.colorScheme.tertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (rows.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('プレイヤー情報がありません'),
        ),
      );
    }

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final teamPlayers in rows) ...[
          _TeamRow(
            players: teamPlayers,
            titleColor: _teamColor(
              theme,
              teamPlayers.isNotEmpty
                  ? teamPlayers.first.player.team.toString()
                  : 'TEAM',
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _TeamRow extends StatelessWidget {
  const _TeamRow({required this.players, required this.titleColor});

  final List<PlayerData> players;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final pd in players) Flexible(child: _PlayerTile(data: pd)),
      ],
    );
  }
}

class _PlayerTile extends StatelessWidget {
  const _PlayerTile({required this.data});

  final PlayerData data;

  Color get _teamColor {
    switch (data.player.team.toUpperCase()) {
      case 'ORDER':
        return Colors.blue;
      case 'CHAOS':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final diff = data.value - 50.0;
    final bg = (100 + (diff * 5)).clamp(0.0, 255.0);
    final bw = (diff / 2.0).clamp(0.0, 8.0);

    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: EdgeInsets.all(8.0 - bw),
      decoration: BoxDecoration(
        color: _teamColor.withAlpha(bg.round()),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: _teamColor, width: bw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.player.championName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          Row(
            children: [
              Stack(
                children: [
                  ChampionImage(
                    player: data.player,
                    size: 44.0,
                    borderRadius: 8.0,
                  ),
                  if (data.player.isDead)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.35),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.close, color: Colors.white70),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   '${data.power}',
                  //   style: theme.textTheme.labelSmall,
                  // ),
                  Text(
                    'Lv: ${data.player.level}',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
