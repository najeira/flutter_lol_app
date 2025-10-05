import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/player.dart';
import '../providers/game.dart';
import '../screens/team.dart';

class LiveGameScreen extends StatelessWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarText(),
        actions: const [_RefreshButton()],
      ),
      body: const SingleChildScrollView(child: _Body()),
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
      data: (data) => TeamsSideBySide(data),
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
        final blueK = blueG.toDouble() / 1000.0;
        final redK = redG.toDouble() / 1000.0;

        late FontWeight bw;
        late FontWeight rw;
        late Icon icon;
        late double pad;
        if (diff > 1.15) {
          bw = FontWeight.w800;
          rw = FontWeight.w200;
          icon = const Icon(
            Icons.keyboard_double_arrow_left,
            color: Colors.blue,
            size: 24.0,
          );
          pad = 0.0;
        } else if (diff > 1.10) {
          bw = FontWeight.w700;
          rw = FontWeight.w300;
          icon = const Icon(
            Icons.keyboard_double_arrow_left,
            color: Colors.blue,
            size: 22.0,
          );
          pad = 2.0;
        } else if (diff > 1.05) {
          bw = FontWeight.w600;
          rw = FontWeight.w400;
          icon = const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.blue,
            size: 20.0,
          );
          pad = 4.0;
        } else if (diff > 1.0) {
          bw = FontWeight.normal;
          rw = FontWeight.normal;
          icon = Icon(
            Icons.keyboard_arrow_left,
            color: Colors.blue,
            size: 18.0,
          );
          pad = 6.0;
        } else if (diff < 0.85) {
          bw = FontWeight.w200;
          rw = FontWeight.w800;
          icon = const Icon(
            Icons.keyboard_double_arrow_right,
            color: Colors.red,
            size: 24.0,
          );
          pad = 12.0;
        } else if (diff < 0.90) {
          bw = FontWeight.w300;
          rw = FontWeight.w700;
          icon = const Icon(
            Icons.keyboard_double_arrow_right,
            color: Colors.red,
            size: 22.0,
          );
          pad = 10.0;
        } else if (diff < 0.95) {
          bw = FontWeight.w400;
          rw = FontWeight.w600;
          icon = const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.red,
            size: 20.0,
          );
          pad = 8.0;
        } else {
          bw = FontWeight.normal;
          rw = FontWeight.normal;
          icon = const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.red,
            size: 18.0,
          );
          pad = 6.0;
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
            Padding(
              padding: EdgeInsets.only(left: pad, right: 12.0 - pad),
              child: icon,
            ),
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
