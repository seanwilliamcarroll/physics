name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8608 = 8580 + 28 padding)
Instructions (size = 8544)
0x5b539d064c0     0  d2800110       movz x16, #0x8
0x5b539d064c4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x5b539d064c8     8  a9017bfd       stp fp, lr, [sp, #16]
0x5b539d064cc     c  910043fd       add fp, sp, #0x10 (16)
0x5b539d064d0    10  d114c3ff       sub sp, sp, #0x530 (1328)
0x5b539d064d4    14  f841f0e6       ldur x6, [x7, #31]
0x5b539d064d8    18  f8520348       ldur x8, [x26, #-224]
0x5b539d064dc    1c  f9024fe0       str x0, [sp, #1176]
0x5b539d064e0    20  f90287e6       str x6, [sp, #1288]
0x5b539d064e4    24  eb2863ff       cmp sp, x8
0x5b539d064e8    28  5400dcc9       b.ls #+0x1b98 (addr 0x5b539d08080)
0x5b539d064ec    2c  f842f0e8       ldur x8, [x7, #47]
0x5b539d064f0    30  b9400109       ldr w9, [x8]
0x5b539d064f4    34  51080124       sub w4, w9, #0x200 (512)
0x5b539d064f8    38  b9000104       str w4, [x8]
0x5b539d064fc    3c  2a0003e9       mov w9, w0
0x5b539d06500    40  910240ca       add x10, x6, #0x90 (144)
0x5b539d06504    44  fc696942       ldr d2, [x10, x9]
0x5b539d06508    48  5e0c0441       mov s1, v2.s[1]
0x5b539d0650c    4c  52a75010       movz w16, #0x3a800000
0x5b539d06510    50  1e270203       fmov s3, w16
0x5b539d06514    54  1e230824       fmul s4, s1, s3
0x5b539d06518    58  5e040440       mov s0, v2.s[0]
0x5b539d0651c    5c  1e230803       fmul s3, s0, s3
0x5b539d06520    60  9102812a       add x10, x9, #0xa0 (160)
0x5b539d06524    64  bc6a68c5       ldr s5, [x6, x10]
0x5b539d06528    68  1e2520a0       fcmp s5, s5
0x5b539d0652c    6c  1e251c65       fcsel s5, s3, s5, ne
0x5b539d06530    70  1e232060       fcmp s3, s3
0x5b539d06534    74  1e231ca3       fcsel s3, s5, s3, ne
0x5b539d06538    78  1e252060       fcmp s3, s5
0x5b539d0653c    7c  1e233ca3       fcsel s3, s5, s3, lo
0x5b539d06540    80  1e232060       fcmp s3, s3
0x5b539d06544    84  1e231c83       fcsel s3, s4, s3, ne
0x5b539d06548    88  1e242080       fcmp s4, s4
0x5b539d0654c    8c  1e241c64       fcsel s4, s3, s4, ne
0x5b539d06550    90  1e232080       fcmp s4, s3
0x5b539d06554    94  1e243c63       fcsel s3, s3, s4, lo
0x5b539d06558    98  52840010       movz w16, #0x2000
0x5b539d0655c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x5b539d06560    a0  1e270204       fmov s4, w16
0x5b539d06564    a4  1e240863       fmul s3, s3, s4
0x5b539d06568    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x5b539d0656c    ac  1e231883       fdiv s3, s4, s3
0x5b539d06570    b0  9102112b       add x11, x9, #0x84 (132)
0x5b539d06574    b4  bc2b68c3       str s3, [x6, x11]
0x5b539d06578    b8  4e040465       dup v5.4s, v3.s[0]
0x5b539d0657c    bc  6e25dc42       fmul v2.4s, v2.4s, v5.4s
0x5b539d06580    c0  4ea18842       frintp v2.4s, v2.4s
0x5b539d06584    c4  5e040445       mov s5, v2.s[0]
0x5b539d06588    c8  1e22c0a6       fcvt d6, s5
0x5b539d0658c    cc  1e65c0c7       frintz d7, d6
0x5b539d06590    d0  1e7900ec       fcvtzu w12, d7
0x5b539d06594    d4  1e630188       ucvtf d8, w12
0x5b539d06598    d8  f90297e8       str x8, [sp, #1320]
0x5b539d0659c    dc  f90293e4       str x4, [sp, #1312]
0x5b539d065a0    e0  f90023e9       str x9, [sp, #64]
0x5b539d065a4    e4  fd025fe1       str d1, [sp, #1208]
0x5b539d065a8    e8  fd0263e0       str d0, [sp, #1216]
0x5b539d065ac    ec  f9028bea       str x10, [sp, #1296]
0x5b539d065b0    f0  fd024be3       str d3, [sp, #1168]
0x5b539d065b4    f4  f9000feb       str x11, [sp, #24]
0x5b539d065b8    f8  1e6820e0       fcmp d7, d8
0x5b539d065bc    fc  5400d6c1       b.ne #+0x1ad8 (addr 0x5b539d08094)
0x5b539d065c0   100  4e040d85       dup v5.4s, w12
0x5b539d065c4   104  5e0c0446       mov s6, v2.s[1]
0x5b539d065c8   108  1e22c0c7       fcvt d7, s6
0x5b539d065cc   10c  1e65c0e8       frintz d8, d7
0x5b539d065d0   110  1e79010c       fcvtzu w12, d8
0x5b539d065d4   114  1e630189       ucvtf d9, w12
0x5b539d065d8   118  1e692100       fcmp d8, d9
0x5b539d065dc   11c  5400d721       b.ne #+0x1ae4 (addr 0x5b539d080c0)
0x5b539d065e0   120  4e0c1d85       mov v5.s[1], w12
0x5b539d065e4   124  4f000426       movi v6.4s, #0x1, lsl #0
0x5b539d065e8   128  6ea664a5       umax v5.4s, v5.4s, v6.4s
0x5b539d065ec   12c  6f00e407       movi v7.2d, #0x0
0x5b539d065f0   130  6ea0c848       fcmge v8.4s, v2.4s, #0.0
0x5b539d065f4   134  52a9f010       movz w16, #0x4f800000
0x5b539d065f8   138  4e040e09       dup v9.4s, w16
0x5b539d065fc   13c  6ea2e522       fcmgt v2.4s, v9.4s, v2.4s
0x5b539d06600   140  4e221d02       and v2.16b, v8.16b, v2.16b
0x5b539d06604   144  6e661ca2       bsl v2.16b, v5.16b, v6.16b
0x5b539d06608   148  910220cc       add x12, x6, #0x88 (136)
0x5b539d0660c   14c  8b09018c       add x12, x12, x9
0x5b539d06610   150  0d008582       st1 {v2.d}[0], [x12]
0x5b539d06614   154  9103312c       add x12, x9, #0xcc (204)
0x5b539d06618   158  b86c68cc       ldr w12, [x6, x12]
0x5b539d0661c   15c  9100e08d       add x13, x4, #0x38 (56)
0x5b539d06620   160  b82d68cc       str w12, [x6, x13]
0x5b539d06624   164  9103112c       add x12, x9, #0xc4 (196)
0x5b539d06628   168  f86c68cc       ldr x12, [x6, x12]
0x5b539d0662c   16c  9100c08d       add x13, x4, #0x30 (48)
0x5b539d06630   170  f82d68cc       str x12, [x6, x13]
0x5b539d06634   174  1101800c       add w12, w0, #0x60 (96)
0x5b539d06638   178  9100112d       add x13, x9, #0x4 (4)
0x5b539d0663c   17c  b86d68c2       ldr w2, [x6, x13]
0x5b539d06640   180  9100212e       add x14, x9, #0x8 (8)
0x5b539d06644   184  b86e68c3       ldr w3, [x6, x14]
0x5b539d06648   188  9100412f       add x15, x9, #0x10 (16)
0x5b539d0664c   18c  b86f68d3       ldr w19, [x6, x15]
0x5b539d06650   190  91005134       add x20, x9, #0x14 (20)
0x5b539d06654   194  b87468c5       ldr w5, [x6, x20]
0x5b539d06658   198  3d80e7e6       str q6, [sp, #912]
0x5b539d0665c   19c  3d800fe7       str q7, [sp, #48]
0x5b539d06660   1a0  f901ffed       str x13, [sp, #1016]
0x5b539d06664   1a4  f90017ee       str x14, [sp, #40]
0x5b539d06668   1a8  f901fbef       str x15, [sp, #1008]
0x5b539d0666c   1ac  f90247f4       str x20, [sp, #1160]
0x5b539d06670   1b0  aa0c03e0       mov x0, x12
0x5b539d06674   1b4  aa1303e4       mov x4, x19
0x5b539d06678   1b8  97fc0c01       bl #-0xfcffc (addr 0x5b539c0967c)
0x5b539d0667c   1bc  f94023e6       ldr x6, [sp, #64]
0x5b539d06680   1c0  9100e0c8       add x8, x6, #0x38 (56)
0x5b539d06684   1c4  f94287e9       ldr x9, [sp, #1288]
0x5b539d06688   1c8  b828693f       str wzr, [x9, x8]
0x5b539d0668c   1cc  f9424fea       ldr x10, [sp, #1176]
0x5b539d06690   1d0  11028142       add w2, w10, #0xa0 (160)
0x5b539d06694   1d4  9101f0cb       add x11, x6, #0x7c (124)
0x5b539d06698   1d8  b86b692b       ldr w11, [x9, x11]
0x5b539d0669c   1dc  910200cc       add x12, x6, #0x80 (128)
0x5b539d066a0   1e0  b86c692c       ldr w12, [x9, x12]
0x5b539d066a4   1e4  0b0c096c       add w12, w11, w12, lsl #2
0x5b539d066a8   1e8  f94017ed       ldr x13, [sp, #40]
0x5b539d066ac   1ec  b86d692e       ldr w14, [x9, x13]
0x5b539d066b0   1f0  f941ffef       ldr x15, [sp, #1016]
0x5b539d066b4   1f4  b86f6933       ldr w19, [x9, x15]
0x5b539d066b8   1f8  1100c140       add w0, w10, #0x30 (48)
0x5b539d066bc   1fc  f9028fe8       str x8, [sp, #1304]
0x5b539d066c0   200  f90267e2       str x2, [sp, #1224]
0x5b539d066c4   204  f90253eb       str x11, [sp, #1184]
0x5b539d066c8   208  f90257ec       str x12, [sp, #1192]
0x5b539d066cc   20c  f9027fee       str x14, [sp, #1272]
0x5b539d066d0   210  f9027bf3       str x19, [sp, #1264]
0x5b539d066d4   214  f9026fe0       str x0, [sp, #1240]
0x5b539d066d8   218  aa0b03f5       mov x21, x11
0x5b539d066dc   21c  d2800014       movz x20, #0x0
0x5b539d066e0   220  fd424be3       ldr d3, [sp, #1168]
0x5b539d066e4   224  f8520356       ldur x22, [x26, #-224]
0x5b539d066e8   228  eb3663ff       cmp sp, x22
0x5b539d066ec   22c  5400cfa9       b.ls #+0x19f4 (addr 0x5b539d080e0)
0x5b539d066f0   230  6b0c02bf       cmp w21, w12
0x5b539d066f4   234  54000120       b.eq #+0x24 (addr 0x5b539d06718)
0x5b539d066f8   238  b8756936       ldr w22, [x9, x21]
0x5b539d066fc   23c  110012b5       add w21, w21, #0x4 (4)
0x5b539d06700   240  6b1601df       cmp w14, w22
0x5b539d06704   244  54ffff09       b.ls #-0x20 (addr 0x5b539d066e4)
0x5b539d06708   248  0b160a76       add w22, w19, w22, lsl #2
0x5b539d0670c   24c  bc766923       ldr s3, [x9, x22]
0x5b539d06710   250  d2800036       movz x22, #0x1
0x5b539d06714   254  14000003       b #+0xc (addr 0x5b539d06720)
0x5b539d06718   258  d2800016       movz x22, #0x0
0x5b539d0671c   25c  aa0c03f5       mov x21, x12
0x5b539d06720   260  fd024be3       str d3, [sp, #1168]
0x5b539d06724   264  f90283f5       str x21, [sp, #1280]
0x5b539d06728   268  710006df       cmp w22, #0x1 (1)
0x5b539d0672c   26c  540004a1       b.ne #+0x94 (addr 0x5b539d067c0)
0x5b539d06730   270  9100c0d6       add x22, x6, #0x30 (48)
0x5b539d06734   274  b8766936       ldr w22, [x9, x22]
0x5b539d06738   278  6b16029f       cmp w20, w22
0x5b539d0673c   27c  54000261       b.ne #+0x4c (addr 0x5b539d06788)
0x5b539d06740   280  d2800023       movz x3, #0x1
0x5b539d06744   284  f90277f4       str x20, [sp, #1256]
0x5b539d06748   288  f9429be7       ldr x7, [sp, #1328]
0x5b539d0674c   28c  aa1403e2       mov x2, x20
0x5b539d06750   290  97fc0bcc       bl #-0xfd0d0 (addr 0x5b539c09680)
0x5b539d06754   294  f94287e9       ldr x9, [sp, #1288]
0x5b539d06758   298  f94023e6       ldr x6, [sp, #64]
0x5b539d0675c   29c  f941ffef       ldr x15, [sp, #1016]
0x5b539d06760   2a0  f94017ed       ldr x13, [sp, #40]
0x5b539d06764   2a4  f9428fe8       ldr x8, [sp, #1304]
0x5b539d06768   2a8  f94257ec       ldr x12, [sp, #1192]
0x5b539d0676c   2ac  f9424fea       ldr x10, [sp, #1176]
0x5b539d06770   2b0  fd424be3       ldr d3, [sp, #1168]
0x5b539d06774   2b4  f94283f5       ldr x21, [sp, #1280]
0x5b539d06778   2b8  f94277f4       ldr x20, [sp, #1256]
0x5b539d0677c   2bc  f9426fe0       ldr x0, [sp, #1240]
0x5b539d06780   2c0  f9427bf3       ldr x19, [sp, #1264]
0x5b539d06784   2c4  f9427fee       ldr x14, [sp, #1272]
0x5b539d06788   2c8  1100068b       add w11, w20, #0x1 (1)
0x5b539d0678c   2cc  aa0903f0       mov x16, x9
0x5b539d06790   2d0  aa0803e9       mov x9, x8
0x5b539d06794   2d4  aa1003e8       mov x8, x16
0x5b539d06798   2d8  b829690b       str w11, [x8, x9]
0x5b539d0679c   2dc  9100d0d6       add x22, x6, #0x34 (52)
0x5b539d067a0   2e0  b8766916       ldr w22, [x8, x22]
0x5b539d067a4   2e4  0b140ad4       add w20, w22, w20, lsl #2
0x5b539d067a8   2e8  bc346903       str s3, [x8, x20]
0x5b539d067ac   2ec  aa0903f0       mov x16, x9
0x5b539d067b0   2f0  aa0803e9       mov x9, x8
0x5b539d067b4   2f4  aa1003e8       mov x8, x16
0x5b539d067b8   2f8  aa0b03f4       mov x20, x11
0x5b539d067bc   2fc  17ffffca       b #-0xd8 (addr 0x5b539d066e4)
0x5b539d067c0   300  910110cb       add x11, x6, #0x44 (68)
0x5b539d067c4   304  b82b693f       str wzr, [x9, x11]
0x5b539d067c8   308  f94247ee       ldr x14, [sp, #1160]
0x5b539d067cc   30c  b86e6933       ldr w19, [x9, x14]
0x5b539d067d0   310  f941fbf4       ldr x20, [sp, #1008]
0x5b539d067d4   314  b8746935       ldr w21, [x9, x20]
0x5b539d067d8   318  1100f140       add w0, w10, #0x3c (60)
0x5b539d067dc   31c  f9027feb       str x11, [sp, #1272]
0x5b539d067e0   320  f9026ff3       str x19, [sp, #1240]
0x5b539d067e4   324  f90273f5       str x21, [sp, #1248]
0x5b539d067e8   328  f90277e0       str x0, [sp, #1256]
0x5b539d067ec   32c  aa0c03f6       mov x22, x12
0x5b539d067f0   330  f94253ec       ldr x12, [sp, #1184]
0x5b539d067f4   334  d2800002       movz x2, #0x0
0x5b539d067f8   338  f8520357       ldur x23, [x26, #-224]
0x5b539d067fc   33c  eb3763ff       cmp sp, x23
0x5b539d06800   340  5400c949       b.ls #+0x1928 (addr 0x5b539d08128)
0x5b539d06804   344  6b16019f       cmp w12, w22
0x5b539d06808   348  54000120       b.eq #+0x24 (addr 0x5b539d0682c)
0x5b539d0680c   34c  b86c6937       ldr w23, [x9, x12]
0x5b539d06810   350  1100118c       add w12, w12, #0x4 (4)
0x5b539d06814   354  6b17027f       cmp w19, w23
0x5b539d06818   358  54ffff09       b.ls #-0x20 (addr 0x5b539d067f8)
0x5b539d0681c   35c  0b170ab7       add w23, w21, w23, lsl #2
0x5b539d06820   360  bc776923       ldr s3, [x9, x23]
0x5b539d06824   364  d2800037       movz x23, #0x1
0x5b539d06828   368  14000003       b #+0xc (addr 0x5b539d06834)
0x5b539d0682c   36c  d2800017       movz x23, #0x0
0x5b539d06830   370  aa1603ec       mov x12, x22
0x5b539d06834   374  fd024be3       str d3, [sp, #1168]
0x5b539d06838   378  f9027bec       str x12, [sp, #1264]
0x5b539d0683c   37c  710006ff       cmp w23, #0x1 (1)
0x5b539d06840   380  540003e1       b.ne #+0x7c (addr 0x5b539d068bc)
0x5b539d06844   384  9100f0d7       add x23, x6, #0x3c (60)
0x5b539d06848   388  b8776937       ldr w23, [x9, x23]
0x5b539d0684c   38c  6b17005f       cmp w2, w23
0x5b539d06850   390  54000261       b.ne #+0x4c (addr 0x5b539d0689c)
0x5b539d06854   394  f90283e2       str x2, [sp, #1280]
0x5b539d06858   398  f9429be7       ldr x7, [sp, #1328]
0x5b539d0685c   39c  d2800023       movz x3, #0x1
0x5b539d06860   3a0  97fc0b88       bl #-0xfd1e0 (addr 0x5b539c09680)
0x5b539d06864   3a4  f94287e9       ldr x9, [sp, #1288]
0x5b539d06868   3a8  f94023e6       ldr x6, [sp, #64]
0x5b539d0686c   3ac  f941fbf4       ldr x20, [sp, #1008]
0x5b539d06870   3b0  f94247ee       ldr x14, [sp, #1160]
0x5b539d06874   3b4  f9428fe8       ldr x8, [sp, #1304]
0x5b539d06878   3b8  f94257f6       ldr x22, [sp, #1192]
0x5b539d0687c   3bc  f9424fea       ldr x10, [sp, #1176]
0x5b539d06880   3c0  fd424be3       ldr d3, [sp, #1168]
0x5b539d06884   3c4  f9427bec       ldr x12, [sp, #1264]
0x5b539d06888   3c8  f94283e2       ldr x2, [sp, #1280]
0x5b539d0688c   3cc  f9427feb       ldr x11, [sp, #1272]
0x5b539d06890   3d0  f94277e0       ldr x0, [sp, #1256]
0x5b539d06894   3d4  f94273f5       ldr x21, [sp, #1248]
0x5b539d06898   3d8  f9426ff3       ldr x19, [sp, #1240]
0x5b539d0689c   3dc  1100044d       add w13, w2, #0x1 (1)
0x5b539d068a0   3e0  b82b692d       str w13, [x9, x11]
0x5b539d068a4   3e4  910100cf       add x15, x6, #0x40 (64)
0x5b539d068a8   3e8  b86f692f       ldr w15, [x9, x15]
0x5b539d068ac   3ec  0b0209ef       add w15, w15, w2, lsl #2
0x5b539d068b0   3f0  bc2f6923       str s3, [x9, x15]
0x5b539d068b4   3f4  aa0d03e2       mov x2, x13
0x5b539d068b8   3f8  17ffffd0       b #-0xc0 (addr 0x5b539d067f8)
0x5b539d068bc   3fc  910140cb       add x11, x6, #0x50 (80)
0x5b539d068c0   400  b82b693f       str wzr, [x9, x11]
0x5b539d068c4   404  910080cc       add x12, x6, #0x20 (32)
0x5b539d068c8   408  b86c692d       ldr w13, [x9, x12]
0x5b539d068cc   40c  910070cf       add x15, x6, #0x1c (28)
0x5b539d068d0   410  b86f6933       ldr w19, [x9, x15]
0x5b539d068d4   414  11012140       add w0, w10, #0x48 (72)
0x5b539d068d8   418  f9027feb       str x11, [sp, #1272]
0x5b539d068dc   41c  f90013ec       str x12, [sp, #32]
0x5b539d068e0   420  f90273ed       str x13, [sp, #1248]
0x5b539d068e4   424  f90007ef       str x15, [sp, #8]
0x5b539d068e8   428  f9026ff3       str x19, [sp, #1240]
0x5b539d068ec   42c  f9027be0       str x0, [sp, #1264]
0x5b539d068f0   430  f94253f5       ldr x21, [sp, #1184]
0x5b539d068f4   434  d2800002       movz x2, #0x0
0x5b539d068f8   438  f8520357       ldur x23, [x26, #-224]
0x5b539d068fc   43c  eb3763ff       cmp sp, x23
0x5b539d06900   440  5400c3a9       b.ls #+0x1874 (addr 0x5b539d08174)
0x5b539d06904   444  6b1602bf       cmp w21, w22
0x5b539d06908   448  54000120       b.eq #+0x24 (addr 0x5b539d0692c)
0x5b539d0690c   44c  b8756937       ldr w23, [x9, x21]
0x5b539d06910   450  110012b5       add w21, w21, #0x4 (4)
0x5b539d06914   454  6b1701bf       cmp w13, w23
0x5b539d06918   458  54ffff09       b.ls #-0x20 (addr 0x5b539d068f8)
0x5b539d0691c   45c  0b170a77       add w23, w19, w23, lsl #2
0x5b539d06920   460  bc776923       ldr s3, [x9, x23]
0x5b539d06924   464  d2800037       movz x23, #0x1
0x5b539d06928   468  14000003       b #+0xc (addr 0x5b539d06934)
0x5b539d0692c   46c  d2800017       movz x23, #0x0
0x5b539d06930   470  aa1603f5       mov x21, x22
0x5b539d06934   474  fd024be3       str d3, [sp, #1168]
0x5b539d06938   478  f9025bf5       str x21, [sp, #1200]
0x5b539d0693c   47c  710006ff       cmp w23, #0x1 (1)
0x5b539d06940   480  540003c1       b.ne #+0x78 (addr 0x5b539d069b8)
0x5b539d06944   484  910120d7       add x23, x6, #0x48 (72)
0x5b539d06948   488  b8776937       ldr w23, [x9, x23]
0x5b539d0694c   48c  6b17005f       cmp w2, w23
0x5b539d06950   490  54000241       b.ne #+0x48 (addr 0x5b539d06998)
0x5b539d06954   494  f90283e2       str x2, [sp, #1280]
0x5b539d06958   498  f9429be7       ldr x7, [sp, #1328]
0x5b539d0695c   49c  d2800023       movz x3, #0x1
0x5b539d06960   4a0  97fc0b48       bl #-0xfd2e0 (addr 0x5b539c09680)
0x5b539d06964   4a4  f94287e9       ldr x9, [sp, #1288]
0x5b539d06968   4a8  f94023e6       ldr x6, [sp, #64]
0x5b539d0696c   4ac  f94007ef       ldr x15, [sp, #8]
0x5b539d06970   4b0  f94013ec       ldr x12, [sp, #32]
0x5b539d06974   4b4  f9427feb       ldr x11, [sp, #1272]
0x5b539d06978   4b8  f94257f6       ldr x22, [sp, #1192]
0x5b539d0697c   4bc  fd424be3       ldr d3, [sp, #1168]
0x5b539d06980   4c0  f9424fea       ldr x10, [sp, #1176]
0x5b539d06984   4c4  f9425bf5       ldr x21, [sp, #1200]
0x5b539d06988   4c8  f94283e2       ldr x2, [sp, #1280]
0x5b539d0698c   4cc  f9427be0       ldr x0, [sp, #1264]
0x5b539d06990   4d0  f9426ff3       ldr x19, [sp, #1240]
0x5b539d06994   4d4  f94273ed       ldr x13, [sp, #1248]
0x5b539d06998   4d8  11000448       add w8, w2, #0x1 (1)
0x5b539d0699c   4dc  b82b6928       str w8, [x9, x11]
0x5b539d069a0   4e0  910130ce       add x14, x6, #0x4c (76)
0x5b539d069a4   4e4  b86e692e       ldr w14, [x9, x14]
0x5b539d069a8   4e8  0b0209ce       add w14, w14, w2, lsl #2
0x5b539d069ac   4ec  bc2e6923       str s3, [x9, x14]
0x5b539d069b0   4f0  aa0803e2       mov x2, x8
0x5b539d069b4   4f4  17ffffd1       b #-0xbc (addr 0x5b539d068f8)
0x5b539d069b8   4f8  910170c8       add x8, x6, #0x5c (92)
0x5b539d069bc   4fc  b828693f       str wzr, [x9, x8]
0x5b539d069c0   500  9100b0cd       add x13, x6, #0x2c (44)
0x5b539d069c4   504  b86d692e       ldr w14, [x9, x13]
0x5b539d069c8   508  9100a0d3       add x19, x6, #0x28 (40)
0x5b539d069cc   50c  b8736934       ldr w20, [x9, x19]
0x5b539d069d0   510  11015140       add w0, w10, #0x54 (84)
0x5b539d069d4   514  f9027be8       str x8, [sp, #1264]
0x5b539d069d8   518  f90203ed       str x13, [sp, #1024]
0x5b539d069dc   51c  f9026bee       str x14, [sp, #1232]
0x5b539d069e0   520  f9000bf3       str x19, [sp, #16]
0x5b539d069e4   524  f90273f4       str x20, [sp, #1248]
0x5b539d069e8   528  f90277e0       str x0, [sp, #1256]
0x5b539d069ec   52c  d2800002       movz x2, #0x0
0x5b539d069f0   530  f94253ea       ldr x10, [sp, #1184]
0x5b539d069f4   534  aa1603f5       mov x21, x22
0x5b539d069f8   538  14000004       b #+0x10 (addr 0x5b539d06a08)
0x5b539d069fc   53c  aa0903f0       mov x16, x9
0x5b539d06a00   540  aa0803e9       mov x9, x8
0x5b539d06a04   544  aa1003e8       mov x8, x16
0x5b539d06a08   548  f8520356       ldur x22, [x26, #-224]
0x5b539d06a0c   54c  eb3663ff       cmp sp, x22
0x5b539d06a10   550  5400bd69       b.ls #+0x17ac (addr 0x5b539d081bc)
0x5b539d06a14   554  6b15015f       cmp w10, w21
0x5b539d06a18   558  540001a0       b.eq #+0x34 (addr 0x5b539d06a4c)
0x5b539d06a1c   55c  b86a6936       ldr w22, [x9, x10]
0x5b539d06a20   560  1100114a       add w10, w10, #0x4 (4)
0x5b539d06a24   564  6b1601df       cmp w14, w22
0x5b539d06a28   568  540000a9       b.ls #+0x14 (addr 0x5b539d06a3c)
0x5b539d06a2c   56c  0b160a96       add w22, w20, w22, lsl #2
0x5b539d06a30   570  bc766923       ldr s3, [x9, x22]
0x5b539d06a34   574  d2800036       movz x22, #0x1
0x5b539d06a38   578  14000007       b #+0x1c (addr 0x5b539d06a54)
0x5b539d06a3c   57c  aa0803f0       mov x16, x8
0x5b539d06a40   580  aa0903e8       mov x8, x9
0x5b539d06a44   584  aa1003e9       mov x9, x16
0x5b539d06a48   588  17ffffed       b #-0x4c (addr 0x5b539d069fc)
0x5b539d06a4c   58c  d2800016       movz x22, #0x0
0x5b539d06a50   590  aa1503ea       mov x10, x21
0x5b539d06a54   594  f90253ea       str x10, [sp, #1184]
0x5b539d06a58   598  fd024be3       str d3, [sp, #1168]
0x5b539d06a5c   59c  710006df       cmp w22, #0x1 (1)
0x5b539d06a60   5a0  54000421       b.ne #+0x84 (addr 0x5b539d06ae4)
0x5b539d06a64   5a4  910150d6       add x22, x6, #0x54 (84)
0x5b539d06a68   5a8  b8766936       ldr w22, [x9, x22]
0x5b539d06a6c   5ac  6b16005f       cmp w2, w22
0x5b539d06a70   5b0  54000241       b.ne #+0x48 (addr 0x5b539d06ab8)
0x5b539d06a74   5b4  f90283e2       str x2, [sp, #1280]
0x5b539d06a78   5b8  f9429be7       ldr x7, [sp, #1328]
0x5b539d06a7c   5bc  d2800023       movz x3, #0x1
0x5b539d06a80   5c0  97fc0b00       bl #-0xfd400 (addr 0x5b539c09680)
0x5b539d06a84   5c4  f94287e9       ldr x9, [sp, #1288]
0x5b539d06a88   5c8  f94023e6       ldr x6, [sp, #64]
0x5b539d06a8c   5cc  f9400bf3       ldr x19, [sp, #16]
0x5b539d06a90   5d0  f94203ed       ldr x13, [sp, #1024]
0x5b539d06a94   5d4  f94283e2       ldr x2, [sp, #1280]
0x5b539d06a98   5d8  f9427feb       ldr x11, [sp, #1272]
0x5b539d06a9c   5dc  f94253ea       ldr x10, [sp, #1184]
0x5b539d06aa0   5e0  fd424be3       ldr d3, [sp, #1168]
0x5b539d06aa4   5e4  f9427be8       ldr x8, [sp, #1264]
0x5b539d06aa8   5e8  f94277e0       ldr x0, [sp, #1256]
0x5b539d06aac   5ec  f94257f5       ldr x21, [sp, #1192]
0x5b539d06ab0   5f0  f94273f4       ldr x20, [sp, #1248]
0x5b539d06ab4   5f4  f9426bee       ldr x14, [sp, #1232]
0x5b539d06ab8   5f8  1100044c       add w12, w2, #0x1 (1)
0x5b539d06abc   5fc  aa0903f0       mov x16, x9
0x5b539d06ac0   600  aa0803e9       mov x9, x8
0x5b539d06ac4   604  aa1003e8       mov x8, x16
0x5b539d06ac8   608  b829690c       str w12, [x8, x9]
0x5b539d06acc   60c  910160cf       add x15, x6, #0x58 (88)
0x5b539d06ad0   610  b86f690f       ldr w15, [x8, x15]
0x5b539d06ad4   614  0b0209ef       add w15, w15, w2, lsl #2
0x5b539d06ad8   618  bc2f6903       str s3, [x8, x15]
0x5b539d06adc   61c  aa0c03e2       mov x2, x12
0x5b539d06ae0   620  17ffffc7       b #-0xe4 (addr 0x5b539d069fc)
0x5b539d06ae4   624  f9428fe8       ldr x8, [sp, #1304]
0x5b539d06ae8   628  b8686928       ldr w8, [x9, x8]
0x5b539d06aec   62c  9100c0ca       add x10, x6, #0x30 (48)
0x5b539d06af0   630  3cea6922       ldr q2, [x9, x10]
0x5b539d06af4   634  3ce66923       ldr q3, [x9, x6]
0x5b539d06af8   638  3caa6923       str q3, [x9, x10]
0x5b539d06afc   63c  3ca66922       str q2, [x9, x6]
0x5b539d06b00   640  910100ca       add x10, x6, #0x40 (64)
0x5b539d06b04   644  3cea6922       ldr q2, [x9, x10]
0x5b539d06b08   648  f941fbec       ldr x12, [sp, #1008]
0x5b539d06b0c   64c  3cec6924       ldr q4, [x9, x12]
0x5b539d06b10   650  3caa6924       str q4, [x9, x10]
0x5b539d06b14   654  b86c692a       ldr w10, [x9, x12]
0x5b539d06b18   658  3cac6922       str q2, [x9, x12]
0x5b539d06b1c   65c  910150ce       add x14, x6, #0x54 (84)
0x5b539d06b20   660  f86e692e       ldr x14, [x9, x14]
0x5b539d06b24   664  b86b692f       ldr w15, [x9, x11]
0x5b539d06b28   668  f94013f4       ldr x20, [sp, #32]
0x5b539d06b2c   66c  3cf46922       ldr q2, [x9, x20]
0x5b539d06b30   670  3cab6922       str q2, [x9, x11]
0x5b539d06b34   674  aa0d03eb       mov x11, x13
0x5b539d06b38   678  b82b6922       str w2, [x9, x11]
0x5b539d06b3c   67c  b874692d       ldr w13, [x9, x20]
0x5b539d06b40   680  b834692f       str w15, [x9, x20]
0x5b539d06b44   684  910090cf       add x15, x6, #0x24 (36)
0x5b539d06b48   688  f82f692e       str x14, [x9, x15]
0x5b539d06b4c   68c  f9028fe8       str x8, [sp, #1304]
0x5b539d06b50   690  f90277ea       str x10, [sp, #1256]
0x5b539d06b54   694  35000108       cbnz w8, #+0x20 (addr 0x5b539d06b74)
0x5b539d06b58   698  f94293e4       ldr x4, [sp, #1312]
0x5b539d06b5c   69c  11080086       add w6, w4, #0x200 (512)
0x5b539d06b60   6a0  f94297ee       ldr x14, [sp, #1320]
0x5b539d06b64   6a4  b90001c6       str w6, [x14]
0x5b539d06b68   6a8  910003bf       mov sp, fp
0x5b539d06b6c   6ac  a8c17bfd       ldp fp, lr, [sp], #16
0x5b539d06b70   6b0  d65f03c0       ret
0x5b539d06b74   6b4  0e143c4e       mov w14, v2.s[2]
0x5b539d06b78   6b8  0e1c3c8f       mov w15, v4.s[3]
0x5b539d06b7c   6bc  0e0c3c75       mov w21, v3.s[1]
0x5b539d06b80   6c0  0e1c3c56       mov w22, v2.s[3]
0x5b539d06b84   6c4  0e0c3c97       mov w23, v4.s[1]
0x5b539d06b88   6c8  0e143c78       mov w24, v3.s[2]
0x5b539d06b8c   6cc  6b1802ff       cmp w23, w24
0x5b539d06b90   6d0  1a9832f9       csel w25, w23, w24, lo
0x5b539d06b94   6d4  6b1901bf       cmp w13, w25
0x5b539d06b98   6d8  1a9931b7       csel w23, w13, w25, lo
0x5b539d06b9c   6dc  6b1702df       cmp w22, w23
0x5b539d06ba0   6e0  1a9732cd       csel w13, w22, w23, lo
0x5b539d06ba4   6e4  910290d6       add x22, x6, #0xa4 (164)
0x5b539d06ba8   6e8  bc766922       ldr s2, [x9, x22]
0x5b539d06bac   6ec  1e220842       fmul s2, s2, s2
0x5b539d06bb0   6f0  4e040443       dup v3.4s, v2.s[0]
0x5b539d06bb4   6f4  f9428bf6       ldr x22, [sp, #1296]
0x5b539d06bb8   6f8  bc766924       ldr s4, [x9, x22]
0x5b539d06bbc   6fc  1e240884       fmul s4, s4, s4
0x5b539d06bc0   700  4e040485       dup v5.4s, v4.s[0]
0x5b539d06bc4   704  f90283ee       str x14, [sp, #1280]
0x5b539d06bc8   708  f9027bef       str x15, [sp, #1264]
0x5b539d06bcc   70c  f90273f5       str x21, [sp, #1248]
0x5b539d06bd0   710  f9026fed       str x13, [sp, #1240]
0x5b539d06bd4   714  fd0217e2       str d2, [sp, #1064]
0x5b539d06bd8   718  3d80dfe3       str q3, [sp, #880]
0x5b539d06bdc   71c  fd021be4       str d4, [sp, #1072]
0x5b539d06be0   720  3d80e3e5       str q5, [sp, #896]
0x5b539d06be4   724  f94017f6       ldr x22, [sp, #40]
0x5b539d06be8   728  1e2e1008       fmov s8, #0x70 (1.0000)
0x5b539d06bec   72c  3dc0e7e7       ldr q7, [sp, #912]
0x5b539d06bf0   730  d2800042       movz x2, #0x2
0x5b539d06bf4   734  d2800020       movz x0, #0x1
0x5b539d06bf8   738  d2800001       movz x1, #0x0
0x5b539d06bfc   73c  f9400ffc       ldr x28, [sp, #24]
0x5b539d06c00   740  aa1303fb       mov cp, x19
0x5b539d06c04   744  f94007f9       ldr x25, [sp, #8]
0x5b539d06c08   748  f941fff8       ldr x24, [sp, #1016]
0x5b539d06c0c   74c  f94247f7       ldr x23, [sp, #1160]
0x5b539d06c10   750  aa0103f3       mov x19, x1
0x5b539d06c14   754  f8520343       ldur x3, [x26, #-224]
0x5b539d06c18   758  eb2363ff       cmp sp, x3
0x5b539d06c1c   75c  5400af49       b.ls #+0x15e8 (addr 0x5b539d08204)
0x5b539d06c20   760  b8766923       ldr w3, [x9, x22]
0x5b539d06c24   764  f90137e3       str x3, [sp, #616]
0x5b539d06c28   768  6b13007f       cmp w3, w19
0x5b539d06c2c   76c  5400a189       b.ls #+0x1430 (addr 0x5b539d0805c)
0x5b539d06c30   770  b8776924       ldr w4, [x9, x23]
0x5b539d06c34   774  f9003fe4       str x4, [sp, #120]
0x5b539d06c38   778  6b13009f       cmp w4, w19
0x5b539d06c3c   77c  5400a109       b.ls #+0x1420 (addr 0x5b539d0805c)
0x5b539d06c40   780  b8746925       ldr w5, [x9, x20]
0x5b539d06c44   784  f9003be5       str x5, [sp, #112]
0x5b539d06c48   788  6b1300bf       cmp w5, w19
0x5b539d06c4c   78c  5400a089       b.ls #+0x1410 (addr 0x5b539d0805c)
0x5b539d06c50   790  b86b6927       ldr w7, [x9, x11]
0x5b539d06c54   794  f90043e7       str x7, [sp, #128]
0x5b539d06c58   798  6b1300ff       cmp w7, w19
0x5b539d06c5c   79c  5400a009       b.ls #+0x1400 (addr 0x5b539d0805c)
0x5b539d06c60   7a0  b8786928       ldr w8, [x9, x24]
0x5b539d06c64   7a4  531e766a       lsl w10, w19, #2
0x5b539d06c68   7a8  0b0a010b       add w11, w8, w10
0x5b539d06c6c   7ac  bc6b6929       ldr s9, [x9, x11]
0x5b539d06c70   7b0  b86c692b       ldr w11, [x9, x12]
0x5b539d06c74   7b4  f9014fe8       str x8, [sp, #664]
0x5b539d06c78   7b8  0b0a0168       add w8, w11, w10
0x5b539d06c7c   7bc  bc68692a       ldr s10, [x9, x8]
0x5b539d06c80   7c0  b8796928       ldr w8, [x9, x25]
0x5b539d06c84   7c4  f90147eb       str x11, [sp, #648]
0x5b539d06c88   7c8  0b0a010b       add w11, w8, w10
0x5b539d06c8c   7cc  bc6b692b       ldr s11, [x9, x11]
0x5b539d06c90   7d0  b87b692b       ldr w11, [x9, x27]
0x5b539d06c94   7d4  f9013fe8       str x8, [sp, #632]
0x5b539d06c98   7d8  0b0a0168       add w8, w11, w10
0x5b539d06c9c   7dc  f9027fea       str x10, [sp, #1272]
0x5b539d06ca0   7e0  bc68692c       ldr s12, [x9, x8]
0x5b539d06ca4   7e4  f94293ea       ldr x10, [sp, #1312]
0x5b539d06ca8   7e8  91003148       add x8, x10, #0xc (12)
0x5b539d06cac   7ec  bc28692c       str s12, [x9, x8]
0x5b539d06cb0   7f0  91002148       add x8, x10, #0x8 (8)
0x5b539d06cb4   7f4  bc28692b       str s11, [x9, x8]
0x5b539d06cb8   7f8  91001148       add x8, x10, #0x4 (4)
0x5b539d06cbc   7fc  bc28692a       str s10, [x9, x8]
0x5b539d06cc0   800  bc2a6929       str s9, [x9, x10]
0x5b539d06cc4   804  9100a148       add x8, x10, #0x28 (40)
0x5b539d06cc8   808  b828693f       str wzr, [x9, x8]
0x5b539d06ccc   80c  f90253e8       str x8, [sp, #1184]
0x5b539d06cd0   810  91008148       add x8, x10, #0x20 (32)
0x5b539d06cd4   814  f828693f       str xzr, [x9, x8]
0x5b539d06cd8   818  6f00e40b       movi v11.2d, #0x0
0x5b539d06cdc   81c  f90257e8       str x8, [sp, #1192]
0x5b539d06ce0   820  91004148       add x8, x10, #0x10 (16)
0x5b539d06ce4   824  3ca8692b       str q11, [x9, x8]
0x5b539d06ce8   828  f9025be8       str x8, [sp, #1200]
0x5b539d06cec   82c  910220c8       add x8, x6, #0x88 (136)
0x5b539d06cf0   830  b8686928       ldr w8, [x9, x8]
0x5b539d06cf4   834  f90027e8       str x8, [sp, #72]
0x5b539d06cf8   838  910230c8       add x8, x6, #0x8c (140)
0x5b539d06cfc   83c  b8686928       ldr w8, [x9, x8]
0x5b539d06d00   840  bc7c692b       ldr s11, [x9, x28]
0x5b539d06d04   844  11010146       add w6, w10, #0x40 (64)
0x5b539d06d08   848  f9028bf3       str x19, [sp, #1296]
0x5b539d06d0c   84c  fd020fe9       str d9, [sp, #1048]
0x5b539d06d10   850  fd0213ea       str d10, [sp, #1056]
0x5b539d06d14   854  f90143eb       str x11, [sp, #640]
0x5b539d06d18   858  f9024be8       str x8, [sp, #1168]
0x5b539d06d1c   85c  fd024feb       str d11, [sp, #1176]
0x5b539d06d20   860  f9026be6       str x6, [sp, #1232]
0x5b539d06d24   864  f9429be0       ldr x0, [sp, #1328]
0x5b539d06d28   868  aa0603e2       mov x2, x6
0x5b539d06d2c   86c  aa0103e3       mov x3, x1
0x5b539d06d30   870  d2803804       movz x4, #0x1c0
0x5b539d06d34   874  5800c730       ldr x16, pc+6372 (addr 0x000005b539d08618)
0x5b539d06d38   878  10000068       adr x8, #+0xc (addr 0x5b539d06d44)
0x5b539d06d3c   87c  a9027748       stp x8, fp, [x26, #32]
0x5b539d06d40   880  d63f0200       blr x16
0x5b539d06d44   884  f900175f       str xzr, [x26, #40]
0x5b539d06d48   888  6a00001f       tst w0, w0
0x5b539d06d4c   88c  5400c5c0       b.eq #+0x18b8 (addr 0x5b539d08604)
0x5b539d06d50   890  f9424be6       ldr x6, [sp, #1168]
0x5b539d06d54   894  710000df       cmp w6, #0x0 (0)
0x5b539d06d58   898  9a9f07e8       cset x8, ne
0x5b539d06d5c   89c  4b0800c6       sub w6, w6, w8
0x5b539d06d60   8a0  fd4213e2       ldr d2, [sp, #1056]
0x5b539d06d64   8a4  fd424fe3       ldr d3, [sp, #1176]
0x5b539d06d68   8a8  1e230844       fmul s4, s2, s3
0x5b539d06d6c   8ac  1e242080       fcmp s4, s4
0x5b539d06d70   8b0  1e241de4       fcsel s4, s15, s4, ne
0x5b539d06d74   8b4  1e202088       fcmp s4, #0.0
0x5b539d06d78   8b8  1e2fcc84       fcsel s4, s4, s15, gt
0x5b539d06d7c   8bc  1e22c085       fcvt d5, s4
0x5b539d06d80   8c0  1e65c0a6       frintz d6, d5
0x5b539d06d84   8c4  1e7900c8       fcvtzu w8, d6
0x5b539d06d88   8c8  1e630107       ucvtf d7, w8
0x5b539d06d8c   8cc  1e6720c0       fcmp d6, d7
0x5b539d06d90   8d0  5400a721       b.ne #+0x14e4 (addr 0x5b539d08274)
0x5b539d06d94   8d4  6b0800df       cmp w6, w8
0x5b539d06d98   8d8  1a8830c9       csel w9, w6, w8, lo
0x5b539d06d9c   8dc  52a9f010       movz w16, #0x4f800000
0x5b539d06da0   8e0  1e270205       fmov s5, w16
0x5b539d06da4   8e4  1e252080       fcmp s4, s5
0x5b539d06da8   8e8  1a9f3128       csel w8, w9, wzr, lo
0x5b539d06dac   8ec  7100011f       cmp w8, #0x0 (0)
0x5b539d06db0   8f0  9a9f07e9       cset x9, ne
0x5b539d06db4   8f4  4b090109       sub w9, w8, w9
0x5b539d06db8   8f8  11000508       add w8, w8, #0x1 (1)
0x5b539d06dbc   8fc  6b0800df       cmp w6, w8
0x5b539d06dc0   900  1a8830ca       csel w10, w6, w8, lo
0x5b539d06dc4   904  f9024bea       str x10, [sp, #1168]
0x5b539d06dc8   908  6b09015f       cmp w10, w9
0x5b539d06dcc   90c  54008943       b.lo #+0x1128 (addr 0x5b539d07ef4)
0x5b539d06dd0   910  f94027e6       ldr x6, [sp, #72]
0x5b539d06dd4   914  710000df       cmp w6, #0x0 (0)
0x5b539d06dd8   918  9a9f07e8       cset x8, ne
0x5b539d06ddc   91c  4b0800c8       sub w8, w6, w8
0x5b539d06de0   920  fd420fe4       ldr d4, [sp, #1048]
0x5b539d06de4   924  1e230883       fmul s3, s4, s3
0x5b539d06de8   928  1e232060       fcmp s3, s3
0x5b539d06dec   92c  1e231de3       fcsel s3, s15, s3, ne
0x5b539d06df0   930  1e202068       fcmp s3, #0.0
0x5b539d06df4   934  1e2fcc63       fcsel s3, s3, s15, gt
0x5b539d06df8   938  1e22c066       fcvt d6, s3
0x5b539d06dfc   93c  1e65c0c7       frintz d7, d6
0x5b539d06e00   940  1e7900eb       fcvtzu w11, d7
0x5b539d06e04   944  1e630168       ucvtf d8, w11
0x5b539d06e08   948  1e6820e0       fcmp d7, d8
0x5b539d06e0c   94c  5400a441       b.ne #+0x1488 (addr 0x5b539d08294)
0x5b539d06e10   950  6b0b011f       cmp w8, w11
0x5b539d06e14   954  1a8b310c       csel w12, w8, w11, lo
0x5b539d06e18   958  1e252060       fcmp s3, s5
0x5b539d06e1c   95c  1a9f318b       csel w11, w12, wzr, lo
0x5b539d06e20   960  7100017f       cmp w11, #0x0 (0)
0x5b539d06e24   964  9a9f07ec       cset x12, ne
0x5b539d06e28   968  4b0c016c       sub w12, w11, w12
0x5b539d06e2c   96c  f9403bee       ldr x14, [sp, #112]
0x5b539d06e30   970  f94043ed       ldr x13, [sp, #128]
0x5b539d06e34   974  6b0d01df       cmp w14, w13
0x5b539d06e38   978  1a8d31cf       csel w15, w14, w13, lo
0x5b539d06e3c   97c  f9403ff3       ldr x19, [sp, #120]
0x5b539d06e40   980  6b0f027f       cmp w19, w15
0x5b539d06e44   984  1a8f3274       csel w20, w19, w15, lo
0x5b539d06e48   988  1100056b       add w11, w11, #0x1 (1)
0x5b539d06e4c   98c  6b0b011f       cmp w8, w11
0x5b539d06e50   990  1a8b310f       csel w15, w8, w11, lo
0x5b539d06e54   994  110005e8       add w8, w15, #0x1 (1)
0x5b539d06e58   998  4e040483       dup v3.4s, v4.s[0]
0x5b539d06e5c   99c  4e040445       dup v5.4s, v2.s[0]
0x5b539d06e60   9a0  f94023eb       ldr x11, [sp, #64]
0x5b539d06e64   9a4  9101916f       add x15, x11, #0x64 (100)
0x5b539d06e68   9a8  f94287f5       ldr x21, [sp, #1288]
0x5b539d06e6c   9ac  b86f6aaf       ldr w15, [x21, x15]
0x5b539d06e70   9b0  9101a176       add x22, x11, #0x68 (104)
0x5b539d06e74   9b4  b8766ab6       ldr w22, [x21, x22]
0x5b539d06e78   9b8  f94293e4       ldr x4, [sp, #1312]
0x5b539d06e7c   9bc  9105c097       add x23, x4, #0x170 (368)
0x5b539d06e80   9c0  3cf76aa6       ldr q6, [x21, x23]
0x5b539d06e84   9c4  9104c098       add x24, x4, #0x130 (304)
0x5b539d06e88   9c8  3cf86aa7       ldr q7, [x21, x24]
0x5b539d06e8c   9cc  9103c099       add x25, x4, #0xf0 (240)
0x5b539d06e90   9d0  3cf96aa8       ldr q8, [x21, x25]
0x5b539d06e94   9d4  9102c09b       add cp, x4, #0xb0 (176)
0x5b539d06e98   9d8  3cfb6aa9       ldr q9, [x21, x27]
0x5b539d06e9c   9dc  9101c09c       add x28, x4, #0x70 (112)
0x5b539d06ea0   9e0  3cfc6aaa       ldr q10, [x21, x28]
0x5b539d06ea4   9e4  9107c080       add x0, x4, #0x1f0 (496)
0x5b539d06ea8   9e8  3ce06aab       ldr q11, [x21, x0]
0x5b539d06eac   9ec  9106c081       add x1, x4, #0x1b0 (432)
0x5b539d06eb0   9f0  3ce16aac       ldr q12, [x21, x1]
0x5b539d06eb4   9f4  91058082       add x2, x4, #0x160 (352)
0x5b539d06eb8   9f8  3ce26aad       ldr q13, [x21, x2]
0x5b539d06ebc   9fc  91048083       add x3, x4, #0x120 (288)
0x5b539d06ec0   a00  3ce36aae       ldr q14, [x21, x3]
0x5b539d06ec4   a04  91038085       add x5, x4, #0xe0 (224)
0x5b539d06ec8   a08  3ce56ab0       ldr q16, [x21, x5]
0x5b539d06ecc   a0c  91028087       add x7, x4, #0xa0 (160)
0x5b539d06ed0   a10  3ce76ab1       ldr q17, [x21, x7]
0x5b539d06ed4   a14  9101808b       add x11, x4, #0x60 (96)
0x5b539d06ed8   a18  3ceb6ab2       ldr q18, [x21, x11]
0x5b539d06edc   a1c  9107808a       add x10, x4, #0x1e0 (480)
0x5b539d06ee0   a20  3cea6ab3       ldr q19, [x21, x10]
0x5b539d06ee4   a24  f9013bf4       str x20, [sp, #624]
0x5b539d06ee8   a28  91068094       add x20, x4, #0x1a0 (416)
0x5b539d06eec   a2c  3cf46ab4       ldr q20, [x21, x20]
0x5b539d06ef0   a30  f901e7fc       str x28, [sp, #968]
0x5b539d06ef4   a34  9105409c       add x28, x4, #0x150 (336)
0x5b539d06ef8   a38  3cfc6ab5       ldr q21, [x21, x28]
0x5b539d06efc   a3c  f901e3fb       str cp, [sp, #960]
0x5b539d06f00   a40  9104409b       add cp, x4, #0x110 (272)
0x5b539d06f04   a44  3cfb6ab6       ldr q22, [x21, x27]
0x5b539d06f08   a48  f901dff9       str x25, [sp, #952]
0x5b539d06f0c   a4c  91034099       add x25, x4, #0xd0 (208)
0x5b539d06f10   a50  3cf96ab7       ldr q23, [x21, x25]
0x5b539d06f14   a54  f901dbf8       str x24, [sp, #944]
0x5b539d06f18   a58  91024098       add x24, x4, #0x90 (144)
0x5b539d06f1c   a5c  3cf86ab8       ldr q24, [x21, x24]
0x5b539d06f20   a60  f901d7f7       str x23, [sp, #936]
0x5b539d06f24   a64  91014097       add x23, x4, #0x50 (80)
0x5b539d06f28   a68  3cf76ab9       ldr q25, [x21, x23]
0x5b539d06f2c   a6c  f901d3e1       str x1, [sp, #928]
0x5b539d06f30   a70  91074081       add x1, x4, #0x1d0 (464)
0x5b539d06f34   a74  3ce16aba       ldr q26, [x21, x1]
0x5b539d06f38   a78  f901b7e0       str x0, [sp, #872]
0x5b539d06f3c   a7c  91064080       add x0, x4, #0x190 (400)
0x5b539d06f40   a80  3ce06abb       ldr q27, [x21, x0]
0x5b539d06f44   a84  f901b3eb       str x11, [sp, #864]
0x5b539d06f48   a88  9105008b       add x11, x4, #0x140 (320)
0x5b539d06f4c   a8c  3ceb6abc       ldr q28, [x21, x11]
0x5b539d06f50   a90  f9019fe7       str x7, [sp, #824]
0x5b539d06f54   a94  91040087       add x7, x4, #0x100 (256)
0x5b539d06f58   a98  3ce76aa0       ldr q0, [x21, x7]
0x5b539d06f5c   a9c  f9019be5       str x5, [sp, #816]
0x5b539d06f60   aa0  91030085       add x5, x4, #0xc0 (192)
0x5b539d06f64   aa4  3ce56aa1       ldr q1, [x21, x5]
0x5b539d06f68   aa8  f90197e3       str x3, [sp, #808]
0x5b539d06f6c   aac  91020083       add x3, x4, #0x80 (128)
0x5b539d06f70   ab0  3ce36aa2       ldr q2, [x21, x3]
0x5b539d06f74   ab4  f90193e2       str x2, [sp, #800]
0x5b539d06f78   ab8  91010082       add x2, x4, #0x40 (64)
0x5b539d06f7c   abc  3ce26aa4       ldr q4, [x21, x2]
0x5b539d06f80   ac0  f9018ff4       str x20, [sp, #792]
0x5b539d06f84   ac4  91070094       add x20, x4, #0x1c0 (448)
0x5b539d06f88   ac8  3d80d7e3       str q3, [sp, #848]
0x5b539d06f8c   acc  3cf46aa3       ldr q3, [x21, x20]
0x5b539d06f90   ad0  f9018bea       str x10, [sp, #784]
0x5b539d06f94   ad4  9106008a       add x10, x4, #0x180 (384)
0x5b539d06f98   ad8  3d80d3e5       str q5, [sp, #832]
0x5b539d06f9c   adc  3cea6aa5       ldr q5, [x21, x10]
0x5b539d06fa0   ae0  f9002bec       str x12, [sp, #80]
0x5b539d06fa4   ae4  f9002fe8       str x8, [sp, #88]
0x5b539d06fa8   ae8  f90037ef       str x15, [sp, #104]
0x5b539d06fac   aec  f90033f6       str x22, [sp, #96]
0x5b539d06fb0   af0  f90177fc       str x28, [sp, #744]
0x5b539d06fb4   af4  f9017bfb       str cp, [sp, #752]
0x5b539d06fb8   af8  f9017ff9       str x25, [sp, #760]
0x5b539d06fbc   afc  f90183f8       str x24, [sp, #768]
0x5b539d06fc0   b00  f90187f7       str x23, [sp, #776]
0x5b539d06fc4   b04  f90173e0       str x0, [sp, #736]
0x5b539d06fc8   b08  f9015beb       str x11, [sp, #688]
0x5b539d06fcc   b0c  f90157ea       str x10, [sp, #680]
0x5b539d06fd0   b10  3dc00ffe       ldr q30, [sp, #48]
0x5b539d06fd4   b14  3d811ffe       str q30, [sp, #1136]
0x5b539d06fd8   b18  b90483ff       str wzr, [sp, #1152]
0x5b539d06fdc   b1c  b9046bff       str wzr, [sp, #1128]
0x5b539d06fe0   b20  b90463ff       str wzr, [sp, #1120]
0x5b539d06fe4   b24  b9045bff       str wzr, [sp, #1112]
0x5b539d06fe8   b28  3d8033e8       str q8, [sp, #192]
0x5b539d06fec   b2c  4ea51ca8       mov v8.16b, v5.16b
0x5b539d06ff0   b30  3d8037e9       str q9, [sp, #208]
0x5b539d06ff4   b34  4ea31c69       mov v9.16b, v3.16b
0x5b539d06ff8   b38  3d803bea       str q10, [sp, #224]
0x5b539d06ffc   b3c  4ea41c8a       mov v10.16b, v4.16b
0x5b539d07000   b40  3d803feb       str q11, [sp, #240]
0x5b539d07004   b44  4ea21c4b       mov v11.16b, v2.16b
0x5b539d07008   b48  3d802fe7       str q7, [sp, #176]
0x5b539d0700c   b4c  3d802be6       str q6, [sp, #160]
0x5b539d07010   b50  b90453ff       str wzr, [sp, #1104]
0x5b539d07014   b54  1400001f       b #+0x7c (addr 0x5b539d07090)
0x5b539d07018   b58  f94027e6       ldr x6, [sp, #72]
0x5b539d0701c   b5c  f9402bec       ldr x12, [sp, #80]
0x5b539d07020   b60  f9402fe8       ldr x8, [sp, #88]
0x5b539d07024   b64  f94033f6       ldr x22, [sp, #96]
0x5b539d07028   b68  aa0f03e9       mov x9, x15
0x5b539d0702c   b6c  f94037ef       ldr x15, [sp, #104]
0x5b539d07030   b70  4ea81d12       mov v18.16b, v8.16b
0x5b539d07034   b74  3dc097e8       ldr q8, [sp, #592]
0x5b539d07038   b78  4ea91d31       mov v17.16b, v9.16b
0x5b539d0703c   b7c  4ea71ce9       mov v9.16b, v7.16b
0x5b539d07040   b80  3d803bec       str q12, [sp, #224]
0x5b539d07044   b84  4eaa1d4c       mov v12.16b, v10.16b
0x5b539d07048   b88  4ea11c2a       mov v10.16b, v1.16b
0x5b539d0704c   b8c  3d803feb       str q11, [sp, #240]
0x5b539d07050   b90  3dc08beb       ldr q11, [sp, #544]
0x5b539d07054   b94  3dc087e1       ldr q1, [sp, #528]
0x5b539d07058   b98  3d8037ee       str q14, [sp, #208]
0x5b539d0705c   b9c  4eb31e6e       mov v14.16b, v19.16b
0x5b539d07060   ba0  4eb61ed3       mov v19.16b, v22.16b
0x5b539d07064   ba4  4eba1f56       mov v22.16b, v26.16b
0x5b539d07068   ba8  4ea01c1a       mov v26.16b, v0.16b
0x5b539d0706c   bac  3dc083e0       ldr q0, [sp, #512]
0x5b539d07070   bb0  4eb51eb4       mov v20.16b, v21.16b
0x5b539d07074   bb4  4ebb1f75       mov v21.16b, v27.16b
0x5b539d07078   bb8  4ebc1f9b       mov v27.16b, v28.16b
0x5b539d0707c   bbc  3dc07ffc       ldr q28, [sp, #496]
0x5b539d07080   bc0  f9403bee       ldr x14, [sp, #112]
0x5b539d07084   bc4  f9403ff3       ldr x19, [sp, #120]
0x5b539d07088   bc8  f94043ed       ldr x13, [sp, #128]
0x5b539d0708c   bcc  aa1903f5       mov x21, x25
0x5b539d07090   bd0  f8520340       ldur x0, [x26, #-224]
0x5b539d07094   bd4  f9414ff7       ldr x23, [sp, #664]
0x5b539d07098   bd8  f94147fb       ldr cp, [sp, #648]
0x5b539d0709c   bdc  f94143fc       ldr x28, [sp, #640]
0x5b539d070a0   be0  f9413ff9       ldr x25, [sp, #632]
0x5b539d070a4   be4  f94137f8       ldr x24, [sp, #616]
0x5b539d070a8   be8  d2800004       movz x4, #0x0
0x5b539d070ac   bec  f9024fe9       str x9, [sp, #1176]
0x5b539d070b0   bf0  eb2063ff       cmp sp, x0
0x5b539d070b4   bf4  54009009       b.ls #+0x1200 (addr 0x5b539d082b4)
0x5b539d070b8   bf8  1b067d20       mul w0, w9, w6
0x5b539d070bc   bfc  0b0c0006       add w6, w0, w12
0x5b539d070c0   c00  6b0602df       cmp w22, w6
0x5b539d070c4   c04  54000189       b.ls #+0x30 (addr 0x5b539d070f4)
0x5b539d070c8   c08  0b000100       add w0, w8, w0
0x5b539d070cc   c0c  6b0002df       cmp w22, w0
0x5b539d070d0   c10  54000129       b.ls #+0x24 (addr 0x5b539d070f4)
0x5b539d070d4   c14  0b0009e0       add w0, w15, w0, lsl #2
0x5b539d070d8   c18  b8606aa0       ldr w0, [x21, x0]
0x5b539d070dc   c1c  0b0609e6       add w6, w15, w6, lsl #2
0x5b539d070e0   c20  b8666aa6       ldr w6, [x21, x6]
0x5b539d070e4   c24  aa0003f0       mov x16, x0
0x5b539d070e8   c28  aa0603e0       mov x0, x6
0x5b539d070ec   c2c  aa1003e6       mov x6, x16
0x5b539d070f0   c30  14000003       b #+0xc (addr 0x5b539d070fc)
0x5b539d070f4   c34  aa0403e6       mov x6, x4
0x5b539d070f8   c38  aa0403e0       mov x0, x4
0x5b539d070fc   c3c  531e7408       lsl w8, w0, #2
0x5b539d07100   c40  0b0802ec       add w12, w23, w8
0x5b539d07104   c44  4b0000cf       sub w15, w6, w0
0x5b539d07108   c48  6b06031f       cmp w24, w6
0x5b539d0710c   c4c  9a9f27f6       cset x22, lo
0x5b539d07110   c50  6b0000df       cmp w6, w0
0x5b539d07114   c54  9a9f27e9       cset x9, lo
0x5b539d07118   c58  2a0902d7       orr w23, w22, w9
0x5b539d0711c   c5c  6a1702ff       tst w23, w23
0x5b539d07120   c60  1a8f13f7       csel w23, wzr, w15, ne
0x5b539d07124   c64  f9014be6       str x6, [sp, #656]
0x5b539d07128   c68  f901f7f7       str x23, [sp, #1000]
0x5b539d0712c   c6c  6b0000df       cmp w6, w0
0x5b539d07130   c70  54000423       b.lo #+0x84 (addr 0x5b539d071b4)
0x5b539d07134   c74  0b080320       add w0, w25, w8
0x5b539d07138   c78  d2800099       movz x25, #0x4
0x5b539d0713c   c7c  6b0601df       cmp w14, w6
0x5b539d07140   c80  1a803338       csel w24, w25, w0, lo
0x5b539d07144   c84  6b0601df       cmp w14, w6
0x5b539d07148   c88  1a8f3080       csel w0, w4, w15, lo
0x5b539d0714c   c8c  121c600e       and w14, w0, #0x1ffffff0
0x5b539d07150   c90  0b0e0b0e       add w14, w24, w14, lsl #2
0x5b539d07154   c94  0b080375       add w21, w27, w8
0x5b539d07158   c98  6b06027f       cmp w19, w6
0x5b539d0715c   c9c  1a95333b       csel w27, w25, w21, lo
0x5b539d07160   ca0  6b06027f       cmp w19, w6
0x5b539d07164   ca4  1a8f3095       csel w21, w4, w15, lo
0x5b539d07168   ca8  121c62b3       and w19, w21, #0x1ffffff0
0x5b539d0716c   cac  0b130b73       add w19, w27, w19, lsl #2
0x5b539d07170   cb0  53047c0a       lsr w10, w0, #4
0x5b539d07174   cb4  12000c00       and w0, w0, #0xf
0x5b539d07178   cb8  53047eab       lsr w11, w21, #4
0x5b539d0717c   cbc  12000eb5       and w21, w21, #0xf
0x5b539d07180   cc0  6b0601bf       cmp w13, w6
0x5b539d07184   cc4  540000e3       b.lo #+0x1c (addr 0x5b539d071a0)
0x5b539d07188   cc8  0b080388       add w8, w28, w8
0x5b539d0718c   ccc  aa0a03f0       mov x16, x10
0x5b539d07190   cd0  aa0f03ea       mov x10, x15
0x5b539d07194   cd4  aa0b03ef       mov x15, x11
0x5b539d07198   cd8  aa1003eb       mov x11, x16
0x5b539d0719c   cdc  14000011       b #+0x44 (addr 0x5b539d071e0)
0x5b539d071a0   ce0  aa0b03ef       mov x15, x11
0x5b539d071a4   ce4  aa0a03eb       mov x11, x10
0x5b539d071a8   ce8  aa0403ea       mov x10, x4
0x5b539d071ac   cec  aa1903e8       mov x8, x25
0x5b539d071b0   cf0  1400000c       b #+0x30 (addr 0x5b539d071e0)
0x5b539d071b4   cf4  aa0403ea       mov x10, x4
0x5b539d071b8   cf8  d2800099       movz x25, #0x4
0x5b539d071bc   cfc  aa0403f5       mov x21, x4
0x5b539d071c0   d00  aa0403ef       mov x15, x4
0x5b539d071c4   d04  aa0403e0       mov x0, x4
0x5b539d071c8   d08  aa0403eb       mov x11, x4
0x5b539d071cc   d0c  aa1903e8       mov x8, x25
0x5b539d071d0   d10  aa1903ee       mov x14, x25
0x5b539d071d4   d14  aa1903f3       mov x19, x25
0x5b539d071d8   d18  aa1903f8       mov x24, x25
0x5b539d071dc   d1c  aa1903fb       mov cp, x25
0x5b539d071e0   d20  2a0902c9       orr w9, w22, w9
0x5b539d071e4   d24  6a09013f       tst w9, w9
0x5b539d071e8   d28  1a8c1329       csel w9, w25, w12, ne
0x5b539d071ec   d2c  12000eec       and w12, w23, #0xf
0x5b539d071f0   d30  53047d56       lsr w22, w10, #4
0x5b539d071f4   d34  53047ef9       lsr w25, w23, #4
0x5b539d071f8   d38  6b1901ff       cmp w15, w25
0x5b539d071fc   d3c  1a9931ed       csel w13, w15, w25, lo
0x5b539d07200   d40  6b0d017f       cmp w11, w13
0x5b539d07204   d44  1a8d316f       csel w15, w11, w13, lo
0x5b539d07208   d48  6b0f02df       cmp w22, w15
0x5b539d0720c   d4c  1a8f32cb       csel w11, w22, w15, lo
0x5b539d07210   d50  f9020bee       str x14, [sp, #1040]
0x5b539d07214   d54  f90207f3       str x19, [sp, #1032]
0x5b539d07218   d58  f90227e8       str x8, [sp, #1096]
0x5b539d0721c   d5c  f90223ea       str x10, [sp, #1088]
0x5b539d07220   d60  f901f3e0       str x0, [sp, #992]
0x5b539d07224   d64  f901eff5       str x21, [sp, #984]
0x5b539d07228   d68  f9004bfb       str cp, [sp, #144]
0x5b539d0722c   d6c  f90047f8       str x24, [sp, #136]
0x5b539d07230   d70  f9021fe9       str x9, [sp, #1080]
0x5b539d07234   d74  f901ebec       str x12, [sp, #976]
0x5b539d07238   d78  3500054b       cbnz w11, #+0xa8 (addr 0x5b539d072e0)
0x5b539d0723c   d7c  4ea81d06       mov v6.16b, v8.16b
0x5b539d07240   d80  4ea91d27       mov v7.16b, v9.16b
0x5b539d07244   d84  4ea11c23       mov v3.16b, v1.16b
0x5b539d07248   d88  4eaa1d41       mov v1.16b, v10.16b
0x5b539d0724c   d8c  4eab1d62       mov v2.16b, v11.16b
0x5b539d07250   d90  4ea01c04       mov v4.16b, v0.16b
0x5b539d07254   d94  4ebc1f85       mov v5.16b, v28.16b
0x5b539d07258   d98  4ebb1f7c       mov v28.16b, v27.16b
0x5b539d0725c   d9c  4eba1f40       mov v0.16b, v26.16b
0x5b539d07260   da0  f94157eb       ldr x11, [sp, #680]
0x5b539d07264   da4  f9415bed       ldr x13, [sp, #688]
0x5b539d07268   da8  f94173ee       ldr x14, [sp, #736]
0x5b539d0726c   dac  4eb61eda       mov v26.16b, v22.16b
0x5b539d07270   db0  4eb51ebb       mov v27.16b, v21.16b
0x5b539d07274   db4  4eb41e95       mov v21.16b, v20.16b
0x5b539d07278   db8  4eb31e76       mov v22.16b, v19.16b
0x5b539d0727c   dbc  4eb21e48       mov v8.16b, v18.16b
0x5b539d07280   dc0  4eb11e29       mov v9.16b, v17.16b
0x5b539d07284   dc4  f94177f3       ldr x19, [sp, #744]
0x5b539d07288   dc8  4eae1dd3       mov v19.16b, v14.16b
0x5b539d0728c   dcc  f9417bf7       ldr x23, [sp, #752]
0x5b539d07290   dd0  4eac1d8a       mov v10.16b, v12.16b
0x5b539d07294   dd4  3dc03feb       ldr q11, [sp, #240]
0x5b539d07298   dd8  3dc03bec       ldr q12, [sp, #224]
0x5b539d0729c   ddc  3dc037ee       ldr q14, [sp, #208]
0x5b539d072a0   de0  f9417fe0       ldr x0, [sp, #760]
0x5b539d072a4   de4  f94183f5       ldr x21, [sp, #768]
0x5b539d072a8   de8  f94187ea       ldr x10, [sp, #776]
0x5b539d072ac   dec  f94287f9       ldr x25, [sp, #1288]
0x5b539d072b0   df0  f941d7f8       ldr x24, [sp, #936]
0x5b539d072b4   df4  3dc0e7f4       ldr q20, [sp, #912]
0x5b539d072b8   df8  3dc0e3f2       ldr q18, [sp, #896]
0x5b539d072bc   dfc  3dc0dff1       ldr q17, [sp, #880]
0x5b539d072c0   e00  f941d3ef       ldr x15, [sp, #928]
0x5b539d072c4   e04  f941b7e8       ldr x8, [sp, #872]
0x5b539d072c8   e08  f941b3e9       ldr x9, [sp, #864]
0x5b539d072cc   e0c  f94197ec       ldr x12, [sp, #808]
0x5b539d072d0   e10  f94193e6       ldr x6, [sp, #800]
0x5b539d072d4   e14  f9418fe4       ldr x4, [sp, #792]
0x5b539d072d8   e18  f9418bfc       ldr x28, [sp, #784]
0x5b539d072dc   e1c  14000115       b #+0x454 (addr 0x5b539d07730)
0x5b539d072e0   e20  4ea81d06       mov v6.16b, v8.16b
0x5b539d072e4   e24  4ea91d27       mov v7.16b, v9.16b
0x5b539d072e8   e28  4ea11c23       mov v3.16b, v1.16b
0x5b539d072ec   e2c  4eaa1d41       mov v1.16b, v10.16b
0x5b539d072f0   e30  4eab1d62       mov v2.16b, v11.16b
0x5b539d072f4   e34  4ea01c04       mov v4.16b, v0.16b
0x5b539d072f8   e38  4ebc1f85       mov v5.16b, v28.16b
0x5b539d072fc   e3c  4ebb1f7c       mov v28.16b, v27.16b
0x5b539d07300   e40  4eba1f40       mov v0.16b, v26.16b
0x5b539d07304   e44  f90133eb       str x11, [sp, #608]
0x5b539d07308   e48  f94157eb       ldr x11, [sp, #680]
0x5b539d0730c   e4c  f9415bed       ldr x13, [sp, #688]
0x5b539d07310   e50  f94173ee       ldr x14, [sp, #736]
0x5b539d07314   e54  4eb61eda       mov v26.16b, v22.16b
0x5b539d07318   e58  4eb51ebb       mov v27.16b, v21.16b
0x5b539d0731c   e5c  4eb41e95       mov v21.16b, v20.16b
0x5b539d07320   e60  4eb31e76       mov v22.16b, v19.16b
0x5b539d07324   e64  3d8057f2       str q18, [sp, #336]
0x5b539d07328   e68  3d8053f1       str q17, [sp, #320]
0x5b539d0732c   e6c  f94177f3       ldr x19, [sp, #744]
0x5b539d07330   e70  3d804bee       str q14, [sp, #288]
0x5b539d07334   e74  f9417bf7       ldr x23, [sp, #752]
0x5b539d07338   e78  3d8043ec       str q12, [sp, #256]
0x5b539d0733c   e7c  f9417fe0       ldr x0, [sp, #760]
0x5b539d07340   e80  f94183f5       ldr x21, [sp, #768]
0x5b539d07344   e84  f94187ea       ldr x10, [sp, #776]
0x5b539d07348   e88  f9418bfc       ldr x28, [sp, #784]
0x5b539d0734c   e8c  aa0403f6       mov x22, x4
0x5b539d07350   e90  f9418fe4       ldr x4, [sp, #792]
0x5b539d07354   e94  f94193e6       ldr x6, [sp, #800]
0x5b539d07358   e98  f94287f9       ldr x25, [sp, #1288]
0x5b539d0735c   e9c  f94197ec       ldr x12, [sp, #808]
0x5b539d07360   ea0  14000013       b #+0x4c (addr 0x5b539d073ac)
0x5b539d07364   ea4  f94047f8       ldr x24, [sp, #136]
0x5b539d07368   ea8  f90133fb       str cp, [sp, #608]
0x5b539d0736c   eac  f9404bfb       ldr cp, [sp, #144]
0x5b539d07370   eb0  f9421fe9       ldr x9, [sp, #1080]
0x5b539d07374   eb4  3d803fe2       str q2, [sp, #240]
0x5b539d07378   eb8  3dc08be2       ldr q2, [sp, #544]
0x5b539d0737c   ebc  3d8043e3       str q3, [sp, #256]
0x5b539d07380   ec0  3dc087e3       ldr q3, [sp, #528]
0x5b539d07384   ec4  3d803be4       str q4, [sp, #224]
0x5b539d07388   ec8  3dc083e4       ldr q4, [sp, #512]
0x5b539d0738c   ecc  3d802be5       str q5, [sp, #160]
0x5b539d07390   ed0  3dc07fe5       ldr q5, [sp, #496]
0x5b539d07394   ed4  f94227e8       ldr x8, [sp, #1096]
0x5b539d07398   ed8  3d802fea       str q10, [sp, #176]
0x5b539d0739c   edc  3d8033e9       str q9, [sp, #192]
0x5b539d073a0   ee0  3d8037ec       str q12, [sp, #208]
0x5b539d073a4   ee4  3d8057e8       str q8, [sp, #336]
0x5b539d073a8   ee8  3d804bf3       str q19, [sp, #288]
0x5b539d073ac   eec  f852034f       ldur x15, [x26, #-224]
0x5b539d073b0   ef0  3d804ff0       str q16, [sp, #304]
0x5b539d073b4   ef4  3d8047ed       str q13, [sp, #272]
0x5b539d073b8   ef8  eb2f63ff       cmp sp, x15
0x5b539d073bc   efc  54008109       b.ls #+0x1020 (addr 0x5b539d083dc)
0x5b539d073c0   f00  0b16030f       add w15, w24, w22
0x5b539d073c4   f04  3cef6b2a       ldr q10, [x25, x15]
0x5b539d073c8   f08  0b160118       add w24, w8, w22
0x5b539d073cc   f0c  3cf86b29       ldr q9, [x25, x24]
0x5b539d073d0   f10  0b160368       add w8, w27, w22
0x5b539d073d4   f14  3ce86b28       ldr q8, [x25, x8]
0x5b539d073d8   f18  3dc0d3eb       ldr q11, [sp, #832]
0x5b539d073dc   f1c  4ea8d56c       fsub v12.4s, v11.4s, v8.4s
0x5b539d073e0   f20  0b16013b       add w27, w9, w22
0x5b539d073e4   f24  3cfb6b2d       ldr q13, [x25, x27]
0x5b539d073e8   f28  3dc0d7ee       ldr q14, [sp, #848]
0x5b539d073ec   f2c  4eadd5d2       fsub v18.4s, v14.4s, v13.4s
0x5b539d073f0   f30  6e32de51       fmul v17.4s, v18.4s, v18.4s
0x5b539d073f4   f34  6e2cdd90       fmul v16.4s, v12.4s, v12.4s
0x5b539d073f8   f38  4e30d630       fadd v16.4s, v17.4s, v16.4s
0x5b539d073fc   f3c  3dc0dff1       ldr q17, [sp, #880]
0x5b539d07400   f40  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x5b539d07404   f44  3dc0e7f4       ldr q20, [sp, #912]
0x5b539d07408   f48  4e341e73       and v19.16b, v19.16b, v20.16b
0x5b539d0740c   f4c  4e21da73       scvtf v19.4s, v19.4s
0x5b539d07410   f50  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x5b539d07414   f54  4e2cd4e7       fadd v7.4s, v7.4s, v12.4s
0x5b539d07418   f58  3cb46b27       str q7, [x25, x20]
0x5b539d0741c   f5c  6e33de4c       fmul v12.4s, v18.4s, v19.4s
0x5b539d07420   f60  4e2cd4c6       fadd v6.4s, v6.4s, v12.4s
0x5b539d07424   f64  3cab6b26       str q6, [x25, x11]
0x5b539d07428   f68  6e31e60c       fcmge v12.4s, v16.4s, v17.4s
0x5b539d0742c   f6c  3dc0e3f2       ldr q18, [sp, #896]
0x5b539d07430   f70  6eb0e653       fcmgt v19.4s, v18.4s, v16.4s
0x5b539d07434   f74  4e331d8c       and v12.16b, v12.16b, v19.16b
0x5b539d07438   f78  4ea0ca10       fcmgt v16.4s, v16.4s, #0.0
0x5b539d0743c   f7c  4e341e10       and v16.16b, v16.16b, v20.16b
0x5b539d07440   f80  4e21da10       scvtf v16.4s, v16.4s
0x5b539d07444   f84  4e301d8c       and v12.16b, v12.16b, v16.16b
0x5b539d07448   f88  4e25d585       fadd v5.4s, v12.4s, v5.4s
0x5b539d0744c   f8c  3cad6b25       str q5, [x25, x13]
0x5b539d07450   f90  6e2cdd29       fmul v9.4s, v9.4s, v12.4s
0x5b539d07454   f94  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x5b539d07458   f98  3ca76b24       str q4, [x25, x7]
0x5b539d0745c   f9c  6e2cdd49       fmul v9.4s, v10.4s, v12.4s
0x5b539d07460   fa0  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x5b539d07464   fa4  3ca56b23       str q3, [x25, x5]
0x5b539d07468   fa8  6e2cdd08       fmul v8.4s, v8.4s, v12.4s
0x5b539d0746c   fac  4e22d502       fadd v2.4s, v8.4s, v2.4s
0x5b539d07470   fb0  3ca36b22       str q2, [x25, x3]
0x5b539d07474   fb4  6e2cdda8       fmul v8.4s, v13.4s, v12.4s
0x5b539d07478   fb8  4e28d421       fadd v1.4s, v1.4s, v8.4s
0x5b539d0747c   fbc  3ca26b21       str q1, [x25, x2]
0x5b539d07480   fc0  110041e9       add w9, w15, #0x10 (16)
0x5b539d07484   fc4  3ce96b28       ldr q8, [x25, x9]
0x5b539d07488   fc8  11004309       add w9, w24, #0x10 (16)
0x5b539d0748c   fcc  3ce96b29       ldr q9, [x25, x9]
0x5b539d07490   fd0  11004109       add w9, w8, #0x10 (16)
0x5b539d07494   fd4  3ce96b2a       ldr q10, [x25, x9]
0x5b539d07498   fd8  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0x5b539d0749c   fdc  11004369       add w9, w27, #0x10 (16)
0x5b539d074a0   fe0  3ce96b2d       ldr q13, [x25, x9]
0x5b539d074a4   fe4  4eadd5d0       fsub v16.4s, v14.4s, v13.4s
0x5b539d074a8   fe8  6e30de13       fmul v19.4s, v16.4s, v16.4s
0x5b539d074ac   fec  3d808be2       str q2, [sp, #544]
0x5b539d074b0   ff0  6e2cdd82       fmul v2.4s, v12.4s, v12.4s
0x5b539d074b4   ff4  4e22d662       fadd v2.4s, v19.4s, v2.4s
0x5b539d074b8   ff8  6ea2e633       fcmgt v19.4s, v17.4s, v2.4s
0x5b539d074bc   ffc  4e341e73       and v19.16b, v19.16b, v20.16b
0x5b539d074c0  1000  4e21da73       scvtf v19.4s, v19.4s
0x5b539d074c4  1004  6e33dd8c       fmul v12.4s, v12.4s, v19.4s
0x5b539d074c8  1008  4e2cd400       fadd v0.4s, v0.4s, v12.4s
0x5b539d074cc  100c  3ca16b20       str q0, [x25, x1]
0x5b539d074d0  1010  6e33de0c       fmul v12.4s, v16.4s, v19.4s
0x5b539d074d4  1014  4e2cd79c       fadd v28.4s, v28.4s, v12.4s
0x5b539d074d8  1018  3cae6b3c       str q28, [x25, x14]
0x5b539d074dc  101c  6e31e44c       fcmge v12.4s, v2.4s, v17.4s
0x5b539d074e0  1020  6ea2e650       fcmgt v16.4s, v18.4s, v2.4s
0x5b539d074e4  1024  4e301d8c       and v12.16b, v12.16b, v16.16b
0x5b539d074e8  1028  4ea0c842       fcmgt v2.4s, v2.4s, #0.0
0x5b539d074ec  102c  4e341c42       and v2.16b, v2.16b, v20.16b
0x5b539d074f0  1030  4e21d842       scvtf v2.4s, v2.4s
0x5b539d074f4  1034  4e221d82       and v2.16b, v12.16b, v2.16b
0x5b539d074f8  1038  4e3bd45b       fadd v27.4s, v2.4s, v27.4s
0x5b539d074fc  103c  3cb36b3b       str q27, [x25, x19]
0x5b539d07500  1040  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x5b539d07504  1044  4e3ad53a       fadd v26.4s, v9.4s, v26.4s
0x5b539d07508  1048  3cb76b3a       str q26, [x25, x23]
0x5b539d0750c  104c  6e22dd08       fmul v8.4s, v8.4s, v2.4s
0x5b539d07510  1050  4e37d517       fadd v23.4s, v8.4s, v23.4s
0x5b539d07514  1054  3ca06b37       str q23, [x25, x0]
0x5b539d07518  1058  6e22dd48       fmul v8.4s, v10.4s, v2.4s
0x5b539d0751c  105c  4e38d518       fadd v24.4s, v8.4s, v24.4s
0x5b539d07520  1060  3cb56b38       str q24, [x25, x21]
0x5b539d07524  1064  6e22dda2       fmul v2.4s, v13.4s, v2.4s
0x5b539d07528  1068  4e22d739       fadd v25.4s, v25.4s, v2.4s
0x5b539d0752c  106c  3caa6b39       str q25, [x25, x10]
0x5b539d07530  1070  110081e9       add w9, w15, #0x20 (32)
0x5b539d07534  1074  3ce96b22       ldr q2, [x25, x9]
0x5b539d07538  1078  11008309       add w9, w24, #0x20 (32)
0x5b539d0753c  107c  3ce96b28       ldr q8, [x25, x9]
0x5b539d07540  1080  11008109       add w9, w8, #0x20 (32)
0x5b539d07544  1084  3ce96b29       ldr q9, [x25, x9]
0x5b539d07548  1088  4ea9d56a       fsub v10.4s, v11.4s, v9.4s
0x5b539d0754c  108c  11008369       add w9, w27, #0x20 (32)
0x5b539d07550  1090  3ce96b2c       ldr q12, [x25, x9]
0x5b539d07554  1094  4eacd5cd       fsub v13.4s, v14.4s, v12.4s
0x5b539d07558  1098  6e2dddb0       fmul v16.4s, v13.4s, v13.4s
0x5b539d0755c  109c  6e2add53       fmul v19.4s, v10.4s, v10.4s
0x5b539d07560  10a0  4e33d610       fadd v16.4s, v16.4s, v19.4s
0x5b539d07564  10a4  6eb0e633       fcmgt v19.4s, v17.4s, v16.4s
0x5b539d07568  10a8  4e341e73       and v19.16b, v19.16b, v20.16b
0x5b539d0756c  10ac  4e21da73       scvtf v19.4s, v19.4s
0x5b539d07570  10b0  6e33dd4a       fmul v10.4s, v10.4s, v19.4s
0x5b539d07574  10b4  4e2ad6d6       fadd v22.4s, v22.4s, v10.4s
0x5b539d07578  10b8  3cbc6b36       str q22, [x25, x28]
0x5b539d0757c  10bc  6e33ddaa       fmul v10.4s, v13.4s, v19.4s
0x5b539d07580  10c0  4e2ad6b5       fadd v21.4s, v21.4s, v10.4s
0x5b539d07584  10c4  3ca46b35       str q21, [x25, x4]
0x5b539d07588  10c8  6e31e60a       fcmge v10.4s, v16.4s, v17.4s
0x5b539d0758c  10cc  6eb0e64d       fcmgt v13.4s, v18.4s, v16.4s
0x5b539d07590  10d0  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x5b539d07594  10d4  4ea0ca0d       fcmgt v13.4s, v16.4s, #0.0
0x5b539d07598  10d8  4e341dad       and v13.16b, v13.16b, v20.16b
0x5b539d0759c  10dc  4e21d9ad       scvtf v13.4s, v13.4s
0x5b539d075a0  10e0  4e2d1d4a       and v10.16b, v10.16b, v13.16b
0x5b539d075a4  10e4  3dc047ed       ldr q13, [sp, #272]
0x5b539d075a8  10e8  4e2dd54d       fadd v13.4s, v10.4s, v13.4s
0x5b539d075ac  10ec  3ca66b2d       str q13, [x25, x6]
0x5b539d075b0  10f0  6e2add08       fmul v8.4s, v8.4s, v10.4s
0x5b539d075b4  10f4  3dc04bf3       ldr q19, [sp, #288]
0x5b539d075b8  10f8  4e33d513       fadd v19.4s, v8.4s, v19.4s
0x5b539d075bc  10fc  3cac6b33       str q19, [x25, x12]
0x5b539d075c0  1100  6e2adc42       fmul v2.4s, v2.4s, v10.4s
0x5b539d075c4  1104  3dc04ff0       ldr q16, [sp, #304]
0x5b539d075c8  1108  4e30d450       fadd v16.4s, v2.4s, v16.4s
0x5b539d075cc  110c  f9419be9       ldr x9, [sp, #816]
0x5b539d075d0  1110  3ca96b30       str q16, [x25, x9]
0x5b539d075d4  1114  6e2add22       fmul v2.4s, v9.4s, v10.4s
0x5b539d075d8  1118  3dc053e8       ldr q8, [sp, #320]
0x5b539d075dc  111c  4e28d442       fadd v2.4s, v2.4s, v8.4s
0x5b539d075e0  1120  f9419fe9       ldr x9, [sp, #824]
0x5b539d075e4  1124  3ca96b22       str q2, [x25, x9]
0x5b539d075e8  1128  6e2add88       fmul v8.4s, v12.4s, v10.4s
0x5b539d075ec  112c  3dc057e9       ldr q9, [sp, #336]
0x5b539d075f0  1130  4e28d528       fadd v8.4s, v9.4s, v8.4s
0x5b539d075f4  1134  f941b3e9       ldr x9, [sp, #864]
0x5b539d075f8  1138  3ca96b28       str q8, [x25, x9]
0x5b539d075fc  113c  1100c1ef       add w15, w15, #0x30 (48)
0x5b539d07600  1140  3cef6b29       ldr q9, [x25, x15]
0x5b539d07604  1144  1100c30f       add w15, w24, #0x30 (48)
0x5b539d07608  1148  3cef6b2a       ldr q10, [x25, x15]
0x5b539d0760c  114c  1100c108       add w8, w8, #0x30 (48)
0x5b539d07610  1150  3ce86b2c       ldr q12, [x25, x8]
0x5b539d07614  1154  3d8053e2       str q2, [sp, #320]
0x5b539d07618  1158  4eacd562       fsub v2.4s, v11.4s, v12.4s
0x5b539d0761c  115c  1100c368       add w8, w27, #0x30 (48)
0x5b539d07620  1160  3ce86b2b       ldr q11, [x25, x8]
0x5b539d07624  1164  3d8087e3       str q3, [sp, #528]
0x5b539d07628  1168  4eabd5c3       fsub v3.4s, v14.4s, v11.4s
0x5b539d0762c  116c  6e23dc6e       fmul v14.4s, v3.4s, v3.4s
0x5b539d07630  1170  3d8083e4       str q4, [sp, #512]
0x5b539d07634  1174  6e22dc44       fmul v4.4s, v2.4s, v2.4s
0x5b539d07638  1178  4e24d5c4       fadd v4.4s, v14.4s, v4.4s
0x5b539d0763c  117c  6ea4e62e       fcmgt v14.4s, v17.4s, v4.4s
0x5b539d07640  1180  4e341dce       and v14.16b, v14.16b, v20.16b
0x5b539d07644  1184  4e21d9ce       scvtf v14.4s, v14.4s
0x5b539d07648  1188  6e2edc42       fmul v2.4s, v2.4s, v14.4s
0x5b539d0764c  118c  3d807fe5       str q5, [sp, #496]
0x5b539d07650  1190  3dc03fe5       ldr q5, [sp, #240]
0x5b539d07654  1194  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x5b539d07658  1198  f941b7e8       ldr x8, [sp, #872]
0x5b539d0765c  119c  3ca86b22       str q2, [x25, x8]
0x5b539d07660  11a0  6e2edc63       fmul v3.4s, v3.4s, v14.4s
0x5b539d07664  11a4  3dc043e5       ldr q5, [sp, #256]
0x5b539d07668  11a8  4e23d4a3       fadd v3.4s, v5.4s, v3.4s
0x5b539d0766c  11ac  f941d3ef       ldr x15, [sp, #928]
0x5b539d07670  11b0  3caf6b23       str q3, [x25, x15]
0x5b539d07674  11b4  6e31e485       fcmge v5.4s, v4.4s, v17.4s
0x5b539d07678  11b8  6ea4e64e       fcmgt v14.4s, v18.4s, v4.4s
0x5b539d0767c  11bc  4e2e1ca5       and v5.16b, v5.16b, v14.16b
0x5b539d07680  11c0  4ea0c884       fcmgt v4.4s, v4.4s, #0.0
0x5b539d07684  11c4  4e341c84       and v4.16b, v4.16b, v20.16b
0x5b539d07688  11c8  4e21d884       scvtf v4.4s, v4.4s
0x5b539d0768c  11cc  4e241ca4       and v4.16b, v5.16b, v4.16b
0x5b539d07690  11d0  3dc02be5       ldr q5, [sp, #160]
0x5b539d07694  11d4  4e25d485       fadd v5.4s, v4.4s, v5.4s
0x5b539d07698  11d8  f941d7f8       ldr x24, [sp, #936]
0x5b539d0769c  11dc  3cb86b25       str q5, [x25, x24]
0x5b539d076a0  11e0  6e24dd4a       fmul v10.4s, v10.4s, v4.4s
0x5b539d076a4  11e4  3dc02fee       ldr q14, [sp, #176]
0x5b539d076a8  11e8  4e2ed54a       fadd v10.4s, v10.4s, v14.4s
0x5b539d076ac  11ec  f941dbfb       ldr cp, [sp, #944]
0x5b539d076b0  11f0  3cbb6b2a       str q10, [x25, x27]
0x5b539d076b4  11f4  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x5b539d076b8  11f8  3dc033ee       ldr q14, [sp, #192]
0x5b539d076bc  11fc  4e2ed529       fadd v9.4s, v9.4s, v14.4s
0x5b539d076c0  1200  f941dffb       ldr cp, [sp, #952]
0x5b539d076c4  1204  3cbb6b29       str q9, [x25, x27]
0x5b539d076c8  1208  6e24dd8c       fmul v12.4s, v12.4s, v4.4s
0x5b539d076cc  120c  3dc037ee       ldr q14, [sp, #208]
0x5b539d076d0  1210  4e2ed58c       fadd v12.4s, v12.4s, v14.4s
0x5b539d076d4  1214  f941e3fb       ldr cp, [sp, #960]
0x5b539d076d8  1218  3cbb6b2c       str q12, [x25, x27]
0x5b539d076dc  121c  6e24dd64       fmul v4.4s, v11.4s, v4.4s
0x5b539d076e0  1220  3dc03beb       ldr q11, [sp, #224]
0x5b539d076e4  1224  4e24d564       fadd v4.4s, v11.4s, v4.4s
0x5b539d076e8  1228  f941e7fb       ldr cp, [sp, #968]
0x5b539d076ec  122c  3cbb6b24       str q4, [x25, x27]
0x5b539d076f0  1230  110102d6       add w22, w22, #0x40 (64)
0x5b539d076f4  1234  f94133fb       ldr cp, [sp, #608]
0x5b539d076f8  1238  5100077b       sub w27, w27, #0x1 (1)
0x5b539d076fc  123c  35ffe35b       cbnz w27, #-0x398 (addr 0x5b539d07364)
0x5b539d07700  1240  3d802be5       str q5, [sp, #160]
0x5b539d07704  1244  3d802fea       str q10, [sp, #176]
0x5b539d07708  1248  3d8033e9       str q9, [sp, #192]
0x5b539d0770c  124c  4ea21c4b       mov v11.16b, v2.16b
0x5b539d07710  1250  3dc08be2       ldr q2, [sp, #544]
0x5b539d07714  1254  4ea31c6a       mov v10.16b, v3.16b
0x5b539d07718  1258  3dc087e3       ldr q3, [sp, #528]
0x5b539d0771c  125c  4eac1d8e       mov v14.16b, v12.16b
0x5b539d07720  1260  4ea41c8c       mov v12.16b, v4.16b
0x5b539d07724  1264  3dc083e4       ldr q4, [sp, #512]
0x5b539d07728  1268  3dc07fe5       ldr q5, [sp, #496]
0x5b539d0772c  126c  3dc053e9       ldr q9, [sp, #320]
0x5b539d07730  1270  3d8097e6       str q6, [sp, #592]
0x5b539d07734  1274  3d8093e7       str q7, [sp, #576]
0x5b539d07738  1278  3d808be2       str q2, [sp, #544]
0x5b539d0773c  127c  3d8087e3       str q3, [sp, #528]
0x5b539d07740  1280  3d8083e4       str q4, [sp, #512]
0x5b539d07744  1284  3d807fe5       str q5, [sp, #496]
0x5b539d07748  1288  3d805ff5       str q21, [sp, #368]
0x5b539d0774c  128c  3d805bf6       str q22, [sp, #352]
0x5b539d07750  1290  3d8057e8       str q8, [sp, #336]
0x5b539d07754  1294  3d8053e9       str q9, [sp, #320]
0x5b539d07758  1298  3d804ff0       str q16, [sp, #304]
0x5b539d0775c  129c  3d804bf3       str q19, [sp, #288]
0x5b539d07760  12a0  3d8047ed       str q13, [sp, #272]
0x5b539d07764  12a4  3d8043ea       str q10, [sp, #256]
0x5b539d07768  12a8  3d803feb       str q11, [sp, #240]
0x5b539d0776c  12ac  3d803bec       str q12, [sp, #224]
0x5b539d07770  12b0  3d8037ee       str q14, [sp, #208]
0x5b539d07774  12b4  f941ebf6       ldr x22, [sp, #976]
0x5b539d07778  12b8  34002e76       cbz w22, #+0x5cc (addr 0x5b539d07d44)
0x5b539d0777c  12bc  f9414bfb       ldr cp, [sp, #656]
0x5b539d07780  12c0  51004378       sub w24, w27, #0x10 (16)
0x5b539d07784  12c4  d280000f       movz x15, #0x0
0x5b539d07788  12c8  6b18037f       cmp w27, w24
0x5b539d0778c  12cc  1a9831e8       csel w8, w15, w24, lo
0x5b539d07790  12d0  11004118       add w24, w8, #0x10 (16)
0x5b539d07794  12d4  f94137ef       ldr x15, [sp, #616]
0x5b539d07798  12d8  6b1801ff       cmp w15, w24
0x5b539d0779c  12dc  54002d43       b.lo #+0x5a8 (addr 0x5b539d07d44)
0x5b539d077a0  12e0  f9413bef       ldr x15, [sp, #624]
0x5b539d077a4  12e4  6b1801ff       cmp w15, w24
0x5b539d077a8  12e8  54002cc3       b.lo #+0x598 (addr 0x5b539d07d40)
0x5b539d077ac  12ec  531e7518       lsl w24, w8, #2
0x5b539d077b0  12f0  f9413fef       ldr x15, [sp, #632]
0x5b539d077b4  12f4  0b1801e9       add w9, w15, w24
0x5b539d077b8  12f8  3ce96b2c       ldr q12, [x25, x9]
0x5b539d077bc  12fc  f94143ef       ldr x15, [sp, #640]
0x5b539d077c0  1300  0b1801ec       add w12, w15, w24
0x5b539d077c4  1304  3cec6b2e       ldr q14, [x25, x12]
0x5b539d077c8  1308  f94147ef       ldr x15, [sp, #648]
0x5b539d077cc  130c  0b1801e6       add w6, w15, w24
0x5b539d077d0  1310  3ce66b2a       ldr q10, [x25, x6]
0x5b539d077d4  1314  3dc0d3eb       ldr q11, [sp, #832]
0x5b539d077d8  1318  4eaad568       fsub v8.4s, v11.4s, v10.4s
0x5b539d077dc  131c  4b080368       sub w8, w27, w8
0x5b539d077e0  1320  6b16011f       cmp w8, w22
0x5b539d077e4  1324  9a9f17fb       cset cp, eq
0x5b539d077e8  1328  4e040f69       dup v9.4s, w27
0x5b539d077ec  132c  4b160116       sub w22, w8, w22
0x5b539d077f0  1330  d280003b       movz cp, #0x1
0x5b539d077f4  1334  6b08037f       cmp w27, w8
0x5b539d077f8  1338  7a423ac2       ccmp w22, #2, #nzCv, lo
0x5b539d077fc  133c  9a9f27ef       cset x15, lo
0x5b539d07800  1340  4e0c1de9       mov v9.s[1], w15
0x5b539d07804  1344  d280004f       movz x15, #0x2
0x5b539d07808  1348  6b0801ff       cmp w15, w8
0x5b539d0780c  134c  7a433ac2       ccmp w22, #3, #nzCv, lo
0x5b539d07810  1350  9a9f27fb       cset cp, lo
0x5b539d07814  1354  4e141f69       mov v9.s[2], w27
0x5b539d07818  1358  d280007b       movz cp, #0x3
0x5b539d0781c  135c  6b08037f       cmp w27, w8
0x5b539d07820  1360  7a443ac2       ccmp w22, #4, #nzCv, lo
0x5b539d07824  1364  9a9f27fb       cset cp, lo
0x5b539d07828  1368  4e1c1f69       mov v9.s[3], w27
0x5b539d0782c  136c  4e21d929       scvtf v9.4s, v9.4s
0x5b539d07830  1370  f9414ffb       ldr cp, [sp, #664]
0x5b539d07834  1374  0b180378       add w24, w27, w24
0x5b539d07838  1378  3cf86b30       ldr q16, [x25, x24]
0x5b539d0783c  137c  3dc0d7f3       ldr q19, [sp, #848]
0x5b539d07840  1380  4eb0d66d       fsub v13.4s, v19.4s, v16.4s
0x5b539d07844  1384  6e2dddb5       fmul v21.4s, v13.4s, v13.4s
0x5b539d07848  1388  6e28dd16       fmul v22.4s, v8.4s, v8.4s
0x5b539d0784c  138c  4e36d6b5       fadd v21.4s, v21.4s, v22.4s
0x5b539d07850  1390  6eb5e636       fcmgt v22.4s, v17.4s, v21.4s
0x5b539d07854  1394  4e341ed6       and v22.16b, v22.16b, v20.16b
0x5b539d07858  1398  4e21dad6       scvtf v22.4s, v22.4s
0x5b539d0785c  139c  6e36dd36       fmul v22.4s, v9.4s, v22.4s
0x5b539d07860  13a0  6e36dd08       fmul v8.4s, v8.4s, v22.4s
0x5b539d07864  13a4  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0x5b539d07868  13a8  3cb46b27       str q7, [x25, x20]
0x5b539d0786c  13ac  6e36dda8       fmul v8.4s, v13.4s, v22.4s
0x5b539d07870  13b0  4e28d4c6       fadd v6.4s, v6.4s, v8.4s
0x5b539d07874  13b4  3cab6b26       str q6, [x25, x11]
0x5b539d07878  13b8  6e31e6a8       fcmge v8.4s, v21.4s, v17.4s
0x5b539d0787c  13bc  6eb5e64d       fcmgt v13.4s, v18.4s, v21.4s
0x5b539d07880  13c0  4e2d1d08       and v8.16b, v8.16b, v13.16b
0x5b539d07884  13c4  4ea0caad       fcmgt v13.4s, v21.4s, #0.0
0x5b539d07888  13c8  4e341dad       and v13.16b, v13.16b, v20.16b
0x5b539d0788c  13cc  4e21d9ad       scvtf v13.4s, v13.4s
0x5b539d07890  13d0  4e2d1d08       and v8.16b, v8.16b, v13.16b
0x5b539d07894  13d4  6e29dd08       fmul v8.4s, v8.4s, v9.4s
0x5b539d07898  13d8  4e25d505       fadd v5.4s, v8.4s, v5.4s
0x5b539d0789c  13dc  3cad6b25       str q5, [x25, x13]
0x5b539d078a0  13e0  6e28ddc9       fmul v9.4s, v14.4s, v8.4s
0x5b539d078a4  13e4  4e24d524       fadd v4.4s, v9.4s, v4.4s
0x5b539d078a8  13e8  3ca76b24       str q4, [x25, x7]
0x5b539d078ac  13ec  6e28dd89       fmul v9.4s, v12.4s, v8.4s
0x5b539d078b0  13f0  4e23d523       fadd v3.4s, v9.4s, v3.4s
0x5b539d078b4  13f4  3ca56b23       str q3, [x25, x5]
0x5b539d078b8  13f8  6e28dd49       fmul v9.4s, v10.4s, v8.4s
0x5b539d078bc  13fc  4e22d522       fadd v2.4s, v9.4s, v2.4s
0x5b539d078c0  1400  3ca36b22       str q2, [x25, x3]
0x5b539d078c4  1404  6e28de08       fmul v8.4s, v16.4s, v8.4s
0x5b539d078c8  1408  4e28d428       fadd v8.4s, v1.4s, v8.4s
0x5b539d078cc  140c  3ca26b28       str q8, [x25, x2]
0x5b539d078d0  1410  9100412f       add x15, x9, #0x10 (16)
0x5b539d078d4  1414  3cef6b29       ldr q9, [x25, x15]
0x5b539d078d8  1418  9100418f       add x15, x12, #0x10 (16)
0x5b539d078dc  141c  3cef6b2a       ldr q10, [x25, x15]
0x5b539d078e0  1420  910040cf       add x15, x6, #0x10 (16)
0x5b539d078e4  1424  3cef6b2c       ldr q12, [x25, x15]
0x5b539d078e8  1428  4eacd56d       fsub v13.4s, v11.4s, v12.4s
0x5b539d078ec  142c  d2c000b0       movz x16, #0x500000000
0x5b539d078f0  1430  9e67020e       fmov d14, x16
0x5b539d078f4  1434  4e041ece       mov v14.s[0], w22
0x5b539d078f8  1438  d28000b0       movz x16, #0x5
0x5b539d078fc  143c  9e670210       fmov d16, x16
0x5b539d07900  1440  4e0c1d10       mov v16.s[1], w8
0x5b539d07904  1444  6eae360e       cmhi v14.4s, v16.4s, v14.4s
0x5b539d07908  1448  d2c000d0       movz x16, #0x600000000
0x5b539d0790c  144c  9e670210       fmov d16, x16
0x5b539d07910  1450  4e041d10       mov v16.s[0], w8
0x5b539d07914  1454  d2800090       movz x16, #0x4
0x5b539d07918  1458  9e670215       fmov d21, x16
0x5b539d0791c  145c  4e0c1ed5       mov v21.s[1], w22
0x5b539d07920  1460  6eb53610       cmhi v16.4s, v16.4s, v21.4s
0x5b539d07924  1464  4e301dce       and v14.16b, v14.16b, v16.16b
0x5b539d07928  1468  0f20a5ce       sxtl v14.2d, v14.2s
0x5b539d0792c  146c  4eae1dde       mov v30.16b, v14.16b
0x5b539d07930  1470  4e0407ce       dup v14.4s, v30.s[0]
0x5b539d07934  1474  6e0c47ce       mov v14.s[1], v30.s[2]
0x5b539d07938  1478  d28000cf       movz x15, #0x6
0x5b539d0793c  147c  6b0801ff       cmp w15, w8
0x5b539d07940  1480  7a473ac2       ccmp w22, #7, #nzCv, lo
0x5b539d07944  1484  9a9f27ef       cset x15, lo
0x5b539d07948  1488  4e141dee       mov v14.s[2], w15
0x5b539d0794c  148c  d28000ef       movz x15, #0x7
0x5b539d07950  1490  6b0801ff       cmp w15, w8
0x5b539d07954  1494  7a483ac2       ccmp w22, #8, #nzCv, lo
0x5b539d07958  1498  9a9f27ef       cset x15, lo
0x5b539d0795c  149c  4e1c1dee       mov v14.s[3], w15
0x5b539d07960  14a0  4e341dce       and v14.16b, v14.16b, v20.16b
0x5b539d07964  14a4  4e21d9ce       scvtf v14.4s, v14.4s
0x5b539d07968  14a8  9100430f       add x15, x24, #0x10 (16)
0x5b539d0796c  14ac  3cef6b30       ldr q16, [x25, x15]
0x5b539d07970  14b0  4eb0d675       fsub v21.4s, v19.4s, v16.4s
0x5b539d07974  14b4  6e35deb6       fmul v22.4s, v21.4s, v21.4s
0x5b539d07978  14b8  6e2ddda1       fmul v1.4s, v13.4s, v13.4s
0x5b539d0797c  14bc  4e21d6d6       fadd v22.4s, v22.4s, v1.4s
0x5b539d07980  14c0  6eb6e621       fcmgt v1.4s, v17.4s, v22.4s
0x5b539d07984  14c4  4e341c21       and v1.16b, v1.16b, v20.16b
0x5b539d07988  14c8  4e21d821       scvtf v1.4s, v1.4s
0x5b539d0798c  14cc  6e21ddc1       fmul v1.4s, v14.4s, v1.4s
0x5b539d07990  14d0  6e21ddad       fmul v13.4s, v13.4s, v1.4s
0x5b539d07994  14d4  4e2dd40d       fadd v13.4s, v0.4s, v13.4s
0x5b539d07998  14d8  3ca16b2d       str q13, [x25, x1]
0x5b539d0799c  14dc  6e21deb5       fmul v21.4s, v21.4s, v1.4s
0x5b539d079a0  14e0  4e35d795       fadd v21.4s, v28.4s, v21.4s
0x5b539d079a4  14e4  3cae6b35       str q21, [x25, x14]
0x5b539d079a8  14e8  6e31e6dc       fcmge v28.4s, v22.4s, v17.4s
0x5b539d079ac  14ec  6eb6e640       fcmgt v0.4s, v18.4s, v22.4s
0x5b539d079b0  14f0  4e201f9c       and v28.16b, v28.16b, v0.16b
0x5b539d079b4  14f4  4ea0cad6       fcmgt v22.4s, v22.4s, #0.0
0x5b539d079b8  14f8  4e341ed6       and v22.16b, v22.16b, v20.16b
0x5b539d079bc  14fc  4e21dad6       scvtf v22.4s, v22.4s
0x5b539d079c0  1500  4e361f96       and v22.16b, v28.16b, v22.16b
0x5b539d079c4  1504  6e2edece       fmul v14.4s, v22.4s, v14.4s
0x5b539d079c8  1508  4e3bd5d6       fadd v22.4s, v14.4s, v27.4s
0x5b539d079cc  150c  3cb36b36       str q22, [x25, x19]
0x5b539d079d0  1510  6e2edd4a       fmul v10.4s, v10.4s, v14.4s
0x5b539d079d4  1514  4e3ad54a       fadd v10.4s, v10.4s, v26.4s
0x5b539d079d8  1518  3cb76b2a       str q10, [x25, x23]
0x5b539d079dc  151c  6e2edd29       fmul v9.4s, v9.4s, v14.4s
0x5b539d079e0  1520  4e37d537       fadd v23.4s, v9.4s, v23.4s
0x5b539d079e4  1524  3ca06b37       str q23, [x25, x0]
0x5b539d079e8  1528  6e2edd89       fmul v9.4s, v12.4s, v14.4s
0x5b539d079ec  152c  4e38d538       fadd v24.4s, v9.4s, v24.4s
0x5b539d079f0  1530  3cb56b38       str q24, [x25, x21]
0x5b539d079f4  1534  6e2ede09       fmul v9.4s, v16.4s, v14.4s
0x5b539d079f8  1538  4e29d739       fadd v25.4s, v25.4s, v9.4s
0x5b539d079fc  153c  3caa6b39       str q25, [x25, x10]
0x5b539d07a00  1540  9100812f       add x15, x9, #0x20 (32)
0x5b539d07a04  1544  3cef6b29       ldr q9, [x25, x15]
0x5b539d07a08  1548  9100818f       add x15, x12, #0x20 (32)
0x5b539d07a0c  154c  3cef6b2c       ldr q12, [x25, x15]
0x5b539d07a10  1550  910080cf       add x15, x6, #0x20 (32)
0x5b539d07a14  1554  3cef6b2e       ldr q14, [x25, x15]
0x5b539d07a18  1558  4eaed570       fsub v16.4s, v11.4s, v14.4s
0x5b539d07a1c  155c  d2c00130       movz x16, #0x900000000
0x5b539d07a20  1560  9e67021a       fmov d26, x16
0x5b539d07a24  1564  4e041eda       mov v26.s[0], w22
0x5b539d07a28  1568  d2800130       movz x16, #0x9
0x5b539d07a2c  156c  9e67021b       fmov d27, x16
0x5b539d07a30  1570  4e0c1d1b       mov v27.s[1], w8
0x5b539d07a34  1574  6eba377a       cmhi v26.4s, v27.4s, v26.4s
0x5b539d07a38  1578  d2c00150       movz x16, #0xa00000000
0x5b539d07a3c  157c  9e67021b       fmov d27, x16
0x5b539d07a40  1580  4e041d1b       mov v27.s[0], w8
0x5b539d07a44  1584  d2800110       movz x16, #0x8
0x5b539d07a48  1588  9e67021c       fmov d28, x16
0x5b539d07a4c  158c  4e0c1edc       mov v28.s[1], w22
0x5b539d07a50  1590  6ebc377b       cmhi v27.4s, v27.4s, v28.4s
0x5b539d07a54  1594  4e3b1f5a       and v26.16b, v26.16b, v27.16b
0x5b539d07a58  1598  0f20a75a       sxtl v26.2d, v26.2s
0x5b539d07a5c  159c  4eba1f5e       mov v30.16b, v26.16b
0x5b539d07a60  15a0  4e0407da       dup v26.4s, v30.s[0]
0x5b539d07a64  15a4  6e0c47da       mov v26.s[1], v30.s[2]
0x5b539d07a68  15a8  d280014f       movz x15, #0xa
0x5b539d07a6c  15ac  6b0801ff       cmp w15, w8
0x5b539d07a70  15b0  7a4b3ac2       ccmp w22, #11, #nzCv, lo
0x5b539d07a74  15b4  9a9f27ef       cset x15, lo
0x5b539d07a78  15b8  4e141dfa       mov v26.s[2], w15
0x5b539d07a7c  15bc  d280016f       movz x15, #0xb
0x5b539d07a80  15c0  6b0801ff       cmp w15, w8
0x5b539d07a84  15c4  7a4c3ac2       ccmp w22, #12, #nzCv, lo
0x5b539d07a88  15c8  9a9f27ef       cset x15, lo
0x5b539d07a8c  15cc  4e1c1dfa       mov v26.s[3], w15
0x5b539d07a90  15d0  4e341f5a       and v26.16b, v26.16b, v20.16b
0x5b539d07a94  15d4  4e21db5a       scvtf v26.4s, v26.4s
0x5b539d07a98  15d8  9100830f       add x15, x24, #0x20 (32)
0x5b539d07a9c  15dc  3cef6b3b       ldr q27, [x25, x15]
0x5b539d07aa0  15e0  4ebbd67c       fsub v28.4s, v19.4s, v27.4s
0x5b539d07aa4  15e4  6e3cdf80       fmul v0.4s, v28.4s, v28.4s
0x5b539d07aa8  15e8  6e30de01       fmul v1.4s, v16.4s, v16.4s
0x5b539d07aac  15ec  4e21d400       fadd v0.4s, v0.4s, v1.4s
0x5b539d07ab0  15f0  6ea0e621       fcmgt v1.4s, v17.4s, v0.4s
0x5b539d07ab4  15f4  4e341c21       and v1.16b, v1.16b, v20.16b
0x5b539d07ab8  15f8  4e21d821       scvtf v1.4s, v1.4s
0x5b539d07abc  15fc  6e21df41       fmul v1.4s, v26.4s, v1.4s
0x5b539d07ac0  1600  6e21de10       fmul v16.4s, v16.4s, v1.4s
0x5b539d07ac4  1604  3d808be2       str q2, [sp, #544]
0x5b539d07ac8  1608  3dc05be2       ldr q2, [sp, #352]
0x5b539d07acc  160c  4e30d442       fadd v2.4s, v2.4s, v16.4s
0x5b539d07ad0  1610  3cbc6b22       str q2, [x25, x28]
0x5b539d07ad4  1614  6e21df90       fmul v16.4s, v28.4s, v1.4s
0x5b539d07ad8  1618  3dc05ffc       ldr q28, [sp, #368]
0x5b539d07adc  161c  4e30d790       fadd v16.4s, v28.4s, v16.4s
0x5b539d07ae0  1620  3ca46b30       str q16, [x25, x4]
0x5b539d07ae4  1624  6e31e41c       fcmge v28.4s, v0.4s, v17.4s
0x5b539d07ae8  1628  6ea0e641       fcmgt v1.4s, v18.4s, v0.4s
0x5b539d07aec  162c  4e211f9c       and v28.16b, v28.16b, v1.16b
0x5b539d07af0  1630  4ea0c800       fcmgt v0.4s, v0.4s, #0.0
0x5b539d07af4  1634  4e341c00       and v0.16b, v0.16b, v20.16b
0x5b539d07af8  1638  4e21d800       scvtf v0.4s, v0.4s
0x5b539d07afc  163c  4e201f9c       and v28.16b, v28.16b, v0.16b
0x5b539d07b00  1640  6e3adf9a       fmul v26.4s, v28.4s, v26.4s
0x5b539d07b04  1644  3dc047fc       ldr q28, [sp, #272]
0x5b539d07b08  1648  4e3cd75c       fadd v28.4s, v26.4s, v28.4s
0x5b539d07b0c  164c  f94193ef       ldr x15, [sp, #800]
0x5b539d07b10  1650  3caf6b3c       str q28, [x25, x15]
0x5b539d07b14  1654  6e3add8c       fmul v12.4s, v12.4s, v26.4s
0x5b539d07b18  1658  3dc04be0       ldr q0, [sp, #288]
0x5b539d07b1c  165c  4e20d58c       fadd v12.4s, v12.4s, v0.4s
0x5b539d07b20  1660  f94197ea       ldr x10, [sp, #808]
0x5b539d07b24  1664  3caa6b2c       str q12, [x25, x10]
0x5b539d07b28  1668  6e3add29       fmul v9.4s, v9.4s, v26.4s
0x5b539d07b2c  166c  3dc04fe0       ldr q0, [sp, #304]
0x5b539d07b30  1670  4e20d529       fadd v9.4s, v9.4s, v0.4s
0x5b539d07b34  1674  f9419bea       ldr x10, [sp, #816]
0x5b539d07b38  1678  3caa6b29       str q9, [x25, x10]
0x5b539d07b3c  167c  6e3addce       fmul v14.4s, v14.4s, v26.4s
0x5b539d07b40  1680  3dc053e0       ldr q0, [sp, #320]
0x5b539d07b44  1684  4e20d5ce       fadd v14.4s, v14.4s, v0.4s
0x5b539d07b48  1688  f9419fea       ldr x10, [sp, #824]
0x5b539d07b4c  168c  3caa6b2e       str q14, [x25, x10]
0x5b539d07b50  1690  6e3adf7a       fmul v26.4s, v27.4s, v26.4s
0x5b539d07b54  1694  3dc057fb       ldr q27, [sp, #336]
0x5b539d07b58  1698  4e3ad77a       fadd v26.4s, v27.4s, v26.4s
0x5b539d07b5c  169c  f941b3ea       ldr x10, [sp, #864]
0x5b539d07b60  16a0  3caa6b3a       str q26, [x25, x10]
0x5b539d07b64  16a4  9100c129       add x9, x9, #0x30 (48)
0x5b539d07b68  16a8  3ce96b3b       ldr q27, [x25, x9]
0x5b539d07b6c  16ac  9100c189       add x9, x12, #0x30 (48)
0x5b539d07b70  16b0  3ce96b20       ldr q0, [x25, x9]
0x5b539d07b74  16b4  9100c0c6       add x6, x6, #0x30 (48)
0x5b539d07b78  16b8  3ce66b21       ldr q1, [x25, x6]
0x5b539d07b7c  16bc  3d805be2       str q2, [sp, #352]
0x5b539d07b80  16c0  4ea1d562       fsub v2.4s, v11.4s, v1.4s
0x5b539d07b84  16c4  d2c001b0       movz x16, #0xd00000000
0x5b539d07b88  16c8  9e67020b       fmov d11, x16
0x5b539d07b8c  16cc  4e041ecb       mov v11.s[0], w22
0x5b539d07b90  16d0  3d8087e3       str q3, [sp, #528]
0x5b539d07b94  16d4  d28001b0       movz x16, #0xd
0x5b539d07b98  16d8  9e670203       fmov d3, x16
0x5b539d07b9c  16dc  4e0c1d03       mov v3.s[1], w8
0x5b539d07ba0  16e0  6eab3463       cmhi v3.4s, v3.4s, v11.4s
0x5b539d07ba4  16e4  d2c001d0       movz x16, #0xe00000000
0x5b539d07ba8  16e8  9e67020b       fmov d11, x16
0x5b539d07bac  16ec  4e041d0b       mov v11.s[0], w8
0x5b539d07bb0  16f0  3d8083e4       str q4, [sp, #512]
0x5b539d07bb4  16f4  d2800190       movz x16, #0xc
0x5b539d07bb8  16f8  9e670204       fmov d4, x16
0x5b539d07bbc  16fc  4e0c1ec4       mov v4.s[1], w22
0x5b539d07bc0  1700  6ea43564       cmhi v4.4s, v11.4s, v4.4s
0x5b539d07bc4  1704  4e241c63       and v3.16b, v3.16b, v4.16b
0x5b539d07bc8  1708  0f20a463       sxtl v3.2d, v3.2s
0x5b539d07bcc  170c  4ea31c7e       mov v30.16b, v3.16b
0x5b539d07bd0  1710  4e0407c3       dup v3.4s, v30.s[0]
0x5b539d07bd4  1714  6e0c47c3       mov v3.s[1], v30.s[2]
0x5b539d07bd8  1718  d28001c6       movz x6, #0xe
0x5b539d07bdc  171c  6b0800df       cmp w6, w8
0x5b539d07be0  1720  7a4f3ac2       ccmp w22, #15, #nzCv, lo
0x5b539d07be4  1724  9a9f27e6       cset x6, lo
0x5b539d07be8  1728  4e141cc3       mov v3.s[2], w6
0x5b539d07bec  172c  d28001e6       movz x6, #0xf
0x5b539d07bf0  1730  6b0800df       cmp w6, w8
0x5b539d07bf4  1734  7a503ac2       ccmp w22, #16, #nzCv, lo
0x5b539d07bf8  1738  9a9f27e6       cset x6, lo
0x5b539d07bfc  173c  4e1c1cc3       mov v3.s[3], w6
0x5b539d07c00  1740  4e341c63       and v3.16b, v3.16b, v20.16b
0x5b539d07c04  1744  4e21d863       scvtf v3.4s, v3.4s
0x5b539d07c08  1748  9100c306       add x6, x24, #0x30 (48)
0x5b539d07c0c  174c  3ce66b24       ldr q4, [x25, x6]
0x5b539d07c10  1750  4ea4d66b       fsub v11.4s, v19.4s, v4.4s
0x5b539d07c14  1754  6e2bdd73       fmul v19.4s, v11.4s, v11.4s
0x5b539d07c18  1758  3d807fe5       str q5, [sp, #496]
0x5b539d07c1c  175c  6e22dc45       fmul v5.4s, v2.4s, v2.4s
0x5b539d07c20  1760  4e25d665       fadd v5.4s, v19.4s, v5.4s
0x5b539d07c24  1764  6ea5e633       fcmgt v19.4s, v17.4s, v5.4s
0x5b539d07c28  1768  4e341e73       and v19.16b, v19.16b, v20.16b
0x5b539d07c2c  176c  4e21da73       scvtf v19.4s, v19.4s
0x5b539d07c30  1770  6e33dc73       fmul v19.4s, v3.4s, v19.4s
0x5b539d07c34  1774  6e33dc42       fmul v2.4s, v2.4s, v19.4s
0x5b539d07c38  1778  3d8097e6       str q6, [sp, #592]
0x5b539d07c3c  177c  3dc03fe6       ldr q6, [sp, #240]
0x5b539d07c40  1780  4e22d4c2       fadd v2.4s, v6.4s, v2.4s
0x5b539d07c44  1784  f941b7e6       ldr x6, [sp, #872]
0x5b539d07c48  1788  3ca66b22       str q2, [x25, x6]
0x5b539d07c4c  178c  6e33dd66       fmul v6.4s, v11.4s, v19.4s
0x5b539d07c50  1790  3dc043eb       ldr q11, [sp, #256]
0x5b539d07c54  1794  4e26d566       fadd v6.4s, v11.4s, v6.4s
0x5b539d07c58  1798  f941d3e8       ldr x8, [sp, #928]
0x5b539d07c5c  179c  3ca86b26       str q6, [x25, x8]
0x5b539d07c60  17a0  6e31e4ab       fcmge v11.4s, v5.4s, v17.4s
0x5b539d07c64  17a4  6ea5e653       fcmgt v19.4s, v18.4s, v5.4s
0x5b539d07c68  17a8  4e331d6b       and v11.16b, v11.16b, v19.16b
0x5b539d07c6c  17ac  4ea0c8a5       fcmgt v5.4s, v5.4s, #0.0
0x5b539d07c70  17b0  4e341ca5       and v5.16b, v5.16b, v20.16b
0x5b539d07c74  17b4  4e21d8a5       scvtf v5.4s, v5.4s
0x5b539d07c78  17b8  4e251d65       and v5.16b, v11.16b, v5.16b
0x5b539d07c7c  17bc  6e23dca3       fmul v3.4s, v5.4s, v3.4s
0x5b539d07c80  17c0  3dc02bf3       ldr q19, [sp, #160]
0x5b539d07c84  17c4  4e33d465       fadd v5.4s, v3.4s, v19.4s
0x5b539d07c88  17c8  f941d7e9       ldr x9, [sp, #936]
0x5b539d07c8c  17cc  3ca96b25       str q5, [x25, x9]
0x5b539d07c90  17d0  6e23dc0b       fmul v11.4s, v0.4s, v3.4s
0x5b539d07c94  17d4  3dc02ff3       ldr q19, [sp, #176]
0x5b539d07c98  17d8  4e33d56b       fadd v11.4s, v11.4s, v19.4s
0x5b539d07c9c  17dc  f941dbec       ldr x12, [sp, #944]
0x5b539d07ca0  17e0  3cac6b2b       str q11, [x25, x12]
0x5b539d07ca4  17e4  6e23df73       fmul v19.4s, v27.4s, v3.4s
0x5b539d07ca8  17e8  3dc033fb       ldr q27, [sp, #192]
0x5b539d07cac  17ec  4e3bd673       fadd v19.4s, v19.4s, v27.4s
0x5b539d07cb0  17f0  f941dff8       ldr x24, [sp, #952]
0x5b539d07cb4  17f4  3cb86b33       str q19, [x25, x24]
0x5b539d07cb8  17f8  6e23dc3b       fmul v27.4s, v1.4s, v3.4s
0x5b539d07cbc  17fc  3dc037e0       ldr q0, [sp, #208]
0x5b539d07cc0  1800  4e20d77b       fadd v27.4s, v27.4s, v0.4s
0x5b539d07cc4  1804  f941e3f6       ldr x22, [sp, #960]
0x5b539d07cc8  1808  3cb66b3b       str q27, [x25, x22]
0x5b539d07ccc  180c  6e23dc83       fmul v3.4s, v4.4s, v3.4s
0x5b539d07cd0  1810  3dc03be4       ldr q4, [sp, #224]
0x5b539d07cd4  1814  4e23d483       fadd v3.4s, v4.4s, v3.4s
0x5b539d07cd8  1818  f941e7e6       ldr x6, [sp, #968]
0x5b539d07cdc  181c  3ca66b23       str q3, [x25, x6]
0x5b539d07ce0  1820  aa0a03e9       mov x9, x10
0x5b539d07ce4  1824  f94187ea       ldr x10, [sp, #776]
0x5b539d07ce8  1828  aa0f03e6       mov x6, x15
0x5b539d07cec  182c  f94197ec       ldr x12, [sp, #808]
0x5b539d07cf0  1830  3d802be5       str q5, [sp, #160]
0x5b539d07cf4  1834  3d802feb       str q11, [sp, #176]
0x5b539d07cf8  1838  3d8033f3       str q19, [sp, #192]
0x5b539d07cfc  183c  4ea81d01       mov v1.16b, v8.16b
0x5b539d07d00  1840  4ead1da0       mov v0.16b, v13.16b
0x5b539d07d04  1844  4ebc1f8d       mov v13.16b, v28.16b
0x5b539d07d08  1848  4eb51ebc       mov v28.16b, v21.16b
0x5b539d07d0c  184c  4eb01e15       mov v21.16b, v16.16b
0x5b539d07d10  1850  4ea91d30       mov v16.16b, v9.16b
0x5b539d07d14  1854  4eae1dc9       mov v9.16b, v14.16b
0x5b539d07d18  1858  4ebb1f6e       mov v14.16b, v27.16b
0x5b539d07d1c  185c  4eac1d93       mov v19.16b, v12.16b
0x5b539d07d20  1860  4ea31c6c       mov v12.16b, v3.16b
0x5b539d07d24  1864  4ea21c4b       mov v11.16b, v2.16b
0x5b539d07d28  1868  4eba1f48       mov v8.16b, v26.16b
0x5b539d07d2c  186c  4eaa1d5a       mov v26.16b, v10.16b
0x5b539d07d30  1870  4ea61cca       mov v10.16b, v6.16b
0x5b539d07d34  1874  4eb61edb       mov v27.16b, v22.16b
0x5b539d07d38  1878  3dc05bf6       ldr q22, [sp, #352]
0x5b539d07d3c  187c  1400005b       b #+0x16c (addr 0x5b539d07ea8)
0x5b539d07d40  1880  f941e3e8       ldr x8, [sp, #960]
0x5b539d07d44  1884  f94223ef       ldr x15, [sp, #1088]
0x5b539d07d48  1888  12000de8       and w8, w15, #0xf
0x5b539d07d4c  188c  f941eff8       ldr x24, [sp, #984]
0x5b539d07d50  1890  6b16031f       cmp w24, w22
0x5b539d07d54  1894  1a96331b       csel w27, w24, w22, lo
0x5b539d07d58  1898  f941f3f6       ldr x22, [sp, #992]
0x5b539d07d5c  189c  6b1b02df       cmp w22, w27
0x5b539d07d60  18a0  1a9b32d8       csel w24, w22, w27, lo
0x5b539d07d64  18a4  6b18011f       cmp w8, w24
0x5b539d07d68  18a8  1a983116       csel w22, w8, w24, lo
0x5b539d07d6c  18ac  350000f6       cbnz w22, #+0x1c (addr 0x5b539d07d88)
0x5b539d07d70  18b0  3d807fe5       str q5, [sp, #496]
0x5b539d07d74  18b4  3d8083e4       str q4, [sp, #512]
0x5b539d07d78  18b8  3d8087e3       str q3, [sp, #528]
0x5b539d07d7c  18bc  3d808be2       str q2, [sp, #544]
0x5b539d07d80  18c0  3d8097e6       str q6, [sp, #592]
0x5b539d07d84  18c4  14000049       b #+0x124 (addr 0x5b539d07ea8)
0x5b539d07d88  18c8  f941f7e8       ldr x8, [sp, #1000]
0x5b539d07d8c  18cc  121c6108       and w8, w8, #0x1ffffff0
0x5b539d07d90  18d0  f9421ff8       ldr x24, [sp, #1080]
0x5b539d07d94  18d4  0b080b08       add w8, w24, w8, lsl #2
0x5b539d07d98  18d8  121c61ef       and w15, w15, #0x1ffffff0
0x5b539d07d9c  18dc  f94227f8       ldr x24, [sp, #1096]
0x5b539d07da0  18e0  0b0f0b0f       add w15, w24, w15, lsl #2
0x5b539d07da4  18e4  3dc11ff1       ldr q17, [sp, #1136]
0x5b539d07da8  18e8  fd4243f2       ldr d18, [sp, #1152]
0x5b539d07dac  18ec  fd4237f4       ldr d20, [sp, #1128]
0x5b539d07db0  18f0  fd4217e4       ldr d4, [sp, #1064]
0x5b539d07db4  18f4  fd421be5       ldr d5, [sp, #1072]
0x5b539d07db8  18f8  fd422be7       ldr d7, [sp, #1104]
0x5b539d07dbc  18fc  1e2e1006       fmov s6, #0x70 (1.0000)
0x5b539d07dc0  1900  aa0803fb       mov cp, x8
0x5b539d07dc4  1904  f9420be8       ldr x8, [sp, #1040]
0x5b539d07dc8  1908  f94207f8       ldr x24, [sp, #1032]
0x5b539d07dcc  190c  f8520346       ldur x6, [x26, #-224]
0x5b539d07dd0  1910  fd4213e3       ldr d3, [sp, #1056]
0x5b539d07dd4  1914  fd420fe2       ldr d2, [sp, #1048]
0x5b539d07dd8  1918  eb2663ff       cmp sp, x6
0x5b539d07ddc  191c  54003829       b.ls #+0x704 (addr 0x5b539d084e0)
0x5b539d07de0  1920  bc7b6b28       ldr s8, [x25, x27]
0x5b539d07de4  1924  1e283849       fsub s9, s2, s8
0x5b539d07de8  1928  1e290922       fmul s2, s9, s9
0x5b539d07dec  192c  2a1803e6       mov w6, w24
0x5b539d07df0  1930  bc666b2a       ldr s10, [x25, x6]
0x5b539d07df4  1934  1e2a386b       fsub s11, s3, s10
0x5b539d07df8  1938  1e2b0963       fmul s3, s11, s11
0x5b539d07dfc  193c  1e232842       fadd s2, s2, s3
0x5b539d07e00  1940  1e242040       fcmp s2, s4
0x5b539d07e04  1944  54000243       b.lo #+0x48 (addr 0x5b539d07e4c)
0x5b539d07e08  1948  1e252040       fcmp s2, s5
0x5b539d07e0c  194c  54000282       b.hs #+0x50 (addr 0x5b539d07e5c)
0x5b539d07e10  1950  1e202048       fcmp s2, #0.0
0x5b539d07e14  1954  5400024d       b.le #+0x48 (addr 0x5b539d07e5c)
0x5b539d07e18  1958  4e040502       dup v2.4s, v8.s[0]
0x5b539d07e1c  195c  6e0c0542       mov v2.s[1], v10.s[0]
0x5b539d07e20  1960  2a0803e6       mov w6, w8
0x5b539d07e24  1964  bc666b23       ldr s3, [x25, x6]
0x5b539d07e28  1968  6e140462       mov v2.s[2], v3.s[0]
0x5b539d07e2c  196c  bc6f6b23       ldr s3, [x25, x15]
0x5b539d07e30  1970  6e1c0462       mov v2.s[3], v3.s[0]
0x5b539d07e34  1974  4e22d622       fadd v2.4s, v17.4s, v2.4s
0x5b539d07e38  1978  1e262a43       fadd s3, s18, s6
0x5b539d07e3c  197c  4ea21c51       mov v17.16b, v2.16b
0x5b539d07e40  1980  4ea31c72       mov v18.16b, v3.16b
0x5b539d07e44  1984  fd0233e3       str d3, [sp, #1120]
0x5b539d07e48  1988  14000005       b #+0x14 (addr 0x5b539d07e5c)
0x5b539d07e4c  198c  1e2b28e7       fadd s7, s7, s11
0x5b539d07e50  1990  1e292a82       fadd s2, s20, s9
0x5b539d07e54  1994  fd022fe2       str d2, [sp, #1112]
0x5b539d07e58  1998  4ea21c54       mov v20.16b, v2.16b
0x5b539d07e5c  199c  1100137b       add w27, w27, #0x4 (4)
0x5b539d07e60  19a0  11001318       add w24, w24, #0x4 (4)
0x5b539d07e64  19a4  11001108       add w8, w8, #0x4 (4)
0x5b539d07e68  19a8  110011ef       add w15, w15, #0x4 (4)
0x5b539d07e6c  19ac  510006d6       sub w22, w22, #0x1 (1)
0x5b539d07e70  19b0  35fffaf6       cbnz w22, #-0xa4 (addr 0x5b539d07dcc)
0x5b539d07e74  19b4  3d811ff1       str q17, [sp, #1136]
0x5b539d07e78  19b8  fd0243f2       str d18, [sp, #1152]
0x5b539d07e7c  19bc  fd0237f4       str d20, [sp, #1128]
0x5b539d07e80  19c0  f94193e6       ldr x6, [sp, #800]
0x5b539d07e84  19c4  3dc0dff1       ldr q17, [sp, #880]
0x5b539d07e88  19c8  3dc0e3f2       ldr q18, [sp, #896]
0x5b539d07e8c  19cc  fd022be7       str d7, [sp, #1104]
0x5b539d07e90  19d0  3dc093e7       ldr q7, [sp, #576]
0x5b539d07e94  19d4  3dc0e7f4       ldr q20, [sp, #912]
0x5b539d07e98  19d8  3dc03feb       ldr q11, [sp, #240]
0x5b539d07e9c  19dc  3dc043ea       ldr q10, [sp, #256]
0x5b539d07ea0  19e0  3dc053e9       ldr q9, [sp, #320]
0x5b539d07ea4  19e4  3dc057e8       ldr q8, [sp, #336]
0x5b539d07ea8  19e8  f9424fe8       ldr x8, [sp, #1176]
0x5b539d07eac  19ec  1100050f       add w15, w8, #0x1 (1)
0x5b539d07eb0  19f0  f9424bf6       ldr x22, [sp, #1168]
0x5b539d07eb4  19f4  6b16011f       cmp w8, w22
0x5b539d07eb8  19f8  54ff8b01       b.ne #-0xea0 (addr 0x5b539d07018)
0x5b539d07ebc  19fc  fd422be7       ldr d7, [sp, #1104]
0x5b539d07ec0  1a00  f94253e6       ldr x6, [sp, #1184]
0x5b539d07ec4  1a04  bc266b27       str s7, [x25, x6]
0x5b539d07ec8  1a08  f94293e6       ldr x6, [sp, #1312]
0x5b539d07ecc  1a0c  910090c8       add x8, x6, #0x24 (36)
0x5b539d07ed0  1a10  fd422fe6       ldr d6, [sp, #1112]
0x5b539d07ed4  1a14  bc286b26       str s6, [x25, x8]
0x5b539d07ed8  1a18  fd4233e5       ldr d5, [sp, #1120]
0x5b539d07edc  1a1c  f94257e8       ldr x8, [sp, #1192]
0x5b539d07ee0  1a20  bc286b25       str s5, [x25, x8]
0x5b539d07ee4  1a24  3dc11fe2       ldr q2, [sp, #1136]
0x5b539d07ee8  1a28  f9425be8       ldr x8, [sp, #1200]
0x5b539d07eec  1a2c  3ca86b22       str q2, [x25, x8]
0x5b539d07ef0  1a30  14000002       b #+0x8 (addr 0x5b539d07ef8)
0x5b539d07ef4  1a34  f94293e6       ldr x6, [sp, #1312]
0x5b539d07ef8  1a38  110040c2       add w2, w6, #0x10 (16)
0x5b539d07efc  1a3c  f9025be2       str x2, [sp, #1200]
0x5b539d07f00  1a40  f9429be7       ldr x7, [sp, #1328]
0x5b539d07f04  1a44  f9426be0       ldr x0, [sp, #1232]
0x5b539d07f08  1a48  97fc05e6       bl #-0xfe868 (addr 0x5b539c096a0)
0x5b539d07f0c  1a4c  f94293e4       ldr x4, [sp, #1312]
0x5b539d07f10  1a50  1100c083       add w3, w4, #0x30 (48)
0x5b539d07f14  1a54  f9429be7       ldr x7, [sp, #1328]
0x5b539d07f18  1a58  f9426be0       ldr x0, [sp, #1232]
0x5b539d07f1c  1a5c  f94267e2       ldr x2, [sp, #1224]
0x5b539d07f20  1a60  fd4263e0       ldr d0, [sp, #1216]
0x5b539d07f24  1a64  fd425fe1       ldr d1, [sp, #1208]
0x5b539d07f28  1a68  f9425be5       ldr x5, [sp, #1200]
0x5b539d07f2c  1a6c  97fc05de       bl #-0xfe888 (addr 0x5b539c096a4)
0x5b539d07f30  1a70  f9428bf3       ldr x19, [sp, #1296]
0x5b539d07f34  1a74  f9426fe6       ldr x6, [sp, #1240]
0x5b539d07f38  1a78  6b1300df       cmp w6, w19
0x5b539d07f3c  1a7c  54000609       b.ls #+0xc0 (addr 0x5b539d07ffc)
0x5b539d07f40  1a80  f9427fe8       ldr x8, [sp, #1272]
0x5b539d07f44  1a84  f94273e9       ldr x9, [sp, #1248]
0x5b539d07f48  1a88  0b08012a       add w10, w9, w8
0x5b539d07f4c  1a8c  f94293eb       ldr x11, [sp, #1312]
0x5b539d07f50  1a90  9101016c       add x12, x11, #0x40 (64)
0x5b539d07f54  1a94  f94287ed       ldr x13, [sp, #1288]
0x5b539d07f58  1a98  bc6c69a2       ldr s2, [x13, x12]
0x5b539d07f5c  1a9c  bc2a69a2       str s2, [x13, x10]
0x5b539d07f60  1aa0  f94277ea       ldr x10, [sp, #1256]
0x5b539d07f64  1aa4  0b08014c       add w12, w10, w8
0x5b539d07f68  1aa8  9101116e       add x14, x11, #0x44 (68)
0x5b539d07f6c  1aac  bc6e69a2       ldr s2, [x13, x14]
0x5b539d07f70  1ab0  bc2c69a2       str s2, [x13, x12]
0x5b539d07f74  1ab4  f9427bec       ldr x12, [sp, #1264]
0x5b539d07f78  1ab8  0b08018e       add w14, w12, w8
0x5b539d07f7c  1abc  9101216f       add x15, x11, #0x48 (72)
0x5b539d07f80  1ac0  bc6f69a2       ldr s2, [x13, x15]
0x5b539d07f84  1ac4  bc2e69a2       str s2, [x13, x14]
0x5b539d07f88  1ac8  f94283ee       ldr x14, [sp, #1280]
0x5b539d07f8c  1acc  0b0801c8       add w8, w14, w8
0x5b539d07f90  1ad0  9101316f       add x15, x11, #0x4c (76)
0x5b539d07f94  1ad4  bc6f69a2       ldr s2, [x13, x15]
0x5b539d07f98  1ad8  bc2869a2       str s2, [x13, x8]
0x5b539d07f9c  1adc  aa0903f5       mov x21, x9
0x5b539d07fa0  1ae0  aa0d03e9       mov x9, x13
0x5b539d07fa4  1ae4  aa0c03ef       mov x15, x12
0x5b539d07fa8  1ae8  aa0603ed       mov x13, x6
0x5b539d07fac  1aec  1e2e1008       fmov s8, #0x70 (1.0000)
0x5b539d07fb0  1af0  fd421be4       ldr d4, [sp, #1072]
0x5b539d07fb4  1af4  fd4217e2       ldr d2, [sp, #1064]
0x5b539d07fb8  1af8  3dc0e7e7       ldr q7, [sp, #912]
0x5b539d07fbc  1afc  3dc0e3e5       ldr q5, [sp, #896]
0x5b539d07fc0  1b00  3dc0dfe3       ldr q3, [sp, #880]
0x5b539d07fc4  1b04  d2800042       movz x2, #0x2
0x5b539d07fc8  1b08  d2800020       movz x0, #0x1
0x5b539d07fcc  1b0c  d2800001       movz x1, #0x0
0x5b539d07fd0  1b10  f94023e6       ldr x6, [sp, #64]
0x5b539d07fd4  1b14  f9400ffc       ldr x28, [sp, #24]
0x5b539d07fd8  1b18  f9400bfb       ldr cp, [sp, #16]
0x5b539d07fdc  1b1c  f94007f9       ldr x25, [sp, #8]
0x5b539d07fe0  1b20  f941fbec       ldr x12, [sp, #1008]
0x5b539d07fe4  1b24  f941fff8       ldr x24, [sp, #1016]
0x5b539d07fe8  1b28  f94203eb       ldr x11, [sp, #1024]
0x5b539d07fec  1b2c  f94013f4       ldr x20, [sp, #32]
0x5b539d07ff0  1b30  f94247f7       ldr x23, [sp, #1160]
0x5b539d07ff4  1b34  f94017f6       ldr x22, [sp, #40]
0x5b539d07ff8  1b38  14000019       b #+0x64 (addr 0x5b539d0805c)
0x5b539d07ffc  1b3c  f94287e9       ldr x9, [sp, #1288]
0x5b539d08000  1b40  f94283ee       ldr x14, [sp, #1280]
0x5b539d08004  1b44  f9427bef       ldr x15, [sp, #1264]
0x5b539d08008  1b48  f94273f5       ldr x21, [sp, #1248]
0x5b539d0800c  1b4c  aa0603ed       mov x13, x6
0x5b539d08010  1b50  1e2e1008       fmov s8, #0x70 (1.0000)
0x5b539d08014  1b54  fd421be4       ldr d4, [sp, #1072]
0x5b539d08018  1b58  fd4217e2       ldr d2, [sp, #1064]
0x5b539d0801c  1b5c  3dc0e7e7       ldr q7, [sp, #912]
0x5b539d08020  1b60  3dc0e3e5       ldr q5, [sp, #896]
0x5b539d08024  1b64  3dc0dfe3       ldr q3, [sp, #880]
0x5b539d08028  1b68  d2800042       movz x2, #0x2
0x5b539d0802c  1b6c  d2800020       movz x0, #0x1
0x5b539d08030  1b70  d2800001       movz x1, #0x0
0x5b539d08034  1b74  f94023e6       ldr x6, [sp, #64]
0x5b539d08038  1b78  f9400ffc       ldr x28, [sp, #24]
0x5b539d0803c  1b7c  f9400bfb       ldr cp, [sp, #16]
0x5b539d08040  1b80  f94007f9       ldr x25, [sp, #8]
0x5b539d08044  1b84  f941fbec       ldr x12, [sp, #1008]
0x5b539d08048  1b88  f941fff8       ldr x24, [sp, #1016]
0x5b539d0804c  1b8c  f94203eb       ldr x11, [sp, #1024]
0x5b539d08050  1b90  f94013f4       ldr x20, [sp, #32]
0x5b539d08054  1b94  f94247f7       ldr x23, [sp, #1160]
0x5b539d08058  1b98  f94017f6       ldr x22, [sp, #40]
0x5b539d0805c  1b9c  11000673       add w19, w19, #0x1 (1)
0x5b539d08060  1ba0  f9428fe8       ldr x8, [sp, #1304]
0x5b539d08064  1ba4  6b08027f       cmp w19, w8
0x5b539d08068  1ba8  54ff5d61       b.ne #-0x1454 (addr 0x5b539d06c14)
0x5b539d0806c  1bac  f94293e6       ldr x6, [sp, #1312]
0x5b539d08070  1bb0  110800c6       add w6, w6, #0x200 (512)
0x5b539d08074  1bb4  f94297e8       ldr x8, [sp, #1320]
0x5b539d08078  1bb8  b9000106       str w6, [x8]
0x5b539d0807c  1bbc  17fffabb       b #-0x1514 (addr 0x5b539d06b68)
0x5b539d08080  1bc0  97fc06d4       bl #-0xfe4b0 (addr 0x5b539c09bd0)
0x5b539d08084  1bc4  f94287e6       ldr x6, [sp, #1288]
0x5b539d08088  1bc8  f9429be7       ldr x7, [sp, #1328]
0x5b539d0808c  1bcc  f9424fe0       ldr x0, [sp, #1176]
0x5b539d08090  1bd0  17fff917       b #-0x1ba4 (addr 0x5b539d064ec)
0x5b539d08094  1bd4  1e6620c0       fcmp d6, d6
0x5b539d08098  1bd8  54000080       b.eq #+0x10 (addr 0x5b539d080a8)
0x5b539d0809c  1bdc  d2800001       movz x1, #0x0
0x5b539d080a0  1be0  aa0103ec       mov x12, x1
0x5b539d080a4  1be4  17fff947       b #-0x1ae4 (addr 0x5b539d065c0)
0x5b539d080a8  1be8  1e2020a8       fcmp s5, #0.0
0x5b539d080ac  1bec  54000063       b.lo #+0xc (addr 0x5b539d080b8)
0x5b539d080b0  1bf0  9280000c       movn x12, #0x0
0x5b539d080b4  1bf4  17fff943       b #-0x1af4 (addr 0x5b539d065c0)
0x5b539d080b8  1bf8  d280000c       movz x12, #0x0
0x5b539d080bc  1bfc  17fff941       b #-0x1afc (addr 0x5b539d065c0)
0x5b539d080c0  1c00  1e6720e0       fcmp d7, d7
0x5b539d080c4  1c04  54000060       b.eq #+0xc (addr 0x5b539d080d0)
0x5b539d080c8  1c08  d280000c       movz x12, #0x0
0x5b539d080cc  1c0c  17fff945       b #-0x1aec (addr 0x5b539d065e0)
0x5b539d080d0  1c10  1e2020c8       fcmp s6, #0.0
0x5b539d080d4  1c14  54ffffa3       b.lo #-0xc (addr 0x5b539d080c8)
0x5b539d080d8  1c18  9280000c       movn x12, #0x0
0x5b539d080dc  1c1c  17fff941       b #-0x1afc (addr 0x5b539d065e0)
0x5b539d080e0  1c20  fd024be3       str d3, [sp, #1168]
0x5b539d080e4  1c24  f90283f5       str x21, [sp, #1280]
0x5b539d080e8  1c28  f90277f4       str x20, [sp, #1256]
0x5b539d080ec  1c2c  97fc06b9       bl #-0xfe51c (addr 0x5b539c09bd0)
0x5b539d080f0  1c30  f94287e9       ldr x9, [sp, #1288]
0x5b539d080f4  1c34  f94023e6       ldr x6, [sp, #64]
0x5b539d080f8  1c38  f941ffef       ldr x15, [sp, #1016]
0x5b539d080fc  1c3c  f94017ed       ldr x13, [sp, #40]
0x5b539d08100  1c40  f9428fe8       ldr x8, [sp, #1304]
0x5b539d08104  1c44  f94257ec       ldr x12, [sp, #1192]
0x5b539d08108  1c48  f9424fea       ldr x10, [sp, #1176]
0x5b539d0810c  1c4c  f94277f4       ldr x20, [sp, #1256]
0x5b539d08110  1c50  fd424be3       ldr d3, [sp, #1168]
0x5b539d08114  1c54  f9426fe0       ldr x0, [sp, #1240]
0x5b539d08118  1c58  f9427bf3       ldr x19, [sp, #1264]
0x5b539d0811c  1c5c  f9427fee       ldr x14, [sp, #1272]
0x5b539d08120  1c60  f94283f5       ldr x21, [sp, #1280]
0x5b539d08124  1c64  17fff973       b #-0x1a34 (addr 0x5b539d066f0)
0x5b539d08128  1c68  fd024be3       str d3, [sp, #1168]
0x5b539d0812c  1c6c  f9027bec       str x12, [sp, #1264]
0x5b539d08130  1c70  f90283e2       str x2, [sp, #1280]
0x5b539d08134  1c74  97fc06a7       bl #-0xfe564 (addr 0x5b539c09bd0)
0x5b539d08138  1c78  f94287e9       ldr x9, [sp, #1288]
0x5b539d0813c  1c7c  f94023e6       ldr x6, [sp, #64]
0x5b539d08140  1c80  f941fbf4       ldr x20, [sp, #1008]
0x5b539d08144  1c84  f94247ee       ldr x14, [sp, #1160]
0x5b539d08148  1c88  f9428fe8       ldr x8, [sp, #1304]
0x5b539d0814c  1c8c  f94257f6       ldr x22, [sp, #1192]
0x5b539d08150  1c90  f9424fea       ldr x10, [sp, #1176]
0x5b539d08154  1c94  f94283e2       ldr x2, [sp, #1280]
0x5b539d08158  1c98  fd424be3       ldr d3, [sp, #1168]
0x5b539d0815c  1c9c  f9427feb       ldr x11, [sp, #1272]
0x5b539d08160  1ca0  f94277e0       ldr x0, [sp, #1256]
0x5b539d08164  1ca4  f94273f5       ldr x21, [sp, #1248]
0x5b539d08168  1ca8  f9426ff3       ldr x19, [sp, #1240]
0x5b539d0816c  1cac  f9427bec       ldr x12, [sp, #1264]
0x5b539d08170  1cb0  17fff9a5       b #-0x196c (addr 0x5b539d06804)
0x5b539d08174  1cb4  fd024be3       str d3, [sp, #1168]
0x5b539d08178  1cb8  f9025bf5       str x21, [sp, #1200]
0x5b539d0817c  1cbc  f90283e2       str x2, [sp, #1280]
0x5b539d08180  1cc0  97fc0694       bl #-0xfe5b0 (addr 0x5b539c09bd0)
0x5b539d08184  1cc4  f94287e9       ldr x9, [sp, #1288]
0x5b539d08188  1cc8  f94023e6       ldr x6, [sp, #64]
0x5b539d0818c  1ccc  f94007ef       ldr x15, [sp, #8]
0x5b539d08190  1cd0  f94013ec       ldr x12, [sp, #32]
0x5b539d08194  1cd4  f9427feb       ldr x11, [sp, #1272]
0x5b539d08198  1cd8  f94257f6       ldr x22, [sp, #1192]
0x5b539d0819c  1cdc  f9424fea       ldr x10, [sp, #1176]
0x5b539d081a0  1ce0  f94283e2       ldr x2, [sp, #1280]
0x5b539d081a4  1ce4  fd424be3       ldr d3, [sp, #1168]
0x5b539d081a8  1ce8  f9427be0       ldr x0, [sp, #1264]
0x5b539d081ac  1cec  f9426ff3       ldr x19, [sp, #1240]
0x5b539d081b0  1cf0  f94273ed       ldr x13, [sp, #1248]
0x5b539d081b4  1cf4  f9425bf5       ldr x21, [sp, #1200]
0x5b539d081b8  1cf8  17fff9d3       b #-0x18b4 (addr 0x5b539d06904)
0x5b539d081bc  1cfc  fd024be3       str d3, [sp, #1168]
0x5b539d081c0  1d00  f90253ea       str x10, [sp, #1184]
0x5b539d081c4  1d04  f90283e2       str x2, [sp, #1280]
0x5b539d081c8  1d08  97fc0682       bl #-0xfe5f8 (addr 0x5b539c09bd0)
0x5b539d081cc  1d0c  f94287e9       ldr x9, [sp, #1288]
0x5b539d081d0  1d10  f94023e6       ldr x6, [sp, #64]
0x5b539d081d4  1d14  f9400bf3       ldr x19, [sp, #16]
0x5b539d081d8  1d18  f94203ed       ldr x13, [sp, #1024]
0x5b539d081dc  1d1c  f94283e2       ldr x2, [sp, #1280]
0x5b539d081e0  1d20  f9427feb       ldr x11, [sp, #1272]
0x5b539d081e4  1d24  fd424be3       ldr d3, [sp, #1168]
0x5b539d081e8  1d28  f9427be8       ldr x8, [sp, #1264]
0x5b539d081ec  1d2c  f94277e0       ldr x0, [sp, #1256]
0x5b539d081f0  1d30  f94257f5       ldr x21, [sp, #1192]
0x5b539d081f4  1d34  f94273f4       ldr x20, [sp, #1248]
0x5b539d081f8  1d38  f9426bee       ldr x14, [sp, #1232]
0x5b539d081fc  1d3c  f94253ea       ldr x10, [sp, #1184]
0x5b539d08200  1d40  17fffa05       b #-0x17ec (addr 0x5b539d06a14)
0x5b539d08204  1d44  f9028bf3       str x19, [sp, #1296]
0x5b539d08208  1d48  97fc0672       bl #-0xfe638 (addr 0x5b539c09bd0)
0x5b539d0820c  1d4c  f9428bf3       ldr x19, [sp, #1296]
0x5b539d08210  1d50  f94287e9       ldr x9, [sp, #1288]
0x5b539d08214  1d54  f94283ee       ldr x14, [sp, #1280]
0x5b539d08218  1d58  f9427bef       ldr x15, [sp, #1264]
0x5b539d0821c  1d5c  f94273f5       ldr x21, [sp, #1248]
0x5b539d08220  1d60  f9426fed       ldr x13, [sp, #1240]
0x5b539d08224  1d64  1e2e1008       fmov s8, #0x70 (1.0000)
0x5b539d08228  1d68  fd421be4       ldr d4, [sp, #1072]
0x5b539d0822c  1d6c  fd4217e2       ldr d2, [sp, #1064]
0x5b539d08230  1d70  3dc0e7e7       ldr q7, [sp, #912]
0x5b539d08234  1d74  3dc0e3e5       ldr q5, [sp, #896]
0x5b539d08238  1d78  3dc0dfe3       ldr q3, [sp, #880]
0x5b539d0823c  1d7c  d2800042       movz x2, #0x2
0x5b539d08240  1d80  d2800020       movz x0, #0x1
0x5b539d08244  1d84  d2800001       movz x1, #0x0
0x5b539d08248  1d88  f94023e6       ldr x6, [sp, #64]
0x5b539d0824c  1d8c  f9400ffc       ldr x28, [sp, #24]
0x5b539d08250  1d90  f9400bfb       ldr cp, [sp, #16]
0x5b539d08254  1d94  f94007f9       ldr x25, [sp, #8]
0x5b539d08258  1d98  f941fbec       ldr x12, [sp, #1008]
0x5b539d0825c  1d9c  f941fff8       ldr x24, [sp, #1016]
0x5b539d08260  1da0  f94203eb       ldr x11, [sp, #1024]
0x5b539d08264  1da4  f94013f4       ldr x20, [sp, #32]
0x5b539d08268  1da8  f94247f7       ldr x23, [sp, #1160]
0x5b539d0826c  1dac  f94017f6       ldr x22, [sp, #40]
0x5b539d08270  1db0  17fffa6c       b #-0x1650 (addr 0x5b539d06c20)
0x5b539d08274  1db4  1e6520a0       fcmp d5, d5
0x5b539d08278  1db8  54000060       b.eq #+0xc (addr 0x5b539d08284)
0x5b539d0827c  1dbc  d2800008       movz x8, #0x0
0x5b539d08280  1dc0  17fffac5       b #-0x14ec (addr 0x5b539d06d94)
0x5b539d08284  1dc4  1e202088       fcmp s4, #0.0
0x5b539d08288  1dc8  54ffffa3       b.lo #-0xc (addr 0x5b539d0827c)
0x5b539d0828c  1dcc  92800008       movn x8, #0x0
0x5b539d08290  1dd0  17fffac1       b #-0x14fc (addr 0x5b539d06d94)
0x5b539d08294  1dd4  1e6620c0       fcmp d6, d6
0x5b539d08298  1dd8  54000060       b.eq #+0xc (addr 0x5b539d082a4)
0x5b539d0829c  1ddc  d280000b       movz x11, #0x0
0x5b539d082a0  1de0  17fffadc       b #-0x1490 (addr 0x5b539d06e10)
0x5b539d082a4  1de4  1e202068       fcmp s3, #0.0
0x5b539d082a8  1de8  54ffffa3       b.lo #-0xc (addr 0x5b539d0829c)
0x5b539d082ac  1dec  9280000b       movn x11, #0x0
0x5b539d082b0  1df0  17fffad8       b #-0x14a0 (addr 0x5b539d06e10)
0x5b539d082b4  1df4  f9016fe1       str x1, [sp, #728]
0x5b539d082b8  1df8  f9016be2       str x2, [sp, #720]
0x5b539d082bc  1dfc  f90167e3       str x3, [sp, #712]
0x5b539d082c0  1e00  f90163e5       str x5, [sp, #704]
0x5b539d082c4  1e04  f9015fe7       str x7, [sp, #696]
0x5b539d082c8  1e08  f90153f4       str x20, [sp, #672]
0x5b539d082cc  1e0c  3d8097e8       str q8, [sp, #592]
0x5b539d082d0  1e10  3d8093e9       str q9, [sp, #576]
0x5b539d082d4  1e14  3d808fea       str q10, [sp, #560]
0x5b539d082d8  1e18  3d808beb       str q11, [sp, #544]
0x5b539d082dc  1e1c  3d8087e1       str q1, [sp, #528]
0x5b539d082e0  1e20  3d8083e0       str q0, [sp, #512]
0x5b539d082e4  1e24  3d807ffc       str q28, [sp, #496]
0x5b539d082e8  1e28  3d807bfb       str q27, [sp, #480]
0x5b539d082ec  1e2c  3d8077fa       str q26, [sp, #464]
0x5b539d082f0  1e30  3d8073f9       str q25, [sp, #448]
0x5b539d082f4  1e34  3d806ff8       str q24, [sp, #432]
0x5b539d082f8  1e38  3d806bf7       str q23, [sp, #416]
0x5b539d082fc  1e3c  3d8067f6       str q22, [sp, #400]
0x5b539d08300  1e40  3d8063f5       str q21, [sp, #384]
0x5b539d08304  1e44  3d805ff4       str q20, [sp, #368]
0x5b539d08308  1e48  3d805bf3       str q19, [sp, #352]
0x5b539d0830c  1e4c  3d8057f2       str q18, [sp, #336]
0x5b539d08310  1e50  3d8053f1       str q17, [sp, #320]
0x5b539d08314  1e54  3d804ff0       str q16, [sp, #304]
0x5b539d08318  1e58  3d804bee       str q14, [sp, #288]
0x5b539d0831c  1e5c  3d8047ed       str q13, [sp, #272]
0x5b539d08320  1e60  3d8043ec       str q12, [sp, #256]
0x5b539d08324  1e64  97fc062b       bl #-0xfe754 (addr 0x5b539c09bd0)
0x5b539d08328  1e68  f94287f5       ldr x21, [sp, #1288]
0x5b539d0832c  1e6c  f9424fe9       ldr x9, [sp, #1176]
0x5b539d08330  1e70  f9416fe1       ldr x1, [sp, #728]
0x5b539d08334  1e74  f9416be2       ldr x2, [sp, #720]
0x5b539d08338  1e78  f94167e3       ldr x3, [sp, #712]
0x5b539d0833c  1e7c  f94163e5       ldr x5, [sp, #704]
0x5b539d08340  1e80  f9415fe7       ldr x7, [sp, #696]
0x5b539d08344  1e84  f94153f4       ldr x20, [sp, #672]
0x5b539d08348  1e88  f9414ff7       ldr x23, [sp, #664]
0x5b539d0834c  1e8c  f94147fb       ldr cp, [sp, #648]
0x5b539d08350  1e90  f94143fc       ldr x28, [sp, #640]
0x5b539d08354  1e94  f9413ff9       ldr x25, [sp, #632]
0x5b539d08358  1e98  f94137f8       ldr x24, [sp, #616]
0x5b539d0835c  1e9c  d2800004       movz x4, #0x0
0x5b539d08360  1ea0  3dc097e8       ldr q8, [sp, #592]
0x5b539d08364  1ea4  3dc093e9       ldr q9, [sp, #576]
0x5b539d08368  1ea8  3dc08fea       ldr q10, [sp, #560]
0x5b539d0836c  1eac  3dc08beb       ldr q11, [sp, #544]
0x5b539d08370  1eb0  3dc087e1       ldr q1, [sp, #528]
0x5b539d08374  1eb4  3dc083e0       ldr q0, [sp, #512]
0x5b539d08378  1eb8  3dc07ffc       ldr q28, [sp, #496]
0x5b539d0837c  1ebc  3dc07bfb       ldr q27, [sp, #480]
0x5b539d08380  1ec0  3dc077fa       ldr q26, [sp, #464]
0x5b539d08384  1ec4  3dc073f9       ldr q25, [sp, #448]
0x5b539d08388  1ec8  3dc06ff8       ldr q24, [sp, #432]
0x5b539d0838c  1ecc  3dc06bf7       ldr q23, [sp, #416]
0x5b539d08390  1ed0  3dc067f6       ldr q22, [sp, #400]
0x5b539d08394  1ed4  3dc063f5       ldr q21, [sp, #384]
0x5b539d08398  1ed8  3dc05ff4       ldr q20, [sp, #368]
0x5b539d0839c  1edc  3dc05bf3       ldr q19, [sp, #352]
0x5b539d083a0  1ee0  3dc057f2       ldr q18, [sp, #336]
0x5b539d083a4  1ee4  3dc053f1       ldr q17, [sp, #320]
0x5b539d083a8  1ee8  3dc04ff0       ldr q16, [sp, #304]
0x5b539d083ac  1eec  3dc04bee       ldr q14, [sp, #288]
0x5b539d083b0  1ef0  3dc047ed       ldr q13, [sp, #272]
0x5b539d083b4  1ef4  3dc043ec       ldr q12, [sp, #256]
0x5b539d083b8  1ef8  f94043ed       ldr x13, [sp, #128]
0x5b539d083bc  1efc  f9403ff3       ldr x19, [sp, #120]
0x5b539d083c0  1f00  f9403bee       ldr x14, [sp, #112]
0x5b539d083c4  1f04  f94037ef       ldr x15, [sp, #104]
0x5b539d083c8  1f08  f94033f6       ldr x22, [sp, #96]
0x5b539d083cc  1f0c  f9402fe8       ldr x8, [sp, #88]
0x5b539d083d0  1f10  f9402bec       ldr x12, [sp, #80]
0x5b539d083d4  1f14  f94027e6       ldr x6, [sp, #72]
0x5b539d083d8  1f18  17fffb38       b #-0x1320 (addr 0x5b539d070b8)
0x5b539d083dc  1f1c  f9016fe1       str x1, [sp, #728]
0x5b539d083e0  1f20  f9016be2       str x2, [sp, #720]
0x5b539d083e4  1f24  f90167e3       str x3, [sp, #712]
0x5b539d083e8  1f28  f90163e5       str x5, [sp, #704]
0x5b539d083ec  1f2c  f9015fe7       str x7, [sp, #696]
0x5b539d083f0  1f30  f90153f4       str x20, [sp, #672]
0x5b539d083f4  1f34  f9004ff6       str x22, [sp, #152]
0x5b539d083f8  1f38  3d805ff5       str q21, [sp, #368]
0x5b539d083fc  1f3c  3d805bf6       str q22, [sp, #352]
0x5b539d08400  1f40  3d8073f9       str q25, [sp, #448]
0x5b539d08404  1f44  3d806ff8       str q24, [sp, #432]
0x5b539d08408  1f48  3d806bf7       str q23, [sp, #416]
0x5b539d0840c  1f4c  3d8067fa       str q26, [sp, #400]
0x5b539d08410  1f50  3d8063fb       str q27, [sp, #384]
0x5b539d08414  1f54  3d807bfc       str q28, [sp, #480]
0x5b539d08418  1f58  3d8077e0       str q0, [sp, #464]
0x5b539d0841c  1f5c  3d808fe1       str q1, [sp, #560]
0x5b539d08420  1f60  3d808be2       str q2, [sp, #544]
0x5b539d08424  1f64  3d8087e3       str q3, [sp, #528]
0x5b539d08428  1f68  3d8083e4       str q4, [sp, #512]
0x5b539d0842c  1f6c  3d807fe5       str q5, [sp, #496]
0x5b539d08430  1f70  3d8097e6       str q6, [sp, #592]
0x5b539d08434  1f74  3d8093e7       str q7, [sp, #576]
0x5b539d08438  1f78  97fc05e6       bl #-0xfe868 (addr 0x5b539c09bd0)
0x5b539d0843c  1f7c  f94287f9       ldr x25, [sp, #1288]
0x5b539d08440  1f80  f94227e8       ldr x8, [sp, #1096]
0x5b539d08444  1f84  f9421fe9       ldr x9, [sp, #1080]
0x5b539d08448  1f88  f94197ec       ldr x12, [sp, #808]
0x5b539d0844c  1f8c  f94193e6       ldr x6, [sp, #800]
0x5b539d08450  1f90  f9418fe4       ldr x4, [sp, #792]
0x5b539d08454  1f94  f9418bfc       ldr x28, [sp, #784]
0x5b539d08458  1f98  f94187ea       ldr x10, [sp, #776]
0x5b539d0845c  1f9c  f94183f5       ldr x21, [sp, #768]
0x5b539d08460  1fa0  f9417fe0       ldr x0, [sp, #760]
0x5b539d08464  1fa4  f9417bf7       ldr x23, [sp, #752]
0x5b539d08468  1fa8  f94177f3       ldr x19, [sp, #744]
0x5b539d0846c  1fac  f94173ee       ldr x14, [sp, #736]
0x5b539d08470  1fb0  f9416fe1       ldr x1, [sp, #728]
0x5b539d08474  1fb4  f9416be2       ldr x2, [sp, #720]
0x5b539d08478  1fb8  f94167e3       ldr x3, [sp, #712]
0x5b539d0847c  1fbc  f94163e5       ldr x5, [sp, #704]
0x5b539d08480  1fc0  f9415fe7       ldr x7, [sp, #696]
0x5b539d08484  1fc4  f9415bed       ldr x13, [sp, #688]
0x5b539d08488  1fc8  f94157eb       ldr x11, [sp, #680]
0x5b539d0848c  1fcc  f94153f4       ldr x20, [sp, #672]
0x5b539d08490  1fd0  f9404ff6       ldr x22, [sp, #152]
0x5b539d08494  1fd4  3dc05ff5       ldr q21, [sp, #368]
0x5b539d08498  1fd8  3dc05bf6       ldr q22, [sp, #352]
0x5b539d0849c  1fdc  3dc073f9       ldr q25, [sp, #448]
0x5b539d084a0  1fe0  3dc06ff8       ldr q24, [sp, #432]
0x5b539d084a4  1fe4  3dc06bf7       ldr q23, [sp, #416]
0x5b539d084a8  1fe8  3dc067fa       ldr q26, [sp, #400]
0x5b539d084ac  1fec  3dc063fb       ldr q27, [sp, #384]
0x5b539d084b0  1ff0  3dc07bfc       ldr q28, [sp, #480]
0x5b539d084b4  1ff4  3dc077e0       ldr q0, [sp, #464]
0x5b539d084b8  1ff8  3dc08fe1       ldr q1, [sp, #560]
0x5b539d084bc  1ffc  3dc08be2       ldr q2, [sp, #544]
0x5b539d084c0  2000  3dc087e3       ldr q3, [sp, #528]
0x5b539d084c4  2004  3dc083e4       ldr q4, [sp, #512]
0x5b539d084c8  2008  3dc07fe5       ldr q5, [sp, #496]
0x5b539d084cc  200c  3dc097e6       ldr q6, [sp, #592]
0x5b539d084d0  2010  3dc093e7       ldr q7, [sp, #576]
0x5b539d084d4  2014  f9404bfb       ldr cp, [sp, #144]
0x5b539d084d8  2018  f94047f8       ldr x24, [sp, #136]
0x5b539d084dc  201c  17fffbb9       b #-0x111c (addr 0x5b539d073c0)
0x5b539d084e0  2020  3d808fe1       str q1, [sp, #560]
0x5b539d084e4  2024  3d807bfc       str q28, [sp, #480]
0x5b539d084e8  2028  3d8077e0       str q0, [sp, #464]
0x5b539d084ec  202c  3d8073f9       str q25, [sp, #448]
0x5b539d084f0  2030  3d806ff8       str q24, [sp, #432]
0x5b539d084f4  2034  3d806bf7       str q23, [sp, #416]
0x5b539d084f8  2038  3d8067fa       str q26, [sp, #400]
0x5b539d084fc  203c  3d8063fb       str q27, [sp, #384]
0x5b539d08500  2040  f90227f6       str x22, [sp, #1096]
0x5b539d08504  2044  f90223ef       str x15, [sp, #1088]
0x5b539d08508  2048  f9020be8       str x8, [sp, #1040]
0x5b539d0850c  204c  f90207f8       str x24, [sp, #1032]
0x5b539d08510  2050  f9021ffb       str cp, [sp, #1080]
0x5b539d08514  2054  3d811ff1       str q17, [sp, #1136]
0x5b539d08518  2058  fd0243f2       str d18, [sp, #1152]
0x5b539d0851c  205c  fd0237f4       str d20, [sp, #1128]
0x5b539d08520  2060  fd022be7       str d7, [sp, #1104]
0x5b539d08524  2064  f9016fe1       str x1, [sp, #728]
0x5b539d08528  2068  f9016be2       str x2, [sp, #720]
0x5b539d0852c  206c  f90167e3       str x3, [sp, #712]
0x5b539d08530  2070  f90163e5       str x5, [sp, #704]
0x5b539d08534  2074  f9015fe7       str x7, [sp, #696]
0x5b539d08538  2078  f90153f4       str x20, [sp, #672]
0x5b539d0853c  207c  97fc05a5       bl #-0xfe96c (addr 0x5b539c09bd0)
0x5b539d08540  2080  f94287f9       ldr x25, [sp, #1288]
0x5b539d08544  2084  3dc08fe1       ldr q1, [sp, #560]
0x5b539d08548  2088  3dc07bfc       ldr q28, [sp, #480]
0x5b539d0854c  208c  3dc077e0       ldr q0, [sp, #464]
0x5b539d08550  2090  3dc073f9       ldr q25, [sp, #448]
0x5b539d08554  2094  3dc06ff8       ldr q24, [sp, #432]
0x5b539d08558  2098  3dc06bf7       ldr q23, [sp, #416]
0x5b539d0855c  209c  3dc067fa       ldr q26, [sp, #400]
0x5b539d08560  20a0  3dc063fb       ldr q27, [sp, #384]
0x5b539d08564  20a4  3dc05ff5       ldr q21, [sp, #368]
0x5b539d08568  20a8  3dc05bf6       ldr q22, [sp, #352]
0x5b539d0856c  20ac  3dc04ff0       ldr q16, [sp, #304]
0x5b539d08570  20b0  3dc04bf3       ldr q19, [sp, #288]
0x5b539d08574  20b4  3dc047ed       ldr q13, [sp, #272]
0x5b539d08578  20b8  3dc03bec       ldr q12, [sp, #224]
0x5b539d0857c  20bc  3dc037ee       ldr q14, [sp, #208]
0x5b539d08580  20c0  f94227f6       ldr x22, [sp, #1096]
0x5b539d08584  20c4  f94223ef       ldr x15, [sp, #1088]
0x5b539d08588  20c8  f9420be8       ldr x8, [sp, #1040]
0x5b539d0858c  20cc  f94207f8       ldr x24, [sp, #1032]
0x5b539d08590  20d0  f9421ffb       ldr cp, [sp, #1080]
0x5b539d08594  20d4  3dc11ff1       ldr q17, [sp, #1136]
0x5b539d08598  20d8  fd4243f2       ldr d18, [sp, #1152]
0x5b539d0859c  20dc  fd4237f4       ldr d20, [sp, #1128]
0x5b539d085a0  20e0  fd422be7       ldr d7, [sp, #1104]
0x5b539d085a4  20e4  1e2e1006       fmov s6, #0x70 (1.0000)
0x5b539d085a8  20e8  fd421be5       ldr d5, [sp, #1072]
0x5b539d085ac  20ec  fd4217e4       ldr d4, [sp, #1064]
0x5b539d085b0  20f0  fd4213e3       ldr d3, [sp, #1056]
0x5b539d085b4  20f4  fd420fe2       ldr d2, [sp, #1048]
0x5b539d085b8  20f8  f941b3e9       ldr x9, [sp, #864]
0x5b539d085bc  20fc  f94197ec       ldr x12, [sp, #808]
0x5b539d085c0  2100  f9418fe4       ldr x4, [sp, #792]
0x5b539d085c4  2104  f9418bfc       ldr x28, [sp, #784]
0x5b539d085c8  2108  f94187ea       ldr x10, [sp, #776]
0x5b539d085cc  210c  f94183f5       ldr x21, [sp, #768]
0x5b539d085d0  2110  f9417fe0       ldr x0, [sp, #760]
0x5b539d085d4  2114  f9417bf7       ldr x23, [sp, #752]
0x5b539d085d8  2118  f94177f3       ldr x19, [sp, #744]
0x5b539d085dc  211c  f94173ee       ldr x14, [sp, #736]
0x5b539d085e0  2120  f9416fe1       ldr x1, [sp, #728]
0x5b539d085e4  2124  f9416be2       ldr x2, [sp, #720]
0x5b539d085e8  2128  f94167e3       ldr x3, [sp, #712]
0x5b539d085ec  212c  f94163e5       ldr x5, [sp, #704]
0x5b539d085f0  2130  f9415fe7       ldr x7, [sp, #696]
0x5b539d085f4  2134  f9415bed       ldr x13, [sp, #688]
0x5b539d085f8  2138  f94157eb       ldr x11, [sp, #680]
0x5b539d085fc  213c  f94153f4       ldr x20, [sp, #672]
0x5b539d08600  2140  17fffdf8       b #-0x820 (addr 0x5b539d07de0)
0x5b539d08604  2144  97fc04c3       bl #-0xfecf4 (addr 0x5b539c09910)
0x5b539d08608  2148  d503201f       nop
0x5b539d0860c  214c  5800009f       constant pool begin (num_const = 4)
0x5b539d08610  2150  d63f03e0       constant
0x5b539d08614  2154  d503201f       constant
0x5b539d08618  2158  01d46af4       constant
0x5b539d0861c  215c  00000001       constant

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
      12f8         
      1304         
      1310         
      1378         
      13a8         
      13b4         
      13dc         
      13e8         
      13f4         
      1400         
      140c         
      1414         
      141c         
      1424         
      14ac         
      14d8         
      14e4         
      150c         
      1518         
      1524         
      1530         
      153c         
      1544         
      154c         
      1554         
      15dc         
      1610         
      1620         
      1650         
      1664         
      1678         
      168c         
      16a0         
      16a8         
      16b0         
      16b8         
      174c         
      1788         
      179c         
      17cc         
      17e0         
      17f4         
      1808         
      181c         
      1920         
      1930         
      1964         
      196c         
      1a04         
      1a14         
      1a20         
      1a2c         
      1a98         
      1a9c         
      1aac         
      1ab0         
      1ac0         
      1ac4         
      1ad4         
      1ad8         

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
       9e8      1841
       9f0      1850
       9f8      1859
       a00      1868
       a08      1877
       a10      1886
       a18      1895
       a20      1903
       a2c      1912
       a38      1921
       a44      1930
       a50      1939
       a5c      1948
       a68      1957
       a74      1965
       a80      1974
       a8c      1983
       a98      1992
       aa4      2001
       ab0      2010
       abc      2019
       ac8      2027
       ad8      2036
       c18      2138
       c20      2151
       f04      2447
       f0c      2460
       f14      2479
       f24      2499
       f58      2548
       f64      2569
       f8c      2632
       f98      2653
       fa4      2674
       fb0      2695
       fbc      2716
       fc4      2725
       fcc      2736
       fd4      2753
       fe0      2771
      100c      2820
      1018      2841
      103c      2886
      1048      2907
      1054      2928
      1060      2949
      106c      2970
      1074      2979
      107c      2990
      1084      3007
      1090      3025
      10b8      3074
      10c4      3095
      10ec      3140
      10fc      3161
      110c      3182
      1120      3203
      1134      3224
      1140      3233
      1148      3244
      1150      3261
      1160      3279
      1198      3328
      11ac      3349
      11d8      3394
      11ec      3415
      1200      3436
      1214      3457
      1228      3478
      12f8      3556
      1304      3569
      1310      3588
      1378      3672
      13a8      3724
      13b4      3745
      13dc      3813
      13e8      3834
      13f4      3855
      1400      3876
      140c      3897
      1414      3903
      141c      3911
      1424      3925
      14ac      4098
      14d8      4150
      14e4      4171
      150c      4221
      1518      4242
      1524      4263
      1530      4284
      153c      4305
      1544      4311
      154c      4319
      1554      4333
      15dc      4506
      1610      4558
      1620      4579
      164c      4629
      1660      4650
      1674      4671
      1688      4692
      169c      4713
      16a8      4719
      16b0      4727
      16b8      4741
      174c      4914
      1784      4966
      1798      4987
      17c8      5037
      17dc      5058
      17f0      5079
      1804      5100
      1818      5121
      1920      5212
      1930      5227
      1964      5278
      196c      5286
      19fc      5387
      1a10      5394
      1a18      5401
      1a24      5408
      1a3c      5424
      1a54      5454
      1a94      5474
      1a9c      5477
      1aac      5487
      1ab0      5490
      1ac0      5500
      1ac4      5503
      1ad4      5513
      1ad8      5516
      1bc0         0
      1c20       420
      1c68       595
      1cb4       771
      1cfc       943
      1d44      1325
      1df4      2075
      1f1c      2438
      2020      5202
      2144      1539

Safepoints (stack slots = 170, entries = 1, byte size = 36)
0x5b539d0667c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 66)
0x5b539d06678  internal wasm call
0x5b539d06750  internal wasm call
0x5b539d06860  internal wasm call
0x5b539d06960  internal wasm call
0x5b539d06a80  internal wasm call
0x5b539d06d34  external reference (0x101d46af4)
0x5b539d07f08  internal wasm call
0x5b539d07f2c  internal wasm call
0x5b539d08080  wasm stub call  (0x5b539c09bd0)
0x5b539d080ec  wasm stub call  (0x5b539c09bd0)
0x5b539d08134  wasm stub call  (0x5b539c09bd0)
0x5b539d08180  wasm stub call  (0x5b539c09bd0)
0x5b539d081c8  wasm stub call  (0x5b539c09bd0)
0x5b539d08208  wasm stub call  (0x5b539c09bd0)
0x5b539d08324  wasm stub call  (0x5b539c09bd0)
0x5b539d08438  wasm stub call  (0x5b539c09bd0)
0x5b539d0853c  wasm stub call  (0x5b539c09bd0)
0x5b539d08604  wasm stub call  (0x5b539c09910)
0x5b539d0860c  constant pool (size 20)
