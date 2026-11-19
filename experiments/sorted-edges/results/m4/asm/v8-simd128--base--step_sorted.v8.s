name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1467
kind: wasm function
compiler: TurboFan
Body (size = 6816 = 6816 + 0 padding)
Instructions (size = 6780)
0x2d15098c0c00     0  d2800110       movz x16, #0x8
0x2d15098c0c04     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x2d15098c0c08     8  a9017bfd       stp fp, lr, [sp, #16]
0x2d15098c0c0c     c  910043fd       add fp, sp, #0x10 (16)
0x2d15098c0c10    10  d11383ff       sub sp, sp, #0x4e0 (1248)
0x2d15098c0c14    14  f841f0e1       ldur x1, [x7, #31]
0x2d15098c0c18    18  f8520346       ldur x6, [x26, #-224]
0x2d15098c0c1c    1c  f90267e0       str x0, [sp, #1224]
0x2d15098c0c20    20  f9025fe1       str x1, [sp, #1208]
0x2d15098c0c24    24  eb2663ff       cmp sp, x6
0x2d15098c0c28    28  5400b009       b.ls #+0x1600 (addr 0x2d15098c2228)
0x2d15098c0c2c    2c  f842f0e6       ldur x6, [x7, #47]
0x2d15098c0c30    30  b94000c8       ldr w8, [x6]
0x2d15098c0c34    34  51014104       sub w4, w8, #0x50 (80)
0x2d15098c0c38    38  b90000c4       str w4, [x6]
0x2d15098c0c3c    3c  2a0003e8       mov w8, w0
0x2d15098c0c40    40  91024029       add x9, x1, #0x90 (144)
0x2d15098c0c44    44  fc686922       ldr d2, [x9, x8]
0x2d15098c0c48    48  5e0c0441       mov s1, v2.s[1]
0x2d15098c0c4c    4c  52a75010       movz w16, #0x3a800000
0x2d15098c0c50    50  1e270203       fmov s3, w16
0x2d15098c0c54    54  1e230824       fmul s4, s1, s3
0x2d15098c0c58    58  5e040440       mov s0, v2.s[0]
0x2d15098c0c5c    5c  1e230803       fmul s3, s0, s3
0x2d15098c0c60    60  91028109       add x9, x8, #0xa0 (160)
0x2d15098c0c64    64  bc696825       ldr s5, [x1, x9]
0x2d15098c0c68    68  1e2520a0       fcmp s5, s5
0x2d15098c0c6c    6c  1e251c66       fcsel s6, s3, s5, ne
0x2d15098c0c70    70  1e232060       fcmp s3, s3
0x2d15098c0c74    74  1e231cc3       fcsel s3, s6, s3, ne
0x2d15098c0c78    78  1e262060       fcmp s3, s6
0x2d15098c0c7c    7c  1e233cc3       fcsel s3, s6, s3, lo
0x2d15098c0c80    80  1e232060       fcmp s3, s3
0x2d15098c0c84    84  1e231c83       fcsel s3, s4, s3, ne
0x2d15098c0c88    88  1e242080       fcmp s4, s4
0x2d15098c0c8c    8c  1e241c64       fcsel s4, s3, s4, ne
0x2d15098c0c90    90  1e232080       fcmp s4, s3
0x2d15098c0c94    94  1e243c63       fcsel s3, s3, s4, lo
0x2d15098c0c98    98  52840010       movz w16, #0x2000
0x2d15098c0c9c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x2d15098c0ca0    a0  1e270204       fmov s4, w16
0x2d15098c0ca4    a4  1e240863       fmul s3, s3, s4
0x2d15098c0ca8    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x2d15098c0cac    ac  1e231883       fdiv s3, s4, s3
0x2d15098c0cb0    b0  91021109       add x9, x8, #0x84 (132)
0x2d15098c0cb4    b4  bc296823       str s3, [x1, x9]
0x2d15098c0cb8    b8  4e040466       dup v6.4s, v3.s[0]
0x2d15098c0cbc    bc  6e26dc42       fmul v2.4s, v2.4s, v6.4s
0x2d15098c0cc0    c0  4ea18842       frintp v2.4s, v2.4s
0x2d15098c0cc4    c4  5e040446       mov s6, v2.s[0]
0x2d15098c0cc8    c8  1e22c0c7       fcvt d7, s6
0x2d15098c0ccc    cc  1e65c0e8       frintz d8, d7
0x2d15098c0cd0    d0  1e79010a       fcvtzu w10, d8
0x2d15098c0cd4    d4  1e630149       ucvtf d9, w10
0x2d15098c0cd8    d8  f9026fe6       str x6, [sp, #1240]
0x2d15098c0cdc    dc  f9026be4       str x4, [sp, #1232]
0x2d15098c0ce0    e0  f90017e8       str x8, [sp, #40]
0x2d15098c0ce4    e4  fd023be1       str d1, [sp, #1136]
0x2d15098c0ce8    e8  fd023fe0       str d0, [sp, #1144]
0x2d15098c0cec    ec  fd0263e5       str d5, [sp, #1216]
0x2d15098c0cf0    f0  fd022fe3       str d3, [sp, #1112]
0x2d15098c0cf4    f4  f90013e9       str x9, [sp, #32]
0x2d15098c0cf8    f8  1e692100       fcmp d8, d9
0x2d15098c0cfc    fc  5400aa01       b.ne #+0x1540 (addr 0x2d15098c223c)
0x2d15098c0d00   100  4e040d46       dup v6.4s, w10
0x2d15098c0d04   104  5e0c0447       mov s7, v2.s[1]
0x2d15098c0d08   108  1e22c0e8       fcvt d8, s7
0x2d15098c0d0c   10c  1e65c109       frintz d9, d8
0x2d15098c0d10   110  1e79012a       fcvtzu w10, d9
0x2d15098c0d14   114  1e63014a       ucvtf d10, w10
0x2d15098c0d18   118  1e6a2120       fcmp d9, d10
0x2d15098c0d1c   11c  5400aa61       b.ne #+0x154c (addr 0x2d15098c2268)
0x2d15098c0d20   120  4e0c1d46       mov v6.s[1], w10
0x2d15098c0d24   124  4f000427       movi v7.4s, #0x1, lsl #0
0x2d15098c0d28   128  6ea764c6       umax v6.4s, v6.4s, v7.4s
0x2d15098c0d2c   12c  6f00e408       movi v8.2d, #0x0
0x2d15098c0d30   130  6ea0c849       fcmge v9.4s, v2.4s, #0.0
0x2d15098c0d34   134  52a9f010       movz w16, #0x4f800000
0x2d15098c0d38   138  4e040e0a       dup v10.4s, w16
0x2d15098c0d3c   13c  6ea2e542       fcmgt v2.4s, v10.4s, v2.4s
0x2d15098c0d40   140  4e221d22       and v2.16b, v9.16b, v2.16b
0x2d15098c0d44   144  6e671cc2       bsl v2.16b, v6.16b, v7.16b
0x2d15098c0d48   148  9102202a       add x10, x1, #0x88 (136)
0x2d15098c0d4c   14c  8b08014a       add x10, x10, x8
0x2d15098c0d50   150  0d008542       st1 {v2.d}[0], [x10]
0x2d15098c0d54   154  9103310a       add x10, x8, #0xcc (204)
0x2d15098c0d58   158  b86a682a       ldr w10, [x1, x10]
0x2d15098c0d5c   15c  9101208b       add x11, x4, #0x48 (72)
0x2d15098c0d60   160  b82b682a       str w10, [x1, x11]
0x2d15098c0d64   164  9103110a       add x10, x8, #0xc4 (196)
0x2d15098c0d68   168  f86a682a       ldr x10, [x1, x10]
0x2d15098c0d6c   16c  9101008b       add x11, x4, #0x40 (64)
0x2d15098c0d70   170  f82b682a       str x10, [x1, x11]
0x2d15098c0d74   174  1101800a       add w10, w0, #0x60 (96)
0x2d15098c0d78   178  9100110b       add x11, x8, #0x4 (4)
0x2d15098c0d7c   17c  b86b6822       ldr w2, [x1, x11]
0x2d15098c0d80   180  9100210c       add x12, x8, #0x8 (8)
0x2d15098c0d84   184  b86c6823       ldr w3, [x1, x12]
0x2d15098c0d88   188  9100410d       add x13, x8, #0x10 (16)
0x2d15098c0d8c   18c  b86d682e       ldr w14, [x1, x13]
0x2d15098c0d90   190  9100510f       add x15, x8, #0x14 (20)
0x2d15098c0d94   194  b86f6825       ldr w5, [x1, x15]
0x2d15098c0d98   198  3d80cfe7       str q7, [sp, #816]
0x2d15098c0d9c   19c  3d800fe8       str q8, [sp, #48]
0x2d15098c0da0   1a0  f901efeb       str x11, [sp, #984]
0x2d15098c0da4   1a4  f901ffec       str x12, [sp, #1016]
0x2d15098c0da8   1a8  f90007ed       str x13, [sp, #8]
0x2d15098c0dac   1ac  f901fbef       str x15, [sp, #1008]
0x2d15098c0db0   1b0  aa0a03e0       mov x0, x10
0x2d15098c0db4   1b4  aa0e03e4       mov x4, x14
0x2d15098c0db8   1b8  97fc1231       bl #-0xfb73c (addr 0x2d15097c567c)
0x2d15098c0dbc   1bc  f94017e1       ldr x1, [sp, #40]
0x2d15098c0dc0   1c0  9100e026       add x6, x1, #0x38 (56)
0x2d15098c0dc4   1c4  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c0dc8   1c8  b826691f       str wzr, [x8, x6]
0x2d15098c0dcc   1cc  f94267e9       ldr x9, [sp, #1224]
0x2d15098c0dd0   1d0  11028122       add w2, w9, #0xa0 (160)
0x2d15098c0dd4   1d4  9101f02a       add x10, x1, #0x7c (124)
0x2d15098c0dd8   1d8  b86a690a       ldr w10, [x8, x10]
0x2d15098c0ddc   1dc  9102002b       add x11, x1, #0x80 (128)
0x2d15098c0de0   1e0  b86b690b       ldr w11, [x8, x11]
0x2d15098c0de4   1e4  0b0b094b       add w11, w10, w11, lsl #2
0x2d15098c0de8   1e8  f941ffec       ldr x12, [sp, #1016]
0x2d15098c0dec   1ec  b86c690d       ldr w13, [x8, x12]
0x2d15098c0df0   1f0  f941efee       ldr x14, [sp, #984]
0x2d15098c0df4   1f4  b86e690f       ldr w15, [x8, x14]
0x2d15098c0df8   1f8  1100c120       add w0, w9, #0x30 (48)
0x2d15098c0dfc   1fc  f9021fe6       str x6, [sp, #1080]
0x2d15098c0e00   200  f90243e2       str x2, [sp, #1152]
0x2d15098c0e04   204  f9022bea       str x10, [sp, #1104]
0x2d15098c0e08   208  f90227eb       str x11, [sp, #1096]
0x2d15098c0e0c   20c  f9025bed       str x13, [sp, #1200]
0x2d15098c0e10   210  f90257ef       str x15, [sp, #1192]
0x2d15098c0e14   214  f9024fe0       str x0, [sp, #1176]
0x2d15098c0e18   218  aa0a03f4       mov x20, x10
0x2d15098c0e1c   21c  d2800013       movz x19, #0x0
0x2d15098c0e20   220  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c0e24   224  f8520355       ldur x21, [x26, #-224]
0x2d15098c0e28   228  eb3563ff       cmp sp, x21
0x2d15098c0e2c   22c  5400a2e9       b.ls #+0x145c (addr 0x2d15098c2288)
0x2d15098c0e30   230  6b0b029f       cmp w20, w11
0x2d15098c0e34   234  54000120       b.eq #+0x24 (addr 0x2d15098c0e58)
0x2d15098c0e38   238  b8746915       ldr w21, [x8, x20]
0x2d15098c0e3c   23c  11001294       add w20, w20, #0x4 (4)
0x2d15098c0e40   240  6b1501bf       cmp w13, w21
0x2d15098c0e44   244  54ffff09       b.ls #-0x20 (addr 0x2d15098c0e24)
0x2d15098c0e48   248  0b1509f5       add w21, w15, w21, lsl #2
0x2d15098c0e4c   24c  bc756903       ldr s3, [x8, x21]
0x2d15098c0e50   250  d2800035       movz x21, #0x1
0x2d15098c0e54   254  14000003       b #+0xc (addr 0x2d15098c0e60)
0x2d15098c0e58   258  d2800015       movz x21, #0x0
0x2d15098c0e5c   25c  aa0b03f4       mov x20, x11
0x2d15098c0e60   260  fd022fe3       str d3, [sp, #1112]
0x2d15098c0e64   264  f90247f4       str x20, [sp, #1160]
0x2d15098c0e68   268  710006bf       cmp w21, #0x1 (1)
0x2d15098c0e6c   26c  540004a1       b.ne #+0x94 (addr 0x2d15098c0f00)
0x2d15098c0e70   270  9100c035       add x21, x1, #0x30 (48)
0x2d15098c0e74   274  b8756915       ldr w21, [x8, x21]
0x2d15098c0e78   278  6b15027f       cmp w19, w21
0x2d15098c0e7c   27c  54000261       b.ne #+0x4c (addr 0x2d15098c0ec8)
0x2d15098c0e80   280  d2800023       movz x3, #0x1
0x2d15098c0e84   284  f90253f3       str x19, [sp, #1184]
0x2d15098c0e88   288  f94273e7       ldr x7, [sp, #1248]
0x2d15098c0e8c   28c  aa1303e2       mov x2, x19
0x2d15098c0e90   290  97fc11fc       bl #-0xfb810 (addr 0x2d15097c5680)
0x2d15098c0e94   294  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c0e98   298  f94017e1       ldr x1, [sp, #40]
0x2d15098c0e9c   29c  f941efee       ldr x14, [sp, #984]
0x2d15098c0ea0   2a0  f941ffec       ldr x12, [sp, #1016]
0x2d15098c0ea4   2a4  f9421fe6       ldr x6, [sp, #1080]
0x2d15098c0ea8   2a8  f94227eb       ldr x11, [sp, #1096]
0x2d15098c0eac   2ac  f94267e9       ldr x9, [sp, #1224]
0x2d15098c0eb0   2b0  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c0eb4   2b4  f94247f4       ldr x20, [sp, #1160]
0x2d15098c0eb8   2b8  f94253f3       ldr x19, [sp, #1184]
0x2d15098c0ebc   2bc  f9424fe0       ldr x0, [sp, #1176]
0x2d15098c0ec0   2c0  f94257ef       ldr x15, [sp, #1192]
0x2d15098c0ec4   2c4  f9425bed       ldr x13, [sp, #1200]
0x2d15098c0ec8   2c8  1100066a       add w10, w19, #0x1 (1)
0x2d15098c0ecc   2cc  aa0803f0       mov x16, x8
0x2d15098c0ed0   2d0  aa0603e8       mov x8, x6
0x2d15098c0ed4   2d4  aa1003e6       mov x6, x16
0x2d15098c0ed8   2d8  b82868ca       str w10, [x6, x8]
0x2d15098c0edc   2dc  9100d035       add x21, x1, #0x34 (52)
0x2d15098c0ee0   2e0  b87568d5       ldr w21, [x6, x21]
0x2d15098c0ee4   2e4  0b130ab3       add w19, w21, w19, lsl #2
0x2d15098c0ee8   2e8  bc3368c3       str s3, [x6, x19]
0x2d15098c0eec   2ec  aa0803f0       mov x16, x8
0x2d15098c0ef0   2f0  aa0603e8       mov x8, x6
0x2d15098c0ef4   2f4  aa1003e6       mov x6, x16
0x2d15098c0ef8   2f8  aa0a03f3       mov x19, x10
0x2d15098c0efc   2fc  17ffffca       b #-0xd8 (addr 0x2d15098c0e24)
0x2d15098c0f00   300  9101102a       add x10, x1, #0x44 (68)
0x2d15098c0f04   304  b82a691f       str wzr, [x8, x10]
0x2d15098c0f08   308  f941fbed       ldr x13, [sp, #1008]
0x2d15098c0f0c   30c  b86d690f       ldr w15, [x8, x13]
0x2d15098c0f10   310  f94007f3       ldr x19, [sp, #8]
0x2d15098c0f14   314  b8736914       ldr w20, [x8, x19]
0x2d15098c0f18   318  1100f120       add w0, w9, #0x3c (60)
0x2d15098c0f1c   31c  f9025bea       str x10, [sp, #1200]
0x2d15098c0f20   320  f90247ef       str x15, [sp, #1160]
0x2d15098c0f24   324  f9024ff4       str x20, [sp, #1176]
0x2d15098c0f28   328  f9024be0       str x0, [sp, #1168]
0x2d15098c0f2c   32c  aa0b03f5       mov x21, x11
0x2d15098c0f30   330  f9422beb       ldr x11, [sp, #1104]
0x2d15098c0f34   334  d2800002       movz x2, #0x0
0x2d15098c0f38   338  f8520356       ldur x22, [x26, #-224]
0x2d15098c0f3c   33c  eb3663ff       cmp sp, x22
0x2d15098c0f40   340  54009c89       b.ls #+0x1390 (addr 0x2d15098c22d0)
0x2d15098c0f44   344  6b15017f       cmp w11, w21
0x2d15098c0f48   348  54000120       b.eq #+0x24 (addr 0x2d15098c0f6c)
0x2d15098c0f4c   34c  b86b6916       ldr w22, [x8, x11]
0x2d15098c0f50   350  1100116b       add w11, w11, #0x4 (4)
0x2d15098c0f54   354  6b1601ff       cmp w15, w22
0x2d15098c0f58   358  54ffff09       b.ls #-0x20 (addr 0x2d15098c0f38)
0x2d15098c0f5c   35c  0b160a96       add w22, w20, w22, lsl #2
0x2d15098c0f60   360  bc766903       ldr s3, [x8, x22]
0x2d15098c0f64   364  d2800036       movz x22, #0x1
0x2d15098c0f68   368  14000003       b #+0xc (addr 0x2d15098c0f74)
0x2d15098c0f6c   36c  d2800016       movz x22, #0x0
0x2d15098c0f70   370  aa1503eb       mov x11, x21
0x2d15098c0f74   374  fd022fe3       str d3, [sp, #1112]
0x2d15098c0f78   378  f90253eb       str x11, [sp, #1184]
0x2d15098c0f7c   37c  710006df       cmp w22, #0x1 (1)
0x2d15098c0f80   380  540003e1       b.ne #+0x7c (addr 0x2d15098c0ffc)
0x2d15098c0f84   384  9100f036       add x22, x1, #0x3c (60)
0x2d15098c0f88   388  b8766916       ldr w22, [x8, x22]
0x2d15098c0f8c   38c  6b16005f       cmp w2, w22
0x2d15098c0f90   390  54000261       b.ne #+0x4c (addr 0x2d15098c0fdc)
0x2d15098c0f94   394  f90257e2       str x2, [sp, #1192]
0x2d15098c0f98   398  f94273e7       ldr x7, [sp, #1248]
0x2d15098c0f9c   39c  d2800023       movz x3, #0x1
0x2d15098c0fa0   3a0  97fc11b8       bl #-0xfb920 (addr 0x2d15097c5680)
0x2d15098c0fa4   3a4  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c0fa8   3a8  f94017e1       ldr x1, [sp, #40]
0x2d15098c0fac   3ac  f94007f3       ldr x19, [sp, #8]
0x2d15098c0fb0   3b0  f941fbed       ldr x13, [sp, #1008]
0x2d15098c0fb4   3b4  f9421fe6       ldr x6, [sp, #1080]
0x2d15098c0fb8   3b8  f9425bea       ldr x10, [sp, #1200]
0x2d15098c0fbc   3bc  f94227f5       ldr x21, [sp, #1096]
0x2d15098c0fc0   3c0  f94267e9       ldr x9, [sp, #1224]
0x2d15098c0fc4   3c4  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c0fc8   3c8  f94253eb       ldr x11, [sp, #1184]
0x2d15098c0fcc   3cc  f94257e2       ldr x2, [sp, #1192]
0x2d15098c0fd0   3d0  f9424be0       ldr x0, [sp, #1168]
0x2d15098c0fd4   3d4  f9424ff4       ldr x20, [sp, #1176]
0x2d15098c0fd8   3d8  f94247ef       ldr x15, [sp, #1160]
0x2d15098c0fdc   3dc  1100044c       add w12, w2, #0x1 (1)
0x2d15098c0fe0   3e0  b82a690c       str w12, [x8, x10]
0x2d15098c0fe4   3e4  9101002e       add x14, x1, #0x40 (64)
0x2d15098c0fe8   3e8  b86e690e       ldr w14, [x8, x14]
0x2d15098c0fec   3ec  0b0209ce       add w14, w14, w2, lsl #2
0x2d15098c0ff0   3f0  bc2e6903       str s3, [x8, x14]
0x2d15098c0ff4   3f4  aa0c03e2       mov x2, x12
0x2d15098c0ff8   3f8  17ffffd0       b #-0xc0 (addr 0x2d15098c0f38)
0x2d15098c0ffc   3fc  9101402b       add x11, x1, #0x50 (80)
0x2d15098c1000   400  b82b691f       str wzr, [x8, x11]
0x2d15098c1004   404  9100802c       add x12, x1, #0x20 (32)
0x2d15098c1008   408  b86c690e       ldr w14, [x8, x12]
0x2d15098c100c   40c  9100702f       add x15, x1, #0x1c (28)
0x2d15098c1010   410  b86f6914       ldr w20, [x8, x15]
0x2d15098c1014   414  11012120       add w0, w9, #0x48 (72)
0x2d15098c1018   418  f90257eb       str x11, [sp, #1192]
0x2d15098c101c   41c  f901f7ec       str x12, [sp, #1000]
0x2d15098c1020   420  f9024bee       str x14, [sp, #1168]
0x2d15098c1024   424  f9000bef       str x15, [sp, #16]
0x2d15098c1028   428  f90247f4       str x20, [sp, #1160]
0x2d15098c102c   42c  f90233e0       str x0, [sp, #1120]
0x2d15098c1030   430  aa1503f6       mov x22, x21
0x2d15098c1034   434  f9422bf5       ldr x21, [sp, #1104]
0x2d15098c1038   438  d2800002       movz x2, #0x0
0x2d15098c103c   43c  f8520357       ldur x23, [x26, #-224]
0x2d15098c1040   440  eb3763ff       cmp sp, x23
0x2d15098c1044   444  540096c9       b.ls #+0x12d8 (addr 0x2d15098c231c)
0x2d15098c1048   448  6b1602bf       cmp w21, w22
0x2d15098c104c   44c  54000120       b.eq #+0x24 (addr 0x2d15098c1070)
0x2d15098c1050   450  b8756917       ldr w23, [x8, x21]
0x2d15098c1054   454  110012b5       add w21, w21, #0x4 (4)
0x2d15098c1058   458  6b1701df       cmp w14, w23
0x2d15098c105c   45c  54ffff09       b.ls #-0x20 (addr 0x2d15098c103c)
0x2d15098c1060   460  0b170a97       add w23, w20, w23, lsl #2
0x2d15098c1064   464  bc776903       ldr s3, [x8, x23]
0x2d15098c1068   468  d2800037       movz x23, #0x1
0x2d15098c106c   46c  14000003       b #+0xc (addr 0x2d15098c1078)
0x2d15098c1070   470  d2800017       movz x23, #0x0
0x2d15098c1074   474  aa1603f5       mov x21, x22
0x2d15098c1078   478  fd022fe3       str d3, [sp, #1112]
0x2d15098c107c   47c  f9024ff5       str x21, [sp, #1176]
0x2d15098c1080   480  710006ff       cmp w23, #0x1 (1)
0x2d15098c1084   484  540003e1       b.ne #+0x7c (addr 0x2d15098c1100)
0x2d15098c1088   488  91012037       add x23, x1, #0x48 (72)
0x2d15098c108c   48c  b8776917       ldr w23, [x8, x23]
0x2d15098c1090   490  6b17005f       cmp w2, w23
0x2d15098c1094   494  54000261       b.ne #+0x4c (addr 0x2d15098c10e0)
0x2d15098c1098   498  f90253e2       str x2, [sp, #1184]
0x2d15098c109c   49c  f94273e7       ldr x7, [sp, #1248]
0x2d15098c10a0   4a0  d2800023       movz x3, #0x1
0x2d15098c10a4   4a4  97fc1177       bl #-0xfba24 (addr 0x2d15097c5680)
0x2d15098c10a8   4a8  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c10ac   4ac  f94017e1       ldr x1, [sp, #40]
0x2d15098c10b0   4b0  f9400bef       ldr x15, [sp, #16]
0x2d15098c10b4   4b4  f941f7ec       ldr x12, [sp, #1000]
0x2d15098c10b8   4b8  f9425bea       ldr x10, [sp, #1200]
0x2d15098c10bc   4bc  f94257eb       ldr x11, [sp, #1192]
0x2d15098c10c0   4c0  f94227f6       ldr x22, [sp, #1096]
0x2d15098c10c4   4c4  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c10c8   4c8  f94267e9       ldr x9, [sp, #1224]
0x2d15098c10cc   4cc  f9424ff5       ldr x21, [sp, #1176]
0x2d15098c10d0   4d0  f94253e2       ldr x2, [sp, #1184]
0x2d15098c10d4   4d4  f94233e0       ldr x0, [sp, #1120]
0x2d15098c10d8   4d8  f94247f4       ldr x20, [sp, #1160]
0x2d15098c10dc   4dc  f9424bee       ldr x14, [sp, #1168]
0x2d15098c10e0   4e0  11000446       add w6, w2, #0x1 (1)
0x2d15098c10e4   4e4  b82b6906       str w6, [x8, x11]
0x2d15098c10e8   4e8  9101302d       add x13, x1, #0x4c (76)
0x2d15098c10ec   4ec  b86d690d       ldr w13, [x8, x13]
0x2d15098c10f0   4f0  0b0209ad       add w13, w13, w2, lsl #2
0x2d15098c10f4   4f4  bc2d6903       str s3, [x8, x13]
0x2d15098c10f8   4f8  aa0603e2       mov x2, x6
0x2d15098c10fc   4fc  17ffffd0       b #-0xc0 (addr 0x2d15098c103c)
0x2d15098c1100   500  91017026       add x6, x1, #0x5c (92)
0x2d15098c1104   504  b826691f       str wzr, [x8, x6]
0x2d15098c1108   508  9100b02d       add x13, x1, #0x2c (44)
0x2d15098c110c   50c  b86d690e       ldr w14, [x8, x13]
0x2d15098c1110   510  9100a033       add x19, x1, #0x28 (40)
0x2d15098c1114   514  b8736914       ldr w20, [x8, x19]
0x2d15098c1118   518  11015120       add w0, w9, #0x54 (84)
0x2d15098c111c   51c  f90253e6       str x6, [sp, #1184]
0x2d15098c1120   520  f901f3ed       str x13, [sp, #992]
0x2d15098c1124   524  f90237ee       str x14, [sp, #1128]
0x2d15098c1128   528  f9000ff3       str x19, [sp, #24]
0x2d15098c112c   52c  f9024bf4       str x20, [sp, #1168]
0x2d15098c1130   530  f90267e0       str x0, [sp, #1224]
0x2d15098c1134   534  d2800002       movz x2, #0x0
0x2d15098c1138   538  f9422be9       ldr x9, [sp, #1104]
0x2d15098c113c   53c  aa1603f5       mov x21, x22
0x2d15098c1140   540  14000004       b #+0x10 (addr 0x2d15098c1150)
0x2d15098c1144   544  aa0803f0       mov x16, x8
0x2d15098c1148   548  aa0603e8       mov x8, x6
0x2d15098c114c   54c  aa1003e6       mov x6, x16
0x2d15098c1150   550  f8520356       ldur x22, [x26, #-224]
0x2d15098c1154   554  eb3663ff       cmp sp, x22
0x2d15098c1158   558  54009089       b.ls #+0x1210 (addr 0x2d15098c2368)
0x2d15098c115c   55c  6b15013f       cmp w9, w21
0x2d15098c1160   560  540001a0       b.eq #+0x34 (addr 0x2d15098c1194)
0x2d15098c1164   564  b8696916       ldr w22, [x8, x9]
0x2d15098c1168   568  11001129       add w9, w9, #0x4 (4)
0x2d15098c116c   56c  6b1601df       cmp w14, w22
0x2d15098c1170   570  540000a9       b.ls #+0x14 (addr 0x2d15098c1184)
0x2d15098c1174   574  0b160a96       add w22, w20, w22, lsl #2
0x2d15098c1178   578  bc766903       ldr s3, [x8, x22]
0x2d15098c117c   57c  d2800036       movz x22, #0x1
0x2d15098c1180   580  14000007       b #+0x1c (addr 0x2d15098c119c)
0x2d15098c1184   584  aa0603f0       mov x16, x6
0x2d15098c1188   588  aa0803e6       mov x6, x8
0x2d15098c118c   58c  aa1003e8       mov x8, x16
0x2d15098c1190   590  17ffffed       b #-0x4c (addr 0x2d15098c1144)
0x2d15098c1194   594  d2800016       movz x22, #0x0
0x2d15098c1198   598  aa1503e9       mov x9, x21
0x2d15098c119c   59c  f9022be9       str x9, [sp, #1104]
0x2d15098c11a0   5a0  fd022fe3       str d3, [sp, #1112]
0x2d15098c11a4   5a4  710006df       cmp w22, #0x1 (1)
0x2d15098c11a8   5a8  54000421       b.ne #+0x84 (addr 0x2d15098c122c)
0x2d15098c11ac   5ac  91015036       add x22, x1, #0x54 (84)
0x2d15098c11b0   5b0  b8766916       ldr w22, [x8, x22]
0x2d15098c11b4   5b4  6b16005f       cmp w2, w22
0x2d15098c11b8   5b8  54000241       b.ne #+0x48 (addr 0x2d15098c1200)
0x2d15098c11bc   5bc  f9024fe2       str x2, [sp, #1176]
0x2d15098c11c0   5c0  f94273e7       ldr x7, [sp, #1248]
0x2d15098c11c4   5c4  d2800023       movz x3, #0x1
0x2d15098c11c8   5c8  97fc112e       bl #-0xfbb48 (addr 0x2d15097c5680)
0x2d15098c11cc   5cc  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c11d0   5d0  f94017e1       ldr x1, [sp, #40]
0x2d15098c11d4   5d4  f9400ff3       ldr x19, [sp, #24]
0x2d15098c11d8   5d8  f941f3ed       ldr x13, [sp, #992]
0x2d15098c11dc   5dc  f94257eb       ldr x11, [sp, #1192]
0x2d15098c11e0   5e0  f94253e6       ldr x6, [sp, #1184]
0x2d15098c11e4   5e4  f9424fe2       ldr x2, [sp, #1176]
0x2d15098c11e8   5e8  f9422be9       ldr x9, [sp, #1104]
0x2d15098c11ec   5ec  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c11f0   5f0  f94267e0       ldr x0, [sp, #1224]
0x2d15098c11f4   5f4  f94227f5       ldr x21, [sp, #1096]
0x2d15098c11f8   5f8  f9424bf4       ldr x20, [sp, #1168]
0x2d15098c11fc   5fc  f94237ee       ldr x14, [sp, #1128]
0x2d15098c1200   600  1100044a       add w10, w2, #0x1 (1)
0x2d15098c1204   604  aa0803f0       mov x16, x8
0x2d15098c1208   608  aa0603e8       mov x8, x6
0x2d15098c120c   60c  aa1003e6       mov x6, x16
0x2d15098c1210   610  b82868ca       str w10, [x6, x8]
0x2d15098c1214   614  9101602c       add x12, x1, #0x58 (88)
0x2d15098c1218   618  b86c68cc       ldr w12, [x6, x12]
0x2d15098c121c   61c  0b02098c       add w12, w12, w2, lsl #2
0x2d15098c1220   620  bc2c68c3       str s3, [x6, x12]
0x2d15098c1224   624  aa0a03e2       mov x2, x10
0x2d15098c1228   628  17ffffc7       b #-0xe4 (addr 0x2d15098c1144)
0x2d15098c122c   62c  f9421fe9       ldr x9, [sp, #1080]
0x2d15098c1230   630  b869690a       ldr w10, [x8, x9]
0x2d15098c1234   634  9100c02c       add x12, x1, #0x30 (48)
0x2d15098c1238   638  3cec6902       ldr q2, [x8, x12]
0x2d15098c123c   63c  3ce16903       ldr q3, [x8, x1]
0x2d15098c1240   640  3cac6903       str q3, [x8, x12]
0x2d15098c1244   644  3ca16902       str q2, [x8, x1]
0x2d15098c1248   648  9101002c       add x12, x1, #0x40 (64)
0x2d15098c124c   64c  3cec6902       ldr q2, [x8, x12]
0x2d15098c1250   650  f94007ee       ldr x14, [sp, #8]
0x2d15098c1254   654  3cee6903       ldr q3, [x8, x14]
0x2d15098c1258   658  3cac6903       str q3, [x8, x12]
0x2d15098c125c   65c  3cae6902       str q2, [x8, x14]
0x2d15098c1260   660  f86b690f       ldr x15, [x8, x11]
0x2d15098c1264   664  91016034       add x20, x1, #0x58 (88)
0x2d15098c1268   668  b8746915       ldr w21, [x8, x20]
0x2d15098c126c   66c  f941f7f6       ldr x22, [sp, #1000]
0x2d15098c1270   670  3cf66902       ldr q2, [x8, x22]
0x2d15098c1274   674  3cab6902       str q2, [x8, x11]
0x2d15098c1278   678  b8336915       str w21, [x8, x19]
0x2d15098c127c   67c  b82d6902       str w2, [x8, x13]
0x2d15098c1280   680  f836690f       str x15, [x8, x22]
0x2d15098c1284   684  f90267ea       str x10, [sp, #1224]
0x2d15098c1288   688  3500010a       cbnz w10, #+0x20 (addr 0x2d15098c12a8)
0x2d15098c128c   68c  f9426be4       ldr x4, [sp, #1232]
0x2d15098c1290   690  11014081       add w1, w4, #0x50 (80)
0x2d15098c1294   694  f9426fef       ldr x15, [sp, #1240]
0x2d15098c1298   698  b90001e1       str w1, [x15]
0x2d15098c129c   69c  910003bf       mov sp, fp
0x2d15098c12a0   6a0  a8c17bfd       ldp fp, lr, [sp], #16
0x2d15098c12a4   6a4  d65f03c0       ret
0x2d15098c12a8   6a8  b8666906       ldr w6, [x8, x6]
0x2d15098c12ac   6ac  b86b690b       ldr w11, [x8, x11]
0x2d15098c12b0   6b0  f9425bef       ldr x15, [sp, #1200]
0x2d15098c12b4   6b4  b86f690f       ldr w15, [x8, x15]
0x2d15098c12b8   6b8  b8696909       ldr w9, [x8, x9]
0x2d15098c12bc   6bc  6b0901ff       cmp w15, w9
0x2d15098c12c0   6c0  1a8931f5       csel w21, w15, w9, lo
0x2d15098c12c4   6c4  6b15017f       cmp w11, w21
0x2d15098c12c8   6c8  1a953169       csel w9, w11, w21, lo
0x2d15098c12cc   6cc  6b0900df       cmp w6, w9
0x2d15098c12d0   6d0  1a8930cb       csel w11, w6, w9, lo
0x2d15098c12d4   6d4  91029026       add x6, x1, #0xa4 (164)
0x2d15098c12d8   6d8  bc666902       ldr s2, [x8, x6]
0x2d15098c12dc   6dc  1e220842       fmul s2, s2, s2
0x2d15098c12e0   6e0  4e040443       dup v3.4s, v2.s[0]
0x2d15098c12e4   6e4  fd4263e4       ldr d4, [sp, #1216]
0x2d15098c12e8   6e8  1e240884       fmul s4, s4, s4
0x2d15098c12ec   6ec  4e040485       dup v5.4s, v4.s[0]
0x2d15098c12f0   6f0  b8746906       ldr w6, [x8, x20]
0x2d15098c12f4   6f4  91013029       add x9, x1, #0x4c (76)
0x2d15098c12f8   6f8  b8696909       ldr w9, [x8, x9]
0x2d15098c12fc   6fc  b86c690c       ldr w12, [x8, x12]
0x2d15098c1300   700  9100d02f       add x15, x1, #0x34 (52)
0x2d15098c1304   704  b86f690f       ldr w15, [x8, x15]
0x2d15098c1308   708  f90247eb       str x11, [sp, #1160]
0x2d15098c130c   70c  fd020be2       str d2, [sp, #1040]
0x2d15098c1310   710  3d80cbe3       str q3, [sp, #800]
0x2d15098c1314   714  fd020fe4       str d4, [sp, #1048]
0x2d15098c1318   718  3d8043e5       str q5, [sp, #256]
0x2d15098c131c   71c  f9025be6       str x6, [sp, #1200]
0x2d15098c1320   720  f90253e9       str x9, [sp, #1184]
0x2d15098c1324   724  f9024fec       str x12, [sp, #1176]
0x2d15098c1328   728  f9024bef       str x15, [sp, #1168]
0x2d15098c132c   72c  f941fff5       ldr x21, [sp, #1016]
0x2d15098c1330   730  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c1334   734  d280001c       movz x28, #0x0
0x2d15098c1338   738  f94013fb       ldr cp, [sp, #32]
0x2d15098c133c   73c  f9400bf9       ldr x25, [sp, #16]
0x2d15098c1340   740  f941eff8       ldr x24, [sp, #984]
0x2d15098c1344   744  f941fbf7       ldr x23, [sp, #1008]
0x2d15098c1348   748  aa1c03f4       mov x20, x28
0x2d15098c134c   74c  f8520340       ldur x0, [x26, #-224]
0x2d15098c1350   750  eb2063ff       cmp sp, x0
0x2d15098c1354   754  540082e9       b.ls #+0x105c (addr 0x2d15098c23b0)
0x2d15098c1358   758  b8756900       ldr w0, [x8, x21]
0x2d15098c135c   75c  f9003be0       str x0, [sp, #112]
0x2d15098c1360   760  6b14001f       cmp w0, w20
0x2d15098c1364   764  54007509       b.ls #+0xea0 (addr 0x2d15098c2204)
0x2d15098c1368   768  b8776902       ldr w2, [x8, x23]
0x2d15098c136c   76c  6b14005f       cmp w2, w20
0x2d15098c1370   770  540074a9       b.ls #+0xe94 (addr 0x2d15098c2204)
0x2d15098c1374   774  b8766903       ldr w3, [x8, x22]
0x2d15098c1378   778  6b14007f       cmp w3, w20
0x2d15098c137c   77c  54007449       b.ls #+0xe88 (addr 0x2d15098c2204)
0x2d15098c1380   780  b86d6904       ldr w4, [x8, x13]
0x2d15098c1384   784  6b14009f       cmp w4, w20
0x2d15098c1388   788  540073e9       b.ls #+0xe7c (addr 0x2d15098c2204)
0x2d15098c138c   78c  b8786905       ldr w5, [x8, x24]
0x2d15098c1390   790  531e7687       lsl w7, w20, #2
0x2d15098c1394   794  0b0700a6       add w6, w5, w7
0x2d15098c1398   798  bc666909       ldr s9, [x8, x6]
0x2d15098c139c   79c  b86e6906       ldr w6, [x8, x14]
0x2d15098c13a0   7a0  0b0700c9       add w9, w6, w7
0x2d15098c13a4   7a4  bc69690a       ldr s10, [x8, x9]
0x2d15098c13a8   7a8  b8796909       ldr w9, [x8, x25]
0x2d15098c13ac   7ac  0b07012a       add w10, w9, w7
0x2d15098c13b0   7b0  bc6a690b       ldr s11, [x8, x10]
0x2d15098c13b4   7b4  b873690a       ldr w10, [x8, x19]
0x2d15098c13b8   7b8  0b07014b       add w11, w10, w7
0x2d15098c13bc   7bc  bc6b690c       ldr s12, [x8, x11]
0x2d15098c13c0   7c0  f9426bec       ldr x12, [sp, #1232]
0x2d15098c13c4   7c4  9100318b       add x11, x12, #0xc (12)
0x2d15098c13c8   7c8  bc2b690c       str s12, [x8, x11]
0x2d15098c13cc   7cc  9100218b       add x11, x12, #0x8 (8)
0x2d15098c13d0   7d0  bc2b690b       str s11, [x8, x11]
0x2d15098c13d4   7d4  9100118b       add x11, x12, #0x4 (4)
0x2d15098c13d8   7d8  bc2b690a       str s10, [x8, x11]
0x2d15098c13dc   7dc  bc2c6909       str s9, [x8, x12]
0x2d15098c13e0   7e0  9100818b       add x11, x12, #0x20 (32)
0x2d15098c13e4   7e4  f82b691f       str xzr, [x8, x11]
0x2d15098c13e8   7e8  6f00e40b       movi v11.2d, #0x0
0x2d15098c13ec   7ec  9100418d       add x13, x12, #0x10 (16)
0x2d15098c13f0   7f0  3cad690b       str q11, [x8, x13]
0x2d15098c13f4   7f4  bc7b690b       ldr s11, [x8, x27]
0x2d15098c13f8   7f8  9100a18e       add x14, x12, #0x28 (40)
0x2d15098c13fc   7fc  b82e691f       str wzr, [x8, x14]
0x2d15098c1400   800  9102302f       add x15, x1, #0x8c (140)
0x2d15098c1404   804  b86f690f       ldr w15, [x8, x15]
0x2d15098c1408   808  710001ff       cmp w15, #0x0 (0)
0x2d15098c140c   80c  9a9f07f3       cset x19, ne
0x2d15098c1410   810  4b1301ef       sub w15, w15, w19
0x2d15098c1414   814  1e2b094c       fmul s12, s10, s11
0x2d15098c1418   818  1e2c2180       fcmp s12, s12
0x2d15098c141c   81c  1e2c1dec       fcsel s12, s15, s12, ne
0x2d15098c1420   820  1e202188       fcmp s12, #0.0
0x2d15098c1424   824  1e2fcd8c       fcsel s12, s12, s15, gt
0x2d15098c1428   828  1e25418c       frintm s12, s12
0x2d15098c142c   82c  1e22c18d       fcvt d13, s12
0x2d15098c1430   830  1e65c1ae       frintz d14, d13
0x2d15098c1434   834  1e7901d3       fcvtzu w19, d14
0x2d15098c1438   838  1e630270       ucvtf d16, w19
0x2d15098c143c   83c  f90263f4       str x20, [sp, #1216]
0x2d15098c1440   840  f90257e7       str x7, [sp, #1192]
0x2d15098c1444   844  fd0203e9       str d9, [sp, #1024]
0x2d15098c1448   848  f90047e6       str x6, [sp, #136]
0x2d15098c144c   84c  fd0207ea       str d10, [sp, #1032]
0x2d15098c1450   850  f9003fe9       str x9, [sp, #120]
0x2d15098c1454   854  f90233eb       str x11, [sp, #1120]
0x2d15098c1458   858  f90237ed       str x13, [sp, #1128]
0x2d15098c145c   85c  f9022fee       str x14, [sp, #1112]
0x2d15098c1460   860  1e7021c0       fcmp d14, d16
0x2d15098c1464   864  54007cc1       b.ne #+0xf98 (addr 0x2d15098c23fc)
0x2d15098c1468   868  6b1301ff       cmp w15, w19
0x2d15098c146c   86c  1a9331f4       csel w20, w15, w19, lo
0x2d15098c1470   870  52a9f010       movz w16, #0x4f800000
0x2d15098c1474   874  1e27020d       fmov s13, w16
0x2d15098c1478   878  1e2d2180       fcmp s12, s13
0x2d15098c147c   87c  1a9f3293       csel w19, w20, wzr, lo
0x2d15098c1480   880  7100027f       cmp w19, #0x0 (0)
0x2d15098c1484   884  9a9f07f4       cset x20, ne
0x2d15098c1488   888  4b140274       sub w20, w19, w20
0x2d15098c148c   88c  11000673       add w19, w19, #0x1 (1)
0x2d15098c1490   890  6b1301ff       cmp w15, w19
0x2d15098c1494   894  1a9331f5       csel w21, w15, w19, lo
0x2d15098c1498   898  6b1402bf       cmp w21, w20
0x2d15098c149c   89c  540062e3       b.lo #+0xc5c (addr 0x2d15098c20f8)
0x2d15098c14a0   8a0  9102202f       add x15, x1, #0x88 (136)
0x2d15098c14a4   8a4  b86f690f       ldr w15, [x8, x15]
0x2d15098c14a8   8a8  710001ff       cmp w15, #0x0 (0)
0x2d15098c14ac   8ac  9a9f07f3       cset x19, ne
0x2d15098c14b0   8b0  4b1301f3       sub w19, w15, w19
0x2d15098c14b4   8b4  1e2b092b       fmul s11, s9, s11
0x2d15098c14b8   8b8  1e2b2160       fcmp s11, s11
0x2d15098c14bc   8bc  1e2b1deb       fcsel s11, s15, s11, ne
0x2d15098c14c0   8c0  1e202168       fcmp s11, #0.0
0x2d15098c14c4   8c4  1e2fcd6b       fcsel s11, s11, s15, gt
0x2d15098c14c8   8c8  1e25416b       frintm s11, s11
0x2d15098c14cc   8cc  1e22c16c       fcvt d12, s11
0x2d15098c14d0   8d0  1e65c18e       frintz d14, d12
0x2d15098c14d4   8d4  1e7901d6       fcvtzu w22, d14
0x2d15098c14d8   8d8  1e6302d0       ucvtf d16, w22
0x2d15098c14dc   8dc  f90023ef       str x15, [sp, #64]
0x2d15098c14e0   8e0  1e7021c0       fcmp d14, d16
0x2d15098c14e4   8e4  540079c1       b.ne #+0xf38 (addr 0x2d15098c241c)
0x2d15098c14e8   8e8  6b16027f       cmp w19, w22
0x2d15098c14ec   8ec  1a963277       csel w23, w19, w22, lo
0x2d15098c14f0   8f0  1e2d2160       fcmp s11, s13
0x2d15098c14f4   8f4  1a9f32f6       csel w22, w23, wzr, lo
0x2d15098c14f8   8f8  710002df       cmp w22, #0x0 (0)
0x2d15098c14fc   8fc  9a9f07f7       cset x23, ne
0x2d15098c1500   900  4b1702d7       sub w23, w22, w23
0x2d15098c1504   904  110006d6       add w22, w22, #0x1 (1)
0x2d15098c1508   908  6b16027f       cmp w19, w22
0x2d15098c150c   90c  1a963278       csel w24, w19, w22, lo
0x2d15098c1510   910  11000713       add w19, w24, #0x1 (1)
0x2d15098c1514   914  4e04052b       dup v11.4s, v9.s[0]
0x2d15098c1518   918  4e04054c       dup v12.4s, v10.s[0]
0x2d15098c151c   91c  91019036       add x22, x1, #0x64 (100)
0x2d15098c1520   920  b8766916       ldr w22, [x8, x22]
0x2d15098c1524   924  9101a038       add x24, x1, #0x68 (104)
0x2d15098c1528   928  b8786918       ldr w24, [x8, x24]
0x2d15098c152c   92c  f90027f7       str x23, [sp, #72]
0x2d15098c1530   930  f9002bf3       str x19, [sp, #80]
0x2d15098c1534   934  3d803beb       str q11, [sp, #224]
0x2d15098c1538   938  3d803fec       str q12, [sp, #240]
0x2d15098c153c   93c  f90033f6       str x22, [sp, #96]
0x2d15098c1540   940  f9002ff8       str x24, [sp, #88]
0x2d15098c1544   944  3dc00ffe       ldr q30, [sp, #48]
0x2d15098c1548   948  3d80e7fe       str q30, [sp, #912]
0x2d15098c154c   94c  b903bbff       str wzr, [sp, #952]
0x2d15098c1550   950  b903b3ff       str wzr, [sp, #944]
0x2d15098c1554   954  b903abff       str wzr, [sp, #936]
0x2d15098c1558   958  14000013       b #+0x4c (addr 0x2d15098c15a4)
0x2d15098c155c   95c  3d80e7f1       str q17, [sp, #912]
0x2d15098c1560   960  fd01dfed       str d13, [sp, #952]
0x2d15098c1564   964  fd01dbee       str d14, [sp, #944]
0x2d15098c1568   968  fd01d7f0       str d16, [sp, #936]
0x2d15098c156c   96c  aa0103f4       mov x20, x1
0x2d15098c1570   970  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c1574   974  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c1578   978  3dc043e5       ldr q5, [sp, #256]
0x2d15098c157c   97c  3dc03fec       ldr q12, [sp, #240]
0x2d15098c1580   980  3dc03beb       ldr q11, [sp, #224]
0x2d15098c1584   984  f94047e6       ldr x6, [sp, #136]
0x2d15098c1588   988  f9403fe9       ldr x9, [sp, #120]
0x2d15098c158c   98c  f9403be0       ldr x0, [sp, #112]
0x2d15098c1590   990  f94033f6       ldr x22, [sp, #96]
0x2d15098c1594   994  f9402ff8       ldr x24, [sp, #88]
0x2d15098c1598   998  f9402bf3       ldr x19, [sp, #80]
0x2d15098c159c   99c  f94027f7       ldr x23, [sp, #72]
0x2d15098c15a0   9a0  f94023ef       ldr x15, [sp, #64]
0x2d15098c15a4   9a4  f8520341       ldur x1, [x26, #-224]
0x2d15098c15a8   9a8  eb2163ff       cmp sp, x1
0x2d15098c15ac   9ac  54007489       b.ls #+0xe90 (addr 0x2d15098c243c)
0x2d15098c15b0   9b0  1b0f7e81       mul w1, w20, w15
0x2d15098c15b4   9b4  0b170039       add w25, w1, w23
0x2d15098c15b8   9b8  6b19031f       cmp w24, w25
0x2d15098c15bc   9bc  54000129       b.ls #+0x24 (addr 0x2d15098c15e0)
0x2d15098c15c0   9c0  0b010261       add w1, w19, w1
0x2d15098c15c4   9c4  6b01031f       cmp w24, w1
0x2d15098c15c8   9c8  540000c9       b.ls #+0x18 (addr 0x2d15098c15e0)
0x2d15098c15cc   9cc  0b010ac1       add w1, w22, w1, lsl #2
0x2d15098c15d0   9d0  b8616901       ldr w1, [x8, x1]
0x2d15098c15d4   9d4  0b190ad9       add w25, w22, w25, lsl #2
0x2d15098c15d8   9d8  b8796919       ldr w25, [x8, x25]
0x2d15098c15dc   9dc  14000003       b #+0xc (addr 0x2d15098c15e8)
0x2d15098c15e0   9e0  aa1c03e1       mov x1, x28
0x2d15098c15e4   9e4  aa1c03f9       mov x25, x28
0x2d15098c15e8   9e8  531e773b       lsl w27, w25, #2
0x2d15098c15ec   9ec  0b1b00a7       add w7, w5, w27
0x2d15098c15f0   9f0  4b19002d       sub w13, w1, w25
0x2d15098c15f4   9f4  6b01001f       cmp w0, w1
0x2d15098c15f8   9f8  9a9f27eb       cset x11, lo
0x2d15098c15fc   9fc  6b19003f       cmp w1, w25
0x2d15098c1600   a00  9a9f27ec       cset x12, lo
0x2d15098c1604   a04  2a0c016e       orr w14, w11, w12
0x2d15098c1608   a08  6a0e01df       tst w14, w14
0x2d15098c160c   a0c  1a8d13ee       csel w14, wzr, w13, ne
0x2d15098c1610   a10  6b19003f       cmp w1, w25
0x2d15098c1614   a14  540003e3       b.lo #+0x7c (addr 0x2d15098c1690)
0x2d15098c1618   a18  0b1b0139       add w25, w9, w27
0x2d15098c161c   a1c  d2800089       movz x9, #0x4
0x2d15098c1620   a20  6b01007f       cmp w3, w1
0x2d15098c1624   a24  1a99312f       csel w15, w9, w25, lo
0x2d15098c1628   a28  6b01007f       cmp w3, w1
0x2d15098c162c   a2c  1a8d3399       csel w25, w28, w13, lo
0x2d15098c1630   a30  121c6333       and w19, w25, #0x1ffffff0
0x2d15098c1634   a34  0b1309f3       add w19, w15, w19, lsl #2
0x2d15098c1638   a38  0b1b00d6       add w22, w6, w27
0x2d15098c163c   a3c  6b01005f       cmp w2, w1
0x2d15098c1640   a40  1a963126       csel w6, w9, w22, lo
0x2d15098c1644   a44  6b01005f       cmp w2, w1
0x2d15098c1648   a48  1a8d3396       csel w22, w28, w13, lo
0x2d15098c164c   a4c  121c62d7       and w23, w22, #0x1ffffff0
0x2d15098c1650   a50  0b1708d7       add w23, w6, w23, lsl #2
0x2d15098c1654   a54  53047f38       lsr w24, w25, #4
0x2d15098c1658   a58  12000f39       and w25, w25, #0xf
0x2d15098c165c   a5c  53047ec0       lsr w0, w22, #4
0x2d15098c1660   a60  12000ed6       and w22, w22, #0xf
0x2d15098c1664   a64  6b01009f       cmp w4, w1
0x2d15098c1668   a68  540000c3       b.lo #+0x18 (addr 0x2d15098c1680)
0x2d15098c166c   a6c  0b1b0141       add w1, w10, w27
0x2d15098c1670   a70  aa0d03f0       mov x16, x13
0x2d15098c1674   a74  aa0603ed       mov x13, x6
0x2d15098c1678   a78  aa1003e6       mov x6, x16
0x2d15098c167c   a7c  14000010       b #+0x40 (addr 0x2d15098c16bc)
0x2d15098c1680   a80  aa0603ed       mov x13, x6
0x2d15098c1684   a84  aa1c03e6       mov x6, x28
0x2d15098c1688   a88  aa0903e1       mov x1, x9
0x2d15098c168c   a8c  1400000c       b #+0x30 (addr 0x2d15098c16bc)
0x2d15098c1690   a90  aa1c03e6       mov x6, x28
0x2d15098c1694   a94  aa1c03f9       mov x25, x28
0x2d15098c1698   a98  d2800089       movz x9, #0x4
0x2d15098c169c   a9c  aa1c03f6       mov x22, x28
0x2d15098c16a0   aa0  aa1c03e0       mov x0, x28
0x2d15098c16a4   aa4  aa1c03f8       mov x24, x28
0x2d15098c16a8   aa8  aa0903e1       mov x1, x9
0x2d15098c16ac   aac  aa0903ed       mov x13, x9
0x2d15098c16b0   ab0  aa0903ef       mov x15, x9
0x2d15098c16b4   ab4  aa0903f3       mov x19, x9
0x2d15098c16b8   ab8  aa0903f7       mov x23, x9
0x2d15098c16bc   abc  2a0c016b       orr w11, w11, w12
0x2d15098c16c0   ac0  6a0b017f       tst w11, w11
0x2d15098c16c4   ac4  1a871129       csel w9, w9, w7, ne
0x2d15098c16c8   ac8  53047ccb       lsr w11, w6, #4
0x2d15098c16cc   acc  53047dcc       lsr w12, w14, #4
0x2d15098c16d0   ad0  6b0c001f       cmp w0, w12
0x2d15098c16d4   ad4  1a8c301b       csel w27, w0, w12, lo
0x2d15098c16d8   ad8  6b1b031f       cmp w24, w27
0x2d15098c16dc   adc  1a9b330c       csel w12, w24, w27, lo
0x2d15098c16e0   ae0  6b0c017f       cmp w11, w12
0x2d15098c16e4   ae4  1a8c3178       csel w24, w11, w12, lo
0x2d15098c16e8   ae8  350003d8       cbnz w24, #+0x78 (addr 0x2d15098c1760)
0x2d15098c16ec   aec  6f00e412       movi v18.2d, #0x0
0x2d15098c16f0   af0  4eb21e47       mov v7.16b, v18.16b
0x2d15098c16f4   af4  4eb21e43       mov v3.16b, v18.16b
0x2d15098c16f8   af8  4eb21e41       mov v1.16b, v18.16b
0x2d15098c16fc   afc  4eb21e5a       mov v26.16b, v18.16b
0x2d15098c1700   b00  4eb21e50       mov v16.16b, v18.16b
0x2d15098c1704   b04  4eb21e5b       mov v27.16b, v18.16b
0x2d15098c1708   b08  4eb21e4e       mov v14.16b, v18.16b
0x2d15098c170c   b0c  4eb21e4c       mov v12.16b, v18.16b
0x2d15098c1710   b10  4eb21e51       mov v17.16b, v18.16b
0x2d15098c1714   b14  4eb21e4b       mov v11.16b, v18.16b
0x2d15098c1718   b18  4eb21e49       mov v9.16b, v18.16b
0x2d15098c171c   b1c  4eb21e4a       mov v10.16b, v18.16b
0x2d15098c1720   b20  4eb21e48       mov v8.16b, v18.16b
0x2d15098c1724   b24  4eb21e40       mov v0.16b, v18.16b
0x2d15098c1728   b28  4eb21e46       mov v6.16b, v18.16b
0x2d15098c172c   b2c  4eb21e4d       mov v13.16b, v18.16b
0x2d15098c1730   b30  4eb21e58       mov v24.16b, v18.16b
0x2d15098c1734   b34  4eb21e42       mov v2.16b, v18.16b
0x2d15098c1738   b38  4eb21e5c       mov v28.16b, v18.16b
0x2d15098c173c   b3c  4eb21e59       mov v25.16b, v18.16b
0x2d15098c1740   b40  4eb21e44       mov v4.16b, v18.16b
0x2d15098c1744   b44  4eb21e57       mov v23.16b, v18.16b
0x2d15098c1748   b48  4eb21e54       mov v20.16b, v18.16b
0x2d15098c174c   b4c  4eb21e56       mov v22.16b, v18.16b
0x2d15098c1750   b50  4eb21e45       mov v5.16b, v18.16b
0x2d15098c1754   b54  4eb21e53       mov v19.16b, v18.16b
0x2d15098c1758   b58  4eb21e55       mov v21.16b, v18.16b
0x2d15098c175c   b5c  140000ff       b #+0x3fc (addr 0x2d15098c1b58)
0x2d15098c1760   b60  6f00e412       movi v18.2d, #0x0
0x2d15098c1764   b64  4eb21e4e       mov v14.16b, v18.16b
0x2d15098c1768   b68  3d808bf2       str q18, [sp, #544]
0x2d15098c176c   b6c  4eb21e41       mov v1.16b, v18.16b
0x2d15098c1770   b70  4eb21e48       mov v8.16b, v18.16b
0x2d15098c1774   b74  4eb21e50       mov v16.16b, v18.16b
0x2d15098c1778   b78  3d8083f2       str q18, [sp, #512]
0x2d15098c177c   b7c  4eb21e46       mov v6.16b, v18.16b
0x2d15098c1780   b80  4eb21e49       mov v9.16b, v18.16b
0x2d15098c1784   b84  4eb21e51       mov v17.16b, v18.16b
0x2d15098c1788   b88  3d807ff2       str q18, [sp, #496]
0x2d15098c178c   b8c  4eb21e42       mov v2.16b, v18.16b
0x2d15098c1790   b90  4eb21e4a       mov v10.16b, v18.16b
0x2d15098c1794   b94  3d804bf2       str q18, [sp, #288]
0x2d15098c1798   b98  4eb21e40       mov v0.16b, v18.16b
0x2d15098c179c   b9c  4eb21e44       mov v4.16b, v18.16b
0x2d15098c17a0   ba0  4eb21e4d       mov v13.16b, v18.16b
0x2d15098c17a4   ba4  3d802ff2       str q18, [sp, #176]
0x2d15098c17a8   ba8  3d8047f2       str q18, [sp, #272]
0x2d15098c17ac   bac  3d8037f2       str q18, [sp, #208]
0x2d15098c17b0   bb0  3d8033f2       str q18, [sp, #192]
0x2d15098c17b4   bb4  3d809ff2       str q18, [sp, #624]
0x2d15098c17b8   bb8  aa1c03eb       mov x11, x28
0x2d15098c17bc   bbc  3d80c7f2       str q18, [sp, #784]
0x2d15098c17c0   bc0  3d80b3f2       str q18, [sp, #704]
0x2d15098c17c4   bc4  3d8097f2       str q18, [sp, #592]
0x2d15098c17c8   bc8  3d80d7f2       str q18, [sp, #848]
0x2d15098c17cc   bcc  3d80bff2       str q18, [sp, #752]
0x2d15098c17d0   bd0  3d80abf2       str q18, [sp, #672]
0x2d15098c17d4   bd4  1400000f       b #+0x3c (addr 0x2d15098c1810)
0x2d15098c17d8   bd8  3dc03beb       ldr q11, [sp, #224]
0x2d15098c17dc   bdc  3d808bfa       str q26, [sp, #544]
0x2d15098c17e0   be0  3dc03fec       ldr q12, [sp, #240]
0x2d15098c17e4   be4  3d807fe5       str q5, [sp, #496]
0x2d15098c17e8   be8  3dc043e5       ldr q5, [sp, #256]
0x2d15098c17ec   bec  3d80abf7       str q23, [sp, #672]
0x2d15098c17f0   bf0  3d8083fb       str q27, [sp, #512]
0x2d15098c17f4   bf4  3d80bff5       str q21, [sp, #752]
0x2d15098c17f8   bf8  3d80d7f3       str q19, [sp, #848]
0x2d15098c17fc   bfc  3d8097f9       str q25, [sp, #592]
0x2d15098c1800   c00  3d80b3f6       str q22, [sp, #704]
0x2d15098c1804   c04  3d80c7f4       str q20, [sp, #784]
0x2d15098c1808   c08  3d804bfc       str q28, [sp, #288]
0x2d15098c180c   c0c  3d809ff8       str q24, [sp, #624]
0x2d15098c1810   c10  f852034c       ldur x12, [x26, #-224]
0x2d15098c1814   c14  3d80dff2       str q18, [sp, #880]
0x2d15098c1818   c18  eb2c63ff       cmp sp, x12
0x2d15098c181c   c1c  540064e9       b.ls #+0xc9c (addr 0x2d15098c24b8)
0x2d15098c1820   c20  0b0b012c       add w12, w9, w11
0x2d15098c1824   c24  3cec6912       ldr q18, [x8, x12]
0x2d15098c1828   c28  4eb2d573       fsub v19.4s, v11.4s, v18.4s
0x2d15098c182c   c2c  6e33de74       fmul v20.4s, v19.4s, v19.4s
0x2d15098c1830   c30  0b0b01bb       add w27, w13, w11
0x2d15098c1834   c34  3cfb6915       ldr q21, [x8, x27]
0x2d15098c1838   c38  4eb5d596       fsub v22.4s, v12.4s, v21.4s
0x2d15098c183c   c3c  6e36ded7       fmul v23.4s, v22.4s, v22.4s
0x2d15098c1840   c40  4e37d694       fadd v20.4s, v20.4s, v23.4s
0x2d15098c1844   c44  6e23e697       fcmge v23.4s, v20.4s, v3.4s
0x2d15098c1848   c48  6eb4e4b8       fcmgt v24.4s, v5.4s, v20.4s
0x2d15098c184c   c4c  4e381ef7       and v23.16b, v23.16b, v24.16b
0x2d15098c1850   c50  4ea0ca98       fcmgt v24.4s, v20.4s, #0.0
0x2d15098c1854   c54  4e271f18       and v24.16b, v24.16b, v7.16b
0x2d15098c1858   c58  4e21db18       scvtf v24.4s, v24.4s
0x2d15098c185c   c5c  4e381ef7       and v23.16b, v23.16b, v24.16b
0x2d15098c1860   c60  3dc02ff8       ldr q24, [sp, #176]
0x2d15098c1864   c64  4e38d6f8       fadd v24.4s, v23.4s, v24.4s
0x2d15098c1868   c68  1100c180       add w0, w12, #0x30 (48)
0x2d15098c186c   c6c  3d802ff8       str q24, [sp, #176]
0x2d15098c1870   c70  3ce06918       ldr q24, [x8, x0]
0x2d15098c1874   c74  3d809bf3       str q19, [sp, #608]
0x2d15098c1878   c78  4eb8d573       fsub v19.4s, v11.4s, v24.4s
0x2d15098c187c   c7c  6e33de79       fmul v25.4s, v19.4s, v19.4s
0x2d15098c1880   c80  1100c360       add w0, w27, #0x30 (48)
0x2d15098c1884   c84  3d80aff3       str q19, [sp, #688]
0x2d15098c1888   c88  3ce06913       ldr q19, [x8, x0]
0x2d15098c188c   c8c  3d8093f6       str q22, [sp, #576]
0x2d15098c1890   c90  4eb3d596       fsub v22.4s, v12.4s, v19.4s
0x2d15098c1894   c94  3d808ff4       str q20, [sp, #560]
0x2d15098c1898   c98  6e36ded4       fmul v20.4s, v22.4s, v22.4s
0x2d15098c189c   c9c  4e34d734       fadd v20.4s, v25.4s, v20.4s
0x2d15098c18a0   ca0  6e23e699       fcmge v25.4s, v20.4s, v3.4s
0x2d15098c18a4   ca4  3d80a7f6       str q22, [sp, #656]
0x2d15098c18a8   ca8  6eb4e4b6       fcmgt v22.4s, v5.4s, v20.4s
0x2d15098c18ac   cac  4e361f36       and v22.16b, v25.16b, v22.16b
0x2d15098c18b0   cb0  4ea0ca99       fcmgt v25.4s, v20.4s, #0.0
0x2d15098c18b4   cb4  4e271f39       and v25.16b, v25.16b, v7.16b
0x2d15098c18b8   cb8  4e21db39       scvtf v25.4s, v25.4s
0x2d15098c18bc   cbc  4e391ed6       and v22.16b, v22.16b, v25.16b
0x2d15098c18c0   cc0  3dc033f9       ldr q25, [sp, #192]
0x2d15098c18c4   cc4  4e39d6d9       fadd v25.4s, v22.4s, v25.4s
0x2d15098c18c8   cc8  11008180       add w0, w12, #0x20 (32)
0x2d15098c18cc   ccc  3d8033f9       str q25, [sp, #192]
0x2d15098c18d0   cd0  3ce06919       ldr q25, [x8, x0]
0x2d15098c18d4   cd4  3d80a3f4       str q20, [sp, #640]
0x2d15098c18d8   cd8  4eb9d574       fsub v20.4s, v11.4s, v25.4s
0x2d15098c18dc   cdc  6e34de9a       fmul v26.4s, v20.4s, v20.4s
0x2d15098c18e0   ce0  11008360       add w0, w27, #0x20 (32)
0x2d15098c18e4   ce4  3d80c3f4       str q20, [sp, #768]
0x2d15098c18e8   ce8  3ce06914       ldr q20, [x8, x0]
0x2d15098c18ec   cec  4eb4d59b       fsub v27.4s, v12.4s, v20.4s
0x2d15098c18f0   cf0  6e3bdf7c       fmul v28.4s, v27.4s, v27.4s
0x2d15098c18f4   cf4  4e3cd75a       fadd v26.4s, v26.4s, v28.4s
0x2d15098c18f8   cf8  6e23e75c       fcmge v28.4s, v26.4s, v3.4s
0x2d15098c18fc   cfc  3d80bbfb       str q27, [sp, #736]
0x2d15098c1900   d00  6ebae4bb       fcmgt v27.4s, v5.4s, v26.4s
0x2d15098c1904   d04  4e3b1f9b       and v27.16b, v28.16b, v27.16b
0x2d15098c1908   d08  4ea0cb5c       fcmgt v28.4s, v26.4s, #0.0
0x2d15098c190c   d0c  4e271f9c       and v28.16b, v28.16b, v7.16b
0x2d15098c1910   d10  4e21db9c       scvtf v28.4s, v28.4s
0x2d15098c1914   d14  4e3c1f7b       and v27.16b, v27.16b, v28.16b
0x2d15098c1918   d18  3dc037fc       ldr q28, [sp, #208]
0x2d15098c191c   d1c  4e3cd77c       fadd v28.4s, v27.4s, v28.4s
0x2d15098c1920   d20  1100418c       add w12, w12, #0x10 (16)
0x2d15098c1924   d24  3d8037fc       str q28, [sp, #208]
0x2d15098c1928   d28  3cec691c       ldr q28, [x8, x12]
0x2d15098c192c   d2c  3d80b7fa       str q26, [sp, #720]
0x2d15098c1930   d30  4ebcd57a       fsub v26.4s, v11.4s, v28.4s
0x2d15098c1934   d34  6e3adf4b       fmul v11.4s, v26.4s, v26.4s
0x2d15098c1938   d38  1100436c       add w12, w27, #0x10 (16)
0x2d15098c193c   d3c  3d80dbfa       str q26, [sp, #864]
0x2d15098c1940   d40  3cec691a       ldr q26, [x8, x12]
0x2d15098c1944   d44  3d8087fc       str q28, [sp, #528]
0x2d15098c1948   d48  4ebad59c       fsub v28.4s, v12.4s, v26.4s
0x2d15098c194c   d4c  6e3cdf8c       fmul v12.4s, v28.4s, v28.4s
0x2d15098c1950   d50  4e2cd56b       fadd v11.4s, v11.4s, v12.4s
0x2d15098c1954   d54  6e23e56c       fcmge v12.4s, v11.4s, v3.4s
0x2d15098c1958   d58  3d80d3fc       str q28, [sp, #832]
0x2d15098c195c   d5c  6eabe4bc       fcmgt v28.4s, v5.4s, v11.4s
0x2d15098c1960   d60  4e3c1d8c       and v12.16b, v12.16b, v28.16b
0x2d15098c1964   d64  4ea0c97c       fcmgt v28.4s, v11.4s, #0.0
0x2d15098c1968   d68  4e271f9c       and v28.16b, v28.16b, v7.16b
0x2d15098c196c   d6c  4e21db9c       scvtf v28.4s, v28.4s
0x2d15098c1970   d70  4e3c1d8c       and v12.16b, v12.16b, v28.16b
0x2d15098c1974   d74  3dc047fc       ldr q28, [sp, #272]
0x2d15098c1978   d78  4e3cd59c       fadd v28.4s, v12.4s, v28.4s
0x2d15098c197c   d7c  0b0b002c       add w12, w1, w11
0x2d15098c1980   d80  3cec6905       ldr q5, [x8, x12]
0x2d15098c1984   d84  6e37dca5       fmul v5.4s, v5.4s, v23.4s
0x2d15098c1988   d88  3d8047fc       str q28, [sp, #272]
0x2d15098c198c   d8c  3dc04bfc       ldr q28, [sp, #288]
0x2d15098c1990   d90  4e3cd4bc       fadd v28.4s, v5.4s, v28.4s
0x2d15098c1994   d94  0b0b01fb       add w27, w15, w11
0x2d15098c1998   d98  3cfb6905       ldr q5, [x8, x27]
0x2d15098c199c   d9c  6e37dca5       fmul v5.4s, v5.4s, v23.4s
0x2d15098c19a0   da0  4e31d4b1       fadd v17.4s, v5.4s, v17.4s
0x2d15098c19a4   da4  6e37dea5       fmul v5.4s, v21.4s, v23.4s
0x2d15098c19a8   da8  4e30d4b0       fadd v16.4s, v5.4s, v16.4s
0x2d15098c19ac   dac  6e37de45       fmul v5.4s, v18.4s, v23.4s
0x2d15098c19b0   db0  4e25d5ce       fadd v14.4s, v14.4s, v5.4s
0x2d15098c19b4   db4  1100c180       add w0, w12, #0x30 (48)
0x2d15098c19b8   db8  3ce06905       ldr q5, [x8, x0]
0x2d15098c19bc   dbc  6e36dca5       fmul v5.4s, v5.4s, v22.4s
0x2d15098c19c0   dc0  4e2dd4ad       fadd v13.4s, v5.4s, v13.4s
0x2d15098c19c4   dc4  1100c360       add w0, w27, #0x30 (48)
0x2d15098c19c8   dc8  3ce06905       ldr q5, [x8, x0]
0x2d15098c19cc   dcc  6e36dca5       fmul v5.4s, v5.4s, v22.4s
0x2d15098c19d0   dd0  4e2ad4aa       fadd v10.4s, v5.4s, v10.4s
0x2d15098c19d4   dd4  6e36de65       fmul v5.4s, v19.4s, v22.4s
0x2d15098c19d8   dd8  4e29d4a9       fadd v9.4s, v5.4s, v9.4s
0x2d15098c19dc   ddc  6e36df05       fmul v5.4s, v24.4s, v22.4s
0x2d15098c19e0   de0  4e25d508       fadd v8.4s, v8.4s, v5.4s
0x2d15098c19e4   de4  11008180       add w0, w12, #0x20 (32)
0x2d15098c19e8   de8  3ce06905       ldr q5, [x8, x0]
0x2d15098c19ec   dec  6e3bdca5       fmul v5.4s, v5.4s, v27.4s
0x2d15098c19f0   df0  4e24d4a4       fadd v4.4s, v5.4s, v4.4s
0x2d15098c19f4   df4  11008360       add w0, w27, #0x20 (32)
0x2d15098c19f8   df8  3ce06905       ldr q5, [x8, x0]
0x2d15098c19fc   dfc  6e3bdca5       fmul v5.4s, v5.4s, v27.4s
0x2d15098c1a00   e00  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x2d15098c1a04   e04  6e3bde85       fmul v5.4s, v20.4s, v27.4s
0x2d15098c1a08   e08  4e26d4a6       fadd v6.4s, v5.4s, v6.4s
0x2d15098c1a0c   e0c  6e3bdf25       fmul v5.4s, v25.4s, v27.4s
0x2d15098c1a10   e10  4e25d421       fadd v1.4s, v1.4s, v5.4s
0x2d15098c1a14   e14  1100418c       add w12, w12, #0x10 (16)
0x2d15098c1a18   e18  3cec6905       ldr q5, [x8, x12]
0x2d15098c1a1c   e1c  6e2cdca5       fmul v5.4s, v5.4s, v12.4s
0x2d15098c1a20   e20  4e20d4a0       fadd v0.4s, v5.4s, v0.4s
0x2d15098c1a24   e24  1100436c       add w12, w27, #0x10 (16)
0x2d15098c1a28   e28  3cec6905       ldr q5, [x8, x12]
0x2d15098c1a2c   e2c  6e2cdca5       fmul v5.4s, v5.4s, v12.4s
0x2d15098c1a30   e30  3dc07ff2       ldr q18, [sp, #496]
0x2d15098c1a34   e34  4e32d4a5       fadd v5.4s, v5.4s, v18.4s
0x2d15098c1a38   e38  6e2cdf52       fmul v18.4s, v26.4s, v12.4s
0x2d15098c1a3c   e3c  3dc083fb       ldr q27, [sp, #512]
0x2d15098c1a40   e40  4e3bd65b       fadd v27.4s, v18.4s, v27.4s
0x2d15098c1a44   e44  3dc087f2       ldr q18, [sp, #528]
0x2d15098c1a48   e48  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x2d15098c1a4c   e4c  3dc08bfa       ldr q26, [sp, #544]
0x2d15098c1a50   e50  4e2cd75a       fadd v26.4s, v26.4s, v12.4s
0x2d15098c1a54   e54  3dc08fec       ldr q12, [sp, #560]
0x2d15098c1a58   e58  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x2d15098c1a5c   e5c  4e271d8c       and v12.16b, v12.16b, v7.16b
0x2d15098c1a60   e60  4e21d98c       scvtf v12.4s, v12.4s
0x2d15098c1a64   e64  3dc093f2       ldr q18, [sp, #576]
0x2d15098c1a68   e68  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x2d15098c1a6c   e6c  3dc097f9       ldr q25, [sp, #592]
0x2d15098c1a70   e70  4e32d739       fadd v25.4s, v25.4s, v18.4s
0x2d15098c1a74   e74  3dc09bf2       ldr q18, [sp, #608]
0x2d15098c1a78   e78  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x2d15098c1a7c   e7c  3dc09ff8       ldr q24, [sp, #624]
0x2d15098c1a80   e80  4e2cd718       fadd v24.4s, v24.4s, v12.4s
0x2d15098c1a84   e84  3dc0a3ec       ldr q12, [sp, #640]
0x2d15098c1a88   e88  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x2d15098c1a8c   e8c  4e271d8c       and v12.16b, v12.16b, v7.16b
0x2d15098c1a90   e90  4e21d98c       scvtf v12.4s, v12.4s
0x2d15098c1a94   e94  3dc0a7f2       ldr q18, [sp, #656]
0x2d15098c1a98   e98  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x2d15098c1a9c   e9c  3dc0abf7       ldr q23, [sp, #672]
0x2d15098c1aa0   ea0  4e32d6f7       fadd v23.4s, v23.4s, v18.4s
0x2d15098c1aa4   ea4  3dc0aff2       ldr q18, [sp, #688]
0x2d15098c1aa8   ea8  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x2d15098c1aac   eac  3dc0b3f6       ldr q22, [sp, #704]
0x2d15098c1ab0   eb0  4e2cd6d6       fadd v22.4s, v22.4s, v12.4s
0x2d15098c1ab4   eb4  3dc0b7ec       ldr q12, [sp, #720]
0x2d15098c1ab8   eb8  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x2d15098c1abc   ebc  4e271d8c       and v12.16b, v12.16b, v7.16b
0x2d15098c1ac0   ec0  4e21d98c       scvtf v12.4s, v12.4s
0x2d15098c1ac4   ec4  3dc0bbf2       ldr q18, [sp, #736]
0x2d15098c1ac8   ec8  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x2d15098c1acc   ecc  3dc0bff5       ldr q21, [sp, #752]
0x2d15098c1ad0   ed0  4e32d6b5       fadd v21.4s, v21.4s, v18.4s
0x2d15098c1ad4   ed4  3dc0c3f2       ldr q18, [sp, #768]
0x2d15098c1ad8   ed8  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x2d15098c1adc   edc  3dc0c7f4       ldr q20, [sp, #784]
0x2d15098c1ae0   ee0  4e2cd694       fadd v20.4s, v20.4s, v12.4s
0x2d15098c1ae4   ee4  6eabe46b       fcmgt v11.4s, v3.4s, v11.4s
0x2d15098c1ae8   ee8  4e271d6b       and v11.16b, v11.16b, v7.16b
0x2d15098c1aec   eec  4e21d96b       scvtf v11.4s, v11.4s
0x2d15098c1af0   ef0  3dc0d3ec       ldr q12, [sp, #832]
0x2d15098c1af4   ef4  6e2bdd8c       fmul v12.4s, v12.4s, v11.4s
0x2d15098c1af8   ef8  3dc0d7f3       ldr q19, [sp, #848]
0x2d15098c1afc   efc  4e2cd673       fadd v19.4s, v19.4s, v12.4s
0x2d15098c1b00   f00  3dc0dbec       ldr q12, [sp, #864]
0x2d15098c1b04   f04  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x2d15098c1b08   f08  3dc0dff2       ldr q18, [sp, #880]
0x2d15098c1b0c   f0c  4e2bd652       fadd v18.4s, v18.4s, v11.4s
0x2d15098c1b10   f10  1101016b       add w11, w11, #0x40 (64)
0x2d15098c1b14   f14  51000718       sub w24, w24, #0x1 (1)
0x2d15098c1b18   f18  35ffe618       cbnz w24, #-0x340 (addr 0x2d15098c17d8)
0x2d15098c1b1c   f1c  4eae1dc7       mov v7.16b, v14.16b
0x2d15098c1b20   f20  4eba1f43       mov v3.16b, v26.16b
0x2d15098c1b24   f24  4ea51cab       mov v11.16b, v5.16b
0x2d15098c1b28   f28  4eb91f25       mov v5.16b, v25.16b
0x2d15098c1b2c   f2c  4ea81d1a       mov v26.16b, v8.16b
0x2d15098c1b30   f30  4ea61cce       mov v14.16b, v6.16b
0x2d15098c1b34   f34  4ea41c86       mov v6.16b, v4.16b
0x2d15098c1b38   f38  4eb81f04       mov v4.16b, v24.16b
0x2d15098c1b3c   f3c  3dc033f9       ldr q25, [sp, #192]
0x2d15098c1b40   f40  4ea91d2c       mov v12.16b, v9.16b
0x2d15098c1b44   f44  4ebc1f88       mov v8.16b, v28.16b
0x2d15098c1b48   f48  3dc037fc       ldr q28, [sp, #208]
0x2d15098c1b4c   f4c  4ea21c49       mov v9.16b, v2.16b
0x2d15098c1b50   f50  3dc047e2       ldr q2, [sp, #272]
0x2d15098c1b54   f54  3dc02ff8       ldr q24, [sp, #176]
0x2d15098c1b58   f58  3d8033f9       str q25, [sp, #192]
0x2d15098c1b5c   f5c  5e0404f9       mov s25, v7.s[0]
0x2d15098c1b60   f60  3d8037fc       str q28, [sp, #208]
0x2d15098c1b64   f64  5e0c04fc       mov s28, v7.s[1]
0x2d15098c1b68   f68  1e3c2b39       fadd s25, s25, s28
0x2d15098c1b6c   f6c  5e1404fc       mov s28, v7.s[2]
0x2d15098c1b70   f70  1e3c2b39       fadd s25, s25, s28
0x2d15098c1b74   f74  5e1c04e7       mov s7, v7.s[3]
0x2d15098c1b78   f78  1e272b27       fadd s7, s25, s7
0x2d15098c1b7c   f7c  5e040479       mov s25, v3.s[0]
0x2d15098c1b80   f80  1e3928e7       fadd s7, s7, s25
0x2d15098c1b84   f84  5e0c0479       mov s25, v3.s[1]
0x2d15098c1b88   f88  1e3928e7       fadd s7, s7, s25
0x2d15098c1b8c   f8c  5e140479       mov s25, v3.s[2]
0x2d15098c1b90   f90  1e3928e7       fadd s7, s7, s25
0x2d15098c1b94   f94  5e1c0463       mov s3, v3.s[3]
0x2d15098c1b98   f98  1e2328e3       fadd s3, s7, s3
0x2d15098c1b9c   f9c  5e040427       mov s7, v1.s[0]
0x2d15098c1ba0   fa0  1e272863       fadd s3, s3, s7
0x2d15098c1ba4   fa4  5e0c0427       mov s7, v1.s[1]
0x2d15098c1ba8   fa8  1e272863       fadd s3, s3, s7
0x2d15098c1bac   fac  5e140427       mov s7, v1.s[2]
0x2d15098c1bb0   fb0  1e272863       fadd s3, s3, s7
0x2d15098c1bb4   fb4  5e1c0427       mov s7, v1.s[3]
0x2d15098c1bb8   fb8  1e272863       fadd s3, s3, s7
0x2d15098c1bbc   fbc  5e040747       mov s7, v26.s[0]
0x2d15098c1bc0   fc0  1e272863       fadd s3, s3, s7
0x2d15098c1bc4   fc4  5e0c0747       mov s7, v26.s[1]
0x2d15098c1bc8   fc8  1e272863       fadd s3, s3, s7
0x2d15098c1bcc   fcc  5e140747       mov s7, v26.s[2]
0x2d15098c1bd0   fd0  1e272863       fadd s3, s3, s7
0x2d15098c1bd4   fd4  5e1c0747       mov s7, v26.s[3]
0x2d15098c1bd8   fd8  1e272863       fadd s3, s3, s7
0x2d15098c1bdc   fdc  4e040463       dup v3.4s, v3.s[0]
0x2d15098c1be0   fe0  5e040607       mov s7, v16.s[0]
0x2d15098c1be4   fe4  5e0c0619       mov s25, v16.s[1]
0x2d15098c1be8   fe8  1e3928e7       fadd s7, s7, s25
0x2d15098c1bec   fec  5e140619       mov s25, v16.s[2]
0x2d15098c1bf0   ff0  1e3928e7       fadd s7, s7, s25
0x2d15098c1bf4   ff4  5e1c0610       mov s16, v16.s[3]
0x2d15098c1bf8   ff8  1e3028e7       fadd s7, s7, s16
0x2d15098c1bfc   ffc  5e040770       mov s16, v27.s[0]
0x2d15098c1c00  1000  1e3028e7       fadd s7, s7, s16
0x2d15098c1c04  1004  5e0c0770       mov s16, v27.s[1]
0x2d15098c1c08  1008  1e3028e7       fadd s7, s7, s16
0x2d15098c1c0c  100c  5e140770       mov s16, v27.s[2]
0x2d15098c1c10  1010  1e3028e7       fadd s7, s7, s16
0x2d15098c1c14  1014  5e1c0770       mov s16, v27.s[3]
0x2d15098c1c18  1018  1e3028e7       fadd s7, s7, s16
0x2d15098c1c1c  101c  5e0405d0       mov s16, v14.s[0]
0x2d15098c1c20  1020  1e3028e7       fadd s7, s7, s16
0x2d15098c1c24  1024  5e0c05d0       mov s16, v14.s[1]
0x2d15098c1c28  1028  1e3028e7       fadd s7, s7, s16
0x2d15098c1c2c  102c  5e1405d0       mov s16, v14.s[2]
0x2d15098c1c30  1030  1e3028e7       fadd s7, s7, s16
0x2d15098c1c34  1034  5e1c05ce       mov s14, v14.s[3]
0x2d15098c1c38  1038  1e2e28e7       fadd s7, s7, s14
0x2d15098c1c3c  103c  5e04058e       mov s14, v12.s[0]
0x2d15098c1c40  1040  1e2e28e7       fadd s7, s7, s14
0x2d15098c1c44  1044  5e0c058e       mov s14, v12.s[1]
0x2d15098c1c48  1048  1e2e28e7       fadd s7, s7, s14
0x2d15098c1c4c  104c  5e14058e       mov s14, v12.s[2]
0x2d15098c1c50  1050  1e2e28e7       fadd s7, s7, s14
0x2d15098c1c54  1054  5e1c058c       mov s12, v12.s[3]
0x2d15098c1c58  1058  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c5c  105c  6e0c04e3       mov v3.s[1], v7.s[0]
0x2d15098c1c60  1060  5e040627       mov s7, v17.s[0]
0x2d15098c1c64  1064  5e0c062c       mov s12, v17.s[1]
0x2d15098c1c68  1068  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c6c  106c  5e14062c       mov s12, v17.s[2]
0x2d15098c1c70  1070  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c74  1074  5e1c062c       mov s12, v17.s[3]
0x2d15098c1c78  1078  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c7c  107c  5e04056c       mov s12, v11.s[0]
0x2d15098c1c80  1080  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c84  1084  5e0c056c       mov s12, v11.s[1]
0x2d15098c1c88  1088  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c8c  108c  5e14056c       mov s12, v11.s[2]
0x2d15098c1c90  1090  1e2c28e7       fadd s7, s7, s12
0x2d15098c1c94  1094  5e1c056b       mov s11, v11.s[3]
0x2d15098c1c98  1098  1e2b28e7       fadd s7, s7, s11
0x2d15098c1c9c  109c  5e04052b       mov s11, v9.s[0]
0x2d15098c1ca0  10a0  1e2b28e7       fadd s7, s7, s11
0x2d15098c1ca4  10a4  5e0c052b       mov s11, v9.s[1]
0x2d15098c1ca8  10a8  1e2b28e7       fadd s7, s7, s11
0x2d15098c1cac  10ac  5e14052b       mov s11, v9.s[2]
0x2d15098c1cb0  10b0  1e2b28e7       fadd s7, s7, s11
0x2d15098c1cb4  10b4  5e1c0529       mov s9, v9.s[3]
0x2d15098c1cb8  10b8  1e2928e7       fadd s7, s7, s9
0x2d15098c1cbc  10bc  5e040549       mov s9, v10.s[0]
0x2d15098c1cc0  10c0  1e2928e7       fadd s7, s7, s9
0x2d15098c1cc4  10c4  5e0c0549       mov s9, v10.s[1]
0x2d15098c1cc8  10c8  1e2928e7       fadd s7, s7, s9
0x2d15098c1ccc  10cc  5e140549       mov s9, v10.s[2]
0x2d15098c1cd0  10d0  1e2928e7       fadd s7, s7, s9
0x2d15098c1cd4  10d4  5e1c0549       mov s9, v10.s[3]
0x2d15098c1cd8  10d8  1e2928e7       fadd s7, s7, s9
0x2d15098c1cdc  10dc  6e1404e3       mov v3.s[2], v7.s[0]
0x2d15098c1ce0  10e0  5e040507       mov s7, v8.s[0]
0x2d15098c1ce4  10e4  5e0c0509       mov s9, v8.s[1]
0x2d15098c1ce8  10e8  1e2928e7       fadd s7, s7, s9
0x2d15098c1cec  10ec  5e140509       mov s9, v8.s[2]
0x2d15098c1cf0  10f0  1e2928e7       fadd s7, s7, s9
0x2d15098c1cf4  10f4  5e1c0508       mov s8, v8.s[3]
0x2d15098c1cf8  10f8  1e2828e7       fadd s7, s7, s8
0x2d15098c1cfc  10fc  5e040408       mov s8, v0.s[0]
0x2d15098c1d00  1100  1e2828e7       fadd s7, s7, s8
0x2d15098c1d04  1104  5e0c0408       mov s8, v0.s[1]
0x2d15098c1d08  1108  1e2828e7       fadd s7, s7, s8
0x2d15098c1d0c  110c  5e140408       mov s8, v0.s[2]
0x2d15098c1d10  1110  1e2828e7       fadd s7, s7, s8
0x2d15098c1d14  1114  5e1c0408       mov s8, v0.s[3]
0x2d15098c1d18  1118  1e2828e7       fadd s7, s7, s8
0x2d15098c1d1c  111c  5e0404c8       mov s8, v6.s[0]
0x2d15098c1d20  1120  1e2828e7       fadd s7, s7, s8
0x2d15098c1d24  1124  5e0c04c8       mov s8, v6.s[1]
0x2d15098c1d28  1128  1e2828e7       fadd s7, s7, s8
0x2d15098c1d2c  112c  5e1404c8       mov s8, v6.s[2]
0x2d15098c1d30  1130  1e2828e7       fadd s7, s7, s8
0x2d15098c1d34  1134  5e1c04c6       mov s6, v6.s[3]
0x2d15098c1d38  1138  1e2628e6       fadd s6, s7, s6
0x2d15098c1d3c  113c  5e0405a7       mov s7, v13.s[0]
0x2d15098c1d40  1140  1e2728c6       fadd s6, s6, s7
0x2d15098c1d44  1144  5e0c05a7       mov s7, v13.s[1]
0x2d15098c1d48  1148  1e2728c6       fadd s6, s6, s7
0x2d15098c1d4c  114c  5e1405a7       mov s7, v13.s[2]
0x2d15098c1d50  1150  1e2728c6       fadd s6, s6, s7
0x2d15098c1d54  1154  5e1c05a7       mov s7, v13.s[3]
0x2d15098c1d58  1158  1e2728c6       fadd s6, s6, s7
0x2d15098c1d5c  115c  6e1c04c3       mov v3.s[3], v6.s[0]
0x2d15098c1d60  1160  3dc0e7f1       ldr q17, [sp, #912]
0x2d15098c1d64  1164  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x2d15098c1d68  1168  5e0404a3       mov s3, v5.s[0]
0x2d15098c1d6c  116c  5e0c04a6       mov s6, v5.s[1]
0x2d15098c1d70  1170  1e262863       fadd s3, s3, s6
0x2d15098c1d74  1174  5e1404a6       mov s6, v5.s[2]
0x2d15098c1d78  1178  1e262863       fadd s3, s3, s6
0x2d15098c1d7c  117c  5e1c04a5       mov s5, v5.s[3]
0x2d15098c1d80  1180  1e252863       fadd s3, s3, s5
0x2d15098c1d84  1184  5e040665       mov s5, v19.s[0]
0x2d15098c1d88  1188  1e252863       fadd s3, s3, s5
0x2d15098c1d8c  118c  5e0c0665       mov s5, v19.s[1]
0x2d15098c1d90  1190  1e252863       fadd s3, s3, s5
0x2d15098c1d94  1194  5e140665       mov s5, v19.s[2]
0x2d15098c1d98  1198  1e252863       fadd s3, s3, s5
0x2d15098c1d9c  119c  5e1c0665       mov s5, v19.s[3]
0x2d15098c1da0  11a0  1e252863       fadd s3, s3, s5
0x2d15098c1da4  11a4  5e0406a5       mov s5, v21.s[0]
0x2d15098c1da8  11a8  1e252863       fadd s3, s3, s5
0x2d15098c1dac  11ac  5e0c06a5       mov s5, v21.s[1]
0x2d15098c1db0  11b0  1e252863       fadd s3, s3, s5
0x2d15098c1db4  11b4  5e1406a5       mov s5, v21.s[2]
0x2d15098c1db8  11b8  1e252863       fadd s3, s3, s5
0x2d15098c1dbc  11bc  5e1c06a5       mov s5, v21.s[3]
0x2d15098c1dc0  11c0  1e252863       fadd s3, s3, s5
0x2d15098c1dc4  11c4  5e0406e5       mov s5, v23.s[0]
0x2d15098c1dc8  11c8  1e252863       fadd s3, s3, s5
0x2d15098c1dcc  11cc  5e0c06e5       mov s5, v23.s[1]
0x2d15098c1dd0  11d0  1e252863       fadd s3, s3, s5
0x2d15098c1dd4  11d4  5e1406e5       mov s5, v23.s[2]
0x2d15098c1dd8  11d8  1e252863       fadd s3, s3, s5
0x2d15098c1ddc  11dc  5e1c06e5       mov s5, v23.s[3]
0x2d15098c1de0  11e0  1e252863       fadd s3, s3, s5
0x2d15098c1de4  11e4  fd41d7f0       ldr d16, [sp, #936]
0x2d15098c1de8  11e8  1e232a10       fadd s16, s16, s3
0x2d15098c1dec  11ec  5e040483       mov s3, v4.s[0]
0x2d15098c1df0  11f0  5e0c0485       mov s5, v4.s[1]
0x2d15098c1df4  11f4  1e252863       fadd s3, s3, s5
0x2d15098c1df8  11f8  5e140485       mov s5, v4.s[2]
0x2d15098c1dfc  11fc  1e252863       fadd s3, s3, s5
0x2d15098c1e00  1200  5e1c0484       mov s4, v4.s[3]
0x2d15098c1e04  1204  1e242863       fadd s3, s3, s4
0x2d15098c1e08  1208  5e040644       mov s4, v18.s[0]
0x2d15098c1e0c  120c  1e242863       fadd s3, s3, s4
0x2d15098c1e10  1210  5e0c0644       mov s4, v18.s[1]
0x2d15098c1e14  1214  1e242863       fadd s3, s3, s4
0x2d15098c1e18  1218  5e140644       mov s4, v18.s[2]
0x2d15098c1e1c  121c  1e242863       fadd s3, s3, s4
0x2d15098c1e20  1220  5e1c0644       mov s4, v18.s[3]
0x2d15098c1e24  1224  1e242863       fadd s3, s3, s4
0x2d15098c1e28  1228  5e040684       mov s4, v20.s[0]
0x2d15098c1e2c  122c  1e242863       fadd s3, s3, s4
0x2d15098c1e30  1230  5e0c0684       mov s4, v20.s[1]
0x2d15098c1e34  1234  1e242863       fadd s3, s3, s4
0x2d15098c1e38  1238  5e140684       mov s4, v20.s[2]
0x2d15098c1e3c  123c  1e242863       fadd s3, s3, s4
0x2d15098c1e40  1240  5e1c0684       mov s4, v20.s[3]
0x2d15098c1e44  1244  1e242863       fadd s3, s3, s4
0x2d15098c1e48  1248  5e0406c4       mov s4, v22.s[0]
0x2d15098c1e4c  124c  1e242863       fadd s3, s3, s4
0x2d15098c1e50  1250  5e0c06c4       mov s4, v22.s[1]
0x2d15098c1e54  1254  1e242863       fadd s3, s3, s4
0x2d15098c1e58  1258  5e1406c4       mov s4, v22.s[2]
0x2d15098c1e5c  125c  1e242863       fadd s3, s3, s4
0x2d15098c1e60  1260  5e1c06c4       mov s4, v22.s[3]
0x2d15098c1e64  1264  1e242863       fadd s3, s3, s4
0x2d15098c1e68  1268  fd41dbee       ldr d14, [sp, #944]
0x2d15098c1e6c  126c  1e2329ce       fadd s14, s14, s3
0x2d15098c1e70  1270  5e040703       mov s3, v24.s[0]
0x2d15098c1e74  1274  5e0c0704       mov s4, v24.s[1]
0x2d15098c1e78  1278  1e242863       fadd s3, s3, s4
0x2d15098c1e7c  127c  5e140704       mov s4, v24.s[2]
0x2d15098c1e80  1280  1e242863       fadd s3, s3, s4
0x2d15098c1e84  1284  5e1c0704       mov s4, v24.s[3]
0x2d15098c1e88  1288  1e242863       fadd s3, s3, s4
0x2d15098c1e8c  128c  5e040444       mov s4, v2.s[0]
0x2d15098c1e90  1290  1e242863       fadd s3, s3, s4
0x2d15098c1e94  1294  5e0c0444       mov s4, v2.s[1]
0x2d15098c1e98  1298  1e242863       fadd s3, s3, s4
0x2d15098c1e9c  129c  5e140444       mov s4, v2.s[2]
0x2d15098c1ea0  12a0  1e242863       fadd s3, s3, s4
0x2d15098c1ea4  12a4  5e1c0442       mov s2, v2.s[3]
0x2d15098c1ea8  12a8  1e222862       fadd s2, s3, s2
0x2d15098c1eac  12ac  3dc037fc       ldr q28, [sp, #208]
0x2d15098c1eb0  12b0  5e040783       mov s3, v28.s[0]
0x2d15098c1eb4  12b4  1e232842       fadd s2, s2, s3
0x2d15098c1eb8  12b8  5e0c0783       mov s3, v28.s[1]
0x2d15098c1ebc  12bc  1e232842       fadd s2, s2, s3
0x2d15098c1ec0  12c0  5e140783       mov s3, v28.s[2]
0x2d15098c1ec4  12c4  1e232842       fadd s2, s2, s3
0x2d15098c1ec8  12c8  5e1c0783       mov s3, v28.s[3]
0x2d15098c1ecc  12cc  1e232842       fadd s2, s2, s3
0x2d15098c1ed0  12d0  3dc033f9       ldr q25, [sp, #192]
0x2d15098c1ed4  12d4  5e040723       mov s3, v25.s[0]
0x2d15098c1ed8  12d8  1e232842       fadd s2, s2, s3
0x2d15098c1edc  12dc  5e0c0723       mov s3, v25.s[1]
0x2d15098c1ee0  12e0  1e232842       fadd s2, s2, s3
0x2d15098c1ee4  12e4  5e140723       mov s3, v25.s[2]
0x2d15098c1ee8  12e8  1e232842       fadd s2, s2, s3
0x2d15098c1eec  12ec  5e1c0723       mov s3, v25.s[3]
0x2d15098c1ef0  12f0  1e232842       fadd s2, s2, s3
0x2d15098c1ef4  12f4  fd41dfed       ldr d13, [sp, #952]
0x2d15098c1ef8  12f8  1e2229ad       fadd s13, s13, s2
0x2d15098c1efc  12fc  12000ccb       and w11, w6, #0xf
0x2d15098c1f00  1300  12000dcc       and w12, w14, #0xf
0x2d15098c1f04  1304  6b0c02df       cmp w22, w12
0x2d15098c1f08  1308  1a8c32cd       csel w13, w22, w12, lo
0x2d15098c1f0c  130c  6b0d033f       cmp w25, w13
0x2d15098c1f10  1310  1a8d332c       csel w12, w25, w13, lo
0x2d15098c1f14  1314  6b0c017f       cmp w11, w12
0x2d15098c1f18  1318  1a8c316d       csel w13, w11, w12, lo
0x2d15098c1f1c  131c  34000d6d       cbz w13, #+0x1ac (addr 0x2d15098c20c8)
0x2d15098c1f20  1320  121c61cb       and w11, w14, #0x1ffffff0
0x2d15098c1f24  1324  0b0b0929       add w9, w9, w11, lsl #2
0x2d15098c1f28  1328  121c60c6       and w6, w6, #0x1ffffff0
0x2d15098c1f2c  132c  0b060821       add w1, w1, w6, lsl #2
0x2d15098c1f30  1330  fd4203e9       ldr d9, [sp, #1024]
0x2d15098c1f34  1334  fd4207ea       ldr d10, [sp, #1032]
0x2d15098c1f38  1338  fd420be2       ldr d2, [sp, #1040]
0x2d15098c1f3c  133c  fd420fe4       ldr d4, [sp, #1048]
0x2d15098c1f40  1340  1e2e1008       fmov s8, #0x70 (1.0000)
0x2d15098c1f44  1344  14000002       b #+0x8 (addr 0x2d15098c1f4c)
0x2d15098c1f48  1348  aa0603e9       mov x9, x6
0x2d15098c1f4c  134c  bc696903       ldr s3, [x8, x9]
0x2d15098c1f50  1350  1e233925       fsub s5, s9, s3
0x2d15098c1f54  1354  1e2508a6       fmul s6, s5, s5
0x2d15098c1f58  1358  2a1703e6       mov w6, w23
0x2d15098c1f5c  135c  bc666907       ldr s7, [x8, x6]
0x2d15098c1f60  1360  1e27394b       fsub s11, s10, s7
0x2d15098c1f64  1364  1e2b096c       fmul s12, s11, s11
0x2d15098c1f68  1368  1e2c28c6       fadd s6, s6, s12
0x2d15098c1f6c  136c  1e2220c0       fcmp s6, s2
0x2d15098c1f70  1370  540001e3       b.lo #+0x3c (addr 0x2d15098c1fac)
0x2d15098c1f74  1374  1e2420c0       fcmp s6, s4
0x2d15098c1f78  1378  540001e2       b.hs #+0x3c (addr 0x2d15098c1fb4)
0x2d15098c1f7c  137c  1e2020c8       fcmp s6, #0.0
0x2d15098c1f80  1380  540001ad       b.le #+0x34 (addr 0x2d15098c1fb4)
0x2d15098c1f84  1384  1e2829ad       fadd s13, s13, s8
0x2d15098c1f88  1388  4e040463       dup v3.4s, v3.s[0]
0x2d15098c1f8c  138c  6e0c04e3       mov v3.s[1], v7.s[0]
0x2d15098c1f90  1390  2a1303e6       mov w6, w19
0x2d15098c1f94  1394  bc666905       ldr s5, [x8, x6]
0x2d15098c1f98  1398  6e1404a3       mov v3.s[2], v5.s[0]
0x2d15098c1f9c  139c  bc616905       ldr s5, [x8, x1]
0x2d15098c1fa0  13a0  6e1c04a3       mov v3.s[3], v5.s[0]
0x2d15098c1fa4  13a4  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x2d15098c1fa8  13a8  14000003       b #+0xc (addr 0x2d15098c1fb4)
0x2d15098c1fac  13ac  1e2b2a10       fadd s16, s16, s11
0x2d15098c1fb0  13b0  1e2529ce       fadd s14, s14, s5
0x2d15098c1fb4  13b4  11001126       add w6, w9, #0x4 (4)
0x2d15098c1fb8  13b8  110012e9       add w9, w23, #0x4 (4)
0x2d15098c1fbc  13bc  1100126b       add w11, w19, #0x4 (4)
0x2d15098c1fc0  13c0  11001021       add w1, w1, #0x4 (4)
0x2d15098c1fc4  13c4  510005ac       sub w12, w13, #0x1 (1)
0x2d15098c1fc8  13c8  3400080c       cbz w12, #+0x100 (addr 0x2d15098c20c8)
0x2d15098c1fcc  13cc  bc666903       ldr s3, [x8, x6]
0x2d15098c1fd0  13d0  1e233925       fsub s5, s9, s3
0x2d15098c1fd4  13d4  1e2508a6       fmul s6, s5, s5
0x2d15098c1fd8  13d8  bc696907       ldr s7, [x8, x9]
0x2d15098c1fdc  13dc  1e27394b       fsub s11, s10, s7
0x2d15098c1fe0  13e0  1e2b096c       fmul s12, s11, s11
0x2d15098c1fe4  13e4  1e2c28c6       fadd s6, s6, s12
0x2d15098c1fe8  13e8  1e2220c0       fcmp s6, s2
0x2d15098c1fec  13ec  540001c3       b.lo #+0x38 (addr 0x2d15098c2024)
0x2d15098c1ff0  13f0  1e2420c0       fcmp s6, s4
0x2d15098c1ff4  13f4  540001c2       b.hs #+0x38 (addr 0x2d15098c202c)
0x2d15098c1ff8  13f8  1e2020c8       fcmp s6, #0.0
0x2d15098c1ffc  13fc  5400018d       b.le #+0x30 (addr 0x2d15098c202c)
0x2d15098c2000  1400  1e2829ad       fadd s13, s13, s8
0x2d15098c2004  1404  4e040463       dup v3.4s, v3.s[0]
0x2d15098c2008  1408  6e0c04e3       mov v3.s[1], v7.s[0]
0x2d15098c200c  140c  bc6b6905       ldr s5, [x8, x11]
0x2d15098c2010  1410  6e1404a3       mov v3.s[2], v5.s[0]
0x2d15098c2014  1414  bc616905       ldr s5, [x8, x1]
0x2d15098c2018  1418  6e1c04a3       mov v3.s[3], v5.s[0]
0x2d15098c201c  141c  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x2d15098c2020  1420  14000003       b #+0xc (addr 0x2d15098c202c)
0x2d15098c2024  1424  1e2b2a10       fadd s16, s16, s11
0x2d15098c2028  1428  1e2529ce       fadd s14, s14, s5
0x2d15098c202c  142c  110010c6       add w6, w6, #0x4 (4)
0x2d15098c2030  1430  11001129       add w9, w9, #0x4 (4)
0x2d15098c2034  1434  1100116b       add w11, w11, #0x4 (4)
0x2d15098c2038  1438  11001021       add w1, w1, #0x4 (4)
0x2d15098c203c  143c  5100058c       sub w12, w12, #0x1 (1)
0x2d15098c2040  1440  3400044c       cbz w12, #+0x88 (addr 0x2d15098c20c8)
0x2d15098c2044  1444  f852034d       ldur x13, [x26, #-224]
0x2d15098c2048  1448  eb2d63ff       cmp sp, x13
0x2d15098c204c  144c  54002c49       b.ls #+0x588 (addr 0x2d15098c25d4)
0x2d15098c2050  1450  bc666903       ldr s3, [x8, x6]
0x2d15098c2054  1454  1e233925       fsub s5, s9, s3
0x2d15098c2058  1458  1e2508a6       fmul s6, s5, s5
0x2d15098c205c  145c  bc696907       ldr s7, [x8, x9]
0x2d15098c2060  1460  1e27394b       fsub s11, s10, s7
0x2d15098c2064  1464  1e2b096c       fmul s12, s11, s11
0x2d15098c2068  1468  1e2c28c6       fadd s6, s6, s12
0x2d15098c206c  146c  1e2220c0       fcmp s6, s2
0x2d15098c2070  1470  540001c3       b.lo #+0x38 (addr 0x2d15098c20a8)
0x2d15098c2074  1474  1e2420c0       fcmp s6, s4
0x2d15098c2078  1478  540001c2       b.hs #+0x38 (addr 0x2d15098c20b0)
0x2d15098c207c  147c  1e2020c8       fcmp s6, #0.0
0x2d15098c2080  1480  5400018d       b.le #+0x30 (addr 0x2d15098c20b0)
0x2d15098c2084  1484  1e2829ad       fadd s13, s13, s8
0x2d15098c2088  1488  4e040463       dup v3.4s, v3.s[0]
0x2d15098c208c  148c  6e0c04e3       mov v3.s[1], v7.s[0]
0x2d15098c2090  1490  bc6b6905       ldr s5, [x8, x11]
0x2d15098c2094  1494  6e1404a3       mov v3.s[2], v5.s[0]
0x2d15098c2098  1498  bc616905       ldr s5, [x8, x1]
0x2d15098c209c  149c  6e1c04a3       mov v3.s[3], v5.s[0]
0x2d15098c20a0  14a0  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x2d15098c20a4  14a4  14000003       b #+0xc (addr 0x2d15098c20b0)
0x2d15098c20a8  14a8  1e2b2a10       fadd s16, s16, s11
0x2d15098c20ac  14ac  1e2529ce       fadd s14, s14, s5
0x2d15098c20b0  14b0  110010c6       add w6, w6, #0x4 (4)
0x2d15098c20b4  14b4  11001137       add w23, w9, #0x4 (4)
0x2d15098c20b8  14b8  11001173       add w19, w11, #0x4 (4)
0x2d15098c20bc  14bc  11001021       add w1, w1, #0x4 (4)
0x2d15098c20c0  14c0  5100058d       sub w13, w12, #0x1 (1)
0x2d15098c20c4  14c4  35fff42d       cbnz w13, #-0x17c (addr 0x2d15098c1f48)
0x2d15098c20c8  14c8  11000681       add w1, w20, #0x1 (1)
0x2d15098c20cc  14cc  6b15029f       cmp w20, w21
0x2d15098c20d0  14d0  54ffa461       b.ne #-0xb74 (addr 0x2d15098c155c)
0x2d15098c20d4  14d4  f9422fee       ldr x14, [sp, #1112]
0x2d15098c20d8  14d8  bc2e6910       str s16, [x8, x14]
0x2d15098c20dc  14dc  f9426bec       ldr x12, [sp, #1232]
0x2d15098c20e0  14e0  91009181       add x1, x12, #0x24 (36)
0x2d15098c20e4  14e4  bc21690e       str s14, [x8, x1]
0x2d15098c20e8  14e8  f94233eb       ldr x11, [sp, #1120]
0x2d15098c20ec  14ec  bc2b690d       str s13, [x8, x11]
0x2d15098c20f0  14f0  f94237ed       ldr x13, [sp, #1128]
0x2d15098c20f4  14f4  3cad6911       str q17, [x8, x13]
0x2d15098c20f8  14f8  1100c180       add w0, w12, #0x30 (48)
0x2d15098c20fc  14fc  11010183       add w3, w12, #0x40 (64)
0x2d15098c2100  1500  11004185       add w5, w12, #0x10 (16)
0x2d15098c2104  1504  f94273e7       ldr x7, [sp, #1248]
0x2d15098c2108  1508  aa0c03e4       mov x4, x12
0x2d15098c210c  150c  f94243e2       ldr x2, [sp, #1152]
0x2d15098c2110  1510  fd423fe0       ldr d0, [sp, #1144]
0x2d15098c2114  1514  fd423be1       ldr d1, [sp, #1136]
0x2d15098c2118  1518  97fc0d62       bl #-0xfca78 (addr 0x2d15097c56a0)
0x2d15098c211c  151c  f94263f4       ldr x20, [sp, #1216]
0x2d15098c2120  1520  f94247e1       ldr x1, [sp, #1160]
0x2d15098c2124  1524  6b14003f       cmp w1, w20
0x2d15098c2128  1528  54000509       b.ls #+0xa0 (addr 0x2d15098c21c8)
0x2d15098c212c  152c  f94257e6       ldr x6, [sp, #1192]
0x2d15098c2130  1530  f9424be8       ldr x8, [sp, #1168]
0x2d15098c2134  1534  0b060109       add w9, w8, w6
0x2d15098c2138  1538  f9426bea       ldr x10, [sp, #1232]
0x2d15098c213c  153c  9100c14b       add x11, x10, #0x30 (48)
0x2d15098c2140  1540  f9425fec       ldr x12, [sp, #1208]
0x2d15098c2144  1544  bc6b6982       ldr s2, [x12, x11]
0x2d15098c2148  1548  bc296982       str s2, [x12, x9]
0x2d15098c214c  154c  f9424fe9       ldr x9, [sp, #1176]
0x2d15098c2150  1550  0b06012b       add w11, w9, w6
0x2d15098c2154  1554  9100d14d       add x13, x10, #0x34 (52)
0x2d15098c2158  1558  bc6d6982       ldr s2, [x12, x13]
0x2d15098c215c  155c  bc2b6982       str s2, [x12, x11]
0x2d15098c2160  1560  f94253eb       ldr x11, [sp, #1184]
0x2d15098c2164  1564  0b06016d       add w13, w11, w6
0x2d15098c2168  1568  9100e14e       add x14, x10, #0x38 (56)
0x2d15098c216c  156c  bc6e6982       ldr s2, [x12, x14]
0x2d15098c2170  1570  bc2d6982       str s2, [x12, x13]
0x2d15098c2174  1574  f9425bed       ldr x13, [sp, #1200]
0x2d15098c2178  1578  0b0601a6       add w6, w13, w6
0x2d15098c217c  157c  9100f14e       add x14, x10, #0x3c (60)
0x2d15098c2180  1580  bc6e6982       ldr s2, [x12, x14]
0x2d15098c2184  1584  bc266982       str s2, [x12, x6]
0x2d15098c2188  1588  aa0c03e8       mov x8, x12
0x2d15098c218c  158c  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c2190  1590  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c2194  1594  3dc043e5       ldr q5, [sp, #256]
0x2d15098c2198  1598  d280001c       movz x28, #0x0
0x2d15098c219c  159c  f94017e1       ldr x1, [sp, #40]
0x2d15098c21a0  15a0  f94013fb       ldr cp, [sp, #32]
0x2d15098c21a4  15a4  f9400ff3       ldr x19, [sp, #24]
0x2d15098c21a8  15a8  f9400bf9       ldr x25, [sp, #16]
0x2d15098c21ac  15ac  f94007ee       ldr x14, [sp, #8]
0x2d15098c21b0  15b0  f941eff8       ldr x24, [sp, #984]
0x2d15098c21b4  15b4  f941f3ed       ldr x13, [sp, #992]
0x2d15098c21b8  15b8  f941f7f6       ldr x22, [sp, #1000]
0x2d15098c21bc  15bc  f941fbf7       ldr x23, [sp, #1008]
0x2d15098c21c0  15c0  f941fff5       ldr x21, [sp, #1016]
0x2d15098c21c4  15c4  14000010       b #+0x40 (addr 0x2d15098c2204)
0x2d15098c21c8  15c8  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c21cc  15cc  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c21d0  15d0  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c21d4  15d4  3dc043e5       ldr q5, [sp, #256]
0x2d15098c21d8  15d8  d280001c       movz x28, #0x0
0x2d15098c21dc  15dc  f94017e1       ldr x1, [sp, #40]
0x2d15098c21e0  15e0  f94013fb       ldr cp, [sp, #32]
0x2d15098c21e4  15e4  f9400ff3       ldr x19, [sp, #24]
0x2d15098c21e8  15e8  f9400bf9       ldr x25, [sp, #16]
0x2d15098c21ec  15ec  f94007ee       ldr x14, [sp, #8]
0x2d15098c21f0  15f0  f941eff8       ldr x24, [sp, #984]
0x2d15098c21f4  15f4  f941f3ed       ldr x13, [sp, #992]
0x2d15098c21f8  15f8  f941f7f6       ldr x22, [sp, #1000]
0x2d15098c21fc  15fc  f941fbf7       ldr x23, [sp, #1008]
0x2d15098c2200  1600  f941fff5       ldr x21, [sp, #1016]
0x2d15098c2204  1604  11000694       add w20, w20, #0x1 (1)
0x2d15098c2208  1608  f94267e6       ldr x6, [sp, #1224]
0x2d15098c220c  160c  6b06029f       cmp w20, w6
0x2d15098c2210  1610  54ff89e1       b.ne #-0xec4 (addr 0x2d15098c134c)
0x2d15098c2214  1614  f9426be1       ldr x1, [sp, #1232]
0x2d15098c2218  1618  11014021       add w1, w1, #0x50 (80)
0x2d15098c221c  161c  f9426fe6       ldr x6, [sp, #1240]
0x2d15098c2220  1620  b90000c1       str w1, [x6]
0x2d15098c2224  1624  17fffc1e       b #-0xf88 (addr 0x2d15098c129c)
0x2d15098c2228  1628  97fc0e6a       bl #-0xfc658 (addr 0x2d15097c5bd0)
0x2d15098c222c  162c  f9425fe1       ldr x1, [sp, #1208]
0x2d15098c2230  1630  f94273e7       ldr x7, [sp, #1248]
0x2d15098c2234  1634  f94267e0       ldr x0, [sp, #1224]
0x2d15098c2238  1638  17fffa7d       b #-0x160c (addr 0x2d15098c0c2c)
0x2d15098c223c  163c  1e6720e0       fcmp d7, d7
0x2d15098c2240  1640  54000080       b.eq #+0x10 (addr 0x2d15098c2250)
0x2d15098c2244  1644  d280000b       movz x11, #0x0
0x2d15098c2248  1648  aa0b03ea       mov x10, x11
0x2d15098c224c  164c  17fffaad       b #-0x154c (addr 0x2d15098c0d00)
0x2d15098c2250  1650  1e2020c8       fcmp s6, #0.0
0x2d15098c2254  1654  54000063       b.lo #+0xc (addr 0x2d15098c2260)
0x2d15098c2258  1658  9280000a       movn x10, #0x0
0x2d15098c225c  165c  17fffaa9       b #-0x155c (addr 0x2d15098c0d00)
0x2d15098c2260  1660  d280000a       movz x10, #0x0
0x2d15098c2264  1664  17fffaa7       b #-0x1564 (addr 0x2d15098c0d00)
0x2d15098c2268  1668  1e682100       fcmp d8, d8
0x2d15098c226c  166c  54000060       b.eq #+0xc (addr 0x2d15098c2278)
0x2d15098c2270  1670  d280000a       movz x10, #0x0
0x2d15098c2274  1674  17fffaab       b #-0x1554 (addr 0x2d15098c0d20)
0x2d15098c2278  1678  1e2020e8       fcmp s7, #0.0
0x2d15098c227c  167c  54ffffa3       b.lo #-0xc (addr 0x2d15098c2270)
0x2d15098c2280  1680  9280000a       movn x10, #0x0
0x2d15098c2284  1684  17fffaa7       b #-0x1564 (addr 0x2d15098c0d20)
0x2d15098c2288  1688  fd022fe3       str d3, [sp, #1112]
0x2d15098c228c  168c  f90247f4       str x20, [sp, #1160]
0x2d15098c2290  1690  f90253f3       str x19, [sp, #1184]
0x2d15098c2294  1694  97fc0e4f       bl #-0xfc6c4 (addr 0x2d15097c5bd0)
0x2d15098c2298  1698  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c229c  169c  f94017e1       ldr x1, [sp, #40]
0x2d15098c22a0  16a0  f941efee       ldr x14, [sp, #984]
0x2d15098c22a4  16a4  f941ffec       ldr x12, [sp, #1016]
0x2d15098c22a8  16a8  f9421fe6       ldr x6, [sp, #1080]
0x2d15098c22ac  16ac  f94227eb       ldr x11, [sp, #1096]
0x2d15098c22b0  16b0  f94267e9       ldr x9, [sp, #1224]
0x2d15098c22b4  16b4  f94253f3       ldr x19, [sp, #1184]
0x2d15098c22b8  16b8  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c22bc  16bc  f9424fe0       ldr x0, [sp, #1176]
0x2d15098c22c0  16c0  f94257ef       ldr x15, [sp, #1192]
0x2d15098c22c4  16c4  f9425bed       ldr x13, [sp, #1200]
0x2d15098c22c8  16c8  f94247f4       ldr x20, [sp, #1160]
0x2d15098c22cc  16cc  17fffad9       b #-0x149c (addr 0x2d15098c0e30)
0x2d15098c22d0  16d0  fd022fe3       str d3, [sp, #1112]
0x2d15098c22d4  16d4  f90253eb       str x11, [sp, #1184]
0x2d15098c22d8  16d8  f90257e2       str x2, [sp, #1192]
0x2d15098c22dc  16dc  97fc0e3d       bl #-0xfc70c (addr 0x2d15097c5bd0)
0x2d15098c22e0  16e0  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c22e4  16e4  f94017e1       ldr x1, [sp, #40]
0x2d15098c22e8  16e8  f94007f3       ldr x19, [sp, #8]
0x2d15098c22ec  16ec  f941fbed       ldr x13, [sp, #1008]
0x2d15098c22f0  16f0  f9421fe6       ldr x6, [sp, #1080]
0x2d15098c22f4  16f4  f9425bea       ldr x10, [sp, #1200]
0x2d15098c22f8  16f8  f94227f5       ldr x21, [sp, #1096]
0x2d15098c22fc  16fc  f94267e9       ldr x9, [sp, #1224]
0x2d15098c2300  1700  f94257e2       ldr x2, [sp, #1192]
0x2d15098c2304  1704  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c2308  1708  f9424be0       ldr x0, [sp, #1168]
0x2d15098c230c  170c  f9424ff4       ldr x20, [sp, #1176]
0x2d15098c2310  1710  f94247ef       ldr x15, [sp, #1160]
0x2d15098c2314  1714  f94253eb       ldr x11, [sp, #1184]
0x2d15098c2318  1718  17fffb0b       b #-0x13d4 (addr 0x2d15098c0f44)
0x2d15098c231c  171c  fd022fe3       str d3, [sp, #1112]
0x2d15098c2320  1720  f9024ff5       str x21, [sp, #1176]
0x2d15098c2324  1724  f90253e2       str x2, [sp, #1184]
0x2d15098c2328  1728  97fc0e2a       bl #-0xfc758 (addr 0x2d15097c5bd0)
0x2d15098c232c  172c  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c2330  1730  f94017e1       ldr x1, [sp, #40]
0x2d15098c2334  1734  f9400bef       ldr x15, [sp, #16]
0x2d15098c2338  1738  f941f7ec       ldr x12, [sp, #1000]
0x2d15098c233c  173c  f9425bea       ldr x10, [sp, #1200]
0x2d15098c2340  1740  f94257eb       ldr x11, [sp, #1192]
0x2d15098c2344  1744  f94227f6       ldr x22, [sp, #1096]
0x2d15098c2348  1748  f94267e9       ldr x9, [sp, #1224]
0x2d15098c234c  174c  f94253e2       ldr x2, [sp, #1184]
0x2d15098c2350  1750  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c2354  1754  f94233e0       ldr x0, [sp, #1120]
0x2d15098c2358  1758  f94247f4       ldr x20, [sp, #1160]
0x2d15098c235c  175c  f9424bee       ldr x14, [sp, #1168]
0x2d15098c2360  1760  f9424ff5       ldr x21, [sp, #1176]
0x2d15098c2364  1764  17fffb39       b #-0x131c (addr 0x2d15098c1048)
0x2d15098c2368  1768  fd022fe3       str d3, [sp, #1112]
0x2d15098c236c  176c  f9022be9       str x9, [sp, #1104]
0x2d15098c2370  1770  f9024fe2       str x2, [sp, #1176]
0x2d15098c2374  1774  97fc0e17       bl #-0xfc7a4 (addr 0x2d15097c5bd0)
0x2d15098c2378  1778  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c237c  177c  f94017e1       ldr x1, [sp, #40]
0x2d15098c2380  1780  f9400ff3       ldr x19, [sp, #24]
0x2d15098c2384  1784  f941f3ed       ldr x13, [sp, #992]
0x2d15098c2388  1788  f94257eb       ldr x11, [sp, #1192]
0x2d15098c238c  178c  f94253e6       ldr x6, [sp, #1184]
0x2d15098c2390  1790  f9424fe2       ldr x2, [sp, #1176]
0x2d15098c2394  1794  fd422fe3       ldr d3, [sp, #1112]
0x2d15098c2398  1798  f94267e0       ldr x0, [sp, #1224]
0x2d15098c239c  179c  f94227f5       ldr x21, [sp, #1096]
0x2d15098c23a0  17a0  f9424bf4       ldr x20, [sp, #1168]
0x2d15098c23a4  17a4  f94237ee       ldr x14, [sp, #1128]
0x2d15098c23a8  17a8  f9422be9       ldr x9, [sp, #1104]
0x2d15098c23ac  17ac  17fffb6c       b #-0x1250 (addr 0x2d15098c115c)
0x2d15098c23b0  17b0  f90263f4       str x20, [sp, #1216]
0x2d15098c23b4  17b4  97fc0e07       bl #-0xfc7e4 (addr 0x2d15097c5bd0)
0x2d15098c23b8  17b8  f94263f4       ldr x20, [sp, #1216]
0x2d15098c23bc  17bc  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c23c0  17c0  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c23c4  17c4  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c23c8  17c8  3dc043e5       ldr q5, [sp, #256]
0x2d15098c23cc  17cc  d280001c       movz x28, #0x0
0x2d15098c23d0  17d0  f94017e1       ldr x1, [sp, #40]
0x2d15098c23d4  17d4  f94013fb       ldr cp, [sp, #32]
0x2d15098c23d8  17d8  f9400ff3       ldr x19, [sp, #24]
0x2d15098c23dc  17dc  f9400bf9       ldr x25, [sp, #16]
0x2d15098c23e0  17e0  f94007ee       ldr x14, [sp, #8]
0x2d15098c23e4  17e4  f941eff8       ldr x24, [sp, #984]
0x2d15098c23e8  17e8  f941f3ed       ldr x13, [sp, #992]
0x2d15098c23ec  17ec  f941f7f6       ldr x22, [sp, #1000]
0x2d15098c23f0  17f0  f941fbf7       ldr x23, [sp, #1008]
0x2d15098c23f4  17f4  f941fff5       ldr x21, [sp, #1016]
0x2d15098c23f8  17f8  17fffbd8       b #-0x10a0 (addr 0x2d15098c1358)
0x2d15098c23fc  17fc  1e6d21a0       fcmp d13, d13
0x2d15098c2400  1800  54000060       b.eq #+0xc (addr 0x2d15098c240c)
0x2d15098c2404  1804  aa1c03f3       mov x19, x28
0x2d15098c2408  1808  17fffc18       b #-0xfa0 (addr 0x2d15098c1468)
0x2d15098c240c  180c  1e202188       fcmp s12, #0.0
0x2d15098c2410  1810  54ffffa3       b.lo #-0xc (addr 0x2d15098c2404)
0x2d15098c2414  1814  92800013       movn x19, #0x0
0x2d15098c2418  1818  17fffc14       b #-0xfb0 (addr 0x2d15098c1468)
0x2d15098c241c  181c  1e6c2180       fcmp d12, d12
0x2d15098c2420  1820  54000060       b.eq #+0xc (addr 0x2d15098c242c)
0x2d15098c2424  1824  aa1c03f6       mov x22, x28
0x2d15098c2428  1828  17fffc30       b #-0xf40 (addr 0x2d15098c14e8)
0x2d15098c242c  182c  1e202168       fcmp s11, #0.0
0x2d15098c2430  1830  54ffffa3       b.lo #-0xc (addr 0x2d15098c2424)
0x2d15098c2434  1834  92800016       movn x22, #0x0
0x2d15098c2438  1838  17fffc2c       b #-0xf50 (addr 0x2d15098c14e8)
0x2d15098c243c  183c  f9022bf4       str x20, [sp, #1104]
0x2d15098c2440  1840  f90227f5       str x21, [sp, #1096]
0x2d15098c2444  1844  f90053ea       str x10, [sp, #160]
0x2d15098c2448  1848  f9004fe4       str x4, [sp, #152]
0x2d15098c244c  184c  f9004be2       str x2, [sp, #144]
0x2d15098c2450  1850  f90043e3       str x3, [sp, #128]
0x2d15098c2454  1854  f90037e5       str x5, [sp, #104]
0x2d15098c2458  1858  97fc0dde       bl #-0xfc888 (addr 0x2d15097c5bd0)
0x2d15098c245c  185c  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c2460  1860  f9422bf4       ldr x20, [sp, #1104]
0x2d15098c2464  1864  f94227f5       ldr x21, [sp, #1096]
0x2d15098c2468  1868  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c246c  186c  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c2470  1870  3dc043e5       ldr q5, [sp, #256]
0x2d15098c2474  1874  3dc03fec       ldr q12, [sp, #240]
0x2d15098c2478  1878  3dc03beb       ldr q11, [sp, #224]
0x2d15098c247c  187c  d280001c       movz x28, #0x0
0x2d15098c2480  1880  f94053ea       ldr x10, [sp, #160]
0x2d15098c2484  1884  f9404fe4       ldr x4, [sp, #152]
0x2d15098c2488  1888  f9404be2       ldr x2, [sp, #144]
0x2d15098c248c  188c  f94047e6       ldr x6, [sp, #136]
0x2d15098c2490  1890  f94043e3       ldr x3, [sp, #128]
0x2d15098c2494  1894  f9403fe9       ldr x9, [sp, #120]
0x2d15098c2498  1898  f9403be0       ldr x0, [sp, #112]
0x2d15098c249c  189c  f94037e5       ldr x5, [sp, #104]
0x2d15098c24a0  18a0  f94033f6       ldr x22, [sp, #96]
0x2d15098c24a4  18a4  f9402ff8       ldr x24, [sp, #88]
0x2d15098c24a8  18a8  f9402bf3       ldr x19, [sp, #80]
0x2d15098c24ac  18ac  f94027f7       ldr x23, [sp, #72]
0x2d15098c24b0  18b0  f94023ef       ldr x15, [sp, #64]
0x2d15098c24b4  18b4  17fffc3f       b #-0xf04 (addr 0x2d15098c15b0)
0x2d15098c24b8  18b8  f9022bf4       str x20, [sp, #1104]
0x2d15098c24bc  18bc  f90227f5       str x21, [sp, #1096]
0x2d15098c24c0  18c0  f90223f3       str x19, [sp, #1088]
0x2d15098c24c4  18c4  f9021ff7       str x23, [sp, #1080]
0x2d15098c24c8  18c8  f9021be1       str x1, [sp, #1072]
0x2d15098c24cc  18cc  f90217e6       str x6, [sp, #1064]
0x2d15098c24d0  18d0  f90213e9       str x9, [sp, #1056]
0x2d15098c24d4  18d4  f901ebee       str x14, [sp, #976]
0x2d15098c24d8  18d8  f901e7f9       str x25, [sp, #968]
0x2d15098c24dc  18dc  f901e3f6       str x22, [sp, #960]
0x2d15098c24e0  18e0  f901d3f8       str x24, [sp, #928]
0x2d15098c24e4  18e4  f901c7eb       str x11, [sp, #904]
0x2d15098c24e8  18e8  3d807be0       str q0, [sp, #480]
0x2d15098c24ec  18ec  3d8077e1       str q1, [sp, #464]
0x2d15098c24f0  18f0  3d8073e6       str q6, [sp, #448]
0x2d15098c24f4  18f4  3d806fe2       str q2, [sp, #432]
0x2d15098c24f8  18f8  3d806be4       str q4, [sp, #416]
0x2d15098c24fc  18fc  3d8067e8       str q8, [sp, #400]
0x2d15098c2500  1900  3d8063e9       str q9, [sp, #384]
0x2d15098c2504  1904  3d805fea       str q10, [sp, #368]
0x2d15098c2508  1908  3d805bed       str q13, [sp, #352]
0x2d15098c250c  190c  3d8057ee       str q14, [sp, #336]
0x2d15098c2510  1910  3d8053f0       str q16, [sp, #320]
0x2d15098c2514  1914  3d804ff1       str q17, [sp, #304]
0x2d15098c2518  1918  f901c3ef       str x15, [sp, #896]
0x2d15098c251c  191c  f90057ed       str x13, [sp, #168]
0x2d15098c2520  1920  f90053ea       str x10, [sp, #160]
0x2d15098c2524  1924  f9004fe4       str x4, [sp, #152]
0x2d15098c2528  1928  f9004be2       str x2, [sp, #144]
0x2d15098c252c  192c  f90043e3       str x3, [sp, #128]
0x2d15098c2530  1930  f90037e5       str x5, [sp, #104]
0x2d15098c2534  1934  97fc0da7       bl #-0xfc964 (addr 0x2d15097c5bd0)
0x2d15098c2538  1938  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c253c  193c  f9422bf4       ldr x20, [sp, #1104]
0x2d15098c2540  1940  f94227f5       ldr x21, [sp, #1096]
0x2d15098c2544  1944  f94223f3       ldr x19, [sp, #1088]
0x2d15098c2548  1948  f9421ff7       ldr x23, [sp, #1080]
0x2d15098c254c  194c  f9421be1       ldr x1, [sp, #1072]
0x2d15098c2550  1950  f94217e6       ldr x6, [sp, #1064]
0x2d15098c2554  1954  f94213e9       ldr x9, [sp, #1056]
0x2d15098c2558  1958  f941ebee       ldr x14, [sp, #976]
0x2d15098c255c  195c  f941e7f9       ldr x25, [sp, #968]
0x2d15098c2560  1960  f941e3f6       ldr x22, [sp, #960]
0x2d15098c2564  1964  f941d3f8       ldr x24, [sp, #928]
0x2d15098c2568  1968  f941c7eb       ldr x11, [sp, #904]
0x2d15098c256c  196c  3dc0cfe7       ldr q7, [sp, #816]
0x2d15098c2570  1970  3dc0cbe3       ldr q3, [sp, #800]
0x2d15098c2574  1974  3dc07be0       ldr q0, [sp, #480]
0x2d15098c2578  1978  3dc077e1       ldr q1, [sp, #464]
0x2d15098c257c  197c  3dc073e6       ldr q6, [sp, #448]
0x2d15098c2580  1980  3dc06fe2       ldr q2, [sp, #432]
0x2d15098c2584  1984  3dc06be4       ldr q4, [sp, #416]
0x2d15098c2588  1988  3dc067e8       ldr q8, [sp, #400]
0x2d15098c258c  198c  3dc063e9       ldr q9, [sp, #384]
0x2d15098c2590  1990  3dc05fea       ldr q10, [sp, #368]
0x2d15098c2594  1994  3dc05bed       ldr q13, [sp, #352]
0x2d15098c2598  1998  3dc057ee       ldr q14, [sp, #336]
0x2d15098c259c  199c  3dc053f0       ldr q16, [sp, #320]
0x2d15098c25a0  19a0  3dc04ff1       ldr q17, [sp, #304]
0x2d15098c25a4  19a4  f941c3ef       ldr x15, [sp, #896]
0x2d15098c25a8  19a8  3dc043e5       ldr q5, [sp, #256]
0x2d15098c25ac  19ac  3dc03fec       ldr q12, [sp, #240]
0x2d15098c25b0  19b0  3dc03beb       ldr q11, [sp, #224]
0x2d15098c25b4  19b4  f94057ed       ldr x13, [sp, #168]
0x2d15098c25b8  19b8  d280001c       movz x28, #0x0
0x2d15098c25bc  19bc  f94053ea       ldr x10, [sp, #160]
0x2d15098c25c0  19c0  f9404fe4       ldr x4, [sp, #152]
0x2d15098c25c4  19c4  f9404be2       ldr x2, [sp, #144]
0x2d15098c25c8  19c8  f94043e3       ldr x3, [sp, #128]
0x2d15098c25cc  19cc  f94037e5       ldr x5, [sp, #104]
0x2d15098c25d0  19d0  17fffc94       b #-0xdb0 (addr 0x2d15098c1820)
0x2d15098c25d4  19d4  f9022bf4       str x20, [sp, #1104]
0x2d15098c25d8  19d8  f90227f5       str x21, [sp, #1096]
0x2d15098c25dc  19dc  fd01d7f0       str d16, [sp, #936]
0x2d15098c25e0  19e0  fd01dbee       str d14, [sp, #944]
0x2d15098c25e4  19e4  fd01dfed       str d13, [sp, #952]
0x2d15098c25e8  19e8  3d80e7f1       str q17, [sp, #912]
0x2d15098c25ec  19ec  f90223ec       str x12, [sp, #1088]
0x2d15098c25f0  19f0  f9021fe1       str x1, [sp, #1080]
0x2d15098c25f4  19f4  f9021beb       str x11, [sp, #1072]
0x2d15098c25f8  19f8  f90217e9       str x9, [sp, #1064]
0x2d15098c25fc  19fc  f90213e6       str x6, [sp, #1056]
0x2d15098c2600  1a00  f90053ea       str x10, [sp, #160]
0x2d15098c2604  1a04  f9004fe4       str x4, [sp, #152]
0x2d15098c2608  1a08  f9004be2       str x2, [sp, #144]
0x2d15098c260c  1a0c  f90043e3       str x3, [sp, #128]
0x2d15098c2610  1a10  f90037e5       str x5, [sp, #104]
0x2d15098c2614  1a14  97fc0d6f       bl #-0xfca44 (addr 0x2d15097c5bd0)
0x2d15098c2618  1a18  f9425fe8       ldr x8, [sp, #1208]
0x2d15098c261c  1a1c  f9422bf4       ldr x20, [sp, #1104]
0x2d15098c2620  1a20  f94227f5       ldr x21, [sp, #1096]
0x2d15098c2624  1a24  fd41d7f0       ldr d16, [sp, #936]
0x2d15098c2628  1a28  fd41dbee       ldr d14, [sp, #944]
0x2d15098c262c  1a2c  fd41dfed       ldr d13, [sp, #952]
0x2d15098c2630  1a30  3dc0e7f1       ldr q17, [sp, #912]
0x2d15098c2634  1a34  f94223ec       ldr x12, [sp, #1088]
0x2d15098c2638  1a38  f9421fe1       ldr x1, [sp, #1080]
0x2d15098c263c  1a3c  f9421beb       ldr x11, [sp, #1072]
0x2d15098c2640  1a40  f94217e9       ldr x9, [sp, #1064]
0x2d15098c2644  1a44  f94213e6       ldr x6, [sp, #1056]
0x2d15098c2648  1a48  1e2e1008       fmov s8, #0x70 (1.0000)
0x2d15098c264c  1a4c  fd420fe4       ldr d4, [sp, #1048]
0x2d15098c2650  1a50  fd420be2       ldr d2, [sp, #1040]
0x2d15098c2654  1a54  fd4207ea       ldr d10, [sp, #1032]
0x2d15098c2658  1a58  fd4203e9       ldr d9, [sp, #1024]
0x2d15098c265c  1a5c  d280001c       movz x28, #0x0
0x2d15098c2660  1a60  f94053ea       ldr x10, [sp, #160]
0x2d15098c2664  1a64  f9404fe4       ldr x4, [sp, #152]
0x2d15098c2668  1a68  f9404be2       ldr x2, [sp, #144]
0x2d15098c266c  1a6c  f94043e3       ldr x3, [sp, #128]
0x2d15098c2670  1a70  f94037e5       ldr x5, [sp, #104]
0x2d15098c2674  1a74  17fffe77       b #-0x624 (addr 0x2d15098c2050)
0x2d15098c2678  1a78  d503201f       nop

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
       450         
       464         
       48c         
       4e4         
       4ec         
       4f4         
       504         
       50c         
       514         
       564         
       578         
       5b0         
       610         
       618         
       620         
       630         
       638         
       63c         
       640         
       644         
       64c         
       654         
       658         
       65c         
       660         
       668         
       670         
       674         
       678         
       67c         
       680         
       6a8         
       6ac         
       6b4         
       6b8         
       6d8         
       6f0         
       6f8         
       6fc         
       704         
       758         
       768         
       774         
       780         
       78c         
       798         
       79c         
       7a4         
       7a8         
       7b0         
       7b4         
       7bc         
       7c8         
       7d0         
       7d8         
       7dc         
       7e4         
       7f0         
       7f4         
       7fc         
       804         
       8a4         
       920         
       928         
       9d0         
       9d8         
       c24         
       c34         
       c70         
       c88         
       cd0         
       ce8         
       d28         
       d40         
       d80         
       d98         
       db8         
       dc8         
       de8         
       df8         
       e18         
       e28         
      134c         
      135c         
      1394         
      139c         
      13cc         
      13d8         
      140c         
      1414         
      1450         
      145c         
      1490         
      1498         
      14d8         
      14e4         
      14ec         
      14f4         
      1544         
      1548         
      1558         
      155c         
      156c         
      1570         
      1580         
      1584         

Source positions:
 pc offset  position
        44        70
        64       107
        b4       176
       14c       289
       158       299
       160       303
       168       310
       170       314
       17c       325
       184       330
       18c       335
       194       340
       198       343
       1c4       357
       1d8       370
       1e0       377
       1e8       389
       1f0       396
       238       438
       24c       467
       274       496
       280       508
       2cc       524
       2e0       529
       2e8       540
       304       559
       308       564
       310       571
       34c       613
       360       642
       388       671
       394       683
       3e0       699
       3e8       704
       3f0       715
       400       734
       408       739
       410       746
       450       789
       464       818
       48c       847
       498       859
       4e4       875
       4ec       880
       4f4       891
       504       910
       50c       915
       514       922
       564       961
       578       990
       5b0      1019
       5bc      1031
       604      1047
       618      1052
       620      1063
       62c      1076
       638      1083
       63c      1093
       640      1097
       644      1105
       64c      1111
       650      1121
       658      1125
       65c      1133
       660      1139
       668      1146
       66c      1155
       674      1159
       678      1167
       67c      1174
       680      1181
       6a8      1193
       6ac      1200
       6b0      1207
       6b8      1214
       6d8      1245
       6f0      1273
       6f8      1280
       6fc      1287
       704      1294
       758      1311
       768      1323
       774      1335
       780      1347
       78c      1357
       798      1370
       79c      1377
       7a4      1385
       7a8      1392
       7b0      1400
       7b4      1409
       7bc      1417
       7c8      1420
       7d0      1427
       7d8      1434
       7dc      1441
       7e4      1448
       7f0      1471
       7f4      1477
       7fc      1487
       804      1494
       8a4      1599
       920      1716
       928      1723
       9d0      1816
       9d8      1829
       c24      2380
       c34      2405
       c6c      2469
       c84      2492
       ccc      2556
       ce4      2579
       d24      2643
       d3c      2666
       d80      2730
       d98      2753
       db8      2802
       dc8      2823
       de8      2872
       df8      2893
       e18      2942
       e28      2963
      134c      3979
      135c      3994
      1394      4055
      139c      4063
      13cc      3979
      13d8      3994
      140c      4055
      1414      4063
      1450      3979
      145c      3994
      1490      4055
      1498      4063
      14d4      4150
      14e4      4157
      14e8      4164
      14f0      4171
      1504      4200
      1540      4220
      1548      4223
      1558      4233
      155c      4236
      156c      4246
      1570      4249
      1580      4259
      1584      4262
      1628         0
      1688       412
      16d0       587
      171c       763
      1768       935
      17b0      1303
      183c      1753
      18b8      2369
      19d4      3969

Safepoints (stack slots = 160, entries = 1, byte size = 34)
0x2d15098c0dbc    1bc  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 51)
0x2d15098c0db8  internal wasm call
0x2d15098c0e90  internal wasm call
0x2d15098c0fa0  internal wasm call
0x2d15098c10a4  internal wasm call
0x2d15098c11c8  internal wasm call
0x2d15098c2118  internal wasm call
0x2d15098c2228  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2294  wasm stub call  (0x2d15097c5bd0)
0x2d15098c22dc  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2328  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2374  wasm stub call  (0x2d15097c5bd0)
0x2d15098c23b4  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2458  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2534  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2614  wasm stub call  (0x2d15097c5bd0)
