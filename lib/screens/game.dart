import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_lol_app/providers/player.dart';
import 'package:flutter_lol_app/providers/game.dart';
import 'package:flutter_lol_app/screens/team.dart';

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
    final async = ref.watch(playersByTeamProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorView(error: e),
      data: (data) {
        if (data.isEmpty) {
          return Text("NO DATA");
        }
        return TeamsSideBySide(rows: data);
      },
    );
  }
}

class _AppBarText extends ConsumerWidget {
  const _AppBarText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(playersByTeamProvider);
    final text = future.when(
      data: (rows) {
        // Build totals per team
        final totals = <String, double>{};
        for (final row in rows) {
          if (row.isNotEmpty) {
            final team = row.first.player.team.toUpperCase();
            final sum = row.fold(0.0, (a, pd) => a + pd.power);
            totals[team] = sum;
          }
        }

        if (totals.length != 2) {
          return '……';
        }

        final order = totals["ORDER"] ?? 2500.0;
        final chaos = totals["CHAOS"] ?? 2500.0;
        if (order > chaos) {
          final diff = order / chaos;
          if (diff < 1.1) {
            return "互角";
          }
          return "青 ${diff.toStringAsFixed(1)}";
        } else {
          final diff = chaos / order;
          if (diff < 1.1) {
            return "互角";
          }
          return "赤 ${diff.toStringAsFixed(1)}";
        }
      },
      error: (_, __) => "League of Legends",
      loading: () => "League of Legends",
    );
    return Text(text);
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
