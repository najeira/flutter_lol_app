default:
  just --list

build:
  flutter build macos --release

test:
  flutter test

format:
  dart format .

analyze:
  flutter analyze

gen:
  dart run build_runner build --delete-conflicting-outputs

icon:
  dart run flutter_launcher_icons
