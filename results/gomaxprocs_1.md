# gowebp vs cwebp — GOMAXPROCS=1

quality=90, cwebp -m 4, Apple M1 Max, Go 1.25, GOMAXPROCS=1

| File | Original | cwebp lossy | cwebp time | go lossy | go time | PSNR |
|---|---|---|---|---|---|---|
| i30.jpeg | 559.0 kb | 312.0 kb | 419 ms | 258.6 kb | 390 ms | 27.4 dB |
| ishikawa-06.jpg | 255.3 kb | 119.7 kb | 74 ms | 98.0 kb | 161 ms | 29.5 dB |
| j3.png | 782.1 kb | 100.3 kb | 50 ms | 87.2 kb | 106 ms | 28.7 dB |
| jable-heidilau0905-003.jpg | 265.3 kb | 376.6 kb | 157 ms | 370.8 kb | 391 ms | 28.7 dB |
| jable-heidilau0905-004.jpg | 85.1 kb | 92.1 kb | 96 ms | 85.0 kb | 250 ms | 27.4 dB |
| jable-natabcde-0020.jpg | 156.4 kb | 179.3 kb | 93 ms | 173.2 kb | 222 ms | 28.4 dB |
| jable-snexxxxxxx-fantia-july-143.jpg | 147.5 kb | 190.7 kb | 104 ms | 187.6 kb | 242 ms | 29.7 dB |
| jable-snexxxxxxx-fantia-sep-067.jpg | 112.0 kb | 132.7 kb | 91 ms | 128.3 kb | 209 ms | 27.8 dB |
| jable-twy_jacinta-001.jpg | 104.1 kb | 110.6 kb | 109 ms | 106.4 kb | 254 ms | 28.5 dB |
| jable-twy_jacinta-008.jpg | 198.5 kb | 240.1 kb | 131 ms | 235.3 kb | 316 ms | 27.2 dB |
| jable-twy_jacinta-022.jpg | 191.5 kb | 224.7 kb | 136 ms | 221.1 kb | 324 ms | 29.3 dB |
| jablehk_snexxxxxxx_0029.jpg | 235.0 kb | 244.7 kb | 139 ms | 229.4 kb | 345 ms | 28.6 dB |
| jablehk_snexxxxxxx_0040.jpg | 242.4 kb | 181.0 kb | 200 ms | 168.9 kb | 522 ms | 29.4 dB |
| jablehk_snexxxxxxx_0055.jpg | 343.4 kb | 304.2 kb | 242 ms | 287.1 kb | 585 ms | 26.7 dB |
| jablehk_snexxxxxxx_0081.jpg | 336.0 kb | 290.2 kb | 227 ms | 278.7 kb | 660 ms | 27.5 dB |
