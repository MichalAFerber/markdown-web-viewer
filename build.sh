#!/bin/sh
# Build MyKK Markdown Viewer.
#
# The app itself is the single, self-contained index.html — no bundler needed.
# This script only stamps the build date/time into a deployable copy so the
# footer can show "Build <date time> EST". It writes to ./dist.
#
# Cloudflare Pages:  Build command = `sh build.sh`   Output directory = `dist`
set -eu

SRC="index.html"
OUTDIR="dist"
STAMP="$(TZ='America/New_York' date '+%Y-%m-%d %H:%M:%S')"

mkdir -p "$OUTDIR"
sed "s/__BUILD_TIME__/${STAMP}/g" "$SRC" > "$OUTDIR/index.html"

# Carry along any host-specific static files (e.g. Cloudflare Pages headers).
for f in _headers _redirects robots.txt favicon.ico; do
  if [ -f "$f" ]; then cp "$f" "$OUTDIR/"; fi
done

echo "Built $OUTDIR/index.html (build time: $STAMP EST)"
