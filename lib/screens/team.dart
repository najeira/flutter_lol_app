import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart' show Item;
import '../providers/item.dart';
import '../services/player.dart';
import '../providers/player.dart';

import 'champion_image.dart';
import 'item_image.dart';

/// Displays teams as columns placed horizontally side-by-side.
///
/// - Each team is rendered as a vertical [Column] of player tiles.
/// - The same tile contents are reused via [PlayerColumn].
/// - Advantage indicators are displayed in a middle vertical column.
class TeamsVertical extends StatelessWidget {
  const TeamsVertical(this.data, {super.key});

  /// players grouped by team, already sorted by position.
  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    final length = math.max(data.blue.length, data.red.length);
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < length; i++)
          _build(data, i),
      ],
    );
  }

  Widget _build(PlayersData data, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        spacing: 8.0,
        children: [
          _buildPlayer(data.blue, index),
          _buildIndicator(data, index),
          _buildPlayer(data.red, index),
        ],
      ),
    );
  }

  Widget _buildPlayer(List<PlayerData> players, int index) {
    final player = players.elementAtOrNull(index);
    if (player == null) {
      return SizedBox.shrink();
    }
    return PlayerColumn(data: player);
  }

  Widget _buildIndicator(PlayersData data, int index) {
    return Indicator(
      blue: data.blue.elementAtOrNull(index),
      red: data.red.elementAtOrNull(index),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.blue, required this.red});

  final PlayerData? blue;
  final PlayerData? red;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (blue == null || red == null) {
      return const SizedBox.shrink();
    }

    final diff = blue!.power - red!.power;
    final label = (diff / 1000.0).abs().toStringAsFixed(1);

    const size = 16.0;

    Icon icon;
    if (diff > 300) {
      icon = const Icon(Icons.arrow_back, size: size, color: Colors.blue);
    } else if (diff < -300) {
      icon = const Icon(Icons.arrow_forward, size: size, color: Colors.red);
    } else {
      icon = const Icon(
        Icons.compare_arrows,
        size: size,
        color: Colors.white70,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 2.0),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(color: icon.color),
        ),
      ],
    );
  }
}

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({super.key, required this.data});

  final PlayerData data;

  Color get _teamColor {
    switch (data.player.team.toUpperCase()) {
      case 'ORDER':
        return Colors.blue;
      case 'CHAOS':
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diff = (data.value - 50).toDouble();
    final bg = (100.0 + (diff * 5.0)).clamp(0.0, 255.0);
    final bw = (diff / 3.0).clamp(0.0, 8.0);

    final color = _teamColor;

    return Container(
      width: 72.0,
      padding: EdgeInsets.all(8.0 - bw),
      decoration: BoxDecoration(
        color: color.withAlpha(bg.floor()),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color, width: bw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChampionName(data: data),
          const SizedBox(height: 2.0),
          ChampionIcon(data: data),
          // const SizedBox(height: 4.0),
          // _ItemsRow(data.player.items),
        ],
      ),
    );
  }
}

class _ItemsRow extends ConsumerWidget {
  const _ItemsRow(this.items, {super.key});

  final List<Item> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemMaster = ref.watch(itemMasterValueProvider);

    final values = items.map((item) {
      // debugPrint(item.toJson().toString());
      if (item.consumable) {
        return null;
      }

      final data = itemMaster?[item.itemID];
      if (data == null) {
        return null;
      } else if (data.consumed) {
        return null;
      } else if (!data.inStore) {
        return null;
      } else if (data.gold.total <= 0) {
        return null;
      } else if (data.gold.sell <= 0) {
        // return null;
      } else if (data.tags.contains("Consumable")) {
        return null;
      }

      return data;
    }).nonNulls;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 2.0,
      children: [for (final value in values) ItemIcon(item: value)],
    );
  }
}

class ChampionName extends StatelessWidget {
  const ChampionName({super.key, required this.data});

  final PlayerData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      data.player.championName,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: theme.textTheme.labelSmall,
    );
  }
}

class ChampionIcon extends StatelessWidget {
  const ChampionIcon({super.key, required this.data});

  final PlayerData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    return Stack(
      children: [
        ChampionImage(player: data.player, size: 56.0, borderRadius: 4.0),
        if (data.player.isDead)
          const Positioned.fill(child: ChampionDeadOverlay()),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
            color: Colors.black38,
            child: Text("${data.value}", style: labelStyle),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
            color: Colors.black38,
            child: Text("${data.player.level}", style: labelStyle),
          ),
        ),
      ],
    );
  }
}

class ChampionDeadOverlay extends StatelessWidget {
  const ChampionDeadOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Icon(Icons.close, color: Colors.white70, size: 28.0),
    );
  }
}
