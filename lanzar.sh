#!/bin/sh
# Lanzador del portal de streaming en modo app (sin barra de direcciones).
URL="file:///home/rabrahamlopez/Default%20Project/streaming-portal/index.html"

if command -v google-chrome >/dev/null 2>&1; then
  exec google-chrome --app="$URL"
elif command -v google-chrome-stable >/dev/null 2>&1; then
  exec google-chrome-stable --app="$URL"
elif command -v chromium >/dev/null 2>&1; then
  exec chromium --app="$URL"
else
  exec xdg-open "$URL"
fi
