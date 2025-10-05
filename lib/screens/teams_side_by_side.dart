import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/all_game_data.dart';
import '../models/player.dart';
import '../providers/game.dart';
import '../providers/player.dart';
import '../services/player.dart';
import 'champion_image.dart';

/// Displays teams as multiple rows using playersByTeamProvider.
///
/// - Single-team widget: [_TeamRow] shows one team's players.
/// - Multi-row widget: [TeamsSideBySide] stacks multiple teams vertically.
class TeamsSideBySide extends StatelessWidget {
  const TeamsSideBySide({
    super.key,
    required this.rows,
    this.meName,
  });

  /// players grouped by team, already sorted by position.
  final List<List<PlayerData>> rows;

  /// Optional: player name to highlight (e.g., active player).
  final String? meName;

  Color _teamColor(ThemeData theme, String team) {
    switch (team.toUpperCase()) {
      case 'ORDER':
        return theme.colorScheme.primary;
      case 'CHAOS':
        return theme.colorScheme.secondary;
      default:
        return theme.colorScheme.tertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (rows.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('プレイヤー情報がありません'),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final teamPlayers in rows) ...[
          _TeamRow(
            title: (teamPlayers.isNotEmpty
                    ? teamPlayers.first.player.team.toString()
                    : 'TEAM')
                .toUpperCase(),
            players: teamPlayers,
            meName: meName,
            titleColor: _teamColor(
              theme,
              teamPlayers.isNotEmpty
                  ? teamPlayers.first.player.team.toString()
                  : 'TEAM',
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _TeamRow extends StatelessWidget {
  const _TeamRow({
    required this.title,
    required this.players,
    required this.meName,
    required this.titleColor,
  });

  final String title;
  final List<PlayerData> players;
  final String? meName;
  final Color titleColor;

  bool _isMe(Player p) {
    if (meName == null || meName!.isEmpty) return false;
    // Compare with riotIdGameName or summonerName
    return p.riotIdGameName == meName || p.summonerName == meName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 18,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: titleColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        for (final pd in players)
          _PlayerTile(player: pd.player, highlight: _isMe(pd.player)),
      ],
    );
  }
}

class _PlayerTile extends StatelessWidget {
  const _PlayerTile({required this.player, this.highlight = false});
  final Player player;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = player.riotIdGameName.isNotEmpty
        ? player.riotIdGameName
        : player.summonerName;

    final kda = '${player.scores.kills}/${player.scores.deaths}/${player.scores.assists}';
    final cs = player.scores.creepScore;

    final bg = highlight
        ? theme.colorScheme.primary.withOpacity(0.08)
        : theme.colorScheme.surface;
    final borderColor = highlight
        ? theme.colorScheme.primary.withOpacity(0.35)
        : theme.dividerColor.withOpacity(0.5);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ChampionImage(player: player, size: 44, borderRadius: 8),
              if (player.isDead)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.close, color: Colors.white70),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Lv ${player.level}',
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        player.championName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('KDA $kda', style: theme.textTheme.bodySmall),
                    const SizedBox(width: 8),
                    Text('CS $cs', style: theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A ready-to-use screen that shows teams side-by-side by consuming [playersByTeamProvider].
class TeamsSideBySideScreen extends ConsumerWidget {
  const TeamsSideBySideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamsAsync = ref.watch(playersByTeamProvider);
    final gameAsync = ref.watch(gameDataProvider);

    String? meName;
    gameAsync.whenOrNull(
      data: (AllGameData data) {
        final ap = data.activePlayer;
        final a = ap;
        if (a != null) {
          meName = a.riotIdGameName.isNotEmpty ? a.riotIdGameName : a.summonerName;
        } else {
          meName = '';
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      body: teamsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('読み込みに失敗しました\n$e'),
          ),
        ),
        data: (rows) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.refresh(gameDataProvider.future);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                TeamsSideBySide(rows: rows, meName: meName),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}
