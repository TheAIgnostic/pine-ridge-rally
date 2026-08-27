#!/bin/bash
# Builds Pine Ridge Rally.app — a native WKWebView wrapper around ../index.html.
# Universal binary (arm64 + x86_64), ad-hoc signed. Output: ../dist/
set -euo pipefail
cd "$(dirname "$0")"

APP_NAME="Pine Ridge Rally"
DIST="../dist"
APP="$DIST/$APP_NAME.app"

rm -rf "$DIST"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"

swiftc -O -target arm64-apple-macos11  -o /tmp/prr-arm64  main.swift
swiftc -O -target x86_64-apple-macos11 -o /tmp/prr-x86_64 main.swift
lipo -create /tmp/prr-arm64 /tmp/prr-x86_64 -output "$APP/Contents/MacOS/PineRidgeRally"
rm -f /tmp/prr-arm64 /tmp/prr-x86_64

cp Info.plist "$APP/Contents/Info.plist"
cp ../index.html "$APP/Contents/Resources/index.html"

codesign --force --deep -s - "$APP"

( cd "$DIST" && zip -qry "PineRidgeRally-macOS.zip" "$APP_NAME.app" )
echo "Built: $APP"
echo "Zip:   $DIST/PineRidgeRally-macOS.zip"
