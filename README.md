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

測試條件：Apple M1 Max，Go 1.25，cwebp 1.6.0，quality=90

Test conditions: Apple M1 Max, Go 1.25, cwebp 1.6.0, quality=90

### 檔案大小：Kodak 標準測試集 / File Size: Kodak Suite

| 圖片 / Image | 原圖 / Original | cwebp -m4 | cwebp -m6 | gowebp | Δ vs m4 | Δ vs m6 | PSNR |
|---|---|---|---|---|---|---|---|
| kodim01.png | 719 kb | 133.8 kb | 131.8 kb | **125.1 kb** | −6.5% | **−5.1%** | 32.1 dB |
| kodim05.png | 767 kb | 138.1 kb | 135.3 kb | **130.7 kb** | −5.4% | **−3.4%** | 29.2 dB |
| kodim15.png | 598 kb | 72.6 kb | 69.6 kb | **66.2 kb** | −8.8% | **−4.9%** | 26.7 dB |
| kodim20.png | 481 kb | 59.4 kb | 56.9 kb | **55.1 kb** | −7.2% | **−3.2%** | 24.7 dB |
| kodim23.png | 545 kb | 54.9 kb | 51.2 kb | **44.4 kb** | −19.1% | **−13.3%** | 29.7 dB |
| kodim24.png | 690 kb | 116.5 kb | 111.9 kb | **107.1 kb** | −8.1% | **−4.3%** | 29.6 dB |
| **平均 / Avg** | | | | | **−9.2%** | **−5.7%** | **28.7 dB** |

### 檔案大小：人像照片 / File Size: Portrait Photos

