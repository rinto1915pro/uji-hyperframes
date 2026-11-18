# Render uji "Sambal Botol Bu Rina" (15 detik, 1080x1920) — jalankan sendiri di Terminal (bukan dari sesi Claude)

Sandbox sesi Claude melarang bind port lokal; HyperFrames butuh file server 127.0.0.1 saat render, jadi render harus dijalankan Bos sendiri.
Semua direktori HyperFrames diarahkan ke folder uji ini. Tidak ada login HeyGen, telemetri dimatikan lewat env + perintah.

```bash
cd ~/Documents/PROJECT_STUDIO_US/SOSMED_US/LAPORAN_ANALIS/uji-hyperframes-sambal
export HYPERFRAMES_CONFIG_DIR=$PWD/.hf/cfg HYPERFRAMES_CACHE_DIR=$PWD/.hf/cache HYPERFRAMES_MEDIA_HOME=$PWD/.hf/media HYPERFRAMES_FONT_CACHE_DIR=$PWD/.hf/fonts
export HYPERFRAMES_NO_TELEMETRY=1 DO_NOT_TRACK=1 HYPERFRAMES_NO_UPDATE_CHECK=1 HYPERFRAMES_NO_AUTO_INSTALL=1
export HYPERFRAMES_BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
npx --yes hyperframes@0.9.65 telemetry disable
npx --yes hyperframes@0.9.65 render --output sambal-15s.mp4
ffprobe -v error -show_entries format=duration:stream=width,height -of default=nw=1 sambal-15s.mp4
ffmpeg -y -ss 2 -i sambal-15s.mp4 -frames:v 1 f02.png && ffmpeg -y -ss 7 -i sambal-15s.mp4 -frames:v 1 f07.png && ffmpeg -y -ss 12 -i sambal-15s.mp4 -frames:v 1 f12.png
```

Yang dicek setelah selesai: durasi 15 detik, 1080x1920; f02/f07/f12.png menampilkan teks Indonesia utuh; `ls ~/.hyperframes` harus "No such file" (semua tulis ke .hf/).
JANGAN jalankan `hyperframes usage` atau `hyperframes login` (lihat laporan HASIL-UJI-HYPERFRAMES-2026-11-18.md catatan 1).
