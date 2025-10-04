import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/live_game_providers.dart';
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
                  'ゲーム中のデータが見つかりません。\nLeague of Legends の対戦中にアプリを使用してください。',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final gameTime = _formatTime(data.gameData.gameTime);
          final meName = data.activePlayer.riotIdGameName.isNotEmpty
              ? data.activePlayer.riotIdGameName
              : data.activePlayer.summonerName;

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
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                _TeamSection(title: 'ORDER', players: order, me: meName),
                _TeamSection(title: 'CHAOS', players: chaos, me: meName),
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
  final List<Player> players;
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

  final Player player;
  final String? me;

  @override
  Widget build(BuildContext context) {
    final String name = player.riotId.isNotEmpty ? player.riotId : (player.summonerName);
    final String champion = (player.championName.isNotEmpty
            ? player.championName
            : player.rawChampionName)
        .replaceAll('game_character_displayname_', '');
    final k = player.scores.kills;
    final d = player.scores.deaths;
    final a = player.scores.assists;
    final creepScore = player.scores.creepScore;
    final level = player.level;
    final bool isMe = me != null && (name == me || player.summonerName == me);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(level.toString()),
        ),
        title: Text('$name${isMe ? ' (You)' : ''}'),
        subtitle: Text('$champion  |  KDA: $k/$d/$a  CS: $creepScore'),
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