使用 5 張 AI 生成人像（[thispersondoesnotexist.com](https://thispersondoesnotexist.com)，縮放至 300×300，無版權）：

Using 5 AI-generated portraits ([thispersondoesnotexist.com](https://thispersondoesnotexist.com), resized to 300×300, no copyright):

| 圖片 / Image | cwebp -m4 | cwebp -m6 | gowebp | Δ vs m4 | Δ vs m6 | PSNR |
|---|---|---|---|---|---|---|
| portrait_1.jpg | 16.2 kb | — | **13.0 kb** | −19.8% | — | 29.6 dB |
| portrait_2.jpg | 14.7 kb | — | **11.8 kb** | −19.7% | — | 28.0 dB |
| portrait_3.jpg | 19.0 kb | — | **15.7 kb** | −17.4% | — | 29.7 dB |
| portrait_4.jpg | 14.0 kb | — | **11.5 kb** | −17.9% | — | 29.8 dB |
| portrait_5.jpg | 18.6 kb | — | **14.2 kb** | −23.7% | — | 28.9 dB |
| **平均 / Avg** | | | | **−19.7%** | — | **29.2 dB** |

（cwebp -m6 人像數據待下次重新執行基準測試後補充。/ cwebp -m6 portrait data pending next benchmark run.）

### 速度 / Encoding Speed (Kodak 768×512, Apple M1 Max)

gowebp 使用 wave-front goroutine 並行，GOMAXPROCS 越高越快；cwebp 預設單執行緒。

gowebp uses wave-front goroutine parallelism; cwebp runs single-threaded.

| 圖片 / Image | cwebp -m4 | gowebp P=1 | gowebp P=2 | gowebp P=4 | gowebp P=10 |
|---|---|---|---|---|---|
| kodim01.png | 59 ms | 110 ms (0.5×) | 87 ms (0.7×) | 46 ms (**1.3×**) | 29 ms (**2.0×**) |
| kodim05.png | 75 ms | 107 ms (0.7×) | 87 ms (0.9×) | 42 ms (**1.8×**) | 33 ms (**2.3×**) |
| kodim15.png | 48 ms | 86 ms (0.6×) | 57 ms (0.8×) | 33 ms (**1.5×**) | 20 ms (**2.4×**) |
| kodim20.png | 42 ms | 82 ms (0.5×) | 55 ms (0.8×) | 28 ms (**1.5×**) | 23 ms (**1.8×**) |
| kodim23.png | 45 ms | 71 ms (0.6×) | 51 ms (0.9×) | 28 ms (**1.6×**) | 17 ms (**2.6×**) |
| kodim24.png | 55 ms | 101 ms (0.5×) | 66 ms (0.8×) | 39 ms (**1.4×**) | 34 ms (**1.6×**) |

注意：cwebp 時間包含 process fork 開銷（~20–40 ms），gowebp 作為 library 直接調用無此開銷。P=1 時 gowebp 因做更多優化（trellis、SNS）而較慢；P=4 起開始超越 cwebp。

Note: cwebp times include process fork overhead (~20–40 ms); gowebp runs in-process with no fork cost. At P=1 gowebp is slower due to heavier per-MB work (trellis, SNS); it surpasses cwebp from P=4 onward.

---

## 說明 / Notes

**為什麼 gowebp 在 `-m 4` 下比 cwebp 稍小？**

**Why is gowebp slightly smaller than `cwebp -m 4`?**

gowebp 沒有 method 參數，永遠全力執行所有優化。實測結果顯示 gowebp 在 `-m 4` 及 `-m 6`（cwebp 最高壓縮模式）下均輸出更小的檔案，Kodak 套件平均比 -m4 小 9.2%，比 -m6 小 5.7%。

gowebp has no method parameter and always runs all optimizations. Measured results show gowebp produces smaller files than both `cwebp -m 4` and `cwebp -m 6` (maximum compression) — averaging −9.2% vs -m4 and −5.7% vs -m6 on the Kodak suite.

gowebp 實現了一系列與 libwebp 精確對齊的優化：

gowebp implements a series of optimizations precisely matched to libwebp:

- **精確 RD 評分**：`score = 256×D + λ×(H+R+flatPenalty)`，與 libwebp `SetRDScore` 完全一致，令失真主導模式選擇（86% 權重）
- **精確 VP8EntropyCost 表**：直接從 `libwebp/src/dsp/cost.c` 移植，消除舊表的索引偏移錯誤
- **係數位元代價 R**：i4 塊評分包含實際位元流代價，對齊 libwebp `GetResidualCost_C`
- **平坦懲罰**：AC 係數 ≤3 的平坦 i4 塊加入 `FLATNESS_PENALTY=140`，避免過度採用非 DC 模式
- **SNS 空間噪聲整形**：4 段 K-means 量化器分段，精確移植 `VP8SetSegmentParams`
- **Trellis 量化**：Viterbi DP，移植自 libwebp `TrellisQuantizeBlock()`

**速度優勢來自哪裡？**

**Why is gowebp faster?**

gowebp 直接作為 Go library 調用，無 subprocess fork 開銷；並使用 wave-front goroutine 並行按行編碼。cwebp 的時間包含 process 啟動（約 10–20ms），對小圖影響尤其明顯。

gowebp runs in-process (no subprocess fork), uses wave-front goroutine parallel encoding across rows. cwebp time includes process startup (~10–20ms), which dominates for small images.

---

## 並行度測試 / Parallelism Benchmark (GOMAXPROCS)

gowebp 使用 wave-front goroutine 並行編碼（每行 MB 一條 goroutine），cwebp 預設單執行緒。

gowebp uses wave-front goroutine parallel encoding (one goroutine per MB row); cwebp runs single-threaded by default.

以 kodim01.png（768×512）為例 / Example with kodim01.png (768×512):

| GOMAXPROCS | gowebp | cwebp -m4 | vs m4 | cwebp -m6 | vs m6 |
|---|---|---|---|---|---|
| 1 | 110 ms | 59 ms | 0.5× (slower) | 129 ms | 1.2× faster |
| 2 | 87 ms | 59 ms | 0.7× (slower) | 129 ms | 1.5× faster |
| 4 | 46 ms | 59 ms | **1.3× faster** | 129 ms | **2.8× faster** |
| 10 | 29 ms | 59 ms | **2.0× faster** | 129 ms | **4.4× faster** |

單核（GOMAXPROCS=1）時 gowebp 比 cwebp -m4 慢約 2×，因為 gowebp 做更多優化（trellis、SNS、RD scoring）；但已比 cwebp -m6 快 1.2×。GOMAXPROCS=4 開始超越 cwebp -m4，GOMAXPROCS=10 時比 -m4 快 2×、比 -m6 快 4.4×。

At GOMAXPROCS=1, gowebp is ~2× slower than cwebp -m4 due to heavier per-MB work (trellis, SNS, RD scoring), but already 1.2× faster than cwebp -m6. It surpasses cwebp -m4 at GOMAXPROCS=4, and at GOMAXPROCS=10 is 2× faster than -m4 and 4.4× faster than -m6.

完整所有圖片的 GOMAXPROCS 對比見 `results/gomaxprocs_combined.md`。

Full results across all images: see `results/gomaxprocs_combined.md`.

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
cp images/*.png /path/to/gowebp/test_data/original/kodak/

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
