# LoL Live Game Helper (Flutter)

League of Legends の試合中データをローカルの Live Client Data API (`http://127.0.0.1:2999`) から取得し、プレイヤーに役立つ情報（試合時間、チームごとのプレイヤー一覧、K/D/A、CS、ゴールド等）を表示する Flutter アプリです。

ext/api 以下に自動生成された OpenAPI クライアント（`openapi` パッケージ）が含まれており、アプリはこのクライアントを利用して API にアクセスします。

## 必要要件
- League of Legends クライアントが起動しており、対戦（サモナーズリフト等）が進行中であること
- Live Client Data API が有効（通常は対戦中に `http://127.0.0.1:2999/liveclientdata/*` が利用可能）
- Flutter SDK がインストール済み

## 使い方
1. LoL クライアントを起動し、実際に試合に入ってください。
2. このリポジトリのルートで依存関係を取得します。
   ```bash
   flutter pub get
   ```
3. アプリを起動します。
   ```bash
   flutter run
   ```
4. 画面上に以下が表示されます。
   - 試合時間
   - 自分（Active Player）の名前
   - ORDER / CHAOS 各チームのプレイヤー一覧（チャンピオン、レベル、K/D/A、CS、Gold）
   - 5 秒ごとに自動更新。手動更新は右上の更新ボタン、または画面のプルダウンで可能

## 実装メモ
- `lib/services/live_client_service.dart`
  - `openapi` クライアント（Dio）を `basePathOverride: http://127.0.0.1:2999` で初期化し、
    `/liveclientdata/*` エンドポイント（`allgamedata`, `gamestats`, `playerlist`, `activeplayername` など）にアクセスします。
- `lib/screens/live_game_screen.dart`
  - 上記サービスを用いてデータを取得・表示する UI を実装しています。
  - エラー時はリトライボタンを表示。試合外では「データが見つかりません」メッセージを表示します。
- `lib/main.dart`
  - Home を `LiveGameScreen` に設定しています。
- `pubspec.yaml`
  - `openapi` を `ext/api` への path 依存で追加しています。

## 注意事項
- Live Client Data API は試合中のみ利用でき、練習ツール・カスタムも含みます。
- 対戦中でない場合や、クライアントが起動していない場合はエラーまたは空表示になります。
- 本ツールは Riot Games 公式ではありません。利用は自己責任でお願いします。
