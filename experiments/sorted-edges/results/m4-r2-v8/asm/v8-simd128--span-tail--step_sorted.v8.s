name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8608 = 8588 + 20 padding)
Instructions (size = 8552)
0x2a4569224c0     0  d2800110       movz x16, #0x8
0x2a4569224c4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x2a4569224c8     8  a9017bfd       stp fp, lr, [sp, #16]
0x2a4569224cc     c  910043fd       add fp, sp, #0x10 (16)
0x2a4569224d0    10  d114c3ff       sub sp, sp, #0x530 (1328)
0x2a4569224d4    14  f841f0e6       ldur x6, [x7, #31]
0x2a4569224d8    18  f8520348       ldur x8, [x26, #-224]
0x2a4569224dc    1c  f9024fe0       str x0, [sp, #1176]
0x2a4569224e0    20  f90287e6       str x6, [sp, #1288]
0x2a4569224e4    24  eb2863ff       cmp sp, x8
0x2a4569224e8    28  5400dd09       b.ls #+0x1ba0 (addr 0x2a456924088)
0x2a4569224ec    2c  f842f0e8       ldur x8, [x7, #47]
0x2a4569224f0    30  b9400109       ldr w9, [x8]
0x2a4569224f4    34  51080124       sub w4, w9, #0x200 (512)
0x2a4569224f8    38  b9000104       str w4, [x8]
0x2a4569224fc    3c  2a0003e9       mov w9, w0
0x2a456922500    40  910240ca       add x10, x6, #0x90 (144)
0x2a456922504    44  fc696942       ldr d2, [x10, x9]
0x2a456922508    48  5e0c0441       mov s1, v2.s[1]
0x2a45692250c    4c  52a75010       movz w16, #0x3a800000
0x2a456922510    50  1e270203       fmov s3, w16
0x2a456922514    54  1e230824       fmul s4, s1, s3
0x2a456922518    58  5e040440       mov s0, v2.s[0]
0x2a45692251c    5c  1e230803       fmul s3, s0, s3
0x2a456922520    60  9102812a       add x10, x9, #0xa0 (160)
0x2a456922524    64  bc6a68c5       ldr s5, [x6, x10]
0x2a456922528    68  1e2520a0       fcmp s5, s5
0x2a45692252c    6c  1e251c65       fcsel s5, s3, s5, ne
0x2a456922530    70  1e232060       fcmp s3, s3
0x2a456922534    74  1e231ca3       fcsel s3, s5, s3, ne
0x2a456922538    78  1e252060       fcmp s3, s5
0x2a45692253c    7c  1e233ca3       fcsel s3, s5, s3, lo
0x2a456922540    80  1e232060       fcmp s3, s3
0x2a456922544    84  1e231c83       fcsel s3, s4, s3, ne
0x2a456922548    88  1e242080       fcmp s4, s4
0x2a45692254c    8c  1e241c64       fcsel s4, s3, s4, ne
0x2a456922550    90  1e232080       fcmp s4, s3
0x2a456922554    94  1e243c63       fcsel s3, s3, s4, lo
0x2a456922558    98  52840010       movz w16, #0x2000
0x2a45692255c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x2a456922560    a0  1e270204       fmov s4, w16
0x2a456922564    a4  1e240863       fmul s3, s3, s4
0x2a456922568    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x2a45692256c    ac  1e231883       fdiv s3, s4, s3
0x2a456922570    b0  9102112b       add x11, x9, #0x84 (132)
0x2a456922574    b4  bc2b68c3       str s3, [x6, x11]
0x2a456922578    b8  4e040465       dup v5.4s, v3.s[0]
0x2a45692257c    bc  6e25dc42       fmul v2.4s, v2.4s, v5.4s
0x2a456922580    c0  4ea18842       frintp v2.4s, v2.4s
0x2a456922584    c4  5e040445       mov s5, v2.s[0]
0x2a456922588    c8  1e22c0a6       fcvt d6, s5
0x2a45692258c    cc  1e65c0c7       frintz d7, d6
0x2a456922590    d0  1e7900ec       fcvtzu w12, d7
0x2a456922594    d4  1e630188       ucvtf d8, w12
0x2a456922598    d8  f90297e8       str x8, [sp, #1320]
0x2a45692259c    dc  f90293e4       str x4, [sp, #1312]
0x2a4569225a0    e0  f90023e9       str x9, [sp, #64]
0x2a4569225a4    e4  fd025fe1       str d1, [sp, #1208]
0x2a4569225a8    e8  fd0263e0       str d0, [sp, #1216]
0x2a4569225ac    ec  f9028bea       str x10, [sp, #1296]
0x2a4569225b0    f0  fd024be3       str d3, [sp, #1168]
0x2a4569225b4    f4  f9000feb       str x11, [sp, #24]
0x2a4569225b8    f8  1e6820e0       fcmp d7, d8
0x2a4569225bc    fc  5400d701       b.ne #+0x1ae0 (addr 0x2a45692409c)
0x2a4569225c0   100  4e040d85       dup v5.4s, w12
0x2a4569225c4   104  5e0c0446       mov s6, v2.s[1]
0x2a4569225c8   108  1e22c0c7       fcvt d7, s6
0x2a4569225cc   10c  1e65c0e8       frintz d8, d7
0x2a4569225d0   110  1e79010c       fcvtzu w12, d8
0x2a4569225d4   114  1e630189       ucvtf d9, w12
0x2a4569225d8   118  1e692100       fcmp d8, d9
0x2a4569225dc   11c  5400d761       b.ne #+0x1aec (addr 0x2a4569240c8)
0x2a4569225e0   120  4e0c1d85       mov v5.s[1], w12
0x2a4569225e4   124  4f000426       movi v6.4s, #0x1, lsl #0
0x2a4569225e8   128  6ea664a5       umax v5.4s, v5.4s, v6.4s
0x2a4569225ec   12c  6f00e407       movi v7.2d, #0x0
0x2a4569225f0   130  6ea0c848       fcmge v8.4s, v2.4s, #0.0
0x2a4569225f4   134  52a9f010       movz w16, #0x4f800000
0x2a4569225f8   138  4e040e09       dup v9.4s, w16
0x2a4569225fc   13c  6ea2e522       fcmgt v2.4s, v9.4s, v2.4s
0x2a456922600   140  4e221d02       and v2.16b, v8.16b, v2.16b
0x2a456922604   144  6e661ca2       bsl v2.16b, v5.16b, v6.16b
0x2a456922608   148  910220cc       add x12, x6, #0x88 (136)
0x2a45692260c   14c  8b09018c       add x12, x12, x9
0x2a456922610   150  0d008582       st1 {v2.d}[0], [x12]
0x2a456922614   154  9103312c       add x12, x9, #0xcc (204)
0x2a456922618   158  b86c68cc       ldr w12, [x6, x12]
0x2a45692261c   15c  9100e08d       add x13, x4, #0x38 (56)
0x2a456922620   160  b82d68cc       str w12, [x6, x13]
0x2a456922624   164  9103112c       add x12, x9, #0xc4 (196)
0x2a456922628   168  f86c68cc       ldr x12, [x6, x12]
0x2a45692262c   16c  9100c08d       add x13, x4, #0x30 (48)
0x2a456922630   170  f82d68cc       str x12, [x6, x13]
0x2a456922634   174  1101800c       add w12, w0, #0x60 (96)
0x2a456922638   178  9100112d       add x13, x9, #0x4 (4)
0x2a45692263c   17c  b86d68c2       ldr w2, [x6, x13]
0x2a456922640   180  9100212e       add x14, x9, #0x8 (8)
0x2a456922644   184  b86e68c3       ldr w3, [x6, x14]
0x2a456922648   188  9100412f       add x15, x9, #0x10 (16)
0x2a45692264c   18c  b86f68d3       ldr w19, [x6, x15]
0x2a456922650   190  91005134       add x20, x9, #0x14 (20)
0x2a456922654   194  b87468c5       ldr w5, [x6, x20]
0x2a456922658   198  3d80e7e6       str q6, [sp, #912]
0x2a45692265c   19c  3d800fe7       str q7, [sp, #48]
0x2a456922660   1a0  f901ffed       str x13, [sp, #1016]
0x2a456922664   1a4  f90017ee       str x14, [sp, #40]
0x2a456922668   1a8  f901fbef       str x15, [sp, #1008]
0x2a45692266c   1ac  f90247f4       str x20, [sp, #1160]
0x2a456922670   1b0  aa0c03e0       mov x0, x12
0x2a456922674   1b4  aa1303e4       mov x4, x19
0x2a456922678   1b8  97fc0c01       bl #-0xfcffc (addr 0x2a45682567c)
0x2a45692267c   1bc  f94023e6       ldr x6, [sp, #64]
0x2a456922680   1c0  9100e0c8       add x8, x6, #0x38 (56)
0x2a456922684   1c4  f94287e9       ldr x9, [sp, #1288]
0x2a456922688   1c8  b828693f       str wzr, [x9, x8]
0x2a45692268c   1cc  f9424fea       ldr x10, [sp, #1176]
0x2a456922690   1d0  11028142       add w2, w10, #0xa0 (160)
0x2a456922694   1d4  9101f0cb       add x11, x6, #0x7c (124)
0x2a456922698   1d8  b86b692b       ldr w11, [x9, x11]
0x2a45692269c   1dc  910200cc       add x12, x6, #0x80 (128)
0x2a4569226a0   1e0  b86c692c       ldr w12, [x9, x12]
0x2a4569226a4   1e4  0b0c096c       add w12, w11, w12, lsl #2
0x2a4569226a8   1e8  f94017ed       ldr x13, [sp, #40]
0x2a4569226ac   1ec  b86d692e       ldr w14, [x9, x13]
0x2a4569226b0   1f0  f941ffef       ldr x15, [sp, #1016]
0x2a4569226b4   1f4  b86f6933       ldr w19, [x9, x15]
0x2a4569226b8   1f8  1100c140       add w0, w10, #0x30 (48)
0x2a4569226bc   1fc  f9028fe8       str x8, [sp, #1304]
0x2a4569226c0   200  f90267e2       str x2, [sp, #1224]
0x2a4569226c4   204  f90253eb       str x11, [sp, #1184]
0x2a4569226c8   208  f90257ec       str x12, [sp, #1192]
0x2a4569226cc   20c  f9027fee       str x14, [sp, #1272]
0x2a4569226d0   210  f9027bf3       str x19, [sp, #1264]
0x2a4569226d4   214  f9026fe0       str x0, [sp, #1240]
0x2a4569226d8   218  aa0b03f5       mov x21, x11
0x2a4569226dc   21c  d2800014       movz x20, #0x0
0x2a4569226e0   220  fd424be3       ldr d3, [sp, #1168]
0x2a4569226e4   224  f8520356       ldur x22, [x26, #-224]
0x2a4569226e8   228  eb3663ff       cmp sp, x22
0x2a4569226ec   22c  5400cfe9       b.ls #+0x19fc (addr 0x2a4569240e8)
0x2a4569226f0   230  6b0c02bf       cmp w21, w12
0x2a4569226f4   234  54000120       b.eq #+0x24 (addr 0x2a456922718)
0x2a4569226f8   238  b8756936       ldr w22, [x9, x21]
0x2a4569226fc   23c  110012b5       add w21, w21, #0x4 (4)
0x2a456922700   240  6b1601df       cmp w14, w22
0x2a456922704   244  54ffff09       b.ls #-0x20 (addr 0x2a4569226e4)
0x2a456922708   248  0b160a76       add w22, w19, w22, lsl #2
0x2a45692270c   24c  bc766923       ldr s3, [x9, x22]
0x2a456922710   250  d2800036       movz x22, #0x1
0x2a456922714   254  14000003       b #+0xc (addr 0x2a456922720)
0x2a456922718   258  d2800016       movz x22, #0x0
0x2a45692271c   25c  aa0c03f5       mov x21, x12
0x2a456922720   260  fd024be3       str d3, [sp, #1168]
0x2a456922724   264  f90283f5       str x21, [sp, #1280]
0x2a456922728   268  710006df       cmp w22, #0x1 (1)
0x2a45692272c   26c  540004a1       b.ne #+0x94 (addr 0x2a4569227c0)
0x2a456922730   270  9100c0d6       add x22, x6, #0x30 (48)
0x2a456922734   274  b8766936       ldr w22, [x9, x22]
0x2a456922738   278  6b16029f       cmp w20, w22
0x2a45692273c   27c  54000261       b.ne #+0x4c (addr 0x2a456922788)
0x2a456922740   280  d2800023       movz x3, #0x1
0x2a456922744   284  f90277f4       str x20, [sp, #1256]
0x2a456922748   288  f9429be7       ldr x7, [sp, #1328]
0x2a45692274c   28c  aa1403e2       mov x2, x20
0x2a456922750   290  97fc0bcc       bl #-0xfd0d0 (addr 0x2a456825680)
0x2a456922754   294  f94287e9       ldr x9, [sp, #1288]
0x2a456922758   298  f94023e6       ldr x6, [sp, #64]
0x2a45692275c   29c  f941ffef       ldr x15, [sp, #1016]
0x2a456922760   2a0  f94017ed       ldr x13, [sp, #40]
0x2a456922764   2a4  f9428fe8       ldr x8, [sp, #1304]
0x2a456922768   2a8  f94257ec       ldr x12, [sp, #1192]
0x2a45692276c   2ac  f9424fea       ldr x10, [sp, #1176]
0x2a456922770   2b0  fd424be3       ldr d3, [sp, #1168]
0x2a456922774   2b4  f94283f5       ldr x21, [sp, #1280]
0x2a456922778   2b8  f94277f4       ldr x20, [sp, #1256]
0x2a45692277c   2bc  f9426fe0       ldr x0, [sp, #1240]
0x2a456922780   2c0  f9427bf3       ldr x19, [sp, #1264]
0x2a456922784   2c4  f9427fee       ldr x14, [sp, #1272]
0x2a456922788   2c8  1100068b       add w11, w20, #0x1 (1)
0x2a45692278c   2cc  aa0903f0       mov x16, x9
0x2a456922790   2d0  aa0803e9       mov x9, x8
0x2a456922794   2d4  aa1003e8       mov x8, x16
0x2a456922798   2d8  b829690b       str w11, [x8, x9]
0x2a45692279c   2dc  9100d0d6       add x22, x6, #0x34 (52)
0x2a4569227a0   2e0  b8766916       ldr w22, [x8, x22]
0x2a4569227a4   2e4  0b140ad4       add w20, w22, w20, lsl #2
0x2a4569227a8   2e8  bc346903       str s3, [x8, x20]
0x2a4569227ac   2ec  aa0903f0       mov x16, x9
0x2a4569227b0   2f0  aa0803e9       mov x9, x8
0x2a4569227b4   2f4  aa1003e8       mov x8, x16
0x2a4569227b8   2f8  aa0b03f4       mov x20, x11
0x2a4569227bc   2fc  17ffffca       b #-0xd8 (addr 0x2a4569226e4)
0x2a4569227c0   300  910110cb       add x11, x6, #0x44 (68)
0x2a4569227c4   304  b82b693f       str wzr, [x9, x11]
0x2a4569227c8   308  f94247ee       ldr x14, [sp, #1160]
0x2a4569227cc   30c  b86e6933       ldr w19, [x9, x14]
0x2a4569227d0   310  f941fbf4       ldr x20, [sp, #1008]
0x2a4569227d4   314  b8746935       ldr w21, [x9, x20]
0x2a4569227d8   318  1100f140       add w0, w10, #0x3c (60)
0x2a4569227dc   31c  f9027feb       str x11, [sp, #1272]
0x2a4569227e0   320  f9026ff3       str x19, [sp, #1240]
0x2a4569227e4   324  f90273f5       str x21, [sp, #1248]
0x2a4569227e8   328  f90277e0       str x0, [sp, #1256]
0x2a4569227ec   32c  aa0c03f6       mov x22, x12
0x2a4569227f0   330  f94253ec       ldr x12, [sp, #1184]
0x2a4569227f4   334  d2800002       movz x2, #0x0
0x2a4569227f8   338  f8520357       ldur x23, [x26, #-224]
0x2a4569227fc   33c  eb3763ff       cmp sp, x23
0x2a456922800   340  5400c989       b.ls #+0x1930 (addr 0x2a456924130)
0x2a456922804   344  6b16019f       cmp w12, w22
0x2a456922808   348  54000120       b.eq #+0x24 (addr 0x2a45692282c)
0x2a45692280c   34c  b86c6937       ldr w23, [x9, x12]
0x2a456922810   350  1100118c       add w12, w12, #0x4 (4)
0x2a456922814   354  6b17027f       cmp w19, w23
0x2a456922818   358  54ffff09       b.ls #-0x20 (addr 0x2a4569227f8)
0x2a45692281c   35c  0b170ab7       add w23, w21, w23, lsl #2
0x2a456922820   360  bc776923       ldr s3, [x9, x23]
0x2a456922824   364  d2800037       movz x23, #0x1
0x2a456922828   368  14000003       b #+0xc (addr 0x2a456922834)
0x2a45692282c   36c  d2800017       movz x23, #0x0
0x2a456922830   370  aa1603ec       mov x12, x22
0x2a456922834   374  fd024be3       str d3, [sp, #1168]
0x2a456922838   378  f9027bec       str x12, [sp, #1264]
0x2a45692283c   37c  710006ff       cmp w23, #0x1 (1)
0x2a456922840   380  540003e1       b.ne #+0x7c (addr 0x2a4569228bc)
0x2a456922844   384  9100f0d7       add x23, x6, #0x3c (60)
0x2a456922848   388  b8776937       ldr w23, [x9, x23]
0x2a45692284c   38c  6b17005f       cmp w2, w23
0x2a456922850   390  54000261       b.ne #+0x4c (addr 0x2a45692289c)
0x2a456922854   394  f90283e2       str x2, [sp, #1280]
0x2a456922858   398  f9429be7       ldr x7, [sp, #1328]
0x2a45692285c   39c  d2800023       movz x3, #0x1
0x2a456922860   3a0  97fc0b88       bl #-0xfd1e0 (addr 0x2a456825680)
0x2a456922864   3a4  f94287e9       ldr x9, [sp, #1288]
0x2a456922868   3a8  f94023e6       ldr x6, [sp, #64]
0x2a45692286c   3ac  f941fbf4       ldr x20, [sp, #1008]
0x2a456922870   3b0  f94247ee       ldr x14, [sp, #1160]
0x2a456922874   3b4  f9428fe8       ldr x8, [sp, #1304]
0x2a456922878   3b8  f94257f6       ldr x22, [sp, #1192]
0x2a45692287c   3bc  f9424fea       ldr x10, [sp, #1176]
0x2a456922880   3c0  fd424be3       ldr d3, [sp, #1168]
0x2a456922884   3c4  f9427bec       ldr x12, [sp, #1264]
0x2a456922888   3c8  f94283e2       ldr x2, [sp, #1280]
0x2a45692288c   3cc  f9427feb       ldr x11, [sp, #1272]
0x2a456922890   3d0  f94277e0       ldr x0, [sp, #1256]
0x2a456922894   3d4  f94273f5       ldr x21, [sp, #1248]
0x2a456922898   3d8  f9426ff3       ldr x19, [sp, #1240]
0x2a45692289c   3dc  1100044d       add w13, w2, #0x1 (1)
0x2a4569228a0   3e0  b82b692d       str w13, [x9, x11]
0x2a4569228a4   3e4  910100cf       add x15, x6, #0x40 (64)
0x2a4569228a8   3e8  b86f692f       ldr w15, [x9, x15]
0x2a4569228ac   3ec  0b0209ef       add w15, w15, w2, lsl #2
0x2a4569228b0   3f0  bc2f6923       str s3, [x9, x15]
0x2a4569228b4   3f4  aa0d03e2       mov x2, x13
0x2a4569228b8   3f8  17ffffd0       b #-0xc0 (addr 0x2a4569227f8)
0x2a4569228bc   3fc  910140cb       add x11, x6, #0x50 (80)
0x2a4569228c0   400  b82b693f       str wzr, [x9, x11]
0x2a4569228c4   404  910080cc       add x12, x6, #0x20 (32)
0x2a4569228c8   408  b86c692d       ldr w13, [x9, x12]
0x2a4569228cc   40c  910070cf       add x15, x6, #0x1c (28)
0x2a4569228d0   410  b86f6933       ldr w19, [x9, x15]
0x2a4569228d4   414  11012140       add w0, w10, #0x48 (72)
0x2a4569228d8   418  f9027feb       str x11, [sp, #1272]
0x2a4569228dc   41c  f90013ec       str x12, [sp, #32]
0x2a4569228e0   420  f90273ed       str x13, [sp, #1248]
0x2a4569228e4   424  f90007ef       str x15, [sp, #8]
0x2a4569228e8   428  f9026ff3       str x19, [sp, #1240]
0x2a4569228ec   42c  f9027be0       str x0, [sp, #1264]
0x2a4569228f0   430  f94253f5       ldr x21, [sp, #1184]
0x2a4569228f4   434  d2800002       movz x2, #0x0
0x2a4569228f8   438  f8520357       ldur x23, [x26, #-224]
0x2a4569228fc   43c  eb3763ff       cmp sp, x23
0x2a456922900   440  5400c3e9       b.ls #+0x187c (addr 0x2a45692417c)
0x2a456922904   444  6b1602bf       cmp w21, w22
0x2a456922908   448  54000120       b.eq #+0x24 (addr 0x2a45692292c)
0x2a45692290c   44c  b8756937       ldr w23, [x9, x21]
0x2a456922910   450  110012b5       add w21, w21, #0x4 (4)
0x2a456922914   454  6b1701bf       cmp w13, w23
0x2a456922918   458  54ffff09       b.ls #-0x20 (addr 0x2a4569228f8)
0x2a45692291c   45c  0b170a77       add w23, w19, w23, lsl #2
0x2a456922920   460  bc776923       ldr s3, [x9, x23]
0x2a456922924   464  d2800037       movz x23, #0x1
0x2a456922928   468  14000003       b #+0xc (addr 0x2a456922934)
0x2a45692292c   46c  d2800017       movz x23, #0x0
0x2a456922930   470  aa1603f5       mov x21, x22
0x2a456922934   474  fd024be3       str d3, [sp, #1168]
0x2a456922938   478  f9025bf5       str x21, [sp, #1200]
0x2a45692293c   47c  710006ff       cmp w23, #0x1 (1)
0x2a456922940   480  540003c1       b.ne #+0x78 (addr 0x2a4569229b8)
0x2a456922944   484  910120d7       add x23, x6, #0x48 (72)
0x2a456922948   488  b8776937       ldr w23, [x9, x23]
0x2a45692294c   48c  6b17005f       cmp w2, w23
0x2a456922950   490  54000241       b.ne #+0x48 (addr 0x2a456922998)
0x2a456922954   494  f90283e2       str x2, [sp, #1280]
0x2a456922958   498  f9429be7       ldr x7, [sp, #1328]
0x2a45692295c   49c  d2800023       movz x3, #0x1
0x2a456922960   4a0  97fc0b48       bl #-0xfd2e0 (addr 0x2a456825680)
0x2a456922964   4a4  f94287e9       ldr x9, [sp, #1288]
0x2a456922968   4a8  f94023e6       ldr x6, [sp, #64]
0x2a45692296c   4ac  f94007ef       ldr x15, [sp, #8]
0x2a456922970   4b0  f94013ec       ldr x12, [sp, #32]
0x2a456922974   4b4  f9427feb       ldr x11, [sp, #1272]
0x2a456922978   4b8  f94257f6       ldr x22, [sp, #1192]
0x2a45692297c   4bc  fd424be3       ldr d3, [sp, #1168]
0x2a456922980   4c0  f9424fea       ldr x10, [sp, #1176]
0x2a456922984   4c4  f9425bf5       ldr x21, [sp, #1200]
0x2a456922988   4c8  f94283e2       ldr x2, [sp, #1280]
0x2a45692298c   4cc  f9427be0       ldr x0, [sp, #1264]
0x2a456922990   4d0  f9426ff3       ldr x19, [sp, #1240]
0x2a456922994   4d4  f94273ed       ldr x13, [sp, #1248]
0x2a456922998   4d8  11000448       add w8, w2, #0x1 (1)
0x2a45692299c   4dc  b82b6928       str w8, [x9, x11]
0x2a4569229a0   4e0  910130ce       add x14, x6, #0x4c (76)
0x2a4569229a4   4e4  b86e692e       ldr w14, [x9, x14]
0x2a4569229a8   4e8  0b0209ce       add w14, w14, w2, lsl #2
0x2a4569229ac   4ec  bc2e6923       str s3, [x9, x14]
0x2a4569229b0   4f0  aa0803e2       mov x2, x8
0x2a4569229b4   4f4  17ffffd1       b #-0xbc (addr 0x2a4569228f8)
0x2a4569229b8   4f8  910170c8       add x8, x6, #0x5c (92)
0x2a4569229bc   4fc  b828693f       str wzr, [x9, x8]
0x2a4569229c0   500  9100b0cd       add x13, x6, #0x2c (44)
0x2a4569229c4   504  b86d692e       ldr w14, [x9, x13]
0x2a4569229c8   508  9100a0d3       add x19, x6, #0x28 (40)
0x2a4569229cc   50c  b8736934       ldr w20, [x9, x19]
0x2a4569229d0   510  11015140       add w0, w10, #0x54 (84)
0x2a4569229d4   514  f9027be8       str x8, [sp, #1264]
0x2a4569229d8   518  f90203ed       str x13, [sp, #1024]
0x2a4569229dc   51c  f9026bee       str x14, [sp, #1232]
0x2a4569229e0   520  f9000bf3       str x19, [sp, #16]
0x2a4569229e4   524  f90273f4       str x20, [sp, #1248]
0x2a4569229e8   528  f90277e0       str x0, [sp, #1256]
0x2a4569229ec   52c  d2800002       movz x2, #0x0
0x2a4569229f0   530  f94253ea       ldr x10, [sp, #1184]
0x2a4569229f4   534  aa1603f5       mov x21, x22
0x2a4569229f8   538  14000004       b #+0x10 (addr 0x2a456922a08)
0x2a4569229fc   53c  aa0903f0       mov x16, x9
0x2a456922a00   540  aa0803e9       mov x9, x8
0x2a456922a04   544  aa1003e8       mov x8, x16
0x2a456922a08   548  f8520356       ldur x22, [x26, #-224]
0x2a456922a0c   54c  eb3663ff       cmp sp, x22
0x2a456922a10   550  5400bda9       b.ls #+0x17b4 (addr 0x2a4569241c4)
0x2a456922a14   554  6b15015f       cmp w10, w21
0x2a456922a18   558  540001a0       b.eq #+0x34 (addr 0x2a456922a4c)
0x2a456922a1c   55c  b86a6936       ldr w22, [x9, x10]
0x2a456922a20   560  1100114a       add w10, w10, #0x4 (4)
0x2a456922a24   564  6b1601df       cmp w14, w22
0x2a456922a28   568  540000a9       b.ls #+0x14 (addr 0x2a456922a3c)
0x2a456922a2c   56c  0b160a96       add w22, w20, w22, lsl #2
0x2a456922a30   570  bc766923       ldr s3, [x9, x22]
0x2a456922a34   574  d2800036       movz x22, #0x1
0x2a456922a38   578  14000007       b #+0x1c (addr 0x2a456922a54)
0x2a456922a3c   57c  aa0803f0       mov x16, x8
0x2a456922a40   580  aa0903e8       mov x8, x9
0x2a456922a44   584  aa1003e9       mov x9, x16
0x2a456922a48   588  17ffffed       b #-0x4c (addr 0x2a4569229fc)
0x2a456922a4c   58c  d2800016       movz x22, #0x0
0x2a456922a50   590  aa1503ea       mov x10, x21
0x2a456922a54   594  f90253ea       str x10, [sp, #1184]
0x2a456922a58   598  fd024be3       str d3, [sp, #1168]
0x2a456922a5c   59c  710006df       cmp w22, #0x1 (1)
0x2a456922a60   5a0  54000421       b.ne #+0x84 (addr 0x2a456922ae4)
0x2a456922a64   5a4  910150d6       add x22, x6, #0x54 (84)
0x2a456922a68   5a8  b8766936       ldr w22, [x9, x22]
0x2a456922a6c   5ac  6b16005f       cmp w2, w22
0x2a456922a70   5b0  54000241       b.ne #+0x48 (addr 0x2a456922ab8)
0x2a456922a74   5b4  f90283e2       str x2, [sp, #1280]
0x2a456922a78   5b8  f9429be7       ldr x7, [sp, #1328]
0x2a456922a7c   5bc  d2800023       movz x3, #0x1
0x2a456922a80   5c0  97fc0b00       bl #-0xfd400 (addr 0x2a456825680)
0x2a456922a84   5c4  f94287e9       ldr x9, [sp, #1288]
0x2a456922a88   5c8  f94023e6       ldr x6, [sp, #64]
0x2a456922a8c   5cc  f9400bf3       ldr x19, [sp, #16]
0x2a456922a90   5d0  f94203ed       ldr x13, [sp, #1024]
0x2a456922a94   5d4  f94283e2       ldr x2, [sp, #1280]
0x2a456922a98   5d8  f9427feb       ldr x11, [sp, #1272]
0x2a456922a9c   5dc  f94253ea       ldr x10, [sp, #1184]
0x2a456922aa0   5e0  fd424be3       ldr d3, [sp, #1168]
0x2a456922aa4   5e4  f9427be8       ldr x8, [sp, #1264]
0x2a456922aa8   5e8  f94277e0       ldr x0, [sp, #1256]
0x2a456922aac   5ec  f94257f5       ldr x21, [sp, #1192]
0x2a456922ab0   5f0  f94273f4       ldr x20, [sp, #1248]
0x2a456922ab4   5f4  f9426bee       ldr x14, [sp, #1232]
0x2a456922ab8   5f8  1100044c       add w12, w2, #0x1 (1)
0x2a456922abc   5fc  aa0903f0       mov x16, x9
0x2a456922ac0   600  aa0803e9       mov x9, x8
0x2a456922ac4   604  aa1003e8       mov x8, x16
0x2a456922ac8   608  b829690c       str w12, [x8, x9]
0x2a456922acc   60c  910160cf       add x15, x6, #0x58 (88)
0x2a456922ad0   610  b86f690f       ldr w15, [x8, x15]
0x2a456922ad4   614  0b0209ef       add w15, w15, w2, lsl #2
0x2a456922ad8   618  bc2f6903       str s3, [x8, x15]
0x2a456922adc   61c  aa0c03e2       mov x2, x12
0x2a456922ae0   620  17ffffc7       b #-0xe4 (addr 0x2a4569229fc)
0x2a456922ae4   624  f9428fe8       ldr x8, [sp, #1304]
0x2a456922ae8   628  b8686928       ldr w8, [x9, x8]
0x2a456922aec   62c  9100c0ca       add x10, x6, #0x30 (48)
0x2a456922af0   630  3cea6922       ldr q2, [x9, x10]
0x2a456922af4   634  3ce66923       ldr q3, [x9, x6]
0x2a456922af8   638  3caa6923       str q3, [x9, x10]
0x2a456922afc   63c  3ca66922       str q2, [x9, x6]
0x2a456922b00   640  910100ca       add x10, x6, #0x40 (64)
0x2a456922b04   644  3cea6922       ldr q2, [x9, x10]
0x2a456922b08   648  f941fbec       ldr x12, [sp, #1008]
0x2a456922b0c   64c  3cec6924       ldr q4, [x9, x12]
0x2a456922b10   650  3caa6924       str q4, [x9, x10]
0x2a456922b14   654  b86c692a       ldr w10, [x9, x12]
0x2a456922b18   658  3cac6922       str q2, [x9, x12]
0x2a456922b1c   65c  910150ce       add x14, x6, #0x54 (84)
0x2a456922b20   660  f86e692e       ldr x14, [x9, x14]
0x2a456922b24   664  b86b692f       ldr w15, [x9, x11]
0x2a456922b28   668  f94013f4       ldr x20, [sp, #32]
0x2a456922b2c   66c  3cf46922       ldr q2, [x9, x20]
0x2a456922b30   670  3cab6922       str q2, [x9, x11]
0x2a456922b34   674  aa0d03eb       mov x11, x13
0x2a456922b38   678  b82b6922       str w2, [x9, x11]
0x2a456922b3c   67c  b874692d       ldr w13, [x9, x20]
0x2a456922b40   680  b834692f       str w15, [x9, x20]
0x2a456922b44   684  910090cf       add x15, x6, #0x24 (36)
0x2a456922b48   688  f82f692e       str x14, [x9, x15]
0x2a456922b4c   68c  f9028fe8       str x8, [sp, #1304]
0x2a456922b50   690  f90277ea       str x10, [sp, #1256]
0x2a456922b54   694  35000108       cbnz w8, #+0x20 (addr 0x2a456922b74)
0x2a456922b58   698  f94293e4       ldr x4, [sp, #1312]
0x2a456922b5c   69c  11080086       add w6, w4, #0x200 (512)
0x2a456922b60   6a0  f94297ee       ldr x14, [sp, #1320]
0x2a456922b64   6a4  b90001c6       str w6, [x14]
0x2a456922b68   6a8  910003bf       mov sp, fp
0x2a456922b6c   6ac  a8c17bfd       ldp fp, lr, [sp], #16
0x2a456922b70   6b0  d65f03c0       ret
0x2a456922b74   6b4  0e143c4e       mov w14, v2.s[2]
0x2a456922b78   6b8  0e1c3c8f       mov w15, v4.s[3]
0x2a456922b7c   6bc  0e0c3c75       mov w21, v3.s[1]
0x2a456922b80   6c0  0e1c3c56       mov w22, v2.s[3]
0x2a456922b84   6c4  0e0c3c97       mov w23, v4.s[1]
0x2a456922b88   6c8  0e143c78       mov w24, v3.s[2]
0x2a456922b8c   6cc  6b1802ff       cmp w23, w24
0x2a456922b90   6d0  1a9832f9       csel w25, w23, w24, lo
0x2a456922b94   6d4  6b1901bf       cmp w13, w25
0x2a456922b98   6d8  1a9931b7       csel w23, w13, w25, lo
0x2a456922b9c   6dc  6b1702df       cmp w22, w23
0x2a456922ba0   6e0  1a9732cd       csel w13, w22, w23, lo
0x2a456922ba4   6e4  910290d6       add x22, x6, #0xa4 (164)
0x2a456922ba8   6e8  bc766922       ldr s2, [x9, x22]
0x2a456922bac   6ec  1e220842       fmul s2, s2, s2
0x2a456922bb0   6f0  4e040443       dup v3.4s, v2.s[0]
0x2a456922bb4   6f4  f9428bf6       ldr x22, [sp, #1296]
0x2a456922bb8   6f8  bc766924       ldr s4, [x9, x22]
0x2a456922bbc   6fc  1e240884       fmul s4, s4, s4
0x2a456922bc0   700  4e040485       dup v5.4s, v4.s[0]
0x2a456922bc4   704  f90283ee       str x14, [sp, #1280]
0x2a456922bc8   708  f9027bef       str x15, [sp, #1264]
0x2a456922bcc   70c  f90273f5       str x21, [sp, #1248]
0x2a456922bd0   710  f9026fed       str x13, [sp, #1240]
0x2a456922bd4   714  fd0217e2       str d2, [sp, #1064]
0x2a456922bd8   718  3d80dfe3       str q3, [sp, #880]
0x2a456922bdc   71c  fd021be4       str d4, [sp, #1072]
0x2a456922be0   720  3d80e3e5       str q5, [sp, #896]
0x2a456922be4   724  f94017f6       ldr x22, [sp, #40]
0x2a456922be8   728  1e2e1008       fmov s8, #0x70 (1.0000)
0x2a456922bec   72c  3dc0e7e7       ldr q7, [sp, #912]
0x2a456922bf0   730  d2800042       movz x2, #0x2
0x2a456922bf4   734  d2800020       movz x0, #0x1
0x2a456922bf8   738  d2800001       movz x1, #0x0
0x2a456922bfc   73c  f9400ffc       ldr x28, [sp, #24]
0x2a456922c00   740  aa1303fb       mov cp, x19
0x2a456922c04   744  f94007f9       ldr x25, [sp, #8]
0x2a456922c08   748  f941fff8       ldr x24, [sp, #1016]
0x2a456922c0c   74c  f94247f7       ldr x23, [sp, #1160]
0x2a456922c10   750  aa0103f3       mov x19, x1
0x2a456922c14   754  f8520343       ldur x3, [x26, #-224]
0x2a456922c18   758  eb2363ff       cmp sp, x3
0x2a456922c1c   75c  5400af89       b.ls #+0x15f0 (addr 0x2a45692420c)
0x2a456922c20   760  b8766923       ldr w3, [x9, x22]
0x2a456922c24   764  f90137e3       str x3, [sp, #616]
0x2a456922c28   768  6b13007f       cmp w3, w19
0x2a456922c2c   76c  5400a1c9       b.ls #+0x1438 (addr 0x2a456924064)
0x2a456922c30   770  b8776924       ldr w4, [x9, x23]
0x2a456922c34   774  f9003fe4       str x4, [sp, #120]
0x2a456922c38   778  6b13009f       cmp w4, w19
0x2a456922c3c   77c  5400a149       b.ls #+0x1428 (addr 0x2a456924064)
0x2a456922c40   780  b8746925       ldr w5, [x9, x20]
0x2a456922c44   784  f9003be5       str x5, [sp, #112]
0x2a456922c48   788  6b1300bf       cmp w5, w19
0x2a456922c4c   78c  5400a0c9       b.ls #+0x1418 (addr 0x2a456924064)
0x2a456922c50   790  b86b6927       ldr w7, [x9, x11]
0x2a456922c54   794  f90043e7       str x7, [sp, #128]
0x2a456922c58   798  6b1300ff       cmp w7, w19
0x2a456922c5c   79c  5400a049       b.ls #+0x1408 (addr 0x2a456924064)
0x2a456922c60   7a0  b8786928       ldr w8, [x9, x24]
0x2a456922c64   7a4  531e766a       lsl w10, w19, #2
0x2a456922c68   7a8  0b0a010b       add w11, w8, w10
0x2a456922c6c   7ac  bc6b6929       ldr s9, [x9, x11]
0x2a456922c70   7b0  b86c692b       ldr w11, [x9, x12]
0x2a456922c74   7b4  f9014fe8       str x8, [sp, #664]
0x2a456922c78   7b8  0b0a0168       add w8, w11, w10
0x2a456922c7c   7bc  bc68692a       ldr s10, [x9, x8]
0x2a456922c80   7c0  b8796928       ldr w8, [x9, x25]
0x2a456922c84   7c4  f90147eb       str x11, [sp, #648]
0x2a456922c88   7c8  0b0a010b       add w11, w8, w10
0x2a456922c8c   7cc  bc6b692b       ldr s11, [x9, x11]
0x2a456922c90   7d0  b87b692b       ldr w11, [x9, x27]
0x2a456922c94   7d4  f9013fe8       str x8, [sp, #632]
0x2a456922c98   7d8  0b0a0168       add w8, w11, w10
0x2a456922c9c   7dc  f9027fea       str x10, [sp, #1272]
0x2a456922ca0   7e0  bc68692c       ldr s12, [x9, x8]
0x2a456922ca4   7e4  f94293ea       ldr x10, [sp, #1312]
0x2a456922ca8   7e8  91003148       add x8, x10, #0xc (12)
0x2a456922cac   7ec  bc28692c       str s12, [x9, x8]
0x2a456922cb0   7f0  91002148       add x8, x10, #0x8 (8)
0x2a456922cb4   7f4  bc28692b       str s11, [x9, x8]
0x2a456922cb8   7f8  91001148       add x8, x10, #0x4 (4)
0x2a456922cbc   7fc  bc28692a       str s10, [x9, x8]
0x2a456922cc0   800  bc2a6929       str s9, [x9, x10]
0x2a456922cc4   804  9100a148       add x8, x10, #0x28 (40)
0x2a456922cc8   808  b828693f       str wzr, [x9, x8]
0x2a456922ccc   80c  f90253e8       str x8, [sp, #1184]
0x2a456922cd0   810  91008148       add x8, x10, #0x20 (32)
0x2a456922cd4   814  f828693f       str xzr, [x9, x8]
0x2a456922cd8   818  6f00e40b       movi v11.2d, #0x0
0x2a456922cdc   81c  f90257e8       str x8, [sp, #1192]
0x2a456922ce0   820  91004148       add x8, x10, #0x10 (16)
0x2a456922ce4   824  3ca8692b       str q11, [x9, x8]
0x2a456922ce8   828  f9025be8       str x8, [sp, #1200]
0x2a456922cec   82c  910220c8       add x8, x6, #0x88 (136)
0x2a456922cf0   830  b8686928       ldr w8, [x9, x8]
0x2a456922cf4   834  f90027e8       str x8, [sp, #72]
0x2a456922cf8   838  910230c8       add x8, x6, #0x8c (140)
0x2a456922cfc   83c  b8686928       ldr w8, [x9, x8]
0x2a456922d00   840  bc7c692b       ldr s11, [x9, x28]
0x2a456922d04   844  11010146       add w6, w10, #0x40 (64)
0x2a456922d08   848  f9028bf3       str x19, [sp, #1296]
0x2a456922d0c   84c  fd020fe9       str d9, [sp, #1048]
0x2a456922d10   850  fd0213ea       str d10, [sp, #1056]
0x2a456922d14   854  f90143eb       str x11, [sp, #640]
0x2a456922d18   858  f9024be8       str x8, [sp, #1168]
0x2a456922d1c   85c  fd024feb       str d11, [sp, #1176]
0x2a456922d20   860  f9026be6       str x6, [sp, #1232]
0x2a456922d24   864  f9429be0       ldr x0, [sp, #1328]
0x2a456922d28   868  aa0603e2       mov x2, x6
0x2a456922d2c   86c  aa0103e3       mov x3, x1
0x2a456922d30   870  d2803804       movz x4, #0x1c0
0x2a456922d34   874  5800c770       ldr x16, pc+6380 (addr 0x000002a456924620)
0x2a456922d38   878  10000068       adr x8, #+0xc (addr 0x2a456922d44)
0x2a456922d3c   87c  a9027748       stp x8, fp, [x26, #32]
0x2a456922d40   880  d63f0200       blr x16
0x2a456922d44   884  f900175f       str xzr, [x26, #40]
0x2a456922d48   888  6a00001f       tst w0, w0
0x2a456922d4c   88c  5400c600       b.eq #+0x18c0 (addr 0x2a45692460c)
0x2a456922d50   890  f9424be6       ldr x6, [sp, #1168]
0x2a456922d54   894  710000df       cmp w6, #0x0 (0)
0x2a456922d58   898  9a9f07e8       cset x8, ne
0x2a456922d5c   89c  4b0800c6       sub w6, w6, w8
0x2a456922d60   8a0  fd4213e2       ldr d2, [sp, #1056]
0x2a456922d64   8a4  fd424fe3       ldr d3, [sp, #1176]
0x2a456922d68   8a8  1e230844       fmul s4, s2, s3
0x2a456922d6c   8ac  1e242080       fcmp s4, s4
0x2a456922d70   8b0  1e241de4       fcsel s4, s15, s4, ne
0x2a456922d74   8b4  1e202088       fcmp s4, #0.0
0x2a456922d78   8b8  1e2fcc84       fcsel s4, s4, s15, gt
0x2a456922d7c   8bc  1e254084       frintm s4, s4
0x2a456922d80   8c0  1e22c085       fcvt d5, s4
0x2a456922d84   8c4  1e65c0a6       frintz d6, d5
0x2a456922d88   8c8  1e7900c8       fcvtzu w8, d6
0x2a456922d8c   8cc  1e630107       ucvtf d7, w8
0x2a456922d90   8d0  1e6720c0       fcmp d6, d7
0x2a456922d94   8d4  5400a741       b.ne #+0x14e8 (addr 0x2a45692427c)
0x2a456922d98   8d8  6b0800df       cmp w6, w8
0x2a456922d9c   8dc  1a8830c9       csel w9, w6, w8, lo
0x2a456922da0   8e0  52a9f010       movz w16, #0x4f800000
0x2a456922da4   8e4  1e270205       fmov s5, w16
0x2a456922da8   8e8  1e252080       fcmp s4, s5
0x2a456922dac   8ec  1a9f3128       csel w8, w9, wzr, lo
0x2a456922db0   8f0  7100011f       cmp w8, #0x0 (0)
0x2a456922db4   8f4  9a9f07e9       cset x9, ne
0x2a456922db8   8f8  4b090109       sub w9, w8, w9
0x2a456922dbc   8fc  11000508       add w8, w8, #0x1 (1)
0x2a456922dc0   900  6b0800df       cmp w6, w8
0x2a456922dc4   904  1a8830ca       csel w10, w6, w8, lo
0x2a456922dc8   908  f9024bea       str x10, [sp, #1168]
0x2a456922dcc   90c  6b09015f       cmp w10, w9
0x2a456922dd0   910  54008963       b.lo #+0x112c (addr 0x2a456923efc)
0x2a456922dd4   914  f94027e6       ldr x6, [sp, #72]
0x2a456922dd8   918  710000df       cmp w6, #0x0 (0)
0x2a456922ddc   91c  9a9f07e8       cset x8, ne
0x2a456922de0   920  4b0800c8       sub w8, w6, w8
0x2a456922de4   924  fd420fe4       ldr d4, [sp, #1048]
0x2a456922de8   928  1e230883       fmul s3, s4, s3
0x2a456922dec   92c  1e232060       fcmp s3, s3
0x2a456922df0   930  1e231de3       fcsel s3, s15, s3, ne
0x2a456922df4   934  1e202068       fcmp s3, #0.0
0x2a456922df8   938  1e2fcc63       fcsel s3, s3, s15, gt
0x2a456922dfc   93c  1e254063       frintm s3, s3
0x2a456922e00   940  1e22c066       fcvt d6, s3
0x2a456922e04   944  1e65c0c7       frintz d7, d6
0x2a456922e08   948  1e7900eb       fcvtzu w11, d7
0x2a456922e0c   94c  1e630168       ucvtf d8, w11
0x2a456922e10   950  1e6820e0       fcmp d7, d8
0x2a456922e14   954  5400a441       b.ne #+0x1488 (addr 0x2a45692429c)
0x2a456922e18   958  6b0b011f       cmp w8, w11
0x2a456922e1c   95c  1a8b310c       csel w12, w8, w11, lo
0x2a456922e20   960  1e252060       fcmp s3, s5
0x2a456922e24   964  1a9f318b       csel w11, w12, wzr, lo
0x2a456922e28   968  7100017f       cmp w11, #0x0 (0)
0x2a456922e2c   96c  9a9f07ec       cset x12, ne
0x2a456922e30   970  4b0c016c       sub w12, w11, w12
0x2a456922e34   974  f9403bee       ldr x14, [sp, #112]
0x2a456922e38   978  f94043ed       ldr x13, [sp, #128]
0x2a456922e3c   97c  6b0d01df       cmp w14, w13
0x2a456922e40   980  1a8d31cf       csel w15, w14, w13, lo
0x2a456922e44   984  f9403ff3       ldr x19, [sp, #120]
0x2a456922e48   988  6b0f027f       cmp w19, w15
0x2a456922e4c   98c  1a8f3274       csel w20, w19, w15, lo
0x2a456922e50   990  1100056b       add w11, w11, #0x1 (1)
0x2a456922e54   994  6b0b011f       cmp w8, w11
0x2a456922e58   998  1a8b310f       csel w15, w8, w11, lo
0x2a456922e5c   99c  110005e8       add w8, w15, #0x1 (1)
0x2a456922e60   9a0  4e040483       dup v3.4s, v4.s[0]
0x2a456922e64   9a4  4e040445       dup v5.4s, v2.s[0]
0x2a456922e68   9a8  f94023eb       ldr x11, [sp, #64]
0x2a456922e6c   9ac  9101916f       add x15, x11, #0x64 (100)
0x2a456922e70   9b0  f94287f5       ldr x21, [sp, #1288]
0x2a456922e74   9b4  b86f6aaf       ldr w15, [x21, x15]
0x2a456922e78   9b8  9101a176       add x22, x11, #0x68 (104)
0x2a456922e7c   9bc  b8766ab6       ldr w22, [x21, x22]
0x2a456922e80   9c0  f94293e4       ldr x4, [sp, #1312]
0x2a456922e84   9c4  9105c097       add x23, x4, #0x170 (368)
0x2a456922e88   9c8  3cf76aa6       ldr q6, [x21, x23]
0x2a456922e8c   9cc  9104c098       add x24, x4, #0x130 (304)
0x2a456922e90   9d0  3cf86aa7       ldr q7, [x21, x24]
0x2a456922e94   9d4  9103c099       add x25, x4, #0xf0 (240)
0x2a456922e98   9d8  3cf96aa8       ldr q8, [x21, x25]
0x2a456922e9c   9dc  9102c09b       add cp, x4, #0xb0 (176)
0x2a456922ea0   9e0  3cfb6aa9       ldr q9, [x21, x27]
0x2a456922ea4   9e4  9101c09c       add x28, x4, #0x70 (112)
0x2a456922ea8   9e8  3cfc6aaa       ldr q10, [x21, x28]
0x2a456922eac   9ec  9107c080       add x0, x4, #0x1f0 (496)
0x2a456922eb0   9f0  3ce06aab       ldr q11, [x21, x0]
0x2a456922eb4   9f4  9106c081       add x1, x4, #0x1b0 (432)
0x2a456922eb8   9f8  3ce16aac       ldr q12, [x21, x1]
0x2a456922ebc   9fc  91058082       add x2, x4, #0x160 (352)
0x2a456922ec0   a00  3ce26aad       ldr q13, [x21, x2]
0x2a456922ec4   a04  91048083       add x3, x4, #0x120 (288)
0x2a456922ec8   a08  3ce36aae       ldr q14, [x21, x3]
0x2a456922ecc   a0c  91038085       add x5, x4, #0xe0 (224)
0x2a456922ed0   a10  3ce56ab0       ldr q16, [x21, x5]
0x2a456922ed4   a14  91028087       add x7, x4, #0xa0 (160)
0x2a456922ed8   a18  3ce76ab1       ldr q17, [x21, x7]
0x2a456922edc   a1c  9101808b       add x11, x4, #0x60 (96)
0x2a456922ee0   a20  3ceb6ab2       ldr q18, [x21, x11]
0x2a456922ee4   a24  9107808a       add x10, x4, #0x1e0 (480)
0x2a456922ee8   a28  3cea6ab3       ldr q19, [x21, x10]
0x2a456922eec   a2c  f9013bf4       str x20, [sp, #624]
0x2a456922ef0   a30  91068094       add x20, x4, #0x1a0 (416)
0x2a456922ef4   a34  3cf46ab4       ldr q20, [x21, x20]
0x2a456922ef8   a38  f901e7fc       str x28, [sp, #968]
0x2a456922efc   a3c  9105409c       add x28, x4, #0x150 (336)
0x2a456922f00   a40  3cfc6ab5       ldr q21, [x21, x28]
0x2a456922f04   a44  f901e3fb       str cp, [sp, #960]
0x2a456922f08   a48  9104409b       add cp, x4, #0x110 (272)
0x2a456922f0c   a4c  3cfb6ab6       ldr q22, [x21, x27]
0x2a456922f10   a50  f901dff9       str x25, [sp, #952]
0x2a456922f14   a54  91034099       add x25, x4, #0xd0 (208)
0x2a456922f18   a58  3cf96ab7       ldr q23, [x21, x25]
0x2a456922f1c   a5c  f901dbf8       str x24, [sp, #944]
0x2a456922f20   a60  91024098       add x24, x4, #0x90 (144)
0x2a456922f24   a64  3cf86ab8       ldr q24, [x21, x24]
0x2a456922f28   a68  f901d7f7       str x23, [sp, #936]
0x2a456922f2c   a6c  91014097       add x23, x4, #0x50 (80)
0x2a456922f30   a70  3cf76ab9       ldr q25, [x21, x23]
0x2a456922f34   a74  f901d3e1       str x1, [sp, #928]
0x2a456922f38   a78  91074081       add x1, x4, #0x1d0 (464)
0x2a456922f3c   a7c  3ce16aba       ldr q26, [x21, x1]
0x2a456922f40   a80  f901b7e0       str x0, [sp, #872]
0x2a456922f44   a84  91064080       add x0, x4, #0x190 (400)
0x2a456922f48   a88  3ce06abb       ldr q27, [x21, x0]
0x2a456922f4c   a8c  f901b3eb       str x11, [sp, #864]
0x2a456922f50   a90  9105008b       add x11, x4, #0x140 (320)
0x2a456922f54   a94  3ceb6abc       ldr q28, [x21, x11]
0x2a456922f58   a98  f9019fe7       str x7, [sp, #824]
0x2a456922f5c   a9c  91040087       add x7, x4, #0x100 (256)
0x2a456922f60   aa0  3ce76aa0       ldr q0, [x21, x7]
0x2a456922f64   aa4  f9019be5       str x5, [sp, #816]
0x2a456922f68   aa8  91030085       add x5, x4, #0xc0 (192)
0x2a456922f6c   aac  3ce56aa1       ldr q1, [x21, x5]
0x2a456922f70   ab0  f90197e3       str x3, [sp, #808]
0x2a456922f74   ab4  91020083       add x3, x4, #0x80 (128)
0x2a456922f78   ab8  3ce36aa2       ldr q2, [x21, x3]
0x2a456922f7c   abc  f90193e2       str x2, [sp, #800]
0x2a456922f80   ac0  91010082       add x2, x4, #0x40 (64)
0x2a456922f84   ac4  3ce26aa4       ldr q4, [x21, x2]
0x2a456922f88   ac8  f9018ff4       str x20, [sp, #792]
0x2a456922f8c   acc  91070094       add x20, x4, #0x1c0 (448)
0x2a456922f90   ad0  3d80d7e3       str q3, [sp, #848]
0x2a456922f94   ad4  3cf46aa3       ldr q3, [x21, x20]
0x2a456922f98   ad8  f9018bea       str x10, [sp, #784]
0x2a456922f9c   adc  9106008a       add x10, x4, #0x180 (384)
0x2a456922fa0   ae0  3d80d3e5       str q5, [sp, #832]
0x2a456922fa4   ae4  3cea6aa5       ldr q5, [x21, x10]
0x2a456922fa8   ae8  f9002bec       str x12, [sp, #80]
0x2a456922fac   aec  f9002fe8       str x8, [sp, #88]
0x2a456922fb0   af0  f90037ef       str x15, [sp, #104]
0x2a456922fb4   af4  f90033f6       str x22, [sp, #96]
0x2a456922fb8   af8  f90177fc       str x28, [sp, #744]
0x2a456922fbc   afc  f9017bfb       str cp, [sp, #752]
0x2a456922fc0   b00  f9017ff9       str x25, [sp, #760]
0x2a456922fc4   b04  f90183f8       str x24, [sp, #768]
0x2a456922fc8   b08  f90187f7       str x23, [sp, #776]
0x2a456922fcc   b0c  f90173e0       str x0, [sp, #736]
0x2a456922fd0   b10  f9015beb       str x11, [sp, #688]
0x2a456922fd4   b14  f90157ea       str x10, [sp, #680]
0x2a456922fd8   b18  3dc00ffe       ldr q30, [sp, #48]
0x2a456922fdc   b1c  3d811ffe       str q30, [sp, #1136]
0x2a456922fe0   b20  b90483ff       str wzr, [sp, #1152]
0x2a456922fe4   b24  b9046bff       str wzr, [sp, #1128]
0x2a456922fe8   b28  b90463ff       str wzr, [sp, #1120]
0x2a456922fec   b2c  b9045bff       str wzr, [sp, #1112]
0x2a456922ff0   b30  3d8033e8       str q8, [sp, #192]
0x2a456922ff4   b34  4ea51ca8       mov v8.16b, v5.16b
0x2a456922ff8   b38  3d8037e9       str q9, [sp, #208]
0x2a456922ffc   b3c  4ea31c69       mov v9.16b, v3.16b
0x2a456923000   b40  3d803bea       str q10, [sp, #224]
0x2a456923004   b44  4ea41c8a       mov v10.16b, v4.16b
0x2a456923008   b48  3d803feb       str q11, [sp, #240]
0x2a45692300c   b4c  4ea21c4b       mov v11.16b, v2.16b
0x2a456923010   b50  3d802fe7       str q7, [sp, #176]
0x2a456923014   b54  3d802be6       str q6, [sp, #160]
0x2a456923018   b58  b90453ff       str wzr, [sp, #1104]
0x2a45692301c   b5c  1400001f       b #+0x7c (addr 0x2a456923098)
0x2a456923020   b60  f94027e6       ldr x6, [sp, #72]
0x2a456923024   b64  f9402bec       ldr x12, [sp, #80]
0x2a456923028   b68  f9402fe8       ldr x8, [sp, #88]
0x2a45692302c   b6c  f94033f6       ldr x22, [sp, #96]
0x2a456923030   b70  aa0f03e9       mov x9, x15
0x2a456923034   b74  f94037ef       ldr x15, [sp, #104]
0x2a456923038   b78  4ea81d12       mov v18.16b, v8.16b
0x2a45692303c   b7c  3dc097e8       ldr q8, [sp, #592]
0x2a456923040   b80  4ea91d31       mov v17.16b, v9.16b
0x2a456923044   b84  4ea71ce9       mov v9.16b, v7.16b
0x2a456923048   b88  3d803bec       str q12, [sp, #224]
0x2a45692304c   b8c  4eaa1d4c       mov v12.16b, v10.16b
0x2a456923050   b90  4ea11c2a       mov v10.16b, v1.16b
0x2a456923054   b94  3d803feb       str q11, [sp, #240]
0x2a456923058   b98  3dc08beb       ldr q11, [sp, #544]
0x2a45692305c   b9c  3dc087e1       ldr q1, [sp, #528]
0x2a456923060   ba0  3d8037ee       str q14, [sp, #208]
0x2a456923064   ba4  4eb31e6e       mov v14.16b, v19.16b
0x2a456923068   ba8  4eb61ed3       mov v19.16b, v22.16b
0x2a45692306c   bac  4eba1f56       mov v22.16b, v26.16b
0x2a456923070   bb0  4ea01c1a       mov v26.16b, v0.16b
0x2a456923074   bb4  3dc083e0       ldr q0, [sp, #512]
0x2a456923078   bb8  4eb51eb4       mov v20.16b, v21.16b
0x2a45692307c   bbc  4ebb1f75       mov v21.16b, v27.16b
0x2a456923080   bc0  4ebc1f9b       mov v27.16b, v28.16b
0x2a456923084   bc4  3dc07ffc       ldr q28, [sp, #496]
0x2a456923088   bc8  f9403bee       ldr x14, [sp, #112]
0x2a45692308c   bcc  f9403ff3       ldr x19, [sp, #120]
0x2a456923090   bd0  f94043ed       ldr x13, [sp, #128]
0x2a456923094   bd4  aa1903f5       mov x21, x25
0x2a456923098   bd8  f8520340       ldur x0, [x26, #-224]
0x2a45692309c   bdc  f9414ff7       ldr x23, [sp, #664]
0x2a4569230a0   be0  f94147fb       ldr cp, [sp, #648]
0x2a4569230a4   be4  f94143fc       ldr x28, [sp, #640]
0x2a4569230a8   be8  f9413ff9       ldr x25, [sp, #632]
0x2a4569230ac   bec  f94137f8       ldr x24, [sp, #616]
0x2a4569230b0   bf0  d2800004       movz x4, #0x0
0x2a4569230b4   bf4  f9024fe9       str x9, [sp, #1176]
0x2a4569230b8   bf8  eb2063ff       cmp sp, x0
0x2a4569230bc   bfc  54009009       b.ls #+0x1200 (addr 0x2a4569242bc)
0x2a4569230c0   c00  1b067d20       mul w0, w9, w6
0x2a4569230c4   c04  0b0c0006       add w6, w0, w12
0x2a4569230c8   c08  6b0602df       cmp w22, w6
0x2a4569230cc   c0c  54000189       b.ls #+0x30 (addr 0x2a4569230fc)
0x2a4569230d0   c10  0b000100       add w0, w8, w0
0x2a4569230d4   c14  6b0002df       cmp w22, w0
0x2a4569230d8   c18  54000129       b.ls #+0x24 (addr 0x2a4569230fc)
0x2a4569230dc   c1c  0b0009e0       add w0, w15, w0, lsl #2
0x2a4569230e0   c20  b8606aa0       ldr w0, [x21, x0]
0x2a4569230e4   c24  0b0609e6       add w6, w15, w6, lsl #2
0x2a4569230e8   c28  b8666aa6       ldr w6, [x21, x6]
0x2a4569230ec   c2c  aa0003f0       mov x16, x0
0x2a4569230f0   c30  aa0603e0       mov x0, x6
0x2a4569230f4   c34  aa1003e6       mov x6, x16
0x2a4569230f8   c38  14000003       b #+0xc (addr 0x2a456923104)
0x2a4569230fc   c3c  aa0403e6       mov x6, x4
0x2a456923100   c40  aa0403e0       mov x0, x4
0x2a456923104   c44  531e7408       lsl w8, w0, #2
0x2a456923108   c48  0b0802ec       add w12, w23, w8
0x2a45692310c   c4c  4b0000cf       sub w15, w6, w0
0x2a456923110   c50  6b06031f       cmp w24, w6
0x2a456923114   c54  9a9f27f6       cset x22, lo
0x2a456923118   c58  6b0000df       cmp w6, w0
0x2a45692311c   c5c  9a9f27e9       cset x9, lo
0x2a456923120   c60  2a0902d7       orr w23, w22, w9
0x2a456923124   c64  6a1702ff       tst w23, w23
0x2a456923128   c68  1a8f13f7       csel w23, wzr, w15, ne
0x2a45692312c   c6c  f9014be6       str x6, [sp, #656]
0x2a456923130   c70  f901f7f7       str x23, [sp, #1000]
0x2a456923134   c74  6b0000df       cmp w6, w0
0x2a456923138   c78  54000423       b.lo #+0x84 (addr 0x2a4569231bc)
0x2a45692313c   c7c  0b080320       add w0, w25, w8
0x2a456923140   c80  d2800099       movz x25, #0x4
0x2a456923144   c84  6b0601df       cmp w14, w6
0x2a456923148   c88  1a803338       csel w24, w25, w0, lo
0x2a45692314c   c8c  6b0601df       cmp w14, w6
0x2a456923150   c90  1a8f3080       csel w0, w4, w15, lo
0x2a456923154   c94  121c600e       and w14, w0, #0x1ffffff0
0x2a456923158   c98  0b0e0b0e       add w14, w24, w14, lsl #2
0x2a45692315c   c9c  0b080375       add w21, w27, w8
0x2a456923160   ca0  6b06027f       cmp w19, w6
0x2a456923164   ca4  1a95333b       csel w27, w25, w21, lo
0x2a456923168   ca8  6b06027f       cmp w19, w6
0x2a45692316c   cac  1a8f3095       csel w21, w4, w15, lo
0x2a456923170   cb0  121c62b3       and w19, w21, #0x1ffffff0
0x2a456923174   cb4  0b130b73       add w19, w27, w19, lsl #2
0x2a456923178   cb8  53047c0a       lsr w10, w0, #4
0x2a45692317c   cbc  12000c00       and w0, w0, #0xf
0x2a456923180   cc0  53047eab       lsr w11, w21, #4
0x2a456923184   cc4  12000eb5       and w21, w21, #0xf
0x2a456923188   cc8  6b0601bf       cmp w13, w6
0x2a45692318c   ccc  540000e3       b.lo #+0x1c (addr 0x2a4569231a8)
0x2a456923190   cd0  0b080388       add w8, w28, w8
0x2a456923194   cd4  aa0a03f0       mov x16, x10
0x2a456923198   cd8  aa0f03ea       mov x10, x15
0x2a45692319c   cdc  aa0b03ef       mov x15, x11
0x2a4569231a0   ce0  aa1003eb       mov x11, x16
0x2a4569231a4   ce4  14000011       b #+0x44 (addr 0x2a4569231e8)
0x2a4569231a8   ce8  aa0b03ef       mov x15, x11
0x2a4569231ac   cec  aa0a03eb       mov x11, x10
0x2a4569231b0   cf0  aa0403ea       mov x10, x4
0x2a4569231b4   cf4  aa1903e8       mov x8, x25
0x2a4569231b8   cf8  1400000c       b #+0x30 (addr 0x2a4569231e8)
0x2a4569231bc   cfc  aa0403ea       mov x10, x4
0x2a4569231c0   d00  d2800099       movz x25, #0x4
0x2a4569231c4   d04  aa0403f5       mov x21, x4
0x2a4569231c8   d08  aa0403ef       mov x15, x4
0x2a4569231cc   d0c  aa0403e0       mov x0, x4
0x2a4569231d0   d10  aa0403eb       mov x11, x4
0x2a4569231d4   d14  aa1903e8       mov x8, x25
0x2a4569231d8   d18  aa1903ee       mov x14, x25
0x2a4569231dc   d1c  aa1903f3       mov x19, x25
0x2a4569231e0   d20  aa1903f8       mov x24, x25
0x2a4569231e4   d24  aa1903fb       mov cp, x25
0x2a4569231e8   d28  2a0902c9       orr w9, w22, w9
0x2a4569231ec   d2c  6a09013f       tst w9, w9
0x2a4569231f0   d30  1a8c1329       csel w9, w25, w12, ne
0x2a4569231f4   d34  12000eec       and w12, w23, #0xf
0x2a4569231f8   d38  53047d56       lsr w22, w10, #4
0x2a4569231fc   d3c  53047ef9       lsr w25, w23, #4
0x2a456923200   d40  6b1901ff       cmp w15, w25
0x2a456923204   d44  1a9931ed       csel w13, w15, w25, lo
0x2a456923208   d48  6b0d017f       cmp w11, w13
0x2a45692320c   d4c  1a8d316f       csel w15, w11, w13, lo
0x2a456923210   d50  6b0f02df       cmp w22, w15
0x2a456923214   d54  1a8f32cb       csel w11, w22, w15, lo
0x2a456923218   d58  f9020bee       str x14, [sp, #1040]
0x2a45692321c   d5c  f90207f3       str x19, [sp, #1032]
0x2a456923220   d60  f90227e8       str x8, [sp, #1096]
0x2a456923224   d64  f90223ea       str x10, [sp, #1088]
0x2a456923228   d68  f901f3e0       str x0, [sp, #992]
0x2a45692322c   d6c  f901eff5       str x21, [sp, #984]
0x2a456923230   d70  f9004bfb       str cp, [sp, #144]
0x2a456923234   d74  f90047f8       str x24, [sp, #136]
0x2a456923238   d78  f9021fe9       str x9, [sp, #1080]
0x2a45692323c   d7c  f901ebec       str x12, [sp, #976]
0x2a456923240   d80  3500054b       cbnz w11, #+0xa8 (addr 0x2a4569232e8)
0x2a456923244   d84  4ea81d06       mov v6.16b, v8.16b
0x2a456923248   d88  4ea91d27       mov v7.16b, v9.16b
0x2a45692324c   d8c  4ea11c23       mov v3.16b, v1.16b
0x2a456923250   d90  4eaa1d41       mov v1.16b, v10.16b
0x2a456923254   d94  4eab1d62       mov v2.16b, v11.16b
0x2a456923258   d98  4ea01c04       mov v4.16b, v0.16b
0x2a45692325c   d9c  4ebc1f85       mov v5.16b, v28.16b
0x2a456923260   da0  4ebb1f7c       mov v28.16b, v27.16b
0x2a456923264   da4  4eba1f40       mov v0.16b, v26.16b
0x2a456923268   da8  f94157eb       ldr x11, [sp, #680]
0x2a45692326c   dac  f9415bed       ldr x13, [sp, #688]
0x2a456923270   db0  f94173ee       ldr x14, [sp, #736]
0x2a456923274   db4  4eb61eda       mov v26.16b, v22.16b
0x2a456923278   db8  4eb51ebb       mov v27.16b, v21.16b
0x2a45692327c   dbc  4eb41e95       mov v21.16b, v20.16b
0x2a456923280   dc0  4eb31e76       mov v22.16b, v19.16b
0x2a456923284   dc4  4eb21e48       mov v8.16b, v18.16b
0x2a456923288   dc8  4eb11e29       mov v9.16b, v17.16b
0x2a45692328c   dcc  f94177f3       ldr x19, [sp, #744]
0x2a456923290   dd0  4eae1dd3       mov v19.16b, v14.16b
0x2a456923294   dd4  f9417bf7       ldr x23, [sp, #752]
0x2a456923298   dd8  4eac1d8a       mov v10.16b, v12.16b
0x2a45692329c   ddc  3dc03feb       ldr q11, [sp, #240]
0x2a4569232a0   de0  3dc03bec       ldr q12, [sp, #224]
0x2a4569232a4   de4  3dc037ee       ldr q14, [sp, #208]
0x2a4569232a8   de8  f9417fe0       ldr x0, [sp, #760]
0x2a4569232ac   dec  f94183f5       ldr x21, [sp, #768]
0x2a4569232b0   df0  f94187ea       ldr x10, [sp, #776]
0x2a4569232b4   df4  f94287f9       ldr x25, [sp, #1288]
0x2a4569232b8   df8  f941d7f8       ldr x24, [sp, #936]
0x2a4569232bc   dfc  3dc0e7f4       ldr q20, [sp, #912]
0x2a4569232c0   e00  3dc0e3f2       ldr q18, [sp, #896]
0x2a4569232c4   e04  3dc0dff1       ldr q17, [sp, #880]
0x2a4569232c8   e08  f941d3ef       ldr x15, [sp, #928]
0x2a4569232cc   e0c  f941b7e8       ldr x8, [sp, #872]
0x2a4569232d0   e10  f941b3e9       ldr x9, [sp, #864]
0x2a4569232d4   e14  f94197ec       ldr x12, [sp, #808]
0x2a4569232d8   e18  f94193e6       ldr x6, [sp, #800]
0x2a4569232dc   e1c  f9418fe4       ldr x4, [sp, #792]
0x2a4569232e0   e20  f9418bfc       ldr x28, [sp, #784]
0x2a4569232e4   e24  14000115       b #+0x454 (addr 0x2a456923738)
0x2a4569232e8   e28  4ea81d06       mov v6.16b, v8.16b
0x2a4569232ec   e2c  4ea91d27       mov v7.16b, v9.16b
0x2a4569232f0   e30  4ea11c23       mov v3.16b, v1.16b
0x2a4569232f4   e34  4eaa1d41       mov v1.16b, v10.16b
0x2a4569232f8   e38  4eab1d62       mov v2.16b, v11.16b
0x2a4569232fc   e3c  4ea01c04       mov v4.16b, v0.16b
0x2a456923300   e40  4ebc1f85       mov v5.16b, v28.16b
0x2a456923304   e44  4ebb1f7c       mov v28.16b, v27.16b
0x2a456923308   e48  4eba1f40       mov v0.16b, v26.16b
0x2a45692330c   e4c  f90133eb       str x11, [sp, #608]
0x2a456923310   e50  f94157eb       ldr x11, [sp, #680]
0x2a456923314   e54  f9415bed       ldr x13, [sp, #688]
0x2a456923318   e58  f94173ee       ldr x14, [sp, #736]
0x2a45692331c   e5c  4eb61eda       mov v26.16b, v22.16b
0x2a456923320   e60  4eb51ebb       mov v27.16b, v21.16b
0x2a456923324   e64  4eb41e95       mov v21.16b, v20.16b
0x2a456923328   e68  4eb31e76       mov v22.16b, v19.16b
0x2a45692332c   e6c  3d8057f2       str q18, [sp, #336]
0x2a456923330   e70  3d8053f1       str q17, [sp, #320]
0x2a456923334   e74  f94177f3       ldr x19, [sp, #744]
0x2a456923338   e78  3d804bee       str q14, [sp, #288]
0x2a45692333c   e7c  f9417bf7       ldr x23, [sp, #752]
0x2a456923340   e80  3d8043ec       str q12, [sp, #256]
0x2a456923344   e84  f9417fe0       ldr x0, [sp, #760]
0x2a456923348   e88  f94183f5       ldr x21, [sp, #768]
0x2a45692334c   e8c  f94187ea       ldr x10, [sp, #776]
0x2a456923350   e90  f9418bfc       ldr x28, [sp, #784]
0x2a456923354   e94  aa0403f6       mov x22, x4
0x2a456923358   e98  f9418fe4       ldr x4, [sp, #792]
0x2a45692335c   e9c  f94193e6       ldr x6, [sp, #800]
0x2a456923360   ea0  f94287f9       ldr x25, [sp, #1288]
0x2a456923364   ea4  f94197ec       ldr x12, [sp, #808]
0x2a456923368   ea8  14000013       b #+0x4c (addr 0x2a4569233b4)
0x2a45692336c   eac  f94047f8       ldr x24, [sp, #136]
0x2a456923370   eb0  f90133fb       str cp, [sp, #608]
0x2a456923374   eb4  f9404bfb       ldr cp, [sp, #144]
0x2a456923378   eb8  f9421fe9       ldr x9, [sp, #1080]
0x2a45692337c   ebc  3d803fe2       str q2, [sp, #240]
0x2a456923380   ec0  3dc08be2       ldr q2, [sp, #544]
0x2a456923384   ec4  3d8043e3       str q3, [sp, #256]
0x2a456923388   ec8  3dc087e3       ldr q3, [sp, #528]
0x2a45692338c   ecc  3d803be4       str q4, [sp, #224]
0x2a456923390   ed0  3dc083e4       ldr q4, [sp, #512]
0x2a456923394   ed4  3d802be5       str q5, [sp, #160]
0x2a456923398   ed8  3dc07fe5       ldr q5, [sp, #496]
0x2a45692339c   edc  f94227e8       ldr x8, [sp, #1096]
0x2a4569233a0   ee0  3d802fea       str q10, [sp, #176]
0x2a4569233a4   ee4  3d8033e9       str q9, [sp, #192]
0x2a4569233a8   ee8  3d8037ec       str q12, [sp, #208]
0x2a4569233ac   eec  3d8057e8       str q8, [sp, #336]
0x2a4569233b0   ef0  3d804bf3       str q19, [sp, #288]
0x2a4569233b4   ef4  f852034f       ldur x15, [x26, #-224]
0x2a4569233b8   ef8  3d804ff0       str q16, [sp, #304]
0x2a4569233bc   efc  3d8047ed       str q13, [sp, #272]
0x2a4569233c0   f00  eb2f63ff       cmp sp, x15
0x2a4569233c4   f04  54008109       b.ls #+0x1020 (addr 0x2a4569243e4)
0x2a4569233c8   f08  0b16030f       add w15, w24, w22
0x2a4569233cc   f0c  3cef6b2a       ldr q10, [x25, x15]
0x2a4569233d0   f10  0b160118       add w24, w8, w22
0x2a4569233d4   f14  3cf86b29       ldr q9, [x25, x24]
0x2a4569233d8   f18  0b160368       add w8, w27, w22
0x2a4569233dc   f1c  3ce86b28       ldr q8, [x25, x8]
0x2a4569233e0   f20  3dc0d3eb       ldr q11, [sp, #832]
0x2a4569233e4   f24  4ea8d56c       fsub v12.4s, v11.4s, v8.4s
0x2a4569233e8   f28  0b16013b       add w27, w9, w22
0x2a4569233ec   f2c  3cfb6b2d       ldr q13, [x25, x27]
0x2a4569233f0   f30  3dc0d7ee       ldr q14, [sp, #848]
0x2a4569233f4   f34  4eadd5d2       fsub v18.4s, v14.4s, v13.4s
0x2a4569233f8   f38  6e32de51       fmul v17.4s, v18.4s, v18.4s
0x2a4569233fc   f3c  6e2cdd90       fmul v16.4s, v12.4s, v12.4s
0x2a456923400   f40  4e30d630       fadd v16.4s, v17.4s, v16.4s
0x2a456923404   f44  3dc0dff1       ldr q17, [sp, #880]
0x2a456923408   f48  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x2a45692340c   f4c  3dc0e7f4       ldr q20, [sp, #912]
0x2a456923410   f50  4e341e73       and v19.16b, v19.16b, v20.16b
0x2a456923414   f54  4e21da73       scvtf v19.4s, v19.4s
0x2a456923418   f58  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x2a45692341c   f5c  4e2cd4e7       fadd v7.4s, v7.4s, v12.4s
0x2a456923420   f60  3cb46b27       str q7, [x25, x20]
0x2a456923424   f64  6e33de4c       fmul v12.4s, v18.4s, v19.4s
0x2a456923428   f68  4e2cd4c6       fadd v6.4s, v6.4s, v12.4s
0x2a45692342c   f6c  3cab6b26       str q6, [x25, x11]
0x2a456923430   f70  6e31e60c       fcmge v12.4s, v16.4s, v17.4s
0x2a456923434   f74  3dc0e3f2       ldr q18, [sp, #896]
0x2a456923438   f78  6eb0e653       fcmgt v19.4s, v18.4s, v16.4s
0x2a45692343c   f7c  4e331d8c       and v12.16b, v12.16b, v19.16b
0x2a456923440   f80  4ea0ca10       fcmgt v16.4s, v16.4s, #0.0
0x2a456923444   f84  4e341e10       and v16.16b, v16.16b, v20.16b
0x2a456923448   f88  4e21da10       scvtf v16.4s, v16.4s
0x2a45692344c   f8c  4e301d8c       and v12.16b, v12.16b, v16.16b
0x2a456923450   f90  4e25d585       fadd v5.4s, v12.4s, v5.4s
0x2a456923454   f94  3cad6b25       str q5, [x25, x13]
0x2a456923458   f98  6e2cdd29       fmul v9.4s, v9.4s, v12.4s
0x2a45692345c   f9c  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x2a456923460   fa0  3ca76b24       str q4, [x25, x7]
0x2a456923464   fa4  6e2cdd49       fmul v9.4s, v10.4s, v12.4s
0x2a456923468   fa8  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x2a45692346c   fac  3ca56b23       str q3, [x25, x5]
0x2a456923470   fb0  6e2cdd08       fmul v8.4s, v8.4s, v12.4s
0x2a456923474   fb4  4e22d502       fadd v2.4s, v8.4s, v2.4s
0x2a456923478   fb8  3ca36b22       str q2, [x25, x3]
0x2a45692347c   fbc  6e2cdda8       fmul v8.4s, v13.4s, v12.4s
0x2a456923480   fc0  4e28d421       fadd v1.4s, v1.4s, v8.4s
0x2a456923484   fc4  3ca26b21       str q1, [x25, x2]
0x2a456923488   fc8  110041e9       add w9, w15, #0x10 (16)
0x2a45692348c   fcc  3ce96b28       ldr q8, [x25, x9]
0x2a456923490   fd0  11004309       add w9, w24, #0x10 (16)
0x2a456923494   fd4  3ce96b29       ldr q9, [x25, x9]
0x2a456923498   fd8  11004109       add w9, w8, #0x10 (16)
0x2a45692349c   fdc  3ce96b2a       ldr q10, [x25, x9]
0x2a4569234a0   fe0  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0x2a4569234a4   fe4  11004369       add w9, w27, #0x10 (16)
0x2a4569234a8   fe8  3ce96b2d       ldr q13, [x25, x9]
0x2a4569234ac   fec  4eadd5d0       fsub v16.4s, v14.4s, v13.4s
0x2a4569234b0   ff0  6e30de13       fmul v19.4s, v16.4s, v16.4s
0x2a4569234b4   ff4  3d808be2       str q2, [sp, #544]
0x2a4569234b8   ff8  6e2cdd82       fmul v2.4s, v12.4s, v12.4s
0x2a4569234bc   ffc  4e22d662       fadd v2.4s, v19.4s, v2.4s
0x2a4569234c0  1000  6ea2e633       fcmgt v19.4s, v17.4s, v2.4s
0x2a4569234c4  1004  4e341e73       and v19.16b, v19.16b, v20.16b
0x2a4569234c8  1008  4e21da73       scvtf v19.4s, v19.4s
0x2a4569234cc  100c  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x2a4569234d0  1010  4e2cd400       fadd v0.4s, v0.4s, v12.4s
0x2a4569234d4  1014  3ca16b20       str q0, [x25, x1]
0x2a4569234d8  1018  6e33de0c       fmul v12.4s, v16.4s, v19.4s
0x2a4569234dc  101c  4e2cd79c       fadd v28.4s, v28.4s, v12.4s
0x2a4569234e0  1020  3cae6b3c       str q28, [x25, x14]
0x2a4569234e4  1024  6e31e44c       fcmge v12.4s, v2.4s, v17.4s
0x2a4569234e8  1028  6ea2e650       fcmgt v16.4s, v18.4s, v2.4s
0x2a4569234ec  102c  4e301d8c       and v12.16b, v12.16b, v16.16b
0x2a4569234f0  1030  4ea0c842       fcmgt v2.4s, v2.4s, #0.0
0x2a4569234f4  1034  4e341c42       and v2.16b, v2.16b, v20.16b
0x2a4569234f8  1038  4e21d842       scvtf v2.4s, v2.4s
0x2a4569234fc  103c  4e221d82       and v2.16b, v12.16b, v2.16b
0x2a456923500  1040  4e3bd45b       fadd v27.4s, v2.4s, v27.4s
0x2a456923504  1044  3cb36b3b       str q27, [x25, x19]
0x2a456923508  1048  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x2a45692350c  104c  4e3ad53a       fadd v26.4s, v9.4s, v26.4s
0x2a456923510  1050  3cb76b3a       str q26, [x25, x23]
0x2a456923514  1054  6e22dd08       fmul v8.4s, v8.4s, v2.4s
0x2a456923518  1058  4e37d517       fadd v23.4s, v8.4s, v23.4s
0x2a45692351c  105c  3ca06b37       str q23, [x25, x0]
0x2a456923520  1060  6e22dd48       fmul v8.4s, v10.4s, v2.4s
0x2a456923524  1064  4e38d518       fadd v24.4s, v8.4s, v24.4s
0x2a456923528  1068  3cb56b38       str q24, [x25, x21]
0x2a45692352c  106c  6e22dda2       fmul v2.4s, v13.4s, v2.4s
0x2a456923530  1070  4e22d739       fadd v25.4s, v25.4s, v2.4s
0x2a456923534  1074  3caa6b39       str q25, [x25, x10]
0x2a456923538  1078  110081e9       add w9, w15, #0x20 (32)
0x2a45692353c  107c  3ce96b22       ldr q2, [x25, x9]
0x2a456923540  1080  11008309       add w9, w24, #0x20 (32)
0x2a456923544  1084  3ce96b28       ldr q8, [x25, x9]
0x2a456923548  1088  11008109       add w9, w8, #0x20 (32)
0x2a45692354c  108c  3ce96b29       ldr q9, [x25, x9]
0x2a456923550  1090  4ea9d56a       fsub v10.4s, v11.4s, v9.4s
0x2a456923554  1094  11008369       add w9, w27, #0x20 (32)
0x2a456923558  1098  3ce96b2c       ldr q12, [x25, x9]
0x2a45692355c  109c  4eacd5cd       fsub v13.4s, v14.4s, v12.4s
0x2a456923560  10a0  6e2dddb0       fmul v16.4s, v13.4s, v13.4s
0x2a456923564  10a4  6e2add53       fmul v19.4s, v10.4s, v10.4s
0x2a456923568  10a8  4e33d610       fadd v16.4s, v16.4s, v19.4s
0x2a45692356c  10ac  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x2a456923570  10b0  4e341e73       and v19.16b, v19.16b, v20.16b
0x2a456923574  10b4  4e21da73       scvtf v19.4s, v19.4s
0x2a456923578  10b8  6e33dd4a       fmul v10.4s, v10.4s, v19.4s
0x2a45692357c  10bc  4e2ad6d6       fadd v22.4s, v22.4s, v10.4s
0x2a456923580  10c0  3cbc6b36       str q22, [x25, x28]
0x2a456923584  10c4  6e33ddaa       fmul v10.4s, v13.4s, v19.4s
0x2a456923588  10c8  4e2ad6b5       fadd v21.4s, v21.4s, v10.4s
0x2a45692358c  10cc  3ca46b35       str q21, [x25, x4]
0x2a456923590  10d0  6e31e60a       fcmge v10.4s, v16.4s, v17.4s
0x2a456923594  10d4  6eb0e64d       fcmgt v13.4s, v18.4s, v16.4s
0x2a456923598  10d8  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x2a45692359c  10dc  4ea0ca0d       fcmgt v13.4s, v16.4s, #0.0
0x2a4569235a0  10e0  4e341dad       and v13.16b, v13.16b, v20.16b
0x2a4569235a4  10e4  4e21d9ad       scvtf v13.4s, v13.4s
0x2a4569235a8  10e8  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x2a4569235ac  10ec  3dc047ed       ldr q13, [sp, #272]
0x2a4569235b0  10f0  4e2dd54d       fadd v13.4s, v10.4s, v13.4s
0x2a4569235b4  10f4  3ca66b2d       str q13, [x25, x6]
0x2a4569235b8  10f8  6e2add08       fmul v8.4s, v8.4s, v10.4s
0x2a4569235bc  10fc  3dc04bf3       ldr q19, [sp, #288]
0x2a4569235c0  1100  4e33d513       fadd v19.4s, v8.4s, v19.4s
0x2a4569235c4  1104  3cac6b33       str q19, [x25, x12]
0x2a4569235c8  1108  6e2adc42       fmul v2.4s, v2.4s, v10.4s
0x2a4569235cc  110c  3dc04ff0       ldr q16, [sp, #304]
0x2a4569235d0  1110  4e30d450       fadd v16.4s, v2.4s, v16.4s
0x2a4569235d4  1114  f9419be9       ldr x9, [sp, #816]
0x2a4569235d8  1118  3ca96b30       str q16, [x25, x9]
0x2a4569235dc  111c  6e2add22       fmul v2.4s, v9.4s, v10.4s
0x2a4569235e0  1120  3dc053e8       ldr q8, [sp, #320]
0x2a4569235e4  1124  4e28d442       fadd v2.4s, v2.4s, v8.4s
0x2a4569235e8  1128  f9419fe9       ldr x9, [sp, #824]
0x2a4569235ec  112c  3ca96b22       str q2, [x25, x9]
0x2a4569235f0  1130  6e2add88       fmul v8.4s, v12.4s, v10.4s
0x2a4569235f4  1134  3dc057e9       ldr q9, [sp, #336]
0x2a4569235f8  1138  4e28d528       fadd v8.4s, v9.4s, v8.4s
0x2a4569235fc  113c  f941b3e9       ldr x9, [sp, #864]
0x2a456923600  1140  3ca96b28       str q8, [x25, x9]
0x2a456923604  1144  1100c1ef       add w15, w15, #0x30 (48)
0x2a456923608  1148  3cef6b29       ldr q9, [x25, x15]
0x2a45692360c  114c  1100c30f       add w15, w24, #0x30 (48)
0x2a456923610  1150  3cef6b2a       ldr q10, [x25, x15]
0x2a456923614  1154  1100c108       add w8, w8, #0x30 (48)
0x2a456923618  1158  3ce86b2c       ldr q12, [x25, x8]
0x2a45692361c  115c  3d8053e2       str q2, [sp, #320]
0x2a456923620  1160  4eacd562       fsub v2.4s, v11.4s, v12.4s
0x2a456923624  1164  1100c368       add w8, w27, #0x30 (48)
0x2a456923628  1168  3ce86b2b       ldr q11, [x25, x8]
0x2a45692362c  116c  3d8087e3       str q3, [sp, #528]
0x2a456923630  1170  4eabd5c3       fsub v3.4s, v14.4s, v11.4s
0x2a456923634  1174  6e23dc6e       fmul v14.4s, v3.4s, v3.4s
0x2a456923638  1178  3d8083e4       str q4, [sp, #512]
0x2a45692363c  117c  6e22dc44       fmul v4.4s, v2.4s, v2.4s
0x2a456923640  1180  4e24d5c4       fadd v4.4s, v14.4s, v4.4s
0x2a456923644  1184  6ea4e62e       fcmgt v14.4s, v17.4s, v4.4s
0x2a456923648  1188  4e341dce       and v14.16b, v14.16b, v20.16b
0x2a45692364c  118c  4e21d9ce       scvtf v14.4s, v14.4s
0x2a456923650  1190  6e2edc42       fmul v2.4s, v2.4s, v14.4s
0x2a456923654  1194  3d807fe5       str q5, [sp, #496]
0x2a456923658  1198  3dc03fe5       ldr q5, [sp, #240]
0x2a45692365c  119c  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x2a456923660  11a0  f941b7e8       ldr x8, [sp, #872]
0x2a456923664  11a4  3ca86b22       str q2, [x25, x8]
0x2a456923668  11a8  6e2edc63       fmul v3.4s, v3.4s, v14.4s
0x2a45692366c  11ac  3dc043e5       ldr q5, [sp, #256]
0x2a456923670  11b0  4e23d4a3       fadd v3.4s, v5.4s, v3.4s
0x2a456923674  11b4  f941d3ef       ldr x15, [sp, #928]
0x2a456923678  11b8  3caf6b23       str q3, [x25, x15]
0x2a45692367c  11bc  6e31e485       fcmge v5.4s, v4.4s, v17.4s
0x2a456923680  11c0  6ea4e64e       fcmgt v14.4s, v18.4s, v4.4s
0x2a456923684  11c4  4e2e1ca5       and v5.16b, v5.16b, v14.16b
0x2a456923688  11c8  4ea0c884       fcmgt v4.4s, v4.4s, #0.0
0x2a45692368c  11cc  4e341c84       and v4.16b, v4.16b, v20.16b
0x2a456923690  11d0  4e21d884       scvtf v4.4s, v4.4s
0x2a456923694  11d4  4e241ca4       and v4.16b, v5.16b, v4.16b
0x2a456923698  11d8  3dc02be5       ldr q5, [sp, #160]
0x2a45692369c  11dc  4e25d485       fadd v5.4s, v4.4s, v5.4s
0x2a4569236a0  11e0  f941d7f8       ldr x24, [sp, #936]
0x2a4569236a4  11e4  3cb86b25       str q5, [x25, x24]
0x2a4569236a8  11e8  6e24dd4a       fmul v10.4s, v10.4s, v4.4s
0x2a4569236ac  11ec  3dc02fee       ldr q14, [sp, #176]
0x2a4569236b0  11f0  4e2ed54a       fadd v10.4s, v10.4s, v14.4s
0x2a4569236b4  11f4  f941dbfb       ldr cp, [sp, #944]
0x2a4569236b8  11f8  3cbb6b2a       str q10, [x25, x27]
0x2a4569236bc  11fc  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x2a4569236c0  1200  3dc033ee       ldr q14, [sp, #192]
0x2a4569236c4  1204  4e2ed529       fadd v9.4s, v9.4s, v14.4s
0x2a4569236c8  1208  f941dffb       ldr cp, [sp, #952]
0x2a4569236cc  120c  3cbb6b29       str q9, [x25, x27]
0x2a4569236d0  1210  6e24dd8c       fmul v12.4s, v12.4s, v4.4s
0x2a4569236d4  1214  3dc037ee       ldr q14, [sp, #208]
0x2a4569236d8  1218  4e2ed58c       fadd v12.4s, v12.4s, v14.4s
0x2a4569236dc  121c  f941e3fb       ldr cp, [sp, #960]
0x2a4569236e0  1220  3cbb6b2c       str q12, [x25, x27]
0x2a4569236e4  1224  6e24dd64       fmul v4.4s, v11.4s, v4.4s
0x2a4569236e8  1228  3dc03beb       ldr q11, [sp, #224]
0x2a4569236ec  122c  4e24d564       fadd v4.4s, v11.4s, v4.4s
0x2a4569236f0  1230  f941e7fb       ldr cp, [sp, #968]
0x2a4569236f4  1234  3cbb6b24       str q4, [x25, x27]
0x2a4569236f8  1238  110102d6       add w22, w22, #0x40 (64)
0x2a4569236fc  123c  f94133fb       ldr cp, [sp, #608]
0x2a456923700  1240  5100077b       sub w27, w27, #0x1 (1)
0x2a456923704  1244  35ffe35b       cbnz w27, #-0x398 (addr 0x2a45692336c)
0x2a456923708  1248  3d802be5       str q5, [sp, #160]
0x2a45692370c  124c  3d802fea       str q10, [sp, #176]
0x2a456923710  1250  3d8033e9       str q9, [sp, #192]
0x2a456923714  1254  4ea21c4b       mov v11.16b, v2.16b
0x2a456923718  1258  3dc08be2       ldr q2, [sp, #544]
0x2a45692371c  125c  4ea31c6a       mov v10.16b, v3.16b
0x2a456923720  1260  3dc087e3       ldr q3, [sp, #528]
0x2a456923724  1264  4eac1d8e       mov v14.16b, v12.16b
0x2a456923728  1268  4ea41c8c       mov v12.16b, v4.16b
0x2a45692372c  126c  3dc083e4       ldr q4, [sp, #512]
0x2a456923730  1270  3dc07fe5       ldr q5, [sp, #496]
0x2a456923734  1274  3dc053e9       ldr q9, [sp, #320]
0x2a456923738  1278  3d8097e6       str q6, [sp, #592]
0x2a45692373c  127c  3d8093e7       str q7, [sp, #576]
0x2a456923740  1280  3d808be2       str q2, [sp, #544]
0x2a456923744  1284  3d8087e3       str q3, [sp, #528]
0x2a456923748  1288  3d8083e4       str q4, [sp, #512]
0x2a45692374c  128c  3d807fe5       str q5, [sp, #496]
0x2a456923750  1290  3d805ff5       str q21, [sp, #368]
0x2a456923754  1294  3d805bf6       str q22, [sp, #352]
0x2a456923758  1298  3d8057e8       str q8, [sp, #336]
0x2a45692375c  129c  3d8053e9       str q9, [sp, #320]
0x2a456923760  12a0  3d804ff0       str q16, [sp, #304]
0x2a456923764  12a4  3d804bf3       str q19, [sp, #288]
0x2a456923768  12a8  3d8047ed       str q13, [sp, #272]
0x2a45692376c  12ac  3d8043ea       str q10, [sp, #256]
0x2a456923770  12b0  3d803feb       str q11, [sp, #240]
0x2a456923774  12b4  3d803bec       str q12, [sp, #224]
0x2a456923778  12b8  3d8037ee       str q14, [sp, #208]
0x2a45692377c  12bc  f941ebf6       ldr x22, [sp, #976]
0x2a456923780  12c0  34002e76       cbz w22, #+0x5cc (addr 0x2a456923d4c)
0x2a456923784  12c4  f9414bfb       ldr cp, [sp, #656]
0x2a456923788  12c8  51004378       sub w24, w27, #0x10 (16)
0x2a45692378c  12cc  d280000f       movz x15, #0x0
0x2a456923790  12d0  6b18037f       cmp w27, w24
0x2a456923794  12d4  1a9831e8       csel w8, w15, w24, lo
0x2a456923798  12d8  11004118       add w24, w8, #0x10 (16)
0x2a45692379c  12dc  f94137ef       ldr x15, [sp, #616]
0x2a4569237a0  12e0  6b1801ff       cmp w15, w24
0x2a4569237a4  12e4  54002d43       b.lo #+0x5a8 (addr 0x2a456923d4c)
0x2a4569237a8  12e8  f9413bef       ldr x15, [sp, #624]
0x2a4569237ac  12ec  6b1801ff       cmp w15, w24
0x2a4569237b0  12f0  54002cc3       b.lo #+0x598 (addr 0x2a456923d48)
0x2a4569237b4  12f4  531e7518       lsl w24, w8, #2
0x2a4569237b8  12f8  f9413fef       ldr x15, [sp, #632]
0x2a4569237bc  12fc  0b1801e9       add w9, w15, w24
0x2a4569237c0  1300  3ce96b2c       ldr q12, [x25, x9]
0x2a4569237c4  1304  f94143ef       ldr x15, [sp, #640]
0x2a4569237c8  1308  0b1801ec       add w12, w15, w24
0x2a4569237cc  130c  3cec6b2e       ldr q14, [x25, x12]
0x2a4569237d0  1310  f94147ef       ldr x15, [sp, #648]
0x2a4569237d4  1314  0b1801e6       add w6, w15, w24
0x2a4569237d8  1318  3ce66b2a       ldr q10, [x25, x6]
0x2a4569237dc  131c  3dc0d3eb       ldr q11, [sp, #832]
0x2a4569237e0  1320  4eaad568       fsub v8.4s, v11.4s, v10.4s
0x2a4569237e4  1324  4b080368       sub w8, w27, w8
0x2a4569237e8  1328  6b16011f       cmp w8, w22
0x2a4569237ec  132c  9a9f17fb       cset cp, eq
0x2a4569237f0  1330  4e040f69       dup v9.4s, w27
0x2a4569237f4  1334  4b160116       sub w22, w8, w22
0x2a4569237f8  1338  d280003b       movz cp, #0x1
0x2a4569237fc  133c  6b08037f       cmp w27, w8
0x2a456923800  1340  7a423ac2       ccmp w22, #2, #nzCv, lo
0x2a456923804  1344  9a9f27ef       cset x15, lo
0x2a456923808  1348  4e0c1de9       mov v9.s[1], w15
0x2a45692380c  134c  d280004f       movz x15, #0x2
0x2a456923810  1350  6b0801ff       cmp w15, w8
0x2a456923814  1354  7a433ac2       ccmp w22, #3, #nzCv, lo
0x2a456923818  1358  9a9f27fb       cset cp, lo
0x2a45692381c  135c  4e141f69       mov v9.s[2], w27
0x2a456923820  1360  d280007b       movz cp, #0x3
0x2a456923824  1364  6b08037f       cmp w27, w8
0x2a456923828  1368  7a443ac2       ccmp w22, #4, #nzCv, lo
0x2a45692382c  136c  9a9f27fb       cset cp, lo
0x2a456923830  1370  4e1c1f69       mov v9.s[3], w27
0x2a456923834  1374  4e21d929       scvtf v9.4s, v9.4s
0x2a456923838  1378  f9414ffb       ldr cp, [sp, #664]
0x2a45692383c  137c  0b180378       add w24, w27, w24
0x2a456923840  1380  3cf86b30       ldr q16, [x25, x24]
0x2a456923844  1384  3dc0d7f3       ldr q19, [sp, #848]
0x2a456923848  1388  4eb0d66d       fsub v13.4s, v19.4s, v16.4s
0x2a45692384c  138c  6e2dddb5       fmul v21.4s, v13.4s, v13.4s
0x2a456923850  1390  6e28dd16       fmul v22.4s, v8.4s, v8.4s
0x2a456923854  1394  4e36d6b5       fadd v21.4s, v21.4s, v22.4s
0x2a456923858  1398  6eb5e636       fcmgt v22.4s, v17.4s, v21.4s
0x2a45692385c  139c  4e341ed6       and v22.16b, v22.16b, v20.16b
0x2a456923860  13a0  4e21dad6       scvtf v22.4s, v22.4s
0x2a456923864  13a4  6e36dd36       fmul v22.4s, v9.4s, v22.4s
0x2a456923868  13a8  6e36dd08       fmul v8.4s, v8.4s, v22.4s
0x2a45692386c  13ac  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0x2a456923870  13b0  3cb46b27       str q7, [x25, x20]
0x2a456923874  13b4  6e36dda8       fmul v8.4s, v13.4s, v22.4s
0x2a456923878  13b8  4e28d4c6       fadd v6.4s, v6.4s, v8.4s
0x2a45692387c  13bc  3cab6b26       str q6, [x25, x11]
0x2a456923880  13c0  6e31e6a8       fcmge v8.4s, v21.4s, v17.4s
0x2a456923884  13c4  6eb5e64d       fcmgt v13.4s, v18.4s, v21.4s
0x2a456923888  13c8  4e2d1d08       and v8.16b, v8.16b, v13.16b
0x2a45692388c  13cc  4ea0caad       fcmgt v13.4s, v21.4s, #0.0
0x2a456923890  13d0  4e341dad       and v13.16b, v13.16b, v20.16b
0x2a456923894  13d4  4e21d9ad       scvtf v13.4s, v13.4s
0x2a456923898  13d8  4e2d1d08       and v8.16b, v8.16b, v13.16b
0x2a45692389c  13dc  6e29dd08       fmul v8.4s, v8.4s, v9.4s
0x2a4569238a0  13e0  4e25d505       fadd v5.4s, v8.4s, v5.4s
0x2a4569238a4  13e4  3cad6b25       str q5, [x25, x13]
0x2a4569238a8  13e8  6e28ddc9       fmul v9.4s, v14.4s, v8.4s
0x2a4569238ac  13ec  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x2a4569238b0  13f0  3ca76b24       str q4, [x25, x7]
0x2a4569238b4  13f4  6e28dd89       fmul v9.4s, v12.4s, v8.4s
0x2a4569238b8  13f8  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x2a4569238bc  13fc  3ca56b23       str q3, [x25, x5]
0x2a4569238c0  1400  6e28dd49       fmul v9.4s, v10.4s, v8.4s
0x2a4569238c4  1404  4e22d522       fadd v2.4s, v9.4s, v2.4s
0x2a4569238c8  1408  3ca36b22       str q2, [x25, x3]
0x2a4569238cc  140c  6e28de08       fmul v8.4s, v16.4s, v8.4s
0x2a4569238d0  1410  4e28d428       fadd v8.4s, v1.4s, v8.4s
0x2a4569238d4  1414  3ca26b28       str q8, [x25, x2]
0x2a4569238d8  1418  9100412f       add x15, x9, #0x10 (16)
0x2a4569238dc  141c  3cef6b29       ldr q9, [x25, x15]
0x2a4569238e0  1420  9100418f       add x15, x12, #0x10 (16)
0x2a4569238e4  1424  3cef6b2a       ldr q10, [x25, x15]
0x2a4569238e8  1428  910040cf       add x15, x6, #0x10 (16)
0x2a4569238ec  142c  3cef6b2c       ldr q12, [x25, x15]
0x2a4569238f0  1430  4eacd56d       fsub v13.4s, v11.4s, v12.4s
0x2a4569238f4  1434  d2c000b0       movz x16, #0x500000000
0x2a4569238f8  1438  9e67020e       fmov d14, x16
0x2a4569238fc  143c  4e041ece       mov v14.s[0], w22
0x2a456923900  1440  d28000b0       movz x16, #0x5
0x2a456923904  1444  9e670210       fmov d16, x16
0x2a456923908  1448  4e0c1d10       mov v16.s[1], w8
0x2a45692390c  144c  6eae360e       cmhi v14.4s, v16.4s, v14.4s
0x2a456923910  1450  d2c000d0       movz x16, #0x600000000
0x2a456923914  1454  9e670210       fmov d16, x16
0x2a456923918  1458  4e041d10       mov v16.s[0], w8
0x2a45692391c  145c  d2800090       movz x16, #0x4
0x2a456923920  1460  9e670215       fmov d21, x16
0x2a456923924  1464  4e0c1ed5       mov v21.s[1], w22
0x2a456923928  1468  6eb53610       cmhi v16.4s, v16.4s, v21.4s
0x2a45692392c  146c  4e301dce       and v14.16b, v14.16b, v16.16b
0x2a456923930  1470  0f20a5ce       sxtl v14.2d, v14.2s
0x2a456923934  1474  4eae1dde       mov v30.16b, v14.16b
0x2a456923938  1478  4e0407ce       dup v14.4s, v30.s[0]
0x2a45692393c  147c  6e0c47ce       mov v14.s[1], v30.s[2]
0x2a456923940  1480  d28000cf       movz x15, #0x6
0x2a456923944  1484  6b0801ff       cmp w15, w8
0x2a456923948  1488  7a473ac2       ccmp w22, #7, #nzCv, lo
0x2a45692394c  148c  9a9f27ef       cset x15, lo
0x2a456923950  1490  4e141dee       mov v14.s[2], w15
0x2a456923954  1494  d28000ef       movz x15, #0x7
0x2a456923958  1498  6b0801ff       cmp w15, w8
0x2a45692395c  149c  7a483ac2       ccmp w22, #8, #nzCv, lo
0x2a456923960  14a0  9a9f27ef       cset x15, lo
0x2a456923964  14a4  4e1c1dee       mov v14.s[3], w15
0x2a456923968  14a8  4e341dce       and v14.16b, v14.16b, v20.16b
0x2a45692396c  14ac  4e21d9ce       scvtf v14.4s, v14.4s
0x2a456923970  14b0  9100430f       add x15, x24, #0x10 (16)
0x2a456923974  14b4  3cef6b30       ldr q16, [x25, x15]
0x2a456923978  14b8  4eb0d675       fsub v21.4s, v19.4s, v16.4s
0x2a45692397c  14bc  6e35deb6       fmul v22.4s, v21.4s, v21.4s
0x2a456923980  14c0  6e2ddda1       fmul v1.4s, v13.4s, v13.4s
0x2a456923984  14c4  4e21d6d6       fadd v22.4s, v22.4s, v1.4s
0x2a456923988  14c8  6eb6e621       fcmgt v1.4s, v17.4s, v22.4s
0x2a45692398c  14cc  4e341c21       and v1.16b, v1.16b, v20.16b
0x2a456923990  14d0  4e21d821       scvtf v1.4s, v1.4s
0x2a456923994  14d4  6e21ddc1       fmul v1.4s, v14.4s, v1.4s
0x2a456923998  14d8  6e21ddad       fmul v13.4s, v13.4s, v1.4s
0x2a45692399c  14dc  4e2dd40d       fadd v13.4s, v0.4s, v13.4s
0x2a4569239a0  14e0  3ca16b2d       str q13, [x25, x1]
0x2a4569239a4  14e4  6e21deb5       fmul v21.4s, v21.4s, v1.4s
0x2a4569239a8  14e8  4e35d795       fadd v21.4s, v28.4s, v21.4s
0x2a4569239ac  14ec  3cae6b35       str q21, [x25, x14]
0x2a4569239b0  14f0  6e31e6dc       fcmge v28.4s, v22.4s, v17.4s
0x2a4569239b4  14f4  6eb6e640       fcmgt v0.4s, v18.4s, v22.4s
0x2a4569239b8  14f8  4e201f9c       and v28.16b, v28.16b, v0.16b
0x2a4569239bc  14fc  4ea0cad6       fcmgt v22.4s, v22.4s, #0.0
0x2a4569239c0  1500  4e341ed6       and v22.16b, v22.16b, v20.16b
0x2a4569239c4  1504  4e21dad6       scvtf v22.4s, v22.4s
0x2a4569239c8  1508  4e361f96       and v22.16b, v28.16b, v22.16b
0x2a4569239cc  150c  6e2edece       fmul v14.4s, v22.4s, v14.4s
0x2a4569239d0  1510  4e3bd5d6       fadd v22.4s, v14.4s, v27.4s
0x2a4569239d4  1514  3cb36b36       str q22, [x25, x19]
0x2a4569239d8  1518  6e2edd4a       fmul v10.4s, v10.4s, v14.4s
0x2a4569239dc  151c  4e3ad54a       fadd v10.4s, v10.4s, v26.4s
0x2a4569239e0  1520  3cb76b2a       str q10, [x25, x23]
0x2a4569239e4  1524  6e2edd29       fmul v9.4s, v9.4s, v14.4s
0x2a4569239e8  1528  4e37d537       fadd v23.4s, v9.4s, v23.4s
0x2a4569239ec  152c  3ca06b37       str q23, [x25, x0]
0x2a4569239f0  1530  6e2edd89       fmul v9.4s, v12.4s, v14.4s
0x2a4569239f4  1534  4e38d538       fadd v24.4s, v9.4s, v24.4s
0x2a4569239f8  1538  3cb56b38       str q24, [x25, x21]
0x2a4569239fc  153c  6e2ede09       fmul v9.4s, v16.4s, v14.4s
0x2a456923a00  1540  4e29d739       fadd v25.4s, v25.4s, v9.4s
0x2a456923a04  1544  3caa6b39       str q25, [x25, x10]
0x2a456923a08  1548  9100812f       add x15, x9, #0x20 (32)
0x2a456923a0c  154c  3cef6b29       ldr q9, [x25, x15]
0x2a456923a10  1550  9100818f       add x15, x12, #0x20 (32)
0x2a456923a14  1554  3cef6b2c       ldr q12, [x25, x15]
0x2a456923a18  1558  910080cf       add x15, x6, #0x20 (32)
0x2a456923a1c  155c  3cef6b2e       ldr q14, [x25, x15]
0x2a456923a20  1560  4eaed570       fsub v16.4s, v11.4s, v14.4s
0x2a456923a24  1564  d2c00130       movz x16, #0x900000000
0x2a456923a28  1568  9e67021a       fmov d26, x16
0x2a456923a2c  156c  4e041eda       mov v26.s[0], w22
0x2a456923a30  1570  d2800130       movz x16, #0x9
0x2a456923a34  1574  9e67021b       fmov d27, x16
0x2a456923a38  1578  4e0c1d1b       mov v27.s[1], w8
0x2a456923a3c  157c  6eba377a       cmhi v26.4s, v27.4s, v26.4s
0x2a456923a40  1580  d2c00150       movz x16, #0xa00000000
0x2a456923a44  1584  9e67021b       fmov d27, x16
0x2a456923a48  1588  4e041d1b       mov v27.s[0], w8
0x2a456923a4c  158c  d2800110       movz x16, #0x8
0x2a456923a50  1590  9e67021c       fmov d28, x16
0x2a456923a54  1594  4e0c1edc       mov v28.s[1], w22
0x2a456923a58  1598  6ebc377b       cmhi v27.4s, v27.4s, v28.4s
0x2a456923a5c  159c  4e3b1f5a       and v26.16b, v26.16b, v27.16b
0x2a456923a60  15a0  0f20a75a       sxtl v26.2d, v26.2s
0x2a456923a64  15a4  4eba1f5e       mov v30.16b, v26.16b
0x2a456923a68  15a8  4e0407da       dup v26.4s, v30.s[0]
0x2a456923a6c  15ac  6e0c47da       mov v26.s[1], v30.s[2]
0x2a456923a70  15b0  d280014f       movz x15, #0xa
0x2a456923a74  15b4  6b0801ff       cmp w15, w8
0x2a456923a78  15b8  7a4b3ac2       ccmp w22, #11, #nzCv, lo
0x2a456923a7c  15bc  9a9f27ef       cset x15, lo
0x2a456923a80  15c0  4e141dfa       mov v26.s[2], w15
0x2a456923a84  15c4  d280016f       movz x15, #0xb
0x2a456923a88  15c8  6b0801ff       cmp w15, w8
0x2a456923a8c  15cc  7a4c3ac2       ccmp w22, #12, #nzCv, lo
0x2a456923a90  15d0  9a9f27ef       cset x15, lo
0x2a456923a94  15d4  4e1c1dfa       mov v26.s[3], w15
0x2a456923a98  15d8  4e341f5a       and v26.16b, v26.16b, v20.16b
0x2a456923a9c  15dc  4e21db5a       scvtf v26.4s, v26.4s
0x2a456923aa0  15e0  9100830f       add x15, x24, #0x20 (32)
0x2a456923aa4  15e4  3cef6b3b       ldr q27, [x25, x15]
0x2a456923aa8  15e8  4ebbd67c       fsub v28.4s, v19.4s, v27.4s
0x2a456923aac  15ec  6e3cdf80       fmul v0.4s, v28.4s, v28.4s
0x2a456923ab0  15f0  6e30de01       fmul v1.4s, v16.4s, v16.4s
0x2a456923ab4  15f4  4e21d400       fadd v0.4s, v0.4s, v1.4s
0x2a456923ab8  15f8  6ea0e621       fcmgt v1.4s, v17.4s, v0.4s
0x2a456923abc  15fc  4e341c21       and v1.16b, v1.16b, v20.16b
0x2a456923ac0  1600  4e21d821       scvtf v1.4s, v1.4s
0x2a456923ac4  1604  6e21df41       fmul v1.4s, v26.4s, v1.4s
0x2a456923ac8  1608  6e21de10       fmul v16.4s, v16.4s, v1.4s
0x2a456923acc  160c  3d808be2       str q2, [sp, #544]
0x2a456923ad0  1610  3dc05be2       ldr q2, [sp, #352]
0x2a456923ad4  1614  4e30d442       fadd v2.4s, v2.4s, v16.4s
0x2a456923ad8  1618  3cbc6b22       str q2, [x25, x28]
0x2a456923adc  161c  6e21df90       fmul v16.4s, v28.4s, v1.4s
0x2a456923ae0  1620  3dc05ffc       ldr q28, [sp, #368]
0x2a456923ae4  1624  4e30d790       fadd v16.4s, v28.4s, v16.4s
0x2a456923ae8  1628  3ca46b30       str q16, [x25, x4]
0x2a456923aec  162c  6e31e41c       fcmge v28.4s, v0.4s, v17.4s
0x2a456923af0  1630  6ea0e641       fcmgt v1.4s, v18.4s, v0.4s
0x2a456923af4  1634  4e211f9c       and v28.16b, v28.16b, v1.16b
0x2a456923af8  1638  4ea0c800       fcmgt v0.4s, v0.4s, #0.0
0x2a456923afc  163c  4e341c00       and v0.16b, v0.16b, v20.16b
0x2a456923b00  1640  4e21d800       scvtf v0.4s, v0.4s
0x2a456923b04  1644  4e201f9c       and v28.16b, v28.16b, v0.16b
0x2a456923b08  1648  6e3adf9a       fmul v26.4s, v28.4s, v26.4s
0x2a456923b0c  164c  3dc047fc       ldr q28, [sp, #272]
0x2a456923b10  1650  4e3cd75c       fadd v28.4s, v26.4s, v28.4s
0x2a456923b14  1654  f94193ef       ldr x15, [sp, #800]
0x2a456923b18  1658  3caf6b3c       str q28, [x25, x15]
0x2a456923b1c  165c  6e3add8c       fmul v12.4s, v12.4s, v26.4s
0x2a456923b20  1660  3dc04be0       ldr q0, [sp, #288]
0x2a456923b24  1664  4e20d58c       fadd v12.4s, v12.4s, v0.4s
0x2a456923b28  1668  f94197ea       ldr x10, [sp, #808]
0x2a456923b2c  166c  3caa6b2c       str q12, [x25, x10]
0x2a456923b30  1670  6e3add29       fmul v9.4s, v9.4s, v26.4s
0x2a456923b34  1674  3dc04fe0       ldr q0, [sp, #304]
0x2a456923b38  1678  4e20d529       fadd v9.4s, v9.4s, v0.4s
0x2a456923b3c  167c  f9419bea       ldr x10, [sp, #816]
0x2a456923b40  1680  3caa6b29       str q9, [x25, x10]
0x2a456923b44  1684  6e3addce       fmul v14.4s, v14.4s, v26.4s
0x2a456923b48  1688  3dc053e0       ldr q0, [sp, #320]
0x2a456923b4c  168c  4e20d5ce       fadd v14.4s, v14.4s, v0.4s
0x2a456923b50  1690  f9419fea       ldr x10, [sp, #824]
0x2a456923b54  1694  3caa6b2e       str q14, [x25, x10]
0x2a456923b58  1698  6e3adf7a       fmul v26.4s, v27.4s, v26.4s
0x2a456923b5c  169c  3dc057fb       ldr q27, [sp, #336]
0x2a456923b60  16a0  4e3ad77a       fadd v26.4s, v27.4s, v26.4s
0x2a456923b64  16a4  f941b3ea       ldr x10, [sp, #864]
0x2a456923b68  16a8  3caa6b3a       str q26, [x25, x10]
0x2a456923b6c  16ac  9100c129       add x9, x9, #0x30 (48)
0x2a456923b70  16b0  3ce96b3b       ldr q27, [x25, x9]
0x2a456923b74  16b4  9100c189       add x9, x12, #0x30 (48)
0x2a456923b78  16b8  3ce96b20       ldr q0, [x25, x9]
0x2a456923b7c  16bc  9100c0c6       add x6, x6, #0x30 (48)
0x2a456923b80  16c0  3ce66b21       ldr q1, [x25, x6]
0x2a456923b84  16c4  3d805be2       str q2, [sp, #352]
0x2a456923b88  16c8  4ea1d562       fsub v2.4s, v11.4s, v1.4s
0x2a456923b8c  16cc  d2c001b0       movz x16, #0xd00000000
0x2a456923b90  16d0  9e67020b       fmov d11, x16
0x2a456923b94  16d4  4e041ecb       mov v11.s[0], w22
0x2a456923b98  16d8  3d8087e3       str q3, [sp, #528]
0x2a456923b9c  16dc  d28001b0       movz x16, #0xd
0x2a456923ba0  16e0  9e670203       fmov d3, x16
0x2a456923ba4  16e4  4e0c1d03       mov v3.s[1], w8
0x2a456923ba8  16e8  6eab3463       cmhi v3.4s, v3.4s, v11.4s
0x2a456923bac  16ec  d2c001d0       movz x16, #0xe00000000
0x2a456923bb0  16f0  9e67020b       fmov d11, x16
0x2a456923bb4  16f4  4e041d0b       mov v11.s[0], w8
0x2a456923bb8  16f8  3d8083e4       str q4, [sp, #512]
0x2a456923bbc  16fc  d2800190       movz x16, #0xc
0x2a456923bc0  1700  9e670204       fmov d4, x16
0x2a456923bc4  1704  4e0c1ec4       mov v4.s[1], w22
0x2a456923bc8  1708  6ea43564       cmhi v4.4s, v11.4s, v4.4s
0x2a456923bcc  170c  4e241c63       and v3.16b, v3.16b, v4.16b
0x2a456923bd0  1710  0f20a463       sxtl v3.2d, v3.2s
0x2a456923bd4  1714  4ea31c7e       mov v30.16b, v3.16b
0x2a456923bd8  1718  4e0407c3       dup v3.4s, v30.s[0]
0x2a456923bdc  171c  6e0c47c3       mov v3.s[1], v30.s[2]
0x2a456923be0  1720  d28001c6       movz x6, #0xe
0x2a456923be4  1724  6b0800df       cmp w6, w8
0x2a456923be8  1728  7a4f3ac2       ccmp w22, #15, #nzCv, lo
0x2a456923bec  172c  9a9f27e6       cset x6, lo
0x2a456923bf0  1730  4e141cc3       mov v3.s[2], w6
0x2a456923bf4  1734  d28001e6       movz x6, #0xf
0x2a456923bf8  1738  6b0800df       cmp w6, w8
0x2a456923bfc  173c  7a503ac2       ccmp w22, #16, #nzCv, lo
0x2a456923c00  1740  9a9f27e6       cset x6, lo
0x2a456923c04  1744  4e1c1cc3       mov v3.s[3], w6
0x2a456923c08  1748  4e341c63       and v3.16b, v3.16b, v20.16b
0x2a456923c0c  174c  4e21d863       scvtf v3.4s, v3.4s
0x2a456923c10  1750  9100c306       add x6, x24, #0x30 (48)
0x2a456923c14  1754  3ce66b24       ldr q4, [x25, x6]
0x2a456923c18  1758  4ea4d66b       fsub v11.4s, v19.4s, v4.4s
0x2a456923c1c  175c  6e2bdd73       fmul v19.4s, v11.4s, v11.4s
0x2a456923c20  1760  3d807fe5       str q5, [sp, #496]
0x2a456923c24  1764  6e22dc45       fmul v5.4s, v2.4s, v2.4s
0x2a456923c28  1768  4e25d665       fadd v5.4s, v19.4s, v5.4s
0x2a456923c2c  176c  6ea5e633       fcmgt v19.4s, v17.4s, v5.4s
0x2a456923c30  1770  4e341e73       and v19.16b, v19.16b, v20.16b
0x2a456923c34  1774  4e21da73       scvtf v19.4s, v19.4s
0x2a456923c38  1778  6e33dc73       fmul v19.4s, v3.4s, v19.4s
0x2a456923c3c  177c  6e33dc42       fmul v2.4s, v2.4s, v19.4s
0x2a456923c40  1780  3d8097e6       str q6, [sp, #592]
0x2a456923c44  1784  3dc03fe6       ldr q6, [sp, #240]
0x2a456923c48  1788  4e22d4c2       fadd v2.4s, v6.4s, v2.4s
0x2a456923c4c  178c  f941b7e6       ldr x6, [sp, #872]
0x2a456923c50  1790  3ca66b22       str q2, [x25, x6]
0x2a456923c54  1794  6e33dd66       fmul v6.4s, v11.4s, v19.4s
0x2a456923c58  1798  3dc043eb       ldr q11, [sp, #256]
0x2a456923c5c  179c  4e26d566       fadd v6.4s, v11.4s, v6.4s
0x2a456923c60  17a0  f941d3e8       ldr x8, [sp, #928]
0x2a456923c64  17a4  3ca86b26       str q6, [x25, x8]
0x2a456923c68  17a8  6e31e4ab       fcmge v11.4s, v5.4s, v17.4s
0x2a456923c6c  17ac  6ea5e653       fcmgt v19.4s, v18.4s, v5.4s
0x2a456923c70  17b0  4e331d6b       and v11.16b, v11.16b, v19.16b
0x2a456923c74  17b4  4ea0c8a5       fcmgt v5.4s, v5.4s, #0.0
0x2a456923c78  17b8  4e341ca5       and v5.16b, v5.16b, v20.16b
0x2a456923c7c  17bc  4e21d8a5       scvtf v5.4s, v5.4s
0x2a456923c80  17c0  4e251d65       and v5.16b, v11.16b, v5.16b
0x2a456923c84  17c4  6e23dca3       fmul v3.4s, v5.4s, v3.4s
0x2a456923c88  17c8  3dc02bf3       ldr q19, [sp, #160]
0x2a456923c8c  17cc  4e33d465       fadd v5.4s, v3.4s, v19.4s
0x2a456923c90  17d0  f941d7e9       ldr x9, [sp, #936]
0x2a456923c94  17d4  3ca96b25       str q5, [x25, x9]
0x2a456923c98  17d8  6e23dc0b       fmul v11.4s, v0.4s, v3.4s
0x2a456923c9c  17dc  3dc02ff3       ldr q19, [sp, #176]
0x2a456923ca0  17e0  4e33d56b       fadd v11.4s, v11.4s, v19.4s
0x2a456923ca4  17e4  f941dbec       ldr x12, [sp, #944]
0x2a456923ca8  17e8  3cac6b2b       str q11, [x25, x12]
0x2a456923cac  17ec  6e23df73       fmul v19.4s, v27.4s, v3.4s
0x2a456923cb0  17f0  3dc033fb       ldr q27, [sp, #192]
0x2a456923cb4  17f4  4e3bd673       fadd v19.4s, v19.4s, v27.4s
0x2a456923cb8  17f8  f941dff8       ldr x24, [sp, #952]
0x2a456923cbc  17fc  3cb86b33       str q19, [x25, x24]
0x2a456923cc0  1800  6e23dc3b       fmul v27.4s, v1.4s, v3.4s
0x2a456923cc4  1804  3dc037e0       ldr q0, [sp, #208]
0x2a456923cc8  1808  4e20d77b       fadd v27.4s, v27.4s, v0.4s
0x2a456923ccc  180c  f941e3f6       ldr x22, [sp, #960]
0x2a456923cd0  1810  3cb66b3b       str q27, [x25, x22]
0x2a456923cd4  1814  6e23dc83       fmul v3.4s, v4.4s, v3.4s
0x2a456923cd8  1818  3dc03be4       ldr q4, [sp, #224]
0x2a456923cdc  181c  4e23d483       fadd v3.4s, v4.4s, v3.4s
0x2a456923ce0  1820  f941e7e6       ldr x6, [sp, #968]
0x2a456923ce4  1824  3ca66b23       str q3, [x25, x6]
0x2a456923ce8  1828  aa0a03e9       mov x9, x10
0x2a456923cec  182c  f94187ea       ldr x10, [sp, #776]
0x2a456923cf0  1830  aa0f03e6       mov x6, x15
0x2a456923cf4  1834  f94197ec       ldr x12, [sp, #808]
0x2a456923cf8  1838  3d802be5       str q5, [sp, #160]
0x2a456923cfc  183c  3d802feb       str q11, [sp, #176]
0x2a456923d00  1840  3d8033f3       str q19, [sp, #192]
0x2a456923d04  1844  4ea81d01       mov v1.16b, v8.16b
0x2a456923d08  1848  4ead1da0       mov v0.16b, v13.16b
0x2a456923d0c  184c  4ebc1f8d       mov v13.16b, v28.16b
0x2a456923d10  1850  4eb51ebc       mov v28.16b, v21.16b
0x2a456923d14  1854  4eb01e15       mov v21.16b, v16.16b
0x2a456923d18  1858  4ea91d30       mov v16.16b, v9.16b
0x2a456923d1c  185c  4eae1dc9       mov v9.16b, v14.16b
0x2a456923d20  1860  4ebb1f6e       mov v14.16b, v27.16b
0x2a456923d24  1864  4eac1d93       mov v19.16b, v12.16b
0x2a456923d28  1868  4ea31c6c       mov v12.16b, v3.16b
0x2a456923d2c  186c  4ea21c4b       mov v11.16b, v2.16b
0x2a456923d30  1870  4eba1f48       mov v8.16b, v26.16b
0x2a456923d34  1874  4eaa1d5a       mov v26.16b, v10.16b
0x2a456923d38  1878  4ea61cca       mov v10.16b, v6.16b
0x2a456923d3c  187c  4eb61edb       mov v27.16b, v22.16b
0x2a456923d40  1880  3dc05bf6       ldr q22, [sp, #352]
0x2a456923d44  1884  1400005b       b #+0x16c (addr 0x2a456923eb0)
0x2a456923d48  1888  f941e3e8       ldr x8, [sp, #960]
0x2a456923d4c  188c  f94223ef       ldr x15, [sp, #1088]
0x2a456923d50  1890  12000de8       and w8, w15, #0xf
0x2a456923d54  1894  f941eff8       ldr x24, [sp, #984]
0x2a456923d58  1898  6b16031f       cmp w24, w22
0x2a456923d5c  189c  1a96331b       csel w27, w24, w22, lo
0x2a456923d60  18a0  f941f3f6       ldr x22, [sp, #992]
0x2a456923d64  18a4  6b1b02df       cmp w22, w27
0x2a456923d68  18a8  1a9b32d8       csel w24, w22, w27, lo
0x2a456923d6c  18ac  6b18011f       cmp w8, w24
0x2a456923d70  18b0  1a983116       csel w22, w8, w24, lo
0x2a456923d74  18b4  350000f6       cbnz w22, #+0x1c (addr 0x2a456923d90)
0x2a456923d78  18b8  3d807fe5       str q5, [sp, #496]
0x2a456923d7c  18bc  3d8083e4       str q4, [sp, #512]
0x2a456923d80  18c0  3d8087e3       str q3, [sp, #528]
0x2a456923d84  18c4  3d808be2       str q2, [sp, #544]
0x2a456923d88  18c8  3d8097e6       str q6, [sp, #592]
0x2a456923d8c  18cc  14000049       b #+0x124 (addr 0x2a456923eb0)
0x2a456923d90  18d0  f941f7e8       ldr x8, [sp, #1000]
0x2a456923d94  18d4  121c6108       and w8, w8, #0x1ffffff0
0x2a456923d98  18d8  f9421ff8       ldr x24, [sp, #1080]
0x2a456923d9c  18dc  0b080b08       add w8, w24, w8, lsl #2
0x2a456923da0  18e0  121c61ef       and w15, w15, #0x1ffffff0
0x2a456923da4  18e4  f94227f8       ldr x24, [sp, #1096]
0x2a456923da8  18e8  0b0f0b0f       add w15, w24, w15, lsl #2
0x2a456923dac  18ec  3dc11ff1       ldr q17, [sp, #1136]
0x2a456923db0  18f0  fd4243f2       ldr d18, [sp, #1152]
0x2a456923db4  18f4  fd4237f4       ldr d20, [sp, #1128]
0x2a456923db8  18f8  fd4217e4       ldr d4, [sp, #1064]
0x2a456923dbc  18fc  fd421be5       ldr d5, [sp, #1072]
0x2a456923dc0  1900  fd422be7       ldr d7, [sp, #1104]
0x2a456923dc4  1904  1e2e1006       fmov s6, #0x70 (1.0000)
0x2a456923dc8  1908  aa0803fb       mov cp, x8
0x2a456923dcc  190c  f9420be8       ldr x8, [sp, #1040]
0x2a456923dd0  1910  f94207f8       ldr x24, [sp, #1032]
0x2a456923dd4  1914  f8520346       ldur x6, [x26, #-224]
0x2a456923dd8  1918  fd4213e3       ldr d3, [sp, #1056]
0x2a456923ddc  191c  fd420fe2       ldr d2, [sp, #1048]
0x2a456923de0  1920  eb2663ff       cmp sp, x6
0x2a456923de4  1924  54003829       b.ls #+0x704 (addr 0x2a4569244e8)
0x2a456923de8  1928  bc7b6b28       ldr s8, [x25, x27]
0x2a456923dec  192c  1e283849       fsub s9, s2, s8
0x2a456923df0  1930  1e290922       fmul s2, s9, s9
0x2a456923df4  1934  2a1803e6       mov w6, w24
0x2a456923df8  1938  bc666b2a       ldr s10, [x25, x6]
0x2a456923dfc  193c  1e2a386b       fsub s11, s3, s10
0x2a456923e00  1940  1e2b0963       fmul s3, s11, s11
0x2a456923e04  1944  1e232842       fadd s2, s2, s3
0x2a456923e08  1948  1e242040       fcmp s2, s4
0x2a456923e0c  194c  54000243       b.lo #+0x48 (addr 0x2a456923e54)
0x2a456923e10  1950  1e252040       fcmp s2, s5
0x2a456923e14  1954  54000282       b.hs #+0x50 (addr 0x2a456923e64)
0x2a456923e18  1958  1e202048       fcmp s2, #0.0
0x2a456923e1c  195c  5400024d       b.le #+0x48 (addr 0x2a456923e64)
0x2a456923e20  1960  4e040502       dup v2.4s, v8.s[0]
0x2a456923e24  1964  6e0c0542       mov v2.s[1], v10.s[0]
0x2a456923e28  1968  2a0803e6       mov w6, w8
0x2a456923e2c  196c  bc666b23       ldr s3, [x25, x6]
0x2a456923e30  1970  6e140462       mov v2.s[2], v3.s[0]
0x2a456923e34  1974  bc6f6b23       ldr s3, [x25, x15]
0x2a456923e38  1978  6e1c0462       mov v2.s[3], v3.s[0]
0x2a456923e3c  197c  4e22d622       fadd v2.4s, v17.4s, v2.4s
0x2a456923e40  1980  1e262a43       fadd s3, s18, s6
0x2a456923e44  1984  4ea21c51       mov v17.16b, v2.16b
0x2a456923e48  1988  4ea31c72       mov v18.16b, v3.16b
0x2a456923e4c  198c  fd0233e3       str d3, [sp, #1120]
0x2a456923e50  1990  14000005       b #+0x14 (addr 0x2a456923e64)
0x2a456923e54  1994  1e2b28e7       fadd s7, s7, s11
0x2a456923e58  1998  1e292a82       fadd s2, s20, s9
0x2a456923e5c  199c  fd022fe2       str d2, [sp, #1112]
0x2a456923e60  19a0  4ea21c54       mov v20.16b, v2.16b
0x2a456923e64  19a4  1100137b       add w27, w27, #0x4 (4)
0x2a456923e68  19a8  11001318       add w24, w24, #0x4 (4)
0x2a456923e6c  19ac  11001108       add w8, w8, #0x4 (4)
0x2a456923e70  19b0  110011ef       add w15, w15, #0x4 (4)
0x2a456923e74  19b4  510006d6       sub w22, w22, #0x1 (1)
0x2a456923e78  19b8  35fffaf6       cbnz w22, #-0xa4 (addr 0x2a456923dd4)
0x2a456923e7c  19bc  3d811ff1       str q17, [sp, #1136]
0x2a456923e80  19c0  fd0243f2       str d18, [sp, #1152]
0x2a456923e84  19c4  fd0237f4       str d20, [sp, #1128]
0x2a456923e88  19c8  f94193e6       ldr x6, [sp, #800]
0x2a456923e8c  19cc  3dc0dff1       ldr q17, [sp, #880]
0x2a456923e90  19d0  3dc0e3f2       ldr q18, [sp, #896]
0x2a456923e94  19d4  fd022be7       str d7, [sp, #1104]
0x2a456923e98  19d8  3dc093e7       ldr q7, [sp, #576]
0x2a456923e9c  19dc  3dc0e7f4       ldr q20, [sp, #912]
0x2a456923ea0  19e0  3dc03feb       ldr q11, [sp, #240]
0x2a456923ea4  19e4  3dc043ea       ldr q10, [sp, #256]
0x2a456923ea8  19e8  3dc053e9       ldr q9, [sp, #320]
0x2a456923eac  19ec  3dc057e8       ldr q8, [sp, #336]
0x2a456923eb0  19f0  f9424fe8       ldr x8, [sp, #1176]
0x2a456923eb4  19f4  1100050f       add w15, w8, #0x1 (1)
0x2a456923eb8  19f8  f9424bf6       ldr x22, [sp, #1168]
0x2a456923ebc  19fc  6b16011f       cmp w8, w22
0x2a456923ec0  1a00  54ff8b01       b.ne #-0xea0 (addr 0x2a456923020)
0x2a456923ec4  1a04  fd422be7       ldr d7, [sp, #1104]
0x2a456923ec8  1a08  f94253e6       ldr x6, [sp, #1184]
0x2a456923ecc  1a0c  bc266b27       str s7, [x25, x6]
0x2a456923ed0  1a10  f94293e6       ldr x6, [sp, #1312]
0x2a456923ed4  1a14  910090c8       add x8, x6, #0x24 (36)
0x2a456923ed8  1a18  fd422fe6       ldr d6, [sp, #1112]
0x2a456923edc  1a1c  bc286b26       str s6, [x25, x8]
0x2a456923ee0  1a20  fd4233e5       ldr d5, [sp, #1120]
0x2a456923ee4  1a24  f94257e8       ldr x8, [sp, #1192]
0x2a456923ee8  1a28  bc286b25       str s5, [x25, x8]
0x2a456923eec  1a2c  3dc11fe2       ldr q2, [sp, #1136]
0x2a456923ef0  1a30  f9425be8       ldr x8, [sp, #1200]
0x2a456923ef4  1a34  3ca86b22       str q2, [x25, x8]
0x2a456923ef8  1a38  14000002       b #+0x8 (addr 0x2a456923f00)
0x2a456923efc  1a3c  f94293e6       ldr x6, [sp, #1312]
0x2a456923f00  1a40  110040c2       add w2, w6, #0x10 (16)
0x2a456923f04  1a44  f9025be2       str x2, [sp, #1200]
0x2a456923f08  1a48  f9429be7       ldr x7, [sp, #1328]
0x2a456923f0c  1a4c  f9426be0       ldr x0, [sp, #1232]
0x2a456923f10  1a50  97fc05e4       bl #-0xfe870 (addr 0x2a4568256a0)
0x2a456923f14  1a54  f94293e4       ldr x4, [sp, #1312]
0x2a456923f18  1a58  1100c083       add w3, w4, #0x30 (48)
0x2a456923f1c  1a5c  f9429be7       ldr x7, [sp, #1328]
0x2a456923f20  1a60  f9426be0       ldr x0, [sp, #1232]
0x2a456923f24  1a64  f94267e2       ldr x2, [sp, #1224]
0x2a456923f28  1a68  fd4263e0       ldr d0, [sp, #1216]
0x2a456923f2c  1a6c  fd425fe1       ldr d1, [sp, #1208]
0x2a456923f30  1a70  f9425be5       ldr x5, [sp, #1200]
0x2a456923f34  1a74  97fc05dc       bl #-0xfe890 (addr 0x2a4568256a4)
0x2a456923f38  1a78  f9428bf3       ldr x19, [sp, #1296]
0x2a456923f3c  1a7c  f9426fe6       ldr x6, [sp, #1240]
0x2a456923f40  1a80  6b1300df       cmp w6, w19
0x2a456923f44  1a84  54000609       b.ls #+0xc0 (addr 0x2a456924004)
0x2a456923f48  1a88  f9427fe8       ldr x8, [sp, #1272]
0x2a456923f4c  1a8c  f94273e9       ldr x9, [sp, #1248]
0x2a456923f50  1a90  0b08012a       add w10, w9, w8
0x2a456923f54  1a94  f94293eb       ldr x11, [sp, #1312]
0x2a456923f58  1a98  9101016c       add x12, x11, #0x40 (64)
0x2a456923f5c  1a9c  f94287ed       ldr x13, [sp, #1288]
0x2a456923f60  1aa0  bc6c69a2       ldr s2, [x13, x12]
0x2a456923f64  1aa4  bc2a69a2       str s2, [x13, x10]
0x2a456923f68  1aa8  f94277ea       ldr x10, [sp, #1256]
0x2a456923f6c  1aac  0b08014c       add w12, w10, w8
0x2a456923f70  1ab0  9101116e       add x14, x11, #0x44 (68)
0x2a456923f74  1ab4  bc6e69a2       ldr s2, [x13, x14]
0x2a456923f78  1ab8  bc2c69a2       str s2, [x13, x12]
0x2a456923f7c  1abc  f9427bec       ldr x12, [sp, #1264]
0x2a456923f80  1ac0  0b08018e       add w14, w12, w8
0x2a456923f84  1ac4  9101216f       add x15, x11, #0x48 (72)
0x2a456923f88  1ac8  bc6f69a2       ldr s2, [x13, x15]
0x2a456923f8c  1acc  bc2e69a2       str s2, [x13, x14]
0x2a456923f90  1ad0  f94283ee       ldr x14, [sp, #1280]
0x2a456923f94  1ad4  0b0801c8       add w8, w14, w8
0x2a456923f98  1ad8  9101316f       add x15, x11, #0x4c (76)
0x2a456923f9c  1adc  bc6f69a2       ldr s2, [x13, x15]
0x2a456923fa0  1ae0  bc2869a2       str s2, [x13, x8]
0x2a456923fa4  1ae4  aa0903f5       mov x21, x9
0x2a456923fa8  1ae8  aa0d03e9       mov x9, x13
0x2a456923fac  1aec  aa0c03ef       mov x15, x12
0x2a456923fb0  1af0  aa0603ed       mov x13, x6
0x2a456923fb4  1af4  1e2e1008       fmov s8, #0x70 (1.0000)
0x2a456923fb8  1af8  fd421be4       ldr d4, [sp, #1072]
0x2a456923fbc  1afc  fd4217e2       ldr d2, [sp, #1064]
0x2a456923fc0  1b00  3dc0e7e7       ldr q7, [sp, #912]
0x2a456923fc4  1b04  3dc0e3e5       ldr q5, [sp, #896]
0x2a456923fc8  1b08  3dc0dfe3       ldr q3, [sp, #880]
0x2a456923fcc  1b0c  d2800042       movz x2, #0x2
0x2a456923fd0  1b10  d2800020       movz x0, #0x1
0x2a456923fd4  1b14  d2800001       movz x1, #0x0
0x2a456923fd8  1b18  f94023e6       ldr x6, [sp, #64]
0x2a456923fdc  1b1c  f9400ffc       ldr x28, [sp, #24]
0x2a456923fe0  1b20  f9400bfb       ldr cp, [sp, #16]
0x2a456923fe4  1b24  f94007f9       ldr x25, [sp, #8]
0x2a456923fe8  1b28  f941fbec       ldr x12, [sp, #1008]
0x2a456923fec  1b2c  f941fff8       ldr x24, [sp, #1016]
0x2a456923ff0  1b30  f94203eb       ldr x11, [sp, #1024]
0x2a456923ff4  1b34  f94013f4       ldr x20, [sp, #32]
0x2a456923ff8  1b38  f94247f7       ldr x23, [sp, #1160]
0x2a456923ffc  1b3c  f94017f6       ldr x22, [sp, #40]
0x2a456924000  1b40  14000019       b #+0x64 (addr 0x2a456924064)
0x2a456924004  1b44  f94287e9       ldr x9, [sp, #1288]
0x2a456924008  1b48  f94283ee       ldr x14, [sp, #1280]
0x2a45692400c  1b4c  f9427bef       ldr x15, [sp, #1264]
0x2a456924010  1b50  f94273f5       ldr x21, [sp, #1248]
0x2a456924014  1b54  aa0603ed       mov x13, x6
0x2a456924018  1b58  1e2e1008       fmov s8, #0x70 (1.0000)
0x2a45692401c  1b5c  fd421be4       ldr d4, [sp, #1072]
0x2a456924020  1b60  fd4217e2       ldr d2, [sp, #1064]
0x2a456924024  1b64  3dc0e7e7       ldr q7, [sp, #912]
0x2a456924028  1b68  3dc0e3e5       ldr q5, [sp, #896]
0x2a45692402c  1b6c  3dc0dfe3       ldr q3, [sp, #880]
0x2a456924030  1b70  d2800042       movz x2, #0x2
0x2a456924034  1b74  d2800020       movz x0, #0x1
0x2a456924038  1b78  d2800001       movz x1, #0x0
0x2a45692403c  1b7c  f94023e6       ldr x6, [sp, #64]
0x2a456924040  1b80  f9400ffc       ldr x28, [sp, #24]
0x2a456924044  1b84  f9400bfb       ldr cp, [sp, #16]
0x2a456924048  1b88  f94007f9       ldr x25, [sp, #8]
0x2a45692404c  1b8c  f941fbec       ldr x12, [sp, #1008]
0x2a456924050  1b90  f941fff8       ldr x24, [sp, #1016]
0x2a456924054  1b94  f94203eb       ldr x11, [sp, #1024]
0x2a456924058  1b98  f94013f4       ldr x20, [sp, #32]
0x2a45692405c  1b9c  f94247f7       ldr x23, [sp, #1160]
0x2a456924060  1ba0  f94017f6       ldr x22, [sp, #40]
0x2a456924064  1ba4  11000673       add w19, w19, #0x1 (1)
0x2a456924068  1ba8  f9428fe8       ldr x8, [sp, #1304]
0x2a45692406c  1bac  6b08027f       cmp w19, w8
0x2a456924070  1bb0  54ff5d21       b.ne #-0x145c (addr 0x2a456922c14)
0x2a456924074  1bb4  f94293e6       ldr x6, [sp, #1312]
0x2a456924078  1bb8  110800c6       add w6, w6, #0x200 (512)
0x2a45692407c  1bbc  f94297e8       ldr x8, [sp, #1320]
0x2a456924080  1bc0  b9000106       str w6, [x8]
0x2a456924084  1bc4  17fffab9       b #-0x151c (addr 0x2a456922b68)
0x2a456924088  1bc8  97fc06d2       bl #-0xfe4b8 (addr 0x2a456825bd0)
0x2a45692408c  1bcc  f94287e6       ldr x6, [sp, #1288]
0x2a456924090  1bd0  f9429be7       ldr x7, [sp, #1328]
0x2a456924094  1bd4  f9424fe0       ldr x0, [sp, #1176]
0x2a456924098  1bd8  17fff915       b #-0x1bac (addr 0x2a4569224ec)
0x2a45692409c  1bdc  1e6620c0       fcmp d6, d6
0x2a4569240a0  1be0  54000080       b.eq #+0x10 (addr 0x2a4569240b0)
0x2a4569240a4  1be4  d2800001       movz x1, #0x0
0x2a4569240a8  1be8  aa0103ec       mov x12, x1
0x2a4569240ac  1bec  17fff945       b #-0x1aec (addr 0x2a4569225c0)
0x2a4569240b0  1bf0  1e2020a8       fcmp s5, #0.0
0x2a4569240b4  1bf4  54000063       b.lo #+0xc (addr 0x2a4569240c0)
0x2a4569240b8  1bf8  9280000c       movn x12, #0x0
0x2a4569240bc  1bfc  17fff941       b #-0x1afc (addr 0x2a4569225c0)
0x2a4569240c0  1c00  d280000c       movz x12, #0x0
0x2a4569240c4  1c04  17fff93f       b #-0x1b04 (addr 0x2a4569225c0)
0x2a4569240c8  1c08  1e6720e0       fcmp d7, d7
0x2a4569240cc  1c0c  54000060       b.eq #+0xc (addr 0x2a4569240d8)
0x2a4569240d0  1c10  d280000c       movz x12, #0x0
0x2a4569240d4  1c14  17fff943       b #-0x1af4 (addr 0x2a4569225e0)
0x2a4569240d8  1c18  1e2020c8       fcmp s6, #0.0
0x2a4569240dc  1c1c  54ffffa3       b.lo #-0xc (addr 0x2a4569240d0)
0x2a4569240e0  1c20  9280000c       movn x12, #0x0
0x2a4569240e4  1c24  17fff93f       b #-0x1b04 (addr 0x2a4569225e0)
0x2a4569240e8  1c28  fd024be3       str d3, [sp, #1168]
0x2a4569240ec  1c2c  f90283f5       str x21, [sp, #1280]
0x2a4569240f0  1c30  f90277f4       str x20, [sp, #1256]
0x2a4569240f4  1c34  97fc06b7       bl #-0xfe524 (addr 0x2a456825bd0)
0x2a4569240f8  1c38  f94287e9       ldr x9, [sp, #1288]
0x2a4569240fc  1c3c  f94023e6       ldr x6, [sp, #64]
0x2a456924100  1c40  f941ffef       ldr x15, [sp, #1016]
0x2a456924104  1c44  f94017ed       ldr x13, [sp, #40]
0x2a456924108  1c48  f9428fe8       ldr x8, [sp, #1304]
0x2a45692410c  1c4c  f94257ec       ldr x12, [sp, #1192]
0x2a456924110  1c50  f9424fea       ldr x10, [sp, #1176]
0x2a456924114  1c54  f94277f4       ldr x20, [sp, #1256]
0x2a456924118  1c58  fd424be3       ldr d3, [sp, #1168]
0x2a45692411c  1c5c  f9426fe0       ldr x0, [sp, #1240]
0x2a456924120  1c60  f9427bf3       ldr x19, [sp, #1264]
0x2a456924124  1c64  f9427fee       ldr x14, [sp, #1272]
0x2a456924128  1c68  f94283f5       ldr x21, [sp, #1280]
0x2a45692412c  1c6c  17fff971       b #-0x1a3c (addr 0x2a4569226f0)
0x2a456924130  1c70  fd024be3       str d3, [sp, #1168]
0x2a456924134  1c74  f9027bec       str x12, [sp, #1264]
0x2a456924138  1c78  f90283e2       str x2, [sp, #1280]
0x2a45692413c  1c7c  97fc06a5       bl #-0xfe56c (addr 0x2a456825bd0)
0x2a456924140  1c80  f94287e9       ldr x9, [sp, #1288]
0x2a456924144  1c84  f94023e6       ldr x6, [sp, #64]
0x2a456924148  1c88  f941fbf4       ldr x20, [sp, #1008]
0x2a45692414c  1c8c  f94247ee       ldr x14, [sp, #1160]
0x2a456924150  1c90  f9428fe8       ldr x8, [sp, #1304]
0x2a456924154  1c94  f94257f6       ldr x22, [sp, #1192]
0x2a456924158  1c98  f9424fea       ldr x10, [sp, #1176]
0x2a45692415c  1c9c  f94283e2       ldr x2, [sp, #1280]
0x2a456924160  1ca0  fd424be3       ldr d3, [sp, #1168]
0x2a456924164  1ca4  f9427feb       ldr x11, [sp, #1272]
0x2a456924168  1ca8  f94277e0       ldr x0, [sp, #1256]
0x2a45692416c  1cac  f94273f5       ldr x21, [sp, #1248]
0x2a456924170  1cb0  f9426ff3       ldr x19, [sp, #1240]
0x2a456924174  1cb4  f9427bec       ldr x12, [sp, #1264]
0x2a456924178  1cb8  17fff9a3       b #-0x1974 (addr 0x2a456922804)
0x2a45692417c  1cbc  fd024be3       str d3, [sp, #1168]
0x2a456924180  1cc0  f9025bf5       str x21, [sp, #1200]
0x2a456924184  1cc4  f90283e2       str x2, [sp, #1280]
0x2a456924188  1cc8  97fc0692       bl #-0xfe5b8 (addr 0x2a456825bd0)
0x2a45692418c  1ccc  f94287e9       ldr x9, [sp, #1288]
0x2a456924190  1cd0  f94023e6       ldr x6, [sp, #64]
0x2a456924194  1cd4  f94007ef       ldr x15, [sp, #8]
0x2a456924198  1cd8  f94013ec       ldr x12, [sp, #32]
0x2a45692419c  1cdc  f9427feb       ldr x11, [sp, #1272]
0x2a4569241a0  1ce0  f94257f6       ldr x22, [sp, #1192]
0x2a4569241a4  1ce4  f9424fea       ldr x10, [sp, #1176]
0x2a4569241a8  1ce8  f94283e2       ldr x2, [sp, #1280]
0x2a4569241ac  1cec  fd424be3       ldr d3, [sp, #1168]
0x2a4569241b0  1cf0  f9427be0       ldr x0, [sp, #1264]
0x2a4569241b4  1cf4  f9426ff3       ldr x19, [sp, #1240]
0x2a4569241b8  1cf8  f94273ed       ldr x13, [sp, #1248]
0x2a4569241bc  1cfc  f9425bf5       ldr x21, [sp, #1200]
0x2a4569241c0  1d00  17fff9d1       b #-0x18bc (addr 0x2a456922904)
0x2a4569241c4  1d04  fd024be3       str d3, [sp, #1168]
0x2a4569241c8  1d08  f90253ea       str x10, [sp, #1184]
0x2a4569241cc  1d0c  f90283e2       str x2, [sp, #1280]
0x2a4569241d0  1d10  97fc0680       bl #-0xfe600 (addr 0x2a456825bd0)
0x2a4569241d4  1d14  f94287e9       ldr x9, [sp, #1288]
0x2a4569241d8  1d18  f94023e6       ldr x6, [sp, #64]
0x2a4569241dc  1d1c  f9400bf3       ldr x19, [sp, #16]
0x2a4569241e0  1d20  f94203ed       ldr x13, [sp, #1024]
0x2a4569241e4  1d24  f94283e2       ldr x2, [sp, #1280]
0x2a4569241e8  1d28  f9427feb       ldr x11, [sp, #1272]
0x2a4569241ec  1d2c  fd424be3       ldr d3, [sp, #1168]
0x2a4569241f0  1d30  f9427be8       ldr x8, [sp, #1264]
0x2a4569241f4  1d34  f94277e0       ldr x0, [sp, #1256]
0x2a4569241f8  1d38  f94257f5       ldr x21, [sp, #1192]
0x2a4569241fc  1d3c  f94273f4       ldr x20, [sp, #1248]
0x2a456924200  1d40  f9426bee       ldr x14, [sp, #1232]
0x2a456924204  1d44  f94253ea       ldr x10, [sp, #1184]
0x2a456924208  1d48  17fffa03       b #-0x17f4 (addr 0x2a456922a14)
0x2a45692420c  1d4c  f9028bf3       str x19, [sp, #1296]
0x2a456924210  1d50  97fc0670       bl #-0xfe640 (addr 0x2a456825bd0)
0x2a456924214  1d54  f9428bf3       ldr x19, [sp, #1296]
0x2a456924218  1d58  f94287e9       ldr x9, [sp, #1288]
0x2a45692421c  1d5c  f94283ee       ldr x14, [sp, #1280]
0x2a456924220  1d60  f9427bef       ldr x15, [sp, #1264]
0x2a456924224  1d64  f94273f5       ldr x21, [sp, #1248]
0x2a456924228  1d68  f9426fed       ldr x13, [sp, #1240]
0x2a45692422c  1d6c  1e2e1008       fmov s8, #0x70 (1.0000)
0x2a456924230  1d70  fd421be4       ldr d4, [sp, #1072]
0x2a456924234  1d74  fd4217e2       ldr d2, [sp, #1064]
0x2a456924238  1d78  3dc0e7e7       ldr q7, [sp, #912]
0x2a45692423c  1d7c  3dc0e3e5       ldr q5, [sp, #896]
0x2a456924240  1d80  3dc0dfe3       ldr q3, [sp, #880]
0x2a456924244  1d84  d2800042       movz x2, #0x2
0x2a456924248  1d88  d2800020       movz x0, #0x1
0x2a45692424c  1d8c  d2800001       movz x1, #0x0
0x2a456924250  1d90  f94023e6       ldr x6, [sp, #64]
0x2a456924254  1d94  f9400ffc       ldr x28, [sp, #24]
0x2a456924258  1d98  f9400bfb       ldr cp, [sp, #16]
0x2a45692425c  1d9c  f94007f9       ldr x25, [sp, #8]
0x2a456924260  1da0  f941fbec       ldr x12, [sp, #1008]
0x2a456924264  1da4  f941fff8       ldr x24, [sp, #1016]
0x2a456924268  1da8  f94203eb       ldr x11, [sp, #1024]
0x2a45692426c  1dac  f94013f4       ldr x20, [sp, #32]
0x2a456924270  1db0  f94247f7       ldr x23, [sp, #1160]
0x2a456924274  1db4  f94017f6       ldr x22, [sp, #40]
0x2a456924278  1db8  17fffa6a       b #-0x1658 (addr 0x2a456922c20)
0x2a45692427c  1dbc  1e6520a0       fcmp d5, d5
0x2a456924280  1dc0  54000060       b.eq #+0xc (addr 0x2a45692428c)
0x2a456924284  1dc4  d2800008       movz x8, #0x0
0x2a456924288  1dc8  17fffac4       b #-0x14f0 (addr 0x2a456922d98)
0x2a45692428c  1dcc  1e202088       fcmp s4, #0.0
0x2a456924290  1dd0  54ffffa3       b.lo #-0xc (addr 0x2a456924284)
0x2a456924294  1dd4  92800008       movn x8, #0x0
0x2a456924298  1dd8  17fffac0       b #-0x1500 (addr 0x2a456922d98)
0x2a45692429c  1ddc  1e6620c0       fcmp d6, d6
0x2a4569242a0  1de0  54000060       b.eq #+0xc (addr 0x2a4569242ac)
0x2a4569242a4  1de4  d280000b       movz x11, #0x0
0x2a4569242a8  1de8  17fffadc       b #-0x1490 (addr 0x2a456922e18)
0x2a4569242ac  1dec  1e202068       fcmp s3, #0.0
0x2a4569242b0  1df0  54ffffa3       b.lo #-0xc (addr 0x2a4569242a4)
0x2a4569242b4  1df4  9280000b       movn x11, #0x0
0x2a4569242b8  1df8  17fffad8       b #-0x14a0 (addr 0x2a456922e18)
0x2a4569242bc  1dfc  f9016fe1       str x1, [sp, #728]
0x2a4569242c0  1e00  f9016be2       str x2, [sp, #720]
0x2a4569242c4  1e04  f90167e3       str x3, [sp, #712]
0x2a4569242c8  1e08  f90163e5       str x5, [sp, #704]
0x2a4569242cc  1e0c  f9015fe7       str x7, [sp, #696]
0x2a4569242d0  1e10  f90153f4       str x20, [sp, #672]
0x2a4569242d4  1e14  3d8097e8       str q8, [sp, #592]
0x2a4569242d8  1e18  3d8093e9       str q9, [sp, #576]
0x2a4569242dc  1e1c  3d808fea       str q10, [sp, #560]
0x2a4569242e0  1e20  3d808beb       str q11, [sp, #544]
0x2a4569242e4  1e24  3d8087e1       str q1, [sp, #528]
0x2a4569242e8  1e28  3d8083e0       str q0, [sp, #512]
0x2a4569242ec  1e2c  3d807ffc       str q28, [sp, #496]
0x2a4569242f0  1e30  3d807bfb       str q27, [sp, #480]
0x2a4569242f4  1e34  3d8077fa       str q26, [sp, #464]
0x2a4569242f8  1e38  3d8073f9       str q25, [sp, #448]
0x2a4569242fc  1e3c  3d806ff8       str q24, [sp, #432]
0x2a456924300  1e40  3d806bf7       str q23, [sp, #416]
0x2a456924304  1e44  3d8067f6       str q22, [sp, #400]
0x2a456924308  1e48  3d8063f5       str q21, [sp, #384]
0x2a45692430c  1e4c  3d805ff4       str q20, [sp, #368]
0x2a456924310  1e50  3d805bf3       str q19, [sp, #352]
0x2a456924314  1e54  3d8057f2       str q18, [sp, #336]
0x2a456924318  1e58  3d8053f1       str q17, [sp, #320]
0x2a45692431c  1e5c  3d804ff0       str q16, [sp, #304]
0x2a456924320  1e60  3d804bee       str q14, [sp, #288]
0x2a456924324  1e64  3d8047ed       str q13, [sp, #272]
0x2a456924328  1e68  3d8043ec       str q12, [sp, #256]
0x2a45692432c  1e6c  97fc0629       bl #-0xfe75c (addr 0x2a456825bd0)
0x2a456924330  1e70  f94287f5       ldr x21, [sp, #1288]
0x2a456924334  1e74  f9424fe9       ldr x9, [sp, #1176]
0x2a456924338  1e78  f9416fe1       ldr x1, [sp, #728]
0x2a45692433c  1e7c  f9416be2       ldr x2, [sp, #720]
0x2a456924340  1e80  f94167e3       ldr x3, [sp, #712]
0x2a456924344  1e84  f94163e5       ldr x5, [sp, #704]
0x2a456924348  1e88  f9415fe7       ldr x7, [sp, #696]
0x2a45692434c  1e8c  f94153f4       ldr x20, [sp, #672]
0x2a456924350  1e90  f9414ff7       ldr x23, [sp, #664]
0x2a456924354  1e94  f94147fb       ldr cp, [sp, #648]
0x2a456924358  1e98  f94143fc       ldr x28, [sp, #640]
0x2a45692435c  1e9c  f9413ff9       ldr x25, [sp, #632]
0x2a456924360  1ea0  f94137f8       ldr x24, [sp, #616]
0x2a456924364  1ea4  d2800004       movz x4, #0x0
0x2a456924368  1ea8  3dc097e8       ldr q8, [sp, #592]
0x2a45692436c  1eac  3dc093e9       ldr q9, [sp, #576]
0x2a456924370  1eb0  3dc08fea       ldr q10, [sp, #560]
0x2a456924374  1eb4  3dc08beb       ldr q11, [sp, #544]
0x2a456924378  1eb8  3dc087e1       ldr q1, [sp, #528]
0x2a45692437c  1ebc  3dc083e0       ldr q0, [sp, #512]
0x2a456924380  1ec0  3dc07ffc       ldr q28, [sp, #496]
0x2a456924384  1ec4  3dc07bfb       ldr q27, [sp, #480]
0x2a456924388  1ec8  3dc077fa       ldr q26, [sp, #464]
0x2a45692438c  1ecc  3dc073f9       ldr q25, [sp, #448]
0x2a456924390  1ed0  3dc06ff8       ldr q24, [sp, #432]
0x2a456924394  1ed4  3dc06bf7       ldr q23, [sp, #416]
0x2a456924398  1ed8  3dc067f6       ldr q22, [sp, #400]
0x2a45692439c  1edc  3dc063f5       ldr q21, [sp, #384]
0x2a4569243a0  1ee0  3dc05ff4       ldr q20, [sp, #368]
0x2a4569243a4  1ee4  3dc05bf3       ldr q19, [sp, #352]
0x2a4569243a8  1ee8  3dc057f2       ldr q18, [sp, #336]
0x2a4569243ac  1eec  3dc053f1       ldr q17, [sp, #320]
0x2a4569243b0  1ef0  3dc04ff0       ldr q16, [sp, #304]
0x2a4569243b4  1ef4  3dc04bee       ldr q14, [sp, #288]
0x2a4569243b8  1ef8  3dc047ed       ldr q13, [sp, #272]
0x2a4569243bc  1efc  3dc043ec       ldr q12, [sp, #256]
0x2a4569243c0  1f00  f94043ed       ldr x13, [sp, #128]
0x2a4569243c4  1f04  f9403ff3       ldr x19, [sp, #120]
0x2a4569243c8  1f08  f9403bee       ldr x14, [sp, #112]
0x2a4569243cc  1f0c  f94037ef       ldr x15, [sp, #104]
0x2a4569243d0  1f10  f94033f6       ldr x22, [sp, #96]
0x2a4569243d4  1f14  f9402fe8       ldr x8, [sp, #88]
0x2a4569243d8  1f18  f9402bec       ldr x12, [sp, #80]
0x2a4569243dc  1f1c  f94027e6       ldr x6, [sp, #72]
0x2a4569243e0  1f20  17fffb38       b #-0x1320 (addr 0x2a4569230c0)
0x2a4569243e4  1f24  f9016fe1       str x1, [sp, #728]
0x2a4569243e8  1f28  f9016be2       str x2, [sp, #720]
0x2a4569243ec  1f2c  f90167e3       str x3, [sp, #712]
0x2a4569243f0  1f30  f90163e5       str x5, [sp, #704]
0x2a4569243f4  1f34  f9015fe7       str x7, [sp, #696]
0x2a4569243f8  1f38  f90153f4       str x20, [sp, #672]
0x2a4569243fc  1f3c  f9004ff6       str x22, [sp, #152]
0x2a456924400  1f40  3d805ff5       str q21, [sp, #368]
0x2a456924404  1f44  3d805bf6       str q22, [sp, #352]
0x2a456924408  1f48  3d8073f9       str q25, [sp, #448]
0x2a45692440c  1f4c  3d806ff8       str q24, [sp, #432]
0x2a456924410  1f50  3d806bf7       str q23, [sp, #416]
0x2a456924414  1f54  3d8067fa       str q26, [sp, #400]
0x2a456924418  1f58  3d8063fb       str q27, [sp, #384]
0x2a45692441c  1f5c  3d807bfc       str q28, [sp, #480]
0x2a456924420  1f60  3d8077e0       str q0, [sp, #464]
0x2a456924424  1f64  3d808fe1       str q1, [sp, #560]
0x2a456924428  1f68  3d808be2       str q2, [sp, #544]
0x2a45692442c  1f6c  3d8087e3       str q3, [sp, #528]
0x2a456924430  1f70  3d8083e4       str q4, [sp, #512]
0x2a456924434  1f74  3d807fe5       str q5, [sp, #496]
0x2a456924438  1f78  3d8097e6       str q6, [sp, #592]
0x2a45692443c  1f7c  3d8093e7       str q7, [sp, #576]
0x2a456924440  1f80  97fc05e4       bl #-0xfe870 (addr 0x2a456825bd0)
0x2a456924444  1f84  f94287f9       ldr x25, [sp, #1288]
0x2a456924448  1f88  f94227e8       ldr x8, [sp, #1096]
0x2a45692444c  1f8c  f9421fe9       ldr x9, [sp, #1080]
0x2a456924450  1f90  f94197ec       ldr x12, [sp, #808]
0x2a456924454  1f94  f94193e6       ldr x6, [sp, #800]
0x2a456924458  1f98  f9418fe4       ldr x4, [sp, #792]
0x2a45692445c  1f9c  f9418bfc       ldr x28, [sp, #784]
0x2a456924460  1fa0  f94187ea       ldr x10, [sp, #776]
0x2a456924464  1fa4  f94183f5       ldr x21, [sp, #768]
0x2a456924468  1fa8  f9417fe0       ldr x0, [sp, #760]
0x2a45692446c  1fac  f9417bf7       ldr x23, [sp, #752]
0x2a456924470  1fb0  f94177f3       ldr x19, [sp, #744]
0x2a456924474  1fb4  f94173ee       ldr x14, [sp, #736]
0x2a456924478  1fb8  f9416fe1       ldr x1, [sp, #728]
0x2a45692447c  1fbc  f9416be2       ldr x2, [sp, #720]
0x2a456924480  1fc0  f94167e3       ldr x3, [sp, #712]
0x2a456924484  1fc4  f94163e5       ldr x5, [sp, #704]
0x2a456924488  1fc8  f9415fe7       ldr x7, [sp, #696]
0x2a45692448c  1fcc  f9415bed       ldr x13, [sp, #688]
0x2a456924490  1fd0  f94157eb       ldr x11, [sp, #680]
0x2a456924494  1fd4  f94153f4       ldr x20, [sp, #672]
0x2a456924498  1fd8  f9404ff6       ldr x22, [sp, #152]
0x2a45692449c  1fdc  3dc05ff5       ldr q21, [sp, #368]
0x2a4569244a0  1fe0  3dc05bf6       ldr q22, [sp, #352]
0x2a4569244a4  1fe4  3dc073f9       ldr q25, [sp, #448]
0x2a4569244a8  1fe8  3dc06ff8       ldr q24, [sp, #432]
0x2a4569244ac  1fec  3dc06bf7       ldr q23, [sp, #416]
0x2a4569244b0  1ff0  3dc067fa       ldr q26, [sp, #400]
0x2a4569244b4  1ff4  3dc063fb       ldr q27, [sp, #384]
0x2a4569244b8  1ff8  3dc07bfc       ldr q28, [sp, #480]
0x2a4569244bc  1ffc  3dc077e0       ldr q0, [sp, #464]
0x2a4569244c0  2000  3dc08fe1       ldr q1, [sp, #560]
0x2a4569244c4  2004  3dc08be2       ldr q2, [sp, #544]
0x2a4569244c8  2008  3dc087e3       ldr q3, [sp, #528]
0x2a4569244cc  200c  3dc083e4       ldr q4, [sp, #512]
0x2a4569244d0  2010  3dc07fe5       ldr q5, [sp, #496]
0x2a4569244d4  2014  3dc097e6       ldr q6, [sp, #592]
0x2a4569244d8  2018  3dc093e7       ldr q7, [sp, #576]
0x2a4569244dc  201c  f9404bfb       ldr cp, [sp, #144]
0x2a4569244e0  2020  f94047f8       ldr x24, [sp, #136]
0x2a4569244e4  2024  17fffbb9       b #-0x111c (addr 0x2a4569233c8)
0x2a4569244e8  2028  3d808fe1       str q1, [sp, #560]
0x2a4569244ec  202c  3d807bfc       str q28, [sp, #480]
0x2a4569244f0  2030  3d8077e0       str q0, [sp, #464]
0x2a4569244f4  2034  3d8073f9       str q25, [sp, #448]
0x2a4569244f8  2038  3d806ff8       str q24, [sp, #432]
0x2a4569244fc  203c  3d806bf7       str q23, [sp, #416]
0x2a456924500  2040  3d8067fa       str q26, [sp, #400]
0x2a456924504  2044  3d8063fb       str q27, [sp, #384]
0x2a456924508  2048  f90227f6       str x22, [sp, #1096]
0x2a45692450c  204c  f90223ef       str x15, [sp, #1088]
0x2a456924510  2050  f9020be8       str x8, [sp, #1040]
0x2a456924514  2054  f90207f8       str x24, [sp, #1032]
0x2a456924518  2058  f9021ffb       str cp, [sp, #1080]
0x2a45692451c  205c  3d811ff1       str q17, [sp, #1136]
0x2a456924520  2060  fd0243f2       str d18, [sp, #1152]
0x2a456924524  2064  fd0237f4       str d20, [sp, #1128]
0x2a456924528  2068  fd022be7       str d7, [sp, #1104]
0x2a45692452c  206c  f9016fe1       str x1, [sp, #728]
0x2a456924530  2070  f9016be2       str x2, [sp, #720]
0x2a456924534  2074  f90167e3       str x3, [sp, #712]
0x2a456924538  2078  f90163e5       str x5, [sp, #704]
0x2a45692453c  207c  f9015fe7       str x7, [sp, #696]
0x2a456924540  2080  f90153f4       str x20, [sp, #672]
0x2a456924544  2084  97fc05a3       bl #-0xfe974 (addr 0x2a456825bd0)
0x2a456924548  2088  f94287f9       ldr x25, [sp, #1288]
0x2a45692454c  208c  3dc08fe1       ldr q1, [sp, #560]
0x2a456924550  2090  3dc07bfc       ldr q28, [sp, #480]
0x2a456924554  2094  3dc077e0       ldr q0, [sp, #464]
0x2a456924558  2098  3dc073f9       ldr q25, [sp, #448]
0x2a45692455c  209c  3dc06ff8       ldr q24, [sp, #432]
0x2a456924560  20a0  3dc06bf7       ldr q23, [sp, #416]
0x2a456924564  20a4  3dc067fa       ldr q26, [sp, #400]
0x2a456924568  20a8  3dc063fb       ldr q27, [sp, #384]
0x2a45692456c  20ac  3dc05ff5       ldr q21, [sp, #368]
0x2a456924570  20b0  3dc05bf6       ldr q22, [sp, #352]
0x2a456924574  20b4  3dc04ff0       ldr q16, [sp, #304]
0x2a456924578  20b8  3dc04bf3       ldr q19, [sp, #288]
0x2a45692457c  20bc  3dc047ed       ldr q13, [sp, #272]
0x2a456924580  20c0  3dc03bec       ldr q12, [sp, #224]
0x2a456924584  20c4  3dc037ee       ldr q14, [sp, #208]
0x2a456924588  20c8  f94227f6       ldr x22, [sp, #1096]
0x2a45692458c  20cc  f94223ef       ldr x15, [sp, #1088]
0x2a456924590  20d0  f9420be8       ldr x8, [sp, #1040]
0x2a456924594  20d4  f94207f8       ldr x24, [sp, #1032]
0x2a456924598  20d8  f9421ffb       ldr cp, [sp, #1080]
0x2a45692459c  20dc  3dc11ff1       ldr q17, [sp, #1136]
0x2a4569245a0  20e0  fd4243f2       ldr d18, [sp, #1152]
0x2a4569245a4  20e4  fd4237f4       ldr d20, [sp, #1128]
0x2a4569245a8  20e8  fd422be7       ldr d7, [sp, #1104]
0x2a4569245ac  20ec  1e2e1006       fmov s6, #0x70 (1.0000)
0x2a4569245b0  20f0  fd421be5       ldr d5, [sp, #1072]
0x2a4569245b4  20f4  fd4217e4       ldr d4, [sp, #1064]
0x2a4569245b8  20f8  fd4213e3       ldr d3, [sp, #1056]
0x2a4569245bc  20fc  fd420fe2       ldr d2, [sp, #1048]
0x2a4569245c0  2100  f941b3e9       ldr x9, [sp, #864]
0x2a4569245c4  2104  f94197ec       ldr x12, [sp, #808]
0x2a4569245c8  2108  f9418fe4       ldr x4, [sp, #792]
0x2a4569245cc  210c  f9418bfc       ldr x28, [sp, #784]
0x2a4569245d0  2110  f94187ea       ldr x10, [sp, #776]
0x2a4569245d4  2114  f94183f5       ldr x21, [sp, #768]
0x2a4569245d8  2118  f9417fe0       ldr x0, [sp, #760]
0x2a4569245dc  211c  f9417bf7       ldr x23, [sp, #752]
0x2a4569245e0  2120  f94177f3       ldr x19, [sp, #744]
0x2a4569245e4  2124  f94173ee       ldr x14, [sp, #736]
0x2a4569245e8  2128  f9416fe1       ldr x1, [sp, #728]
0x2a4569245ec  212c  f9416be2       ldr x2, [sp, #720]
0x2a4569245f0  2130  f94167e3       ldr x3, [sp, #712]
0x2a4569245f4  2134  f94163e5       ldr x5, [sp, #704]
0x2a4569245f8  2138  f9415fe7       ldr x7, [sp, #696]
0x2a4569245fc  213c  f9415bed       ldr x13, [sp, #688]
0x2a456924600  2140  f94157eb       ldr x11, [sp, #680]
0x2a456924604  2144  f94153f4       ldr x20, [sp, #672]
0x2a456924608  2148  17fffdf8       b #-0x820 (addr 0x2a456923de8)
0x2a45692460c  214c  97fc04c1       bl #-0xfecfc (addr 0x2a456825910)
0x2a456924610  2150  d503201f       nop
0x2a456924614  2154  5800009f       constant pool begin (num_const = 4)
0x2a456924618  2158  d63f03e0       constant
0x2a45692461c  215c  d503201f       constant
0x2a456924620  2160  057baaf4       constant
0x2a456924624  2164  00000001       constant

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
       9b4         
       9bc         
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
       a28         
       a34         
       a40         
       a4c         
       a58         
       a64         
       a70         
       a7c         
       a88         
       a94         
       aa0         
       aac         
       ab8         
       ac4         
       ad4         
       ae4         
       c20         
       c28         
       f0c         
       f14         
       f1c         
       f2c         
       f60         
       f6c         
       f94         
       fa0         
       fac         
       fb8         
       fc4         
       fcc         
       fd4         
       fdc         
       fe8         
      1014         
      1020         
      1044         
      1050         
      105c         
      1068         
      1074         
      107c         
      1084         
      108c         
      1098         
      10c0         
      10cc         
      10f4         
      1104         
      1118         
      112c         
      1140         
      1148         
      1150         
      1158         
      1168         
      11a4         
      11b8         
      11e4         
      11f8         
      120c         
      1220         
      1234         
      1300         
      130c         
      1318         
      1380         
      13b0         
      13bc         
      13e4         
      13f0         
      13fc         
      1408         
      1414         
      141c         
      1424         
      142c         
      14b4         
      14e0         
      14ec         
      1514         
      1520         
      152c         
      1538         
      1544         
      154c         
      1554         
      155c         
      15e4         
      1618         
      1628         
      1658         
      166c         
      1680         
      1694         
      16a8         
      16b0         
      16b8         
      16c0         
      1754         
      1790         
      17a4         
      17d4         
      17e8         
      17fc         
      1810         
      1824         
      1928         
      1938         
      196c         
      1974         
      1a0c         
      1a1c         
      1a28         
      1a34         
      1aa0         
      1aa4         
      1ab4         
      1ab8         
      1ac8         
      1acc         
      1adc         
      1ae0         

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
       9b0      1778
       9bc      1785
       9c8      1799
       9d0      1808
       9d8      1817
       9e0      1826
       9e8      1835
       9f0      1843
       9f8      1852
       a00      1861
       a08      1870
       a10      1879
       a18      1888
       a20      1897
       a28      1905
       a34      1914
       a40      1923
       a4c      1932
       a58      1941
       a64      1950
       a70      1959
       a7c      1967
       a88      1976
       a94      1985
       aa0      1994
       aac      2003
       ab8      2012
       ac4      2021
       ad0      2029
       ae0      2038
       c20      2140
       c28      2153
       f0c      2449
       f14      2462
       f1c      2481
       f2c      2501
       f60      2550
       f6c      2571
       f94      2634
       fa0      2655
       fac      2676
       fb8      2697
       fc4      2718
       fcc      2727
       fd4      2738
       fdc      2755
       fe8      2773
      1014      2822
      1020      2843
      1044      2888
      1050      2909
      105c      2930
      1068      2951
      1074      2972
      107c      2981
      1084      2992
      108c      3009
      1098      3027
      10c0      3076
      10cc      3097
      10f4      3142
      1104      3163
      1114      3184
      1128      3205
      113c      3226
      1148      3235
      1150      3246
      1158      3263
      1168      3281
      11a0      3330
      11b4      3351
      11e0      3396
      11f4      3417
      1208      3438
      121c      3459
      1230      3480
      1300      3558
      130c      3571
      1318      3590
      1380      3674
      13b0      3726
      13bc      3747
      13e4      3815
      13f0      3836
      13fc      3857
      1408      3878
      1414      3899
      141c      3905
      1424      3913
      142c      3927
      14b4      4100
      14e0      4152
      14ec      4173
      1514      4223
      1520      4244
      152c      4265
      1538      4286
      1544      4307
      154c      4313
      1554      4321
      155c      4335
      15e4      4508
      1618      4560
      1628      4581
      1654      4631
      1668      4652
      167c      4673
      1690      4694
      16a4      4715
      16b0      4721
      16b8      4729
      16c0      4743
      1754      4916
      178c      4968
      17a0      4989
      17d0      5039
      17e4      5060
      17f8      5081
      180c      5102
      1820      5123
      1928      5214
      1938      5229
      196c      5280
      1974      5288
      1a04      5389
      1a18      5396
      1a20      5403
      1a2c      5410
      1a44      5426
      1a5c      5456
      1a9c      5476
      1aa4      5479
      1ab4      5489
      1ab8      5492
      1ac8      5502
      1acc      5505
      1adc      5515
      1ae0      5518
      1bc8         0
      1c28       420
      1c70       595
      1cbc       771
      1d04       943
      1d4c      1325
      1dfc      2077
      1f24      2440
      2028      5204
      214c      1539

Safepoints (stack slots = 170, entries = 1, byte size = 36)
0x2a45692267c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 66)
0x2a456922678  internal wasm call
0x2a456922750  internal wasm call
0x2a456922860  internal wasm call
0x2a456922960  internal wasm call
0x2a456922a80  internal wasm call
0x2a456922d34  external reference (0x1057baaf4)
0x2a456923f10  internal wasm call
0x2a456923f34  internal wasm call
0x2a456924088  wasm stub call  (0x2a456825bd0)
0x2a4569240f4  wasm stub call  (0x2a456825bd0)
0x2a45692413c  wasm stub call  (0x2a456825bd0)
0x2a456924188  wasm stub call  (0x2a456825bd0)
0x2a4569241d0  wasm stub call  (0x2a456825bd0)
0x2a456924210  wasm stub call  (0x2a456825bd0)
0x2a45692432c  wasm stub call  (0x2a456825bd0)
0x2a456924440  wasm stub call  (0x2a456825bd0)
0x2a456924544  wasm stub call  (0x2a456825bd0)
0x2a45692460c  wasm stub call  (0x2a456825910)
0x2a456924614  constant pool (size 20)
