import 'package:flutter/material.dart';

import '../services/player.dart';
import '../utils/num.dart';
import 'indicator_icon.dart';

class TeamIndicator extends StatelessWidget {
  const TeamIndicator({
    super.key,
    required this.blue,
    required this.red,
    required this.vertical,
  });

  final PlayerData? blue;
  final PlayerData? red;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (blue == null || red == null) {
      return const SizedBox.shrink();
    }

    final diff = blue!.power - red!.power;
    final label = (diff / 1000.0).abs().toStringAsFixed(1);

    final icon = IndicatorIcon(
      ratio: safeRatio(blue!.power, red!.power),
      size: 14.0,
    );
    final children = [
      icon,
      const SizedBox(width: 2.0),
      Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: icon.blue
              ? Colors.blue
              : (icon.red ? Colors.red : Colors.white70),
        ),
      ),
    ];

    if (vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
