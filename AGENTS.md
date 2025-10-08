# Repository Guidelines

## プロジェクト構成とモジュール整理
`lib/` が Flutter アプリ本体です。
`main.dart` で Riverpod を起動し、`screens/` は試合情報 UI、
`providers/` は Live Client データのポーリングと整形、
`services/` は HTTPS クライアント、
`models/` は API スキーマをマッピングします。
`assets/` にはチャンピオン画像と `item.json` があり、
`test/` は `lib/` と同じ命名（`*_test.dart`）でテストを配置します。
デスクトップ向けのテンプレートは `macos/`、
オフライン検証用のサンプルは `sample/` にあります。
`build/` は生成物なのでレビュー対象から外し、
`pubspec.lock` と `pubspec.yaml` の差分を揃えるようにしてください。
プロジェクト共通の設定やツールは
ルート (`analysis_options.yaml`, `justfile`, `pubspec.yaml`) を参照し、
変更時は README と整合性を取ります。
Module layout を更新するときは README.md の「実装とコード構成」と AGENTS.md の両方を同時に修正し、
`git status` で意図した差分のみか確認してください。

## ビルド・テスト・開発コマンド
依存関係を更新したら `flutter pub get` を実行します。
ライブデータと接続したデスクトップ実行は `flutter run -d macos`
（デフォルトデバイスで良ければ `-d` 省略）です。
静的解析には `flutter analyze` を使います。
`just` レシピでコマンドを統一しており、
`just test` は `flutter test`、
`just build` は `flutter build macos --release`、
`just gen` は `dart run build_runner build --delete-conflicting-outputs` をラップします。
CI を想定したスクリプトはまだ無いため、
必要に応じて `justfile` にレシピを追加してから共有してください。
Flutter SDK のバージョンが変わった場合は `flutter --version` を添えて報告すると助かります。
開発中は `flutter run --hot` を使って Hot Reload を維持し、
端末ログは `flutter logs` で確認するとデバッグが容易になります。

## コーディングスタイルと命名規約
`flutter_lints` に従い、PR 前にアナライザ警告を解消してください。
Dart の整形は `dart format .`
（2 スペースインデント、複数行コレクションでは末尾カンマ推奨）を使用します。
クラスやウィジェットはパスカルケース、プロバイダやサービスはキャメルケース、
ファイル名はスネークケース（例: `live_game_screen.dart`）に揃えます。
アセット画像はゲーム内名称と一致させ、例外時はプレースホルダにフォールバックさせてください。
`analysis_options.yaml` でルールを変更する場合は理由をコメントし、
他の箇所へ波及しないか確認します。
API レスポンスのモデルを更新する際は JSON サンプルを `sample/` に追加し、
型の説明コメントも添えると保守しやすくなります。
UI コンポーネント間で状態を共有する際は Provider の責務を明記し、
レビュー時に context leak や rebuild storm が無いか議論できるようにします。

## テスト方針
単体テストとウィジェットテストは `test/` に配置し、
`lib/` と同名のペアを保つとレビューしやすくなります
（例: `providers/game_provider_test.dart`）。
`group` 名は振る舞いを説明する日本語または英語で記述し、
HTTP クライアントのモック処理は `setUp` で整理します。
Live Client API に影響するプロバイダやサービスを変更したら、
新たなケースを追加しましょう。
プッシュ前に `flutter test` または `just test` を必ず実行し、
失敗時のログは PR で共有してください。
計算ロジックを追加したときは境界値やエラーパスを網羅し、
UI 変更時は Golden テストの導入も検討します。
外部 API をスタブする場合は `package:http/testing.dart` の `MockClient` を使い、
`FakeAsync` でタイマー依存のプロバイダを再現すると再現性が高まります。

## コミットとプルリクエスト
コミットは単一テーマに絞り、履歴に合わせた接頭辞（`feat`, `fix`, `refactor`）を
意識して短い命令形でまとめます。範囲が明確なら `feat: game screen polling tweaks` のように
スコープも含めてください。PR では概要、実行した検証（`flutter test`, `flutter analyze` など）、
関連 Issue、UI 変更があればスクリーンショットや動画を添付します。
新しいアセットやサンプルを追加したときは、PR 本文で格納場所と用途を説明してください。
レビュー前にドラフト PR を活用して方向性をすり合わせるとスムーズです。
多数の変更がある場合はチェックリストを用意し、レビュアーが確認しやすい順に並べます。
自動生成ファイルが含まれる場合はコミットで区切り、
レビューコメントに regenerate 方法（例: ``just gen``）を明記すると親切です。
