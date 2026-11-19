name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1467
kind: wasm function
compiler: TurboFan
Body (size = 6816 = 6808 + 8 padding)
Instructions (size = 6772)
0x51082ee8be0     0  d2800110       movz x16, #0x8
0x51082ee8be4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x51082ee8be8     8  a9017bfd       stp fp, lr, [sp, #16]
0x51082ee8bec     c  910043fd       add fp, sp, #0x10 (16)
0x51082ee8bf0    10  d11383ff       sub sp, sp, #0x4e0 (1248)
0x51082ee8bf4    14  f841f0e1       ldur x1, [x7, #31]
0x51082ee8bf8    18  f8520346       ldur x6, [x26, #-224]
0x51082ee8bfc    1c  f90267e0       str x0, [sp, #1224]
0x51082ee8c00    20  f9025fe1       str x1, [sp, #1208]
0x51082ee8c04    24  eb2663ff       cmp sp, x6
0x51082ee8c08    28  5400afc9       b.ls #+0x15f8 (addr 0x51082eea200)
0x51082ee8c0c    2c  f842f0e6       ldur x6, [x7, #47]
0x51082ee8c10    30  b94000c8       ldr w8, [x6]
0x51082ee8c14    34  51014104       sub w4, w8, #0x50 (80)
0x51082ee8c18    38  b90000c4       str w4, [x6]
0x51082ee8c1c    3c  2a0003e8       mov w8, w0
0x51082ee8c20    40  91024029       add x9, x1, #0x90 (144)
0x51082ee8c24    44  fc686922       ldr d2, [x9, x8]
0x51082ee8c28    48  5e0c0441       mov s1, v2.s[1]
0x51082ee8c2c    4c  52a75010       movz w16, #0x3a800000
0x51082ee8c30    50  1e270203       fmov s3, w16
0x51082ee8c34    54  1e230824       fmul s4, s1, s3
0x51082ee8c38    58  5e040440       mov s0, v2.s[0]
0x51082ee8c3c    5c  1e230803       fmul s3, s0, s3
0x51082ee8c40    60  91028109       add x9, x8, #0xa0 (160)
0x51082ee8c44    64  bc696825       ldr s5, [x1, x9]
0x51082ee8c48    68  1e2520a0       fcmp s5, s5
0x51082ee8c4c    6c  1e251c66       fcsel s6, s3, s5, ne
0x51082ee8c50    70  1e232060       fcmp s3, s3
0x51082ee8c54    74  1e231cc3       fcsel s3, s6, s3, ne
0x51082ee8c58    78  1e262060       fcmp s3, s6
0x51082ee8c5c    7c  1e233cc3       fcsel s3, s6, s3, lo
0x51082ee8c60    80  1e232060       fcmp s3, s3
0x51082ee8c64    84  1e231c83       fcsel s3, s4, s3, ne
0x51082ee8c68    88  1e242080       fcmp s4, s4
0x51082ee8c6c    8c  1e241c64       fcsel s4, s3, s4, ne
0x51082ee8c70    90  1e232080       fcmp s4, s3
0x51082ee8c74    94  1e243c63       fcsel s3, s3, s4, lo
0x51082ee8c78    98  52840010       movz w16, #0x2000
0x51082ee8c7c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x51082ee8c80    a0  1e270204       fmov s4, w16
0x51082ee8c84    a4  1e240863       fmul s3, s3, s4
0x51082ee8c88    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x51082ee8c8c    ac  1e231883       fdiv s3, s4, s3
0x51082ee8c90    b0  91021109       add x9, x8, #0x84 (132)
0x51082ee8c94    b4  bc296823       str s3, [x1, x9]
0x51082ee8c98    b8  4e040466       dup v6.4s, v3.s[0]
0x51082ee8c9c    bc  6e26dc42       fmul v2.4s, v2.4s, v6.4s
0x51082ee8ca0    c0  4ea18842       frintp v2.4s, v2.4s
0x51082ee8ca4    c4  5e040446       mov s6, v2.s[0]
0x51082ee8ca8    c8  1e22c0c7       fcvt d7, s6
0x51082ee8cac    cc  1e65c0e8       frintz d8, d7
0x51082ee8cb0    d0  1e79010a       fcvtzu w10, d8
0x51082ee8cb4    d4  1e630149       ucvtf d9, w10
0x51082ee8cb8    d8  f9026fe6       str x6, [sp, #1240]
0x51082ee8cbc    dc  f9026be4       str x4, [sp, #1232]
0x51082ee8cc0    e0  f90017e8       str x8, [sp, #40]
0x51082ee8cc4    e4  fd023be1       str d1, [sp, #1136]
0x51082ee8cc8    e8  fd023fe0       str d0, [sp, #1144]
0x51082ee8ccc    ec  fd0263e5       str d5, [sp, #1216]
0x51082ee8cd0    f0  fd022fe3       str d3, [sp, #1112]
0x51082ee8cd4    f4  f90013e9       str x9, [sp, #32]
0x51082ee8cd8    f8  1e692100       fcmp d8, d9
0x51082ee8cdc    fc  5400a9c1       b.ne #+0x1538 (addr 0x51082eea214)
0x51082ee8ce0   100  4e040d46       dup v6.4s, w10
0x51082ee8ce4   104  5e0c0447       mov s7, v2.s[1]
0x51082ee8ce8   108  1e22c0e8       fcvt d8, s7
0x51082ee8cec   10c  1e65c109       frintz d9, d8
0x51082ee8cf0   110  1e79012a       fcvtzu w10, d9
0x51082ee8cf4   114  1e63014a       ucvtf d10, w10
0x51082ee8cf8   118  1e6a2120       fcmp d9, d10
0x51082ee8cfc   11c  5400aa21       b.ne #+0x1544 (addr 0x51082eea240)
0x51082ee8d00   120  4e0c1d46       mov v6.s[1], w10
0x51082ee8d04   124  4f000427       movi v7.4s, #0x1, lsl #0
0x51082ee8d08   128  6ea764c6       umax v6.4s, v6.4s, v7.4s
0x51082ee8d0c   12c  6f00e408       movi v8.2d, #0x0
0x51082ee8d10   130  6ea0c849       fcmge v9.4s, v2.4s, #0.0
0x51082ee8d14   134  52a9f010       movz w16, #0x4f800000
0x51082ee8d18   138  4e040e0a       dup v10.4s, w16
0x51082ee8d1c   13c  6ea2e542       fcmgt v2.4s, v10.4s, v2.4s
0x51082ee8d20   140  4e221d22       and v2.16b, v9.16b, v2.16b
0x51082ee8d24   144  6e671cc2       bsl v2.16b, v6.16b, v7.16b
0x51082ee8d28   148  9102202a       add x10, x1, #0x88 (136)
0x51082ee8d2c   14c  8b08014a       add x10, x10, x8
0x51082ee8d30   150  0d008542       st1 {v2.d}[0], [x10]
0x51082ee8d34   154  9103310a       add x10, x8, #0xcc (204)
0x51082ee8d38   158  b86a682a       ldr w10, [x1, x10]
0x51082ee8d3c   15c  9101208b       add x11, x4, #0x48 (72)
0x51082ee8d40   160  b82b682a       str w10, [x1, x11]
0x51082ee8d44   164  9103110a       add x10, x8, #0xc4 (196)
0x51082ee8d48   168  f86a682a       ldr x10, [x1, x10]
0x51082ee8d4c   16c  9101008b       add x11, x4, #0x40 (64)
0x51082ee8d50   170  f82b682a       str x10, [x1, x11]
0x51082ee8d54   174  1101800a       add w10, w0, #0x60 (96)
0x51082ee8d58   178  9100110b       add x11, x8, #0x4 (4)
0x51082ee8d5c   17c  b86b6822       ldr w2, [x1, x11]
0x51082ee8d60   180  9100210c       add x12, x8, #0x8 (8)
0x51082ee8d64   184  b86c6823       ldr w3, [x1, x12]
0x51082ee8d68   188  9100410d       add x13, x8, #0x10 (16)
0x51082ee8d6c   18c  b86d682e       ldr w14, [x1, x13]
0x51082ee8d70   190  9100510f       add x15, x8, #0x14 (20)
0x51082ee8d74   194  b86f6825       ldr w5, [x1, x15]
0x51082ee8d78   198  3d80cfe7       str q7, [sp, #816]
0x51082ee8d7c   19c  3d800fe8       str q8, [sp, #48]
0x51082ee8d80   1a0  f901efeb       str x11, [sp, #984]
0x51082ee8d84   1a4  f901ffec       str x12, [sp, #1016]
0x51082ee8d88   1a8  f90007ed       str x13, [sp, #8]
0x51082ee8d8c   1ac  f901fbef       str x15, [sp, #1008]
0x51082ee8d90   1b0  aa0a03e0       mov x0, x10
0x51082ee8d94   1b4  aa0e03e4       mov x4, x14
0x51082ee8d98   1b8  97fc1239       bl #-0xfb71c (addr 0x51082ded67c)
0x51082ee8d9c   1bc  f94017e1       ldr x1, [sp, #40]
0x51082ee8da0   1c0  9100e026       add x6, x1, #0x38 (56)
0x51082ee8da4   1c4  f9425fe8       ldr x8, [sp, #1208]
0x51082ee8da8   1c8  b826691f       str wzr, [x8, x6]
0x51082ee8dac   1cc  f94267e9       ldr x9, [sp, #1224]
0x51082ee8db0   1d0  11028122       add w2, w9, #0xa0 (160)
0x51082ee8db4   1d4  9101f02a       add x10, x1, #0x7c (124)
0x51082ee8db8   1d8  b86a690a       ldr w10, [x8, x10]
0x51082ee8dbc   1dc  9102002b       add x11, x1, #0x80 (128)
0x51082ee8dc0   1e0  b86b690b       ldr w11, [x8, x11]
0x51082ee8dc4   1e4  0b0b094b       add w11, w10, w11, lsl #2
0x51082ee8dc8   1e8  f941ffec       ldr x12, [sp, #1016]
0x51082ee8dcc   1ec  b86c690d       ldr w13, [x8, x12]
0x51082ee8dd0   1f0  f941efee       ldr x14, [sp, #984]
0x51082ee8dd4   1f4  b86e690f       ldr w15, [x8, x14]
0x51082ee8dd8   1f8  1100c120       add w0, w9, #0x30 (48)
0x51082ee8ddc   1fc  f9021fe6       str x6, [sp, #1080]
0x51082ee8de0   200  f90243e2       str x2, [sp, #1152]
0x51082ee8de4   204  f9022bea       str x10, [sp, #1104]
0x51082ee8de8   208  f90227eb       str x11, [sp, #1096]
0x51082ee8dec   20c  f9025bed       str x13, [sp, #1200]
0x51082ee8df0   210  f90257ef       str x15, [sp, #1192]
0x51082ee8df4   214  f9024fe0       str x0, [sp, #1176]
0x51082ee8df8   218  aa0a03f4       mov x20, x10
0x51082ee8dfc   21c  d2800013       movz x19, #0x0
0x51082ee8e00   220  fd422fe3       ldr d3, [sp, #1112]
0x51082ee8e04   224  f8520355       ldur x21, [x26, #-224]
0x51082ee8e08   228  eb3563ff       cmp sp, x21
0x51082ee8e0c   22c  5400a2a9       b.ls #+0x1454 (addr 0x51082eea260)
0x51082ee8e10   230  6b0b029f       cmp w20, w11
0x51082ee8e14   234  54000120       b.eq #+0x24 (addr 0x51082ee8e38)
0x51082ee8e18   238  b8746915       ldr w21, [x8, x20]
0x51082ee8e1c   23c  11001294       add w20, w20, #0x4 (4)
0x51082ee8e20   240  6b1501bf       cmp w13, w21
0x51082ee8e24   244  54ffff09       b.ls #-0x20 (addr 0x51082ee8e04)
0x51082ee8e28   248  0b1509f5       add w21, w15, w21, lsl #2
0x51082ee8e2c   24c  bc756903       ldr s3, [x8, x21]
0x51082ee8e30   250  d2800035       movz x21, #0x1
0x51082ee8e34   254  14000003       b #+0xc (addr 0x51082ee8e40)
0x51082ee8e38   258  d2800015       movz x21, #0x0
0x51082ee8e3c   25c  aa0b03f4       mov x20, x11
0x51082ee8e40   260  fd022fe3       str d3, [sp, #1112]
0x51082ee8e44   264  f90247f4       str x20, [sp, #1160]
0x51082ee8e48   268  710006bf       cmp w21, #0x1 (1)
0x51082ee8e4c   26c  540004a1       b.ne #+0x94 (addr 0x51082ee8ee0)
0x51082ee8e50   270  9100c035       add x21, x1, #0x30 (48)
0x51082ee8e54   274  b8756915       ldr w21, [x8, x21]
0x51082ee8e58   278  6b15027f       cmp w19, w21
0x51082ee8e5c   27c  54000261       b.ne #+0x4c (addr 0x51082ee8ea8)
0x51082ee8e60   280  d2800023       movz x3, #0x1
0x51082ee8e64   284  f90253f3       str x19, [sp, #1184]
0x51082ee8e68   288  f94273e7       ldr x7, [sp, #1248]
0x51082ee8e6c   28c  aa1303e2       mov x2, x19
0x51082ee8e70   290  97fc1204       bl #-0xfb7f0 (addr 0x51082ded680)
0x51082ee8e74   294  f9425fe8       ldr x8, [sp, #1208]
0x51082ee8e78   298  f94017e1       ldr x1, [sp, #40]
0x51082ee8e7c   29c  f941efee       ldr x14, [sp, #984]
0x51082ee8e80   2a0  f941ffec       ldr x12, [sp, #1016]
0x51082ee8e84   2a4  f9421fe6       ldr x6, [sp, #1080]
0x51082ee8e88   2a8  f94227eb       ldr x11, [sp, #1096]
0x51082ee8e8c   2ac  f94267e9       ldr x9, [sp, #1224]
0x51082ee8e90   2b0  fd422fe3       ldr d3, [sp, #1112]
0x51082ee8e94   2b4  f94247f4       ldr x20, [sp, #1160]
0x51082ee8e98   2b8  f94253f3       ldr x19, [sp, #1184]
0x51082ee8e9c   2bc  f9424fe0       ldr x0, [sp, #1176]
0x51082ee8ea0   2c0  f94257ef       ldr x15, [sp, #1192]
0x51082ee8ea4   2c4  f9425bed       ldr x13, [sp, #1200]
0x51082ee8ea8   2c8  1100066a       add w10, w19, #0x1 (1)
0x51082ee8eac   2cc  aa0803f0       mov x16, x8
0x51082ee8eb0   2d0  aa0603e8       mov x8, x6
0x51082ee8eb4   2d4  aa1003e6       mov x6, x16
0x51082ee8eb8   2d8  b82868ca       str w10, [x6, x8]
0x51082ee8ebc   2dc  9100d035       add x21, x1, #0x34 (52)
0x51082ee8ec0   2e0  b87568d5       ldr w21, [x6, x21]
0x51082ee8ec4   2e4  0b130ab3       add w19, w21, w19, lsl #2
0x51082ee8ec8   2e8  bc3368c3       str s3, [x6, x19]
0x51082ee8ecc   2ec  aa0803f0       mov x16, x8
0x51082ee8ed0   2f0  aa0603e8       mov x8, x6
0x51082ee8ed4   2f4  aa1003e6       mov x6, x16
0x51082ee8ed8   2f8  aa0a03f3       mov x19, x10
0x51082ee8edc   2fc  17ffffca       b #-0xd8 (addr 0x51082ee8e04)
0x51082ee8ee0   300  9101102a       add x10, x1, #0x44 (68)
0x51082ee8ee4   304  b82a691f       str wzr, [x8, x10]
0x51082ee8ee8   308  f941fbed       ldr x13, [sp, #1008]
0x51082ee8eec   30c  b86d690f       ldr w15, [x8, x13]
0x51082ee8ef0   310  f94007f3       ldr x19, [sp, #8]
0x51082ee8ef4   314  b8736914       ldr w20, [x8, x19]
0x51082ee8ef8   318  1100f120       add w0, w9, #0x3c (60)
0x51082ee8efc   31c  f9025bea       str x10, [sp, #1200]
0x51082ee8f00   320  f90247ef       str x15, [sp, #1160]
0x51082ee8f04   324  f9024ff4       str x20, [sp, #1176]
0x51082ee8f08   328  f9024be0       str x0, [sp, #1168]
0x51082ee8f0c   32c  aa0b03f5       mov x21, x11
0x51082ee8f10   330  f9422beb       ldr x11, [sp, #1104]
0x51082ee8f14   334  d2800002       movz x2, #0x0
0x51082ee8f18   338  f8520356       ldur x22, [x26, #-224]
0x51082ee8f1c   33c  eb3663ff       cmp sp, x22
0x51082ee8f20   340  54009c49       b.ls #+0x1388 (addr 0x51082eea2a8)
0x51082ee8f24   344  6b15017f       cmp w11, w21
0x51082ee8f28   348  54000120       b.eq #+0x24 (addr 0x51082ee8f4c)
0x51082ee8f2c   34c  b86b6916       ldr w22, [x8, x11]
0x51082ee8f30   350  1100116b       add w11, w11, #0x4 (4)
0x51082ee8f34   354  6b1601ff       cmp w15, w22
0x51082ee8f38   358  54ffff09       b.ls #-0x20 (addr 0x51082ee8f18)
0x51082ee8f3c   35c  0b160a96       add w22, w20, w22, lsl #2
0x51082ee8f40   360  bc766903       ldr s3, [x8, x22]
0x51082ee8f44   364  d2800036       movz x22, #0x1
0x51082ee8f48   368  14000003       b #+0xc (addr 0x51082ee8f54)
0x51082ee8f4c   36c  d2800016       movz x22, #0x0
0x51082ee8f50   370  aa1503eb       mov x11, x21
0x51082ee8f54   374  fd022fe3       str d3, [sp, #1112]
0x51082ee8f58   378  f90253eb       str x11, [sp, #1184]
0x51082ee8f5c   37c  710006df       cmp w22, #0x1 (1)
0x51082ee8f60   380  540003e1       b.ne #+0x7c (addr 0x51082ee8fdc)
0x51082ee8f64   384  9100f036       add x22, x1, #0x3c (60)
0x51082ee8f68   388  b8766916       ldr w22, [x8, x22]
0x51082ee8f6c   38c  6b16005f       cmp w2, w22
0x51082ee8f70   390  54000261       b.ne #+0x4c (addr 0x51082ee8fbc)
0x51082ee8f74   394  f90257e2       str x2, [sp, #1192]
0x51082ee8f78   398  f94273e7       ldr x7, [sp, #1248]
0x51082ee8f7c   39c  d2800023       movz x3, #0x1
0x51082ee8f80   3a0  97fc11c0       bl #-0xfb900 (addr 0x51082ded680)
0x51082ee8f84   3a4  f9425fe8       ldr x8, [sp, #1208]
0x51082ee8f88   3a8  f94017e1       ldr x1, [sp, #40]
0x51082ee8f8c   3ac  f94007f3       ldr x19, [sp, #8]
0x51082ee8f90   3b0  f941fbed       ldr x13, [sp, #1008]
0x51082ee8f94   3b4  f9421fe6       ldr x6, [sp, #1080]
0x51082ee8f98   3b8  f9425bea       ldr x10, [sp, #1200]
0x51082ee8f9c   3bc  f94227f5       ldr x21, [sp, #1096]
0x51082ee8fa0   3c0  f94267e9       ldr x9, [sp, #1224]
0x51082ee8fa4   3c4  fd422fe3       ldr d3, [sp, #1112]
0x51082ee8fa8   3c8  f94253eb       ldr x11, [sp, #1184]
0x51082ee8fac   3cc  f94257e2       ldr x2, [sp, #1192]
0x51082ee8fb0   3d0  f9424be0       ldr x0, [sp, #1168]
0x51082ee8fb4   3d4  f9424ff4       ldr x20, [sp, #1176]
0x51082ee8fb8   3d8  f94247ef       ldr x15, [sp, #1160]
0x51082ee8fbc   3dc  1100044c       add w12, w2, #0x1 (1)
0x51082ee8fc0   3e0  b82a690c       str w12, [x8, x10]
0x51082ee8fc4   3e4  9101002e       add x14, x1, #0x40 (64)
0x51082ee8fc8   3e8  b86e690e       ldr w14, [x8, x14]
0x51082ee8fcc   3ec  0b0209ce       add w14, w14, w2, lsl #2
0x51082ee8fd0   3f0  bc2e6903       str s3, [x8, x14]
0x51082ee8fd4   3f4  aa0c03e2       mov x2, x12
0x51082ee8fd8   3f8  17ffffd0       b #-0xc0 (addr 0x51082ee8f18)
0x51082ee8fdc   3fc  9101402b       add x11, x1, #0x50 (80)
0x51082ee8fe0   400  b82b691f       str wzr, [x8, x11]
0x51082ee8fe4   404  9100802c       add x12, x1, #0x20 (32)
0x51082ee8fe8   408  b86c690e       ldr w14, [x8, x12]
0x51082ee8fec   40c  9100702f       add x15, x1, #0x1c (28)
0x51082ee8ff0   410  b86f6914       ldr w20, [x8, x15]
0x51082ee8ff4   414  11012120       add w0, w9, #0x48 (72)
0x51082ee8ff8   418  f90257eb       str x11, [sp, #1192]
0x51082ee8ffc   41c  f901f7ec       str x12, [sp, #1000]
0x51082ee9000   420  f9024bee       str x14, [sp, #1168]
0x51082ee9004   424  f9000bef       str x15, [sp, #16]
0x51082ee9008   428  f90247f4       str x20, [sp, #1160]
0x51082ee900c   42c  f90233e0       str x0, [sp, #1120]
0x51082ee9010   430  aa1503f6       mov x22, x21
0x51082ee9014   434  f9422bf5       ldr x21, [sp, #1104]
0x51082ee9018   438  d2800002       movz x2, #0x0
0x51082ee901c   43c  f8520357       ldur x23, [x26, #-224]
0x51082ee9020   440  eb3763ff       cmp sp, x23
0x51082ee9024   444  54009689       b.ls #+0x12d0 (addr 0x51082eea2f4)
0x51082ee9028   448  6b1602bf       cmp w21, w22
0x51082ee902c   44c  54000120       b.eq #+0x24 (addr 0x51082ee9050)
0x51082ee9030   450  b8756917       ldr w23, [x8, x21]
0x51082ee9034   454  110012b5       add w21, w21, #0x4 (4)
0x51082ee9038   458  6b1701df       cmp w14, w23
0x51082ee903c   45c  54ffff09       b.ls #-0x20 (addr 0x51082ee901c)
0x51082ee9040   460  0b170a97       add w23, w20, w23, lsl #2
0x51082ee9044   464  bc776903       ldr s3, [x8, x23]
0x51082ee9048   468  d2800037       movz x23, #0x1
0x51082ee904c   46c  14000003       b #+0xc (addr 0x51082ee9058)
0x51082ee9050   470  d2800017       movz x23, #0x0
0x51082ee9054   474  aa1603f5       mov x21, x22
0x51082ee9058   478  fd022fe3       str d3, [sp, #1112]
0x51082ee905c   47c  f9024ff5       str x21, [sp, #1176]
0x51082ee9060   480  710006ff       cmp w23, #0x1 (1)
0x51082ee9064   484  540003e1       b.ne #+0x7c (addr 0x51082ee90e0)
0x51082ee9068   488  91012037       add x23, x1, #0x48 (72)
0x51082ee906c   48c  b8776917       ldr w23, [x8, x23]
0x51082ee9070   490  6b17005f       cmp w2, w23
0x51082ee9074   494  54000261       b.ne #+0x4c (addr 0x51082ee90c0)
0x51082ee9078   498  f90253e2       str x2, [sp, #1184]
0x51082ee907c   49c  f94273e7       ldr x7, [sp, #1248]
0x51082ee9080   4a0  d2800023       movz x3, #0x1
0x51082ee9084   4a4  97fc117f       bl #-0xfba04 (addr 0x51082ded680)
0x51082ee9088   4a8  f9425fe8       ldr x8, [sp, #1208]
0x51082ee908c   4ac  f94017e1       ldr x1, [sp, #40]
0x51082ee9090   4b0  f9400bef       ldr x15, [sp, #16]
0x51082ee9094   4b4  f941f7ec       ldr x12, [sp, #1000]
0x51082ee9098   4b8  f9425bea       ldr x10, [sp, #1200]
0x51082ee909c   4bc  f94257eb       ldr x11, [sp, #1192]
0x51082ee90a0   4c0  f94227f6       ldr x22, [sp, #1096]
0x51082ee90a4   4c4  fd422fe3       ldr d3, [sp, #1112]
0x51082ee90a8   4c8  f94267e9       ldr x9, [sp, #1224]
0x51082ee90ac   4cc  f9424ff5       ldr x21, [sp, #1176]
0x51082ee90b0   4d0  f94253e2       ldr x2, [sp, #1184]
0x51082ee90b4   4d4  f94233e0       ldr x0, [sp, #1120]
0x51082ee90b8   4d8  f94247f4       ldr x20, [sp, #1160]
0x51082ee90bc   4dc  f9424bee       ldr x14, [sp, #1168]
0x51082ee90c0   4e0  11000446       add w6, w2, #0x1 (1)
0x51082ee90c4   4e4  b82b6906       str w6, [x8, x11]
0x51082ee90c8   4e8  9101302d       add x13, x1, #0x4c (76)
0x51082ee90cc   4ec  b86d690d       ldr w13, [x8, x13]
0x51082ee90d0   4f0  0b0209ad       add w13, w13, w2, lsl #2
0x51082ee90d4   4f4  bc2d6903       str s3, [x8, x13]
0x51082ee90d8   4f8  aa0603e2       mov x2, x6
0x51082ee90dc   4fc  17ffffd0       b #-0xc0 (addr 0x51082ee901c)
0x51082ee90e0   500  91017026       add x6, x1, #0x5c (92)
0x51082ee90e4   504  b826691f       str wzr, [x8, x6]
0x51082ee90e8   508  9100b02d       add x13, x1, #0x2c (44)
0x51082ee90ec   50c  b86d690e       ldr w14, [x8, x13]
0x51082ee90f0   510  9100a033       add x19, x1, #0x28 (40)
0x51082ee90f4   514  b8736914       ldr w20, [x8, x19]
0x51082ee90f8   518  11015120       add w0, w9, #0x54 (84)
0x51082ee90fc   51c  f90253e6       str x6, [sp, #1184]
0x51082ee9100   520  f901f3ed       str x13, [sp, #992]
0x51082ee9104   524  f90237ee       str x14, [sp, #1128]
0x51082ee9108   528  f9000ff3       str x19, [sp, #24]
0x51082ee910c   52c  f9024bf4       str x20, [sp, #1168]
0x51082ee9110   530  f90267e0       str x0, [sp, #1224]
0x51082ee9114   534  d2800002       movz x2, #0x0
0x51082ee9118   538  f9422be9       ldr x9, [sp, #1104]
0x51082ee911c   53c  aa1603f5       mov x21, x22
0x51082ee9120   540  14000004       b #+0x10 (addr 0x51082ee9130)
0x51082ee9124   544  aa0803f0       mov x16, x8
0x51082ee9128   548  aa0603e8       mov x8, x6
0x51082ee912c   54c  aa1003e6       mov x6, x16
0x51082ee9130   550  f8520356       ldur x22, [x26, #-224]
0x51082ee9134   554  eb3663ff       cmp sp, x22
0x51082ee9138   558  54009049       b.ls #+0x1208 (addr 0x51082eea340)
0x51082ee913c   55c  6b15013f       cmp w9, w21
0x51082ee9140   560  540001a0       b.eq #+0x34 (addr 0x51082ee9174)
0x51082ee9144   564  b8696916       ldr w22, [x8, x9]
0x51082ee9148   568  11001129       add w9, w9, #0x4 (4)
0x51082ee914c   56c  6b1601df       cmp w14, w22
0x51082ee9150   570  540000a9       b.ls #+0x14 (addr 0x51082ee9164)
0x51082ee9154   574  0b160a96       add w22, w20, w22, lsl #2
0x51082ee9158   578  bc766903       ldr s3, [x8, x22]
0x51082ee915c   57c  d2800036       movz x22, #0x1
0x51082ee9160   580  14000007       b #+0x1c (addr 0x51082ee917c)
0x51082ee9164   584  aa0603f0       mov x16, x6
0x51082ee9168   588  aa0803e6       mov x6, x8
0x51082ee916c   58c  aa1003e8       mov x8, x16
0x51082ee9170   590  17ffffed       b #-0x4c (addr 0x51082ee9124)
0x51082ee9174   594  d2800016       movz x22, #0x0
0x51082ee9178   598  aa1503e9       mov x9, x21
0x51082ee917c   59c  f9022be9       str x9, [sp, #1104]
0x51082ee9180   5a0  fd022fe3       str d3, [sp, #1112]
0x51082ee9184   5a4  710006df       cmp w22, #0x1 (1)
0x51082ee9188   5a8  54000421       b.ne #+0x84 (addr 0x51082ee920c)
0x51082ee918c   5ac  91015036       add x22, x1, #0x54 (84)
0x51082ee9190   5b0  b8766916       ldr w22, [x8, x22]
0x51082ee9194   5b4  6b16005f       cmp w2, w22
0x51082ee9198   5b8  54000241       b.ne #+0x48 (addr 0x51082ee91e0)
0x51082ee919c   5bc  f9024fe2       str x2, [sp, #1176]
0x51082ee91a0   5c0  f94273e7       ldr x7, [sp, #1248]
0x51082ee91a4   5c4  d2800023       movz x3, #0x1
0x51082ee91a8   5c8  97fc1136       bl #-0xfbb28 (addr 0x51082ded680)
0x51082ee91ac   5cc  f9425fe8       ldr x8, [sp, #1208]
0x51082ee91b0   5d0  f94017e1       ldr x1, [sp, #40]
0x51082ee91b4   5d4  f9400ff3       ldr x19, [sp, #24]
0x51082ee91b8   5d8  f941f3ed       ldr x13, [sp, #992]
0x51082ee91bc   5dc  f94257eb       ldr x11, [sp, #1192]
0x51082ee91c0   5e0  f94253e6       ldr x6, [sp, #1184]
0x51082ee91c4   5e4  f9424fe2       ldr x2, [sp, #1176]
0x51082ee91c8   5e8  f9422be9       ldr x9, [sp, #1104]
0x51082ee91cc   5ec  fd422fe3       ldr d3, [sp, #1112]
0x51082ee91d0   5f0  f94267e0       ldr x0, [sp, #1224]
0x51082ee91d4   5f4  f94227f5       ldr x21, [sp, #1096]
0x51082ee91d8   5f8  f9424bf4       ldr x20, [sp, #1168]
0x51082ee91dc   5fc  f94237ee       ldr x14, [sp, #1128]
0x51082ee91e0   600  1100044a       add w10, w2, #0x1 (1)
0x51082ee91e4   604  aa0803f0       mov x16, x8
0x51082ee91e8   608  aa0603e8       mov x8, x6
0x51082ee91ec   60c  aa1003e6       mov x6, x16
0x51082ee91f0   610  b82868ca       str w10, [x6, x8]
0x51082ee91f4   614  9101602c       add x12, x1, #0x58 (88)
0x51082ee91f8   618  b86c68cc       ldr w12, [x6, x12]
0x51082ee91fc   61c  0b02098c       add w12, w12, w2, lsl #2
0x51082ee9200   620  bc2c68c3       str s3, [x6, x12]
0x51082ee9204   624  aa0a03e2       mov x2, x10
0x51082ee9208   628  17ffffc7       b #-0xe4 (addr 0x51082ee9124)
0x51082ee920c   62c  f9421fe9       ldr x9, [sp, #1080]
0x51082ee9210   630  b869690a       ldr w10, [x8, x9]
0x51082ee9214   634  9100c02c       add x12, x1, #0x30 (48)
0x51082ee9218   638  3cec6902       ldr q2, [x8, x12]
0x51082ee921c   63c  3ce16903       ldr q3, [x8, x1]
0x51082ee9220   640  3cac6903       str q3, [x8, x12]
0x51082ee9224   644  3ca16902       str q2, [x8, x1]
0x51082ee9228   648  9101002c       add x12, x1, #0x40 (64)
0x51082ee922c   64c  3cec6902       ldr q2, [x8, x12]
0x51082ee9230   650  f94007ee       ldr x14, [sp, #8]
0x51082ee9234   654  3cee6903       ldr q3, [x8, x14]
0x51082ee9238   658  3cac6903       str q3, [x8, x12]
0x51082ee923c   65c  3cae6902       str q2, [x8, x14]
0x51082ee9240   660  f86b690f       ldr x15, [x8, x11]
0x51082ee9244   664  91016034       add x20, x1, #0x58 (88)
0x51082ee9248   668  b8746915       ldr w21, [x8, x20]
0x51082ee924c   66c  f941f7f6       ldr x22, [sp, #1000]
0x51082ee9250   670  3cf66902       ldr q2, [x8, x22]
0x51082ee9254   674  3cab6902       str q2, [x8, x11]
0x51082ee9258   678  b8336915       str w21, [x8, x19]
0x51082ee925c   67c  b82d6902       str w2, [x8, x13]
0x51082ee9260   680  f836690f       str x15, [x8, x22]
0x51082ee9264   684  f90267ea       str x10, [sp, #1224]
0x51082ee9268   688  3500010a       cbnz w10, #+0x20 (addr 0x51082ee9288)
0x51082ee926c   68c  f9426be4       ldr x4, [sp, #1232]
0x51082ee9270   690  11014081       add w1, w4, #0x50 (80)
0x51082ee9274   694  f9426fef       ldr x15, [sp, #1240]
0x51082ee9278   698  b90001e1       str w1, [x15]
0x51082ee927c   69c  910003bf       mov sp, fp
0x51082ee9280   6a0  a8c17bfd       ldp fp, lr, [sp], #16
0x51082ee9284   6a4  d65f03c0       ret
0x51082ee9288   6a8  b8666906       ldr w6, [x8, x6]
0x51082ee928c   6ac  b86b690b       ldr w11, [x8, x11]
0x51082ee9290   6b0  f9425bef       ldr x15, [sp, #1200]
0x51082ee9294   6b4  b86f690f       ldr w15, [x8, x15]
0x51082ee9298   6b8  b8696909       ldr w9, [x8, x9]
0x51082ee929c   6bc  6b0901ff       cmp w15, w9
0x51082ee92a0   6c0  1a8931f5       csel w21, w15, w9, lo
0x51082ee92a4   6c4  6b15017f       cmp w11, w21
0x51082ee92a8   6c8  1a953169       csel w9, w11, w21, lo
0x51082ee92ac   6cc  6b0900df       cmp w6, w9
0x51082ee92b0   6d0  1a8930cb       csel w11, w6, w9, lo
0x51082ee92b4   6d4  91029026       add x6, x1, #0xa4 (164)
0x51082ee92b8   6d8  bc666902       ldr s2, [x8, x6]
0x51082ee92bc   6dc  1e220842       fmul s2, s2, s2
0x51082ee92c0   6e0  4e040443       dup v3.4s, v2.s[0]
0x51082ee92c4   6e4  fd4263e4       ldr d4, [sp, #1216]
0x51082ee92c8   6e8  1e240884       fmul s4, s4, s4
0x51082ee92cc   6ec  4e040485       dup v5.4s, v4.s[0]
0x51082ee92d0   6f0  b8746906       ldr w6, [x8, x20]
0x51082ee92d4   6f4  91013029       add x9, x1, #0x4c (76)
0x51082ee92d8   6f8  b8696909       ldr w9, [x8, x9]
0x51082ee92dc   6fc  b86c690c       ldr w12, [x8, x12]
0x51082ee92e0   700  9100d02f       add x15, x1, #0x34 (52)
0x51082ee92e4   704  b86f690f       ldr w15, [x8, x15]
0x51082ee92e8   708  f90247eb       str x11, [sp, #1160]
0x51082ee92ec   70c  fd020be2       str d2, [sp, #1040]
0x51082ee92f0   710  3d80cbe3       str q3, [sp, #800]
0x51082ee92f4   714  fd020fe4       str d4, [sp, #1048]
0x51082ee92f8   718  3d8043e5       str q5, [sp, #256]
0x51082ee92fc   71c  f9025be6       str x6, [sp, #1200]
0x51082ee9300   720  f90253e9       str x9, [sp, #1184]
0x51082ee9304   724  f9024fec       str x12, [sp, #1176]
0x51082ee9308   728  f9024bef       str x15, [sp, #1168]
0x51082ee930c   72c  f941fff5       ldr x21, [sp, #1016]
0x51082ee9310   730  3dc0cfe7       ldr q7, [sp, #816]
0x51082ee9314   734  d280001c       movz x28, #0x0
0x51082ee9318   738  f94013fb       ldr cp, [sp, #32]
0x51082ee931c   73c  f9400bf9       ldr x25, [sp, #16]
0x51082ee9320   740  f941eff8       ldr x24, [sp, #984]
0x51082ee9324   744  f941fbf7       ldr x23, [sp, #1008]
0x51082ee9328   748  aa1c03f4       mov x20, x28
0x51082ee932c   74c  f8520340       ldur x0, [x26, #-224]
0x51082ee9330   750  eb2063ff       cmp sp, x0
0x51082ee9334   754  540082a9       b.ls #+0x1054 (addr 0x51082eea388)
0x51082ee9338   758  b8756900       ldr w0, [x8, x21]
0x51082ee933c   75c  f9003be0       str x0, [sp, #112]
0x51082ee9340   760  6b14001f       cmp w0, w20
0x51082ee9344   764  540074c9       b.ls #+0xe98 (addr 0x51082eea1dc)
0x51082ee9348   768  b8776902       ldr w2, [x8, x23]
0x51082ee934c   76c  6b14005f       cmp w2, w20
0x51082ee9350   770  54007469       b.ls #+0xe8c (addr 0x51082eea1dc)
0x51082ee9354   774  b8766903       ldr w3, [x8, x22]
0x51082ee9358   778  6b14007f       cmp w3, w20
0x51082ee935c   77c  54007409       b.ls #+0xe80 (addr 0x51082eea1dc)
0x51082ee9360   780  b86d6904       ldr w4, [x8, x13]
0x51082ee9364   784  6b14009f       cmp w4, w20
0x51082ee9368   788  540073a9       b.ls #+0xe74 (addr 0x51082eea1dc)
0x51082ee936c   78c  b8786905       ldr w5, [x8, x24]
0x51082ee9370   790  531e7687       lsl w7, w20, #2
0x51082ee9374   794  0b0700a6       add w6, w5, w7
0x51082ee9378   798  bc666909       ldr s9, [x8, x6]
0x51082ee937c   79c  b86e6906       ldr w6, [x8, x14]
0x51082ee9380   7a0  0b0700c9       add w9, w6, w7
0x51082ee9384   7a4  bc69690a       ldr s10, [x8, x9]
0x51082ee9388   7a8  b8796909       ldr w9, [x8, x25]
0x51082ee938c   7ac  0b07012a       add w10, w9, w7
0x51082ee9390   7b0  bc6a690b       ldr s11, [x8, x10]
0x51082ee9394   7b4  b873690a       ldr w10, [x8, x19]
0x51082ee9398   7b8  0b07014b       add w11, w10, w7
0x51082ee939c   7bc  bc6b690c       ldr s12, [x8, x11]
0x51082ee93a0   7c0  f9426bec       ldr x12, [sp, #1232]
0x51082ee93a4   7c4  9100318b       add x11, x12, #0xc (12)
0x51082ee93a8   7c8  bc2b690c       str s12, [x8, x11]
0x51082ee93ac   7cc  9100218b       add x11, x12, #0x8 (8)
0x51082ee93b0   7d0  bc2b690b       str s11, [x8, x11]
0x51082ee93b4   7d4  9100118b       add x11, x12, #0x4 (4)
0x51082ee93b8   7d8  bc2b690a       str s10, [x8, x11]
0x51082ee93bc   7dc  bc2c6909       str s9, [x8, x12]
0x51082ee93c0   7e0  9100818b       add x11, x12, #0x20 (32)
0x51082ee93c4   7e4  f82b691f       str xzr, [x8, x11]
0x51082ee93c8   7e8  6f00e40b       movi v11.2d, #0x0
0x51082ee93cc   7ec  9100418d       add x13, x12, #0x10 (16)
0x51082ee93d0   7f0  3cad690b       str q11, [x8, x13]
0x51082ee93d4   7f4  bc7b690b       ldr s11, [x8, x27]
0x51082ee93d8   7f8  9100a18e       add x14, x12, #0x28 (40)
0x51082ee93dc   7fc  b82e691f       str wzr, [x8, x14]
0x51082ee93e0   800  9102302f       add x15, x1, #0x8c (140)
0x51082ee93e4   804  b86f690f       ldr w15, [x8, x15]
0x51082ee93e8   808  710001ff       cmp w15, #0x0 (0)
0x51082ee93ec   80c  9a9f07f3       cset x19, ne
0x51082ee93f0   810  4b1301ef       sub w15, w15, w19
0x51082ee93f4   814  1e2b094c       fmul s12, s10, s11
0x51082ee93f8   818  1e2c2180       fcmp s12, s12
0x51082ee93fc   81c  1e2c1dec       fcsel s12, s15, s12, ne
0x51082ee9400   820  1e202188       fcmp s12, #0.0
0x51082ee9404   824  1e2fcd8c       fcsel s12, s12, s15, gt
0x51082ee9408   828  1e22c18d       fcvt d13, s12
0x51082ee940c   82c  1e65c1ae       frintz d14, d13
0x51082ee9410   830  1e7901d3       fcvtzu w19, d14
0x51082ee9414   834  1e630270       ucvtf d16, w19
0x51082ee9418   838  f90263f4       str x20, [sp, #1216]
0x51082ee941c   83c  f90257e7       str x7, [sp, #1192]
0x51082ee9420   840  fd0203e9       str d9, [sp, #1024]
0x51082ee9424   844  f90047e6       str x6, [sp, #136]
0x51082ee9428   848  fd0207ea       str d10, [sp, #1032]
0x51082ee942c   84c  f9003fe9       str x9, [sp, #120]
0x51082ee9430   850  f90233eb       str x11, [sp, #1120]
0x51082ee9434   854  f90237ed       str x13, [sp, #1128]
0x51082ee9438   858  f9022fee       str x14, [sp, #1112]
0x51082ee943c   85c  1e7021c0       fcmp d14, d16
0x51082ee9440   860  54007ca1       b.ne #+0xf94 (addr 0x51082eea3d4)
0x51082ee9444   864  6b1301ff       cmp w15, w19
0x51082ee9448   868  1a9331f4       csel w20, w15, w19, lo
0x51082ee944c   86c  52a9f010       movz w16, #0x4f800000
0x51082ee9450   870  1e27020d       fmov s13, w16
0x51082ee9454   874  1e2d2180       fcmp s12, s13
0x51082ee9458   878  1a9f3293       csel w19, w20, wzr, lo
0x51082ee945c   87c  7100027f       cmp w19, #0x0 (0)
0x51082ee9460   880  9a9f07f4       cset x20, ne
0x51082ee9464   884  4b140274       sub w20, w19, w20
0x51082ee9468   888  11000673       add w19, w19, #0x1 (1)
0x51082ee946c   88c  6b1301ff       cmp w15, w19
0x51082ee9470   890  1a9331f5       csel w21, w15, w19, lo
0x51082ee9474   894  6b1402bf       cmp w21, w20
0x51082ee9478   898  540062c3       b.lo #+0xc58 (addr 0x51082eea0d0)
0x51082ee947c   89c  9102202f       add x15, x1, #0x88 (136)
0x51082ee9480   8a0  b86f690f       ldr w15, [x8, x15]
0x51082ee9484   8a4  710001ff       cmp w15, #0x0 (0)
0x51082ee9488   8a8  9a9f07f3       cset x19, ne
0x51082ee948c   8ac  4b1301f3       sub w19, w15, w19
0x51082ee9490   8b0  1e2b092b       fmul s11, s9, s11
0x51082ee9494   8b4  1e2b2160       fcmp s11, s11
0x51082ee9498   8b8  1e2b1deb       fcsel s11, s15, s11, ne
0x51082ee949c   8bc  1e202168       fcmp s11, #0.0
0x51082ee94a0   8c0  1e2fcd6b       fcsel s11, s11, s15, gt
0x51082ee94a4   8c4  1e22c16c       fcvt d12, s11
0x51082ee94a8   8c8  1e65c18e       frintz d14, d12
0x51082ee94ac   8cc  1e7901d6       fcvtzu w22, d14
0x51082ee94b0   8d0  1e6302d0       ucvtf d16, w22
0x51082ee94b4   8d4  f90023ef       str x15, [sp, #64]
0x51082ee94b8   8d8  1e7021c0       fcmp d14, d16
0x51082ee94bc   8dc  540079c1       b.ne #+0xf38 (addr 0x51082eea3f4)
0x51082ee94c0   8e0  6b16027f       cmp w19, w22
0x51082ee94c4   8e4  1a963277       csel w23, w19, w22, lo
0x51082ee94c8   8e8  1e2d2160       fcmp s11, s13
0x51082ee94cc   8ec  1a9f32f6       csel w22, w23, wzr, lo
0x51082ee94d0   8f0  710002df       cmp w22, #0x0 (0)
0x51082ee94d4   8f4  9a9f07f7       cset x23, ne
0x51082ee94d8   8f8  4b1702d7       sub w23, w22, w23
0x51082ee94dc   8fc  110006d6       add w22, w22, #0x1 (1)
0x51082ee94e0   900  6b16027f       cmp w19, w22
0x51082ee94e4   904  1a963278       csel w24, w19, w22, lo
0x51082ee94e8   908  11000713       add w19, w24, #0x1 (1)
0x51082ee94ec   90c  4e04052b       dup v11.4s, v9.s[0]
0x51082ee94f0   910  4e04054c       dup v12.4s, v10.s[0]
0x51082ee94f4   914  91019036       add x22, x1, #0x64 (100)
0x51082ee94f8   918  b8766916       ldr w22, [x8, x22]
0x51082ee94fc   91c  9101a038       add x24, x1, #0x68 (104)
0x51082ee9500   920  b8786918       ldr w24, [x8, x24]
0x51082ee9504   924  f90027f7       str x23, [sp, #72]
0x51082ee9508   928  f9002bf3       str x19, [sp, #80]
0x51082ee950c   92c  3d803beb       str q11, [sp, #224]
0x51082ee9510   930  3d803fec       str q12, [sp, #240]
0x51082ee9514   934  f90033f6       str x22, [sp, #96]
0x51082ee9518   938  f9002ff8       str x24, [sp, #88]
0x51082ee951c   93c  3dc00ffe       ldr q30, [sp, #48]
0x51082ee9520   940  3d80e7fe       str q30, [sp, #912]
0x51082ee9524   944  b903bbff       str wzr, [sp, #952]
0x51082ee9528   948  b903b3ff       str wzr, [sp, #944]
0x51082ee952c   94c  b903abff       str wzr, [sp, #936]
0x51082ee9530   950  14000013       b #+0x4c (addr 0x51082ee957c)
0x51082ee9534   954  3d80e7f1       str q17, [sp, #912]
0x51082ee9538   958  fd01dfed       str d13, [sp, #952]
0x51082ee953c   95c  fd01dbee       str d14, [sp, #944]
0x51082ee9540   960  fd01d7f0       str d16, [sp, #936]
0x51082ee9544   964  aa0103f4       mov x20, x1
0x51082ee9548   968  3dc0cfe7       ldr q7, [sp, #816]
0x51082ee954c   96c  3dc0cbe3       ldr q3, [sp, #800]
0x51082ee9550   970  3dc043e5       ldr q5, [sp, #256]
0x51082ee9554   974  3dc03fec       ldr q12, [sp, #240]
0x51082ee9558   978  3dc03beb       ldr q11, [sp, #224]
0x51082ee955c   97c  f94047e6       ldr x6, [sp, #136]
0x51082ee9560   980  f9403fe9       ldr x9, [sp, #120]
0x51082ee9564   984  f9403be0       ldr x0, [sp, #112]
0x51082ee9568   988  f94033f6       ldr x22, [sp, #96]
0x51082ee956c   98c  f9402ff8       ldr x24, [sp, #88]
0x51082ee9570   990  f9402bf3       ldr x19, [sp, #80]
0x51082ee9574   994  f94027f7       ldr x23, [sp, #72]
0x51082ee9578   998  f94023ef       ldr x15, [sp, #64]
0x51082ee957c   99c  f8520341       ldur x1, [x26, #-224]
0x51082ee9580   9a0  eb2163ff       cmp sp, x1
0x51082ee9584   9a4  54007489       b.ls #+0xe90 (addr 0x51082eea414)
0x51082ee9588   9a8  1b0f7e81       mul w1, w20, w15
0x51082ee958c   9ac  0b170039       add w25, w1, w23
0x51082ee9590   9b0  6b19031f       cmp w24, w25
0x51082ee9594   9b4  54000129       b.ls #+0x24 (addr 0x51082ee95b8)
0x51082ee9598   9b8  0b010261       add w1, w19, w1
0x51082ee959c   9bc  6b01031f       cmp w24, w1
0x51082ee95a0   9c0  540000c9       b.ls #+0x18 (addr 0x51082ee95b8)
0x51082ee95a4   9c4  0b010ac1       add w1, w22, w1, lsl #2
0x51082ee95a8   9c8  b8616901       ldr w1, [x8, x1]
0x51082ee95ac   9cc  0b190ad9       add w25, w22, w25, lsl #2
0x51082ee95b0   9d0  b8796919       ldr w25, [x8, x25]
0x51082ee95b4   9d4  14000003       b #+0xc (addr 0x51082ee95c0)
0x51082ee95b8   9d8  aa1c03e1       mov x1, x28
0x51082ee95bc   9dc  aa1c03f9       mov x25, x28
0x51082ee95c0   9e0  531e773b       lsl w27, w25, #2
0x51082ee95c4   9e4  0b1b00a7       add w7, w5, w27
0x51082ee95c8   9e8  4b19002d       sub w13, w1, w25
0x51082ee95cc   9ec  6b01001f       cmp w0, w1
0x51082ee95d0   9f0  9a9f27eb       cset x11, lo
0x51082ee95d4   9f4  6b19003f       cmp w1, w25
0x51082ee95d8   9f8  9a9f27ec       cset x12, lo
0x51082ee95dc   9fc  2a0c016e       orr w14, w11, w12
0x51082ee95e0   a00  6a0e01df       tst w14, w14
0x51082ee95e4   a04  1a8d13ee       csel w14, wzr, w13, ne
0x51082ee95e8   a08  6b19003f       cmp w1, w25
0x51082ee95ec   a0c  540003e3       b.lo #+0x7c (addr 0x51082ee9668)
0x51082ee95f0   a10  0b1b0139       add w25, w9, w27
0x51082ee95f4   a14  d2800089       movz x9, #0x4
0x51082ee95f8   a18  6b01007f       cmp w3, w1
0x51082ee95fc   a1c  1a99312f       csel w15, w9, w25, lo
0x51082ee9600   a20  6b01007f       cmp w3, w1
0x51082ee9604   a24  1a8d3399       csel w25, w28, w13, lo
0x51082ee9608   a28  121c6333       and w19, w25, #0x1ffffff0
0x51082ee960c   a2c  0b1309f3       add w19, w15, w19, lsl #2
0x51082ee9610   a30  0b1b00d6       add w22, w6, w27
0x51082ee9614   a34  6b01005f       cmp w2, w1
0x51082ee9618   a38  1a963126       csel w6, w9, w22, lo
0x51082ee961c   a3c  6b01005f       cmp w2, w1
0x51082ee9620   a40  1a8d3396       csel w22, w28, w13, lo
0x51082ee9624   a44  121c62d7       and w23, w22, #0x1ffffff0
0x51082ee9628   a48  0b1708d7       add w23, w6, w23, lsl #2
0x51082ee962c   a4c  53047f38       lsr w24, w25, #4
0x51082ee9630   a50  12000f39       and w25, w25, #0xf
0x51082ee9634   a54  53047ec0       lsr w0, w22, #4
0x51082ee9638   a58  12000ed6       and w22, w22, #0xf
0x51082ee963c   a5c  6b01009f       cmp w4, w1
0x51082ee9640   a60  540000c3       b.lo #+0x18 (addr 0x51082ee9658)
0x51082ee9644   a64  0b1b0141       add w1, w10, w27
0x51082ee9648   a68  aa0d03f0       mov x16, x13
0x51082ee964c   a6c  aa0603ed       mov x13, x6
0x51082ee9650   a70  aa1003e6       mov x6, x16
0x51082ee9654   a74  14000010       b #+0x40 (addr 0x51082ee9694)
0x51082ee9658   a78  aa0603ed       mov x13, x6
0x51082ee965c   a7c  aa1c03e6       mov x6, x28
0x51082ee9660   a80  aa0903e1       mov x1, x9
0x51082ee9664   a84  1400000c       b #+0x30 (addr 0x51082ee9694)
0x51082ee9668   a88  aa1c03e6       mov x6, x28
0x51082ee966c   a8c  aa1c03f9       mov x25, x28
0x51082ee9670   a90  d2800089       movz x9, #0x4
0x51082ee9674   a94  aa1c03f6       mov x22, x28
0x51082ee9678   a98  aa1c03e0       mov x0, x28
0x51082ee967c   a9c  aa1c03f8       mov x24, x28
0x51082ee9680   aa0  aa0903e1       mov x1, x9
0x51082ee9684   aa4  aa0903ed       mov x13, x9
0x51082ee9688   aa8  aa0903ef       mov x15, x9
0x51082ee968c   aac  aa0903f3       mov x19, x9
0x51082ee9690   ab0  aa0903f7       mov x23, x9
0x51082ee9694   ab4  2a0c016b       orr w11, w11, w12
0x51082ee9698   ab8  6a0b017f       tst w11, w11
0x51082ee969c   abc  1a871129       csel w9, w9, w7, ne
0x51082ee96a0   ac0  53047ccb       lsr w11, w6, #4
0x51082ee96a4   ac4  53047dcc       lsr w12, w14, #4
0x51082ee96a8   ac8  6b0c001f       cmp w0, w12
0x51082ee96ac   acc  1a8c301b       csel w27, w0, w12, lo
0x51082ee96b0   ad0  6b1b031f       cmp w24, w27
0x51082ee96b4   ad4  1a9b330c       csel w12, w24, w27, lo
0x51082ee96b8   ad8  6b0c017f       cmp w11, w12
0x51082ee96bc   adc  1a8c3178       csel w24, w11, w12, lo
0x51082ee96c0   ae0  350003d8       cbnz w24, #+0x78 (addr 0x51082ee9738)
0x51082ee96c4   ae4  6f00e412       movi v18.2d, #0x0
0x51082ee96c8   ae8  4eb21e47       mov v7.16b, v18.16b
0x51082ee96cc   aec  4eb21e43       mov v3.16b, v18.16b
0x51082ee96d0   af0  4eb21e41       mov v1.16b, v18.16b
0x51082ee96d4   af4  4eb21e5a       mov v26.16b, v18.16b
0x51082ee96d8   af8  4eb21e50       mov v16.16b, v18.16b
0x51082ee96dc   afc  4eb21e5b       mov v27.16b, v18.16b
0x51082ee96e0   b00  4eb21e4e       mov v14.16b, v18.16b
0x51082ee96e4   b04  4eb21e4c       mov v12.16b, v18.16b
0x51082ee96e8   b08  4eb21e51       mov v17.16b, v18.16b
0x51082ee96ec   b0c  4eb21e4b       mov v11.16b, v18.16b
0x51082ee96f0   b10  4eb21e49       mov v9.16b, v18.16b
0x51082ee96f4   b14  4eb21e4a       mov v10.16b, v18.16b
0x51082ee96f8   b18  4eb21e48       mov v8.16b, v18.16b
0x51082ee96fc   b1c  4eb21e40       mov v0.16b, v18.16b
0x51082ee9700   b20  4eb21e46       mov v6.16b, v18.16b
0x51082ee9704   b24  4eb21e4d       mov v13.16b, v18.16b
0x51082ee9708   b28  4eb21e58       mov v24.16b, v18.16b
0x51082ee970c   b2c  4eb21e42       mov v2.16b, v18.16b
0x51082ee9710   b30  4eb21e5c       mov v28.16b, v18.16b
0x51082ee9714   b34  4eb21e59       mov v25.16b, v18.16b
0x51082ee9718   b38  4eb21e44       mov v4.16b, v18.16b
0x51082ee971c   b3c  4eb21e57       mov v23.16b, v18.16b
0x51082ee9720   b40  4eb21e54       mov v20.16b, v18.16b
0x51082ee9724   b44  4eb21e56       mov v22.16b, v18.16b
0x51082ee9728   b48  4eb21e45       mov v5.16b, v18.16b
0x51082ee972c   b4c  4eb21e53       mov v19.16b, v18.16b
0x51082ee9730   b50  4eb21e55       mov v21.16b, v18.16b
0x51082ee9734   b54  140000ff       b #+0x3fc (addr 0x51082ee9b30)
0x51082ee9738   b58  6f00e412       movi v18.2d, #0x0
0x51082ee973c   b5c  4eb21e4e       mov v14.16b, v18.16b
0x51082ee9740   b60  3d808bf2       str q18, [sp, #544]
0x51082ee9744   b64  4eb21e41       mov v1.16b, v18.16b
0x51082ee9748   b68  4eb21e48       mov v8.16b, v18.16b
0x51082ee974c   b6c  4eb21e50       mov v16.16b, v18.16b
0x51082ee9750   b70  3d8083f2       str q18, [sp, #512]
0x51082ee9754   b74  4eb21e46       mov v6.16b, v18.16b
0x51082ee9758   b78  4eb21e49       mov v9.16b, v18.16b
0x51082ee975c   b7c  4eb21e51       mov v17.16b, v18.16b
0x51082ee9760   b80  3d807ff2       str q18, [sp, #496]
0x51082ee9764   b84  4eb21e42       mov v2.16b, v18.16b
0x51082ee9768   b88  4eb21e4a       mov v10.16b, v18.16b
0x51082ee976c   b8c  3d804bf2       str q18, [sp, #288]
0x51082ee9770   b90  4eb21e40       mov v0.16b, v18.16b
0x51082ee9774   b94  4eb21e44       mov v4.16b, v18.16b
0x51082ee9778   b98  4eb21e4d       mov v13.16b, v18.16b
0x51082ee977c   b9c  3d802ff2       str q18, [sp, #176]
0x51082ee9780   ba0  3d8047f2       str q18, [sp, #272]
0x51082ee9784   ba4  3d8037f2       str q18, [sp, #208]
0x51082ee9788   ba8  3d8033f2       str q18, [sp, #192]
0x51082ee978c   bac  3d809ff2       str q18, [sp, #624]
0x51082ee9790   bb0  aa1c03eb       mov x11, x28
0x51082ee9794   bb4  3d80c7f2       str q18, [sp, #784]
0x51082ee9798   bb8  3d80b3f2       str q18, [sp, #704]
0x51082ee979c   bbc  3d8097f2       str q18, [sp, #592]
0x51082ee97a0   bc0  3d80d7f2       str q18, [sp, #848]
0x51082ee97a4   bc4  3d80bff2       str q18, [sp, #752]
0x51082ee97a8   bc8  3d80abf2       str q18, [sp, #672]
0x51082ee97ac   bcc  1400000f       b #+0x3c (addr 0x51082ee97e8)
0x51082ee97b0   bd0  3dc03beb       ldr q11, [sp, #224]
0x51082ee97b4   bd4  3d808bfa       str q26, [sp, #544]
0x51082ee97b8   bd8  3dc03fec       ldr q12, [sp, #240]
0x51082ee97bc   bdc  3d807fe5       str q5, [sp, #496]
0x51082ee97c0   be0  3dc043e5       ldr q5, [sp, #256]
0x51082ee97c4   be4  3d80abf7       str q23, [sp, #672]
0x51082ee97c8   be8  3d8083fb       str q27, [sp, #512]
0x51082ee97cc   bec  3d80bff5       str q21, [sp, #752]
0x51082ee97d0   bf0  3d80d7f3       str q19, [sp, #848]
0x51082ee97d4   bf4  3d8097f9       str q25, [sp, #592]
0x51082ee97d8   bf8  3d80b3f6       str q22, [sp, #704]
0x51082ee97dc   bfc  3d80c7f4       str q20, [sp, #784]
0x51082ee97e0   c00  3d804bfc       str q28, [sp, #288]
0x51082ee97e4   c04  3d809ff8       str q24, [sp, #624]
0x51082ee97e8   c08  f852034c       ldur x12, [x26, #-224]
0x51082ee97ec   c0c  3d80dff2       str q18, [sp, #880]
0x51082ee97f0   c10  eb2c63ff       cmp sp, x12
0x51082ee97f4   c14  540064e9       b.ls #+0xc9c (addr 0x51082eea490)
0x51082ee97f8   c18  0b0b012c       add w12, w9, w11
0x51082ee97fc   c1c  3cec6912       ldr q18, [x8, x12]
0x51082ee9800   c20  4eb2d573       fsub v19.4s, v11.4s, v18.4s
0x51082ee9804   c24  6e33de74       fmul v20.4s, v19.4s, v19.4s
0x51082ee9808   c28  0b0b01bb       add w27, w13, w11
0x51082ee980c   c2c  3cfb6915       ldr q21, [x8, x27]
0x51082ee9810   c30  4eb5d596       fsub v22.4s, v12.4s, v21.4s
0x51082ee9814   c34  6e36ded7       fmul v23.4s, v22.4s, v22.4s
0x51082ee9818   c38  4e37d694       fadd v20.4s, v20.4s, v23.4s
0x51082ee981c   c3c  6e23e697       fcmge v23.4s, v20.4s, v3.4s
0x51082ee9820   c40  6eb4e4b8       fcmgt v24.4s, v5.4s, v20.4s
0x51082ee9824   c44  4e381ef7       and v23.16b, v23.16b, v24.16b
0x51082ee9828   c48  4ea0ca98       fcmgt v24.4s, v20.4s, #0.0
0x51082ee982c   c4c  4e271f18       and v24.16b, v24.16b, v7.16b
0x51082ee9830   c50  4e21db18       scvtf v24.4s, v24.4s
0x51082ee9834   c54  4e381ef7       and v23.16b, v23.16b, v24.16b
0x51082ee9838   c58  3dc02ff8       ldr q24, [sp, #176]
0x51082ee983c   c5c  4e38d6f8       fadd v24.4s, v23.4s, v24.4s
0x51082ee9840   c60  1100c180       add w0, w12, #0x30 (48)
0x51082ee9844   c64  3d802ff8       str q24, [sp, #176]
0x51082ee9848   c68  3ce06918       ldr q24, [x8, x0]
0x51082ee984c   c6c  3d809bf3       str q19, [sp, #608]
0x51082ee9850   c70  4eb8d573       fsub v19.4s, v11.4s, v24.4s
0x51082ee9854   c74  6e33de79       fmul v25.4s, v19.4s, v19.4s
0x51082ee9858   c78  1100c360       add w0, w27, #0x30 (48)
0x51082ee985c   c7c  3d80aff3       str q19, [sp, #688]
0x51082ee9860   c80  3ce06913       ldr q19, [x8, x0]
0x51082ee9864   c84  3d8093f6       str q22, [sp, #576]
0x51082ee9868   c88  4eb3d596       fsub v22.4s, v12.4s, v19.4s
0x51082ee986c   c8c  3d808ff4       str q20, [sp, #560]
0x51082ee9870   c90  6e36ded4       fmul v20.4s, v22.4s, v22.4s
0x51082ee9874   c94  4e34d734       fadd v20.4s, v25.4s, v20.4s
0x51082ee9878   c98  6e23e699       fcmge v25.4s, v20.4s, v3.4s
0x51082ee987c   c9c  3d80a7f6       str q22, [sp, #656]
0x51082ee9880   ca0  6eb4e4b6       fcmgt v22.4s, v5.4s, v20.4s
0x51082ee9884   ca4  4e361f36       and v22.16b, v25.16b, v22.16b
0x51082ee9888   ca8  4ea0ca99       fcmgt v25.4s, v20.4s, #0.0
0x51082ee988c   cac  4e271f39       and v25.16b, v25.16b, v7.16b
0x51082ee9890   cb0  4e21db39       scvtf v25.4s, v25.4s
0x51082ee9894   cb4  4e391ed6       and v22.16b, v22.16b, v25.16b
0x51082ee9898   cb8  3dc033f9       ldr q25, [sp, #192]
0x51082ee989c   cbc  4e39d6d9       fadd v25.4s, v22.4s, v25.4s
0x51082ee98a0   cc0  11008180       add w0, w12, #0x20 (32)
0x51082ee98a4   cc4  3d8033f9       str q25, [sp, #192]
0x51082ee98a8   cc8  3ce06919       ldr q25, [x8, x0]
0x51082ee98ac   ccc  3d80a3f4       str q20, [sp, #640]
0x51082ee98b0   cd0  4eb9d574       fsub v20.4s, v11.4s, v25.4s
0x51082ee98b4   cd4  6e34de9a       fmul v26.4s, v20.4s, v20.4s
0x51082ee98b8   cd8  11008360       add w0, w27, #0x20 (32)
0x51082ee98bc   cdc  3d80c3f4       str q20, [sp, #768]
0x51082ee98c0   ce0  3ce06914       ldr q20, [x8, x0]
0x51082ee98c4   ce4  4eb4d59b       fsub v27.4s, v12.4s, v20.4s
0x51082ee98c8   ce8  6e3bdf7c       fmul v28.4s, v27.4s, v27.4s
0x51082ee98cc   cec  4e3cd75a       fadd v26.4s, v26.4s, v28.4s
0x51082ee98d0   cf0  6e23e75c       fcmge v28.4s, v26.4s, v3.4s
0x51082ee98d4   cf4  3d80bbfb       str q27, [sp, #736]
0x51082ee98d8   cf8  6ebae4bb       fcmgt v27.4s, v5.4s, v26.4s
0x51082ee98dc   cfc  4e3b1f9b       and v27.16b, v28.16b, v27.16b
0x51082ee98e0   d00  4ea0cb5c       fcmgt v28.4s, v26.4s, #0.0
0x51082ee98e4   d04  4e271f9c       and v28.16b, v28.16b, v7.16b
0x51082ee98e8   d08  4e21db9c       scvtf v28.4s, v28.4s
0x51082ee98ec   d0c  4e3c1f7b       and v27.16b, v27.16b, v28.16b
0x51082ee98f0   d10  3dc037fc       ldr q28, [sp, #208]
0x51082ee98f4   d14  4e3cd77c       fadd v28.4s, v27.4s, v28.4s
0x51082ee98f8   d18  1100418c       add w12, w12, #0x10 (16)
0x51082ee98fc   d1c  3d8037fc       str q28, [sp, #208]
0x51082ee9900   d20  3cec691c       ldr q28, [x8, x12]
0x51082ee9904   d24  3d80b7fa       str q26, [sp, #720]
0x51082ee9908   d28  4ebcd57a       fsub v26.4s, v11.4s, v28.4s
0x51082ee990c   d2c  6e3adf4b       fmul v11.4s, v26.4s, v26.4s
0x51082ee9910   d30  1100436c       add w12, w27, #0x10 (16)
0x51082ee9914   d34  3d80dbfa       str q26, [sp, #864]
0x51082ee9918   d38  3cec691a       ldr q26, [x8, x12]
0x51082ee991c   d3c  3d8087fc       str q28, [sp, #528]
0x51082ee9920   d40  4ebad59c       fsub v28.4s, v12.4s, v26.4s
0x51082ee9924   d44  6e3cdf8c       fmul v12.4s, v28.4s, v28.4s
0x51082ee9928   d48  4e2cd56b       fadd v11.4s, v11.4s, v12.4s
0x51082ee992c   d4c  6e23e56c       fcmge v12.4s, v11.4s, v3.4s
0x51082ee9930   d50  3d80d3fc       str q28, [sp, #832]
0x51082ee9934   d54  6eabe4bc       fcmgt v28.4s, v5.4s, v11.4s
0x51082ee9938   d58  4e3c1d8c       and v12.16b, v12.16b, v28.16b
0x51082ee993c   d5c  4ea0c97c       fcmgt v28.4s, v11.4s, #0.0
0x51082ee9940   d60  4e271f9c       and v28.16b, v28.16b, v7.16b
0x51082ee9944   d64  4e21db9c       scvtf v28.4s, v28.4s
0x51082ee9948   d68  4e3c1d8c       and v12.16b, v12.16b, v28.16b
0x51082ee994c   d6c  3dc047fc       ldr q28, [sp, #272]
0x51082ee9950   d70  4e3cd59c       fadd v28.4s, v12.4s, v28.4s
0x51082ee9954   d74  0b0b002c       add w12, w1, w11
0x51082ee9958   d78  3cec6905       ldr q5, [x8, x12]
0x51082ee995c   d7c  6e37dca5       fmul v5.4s, v5.4s, v23.4s
0x51082ee9960   d80  3d8047fc       str q28, [sp, #272]
0x51082ee9964   d84  3dc04bfc       ldr q28, [sp, #288]
0x51082ee9968   d88  4e3cd4bc       fadd v28.4s, v5.4s, v28.4s
0x51082ee996c   d8c  0b0b01fb       add w27, w15, w11
0x51082ee9970   d90  3cfb6905       ldr q5, [x8, x27]
0x51082ee9974   d94  6e37dca5       fmul v5.4s, v5.4s, v23.4s
0x51082ee9978   d98  4e31d4b1       fadd v17.4s, v5.4s, v17.4s
0x51082ee997c   d9c  6e37dea5       fmul v5.4s, v21.4s, v23.4s
0x51082ee9980   da0  4e30d4b0       fadd v16.4s, v5.4s, v16.4s
0x51082ee9984   da4  6e37de45       fmul v5.4s, v18.4s, v23.4s
0x51082ee9988   da8  4e25d5ce       fadd v14.4s, v14.4s, v5.4s
0x51082ee998c   dac  1100c180       add w0, w12, #0x30 (48)
0x51082ee9990   db0  3ce06905       ldr q5, [x8, x0]
0x51082ee9994   db4  6e36dca5       fmul v5.4s, v5.4s, v22.4s
0x51082ee9998   db8  4e2dd4ad       fadd v13.4s, v5.4s, v13.4s
0x51082ee999c   dbc  1100c360       add w0, w27, #0x30 (48)
0x51082ee99a0   dc0  3ce06905       ldr q5, [x8, x0]
0x51082ee99a4   dc4  6e36dca5       fmul v5.4s, v5.4s, v22.4s
0x51082ee99a8   dc8  4e2ad4aa       fadd v10.4s, v5.4s, v10.4s
0x51082ee99ac   dcc  6e36de65       fmul v5.4s, v19.4s, v22.4s
0x51082ee99b0   dd0  4e29d4a9       fadd v9.4s, v5.4s, v9.4s
0x51082ee99b4   dd4  6e36df05       fmul v5.4s, v24.4s, v22.4s
0x51082ee99b8   dd8  4e25d508       fadd v8.4s, v8.4s, v5.4s
0x51082ee99bc   ddc  11008180       add w0, w12, #0x20 (32)
0x51082ee99c0   de0  3ce06905       ldr q5, [x8, x0]
0x51082ee99c4   de4  6e3bdca5       fmul v5.4s, v5.4s, v27.4s
0x51082ee99c8   de8  4e24d4a4       fadd v4.4s, v5.4s, v4.4s
0x51082ee99cc   dec  11008360       add w0, w27, #0x20 (32)
0x51082ee99d0   df0  3ce06905       ldr q5, [x8, x0]
0x51082ee99d4   df4  6e3bdca5       fmul v5.4s, v5.4s, v27.4s
0x51082ee99d8   df8  4e22d4a2       fadd v2.4s, v5.4s, v2.4s
0x51082ee99dc   dfc  6e3bde85       fmul v5.4s, v20.4s, v27.4s
0x51082ee99e0   e00  4e26d4a6       fadd v6.4s, v5.4s, v6.4s
0x51082ee99e4   e04  6e3bdf25       fmul v5.4s, v25.4s, v27.4s
0x51082ee99e8   e08  4e25d421       fadd v1.4s, v1.4s, v5.4s
0x51082ee99ec   e0c  1100418c       add w12, w12, #0x10 (16)
0x51082ee99f0   e10  3cec6905       ldr q5, [x8, x12]
0x51082ee99f4   e14  6e2cdca5       fmul v5.4s, v5.4s, v12.4s
0x51082ee99f8   e18  4e20d4a0       fadd v0.4s, v5.4s, v0.4s
0x51082ee99fc   e1c  1100436c       add w12, w27, #0x10 (16)
0x51082ee9a00   e20  3cec6905       ldr q5, [x8, x12]
0x51082ee9a04   e24  6e2cdca5       fmul v5.4s, v5.4s, v12.4s
0x51082ee9a08   e28  3dc07ff2       ldr q18, [sp, #496]
0x51082ee9a0c   e2c  4e32d4a5       fadd v5.4s, v5.4s, v18.4s
0x51082ee9a10   e30  6e2cdf52       fmul v18.4s, v26.4s, v12.4s
0x51082ee9a14   e34  3dc083fb       ldr q27, [sp, #512]
0x51082ee9a18   e38  4e3bd65b       fadd v27.4s, v18.4s, v27.4s
0x51082ee9a1c   e3c  3dc087f2       ldr q18, [sp, #528]
0x51082ee9a20   e40  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x51082ee9a24   e44  3dc08bfa       ldr q26, [sp, #544]
0x51082ee9a28   e48  4e2cd75a       fadd v26.4s, v26.4s, v12.4s
0x51082ee9a2c   e4c  3dc08fec       ldr q12, [sp, #560]
0x51082ee9a30   e50  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x51082ee9a34   e54  4e271d8c       and v12.16b, v12.16b, v7.16b
0x51082ee9a38   e58  4e21d98c       scvtf v12.4s, v12.4s
0x51082ee9a3c   e5c  3dc093f2       ldr q18, [sp, #576]
0x51082ee9a40   e60  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x51082ee9a44   e64  3dc097f9       ldr q25, [sp, #592]
0x51082ee9a48   e68  4e32d739       fadd v25.4s, v25.4s, v18.4s
0x51082ee9a4c   e6c  3dc09bf2       ldr q18, [sp, #608]
0x51082ee9a50   e70  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x51082ee9a54   e74  3dc09ff8       ldr q24, [sp, #624]
0x51082ee9a58   e78  4e2cd718       fadd v24.4s, v24.4s, v12.4s
0x51082ee9a5c   e7c  3dc0a3ec       ldr q12, [sp, #640]
0x51082ee9a60   e80  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x51082ee9a64   e84  4e271d8c       and v12.16b, v12.16b, v7.16b
0x51082ee9a68   e88  4e21d98c       scvtf v12.4s, v12.4s
0x51082ee9a6c   e8c  3dc0a7f2       ldr q18, [sp, #656]
0x51082ee9a70   e90  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x51082ee9a74   e94  3dc0abf7       ldr q23, [sp, #672]
0x51082ee9a78   e98  4e32d6f7       fadd v23.4s, v23.4s, v18.4s
0x51082ee9a7c   e9c  3dc0aff2       ldr q18, [sp, #688]
0x51082ee9a80   ea0  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x51082ee9a84   ea4  3dc0b3f6       ldr q22, [sp, #704]
0x51082ee9a88   ea8  4e2cd6d6       fadd v22.4s, v22.4s, v12.4s
0x51082ee9a8c   eac  3dc0b7ec       ldr q12, [sp, #720]
0x51082ee9a90   eb0  6eace46c       fcmgt v12.4s, v3.4s, v12.4s
0x51082ee9a94   eb4  4e271d8c       and v12.16b, v12.16b, v7.16b
0x51082ee9a98   eb8  4e21d98c       scvtf v12.4s, v12.4s
0x51082ee9a9c   ebc  3dc0bbf2       ldr q18, [sp, #736]
0x51082ee9aa0   ec0  6e2cde52       fmul v18.4s, v18.4s, v12.4s
0x51082ee9aa4   ec4  3dc0bff5       ldr q21, [sp, #752]
0x51082ee9aa8   ec8  4e32d6b5       fadd v21.4s, v21.4s, v18.4s
0x51082ee9aac   ecc  3dc0c3f2       ldr q18, [sp, #768]
0x51082ee9ab0   ed0  6e2cde4c       fmul v12.4s, v18.4s, v12.4s
0x51082ee9ab4   ed4  3dc0c7f4       ldr q20, [sp, #784]
0x51082ee9ab8   ed8  4e2cd694       fadd v20.4s, v20.4s, v12.4s
0x51082ee9abc   edc  6eabe46b       fcmgt v11.4s, v3.4s, v11.4s
0x51082ee9ac0   ee0  4e271d6b       and v11.16b, v11.16b, v7.16b
0x51082ee9ac4   ee4  4e21d96b       scvtf v11.4s, v11.4s
0x51082ee9ac8   ee8  3dc0d3ec       ldr q12, [sp, #832]
0x51082ee9acc   eec  6e2bdd8c       fmul v12.4s, v12.4s, v11.4s
0x51082ee9ad0   ef0  3dc0d7f3       ldr q19, [sp, #848]
0x51082ee9ad4   ef4  4e2cd673       fadd v19.4s, v19.4s, v12.4s
0x51082ee9ad8   ef8  3dc0dbec       ldr q12, [sp, #864]
0x51082ee9adc   efc  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x51082ee9ae0   f00  3dc0dff2       ldr q18, [sp, #880]
0x51082ee9ae4   f04  4e2bd652       fadd v18.4s, v18.4s, v11.4s
0x51082ee9ae8   f08  1101016b       add w11, w11, #0x40 (64)
0x51082ee9aec   f0c  51000718       sub w24, w24, #0x1 (1)
0x51082ee9af0   f10  35ffe618       cbnz w24, #-0x340 (addr 0x51082ee97b0)
0x51082ee9af4   f14  4eae1dc7       mov v7.16b, v14.16b
0x51082ee9af8   f18  4eba1f43       mov v3.16b, v26.16b
0x51082ee9afc   f1c  4ea51cab       mov v11.16b, v5.16b
0x51082ee9b00   f20  4eb91f25       mov v5.16b, v25.16b
0x51082ee9b04   f24  4ea81d1a       mov v26.16b, v8.16b
0x51082ee9b08   f28  4ea61cce       mov v14.16b, v6.16b
0x51082ee9b0c   f2c  4ea41c86       mov v6.16b, v4.16b
0x51082ee9b10   f30  4eb81f04       mov v4.16b, v24.16b
0x51082ee9b14   f34  3dc033f9       ldr q25, [sp, #192]
0x51082ee9b18   f38  4ea91d2c       mov v12.16b, v9.16b
0x51082ee9b1c   f3c  4ebc1f88       mov v8.16b, v28.16b
0x51082ee9b20   f40  3dc037fc       ldr q28, [sp, #208]
0x51082ee9b24   f44  4ea21c49       mov v9.16b, v2.16b
0x51082ee9b28   f48  3dc047e2       ldr q2, [sp, #272]
0x51082ee9b2c   f4c  3dc02ff8       ldr q24, [sp, #176]
0x51082ee9b30   f50  3d8033f9       str q25, [sp, #192]
0x51082ee9b34   f54  5e0404f9       mov s25, v7.s[0]
0x51082ee9b38   f58  3d8037fc       str q28, [sp, #208]
0x51082ee9b3c   f5c  5e0c04fc       mov s28, v7.s[1]
0x51082ee9b40   f60  1e3c2b39       fadd s25, s25, s28
0x51082ee9b44   f64  5e1404fc       mov s28, v7.s[2]
0x51082ee9b48   f68  1e3c2b39       fadd s25, s25, s28
0x51082ee9b4c   f6c  5e1c04e7       mov s7, v7.s[3]
0x51082ee9b50   f70  1e272b27       fadd s7, s25, s7
0x51082ee9b54   f74  5e040479       mov s25, v3.s[0]
0x51082ee9b58   f78  1e3928e7       fadd s7, s7, s25
0x51082ee9b5c   f7c  5e0c0479       mov s25, v3.s[1]
0x51082ee9b60   f80  1e3928e7       fadd s7, s7, s25
0x51082ee9b64   f84  5e140479       mov s25, v3.s[2]
0x51082ee9b68   f88  1e3928e7       fadd s7, s7, s25
0x51082ee9b6c   f8c  5e1c0463       mov s3, v3.s[3]
0x51082ee9b70   f90  1e2328e3       fadd s3, s7, s3
0x51082ee9b74   f94  5e040427       mov s7, v1.s[0]
0x51082ee9b78   f98  1e272863       fadd s3, s3, s7
0x51082ee9b7c   f9c  5e0c0427       mov s7, v1.s[1]
0x51082ee9b80   fa0  1e272863       fadd s3, s3, s7
0x51082ee9b84   fa4  5e140427       mov s7, v1.s[2]
0x51082ee9b88   fa8  1e272863       fadd s3, s3, s7
0x51082ee9b8c   fac  5e1c0427       mov s7, v1.s[3]
0x51082ee9b90   fb0  1e272863       fadd s3, s3, s7
0x51082ee9b94   fb4  5e040747       mov s7, v26.s[0]
0x51082ee9b98   fb8  1e272863       fadd s3, s3, s7
0x51082ee9b9c   fbc  5e0c0747       mov s7, v26.s[1]
0x51082ee9ba0   fc0  1e272863       fadd s3, s3, s7
0x51082ee9ba4   fc4  5e140747       mov s7, v26.s[2]
0x51082ee9ba8   fc8  1e272863       fadd s3, s3, s7
0x51082ee9bac   fcc  5e1c0747       mov s7, v26.s[3]
0x51082ee9bb0   fd0  1e272863       fadd s3, s3, s7
0x51082ee9bb4   fd4  4e040463       dup v3.4s, v3.s[0]
0x51082ee9bb8   fd8  5e040607       mov s7, v16.s[0]
0x51082ee9bbc   fdc  5e0c0619       mov s25, v16.s[1]
0x51082ee9bc0   fe0  1e3928e7       fadd s7, s7, s25
0x51082ee9bc4   fe4  5e140619       mov s25, v16.s[2]
0x51082ee9bc8   fe8  1e3928e7       fadd s7, s7, s25
0x51082ee9bcc   fec  5e1c0610       mov s16, v16.s[3]
0x51082ee9bd0   ff0  1e3028e7       fadd s7, s7, s16
0x51082ee9bd4   ff4  5e040770       mov s16, v27.s[0]
0x51082ee9bd8   ff8  1e3028e7       fadd s7, s7, s16
0x51082ee9bdc   ffc  5e0c0770       mov s16, v27.s[1]
0x51082ee9be0  1000  1e3028e7       fadd s7, s7, s16
0x51082ee9be4  1004  5e140770       mov s16, v27.s[2]
0x51082ee9be8  1008  1e3028e7       fadd s7, s7, s16
0x51082ee9bec  100c  5e1c0770       mov s16, v27.s[3]
0x51082ee9bf0  1010  1e3028e7       fadd s7, s7, s16
0x51082ee9bf4  1014  5e0405d0       mov s16, v14.s[0]
0x51082ee9bf8  1018  1e3028e7       fadd s7, s7, s16
0x51082ee9bfc  101c  5e0c05d0       mov s16, v14.s[1]
0x51082ee9c00  1020  1e3028e7       fadd s7, s7, s16
0x51082ee9c04  1024  5e1405d0       mov s16, v14.s[2]
0x51082ee9c08  1028  1e3028e7       fadd s7, s7, s16
0x51082ee9c0c  102c  5e1c05ce       mov s14, v14.s[3]
0x51082ee9c10  1030  1e2e28e7       fadd s7, s7, s14
0x51082ee9c14  1034  5e04058e       mov s14, v12.s[0]
0x51082ee9c18  1038  1e2e28e7       fadd s7, s7, s14
0x51082ee9c1c  103c  5e0c058e       mov s14, v12.s[1]
0x51082ee9c20  1040  1e2e28e7       fadd s7, s7, s14
0x51082ee9c24  1044  5e14058e       mov s14, v12.s[2]
0x51082ee9c28  1048  1e2e28e7       fadd s7, s7, s14
0x51082ee9c2c  104c  5e1c058c       mov s12, v12.s[3]
0x51082ee9c30  1050  1e2c28e7       fadd s7, s7, s12
0x51082ee9c34  1054  6e0c04e3       mov v3.s[1], v7.s[0]
0x51082ee9c38  1058  5e040627       mov s7, v17.s[0]
0x51082ee9c3c  105c  5e0c062c       mov s12, v17.s[1]
0x51082ee9c40  1060  1e2c28e7       fadd s7, s7, s12
0x51082ee9c44  1064  5e14062c       mov s12, v17.s[2]
0x51082ee9c48  1068  1e2c28e7       fadd s7, s7, s12
0x51082ee9c4c  106c  5e1c062c       mov s12, v17.s[3]
0x51082ee9c50  1070  1e2c28e7       fadd s7, s7, s12
0x51082ee9c54  1074  5e04056c       mov s12, v11.s[0]
0x51082ee9c58  1078  1e2c28e7       fadd s7, s7, s12
0x51082ee9c5c  107c  5e0c056c       mov s12, v11.s[1]
0x51082ee9c60  1080  1e2c28e7       fadd s7, s7, s12
0x51082ee9c64  1084  5e14056c       mov s12, v11.s[2]
0x51082ee9c68  1088  1e2c28e7       fadd s7, s7, s12
0x51082ee9c6c  108c  5e1c056b       mov s11, v11.s[3]
0x51082ee9c70  1090  1e2b28e7       fadd s7, s7, s11
0x51082ee9c74  1094  5e04052b       mov s11, v9.s[0]
0x51082ee9c78  1098  1e2b28e7       fadd s7, s7, s11
0x51082ee9c7c  109c  5e0c052b       mov s11, v9.s[1]
0x51082ee9c80  10a0  1e2b28e7       fadd s7, s7, s11
0x51082ee9c84  10a4  5e14052b       mov s11, v9.s[2]
0x51082ee9c88  10a8  1e2b28e7       fadd s7, s7, s11
0x51082ee9c8c  10ac  5e1c0529       mov s9, v9.s[3]
0x51082ee9c90  10b0  1e2928e7       fadd s7, s7, s9
0x51082ee9c94  10b4  5e040549       mov s9, v10.s[0]
0x51082ee9c98  10b8  1e2928e7       fadd s7, s7, s9
0x51082ee9c9c  10bc  5e0c0549       mov s9, v10.s[1]
0x51082ee9ca0  10c0  1e2928e7       fadd s7, s7, s9
0x51082ee9ca4  10c4  5e140549       mov s9, v10.s[2]
0x51082ee9ca8  10c8  1e2928e7       fadd s7, s7, s9
0x51082ee9cac  10cc  5e1c0549       mov s9, v10.s[3]
0x51082ee9cb0  10d0  1e2928e7       fadd s7, s7, s9
0x51082ee9cb4  10d4  6e1404e3       mov v3.s[2], v7.s[0]
0x51082ee9cb8  10d8  5e040507       mov s7, v8.s[0]
0x51082ee9cbc  10dc  5e0c0509       mov s9, v8.s[1]
0x51082ee9cc0  10e0  1e2928e7       fadd s7, s7, s9
0x51082ee9cc4  10e4  5e140509       mov s9, v8.s[2]
0x51082ee9cc8  10e8  1e2928e7       fadd s7, s7, s9
0x51082ee9ccc  10ec  5e1c0508       mov s8, v8.s[3]
0x51082ee9cd0  10f0  1e2828e7       fadd s7, s7, s8
0x51082ee9cd4  10f4  5e040408       mov s8, v0.s[0]
0x51082ee9cd8  10f8  1e2828e7       fadd s7, s7, s8
0x51082ee9cdc  10fc  5e0c0408       mov s8, v0.s[1]
0x51082ee9ce0  1100  1e2828e7       fadd s7, s7, s8
0x51082ee9ce4  1104  5e140408       mov s8, v0.s[2]
0x51082ee9ce8  1108  1e2828e7       fadd s7, s7, s8
0x51082ee9cec  110c  5e1c0408       mov s8, v0.s[3]
0x51082ee9cf0  1110  1e2828e7       fadd s7, s7, s8
0x51082ee9cf4  1114  5e0404c8       mov s8, v6.s[0]
0x51082ee9cf8  1118  1e2828e7       fadd s7, s7, s8
0x51082ee9cfc  111c  5e0c04c8       mov s8, v6.s[1]
0x51082ee9d00  1120  1e2828e7       fadd s7, s7, s8
0x51082ee9d04  1124  5e1404c8       mov s8, v6.s[2]
0x51082ee9d08  1128  1e2828e7       fadd s7, s7, s8
0x51082ee9d0c  112c  5e1c04c6       mov s6, v6.s[3]
0x51082ee9d10  1130  1e2628e6       fadd s6, s7, s6
0x51082ee9d14  1134  5e0405a7       mov s7, v13.s[0]
0x51082ee9d18  1138  1e2728c6       fadd s6, s6, s7
0x51082ee9d1c  113c  5e0c05a7       mov s7, v13.s[1]
0x51082ee9d20  1140  1e2728c6       fadd s6, s6, s7
0x51082ee9d24  1144  5e1405a7       mov s7, v13.s[2]
0x51082ee9d28  1148  1e2728c6       fadd s6, s6, s7
0x51082ee9d2c  114c  5e1c05a7       mov s7, v13.s[3]
0x51082ee9d30  1150  1e2728c6       fadd s6, s6, s7
0x51082ee9d34  1154  6e1c04c3       mov v3.s[3], v6.s[0]
0x51082ee9d38  1158  3dc0e7f1       ldr q17, [sp, #912]
0x51082ee9d3c  115c  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x51082ee9d40  1160  5e0404a3       mov s3, v5.s[0]
0x51082ee9d44  1164  5e0c04a6       mov s6, v5.s[1]
0x51082ee9d48  1168  1e262863       fadd s3, s3, s6
0x51082ee9d4c  116c  5e1404a6       mov s6, v5.s[2]
0x51082ee9d50  1170  1e262863       fadd s3, s3, s6
0x51082ee9d54  1174  5e1c04a5       mov s5, v5.s[3]
0x51082ee9d58  1178  1e252863       fadd s3, s3, s5
0x51082ee9d5c  117c  5e040665       mov s5, v19.s[0]
0x51082ee9d60  1180  1e252863       fadd s3, s3, s5
0x51082ee9d64  1184  5e0c0665       mov s5, v19.s[1]
0x51082ee9d68  1188  1e252863       fadd s3, s3, s5
0x51082ee9d6c  118c  5e140665       mov s5, v19.s[2]
0x51082ee9d70  1190  1e252863       fadd s3, s3, s5
0x51082ee9d74  1194  5e1c0665       mov s5, v19.s[3]
0x51082ee9d78  1198  1e252863       fadd s3, s3, s5
0x51082ee9d7c  119c  5e0406a5       mov s5, v21.s[0]
0x51082ee9d80  11a0  1e252863       fadd s3, s3, s5
0x51082ee9d84  11a4  5e0c06a5       mov s5, v21.s[1]
0x51082ee9d88  11a8  1e252863       fadd s3, s3, s5
0x51082ee9d8c  11ac  5e1406a5       mov s5, v21.s[2]
0x51082ee9d90  11b0  1e252863       fadd s3, s3, s5
0x51082ee9d94  11b4  5e1c06a5       mov s5, v21.s[3]
0x51082ee9d98  11b8  1e252863       fadd s3, s3, s5
0x51082ee9d9c  11bc  5e0406e5       mov s5, v23.s[0]
0x51082ee9da0  11c0  1e252863       fadd s3, s3, s5
0x51082ee9da4  11c4  5e0c06e5       mov s5, v23.s[1]
0x51082ee9da8  11c8  1e252863       fadd s3, s3, s5
0x51082ee9dac  11cc  5e1406e5       mov s5, v23.s[2]
0x51082ee9db0  11d0  1e252863       fadd s3, s3, s5
0x51082ee9db4  11d4  5e1c06e5       mov s5, v23.s[3]
0x51082ee9db8  11d8  1e252863       fadd s3, s3, s5
0x51082ee9dbc  11dc  fd41d7f0       ldr d16, [sp, #936]
0x51082ee9dc0  11e0  1e232a10       fadd s16, s16, s3
0x51082ee9dc4  11e4  5e040483       mov s3, v4.s[0]
0x51082ee9dc8  11e8  5e0c0485       mov s5, v4.s[1]
0x51082ee9dcc  11ec  1e252863       fadd s3, s3, s5
0x51082ee9dd0  11f0  5e140485       mov s5, v4.s[2]
0x51082ee9dd4  11f4  1e252863       fadd s3, s3, s5
0x51082ee9dd8  11f8  5e1c0484       mov s4, v4.s[3]
0x51082ee9ddc  11fc  1e242863       fadd s3, s3, s4
0x51082ee9de0  1200  5e040644       mov s4, v18.s[0]
0x51082ee9de4  1204  1e242863       fadd s3, s3, s4
0x51082ee9de8  1208  5e0c0644       mov s4, v18.s[1]
0x51082ee9dec  120c  1e242863       fadd s3, s3, s4
0x51082ee9df0  1210  5e140644       mov s4, v18.s[2]
0x51082ee9df4  1214  1e242863       fadd s3, s3, s4
0x51082ee9df8  1218  5e1c0644       mov s4, v18.s[3]
0x51082ee9dfc  121c  1e242863       fadd s3, s3, s4
0x51082ee9e00  1220  5e040684       mov s4, v20.s[0]
0x51082ee9e04  1224  1e242863       fadd s3, s3, s4
0x51082ee9e08  1228  5e0c0684       mov s4, v20.s[1]
0x51082ee9e0c  122c  1e242863       fadd s3, s3, s4
0x51082ee9e10  1230  5e140684       mov s4, v20.s[2]
0x51082ee9e14  1234  1e242863       fadd s3, s3, s4
0x51082ee9e18  1238  5e1c0684       mov s4, v20.s[3]
0x51082ee9e1c  123c  1e242863       fadd s3, s3, s4
0x51082ee9e20  1240  5e0406c4       mov s4, v22.s[0]
0x51082ee9e24  1244  1e242863       fadd s3, s3, s4
0x51082ee9e28  1248  5e0c06c4       mov s4, v22.s[1]
0x51082ee9e2c  124c  1e242863       fadd s3, s3, s4
0x51082ee9e30  1250  5e1406c4       mov s4, v22.s[2]
0x51082ee9e34  1254  1e242863       fadd s3, s3, s4
0x51082ee9e38  1258  5e1c06c4       mov s4, v22.s[3]
0x51082ee9e3c  125c  1e242863       fadd s3, s3, s4
0x51082ee9e40  1260  fd41dbee       ldr d14, [sp, #944]
0x51082ee9e44  1264  1e2329ce       fadd s14, s14, s3
0x51082ee9e48  1268  5e040703       mov s3, v24.s[0]
0x51082ee9e4c  126c  5e0c0704       mov s4, v24.s[1]
0x51082ee9e50  1270  1e242863       fadd s3, s3, s4
0x51082ee9e54  1274  5e140704       mov s4, v24.s[2]
0x51082ee9e58  1278  1e242863       fadd s3, s3, s4
0x51082ee9e5c  127c  5e1c0704       mov s4, v24.s[3]
0x51082ee9e60  1280  1e242863       fadd s3, s3, s4
0x51082ee9e64  1284  5e040444       mov s4, v2.s[0]
0x51082ee9e68  1288  1e242863       fadd s3, s3, s4
0x51082ee9e6c  128c  5e0c0444       mov s4, v2.s[1]
0x51082ee9e70  1290  1e242863       fadd s3, s3, s4
0x51082ee9e74  1294  5e140444       mov s4, v2.s[2]
0x51082ee9e78  1298  1e242863       fadd s3, s3, s4
0x51082ee9e7c  129c  5e1c0442       mov s2, v2.s[3]
0x51082ee9e80  12a0  1e222862       fadd s2, s3, s2
0x51082ee9e84  12a4  3dc037fc       ldr q28, [sp, #208]
0x51082ee9e88  12a8  5e040783       mov s3, v28.s[0]
0x51082ee9e8c  12ac  1e232842       fadd s2, s2, s3
0x51082ee9e90  12b0  5e0c0783       mov s3, v28.s[1]
0x51082ee9e94  12b4  1e232842       fadd s2, s2, s3
0x51082ee9e98  12b8  5e140783       mov s3, v28.s[2]
0x51082ee9e9c  12bc  1e232842       fadd s2, s2, s3
0x51082ee9ea0  12c0  5e1c0783       mov s3, v28.s[3]
0x51082ee9ea4  12c4  1e232842       fadd s2, s2, s3
0x51082ee9ea8  12c8  3dc033f9       ldr q25, [sp, #192]
0x51082ee9eac  12cc  5e040723       mov s3, v25.s[0]
0x51082ee9eb0  12d0  1e232842       fadd s2, s2, s3
0x51082ee9eb4  12d4  5e0c0723       mov s3, v25.s[1]
0x51082ee9eb8  12d8  1e232842       fadd s2, s2, s3
0x51082ee9ebc  12dc  5e140723       mov s3, v25.s[2]
0x51082ee9ec0  12e0  1e232842       fadd s2, s2, s3
0x51082ee9ec4  12e4  5e1c0723       mov s3, v25.s[3]
0x51082ee9ec8  12e8  1e232842       fadd s2, s2, s3
0x51082ee9ecc  12ec  fd41dfed       ldr d13, [sp, #952]
0x51082ee9ed0  12f0  1e2229ad       fadd s13, s13, s2
0x51082ee9ed4  12f4  12000ccb       and w11, w6, #0xf
0x51082ee9ed8  12f8  12000dcc       and w12, w14, #0xf
0x51082ee9edc  12fc  6b0c02df       cmp w22, w12
0x51082ee9ee0  1300  1a8c32cd       csel w13, w22, w12, lo
0x51082ee9ee4  1304  6b0d033f       cmp w25, w13
0x51082ee9ee8  1308  1a8d332c       csel w12, w25, w13, lo
0x51082ee9eec  130c  6b0c017f       cmp w11, w12
0x51082ee9ef0  1310  1a8c316d       csel w13, w11, w12, lo
0x51082ee9ef4  1314  34000d6d       cbz w13, #+0x1ac (addr 0x51082eea0a0)
0x51082ee9ef8  1318  121c61cb       and w11, w14, #0x1ffffff0
0x51082ee9efc  131c  0b0b0929       add w9, w9, w11, lsl #2
0x51082ee9f00  1320  121c60c6       and w6, w6, #0x1ffffff0
0x51082ee9f04  1324  0b060821       add w1, w1, w6, lsl #2
0x51082ee9f08  1328  fd4203e9       ldr d9, [sp, #1024]
0x51082ee9f0c  132c  fd4207ea       ldr d10, [sp, #1032]
0x51082ee9f10  1330  fd420be2       ldr d2, [sp, #1040]
0x51082ee9f14  1334  fd420fe4       ldr d4, [sp, #1048]
0x51082ee9f18  1338  1e2e1008       fmov s8, #0x70 (1.0000)
0x51082ee9f1c  133c  14000002       b #+0x8 (addr 0x51082ee9f24)
0x51082ee9f20  1340  aa0603e9       mov x9, x6
0x51082ee9f24  1344  bc696903       ldr s3, [x8, x9]
0x51082ee9f28  1348  1e233925       fsub s5, s9, s3
0x51082ee9f2c  134c  1e2508a6       fmul s6, s5, s5
0x51082ee9f30  1350  2a1703e6       mov w6, w23
0x51082ee9f34  1354  bc666907       ldr s7, [x8, x6]
0x51082ee9f38  1358  1e27394b       fsub s11, s10, s7
0x51082ee9f3c  135c  1e2b096c       fmul s12, s11, s11
0x51082ee9f40  1360  1e2c28c6       fadd s6, s6, s12
0x51082ee9f44  1364  1e2220c0       fcmp s6, s2
0x51082ee9f48  1368  540001e3       b.lo #+0x3c (addr 0x51082ee9f84)
0x51082ee9f4c  136c  1e2420c0       fcmp s6, s4
0x51082ee9f50  1370  540001e2       b.hs #+0x3c (addr 0x51082ee9f8c)
0x51082ee9f54  1374  1e2020c8       fcmp s6, #0.0
0x51082ee9f58  1378  540001ad       b.le #+0x34 (addr 0x51082ee9f8c)
0x51082ee9f5c  137c  1e2829ad       fadd s13, s13, s8
0x51082ee9f60  1380  4e040463       dup v3.4s, v3.s[0]
0x51082ee9f64  1384  6e0c04e3       mov v3.s[1], v7.s[0]
0x51082ee9f68  1388  2a1303e6       mov w6, w19
0x51082ee9f6c  138c  bc666905       ldr s5, [x8, x6]
0x51082ee9f70  1390  6e1404a3       mov v3.s[2], v5.s[0]
0x51082ee9f74  1394  bc616905       ldr s5, [x8, x1]
0x51082ee9f78  1398  6e1c04a3       mov v3.s[3], v5.s[0]
0x51082ee9f7c  139c  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x51082ee9f80  13a0  14000003       b #+0xc (addr 0x51082ee9f8c)
0x51082ee9f84  13a4  1e2b2a10       fadd s16, s16, s11
0x51082ee9f88  13a8  1e2529ce       fadd s14, s14, s5
0x51082ee9f8c  13ac  11001126       add w6, w9, #0x4 (4)
0x51082ee9f90  13b0  110012e9       add w9, w23, #0x4 (4)
0x51082ee9f94  13b4  1100126b       add w11, w19, #0x4 (4)
0x51082ee9f98  13b8  11001021       add w1, w1, #0x4 (4)
0x51082ee9f9c  13bc  510005ac       sub w12, w13, #0x1 (1)
0x51082ee9fa0  13c0  3400080c       cbz w12, #+0x100 (addr 0x51082eea0a0)
0x51082ee9fa4  13c4  bc666903       ldr s3, [x8, x6]
0x51082ee9fa8  13c8  1e233925       fsub s5, s9, s3
0x51082ee9fac  13cc  1e2508a6       fmul s6, s5, s5
0x51082ee9fb0  13d0  bc696907       ldr s7, [x8, x9]
0x51082ee9fb4  13d4  1e27394b       fsub s11, s10, s7
0x51082ee9fb8  13d8  1e2b096c       fmul s12, s11, s11
0x51082ee9fbc  13dc  1e2c28c6       fadd s6, s6, s12
0x51082ee9fc0  13e0  1e2220c0       fcmp s6, s2
0x51082ee9fc4  13e4  540001c3       b.lo #+0x38 (addr 0x51082ee9ffc)
0x51082ee9fc8  13e8  1e2420c0       fcmp s6, s4
0x51082ee9fcc  13ec  540001c2       b.hs #+0x38 (addr 0x51082eea004)
0x51082ee9fd0  13f0  1e2020c8       fcmp s6, #0.0
0x51082ee9fd4  13f4  5400018d       b.le #+0x30 (addr 0x51082eea004)
0x51082ee9fd8  13f8  1e2829ad       fadd s13, s13, s8
0x51082ee9fdc  13fc  4e040463       dup v3.4s, v3.s[0]
0x51082ee9fe0  1400  6e0c04e3       mov v3.s[1], v7.s[0]
0x51082ee9fe4  1404  bc6b6905       ldr s5, [x8, x11]
0x51082ee9fe8  1408  6e1404a3       mov v3.s[2], v5.s[0]
0x51082ee9fec  140c  bc616905       ldr s5, [x8, x1]
0x51082ee9ff0  1410  6e1c04a3       mov v3.s[3], v5.s[0]
0x51082ee9ff4  1414  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x51082ee9ff8  1418  14000003       b #+0xc (addr 0x51082eea004)
0x51082ee9ffc  141c  1e2b2a10       fadd s16, s16, s11
0x51082eea000  1420  1e2529ce       fadd s14, s14, s5
0x51082eea004  1424  110010c6       add w6, w6, #0x4 (4)
0x51082eea008  1428  11001129       add w9, w9, #0x4 (4)
0x51082eea00c  142c  1100116b       add w11, w11, #0x4 (4)
0x51082eea010  1430  11001021       add w1, w1, #0x4 (4)
0x51082eea014  1434  5100058c       sub w12, w12, #0x1 (1)
0x51082eea018  1438  3400044c       cbz w12, #+0x88 (addr 0x51082eea0a0)
0x51082eea01c  143c  f852034d       ldur x13, [x26, #-224]
0x51082eea020  1440  eb2d63ff       cmp sp, x13
0x51082eea024  1444  54002c49       b.ls #+0x588 (addr 0x51082eea5ac)
0x51082eea028  1448  bc666903       ldr s3, [x8, x6]
0x51082eea02c  144c  1e233925       fsub s5, s9, s3
0x51082eea030  1450  1e2508a6       fmul s6, s5, s5
0x51082eea034  1454  bc696907       ldr s7, [x8, x9]
0x51082eea038  1458  1e27394b       fsub s11, s10, s7
0x51082eea03c  145c  1e2b096c       fmul s12, s11, s11
0x51082eea040  1460  1e2c28c6       fadd s6, s6, s12
0x51082eea044  1464  1e2220c0       fcmp s6, s2
0x51082eea048  1468  540001c3       b.lo #+0x38 (addr 0x51082eea080)
0x51082eea04c  146c  1e2420c0       fcmp s6, s4
0x51082eea050  1470  540001c2       b.hs #+0x38 (addr 0x51082eea088)
0x51082eea054  1474  1e2020c8       fcmp s6, #0.0
0x51082eea058  1478  5400018d       b.le #+0x30 (addr 0x51082eea088)
0x51082eea05c  147c  1e2829ad       fadd s13, s13, s8
0x51082eea060  1480  4e040463       dup v3.4s, v3.s[0]
0x51082eea064  1484  6e0c04e3       mov v3.s[1], v7.s[0]
0x51082eea068  1488  bc6b6905       ldr s5, [x8, x11]
0x51082eea06c  148c  6e1404a3       mov v3.s[2], v5.s[0]
0x51082eea070  1490  bc616905       ldr s5, [x8, x1]
0x51082eea074  1494  6e1c04a3       mov v3.s[3], v5.s[0]
0x51082eea078  1498  4e23d631       fadd v17.4s, v17.4s, v3.4s
0x51082eea07c  149c  14000003       b #+0xc (addr 0x51082eea088)
0x51082eea080  14a0  1e2b2a10       fadd s16, s16, s11
0x51082eea084  14a4  1e2529ce       fadd s14, s14, s5
0x51082eea088  14a8  110010c6       add w6, w6, #0x4 (4)
0x51082eea08c  14ac  11001137       add w23, w9, #0x4 (4)
0x51082eea090  14b0  11001173       add w19, w11, #0x4 (4)
0x51082eea094  14b4  11001021       add w1, w1, #0x4 (4)
0x51082eea098  14b8  5100058d       sub w13, w12, #0x1 (1)
0x51082eea09c  14bc  35fff42d       cbnz w13, #-0x17c (addr 0x51082ee9f20)
0x51082eea0a0  14c0  11000681       add w1, w20, #0x1 (1)
0x51082eea0a4  14c4  6b15029f       cmp w20, w21
0x51082eea0a8  14c8  54ffa461       b.ne #-0xb74 (addr 0x51082ee9534)
0x51082eea0ac  14cc  f9422fee       ldr x14, [sp, #1112]
0x51082eea0b0  14d0  bc2e6910       str s16, [x8, x14]
0x51082eea0b4  14d4  f9426bec       ldr x12, [sp, #1232]
0x51082eea0b8  14d8  91009181       add x1, x12, #0x24 (36)
0x51082eea0bc  14dc  bc21690e       str s14, [x8, x1]
0x51082eea0c0  14e0  f94233eb       ldr x11, [sp, #1120]
0x51082eea0c4  14e4  bc2b690d       str s13, [x8, x11]
0x51082eea0c8  14e8  f94237ed       ldr x13, [sp, #1128]
0x51082eea0cc  14ec  3cad6911       str q17, [x8, x13]
0x51082eea0d0  14f0  1100c180       add w0, w12, #0x30 (48)
0x51082eea0d4  14f4  11010183       add w3, w12, #0x40 (64)
0x51082eea0d8  14f8  11004185       add w5, w12, #0x10 (16)
0x51082eea0dc  14fc  f94273e7       ldr x7, [sp, #1248]
0x51082eea0e0  1500  aa0c03e4       mov x4, x12
0x51082eea0e4  1504  f94243e2       ldr x2, [sp, #1152]
0x51082eea0e8  1508  fd423fe0       ldr d0, [sp, #1144]
0x51082eea0ec  150c  fd423be1       ldr d1, [sp, #1136]
0x51082eea0f0  1510  97fc0d6c       bl #-0xfca50 (addr 0x51082ded6a0)
0x51082eea0f4  1514  f94263f4       ldr x20, [sp, #1216]
0x51082eea0f8  1518  f94247e1       ldr x1, [sp, #1160]
0x51082eea0fc  151c  6b14003f       cmp w1, w20
0x51082eea100  1520  54000509       b.ls #+0xa0 (addr 0x51082eea1a0)
0x51082eea104  1524  f94257e6       ldr x6, [sp, #1192]
0x51082eea108  1528  f9424be8       ldr x8, [sp, #1168]
0x51082eea10c  152c  0b060109       add w9, w8, w6
0x51082eea110  1530  f9426bea       ldr x10, [sp, #1232]
0x51082eea114  1534  9100c14b       add x11, x10, #0x30 (48)
0x51082eea118  1538  f9425fec       ldr x12, [sp, #1208]
0x51082eea11c  153c  bc6b6982       ldr s2, [x12, x11]
0x51082eea120  1540  bc296982       str s2, [x12, x9]
0x51082eea124  1544  f9424fe9       ldr x9, [sp, #1176]
0x51082eea128  1548  0b06012b       add w11, w9, w6
0x51082eea12c  154c  9100d14d       add x13, x10, #0x34 (52)
0x51082eea130  1550  bc6d6982       ldr s2, [x12, x13]
0x51082eea134  1554  bc2b6982       str s2, [x12, x11]
0x51082eea138  1558  f94253eb       ldr x11, [sp, #1184]
0x51082eea13c  155c  0b06016d       add w13, w11, w6
0x51082eea140  1560  9100e14e       add x14, x10, #0x38 (56)
0x51082eea144  1564  bc6e6982       ldr s2, [x12, x14]
0x51082eea148  1568  bc2d6982       str s2, [x12, x13]
0x51082eea14c  156c  f9425bed       ldr x13, [sp, #1200]
0x51082eea150  1570  0b0601a6       add w6, w13, w6
0x51082eea154  1574  9100f14e       add x14, x10, #0x3c (60)
0x51082eea158  1578  bc6e6982       ldr s2, [x12, x14]
0x51082eea15c  157c  bc266982       str s2, [x12, x6]
0x51082eea160  1580  aa0c03e8       mov x8, x12
0x51082eea164  1584  3dc0cfe7       ldr q7, [sp, #816]
0x51082eea168  1588  3dc0cbe3       ldr q3, [sp, #800]
0x51082eea16c  158c  3dc043e5       ldr q5, [sp, #256]
0x51082eea170  1590  d280001c       movz x28, #0x0
0x51082eea174  1594  f94017e1       ldr x1, [sp, #40]
0x51082eea178  1598  f94013fb       ldr cp, [sp, #32]
0x51082eea17c  159c  f9400ff3       ldr x19, [sp, #24]
0x51082eea180  15a0  f9400bf9       ldr x25, [sp, #16]
0x51082eea184  15a4  f94007ee       ldr x14, [sp, #8]
0x51082eea188  15a8  f941eff8       ldr x24, [sp, #984]
0x51082eea18c  15ac  f941f3ed       ldr x13, [sp, #992]
0x51082eea190  15b0  f941f7f6       ldr x22, [sp, #1000]
0x51082eea194  15b4  f941fbf7       ldr x23, [sp, #1008]
0x51082eea198  15b8  f941fff5       ldr x21, [sp, #1016]
0x51082eea19c  15bc  14000010       b #+0x40 (addr 0x51082eea1dc)
0x51082eea1a0  15c0  f9425fe8       ldr x8, [sp, #1208]
0x51082eea1a4  15c4  3dc0cfe7       ldr q7, [sp, #816]
0x51082eea1a8  15c8  3dc0cbe3       ldr q3, [sp, #800]
0x51082eea1ac  15cc  3dc043e5       ldr q5, [sp, #256]
0x51082eea1b0  15d0  d280001c       movz x28, #0x0
0x51082eea1b4  15d4  f94017e1       ldr x1, [sp, #40]
0x51082eea1b8  15d8  f94013fb       ldr cp, [sp, #32]
0x51082eea1bc  15dc  f9400ff3       ldr x19, [sp, #24]
0x51082eea1c0  15e0  f9400bf9       ldr x25, [sp, #16]
0x51082eea1c4  15e4  f94007ee       ldr x14, [sp, #8]
0x51082eea1c8  15e8  f941eff8       ldr x24, [sp, #984]
0x51082eea1cc  15ec  f941f3ed       ldr x13, [sp, #992]
0x51082eea1d0  15f0  f941f7f6       ldr x22, [sp, #1000]
0x51082eea1d4  15f4  f941fbf7       ldr x23, [sp, #1008]
0x51082eea1d8  15f8  f941fff5       ldr x21, [sp, #1016]
0x51082eea1dc  15fc  11000694       add w20, w20, #0x1 (1)
0x51082eea1e0  1600  f94267e6       ldr x6, [sp, #1224]
0x51082eea1e4  1604  6b06029f       cmp w20, w6
0x51082eea1e8  1608  54ff8a21       b.ne #-0xebc (addr 0x51082ee932c)
0x51082eea1ec  160c  f9426be1       ldr x1, [sp, #1232]
0x51082eea1f0  1610  11014021       add w1, w1, #0x50 (80)
0x51082eea1f4  1614  f9426fe6       ldr x6, [sp, #1240]
0x51082eea1f8  1618  b90000c1       str w1, [x6]
0x51082eea1fc  161c  17fffc20       b #-0xf80 (addr 0x51082ee927c)
0x51082eea200  1620  97fc0e74       bl #-0xfc630 (addr 0x51082dedbd0)
0x51082eea204  1624  f9425fe1       ldr x1, [sp, #1208]
0x51082eea208  1628  f94273e7       ldr x7, [sp, #1248]
0x51082eea20c  162c  f94267e0       ldr x0, [sp, #1224]
0x51082eea210  1630  17fffa7f       b #-0x1604 (addr 0x51082ee8c0c)
0x51082eea214  1634  1e6720e0       fcmp d7, d7
0x51082eea218  1638  54000080       b.eq #+0x10 (addr 0x51082eea228)
0x51082eea21c  163c  d280000b       movz x11, #0x0
0x51082eea220  1640  aa0b03ea       mov x10, x11
0x51082eea224  1644  17fffaaf       b #-0x1544 (addr 0x51082ee8ce0)
0x51082eea228  1648  1e2020c8       fcmp s6, #0.0
0x51082eea22c  164c  54000063       b.lo #+0xc (addr 0x51082eea238)
0x51082eea230  1650  9280000a       movn x10, #0x0
0x51082eea234  1654  17fffaab       b #-0x1554 (addr 0x51082ee8ce0)
0x51082eea238  1658  d280000a       movz x10, #0x0
0x51082eea23c  165c  17fffaa9       b #-0x155c (addr 0x51082ee8ce0)
0x51082eea240  1660  1e682100       fcmp d8, d8
0x51082eea244  1664  54000060       b.eq #+0xc (addr 0x51082eea250)
0x51082eea248  1668  d280000a       movz x10, #0x0
0x51082eea24c  166c  17fffaad       b #-0x154c (addr 0x51082ee8d00)
0x51082eea250  1670  1e2020e8       fcmp s7, #0.0
0x51082eea254  1674  54ffffa3       b.lo #-0xc (addr 0x51082eea248)
0x51082eea258  1678  9280000a       movn x10, #0x0
0x51082eea25c  167c  17fffaa9       b #-0x155c (addr 0x51082ee8d00)
0x51082eea260  1680  fd022fe3       str d3, [sp, #1112]
0x51082eea264  1684  f90247f4       str x20, [sp, #1160]
0x51082eea268  1688  f90253f3       str x19, [sp, #1184]
0x51082eea26c  168c  97fc0e59       bl #-0xfc69c (addr 0x51082dedbd0)
0x51082eea270  1690  f9425fe8       ldr x8, [sp, #1208]
0x51082eea274  1694  f94017e1       ldr x1, [sp, #40]
0x51082eea278  1698  f941efee       ldr x14, [sp, #984]
0x51082eea27c  169c  f941ffec       ldr x12, [sp, #1016]
0x51082eea280  16a0  f9421fe6       ldr x6, [sp, #1080]
0x51082eea284  16a4  f94227eb       ldr x11, [sp, #1096]
0x51082eea288  16a8  f94267e9       ldr x9, [sp, #1224]
0x51082eea28c  16ac  f94253f3       ldr x19, [sp, #1184]
0x51082eea290  16b0  fd422fe3       ldr d3, [sp, #1112]
0x51082eea294  16b4  f9424fe0       ldr x0, [sp, #1176]
0x51082eea298  16b8  f94257ef       ldr x15, [sp, #1192]
0x51082eea29c  16bc  f9425bed       ldr x13, [sp, #1200]
0x51082eea2a0  16c0  f94247f4       ldr x20, [sp, #1160]
0x51082eea2a4  16c4  17fffadb       b #-0x1494 (addr 0x51082ee8e10)
0x51082eea2a8  16c8  fd022fe3       str d3, [sp, #1112]
0x51082eea2ac  16cc  f90253eb       str x11, [sp, #1184]
0x51082eea2b0  16d0  f90257e2       str x2, [sp, #1192]
0x51082eea2b4  16d4  97fc0e47       bl #-0xfc6e4 (addr 0x51082dedbd0)
0x51082eea2b8  16d8  f9425fe8       ldr x8, [sp, #1208]
0x51082eea2bc  16dc  f94017e1       ldr x1, [sp, #40]
0x51082eea2c0  16e0  f94007f3       ldr x19, [sp, #8]
0x51082eea2c4  16e4  f941fbed       ldr x13, [sp, #1008]
0x51082eea2c8  16e8  f9421fe6       ldr x6, [sp, #1080]
0x51082eea2cc  16ec  f9425bea       ldr x10, [sp, #1200]
0x51082eea2d0  16f0  f94227f5       ldr x21, [sp, #1096]
0x51082eea2d4  16f4  f94267e9       ldr x9, [sp, #1224]
0x51082eea2d8  16f8  f94257e2       ldr x2, [sp, #1192]
0x51082eea2dc  16fc  fd422fe3       ldr d3, [sp, #1112]
0x51082eea2e0  1700  f9424be0       ldr x0, [sp, #1168]
0x51082eea2e4  1704  f9424ff4       ldr x20, [sp, #1176]
0x51082eea2e8  1708  f94247ef       ldr x15, [sp, #1160]
0x51082eea2ec  170c  f94253eb       ldr x11, [sp, #1184]
0x51082eea2f0  1710  17fffb0d       b #-0x13cc (addr 0x51082ee8f24)
0x51082eea2f4  1714  fd022fe3       str d3, [sp, #1112]
0x51082eea2f8  1718  f9024ff5       str x21, [sp, #1176]
0x51082eea2fc  171c  f90253e2       str x2, [sp, #1184]
0x51082eea300  1720  97fc0e34       bl #-0xfc730 (addr 0x51082dedbd0)
0x51082eea304  1724  f9425fe8       ldr x8, [sp, #1208]
0x51082eea308  1728  f94017e1       ldr x1, [sp, #40]
0x51082eea30c  172c  f9400bef       ldr x15, [sp, #16]
0x51082eea310  1730  f941f7ec       ldr x12, [sp, #1000]
0x51082eea314  1734  f9425bea       ldr x10, [sp, #1200]
0x51082eea318  1738  f94257eb       ldr x11, [sp, #1192]
0x51082eea31c  173c  f94227f6       ldr x22, [sp, #1096]
0x51082eea320  1740  f94267e9       ldr x9, [sp, #1224]
0x51082eea324  1744  f94253e2       ldr x2, [sp, #1184]
0x51082eea328  1748  fd422fe3       ldr d3, [sp, #1112]
0x51082eea32c  174c  f94233e0       ldr x0, [sp, #1120]
0x51082eea330  1750  f94247f4       ldr x20, [sp, #1160]
0x51082eea334  1754  f9424bee       ldr x14, [sp, #1168]
0x51082eea338  1758  f9424ff5       ldr x21, [sp, #1176]
0x51082eea33c  175c  17fffb3b       b #-0x1314 (addr 0x51082ee9028)
0x51082eea340  1760  fd022fe3       str d3, [sp, #1112]
0x51082eea344  1764  f9022be9       str x9, [sp, #1104]
0x51082eea348  1768  f9024fe2       str x2, [sp, #1176]
0x51082eea34c  176c  97fc0e21       bl #-0xfc77c (addr 0x51082dedbd0)
0x51082eea350  1770  f9425fe8       ldr x8, [sp, #1208]
0x51082eea354  1774  f94017e1       ldr x1, [sp, #40]
0x51082eea358  1778  f9400ff3       ldr x19, [sp, #24]
0x51082eea35c  177c  f941f3ed       ldr x13, [sp, #992]
0x51082eea360  1780  f94257eb       ldr x11, [sp, #1192]
0x51082eea364  1784  f94253e6       ldr x6, [sp, #1184]
0x51082eea368  1788  f9424fe2       ldr x2, [sp, #1176]
0x51082eea36c  178c  fd422fe3       ldr d3, [sp, #1112]
0x51082eea370  1790  f94267e0       ldr x0, [sp, #1224]
0x51082eea374  1794  f94227f5       ldr x21, [sp, #1096]
0x51082eea378  1798  f9424bf4       ldr x20, [sp, #1168]
0x51082eea37c  179c  f94237ee       ldr x14, [sp, #1128]
0x51082eea380  17a0  f9422be9       ldr x9, [sp, #1104]
0x51082eea384  17a4  17fffb6e       b #-0x1248 (addr 0x51082ee913c)
0x51082eea388  17a8  f90263f4       str x20, [sp, #1216]
0x51082eea38c  17ac  97fc0e11       bl #-0xfc7bc (addr 0x51082dedbd0)
0x51082eea390  17b0  f94263f4       ldr x20, [sp, #1216]
0x51082eea394  17b4  f9425fe8       ldr x8, [sp, #1208]
0x51082eea398  17b8  3dc0cfe7       ldr q7, [sp, #816]
0x51082eea39c  17bc  3dc0cbe3       ldr q3, [sp, #800]
0x51082eea3a0  17c0  3dc043e5       ldr q5, [sp, #256]
0x51082eea3a4  17c4  d280001c       movz x28, #0x0
0x51082eea3a8  17c8  f94017e1       ldr x1, [sp, #40]
0x51082eea3ac  17cc  f94013fb       ldr cp, [sp, #32]
0x51082eea3b0  17d0  f9400ff3       ldr x19, [sp, #24]
0x51082eea3b4  17d4  f9400bf9       ldr x25, [sp, #16]
0x51082eea3b8  17d8  f94007ee       ldr x14, [sp, #8]
0x51082eea3bc  17dc  f941eff8       ldr x24, [sp, #984]
0x51082eea3c0  17e0  f941f3ed       ldr x13, [sp, #992]
0x51082eea3c4  17e4  f941f7f6       ldr x22, [sp, #1000]
0x51082eea3c8  17e8  f941fbf7       ldr x23, [sp, #1008]
0x51082eea3cc  17ec  f941fff5       ldr x21, [sp, #1016]
0x51082eea3d0  17f0  17fffbda       b #-0x1098 (addr 0x51082ee9338)
0x51082eea3d4  17f4  1e6d21a0       fcmp d13, d13
0x51082eea3d8  17f8  54000060       b.eq #+0xc (addr 0x51082eea3e4)
0x51082eea3dc  17fc  aa1c03f3       mov x19, x28
0x51082eea3e0  1800  17fffc19       b #-0xf9c (addr 0x51082ee9444)
0x51082eea3e4  1804  1e202188       fcmp s12, #0.0
0x51082eea3e8  1808  54ffffa3       b.lo #-0xc (addr 0x51082eea3dc)
0x51082eea3ec  180c  92800013       movn x19, #0x0
0x51082eea3f0  1810  17fffc15       b #-0xfac (addr 0x51082ee9444)
0x51082eea3f4  1814  1e6c2180       fcmp d12, d12
0x51082eea3f8  1818  54000060       b.eq #+0xc (addr 0x51082eea404)
0x51082eea3fc  181c  aa1c03f6       mov x22, x28
0x51082eea400  1820  17fffc30       b #-0xf40 (addr 0x51082ee94c0)
0x51082eea404  1824  1e202168       fcmp s11, #0.0
0x51082eea408  1828  54ffffa3       b.lo #-0xc (addr 0x51082eea3fc)
0x51082eea40c  182c  92800016       movn x22, #0x0
0x51082eea410  1830  17fffc2c       b #-0xf50 (addr 0x51082ee94c0)
0x51082eea414  1834  f9022bf4       str x20, [sp, #1104]
0x51082eea418  1838  f90227f5       str x21, [sp, #1096]
0x51082eea41c  183c  f90053ea       str x10, [sp, #160]
0x51082eea420  1840  f9004fe4       str x4, [sp, #152]
0x51082eea424  1844  f9004be2       str x2, [sp, #144]
0x51082eea428  1848  f90043e3       str x3, [sp, #128]
0x51082eea42c  184c  f90037e5       str x5, [sp, #104]
0x51082eea430  1850  97fc0de8       bl #-0xfc860 (addr 0x51082dedbd0)
0x51082eea434  1854  f9425fe8       ldr x8, [sp, #1208]
0x51082eea438  1858  f9422bf4       ldr x20, [sp, #1104]
0x51082eea43c  185c  f94227f5       ldr x21, [sp, #1096]
0x51082eea440  1860  3dc0cfe7       ldr q7, [sp, #816]
0x51082eea444  1864  3dc0cbe3       ldr q3, [sp, #800]
0x51082eea448  1868  3dc043e5       ldr q5, [sp, #256]
0x51082eea44c  186c  3dc03fec       ldr q12, [sp, #240]
0x51082eea450  1870  3dc03beb       ldr q11, [sp, #224]
0x51082eea454  1874  d280001c       movz x28, #0x0
0x51082eea458  1878  f94053ea       ldr x10, [sp, #160]
0x51082eea45c  187c  f9404fe4       ldr x4, [sp, #152]
0x51082eea460  1880  f9404be2       ldr x2, [sp, #144]
0x51082eea464  1884  f94047e6       ldr x6, [sp, #136]
0x51082eea468  1888  f94043e3       ldr x3, [sp, #128]
0x51082eea46c  188c  f9403fe9       ldr x9, [sp, #120]
0x51082eea470  1890  f9403be0       ldr x0, [sp, #112]
0x51082eea474  1894  f94037e5       ldr x5, [sp, #104]
0x51082eea478  1898  f94033f6       ldr x22, [sp, #96]
0x51082eea47c  189c  f9402ff8       ldr x24, [sp, #88]
0x51082eea480  18a0  f9402bf3       ldr x19, [sp, #80]
0x51082eea484  18a4  f94027f7       ldr x23, [sp, #72]
0x51082eea488  18a8  f94023ef       ldr x15, [sp, #64]
0x51082eea48c  18ac  17fffc3f       b #-0xf04 (addr 0x51082ee9588)
0x51082eea490  18b0  f9022bf4       str x20, [sp, #1104]
0x51082eea494  18b4  f90227f5       str x21, [sp, #1096]
0x51082eea498  18b8  f90223f3       str x19, [sp, #1088]
0x51082eea49c  18bc  f9021ff7       str x23, [sp, #1080]
0x51082eea4a0  18c0  f9021be1       str x1, [sp, #1072]
0x51082eea4a4  18c4  f90217e6       str x6, [sp, #1064]
0x51082eea4a8  18c8  f90213e9       str x9, [sp, #1056]
0x51082eea4ac  18cc  f901ebee       str x14, [sp, #976]
0x51082eea4b0  18d0  f901e7f9       str x25, [sp, #968]
0x51082eea4b4  18d4  f901e3f6       str x22, [sp, #960]
0x51082eea4b8  18d8  f901d3f8       str x24, [sp, #928]
0x51082eea4bc  18dc  f901c7eb       str x11, [sp, #904]
0x51082eea4c0  18e0  3d807be0       str q0, [sp, #480]
0x51082eea4c4  18e4  3d8077e1       str q1, [sp, #464]
0x51082eea4c8  18e8  3d8073e6       str q6, [sp, #448]
0x51082eea4cc  18ec  3d806fe2       str q2, [sp, #432]
0x51082eea4d0  18f0  3d806be4       str q4, [sp, #416]
0x51082eea4d4  18f4  3d8067e8       str q8, [sp, #400]
0x51082eea4d8  18f8  3d8063e9       str q9, [sp, #384]
0x51082eea4dc  18fc  3d805fea       str q10, [sp, #368]
0x51082eea4e0  1900  3d805bed       str q13, [sp, #352]
0x51082eea4e4  1904  3d8057ee       str q14, [sp, #336]
0x51082eea4e8  1908  3d8053f0       str q16, [sp, #320]
0x51082eea4ec  190c  3d804ff1       str q17, [sp, #304]
0x51082eea4f0  1910  f901c3ef       str x15, [sp, #896]
0x51082eea4f4  1914  f90057ed       str x13, [sp, #168]
0x51082eea4f8  1918  f90053ea       str x10, [sp, #160]
0x51082eea4fc  191c  f9004fe4       str x4, [sp, #152]
0x51082eea500  1920  f9004be2       str x2, [sp, #144]
0x51082eea504  1924  f90043e3       str x3, [sp, #128]
0x51082eea508  1928  f90037e5       str x5, [sp, #104]
0x51082eea50c  192c  97fc0db1       bl #-0xfc93c (addr 0x51082dedbd0)
0x51082eea510  1930  f9425fe8       ldr x8, [sp, #1208]
0x51082eea514  1934  f9422bf4       ldr x20, [sp, #1104]
0x51082eea518  1938  f94227f5       ldr x21, [sp, #1096]
0x51082eea51c  193c  f94223f3       ldr x19, [sp, #1088]
0x51082eea520  1940  f9421ff7       ldr x23, [sp, #1080]
0x51082eea524  1944  f9421be1       ldr x1, [sp, #1072]
0x51082eea528  1948  f94217e6       ldr x6, [sp, #1064]
0x51082eea52c  194c  f94213e9       ldr x9, [sp, #1056]
0x51082eea530  1950  f941ebee       ldr x14, [sp, #976]
0x51082eea534  1954  f941e7f9       ldr x25, [sp, #968]
0x51082eea538  1958  f941e3f6       ldr x22, [sp, #960]
0x51082eea53c  195c  f941d3f8       ldr x24, [sp, #928]
0x51082eea540  1960  f941c7eb       ldr x11, [sp, #904]
0x51082eea544  1964  3dc0cfe7       ldr q7, [sp, #816]
0x51082eea548  1968  3dc0cbe3       ldr q3, [sp, #800]
0x51082eea54c  196c  3dc07be0       ldr q0, [sp, #480]
0x51082eea550  1970  3dc077e1       ldr q1, [sp, #464]
0x51082eea554  1974  3dc073e6       ldr q6, [sp, #448]
0x51082eea558  1978  3dc06fe2       ldr q2, [sp, #432]
0x51082eea55c  197c  3dc06be4       ldr q4, [sp, #416]
0x51082eea560  1980  3dc067e8       ldr q8, [sp, #400]
0x51082eea564  1984  3dc063e9       ldr q9, [sp, #384]
0x51082eea568  1988  3dc05fea       ldr q10, [sp, #368]
0x51082eea56c  198c  3dc05bed       ldr q13, [sp, #352]
0x51082eea570  1990  3dc057ee       ldr q14, [sp, #336]
0x51082eea574  1994  3dc053f0       ldr q16, [sp, #320]
0x51082eea578  1998  3dc04ff1       ldr q17, [sp, #304]
0x51082eea57c  199c  f941c3ef       ldr x15, [sp, #896]
0x51082eea580  19a0  3dc043e5       ldr q5, [sp, #256]
0x51082eea584  19a4  3dc03fec       ldr q12, [sp, #240]
0x51082eea588  19a8  3dc03beb       ldr q11, [sp, #224]
0x51082eea58c  19ac  f94057ed       ldr x13, [sp, #168]
0x51082eea590  19b0  d280001c       movz x28, #0x0
0x51082eea594  19b4  f94053ea       ldr x10, [sp, #160]
0x51082eea598  19b8  f9404fe4       ldr x4, [sp, #152]
0x51082eea59c  19bc  f9404be2       ldr x2, [sp, #144]
0x51082eea5a0  19c0  f94043e3       ldr x3, [sp, #128]
0x51082eea5a4  19c4  f94037e5       ldr x5, [sp, #104]
0x51082eea5a8  19c8  17fffc94       b #-0xdb0 (addr 0x51082ee97f8)
0x51082eea5ac  19cc  f9022bf4       str x20, [sp, #1104]
0x51082eea5b0  19d0  f90227f5       str x21, [sp, #1096]
0x51082eea5b4  19d4  fd01d7f0       str d16, [sp, #936]
0x51082eea5b8  19d8  fd01dbee       str d14, [sp, #944]
0x51082eea5bc  19dc  fd01dfed       str d13, [sp, #952]
0x51082eea5c0  19e0  3d80e7f1       str q17, [sp, #912]
0x51082eea5c4  19e4  f90223ec       str x12, [sp, #1088]
0x51082eea5c8  19e8  f9021fe1       str x1, [sp, #1080]
0x51082eea5cc  19ec  f9021beb       str x11, [sp, #1072]
0x51082eea5d0  19f0  f90217e9       str x9, [sp, #1064]
0x51082eea5d4  19f4  f90213e6       str x6, [sp, #1056]
0x51082eea5d8  19f8  f90053ea       str x10, [sp, #160]
0x51082eea5dc  19fc  f9004fe4       str x4, [sp, #152]
0x51082eea5e0  1a00  f9004be2       str x2, [sp, #144]
0x51082eea5e4  1a04  f90043e3       str x3, [sp, #128]
0x51082eea5e8  1a08  f90037e5       str x5, [sp, #104]
0x51082eea5ec  1a0c  97fc0d79       bl #-0xfca1c (addr 0x51082dedbd0)
0x51082eea5f0  1a10  f9425fe8       ldr x8, [sp, #1208]
0x51082eea5f4  1a14  f9422bf4       ldr x20, [sp, #1104]
0x51082eea5f8  1a18  f94227f5       ldr x21, [sp, #1096]
0x51082eea5fc  1a1c  fd41d7f0       ldr d16, [sp, #936]
0x51082eea600  1a20  fd41dbee       ldr d14, [sp, #944]
0x51082eea604  1a24  fd41dfed       ldr d13, [sp, #952]
0x51082eea608  1a28  3dc0e7f1       ldr q17, [sp, #912]
0x51082eea60c  1a2c  f94223ec       ldr x12, [sp, #1088]
0x51082eea610  1a30  f9421fe1       ldr x1, [sp, #1080]
0x51082eea614  1a34  f9421beb       ldr x11, [sp, #1072]
0x51082eea618  1a38  f94217e9       ldr x9, [sp, #1064]
0x51082eea61c  1a3c  f94213e6       ldr x6, [sp, #1056]
0x51082eea620  1a40  1e2e1008       fmov s8, #0x70 (1.0000)
0x51082eea624  1a44  fd420fe4       ldr d4, [sp, #1048]
0x51082eea628  1a48  fd420be2       ldr d2, [sp, #1040]
0x51082eea62c  1a4c  fd4207ea       ldr d10, [sp, #1032]
0x51082eea630  1a50  fd4203e9       ldr d9, [sp, #1024]
0x51082eea634  1a54  d280001c       movz x28, #0x0
0x51082eea638  1a58  f94053ea       ldr x10, [sp, #160]
0x51082eea63c  1a5c  f9404fe4       ldr x4, [sp, #152]
0x51082eea640  1a60  f9404be2       ldr x2, [sp, #144]
0x51082eea644  1a64  f94043e3       ldr x3, [sp, #128]
0x51082eea648  1a68  f94037e5       ldr x5, [sp, #104]
0x51082eea64c  1a6c  17fffe77       b #-0x624 (addr 0x51082eea028)
0x51082eea650  1a70  d503201f       nop

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
       8a0         
       918         
       920         
       9c8         
       9d0         
       c1c         
       c2c         
       c68         
       c80         
       cc8         
       ce0         
       d20         
       d38         
       d78         
       d90         
       db0         
       dc0         
       de0         
       df0         
       e10         
       e20         
      1344         
      1354         
      138c         
      1394         
      13c4         
      13d0         
      1404         
      140c         
      1448         
      1454         
      1488         
      1490         
      14d0         
      14dc         
      14e4         
      14ec         
      153c         
      1540         
      1550         
      1554         
      1564         
      1568         
      1578         
      157c         

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
       8a0      1598
       918      1714
       920      1721
       9c8      1814
       9d0      1827
       c1c      2378
       c2c      2403
       c64      2467
       c7c      2490
       cc4      2554
       cdc      2577
       d1c      2641
       d34      2664
       d78      2728
       d90      2751
       db0      2800
       dc0      2821
       de0      2870
       df0      2891
       e10      2940
       e20      2961
      1344      3977
      1354      3992
      138c      4053
      1394      4061
      13c4      3977
      13d0      3992
      1404      4053
      140c      4061
      1448      3977
      1454      3992
      1488      4053
      1490      4061
      14cc      4148
      14dc      4155
      14e0      4162
      14e8      4169
      14fc      4198
      1538      4218
      1540      4221
      1550      4231
      1554      4234
      1564      4244
      1568      4247
      1578      4257
      157c      4260
      1620         0
      1680       412
      16c8       587
      1714       763
      1760       935
      17a8      1303
      1834      1751
      18b0      2367
      19cc      3967

Safepoints (stack slots = 160, entries = 1, byte size = 34)
0x51082ee8d9c    1bc  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 51)
0x51082ee8d98  internal wasm call
0x51082ee8e70  internal wasm call
0x51082ee8f80  internal wasm call
0x51082ee9084  internal wasm call
0x51082ee91a8  internal wasm call
0x51082eea0f0  internal wasm call
0x51082eea200  wasm stub call  (0x51082dedbd0)
0x51082eea26c  wasm stub call  (0x51082dedbd0)
0x51082eea2b4  wasm stub call  (0x51082dedbd0)
0x51082eea300  wasm stub call  (0x51082dedbd0)
0x51082eea34c  wasm stub call  (0x51082dedbd0)
0x51082eea38c  wasm stub call  (0x51082dedbd0)
0x51082eea430  wasm stub call  (0x51082dedbd0)
0x51082eea50c  wasm stub call  (0x51082dedbd0)
0x51082eea5ec  wasm stub call  (0x51082dedbd0)
