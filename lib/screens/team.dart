import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/player.dart';
import '../widgets/player_card.dart';
import '../widgets/team_power_indicator.dart';

/// A widget that displays teams in a responsive layout.
///
/// It switches between [TeamsVertical] and [TeamsHorizontal] based on the
/// available width.
class TeamsResponsive extends StatelessWidget {
  const TeamsResponsive({super.key, required this.data});

  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return TeamsHorizontal(data);
        } else {
          return TeamsVertical(data);
        }
      },
    );
  }
}

/// Displays teams as columns placed horizontally side-by-side.
class TeamsVertical extends StatelessWidget {
  const TeamsVertical(this.data, {super.key});

  /// players grouped by team, already sorted by position.
  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    final length = math.max(data.blue.length, data.red.length);
    return ListView(
      children: [for (int i = 0; i < length; i++) _build(data, i)],
    );
  }

  Widget _build(PlayersData data, int index) {
    final blue = data.blue.elementAtOrNull(index);
    final red = data.red.elementAtOrNull(index);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          _buildPlayer(blue),
          const SizedBox(width: 8.0),
          TeamPowerIndicator(blue: blue, red: red, vertical: true),
          const SizedBox(width: 8.0),
          _buildPlayer(red),
        ],
      ),
    );
  }

  Widget _buildPlayer(PlayerData? player) {
    return Expanded(
      child:
          player != null ? PlayerCard(data: player) : const SizedBox.shrink(),
    );
  }
}

/// Displays teams as rows stacked vertically.
class TeamsHorizontal extends StatelessWidget {
  const TeamsHorizontal(this.data, {super.key});

  /// players grouped by team, already sorted by position.
  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _TeamRow(players: data.blue),
        const SizedBox(height: 16.0),
        _IndicatorRow(data: data),
        const SizedBox(height: 16.0),
        _TeamRow(players: data.red),
      ],
    );
  }
}


class _TeamRow extends StatelessWidget {
  const _TeamRow({required this.players});

  final List<PlayerData> players;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(players.length * 2 - 1, (index) {
        if (index.isEven) {
          return _buildPlayer(players[index ~/ 2]);
        } else {
          return const SizedBox(width: 16.0);
        }
      }),
    );
  }

  Widget _buildPlayer(PlayerData player) {
    return Expanded(
      child: PlayerCard(data: player),
    );
  }
}

class _IndicatorRow extends StatelessWidget {
  const _IndicatorRow({required this.data});

  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    final length = math.max(data.blue.length, data.red.length);
    return Row(children: [for (int i = 0; i < length; i++) _build(data, i)]);
  }

  Widget _build(PlayersData data, int index) {
    final blue = data.blue.elementAtOrNull(index);
    final red = data.red.elementAtOrNull(index);
    return Expanded(
      child: Center(
        child: TeamPowerIndicator(blue: blue, red: red, vertical: false),
      ),
    );
  }
}
