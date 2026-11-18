name: _RNvMs0_NtCshBZZPcGIfde_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 4512 = 4492 + 20 padding)
Instructions (size = 4472)
0xf8fe340c6a0     0  d2800110       movz x16, #0x8
0xf8fe340c6a4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0xf8fe340c6a8     8  a9017bfd       stp fp, lr, [sp, #16]
0xf8fe340c6ac     c  910043fd       add fp, sp, #0x10 (16)
0xf8fe340c6b0    10  d10443ff       sub sp, sp, #0x110 (272)
0xf8fe340c6b4    14  f841f0e1       ldur x1, [x7, #31]
0xf8fe340c6b8    18  f8520346       ldur x6, [x26, #-224]
0xf8fe340c6bc    1c  f9007fe1       str x1, [sp, #248]
0xf8fe340c6c0    20  eb2663ff       cmp sp, x6
0xf8fe340c6c4    24  54007249       b.ls #+0xe48 (addr 0xf8fe340d50c)
0xf8fe340c6c8    28  f842f0e6       ldur x6, [x7, #47]
0xf8fe340c6cc    2c  b94000c8       ldr w8, [x6]
0xf8fe340c6d0    30  51014108       sub w8, w8, #0x50 (80)
0xf8fe340c6d4    34  b90000c8       str w8, [x6]
0xf8fe340c6d8    38  2a0003e9       mov w9, w0
0xf8fe340c6dc    3c  9102b12a       add x10, x9, #0xac (172)
0xf8fe340c6e0    40  bc6a6821       ldr s1, [x1, x10]
0xf8fe340c6e4    44  9102a12a       add x10, x9, #0xa8 (168)
0xf8fe340c6e8    48  bc6a6822       ldr s2, [x1, x10]
0xf8fe340c6ec    4c  9100212b       add x11, x9, #0x8 (8)
0xf8fe340c6f0    50  b86b6823       ldr w3, [x1, x11]
0xf8fe340c6f4    54  9102e12c       add x12, x9, #0xb8 (184)
0xf8fe340c6f8    58  386c682c       ldrb w12, [x1, x12]
0xf8fe340c6fc    5c  f90087e6       str x6, [sp, #264]
0xf8fe340c700    60  f90083e8       str x8, [sp, #256]
0xf8fe340c704    64  f9007be9       str x9, [sp, #240]
0xf8fe340c708    68  fd0073e1       str d1, [sp, #224]
0xf8fe340c70c    6c  f90047ea       str x10, [sp, #136]
0xf8fe340c710    70  fd001fe2       str d2, [sp, #56]
0xf8fe340c714    74  f90027eb       str x11, [sp, #72]
0xf8fe340c718    78  f90077e3       str x3, [sp, #232]
0xf8fe340c71c    7c  350001ec       cbnz w12, #+0x3c (addr 0xf8fe340c758)
0xf8fe340c720    80  52840010       movz w16, #0x2000
0xf8fe340c724    84  72a7f010       movk w16, #0x3f80, lsl #16
0xf8fe340c728    88  1e270203       fmov s3, w16
0xf8fe340c72c    8c  1e230823       fmul s3, s1, s3
0xf8fe340c730    90  1e231843       fdiv s3, s2, s3
0xf8fe340c734    94  1e254063       frintm s3, s3
0xf8fe340c738    98  1e202068       fcmp s3, #0.0
0xf8fe340c73c    9c  5400006a       b.ge #+0xc (addr 0xf8fe340c748)
0xf8fe340c740    a0  d280000c       movz x12, #0x0
0xf8fe340c744    a4  1400002d       b #+0xb4 (addr 0xf8fe340c7f8)
0xf8fe340c748    a8  52a9f010       movz w16, #0x4f800000
0xf8fe340c74c    ac  1e270204       fmov s4, w16
0xf8fe340c750    b0  1e242060       fcmp s3, s4
0xf8fe340c754    b4  54000063       b.lo #+0xc (addr 0xf8fe340c760)
0xf8fe340c758    b8  d280000c       movz x12, #0x0
0xf8fe340c75c    bc  14000027       b #+0x9c (addr 0xf8fe340c7f8)
0xf8fe340c760    c0  1e22c064       fcvt d4, s3
0xf8fe340c764    c4  1e65c085       frintz d5, d4
0xf8fe340c768    c8  1e7900ac       fcvtzu w12, d5
0xf8fe340c76c    cc  1e630186       ucvtf d6, w12
0xf8fe340c770    d0  1e6620a0       fcmp d5, d6
0xf8fe340c774    d4  54006d81       b.ne #+0xdb0 (addr 0xf8fe340d524)
0xf8fe340c778    d8  71000d9f       cmp w12, #0x3 (3)
0xf8fe340c77c    dc  54fffee3       b.lo #-0x24 (addr 0xf8fe340c758)
0xf8fe340c780    e0  9100512d       add x13, x9, #0x14 (20)
0xf8fe340c784    e4  b86d6825       ldr w5, [x1, x13]
0xf8fe340c788    e8  9100412d       add x13, x9, #0x10 (16)
0xf8fe340c78c    ec  b86d6824       ldr w4, [x1, x13]
0xf8fe340c790    f0  9100112d       add x13, x9, #0x4 (4)
0xf8fe340c794    f4  b86d6822       ldr w2, [x1, x13]
0xf8fe340c798    f8  d280800d       movz x13, #0x400
0xf8fe340c79c    fc  7110019f       cmp w12, #0x400 (1024)
0xf8fe340c7a0   100  1a8d318e       csel w14, w12, w13, lo
0xf8fe340c7a4   104  9102312c       add x12, x9, #0x8c (140)
0xf8fe340c7a8   108  b82c682e       str w14, [x1, x12]
0xf8fe340c7ac   10c  9102212c       add x12, x9, #0x88 (136)
0xf8fe340c7b0   110  b82c682e       str w14, [x1, x12]
0xf8fe340c7b4   114  1e2301c3       ucvtf s3, w14
0xf8fe340c7b8   118  1e221863       fdiv s3, s3, s2
0xf8fe340c7bc   11c  9102112c       add x12, x9, #0x84 (132)
0xf8fe340c7c0   120  bc2c6823       str s3, [x1, x12]
0xf8fe340c7c4   124  11018000       add w0, w0, #0x60 (96)
0xf8fe340c7c8   128  97fac3ad       bl #-0x14f14c (addr 0xf8fe32bd67c)
0xf8fe340c7cc   12c  fd4073e1       ldr d1, [sp, #224]
0xf8fe340c7d0   130  d280002c       movz x12, #0x1
0xf8fe340c7d4   134  f94087e6       ldr x6, [sp, #264]
0xf8fe340c7d8   138  f94083e8       ldr x8, [sp, #256]
0xf8fe340c7dc   13c  f9407fe1       ldr x1, [sp, #248]
0xf8fe340c7e0   140  f9407be9       ldr x9, [sp, #240]
0xf8fe340c7e4   144  f9408be7       ldr x7, [sp, #272]
0xf8fe340c7e8   148  f94077e3       ldr x3, [sp, #232]
0xf8fe340c7ec   14c  f94047ea       ldr x10, [sp, #136]
0xf8fe340c7f0   150  fd401fe2       ldr d2, [sp, #56]
0xf8fe340c7f4   154  f94027eb       ldr x11, [sp, #72]
0xf8fe340c7f8   158  f90033ec       str x12, [sp, #96]
0xf8fe340c7fc   15c  aa0303ed       mov x13, x3
0xf8fe340c800   160  3400650d       cbz w13, #+0xca0 (addr 0xf8fe340d4a0)
0xf8fe340c804   164  9101712e       add x14, x9, #0x5c (92)
0xf8fe340c808   168  b86e682e       ldr w14, [x1, x14]
0xf8fe340c80c   16c  9101412f       add x15, x9, #0x50 (80)
0xf8fe340c810   170  b86f682f       ldr w15, [x1, x15]
0xf8fe340c814   174  91011133       add x19, x9, #0x44 (68)
0xf8fe340c818   178  b8736833       ldr w19, [x1, x19]
0xf8fe340c81c   17c  9100e134       add x20, x9, #0x38 (56)
0xf8fe340c820   180  b8746834       ldr w20, [x1, x20]
0xf8fe340c824   184  6b14027f       cmp w19, w20
0xf8fe340c828   188  1a943275       csel w21, w19, w20, lo
0xf8fe340c82c   18c  6b1501ff       cmp w15, w21
0xf8fe340c830   190  1a9531f3       csel w19, w15, w21, lo
0xf8fe340c834   194  6b1301df       cmp w14, w19
0xf8fe340c838   198  1a9331cf       csel w15, w14, w19, lo
0xf8fe340c83c   19c  1e3c1003       fmov s3, #0xe0 (-0.5000)
0xf8fe340c840   1a0  1e230843       fmul s3, s2, s3
0xf8fe340c844   1a4  1e2c1004       fmov s4, #0x60 (0.5000)
0xf8fe340c848   1a8  1e240844       fmul s4, s2, s4
0xf8fe340c84c   1ac  9101612e       add x14, x9, #0x58 (88)
0xf8fe340c850   1b0  b86e682e       ldr w14, [x1, x14]
0xf8fe340c854   1b4  91013133       add x19, x9, #0x4c (76)
0xf8fe340c858   1b8  b8736833       ldr w19, [x1, x19]
0xf8fe340c85c   1bc  91010134       add x20, x9, #0x40 (64)
0xf8fe340c860   1c0  b8746834       ldr w20, [x1, x20]
0xf8fe340c864   1c4  9100d135       add x21, x9, #0x34 (52)
0xf8fe340c868   1c8  b8756835       ldr w21, [x1, x21]
0xf8fe340c86c   1cc  11002116       add w22, w8, #0x8 (8)
0xf8fe340c870   1d0  1e210821       fmul s1, s1, s1
0xf8fe340c874   1d4  f90053ef       str x15, [sp, #160]
0xf8fe340c878   1d8  fd001be3       str d3, [sp, #48]
0xf8fe340c87c   1dc  fd0017e4       str d4, [sp, #40]
0xf8fe340c880   1e0  f90067ee       str x14, [sp, #200]
0xf8fe340c884   1e4  f9005ff3       str x19, [sp, #184]
0xf8fe340c888   1e8  f9005bf4       str x20, [sp, #176]
0xf8fe340c88c   1ec  f90057f5       str x21, [sp, #168]
0xf8fe340c890   1f0  f90003f6       str x22, [sp]
0xf8fe340c894   1f4  fd0023e1       str d1, [sp, #64]
0xf8fe340c898   1f8  d280000a       movz x10, #0x0
0xf8fe340c89c   1fc  14000002       b #+0x8 (addr 0xf8fe340c8a4)
0xf8fe340c8a0   200  aa0603ed       mov x13, x6
0xf8fe340c8a4   204  f8520358       ldur x24, [x26, #-224]
0xf8fe340c8a8   208  eb3863ff       cmp sp, x24
0xf8fe340c8ac   20c  540064c9       b.ls #+0xc98 (addr 0xf8fe340d544)
0xf8fe340c8b0   210  b86b6838       ldr w24, [x1, x11]
0xf8fe340c8b4   214  f9003bf8       str x24, [sp, #112]
0xf8fe340c8b8   218  6b0a031f       cmp w24, w10
0xf8fe340c8bc   21c  54005c69       b.ls #+0xb8c (addr 0xf8fe340d448)
0xf8fe340c8c0   220  91005139       add x25, x9, #0x14 (20)
0xf8fe340c8c4   224  b8796839       ldr w25, [x1, x25]
0xf8fe340c8c8   228  6b0a033f       cmp w25, w10
0xf8fe340c8cc   22c  54005be9       b.ls #+0xb7c (addr 0xf8fe340d448)
0xf8fe340c8d0   230  9100813b       add cp, x9, #0x20 (32)
0xf8fe340c8d4   234  b87b683b       ldr w27, [x1, x27]
0xf8fe340c8d8   238  f9006ffb       str cp, [sp, #216]
0xf8fe340c8dc   23c  6b0a037f       cmp w27, w10
0xf8fe340c8e0   240  54005b49       b.ls #+0xb68 (addr 0xf8fe340d448)
0xf8fe340c8e4   244  9100b13c       add x28, x9, #0x2c (44)
0xf8fe340c8e8   248  b87c683c       ldr w28, [x1, x28]
0xf8fe340c8ec   24c  f9006bfc       str x28, [sp, #208]
0xf8fe340c8f0   250  6b0a039f       cmp w28, w10
0xf8fe340c8f4   254  54005aa9       b.ls #+0xb54 (addr 0xf8fe340d448)
0xf8fe340c8f8   258  91001120       add x0, x9, #0x4 (4)
0xf8fe340c8fc   25c  b8606820       ldr w0, [x1, x0]
0xf8fe340c900   260  531e7542       lsl w2, w10, #2
0xf8fe340c904   264  0b020003       add w3, w0, w2
0xf8fe340c908   268  bc636826       ldr s6, [x1, x3]
0xf8fe340c90c   26c  9100a123       add x3, x9, #0x28 (40)
0xf8fe340c910   270  b8636823       ldr w3, [x1, x3]
0xf8fe340c914   274  0b020064       add w4, w3, w2
0xf8fe340c918   278  bc646827       ldr s7, [x1, x4]
0xf8fe340c91c   27c  91007124       add x4, x9, #0x1c (28)
0xf8fe340c920   280  b8646824       ldr w4, [x1, x4]
0xf8fe340c924   284  0b020085       add w5, w4, w2
0xf8fe340c928   288  bc656828       ldr s8, [x1, x5]
0xf8fe340c92c   28c  91004125       add x5, x9, #0x10 (16)
0xf8fe340c930   290  b8656825       ldr w5, [x1, x5]
0xf8fe340c934   294  0b0200a6       add w6, w5, w2
0xf8fe340c938   298  bc666829       ldr s9, [x1, x6]
0xf8fe340c93c   29c  f90073ea       str x10, [sp, #224]
0xf8fe340c940   2a0  f90013e0       str x0, [sp, #32]
0xf8fe340c944   2a4  f90063e2       str x2, [sp, #192]
0xf8fe340c948   2a8  fd0043e6       str d6, [sp, #128]
0xf8fe340c94c   2ac  f90007e3       str x3, [sp, #8]
0xf8fe340c950   2b0  fd004be7       str d7, [sp, #144]
0xf8fe340c954   2b4  f9000be4       str x4, [sp, #16]
0xf8fe340c958   2b8  fd003fe8       str d8, [sp, #120]
0xf8fe340c95c   2bc  f9000fe5       str x5, [sp, #24]
0xf8fe340c960   2c0  fd004fe9       str d9, [sp, #152]
0xf8fe340c964   2c4  3500090c       cbnz w12, #+0x120 (addr 0xf8fe340ca84)
0xf8fe340c968   2c8  6b19031f       cmp w24, w25
0xf8fe340c96c   2cc  1a993306       csel w6, w24, w25, lo
0xf8fe340c970   2d0  6b1c037f       cmp w27, w28
0xf8fe340c974   2d4  1a9c3378       csel w24, w27, w28, lo
0xf8fe340c978   2d8  6b1800df       cmp w6, w24
0xf8fe340c97c   2dc  1a9830d9       csel w25, w6, w24, lo
0xf8fe340c980   2e0  2f00e40a       movi d10, #0x0
0xf8fe340c984   2e4  d2800006       movz x6, #0x0
0xf8fe340c988   2e8  4eaa1d4b       mov v11.16b, v10.16b
0xf8fe340c98c   2ec  14000002       b #+0x8 (addr 0xf8fe340c994)
0xf8fe340c990   2f0  aa1b03e6       mov x6, cp
0xf8fe340c994   2f4  f8520358       ldur x24, [x26, #-224]
0xf8fe340c998   2f8  eb3863ff       cmp sp, x24
0xf8fe340c99c   2fc  54005f09       b.ls #+0xbe0 (addr 0xf8fe340d57c)
0xf8fe340c9a0   300  6b06033f       cmp w25, w6
0xf8fe340c9a4   304  9a9f87f8       cset x24, ls
0xf8fe340c9a8   308  aa0603fb       mov cp, x6
0xf8fe340c9ac   30c  1100077b       add w27, w27, #0x1 (1)
0xf8fe340c9b0   310  34000218       cbz w24, #+0x40 (addr 0xf8fe340c9f0)
0xf8fe340c9b4   314  6b0d037f       cmp w27, w13
0xf8fe340c9b8   318  54004382       b.hs #+0x870 (addr 0xf8fe340d228)
0xf8fe340c9bc   31c  1100077b       add w27, w27, #0x1 (1)
0xf8fe340c9c0   320  6b0d037f       cmp w27, w13
0xf8fe340c9c4   324  54004322       b.hs #+0x864 (addr 0xf8fe340d228)
0xf8fe340c9c8   328  1100077b       add w27, w27, #0x1 (1)
0xf8fe340c9cc   32c  6b0d037f       cmp w27, w13
0xf8fe340c9d0   330  540042c2       b.hs #+0x858 (addr 0xf8fe340d228)
0xf8fe340c9d4   334  f852035c       ldur x28, [x26, #-224]
0xf8fe340c9d8   338  eb3c63ff       cmp sp, x28
0xf8fe340c9dc   33c  540060a9       b.ls #+0xc14 (addr 0xf8fe340d5f0)
0xf8fe340c9e0   340  1100077b       add w27, w27, #0x1 (1)
0xf8fe340c9e4   344  6b0d037f       cmp w27, w13
0xf8fe340c9e8   348  54fffe23       b.lo #-0x3c (addr 0xf8fe340c9ac)
0xf8fe340c9ec   34c  1400020f       b #+0x83c (addr 0xf8fe340d228)
0xf8fe340c9f0   350  531e74c6       lsl w6, w6, #2
0xf8fe340c9f4   354  0b060078       add w24, w3, w6
0xf8fe340c9f8   358  0b06009c       add w28, w4, w6
0xf8fe340c9fc   35c  0b0600aa       add w10, w5, w6
0xf8fe340ca00   360  bc6a682c       ldr s12, [x1, x10]
0xf8fe340ca04   364  0b060006       add w6, w0, w6
0xf8fe340ca08   368  bc66682d       ldr s13, [x1, x6]
0xf8fe340ca0c   36c  1e2d38cd       fsub s13, s6, s13
0xf8fe340ca10   370  1e2d2080       fcmp s4, s13
0xf8fe340ca14   374  540000a3       b.lo #+0x14 (addr 0xf8fe340ca28)
0xf8fe340ca18   378  1e2321a0       fcmp s13, s3
0xf8fe340ca1c   37c  54000082       b.hs #+0x10 (addr 0xf8fe340ca2c)
0xf8fe340ca20   380  1e2d284d       fadd s13, s2, s13
0xf8fe340ca24   384  14000002       b #+0x8 (addr 0xf8fe340ca2c)
0xf8fe340ca28   388  1e2239ad       fsub s13, s13, s2
0xf8fe340ca2c   38c  bc78682e       ldr s14, [x1, x24]
0xf8fe340ca30   390  bc7c6830       ldr s16, [x1, x28]
0xf8fe340ca34   394  1e2c392c       fsub s12, s9, s12
0xf8fe340ca38   398  1e2c2080       fcmp s4, s12
0xf8fe340ca3c   39c  540000a3       b.lo #+0x14 (addr 0xf8fe340ca50)
0xf8fe340ca40   3a0  1e232180       fcmp s12, s3
0xf8fe340ca44   3a4  54000082       b.hs #+0x10 (addr 0xf8fe340ca54)
0xf8fe340ca48   3a8  1e2c284c       fadd s12, s2, s12
0xf8fe340ca4c   3ac  14000002       b #+0x8 (addr 0xf8fe340ca54)
0xf8fe340ca50   3b0  1e22398c       fsub s12, s12, s2
0xf8fe340ca54   3b4  1e302970       fadd s16, s11, s16
0xf8fe340ca58   3b8  1e2d09ad       fmul s13, s13, s13
0xf8fe340ca5c   3bc  1e2c098c       fmul s12, s12, s12
0xf8fe340ca60   3c0  1e2c29ac       fadd s12, s13, s12
0xf8fe340ca64   3c4  1e212180       fcmp s12, s1
0xf8fe340ca68   3c8  1e2b3e0b       fcsel s11, s16, s11, lo
0xf8fe340ca6c   3cc  1e2e294d       fadd s13, s10, s14
0xf8fe340ca70   3d0  1e212180       fcmp s12, s1
0xf8fe340ca74   3d4  1e2a3daa       fcsel s10, s13, s10, lo
0xf8fe340ca78   3d8  6b0d037f       cmp w27, w13
0xf8fe340ca7c   3dc  54fff8a3       b.lo #-0xec (addr 0xf8fe340c990)
0xf8fe340ca80   3e0  140001ea       b #+0x7a8 (addr 0xf8fe340d228)
0xf8fe340ca84   3e4  91023126       add x6, x9, #0x8c (140)
0xf8fe340ca88   3e8  b8666826       ldr w6, [x1, x6]
0xf8fe340ca8c   3ec  710000df       cmp w6, #0x0 (0)
0xf8fe340ca90   3f0  9a9f17ea       cset x10, eq
0xf8fe340ca94   3f4  34004e46       cbz w6, #+0x9c8 (addr 0xf8fe340d45c)
0xf8fe340ca98   3f8  9102212b       add x11, x9, #0x88 (136)
0xf8fe340ca9c   3fc  b86b682b       ldr w11, [x1, x11]
0xf8fe340caa0   400  7100017f       cmp w11, #0x0 (0)
0xf8fe340caa4   404  9a9f17ec       cset x12, eq
0xf8fe340caa8   408  34004eab       cbz w11, #+0x9d4 (addr 0xf8fe340d47c)
0xf8fe340caac   40c  9101912d       add x13, x9, #0x64 (100)
0xf8fe340cab0   410  b86d682d       ldr w13, [x1, x13]
0xf8fe340cab4   414  7100015f       cmp w10, #0x0 (0)
0xf8fe340cab8   418  9a9f17ea       cset x10, eq
0xf8fe340cabc   41c  4b0a00ca       sub w10, w6, w10
0xf8fe340cac0   420  9102112e       add x14, x9, #0x84 (132)
0xf8fe340cac4   424  bc6e682a       ldr s10, [x1, x14]
0xf8fe340cac8   428  1e2a092b       fmul s11, s9, s10
0xf8fe340cacc   42c  1e25416b       frintm s11, s11
0xf8fe340cad0   430  1e2b2160       fcmp s11, s11
0xf8fe340cad4   434  1e2b1deb       fcsel s11, s15, s11, ne
0xf8fe340cad8   438  1e202168       fcmp s11, #0.0
0xf8fe340cadc   43c  1e2fcd6b       fcsel s11, s11, s15, gt
0xf8fe340cae0   440  1e22c16c       fcvt d12, s11
0xf8fe340cae4   444  1e65c18d       frintz d13, d12
0xf8fe340cae8   448  1e7901ae       fcvtzu w14, d13
0xf8fe340caec   44c  1e6301ce       ucvtf d14, w14
0xf8fe340caf0   450  1e6e21a0       fcmp d13, d14
0xf8fe340caf4   454  54005c01       b.ne #+0xb80 (addr 0xf8fe340d674)
0xf8fe340caf8   458  6b0e015f       cmp w10, w14
0xf8fe340cafc   45c  1a8e314f       csel w15, w10, w14, lo
0xf8fe340cb00   460  52a9f010       movz w16, #0x4f800000
0xf8fe340cb04   464  1e27020c       fmov s12, w16
0xf8fe340cb08   468  1e2c2160       fcmp s11, s12
0xf8fe340cb0c   46c  1a9f31ea       csel w10, w15, wzr, lo
0xf8fe340cb10   470  0b06014a       add w10, w10, w6
0xf8fe340cb14   474  5100054e       sub w14, w10, #0x1 (1)
0xf8fe340cb18   478  1ac609d0       udiv w16, w14, w6
0xf8fe340cb1c   47c  1b06ba0e       msub w14, w16, w6, w14
0xf8fe340cb20   480  1b0b7dce       mul w14, w14, w11
0xf8fe340cb24   484  7100019f       cmp w12, #0x0 (0)
0xf8fe340cb28   488  9a9f17ec       cset x12, eq
0xf8fe340cb2c   48c  4b0c016c       sub w12, w11, w12
0xf8fe340cb30   490  1e2a08ca       fmul s10, s6, s10
0xf8fe340cb34   494  1e25414a       frintm s10, s10
0xf8fe340cb38   498  1e2a2140       fcmp s10, s10
0xf8fe340cb3c   49c  1e2a1dea       fcsel s10, s15, s10, ne
0xf8fe340cb40   4a0  1e202148       fcmp s10, #0.0
0xf8fe340cb44   4a4  1e2fcd4a       fcsel s10, s10, s15, gt
0xf8fe340cb48   4a8  1e22c14b       fcvt d11, s10
0xf8fe340cb4c   4ac  1e65c16d       frintz d13, d11
0xf8fe340cb50   4b0  1e7901af       fcvtzu w15, d13
0xf8fe340cb54   4b4  1e6301ee       ucvtf d14, w15
0xf8fe340cb58   4b8  1e6e21a0       fcmp d13, d14
0xf8fe340cb5c   4bc  540059c1       b.ne #+0xb38 (addr 0xf8fe340d694)
0xf8fe340cb60   4c0  6b0f019f       cmp w12, w15
0xf8fe340cb64   4c4  1a8f3193       csel w19, w12, w15, lo
0xf8fe340cb68   4c8  1e2c2140       fcmp s10, s12
0xf8fe340cb6c   4cc  1a9f326c       csel w12, w19, wzr, lo
0xf8fe340cb70   4d0  0b0b018c       add w12, w12, w11
0xf8fe340cb74   4d4  5100058f       sub w15, w12, #0x1 (1)
0xf8fe340cb78   4d8  1acb09f0       udiv w16, w15, w11
0xf8fe340cb7c   4dc  1b0bbe0f       msub w15, w16, w11, w15
0xf8fe340cb80   4e0  0b0f01d3       add w19, w14, w15
0xf8fe340cb84   4e4  9101a134       add x20, x9, #0x68 (104)
0xf8fe340cb88   4e8  b8746834       ldr w20, [x1, x20]
0xf8fe340cb8c   4ec  6b14027f       cmp w19, w20
0xf8fe340cb90   4f0  54000083       b.lo #+0x10 (addr 0xf8fe340cba0)
0xf8fe340cb94   4f4  d2800013       movz x19, #0x0
0xf8fe340cb98   4f8  aa1303f5       mov x21, x19
0xf8fe340cb9c   4fc  14000014       b #+0x50 (addr 0xf8fe340cbec)
0xf8fe340cba0   500  11000675       add w21, w19, #0x1 (1)
0xf8fe340cba4   504  6b15029f       cmp w20, w21
0xf8fe340cba8   508  54ffff69       b.ls #-0x14 (addr 0xf8fe340cb94)
0xf8fe340cbac   50c  0b1509b5       add w21, w13, w21, lsl #2
0xf8fe340cbb0   510  b8756835       ldr w21, [x1, x21]
0xf8fe340cbb4   514  0b1309b3       add w19, w13, w19, lsl #2
0xf8fe340cbb8   518  b8736833       ldr w19, [x1, x19]
0xf8fe340cbbc   51c  6b1302bf       cmp w21, w19
0xf8fe340cbc0   520  54000103       b.lo #+0x20 (addr 0xf8fe340cbe0)
0xf8fe340cbc4   524  91020137       add x23, x9, #0x80 (128)
0xf8fe340cbc8   528  b8776837       ldr w23, [x1, x23]
0xf8fe340cbcc   52c  6b1502ff       cmp w23, w21
0xf8fe340cbd0   530  540000e2       b.hs #+0x1c (addr 0xf8fe340cbec)
0xf8fe340cbd4   534  d2800093       movz x19, #0x4
0xf8fe340cbd8   538  d2800015       movz x21, #0x0
0xf8fe340cbdc   53c  14000008       b #+0x20 (addr 0xf8fe340cbfc)
0xf8fe340cbe0   540  d2800015       movz x21, #0x0
0xf8fe340cbe4   544  d2800093       movz x19, #0x4
0xf8fe340cbe8   548  14000005       b #+0x14 (addr 0xf8fe340cbfc)
0xf8fe340cbec   54c  4b1302b5       sub w21, w21, w19
0xf8fe340cbf0   550  9101f137       add x23, x9, #0x7c (124)
0xf8fe340cbf4   554  b8776837       ldr w23, [x1, x23]
0xf8fe340cbf8   558  0b130af3       add w19, w23, w19, lsl #2
0xf8fe340cbfc   55c  1acb0990       udiv w16, w12, w11
0xf8fe340cc00   560  1b0bb217       msub w23, w16, w11, w12
0xf8fe340cc04   564  0b0e02e2       add w2, w23, w14
0xf8fe340cc08   568  6b14005f       cmp w2, w20
0xf8fe340cc0c   56c  54000083       b.lo #+0x10 (addr 0xf8fe340cc1c)
0xf8fe340cc10   570  d2800002       movz x2, #0x0
0xf8fe340cc14   574  aa0203e7       mov x7, x2
0xf8fe340cc18   578  14000017       b #+0x5c (addr 0xf8fe340cc74)
0xf8fe340cc1c   57c  11000447       add w7, w2, #0x1 (1)
0xf8fe340cc20   580  6b07029f       cmp w20, w7
0xf8fe340cc24   584  54ffff69       b.ls #-0x14 (addr 0xf8fe340cc10)
0xf8fe340cc28   588  0b0709a7       add w7, w13, w7, lsl #2
0xf8fe340cc2c   58c  b8676827       ldr w7, [x1, x7]
0xf8fe340cc30   590  0b0209a2       add w2, w13, w2, lsl #2
0xf8fe340cc34   594  b8626822       ldr w2, [x1, x2]
0xf8fe340cc38   598  6b0200ff       cmp w7, w2
0xf8fe340cc3c   59c  54000163       b.lo #+0x2c (addr 0xf8fe340cc68)
0xf8fe340cc40   5a0  91020120       add x0, x9, #0x80 (128)
0xf8fe340cc44   5a4  b8606820       ldr w0, [x1, x0]
0xf8fe340cc48   5a8  6b07001f       cmp w0, w7
0xf8fe340cc4c   5ac  54000063       b.lo #+0xc (addr 0xf8fe340cc58)
0xf8fe340cc50   5b0  f94013e0       ldr x0, [sp, #32]
0xf8fe340cc54   5b4  14000008       b #+0x20 (addr 0xf8fe340cc74)
0xf8fe340cc58   5b8  f94013e0       ldr x0, [sp, #32]
0xf8fe340cc5c   5bc  d2800007       movz x7, #0x0
0xf8fe340cc60   5c0  d2800082       movz x2, #0x4
0xf8fe340cc64   5c4  14000009       b #+0x24 (addr 0xf8fe340cc88)
0xf8fe340cc68   5c8  d2800007       movz x7, #0x0
0xf8fe340cc6c   5cc  d2800082       movz x2, #0x4
0xf8fe340cc70   5d0  14000006       b #+0x18 (addr 0xf8fe340cc88)
0xf8fe340cc74   5d4  4b0200e7       sub w7, w7, w2
0xf8fe340cc78   5d8  9101f125       add x5, x9, #0x7c (124)
0xf8fe340cc7c   5dc  b8656825       ldr w5, [x1, x5]
0xf8fe340cc80   5e0  0b0208a2       add w2, w5, w2, lsl #2
0xf8fe340cc84   5e4  f9400fe5       ldr x5, [sp, #24]
0xf8fe340cc88   5e8  1100058c       add w12, w12, #0x1 (1)
0xf8fe340cc8c   5ec  1acb0990       udiv w16, w12, w11
0xf8fe340cc90   5f0  1b0bb20c       msub w12, w16, w11, w12
0xf8fe340cc94   5f4  0b0e018e       add w14, w12, w14
0xf8fe340cc98   5f8  6b1401df       cmp w14, w20
0xf8fe340cc9c   5fc  54000083       b.lo #+0x10 (addr 0xf8fe340ccac)
0xf8fe340cca0   600  d2800004       movz x4, #0x0
0xf8fe340cca4   604  aa0403ee       mov x14, x4
0xf8fe340cca8   608  14000017       b #+0x5c (addr 0xf8fe340cd04)
0xf8fe340ccac   60c  110005c4       add w4, w14, #0x1 (1)
0xf8fe340ccb0   610  6b04029f       cmp w20, w4
0xf8fe340ccb4   614  54ffff69       b.ls #-0x14 (addr 0xf8fe340cca0)
0xf8fe340ccb8   618  0b0409a4       add w4, w13, w4, lsl #2
0xf8fe340ccbc   61c  b8646824       ldr w4, [x1, x4]
0xf8fe340ccc0   620  0b0e09ae       add w14, w13, w14, lsl #2
0xf8fe340ccc4   624  b86e682e       ldr w14, [x1, x14]
0xf8fe340ccc8   628  6b0e009f       cmp w4, w14
0xf8fe340cccc   62c  54000163       b.lo #+0x2c (addr 0xf8fe340ccf8)
0xf8fe340ccd0   630  91020123       add x3, x9, #0x80 (128)
0xf8fe340ccd4   634  b8636823       ldr w3, [x1, x3]
0xf8fe340ccd8   638  6b04007f       cmp w3, w4
0xf8fe340ccdc   63c  54000063       b.lo #+0xc (addr 0xf8fe340cce8)
0xf8fe340cce0   640  f94007e3       ldr x3, [sp, #8]
0xf8fe340cce4   644  14000008       b #+0x20 (addr 0xf8fe340cd04)
0xf8fe340cce8   648  d280008e       movz x14, #0x4
0xf8fe340ccec   64c  d2800004       movz x4, #0x0
0xf8fe340ccf0   650  f94007e3       ldr x3, [sp, #8]
0xf8fe340ccf4   654  14000008       b #+0x20 (addr 0xf8fe340cd14)
0xf8fe340ccf8   658  d2800004       movz x4, #0x0
0xf8fe340ccfc   65c  d280008e       movz x14, #0x4
0xf8fe340cd00   660  14000005       b #+0x14 (addr 0xf8fe340cd14)
0xf8fe340cd04   664  4b0e0084       sub w4, w4, w14
0xf8fe340cd08   668  9101f136       add x22, x9, #0x7c (124)
0xf8fe340cd0c   66c  b8766836       ldr w22, [x1, x22]
0xf8fe340cd10   670  0b0e0ace       add w14, w22, w14, lsl #2
0xf8fe340cd14   674  1ac60950       udiv w16, w10, w6
0xf8fe340cd18   678  1b06aa16       msub w22, w16, w6, w10
0xf8fe340cd1c   67c  1b0b7ed6       mul w22, w22, w11
0xf8fe340cd20   680  0b0f02c0       add w0, w22, w15
0xf8fe340cd24   684  6b14001f       cmp w0, w20
0xf8fe340cd28   688  54000083       b.lo #+0x10 (addr 0xf8fe340cd38)
0xf8fe340cd2c   68c  d2800000       movz x0, #0x0
0xf8fe340cd30   690  aa0003e3       mov x3, x0
0xf8fe340cd34   694  14000014       b #+0x50 (addr 0xf8fe340cd84)
0xf8fe340cd38   698  11000403       add w3, w0, #0x1 (1)
0xf8fe340cd3c   69c  6b03029f       cmp w20, w3
0xf8fe340cd40   6a0  54ffff69       b.ls #-0x14 (addr 0xf8fe340cd2c)
0xf8fe340cd44   6a4  0b0309a3       add w3, w13, w3, lsl #2
0xf8fe340cd48   6a8  b8636823       ldr w3, [x1, x3]
0xf8fe340cd4c   6ac  0b0009a0       add w0, w13, w0, lsl #2
0xf8fe340cd50   6b0  b8606820       ldr w0, [x1, x0]
0xf8fe340cd54   6b4  6b00007f       cmp w3, w0
0xf8fe340cd58   6b8  54000103       b.lo #+0x20 (addr 0xf8fe340cd78)
0xf8fe340cd5c   6bc  91020125       add x5, x9, #0x80 (128)
0xf8fe340cd60   6c0  b8656825       ldr w5, [x1, x5]
0xf8fe340cd64   6c4  6b0300bf       cmp w5, w3
0xf8fe340cd68   6c8  540000e2       b.hs #+0x1c (addr 0xf8fe340cd84)
0xf8fe340cd6c   6cc  d2800080       movz x0, #0x4
0xf8fe340cd70   6d0  d2800003       movz x3, #0x0
0xf8fe340cd74   6d4  14000008       b #+0x20 (addr 0xf8fe340cd94)
0xf8fe340cd78   6d8  d2800003       movz x3, #0x0
0xf8fe340cd7c   6dc  d2800080       movz x0, #0x4
0xf8fe340cd80   6e0  14000005       b #+0x14 (addr 0xf8fe340cd94)
0xf8fe340cd84   6e4  4b000063       sub w3, w3, w0
0xf8fe340cd88   6e8  9101f125       add x5, x9, #0x7c (124)
0xf8fe340cd8c   6ec  b8656825       ldr w5, [x1, x5]
0xf8fe340cd90   6f0  0b0008a0       add w0, w5, w0, lsl #2
0xf8fe340cd94   6f4  0b1702c5       add w5, w22, w23
0xf8fe340cd98   6f8  6b1400bf       cmp w5, w20
0xf8fe340cd9c   6fc  54000083       b.lo #+0x10 (addr 0xf8fe340cdac)
0xf8fe340cda0   700  d2800005       movz x5, #0x0
0xf8fe340cda4   704  aa0503fb       mov cp, x5
0xf8fe340cda8   708  14000014       b #+0x50 (addr 0xf8fe340cdf8)
0xf8fe340cdac   70c  110004bb       add w27, w5, #0x1 (1)
0xf8fe340cdb0   710  6b1b029f       cmp w20, w27
0xf8fe340cdb4   714  54ffff69       b.ls #-0x14 (addr 0xf8fe340cda0)
0xf8fe340cdb8   718  0b1b09bb       add w27, w13, w27, lsl #2
0xf8fe340cdbc   71c  b87b683b       ldr w27, [x1, x27]
0xf8fe340cdc0   720  0b0509a5       add w5, w13, w5, lsl #2
0xf8fe340cdc4   724  b8656825       ldr w5, [x1, x5]
0xf8fe340cdc8   728  6b05037f       cmp w27, w5
0xf8fe340cdcc   72c  54000103       b.lo #+0x20 (addr 0xf8fe340cdec)
0xf8fe340cdd0   730  9102013c       add x28, x9, #0x80 (128)
0xf8fe340cdd4   734  b87c683c       ldr w28, [x1, x28]
0xf8fe340cdd8   738  6b1b039f       cmp w28, w27
0xf8fe340cddc   73c  540000e2       b.hs #+0x1c (addr 0xf8fe340cdf8)
0xf8fe340cde0   740  d280009b       movz cp, #0x4
0xf8fe340cde4   744  d280001c       movz x28, #0x0
0xf8fe340cde8   748  1400000b       b #+0x2c (addr 0xf8fe340ce14)
0xf8fe340cdec   74c  d280001c       movz x28, #0x0
0xf8fe340cdf0   750  d280009b       movz cp, #0x4
0xf8fe340cdf4   754  14000008       b #+0x20 (addr 0xf8fe340ce14)
0xf8fe340cdf8   758  4b05037b       sub w27, w27, w5
0xf8fe340cdfc   75c  9101f13c       add x28, x9, #0x7c (124)
0xf8fe340ce00   760  b87c683c       ldr w28, [x1, x28]
0xf8fe340ce04   764  0b050b9c       add w28, w28, w5, lsl #2
0xf8fe340ce08   768  aa1b03f0       mov x16, cp
0xf8fe340ce0c   76c  aa1c03fb       mov cp, x28
0xf8fe340ce10   770  aa1003fc       mov x28, x16
0xf8fe340ce14   774  0b0c02d6       add w22, w22, w12
0xf8fe340ce18   778  6b1402df       cmp w22, w20
0xf8fe340ce1c   77c  54000083       b.lo #+0x10 (addr 0xf8fe340ce2c)
0xf8fe340ce20   780  d2800005       movz x5, #0x0
0xf8fe340ce24   784  aa0503f6       mov x22, x5
0xf8fe340ce28   788  14000014       b #+0x50 (addr 0xf8fe340ce78)
0xf8fe340ce2c   78c  110006c5       add w5, w22, #0x1 (1)
0xf8fe340ce30   790  6b05029f       cmp w20, w5
0xf8fe340ce34   794  54ffff69       b.ls #-0x14 (addr 0xf8fe340ce20)
0xf8fe340ce38   798  0b0509a5       add w5, w13, w5, lsl #2
0xf8fe340ce3c   79c  b8656825       ldr w5, [x1, x5]
0xf8fe340ce40   7a0  0b1609b6       add w22, w13, w22, lsl #2
0xf8fe340ce44   7a4  b8766836       ldr w22, [x1, x22]
0xf8fe340ce48   7a8  6b1600bf       cmp w5, w22
0xf8fe340ce4c   7ac  54000103       b.lo #+0x20 (addr 0xf8fe340ce6c)
0xf8fe340ce50   7b0  91020138       add x24, x9, #0x80 (128)
0xf8fe340ce54   7b4  b8786838       ldr w24, [x1, x24]
0xf8fe340ce58   7b8  6b05031f       cmp w24, w5
0xf8fe340ce5c   7bc  540000e2       b.hs #+0x1c (addr 0xf8fe340ce78)
0xf8fe340ce60   7c0  d2800096       movz x22, #0x4
0xf8fe340ce64   7c4  d2800005       movz x5, #0x0
0xf8fe340ce68   7c8  14000008       b #+0x20 (addr 0xf8fe340ce88)
0xf8fe340ce6c   7cc  d2800005       movz x5, #0x0
0xf8fe340ce70   7d0  d2800096       movz x22, #0x4
0xf8fe340ce74   7d4  14000005       b #+0x14 (addr 0xf8fe340ce88)
0xf8fe340ce78   7d8  4b1600a5       sub w5, w5, w22
0xf8fe340ce7c   7dc  9101f138       add x24, x9, #0x7c (124)
0xf8fe340ce80   7e0  b8786838       ldr w24, [x1, x24]
0xf8fe340ce84   7e4  0b160b16       add w22, w24, w22, lsl #2
0xf8fe340ce88   7e8  1100054a       add w10, w10, #0x1 (1)
0xf8fe340ce8c   7ec  1ac60950       udiv w16, w10, w6
0xf8fe340ce90   7f0  1b06aa06       msub w6, w16, w6, w10
0xf8fe340ce94   7f4  1b0b7cc6       mul w6, w6, w11
0xf8fe340ce98   7f8  0b0f00ca       add w10, w6, w15
0xf8fe340ce9c   7fc  6b14015f       cmp w10, w20
0xf8fe340cea0   800  54000083       b.lo #+0x10 (addr 0xf8fe340ceb0)
0xf8fe340cea4   804  d280000a       movz x10, #0x0
0xf8fe340cea8   808  aa0a03eb       mov x11, x10
0xf8fe340ceac   80c  14000014       b #+0x50 (addr 0xf8fe340cefc)
0xf8fe340ceb0   810  1100054b       add w11, w10, #0x1 (1)
0xf8fe340ceb4   814  6b0b029f       cmp w20, w11
0xf8fe340ceb8   818  54ffff69       b.ls #-0x14 (addr 0xf8fe340cea4)
0xf8fe340cebc   81c  0b0b09ab       add w11, w13, w11, lsl #2
0xf8fe340cec0   820  b86b682b       ldr w11, [x1, x11]
0xf8fe340cec4   824  0b0a09aa       add w10, w13, w10, lsl #2
0xf8fe340cec8   828  b86a682a       ldr w10, [x1, x10]
0xf8fe340cecc   82c  6b0a017f       cmp w11, w10
0xf8fe340ced0   830  54000103       b.lo #+0x20 (addr 0xf8fe340cef0)
0xf8fe340ced4   834  9102012f       add x15, x9, #0x80 (128)
0xf8fe340ced8   838  b86f682f       ldr w15, [x1, x15]
0xf8fe340cedc   83c  6b0b01ff       cmp w15, w11
0xf8fe340cee0   840  540000e2       b.hs #+0x1c (addr 0xf8fe340cefc)
0xf8fe340cee4   844  d280008a       movz x10, #0x4
0xf8fe340cee8   848  d280000b       movz x11, #0x0
0xf8fe340ceec   84c  14000008       b #+0x20 (addr 0xf8fe340cf0c)
0xf8fe340cef0   850  d280000b       movz x11, #0x0
0xf8fe340cef4   854  d280008a       movz x10, #0x4
0xf8fe340cef8   858  14000005       b #+0x14 (addr 0xf8fe340cf0c)
0xf8fe340cefc   85c  4b0a016b       sub w11, w11, w10
0xf8fe340cf00   860  9101f12f       add x15, x9, #0x7c (124)
0xf8fe340cf04   864  b86f682f       ldr w15, [x1, x15]
0xf8fe340cf08   868  0b0a09ea       add w10, w15, w10, lsl #2
0xf8fe340cf0c   86c  0b1700cf       add w15, w6, w23
0xf8fe340cf10   870  6b1401ff       cmp w15, w20
0xf8fe340cf14   874  54000083       b.lo #+0x10 (addr 0xf8fe340cf24)
0xf8fe340cf18   878  d280000f       movz x15, #0x0
0xf8fe340cf1c   87c  aa0f03f7       mov x23, x15
0xf8fe340cf20   880  14000014       b #+0x50 (addr 0xf8fe340cf70)
0xf8fe340cf24   884  110005f7       add w23, w15, #0x1 (1)
0xf8fe340cf28   888  6b17029f       cmp w20, w23
0xf8fe340cf2c   88c  54ffff69       b.ls #-0x14 (addr 0xf8fe340cf18)
0xf8fe340cf30   890  0b1709b7       add w23, w13, w23, lsl #2
0xf8fe340cf34   894  b8776837       ldr w23, [x1, x23]
0xf8fe340cf38   898  0b0f09af       add w15, w13, w15, lsl #2
0xf8fe340cf3c   89c  b86f682f       ldr w15, [x1, x15]
0xf8fe340cf40   8a0  6b0f02ff       cmp w23, w15
0xf8fe340cf44   8a4  54000103       b.lo #+0x20 (addr 0xf8fe340cf64)
0xf8fe340cf48   8a8  91020138       add x24, x9, #0x80 (128)
0xf8fe340cf4c   8ac  b8786838       ldr w24, [x1, x24]
0xf8fe340cf50   8b0  6b17031f       cmp w24, w23
0xf8fe340cf54   8b4  540000e2       b.hs #+0x1c (addr 0xf8fe340cf70)
0xf8fe340cf58   8b8  d280008f       movz x15, #0x4
0xf8fe340cf5c   8bc  d2800017       movz x23, #0x0
0xf8fe340cf60   8c0  14000008       b #+0x20 (addr 0xf8fe340cf80)
0xf8fe340cf64   8c4  d2800017       movz x23, #0x0
0xf8fe340cf68   8c8  d280008f       movz x15, #0x4
0xf8fe340cf6c   8cc  14000005       b #+0x14 (addr 0xf8fe340cf80)
0xf8fe340cf70   8d0  4b0f02f7       sub w23, w23, w15
0xf8fe340cf74   8d4  9101f138       add x24, x9, #0x7c (124)
0xf8fe340cf78   8d8  b8786838       ldr w24, [x1, x24]
0xf8fe340cf7c   8dc  0b0f0b0f       add w15, w24, w15, lsl #2
0xf8fe340cf80   8e0  0b0c00c6       add w6, w6, w12
0xf8fe340cf84   8e4  6b1400df       cmp w6, w20
0xf8fe340cf88   8e8  54000083       b.lo #+0x10 (addr 0xf8fe340cf98)
0xf8fe340cf8c   8ec  d2800006       movz x6, #0x0
0xf8fe340cf90   8f0  aa0603ec       mov x12, x6
0xf8fe340cf94   8f4  14000014       b #+0x50 (addr 0xf8fe340cfe4)
0xf8fe340cf98   8f8  110004cc       add w12, w6, #0x1 (1)
0xf8fe340cf9c   8fc  6b0c029f       cmp w20, w12
0xf8fe340cfa0   900  54ffff69       b.ls #-0x14 (addr 0xf8fe340cf8c)
0xf8fe340cfa4   904  0b0c09ac       add w12, w13, w12, lsl #2
0xf8fe340cfa8   908  b86c682c       ldr w12, [x1, x12]
0xf8fe340cfac   90c  0b0609a6       add w6, w13, w6, lsl #2
0xf8fe340cfb0   910  b8666826       ldr w6, [x1, x6]
0xf8fe340cfb4   914  6b06019f       cmp w12, w6
0xf8fe340cfb8   918  54000103       b.lo #+0x20 (addr 0xf8fe340cfd8)
0xf8fe340cfbc   91c  9102012d       add x13, x9, #0x80 (128)
0xf8fe340cfc0   920  b86d682d       ldr w13, [x1, x13]
0xf8fe340cfc4   924  6b0c01bf       cmp w13, w12
0xf8fe340cfc8   928  540000e2       b.hs #+0x1c (addr 0xf8fe340cfe4)
0xf8fe340cfcc   92c  d2800086       movz x6, #0x4
0xf8fe340cfd0   930  d280000c       movz x12, #0x0
0xf8fe340cfd4   934  14000008       b #+0x20 (addr 0xf8fe340cff4)
0xf8fe340cfd8   938  d280000c       movz x12, #0x0
0xf8fe340cfdc   93c  d2800086       movz x6, #0x4
0xf8fe340cfe0   940  14000005       b #+0x14 (addr 0xf8fe340cff4)
0xf8fe340cfe4   944  4b06018c       sub w12, w12, w6
0xf8fe340cfe8   948  9101f12d       add x13, x9, #0x7c (124)
0xf8fe340cfec   94c  b86d682d       ldr w13, [x1, x13]
0xf8fe340cff0   950  0b0609a6       add w6, w13, w6, lsl #2
0xf8fe340cff4   954  9101310d       add x13, x8, #0x4c (76)
0xf8fe340cff8   958  b82d682c       str w12, [x1, x13]
0xf8fe340cffc   95c  9101210c       add x12, x8, #0x48 (72)
0xf8fe340d000   960  b82c6826       str w6, [x1, x12]
0xf8fe340d004   964  91011106       add x6, x8, #0x44 (68)
0xf8fe340d008   968  b8266837       str w23, [x1, x6]
0xf8fe340d00c   96c  91010106       add x6, x8, #0x40 (64)
0xf8fe340d010   970  b826682f       str w15, [x1, x6]
0xf8fe340d014   974  9100f106       add x6, x8, #0x3c (60)
0xf8fe340d018   978  b826682b       str w11, [x1, x6]
0xf8fe340d01c   97c  9100e106       add x6, x8, #0x38 (56)
0xf8fe340d020   980  b826682a       str w10, [x1, x6]
0xf8fe340d024   984  9100d106       add x6, x8, #0x34 (52)
0xf8fe340d028   988  b8266825       str w5, [x1, x6]
0xf8fe340d02c   98c  9100c106       add x6, x8, #0x30 (48)
0xf8fe340d030   990  b8266836       str w22, [x1, x6]
0xf8fe340d034   994  9100b106       add x6, x8, #0x2c (44)
0xf8fe340d038   998  b826683c       str w28, [x1, x6]
0xf8fe340d03c   99c  9100a106       add x6, x8, #0x28 (40)
0xf8fe340d040   9a0  b826683b       str w27, [x1, x6]
0xf8fe340d044   9a4  91009106       add x6, x8, #0x24 (36)
0xf8fe340d048   9a8  b8266823       str w3, [x1, x6]
0xf8fe340d04c   9ac  91008106       add x6, x8, #0x20 (32)
0xf8fe340d050   9b0  b8266820       str w0, [x1, x6]
0xf8fe340d054   9b4  91007106       add x6, x8, #0x1c (28)
0xf8fe340d058   9b8  b8266824       str w4, [x1, x6]
0xf8fe340d05c   9bc  91006106       add x6, x8, #0x18 (24)
0xf8fe340d060   9c0  b826682e       str w14, [x1, x6]
0xf8fe340d064   9c4  91005106       add x6, x8, #0x14 (20)
0xf8fe340d068   9c8  b8266827       str w7, [x1, x6]
0xf8fe340d06c   9cc  91004106       add x6, x8, #0x10 (16)
0xf8fe340d070   9d0  b8266822       str w2, [x1, x6]
0xf8fe340d074   9d4  91003106       add x6, x8, #0xc (12)
0xf8fe340d078   9d8  b8266835       str w21, [x1, x6]
0xf8fe340d07c   9dc  91002106       add x6, x8, #0x8 (8)
0xf8fe340d080   9e0  b8266833       str w19, [x1, x6]
0xf8fe340d084   9e4  d2c00126       movz x6, #0x900000000
0xf8fe340d088   9e8  f8286826       str x6, [x1, x8]
0xf8fe340d08c   9ec  f9403be6       ldr x6, [sp, #112]
0xf8fe340d090   9f0  6b1900df       cmp w6, w25
0xf8fe340d094   9f4  1a9930ca       csel w10, w6, w25, lo
0xf8fe340d098   9f8  f9406fe6       ldr x6, [sp, #216]
0xf8fe340d09c   9fc  f9406beb       ldr x11, [sp, #208]
0xf8fe340d0a0   a00  6b0b00df       cmp w6, w11
0xf8fe340d0a4   a04  1a8b30cc       csel w12, w6, w11, lo
0xf8fe340d0a8   a08  6b0c015f       cmp w10, w12
0xf8fe340d0ac   a0c  1a8c3146       csel w6, w10, w12, lo
0xf8fe340d0b0   a10  2f00e40a       movi d10, #0x0
0xf8fe340d0b4   a14  f94003f6       ldr x22, [sp]
0xf8fe340d0b8   a18  d280000a       movz x10, #0x0
0xf8fe340d0bc   a1c  f94013ee       ldr x14, [sp, #32]
0xf8fe340d0c0   a20  f9400fed       ldr x13, [sp, #24]
0xf8fe340d0c4   a24  f9400bec       ldr x12, [sp, #16]
0xf8fe340d0c8   a28  f94007eb       ldr x11, [sp, #8]
0xf8fe340d0cc   a2c  4eaa1d4b       mov v11.16b, v10.16b
0xf8fe340d0d0   a30  f852034f       ldur x15, [x26, #-224]
0xf8fe340d0d4   a34  eb2f63ff       cmp sp, x15
0xf8fe340d0d8   a38  54002ee9       b.ls #+0x5dc (addr 0xf8fe340d6b4)
0xf8fe340d0dc   a3c  0b0a0ecf       add w15, w22, w10, lsl #3
0xf8fe340d0e0   a40  910011f3       add x19, x15, #0x4 (4)
0xf8fe340d0e4   a44  b8736833       ldr w19, [x1, x19]
0xf8fe340d0e8   a48  34000933       cbz w19, #+0x124 (addr 0xf8fe340d20c)
0xf8fe340d0ec   a4c  b86f682f       ldr w15, [x1, x15]
0xf8fe340d0f0   a50  0b1309f3       add w19, w15, w19, lsl #2
0xf8fe340d0f4   a54  f8520354       ldur x20, [x26, #-224]
0xf8fe340d0f8   a58  eb3463ff       cmp sp, x20
0xf8fe340d0fc   a5c  54003109       b.ls #+0x620 (addr 0xf8fe340d71c)
0xf8fe340d100   a60  110011f4       add w20, w15, #0x4 (4)
0xf8fe340d104   a64  b86f682f       ldr w15, [x1, x15]
0xf8fe340d108   a68  6b0f00df       cmp w6, w15
0xf8fe340d10c   a6c  54000328       b.hi #+0x64 (addr 0xf8fe340d170)
0xf8fe340d110   a70  6b13029f       cmp w20, w19
0xf8fe340d114   a74  540007c0       b.eq #+0xf8 (addr 0xf8fe340d20c)
0xf8fe340d118   a78  1100128f       add w15, w20, #0x4 (4)
0xf8fe340d11c   a7c  b8746834       ldr w20, [x1, x20]
0xf8fe340d120   a80  6b1400df       cmp w6, w20
0xf8fe340d124   a84  540002c8       b.hi #+0x58 (addr 0xf8fe340d17c)
0xf8fe340d128   a88  6b1301ff       cmp w15, w19
0xf8fe340d12c   a8c  54000700       b.eq #+0xe0 (addr 0xf8fe340d20c)
0xf8fe340d130   a90  110011f4       add w20, w15, #0x4 (4)
0xf8fe340d134   a94  b86f682f       ldr w15, [x1, x15]
0xf8fe340d138   a98  6b0f00df       cmp w6, w15
0xf8fe340d13c   a9c  540001a8       b.hi #+0x34 (addr 0xf8fe340d170)
0xf8fe340d140   aa0  6b13029f       cmp w20, w19
0xf8fe340d144   aa4  54000640       b.eq #+0xc8 (addr 0xf8fe340d20c)
0xf8fe340d148   aa8  f852034f       ldur x15, [x26, #-224]
0xf8fe340d14c   aac  eb2f63ff       cmp sp, x15
0xf8fe340d150   ab0  54003229       b.ls #+0x644 (addr 0xf8fe340d794)
0xf8fe340d154   ab4  1100128f       add w15, w20, #0x4 (4)
0xf8fe340d158   ab8  b8746834       ldr w20, [x1, x20]
0xf8fe340d15c   abc  6b1400df       cmp w6, w20
0xf8fe340d160   ac0  540000e8       b.hi #+0x1c (addr 0xf8fe340d17c)
0xf8fe340d164   ac4  6b1301ff       cmp w15, w19
0xf8fe340d168   ac8  54000520       b.eq #+0xa4 (addr 0xf8fe340d20c)
0xf8fe340d16c   acc  17ffffe5       b #-0x6c (addr 0xf8fe340d100)
0xf8fe340d170   ad0  aa1403f0       mov x16, x20
0xf8fe340d174   ad4  aa0f03f4       mov x20, x15
0xf8fe340d178   ad8  aa1003ef       mov x15, x16
0xf8fe340d17c   adc  531e7694       lsl w20, w20, #2
0xf8fe340d180   ae0  0b140175       add w21, w11, w20
0xf8fe340d184   ae4  0b140197       add w23, w12, w20
0xf8fe340d188   ae8  0b1401b8       add w24, w13, w20
0xf8fe340d18c   aec  bc78682c       ldr s12, [x1, x24]
0xf8fe340d190   af0  0b1401d4       add w20, w14, w20
0xf8fe340d194   af4  bc74682d       ldr s13, [x1, x20]
0xf8fe340d198   af8  1e2d38cd       fsub s13, s6, s13
0xf8fe340d19c   afc  1e2d2080       fcmp s4, s13
0xf8fe340d1a0   b00  540000a3       b.lo #+0x14 (addr 0xf8fe340d1b4)
0xf8fe340d1a4   b04  1e2321a0       fcmp s13, s3
0xf8fe340d1a8   b08  54000082       b.hs #+0x10 (addr 0xf8fe340d1b8)
0xf8fe340d1ac   b0c  1e2d284d       fadd s13, s2, s13
0xf8fe340d1b0   b10  14000002       b #+0x8 (addr 0xf8fe340d1b8)
0xf8fe340d1b4   b14  1e2239ad       fsub s13, s13, s2
0xf8fe340d1b8   b18  bc75682e       ldr s14, [x1, x21]
0xf8fe340d1bc   b1c  bc776830       ldr s16, [x1, x23]
0xf8fe340d1c0   b20  1e2c392c       fsub s12, s9, s12
0xf8fe340d1c4   b24  1e2c2080       fcmp s4, s12
0xf8fe340d1c8   b28  540000a3       b.lo #+0x14 (addr 0xf8fe340d1dc)
0xf8fe340d1cc   b2c  1e232180       fcmp s12, s3
0xf8fe340d1d0   b30  54000082       b.hs #+0x10 (addr 0xf8fe340d1e0)
0xf8fe340d1d4   b34  1e2c284c       fadd s12, s2, s12
0xf8fe340d1d8   b38  14000002       b #+0x8 (addr 0xf8fe340d1e0)
0xf8fe340d1dc   b3c  1e22398c       fsub s12, s12, s2
0xf8fe340d1e0   b40  1e302970       fadd s16, s11, s16
0xf8fe340d1e4   b44  1e2d09ad       fmul s13, s13, s13
0xf8fe340d1e8   b48  1e2c098c       fmul s12, s12, s12
0xf8fe340d1ec   b4c  1e2c29ac       fadd s12, s13, s12
0xf8fe340d1f0   b50  1e212180       fcmp s12, s1
0xf8fe340d1f4   b54  1e2b3e0b       fcsel s11, s16, s11, lo
0xf8fe340d1f8   b58  1e2e294d       fadd s13, s10, s14
0xf8fe340d1fc   b5c  1e212180       fcmp s12, s1
0xf8fe340d200   b60  1e2a3daa       fcsel s10, s13, s10, lo
0xf8fe340d204   b64  6b1301ff       cmp w15, w19
0xf8fe340d208   b68  54fff761       b.ne #-0x114 (addr 0xf8fe340d0f4)
0xf8fe340d20c   b6c  1100054a       add w10, w10, #0x1 (1)
0xf8fe340d210   b70  7100255f       cmp w10, #0x9 (9)
0xf8fe340d214   b74  54fff5e1       b.ne #-0x144 (addr 0xf8fe340d0d0)
0xf8fe340d218   b78  f94027eb       ldr x11, [sp, #72]
0xf8fe340d21c   b7c  f94033ec       ldr x12, [sp, #96]
0xf8fe340d220   b80  f94077ed       ldr x13, [sp, #232]
0xf8fe340d224   b84  f94063e2       ldr x2, [sp, #192]
0xf8fe340d228   b88  1e2b096c       fmul s12, s11, s11
0xf8fe340d22c   b8c  1e2a094d       fmul s13, s10, s10
0xf8fe340d230   b90  1e2d298c       fadd s12, s12, s13
0xf8fe340d234   b94  1e202188       fcmp s12, #0.0
0xf8fe340d238   b98  5400010c       b.gt #+0x20 (addr 0xf8fe340d258)
0xf8fe340d23c   b9c  91028126       add x6, x9, #0xa0 (160)
0xf8fe340d240   ba0  f866682a       ldr x10, [x1, x6]
0xf8fe340d244   ba4  9100054a       add x10, x10, #0x1 (1)
0xf8fe340d248   ba8  f826682a       str x10, [x1, x6]
0xf8fe340d24c   bac  4ea81d0b       mov v11.16b, v8.16b
0xf8fe340d250   bb0  4ea71cea       mov v10.16b, v7.16b
0xf8fe340d254   bb4  14000004       b #+0x10 (addr 0xf8fe340d264)
0xf8fe340d258   bb8  1e21c18c       fsqrt s12, s12
0xf8fe340d25c   bbc  1e2c194a       fdiv s10, s10, s12
0xf8fe340d260   bc0  1e2c196b       fdiv s11, s11, s12
0xf8fe340d264   bc4  91024126       add x6, x9, #0x90 (144)
0xf8fe340d268   bc8  f866682a       ldr x10, [x1, x6]
0xf8fe340d26c   bcc  d28f82ae       movz x14, #0x7c15
0xf8fe340d270   bd0  f2afe94e       movk x14, #0x7f4a, lsl #16
0xf8fe340d274   bd4  f2cf372e       movk x14, #0x79b9, lsl #32
0xf8fe340d278   bd8  f2f3c6ee       movk x14, #0x9e37, lsl #48
0xf8fe340d27c   bdc  8b0e014a       add x10, x10, x14
0xf8fe340d280   be0  f826682a       str x10, [x1, x6]
0xf8fe340d284   be4  ca4a7946       eor x6, x10, x10, lsr #30
0xf8fe340d288   be8  d29cb72a       movz x10, #0xe5b9
0xf8fe340d28c   bec  f2a39c8a       movk x10, #0x1ce4, lsl #16
0xf8fe340d290   bf0  f2c8edaa       movk x10, #0x476d, lsl #32
0xf8fe340d294   bf4  f2f7eb0a       movk x10, #0xbf58, lsl #48
0xf8fe340d298   bf8  9b0a7cc6       mul x6, x6, x10
0xf8fe340d29c   bfc  ca466cc6       eor x6, x6, x6, lsr #27
0xf8fe340d2a0   c00  d2823d6a       movz x10, #0x11eb
0xf8fe340d2a4   c04  f2a2662a       movk x10, #0x1331, lsl #16
0xf8fe340d2a8   c08  f2c9376a       movk x10, #0x49bb, lsl #32
0xf8fe340d2ac   c0c  f2f29a0a       movk x10, #0x94d0, lsl #48
0xf8fe340d2b0   c10  9b0a7cc6       mul x6, x6, x10
0xf8fe340d2b4   c14  d36bfcca       lsr x10, x6, #43
0xf8fe340d2b8   c18  ca463146       eor x6, x10, x6, lsr #12
0xf8fe340d2bc   c1c  b24c24c6       orr x6, x6, #0x3ff0000000000000
0xf8fe340d2c0   c20  9e6700cc       fmov d12, x6
0xf8fe340d2c4   c24  1e7e100d       fmov d13, #0xf0 (-1.0000)
0xf8fe340d2c8   c28  1e6d298c       fadd d12, d12, d13
0xf8fe340d2cc   c2c  1e7c100d       fmov d13, #0xe0 (-0.5000)
0xf8fe340d2d0   c30  1e6d298c       fadd d12, d12, d13
0xf8fe340d2d4   c34  9102d126       add x6, x9, #0xb4 (180)
0xf8fe340d2d8   c38  bc66682d       ldr s13, [x1, x6]
0xf8fe340d2dc   c3c  1e22c1ad       fcvt d13, s13
0xf8fe340d2e0   c40  1e6d098c       fmul d12, d12, d13
0xf8fe340d2e4   c44  1e624180       fcvt s0, d12
0xf8fe340d2e8   c48  fd006fea       str d10, [sp, #216]
0xf8fe340d2ec   c4c  fd006beb       str d11, [sp, #208]
0xf8fe340d2f0   c50  fd003be0       str d0, [sp, #112]
0xf8fe340d2f4   c54  f9408be7       ldr x7, [sp, #272]
0xf8fe340d2f8   c58  97fabf01       bl #-0x1503fc (addr 0xf8fe32bcefc)
0xf8fe340d2fc   c5c  fd0037e0       str d0, [sp, #104]
0xf8fe340d300   c60  fd403be0       ldr d0, [sp, #112]
0xf8fe340d304   c64  f9408be7       ldr x7, [sp, #272]
0xf8fe340d308   c68  97fabefe       bl #-0x150408 (addr 0xf8fe32bcf00)
0xf8fe340d30c   c6c  f9407be1       ldr x1, [sp, #240]
0xf8fe340d310   c70  9102c026       add x6, x1, #0xb0 (176)
0xf8fe340d314   c74  f9407fe8       ldr x8, [sp, #248]
0xf8fe340d318   c78  bc666901       ldr s1, [x8, x6]
0xf8fe340d31c   c7c  fd403fe2       ldr d2, [sp, #120]
0xf8fe340d320   c80  1e210842       fmul s2, s2, s1
0xf8fe340d324   c84  fd4043e3       ldr d3, [sp, #128]
0xf8fe340d328   c88  1e222862       fadd s2, s3, s2
0xf8fe340d32c   c8c  f94047e6       ldr x6, [sp, #136]
0xf8fe340d330   c90  bc666903       ldr s3, [x8, x6]
0xf8fe340d334   c94  1e222060       fcmp s3, s2
0xf8fe340d338   c98  540000a9       b.ls #+0x14 (addr 0xf8fe340d34c)
0xf8fe340d33c   c9c  1e202048       fcmp s2, #0.0
0xf8fe340d340   ca0  54000082       b.hs #+0x10 (addr 0xf8fe340d350)
0xf8fe340d344   ca4  1e222862       fadd s2, s3, s2
0xf8fe340d348   ca8  14000002       b #+0x8 (addr 0xf8fe340d350)
0xf8fe340d34c   cac  1e233842       fsub s2, s2, s3
0xf8fe340d350   cb0  fd404be4       ldr d4, [sp, #144]
0xf8fe340d354   cb4  1e210881       fmul s1, s4, s1
0xf8fe340d358   cb8  fd404fe4       ldr d4, [sp, #152]
0xf8fe340d35c   cbc  1e212881       fadd s1, s4, s1
0xf8fe340d360   cc0  1e212060       fcmp s3, s1
0xf8fe340d364   cc4  540000a9       b.ls #+0x14 (addr 0xf8fe340d378)
0xf8fe340d368   cc8  1e202028       fcmp s1, #0.0
0xf8fe340d36c   ccc  54000082       b.hs #+0x10 (addr 0xf8fe340d37c)
0xf8fe340d370   cd0  1e212861       fadd s1, s3, s1
0xf8fe340d374   cd4  14000002       b #+0x8 (addr 0xf8fe340d37c)
0xf8fe340d378   cd8  1e233821       fsub s1, s1, s3
0xf8fe340d37c   cdc  f94073ea       ldr x10, [sp, #224]
0xf8fe340d380   ce0  f94053e9       ldr x9, [sp, #160]
0xf8fe340d384   ce4  6b0a013f       cmp w9, w10
0xf8fe340d388   ce8  540004c9       b.ls #+0x98 (addr 0xf8fe340d420)
0xf8fe340d38c   cec  f94063eb       ldr x11, [sp, #192]
0xf8fe340d390   cf0  f94057ec       ldr x12, [sp, #168]
0xf8fe340d394   cf4  0b0b018d       add w13, w12, w11
0xf8fe340d398   cf8  1e222060       fcmp s3, s2
0xf8fe340d39c   cfc  1e229de2       fcsel s2, s15, s2, ls
0xf8fe340d3a0   d00  bc2d6902       str s2, [x8, x13]
0xf8fe340d3a4   d04  f9405bed       ldr x13, [sp, #176]
0xf8fe340d3a8   d08  0b0b01ae       add w14, w13, w11
0xf8fe340d3ac   d0c  1e212060       fcmp s3, s1
0xf8fe340d3b0   d10  1e219de1       fcsel s1, s15, s1, ls
0xf8fe340d3b4   d14  bc2e6901       str s1, [x8, x14]
0xf8fe340d3b8   d18  f9405fee       ldr x14, [sp, #184]
0xf8fe340d3bc   d1c  0b0b01cf       add w15, w14, w11
0xf8fe340d3c0   d20  fd406beb       ldr d11, [sp, #208]
0xf8fe340d3c4   d24  1e200961       fmul s1, s11, s0
0xf8fe340d3c8   d28  fd406fea       ldr d10, [sp, #216]
0xf8fe340d3cc   d2c  fd4037e2       ldr d2, [sp, #104]
0xf8fe340d3d0   d30  1e220943       fmul s3, s10, s2
0xf8fe340d3d4   d34  1e233821       fsub s1, s1, s3
0xf8fe340d3d8   d38  bc2f6901       str s1, [x8, x15]
0xf8fe340d3dc   d3c  f94067ef       ldr x15, [sp, #200]
0xf8fe340d3e0   d40  0b0b01eb       add w11, w15, w11
0xf8fe340d3e4   d44  1e220961       fmul s1, s11, s2
0xf8fe340d3e8   d48  1e200942       fmul s2, s10, s0
0xf8fe340d3ec   d4c  1e222821       fadd s1, s1, s2
0xf8fe340d3f0   d50  bc2b6901       str s1, [x8, x11]
0xf8fe340d3f4   d54  aa0103e9       mov x9, x1
0xf8fe340d3f8   d58  aa0803e1       mov x1, x8
0xf8fe340d3fc   d5c  f94083e8       ldr x8, [sp, #256]
0xf8fe340d400   d60  f94077ed       ldr x13, [sp, #232]
0xf8fe340d404   d64  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d408   d68  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d40c   d6c  fd401be3       ldr d3, [sp, #48]
0xf8fe340d410   d70  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d414   d74  f94033ec       ldr x12, [sp, #96]
0xf8fe340d418   d78  f94027eb       ldr x11, [sp, #72]
0xf8fe340d41c   d7c  1400000b       b #+0x2c (addr 0xf8fe340d448)
0xf8fe340d420   d80  aa0103e9       mov x9, x1
0xf8fe340d424   d84  aa0803e1       mov x1, x8
0xf8fe340d428   d88  f94083e8       ldr x8, [sp, #256]
0xf8fe340d42c   d8c  f94077ed       ldr x13, [sp, #232]
0xf8fe340d430   d90  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d434   d94  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d438   d98  fd401be3       ldr d3, [sp, #48]
0xf8fe340d43c   d9c  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d440   da0  f94033ec       ldr x12, [sp, #96]
0xf8fe340d444   da4  f94027eb       ldr x11, [sp, #72]
0xf8fe340d448   da8  1100054a       add w10, w10, #0x1 (1)
0xf8fe340d44c   dac  aa0d03e6       mov x6, x13
0xf8fe340d450   db0  6b06015f       cmp w10, w6
0xf8fe340d454   db4  54ffa261       b.ne #-0xbb4 (addr 0xf8fe340c8a0)
0xf8fe340d458   db8  14000011       b #+0x44 (addr 0xf8fe340d49c)
0xf8fe340d45c   dbc  d286bf00       movz x0, #0x35f8
0xf8fe340d460   dc0  f2a002c0       movk x0, #0x16, lsl #16
0xf8fe340d464   dc4  f9408be7       ldr x7, [sp, #272]
0xf8fe340d468   dc8  97fabbb6       bl #-0x151128 (addr 0xf8fe32bc340)
0xf8fe340d46c   dcc  d2800001       movz x1, #0x0
0xf8fe340d470   dd0  6a01003f       tst w1, w1
0xf8fe340d474   dd4  54001ce0       b.eq #+0x39c (addr 0xf8fe340d810)
0xf8fe340d478   dd8  d4200000       brk #0x0
0xf8fe340d47c   ddc  d286bf00       movz x0, #0x35f8
0xf8fe340d480   de0  f2a002c0       movk x0, #0x16, lsl #16
0xf8fe340d484   de4  f9408be7       ldr x7, [sp, #272]
0xf8fe340d488   de8  97fabbae       bl #-0x151148 (addr 0xf8fe32bc340)
0xf8fe340d48c   dec  d2800001       movz x1, #0x0
0xf8fe340d490   df0  6a01003f       tst w1, w1
0xf8fe340d494   df4  54001bc0       b.eq #+0x378 (addr 0xf8fe340d80c)
0xf8fe340d498   df8  d4200000       brk #0x0
0xf8fe340d49c   dfc  f94087e6       ldr x6, [sp, #264]
0xf8fe340d4a0   e00  9100c12a       add x10, x9, #0x30 (48)
0xf8fe340d4a4   e04  3cea6821       ldr q1, [x1, x10]
0xf8fe340d4a8   e08  3ce96822       ldr q2, [x1, x9]
0xf8fe340d4ac   e0c  3caa6822       str q2, [x1, x10]
0xf8fe340d4b0   e10  3ca96821       str q1, [x1, x9]
0xf8fe340d4b4   e14  9101012a       add x10, x9, #0x40 (64)
0xf8fe340d4b8   e18  3cea6821       ldr q1, [x1, x10]
0xf8fe340d4bc   e1c  9100412b       add x11, x9, #0x10 (16)
0xf8fe340d4c0   e20  3ceb6822       ldr q2, [x1, x11]
0xf8fe340d4c4   e24  3caa6822       str q2, [x1, x10]
0xf8fe340d4c8   e28  3cab6821       str q1, [x1, x11]
0xf8fe340d4cc   e2c  9101412a       add x10, x9, #0x50 (80)
0xf8fe340d4d0   e30  3cea6821       ldr q1, [x1, x10]
0xf8fe340d4d4   e34  9100812b       add x11, x9, #0x20 (32)
0xf8fe340d4d8   e38  3ceb6822       ldr q2, [x1, x11]
0xf8fe340d4dc   e3c  3caa6822       str q2, [x1, x10]
0xf8fe340d4e0   e40  3cab6821       str q1, [x1, x11]
0xf8fe340d4e4   e44  91026129       add x9, x9, #0x98 (152)
0xf8fe340d4e8   e48  f869682a       ldr x10, [x1, x9]
0xf8fe340d4ec   e4c  9100054a       add x10, x10, #0x1 (1)
0xf8fe340d4f0   e50  f829682a       str x10, [x1, x9]
0xf8fe340d4f4   e54  aa0803e1       mov x1, x8
0xf8fe340d4f8   e58  11014021       add w1, w1, #0x50 (80)
0xf8fe340d4fc   e5c  b90000c1       str w1, [x6]
0xf8fe340d500   e60  910003bf       mov sp, fp
0xf8fe340d504   e64  a8c17bfd       ldp fp, lr, [sp], #16
0xf8fe340d508   e68  d65f03c0       ret
0xf8fe340d50c   e6c  f9006be0       str x0, [sp, #208]
0xf8fe340d510   e70  97fac1b0       bl #-0x14f940 (addr 0xf8fe32bdbd0)
0xf8fe340d514   e74  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d518   e78  f9408be7       ldr x7, [sp, #272]
0xf8fe340d51c   e7c  f9406be0       ldr x0, [sp, #208]
0xf8fe340d520   e80  17fffc6a       b #-0xe58 (addr 0xf8fe340c6c8)
0xf8fe340d524   e84  1e642080       fcmp d4, d4
0xf8fe340d528   e88  54000060       b.eq #+0xc (addr 0xf8fe340d534)
0xf8fe340d52c   e8c  d280000c       movz x12, #0x0
0xf8fe340d530   e90  17fffc92       b #-0xdb8 (addr 0xf8fe340c778)
0xf8fe340d534   e94  1e202068       fcmp s3, #0.0
0xf8fe340d538   e98  54ffffa3       b.lo #-0xc (addr 0xf8fe340d52c)
0xf8fe340d53c   e9c  9280000c       movn x12, #0x0
0xf8fe340d540   ea0  17fffc8e       b #-0xdc8 (addr 0xf8fe340c778)
0xf8fe340d544   ea4  f90073ea       str x10, [sp, #224]
0xf8fe340d548   ea8  97fac1a2       bl #-0x14f978 (addr 0xf8fe32bdbd0)
0xf8fe340d54c   eac  f94083e8       ldr x8, [sp, #256]
0xf8fe340d550   eb0  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d554   eb4  f9407be9       ldr x9, [sp, #240]
0xf8fe340d558   eb8  f94077ed       ldr x13, [sp, #232]
0xf8fe340d55c   ebc  f94073ea       ldr x10, [sp, #224]
0xf8fe340d560   ec0  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d564   ec4  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d568   ec8  fd401be3       ldr d3, [sp, #48]
0xf8fe340d56c   ecc  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d570   ed0  f94033ec       ldr x12, [sp, #96]
0xf8fe340d574   ed4  f94027eb       ldr x11, [sp, #72]
0xf8fe340d578   ed8  17fffcce       b #-0xcc8 (addr 0xf8fe340c8b0)
0xf8fe340d57c   edc  fd006fea       str d10, [sp, #216]
0xf8fe340d580   ee0  fd006beb       str d11, [sp, #208]
0xf8fe340d584   ee4  f9002be6       str x6, [sp, #80]
0xf8fe340d588   ee8  f9003bf9       str x25, [sp, #112]
0xf8fe340d58c   eec  97fac191       bl #-0x14f9bc (addr 0xf8fe32bdbd0)
0xf8fe340d590   ef0  f94083e8       ldr x8, [sp, #256]
0xf8fe340d594   ef4  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d598   ef8  f9407be9       ldr x9, [sp, #240]
0xf8fe340d59c   efc  f94077ed       ldr x13, [sp, #232]
0xf8fe340d5a0   f00  f94063e2       ldr x2, [sp, #192]
0xf8fe340d5a4   f04  fd404fe9       ldr d9, [sp, #152]
0xf8fe340d5a8   f08  fd404be7       ldr d7, [sp, #144]
0xf8fe340d5ac   f0c  fd4043e6       ldr d6, [sp, #128]
0xf8fe340d5b0   f10  fd403fe8       ldr d8, [sp, #120]
0xf8fe340d5b4   f14  fd406fea       ldr d10, [sp, #216]
0xf8fe340d5b8   f18  fd406beb       ldr d11, [sp, #208]
0xf8fe340d5bc   f1c  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d5c0   f20  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d5c4   f24  fd401be3       ldr d3, [sp, #48]
0xf8fe340d5c8   f28  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d5cc   f2c  f94013e0       ldr x0, [sp, #32]
0xf8fe340d5d0   f30  f9400fe5       ldr x5, [sp, #24]
0xf8fe340d5d4   f34  f9400be4       ldr x4, [sp, #16]
0xf8fe340d5d8   f38  f94007e3       ldr x3, [sp, #8]
0xf8fe340d5dc   f3c  f9402be6       ldr x6, [sp, #80]
0xf8fe340d5e0   f40  f9403bf9       ldr x25, [sp, #112]
0xf8fe340d5e4   f44  f94033ec       ldr x12, [sp, #96]
0xf8fe340d5e8   f48  f94027eb       ldr x11, [sp, #72]
0xf8fe340d5ec   f4c  17fffced       b #-0xc4c (addr 0xf8fe340c9a0)
0xf8fe340d5f0   f50  fd006fea       str d10, [sp, #216]
0xf8fe340d5f4   f54  fd006beb       str d11, [sp, #208]
0xf8fe340d5f8   f58  f9002be6       str x6, [sp, #80]
0xf8fe340d5fc   f5c  f90037fb       str cp, [sp, #104]
0xf8fe340d600   f60  f9002ff8       str x24, [sp, #88]
0xf8fe340d604   f64  f9003bf9       str x25, [sp, #112]
0xf8fe340d608   f68  97fac172       bl #-0x14fa38 (addr 0xf8fe32bdbd0)
0xf8fe340d60c   f6c  f94083e8       ldr x8, [sp, #256]
0xf8fe340d610   f70  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d614   f74  f9407be9       ldr x9, [sp, #240]
0xf8fe340d618   f78  f94077ed       ldr x13, [sp, #232]
0xf8fe340d61c   f7c  f94063e2       ldr x2, [sp, #192]
0xf8fe340d620   f80  fd404fe9       ldr d9, [sp, #152]
0xf8fe340d624   f84  fd404be7       ldr d7, [sp, #144]
0xf8fe340d628   f88  fd4043e6       ldr d6, [sp, #128]
0xf8fe340d62c   f8c  fd403fe8       ldr d8, [sp, #120]
0xf8fe340d630   f90  fd406fea       ldr d10, [sp, #216]
0xf8fe340d634   f94  fd406beb       ldr d11, [sp, #208]
0xf8fe340d638   f98  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d63c   f9c  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d640   fa0  fd401be3       ldr d3, [sp, #48]
0xf8fe340d644   fa4  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d648   fa8  f94013e0       ldr x0, [sp, #32]
0xf8fe340d64c   fac  f9400fe5       ldr x5, [sp, #24]
0xf8fe340d650   fb0  f9400be4       ldr x4, [sp, #16]
0xf8fe340d654   fb4  f94007e3       ldr x3, [sp, #8]
0xf8fe340d658   fb8  f9402be6       ldr x6, [sp, #80]
0xf8fe340d65c   fbc  f94037fb       ldr cp, [sp, #104]
0xf8fe340d660   fc0  f9402ff8       ldr x24, [sp, #88]
0xf8fe340d664   fc4  f9403bf9       ldr x25, [sp, #112]
0xf8fe340d668   fc8  f94033ec       ldr x12, [sp, #96]
0xf8fe340d66c   fcc  f94027eb       ldr x11, [sp, #72]
0xf8fe340d670   fd0  17fffcdc       b #-0xc90 (addr 0xf8fe340c9e0)
0xf8fe340d674   fd4  1e6c2180       fcmp d12, d12
0xf8fe340d678   fd8  54000060       b.eq #+0xc (addr 0xf8fe340d684)
0xf8fe340d67c   fdc  d280000e       movz x14, #0x0
0xf8fe340d680   fe0  17fffd1e       b #-0xb88 (addr 0xf8fe340caf8)
0xf8fe340d684   fe4  1e202168       fcmp s11, #0.0
0xf8fe340d688   fe8  54ffffa3       b.lo #-0xc (addr 0xf8fe340d67c)
0xf8fe340d68c   fec  9280000e       movn x14, #0x0
0xf8fe340d690   ff0  17fffd1a       b #-0xb98 (addr 0xf8fe340caf8)
0xf8fe340d694   ff4  1e6b2160       fcmp d11, d11
0xf8fe340d698   ff8  54000060       b.eq #+0xc (addr 0xf8fe340d6a4)
0xf8fe340d69c   ffc  d280000f       movz x15, #0x0
0xf8fe340d6a0  1000  17fffd30       b #-0xb40 (addr 0xf8fe340cb60)
0xf8fe340d6a4  1004  1e202148       fcmp s10, #0.0
0xf8fe340d6a8  1008  54ffffa3       b.lo #-0xc (addr 0xf8fe340d69c)
0xf8fe340d6ac  100c  9280000f       movn x15, #0x0
0xf8fe340d6b0  1010  17fffd2c       b #-0xb50 (addr 0xf8fe340cb60)
0xf8fe340d6b4  1014  f9003bea       str x10, [sp, #112]
0xf8fe340d6b8  1018  fd006fea       str d10, [sp, #216]
0xf8fe340d6bc  101c  fd006beb       str d11, [sp, #208]
0xf8fe340d6c0  1020  f9002be6       str x6, [sp, #80]
0xf8fe340d6c4  1024  97fac143       bl #-0x14faf4 (addr 0xf8fe32bdbd0)
0xf8fe340d6c8  1028  f94083e8       ldr x8, [sp, #256]
0xf8fe340d6cc  102c  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d6d0  1030  f9407be9       ldr x9, [sp, #240]
0xf8fe340d6d4  1034  fd404fe9       ldr d9, [sp, #152]
0xf8fe340d6d8  1038  fd404be7       ldr d7, [sp, #144]
0xf8fe340d6dc  103c  fd4043e6       ldr d6, [sp, #128]
0xf8fe340d6e0  1040  fd403fe8       ldr d8, [sp, #120]
0xf8fe340d6e4  1044  f9403bea       ldr x10, [sp, #112]
0xf8fe340d6e8  1048  fd406fea       ldr d10, [sp, #216]
0xf8fe340d6ec  104c  fd406beb       ldr d11, [sp, #208]
0xf8fe340d6f0  1050  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d6f4  1054  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d6f8  1058  fd401be3       ldr d3, [sp, #48]
0xf8fe340d6fc  105c  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d700  1060  f94013ee       ldr x14, [sp, #32]
0xf8fe340d704  1064  f9400fed       ldr x13, [sp, #24]
0xf8fe340d708  1068  f9400bec       ldr x12, [sp, #16]
0xf8fe340d70c  106c  f94007eb       ldr x11, [sp, #8]
0xf8fe340d710  1070  f9402be6       ldr x6, [sp, #80]
0xf8fe340d714  1074  f94003f6       ldr x22, [sp]
0xf8fe340d718  1078  17fffe71       b #-0x63c (addr 0xf8fe340d0dc)
0xf8fe340d71c  107c  f9003bea       str x10, [sp, #112]
0xf8fe340d720  1080  fd006fea       str d10, [sp, #216]
0xf8fe340d724  1084  fd006beb       str d11, [sp, #208]
0xf8fe340d728  1088  f90037f3       str x19, [sp, #104]
0xf8fe340d72c  108c  f9002be6       str x6, [sp, #80]
0xf8fe340d730  1090  f9002fef       str x15, [sp, #88]
0xf8fe340d734  1094  97fac127       bl #-0x14fb64 (addr 0xf8fe32bdbd0)
0xf8fe340d738  1098  f94083e8       ldr x8, [sp, #256]
0xf8fe340d73c  109c  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d740  10a0  f9407be9       ldr x9, [sp, #240]
0xf8fe340d744  10a4  fd404fe9       ldr d9, [sp, #152]
0xf8fe340d748  10a8  fd404be7       ldr d7, [sp, #144]
0xf8fe340d74c  10ac  fd4043e6       ldr d6, [sp, #128]
0xf8fe340d750  10b0  fd403fe8       ldr d8, [sp, #120]
0xf8fe340d754  10b4  f9403bea       ldr x10, [sp, #112]
0xf8fe340d758  10b8  fd406fea       ldr d10, [sp, #216]
0xf8fe340d75c  10bc  fd406beb       ldr d11, [sp, #208]
0xf8fe340d760  10c0  f94037f3       ldr x19, [sp, #104]
0xf8fe340d764  10c4  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d768  10c8  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d76c  10cc  fd401be3       ldr d3, [sp, #48]
0xf8fe340d770  10d0  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d774  10d4  f94013ee       ldr x14, [sp, #32]
0xf8fe340d778  10d8  f9400fed       ldr x13, [sp, #24]
0xf8fe340d77c  10dc  f9400bec       ldr x12, [sp, #16]
0xf8fe340d780  10e0  f94007eb       ldr x11, [sp, #8]
0xf8fe340d784  10e4  f9402be6       ldr x6, [sp, #80]
0xf8fe340d788  10e8  f9402fef       ldr x15, [sp, #88]
0xf8fe340d78c  10ec  f94003f6       ldr x22, [sp]
0xf8fe340d790  10f0  17fffe5c       b #-0x690 (addr 0xf8fe340d100)
0xf8fe340d794  10f4  f9003bea       str x10, [sp, #112]
0xf8fe340d798  10f8  fd006fea       str d10, [sp, #216]
0xf8fe340d79c  10fc  fd006beb       str d11, [sp, #208]
0xf8fe340d7a0  1100  f90037f3       str x19, [sp, #104]
0xf8fe340d7a4  1104  f9002ff4       str x20, [sp, #88]
0xf8fe340d7a8  1108  f9002be6       str x6, [sp, #80]
0xf8fe340d7ac  110c  97fac109       bl #-0x14fbdc (addr 0xf8fe32bdbd0)
0xf8fe340d7b0  1110  f94083e8       ldr x8, [sp, #256]
0xf8fe340d7b4  1114  f9407fe1       ldr x1, [sp, #248]
0xf8fe340d7b8  1118  f9407be9       ldr x9, [sp, #240]
0xf8fe340d7bc  111c  fd404fe9       ldr d9, [sp, #152]
0xf8fe340d7c0  1120  fd404be7       ldr d7, [sp, #144]
0xf8fe340d7c4  1124  fd4043e6       ldr d6, [sp, #128]
0xf8fe340d7c8  1128  fd403fe8       ldr d8, [sp, #120]
0xf8fe340d7cc  112c  f9403bea       ldr x10, [sp, #112]
0xf8fe340d7d0  1130  fd406fea       ldr d10, [sp, #216]
0xf8fe340d7d4  1134  fd406beb       ldr d11, [sp, #208]
0xf8fe340d7d8  1138  f94037f3       ldr x19, [sp, #104]
0xf8fe340d7dc  113c  fd4023e1       ldr d1, [sp, #64]
0xf8fe340d7e0  1140  fd401fe2       ldr d2, [sp, #56]
0xf8fe340d7e4  1144  fd401be3       ldr d3, [sp, #48]
0xf8fe340d7e8  1148  fd4017e4       ldr d4, [sp, #40]
0xf8fe340d7ec  114c  f94013ee       ldr x14, [sp, #32]
0xf8fe340d7f0  1150  f9400fed       ldr x13, [sp, #24]
0xf8fe340d7f4  1154  f9400bec       ldr x12, [sp, #16]
0xf8fe340d7f8  1158  f94007eb       ldr x11, [sp, #8]
0xf8fe340d7fc  115c  f9402ff4       ldr x20, [sp, #88]
0xf8fe340d800  1160  f9402be6       ldr x6, [sp, #80]
0xf8fe340d804  1164  f94003f6       ldr x22, [sp]
0xf8fe340d808  1168  17fffe53       b #-0x6b4 (addr 0xf8fe340d154)
0xf8fe340d80c  116c  97fac03d       bl #-0x14ff0c (addr 0xf8fe32bd900)
0xf8fe340d810  1170  97fac03c       bl #-0x14ff10 (addr 0xf8fe32bd900)
0xf8fe340d814  1174  d503201f       nop

Protected instructions:
 pc offset
        40         
        48         
        50         
        58         
        e4         
        ec         
        f4         
       108         
       110         
       120         
       168         
       170         
       178         
       180         
       1b0         
       1b8         
       1c0         
       1c8         
       210         
       224         
       234         
       248         
       25c         
       268         
       270         
       278         
       280         
       288         
       290         
       298         
       360         
       368         
       38c         
       390         
       3e8         
       3fc         
       410         
       424         
       4e8         
       510         
       518         
       528         
       554         
       58c         
       594         
       5a4         
       5dc         
       61c         
       624         
       634         
       66c         
       6a8         
       6b0         
       6c0         
       6ec         
       71c         
       724         
       734         
       760         
       79c         
       7a4         
       7b4         
       7e0         
       820         
       828         
       838         
       864         
       894         
       89c         
       8ac         
       8d8         
       908         
       910         
       920         
       94c         
       958         
       960         
       968         
       970         
       978         
       980         
       988         
       990         
       998         
       9a0         
       9a8         
       9b0         
       9b8         
       9c0         
       9c8         
       9d0         
       9d8         
       9e0         
       9e8         
       a44         
       a4c         
       a64         
       a7c         
       a94         
       ab8         
       aec         
       af4         
       b18         
       b1c         
       ba0         
       ba8         
       bc8         
       be0         
       c38         
       c78         
       c90         
       d00         
       d14         
       d38         
       d50         
       e04         
       e08         
       e0c         
       e10         
       e18         
       e20         
       e24         
       e28         
       e30         
       e38         
       e3c         
       e40         
       e48         
       e50         

Source positions:
 pc offset  position
        40        61
        48        69
        50        77
        58        90
        e4       144
        ec       151
        f4       158
       108       179
       110       187
       120       199
       128       217
       168       237
       170       244
       178       251
       180       258
       1b0       309
       1b8       316
       1c0       323
       1c8       330
       210       361
       224       373
       234       385
       248       397
       25c       407
       268       420
       270       427
       278       435
       280       442
       288       450
       290       457
       298       465
       360       582
       368       598
       38c       637
       390       644
       3e8       751
       3fc       764
       410       775
       424       809
       4e8       968
       510      1015
       518      1028
       528      1040
       554      1057
       58c      1135
       594      1148
       5a4      1160
       5dc      1177
       61c      1258
       624      1271
       634      1283
       66c      1300
       6a8      1381
       6b0      1394
       6c0      1406
       6ec      1423
       71c      1496
       724      1509
       734      1521
       760      1538
       79c      1611
       7a4      1624
       7b4      1636
       7e0      1653
       820      1737
       828      1750
       838      1762
       864      1779
       894      1852
       89c      1865
       8ac      1877
       8d8      1894
       908      1967
       910      1980
       920      1992
       94c      2009
       958      2025
       960      2032
       968      2039
       970      2046
       978      2053
       980      2060
       988      2067
       990      2074
       998      2081
       9a0      2088
       9a8      2095
       9b0      2102
       9b8      2109
       9c0      2116
       9c8      2123
       9d0      2130
       9d8      2137
       9e0      2144
       9e4      2156
       a44      2223
       a4c      2233
       a64      2269
       aec      2303
       af4      2315
       b18      2369
       b1c      2376
       ba0      2543
       ba8      2550
       bc8      2587
       be0      2605
       c38      2694
       c48      2703
       c5c      2713
       c74      2731
       c8c      2743
       d00      2854
       d14      2875
       d38      2894
       d50      2913
       dbc      2506
       ddc      2492
       e04      2933
       e08      2943
       e0c      2947
       e10      2955
       e18      2961
       e20      2971
       e24      2975
       e28      2983
       e30      2989
       e38      2999
       e3c      3003
       e40      3011
       e48      3019
       e50      3026
       e6c         0
       ea4       353
       edc       528
       f50       543
      1014      2209
      107c      2246
      10f4      2256
      116c      2498
      1170      2512

Safepoints (stack slots = 38, entries = 1, byte size = 19)
0xf8fe340c7cc    12c  slots (sp->fp): 00000000000000000000000000000000000000

RelocInfo (size = 39)
0xf8fe340c7c8  internal wasm call
0xf8fe340d2f8  internal wasm call
0xf8fe340d308  internal wasm call
0xf8fe340d468  internal wasm call
0xf8fe340d488  internal wasm call
0xf8fe340d510  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d548  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d58c  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d608  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d6c4  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d734  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d7ac  wasm stub call  (0xf8fe32bdbd0)
0xf8fe340d80c  wasm stub call  (0xf8fe32bd900)
0xf8fe340d810  wasm stub call  (0xf8fe32bd900)
