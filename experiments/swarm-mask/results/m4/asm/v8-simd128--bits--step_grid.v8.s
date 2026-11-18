name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 4800 = 4800 + 0 padding)
Instructions (size = 4776)
0xf8fe33c5340     0  d2800110       movz x16, #0x8
0xf8fe33c5344     4  a9be43e7       stp x7, x16, [sp, #-32]!
0xf8fe33c5348     8  a9017bfd       stp fp, lr, [sp, #16]
0xf8fe33c534c     c  910043fd       add fp, sp, #0x10 (16)
0xf8fe33c5350    10  d107c3ff       sub sp, sp, #0x1f0 (496)
0xf8fe33c5354    14  f841f0e1       ldur x1, [x7, #31]
0xf8fe33c5358    18  f8520346       ldur x6, [x26, #-224]
0xf8fe33c535c    1c  f9008fe0       str x0, [sp, #280]
0xf8fe33c5360    20  f90063e1       str x1, [sp, #192]
0xf8fe33c5364    24  eb2663ff       cmp sp, x6
0xf8fe33c5368    28  54006329       b.ls #+0xc64 (addr 0xf8fe33c5fcc)
0xf8fe33c536c    2c  f842f0e6       ldur x6, [x7, #47]
0xf8fe33c5370    30  b94000c8       ldr w8, [x6]
0xf8fe33c5374    34  51014104       sub w4, w8, #0x50 (80)
0xf8fe33c5378    38  b90000c4       str w4, [x6]
0xf8fe33c537c    3c  2a0003e8       mov w8, w0
0xf8fe33c5380    40  91024029       add x9, x1, #0x90 (144)
0xf8fe33c5384    44  fc686922       ldr d2, [x9, x8]
0xf8fe33c5388    48  5e0c0441       mov s1, v2.s[1]
0xf8fe33c538c    4c  52a75010       movz w16, #0x3a800000
0xf8fe33c5390    50  1e270203       fmov s3, w16
0xf8fe33c5394    54  1e230824       fmul s4, s1, s3
0xf8fe33c5398    58  5e040440       mov s0, v2.s[0]
0xf8fe33c539c    5c  1e230803       fmul s3, s0, s3
0xf8fe33c53a0    60  91028109       add x9, x8, #0xa0 (160)
0xf8fe33c53a4    64  bc696825       ldr s5, [x1, x9]
0xf8fe33c53a8    68  1e2520a0       fcmp s5, s5
0xf8fe33c53ac    6c  1e251c65       fcsel s5, s3, s5, ne
0xf8fe33c53b0    70  1e232060       fcmp s3, s3
0xf8fe33c53b4    74  1e231ca3       fcsel s3, s5, s3, ne
0xf8fe33c53b8    78  1e252060       fcmp s3, s5
0xf8fe33c53bc    7c  1e233ca3       fcsel s3, s5, s3, lo
0xf8fe33c53c0    80  1e232060       fcmp s3, s3
0xf8fe33c53c4    84  1e231c83       fcsel s3, s4, s3, ne
0xf8fe33c53c8    88  1e242080       fcmp s4, s4
0xf8fe33c53cc    8c  1e241c64       fcsel s4, s3, s4, ne
0xf8fe33c53d0    90  1e232080       fcmp s4, s3
0xf8fe33c53d4    94  1e243c63       fcsel s3, s3, s4, lo
0xf8fe33c53d8    98  52840010       movz w16, #0x2000
0xf8fe33c53dc    9c  72a7f010       movk w16, #0x3f80, lsl #16
0xf8fe33c53e0    a0  1e270204       fmov s4, w16
0xf8fe33c53e4    a4  1e240863       fmul s3, s3, s4
0xf8fe33c53e8    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0xf8fe33c53ec    ac  1e231883       fdiv s3, s4, s3
0xf8fe33c53f0    b0  9102110a       add x10, x8, #0x84 (132)
0xf8fe33c53f4    b4  bc2a6823       str s3, [x1, x10]
0xf8fe33c53f8    b8  4e040463       dup v3.4s, v3.s[0]
0xf8fe33c53fc    bc  6e23dc42       fmul v2.4s, v2.4s, v3.4s
0xf8fe33c5400    c0  4ea18842       frintp v2.4s, v2.4s
0xf8fe33c5404    c4  5e040443       mov s3, v2.s[0]
0xf8fe33c5408    c8  1e22c065       fcvt d5, s3
0xf8fe33c540c    cc  1e65c0a6       frintz d6, d5
0xf8fe33c5410    d0  1e7900cb       fcvtzu w11, d6
0xf8fe33c5414    d4  1e630167       ucvtf d7, w11
0xf8fe33c5418    d8  f900f7e6       str x6, [sp, #488]
0xf8fe33c541c    dc  f900f3e4       str x4, [sp, #480]
0xf8fe33c5420    e0  f900ebe8       str x8, [sp, #464]
0xf8fe33c5424    e4  fd00c3e1       str d1, [sp, #384]
0xf8fe33c5428    e8  fd00c7e0       str d0, [sp, #392]
0xf8fe33c542c    ec  f900b7e9       str x9, [sp, #360]
0xf8fe33c5430    f0  f900dfea       str x10, [sp, #440]
0xf8fe33c5434    f4  1e6720c0       fcmp d6, d7
0xf8fe33c5438    f8  54005d41       b.ne #+0xba8 (addr 0xf8fe33c5fe0)
0xf8fe33c543c    fc  4e040d63       dup v3.4s, w11
0xf8fe33c5440   100  5e0c0445       mov s5, v2.s[1]
0xf8fe33c5444   104  1e22c0a6       fcvt d6, s5
0xf8fe33c5448   108  1e65c0c7       frintz d7, d6
0xf8fe33c544c   10c  1e7900eb       fcvtzu w11, d7
0xf8fe33c5450   110  1e630168       ucvtf d8, w11
0xf8fe33c5454   114  1e6820e0       fcmp d7, d8
0xf8fe33c5458   118  54005da1       b.ne #+0xbb4 (addr 0xf8fe33c600c)
0xf8fe33c545c   11c  4e0c1d63       mov v3.s[1], w11
0xf8fe33c5460   120  4f000425       movi v5.4s, #0x1, lsl #0
0xf8fe33c5464   124  6ea56463       umax v3.4s, v3.4s, v5.4s
0xf8fe33c5468   128  6f00e406       movi v6.2d, #0x0
0xf8fe33c546c   12c  6ea0c847       fcmge v7.4s, v2.4s, #0.0
0xf8fe33c5470   130  52a9f010       movz w16, #0x4f800000
0xf8fe33c5474   134  4e040e08       dup v8.4s, w16
0xf8fe33c5478   138  6ea2e502       fcmgt v2.4s, v8.4s, v2.4s
0xf8fe33c547c   13c  4e221ce2       and v2.16b, v7.16b, v2.16b
0xf8fe33c5480   140  6e651c62       bsl v2.16b, v3.16b, v5.16b
0xf8fe33c5484   144  9102202b       add x11, x1, #0x88 (136)
0xf8fe33c5488   148  8b08016c       add x12, x11, x8
0xf8fe33c548c   14c  0d008582       st1 {v2.d}[0], [x12]
0xf8fe33c5490   150  9103310c       add x12, x8, #0xcc (204)
0xf8fe33c5494   154  b86c682c       ldr w12, [x1, x12]
0xf8fe33c5498   158  9100a08d       add x13, x4, #0x28 (40)
0xf8fe33c549c   15c  b82d682c       str w12, [x1, x13]
0xf8fe33c54a0   160  9103110c       add x12, x8, #0xc4 (196)
0xf8fe33c54a4   164  f86c682c       ldr x12, [x1, x12]
0xf8fe33c54a8   168  9100808d       add x13, x4, #0x20 (32)
0xf8fe33c54ac   16c  f82d682c       str x12, [x1, x13]
0xf8fe33c54b0   170  1101800c       add w12, w0, #0x60 (96)
0xf8fe33c54b4   174  9100110d       add x13, x8, #0x4 (4)
0xf8fe33c54b8   178  b86d6822       ldr w2, [x1, x13]
0xf8fe33c54bc   17c  9100210e       add x14, x8, #0x8 (8)
0xf8fe33c54c0   180  b86e6823       ldr w3, [x1, x14]
0xf8fe33c54c4   184  9100410f       add x15, x8, #0x10 (16)
0xf8fe33c54c8   188  b86f6833       ldr w19, [x1, x15]
0xf8fe33c54cc   18c  91005114       add x20, x8, #0x14 (20)
0xf8fe33c54d0   190  b8746825       ldr w5, [x1, x20]
0xf8fe33c54d4   194  3d8017e5       str q5, [sp, #80]
0xf8fe33c54d8   198  3d800be6       str q6, [sp, #32]
0xf8fe33c54dc   19c  3d8023e8       str q8, [sp, #128]
0xf8fe33c54e0   1a0  f900e3eb       str x11, [sp, #448]
0xf8fe33c54e4   1a4  f900bbed       str x13, [sp, #368]
0xf8fe33c54e8   1a8  f900efee       str x14, [sp, #472]
0xf8fe33c54ec   1ac  f900bfef       str x15, [sp, #376]
0xf8fe33c54f0   1b0  f900e7f4       str x20, [sp, #456]
0xf8fe33c54f4   1b4  aa0c03e0       mov x0, x12
0xf8fe33c54f8   1b8  aa1303e4       mov x4, x19
0xf8fe33c54fc   1bc  97fbe060       bl #-0x107e80 (addr 0xf8fe32bd67c)
0xf8fe33c5500   1c0  f94063e1       ldr x1, [sp, #192]
0xf8fe33c5504   1c4  f940efe6       ldr x6, [sp, #472]
0xf8fe33c5508   1c8  b8666826       ldr w6, [x1, x6]
0xf8fe33c550c   1cc  f900efe6       str x6, [sp, #472]
0xf8fe33c5510   1d0  35000106       cbnz w6, #+0x20 (addr 0xf8fe33c5530)
0xf8fe33c5514   1d4  f940f3e4       ldr x4, [sp, #480]
0xf8fe33c5518   1d8  11014081       add w1, w4, #0x50 (80)
0xf8fe33c551c   1dc  f940f7e8       ldr x8, [sp, #488]
0xf8fe33c5520   1e0  b9000101       str w1, [x8]
0xf8fe33c5524   1e4  910003bf       mov sp, fp
0xf8fe33c5528   1e8  a8c17bfd       ldp fp, lr, [sp], #16
0xf8fe33c552c   1ec  d65f03c0       ret
0xf8fe33c5530   1f0  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c5534   1f4  11028002       add w2, w0, #0xa0 (160)
0xf8fe33c5538   1f8  f940ebe8       ldr x8, [sp, #464]
0xf8fe33c553c   1fc  91017109       add x9, x8, #0x5c (92)
0xf8fe33c5540   200  b8696829       ldr w9, [x1, x9]
0xf8fe33c5544   204  9101410a       add x10, x8, #0x50 (80)
0xf8fe33c5548   208  b86a682a       ldr w10, [x1, x10]
0xf8fe33c554c   20c  9101110b       add x11, x8, #0x44 (68)
0xf8fe33c5550   210  b86b682b       ldr w11, [x1, x11]
0xf8fe33c5554   214  9100e10c       add x12, x8, #0x38 (56)
0xf8fe33c5558   218  b86c682c       ldr w12, [x1, x12]
0xf8fe33c555c   21c  6b0c017f       cmp w11, w12
0xf8fe33c5560   220  1a8c316d       csel w13, w11, w12, lo
0xf8fe33c5564   224  6b0d015f       cmp w10, w13
0xf8fe33c5568   228  1a8d314b       csel w11, w10, w13, lo
0xf8fe33c556c   22c  6b0b013f       cmp w9, w11
0xf8fe33c5570   230  1a8b312a       csel w10, w9, w11, lo
0xf8fe33c5574   234  f940e7e9       ldr x9, [sp, #456]
0xf8fe33c5578   238  b8696829       ldr w9, [x1, x9]
0xf8fe33c557c   23c  9100810b       add x11, x8, #0x20 (32)
0xf8fe33c5580   240  b86b682b       ldr w11, [x1, x11]
0xf8fe33c5584   244  9100b10c       add x12, x8, #0x2c (44)
0xf8fe33c5588   248  b86c682c       ldr w12, [x1, x12]
0xf8fe33c558c   24c  6b0c017f       cmp w11, w12
0xf8fe33c5590   250  1a8c316d       csel w13, w11, w12, lo
0xf8fe33c5594   254  6b0d013f       cmp w9, w13
0xf8fe33c5598   258  1a8d312b       csel w11, w9, w13, lo
0xf8fe33c559c   25c  f940e3ec       ldr x12, [sp, #448]
0xf8fe33c55a0   260  fc686982       ldr d2, [x12, x8]
0xf8fe33c55a4   264  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c55a8   268  4e040464       dup v4.4s, v3.s[0]
0xf8fe33c55ac   26c  6e0c0444       mov v4.s[1], v2.s[0]
0xf8fe33c55b0   270  6ea36442       umax v2.4s, v2.4s, v3.4s
0xf8fe33c55b4   274  6ea38442       sub v2.4s, v2.4s, v3.4s
0xf8fe33c55b8   278  9101610c       add x12, x8, #0x58 (88)
0xf8fe33c55bc   27c  b86c682c       ldr w12, [x1, x12]
0xf8fe33c55c0   280  9101310e       add x14, x8, #0x4c (76)
0xf8fe33c55c4   284  b86e682e       ldr w14, [x1, x14]
0xf8fe33c55c8   288  9101010f       add x15, x8, #0x40 (64)
0xf8fe33c55cc   28c  b86f682f       ldr w15, [x1, x15]
0xf8fe33c55d0   290  9100d113       add x19, x8, #0x34 (52)
0xf8fe33c55d4   294  b8736833       ldr w19, [x1, x19]
0xf8fe33c55d8   298  9101f114       add x20, x8, #0x7c (124)
0xf8fe33c55dc   29c  b8746834       ldr w20, [x1, x20]
0xf8fe33c55e0   2a0  91020115       add x21, x8, #0x80 (128)
0xf8fe33c55e4   2a4  b8756835       ldr w21, [x1, x21]
0xf8fe33c55e8   2a8  91019116       add x22, x8, #0x64 (100)
0xf8fe33c55ec   2ac  b8766836       ldr w22, [x1, x22]
0xf8fe33c55f0   2b0  9101a117       add x23, x8, #0x68 (104)
0xf8fe33c55f4   2b4  b8776837       ldr w23, [x1, x23]
0xf8fe33c55f8   2b8  91022118       add x24, x8, #0x88 (136)
0xf8fe33c55fc   2bc  b8786838       ldr w24, [x1, x24]
0xf8fe33c5600   2c0  f940dff9       ldr x25, [sp, #440]
0xf8fe33c5604   2c4  bc796825       ldr s5, [x1, x25]
0xf8fe33c5608   2c8  91007119       add x25, x8, #0x1c (28)
0xf8fe33c560c   2cc  b8796839       ldr w25, [x1, x25]
0xf8fe33c5610   2d0  9100a11b       add cp, x8, #0x28 (40)
0xf8fe33c5614   2d4  b87b683b       ldr w27, [x1, x27]
0xf8fe33c5618   2d8  f940bffc       ldr x28, [sp, #376]
0xf8fe33c561c   2dc  b87c683c       ldr w28, [x1, x28]
0xf8fe33c5620   2e0  f940bbe3       ldr x3, [sp, #368]
0xf8fe33c5624   2e4  b8636823       ldr w3, [x1, x3]
0xf8fe33c5628   2e8  f940b7e4       ldr x4, [sp, #360]
0xf8fe33c562c   2ec  bc646826       ldr s6, [x1, x4]
0xf8fe33c5630   2f0  1e2608c6       fmul s6, s6, s6
0xf8fe33c5634   2f4  91029108       add x8, x8, #0xa4 (164)
0xf8fe33c5638   2f8  bc686827       ldr s7, [x1, x8]
0xf8fe33c563c   2fc  1e2708e7       fmul s7, s7, s7
0xf8fe33c5640   300  f900cbe2       str x2, [sp, #400]
0xf8fe33c5644   304  f900cfea       str x10, [sp, #408]
0xf8fe33c5648   308  f90087e9       str x9, [sp, #264]
0xf8fe33c564c   30c  f9008bed       str x13, [sp, #272]
0xf8fe33c5650   310  f90037eb       str x11, [sp, #104]
0xf8fe33c5654   314  3d8007e4       str q4, [sp, #16]
0xf8fe33c5658   318  3d8003e2       str q2, [sp]
0xf8fe33c565c   31c  f900e3ec       str x12, [sp, #448]
0xf8fe33c5660   320  f900dbee       str x14, [sp, #432]
0xf8fe33c5664   324  f900d7ef       str x15, [sp, #424]
0xf8fe33c5668   328  f900d3f3       str x19, [sp, #416]
0xf8fe33c566c   32c  f9007ff4       str x20, [sp, #248]
0xf8fe33c5670   330  f9007bf5       str x21, [sp, #240]
0xf8fe33c5674   334  f9005bf6       str x22, [sp, #176]
0xf8fe33c5678   338  f90057f7       str x23, [sp, #168]
0xf8fe33c567c   33c  f9004bf8       str x24, [sp, #144]
0xf8fe33c5680   340  fd005fe5       str d5, [sp, #184]
0xf8fe33c5684   344  f900b3f9       str x25, [sp, #352]
0xf8fe33c5688   348  f900affb       str cp, [sp, #344]
0xf8fe33c568c   34c  f90097fc       str x28, [sp, #296]
0xf8fe33c5690   350  f9009fe3       str x3, [sp, #312]
0xf8fe33c5694   354  fd00a7e6       str d6, [sp, #328]
0xf8fe33c5698   358  fd00abe7       str d7, [sp, #336]
0xf8fe33c569c   35c  aa0103e4       mov x4, x1
0xf8fe33c56a0   360  d2800001       movz x1, #0x0
0xf8fe33c56a4   364  f900e7e1       str x1, [sp, #456]
0xf8fe33c56a8   368  14000016       b #+0x58 (addr 0xf8fe33c5700)
0xf8fe33c56ac   36c  f94037eb       ldr x11, [sp, #104]
0xf8fe33c56b0   370  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c56b4   374  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c56b8   378  aa0d03e4       mov x4, x13
0xf8fe33c56bc   37c  aa0803e6       mov x6, x8
0xf8fe33c56c0   380  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c56c4   384  f940affb       ldr cp, [sp, #344]
0xf8fe33c56c8   388  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c56cc   38c  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c56d0   390  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c56d4   394  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c56d8   398  f94097fc       ldr x28, [sp, #296]
0xf8fe33c56dc   39c  f9408bed       ldr x13, [sp, #272]
0xf8fe33c56e0   3a0  f94087e9       ldr x9, [sp, #264]
0xf8fe33c56e4   3a4  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c56e8   3a8  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c56ec   3ac  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c56f0   3b0  f94057f7       ldr x23, [sp, #168]
0xf8fe33c56f4   3b4  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c56f8   3b8  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c56fc   3bc  3dc003e2       ldr q2, [sp]
0xf8fe33c5700   3c0  f8520345       ldur x5, [x26, #-224]
0xf8fe33c5704   3c4  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c5708   3c8  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c570c   3cc  eb2563ff       cmp sp, x5
0xf8fe33c5710   3d0  540048e9       b.ls #+0x91c (addr 0xf8fe33c602c)
0xf8fe33c5714   3d4  6b01017f       cmp w11, w1
0xf8fe33c5718   3d8  54004429       b.ls #+0x884 (addr 0xf8fe33c5f9c)
0xf8fe33c571c   3dc  531e7425       lsl w5, w1, #2
0xf8fe33c5720   3e0  0b050067       add w7, w3, w5
0xf8fe33c5724   3e4  bc67688b       ldr s11, [x4, x7]
0xf8fe33c5728   3e8  0b050387       add w7, w28, w5
0xf8fe33c572c   3ec  bc67688c       ldr s12, [x4, x7]
0xf8fe33c5730   3f0  0b050327       add w7, w25, w5
0xf8fe33c5734   3f4  bc67688d       ldr s13, [x4, x7]
0xf8fe33c5738   3f8  0b050367       add w7, w27, w5
0xf8fe33c573c   3fc  bc67688e       ldr s14, [x4, x7]
0xf8fe33c5740   400  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c5744   404  91003107       add x7, x8, #0xc (12)
0xf8fe33c5748   408  bc27688e       str s14, [x4, x7]
0xf8fe33c574c   40c  91002107       add x7, x8, #0x8 (8)
0xf8fe33c5750   410  bc27688d       str s13, [x4, x7]
0xf8fe33c5754   414  91001107       add x7, x8, #0x4 (4)
0xf8fe33c5758   418  bc27688c       str s12, [x4, x7]
0xf8fe33c575c   41c  bc28688b       str s11, [x4, x8]
0xf8fe33c5760   420  91012107       add x7, x8, #0x48 (72)
0xf8fe33c5764   424  b827689f       str wzr, [x4, x7]
0xf8fe33c5768   428  9101010a       add x10, x8, #0x40 (64)
0xf8fe33c576c   42c  f82a689f       str xzr, [x4, x10]
0xf8fe33c5770   430  6f00e40d       movi v13.2d, #0x0
0xf8fe33c5774   434  9100c10b       add x11, x8, #0x30 (48)
0xf8fe33c5778   438  3cab688d       str q13, [x4, x11]
0xf8fe33c577c   43c  1e25096d       fmul s13, s11, s5
0xf8fe33c5780   440  1e2541ad       frintm s13, s13
0xf8fe33c5784   444  1e2d21a0       fcmp s13, s13
0xf8fe33c5788   448  1e2d1ded       fcsel s13, s15, s13, ne
0xf8fe33c578c   44c  1e2021a8       fcmp s13, #0.0
0xf8fe33c5790   450  1e2fcdad       fcsel s13, s13, s15, gt
0xf8fe33c5794   454  4e0405ae       dup v14.4s, v13.s[0]
0xf8fe33c5798   458  1e250990       fmul s16, s12, s5
0xf8fe33c579c   45c  1e254210       frintm s16, s16
0xf8fe33c57a0   460  1e302200       fcmp s16, s16
0xf8fe33c57a4   464  1e301df0       fcsel s16, s15, s16, ne
0xf8fe33c57a8   468  1e202208       fcmp s16, #0.0
0xf8fe33c57ac   46c  1e2fce11       fcsel s17, s16, s15, gt
0xf8fe33c57b0   470  f90063e4       str x4, [sp, #192]
0xf8fe33c57b4   474  1e260204       fmov w4, s16
0xf8fe33c57b8   478  6a04009f       tst w4, w4
0xf8fe33c57bc   47c  1e301e30       fcsel s16, s17, s16, ne
0xf8fe33c57c0   480  1e202228       fcmp s17, #0.0
0xf8fe33c57c4   484  1e310e10       fcsel s16, s16, s17, eq
0xf8fe33c57c8   488  6e0c060e       mov v14.s[1], v16.s[0]
0xf8fe33c57cc   48c  6eaee50e       fcmgt v14.4s, v8.4s, v14.4s
0xf8fe33c57d0   490  4e040c11       dup v17.4s, w0
0xf8fe33c57d4   494  1e22c1b2       fcvt d18, s13
0xf8fe33c57d8   498  1e65c253       frintz d19, d18
0xf8fe33c57dc   49c  1e790260       fcvtzu w0, d19
0xf8fe33c57e0   4a0  1e630014       ucvtf d20, w0
0xf8fe33c57e4   4a4  f900ebe1       str x1, [sp, #464]
0xf8fe33c57e8   4a8  f900dfe5       str x5, [sp, #440]
0xf8fe33c57ec   4ac  f900bbea       str x10, [sp, #368]
0xf8fe33c57f0   4b0  f900bfeb       str x11, [sp, #376]
0xf8fe33c57f4   4b4  1e742260       fcmp d19, d20
0xf8fe33c57f8   4b8  54004541       b.ne #+0x8a8 (addr 0xf8fe33c60a0)
0xf8fe33c57fc   4bc  4eb11e2d       mov v13.16b, v17.16b
0xf8fe33c5800   4c0  4e041c0d       mov v13.s[0], w0
0xf8fe33c5804   4c4  1e22c211       fcvt d17, s16
0xf8fe33c5808   4c8  1e65c232       frintz d18, d17
0xf8fe33c580c   4cc  1e790240       fcvtzu w0, d18
0xf8fe33c5810   4d0  1e630013       ucvtf d19, w0
0xf8fe33c5814   4d4  1e732240       fcmp d18, d19
0xf8fe33c5818   4d8  54004541       b.ne #+0x8a8 (addr 0xf8fe33c60c0)
0xf8fe33c581c   4dc  4e0c1c0d       mov v13.s[1], w0
0xf8fe33c5820   4e0  6ead6c4d       umin v13.4s, v2.4s, v13.4s
0xf8fe33c5824   4e4  4e2d1dcd       and v13.16b, v14.16b, v13.16b
0xf8fe33c5828   4e8  4ea385ae       add v14.4s, v13.4s, v3.4s
0xf8fe33c582c   4ec  6eae6c4e       umin v14.4s, v2.4s, v14.4s
0xf8fe33c5830   4f0  4eae9c90       mul v16.4s, v4.4s, v14.4s
0xf8fe33c5834   4f4  0e0c3e00       mov w0, v16.s[1]
0xf8fe33c5838   4f8  0e043da4       mov w4, v13.s[0]
0xf8fe33c583c   4fc  7100009f       cmp w4, #0x0 (0)
0xf8fe33c5840   500  9a9f07ec       cset x12, ne
0xf8fe33c5844   504  4b0c008c       sub w12, w4, w12
0xf8fe33c5848   508  0b0c0004       add w4, w0, w12
0xf8fe33c584c   50c  4eae8490       add v16.4s, v4.4s, v14.4s
0xf8fe33c5850   510  0e043e0e       mov w14, v16.s[0]
0xf8fe33c5854   514  0b0e0000       add w0, w0, w14
0xf8fe33c5858   518  6b17009f       cmp w4, w23
0xf8fe33c585c   51c  7a573002       ccmp w0, w23, #nzCv, lo
0xf8fe33c5860   520  9a9f27ef       cset x15, lo
0xf8fe33c5864   524  0e0c3db3       mov w19, v13.s[1]
0xf8fe33c5868   528  7100027f       cmp w19, #0x0 (0)
0xf8fe33c586c   52c  9a9f07e2       cset x2, ne
0xf8fe33c5870   530  4b020273       sub w19, w19, w2
0xf8fe33c5874   534  0b000ac0       add w0, w22, w0, lsl #2
0xf8fe33c5878   538  0b040ac2       add w2, w22, w4, lsl #2
0xf8fe33c587c   53c  0e0c3dc4       mov w4, v14.s[1]
0xf8fe33c5880   540  f9006fef       str x15, [sp, #216]
0xf8fe33c5884   544  f90073e0       str x0, [sp, #224]
0xf8fe33c5888   548  f90077e2       str x2, [sp, #232]
0xf8fe33c588c   54c  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c5890   550  2f00e40d       movi d13, #0x0
0xf8fe33c5894   554  f9003bf3       str x19, [sp, #112]
0xf8fe33c5898   558  f94063f3       ldr x19, [sp, #192]
0xf8fe33c589c   55c  d2800002       movz x2, #0x0
0xf8fe33c58a0   560  3dc00bf1       ldr q17, [sp, #32]
0xf8fe33c58a4   564  f90093e2       str x2, [sp, #288]
0xf8fe33c58a8   568  4ead1dae       mov v14.16b, v13.16b
0xf8fe33c58ac   56c  4ead1db0       mov v16.16b, v13.16b
0xf8fe33c58b0   570  1400002f       b #+0xbc (addr 0xf8fe33c596c)
0xf8fe33c58b4   574  531e756b       lsl w11, w11, #2
0xf8fe33c58b8   578  0b0b0386       add w6, w28, w11
0xf8fe33c58bc   57c  bc666a72       ldr s18, [x19, x6]
0xf8fe33c58c0   580  1e323993       fsub s19, s12, s18
0xf8fe33c58c4   584  0b0b0066       add w6, w3, w11
0xf8fe33c58c8   588  bc666a74       ldr s20, [x19, x6]
0xf8fe33c58cc   58c  1e343975       fsub s21, s11, s20
0xf8fe33c58d0   590  1e350ab6       fmul s22, s21, s21
0xf8fe33c58d4   594  1e330a77       fmul s23, s19, s19
0xf8fe33c58d8   598  1e372ad6       fadd s22, s22, s23
0xf8fe33c58dc   59c  1e2722c0       fcmp s22, s7
0xf8fe33c58e0   5a0  1e2f3d57       fcsel s23, s10, s15, lo
0xf8fe33c58e4   5a4  1e370a73       fmul s19, s19, s23
0xf8fe33c58e8   5a8  1e332a10       fadd s16, s16, s19
0xf8fe33c58ec   5ac  bc276a70       str s16, [x19, x7]
0xf8fe33c58f0   5b0  1e370ab3       fmul s19, s21, s23
0xf8fe33c58f4   5b4  1e3329ce       fadd s14, s14, s19
0xf8fe33c58f8   5b8  91011106       add x6, x8, #0x44 (68)
0xf8fe33c58fc   5bc  bc266a6e       str s14, [x19, x6]
0xf8fe33c5900   5c0  1e2622c0       fcmp s22, s6
0xf8fe33c5904   5c4  1e2f3d53       fcsel s19, s10, s15, lo
0xf8fe33c5908   5c8  1e3620e0       fcmp s7, s22
0xf8fe33c590c   5cc  1e2f9e73       fcsel s19, s19, s15, ls
0xf8fe33c5910   5d0  1e2022c8       fcmp s22, #0.0
0xf8fe33c5914   5d4  1e2fce73       fcsel s19, s19, s15, gt
0xf8fe33c5918   5d8  1e3329ad       fadd s13, s13, s19
0xf8fe33c591c   5dc  f940bbe0       ldr x0, [sp, #368]
0xf8fe33c5920   5e0  bc206a6d       str s13, [x19, x0]
0xf8fe33c5924   5e4  0b0b0366       add w6, w27, w11
0xf8fe33c5928   5e8  0b0b032b       add w11, w25, w11
0xf8fe33c592c   5ec  4e040694       dup v20.4s, v20.s[0]
0xf8fe33c5930   5f0  6e0c0654       mov v20.s[1], v18.s[0]
0xf8fe33c5934   5f4  8b0b026b       add x11, x19, x11
0xf8fe33c5938   5f8  4d408174       ld1 {v20.s}[2], [x11]
0xf8fe33c593c   5fc  8b060266       add x6, x19, x6
0xf8fe33c5940   600  4d4090d4       ld1 {v20.s}[3], [x6]
0xf8fe33c5944   604  4e040672       dup v18.4s, v19.s[0]
0xf8fe33c5948   608  6e32de92       fmul v18.4s, v20.4s, v18.4s
0xf8fe33c594c   60c  4e32d631       fadd v17.4s, v17.4s, v18.4s
0xf8fe33c5950   610  f940bfe1       ldr x1, [sp, #376]
0xf8fe33c5954   614  3ca16a71       str q17, [x19, x1]
0xf8fe33c5958   618  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c595c   61c  f940efe6       ldr x6, [sp, #472]
0xf8fe33c5960   620  f9003be2       str x2, [sp, #112]
0xf8fe33c5964   624  f90093ef       str x15, [sp, #288]
0xf8fe33c5968   628  aa0a03e2       mov x2, x10
0xf8fe33c596c   62c  f8520340       ldur x0, [x26, #-224]
0xf8fe33c5970   630  eb2063ff       cmp sp, x0
0xf8fe33c5974   634  54003b69       b.ls #+0x76c (addr 0xf8fe33c60e0)
0xf8fe33c5978   638  340000a2       cbz w2, #+0x14 (addr 0xf8fe33c598c)
0xf8fe33c597c   63c  6b05005f       cmp w2, w5
0xf8fe33c5980   640  54000060       b.eq #+0xc (addr 0xf8fe33c598c)
0xf8fe33c5984   644  d2800000       movz x0, #0x0
0xf8fe33c5988   648  14000002       b #+0x8 (addr 0xf8fe33c5990)
0xf8fe33c598c   64c  d2800020       movz x0, #0x1
0xf8fe33c5990   650  aa0203eb       mov x11, x2
0xf8fe33c5994   654  f94093ef       ldr x15, [sp, #288]
0xf8fe33c5998   658  f9403be2       ldr x2, [sp, #112]
0xf8fe33c599c   65c  14000004       b #+0x10 (addr 0xf8fe33c59ac)
0xf8fe33c59a0   660  aa0003eb       mov x11, x0
0xf8fe33c59a4   664  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c59a8   668  aa0a03e2       mov x2, x10
0xf8fe33c59ac   66c  f852034a       ldur x10, [x26, #-224]
0xf8fe33c59b0   670  eb2a63ff       cmp sp, x10
0xf8fe33c59b4   674  54003fa9       b.ls #+0x7f4 (addr 0xf8fe33c61a8)
0xf8fe33c59b8   678  35000340       cbnz w0, #+0x68 (addr 0xf8fe33c5a20)
0xf8fe33c59bc   67c  1100116a       add w10, w11, #0x4 (4)
0xf8fe33c59c0   680  2a0b03eb       mov w11, w11
0xf8fe33c59c4   684  b86b6a6b       ldr w11, [x19, x11]
0xf8fe33c59c8   688  6b01017f       cmp w11, w1
0xf8fe33c59cc   68c  540000e0       b.eq #+0x1c (addr 0xf8fe33c59e8)
0xf8fe33c59d0   690  6b0b00df       cmp w6, w11
0xf8fe33c59d4   694  540000a9       b.ls #+0x14 (addr 0xf8fe33c59e8)
0xf8fe33c59d8   698  6b0b013f       cmp w9, w11
0xf8fe33c59dc   69c  54000069       b.ls #+0xc (addr 0xf8fe33c59e8)
0xf8fe33c59e0   6a0  6b0d017f       cmp w11, w13
0xf8fe33c59e4   6a4  54fff683       b.lo #-0x130 (addr 0xf8fe33c58b4)
0xf8fe33c59e8   6a8  6b05015f       cmp w10, w5
0xf8fe33c59ec   6ac  540000c0       b.eq #+0x18 (addr 0xf8fe33c5a04)
0xf8fe33c59f0   6b0  f940bbeb       ldr x11, [sp, #368]
0xf8fe33c59f4   6b4  aa0a03e0       mov x0, x10
0xf8fe33c59f8   6b8  aa0203ea       mov x10, x2
0xf8fe33c59fc   6bc  f940bfe2       ldr x2, [sp, #376]
0xf8fe33c5a00   6c0  14000122       b #+0x488 (addr 0xf8fe33c5e88)
0xf8fe33c5a04   6c4  f940bbeb       ldr x11, [sp, #368]
0xf8fe33c5a08   6c8  aa0a03e0       mov x0, x10
0xf8fe33c5a0c   6cc  aa0203ea       mov x10, x2
0xf8fe33c5a10   6d0  d2800030       movz x16, #0x1
0xf8fe33c5a14   6d4  f9008ff0       str x16, [sp, #280]
0xf8fe33c5a18   6d8  f940bfe2       ldr x2, [sp, #376]
0xf8fe33c5a1c   6dc  17ffffe1       b #-0x7c (addr 0xf8fe33c59a0)
0xf8fe33c5a20   6e0  72001dff       tst w15, #0xff
0xf8fe33c5a24   6e4  54002621       b.ne #+0x4c4 (addr 0xf8fe33c5ee8)
0xf8fe33c5a28   6e8  6b02009f       cmp w4, w2
0xf8fe33c5a2c   6ec  540024c3       b.lo #+0x498 (addr 0xf8fe33c5ec4)
0xf8fe33c5a30   6f0  14000003       b #+0xc (addr 0xf8fe33c5a3c)
0xf8fe33c5a34   6f4  aa0b03e0       mov x0, x11
0xf8fe33c5a38   6f8  aa0a03e2       mov x2, x10
0xf8fe33c5a3c   6fc  f852034a       ldur x10, [x26, #-224]
0xf8fe33c5a40   700  eb2a63ff       cmp sp, x10
0xf8fe33c5a44   704  54004229       b.ls #+0x844 (addr 0xf8fe33c6288)
0xf8fe33c5a48   708  6b02009f       cmp w4, w2
0xf8fe33c5a4c   70c  540011a9       b.ls #+0x234 (addr 0xf8fe33c5c80)
0xf8fe33c5a50   710  14000002       b #+0x8 (addr 0xf8fe33c5a58)
0xf8fe33c5a54   714  aa0a03e2       mov x2, x10
0xf8fe33c5a58   718  f852034a       ldur x10, [x26, #-224]
0xf8fe33c5a5c   71c  eb2a63ff       cmp sp, x10
0xf8fe33c5a60   720  540047c9       b.ls #+0x8f8 (addr 0xf8fe33c6358)
0xf8fe33c5a64   724  1100044a       add w10, w2, #0x1 (1)
0xf8fe33c5a68   728  1b187c40       mul w0, w2, w24
0xf8fe33c5a6c   72c  0b0c000b       add w11, w0, w12
0xf8fe33c5a70   730  6b0b02ff       cmp w23, w11
0xf8fe33c5a74   734  540008e9       b.ls #+0x11c (addr 0xf8fe33c5b90)
0xf8fe33c5a78   738  0b0e0000       add w0, w0, w14
0xf8fe33c5a7c   73c  6b0002ff       cmp w23, w0
0xf8fe33c5a80   740  54000889       b.ls #+0x110 (addr 0xf8fe33c5b90)
0xf8fe33c5a84   744  0b000acf       add w15, w22, w0, lsl #2
0xf8fe33c5a88   748  b86f6a60       ldr w0, [x19, x15]
0xf8fe33c5a8c   74c  0b0b0acb       add w11, w22, w11, lsl #2
0xf8fe33c5a90   750  b86b6a6b       ldr w11, [x19, x11]
0xf8fe33c5a94   754  6b0b001f       cmp w0, w11
0xf8fe33c5a98   758  540007c3       b.lo #+0xf8 (addr 0xf8fe33c5b90)
0xf8fe33c5a9c   75c  6b0002bf       cmp w21, w0
0xf8fe33c5aa0   760  54000783       b.lo #+0xf0 (addr 0xf8fe33c5b90)
0xf8fe33c5aa4   764  6b0b001f       cmp w0, w11
0xf8fe33c5aa8   768  54000740       b.eq #+0xe8 (addr 0xf8fe33c5b90)
0xf8fe33c5aac   76c  0b0b0a8f       add w15, w20, w11, lsl #2
0xf8fe33c5ab0   770  4b0b000b       sub w11, w0, w11
0xf8fe33c5ab4   774  531e756b       lsl w11, w11, #2
0xf8fe33c5ab8   778  0b0b01e5       add w5, w15, w11
0xf8fe33c5abc   77c  110011e0       add w0, w15, #0x4 (4)
0xf8fe33c5ac0   780  b86f6a62       ldr w2, [x19, x15]
0xf8fe33c5ac4   784  6b01005f       cmp w2, w1
0xf8fe33c5ac8   788  540000e0       b.eq #+0x1c (addr 0xf8fe33c5ae4)
0xf8fe33c5acc   78c  6b0200df       cmp w6, w2
0xf8fe33c5ad0   790  540000a9       b.ls #+0x14 (addr 0xf8fe33c5ae4)
0xf8fe33c5ad4   794  6b02013f       cmp w9, w2
0xf8fe33c5ad8   798  54000069       b.ls #+0xc (addr 0xf8fe33c5ae4)
0xf8fe33c5adc   79c  6b0d005f       cmp w2, w13
0xf8fe33c5ae0   7a0  540006a3       b.lo #+0xd4 (addr 0xf8fe33c5bb4)
0xf8fe33c5ae4   7a4  5100116b       sub w11, w11, #0x4 (4)
0xf8fe33c5ae8   7a8  3400052b       cbz w11, #+0xa4 (addr 0xf8fe33c5b8c)
0xf8fe33c5aec   7ac  110021e2       add w2, w15, #0x8 (8)
0xf8fe33c5af0   7b0  b8606a60       ldr w0, [x19, x0]
0xf8fe33c5af4   7b4  6b01001f       cmp w0, w1
0xf8fe33c5af8   7b8  540000e0       b.eq #+0x1c (addr 0xf8fe33c5b14)
0xf8fe33c5afc   7bc  6b0000df       cmp w6, w0
0xf8fe33c5b00   7c0  540000a9       b.ls #+0x14 (addr 0xf8fe33c5b14)
0xf8fe33c5b04   7c4  6b00013f       cmp w9, w0
0xf8fe33c5b08   7c8  54000069       b.ls #+0xc (addr 0xf8fe33c5b14)
0xf8fe33c5b0c   7cc  6b0d001f       cmp w0, w13
0xf8fe33c5b10   7d0  54000463       b.lo #+0x8c (addr 0xf8fe33c5b9c)
0xf8fe33c5b14   7d4  5100116b       sub w11, w11, #0x4 (4)
0xf8fe33c5b18   7d8  340003cb       cbz w11, #+0x78 (addr 0xf8fe33c5b90)
0xf8fe33c5b1c   7dc  110031e0       add w0, w15, #0xc (12)
0xf8fe33c5b20   7e0  b8626a62       ldr w2, [x19, x2]
0xf8fe33c5b24   7e4  6b01005f       cmp w2, w1
0xf8fe33c5b28   7e8  540000e0       b.eq #+0x1c (addr 0xf8fe33c5b44)
0xf8fe33c5b2c   7ec  6b0200df       cmp w6, w2
0xf8fe33c5b30   7f0  540000a9       b.ls #+0x14 (addr 0xf8fe33c5b44)
0xf8fe33c5b34   7f4  6b02013f       cmp w9, w2
0xf8fe33c5b38   7f8  54000069       b.ls #+0xc (addr 0xf8fe33c5b44)
0xf8fe33c5b3c   7fc  6b0d005f       cmp w2, w13
0xf8fe33c5b40   800  540003a3       b.lo #+0x74 (addr 0xf8fe33c5bb4)
0xf8fe33c5b44   804  5100116b       sub w11, w11, #0x4 (4)
0xf8fe33c5b48   808  3400022b       cbz w11, #+0x44 (addr 0xf8fe33c5b8c)
0xf8fe33c5b4c   80c  f8520342       ldur x2, [x26, #-224]
0xf8fe33c5b50   810  eb2263ff       cmp sp, x2
0xf8fe33c5b54   814  54004669       b.ls #+0x8cc (addr 0xf8fe33c6420)
0xf8fe33c5b58   818  110041ef       add w15, w15, #0x10 (16)
0xf8fe33c5b5c   81c  b8606a60       ldr w0, [x19, x0]
0xf8fe33c5b60   820  6b01001f       cmp w0, w1
0xf8fe33c5b64   824  540000e0       b.eq #+0x1c (addr 0xf8fe33c5b80)
0xf8fe33c5b68   828  6b0000df       cmp w6, w0
0xf8fe33c5b6c   82c  540000a9       b.ls #+0x14 (addr 0xf8fe33c5b80)
0xf8fe33c5b70   830  6b00013f       cmp w9, w0
0xf8fe33c5b74   834  54000069       b.ls #+0xc (addr 0xf8fe33c5b80)
0xf8fe33c5b78   838  6b0d001f       cmp w0, w13
0xf8fe33c5b7c   83c  54000183       b.lo #+0x30 (addr 0xf8fe33c5bac)
0xf8fe33c5b80   840  5100116b       sub w11, w11, #0x4 (4)
0xf8fe33c5b84   844  35fff9cb       cbnz w11, #-0xc8 (addr 0xf8fe33c5abc)
0xf8fe33c5b88   848  14000002       b #+0x8 (addr 0xf8fe33c5b90)
0xf8fe33c5b8c   84c  aa0203e0       mov x0, x2
0xf8fe33c5b90   850  6b04015f       cmp w10, w4
0xf8fe33c5b94   854  54fff601       b.ne #-0x140 (addr 0xf8fe33c5a54)
0xf8fe33c5b98   858  14000038       b #+0xe0 (addr 0xf8fe33c5c78)
0xf8fe33c5b9c   85c  aa0203f0       mov x16, x2
0xf8fe33c5ba0   860  aa0003e2       mov x2, x0
0xf8fe33c5ba4   864  aa1003e0       mov x0, x16
0xf8fe33c5ba8   868  14000003       b #+0xc (addr 0xf8fe33c5bb4)
0xf8fe33c5bac   86c  aa0003e2       mov x2, x0
0xf8fe33c5bb0   870  aa0f03e0       mov x0, x15
0xf8fe33c5bb4   874  531e744b       lsl w11, w2, #2
0xf8fe33c5bb8   878  0b0b006f       add w15, w3, w11
0xf8fe33c5bbc   87c  bc6f6a72       ldr s18, [x19, x15]
0xf8fe33c5bc0   880  1e323973       fsub s19, s11, s18
0xf8fe33c5bc4   884  1e330a74       fmul s20, s19, s19
0xf8fe33c5bc8   888  0b0b038f       add w15, w28, w11
0xf8fe33c5bcc   88c  bc6f6a75       ldr s21, [x19, x15]
0xf8fe33c5bd0   890  1e353996       fsub s22, s12, s21
0xf8fe33c5bd4   894  1e360ad7       fmul s23, s22, s22
0xf8fe33c5bd8   898  1e372a94       fadd s20, s20, s23
0xf8fe33c5bdc   89c  1e262280       fcmp s20, s6
0xf8fe33c5be0   8a0  1e2f3d57       fcsel s23, s10, s15, lo
0xf8fe33c5be4   8a4  1e3420e0       fcmp s7, s20
0xf8fe33c5be8   8a8  1e2f9ef7       fcsel s23, s23, s15, ls
0xf8fe33c5bec   8ac  1e202288       fcmp s20, #0.0
0xf8fe33c5bf0   8b0  1e2fcef7       fcsel s23, s23, s15, gt
0xf8fe33c5bf4   8b4  1e3729ad       fadd s13, s13, s23
0xf8fe33c5bf8   8b8  0b0b036f       add w15, w27, w11
0xf8fe33c5bfc   8bc  0b0b0322       add w2, w25, w11
0xf8fe33c5c00   8c0  4e040652       dup v18.4s, v18.s[0]
0xf8fe33c5c04   8c4  6e0c06b2       mov v18.s[1], v21.s[0]
0xf8fe33c5c08   8c8  8b020262       add x2, x19, x2
0xf8fe33c5c0c   8cc  4d408052       ld1 {v18.s}[2], [x2]
0xf8fe33c5c10   8d0  8b0f026f       add x15, x19, x15
0xf8fe33c5c14   8d4  4d4091f2       ld1 {v18.s}[3], [x15]
0xf8fe33c5c18   8d8  4e0406f5       dup v21.4s, v23.s[0]
0xf8fe33c5c1c   8dc  6e35de52       fmul v18.4s, v18.4s, v21.4s
0xf8fe33c5c20   8e0  4e32d631       fadd v17.4s, v17.4s, v18.4s
0xf8fe33c5c24   8e4  1e272280       fcmp s20, s7
0xf8fe33c5c28   8e8  1e2f3d52       fcsel s18, s10, s15, lo
0xf8fe33c5c2c   8ec  1e320ad4       fmul s20, s22, s18
0xf8fe33c5c30   8f0  1e342a10       fadd s16, s16, s20
0xf8fe33c5c34   8f4  1e320a72       fmul s18, s19, s18
0xf8fe33c5c38   8f8  1e3229ce       fadd s14, s14, s18
0xf8fe33c5c3c   8fc  6b05001f       cmp w0, w5
0xf8fe33c5c40   900  54000081       b.ne #+0x10 (addr 0xf8fe33c5c50)
0xf8fe33c5c44   904  6b0a009f       cmp w4, w10
0xf8fe33c5c48   908  54ffef62       b.hs #-0x214 (addr 0xf8fe33c5a34)
0xf8fe33c5c4c   90c  1400009f       b #+0x27c (addr 0xf8fe33c5ec8)
0xf8fe33c5c50   910  bc276a70       str s16, [x19, x7]
0xf8fe33c5c54   914  9101110b       add x11, x8, #0x44 (68)
0xf8fe33c5c58   918  bc2b6a6e       str s14, [x19, x11]
0xf8fe33c5c5c   91c  f940bbeb       ldr x11, [sp, #368]
0xf8fe33c5c60   920  bc2b6a6d       str s13, [x19, x11]
0xf8fe33c5c64   924  f940bfef       ldr x15, [sp, #376]
0xf8fe33c5c68   928  3caf6a71       str q17, [x19, x15]
0xf8fe33c5c6c   92c  aa0f03e2       mov x2, x15
0xf8fe33c5c70   930  d280000f       movz x15, #0x0
0xf8fe33c5c74   934  14000085       b #+0x214 (addr 0xf8fe33c5e88)
0xf8fe33c5c78   938  aa0403ea       mov x10, x4
0xf8fe33c5c7c   93c  14000002       b #+0x8 (addr 0xf8fe33c5c84)
0xf8fe33c5c80   940  aa0203ea       mov x10, x2
0xf8fe33c5c84   944  bc276a70       str s16, [x19, x7]
0xf8fe33c5c88   948  9101110b       add x11, x8, #0x44 (68)
0xf8fe33c5c8c   94c  bc2b6a6e       str s14, [x19, x11]
0xf8fe33c5c90   950  f940bbef       ldr x15, [sp, #368]
0xf8fe33c5c94   954  bc2f6a6d       str s13, [x19, x15]
0xf8fe33c5c98   958  f940bfe2       ldr x2, [sp, #376]
0xf8fe33c5c9c   95c  3ca26a71       str q17, [x19, x2]
0xf8fe33c5ca0   960  f900e7e5       str x5, [sp, #456]
0xf8fe33c5ca4   964  f9406ff6       ldr x22, [sp, #216]
0xf8fe33c5ca8   968  34001216       cbz w22, #+0x240 (addr 0xf8fe33c5ee8)
0xf8fe33c5cac   96c  f94073e0       ldr x0, [sp, #224]
0xf8fe33c5cb0   970  b8606a77       ldr w23, [x19, x0]
0xf8fe33c5cb4   974  f94077f8       ldr x24, [sp, #232]
0xf8fe33c5cb8   978  b8786a65       ldr w5, [x19, x24]
0xf8fe33c5cbc   97c  6b0502ff       cmp w23, w5
0xf8fe33c5cc0   980  54000fc3       b.lo #+0x1f8 (addr 0xf8fe33c5eb8)
0xf8fe33c5cc4   984  6b1702bf       cmp w21, w23
0xf8fe33c5cc8   988  54000f83       b.lo #+0x1f0 (addr 0xf8fe33c5eb8)
0xf8fe33c5ccc   98c  6b0502ff       cmp w23, w5
0xf8fe33c5cd0   990  54000ec0       b.eq #+0x1d8 (addr 0xf8fe33c5ea8)
0xf8fe33c5cd4   994  0b050a95       add w21, w20, w5, lsl #2
0xf8fe33c5cd8   998  4b0502f7       sub w23, w23, w5
0xf8fe33c5cdc   99c  531e76f7       lsl w23, w23, #2
0xf8fe33c5ce0   9a0  0b1702a5       add w5, w21, w23
0xf8fe33c5ce4   9a4  110012b4       add w20, w21, #0x4 (4)
0xf8fe33c5ce8   9a8  b8756a60       ldr w0, [x19, x21]
0xf8fe33c5cec   9ac  6b01001f       cmp w0, w1
0xf8fe33c5cf0   9b0  540000e0       b.eq #+0x1c (addr 0xf8fe33c5d0c)
0xf8fe33c5cf4   9b4  6b0000df       cmp w6, w0
0xf8fe33c5cf8   9b8  540000a9       b.ls #+0x14 (addr 0xf8fe33c5d0c)
0xf8fe33c5cfc   9bc  6b00013f       cmp w9, w0
0xf8fe33c5d00   9c0  54000069       b.ls #+0xc (addr 0xf8fe33c5d0c)
0xf8fe33c5d04   9c4  6b0d001f       cmp w0, w13
0xf8fe33c5d08   9c8  54000603       b.lo #+0xc0 (addr 0xf8fe33c5dc8)
0xf8fe33c5d0c   9cc  510012f7       sub w23, w23, #0x4 (4)
0xf8fe33c5d10   9d0  34000c37       cbz w23, #+0x184 (addr 0xf8fe33c5e94)
0xf8fe33c5d14   9d4  110022a0       add w0, w21, #0x8 (8)
0xf8fe33c5d18   9d8  b8746a74       ldr w20, [x19, x20]
0xf8fe33c5d1c   9dc  6b01029f       cmp w20, w1
0xf8fe33c5d20   9e0  540000e0       b.eq #+0x1c (addr 0xf8fe33c5d3c)
0xf8fe33c5d24   9e4  6b1400df       cmp w6, w20
0xf8fe33c5d28   9e8  540000a9       b.ls #+0x14 (addr 0xf8fe33c5d3c)
0xf8fe33c5d2c   9ec  6b14013f       cmp w9, w20
0xf8fe33c5d30   9f0  54000069       b.ls #+0xc (addr 0xf8fe33c5d3c)
0xf8fe33c5d34   9f4  6b0d029f       cmp w20, w13
0xf8fe33c5d38   9f8  540003e3       b.lo #+0x7c (addr 0xf8fe33c5db4)
0xf8fe33c5d3c   9fc  510012f7       sub w23, w23, #0x4 (4)
0xf8fe33c5d40   a00  34000af7       cbz w23, #+0x15c (addr 0xf8fe33c5e9c)
0xf8fe33c5d44   a04  110032b4       add w20, w21, #0xc (12)
0xf8fe33c5d48   a08  b8606a60       ldr w0, [x19, x0]
0xf8fe33c5d4c   a0c  6b01001f       cmp w0, w1
0xf8fe33c5d50   a10  540000e0       b.eq #+0x1c (addr 0xf8fe33c5d6c)
0xf8fe33c5d54   a14  6b0000df       cmp w6, w0
0xf8fe33c5d58   a18  540000a9       b.ls #+0x14 (addr 0xf8fe33c5d6c)
0xf8fe33c5d5c   a1c  6b00013f       cmp w9, w0
0xf8fe33c5d60   a20  54000069       b.ls #+0xc (addr 0xf8fe33c5d6c)
0xf8fe33c5d64   a24  6b0d001f       cmp w0, w13
0xf8fe33c5d68   a28  54000303       b.lo #+0x60 (addr 0xf8fe33c5dc8)
0xf8fe33c5d6c   a2c  510012f7       sub w23, w23, #0x4 (4)
0xf8fe33c5d70   a30  34000937       cbz w23, #+0x124 (addr 0xf8fe33c5e94)
0xf8fe33c5d74   a34  f8520340       ldur x0, [x26, #-224]
0xf8fe33c5d78   a38  eb2063ff       cmp sp, x0
0xf8fe33c5d7c   a3c  54003c29       b.ls #+0x784 (addr 0xf8fe33c6500)
0xf8fe33c5d80   a40  110042b5       add w21, w21, #0x10 (16)
0xf8fe33c5d84   a44  b8746a60       ldr w0, [x19, x20]
0xf8fe33c5d88   a48  6b01001f       cmp w0, w1
0xf8fe33c5d8c   a4c  540000e0       b.eq #+0x1c (addr 0xf8fe33c5da8)
0xf8fe33c5d90   a50  6b0000df       cmp w6, w0
0xf8fe33c5d94   a54  540000a9       b.ls #+0x14 (addr 0xf8fe33c5da8)
0xf8fe33c5d98   a58  6b00013f       cmp w9, w0
0xf8fe33c5d9c   a5c  54000069       b.ls #+0xc (addr 0xf8fe33c5da8)
0xf8fe33c5da0   a60  6b0d001f       cmp w0, w13
0xf8fe33c5da4   a64  54000103       b.lo #+0x20 (addr 0xf8fe33c5dc4)
0xf8fe33c5da8   a68  510012f7       sub w23, w23, #0x4 (4)
0xf8fe33c5dac   a6c  35fff9d7       cbnz w23, #-0xc8 (addr 0xf8fe33c5ce4)
0xf8fe33c5db0   a70  14000039       b #+0xe4 (addr 0xf8fe33c5e94)
0xf8fe33c5db4   a74  aa0003f0       mov x16, x0
0xf8fe33c5db8   a78  aa1403e0       mov x0, x20
0xf8fe33c5dbc   a7c  aa1003f4       mov x20, x16
0xf8fe33c5dc0   a80  14000002       b #+0x8 (addr 0xf8fe33c5dc8)
0xf8fe33c5dc4   a84  aa1503f4       mov x20, x21
0xf8fe33c5dc8   a88  531e7400       lsl w0, w0, #2
0xf8fe33c5dcc   a8c  0b000395       add w21, w28, w0
0xf8fe33c5dd0   a90  bc756a72       ldr s18, [x19, x21]
0xf8fe33c5dd4   a94  1e323993       fsub s19, s12, s18
0xf8fe33c5dd8   a98  0b000075       add w21, w3, w0
0xf8fe33c5ddc   a9c  bc756a74       ldr s20, [x19, x21]
0xf8fe33c5de0   aa0  1e343975       fsub s21, s11, s20
0xf8fe33c5de4   aa4  1e350ab6       fmul s22, s21, s21
0xf8fe33c5de8   aa8  1e330a77       fmul s23, s19, s19
0xf8fe33c5dec   aac  1e372ad6       fadd s22, s22, s23
0xf8fe33c5df0   ab0  1e2722c0       fcmp s22, s7
0xf8fe33c5df4   ab4  1e2f3d57       fcsel s23, s10, s15, lo
0xf8fe33c5df8   ab8  1e370a73       fmul s19, s19, s23
0xf8fe33c5dfc   abc  1e332a10       fadd s16, s16, s19
0xf8fe33c5e00   ac0  bc276a70       str s16, [x19, x7]
0xf8fe33c5e04   ac4  1e370ab3       fmul s19, s21, s23
0xf8fe33c5e08   ac8  1e3329ce       fadd s14, s14, s19
0xf8fe33c5e0c   acc  bc2b6a6e       str s14, [x19, x11]
0xf8fe33c5e10   ad0  1e2622c0       fcmp s22, s6
0xf8fe33c5e14   ad4  1e2f3d53       fcsel s19, s10, s15, lo
0xf8fe33c5e18   ad8  1e3620e0       fcmp s7, s22
0xf8fe33c5e1c   adc  1e2f9e73       fcsel s19, s19, s15, ls
0xf8fe33c5e20   ae0  1e2022c8       fcmp s22, #0.0
0xf8fe33c5e24   ae4  1e2fce73       fcsel s19, s19, s15, gt
0xf8fe33c5e28   ae8  1e3329ad       fadd s13, s13, s19
0xf8fe33c5e2c   aec  bc2f6a6d       str s13, [x19, x15]
0xf8fe33c5e30   af0  0b00036b       add w11, w27, w0
0xf8fe33c5e34   af4  0b000335       add w21, w25, w0
0xf8fe33c5e38   af8  4e040694       dup v20.4s, v20.s[0]
0xf8fe33c5e3c   afc  6e0c0654       mov v20.s[1], v18.s[0]
0xf8fe33c5e40   b00  8b150275       add x21, x19, x21
0xf8fe33c5e44   b04  4d4082b4       ld1 {v20.s}[2], [x21]
0xf8fe33c5e48   b08  8b0b026b       add x11, x19, x11
0xf8fe33c5e4c   b0c  4d409174       ld1 {v20.s}[3], [x11]
0xf8fe33c5e50   b10  4e040672       dup v18.4s, v19.s[0]
0xf8fe33c5e54   b14  6e32de92       fmul v18.4s, v20.4s, v18.4s
0xf8fe33c5e58   b18  4e32d631       fadd v17.4s, v17.4s, v18.4s
0xf8fe33c5e5c   b1c  3ca26a71       str q17, [x19, x2]
0xf8fe33c5e60   b20  6b05029f       cmp w20, w5
0xf8fe33c5e64   b24  54000420       b.eq #+0x84 (addr 0xf8fe33c5ee8)
0xf8fe33c5e68   b28  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c5e6c   b2c  aa0f03eb       mov x11, x15
0xf8fe33c5e70   b30  d280002f       movz x15, #0x1
0xf8fe33c5e74   b34  aa1403e0       mov x0, x20
0xf8fe33c5e78   b38  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c5e7c   b3c  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c5e80   b40  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c5e84   b44  f94057f7       ldr x23, [sp, #168]
0xf8fe33c5e88   b48  d2800010       movz x16, #0x0
0xf8fe33c5e8c   b4c  f9008ff0       str x16, [sp, #280]
0xf8fe33c5e90   b50  17fffec4       b #-0x4f0 (addr 0xf8fe33c59a0)
0xf8fe33c5e94   b54  aa0003f4       mov x20, x0
0xf8fe33c5e98   b58  14000002       b #+0x8 (addr 0xf8fe33c5ea0)
0xf8fe33c5e9c   b5c  f9407fea       ldr x10, [sp, #248]
0xf8fe33c5ea0   b60  aa1403e0       mov x0, x20
0xf8fe33c5ea4   b64  14000011       b #+0x44 (addr 0xf8fe33c5ee8)
0xf8fe33c5ea8   b68  f94057ea       ldr x10, [sp, #168]
0xf8fe33c5eac   b6c  aa1703e0       mov x0, x23
0xf8fe33c5eb0   b70  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c5eb4   b74  1400000d       b #+0x34 (addr 0xf8fe33c5ee8)
0xf8fe33c5eb8   b78  aa1703e0       mov x0, x23
0xf8fe33c5ebc   b7c  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c5ec0   b80  1400000a       b #+0x28 (addr 0xf8fe33c5ee8)
0xf8fe33c5ec4   b84  aa0003eb       mov x11, x0
0xf8fe33c5ec8   b88  bc276a70       str s16, [x19, x7]
0xf8fe33c5ecc   b8c  9101110c       add x12, x8, #0x44 (68)
0xf8fe33c5ed0   b90  bc2c6a6e       str s14, [x19, x12]
0xf8fe33c5ed4   b94  f940bbea       ldr x10, [sp, #368]
0xf8fe33c5ed8   b98  bc2a6a6d       str s13, [x19, x10]
0xf8fe33c5edc   b9c  f940bfec       ldr x12, [sp, #376]
0xf8fe33c5ee0   ba0  3cac6a71       str q17, [x19, x12]
0xf8fe33c5ee4   ba4  aa0b03e0       mov x0, x11
0xf8fe33c5ee8   ba8  1100410a       add w10, w8, #0x10 (16)
0xf8fe33c5eec   bac  1100810b       add w11, w8, #0x20 (32)
0xf8fe33c5ef0   bb0  1100c10c       add w12, w8, #0x30 (48)
0xf8fe33c5ef4   bb4  f90063f3       str x19, [sp, #192]
0xf8fe33c5ef8   bb8  f900e7e5       str x5, [sp, #456]
0xf8fe33c5efc   bbc  f9008fe0       str x0, [sp, #280]
0xf8fe33c5f00   bc0  f940fbe7       ldr x7, [sp, #496]
0xf8fe33c5f04   bc4  aa0a03e0       mov x0, x10
0xf8fe33c5f08   bc8  f940cbe2       ldr x2, [sp, #400]
0xf8fe33c5f0c   bcc  fd40c7e0       ldr d0, [sp, #392]
0xf8fe33c5f10   bd0  fd40c3e1       ldr d1, [sp, #384]
0xf8fe33c5f14   bd4  aa0b03e3       mov x3, x11
0xf8fe33c5f18   bd8  aa0803e4       mov x4, x8
0xf8fe33c5f1c   bdc  aa0c03e5       mov x5, x12
0xf8fe33c5f20   be0  97fbdde1       bl #-0x10887c (addr 0xf8fe32bd6a4)
0xf8fe33c5f24   be4  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c5f28   be8  f940cfe6       ldr x6, [sp, #408]
0xf8fe33c5f2c   bec  6b0100df       cmp w6, w1
0xf8fe33c5f30   bf0  54000329       b.ls #+0x64 (addr 0xf8fe33c5f94)
0xf8fe33c5f34   bf4  f940dfe8       ldr x8, [sp, #440]
0xf8fe33c5f38   bf8  f940d3e9       ldr x9, [sp, #416]
0xf8fe33c5f3c   bfc  0b08012a       add w10, w9, w8
0xf8fe33c5f40   c00  f940f3eb       ldr x11, [sp, #480]
0xf8fe33c5f44   c04  9100416c       add x12, x11, #0x10 (16)
0xf8fe33c5f48   c08  f94063ed       ldr x13, [sp, #192]
0xf8fe33c5f4c   c0c  bc6c69a2       ldr s2, [x13, x12]
0xf8fe33c5f50   c10  bc2a69a2       str s2, [x13, x10]
0xf8fe33c5f54   c14  f940d7ea       ldr x10, [sp, #424]
0xf8fe33c5f58   c18  0b08014c       add w12, w10, w8
0xf8fe33c5f5c   c1c  9100516e       add x14, x11, #0x14 (20)
0xf8fe33c5f60   c20  bc6e69a2       ldr s2, [x13, x14]
0xf8fe33c5f64   c24  bc2c69a2       str s2, [x13, x12]
0xf8fe33c5f68   c28  f940dbec       ldr x12, [sp, #432]
0xf8fe33c5f6c   c2c  0b08018e       add w14, w12, w8
0xf8fe33c5f70   c30  9100616f       add x15, x11, #0x18 (24)
0xf8fe33c5f74   c34  bc6f69a2       ldr s2, [x13, x15]
0xf8fe33c5f78   c38  bc2e69a2       str s2, [x13, x14]
0xf8fe33c5f7c   c3c  f940e3ee       ldr x14, [sp, #448]
0xf8fe33c5f80   c40  0b0801c8       add w8, w14, w8
0xf8fe33c5f84   c44  9100716f       add x15, x11, #0x1c (28)
0xf8fe33c5f88   c48  bc6f69a2       ldr s2, [x13, x15]
0xf8fe33c5f8c   c4c  bc2869a2       str s2, [x13, x8]
0xf8fe33c5f90   c50  14000006       b #+0x18 (addr 0xf8fe33c5fa8)
0xf8fe33c5f94   c54  f94063ed       ldr x13, [sp, #192]
0xf8fe33c5f98   c58  14000004       b #+0x10 (addr 0xf8fe33c5fa8)
0xf8fe33c5f9c   c5c  f940cfe6       ldr x6, [sp, #408]
0xf8fe33c5fa0   c60  f9008fe0       str x0, [sp, #280]
0xf8fe33c5fa4   c64  aa0403ed       mov x13, x4
0xf8fe33c5fa8   c68  11000421       add w1, w1, #0x1 (1)
0xf8fe33c5fac   c6c  f940efe8       ldr x8, [sp, #472]
0xf8fe33c5fb0   c70  6b08003f       cmp w1, w8
0xf8fe33c5fb4   c74  54ffb7c1       b.ne #-0x908 (addr 0xf8fe33c56ac)
0xf8fe33c5fb8   c78  f940f3e1       ldr x1, [sp, #480]
0xf8fe33c5fbc   c7c  11014021       add w1, w1, #0x50 (80)
0xf8fe33c5fc0   c80  f940f7e6       ldr x6, [sp, #488]
0xf8fe33c5fc4   c84  b90000c1       str w1, [x6]
0xf8fe33c5fc8   c88  17fffd57       b #-0xaa4 (addr 0xf8fe33c5524)
0xf8fe33c5fcc   c8c  97fbdf01       bl #-0x1083fc (addr 0xf8fe32bdbd0)
0xf8fe33c5fd0   c90  f940fbe7       ldr x7, [sp, #496]
0xf8fe33c5fd4   c94  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c5fd8   c98  f94063e1       ldr x1, [sp, #192]
0xf8fe33c5fdc   c9c  17fffce4       b #-0xc70 (addr 0xf8fe33c536c)
0xf8fe33c5fe0   ca0  1e6520a0       fcmp d5, d5
0xf8fe33c5fe4   ca4  54000080       b.eq #+0x10 (addr 0xf8fe33c5ff4)
0xf8fe33c5fe8   ca8  d280000c       movz x12, #0x0
0xf8fe33c5fec   cac  aa0c03eb       mov x11, x12
0xf8fe33c5ff0   cb0  17fffd13       b #-0xbb4 (addr 0xf8fe33c543c)
0xf8fe33c5ff4   cb4  1e202068       fcmp s3, #0.0
0xf8fe33c5ff8   cb8  54000063       b.lo #+0xc (addr 0xf8fe33c6004)
0xf8fe33c5ffc   cbc  9280000b       movn x11, #0x0
0xf8fe33c6000   cc0  17fffd0f       b #-0xbc4 (addr 0xf8fe33c543c)
0xf8fe33c6004   cc4  d280000b       movz x11, #0x0
0xf8fe33c6008   cc8  17fffd0d       b #-0xbcc (addr 0xf8fe33c543c)
0xf8fe33c600c   ccc  1e6620c0       fcmp d6, d6
0xf8fe33c6010   cd0  54000060       b.eq #+0xc (addr 0xf8fe33c601c)
0xf8fe33c6014   cd4  d280000b       movz x11, #0x0
0xf8fe33c6018   cd8  17fffd11       b #-0xbbc (addr 0xf8fe33c545c)
0xf8fe33c601c   cdc  1e2020a8       fcmp s5, #0.0
0xf8fe33c6020   ce0  54ffffa3       b.lo #-0xc (addr 0xf8fe33c6014)
0xf8fe33c6024   ce4  9280000b       movn x11, #0x0
0xf8fe33c6028   ce8  17fffd0d       b #-0xbcc (addr 0xf8fe33c545c)
0xf8fe33c602c   cec  f9008fe0       str x0, [sp, #280]
0xf8fe33c6030   cf0  f900ebe1       str x1, [sp, #464]
0xf8fe33c6034   cf4  f90063e4       str x4, [sp, #192]
0xf8fe33c6038   cf8  97fbdee6       bl #-0x108468 (addr 0xf8fe32bdbd0)
0xf8fe33c603c   cfc  f940efe6       ldr x6, [sp, #472]
0xf8fe33c6040   d00  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c6044   d04  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c6048   d08  f94063e4       ldr x4, [sp, #192]
0xf8fe33c604c   d0c  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c6050   d10  f940affb       ldr cp, [sp, #344]
0xf8fe33c6054   d14  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c6058   d18  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c605c   d1c  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c6060   d20  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c6064   d24  f94097fc       ldr x28, [sp, #296]
0xf8fe33c6068   d28  f9408bed       ldr x13, [sp, #272]
0xf8fe33c606c   d2c  f94087e9       ldr x9, [sp, #264]
0xf8fe33c6070   d30  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c6074   d34  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c6078   d38  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c607c   d3c  f94057f7       ldr x23, [sp, #168]
0xf8fe33c6080   d40  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c6084   d44  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c6088   d48  3dc003e2       ldr q2, [sp]
0xf8fe33c608c   d4c  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c6090   d50  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c6094   d54  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c6098   d58  f94037eb       ldr x11, [sp, #104]
0xf8fe33c609c   d5c  17fffd9e       b #-0x988 (addr 0xf8fe33c5714)
0xf8fe33c60a0   d60  1e722240       fcmp d18, d18
0xf8fe33c60a4   d64  54000060       b.eq #+0xc (addr 0xf8fe33c60b0)
0xf8fe33c60a8   d68  d2800000       movz x0, #0x0
0xf8fe33c60ac   d6c  17fffdd4       b #-0x8b0 (addr 0xf8fe33c57fc)
0xf8fe33c60b0   d70  1e2021a8       fcmp s13, #0.0
0xf8fe33c60b4   d74  54ffffa3       b.lo #-0xc (addr 0xf8fe33c60a8)
0xf8fe33c60b8   d78  92800000       movn x0, #0x0
0xf8fe33c60bc   d7c  17fffdd0       b #-0x8c0 (addr 0xf8fe33c57fc)
0xf8fe33c60c0   d80  1e712220       fcmp d17, d17
0xf8fe33c60c4   d84  54000060       b.eq #+0xc (addr 0xf8fe33c60d0)
0xf8fe33c60c8   d88  d2800000       movz x0, #0x0
0xf8fe33c60cc   d8c  17fffdd4       b #-0x8b0 (addr 0xf8fe33c581c)
0xf8fe33c60d0   d90  1e202208       fcmp s16, #0.0
0xf8fe33c60d4   d94  54ffffa3       b.lo #-0xc (addr 0xf8fe33c60c8)
0xf8fe33c60d8   d98  92800000       movn x0, #0x0
0xf8fe33c60dc   d9c  17fffdd0       b #-0x8c0 (addr 0xf8fe33c581c)
0xf8fe33c60e0   da0  f900b7e7       str x7, [sp, #360]
0xf8fe33c60e4   da4  fd00a3eb       str d11, [sp, #320]
0xf8fe33c60e8   da8  fd009bec       str d12, [sp, #304]
0xf8fe33c60ec   dac  f9006be4       str x4, [sp, #208]
0xf8fe33c60f0   db0  f90053ee       str x14, [sp, #160]
0xf8fe33c60f4   db4  f9004fec       str x12, [sp, #152]
0xf8fe33c60f8   db8  f900e7e5       str x5, [sp, #456]
0xf8fe33c60fc   dbc  fd003fed       str d13, [sp, #120]
0xf8fe33c6100   dc0  f90083e2       str x2, [sp, #256]
0xf8fe33c6104   dc4  fd0033ee       str d14, [sp, #96]
0xf8fe33c6108   dc8  fd0027f0       str d16, [sp, #72]
0xf8fe33c610c   dcc  3d800ff1       str q17, [sp, #48]
0xf8fe33c6110   dd0  f90063f3       str x19, [sp, #192]
0xf8fe33c6114   dd4  97fbdeaf       bl #-0x108544 (addr 0xf8fe32bdbd0)
0xf8fe33c6118   dd8  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c611c   ddc  f940efe6       ldr x6, [sp, #472]
0xf8fe33c6120   de0  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c6124   de4  f94063f3       ldr x19, [sp, #192]
0xf8fe33c6128   de8  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c612c   dec  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c6130   df0  f940affb       ldr cp, [sp, #344]
0xf8fe33c6134   df4  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c6138   df8  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c613c   dfc  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c6140   e00  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c6144   e04  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c6148   e08  fd409bec       ldr d12, [sp, #304]
0xf8fe33c614c   e0c  f94097fc       ldr x28, [sp, #296]
0xf8fe33c6150   e10  f9408bed       ldr x13, [sp, #272]
0xf8fe33c6154   e14  f94087e9       ldr x9, [sp, #264]
0xf8fe33c6158   e18  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c615c   e1c  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c6160   e20  f9406be4       ldr x4, [sp, #208]
0xf8fe33c6164   e24  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c6168   e28  f94057f7       ldr x23, [sp, #168]
0xf8fe33c616c   e2c  f94053ee       ldr x14, [sp, #160]
0xf8fe33c6170   e30  f9404fec       ldr x12, [sp, #152]
0xf8fe33c6174   e34  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c6178   e38  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c617c   e3c  fd403fed       ldr d13, [sp, #120]
0xf8fe33c6180   e40  f94083e2       ldr x2, [sp, #256]
0xf8fe33c6184   e44  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c6188   e48  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c618c   e4c  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c6190   e50  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c6194   e54  3dc003e2       ldr q2, [sp]
0xf8fe33c6198   e58  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c619c   e5c  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c61a0   e60  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c61a4   e64  17fffdf5       b #-0x82c (addr 0xf8fe33c5978)
0xf8fe33c61a8   e68  f900e7e5       str x5, [sp, #456]
0xf8fe33c61ac   e6c  f9008fe0       str x0, [sp, #280]
0xf8fe33c61b0   e70  f900b7e7       str x7, [sp, #360]
0xf8fe33c61b4   e74  fd003fed       str d13, [sp, #120]
0xf8fe33c61b8   e78  fd0033ee       str d14, [sp, #96]
0xf8fe33c61bc   e7c  fd0027f0       str d16, [sp, #72]
0xf8fe33c61c0   e80  3d800ff1       str q17, [sp, #48]
0xf8fe33c61c4   e84  fd00a3eb       str d11, [sp, #320]
0xf8fe33c61c8   e88  fd009bec       str d12, [sp, #304]
0xf8fe33c61cc   e8c  f9003be2       str x2, [sp, #112]
0xf8fe33c61d0   e90  f90093ef       str x15, [sp, #288]
0xf8fe33c61d4   e94  f9006be4       str x4, [sp, #208]
0xf8fe33c61d8   e98  f90053ee       str x14, [sp, #160]
0xf8fe33c61dc   e9c  f9004fec       str x12, [sp, #152]
0xf8fe33c61e0   ea0  f90083eb       str x11, [sp, #256]
0xf8fe33c61e4   ea4  f90063f3       str x19, [sp, #192]
0xf8fe33c61e8   ea8  97fbde7a       bl #-0x108618 (addr 0xf8fe32bdbd0)
0xf8fe33c61ec   eac  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c61f0   eb0  f940efe6       ldr x6, [sp, #472]
0xf8fe33c61f4   eb4  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c61f8   eb8  f94063f3       ldr x19, [sp, #192]
0xf8fe33c61fc   ebc  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c6200   ec0  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c6204   ec4  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c6208   ec8  fd403fed       ldr d13, [sp, #120]
0xf8fe33c620c   ecc  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c6210   ed0  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c6214   ed4  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c6218   ed8  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c621c   edc  f940affb       ldr cp, [sp, #344]
0xf8fe33c6220   ee0  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c6224   ee4  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c6228   ee8  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c622c   eec  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c6230   ef0  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c6234   ef4  fd409bec       ldr d12, [sp, #304]
0xf8fe33c6238   ef8  f94097fc       ldr x28, [sp, #296]
0xf8fe33c623c   efc  f9403be2       ldr x2, [sp, #112]
0xf8fe33c6240   f00  f94093ef       ldr x15, [sp, #288]
0xf8fe33c6244   f04  f9408bed       ldr x13, [sp, #272]
0xf8fe33c6248   f08  f94087e9       ldr x9, [sp, #264]
0xf8fe33c624c   f0c  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c6250   f10  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c6254   f14  f9406be4       ldr x4, [sp, #208]
0xf8fe33c6258   f18  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c625c   f1c  f94057f7       ldr x23, [sp, #168]
0xf8fe33c6260   f20  f94053ee       ldr x14, [sp, #160]
0xf8fe33c6264   f24  f9404fec       ldr x12, [sp, #152]
0xf8fe33c6268   f28  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c626c   f2c  f94083eb       ldr x11, [sp, #256]
0xf8fe33c6270   f30  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c6274   f34  3dc003e2       ldr q2, [sp]
0xf8fe33c6278   f38  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c627c   f3c  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c6280   f40  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c6284   f44  17fffdcd       b #-0x8cc (addr 0xf8fe33c59b8)
0xf8fe33c6288   f48  f900b7e7       str x7, [sp, #360]
0xf8fe33c628c   f4c  fd00a3eb       str d11, [sp, #320]
0xf8fe33c6290   f50  fd009bec       str d12, [sp, #304]
0xf8fe33c6294   f54  3d800ff1       str q17, [sp, #48]
0xf8fe33c6298   f58  fd003fed       str d13, [sp, #120]
0xf8fe33c629c   f5c  fd0033ee       str d14, [sp, #96]
0xf8fe33c62a0   f60  fd0027f0       str d16, [sp, #72]
0xf8fe33c62a4   f64  f900e7e5       str x5, [sp, #456]
0xf8fe33c62a8   f68  f9006be4       str x4, [sp, #208]
0xf8fe33c62ac   f6c  f9003be2       str x2, [sp, #112]
0xf8fe33c62b0   f70  f9008fe0       str x0, [sp, #280]
0xf8fe33c62b4   f74  f90053ee       str x14, [sp, #160]
0xf8fe33c62b8   f78  f9004fec       str x12, [sp, #152]
0xf8fe33c62bc   f7c  f90063f3       str x19, [sp, #192]
0xf8fe33c62c0   f80  97fbde44       bl #-0x1086f0 (addr 0xf8fe32bdbd0)
0xf8fe33c62c4   f84  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c62c8   f88  f940efe6       ldr x6, [sp, #472]
0xf8fe33c62cc   f8c  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c62d0   f90  f94063f3       ldr x19, [sp, #192]
0xf8fe33c62d4   f94  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c62d8   f98  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c62dc   f9c  f940affb       ldr cp, [sp, #344]
0xf8fe33c62e0   fa0  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c62e4   fa4  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c62e8   fa8  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c62ec   fac  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c62f0   fb0  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c62f4   fb4  fd409bec       ldr d12, [sp, #304]
0xf8fe33c62f8   fb8  f94097fc       ldr x28, [sp, #296]
0xf8fe33c62fc   fbc  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c6300   fc0  fd403fed       ldr d13, [sp, #120]
0xf8fe33c6304   fc4  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c6308   fc8  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c630c   fcc  f9408bed       ldr x13, [sp, #272]
0xf8fe33c6310   fd0  f94087e9       ldr x9, [sp, #264]
0xf8fe33c6314   fd4  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c6318   fd8  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c631c   fdc  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c6320   fe0  f9406be4       ldr x4, [sp, #208]
0xf8fe33c6324   fe4  f9403be2       ldr x2, [sp, #112]
0xf8fe33c6328   fe8  f9408fe0       ldr x0, [sp, #280]
0xf8fe33c632c   fec  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c6330   ff0  f94057f7       ldr x23, [sp, #168]
0xf8fe33c6334   ff4  f94053ee       ldr x14, [sp, #160]
0xf8fe33c6338   ff8  f9404fec       ldr x12, [sp, #152]
0xf8fe33c633c   ffc  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c6340  1000  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c6344  1004  3dc003e2       ldr q2, [sp]
0xf8fe33c6348  1008  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c634c  100c  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c6350  1010  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c6354  1014  17fffdbd       b #-0x90c (addr 0xf8fe33c5a48)
0xf8fe33c6358  1018  f900b7e7       str x7, [sp, #360]
0xf8fe33c635c  101c  fd00a3eb       str d11, [sp, #320]
0xf8fe33c6360  1020  fd009bec       str d12, [sp, #304]
0xf8fe33c6364  1024  3d800ff1       str q17, [sp, #48]
0xf8fe33c6368  1028  fd003fed       str d13, [sp, #120]
0xf8fe33c636c  102c  fd0033ee       str d14, [sp, #96]
0xf8fe33c6370  1030  fd0027f0       str d16, [sp, #72]
0xf8fe33c6374  1034  f9006be4       str x4, [sp, #208]
0xf8fe33c6378  1038  f900e7e5       str x5, [sp, #456]
0xf8fe33c637c  103c  f90053ee       str x14, [sp, #160]
0xf8fe33c6380  1040  f9004fec       str x12, [sp, #152]
0xf8fe33c6384  1044  f90093e2       str x2, [sp, #288]
0xf8fe33c6388  1048  f90063f3       str x19, [sp, #192]
0xf8fe33c638c  104c  97fbde11       bl #-0x1087bc (addr 0xf8fe32bdbd0)
0xf8fe33c6390  1050  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c6394  1054  f940efe6       ldr x6, [sp, #472]
0xf8fe33c6398  1058  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c639c  105c  f94063f3       ldr x19, [sp, #192]
0xf8fe33c63a0  1060  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c63a4  1064  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c63a8  1068  f940affb       ldr cp, [sp, #344]
0xf8fe33c63ac  106c  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c63b0  1070  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c63b4  1074  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c63b8  1078  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c63bc  107c  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c63c0  1080  fd409bec       ldr d12, [sp, #304]
0xf8fe33c63c4  1084  f94097fc       ldr x28, [sp, #296]
0xf8fe33c63c8  1088  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c63cc  108c  fd403fed       ldr d13, [sp, #120]
0xf8fe33c63d0  1090  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c63d4  1094  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c63d8  1098  f9408bed       ldr x13, [sp, #272]
0xf8fe33c63dc  109c  f94087e9       ldr x9, [sp, #264]
0xf8fe33c63e0  10a0  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c63e4  10a4  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c63e8  10a8  f9406be4       ldr x4, [sp, #208]
0xf8fe33c63ec  10ac  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c63f0  10b0  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c63f4  10b4  f94057f7       ldr x23, [sp, #168]
0xf8fe33c63f8  10b8  f94053ee       ldr x14, [sp, #160]
0xf8fe33c63fc  10bc  f9404fec       ldr x12, [sp, #152]
0xf8fe33c6400  10c0  f94093e2       ldr x2, [sp, #288]
0xf8fe33c6404  10c4  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c6408  10c8  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c640c  10cc  3dc003e2       ldr q2, [sp]
0xf8fe33c6410  10d0  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c6414  10d4  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c6418  10d8  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c641c  10dc  17fffd92       b #-0x9b8 (addr 0xf8fe33c5a64)
0xf8fe33c6420  10e0  f900b7e7       str x7, [sp, #360]
0xf8fe33c6424  10e4  f900e7e5       str x5, [sp, #456]
0xf8fe33c6428  10e8  fd00a3eb       str d11, [sp, #320]
0xf8fe33c642c  10ec  fd009bec       str d12, [sp, #304]
0xf8fe33c6430  10f0  f9003bea       str x10, [sp, #112]
0xf8fe33c6434  10f4  3d800ff1       str q17, [sp, #48]
0xf8fe33c6438  10f8  fd003fed       str d13, [sp, #120]
0xf8fe33c643c  10fc  fd0033ee       str d14, [sp, #96]
0xf8fe33c6440  1100  fd0027f0       str d16, [sp, #72]
0xf8fe33c6444  1104  f9006be4       str x4, [sp, #208]
0xf8fe33c6448  1108  f90067e0       str x0, [sp, #200]
0xf8fe33c644c  110c  f90093eb       str x11, [sp, #288]
0xf8fe33c6450  1110  f9008fef       str x15, [sp, #280]
0xf8fe33c6454  1114  f90053ee       str x14, [sp, #160]
0xf8fe33c6458  1118  f9004fec       str x12, [sp, #152]
0xf8fe33c645c  111c  f90063f3       str x19, [sp, #192]
0xf8fe33c6460  1120  97fbdddc       bl #-0x108890 (addr 0xf8fe32bdbd0)
0xf8fe33c6464  1124  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c6468  1128  f940efe6       ldr x6, [sp, #472]
0xf8fe33c646c  112c  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c6470  1130  f94063f3       ldr x19, [sp, #192]
0xf8fe33c6474  1134  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c6478  1138  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c647c  113c  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c6480  1140  f940affb       ldr cp, [sp, #344]
0xf8fe33c6484  1144  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c6488  1148  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c648c  114c  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c6490  1150  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c6494  1154  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c6498  1158  fd409bec       ldr d12, [sp, #304]
0xf8fe33c649c  115c  f94097fc       ldr x28, [sp, #296]
0xf8fe33c64a0  1160  f9403bea       ldr x10, [sp, #112]
0xf8fe33c64a4  1164  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c64a8  1168  fd403fed       ldr d13, [sp, #120]
0xf8fe33c64ac  116c  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c64b0  1170  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c64b4  1174  f9408bed       ldr x13, [sp, #272]
0xf8fe33c64b8  1178  f94087e9       ldr x9, [sp, #264]
0xf8fe33c64bc  117c  f9407ff4       ldr x20, [sp, #248]
0xf8fe33c64c0  1180  f9407bf5       ldr x21, [sp, #240]
0xf8fe33c64c4  1184  f9406be4       ldr x4, [sp, #208]
0xf8fe33c64c8  1188  f94067e0       ldr x0, [sp, #200]
0xf8fe33c64cc  118c  f94093eb       ldr x11, [sp, #288]
0xf8fe33c64d0  1190  f9408fef       ldr x15, [sp, #280]
0xf8fe33c64d4  1194  f9405bf6       ldr x22, [sp, #176]
0xf8fe33c64d8  1198  f94057f7       ldr x23, [sp, #168]
0xf8fe33c64dc  119c  f94053ee       ldr x14, [sp, #160]
0xf8fe33c64e0  11a0  f9404fec       ldr x12, [sp, #152]
0xf8fe33c64e4  11a4  f9404bf8       ldr x24, [sp, #144]
0xf8fe33c64e8  11a8  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c64ec  11ac  3dc003e2       ldr q2, [sp]
0xf8fe33c64f0  11b0  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c64f4  11b4  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c64f8  11b8  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c64fc  11bc  17fffd97       b #-0x9a4 (addr 0xf8fe33c5b58)
0xf8fe33c6500  11c0  f900e7e5       str x5, [sp, #456]
0xf8fe33c6504  11c4  f900b7e7       str x7, [sp, #360]
0xf8fe33c6508  11c8  fd00a3eb       str d11, [sp, #320]
0xf8fe33c650c  11cc  fd009bec       str d12, [sp, #304]
0xf8fe33c6510  11d0  f9003bea       str x10, [sp, #112]
0xf8fe33c6514  11d4  3d800ff1       str q17, [sp, #48]
0xf8fe33c6518  11d8  fd003fed       str d13, [sp, #120]
0xf8fe33c651c  11dc  f90093eb       str x11, [sp, #288]
0xf8fe33c6520  11e0  fd0033ee       str d14, [sp, #96]
0xf8fe33c6524  11e4  fd0027f0       str d16, [sp, #72]
0xf8fe33c6528  11e8  f90067f4       str x20, [sp, #200]
0xf8fe33c652c  11ec  f9008ff7       str x23, [sp, #280]
0xf8fe33c6530  11f0  f90083f5       str x21, [sp, #256]
0xf8fe33c6534  11f4  f9006be4       str x4, [sp, #208]
0xf8fe33c6538  11f8  f90053ee       str x14, [sp, #160]
0xf8fe33c653c  11fc  f9004fec       str x12, [sp, #152]
0xf8fe33c6540  1200  f90063f3       str x19, [sp, #192]
0xf8fe33c6544  1204  97fbdda3       bl #-0x108974 (addr 0xf8fe32bdbd0)
0xf8fe33c6548  1208  f940f3e8       ldr x8, [sp, #480]
0xf8fe33c654c  120c  f940efe6       ldr x6, [sp, #472]
0xf8fe33c6550  1210  f940ebe1       ldr x1, [sp, #464]
0xf8fe33c6554  1214  f94063f3       ldr x19, [sp, #192]
0xf8fe33c6558  1218  f940e7e5       ldr x5, [sp, #456]
0xf8fe33c655c  121c  f940bfe2       ldr x2, [sp, #376]
0xf8fe33c6560  1220  f940bbef       ldr x15, [sp, #368]
0xf8fe33c6564  1224  f940b7e7       ldr x7, [sp, #360]
0xf8fe33c6568  1228  f940b3f9       ldr x25, [sp, #352]
0xf8fe33c656c  122c  f940affb       ldr cp, [sp, #344]
0xf8fe33c6570  1230  fd40abe7       ldr d7, [sp, #336]
0xf8fe33c6574  1234  fd40a7e6       ldr d6, [sp, #328]
0xf8fe33c6578  1238  1e2e100a       fmov s10, #0x70 (1.0000)
0xf8fe33c657c  123c  fd40a3eb       ldr d11, [sp, #320]
0xf8fe33c6580  1240  f9409fe3       ldr x3, [sp, #312]
0xf8fe33c6584  1244  fd409bec       ldr d12, [sp, #304]
0xf8fe33c6588  1248  f94097fc       ldr x28, [sp, #296]
0xf8fe33c658c  124c  f9403bea       ldr x10, [sp, #112]
0xf8fe33c6590  1250  3dc00ff1       ldr q17, [sp, #48]
0xf8fe33c6594  1254  fd403fed       ldr d13, [sp, #120]
0xf8fe33c6598  1258  f94093eb       ldr x11, [sp, #288]
0xf8fe33c659c  125c  fd4033ee       ldr d14, [sp, #96]
0xf8fe33c65a0  1260  fd4027f0       ldr d16, [sp, #72]
0xf8fe33c65a4  1264  f94067f4       ldr x20, [sp, #200]
0xf8fe33c65a8  1268  f9408ff7       ldr x23, [sp, #280]
0xf8fe33c65ac  126c  f9408bed       ldr x13, [sp, #272]
0xf8fe33c65b0  1270  f94087e9       ldr x9, [sp, #264]
0xf8fe33c65b4  1274  f94083f5       ldr x21, [sp, #256]
0xf8fe33c65b8  1278  f94077f8       ldr x24, [sp, #232]
0xf8fe33c65bc  127c  f9406ff6       ldr x22, [sp, #216]
0xf8fe33c65c0  1280  f9406be4       ldr x4, [sp, #208]
0xf8fe33c65c4  1284  f94053ee       ldr x14, [sp, #160]
0xf8fe33c65c8  1288  f9404fec       ldr x12, [sp, #152]
0xf8fe33c65cc  128c  3dc007e4       ldr q4, [sp, #16]
0xf8fe33c65d0  1290  3dc003e2       ldr q2, [sp]
0xf8fe33c65d4  1294  3dc017e3       ldr q3, [sp, #80]
0xf8fe33c65d8  1298  3dc023e8       ldr q8, [sp, #128]
0xf8fe33c65dc  129c  fd405fe5       ldr d5, [sp, #184]
0xf8fe33c65e0  12a0  17fffde8       b #-0x860 (addr 0xf8fe33c5d80)
0xf8fe33c65e4  12a4  d503201f       nop

Protected instructions:
 pc offset
        44         
        64         
        b4         
       14c         
       154         
       15c         
       164         
       16c         
       178         
       180         
       188         
       190         
       1c8         
       200         
       208         
       210         
       218         
       238         
       240         
       248         
       260         
       27c         
       284         
       28c         
       294         
       29c         
       2a4         
       2ac         
       2b4         
       2bc         
       2c4         
       2cc         
       2d4         
       2dc         
       2e4         
       2ec         
       2f8         
       3e4         
       3ec         
       3f4         
       3fc         
       408         
       410         
       418         
       41c         
       424         
       42c         
       438         
       57c         
       588         
       5ac         
       5bc         
       5e0         
       5f8         
       600         
       614         
       684         
       748         
       750         
       780         
       7b0         
       7e0         
       81c         
       87c         
       88c         
       8cc         
       8d4         
       910         
       918         
       920         
       928         
       944         
       94c         
       954         
       95c         
       970         
       978         
       9a8         
       9d8         
       a08         
       a44         
       a90         
       a9c         
       ac0         
       acc         
       aec         
       b04         
       b0c         
       b1c         
       b88         
       b90         
       b98         
       ba0         
       c0c         
       c10         
       c20         
       c24         
       c34         
       c38         
       c48         
       c4c         

Source positions:
 pc offset  position
        44        58
        64        95
        b4       164
       148       279
       154       289
       15c       293
       164       300
       16c       304
       178       315
       180       320
       188       325
       190       330
       194       333
       1c0       343
       200       361
       208       368
       210       375
       218       382
       234       413
       240       420
       248       427
       25c       452
       27c       495
       284       502
       28c       509
       294       516
       29c       523
       2a4       530
       2ac       538
       2b4       545
       2bc       552
       2c0       560
       2cc       568
       2d4       575
       2d8       582
       2e0       589
       2e8       596
       2f8       609
       3e4       645
       3ec       655
       3f4       665
       3fc       677
       408       680
       410       687
       418       694
       41c       701
       424       712
       42c       719
       438       742
       57c      1930
       588      1955
       5ac      1984
       5bc      1999
       5dc      2052
       5f4      2078
       5fc      2083
       610      2100
       684      1082
       748      1206
       750      1219
       780      1279
       87c      1713
       88c      1731
       8c8      1800
       8d0      1805
       910      1871
       918      1878
       91c      1885
       924      1892
       944      1339
       94c      1346
       950      1353
       958      1360
       96c      1371
       974      1378
       9a8      1440
       a90      1501
       a9c      1526
       ac0      1555
       acc      1570
       aec      1623
       b00      1649
       b08      1654
       b1c      1671
       b88      2111
       b90      2118
       b94      2125
       b9c      2132
       bb4      2160
       c08      2180
       c10      2183
       c20      2193
       c24      2196
       c34      2206
       c38      2209
       c48      2219
       c4c      2222
       c8c         0
       cec       624
       da0      1014
       e68      1047
       f48      1143
      1018      1156
      10e0      1264
      11c0      1425

Safepoints (stack slots = 66, entries = 1, byte size = 23)
0xf8fe33c5500    1c0  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0xf8fe33c54fc  internal wasm call
0xf8fe33c5f20  internal wasm call
0xf8fe33c5fcc  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c6038  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c6114  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c61e8  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c62c0  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c638c  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c6460  wasm stub call  (0xf8fe32bdbd0)
0xf8fe33c6544  wasm stub call  (0xf8fe32bdbd0)
