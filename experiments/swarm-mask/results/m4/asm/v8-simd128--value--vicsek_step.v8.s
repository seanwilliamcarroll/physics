name: _RNvMs0_NtCshBZZPcGIfde_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 4512 = 4492 + 20 padding)
Instructions (size = 4472)
0x1474070d8680     0  d2800110       movz x16, #0x8
0x1474070d8684     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x1474070d8688     8  a9017bfd       stp fp, lr, [sp, #16]
0x1474070d868c     c  910043fd       add fp, sp, #0x10 (16)
0x1474070d8690    10  d10443ff       sub sp, sp, #0x110 (272)
0x1474070d8694    14  f841f0e1       ldur x1, [x7, #31]
0x1474070d8698    18  f8520346       ldur x6, [x26, #-224]
0x1474070d869c    1c  f9007fe1       str x1, [sp, #248]
0x1474070d86a0    20  eb2663ff       cmp sp, x6
0x1474070d86a4    24  54007249       b.ls #+0xe48 (addr 0x1474070d94ec)
0x1474070d86a8    28  f842f0e6       ldur x6, [x7, #47]
0x1474070d86ac    2c  b94000c8       ldr w8, [x6]
0x1474070d86b0    30  51014108       sub w8, w8, #0x50 (80)
0x1474070d86b4    34  b90000c8       str w8, [x6]
0x1474070d86b8    38  2a0003e9       mov w9, w0
0x1474070d86bc    3c  9102b12a       add x10, x9, #0xac (172)
0x1474070d86c0    40  bc6a6821       ldr s1, [x1, x10]
0x1474070d86c4    44  9102a12a       add x10, x9, #0xa8 (168)
0x1474070d86c8    48  bc6a6822       ldr s2, [x1, x10]
0x1474070d86cc    4c  9100212b       add x11, x9, #0x8 (8)
0x1474070d86d0    50  b86b6823       ldr w3, [x1, x11]
0x1474070d86d4    54  9102e12c       add x12, x9, #0xb8 (184)
0x1474070d86d8    58  386c682c       ldrb w12, [x1, x12]
0x1474070d86dc    5c  f90087e6       str x6, [sp, #264]
0x1474070d86e0    60  f90083e8       str x8, [sp, #256]
0x1474070d86e4    64  f9007be9       str x9, [sp, #240]
0x1474070d86e8    68  fd0073e1       str d1, [sp, #224]
0x1474070d86ec    6c  f90047ea       str x10, [sp, #136]
0x1474070d86f0    70  fd001fe2       str d2, [sp, #56]
0x1474070d86f4    74  f90027eb       str x11, [sp, #72]
0x1474070d86f8    78  f90077e3       str x3, [sp, #232]
0x1474070d86fc    7c  350001ec       cbnz w12, #+0x3c (addr 0x1474070d8738)
0x1474070d8700    80  52840010       movz w16, #0x2000
0x1474070d8704    84  72a7f010       movk w16, #0x3f80, lsl #16
0x1474070d8708    88  1e270203       fmov s3, w16
0x1474070d870c    8c  1e230823       fmul s3, s1, s3
0x1474070d8710    90  1e231843       fdiv s3, s2, s3
0x1474070d8714    94  1e254063       frintm s3, s3
0x1474070d8718    98  1e202068       fcmp s3, #0.0
0x1474070d871c    9c  5400006a       b.ge #+0xc (addr 0x1474070d8728)
0x1474070d8720    a0  d280000c       movz x12, #0x0
0x1474070d8724    a4  1400002d       b #+0xb4 (addr 0x1474070d87d8)
0x1474070d8728    a8  52a9f010       movz w16, #0x4f800000
0x1474070d872c    ac  1e270204       fmov s4, w16
0x1474070d8730    b0  1e242060       fcmp s3, s4
0x1474070d8734    b4  54000063       b.lo #+0xc (addr 0x1474070d8740)
0x1474070d8738    b8  d280000c       movz x12, #0x0
0x1474070d873c    bc  14000027       b #+0x9c (addr 0x1474070d87d8)
0x1474070d8740    c0  1e22c064       fcvt d4, s3
0x1474070d8744    c4  1e65c085       frintz d5, d4
0x1474070d8748    c8  1e7900ac       fcvtzu w12, d5
0x1474070d874c    cc  1e630186       ucvtf d6, w12
0x1474070d8750    d0  1e6620a0       fcmp d5, d6
0x1474070d8754    d4  54006d81       b.ne #+0xdb0 (addr 0x1474070d9504)
0x1474070d8758    d8  71000d9f       cmp w12, #0x3 (3)
0x1474070d875c    dc  54fffee3       b.lo #-0x24 (addr 0x1474070d8738)
0x1474070d8760    e0  9100512d       add x13, x9, #0x14 (20)
0x1474070d8764    e4  b86d6825       ldr w5, [x1, x13]
0x1474070d8768    e8  9100412d       add x13, x9, #0x10 (16)
0x1474070d876c    ec  b86d6824       ldr w4, [x1, x13]
0x1474070d8770    f0  9100112d       add x13, x9, #0x4 (4)
0x1474070d8774    f4  b86d6822       ldr w2, [x1, x13]
0x1474070d8778    f8  d280800d       movz x13, #0x400
0x1474070d877c    fc  7110019f       cmp w12, #0x400 (1024)
0x1474070d8780   100  1a8d318e       csel w14, w12, w13, lo
0x1474070d8784   104  9102312c       add x12, x9, #0x8c (140)
0x1474070d8788   108  b82c682e       str w14, [x1, x12]
0x1474070d878c   10c  9102212c       add x12, x9, #0x88 (136)
0x1474070d8790   110  b82c682e       str w14, [x1, x12]
0x1474070d8794   114  1e2301c3       ucvtf s3, w14
0x1474070d8798   118  1e221863       fdiv s3, s3, s2
0x1474070d879c   11c  9102112c       add x12, x9, #0x84 (132)
0x1474070d87a0   120  bc2c6823       str s3, [x1, x12]
0x1474070d87a4   124  11018000       add w0, w0, #0x60 (96)
0x1474070d87a8   128  97fac3b5       bl #-0x14f12c (addr 0x147406f8967c)
0x1474070d87ac   12c  fd4073e1       ldr d1, [sp, #224]
0x1474070d87b0   130  d280002c       movz x12, #0x1
0x1474070d87b4   134  f94087e6       ldr x6, [sp, #264]
0x1474070d87b8   138  f94083e8       ldr x8, [sp, #256]
0x1474070d87bc   13c  f9407fe1       ldr x1, [sp, #248]
0x1474070d87c0   140  f9407be9       ldr x9, [sp, #240]
0x1474070d87c4   144  f9408be7       ldr x7, [sp, #272]
0x1474070d87c8   148  f94077e3       ldr x3, [sp, #232]
0x1474070d87cc   14c  f94047ea       ldr x10, [sp, #136]
0x1474070d87d0   150  fd401fe2       ldr d2, [sp, #56]
0x1474070d87d4   154  f94027eb       ldr x11, [sp, #72]
0x1474070d87d8   158  f90033ec       str x12, [sp, #96]
0x1474070d87dc   15c  aa0303ed       mov x13, x3
0x1474070d87e0   160  3400650d       cbz w13, #+0xca0 (addr 0x1474070d9480)
0x1474070d87e4   164  9101712e       add x14, x9, #0x5c (92)
0x1474070d87e8   168  b86e682e       ldr w14, [x1, x14]
0x1474070d87ec   16c  9101412f       add x15, x9, #0x50 (80)
0x1474070d87f0   170  b86f682f       ldr w15, [x1, x15]
0x1474070d87f4   174  91011133       add x19, x9, #0x44 (68)
0x1474070d87f8   178  b8736833       ldr w19, [x1, x19]
0x1474070d87fc   17c  9100e134       add x20, x9, #0x38 (56)
0x1474070d8800   180  b8746834       ldr w20, [x1, x20]
0x1474070d8804   184  6b14027f       cmp w19, w20
0x1474070d8808   188  1a943275       csel w21, w19, w20, lo
0x1474070d880c   18c  6b1501ff       cmp w15, w21
0x1474070d8810   190  1a9531f3       csel w19, w15, w21, lo
0x1474070d8814   194  6b1301df       cmp w14, w19
0x1474070d8818   198  1a9331cf       csel w15, w14, w19, lo
0x1474070d881c   19c  1e3c1003       fmov s3, #0xe0 (-0.5000)
0x1474070d8820   1a0  1e230843       fmul s3, s2, s3
0x1474070d8824   1a4  1e2c1004       fmov s4, #0x60 (0.5000)
0x1474070d8828   1a8  1e240844       fmul s4, s2, s4
0x1474070d882c   1ac  9101612e       add x14, x9, #0x58 (88)
0x1474070d8830   1b0  b86e682e       ldr w14, [x1, x14]
0x1474070d8834   1b4  91013133       add x19, x9, #0x4c (76)
0x1474070d8838   1b8  b8736833       ldr w19, [x1, x19]
0x1474070d883c   1bc  91010134       add x20, x9, #0x40 (64)
0x1474070d8840   1c0  b8746834       ldr w20, [x1, x20]
0x1474070d8844   1c4  9100d135       add x21, x9, #0x34 (52)
0x1474070d8848   1c8  b8756835       ldr w21, [x1, x21]
0x1474070d884c   1cc  11002116       add w22, w8, #0x8 (8)
0x1474070d8850   1d0  1e210821       fmul s1, s1, s1
0x1474070d8854   1d4  f90053ef       str x15, [sp, #160]
0x1474070d8858   1d8  fd001be3       str d3, [sp, #48]
0x1474070d885c   1dc  fd0017e4       str d4, [sp, #40]
0x1474070d8860   1e0  f90067ee       str x14, [sp, #200]
0x1474070d8864   1e4  f9005ff3       str x19, [sp, #184]
0x1474070d8868   1e8  f9005bf4       str x20, [sp, #176]
0x1474070d886c   1ec  f90057f5       str x21, [sp, #168]
0x1474070d8870   1f0  f90003f6       str x22, [sp]
0x1474070d8874   1f4  fd0023e1       str d1, [sp, #64]
0x1474070d8878   1f8  d280000a       movz x10, #0x0
0x1474070d887c   1fc  14000002       b #+0x8 (addr 0x1474070d8884)
0x1474070d8880   200  aa0603ed       mov x13, x6
0x1474070d8884   204  f8520358       ldur x24, [x26, #-224]
0x1474070d8888   208  eb3863ff       cmp sp, x24
0x1474070d888c   20c  540064c9       b.ls #+0xc98 (addr 0x1474070d9524)
0x1474070d8890   210  b86b6838       ldr w24, [x1, x11]
0x1474070d8894   214  f9003bf8       str x24, [sp, #112]
0x1474070d8898   218  6b0a031f       cmp w24, w10
0x1474070d889c   21c  54005c69       b.ls #+0xb8c (addr 0x1474070d9428)
0x1474070d88a0   220  91005139       add x25, x9, #0x14 (20)
0x1474070d88a4   224  b8796839       ldr w25, [x1, x25]
0x1474070d88a8   228  6b0a033f       cmp w25, w10
0x1474070d88ac   22c  54005be9       b.ls #+0xb7c (addr 0x1474070d9428)
0x1474070d88b0   230  9100813b       add cp, x9, #0x20 (32)
0x1474070d88b4   234  b87b683b       ldr w27, [x1, x27]
0x1474070d88b8   238  f9006ffb       str cp, [sp, #216]
0x1474070d88bc   23c  6b0a037f       cmp w27, w10
0x1474070d88c0   240  54005b49       b.ls #+0xb68 (addr 0x1474070d9428)
0x1474070d88c4   244  9100b13c       add x28, x9, #0x2c (44)
0x1474070d88c8   248  b87c683c       ldr w28, [x1, x28]
0x1474070d88cc   24c  f9006bfc       str x28, [sp, #208]
0x1474070d88d0   250  6b0a039f       cmp w28, w10
0x1474070d88d4   254  54005aa9       b.ls #+0xb54 (addr 0x1474070d9428)
0x1474070d88d8   258  91001120       add x0, x9, #0x4 (4)
0x1474070d88dc   25c  b8606820       ldr w0, [x1, x0]
0x1474070d88e0   260  531e7542       lsl w2, w10, #2
0x1474070d88e4   264  0b020003       add w3, w0, w2
0x1474070d88e8   268  bc636826       ldr s6, [x1, x3]
0x1474070d88ec   26c  9100a123       add x3, x9, #0x28 (40)
0x1474070d88f0   270  b8636823       ldr w3, [x1, x3]
0x1474070d88f4   274  0b020064       add w4, w3, w2
0x1474070d88f8   278  bc646827       ldr s7, [x1, x4]
0x1474070d88fc   27c  91007124       add x4, x9, #0x1c (28)
0x1474070d8900   280  b8646824       ldr w4, [x1, x4]
0x1474070d8904   284  0b020085       add w5, w4, w2
0x1474070d8908   288  bc656828       ldr s8, [x1, x5]
0x1474070d890c   28c  91004125       add x5, x9, #0x10 (16)
0x1474070d8910   290  b8656825       ldr w5, [x1, x5]
0x1474070d8914   294  0b0200a6       add w6, w5, w2
0x1474070d8918   298  bc666829       ldr s9, [x1, x6]
0x1474070d891c   29c  f90073ea       str x10, [sp, #224]
0x1474070d8920   2a0  f90013e0       str x0, [sp, #32]
0x1474070d8924   2a4  f90063e2       str x2, [sp, #192]
0x1474070d8928   2a8  fd0043e6       str d6, [sp, #128]
0x1474070d892c   2ac  f90007e3       str x3, [sp, #8]
0x1474070d8930   2b0  fd004be7       str d7, [sp, #144]
0x1474070d8934   2b4  f9000be4       str x4, [sp, #16]
0x1474070d8938   2b8  fd003fe8       str d8, [sp, #120]
0x1474070d893c   2bc  f9000fe5       str x5, [sp, #24]
0x1474070d8940   2c0  fd004fe9       str d9, [sp, #152]
0x1474070d8944   2c4  3500090c       cbnz w12, #+0x120 (addr 0x1474070d8a64)
0x1474070d8948   2c8  6b19031f       cmp w24, w25
0x1474070d894c   2cc  1a993306       csel w6, w24, w25, lo
0x1474070d8950   2d0  6b1c037f       cmp w27, w28
0x1474070d8954   2d4  1a9c3378       csel w24, w27, w28, lo
0x1474070d8958   2d8  6b1800df       cmp w6, w24
0x1474070d895c   2dc  1a9830d9       csel w25, w6, w24, lo
0x1474070d8960   2e0  2f00e40a       movi d10, #0x0
0x1474070d8964   2e4  d2800006       movz x6, #0x0
0x1474070d8968   2e8  4eaa1d4b       mov v11.16b, v10.16b
0x1474070d896c   2ec  14000002       b #+0x8 (addr 0x1474070d8974)
0x1474070d8970   2f0  aa1b03e6       mov x6, cp
0x1474070d8974   2f4  f8520358       ldur x24, [x26, #-224]
0x1474070d8978   2f8  eb3863ff       cmp sp, x24
0x1474070d897c   2fc  54005f09       b.ls #+0xbe0 (addr 0x1474070d955c)
0x1474070d8980   300  6b06033f       cmp w25, w6
0x1474070d8984   304  9a9f87f8       cset x24, ls
0x1474070d8988   308  aa0603fb       mov cp, x6
0x1474070d898c   30c  1100077b       add w27, w27, #0x1 (1)
0x1474070d8990   310  34000218       cbz w24, #+0x40 (addr 0x1474070d89d0)
0x1474070d8994   314  6b0d037f       cmp w27, w13
0x1474070d8998   318  54004382       b.hs #+0x870 (addr 0x1474070d9208)
0x1474070d899c   31c  1100077b       add w27, w27, #0x1 (1)
0x1474070d89a0   320  6b0d037f       cmp w27, w13
0x1474070d89a4   324  54004322       b.hs #+0x864 (addr 0x1474070d9208)
0x1474070d89a8   328  1100077b       add w27, w27, #0x1 (1)
0x1474070d89ac   32c  6b0d037f       cmp w27, w13
0x1474070d89b0   330  540042c2       b.hs #+0x858 (addr 0x1474070d9208)
0x1474070d89b4   334  f852035c       ldur x28, [x26, #-224]
0x1474070d89b8   338  eb3c63ff       cmp sp, x28
0x1474070d89bc   33c  540060a9       b.ls #+0xc14 (addr 0x1474070d95d0)
0x1474070d89c0   340  1100077b       add w27, w27, #0x1 (1)
0x1474070d89c4   344  6b0d037f       cmp w27, w13
0x1474070d89c8   348  54fffe23       b.lo #-0x3c (addr 0x1474070d898c)
0x1474070d89cc   34c  1400020f       b #+0x83c (addr 0x1474070d9208)
0x1474070d89d0   350  531e74c6       lsl w6, w6, #2
0x1474070d89d4   354  0b060078       add w24, w3, w6
0x1474070d89d8   358  0b06009c       add w28, w4, w6
0x1474070d89dc   35c  0b0600aa       add w10, w5, w6
0x1474070d89e0   360  bc6a682c       ldr s12, [x1, x10]
0x1474070d89e4   364  0b060006       add w6, w0, w6
0x1474070d89e8   368  bc66682d       ldr s13, [x1, x6]
0x1474070d89ec   36c  1e2d38cd       fsub s13, s6, s13
0x1474070d89f0   370  1e2d2080       fcmp s4, s13
0x1474070d89f4   374  540000a3       b.lo #+0x14 (addr 0x1474070d8a08)
0x1474070d89f8   378  1e2321a0       fcmp s13, s3
0x1474070d89fc   37c  54000082       b.hs #+0x10 (addr 0x1474070d8a0c)
0x1474070d8a00   380  1e2d284d       fadd s13, s2, s13
0x1474070d8a04   384  14000002       b #+0x8 (addr 0x1474070d8a0c)
0x1474070d8a08   388  1e2239ad       fsub s13, s13, s2
0x1474070d8a0c   38c  bc78682e       ldr s14, [x1, x24]
0x1474070d8a10   390  bc7c6830       ldr s16, [x1, x28]
0x1474070d8a14   394  1e2c392c       fsub s12, s9, s12
0x1474070d8a18   398  1e2c2080       fcmp s4, s12
0x1474070d8a1c   39c  540000a3       b.lo #+0x14 (addr 0x1474070d8a30)
0x1474070d8a20   3a0  1e232180       fcmp s12, s3
0x1474070d8a24   3a4  54000082       b.hs #+0x10 (addr 0x1474070d8a34)
0x1474070d8a28   3a8  1e2c284c       fadd s12, s2, s12
0x1474070d8a2c   3ac  14000002       b #+0x8 (addr 0x1474070d8a34)
0x1474070d8a30   3b0  1e22398c       fsub s12, s12, s2
0x1474070d8a34   3b4  1e302970       fadd s16, s11, s16
0x1474070d8a38   3b8  1e2d09ad       fmul s13, s13, s13
0x1474070d8a3c   3bc  1e2c098c       fmul s12, s12, s12
0x1474070d8a40   3c0  1e2c29ac       fadd s12, s13, s12
0x1474070d8a44   3c4  1e212180       fcmp s12, s1
0x1474070d8a48   3c8  1e2b3e0b       fcsel s11, s16, s11, lo
0x1474070d8a4c   3cc  1e2e294d       fadd s13, s10, s14
0x1474070d8a50   3d0  1e212180       fcmp s12, s1
0x1474070d8a54   3d4  1e2a3daa       fcsel s10, s13, s10, lo
0x1474070d8a58   3d8  6b0d037f       cmp w27, w13
0x1474070d8a5c   3dc  54fff8a3       b.lo #-0xec (addr 0x1474070d8970)
0x1474070d8a60   3e0  140001ea       b #+0x7a8 (addr 0x1474070d9208)
0x1474070d8a64   3e4  91023126       add x6, x9, #0x8c (140)
0x1474070d8a68   3e8  b8666826       ldr w6, [x1, x6]
0x1474070d8a6c   3ec  710000df       cmp w6, #0x0 (0)
0x1474070d8a70   3f0  9a9f17ea       cset x10, eq
0x1474070d8a74   3f4  34004e46       cbz w6, #+0x9c8 (addr 0x1474070d943c)
0x1474070d8a78   3f8  9102212b       add x11, x9, #0x88 (136)
0x1474070d8a7c   3fc  b86b682b       ldr w11, [x1, x11]
0x1474070d8a80   400  7100017f       cmp w11, #0x0 (0)
0x1474070d8a84   404  9a9f17ec       cset x12, eq
0x1474070d8a88   408  34004eab       cbz w11, #+0x9d4 (addr 0x1474070d945c)
0x1474070d8a8c   40c  9101912d       add x13, x9, #0x64 (100)
0x1474070d8a90   410  b86d682d       ldr w13, [x1, x13]
0x1474070d8a94   414  7100015f       cmp w10, #0x0 (0)
0x1474070d8a98   418  9a9f17ea       cset x10, eq
0x1474070d8a9c   41c  4b0a00ca       sub w10, w6, w10
0x1474070d8aa0   420  9102112e       add x14, x9, #0x84 (132)
0x1474070d8aa4   424  bc6e682a       ldr s10, [x1, x14]
0x1474070d8aa8   428  1e2a092b       fmul s11, s9, s10
0x1474070d8aac   42c  1e25416b       frintm s11, s11
0x1474070d8ab0   430  1e2b2160       fcmp s11, s11
0x1474070d8ab4   434  1e2b1deb       fcsel s11, s15, s11, ne
0x1474070d8ab8   438  1e202168       fcmp s11, #0.0
0x1474070d8abc   43c  1e2fcd6b       fcsel s11, s11, s15, gt
0x1474070d8ac0   440  1e22c16c       fcvt d12, s11
0x1474070d8ac4   444  1e65c18d       frintz d13, d12
0x1474070d8ac8   448  1e7901ae       fcvtzu w14, d13
0x1474070d8acc   44c  1e6301ce       ucvtf d14, w14
0x1474070d8ad0   450  1e6e21a0       fcmp d13, d14
0x1474070d8ad4   454  54005c01       b.ne #+0xb80 (addr 0x1474070d9654)
0x1474070d8ad8   458  6b0e015f       cmp w10, w14
0x1474070d8adc   45c  1a8e314f       csel w15, w10, w14, lo
0x1474070d8ae0   460  52a9f010       movz w16, #0x4f800000
0x1474070d8ae4   464  1e27020c       fmov s12, w16
0x1474070d8ae8   468  1e2c2160       fcmp s11, s12
0x1474070d8aec   46c  1a9f31ea       csel w10, w15, wzr, lo
0x1474070d8af0   470  0b06014a       add w10, w10, w6
0x1474070d8af4   474  5100054e       sub w14, w10, #0x1 (1)
0x1474070d8af8   478  1ac609d0       udiv w16, w14, w6
0x1474070d8afc   47c  1b06ba0e       msub w14, w16, w6, w14
0x1474070d8b00   480  1b0b7dce       mul w14, w14, w11
0x1474070d8b04   484  7100019f       cmp w12, #0x0 (0)
0x1474070d8b08   488  9a9f17ec       cset x12, eq
0x1474070d8b0c   48c  4b0c016c       sub w12, w11, w12
0x1474070d8b10   490  1e2a08ca       fmul s10, s6, s10
0x1474070d8b14   494  1e25414a       frintm s10, s10
0x1474070d8b18   498  1e2a2140       fcmp s10, s10
0x1474070d8b1c   49c  1e2a1dea       fcsel s10, s15, s10, ne
0x1474070d8b20   4a0  1e202148       fcmp s10, #0.0
0x1474070d8b24   4a4  1e2fcd4a       fcsel s10, s10, s15, gt
0x1474070d8b28   4a8  1e22c14b       fcvt d11, s10
0x1474070d8b2c   4ac  1e65c16d       frintz d13, d11
0x1474070d8b30   4b0  1e7901af       fcvtzu w15, d13
0x1474070d8b34   4b4  1e6301ee       ucvtf d14, w15
0x1474070d8b38   4b8  1e6e21a0       fcmp d13, d14
0x1474070d8b3c   4bc  540059c1       b.ne #+0xb38 (addr 0x1474070d9674)
0x1474070d8b40   4c0  6b0f019f       cmp w12, w15
0x1474070d8b44   4c4  1a8f3193       csel w19, w12, w15, lo
0x1474070d8b48   4c8  1e2c2140       fcmp s10, s12
0x1474070d8b4c   4cc  1a9f326c       csel w12, w19, wzr, lo
0x1474070d8b50   4d0  0b0b018c       add w12, w12, w11
0x1474070d8b54   4d4  5100058f       sub w15, w12, #0x1 (1)
0x1474070d8b58   4d8  1acb09f0       udiv w16, w15, w11
0x1474070d8b5c   4dc  1b0bbe0f       msub w15, w16, w11, w15
0x1474070d8b60   4e0  0b0f01d3       add w19, w14, w15
0x1474070d8b64   4e4  9101a134       add x20, x9, #0x68 (104)
0x1474070d8b68   4e8  b8746834       ldr w20, [x1, x20]
0x1474070d8b6c   4ec  6b14027f       cmp w19, w20
0x1474070d8b70   4f0  54000083       b.lo #+0x10 (addr 0x1474070d8b80)
0x1474070d8b74   4f4  d2800013       movz x19, #0x0
0x1474070d8b78   4f8  aa1303f5       mov x21, x19
0x1474070d8b7c   4fc  14000014       b #+0x50 (addr 0x1474070d8bcc)
0x1474070d8b80   500  11000675       add w21, w19, #0x1 (1)
0x1474070d8b84   504  6b15029f       cmp w20, w21
0x1474070d8b88   508  54ffff69       b.ls #-0x14 (addr 0x1474070d8b74)
0x1474070d8b8c   50c  0b1509b5       add w21, w13, w21, lsl #2
0x1474070d8b90   510  b8756835       ldr w21, [x1, x21]
0x1474070d8b94   514  0b1309b3       add w19, w13, w19, lsl #2
0x1474070d8b98   518  b8736833       ldr w19, [x1, x19]
0x1474070d8b9c   51c  6b1302bf       cmp w21, w19
0x1474070d8ba0   520  54000103       b.lo #+0x20 (addr 0x1474070d8bc0)
0x1474070d8ba4   524  91020137       add x23, x9, #0x80 (128)
0x1474070d8ba8   528  b8776837       ldr w23, [x1, x23]
0x1474070d8bac   52c  6b1502ff       cmp w23, w21
0x1474070d8bb0   530  540000e2       b.hs #+0x1c (addr 0x1474070d8bcc)
0x1474070d8bb4   534  d2800093       movz x19, #0x4
0x1474070d8bb8   538  d2800015       movz x21, #0x0
0x1474070d8bbc   53c  14000008       b #+0x20 (addr 0x1474070d8bdc)
0x1474070d8bc0   540  d2800015       movz x21, #0x0
0x1474070d8bc4   544  d2800093       movz x19, #0x4
0x1474070d8bc8   548  14000005       b #+0x14 (addr 0x1474070d8bdc)
0x1474070d8bcc   54c  4b1302b5       sub w21, w21, w19
0x1474070d8bd0   550  9101f137       add x23, x9, #0x7c (124)
0x1474070d8bd4   554  b8776837       ldr w23, [x1, x23]
0x1474070d8bd8   558  0b130af3       add w19, w23, w19, lsl #2
0x1474070d8bdc   55c  1acb0990       udiv w16, w12, w11
0x1474070d8be0   560  1b0bb217       msub w23, w16, w11, w12
0x1474070d8be4   564  0b0e02e2       add w2, w23, w14
0x1474070d8be8   568  6b14005f       cmp w2, w20
0x1474070d8bec   56c  54000083       b.lo #+0x10 (addr 0x1474070d8bfc)
0x1474070d8bf0   570  d2800002       movz x2, #0x0
0x1474070d8bf4   574  aa0203e7       mov x7, x2
0x1474070d8bf8   578  14000017       b #+0x5c (addr 0x1474070d8c54)
0x1474070d8bfc   57c  11000447       add w7, w2, #0x1 (1)
0x1474070d8c00   580  6b07029f       cmp w20, w7
0x1474070d8c04   584  54ffff69       b.ls #-0x14 (addr 0x1474070d8bf0)
0x1474070d8c08   588  0b0709a7       add w7, w13, w7, lsl #2
0x1474070d8c0c   58c  b8676827       ldr w7, [x1, x7]
0x1474070d8c10   590  0b0209a2       add w2, w13, w2, lsl #2
0x1474070d8c14   594  b8626822       ldr w2, [x1, x2]
0x1474070d8c18   598  6b0200ff       cmp w7, w2
0x1474070d8c1c   59c  54000163       b.lo #+0x2c (addr 0x1474070d8c48)
0x1474070d8c20   5a0  91020120       add x0, x9, #0x80 (128)
0x1474070d8c24   5a4  b8606820       ldr w0, [x1, x0]
0x1474070d8c28   5a8  6b07001f       cmp w0, w7
0x1474070d8c2c   5ac  54000063       b.lo #+0xc (addr 0x1474070d8c38)
0x1474070d8c30   5b0  f94013e0       ldr x0, [sp, #32]
0x1474070d8c34   5b4  14000008       b #+0x20 (addr 0x1474070d8c54)
0x1474070d8c38   5b8  f94013e0       ldr x0, [sp, #32]
0x1474070d8c3c   5bc  d2800007       movz x7, #0x0
0x1474070d8c40   5c0  d2800082       movz x2, #0x4
0x1474070d8c44   5c4  14000009       b #+0x24 (addr 0x1474070d8c68)
0x1474070d8c48   5c8  d2800007       movz x7, #0x0
0x1474070d8c4c   5cc  d2800082       movz x2, #0x4
0x1474070d8c50   5d0  14000006       b #+0x18 (addr 0x1474070d8c68)
0x1474070d8c54   5d4  4b0200e7       sub w7, w7, w2
0x1474070d8c58   5d8  9101f125       add x5, x9, #0x7c (124)
0x1474070d8c5c   5dc  b8656825       ldr w5, [x1, x5]
0x1474070d8c60   5e0  0b0208a2       add w2, w5, w2, lsl #2
0x1474070d8c64   5e4  f9400fe5       ldr x5, [sp, #24]
0x1474070d8c68   5e8  1100058c       add w12, w12, #0x1 (1)
0x1474070d8c6c   5ec  1acb0990       udiv w16, w12, w11
0x1474070d8c70   5f0  1b0bb20c       msub w12, w16, w11, w12
0x1474070d8c74   5f4  0b0e018e       add w14, w12, w14
0x1474070d8c78   5f8  6b1401df       cmp w14, w20
0x1474070d8c7c   5fc  54000083       b.lo #+0x10 (addr 0x1474070d8c8c)
0x1474070d8c80   600  d2800004       movz x4, #0x0
0x1474070d8c84   604  aa0403ee       mov x14, x4
0x1474070d8c88   608  14000017       b #+0x5c (addr 0x1474070d8ce4)
0x1474070d8c8c   60c  110005c4       add w4, w14, #0x1 (1)
0x1474070d8c90   610  6b04029f       cmp w20, w4
0x1474070d8c94   614  54ffff69       b.ls #-0x14 (addr 0x1474070d8c80)
0x1474070d8c98   618  0b0409a4       add w4, w13, w4, lsl #2
0x1474070d8c9c   61c  b8646824       ldr w4, [x1, x4]
0x1474070d8ca0   620  0b0e09ae       add w14, w13, w14, lsl #2
0x1474070d8ca4   624  b86e682e       ldr w14, [x1, x14]
0x1474070d8ca8   628  6b0e009f       cmp w4, w14
0x1474070d8cac   62c  54000163       b.lo #+0x2c (addr 0x1474070d8cd8)
0x1474070d8cb0   630  91020123       add x3, x9, #0x80 (128)
0x1474070d8cb4   634  b8636823       ldr w3, [x1, x3]
0x1474070d8cb8   638  6b04007f       cmp w3, w4
0x1474070d8cbc   63c  54000063       b.lo #+0xc (addr 0x1474070d8cc8)
0x1474070d8cc0   640  f94007e3       ldr x3, [sp, #8]
0x1474070d8cc4   644  14000008       b #+0x20 (addr 0x1474070d8ce4)
0x1474070d8cc8   648  d280008e       movz x14, #0x4
0x1474070d8ccc   64c  d2800004       movz x4, #0x0
0x1474070d8cd0   650  f94007e3       ldr x3, [sp, #8]
0x1474070d8cd4   654  14000008       b #+0x20 (addr 0x1474070d8cf4)
0x1474070d8cd8   658  d2800004       movz x4, #0x0
0x1474070d8cdc   65c  d280008e       movz x14, #0x4
0x1474070d8ce0   660  14000005       b #+0x14 (addr 0x1474070d8cf4)
0x1474070d8ce4   664  4b0e0084       sub w4, w4, w14
0x1474070d8ce8   668  9101f136       add x22, x9, #0x7c (124)
0x1474070d8cec   66c  b8766836       ldr w22, [x1, x22]
0x1474070d8cf0   670  0b0e0ace       add w14, w22, w14, lsl #2
0x1474070d8cf4   674  1ac60950       udiv w16, w10, w6
0x1474070d8cf8   678  1b06aa16       msub w22, w16, w6, w10
0x1474070d8cfc   67c  1b0b7ed6       mul w22, w22, w11
0x1474070d8d00   680  0b0f02c0       add w0, w22, w15
0x1474070d8d04   684  6b14001f       cmp w0, w20
0x1474070d8d08   688  54000083       b.lo #+0x10 (addr 0x1474070d8d18)
0x1474070d8d0c   68c  d2800000       movz x0, #0x0
0x1474070d8d10   690  aa0003e3       mov x3, x0
0x1474070d8d14   694  14000014       b #+0x50 (addr 0x1474070d8d64)
0x1474070d8d18   698  11000403       add w3, w0, #0x1 (1)
0x1474070d8d1c   69c  6b03029f       cmp w20, w3
0x1474070d8d20   6a0  54ffff69       b.ls #-0x14 (addr 0x1474070d8d0c)
0x1474070d8d24   6a4  0b0309a3       add w3, w13, w3, lsl #2
0x1474070d8d28   6a8  b8636823       ldr w3, [x1, x3]
0x1474070d8d2c   6ac  0b0009a0       add w0, w13, w0, lsl #2
0x1474070d8d30   6b0  b8606820       ldr w0, [x1, x0]
0x1474070d8d34   6b4  6b00007f       cmp w3, w0
0x1474070d8d38   6b8  54000103       b.lo #+0x20 (addr 0x1474070d8d58)
0x1474070d8d3c   6bc  91020125       add x5, x9, #0x80 (128)
0x1474070d8d40   6c0  b8656825       ldr w5, [x1, x5]
0x1474070d8d44   6c4  6b0300bf       cmp w5, w3
0x1474070d8d48   6c8  540000e2       b.hs #+0x1c (addr 0x1474070d8d64)
0x1474070d8d4c   6cc  d2800080       movz x0, #0x4
0x1474070d8d50   6d0  d2800003       movz x3, #0x0
0x1474070d8d54   6d4  14000008       b #+0x20 (addr 0x1474070d8d74)
0x1474070d8d58   6d8  d2800003       movz x3, #0x0
0x1474070d8d5c   6dc  d2800080       movz x0, #0x4
0x1474070d8d60   6e0  14000005       b #+0x14 (addr 0x1474070d8d74)
0x1474070d8d64   6e4  4b000063       sub w3, w3, w0
0x1474070d8d68   6e8  9101f125       add x5, x9, #0x7c (124)
0x1474070d8d6c   6ec  b8656825       ldr w5, [x1, x5]
0x1474070d8d70   6f0  0b0008a0       add w0, w5, w0, lsl #2
0x1474070d8d74   6f4  0b1702c5       add w5, w22, w23
0x1474070d8d78   6f8  6b1400bf       cmp w5, w20
0x1474070d8d7c   6fc  54000083       b.lo #+0x10 (addr 0x1474070d8d8c)
0x1474070d8d80   700  d2800005       movz x5, #0x0
0x1474070d8d84   704  aa0503fb       mov cp, x5
0x1474070d8d88   708  14000014       b #+0x50 (addr 0x1474070d8dd8)
0x1474070d8d8c   70c  110004bb       add w27, w5, #0x1 (1)
0x1474070d8d90   710  6b1b029f       cmp w20, w27
0x1474070d8d94   714  54ffff69       b.ls #-0x14 (addr 0x1474070d8d80)
0x1474070d8d98   718  0b1b09bb       add w27, w13, w27, lsl #2
0x1474070d8d9c   71c  b87b683b       ldr w27, [x1, x27]
0x1474070d8da0   720  0b0509a5       add w5, w13, w5, lsl #2
0x1474070d8da4   724  b8656825       ldr w5, [x1, x5]
0x1474070d8da8   728  6b05037f       cmp w27, w5
0x1474070d8dac   72c  54000103       b.lo #+0x20 (addr 0x1474070d8dcc)
0x1474070d8db0   730  9102013c       add x28, x9, #0x80 (128)
0x1474070d8db4   734  b87c683c       ldr w28, [x1, x28]
0x1474070d8db8   738  6b1b039f       cmp w28, w27
0x1474070d8dbc   73c  540000e2       b.hs #+0x1c (addr 0x1474070d8dd8)
0x1474070d8dc0   740  d280009b       movz cp, #0x4
0x1474070d8dc4   744  d280001c       movz x28, #0x0
0x1474070d8dc8   748  1400000b       b #+0x2c (addr 0x1474070d8df4)
0x1474070d8dcc   74c  d280001c       movz x28, #0x0
0x1474070d8dd0   750  d280009b       movz cp, #0x4
0x1474070d8dd4   754  14000008       b #+0x20 (addr 0x1474070d8df4)
0x1474070d8dd8   758  4b05037b       sub w27, w27, w5
0x1474070d8ddc   75c  9101f13c       add x28, x9, #0x7c (124)
0x1474070d8de0   760  b87c683c       ldr w28, [x1, x28]
0x1474070d8de4   764  0b050b9c       add w28, w28, w5, lsl #2
0x1474070d8de8   768  aa1b03f0       mov x16, cp
0x1474070d8dec   76c  aa1c03fb       mov cp, x28
0x1474070d8df0   770  aa1003fc       mov x28, x16
0x1474070d8df4   774  0b0c02d6       add w22, w22, w12
0x1474070d8df8   778  6b1402df       cmp w22, w20
0x1474070d8dfc   77c  54000083       b.lo #+0x10 (addr 0x1474070d8e0c)
0x1474070d8e00   780  d2800005       movz x5, #0x0
0x1474070d8e04   784  aa0503f6       mov x22, x5
0x1474070d8e08   788  14000014       b #+0x50 (addr 0x1474070d8e58)
0x1474070d8e0c   78c  110006c5       add w5, w22, #0x1 (1)
0x1474070d8e10   790  6b05029f       cmp w20, w5
0x1474070d8e14   794  54ffff69       b.ls #-0x14 (addr 0x1474070d8e00)
0x1474070d8e18   798  0b0509a5       add w5, w13, w5, lsl #2
0x1474070d8e1c   79c  b8656825       ldr w5, [x1, x5]
0x1474070d8e20   7a0  0b1609b6       add w22, w13, w22, lsl #2
0x1474070d8e24   7a4  b8766836       ldr w22, [x1, x22]
0x1474070d8e28   7a8  6b1600bf       cmp w5, w22
0x1474070d8e2c   7ac  54000103       b.lo #+0x20 (addr 0x1474070d8e4c)
0x1474070d8e30   7b0  91020138       add x24, x9, #0x80 (128)
0x1474070d8e34   7b4  b8786838       ldr w24, [x1, x24]
0x1474070d8e38   7b8  6b05031f       cmp w24, w5
0x1474070d8e3c   7bc  540000e2       b.hs #+0x1c (addr 0x1474070d8e58)
0x1474070d8e40   7c0  d2800096       movz x22, #0x4
0x1474070d8e44   7c4  d2800005       movz x5, #0x0
0x1474070d8e48   7c8  14000008       b #+0x20 (addr 0x1474070d8e68)
0x1474070d8e4c   7cc  d2800005       movz x5, #0x0
0x1474070d8e50   7d0  d2800096       movz x22, #0x4
0x1474070d8e54   7d4  14000005       b #+0x14 (addr 0x1474070d8e68)
0x1474070d8e58   7d8  4b1600a5       sub w5, w5, w22
0x1474070d8e5c   7dc  9101f138       add x24, x9, #0x7c (124)
0x1474070d8e60   7e0  b8786838       ldr w24, [x1, x24]
0x1474070d8e64   7e4  0b160b16       add w22, w24, w22, lsl #2
0x1474070d8e68   7e8  1100054a       add w10, w10, #0x1 (1)
0x1474070d8e6c   7ec  1ac60950       udiv w16, w10, w6
0x1474070d8e70   7f0  1b06aa06       msub w6, w16, w6, w10
0x1474070d8e74   7f4  1b0b7cc6       mul w6, w6, w11
0x1474070d8e78   7f8  0b0f00ca       add w10, w6, w15
0x1474070d8e7c   7fc  6b14015f       cmp w10, w20
0x1474070d8e80   800  54000083       b.lo #+0x10 (addr 0x1474070d8e90)
0x1474070d8e84   804  d280000a       movz x10, #0x0
0x1474070d8e88   808  aa0a03eb       mov x11, x10
0x1474070d8e8c   80c  14000014       b #+0x50 (addr 0x1474070d8edc)
0x1474070d8e90   810  1100054b       add w11, w10, #0x1 (1)
0x1474070d8e94   814  6b0b029f       cmp w20, w11
0x1474070d8e98   818  54ffff69       b.ls #-0x14 (addr 0x1474070d8e84)
0x1474070d8e9c   81c  0b0b09ab       add w11, w13, w11, lsl #2
0x1474070d8ea0   820  b86b682b       ldr w11, [x1, x11]
0x1474070d8ea4   824  0b0a09aa       add w10, w13, w10, lsl #2
0x1474070d8ea8   828  b86a682a       ldr w10, [x1, x10]
0x1474070d8eac   82c  6b0a017f       cmp w11, w10
0x1474070d8eb0   830  54000103       b.lo #+0x20 (addr 0x1474070d8ed0)
0x1474070d8eb4   834  9102012f       add x15, x9, #0x80 (128)
0x1474070d8eb8   838  b86f682f       ldr w15, [x1, x15]
0x1474070d8ebc   83c  6b0b01ff       cmp w15, w11
0x1474070d8ec0   840  540000e2       b.hs #+0x1c (addr 0x1474070d8edc)
0x1474070d8ec4   844  d280008a       movz x10, #0x4
0x1474070d8ec8   848  d280000b       movz x11, #0x0
0x1474070d8ecc   84c  14000008       b #+0x20 (addr 0x1474070d8eec)
0x1474070d8ed0   850  d280000b       movz x11, #0x0
0x1474070d8ed4   854  d280008a       movz x10, #0x4
0x1474070d8ed8   858  14000005       b #+0x14 (addr 0x1474070d8eec)
0x1474070d8edc   85c  4b0a016b       sub w11, w11, w10
0x1474070d8ee0   860  9101f12f       add x15, x9, #0x7c (124)
0x1474070d8ee4   864  b86f682f       ldr w15, [x1, x15]
0x1474070d8ee8   868  0b0a09ea       add w10, w15, w10, lsl #2
0x1474070d8eec   86c  0b1700cf       add w15, w6, w23
0x1474070d8ef0   870  6b1401ff       cmp w15, w20
0x1474070d8ef4   874  54000083       b.lo #+0x10 (addr 0x1474070d8f04)
0x1474070d8ef8   878  d280000f       movz x15, #0x0
0x1474070d8efc   87c  aa0f03f7       mov x23, x15
0x1474070d8f00   880  14000014       b #+0x50 (addr 0x1474070d8f50)
0x1474070d8f04   884  110005f7       add w23, w15, #0x1 (1)
0x1474070d8f08   888  6b17029f       cmp w20, w23
0x1474070d8f0c   88c  54ffff69       b.ls #-0x14 (addr 0x1474070d8ef8)
0x1474070d8f10   890  0b1709b7       add w23, w13, w23, lsl #2
0x1474070d8f14   894  b8776837       ldr w23, [x1, x23]
0x1474070d8f18   898  0b0f09af       add w15, w13, w15, lsl #2
0x1474070d8f1c   89c  b86f682f       ldr w15, [x1, x15]
0x1474070d8f20   8a0  6b0f02ff       cmp w23, w15
0x1474070d8f24   8a4  54000103       b.lo #+0x20 (addr 0x1474070d8f44)
0x1474070d8f28   8a8  91020138       add x24, x9, #0x80 (128)
0x1474070d8f2c   8ac  b8786838       ldr w24, [x1, x24]
0x1474070d8f30   8b0  6b17031f       cmp w24, w23
0x1474070d8f34   8b4  540000e2       b.hs #+0x1c (addr 0x1474070d8f50)
0x1474070d8f38   8b8  d280008f       movz x15, #0x4
0x1474070d8f3c   8bc  d2800017       movz x23, #0x0
0x1474070d8f40   8c0  14000008       b #+0x20 (addr 0x1474070d8f60)
0x1474070d8f44   8c4  d2800017       movz x23, #0x0
0x1474070d8f48   8c8  d280008f       movz x15, #0x4
0x1474070d8f4c   8cc  14000005       b #+0x14 (addr 0x1474070d8f60)
0x1474070d8f50   8d0  4b0f02f7       sub w23, w23, w15
0x1474070d8f54   8d4  9101f138       add x24, x9, #0x7c (124)
0x1474070d8f58   8d8  b8786838       ldr w24, [x1, x24]
0x1474070d8f5c   8dc  0b0f0b0f       add w15, w24, w15, lsl #2
0x1474070d8f60   8e0  0b0c00c6       add w6, w6, w12
0x1474070d8f64   8e4  6b1400df       cmp w6, w20
0x1474070d8f68   8e8  54000083       b.lo #+0x10 (addr 0x1474070d8f78)
0x1474070d8f6c   8ec  d2800006       movz x6, #0x0
0x1474070d8f70   8f0  aa0603ec       mov x12, x6
0x1474070d8f74   8f4  14000014       b #+0x50 (addr 0x1474070d8fc4)
0x1474070d8f78   8f8  110004cc       add w12, w6, #0x1 (1)
0x1474070d8f7c   8fc  6b0c029f       cmp w20, w12
0x1474070d8f80   900  54ffff69       b.ls #-0x14 (addr 0x1474070d8f6c)
0x1474070d8f84   904  0b0c09ac       add w12, w13, w12, lsl #2
0x1474070d8f88   908  b86c682c       ldr w12, [x1, x12]
0x1474070d8f8c   90c  0b0609a6       add w6, w13, w6, lsl #2
0x1474070d8f90   910  b8666826       ldr w6, [x1, x6]
0x1474070d8f94   914  6b06019f       cmp w12, w6
0x1474070d8f98   918  54000103       b.lo #+0x20 (addr 0x1474070d8fb8)
0x1474070d8f9c   91c  9102012d       add x13, x9, #0x80 (128)
0x1474070d8fa0   920  b86d682d       ldr w13, [x1, x13]
0x1474070d8fa4   924  6b0c01bf       cmp w13, w12
0x1474070d8fa8   928  540000e2       b.hs #+0x1c (addr 0x1474070d8fc4)
0x1474070d8fac   92c  d2800086       movz x6, #0x4
0x1474070d8fb0   930  d280000c       movz x12, #0x0
0x1474070d8fb4   934  14000008       b #+0x20 (addr 0x1474070d8fd4)
0x1474070d8fb8   938  d280000c       movz x12, #0x0
0x1474070d8fbc   93c  d2800086       movz x6, #0x4
0x1474070d8fc0   940  14000005       b #+0x14 (addr 0x1474070d8fd4)
0x1474070d8fc4   944  4b06018c       sub w12, w12, w6
0x1474070d8fc8   948  9101f12d       add x13, x9, #0x7c (124)
0x1474070d8fcc   94c  b86d682d       ldr w13, [x1, x13]
0x1474070d8fd0   950  0b0609a6       add w6, w13, w6, lsl #2
0x1474070d8fd4   954  9101310d       add x13, x8, #0x4c (76)
0x1474070d8fd8   958  b82d682c       str w12, [x1, x13]
0x1474070d8fdc   95c  9101210c       add x12, x8, #0x48 (72)
0x1474070d8fe0   960  b82c6826       str w6, [x1, x12]
0x1474070d8fe4   964  91011106       add x6, x8, #0x44 (68)
0x1474070d8fe8   968  b8266837       str w23, [x1, x6]
0x1474070d8fec   96c  91010106       add x6, x8, #0x40 (64)
0x1474070d8ff0   970  b826682f       str w15, [x1, x6]
0x1474070d8ff4   974  9100f106       add x6, x8, #0x3c (60)
0x1474070d8ff8   978  b826682b       str w11, [x1, x6]
0x1474070d8ffc   97c  9100e106       add x6, x8, #0x38 (56)
0x1474070d9000   980  b826682a       str w10, [x1, x6]
0x1474070d9004   984  9100d106       add x6, x8, #0x34 (52)
0x1474070d9008   988  b8266825       str w5, [x1, x6]
0x1474070d900c   98c  9100c106       add x6, x8, #0x30 (48)
0x1474070d9010   990  b8266836       str w22, [x1, x6]
0x1474070d9014   994  9100b106       add x6, x8, #0x2c (44)
0x1474070d9018   998  b826683c       str w28, [x1, x6]
0x1474070d901c   99c  9100a106       add x6, x8, #0x28 (40)
0x1474070d9020   9a0  b826683b       str w27, [x1, x6]
0x1474070d9024   9a4  91009106       add x6, x8, #0x24 (36)
0x1474070d9028   9a8  b8266823       str w3, [x1, x6]
0x1474070d902c   9ac  91008106       add x6, x8, #0x20 (32)
0x1474070d9030   9b0  b8266820       str w0, [x1, x6]
0x1474070d9034   9b4  91007106       add x6, x8, #0x1c (28)
0x1474070d9038   9b8  b8266824       str w4, [x1, x6]
0x1474070d903c   9bc  91006106       add x6, x8, #0x18 (24)
0x1474070d9040   9c0  b826682e       str w14, [x1, x6]
0x1474070d9044   9c4  91005106       add x6, x8, #0x14 (20)
0x1474070d9048   9c8  b8266827       str w7, [x1, x6]
0x1474070d904c   9cc  91004106       add x6, x8, #0x10 (16)
0x1474070d9050   9d0  b8266822       str w2, [x1, x6]
0x1474070d9054   9d4  91003106       add x6, x8, #0xc (12)
0x1474070d9058   9d8  b8266835       str w21, [x1, x6]
0x1474070d905c   9dc  91002106       add x6, x8, #0x8 (8)
0x1474070d9060   9e0  b8266833       str w19, [x1, x6]
0x1474070d9064   9e4  d2c00126       movz x6, #0x900000000
0x1474070d9068   9e8  f8286826       str x6, [x1, x8]
0x1474070d906c   9ec  f9403be6       ldr x6, [sp, #112]
0x1474070d9070   9f0  6b1900df       cmp w6, w25
0x1474070d9074   9f4  1a9930ca       csel w10, w6, w25, lo
0x1474070d9078   9f8  f9406fe6       ldr x6, [sp, #216]
0x1474070d907c   9fc  f9406beb       ldr x11, [sp, #208]
0x1474070d9080   a00  6b0b00df       cmp w6, w11
0x1474070d9084   a04  1a8b30cc       csel w12, w6, w11, lo
0x1474070d9088   a08  6b0c015f       cmp w10, w12
0x1474070d908c   a0c  1a8c3146       csel w6, w10, w12, lo
0x1474070d9090   a10  2f00e40a       movi d10, #0x0
0x1474070d9094   a14  f94003f6       ldr x22, [sp]
0x1474070d9098   a18  d280000a       movz x10, #0x0
0x1474070d909c   a1c  f94013ee       ldr x14, [sp, #32]
0x1474070d90a0   a20  f9400fed       ldr x13, [sp, #24]
0x1474070d90a4   a24  f9400bec       ldr x12, [sp, #16]
0x1474070d90a8   a28  f94007eb       ldr x11, [sp, #8]
0x1474070d90ac   a2c  4eaa1d4b       mov v11.16b, v10.16b
0x1474070d90b0   a30  f852034f       ldur x15, [x26, #-224]
0x1474070d90b4   a34  eb2f63ff       cmp sp, x15
0x1474070d90b8   a38  54002ee9       b.ls #+0x5dc (addr 0x1474070d9694)
0x1474070d90bc   a3c  0b0a0ecf       add w15, w22, w10, lsl #3
0x1474070d90c0   a40  910011f3       add x19, x15, #0x4 (4)
0x1474070d90c4   a44  b8736833       ldr w19, [x1, x19]
0x1474070d90c8   a48  34000933       cbz w19, #+0x124 (addr 0x1474070d91ec)
0x1474070d90cc   a4c  b86f682f       ldr w15, [x1, x15]
0x1474070d90d0   a50  0b1309f3       add w19, w15, w19, lsl #2
0x1474070d90d4   a54  f8520354       ldur x20, [x26, #-224]
0x1474070d90d8   a58  eb3463ff       cmp sp, x20
0x1474070d90dc   a5c  54003109       b.ls #+0x620 (addr 0x1474070d96fc)
0x1474070d90e0   a60  110011f4       add w20, w15, #0x4 (4)
0x1474070d90e4   a64  b86f682f       ldr w15, [x1, x15]
0x1474070d90e8   a68  6b0f00df       cmp w6, w15
0x1474070d90ec   a6c  54000328       b.hi #+0x64 (addr 0x1474070d9150)
0x1474070d90f0   a70  6b13029f       cmp w20, w19
0x1474070d90f4   a74  540007c0       b.eq #+0xf8 (addr 0x1474070d91ec)
0x1474070d90f8   a78  1100128f       add w15, w20, #0x4 (4)
0x1474070d90fc   a7c  b8746834       ldr w20, [x1, x20]
0x1474070d9100   a80  6b1400df       cmp w6, w20
0x1474070d9104   a84  540002c8       b.hi #+0x58 (addr 0x1474070d915c)
0x1474070d9108   a88  6b1301ff       cmp w15, w19
0x1474070d910c   a8c  54000700       b.eq #+0xe0 (addr 0x1474070d91ec)
0x1474070d9110   a90  110011f4       add w20, w15, #0x4 (4)
0x1474070d9114   a94  b86f682f       ldr w15, [x1, x15]
0x1474070d9118   a98  6b0f00df       cmp w6, w15
0x1474070d911c   a9c  540001a8       b.hi #+0x34 (addr 0x1474070d9150)
0x1474070d9120   aa0  6b13029f       cmp w20, w19
0x1474070d9124   aa4  54000640       b.eq #+0xc8 (addr 0x1474070d91ec)
0x1474070d9128   aa8  f852034f       ldur x15, [x26, #-224]
0x1474070d912c   aac  eb2f63ff       cmp sp, x15
0x1474070d9130   ab0  54003229       b.ls #+0x644 (addr 0x1474070d9774)
0x1474070d9134   ab4  1100128f       add w15, w20, #0x4 (4)
0x1474070d9138   ab8  b8746834       ldr w20, [x1, x20]
0x1474070d913c   abc  6b1400df       cmp w6, w20
0x1474070d9140   ac0  540000e8       b.hi #+0x1c (addr 0x1474070d915c)
0x1474070d9144   ac4  6b1301ff       cmp w15, w19
0x1474070d9148   ac8  54000520       b.eq #+0xa4 (addr 0x1474070d91ec)
0x1474070d914c   acc  17ffffe5       b #-0x6c (addr 0x1474070d90e0)
0x1474070d9150   ad0  aa1403f0       mov x16, x20
0x1474070d9154   ad4  aa0f03f4       mov x20, x15
0x1474070d9158   ad8  aa1003ef       mov x15, x16
0x1474070d915c   adc  531e7694       lsl w20, w20, #2
0x1474070d9160   ae0  0b140175       add w21, w11, w20
0x1474070d9164   ae4  0b140197       add w23, w12, w20
0x1474070d9168   ae8  0b1401b8       add w24, w13, w20
0x1474070d916c   aec  bc78682c       ldr s12, [x1, x24]
0x1474070d9170   af0  0b1401d4       add w20, w14, w20
0x1474070d9174   af4  bc74682d       ldr s13, [x1, x20]
0x1474070d9178   af8  1e2d38cd       fsub s13, s6, s13
0x1474070d917c   afc  1e2d2080       fcmp s4, s13
0x1474070d9180   b00  540000a3       b.lo #+0x14 (addr 0x1474070d9194)
0x1474070d9184   b04  1e2321a0       fcmp s13, s3
0x1474070d9188   b08  54000082       b.hs #+0x10 (addr 0x1474070d9198)
0x1474070d918c   b0c  1e2d284d       fadd s13, s2, s13
0x1474070d9190   b10  14000002       b #+0x8 (addr 0x1474070d9198)
0x1474070d9194   b14  1e2239ad       fsub s13, s13, s2
0x1474070d9198   b18  bc75682e       ldr s14, [x1, x21]
0x1474070d919c   b1c  bc776830       ldr s16, [x1, x23]
0x1474070d91a0   b20  1e2c392c       fsub s12, s9, s12
0x1474070d91a4   b24  1e2c2080       fcmp s4, s12
0x1474070d91a8   b28  540000a3       b.lo #+0x14 (addr 0x1474070d91bc)
0x1474070d91ac   b2c  1e232180       fcmp s12, s3
0x1474070d91b0   b30  54000082       b.hs #+0x10 (addr 0x1474070d91c0)
0x1474070d91b4   b34  1e2c284c       fadd s12, s2, s12
0x1474070d91b8   b38  14000002       b #+0x8 (addr 0x1474070d91c0)
0x1474070d91bc   b3c  1e22398c       fsub s12, s12, s2
0x1474070d91c0   b40  1e302970       fadd s16, s11, s16
0x1474070d91c4   b44  1e2d09ad       fmul s13, s13, s13
0x1474070d91c8   b48  1e2c098c       fmul s12, s12, s12
0x1474070d91cc   b4c  1e2c29ac       fadd s12, s13, s12
0x1474070d91d0   b50  1e212180       fcmp s12, s1
0x1474070d91d4   b54  1e2b3e0b       fcsel s11, s16, s11, lo
0x1474070d91d8   b58  1e2e294d       fadd s13, s10, s14
0x1474070d91dc   b5c  1e212180       fcmp s12, s1
0x1474070d91e0   b60  1e2a3daa       fcsel s10, s13, s10, lo
0x1474070d91e4   b64  6b1301ff       cmp w15, w19
0x1474070d91e8   b68  54fff761       b.ne #-0x114 (addr 0x1474070d90d4)
0x1474070d91ec   b6c  1100054a       add w10, w10, #0x1 (1)
0x1474070d91f0   b70  7100255f       cmp w10, #0x9 (9)
0x1474070d91f4   b74  54fff5e1       b.ne #-0x144 (addr 0x1474070d90b0)
0x1474070d91f8   b78  f94027eb       ldr x11, [sp, #72]
0x1474070d91fc   b7c  f94033ec       ldr x12, [sp, #96]
0x1474070d9200   b80  f94077ed       ldr x13, [sp, #232]
0x1474070d9204   b84  f94063e2       ldr x2, [sp, #192]
0x1474070d9208   b88  1e2b096c       fmul s12, s11, s11
0x1474070d920c   b8c  1e2a094d       fmul s13, s10, s10
0x1474070d9210   b90  1e2d298c       fadd s12, s12, s13
0x1474070d9214   b94  1e202188       fcmp s12, #0.0
0x1474070d9218   b98  5400010c       b.gt #+0x20 (addr 0x1474070d9238)
0x1474070d921c   b9c  91028126       add x6, x9, #0xa0 (160)
0x1474070d9220   ba0  f866682a       ldr x10, [x1, x6]
0x1474070d9224   ba4  9100054a       add x10, x10, #0x1 (1)
0x1474070d9228   ba8  f826682a       str x10, [x1, x6]
0x1474070d922c   bac  4ea81d0b       mov v11.16b, v8.16b
0x1474070d9230   bb0  4ea71cea       mov v10.16b, v7.16b
0x1474070d9234   bb4  14000004       b #+0x10 (addr 0x1474070d9244)
0x1474070d9238   bb8  1e21c18c       fsqrt s12, s12
0x1474070d923c   bbc  1e2c194a       fdiv s10, s10, s12
0x1474070d9240   bc0  1e2c196b       fdiv s11, s11, s12
0x1474070d9244   bc4  91024126       add x6, x9, #0x90 (144)
0x1474070d9248   bc8  f866682a       ldr x10, [x1, x6]
0x1474070d924c   bcc  d28f82ae       movz x14, #0x7c15
0x1474070d9250   bd0  f2afe94e       movk x14, #0x7f4a, lsl #16
0x1474070d9254   bd4  f2cf372e       movk x14, #0x79b9, lsl #32
0x1474070d9258   bd8  f2f3c6ee       movk x14, #0x9e37, lsl #48
0x1474070d925c   bdc  8b0e014a       add x10, x10, x14
0x1474070d9260   be0  f826682a       str x10, [x1, x6]
0x1474070d9264   be4  ca4a7946       eor x6, x10, x10, lsr #30
0x1474070d9268   be8  d29cb72a       movz x10, #0xe5b9
0x1474070d926c   bec  f2a39c8a       movk x10, #0x1ce4, lsl #16
0x1474070d9270   bf0  f2c8edaa       movk x10, #0x476d, lsl #32
0x1474070d9274   bf4  f2f7eb0a       movk x10, #0xbf58, lsl #48
0x1474070d9278   bf8  9b0a7cc6       mul x6, x6, x10
0x1474070d927c   bfc  ca466cc6       eor x6, x6, x6, lsr #27
0x1474070d9280   c00  d2823d6a       movz x10, #0x11eb
0x1474070d9284   c04  f2a2662a       movk x10, #0x1331, lsl #16
0x1474070d9288   c08  f2c9376a       movk x10, #0x49bb, lsl #32
0x1474070d928c   c0c  f2f29a0a       movk x10, #0x94d0, lsl #48
0x1474070d9290   c10  9b0a7cc6       mul x6, x6, x10
0x1474070d9294   c14  d36bfcca       lsr x10, x6, #43
0x1474070d9298   c18  ca463146       eor x6, x10, x6, lsr #12
0x1474070d929c   c1c  b24c24c6       orr x6, x6, #0x3ff0000000000000
0x1474070d92a0   c20  9e6700cc       fmov d12, x6
0x1474070d92a4   c24  1e7e100d       fmov d13, #0xf0 (-1.0000)
0x1474070d92a8   c28  1e6d298c       fadd d12, d12, d13
0x1474070d92ac   c2c  1e7c100d       fmov d13, #0xe0 (-0.5000)
0x1474070d92b0   c30  1e6d298c       fadd d12, d12, d13
0x1474070d92b4   c34  9102d126       add x6, x9, #0xb4 (180)
0x1474070d92b8   c38  bc66682d       ldr s13, [x1, x6]
0x1474070d92bc   c3c  1e22c1ad       fcvt d13, s13
0x1474070d92c0   c40  1e6d098c       fmul d12, d12, d13
0x1474070d92c4   c44  1e624180       fcvt s0, d12
0x1474070d92c8   c48  fd006fea       str d10, [sp, #216]
0x1474070d92cc   c4c  fd006beb       str d11, [sp, #208]
0x1474070d92d0   c50  fd003be0       str d0, [sp, #112]
0x1474070d92d4   c54  f9408be7       ldr x7, [sp, #272]
0x1474070d92d8   c58  97fabf09       bl #-0x1503dc (addr 0x147406f88efc)
0x1474070d92dc   c5c  fd0037e0       str d0, [sp, #104]
0x1474070d92e0   c60  fd403be0       ldr d0, [sp, #112]
0x1474070d92e4   c64  f9408be7       ldr x7, [sp, #272]
0x1474070d92e8   c68  97fabf06       bl #-0x1503e8 (addr 0x147406f88f00)
0x1474070d92ec   c6c  f9407be1       ldr x1, [sp, #240]
0x1474070d92f0   c70  9102c026       add x6, x1, #0xb0 (176)
0x1474070d92f4   c74  f9407fe8       ldr x8, [sp, #248]
0x1474070d92f8   c78  bc666901       ldr s1, [x8, x6]
0x1474070d92fc   c7c  fd403fe2       ldr d2, [sp, #120]
0x1474070d9300   c80  1e210842       fmul s2, s2, s1
0x1474070d9304   c84  fd4043e3       ldr d3, [sp, #128]
0x1474070d9308   c88  1e222862       fadd s2, s3, s2
0x1474070d930c   c8c  f94047e6       ldr x6, [sp, #136]
0x1474070d9310   c90  bc666903       ldr s3, [x8, x6]
0x1474070d9314   c94  1e222060       fcmp s3, s2
0x1474070d9318   c98  540000a9       b.ls #+0x14 (addr 0x1474070d932c)
0x1474070d931c   c9c  1e202048       fcmp s2, #0.0
0x1474070d9320   ca0  54000082       b.hs #+0x10 (addr 0x1474070d9330)
0x1474070d9324   ca4  1e222862       fadd s2, s3, s2
0x1474070d9328   ca8  14000002       b #+0x8 (addr 0x1474070d9330)
0x1474070d932c   cac  1e233842       fsub s2, s2, s3
0x1474070d9330   cb0  fd404be4       ldr d4, [sp, #144]
0x1474070d9334   cb4  1e210881       fmul s1, s4, s1
0x1474070d9338   cb8  fd404fe4       ldr d4, [sp, #152]
0x1474070d933c   cbc  1e212881       fadd s1, s4, s1
0x1474070d9340   cc0  1e212060       fcmp s3, s1
0x1474070d9344   cc4  540000a9       b.ls #+0x14 (addr 0x1474070d9358)
0x1474070d9348   cc8  1e202028       fcmp s1, #0.0
0x1474070d934c   ccc  54000082       b.hs #+0x10 (addr 0x1474070d935c)
0x1474070d9350   cd0  1e212861       fadd s1, s3, s1
0x1474070d9354   cd4  14000002       b #+0x8 (addr 0x1474070d935c)
0x1474070d9358   cd8  1e233821       fsub s1, s1, s3
0x1474070d935c   cdc  f94073ea       ldr x10, [sp, #224]
0x1474070d9360   ce0  f94053e9       ldr x9, [sp, #160]
0x1474070d9364   ce4  6b0a013f       cmp w9, w10
0x1474070d9368   ce8  540004c9       b.ls #+0x98 (addr 0x1474070d9400)
0x1474070d936c   cec  f94063eb       ldr x11, [sp, #192]
0x1474070d9370   cf0  f94057ec       ldr x12, [sp, #168]
0x1474070d9374   cf4  0b0b018d       add w13, w12, w11
0x1474070d9378   cf8  1e222060       fcmp s3, s2
0x1474070d937c   cfc  1e229de2       fcsel s2, s15, s2, ls
0x1474070d9380   d00  bc2d6902       str s2, [x8, x13]
0x1474070d9384   d04  f9405bed       ldr x13, [sp, #176]
0x1474070d9388   d08  0b0b01ae       add w14, w13, w11
0x1474070d938c   d0c  1e212060       fcmp s3, s1
0x1474070d9390   d10  1e219de1       fcsel s1, s15, s1, ls
0x1474070d9394   d14  bc2e6901       str s1, [x8, x14]
0x1474070d9398   d18  f9405fee       ldr x14, [sp, #184]
0x1474070d939c   d1c  0b0b01cf       add w15, w14, w11
0x1474070d93a0   d20  fd406beb       ldr d11, [sp, #208]
0x1474070d93a4   d24  1e200961       fmul s1, s11, s0
0x1474070d93a8   d28  fd406fea       ldr d10, [sp, #216]
0x1474070d93ac   d2c  fd4037e2       ldr d2, [sp, #104]
0x1474070d93b0   d30  1e220943       fmul s3, s10, s2
0x1474070d93b4   d34  1e233821       fsub s1, s1, s3
0x1474070d93b8   d38  bc2f6901       str s1, [x8, x15]
0x1474070d93bc   d3c  f94067ef       ldr x15, [sp, #200]
0x1474070d93c0   d40  0b0b01eb       add w11, w15, w11
0x1474070d93c4   d44  1e220961       fmul s1, s11, s2
0x1474070d93c8   d48  1e200942       fmul s2, s10, s0
0x1474070d93cc   d4c  1e222821       fadd s1, s1, s2
0x1474070d93d0   d50  bc2b6901       str s1, [x8, x11]
0x1474070d93d4   d54  aa0103e9       mov x9, x1
0x1474070d93d8   d58  aa0803e1       mov x1, x8
0x1474070d93dc   d5c  f94083e8       ldr x8, [sp, #256]
0x1474070d93e0   d60  f94077ed       ldr x13, [sp, #232]
0x1474070d93e4   d64  fd4023e1       ldr d1, [sp, #64]
0x1474070d93e8   d68  fd401fe2       ldr d2, [sp, #56]
0x1474070d93ec   d6c  fd401be3       ldr d3, [sp, #48]
0x1474070d93f0   d70  fd4017e4       ldr d4, [sp, #40]
0x1474070d93f4   d74  f94033ec       ldr x12, [sp, #96]
0x1474070d93f8   d78  f94027eb       ldr x11, [sp, #72]
0x1474070d93fc   d7c  1400000b       b #+0x2c (addr 0x1474070d9428)
0x1474070d9400   d80  aa0103e9       mov x9, x1
0x1474070d9404   d84  aa0803e1       mov x1, x8
0x1474070d9408   d88  f94083e8       ldr x8, [sp, #256]
0x1474070d940c   d8c  f94077ed       ldr x13, [sp, #232]
0x1474070d9410   d90  fd4023e1       ldr d1, [sp, #64]
0x1474070d9414   d94  fd401fe2       ldr d2, [sp, #56]
0x1474070d9418   d98  fd401be3       ldr d3, [sp, #48]
0x1474070d941c   d9c  fd4017e4       ldr d4, [sp, #40]
0x1474070d9420   da0  f94033ec       ldr x12, [sp, #96]
0x1474070d9424   da4  f94027eb       ldr x11, [sp, #72]
0x1474070d9428   da8  1100054a       add w10, w10, #0x1 (1)
0x1474070d942c   dac  aa0d03e6       mov x6, x13
0x1474070d9430   db0  6b06015f       cmp w10, w6
0x1474070d9434   db4  54ffa261       b.ne #-0xbb4 (addr 0x1474070d8880)
0x1474070d9438   db8  14000011       b #+0x44 (addr 0x1474070d947c)
0x1474070d943c   dbc  d286bf00       movz x0, #0x35f8
0x1474070d9440   dc0  f2a002c0       movk x0, #0x16, lsl #16
0x1474070d9444   dc4  f9408be7       ldr x7, [sp, #272]
0x1474070d9448   dc8  97fabbbe       bl #-0x151108 (addr 0x147406f88340)
0x1474070d944c   dcc  d2800001       movz x1, #0x0
0x1474070d9450   dd0  6a01003f       tst w1, w1
0x1474070d9454   dd4  54001ce0       b.eq #+0x39c (addr 0x1474070d97f0)
0x1474070d9458   dd8  d4200000       brk #0x0
0x1474070d945c   ddc  d286bf00       movz x0, #0x35f8
0x1474070d9460   de0  f2a002c0       movk x0, #0x16, lsl #16
0x1474070d9464   de4  f9408be7       ldr x7, [sp, #272]
0x1474070d9468   de8  97fabbb6       bl #-0x151128 (addr 0x147406f88340)
0x1474070d946c   dec  d2800001       movz x1, #0x0
0x1474070d9470   df0  6a01003f       tst w1, w1
0x1474070d9474   df4  54001bc0       b.eq #+0x378 (addr 0x1474070d97ec)
0x1474070d9478   df8  d4200000       brk #0x0
0x1474070d947c   dfc  f94087e6       ldr x6, [sp, #264]
0x1474070d9480   e00  9100c12a       add x10, x9, #0x30 (48)
0x1474070d9484   e04  3cea6821       ldr q1, [x1, x10]
0x1474070d9488   e08  3ce96822       ldr q2, [x1, x9]
0x1474070d948c   e0c  3caa6822       str q2, [x1, x10]
0x1474070d9490   e10  3ca96821       str q1, [x1, x9]
0x1474070d9494   e14  9101012a       add x10, x9, #0x40 (64)
0x1474070d9498   e18  3cea6821       ldr q1, [x1, x10]
0x1474070d949c   e1c  9100412b       add x11, x9, #0x10 (16)
0x1474070d94a0   e20  3ceb6822       ldr q2, [x1, x11]
0x1474070d94a4   e24  3caa6822       str q2, [x1, x10]
0x1474070d94a8   e28  3cab6821       str q1, [x1, x11]
0x1474070d94ac   e2c  9101412a       add x10, x9, #0x50 (80)
0x1474070d94b0   e30  3cea6821       ldr q1, [x1, x10]
0x1474070d94b4   e34  9100812b       add x11, x9, #0x20 (32)
0x1474070d94b8   e38  3ceb6822       ldr q2, [x1, x11]
0x1474070d94bc   e3c  3caa6822       str q2, [x1, x10]
0x1474070d94c0   e40  3cab6821       str q1, [x1, x11]
0x1474070d94c4   e44  91026129       add x9, x9, #0x98 (152)
0x1474070d94c8   e48  f869682a       ldr x10, [x1, x9]
0x1474070d94cc   e4c  9100054a       add x10, x10, #0x1 (1)
0x1474070d94d0   e50  f829682a       str x10, [x1, x9]
0x1474070d94d4   e54  aa0803e1       mov x1, x8
0x1474070d94d8   e58  11014021       add w1, w1, #0x50 (80)
0x1474070d94dc   e5c  b90000c1       str w1, [x6]
0x1474070d94e0   e60  910003bf       mov sp, fp
0x1474070d94e4   e64  a8c17bfd       ldp fp, lr, [sp], #16
0x1474070d94e8   e68  d65f03c0       ret
0x1474070d94ec   e6c  f9006be0       str x0, [sp, #208]
0x1474070d94f0   e70  97fac1b8       bl #-0x14f920 (addr 0x147406f89bd0)
0x1474070d94f4   e74  f9407fe1       ldr x1, [sp, #248]
0x1474070d94f8   e78  f9408be7       ldr x7, [sp, #272]
0x1474070d94fc   e7c  f9406be0       ldr x0, [sp, #208]
0x1474070d9500   e80  17fffc6a       b #-0xe58 (addr 0x1474070d86a8)
0x1474070d9504   e84  1e642080       fcmp d4, d4
0x1474070d9508   e88  54000060       b.eq #+0xc (addr 0x1474070d9514)
0x1474070d950c   e8c  d280000c       movz x12, #0x0
0x1474070d9510   e90  17fffc92       b #-0xdb8 (addr 0x1474070d8758)
0x1474070d9514   e94  1e202068       fcmp s3, #0.0
0x1474070d9518   e98  54ffffa3       b.lo #-0xc (addr 0x1474070d950c)
0x1474070d951c   e9c  9280000c       movn x12, #0x0
0x1474070d9520   ea0  17fffc8e       b #-0xdc8 (addr 0x1474070d8758)
0x1474070d9524   ea4  f90073ea       str x10, [sp, #224]
0x1474070d9528   ea8  97fac1aa       bl #-0x14f958 (addr 0x147406f89bd0)
0x1474070d952c   eac  f94083e8       ldr x8, [sp, #256]
0x1474070d9530   eb0  f9407fe1       ldr x1, [sp, #248]
0x1474070d9534   eb4  f9407be9       ldr x9, [sp, #240]
0x1474070d9538   eb8  f94077ed       ldr x13, [sp, #232]
0x1474070d953c   ebc  f94073ea       ldr x10, [sp, #224]
0x1474070d9540   ec0  fd4023e1       ldr d1, [sp, #64]
0x1474070d9544   ec4  fd401fe2       ldr d2, [sp, #56]
0x1474070d9548   ec8  fd401be3       ldr d3, [sp, #48]
0x1474070d954c   ecc  fd4017e4       ldr d4, [sp, #40]
0x1474070d9550   ed0  f94033ec       ldr x12, [sp, #96]
0x1474070d9554   ed4  f94027eb       ldr x11, [sp, #72]
0x1474070d9558   ed8  17fffcce       b #-0xcc8 (addr 0x1474070d8890)
0x1474070d955c   edc  fd006fea       str d10, [sp, #216]
0x1474070d9560   ee0  fd006beb       str d11, [sp, #208]
0x1474070d9564   ee4  f9002be6       str x6, [sp, #80]
0x1474070d9568   ee8  f9003bf9       str x25, [sp, #112]
0x1474070d956c   eec  97fac199       bl #-0x14f99c (addr 0x147406f89bd0)
0x1474070d9570   ef0  f94083e8       ldr x8, [sp, #256]
0x1474070d9574   ef4  f9407fe1       ldr x1, [sp, #248]
0x1474070d9578   ef8  f9407be9       ldr x9, [sp, #240]
0x1474070d957c   efc  f94077ed       ldr x13, [sp, #232]
0x1474070d9580   f00  f94063e2       ldr x2, [sp, #192]
0x1474070d9584   f04  fd404fe9       ldr d9, [sp, #152]
0x1474070d9588   f08  fd404be7       ldr d7, [sp, #144]
0x1474070d958c   f0c  fd4043e6       ldr d6, [sp, #128]
0x1474070d9590   f10  fd403fe8       ldr d8, [sp, #120]
0x1474070d9594   f14  fd406fea       ldr d10, [sp, #216]
0x1474070d9598   f18  fd406beb       ldr d11, [sp, #208]
0x1474070d959c   f1c  fd4023e1       ldr d1, [sp, #64]
0x1474070d95a0   f20  fd401fe2       ldr d2, [sp, #56]
0x1474070d95a4   f24  fd401be3       ldr d3, [sp, #48]
0x1474070d95a8   f28  fd4017e4       ldr d4, [sp, #40]
0x1474070d95ac   f2c  f94013e0       ldr x0, [sp, #32]
0x1474070d95b0   f30  f9400fe5       ldr x5, [sp, #24]
0x1474070d95b4   f34  f9400be4       ldr x4, [sp, #16]
0x1474070d95b8   f38  f94007e3       ldr x3, [sp, #8]
0x1474070d95bc   f3c  f9402be6       ldr x6, [sp, #80]
0x1474070d95c0   f40  f9403bf9       ldr x25, [sp, #112]
0x1474070d95c4   f44  f94033ec       ldr x12, [sp, #96]
0x1474070d95c8   f48  f94027eb       ldr x11, [sp, #72]
0x1474070d95cc   f4c  17fffced       b #-0xc4c (addr 0x1474070d8980)
0x1474070d95d0   f50  fd006fea       str d10, [sp, #216]
0x1474070d95d4   f54  fd006beb       str d11, [sp, #208]
0x1474070d95d8   f58  f9002be6       str x6, [sp, #80]
0x1474070d95dc   f5c  f90037fb       str cp, [sp, #104]
0x1474070d95e0   f60  f9002ff8       str x24, [sp, #88]
0x1474070d95e4   f64  f9003bf9       str x25, [sp, #112]
0x1474070d95e8   f68  97fac17a       bl #-0x14fa18 (addr 0x147406f89bd0)
0x1474070d95ec   f6c  f94083e8       ldr x8, [sp, #256]
0x1474070d95f0   f70  f9407fe1       ldr x1, [sp, #248]
0x1474070d95f4   f74  f9407be9       ldr x9, [sp, #240]
0x1474070d95f8   f78  f94077ed       ldr x13, [sp, #232]
0x1474070d95fc   f7c  f94063e2       ldr x2, [sp, #192]
0x1474070d9600   f80  fd404fe9       ldr d9, [sp, #152]
0x1474070d9604   f84  fd404be7       ldr d7, [sp, #144]
0x1474070d9608   f88  fd4043e6       ldr d6, [sp, #128]
0x1474070d960c   f8c  fd403fe8       ldr d8, [sp, #120]
0x1474070d9610   f90  fd406fea       ldr d10, [sp, #216]
0x1474070d9614   f94  fd406beb       ldr d11, [sp, #208]
0x1474070d9618   f98  fd4023e1       ldr d1, [sp, #64]
0x1474070d961c   f9c  fd401fe2       ldr d2, [sp, #56]
0x1474070d9620   fa0  fd401be3       ldr d3, [sp, #48]
0x1474070d9624   fa4  fd4017e4       ldr d4, [sp, #40]
0x1474070d9628   fa8  f94013e0       ldr x0, [sp, #32]
0x1474070d962c   fac  f9400fe5       ldr x5, [sp, #24]
0x1474070d9630   fb0  f9400be4       ldr x4, [sp, #16]
0x1474070d9634   fb4  f94007e3       ldr x3, [sp, #8]
0x1474070d9638   fb8  f9402be6       ldr x6, [sp, #80]
0x1474070d963c   fbc  f94037fb       ldr cp, [sp, #104]
0x1474070d9640   fc0  f9402ff8       ldr x24, [sp, #88]
0x1474070d9644   fc4  f9403bf9       ldr x25, [sp, #112]
0x1474070d9648   fc8  f94033ec       ldr x12, [sp, #96]
0x1474070d964c   fcc  f94027eb       ldr x11, [sp, #72]
0x1474070d9650   fd0  17fffcdc       b #-0xc90 (addr 0x1474070d89c0)
0x1474070d9654   fd4  1e6c2180       fcmp d12, d12
0x1474070d9658   fd8  54000060       b.eq #+0xc (addr 0x1474070d9664)
0x1474070d965c   fdc  d280000e       movz x14, #0x0
0x1474070d9660   fe0  17fffd1e       b #-0xb88 (addr 0x1474070d8ad8)
0x1474070d9664   fe4  1e202168       fcmp s11, #0.0
0x1474070d9668   fe8  54ffffa3       b.lo #-0xc (addr 0x1474070d965c)
0x1474070d966c   fec  9280000e       movn x14, #0x0
0x1474070d9670   ff0  17fffd1a       b #-0xb98 (addr 0x1474070d8ad8)
0x1474070d9674   ff4  1e6b2160       fcmp d11, d11
0x1474070d9678   ff8  54000060       b.eq #+0xc (addr 0x1474070d9684)
0x1474070d967c   ffc  d280000f       movz x15, #0x0
0x1474070d9680  1000  17fffd30       b #-0xb40 (addr 0x1474070d8b40)
0x1474070d9684  1004  1e202148       fcmp s10, #0.0
0x1474070d9688  1008  54ffffa3       b.lo #-0xc (addr 0x1474070d967c)
0x1474070d968c  100c  9280000f       movn x15, #0x0
0x1474070d9690  1010  17fffd2c       b #-0xb50 (addr 0x1474070d8b40)
0x1474070d9694  1014  f9003bea       str x10, [sp, #112]
0x1474070d9698  1018  fd006fea       str d10, [sp, #216]
0x1474070d969c  101c  fd006beb       str d11, [sp, #208]
0x1474070d96a0  1020  f9002be6       str x6, [sp, #80]
0x1474070d96a4  1024  97fac14b       bl #-0x14fad4 (addr 0x147406f89bd0)
0x1474070d96a8  1028  f94083e8       ldr x8, [sp, #256]
0x1474070d96ac  102c  f9407fe1       ldr x1, [sp, #248]
0x1474070d96b0  1030  f9407be9       ldr x9, [sp, #240]
0x1474070d96b4  1034  fd404fe9       ldr d9, [sp, #152]
0x1474070d96b8  1038  fd404be7       ldr d7, [sp, #144]
0x1474070d96bc  103c  fd4043e6       ldr d6, [sp, #128]
0x1474070d96c0  1040  fd403fe8       ldr d8, [sp, #120]
0x1474070d96c4  1044  f9403bea       ldr x10, [sp, #112]
0x1474070d96c8  1048  fd406fea       ldr d10, [sp, #216]
0x1474070d96cc  104c  fd406beb       ldr d11, [sp, #208]
0x1474070d96d0  1050  fd4023e1       ldr d1, [sp, #64]
0x1474070d96d4  1054  fd401fe2       ldr d2, [sp, #56]
0x1474070d96d8  1058  fd401be3       ldr d3, [sp, #48]
0x1474070d96dc  105c  fd4017e4       ldr d4, [sp, #40]
0x1474070d96e0  1060  f94013ee       ldr x14, [sp, #32]
0x1474070d96e4  1064  f9400fed       ldr x13, [sp, #24]
0x1474070d96e8  1068  f9400bec       ldr x12, [sp, #16]
0x1474070d96ec  106c  f94007eb       ldr x11, [sp, #8]
0x1474070d96f0  1070  f9402be6       ldr x6, [sp, #80]
0x1474070d96f4  1074  f94003f6       ldr x22, [sp]
0x1474070d96f8  1078  17fffe71       b #-0x63c (addr 0x1474070d90bc)
0x1474070d96fc  107c  f9003bea       str x10, [sp, #112]
0x1474070d9700  1080  fd006fea       str d10, [sp, #216]
0x1474070d9704  1084  fd006beb       str d11, [sp, #208]
0x1474070d9708  1088  f90037f3       str x19, [sp, #104]
0x1474070d970c  108c  f9002be6       str x6, [sp, #80]
0x1474070d9710  1090  f9002fef       str x15, [sp, #88]
0x1474070d9714  1094  97fac12f       bl #-0x14fb44 (addr 0x147406f89bd0)
0x1474070d9718  1098  f94083e8       ldr x8, [sp, #256]
0x1474070d971c  109c  f9407fe1       ldr x1, [sp, #248]
0x1474070d9720  10a0  f9407be9       ldr x9, [sp, #240]
0x1474070d9724  10a4  fd404fe9       ldr d9, [sp, #152]
0x1474070d9728  10a8  fd404be7       ldr d7, [sp, #144]
0x1474070d972c  10ac  fd4043e6       ldr d6, [sp, #128]
0x1474070d9730  10b0  fd403fe8       ldr d8, [sp, #120]
0x1474070d9734  10b4  f9403bea       ldr x10, [sp, #112]
0x1474070d9738  10b8  fd406fea       ldr d10, [sp, #216]
0x1474070d973c  10bc  fd406beb       ldr d11, [sp, #208]
0x1474070d9740  10c0  f94037f3       ldr x19, [sp, #104]
0x1474070d9744  10c4  fd4023e1       ldr d1, [sp, #64]
0x1474070d9748  10c8  fd401fe2       ldr d2, [sp, #56]
0x1474070d974c  10cc  fd401be3       ldr d3, [sp, #48]
0x1474070d9750  10d0  fd4017e4       ldr d4, [sp, #40]
0x1474070d9754  10d4  f94013ee       ldr x14, [sp, #32]
0x1474070d9758  10d8  f9400fed       ldr x13, [sp, #24]
0x1474070d975c  10dc  f9400bec       ldr x12, [sp, #16]
0x1474070d9760  10e0  f94007eb       ldr x11, [sp, #8]
0x1474070d9764  10e4  f9402be6       ldr x6, [sp, #80]
0x1474070d9768  10e8  f9402fef       ldr x15, [sp, #88]
0x1474070d976c  10ec  f94003f6       ldr x22, [sp]
0x1474070d9770  10f0  17fffe5c       b #-0x690 (addr 0x1474070d90e0)
0x1474070d9774  10f4  f9003bea       str x10, [sp, #112]
0x1474070d9778  10f8  fd006fea       str d10, [sp, #216]
0x1474070d977c  10fc  fd006beb       str d11, [sp, #208]
0x1474070d9780  1100  f90037f3       str x19, [sp, #104]
0x1474070d9784  1104  f9002ff4       str x20, [sp, #88]
0x1474070d9788  1108  f9002be6       str x6, [sp, #80]
0x1474070d978c  110c  97fac111       bl #-0x14fbbc (addr 0x147406f89bd0)
0x1474070d9790  1110  f94083e8       ldr x8, [sp, #256]
0x1474070d9794  1114  f9407fe1       ldr x1, [sp, #248]
0x1474070d9798  1118  f9407be9       ldr x9, [sp, #240]
0x1474070d979c  111c  fd404fe9       ldr d9, [sp, #152]
0x1474070d97a0  1120  fd404be7       ldr d7, [sp, #144]
0x1474070d97a4  1124  fd4043e6       ldr d6, [sp, #128]
0x1474070d97a8  1128  fd403fe8       ldr d8, [sp, #120]
0x1474070d97ac  112c  f9403bea       ldr x10, [sp, #112]
0x1474070d97b0  1130  fd406fea       ldr d10, [sp, #216]
0x1474070d97b4  1134  fd406beb       ldr d11, [sp, #208]
0x1474070d97b8  1138  f94037f3       ldr x19, [sp, #104]
0x1474070d97bc  113c  fd4023e1       ldr d1, [sp, #64]
0x1474070d97c0  1140  fd401fe2       ldr d2, [sp, #56]
0x1474070d97c4  1144  fd401be3       ldr d3, [sp, #48]
0x1474070d97c8  1148  fd4017e4       ldr d4, [sp, #40]
0x1474070d97cc  114c  f94013ee       ldr x14, [sp, #32]
0x1474070d97d0  1150  f9400fed       ldr x13, [sp, #24]
0x1474070d97d4  1154  f9400bec       ldr x12, [sp, #16]
0x1474070d97d8  1158  f94007eb       ldr x11, [sp, #8]
0x1474070d97dc  115c  f9402ff4       ldr x20, [sp, #88]
0x1474070d97e0  1160  f9402be6       ldr x6, [sp, #80]
0x1474070d97e4  1164  f94003f6       ldr x22, [sp]
0x1474070d97e8  1168  17fffe53       b #-0x6b4 (addr 0x1474070d9134)
0x1474070d97ec  116c  97fac045       bl #-0x14feec (addr 0x147406f89900)
0x1474070d97f0  1170  97fac044       bl #-0x14fef0 (addr 0x147406f89900)
0x1474070d97f4  1174  d503201f       nop

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
0x1474070d87ac    12c  slots (sp->fp): 00000000000000000000000000000000000000

RelocInfo (size = 39)
0x1474070d87a8  internal wasm call
0x1474070d92d8  internal wasm call
0x1474070d92e8  internal wasm call
0x1474070d9448  internal wasm call
0x1474070d9468  internal wasm call
0x1474070d94f0  wasm stub call  (0x147406f89bd0)
0x1474070d9528  wasm stub call  (0x147406f89bd0)
0x1474070d956c  wasm stub call  (0x147406f89bd0)
0x1474070d95e8  wasm stub call  (0x147406f89bd0)
0x1474070d96a4  wasm stub call  (0x147406f89bd0)
0x1474070d9714  wasm stub call  (0x147406f89bd0)
0x1474070d978c  wasm stub call  (0x147406f89bd0)
0x1474070d97ec  wasm stub call  (0x147406f89900)
0x1474070d97f0  wasm stub call  (0x147406f89900)
