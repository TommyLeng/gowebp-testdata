# gowebp vs cwebp — GOMAXPROCS comparison

quality=90, cwebp -m 4, Apple M1 Max, Go 1.25

| File | Original | cwebp | cwebp time | go size | PSNR | P=1 ms | P=2 ms | P=4 ms | P=10 ms |
|---|---|---|---|---|---|---|---|---|---|
| kodim01.png | 719.2 kb | 133.8 kb | 144 ms | 125.1 kb | 32.1 dB | 142 | 79 | 44 | 30 |
| kodim05.png | 767.2 kb | 138.1 kb | 64 ms | 130.7 kb | 29.2 dB | 150 | 79 | 44 | 32 |
| kodim15.png | 598.2 kb | 72.6 kb | 52 ms | 66.2 kb | 26.7 dB | 92 | 66 | 35 | 26 |
| kodim20.png | 480.9 kb | 59.4 kb | 42 ms | 55.1 kb | 24.7 dB | 85 | 51 | 31 | 23 |
| kodim23.png | 544.5 kb | 54.9 kb | 46 ms | 44.4 kb | 29.7 dB | 77 | 47 | 30 | 17 |
| kodim24.png | 689.8 kb | 116.5 kb | 56 ms | 107.1 kb | 29.6 dB | 103 | 73 | 39 | 28 |
| portraits/portrait_1.jpg | 572.6 kb | 124.5 kb | 116 ms | 106.7 kb | 29.7 dB | 203 | 131 | 109 | 50 |
| portraits/portrait_2.jpg | 530.2 kb | 106.4 kb | 117 ms | 98.3 kb | 28.2 dB | 199 | 134 | 77 | 89 |
| portraits/portrait_3.jpg | 555.2 kb | 122.9 kb | 114 ms | 109.5 kb | 29.9 dB | 199 | 146 | 90 | 46 |
| portraits/portrait_4.jpg | 576.9 kb | 114.3 kb | 114 ms | 101.7 kb | 29.9 dB | 201 | 142 | 93 | 53 |
| portraits/portrait_5.jpg | 586.9 kb | 132.7 kb | 125 ms | 121.0 kb | 29.0 dB | 207 | 157 | 85 | 53 |
