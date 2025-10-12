set dotenv-load := true

app_file := "build/macos/Build/Products/Release/RiftPulse.app"

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

icon:
  dart run flutter_launcher_icons

sign:
  codesign --force --deep --strict --verbose --timestamp \
    --entitlements=macos/Runner/Release.entitlements \
    --options=runtime --sign "${APPLE_SIGN_NAME}" {{app_file}}

verify:
  codesign --verify --deep --strict --verbose=4 {{app_file}}
  spctl --assess --verbose {{app_file}}
  codesign -d --entitlements - {{app_file}}

zip:
  ditto -c -k --sequesterRsrc --keepParent \
    "{{app_file}}" \
    "RiftPulse.zip"

notary:
  xcrun notarytool submit RiftPulse.zip \
    --apple-id "${APPLE_EMAIL_ADDRESS}" \
    --team-id "${APPLE_TEAM_ID}" \
    --password "${APP_SPECIFIC_PASSWORD}" \
    --wait

staple:
  xcrun stapler staple {{app_file}}
