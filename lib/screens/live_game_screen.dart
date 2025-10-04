import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/live_client_service.dart';

class LiveGameScreen extends StatefulWidget {
  const LiveGameScreen({super.key});

  @override
  State<LiveGameScreen> createState() => _LiveGameScreenState();
}

class _LiveGameScreenState extends State<LiveGameScreen> {
  final _service = LiveClientService();
  Map<String, dynamic>? _gameStats; // basic game stats
  List<dynamic>? _players; // all players
  String? _activePlayerName;
  Object? _error;
  bool _loading = true;
  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    _load();
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 5), (_) => _refreshSilently());
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _refreshSilently() async {
    try {
      final players = await _service.getPlayerList();
      final stats = await _service.getGameStats();
      final me = await _service.getActivePlayerName();
      if (!mounted) return;
      setState(() {
        _players = players;
        _gameStats = stats;
        _activePlayerName = me;
        _error = null;
      });
    } catch (_) {
      // ignore background refresh errors
    }
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final results = await Future.wait([
        _service.getPlayerList(),
        _service.getGameStats(),
        _service.getActivePlayerName(),
      ]);
      if (!mounted) return;
      setState(() {
        _players = results[0] as List<dynamic>;
        _gameStats = results[1] as Map<String, dynamic>;
        _activePlayerName = results[2] as String?;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Live Game Helper'),
        actions: [
          IconButton(onPressed: _load, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _buildBody(theme),
    );
  }

  Widget _buildBody(ThemeData theme) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return _ErrorView(error: _error!, onRetry: _load);
    }
    if (_players == null || _players!.isEmpty) {
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

    final gameTime = _formatTime((_gameStats?['gameTime'] as num?)?.toDouble() ?? 0);

    // Group players by team
    final order = _players!.where((p) => (p['team'] ?? '').toString().toUpperCase() == 'ORDER').toList();
    final chaos = _players!.where((p) => (p['team'] ?? '').toString().toUpperCase() == 'CHAOS').toList();

    return RefreshIndicator(
      onRefresh: _load,
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
                if (_activePlayerName != null)
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18),
                      const SizedBox(width: 6),
                      Text(_activePlayerName!),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 18),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: _activePlayerName!));
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
          _TeamSection(title: 'ORDER', players: order, me: _activePlayerName),
          _TeamSection(title: 'CHAOS', players: chaos, me: _activePlayerName),
          const SizedBox(height: 24),
        ],
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
