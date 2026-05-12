# gowebp-testdata

[gowebp](https://github.com/TommyLeng/gowebp) 的基準測試圖片及結果。

Benchmark images and results for [gowebp](https://github.com/TommyLeng/gowebp) — a pure-Go VP8/VP8L WebP encoder.

---

## 測試圖片 / Test Images

使用 [Kodak Lossless True Color Image Suite](https://r0k.us/graphics/kodak/)（業界標準圖像壓縮測試集，768×512 px）。

Using the [Kodak Lossless True Color Image Suite](https://r0k.us/graphics/kodak/) — an industry-standard image compression benchmark (768×512 px).

| 圖片 / Image | 描述 / Description |
|---|---|
| kodim01.png | 石砌建築外牆（紅色窗戶）/ Stone building facade with red shutters |
| kodim05.png | 越野摩托車比賽 / Motocross race |
| kodim15.png | 臉部彩繪的小孩 / Child with face paint |
| kodim20.png | 黃色二戰螺旋槳飛機 / Yellow WWII propeller aircraft |
| kodim23.png | 兩隻金剛鸚鵡 / Two macaw parrots |
| kodim24.png | 巴伐利亞風格彩繪民居 / Bavarian painted house |

---

## 比較結果 / Benchmark Results

測試條件：Apple M1 Max，Go 1.25，cwebp 1.4.0，quality=90

Test conditions: Apple M1 Max, Go 1.25, cwebp 1.4.0, quality=90

### 檔案大小 / File Size

| 圖片 / Image | 原圖 / Original | cwebp | gowebp | Δ size | PSNR (gowebp) |
|---|---|---|---|---|---|
| kodim01.png | 719 kb | 133.8 kb | 151.3 kb | +13% | 32.1 dB |
| kodim05.png | 767 kb | 138.1 kb | 165.7 kb | +20% | 29.3 dB |
| kodim15.png | 598 kb | 72.6 kb | 85.9 kb | +18% | 26.7 dB |
| kodim20.png | 481 kb | 59.4 kb | 69.7 kb | +17% | 24.7 dB |
| kodim23.png | 545 kb | 54.9 kb | 59.9 kb | +9% | 29.8 dB |
| kodim24.png | 690 kb | 116.5 kb | 131.8 kb | +13% | 29.6 dB |
| **平均 / Avg** | | | | **+15%** | **28.7 dB** |

### 速度 / Encoding Speed

| 圖片 / Image | cwebp | gowebp | 加速 / Speedup |
|---|---|---|---|
| kodim01.png（768×512）| 55 ms | 33 ms | **1.7×** |
| kodim05.png | 54 ms | 35 ms | **1.5×** |
| kodim23.png | 44 ms | 23 ms | **1.9×** |

### 人像照片比較 / Portrait Photo Comparison

使用 5 張 AI 生成人像（[thispersondoesnotexist.com](https://thispersondoesnotexist.com)，1024×1024 → 縮放至 300×300，無版權）：

Using 5 AI-generated portraits ([thispersondoesnotexist.com](https://thispersondoesnotexist.com), 1024×1024 → resized to 300×300, no copyright):

| 圖片 / Image | cwebp | gowebp | Δ size | PSNR (gowebp) |
|---|---|---|---|---|
| portrait_1.jpg | 16.2 kb | 17.0 kb | +4.9% | 29.6 dB |
| portrait_2.jpg | 14.7 kb | 15.2 kb | +3.4% | 28.1 dB |
| portrait_3.jpg | 19.0 kb | 20.2 kb | +6.3% | 29.8 dB |
| portrait_4.jpg | 14.0 kb | 15.0 kb | +7.1% | 29.8 dB |
| portrait_5.jpg | 18.6 kb | **18.4 kb** | **−1.1%** | 28.9 dB |
| **平均 / Avg** | | | **+4.1%** | 29.2 dB |

WebP 輸出對比圖見 `results/gowebp/portraits/` 及 `results/libwebp/portraits/`。

WebP output comparison: see `results/gowebp/portraits/` and `results/libwebp/portraits/`.

---

## 說明 / Notes

**為什麼 Kodak 圖片 gowebp 比 cwebp 大？**

**Why is gowebp larger than cwebp on Kodak images?**

Kodak 圖片包含複雜的自然場景（天空漸層、草地細節、建築紋理），這類圖片的特性是：幾乎每個 macroblock 都有中等程度的紋理，SNS 的分段效果不明顯。cwebp 對這類場景有更成熟的量化器校準。

Kodak images contain complex natural scenes (sky gradients, grass textures, architecture details) where almost every macroblock has medium texture. The SNS segmentation is less effective for such uniformly complex scenes. cwebp has more mature quantizer calibration for this content type.

**速度優勢來自哪裡？**

**Why is gowebp faster?**

gowebp 直接作為 Go library 調用，無 subprocess fork 開銷；並使用 wave-front goroutine 並行按行編碼。cwebp 的時間包含 process 啟動（約 5-10ms）。

gowebp runs in-process (no subprocess fork), uses wave-front goroutine parallel encoding across rows. cwebp time includes process startup (~5-10ms).

---

## 對比圖片 / Comparison Images

`results/gowebp/` 和 `results/libwebp/` 目錄包含以上圖片的 WebP 輸出，可自行對比視覺效果。

The `results/gowebp/` and `results/libwebp/` directories contain WebP outputs for visual comparison.

---

## 自行執行測試 / Run Benchmarks Yourself

```bash
# 下載 Kodak 圖片 / Download Kodak images
bash scripts/download_kodak.sh

# 複製到 gowebp 測試目錄 / Copy to gowebp test directory
cp images/*.png /path/to/gowebp/test_data/original/

# 執行比較 / Run comparison
cd /path/to/gowebp
go test -run TestCompareWithCwebp -v -timeout 300s
```

---

## 目錄結構 / Directory Structure

```
gowebp-testdata/
├── images/          # Kodak 測試原圖 / Kodak source images (PNG)
├── results/
│   ├── gowebp/      # gowebp WebP 輸出 / gowebp WebP output
│   └── libwebp/     # cwebp WebP 輸出 / cwebp WebP output
└── scripts/
    └── download_kodak.sh   # 下載 Kodak 全套圖片 / Download full Kodak suite
```
