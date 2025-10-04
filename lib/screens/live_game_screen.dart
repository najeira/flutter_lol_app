import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/live_game_providers.dart';

class LiveGameScreen extends ConsumerWidget {
  const LiveGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final async = ref.watch(liveGameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Live Game Helper'),
        actions: [
          IconButton(
            onPressed: () => ref.read(liveGameProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          error: e,
          onRetry: () => ref.read(liveGameProvider.notifier).refresh(),
        ),
        data: (data) {
          final players = data?.players ?? const [];
          if (players.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'ゲーム中のデータが見つかりません。\nLeague of Legends の対戦中にアプリを使用してください。',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final gameTime = _formatTime(((data?.gameStats['gameTime'] as num?)?.toDouble()) ?? 0);

          // Group players by team
          final order = players
              .where((p) => (p['team'] ?? '').toString().toUpperCase() == 'ORDER')
              .toList();
          final chaos = players
              .where((p) => (p['team'] ?? '').toString().toUpperCase() == 'CHAOS')
              .toList();

          return RefreshIndicator(
            onRefresh: () => ref.read(liveGameProvider.notifier).refresh(),
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
                      if (data?.activePlayerName != null)
                        Row(
                          children: [
                            const Icon(Icons.person, size: 18),
                            const SizedBox(width: 6),
                            Text(data!.activePlayerName!),
                            IconButton(
                              icon: const Icon(Icons.copy, size: 18),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: data.activePlayerName!));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('名前をコピーしました')),
                                );
                              },
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                _TeamSection(title: 'ORDER', players: order, me: data?.activePlayerName),
                _TeamSection(title: 'CHAOS', players: chaos, me: data?.activePlayerName),
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

class _TeamSection extends StatelessWidget {
  const _TeamSection({required this.title, required this.players, required this.me});

  final String title;
  final List<dynamic> players;
  final String? me;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: Text('$title (${players.length})', style: theme.textTheme.titleMedium),
        ),
        ...players.map((p) => _PlayerTile(player: p, me: me)).cast<Widget>(),
      ],
    );
  }
}

class _PlayerTile extends StatelessWidget {
  const _PlayerTile({required this.player, required this.me});

  final Map<String, dynamic> player;
  final String? me;

  @override
  Widget build(BuildContext context) {
    final name = (player['riotId'] ?? player['summonerName'] ?? player['name'] ?? '').toString();
    final champion = (player['championName'] ?? player['rawChampionName'] ?? '').toString().replaceAll('game_character_displayname_', '');
    final scores = player['scores'] as Map<String, dynamic>?;
    final k = (scores?['kills'] ?? 0) as num;
    final d = (scores?['deaths'] ?? 0) as num;
    final a = (scores?['assists'] ?? 0) as num;
    final creepScore = (scores?['creepScore'] ?? 0) as num;
    final level = (player['level'] ?? player['championStats']?['level'] ?? 0) as num;
    final gold = (scores?['gold'] ?? 0) as num;
    final isMe = me != null && (name == me || (player['summonerName']?.toString() ?? '') == me);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(level.toString()),
        ),
        title: Text('$name${isMe ? ' (You)' : ''}'),
        subtitle: Text('$champion  |  KDA: ${k.toInt()}/${d.toInt()}/${a.toInt()}  CS: ${creepScore.toInt()}  Gold: ${gold.toInt()}'),
      ),
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
            Text('データの取得に失敗しました。League クライアントが起動しており、試合中であることを確認してください。\n\n$_prettyError', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('再試行'),
            )
          ],
        ),
      ),
    );
  }

  String get _prettyError => error.toString();
}
