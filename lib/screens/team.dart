import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart' show Item;
import '../providers/item.dart';
import '../providers/player.dart';
import '../services/player.dart';

import 'champion_image.dart';
import 'item_image.dart';

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
    return Expanded(child: _Player(data: player));
  }

  Widget _buildIndicator(PlayersData data, int index) {
    return _Indicator(
      blue: data.blue.elementAtOrNull(index),
      red: data.red.elementAtOrNull(index),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({super.key, required this.blue, required this.red});

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

    const size = 14.0;

    Icon icon;
    if (diff > 500) {
      icon = const Icon(
        Icons.align_horizontal_left,
        size: size,
        color: Colors.blue,
      );
    } else if (diff < -500) {
      icon = const Icon(
        Icons.align_horizontal_right,
        size: size,
        color: Colors.red,
      );
    } else {
      icon = const Icon(
        Icons.align_horizontal_center,
        size: size,
        color: Colors.white70,
      );
    }

    return Column(
      children: [
        icon,
        const SizedBox(height: 2.0),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: icon.color),
        ),
      ],
    );
  }
}

class _Player extends StatelessWidget {
  const _Player({super.key, required this.data});

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
          const SizedBox(height: 4.0),
          _Items(data.player.items),
        ],
      ),
    );
  }
}

class _Items extends ConsumerWidget {
  const _Items(this.items, {super.key});

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

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 2.0,
      runSpacing: 2.0,
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
    final color = data.player.isDead ? Colors.black54 : null;
    return Text(
      data.player.championName,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: theme.textTheme.labelSmall?.copyWith(
        color: color,
      ),
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
        ChampionImage(player: data.player),
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
        if (data.player.isDead)
          const Positioned.fill(child: ChampionDeadOverlay()),
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
