import 'package:flutter/material.dart';

import '../providers/player.dart';
import '../utils/team_power_style.dart';

class TeamPowerIndicator extends StatelessWidget {
  const TeamPowerIndicator({
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
    final icon = createPlayerIndicatorIcon(diff);

    if (vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 2.0),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: icon.color),
        ),
      ],
    );
  }
}