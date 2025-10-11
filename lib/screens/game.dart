import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game.dart';
import '../providers/player.dart';
import '../utils/num.dart';
import 'error_view.dart';
import 'indicator_icon.dart';
import 'team.dart';

class LiveGameScreen extends StatelessWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarText(),
        actions: const [_RefreshButton()],
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

// A record to hold the font weights for both teams.
typedef _FontWeights = ({FontWeight blue, FontWeight red});

class _AppBarText extends ConsumerWidget {
  const _AppBarText();

  /// Calculates the font weights for the app bar based on the team power ratio.
  static _FontWeights _fontWeights(double ratio) {
    switch (ratio) {
      case > 1.15:
        return (blue: FontWeight.w800, red: FontWeight.w200);
      case > 1.10:
        return (blue: FontWeight.w700, red: FontWeight.w300);
      case > 1.05:
        return (blue: FontWeight.w600, red: FontWeight.w400);
      case < 0.85:
        return (blue: FontWeight.w200, red: FontWeight.w800);
      case < 0.90:
        return (blue: FontWeight.w300, red: FontWeight.w700);
      case < 0.95:
        return (blue: FontWeight.w400, red: FontWeight.w600);
      default:
        return (blue: FontWeight.normal, red: FontWeight.normal);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final future = ref.watch(playersProvider);
    return future.when(
      data: (data) {
        final ratio = safeRatio(
          data.blue.fold(0.0, (a, pd) => a + pd.power),
          data.red.fold(0.0, (a, pd) => a + pd.power),
        );

        final blueGold = data.blue.fold(0, (a, pd) => a + pd.gold);
        final redGold = data.red.fold(0, (a, pd) => a + pd.gold);
        final blueGoldK = blueGold / 1000.0;
        final redGoldK = redGold / 1000.0;

        final fontWeights = _fontWeights(ratio);
        final icon = IndicatorIcon(
          ratio: ratio,
          size: 16.0,
        );

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
