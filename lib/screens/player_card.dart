import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart' show Item;
import '../providers/item.dart';
import '../services/player.dart';

import 'champion_image.dart';
import 'item_image.dart';
import 'item_tooltip.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.data,
  });

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
    final bg = (100.0 + (diff * 6.0)).clamp(0.0, 255.0);
    final bw = (diff / 2.0).clamp(0.0, 8.0);

    final color = _teamColor;

    return Container(
      padding: EdgeInsets.all(8.0 - bw),
      decoration: BoxDecoration(
        color: color.withAlpha(bg.floor()),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color, width: bw),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChampionName(data: data),
          const SizedBox(height: 4.0),
          _ChampionIcon(data: data),
          const SizedBox(height: 4.0),
          _Items(items: data.player.items),
        ],
      ),
    );
  }
}

class _Items extends ConsumerWidget {
  const _Items({
    super.key,
    required this.items,
  });

  final List<Item> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemMaster = ref.watch(itemMasterValueProvider);

    final values = items.map((item) {
      if (item.consumable) {
        return null;
      }

      final data = itemMaster?[item.itemID];
      if (data == null) {
        return null;
      } else if (data.consumed) {
        return null;
      } else if (data.gold.total <= 0) {
        return null;
      } else if (data.tags.contains("Consumable")) {
        return null;
      }

      return data;
    }).nonNulls;

    return Container(
      constraints: BoxConstraints(
        minHeight: 24.0,
      ),
      child: Wrap(
        // runAlignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 2.0,
        runSpacing: 2.0,
        children: [
          for (final value in values)
            ItemTooltip(
              item: value,
              child: ItemIcon(item: value),
            ),
        ],
      ),
    );
  }
}

class _ChampionName extends StatelessWidget {
  const _ChampionName({required this.data});

  final PlayerData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        _ScoreLabel(data: data),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            data.player.championName,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class _ChampionIcon extends StatelessWidget {
  const _ChampionIcon({required this.data});

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
        // Positioned(
        //   top: 0.0,
        //   left: 0.0,
        //   child: Container(
        //     padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
        //     color: Colors.black38,
        //     child: Text("${data.value}", style: labelStyle),
        //   ),
        // ),
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
          const Positioned.fill(child: _ChampionDeadOverlay()),
      ],
    );
  }
}

class _ChampionDeadOverlay extends StatelessWidget {
  const _ChampionDeadOverlay();

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

class _ScoreLabel extends StatelessWidget {
  const _ScoreLabel({required this.data});

  final PlayerData data;

  FontWeight get weight {
    switch (data.value) {
      case > 60:
        return FontWeight.w600;
      case > 55:
        return FontWeight.w500;
      case < 40:
        return FontWeight.w200;
      case < 45:
        return FontWeight.w300;
      default:
        return FontWeight.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final diff = (data.value - 50).toDouble();
    final textColor = Color.fromARGB(
      0xFF,
      0xFF,
      0xFF,
      0xFF - (diff * 10.0).clamp(0.0, 255.0).floor(),
    );

    return Container(
      height: 18.0,
      width: 20.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Colors.white60,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          "${data.value}",
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: theme.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
