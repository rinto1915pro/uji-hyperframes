#!/bin/bash
# Render uji HyperFrames 100% lokal: semua dir ke ./.hf, telemetri & update check mati, tanpa login HeyGen.
set -e
cd "$(dirname "$0")"
export HYPERFRAMES_CONFIG_DIR=$PWD/.hf/cfg HYPERFRAMES_CACHE_DIR=$PWD/.hf/cache HYPERFRAMES_MEDIA_HOME=$PWD/.hf/media HYPERFRAMES_FONT_CACHE_DIR=$PWD/.hf/fonts
export HYPERFRAMES_NO_TELEMETRY=1 DO_NOT_TRACK=1 HYPERFRAMES_NO_UPDATE_CHECK=1 HYPERFRAMES_NO_AUTO_INSTALL=1
export HYPERFRAMES_BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
npx --yes hyperframes@0.9.65 telemetry disable
npx --yes hyperframes@0.9.65 render --output sambal-15s.mp4
echo "== hasil =="; ffprobe -v error -show_entries format=duration:stream=width,height -of default=nw=1 sambal-15s.mp4
for t in 2 7 12; do ffmpeg -y -loglevel error -ss $t -i sambal-15s.mp4 -frames:v 1 f$(printf %02d $t).png; done
ls -la sambal-15s.mp4 f02.png f07.png f12.png
[ -e ~/.hyperframes ] && echo "PERHATIAN: ~/.hyperframes tercipta" || echo "OK: ~/.hyperframes tidak tercipta"
