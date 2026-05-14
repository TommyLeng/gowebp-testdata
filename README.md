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

測試條件：Apple M1 Max，Go 1.25，cwebp 1.6.0，quality=90（最後更新：2026-05-14）

Test conditions: Apple M1 Max, Go 1.25, cwebp 1.6.0, quality=90 (last updated: 2026-05-14)

### 檔案大小：Kodak 標準測試集 / File Size: Kodak Suite

| 圖片 / Image | 原圖 / Original | cwebp -m4 | cwebp -m6 | gowebp | Δ vs m4 | Δ vs m6 | PSNR |
|---|---|---|---|---|---|---|---|
| kodim01.png | 719 kb | 133.8 kb | 131.8 kb | **125.7 kb** | −6.1% | **−4.6%** | 32.1 dB |
| kodim05.png | 767 kb | 138.1 kb | 135.3 kb | **131.3 kb** | −4.9% | **−2.9%** | 29.2 dB |
| kodim15.png | 598 kb | 72.6 kb | 69.6 kb | **66.8 kb** | −8.0% | **−4.0%** | 26.7 dB |
| kodim20.png | 481 kb | 59.4 kb | 56.9 kb | **55.9 kb** | −5.9% | **−1.8%** | 24.7 dB |
| kodim23.png | 545 kb | 54.9 kb | 51.2 kb | **46.3 kb** | −15.7% | **−9.6%** | 29.7 dB |
| kodim24.png | 690 kb | 116.5 kb | 111.9 kb | **108.5 kb** | −6.9% | **−3.0%** | 29.6 dB |
| **平均 / Avg** | | | | | **−7.9%** | **−4.3%** | **28.7 dB** |

### 檔案大小：人像照片 / File Size: Portrait Photos

