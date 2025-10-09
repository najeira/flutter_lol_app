import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/player.dart';
import '../providers/game.dart';

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
      error: (e, _) => _ErrorView(error: e),
      data: (data) => Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: ResponsiveTeamsLayout(data: data),
      ),
    );
  }
}

class _AppBarText extends ConsumerWidget {
  const _AppBarText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final future = ref.watch(playersProvider);
    return future.when(
      data: (data) {
        final blue = data.blue.fold(1.0, (a, pd) => a + pd.power);
        final red = data.red.fold(1.0, (a, pd) => a + pd.power);
        final diff = blue / red;

        final blueG = data.blue.fold(0, (a, pd) => a + pd.gold);
        final redG = data.red.fold(0, (a, pd) => a + pd.gold);
        final blueK = blueG / 1000.0;
        final redK = redG / 1000.0;

        late FontWeight bw;
        late FontWeight rw;
        if (diff > 1.15) {
          bw = FontWeight.w800;
          rw = FontWeight.w200;
        } else if (diff > 1.10) {
          bw = FontWeight.w700;
          rw = FontWeight.w300;
        } else if (diff > 1.05) {
          bw = FontWeight.w600;
          rw = FontWeight.w400;
        } else if (diff > 1.0) {
          bw = FontWeight.normal;
          rw = FontWeight.normal;
        } else if (diff < 0.85) {
          bw = FontWeight.w200;
          rw = FontWeight.w800;
        } else if (diff < 0.90) {
          bw = FontWeight.w300;
          rw = FontWeight.w700;
        } else if (diff < 0.95) {
          bw = FontWeight.w400;
          rw = FontWeight.w600;
        } else {
          bw = FontWeight.normal;
          rw = FontWeight.normal;
        }

        const iconSize = 16.0;
        late Icon icon;
        if (diff > 1.05) {
          icon = const Icon(
            Icons.align_horizontal_left,
            color: Colors.blue,
            size: iconSize,
          );
        } else if (diff < 0.95) {
          icon = const Icon(
            Icons.align_horizontal_right,
            color: Colors.red,
            size: iconSize,
          );
        } else {
          icon = const Icon(
            Icons.align_horizontal_center,
            color: Colors.white70,
            size: iconSize,
          );
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              blueK.toStringAsFixed(1),
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.blueAccent,
                fontWeight: bw,
              ),
            ),
            const SizedBox(width: 4.0),
            icon,
            const SizedBox(width: 4.0),
            Text(
              redK.toStringAsFixed(1),
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.redAccent,
                fontWeight: rw,
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

class _RefreshButton extends StatelessWidget {
  const _RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.container().invalidate(gameDataProvider);
      },
      icon: const Icon(Icons.refresh),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.connecting_airports, size: 48),
            const SizedBox(height: 12),
            Text(
              'データの取得に失敗しました。'
              'Leagueクライアントが起動しており、'
              '試合中であることを確認してください。'
              '\n\n${error}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                context.container().invalidate(gameDataProvider);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('再読込'),
            ),
          ],
        ),
      ),
    );
  }
}

extension _BuildContextExtension on BuildContext {
  ProviderContainer container() {
    return ProviderScope.containerOf(this, listen: false);
  }
}
