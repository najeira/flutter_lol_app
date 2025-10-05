import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lol_app/providers/player.dart';
import 'package:flutter_lol_app/screens/teams_side_by_side.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game.dart';
import '../models/all_game_data.dart';
import '../models/player.dart';

class LiveGameScreen extends ConsumerWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final async = ref.watch(gameDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Live Game Helper'),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(gameDataProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          error: e,
          onRetry: () => ref.invalidate(gameDataProvider),
        ),
        data: (AllGameData data) {
          final players = data.allPlayers;
          if (players.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'ゲーム中のデータが見つかりません。\n'
                  'League of Legends の対戦中にアプリを使用してください。',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final gameTime = _formatTime(data.gameData.gameTime);
          final ap = data.activePlayer;
          String meName = '';
          final a = ap;
          if (a != null) {
            meName = a.riotIdGameName.isNotEmpty ? a.riotIdGameName : a.summonerName;
          }

          // Group players by team
          final order = players
              .where((p) => (p.team).toString().toUpperCase() == 'ORDER')
              .toList();
          final chaos = players
              .where((p) => (p.team).toString().toUpperCase() == 'CHAOS')
              .toList();

          return RefreshIndicator(
            onRefresh: () async {
              await ref.refresh(gameDataProvider.future);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '試合時間: $gameTime',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      if (meName.isNotEmpty)
                        Row(
                          children: [
                            const Icon(Icons.person, size: 18),
                            const SizedBox(width: 6),
                            Text(meName),
                            IconButton(
                              icon: const Icon(Icons.copy, size: 18),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: meName));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('名前をコピーしました')),
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                _Teams(),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatTime(double seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(1, '0')}:${s.toInt().toString().padLeft(2, '0')}';
  }
}

class _Teams extends ConsumerWidget {
  const _Teams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(playersByTeamProvider);
    return future.when(
        data: (data) {
          return TeamsSideBySide(rows: data);
        },
        error: (_, __) => CircularProgressIndicator(),
        loading: () => CircularProgressIndicator(),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48),
            const SizedBox(height: 12),
            Text(
              'データの取得に失敗しました。League クライアントが起動しており、試合中であることを確認してください。\n\n$_prettyError',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('再試行'),
            ),
          ],
        ),
      ),
    );
  }

  String get _prettyError => error.toString();
}
