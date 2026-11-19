name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8384 = 8380 + 4 padding)
Instructions (size = 8344)
0x277a5276e360     0  d2800110       movz x16, #0x8
0x277a5276e364     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x277a5276e368     8  a9017bfd       stp fp, lr, [sp, #16]
0x277a5276e36c     c  910043fd       add fp, sp, #0x10 (16)
0x277a5276e370    10  d114c3ff       sub sp, sp, #0x530 (1328)
0x277a5276e374    14  f841f0e6       ldur x6, [x7, #31]
0x277a5276e378    18  f8520348       ldur x8, [x26, #-224]
0x277a5276e37c    1c  f9024fe0       str x0, [sp, #1176]
0x277a5276e380    20  f90287e6       str x6, [sp, #1288]
0x277a5276e384    24  eb2863ff       cmp sp, x8
0x277a5276e388    28  5400d729       b.ls #+0x1ae4 (addr 0x277a5276fe6c)
0x277a5276e38c    2c  f842f0e8       ldur x8, [x7, #47]
0x277a5276e390    30  b9400109       ldr w9, [x8]
0x277a5276e394    34  51080124       sub w4, w9, #0x200 (512)
0x277a5276e398    38  b9000104       str w4, [x8]
0x277a5276e39c    3c  2a0003e9       mov w9, w0
0x277a5276e3a0    40  910240ca       add x10, x6, #0x90 (144)
0x277a5276e3a4    44  fc696942       ldr d2, [x10, x9]
0x277a5276e3a8    48  5e0c0441       mov s1, v2.s[1]
0x277a5276e3ac    4c  52a75010       movz w16, #0x3a800000
0x277a5276e3b0    50  1e270203       fmov s3, w16
0x277a5276e3b4    54  1e230824       fmul s4, s1, s3
0x277a5276e3b8    58  5e040440       mov s0, v2.s[0]
0x277a5276e3bc    5c  1e230803       fmul s3, s0, s3
0x277a5276e3c0    60  9102812a       add x10, x9, #0xa0 (160)
0x277a5276e3c4    64  bc6a68c5       ldr s5, [x6, x10]
0x277a5276e3c8    68  1e2520a0       fcmp s5, s5
0x277a5276e3cc    6c  1e251c66       fcsel s6, s3, s5, ne
0x277a5276e3d0    70  1e232060       fcmp s3, s3
0x277a5276e3d4    74  1e231cc3       fcsel s3, s6, s3, ne
0x277a5276e3d8    78  1e262060       fcmp s3, s6
0x277a5276e3dc    7c  1e233cc3       fcsel s3, s6, s3, lo
0x277a5276e3e0    80  1e232060       fcmp s3, s3
0x277a5276e3e4    84  1e231c83       fcsel s3, s4, s3, ne
0x277a5276e3e8    88  1e242080       fcmp s4, s4
0x277a5276e3ec    8c  1e241c64       fcsel s4, s3, s4, ne
0x277a5276e3f0    90  1e232080       fcmp s4, s3
0x277a5276e3f4    94  1e243c63       fcsel s3, s3, s4, lo
0x277a5276e3f8    98  52840010       movz w16, #0x2000
0x277a5276e3fc    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x277a5276e400    a0  1e270204       fmov s4, w16
0x277a5276e404    a4  1e240863       fmul s3, s3, s4
0x277a5276e408    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x277a5276e40c    ac  1e231883       fdiv s3, s4, s3
0x277a5276e410    b0  9102112a       add x10, x9, #0x84 (132)
0x277a5276e414    b4  bc2a68c3       str s3, [x6, x10]
0x277a5276e418    b8  4e040466       dup v6.4s, v3.s[0]
0x277a5276e41c    bc  6e26dc42       fmul v2.4s, v2.4s, v6.4s
0x277a5276e420    c0  4ea18842       frintp v2.4s, v2.4s
0x277a5276e424    c4  5e040446       mov s6, v2.s[0]
0x277a5276e428    c8  1e22c0c7       fcvt d7, s6
0x277a5276e42c    cc  1e65c0e8       frintz d8, d7
0x277a5276e430    d0  1e79010b       fcvtzu w11, d8
0x277a5276e434    d4  1e630169       ucvtf d9, w11
0x277a5276e438    d8  f90297e8       str x8, [sp, #1320]
0x277a5276e43c    dc  f90293e4       str x4, [sp, #1312]
0x277a5276e440    e0  f90023e9       str x9, [sp, #64]
0x277a5276e444    e4  fd025fe1       str d1, [sp, #1208]
0x277a5276e448    e8  fd0263e0       str d0, [sp, #1216]
0x277a5276e44c    ec  fd028be5       str d5, [sp, #1296]
0x277a5276e450    f0  fd024be3       str d3, [sp, #1168]
0x277a5276e454    f4  f9000fea       str x10, [sp, #24]
0x277a5276e458    f8  1e692100       fcmp d8, d9
0x277a5276e45c    fc  5400d121       b.ne #+0x1a24 (addr 0x277a5276fe80)
0x277a5276e460   100  4e040d66       dup v6.4s, w11
0x277a5276e464   104  5e0c0447       mov s7, v2.s[1]
0x277a5276e468   108  1e22c0e8       fcvt d8, s7
0x277a5276e46c   10c  1e65c109       frintz d9, d8
0x277a5276e470   110  1e79012b       fcvtzu w11, d9
0x277a5276e474   114  1e63016a       ucvtf d10, w11
0x277a5276e478   118  1e6a2120       fcmp d9, d10
0x277a5276e47c   11c  5400d181       b.ne #+0x1a30 (addr 0x277a5276feac)
0x277a5276e480   120  4e0c1d66       mov v6.s[1], w11
0x277a5276e484   124  4f000427       movi v7.4s, #0x1, lsl #0
0x277a5276e488   128  6ea764c6       umax v6.4s, v6.4s, v7.4s
0x277a5276e48c   12c  6f00e408       movi v8.2d, #0x0
0x277a5276e490   130  6ea0c849       fcmge v9.4s, v2.4s, #0.0
0x277a5276e494   134  52a9f010       movz w16, #0x4f800000
0x277a5276e498   138  4e040e0a       dup v10.4s, w16
0x277a5276e49c   13c  6ea2e542       fcmgt v2.4s, v10.4s, v2.4s
0x277a5276e4a0   140  4e221d22       and v2.16b, v9.16b, v2.16b
0x277a5276e4a4   144  6e671cc2       bsl v2.16b, v6.16b, v7.16b
0x277a5276e4a8   148  910220cb       add x11, x6, #0x88 (136)
0x277a5276e4ac   14c  8b09016b       add x11, x11, x9
0x277a5276e4b0   150  0d008562       st1 {v2.d}[0], [x11]
0x277a5276e4b4   154  9103312b       add x11, x9, #0xcc (204)
0x277a5276e4b8   158  b86b68cb       ldr w11, [x6, x11]
0x277a5276e4bc   15c  9100e08c       add x12, x4, #0x38 (56)
0x277a5276e4c0   160  b82c68cb       str w11, [x6, x12]
0x277a5276e4c4   164  9103112b       add x11, x9, #0xc4 (196)
0x277a5276e4c8   168  f86b68cb       ldr x11, [x6, x11]
0x277a5276e4cc   16c  9100c08c       add x12, x4, #0x30 (48)
0x277a5276e4d0   170  f82c68cb       str x11, [x6, x12]
0x277a5276e4d4   174  1101800b       add w11, w0, #0x60 (96)
0x277a5276e4d8   178  9100112c       add x12, x9, #0x4 (4)
0x277a5276e4dc   17c  b86c68c2       ldr w2, [x6, x12]
0x277a5276e4e0   180  9100212d       add x13, x9, #0x8 (8)
0x277a5276e4e4   184  b86d68c3       ldr w3, [x6, x13]
0x277a5276e4e8   188  9100412e       add x14, x9, #0x10 (16)
0x277a5276e4ec   18c  b86e68cf       ldr w15, [x6, x14]
0x277a5276e4f0   190  91005133       add x19, x9, #0x14 (20)
0x277a5276e4f4   194  b87368c5       ldr w5, [x6, x19]
0x277a5276e4f8   198  3d80e7e7       str q7, [sp, #912]
0x277a5276e4fc   19c  3d800fe8       str q8, [sp, #48]
0x277a5276e500   1a0  f901ffec       str x12, [sp, #1016]
0x277a5276e504   1a4  f90017ed       str x13, [sp, #40]
0x277a5276e508   1a8  f901fbee       str x14, [sp, #1008]
0x277a5276e50c   1ac  f90247f3       str x19, [sp, #1160]
0x277a5276e510   1b0  aa0b03e0       mov x0, x11
0x277a5276e514   1b4  aa0f03e4       mov x4, x15
0x277a5276e518   1b8  97fc0c59       bl #-0xfce9c (addr 0x277a5267167c)
0x277a5276e51c   1bc  f94023e6       ldr x6, [sp, #64]
0x277a5276e520   1c0  9100e0c8       add x8, x6, #0x38 (56)
0x277a5276e524   1c4  f94287e9       ldr x9, [sp, #1288]
0x277a5276e528   1c8  b828693f       str wzr, [x9, x8]
0x277a5276e52c   1cc  f9424fea       ldr x10, [sp, #1176]
0x277a5276e530   1d0  11028142       add w2, w10, #0xa0 (160)
0x277a5276e534   1d4  9101f0cb       add x11, x6, #0x7c (124)
0x277a5276e538   1d8  b86b692b       ldr w11, [x9, x11]
0x277a5276e53c   1dc  910200cc       add x12, x6, #0x80 (128)
0x277a5276e540   1e0  b86c692c       ldr w12, [x9, x12]
0x277a5276e544   1e4  0b0c096c       add w12, w11, w12, lsl #2
0x277a5276e548   1e8  f94017ed       ldr x13, [sp, #40]
0x277a5276e54c   1ec  b86d692e       ldr w14, [x9, x13]
0x277a5276e550   1f0  f941ffef       ldr x15, [sp, #1016]
0x277a5276e554   1f4  b86f6933       ldr w19, [x9, x15]
0x277a5276e558   1f8  1100c140       add w0, w10, #0x30 (48)
0x277a5276e55c   1fc  f9028fe8       str x8, [sp, #1304]
0x277a5276e560   200  f90267e2       str x2, [sp, #1224]
0x277a5276e564   204  f90253eb       str x11, [sp, #1184]
0x277a5276e568   208  f90257ec       str x12, [sp, #1192]
0x277a5276e56c   20c  f9027fee       str x14, [sp, #1272]
0x277a5276e570   210  f9027bf3       str x19, [sp, #1264]
0x277a5276e574   214  f9026fe0       str x0, [sp, #1240]
0x277a5276e578   218  aa0b03f5       mov x21, x11
0x277a5276e57c   21c  d2800014       movz x20, #0x0
0x277a5276e580   220  fd424be3       ldr d3, [sp, #1168]
0x277a5276e584   224  f8520356       ldur x22, [x26, #-224]
0x277a5276e588   228  eb3663ff       cmp sp, x22
0x277a5276e58c   22c  5400ca09       b.ls #+0x1940 (addr 0x277a5276fecc)
0x277a5276e590   230  6b0c02bf       cmp w21, w12
0x277a5276e594   234  54000120       b.eq #+0x24 (addr 0x277a5276e5b8)
0x277a5276e598   238  b8756936       ldr w22, [x9, x21]
0x277a5276e59c   23c  110012b5       add w21, w21, #0x4 (4)
0x277a5276e5a0   240  6b1601df       cmp w14, w22
0x277a5276e5a4   244  54ffff09       b.ls #-0x20 (addr 0x277a5276e584)
0x277a5276e5a8   248  0b160a76       add w22, w19, w22, lsl #2
0x277a5276e5ac   24c  bc766923       ldr s3, [x9, x22]
0x277a5276e5b0   250  d2800036       movz x22, #0x1
0x277a5276e5b4   254  14000003       b #+0xc (addr 0x277a5276e5c0)
0x277a5276e5b8   258  d2800016       movz x22, #0x0
0x277a5276e5bc   25c  aa0c03f5       mov x21, x12
0x277a5276e5c0   260  fd024be3       str d3, [sp, #1168]
0x277a5276e5c4   264  f90283f5       str x21, [sp, #1280]
0x277a5276e5c8   268  710006df       cmp w22, #0x1 (1)
0x277a5276e5cc   26c  540004a1       b.ne #+0x94 (addr 0x277a5276e660)
0x277a5276e5d0   270  9100c0d6       add x22, x6, #0x30 (48)
0x277a5276e5d4   274  b8766936       ldr w22, [x9, x22]
0x277a5276e5d8   278  6b16029f       cmp w20, w22
0x277a5276e5dc   27c  54000261       b.ne #+0x4c (addr 0x277a5276e628)
0x277a5276e5e0   280  d2800023       movz x3, #0x1
0x277a5276e5e4   284  f90277f4       str x20, [sp, #1256]
0x277a5276e5e8   288  f9429be7       ldr x7, [sp, #1328]
0x277a5276e5ec   28c  aa1403e2       mov x2, x20
0x277a5276e5f0   290  97fc0c24       bl #-0xfcf70 (addr 0x277a52671680)
0x277a5276e5f4   294  f94287e9       ldr x9, [sp, #1288]
0x277a5276e5f8   298  f94023e6       ldr x6, [sp, #64]
0x277a5276e5fc   29c  f941ffef       ldr x15, [sp, #1016]
0x277a5276e600   2a0  f94017ed       ldr x13, [sp, #40]
0x277a5276e604   2a4  f9428fe8       ldr x8, [sp, #1304]
0x277a5276e608   2a8  f94257ec       ldr x12, [sp, #1192]
0x277a5276e60c   2ac  f9424fea       ldr x10, [sp, #1176]
0x277a5276e610   2b0  fd424be3       ldr d3, [sp, #1168]
0x277a5276e614   2b4  f94283f5       ldr x21, [sp, #1280]
0x277a5276e618   2b8  f94277f4       ldr x20, [sp, #1256]
0x277a5276e61c   2bc  f9426fe0       ldr x0, [sp, #1240]
0x277a5276e620   2c0  f9427bf3       ldr x19, [sp, #1264]
0x277a5276e624   2c4  f9427fee       ldr x14, [sp, #1272]
0x277a5276e628   2c8  1100068b       add w11, w20, #0x1 (1)
0x277a5276e62c   2cc  aa0903f0       mov x16, x9
0x277a5276e630   2d0  aa0803e9       mov x9, x8
0x277a5276e634   2d4  aa1003e8       mov x8, x16
0x277a5276e638   2d8  b829690b       str w11, [x8, x9]
0x277a5276e63c   2dc  9100d0d6       add x22, x6, #0x34 (52)
0x277a5276e640   2e0  b8766916       ldr w22, [x8, x22]
0x277a5276e644   2e4  0b140ad4       add w20, w22, w20, lsl #2
0x277a5276e648   2e8  bc346903       str s3, [x8, x20]
0x277a5276e64c   2ec  aa0903f0       mov x16, x9
0x277a5276e650   2f0  aa0803e9       mov x9, x8
0x277a5276e654   2f4  aa1003e8       mov x8, x16
0x277a5276e658   2f8  aa0b03f4       mov x20, x11
0x277a5276e65c   2fc  17ffffca       b #-0xd8 (addr 0x277a5276e584)
0x277a5276e660   300  910110cb       add x11, x6, #0x44 (68)
0x277a5276e664   304  b82b693f       str wzr, [x9, x11]
0x277a5276e668   308  f94247ee       ldr x14, [sp, #1160]
0x277a5276e66c   30c  b86e6933       ldr w19, [x9, x14]
0x277a5276e670   310  f941fbf4       ldr x20, [sp, #1008]
0x277a5276e674   314  b8746935       ldr w21, [x9, x20]
0x277a5276e678   318  1100f140       add w0, w10, #0x3c (60)
0x277a5276e67c   31c  f9027feb       str x11, [sp, #1272]
0x277a5276e680   320  f9026ff3       str x19, [sp, #1240]
0x277a5276e684   324  f90273f5       str x21, [sp, #1248]
0x277a5276e688   328  f90277e0       str x0, [sp, #1256]
0x277a5276e68c   32c  aa0c03f6       mov x22, x12
0x277a5276e690   330  f94253ec       ldr x12, [sp, #1184]
0x277a5276e694   334  d2800002       movz x2, #0x0
0x277a5276e698   338  f8520357       ldur x23, [x26, #-224]
0x277a5276e69c   33c  eb3763ff       cmp sp, x23
0x277a5276e6a0   340  5400c3a9       b.ls #+0x1874 (addr 0x277a5276ff14)
0x277a5276e6a4   344  6b16019f       cmp w12, w22
0x277a5276e6a8   348  54000120       b.eq #+0x24 (addr 0x277a5276e6cc)
0x277a5276e6ac   34c  b86c6937       ldr w23, [x9, x12]
0x277a5276e6b0   350  1100118c       add w12, w12, #0x4 (4)
0x277a5276e6b4   354  6b17027f       cmp w19, w23
0x277a5276e6b8   358  54ffff09       b.ls #-0x20 (addr 0x277a5276e698)
0x277a5276e6bc   35c  0b170ab7       add w23, w21, w23, lsl #2
0x277a5276e6c0   360  bc776923       ldr s3, [x9, x23]
0x277a5276e6c4   364  d2800037       movz x23, #0x1
0x277a5276e6c8   368  14000003       b #+0xc (addr 0x277a5276e6d4)
0x277a5276e6cc   36c  d2800017       movz x23, #0x0
0x277a5276e6d0   370  aa1603ec       mov x12, x22
0x277a5276e6d4   374  fd024be3       str d3, [sp, #1168]
0x277a5276e6d8   378  f9027bec       str x12, [sp, #1264]
0x277a5276e6dc   37c  710006ff       cmp w23, #0x1 (1)
0x277a5276e6e0   380  540003e1       b.ne #+0x7c (addr 0x277a5276e75c)
0x277a5276e6e4   384  9100f0d7       add x23, x6, #0x3c (60)
0x277a5276e6e8   388  b8776937       ldr w23, [x9, x23]
0x277a5276e6ec   38c  6b17005f       cmp w2, w23
0x277a5276e6f0   390  54000261       b.ne #+0x4c (addr 0x277a5276e73c)
0x277a5276e6f4   394  f90283e2       str x2, [sp, #1280]
0x277a5276e6f8   398  f9429be7       ldr x7, [sp, #1328]
0x277a5276e6fc   39c  d2800023       movz x3, #0x1
0x277a5276e700   3a0  97fc0be0       bl #-0xfd080 (addr 0x277a52671680)
0x277a5276e704   3a4  f94287e9       ldr x9, [sp, #1288]
0x277a5276e708   3a8  f94023e6       ldr x6, [sp, #64]
0x277a5276e70c   3ac  f941fbf4       ldr x20, [sp, #1008]
0x277a5276e710   3b0  f94247ee       ldr x14, [sp, #1160]
0x277a5276e714   3b4  f9428fe8       ldr x8, [sp, #1304]
0x277a5276e718   3b8  f94257f6       ldr x22, [sp, #1192]
0x277a5276e71c   3bc  f9424fea       ldr x10, [sp, #1176]
0x277a5276e720   3c0  fd424be3       ldr d3, [sp, #1168]
0x277a5276e724   3c4  f9427bec       ldr x12, [sp, #1264]
0x277a5276e728   3c8  f94283e2       ldr x2, [sp, #1280]
0x277a5276e72c   3cc  f9427feb       ldr x11, [sp, #1272]
0x277a5276e730   3d0  f94277e0       ldr x0, [sp, #1256]
0x277a5276e734   3d4  f94273f5       ldr x21, [sp, #1248]
0x277a5276e738   3d8  f9426ff3       ldr x19, [sp, #1240]
0x277a5276e73c   3dc  1100044d       add w13, w2, #0x1 (1)
0x277a5276e740   3e0  b82b692d       str w13, [x9, x11]
0x277a5276e744   3e4  910100cf       add x15, x6, #0x40 (64)
0x277a5276e748   3e8  b86f692f       ldr w15, [x9, x15]
0x277a5276e74c   3ec  0b0209ef       add w15, w15, w2, lsl #2
0x277a5276e750   3f0  bc2f6923       str s3, [x9, x15]
0x277a5276e754   3f4  aa0d03e2       mov x2, x13
0x277a5276e758   3f8  17ffffd0       b #-0xc0 (addr 0x277a5276e698)
0x277a5276e75c   3fc  910140cb       add x11, x6, #0x50 (80)
0x277a5276e760   400  b82b693f       str wzr, [x9, x11]
0x277a5276e764   404  910080cc       add x12, x6, #0x20 (32)
0x277a5276e768   408  b86c692d       ldr w13, [x9, x12]
0x277a5276e76c   40c  910070cf       add x15, x6, #0x1c (28)
0x277a5276e770   410  b86f6933       ldr w19, [x9, x15]
0x277a5276e774   414  11012140       add w0, w10, #0x48 (72)
0x277a5276e778   418  f9027feb       str x11, [sp, #1272]
0x277a5276e77c   41c  f90013ec       str x12, [sp, #32]
0x277a5276e780   420  f90273ed       str x13, [sp, #1248]
0x277a5276e784   424  f90007ef       str x15, [sp, #8]
0x277a5276e788   428  f9026ff3       str x19, [sp, #1240]
0x277a5276e78c   42c  f9027be0       str x0, [sp, #1264]
0x277a5276e790   430  f94253f5       ldr x21, [sp, #1184]
0x277a5276e794   434  d2800002       movz x2, #0x0
0x277a5276e798   438  f8520357       ldur x23, [x26, #-224]
0x277a5276e79c   43c  eb3763ff       cmp sp, x23
0x277a5276e7a0   440  5400be09       b.ls #+0x17c0 (addr 0x277a5276ff60)
0x277a5276e7a4   444  6b1602bf       cmp w21, w22
0x277a5276e7a8   448  54000120       b.eq #+0x24 (addr 0x277a5276e7cc)
0x277a5276e7ac   44c  b8756937       ldr w23, [x9, x21]
0x277a5276e7b0   450  110012b5       add w21, w21, #0x4 (4)
0x277a5276e7b4   454  6b1701bf       cmp w13, w23
0x277a5276e7b8   458  54ffff09       b.ls #-0x20 (addr 0x277a5276e798)
0x277a5276e7bc   45c  0b170a77       add w23, w19, w23, lsl #2
0x277a5276e7c0   460  bc776923       ldr s3, [x9, x23]
0x277a5276e7c4   464  d2800037       movz x23, #0x1
0x277a5276e7c8   468  14000003       b #+0xc (addr 0x277a5276e7d4)
0x277a5276e7cc   46c  d2800017       movz x23, #0x0
0x277a5276e7d0   470  aa1603f5       mov x21, x22
0x277a5276e7d4   474  fd024be3       str d3, [sp, #1168]
0x277a5276e7d8   478  f9025bf5       str x21, [sp, #1200]
0x277a5276e7dc   47c  710006ff       cmp w23, #0x1 (1)
0x277a5276e7e0   480  540003c1       b.ne #+0x78 (addr 0x277a5276e858)
0x277a5276e7e4   484  910120d7       add x23, x6, #0x48 (72)
0x277a5276e7e8   488  b8776937       ldr w23, [x9, x23]
0x277a5276e7ec   48c  6b17005f       cmp w2, w23
0x277a5276e7f0   490  54000241       b.ne #+0x48 (addr 0x277a5276e838)
0x277a5276e7f4   494  f90283e2       str x2, [sp, #1280]
0x277a5276e7f8   498  f9429be7       ldr x7, [sp, #1328]
0x277a5276e7fc   49c  d2800023       movz x3, #0x1
0x277a5276e800   4a0  97fc0ba0       bl #-0xfd180 (addr 0x277a52671680)
0x277a5276e804   4a4  f94287e9       ldr x9, [sp, #1288]
0x277a5276e808   4a8  f94023e6       ldr x6, [sp, #64]
0x277a5276e80c   4ac  f94007ef       ldr x15, [sp, #8]
0x277a5276e810   4b0  f94013ec       ldr x12, [sp, #32]
0x277a5276e814   4b4  f9427feb       ldr x11, [sp, #1272]
0x277a5276e818   4b8  f94257f6       ldr x22, [sp, #1192]
0x277a5276e81c   4bc  fd424be3       ldr d3, [sp, #1168]
0x277a5276e820   4c0  f9424fea       ldr x10, [sp, #1176]
0x277a5276e824   4c4  f9425bf5       ldr x21, [sp, #1200]
0x277a5276e828   4c8  f94283e2       ldr x2, [sp, #1280]
0x277a5276e82c   4cc  f9427be0       ldr x0, [sp, #1264]
0x277a5276e830   4d0  f9426ff3       ldr x19, [sp, #1240]
0x277a5276e834   4d4  f94273ed       ldr x13, [sp, #1248]
0x277a5276e838   4d8  11000448       add w8, w2, #0x1 (1)
0x277a5276e83c   4dc  b82b6928       str w8, [x9, x11]
0x277a5276e840   4e0  910130ce       add x14, x6, #0x4c (76)
0x277a5276e844   4e4  b86e692e       ldr w14, [x9, x14]
0x277a5276e848   4e8  0b0209ce       add w14, w14, w2, lsl #2
0x277a5276e84c   4ec  bc2e6923       str s3, [x9, x14]
0x277a5276e850   4f0  aa0803e2       mov x2, x8
0x277a5276e854   4f4  17ffffd1       b #-0xbc (addr 0x277a5276e798)
0x277a5276e858   4f8  910170c8       add x8, x6, #0x5c (92)
0x277a5276e85c   4fc  b828693f       str wzr, [x9, x8]
0x277a5276e860   500  9100b0cd       add x13, x6, #0x2c (44)
0x277a5276e864   504  b86d692e       ldr w14, [x9, x13]
0x277a5276e868   508  9100a0d3       add x19, x6, #0x28 (40)
0x277a5276e86c   50c  b8736934       ldr w20, [x9, x19]
0x277a5276e870   510  11015140       add w0, w10, #0x54 (84)
0x277a5276e874   514  f9027be8       str x8, [sp, #1264]
0x277a5276e878   518  f90203ed       str x13, [sp, #1024]
0x277a5276e87c   51c  f9026bee       str x14, [sp, #1232]
0x277a5276e880   520  f9000bf3       str x19, [sp, #16]
0x277a5276e884   524  f90273f4       str x20, [sp, #1248]
0x277a5276e888   528  f90277e0       str x0, [sp, #1256]
0x277a5276e88c   52c  d2800002       movz x2, #0x0
0x277a5276e890   530  f94253ea       ldr x10, [sp, #1184]
0x277a5276e894   534  aa1603f5       mov x21, x22
0x277a5276e898   538  14000004       b #+0x10 (addr 0x277a5276e8a8)
0x277a5276e89c   53c  aa0903f0       mov x16, x9
0x277a5276e8a0   540  aa0803e9       mov x9, x8
0x277a5276e8a4   544  aa1003e8       mov x8, x16
0x277a5276e8a8   548  f8520356       ldur x22, [x26, #-224]
0x277a5276e8ac   54c  eb3663ff       cmp sp, x22
0x277a5276e8b0   550  5400b7c9       b.ls #+0x16f8 (addr 0x277a5276ffa8)
0x277a5276e8b4   554  6b15015f       cmp w10, w21
0x277a5276e8b8   558  540001a0       b.eq #+0x34 (addr 0x277a5276e8ec)
0x277a5276e8bc   55c  b86a6936       ldr w22, [x9, x10]
0x277a5276e8c0   560  1100114a       add w10, w10, #0x4 (4)
0x277a5276e8c4   564  6b1601df       cmp w14, w22
0x277a5276e8c8   568  540000a9       b.ls #+0x14 (addr 0x277a5276e8dc)
0x277a5276e8cc   56c  0b160a96       add w22, w20, w22, lsl #2
0x277a5276e8d0   570  bc766923       ldr s3, [x9, x22]
0x277a5276e8d4   574  d2800036       movz x22, #0x1
0x277a5276e8d8   578  14000007       b #+0x1c (addr 0x277a5276e8f4)
0x277a5276e8dc   57c  aa0803f0       mov x16, x8
0x277a5276e8e0   580  aa0903e8       mov x8, x9
0x277a5276e8e4   584  aa1003e9       mov x9, x16
0x277a5276e8e8   588  17ffffed       b #-0x4c (addr 0x277a5276e89c)
0x277a5276e8ec   58c  d2800016       movz x22, #0x0
0x277a5276e8f0   590  aa1503ea       mov x10, x21
0x277a5276e8f4   594  f90253ea       str x10, [sp, #1184]
0x277a5276e8f8   598  fd024be3       str d3, [sp, #1168]
0x277a5276e8fc   59c  710006df       cmp w22, #0x1 (1)
0x277a5276e900   5a0  54000421       b.ne #+0x84 (addr 0x277a5276e984)
0x277a5276e904   5a4  910150d6       add x22, x6, #0x54 (84)
0x277a5276e908   5a8  b8766936       ldr w22, [x9, x22]
0x277a5276e90c   5ac  6b16005f       cmp w2, w22
0x277a5276e910   5b0  54000241       b.ne #+0x48 (addr 0x277a5276e958)
0x277a5276e914   5b4  f90283e2       str x2, [sp, #1280]
0x277a5276e918   5b8  f9429be7       ldr x7, [sp, #1328]
0x277a5276e91c   5bc  d2800023       movz x3, #0x1
0x277a5276e920   5c0  97fc0b58       bl #-0xfd2a0 (addr 0x277a52671680)
0x277a5276e924   5c4  f94287e9       ldr x9, [sp, #1288]
0x277a5276e928   5c8  f94023e6       ldr x6, [sp, #64]
0x277a5276e92c   5cc  f9400bf3       ldr x19, [sp, #16]
0x277a5276e930   5d0  f94203ed       ldr x13, [sp, #1024]
0x277a5276e934   5d4  f94283e2       ldr x2, [sp, #1280]
0x277a5276e938   5d8  f9427feb       ldr x11, [sp, #1272]
0x277a5276e93c   5dc  f94253ea       ldr x10, [sp, #1184]
0x277a5276e940   5e0  fd424be3       ldr d3, [sp, #1168]
0x277a5276e944   5e4  f9427be8       ldr x8, [sp, #1264]
0x277a5276e948   5e8  f94277e0       ldr x0, [sp, #1256]
0x277a5276e94c   5ec  f94257f5       ldr x21, [sp, #1192]
0x277a5276e950   5f0  f94273f4       ldr x20, [sp, #1248]
0x277a5276e954   5f4  f9426bee       ldr x14, [sp, #1232]
0x277a5276e958   5f8  1100044c       add w12, w2, #0x1 (1)
0x277a5276e95c   5fc  aa0903f0       mov x16, x9
0x277a5276e960   600  aa0803e9       mov x9, x8
0x277a5276e964   604  aa1003e8       mov x8, x16
0x277a5276e968   608  b829690c       str w12, [x8, x9]
0x277a5276e96c   60c  910160cf       add x15, x6, #0x58 (88)
0x277a5276e970   610  b86f690f       ldr w15, [x8, x15]
0x277a5276e974   614  0b0209ef       add w15, w15, w2, lsl #2
0x277a5276e978   618  bc2f6903       str s3, [x8, x15]
0x277a5276e97c   61c  aa0c03e2       mov x2, x12
0x277a5276e980   620  17ffffc7       b #-0xe4 (addr 0x277a5276e89c)
0x277a5276e984   624  f9428fe8       ldr x8, [sp, #1304]
0x277a5276e988   628  b8686928       ldr w8, [x9, x8]
0x277a5276e98c   62c  9100c0ca       add x10, x6, #0x30 (48)
0x277a5276e990   630  3cea6922       ldr q2, [x9, x10]
0x277a5276e994   634  3ce66923       ldr q3, [x9, x6]
0x277a5276e998   638  3caa6923       str q3, [x9, x10]
0x277a5276e99c   63c  3ca66922       str q2, [x9, x6]
0x277a5276e9a0   640  910100ca       add x10, x6, #0x40 (64)
0x277a5276e9a4   644  3cea6922       ldr q2, [x9, x10]
0x277a5276e9a8   648  f941fbec       ldr x12, [sp, #1008]
0x277a5276e9ac   64c  3cec6924       ldr q4, [x9, x12]
0x277a5276e9b0   650  3caa6924       str q4, [x9, x10]
0x277a5276e9b4   654  b86c692a       ldr w10, [x9, x12]
0x277a5276e9b8   658  3cac6922       str q2, [x9, x12]
0x277a5276e9bc   65c  910150ce       add x14, x6, #0x54 (84)
0x277a5276e9c0   660  f86e692e       ldr x14, [x9, x14]
0x277a5276e9c4   664  b86b692f       ldr w15, [x9, x11]
0x277a5276e9c8   668  f94013f4       ldr x20, [sp, #32]
0x277a5276e9cc   66c  3cf46922       ldr q2, [x9, x20]
0x277a5276e9d0   670  3cab6922       str q2, [x9, x11]
0x277a5276e9d4   674  aa0d03eb       mov x11, x13
0x277a5276e9d8   678  b82b6922       str w2, [x9, x11]
0x277a5276e9dc   67c  b874692d       ldr w13, [x9, x20]
0x277a5276e9e0   680  b834692f       str w15, [x9, x20]
0x277a5276e9e4   684  910090cf       add x15, x6, #0x24 (36)
0x277a5276e9e8   688  f82f692e       str x14, [x9, x15]
0x277a5276e9ec   68c  f9028fe8       str x8, [sp, #1304]
0x277a5276e9f0   690  f90277ea       str x10, [sp, #1256]
0x277a5276e9f4   694  35000108       cbnz w8, #+0x20 (addr 0x277a5276ea14)
0x277a5276e9f8   698  f94293e4       ldr x4, [sp, #1312]
0x277a5276e9fc   69c  11080086       add w6, w4, #0x200 (512)
0x277a5276ea00   6a0  f94297ee       ldr x14, [sp, #1320]
0x277a5276ea04   6a4  b90001c6       str w6, [x14]
0x277a5276ea08   6a8  910003bf       mov sp, fp
0x277a5276ea0c   6ac  a8c17bfd       ldp fp, lr, [sp], #16
0x277a5276ea10   6b0  d65f03c0       ret
0x277a5276ea14   6b4  0e143c4e       mov w14, v2.s[2]
0x277a5276ea18   6b8  0e1c3c8f       mov w15, v4.s[3]
0x277a5276ea1c   6bc  0e0c3c75       mov w21, v3.s[1]
0x277a5276ea20   6c0  0e1c3c56       mov w22, v2.s[3]
0x277a5276ea24   6c4  0e0c3c97       mov w23, v4.s[1]
0x277a5276ea28   6c8  0e143c78       mov w24, v3.s[2]
0x277a5276ea2c   6cc  6b1802ff       cmp w23, w24
0x277a5276ea30   6d0  1a9832f9       csel w25, w23, w24, lo
0x277a5276ea34   6d4  6b1901bf       cmp w13, w25
0x277a5276ea38   6d8  1a9931b7       csel w23, w13, w25, lo
0x277a5276ea3c   6dc  6b1702df       cmp w22, w23
0x277a5276ea40   6e0  1a9732cd       csel w13, w22, w23, lo
0x277a5276ea44   6e4  910290d6       add x22, x6, #0xa4 (164)
0x277a5276ea48   6e8  bc766922       ldr s2, [x9, x22]
0x277a5276ea4c   6ec  1e220842       fmul s2, s2, s2
0x277a5276ea50   6f0  4e040443       dup v3.4s, v2.s[0]
0x277a5276ea54   6f4  fd428be4       ldr d4, [sp, #1296]
0x277a5276ea58   6f8  1e240884       fmul s4, s4, s4
0x277a5276ea5c   6fc  4e040485       dup v5.4s, v4.s[0]
0x277a5276ea60   700  f90283ee       str x14, [sp, #1280]
0x277a5276ea64   704  f9027bef       str x15, [sp, #1264]
0x277a5276ea68   708  f90273f5       str x21, [sp, #1248]
0x277a5276ea6c   70c  f9026fed       str x13, [sp, #1240]
0x277a5276ea70   710  fd0217e2       str d2, [sp, #1064]
0x277a5276ea74   714  3d80dfe3       str q3, [sp, #880]
0x277a5276ea78   718  fd021be4       str d4, [sp, #1072]
0x277a5276ea7c   71c  3d80e3e5       str q5, [sp, #896]
0x277a5276ea80   720  f94017f6       ldr x22, [sp, #40]
0x277a5276ea84   724  1e2e1008       fmov s8, #0x70 (1.0000)
0x277a5276ea88   728  3dc0e7e7       ldr q7, [sp, #912]
0x277a5276ea8c   72c  d2800001       movz x1, #0x0
0x277a5276ea90   730  f9400ffc       ldr x28, [sp, #24]
0x277a5276ea94   734  aa1303fb       mov cp, x19
0x277a5276ea98   738  f94007f9       ldr x25, [sp, #8]
0x277a5276ea9c   73c  f941fff8       ldr x24, [sp, #1016]
0x277a5276eaa0   740  f94247f7       ldr x23, [sp, #1160]
0x277a5276eaa4   744  aa0103f3       mov x19, x1
0x277a5276eaa8   748  f8520340       ldur x0, [x26, #-224]
0x277a5276eaac   74c  eb2063ff       cmp sp, x0
0x277a5276eab0   750  5400aa09       b.ls #+0x1540 (addr 0x277a5276fff0)
0x277a5276eab4   754  b8766920       ldr w0, [x9, x22]
0x277a5276eab8   758  f90137e0       str x0, [sp, #616]
0x277a5276eabc   75c  6b13001f       cmp w0, w19
0x277a5276eac0   760  54009c49       b.ls #+0x1388 (addr 0x277a5276fe48)
0x277a5276eac4   764  b8776922       ldr w2, [x9, x23]
0x277a5276eac8   768  f9003fe2       str x2, [sp, #120]
0x277a5276eacc   76c  6b13005f       cmp w2, w19
0x277a5276ead0   770  54009bc9       b.ls #+0x1378 (addr 0x277a5276fe48)
0x277a5276ead4   774  b8746923       ldr w3, [x9, x20]
0x277a5276ead8   778  f9003be3       str x3, [sp, #112]
0x277a5276eadc   77c  6b13007f       cmp w3, w19
0x277a5276eae0   780  54009b49       b.ls #+0x1368 (addr 0x277a5276fe48)
0x277a5276eae4   784  b86b6924       ldr w4, [x9, x11]
0x277a5276eae8   788  f90043e4       str x4, [sp, #128]
0x277a5276eaec   78c  6b13009f       cmp w4, w19
0x277a5276eaf0   790  54009ac9       b.ls #+0x1358 (addr 0x277a5276fe48)
0x277a5276eaf4   794  b8786925       ldr w5, [x9, x24]
0x277a5276eaf8   798  531e7667       lsl w7, w19, #2
0x277a5276eafc   79c  0b0700a8       add w8, w5, w7
0x277a5276eb00   7a0  bc686929       ldr s9, [x9, x8]
0x277a5276eb04   7a4  b86c6928       ldr w8, [x9, x12]
0x277a5276eb08   7a8  0b07010a       add w10, w8, w7
0x277a5276eb0c   7ac  bc6a692a       ldr s10, [x9, x10]
0x277a5276eb10   7b0  b879692a       ldr w10, [x9, x25]
0x277a5276eb14   7b4  f90147e8       str x8, [sp, #648]
0x277a5276eb18   7b8  0b070148       add w8, w10, w7
0x277a5276eb1c   7bc  bc68692b       ldr s11, [x9, x8]
0x277a5276eb20   7c0  b87b6928       ldr w8, [x9, x27]
0x277a5276eb24   7c4  f9013fea       str x10, [sp, #632]
0x277a5276eb28   7c8  0b07010a       add w10, w8, w7
0x277a5276eb2c   7cc  f90143e8       str x8, [sp, #640]
0x277a5276eb30   7d0  bc6a692c       ldr s12, [x9, x10]
0x277a5276eb34   7d4  f94293e8       ldr x8, [sp, #1312]
0x277a5276eb38   7d8  9100310a       add x10, x8, #0xc (12)
0x277a5276eb3c   7dc  bc2a692c       str s12, [x9, x10]
0x277a5276eb40   7e0  9100210a       add x10, x8, #0x8 (8)
0x277a5276eb44   7e4  bc2a692b       str s11, [x9, x10]
0x277a5276eb48   7e8  9100110a       add x10, x8, #0x4 (4)
0x277a5276eb4c   7ec  bc2a692a       str s10, [x9, x10]
0x277a5276eb50   7f0  bc286929       str s9, [x9, x8]
0x277a5276eb54   7f4  9100a10a       add x10, x8, #0x28 (40)
0x277a5276eb58   7f8  b82a693f       str wzr, [x9, x10]
0x277a5276eb5c   7fc  f90253ea       str x10, [sp, #1184]
0x277a5276eb60   800  9100810a       add x10, x8, #0x20 (32)
0x277a5276eb64   804  f82a693f       str xzr, [x9, x10]
0x277a5276eb68   808  6f00e40b       movi v11.2d, #0x0
0x277a5276eb6c   80c  f90257ea       str x10, [sp, #1192]
0x277a5276eb70   810  9100410a       add x10, x8, #0x10 (16)
0x277a5276eb74   814  3caa692b       str q11, [x9, x10]
0x277a5276eb78   818  f9025bea       str x10, [sp, #1200]
0x277a5276eb7c   81c  910220ca       add x10, x6, #0x88 (136)
0x277a5276eb80   820  b86a692a       ldr w10, [x9, x10]
0x277a5276eb84   824  f90027ea       str x10, [sp, #72]
0x277a5276eb88   828  910230ca       add x10, x6, #0x8c (140)
0x277a5276eb8c   82c  b86a692a       ldr w10, [x9, x10]
0x277a5276eb90   830  bc7c692b       ldr s11, [x9, x28]
0x277a5276eb94   834  11010106       add w6, w8, #0x40 (64)
0x277a5276eb98   838  f9028bf3       str x19, [sp, #1296]
0x277a5276eb9c   83c  f9014fe5       str x5, [sp, #664]
0x277a5276eba0   840  f9027fe7       str x7, [sp, #1272]
0x277a5276eba4   844  fd020fe9       str d9, [sp, #1048]
0x277a5276eba8   848  fd0213ea       str d10, [sp, #1056]
0x277a5276ebac   84c  f9024bea       str x10, [sp, #1168]
0x277a5276ebb0   850  fd024feb       str d11, [sp, #1176]
0x277a5276ebb4   854  f9026be6       str x6, [sp, #1232]
0x277a5276ebb8   858  f9429be0       ldr x0, [sp, #1328]
0x277a5276ebbc   85c  aa0603e2       mov x2, x6
0x277a5276ebc0   860  aa0103e3       mov x3, x1
0x277a5276ebc4   864  d2803804       movz x4, #0x1c0
0x277a5276ebc8   868  5800c150       ldr x16, pc+6184 (addr 0x0000277a527703f0)
0x277a5276ebcc   86c  10000068       adr x8, #+0xc (addr 0x277a5276ebd8)
0x277a5276ebd0   870  a9027748       stp x8, fp, [x26, #32]
0x277a5276ebd4   874  d63f0200       blr x16
0x277a5276ebd8   878  f900175f       str xzr, [x26, #40]
0x277a5276ebdc   87c  6a00001f       tst w0, w0
0x277a5276ebe0   880  5400c000       b.eq #+0x1800 (addr 0x277a527703e0)
0x277a5276ebe4   884  f9424be6       ldr x6, [sp, #1168]
0x277a5276ebe8   888  710000df       cmp w6, #0x0 (0)
0x277a5276ebec   88c  9a9f07e8       cset x8, ne
0x277a5276ebf0   890  4b0800c6       sub w6, w6, w8
0x277a5276ebf4   894  fd4213e2       ldr d2, [sp, #1056]
0x277a5276ebf8   898  fd424fe3       ldr d3, [sp, #1176]
0x277a5276ebfc   89c  1e230844       fmul s4, s2, s3
0x277a5276ec00   8a0  1e242080       fcmp s4, s4
0x277a5276ec04   8a4  1e241de4       fcsel s4, s15, s4, ne
0x277a5276ec08   8a8  1e202088       fcmp s4, #0.0
0x277a5276ec0c   8ac  1e2fcc84       fcsel s4, s4, s15, gt
0x277a5276ec10   8b0  1e22c085       fcvt d5, s4
0x277a5276ec14   8b4  1e65c0a6       frintz d6, d5
0x277a5276ec18   8b8  1e7900c8       fcvtzu w8, d6
0x277a5276ec1c   8bc  1e630107       ucvtf d7, w8
0x277a5276ec20   8c0  1e6720c0       fcmp d6, d7
0x277a5276ec24   8c4  5400a1a1       b.ne #+0x1434 (addr 0x277a52770058)
0x277a5276ec28   8c8  6b0800df       cmp w6, w8
0x277a5276ec2c   8cc  1a8830c9       csel w9, w6, w8, lo
0x277a5276ec30   8d0  52a9f010       movz w16, #0x4f800000
0x277a5276ec34   8d4  1e270205       fmov s5, w16
0x277a5276ec38   8d8  1e252080       fcmp s4, s5
0x277a5276ec3c   8dc  1a9f3128       csel w8, w9, wzr, lo
0x277a5276ec40   8e0  7100011f       cmp w8, #0x0 (0)
0x277a5276ec44   8e4  9a9f07e9       cset x9, ne
0x277a5276ec48   8e8  4b090109       sub w9, w8, w9
0x277a5276ec4c   8ec  11000508       add w8, w8, #0x1 (1)
0x277a5276ec50   8f0  6b0800df       cmp w6, w8
0x277a5276ec54   8f4  1a8830ca       csel w10, w6, w8, lo
0x277a5276ec58   8f8  f9024bea       str x10, [sp, #1168]
0x277a5276ec5c   8fc  6b09015f       cmp w10, w9
0x277a5276ec60   900  54008483       b.lo #+0x1090 (addr 0x277a5276fcf0)
0x277a5276ec64   904  f94027e6       ldr x6, [sp, #72]
0x277a5276ec68   908  710000df       cmp w6, #0x0 (0)
0x277a5276ec6c   90c  9a9f07e8       cset x8, ne
0x277a5276ec70   910  4b0800c8       sub w8, w6, w8
0x277a5276ec74   914  fd420fe4       ldr d4, [sp, #1048]
0x277a5276ec78   918  1e230883       fmul s3, s4, s3
0x277a5276ec7c   91c  1e232060       fcmp s3, s3
0x277a5276ec80   920  1e231de3       fcsel s3, s15, s3, ne
0x277a5276ec84   924  1e202068       fcmp s3, #0.0
0x277a5276ec88   928  1e2fcc63       fcsel s3, s3, s15, gt
0x277a5276ec8c   92c  1e22c066       fcvt d6, s3
0x277a5276ec90   930  1e65c0c7       frintz d7, d6
0x277a5276ec94   934  1e7900eb       fcvtzu w11, d7
0x277a5276ec98   938  1e630168       ucvtf d8, w11
0x277a5276ec9c   93c  1e6820e0       fcmp d7, d8
0x277a5276eca0   940  54009ec1       b.ne #+0x13d8 (addr 0x277a52770078)
0x277a5276eca4   944  6b0b011f       cmp w8, w11
0x277a5276eca8   948  1a8b310c       csel w12, w8, w11, lo
0x277a5276ecac   94c  1e252060       fcmp s3, s5
0x277a5276ecb0   950  1a9f318b       csel w11, w12, wzr, lo
0x277a5276ecb4   954  7100017f       cmp w11, #0x0 (0)
0x277a5276ecb8   958  9a9f07ec       cset x12, ne
0x277a5276ecbc   95c  4b0c016c       sub w12, w11, w12
0x277a5276ecc0   960  f9403bee       ldr x14, [sp, #112]
0x277a5276ecc4   964  f94043ed       ldr x13, [sp, #128]
0x277a5276ecc8   968  6b0d01df       cmp w14, w13
0x277a5276eccc   96c  1a8d31cf       csel w15, w14, w13, lo
0x277a5276ecd0   970  f9403ff3       ldr x19, [sp, #120]
0x277a5276ecd4   974  6b0f027f       cmp w19, w15
0x277a5276ecd8   978  1a8f3274       csel w20, w19, w15, lo
0x277a5276ecdc   97c  1100056b       add w11, w11, #0x1 (1)
0x277a5276ece0   980  6b0b011f       cmp w8, w11
0x277a5276ece4   984  1a8b310f       csel w15, w8, w11, lo
0x277a5276ece8   988  110005e8       add w8, w15, #0x1 (1)
0x277a5276ecec   98c  4e040483       dup v3.4s, v4.s[0]
0x277a5276ecf0   990  4e040445       dup v5.4s, v2.s[0]
0x277a5276ecf4   994  f94023eb       ldr x11, [sp, #64]
0x277a5276ecf8   998  9101916f       add x15, x11, #0x64 (100)
0x277a5276ecfc   99c  f94287f5       ldr x21, [sp, #1288]
0x277a5276ed00   9a0  b86f6aaf       ldr w15, [x21, x15]
0x277a5276ed04   9a4  9101a176       add x22, x11, #0x68 (104)
0x277a5276ed08   9a8  b8766ab6       ldr w22, [x21, x22]
0x277a5276ed0c   9ac  f94293e4       ldr x4, [sp, #1312]
0x277a5276ed10   9b0  9105c097       add x23, x4, #0x170 (368)
0x277a5276ed14   9b4  3cf76aa6       ldr q6, [x21, x23]
0x277a5276ed18   9b8  9104c098       add x24, x4, #0x130 (304)
0x277a5276ed1c   9bc  3cf86aa7       ldr q7, [x21, x24]
0x277a5276ed20   9c0  9103c099       add x25, x4, #0xf0 (240)
0x277a5276ed24   9c4  3cf96aa8       ldr q8, [x21, x25]
0x277a5276ed28   9c8  9102c09b       add cp, x4, #0xb0 (176)
0x277a5276ed2c   9cc  3cfb6aa9       ldr q9, [x21, x27]
0x277a5276ed30   9d0  9101c09c       add x28, x4, #0x70 (112)
0x277a5276ed34   9d4  3cfc6aaa       ldr q10, [x21, x28]
0x277a5276ed38   9d8  9107c080       add x0, x4, #0x1f0 (496)
0x277a5276ed3c   9dc  3ce06aab       ldr q11, [x21, x0]
0x277a5276ed40   9e0  9106c081       add x1, x4, #0x1b0 (432)
0x277a5276ed44   9e4  3ce16aac       ldr q12, [x21, x1]
0x277a5276ed48   9e8  91058082       add x2, x4, #0x160 (352)
0x277a5276ed4c   9ec  3ce26aad       ldr q13, [x21, x2]
0x277a5276ed50   9f0  91048083       add x3, x4, #0x120 (288)
0x277a5276ed54   9f4  3ce36aae       ldr q14, [x21, x3]
0x277a5276ed58   9f8  91038085       add x5, x4, #0xe0 (224)
0x277a5276ed5c   9fc  3ce56ab0       ldr q16, [x21, x5]
0x277a5276ed60   a00  91028087       add x7, x4, #0xa0 (160)
0x277a5276ed64   a04  3ce76ab1       ldr q17, [x21, x7]
0x277a5276ed68   a08  9101808b       add x11, x4, #0x60 (96)
0x277a5276ed6c   a0c  3ceb6ab2       ldr q18, [x21, x11]
0x277a5276ed70   a10  9107808a       add x10, x4, #0x1e0 (480)
0x277a5276ed74   a14  3cea6ab3       ldr q19, [x21, x10]
0x277a5276ed78   a18  f9013bf4       str x20, [sp, #624]
0x277a5276ed7c   a1c  91068094       add x20, x4, #0x1a0 (416)
0x277a5276ed80   a20  3cf46ab4       ldr q20, [x21, x20]
0x277a5276ed84   a24  f901e7fc       str x28, [sp, #968]
0x277a5276ed88   a28  9105409c       add x28, x4, #0x150 (336)
0x277a5276ed8c   a2c  3cfc6ab5       ldr q21, [x21, x28]
0x277a5276ed90   a30  f901e3fb       str cp, [sp, #960]
0x277a5276ed94   a34  9104409b       add cp, x4, #0x110 (272)
0x277a5276ed98   a38  3cfb6ab6       ldr q22, [x21, x27]
0x277a5276ed9c   a3c  f901dff9       str x25, [sp, #952]
0x277a5276eda0   a40  91034099       add x25, x4, #0xd0 (208)
0x277a5276eda4   a44  3cf96ab7       ldr q23, [x21, x25]
0x277a5276eda8   a48  f901dbf8       str x24, [sp, #944]
0x277a5276edac   a4c  91024098       add x24, x4, #0x90 (144)
0x277a5276edb0   a50  3cf86ab8       ldr q24, [x21, x24]
0x277a5276edb4   a54  f901d7f7       str x23, [sp, #936]
0x277a5276edb8   a58  91014097       add x23, x4, #0x50 (80)
0x277a5276edbc   a5c  3cf76ab9       ldr q25, [x21, x23]
0x277a5276edc0   a60  f901d3e1       str x1, [sp, #928]
0x277a5276edc4   a64  91074081       add x1, x4, #0x1d0 (464)
0x277a5276edc8   a68  3ce16aba       ldr q26, [x21, x1]
0x277a5276edcc   a6c  f901b7e0       str x0, [sp, #872]
0x277a5276edd0   a70  91064080       add x0, x4, #0x190 (400)
0x277a5276edd4   a74  3ce06abb       ldr q27, [x21, x0]
0x277a5276edd8   a78  f901b3eb       str x11, [sp, #864]
0x277a5276eddc   a7c  9105008b       add x11, x4, #0x140 (320)
0x277a5276ede0   a80  3ceb6abc       ldr q28, [x21, x11]
0x277a5276ede4   a84  f9019fe7       str x7, [sp, #824]
0x277a5276ede8   a88  91040087       add x7, x4, #0x100 (256)
0x277a5276edec   a8c  3ce76aa0       ldr q0, [x21, x7]
0x277a5276edf0   a90  f9019be5       str x5, [sp, #816]
0x277a5276edf4   a94  91030085       add x5, x4, #0xc0 (192)
0x277a5276edf8   a98  3ce56aa1       ldr q1, [x21, x5]
0x277a5276edfc   a9c  f90197e3       str x3, [sp, #808]
0x277a5276ee00   aa0  91020083       add x3, x4, #0x80 (128)
0x277a5276ee04   aa4  3ce36aa2       ldr q2, [x21, x3]
0x277a5276ee08   aa8  f90193e2       str x2, [sp, #800]
0x277a5276ee0c   aac  91010082       add x2, x4, #0x40 (64)
0x277a5276ee10   ab0  3ce26aa4       ldr q4, [x21, x2]
0x277a5276ee14   ab4  f9018ff4       str x20, [sp, #792]
0x277a5276ee18   ab8  91070094       add x20, x4, #0x1c0 (448)
0x277a5276ee1c   abc  3d80d7e3       str q3, [sp, #848]
0x277a5276ee20   ac0  3cf46aa3       ldr q3, [x21, x20]
0x277a5276ee24   ac4  f9018bea       str x10, [sp, #784]
0x277a5276ee28   ac8  9106008a       add x10, x4, #0x180 (384)
0x277a5276ee2c   acc  3d80d3e5       str q5, [sp, #832]
0x277a5276ee30   ad0  3cea6aa5       ldr q5, [x21, x10]
0x277a5276ee34   ad4  f9002bec       str x12, [sp, #80]
0x277a5276ee38   ad8  f9002fe8       str x8, [sp, #88]
0x277a5276ee3c   adc  f90037ef       str x15, [sp, #104]
0x277a5276ee40   ae0  f90033f6       str x22, [sp, #96]
0x277a5276ee44   ae4  f90177fc       str x28, [sp, #744]
0x277a5276ee48   ae8  f9017bfb       str cp, [sp, #752]
0x277a5276ee4c   aec  f9017ff9       str x25, [sp, #760]
0x277a5276ee50   af0  f90183f8       str x24, [sp, #768]
0x277a5276ee54   af4  f90187f7       str x23, [sp, #776]
0x277a5276ee58   af8  f90173e0       str x0, [sp, #736]
0x277a5276ee5c   afc  f9015beb       str x11, [sp, #688]
0x277a5276ee60   b00  f90157ea       str x10, [sp, #680]
0x277a5276ee64   b04  3dc00ffe       ldr q30, [sp, #48]
0x277a5276ee68   b08  3d811ffe       str q30, [sp, #1136]
0x277a5276ee6c   b0c  b90483ff       str wzr, [sp, #1152]
0x277a5276ee70   b10  b9046bff       str wzr, [sp, #1128]
0x277a5276ee74   b14  b90463ff       str wzr, [sp, #1120]
0x277a5276ee78   b18  b9045bff       str wzr, [sp, #1112]
0x277a5276ee7c   b1c  3d8033e8       str q8, [sp, #192]
0x277a5276ee80   b20  4ea51ca8       mov v8.16b, v5.16b
0x277a5276ee84   b24  3d8037e9       str q9, [sp, #208]
0x277a5276ee88   b28  4ea31c69       mov v9.16b, v3.16b
0x277a5276ee8c   b2c  3d803bea       str q10, [sp, #224]
0x277a5276ee90   b30  4ea41c8a       mov v10.16b, v4.16b
0x277a5276ee94   b34  3d803feb       str q11, [sp, #240]
0x277a5276ee98   b38  4ea21c4b       mov v11.16b, v2.16b
0x277a5276ee9c   b3c  3d802fe7       str q7, [sp, #176]
0x277a5276eea0   b40  3d802be6       str q6, [sp, #160]
0x277a5276eea4   b44  b90453ff       str wzr, [sp, #1104]
0x277a5276eea8   b48  1400001f       b #+0x7c (addr 0x277a5276ef24)
0x277a5276eeac   b4c  f94027e6       ldr x6, [sp, #72]
0x277a5276eeb0   b50  f9402bec       ldr x12, [sp, #80]
0x277a5276eeb4   b54  f9402fe8       ldr x8, [sp, #88]
0x277a5276eeb8   b58  f94033f6       ldr x22, [sp, #96]
0x277a5276eebc   b5c  aa0f03e9       mov x9, x15
0x277a5276eec0   b60  f94037ef       ldr x15, [sp, #104]
0x277a5276eec4   b64  4ea61cc8       mov v8.16b, v6.16b
0x277a5276eec8   b68  4ea91d31       mov v17.16b, v9.16b
0x277a5276eecc   b6c  4ea71ce9       mov v9.16b, v7.16b
0x277a5276eed0   b70  3d803bec       str q12, [sp, #224]
0x277a5276eed4   b74  4eaa1d4c       mov v12.16b, v10.16b
0x277a5276eed8   b78  4ea11c2a       mov v10.16b, v1.16b
0x277a5276eedc   b7c  3d803feb       str q11, [sp, #240]
0x277a5276eee0   b80  3dc08beb       ldr q11, [sp, #544]
0x277a5276eee4   b84  3dc087e1       ldr q1, [sp, #528]
0x277a5276eee8   b88  3d8037ee       str q14, [sp, #208]
0x277a5276eeec   b8c  4eb31e6e       mov v14.16b, v19.16b
0x277a5276eef0   b90  4eb61ed3       mov v19.16b, v22.16b
0x277a5276eef4   b94  4eba1f56       mov v22.16b, v26.16b
0x277a5276eef8   b98  4ea01c1a       mov v26.16b, v0.16b
0x277a5276eefc   b9c  3dc083e0       ldr q0, [sp, #512]
0x277a5276ef00   ba0  4eb51eb4       mov v20.16b, v21.16b
0x277a5276ef04   ba4  4ebb1f75       mov v21.16b, v27.16b
0x277a5276ef08   ba8  4ebc1f9b       mov v27.16b, v28.16b
0x277a5276ef0c   bac  4ea51cbc       mov v28.16b, v5.16b
0x277a5276ef10   bb0  f9403bee       ldr x14, [sp, #112]
0x277a5276ef14   bb4  f9403ff3       ldr x19, [sp, #120]
0x277a5276ef18   bb8  f94043ed       ldr x13, [sp, #128]
0x277a5276ef1c   bbc  3dc057f2       ldr q18, [sp, #336]
0x277a5276ef20   bc0  aa1903f5       mov x21, x25
0x277a5276ef24   bc4  f8520340       ldur x0, [x26, #-224]
0x277a5276ef28   bc8  f9414ff7       ldr x23, [sp, #664]
0x277a5276ef2c   bcc  f94147fb       ldr cp, [sp, #648]
0x277a5276ef30   bd0  f94143fc       ldr x28, [sp, #640]
0x277a5276ef34   bd4  f9413ff9       ldr x25, [sp, #632]
0x277a5276ef38   bd8  f94137f8       ldr x24, [sp, #616]
0x277a5276ef3c   bdc  d2800004       movz x4, #0x0
0x277a5276ef40   be0  f9024fe9       str x9, [sp, #1176]
0x277a5276ef44   be4  eb2063ff       cmp sp, x0
0x277a5276ef48   be8  54008a89       b.ls #+0x1150 (addr 0x277a52770098)
0x277a5276ef4c   bec  1b067d20       mul w0, w9, w6
0x277a5276ef50   bf0  0b0c0006       add w6, w0, w12
0x277a5276ef54   bf4  6b0602df       cmp w22, w6
0x277a5276ef58   bf8  54000189       b.ls #+0x30 (addr 0x277a5276ef88)
0x277a5276ef5c   bfc  0b000100       add w0, w8, w0
0x277a5276ef60   c00  6b0002df       cmp w22, w0
0x277a5276ef64   c04  54000129       b.ls #+0x24 (addr 0x277a5276ef88)
0x277a5276ef68   c08  0b0009e0       add w0, w15, w0, lsl #2
0x277a5276ef6c   c0c  b8606aa0       ldr w0, [x21, x0]
0x277a5276ef70   c10  0b0609e6       add w6, w15, w6, lsl #2
0x277a5276ef74   c14  b8666aa6       ldr w6, [x21, x6]
0x277a5276ef78   c18  aa0003f0       mov x16, x0
0x277a5276ef7c   c1c  aa0603e0       mov x0, x6
0x277a5276ef80   c20  aa1003e6       mov x6, x16
0x277a5276ef84   c24  14000003       b #+0xc (addr 0x277a5276ef90)
0x277a5276ef88   c28  aa0403e6       mov x6, x4
0x277a5276ef8c   c2c  aa0403e0       mov x0, x4
0x277a5276ef90   c30  531e7408       lsl w8, w0, #2
0x277a5276ef94   c34  0b0802ec       add w12, w23, w8
0x277a5276ef98   c38  4b0000cf       sub w15, w6, w0
0x277a5276ef9c   c3c  6b06031f       cmp w24, w6
0x277a5276efa0   c40  9a9f27f6       cset x22, lo
0x277a5276efa4   c44  6b0000df       cmp w6, w0
0x277a5276efa8   c48  9a9f27e9       cset x9, lo
0x277a5276efac   c4c  2a0902d7       orr w23, w22, w9
0x277a5276efb0   c50  6a1702ff       tst w23, w23
0x277a5276efb4   c54  1a8f13f7       csel w23, wzr, w15, ne
0x277a5276efb8   c58  f9014be6       str x6, [sp, #656]
0x277a5276efbc   c5c  f901f7f7       str x23, [sp, #1000]
0x277a5276efc0   c60  6b0000df       cmp w6, w0
0x277a5276efc4   c64  54000423       b.lo #+0x84 (addr 0x277a5276f048)
0x277a5276efc8   c68  0b080320       add w0, w25, w8
0x277a5276efcc   c6c  d2800099       movz x25, #0x4
0x277a5276efd0   c70  6b0601df       cmp w14, w6
0x277a5276efd4   c74  1a803338       csel w24, w25, w0, lo
0x277a5276efd8   c78  6b0601df       cmp w14, w6
0x277a5276efdc   c7c  1a8f3080       csel w0, w4, w15, lo
0x277a5276efe0   c80  121c600e       and w14, w0, #0x1ffffff0
0x277a5276efe4   c84  0b0e0b0e       add w14, w24, w14, lsl #2
0x277a5276efe8   c88  0b080375       add w21, w27, w8
0x277a5276efec   c8c  6b06027f       cmp w19, w6
0x277a5276eff0   c90  1a95333b       csel w27, w25, w21, lo
0x277a5276eff4   c94  6b06027f       cmp w19, w6
0x277a5276eff8   c98  1a8f3095       csel w21, w4, w15, lo
0x277a5276effc   c9c  121c62b3       and w19, w21, #0x1ffffff0
0x277a5276f000   ca0  0b130b73       add w19, w27, w19, lsl #2
0x277a5276f004   ca4  53047c0a       lsr w10, w0, #4
0x277a5276f008   ca8  12000c00       and w0, w0, #0xf
0x277a5276f00c   cac  53047eab       lsr w11, w21, #4
0x277a5276f010   cb0  12000eb5       and w21, w21, #0xf
0x277a5276f014   cb4  6b0601bf       cmp w13, w6
0x277a5276f018   cb8  540000e3       b.lo #+0x1c (addr 0x277a5276f034)
0x277a5276f01c   cbc  0b080388       add w8, w28, w8
0x277a5276f020   cc0  aa0a03f0       mov x16, x10
0x277a5276f024   cc4  aa0f03ea       mov x10, x15
0x277a5276f028   cc8  aa0b03ef       mov x15, x11
0x277a5276f02c   ccc  aa1003eb       mov x11, x16
0x277a5276f030   cd0  14000011       b #+0x44 (addr 0x277a5276f074)
0x277a5276f034   cd4  aa0b03ef       mov x15, x11
0x277a5276f038   cd8  aa0a03eb       mov x11, x10
0x277a5276f03c   cdc  aa0403ea       mov x10, x4
0x277a5276f040   ce0  aa1903e8       mov x8, x25
0x277a5276f044   ce4  1400000c       b #+0x30 (addr 0x277a5276f074)
0x277a5276f048   ce8  aa0403ea       mov x10, x4
0x277a5276f04c   cec  d2800099       movz x25, #0x4
0x277a5276f050   cf0  aa0403f5       mov x21, x4
0x277a5276f054   cf4  aa0403ef       mov x15, x4
0x277a5276f058   cf8  aa0403e0       mov x0, x4
0x277a5276f05c   cfc  aa0403eb       mov x11, x4
0x277a5276f060   d00  aa1903e8       mov x8, x25
0x277a5276f064   d04  aa1903ee       mov x14, x25
0x277a5276f068   d08  aa1903f3       mov x19, x25
0x277a5276f06c   d0c  aa1903f8       mov x24, x25
0x277a5276f070   d10  aa1903fb       mov cp, x25
0x277a5276f074   d14  2a0902c9       orr w9, w22, w9
0x277a5276f078   d18  6a09013f       tst w9, w9
0x277a5276f07c   d1c  1a8c1329       csel w9, w25, w12, ne
0x277a5276f080   d20  12000eec       and w12, w23, #0xf
0x277a5276f084   d24  53047d56       lsr w22, w10, #4
0x277a5276f088   d28  53047ef9       lsr w25, w23, #4
0x277a5276f08c   d2c  6b1901ff       cmp w15, w25
0x277a5276f090   d30  1a9931ed       csel w13, w15, w25, lo
0x277a5276f094   d34  6b0d017f       cmp w11, w13
0x277a5276f098   d38  1a8d316f       csel w15, w11, w13, lo
0x277a5276f09c   d3c  6b0f02df       cmp w22, w15
0x277a5276f0a0   d40  1a8f32cb       csel w11, w22, w15, lo
0x277a5276f0a4   d44  f9020bee       str x14, [sp, #1040]
0x277a5276f0a8   d48  f90207f3       str x19, [sp, #1032]
0x277a5276f0ac   d4c  f90227e8       str x8, [sp, #1096]
0x277a5276f0b0   d50  f90223ea       str x10, [sp, #1088]
0x277a5276f0b4   d54  f901f3e0       str x0, [sp, #992]
0x277a5276f0b8   d58  f901eff5       str x21, [sp, #984]
0x277a5276f0bc   d5c  f9004bfb       str cp, [sp, #144]
0x277a5276f0c0   d60  f90047f8       str x24, [sp, #136]
0x277a5276f0c4   d64  f9021fe9       str x9, [sp, #1080]
0x277a5276f0c8   d68  f901ebec       str x12, [sp, #976]
0x277a5276f0cc   d6c  3500054b       cbnz w11, #+0xa8 (addr 0x277a5276f174)
0x277a5276f0d0   d70  4ea81d06       mov v6.16b, v8.16b
0x277a5276f0d4   d74  4ea91d27       mov v7.16b, v9.16b
0x277a5276f0d8   d78  4ea11c23       mov v3.16b, v1.16b
0x277a5276f0dc   d7c  4eaa1d41       mov v1.16b, v10.16b
0x277a5276f0e0   d80  4eab1d62       mov v2.16b, v11.16b
0x277a5276f0e4   d84  4ea01c04       mov v4.16b, v0.16b
0x277a5276f0e8   d88  4ebc1f85       mov v5.16b, v28.16b
0x277a5276f0ec   d8c  4ebb1f7c       mov v28.16b, v27.16b
0x277a5276f0f0   d90  4eba1f40       mov v0.16b, v26.16b
0x277a5276f0f4   d94  f94157eb       ldr x11, [sp, #680]
0x277a5276f0f8   d98  f9415bed       ldr x13, [sp, #688]
0x277a5276f0fc   d9c  f94173ee       ldr x14, [sp, #736]
0x277a5276f100   da0  4eb61eda       mov v26.16b, v22.16b
0x277a5276f104   da4  4eb51ebb       mov v27.16b, v21.16b
0x277a5276f108   da8  4eb41e95       mov v21.16b, v20.16b
0x277a5276f10c   dac  4eb31e76       mov v22.16b, v19.16b
0x277a5276f110   db0  4eb21e48       mov v8.16b, v18.16b
0x277a5276f114   db4  4eb11e29       mov v9.16b, v17.16b
0x277a5276f118   db8  f94177f3       ldr x19, [sp, #744]
0x277a5276f11c   dbc  4eae1dd3       mov v19.16b, v14.16b
0x277a5276f120   dc0  f9417bf7       ldr x23, [sp, #752]
0x277a5276f124   dc4  4eac1d8a       mov v10.16b, v12.16b
0x277a5276f128   dc8  3dc03feb       ldr q11, [sp, #240]
0x277a5276f12c   dcc  3dc03bec       ldr q12, [sp, #224]
0x277a5276f130   dd0  3dc037ee       ldr q14, [sp, #208]
0x277a5276f134   dd4  f9417fe0       ldr x0, [sp, #760]
0x277a5276f138   dd8  f94183f5       ldr x21, [sp, #768]
0x277a5276f13c   ddc  f94187ea       ldr x10, [sp, #776]
0x277a5276f140   de0  f94287f9       ldr x25, [sp, #1288]
0x277a5276f144   de4  f941d7f8       ldr x24, [sp, #936]
0x277a5276f148   de8  3dc0e7f4       ldr q20, [sp, #912]
0x277a5276f14c   dec  3dc0e3f2       ldr q18, [sp, #896]
0x277a5276f150   df0  3dc0dff1       ldr q17, [sp, #880]
0x277a5276f154   df4  f941d3ef       ldr x15, [sp, #928]
0x277a5276f158   df8  f941b7e8       ldr x8, [sp, #872]
0x277a5276f15c   dfc  f941b3e9       ldr x9, [sp, #864]
0x277a5276f160   e00  f94197ec       ldr x12, [sp, #808]
0x277a5276f164   e04  f94193e6       ldr x6, [sp, #800]
0x277a5276f168   e08  f9418fe4       ldr x4, [sp, #792]
0x277a5276f16c   e0c  f9418bfc       ldr x28, [sp, #784]
0x277a5276f170   e10  14000115       b #+0x454 (addr 0x277a5276f5c4)
0x277a5276f174   e14  4ea81d06       mov v6.16b, v8.16b
0x277a5276f178   e18  4ea91d27       mov v7.16b, v9.16b
0x277a5276f17c   e1c  4ea11c23       mov v3.16b, v1.16b
0x277a5276f180   e20  4eaa1d41       mov v1.16b, v10.16b
0x277a5276f184   e24  4eab1d62       mov v2.16b, v11.16b
0x277a5276f188   e28  4ea01c04       mov v4.16b, v0.16b
0x277a5276f18c   e2c  4ebc1f85       mov v5.16b, v28.16b
0x277a5276f190   e30  4ebb1f7c       mov v28.16b, v27.16b
0x277a5276f194   e34  4eba1f40       mov v0.16b, v26.16b
0x277a5276f198   e38  f90133eb       str x11, [sp, #608]
0x277a5276f19c   e3c  f94157eb       ldr x11, [sp, #680]
0x277a5276f1a0   e40  f9415bed       ldr x13, [sp, #688]
0x277a5276f1a4   e44  f94173ee       ldr x14, [sp, #736]
0x277a5276f1a8   e48  4eb61eda       mov v26.16b, v22.16b
0x277a5276f1ac   e4c  4eb51ebb       mov v27.16b, v21.16b
0x277a5276f1b0   e50  4eb41e95       mov v21.16b, v20.16b
0x277a5276f1b4   e54  4eb31e76       mov v22.16b, v19.16b
0x277a5276f1b8   e58  3d8057f2       str q18, [sp, #336]
0x277a5276f1bc   e5c  3d8053f1       str q17, [sp, #320]
0x277a5276f1c0   e60  f94177f3       ldr x19, [sp, #744]
0x277a5276f1c4   e64  3d804bee       str q14, [sp, #288]
0x277a5276f1c8   e68  f9417bf7       ldr x23, [sp, #752]
0x277a5276f1cc   e6c  3d8043ec       str q12, [sp, #256]
0x277a5276f1d0   e70  f9417fe0       ldr x0, [sp, #760]
0x277a5276f1d4   e74  f94183f5       ldr x21, [sp, #768]
0x277a5276f1d8   e78  f94187ea       ldr x10, [sp, #776]
0x277a5276f1dc   e7c  f9418bfc       ldr x28, [sp, #784]
0x277a5276f1e0   e80  aa0403f6       mov x22, x4
0x277a5276f1e4   e84  f9418fe4       ldr x4, [sp, #792]
0x277a5276f1e8   e88  f94193e6       ldr x6, [sp, #800]
0x277a5276f1ec   e8c  f94287f9       ldr x25, [sp, #1288]
0x277a5276f1f0   e90  f94197ec       ldr x12, [sp, #808]
0x277a5276f1f4   e94  14000013       b #+0x4c (addr 0x277a5276f240)
0x277a5276f1f8   e98  f94047f8       ldr x24, [sp, #136]
0x277a5276f1fc   e9c  f90133fb       str cp, [sp, #608]
0x277a5276f200   ea0  f9404bfb       ldr cp, [sp, #144]
0x277a5276f204   ea4  f9421fe9       ldr x9, [sp, #1080]
0x277a5276f208   ea8  3d803fe2       str q2, [sp, #240]
0x277a5276f20c   eac  3dc08be2       ldr q2, [sp, #544]
0x277a5276f210   eb0  3d8043e3       str q3, [sp, #256]
0x277a5276f214   eb4  3dc087e3       ldr q3, [sp, #528]
0x277a5276f218   eb8  3d803be4       str q4, [sp, #224]
0x277a5276f21c   ebc  3dc083e4       ldr q4, [sp, #512]
0x277a5276f220   ec0  3d802be5       str q5, [sp, #160]
0x277a5276f224   ec4  3dc07fe5       ldr q5, [sp, #496]
0x277a5276f228   ec8  f94227e8       ldr x8, [sp, #1096]
0x277a5276f22c   ecc  3d802fea       str q10, [sp, #176]
0x277a5276f230   ed0  3d8033e9       str q9, [sp, #192]
0x277a5276f234   ed4  3d8037ec       str q12, [sp, #208]
0x277a5276f238   ed8  3d8057e8       str q8, [sp, #336]
0x277a5276f23c   edc  3d804bf3       str q19, [sp, #288]
0x277a5276f240   ee0  f852034f       ldur x15, [x26, #-224]
0x277a5276f244   ee4  3d804ff0       str q16, [sp, #304]
0x277a5276f248   ee8  3d8047ed       str q13, [sp, #272]
0x277a5276f24c   eec  eb2f63ff       cmp sp, x15
0x277a5276f250   ef0  54007b89       b.ls #+0xf70 (addr 0x277a527701c0)
0x277a5276f254   ef4  0b16030f       add w15, w24, w22
0x277a5276f258   ef8  3cef6b2a       ldr q10, [x25, x15]
0x277a5276f25c   efc  0b160118       add w24, w8, w22
0x277a5276f260   f00  3cf86b29       ldr q9, [x25, x24]
0x277a5276f264   f04  0b160368       add w8, w27, w22
0x277a5276f268   f08  3ce86b28       ldr q8, [x25, x8]
0x277a5276f26c   f0c  3dc0d3eb       ldr q11, [sp, #832]
0x277a5276f270   f10  4ea8d56c       fsub v12.4s, v11.4s, v8.4s
0x277a5276f274   f14  0b16013b       add w27, w9, w22
0x277a5276f278   f18  3cfb6b2d       ldr q13, [x25, x27]
0x277a5276f27c   f1c  3dc0d7ee       ldr q14, [sp, #848]
0x277a5276f280   f20  4eadd5d2       fsub v18.4s, v14.4s, v13.4s
0x277a5276f284   f24  6e32de51       fmul v17.4s, v18.4s, v18.4s
0x277a5276f288   f28  6e2cdd90       fmul v16.4s, v12.4s, v12.4s
0x277a5276f28c   f2c  4e30d630       fadd v16.4s, v17.4s, v16.4s
0x277a5276f290   f30  3dc0dff1       ldr q17, [sp, #880]
0x277a5276f294   f34  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x277a5276f298   f38  3dc0e7f4       ldr q20, [sp, #912]
0x277a5276f29c   f3c  4e341e73       and v19.16b, v19.16b, v20.16b
0x277a5276f2a0   f40  4e21da73       scvtf v19.4s, v19.4s
0x277a5276f2a4   f44  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x277a5276f2a8   f48  4e2cd4e7       fadd v7.4s, v7.4s, v12.4s
0x277a5276f2ac   f4c  3cb46b27       str q7, [x25, x20]
0x277a5276f2b0   f50  6e33de4c       fmul v12.4s, v18.4s, v19.4s
0x277a5276f2b4   f54  4e2cd4c6       fadd v6.4s, v6.4s, v12.4s
0x277a5276f2b8   f58  3cab6b26       str q6, [x25, x11]
0x277a5276f2bc   f5c  6e31e60c       fcmge v12.4s, v16.4s, v17.4s
0x277a5276f2c0   f60  3dc0e3f2       ldr q18, [sp, #896]
0x277a5276f2c4   f64  6eb0e653       fcmgt v19.4s, v18.4s, v16.4s
0x277a5276f2c8   f68  4e331d8c       and v12.16b, v12.16b, v19.16b
0x277a5276f2cc   f6c  4ea0ca10       fcmgt v16.4s, v16.4s, #0.0
0x277a5276f2d0   f70  4e341e10       and v16.16b, v16.16b, v20.16b
0x277a5276f2d4   f74  4e21da10       scvtf v16.4s, v16.4s
0x277a5276f2d8   f78  4e301d8c       and v12.16b, v12.16b, v16.16b
0x277a5276f2dc   f7c  4e25d585       fadd v5.4s, v12.4s, v5.4s
0x277a5276f2e0   f80  3cad6b25       str q5, [x25, x13]
0x277a5276f2e4   f84  6e2cdd29       fmul v9.4s, v9.4s, v12.4s
0x277a5276f2e8   f88  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x277a5276f2ec   f8c  3ca76b24       str q4, [x25, x7]
0x277a5276f2f0   f90  6e2cdd49       fmul v9.4s, v10.4s, v12.4s
0x277a5276f2f4   f94  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x277a5276f2f8   f98  3ca56b23       str q3, [x25, x5]
0x277a5276f2fc   f9c  6e2cdd08       fmul v8.4s, v8.4s, v12.4s
0x277a5276f300   fa0  4e22d502       fadd v2.4s, v8.4s, v2.4s
0x277a5276f304   fa4  3ca36b22       str q2, [x25, x3]
0x277a5276f308   fa8  6e2cdda8       fmul v8.4s, v13.4s, v12.4s
0x277a5276f30c   fac  4e28d421       fadd v1.4s, v1.4s, v8.4s
0x277a5276f310   fb0  3ca26b21       str q1, [x25, x2]
0x277a5276f314   fb4  110041e9       add w9, w15, #0x10 (16)
0x277a5276f318   fb8  3ce96b28       ldr q8, [x25, x9]
0x277a5276f31c   fbc  11004309       add w9, w24, #0x10 (16)
0x277a5276f320   fc0  3ce96b29       ldr q9, [x25, x9]
0x277a5276f324   fc4  11004109       add w9, w8, #0x10 (16)
0x277a5276f328   fc8  3ce96b2a       ldr q10, [x25, x9]
0x277a5276f32c   fcc  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0x277a5276f330   fd0  11004369       add w9, w27, #0x10 (16)
0x277a5276f334   fd4  3ce96b2d       ldr q13, [x25, x9]
0x277a5276f338   fd8  4eadd5d0       fsub v16.4s, v14.4s, v13.4s
0x277a5276f33c   fdc  6e30de13       fmul v19.4s, v16.4s, v16.4s
0x277a5276f340   fe0  3d808be2       str q2, [sp, #544]
0x277a5276f344   fe4  6e2cdd82       fmul v2.4s, v12.4s, v12.4s
0x277a5276f348   fe8  4e22d662       fadd v2.4s, v19.4s, v2.4s
0x277a5276f34c   fec  6ea2e633       fcmgt v19.4s, v17.4s, v2.4s
0x277a5276f350   ff0  4e341e73       and v19.16b, v19.16b, v20.16b
0x277a5276f354   ff4  4e21da73       scvtf v19.4s, v19.4s
0x277a5276f358   ff8  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x277a5276f35c   ffc  4e2cd400       fadd v0.4s, v0.4s, v12.4s
0x277a5276f360  1000  3ca16b20       str q0, [x25, x1]
0x277a5276f364  1004  6e33de0c       fmul v12.4s, v16.4s, v19.4s
0x277a5276f368  1008  4e2cd79c       fadd v28.4s, v28.4s, v12.4s
0x277a5276f36c  100c  3cae6b3c       str q28, [x25, x14]
0x277a5276f370  1010  6e31e44c       fcmge v12.4s, v2.4s, v17.4s
0x277a5276f374  1014  6ea2e650       fcmgt v16.4s, v18.4s, v2.4s
0x277a5276f378  1018  4e301d8c       and v12.16b, v12.16b, v16.16b
0x277a5276f37c  101c  4ea0c842       fcmgt v2.4s, v2.4s, #0.0
0x277a5276f380  1020  4e341c42       and v2.16b, v2.16b, v20.16b
0x277a5276f384  1024  4e21d842       scvtf v2.4s, v2.4s
0x277a5276f388  1028  4e221d82       and v2.16b, v12.16b, v2.16b
0x277a5276f38c  102c  4e3bd45b       fadd v27.4s, v2.4s, v27.4s
0x277a5276f390  1030  3cb36b3b       str q27, [x25, x19]
0x277a5276f394  1034  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x277a5276f398  1038  4e3ad53a       fadd v26.4s, v9.4s, v26.4s
0x277a5276f39c  103c  3cb76b3a       str q26, [x25, x23]
0x277a5276f3a0  1040  6e22dd08       fmul v8.4s, v8.4s, v2.4s
0x277a5276f3a4  1044  4e37d517       fadd v23.4s, v8.4s, v23.4s
0x277a5276f3a8  1048  3ca06b37       str q23, [x25, x0]
0x277a5276f3ac  104c  6e22dd48       fmul v8.4s, v10.4s, v2.4s
0x277a5276f3b0  1050  4e38d518       fadd v24.4s, v8.4s, v24.4s
0x277a5276f3b4  1054  3cb56b38       str q24, [x25, x21]
0x277a5276f3b8  1058  6e22dda2       fmul v2.4s, v13.4s, v2.4s
0x277a5276f3bc  105c  4e22d739       fadd v25.4s, v25.4s, v2.4s
0x277a5276f3c0  1060  3caa6b39       str q25, [x25, x10]
0x277a5276f3c4  1064  110081e9       add w9, w15, #0x20 (32)
0x277a5276f3c8  1068  3ce96b22       ldr q2, [x25, x9]
0x277a5276f3cc  106c  11008309       add w9, w24, #0x20 (32)
0x277a5276f3d0  1070  3ce96b28       ldr q8, [x25, x9]
0x277a5276f3d4  1074  11008109       add w9, w8, #0x20 (32)
0x277a5276f3d8  1078  3ce96b29       ldr q9, [x25, x9]
0x277a5276f3dc  107c  4ea9d56a       fsub v10.4s, v11.4s, v9.4s
0x277a5276f3e0  1080  11008369       add w9, w27, #0x20 (32)
0x277a5276f3e4  1084  3ce96b2c       ldr q12, [x25, x9]
0x277a5276f3e8  1088  4eacd5cd       fsub v13.4s, v14.4s, v12.4s
0x277a5276f3ec  108c  6e2dddb0       fmul v16.4s, v13.4s, v13.4s
0x277a5276f3f0  1090  6e2add53       fmul v19.4s, v10.4s, v10.4s
0x277a5276f3f4  1094  4e33d610       fadd v16.4s, v16.4s, v19.4s
0x277a5276f3f8  1098  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x277a5276f3fc  109c  4e341e73       and v19.16b, v19.16b, v20.16b
0x277a5276f400  10a0  4e21da73       scvtf v19.4s, v19.4s
0x277a5276f404  10a4  6e33dd4a       fmul v10.4s, v10.4s, v19.4s
0x277a5276f408  10a8  4e2ad6d6       fadd v22.4s, v22.4s, v10.4s
0x277a5276f40c  10ac  3cbc6b36       str q22, [x25, x28]
0x277a5276f410  10b0  6e33ddaa       fmul v10.4s, v13.4s, v19.4s
0x277a5276f414  10b4  4e2ad6b5       fadd v21.4s, v21.4s, v10.4s
0x277a5276f418  10b8  3ca46b35       str q21, [x25, x4]
0x277a5276f41c  10bc  6e31e60a       fcmge v10.4s, v16.4s, v17.4s
0x277a5276f420  10c0  6eb0e64d       fcmgt v13.4s, v18.4s, v16.4s
0x277a5276f424  10c4  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x277a5276f428  10c8  4ea0ca0d       fcmgt v13.4s, v16.4s, #0.0
0x277a5276f42c  10cc  4e341dad       and v13.16b, v13.16b, v20.16b
0x277a5276f430  10d0  4e21d9ad       scvtf v13.4s, v13.4s
0x277a5276f434  10d4  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x277a5276f438  10d8  3dc047ed       ldr q13, [sp, #272]
0x277a5276f43c  10dc  4e2dd54d       fadd v13.4s, v10.4s, v13.4s
0x277a5276f440  10e0  3ca66b2d       str q13, [x25, x6]
0x277a5276f444  10e4  6e2add08       fmul v8.4s, v8.4s, v10.4s
0x277a5276f448  10e8  3dc04bf3       ldr q19, [sp, #288]
0x277a5276f44c  10ec  4e33d513       fadd v19.4s, v8.4s, v19.4s
0x277a5276f450  10f0  3cac6b33       str q19, [x25, x12]
0x277a5276f454  10f4  6e2adc42       fmul v2.4s, v2.4s, v10.4s
0x277a5276f458  10f8  3dc04ff0       ldr q16, [sp, #304]
0x277a5276f45c  10fc  4e30d450       fadd v16.4s, v2.4s, v16.4s
0x277a5276f460  1100  f9419be9       ldr x9, [sp, #816]
0x277a5276f464  1104  3ca96b30       str q16, [x25, x9]
0x277a5276f468  1108  6e2add22       fmul v2.4s, v9.4s, v10.4s
0x277a5276f46c  110c  3dc053e8       ldr q8, [sp, #320]
0x277a5276f470  1110  4e28d442       fadd v2.4s, v2.4s, v8.4s
0x277a5276f474  1114  f9419fe9       ldr x9, [sp, #824]
0x277a5276f478  1118  3ca96b22       str q2, [x25, x9]
0x277a5276f47c  111c  6e2add88       fmul v8.4s, v12.4s, v10.4s
0x277a5276f480  1120  3dc057e9       ldr q9, [sp, #336]
0x277a5276f484  1124  4e28d528       fadd v8.4s, v9.4s, v8.4s
0x277a5276f488  1128  f941b3e9       ldr x9, [sp, #864]
0x277a5276f48c  112c  3ca96b28       str q8, [x25, x9]
0x277a5276f490  1130  1100c1ef       add w15, w15, #0x30 (48)
0x277a5276f494  1134  3cef6b29       ldr q9, [x25, x15]
0x277a5276f498  1138  1100c30f       add w15, w24, #0x30 (48)
0x277a5276f49c  113c  3cef6b2a       ldr q10, [x25, x15]
0x277a5276f4a0  1140  1100c108       add w8, w8, #0x30 (48)
0x277a5276f4a4  1144  3ce86b2c       ldr q12, [x25, x8]
0x277a5276f4a8  1148  3d8053e2       str q2, [sp, #320]
0x277a5276f4ac  114c  4eacd562       fsub v2.4s, v11.4s, v12.4s
0x277a5276f4b0  1150  1100c368       add w8, w27, #0x30 (48)
0x277a5276f4b4  1154  3ce86b2b       ldr q11, [x25, x8]
0x277a5276f4b8  1158  3d8087e3       str q3, [sp, #528]
0x277a5276f4bc  115c  4eabd5c3       fsub v3.4s, v14.4s, v11.4s
0x277a5276f4c0  1160  6e23dc6e       fmul v14.4s, v3.4s, v3.4s
0x277a5276f4c4  1164  3d8083e4       str q4, [sp, #512]
0x277a5276f4c8  1168  6e22dc44       fmul v4.4s, v2.4s, v2.4s
0x277a5276f4cc  116c  4e24d5c4       fadd v4.4s, v14.4s, v4.4s
0x277a5276f4d0  1170  6ea4e62e       fcmgt v14.4s, v17.4s, v4.4s
0x277a5276f4d4  1174  4e341dce       and v14.16b, v14.16b, v20.16b
0x277a5276f4d8  1178  4e21d9ce       scvtf v14.4s, v14.4s
0x277a5276f4dc  117c  6e2edc42       fmul v2.4s, v2.4s, v14.4s
0x277a5276f4e0  1180  3d807fe5       str q5, [sp, #496]
0x277a5276f4e4  1184  3dc03fe5       ldr q5, [sp, #240]
0x277a5276f4e8  1188  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x277a5276f4ec  118c  f941b7e8       ldr x8, [sp, #872]
0x277a5276f4f0  1190  3ca86b22       str q2, [x25, x8]
0x277a5276f4f4  1194  6e2edc63       fmul v3.4s, v3.4s, v14.4s
0x277a5276f4f8  1198  3dc043e5       ldr q5, [sp, #256]
0x277a5276f4fc  119c  4e23d4a3       fadd v3.4s, v5.4s, v3.4s
0x277a5276f500  11a0  f941d3ef       ldr x15, [sp, #928]
0x277a5276f504  11a4  3caf6b23       str q3, [x25, x15]
0x277a5276f508  11a8  6e31e485       fcmge v5.4s, v4.4s, v17.4s
0x277a5276f50c  11ac  6ea4e64e       fcmgt v14.4s, v18.4s, v4.4s
0x277a5276f510  11b0  4e2e1ca5       and v5.16b, v5.16b, v14.16b
0x277a5276f514  11b4  4ea0c884       fcmgt v4.4s, v4.4s, #0.0
0x277a5276f518  11b8  4e341c84       and v4.16b, v4.16b, v20.16b
0x277a5276f51c  11bc  4e21d884       scvtf v4.4s, v4.4s
0x277a5276f520  11c0  4e241ca4       and v4.16b, v5.16b, v4.16b
0x277a5276f524  11c4  3dc02be5       ldr q5, [sp, #160]
0x277a5276f528  11c8  4e25d485       fadd v5.4s, v4.4s, v5.4s
0x277a5276f52c  11cc  f941d7f8       ldr x24, [sp, #936]
0x277a5276f530  11d0  3cb86b25       str q5, [x25, x24]
0x277a5276f534  11d4  6e24dd4a       fmul v10.4s, v10.4s, v4.4s
0x277a5276f538  11d8  3dc02fee       ldr q14, [sp, #176]
0x277a5276f53c  11dc  4e2ed54a       fadd v10.4s, v10.4s, v14.4s
0x277a5276f540  11e0  f941dbfb       ldr cp, [sp, #944]
0x277a5276f544  11e4  3cbb6b2a       str q10, [x25, x27]
0x277a5276f548  11e8  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x277a5276f54c  11ec  3dc033ee       ldr q14, [sp, #192]
0x277a5276f550  11f0  4e2ed529       fadd v9.4s, v9.4s, v14.4s
0x277a5276f554  11f4  f941dffb       ldr cp, [sp, #952]
0x277a5276f558  11f8  3cbb6b29       str q9, [x25, x27]
0x277a5276f55c  11fc  6e24dd8c       fmul v12.4s, v12.4s, v4.4s
0x277a5276f560  1200  3dc037ee       ldr q14, [sp, #208]
0x277a5276f564  1204  4e2ed58c       fadd v12.4s, v12.4s, v14.4s
0x277a5276f568  1208  f941e3fb       ldr cp, [sp, #960]
0x277a5276f56c  120c  3cbb6b2c       str q12, [x25, x27]
0x277a5276f570  1210  6e24dd64       fmul v4.4s, v11.4s, v4.4s
0x277a5276f574  1214  3dc03beb       ldr q11, [sp, #224]
0x277a5276f578  1218  4e24d564       fadd v4.4s, v11.4s, v4.4s
0x277a5276f57c  121c  f941e7fb       ldr cp, [sp, #968]
0x277a5276f580  1220  3cbb6b24       str q4, [x25, x27]
0x277a5276f584  1224  110102d6       add w22, w22, #0x40 (64)
0x277a5276f588  1228  f94133fb       ldr cp, [sp, #608]
0x277a5276f58c  122c  5100077b       sub w27, w27, #0x1 (1)
0x277a5276f590  1230  35ffe35b       cbnz w27, #-0x398 (addr 0x277a5276f1f8)
0x277a5276f594  1234  3d802be5       str q5, [sp, #160]
0x277a5276f598  1238  3d802fea       str q10, [sp, #176]
0x277a5276f59c  123c  3d8033e9       str q9, [sp, #192]
0x277a5276f5a0  1240  4ea21c4b       mov v11.16b, v2.16b
0x277a5276f5a4  1244  3dc08be2       ldr q2, [sp, #544]
0x277a5276f5a8  1248  4ea31c6a       mov v10.16b, v3.16b
0x277a5276f5ac  124c  3dc087e3       ldr q3, [sp, #528]
0x277a5276f5b0  1250  4eac1d8e       mov v14.16b, v12.16b
0x277a5276f5b4  1254  4ea41c8c       mov v12.16b, v4.16b
0x277a5276f5b8  1258  3dc083e4       ldr q4, [sp, #512]
0x277a5276f5bc  125c  3dc07fe5       ldr q5, [sp, #496]
0x277a5276f5c0  1260  3dc053e9       ldr q9, [sp, #320]
0x277a5276f5c4  1264  3d8097e6       str q6, [sp, #592]
0x277a5276f5c8  1268  3d8093e7       str q7, [sp, #576]
0x277a5276f5cc  126c  3d808be2       str q2, [sp, #544]
0x277a5276f5d0  1270  3d8087e3       str q3, [sp, #528]
0x277a5276f5d4  1274  3d8083e4       str q4, [sp, #512]
0x277a5276f5d8  1278  3d807fe5       str q5, [sp, #496]
0x277a5276f5dc  127c  3d8073f9       str q25, [sp, #448]
0x277a5276f5e0  1280  3d806ff8       str q24, [sp, #432]
0x277a5276f5e4  1284  3d805ff5       str q21, [sp, #368]
0x277a5276f5e8  1288  3d805bf6       str q22, [sp, #352]
0x277a5276f5ec  128c  3d8057e8       str q8, [sp, #336]
0x277a5276f5f0  1290  3d8053e9       str q9, [sp, #320]
0x277a5276f5f4  1294  3d804ff0       str q16, [sp, #304]
0x277a5276f5f8  1298  3d804bf3       str q19, [sp, #288]
0x277a5276f5fc  129c  3d8047ed       str q13, [sp, #272]
0x277a5276f600  12a0  3d8043ea       str q10, [sp, #256]
0x277a5276f604  12a4  3d803feb       str q11, [sp, #240]
0x277a5276f608  12a8  3d803bec       str q12, [sp, #224]
0x277a5276f60c  12ac  3d8037ee       str q14, [sp, #208]
0x277a5276f610  12b0  f941ebf6       ldr x22, [sp, #976]
0x277a5276f614  12b4  34002976       cbz w22, #+0x52c (addr 0x277a5276fb40)
0x277a5276f618  12b8  f9414bfb       ldr cp, [sp, #656]
0x277a5276f61c  12bc  51004378       sub w24, w27, #0x10 (16)
0x277a5276f620  12c0  d280000f       movz x15, #0x0
0x277a5276f624  12c4  6b18037f       cmp w27, w24
0x277a5276f628  12c8  1a9831e8       csel w8, w15, w24, lo
0x277a5276f62c  12cc  11004118       add w24, w8, #0x10 (16)
0x277a5276f630  12d0  f94137ef       ldr x15, [sp, #616]
0x277a5276f634  12d4  6b1801ff       cmp w15, w24
0x277a5276f638  12d8  54002843       b.lo #+0x508 (addr 0x277a5276fb40)
0x277a5276f63c  12dc  f9413bef       ldr x15, [sp, #624]
0x277a5276f640  12e0  6b1801ff       cmp w15, w24
0x277a5276f644  12e4  540027c3       b.lo #+0x4f8 (addr 0x277a5276fb3c)
0x277a5276f648  12e8  531e7518       lsl w24, w8, #2
0x277a5276f64c  12ec  f9413fef       ldr x15, [sp, #632]
0x277a5276f650  12f0  0b1801e9       add w9, w15, w24
0x277a5276f654  12f4  3ce96b2c       ldr q12, [x25, x9]
0x277a5276f658  12f8  f94143ef       ldr x15, [sp, #640]
0x277a5276f65c  12fc  0b1801ec       add w12, w15, w24
0x277a5276f660  1300  3cec6b2e       ldr q14, [x25, x12]
0x277a5276f664  1304  f94147ef       ldr x15, [sp, #648]
0x277a5276f668  1308  0b1801e6       add w6, w15, w24
0x277a5276f66c  130c  3ce66b2a       ldr q10, [x25, x6]
0x277a5276f670  1310  3dc0d3eb       ldr q11, [sp, #832]
0x277a5276f674  1314  4eaad568       fsub v8.4s, v11.4s, v10.4s
0x277a5276f678  1318  0b160116       add w22, w8, w22
0x277a5276f67c  131c  4b160376       sub w22, w27, w22
0x277a5276f680  1320  4e040ec9       dup v9.4s, w22
0x277a5276f684  1324  d2800030       movz x16, #0x1
0x277a5276f688  1328  f2c00050       movk x16, #0x2, lsl #32
0x277a5276f68c  132c  9e670210       fmov d16, x16
0x277a5276f690  1330  d2800070       movz x16, #0x3
0x277a5276f694  1334  f2c00090       movk x16, #0x4, lsl #32
0x277a5276f698  1338  4e181e10       mov v16.d[1], x16
0x277a5276f69c  133c  6ea93610       cmhi v16.4s, v16.4s, v9.4s
0x277a5276f6a0  1340  4b080368       sub w8, w27, w8
0x277a5276f6a4  1344  4e040d13       dup v19.4s, w8
0x277a5276f6a8  1348  d2c00030       movz x16, #0x100000000
0x277a5276f6ac  134c  9e67020d       fmov d13, x16
0x277a5276f6b0  1350  d2800050       movz x16, #0x2
0x277a5276f6b4  1354  f2c00070       movk x16, #0x3, lsl #32
0x277a5276f6b8  1358  4e181e0d       mov v13.d[1], x16
0x277a5276f6bc  135c  6ead366d       cmhi v13.4s, v19.4s, v13.4s
0x277a5276f6c0  1360  4e2d1e0d       and v13.16b, v16.16b, v13.16b
0x277a5276f6c4  1364  f9414fe8       ldr x8, [sp, #664]
0x277a5276f6c8  1368  0b180116       add w22, w8, w24
0x277a5276f6cc  136c  3cf66b30       ldr q16, [x25, x22]
0x277a5276f6d0  1370  3dc0d7f5       ldr q21, [sp, #848]
0x277a5276f6d4  1374  4eb0d6b6       fsub v22.4s, v21.4s, v16.4s
0x277a5276f6d8  1378  6e36ded9       fmul v25.4s, v22.4s, v22.4s
0x277a5276f6dc  137c  6e28dd18       fmul v24.4s, v8.4s, v8.4s
0x277a5276f6e0  1380  4e38d738       fadd v24.4s, v25.4s, v24.4s
0x277a5276f6e4  1384  6eb8e639       fcmgt v25.4s, v17.4s, v24.4s
0x277a5276f6e8  1388  4e341f39       and v25.16b, v25.16b, v20.16b
0x277a5276f6ec  138c  4e21db39       scvtf v25.4s, v25.4s
0x277a5276f6f0  1390  4e391db9       and v25.16b, v13.16b, v25.16b
0x277a5276f6f4  1394  6e39dd08       fmul v8.4s, v8.4s, v25.4s
0x277a5276f6f8  1398  4e27d507       fadd v7.4s, v8.4s, v7.4s
0x277a5276f6fc  139c  3cb46b27       str q7, [x25, x20]
0x277a5276f700  13a0  6e39dec8       fmul v8.4s, v22.4s, v25.4s
0x277a5276f704  13a4  4e26d506       fadd v6.4s, v8.4s, v6.4s
0x277a5276f708  13a8  3cab6b26       str q6, [x25, x11]
0x277a5276f70c  13ac  6e31e708       fcmge v8.4s, v24.4s, v17.4s
0x277a5276f710  13b0  6eb8e656       fcmgt v22.4s, v18.4s, v24.4s
0x277a5276f714  13b4  4e361d08       and v8.16b, v8.16b, v22.16b
0x277a5276f718  13b8  4e281da8       and v8.16b, v13.16b, v8.16b
0x277a5276f71c  13bc  4f3f5508       shl v8.4s, v8.4s, #31
0x277a5276f720  13c0  4f210508       sshr v8.4s, v8.4s, #31
0x277a5276f724  13c4  4ea0cb0d       fcmgt v13.4s, v24.4s, #0.0
0x277a5276f728  13c8  4e341dad       and v13.16b, v13.16b, v20.16b
0x277a5276f72c  13cc  4e21d9ad       scvtf v13.4s, v13.4s
0x277a5276f730  13d0  4e2d1d08       and v8.16b, v8.16b, v13.16b
0x277a5276f734  13d4  4e25d505       fadd v5.4s, v8.4s, v5.4s
0x277a5276f738  13d8  3cad6b25       str q5, [x25, x13]
0x277a5276f73c  13dc  6e28ddcd       fmul v13.4s, v14.4s, v8.4s
0x277a5276f740  13e0  4e24d5a4       fadd v4.4s, v13.4s, v4.4s
0x277a5276f744  13e4  3ca76b24       str q4, [x25, x7]
0x277a5276f748  13e8  6e28dd8c       fmul v12.4s, v12.4s, v8.4s
0x277a5276f74c  13ec  4e23d583       fadd v3.4s, v12.4s, v3.4s
0x277a5276f750  13f0  3ca56b23       str q3, [x25, x5]
0x277a5276f754  13f4  6e28dd4a       fmul v10.4s, v10.4s, v8.4s
0x277a5276f758  13f8  4e22d542       fadd v2.4s, v10.4s, v2.4s
0x277a5276f75c  13fc  3ca36b22       str q2, [x25, x3]
0x277a5276f760  1400  6e28de08       fmul v8.4s, v16.4s, v8.4s
0x277a5276f764  1404  4e21d508       fadd v8.4s, v8.4s, v1.4s
0x277a5276f768  1408  3ca26b28       str q8, [x25, x2]
0x277a5276f76c  140c  91004138       add x24, x9, #0x10 (16)
0x277a5276f770  1410  3cf86b2a       ldr q10, [x25, x24]
0x277a5276f774  1414  91004198       add x24, x12, #0x10 (16)
0x277a5276f778  1418  3cf86b2c       ldr q12, [x25, x24]
0x277a5276f77c  141c  910040d8       add x24, x6, #0x10 (16)
0x277a5276f780  1420  3cf86b2d       ldr q13, [x25, x24]
0x277a5276f784  1424  4eadd56e       fsub v14.4s, v11.4s, v13.4s
0x277a5276f788  1428  d28000b0       movz x16, #0x5
0x277a5276f78c  142c  f2c000d0       movk x16, #0x6, lsl #32
0x277a5276f790  1430  9e670210       fmov d16, x16
0x277a5276f794  1434  d28000f0       movz x16, #0x7
0x277a5276f798  1438  f2c00110       movk x16, #0x8, lsl #32
0x277a5276f79c  143c  4e181e10       mov v16.d[1], x16
0x277a5276f7a0  1440  6ea93610       cmhi v16.4s, v16.4s, v9.4s
0x277a5276f7a4  1444  d2800090       movz x16, #0x4
0x277a5276f7a8  1448  f2c000b0       movk x16, #0x5, lsl #32
0x277a5276f7ac  144c  9e670216       fmov d22, x16
0x277a5276f7b0  1450  d28000d0       movz x16, #0x6
0x277a5276f7b4  1454  f2c000f0       movk x16, #0x7, lsl #32
0x277a5276f7b8  1458  4e181e16       mov v22.d[1], x16
0x277a5276f7bc  145c  6eb63676       cmhi v22.4s, v19.4s, v22.4s
0x277a5276f7c0  1460  4e361e10       and v16.16b, v16.16b, v22.16b
0x277a5276f7c4  1464  910042d8       add x24, x22, #0x10 (16)
0x277a5276f7c8  1468  3cf86b36       ldr q22, [x25, x24]
0x277a5276f7cc  146c  4eb6d6b8       fsub v24.4s, v21.4s, v22.4s
0x277a5276f7d0  1470  6e38df19       fmul v25.4s, v24.4s, v24.4s
0x277a5276f7d4  1474  6e2eddc1       fmul v1.4s, v14.4s, v14.4s
0x277a5276f7d8  1478  4e21d739       fadd v25.4s, v25.4s, v1.4s
0x277a5276f7dc  147c  6eb9e621       fcmgt v1.4s, v17.4s, v25.4s
0x277a5276f7e0  1480  4e341c21       and v1.16b, v1.16b, v20.16b
0x277a5276f7e4  1484  4e21d821       scvtf v1.4s, v1.4s
0x277a5276f7e8  1488  4e211e01       and v1.16b, v16.16b, v1.16b
0x277a5276f7ec  148c  6e21ddce       fmul v14.4s, v14.4s, v1.4s
0x277a5276f7f0  1490  4e20d5ce       fadd v14.4s, v14.4s, v0.4s
0x277a5276f7f4  1494  3ca16b2e       str q14, [x25, x1]
0x277a5276f7f8  1498  6e21df18       fmul v24.4s, v24.4s, v1.4s
0x277a5276f7fc  149c  4e3cd718       fadd v24.4s, v24.4s, v28.4s
0x277a5276f800  14a0  3cae6b38       str q24, [x25, x14]
0x277a5276f804  14a4  6e31e73c       fcmge v28.4s, v25.4s, v17.4s
0x277a5276f808  14a8  6eb9e640       fcmgt v0.4s, v18.4s, v25.4s
0x277a5276f80c  14ac  4e201f9c       and v28.16b, v28.16b, v0.16b
0x277a5276f810  14b0  4e3c1e10       and v16.16b, v16.16b, v28.16b
0x277a5276f814  14b4  4f3f5610       shl v16.4s, v16.4s, #31
0x277a5276f818  14b8  4f210610       sshr v16.4s, v16.4s, #31
0x277a5276f81c  14bc  4ea0cb39       fcmgt v25.4s, v25.4s, #0.0
0x277a5276f820  14c0  4e341f39       and v25.16b, v25.16b, v20.16b
0x277a5276f824  14c4  4e21db39       scvtf v25.4s, v25.4s
0x277a5276f828  14c8  4e391e10       and v16.16b, v16.16b, v25.16b
0x277a5276f82c  14cc  4e3bd619       fadd v25.4s, v16.4s, v27.4s
0x277a5276f830  14d0  3cb36b39       str q25, [x25, x19]
0x277a5276f834  14d4  6e30dd8c       fmul v12.4s, v12.4s, v16.4s
0x277a5276f838  14d8  4e3ad58c       fadd v12.4s, v12.4s, v26.4s
0x277a5276f83c  14dc  3cb76b2c       str q12, [x25, x23]
0x277a5276f840  14e0  6e30dd4a       fmul v10.4s, v10.4s, v16.4s
0x277a5276f844  14e4  4e37d557       fadd v23.4s, v10.4s, v23.4s
0x277a5276f848  14e8  3ca06b37       str q23, [x25, x0]
0x277a5276f84c  14ec  6e30ddaa       fmul v10.4s, v13.4s, v16.4s
0x277a5276f850  14f0  3dc06fed       ldr q13, [sp, #432]
0x277a5276f854  14f4  4e2dd54a       fadd v10.4s, v10.4s, v13.4s
0x277a5276f858  14f8  3cb56b2a       str q10, [x25, x21]
0x277a5276f85c  14fc  6e30decd       fmul v13.4s, v22.4s, v16.4s
0x277a5276f860  1500  3dc073f0       ldr q16, [sp, #448]
0x277a5276f864  1504  4e30d5ad       fadd v13.4s, v13.4s, v16.4s
0x277a5276f868  1508  3caa6b2d       str q13, [x25, x10]
0x277a5276f86c  150c  91008138       add x24, x9, #0x20 (32)
0x277a5276f870  1510  3cf86b30       ldr q16, [x25, x24]
0x277a5276f874  1514  91008198       add x24, x12, #0x20 (32)
0x277a5276f878  1518  3cf86b36       ldr q22, [x25, x24]
0x277a5276f87c  151c  910080d8       add x24, x6, #0x20 (32)
0x277a5276f880  1520  3cf86b3a       ldr q26, [x25, x24]
0x277a5276f884  1524  4ebad57b       fsub v27.4s, v11.4s, v26.4s
0x277a5276f888  1528  d2800130       movz x16, #0x9
0x277a5276f88c  152c  f2c00150       movk x16, #0xa, lsl #32
0x277a5276f890  1530  9e67021c       fmov d28, x16
0x277a5276f894  1534  d2800170       movz x16, #0xb
0x277a5276f898  1538  f2c00190       movk x16, #0xc, lsl #32
0x277a5276f89c  153c  4e181e1c       mov v28.d[1], x16
0x277a5276f8a0  1540  6ea9379c       cmhi v28.4s, v28.4s, v9.4s
0x277a5276f8a4  1544  d2800110       movz x16, #0x8
0x277a5276f8a8  1548  f2c00130       movk x16, #0x9, lsl #32
0x277a5276f8ac  154c  9e670200       fmov d0, x16
0x277a5276f8b0  1550  d2800150       movz x16, #0xa
0x277a5276f8b4  1554  f2c00170       movk x16, #0xb, lsl #32
0x277a5276f8b8  1558  4e181e00       mov v0.d[1], x16
0x277a5276f8bc  155c  6ea03660       cmhi v0.4s, v19.4s, v0.4s
0x277a5276f8c0  1560  4e201f9c       and v28.16b, v28.16b, v0.16b
0x277a5276f8c4  1564  910082d8       add x24, x22, #0x20 (32)
0x277a5276f8c8  1568  3cf86b20       ldr q0, [x25, x24]
0x277a5276f8cc  156c  4ea0d6a1       fsub v1.4s, v21.4s, v0.4s
0x277a5276f8d0  1570  3d808be2       str q2, [sp, #544]
0x277a5276f8d4  1574  6e21dc22       fmul v2.4s, v1.4s, v1.4s
0x277a5276f8d8  1578  3d8087e3       str q3, [sp, #528]
0x277a5276f8dc  157c  6e3bdf63       fmul v3.4s, v27.4s, v27.4s
0x277a5276f8e0  1580  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x277a5276f8e4  1584  6ea2e623       fcmgt v3.4s, v17.4s, v2.4s
0x277a5276f8e8  1588  4e341c63       and v3.16b, v3.16b, v20.16b
0x277a5276f8ec  158c  4e21d863       scvtf v3.4s, v3.4s
0x277a5276f8f0  1590  4e231f83       and v3.16b, v28.16b, v3.16b
0x277a5276f8f4  1594  6e23df7b       fmul v27.4s, v27.4s, v3.4s
0x277a5276f8f8  1598  3d8083e4       str q4, [sp, #512]
0x277a5276f8fc  159c  3dc05be4       ldr q4, [sp, #352]
0x277a5276f900  15a0  4e24d764       fadd v4.4s, v27.4s, v4.4s
0x277a5276f904  15a4  3cbc6b24       str q4, [x25, x28]
0x277a5276f908  15a8  6e23dc23       fmul v3.4s, v1.4s, v3.4s
0x277a5276f90c  15ac  3dc05ffb       ldr q27, [sp, #368]
0x277a5276f910  15b0  4e3bd463       fadd v3.4s, v3.4s, v27.4s
0x277a5276f914  15b4  3ca46b23       str q3, [x25, x4]
0x277a5276f918  15b8  6e31e45b       fcmge v27.4s, v2.4s, v17.4s
0x277a5276f91c  15bc  6ea2e641       fcmgt v1.4s, v18.4s, v2.4s
0x277a5276f920  15c0  4e211f7b       and v27.16b, v27.16b, v1.16b
0x277a5276f924  15c4  4e3b1f9b       and v27.16b, v28.16b, v27.16b
0x277a5276f928  15c8  4f3f577b       shl v27.4s, v27.4s, #31
0x277a5276f92c  15cc  4f21077b       sshr v27.4s, v27.4s, #31
0x277a5276f930  15d0  4ea0c842       fcmgt v2.4s, v2.4s, #0.0
0x277a5276f934  15d4  4e341c42       and v2.16b, v2.16b, v20.16b
0x277a5276f938  15d8  4e21d842       scvtf v2.4s, v2.4s
0x277a5276f93c  15dc  4e221f62       and v2.16b, v27.16b, v2.16b
0x277a5276f940  15e0  3dc047fb       ldr q27, [sp, #272]
0x277a5276f944  15e4  4e3bd45b       fadd v27.4s, v2.4s, v27.4s
0x277a5276f948  15e8  f94193f8       ldr x24, [sp, #800]
0x277a5276f94c  15ec  3cb86b3b       str q27, [x25, x24]
0x277a5276f950  15f0  6e22ded6       fmul v22.4s, v22.4s, v2.4s
0x277a5276f954  15f4  3dc04bfc       ldr q28, [sp, #288]
0x277a5276f958  15f8  4e3cd6d6       fadd v22.4s, v22.4s, v28.4s
0x277a5276f95c  15fc  f94197fb       ldr cp, [sp, #808]
0x277a5276f960  1600  3cbb6b36       str q22, [x25, x27]
0x277a5276f964  1604  6e22de10       fmul v16.4s, v16.4s, v2.4s
0x277a5276f968  1608  3dc04ffc       ldr q28, [sp, #304]
0x277a5276f96c  160c  4e3cd610       fadd v16.4s, v16.4s, v28.4s
0x277a5276f970  1610  f9419be8       ldr x8, [sp, #816]
0x277a5276f974  1614  3ca86b30       str q16, [x25, x8]
0x277a5276f978  1618  6e22df5a       fmul v26.4s, v26.4s, v2.4s
0x277a5276f97c  161c  3dc053fc       ldr q28, [sp, #320]
0x277a5276f980  1620  4e3cd75a       fadd v26.4s, v26.4s, v28.4s
0x277a5276f984  1624  f9419fe8       ldr x8, [sp, #824]
0x277a5276f988  1628  3ca86b3a       str q26, [x25, x8]
0x277a5276f98c  162c  6e22dc02       fmul v2.4s, v0.4s, v2.4s
0x277a5276f990  1630  3dc057fc       ldr q28, [sp, #336]
0x277a5276f994  1634  4e3cd442       fadd v2.4s, v2.4s, v28.4s
0x277a5276f998  1638  f941b3e8       ldr x8, [sp, #864]
0x277a5276f99c  163c  3ca86b22       str q2, [x25, x8]
0x277a5276f9a0  1640  9100c129       add x9, x9, #0x30 (48)
0x277a5276f9a4  1644  3ce96b3c       ldr q28, [x25, x9]
0x277a5276f9a8  1648  9100c189       add x9, x12, #0x30 (48)
0x277a5276f9ac  164c  3ce96b20       ldr q0, [x25, x9]
0x277a5276f9b0  1650  9100c0c6       add x6, x6, #0x30 (48)
0x277a5276f9b4  1654  3ce66b21       ldr q1, [x25, x6]
0x277a5276f9b8  1658  3d8057e2       str q2, [sp, #336]
0x277a5276f9bc  165c  4ea1d562       fsub v2.4s, v11.4s, v1.4s
0x277a5276f9c0  1660  d28001b0       movz x16, #0xd
0x277a5276f9c4  1664  f2c001d0       movk x16, #0xe, lsl #32
0x277a5276f9c8  1668  9e67020b       fmov d11, x16
0x277a5276f9cc  166c  d28001f0       movz x16, #0xf
0x277a5276f9d0  1670  f2c00210       movk x16, #0x10, lsl #32
0x277a5276f9d4  1674  4e181e0b       mov v11.d[1], x16
0x277a5276f9d8  1678  6ea93569       cmhi v9.4s, v11.4s, v9.4s
0x277a5276f9dc  167c  d2800190       movz x16, #0xc
0x277a5276f9e0  1680  f2c001b0       movk x16, #0xd, lsl #32
0x277a5276f9e4  1684  9e67020b       fmov d11, x16
0x277a5276f9e8  1688  d28001d0       movz x16, #0xe
0x277a5276f9ec  168c  f2c001f0       movk x16, #0xf, lsl #32
0x277a5276f9f0  1690  4e181e0b       mov v11.d[1], x16
0x277a5276f9f4  1694  6eab366b       cmhi v11.4s, v19.4s, v11.4s
0x277a5276f9f8  1698  4e2b1d29       and v9.16b, v9.16b, v11.16b
0x277a5276f9fc  169c  9100c2c6       add x6, x22, #0x30 (48)
0x277a5276fa00  16a0  3ce66b2b       ldr q11, [x25, x6]
0x277a5276fa04  16a4  4eabd6b3       fsub v19.4s, v21.4s, v11.4s
0x277a5276fa08  16a8  6e33de75       fmul v21.4s, v19.4s, v19.4s
0x277a5276fa0c  16ac  3d805fe3       str q3, [sp, #368]
0x277a5276fa10  16b0  6e22dc43       fmul v3.4s, v2.4s, v2.4s
0x277a5276fa14  16b4  4e23d6a3       fadd v3.4s, v21.4s, v3.4s
0x277a5276fa18  16b8  6ea3e635       fcmgt v21.4s, v17.4s, v3.4s
0x277a5276fa1c  16bc  4e341eb5       and v21.16b, v21.16b, v20.16b
0x277a5276fa20  16c0  4e21dab5       scvtf v21.4s, v21.4s
0x277a5276fa24  16c4  4e351d35       and v21.16b, v9.16b, v21.16b
0x277a5276fa28  16c8  6e35dc42       fmul v2.4s, v2.4s, v21.4s
0x277a5276fa2c  16cc  3d805be4       str q4, [sp, #352]
0x277a5276fa30  16d0  3dc03fe4       ldr q4, [sp, #240]
0x277a5276fa34  16d4  4e24d442       fadd v2.4s, v2.4s, v4.4s
0x277a5276fa38  16d8  f941b7e6       ldr x6, [sp, #872]
0x277a5276fa3c  16dc  3ca66b22       str q2, [x25, x6]
0x277a5276fa40  16e0  6e35de64       fmul v4.4s, v19.4s, v21.4s
0x277a5276fa44  16e4  3dc043f3       ldr q19, [sp, #256]
0x277a5276fa48  16e8  4e33d484       fadd v4.4s, v4.4s, v19.4s
0x277a5276fa4c  16ec  f941d3e9       ldr x9, [sp, #928]
0x277a5276fa50  16f0  3ca96b24       str q4, [x25, x9]
0x277a5276fa54  16f4  6e31e473       fcmge v19.4s, v3.4s, v17.4s
0x277a5276fa58  16f8  6ea3e655       fcmgt v21.4s, v18.4s, v3.4s
0x277a5276fa5c  16fc  4e351e73       and v19.16b, v19.16b, v21.16b
0x277a5276fa60  1700  4e331d29       and v9.16b, v9.16b, v19.16b
0x277a5276fa64  1704  4f3f5529       shl v9.4s, v9.4s, #31
0x277a5276fa68  1708  4f210529       sshr v9.4s, v9.4s, #31
0x277a5276fa6c  170c  4ea0c863       fcmgt v3.4s, v3.4s, #0.0
0x277a5276fa70  1710  4e341c63       and v3.16b, v3.16b, v20.16b
0x277a5276fa74  1714  4e21d863       scvtf v3.4s, v3.4s
0x277a5276fa78  1718  4e231d23       and v3.16b, v9.16b, v3.16b
0x277a5276fa7c  171c  3dc02be9       ldr q9, [sp, #160]
0x277a5276fa80  1720  4e29d469       fadd v9.4s, v3.4s, v9.4s
0x277a5276fa84  1724  f941d7ec       ldr x12, [sp, #936]
0x277a5276fa88  1728  3cac6b29       str q9, [x25, x12]
0x277a5276fa8c  172c  6e23dc13       fmul v19.4s, v0.4s, v3.4s
0x277a5276fa90  1730  3dc02ff5       ldr q21, [sp, #176]
0x277a5276fa94  1734  4e35d673       fadd v19.4s, v19.4s, v21.4s
0x277a5276fa98  1738  f941dbf6       ldr x22, [sp, #944]
0x277a5276fa9c  173c  3cb66b33       str q19, [x25, x22]
0x277a5276faa0  1740  6e23df95       fmul v21.4s, v28.4s, v3.4s
0x277a5276faa4  1744  3dc033fc       ldr q28, [sp, #192]
0x277a5276faa8  1748  4e3cd6b5       fadd v21.4s, v21.4s, v28.4s
0x277a5276faac  174c  f941dfe6       ldr x6, [sp, #952]
0x277a5276fab0  1750  3ca66b35       str q21, [x25, x6]
0x277a5276fab4  1754  6e23dc3c       fmul v28.4s, v1.4s, v3.4s
0x277a5276fab8  1758  3dc037e0       ldr q0, [sp, #208]
0x277a5276fabc  175c  4e20d79c       fadd v28.4s, v28.4s, v0.4s
0x277a5276fac0  1760  f941e3e6       ldr x6, [sp, #960]
0x277a5276fac4  1764  3ca66b3c       str q28, [x25, x6]
0x277a5276fac8  1768  6e23dd63       fmul v3.4s, v11.4s, v3.4s
0x277a5276facc  176c  3dc03beb       ldr q11, [sp, #224]
0x277a5276fad0  1770  4e2bd463       fadd v3.4s, v3.4s, v11.4s
0x277a5276fad4  1774  f941e7e6       ldr x6, [sp, #968]
0x277a5276fad8  1778  3ca66b23       str q3, [x25, x6]
0x277a5276fadc  177c  aa1803e6       mov x6, x24
0x277a5276fae0  1780  aa1b03ec       mov x12, cp
0x277a5276fae4  1784  aa0803e9       mov x9, x8
0x277a5276fae8  1788  3d802be9       str q9, [sp, #160]
0x277a5276faec  178c  3d802ff3       str q19, [sp, #176]
0x277a5276faf0  1790  3d8033f5       str q21, [sp, #192]
0x277a5276faf4  1794  4eae1dc0       mov v0.16b, v14.16b
0x277a5276faf8  1798  4ebc1f8e       mov v14.16b, v28.16b
0x277a5276fafc  179c  4ea81d01       mov v1.16b, v8.16b
0x277a5276fb00  17a0  4eba1f49       mov v9.16b, v26.16b
0x277a5276fb04  17a4  4eac1d9a       mov v26.16b, v12.16b
0x277a5276fb08  17a8  4ea31c6c       mov v12.16b, v3.16b
0x277a5276fb0c  17ac  4ea21c4b       mov v11.16b, v2.16b
0x277a5276fb10  17b0  4eb81f1c       mov v28.16b, v24.16b
0x277a5276fb14  17b4  4eaa1d58       mov v24.16b, v10.16b
0x277a5276fb18  17b8  4ea41c8a       mov v10.16b, v4.16b
0x277a5276fb1c  17bc  4ead1dbe       mov v30.16b, v13.16b
0x277a5276fb20  17c0  4ebb1f6d       mov v13.16b, v27.16b
0x277a5276fb24  17c4  4eb91f3b       mov v27.16b, v25.16b
0x277a5276fb28  17c8  4ebe1fd9       mov v25.16b, v30.16b
0x277a5276fb2c  17cc  4eb61ed3       mov v19.16b, v22.16b
0x277a5276fb30  17d0  3dc05ff5       ldr q21, [sp, #368]
0x277a5276fb34  17d4  3dc05bf6       ldr q22, [sp, #352]
0x277a5276fb38  17d8  1400005b       b #+0x16c (addr 0x277a5276fca4)
0x277a5276fb3c  17dc  f941dbe8       ldr x8, [sp, #944]
0x277a5276fb40  17e0  f94223ef       ldr x15, [sp, #1088]
0x277a5276fb44  17e4  12000de8       and w8, w15, #0xf
0x277a5276fb48  17e8  f941eff8       ldr x24, [sp, #984]
0x277a5276fb4c  17ec  6b16031f       cmp w24, w22
0x277a5276fb50  17f0  1a96331b       csel w27, w24, w22, lo
0x277a5276fb54  17f4  f941f3f6       ldr x22, [sp, #992]
0x277a5276fb58  17f8  6b1b02df       cmp w22, w27
0x277a5276fb5c  17fc  1a9b32d8       csel w24, w22, w27, lo
0x277a5276fb60  1800  6b18011f       cmp w8, w24
0x277a5276fb64  1804  1a983116       csel w22, w8, w24, lo
0x277a5276fb68  1808  350000d6       cbnz w22, #+0x18 (addr 0x277a5276fb80)
0x277a5276fb6c  180c  3d8057e8       str q8, [sp, #336]
0x277a5276fb70  1810  3d8083e4       str q4, [sp, #512]
0x277a5276fb74  1814  3d8087e3       str q3, [sp, #528]
0x277a5276fb78  1818  3d808be2       str q2, [sp, #544]
0x277a5276fb7c  181c  1400004a       b #+0x128 (addr 0x277a5276fca4)
0x277a5276fb80  1820  f941f7e8       ldr x8, [sp, #1000]
0x277a5276fb84  1824  121c6108       and w8, w8, #0x1ffffff0
0x277a5276fb88  1828  f9421ff8       ldr x24, [sp, #1080]
0x277a5276fb8c  182c  0b080b08       add w8, w24, w8, lsl #2
0x277a5276fb90  1830  121c61ef       and w15, w15, #0x1ffffff0
0x277a5276fb94  1834  f94227f8       ldr x24, [sp, #1096]
0x277a5276fb98  1838  0b0f0b0f       add w15, w24, w15, lsl #2
0x277a5276fb9c  183c  3dc11ff1       ldr q17, [sp, #1136]
0x277a5276fba0  1840  fd4243f2       ldr d18, [sp, #1152]
0x277a5276fba4  1844  fd4237f4       ldr d20, [sp, #1128]
0x277a5276fba8  1848  fd4217e4       ldr d4, [sp, #1064]
0x277a5276fbac  184c  fd421be5       ldr d5, [sp, #1072]
0x277a5276fbb0  1850  fd422be7       ldr d7, [sp, #1104]
0x277a5276fbb4  1854  1e2e1006       fmov s6, #0x70 (1.0000)
0x277a5276fbb8  1858  aa0803fb       mov cp, x8
0x277a5276fbbc  185c  f9420be8       ldr x8, [sp, #1040]
0x277a5276fbc0  1860  f94207f8       ldr x24, [sp, #1032]
0x277a5276fbc4  1864  f8520346       ldur x6, [x26, #-224]
0x277a5276fbc8  1868  fd4213e3       ldr d3, [sp, #1056]
0x277a5276fbcc  186c  fd420fe2       ldr d2, [sp, #1048]
0x277a5276fbd0  1870  eb2663ff       cmp sp, x6
0x277a5276fbd4  1874  54003789       b.ls #+0x6f0 (addr 0x277a527702c4)
0x277a5276fbd8  1878  bc7b6b28       ldr s8, [x25, x27]
0x277a5276fbdc  187c  1e283849       fsub s9, s2, s8
0x277a5276fbe0  1880  1e290922       fmul s2, s9, s9
0x277a5276fbe4  1884  2a1803e6       mov w6, w24
0x277a5276fbe8  1888  bc666b2a       ldr s10, [x25, x6]
0x277a5276fbec  188c  1e2a386b       fsub s11, s3, s10
0x277a5276fbf0  1890  1e2b0963       fmul s3, s11, s11
0x277a5276fbf4  1894  1e232842       fadd s2, s2, s3
0x277a5276fbf8  1898  1e242040       fcmp s2, s4
0x277a5276fbfc  189c  54000243       b.lo #+0x48 (addr 0x277a5276fc44)
0x277a5276fc00  18a0  1e252040       fcmp s2, s5
0x277a5276fc04  18a4  54000282       b.hs #+0x50 (addr 0x277a5276fc54)
0x277a5276fc08  18a8  1e202048       fcmp s2, #0.0
0x277a5276fc0c  18ac  5400024d       b.le #+0x48 (addr 0x277a5276fc54)
0x277a5276fc10  18b0  4e040502       dup v2.4s, v8.s[0]
0x277a5276fc14  18b4  6e0c0542       mov v2.s[1], v10.s[0]
0x277a5276fc18  18b8  2a0803e6       mov w6, w8
0x277a5276fc1c  18bc  bc666b23       ldr s3, [x25, x6]
0x277a5276fc20  18c0  6e140462       mov v2.s[2], v3.s[0]
0x277a5276fc24  18c4  bc6f6b23       ldr s3, [x25, x15]
0x277a5276fc28  18c8  6e1c0462       mov v2.s[3], v3.s[0]
0x277a5276fc2c  18cc  4e22d622       fadd v2.4s, v17.4s, v2.4s
0x277a5276fc30  18d0  1e262a43       fadd s3, s18, s6
0x277a5276fc34  18d4  4ea21c51       mov v17.16b, v2.16b
0x277a5276fc38  18d8  4ea31c72       mov v18.16b, v3.16b
0x277a5276fc3c  18dc  fd0233e3       str d3, [sp, #1120]
0x277a5276fc40  18e0  14000005       b #+0x14 (addr 0x277a5276fc54)
0x277a5276fc44  18e4  1e2b28e7       fadd s7, s7, s11
0x277a5276fc48  18e8  1e292a82       fadd s2, s20, s9
0x277a5276fc4c  18ec  fd022fe2       str d2, [sp, #1112]
0x277a5276fc50  18f0  4ea21c54       mov v20.16b, v2.16b
0x277a5276fc54  18f4  1100137b       add w27, w27, #0x4 (4)
0x277a5276fc58  18f8  11001318       add w24, w24, #0x4 (4)
0x277a5276fc5c  18fc  11001108       add w8, w8, #0x4 (4)
0x277a5276fc60  1900  110011ef       add w15, w15, #0x4 (4)
0x277a5276fc64  1904  510006d6       sub w22, w22, #0x1 (1)
0x277a5276fc68  1908  35fffaf6       cbnz w22, #-0xa4 (addr 0x277a5276fbc4)
0x277a5276fc6c  190c  3d811ff1       str q17, [sp, #1136]
0x277a5276fc70  1910  fd0243f2       str d18, [sp, #1152]
0x277a5276fc74  1914  fd0237f4       str d20, [sp, #1128]
0x277a5276fc78  1918  f94193e6       ldr x6, [sp, #800]
0x277a5276fc7c  191c  3dc0dff1       ldr q17, [sp, #880]
0x277a5276fc80  1920  3dc097e6       ldr q6, [sp, #592]
0x277a5276fc84  1924  fd022be7       str d7, [sp, #1104]
0x277a5276fc88  1928  3dc093e7       ldr q7, [sp, #576]
0x277a5276fc8c  192c  3dc0e3f2       ldr q18, [sp, #896]
0x277a5276fc90  1930  3dc0e7f4       ldr q20, [sp, #912]
0x277a5276fc94  1934  3dc03feb       ldr q11, [sp, #240]
0x277a5276fc98  1938  3dc07fe5       ldr q5, [sp, #496]
0x277a5276fc9c  193c  3dc043ea       ldr q10, [sp, #256]
0x277a5276fca0  1940  3dc053e9       ldr q9, [sp, #320]
0x277a5276fca4  1944  f9424fe8       ldr x8, [sp, #1176]
0x277a5276fca8  1948  1100050f       add w15, w8, #0x1 (1)
0x277a5276fcac  194c  f9424bf6       ldr x22, [sp, #1168]
0x277a5276fcb0  1950  6b16011f       cmp w8, w22
0x277a5276fcb4  1954  54ff8fc1       b.ne #-0xe08 (addr 0x277a5276eeac)
0x277a5276fcb8  1958  fd422be7       ldr d7, [sp, #1104]
0x277a5276fcbc  195c  f94253e6       ldr x6, [sp, #1184]
0x277a5276fcc0  1960  bc266b27       str s7, [x25, x6]
0x277a5276fcc4  1964  f94293e6       ldr x6, [sp, #1312]
0x277a5276fcc8  1968  910090c8       add x8, x6, #0x24 (36)
0x277a5276fccc  196c  fd422fe6       ldr d6, [sp, #1112]
0x277a5276fcd0  1970  bc286b26       str s6, [x25, x8]
0x277a5276fcd4  1974  fd4233e5       ldr d5, [sp, #1120]
0x277a5276fcd8  1978  f94257e8       ldr x8, [sp, #1192]
0x277a5276fcdc  197c  bc286b25       str s5, [x25, x8]
0x277a5276fce0  1980  3dc11fe2       ldr q2, [sp, #1136]
0x277a5276fce4  1984  f9425be8       ldr x8, [sp, #1200]
0x277a5276fce8  1988  3ca86b22       str q2, [x25, x8]
0x277a5276fcec  198c  14000002       b #+0x8 (addr 0x277a5276fcf4)
0x277a5276fcf0  1990  f94293e6       ldr x6, [sp, #1312]
0x277a5276fcf4  1994  110040c2       add w2, w6, #0x10 (16)
0x277a5276fcf8  1998  f9025be2       str x2, [sp, #1200]
0x277a5276fcfc  199c  f9429be7       ldr x7, [sp, #1328]
0x277a5276fd00  19a0  f9426be0       ldr x0, [sp, #1232]
0x277a5276fd04  19a4  97fc0667       bl #-0xfe664 (addr 0x277a526716a0)
0x277a5276fd08  19a8  f94293e4       ldr x4, [sp, #1312]
0x277a5276fd0c  19ac  1100c083       add w3, w4, #0x30 (48)
0x277a5276fd10  19b0  f9429be7       ldr x7, [sp, #1328]
0x277a5276fd14  19b4  f9426be0       ldr x0, [sp, #1232]
0x277a5276fd18  19b8  f94267e2       ldr x2, [sp, #1224]
0x277a5276fd1c  19bc  fd4263e0       ldr d0, [sp, #1216]
0x277a5276fd20  19c0  fd425fe1       ldr d1, [sp, #1208]
0x277a5276fd24  19c4  f9425be5       ldr x5, [sp, #1200]
0x277a5276fd28  19c8  97fc065f       bl #-0xfe684 (addr 0x277a526716a4)
0x277a5276fd2c  19cc  f9428bf3       ldr x19, [sp, #1296]
0x277a5276fd30  19d0  f9426fe6       ldr x6, [sp, #1240]
0x277a5276fd34  19d4  6b1300df       cmp w6, w19
0x277a5276fd38  19d8  540005c9       b.ls #+0xb8 (addr 0x277a5276fdf0)
0x277a5276fd3c  19dc  f9427fe8       ldr x8, [sp, #1272]
0x277a5276fd40  19e0  f94273e9       ldr x9, [sp, #1248]
0x277a5276fd44  19e4  0b08012a       add w10, w9, w8
0x277a5276fd48  19e8  f94293eb       ldr x11, [sp, #1312]
0x277a5276fd4c  19ec  9101016c       add x12, x11, #0x40 (64)
0x277a5276fd50  19f0  f94287ed       ldr x13, [sp, #1288]
0x277a5276fd54  19f4  bc6c69a2       ldr s2, [x13, x12]
0x277a5276fd58  19f8  bc2a69a2       str s2, [x13, x10]
0x277a5276fd5c  19fc  f94277ea       ldr x10, [sp, #1256]
0x277a5276fd60  1a00  0b08014c       add w12, w10, w8
0x277a5276fd64  1a04  9101116e       add x14, x11, #0x44 (68)
0x277a5276fd68  1a08  bc6e69a2       ldr s2, [x13, x14]
0x277a5276fd6c  1a0c  bc2c69a2       str s2, [x13, x12]
0x277a5276fd70  1a10  f9427bec       ldr x12, [sp, #1264]
0x277a5276fd74  1a14  0b08018e       add w14, w12, w8
0x277a5276fd78  1a18  9101216f       add x15, x11, #0x48 (72)
0x277a5276fd7c  1a1c  bc6f69a2       ldr s2, [x13, x15]
0x277a5276fd80  1a20  bc2e69a2       str s2, [x13, x14]
0x277a5276fd84  1a24  f94283ee       ldr x14, [sp, #1280]
0x277a5276fd88  1a28  0b0801c8       add w8, w14, w8
0x277a5276fd8c  1a2c  9101316f       add x15, x11, #0x4c (76)
0x277a5276fd90  1a30  bc6f69a2       ldr s2, [x13, x15]
0x277a5276fd94  1a34  bc2869a2       str s2, [x13, x8]
0x277a5276fd98  1a38  aa0903f5       mov x21, x9
0x277a5276fd9c  1a3c  aa0d03e9       mov x9, x13
0x277a5276fda0  1a40  aa0c03ef       mov x15, x12
0x277a5276fda4  1a44  aa0603ed       mov x13, x6
0x277a5276fda8  1a48  1e2e1008       fmov s8, #0x70 (1.0000)
0x277a5276fdac  1a4c  fd421be4       ldr d4, [sp, #1072]
0x277a5276fdb0  1a50  fd4217e2       ldr d2, [sp, #1064]
0x277a5276fdb4  1a54  3dc0e7e7       ldr q7, [sp, #912]
0x277a5276fdb8  1a58  3dc0e3e5       ldr q5, [sp, #896]
0x277a5276fdbc  1a5c  3dc0dfe3       ldr q3, [sp, #880]
0x277a5276fdc0  1a60  d2800001       movz x1, #0x0
0x277a5276fdc4  1a64  f94023e6       ldr x6, [sp, #64]
0x277a5276fdc8  1a68  f9400ffc       ldr x28, [sp, #24]
0x277a5276fdcc  1a6c  f9400bfb       ldr cp, [sp, #16]
0x277a5276fdd0  1a70  f94007f9       ldr x25, [sp, #8]
0x277a5276fdd4  1a74  f941fbec       ldr x12, [sp, #1008]
0x277a5276fdd8  1a78  f941fff8       ldr x24, [sp, #1016]
0x277a5276fddc  1a7c  f94203eb       ldr x11, [sp, #1024]
0x277a5276fde0  1a80  f94013f4       ldr x20, [sp, #32]
0x277a5276fde4  1a84  f94247f7       ldr x23, [sp, #1160]
0x277a5276fde8  1a88  f94017f6       ldr x22, [sp, #40]
0x277a5276fdec  1a8c  14000017       b #+0x5c (addr 0x277a5276fe48)
0x277a5276fdf0  1a90  f94287e9       ldr x9, [sp, #1288]
0x277a5276fdf4  1a94  f94283ee       ldr x14, [sp, #1280]
0x277a5276fdf8  1a98  f9427bef       ldr x15, [sp, #1264]
0x277a5276fdfc  1a9c  f94273f5       ldr x21, [sp, #1248]
0x277a5276fe00  1aa0  aa0603ed       mov x13, x6
0x277a5276fe04  1aa4  1e2e1008       fmov s8, #0x70 (1.0000)
0x277a5276fe08  1aa8  fd421be4       ldr d4, [sp, #1072]
0x277a5276fe0c  1aac  fd4217e2       ldr d2, [sp, #1064]
0x277a5276fe10  1ab0  3dc0e7e7       ldr q7, [sp, #912]
0x277a5276fe14  1ab4  3dc0e3e5       ldr q5, [sp, #896]
0x277a5276fe18  1ab8  3dc0dfe3       ldr q3, [sp, #880]
0x277a5276fe1c  1abc  d2800001       movz x1, #0x0
0x277a5276fe20  1ac0  f94023e6       ldr x6, [sp, #64]
0x277a5276fe24  1ac4  f9400ffc       ldr x28, [sp, #24]
0x277a5276fe28  1ac8  f9400bfb       ldr cp, [sp, #16]
0x277a5276fe2c  1acc  f94007f9       ldr x25, [sp, #8]
0x277a5276fe30  1ad0  f941fbec       ldr x12, [sp, #1008]
0x277a5276fe34  1ad4  f941fff8       ldr x24, [sp, #1016]
0x277a5276fe38  1ad8  f94203eb       ldr x11, [sp, #1024]
0x277a5276fe3c  1adc  f94013f4       ldr x20, [sp, #32]
0x277a5276fe40  1ae0  f94247f7       ldr x23, [sp, #1160]
0x277a5276fe44  1ae4  f94017f6       ldr x22, [sp, #40]
0x277a5276fe48  1ae8  11000673       add w19, w19, #0x1 (1)
0x277a5276fe4c  1aec  f9428fe8       ldr x8, [sp, #1304]
0x277a5276fe50  1af0  6b08027f       cmp w19, w8
0x277a5276fe54  1af4  54ff62a1       b.ne #-0x13ac (addr 0x277a5276eaa8)
0x277a5276fe58  1af8  f94293e6       ldr x6, [sp, #1312]
0x277a5276fe5c  1afc  110800c6       add w6, w6, #0x200 (512)
0x277a5276fe60  1b00  f94297e8       ldr x8, [sp, #1320]
0x277a5276fe64  1b04  b9000106       str w6, [x8]
0x277a5276fe68  1b08  17fffae8       b #-0x1460 (addr 0x277a5276ea08)
0x277a5276fe6c  1b0c  97fc0759       bl #-0xfe29c (addr 0x277a52671bd0)
0x277a5276fe70  1b10  f94287e6       ldr x6, [sp, #1288]
0x277a5276fe74  1b14  f9429be7       ldr x7, [sp, #1328]
0x277a5276fe78  1b18  f9424fe0       ldr x0, [sp, #1176]
0x277a5276fe7c  1b1c  17fff944       b #-0x1af0 (addr 0x277a5276e38c)
0x277a5276fe80  1b20  1e6720e0       fcmp d7, d7
0x277a5276fe84  1b24  54000080       b.eq #+0x10 (addr 0x277a5276fe94)
0x277a5276fe88  1b28  d2800001       movz x1, #0x0
0x277a5276fe8c  1b2c  aa0103eb       mov x11, x1
0x277a5276fe90  1b30  17fff974       b #-0x1a30 (addr 0x277a5276e460)
0x277a5276fe94  1b34  1e2020c8       fcmp s6, #0.0
0x277a5276fe98  1b38  54000063       b.lo #+0xc (addr 0x277a5276fea4)
0x277a5276fe9c  1b3c  9280000b       movn x11, #0x0
0x277a5276fea0  1b40  17fff970       b #-0x1a40 (addr 0x277a5276e460)
0x277a5276fea4  1b44  d280000b       movz x11, #0x0
0x277a5276fea8  1b48  17fff96e       b #-0x1a48 (addr 0x277a5276e460)
0x277a5276feac  1b4c  1e682100       fcmp d8, d8
0x277a5276feb0  1b50  54000060       b.eq #+0xc (addr 0x277a5276febc)
0x277a5276feb4  1b54  d280000b       movz x11, #0x0
0x277a5276feb8  1b58  17fff972       b #-0x1a38 (addr 0x277a5276e480)
0x277a5276febc  1b5c  1e2020e8       fcmp s7, #0.0
0x277a5276fec0  1b60  54ffffa3       b.lo #-0xc (addr 0x277a5276feb4)
0x277a5276fec4  1b64  9280000b       movn x11, #0x0
0x277a5276fec8  1b68  17fff96e       b #-0x1a48 (addr 0x277a5276e480)
0x277a5276fecc  1b6c  fd024be3       str d3, [sp, #1168]
0x277a5276fed0  1b70  f90283f5       str x21, [sp, #1280]
0x277a5276fed4  1b74  f90277f4       str x20, [sp, #1256]
0x277a5276fed8  1b78  97fc073e       bl #-0xfe308 (addr 0x277a52671bd0)
0x277a5276fedc  1b7c  f94287e9       ldr x9, [sp, #1288]
0x277a5276fee0  1b80  f94023e6       ldr x6, [sp, #64]
0x277a5276fee4  1b84  f941ffef       ldr x15, [sp, #1016]
0x277a5276fee8  1b88  f94017ed       ldr x13, [sp, #40]
0x277a5276feec  1b8c  f9428fe8       ldr x8, [sp, #1304]
0x277a5276fef0  1b90  f94257ec       ldr x12, [sp, #1192]
0x277a5276fef4  1b94  f9424fea       ldr x10, [sp, #1176]
0x277a5276fef8  1b98  f94277f4       ldr x20, [sp, #1256]
0x277a5276fefc  1b9c  fd424be3       ldr d3, [sp, #1168]
0x277a5276ff00  1ba0  f9426fe0       ldr x0, [sp, #1240]
0x277a5276ff04  1ba4  f9427bf3       ldr x19, [sp, #1264]
0x277a5276ff08  1ba8  f9427fee       ldr x14, [sp, #1272]
0x277a5276ff0c  1bac  f94283f5       ldr x21, [sp, #1280]
0x277a5276ff10  1bb0  17fff9a0       b #-0x1980 (addr 0x277a5276e590)
0x277a5276ff14  1bb4  fd024be3       str d3, [sp, #1168]
0x277a5276ff18  1bb8  f9027bec       str x12, [sp, #1264]
0x277a5276ff1c  1bbc  f90283e2       str x2, [sp, #1280]
0x277a5276ff20  1bc0  97fc072c       bl #-0xfe350 (addr 0x277a52671bd0)
0x277a5276ff24  1bc4  f94287e9       ldr x9, [sp, #1288]
0x277a5276ff28  1bc8  f94023e6       ldr x6, [sp, #64]
0x277a5276ff2c  1bcc  f941fbf4       ldr x20, [sp, #1008]
0x277a5276ff30  1bd0  f94247ee       ldr x14, [sp, #1160]
0x277a5276ff34  1bd4  f9428fe8       ldr x8, [sp, #1304]
0x277a5276ff38  1bd8  f94257f6       ldr x22, [sp, #1192]
0x277a5276ff3c  1bdc  f9424fea       ldr x10, [sp, #1176]
0x277a5276ff40  1be0  f94283e2       ldr x2, [sp, #1280]
0x277a5276ff44  1be4  fd424be3       ldr d3, [sp, #1168]
0x277a5276ff48  1be8  f9427feb       ldr x11, [sp, #1272]
0x277a5276ff4c  1bec  f94277e0       ldr x0, [sp, #1256]
0x277a5276ff50  1bf0  f94273f5       ldr x21, [sp, #1248]
0x277a5276ff54  1bf4  f9426ff3       ldr x19, [sp, #1240]
0x277a5276ff58  1bf8  f9427bec       ldr x12, [sp, #1264]
0x277a5276ff5c  1bfc  17fff9d2       b #-0x18b8 (addr 0x277a5276e6a4)
0x277a5276ff60  1c00  fd024be3       str d3, [sp, #1168]
0x277a5276ff64  1c04  f9025bf5       str x21, [sp, #1200]
0x277a5276ff68  1c08  f90283e2       str x2, [sp, #1280]
0x277a5276ff6c  1c0c  97fc0719       bl #-0xfe39c (addr 0x277a52671bd0)
0x277a5276ff70  1c10  f94287e9       ldr x9, [sp, #1288]
0x277a5276ff74  1c14  f94023e6       ldr x6, [sp, #64]
0x277a5276ff78  1c18  f94007ef       ldr x15, [sp, #8]
0x277a5276ff7c  1c1c  f94013ec       ldr x12, [sp, #32]
0x277a5276ff80  1c20  f9427feb       ldr x11, [sp, #1272]
0x277a5276ff84  1c24  f94257f6       ldr x22, [sp, #1192]
0x277a5276ff88  1c28  f9424fea       ldr x10, [sp, #1176]
0x277a5276ff8c  1c2c  f94283e2       ldr x2, [sp, #1280]
0x277a5276ff90  1c30  fd424be3       ldr d3, [sp, #1168]
0x277a5276ff94  1c34  f9427be0       ldr x0, [sp, #1264]
0x277a5276ff98  1c38  f9426ff3       ldr x19, [sp, #1240]
0x277a5276ff9c  1c3c  f94273ed       ldr x13, [sp, #1248]
0x277a5276ffa0  1c40  f9425bf5       ldr x21, [sp, #1200]
0x277a5276ffa4  1c44  17fffa00       b #-0x1800 (addr 0x277a5276e7a4)
0x277a5276ffa8  1c48  fd024be3       str d3, [sp, #1168]
0x277a5276ffac  1c4c  f90253ea       str x10, [sp, #1184]
0x277a5276ffb0  1c50  f90283e2       str x2, [sp, #1280]
0x277a5276ffb4  1c54  97fc0707       bl #-0xfe3e4 (addr 0x277a52671bd0)
0x277a5276ffb8  1c58  f94287e9       ldr x9, [sp, #1288]
0x277a5276ffbc  1c5c  f94023e6       ldr x6, [sp, #64]
0x277a5276ffc0  1c60  f9400bf3       ldr x19, [sp, #16]
0x277a5276ffc4  1c64  f94203ed       ldr x13, [sp, #1024]
0x277a5276ffc8  1c68  f94283e2       ldr x2, [sp, #1280]
0x277a5276ffcc  1c6c  f9427feb       ldr x11, [sp, #1272]
0x277a5276ffd0  1c70  fd424be3       ldr d3, [sp, #1168]
0x277a5276ffd4  1c74  f9427be8       ldr x8, [sp, #1264]
0x277a5276ffd8  1c78  f94277e0       ldr x0, [sp, #1256]
0x277a5276ffdc  1c7c  f94257f5       ldr x21, [sp, #1192]
0x277a5276ffe0  1c80  f94273f4       ldr x20, [sp, #1248]
0x277a5276ffe4  1c84  f9426bee       ldr x14, [sp, #1232]
0x277a5276ffe8  1c88  f94253ea       ldr x10, [sp, #1184]
0x277a5276ffec  1c8c  17fffa32       b #-0x1738 (addr 0x277a5276e8b4)
0x277a5276fff0  1c90  f9028bf3       str x19, [sp, #1296]
0x277a5276fff4  1c94  97fc06f7       bl #-0xfe424 (addr 0x277a52671bd0)
0x277a5276fff8  1c98  f9428bf3       ldr x19, [sp, #1296]
0x277a5276fffc  1c9c  f94287e9       ldr x9, [sp, #1288]
0x277a52770000  1ca0  f94283ee       ldr x14, [sp, #1280]
0x277a52770004  1ca4  f9427bef       ldr x15, [sp, #1264]
0x277a52770008  1ca8  f94273f5       ldr x21, [sp, #1248]
0x277a5277000c  1cac  f9426fed       ldr x13, [sp, #1240]
0x277a52770010  1cb0  1e2e1008       fmov s8, #0x70 (1.0000)
0x277a52770014  1cb4  fd421be4       ldr d4, [sp, #1072]
0x277a52770018  1cb8  fd4217e2       ldr d2, [sp, #1064]
0x277a5277001c  1cbc  3dc0e7e7       ldr q7, [sp, #912]
0x277a52770020  1cc0  3dc0e3e5       ldr q5, [sp, #896]
0x277a52770024  1cc4  3dc0dfe3       ldr q3, [sp, #880]
0x277a52770028  1cc8  d2800001       movz x1, #0x0
0x277a5277002c  1ccc  f94023e6       ldr x6, [sp, #64]
0x277a52770030  1cd0  f9400ffc       ldr x28, [sp, #24]
0x277a52770034  1cd4  f9400bfb       ldr cp, [sp, #16]
0x277a52770038  1cd8  f94007f9       ldr x25, [sp, #8]
0x277a5277003c  1cdc  f941fbec       ldr x12, [sp, #1008]
0x277a52770040  1ce0  f941fff8       ldr x24, [sp, #1016]
0x277a52770044  1ce4  f94203eb       ldr x11, [sp, #1024]
0x277a52770048  1ce8  f94013f4       ldr x20, [sp, #32]
0x277a5277004c  1cec  f94247f7       ldr x23, [sp, #1160]
0x277a52770050  1cf0  f94017f6       ldr x22, [sp, #40]
0x277a52770054  1cf4  17fffa98       b #-0x15a0 (addr 0x277a5276eab4)
0x277a52770058  1cf8  1e6520a0       fcmp d5, d5
0x277a5277005c  1cfc  54000060       b.eq #+0xc (addr 0x277a52770068)
0x277a52770060  1d00  d2800008       movz x8, #0x0
0x277a52770064  1d04  17fffaf1       b #-0x143c (addr 0x277a5276ec28)
0x277a52770068  1d08  1e202088       fcmp s4, #0.0
0x277a5277006c  1d0c  54ffffa3       b.lo #-0xc (addr 0x277a52770060)
0x277a52770070  1d10  92800008       movn x8, #0x0
0x277a52770074  1d14  17fffaed       b #-0x144c (addr 0x277a5276ec28)
0x277a52770078  1d18  1e6620c0       fcmp d6, d6
0x277a5277007c  1d1c  54000060       b.eq #+0xc (addr 0x277a52770088)
0x277a52770080  1d20  d280000b       movz x11, #0x0
0x277a52770084  1d24  17fffb08       b #-0x13e0 (addr 0x277a5276eca4)
0x277a52770088  1d28  1e202068       fcmp s3, #0.0
0x277a5277008c  1d2c  54ffffa3       b.lo #-0xc (addr 0x277a52770080)
0x277a52770090  1d30  9280000b       movn x11, #0x0
0x277a52770094  1d34  17fffb04       b #-0x13f0 (addr 0x277a5276eca4)
0x277a52770098  1d38  f9016fe1       str x1, [sp, #728]
0x277a5277009c  1d3c  f9016be2       str x2, [sp, #720]
0x277a527700a0  1d40  f90167e3       str x3, [sp, #712]
0x277a527700a4  1d44  f90163e5       str x5, [sp, #704]
0x277a527700a8  1d48  f9015fe7       str x7, [sp, #696]
0x277a527700ac  1d4c  f90153f4       str x20, [sp, #672]
0x277a527700b0  1d50  3d8097e8       str q8, [sp, #592]
0x277a527700b4  1d54  3d8093e9       str q9, [sp, #576]
0x277a527700b8  1d58  3d808fea       str q10, [sp, #560]
0x277a527700bc  1d5c  3d808beb       str q11, [sp, #544]
0x277a527700c0  1d60  3d8087e1       str q1, [sp, #528]
0x277a527700c4  1d64  3d8083e0       str q0, [sp, #512]
0x277a527700c8  1d68  3d807ffc       str q28, [sp, #496]
0x277a527700cc  1d6c  3d807bfb       str q27, [sp, #480]
0x277a527700d0  1d70  3d8077fa       str q26, [sp, #464]
0x277a527700d4  1d74  3d8073f9       str q25, [sp, #448]
0x277a527700d8  1d78  3d806ff8       str q24, [sp, #432]
0x277a527700dc  1d7c  3d806bf7       str q23, [sp, #416]
0x277a527700e0  1d80  3d8067f6       str q22, [sp, #400]
0x277a527700e4  1d84  3d8063f5       str q21, [sp, #384]
0x277a527700e8  1d88  3d805ff4       str q20, [sp, #368]
0x277a527700ec  1d8c  3d805bf3       str q19, [sp, #352]
0x277a527700f0  1d90  3d8057f2       str q18, [sp, #336]
0x277a527700f4  1d94  3d8053f1       str q17, [sp, #320]
0x277a527700f8  1d98  3d804ff0       str q16, [sp, #304]
0x277a527700fc  1d9c  3d804bee       str q14, [sp, #288]
0x277a52770100  1da0  3d8047ed       str q13, [sp, #272]
0x277a52770104  1da4  3d8043ec       str q12, [sp, #256]
0x277a52770108  1da8  97fc06b2       bl #-0xfe538 (addr 0x277a52671bd0)
0x277a5277010c  1dac  f94287f5       ldr x21, [sp, #1288]
0x277a52770110  1db0  f9424fe9       ldr x9, [sp, #1176]
0x277a52770114  1db4  f9416fe1       ldr x1, [sp, #728]
0x277a52770118  1db8  f9416be2       ldr x2, [sp, #720]
0x277a5277011c  1dbc  f94167e3       ldr x3, [sp, #712]
0x277a52770120  1dc0  f94163e5       ldr x5, [sp, #704]
0x277a52770124  1dc4  f9415fe7       ldr x7, [sp, #696]
0x277a52770128  1dc8  f94153f4       ldr x20, [sp, #672]
0x277a5277012c  1dcc  f9414ff7       ldr x23, [sp, #664]
0x277a52770130  1dd0  f94147fb       ldr cp, [sp, #648]
0x277a52770134  1dd4  f94143fc       ldr x28, [sp, #640]
0x277a52770138  1dd8  f9413ff9       ldr x25, [sp, #632]
0x277a5277013c  1ddc  f94137f8       ldr x24, [sp, #616]
0x277a52770140  1de0  d2800004       movz x4, #0x0
0x277a52770144  1de4  3dc097e8       ldr q8, [sp, #592]
0x277a52770148  1de8  3dc093e9       ldr q9, [sp, #576]
0x277a5277014c  1dec  3dc08fea       ldr q10, [sp, #560]
0x277a52770150  1df0  3dc08beb       ldr q11, [sp, #544]
0x277a52770154  1df4  3dc087e1       ldr q1, [sp, #528]
0x277a52770158  1df8  3dc083e0       ldr q0, [sp, #512]
0x277a5277015c  1dfc  3dc07ffc       ldr q28, [sp, #496]
0x277a52770160  1e00  3dc07bfb       ldr q27, [sp, #480]
0x277a52770164  1e04  3dc077fa       ldr q26, [sp, #464]
0x277a52770168  1e08  3dc073f9       ldr q25, [sp, #448]
0x277a5277016c  1e0c  3dc06ff8       ldr q24, [sp, #432]
0x277a52770170  1e10  3dc06bf7       ldr q23, [sp, #416]
0x277a52770174  1e14  3dc067f6       ldr q22, [sp, #400]
0x277a52770178  1e18  3dc063f5       ldr q21, [sp, #384]
0x277a5277017c  1e1c  3dc05ff4       ldr q20, [sp, #368]
0x277a52770180  1e20  3dc05bf3       ldr q19, [sp, #352]
0x277a52770184  1e24  3dc057f2       ldr q18, [sp, #336]
0x277a52770188  1e28  3dc053f1       ldr q17, [sp, #320]
0x277a5277018c  1e2c  3dc04ff0       ldr q16, [sp, #304]
0x277a52770190  1e30  3dc04bee       ldr q14, [sp, #288]
0x277a52770194  1e34  3dc047ed       ldr q13, [sp, #272]
0x277a52770198  1e38  3dc043ec       ldr q12, [sp, #256]
0x277a5277019c  1e3c  f94043ed       ldr x13, [sp, #128]
0x277a527701a0  1e40  f9403ff3       ldr x19, [sp, #120]
0x277a527701a4  1e44  f9403bee       ldr x14, [sp, #112]
0x277a527701a8  1e48  f94037ef       ldr x15, [sp, #104]
0x277a527701ac  1e4c  f94033f6       ldr x22, [sp, #96]
0x277a527701b0  1e50  f9402fe8       ldr x8, [sp, #88]
0x277a527701b4  1e54  f9402bec       ldr x12, [sp, #80]
0x277a527701b8  1e58  f94027e6       ldr x6, [sp, #72]
0x277a527701bc  1e5c  17fffb64       b #-0x1270 (addr 0x277a5276ef4c)
0x277a527701c0  1e60  f9016fe1       str x1, [sp, #728]
0x277a527701c4  1e64  f9016be2       str x2, [sp, #720]
0x277a527701c8  1e68  f90167e3       str x3, [sp, #712]
0x277a527701cc  1e6c  f90163e5       str x5, [sp, #704]
0x277a527701d0  1e70  f9015fe7       str x7, [sp, #696]
0x277a527701d4  1e74  f90153f4       str x20, [sp, #672]
0x277a527701d8  1e78  f9004ff6       str x22, [sp, #152]
0x277a527701dc  1e7c  3d805ff5       str q21, [sp, #368]
0x277a527701e0  1e80  3d805bf6       str q22, [sp, #352]
0x277a527701e4  1e84  3d8073f9       str q25, [sp, #448]
0x277a527701e8  1e88  3d806ff8       str q24, [sp, #432]
0x277a527701ec  1e8c  3d806bf7       str q23, [sp, #416]
0x277a527701f0  1e90  3d8067fa       str q26, [sp, #400]
0x277a527701f4  1e94  3d8063fb       str q27, [sp, #384]
0x277a527701f8  1e98  3d807bfc       str q28, [sp, #480]
0x277a527701fc  1e9c  3d8077e0       str q0, [sp, #464]
0x277a52770200  1ea0  3d808fe1       str q1, [sp, #560]
0x277a52770204  1ea4  3d808be2       str q2, [sp, #544]
0x277a52770208  1ea8  3d8087e3       str q3, [sp, #528]
0x277a5277020c  1eac  3d8083e4       str q4, [sp, #512]
0x277a52770210  1eb0  3d807fe5       str q5, [sp, #496]
0x277a52770214  1eb4  3d8097e6       str q6, [sp, #592]
0x277a52770218  1eb8  3d8093e7       str q7, [sp, #576]
0x277a5277021c  1ebc  97fc066d       bl #-0xfe64c (addr 0x277a52671bd0)
0x277a52770220  1ec0  f94287f9       ldr x25, [sp, #1288]
0x277a52770224  1ec4  f94227e8       ldr x8, [sp, #1096]
0x277a52770228  1ec8  f9421fe9       ldr x9, [sp, #1080]
0x277a5277022c  1ecc  f94197ec       ldr x12, [sp, #808]
0x277a52770230  1ed0  f94193e6       ldr x6, [sp, #800]
0x277a52770234  1ed4  f9418fe4       ldr x4, [sp, #792]
0x277a52770238  1ed8  f9418bfc       ldr x28, [sp, #784]
0x277a5277023c  1edc  f94187ea       ldr x10, [sp, #776]
0x277a52770240  1ee0  f94183f5       ldr x21, [sp, #768]
0x277a52770244  1ee4  f9417fe0       ldr x0, [sp, #760]
0x277a52770248  1ee8  f9417bf7       ldr x23, [sp, #752]
0x277a5277024c  1eec  f94177f3       ldr x19, [sp, #744]
0x277a52770250  1ef0  f94173ee       ldr x14, [sp, #736]
0x277a52770254  1ef4  f9416fe1       ldr x1, [sp, #728]
0x277a52770258  1ef8  f9416be2       ldr x2, [sp, #720]
0x277a5277025c  1efc  f94167e3       ldr x3, [sp, #712]
0x277a52770260  1f00  f94163e5       ldr x5, [sp, #704]
0x277a52770264  1f04  f9415fe7       ldr x7, [sp, #696]
0x277a52770268  1f08  f9415bed       ldr x13, [sp, #688]
0x277a5277026c  1f0c  f94157eb       ldr x11, [sp, #680]
0x277a52770270  1f10  f94153f4       ldr x20, [sp, #672]
0x277a52770274  1f14  f9404ff6       ldr x22, [sp, #152]
0x277a52770278  1f18  3dc05ff5       ldr q21, [sp, #368]
0x277a5277027c  1f1c  3dc05bf6       ldr q22, [sp, #352]
0x277a52770280  1f20  3dc073f9       ldr q25, [sp, #448]
0x277a52770284  1f24  3dc06ff8       ldr q24, [sp, #432]
0x277a52770288  1f28  3dc06bf7       ldr q23, [sp, #416]
0x277a5277028c  1f2c  3dc067fa       ldr q26, [sp, #400]
0x277a52770290  1f30  3dc063fb       ldr q27, [sp, #384]
0x277a52770294  1f34  3dc07bfc       ldr q28, [sp, #480]
0x277a52770298  1f38  3dc077e0       ldr q0, [sp, #464]
0x277a5277029c  1f3c  3dc08fe1       ldr q1, [sp, #560]
0x277a527702a0  1f40  3dc08be2       ldr q2, [sp, #544]
0x277a527702a4  1f44  3dc087e3       ldr q3, [sp, #528]
0x277a527702a8  1f48  3dc083e4       ldr q4, [sp, #512]
0x277a527702ac  1f4c  3dc07fe5       ldr q5, [sp, #496]
0x277a527702b0  1f50  3dc097e6       ldr q6, [sp, #592]
0x277a527702b4  1f54  3dc093e7       ldr q7, [sp, #576]
0x277a527702b8  1f58  f9404bfb       ldr cp, [sp, #144]
0x277a527702bc  1f5c  f94047f8       ldr x24, [sp, #136]
0x277a527702c0  1f60  17fffbe5       b #-0x106c (addr 0x277a5276f254)
0x277a527702c4  1f64  3d808fe1       str q1, [sp, #560]
0x277a527702c8  1f68  3d807bfc       str q28, [sp, #480]
0x277a527702cc  1f6c  3d8077e0       str q0, [sp, #464]
0x277a527702d0  1f70  3d806bf7       str q23, [sp, #416]
0x277a527702d4  1f74  3d8067fa       str q26, [sp, #400]
0x277a527702d8  1f78  3d8063fb       str q27, [sp, #384]
0x277a527702dc  1f7c  f90227f6       str x22, [sp, #1096]
0x277a527702e0  1f80  f90223ef       str x15, [sp, #1088]
0x277a527702e4  1f84  f9020be8       str x8, [sp, #1040]
0x277a527702e8  1f88  f90207f8       str x24, [sp, #1032]
0x277a527702ec  1f8c  f9021ffb       str cp, [sp, #1080]
0x277a527702f0  1f90  3d811ff1       str q17, [sp, #1136]
0x277a527702f4  1f94  fd0243f2       str d18, [sp, #1152]
0x277a527702f8  1f98  fd0237f4       str d20, [sp, #1128]
0x277a527702fc  1f9c  fd022be7       str d7, [sp, #1104]
0x277a52770300  1fa0  f9016fe1       str x1, [sp, #728]
0x277a52770304  1fa4  f9016be2       str x2, [sp, #720]
0x277a52770308  1fa8  f90167e3       str x3, [sp, #712]
0x277a5277030c  1fac  f90163e5       str x5, [sp, #704]
0x277a52770310  1fb0  f9015fe7       str x7, [sp, #696]
0x277a52770314  1fb4  f90153f4       str x20, [sp, #672]
0x277a52770318  1fb8  97fc062e       bl #-0xfe748 (addr 0x277a52671bd0)
0x277a5277031c  1fbc  f94287f9       ldr x25, [sp, #1288]
0x277a52770320  1fc0  3dc08fe1       ldr q1, [sp, #560]
0x277a52770324  1fc4  3dc07bfc       ldr q28, [sp, #480]
0x277a52770328  1fc8  3dc077e0       ldr q0, [sp, #464]
0x277a5277032c  1fcc  3dc073f9       ldr q25, [sp, #448]
0x277a52770330  1fd0  3dc06ff8       ldr q24, [sp, #432]
0x277a52770334  1fd4  3dc06bf7       ldr q23, [sp, #416]
0x277a52770338  1fd8  3dc067fa       ldr q26, [sp, #400]
0x277a5277033c  1fdc  3dc063fb       ldr q27, [sp, #384]
0x277a52770340  1fe0  3dc05ff5       ldr q21, [sp, #368]
0x277a52770344  1fe4  3dc05bf6       ldr q22, [sp, #352]
0x277a52770348  1fe8  3dc04ff0       ldr q16, [sp, #304]
0x277a5277034c  1fec  3dc04bf3       ldr q19, [sp, #288]
0x277a52770350  1ff0  3dc047ed       ldr q13, [sp, #272]
0x277a52770354  1ff4  3dc03bec       ldr q12, [sp, #224]
0x277a52770358  1ff8  3dc037ee       ldr q14, [sp, #208]
0x277a5277035c  1ffc  f94227f6       ldr x22, [sp, #1096]
0x277a52770360  2000  f94223ef       ldr x15, [sp, #1088]
0x277a52770364  2004  f9420be8       ldr x8, [sp, #1040]
0x277a52770368  2008  f94207f8       ldr x24, [sp, #1032]
0x277a5277036c  200c  f9421ffb       ldr cp, [sp, #1080]
0x277a52770370  2010  3dc11ff1       ldr q17, [sp, #1136]
0x277a52770374  2014  fd4243f2       ldr d18, [sp, #1152]
0x277a52770378  2018  fd4237f4       ldr d20, [sp, #1128]
0x277a5277037c  201c  fd422be7       ldr d7, [sp, #1104]
0x277a52770380  2020  1e2e1006       fmov s6, #0x70 (1.0000)
0x277a52770384  2024  fd421be5       ldr d5, [sp, #1072]
0x277a52770388  2028  fd4217e4       ldr d4, [sp, #1064]
0x277a5277038c  202c  fd4213e3       ldr d3, [sp, #1056]
0x277a52770390  2030  fd420fe2       ldr d2, [sp, #1048]
0x277a52770394  2034  f941b3e9       ldr x9, [sp, #864]
0x277a52770398  2038  f94197ec       ldr x12, [sp, #808]
0x277a5277039c  203c  f9418fe4       ldr x4, [sp, #792]
0x277a527703a0  2040  f9418bfc       ldr x28, [sp, #784]
0x277a527703a4  2044  f94187ea       ldr x10, [sp, #776]
0x277a527703a8  2048  f94183f5       ldr x21, [sp, #768]
0x277a527703ac  204c  f9417fe0       ldr x0, [sp, #760]
0x277a527703b0  2050  f9417bf7       ldr x23, [sp, #752]
0x277a527703b4  2054  f94177f3       ldr x19, [sp, #744]
0x277a527703b8  2058  f94173ee       ldr x14, [sp, #736]
0x277a527703bc  205c  f9416fe1       ldr x1, [sp, #728]
0x277a527703c0  2060  f9416be2       ldr x2, [sp, #720]
0x277a527703c4  2064  f94167e3       ldr x3, [sp, #712]
0x277a527703c8  2068  f94163e5       ldr x5, [sp, #704]
0x277a527703cc  206c  f9415fe7       ldr x7, [sp, #696]
0x277a527703d0  2070  f9415bed       ldr x13, [sp, #688]
0x277a527703d4  2074  f94157eb       ldr x11, [sp, #680]
0x277a527703d8  2078  f94153f4       ldr x20, [sp, #672]
0x277a527703dc  207c  17fffdff       b #-0x804 (addr 0x277a5276fbd8)
0x277a527703e0  2080  97fc054c       bl #-0xfead0 (addr 0x277a52671910)
0x277a527703e4  2084  d503201f       nop
0x277a527703e8  2088  5800007f       constant pool begin (num_const = 3)
0x277a527703ec  208c  d63f03e0       constant
0x277a527703f0  2090  0374aaf4       constant
0x277a527703f4  2094  00000001       constant

Protected instructions:
 pc offset
        44         
        64         
        b4         
       150         
       158         
       160         
       168         
       170         
       17c         
       184         
       18c         
       194         
       1c8         
       1d8         
       1e0         
       1ec         
       1f4         
       238         
       24c         
       274         
       2d8         
       2e0         
       2e8         
       304         
       30c         
       314         
       34c         
       360         
       388         
       3e0         
       3e8         
       3f0         
       400         
       408         
       410         
       44c         
       460         
       488         
       4dc         
       4e4         
       4ec         
       4fc         
       504         
       50c         
       55c         
       570         
       5a8         
       608         
       610         
       618         
       628         
       630         
       634         
       638         
       63c         
       644         
       64c         
       650         
       654         
       658         
       660         
       664         
       66c         
       670         
       678         
       67c         
       680         
       688         
       6e8         
       754         
       764         
       774         
       784         
       794         
       7a0         
       7a4         
       7ac         
       7b0         
       7bc         
       7c0         
       7d0         
       7dc         
       7e4         
       7ec         
       7f0         
       7f8         
       804         
       814         
       820         
       82c         
       830         
       9a0         
       9a8         
       9b4         
       9bc         
       9c4         
       9cc         
       9d4         
       9dc         
       9e4         
       9ec         
       9f4         
       9fc         
       a04         
       a0c         
       a14         
       a20         
       a2c         
       a38         
       a44         
       a50         
       a5c         
       a68         
       a74         
       a80         
       a8c         
       a98         
       aa4         
       ab0         
       ac0         
       ad0         
       c0c         
       c14         
       ef8         
       f00         
       f08         
       f18         
       f4c         
       f58         
       f80         
       f8c         
       f98         
       fa4         
       fb0         
       fb8         
       fc0         
       fc8         
       fd4         
      1000         
      100c         
      1030         
      103c         
      1048         
      1054         
      1060         
      1068         
      1070         
      1078         
      1084         
      10ac         
      10b8         
      10e0         
      10f0         
      1104         
      1118         
      112c         
      1134         
      113c         
      1144         
      1154         
      1190         
      11a4         
      11d0         
      11e4         
      11f8         
      120c         
      1220         
      12f4         
      1300         
      130c         
      136c         
      139c         
      13a8         
      13d8         
      13e4         
      13f0         
      13fc         
      1408         
      1410         
      1418         
      1420         
      1468         
      1494         
      14a0         
      14d0         
      14dc         
      14e8         
      14f8         
      1508         
      1510         
      1518         
      1520         
      1568         
      15a4         
      15b4         
      15ec         
      1600         
      1614         
      1628         
      163c         
      1644         
      164c         
      1654         
      16a0         
      16dc         
      16f0         
      1728         
      173c         
      1750         
      1764         
      1778         
      1878         
      1888         
      18bc         
      18c4         
      1960         
      1970         
      197c         
      1988         
      19f4         
      19f8         
      1a08         
      1a0c         
      1a1c         
      1a20         
      1a30         
      1a34         

Source positions:
 pc offset  position
        44        78
        64       115
        b4       184
       14c       297
       158       307
       160       311
       168       318
       170       322
       17c       333
       184       338
       18c       343
       194       348
       198       351
       1c4       365
       1d8       378
       1e0       385
       1e8       397
       1f0       404
       238       446
       24c       475
       274       504
       280       516
       2cc       532
       2e0       537
       2e8       548
       304       567
       308       572
       310       579
       34c       621
       360       650
       388       679
       394       691
       3e0       707
       3e8       712
       3f0       723
       400       742
       408       747
       410       754
       44c       797
       460       826
       488       855
       494       867
       4dc       883
       4e4       888
       4ec       899
       4fc       918
       504       923
       50c       930
       55c       969
       570       998
       5a8      1027
       5b4      1039
       5fc      1055
       610      1060
       618      1071
       624      1084
       630      1091
       634      1101
       638      1107
       63c      1115
       644      1121
       648      1131
       650      1137
       654      1143
       658      1152
       660      1158
       664      1165
       668      1174
       670      1180
       674      1188
       67c      1193
       680      1202
       688      1209
       6e8      1289
       754      1327
       764      1339
       774      1351
       784      1363
       794      1373
       7a0      1386
       7a4      1393
       7ac      1401
       7b0      1408
       7bc      1416
       7c0      1425
       7cc      1433
       7dc      1436
       7e4      1443
       7ec      1450
       7f0      1457
       7f8      1464
       804      1471
       814      1494
       820      1500
       82c      1508
       830      1516
       838      1533
       99c      1770
       9a8      1777
       9b4      1791
       9bc      1800
       9c4      1809
       9cc      1818
       9d4      1827
       9dc      1835
       9e4      1844
       9ec      1853
       9f4      1862
       9fc      1871
       a04      1880
       a0c      1889
       a14      1897
       a20      1906
       a2c      1915
       a38      1924
       a44      1933
       a50      1942
       a5c      1951
       a68      1959
       a74      1968
       a80      1977
       a8c      1986
       a98      1995
       aa4      2004
       ab0      2013
       abc      2021
       acc      2030
       c0c      2132
       c14      2145
       ef8      2441
       f00      2454
       f08      2473
       f18      2493
       f4c      2542
       f58      2563
       f80      2626
       f8c      2647
       f98      2668
       fa4      2689
       fb0      2710
       fb8      2719
       fc0      2730
       fc8      2747
       fd4      2765
      1000      2814
      100c      2835
      1030      2880
      103c      2901
      1048      2922
      1054      2943
      1060      2964
      1068      2973
      1070      2984
      1078      3001
      1084      3019
      10ac      3068
      10b8      3089
      10e0      3134
      10f0      3155
      1100      3176
      1114      3197
      1128      3218
      1134      3227
      113c      3238
      1144      3255
      1154      3273
      118c      3322
      11a0      3343
      11cc      3388
      11e0      3409
      11f4      3430
      1208      3451
      121c      3472
      12f4      3550
      1300      3563
      130c      3580
      136c      3665
      139c      3718
      13a8      3739
      13d8      3816
      13e4      3837
      13f0      3858
      13fc      3879
      1408      3900
      1410      3906
      1418      3914
      1420      3926
      1468      3989
      1494      4042
      14a0      4063
      14d0      4122
      14dc      4143
      14e8      4164
      14f8      4185
      1508      4206
      1510      4212
      1518      4220
      1520      4232
      1568      4295
      15a4      4348
      15b4      4369
      15e8      4428
      15fc      4449
      1610      4470
      1624      4491
      1638      4512
      1644      4518
      164c      4526
      1654      4538
      16a0      4601
      16d8      4654
      16ec      4675
      1724      4734
      1738      4755
      174c      4776
      1760      4797
      1774      4818
      1878      4909
      1888      4924
      18bc      4975
      18c4      4983
      1958      5084
      196c      5091
      1974      5098
      1980      5105
      1998      5121
      19b0      5151
      19f0      5171
      19f8      5174
      1a08      5184
      1a0c      5187
      1a1c      5197
      1a20      5200
      1a30      5210
      1a34      5213
      1b0c         0
      1b6c       420
      1bb4       595
      1c00       771
      1c48       943
      1c90      1319
      1d38      2069
      1e60      2432
      1f64      4899
      2080      1533

Safepoints (stack slots = 170, entries = 1, byte size = 36)
0x277a5276e51c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 66)
0x277a5276e518  internal wasm call
0x277a5276e5f0  internal wasm call
0x277a5276e700  internal wasm call
0x277a5276e800  internal wasm call
0x277a5276e920  internal wasm call
0x277a5276ebc8  external reference (0x10374aaf4)
0x277a5276fd04  internal wasm call
0x277a5276fd28  internal wasm call
0x277a5276fe6c  wasm stub call  (0x277a52671bd0)
0x277a5276fed8  wasm stub call  (0x277a52671bd0)
0x277a5276ff20  wasm stub call  (0x277a52671bd0)
0x277a5276ff6c  wasm stub call  (0x277a52671bd0)
0x277a5276ffb4  wasm stub call  (0x277a52671bd0)
0x277a5276fff4  wasm stub call  (0x277a52671bd0)
0x277a52770108  wasm stub call  (0x277a52671bd0)
0x277a5277021c  wasm stub call  (0x277a52671bd0)
0x277a52770318  wasm stub call  (0x277a52671bd0)
0x277a527703e0  wasm stub call  (0x277a52671910)
0x277a527703e8  constant pool (size 16)
