# gowebp vs cwebp — GOMAXPROCS=2

quality=90, cwebp -m 4, Apple M1 Max, Go 1.25, GOMAXPROCS=2

| File | Original | cwebp lossy | cwebp time | go lossy | go time | PSNR |
|---|---|---|---|---|---|---|
| kodim01.png | 719.2 kb | 133.8 kb | 144 ms | 125.1 kb | 79 ms | 32.1 dB |
| kodim05.png | 767.2 kb | 138.1 kb | 64 ms | 130.7 kb | 79 ms | 29.2 dB |
| kodim15.png | 598.2 kb | 72.6 kb | 52 ms | 66.2 kb | 66 ms | 26.7 dB |
| kodim20.png | 480.9 kb | 59.4 kb | 42 ms | 55.1 kb | 51 ms | 24.7 dB |
| kodim23.png | 544.5 kb | 54.9 kb | 46 ms | 44.4 kb | 47 ms | 29.7 dB |
| kodim24.png | 689.8 kb | 116.5 kb | 56 ms | 107.1 kb | 73 ms | 29.6 dB |
| portraits/portrait_1.jpg | 572.6 kb | 124.5 kb | 116 ms | 106.7 kb | 131 ms | 29.7 dB |
| portraits/portrait_2.jpg | 530.2 kb | 106.4 kb | 117 ms | 98.3 kb | 134 ms | 28.2 dB |
| portraits/portrait_3.jpg | 555.2 kb | 122.9 kb | 114 ms | 109.5 kb | 146 ms | 29.9 dB |
| portraits/portrait_4.jpg | 576.9 kb | 114.3 kb | 114 ms | 101.7 kb | 142 ms | 29.9 dB |
| portraits/portrait_5.jpg | 586.9 kb | 132.7 kb | 125 ms | 121.0 kb | 157 ms | 29.0 dB |
