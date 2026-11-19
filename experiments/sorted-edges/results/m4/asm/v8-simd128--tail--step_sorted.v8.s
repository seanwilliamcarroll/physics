name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8896 = 8884 + 12 padding)
Instructions (size = 8848)
0x1de12ab1bbe0     0  d2800110       movz x16, #0x8
0x1de12ab1bbe4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x1de12ab1bbe8     8  a9017bfd       stp fp, lr, [sp, #16]
0x1de12ab1bbec     c  910043fd       add fp, sp, #0x10 (16)
0x1de12ab1bbf0    10  d11343ff       sub sp, sp, #0x4d0 (1232)
0x1de12ab1bbf4    14  f841f0e1       ldur x1, [x7, #31]
0x1de12ab1bbf8    18  f8520346       ldur x6, [x26, #-224]
0x1de12ab1bbfc    1c  f9025fe0       str x0, [sp, #1208]
0x1de12ab1bc00    20  f90257e1       str x1, [sp, #1192]
0x1de12ab1bc04    24  eb2663ff       cmp sp, x6
0x1de12ab1bc08    28  5400f309       b.ls #+0x1e60 (addr 0x1de12ab1da68)
0x1de12ab1bc0c    2c  f842f0e6       ldur x6, [x7, #47]
0x1de12ab1bc10    30  b94000c8       ldr w8, [x6]
0x1de12ab1bc14    34  51080104       sub w4, w8, #0x200 (512)
0x1de12ab1bc18    38  b90000c4       str w4, [x6]
0x1de12ab1bc1c    3c  2a0003e8       mov w8, w0
0x1de12ab1bc20    40  91024029       add x9, x1, #0x90 (144)
0x1de12ab1bc24    44  fc686922       ldr d2, [x9, x8]
0x1de12ab1bc28    48  5e0c0441       mov s1, v2.s[1]
0x1de12ab1bc2c    4c  52a75010       movz w16, #0x3a800000
0x1de12ab1bc30    50  1e270203       fmov s3, w16
0x1de12ab1bc34    54  1e230824       fmul s4, s1, s3
0x1de12ab1bc38    58  5e040440       mov s0, v2.s[0]
0x1de12ab1bc3c    5c  1e230803       fmul s3, s0, s3
0x1de12ab1bc40    60  91028109       add x9, x8, #0xa0 (160)
0x1de12ab1bc44    64  bc696825       ldr s5, [x1, x9]
0x1de12ab1bc48    68  1e2520a0       fcmp s5, s5
0x1de12ab1bc4c    6c  1e251c66       fcsel s6, s3, s5, ne
0x1de12ab1bc50    70  1e232060       fcmp s3, s3
0x1de12ab1bc54    74  1e231cc3       fcsel s3, s6, s3, ne
0x1de12ab1bc58    78  1e262060       fcmp s3, s6
0x1de12ab1bc5c    7c  1e233cc3       fcsel s3, s6, s3, lo
0x1de12ab1bc60    80  1e232060       fcmp s3, s3
0x1de12ab1bc64    84  1e231c83       fcsel s3, s4, s3, ne
0x1de12ab1bc68    88  1e242080       fcmp s4, s4
0x1de12ab1bc6c    8c  1e241c64       fcsel s4, s3, s4, ne
0x1de12ab1bc70    90  1e232080       fcmp s4, s3
0x1de12ab1bc74    94  1e243c63       fcsel s3, s3, s4, lo
0x1de12ab1bc78    98  52840010       movz w16, #0x2000
0x1de12ab1bc7c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x1de12ab1bc80    a0  1e270204       fmov s4, w16
0x1de12ab1bc84    a4  1e240863       fmul s3, s3, s4
0x1de12ab1bc88    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x1de12ab1bc8c    ac  1e231883       fdiv s3, s4, s3
0x1de12ab1bc90    b0  91021109       add x9, x8, #0x84 (132)
0x1de12ab1bc94    b4  bc296823       str s3, [x1, x9]
0x1de12ab1bc98    b8  4e040466       dup v6.4s, v3.s[0]
0x1de12ab1bc9c    bc  6e26dc42       fmul v2.4s, v2.4s, v6.4s
0x1de12ab1bca0    c0  4ea18842       frintp v2.4s, v2.4s
0x1de12ab1bca4    c4  5e040446       mov s6, v2.s[0]
0x1de12ab1bca8    c8  1e22c0c7       fcvt d7, s6
0x1de12ab1bcac    cc  1e65c0e8       frintz d8, d7
0x1de12ab1bcb0    d0  1e79010a       fcvtzu w10, d8
0x1de12ab1bcb4    d4  1e630149       ucvtf d9, w10
0x1de12ab1bcb8    d8  f90267e6       str x6, [sp, #1224]
0x1de12ab1bcbc    dc  f90263e4       str x4, [sp, #1216]
0x1de12ab1bcc0    e0  f901b7e8       str x8, [sp, #872]
0x1de12ab1bcc4    e4  fd0233e1       str d1, [sp, #1120]
0x1de12ab1bcc8    e8  fd0237e0       str d0, [sp, #1128]
0x1de12ab1bccc    ec  fd025be5       str d5, [sp, #1200]
0x1de12ab1bcd0    f0  fd0227e3       str d3, [sp, #1096]
0x1de12ab1bcd4    f4  f900f7e9       str x9, [sp, #488]
0x1de12ab1bcd8    f8  1e692100       fcmp d8, d9
0x1de12ab1bcdc    fc  5400ed01       b.ne #+0x1da0 (addr 0x1de12ab1da7c)
0x1de12ab1bce0   100  4e040d46       dup v6.4s, w10
0x1de12ab1bce4   104  5e0c0447       mov s7, v2.s[1]
0x1de12ab1bce8   108  1e22c0e8       fcvt d8, s7
0x1de12ab1bcec   10c  1e65c109       frintz d9, d8
0x1de12ab1bcf0   110  1e79012a       fcvtzu w10, d9
0x1de12ab1bcf4   114  1e63014a       ucvtf d10, w10
0x1de12ab1bcf8   118  1e6a2120       fcmp d9, d10
0x1de12ab1bcfc   11c  5400ed61       b.ne #+0x1dac (addr 0x1de12ab1daa8)
0x1de12ab1bd00   120  4e0c1d46       mov v6.s[1], w10
0x1de12ab1bd04   124  4f000427       movi v7.4s, #0x1, lsl #0
0x1de12ab1bd08   128  6ea764c6       umax v6.4s, v6.4s, v7.4s
0x1de12ab1bd0c   12c  6f00e408       movi v8.2d, #0x0
0x1de12ab1bd10   130  6ea0c849       fcmge v9.4s, v2.4s, #0.0
0x1de12ab1bd14   134  52a9f010       movz w16, #0x4f800000
0x1de12ab1bd18   138  4e040e0a       dup v10.4s, w16
0x1de12ab1bd1c   13c  6ea2e542       fcmgt v2.4s, v10.4s, v2.4s
0x1de12ab1bd20   140  4e221d22       and v2.16b, v9.16b, v2.16b
0x1de12ab1bd24   144  6e671cc2       bsl v2.16b, v6.16b, v7.16b
0x1de12ab1bd28   148  9102202a       add x10, x1, #0x88 (136)
0x1de12ab1bd2c   14c  8b08014a       add x10, x10, x8
0x1de12ab1bd30   150  0d008542       st1 {v2.d}[0], [x10]
0x1de12ab1bd34   154  9103310a       add x10, x8, #0xcc (204)
0x1de12ab1bd38   158  b86a682a       ldr w10, [x1, x10]
0x1de12ab1bd3c   15c  9100e08b       add x11, x4, #0x38 (56)
0x1de12ab1bd40   160  b82b682a       str w10, [x1, x11]
0x1de12ab1bd44   164  9103110a       add x10, x8, #0xc4 (196)
0x1de12ab1bd48   168  f86a682a       ldr x10, [x1, x10]
0x1de12ab1bd4c   16c  9100c08b       add x11, x4, #0x30 (48)
0x1de12ab1bd50   170  f82b682a       str x10, [x1, x11]
0x1de12ab1bd54   174  1101800a       add w10, w0, #0x60 (96)
0x1de12ab1bd58   178  9100110b       add x11, x8, #0x4 (4)
0x1de12ab1bd5c   17c  b86b6822       ldr w2, [x1, x11]
0x1de12ab1bd60   180  9100210c       add x12, x8, #0x8 (8)
0x1de12ab1bd64   184  b86c6823       ldr w3, [x1, x12]
0x1de12ab1bd68   188  9100410d       add x13, x8, #0x10 (16)
0x1de12ab1bd6c   18c  b86d682e       ldr w14, [x1, x13]
0x1de12ab1bd70   190  9100510f       add x15, x8, #0x14 (20)
0x1de12ab1bd74   194  b86f6825       ldr w5, [x1, x15]
0x1de12ab1bd78   198  3d80a7e7       str q7, [sp, #656]
0x1de12ab1bd7c   19c  3d8083e8       str q8, [sp, #512]
0x1de12ab1bd80   1a0  f901cbeb       str x11, [sp, #912]
0x1de12ab1bd84   1a4  f901b3ec       str x12, [sp, #864]
0x1de12ab1bd88   1a8  f901c7ed       str x13, [sp, #904]
0x1de12ab1bd8c   1ac  f901d7ef       str x15, [sp, #936]
0x1de12ab1bd90   1b0  aa0a03e0       mov x0, x10
0x1de12ab1bd94   1b4  aa0e03e4       mov x4, x14
0x1de12ab1bd98   1b8  97fc0639       bl #-0xfe71c (addr 0x1de12aa1d67c)
0x1de12ab1bd9c   1bc  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1bda0   1c0  9100e026       add x6, x1, #0x38 (56)
0x1de12ab1bda4   1c4  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1bda8   1c8  b826691f       str wzr, [x8, x6]
0x1de12ab1bdac   1cc  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1bdb0   1d0  11028122       add w2, w9, #0xa0 (160)
0x1de12ab1bdb4   1d4  9101f02a       add x10, x1, #0x7c (124)
0x1de12ab1bdb8   1d8  b86a690a       ldr w10, [x8, x10]
0x1de12ab1bdbc   1dc  9102002b       add x11, x1, #0x80 (128)
0x1de12ab1bdc0   1e0  b86b690b       ldr w11, [x8, x11]
0x1de12ab1bdc4   1e4  0b0b094b       add w11, w10, w11, lsl #2
0x1de12ab1bdc8   1e8  f941b3ec       ldr x12, [sp, #864]
0x1de12ab1bdcc   1ec  b86c690d       ldr w13, [x8, x12]
0x1de12ab1bdd0   1f0  f941cbee       ldr x14, [sp, #912]
0x1de12ab1bdd4   1f4  b86e690f       ldr w15, [x8, x14]
0x1de12ab1bdd8   1f8  1100c120       add w0, w9, #0x30 (48)
0x1de12ab1bddc   1fc  f9021be6       str x6, [sp, #1072]
0x1de12ab1bde0   200  f9023be2       str x2, [sp, #1136]
0x1de12ab1bde4   204  f90223ea       str x10, [sp, #1088]
0x1de12ab1bde8   208  f9021feb       str x11, [sp, #1080]
0x1de12ab1bdec   20c  f90253ed       str x13, [sp, #1184]
0x1de12ab1bdf0   210  f9024fef       str x15, [sp, #1176]
0x1de12ab1bdf4   214  f90247e0       str x0, [sp, #1160]
0x1de12ab1bdf8   218  aa0a03f4       mov x20, x10
0x1de12ab1bdfc   21c  d2800013       movz x19, #0x0
0x1de12ab1be00   220  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1be04   224  f8520355       ldur x21, [x26, #-224]
0x1de12ab1be08   228  eb3563ff       cmp sp, x21
0x1de12ab1be0c   22c  5400e5e9       b.ls #+0x1cbc (addr 0x1de12ab1dac8)
0x1de12ab1be10   230  6b0b029f       cmp w20, w11
0x1de12ab1be14   234  54000120       b.eq #+0x24 (addr 0x1de12ab1be38)
0x1de12ab1be18   238  b8746915       ldr w21, [x8, x20]
0x1de12ab1be1c   23c  11001294       add w20, w20, #0x4 (4)
0x1de12ab1be20   240  6b1501bf       cmp w13, w21
0x1de12ab1be24   244  54ffff09       b.ls #-0x20 (addr 0x1de12ab1be04)
0x1de12ab1be28   248  0b1509f5       add w21, w15, w21, lsl #2
0x1de12ab1be2c   24c  bc756903       ldr s3, [x8, x21]
0x1de12ab1be30   250  d2800035       movz x21, #0x1
0x1de12ab1be34   254  14000003       b #+0xc (addr 0x1de12ab1be40)
0x1de12ab1be38   258  d2800015       movz x21, #0x0
0x1de12ab1be3c   25c  aa0b03f4       mov x20, x11
0x1de12ab1be40   260  fd0227e3       str d3, [sp, #1096]
0x1de12ab1be44   264  f9023ff4       str x20, [sp, #1144]
0x1de12ab1be48   268  710006bf       cmp w21, #0x1 (1)
0x1de12ab1be4c   26c  540004a1       b.ne #+0x94 (addr 0x1de12ab1bee0)
0x1de12ab1be50   270  9100c035       add x21, x1, #0x30 (48)
0x1de12ab1be54   274  b8756915       ldr w21, [x8, x21]
0x1de12ab1be58   278  6b15027f       cmp w19, w21
0x1de12ab1be5c   27c  54000261       b.ne #+0x4c (addr 0x1de12ab1bea8)
0x1de12ab1be60   280  d2800023       movz x3, #0x1
0x1de12ab1be64   284  f9024bf3       str x19, [sp, #1168]
0x1de12ab1be68   288  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1be6c   28c  aa1303e2       mov x2, x19
0x1de12ab1be70   290  97fc0604       bl #-0xfe7f0 (addr 0x1de12aa1d680)
0x1de12ab1be74   294  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1be78   298  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1be7c   29c  f941cbee       ldr x14, [sp, #912]
0x1de12ab1be80   2a0  f941b3ec       ldr x12, [sp, #864]
0x1de12ab1be84   2a4  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1be88   2a8  f9421feb       ldr x11, [sp, #1080]
0x1de12ab1be8c   2ac  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1be90   2b0  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1be94   2b4  f9423ff4       ldr x20, [sp, #1144]
0x1de12ab1be98   2b8  f9424bf3       ldr x19, [sp, #1168]
0x1de12ab1be9c   2bc  f94247e0       ldr x0, [sp, #1160]
0x1de12ab1bea0   2c0  f9424fef       ldr x15, [sp, #1176]
0x1de12ab1bea4   2c4  f94253ed       ldr x13, [sp, #1184]
0x1de12ab1bea8   2c8  1100066a       add w10, w19, #0x1 (1)
0x1de12ab1beac   2cc  aa0803f0       mov x16, x8
0x1de12ab1beb0   2d0  aa0603e8       mov x8, x6
0x1de12ab1beb4   2d4  aa1003e6       mov x6, x16
0x1de12ab1beb8   2d8  b82868ca       str w10, [x6, x8]
0x1de12ab1bebc   2dc  9100d035       add x21, x1, #0x34 (52)
0x1de12ab1bec0   2e0  b87568d5       ldr w21, [x6, x21]
0x1de12ab1bec4   2e4  0b130ab3       add w19, w21, w19, lsl #2
0x1de12ab1bec8   2e8  bc3368c3       str s3, [x6, x19]
0x1de12ab1becc   2ec  aa0803f0       mov x16, x8
0x1de12ab1bed0   2f0  aa0603e8       mov x8, x6
0x1de12ab1bed4   2f4  aa1003e6       mov x6, x16
0x1de12ab1bed8   2f8  aa0a03f3       mov x19, x10
0x1de12ab1bedc   2fc  17ffffca       b #-0xd8 (addr 0x1de12ab1be04)
0x1de12ab1bee0   300  9101102a       add x10, x1, #0x44 (68)
0x1de12ab1bee4   304  b82a691f       str wzr, [x8, x10]
0x1de12ab1bee8   308  f941d7ed       ldr x13, [sp, #936]
0x1de12ab1beec   30c  b86d690f       ldr w15, [x8, x13]
0x1de12ab1bef0   310  f941c7f3       ldr x19, [sp, #904]
0x1de12ab1bef4   314  b8736914       ldr w20, [x8, x19]
0x1de12ab1bef8   318  1100f120       add w0, w9, #0x3c (60)
0x1de12ab1befc   31c  f90253ea       str x10, [sp, #1184]
0x1de12ab1bf00   320  f9023fef       str x15, [sp, #1144]
0x1de12ab1bf04   324  f90247f4       str x20, [sp, #1160]
0x1de12ab1bf08   328  f90243e0       str x0, [sp, #1152]
0x1de12ab1bf0c   32c  aa0b03f5       mov x21, x11
0x1de12ab1bf10   330  f94223eb       ldr x11, [sp, #1088]
0x1de12ab1bf14   334  d2800002       movz x2, #0x0
0x1de12ab1bf18   338  f8520356       ldur x22, [x26, #-224]
0x1de12ab1bf1c   33c  eb3663ff       cmp sp, x22
0x1de12ab1bf20   340  5400df89       b.ls #+0x1bf0 (addr 0x1de12ab1db10)
0x1de12ab1bf24   344  6b15017f       cmp w11, w21
0x1de12ab1bf28   348  54000120       b.eq #+0x24 (addr 0x1de12ab1bf4c)
0x1de12ab1bf2c   34c  b86b6916       ldr w22, [x8, x11]
0x1de12ab1bf30   350  1100116b       add w11, w11, #0x4 (4)
0x1de12ab1bf34   354  6b1601ff       cmp w15, w22
0x1de12ab1bf38   358  54ffff09       b.ls #-0x20 (addr 0x1de12ab1bf18)
0x1de12ab1bf3c   35c  0b160a96       add w22, w20, w22, lsl #2
0x1de12ab1bf40   360  bc766903       ldr s3, [x8, x22]
0x1de12ab1bf44   364  d2800036       movz x22, #0x1
0x1de12ab1bf48   368  14000003       b #+0xc (addr 0x1de12ab1bf54)
0x1de12ab1bf4c   36c  d2800016       movz x22, #0x0
0x1de12ab1bf50   370  aa1503eb       mov x11, x21
0x1de12ab1bf54   374  fd0227e3       str d3, [sp, #1096]
0x1de12ab1bf58   378  f9024beb       str x11, [sp, #1168]
0x1de12ab1bf5c   37c  710006df       cmp w22, #0x1 (1)
0x1de12ab1bf60   380  540003e1       b.ne #+0x7c (addr 0x1de12ab1bfdc)
0x1de12ab1bf64   384  9100f036       add x22, x1, #0x3c (60)
0x1de12ab1bf68   388  b8766916       ldr w22, [x8, x22]
0x1de12ab1bf6c   38c  6b16005f       cmp w2, w22
0x1de12ab1bf70   390  54000261       b.ne #+0x4c (addr 0x1de12ab1bfbc)
0x1de12ab1bf74   394  f9024fe2       str x2, [sp, #1176]
0x1de12ab1bf78   398  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1bf7c   39c  d2800023       movz x3, #0x1
0x1de12ab1bf80   3a0  97fc05c0       bl #-0xfe900 (addr 0x1de12aa1d680)
0x1de12ab1bf84   3a4  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1bf88   3a8  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1bf8c   3ac  f941c7f3       ldr x19, [sp, #904]
0x1de12ab1bf90   3b0  f941d7ed       ldr x13, [sp, #936]
0x1de12ab1bf94   3b4  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1bf98   3b8  f94253ea       ldr x10, [sp, #1184]
0x1de12ab1bf9c   3bc  f9421ff5       ldr x21, [sp, #1080]
0x1de12ab1bfa0   3c0  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1bfa4   3c4  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1bfa8   3c8  f9424beb       ldr x11, [sp, #1168]
0x1de12ab1bfac   3cc  f9424fe2       ldr x2, [sp, #1176]
0x1de12ab1bfb0   3d0  f94243e0       ldr x0, [sp, #1152]
0x1de12ab1bfb4   3d4  f94247f4       ldr x20, [sp, #1160]
0x1de12ab1bfb8   3d8  f9423fef       ldr x15, [sp, #1144]
0x1de12ab1bfbc   3dc  1100044c       add w12, w2, #0x1 (1)
0x1de12ab1bfc0   3e0  b82a690c       str w12, [x8, x10]
0x1de12ab1bfc4   3e4  9101002e       add x14, x1, #0x40 (64)
0x1de12ab1bfc8   3e8  b86e690e       ldr w14, [x8, x14]
0x1de12ab1bfcc   3ec  0b0209ce       add w14, w14, w2, lsl #2
0x1de12ab1bfd0   3f0  bc2e6903       str s3, [x8, x14]
0x1de12ab1bfd4   3f4  aa0c03e2       mov x2, x12
0x1de12ab1bfd8   3f8  17ffffd0       b #-0xc0 (addr 0x1de12ab1bf18)
0x1de12ab1bfdc   3fc  9101402b       add x11, x1, #0x50 (80)
0x1de12ab1bfe0   400  b82b691f       str wzr, [x8, x11]
0x1de12ab1bfe4   404  9100802c       add x12, x1, #0x20 (32)
0x1de12ab1bfe8   408  b86c690e       ldr w14, [x8, x12]
0x1de12ab1bfec   40c  9100702f       add x15, x1, #0x1c (28)
0x1de12ab1bff0   410  b86f6914       ldr w20, [x8, x15]
0x1de12ab1bff4   414  11012120       add w0, w9, #0x48 (72)
0x1de12ab1bff8   418  f9024feb       str x11, [sp, #1176]
0x1de12ab1bffc   41c  f901d3ec       str x12, [sp, #928]
0x1de12ab1c000   420  f90243ee       str x14, [sp, #1152]
0x1de12ab1c004   424  f901c3ef       str x15, [sp, #896]
0x1de12ab1c008   428  f9023ff4       str x20, [sp, #1144]
0x1de12ab1c00c   42c  f9022be0       str x0, [sp, #1104]
0x1de12ab1c010   430  aa1503f6       mov x22, x21
0x1de12ab1c014   434  f94223f5       ldr x21, [sp, #1088]
0x1de12ab1c018   438  d2800002       movz x2, #0x0
0x1de12ab1c01c   43c  f8520357       ldur x23, [x26, #-224]
0x1de12ab1c020   440  eb3763ff       cmp sp, x23
0x1de12ab1c024   444  5400d9c9       b.ls #+0x1b38 (addr 0x1de12ab1db5c)
0x1de12ab1c028   448  6b1602bf       cmp w21, w22
0x1de12ab1c02c   44c  54000120       b.eq #+0x24 (addr 0x1de12ab1c050)
0x1de12ab1c030   450  b8756917       ldr w23, [x8, x21]
0x1de12ab1c034   454  110012b5       add w21, w21, #0x4 (4)
0x1de12ab1c038   458  6b1701df       cmp w14, w23
0x1de12ab1c03c   45c  54ffff09       b.ls #-0x20 (addr 0x1de12ab1c01c)
0x1de12ab1c040   460  0b170a97       add w23, w20, w23, lsl #2
0x1de12ab1c044   464  bc776903       ldr s3, [x8, x23]
0x1de12ab1c048   468  d2800037       movz x23, #0x1
0x1de12ab1c04c   46c  14000003       b #+0xc (addr 0x1de12ab1c058)
0x1de12ab1c050   470  d2800017       movz x23, #0x0
0x1de12ab1c054   474  aa1603f5       mov x21, x22
0x1de12ab1c058   478  fd0227e3       str d3, [sp, #1096]
0x1de12ab1c05c   47c  f90247f5       str x21, [sp, #1160]
0x1de12ab1c060   480  710006ff       cmp w23, #0x1 (1)
0x1de12ab1c064   484  540003e1       b.ne #+0x7c (addr 0x1de12ab1c0e0)
0x1de12ab1c068   488  91012037       add x23, x1, #0x48 (72)
0x1de12ab1c06c   48c  b8776917       ldr w23, [x8, x23]
0x1de12ab1c070   490  6b17005f       cmp w2, w23
0x1de12ab1c074   494  54000261       b.ne #+0x4c (addr 0x1de12ab1c0c0)
0x1de12ab1c078   498  f9024be2       str x2, [sp, #1168]
0x1de12ab1c07c   49c  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1c080   4a0  d2800023       movz x3, #0x1
0x1de12ab1c084   4a4  97fc057f       bl #-0xfea04 (addr 0x1de12aa1d680)
0x1de12ab1c088   4a8  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1c08c   4ac  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1c090   4b0  f941c3ef       ldr x15, [sp, #896]
0x1de12ab1c094   4b4  f941d3ec       ldr x12, [sp, #928]
0x1de12ab1c098   4b8  f94253ea       ldr x10, [sp, #1184]
0x1de12ab1c09c   4bc  f9424feb       ldr x11, [sp, #1176]
0x1de12ab1c0a0   4c0  f9421ff6       ldr x22, [sp, #1080]
0x1de12ab1c0a4   4c4  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1c0a8   4c8  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1c0ac   4cc  f94247f5       ldr x21, [sp, #1160]
0x1de12ab1c0b0   4d0  f9424be2       ldr x2, [sp, #1168]
0x1de12ab1c0b4   4d4  f9422be0       ldr x0, [sp, #1104]
0x1de12ab1c0b8   4d8  f9423ff4       ldr x20, [sp, #1144]
0x1de12ab1c0bc   4dc  f94243ee       ldr x14, [sp, #1152]
0x1de12ab1c0c0   4e0  11000446       add w6, w2, #0x1 (1)
0x1de12ab1c0c4   4e4  b82b6906       str w6, [x8, x11]
0x1de12ab1c0c8   4e8  9101302d       add x13, x1, #0x4c (76)
0x1de12ab1c0cc   4ec  b86d690d       ldr w13, [x8, x13]
0x1de12ab1c0d0   4f0  0b0209ad       add w13, w13, w2, lsl #2
0x1de12ab1c0d4   4f4  bc2d6903       str s3, [x8, x13]
0x1de12ab1c0d8   4f8  aa0603e2       mov x2, x6
0x1de12ab1c0dc   4fc  17ffffd0       b #-0xc0 (addr 0x1de12ab1c01c)
0x1de12ab1c0e0   500  91017026       add x6, x1, #0x5c (92)
0x1de12ab1c0e4   504  b826691f       str wzr, [x8, x6]
0x1de12ab1c0e8   508  9100b02d       add x13, x1, #0x2c (44)
0x1de12ab1c0ec   50c  b86d690e       ldr w14, [x8, x13]
0x1de12ab1c0f0   510  9100a033       add x19, x1, #0x28 (40)
0x1de12ab1c0f4   514  b8736914       ldr w20, [x8, x19]
0x1de12ab1c0f8   518  11015120       add w0, w9, #0x54 (84)
0x1de12ab1c0fc   51c  f9024be6       str x6, [sp, #1168]
0x1de12ab1c100   520  f901cfed       str x13, [sp, #920]
0x1de12ab1c104   524  f9022fee       str x14, [sp, #1112]
0x1de12ab1c108   528  f901bbf3       str x19, [sp, #880]
0x1de12ab1c10c   52c  f90243f4       str x20, [sp, #1152]
0x1de12ab1c110   530  f9025fe0       str x0, [sp, #1208]
0x1de12ab1c114   534  d2800002       movz x2, #0x0
0x1de12ab1c118   538  f94223e9       ldr x9, [sp, #1088]
0x1de12ab1c11c   53c  aa1603f5       mov x21, x22
0x1de12ab1c120   540  14000004       b #+0x10 (addr 0x1de12ab1c130)
0x1de12ab1c124   544  aa0803f0       mov x16, x8
0x1de12ab1c128   548  aa0603e8       mov x8, x6
0x1de12ab1c12c   54c  aa1003e6       mov x6, x16
0x1de12ab1c130   550  f8520356       ldur x22, [x26, #-224]
0x1de12ab1c134   554  eb3663ff       cmp sp, x22
0x1de12ab1c138   558  5400d389       b.ls #+0x1a70 (addr 0x1de12ab1dba8)
0x1de12ab1c13c   55c  6b15013f       cmp w9, w21
0x1de12ab1c140   560  540001a0       b.eq #+0x34 (addr 0x1de12ab1c174)
0x1de12ab1c144   564  b8696916       ldr w22, [x8, x9]
0x1de12ab1c148   568  11001129       add w9, w9, #0x4 (4)
0x1de12ab1c14c   56c  6b1601df       cmp w14, w22
0x1de12ab1c150   570  540000a9       b.ls #+0x14 (addr 0x1de12ab1c164)
0x1de12ab1c154   574  0b160a96       add w22, w20, w22, lsl #2
0x1de12ab1c158   578  bc766903       ldr s3, [x8, x22]
0x1de12ab1c15c   57c  d2800036       movz x22, #0x1
0x1de12ab1c160   580  14000007       b #+0x1c (addr 0x1de12ab1c17c)
0x1de12ab1c164   584  aa0603f0       mov x16, x6
0x1de12ab1c168   588  aa0803e6       mov x6, x8
0x1de12ab1c16c   58c  aa1003e8       mov x8, x16
0x1de12ab1c170   590  17ffffed       b #-0x4c (addr 0x1de12ab1c124)
0x1de12ab1c174   594  d2800016       movz x22, #0x0
0x1de12ab1c178   598  aa1503e9       mov x9, x21
0x1de12ab1c17c   59c  f90223e9       str x9, [sp, #1088]
0x1de12ab1c180   5a0  fd0227e3       str d3, [sp, #1096]
0x1de12ab1c184   5a4  710006df       cmp w22, #0x1 (1)
0x1de12ab1c188   5a8  54000421       b.ne #+0x84 (addr 0x1de12ab1c20c)
0x1de12ab1c18c   5ac  91015036       add x22, x1, #0x54 (84)
0x1de12ab1c190   5b0  b8766916       ldr w22, [x8, x22]
0x1de12ab1c194   5b4  6b16005f       cmp w2, w22
0x1de12ab1c198   5b8  54000241       b.ne #+0x48 (addr 0x1de12ab1c1e0)
0x1de12ab1c19c   5bc  f90247e2       str x2, [sp, #1160]
0x1de12ab1c1a0   5c0  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1c1a4   5c4  d2800023       movz x3, #0x1
0x1de12ab1c1a8   5c8  97fc0536       bl #-0xfeb28 (addr 0x1de12aa1d680)
0x1de12ab1c1ac   5cc  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1c1b0   5d0  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1c1b4   5d4  f941bbf3       ldr x19, [sp, #880]
0x1de12ab1c1b8   5d8  f941cfed       ldr x13, [sp, #920]
0x1de12ab1c1bc   5dc  f9424feb       ldr x11, [sp, #1176]
0x1de12ab1c1c0   5e0  f9424be6       ldr x6, [sp, #1168]
0x1de12ab1c1c4   5e4  f94247e2       ldr x2, [sp, #1160]
0x1de12ab1c1c8   5e8  f94223e9       ldr x9, [sp, #1088]
0x1de12ab1c1cc   5ec  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1c1d0   5f0  f9425fe0       ldr x0, [sp, #1208]
0x1de12ab1c1d4   5f4  f9421ff5       ldr x21, [sp, #1080]
0x1de12ab1c1d8   5f8  f94243f4       ldr x20, [sp, #1152]
0x1de12ab1c1dc   5fc  f9422fee       ldr x14, [sp, #1112]
0x1de12ab1c1e0   600  1100044a       add w10, w2, #0x1 (1)
0x1de12ab1c1e4   604  aa0803f0       mov x16, x8
0x1de12ab1c1e8   608  aa0603e8       mov x8, x6
0x1de12ab1c1ec   60c  aa1003e6       mov x6, x16
0x1de12ab1c1f0   610  b82868ca       str w10, [x6, x8]
0x1de12ab1c1f4   614  9101602c       add x12, x1, #0x58 (88)
0x1de12ab1c1f8   618  b86c68cc       ldr w12, [x6, x12]
0x1de12ab1c1fc   61c  0b02098c       add w12, w12, w2, lsl #2
0x1de12ab1c200   620  bc2c68c3       str s3, [x6, x12]
0x1de12ab1c204   624  aa0a03e2       mov x2, x10
0x1de12ab1c208   628  17ffffc7       b #-0xe4 (addr 0x1de12ab1c124)
0x1de12ab1c20c   62c  f9421be9       ldr x9, [sp, #1072]
0x1de12ab1c210   630  b869690a       ldr w10, [x8, x9]
0x1de12ab1c214   634  9100c02c       add x12, x1, #0x30 (48)
0x1de12ab1c218   638  3cec6902       ldr q2, [x8, x12]
0x1de12ab1c21c   63c  3ce16903       ldr q3, [x8, x1]
0x1de12ab1c220   640  3cac6903       str q3, [x8, x12]
0x1de12ab1c224   644  3ca16902       str q2, [x8, x1]
0x1de12ab1c228   648  9101002c       add x12, x1, #0x40 (64)
0x1de12ab1c22c   64c  3cec6902       ldr q2, [x8, x12]
0x1de12ab1c230   650  f941c7ee       ldr x14, [sp, #904]
0x1de12ab1c234   654  3cee6903       ldr q3, [x8, x14]
0x1de12ab1c238   658  3cac6903       str q3, [x8, x12]
0x1de12ab1c23c   65c  3cae6902       str q2, [x8, x14]
0x1de12ab1c240   660  f86b690f       ldr x15, [x8, x11]
0x1de12ab1c244   664  91016034       add x20, x1, #0x58 (88)
0x1de12ab1c248   668  b8746915       ldr w21, [x8, x20]
0x1de12ab1c24c   66c  f941d3f6       ldr x22, [sp, #928]
0x1de12ab1c250   670  3cf66902       ldr q2, [x8, x22]
0x1de12ab1c254   674  3cab6902       str q2, [x8, x11]
0x1de12ab1c258   678  b8336915       str w21, [x8, x19]
0x1de12ab1c25c   67c  b82d6902       str w2, [x8, x13]
0x1de12ab1c260   680  f836690f       str x15, [x8, x22]
0x1de12ab1c264   684  f9025fea       str x10, [sp, #1208]
0x1de12ab1c268   688  3500010a       cbnz w10, #+0x20 (addr 0x1de12ab1c288)
0x1de12ab1c26c   68c  f94263e4       ldr x4, [sp, #1216]
0x1de12ab1c270   690  11080081       add w1, w4, #0x200 (512)
0x1de12ab1c274   694  f94267ef       ldr x15, [sp, #1224]
0x1de12ab1c278   698  b90001e1       str w1, [x15]
0x1de12ab1c27c   69c  910003bf       mov sp, fp
0x1de12ab1c280   6a0  a8c17bfd       ldp fp, lr, [sp], #16
0x1de12ab1c284   6a4  d65f03c0       ret
0x1de12ab1c288   6a8  b8666906       ldr w6, [x8, x6]
0x1de12ab1c28c   6ac  b86b690b       ldr w11, [x8, x11]
0x1de12ab1c290   6b0  f94253ef       ldr x15, [sp, #1184]
0x1de12ab1c294   6b4  b86f690f       ldr w15, [x8, x15]
0x1de12ab1c298   6b8  b8696909       ldr w9, [x8, x9]
0x1de12ab1c29c   6bc  6b0901ff       cmp w15, w9
0x1de12ab1c2a0   6c0  1a8931f5       csel w21, w15, w9, lo
0x1de12ab1c2a4   6c4  6b15017f       cmp w11, w21
0x1de12ab1c2a8   6c8  1a953169       csel w9, w11, w21, lo
0x1de12ab1c2ac   6cc  6b0900df       cmp w6, w9
0x1de12ab1c2b0   6d0  1a8930cb       csel w11, w6, w9, lo
0x1de12ab1c2b4   6d4  fd425be2       ldr d2, [sp, #1200]
0x1de12ab1c2b8   6d8  1e220842       fmul s2, s2, s2
0x1de12ab1c2bc   6dc  4e040443       dup v3.4s, v2.s[0]
0x1de12ab1c2c0   6e0  91029026       add x6, x1, #0xa4 (164)
0x1de12ab1c2c4   6e4  bc666904       ldr s4, [x8, x6]
0x1de12ab1c2c8   6e8  1e240884       fmul s4, s4, s4
0x1de12ab1c2cc   6ec  4e040485       dup v5.4s, v4.s[0]
0x1de12ab1c2d0   6f0  b8746906       ldr w6, [x8, x20]
0x1de12ab1c2d4   6f4  91013029       add x9, x1, #0x4c (76)
0x1de12ab1c2d8   6f8  b8696909       ldr w9, [x8, x9]
0x1de12ab1c2dc   6fc  b86c690c       ldr w12, [x8, x12]
0x1de12ab1c2e0   700  9100d02f       add x15, x1, #0x34 (52)
0x1de12ab1c2e4   704  b86f690f       ldr w15, [x8, x15]
0x1de12ab1c2e8   708  f9023feb       str x11, [sp, #1144]
0x1de12ab1c2ec   70c  fd01efe2       str d2, [sp, #984]
0x1de12ab1c2f0   710  3d80a3e3       str q3, [sp, #640]
0x1de12ab1c2f4   714  fd01ebe4       str d4, [sp, #976]
0x1de12ab1c2f8   718  3d809fe5       str q5, [sp, #624]
0x1de12ab1c2fc   71c  f90253e6       str x6, [sp, #1184]
0x1de12ab1c300   720  f9024be9       str x9, [sp, #1168]
0x1de12ab1c304   724  f90247ec       str x12, [sp, #1160]
0x1de12ab1c308   728  f90243ef       str x15, [sp, #1152]
0x1de12ab1c30c   72c  f941b3f5       ldr x21, [sp, #864]
0x1de12ab1c310   730  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1c314   734  d280001c       movz x28, #0x0
0x1de12ab1c318   738  f940f7fb       ldr cp, [sp, #488]
0x1de12ab1c31c   73c  f941c3f9       ldr x25, [sp, #896]
0x1de12ab1c320   740  f941cbf8       ldr x24, [sp, #912]
0x1de12ab1c324   744  f941d7f7       ldr x23, [sp, #936]
0x1de12ab1c328   748  aa1c03f4       mov x20, x28
0x1de12ab1c32c   74c  f8520340       ldur x0, [x26, #-224]
0x1de12ab1c330   750  eb2063ff       cmp sp, x0
0x1de12ab1c334   754  5400c5e9       b.ls #+0x18bc (addr 0x1de12ab1dbf0)
0x1de12ab1c338   758  b8756900       ldr w0, [x8, x21]
0x1de12ab1c33c   75c  f9010be0       str x0, [sp, #528]
0x1de12ab1c340   760  6b14001f       cmp w0, w20
0x1de12ab1c344   764  5400b809       b.ls #+0x1700 (addr 0x1de12ab1da44)
0x1de12ab1c348   768  b8776902       ldr w2, [x8, x23]
0x1de12ab1c34c   76c  f900dbe2       str x2, [sp, #432]
0x1de12ab1c350   770  6b14005f       cmp w2, w20
0x1de12ab1c354   774  5400b789       b.ls #+0x16f0 (addr 0x1de12ab1da44)
0x1de12ab1c358   778  b8766903       ldr w3, [x8, x22]
0x1de12ab1c35c   77c  f900dfe3       str x3, [sp, #440]
0x1de12ab1c360   780  6b14007f       cmp w3, w20
0x1de12ab1c364   784  5400b709       b.ls #+0x16e0 (addr 0x1de12ab1da44)
0x1de12ab1c368   788  b86d6904       ldr w4, [x8, x13]
0x1de12ab1c36c   78c  f900d7e4       str x4, [sp, #424]
0x1de12ab1c370   790  6b14009f       cmp w4, w20
0x1de12ab1c374   794  5400b689       b.ls #+0x16d0 (addr 0x1de12ab1da44)
0x1de12ab1c378   798  b8786905       ldr w5, [x8, x24]
0x1de12ab1c37c   79c  531e7687       lsl w7, w20, #2
0x1de12ab1c380   7a0  0b0700a6       add w6, w5, w7
0x1de12ab1c384   7a4  bc666908       ldr s8, [x8, x6]
0x1de12ab1c388   7a8  b86e6906       ldr w6, [x8, x14]
0x1de12ab1c38c   7ac  0b0700c9       add w9, w6, w7
0x1de12ab1c390   7b0  bc696909       ldr s9, [x8, x9]
0x1de12ab1c394   7b4  b8796909       ldr w9, [x8, x25]
0x1de12ab1c398   7b8  0b07012a       add w10, w9, w7
0x1de12ab1c39c   7bc  bc6a690a       ldr s10, [x8, x10]
0x1de12ab1c3a0   7c0  b873690a       ldr w10, [x8, x19]
0x1de12ab1c3a4   7c4  0b07014b       add w11, w10, w7
0x1de12ab1c3a8   7c8  bc6b690b       ldr s11, [x8, x11]
0x1de12ab1c3ac   7cc  f94263ec       ldr x12, [sp, #1216]
0x1de12ab1c3b0   7d0  9100318b       add x11, x12, #0xc (12)
0x1de12ab1c3b4   7d4  bc2b690b       str s11, [x8, x11]
0x1de12ab1c3b8   7d8  9100218b       add x11, x12, #0x8 (8)
0x1de12ab1c3bc   7dc  bc2b690a       str s10, [x8, x11]
0x1de12ab1c3c0   7e0  9100118b       add x11, x12, #0x4 (4)
0x1de12ab1c3c4   7e4  bc2b6909       str s9, [x8, x11]
0x1de12ab1c3c8   7e8  bc2c6908       str s8, [x8, x12]
0x1de12ab1c3cc   7ec  9100818b       add x11, x12, #0x20 (32)
0x1de12ab1c3d0   7f0  f82b691f       str xzr, [x8, x11]
0x1de12ab1c3d4   7f4  6f00e40a       movi v10.2d, #0x0
0x1de12ab1c3d8   7f8  f90223eb       str x11, [sp, #1088]
0x1de12ab1c3dc   7fc  9100418b       add x11, x12, #0x10 (16)
0x1de12ab1c3e0   800  3cab690a       str q10, [x8, x11]
0x1de12ab1c3e4   804  bc7b690a       ldr s10, [x8, x27]
0x1de12ab1c3e8   808  9100a18d       add x13, x12, #0x28 (40)
0x1de12ab1c3ec   80c  b82d691f       str wzr, [x8, x13]
0x1de12ab1c3f0   810  9102302e       add x14, x1, #0x8c (140)
0x1de12ab1c3f4   814  b86e690e       ldr w14, [x8, x14]
0x1de12ab1c3f8   818  710001df       cmp w14, #0x0 (0)
0x1de12ab1c3fc   81c  9a9f07ef       cset x15, ne
0x1de12ab1c400   820  4b0f01ce       sub w14, w14, w15
0x1de12ab1c404   824  1e2a092b       fmul s11, s9, s10
0x1de12ab1c408   828  1e2b2160       fcmp s11, s11
0x1de12ab1c40c   82c  1e2b1deb       fcsel s11, s15, s11, ne
0x1de12ab1c410   830  1e202168       fcmp s11, #0.0
0x1de12ab1c414   834  1e2fcd6b       fcsel s11, s11, s15, gt
0x1de12ab1c418   838  1e25416b       frintm s11, s11
0x1de12ab1c41c   83c  1e22c16c       fcvt d12, s11
0x1de12ab1c420   840  1e65c18d       frintz d13, d12
0x1de12ab1c424   844  1e7901af       fcvtzu w15, d13
0x1de12ab1c428   848  1e6301ee       ucvtf d14, w15
0x1de12ab1c42c   84c  f9025bf4       str x20, [sp, #1200]
0x1de12ab1c430   850  f9011fe5       str x5, [sp, #568]
0x1de12ab1c434   854  f9024fe7       str x7, [sp, #1176]
0x1de12ab1c438   858  fd01e3e8       str d8, [sp, #960]
0x1de12ab1c43c   85c  f9011be6       str x6, [sp, #560]
0x1de12ab1c440   860  fd01e7e9       str d9, [sp, #968]
0x1de12ab1c444   864  f90113e9       str x9, [sp, #544]
0x1de12ab1c448   868  f90117ea       str x10, [sp, #552]
0x1de12ab1c44c   86c  f90227eb       str x11, [sp, #1096]
0x1de12ab1c450   870  f9021bed       str x13, [sp, #1072]
0x1de12ab1c454   874  1e6e21a0       fcmp d13, d14
0x1de12ab1c458   878  5400bf21       b.ne #+0x17e4 (addr 0x1de12ab1dc3c)
0x1de12ab1c45c   87c  6b0f01df       cmp w14, w15
0x1de12ab1c460   880  1a8f31d3       csel w19, w14, w15, lo
0x1de12ab1c464   884  52a9f010       movz w16, #0x4f800000
0x1de12ab1c468   888  1e27020c       fmov s12, w16
0x1de12ab1c46c   88c  1e2c2160       fcmp s11, s12
0x1de12ab1c470   890  1a9f326f       csel w15, w19, wzr, lo
0x1de12ab1c474   894  710001ff       cmp w15, #0x0 (0)
0x1de12ab1c478   898  9a9f07f3       cset x19, ne
0x1de12ab1c47c   89c  4b1301f3       sub w19, w15, w19
0x1de12ab1c480   8a0  110005ef       add w15, w15, #0x1 (1)
0x1de12ab1c484   8a4  6b0f01df       cmp w14, w15
0x1de12ab1c488   8a8  1a8f31d4       csel w20, w14, w15, lo
0x1de12ab1c48c   8ac  f9022bf4       str x20, [sp, #1104]
0x1de12ab1c490   8b0  6b13029f       cmp w20, w19
0x1de12ab1c494   8b4  5400a503       b.lo #+0x14a0 (addr 0x1de12ab1d934)
0x1de12ab1c498   8b8  9102202e       add x14, x1, #0x88 (136)
0x1de12ab1c49c   8bc  b86e690e       ldr w14, [x8, x14]
0x1de12ab1c4a0   8c0  710001df       cmp w14, #0x0 (0)
0x1de12ab1c4a4   8c4  9a9f07ef       cset x15, ne
0x1de12ab1c4a8   8c8  4b0f01cf       sub w15, w14, w15
0x1de12ab1c4ac   8cc  1e2a090a       fmul s10, s8, s10
0x1de12ab1c4b0   8d0  1e2a2140       fcmp s10, s10
0x1de12ab1c4b4   8d4  1e2a1dea       fcsel s10, s15, s10, ne
0x1de12ab1c4b8   8d8  1e202148       fcmp s10, #0.0
0x1de12ab1c4bc   8dc  1e2fcd4a       fcsel s10, s10, s15, gt
0x1de12ab1c4c0   8e0  1e25414a       frintm s10, s10
0x1de12ab1c4c4   8e4  1e22c14b       fcvt d11, s10
0x1de12ab1c4c8   8e8  1e65c16d       frintz d13, d11
0x1de12ab1c4cc   8ec  1e7901b5       fcvtzu w21, d13
0x1de12ab1c4d0   8f0  1e6302ae       ucvtf d14, w21
0x1de12ab1c4d4   8f4  f900f3ee       str x14, [sp, #480]
0x1de12ab1c4d8   8f8  1e6e21a0       fcmp d13, d14
0x1de12ab1c4dc   8fc  5400bc01       b.ne #+0x1780 (addr 0x1de12ab1dc5c)
0x1de12ab1c4e0   900  6b1501ff       cmp w15, w21
0x1de12ab1c4e4   904  1a9531f6       csel w22, w15, w21, lo
0x1de12ab1c4e8   908  1e2c2140       fcmp s10, s12
0x1de12ab1c4ec   90c  1a9f32d5       csel w21, w22, wzr, lo
0x1de12ab1c4f0   910  710002bf       cmp w21, #0x0 (0)
0x1de12ab1c4f4   914  9a9f07f6       cset x22, ne
0x1de12ab1c4f8   918  4b1602b6       sub w22, w21, w22
0x1de12ab1c4fc   91c  6b04007f       cmp w3, w4
0x1de12ab1c500   920  1a843077       csel w23, w3, w4, lo
0x1de12ab1c504   924  6b17005f       cmp w2, w23
0x1de12ab1c508   928  1a973058       csel w24, w2, w23, lo
0x1de12ab1c50c   92c  110006b5       add w21, w21, #0x1 (1)
0x1de12ab1c510   930  6b1501ff       cmp w15, w21
0x1de12ab1c514   934  1a9531f7       csel w23, w15, w21, lo
0x1de12ab1c518   938  110006ef       add w15, w23, #0x1 (1)
0x1de12ab1c51c   93c  4e04052a       dup v10.4s, v9.s[0]
0x1de12ab1c520   940  4e04050b       dup v11.4s, v8.s[0]
0x1de12ab1c524   944  91019035       add x21, x1, #0x64 (100)
0x1de12ab1c528   948  b8756915       ldr w21, [x8, x21]
0x1de12ab1c52c   94c  9101a037       add x23, x1, #0x68 (104)
0x1de12ab1c530   950  b8776917       ldr w23, [x8, x23]
0x1de12ab1c534   954  f900eff6       str x22, [sp, #472]
0x1de12ab1c538   958  f9010ff8       str x24, [sp, #536]
0x1de12ab1c53c   95c  f900ebef       str x15, [sp, #464]
0x1de12ab1c540   960  3d8093ea       str q10, [sp, #576]
0x1de12ab1c544   964  3d8097eb       str q11, [sp, #592]
0x1de12ab1c548   968  f900e3f5       str x21, [sp, #448]
0x1de12ab1c54c   96c  f900e7f7       str x23, [sp, #456]
0x1de12ab1c550   970  aa1803eb       mov x11, x24
0x1de12ab1c554   974  14000012       b #+0x48 (addr 0x1de12ab1c59c)
0x1de12ab1c558   978  aa0a03f3       mov x19, x10
0x1de12ab1c55c   97c  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1c560   980  f9411fe5       ldr x5, [sp, #568]
0x1de12ab1c564   984  f9411be6       ldr x6, [sp, #560]
0x1de12ab1c568   988  f94117ea       ldr x10, [sp, #552]
0x1de12ab1c56c   98c  f94113e9       ldr x9, [sp, #544]
0x1de12ab1c570   990  f9410feb       ldr x11, [sp, #536]
0x1de12ab1c574   994  f9410be0       ldr x0, [sp, #528]
0x1de12ab1c578   998  d280001c       movz x28, #0x0
0x1de12ab1c57c   99c  f940d7e4       ldr x4, [sp, #424]
0x1de12ab1c580   9a0  f940dbe2       ldr x2, [sp, #432]
0x1de12ab1c584   9a4  f940dfe3       ldr x3, [sp, #440]
0x1de12ab1c588   9a8  f940e3f5       ldr x21, [sp, #448]
0x1de12ab1c58c   9ac  f940e7f7       ldr x23, [sp, #456]
0x1de12ab1c590   9b0  f940ebef       ldr x15, [sp, #464]
0x1de12ab1c594   9b4  f940eff6       ldr x22, [sp, #472]
0x1de12ab1c598   9b8  f940f3ee       ldr x14, [sp, #480]
0x1de12ab1c59c   9bc  f8520341       ldur x1, [x26, #-224]
0x1de12ab1c5a0   9c0  f9022ff3       str x19, [sp, #1112]
0x1de12ab1c5a4   9c4  eb2163ff       cmp sp, x1
0x1de12ab1c5a8   9c8  5400b6a9       b.ls #+0x16d4 (addr 0x1de12ab1dc7c)
0x1de12ab1c5ac   9cc  1b0e7e61       mul w1, w19, w14
0x1de12ab1c5b0   9d0  0b16002d       add w13, w1, w22
0x1de12ab1c5b4   9d4  6b0d02ff       cmp w23, w13
0x1de12ab1c5b8   9d8  54000129       b.ls #+0x24 (addr 0x1de12ab1c5dc)
0x1de12ab1c5bc   9dc  0b0101e1       add w1, w15, w1
0x1de12ab1c5c0   9e0  6b0102ff       cmp w23, w1
0x1de12ab1c5c4   9e4  540000c9       b.ls #+0x18 (addr 0x1de12ab1c5dc)
0x1de12ab1c5c8   9e8  0b010aa1       add w1, w21, w1, lsl #2
0x1de12ab1c5cc   9ec  b8616901       ldr w1, [x8, x1]
0x1de12ab1c5d0   9f0  0b0d0aad       add w13, w21, w13, lsl #2
0x1de12ab1c5d4   9f4  b86d690d       ldr w13, [x8, x13]
0x1de12ab1c5d8   9f8  14000003       b #+0xc (addr 0x1de12ab1c5e4)
0x1de12ab1c5dc   9fc  aa1c03e1       mov x1, x28
0x1de12ab1c5e0   a00  aa1c03ed       mov x13, x28
0x1de12ab1c5e4   a04  531e75ae       lsl w14, w13, #2
0x1de12ab1c5e8   a08  0b0e00af       add w15, w5, w14
0x1de12ab1c5ec   a0c  4b0d0033       sub w19, w1, w13
0x1de12ab1c5f0   a10  6b01001f       cmp w0, w1
0x1de12ab1c5f4   a14  9a9f27f4       cset x20, lo
0x1de12ab1c5f8   a18  6b0d003f       cmp w1, w13
0x1de12ab1c5fc   a1c  9a9f27f5       cset x21, lo
0x1de12ab1c600   a20  2a150296       orr w22, w20, w21
0x1de12ab1c604   a24  6a1602df       tst w22, w22
0x1de12ab1c608   a28  1a9313f6       csel w22, wzr, w19, ne
0x1de12ab1c60c   a2c  f9020bf6       str x22, [sp, #1040]
0x1de12ab1c610   a30  6b0d003f       cmp w1, w13
0x1de12ab1c614   a34  54000443       b.lo #+0x88 (addr 0x1de12ab1c69c)
0x1de12ab1c618   a38  0b0e012d       add w13, w9, w14
0x1de12ab1c61c   a3c  d2800097       movz x23, #0x4
0x1de12ab1c620   a40  6b01007f       cmp w3, w1
0x1de12ab1c624   a44  1a8d32f8       csel w24, w23, w13, lo
0x1de12ab1c628   a48  6b01007f       cmp w3, w1
0x1de12ab1c62c   a4c  1a93338d       csel w13, w28, w19, lo
0x1de12ab1c630   a50  121c61b9       and w25, w13, #0x1ffffff0
0x1de12ab1c634   a54  0b190b19       add w25, w24, w25, lsl #2
0x1de12ab1c638   a58  0b0e00db       add w27, w6, w14
0x1de12ab1c63c   a5c  6b01005f       cmp w2, w1
0x1de12ab1c640   a60  1a9b32e3       csel w3, w23, w27, lo
0x1de12ab1c644   a64  6b01005f       cmp w2, w1
0x1de12ab1c648   a68  1a93339b       csel w27, w28, w19, lo
0x1de12ab1c64c   a6c  121c6362       and w2, w27, #0x1ffffff0
0x1de12ab1c650   a70  0b020862       add w2, w3, w2, lsl #2
0x1de12ab1c654   a74  53047da7       lsr w7, w13, #4
0x1de12ab1c658   a78  12000dad       and w13, w13, #0xf
0x1de12ab1c65c   a7c  53047f6c       lsr w12, w27, #4
0x1de12ab1c660   a80  12000f7b       and w27, w27, #0xf
0x1de12ab1c664   a84  6b01009f       cmp w4, w1
0x1de12ab1c668   a88  54000103       b.lo #+0x20 (addr 0x1de12ab1c688)
0x1de12ab1c66c   a8c  0b0e014e       add w14, w10, w14
0x1de12ab1c670   a90  aa0d03f0       mov x16, x13
0x1de12ab1c674   a94  aa1303ed       mov x13, x19
0x1de12ab1c678   a98  aa0c03f3       mov x19, x12
0x1de12ab1c67c   a9c  aa0e03ec       mov x12, x14
0x1de12ab1c680   aa0  aa1003ee       mov x14, x16
0x1de12ab1c684   aa4  14000011       b #+0x44 (addr 0x1de12ab1c6c8)
0x1de12ab1c688   aa8  aa0d03ee       mov x14, x13
0x1de12ab1c68c   aac  aa1c03ed       mov x13, x28
0x1de12ab1c690   ab0  aa0c03f3       mov x19, x12
0x1de12ab1c694   ab4  aa1703ec       mov x12, x23
0x1de12ab1c698   ab8  1400000c       b #+0x30 (addr 0x1de12ab1c6c8)
0x1de12ab1c69c   abc  aa1c03ed       mov x13, x28
0x1de12ab1c6a0   ac0  aa1c03fb       mov cp, x28
0x1de12ab1c6a4   ac4  aa1c03ee       mov x14, x28
0x1de12ab1c6a8   ac8  d2800097       movz x23, #0x4
0x1de12ab1c6ac   acc  aa1c03f3       mov x19, x28
0x1de12ab1c6b0   ad0  aa1c03e7       mov x7, x28
0x1de12ab1c6b4   ad4  aa1703e2       mov x2, x23
0x1de12ab1c6b8   ad8  aa1703e3       mov x3, x23
0x1de12ab1c6bc   adc  aa1703ec       mov x12, x23
0x1de12ab1c6c0   ae0  aa1703f8       mov x24, x23
0x1de12ab1c6c4   ae4  aa1703f9       mov x25, x23
0x1de12ab1c6c8   ae8  2a150294       orr w20, w20, w21
0x1de12ab1c6cc   aec  6a14029f       tst w20, w20
0x1de12ab1c6d0   af0  1a8f12ef       csel w15, w23, w15, ne
0x1de12ab1c6d4   af4  12000ed4       and w20, w22, #0xf
0x1de12ab1c6d8   af8  53047db5       lsr w21, w13, #4
0x1de12ab1c6dc   afc  53047ed7       lsr w23, w22, #4
0x1de12ab1c6e0   b00  f901dbf9       str x25, [sp, #944]
0x1de12ab1c6e4   b04  6b17027f       cmp w19, w23
0x1de12ab1c6e8   b08  1a973279       csel w25, w19, w23, lo
0x1de12ab1c6ec   b0c  6b1900ff       cmp w7, w25
0x1de12ab1c6f0   b10  1a9930f3       csel w19, w7, w25, lo
0x1de12ab1c6f4   b14  6b1302bf       cmp w21, w19
0x1de12ab1c6f8   b18  1a9332b7       csel w23, w21, w19, lo
0x1de12ab1c6fc   b1c  f901dfe2       str x2, [sp, #952]
0x1de12ab1c700   b20  f90217ec       str x12, [sp, #1064]
0x1de12ab1c704   b24  f9020fef       str x15, [sp, #1048]
0x1de12ab1c708   b28  350003d7       cbnz w23, #+0x78 (addr 0x1de12ab1c780)
0x1de12ab1c70c   b2c  3dc083e0       ldr q0, [sp, #512]
0x1de12ab1c710   b30  4ea01c01       mov v1.16b, v0.16b
0x1de12ab1c714   b34  4ea01c02       mov v2.16b, v0.16b
0x1de12ab1c718   b38  4ea01c04       mov v4.16b, v0.16b
0x1de12ab1c71c   b3c  4ea01c07       mov v7.16b, v0.16b
0x1de12ab1c720   b40  4ea01c08       mov v8.16b, v0.16b
0x1de12ab1c724   b44  4ea01c09       mov v9.16b, v0.16b
0x1de12ab1c728   b48  4ea01c0c       mov v12.16b, v0.16b
0x1de12ab1c72c   b4c  4ea01c0d       mov v13.16b, v0.16b
0x1de12ab1c730   b50  4ea01c0e       mov v14.16b, v0.16b
0x1de12ab1c734   b54  4ea01c10       mov v16.16b, v0.16b
0x1de12ab1c738   b58  4ea01c11       mov v17.16b, v0.16b
0x1de12ab1c73c   b5c  4ea01c12       mov v18.16b, v0.16b
0x1de12ab1c740   b60  4ea01c13       mov v19.16b, v0.16b
0x1de12ab1c744   b64  4ea01c14       mov v20.16b, v0.16b
0x1de12ab1c748   b68  4ea01c15       mov v21.16b, v0.16b
0x1de12ab1c74c   b6c  4ea01c16       mov v22.16b, v0.16b
0x1de12ab1c750   b70  4ea01c17       mov v23.16b, v0.16b
0x1de12ab1c754   b74  4ea01c18       mov v24.16b, v0.16b
0x1de12ab1c758   b78  4ea01c19       mov v25.16b, v0.16b
0x1de12ab1c75c   b7c  4ea01c1a       mov v26.16b, v0.16b
0x1de12ab1c760   b80  4ea01c1b       mov v27.16b, v0.16b
0x1de12ab1c764   b84  4ea01c1c       mov v28.16b, v0.16b
0x1de12ab1c768   b88  3d803be0       str q0, [sp, #224]
0x1de12ab1c76c   b8c  3d802be0       str q0, [sp, #160]
0x1de12ab1c770   b90  3d8027e0       str q0, [sp, #144]
0x1de12ab1c774   b94  3d801be0       str q0, [sp, #96]
0x1de12ab1c778   b98  3d8007e0       str q0, [sp, #16]
0x1de12ab1c77c   b9c  14000104       b #+0x410 (addr 0x1de12ab1cb8c)
0x1de12ab1c780   ba0  6f00e40c       movi v12.2d, #0x0
0x1de12ab1c784   ba4  4eac1d87       mov v7.16b, v12.16b
0x1de12ab1c788   ba8  3d8043ec       str q12, [sp, #256]
0x1de12ab1c78c   bac  4eac1d99       mov v25.16b, v12.16b
0x1de12ab1c790   bb0  4eac1d80       mov v0.16b, v12.16b
0x1de12ab1c794   bb4  4eac1d88       mov v8.16b, v12.16b
0x1de12ab1c798   bb8  3d803bec       str q12, [sp, #224]
0x1de12ab1c79c   bbc  4eac1d9a       mov v26.16b, v12.16b
0x1de12ab1c7a0   bc0  4eac1d81       mov v1.16b, v12.16b
0x1de12ab1c7a4   bc4  4eac1d89       mov v9.16b, v12.16b
0x1de12ab1c7a8   bc8  3d8037ec       str q12, [sp, #208]
0x1de12ab1c7ac   bcc  4eac1d9b       mov v27.16b, v12.16b
0x1de12ab1c7b0   bd0  4eac1d82       mov v2.16b, v12.16b
0x1de12ab1c7b4   bd4  3d805bec       str q12, [sp, #352]
0x1de12ab1c7b8   bd8  4eac1d98       mov v24.16b, v12.16b
0x1de12ab1c7bc   bdc  4eac1d9c       mov v28.16b, v12.16b
0x1de12ab1c7c0   be0  4eac1d84       mov v4.16b, v12.16b
0x1de12ab1c7c4   be4  3d8067ec       str q12, [sp, #400]
0x1de12ab1c7c8   be8  3d805fec       str q12, [sp, #368]
0x1de12ab1c7cc   bec  3d8063ec       str q12, [sp, #384]
0x1de12ab1c7d0   bf0  3d80afec       str q12, [sp, #688]
0x1de12ab1c7d4   bf4  3d8057ec       str q12, [sp, #336]
0x1de12ab1c7d8   bf8  aa1c03f3       mov x19, x28
0x1de12ab1c7dc   bfc  3d80cfec       str q12, [sp, #816]
0x1de12ab1c7e0   c00  3d80bbec       str q12, [sp, #736]
0x1de12ab1c7e4   c04  3d804fec       str q12, [sp, #304]
0x1de12ab1c7e8   c08  3d80d7ec       str q12, [sp, #848]
0x1de12ab1c7ec   c0c  3d80c7ec       str q12, [sp, #784]
0x1de12ab1c7f0   c10  3d80b3ec       str q12, [sp, #704]
0x1de12ab1c7f4   c14  1400000f       b #+0x3c (addr 0x1de12ab1c830)
0x1de12ab1c7f8   c18  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1c7fc   c1c  3d8043f5       str q21, [sp, #256]
0x1de12ab1c800   c20  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1c804   c24  3d8037e3       str q3, [sp, #208]
0x1de12ab1c808   c28  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1c80c   c2c  3d80b3f2       str q18, [sp, #704]
0x1de12ab1c810   c30  3d803bf6       str q22, [sp, #224]
0x1de12ab1c814   c34  3d80c7f0       str q16, [sp, #784]
0x1de12ab1c818   c38  3d80d7ed       str q13, [sp, #848]
0x1de12ab1c81c   c3c  3d804ff4       str q20, [sp, #304]
0x1de12ab1c820   c40  3d80bbf1       str q17, [sp, #736]
0x1de12ab1c824   c44  3d80cfee       str q14, [sp, #816]
0x1de12ab1c828   c48  3d805bf7       str q23, [sp, #352]
0x1de12ab1c82c   c4c  3d8057f3       str q19, [sp, #336]
0x1de12ab1c830   c50  f8520355       ldur x21, [x26, #-224]
0x1de12ab1c834   c54  3d80ffec       str q12, [sp, #1008]
0x1de12ab1c838   c58  eb3563ff       cmp sp, x21
0x1de12ab1c83c   c5c  5400a509       b.ls #+0x14a0 (addr 0x1de12ab1dcdc)
0x1de12ab1c840   c60  0b1301f5       add w21, w15, w19
0x1de12ab1c844   c64  3cf5690c       ldr q12, [x8, x21]
0x1de12ab1c848   c68  4eacd56d       fsub v13.4s, v11.4s, v12.4s
0x1de12ab1c84c   c6c  6e2dddae       fmul v14.4s, v13.4s, v13.4s
0x1de12ab1c850   c70  0b130079       add w25, w3, w19
0x1de12ab1c854   c74  3cf96910       ldr q16, [x8, x25]
0x1de12ab1c858   c78  4eb0d551       fsub v17.4s, v10.4s, v16.4s
0x1de12ab1c85c   c7c  6e31de32       fmul v18.4s, v17.4s, v17.4s
0x1de12ab1c860   c80  4e32d5ce       fadd v14.4s, v14.4s, v18.4s
0x1de12ab1c864   c84  6e25e5d2       fcmge v18.4s, v14.4s, v5.4s
0x1de12ab1c868   c88  6eaee473       fcmgt v19.4s, v3.4s, v14.4s
0x1de12ab1c86c   c8c  4e331e52       and v18.16b, v18.16b, v19.16b
0x1de12ab1c870   c90  4ea0c9d3       fcmgt v19.4s, v14.4s, #0.0
0x1de12ab1c874   c94  4e261e73       and v19.16b, v19.16b, v6.16b
0x1de12ab1c878   c98  4e21da73       scvtf v19.4s, v19.4s
0x1de12ab1c87c   c9c  4e331e52       and v18.16b, v18.16b, v19.16b
0x1de12ab1c880   ca0  3dc067f3       ldr q19, [sp, #400]
0x1de12ab1c884   ca4  4e33d653       fadd v19.4s, v18.4s, v19.4s
0x1de12ab1c888   ca8  1100c2a7       add w7, w21, #0x30 (48)
0x1de12ab1c88c   cac  3d8067f3       str q19, [sp, #400]
0x1de12ab1c890   cb0  3ce76913       ldr q19, [x8, x7]
0x1de12ab1c894   cb4  3d8053ed       str q13, [sp, #320]
0x1de12ab1c898   cb8  4eb3d56d       fsub v13.4s, v11.4s, v19.4s
0x1de12ab1c89c   cbc  6e2dddb4       fmul v20.4s, v13.4s, v13.4s
0x1de12ab1c8a0   cc0  1100c327       add w7, w25, #0x30 (48)
0x1de12ab1c8a4   cc4  3d80b7ed       str q13, [sp, #720]
0x1de12ab1c8a8   cc8  3ce7690d       ldr q13, [x8, x7]
0x1de12ab1c8ac   ccc  3d804bf1       str q17, [sp, #288]
0x1de12ab1c8b0   cd0  4eadd551       fsub v17.4s, v10.4s, v13.4s
0x1de12ab1c8b4   cd4  3d8047ee       str q14, [sp, #272]
0x1de12ab1c8b8   cd8  6e31de2e       fmul v14.4s, v17.4s, v17.4s
0x1de12ab1c8bc   cdc  4e2ed68e       fadd v14.4s, v20.4s, v14.4s
0x1de12ab1c8c0   ce0  6e25e5d4       fcmge v20.4s, v14.4s, v5.4s
0x1de12ab1c8c4   ce4  3d80abf1       str q17, [sp, #672]
0x1de12ab1c8c8   ce8  6eaee471       fcmgt v17.4s, v3.4s, v14.4s
0x1de12ab1c8cc   cec  4e311e91       and v17.16b, v20.16b, v17.16b
0x1de12ab1c8d0   cf0  4ea0c9d4       fcmgt v20.4s, v14.4s, #0.0
0x1de12ab1c8d4   cf4  4e261e94       and v20.16b, v20.16b, v6.16b
0x1de12ab1c8d8   cf8  4e21da94       scvtf v20.4s, v20.4s
0x1de12ab1c8dc   cfc  4e341e31       and v17.16b, v17.16b, v20.16b
0x1de12ab1c8e0   d00  3dc0aff4       ldr q20, [sp, #688]
0x1de12ab1c8e4   d04  4e34d634       fadd v20.4s, v17.4s, v20.4s
0x1de12ab1c8e8   d08  110082a7       add w7, w21, #0x20 (32)
0x1de12ab1c8ec   d0c  3d80aff4       str q20, [sp, #688]
0x1de12ab1c8f0   d10  3ce76914       ldr q20, [x8, x7]
0x1de12ab1c8f4   d14  3d809bee       str q14, [sp, #608]
0x1de12ab1c8f8   d18  4eb4d56e       fsub v14.4s, v11.4s, v20.4s
0x1de12ab1c8fc   d1c  6e2eddd5       fmul v21.4s, v14.4s, v14.4s
0x1de12ab1c900   d20  11008327       add w7, w25, #0x20 (32)
0x1de12ab1c904   d24  3d80cbee       str q14, [sp, #800]
0x1de12ab1c908   d28  3ce7690e       ldr q14, [x8, x7]
0x1de12ab1c90c   d2c  4eaed556       fsub v22.4s, v10.4s, v14.4s
0x1de12ab1c910   d30  6e36ded7       fmul v23.4s, v22.4s, v22.4s
0x1de12ab1c914   d34  4e37d6b5       fadd v21.4s, v21.4s, v23.4s
0x1de12ab1c918   d38  6e25e6b7       fcmge v23.4s, v21.4s, v5.4s
0x1de12ab1c91c   d3c  3d80c3f6       str q22, [sp, #768]
0x1de12ab1c920   d40  6eb5e476       fcmgt v22.4s, v3.4s, v21.4s
0x1de12ab1c924   d44  4e361ef6       and v22.16b, v23.16b, v22.16b
0x1de12ab1c928   d48  4ea0cab7       fcmgt v23.4s, v21.4s, #0.0
0x1de12ab1c92c   d4c  4e261ef7       and v23.16b, v23.16b, v6.16b
0x1de12ab1c930   d50  4e21daf7       scvtf v23.4s, v23.4s
0x1de12ab1c934   d54  4e371ed6       and v22.16b, v22.16b, v23.16b
0x1de12ab1c938   d58  3dc063f7       ldr q23, [sp, #384]
0x1de12ab1c93c   d5c  4e37d6d7       fadd v23.4s, v22.4s, v23.4s
0x1de12ab1c940   d60  110042b5       add w21, w21, #0x10 (16)
0x1de12ab1c944   d64  3d8063f7       str q23, [sp, #384]
0x1de12ab1c948   d68  3cf56917       ldr q23, [x8, x21]
0x1de12ab1c94c   d6c  3d80bff5       str q21, [sp, #752]
0x1de12ab1c950   d70  4eb7d575       fsub v21.4s, v11.4s, v23.4s
0x1de12ab1c954   d74  6e35deab       fmul v11.4s, v21.4s, v21.4s
0x1de12ab1c958   d78  11004335       add w21, w25, #0x10 (16)
0x1de12ab1c95c   d7c  3d80fbf5       str q21, [sp, #992]
0x1de12ab1c960   d80  3cf56915       ldr q21, [x8, x21]
0x1de12ab1c964   d84  3d803ff7       str q23, [sp, #240]
0x1de12ab1c968   d88  4eb5d557       fsub v23.4s, v10.4s, v21.4s
0x1de12ab1c96c   d8c  6e37deea       fmul v10.4s, v23.4s, v23.4s
0x1de12ab1c970   d90  4e2ad56a       fadd v10.4s, v11.4s, v10.4s
0x1de12ab1c974   d94  6e25e54b       fcmge v11.4s, v10.4s, v5.4s
0x1de12ab1c978   d98  3d80d3f7       str q23, [sp, #832]
0x1de12ab1c97c   d9c  6eaae477       fcmgt v23.4s, v3.4s, v10.4s
0x1de12ab1c980   da0  4e371d6b       and v11.16b, v11.16b, v23.16b
0x1de12ab1c984   da4  4ea0c957       fcmgt v23.4s, v10.4s, #0.0
0x1de12ab1c988   da8  4e261ef7       and v23.16b, v23.16b, v6.16b
0x1de12ab1c98c   dac  4e21daf7       scvtf v23.4s, v23.4s
0x1de12ab1c990   db0  4e371d6b       and v11.16b, v11.16b, v23.16b
0x1de12ab1c994   db4  3dc05ff7       ldr q23, [sp, #368]
0x1de12ab1c998   db8  4e37d577       fadd v23.4s, v11.4s, v23.4s
0x1de12ab1c99c   dbc  0b130195       add w21, w12, w19
0x1de12ab1c9a0   dc0  3cf56903       ldr q3, [x8, x21]
0x1de12ab1c9a4   dc4  6e32dc63       fmul v3.4s, v3.4s, v18.4s
0x1de12ab1c9a8   dc8  3d805ff7       str q23, [sp, #368]
0x1de12ab1c9ac   dcc  3dc05bf7       ldr q23, [sp, #352]
0x1de12ab1c9b0   dd0  4e37d477       fadd v23.4s, v3.4s, v23.4s
0x1de12ab1c9b4   dd4  0b130319       add w25, w24, w19
0x1de12ab1c9b8   dd8  3cf96903       ldr q3, [x8, x25]
0x1de12ab1c9bc   ddc  6e32dc63       fmul v3.4s, v3.4s, v18.4s
0x1de12ab1c9c0   de0  4e29d469       fadd v9.4s, v3.4s, v9.4s
0x1de12ab1c9c4   de4  6e32de03       fmul v3.4s, v16.4s, v18.4s
0x1de12ab1c9c8   de8  4e28d468       fadd v8.4s, v3.4s, v8.4s
0x1de12ab1c9cc   dec  6e32dd83       fmul v3.4s, v12.4s, v18.4s
0x1de12ab1c9d0   df0  4e23d4e7       fadd v7.4s, v7.4s, v3.4s
0x1de12ab1c9d4   df4  1100c2a7       add w7, w21, #0x30 (48)
0x1de12ab1c9d8   df8  3ce76903       ldr q3, [x8, x7]
0x1de12ab1c9dc   dfc  6e31dc63       fmul v3.4s, v3.4s, v17.4s
0x1de12ab1c9e0   e00  4e24d464       fadd v4.4s, v3.4s, v4.4s
0x1de12ab1c9e4   e04  1100c327       add w7, w25, #0x30 (48)
0x1de12ab1c9e8   e08  3ce76903       ldr q3, [x8, x7]
0x1de12ab1c9ec   e0c  6e31dc63       fmul v3.4s, v3.4s, v17.4s
0x1de12ab1c9f0   e10  4e22d462       fadd v2.4s, v3.4s, v2.4s
0x1de12ab1c9f4   e14  6e31dda3       fmul v3.4s, v13.4s, v17.4s
0x1de12ab1c9f8   e18  4e21d461       fadd v1.4s, v3.4s, v1.4s
0x1de12ab1c9fc   e1c  6e31de63       fmul v3.4s, v19.4s, v17.4s
0x1de12ab1ca00   e20  4e23d400       fadd v0.4s, v0.4s, v3.4s
0x1de12ab1ca04   e24  110082a7       add w7, w21, #0x20 (32)
0x1de12ab1ca08   e28  3ce76903       ldr q3, [x8, x7]
0x1de12ab1ca0c   e2c  6e36dc63       fmul v3.4s, v3.4s, v22.4s
0x1de12ab1ca10   e30  4e3cd47c       fadd v28.4s, v3.4s, v28.4s
0x1de12ab1ca14   e34  11008327       add w7, w25, #0x20 (32)
0x1de12ab1ca18   e38  3ce76903       ldr q3, [x8, x7]
0x1de12ab1ca1c   e3c  6e36dc63       fmul v3.4s, v3.4s, v22.4s
0x1de12ab1ca20   e40  4e3bd47b       fadd v27.4s, v3.4s, v27.4s
0x1de12ab1ca24   e44  6e36ddc3       fmul v3.4s, v14.4s, v22.4s
0x1de12ab1ca28   e48  4e3ad47a       fadd v26.4s, v3.4s, v26.4s
0x1de12ab1ca2c   e4c  6e36de83       fmul v3.4s, v20.4s, v22.4s
0x1de12ab1ca30   e50  4e23d739       fadd v25.4s, v25.4s, v3.4s
0x1de12ab1ca34   e54  110042b5       add w21, w21, #0x10 (16)
0x1de12ab1ca38   e58  3cf56903       ldr q3, [x8, x21]
0x1de12ab1ca3c   e5c  6e2bdc63       fmul v3.4s, v3.4s, v11.4s
0x1de12ab1ca40   e60  4e38d478       fadd v24.4s, v3.4s, v24.4s
0x1de12ab1ca44   e64  11004335       add w21, w25, #0x10 (16)
0x1de12ab1ca48   e68  3cf56903       ldr q3, [x8, x21]
0x1de12ab1ca4c   e6c  6e2bdc63       fmul v3.4s, v3.4s, v11.4s
0x1de12ab1ca50   e70  3dc037ec       ldr q12, [sp, #208]
0x1de12ab1ca54   e74  4e2cd463       fadd v3.4s, v3.4s, v12.4s
0x1de12ab1ca58   e78  6e2bdeac       fmul v12.4s, v21.4s, v11.4s
0x1de12ab1ca5c   e7c  3dc03bf6       ldr q22, [sp, #224]
0x1de12ab1ca60   e80  4e36d596       fadd v22.4s, v12.4s, v22.4s
0x1de12ab1ca64   e84  3dc03fec       ldr q12, [sp, #240]
0x1de12ab1ca68   e88  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x1de12ab1ca6c   e8c  3dc043f5       ldr q21, [sp, #256]
0x1de12ab1ca70   e90  4e2bd6b5       fadd v21.4s, v21.4s, v11.4s
0x1de12ab1ca74   e94  3dc047eb       ldr q11, [sp, #272]
0x1de12ab1ca78   e98  6eabe4ab       fcmgt v11.4s, v5.4s, v11.4s
0x1de12ab1ca7c   e9c  4e261d6b       and v11.16b, v11.16b, v6.16b
0x1de12ab1ca80   ea0  4e21d96b       scvtf v11.4s, v11.4s
0x1de12ab1ca84   ea4  3dc04bec       ldr q12, [sp, #288]
0x1de12ab1ca88   ea8  6e2bdd8c       fmul v12.4s, v12.4s, v11.4s
0x1de12ab1ca8c   eac  3dc04ff4       ldr q20, [sp, #304]
0x1de12ab1ca90   eb0  4e2cd694       fadd v20.4s, v20.4s, v12.4s
0x1de12ab1ca94   eb4  3dc053ec       ldr q12, [sp, #320]
0x1de12ab1ca98   eb8  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x1de12ab1ca9c   ebc  3dc057f3       ldr q19, [sp, #336]
0x1de12ab1caa0   ec0  4e2bd673       fadd v19.4s, v19.4s, v11.4s
0x1de12ab1caa4   ec4  3dc09beb       ldr q11, [sp, #608]
0x1de12ab1caa8   ec8  6eabe4ab       fcmgt v11.4s, v5.4s, v11.4s
0x1de12ab1caac   ecc  4e261d6b       and v11.16b, v11.16b, v6.16b
0x1de12ab1cab0   ed0  4e21d96b       scvtf v11.4s, v11.4s
0x1de12ab1cab4   ed4  3dc0abec       ldr q12, [sp, #672]
0x1de12ab1cab8   ed8  6e2bdd8c       fmul v12.4s, v12.4s, v11.4s
0x1de12ab1cabc   edc  3dc0b3f2       ldr q18, [sp, #704]
0x1de12ab1cac0   ee0  4e2cd652       fadd v18.4s, v18.4s, v12.4s
0x1de12ab1cac4   ee4  3dc0b7ec       ldr q12, [sp, #720]
0x1de12ab1cac8   ee8  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x1de12ab1cacc   eec  3dc0bbf1       ldr q17, [sp, #736]
0x1de12ab1cad0   ef0  4e2bd631       fadd v17.4s, v17.4s, v11.4s
0x1de12ab1cad4   ef4  3dc0bfeb       ldr q11, [sp, #752]
0x1de12ab1cad8   ef8  6eabe4ab       fcmgt v11.4s, v5.4s, v11.4s
0x1de12ab1cadc   efc  4e261d6b       and v11.16b, v11.16b, v6.16b
0x1de12ab1cae0   f00  4e21d96b       scvtf v11.4s, v11.4s
0x1de12ab1cae4   f04  3dc0c3ec       ldr q12, [sp, #768]
0x1de12ab1cae8   f08  6e2bdd8c       fmul v12.4s, v12.4s, v11.4s
0x1de12ab1caec   f0c  3dc0c7f0       ldr q16, [sp, #784]
0x1de12ab1caf0   f10  4e2cd610       fadd v16.4s, v16.4s, v12.4s
0x1de12ab1caf4   f14  3dc0cbec       ldr q12, [sp, #800]
0x1de12ab1caf8   f18  6e2bdd8b       fmul v11.4s, v12.4s, v11.4s
0x1de12ab1cafc   f1c  3dc0cfee       ldr q14, [sp, #816]
0x1de12ab1cb00   f20  4e2bd5ce       fadd v14.4s, v14.4s, v11.4s
0x1de12ab1cb04   f24  6eaae4aa       fcmgt v10.4s, v5.4s, v10.4s
0x1de12ab1cb08   f28  4e261d4a       and v10.16b, v10.16b, v6.16b
0x1de12ab1cb0c   f2c  4e21d94a       scvtf v10.4s, v10.4s
0x1de12ab1cb10   f30  3dc0d3eb       ldr q11, [sp, #832]
0x1de12ab1cb14   f34  6e2add6b       fmul v11.4s, v11.4s, v10.4s
0x1de12ab1cb18   f38  3dc0d7ed       ldr q13, [sp, #848]
0x1de12ab1cb1c   f3c  4e2bd5ad       fadd v13.4s, v13.4s, v11.4s
0x1de12ab1cb20   f40  3dc0fbeb       ldr q11, [sp, #992]
0x1de12ab1cb24   f44  6e2add6a       fmul v10.4s, v11.4s, v10.4s
0x1de12ab1cb28   f48  3dc0ffec       ldr q12, [sp, #1008]
0x1de12ab1cb2c   f4c  4e2ad58c       fadd v12.4s, v12.4s, v10.4s
0x1de12ab1cb30   f50  11010273       add w19, w19, #0x40 (64)
0x1de12ab1cb34   f54  510006f7       sub w23, w23, #0x1 (1)
0x1de12ab1cb38   f58  35ffe617       cbnz w23, #-0x340 (addr 0x1de12ab1c7f8)
0x1de12ab1cb3c   f5c  3d8027fb       str q27, [sp, #144]
0x1de12ab1cb40   f60  4eb91f3b       mov v27.16b, v25.16b
0x1de12ab1cb44   f64  4ea71cf9       mov v25.16b, v7.16b
0x1de12ab1cb48   f68  3d802bfa       str q26, [sp, #160]
0x1de12ab1cb4c   f6c  4eb51eba       mov v26.16b, v21.16b
0x1de12ab1cb50   f70  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1cb54   f74  3d801be1       str q1, [sp, #96]
0x1de12ab1cb58   f78  4ea81d01       mov v1.16b, v8.16b
0x1de12ab1cb5c   f7c  3d803bf6       str q22, [sp, #224]
0x1de12ab1cb60   f80  3d8007e9       str q9, [sp, #16]
0x1de12ab1cb64   f84  4ea21c56       mov v22.16b, v2.16b
0x1de12ab1cb68   f88  4ea31c62       mov v2.16b, v3.16b
0x1de12ab1cb6c   f8c  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1cb70   f90  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1cb74   f94  4eb41e88       mov v8.16b, v20.16b
0x1de12ab1cb78   f98  4ea41c95       mov v21.16b, v4.16b
0x1de12ab1cb7c   f9c  3dc067e9       ldr q9, [sp, #400]
0x1de12ab1cb80   fa0  3dc05fe4       ldr q4, [sp, #368]
0x1de12ab1cb84   fa4  3dc063e7       ldr q7, [sp, #384]
0x1de12ab1cb88   fa8  3dc0aff4       ldr q20, [sp, #688]
0x1de12ab1cb8c   fac  3d8033f8       str q24, [sp, #192]
0x1de12ab1cb90   fb0  3d8037e2       str q2, [sp, #208]
0x1de12ab1cb94   fb4  3d805bf7       str q23, [sp, #352]
0x1de12ab1cb98   fb8  3d805fe4       str q4, [sp, #368]
0x1de12ab1cb9c   fbc  3d8063e7       str q7, [sp, #384]
0x1de12ab1cba0   fc0  3d8067e9       str q9, [sp, #400]
0x1de12ab1cba4   fc4  3d8013f5       str q21, [sp, #64]
0x1de12ab1cba8   fc8  3d8023fc       str q28, [sp, #128]
0x1de12ab1cbac   fcc  3d8017f6       str q22, [sp, #80]
0x1de12ab1cbb0   fd0  3d800ff9       str q25, [sp, #48]
0x1de12ab1cbb4   fd4  3d8043fa       str q26, [sp, #256]
0x1de12ab1cbb8   fd8  3d802ffb       str q27, [sp, #176]
0x1de12ab1cbbc   fdc  3d801fe0       str q0, [sp, #112]
0x1de12ab1cbc0   fe0  3d800be1       str q1, [sp, #32]
0x1de12ab1cbc4   fe4  34002cb4       cbz w20, #+0x594 (addr 0x1de12ab1d158)
0x1de12ab1cbc8   fe8  51004033       sub w19, w1, #0x10 (16)
0x1de12ab1cbcc   fec  6b13003f       cmp w1, w19
0x1de12ab1cbd0   ff0  1a933395       csel w21, w28, w19, lo
0x1de12ab1cbd4   ff4  110042b3       add w19, w21, #0x10 (16)
0x1de12ab1cbd8   ff8  6b13001f       cmp w0, w19
0x1de12ab1cbdc   ffc  54002be3       b.lo #+0x57c (addr 0x1de12ab1d158)
0x1de12ab1cbe0  1000  6b13017f       cmp w11, w19
0x1de12ab1cbe4  1004  54002b63       b.lo #+0x56c (addr 0x1de12ab1d150)
0x1de12ab1cbe8  1008  531e76ac       lsl w12, w21, #2
0x1de12ab1cbec  100c  0b0c012d       add w13, w9, w12
0x1de12ab1cbf0  1010  3ced6919       ldr q25, [x8, x13]
0x1de12ab1cbf4  1014  910041ae       add x14, x13, #0x10 (16)
0x1de12ab1cbf8  1018  3cee691a       ldr q26, [x8, x14]
0x1de12ab1cbfc  101c  910081ae       add x14, x13, #0x20 (32)
0x1de12ab1cc00  1020  3cee691b       ldr q27, [x8, x14]
0x1de12ab1cc04  1024  9100c1ad       add x13, x13, #0x30 (48)
0x1de12ab1cc08  1028  3ced6900       ldr q0, [x8, x13]
0x1de12ab1cc0c  102c  0b0c014d       add w13, w10, w12
0x1de12ab1cc10  1030  3ced6901       ldr q1, [x8, x13]
0x1de12ab1cc14  1034  910041ae       add x14, x13, #0x10 (16)
0x1de12ab1cc18  1038  3d80c7f9       str q25, [sp, #784]
0x1de12ab1cc1c  103c  3cee6919       ldr q25, [x8, x14]
0x1de12ab1cc20  1040  910081ae       add x14, x13, #0x20 (32)
0x1de12ab1cc24  1044  3cee6902       ldr q2, [x8, x14]
0x1de12ab1cc28  1048  9100c1ad       add x13, x13, #0x30 (48)
0x1de12ab1cc2c  104c  3d80c3fa       str q26, [sp, #768]
0x1de12ab1cc30  1050  3ced691a       ldr q26, [x8, x13]
0x1de12ab1cc34  1054  0b0c00cd       add w13, w6, w12
0x1de12ab1cc38  1058  3d80bffb       str q27, [sp, #752]
0x1de12ab1cc3c  105c  3ced691b       ldr q27, [x8, x13]
0x1de12ab1cc40  1060  910041ae       add x14, x13, #0x10 (16)
0x1de12ab1cc44  1064  3cee6916       ldr q22, [x8, x14]
0x1de12ab1cc48  1068  910081ae       add x14, x13, #0x20 (32)
0x1de12ab1cc4c  106c  3d80bbe0       str q0, [sp, #736]
0x1de12ab1cc50  1070  3cee6900       ldr q0, [x8, x14]
0x1de12ab1cc54  1074  0b0c00ac       add w12, w5, w12
0x1de12ab1cc58  1078  3cec6917       ldr q23, [x8, x12]
0x1de12ab1cc5c  107c  9100418e       add x14, x12, #0x10 (16)
0x1de12ab1cc60  1080  3d80b7e1       str q1, [sp, #720]
0x1de12ab1cc64  1084  3cee6901       ldr q1, [x8, x14]
0x1de12ab1cc68  1088  9100818e       add x14, x12, #0x20 (32)
0x1de12ab1cc6c  108c  3cee6918       ldr q24, [x8, x14]
0x1de12ab1cc70  1090  9100c1ad       add x13, x13, #0x30 (48)
0x1de12ab1cc74  1094  3d80b3f9       str q25, [sp, #704]
0x1de12ab1cc78  1098  3ced6919       ldr q25, [x8, x13]
0x1de12ab1cc7c  109c  4eb9d55c       fsub v28.4s, v10.4s, v25.4s
0x1de12ab1cc80  10a0  0b1402ad       add w13, w21, w20
0x1de12ab1cc84  10a4  4b0d002d       sub w13, w1, w13
0x1de12ab1cc88  10a8  3d80cbf9       str q25, [sp, #800]
0x1de12ab1cc8c  10ac  4e040db9       dup v25.4s, w13
0x1de12ab1cc90  10b0  3d80afe2       str q2, [sp, #688]
0x1de12ab1cc94  10b4  d28001b0       movz x16, #0xd
0x1de12ab1cc98  10b8  f2c001d0       movk x16, #0xe, lsl #32
0x1de12ab1cc9c  10bc  9e670202       fmov d2, x16
0x1de12ab1cca0  10c0  d28001f0       movz x16, #0xf
0x1de12ab1cca4  10c4  f2c00210       movk x16, #0x10, lsl #32
0x1de12ab1cca8  10c8  4e181e02       mov v2.d[1], x16
0x1de12ab1ccac  10cc  6eb93442       cmhi v2.4s, v2.4s, v25.4s
0x1de12ab1ccb0  10d0  4b150021       sub w1, w1, w21
0x1de12ab1ccb4  10d4  4e040c35       dup v21.4s, w1
0x1de12ab1ccb8  10d8  3d80abfa       str q26, [sp, #672]
0x1de12ab1ccbc  10dc  d2800190       movz x16, #0xc
0x1de12ab1ccc0  10e0  f2c001b0       movk x16, #0xd, lsl #32
0x1de12ab1ccc4  10e4  9e67021a       fmov d26, x16
0x1de12ab1ccc8  10e8  d28001d0       movz x16, #0xe
0x1de12ab1cccc  10ec  f2c001f0       movk x16, #0xf, lsl #32
0x1de12ab1ccd0  10f0  4e181e1a       mov v26.d[1], x16
0x1de12ab1ccd4  10f4  6eba36ba       cmhi v26.4s, v21.4s, v26.4s
0x1de12ab1ccd8  10f8  4e3a1c42       and v2.16b, v2.16b, v26.16b
0x1de12ab1ccdc  10fc  9100c181       add x1, x12, #0x30 (48)
0x1de12ab1cce0  1100  3ce1691a       ldr q26, [x8, x1]
0x1de12ab1cce4  1104  4ebad569       fsub v9.4s, v11.4s, v26.4s
0x1de12ab1cce8  1108  3d80d7fa       str q26, [sp, #848]
0x1de12ab1ccec  110c  6e29dd3a       fmul v26.4s, v9.4s, v9.4s
0x1de12ab1ccf0  1110  6e3cdf84       fmul v4.4s, v28.4s, v28.4s
0x1de12ab1ccf4  1114  4e24d744       fadd v4.4s, v26.4s, v4.4s
0x1de12ab1ccf8  1118  6ea4e4ba       fcmgt v26.4s, v5.4s, v4.4s
0x1de12ab1ccfc  111c  4e261f5a       and v26.16b, v26.16b, v6.16b
0x1de12ab1cd00  1120  4e21db5a       scvtf v26.4s, v26.4s
0x1de12ab1cd04  1124  4e3a1c5a       and v26.16b, v2.16b, v26.16b
0x1de12ab1cd08  1128  6e3adf9c       fmul v28.4s, v28.4s, v26.4s
0x1de12ab1cd0c  112c  4e32d792       fadd v18.4s, v28.4s, v18.4s
0x1de12ab1cd10  1130  f94263ec       ldr x12, [sp, #1216]
0x1de12ab1cd14  1134  9107c181       add x1, x12, #0x1f0 (496)
0x1de12ab1cd18  1138  3ca16912       str q18, [x8, x1]
0x1de12ab1cd1c  113c  4ea0d552       fsub v18.4s, v10.4s, v0.4s
0x1de12ab1cd20  1140  d2800130       movz x16, #0x9
0x1de12ab1cd24  1144  f2c00150       movk x16, #0xa, lsl #32
0x1de12ab1cd28  1148  9e67021c       fmov d28, x16
0x1de12ab1cd2c  114c  d2800170       movz x16, #0xb
0x1de12ab1cd30  1150  f2c00190       movk x16, #0xc, lsl #32
0x1de12ab1cd34  1154  4e181e1c       mov v28.d[1], x16
0x1de12ab1cd38  1158  6eb9379c       cmhi v28.4s, v28.4s, v25.4s
0x1de12ab1cd3c  115c  3d80cfe0       str q0, [sp, #816]
0x1de12ab1cd40  1160  d2800110       movz x16, #0x8
0x1de12ab1cd44  1164  f2c00130       movk x16, #0x9, lsl #32
0x1de12ab1cd48  1168  9e670200       fmov d0, x16
0x1de12ab1cd4c  116c  d2800150       movz x16, #0xa
0x1de12ab1cd50  1170  f2c00170       movk x16, #0xb, lsl #32
0x1de12ab1cd54  1174  4e181e00       mov v0.d[1], x16
0x1de12ab1cd58  1178  6ea036a0       cmhi v0.4s, v21.4s, v0.4s
0x1de12ab1cd5c  117c  4e201f9c       and v28.16b, v28.16b, v0.16b
0x1de12ab1cd60  1180  4eb8d560       fsub v0.4s, v11.4s, v24.4s
0x1de12ab1cd64  1184  3d80fbf8       str q24, [sp, #992]
0x1de12ab1cd68  1188  6e20dc18       fmul v24.4s, v0.4s, v0.4s
0x1de12ab1cd6c  118c  6e32de47       fmul v7.4s, v18.4s, v18.4s
0x1de12ab1cd70  1190  4e27d707       fadd v7.4s, v24.4s, v7.4s
0x1de12ab1cd74  1194  6ea7e4b8       fcmgt v24.4s, v5.4s, v7.4s
0x1de12ab1cd78  1198  4e261f18       and v24.16b, v24.16b, v6.16b
0x1de12ab1cd7c  119c  4e21db18       scvtf v24.4s, v24.4s
0x1de12ab1cd80  11a0  4e381f98       and v24.16b, v28.16b, v24.16b
0x1de12ab1cd84  11a4  6e38de52       fmul v18.4s, v18.4s, v24.4s
0x1de12ab1cd88  11a8  4e30d650       fadd v16.4s, v18.4s, v16.4s
0x1de12ab1cd8c  11ac  91078181       add x1, x12, #0x1e0 (480)
0x1de12ab1cd90  11b0  3ca16910       str q16, [x8, x1]
0x1de12ab1cd94  11b4  4eb6d550       fsub v16.4s, v10.4s, v22.4s
0x1de12ab1cd98  11b8  d28000b0       movz x16, #0x5
0x1de12ab1cd9c  11bc  f2c000d0       movk x16, #0x6, lsl #32
0x1de12ab1cda0  11c0  9e670212       fmov d18, x16
0x1de12ab1cda4  11c4  d28000f0       movz x16, #0x7
0x1de12ab1cda8  11c8  f2c00110       movk x16, #0x8, lsl #32
0x1de12ab1cdac  11cc  4e181e12       mov v18.d[1], x16
0x1de12ab1cdb0  11d0  6eb93652       cmhi v18.4s, v18.4s, v25.4s
0x1de12ab1cdb4  11d4  3d80d3f6       str q22, [sp, #832]
0x1de12ab1cdb8  11d8  d2800090       movz x16, #0x4
0x1de12ab1cdbc  11dc  f2c000b0       movk x16, #0x5, lsl #32
0x1de12ab1cdc0  11e0  9e670216       fmov d22, x16
0x1de12ab1cdc4  11e4  d28000d0       movz x16, #0x6
0x1de12ab1cdc8  11e8  f2c000f0       movk x16, #0x7, lsl #32
0x1de12ab1cdcc  11ec  4e181e16       mov v22.d[1], x16
0x1de12ab1cdd0  11f0  6eb636b6       cmhi v22.4s, v21.4s, v22.4s
0x1de12ab1cdd4  11f4  4e361e52       and v18.16b, v18.16b, v22.16b
0x1de12ab1cdd8  11f8  4ea1d576       fsub v22.4s, v11.4s, v1.4s
0x1de12ab1cddc  11fc  3d80ffe1       str q1, [sp, #1008]
0x1de12ab1cde0  1200  6e36dec1       fmul v1.4s, v22.4s, v22.4s
0x1de12ab1cde4  1204  3d809bfc       str q28, [sp, #608]
0x1de12ab1cde8  1208  6e30de1c       fmul v28.4s, v16.4s, v16.4s
0x1de12ab1cdec  120c  4e3cd43c       fadd v28.4s, v1.4s, v28.4s
0x1de12ab1cdf0  1210  6ebce4a1       fcmgt v1.4s, v5.4s, v28.4s
0x1de12ab1cdf4  1214  4e261c21       and v1.16b, v1.16b, v6.16b
0x1de12ab1cdf8  1218  4e21d821       scvtf v1.4s, v1.4s
0x1de12ab1cdfc  121c  4e211e41       and v1.16b, v18.16b, v1.16b
0x1de12ab1ce00  1220  6e21de10       fmul v16.4s, v16.4s, v1.4s
0x1de12ab1ce04  1224  4e2dd60d       fadd v13.4s, v16.4s, v13.4s
0x1de12ab1ce08  1228  91074181       add x1, x12, #0x1d0 (464)
0x1de12ab1ce0c  122c  3ca1690d       str q13, [x8, x1]
0x1de12ab1ce10  1230  4ebbd54d       fsub v13.4s, v10.4s, v27.4s
0x1de12ab1ce14  1234  d2800030       movz x16, #0x1
0x1de12ab1ce18  1238  f2c00050       movk x16, #0x2, lsl #32
0x1de12ab1ce1c  123c  9e670210       fmov d16, x16
0x1de12ab1ce20  1240  d2800070       movz x16, #0x3
0x1de12ab1ce24  1244  f2c00090       movk x16, #0x4, lsl #32
0x1de12ab1ce28  1248  4e181e10       mov v16.d[1], x16
0x1de12ab1ce2c  124c  6eb93610       cmhi v16.4s, v16.4s, v25.4s
0x1de12ab1ce30  1250  d2c00030       movz x16, #0x100000000
0x1de12ab1ce34  1254  9e670219       fmov d25, x16
0x1de12ab1ce38  1258  d2800050       movz x16, #0x2
0x1de12ab1ce3c  125c  f2c00070       movk x16, #0x3, lsl #32
0x1de12ab1ce40  1260  4e181e19       mov v25.d[1], x16
0x1de12ab1ce44  1264  6eb936b5       cmhi v21.4s, v21.4s, v25.4s
0x1de12ab1ce48  1268  4e351e10       and v16.16b, v16.16b, v21.16b
0x1de12ab1ce4c  126c  4eb7d575       fsub v21.4s, v11.4s, v23.4s
0x1de12ab1ce50  1270  6e35deb9       fmul v25.4s, v21.4s, v21.4s
0x1de12ab1ce54  1274  6e2dddaa       fmul v10.4s, v13.4s, v13.4s
0x1de12ab1ce58  1278  4e2ad72a       fadd v10.4s, v25.4s, v10.4s
0x1de12ab1ce5c  127c  6eaae4b9       fcmgt v25.4s, v5.4s, v10.4s
0x1de12ab1ce60  1280  4e261f39       and v25.16b, v25.16b, v6.16b
0x1de12ab1ce64  1284  4e21db39       scvtf v25.4s, v25.4s
0x1de12ab1ce68  1288  4e391e19       and v25.16b, v16.16b, v25.16b
0x1de12ab1ce6c  128c  6e39ddad       fmul v13.4s, v13.4s, v25.4s
0x1de12ab1ce70  1290  4e28d5a8       fadd v8.4s, v13.4s, v8.4s
0x1de12ab1ce74  1294  91070181       add x1, x12, #0x1c0 (448)
0x1de12ab1ce78  1298  3ca16908       str q8, [x8, x1]
0x1de12ab1ce7c  129c  6e3add28       fmul v8.4s, v9.4s, v26.4s
0x1de12ab1ce80  12a0  4e31d508       fadd v8.4s, v8.4s, v17.4s
0x1de12ab1ce84  12a4  9106c181       add x1, x12, #0x1b0 (432)
0x1de12ab1ce88  12a8  3ca16908       str q8, [x8, x1]
0x1de12ab1ce8c  12ac  6e38dc08       fmul v8.4s, v0.4s, v24.4s
0x1de12ab1ce90  12b0  4e2ed508       fadd v8.4s, v8.4s, v14.4s
0x1de12ab1ce94  12b4  91068181       add x1, x12, #0x1a0 (416)
0x1de12ab1ce98  12b8  3ca16908       str q8, [x8, x1]
0x1de12ab1ce9c  12bc  6e21dec8       fmul v8.4s, v22.4s, v1.4s
0x1de12ab1cea0  12c0  4e2cd508       fadd v8.4s, v8.4s, v12.4s
0x1de12ab1cea4  12c4  91064181       add x1, x12, #0x190 (400)
0x1de12ab1cea8  12c8  3ca16908       str q8, [x8, x1]
0x1de12ab1ceac  12cc  6e39dea8       fmul v8.4s, v21.4s, v25.4s
0x1de12ab1ceb0  12d0  4e33d508       fadd v8.4s, v8.4s, v19.4s
0x1de12ab1ceb4  12d4  91060181       add x1, x12, #0x180 (384)
0x1de12ab1ceb8  12d8  3ca16908       str q8, [x8, x1]
0x1de12ab1cebc  12dc  6e25e488       fcmge v8.4s, v4.4s, v5.4s
0x1de12ab1cec0  12e0  6ea4e469       fcmgt v9.4s, v3.4s, v4.4s
0x1de12ab1cec4  12e4  4e291d08       and v8.16b, v8.16b, v9.16b
0x1de12ab1cec8  12e8  4e281c42       and v2.16b, v2.16b, v8.16b
0x1de12ab1cecc  12ec  4f3f5442       shl v2.4s, v2.4s, #31
0x1de12ab1ced0  12f0  4f210442       sshr v2.4s, v2.4s, #31
0x1de12ab1ced4  12f4  4ea0c884       fcmgt v4.4s, v4.4s, #0.0
0x1de12ab1ced8  12f8  4e261c84       and v4.16b, v4.16b, v6.16b
0x1de12ab1cedc  12fc  4e21d884       scvtf v4.4s, v4.4s
0x1de12ab1cee0  1300  4e241c42       and v2.16b, v2.16b, v4.16b
0x1de12ab1cee4  1304  4e34d444       fadd v4.4s, v2.4s, v20.4s
0x1de12ab1cee8  1308  9105c181       add x1, x12, #0x170 (368)
0x1de12ab1ceec  130c  3ca16904       str q4, [x8, x1]
0x1de12ab1cef0  1310  6e25e4e4       fcmge v4.4s, v7.4s, v5.4s
0x1de12ab1cef4  1314  6ea7e468       fcmgt v8.4s, v3.4s, v7.4s
0x1de12ab1cef8  1318  4e281c84       and v4.16b, v4.16b, v8.16b
0x1de12ab1cefc  131c  3dc09be8       ldr q8, [sp, #608]
0x1de12ab1cf00  1320  4e241d04       and v4.16b, v8.16b, v4.16b
0x1de12ab1cf04  1324  4f3f5484       shl v4.4s, v4.4s, #31
0x1de12ab1cf08  1328  4f210484       sshr v4.4s, v4.4s, #31
0x1de12ab1cf0c  132c  4ea0c8e7       fcmgt v7.4s, v7.4s, #0.0
0x1de12ab1cf10  1330  4e261ce7       and v7.16b, v7.16b, v6.16b
0x1de12ab1cf14  1334  4e21d8e7       scvtf v7.4s, v7.4s
0x1de12ab1cf18  1338  4e271c84       and v4.16b, v4.16b, v7.16b
0x1de12ab1cf1c  133c  3dc063e7       ldr q7, [sp, #384]
0x1de12ab1cf20  1340  4e27d487       fadd v7.4s, v4.4s, v7.4s
0x1de12ab1cf24  1344  91058181       add x1, x12, #0x160 (352)
0x1de12ab1cf28  1348  3ca16907       str q7, [x8, x1]
0x1de12ab1cf2c  134c  6e25e787       fcmge v7.4s, v28.4s, v5.4s
0x1de12ab1cf30  1350  6ebce468       fcmgt v8.4s, v3.4s, v28.4s
0x1de12ab1cf34  1354  4e281ce7       and v7.16b, v7.16b, v8.16b
0x1de12ab1cf38  1358  4e271e47       and v7.16b, v18.16b, v7.16b
0x1de12ab1cf3c  135c  4f3f54e7       shl v7.4s, v7.4s, #31
0x1de12ab1cf40  1360  4f2104e7       sshr v7.4s, v7.4s, #31
0x1de12ab1cf44  1364  4ea0cb88       fcmgt v8.4s, v28.4s, #0.0
0x1de12ab1cf48  1368  4e261d08       and v8.16b, v8.16b, v6.16b
0x1de12ab1cf4c  136c  4e21d908       scvtf v8.4s, v8.4s
0x1de12ab1cf50  1370  4e281ce7       and v7.16b, v7.16b, v8.16b
0x1de12ab1cf54  1374  3dc05fe9       ldr q9, [sp, #368]
0x1de12ab1cf58  1378  4e29d4e8       fadd v8.4s, v7.4s, v9.4s
0x1de12ab1cf5c  137c  91054181       add x1, x12, #0x150 (336)
0x1de12ab1cf60  1380  3ca16908       str q8, [x8, x1]
0x1de12ab1cf64  1384  6e25e548       fcmge v8.4s, v10.4s, v5.4s
0x1de12ab1cf68  1388  6eaae469       fcmgt v9.4s, v3.4s, v10.4s
0x1de12ab1cf6c  138c  4e291d08       and v8.16b, v8.16b, v9.16b
0x1de12ab1cf70  1390  4e281e08       and v8.16b, v16.16b, v8.16b
0x1de12ab1cf74  1394  4f3f5508       shl v8.4s, v8.4s, #31
0x1de12ab1cf78  1398  4f210508       sshr v8.4s, v8.4s, #31
0x1de12ab1cf7c  139c  4ea0c949       fcmgt v9.4s, v10.4s, #0.0
0x1de12ab1cf80  13a0  4e261d29       and v9.16b, v9.16b, v6.16b
0x1de12ab1cf84  13a4  4e21d929       scvtf v9.4s, v9.4s
0x1de12ab1cf88  13a8  4e291d08       and v8.16b, v8.16b, v9.16b
0x1de12ab1cf8c  13ac  3dc067ea       ldr q10, [sp, #400]
0x1de12ab1cf90  13b0  4e2ad509       fadd v9.4s, v8.4s, v10.4s
0x1de12ab1cf94  13b4  91050181       add x1, x12, #0x140 (320)
0x1de12ab1cf98  13b8  3ca16909       str q9, [x8, x1]
0x1de12ab1cf9c  13bc  3dc0abe9       ldr q9, [sp, #672]
0x1de12ab1cfa0  13c0  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x1de12ab1cfa4  13c4  3dc013f5       ldr q21, [sp, #64]
0x1de12ab1cfa8  13c8  4e35d529       fadd v9.4s, v9.4s, v21.4s
0x1de12ab1cfac  13cc  9104c181       add x1, x12, #0x130 (304)
0x1de12ab1cfb0  13d0  3ca16909       str q9, [x8, x1]
0x1de12ab1cfb4  13d4  3dc0afe9       ldr q9, [sp, #688]
0x1de12ab1cfb8  13d8  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x1de12ab1cfbc  13dc  3dc023fc       ldr q28, [sp, #128]
0x1de12ab1cfc0  13e0  4e3cd529       fadd v9.4s, v9.4s, v28.4s
0x1de12ab1cfc4  13e4  91048181       add x1, x12, #0x120 (288)
0x1de12ab1cfc8  13e8  3ca16909       str q9, [x8, x1]
0x1de12ab1cfcc  13ec  3dc0b3e9       ldr q9, [sp, #704]
0x1de12ab1cfd0  13f0  6e27dd29       fmul v9.4s, v9.4s, v7.4s
0x1de12ab1cfd4  13f4  3dc033f8       ldr q24, [sp, #192]
0x1de12ab1cfd8  13f8  4e38d529       fadd v9.4s, v9.4s, v24.4s
0x1de12ab1cfdc  13fc  91044181       add x1, x12, #0x110 (272)
0x1de12ab1cfe0  1400  3ca16909       str q9, [x8, x1]
0x1de12ab1cfe4  1404  3dc0b7e9       ldr q9, [sp, #720]
0x1de12ab1cfe8  1408  6e28dd29       fmul v9.4s, v9.4s, v8.4s
0x1de12ab1cfec  140c  3dc05bf6       ldr q22, [sp, #352]
0x1de12ab1cff0  1410  4e36d529       fadd v9.4s, v9.4s, v22.4s
0x1de12ab1cff4  1414  91040181       add x1, x12, #0x100 (256)
0x1de12ab1cff8  1418  3ca16909       str q9, [x8, x1]
0x1de12ab1cffc  141c  3dc0bbe9       ldr q9, [sp, #736]
0x1de12ab1d000  1420  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x1de12ab1d004  1424  3dc017f9       ldr q25, [sp, #80]
0x1de12ab1d008  1428  4e39d529       fadd v9.4s, v9.4s, v25.4s
0x1de12ab1d00c  142c  9103c181       add x1, x12, #0xf0 (240)
0x1de12ab1d010  1430  3ca16909       str q9, [x8, x1]
0x1de12ab1d014  1434  3dc0bfe9       ldr q9, [sp, #752]
0x1de12ab1d018  1438  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x1de12ab1d01c  143c  3dc027fa       ldr q26, [sp, #144]
0x1de12ab1d020  1440  4e3ad529       fadd v9.4s, v9.4s, v26.4s
0x1de12ab1d024  1444  91038181       add x1, x12, #0xe0 (224)
0x1de12ab1d028  1448  3ca16909       str q9, [x8, x1]
0x1de12ab1d02c  144c  3dc0c3e9       ldr q9, [sp, #768]
0x1de12ab1d030  1450  6e27dd29       fmul v9.4s, v9.4s, v7.4s
0x1de12ab1d034  1454  3dc037e0       ldr q0, [sp, #208]
0x1de12ab1d038  1458  4e20d529       fadd v9.4s, v9.4s, v0.4s
0x1de12ab1d03c  145c  91034181       add x1, x12, #0xd0 (208)
0x1de12ab1d040  1460  3ca16909       str q9, [x8, x1]
0x1de12ab1d044  1464  3dc0c7e9       ldr q9, [sp, #784]
0x1de12ab1d048  1468  6e28dd29       fmul v9.4s, v9.4s, v8.4s
0x1de12ab1d04c  146c  3dc007e1       ldr q1, [sp, #16]
0x1de12ab1d050  1470  4e21d529       fadd v9.4s, v9.4s, v1.4s
0x1de12ab1d054  1474  91030181       add x1, x12, #0xc0 (192)
0x1de12ab1d058  1478  3ca16909       str q9, [x8, x1]
0x1de12ab1d05c  147c  3dc0cbe9       ldr q9, [sp, #800]
0x1de12ab1d060  1480  6e22dd29       fmul v9.4s, v9.4s, v2.4s
0x1de12ab1d064  1484  3dc01be1       ldr q1, [sp, #96]
0x1de12ab1d068  1488  4e21d529       fadd v9.4s, v9.4s, v1.4s
0x1de12ab1d06c  148c  9102c181       add x1, x12, #0xb0 (176)
0x1de12ab1d070  1490  3ca16909       str q9, [x8, x1]
0x1de12ab1d074  1494  3dc0cfe9       ldr q9, [sp, #816]
0x1de12ab1d078  1498  6e24dd29       fmul v9.4s, v9.4s, v4.4s
0x1de12ab1d07c  149c  3dc02bfa       ldr q26, [sp, #160]
0x1de12ab1d080  14a0  4e3ad529       fadd v9.4s, v9.4s, v26.4s
0x1de12ab1d084  14a4  91028181       add x1, x12, #0xa0 (160)
0x1de12ab1d088  14a8  3ca16909       str q9, [x8, x1]
0x1de12ab1d08c  14ac  3dc0d3e9       ldr q9, [sp, #832]
0x1de12ab1d090  14b0  6e27dd29       fmul v9.4s, v9.4s, v7.4s
0x1de12ab1d094  14b4  3dc03bf6       ldr q22, [sp, #224]
0x1de12ab1d098  14b8  4e36d529       fadd v9.4s, v9.4s, v22.4s
0x1de12ab1d09c  14bc  91024181       add x1, x12, #0x90 (144)
0x1de12ab1d0a0  14c0  3ca16909       str q9, [x8, x1]
0x1de12ab1d0a4  14c4  6e28df69       fmul v9.4s, v27.4s, v8.4s
0x1de12ab1d0a8  14c8  3dc00bfb       ldr q27, [sp, #32]
0x1de12ab1d0ac  14cc  4e3bd529       fadd v9.4s, v9.4s, v27.4s
0x1de12ab1d0b0  14d0  91020181       add x1, x12, #0x80 (128)
0x1de12ab1d0b4  14d4  3ca16909       str q9, [x8, x1]
0x1de12ab1d0b8  14d8  3dc0d7e9       ldr q9, [sp, #848]
0x1de12ab1d0bc  14dc  6e22dd22       fmul v2.4s, v9.4s, v2.4s
0x1de12ab1d0c0  14e0  3dc01fe0       ldr q0, [sp, #112]
0x1de12ab1d0c4  14e4  4e20d442       fadd v2.4s, v2.4s, v0.4s
0x1de12ab1d0c8  14e8  9101c181       add x1, x12, #0x70 (112)
0x1de12ab1d0cc  14ec  3ca16902       str q2, [x8, x1]
0x1de12ab1d0d0  14f0  3dc0fbe2       ldr q2, [sp, #992]
0x1de12ab1d0d4  14f4  6e24dc42       fmul v2.4s, v2.4s, v4.4s
0x1de12ab1d0d8  14f8  3dc02fe4       ldr q4, [sp, #176]
0x1de12ab1d0dc  14fc  4e24d442       fadd v2.4s, v2.4s, v4.4s
0x1de12ab1d0e0  1500  91018181       add x1, x12, #0x60 (96)
0x1de12ab1d0e4  1504  3ca16902       str q2, [x8, x1]
0x1de12ab1d0e8  1508  3dc0ffe2       ldr q2, [sp, #1008]
0x1de12ab1d0ec  150c  6e27dc42       fmul v2.4s, v2.4s, v7.4s
0x1de12ab1d0f0  1510  3dc043f5       ldr q21, [sp, #256]
0x1de12ab1d0f4  1514  4e35d442       fadd v2.4s, v2.4s, v21.4s
0x1de12ab1d0f8  1518  91014181       add x1, x12, #0x50 (80)
0x1de12ab1d0fc  151c  3ca16902       str q2, [x8, x1]
0x1de12ab1d100  1520  6e28dee2       fmul v2.4s, v23.4s, v8.4s
0x1de12ab1d104  1524  3dc00ff7       ldr q23, [sp, #48]
0x1de12ab1d108  1528  4e37d442       fadd v2.4s, v2.4s, v23.4s
0x1de12ab1d10c  152c  91010181       add x1, x12, #0x40 (64)
0x1de12ab1d110  1530  3ca16902       str q2, [x8, x1]
0x1de12ab1d114  1534  11010181       add w1, w12, #0x40 (64)
0x1de12ab1d118  1538  11004182       add w2, w12, #0x10 (16)
0x1de12ab1d11c  153c  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1d120  1540  aa0103e0       mov x0, x1
0x1de12ab1d124  1544  97fc015f       bl #-0xffa84 (addr 0x1de12aa1d6a0)
0x1de12ab1d128  1548  f94263e1       ldr x1, [sp, #1216]
0x1de12ab1d12c  154c  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1d130  1550  f94227f3       ldr x19, [sp, #1096]
0x1de12ab1d134  1554  f94223ec       ldr x12, [sp, #1088]
0x1de12ab1d138  1558  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1d13c  155c  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1d140  1560  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1d144  1564  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1d148  1568  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1d14c  156c  140001f4       b #+0x7d0 (addr 0x1de12ab1d91c)
0x1de12ab1d150  1570  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1d154  1574  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1d158  1578  f94263e1       ldr x1, [sp, #1216]
0x1de12ab1d15c  157c  91038033       add x19, x1, #0xe0 (224)
0x1de12ab1d160  1580  3dc027e3       ldr q3, [sp, #144]
0x1de12ab1d164  1584  3cb36903       str q3, [x8, x19]
0x1de12ab1d168  1588  91030033       add x19, x1, #0xc0 (192)
0x1de12ab1d16c  158c  3dc007e3       ldr q3, [sp, #16]
0x1de12ab1d170  1590  3cb36903       str q3, [x8, x19]
0x1de12ab1d174  1594  9102c035       add x21, x1, #0xb0 (176)
0x1de12ab1d178  1598  3dc01be3       ldr q3, [sp, #96]
0x1de12ab1d17c  159c  3cb56903       str q3, [x8, x21]
0x1de12ab1d180  15a0  91028035       add x21, x1, #0xa0 (160)
0x1de12ab1d184  15a4  3dc02be3       ldr q3, [sp, #160]
0x1de12ab1d188  15a8  3cb56903       str q3, [x8, x21]
0x1de12ab1d18c  15ac  91024035       add x21, x1, #0x90 (144)
0x1de12ab1d190  15b0  3dc03be3       ldr q3, [sp, #224]
0x1de12ab1d194  15b4  3cb56903       str q3, [x8, x21]
0x1de12ab1d198  15b8  91020037       add x23, x1, #0x80 (128)
0x1de12ab1d19c  15bc  3cb76901       str q1, [x8, x23]
0x1de12ab1d1a0  15c0  9101c038       add x24, x1, #0x70 (112)
0x1de12ab1d1a4  15c4  3cb86900       str q0, [x8, x24]
0x1de12ab1d1a8  15c8  91018038       add x24, x1, #0x60 (96)
0x1de12ab1d1ac  15cc  3cb8691b       str q27, [x8, x24]
0x1de12ab1d1b0  15d0  91014039       add x25, x1, #0x50 (80)
0x1de12ab1d1b4  15d4  3cb9691a       str q26, [x8, x25]
0x1de12ab1d1b8  15d8  91010023       add x3, x1, #0x40 (64)
0x1de12ab1d1bc  15dc  3ca36919       str q25, [x8, x3]
0x1de12ab1d1c0  15e0  9103c027       add x7, x1, #0xf0 (240)
0x1de12ab1d1c4  15e4  3ca76916       str q22, [x8, x7]
0x1de12ab1d1c8  15e8  91048027       add x7, x1, #0x120 (288)
0x1de12ab1d1cc  15ec  3ca7691c       str q28, [x8, x7]
0x1de12ab1d1d0  15f0  9104c027       add x7, x1, #0x130 (304)
0x1de12ab1d1d4  15f4  3ca76915       str q21, [x8, x7]
0x1de12ab1d1d8  15f8  91050027       add x7, x1, #0x140 (320)
0x1de12ab1d1dc  15fc  3ca76909       str q9, [x8, x7]
0x1de12ab1d1e0  1600  9107c03c       add x28, x1, #0x1f0 (496)
0x1de12ab1d1e4  1604  3cbc6912       str q18, [x8, x28]
0x1de12ab1d1e8  1608  91078026       add x6, x1, #0x1e0 (480)
0x1de12ab1d1ec  160c  3ca66910       str q16, [x8, x6]
0x1de12ab1d1f0  1610  91074029       add x9, x1, #0x1d0 (464)
0x1de12ab1d1f4  1614  3ca9690d       str q13, [x8, x9]
0x1de12ab1d1f8  1618  9107002a       add x10, x1, #0x1c0 (448)
0x1de12ab1d1fc  161c  3caa6908       str q8, [x8, x10]
0x1de12ab1d200  1620  9106c02b       add x11, x1, #0x1b0 (432)
0x1de12ab1d204  1624  3cab6911       str q17, [x8, x11]
0x1de12ab1d208  1628  91068020       add x0, x1, #0x1a0 (416)
0x1de12ab1d20c  162c  3ca0690e       str q14, [x8, x0]
0x1de12ab1d210  1630  91064024       add x4, x1, #0x190 (400)
0x1de12ab1d214  1634  3ca4690c       str q12, [x8, x4]
0x1de12ab1d218  1638  91060025       add x5, x1, #0x180 (384)
0x1de12ab1d21c  163c  3ca56913       str q19, [x8, x5]
0x1de12ab1d220  1640  9105c022       add x2, x1, #0x170 (368)
0x1de12ab1d224  1644  3ca26914       str q20, [x8, x2]
0x1de12ab1d228  1648  9105802c       add x12, x1, #0x160 (352)
0x1de12ab1d22c  164c  3cac6907       str q7, [x8, x12]
0x1de12ab1d230  1650  9105402f       add x15, x1, #0x150 (336)
0x1de12ab1d234  1654  3caf6904       str q4, [x8, x15]
0x1de12ab1d238  1658  91044036       add x22, x1, #0x110 (272)
0x1de12ab1d23c  165c  3cb66918       str q24, [x8, x22]
0x1de12ab1d240  1660  91034036       add x22, x1, #0xd0 (208)
0x1de12ab1d244  1664  3cb66902       str q2, [x8, x22]
0x1de12ab1d248  1668  91040036       add x22, x1, #0x100 (256)
0x1de12ab1d24c  166c  3cb66917       str q23, [x8, x22]
0x1de12ab1d250  1670  3ce36903       ldr q3, [x8, x3]
0x1de12ab1d254  1674  3cf76904       ldr q4, [x8, x23]
0x1de12ab1d258  1678  4e040467       dup v7.4s, v3.s[0]
0x1de12ab1d25c  167c  6e0c0487       mov v7.s[1], v4.s[0]
0x1de12ab1d260  1680  3cf36908       ldr q8, [x8, x19]
0x1de12ab1d264  1684  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d268  1688  4e0407c7       dup v7.4s, v30.s[0]
0x1de12ab1d26c  168c  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d270  1690  6e140507       mov v7.s[2], v8.s[0]
0x1de12ab1d274  1694  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d278  1698  6e0407c7       mov v7.s[0], v30.s[0]
0x1de12ab1d27c  169c  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d280  16a0  6e1447c7       mov v7.s[2], v30.s[2]
0x1de12ab1d284  16a4  6e1c06e7       mov v7.s[3], v23.s[0]
0x1de12ab1d288  16a8  4e040469       dup v9.4s, v3.s[0]
0x1de12ab1d28c  16ac  6e042469       mov v9.s[0], v3.s[1]
0x1de12ab1d290  16b0  6e0c2489       mov v9.s[1], v4.s[1]
0x1de12ab1d294  16b4  4ea91d3e       mov v30.16b, v9.16b
0x1de12ab1d298  16b8  4e0407c9       dup v9.4s, v30.s[0]
0x1de12ab1d29c  16bc  6e0c27c9       mov v9.s[1], v30.s[1]
0x1de12ab1d2a0  16c0  6e142509       mov v9.s[2], v8.s[1]
0x1de12ab1d2a4  16c4  4ea91d3e       mov v30.16b, v9.16b
0x1de12ab1d2a8  16c8  6e0407c9       mov v9.s[0], v30.s[0]
0x1de12ab1d2ac  16cc  6e0c27c9       mov v9.s[1], v30.s[1]
0x1de12ab1d2b0  16d0  6e1447c9       mov v9.s[2], v30.s[2]
0x1de12ab1d2b4  16d4  6e1c26e9       mov v9.s[3], v23.s[1]
0x1de12ab1d2b8  16d8  4e29d4e7       fadd v7.4s, v7.4s, v9.4s
0x1de12ab1d2bc  16dc  4e040469       dup v9.4s, v3.s[0]
0x1de12ab1d2c0  16e0  6e044469       mov v9.s[0], v3.s[2]
0x1de12ab1d2c4  16e4  6e0c4489       mov v9.s[1], v4.s[2]
0x1de12ab1d2c8  16e8  4ea91d3e       mov v30.16b, v9.16b
0x1de12ab1d2cc  16ec  4e0407c9       dup v9.4s, v30.s[0]
0x1de12ab1d2d0  16f0  6e0c27c9       mov v9.s[1], v30.s[1]
0x1de12ab1d2d4  16f4  6e144509       mov v9.s[2], v8.s[2]
0x1de12ab1d2d8  16f8  4ea91d3e       mov v30.16b, v9.16b
0x1de12ab1d2dc  16fc  6e0407c9       mov v9.s[0], v30.s[0]
0x1de12ab1d2e0  1700  6e0c27c9       mov v9.s[1], v30.s[1]
0x1de12ab1d2e4  1704  6e1447c9       mov v9.s[2], v30.s[2]
0x1de12ab1d2e8  1708  6e1c46e9       mov v9.s[3], v23.s[2]
0x1de12ab1d2ec  170c  4e29d4e7       fadd v7.4s, v7.4s, v9.4s
0x1de12ab1d2f0  1710  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d2f4  1714  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d2f8  1718  6e0467c3       mov v3.s[0], v30.s[3]
0x1de12ab1d2fc  171c  6e0c6483       mov v3.s[1], v4.s[3]
0x1de12ab1d300  1720  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d304  1724  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d308  1728  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d30c  172c  6e146503       mov v3.s[2], v8.s[3]
0x1de12ab1d310  1730  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d314  1734  6e0407c3       mov v3.s[0], v30.s[0]
0x1de12ab1d318  1738  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d31c  173c  6e1447c3       mov v3.s[2], v30.s[2]
0x1de12ab1d320  1740  6e1c66e3       mov v3.s[3], v23.s[3]
0x1de12ab1d324  1744  4e23d4e3       fadd v3.4s, v7.4s, v3.4s
0x1de12ab1d328  1748  3cf96904       ldr q4, [x8, x25]
0x1de12ab1d32c  174c  3cf56907       ldr q7, [x8, x21]
0x1de12ab1d330  1750  4e040488       dup v8.4s, v4.s[0]
0x1de12ab1d334  1754  6e0c04e8       mov v8.s[1], v7.s[0]
0x1de12ab1d338  1758  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d33c  175c  4e0407c8       dup v8.4s, v30.s[0]
0x1de12ab1d340  1760  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d344  1764  6e140448       mov v8.s[2], v2.s[0]
0x1de12ab1d348  1768  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d34c  176c  6e0407c8       mov v8.s[0], v30.s[0]
0x1de12ab1d350  1770  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d354  1774  6e1447c8       mov v8.s[2], v30.s[2]
0x1de12ab1d358  1778  6e1c0708       mov v8.s[3], v24.s[0]
0x1de12ab1d35c  177c  4e28d463       fadd v3.4s, v3.4s, v8.4s
0x1de12ab1d360  1780  4e040488       dup v8.4s, v4.s[0]
0x1de12ab1d364  1784  6e042488       mov v8.s[0], v4.s[1]
0x1de12ab1d368  1788  6e0c24e8       mov v8.s[1], v7.s[1]
0x1de12ab1d36c  178c  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d370  1790  4e0407c8       dup v8.4s, v30.s[0]
0x1de12ab1d374  1794  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d378  1798  6e142448       mov v8.s[2], v2.s[1]
0x1de12ab1d37c  179c  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d380  17a0  6e0407c8       mov v8.s[0], v30.s[0]
0x1de12ab1d384  17a4  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d388  17a8  6e1447c8       mov v8.s[2], v30.s[2]
0x1de12ab1d38c  17ac  6e1c2708       mov v8.s[3], v24.s[1]
0x1de12ab1d390  17b0  4e28d463       fadd v3.4s, v3.4s, v8.4s
0x1de12ab1d394  17b4  4e040488       dup v8.4s, v4.s[0]
0x1de12ab1d398  17b8  6e044488       mov v8.s[0], v4.s[2]
0x1de12ab1d39c  17bc  6e0c44e8       mov v8.s[1], v7.s[2]
0x1de12ab1d3a0  17c0  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d3a4  17c4  4e0407c8       dup v8.4s, v30.s[0]
0x1de12ab1d3a8  17c8  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d3ac  17cc  6e144448       mov v8.s[2], v2.s[2]
0x1de12ab1d3b0  17d0  4ea81d1e       mov v30.16b, v8.16b
0x1de12ab1d3b4  17d4  6e0407c8       mov v8.s[0], v30.s[0]
0x1de12ab1d3b8  17d8  6e0c27c8       mov v8.s[1], v30.s[1]
0x1de12ab1d3bc  17dc  6e1447c8       mov v8.s[2], v30.s[2]
0x1de12ab1d3c0  17e0  6e1c4708       mov v8.s[3], v24.s[2]
0x1de12ab1d3c4  17e4  4e28d463       fadd v3.4s, v3.4s, v8.4s
0x1de12ab1d3c8  17e8  4ea41c9e       mov v30.16b, v4.16b
0x1de12ab1d3cc  17ec  4e0407c4       dup v4.4s, v30.s[0]
0x1de12ab1d3d0  17f0  6e0467c4       mov v4.s[0], v30.s[3]
0x1de12ab1d3d4  17f4  6e0c64e4       mov v4.s[1], v7.s[3]
0x1de12ab1d3d8  17f8  4ea21c5e       mov v30.16b, v2.16b
0x1de12ab1d3dc  17fc  4e040482       dup v2.4s, v4.s[0]
0x1de12ab1d3e0  1800  6e0c2482       mov v2.s[1], v4.s[1]
0x1de12ab1d3e4  1804  6e1467c2       mov v2.s[2], v30.s[3]
0x1de12ab1d3e8  1808  4ea21c5e       mov v30.16b, v2.16b
0x1de12ab1d3ec  180c  6e0407c2       mov v2.s[0], v30.s[0]
0x1de12ab1d3f0  1810  6e0c27c2       mov v2.s[1], v30.s[1]
0x1de12ab1d3f4  1814  6e1447c2       mov v2.s[2], v30.s[2]
0x1de12ab1d3f8  1818  6e1c6702       mov v2.s[3], v24.s[3]
0x1de12ab1d3fc  181c  4e22d462       fadd v2.4s, v3.4s, v2.4s
0x1de12ab1d400  1820  3cf86903       ldr q3, [x8, x24]
0x1de12ab1d404  1824  91028113       add x19, x8, #0xa0 (160)
0x1de12ab1d408  1828  8b010273       add x19, x19, x1
0x1de12ab1d40c  182c  0d409263       ld1 {v3.s}[1], [x19]
0x1de12ab1d410  1830  91038113       add x19, x8, #0xe0 (224)
0x1de12ab1d414  1834  8b010273       add x19, x19, x1
0x1de12ab1d418  1838  4d408263       ld1 {v3.s}[2], [x19]
0x1de12ab1d41c  183c  91048113       add x19, x8, #0x120 (288)
0x1de12ab1d420  1840  8b010273       add x19, x19, x1
0x1de12ab1d424  1844  4d409263       ld1 {v3.s}[3], [x19]
0x1de12ab1d428  1848  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x1de12ab1d42c  184c  91019033       add x19, x1, #0x64 (100)
0x1de12ab1d430  1850  3cf36903       ldr q3, [x8, x19]
0x1de12ab1d434  1854  91029033       add x19, x1, #0xa4 (164)
0x1de12ab1d438  1858  3cf36904       ldr q4, [x8, x19]
0x1de12ab1d43c  185c  4e040467       dup v7.4s, v3.s[0]
0x1de12ab1d440  1860  6e0c0487       mov v7.s[1], v4.s[0]
0x1de12ab1d444  1864  91039033       add x19, x1, #0xe4 (228)
0x1de12ab1d448  1868  3cf36908       ldr q8, [x8, x19]
0x1de12ab1d44c  186c  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d450  1870  4e0407c7       dup v7.4s, v30.s[0]
0x1de12ab1d454  1874  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d458  1878  6e140507       mov v7.s[2], v8.s[0]
0x1de12ab1d45c  187c  91049033       add x19, x1, #0x124 (292)
0x1de12ab1d460  1880  3cf36909       ldr q9, [x8, x19]
0x1de12ab1d464  1884  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d468  1888  6e0407c7       mov v7.s[0], v30.s[0]
0x1de12ab1d46c  188c  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d470  1890  6e1447c7       mov v7.s[2], v30.s[2]
0x1de12ab1d474  1894  6e1c0527       mov v7.s[3], v9.s[0]
0x1de12ab1d478  1898  4e27d442       fadd v2.4s, v2.4s, v7.4s
0x1de12ab1d47c  189c  4e040467       dup v7.4s, v3.s[0]
0x1de12ab1d480  18a0  6e042467       mov v7.s[0], v3.s[1]
0x1de12ab1d484  18a4  6e0c2487       mov v7.s[1], v4.s[1]
0x1de12ab1d488  18a8  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d48c  18ac  4e0407c7       dup v7.4s, v30.s[0]
0x1de12ab1d490  18b0  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d494  18b4  6e142507       mov v7.s[2], v8.s[1]
0x1de12ab1d498  18b8  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d49c  18bc  6e0407c7       mov v7.s[0], v30.s[0]
0x1de12ab1d4a0  18c0  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d4a4  18c4  6e1447c7       mov v7.s[2], v30.s[2]
0x1de12ab1d4a8  18c8  6e1c2527       mov v7.s[3], v9.s[1]
0x1de12ab1d4ac  18cc  4e27d442       fadd v2.4s, v2.4s, v7.4s
0x1de12ab1d4b0  18d0  4e040467       dup v7.4s, v3.s[0]
0x1de12ab1d4b4  18d4  6e044467       mov v7.s[0], v3.s[2]
0x1de12ab1d4b8  18d8  6e0c4487       mov v7.s[1], v4.s[2]
0x1de12ab1d4bc  18dc  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d4c0  18e0  4e0407c7       dup v7.4s, v30.s[0]
0x1de12ab1d4c4  18e4  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d4c8  18e8  6e144507       mov v7.s[2], v8.s[2]
0x1de12ab1d4cc  18ec  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d4d0  18f0  6e0407c7       mov v7.s[0], v30.s[0]
0x1de12ab1d4d4  18f4  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d4d8  18f8  6e1447c7       mov v7.s[2], v30.s[2]
0x1de12ab1d4dc  18fc  6e1c4527       mov v7.s[3], v9.s[2]
0x1de12ab1d4e0  1900  4e27d442       fadd v2.4s, v2.4s, v7.4s
0x1de12ab1d4e4  1904  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d4e8  1908  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d4ec  190c  6e0467c3       mov v3.s[0], v30.s[3]
0x1de12ab1d4f0  1910  6e0c6483       mov v3.s[1], v4.s[3]
0x1de12ab1d4f4  1914  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d4f8  1918  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d4fc  191c  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d500  1920  6e146503       mov v3.s[2], v8.s[3]
0x1de12ab1d504  1924  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d508  1928  6e0407c3       mov v3.s[0], v30.s[0]
0x1de12ab1d50c  192c  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d510  1930  6e1447c3       mov v3.s[2], v30.s[2]
0x1de12ab1d514  1934  6e1c6523       mov v3.s[3], v9.s[3]
0x1de12ab1d518  1938  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x1de12ab1d51c  193c  9101d113       add x19, x8, #0x74 (116)
0x1de12ab1d520  1940  fc616a63       ldr d3, [x19, x1]
0x1de12ab1d524  1944  9102d113       add x19, x8, #0xb4 (180)
0x1de12ab1d528  1948  fc616a64       ldr d4, [x19, x1]
0x1de12ab1d52c  194c  4e040467       dup v7.4s, v3.s[0]
0x1de12ab1d530  1950  6e0c0487       mov v7.s[1], v4.s[0]
0x1de12ab1d534  1954  9103d033       add x19, x1, #0xf4 (244)
0x1de12ab1d538  1958  3cf36908       ldr q8, [x8, x19]
0x1de12ab1d53c  195c  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d540  1960  4e0407c7       dup v7.4s, v30.s[0]
0x1de12ab1d544  1964  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d548  1968  6e140507       mov v7.s[2], v8.s[0]
0x1de12ab1d54c  196c  9104d033       add x19, x1, #0x134 (308)
0x1de12ab1d550  1970  3cf36909       ldr q9, [x8, x19]
0x1de12ab1d554  1974  4ea71cfe       mov v30.16b, v7.16b
0x1de12ab1d558  1978  6e0407c7       mov v7.s[0], v30.s[0]
0x1de12ab1d55c  197c  6e0c27c7       mov v7.s[1], v30.s[1]
0x1de12ab1d560  1980  6e1447c7       mov v7.s[2], v30.s[2]
0x1de12ab1d564  1984  6e1c0527       mov v7.s[3], v9.s[0]
0x1de12ab1d568  1988  4e27d442       fadd v2.4s, v2.4s, v7.4s
0x1de12ab1d56c  198c  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d570  1990  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d574  1994  6e0427c3       mov v3.s[0], v30.s[1]
0x1de12ab1d578  1998  6e0c2483       mov v3.s[1], v4.s[1]
0x1de12ab1d57c  199c  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d580  19a0  4e0407c3       dup v3.4s, v30.s[0]
0x1de12ab1d584  19a4  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d588  19a8  6e142503       mov v3.s[2], v8.s[1]
0x1de12ab1d58c  19ac  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d590  19b0  6e0407c3       mov v3.s[0], v30.s[0]
0x1de12ab1d594  19b4  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d598  19b8  6e1447c3       mov v3.s[2], v30.s[2]
0x1de12ab1d59c  19bc  6e1c2523       mov v3.s[3], v9.s[1]
0x1de12ab1d5a0  19c0  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x1de12ab1d5a4  19c4  9101f033       add x19, x1, #0x7c (124)
0x1de12ab1d5a8  19c8  3cf36903       ldr q3, [x8, x19]
0x1de12ab1d5ac  19cc  9102f113       add x19, x8, #0xbc (188)
0x1de12ab1d5b0  19d0  8b010273       add x19, x19, x1
0x1de12ab1d5b4  19d4  0d409263       ld1 {v3.s}[1], [x19]
0x1de12ab1d5b8  19d8  9103f113       add x19, x8, #0xfc (252)
0x1de12ab1d5bc  19dc  8b010273       add x19, x19, x1
0x1de12ab1d5c0  19e0  4d408263       ld1 {v3.s}[2], [x19]
0x1de12ab1d5c4  19e4  4ea31c7e       mov v30.16b, v3.16b
0x1de12ab1d5c8  19e8  6e0407c3       mov v3.s[0], v30.s[0]
0x1de12ab1d5cc  19ec  6e0c27c3       mov v3.s[1], v30.s[1]
0x1de12ab1d5d0  19f0  6e1447c3       mov v3.s[2], v30.s[2]
0x1de12ab1d5d4  19f4  6e1c4523       mov v3.s[3], v9.s[2]
0x1de12ab1d5d8  19f8  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x1de12ab1d5dc  19fc  f94227f3       ldr x19, [sp, #1096]
0x1de12ab1d5e0  1a00  3cf36903       ldr q3, [x8, x19]
0x1de12ab1d5e4  1a04  4e23d442       fadd v2.4s, v2.4s, v3.4s
0x1de12ab1d5e8  1a08  3cb36902       str q2, [x8, x19]
0x1de12ab1d5ec  1a0c  bc676903       ldr s3, [x8, x7]
0x1de12ab1d5f0  1a10  91051035       add x21, x1, #0x144 (324)
0x1de12ab1d5f4  1a14  bc756904       ldr s4, [x8, x21]
0x1de12ab1d5f8  1a18  1e242863       fadd s3, s3, s4
0x1de12ab1d5fc  1a1c  91052035       add x21, x1, #0x148 (328)
0x1de12ab1d600  1a20  bc756904       ldr s4, [x8, x21]
0x1de12ab1d604  1a24  1e242863       fadd s3, s3, s4
0x1de12ab1d608  1a28  91053035       add x21, x1, #0x14c (332)
0x1de12ab1d60c  1a2c  bc756904       ldr s4, [x8, x21]
0x1de12ab1d610  1a30  1e242863       fadd s3, s3, s4
0x1de12ab1d614  1a34  bc6f6904       ldr s4, [x8, x15]
0x1de12ab1d618  1a38  1e242863       fadd s3, s3, s4
0x1de12ab1d61c  1a3c  9105502f       add x15, x1, #0x154 (340)
0x1de12ab1d620  1a40  bc6f6904       ldr s4, [x8, x15]
0x1de12ab1d624  1a44  1e242863       fadd s3, s3, s4
0x1de12ab1d628  1a48  9105602f       add x15, x1, #0x158 (344)
0x1de12ab1d62c  1a4c  bc6f6904       ldr s4, [x8, x15]
0x1de12ab1d630  1a50  1e242863       fadd s3, s3, s4
0x1de12ab1d634  1a54  9105702f       add x15, x1, #0x15c (348)
0x1de12ab1d638  1a58  bc6f6904       ldr s4, [x8, x15]
0x1de12ab1d63c  1a5c  1e242863       fadd s3, s3, s4
0x1de12ab1d640  1a60  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d644  1a64  1e242863       fadd s3, s3, s4
0x1de12ab1d648  1a68  9105902c       add x12, x1, #0x164 (356)
0x1de12ab1d64c  1a6c  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d650  1a70  1e242863       fadd s3, s3, s4
0x1de12ab1d654  1a74  9105a02c       add x12, x1, #0x168 (360)
0x1de12ab1d658  1a78  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d65c  1a7c  1e242863       fadd s3, s3, s4
0x1de12ab1d660  1a80  9105b02c       add x12, x1, #0x16c (364)
0x1de12ab1d664  1a84  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d668  1a88  1e242863       fadd s3, s3, s4
0x1de12ab1d66c  1a8c  bc626904       ldr s4, [x8, x2]
0x1de12ab1d670  1a90  1e242863       fadd s3, s3, s4
0x1de12ab1d674  1a94  9105d02c       add x12, x1, #0x174 (372)
0x1de12ab1d678  1a98  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d67c  1a9c  1e242863       fadd s3, s3, s4
0x1de12ab1d680  1aa0  9105e02c       add x12, x1, #0x178 (376)
0x1de12ab1d684  1aa4  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d688  1aa8  1e242863       fadd s3, s3, s4
0x1de12ab1d68c  1aac  9105f02c       add x12, x1, #0x17c (380)
0x1de12ab1d690  1ab0  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d694  1ab4  1e242863       fadd s3, s3, s4
0x1de12ab1d698  1ab8  f94223ec       ldr x12, [sp, #1088]
0x1de12ab1d69c  1abc  bc6c6904       ldr s4, [x8, x12]
0x1de12ab1d6a0  1ac0  1e242863       fadd s3, s3, s4
0x1de12ab1d6a4  1ac4  bc2c6903       str s3, [x8, x12]
0x1de12ab1d6a8  1ac8  bc656904       ldr s4, [x8, x5]
0x1de12ab1d6ac  1acc  9106102f       add x15, x1, #0x184 (388)
0x1de12ab1d6b0  1ad0  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6b4  1ad4  1e272884       fadd s4, s4, s7
0x1de12ab1d6b8  1ad8  9106202f       add x15, x1, #0x188 (392)
0x1de12ab1d6bc  1adc  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6c0  1ae0  1e272884       fadd s4, s4, s7
0x1de12ab1d6c4  1ae4  9106302f       add x15, x1, #0x18c (396)
0x1de12ab1d6c8  1ae8  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6cc  1aec  1e272884       fadd s4, s4, s7
0x1de12ab1d6d0  1af0  bc646907       ldr s7, [x8, x4]
0x1de12ab1d6d4  1af4  1e272884       fadd s4, s4, s7
0x1de12ab1d6d8  1af8  9106502f       add x15, x1, #0x194 (404)
0x1de12ab1d6dc  1afc  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6e0  1b00  1e272884       fadd s4, s4, s7
0x1de12ab1d6e4  1b04  9106602f       add x15, x1, #0x198 (408)
0x1de12ab1d6e8  1b08  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6ec  1b0c  1e272884       fadd s4, s4, s7
0x1de12ab1d6f0  1b10  9106702f       add x15, x1, #0x19c (412)
0x1de12ab1d6f4  1b14  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d6f8  1b18  1e272884       fadd s4, s4, s7
0x1de12ab1d6fc  1b1c  bc606907       ldr s7, [x8, x0]
0x1de12ab1d700  1b20  1e272884       fadd s4, s4, s7
0x1de12ab1d704  1b24  9106902f       add x15, x1, #0x1a4 (420)
0x1de12ab1d708  1b28  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d70c  1b2c  1e272884       fadd s4, s4, s7
0x1de12ab1d710  1b30  9106a02f       add x15, x1, #0x1a8 (424)
0x1de12ab1d714  1b34  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d718  1b38  1e272884       fadd s4, s4, s7
0x1de12ab1d71c  1b3c  9106b02f       add x15, x1, #0x1ac (428)
0x1de12ab1d720  1b40  bc6f6907       ldr s7, [x8, x15]
0x1de12ab1d724  1b44  1e272884       fadd s4, s4, s7
0x1de12ab1d728  1b48  bc6b6907       ldr s7, [x8, x11]
0x1de12ab1d72c  1b4c  1e272884       fadd s4, s4, s7
0x1de12ab1d730  1b50  9106d02b       add x11, x1, #0x1b4 (436)
0x1de12ab1d734  1b54  bc6b6907       ldr s7, [x8, x11]
0x1de12ab1d738  1b58  1e272884       fadd s4, s4, s7
0x1de12ab1d73c  1b5c  9106e02b       add x11, x1, #0x1b8 (440)
0x1de12ab1d740  1b60  bc6b6907       ldr s7, [x8, x11]
0x1de12ab1d744  1b64  1e272884       fadd s4, s4, s7
0x1de12ab1d748  1b68  9106f02b       add x11, x1, #0x1bc (444)
0x1de12ab1d74c  1b6c  bc6b6907       ldr s7, [x8, x11]
0x1de12ab1d750  1b70  1e272884       fadd s4, s4, s7
0x1de12ab1d754  1b74  9100902b       add x11, x1, #0x24 (36)
0x1de12ab1d758  1b78  bc6b6907       ldr s7, [x8, x11]
0x1de12ab1d75c  1b7c  1e272884       fadd s4, s4, s7
0x1de12ab1d760  1b80  bc2b6904       str s4, [x8, x11]
0x1de12ab1d764  1b84  bc6a6907       ldr s7, [x8, x10]
0x1de12ab1d768  1b88  9107102a       add x10, x1, #0x1c4 (452)
0x1de12ab1d76c  1b8c  bc6a6908       ldr s8, [x8, x10]
0x1de12ab1d770  1b90  1e2828e7       fadd s7, s7, s8
0x1de12ab1d774  1b94  9107202a       add x10, x1, #0x1c8 (456)
0x1de12ab1d778  1b98  bc6a6908       ldr s8, [x8, x10]
0x1de12ab1d77c  1b9c  1e2828e7       fadd s7, s7, s8
0x1de12ab1d780  1ba0  9107302a       add x10, x1, #0x1cc (460)
0x1de12ab1d784  1ba4  bc6a6908       ldr s8, [x8, x10]
0x1de12ab1d788  1ba8  1e2828e7       fadd s7, s7, s8
0x1de12ab1d78c  1bac  bc696908       ldr s8, [x8, x9]
0x1de12ab1d790  1bb0  1e2828e7       fadd s7, s7, s8
0x1de12ab1d794  1bb4  91075029       add x9, x1, #0x1d4 (468)
0x1de12ab1d798  1bb8  bc696908       ldr s8, [x8, x9]
0x1de12ab1d79c  1bbc  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7a0  1bc0  91076029       add x9, x1, #0x1d8 (472)
0x1de12ab1d7a4  1bc4  bc696908       ldr s8, [x8, x9]
0x1de12ab1d7a8  1bc8  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7ac  1bcc  91077029       add x9, x1, #0x1dc (476)
0x1de12ab1d7b0  1bd0  bc696908       ldr s8, [x8, x9]
0x1de12ab1d7b4  1bd4  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7b8  1bd8  bc666908       ldr s8, [x8, x6]
0x1de12ab1d7bc  1bdc  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7c0  1be0  91079026       add x6, x1, #0x1e4 (484)
0x1de12ab1d7c4  1be4  bc666908       ldr s8, [x8, x6]
0x1de12ab1d7c8  1be8  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7cc  1bec  9107a026       add x6, x1, #0x1e8 (488)
0x1de12ab1d7d0  1bf0  bc666908       ldr s8, [x8, x6]
0x1de12ab1d7d4  1bf4  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7d8  1bf8  9107b026       add x6, x1, #0x1ec (492)
0x1de12ab1d7dc  1bfc  bc666908       ldr s8, [x8, x6]
0x1de12ab1d7e0  1c00  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7e4  1c04  bc7c6908       ldr s8, [x8, x28]
0x1de12ab1d7e8  1c08  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7ec  1c0c  9107d026       add x6, x1, #0x1f4 (500)
0x1de12ab1d7f0  1c10  bc666908       ldr s8, [x8, x6]
0x1de12ab1d7f4  1c14  1e2828e7       fadd s7, s7, s8
0x1de12ab1d7f8  1c18  9107e026       add x6, x1, #0x1f8 (504)
0x1de12ab1d7fc  1c1c  bc666908       ldr s8, [x8, x6]
0x1de12ab1d800  1c20  1e2828e7       fadd s7, s7, s8
0x1de12ab1d804  1c24  9107f026       add x6, x1, #0x1fc (508)
0x1de12ab1d808  1c28  bc666908       ldr s8, [x8, x6]
0x1de12ab1d80c  1c2c  1e2828e7       fadd s7, s7, s8
0x1de12ab1d810  1c30  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1d814  1c34  bc666908       ldr s8, [x8, x6]
0x1de12ab1d818  1c38  1e2828e7       fadd s7, s7, s8
0x1de12ab1d81c  1c3c  bc266907       str s7, [x8, x6]
0x1de12ab1d820  1c40  12000da9       and w9, w13, #0xf
0x1de12ab1d824  1c44  6b14037f       cmp w27, w20
0x1de12ab1d828  1c48  1a94336a       csel w10, w27, w20, lo
0x1de12ab1d82c  1c4c  6b0a01df       cmp w14, w10
0x1de12ab1d830  1c50  1a8a31cf       csel w15, w14, w10, lo
0x1de12ab1d834  1c54  6b0f013f       cmp w9, w15
0x1de12ab1d838  1c58  1a8f312a       csel w10, w9, w15, lo
0x1de12ab1d83c  1c5c  3400070a       cbz w10, #+0xe0 (addr 0x1de12ab1d91c)
0x1de12ab1d840  1c60  f9420bf6       ldr x22, [sp, #1040]
0x1de12ab1d844  1c64  121c62c9       and w9, w22, #0x1ffffff0
0x1de12ab1d848  1c68  f9420fee       ldr x14, [sp, #1048]
0x1de12ab1d84c  1c6c  0b0909c9       add w9, w14, w9, lsl #2
0x1de12ab1d850  1c70  121c61ad       and w13, w13, #0x1ffffff0
0x1de12ab1d854  1c74  f94217ee       ldr x14, [sp, #1064]
0x1de12ab1d858  1c78  0b0d09cd       add w13, w14, w13, lsl #2
0x1de12ab1d85c  1c7c  3cf36908       ldr q8, [x8, x19]
0x1de12ab1d860  1c80  fd41e3e9       ldr d9, [sp, #960]
0x1de12ab1d864  1c84  fd41e7ec       ldr d12, [sp, #968]
0x1de12ab1d868  1c88  fd41ebed       ldr d13, [sp, #976]
0x1de12ab1d86c  1c8c  fd41efee       ldr d14, [sp, #984]
0x1de12ab1d870  1c90  1e2e1010       fmov s16, #0x70 (1.0000)
0x1de12ab1d874  1c94  f941dfe2       ldr x2, [sp, #952]
0x1de12ab1d878  1c98  f941dbf9       ldr x25, [sp, #944]
0x1de12ab1d87c  1c9c  f852034e       ldur x14, [x26, #-224]
0x1de12ab1d880  1ca0  eb2e63ff       cmp sp, x14
0x1de12ab1d884  1ca4  54002a89       b.ls #+0x550 (addr 0x1de12ab1ddd4)
0x1de12ab1d888  1ca8  bc696911       ldr s17, [x8, x9]
0x1de12ab1d88c  1cac  1e313932       fsub s18, s9, s17
0x1de12ab1d890  1cb0  1e320a53       fmul s19, s18, s18
0x1de12ab1d894  1cb4  2a0203ee       mov w14, w2
0x1de12ab1d898  1cb8  bc6e6914       ldr s20, [x8, x14]
0x1de12ab1d89c  1cbc  1e343995       fsub s21, s12, s20
0x1de12ab1d8a0  1cc0  1e350ab6       fmul s22, s21, s21
0x1de12ab1d8a4  1cc4  1e362a73       fadd s19, s19, s22
0x1de12ab1d8a8  1cc8  1e2d2260       fcmp s19, s13
0x1de12ab1d8ac  1ccc  54000203       b.lo #+0x40 (addr 0x1de12ab1d8ec)
0x1de12ab1d8b0  1cd0  1e2e2260       fcmp s19, s14
0x1de12ab1d8b4  1cd4  54000202       b.hs #+0x40 (addr 0x1de12ab1d8f4)
0x1de12ab1d8b8  1cd8  1e202268       fcmp s19, #0.0
0x1de12ab1d8bc  1cdc  540001cd       b.le #+0x38 (addr 0x1de12ab1d8f4)
0x1de12ab1d8c0  1ce0  1e302863       fadd s3, s3, s16
0x1de12ab1d8c4  1ce4  4e040628       dup v8.4s, v17.s[0]
0x1de12ab1d8c8  1ce8  6e0c0688       mov v8.s[1], v20.s[0]
0x1de12ab1d8cc  1cec  2a1903ee       mov w14, w25
0x1de12ab1d8d0  1cf0  bc6e6911       ldr s17, [x8, x14]
0x1de12ab1d8d4  1cf4  6e140628       mov v8.s[2], v17.s[0]
0x1de12ab1d8d8  1cf8  bc6d6911       ldr s17, [x8, x13]
0x1de12ab1d8dc  1cfc  6e1c0628       mov v8.s[3], v17.s[0]
0x1de12ab1d8e0  1d00  4e28d448       fadd v8.4s, v2.4s, v8.4s
0x1de12ab1d8e4  1d04  4ea81d02       mov v2.16b, v8.16b
0x1de12ab1d8e8  1d08  14000003       b #+0xc (addr 0x1de12ab1d8f4)
0x1de12ab1d8ec  1d0c  1e3528e7       fadd s7, s7, s21
0x1de12ab1d8f0  1d10  1e322884       fadd s4, s4, s18
0x1de12ab1d8f4  1d14  11001129       add w9, w9, #0x4 (4)
0x1de12ab1d8f8  1d18  11001042       add w2, w2, #0x4 (4)
0x1de12ab1d8fc  1d1c  11001339       add w25, w25, #0x4 (4)
0x1de12ab1d900  1d20  110011ad       add w13, w13, #0x4 (4)
0x1de12ab1d904  1d24  5100054a       sub w10, w10, #0x1 (1)
0x1de12ab1d908  1d28  35fffbaa       cbnz w10, #-0x8c (addr 0x1de12ab1d87c)
0x1de12ab1d90c  1d2c  bc266907       str s7, [x8, x6]
0x1de12ab1d910  1d30  bc2b6904       str s4, [x8, x11]
0x1de12ab1d914  1d34  bc2c6903       str s3, [x8, x12]
0x1de12ab1d918  1d38  3cb36908       str q8, [x8, x19]
0x1de12ab1d91c  1d3c  f9422fe9       ldr x9, [sp, #1112]
0x1de12ab1d920  1d40  1100052a       add w10, w9, #0x1 (1)
0x1de12ab1d924  1d44  f9422beb       ldr x11, [sp, #1104]
0x1de12ab1d928  1d48  6b0b013f       cmp w9, w11
0x1de12ab1d92c  1d4c  54ff6161       b.ne #-0x13d4 (addr 0x1de12ab1c558)
0x1de12ab1d930  1d50  aa0103ec       mov x12, x1
0x1de12ab1d934  1d54  aa0c03e6       mov x6, x12
0x1de12ab1d938  1d58  110100c0       add w0, w6, #0x40 (64)
0x1de12ab1d93c  1d5c  1100c0c3       add w3, w6, #0x30 (48)
0x1de12ab1d940  1d60  110040c5       add w5, w6, #0x10 (16)
0x1de12ab1d944  1d64  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1d948  1d68  aa0603e4       mov x4, x6
0x1de12ab1d94c  1d6c  f9423be2       ldr x2, [sp, #1136]
0x1de12ab1d950  1d70  fd4237e0       ldr d0, [sp, #1128]
0x1de12ab1d954  1d74  fd4233e1       ldr d1, [sp, #1120]
0x1de12ab1d958  1d78  97fbff53       bl #-0x1002b4 (addr 0x1de12aa1d6a4)
0x1de12ab1d95c  1d7c  f9425bf4       ldr x20, [sp, #1200]
0x1de12ab1d960  1d80  f9423fe1       ldr x1, [sp, #1144]
0x1de12ab1d964  1d84  6b14003f       cmp w1, w20
0x1de12ab1d968  1d88  54000509       b.ls #+0xa0 (addr 0x1de12ab1da08)
0x1de12ab1d96c  1d8c  f9424fe6       ldr x6, [sp, #1176]
0x1de12ab1d970  1d90  f94243e8       ldr x8, [sp, #1152]
0x1de12ab1d974  1d94  0b060109       add w9, w8, w6
0x1de12ab1d978  1d98  f94263ea       ldr x10, [sp, #1216]
0x1de12ab1d97c  1d9c  9101014b       add x11, x10, #0x40 (64)
0x1de12ab1d980  1da0  f94257ec       ldr x12, [sp, #1192]
0x1de12ab1d984  1da4  bc6b6982       ldr s2, [x12, x11]
0x1de12ab1d988  1da8  bc296982       str s2, [x12, x9]
0x1de12ab1d98c  1dac  f94247e9       ldr x9, [sp, #1160]
0x1de12ab1d990  1db0  0b06012b       add w11, w9, w6
0x1de12ab1d994  1db4  9101114d       add x13, x10, #0x44 (68)
0x1de12ab1d998  1db8  bc6d6982       ldr s2, [x12, x13]
0x1de12ab1d99c  1dbc  bc2b6982       str s2, [x12, x11]
0x1de12ab1d9a0  1dc0  f9424beb       ldr x11, [sp, #1168]
0x1de12ab1d9a4  1dc4  0b06016d       add w13, w11, w6
0x1de12ab1d9a8  1dc8  9101214e       add x14, x10, #0x48 (72)
0x1de12ab1d9ac  1dcc  bc6e6982       ldr s2, [x12, x14]
0x1de12ab1d9b0  1dd0  bc2d6982       str s2, [x12, x13]
0x1de12ab1d9b4  1dd4  f94253ed       ldr x13, [sp, #1184]
0x1de12ab1d9b8  1dd8  0b0601a6       add w6, w13, w6
0x1de12ab1d9bc  1ddc  9101314e       add x14, x10, #0x4c (76)
0x1de12ab1d9c0  1de0  bc6e6982       ldr s2, [x12, x14]
0x1de12ab1d9c4  1de4  bc266982       str s2, [x12, x6]
0x1de12ab1d9c8  1de8  aa0c03e8       mov x8, x12
0x1de12ab1d9cc  1dec  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1d9d0  1df0  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1d9d4  1df4  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1d9d8  1df8  d280001c       movz x28, #0x0
0x1de12ab1d9dc  1dfc  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1d9e0  1e00  f940f7fb       ldr cp, [sp, #488]
0x1de12ab1d9e4  1e04  f941bbf3       ldr x19, [sp, #880]
0x1de12ab1d9e8  1e08  f941c3f9       ldr x25, [sp, #896]
0x1de12ab1d9ec  1e0c  f941c7ee       ldr x14, [sp, #904]
0x1de12ab1d9f0  1e10  f941cbf8       ldr x24, [sp, #912]
0x1de12ab1d9f4  1e14  f941cfed       ldr x13, [sp, #920]
0x1de12ab1d9f8  1e18  f941d3f6       ldr x22, [sp, #928]
0x1de12ab1d9fc  1e1c  f941d7f7       ldr x23, [sp, #936]
0x1de12ab1da00  1e20  f941b3f5       ldr x21, [sp, #864]
0x1de12ab1da04  1e24  14000010       b #+0x40 (addr 0x1de12ab1da44)
0x1de12ab1da08  1e28  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1da0c  1e2c  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1da10  1e30  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1da14  1e34  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1da18  1e38  d280001c       movz x28, #0x0
0x1de12ab1da1c  1e3c  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1da20  1e40  f940f7fb       ldr cp, [sp, #488]
0x1de12ab1da24  1e44  f941bbf3       ldr x19, [sp, #880]
0x1de12ab1da28  1e48  f941c3f9       ldr x25, [sp, #896]
0x1de12ab1da2c  1e4c  f941c7ee       ldr x14, [sp, #904]
0x1de12ab1da30  1e50  f941cbf8       ldr x24, [sp, #912]
0x1de12ab1da34  1e54  f941cfed       ldr x13, [sp, #920]
0x1de12ab1da38  1e58  f941d3f6       ldr x22, [sp, #928]
0x1de12ab1da3c  1e5c  f941d7f7       ldr x23, [sp, #936]
0x1de12ab1da40  1e60  f941b3f5       ldr x21, [sp, #864]
0x1de12ab1da44  1e64  11000694       add w20, w20, #0x1 (1)
0x1de12ab1da48  1e68  f9425fe6       ldr x6, [sp, #1208]
0x1de12ab1da4c  1e6c  6b06029f       cmp w20, w6
0x1de12ab1da50  1e70  54ff46e1       b.ne #-0x1724 (addr 0x1de12ab1c32c)
0x1de12ab1da54  1e74  f94263e1       ldr x1, [sp, #1216]
0x1de12ab1da58  1e78  11080021       add w1, w1, #0x200 (512)
0x1de12ab1da5c  1e7c  f94267e6       ldr x6, [sp, #1224]
0x1de12ab1da60  1e80  b90000c1       str w1, [x6]
0x1de12ab1da64  1e84  17fffa06       b #-0x17e8 (addr 0x1de12ab1c27c)
0x1de12ab1da68  1e88  97fc005a       bl #-0xffe98 (addr 0x1de12aa1dbd0)
0x1de12ab1da6c  1e8c  f94257e1       ldr x1, [sp, #1192]
0x1de12ab1da70  1e90  f9426be7       ldr x7, [sp, #1232]
0x1de12ab1da74  1e94  f9425fe0       ldr x0, [sp, #1208]
0x1de12ab1da78  1e98  17fff865       b #-0x1e6c (addr 0x1de12ab1bc0c)
0x1de12ab1da7c  1e9c  1e6720e0       fcmp d7, d7
0x1de12ab1da80  1ea0  54000080       b.eq #+0x10 (addr 0x1de12ab1da90)
0x1de12ab1da84  1ea4  d280000b       movz x11, #0x0
0x1de12ab1da88  1ea8  aa0b03ea       mov x10, x11
0x1de12ab1da8c  1eac  17fff895       b #-0x1dac (addr 0x1de12ab1bce0)
0x1de12ab1da90  1eb0  1e2020c8       fcmp s6, #0.0
0x1de12ab1da94  1eb4  54000063       b.lo #+0xc (addr 0x1de12ab1daa0)
0x1de12ab1da98  1eb8  9280000a       movn x10, #0x0
0x1de12ab1da9c  1ebc  17fff891       b #-0x1dbc (addr 0x1de12ab1bce0)
0x1de12ab1daa0  1ec0  d280000a       movz x10, #0x0
0x1de12ab1daa4  1ec4  17fff88f       b #-0x1dc4 (addr 0x1de12ab1bce0)
0x1de12ab1daa8  1ec8  1e682100       fcmp d8, d8
0x1de12ab1daac  1ecc  54000060       b.eq #+0xc (addr 0x1de12ab1dab8)
0x1de12ab1dab0  1ed0  d280000a       movz x10, #0x0
0x1de12ab1dab4  1ed4  17fff893       b #-0x1db4 (addr 0x1de12ab1bd00)
0x1de12ab1dab8  1ed8  1e2020e8       fcmp s7, #0.0
0x1de12ab1dabc  1edc  54ffffa3       b.lo #-0xc (addr 0x1de12ab1dab0)
0x1de12ab1dac0  1ee0  9280000a       movn x10, #0x0
0x1de12ab1dac4  1ee4  17fff88f       b #-0x1dc4 (addr 0x1de12ab1bd00)
0x1de12ab1dac8  1ee8  fd0227e3       str d3, [sp, #1096]
0x1de12ab1dacc  1eec  f9023ff4       str x20, [sp, #1144]
0x1de12ab1dad0  1ef0  f9024bf3       str x19, [sp, #1168]
0x1de12ab1dad4  1ef4  97fc003f       bl #-0xfff04 (addr 0x1de12aa1dbd0)
0x1de12ab1dad8  1ef8  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1dadc  1efc  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1dae0  1f00  f941cbee       ldr x14, [sp, #912]
0x1de12ab1dae4  1f04  f941b3ec       ldr x12, [sp, #864]
0x1de12ab1dae8  1f08  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1daec  1f0c  f9421feb       ldr x11, [sp, #1080]
0x1de12ab1daf0  1f10  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1daf4  1f14  f9424bf3       ldr x19, [sp, #1168]
0x1de12ab1daf8  1f18  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1dafc  1f1c  f94247e0       ldr x0, [sp, #1160]
0x1de12ab1db00  1f20  f9424fef       ldr x15, [sp, #1176]
0x1de12ab1db04  1f24  f94253ed       ldr x13, [sp, #1184]
0x1de12ab1db08  1f28  f9423ff4       ldr x20, [sp, #1144]
0x1de12ab1db0c  1f2c  17fff8c1       b #-0x1cfc (addr 0x1de12ab1be10)
0x1de12ab1db10  1f30  fd0227e3       str d3, [sp, #1096]
0x1de12ab1db14  1f34  f9024beb       str x11, [sp, #1168]
0x1de12ab1db18  1f38  f9024fe2       str x2, [sp, #1176]
0x1de12ab1db1c  1f3c  97fc002d       bl #-0xfff4c (addr 0x1de12aa1dbd0)
0x1de12ab1db20  1f40  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1db24  1f44  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1db28  1f48  f941c7f3       ldr x19, [sp, #904]
0x1de12ab1db2c  1f4c  f941d7ed       ldr x13, [sp, #936]
0x1de12ab1db30  1f50  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1db34  1f54  f94253ea       ldr x10, [sp, #1184]
0x1de12ab1db38  1f58  f9421ff5       ldr x21, [sp, #1080]
0x1de12ab1db3c  1f5c  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1db40  1f60  f9424fe2       ldr x2, [sp, #1176]
0x1de12ab1db44  1f64  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1db48  1f68  f94243e0       ldr x0, [sp, #1152]
0x1de12ab1db4c  1f6c  f94247f4       ldr x20, [sp, #1160]
0x1de12ab1db50  1f70  f9423fef       ldr x15, [sp, #1144]
0x1de12ab1db54  1f74  f9424beb       ldr x11, [sp, #1168]
0x1de12ab1db58  1f78  17fff8f3       b #-0x1c34 (addr 0x1de12ab1bf24)
0x1de12ab1db5c  1f7c  fd0227e3       str d3, [sp, #1096]
0x1de12ab1db60  1f80  f90247f5       str x21, [sp, #1160]
0x1de12ab1db64  1f84  f9024be2       str x2, [sp, #1168]
0x1de12ab1db68  1f88  97fc001a       bl #-0xfff98 (addr 0x1de12aa1dbd0)
0x1de12ab1db6c  1f8c  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1db70  1f90  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1db74  1f94  f941c3ef       ldr x15, [sp, #896]
0x1de12ab1db78  1f98  f941d3ec       ldr x12, [sp, #928]
0x1de12ab1db7c  1f9c  f94253ea       ldr x10, [sp, #1184]
0x1de12ab1db80  1fa0  f9424feb       ldr x11, [sp, #1176]
0x1de12ab1db84  1fa4  f9421ff6       ldr x22, [sp, #1080]
0x1de12ab1db88  1fa8  f9425fe9       ldr x9, [sp, #1208]
0x1de12ab1db8c  1fac  f9424be2       ldr x2, [sp, #1168]
0x1de12ab1db90  1fb0  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1db94  1fb4  f9422be0       ldr x0, [sp, #1104]
0x1de12ab1db98  1fb8  f9423ff4       ldr x20, [sp, #1144]
0x1de12ab1db9c  1fbc  f94243ee       ldr x14, [sp, #1152]
0x1de12ab1dba0  1fc0  f94247f5       ldr x21, [sp, #1160]
0x1de12ab1dba4  1fc4  17fff921       b #-0x1b7c (addr 0x1de12ab1c028)
0x1de12ab1dba8  1fc8  fd0227e3       str d3, [sp, #1096]
0x1de12ab1dbac  1fcc  f90223e9       str x9, [sp, #1088]
0x1de12ab1dbb0  1fd0  f90247e2       str x2, [sp, #1160]
0x1de12ab1dbb4  1fd4  97fc0007       bl #-0xfffe4 (addr 0x1de12aa1dbd0)
0x1de12ab1dbb8  1fd8  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1dbbc  1fdc  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1dbc0  1fe0  f941bbf3       ldr x19, [sp, #880]
0x1de12ab1dbc4  1fe4  f941cfed       ldr x13, [sp, #920]
0x1de12ab1dbc8  1fe8  f9424feb       ldr x11, [sp, #1176]
0x1de12ab1dbcc  1fec  f9424be6       ldr x6, [sp, #1168]
0x1de12ab1dbd0  1ff0  f94247e2       ldr x2, [sp, #1160]
0x1de12ab1dbd4  1ff4  fd4227e3       ldr d3, [sp, #1096]
0x1de12ab1dbd8  1ff8  f9425fe0       ldr x0, [sp, #1208]
0x1de12ab1dbdc  1ffc  f9421ff5       ldr x21, [sp, #1080]
0x1de12ab1dbe0  2000  f94243f4       ldr x20, [sp, #1152]
0x1de12ab1dbe4  2004  f9422fee       ldr x14, [sp, #1112]
0x1de12ab1dbe8  2008  f94223e9       ldr x9, [sp, #1088]
0x1de12ab1dbec  200c  17fff954       b #-0x1ab0 (addr 0x1de12ab1c13c)
0x1de12ab1dbf0  2010  f9025bf4       str x20, [sp, #1200]
0x1de12ab1dbf4  2014  97fbfff7       bl #-0x100024 (addr 0x1de12aa1dbd0)
0x1de12ab1dbf8  2018  f9425bf4       ldr x20, [sp, #1200]
0x1de12ab1dbfc  201c  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1dc00  2020  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1dc04  2024  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1dc08  2028  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1dc0c  202c  d280001c       movz x28, #0x0
0x1de12ab1dc10  2030  f941b7e1       ldr x1, [sp, #872]
0x1de12ab1dc14  2034  f940f7fb       ldr cp, [sp, #488]
0x1de12ab1dc18  2038  f941bbf3       ldr x19, [sp, #880]
0x1de12ab1dc1c  203c  f941c3f9       ldr x25, [sp, #896]
0x1de12ab1dc20  2040  f941c7ee       ldr x14, [sp, #904]
0x1de12ab1dc24  2044  f941cbf8       ldr x24, [sp, #912]
0x1de12ab1dc28  2048  f941cfed       ldr x13, [sp, #920]
0x1de12ab1dc2c  204c  f941d3f6       ldr x22, [sp, #928]
0x1de12ab1dc30  2050  f941d7f7       ldr x23, [sp, #936]
0x1de12ab1dc34  2054  f941b3f5       ldr x21, [sp, #864]
0x1de12ab1dc38  2058  17fff9c0       b #-0x1900 (addr 0x1de12ab1c338)
0x1de12ab1dc3c  205c  1e6c2180       fcmp d12, d12
0x1de12ab1dc40  2060  54000060       b.eq #+0xc (addr 0x1de12ab1dc4c)
0x1de12ab1dc44  2064  aa1c03ef       mov x15, x28
0x1de12ab1dc48  2068  17fffa05       b #-0x17ec (addr 0x1de12ab1c45c)
0x1de12ab1dc4c  206c  1e202168       fcmp s11, #0.0
0x1de12ab1dc50  2070  54ffffa3       b.lo #-0xc (addr 0x1de12ab1dc44)
0x1de12ab1dc54  2074  9280000f       movn x15, #0x0
0x1de12ab1dc58  2078  17fffa01       b #-0x17fc (addr 0x1de12ab1c45c)
0x1de12ab1dc5c  207c  1e6b2160       fcmp d11, d11
0x1de12ab1dc60  2080  54000060       b.eq #+0xc (addr 0x1de12ab1dc6c)
0x1de12ab1dc64  2084  aa1c03f5       mov x21, x28
0x1de12ab1dc68  2088  17fffa1e       b #-0x1788 (addr 0x1de12ab1c4e0)
0x1de12ab1dc6c  208c  1e202148       fcmp s10, #0.0
0x1de12ab1dc70  2090  54ffffa3       b.lo #-0xc (addr 0x1de12ab1dc64)
0x1de12ab1dc74  2094  92800015       movn x21, #0x0
0x1de12ab1dc78  2098  17fffa1a       b #-0x1798 (addr 0x1de12ab1c4e0)
0x1de12ab1dc7c  209c  97fbffd5       bl #-0x1000ac (addr 0x1de12aa1dbd0)
0x1de12ab1dc80  20a0  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1dc84  20a4  f9422ff3       ldr x19, [sp, #1112]
0x1de12ab1dc88  20a8  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1dc8c  20ac  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1dc90  20b0  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1dc94  20b4  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1dc98  20b8  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1dc9c  20bc  f9411fe5       ldr x5, [sp, #568]
0x1de12ab1dca0  20c0  f9411be6       ldr x6, [sp, #560]
0x1de12ab1dca4  20c4  f94117ea       ldr x10, [sp, #552]
0x1de12ab1dca8  20c8  f94113e9       ldr x9, [sp, #544]
0x1de12ab1dcac  20cc  f9410feb       ldr x11, [sp, #536]
0x1de12ab1dcb0  20d0  f9410be0       ldr x0, [sp, #528]
0x1de12ab1dcb4  20d4  d280001c       movz x28, #0x0
0x1de12ab1dcb8  20d8  f940d7e4       ldr x4, [sp, #424]
0x1de12ab1dcbc  20dc  f940dbe2       ldr x2, [sp, #432]
0x1de12ab1dcc0  20e0  f940dfe3       ldr x3, [sp, #440]
0x1de12ab1dcc4  20e4  f940e3f5       ldr x21, [sp, #448]
0x1de12ab1dcc8  20e8  f940e7f7       ldr x23, [sp, #456]
0x1de12ab1dccc  20ec  f940ebef       ldr x15, [sp, #464]
0x1de12ab1dcd0  20f0  f940eff6       ldr x22, [sp, #472]
0x1de12ab1dcd4  20f4  f940f3ee       ldr x14, [sp, #480]
0x1de12ab1dcd8  20f8  17fffa35       b #-0x172c (addr 0x1de12ab1c5ac)
0x1de12ab1dcdc  20fc  f90213ed       str x13, [sp, #1056]
0x1de12ab1dce0  2100  f90207ee       str x14, [sp, #1032]
0x1de12ab1dce4  2104  f90203fb       str cp, [sp, #1024]
0x1de12ab1dce8  2108  f901bff4       str x20, [sp, #888]
0x1de12ab1dcec  210c  f9021fe1       str x1, [sp, #1080]
0x1de12ab1dcf0  2110  f900fff7       str x23, [sp, #504]
0x1de12ab1dcf4  2114  f900fbf3       str x19, [sp, #496]
0x1de12ab1dcf8  2118  3d8033f8       str q24, [sp, #192]
0x1de12ab1dcfc  211c  3d802ff9       str q25, [sp, #176]
0x1de12ab1dd00  2120  3d802bfa       str q26, [sp, #160]
0x1de12ab1dd04  2124  3d8027fb       str q27, [sp, #144]
0x1de12ab1dd08  2128  3d8023fc       str q28, [sp, #128]
0x1de12ab1dd0c  212c  3d801fe0       str q0, [sp, #112]
0x1de12ab1dd10  2130  3d801be1       str q1, [sp, #96]
0x1de12ab1dd14  2134  3d8017e2       str q2, [sp, #80]
0x1de12ab1dd18  2138  3d8013e4       str q4, [sp, #64]
0x1de12ab1dd1c  213c  3d800fe7       str q7, [sp, #48]
0x1de12ab1dd20  2140  3d800be8       str q8, [sp, #32]
0x1de12ab1dd24  2144  3d8007e9       str q9, [sp, #16]
0x1de12ab1dd28  2148  f90007f8       str x24, [sp, #8]
0x1de12ab1dd2c  214c  f900d3e3       str x3, [sp, #416]
0x1de12ab1dd30  2150  97fbffa8       bl #-0x100160 (addr 0x1de12aa1dbd0)
0x1de12ab1dd34  2154  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1dd38  2158  f941dfe2       ldr x2, [sp, #952]
0x1de12ab1dd3c  215c  f94217ec       ldr x12, [sp, #1064]
0x1de12ab1dd40  2160  f94213ed       ldr x13, [sp, #1056]
0x1de12ab1dd44  2164  f9420fef       ldr x15, [sp, #1048]
0x1de12ab1dd48  2168  f9420bf6       ldr x22, [sp, #1040]
0x1de12ab1dd4c  216c  f94207ee       ldr x14, [sp, #1032]
0x1de12ab1dd50  2170  f94203fb       ldr cp, [sp, #1024]
0x1de12ab1dd54  2174  f941bff4       ldr x20, [sp, #888]
0x1de12ab1dd58  2178  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1dd5c  217c  3dc0a3e3       ldr q3, [sp, #640]
0x1de12ab1dd60  2180  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1dd64  2184  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1dd68  2188  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1dd6c  218c  f9421fe1       ldr x1, [sp, #1080]
0x1de12ab1dd70  2190  f9411fe5       ldr x5, [sp, #568]
0x1de12ab1dd74  2194  f9411be6       ldr x6, [sp, #560]
0x1de12ab1dd78  2198  f94117ea       ldr x10, [sp, #552]
0x1de12ab1dd7c  219c  f94113e9       ldr x9, [sp, #544]
0x1de12ab1dd80  21a0  f9410feb       ldr x11, [sp, #536]
0x1de12ab1dd84  21a4  f9410be0       ldr x0, [sp, #528]
0x1de12ab1dd88  21a8  d280001c       movz x28, #0x0
0x1de12ab1dd8c  21ac  f940fff7       ldr x23, [sp, #504]
0x1de12ab1dd90  21b0  f940fbf3       ldr x19, [sp, #496]
0x1de12ab1dd94  21b4  3dc033f8       ldr q24, [sp, #192]
0x1de12ab1dd98  21b8  3dc02ff9       ldr q25, [sp, #176]
0x1de12ab1dd9c  21bc  3dc02bfa       ldr q26, [sp, #160]
0x1de12ab1dda0  21c0  3dc027fb       ldr q27, [sp, #144]
0x1de12ab1dda4  21c4  3dc023fc       ldr q28, [sp, #128]
0x1de12ab1dda8  21c8  3dc01fe0       ldr q0, [sp, #112]
0x1de12ab1ddac  21cc  3dc01be1       ldr q1, [sp, #96]
0x1de12ab1ddb0  21d0  3dc017e2       ldr q2, [sp, #80]
0x1de12ab1ddb4  21d4  3dc013e4       ldr q4, [sp, #64]
0x1de12ab1ddb8  21d8  3dc00fe7       ldr q7, [sp, #48]
0x1de12ab1ddbc  21dc  3dc00be8       ldr q8, [sp, #32]
0x1de12ab1ddc0  21e0  3dc007e9       ldr q9, [sp, #16]
0x1de12ab1ddc4  21e4  f94007f8       ldr x24, [sp, #8]
0x1de12ab1ddc8  21e8  f940d3e3       ldr x3, [sp, #416]
0x1de12ab1ddcc  21ec  f940d7e4       ldr x4, [sp, #424]
0x1de12ab1ddd0  21f0  17fffa9c       b #-0x1590 (addr 0x1de12ab1c840)
0x1de12ab1ddd4  21f4  f9021feb       str x11, [sp, #1080]
0x1de12ab1ddd8  21f8  f90217ea       str x10, [sp, #1064]
0x1de12ab1dddc  21fc  f90213ed       str x13, [sp, #1056]
0x1de12ab1dde0  2200  f901dbf9       str x25, [sp, #944]
0x1de12ab1dde4  2204  f901dfe2       str x2, [sp, #952]
0x1de12ab1dde8  2208  f9020fe9       str x9, [sp, #1048]
0x1de12ab1ddec  220c  fd020be7       str d7, [sp, #1040]
0x1de12ab1ddf0  2210  fd0207e4       str d4, [sp, #1032]
0x1de12ab1ddf4  2214  fd0203e3       str d3, [sp, #1024]
0x1de12ab1ddf8  2218  3d80ffe8       str q8, [sp, #1008]
0x1de12ab1ddfc  221c  3d80fbe2       str q2, [sp, #992]
0x1de12ab1de00  2220  97fbff74       bl #-0x100230 (addr 0x1de12aa1dbd0)
0x1de12ab1de04  2224  f94263e1       ldr x1, [sp, #1216]
0x1de12ab1de08  2228  f94257e8       ldr x8, [sp, #1192]
0x1de12ab1de0c  222c  f94227f3       ldr x19, [sp, #1096]
0x1de12ab1de10  2230  f94223ec       ldr x12, [sp, #1088]
0x1de12ab1de14  2234  f9421feb       ldr x11, [sp, #1080]
0x1de12ab1de18  2238  f9421be6       ldr x6, [sp, #1072]
0x1de12ab1de1c  223c  f94217ea       ldr x10, [sp, #1064]
0x1de12ab1de20  2240  f94213ed       ldr x13, [sp, #1056]
0x1de12ab1de24  2244  f941dbf9       ldr x25, [sp, #944]
0x1de12ab1de28  2248  f941dfe2       ldr x2, [sp, #952]
0x1de12ab1de2c  224c  f9420fe9       ldr x9, [sp, #1048]
0x1de12ab1de30  2250  fd420be7       ldr d7, [sp, #1040]
0x1de12ab1de34  2254  fd4207e4       ldr d4, [sp, #1032]
0x1de12ab1de38  2258  fd4203e3       ldr d3, [sp, #1024]
0x1de12ab1de3c  225c  3dc0ffe8       ldr q8, [sp, #1008]
0x1de12ab1de40  2260  3dc0fbe2       ldr q2, [sp, #992]
0x1de12ab1de44  2264  1e2e1010       fmov s16, #0x70 (1.0000)
0x1de12ab1de48  2268  fd41efee       ldr d14, [sp, #984]
0x1de12ab1de4c  226c  fd41ebed       ldr d13, [sp, #976]
0x1de12ab1de50  2270  fd41e7ec       ldr d12, [sp, #968]
0x1de12ab1de54  2274  fd41e3e9       ldr d9, [sp, #960]
0x1de12ab1de58  2278  3dc0a7e6       ldr q6, [sp, #656]
0x1de12ab1de5c  227c  3dc09fe5       ldr q5, [sp, #624]
0x1de12ab1de60  2280  3dc097eb       ldr q11, [sp, #592]
0x1de12ab1de64  2284  3dc093ea       ldr q10, [sp, #576]
0x1de12ab1de68  2288  17fffe88       b #-0x5e0 (addr 0x1de12ab1d888)
0x1de12ab1de6c  228c  d503201f       nop

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
       6e4         
       6f0         
       6f8         
       6fc         
       704         
       758         
       768         
       778         
       788         
       798         
       7a4         
       7a8         
       7b0         
       7b4         
       7bc         
       7c0         
       7c8         
       7d4         
       7dc         
       7e4         
       7e8         
       7f0         
       800         
       804         
       80c         
       814         
       8bc         
       948         
       950         
       9ec         
       9f4         
       c64         
       c74         
       cb0         
       cc8         
       d10         
       d28         
       d68         
       d80         
       dc0         
       dd8         
       df8         
       e08         
       e28         
       e38         
       e58         
       e68         
      1010         
      1018         
      1020         
      1028         
      1030         
      103c         
      1044         
      1050         
      105c         
      1064         
      1070         
      1078         
      1084         
      108c         
      1098         
      1100         
      1138         
      11b0         
      122c         
      1298         
      12a8         
      12b8         
      12c8         
      12d8         
      130c         
      1348         
      1380         
      13b8         
      13d0         
      13e8         
      1400         
      1418         
      1430         
      1448         
      1460         
      1478         
      1490         
      14a8         
      14c0         
      14d4         
      14ec         
      1504         
      151c         
      1530         
      1584         
      1590         
      159c         
      15a8         
      15b4         
      15bc         
      15c4         
      15cc         
      15d4         
      15dc         
      15e4         
      15ec         
      15f4         
      15fc         
      1604         
      160c         
      1614         
      161c         
      1624         
      162c         
      1634         
      163c         
      1644         
      164c         
      1654         
      165c         
      1664         
      166c         
      1670         
      1674         
      1680         
      1748         
      174c         
      1820         
      182c         
      1838         
      1844         
      1850         
      1858         
      1868         
      1880         
      1940         
      1948         
      1958         
      1970         
      19c8         
      19d4         
      19e0         
      1a00         
      1a08         
      1a0c         
      1a14         
      1a20         
      1a2c         
      1a34         
      1a40         
      1a4c         
      1a58         
      1a60         
      1a6c         
      1a78         
      1a84         
      1a8c         
      1a98         
      1aa4         
      1ab0         
      1abc         
      1ac4         
      1ac8         
      1ad0         
      1adc         
      1ae8         
      1af0         
      1afc         
      1b08         
      1b14         
      1b1c         
      1b28         
      1b34         
      1b40         
      1b48         
      1b54         
      1b60         
      1b6c         
      1b78         
      1b80         
      1b84         
      1b8c         
      1b98         
      1ba4         
      1bac         
      1bb8         
      1bc4         
      1bd0         
      1bd8         
      1be4         
      1bf0         
      1bfc         
      1c04         
      1c10         
      1c1c         
      1c28         
      1c34         
      1c3c         
      1c7c         
      1ca8         
      1cb8         
      1cf0         
      1cf8         
      1d2c         
      1d30         
      1d34         
      1d38         
      1da4         
      1da8         
      1db8         
      1dbc         
      1dcc         
      1dd0         
      1de0         
      1de4         

Source positions:
 pc offset  position
        44        66
        64       103
        b4       172
       14c       285
       158       295
       160       299
       168       306
       170       310
       17c       321
       184       326
       18c       331
       194       336
       198       339
       1c4       353
       1d8       366
       1e0       373
       1e8       385
       1f0       392
       238       434
       24c       463
       274       492
       280       504
       2cc       520
       2e0       525
       2e8       536
       304       555
       308       560
       310       567
       34c       609
       360       638
       388       667
       394       679
       3e0       695
       3e8       700
       3f0       711
       400       730
       408       735
       410       742
       450       785
       464       814
       48c       843
       498       855
       4e4       871
       4ec       876
       4f4       887
       504       906
       50c       911
       514       918
       564       957
       578       986
       5b0      1015
       5bc      1027
       604      1043
       618      1048
       620      1059
       62c      1072
       638      1079
       63c      1089
       640      1093
       644      1101
       64c      1107
       650      1117
       658      1121
       65c      1129
       660      1135
       668      1142
       66c      1151
       674      1155
       678      1163
       67c      1170
       680      1177
       6a8      1189
       6ac      1196
       6b0      1203
       6b8      1210
       6e4      1252
       6f0      1269
       6f8      1276
       6fc      1283
       704      1290
       758      1307
       768      1319
       778      1331
       788      1343
       798      1353
       7a4      1366
       7a8      1373
       7b0      1381
       7b4      1388
       7bc      1396
       7c0      1405
       7c8      1413
       7d4      1416
       7dc      1423
       7e4      1430
       7e8      1437
       7f0      1444
       800      1467
       804      1473
       80c      1483
       814      1490
       8bc      1595
       948      1734
       950      1741
       9ec      1809
       9f4      1822
       c64      2362
       c74      2387
       cac      2451
       cc4      2474
       d0c      2538
       d24      2561
       d64      2625
       d7c      2648
       dc0      2712
       dd8      2735
       df8      2784
       e08      2805
       e28      2854
       e38      2875
       e58      2924
       e68      2945
      1010      3227
      1018      3235
      1020      3243
      1028      3251
      1030      3264
      1038      3272
      1044      3280
      104c      3288
      1058      3301
      1064      3309
      106c      3317
      1078      3330
      1080      3338
      108c      3346
      1094      3358
      1100      3438
      1138      3489
      11b0      3602
      122c      3715
      1298      3828
      12a8      3847
      12b8      3866
      12c8      3885
      12d8      3904
      130c      3979
      1348      4036
      1380      4093
      13b8      4150
      13d0      4169
      13e8      4188
      1400      4207
      1418      4226
      1430      4245
      1448      4264
      1460      4283
      1478      4302
      1490      4321
      14a8      4340
      14c0      4359
      14d4      4378
      14ec      4397
      1504      4415
      151c      4433
      1530      4451
      153c      4466
      1580      4479
      158c      4488
      1598      4497
      15a4      4506
      15b0      4515
      15bc      4524
      15c4      4533
      15cc      4541
      15d4      4549
      15dc      4557
      15e4      4565
      15ec      4574
      15f4      4583
      15fc      4592
      1604      4601
      160c      4610
      1614      4619
      161c      4628
      1624      4637
      162c      4646
      1634      4655
      163c      4664
      1644      4673
      164c      4682
      1654      4691
      165c      4700
      1664      4709
      166c      4718
      1670      4727
      1674      4735
      1680      4762
      1748      5004
      174c      5012
      1820      5283
      1828      5287
      1834      5293
      1840      5299
      1850      5310
      1858      5318
      1868      5345
      1880      5372
      1940      5597
      1948      5605
      1958      5632
      1970      5659
      19c8      5758
      19d0      5762
      19dc      5768
      19fc      5799
      1a08      5808
      1a0c      5816
      1a14      5822
      1a20      5829
      1a2c      5836
      1a34      5843
      1a40      5850
      1a4c      5857
      1a58      5864
      1a60      5871
      1a6c      5878
      1a78      5885
      1a84      5892
      1a8c      5899
      1a98      5906
      1aa4      5913
      1ab0      5920
      1ab8      5927
      1ac4      5933
      1ac8      5940
      1ad0      5946
      1adc      5953
      1ae8      5960
      1af0      5967
      1afc      5974
      1b08      5981
      1b14      5988
      1b1c      5995
      1b28      6002
      1b34      6009
      1b40      6016
      1b48      6023
      1b54      6030
      1b60      6037
      1b6c      6044
      1b78      6051
      1b80      6057
      1b84      6064
      1b8c      6070
      1b98      6077
      1ba4      6084
      1bac      6091
      1bb8      6098
      1bc4      6105
      1bd0      6112
      1bd8      6119
      1be4      6126
      1bf0      6133
      1bfc      6140
      1c04      6147
      1c10      6154
      1c1c      6161
      1c28      6168
      1c30      6175
      1c3c      6181
      1c7c      6260
      1ca8      6276
      1cb8      6291
      1cf0      6352
      1cf8      6360
      1d2c      6433
      1d30      6440
      1d34      6447
      1d38      6454
      1d64      6499
      1da0      6519
      1da8      6522
      1db8      6532
      1dbc      6535
      1dcc      6545
      1dd0      6548
      1de0      6558
      1de4      6561
      1e88         0
      1ee8       408
      1f30       583
      1f7c       759
      1fc8       931
      2010      1299
      209c      1746
      20fc      2351
      21f4      6266

Safepoints (stack slots = 158, entries = 1, byte size = 34)
0x1de12ab1bd9c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 55)
0x1de12ab1bd98  internal wasm call
0x1de12ab1be70  internal wasm call
0x1de12ab1bf80  internal wasm call
0x1de12ab1c084  internal wasm call
0x1de12ab1c1a8  internal wasm call
0x1de12ab1d124  internal wasm call
0x1de12ab1d958  internal wasm call
0x1de12ab1da68  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1dad4  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1db1c  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1db68  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1dbb4  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1dbf4  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1dc7c  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1dd30  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1de00  wasm stub call  (0x1de12aa1dbd0)
