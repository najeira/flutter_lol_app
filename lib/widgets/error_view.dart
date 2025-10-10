import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game.dart';

class ErrorView extends ConsumerWidget {
  const ErrorView({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              '\n\n$error',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // gameDataProviderを無効化して再取得をトリガー
                ref.invalidate(gameDataProvider);
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