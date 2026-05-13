# gowebp vs cwebp — GOMAXPROCS comparison

quality=90, Apple M1 Max, Go 1.25

| File | Original | cwebp -m4 | m4 time | cwebp -m6 | m6 time | go size | PSNR | P=1 ms | P=2 ms | P=4 ms | P=10 ms |
|---|---|---|---|---|---|---|---|---|---|---|---|
| hidden/CD100 - FLORES, APRIL_fix.jpg | 393.6 kb | 11.6 kb | 23 ms | 11.3 kb | 44 ms | 10.6 kb | 29.9 dB | 11 | 7 | 4 | 4 |
| hidden/CD101 - NEBRES, ARJANE_fix.jpg | 432.3 kb | 11.2 kb | 20 ms | 10.9 kb | 26 ms | 10.0 kb | 30.3 dB | 11 | 7 | 4 | 4 |
| hidden/CD102 - HULLANA, KERRY LYNN_fix.jpg | 419.1 kb | 12.2 kb | 20 ms | 12.0 kb | 26 ms | 11.1 kb | 30.1 dB | 11 | 7 | 4 | 4 |
| hidden/CD103 - MAÑACOP, PRINCESS_fix.jpg | 406.5 kb | 10.5 kb | 20 ms | 10.1 kb | 25 ms | 9.5 kb | 29.9 dB | 10 | 7 | 4 | 3 |
| hidden/CD104 - FLORES, ANGELICA_fix.jpg | 393.5 kb | 13.4 kb | 20 ms | 13.1 kb | 26 ms | 11.8 kb | 29.1 dB | 11 | 8 | 4 | 4 |
| hidden/CD106 - ONGKINGKO, ROCHELLYN_fix.jpg | 402.8 kb | 11.2 kb | 22 ms | 10.9 kb | 26 ms | 10.3 kb | 29.3 dB | 11 | 7 | 4 | 4 |
| hidden/CD107 - BERMAS, EVANGELYN_fix.jpg | 464.8 kb | 9.7 kb | 20 ms | 9.3 kb | 26 ms | 8.6 kb | 30.5 dB | 10 | 6 | 4 | 4 |
| hidden/CD108 - DIAZ, MONIQUE JUSTINE_fix.jpg | 398.0 kb | 10.7 kb | 20 ms | 10.3 kb | 26 ms | 10.0 kb | 29.9 dB | 11 | 7 | 4 | 5 |
| hidden/CD109 - GABON, GRACE_fix.jpg | 427.3 kb | 11.3 kb | 20 ms | 11.0 kb | 26 ms | 10.0 kb | 29.8 dB | 11 | 7 | 4 | 5 |
| hidden/CD111 - CRUZ, JEANNE_fix.jpg | 414.5 kb | 10.8 kb | 20 ms | 10.5 kb | 25 ms | 9.8 kb | 30.0 dB | 10 | 7 | 4 | 4 |
| hidden/CD113 - CARPIO, KATE_fix.jpg | 384.9 kb | 9.9 kb | 20 ms | 9.5 kb | 25 ms | 8.9 kb | 29.6 dB | 10 | 7 | 4 | 4 |
| hidden/CD114 - CRUZ, MARJORIE_fix.jpg | 410.3 kb | 10.7 kb | 20 ms | 10.3 kb | 26 ms | 9.8 kb | 30.1 dB | 10 | 7 | 4 | 3 |
| hidden/CD115 - ARISGA, DIVS_fix.jpg | 400.6 kb | 10.1 kb | 20 ms | 9.8 kb | 27 ms | 8.7 kb | 29.8 dB | 10 | 6 | 4 | 3 |
| hidden/CD116 - BRABANTE, MARIALYN_fix.jpg | 390.3 kb | 10.7 kb | 20 ms | 10.4 kb | 26 ms | 9.7 kb | 29.8 dB | 10 | 8 | 4 | 3 |
| hidden/CD117 - CALAMAYAN, PRINCESS_fix.jpg | 420.2 kb | 11.4 kb | 20 ms | 11.1 kb | 26 ms | 10.5 kb | 29.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD118 - DAPADAP, APRIL ROSE_fix.jpg | 397.4 kb | 11.4 kb | 20 ms | 11.1 kb | 26 ms | 10.1 kb | 29.7 dB | 10 | 7 | 4 | 4 |
| hidden/CD120 - MANIOBRA, ALEXIS_fix.jpg | 371.3 kb | 10.4 kb | 20 ms | 10.0 kb | 26 ms | 9.5 kb | 29.6 dB | 10 | 7 | 4 | 3 |
| hidden/CD121 - MARCIANO, ALLIANA MARIE_fix.jpg | 423.4 kb | 10.7 kb | 20 ms | 10.4 kb | 25 ms | 9.6 kb | 29.8 dB | 11 | 7 | 4 | 3 |
| hidden/CD123 - ONA, SARAH FRANCHESKA_fix.jpg | 369.7 kb | 10.0 kb | 19 ms | 9.6 kb | 25 ms | 9.3 kb | 30.1 dB | 10 | 7 | 4 | 3 |
| hidden/CD124- TANATE, JOCELYN_fix.jpg | 433.3 kb | 11.2 kb | 20 ms | 10.9 kb | 26 ms | 9.9 kb | 29.7 dB | 11 | 7 | 4 | 4 |
| hidden/CD126 - DACLES, JOAN_fix.jpg | 469.3 kb | 12.9 kb | 21 ms | 12.7 kb | 27 ms | 11.4 kb | 29.7 dB | 11 | 8 | 4 | 4 |
| hidden/CD127 - RAMACION, ROYCE DECHE_fix.jpg | 406.7 kb | 12.2 kb | 20 ms | 11.9 kb | 26 ms | 11.0 kb | 29.4 dB | 11 | 7 | 4 | 4 |
| hidden/CD129 - PESIDAS, CHERRY MAE_fix.jpg | 436.8 kb | 10.4 kb | 20 ms | 10.1 kb | 26 ms | 9.6 kb | 29.9 dB | 10 | 7 | 4 | 3 |
| hidden/CD13 Chavez,Sarah Joy_fix.jpg | 475.6 kb | 11.6 kb | 20 ms | 11.3 kb | 27 ms | 10.2 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD130 - BAUTISTA, HANNA_fix.jpg | 403.0 kb | 10.2 kb | 25 ms | 9.8 kb | 26 ms | 9.3 kb | 29.6 dB | 10 | 6 | 4 | 4 |
| hidden/CD131 - CABONCE, HANSHYL_fix.jpg | 425.3 kb | 10.8 kb | 21 ms | 10.5 kb | 30 ms | 9.9 kb | 30.1 dB | 10 | 7 | 4 | 4 |
| hidden/CD132 - CARRIDO, JUDEA_fix.jpg | 434.0 kb | 11.8 kb | 20 ms | 11.5 kb | 27 ms | 10.7 kb | 30.6 dB | 11 | 7 | 4 | 4 |
| hidden/CD133 - NATO, RICA_fix.jpg | 368.4 kb | 10.1 kb | 19 ms | 9.7 kb | 26 ms | 9.1 kb | 30.6 dB | 10 | 6 | 4 | 3 |
| hidden/CD138 - MITRA, GHOWINA MAE_fix.jpg | 419.8 kb | 9.5 kb | 20 ms | 9.0 kb | 26 ms | 8.6 kb | 30.0 dB | 10 | 7 | 4 | 3 |
| hidden/CD139 - CAJULIS, STEPHANIE ROSE_fix.jpg | 389.4 kb | 10.6 kb | 20 ms | 10.2 kb | 26 ms | 9.8 kb | 30.6 dB | 10 | 7 | 4 | 4 |
| hidden/CD140 - SANCHEZ, QUEENBERLY ANNE_fix.jpg | 367.8 kb | 9.9 kb | 19 ms | 9.5 kb | 25 ms | 9.0 kb | 29.6 dB | 10 | 6 | 4 | 3 |
| hidden/CD141 - GONZALES, MARY ROSE_fix.jpg | 413.9 kb | 12.0 kb | 20 ms | 11.6 kb | 27 ms | 10.6 kb | 29.2 dB | 11 | 7 | 4 | 4 |
| hidden/CD142 - RAPIZ, PHEATRIZ MAE_fix.jpg | 419.3 kb | 10.7 kb | 21 ms | 10.3 kb | 26 ms | 9.5 kb | 29.9 dB | 10 | 7 | 4 | 4 |
| hidden/CD143 - BULLOSOS, BERNALYN_fix.jpg | 412.6 kb | 11.1 kb | 20 ms | 10.8 kb | 27 ms | 10.0 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD144 - ORBON, CASSEYLING_fix.jpg | 408.1 kb | 12.7 kb | 21 ms | 12.4 kb | 27 ms | 11.4 kb | 29.8 dB | 11 | 7 | 4 | 4 |
| hidden/CD145 - RIVERA , JHEAN FREYSIE  ANN_fix.jpg | 395.2 kb | 11.4 kb | 20 ms | 11.2 kb | 25 ms | 10.2 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD146 - MIRASOL, LEONNA A_fix.jpg | 352.5 kb | 9.7 kb | 19 ms | 9.4 kb | 24 ms | 9.0 kb | 30.5 dB | 10 | 7 | 4 | 3 |
| hidden/CD147 - ABRIGO, EIDGHIELYN_fix.jpg | 472.9 kb | 11.5 kb | 20 ms | 11.0 kb | 27 ms | 10.0 kb | 30.0 dB | 11 | 6 | 4 | 4 |
| hidden/CD148 - DERIGAY, JENNY LYN_fix.jpg | 417.4 kb | 11.1 kb | 20 ms | 10.8 kb | 25 ms | 10.2 kb | 29.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD149 - GOZAMO, ANGEL_fix.jpg | 352.8 kb | 9.8 kb | 19 ms | 9.6 kb | 23 ms | 9.2 kb | 31.1 dB | 10 | 6 | 4 | 3 |
| hidden/CD15 - Gallarde,Nica_fix.jpg | 426.4 kb | 11.8 kb | 20 ms | 11.4 kb | 26 ms | 10.2 kb | 29.6 dB | 11 | 7 | 4 | 4 |
| hidden/CD150 - DE GUZMAN, CLYDETTE_fix.jpg | 404.7 kb | 12.2 kb | 20 ms | 11.9 kb | 26 ms | 11.2 kb | 30.1 dB | 11 | 7 | 4 | 4 |
| hidden/CD19 - MABBORANG, CAMILLE B_fix.jpg | 416.5 kb | 11.3 kb | 20 ms | 11.0 kb | 25 ms | 10.3 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD21 - MIRAVALLES, XAVI LEOJ C_fix.jpg | 430.0 kb | 11.5 kb | 20 ms | 11.1 kb | 25 ms | 10.2 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD23 - SEGUIN, MARJORIE N_fix.jpg | 422.3 kb | 12.0 kb | 20 ms | 11.8 kb | 25 ms | 10.5 kb | 30.3 dB | 11 | 7 | 4 | 4 |
| hidden/CD25 - MENDEZ, CHIRSTINE L_fix.jpg | 438.2 kb | 11.7 kb | 20 ms | 11.4 kb | 25 ms | 10.6 kb | 29.8 dB | 11 | 7 | 4 | 4 |
| hidden/CD26 - NUÑEZ, ANGELINE A_fix.jpg | 405.4 kb | 10.6 kb | 19 ms | 10.2 kb | 25 ms | 9.6 kb | 29.8 dB | 10 | 7 | 4 | 4 |
| hidden/CD27 - SANCHEZ, MARY GRACE E_fix.jpg | 393.6 kb | 9.9 kb | 27 ms | 9.6 kb | 24 ms | 9.1 kb | 30.5 dB | 10 | 6 | 4 | 3 |
| hidden/CD28 - SANTOS, ANGELYN C_fix.jpg | 378.7 kb | 10.5 kb | 19 ms | 10.3 kb | 24 ms | 9.9 kb | 30.4 dB | 10 | 6 | 4 | 4 |
| hidden/CD31 - CULAS, ALMARI JEAN B_fix.jpg | 373.6 kb | 10.2 kb | 19 ms | 9.9 kb | 24 ms | 9.1 kb | 30.3 dB | 10 | 7 | 4 | 3 |
| hidden/CD33 - OLAVARIO, ALAISA S_fix.jpg | 423.0 kb | 10.7 kb | 19 ms | 10.3 kb | 25 ms | 9.6 kb | 29.8 dB | 10 | 7 | 4 | 3 |
| hidden/CD35 - DAYAO, JANINE R_fix.jpg | 433.1 kb | 11.6 kb | 20 ms | 11.3 kb | 26 ms | 10.4 kb | 30.4 dB | 11 | 7 | 4 | 4 |
| hidden/CD37 - GALLANOSA, MARILOU_fix.jpg | 438.0 kb | 12.3 kb | 20 ms | 12.0 kb | 26 ms | 11.2 kb | 29.7 dB | 11 | 8 | 4 | 4 |
| hidden/CD45 - GEREBIT, JOAN A_fix.jpg | 436.7 kb | 11.5 kb | 20 ms | 11.2 kb | 25 ms | 10.5 kb | 30.4 dB | 11 | 7 | 4 | 4 |
| hidden/CD46 - LABRO, JENNY C_fix.jpg | 413.8 kb | 10.5 kb | 20 ms | 10.2 kb | 25 ms | 9.2 kb | 30.6 dB | 10 | 7 | 4 | 3 |
| hidden/CD51- CATAPANG, KIM_fix.jpg | 394.9 kb | 9.9 kb | 24 ms | 9.7 kb | 24 ms | 9.2 kb | 30.0 dB | 10 | 6 | 4 | 3 |
| hidden/CD55 - ATIENZA, JANINE_fix.jpg | 411.6 kb | 11.0 kb | 20 ms | 10.6 kb | 25 ms | 10.0 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/CD57 - CELESPARA, MARY JOY_fix.jpg | 479.8 kb | 11.8 kb | 20 ms | 11.5 kb | 26 ms | 10.8 kb | 30.7 dB | 11 | 7 | 4 | 4 |
| hidden/CD59 - ABACARO, BEA DANICA_fix.jpg | 401.7 kb | 11.0 kb | 19 ms | 10.7 kb | 25 ms | 10.2 kb | 29.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD62 - TOMBOC, HAZELYN GAIL_fix.jpg | 416.0 kb | 11.7 kb | 20 ms | 11.4 kb | 25 ms | 10.6 kb | 29.8 dB | 11 | 7 | 4 | 4 |
| hidden/CD63 - ABUNDO, JENNY ANN_fix.jpg | 407.0 kb | 10.9 kb | 19 ms | 10.6 kb | 24 ms | 9.9 kb | 30.1 dB | 10 | 7 | 4 | 3 |
| hidden/CD69 - ROSLING, GISELLE_fix.jpg | 388.6 kb | 11.3 kb | 19 ms | 11.0 kb | 25 ms | 10.3 kb | 30.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD70 - TUAZON, LYKA_fix.jpg | 402.7 kb | 10.4 kb | 19 ms | 10.0 kb | 25 ms | 9.4 kb | 29.6 dB | 10 | 6 | 4 | 4 |
| hidden/CD74- VILLANUEVA, AIRA MAE_fix.jpg | 428.3 kb | 10.8 kb | 20 ms | 10.4 kb | 25 ms | 9.7 kb | 30.0 dB | 10 | 7 | 4 | 4 |
| hidden/CD75 - ACEBO, ANA MARIE_fix.jpg | 363.2 kb | 10.7 kb | 19 ms | 10.4 kb | 24 ms | 9.8 kb | 29.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD76  - ESCANO, KRISTINE NICOLE_fix.jpg | 457.9 kb | 12.8 kb | 20 ms | 12.4 kb | 26 ms | 11.5 kb | 30.1 dB | 11 | 7 | 4 | 4 |
| hidden/CD78 - PERRERAS, ARLYN_fix.jpg | 429.6 kb | 11.7 kb | 20 ms | 11.4 kb | 25 ms | 10.7 kb | 29.6 dB | 10 | 8 | 4 | 4 |
| hidden/CD81 - ETUM, LOREN MAE_fix.jpg | 396.3 kb | 10.4 kb | 20 ms | 10.1 kb | 27 ms | 9.6 kb | 30.3 dB | 10 | 8 | 4 | 3 |
| hidden/CD82- SANTIAGO, SHER MAE_fix.jpg | 411.6 kb | 10.2 kb | 21 ms | 9.9 kb | 26 ms | 9.1 kb | 30.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD83 - CARDANO, ERNANI_fix.jpg | 408.3 kb | 11.4 kb | 20 ms | 11.2 kb | 25 ms | 10.3 kb | 30.7 dB | 10 | 7 | 4 | 4 |
| hidden/CD84 - FLORES, JONALYN_fix.jpg | 377.1 kb | 10.1 kb | 20 ms | 9.6 kb | 25 ms | 8.9 kb | 29.8 dB | 10 | 7 | 4 | 3 |
| hidden/CD85 - LIMIN, JUNNES_fix.jpg | 399.5 kb | 11.0 kb | 20 ms | 10.7 kb | 25 ms | 10.1 kb | 30.2 dB | 11 | 8 | 4 | 4 |
| hidden/CD86 - SARINAO, GRETCHEN_fix.jpg | 447.5 kb | 12.0 kb | 20 ms | 11.6 kb | 26 ms | 10.8 kb | 29.7 dB | 11 | 8 | 4 | 4 |
| hidden/CD88 - EUGERIO, JOERILYN_fix.jpg | 461.5 kb | 12.0 kb | 20 ms | 11.7 kb | 26 ms | 10.6 kb | 30.1 dB | 11 | 8 | 4 | 4 |
| hidden/CD89 - GIMONG, WENJIE_fix.jpg | 369.4 kb | 10.4 kb | 20 ms | 10.1 kb | 26 ms | 9.5 kb | 30.1 dB | 10 | 7 | 4 | 3 |
| hidden/CD90 - LABASAN, ANNABEL_fix.jpg | 423.4 kb | 12.5 kb | 44 ms | 12.1 kb | 27 ms | 11.0 kb | 29.8 dB | 11 | 8 | 4 | 4 |
| hidden/CD91 - BAGUNAS, CRYSTAL_fix.jpg | 361.0 kb | 11.7 kb | 20 ms | 11.3 kb | 26 ms | 10.9 kb | 29.7 dB | 11 | 8 | 4 | 4 |
| hidden/CD92 - CALILONG, PINKY ROSE_fix.jpg | 387.7 kb | 10.4 kb | 20 ms | 10.1 kb | 25 ms | 9.5 kb | 30.4 dB | 10 | 7 | 4 | 3 |
| hidden/CD95 - CASTRO, FLERIDA MAE_fix.jpg | 411.8 kb | 10.7 kb | 20 ms | 10.5 kb | 25 ms | 9.9 kb | 30.5 dB | 10 | 7 | 4 | 4 |
| hidden/CD96 - FLORES, JOYCE ANN_fix.jpg | 361.0 kb | 10.1 kb | 19 ms | 9.9 kb | 24 ms | 9.4 kb | 30.1 dB | 10 | 7 | 4 | 4 |
| hidden/CD97 - MURILLO, RONA_fix.jpg | 371.7 kb | 10.6 kb | 19 ms | 10.3 kb | 25 ms | 9.7 kb | 30.2 dB | 10 | 7 | 4 | 4 |
| hidden/CD98 - TAN, NATHALIE FAYE_fix.jpg | 455.4 kb | 11.8 kb | 21 ms | 11.3 kb | 26 ms | 10.7 kb | 30.2 dB | 11 | 7 | 4 | 4 |
| hidden/CD99 - RAVIZ, SARAH_fix.jpg | 444.3 kb | 11.6 kb | 20 ms | 11.2 kb | 26 ms | 10.5 kb | 29.5 dB | 11 | 7 | 4 | 4 |
| hidden/TD-520 - MENDEZ, MELANIE_fix.jpg | 391.8 kb | 10.0 kb | 19 ms | 9.6 kb | 25 ms | 8.9 kb | 30.3 dB | 10 | 7 | 4 | 4 |
| hidden/TD-522 - TAGASA, CHRISTIENNE XYRILLE_fix.jpg | 405.8 kb | 11.0 kb | 20 ms | 10.7 kb | 25 ms | 9.7 kb | 29.6 dB | 10 | 7 | 4 | 4 |
| hidden/TD-530 - SERRANO, CRISTINE_fix.jpg | 417.0 kb | 11.8 kb | 20 ms | 11.5 kb | 26 ms | 10.8 kb | 29.5 dB | 11 | 8 | 4 | 4 |
| hidden/TD-532_fix.jpg | 357.3 kb | 10.3 kb | 19 ms | 10.0 kb | 25 ms | 9.5 kb | 30.0 dB | 10 | 7 | 4 | 4 |
| hidden/TD-534 - DAYAO, CHERRYLYN_fix.jpg | 426.9 kb | 11.6 kb | 21 ms | 11.3 kb | 26 ms | 10.6 kb | 29.9 dB | 11 | 7 | 4 | 4 |
| hidden/TD-535 - MANANSALA, JUDY MAE_fix.jpg | 376.6 kb | 10.7 kb | 20 ms | 10.3 kb | 26 ms | 9.8 kb | 29.5 dB | 10 | 7 | 4 | 4 |
| hidden/TD-538 - GATDULA, JONABELLE_fix.jpg | 450.1 kb | 11.7 kb | 20 ms | 11.2 kb | 27 ms | 10.3 kb | 29.2 dB | 11 | 8 | 4 | 4 |
| hidden/TD-544 - DEL ROSARIO, RACHELLE ANNE_fix.jpg | 398.0 kb | 10.8 kb | 20 ms | 10.4 kb | 26 ms | 9.4 kb | 30.8 dB | 10 | 7 | 4 | 4 |
| hidden/TD-547 - MACARAIG, ANNA MAE_fix.jpg | 364.9 kb | 10.4 kb | 20 ms | 10.1 kb | 25 ms | 9.3 kb | 30.2 dB | 10 | 7 | 4 | 3 |
| hidden/TD-549 - VILLAFLOR, ROGENE_fix.jpg | 452.2 kb | 12.4 kb | 21 ms | 12.1 kb | 27 ms | 10.6 kb | 29.1 dB | 11 | 7 | 4 | 4 |
| hidden/TD-551- BERMIDO_fix.jpg | 420.7 kb | 8.8 kb | 20 ms | 8.5 kb | 24 ms | 8.0 kb | 30.9 dB | 10 | 6 | 3 | 3 |
| hidden/TD-554 - LUCAS, ELLA MAY_fix.jpg | 431.6 kb | 11.1 kb | 20 ms | 10.8 kb | 25 ms | 10.1 kb | 29.4 dB | 10 | 7 | 4 | 4 |
| hidden/TD-555  ARGA, HAZEL ANGELIQUE_fix.jpg | 392.0 kb | 10.5 kb | 20 ms | 10.1 kb | 24 ms | 9.6 kb | 29.7 dB | 10 | 6 | 4 | 4 |
| hidden/TD-556 ELLORANGO, EVY_fix.jpg | 397.5 kb | 9.9 kb | 19 ms | 9.7 kb | 25 ms | 9.1 kb | 30.3 dB | 10 | 6 | 4 | 3 |
| hidden/TD-557 - ICO, CHRIZELLE_fix.jpg | 386.3 kb | 11.3 kb | 21 ms | 10.9 kb | 26 ms | 10.5 kb | 29.0 dB | 10 | 6 | 4 | 4 |
| hidden/TD-561 - TAPIA, NAZARIN ANGEL_fix.jpg | 382.1 kb | 9.7 kb | 20 ms | 9.4 kb | 25 ms | 8.9 kb | 30.1 dB | 10 | 6 | 4 | 4 |
| hidden/portrait_1.jpg | 572.6 kb | 16.2 kb | 34 ms | 15.3 kb | 44 ms | 13.5 kb | 29.6 dB | 14 | 10 | 5 | 5 |
| hidden/portrait_2.jpg | 530.2 kb | 14.7 kb | 38 ms | 13.9 kb | 42 ms | 12.0 kb | 28.0 dB | 12 | 7 | 5 | 4 |
| hidden/portrait_3.jpg | 555.2 kb | 19.0 kb | 34 ms | 18.2 kb | 44 ms | 16.1 kb | 29.7 dB | 15 | 10 | 6 | 5 |
| hidden/portrait_4.jpg | 576.9 kb | 14.0 kb | 34 ms | 13.3 kb | 42 ms | 12.1 kb | 29.8 dB | 12 | 8 | 5 | 4 |
| hidden/portrait_5.jpg | 586.9 kb | 18.6 kb | 35 ms | 17.7 kb | 45 ms | 14.7 kb | 28.9 dB | 14 | 10 | 5 | 4 |
| i30.jpeg | 559.0 kb | 312.0 kb | 162 ms | 301.3 kb | 349 ms | 257.4 kb | 27.4 dB | 226 | 180 | 132 | 132 |
| ishikawa-06.jpg | 255.3 kb | 119.7 kb | 70 ms | 113.2 kb | 144 ms | 101.5 kb | 29.5 dB | 103 | 73 | 43 | 33 |
| j3.png | 782.1 kb | 100.3 kb | 48 ms | 93.3 kb | 105 ms | 88.7 kb | 28.7 dB | 74 | 56 | 34 | 22 |
| jable-heidilau0905-003.jpg | 265.3 kb | 376.6 kb | 150 ms | 372.2 kb | 336 ms | 374.2 kb | 28.7 dB | 288 | 199 | 128 | 92 |
| jable-heidilau0905-004.jpg | 85.1 kb | 92.1 kb | 94 ms | 90.5 kb | 144 ms | 93.0 kb | 27.4 dB | 122 | 92 | 67 | 42 |
| jable-natabcde-0020.jpg | 156.4 kb | 179.3 kb | 90 ms | 177.1 kb | 193 ms | 176.3 kb | 28.4 dB | 157 | 115 | 75 | 46 |
| jable-snexxxxxxx-fantia-july-143.jpg | 147.5 kb | 190.7 kb | 99 ms | 188.1 kb | 204 ms | 189.7 kb | 29.7 dB | 169 | 138 | 91 | 56 |
| jable-snexxxxxxx-fantia-sep-067.jpg | 112.0 kb | 132.7 kb | 86 ms | 130.9 kb | 159 ms | 131.3 kb | 27.8 dB | 133 | 95 | 66 | 36 |
| jable-twy_jacinta-001.jpg | 104.1 kb | 110.6 kb | 102 ms | 109.4 kb | 169 ms | 115.7 kb | 28.5 dB | 144 | 109 | 84 | 47 |
| jable-twy_jacinta-008.jpg | 198.5 kb | 240.1 kb | 126 ms | 238.4 kb | 261 ms | 244.8 kb | 27.2 dB | 215 | 174 | 111 | 62 |
| jable-twy_jacinta-022.jpg | 191.5 kb | 224.7 kb | 129 ms | 221.4 kb | 257 ms | 225.9 kb | 29.3 dB | 212 | 142 | 143 | 69 |
| jablehk_snexxxxxxx_0029.jpg | 235.0 kb | 244.7 kb | 132 ms | 241.3 kb | 285 ms | 233.3 kb | 28.6 dB | 227 | 158 | 137 | 70 |
| jablehk_snexxxxxxx_0040.jpg | 242.4 kb | 181.0 kb | 196 ms | 173.8 kb | 336 ms | 173.3 kb | 29.4 dB | 270 | 185 | 111 | 138 |
| jablehk_snexxxxxxx_0055.jpg | 343.4 kb | 304.2 kb | 230 ms | 291.2 kb | 429 ms | 281.4 kb | 26.7 dB | 310 | 220 | 190 | 121 |
| jablehk_snexxxxxxx_0081.jpg | 336.0 kb | 290.2 kb | 222 ms | 284.6 kb | 405 ms | 279.3 kb | 27.5 dB | 340 | 267 | 203 | 156 |
| kodak/kodim01.png | 719.2 kb | 133.8 kb | 50 ms | 131.8 kb | 119 ms | 125.7 kb | 32.1 dB | 96 | 64 | 41 | 27 |
| kodak/kodim05.png | 767.2 kb | 138.1 kb | 51 ms | 135.3 kb | 116 ms | 131.3 kb | 29.2 dB | 93 | 67 | 39 | 26 |
| kodak/kodim15.png | 598.2 kb | 72.6 kb | 41 ms | 69.6 kb | 82 ms | 66.8 kb | 26.7 dB | 61 | 44 | 23 | 17 |
| kodak/kodim20.png | 480.9 kb | 59.4 kb | 35 ms | 56.9 kb | 69 ms | 55.9 kb | 24.7 dB | 56 | 36 | 20 | 15 |
| kodak/kodim23.png | 544.5 kb | 54.9 kb | 38 ms | 51.2 kb | 71 ms | 46.3 kb | 29.7 dB | 48 | 33 | 18 | 12 |
| kodak/kodim24.png | 689.8 kb | 116.5 kb | 48 ms | 111.9 kb | 102 ms | 108.5 kb | 29.6 dB | 99 | 60 | 33 | 24 |