使用 5 張 AI 生成人像（[thispersondoesnotexist.com](https://thispersondoesnotexist.com)，縮放至 300×300，無版權）：

Using 5 AI-generated portraits ([thispersondoesnotexist.com](https://thispersondoesnotexist.com), resized to 300×300, no copyright):

| 圖片 / Image | cwebp -m4 | cwebp -m6 | gowebp | Δ vs m4 | Δ vs m6 | PSNR |
|---|---|---|---|---|---|---|
| portrait_1.jpg | 16.2 kb | 15.3 kb | **13.5 kb** | −16.7% | **−11.8%** | 29.6 dB |
| portrait_2.jpg | 14.7 kb | 13.9 kb | **12.0 kb** | −18.4% | **−13.7%** | 28.0 dB |
| portrait_3.jpg | 19.0 kb | 18.2 kb | **16.1 kb** | −15.3% | **−11.5%** | 29.7 dB |
| portrait_4.jpg | 14.0 kb | 13.3 kb | **12.1 kb** | −13.6% | **−9.0%** | 29.8 dB |
| portrait_5.jpg | 18.6 kb | 17.7 kb | **14.7 kb** | −21.0% | **−16.9%** | 28.9 dB |
| **平均 / Avg** | | | | **−17.0%** | **−12.6%** | **29.2 dB** |

### 速度 / Encoding Speed (Kodak 768×512, Apple M1 Max)

gowebp 使用 wave-front goroutine 並行，GOMAXPROCS 越高越快；cwebp 預設單執行緒。

gowebp uses wave-front goroutine parallelism; cwebp runs single-threaded.

| 圖片 / Image | cwebp -m4 | gowebp P=1 | gowebp P=2 | gowebp P=4 | gowebp P=10 |
|---|---|---|---|---|---|
| kodim01.png | 50 ms | 96 ms (0.5×) | 64 ms (0.8×) | 41 ms (**1.2×**) | 27 ms (**1.9×**) |
| kodim05.png | 51 ms | 93 ms (0.5×) | 67 ms (0.8×) | 39 ms (**1.3×**) | 26 ms (**2.0×**) |
| kodim15.png | 41 ms | 61 ms (0.7×) | 44 ms (0.9×) | 23 ms (**1.8×**) | 17 ms (**2.4×**) |
| kodim20.png | 35 ms | 56 ms (0.6×) | 36 ms (1.0×) | 20 ms (**1.8×**) | 15 ms (**2.3×**) |
| kodim23.png | 38 ms | 48 ms (0.8×) | 33 ms (**1.2×**) | 18 ms (**2.1×**) | 12 ms (**3.2×**) |
| kodim24.png | 48 ms | 99 ms (0.5×) | 60 ms (0.8×) | 33 ms (**1.5×**) | 24 ms (**2.0×**) |

注意：cwebp 時間包含 process fork 開銷（~10–20 ms），gowebp 作為 library 直接調用無此開銷。P=1 時 gowebp 因做更多優化（trellis、SNS、RD scoring）而較慢；P=4 起開始超越 cwebp。

Note: cwebp times include process fork overhead (~10–20 ms); gowebp runs in-process with no fork cost. At P=1 gowebp is slower due to heavier per-MB work (trellis, SNS, RD scoring); it surpasses cwebp from P=4 onward.

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

cwebp 透過 `os/exec` 計時（含 process fork 開銷）；gowebp 直接調用，設定 `GOMAXPROCS` 控制並行度：

```go
// cwebp: time the full exec.Command (includes process fork overhead)
cmd := exec.Command("cwebp", "-q", "90", "-m", "4", srcPath, "-o", outPath)
t0 := time.Now()
_ = cmd.Run()
cwebpMs := time.Since(t0).Milliseconds()

// gowebp: set GOMAXPROCS then encode in-process (no fork overhead)
runtime.GOMAXPROCS(procs) // e.g. 1, 2, 4, 10
var buf bytes.Buffer
t0 = time.Now()
_ = gowebp.Encode(&buf, src, &gowebp.Options{Quality: 90})
goMs := time.Since(t0).Milliseconds()
```

以 kodim01.png（768×512）為例 / Example with kodim01.png (768×512):

| GOMAXPROCS | gowebp | cwebp -m4 | vs m4 | cwebp -m6 | vs m6 |
|---|---|---|---|---|---|
| 1 | 96 ms | 50 ms | 0.5× (slower) | 119 ms | **1.2× faster** |
| 2 | 64 ms | 50 ms | 0.8× (slightly slower) | 119 ms | **1.9× faster** |
| 4 | 41 ms | 50 ms | **1.2× faster** | 119 ms | **2.9× faster** |
| 10 | 27 ms | 50 ms | **1.9× faster** | 119 ms | **4.4× faster** |

單核（GOMAXPROCS=1）時 gowebp 比 cwebp -m4 慢約 2×（不含 fork 開銷比較），因為 gowebp 做更多優化（trellis、SNS、RD scoring）；但已比 cwebp -m6 快 1.2×。GOMAXPROCS=4 開始超越 cwebp -m4，GOMAXPROCS=10 時比 -m4 快 1.9×、比 -m6 快 4.4×。對於 300×300 等小圖，P=1 的差距更小（gowebp ~11ms vs cwebp ~20ms 含 fork）。

At GOMAXPROCS=1, gowebp is ~2× slower than cwebp -m4 (excluding fork overhead) due to heavier per-MB work (trellis, SNS, RD scoring), but already 1.2× faster than cwebp -m6. It surpasses cwebp -m4 at GOMAXPROCS=4, and at GOMAXPROCS=10 is 1.9× faster than -m4 and 4.4× faster than -m6. For small images (e.g. 300×300), the P=1 gap is smaller (gowebp ~11ms vs cwebp ~20ms including fork).

完整所有圖片的 GOMAXPROCS 對比 / Full results across all images:

| File | Original | cwebp -m4 | m4 time | cwebp -m6 | m6 time | go size | PSNR | P=1 ms | P=2 ms | P=4 ms | P=10 ms |
|---|---|---|---|---|---|---|---|---|---|---|---|
| kodak/kodim01.png | 719.2 kb | 133.8 kb | 50 ms | 131.8 kb | 119 ms | 125.7 kb | 32.1 dB | 96 | 64 | 41 | 27 |
| kodak/kodim05.png | 767.2 kb | 138.1 kb | 51 ms | 135.3 kb | 116 ms | 131.3 kb | 29.2 dB | 93 | 67 | 39 | 26 |
| kodak/kodim15.png | 598.2 kb | 72.6 kb | 41 ms | 69.6 kb | 82 ms | 66.8 kb | 26.7 dB | 61 | 44 | 23 | 17 |
| kodak/kodim20.png | 480.9 kb | 59.4 kb | 35 ms | 56.9 kb | 69 ms | 55.9 kb | 24.7 dB | 56 | 36 | 20 | 15 |
| kodak/kodim23.png | 544.5 kb | 54.9 kb | 38 ms | 51.2 kb | 71 ms | 46.3 kb | 29.7 dB | 48 | 33 | 18 | 12 |
| kodak/kodim24.png | 689.8 kb | 116.5 kb | 48 ms | 111.9 kb | 102 ms | 108.5 kb | 29.6 dB | 99 | 60 | 33 | 24 |
| portrait_1.jpg | 572.6 kb | 16.2 kb | 34 ms | 15.3 kb | 44 ms | 13.5 kb | 29.6 dB | 14 | 10 | 5 | 5 |
| portrait_2.jpg | 530.2 kb | 14.7 kb | 38 ms | 13.9 kb | 42 ms | 12.0 kb | 28.0 dB | 12 | 7 | 5 | 4 |
| portrait_3.jpg | 555.2 kb | 19.0 kb | 34 ms | 18.2 kb | 44 ms | 16.1 kb | 29.7 dB | 15 | 10 | 6 | 5 |
| portrait_4.jpg | 576.9 kb | 14.0 kb | 34 ms | 13.3 kb | 42 ms | 12.1 kb | 29.8 dB | 12 | 8 | 5 | 4 |
| portrait_5.jpg | 586.9 kb | 18.6 kb | 35 ms | 17.7 kb | 45 ms | 14.7 kb | 28.9 dB | 14 | 10 | 5 | 4 |

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
