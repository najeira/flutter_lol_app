import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lol_app/models/item_master.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart' show Item;
import '../providers/item.dart';
import '../services/player.dart';
import '../providers/player.dart';

import 'champion_image.dart';
import 'item_image.dart';

/// Displays teams as multiple rows using playersByTeamProvider.
///
/// - Single-team widget: [_TeamRow] shows one team's players.
/// - Multi-row widget: [TeamsSideBySide] stacks multiple teams vertically.
class TeamsSideBySide extends StatelessWidget {
  const TeamsSideBySide(this.data, {super.key});

  /// players grouped by team, already sorted by position.
  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TeamRow(players: data.blue),
        _AdvantageRows(data),
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
      children: [
        const SizedBox(width: 8.0),
        for (final pd in players) Flexible(child: _PlayerTile(data: pd)),
        const SizedBox(width: 8.0),
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
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final diff = (data.value - 50).toDouble();
    final bg = (100.0 + (diff * 5.0)).clamp(0.0, 255.0);
    final bw = (diff / 3.0).clamp(0.0, 8.0);

    final vw = data.value.toStringAsFixed(0);
    final pw = (data.power / 1000.0).toStringAsFixed(1);
    final gw = (data.gold / 1000.0).toStringAsFixed(1);

    final color = _teamColor;
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.normal,
    );

    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: EdgeInsets.all(8.0 - bw),
      decoration: BoxDecoration(
        color: color.withAlpha(bg.floor()),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color, width: bw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.player.championName,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(height: 2.0),
          Row(
            children: [
              Stack(
                children: [
                  ChampionImage(
                    player: data.player,
                    size: 44.0,
                    borderRadius: 8.0,
                  ),
                  if (data.player.isDead) const Positioned.fill(child: _Dead()),
                ],
              ),
              const SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lv ${data.player.level}', style: labelStyle),
                  // Text('${pw} p', style: labelStyle),
                  Text('${vw} x', style: labelStyle),
                  Text('${gw} g', style: labelStyle),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          _ItemsRow(data.player.items),
        ],
      ),
    );
  }
}

class _AdvantageRows extends StatelessWidget {
  const _AdvantageRows(this.data, {super.key});

  final PlayersData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final length = math.max(data.blue.length, data.red.length);
    return Row(
      children: [
        for (int i = 0; i < length; i++)
          Flexible(
            child: Center(
              child: _buildIndicator(
                theme,
                data.blue.elementAtOrNull(i),
                data.red.elementAtOrNull(i),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildIndicator(ThemeData theme, PlayerData? blue, PlayerData? red) {
    if (blue == null || red == null) {
      return const SizedBox.shrink();
    }

    final diff = blue.power - red.power;
    final label = (diff / 1000.0).abs().toStringAsFixed(1);

    const size = 16.0;

    Icon icon;
    if (diff > 300) {
      icon = const Icon(Icons.arrow_upward, size: size, color: Colors.blue);
    } else if (diff < -300) {
      icon = const Icon(Icons.arrow_downward, size: size, color: Colors.red);
    } else {
      icon = const Icon(
        Icons.compare_arrows,
        size: size,
        color: Colors.white70,
      );
    }
    return Row(
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
      children: [
        for (final value in values) ItemIcon(item: value),
      ],
    );
  }
}

class _Dead extends StatelessWidget {
  const _Dead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Icon(Icons.close, color: Colors.white70, size: 28.0),
    );
  }
}
