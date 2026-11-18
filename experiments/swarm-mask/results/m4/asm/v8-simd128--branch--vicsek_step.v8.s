name: _RNvMs0_NtCshBZZPcGIfde_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 4512 = 4492 + 20 padding)
Instructions (size = 4472)
0x20d29c6d4a20     0  d2800110       movz x16, #0x8
0x20d29c6d4a24     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x20d29c6d4a28     8  a9017bfd       stp fp, lr, [sp, #16]
0x20d29c6d4a2c     c  910043fd       add fp, sp, #0x10 (16)
0x20d29c6d4a30    10  d10443ff       sub sp, sp, #0x110 (272)
0x20d29c6d4a34    14  f841f0e1       ldur x1, [x7, #31]
0x20d29c6d4a38    18  f8520346       ldur x6, [x26, #-224]
0x20d29c6d4a3c    1c  f9007fe1       str x1, [sp, #248]
0x20d29c6d4a40    20  eb2663ff       cmp sp, x6
0x20d29c6d4a44    24  54007249       b.ls #+0xe48 (addr 0x20d29c6d588c)
0x20d29c6d4a48    28  f842f0e6       ldur x6, [x7, #47]
0x20d29c6d4a4c    2c  b94000c8       ldr w8, [x6]
0x20d29c6d4a50    30  51014108       sub w8, w8, #0x50 (80)
0x20d29c6d4a54    34  b90000c8       str w8, [x6]
0x20d29c6d4a58    38  2a0003e9       mov w9, w0
0x20d29c6d4a5c    3c  9102b12a       add x10, x9, #0xac (172)
0x20d29c6d4a60    40  bc6a6821       ldr s1, [x1, x10]
0x20d29c6d4a64    44  9102a12a       add x10, x9, #0xa8 (168)
0x20d29c6d4a68    48  bc6a6822       ldr s2, [x1, x10]
0x20d29c6d4a6c    4c  9100212b       add x11, x9, #0x8 (8)
0x20d29c6d4a70    50  b86b6823       ldr w3, [x1, x11]
0x20d29c6d4a74    54  9102e12c       add x12, x9, #0xb8 (184)
0x20d29c6d4a78    58  386c682c       ldrb w12, [x1, x12]
0x20d29c6d4a7c    5c  f90087e6       str x6, [sp, #264]
0x20d29c6d4a80    60  f90083e8       str x8, [sp, #256]
0x20d29c6d4a84    64  f9007be9       str x9, [sp, #240]
0x20d29c6d4a88    68  fd0073e1       str d1, [sp, #224]
0x20d29c6d4a8c    6c  f90047ea       str x10, [sp, #136]
0x20d29c6d4a90    70  fd001fe2       str d2, [sp, #56]
0x20d29c6d4a94    74  f90027eb       str x11, [sp, #72]
0x20d29c6d4a98    78  f90077e3       str x3, [sp, #232]
0x20d29c6d4a9c    7c  350001ec       cbnz w12, #+0x3c (addr 0x20d29c6d4ad8)
0x20d29c6d4aa0    80  52840010       movz w16, #0x2000
0x20d29c6d4aa4    84  72a7f010       movk w16, #0x3f80, lsl #16
0x20d29c6d4aa8    88  1e270203       fmov s3, w16
0x20d29c6d4aac    8c  1e230823       fmul s3, s1, s3
0x20d29c6d4ab0    90  1e231843       fdiv s3, s2, s3
0x20d29c6d4ab4    94  1e254063       frintm s3, s3
0x20d29c6d4ab8    98  1e202068       fcmp s3, #0.0
0x20d29c6d4abc    9c  5400006a       b.ge #+0xc (addr 0x20d29c6d4ac8)
0x20d29c6d4ac0    a0  d280000c       movz x12, #0x0
0x20d29c6d4ac4    a4  1400002d       b #+0xb4 (addr 0x20d29c6d4b78)
0x20d29c6d4ac8    a8  52a9f010       movz w16, #0x4f800000
0x20d29c6d4acc    ac  1e270204       fmov s4, w16
0x20d29c6d4ad0    b0  1e242060       fcmp s3, s4
0x20d29c6d4ad4    b4  54000063       b.lo #+0xc (addr 0x20d29c6d4ae0)
0x20d29c6d4ad8    b8  d280000c       movz x12, #0x0
0x20d29c6d4adc    bc  14000027       b #+0x9c (addr 0x20d29c6d4b78)
0x20d29c6d4ae0    c0  1e22c064       fcvt d4, s3
0x20d29c6d4ae4    c4  1e65c085       frintz d5, d4
0x20d29c6d4ae8    c8  1e7900ac       fcvtzu w12, d5
0x20d29c6d4aec    cc  1e630186       ucvtf d6, w12
0x20d29c6d4af0    d0  1e6620a0       fcmp d5, d6
0x20d29c6d4af4    d4  54006d81       b.ne #+0xdb0 (addr 0x20d29c6d58a4)
0x20d29c6d4af8    d8  71000d9f       cmp w12, #0x3 (3)
0x20d29c6d4afc    dc  54fffee3       b.lo #-0x24 (addr 0x20d29c6d4ad8)
0x20d29c6d4b00    e0  9100512d       add x13, x9, #0x14 (20)
0x20d29c6d4b04    e4  b86d6825       ldr w5, [x1, x13]
0x20d29c6d4b08    e8  9100412d       add x13, x9, #0x10 (16)
0x20d29c6d4b0c    ec  b86d6824       ldr w4, [x1, x13]
0x20d29c6d4b10    f0  9100112d       add x13, x9, #0x4 (4)
0x20d29c6d4b14    f4  b86d6822       ldr w2, [x1, x13]
0x20d29c6d4b18    f8  d280800d       movz x13, #0x400
0x20d29c6d4b1c    fc  7110019f       cmp w12, #0x400 (1024)
0x20d29c6d4b20   100  1a8d318e       csel w14, w12, w13, lo
0x20d29c6d4b24   104  9102312c       add x12, x9, #0x8c (140)
0x20d29c6d4b28   108  b82c682e       str w14, [x1, x12]
0x20d29c6d4b2c   10c  9102212c       add x12, x9, #0x88 (136)
0x20d29c6d4b30   110  b82c682e       str w14, [x1, x12]
0x20d29c6d4b34   114  1e2301c3       ucvtf s3, w14
0x20d29c6d4b38   118  1e221863       fdiv s3, s3, s2
0x20d29c6d4b3c   11c  9102112c       add x12, x9, #0x84 (132)
0x20d29c6d4b40   120  bc2c6823       str s3, [x1, x12]
0x20d29c6d4b44   124  11018000       add w0, w0, #0x60 (96)
0x20d29c6d4b48   128  97fac2cd       bl #-0x14f4cc (addr 0x20d29c58567c)
0x20d29c6d4b4c   12c  fd4073e1       ldr d1, [sp, #224]
0x20d29c6d4b50   130  d280002c       movz x12, #0x1
0x20d29c6d4b54   134  f94087e6       ldr x6, [sp, #264]
0x20d29c6d4b58   138  f94083e8       ldr x8, [sp, #256]
0x20d29c6d4b5c   13c  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d4b60   140  f9407be9       ldr x9, [sp, #240]
0x20d29c6d4b64   144  f9408be7       ldr x7, [sp, #272]
0x20d29c6d4b68   148  f94077e3       ldr x3, [sp, #232]
0x20d29c6d4b6c   14c  f94047ea       ldr x10, [sp, #136]
0x20d29c6d4b70   150  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d4b74   154  f94027eb       ldr x11, [sp, #72]
0x20d29c6d4b78   158  f90033ec       str x12, [sp, #96]
0x20d29c6d4b7c   15c  aa0303ed       mov x13, x3
0x20d29c6d4b80   160  3400650d       cbz w13, #+0xca0 (addr 0x20d29c6d5820)
0x20d29c6d4b84   164  9101712e       add x14, x9, #0x5c (92)
0x20d29c6d4b88   168  b86e682e       ldr w14, [x1, x14]
0x20d29c6d4b8c   16c  9101412f       add x15, x9, #0x50 (80)
0x20d29c6d4b90   170  b86f682f       ldr w15, [x1, x15]
0x20d29c6d4b94   174  91011133       add x19, x9, #0x44 (68)
0x20d29c6d4b98   178  b8736833       ldr w19, [x1, x19]
0x20d29c6d4b9c   17c  9100e134       add x20, x9, #0x38 (56)
0x20d29c6d4ba0   180  b8746834       ldr w20, [x1, x20]
0x20d29c6d4ba4   184  6b14027f       cmp w19, w20
0x20d29c6d4ba8   188  1a943275       csel w21, w19, w20, lo
0x20d29c6d4bac   18c  6b1501ff       cmp w15, w21
0x20d29c6d4bb0   190  1a9531f3       csel w19, w15, w21, lo
0x20d29c6d4bb4   194  6b1301df       cmp w14, w19
0x20d29c6d4bb8   198  1a9331cf       csel w15, w14, w19, lo
0x20d29c6d4bbc   19c  1e3c1003       fmov s3, #0xe0 (-0.5000)
0x20d29c6d4bc0   1a0  1e230843       fmul s3, s2, s3
0x20d29c6d4bc4   1a4  1e2c1004       fmov s4, #0x60 (0.5000)
0x20d29c6d4bc8   1a8  1e240844       fmul s4, s2, s4
0x20d29c6d4bcc   1ac  9101612e       add x14, x9, #0x58 (88)
0x20d29c6d4bd0   1b0  b86e682e       ldr w14, [x1, x14]
0x20d29c6d4bd4   1b4  91013133       add x19, x9, #0x4c (76)
0x20d29c6d4bd8   1b8  b8736833       ldr w19, [x1, x19]
0x20d29c6d4bdc   1bc  91010134       add x20, x9, #0x40 (64)
0x20d29c6d4be0   1c0  b8746834       ldr w20, [x1, x20]
0x20d29c6d4be4   1c4  9100d135       add x21, x9, #0x34 (52)
0x20d29c6d4be8   1c8  b8756835       ldr w21, [x1, x21]
0x20d29c6d4bec   1cc  11002116       add w22, w8, #0x8 (8)
0x20d29c6d4bf0   1d0  1e210821       fmul s1, s1, s1
0x20d29c6d4bf4   1d4  f90053ef       str x15, [sp, #160]
0x20d29c6d4bf8   1d8  fd001be3       str d3, [sp, #48]
0x20d29c6d4bfc   1dc  fd0017e4       str d4, [sp, #40]
0x20d29c6d4c00   1e0  f90067ee       str x14, [sp, #200]
0x20d29c6d4c04   1e4  f9005ff3       str x19, [sp, #184]
0x20d29c6d4c08   1e8  f9005bf4       str x20, [sp, #176]
0x20d29c6d4c0c   1ec  f90057f5       str x21, [sp, #168]
0x20d29c6d4c10   1f0  f90003f6       str x22, [sp]
0x20d29c6d4c14   1f4  fd0023e1       str d1, [sp, #64]
0x20d29c6d4c18   1f8  d280000a       movz x10, #0x0
0x20d29c6d4c1c   1fc  14000002       b #+0x8 (addr 0x20d29c6d4c24)
0x20d29c6d4c20   200  aa0603ed       mov x13, x6
0x20d29c6d4c24   204  f8520358       ldur x24, [x26, #-224]
0x20d29c6d4c28   208  eb3863ff       cmp sp, x24
0x20d29c6d4c2c   20c  540064c9       b.ls #+0xc98 (addr 0x20d29c6d58c4)
0x20d29c6d4c30   210  b86b6838       ldr w24, [x1, x11]
0x20d29c6d4c34   214  f9003bf8       str x24, [sp, #112]
0x20d29c6d4c38   218  6b0a031f       cmp w24, w10
0x20d29c6d4c3c   21c  54005c69       b.ls #+0xb8c (addr 0x20d29c6d57c8)
0x20d29c6d4c40   220  91005139       add x25, x9, #0x14 (20)
0x20d29c6d4c44   224  b8796839       ldr w25, [x1, x25]
0x20d29c6d4c48   228  6b0a033f       cmp w25, w10
0x20d29c6d4c4c   22c  54005be9       b.ls #+0xb7c (addr 0x20d29c6d57c8)
0x20d29c6d4c50   230  9100813b       add cp, x9, #0x20 (32)
0x20d29c6d4c54   234  b87b683b       ldr w27, [x1, x27]
0x20d29c6d4c58   238  f9006ffb       str cp, [sp, #216]
0x20d29c6d4c5c   23c  6b0a037f       cmp w27, w10
0x20d29c6d4c60   240  54005b49       b.ls #+0xb68 (addr 0x20d29c6d57c8)
0x20d29c6d4c64   244  9100b13c       add x28, x9, #0x2c (44)
0x20d29c6d4c68   248  b87c683c       ldr w28, [x1, x28]
0x20d29c6d4c6c   24c  f9006bfc       str x28, [sp, #208]
0x20d29c6d4c70   250  6b0a039f       cmp w28, w10
0x20d29c6d4c74   254  54005aa9       b.ls #+0xb54 (addr 0x20d29c6d57c8)
0x20d29c6d4c78   258  91001120       add x0, x9, #0x4 (4)
0x20d29c6d4c7c   25c  b8606820       ldr w0, [x1, x0]
0x20d29c6d4c80   260  531e7542       lsl w2, w10, #2
0x20d29c6d4c84   264  0b020003       add w3, w0, w2
0x20d29c6d4c88   268  bc636826       ldr s6, [x1, x3]
0x20d29c6d4c8c   26c  9100a123       add x3, x9, #0x28 (40)
0x20d29c6d4c90   270  b8636823       ldr w3, [x1, x3]
0x20d29c6d4c94   274  0b020064       add w4, w3, w2
0x20d29c6d4c98   278  bc646827       ldr s7, [x1, x4]
0x20d29c6d4c9c   27c  91007124       add x4, x9, #0x1c (28)
0x20d29c6d4ca0   280  b8646824       ldr w4, [x1, x4]
0x20d29c6d4ca4   284  0b020085       add w5, w4, w2
0x20d29c6d4ca8   288  bc656828       ldr s8, [x1, x5]
0x20d29c6d4cac   28c  91004125       add x5, x9, #0x10 (16)
0x20d29c6d4cb0   290  b8656825       ldr w5, [x1, x5]
0x20d29c6d4cb4   294  0b0200a6       add w6, w5, w2
0x20d29c6d4cb8   298  bc666829       ldr s9, [x1, x6]
0x20d29c6d4cbc   29c  f90073ea       str x10, [sp, #224]
0x20d29c6d4cc0   2a0  f90013e0       str x0, [sp, #32]
0x20d29c6d4cc4   2a4  f90063e2       str x2, [sp, #192]
0x20d29c6d4cc8   2a8  fd0043e6       str d6, [sp, #128]
0x20d29c6d4ccc   2ac  f90007e3       str x3, [sp, #8]
0x20d29c6d4cd0   2b0  fd004be7       str d7, [sp, #144]
0x20d29c6d4cd4   2b4  f9000be4       str x4, [sp, #16]
0x20d29c6d4cd8   2b8  fd003fe8       str d8, [sp, #120]
0x20d29c6d4cdc   2bc  f9000fe5       str x5, [sp, #24]
0x20d29c6d4ce0   2c0  fd004fe9       str d9, [sp, #152]
0x20d29c6d4ce4   2c4  3500090c       cbnz w12, #+0x120 (addr 0x20d29c6d4e04)
0x20d29c6d4ce8   2c8  6b19031f       cmp w24, w25
0x20d29c6d4cec   2cc  1a993306       csel w6, w24, w25, lo
0x20d29c6d4cf0   2d0  6b1c037f       cmp w27, w28
0x20d29c6d4cf4   2d4  1a9c3378       csel w24, w27, w28, lo
0x20d29c6d4cf8   2d8  6b1800df       cmp w6, w24
0x20d29c6d4cfc   2dc  1a9830d9       csel w25, w6, w24, lo
0x20d29c6d4d00   2e0  2f00e40a       movi d10, #0x0
0x20d29c6d4d04   2e4  d2800006       movz x6, #0x0
0x20d29c6d4d08   2e8  4eaa1d4b       mov v11.16b, v10.16b
0x20d29c6d4d0c   2ec  14000002       b #+0x8 (addr 0x20d29c6d4d14)
0x20d29c6d4d10   2f0  aa1b03e6       mov x6, cp
0x20d29c6d4d14   2f4  f8520358       ldur x24, [x26, #-224]
0x20d29c6d4d18   2f8  eb3863ff       cmp sp, x24
0x20d29c6d4d1c   2fc  54005f09       b.ls #+0xbe0 (addr 0x20d29c6d58fc)
0x20d29c6d4d20   300  6b06033f       cmp w25, w6
0x20d29c6d4d24   304  9a9f87f8       cset x24, ls
0x20d29c6d4d28   308  aa0603fb       mov cp, x6
0x20d29c6d4d2c   30c  1100077b       add w27, w27, #0x1 (1)
0x20d29c6d4d30   310  34000218       cbz w24, #+0x40 (addr 0x20d29c6d4d70)
0x20d29c6d4d34   314  6b0d037f       cmp w27, w13
0x20d29c6d4d38   318  54004382       b.hs #+0x870 (addr 0x20d29c6d55a8)
0x20d29c6d4d3c   31c  1100077b       add w27, w27, #0x1 (1)
0x20d29c6d4d40   320  6b0d037f       cmp w27, w13
0x20d29c6d4d44   324  54004322       b.hs #+0x864 (addr 0x20d29c6d55a8)
0x20d29c6d4d48   328  1100077b       add w27, w27, #0x1 (1)
0x20d29c6d4d4c   32c  6b0d037f       cmp w27, w13
0x20d29c6d4d50   330  540042c2       b.hs #+0x858 (addr 0x20d29c6d55a8)
0x20d29c6d4d54   334  f852035c       ldur x28, [x26, #-224]
0x20d29c6d4d58   338  eb3c63ff       cmp sp, x28
0x20d29c6d4d5c   33c  540060a9       b.ls #+0xc14 (addr 0x20d29c6d5970)
0x20d29c6d4d60   340  1100077b       add w27, w27, #0x1 (1)
0x20d29c6d4d64   344  6b0d037f       cmp w27, w13
0x20d29c6d4d68   348  54fffe23       b.lo #-0x3c (addr 0x20d29c6d4d2c)
0x20d29c6d4d6c   34c  1400020f       b #+0x83c (addr 0x20d29c6d55a8)
0x20d29c6d4d70   350  531e74c6       lsl w6, w6, #2
0x20d29c6d4d74   354  0b060078       add w24, w3, w6
0x20d29c6d4d78   358  0b06009c       add w28, w4, w6
0x20d29c6d4d7c   35c  0b0600aa       add w10, w5, w6
0x20d29c6d4d80   360  bc6a682c       ldr s12, [x1, x10]
0x20d29c6d4d84   364  0b060006       add w6, w0, w6
0x20d29c6d4d88   368  bc66682d       ldr s13, [x1, x6]
0x20d29c6d4d8c   36c  1e2d38cd       fsub s13, s6, s13
0x20d29c6d4d90   370  1e2d2080       fcmp s4, s13
0x20d29c6d4d94   374  540000a3       b.lo #+0x14 (addr 0x20d29c6d4da8)
0x20d29c6d4d98   378  1e2321a0       fcmp s13, s3
0x20d29c6d4d9c   37c  54000082       b.hs #+0x10 (addr 0x20d29c6d4dac)
0x20d29c6d4da0   380  1e2d284d       fadd s13, s2, s13
0x20d29c6d4da4   384  14000002       b #+0x8 (addr 0x20d29c6d4dac)
0x20d29c6d4da8   388  1e2239ad       fsub s13, s13, s2
0x20d29c6d4dac   38c  bc78682e       ldr s14, [x1, x24]
0x20d29c6d4db0   390  bc7c6830       ldr s16, [x1, x28]
0x20d29c6d4db4   394  1e2c392c       fsub s12, s9, s12
0x20d29c6d4db8   398  1e2c2080       fcmp s4, s12
0x20d29c6d4dbc   39c  540000a3       b.lo #+0x14 (addr 0x20d29c6d4dd0)
0x20d29c6d4dc0   3a0  1e232180       fcmp s12, s3
0x20d29c6d4dc4   3a4  54000082       b.hs #+0x10 (addr 0x20d29c6d4dd4)
0x20d29c6d4dc8   3a8  1e2c284c       fadd s12, s2, s12
0x20d29c6d4dcc   3ac  14000002       b #+0x8 (addr 0x20d29c6d4dd4)
0x20d29c6d4dd0   3b0  1e22398c       fsub s12, s12, s2
0x20d29c6d4dd4   3b4  1e302970       fadd s16, s11, s16
0x20d29c6d4dd8   3b8  1e2d09ad       fmul s13, s13, s13
0x20d29c6d4ddc   3bc  1e2c098c       fmul s12, s12, s12
0x20d29c6d4de0   3c0  1e2c29ac       fadd s12, s13, s12
0x20d29c6d4de4   3c4  1e212180       fcmp s12, s1
0x20d29c6d4de8   3c8  1e2b3e0b       fcsel s11, s16, s11, lo
0x20d29c6d4dec   3cc  1e2e294d       fadd s13, s10, s14
0x20d29c6d4df0   3d0  1e212180       fcmp s12, s1
0x20d29c6d4df4   3d4  1e2a3daa       fcsel s10, s13, s10, lo
0x20d29c6d4df8   3d8  6b0d037f       cmp w27, w13
0x20d29c6d4dfc   3dc  54fff8a3       b.lo #-0xec (addr 0x20d29c6d4d10)
0x20d29c6d4e00   3e0  140001ea       b #+0x7a8 (addr 0x20d29c6d55a8)
0x20d29c6d4e04   3e4  91023126       add x6, x9, #0x8c (140)
0x20d29c6d4e08   3e8  b8666826       ldr w6, [x1, x6]
0x20d29c6d4e0c   3ec  710000df       cmp w6, #0x0 (0)
0x20d29c6d4e10   3f0  9a9f17ea       cset x10, eq
0x20d29c6d4e14   3f4  34004e46       cbz w6, #+0x9c8 (addr 0x20d29c6d57dc)
0x20d29c6d4e18   3f8  9102212b       add x11, x9, #0x88 (136)
0x20d29c6d4e1c   3fc  b86b682b       ldr w11, [x1, x11]
0x20d29c6d4e20   400  7100017f       cmp w11, #0x0 (0)
0x20d29c6d4e24   404  9a9f17ec       cset x12, eq
0x20d29c6d4e28   408  34004eab       cbz w11, #+0x9d4 (addr 0x20d29c6d57fc)
0x20d29c6d4e2c   40c  9101912d       add x13, x9, #0x64 (100)
0x20d29c6d4e30   410  b86d682d       ldr w13, [x1, x13]
0x20d29c6d4e34   414  7100015f       cmp w10, #0x0 (0)
0x20d29c6d4e38   418  9a9f17ea       cset x10, eq
0x20d29c6d4e3c   41c  4b0a00ca       sub w10, w6, w10
0x20d29c6d4e40   420  9102112e       add x14, x9, #0x84 (132)
0x20d29c6d4e44   424  bc6e682a       ldr s10, [x1, x14]
0x20d29c6d4e48   428  1e2a092b       fmul s11, s9, s10
0x20d29c6d4e4c   42c  1e25416b       frintm s11, s11
0x20d29c6d4e50   430  1e2b2160       fcmp s11, s11
0x20d29c6d4e54   434  1e2b1deb       fcsel s11, s15, s11, ne
0x20d29c6d4e58   438  1e202168       fcmp s11, #0.0
0x20d29c6d4e5c   43c  1e2fcd6b       fcsel s11, s11, s15, gt
0x20d29c6d4e60   440  1e22c16c       fcvt d12, s11
0x20d29c6d4e64   444  1e65c18d       frintz d13, d12
0x20d29c6d4e68   448  1e7901ae       fcvtzu w14, d13
0x20d29c6d4e6c   44c  1e6301ce       ucvtf d14, w14
0x20d29c6d4e70   450  1e6e21a0       fcmp d13, d14
0x20d29c6d4e74   454  54005c01       b.ne #+0xb80 (addr 0x20d29c6d59f4)
0x20d29c6d4e78   458  6b0e015f       cmp w10, w14
0x20d29c6d4e7c   45c  1a8e314f       csel w15, w10, w14, lo
0x20d29c6d4e80   460  52a9f010       movz w16, #0x4f800000
0x20d29c6d4e84   464  1e27020c       fmov s12, w16
0x20d29c6d4e88   468  1e2c2160       fcmp s11, s12
0x20d29c6d4e8c   46c  1a9f31ea       csel w10, w15, wzr, lo
0x20d29c6d4e90   470  0b06014a       add w10, w10, w6
0x20d29c6d4e94   474  5100054e       sub w14, w10, #0x1 (1)
0x20d29c6d4e98   478  1ac609d0       udiv w16, w14, w6
0x20d29c6d4e9c   47c  1b06ba0e       msub w14, w16, w6, w14
0x20d29c6d4ea0   480  1b0b7dce       mul w14, w14, w11
0x20d29c6d4ea4   484  7100019f       cmp w12, #0x0 (0)
0x20d29c6d4ea8   488  9a9f17ec       cset x12, eq
0x20d29c6d4eac   48c  4b0c016c       sub w12, w11, w12
0x20d29c6d4eb0   490  1e2a08ca       fmul s10, s6, s10
0x20d29c6d4eb4   494  1e25414a       frintm s10, s10
0x20d29c6d4eb8   498  1e2a2140       fcmp s10, s10
0x20d29c6d4ebc   49c  1e2a1dea       fcsel s10, s15, s10, ne
0x20d29c6d4ec0   4a0  1e202148       fcmp s10, #0.0
0x20d29c6d4ec4   4a4  1e2fcd4a       fcsel s10, s10, s15, gt
0x20d29c6d4ec8   4a8  1e22c14b       fcvt d11, s10
0x20d29c6d4ecc   4ac  1e65c16d       frintz d13, d11
0x20d29c6d4ed0   4b0  1e7901af       fcvtzu w15, d13
0x20d29c6d4ed4   4b4  1e6301ee       ucvtf d14, w15
0x20d29c6d4ed8   4b8  1e6e21a0       fcmp d13, d14
0x20d29c6d4edc   4bc  540059c1       b.ne #+0xb38 (addr 0x20d29c6d5a14)
0x20d29c6d4ee0   4c0  6b0f019f       cmp w12, w15
0x20d29c6d4ee4   4c4  1a8f3193       csel w19, w12, w15, lo
0x20d29c6d4ee8   4c8  1e2c2140       fcmp s10, s12
0x20d29c6d4eec   4cc  1a9f326c       csel w12, w19, wzr, lo
0x20d29c6d4ef0   4d0  0b0b018c       add w12, w12, w11
0x20d29c6d4ef4   4d4  5100058f       sub w15, w12, #0x1 (1)
0x20d29c6d4ef8   4d8  1acb09f0       udiv w16, w15, w11
0x20d29c6d4efc   4dc  1b0bbe0f       msub w15, w16, w11, w15
0x20d29c6d4f00   4e0  0b0f01d3       add w19, w14, w15
0x20d29c6d4f04   4e4  9101a134       add x20, x9, #0x68 (104)
0x20d29c6d4f08   4e8  b8746834       ldr w20, [x1, x20]
0x20d29c6d4f0c   4ec  6b14027f       cmp w19, w20
0x20d29c6d4f10   4f0  54000083       b.lo #+0x10 (addr 0x20d29c6d4f20)
0x20d29c6d4f14   4f4  d2800013       movz x19, #0x0
0x20d29c6d4f18   4f8  aa1303f5       mov x21, x19
0x20d29c6d4f1c   4fc  14000014       b #+0x50 (addr 0x20d29c6d4f6c)
0x20d29c6d4f20   500  11000675       add w21, w19, #0x1 (1)
0x20d29c6d4f24   504  6b15029f       cmp w20, w21
0x20d29c6d4f28   508  54ffff69       b.ls #-0x14 (addr 0x20d29c6d4f14)
0x20d29c6d4f2c   50c  0b1509b5       add w21, w13, w21, lsl #2
0x20d29c6d4f30   510  b8756835       ldr w21, [x1, x21]
0x20d29c6d4f34   514  0b1309b3       add w19, w13, w19, lsl #2
0x20d29c6d4f38   518  b8736833       ldr w19, [x1, x19]
0x20d29c6d4f3c   51c  6b1302bf       cmp w21, w19
0x20d29c6d4f40   520  54000103       b.lo #+0x20 (addr 0x20d29c6d4f60)
0x20d29c6d4f44   524  91020137       add x23, x9, #0x80 (128)
0x20d29c6d4f48   528  b8776837       ldr w23, [x1, x23]
0x20d29c6d4f4c   52c  6b1502ff       cmp w23, w21
0x20d29c6d4f50   530  540000e2       b.hs #+0x1c (addr 0x20d29c6d4f6c)
0x20d29c6d4f54   534  d2800093       movz x19, #0x4
0x20d29c6d4f58   538  d2800015       movz x21, #0x0
0x20d29c6d4f5c   53c  14000008       b #+0x20 (addr 0x20d29c6d4f7c)
0x20d29c6d4f60   540  d2800015       movz x21, #0x0
0x20d29c6d4f64   544  d2800093       movz x19, #0x4
0x20d29c6d4f68   548  14000005       b #+0x14 (addr 0x20d29c6d4f7c)
0x20d29c6d4f6c   54c  4b1302b5       sub w21, w21, w19
0x20d29c6d4f70   550  9101f137       add x23, x9, #0x7c (124)
0x20d29c6d4f74   554  b8776837       ldr w23, [x1, x23]
0x20d29c6d4f78   558  0b130af3       add w19, w23, w19, lsl #2
0x20d29c6d4f7c   55c  1acb0990       udiv w16, w12, w11
0x20d29c6d4f80   560  1b0bb217       msub w23, w16, w11, w12
0x20d29c6d4f84   564  0b0e02e2       add w2, w23, w14
0x20d29c6d4f88   568  6b14005f       cmp w2, w20
0x20d29c6d4f8c   56c  54000083       b.lo #+0x10 (addr 0x20d29c6d4f9c)
0x20d29c6d4f90   570  d2800002       movz x2, #0x0
0x20d29c6d4f94   574  aa0203e7       mov x7, x2
0x20d29c6d4f98   578  14000017       b #+0x5c (addr 0x20d29c6d4ff4)
0x20d29c6d4f9c   57c  11000447       add w7, w2, #0x1 (1)
0x20d29c6d4fa0   580  6b07029f       cmp w20, w7
0x20d29c6d4fa4   584  54ffff69       b.ls #-0x14 (addr 0x20d29c6d4f90)
0x20d29c6d4fa8   588  0b0709a7       add w7, w13, w7, lsl #2
0x20d29c6d4fac   58c  b8676827       ldr w7, [x1, x7]
0x20d29c6d4fb0   590  0b0209a2       add w2, w13, w2, lsl #2
0x20d29c6d4fb4   594  b8626822       ldr w2, [x1, x2]
0x20d29c6d4fb8   598  6b0200ff       cmp w7, w2
0x20d29c6d4fbc   59c  54000163       b.lo #+0x2c (addr 0x20d29c6d4fe8)
0x20d29c6d4fc0   5a0  91020120       add x0, x9, #0x80 (128)
0x20d29c6d4fc4   5a4  b8606820       ldr w0, [x1, x0]
0x20d29c6d4fc8   5a8  6b07001f       cmp w0, w7
0x20d29c6d4fcc   5ac  54000063       b.lo #+0xc (addr 0x20d29c6d4fd8)
0x20d29c6d4fd0   5b0  f94013e0       ldr x0, [sp, #32]
0x20d29c6d4fd4   5b4  14000008       b #+0x20 (addr 0x20d29c6d4ff4)
0x20d29c6d4fd8   5b8  f94013e0       ldr x0, [sp, #32]
0x20d29c6d4fdc   5bc  d2800007       movz x7, #0x0
0x20d29c6d4fe0   5c0  d2800082       movz x2, #0x4
0x20d29c6d4fe4   5c4  14000009       b #+0x24 (addr 0x20d29c6d5008)
0x20d29c6d4fe8   5c8  d2800007       movz x7, #0x0
0x20d29c6d4fec   5cc  d2800082       movz x2, #0x4
0x20d29c6d4ff0   5d0  14000006       b #+0x18 (addr 0x20d29c6d5008)
0x20d29c6d4ff4   5d4  4b0200e7       sub w7, w7, w2
0x20d29c6d4ff8   5d8  9101f125       add x5, x9, #0x7c (124)
0x20d29c6d4ffc   5dc  b8656825       ldr w5, [x1, x5]
0x20d29c6d5000   5e0  0b0208a2       add w2, w5, w2, lsl #2
0x20d29c6d5004   5e4  f9400fe5       ldr x5, [sp, #24]
0x20d29c6d5008   5e8  1100058c       add w12, w12, #0x1 (1)
0x20d29c6d500c   5ec  1acb0990       udiv w16, w12, w11
0x20d29c6d5010   5f0  1b0bb20c       msub w12, w16, w11, w12
0x20d29c6d5014   5f4  0b0e018e       add w14, w12, w14
0x20d29c6d5018   5f8  6b1401df       cmp w14, w20
0x20d29c6d501c   5fc  54000083       b.lo #+0x10 (addr 0x20d29c6d502c)
0x20d29c6d5020   600  d2800004       movz x4, #0x0
0x20d29c6d5024   604  aa0403ee       mov x14, x4
0x20d29c6d5028   608  14000017       b #+0x5c (addr 0x20d29c6d5084)
0x20d29c6d502c   60c  110005c4       add w4, w14, #0x1 (1)
0x20d29c6d5030   610  6b04029f       cmp w20, w4
0x20d29c6d5034   614  54ffff69       b.ls #-0x14 (addr 0x20d29c6d5020)
0x20d29c6d5038   618  0b0409a4       add w4, w13, w4, lsl #2
0x20d29c6d503c   61c  b8646824       ldr w4, [x1, x4]
0x20d29c6d5040   620  0b0e09ae       add w14, w13, w14, lsl #2
0x20d29c6d5044   624  b86e682e       ldr w14, [x1, x14]
0x20d29c6d5048   628  6b0e009f       cmp w4, w14
0x20d29c6d504c   62c  54000163       b.lo #+0x2c (addr 0x20d29c6d5078)
0x20d29c6d5050   630  91020123       add x3, x9, #0x80 (128)
0x20d29c6d5054   634  b8636823       ldr w3, [x1, x3]
0x20d29c6d5058   638  6b04007f       cmp w3, w4
0x20d29c6d505c   63c  54000063       b.lo #+0xc (addr 0x20d29c6d5068)
0x20d29c6d5060   640  f94007e3       ldr x3, [sp, #8]
0x20d29c6d5064   644  14000008       b #+0x20 (addr 0x20d29c6d5084)
0x20d29c6d5068   648  d280008e       movz x14, #0x4
0x20d29c6d506c   64c  d2800004       movz x4, #0x0
0x20d29c6d5070   650  f94007e3       ldr x3, [sp, #8]
0x20d29c6d5074   654  14000008       b #+0x20 (addr 0x20d29c6d5094)
0x20d29c6d5078   658  d2800004       movz x4, #0x0
0x20d29c6d507c   65c  d280008e       movz x14, #0x4
0x20d29c6d5080   660  14000005       b #+0x14 (addr 0x20d29c6d5094)
0x20d29c6d5084   664  4b0e0084       sub w4, w4, w14
0x20d29c6d5088   668  9101f136       add x22, x9, #0x7c (124)
0x20d29c6d508c   66c  b8766836       ldr w22, [x1, x22]
0x20d29c6d5090   670  0b0e0ace       add w14, w22, w14, lsl #2
0x20d29c6d5094   674  1ac60950       udiv w16, w10, w6
0x20d29c6d5098   678  1b06aa16       msub w22, w16, w6, w10
0x20d29c6d509c   67c  1b0b7ed6       mul w22, w22, w11
0x20d29c6d50a0   680  0b0f02c0       add w0, w22, w15
0x20d29c6d50a4   684  6b14001f       cmp w0, w20
0x20d29c6d50a8   688  54000083       b.lo #+0x10 (addr 0x20d29c6d50b8)
0x20d29c6d50ac   68c  d2800000       movz x0, #0x0
0x20d29c6d50b0   690  aa0003e3       mov x3, x0
0x20d29c6d50b4   694  14000014       b #+0x50 (addr 0x20d29c6d5104)
0x20d29c6d50b8   698  11000403       add w3, w0, #0x1 (1)
0x20d29c6d50bc   69c  6b03029f       cmp w20, w3
0x20d29c6d50c0   6a0  54ffff69       b.ls #-0x14 (addr 0x20d29c6d50ac)
0x20d29c6d50c4   6a4  0b0309a3       add w3, w13, w3, lsl #2
0x20d29c6d50c8   6a8  b8636823       ldr w3, [x1, x3]
0x20d29c6d50cc   6ac  0b0009a0       add w0, w13, w0, lsl #2
0x20d29c6d50d0   6b0  b8606820       ldr w0, [x1, x0]
0x20d29c6d50d4   6b4  6b00007f       cmp w3, w0
0x20d29c6d50d8   6b8  54000103       b.lo #+0x20 (addr 0x20d29c6d50f8)
0x20d29c6d50dc   6bc  91020125       add x5, x9, #0x80 (128)
0x20d29c6d50e0   6c0  b8656825       ldr w5, [x1, x5]
0x20d29c6d50e4   6c4  6b0300bf       cmp w5, w3
0x20d29c6d50e8   6c8  540000e2       b.hs #+0x1c (addr 0x20d29c6d5104)
0x20d29c6d50ec   6cc  d2800080       movz x0, #0x4
0x20d29c6d50f0   6d0  d2800003       movz x3, #0x0
0x20d29c6d50f4   6d4  14000008       b #+0x20 (addr 0x20d29c6d5114)
0x20d29c6d50f8   6d8  d2800003       movz x3, #0x0
0x20d29c6d50fc   6dc  d2800080       movz x0, #0x4
0x20d29c6d5100   6e0  14000005       b #+0x14 (addr 0x20d29c6d5114)
0x20d29c6d5104   6e4  4b000063       sub w3, w3, w0
0x20d29c6d5108   6e8  9101f125       add x5, x9, #0x7c (124)
0x20d29c6d510c   6ec  b8656825       ldr w5, [x1, x5]
0x20d29c6d5110   6f0  0b0008a0       add w0, w5, w0, lsl #2
0x20d29c6d5114   6f4  0b1702c5       add w5, w22, w23
0x20d29c6d5118   6f8  6b1400bf       cmp w5, w20
0x20d29c6d511c   6fc  54000083       b.lo #+0x10 (addr 0x20d29c6d512c)
0x20d29c6d5120   700  d2800005       movz x5, #0x0
0x20d29c6d5124   704  aa0503fb       mov cp, x5
0x20d29c6d5128   708  14000014       b #+0x50 (addr 0x20d29c6d5178)
0x20d29c6d512c   70c  110004bb       add w27, w5, #0x1 (1)
0x20d29c6d5130   710  6b1b029f       cmp w20, w27
0x20d29c6d5134   714  54ffff69       b.ls #-0x14 (addr 0x20d29c6d5120)
0x20d29c6d5138   718  0b1b09bb       add w27, w13, w27, lsl #2
0x20d29c6d513c   71c  b87b683b       ldr w27, [x1, x27]
0x20d29c6d5140   720  0b0509a5       add w5, w13, w5, lsl #2
0x20d29c6d5144   724  b8656825       ldr w5, [x1, x5]
0x20d29c6d5148   728  6b05037f       cmp w27, w5
0x20d29c6d514c   72c  54000103       b.lo #+0x20 (addr 0x20d29c6d516c)
0x20d29c6d5150   730  9102013c       add x28, x9, #0x80 (128)
0x20d29c6d5154   734  b87c683c       ldr w28, [x1, x28]
0x20d29c6d5158   738  6b1b039f       cmp w28, w27
0x20d29c6d515c   73c  540000e2       b.hs #+0x1c (addr 0x20d29c6d5178)
0x20d29c6d5160   740  d280009b       movz cp, #0x4
0x20d29c6d5164   744  d280001c       movz x28, #0x0
0x20d29c6d5168   748  1400000b       b #+0x2c (addr 0x20d29c6d5194)
0x20d29c6d516c   74c  d280001c       movz x28, #0x0
0x20d29c6d5170   750  d280009b       movz cp, #0x4
0x20d29c6d5174   754  14000008       b #+0x20 (addr 0x20d29c6d5194)
0x20d29c6d5178   758  4b05037b       sub w27, w27, w5
0x20d29c6d517c   75c  9101f13c       add x28, x9, #0x7c (124)
0x20d29c6d5180   760  b87c683c       ldr w28, [x1, x28]
0x20d29c6d5184   764  0b050b9c       add w28, w28, w5, lsl #2
0x20d29c6d5188   768  aa1b03f0       mov x16, cp
0x20d29c6d518c   76c  aa1c03fb       mov cp, x28
0x20d29c6d5190   770  aa1003fc       mov x28, x16
0x20d29c6d5194   774  0b0c02d6       add w22, w22, w12
0x20d29c6d5198   778  6b1402df       cmp w22, w20
0x20d29c6d519c   77c  54000083       b.lo #+0x10 (addr 0x20d29c6d51ac)
0x20d29c6d51a0   780  d2800005       movz x5, #0x0
0x20d29c6d51a4   784  aa0503f6       mov x22, x5
0x20d29c6d51a8   788  14000014       b #+0x50 (addr 0x20d29c6d51f8)
0x20d29c6d51ac   78c  110006c5       add w5, w22, #0x1 (1)
0x20d29c6d51b0   790  6b05029f       cmp w20, w5
0x20d29c6d51b4   794  54ffff69       b.ls #-0x14 (addr 0x20d29c6d51a0)
0x20d29c6d51b8   798  0b0509a5       add w5, w13, w5, lsl #2
0x20d29c6d51bc   79c  b8656825       ldr w5, [x1, x5]
0x20d29c6d51c0   7a0  0b1609b6       add w22, w13, w22, lsl #2
0x20d29c6d51c4   7a4  b8766836       ldr w22, [x1, x22]
0x20d29c6d51c8   7a8  6b1600bf       cmp w5, w22
0x20d29c6d51cc   7ac  54000103       b.lo #+0x20 (addr 0x20d29c6d51ec)
0x20d29c6d51d0   7b0  91020138       add x24, x9, #0x80 (128)
0x20d29c6d51d4   7b4  b8786838       ldr w24, [x1, x24]
0x20d29c6d51d8   7b8  6b05031f       cmp w24, w5
0x20d29c6d51dc   7bc  540000e2       b.hs #+0x1c (addr 0x20d29c6d51f8)
0x20d29c6d51e0   7c0  d2800096       movz x22, #0x4
0x20d29c6d51e4   7c4  d2800005       movz x5, #0x0
0x20d29c6d51e8   7c8  14000008       b #+0x20 (addr 0x20d29c6d5208)
0x20d29c6d51ec   7cc  d2800005       movz x5, #0x0
0x20d29c6d51f0   7d0  d2800096       movz x22, #0x4
0x20d29c6d51f4   7d4  14000005       b #+0x14 (addr 0x20d29c6d5208)
0x20d29c6d51f8   7d8  4b1600a5       sub w5, w5, w22
0x20d29c6d51fc   7dc  9101f138       add x24, x9, #0x7c (124)
0x20d29c6d5200   7e0  b8786838       ldr w24, [x1, x24]
0x20d29c6d5204   7e4  0b160b16       add w22, w24, w22, lsl #2
0x20d29c6d5208   7e8  1100054a       add w10, w10, #0x1 (1)
0x20d29c6d520c   7ec  1ac60950       udiv w16, w10, w6
0x20d29c6d5210   7f0  1b06aa06       msub w6, w16, w6, w10
0x20d29c6d5214   7f4  1b0b7cc6       mul w6, w6, w11
0x20d29c6d5218   7f8  0b0f00ca       add w10, w6, w15
0x20d29c6d521c   7fc  6b14015f       cmp w10, w20
0x20d29c6d5220   800  54000083       b.lo #+0x10 (addr 0x20d29c6d5230)
0x20d29c6d5224   804  d280000a       movz x10, #0x0
0x20d29c6d5228   808  aa0a03eb       mov x11, x10
0x20d29c6d522c   80c  14000014       b #+0x50 (addr 0x20d29c6d527c)
0x20d29c6d5230   810  1100054b       add w11, w10, #0x1 (1)
0x20d29c6d5234   814  6b0b029f       cmp w20, w11
0x20d29c6d5238   818  54ffff69       b.ls #-0x14 (addr 0x20d29c6d5224)
0x20d29c6d523c   81c  0b0b09ab       add w11, w13, w11, lsl #2
0x20d29c6d5240   820  b86b682b       ldr w11, [x1, x11]
0x20d29c6d5244   824  0b0a09aa       add w10, w13, w10, lsl #2
0x20d29c6d5248   828  b86a682a       ldr w10, [x1, x10]
0x20d29c6d524c   82c  6b0a017f       cmp w11, w10
0x20d29c6d5250   830  54000103       b.lo #+0x20 (addr 0x20d29c6d5270)
0x20d29c6d5254   834  9102012f       add x15, x9, #0x80 (128)
0x20d29c6d5258   838  b86f682f       ldr w15, [x1, x15]
0x20d29c6d525c   83c  6b0b01ff       cmp w15, w11
0x20d29c6d5260   840  540000e2       b.hs #+0x1c (addr 0x20d29c6d527c)
0x20d29c6d5264   844  d280008a       movz x10, #0x4
0x20d29c6d5268   848  d280000b       movz x11, #0x0
0x20d29c6d526c   84c  14000008       b #+0x20 (addr 0x20d29c6d528c)
0x20d29c6d5270   850  d280000b       movz x11, #0x0
0x20d29c6d5274   854  d280008a       movz x10, #0x4
0x20d29c6d5278   858  14000005       b #+0x14 (addr 0x20d29c6d528c)
0x20d29c6d527c   85c  4b0a016b       sub w11, w11, w10
0x20d29c6d5280   860  9101f12f       add x15, x9, #0x7c (124)
0x20d29c6d5284   864  b86f682f       ldr w15, [x1, x15]
0x20d29c6d5288   868  0b0a09ea       add w10, w15, w10, lsl #2
0x20d29c6d528c   86c  0b1700cf       add w15, w6, w23
0x20d29c6d5290   870  6b1401ff       cmp w15, w20
0x20d29c6d5294   874  54000083       b.lo #+0x10 (addr 0x20d29c6d52a4)
0x20d29c6d5298   878  d280000f       movz x15, #0x0
0x20d29c6d529c   87c  aa0f03f7       mov x23, x15
0x20d29c6d52a0   880  14000014       b #+0x50 (addr 0x20d29c6d52f0)
0x20d29c6d52a4   884  110005f7       add w23, w15, #0x1 (1)
0x20d29c6d52a8   888  6b17029f       cmp w20, w23
0x20d29c6d52ac   88c  54ffff69       b.ls #-0x14 (addr 0x20d29c6d5298)
0x20d29c6d52b0   890  0b1709b7       add w23, w13, w23, lsl #2
0x20d29c6d52b4   894  b8776837       ldr w23, [x1, x23]
0x20d29c6d52b8   898  0b0f09af       add w15, w13, w15, lsl #2
0x20d29c6d52bc   89c  b86f682f       ldr w15, [x1, x15]
0x20d29c6d52c0   8a0  6b0f02ff       cmp w23, w15
0x20d29c6d52c4   8a4  54000103       b.lo #+0x20 (addr 0x20d29c6d52e4)
0x20d29c6d52c8   8a8  91020138       add x24, x9, #0x80 (128)
0x20d29c6d52cc   8ac  b8786838       ldr w24, [x1, x24]
0x20d29c6d52d0   8b0  6b17031f       cmp w24, w23
0x20d29c6d52d4   8b4  540000e2       b.hs #+0x1c (addr 0x20d29c6d52f0)
0x20d29c6d52d8   8b8  d280008f       movz x15, #0x4
0x20d29c6d52dc   8bc  d2800017       movz x23, #0x0
0x20d29c6d52e0   8c0  14000008       b #+0x20 (addr 0x20d29c6d5300)
0x20d29c6d52e4   8c4  d2800017       movz x23, #0x0
0x20d29c6d52e8   8c8  d280008f       movz x15, #0x4
0x20d29c6d52ec   8cc  14000005       b #+0x14 (addr 0x20d29c6d5300)
0x20d29c6d52f0   8d0  4b0f02f7       sub w23, w23, w15
0x20d29c6d52f4   8d4  9101f138       add x24, x9, #0x7c (124)
0x20d29c6d52f8   8d8  b8786838       ldr w24, [x1, x24]
0x20d29c6d52fc   8dc  0b0f0b0f       add w15, w24, w15, lsl #2
0x20d29c6d5300   8e0  0b0c00c6       add w6, w6, w12
0x20d29c6d5304   8e4  6b1400df       cmp w6, w20
0x20d29c6d5308   8e8  54000083       b.lo #+0x10 (addr 0x20d29c6d5318)
0x20d29c6d530c   8ec  d2800006       movz x6, #0x0
0x20d29c6d5310   8f0  aa0603ec       mov x12, x6
0x20d29c6d5314   8f4  14000014       b #+0x50 (addr 0x20d29c6d5364)
0x20d29c6d5318   8f8  110004cc       add w12, w6, #0x1 (1)
0x20d29c6d531c   8fc  6b0c029f       cmp w20, w12
0x20d29c6d5320   900  54ffff69       b.ls #-0x14 (addr 0x20d29c6d530c)
0x20d29c6d5324   904  0b0c09ac       add w12, w13, w12, lsl #2
0x20d29c6d5328   908  b86c682c       ldr w12, [x1, x12]
0x20d29c6d532c   90c  0b0609a6       add w6, w13, w6, lsl #2
0x20d29c6d5330   910  b8666826       ldr w6, [x1, x6]
0x20d29c6d5334   914  6b06019f       cmp w12, w6
0x20d29c6d5338   918  54000103       b.lo #+0x20 (addr 0x20d29c6d5358)
0x20d29c6d533c   91c  9102012d       add x13, x9, #0x80 (128)
0x20d29c6d5340   920  b86d682d       ldr w13, [x1, x13]
0x20d29c6d5344   924  6b0c01bf       cmp w13, w12
0x20d29c6d5348   928  540000e2       b.hs #+0x1c (addr 0x20d29c6d5364)
0x20d29c6d534c   92c  d2800086       movz x6, #0x4
0x20d29c6d5350   930  d280000c       movz x12, #0x0
0x20d29c6d5354   934  14000008       b #+0x20 (addr 0x20d29c6d5374)
0x20d29c6d5358   938  d280000c       movz x12, #0x0
0x20d29c6d535c   93c  d2800086       movz x6, #0x4
0x20d29c6d5360   940  14000005       b #+0x14 (addr 0x20d29c6d5374)
0x20d29c6d5364   944  4b06018c       sub w12, w12, w6
0x20d29c6d5368   948  9101f12d       add x13, x9, #0x7c (124)
0x20d29c6d536c   94c  b86d682d       ldr w13, [x1, x13]
0x20d29c6d5370   950  0b0609a6       add w6, w13, w6, lsl #2
0x20d29c6d5374   954  9101310d       add x13, x8, #0x4c (76)
0x20d29c6d5378   958  b82d682c       str w12, [x1, x13]
0x20d29c6d537c   95c  9101210c       add x12, x8, #0x48 (72)
0x20d29c6d5380   960  b82c6826       str w6, [x1, x12]
0x20d29c6d5384   964  91011106       add x6, x8, #0x44 (68)
0x20d29c6d5388   968  b8266837       str w23, [x1, x6]
0x20d29c6d538c   96c  91010106       add x6, x8, #0x40 (64)
0x20d29c6d5390   970  b826682f       str w15, [x1, x6]
0x20d29c6d5394   974  9100f106       add x6, x8, #0x3c (60)
0x20d29c6d5398   978  b826682b       str w11, [x1, x6]
0x20d29c6d539c   97c  9100e106       add x6, x8, #0x38 (56)
0x20d29c6d53a0   980  b826682a       str w10, [x1, x6]
0x20d29c6d53a4   984  9100d106       add x6, x8, #0x34 (52)
0x20d29c6d53a8   988  b8266825       str w5, [x1, x6]
0x20d29c6d53ac   98c  9100c106       add x6, x8, #0x30 (48)
0x20d29c6d53b0   990  b8266836       str w22, [x1, x6]
0x20d29c6d53b4   994  9100b106       add x6, x8, #0x2c (44)
0x20d29c6d53b8   998  b826683c       str w28, [x1, x6]
0x20d29c6d53bc   99c  9100a106       add x6, x8, #0x28 (40)
0x20d29c6d53c0   9a0  b826683b       str w27, [x1, x6]
0x20d29c6d53c4   9a4  91009106       add x6, x8, #0x24 (36)
0x20d29c6d53c8   9a8  b8266823       str w3, [x1, x6]
0x20d29c6d53cc   9ac  91008106       add x6, x8, #0x20 (32)
0x20d29c6d53d0   9b0  b8266820       str w0, [x1, x6]
0x20d29c6d53d4   9b4  91007106       add x6, x8, #0x1c (28)
0x20d29c6d53d8   9b8  b8266824       str w4, [x1, x6]
0x20d29c6d53dc   9bc  91006106       add x6, x8, #0x18 (24)
0x20d29c6d53e0   9c0  b826682e       str w14, [x1, x6]
0x20d29c6d53e4   9c4  91005106       add x6, x8, #0x14 (20)
0x20d29c6d53e8   9c8  b8266827       str w7, [x1, x6]
0x20d29c6d53ec   9cc  91004106       add x6, x8, #0x10 (16)
0x20d29c6d53f0   9d0  b8266822       str w2, [x1, x6]
0x20d29c6d53f4   9d4  91003106       add x6, x8, #0xc (12)
0x20d29c6d53f8   9d8  b8266835       str w21, [x1, x6]
0x20d29c6d53fc   9dc  91002106       add x6, x8, #0x8 (8)
0x20d29c6d5400   9e0  b8266833       str w19, [x1, x6]
0x20d29c6d5404   9e4  d2c00126       movz x6, #0x900000000
0x20d29c6d5408   9e8  f8286826       str x6, [x1, x8]
0x20d29c6d540c   9ec  f9403be6       ldr x6, [sp, #112]
0x20d29c6d5410   9f0  6b1900df       cmp w6, w25
0x20d29c6d5414   9f4  1a9930ca       csel w10, w6, w25, lo
0x20d29c6d5418   9f8  f9406fe6       ldr x6, [sp, #216]
0x20d29c6d541c   9fc  f9406beb       ldr x11, [sp, #208]
0x20d29c6d5420   a00  6b0b00df       cmp w6, w11
0x20d29c6d5424   a04  1a8b30cc       csel w12, w6, w11, lo
0x20d29c6d5428   a08  6b0c015f       cmp w10, w12
0x20d29c6d542c   a0c  1a8c3146       csel w6, w10, w12, lo
0x20d29c6d5430   a10  2f00e40a       movi d10, #0x0
0x20d29c6d5434   a14  f94003f6       ldr x22, [sp]
0x20d29c6d5438   a18  d280000a       movz x10, #0x0
0x20d29c6d543c   a1c  f94013ee       ldr x14, [sp, #32]
0x20d29c6d5440   a20  f9400fed       ldr x13, [sp, #24]
0x20d29c6d5444   a24  f9400bec       ldr x12, [sp, #16]
0x20d29c6d5448   a28  f94007eb       ldr x11, [sp, #8]
0x20d29c6d544c   a2c  4eaa1d4b       mov v11.16b, v10.16b
0x20d29c6d5450   a30  f852034f       ldur x15, [x26, #-224]
0x20d29c6d5454   a34  eb2f63ff       cmp sp, x15
0x20d29c6d5458   a38  54002ee9       b.ls #+0x5dc (addr 0x20d29c6d5a34)
0x20d29c6d545c   a3c  0b0a0ecf       add w15, w22, w10, lsl #3
0x20d29c6d5460   a40  910011f3       add x19, x15, #0x4 (4)
0x20d29c6d5464   a44  b8736833       ldr w19, [x1, x19]
0x20d29c6d5468   a48  34000933       cbz w19, #+0x124 (addr 0x20d29c6d558c)
0x20d29c6d546c   a4c  b86f682f       ldr w15, [x1, x15]
0x20d29c6d5470   a50  0b1309f3       add w19, w15, w19, lsl #2
0x20d29c6d5474   a54  f8520354       ldur x20, [x26, #-224]
0x20d29c6d5478   a58  eb3463ff       cmp sp, x20
0x20d29c6d547c   a5c  54003109       b.ls #+0x620 (addr 0x20d29c6d5a9c)
0x20d29c6d5480   a60  110011f4       add w20, w15, #0x4 (4)
0x20d29c6d5484   a64  b86f682f       ldr w15, [x1, x15]
0x20d29c6d5488   a68  6b0f00df       cmp w6, w15
0x20d29c6d548c   a6c  54000328       b.hi #+0x64 (addr 0x20d29c6d54f0)
0x20d29c6d5490   a70  6b13029f       cmp w20, w19
0x20d29c6d5494   a74  540007c0       b.eq #+0xf8 (addr 0x20d29c6d558c)
0x20d29c6d5498   a78  1100128f       add w15, w20, #0x4 (4)
0x20d29c6d549c   a7c  b8746834       ldr w20, [x1, x20]
0x20d29c6d54a0   a80  6b1400df       cmp w6, w20
0x20d29c6d54a4   a84  540002c8       b.hi #+0x58 (addr 0x20d29c6d54fc)
0x20d29c6d54a8   a88  6b1301ff       cmp w15, w19
0x20d29c6d54ac   a8c  54000700       b.eq #+0xe0 (addr 0x20d29c6d558c)
0x20d29c6d54b0   a90  110011f4       add w20, w15, #0x4 (4)
0x20d29c6d54b4   a94  b86f682f       ldr w15, [x1, x15]
0x20d29c6d54b8   a98  6b0f00df       cmp w6, w15
0x20d29c6d54bc   a9c  540001a8       b.hi #+0x34 (addr 0x20d29c6d54f0)
0x20d29c6d54c0   aa0  6b13029f       cmp w20, w19
0x20d29c6d54c4   aa4  54000640       b.eq #+0xc8 (addr 0x20d29c6d558c)
0x20d29c6d54c8   aa8  f852034f       ldur x15, [x26, #-224]
0x20d29c6d54cc   aac  eb2f63ff       cmp sp, x15
0x20d29c6d54d0   ab0  54003229       b.ls #+0x644 (addr 0x20d29c6d5b14)
0x20d29c6d54d4   ab4  1100128f       add w15, w20, #0x4 (4)
0x20d29c6d54d8   ab8  b8746834       ldr w20, [x1, x20]
0x20d29c6d54dc   abc  6b1400df       cmp w6, w20
0x20d29c6d54e0   ac0  540000e8       b.hi #+0x1c (addr 0x20d29c6d54fc)
0x20d29c6d54e4   ac4  6b1301ff       cmp w15, w19
0x20d29c6d54e8   ac8  54000520       b.eq #+0xa4 (addr 0x20d29c6d558c)
0x20d29c6d54ec   acc  17ffffe5       b #-0x6c (addr 0x20d29c6d5480)
0x20d29c6d54f0   ad0  aa1403f0       mov x16, x20
0x20d29c6d54f4   ad4  aa0f03f4       mov x20, x15
0x20d29c6d54f8   ad8  aa1003ef       mov x15, x16
0x20d29c6d54fc   adc  531e7694       lsl w20, w20, #2
0x20d29c6d5500   ae0  0b140175       add w21, w11, w20
0x20d29c6d5504   ae4  0b140197       add w23, w12, w20
0x20d29c6d5508   ae8  0b1401b8       add w24, w13, w20
0x20d29c6d550c   aec  bc78682c       ldr s12, [x1, x24]
0x20d29c6d5510   af0  0b1401d4       add w20, w14, w20
0x20d29c6d5514   af4  bc74682d       ldr s13, [x1, x20]
0x20d29c6d5518   af8  1e2d38cd       fsub s13, s6, s13
0x20d29c6d551c   afc  1e2d2080       fcmp s4, s13
0x20d29c6d5520   b00  540000a3       b.lo #+0x14 (addr 0x20d29c6d5534)
0x20d29c6d5524   b04  1e2321a0       fcmp s13, s3
0x20d29c6d5528   b08  54000082       b.hs #+0x10 (addr 0x20d29c6d5538)
0x20d29c6d552c   b0c  1e2d284d       fadd s13, s2, s13
0x20d29c6d5530   b10  14000002       b #+0x8 (addr 0x20d29c6d5538)
0x20d29c6d5534   b14  1e2239ad       fsub s13, s13, s2
0x20d29c6d5538   b18  bc75682e       ldr s14, [x1, x21]
0x20d29c6d553c   b1c  bc776830       ldr s16, [x1, x23]
0x20d29c6d5540   b20  1e2c392c       fsub s12, s9, s12
0x20d29c6d5544   b24  1e2c2080       fcmp s4, s12
0x20d29c6d5548   b28  540000a3       b.lo #+0x14 (addr 0x20d29c6d555c)
0x20d29c6d554c   b2c  1e232180       fcmp s12, s3
0x20d29c6d5550   b30  54000082       b.hs #+0x10 (addr 0x20d29c6d5560)
0x20d29c6d5554   b34  1e2c284c       fadd s12, s2, s12
0x20d29c6d5558   b38  14000002       b #+0x8 (addr 0x20d29c6d5560)
0x20d29c6d555c   b3c  1e22398c       fsub s12, s12, s2
0x20d29c6d5560   b40  1e302970       fadd s16, s11, s16
0x20d29c6d5564   b44  1e2d09ad       fmul s13, s13, s13
0x20d29c6d5568   b48  1e2c098c       fmul s12, s12, s12
0x20d29c6d556c   b4c  1e2c29ac       fadd s12, s13, s12
0x20d29c6d5570   b50  1e212180       fcmp s12, s1
0x20d29c6d5574   b54  1e2b3e0b       fcsel s11, s16, s11, lo
0x20d29c6d5578   b58  1e2e294d       fadd s13, s10, s14
0x20d29c6d557c   b5c  1e212180       fcmp s12, s1
0x20d29c6d5580   b60  1e2a3daa       fcsel s10, s13, s10, lo
0x20d29c6d5584   b64  6b1301ff       cmp w15, w19
0x20d29c6d5588   b68  54fff761       b.ne #-0x114 (addr 0x20d29c6d5474)
0x20d29c6d558c   b6c  1100054a       add w10, w10, #0x1 (1)
0x20d29c6d5590   b70  7100255f       cmp w10, #0x9 (9)
0x20d29c6d5594   b74  54fff5e1       b.ne #-0x144 (addr 0x20d29c6d5450)
0x20d29c6d5598   b78  f94027eb       ldr x11, [sp, #72]
0x20d29c6d559c   b7c  f94033ec       ldr x12, [sp, #96]
0x20d29c6d55a0   b80  f94077ed       ldr x13, [sp, #232]
0x20d29c6d55a4   b84  f94063e2       ldr x2, [sp, #192]
0x20d29c6d55a8   b88  1e2b096c       fmul s12, s11, s11
0x20d29c6d55ac   b8c  1e2a094d       fmul s13, s10, s10
0x20d29c6d55b0   b90  1e2d298c       fadd s12, s12, s13
0x20d29c6d55b4   b94  1e202188       fcmp s12, #0.0
0x20d29c6d55b8   b98  5400010c       b.gt #+0x20 (addr 0x20d29c6d55d8)
0x20d29c6d55bc   b9c  91028126       add x6, x9, #0xa0 (160)
0x20d29c6d55c0   ba0  f866682a       ldr x10, [x1, x6]
0x20d29c6d55c4   ba4  9100054a       add x10, x10, #0x1 (1)
0x20d29c6d55c8   ba8  f826682a       str x10, [x1, x6]
0x20d29c6d55cc   bac  4ea81d0b       mov v11.16b, v8.16b
0x20d29c6d55d0   bb0  4ea71cea       mov v10.16b, v7.16b
0x20d29c6d55d4   bb4  14000004       b #+0x10 (addr 0x20d29c6d55e4)
0x20d29c6d55d8   bb8  1e21c18c       fsqrt s12, s12
0x20d29c6d55dc   bbc  1e2c194a       fdiv s10, s10, s12
0x20d29c6d55e0   bc0  1e2c196b       fdiv s11, s11, s12
0x20d29c6d55e4   bc4  91024126       add x6, x9, #0x90 (144)
0x20d29c6d55e8   bc8  f866682a       ldr x10, [x1, x6]
0x20d29c6d55ec   bcc  d28f82ae       movz x14, #0x7c15
0x20d29c6d55f0   bd0  f2afe94e       movk x14, #0x7f4a, lsl #16
0x20d29c6d55f4   bd4  f2cf372e       movk x14, #0x79b9, lsl #32
0x20d29c6d55f8   bd8  f2f3c6ee       movk x14, #0x9e37, lsl #48
0x20d29c6d55fc   bdc  8b0e014a       add x10, x10, x14
0x20d29c6d5600   be0  f826682a       str x10, [x1, x6]
0x20d29c6d5604   be4  ca4a7946       eor x6, x10, x10, lsr #30
0x20d29c6d5608   be8  d29cb72a       movz x10, #0xe5b9
0x20d29c6d560c   bec  f2a39c8a       movk x10, #0x1ce4, lsl #16
0x20d29c6d5610   bf0  f2c8edaa       movk x10, #0x476d, lsl #32
0x20d29c6d5614   bf4  f2f7eb0a       movk x10, #0xbf58, lsl #48
0x20d29c6d5618   bf8  9b0a7cc6       mul x6, x6, x10
0x20d29c6d561c   bfc  ca466cc6       eor x6, x6, x6, lsr #27
0x20d29c6d5620   c00  d2823d6a       movz x10, #0x11eb
0x20d29c6d5624   c04  f2a2662a       movk x10, #0x1331, lsl #16
0x20d29c6d5628   c08  f2c9376a       movk x10, #0x49bb, lsl #32
0x20d29c6d562c   c0c  f2f29a0a       movk x10, #0x94d0, lsl #48
0x20d29c6d5630   c10  9b0a7cc6       mul x6, x6, x10
0x20d29c6d5634   c14  d36bfcca       lsr x10, x6, #43
0x20d29c6d5638   c18  ca463146       eor x6, x10, x6, lsr #12
0x20d29c6d563c   c1c  b24c24c6       orr x6, x6, #0x3ff0000000000000
0x20d29c6d5640   c20  9e6700cc       fmov d12, x6
0x20d29c6d5644   c24  1e7e100d       fmov d13, #0xf0 (-1.0000)
0x20d29c6d5648   c28  1e6d298c       fadd d12, d12, d13
0x20d29c6d564c   c2c  1e7c100d       fmov d13, #0xe0 (-0.5000)
0x20d29c6d5650   c30  1e6d298c       fadd d12, d12, d13
0x20d29c6d5654   c34  9102d126       add x6, x9, #0xb4 (180)
0x20d29c6d5658   c38  bc66682d       ldr s13, [x1, x6]
0x20d29c6d565c   c3c  1e22c1ad       fcvt d13, s13
0x20d29c6d5660   c40  1e6d098c       fmul d12, d12, d13
0x20d29c6d5664   c44  1e624180       fcvt s0, d12
0x20d29c6d5668   c48  fd006fea       str d10, [sp, #216]
0x20d29c6d566c   c4c  fd006beb       str d11, [sp, #208]
0x20d29c6d5670   c50  fd003be0       str d0, [sp, #112]
0x20d29c6d5674   c54  f9408be7       ldr x7, [sp, #272]
0x20d29c6d5678   c58  97fabe21       bl #-0x15077c (addr 0x20d29c584efc)
0x20d29c6d567c   c5c  fd0037e0       str d0, [sp, #104]
0x20d29c6d5680   c60  fd403be0       ldr d0, [sp, #112]
0x20d29c6d5684   c64  f9408be7       ldr x7, [sp, #272]
0x20d29c6d5688   c68  97fabe1e       bl #-0x150788 (addr 0x20d29c584f00)
0x20d29c6d568c   c6c  f9407be1       ldr x1, [sp, #240]
0x20d29c6d5690   c70  9102c026       add x6, x1, #0xb0 (176)
0x20d29c6d5694   c74  f9407fe8       ldr x8, [sp, #248]
0x20d29c6d5698   c78  bc666901       ldr s1, [x8, x6]
0x20d29c6d569c   c7c  fd403fe2       ldr d2, [sp, #120]
0x20d29c6d56a0   c80  1e210842       fmul s2, s2, s1
0x20d29c6d56a4   c84  fd4043e3       ldr d3, [sp, #128]
0x20d29c6d56a8   c88  1e222862       fadd s2, s3, s2
0x20d29c6d56ac   c8c  f94047e6       ldr x6, [sp, #136]
0x20d29c6d56b0   c90  bc666903       ldr s3, [x8, x6]
0x20d29c6d56b4   c94  1e222060       fcmp s3, s2
0x20d29c6d56b8   c98  540000a9       b.ls #+0x14 (addr 0x20d29c6d56cc)
0x20d29c6d56bc   c9c  1e202048       fcmp s2, #0.0
0x20d29c6d56c0   ca0  54000082       b.hs #+0x10 (addr 0x20d29c6d56d0)
0x20d29c6d56c4   ca4  1e222862       fadd s2, s3, s2
0x20d29c6d56c8   ca8  14000002       b #+0x8 (addr 0x20d29c6d56d0)
0x20d29c6d56cc   cac  1e233842       fsub s2, s2, s3
0x20d29c6d56d0   cb0  fd404be4       ldr d4, [sp, #144]
0x20d29c6d56d4   cb4  1e210881       fmul s1, s4, s1
0x20d29c6d56d8   cb8  fd404fe4       ldr d4, [sp, #152]
0x20d29c6d56dc   cbc  1e212881       fadd s1, s4, s1
0x20d29c6d56e0   cc0  1e212060       fcmp s3, s1
0x20d29c6d56e4   cc4  540000a9       b.ls #+0x14 (addr 0x20d29c6d56f8)
0x20d29c6d56e8   cc8  1e202028       fcmp s1, #0.0
0x20d29c6d56ec   ccc  54000082       b.hs #+0x10 (addr 0x20d29c6d56fc)
0x20d29c6d56f0   cd0  1e212861       fadd s1, s3, s1
0x20d29c6d56f4   cd4  14000002       b #+0x8 (addr 0x20d29c6d56fc)
0x20d29c6d56f8   cd8  1e233821       fsub s1, s1, s3
0x20d29c6d56fc   cdc  f94073ea       ldr x10, [sp, #224]
0x20d29c6d5700   ce0  f94053e9       ldr x9, [sp, #160]
0x20d29c6d5704   ce4  6b0a013f       cmp w9, w10
0x20d29c6d5708   ce8  540004c9       b.ls #+0x98 (addr 0x20d29c6d57a0)
0x20d29c6d570c   cec  f94063eb       ldr x11, [sp, #192]
0x20d29c6d5710   cf0  f94057ec       ldr x12, [sp, #168]
0x20d29c6d5714   cf4  0b0b018d       add w13, w12, w11
0x20d29c6d5718   cf8  1e222060       fcmp s3, s2
0x20d29c6d571c   cfc  1e229de2       fcsel s2, s15, s2, ls
0x20d29c6d5720   d00  bc2d6902       str s2, [x8, x13]
0x20d29c6d5724   d04  f9405bed       ldr x13, [sp, #176]
0x20d29c6d5728   d08  0b0b01ae       add w14, w13, w11
0x20d29c6d572c   d0c  1e212060       fcmp s3, s1
0x20d29c6d5730   d10  1e219de1       fcsel s1, s15, s1, ls
0x20d29c6d5734   d14  bc2e6901       str s1, [x8, x14]
0x20d29c6d5738   d18  f9405fee       ldr x14, [sp, #184]
0x20d29c6d573c   d1c  0b0b01cf       add w15, w14, w11
0x20d29c6d5740   d20  fd406beb       ldr d11, [sp, #208]
0x20d29c6d5744   d24  1e200961       fmul s1, s11, s0
0x20d29c6d5748   d28  fd406fea       ldr d10, [sp, #216]
0x20d29c6d574c   d2c  fd4037e2       ldr d2, [sp, #104]
0x20d29c6d5750   d30  1e220943       fmul s3, s10, s2
0x20d29c6d5754   d34  1e233821       fsub s1, s1, s3
0x20d29c6d5758   d38  bc2f6901       str s1, [x8, x15]
0x20d29c6d575c   d3c  f94067ef       ldr x15, [sp, #200]
0x20d29c6d5760   d40  0b0b01eb       add w11, w15, w11
0x20d29c6d5764   d44  1e220961       fmul s1, s11, s2
0x20d29c6d5768   d48  1e200942       fmul s2, s10, s0
0x20d29c6d576c   d4c  1e222821       fadd s1, s1, s2
0x20d29c6d5770   d50  bc2b6901       str s1, [x8, x11]
0x20d29c6d5774   d54  aa0103e9       mov x9, x1
0x20d29c6d5778   d58  aa0803e1       mov x1, x8
0x20d29c6d577c   d5c  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5780   d60  f94077ed       ldr x13, [sp, #232]
0x20d29c6d5784   d64  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d5788   d68  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d578c   d6c  fd401be3       ldr d3, [sp, #48]
0x20d29c6d5790   d70  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d5794   d74  f94033ec       ldr x12, [sp, #96]
0x20d29c6d5798   d78  f94027eb       ldr x11, [sp, #72]
0x20d29c6d579c   d7c  1400000b       b #+0x2c (addr 0x20d29c6d57c8)
0x20d29c6d57a0   d80  aa0103e9       mov x9, x1
0x20d29c6d57a4   d84  aa0803e1       mov x1, x8
0x20d29c6d57a8   d88  f94083e8       ldr x8, [sp, #256]
0x20d29c6d57ac   d8c  f94077ed       ldr x13, [sp, #232]
0x20d29c6d57b0   d90  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d57b4   d94  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d57b8   d98  fd401be3       ldr d3, [sp, #48]
0x20d29c6d57bc   d9c  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d57c0   da0  f94033ec       ldr x12, [sp, #96]
0x20d29c6d57c4   da4  f94027eb       ldr x11, [sp, #72]
0x20d29c6d57c8   da8  1100054a       add w10, w10, #0x1 (1)
0x20d29c6d57cc   dac  aa0d03e6       mov x6, x13
0x20d29c6d57d0   db0  6b06015f       cmp w10, w6
0x20d29c6d57d4   db4  54ffa261       b.ne #-0xbb4 (addr 0x20d29c6d4c20)
0x20d29c6d57d8   db8  14000011       b #+0x44 (addr 0x20d29c6d581c)
0x20d29c6d57dc   dbc  d286bf00       movz x0, #0x35f8
0x20d29c6d57e0   dc0  f2a002c0       movk x0, #0x16, lsl #16
0x20d29c6d57e4   dc4  f9408be7       ldr x7, [sp, #272]
0x20d29c6d57e8   dc8  97fabad6       bl #-0x1514a8 (addr 0x20d29c584340)
0x20d29c6d57ec   dcc  d2800001       movz x1, #0x0
0x20d29c6d57f0   dd0  6a01003f       tst w1, w1
0x20d29c6d57f4   dd4  54001ce0       b.eq #+0x39c (addr 0x20d29c6d5b90)
0x20d29c6d57f8   dd8  d4200000       brk #0x0
0x20d29c6d57fc   ddc  d286bf00       movz x0, #0x35f8
0x20d29c6d5800   de0  f2a002c0       movk x0, #0x16, lsl #16
0x20d29c6d5804   de4  f9408be7       ldr x7, [sp, #272]
0x20d29c6d5808   de8  97fabace       bl #-0x1514c8 (addr 0x20d29c584340)
0x20d29c6d580c   dec  d2800001       movz x1, #0x0
0x20d29c6d5810   df0  6a01003f       tst w1, w1
0x20d29c6d5814   df4  54001bc0       b.eq #+0x378 (addr 0x20d29c6d5b8c)
0x20d29c6d5818   df8  d4200000       brk #0x0
0x20d29c6d581c   dfc  f94087e6       ldr x6, [sp, #264]
0x20d29c6d5820   e00  9100c12a       add x10, x9, #0x30 (48)
0x20d29c6d5824   e04  3cea6821       ldr q1, [x1, x10]
0x20d29c6d5828   e08  3ce96822       ldr q2, [x1, x9]
0x20d29c6d582c   e0c  3caa6822       str q2, [x1, x10]
0x20d29c6d5830   e10  3ca96821       str q1, [x1, x9]
0x20d29c6d5834   e14  9101012a       add x10, x9, #0x40 (64)
0x20d29c6d5838   e18  3cea6821       ldr q1, [x1, x10]
0x20d29c6d583c   e1c  9100412b       add x11, x9, #0x10 (16)
0x20d29c6d5840   e20  3ceb6822       ldr q2, [x1, x11]
0x20d29c6d5844   e24  3caa6822       str q2, [x1, x10]
0x20d29c6d5848   e28  3cab6821       str q1, [x1, x11]
0x20d29c6d584c   e2c  9101412a       add x10, x9, #0x50 (80)
0x20d29c6d5850   e30  3cea6821       ldr q1, [x1, x10]
0x20d29c6d5854   e34  9100812b       add x11, x9, #0x20 (32)
0x20d29c6d5858   e38  3ceb6822       ldr q2, [x1, x11]
0x20d29c6d585c   e3c  3caa6822       str q2, [x1, x10]
0x20d29c6d5860   e40  3cab6821       str q1, [x1, x11]
0x20d29c6d5864   e44  91026129       add x9, x9, #0x98 (152)
0x20d29c6d5868   e48  f869682a       ldr x10, [x1, x9]
0x20d29c6d586c   e4c  9100054a       add x10, x10, #0x1 (1)
0x20d29c6d5870   e50  f829682a       str x10, [x1, x9]
0x20d29c6d5874   e54  aa0803e1       mov x1, x8
0x20d29c6d5878   e58  11014021       add w1, w1, #0x50 (80)
0x20d29c6d587c   e5c  b90000c1       str w1, [x6]
0x20d29c6d5880   e60  910003bf       mov sp, fp
0x20d29c6d5884   e64  a8c17bfd       ldp fp, lr, [sp], #16
0x20d29c6d5888   e68  d65f03c0       ret
0x20d29c6d588c   e6c  f9006be0       str x0, [sp, #208]
0x20d29c6d5890   e70  97fac0d0       bl #-0x14fcc0 (addr 0x20d29c585bd0)
0x20d29c6d5894   e74  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5898   e78  f9408be7       ldr x7, [sp, #272]
0x20d29c6d589c   e7c  f9406be0       ldr x0, [sp, #208]
0x20d29c6d58a0   e80  17fffc6a       b #-0xe58 (addr 0x20d29c6d4a48)
0x20d29c6d58a4   e84  1e642080       fcmp d4, d4
0x20d29c6d58a8   e88  54000060       b.eq #+0xc (addr 0x20d29c6d58b4)
0x20d29c6d58ac   e8c  d280000c       movz x12, #0x0
0x20d29c6d58b0   e90  17fffc92       b #-0xdb8 (addr 0x20d29c6d4af8)
0x20d29c6d58b4   e94  1e202068       fcmp s3, #0.0
0x20d29c6d58b8   e98  54ffffa3       b.lo #-0xc (addr 0x20d29c6d58ac)
0x20d29c6d58bc   e9c  9280000c       movn x12, #0x0
0x20d29c6d58c0   ea0  17fffc8e       b #-0xdc8 (addr 0x20d29c6d4af8)
0x20d29c6d58c4   ea4  f90073ea       str x10, [sp, #224]
0x20d29c6d58c8   ea8  97fac0c2       bl #-0x14fcf8 (addr 0x20d29c585bd0)
0x20d29c6d58cc   eac  f94083e8       ldr x8, [sp, #256]
0x20d29c6d58d0   eb0  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d58d4   eb4  f9407be9       ldr x9, [sp, #240]
0x20d29c6d58d8   eb8  f94077ed       ldr x13, [sp, #232]
0x20d29c6d58dc   ebc  f94073ea       ldr x10, [sp, #224]
0x20d29c6d58e0   ec0  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d58e4   ec4  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d58e8   ec8  fd401be3       ldr d3, [sp, #48]
0x20d29c6d58ec   ecc  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d58f0   ed0  f94033ec       ldr x12, [sp, #96]
0x20d29c6d58f4   ed4  f94027eb       ldr x11, [sp, #72]
0x20d29c6d58f8   ed8  17fffcce       b #-0xcc8 (addr 0x20d29c6d4c30)
0x20d29c6d58fc   edc  fd006fea       str d10, [sp, #216]
0x20d29c6d5900   ee0  fd006beb       str d11, [sp, #208]
0x20d29c6d5904   ee4  f9002be6       str x6, [sp, #80]
0x20d29c6d5908   ee8  f9003bf9       str x25, [sp, #112]
0x20d29c6d590c   eec  97fac0b1       bl #-0x14fd3c (addr 0x20d29c585bd0)
0x20d29c6d5910   ef0  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5914   ef4  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5918   ef8  f9407be9       ldr x9, [sp, #240]
0x20d29c6d591c   efc  f94077ed       ldr x13, [sp, #232]
0x20d29c6d5920   f00  f94063e2       ldr x2, [sp, #192]
0x20d29c6d5924   f04  fd404fe9       ldr d9, [sp, #152]
0x20d29c6d5928   f08  fd404be7       ldr d7, [sp, #144]
0x20d29c6d592c   f0c  fd4043e6       ldr d6, [sp, #128]
0x20d29c6d5930   f10  fd403fe8       ldr d8, [sp, #120]
0x20d29c6d5934   f14  fd406fea       ldr d10, [sp, #216]
0x20d29c6d5938   f18  fd406beb       ldr d11, [sp, #208]
0x20d29c6d593c   f1c  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d5940   f20  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d5944   f24  fd401be3       ldr d3, [sp, #48]
0x20d29c6d5948   f28  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d594c   f2c  f94013e0       ldr x0, [sp, #32]
0x20d29c6d5950   f30  f9400fe5       ldr x5, [sp, #24]
0x20d29c6d5954   f34  f9400be4       ldr x4, [sp, #16]
0x20d29c6d5958   f38  f94007e3       ldr x3, [sp, #8]
0x20d29c6d595c   f3c  f9402be6       ldr x6, [sp, #80]
0x20d29c6d5960   f40  f9403bf9       ldr x25, [sp, #112]
0x20d29c6d5964   f44  f94033ec       ldr x12, [sp, #96]
0x20d29c6d5968   f48  f94027eb       ldr x11, [sp, #72]
0x20d29c6d596c   f4c  17fffced       b #-0xc4c (addr 0x20d29c6d4d20)
0x20d29c6d5970   f50  fd006fea       str d10, [sp, #216]
0x20d29c6d5974   f54  fd006beb       str d11, [sp, #208]
0x20d29c6d5978   f58  f9002be6       str x6, [sp, #80]
0x20d29c6d597c   f5c  f90037fb       str cp, [sp, #104]
0x20d29c6d5980   f60  f9002ff8       str x24, [sp, #88]
0x20d29c6d5984   f64  f9003bf9       str x25, [sp, #112]
0x20d29c6d5988   f68  97fac092       bl #-0x14fdb8 (addr 0x20d29c585bd0)
0x20d29c6d598c   f6c  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5990   f70  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5994   f74  f9407be9       ldr x9, [sp, #240]
0x20d29c6d5998   f78  f94077ed       ldr x13, [sp, #232]
0x20d29c6d599c   f7c  f94063e2       ldr x2, [sp, #192]
0x20d29c6d59a0   f80  fd404fe9       ldr d9, [sp, #152]
0x20d29c6d59a4   f84  fd404be7       ldr d7, [sp, #144]
0x20d29c6d59a8   f88  fd4043e6       ldr d6, [sp, #128]
0x20d29c6d59ac   f8c  fd403fe8       ldr d8, [sp, #120]
0x20d29c6d59b0   f90  fd406fea       ldr d10, [sp, #216]
0x20d29c6d59b4   f94  fd406beb       ldr d11, [sp, #208]
0x20d29c6d59b8   f98  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d59bc   f9c  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d59c0   fa0  fd401be3       ldr d3, [sp, #48]
0x20d29c6d59c4   fa4  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d59c8   fa8  f94013e0       ldr x0, [sp, #32]
0x20d29c6d59cc   fac  f9400fe5       ldr x5, [sp, #24]
0x20d29c6d59d0   fb0  f9400be4       ldr x4, [sp, #16]
0x20d29c6d59d4   fb4  f94007e3       ldr x3, [sp, #8]
0x20d29c6d59d8   fb8  f9402be6       ldr x6, [sp, #80]
0x20d29c6d59dc   fbc  f94037fb       ldr cp, [sp, #104]
0x20d29c6d59e0   fc0  f9402ff8       ldr x24, [sp, #88]
0x20d29c6d59e4   fc4  f9403bf9       ldr x25, [sp, #112]
0x20d29c6d59e8   fc8  f94033ec       ldr x12, [sp, #96]
0x20d29c6d59ec   fcc  f94027eb       ldr x11, [sp, #72]
0x20d29c6d59f0   fd0  17fffcdc       b #-0xc90 (addr 0x20d29c6d4d60)
0x20d29c6d59f4   fd4  1e6c2180       fcmp d12, d12
0x20d29c6d59f8   fd8  54000060       b.eq #+0xc (addr 0x20d29c6d5a04)
0x20d29c6d59fc   fdc  d280000e       movz x14, #0x0
0x20d29c6d5a00   fe0  17fffd1e       b #-0xb88 (addr 0x20d29c6d4e78)
0x20d29c6d5a04   fe4  1e202168       fcmp s11, #0.0
0x20d29c6d5a08   fe8  54ffffa3       b.lo #-0xc (addr 0x20d29c6d59fc)
0x20d29c6d5a0c   fec  9280000e       movn x14, #0x0
0x20d29c6d5a10   ff0  17fffd1a       b #-0xb98 (addr 0x20d29c6d4e78)
0x20d29c6d5a14   ff4  1e6b2160       fcmp d11, d11
0x20d29c6d5a18   ff8  54000060       b.eq #+0xc (addr 0x20d29c6d5a24)
0x20d29c6d5a1c   ffc  d280000f       movz x15, #0x0
0x20d29c6d5a20  1000  17fffd30       b #-0xb40 (addr 0x20d29c6d4ee0)
0x20d29c6d5a24  1004  1e202148       fcmp s10, #0.0
0x20d29c6d5a28  1008  54ffffa3       b.lo #-0xc (addr 0x20d29c6d5a1c)
0x20d29c6d5a2c  100c  9280000f       movn x15, #0x0
0x20d29c6d5a30  1010  17fffd2c       b #-0xb50 (addr 0x20d29c6d4ee0)
0x20d29c6d5a34  1014  f9003bea       str x10, [sp, #112]
0x20d29c6d5a38  1018  fd006fea       str d10, [sp, #216]
0x20d29c6d5a3c  101c  fd006beb       str d11, [sp, #208]
0x20d29c6d5a40  1020  f9002be6       str x6, [sp, #80]
0x20d29c6d5a44  1024  97fac063       bl #-0x14fe74 (addr 0x20d29c585bd0)
0x20d29c6d5a48  1028  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5a4c  102c  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5a50  1030  f9407be9       ldr x9, [sp, #240]
0x20d29c6d5a54  1034  fd404fe9       ldr d9, [sp, #152]
0x20d29c6d5a58  1038  fd404be7       ldr d7, [sp, #144]
0x20d29c6d5a5c  103c  fd4043e6       ldr d6, [sp, #128]
0x20d29c6d5a60  1040  fd403fe8       ldr d8, [sp, #120]
0x20d29c6d5a64  1044  f9403bea       ldr x10, [sp, #112]
0x20d29c6d5a68  1048  fd406fea       ldr d10, [sp, #216]
0x20d29c6d5a6c  104c  fd406beb       ldr d11, [sp, #208]
0x20d29c6d5a70  1050  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d5a74  1054  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d5a78  1058  fd401be3       ldr d3, [sp, #48]
0x20d29c6d5a7c  105c  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d5a80  1060  f94013ee       ldr x14, [sp, #32]
0x20d29c6d5a84  1064  f9400fed       ldr x13, [sp, #24]
0x20d29c6d5a88  1068  f9400bec       ldr x12, [sp, #16]
0x20d29c6d5a8c  106c  f94007eb       ldr x11, [sp, #8]
0x20d29c6d5a90  1070  f9402be6       ldr x6, [sp, #80]
0x20d29c6d5a94  1074  f94003f6       ldr x22, [sp]
0x20d29c6d5a98  1078  17fffe71       b #-0x63c (addr 0x20d29c6d545c)
0x20d29c6d5a9c  107c  f9003bea       str x10, [sp, #112]
0x20d29c6d5aa0  1080  fd006fea       str d10, [sp, #216]
0x20d29c6d5aa4  1084  fd006beb       str d11, [sp, #208]
0x20d29c6d5aa8  1088  f90037f3       str x19, [sp, #104]
0x20d29c6d5aac  108c  f9002be6       str x6, [sp, #80]
0x20d29c6d5ab0  1090  f9002fef       str x15, [sp, #88]
0x20d29c6d5ab4  1094  97fac047       bl #-0x14fee4 (addr 0x20d29c585bd0)
0x20d29c6d5ab8  1098  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5abc  109c  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5ac0  10a0  f9407be9       ldr x9, [sp, #240]
0x20d29c6d5ac4  10a4  fd404fe9       ldr d9, [sp, #152]
0x20d29c6d5ac8  10a8  fd404be7       ldr d7, [sp, #144]
0x20d29c6d5acc  10ac  fd4043e6       ldr d6, [sp, #128]
0x20d29c6d5ad0  10b0  fd403fe8       ldr d8, [sp, #120]
0x20d29c6d5ad4  10b4  f9403bea       ldr x10, [sp, #112]
0x20d29c6d5ad8  10b8  fd406fea       ldr d10, [sp, #216]
0x20d29c6d5adc  10bc  fd406beb       ldr d11, [sp, #208]
0x20d29c6d5ae0  10c0  f94037f3       ldr x19, [sp, #104]
0x20d29c6d5ae4  10c4  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d5ae8  10c8  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d5aec  10cc  fd401be3       ldr d3, [sp, #48]
0x20d29c6d5af0  10d0  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d5af4  10d4  f94013ee       ldr x14, [sp, #32]
0x20d29c6d5af8  10d8  f9400fed       ldr x13, [sp, #24]
0x20d29c6d5afc  10dc  f9400bec       ldr x12, [sp, #16]
0x20d29c6d5b00  10e0  f94007eb       ldr x11, [sp, #8]
0x20d29c6d5b04  10e4  f9402be6       ldr x6, [sp, #80]
0x20d29c6d5b08  10e8  f9402fef       ldr x15, [sp, #88]
0x20d29c6d5b0c  10ec  f94003f6       ldr x22, [sp]
0x20d29c6d5b10  10f0  17fffe5c       b #-0x690 (addr 0x20d29c6d5480)
0x20d29c6d5b14  10f4  f9003bea       str x10, [sp, #112]
0x20d29c6d5b18  10f8  fd006fea       str d10, [sp, #216]
0x20d29c6d5b1c  10fc  fd006beb       str d11, [sp, #208]
0x20d29c6d5b20  1100  f90037f3       str x19, [sp, #104]
0x20d29c6d5b24  1104  f9002ff4       str x20, [sp, #88]
0x20d29c6d5b28  1108  f9002be6       str x6, [sp, #80]
0x20d29c6d5b2c  110c  97fac029       bl #-0x14ff5c (addr 0x20d29c585bd0)
0x20d29c6d5b30  1110  f94083e8       ldr x8, [sp, #256]
0x20d29c6d5b34  1114  f9407fe1       ldr x1, [sp, #248]
0x20d29c6d5b38  1118  f9407be9       ldr x9, [sp, #240]
0x20d29c6d5b3c  111c  fd404fe9       ldr d9, [sp, #152]
0x20d29c6d5b40  1120  fd404be7       ldr d7, [sp, #144]
0x20d29c6d5b44  1124  fd4043e6       ldr d6, [sp, #128]
0x20d29c6d5b48  1128  fd403fe8       ldr d8, [sp, #120]
0x20d29c6d5b4c  112c  f9403bea       ldr x10, [sp, #112]
0x20d29c6d5b50  1130  fd406fea       ldr d10, [sp, #216]
0x20d29c6d5b54  1134  fd406beb       ldr d11, [sp, #208]
0x20d29c6d5b58  1138  f94037f3       ldr x19, [sp, #104]
0x20d29c6d5b5c  113c  fd4023e1       ldr d1, [sp, #64]
0x20d29c6d5b60  1140  fd401fe2       ldr d2, [sp, #56]
0x20d29c6d5b64  1144  fd401be3       ldr d3, [sp, #48]
0x20d29c6d5b68  1148  fd4017e4       ldr d4, [sp, #40]
0x20d29c6d5b6c  114c  f94013ee       ldr x14, [sp, #32]
0x20d29c6d5b70  1150  f9400fed       ldr x13, [sp, #24]
0x20d29c6d5b74  1154  f9400bec       ldr x12, [sp, #16]
0x20d29c6d5b78  1158  f94007eb       ldr x11, [sp, #8]
0x20d29c6d5b7c  115c  f9402ff4       ldr x20, [sp, #88]
0x20d29c6d5b80  1160  f9402be6       ldr x6, [sp, #80]
0x20d29c6d5b84  1164  f94003f6       ldr x22, [sp]
0x20d29c6d5b88  1168  17fffe53       b #-0x6b4 (addr 0x20d29c6d54d4)
0x20d29c6d5b8c  116c  97fabf5d       bl #-0x15028c (addr 0x20d29c585900)
0x20d29c6d5b90  1170  97fabf5c       bl #-0x150290 (addr 0x20d29c585900)
0x20d29c6d5b94  1174  d503201f       nop

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
0x20d29c6d4b4c    12c  slots (sp->fp): 00000000000000000000000000000000000000

RelocInfo (size = 39)
0x20d29c6d4b48  internal wasm call
0x20d29c6d5678  internal wasm call
0x20d29c6d5688  internal wasm call
0x20d29c6d57e8  internal wasm call
0x20d29c6d5808  internal wasm call
0x20d29c6d5890  wasm stub call  (0x20d29c585bd0)
0x20d29c6d58c8  wasm stub call  (0x20d29c585bd0)
0x20d29c6d590c  wasm stub call  (0x20d29c585bd0)
0x20d29c6d5988  wasm stub call  (0x20d29c585bd0)
0x20d29c6d5a44  wasm stub call  (0x20d29c585bd0)
0x20d29c6d5ab4  wasm stub call  (0x20d29c585bd0)
0x20d29c6d5b2c  wasm stub call  (0x20d29c585bd0)
0x20d29c6d5b8c  wasm stub call  (0x20d29c585900)
0x20d29c6d5b90  wasm stub call  (0x20d29c585900)
