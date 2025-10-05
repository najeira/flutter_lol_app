# LoL Live Game Helper (Flutter)

League of Legends の試合中に、ローカルの Live Client Data API（`https://127.0.0.1:2999`）からデータを取得し、試合の状況把握に役立つ情報（チーム比較、各レーンの優勢/劣勢、チャンピオンやレベル、装備価値ベースの「パワー」など）を表示する Flutter アプリです。

このリポジトリは、アプリ内でシンプルな HTTP クライアント（`package:http`）を直接使用して Live Client Data API にアクセスします。OpenAPI の生成物は使用していません。

## 必要要件
- League of Legends クライアントが起動しており、実際に試合（サモナーズリフト等）に入っていること
- Live Client Data API が有効（試合中のみ `https://127.0.0.1:2999/liveclientdata/*` が利用可能）
- Flutter SDK（Dart SDK 3.9 以降）

## 使い方
1. LoL クライアントを起動し、試合に入ってください。
2. 依存関係を取得します。
   ```bash
   flutter pub get
   ```
3. アプリを起動します。
   ```bash
   flutter run
   ```
   - macOS でデスクトップアプリとして起動する場合は `-d macos` を付けても構いません。
4. 画面上には次の情報が表示されます。
   - 上部 AppBar: 両チームの合計ゴールド（K 表記）と優勢側を示す矢印/太字
   - ORDER（青）/ CHAOS（赤）の各チームのプレイヤーカード（チャンピオン画像、レベル、推定パワー、装備ゴールド）
   - レーンごとの優勢/劣勢インジケータ（上下矢印と差分表示）
   - 自動更新（既定2秒間隔、失敗時は指数バックオフ）。右上の更新アイコンで手動リロード可能

## 主な機能
- Live Client Data API の `/liveclientdata/allgamedata` をポーリングして最新情報を表示
- プレイヤーの装備（アイテム）とレベルから「パワー」を算出し、チーム・レーンごとの差分を可視化
- プレイヤーはロール順（TOP/JG/MID/BOT/SUP）に自動整列
- チャンピオン画像は `assets/champion/<Name>.png` を利用（なければプレースホルダ表示）

## 実装とコード構成
- UI
  - `lib/main.dart` — Riverpod の `ProviderScope` でアプリを起動し、`LiveGameScreen` を表示
  - `lib/screens/game.dart` — 画面本体。データの読込状態/エラー表示や手動リロードボタンを実装
  - `lib/screens/team.dart` — チーム横並び表示、プレイヤーカード、レーン別インジケータ
  - `lib/screens/champion_image.dart` — プレイヤー情報からチャンピオン画像アセットを解決して表示
- 状態管理/プロバイダ
  - `lib/providers/game.dart` — `/allgamedata` を2秒間隔でポーリング（失敗時は最大30秒まで指数バックオフ）。`gameDataProvider`
  - `lib/providers/player.dart` — プレイヤーリストの整形（チーム分割、ロール順ソート、合計/差分の計算）。`playersProvider`
  - `lib/providers/item.dart` — アイテムマスタのロード
- サービス/ロジック
  - `lib/services/game.dart` — `package:http` と `IOClient` を用いて `https://127.0.0.1:2999/liveclientdata/allgamedata` にアクセス（ローカル証明書は検証スキップ）
  - `lib/services/player.dart` — アイテム価格とレベルからパワー/装備ゴールドを算出
- モデル/アセット
  - `lib/models/*` — Live Client Data の JSON モデル（`allgamedata.json` を基に作成）
  - `assets/item.json` — アイテムマスタ
  - `assets/champion/` — チャンピオン画像
- 依存関係
  - Riverpod（`flutter_riverpod`）、HTTP クライアント（`http`）、ユーティリティ（`collection`）

## トラブルシュート
- データが取得できない場合:
  - 試合中であることを確認（ロビーやクライアント起動のみでは API は応答しません）
  - OS のファイアウォールやセキュリティ設定が `127.0.0.1:2999` への接続を妨げていないか確認
  - 一時的なエラー時はポーリング間隔が伸びます（最大30秒）。右上の更新ボタンで即時再試行可能

## 注意事項
- Live Client Data API は試合中のみ有効です（練習ツール・カスタムも可）
- 本ツールは Riot Games 公式ではありません。利用は自己責任でお願いします。
