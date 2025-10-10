import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game.dart';
import '../providers/player.dart';
import '../utils/team_power_style.dart';
import '../widgets/error_view.dart';
import 'team.dart';

class LiveGameScreen extends StatelessWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarText(),
        actions: [_RefreshButton()],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(playersProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorView(error: e),
      data: (data) => Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: TeamsResponsive(data: data),
      ),
    );
  }
}

class _AppBarText extends ConsumerWidget {
  const _AppBarText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final future = ref.watch(playersProvider);
    return future.when(
      data: (data) {
        final bluePower = data.blue.fold(1.0, (a, pd) => a + pd.power);
        final redPower = data.red.fold(1.0, (a, pd) => a + pd.power);
        final ratio = bluePower / redPower;

        final blueGold = data.blue.fold(0, (a, pd) => a + pd.gold);
        final redGold = data.red.fold(0, (a, pd) => a + pd.gold);
        final blueGoldK = blueGold / 1000.0;
        final redGoldK = redGold / 1000.0;

        final fontWeights = calculateAppBarFontWeights(ratio);
        final icon = createAppbarIcon(ratio);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              blueGoldK.toStringAsFixed(1),
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.blueAccent,
                fontWeight: fontWeights.blue,
              ),
            ),
            const SizedBox(width: 4.0),
            icon,
            const SizedBox(width: 4.0),
            Text(
              redGoldK.toStringAsFixed(1),
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.redAccent,
                fontWeight: fontWeights.red,
              ),
            ),
          ],
        );
      },
      error: (_, __) => const Text("League of Legends"),
      loading: () => const Text("League of Legends"),
    );
  }
}

class _RefreshButton extends ConsumerWidget {
  const _RefreshButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.invalidate(gameDataProvider);
      },
      icon: const Icon(Icons.refresh),
    );
  }
}

