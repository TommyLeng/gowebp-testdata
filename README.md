# gowebp-testdata

Benchmark images and results for [gowebp](https://github.com/TommyLeng/gowebp) — a pure-Go VP8/VP8L WebP encoder.

[gowebp](https://github.com/TommyLeng/gowebp) 的基準測試圖片及結果。

---

## Structure / 目錄結構

```
gowebp-testdata/
├── kodak/          # Kodak Lossless True Color Image Suite (24 images)
├── synthetic/      # Tiny generated test images / 合成測試小圖
├── results/        # Benchmark output images / 輸出對比圖
└── scripts/        # Download and benchmark scripts / 下載及測試腳本
```

## Download Kodak Images / 下載 Kodak 測試圖

The [Kodak Lossless True Color Image Suite](http://r0k.us/graphics/kodak/) is a standard benchmark used in image compression research. 24 images, 768×512 or 512×768 pixels.

```bash
bash scripts/download_kodak.sh
```

## Run Benchmarks / 執行基準測試

Requires [cwebp](https://developers.google.com/speed/webp/docs/cwebp) and Go 1.18+.

```bash
# Clone gowebp and this repo side by side
git clone https://github.com/TommyLeng/gowebp
git clone https://github.com/TommyLeng/gowebp-testdata

# Copy Kodak images to gowebp test_data
cp -r gowebp-testdata/kodak/* gowebp/test_data/original/

# Run comparison
cd gowebp
go test -run TestCompareWithCwebp -v -timeout 300s
```
