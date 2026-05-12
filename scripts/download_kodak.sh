#!/bin/bash
# Download the Kodak Lossless True Color Image Suite
# http://r0k.us/graphics/kodak/
# 24 images, 768x512 or 512x768, standard benchmark for image compression

set -e
DEST="$(dirname "$0")/../kodak"
mkdir -p "$DEST"

echo "Downloading Kodak test suite (24 images)..."
for i in $(seq -f "%02g" 1 24); do
    FILE="kodim${i}.png"
    URL="http://r0k.us/graphics/kodak/kodak/${FILE}"
    if [ ! -f "$DEST/$FILE" ]; then
        echo "  Downloading $FILE..."
        curl -s -o "$DEST/$FILE" "$URL"
    else
        echo "  $FILE already exists, skipping."
    fi
done
echo "Done. Images saved to $DEST/"
