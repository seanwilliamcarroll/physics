name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8544 = 8524 + 20 padding)
Instructions (size = 8488)
0x100482f8a3e0     0  d2800110       movz x16, #0x8
0x100482f8a3e4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x100482f8a3e8     8  a9017bfd       stp fp, lr, [sp, #16]
0x100482f8a3ec     c  910043fd       add fp, sp, #0x10 (16)
0x100482f8a3f0    10  d114c3ff       sub sp, sp, #0x530 (1328)
0x100482f8a3f4    14  f841f0e6       ldur x6, [x7, #31]
0x100482f8a3f8    18  f8520348       ldur x8, [x26, #-224]
0x100482f8a3fc    1c  f9024fe0       str x0, [sp, #1176]
0x100482f8a400    20  f90287e6       str x6, [sp, #1288]
0x100482f8a404    24  eb2863ff       cmp sp, x8
0x100482f8a408    28  5400db29       b.ls #+0x1b64 (addr 0x100482f8bf6c)
0x100482f8a40c    2c  f842f0e8       ldur x8, [x7, #47]
0x100482f8a410    30  b9400109       ldr w9, [x8]
0x100482f8a414    34  51090124       sub w4, w9, #0x240 (576)
0x100482f8a418    38  b9000104       str w4, [x8]
0x100482f8a41c    3c  2a0003e9       mov w9, w0
0x100482f8a420    40  910240ca       add x10, x6, #0x90 (144)
0x100482f8a424    44  fc696942       ldr d2, [x10, x9]
0x100482f8a428    48  5e0c0441       mov s1, v2.s[1]
0x100482f8a42c    4c  52a75010       movz w16, #0x3a800000
0x100482f8a430    50  1e270203       fmov s3, w16
0x100482f8a434    54  1e230824       fmul s4, s1, s3
0x100482f8a438    58  5e040440       mov s0, v2.s[0]
0x100482f8a43c    5c  1e230803       fmul s3, s0, s3
0x100482f8a440    60  9102812a       add x10, x9, #0xa0 (160)
0x100482f8a444    64  bc6a68c5       ldr s5, [x6, x10]
0x100482f8a448    68  1e2520a0       fcmp s5, s5
0x100482f8a44c    6c  1e251c65       fcsel s5, s3, s5, ne
0x100482f8a450    70  1e232060       fcmp s3, s3
0x100482f8a454    74  1e231ca3       fcsel s3, s5, s3, ne
0x100482f8a458    78  1e252060       fcmp s3, s5
0x100482f8a45c    7c  1e233ca3       fcsel s3, s5, s3, lo
0x100482f8a460    80  1e232060       fcmp s3, s3
0x100482f8a464    84  1e231c83       fcsel s3, s4, s3, ne
0x100482f8a468    88  1e242080       fcmp s4, s4
0x100482f8a46c    8c  1e241c64       fcsel s4, s3, s4, ne
0x100482f8a470    90  1e232080       fcmp s4, s3
0x100482f8a474    94  1e243c63       fcsel s3, s3, s4, lo
0x100482f8a478    98  52840010       movz w16, #0x2000
0x100482f8a47c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x100482f8a480    a0  1e270204       fmov s4, w16
0x100482f8a484    a4  1e240863       fmul s3, s3, s4
0x100482f8a488    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x100482f8a48c    ac  1e231883       fdiv s3, s4, s3
0x100482f8a490    b0  9102112b       add x11, x9, #0x84 (132)
0x100482f8a494    b4  bc2b68c3       str s3, [x6, x11]
0x100482f8a498    b8  4e040465       dup v5.4s, v3.s[0]
0x100482f8a49c    bc  6e25dc42       fmul v2.4s, v2.4s, v5.4s
0x100482f8a4a0    c0  4ea18842       frintp v2.4s, v2.4s
0x100482f8a4a4    c4  5e040445       mov s5, v2.s[0]
0x100482f8a4a8    c8  1e22c0a6       fcvt d6, s5
0x100482f8a4ac    cc  1e65c0c7       frintz d7, d6
0x100482f8a4b0    d0  1e7900ec       fcvtzu w12, d7
0x100482f8a4b4    d4  1e630188       ucvtf d8, w12
0x100482f8a4b8    d8  f90297e8       str x8, [sp, #1320]
0x100482f8a4bc    dc  f90293e4       str x4, [sp, #1312]
0x100482f8a4c0    e0  f90023e9       str x9, [sp, #64]
0x100482f8a4c4    e4  fd025fe1       str d1, [sp, #1208]
0x100482f8a4c8    e8  fd0263e0       str d0, [sp, #1216]
0x100482f8a4cc    ec  f9028bea       str x10, [sp, #1296]
0x100482f8a4d0    f0  fd024be3       str d3, [sp, #1168]
0x100482f8a4d4    f4  f9000feb       str x11, [sp, #24]
0x100482f8a4d8    f8  1e6820e0       fcmp d7, d8
0x100482f8a4dc    fc  5400d521       b.ne #+0x1aa4 (addr 0x100482f8bf80)
0x100482f8a4e0   100  4e040d85       dup v5.4s, w12
0x100482f8a4e4   104  5e0c0446       mov s6, v2.s[1]
0x100482f8a4e8   108  1e22c0c7       fcvt d7, s6
0x100482f8a4ec   10c  1e65c0e8       frintz d8, d7
0x100482f8a4f0   110  1e79010c       fcvtzu w12, d8
0x100482f8a4f4   114  1e630189       ucvtf d9, w12
0x100482f8a4f8   118  1e692100       fcmp d8, d9
0x100482f8a4fc   11c  5400d581       b.ne #+0x1ab0 (addr 0x100482f8bfac)
0x100482f8a500   120  4e0c1d85       mov v5.s[1], w12
0x100482f8a504   124  4f000426       movi v6.4s, #0x1, lsl #0
0x100482f8a508   128  6ea664a5       umax v5.4s, v5.4s, v6.4s
0x100482f8a50c   12c  6f00e407       movi v7.2d, #0x0
0x100482f8a510   130  6ea0c848       fcmge v8.4s, v2.4s, #0.0
0x100482f8a514   134  52a9f010       movz w16, #0x4f800000
0x100482f8a518   138  4e040e09       dup v9.4s, w16
0x100482f8a51c   13c  6ea2e522       fcmgt v2.4s, v9.4s, v2.4s
0x100482f8a520   140  4e221d02       and v2.16b, v8.16b, v2.16b
0x100482f8a524   144  6e661ca2       bsl v2.16b, v5.16b, v6.16b
0x100482f8a528   148  910220cc       add x12, x6, #0x88 (136)
0x100482f8a52c   14c  8b09018c       add x12, x12, x9
0x100482f8a530   150  0d008582       st1 {v2.d}[0], [x12]
0x100482f8a534   154  9103312c       add x12, x9, #0xcc (204)
0x100482f8a538   158  b86c68cc       ldr w12, [x6, x12]
0x100482f8a53c   15c  9100e08d       add x13, x4, #0x38 (56)
0x100482f8a540   160  b82d68cc       str w12, [x6, x13]
0x100482f8a544   164  9103112c       add x12, x9, #0xc4 (196)
0x100482f8a548   168  f86c68cc       ldr x12, [x6, x12]
0x100482f8a54c   16c  9100c08d       add x13, x4, #0x30 (48)
0x100482f8a550   170  f82d68cc       str x12, [x6, x13]
0x100482f8a554   174  1101800c       add w12, w0, #0x60 (96)
0x100482f8a558   178  9100112d       add x13, x9, #0x4 (4)
0x100482f8a55c   17c  b86d68c2       ldr w2, [x6, x13]
0x100482f8a560   180  9100212e       add x14, x9, #0x8 (8)
0x100482f8a564   184  b86e68c3       ldr w3, [x6, x14]
0x100482f8a568   188  9100412f       add x15, x9, #0x10 (16)
0x100482f8a56c   18c  b86f68d3       ldr w19, [x6, x15]
0x100482f8a570   190  91005134       add x20, x9, #0x14 (20)
0x100482f8a574   194  b87468c5       ldr w5, [x6, x20]
0x100482f8a578   198  3d80e7e6       str q6, [sp, #912]
0x100482f8a57c   19c  3d800fe7       str q7, [sp, #48]
0x100482f8a580   1a0  f901ffed       str x13, [sp, #1016]
0x100482f8a584   1a4  f90017ee       str x14, [sp, #40]
0x100482f8a588   1a8  f901fbef       str x15, [sp, #1008]
0x100482f8a58c   1ac  f90247f4       str x20, [sp, #1160]
0x100482f8a590   1b0  aa0c03e0       mov x0, x12
0x100482f8a594   1b4  aa1303e4       mov x4, x19
0x100482f8a598   1b8  97fc0c39       bl #-0xfcf1c (addr 0x100482e8d67c)
0x100482f8a59c   1bc  f94023e6       ldr x6, [sp, #64]
0x100482f8a5a0   1c0  9100e0c8       add x8, x6, #0x38 (56)
0x100482f8a5a4   1c4  f94287e9       ldr x9, [sp, #1288]
0x100482f8a5a8   1c8  b828693f       str wzr, [x9, x8]
0x100482f8a5ac   1cc  f9424fea       ldr x10, [sp, #1176]
0x100482f8a5b0   1d0  11028142       add w2, w10, #0xa0 (160)
0x100482f8a5b4   1d4  9101f0cb       add x11, x6, #0x7c (124)
0x100482f8a5b8   1d8  b86b692b       ldr w11, [x9, x11]
0x100482f8a5bc   1dc  910200cc       add x12, x6, #0x80 (128)
0x100482f8a5c0   1e0  b86c692c       ldr w12, [x9, x12]
0x100482f8a5c4   1e4  0b0c096c       add w12, w11, w12, lsl #2
0x100482f8a5c8   1e8  f94017ed       ldr x13, [sp, #40]
0x100482f8a5cc   1ec  b86d692e       ldr w14, [x9, x13]
0x100482f8a5d0   1f0  f941ffef       ldr x15, [sp, #1016]
0x100482f8a5d4   1f4  b86f6933       ldr w19, [x9, x15]
0x100482f8a5d8   1f8  1100c140       add w0, w10, #0x30 (48)
0x100482f8a5dc   1fc  f9028fe8       str x8, [sp, #1304]
0x100482f8a5e0   200  f90267e2       str x2, [sp, #1224]
0x100482f8a5e4   204  f90253eb       str x11, [sp, #1184]
0x100482f8a5e8   208  f90257ec       str x12, [sp, #1192]
0x100482f8a5ec   20c  f9027fee       str x14, [sp, #1272]
0x100482f8a5f0   210  f9027bf3       str x19, [sp, #1264]
0x100482f8a5f4   214  f9026fe0       str x0, [sp, #1240]
0x100482f8a5f8   218  aa0b03f5       mov x21, x11
0x100482f8a5fc   21c  d2800014       movz x20, #0x0
0x100482f8a600   220  fd424be3       ldr d3, [sp, #1168]
0x100482f8a604   224  f8520356       ldur x22, [x26, #-224]
0x100482f8a608   228  eb3663ff       cmp sp, x22
0x100482f8a60c   22c  5400ce09       b.ls #+0x19c0 (addr 0x100482f8bfcc)
0x100482f8a610   230  6b0c02bf       cmp w21, w12
0x100482f8a614   234  54000120       b.eq #+0x24 (addr 0x100482f8a638)
0x100482f8a618   238  b8756936       ldr w22, [x9, x21]
0x100482f8a61c   23c  110012b5       add w21, w21, #0x4 (4)
0x100482f8a620   240  6b1601df       cmp w14, w22
0x100482f8a624   244  54ffff09       b.ls #-0x20 (addr 0x100482f8a604)
0x100482f8a628   248  0b160a76       add w22, w19, w22, lsl #2
0x100482f8a62c   24c  bc766923       ldr s3, [x9, x22]
0x100482f8a630   250  d2800036       movz x22, #0x1
0x100482f8a634   254  14000003       b #+0xc (addr 0x100482f8a640)
0x100482f8a638   258  d2800016       movz x22, #0x0
0x100482f8a63c   25c  aa0c03f5       mov x21, x12
0x100482f8a640   260  fd024be3       str d3, [sp, #1168]
0x100482f8a644   264  f90283f5       str x21, [sp, #1280]
0x100482f8a648   268  710006df       cmp w22, #0x1 (1)
0x100482f8a64c   26c  540004a1       b.ne #+0x94 (addr 0x100482f8a6e0)
0x100482f8a650   270  9100c0d6       add x22, x6, #0x30 (48)
0x100482f8a654   274  b8766936       ldr w22, [x9, x22]
0x100482f8a658   278  6b16029f       cmp w20, w22
0x100482f8a65c   27c  54000261       b.ne #+0x4c (addr 0x100482f8a6a8)
0x100482f8a660   280  d2800023       movz x3, #0x1
0x100482f8a664   284  f90277f4       str x20, [sp, #1256]
0x100482f8a668   288  f9429be7       ldr x7, [sp, #1328]
0x100482f8a66c   28c  aa1403e2       mov x2, x20
0x100482f8a670   290  97fc0c04       bl #-0xfcff0 (addr 0x100482e8d680)
0x100482f8a674   294  f94287e9       ldr x9, [sp, #1288]
0x100482f8a678   298  f94023e6       ldr x6, [sp, #64]
0x100482f8a67c   29c  f941ffef       ldr x15, [sp, #1016]
0x100482f8a680   2a0  f94017ed       ldr x13, [sp, #40]
0x100482f8a684   2a4  f9428fe8       ldr x8, [sp, #1304]
0x100482f8a688   2a8  f94257ec       ldr x12, [sp, #1192]
0x100482f8a68c   2ac  f9424fea       ldr x10, [sp, #1176]
0x100482f8a690   2b0  fd424be3       ldr d3, [sp, #1168]
0x100482f8a694   2b4  f94283f5       ldr x21, [sp, #1280]
0x100482f8a698   2b8  f94277f4       ldr x20, [sp, #1256]
0x100482f8a69c   2bc  f9426fe0       ldr x0, [sp, #1240]
0x100482f8a6a0   2c0  f9427bf3       ldr x19, [sp, #1264]
0x100482f8a6a4   2c4  f9427fee       ldr x14, [sp, #1272]
0x100482f8a6a8   2c8  1100068b       add w11, w20, #0x1 (1)
0x100482f8a6ac   2cc  aa0903f0       mov x16, x9
0x100482f8a6b0   2d0  aa0803e9       mov x9, x8
0x100482f8a6b4   2d4  aa1003e8       mov x8, x16
0x100482f8a6b8   2d8  b829690b       str w11, [x8, x9]
0x100482f8a6bc   2dc  9100d0d6       add x22, x6, #0x34 (52)
0x100482f8a6c0   2e0  b8766916       ldr w22, [x8, x22]
0x100482f8a6c4   2e4  0b140ad4       add w20, w22, w20, lsl #2
0x100482f8a6c8   2e8  bc346903       str s3, [x8, x20]
0x100482f8a6cc   2ec  aa0903f0       mov x16, x9
0x100482f8a6d0   2f0  aa0803e9       mov x9, x8
0x100482f8a6d4   2f4  aa1003e8       mov x8, x16
0x100482f8a6d8   2f8  aa0b03f4       mov x20, x11
0x100482f8a6dc   2fc  17ffffca       b #-0xd8 (addr 0x100482f8a604)
0x100482f8a6e0   300  910110cb       add x11, x6, #0x44 (68)
0x100482f8a6e4   304  b82b693f       str wzr, [x9, x11]
0x100482f8a6e8   308  f94247ee       ldr x14, [sp, #1160]
0x100482f8a6ec   30c  b86e6933       ldr w19, [x9, x14]
0x100482f8a6f0   310  f941fbf4       ldr x20, [sp, #1008]
0x100482f8a6f4   314  b8746935       ldr w21, [x9, x20]
0x100482f8a6f8   318  1100f140       add w0, w10, #0x3c (60)
0x100482f8a6fc   31c  f9027feb       str x11, [sp, #1272]
0x100482f8a700   320  f9026ff3       str x19, [sp, #1240]
0x100482f8a704   324  f90273f5       str x21, [sp, #1248]
0x100482f8a708   328  f90277e0       str x0, [sp, #1256]
0x100482f8a70c   32c  aa0c03f6       mov x22, x12
0x100482f8a710   330  f94253ec       ldr x12, [sp, #1184]
0x100482f8a714   334  d2800002       movz x2, #0x0
0x100482f8a718   338  f8520357       ldur x23, [x26, #-224]
0x100482f8a71c   33c  eb3763ff       cmp sp, x23
0x100482f8a720   340  5400c7a9       b.ls #+0x18f4 (addr 0x100482f8c014)
0x100482f8a724   344  6b16019f       cmp w12, w22
0x100482f8a728   348  54000120       b.eq #+0x24 (addr 0x100482f8a74c)
0x100482f8a72c   34c  b86c6937       ldr w23, [x9, x12]
0x100482f8a730   350  1100118c       add w12, w12, #0x4 (4)
0x100482f8a734   354  6b17027f       cmp w19, w23
0x100482f8a738   358  54ffff09       b.ls #-0x20 (addr 0x100482f8a718)
0x100482f8a73c   35c  0b170ab7       add w23, w21, w23, lsl #2
0x100482f8a740   360  bc776923       ldr s3, [x9, x23]
0x100482f8a744   364  d2800037       movz x23, #0x1
0x100482f8a748   368  14000003       b #+0xc (addr 0x100482f8a754)
0x100482f8a74c   36c  d2800017       movz x23, #0x0
0x100482f8a750   370  aa1603ec       mov x12, x22
0x100482f8a754   374  fd024be3       str d3, [sp, #1168]
0x100482f8a758   378  f9027bec       str x12, [sp, #1264]
0x100482f8a75c   37c  710006ff       cmp w23, #0x1 (1)
0x100482f8a760   380  540003e1       b.ne #+0x7c (addr 0x100482f8a7dc)
0x100482f8a764   384  9100f0d7       add x23, x6, #0x3c (60)
0x100482f8a768   388  b8776937       ldr w23, [x9, x23]
0x100482f8a76c   38c  6b17005f       cmp w2, w23
0x100482f8a770   390  54000261       b.ne #+0x4c (addr 0x100482f8a7bc)
0x100482f8a774   394  f90283e2       str x2, [sp, #1280]
0x100482f8a778   398  f9429be7       ldr x7, [sp, #1328]
0x100482f8a77c   39c  d2800023       movz x3, #0x1
0x100482f8a780   3a0  97fc0bc0       bl #-0xfd100 (addr 0x100482e8d680)
0x100482f8a784   3a4  f94287e9       ldr x9, [sp, #1288]
0x100482f8a788   3a8  f94023e6       ldr x6, [sp, #64]
0x100482f8a78c   3ac  f941fbf4       ldr x20, [sp, #1008]
0x100482f8a790   3b0  f94247ee       ldr x14, [sp, #1160]
0x100482f8a794   3b4  f9428fe8       ldr x8, [sp, #1304]
0x100482f8a798   3b8  f94257f6       ldr x22, [sp, #1192]
0x100482f8a79c   3bc  f9424fea       ldr x10, [sp, #1176]
0x100482f8a7a0   3c0  fd424be3       ldr d3, [sp, #1168]
0x100482f8a7a4   3c4  f9427bec       ldr x12, [sp, #1264]
0x100482f8a7a8   3c8  f94283e2       ldr x2, [sp, #1280]
0x100482f8a7ac   3cc  f9427feb       ldr x11, [sp, #1272]
0x100482f8a7b0   3d0  f94277e0       ldr x0, [sp, #1256]
0x100482f8a7b4   3d4  f94273f5       ldr x21, [sp, #1248]
0x100482f8a7b8   3d8  f9426ff3       ldr x19, [sp, #1240]
0x100482f8a7bc   3dc  1100044d       add w13, w2, #0x1 (1)
0x100482f8a7c0   3e0  b82b692d       str w13, [x9, x11]
0x100482f8a7c4   3e4  910100cf       add x15, x6, #0x40 (64)
0x100482f8a7c8   3e8  b86f692f       ldr w15, [x9, x15]
0x100482f8a7cc   3ec  0b0209ef       add w15, w15, w2, lsl #2
0x100482f8a7d0   3f0  bc2f6923       str s3, [x9, x15]
0x100482f8a7d4   3f4  aa0d03e2       mov x2, x13
0x100482f8a7d8   3f8  17ffffd0       b #-0xc0 (addr 0x100482f8a718)
0x100482f8a7dc   3fc  910140cb       add x11, x6, #0x50 (80)
0x100482f8a7e0   400  b82b693f       str wzr, [x9, x11]
0x100482f8a7e4   404  910080cc       add x12, x6, #0x20 (32)
0x100482f8a7e8   408  b86c692d       ldr w13, [x9, x12]
0x100482f8a7ec   40c  910070cf       add x15, x6, #0x1c (28)
0x100482f8a7f0   410  b86f6933       ldr w19, [x9, x15]
0x100482f8a7f4   414  11012140       add w0, w10, #0x48 (72)
0x100482f8a7f8   418  f9027feb       str x11, [sp, #1272]
0x100482f8a7fc   41c  f90013ec       str x12, [sp, #32]
0x100482f8a800   420  f90273ed       str x13, [sp, #1248]
0x100482f8a804   424  f90007ef       str x15, [sp, #8]
0x100482f8a808   428  f9026ff3       str x19, [sp, #1240]
0x100482f8a80c   42c  f9027be0       str x0, [sp, #1264]
0x100482f8a810   430  f94253f5       ldr x21, [sp, #1184]
0x100482f8a814   434  d2800002       movz x2, #0x0
0x100482f8a818   438  f8520357       ldur x23, [x26, #-224]
0x100482f8a81c   43c  eb3763ff       cmp sp, x23
0x100482f8a820   440  5400c209       b.ls #+0x1840 (addr 0x100482f8c060)
0x100482f8a824   444  6b1602bf       cmp w21, w22
0x100482f8a828   448  54000120       b.eq #+0x24 (addr 0x100482f8a84c)
0x100482f8a82c   44c  b8756937       ldr w23, [x9, x21]
0x100482f8a830   450  110012b5       add w21, w21, #0x4 (4)
0x100482f8a834   454  6b1701bf       cmp w13, w23
0x100482f8a838   458  54ffff09       b.ls #-0x20 (addr 0x100482f8a818)
0x100482f8a83c   45c  0b170a77       add w23, w19, w23, lsl #2
0x100482f8a840   460  bc776923       ldr s3, [x9, x23]
0x100482f8a844   464  d2800037       movz x23, #0x1
0x100482f8a848   468  14000003       b #+0xc (addr 0x100482f8a854)
0x100482f8a84c   46c  d2800017       movz x23, #0x0
0x100482f8a850   470  aa1603f5       mov x21, x22
0x100482f8a854   474  fd024be3       str d3, [sp, #1168]
0x100482f8a858   478  f9025bf5       str x21, [sp, #1200]
0x100482f8a85c   47c  710006ff       cmp w23, #0x1 (1)
0x100482f8a860   480  540003c1       b.ne #+0x78 (addr 0x100482f8a8d8)
0x100482f8a864   484  910120d7       add x23, x6, #0x48 (72)
0x100482f8a868   488  b8776937       ldr w23, [x9, x23]
0x100482f8a86c   48c  6b17005f       cmp w2, w23
0x100482f8a870   490  54000241       b.ne #+0x48 (addr 0x100482f8a8b8)
0x100482f8a874   494  f90283e2       str x2, [sp, #1280]
0x100482f8a878   498  f9429be7       ldr x7, [sp, #1328]
0x100482f8a87c   49c  d2800023       movz x3, #0x1
0x100482f8a880   4a0  97fc0b80       bl #-0xfd200 (addr 0x100482e8d680)
0x100482f8a884   4a4  f94287e9       ldr x9, [sp, #1288]
0x100482f8a888   4a8  f94023e6       ldr x6, [sp, #64]
0x100482f8a88c   4ac  f94007ef       ldr x15, [sp, #8]
0x100482f8a890   4b0  f94013ec       ldr x12, [sp, #32]
0x100482f8a894   4b4  f9427feb       ldr x11, [sp, #1272]
0x100482f8a898   4b8  f94257f6       ldr x22, [sp, #1192]
0x100482f8a89c   4bc  fd424be3       ldr d3, [sp, #1168]
0x100482f8a8a0   4c0  f9424fea       ldr x10, [sp, #1176]
0x100482f8a8a4   4c4  f9425bf5       ldr x21, [sp, #1200]
0x100482f8a8a8   4c8  f94283e2       ldr x2, [sp, #1280]
0x100482f8a8ac   4cc  f9427be0       ldr x0, [sp, #1264]
0x100482f8a8b0   4d0  f9426ff3       ldr x19, [sp, #1240]
0x100482f8a8b4   4d4  f94273ed       ldr x13, [sp, #1248]
0x100482f8a8b8   4d8  11000448       add w8, w2, #0x1 (1)
0x100482f8a8bc   4dc  b82b6928       str w8, [x9, x11]
0x100482f8a8c0   4e0  910130ce       add x14, x6, #0x4c (76)
0x100482f8a8c4   4e4  b86e692e       ldr w14, [x9, x14]
0x100482f8a8c8   4e8  0b0209ce       add w14, w14, w2, lsl #2
0x100482f8a8cc   4ec  bc2e6923       str s3, [x9, x14]
0x100482f8a8d0   4f0  aa0803e2       mov x2, x8
0x100482f8a8d4   4f4  17ffffd1       b #-0xbc (addr 0x100482f8a818)
0x100482f8a8d8   4f8  910170c8       add x8, x6, #0x5c (92)
0x100482f8a8dc   4fc  b828693f       str wzr, [x9, x8]
0x100482f8a8e0   500  9100b0cd       add x13, x6, #0x2c (44)
0x100482f8a8e4   504  b86d692e       ldr w14, [x9, x13]
0x100482f8a8e8   508  9100a0d3       add x19, x6, #0x28 (40)
0x100482f8a8ec   50c  b8736934       ldr w20, [x9, x19]
0x100482f8a8f0   510  11015140       add w0, w10, #0x54 (84)
0x100482f8a8f4   514  f9027be8       str x8, [sp, #1264]
0x100482f8a8f8   518  f90203ed       str x13, [sp, #1024]
0x100482f8a8fc   51c  f9026bee       str x14, [sp, #1232]
0x100482f8a900   520  f9000bf3       str x19, [sp, #16]
0x100482f8a904   524  f90273f4       str x20, [sp, #1248]
0x100482f8a908   528  f90277e0       str x0, [sp, #1256]
0x100482f8a90c   52c  d2800002       movz x2, #0x0
0x100482f8a910   530  f94253ea       ldr x10, [sp, #1184]
0x100482f8a914   534  aa1603f5       mov x21, x22
0x100482f8a918   538  14000004       b #+0x10 (addr 0x100482f8a928)
0x100482f8a91c   53c  aa0903f0       mov x16, x9
0x100482f8a920   540  aa0803e9       mov x9, x8
0x100482f8a924   544  aa1003e8       mov x8, x16
0x100482f8a928   548  f8520356       ldur x22, [x26, #-224]
0x100482f8a92c   54c  eb3663ff       cmp sp, x22
0x100482f8a930   550  5400bbc9       b.ls #+0x1778 (addr 0x100482f8c0a8)
0x100482f8a934   554  6b15015f       cmp w10, w21
0x100482f8a938   558  540001a0       b.eq #+0x34 (addr 0x100482f8a96c)
0x100482f8a93c   55c  b86a6936       ldr w22, [x9, x10]
0x100482f8a940   560  1100114a       add w10, w10, #0x4 (4)
0x100482f8a944   564  6b1601df       cmp w14, w22
0x100482f8a948   568  540000a9       b.ls #+0x14 (addr 0x100482f8a95c)
0x100482f8a94c   56c  0b160a96       add w22, w20, w22, lsl #2
0x100482f8a950   570  bc766923       ldr s3, [x9, x22]
0x100482f8a954   574  d2800036       movz x22, #0x1
0x100482f8a958   578  14000007       b #+0x1c (addr 0x100482f8a974)
0x100482f8a95c   57c  aa0803f0       mov x16, x8
0x100482f8a960   580  aa0903e8       mov x8, x9
0x100482f8a964   584  aa1003e9       mov x9, x16
0x100482f8a968   588  17ffffed       b #-0x4c (addr 0x100482f8a91c)
0x100482f8a96c   58c  d2800016       movz x22, #0x0
0x100482f8a970   590  aa1503ea       mov x10, x21
0x100482f8a974   594  f90253ea       str x10, [sp, #1184]
0x100482f8a978   598  fd024be3       str d3, [sp, #1168]
0x100482f8a97c   59c  710006df       cmp w22, #0x1 (1)
0x100482f8a980   5a0  54000421       b.ne #+0x84 (addr 0x100482f8aa04)
0x100482f8a984   5a4  910150d6       add x22, x6, #0x54 (84)
0x100482f8a988   5a8  b8766936       ldr w22, [x9, x22]
0x100482f8a98c   5ac  6b16005f       cmp w2, w22
0x100482f8a990   5b0  54000241       b.ne #+0x48 (addr 0x100482f8a9d8)
0x100482f8a994   5b4  f90283e2       str x2, [sp, #1280]
0x100482f8a998   5b8  f9429be7       ldr x7, [sp, #1328]
0x100482f8a99c   5bc  d2800023       movz x3, #0x1
0x100482f8a9a0   5c0  97fc0b38       bl #-0xfd320 (addr 0x100482e8d680)
0x100482f8a9a4   5c4  f94287e9       ldr x9, [sp, #1288]
0x100482f8a9a8   5c8  f94023e6       ldr x6, [sp, #64]
0x100482f8a9ac   5cc  f9400bf3       ldr x19, [sp, #16]
0x100482f8a9b0   5d0  f94203ed       ldr x13, [sp, #1024]
0x100482f8a9b4   5d4  f94283e2       ldr x2, [sp, #1280]
0x100482f8a9b8   5d8  f9427feb       ldr x11, [sp, #1272]
0x100482f8a9bc   5dc  f94253ea       ldr x10, [sp, #1184]
0x100482f8a9c0   5e0  fd424be3       ldr d3, [sp, #1168]
0x100482f8a9c4   5e4  f9427be8       ldr x8, [sp, #1264]
0x100482f8a9c8   5e8  f94277e0       ldr x0, [sp, #1256]
0x100482f8a9cc   5ec  f94257f5       ldr x21, [sp, #1192]
0x100482f8a9d0   5f0  f94273f4       ldr x20, [sp, #1248]
0x100482f8a9d4   5f4  f9426bee       ldr x14, [sp, #1232]
0x100482f8a9d8   5f8  1100044c       add w12, w2, #0x1 (1)
0x100482f8a9dc   5fc  aa0903f0       mov x16, x9
0x100482f8a9e0   600  aa0803e9       mov x9, x8
0x100482f8a9e4   604  aa1003e8       mov x8, x16
0x100482f8a9e8   608  b829690c       str w12, [x8, x9]
0x100482f8a9ec   60c  910160cf       add x15, x6, #0x58 (88)
0x100482f8a9f0   610  b86f690f       ldr w15, [x8, x15]
0x100482f8a9f4   614  0b0209ef       add w15, w15, w2, lsl #2
0x100482f8a9f8   618  bc2f6903       str s3, [x8, x15]
0x100482f8a9fc   61c  aa0c03e2       mov x2, x12
0x100482f8aa00   620  17ffffc7       b #-0xe4 (addr 0x100482f8a91c)
0x100482f8aa04   624  f9428fe8       ldr x8, [sp, #1304]
0x100482f8aa08   628  b8686928       ldr w8, [x9, x8]
0x100482f8aa0c   62c  9100c0ca       add x10, x6, #0x30 (48)
0x100482f8aa10   630  3cea6922       ldr q2, [x9, x10]
0x100482f8aa14   634  3ce66923       ldr q3, [x9, x6]
0x100482f8aa18   638  3caa6923       str q3, [x9, x10]
0x100482f8aa1c   63c  3ca66922       str q2, [x9, x6]
0x100482f8aa20   640  910100ca       add x10, x6, #0x40 (64)
0x100482f8aa24   644  3cea6922       ldr q2, [x9, x10]
0x100482f8aa28   648  f941fbec       ldr x12, [sp, #1008]
0x100482f8aa2c   64c  3cec6924       ldr q4, [x9, x12]
0x100482f8aa30   650  3caa6924       str q4, [x9, x10]
0x100482f8aa34   654  b86c692a       ldr w10, [x9, x12]
0x100482f8aa38   658  3cac6922       str q2, [x9, x12]
0x100482f8aa3c   65c  910150ce       add x14, x6, #0x54 (84)
0x100482f8aa40   660  f86e692e       ldr x14, [x9, x14]
0x100482f8aa44   664  b86b692f       ldr w15, [x9, x11]
0x100482f8aa48   668  f94013f4       ldr x20, [sp, #32]
0x100482f8aa4c   66c  3cf46922       ldr q2, [x9, x20]
0x100482f8aa50   670  3cab6922       str q2, [x9, x11]
0x100482f8aa54   674  aa0d03eb       mov x11, x13
0x100482f8aa58   678  b82b6922       str w2, [x9, x11]
0x100482f8aa5c   67c  b874692d       ldr w13, [x9, x20]
0x100482f8aa60   680  b834692f       str w15, [x9, x20]
0x100482f8aa64   684  910090cf       add x15, x6, #0x24 (36)
0x100482f8aa68   688  f82f692e       str x14, [x9, x15]
0x100482f8aa6c   68c  f9028fe8       str x8, [sp, #1304]
0x100482f8aa70   690  f90277ea       str x10, [sp, #1256]
0x100482f8aa74   694  35000108       cbnz w8, #+0x20 (addr 0x100482f8aa94)
0x100482f8aa78   698  f94293e4       ldr x4, [sp, #1312]
0x100482f8aa7c   69c  11090086       add w6, w4, #0x240 (576)
0x100482f8aa80   6a0  f94297ee       ldr x14, [sp, #1320]
0x100482f8aa84   6a4  b90001c6       str w6, [x14]
0x100482f8aa88   6a8  910003bf       mov sp, fp
0x100482f8aa8c   6ac  a8c17bfd       ldp fp, lr, [sp], #16
0x100482f8aa90   6b0  d65f03c0       ret
0x100482f8aa94   6b4  0e143c4e       mov w14, v2.s[2]
0x100482f8aa98   6b8  0e1c3c8f       mov w15, v4.s[3]
0x100482f8aa9c   6bc  0e0c3c75       mov w21, v3.s[1]
0x100482f8aaa0   6c0  0e1c3c56       mov w22, v2.s[3]
0x100482f8aaa4   6c4  0e0c3c97       mov w23, v4.s[1]
0x100482f8aaa8   6c8  0e143c78       mov w24, v3.s[2]
0x100482f8aaac   6cc  6b1802ff       cmp w23, w24
0x100482f8aab0   6d0  1a9832f9       csel w25, w23, w24, lo
0x100482f8aab4   6d4  6b1901bf       cmp w13, w25
0x100482f8aab8   6d8  1a9931b7       csel w23, w13, w25, lo
0x100482f8aabc   6dc  6b1702df       cmp w22, w23
0x100482f8aac0   6e0  1a9732cd       csel w13, w22, w23, lo
0x100482f8aac4   6e4  910290d6       add x22, x6, #0xa4 (164)
0x100482f8aac8   6e8  bc766922       ldr s2, [x9, x22]
0x100482f8aacc   6ec  1e220842       fmul s2, s2, s2
0x100482f8aad0   6f0  4e040443       dup v3.4s, v2.s[0]
0x100482f8aad4   6f4  f9428bf6       ldr x22, [sp, #1296]
0x100482f8aad8   6f8  bc766924       ldr s4, [x9, x22]
0x100482f8aadc   6fc  1e240884       fmul s4, s4, s4
0x100482f8aae0   700  4e040485       dup v5.4s, v4.s[0]
0x100482f8aae4   704  f90283ee       str x14, [sp, #1280]
0x100482f8aae8   708  f9027bef       str x15, [sp, #1264]
0x100482f8aaec   70c  f90273f5       str x21, [sp, #1248]
0x100482f8aaf0   710  f9026fed       str x13, [sp, #1240]
0x100482f8aaf4   714  fd0217e2       str d2, [sp, #1064]
0x100482f8aaf8   718  3d80dfe3       str q3, [sp, #880]
0x100482f8aafc   71c  fd021be4       str d4, [sp, #1072]
0x100482f8ab00   720  3d80e3e5       str q5, [sp, #896]
0x100482f8ab04   724  f94017f6       ldr x22, [sp, #40]
0x100482f8ab08   728  1e2e1008       fmov s8, #0x70 (1.0000)
0x100482f8ab0c   72c  3dc0e7e7       ldr q7, [sp, #912]
0x100482f8ab10   730  d2800042       movz x2, #0x2
0x100482f8ab14   734  d2800020       movz x0, #0x1
0x100482f8ab18   738  d2800001       movz x1, #0x0
0x100482f8ab1c   73c  f9400ffc       ldr x28, [sp, #24]
0x100482f8ab20   740  aa1303fb       mov cp, x19
0x100482f8ab24   744  f94007f9       ldr x25, [sp, #8]
0x100482f8ab28   748  f941fff8       ldr x24, [sp, #1016]
0x100482f8ab2c   74c  f94247f7       ldr x23, [sp, #1160]
0x100482f8ab30   750  aa0103f3       mov x19, x1
0x100482f8ab34   754  f8520343       ldur x3, [x26, #-224]
0x100482f8ab38   758  eb2363ff       cmp sp, x3
0x100482f8ab3c   75c  5400ada9       b.ls #+0x15b4 (addr 0x100482f8c0f0)
0x100482f8ab40   760  b8766923       ldr w3, [x9, x22]
0x100482f8ab44   764  f90137e3       str x3, [sp, #616]
0x100482f8ab48   768  6b13007f       cmp w3, w19
0x100482f8ab4c   76c  54009fe9       b.ls #+0x13fc (addr 0x100482f8bf48)
0x100482f8ab50   770  b8776924       ldr w4, [x9, x23]
0x100482f8ab54   774  f9003fe4       str x4, [sp, #120]
0x100482f8ab58   778  6b13009f       cmp w4, w19
0x100482f8ab5c   77c  54009f69       b.ls #+0x13ec (addr 0x100482f8bf48)
0x100482f8ab60   780  b8746925       ldr w5, [x9, x20]
0x100482f8ab64   784  f9003be5       str x5, [sp, #112]
0x100482f8ab68   788  6b1300bf       cmp w5, w19
0x100482f8ab6c   78c  54009ee9       b.ls #+0x13dc (addr 0x100482f8bf48)
0x100482f8ab70   790  b86b6927       ldr w7, [x9, x11]
0x100482f8ab74   794  f90043e7       str x7, [sp, #128]
0x100482f8ab78   798  6b1300ff       cmp w7, w19
0x100482f8ab7c   79c  54009e69       b.ls #+0x13cc (addr 0x100482f8bf48)
0x100482f8ab80   7a0  b8786928       ldr w8, [x9, x24]
0x100482f8ab84   7a4  531e766a       lsl w10, w19, #2
0x100482f8ab88   7a8  0b0a010b       add w11, w8, w10
0x100482f8ab8c   7ac  bc6b6929       ldr s9, [x9, x11]
0x100482f8ab90   7b0  b86c692b       ldr w11, [x9, x12]
0x100482f8ab94   7b4  f9013fe8       str x8, [sp, #632]
0x100482f8ab98   7b8  0b0a0168       add w8, w11, w10
0x100482f8ab9c   7bc  bc68692a       ldr s10, [x9, x8]
0x100482f8aba0   7c0  b8796928       ldr w8, [x9, x25]
0x100482f8aba4   7c4  f90143eb       str x11, [sp, #640]
0x100482f8aba8   7c8  0b0a010b       add w11, w8, w10
0x100482f8abac   7cc  bc6b692b       ldr s11, [x9, x11]
0x100482f8abb0   7d0  b87b692b       ldr w11, [x9, x27]
0x100482f8abb4   7d4  f9014be8       str x8, [sp, #656]
0x100482f8abb8   7d8  0b0a0168       add w8, w11, w10
0x100482f8abbc   7dc  f9027fea       str x10, [sp, #1272]
0x100482f8abc0   7e0  bc68692c       ldr s12, [x9, x8]
0x100482f8abc4   7e4  f94293ea       ldr x10, [sp, #1312]
0x100482f8abc8   7e8  91003148       add x8, x10, #0xc (12)
0x100482f8abcc   7ec  bc28692c       str s12, [x9, x8]
0x100482f8abd0   7f0  91002148       add x8, x10, #0x8 (8)
0x100482f8abd4   7f4  bc28692b       str s11, [x9, x8]
0x100482f8abd8   7f8  91001148       add x8, x10, #0x4 (4)
0x100482f8abdc   7fc  bc28692a       str s10, [x9, x8]
0x100482f8abe0   800  bc2a6929       str s9, [x9, x10]
0x100482f8abe4   804  9100a148       add x8, x10, #0x28 (40)
0x100482f8abe8   808  b828693f       str wzr, [x9, x8]
0x100482f8abec   80c  f90253e8       str x8, [sp, #1184]
0x100482f8abf0   810  91008148       add x8, x10, #0x20 (32)
0x100482f8abf4   814  f828693f       str xzr, [x9, x8]
0x100482f8abf8   818  6f00e40b       movi v11.2d, #0x0
0x100482f8abfc   81c  f90257e8       str x8, [sp, #1192]
0x100482f8ac00   820  91004148       add x8, x10, #0x10 (16)
0x100482f8ac04   824  3ca8692b       str q11, [x9, x8]
0x100482f8ac08   828  f9025be8       str x8, [sp, #1200]
0x100482f8ac0c   82c  910220c8       add x8, x6, #0x88 (136)
0x100482f8ac10   830  b8686928       ldr w8, [x9, x8]
0x100482f8ac14   834  f90027e8       str x8, [sp, #72]
0x100482f8ac18   838  910230c8       add x8, x6, #0x8c (140)
0x100482f8ac1c   83c  b8686928       ldr w8, [x9, x8]
0x100482f8ac20   840  bc7c692b       ldr s11, [x9, x28]
0x100482f8ac24   844  11020146       add w6, w10, #0x80 (128)
0x100482f8ac28   848  f9028bf3       str x19, [sp, #1296]
0x100482f8ac2c   84c  fd020fe9       str d9, [sp, #1048]
0x100482f8ac30   850  fd0213ea       str d10, [sp, #1056]
0x100482f8ac34   854  f90147eb       str x11, [sp, #648]
0x100482f8ac38   858  f9024be8       str x8, [sp, #1168]
0x100482f8ac3c   85c  fd024feb       str d11, [sp, #1176]
0x100482f8ac40   860  f9026be6       str x6, [sp, #1232]
0x100482f8ac44   864  f9429be0       ldr x0, [sp, #1328]
0x100482f8ac48   868  aa0603e2       mov x2, x6
0x100482f8ac4c   86c  aa0103e3       mov x3, x1
0x100482f8ac50   870  d2803804       movz x4, #0x1c0
0x100482f8ac54   874  5800c570       ldr x16, pc+6316 (addr 0x0000100482f8c500)
0x100482f8ac58   878  10000068       adr x8, #+0xc (addr 0x100482f8ac64)
0x100482f8ac5c   87c  a9027748       stp x8, fp, [x26, #32]
0x100482f8ac60   880  d63f0200       blr x16
0x100482f8ac64   884  f900175f       str xzr, [x26, #40]
0x100482f8ac68   888  6a00001f       tst w0, w0
0x100482f8ac6c   88c  5400c420       b.eq #+0x1884 (addr 0x100482f8c4f0)
0x100482f8ac70   890  f9424be6       ldr x6, [sp, #1168]
0x100482f8ac74   894  710000df       cmp w6, #0x0 (0)
0x100482f8ac78   898  9a9f07e8       cset x8, ne
0x100482f8ac7c   89c  4b0800c6       sub w6, w6, w8
0x100482f8ac80   8a0  fd4213e2       ldr d2, [sp, #1056]
0x100482f8ac84   8a4  fd424fe3       ldr d3, [sp, #1176]
0x100482f8ac88   8a8  1e230844       fmul s4, s2, s3
0x100482f8ac8c   8ac  1e242080       fcmp s4, s4
0x100482f8ac90   8b0  1e241de4       fcsel s4, s15, s4, ne
0x100482f8ac94   8b4  1e202088       fcmp s4, #0.0
0x100482f8ac98   8b8  1e2fcc84       fcsel s4, s4, s15, gt
0x100482f8ac9c   8bc  1e22c085       fcvt d5, s4
0x100482f8aca0   8c0  1e65c0a6       frintz d6, d5
0x100482f8aca4   8c4  1e7900c8       fcvtzu w8, d6
0x100482f8aca8   8c8  1e630107       ucvtf d7, w8
0x100482f8acac   8cc  1e6720c0       fcmp d6, d7
0x100482f8acb0   8d0  5400a581       b.ne #+0x14b0 (addr 0x100482f8c160)
0x100482f8acb4   8d4  6b0800df       cmp w6, w8
0x100482f8acb8   8d8  1a8830c9       csel w9, w6, w8, lo
0x100482f8acbc   8dc  52a9f010       movz w16, #0x4f800000
0x100482f8acc0   8e0  1e270205       fmov s5, w16
0x100482f8acc4   8e4  1e252080       fcmp s4, s5
0x100482f8acc8   8e8  1a9f3128       csel w8, w9, wzr, lo
0x100482f8accc   8ec  7100011f       cmp w8, #0x0 (0)
0x100482f8acd0   8f0  9a9f07e9       cset x9, ne
0x100482f8acd4   8f4  4b090109       sub w9, w8, w9
0x100482f8acd8   8f8  11000508       add w8, w8, #0x1 (1)
0x100482f8acdc   8fc  6b0800df       cmp w6, w8
0x100482f8ace0   900  1a8830ca       csel w10, w6, w8, lo
0x100482f8ace4   904  f9024bea       str x10, [sp, #1168]
0x100482f8ace8   908  6b09015f       cmp w10, w9
0x100482f8acec   90c  540087a3       b.lo #+0x10f4 (addr 0x100482f8bde0)
0x100482f8acf0   910  f94027e6       ldr x6, [sp, #72]
0x100482f8acf4   914  710000df       cmp w6, #0x0 (0)
0x100482f8acf8   918  9a9f07e8       cset x8, ne
0x100482f8acfc   91c  4b0800c8       sub w8, w6, w8
0x100482f8ad00   920  fd420fe4       ldr d4, [sp, #1048]
0x100482f8ad04   924  1e230883       fmul s3, s4, s3
0x100482f8ad08   928  1e232060       fcmp s3, s3
0x100482f8ad0c   92c  1e231de3       fcsel s3, s15, s3, ne
0x100482f8ad10   930  1e202068       fcmp s3, #0.0
0x100482f8ad14   934  1e2fcc63       fcsel s3, s3, s15, gt
0x100482f8ad18   938  1e22c066       fcvt d6, s3
0x100482f8ad1c   93c  1e65c0c7       frintz d7, d6
0x100482f8ad20   940  1e7900eb       fcvtzu w11, d7
0x100482f8ad24   944  1e630168       ucvtf d8, w11
0x100482f8ad28   948  1e6820e0       fcmp d7, d8
0x100482f8ad2c   94c  5400a2a1       b.ne #+0x1454 (addr 0x100482f8c180)
0x100482f8ad30   950  6b0b011f       cmp w8, w11
0x100482f8ad34   954  1a8b310c       csel w12, w8, w11, lo
0x100482f8ad38   958  1e252060       fcmp s3, s5
0x100482f8ad3c   95c  1a9f318b       csel w11, w12, wzr, lo
0x100482f8ad40   960  7100017f       cmp w11, #0x0 (0)
0x100482f8ad44   964  9a9f07ec       cset x12, ne
0x100482f8ad48   968  4b0c016c       sub w12, w11, w12
0x100482f8ad4c   96c  f9403bee       ldr x14, [sp, #112]
0x100482f8ad50   970  f94043ed       ldr x13, [sp, #128]
0x100482f8ad54   974  6b0d01df       cmp w14, w13
0x100482f8ad58   978  1a8d31cf       csel w15, w14, w13, lo
0x100482f8ad5c   97c  f9403ff3       ldr x19, [sp, #120]
0x100482f8ad60   980  6b0f027f       cmp w19, w15
0x100482f8ad64   984  1a8f3274       csel w20, w19, w15, lo
0x100482f8ad68   988  1100056b       add w11, w11, #0x1 (1)
0x100482f8ad6c   98c  6b0b011f       cmp w8, w11
0x100482f8ad70   990  1a8b310f       csel w15, w8, w11, lo
0x100482f8ad74   994  110005e8       add w8, w15, #0x1 (1)
0x100482f8ad78   998  4e040483       dup v3.4s, v4.s[0]
0x100482f8ad7c   99c  4e040445       dup v5.4s, v2.s[0]
0x100482f8ad80   9a0  f94023eb       ldr x11, [sp, #64]
0x100482f8ad84   9a4  9101916f       add x15, x11, #0x64 (100)
0x100482f8ad88   9a8  f94287f5       ldr x21, [sp, #1288]
0x100482f8ad8c   9ac  b86f6aaf       ldr w15, [x21, x15]
0x100482f8ad90   9b0  9101a176       add x22, x11, #0x68 (104)
0x100482f8ad94   9b4  b8766ab6       ldr w22, [x21, x22]
0x100482f8ad98   9b8  f94293e4       ldr x4, [sp, #1312]
0x100482f8ad9c   9bc  9106c097       add x23, x4, #0x1b0 (432)
0x100482f8ada0   9c0  3cf76aa6       ldr q6, [x21, x23]
0x100482f8ada4   9c4  9105c098       add x24, x4, #0x170 (368)
0x100482f8ada8   9c8  3cf86aa7       ldr q7, [x21, x24]
0x100482f8adac   9cc  9104c099       add x25, x4, #0x130 (304)
0x100482f8adb0   9d0  3cf96aa8       ldr q8, [x21, x25]
0x100482f8adb4   9d4  9103c09b       add cp, x4, #0xf0 (240)
0x100482f8adb8   9d8  3cfb6aa9       ldr q9, [x21, x27]
0x100482f8adbc   9dc  9102c09c       add x28, x4, #0xb0 (176)
0x100482f8adc0   9e0  3cfc6aaa       ldr q10, [x21, x28]
0x100482f8adc4   9e4  9108c080       add x0, x4, #0x230 (560)
0x100482f8adc8   9e8  3ce06aab       ldr q11, [x21, x0]
0x100482f8adcc   9ec  9107c081       add x1, x4, #0x1f0 (496)
0x100482f8add0   9f0  3ce16aac       ldr q12, [x21, x1]
0x100482f8add4   9f4  91068082       add x2, x4, #0x1a0 (416)
0x100482f8add8   9f8  3ce26aad       ldr q13, [x21, x2]
0x100482f8addc   9fc  91058083       add x3, x4, #0x160 (352)
0x100482f8ade0   a00  3ce36aae       ldr q14, [x21, x3]
0x100482f8ade4   a04  91048085       add x5, x4, #0x120 (288)
0x100482f8ade8   a08  3ce56ab0       ldr q16, [x21, x5]
0x100482f8adec   a0c  91038087       add x7, x4, #0xe0 (224)
0x100482f8adf0   a10  3ce76ab1       ldr q17, [x21, x7]
0x100482f8adf4   a14  9102808b       add x11, x4, #0xa0 (160)
0x100482f8adf8   a18  3ceb6ab2       ldr q18, [x21, x11]
0x100482f8adfc   a1c  9108808a       add x10, x4, #0x220 (544)
0x100482f8ae00   a20  3cea6ab3       ldr q19, [x21, x10]
0x100482f8ae04   a24  f9013bf4       str x20, [sp, #624]
0x100482f8ae08   a28  91078094       add x20, x4, #0x1e0 (480)
0x100482f8ae0c   a2c  3cf46ab4       ldr q20, [x21, x20]
0x100482f8ae10   a30  f901e7fc       str x28, [sp, #968]
0x100482f8ae14   a34  9106409c       add x28, x4, #0x190 (400)
0x100482f8ae18   a38  3cfc6ab5       ldr q21, [x21, x28]
0x100482f8ae1c   a3c  f901e3fb       str cp, [sp, #960]
0x100482f8ae20   a40  9105409b       add cp, x4, #0x150 (336)
0x100482f8ae24   a44  3cfb6ab6       ldr q22, [x21, x27]
0x100482f8ae28   a48  f901dff9       str x25, [sp, #952]
0x100482f8ae2c   a4c  91044099       add x25, x4, #0x110 (272)
0x100482f8ae30   a50  3cf96ab7       ldr q23, [x21, x25]
0x100482f8ae34   a54  f901dbf8       str x24, [sp, #944]
0x100482f8ae38   a58  91034098       add x24, x4, #0xd0 (208)
0x100482f8ae3c   a5c  3cf86ab8       ldr q24, [x21, x24]
0x100482f8ae40   a60  f901d7f7       str x23, [sp, #936]
0x100482f8ae44   a64  91024097       add x23, x4, #0x90 (144)
0x100482f8ae48   a68  3cf76ab9       ldr q25, [x21, x23]
0x100482f8ae4c   a6c  f901d3e1       str x1, [sp, #928]
0x100482f8ae50   a70  91084081       add x1, x4, #0x210 (528)
0x100482f8ae54   a74  3ce16aba       ldr q26, [x21, x1]
0x100482f8ae58   a78  f901b7e0       str x0, [sp, #872]
0x100482f8ae5c   a7c  91074080       add x0, x4, #0x1d0 (464)
0x100482f8ae60   a80  3ce06abb       ldr q27, [x21, x0]
0x100482f8ae64   a84  f90197eb       str x11, [sp, #808]
0x100482f8ae68   a88  9106008b       add x11, x4, #0x180 (384)
0x100482f8ae6c   a8c  3ceb6abc       ldr q28, [x21, x11]
0x100482f8ae70   a90  f9019be7       str x7, [sp, #816]
0x100482f8ae74   a94  91050087       add x7, x4, #0x140 (320)
0x100482f8ae78   a98  3ce76aa0       ldr q0, [x21, x7]
0x100482f8ae7c   a9c  f9019fe5       str x5, [sp, #824]
0x100482f8ae80   aa0  91040085       add x5, x4, #0x100 (256)
0x100482f8ae84   aa4  3ce56aa1       ldr q1, [x21, x5]
0x100482f8ae88   aa8  f901b3e3       str x3, [sp, #864]
0x100482f8ae8c   aac  91030083       add x3, x4, #0xc0 (192)
0x100482f8ae90   ab0  3ce36aa2       ldr q2, [x21, x3]
0x100482f8ae94   ab4  f90193e2       str x2, [sp, #800]
0x100482f8ae98   ab8  91020082       add x2, x4, #0x80 (128)
0x100482f8ae9c   abc  3ce26aa4       ldr q4, [x21, x2]
0x100482f8aea0   ac0  f9018bf4       str x20, [sp, #784]
0x100482f8aea4   ac4  91080094       add x20, x4, #0x200 (512)
0x100482f8aea8   ac8  3d80d7e3       str q3, [sp, #848]
0x100482f8aeac   acc  3cf46aa3       ldr q3, [x21, x20]
0x100482f8aeb0   ad0  f9018fea       str x10, [sp, #792]
0x100482f8aeb4   ad4  9107008a       add x10, x4, #0x1c0 (448)
0x100482f8aeb8   ad8  3d80d3e5       str q5, [sp, #832]
0x100482f8aebc   adc  3cea6aa5       ldr q5, [x21, x10]
0x100482f8aec0   ae0  f9002bec       str x12, [sp, #80]
0x100482f8aec4   ae4  f9002fe8       str x8, [sp, #88]
0x100482f8aec8   ae8  f90037ef       str x15, [sp, #104]
0x100482f8aecc   aec  f90033f6       str x22, [sp, #96]
0x100482f8aed0   af0  f90177fc       str x28, [sp, #744]
0x100482f8aed4   af4  f9017bfb       str cp, [sp, #752]
0x100482f8aed8   af8  f9017ff9       str x25, [sp, #760]
0x100482f8aedc   afc  f90183f8       str x24, [sp, #768]
0x100482f8aee0   b00  f90187f7       str x23, [sp, #776]
0x100482f8aee4   b04  f90173e0       str x0, [sp, #736]
0x100482f8aee8   b08  f9015beb       str x11, [sp, #688]
0x100482f8aeec   b0c  f90157ea       str x10, [sp, #680]
0x100482f8aef0   b10  3dc00ffe       ldr q30, [sp, #48]
0x100482f8aef4   b14  3d811ffe       str q30, [sp, #1136]
0x100482f8aef8   b18  b90483ff       str wzr, [sp, #1152]
0x100482f8aefc   b1c  b9046bff       str wzr, [sp, #1128]
0x100482f8af00   b20  b90463ff       str wzr, [sp, #1120]
0x100482f8af04   b24  b9045bff       str wzr, [sp, #1112]
0x100482f8af08   b28  3d8033e8       str q8, [sp, #192]
0x100482f8af0c   b2c  4ea51ca8       mov v8.16b, v5.16b
0x100482f8af10   b30  3d8037e9       str q9, [sp, #208]
0x100482f8af14   b34  4ea31c69       mov v9.16b, v3.16b
0x100482f8af18   b38  3d803bea       str q10, [sp, #224]
0x100482f8af1c   b3c  4ea41c8a       mov v10.16b, v4.16b
0x100482f8af20   b40  3d803feb       str q11, [sp, #240]
0x100482f8af24   b44  4ea21c4b       mov v11.16b, v2.16b
0x100482f8af28   b48  3d802fe7       str q7, [sp, #176]
0x100482f8af2c   b4c  3d802be6       str q6, [sp, #160]
0x100482f8af30   b50  b90453ff       str wzr, [sp, #1104]
0x100482f8af34   b54  1400001f       b #+0x7c (addr 0x100482f8afb0)
0x100482f8af38   b58  f94027e6       ldr x6, [sp, #72]
0x100482f8af3c   b5c  f9402bec       ldr x12, [sp, #80]
0x100482f8af40   b60  f9402fe8       ldr x8, [sp, #88]
0x100482f8af44   b64  f94033f6       ldr x22, [sp, #96]
0x100482f8af48   b68  aa0f03e9       mov x9, x15
0x100482f8af4c   b6c  f94037ef       ldr x15, [sp, #104]
0x100482f8af50   b70  4ea81d12       mov v18.16b, v8.16b
0x100482f8af54   b74  4ea61cc8       mov v8.16b, v6.16b
0x100482f8af58   b78  4ea91d31       mov v17.16b, v9.16b
0x100482f8af5c   b7c  4ea71ce9       mov v9.16b, v7.16b
0x100482f8af60   b80  3d803bec       str q12, [sp, #224]
0x100482f8af64   b84  4eaa1d4c       mov v12.16b, v10.16b
0x100482f8af68   b88  4ea11c2a       mov v10.16b, v1.16b
0x100482f8af6c   b8c  3d803feb       str q11, [sp, #240]
0x100482f8af70   b90  3dc08beb       ldr q11, [sp, #544]
0x100482f8af74   b94  3dc087e1       ldr q1, [sp, #528]
0x100482f8af78   b98  3d8037ee       str q14, [sp, #208]
0x100482f8af7c   b9c  4eb31e6e       mov v14.16b, v19.16b
0x100482f8af80   ba0  4eb61ed3       mov v19.16b, v22.16b
0x100482f8af84   ba4  4eba1f56       mov v22.16b, v26.16b
0x100482f8af88   ba8  4ea01c1a       mov v26.16b, v0.16b
0x100482f8af8c   bac  3dc083e0       ldr q0, [sp, #512]
0x100482f8af90   bb0  4eb51eb4       mov v20.16b, v21.16b
0x100482f8af94   bb4  4ebb1f75       mov v21.16b, v27.16b
0x100482f8af98   bb8  4ebc1f9b       mov v27.16b, v28.16b
0x100482f8af9c   bbc  3dc07ffc       ldr q28, [sp, #496]
0x100482f8afa0   bc0  f9403bee       ldr x14, [sp, #112]
0x100482f8afa4   bc4  f9403ff3       ldr x19, [sp, #120]
0x100482f8afa8   bc8  f94043ed       ldr x13, [sp, #128]
0x100482f8afac   bcc  aa1903f5       mov x21, x25
0x100482f8afb0   bd0  f8520340       ldur x0, [x26, #-224]
0x100482f8afb4   bd4  f9414bf9       ldr x25, [sp, #656]
0x100482f8afb8   bd8  f94147fc       ldr x28, [sp, #648]
0x100482f8afbc   bdc  f94143fb       ldr cp, [sp, #640]
0x100482f8afc0   be0  f9413ff7       ldr x23, [sp, #632]
0x100482f8afc4   be4  f94137f8       ldr x24, [sp, #616]
0x100482f8afc8   be8  d2800004       movz x4, #0x0
0x100482f8afcc   bec  f9024fe9       str x9, [sp, #1176]
0x100482f8afd0   bf0  eb2063ff       cmp sp, x0
0x100482f8afd4   bf4  54008e69       b.ls #+0x11cc (addr 0x100482f8c1a0)
0x100482f8afd8   bf8  1b067d20       mul w0, w9, w6
0x100482f8afdc   bfc  0b0c0006       add w6, w0, w12
0x100482f8afe0   c00  6b0602df       cmp w22, w6
0x100482f8afe4   c04  54000189       b.ls #+0x30 (addr 0x100482f8b014)
0x100482f8afe8   c08  0b000100       add w0, w8, w0
0x100482f8afec   c0c  6b0002df       cmp w22, w0
0x100482f8aff0   c10  54000129       b.ls #+0x24 (addr 0x100482f8b014)
0x100482f8aff4   c14  0b0009e0       add w0, w15, w0, lsl #2
0x100482f8aff8   c18  b8606aa0       ldr w0, [x21, x0]
0x100482f8affc   c1c  0b0609e6       add w6, w15, w6, lsl #2
0x100482f8b000   c20  b8666aa6       ldr w6, [x21, x6]
0x100482f8b004   c24  aa0003f0       mov x16, x0
0x100482f8b008   c28  aa0603e0       mov x0, x6
0x100482f8b00c   c2c  aa1003e6       mov x6, x16
0x100482f8b010   c30  14000003       b #+0xc (addr 0x100482f8b01c)
0x100482f8b014   c34  aa0403e6       mov x6, x4
0x100482f8b018   c38  aa0403e0       mov x0, x4
0x100482f8b01c   c3c  531e7408       lsl w8, w0, #2
0x100482f8b020   c40  0b0802ec       add w12, w23, w8
0x100482f8b024   c44  4b0000cf       sub w15, w6, w0
0x100482f8b028   c48  6b06031f       cmp w24, w6
0x100482f8b02c   c4c  9a9f27f6       cset x22, lo
0x100482f8b030   c50  6b0000df       cmp w6, w0
0x100482f8b034   c54  9a9f27e9       cset x9, lo
0x100482f8b038   c58  2a0902d7       orr w23, w22, w9
0x100482f8b03c   c5c  6a1702ff       tst w23, w23
0x100482f8b040   c60  1a8f13f7       csel w23, wzr, w15, ne
0x100482f8b044   c64  f9014fe6       str x6, [sp, #664]
0x100482f8b048   c68  f901f7f7       str x23, [sp, #1000]
0x100482f8b04c   c6c  6b0000df       cmp w6, w0
0x100482f8b050   c70  54000423       b.lo #+0x84 (addr 0x100482f8b0d4)
0x100482f8b054   c74  0b080320       add w0, w25, w8
0x100482f8b058   c78  d2800099       movz x25, #0x4
0x100482f8b05c   c7c  6b0601df       cmp w14, w6
0x100482f8b060   c80  1a803338       csel w24, w25, w0, lo
0x100482f8b064   c84  6b0601df       cmp w14, w6
0x100482f8b068   c88  1a8f3080       csel w0, w4, w15, lo
0x100482f8b06c   c8c  121c600e       and w14, w0, #0x1ffffff0
0x100482f8b070   c90  0b0e0b0e       add w14, w24, w14, lsl #2
0x100482f8b074   c94  0b080375       add w21, w27, w8
0x100482f8b078   c98  6b06027f       cmp w19, w6
0x100482f8b07c   c9c  1a95333b       csel w27, w25, w21, lo
0x100482f8b080   ca0  6b06027f       cmp w19, w6
0x100482f8b084   ca4  1a8f3095       csel w21, w4, w15, lo
0x100482f8b088   ca8  121c62b3       and w19, w21, #0x1ffffff0
0x100482f8b08c   cac  0b130b73       add w19, w27, w19, lsl #2
0x100482f8b090   cb0  53047c0a       lsr w10, w0, #4
0x100482f8b094   cb4  12000c00       and w0, w0, #0xf
0x100482f8b098   cb8  53047eab       lsr w11, w21, #4
0x100482f8b09c   cbc  12000eb5       and w21, w21, #0xf
0x100482f8b0a0   cc0  6b0601bf       cmp w13, w6
0x100482f8b0a4   cc4  540000e3       b.lo #+0x1c (addr 0x100482f8b0c0)
0x100482f8b0a8   cc8  0b080388       add w8, w28, w8
0x100482f8b0ac   ccc  aa0a03f0       mov x16, x10
0x100482f8b0b0   cd0  aa0f03ea       mov x10, x15
0x100482f8b0b4   cd4  aa0b03ef       mov x15, x11
0x100482f8b0b8   cd8  aa1003eb       mov x11, x16
0x100482f8b0bc   cdc  14000011       b #+0x44 (addr 0x100482f8b100)
0x100482f8b0c0   ce0  aa0b03ef       mov x15, x11
0x100482f8b0c4   ce4  aa0a03eb       mov x11, x10
0x100482f8b0c8   ce8  aa0403ea       mov x10, x4
0x100482f8b0cc   cec  aa1903e8       mov x8, x25
0x100482f8b0d0   cf0  1400000c       b #+0x30 (addr 0x100482f8b100)
0x100482f8b0d4   cf4  aa0403ea       mov x10, x4
0x100482f8b0d8   cf8  d2800099       movz x25, #0x4
0x100482f8b0dc   cfc  aa0403f5       mov x21, x4
0x100482f8b0e0   d00  aa0403ef       mov x15, x4
0x100482f8b0e4   d04  aa0403e0       mov x0, x4
0x100482f8b0e8   d08  aa0403eb       mov x11, x4
0x100482f8b0ec   d0c  aa1903e8       mov x8, x25
0x100482f8b0f0   d10  aa1903ee       mov x14, x25
0x100482f8b0f4   d14  aa1903f3       mov x19, x25
0x100482f8b0f8   d18  aa1903f8       mov x24, x25
0x100482f8b0fc   d1c  aa1903fb       mov cp, x25
0x100482f8b100   d20  2a0902c9       orr w9, w22, w9
0x100482f8b104   d24  6a09013f       tst w9, w9
0x100482f8b108   d28  1a8c1329       csel w9, w25, w12, ne
0x100482f8b10c   d2c  12000eec       and w12, w23, #0xf
0x100482f8b110   d30  53047d56       lsr w22, w10, #4
0x100482f8b114   d34  53047ef9       lsr w25, w23, #4
0x100482f8b118   d38  6b1901ff       cmp w15, w25
0x100482f8b11c   d3c  1a9931ed       csel w13, w15, w25, lo
0x100482f8b120   d40  6b0d017f       cmp w11, w13
0x100482f8b124   d44  1a8d316f       csel w15, w11, w13, lo
0x100482f8b128   d48  6b0f02df       cmp w22, w15
0x100482f8b12c   d4c  1a8f32cb       csel w11, w22, w15, lo
0x100482f8b130   d50  f9020bee       str x14, [sp, #1040]
0x100482f8b134   d54  f90207f3       str x19, [sp, #1032]
0x100482f8b138   d58  f90227e8       str x8, [sp, #1096]
0x100482f8b13c   d5c  f90223ea       str x10, [sp, #1088]
0x100482f8b140   d60  f901f3e0       str x0, [sp, #992]
0x100482f8b144   d64  f901eff5       str x21, [sp, #984]
0x100482f8b148   d68  f9004bfb       str cp, [sp, #144]
0x100482f8b14c   d6c  f90047f8       str x24, [sp, #136]
0x100482f8b150   d70  f9021fe9       str x9, [sp, #1080]
0x100482f8b154   d74  f901ebec       str x12, [sp, #976]
0x100482f8b158   d78  3500054b       cbnz w11, #+0xa8 (addr 0x100482f8b200)
0x100482f8b15c   d7c  4ea81d06       mov v6.16b, v8.16b
0x100482f8b160   d80  4ea91d27       mov v7.16b, v9.16b
0x100482f8b164   d84  4ea11c23       mov v3.16b, v1.16b
0x100482f8b168   d88  4eaa1d41       mov v1.16b, v10.16b
0x100482f8b16c   d8c  4eab1d62       mov v2.16b, v11.16b
0x100482f8b170   d90  4ea01c04       mov v4.16b, v0.16b
0x100482f8b174   d94  4ebc1f85       mov v5.16b, v28.16b
0x100482f8b178   d98  4ebb1f7c       mov v28.16b, v27.16b
0x100482f8b17c   d9c  4eba1f40       mov v0.16b, v26.16b
0x100482f8b180   da0  f94157eb       ldr x11, [sp, #680]
0x100482f8b184   da4  f9415bed       ldr x13, [sp, #688]
0x100482f8b188   da8  f94173ee       ldr x14, [sp, #736]
0x100482f8b18c   dac  4eb61eda       mov v26.16b, v22.16b
0x100482f8b190   db0  4eb51ebb       mov v27.16b, v21.16b
0x100482f8b194   db4  4eb41e95       mov v21.16b, v20.16b
0x100482f8b198   db8  4eb31e76       mov v22.16b, v19.16b
0x100482f8b19c   dbc  4eb21e48       mov v8.16b, v18.16b
0x100482f8b1a0   dc0  4eb11e29       mov v9.16b, v17.16b
0x100482f8b1a4   dc4  f94177f3       ldr x19, [sp, #744]
0x100482f8b1a8   dc8  4eae1dd3       mov v19.16b, v14.16b
0x100482f8b1ac   dcc  f9417bf7       ldr x23, [sp, #752]
0x100482f8b1b0   dd0  4eac1d8a       mov v10.16b, v12.16b
0x100482f8b1b4   dd4  3dc03feb       ldr q11, [sp, #240]
0x100482f8b1b8   dd8  3dc03bec       ldr q12, [sp, #224]
0x100482f8b1bc   ddc  3dc037ee       ldr q14, [sp, #208]
0x100482f8b1c0   de0  f9417fe0       ldr x0, [sp, #760]
0x100482f8b1c4   de4  f94183f5       ldr x21, [sp, #768]
0x100482f8b1c8   de8  f94187ea       ldr x10, [sp, #776]
0x100482f8b1cc   dec  f94287f9       ldr x25, [sp, #1288]
0x100482f8b1d0   df0  f941d7f8       ldr x24, [sp, #936]
0x100482f8b1d4   df4  3dc0e7f4       ldr q20, [sp, #912]
0x100482f8b1d8   df8  3dc0e3f2       ldr q18, [sp, #896]
0x100482f8b1dc   dfc  3dc0dff1       ldr q17, [sp, #880]
0x100482f8b1e0   e00  f941d3ef       ldr x15, [sp, #928]
0x100482f8b1e4   e04  f941b7e8       ldr x8, [sp, #872]
0x100482f8b1e8   e08  f9419bec       ldr x12, [sp, #816]
0x100482f8b1ec   e0c  f94197e9       ldr x9, [sp, #808]
0x100482f8b1f0   e10  f94193e6       ldr x6, [sp, #800]
0x100482f8b1f4   e14  f9418ffc       ldr x28, [sp, #792]
0x100482f8b1f8   e18  f9418be4       ldr x4, [sp, #784]
0x100482f8b1fc   e1c  14000115       b #+0x454 (addr 0x100482f8b650)
0x100482f8b200   e20  4ea81d06       mov v6.16b, v8.16b
0x100482f8b204   e24  4ea91d27       mov v7.16b, v9.16b
0x100482f8b208   e28  4ea11c23       mov v3.16b, v1.16b
0x100482f8b20c   e2c  4eaa1d41       mov v1.16b, v10.16b
0x100482f8b210   e30  4eab1d62       mov v2.16b, v11.16b
0x100482f8b214   e34  4ea01c04       mov v4.16b, v0.16b
0x100482f8b218   e38  4ebc1f85       mov v5.16b, v28.16b
0x100482f8b21c   e3c  4ebb1f7c       mov v28.16b, v27.16b
0x100482f8b220   e40  4eba1f40       mov v0.16b, v26.16b
0x100482f8b224   e44  f90133eb       str x11, [sp, #608]
0x100482f8b228   e48  f94157eb       ldr x11, [sp, #680]
0x100482f8b22c   e4c  f9415bed       ldr x13, [sp, #688]
0x100482f8b230   e50  f94173ee       ldr x14, [sp, #736]
0x100482f8b234   e54  4eb61eda       mov v26.16b, v22.16b
0x100482f8b238   e58  4eb51ebb       mov v27.16b, v21.16b
0x100482f8b23c   e5c  4eb41e95       mov v21.16b, v20.16b
0x100482f8b240   e60  4eb31e76       mov v22.16b, v19.16b
0x100482f8b244   e64  3d8057f2       str q18, [sp, #336]
0x100482f8b248   e68  3d8053f1       str q17, [sp, #320]
0x100482f8b24c   e6c  f94177f3       ldr x19, [sp, #744]
0x100482f8b250   e70  3d804bee       str q14, [sp, #288]
0x100482f8b254   e74  f9417bf7       ldr x23, [sp, #752]
0x100482f8b258   e78  3d8043ec       str q12, [sp, #256]
0x100482f8b25c   e7c  f9417fe0       ldr x0, [sp, #760]
0x100482f8b260   e80  f94183f5       ldr x21, [sp, #768]
0x100482f8b264   e84  f94187ea       ldr x10, [sp, #776]
0x100482f8b268   e88  aa0403f6       mov x22, x4
0x100482f8b26c   e8c  f9418be4       ldr x4, [sp, #784]
0x100482f8b270   e90  f9418ffc       ldr x28, [sp, #792]
0x100482f8b274   e94  f94193e6       ldr x6, [sp, #800]
0x100482f8b278   e98  f94287f9       ldr x25, [sp, #1288]
0x100482f8b27c   e9c  14000013       b #+0x4c (addr 0x100482f8b2c8)
0x100482f8b280   ea0  f94047f8       ldr x24, [sp, #136]
0x100482f8b284   ea4  f90133fb       str cp, [sp, #608]
0x100482f8b288   ea8  f9404bfb       ldr cp, [sp, #144]
0x100482f8b28c   eac  f9421fe9       ldr x9, [sp, #1080]
0x100482f8b290   eb0  3d803fe2       str q2, [sp, #240]
0x100482f8b294   eb4  3dc08be2       ldr q2, [sp, #544]
0x100482f8b298   eb8  3d8043e3       str q3, [sp, #256]
0x100482f8b29c   ebc  3dc087e3       ldr q3, [sp, #528]
0x100482f8b2a0   ec0  3d803be4       str q4, [sp, #224]
0x100482f8b2a4   ec4  3dc083e4       ldr q4, [sp, #512]
0x100482f8b2a8   ec8  3d802be5       str q5, [sp, #160]
0x100482f8b2ac   ecc  3dc07fe5       ldr q5, [sp, #496]
0x100482f8b2b0   ed0  f94227e8       ldr x8, [sp, #1096]
0x100482f8b2b4   ed4  3d802fea       str q10, [sp, #176]
0x100482f8b2b8   ed8  3d8033e9       str q9, [sp, #192]
0x100482f8b2bc   edc  3d8037ec       str q12, [sp, #208]
0x100482f8b2c0   ee0  3d8057e8       str q8, [sp, #336]
0x100482f8b2c4   ee4  3d804bf3       str q19, [sp, #288]
0x100482f8b2c8   ee8  f852034f       ldur x15, [x26, #-224]
0x100482f8b2cc   eec  3d804ff0       str q16, [sp, #304]
0x100482f8b2d0   ef0  3d8047ed       str q13, [sp, #272]
0x100482f8b2d4   ef4  f941b3ec       ldr x12, [sp, #864]
0x100482f8b2d8   ef8  eb2f63ff       cmp sp, x15
0x100482f8b2dc   efc  54007f69       b.ls #+0xfec (addr 0x100482f8c2c8)
0x100482f8b2e0   f00  0b16030f       add w15, w24, w22
0x100482f8b2e4   f04  3cef6b2a       ldr q10, [x25, x15]
0x100482f8b2e8   f08  0b160118       add w24, w8, w22
0x100482f8b2ec   f0c  3cf86b29       ldr q9, [x25, x24]
0x100482f8b2f0   f10  0b160368       add w8, w27, w22
0x100482f8b2f4   f14  3ce86b28       ldr q8, [x25, x8]
0x100482f8b2f8   f18  3dc0d3eb       ldr q11, [sp, #832]
0x100482f8b2fc   f1c  4ea8d56c       fsub v12.4s, v11.4s, v8.4s
0x100482f8b300   f20  0b16013b       add w27, w9, w22
0x100482f8b304   f24  3cfb6b2d       ldr q13, [x25, x27]
0x100482f8b308   f28  3dc0d7ee       ldr q14, [sp, #848]
0x100482f8b30c   f2c  4eadd5d2       fsub v18.4s, v14.4s, v13.4s
0x100482f8b310   f30  6e32de51       fmul v17.4s, v18.4s, v18.4s
0x100482f8b314   f34  6e2cdd90       fmul v16.4s, v12.4s, v12.4s
0x100482f8b318   f38  4e30d630       fadd v16.4s, v17.4s, v16.4s
0x100482f8b31c   f3c  3dc0dff1       ldr q17, [sp, #880]
0x100482f8b320   f40  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x100482f8b324   f44  3dc0e7f4       ldr q20, [sp, #912]
0x100482f8b328   f48  4e341e73       and v19.16b, v19.16b, v20.16b
0x100482f8b32c   f4c  4e21da73       scvtf v19.4s, v19.4s
0x100482f8b330   f50  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x100482f8b334   f54  4e2cd4e7       fadd v7.4s, v7.4s, v12.4s
0x100482f8b338   f58  3cb46b27       str q7, [x25, x20]
0x100482f8b33c   f5c  6e33de4c       fmul v12.4s, v18.4s, v19.4s
0x100482f8b340   f60  4e2cd4c6       fadd v6.4s, v6.4s, v12.4s
0x100482f8b344   f64  3cab6b26       str q6, [x25, x11]
0x100482f8b348   f68  6e31e60c       fcmge v12.4s, v16.4s, v17.4s
0x100482f8b34c   f6c  3dc0e3f2       ldr q18, [sp, #896]
0x100482f8b350   f70  6eb0e653       fcmgt v19.4s, v18.4s, v16.4s
0x100482f8b354   f74  4e331d8c       and v12.16b, v12.16b, v19.16b
0x100482f8b358   f78  4ea0ca10       fcmgt v16.4s, v16.4s, #0.0
0x100482f8b35c   f7c  4e341e10       and v16.16b, v16.16b, v20.16b
0x100482f8b360   f80  4e21da10       scvtf v16.4s, v16.4s
0x100482f8b364   f84  4e301d8c       and v12.16b, v12.16b, v16.16b
0x100482f8b368   f88  4e25d585       fadd v5.4s, v12.4s, v5.4s
0x100482f8b36c   f8c  3cad6b25       str q5, [x25, x13]
0x100482f8b370   f90  6e2cdd29       fmul v9.4s, v9.4s, v12.4s
0x100482f8b374   f94  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x100482f8b378   f98  3ca76b24       str q4, [x25, x7]
0x100482f8b37c   f9c  6e2cdd49       fmul v9.4s, v10.4s, v12.4s
0x100482f8b380   fa0  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x100482f8b384   fa4  3ca56b23       str q3, [x25, x5]
0x100482f8b388   fa8  6e2cdd08       fmul v8.4s, v8.4s, v12.4s
0x100482f8b38c   fac  4e22d502       fadd v2.4s, v8.4s, v2.4s
0x100482f8b390   fb0  3ca36b22       str q2, [x25, x3]
0x100482f8b394   fb4  6e2cdda8       fmul v8.4s, v13.4s, v12.4s
0x100482f8b398   fb8  4e28d421       fadd v1.4s, v1.4s, v8.4s
0x100482f8b39c   fbc  3ca26b21       str q1, [x25, x2]
0x100482f8b3a0   fc0  110041e9       add w9, w15, #0x10 (16)
0x100482f8b3a4   fc4  3ce96b28       ldr q8, [x25, x9]
0x100482f8b3a8   fc8  11004309       add w9, w24, #0x10 (16)
0x100482f8b3ac   fcc  3ce96b29       ldr q9, [x25, x9]
0x100482f8b3b0   fd0  11004109       add w9, w8, #0x10 (16)
0x100482f8b3b4   fd4  3ce96b2a       ldr q10, [x25, x9]
0x100482f8b3b8   fd8  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0x100482f8b3bc   fdc  11004369       add w9, w27, #0x10 (16)
0x100482f8b3c0   fe0  3ce96b2d       ldr q13, [x25, x9]
0x100482f8b3c4   fe4  4eadd5d0       fsub v16.4s, v14.4s, v13.4s
0x100482f8b3c8   fe8  6e30de13       fmul v19.4s, v16.4s, v16.4s
0x100482f8b3cc   fec  3d808be2       str q2, [sp, #544]
0x100482f8b3d0   ff0  6e2cdd82       fmul v2.4s, v12.4s, v12.4s
0x100482f8b3d4   ff4  4e22d662       fadd v2.4s, v19.4s, v2.4s
0x100482f8b3d8   ff8  6ea2e633       fcmgt v19.4s, v17.4s, v2.4s
0x100482f8b3dc   ffc  4e341e73       and v19.16b, v19.16b, v20.16b
0x100482f8b3e0  1000  4e21da73       scvtf v19.4s, v19.4s
0x100482f8b3e4  1004  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x100482f8b3e8  1008  4e2cd400       fadd v0.4s, v0.4s, v12.4s
0x100482f8b3ec  100c  3ca16b20       str q0, [x25, x1]
0x100482f8b3f0  1010  6e33de0c       fmul v12.4s, v16.4s, v19.4s
0x100482f8b3f4  1014  4e2cd79c       fadd v28.4s, v28.4s, v12.4s
0x100482f8b3f8  1018  3cae6b3c       str q28, [x25, x14]
0x100482f8b3fc  101c  6e31e44c       fcmge v12.4s, v2.4s, v17.4s
0x100482f8b400  1020  6ea2e650       fcmgt v16.4s, v18.4s, v2.4s
0x100482f8b404  1024  4e301d8c       and v12.16b, v12.16b, v16.16b
0x100482f8b408  1028  4ea0c842       fcmgt v2.4s, v2.4s, #0.0
0x100482f8b40c  102c  4e341c42       and v2.16b, v2.16b, v20.16b
0x100482f8b410  1030  4e21d842       scvtf v2.4s, v2.4s
0x100482f8b414  1034  4e221d82       and v2.16b, v12.16b, v2.16b
0x100482f8b418  1038  4e3bd45b       fadd v27.4s, v2.4s, v27.4s
0x100482f8b41c  103c  3cb36b3b       str q27, [x25, x19]
0x100482f8b420  1040  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x100482f8b424  1044  4e3ad53a       fadd v26.4s, v9.4s, v26.4s
0x100482f8b428  1048  3cb76b3a       str q26, [x25, x23]
0x100482f8b42c  104c  6e22dd08       fmul v8.4s, v8.4s, v2.4s
0x100482f8b430  1050  4e37d517       fadd v23.4s, v8.4s, v23.4s
0x100482f8b434  1054  3ca06b37       str q23, [x25, x0]
0x100482f8b438  1058  6e22dd48       fmul v8.4s, v10.4s, v2.4s
0x100482f8b43c  105c  4e38d518       fadd v24.4s, v8.4s, v24.4s
0x100482f8b440  1060  3cb56b38       str q24, [x25, x21]
0x100482f8b444  1064  6e22dda2       fmul v2.4s, v13.4s, v2.4s
0x100482f8b448  1068  4e22d739       fadd v25.4s, v25.4s, v2.4s
0x100482f8b44c  106c  3caa6b39       str q25, [x25, x10]
0x100482f8b450  1070  110081e9       add w9, w15, #0x20 (32)
0x100482f8b454  1074  3ce96b22       ldr q2, [x25, x9]
0x100482f8b458  1078  11008309       add w9, w24, #0x20 (32)
0x100482f8b45c  107c  3ce96b28       ldr q8, [x25, x9]
0x100482f8b460  1080  11008109       add w9, w8, #0x20 (32)
0x100482f8b464  1084  3ce96b29       ldr q9, [x25, x9]
0x100482f8b468  1088  4ea9d56a       fsub v10.4s, v11.4s, v9.4s
0x100482f8b46c  108c  11008369       add w9, w27, #0x20 (32)
0x100482f8b470  1090  3ce96b2c       ldr q12, [x25, x9]
0x100482f8b474  1094  4eacd5cd       fsub v13.4s, v14.4s, v12.4s
0x100482f8b478  1098  6e2dddb0       fmul v16.4s, v13.4s, v13.4s
0x100482f8b47c  109c  6e2add53       fmul v19.4s, v10.4s, v10.4s
0x100482f8b480  10a0  4e33d610       fadd v16.4s, v16.4s, v19.4s
0x100482f8b484  10a4  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x100482f8b488  10a8  4e341e73       and v19.16b, v19.16b, v20.16b
0x100482f8b48c  10ac  4e21da73       scvtf v19.4s, v19.4s
0x100482f8b490  10b0  6e33dd4a       fmul v10.4s, v10.4s, v19.4s
0x100482f8b494  10b4  4e2ad6d6       fadd v22.4s, v22.4s, v10.4s
0x100482f8b498  10b8  3cbc6b36       str q22, [x25, x28]
0x100482f8b49c  10bc  6e33ddaa       fmul v10.4s, v13.4s, v19.4s
0x100482f8b4a0  10c0  4e2ad6b5       fadd v21.4s, v21.4s, v10.4s
0x100482f8b4a4  10c4  3ca46b35       str q21, [x25, x4]
0x100482f8b4a8  10c8  6e31e60a       fcmge v10.4s, v16.4s, v17.4s
0x100482f8b4ac  10cc  6eb0e64d       fcmgt v13.4s, v18.4s, v16.4s
0x100482f8b4b0  10d0  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x100482f8b4b4  10d4  4ea0ca0d       fcmgt v13.4s, v16.4s, #0.0
0x100482f8b4b8  10d8  4e341dad       and v13.16b, v13.16b, v20.16b
0x100482f8b4bc  10dc  4e21d9ad       scvtf v13.4s, v13.4s
0x100482f8b4c0  10e0  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x100482f8b4c4  10e4  3dc047ed       ldr q13, [sp, #272]
0x100482f8b4c8  10e8  4e2dd54d       fadd v13.4s, v10.4s, v13.4s
0x100482f8b4cc  10ec  3ca66b2d       str q13, [x25, x6]
0x100482f8b4d0  10f0  6e2add08       fmul v8.4s, v8.4s, v10.4s
0x100482f8b4d4  10f4  3dc04bf3       ldr q19, [sp, #288]
0x100482f8b4d8  10f8  4e33d513       fadd v19.4s, v8.4s, v19.4s
0x100482f8b4dc  10fc  3cac6b33       str q19, [x25, x12]
0x100482f8b4e0  1100  6e2adc42       fmul v2.4s, v2.4s, v10.4s
0x100482f8b4e4  1104  3dc04ff0       ldr q16, [sp, #304]
0x100482f8b4e8  1108  4e30d450       fadd v16.4s, v2.4s, v16.4s
0x100482f8b4ec  110c  f9419fe9       ldr x9, [sp, #824]
0x100482f8b4f0  1110  3ca96b30       str q16, [x25, x9]
0x100482f8b4f4  1114  6e2add22       fmul v2.4s, v9.4s, v10.4s
0x100482f8b4f8  1118  3dc053e8       ldr q8, [sp, #320]
0x100482f8b4fc  111c  4e28d442       fadd v2.4s, v2.4s, v8.4s
0x100482f8b500  1120  f9419bec       ldr x12, [sp, #816]
0x100482f8b504  1124  3cac6b22       str q2, [x25, x12]
0x100482f8b508  1128  6e2add88       fmul v8.4s, v12.4s, v10.4s
0x100482f8b50c  112c  3dc057e9       ldr q9, [sp, #336]
0x100482f8b510  1130  4e28d528       fadd v8.4s, v9.4s, v8.4s
0x100482f8b514  1134  f94197e9       ldr x9, [sp, #808]
0x100482f8b518  1138  3ca96b28       str q8, [x25, x9]
0x100482f8b51c  113c  1100c1ef       add w15, w15, #0x30 (48)
0x100482f8b520  1140  3cef6b29       ldr q9, [x25, x15]
0x100482f8b524  1144  1100c30f       add w15, w24, #0x30 (48)
0x100482f8b528  1148  3cef6b2a       ldr q10, [x25, x15]
0x100482f8b52c  114c  1100c108       add w8, w8, #0x30 (48)
0x100482f8b530  1150  3ce86b2c       ldr q12, [x25, x8]
0x100482f8b534  1154  3d8053e2       str q2, [sp, #320]
0x100482f8b538  1158  4eacd562       fsub v2.4s, v11.4s, v12.4s
0x100482f8b53c  115c  1100c368       add w8, w27, #0x30 (48)
0x100482f8b540  1160  3ce86b2b       ldr q11, [x25, x8]
0x100482f8b544  1164  3d8087e3       str q3, [sp, #528]
0x100482f8b548  1168  4eabd5c3       fsub v3.4s, v14.4s, v11.4s
0x100482f8b54c  116c  6e23dc6e       fmul v14.4s, v3.4s, v3.4s
0x100482f8b550  1170  3d8083e4       str q4, [sp, #512]
0x100482f8b554  1174  6e22dc44       fmul v4.4s, v2.4s, v2.4s
0x100482f8b558  1178  4e24d5c4       fadd v4.4s, v14.4s, v4.4s
0x100482f8b55c  117c  6ea4e62e       fcmgt v14.4s, v17.4s, v4.4s
0x100482f8b560  1180  4e341dce       and v14.16b, v14.16b, v20.16b
0x100482f8b564  1184  4e21d9ce       scvtf v14.4s, v14.4s
0x100482f8b568  1188  6e2edc42       fmul v2.4s, v2.4s, v14.4s
0x100482f8b56c  118c  3d807fe5       str q5, [sp, #496]
0x100482f8b570  1190  3dc03fe5       ldr q5, [sp, #240]
0x100482f8b574  1194  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x100482f8b578  1198  f941b7e8       ldr x8, [sp, #872]
0x100482f8b57c  119c  3ca86b22       str q2, [x25, x8]
0x100482f8b580  11a0  6e2edc63       fmul v3.4s, v3.4s, v14.4s
0x100482f8b584  11a4  3dc043e5       ldr q5, [sp, #256]
0x100482f8b588  11a8  4e23d4a3       fadd v3.4s, v5.4s, v3.4s
0x100482f8b58c  11ac  f941d3ef       ldr x15, [sp, #928]
0x100482f8b590  11b0  3caf6b23       str q3, [x25, x15]
0x100482f8b594  11b4  6e31e485       fcmge v5.4s, v4.4s, v17.4s
0x100482f8b598  11b8  6ea4e64e       fcmgt v14.4s, v18.4s, v4.4s
0x100482f8b59c  11bc  4e2e1ca5       and v5.16b, v5.16b, v14.16b
0x100482f8b5a0  11c0  4ea0c884       fcmgt v4.4s, v4.4s, #0.0
0x100482f8b5a4  11c4  4e341c84       and v4.16b, v4.16b, v20.16b
0x100482f8b5a8  11c8  4e21d884       scvtf v4.4s, v4.4s
0x100482f8b5ac  11cc  4e241ca4       and v4.16b, v5.16b, v4.16b
0x100482f8b5b0  11d0  3dc02be5       ldr q5, [sp, #160]
0x100482f8b5b4  11d4  4e25d485       fadd v5.4s, v4.4s, v5.4s
0x100482f8b5b8  11d8  f941d7f8       ldr x24, [sp, #936]
0x100482f8b5bc  11dc  3cb86b25       str q5, [x25, x24]
0x100482f8b5c0  11e0  6e24dd4a       fmul v10.4s, v10.4s, v4.4s
0x100482f8b5c4  11e4  3dc02fee       ldr q14, [sp, #176]
0x100482f8b5c8  11e8  4e2ed54a       fadd v10.4s, v10.4s, v14.4s
0x100482f8b5cc  11ec  f941dbfb       ldr cp, [sp, #944]
0x100482f8b5d0  11f0  3cbb6b2a       str q10, [x25, x27]
0x100482f8b5d4  11f4  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x100482f8b5d8  11f8  3dc033ee       ldr q14, [sp, #192]
0x100482f8b5dc  11fc  4e2ed529       fadd v9.4s, v9.4s, v14.4s
0x100482f8b5e0  1200  f941dffb       ldr cp, [sp, #952]
0x100482f8b5e4  1204  3cbb6b29       str q9, [x25, x27]
0x100482f8b5e8  1208  6e24dd8c       fmul v12.4s, v12.4s, v4.4s
0x100482f8b5ec  120c  3dc037ee       ldr q14, [sp, #208]
0x100482f8b5f0  1210  4e2ed58c       fadd v12.4s, v12.4s, v14.4s
0x100482f8b5f4  1214  f941e3fb       ldr cp, [sp, #960]
0x100482f8b5f8  1218  3cbb6b2c       str q12, [x25, x27]
0x100482f8b5fc  121c  6e24dd64       fmul v4.4s, v11.4s, v4.4s
0x100482f8b600  1220  3dc03beb       ldr q11, [sp, #224]
0x100482f8b604  1224  4e24d564       fadd v4.4s, v11.4s, v4.4s
0x100482f8b608  1228  f941e7fb       ldr cp, [sp, #968]
0x100482f8b60c  122c  3cbb6b24       str q4, [x25, x27]
0x100482f8b610  1230  110102d6       add w22, w22, #0x40 (64)
0x100482f8b614  1234  f94133fb       ldr cp, [sp, #608]
0x100482f8b618  1238  5100077b       sub w27, w27, #0x1 (1)
0x100482f8b61c  123c  35ffe33b       cbnz w27, #-0x39c (addr 0x100482f8b280)
0x100482f8b620  1240  3d802be5       str q5, [sp, #160]
0x100482f8b624  1244  3d802fea       str q10, [sp, #176]
0x100482f8b628  1248  3d8033e9       str q9, [sp, #192]
0x100482f8b62c  124c  4ea21c4b       mov v11.16b, v2.16b
0x100482f8b630  1250  3dc08be2       ldr q2, [sp, #544]
0x100482f8b634  1254  4ea31c6a       mov v10.16b, v3.16b
0x100482f8b638  1258  3dc087e3       ldr q3, [sp, #528]
0x100482f8b63c  125c  4eac1d8e       mov v14.16b, v12.16b
0x100482f8b640  1260  4ea41c8c       mov v12.16b, v4.16b
0x100482f8b644  1264  3dc083e4       ldr q4, [sp, #512]
0x100482f8b648  1268  3dc07fe5       ldr q5, [sp, #496]
0x100482f8b64c  126c  3dc053e9       ldr q9, [sp, #320]
0x100482f8b650  1270  3d8097e6       str q6, [sp, #592]
0x100482f8b654  1274  3d8093e7       str q7, [sp, #576]
0x100482f8b658  1278  3d808be2       str q2, [sp, #544]
0x100482f8b65c  127c  3d8087e3       str q3, [sp, #528]
0x100482f8b660  1280  3d8083e4       str q4, [sp, #512]
0x100482f8b664  1284  3d807fe5       str q5, [sp, #496]
0x100482f8b668  1288  3d805ff5       str q21, [sp, #368]
0x100482f8b66c  128c  3d805bf6       str q22, [sp, #352]
0x100482f8b670  1290  3d8057e8       str q8, [sp, #336]
0x100482f8b674  1294  3d8053e9       str q9, [sp, #320]
0x100482f8b678  1298  3d804ff0       str q16, [sp, #304]
0x100482f8b67c  129c  3d804bf3       str q19, [sp, #288]
0x100482f8b680  12a0  3d8047ed       str q13, [sp, #272]
0x100482f8b684  12a4  3d8043ea       str q10, [sp, #256]
0x100482f8b688  12a8  3d803feb       str q11, [sp, #240]
0x100482f8b68c  12ac  3d803bec       str q12, [sp, #224]
0x100482f8b690  12b0  3d8037ee       str q14, [sp, #208]
0x100482f8b694  12b4  f941ebf6       ldr x22, [sp, #976]
0x100482f8b698  12b8  34002cd6       cbz w22, #+0x598 (addr 0x100482f8bc30)
0x100482f8b69c  12bc  f9414ffb       ldr cp, [sp, #664]
0x100482f8b6a0  12c0  51004378       sub w24, w27, #0x10 (16)
0x100482f8b6a4  12c4  d280000f       movz x15, #0x0
0x100482f8b6a8  12c8  6b18037f       cmp w27, w24
0x100482f8b6ac  12cc  1a9831e8       csel w8, w15, w24, lo
0x100482f8b6b0  12d0  11004118       add w24, w8, #0x10 (16)
0x100482f8b6b4  12d4  f94137ef       ldr x15, [sp, #616]
0x100482f8b6b8  12d8  6b1801ff       cmp w15, w24
0x100482f8b6bc  12dc  54002ba3       b.lo #+0x574 (addr 0x100482f8bc30)
0x100482f8b6c0  12e0  f9413bef       ldr x15, [sp, #624]
0x100482f8b6c4  12e4  6b1801ff       cmp w15, w24
0x100482f8b6c8  12e8  54002b23       b.lo #+0x564 (addr 0x100482f8bc2c)
0x100482f8b6cc  12ec  531e7518       lsl w24, w8, #2
0x100482f8b6d0  12f0  f9413fef       ldr x15, [sp, #632]
0x100482f8b6d4  12f4  0b1801ec       add w12, w15, w24
0x100482f8b6d8  12f8  f94143ef       ldr x15, [sp, #640]
0x100482f8b6dc  12fc  0b1801e9       add w9, w15, w24
0x100482f8b6e0  1300  f94147ef       ldr x15, [sp, #648]
0x100482f8b6e4  1304  0b1801e6       add w6, w15, w24
0x100482f8b6e8  1308  f9414bef       ldr x15, [sp, #656]
0x100482f8b6ec  130c  0b1801f8       add w24, w15, w24
0x100482f8b6f0  1310  4b080368       sub w8, w27, w8
0x100482f8b6f4  1314  7100411f       cmp w8, #0x10 (16)
0x100482f8b6f8  1318  54000b00       b.eq #+0x160 (addr 0x100482f8b858)
0x100482f8b6fc  131c  4e040d0c       dup v12.4s, w8
0x100482f8b700  1320  d2800190       movz x16, #0xc
0x100482f8b704  1324  f2c001b0       movk x16, #0xd, lsl #32
0x100482f8b708  1328  9e67020e       fmov d14, x16
0x100482f8b70c  132c  d28001d0       movz x16, #0xe
0x100482f8b710  1330  f2c001f0       movk x16, #0xf, lsl #32
0x100482f8b714  1334  4e181e0e       mov v14.d[1], x16
0x100482f8b718  1338  6eae358e       cmhi v14.4s, v12.4s, v14.4s
0x100482f8b71c  133c  4b16011b       sub w27, w8, w22
0x100482f8b720  1340  4e040f6a       dup v10.4s, w27
0x100482f8b724  1344  d28001b0       movz x16, #0xd
0x100482f8b728  1348  f2c001d0       movk x16, #0xe, lsl #32
0x100482f8b72c  134c  9e67020b       fmov d11, x16
0x100482f8b730  1350  d28001f0       movz x16, #0xf
0x100482f8b734  1354  f2c00210       movk x16, #0x10, lsl #32
0x100482f8b738  1358  4e181e0b       mov v11.d[1], x16
0x100482f8b73c  135c  6eaa356b       cmhi v11.4s, v11.4s, v10.4s
0x100482f8b740  1360  4e2b1dcb       and v11.16b, v14.16b, v11.16b
0x100482f8b744  1364  4e341d6b       and v11.16b, v11.16b, v20.16b
0x100482f8b748  1368  4e21d96b       scvtf v11.4s, v11.4s
0x100482f8b74c  136c  f94293ef       ldr x15, [sp, #1312]
0x100482f8b750  1370  9101c1fc       add x28, x15, #0x70 (112)
0x100482f8b754  1374  3cbc6b2b       str q11, [x25, x28]
0x100482f8b758  1378  d2800110       movz x16, #0x8
0x100482f8b75c  137c  f2c00130       movk x16, #0x9, lsl #32
0x100482f8b760  1380  9e67020b       fmov d11, x16
0x100482f8b764  1384  d2800150       movz x16, #0xa
0x100482f8b768  1388  f2c00170       movk x16, #0xb, lsl #32
0x100482f8b76c  138c  4e181e0b       mov v11.d[1], x16
0x100482f8b770  1390  6eab358b       cmhi v11.4s, v12.4s, v11.4s
0x100482f8b774  1394  d2800130       movz x16, #0x9
0x100482f8b778  1398  f2c00150       movk x16, #0xa, lsl #32
0x100482f8b77c  139c  9e67020e       fmov d14, x16
0x100482f8b780  13a0  d2800170       movz x16, #0xb
0x100482f8b784  13a4  f2c00190       movk x16, #0xc, lsl #32
0x100482f8b788  13a8  4e181e0e       mov v14.d[1], x16
0x100482f8b78c  13ac  6eaa35ce       cmhi v14.4s, v14.4s, v10.4s
0x100482f8b790  13b0  4e2e1d6b       and v11.16b, v11.16b, v14.16b
0x100482f8b794  13b4  4e341d6b       and v11.16b, v11.16b, v20.16b
0x100482f8b798  13b8  4e21d96b       scvtf v11.4s, v11.4s
0x100482f8b79c  13bc  910181fc       add x28, x15, #0x60 (96)
0x100482f8b7a0  13c0  3cbc6b2b       str q11, [x25, x28]
0x100482f8b7a4  13c4  d2800090       movz x16, #0x4
0x100482f8b7a8  13c8  f2c000b0       movk x16, #0x5, lsl #32
0x100482f8b7ac  13cc  9e67020b       fmov d11, x16
0x100482f8b7b0  13d0  d28000d0       movz x16, #0x6
0x100482f8b7b4  13d4  f2c000f0       movk x16, #0x7, lsl #32
0x100482f8b7b8  13d8  4e181e0b       mov v11.d[1], x16
0x100482f8b7bc  13dc  6eab358b       cmhi v11.4s, v12.4s, v11.4s
0x100482f8b7c0  13e0  d28000b0       movz x16, #0x5
0x100482f8b7c4  13e4  f2c000d0       movk x16, #0x6, lsl #32
0x100482f8b7c8  13e8  9e67020c       fmov d12, x16
0x100482f8b7cc  13ec  d28000f0       movz x16, #0x7
0x100482f8b7d0  13f0  f2c00110       movk x16, #0x8, lsl #32
0x100482f8b7d4  13f4  4e181e0c       mov v12.d[1], x16
0x100482f8b7d8  13f8  6eaa358a       cmhi v10.4s, v12.4s, v10.4s
0x100482f8b7dc  13fc  4e2a1d6a       and v10.16b, v11.16b, v10.16b
0x100482f8b7e0  1400  4e341d4a       and v10.16b, v10.16b, v20.16b
0x100482f8b7e4  1404  4e21d94a       scvtf v10.4s, v10.4s
0x100482f8b7e8  1408  910141fc       add x28, x15, #0x50 (80)
0x100482f8b7ec  140c  3cbc6b2a       str q10, [x25, x28]
0x100482f8b7f0  1410  6b16011f       cmp w8, w22
0x100482f8b7f4  1414  9a9f17f6       cset x22, eq
0x100482f8b7f8  1418  4e040eca       dup v10.4s, w22
0x100482f8b7fc  141c  d280003c       movz x28, #0x1
0x100482f8b800  1420  6b08039f       cmp w28, w8
0x100482f8b804  1424  7a423b62       ccmp w27, #2, #nzCv, lo
0x100482f8b808  1428  9a9f27f6       cset x22, lo
0x100482f8b80c  142c  4e0c1eca       mov v10.s[1], w22
0x100482f8b810  1430  d2800056       movz x22, #0x2
0x100482f8b814  1434  6b0802df       cmp w22, w8
0x100482f8b818  1438  7a433b62       ccmp w27, #3, #nzCv, lo
0x100482f8b81c  143c  9a9f27fc       cset x28, lo
0x100482f8b820  1440  4e141f8a       mov v10.s[2], w28
0x100482f8b824  1444  d280007c       movz x28, #0x3
0x100482f8b828  1448  6b08039f       cmp w28, w8
0x100482f8b82c  144c  7a443b62       ccmp w27, #4, #nzCv, lo
0x100482f8b830  1450  9a9f27e8       cset x8, lo
0x100482f8b834  1454  4e1c1d0a       mov v10.s[3], w8
0x100482f8b838  1458  4e21d94a       scvtf v10.4s, v10.4s
0x100482f8b83c  145c  910101e8       add x8, x15, #0x40 (64)
0x100482f8b840  1460  3ca86b2a       str q10, [x25, x8]
0x100482f8b844  1464  110101e8       add w8, w15, #0x40 (64)
0x100482f8b848  1468  aa1603f0       mov x16, x22
0x100482f8b84c  146c  aa0803f6       mov x22, x8
0x100482f8b850  1470  aa1003e8       mov x8, x16
0x100482f8b854  1474  14000005       b #+0x14 (addr 0x100482f8b868)
0x100482f8b858  1478  d286db1b       movz cp, #0x36d8
0x100482f8b85c  147c  f2a002db       movk cp, #0x16, lsl #16
0x100482f8b860  1480  0b160b76       add w22, w27, w22, lsl #2
0x100482f8b864  1484  d2800048       movz x8, #0x2
0x100482f8b868  1488  3cf86b2a       ldr q10, [x25, x24]
0x100482f8b86c  148c  3ce66b2b       ldr q11, [x25, x6]
0x100482f8b870  1490  3ce96b2c       ldr q12, [x25, x9]
0x100482f8b874  1494  3dc0d3ee       ldr q14, [sp, #832]
0x100482f8b878  1498  4eacd5d3       fsub v19.4s, v14.4s, v12.4s
0x100482f8b87c  149c  3cf66b30       ldr q16, [x25, x22]
0x100482f8b880  14a0  3cec6b29       ldr q9, [x25, x12]
0x100482f8b884  14a4  3dc0d7e8       ldr q8, [sp, #848]
0x100482f8b888  14a8  4ea9d50d       fsub v13.4s, v8.4s, v9.4s
0x100482f8b88c  14ac  6e2dddb6       fmul v22.4s, v13.4s, v13.4s
0x100482f8b890  14b0  6e33de75       fmul v21.4s, v19.4s, v19.4s
0x100482f8b894  14b4  4e35d6d5       fadd v21.4s, v22.4s, v21.4s
0x100482f8b898  14b8  6eb5e636       fcmgt v22.4s, v17.4s, v21.4s
0x100482f8b89c  14bc  4e341ed6       and v22.16b, v22.16b, v20.16b
0x100482f8b8a0  14c0  4e21dad6       scvtf v22.4s, v22.4s
0x100482f8b8a4  14c4  6e36de16       fmul v22.4s, v16.4s, v22.4s
0x100482f8b8a8  14c8  6e36de73       fmul v19.4s, v19.4s, v22.4s
0x100482f8b8ac  14cc  4e33d4e7       fadd v7.4s, v7.4s, v19.4s
0x100482f8b8b0  14d0  3cb46b27       str q7, [x25, x20]
0x100482f8b8b4  14d4  6e36ddad       fmul v13.4s, v13.4s, v22.4s
0x100482f8b8b8  14d8  4e2dd4c6       fadd v6.4s, v6.4s, v13.4s
0x100482f8b8bc  14dc  3cab6b26       str q6, [x25, x11]
0x100482f8b8c0  14e0  6e31e6ad       fcmge v13.4s, v21.4s, v17.4s
0x100482f8b8c4  14e4  6eb5e653       fcmgt v19.4s, v18.4s, v21.4s
0x100482f8b8c8  14e8  4e331dad       and v13.16b, v13.16b, v19.16b
0x100482f8b8cc  14ec  4ea0cab3       fcmgt v19.4s, v21.4s, #0.0
0x100482f8b8d0  14f0  4e341e73       and v19.16b, v19.16b, v20.16b
0x100482f8b8d4  14f4  4e21da73       scvtf v19.4s, v19.4s
0x100482f8b8d8  14f8  4e331dad       and v13.16b, v13.16b, v19.16b
0x100482f8b8dc  14fc  6e2dde0d       fmul v13.4s, v16.4s, v13.4s
0x100482f8b8e0  1500  4e25d5a5       fadd v5.4s, v13.4s, v5.4s
0x100482f8b8e4  1504  3cad6b25       str q5, [x25, x13]
0x100482f8b8e8  1508  6e2ddd6b       fmul v11.4s, v11.4s, v13.4s
0x100482f8b8ec  150c  4e24d564       fadd v4.4s, v11.4s, v4.4s
0x100482f8b8f0  1510  3ca76b24       str q4, [x25, x7]
0x100482f8b8f4  1514  6e2ddd4a       fmul v10.4s, v10.4s, v13.4s
0x100482f8b8f8  1518  4e23d543       fadd v3.4s, v10.4s, v3.4s
0x100482f8b8fc  151c  3ca56b23       str q3, [x25, x5]
0x100482f8b900  1520  6e2ddd8a       fmul v10.4s, v12.4s, v13.4s
0x100482f8b904  1524  4e22d542       fadd v2.4s, v10.4s, v2.4s
0x100482f8b908  1528  3ca36b22       str q2, [x25, x3]
0x100482f8b90c  152c  6e2ddd29       fmul v9.4s, v9.4s, v13.4s
0x100482f8b910  1530  4e29d429       fadd v9.4s, v1.4s, v9.4s
0x100482f8b914  1534  3ca26b29       str q9, [x25, x2]
0x100482f8b918  1538  9100431b       add cp, x24, #0x10 (16)
0x100482f8b91c  153c  3cfb6b2a       ldr q10, [x25, x27]
0x100482f8b920  1540  910040db       add cp, x6, #0x10 (16)
0x100482f8b924  1544  3cfb6b2b       ldr q11, [x25, x27]
0x100482f8b928  1548  9100413b       add cp, x9, #0x10 (16)
0x100482f8b92c  154c  3cfb6b2c       ldr q12, [x25, x27]
0x100482f8b930  1550  4eacd5cd       fsub v13.4s, v14.4s, v12.4s
0x100482f8b934  1554  910042db       add cp, x22, #0x10 (16)
0x100482f8b938  1558  3cfb6b30       ldr q16, [x25, x27]
0x100482f8b93c  155c  9100419b       add cp, x12, #0x10 (16)
0x100482f8b940  1560  3cfb6b33       ldr q19, [x25, x27]
0x100482f8b944  1564  4eb3d515       fsub v21.4s, v8.4s, v19.4s
0x100482f8b948  1568  6e35deb6       fmul v22.4s, v21.4s, v21.4s
0x100482f8b94c  156c  6e2ddda1       fmul v1.4s, v13.4s, v13.4s
0x100482f8b950  1570  4e21d6d6       fadd v22.4s, v22.4s, v1.4s
0x100482f8b954  1574  6eb6e621       fcmgt v1.4s, v17.4s, v22.4s
0x100482f8b958  1578  4e341c21       and v1.16b, v1.16b, v20.16b
0x100482f8b95c  157c  4e21d821       scvtf v1.4s, v1.4s
0x100482f8b960  1580  6e21de01       fmul v1.4s, v16.4s, v1.4s
0x100482f8b964  1584  6e21ddad       fmul v13.4s, v13.4s, v1.4s
0x100482f8b968  1588  4e2dd40d       fadd v13.4s, v0.4s, v13.4s
0x100482f8b96c  158c  3ca16b2d       str q13, [x25, x1]
0x100482f8b970  1590  6e21deb5       fmul v21.4s, v21.4s, v1.4s
0x100482f8b974  1594  4e35d795       fadd v21.4s, v28.4s, v21.4s
0x100482f8b978  1598  3cae6b35       str q21, [x25, x14]
0x100482f8b97c  159c  6e31e6dc       fcmge v28.4s, v22.4s, v17.4s
0x100482f8b980  15a0  6eb6e640       fcmgt v0.4s, v18.4s, v22.4s
0x100482f8b984  15a4  4e201f9c       and v28.16b, v28.16b, v0.16b
0x100482f8b988  15a8  4ea0cad6       fcmgt v22.4s, v22.4s, #0.0
0x100482f8b98c  15ac  4e341ed6       and v22.16b, v22.16b, v20.16b
0x100482f8b990  15b0  4e21dad6       scvtf v22.4s, v22.4s
0x100482f8b994  15b4  4e361f96       and v22.16b, v28.16b, v22.16b
0x100482f8b998  15b8  6e36de10       fmul v16.4s, v16.4s, v22.4s
0x100482f8b99c  15bc  4e3bd616       fadd v22.4s, v16.4s, v27.4s
0x100482f8b9a0  15c0  3cb36b36       str q22, [x25, x19]
0x100482f8b9a4  15c4  6e30dd6b       fmul v11.4s, v11.4s, v16.4s
0x100482f8b9a8  15c8  4e3ad56b       fadd v11.4s, v11.4s, v26.4s
0x100482f8b9ac  15cc  3cb76b2b       str q11, [x25, x23]
0x100482f8b9b0  15d0  6e30dd4a       fmul v10.4s, v10.4s, v16.4s
0x100482f8b9b4  15d4  4e37d557       fadd v23.4s, v10.4s, v23.4s
0x100482f8b9b8  15d8  3ca06b37       str q23, [x25, x0]
0x100482f8b9bc  15dc  6e30dd8a       fmul v10.4s, v12.4s, v16.4s
0x100482f8b9c0  15e0  4e38d558       fadd v24.4s, v10.4s, v24.4s
0x100482f8b9c4  15e4  3cb56b38       str q24, [x25, x21]
0x100482f8b9c8  15e8  6e30de6a       fmul v10.4s, v19.4s, v16.4s
0x100482f8b9cc  15ec  4e2ad739       fadd v25.4s, v25.4s, v10.4s
0x100482f8b9d0  15f0  3caa6b39       str q25, [x25, x10]
0x100482f8b9d4  15f4  910080db       add cp, x6, #0x20 (32)
0x100482f8b9d8  15f8  3cfb6b2a       ldr q10, [x25, x27]
0x100482f8b9dc  15fc  9100831b       add cp, x24, #0x20 (32)
0x100482f8b9e0  1600  3cfb6b2c       ldr q12, [x25, x27]
0x100482f8b9e4  1604  9100819b       add cp, x12, #0x20 (32)
0x100482f8b9e8  1608  3cfb6b30       ldr q16, [x25, x27]
0x100482f8b9ec  160c  4eb0d513       fsub v19.4s, v8.4s, v16.4s
0x100482f8b9f0  1610  910082db       add cp, x22, #0x20 (32)
0x100482f8b9f4  1614  3cfb6b3a       ldr q26, [x25, x27]
0x100482f8b9f8  1618  6e33de7b       fmul v27.4s, v19.4s, v19.4s
0x100482f8b9fc  161c  9100813b       add cp, x9, #0x20 (32)
0x100482f8ba00  1620  3cfb6b3c       ldr q28, [x25, x27]
0x100482f8ba04  1624  4ebcd5c0       fsub v0.4s, v14.4s, v28.4s
0x100482f8ba08  1628  6e20dc01       fmul v1.4s, v0.4s, v0.4s
0x100482f8ba0c  162c  4e21d77b       fadd v27.4s, v27.4s, v1.4s
0x100482f8ba10  1630  6ebbe621       fcmgt v1.4s, v17.4s, v27.4s
0x100482f8ba14  1634  4e341c21       and v1.16b, v1.16b, v20.16b
0x100482f8ba18  1638  4e21d821       scvtf v1.4s, v1.4s
0x100482f8ba1c  163c  6e21df41       fmul v1.4s, v26.4s, v1.4s
0x100482f8ba20  1640  6e21de73       fmul v19.4s, v19.4s, v1.4s
0x100482f8ba24  1644  3d808be2       str q2, [sp, #544]
0x100482f8ba28  1648  3dc05fe2       ldr q2, [sp, #368]
0x100482f8ba2c  164c  4e33d442       fadd v2.4s, v2.4s, v19.4s
0x100482f8ba30  1650  3ca46b22       str q2, [x25, x4]
0x100482f8ba34  1654  6e21dc13       fmul v19.4s, v0.4s, v1.4s
0x100482f8ba38  1658  3dc05be0       ldr q0, [sp, #352]
0x100482f8ba3c  165c  4e33d413       fadd v19.4s, v0.4s, v19.4s
0x100482f8ba40  1660  f9418ffb       ldr cp, [sp, #792]
0x100482f8ba44  1664  3cbb6b33       str q19, [x25, x27]
0x100482f8ba48  1668  6e31e760       fcmge v0.4s, v27.4s, v17.4s
0x100482f8ba4c  166c  6ebbe641       fcmgt v1.4s, v18.4s, v27.4s
0x100482f8ba50  1670  4e211c00       and v0.16b, v0.16b, v1.16b
0x100482f8ba54  1674  4ea0cb7b       fcmgt v27.4s, v27.4s, #0.0
0x100482f8ba58  1678  4e341f7b       and v27.16b, v27.16b, v20.16b
0x100482f8ba5c  167c  4e21db7b       scvtf v27.4s, v27.4s
0x100482f8ba60  1680  4e3b1c1b       and v27.16b, v0.16b, v27.16b
0x100482f8ba64  1684  6e3bdf5a       fmul v26.4s, v26.4s, v27.4s
0x100482f8ba68  1688  3dc047fb       ldr q27, [sp, #272]
0x100482f8ba6c  168c  4e3bd75b       fadd v27.4s, v26.4s, v27.4s
0x100482f8ba70  1690  f94193fc       ldr x28, [sp, #800]
0x100482f8ba74  1694  3cbc6b3b       str q27, [x25, x28]
0x100482f8ba78  1698  6e3ade10       fmul v16.4s, v16.4s, v26.4s
0x100482f8ba7c  169c  3dc057e0       ldr q0, [sp, #336]
0x100482f8ba80  16a0  4e30d410       fadd v16.4s, v0.4s, v16.4s
0x100482f8ba84  16a4  f94197e8       ldr x8, [sp, #808]
0x100482f8ba88  16a8  3ca86b30       str q16, [x25, x8]
0x100482f8ba8c  16ac  6e3adf9c       fmul v28.4s, v28.4s, v26.4s
0x100482f8ba90  16b0  3dc053e0       ldr q0, [sp, #320]
0x100482f8ba94  16b4  4e20d79c       fadd v28.4s, v28.4s, v0.4s
0x100482f8ba98  16b8  f9419bef       ldr x15, [sp, #816]
0x100482f8ba9c  16bc  3caf6b3c       str q28, [x25, x15]
0x100482f8baa0  16c0  6e3add8c       fmul v12.4s, v12.4s, v26.4s
0x100482f8baa4  16c4  3dc04fe0       ldr q0, [sp, #304]
0x100482f8baa8  16c8  4e20d58c       fadd v12.4s, v12.4s, v0.4s
0x100482f8baac  16cc  f9419fe8       ldr x8, [sp, #824]
0x100482f8bab0  16d0  3ca86b2c       str q12, [x25, x8]
0x100482f8bab4  16d4  6e3add4a       fmul v10.4s, v10.4s, v26.4s
0x100482f8bab8  16d8  3dc04bfa       ldr q26, [sp, #288]
0x100482f8babc  16dc  4e3ad54a       fadd v10.4s, v10.4s, v26.4s
0x100482f8bac0  16e0  f941b3e8       ldr x8, [sp, #864]
0x100482f8bac4  16e4  3ca86b2a       str q10, [x25, x8]
0x100482f8bac8  16e8  9100c318       add x24, x24, #0x30 (48)
0x100482f8bacc  16ec  3cf86b3a       ldr q26, [x25, x24]
0x100482f8bad0  16f0  9100c0c6       add x6, x6, #0x30 (48)
0x100482f8bad4  16f4  3ce66b20       ldr q0, [x25, x6]
0x100482f8bad8  16f8  9100c126       add x6, x9, #0x30 (48)
0x100482f8badc  16fc  3ce66b21       ldr q1, [x25, x6]
0x100482f8bae0  1700  3d805fe2       str q2, [sp, #368]
0x100482f8bae4  1704  4ea1d5c2       fsub v2.4s, v14.4s, v1.4s
0x100482f8bae8  1708  9100c2c6       add x6, x22, #0x30 (48)
0x100482f8baec  170c  3ce66b2e       ldr q14, [x25, x6]
0x100482f8baf0  1710  9100c186       add x6, x12, #0x30 (48)
0x100482f8baf4  1714  3d8087e3       str q3, [sp, #528]
0x100482f8baf8  1718  3ce66b23       ldr q3, [x25, x6]
0x100482f8bafc  171c  3d8083e4       str q4, [sp, #512]
0x100482f8bb00  1720  4ea3d504       fsub v4.4s, v8.4s, v3.4s
0x100482f8bb04  1724  6e24dc88       fmul v8.4s, v4.4s, v4.4s
0x100482f8bb08  1728  3d807fe5       str q5, [sp, #496]
0x100482f8bb0c  172c  6e22dc45       fmul v5.4s, v2.4s, v2.4s
0x100482f8bb10  1730  4e25d505       fadd v5.4s, v8.4s, v5.4s
0x100482f8bb14  1734  6ea5e628       fcmgt v8.4s, v17.4s, v5.4s
0x100482f8bb18  1738  4e341d08       and v8.16b, v8.16b, v20.16b
0x100482f8bb1c  173c  4e21d908       scvtf v8.4s, v8.4s
0x100482f8bb20  1740  6e28ddc8       fmul v8.4s, v14.4s, v8.4s
0x100482f8bb24  1744  6e28dc42       fmul v2.4s, v2.4s, v8.4s
0x100482f8bb28  1748  3d8067eb       str q11, [sp, #400]
0x100482f8bb2c  174c  3dc03feb       ldr q11, [sp, #240]
0x100482f8bb30  1750  4e22d56b       fadd v11.4s, v11.4s, v2.4s
0x100482f8bb34  1754  f941b7e6       ldr x6, [sp, #872]
0x100482f8bb38  1758  3ca66b2b       str q11, [x25, x6]
0x100482f8bb3c  175c  6e28dc82       fmul v2.4s, v4.4s, v8.4s
0x100482f8bb40  1760  3dc043e8       ldr q8, [sp, #256]
0x100482f8bb44  1764  4e22d502       fadd v2.4s, v8.4s, v2.4s
0x100482f8bb48  1768  f941d3e9       ldr x9, [sp, #928]
0x100482f8bb4c  176c  3ca96b22       str q2, [x25, x9]
0x100482f8bb50  1770  6e31e4a4       fcmge v4.4s, v5.4s, v17.4s
0x100482f8bb54  1774  6ea5e648       fcmgt v8.4s, v18.4s, v5.4s
0x100482f8bb58  1778  4e281c84       and v4.16b, v4.16b, v8.16b
0x100482f8bb5c  177c  4ea0c8a5       fcmgt v5.4s, v5.4s, #0.0
0x100482f8bb60  1780  4e341ca5       and v5.16b, v5.16b, v20.16b
0x100482f8bb64  1784  4e21d8a5       scvtf v5.4s, v5.4s
0x100482f8bb68  1788  4e251c84       and v4.16b, v4.16b, v5.16b
0x100482f8bb6c  178c  6e24ddc4       fmul v4.4s, v14.4s, v4.4s
0x100482f8bb70  1790  3dc02bee       ldr q14, [sp, #160]
0x100482f8bb74  1794  4e2ed485       fadd v5.4s, v4.4s, v14.4s
0x100482f8bb78  1798  f941d7ec       ldr x12, [sp, #936]
0x100482f8bb7c  179c  3cac6b25       str q5, [x25, x12]
0x100482f8bb80  17a0  6e24dc08       fmul v8.4s, v0.4s, v4.4s
0x100482f8bb84  17a4  3dc02fee       ldr q14, [sp, #176]
0x100482f8bb88  17a8  4e2ed508       fadd v8.4s, v8.4s, v14.4s
0x100482f8bb8c  17ac  f941dbf8       ldr x24, [sp, #944]
0x100482f8bb90  17b0  3cb86b28       str q8, [x25, x24]
0x100482f8bb94  17b4  6e24df4e       fmul v14.4s, v26.4s, v4.4s
0x100482f8bb98  17b8  3dc033fa       ldr q26, [sp, #192]
0x100482f8bb9c  17bc  4e3ad5ce       fadd v14.4s, v14.4s, v26.4s
0x100482f8bba0  17c0  f941dff6       ldr x22, [sp, #952]
0x100482f8bba4  17c4  3cb66b2e       str q14, [x25, x22]
0x100482f8bba8  17c8  6e24dc3a       fmul v26.4s, v1.4s, v4.4s
0x100482f8bbac  17cc  3dc037e0       ldr q0, [sp, #208]
0x100482f8bbb0  17d0  4e20d75a       fadd v26.4s, v26.4s, v0.4s
0x100482f8bbb4  17d4  f941e3e6       ldr x6, [sp, #960]
0x100482f8bbb8  17d8  3ca66b3a       str q26, [x25, x6]
0x100482f8bbbc  17dc  6e24dc63       fmul v3.4s, v3.4s, v4.4s
0x100482f8bbc0  17e0  3dc03be4       ldr q4, [sp, #224]
0x100482f8bbc4  17e4  4e23d483       fadd v3.4s, v4.4s, v3.4s
0x100482f8bbc8  17e8  f941e7e6       ldr x6, [sp, #968]
0x100482f8bbcc  17ec  3ca66b23       str q3, [x25, x6]
0x100482f8bbd0  17f0  aa1c03e6       mov x6, x28
0x100482f8bbd4  17f4  aa1b03fc       mov x28, cp
0x100482f8bbd8  17f8  f94197e9       ldr x9, [sp, #808]
0x100482f8bbdc  17fc  aa0f03ec       mov x12, x15
0x100482f8bbe0  1800  3d802be5       str q5, [sp, #160]
0x100482f8bbe4  1804  3d802fe8       str q8, [sp, #176]
0x100482f8bbe8  1808  3d8033ee       str q14, [sp, #192]
0x100482f8bbec  180c  4ea91d21       mov v1.16b, v9.16b
0x100482f8bbf0  1810  4eba1f4e       mov v14.16b, v26.16b
0x100482f8bbf4  1814  4eb01e08       mov v8.16b, v16.16b
0x100482f8bbf8  1818  4eac1d90       mov v16.16b, v12.16b
0x100482f8bbfc  181c  4ea31c6c       mov v12.16b, v3.16b
0x100482f8bc00  1820  4ead1da0       mov v0.16b, v13.16b
0x100482f8bc04  1824  4ebb1f6d       mov v13.16b, v27.16b
0x100482f8bc08  1828  4eb61edb       mov v27.16b, v22.16b
0x100482f8bc0c  182c  4eb31e76       mov v22.16b, v19.16b
0x100482f8bc10  1830  4eaa1d53       mov v19.16b, v10.16b
0x100482f8bc14  1834  4ea21c4a       mov v10.16b, v2.16b
0x100482f8bc18  1838  4ebc1f89       mov v9.16b, v28.16b
0x100482f8bc1c  183c  4eb51ebc       mov v28.16b, v21.16b
0x100482f8bc20  1840  3dc067fa       ldr q26, [sp, #400]
0x100482f8bc24  1844  3dc05ff5       ldr q21, [sp, #368]
0x100482f8bc28  1848  1400005b       b #+0x16c (addr 0x100482f8bd94)
0x100482f8bc2c  184c  f941dfe8       ldr x8, [sp, #952]
0x100482f8bc30  1850  f94223ef       ldr x15, [sp, #1088]
0x100482f8bc34  1854  12000de8       and w8, w15, #0xf
0x100482f8bc38  1858  f941eff8       ldr x24, [sp, #984]
0x100482f8bc3c  185c  6b16031f       cmp w24, w22
0x100482f8bc40  1860  1a96331b       csel w27, w24, w22, lo
0x100482f8bc44  1864  f941f3f6       ldr x22, [sp, #992]
0x100482f8bc48  1868  6b1b02df       cmp w22, w27
0x100482f8bc4c  186c  1a9b32d8       csel w24, w22, w27, lo
0x100482f8bc50  1870  6b18011f       cmp w8, w24
0x100482f8bc54  1874  1a983116       csel w22, w8, w24, lo
0x100482f8bc58  1878  350000d6       cbnz w22, #+0x18 (addr 0x100482f8bc70)
0x100482f8bc5c  187c  3d807fe5       str q5, [sp, #496]
0x100482f8bc60  1880  3d8083e4       str q4, [sp, #512]
0x100482f8bc64  1884  3d8087e3       str q3, [sp, #528]
0x100482f8bc68  1888  3d808be2       str q2, [sp, #544]
0x100482f8bc6c  188c  1400004a       b #+0x128 (addr 0x100482f8bd94)
0x100482f8bc70  1890  f941f7e8       ldr x8, [sp, #1000]
0x100482f8bc74  1894  121c6108       and w8, w8, #0x1ffffff0
0x100482f8bc78  1898  f9421ff8       ldr x24, [sp, #1080]
0x100482f8bc7c  189c  0b080b08       add w8, w24, w8, lsl #2
0x100482f8bc80  18a0  121c61ef       and w15, w15, #0x1ffffff0
0x100482f8bc84  18a4  f94227f8       ldr x24, [sp, #1096]
0x100482f8bc88  18a8  0b0f0b0f       add w15, w24, w15, lsl #2
0x100482f8bc8c  18ac  3dc11ff1       ldr q17, [sp, #1136]
0x100482f8bc90  18b0  fd4243f2       ldr d18, [sp, #1152]
0x100482f8bc94  18b4  fd4237f4       ldr d20, [sp, #1128]
0x100482f8bc98  18b8  fd4217e4       ldr d4, [sp, #1064]
0x100482f8bc9c  18bc  fd421be5       ldr d5, [sp, #1072]
0x100482f8bca0  18c0  fd422be7       ldr d7, [sp, #1104]
0x100482f8bca4  18c4  1e2e1006       fmov s6, #0x70 (1.0000)
0x100482f8bca8  18c8  aa0803fb       mov cp, x8
0x100482f8bcac  18cc  f9420be8       ldr x8, [sp, #1040]
0x100482f8bcb0  18d0  f94207f8       ldr x24, [sp, #1032]
0x100482f8bcb4  18d4  f8520346       ldur x6, [x26, #-224]
0x100482f8bcb8  18d8  fd4213e3       ldr d3, [sp, #1056]
0x100482f8bcbc  18dc  fd420fe2       ldr d2, [sp, #1048]
0x100482f8bcc0  18e0  eb2663ff       cmp sp, x6
0x100482f8bcc4  18e4  54003849       b.ls #+0x708 (addr 0x100482f8c3cc)
0x100482f8bcc8  18e8  bc7b6b28       ldr s8, [x25, x27]
0x100482f8bccc  18ec  1e283849       fsub s9, s2, s8
0x100482f8bcd0  18f0  1e290922       fmul s2, s9, s9
0x100482f8bcd4  18f4  2a1803e6       mov w6, w24
0x100482f8bcd8  18f8  bc666b2a       ldr s10, [x25, x6]
0x100482f8bcdc  18fc  1e2a386b       fsub s11, s3, s10
0x100482f8bce0  1900  1e2b0963       fmul s3, s11, s11
0x100482f8bce4  1904  1e232842       fadd s2, s2, s3
0x100482f8bce8  1908  1e242040       fcmp s2, s4
0x100482f8bcec  190c  54000243       b.lo #+0x48 (addr 0x100482f8bd34)
0x100482f8bcf0  1910  1e252040       fcmp s2, s5
0x100482f8bcf4  1914  54000282       b.hs #+0x50 (addr 0x100482f8bd44)
0x100482f8bcf8  1918  1e202048       fcmp s2, #0.0
0x100482f8bcfc  191c  5400024d       b.le #+0x48 (addr 0x100482f8bd44)
0x100482f8bd00  1920  4e040502       dup v2.4s, v8.s[0]
0x100482f8bd04  1924  6e0c0542       mov v2.s[1], v10.s[0]
0x100482f8bd08  1928  2a0803e6       mov w6, w8
0x100482f8bd0c  192c  bc666b23       ldr s3, [x25, x6]
0x100482f8bd10  1930  6e140462       mov v2.s[2], v3.s[0]
0x100482f8bd14  1934  bc6f6b23       ldr s3, [x25, x15]
0x100482f8bd18  1938  6e1c0462       mov v2.s[3], v3.s[0]
0x100482f8bd1c  193c  4e22d622       fadd v2.4s, v17.4s, v2.4s
0x100482f8bd20  1940  1e262a43       fadd s3, s18, s6
0x100482f8bd24  1944  4ea21c51       mov v17.16b, v2.16b
0x100482f8bd28  1948  4ea31c72       mov v18.16b, v3.16b
0x100482f8bd2c  194c  fd0233e3       str d3, [sp, #1120]
0x100482f8bd30  1950  14000005       b #+0x14 (addr 0x100482f8bd44)
0x100482f8bd34  1954  1e2b28e7       fadd s7, s7, s11
0x100482f8bd38  1958  1e292a82       fadd s2, s20, s9
0x100482f8bd3c  195c  fd022fe2       str d2, [sp, #1112]
0x100482f8bd40  1960  4ea21c54       mov v20.16b, v2.16b
0x100482f8bd44  1964  1100137b       add w27, w27, #0x4 (4)
0x100482f8bd48  1968  11001318       add w24, w24, #0x4 (4)
0x100482f8bd4c  196c  11001108       add w8, w8, #0x4 (4)
0x100482f8bd50  1970  110011ef       add w15, w15, #0x4 (4)
0x100482f8bd54  1974  510006d6       sub w22, w22, #0x1 (1)
0x100482f8bd58  1978  35fffaf6       cbnz w22, #-0xa4 (addr 0x100482f8bcb4)
0x100482f8bd5c  197c  3d811ff1       str q17, [sp, #1136]
0x100482f8bd60  1980  fd0243f2       str d18, [sp, #1152]
0x100482f8bd64  1984  fd0237f4       str d20, [sp, #1128]
0x100482f8bd68  1988  f94193e6       ldr x6, [sp, #800]
0x100482f8bd6c  198c  3dc0dff1       ldr q17, [sp, #880]
0x100482f8bd70  1990  3dc097e6       ldr q6, [sp, #592]
0x100482f8bd74  1994  fd022be7       str d7, [sp, #1104]
0x100482f8bd78  1998  3dc093e7       ldr q7, [sp, #576]
0x100482f8bd7c  199c  3dc0e3f2       ldr q18, [sp, #896]
0x100482f8bd80  19a0  3dc0e7f4       ldr q20, [sp, #912]
0x100482f8bd84  19a4  3dc03feb       ldr q11, [sp, #240]
0x100482f8bd88  19a8  3dc043ea       ldr q10, [sp, #256]
0x100482f8bd8c  19ac  3dc053e9       ldr q9, [sp, #320]
0x100482f8bd90  19b0  3dc057e8       ldr q8, [sp, #336]
0x100482f8bd94  19b4  f9424fe8       ldr x8, [sp, #1176]
0x100482f8bd98  19b8  1100050f       add w15, w8, #0x1 (1)
0x100482f8bd9c  19bc  f9424bf6       ldr x22, [sp, #1168]
0x100482f8bda0  19c0  6b16011f       cmp w8, w22
0x100482f8bda4  19c4  54ff8ca1       b.ne #-0xe6c (addr 0x100482f8af38)
0x100482f8bda8  19c8  fd422be7       ldr d7, [sp, #1104]
0x100482f8bdac  19cc  f94253e6       ldr x6, [sp, #1184]
0x100482f8bdb0  19d0  bc266b27       str s7, [x25, x6]
0x100482f8bdb4  19d4  f94293e6       ldr x6, [sp, #1312]
0x100482f8bdb8  19d8  910090c8       add x8, x6, #0x24 (36)
0x100482f8bdbc  19dc  fd422fe6       ldr d6, [sp, #1112]
0x100482f8bdc0  19e0  bc286b26       str s6, [x25, x8]
0x100482f8bdc4  19e4  fd4233e5       ldr d5, [sp, #1120]
0x100482f8bdc8  19e8  f94257e8       ldr x8, [sp, #1192]
0x100482f8bdcc  19ec  bc286b25       str s5, [x25, x8]
0x100482f8bdd0  19f0  3dc11fe2       ldr q2, [sp, #1136]
0x100482f8bdd4  19f4  f9425be8       ldr x8, [sp, #1200]
0x100482f8bdd8  19f8  3ca86b22       str q2, [x25, x8]
0x100482f8bddc  19fc  14000002       b #+0x8 (addr 0x100482f8bde4)
0x100482f8bde0  1a00  f94293e6       ldr x6, [sp, #1312]
0x100482f8bde4  1a04  110040c2       add w2, w6, #0x10 (16)
0x100482f8bde8  1a08  f9025be2       str x2, [sp, #1200]
0x100482f8bdec  1a0c  f9429be7       ldr x7, [sp, #1328]
0x100482f8bdf0  1a10  f9426be0       ldr x0, [sp, #1232]
0x100482f8bdf4  1a14  97fc062b       bl #-0xfe754 (addr 0x100482e8d6a0)
0x100482f8bdf8  1a18  f94293e4       ldr x4, [sp, #1312]
0x100482f8bdfc  1a1c  1100c083       add w3, w4, #0x30 (48)
0x100482f8be00  1a20  f9429be7       ldr x7, [sp, #1328]
0x100482f8be04  1a24  f9426be0       ldr x0, [sp, #1232]
0x100482f8be08  1a28  f94267e2       ldr x2, [sp, #1224]
0x100482f8be0c  1a2c  fd4263e0       ldr d0, [sp, #1216]
0x100482f8be10  1a30  fd425fe1       ldr d1, [sp, #1208]
0x100482f8be14  1a34  f9425be5       ldr x5, [sp, #1200]
0x100482f8be18  1a38  97fc0623       bl #-0xfe774 (addr 0x100482e8d6a4)
0x100482f8be1c  1a3c  f9428bf3       ldr x19, [sp, #1296]
0x100482f8be20  1a40  f9426fe6       ldr x6, [sp, #1240]
0x100482f8be24  1a44  6b1300df       cmp w6, w19
0x100482f8be28  1a48  54000609       b.ls #+0xc0 (addr 0x100482f8bee8)
0x100482f8be2c  1a4c  f9427fe8       ldr x8, [sp, #1272]
0x100482f8be30  1a50  f94273e9       ldr x9, [sp, #1248]
0x100482f8be34  1a54  0b08012a       add w10, w9, w8
0x100482f8be38  1a58  f94293eb       ldr x11, [sp, #1312]
0x100482f8be3c  1a5c  9102016c       add x12, x11, #0x80 (128)
0x100482f8be40  1a60  f94287ed       ldr x13, [sp, #1288]
0x100482f8be44  1a64  bc6c69a2       ldr s2, [x13, x12]
0x100482f8be48  1a68  bc2a69a2       str s2, [x13, x10]
0x100482f8be4c  1a6c  f94277ea       ldr x10, [sp, #1256]
0x100482f8be50  1a70  0b08014c       add w12, w10, w8
0x100482f8be54  1a74  9102116e       add x14, x11, #0x84 (132)
0x100482f8be58  1a78  bc6e69a2       ldr s2, [x13, x14]
0x100482f8be5c  1a7c  bc2c69a2       str s2, [x13, x12]
0x100482f8be60  1a80  f9427bec       ldr x12, [sp, #1264]
0x100482f8be64  1a84  0b08018e       add w14, w12, w8
0x100482f8be68  1a88  9102216f       add x15, x11, #0x88 (136)
0x100482f8be6c  1a8c  bc6f69a2       ldr s2, [x13, x15]
0x100482f8be70  1a90  bc2e69a2       str s2, [x13, x14]
0x100482f8be74  1a94  f94283ee       ldr x14, [sp, #1280]
0x100482f8be78  1a98  0b0801c8       add w8, w14, w8
0x100482f8be7c  1a9c  9102316f       add x15, x11, #0x8c (140)
0x100482f8be80  1aa0  bc6f69a2       ldr s2, [x13, x15]
0x100482f8be84  1aa4  bc2869a2       str s2, [x13, x8]
0x100482f8be88  1aa8  aa0903f5       mov x21, x9
0x100482f8be8c  1aac  aa0d03e9       mov x9, x13
0x100482f8be90  1ab0  aa0c03ef       mov x15, x12
0x100482f8be94  1ab4  aa0603ed       mov x13, x6
0x100482f8be98  1ab8  1e2e1008       fmov s8, #0x70 (1.0000)
0x100482f8be9c  1abc  fd421be4       ldr d4, [sp, #1072]
0x100482f8bea0  1ac0  fd4217e2       ldr d2, [sp, #1064]
0x100482f8bea4  1ac4  3dc0e7e7       ldr q7, [sp, #912]
0x100482f8bea8  1ac8  3dc0e3e5       ldr q5, [sp, #896]
0x100482f8beac  1acc  3dc0dfe3       ldr q3, [sp, #880]
0x100482f8beb0  1ad0  d2800042       movz x2, #0x2
0x100482f8beb4  1ad4  d2800020       movz x0, #0x1
0x100482f8beb8  1ad8  d2800001       movz x1, #0x0
0x100482f8bebc  1adc  f94023e6       ldr x6, [sp, #64]
0x100482f8bec0  1ae0  f9400ffc       ldr x28, [sp, #24]
0x100482f8bec4  1ae4  f9400bfb       ldr cp, [sp, #16]
0x100482f8bec8  1ae8  f94007f9       ldr x25, [sp, #8]
0x100482f8becc  1aec  f941fbec       ldr x12, [sp, #1008]
0x100482f8bed0  1af0  f941fff8       ldr x24, [sp, #1016]
0x100482f8bed4  1af4  f94203eb       ldr x11, [sp, #1024]
0x100482f8bed8  1af8  f94013f4       ldr x20, [sp, #32]
0x100482f8bedc  1afc  f94247f7       ldr x23, [sp, #1160]
0x100482f8bee0  1b00  f94017f6       ldr x22, [sp, #40]
0x100482f8bee4  1b04  14000019       b #+0x64 (addr 0x100482f8bf48)
0x100482f8bee8  1b08  f94287e9       ldr x9, [sp, #1288]
0x100482f8beec  1b0c  f94283ee       ldr x14, [sp, #1280]
0x100482f8bef0  1b10  f9427bef       ldr x15, [sp, #1264]
0x100482f8bef4  1b14  f94273f5       ldr x21, [sp, #1248]
0x100482f8bef8  1b18  aa0603ed       mov x13, x6
0x100482f8befc  1b1c  1e2e1008       fmov s8, #0x70 (1.0000)
0x100482f8bf00  1b20  fd421be4       ldr d4, [sp, #1072]
0x100482f8bf04  1b24  fd4217e2       ldr d2, [sp, #1064]
0x100482f8bf08  1b28  3dc0e7e7       ldr q7, [sp, #912]
0x100482f8bf0c  1b2c  3dc0e3e5       ldr q5, [sp, #896]
0x100482f8bf10  1b30  3dc0dfe3       ldr q3, [sp, #880]
0x100482f8bf14  1b34  d2800042       movz x2, #0x2
0x100482f8bf18  1b38  d2800020       movz x0, #0x1
0x100482f8bf1c  1b3c  d2800001       movz x1, #0x0
0x100482f8bf20  1b40  f94023e6       ldr x6, [sp, #64]
0x100482f8bf24  1b44  f9400ffc       ldr x28, [sp, #24]
0x100482f8bf28  1b48  f9400bfb       ldr cp, [sp, #16]
0x100482f8bf2c  1b4c  f94007f9       ldr x25, [sp, #8]
0x100482f8bf30  1b50  f941fbec       ldr x12, [sp, #1008]
0x100482f8bf34  1b54  f941fff8       ldr x24, [sp, #1016]
0x100482f8bf38  1b58  f94203eb       ldr x11, [sp, #1024]
0x100482f8bf3c  1b5c  f94013f4       ldr x20, [sp, #32]
0x100482f8bf40  1b60  f94247f7       ldr x23, [sp, #1160]
0x100482f8bf44  1b64  f94017f6       ldr x22, [sp, #40]
0x100482f8bf48  1b68  11000673       add w19, w19, #0x1 (1)
0x100482f8bf4c  1b6c  f9428fe8       ldr x8, [sp, #1304]
0x100482f8bf50  1b70  6b08027f       cmp w19, w8
0x100482f8bf54  1b74  54ff5f01       b.ne #-0x1420 (addr 0x100482f8ab34)
0x100482f8bf58  1b78  f94293e6       ldr x6, [sp, #1312]
0x100482f8bf5c  1b7c  110900c6       add w6, w6, #0x240 (576)
0x100482f8bf60  1b80  f94297e8       ldr x8, [sp, #1320]
0x100482f8bf64  1b84  b9000106       str w6, [x8]
0x100482f8bf68  1b88  17fffac8       b #-0x14e0 (addr 0x100482f8aa88)
0x100482f8bf6c  1b8c  97fc0719       bl #-0xfe39c (addr 0x100482e8dbd0)
0x100482f8bf70  1b90  f94287e6       ldr x6, [sp, #1288]
0x100482f8bf74  1b94  f9429be7       ldr x7, [sp, #1328]
0x100482f8bf78  1b98  f9424fe0       ldr x0, [sp, #1176]
0x100482f8bf7c  1b9c  17fff924       b #-0x1b70 (addr 0x100482f8a40c)
0x100482f8bf80  1ba0  1e6620c0       fcmp d6, d6
0x100482f8bf84  1ba4  54000080       b.eq #+0x10 (addr 0x100482f8bf94)
0x100482f8bf88  1ba8  d2800001       movz x1, #0x0
0x100482f8bf8c  1bac  aa0103ec       mov x12, x1
0x100482f8bf90  1bb0  17fff954       b #-0x1ab0 (addr 0x100482f8a4e0)
0x100482f8bf94  1bb4  1e2020a8       fcmp s5, #0.0
0x100482f8bf98  1bb8  54000063       b.lo #+0xc (addr 0x100482f8bfa4)
0x100482f8bf9c  1bbc  9280000c       movn x12, #0x0
0x100482f8bfa0  1bc0  17fff950       b #-0x1ac0 (addr 0x100482f8a4e0)
0x100482f8bfa4  1bc4  d280000c       movz x12, #0x0
0x100482f8bfa8  1bc8  17fff94e       b #-0x1ac8 (addr 0x100482f8a4e0)
0x100482f8bfac  1bcc  1e6720e0       fcmp d7, d7
0x100482f8bfb0  1bd0  54000060       b.eq #+0xc (addr 0x100482f8bfbc)
0x100482f8bfb4  1bd4  d280000c       movz x12, #0x0
0x100482f8bfb8  1bd8  17fff952       b #-0x1ab8 (addr 0x100482f8a500)
0x100482f8bfbc  1bdc  1e2020c8       fcmp s6, #0.0
0x100482f8bfc0  1be0  54ffffa3       b.lo #-0xc (addr 0x100482f8bfb4)
0x100482f8bfc4  1be4  9280000c       movn x12, #0x0
0x100482f8bfc8  1be8  17fff94e       b #-0x1ac8 (addr 0x100482f8a500)
0x100482f8bfcc  1bec  fd024be3       str d3, [sp, #1168]
0x100482f8bfd0  1bf0  f90283f5       str x21, [sp, #1280]
0x100482f8bfd4  1bf4  f90277f4       str x20, [sp, #1256]
0x100482f8bfd8  1bf8  97fc06fe       bl #-0xfe408 (addr 0x100482e8dbd0)
0x100482f8bfdc  1bfc  f94287e9       ldr x9, [sp, #1288]
0x100482f8bfe0  1c00  f94023e6       ldr x6, [sp, #64]
0x100482f8bfe4  1c04  f941ffef       ldr x15, [sp, #1016]
0x100482f8bfe8  1c08  f94017ed       ldr x13, [sp, #40]
0x100482f8bfec  1c0c  f9428fe8       ldr x8, [sp, #1304]
0x100482f8bff0  1c10  f94257ec       ldr x12, [sp, #1192]
0x100482f8bff4  1c14  f9424fea       ldr x10, [sp, #1176]
0x100482f8bff8  1c18  f94277f4       ldr x20, [sp, #1256]
0x100482f8bffc  1c1c  fd424be3       ldr d3, [sp, #1168]
0x100482f8c000  1c20  f9426fe0       ldr x0, [sp, #1240]
0x100482f8c004  1c24  f9427bf3       ldr x19, [sp, #1264]
0x100482f8c008  1c28  f9427fee       ldr x14, [sp, #1272]
0x100482f8c00c  1c2c  f94283f5       ldr x21, [sp, #1280]
0x100482f8c010  1c30  17fff980       b #-0x1a00 (addr 0x100482f8a610)
0x100482f8c014  1c34  fd024be3       str d3, [sp, #1168]
0x100482f8c018  1c38  f9027bec       str x12, [sp, #1264]
0x100482f8c01c  1c3c  f90283e2       str x2, [sp, #1280]
0x100482f8c020  1c40  97fc06ec       bl #-0xfe450 (addr 0x100482e8dbd0)
0x100482f8c024  1c44  f94287e9       ldr x9, [sp, #1288]
0x100482f8c028  1c48  f94023e6       ldr x6, [sp, #64]
0x100482f8c02c  1c4c  f941fbf4       ldr x20, [sp, #1008]
0x100482f8c030  1c50  f94247ee       ldr x14, [sp, #1160]
0x100482f8c034  1c54  f9428fe8       ldr x8, [sp, #1304]
0x100482f8c038  1c58  f94257f6       ldr x22, [sp, #1192]
0x100482f8c03c  1c5c  f9424fea       ldr x10, [sp, #1176]
0x100482f8c040  1c60  f94283e2       ldr x2, [sp, #1280]
0x100482f8c044  1c64  fd424be3       ldr d3, [sp, #1168]
0x100482f8c048  1c68  f9427feb       ldr x11, [sp, #1272]
0x100482f8c04c  1c6c  f94277e0       ldr x0, [sp, #1256]
0x100482f8c050  1c70  f94273f5       ldr x21, [sp, #1248]
0x100482f8c054  1c74  f9426ff3       ldr x19, [sp, #1240]
0x100482f8c058  1c78  f9427bec       ldr x12, [sp, #1264]
0x100482f8c05c  1c7c  17fff9b2       b #-0x1938 (addr 0x100482f8a724)
0x100482f8c060  1c80  fd024be3       str d3, [sp, #1168]
0x100482f8c064  1c84  f9025bf5       str x21, [sp, #1200]
0x100482f8c068  1c88  f90283e2       str x2, [sp, #1280]
0x100482f8c06c  1c8c  97fc06d9       bl #-0xfe49c (addr 0x100482e8dbd0)
0x100482f8c070  1c90  f94287e9       ldr x9, [sp, #1288]
0x100482f8c074  1c94  f94023e6       ldr x6, [sp, #64]
0x100482f8c078  1c98  f94007ef       ldr x15, [sp, #8]
0x100482f8c07c  1c9c  f94013ec       ldr x12, [sp, #32]
0x100482f8c080  1ca0  f9427feb       ldr x11, [sp, #1272]
0x100482f8c084  1ca4  f94257f6       ldr x22, [sp, #1192]
0x100482f8c088  1ca8  f9424fea       ldr x10, [sp, #1176]
0x100482f8c08c  1cac  f94283e2       ldr x2, [sp, #1280]
0x100482f8c090  1cb0  fd424be3       ldr d3, [sp, #1168]
0x100482f8c094  1cb4  f9427be0       ldr x0, [sp, #1264]
0x100482f8c098  1cb8  f9426ff3       ldr x19, [sp, #1240]
0x100482f8c09c  1cbc  f94273ed       ldr x13, [sp, #1248]
0x100482f8c0a0  1cc0  f9425bf5       ldr x21, [sp, #1200]
0x100482f8c0a4  1cc4  17fff9e0       b #-0x1880 (addr 0x100482f8a824)
0x100482f8c0a8  1cc8  fd024be3       str d3, [sp, #1168]
0x100482f8c0ac  1ccc  f90253ea       str x10, [sp, #1184]
0x100482f8c0b0  1cd0  f90283e2       str x2, [sp, #1280]
0x100482f8c0b4  1cd4  97fc06c7       bl #-0xfe4e4 (addr 0x100482e8dbd0)
0x100482f8c0b8  1cd8  f94287e9       ldr x9, [sp, #1288]
0x100482f8c0bc  1cdc  f94023e6       ldr x6, [sp, #64]
0x100482f8c0c0  1ce0  f9400bf3       ldr x19, [sp, #16]
0x100482f8c0c4  1ce4  f94203ed       ldr x13, [sp, #1024]
0x100482f8c0c8  1ce8  f94283e2       ldr x2, [sp, #1280]
0x100482f8c0cc  1cec  f9427feb       ldr x11, [sp, #1272]
0x100482f8c0d0  1cf0  fd424be3       ldr d3, [sp, #1168]
0x100482f8c0d4  1cf4  f9427be8       ldr x8, [sp, #1264]
0x100482f8c0d8  1cf8  f94277e0       ldr x0, [sp, #1256]
0x100482f8c0dc  1cfc  f94257f5       ldr x21, [sp, #1192]
0x100482f8c0e0  1d00  f94273f4       ldr x20, [sp, #1248]
0x100482f8c0e4  1d04  f9426bee       ldr x14, [sp, #1232]
0x100482f8c0e8  1d08  f94253ea       ldr x10, [sp, #1184]
0x100482f8c0ec  1d0c  17fffa12       b #-0x17b8 (addr 0x100482f8a934)
0x100482f8c0f0  1d10  f9028bf3       str x19, [sp, #1296]
0x100482f8c0f4  1d14  97fc06b7       bl #-0xfe524 (addr 0x100482e8dbd0)
0x100482f8c0f8  1d18  f9428bf3       ldr x19, [sp, #1296]
0x100482f8c0fc  1d1c  f94287e9       ldr x9, [sp, #1288]
0x100482f8c100  1d20  f94283ee       ldr x14, [sp, #1280]
0x100482f8c104  1d24  f9427bef       ldr x15, [sp, #1264]
0x100482f8c108  1d28  f94273f5       ldr x21, [sp, #1248]
0x100482f8c10c  1d2c  f9426fed       ldr x13, [sp, #1240]
0x100482f8c110  1d30  1e2e1008       fmov s8, #0x70 (1.0000)
0x100482f8c114  1d34  fd421be4       ldr d4, [sp, #1072]
0x100482f8c118  1d38  fd4217e2       ldr d2, [sp, #1064]
0x100482f8c11c  1d3c  3dc0e7e7       ldr q7, [sp, #912]
0x100482f8c120  1d40  3dc0e3e5       ldr q5, [sp, #896]
0x100482f8c124  1d44  3dc0dfe3       ldr q3, [sp, #880]
0x100482f8c128  1d48  d2800042       movz x2, #0x2
0x100482f8c12c  1d4c  d2800020       movz x0, #0x1
0x100482f8c130  1d50  d2800001       movz x1, #0x0
0x100482f8c134  1d54  f94023e6       ldr x6, [sp, #64]
0x100482f8c138  1d58  f9400ffc       ldr x28, [sp, #24]
0x100482f8c13c  1d5c  f9400bfb       ldr cp, [sp, #16]
0x100482f8c140  1d60  f94007f9       ldr x25, [sp, #8]
0x100482f8c144  1d64  f941fbec       ldr x12, [sp, #1008]
0x100482f8c148  1d68  f941fff8       ldr x24, [sp, #1016]
0x100482f8c14c  1d6c  f94203eb       ldr x11, [sp, #1024]
0x100482f8c150  1d70  f94013f4       ldr x20, [sp, #32]
0x100482f8c154  1d74  f94247f7       ldr x23, [sp, #1160]
0x100482f8c158  1d78  f94017f6       ldr x22, [sp, #40]
0x100482f8c15c  1d7c  17fffa79       b #-0x161c (addr 0x100482f8ab40)
0x100482f8c160  1d80  1e6520a0       fcmp d5, d5
0x100482f8c164  1d84  54000060       b.eq #+0xc (addr 0x100482f8c170)
0x100482f8c168  1d88  d2800008       movz x8, #0x0
0x100482f8c16c  1d8c  17fffad2       b #-0x14b8 (addr 0x100482f8acb4)
0x100482f8c170  1d90  1e202088       fcmp s4, #0.0
0x100482f8c174  1d94  54ffffa3       b.lo #-0xc (addr 0x100482f8c168)
0x100482f8c178  1d98  92800008       movn x8, #0x0
0x100482f8c17c  1d9c  17ffface       b #-0x14c8 (addr 0x100482f8acb4)
0x100482f8c180  1da0  1e6620c0       fcmp d6, d6
0x100482f8c184  1da4  54000060       b.eq #+0xc (addr 0x100482f8c190)
0x100482f8c188  1da8  d280000b       movz x11, #0x0
0x100482f8c18c  1dac  17fffae9       b #-0x145c (addr 0x100482f8ad30)
0x100482f8c190  1db0  1e202068       fcmp s3, #0.0
0x100482f8c194  1db4  54ffffa3       b.lo #-0xc (addr 0x100482f8c188)
0x100482f8c198  1db8  9280000b       movn x11, #0x0
0x100482f8c19c  1dbc  17fffae5       b #-0x146c (addr 0x100482f8ad30)
0x100482f8c1a0  1dc0  f9016fe1       str x1, [sp, #728]
0x100482f8c1a4  1dc4  f9016be2       str x2, [sp, #720]
0x100482f8c1a8  1dc8  f90167e3       str x3, [sp, #712]
0x100482f8c1ac  1dcc  f90163e5       str x5, [sp, #704]
0x100482f8c1b0  1dd0  f9015fe7       str x7, [sp, #696]
0x100482f8c1b4  1dd4  f90153f4       str x20, [sp, #672]
0x100482f8c1b8  1dd8  3d8097e8       str q8, [sp, #592]
0x100482f8c1bc  1ddc  3d8093e9       str q9, [sp, #576]
0x100482f8c1c0  1de0  3d808fea       str q10, [sp, #560]
0x100482f8c1c4  1de4  3d808beb       str q11, [sp, #544]
0x100482f8c1c8  1de8  3d8087e1       str q1, [sp, #528]
0x100482f8c1cc  1dec  3d8083e0       str q0, [sp, #512]
0x100482f8c1d0  1df0  3d807ffc       str q28, [sp, #496]
0x100482f8c1d4  1df4  3d807bfb       str q27, [sp, #480]
0x100482f8c1d8  1df8  3d8077fa       str q26, [sp, #464]
0x100482f8c1dc  1dfc  3d8073f9       str q25, [sp, #448]
0x100482f8c1e0  1e00  3d806ff8       str q24, [sp, #432]
0x100482f8c1e4  1e04  3d806bf7       str q23, [sp, #416]
0x100482f8c1e8  1e08  3d8067f6       str q22, [sp, #400]
0x100482f8c1ec  1e0c  3d8063f5       str q21, [sp, #384]
0x100482f8c1f0  1e10  3d805ff4       str q20, [sp, #368]
0x100482f8c1f4  1e14  3d805bf3       str q19, [sp, #352]
0x100482f8c1f8  1e18  3d8057f2       str q18, [sp, #336]
0x100482f8c1fc  1e1c  3d8053f1       str q17, [sp, #320]
0x100482f8c200  1e20  3d804ff0       str q16, [sp, #304]
0x100482f8c204  1e24  3d804bee       str q14, [sp, #288]
0x100482f8c208  1e28  3d8047ed       str q13, [sp, #272]
0x100482f8c20c  1e2c  3d8043ec       str q12, [sp, #256]
0x100482f8c210  1e30  97fc0670       bl #-0xfe640 (addr 0x100482e8dbd0)
0x100482f8c214  1e34  f94287f5       ldr x21, [sp, #1288]
0x100482f8c218  1e38  f9424fe9       ldr x9, [sp, #1176]
0x100482f8c21c  1e3c  f9416fe1       ldr x1, [sp, #728]
0x100482f8c220  1e40  f9416be2       ldr x2, [sp, #720]
0x100482f8c224  1e44  f94167e3       ldr x3, [sp, #712]
0x100482f8c228  1e48  f94163e5       ldr x5, [sp, #704]
0x100482f8c22c  1e4c  f9415fe7       ldr x7, [sp, #696]
0x100482f8c230  1e50  f94153f4       ldr x20, [sp, #672]
0x100482f8c234  1e54  f9414bf9       ldr x25, [sp, #656]
0x100482f8c238  1e58  f94147fc       ldr x28, [sp, #648]
0x100482f8c23c  1e5c  f94143fb       ldr cp, [sp, #640]
0x100482f8c240  1e60  f9413ff7       ldr x23, [sp, #632]
0x100482f8c244  1e64  f94137f8       ldr x24, [sp, #616]
0x100482f8c248  1e68  d2800004       movz x4, #0x0
0x100482f8c24c  1e6c  3dc097e8       ldr q8, [sp, #592]
0x100482f8c250  1e70  3dc093e9       ldr q9, [sp, #576]
0x100482f8c254  1e74  3dc08fea       ldr q10, [sp, #560]
0x100482f8c258  1e78  3dc08beb       ldr q11, [sp, #544]
0x100482f8c25c  1e7c  3dc087e1       ldr q1, [sp, #528]
0x100482f8c260  1e80  3dc083e0       ldr q0, [sp, #512]
0x100482f8c264  1e84  3dc07ffc       ldr q28, [sp, #496]
0x100482f8c268  1e88  3dc07bfb       ldr q27, [sp, #480]
0x100482f8c26c  1e8c  3dc077fa       ldr q26, [sp, #464]
0x100482f8c270  1e90  3dc073f9       ldr q25, [sp, #448]
0x100482f8c274  1e94  3dc06ff8       ldr q24, [sp, #432]
0x100482f8c278  1e98  3dc06bf7       ldr q23, [sp, #416]
0x100482f8c27c  1e9c  3dc067f6       ldr q22, [sp, #400]
0x100482f8c280  1ea0  3dc063f5       ldr q21, [sp, #384]
0x100482f8c284  1ea4  3dc05ff4       ldr q20, [sp, #368]
0x100482f8c288  1ea8  3dc05bf3       ldr q19, [sp, #352]
0x100482f8c28c  1eac  3dc057f2       ldr q18, [sp, #336]
0x100482f8c290  1eb0  3dc053f1       ldr q17, [sp, #320]
0x100482f8c294  1eb4  3dc04ff0       ldr q16, [sp, #304]
0x100482f8c298  1eb8  3dc04bee       ldr q14, [sp, #288]
0x100482f8c29c  1ebc  3dc047ed       ldr q13, [sp, #272]
0x100482f8c2a0  1ec0  3dc043ec       ldr q12, [sp, #256]
0x100482f8c2a4  1ec4  f94043ed       ldr x13, [sp, #128]
0x100482f8c2a8  1ec8  f9403ff3       ldr x19, [sp, #120]
0x100482f8c2ac  1ecc  f9403bee       ldr x14, [sp, #112]
0x100482f8c2b0  1ed0  f94037ef       ldr x15, [sp, #104]
0x100482f8c2b4  1ed4  f94033f6       ldr x22, [sp, #96]
0x100482f8c2b8  1ed8  f9402fe8       ldr x8, [sp, #88]
0x100482f8c2bc  1edc  f9402bec       ldr x12, [sp, #80]
0x100482f8c2c0  1ee0  f94027e6       ldr x6, [sp, #72]
0x100482f8c2c4  1ee4  17fffb45       b #-0x12ec (addr 0x100482f8afd8)
0x100482f8c2c8  1ee8  f9016fe1       str x1, [sp, #728]
0x100482f8c2cc  1eec  f9016be2       str x2, [sp, #720]
0x100482f8c2d0  1ef0  f90167e3       str x3, [sp, #712]
0x100482f8c2d4  1ef4  f90163e5       str x5, [sp, #704]
0x100482f8c2d8  1ef8  f9015fe7       str x7, [sp, #696]
0x100482f8c2dc  1efc  f90153f4       str x20, [sp, #672]
0x100482f8c2e0  1f00  f9004ff6       str x22, [sp, #152]
0x100482f8c2e4  1f04  3d805ff5       str q21, [sp, #368]
0x100482f8c2e8  1f08  3d805bf6       str q22, [sp, #352]
0x100482f8c2ec  1f0c  3d8073f9       str q25, [sp, #448]
0x100482f8c2f0  1f10  3d806ff8       str q24, [sp, #432]
0x100482f8c2f4  1f14  3d806bf7       str q23, [sp, #416]
0x100482f8c2f8  1f18  3d8067fa       str q26, [sp, #400]
0x100482f8c2fc  1f1c  3d8063fb       str q27, [sp, #384]
0x100482f8c300  1f20  3d807bfc       str q28, [sp, #480]
0x100482f8c304  1f24  3d8077e0       str q0, [sp, #464]
0x100482f8c308  1f28  3d808fe1       str q1, [sp, #560]
0x100482f8c30c  1f2c  3d808be2       str q2, [sp, #544]
0x100482f8c310  1f30  3d8087e3       str q3, [sp, #528]
0x100482f8c314  1f34  3d8083e4       str q4, [sp, #512]
0x100482f8c318  1f38  3d807fe5       str q5, [sp, #496]
0x100482f8c31c  1f3c  3d8097e6       str q6, [sp, #592]
0x100482f8c320  1f40  3d8093e7       str q7, [sp, #576]
0x100482f8c324  1f44  97fc062b       bl #-0xfe754 (addr 0x100482e8dbd0)
0x100482f8c328  1f48  f94287f9       ldr x25, [sp, #1288]
0x100482f8c32c  1f4c  f94227e8       ldr x8, [sp, #1096]
0x100482f8c330  1f50  f9421fe9       ldr x9, [sp, #1080]
0x100482f8c334  1f54  f941b3ec       ldr x12, [sp, #864]
0x100482f8c338  1f58  f94193e6       ldr x6, [sp, #800]
0x100482f8c33c  1f5c  f9418ffc       ldr x28, [sp, #792]
0x100482f8c340  1f60  f9418be4       ldr x4, [sp, #784]
0x100482f8c344  1f64  f94187ea       ldr x10, [sp, #776]
0x100482f8c348  1f68  f94183f5       ldr x21, [sp, #768]
0x100482f8c34c  1f6c  f9417fe0       ldr x0, [sp, #760]
0x100482f8c350  1f70  f9417bf7       ldr x23, [sp, #752]
0x100482f8c354  1f74  f94177f3       ldr x19, [sp, #744]
0x100482f8c358  1f78  f94173ee       ldr x14, [sp, #736]
0x100482f8c35c  1f7c  f9416fe1       ldr x1, [sp, #728]
0x100482f8c360  1f80  f9416be2       ldr x2, [sp, #720]
0x100482f8c364  1f84  f94167e3       ldr x3, [sp, #712]
0x100482f8c368  1f88  f94163e5       ldr x5, [sp, #704]
0x100482f8c36c  1f8c  f9415fe7       ldr x7, [sp, #696]
0x100482f8c370  1f90  f9415bed       ldr x13, [sp, #688]
0x100482f8c374  1f94  f94157eb       ldr x11, [sp, #680]
0x100482f8c378  1f98  f94153f4       ldr x20, [sp, #672]
0x100482f8c37c  1f9c  f9404ff6       ldr x22, [sp, #152]
0x100482f8c380  1fa0  3dc05ff5       ldr q21, [sp, #368]
0x100482f8c384  1fa4  3dc05bf6       ldr q22, [sp, #352]
0x100482f8c388  1fa8  3dc073f9       ldr q25, [sp, #448]
0x100482f8c38c  1fac  3dc06ff8       ldr q24, [sp, #432]
0x100482f8c390  1fb0  3dc06bf7       ldr q23, [sp, #416]
0x100482f8c394  1fb4  3dc067fa       ldr q26, [sp, #400]
0x100482f8c398  1fb8  3dc063fb       ldr q27, [sp, #384]
0x100482f8c39c  1fbc  3dc07bfc       ldr q28, [sp, #480]
0x100482f8c3a0  1fc0  3dc077e0       ldr q0, [sp, #464]
0x100482f8c3a4  1fc4  3dc08fe1       ldr q1, [sp, #560]
0x100482f8c3a8  1fc8  3dc08be2       ldr q2, [sp, #544]
0x100482f8c3ac  1fcc  3dc087e3       ldr q3, [sp, #528]
0x100482f8c3b0  1fd0  3dc083e4       ldr q4, [sp, #512]
0x100482f8c3b4  1fd4  3dc07fe5       ldr q5, [sp, #496]
0x100482f8c3b8  1fd8  3dc097e6       ldr q6, [sp, #592]
0x100482f8c3bc  1fdc  3dc093e7       ldr q7, [sp, #576]
0x100482f8c3c0  1fe0  f9404bfb       ldr cp, [sp, #144]
0x100482f8c3c4  1fe4  f94047f8       ldr x24, [sp, #136]
0x100482f8c3c8  1fe8  17fffbc6       b #-0x10e8 (addr 0x100482f8b2e0)
0x100482f8c3cc  1fec  3d808fe1       str q1, [sp, #560]
0x100482f8c3d0  1ff0  3d807bfc       str q28, [sp, #480]
0x100482f8c3d4  1ff4  3d8077e0       str q0, [sp, #464]
0x100482f8c3d8  1ff8  3d8073f9       str q25, [sp, #448]
0x100482f8c3dc  1ffc  3d806ff8       str q24, [sp, #432]
0x100482f8c3e0  2000  3d806bf7       str q23, [sp, #416]
0x100482f8c3e4  2004  3d8067fa       str q26, [sp, #400]
0x100482f8c3e8  2008  3d8063fb       str q27, [sp, #384]
0x100482f8c3ec  200c  f90227f6       str x22, [sp, #1096]
0x100482f8c3f0  2010  f90223ef       str x15, [sp, #1088]
0x100482f8c3f4  2014  f9020be8       str x8, [sp, #1040]
0x100482f8c3f8  2018  f90207f8       str x24, [sp, #1032]
0x100482f8c3fc  201c  f9021ffb       str cp, [sp, #1080]
0x100482f8c400  2020  3d811ff1       str q17, [sp, #1136]
0x100482f8c404  2024  fd0243f2       str d18, [sp, #1152]
0x100482f8c408  2028  fd0237f4       str d20, [sp, #1128]
0x100482f8c40c  202c  fd022be7       str d7, [sp, #1104]
0x100482f8c410  2030  f9016fe1       str x1, [sp, #728]
0x100482f8c414  2034  f9016be2       str x2, [sp, #720]
0x100482f8c418  2038  f90167e3       str x3, [sp, #712]
0x100482f8c41c  203c  f90163e5       str x5, [sp, #704]
0x100482f8c420  2040  f9015fe7       str x7, [sp, #696]
0x100482f8c424  2044  f90153f4       str x20, [sp, #672]
0x100482f8c428  2048  97fc05ea       bl #-0xfe858 (addr 0x100482e8dbd0)
0x100482f8c42c  204c  f94287f9       ldr x25, [sp, #1288]
0x100482f8c430  2050  3dc08fe1       ldr q1, [sp, #560]
0x100482f8c434  2054  3dc07bfc       ldr q28, [sp, #480]
0x100482f8c438  2058  3dc077e0       ldr q0, [sp, #464]
0x100482f8c43c  205c  3dc073f9       ldr q25, [sp, #448]
0x100482f8c440  2060  3dc06ff8       ldr q24, [sp, #432]
0x100482f8c444  2064  3dc06bf7       ldr q23, [sp, #416]
0x100482f8c448  2068  3dc067fa       ldr q26, [sp, #400]
0x100482f8c44c  206c  3dc063fb       ldr q27, [sp, #384]
0x100482f8c450  2070  3dc05ff5       ldr q21, [sp, #368]
0x100482f8c454  2074  3dc05bf6       ldr q22, [sp, #352]
0x100482f8c458  2078  3dc04ff0       ldr q16, [sp, #304]
0x100482f8c45c  207c  3dc04bf3       ldr q19, [sp, #288]
0x100482f8c460  2080  3dc047ed       ldr q13, [sp, #272]
0x100482f8c464  2084  3dc03bec       ldr q12, [sp, #224]
0x100482f8c468  2088  3dc037ee       ldr q14, [sp, #208]
0x100482f8c46c  208c  f94227f6       ldr x22, [sp, #1096]
0x100482f8c470  2090  f94223ef       ldr x15, [sp, #1088]
0x100482f8c474  2094  f9420be8       ldr x8, [sp, #1040]
0x100482f8c478  2098  f94207f8       ldr x24, [sp, #1032]
0x100482f8c47c  209c  f9421ffb       ldr cp, [sp, #1080]
0x100482f8c480  20a0  3dc11ff1       ldr q17, [sp, #1136]
0x100482f8c484  20a4  fd4243f2       ldr d18, [sp, #1152]
0x100482f8c488  20a8  fd4237f4       ldr d20, [sp, #1128]
0x100482f8c48c  20ac  fd422be7       ldr d7, [sp, #1104]
0x100482f8c490  20b0  1e2e1006       fmov s6, #0x70 (1.0000)
0x100482f8c494  20b4  fd421be5       ldr d5, [sp, #1072]
0x100482f8c498  20b8  fd4217e4       ldr d4, [sp, #1064]
0x100482f8c49c  20bc  fd4213e3       ldr d3, [sp, #1056]
0x100482f8c4a0  20c0  fd420fe2       ldr d2, [sp, #1048]
0x100482f8c4a4  20c4  f9419bec       ldr x12, [sp, #816]
0x100482f8c4a8  20c8  f94197e9       ldr x9, [sp, #808]
0x100482f8c4ac  20cc  f9418ffc       ldr x28, [sp, #792]
0x100482f8c4b0  20d0  f9418be4       ldr x4, [sp, #784]
0x100482f8c4b4  20d4  f94187ea       ldr x10, [sp, #776]
0x100482f8c4b8  20d8  f94183f5       ldr x21, [sp, #768]
0x100482f8c4bc  20dc  f9417fe0       ldr x0, [sp, #760]
0x100482f8c4c0  20e0  f9417bf7       ldr x23, [sp, #752]
0x100482f8c4c4  20e4  f94177f3       ldr x19, [sp, #744]
0x100482f8c4c8  20e8  f94173ee       ldr x14, [sp, #736]
0x100482f8c4cc  20ec  f9416fe1       ldr x1, [sp, #728]
0x100482f8c4d0  20f0  f9416be2       ldr x2, [sp, #720]
0x100482f8c4d4  20f4  f94167e3       ldr x3, [sp, #712]
0x100482f8c4d8  20f8  f94163e5       ldr x5, [sp, #704]
0x100482f8c4dc  20fc  f9415fe7       ldr x7, [sp, #696]
0x100482f8c4e0  2100  f9415bed       ldr x13, [sp, #688]
0x100482f8c4e4  2104  f94157eb       ldr x11, [sp, #680]
0x100482f8c4e8  2108  f94153f4       ldr x20, [sp, #672]
0x100482f8c4ec  210c  17fffdf7       b #-0x824 (addr 0x100482f8bcc8)
0x100482f8c4f0  2110  97fc0508       bl #-0xfebe0 (addr 0x100482e8d910)
0x100482f8c4f4  2114  d503201f       nop
0x100482f8c4f8  2118  5800007f       constant pool begin (num_const = 3)
0x100482f8c4fc  211c  d63f03e0       constant
0x100482f8c500  2120  01c0eaf4       constant
0x100482f8c504  2124  00000001       constant

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
       6f8         
       760         
       770         
       780         
       790         
       7a0         
       7ac         
       7b0         
       7bc         
       7c0         
       7cc         
       7d0         
       7e0         
       7ec         
       7f4         
       7fc         
       800         
       808         
       814         
       824         
       830         
       83c         
       840         
       9ac         
       9b4         
       9c0         
       9c8         
       9d0         
       9d8         
       9e0         
       9e8         
       9f0         
       9f8         
       a00         
       a08         
       a10         
       a18         
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
       abc         
       acc         
       adc         
       c18         
       c20         
       f04         
       f0c         
       f14         
       f24         
       f58         
       f64         
       f8c         
       f98         
       fa4         
       fb0         
       fbc         
       fc4         
       fcc         
       fd4         
       fe0         
      100c         
      1018         
      103c         
      1048         
      1054         
      1060         
      106c         
      1074         
      107c         
      1084         
      1090         
      10b8         
      10c4         
      10ec         
      10fc         
      1110         
      1124         
      1138         
      1140         
      1148         
      1150         
      1160         
      119c         
      11b0         
      11dc         
      11f0         
      1204         
      1218         
      122c         
      1374         
      13c0         
      140c         
      1460         
      1488         
      148c         
      1490         
      149c         
      14a0         
      14d0         
      14dc         
      1504         
      1510         
      151c         
      1528         
      1534         
      153c         
      1544         
      154c         
      1558         
      1560         
      158c         
      1598         
      15c0         
      15cc         
      15d8         
      15e4         
      15f0         
      15f8         
      1600         
      1608         
      1614         
      1620         
      1650         
      1664         
      1694         
      16a8         
      16bc         
      16d0         
      16e4         
      16ec         
      16f4         
      16fc         
      170c         
      1718         
      1758         
      176c         
      179c         
      17b0         
      17c4         
      17d8         
      17ec         
      18e8         
      18f8         
      192c         
      1934         
      19d0         
      19e0         
      19ec         
      19f8         
      1a64         
      1a68         
      1a78         
      1a7c         
      1a8c         
      1a90         
      1aa0         
      1aa4         

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
       6f4      1306
       760      1333
       770      1345
       780      1357
       790      1369
       7a0      1379
       7ac      1392
       7b0      1399
       7bc      1407
       7c0      1414
       7cc      1422
       7d0      1431
       7dc      1439
       7ec      1442
       7f4      1449
       7fc      1456
       800      1463
       808      1470
       814      1477
       824      1500
       830      1506
       83c      1514
       840      1522
       848      1539
       9a8      1776
       9b4      1783
       9c0      1797
       9c8      1806
       9d0      1815
       9d8      1824
       9e0      1833
       9e8      1842
       9f0      1851
       9f8      1860
       a00      1869
       a08      1878
       a10      1887
       a18      1896
       a20      1905
       a2c      1914
       a38      1923
       a44      1932
       a50      1941
       a5c      1950
       a68      1959
       a74      1968
       a80      1977
       a8c      1986
       a98      1995
       aa4      2004
       ab0      2013
       abc      2022
       ac8      2031
       ad8      2040
       c18      2142
       c20      2155
       f04      2451
       f0c      2464
       f14      2483
       f24      2503
       f58      2552
       f64      2573
       f8c      2636
       f98      2657
       fa4      2678
       fb0      2699
       fbc      2720
       fc4      2730
       fcc      2741
       fd4      2758
       fe0      2776
      100c      2825
      1018      2846
      103c      2891
      1048      2912
      1054      2933
      1060      2954
      106c      2975
      1074      2985
      107c      2996
      1084      3013
      1090      3031
      10b8      3080
      10c4      3101
      10ec      3146
      10fc      3167
      110c      3188
      1120      3209
      1134      3230
      1140      3240
      1148      3251
      1150      3268
      1160      3286
      1198      3335
      11ac      3356
      11d8      3401
      11ec      3422
      1200      3443
      1214      3464
      1228      3485
      1374      3686
      13c0      3745
      140c      3804
      1460      3862
      1488      3877
      148c      3885
      1490      3899
      149c      3912
      14a0      3922
      14d0      3974
      14dc      3995
      1504      4063
      1510      4084
      151c      4105
      1528      4126
      1534      4147
      153c      4154
      1544      4162
      154c      4176
      1558      4189
      1560      4199
      158c      4251
      1598      4272
      15c0      4322
      15cc      4343
      15d8      4364
      15e4      4385
      15f0      4406
      15f8      4413
      1600      4421
      1608      4435
      1614      4448
      1620      4465
      1650      4510
      1660      4531
      1690      4581
      16a4      4602
      16b8      4623
      16cc      4644
      16e0      4665
      16ec      4672
      16f4      4680
      16fc      4694
      170c      4707
      1714      4717
      1754      4769
      1768      4790
      1798      4840
      17ac      4861
      17c0      4882
      17d4      4903
      17e8      4924
      18e8      5016
      18f8      5031
      192c      5082
      1934      5090
      19c8      5191
      19dc      5198
      19e4      5205
      19f0      5212
      1a08      5228
      1a20      5258
      1a60      5278
      1a68      5282
      1a78      5292
      1a7c      5296
      1a8c      5306
      1a90      5310
      1aa0      5320
      1aa4      5324
      1b8c         0
      1bec       420
      1c34       595
      1c80       771
      1cc8       943
      1d10      1325
      1dc0      2079
      1ee8      2442
      1fec      5006
      2110      1539

Safepoints (stack slots = 170, entries = 1, byte size = 36)
0x100482f8a59c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 66)
0x100482f8a598  internal wasm call
0x100482f8a670  internal wasm call
0x100482f8a780  internal wasm call
0x100482f8a880  internal wasm call
0x100482f8a9a0  internal wasm call
0x100482f8ac54  external reference (0x101c0eaf4)
0x100482f8bdf4  internal wasm call
0x100482f8be18  internal wasm call
0x100482f8bf6c  wasm stub call  (0x100482e8dbd0)
0x100482f8bfd8  wasm stub call  (0x100482e8dbd0)
0x100482f8c020  wasm stub call  (0x100482e8dbd0)
0x100482f8c06c  wasm stub call  (0x100482e8dbd0)
0x100482f8c0b4  wasm stub call  (0x100482e8dbd0)
0x100482f8c0f4  wasm stub call  (0x100482e8dbd0)
0x100482f8c210  wasm stub call  (0x100482e8dbd0)
0x100482f8c324  wasm stub call  (0x100482e8dbd0)
0x100482f8c428  wasm stub call  (0x100482e8dbd0)
0x100482f8c4f0  wasm stub call  (0x100482e8d910)
0x100482f8c4f8  constant pool (size 16)
