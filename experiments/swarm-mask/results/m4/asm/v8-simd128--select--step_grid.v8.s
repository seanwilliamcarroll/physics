name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 4800 = 4800 + 0 padding)
Instructions (size = 4776)
0x2660bae9d340     0  d2800110       movz x16, #0x8
0x2660bae9d344     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x2660bae9d348     8  a9017bfd       stp fp, lr, [sp, #16]
0x2660bae9d34c     c  910043fd       add fp, sp, #0x10 (16)
0x2660bae9d350    10  d107c3ff       sub sp, sp, #0x1f0 (496)
0x2660bae9d354    14  f841f0e1       ldur x1, [x7, #31]
0x2660bae9d358    18  f8520346       ldur x6, [x26, #-224]
0x2660bae9d35c    1c  f9008fe0       str x0, [sp, #280]
0x2660bae9d360    20  f90063e1       str x1, [sp, #192]
0x2660bae9d364    24  eb2663ff       cmp sp, x6
0x2660bae9d368    28  54006329       b.ls #+0xc64 (addr 0x2660bae9dfcc)
0x2660bae9d36c    2c  f842f0e6       ldur x6, [x7, #47]
0x2660bae9d370    30  b94000c8       ldr w8, [x6]
0x2660bae9d374    34  51014104       sub w4, w8, #0x50 (80)
0x2660bae9d378    38  b90000c4       str w4, [x6]
0x2660bae9d37c    3c  2a0003e8       mov w8, w0
0x2660bae9d380    40  91024029       add x9, x1, #0x90 (144)
0x2660bae9d384    44  fc686922       ldr d2, [x9, x8]
0x2660bae9d388    48  5e0c0441       mov s1, v2.s[1]
0x2660bae9d38c    4c  52a75010       movz w16, #0x3a800000
0x2660bae9d390    50  1e270203       fmov s3, w16
0x2660bae9d394    54  1e230824       fmul s4, s1, s3
0x2660bae9d398    58  5e040440       mov s0, v2.s[0]
0x2660bae9d39c    5c  1e230803       fmul s3, s0, s3
0x2660bae9d3a0    60  91028109       add x9, x8, #0xa0 (160)
0x2660bae9d3a4    64  bc696825       ldr s5, [x1, x9]
0x2660bae9d3a8    68  1e2520a0       fcmp s5, s5
0x2660bae9d3ac    6c  1e251c65       fcsel s5, s3, s5, ne
0x2660bae9d3b0    70  1e232060       fcmp s3, s3
0x2660bae9d3b4    74  1e231ca3       fcsel s3, s5, s3, ne
0x2660bae9d3b8    78  1e252060       fcmp s3, s5
0x2660bae9d3bc    7c  1e233ca3       fcsel s3, s5, s3, lo
0x2660bae9d3c0    80  1e232060       fcmp s3, s3
0x2660bae9d3c4    84  1e231c83       fcsel s3, s4, s3, ne
0x2660bae9d3c8    88  1e242080       fcmp s4, s4
0x2660bae9d3cc    8c  1e241c64       fcsel s4, s3, s4, ne
0x2660bae9d3d0    90  1e232080       fcmp s4, s3
0x2660bae9d3d4    94  1e243c63       fcsel s3, s3, s4, lo
0x2660bae9d3d8    98  52840010       movz w16, #0x2000
0x2660bae9d3dc    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x2660bae9d3e0    a0  1e270204       fmov s4, w16
0x2660bae9d3e4    a4  1e240863       fmul s3, s3, s4
0x2660bae9d3e8    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x2660bae9d3ec    ac  1e231883       fdiv s3, s4, s3
0x2660bae9d3f0    b0  9102110a       add x10, x8, #0x84 (132)
0x2660bae9d3f4    b4  bc2a6823       str s3, [x1, x10]
0x2660bae9d3f8    b8  4e040463       dup v3.4s, v3.s[0]
0x2660bae9d3fc    bc  6e23dc42       fmul v2.4s, v2.4s, v3.4s
0x2660bae9d400    c0  4ea18842       frintp v2.4s, v2.4s
0x2660bae9d404    c4  5e040443       mov s3, v2.s[0]
0x2660bae9d408    c8  1e22c065       fcvt d5, s3
0x2660bae9d40c    cc  1e65c0a6       frintz d6, d5
0x2660bae9d410    d0  1e7900cb       fcvtzu w11, d6
0x2660bae9d414    d4  1e630167       ucvtf d7, w11
0x2660bae9d418    d8  f900f7e6       str x6, [sp, #488]
0x2660bae9d41c    dc  f900f3e4       str x4, [sp, #480]
0x2660bae9d420    e0  f900ebe8       str x8, [sp, #464]
0x2660bae9d424    e4  fd00c3e1       str d1, [sp, #384]
0x2660bae9d428    e8  fd00c7e0       str d0, [sp, #392]
0x2660bae9d42c    ec  f900b7e9       str x9, [sp, #360]
0x2660bae9d430    f0  f900dfea       str x10, [sp, #440]
0x2660bae9d434    f4  1e6720c0       fcmp d6, d7
0x2660bae9d438    f8  54005d41       b.ne #+0xba8 (addr 0x2660bae9dfe0)
0x2660bae9d43c    fc  4e040d63       dup v3.4s, w11
0x2660bae9d440   100  5e0c0445       mov s5, v2.s[1]
0x2660bae9d444   104  1e22c0a6       fcvt d6, s5
0x2660bae9d448   108  1e65c0c7       frintz d7, d6
0x2660bae9d44c   10c  1e7900eb       fcvtzu w11, d7
0x2660bae9d450   110  1e630168       ucvtf d8, w11
0x2660bae9d454   114  1e6820e0       fcmp d7, d8
0x2660bae9d458   118  54005da1       b.ne #+0xbb4 (addr 0x2660bae9e00c)
0x2660bae9d45c   11c  4e0c1d63       mov v3.s[1], w11
0x2660bae9d460   120  4f000425       movi v5.4s, #0x1, lsl #0
0x2660bae9d464   124  6ea56463       umax v3.4s, v3.4s, v5.4s
0x2660bae9d468   128  6f00e406       movi v6.2d, #0x0
0x2660bae9d46c   12c  6ea0c847       fcmge v7.4s, v2.4s, #0.0
0x2660bae9d470   130  52a9f010       movz w16, #0x4f800000
0x2660bae9d474   134  4e040e08       dup v8.4s, w16
0x2660bae9d478   138  6ea2e502       fcmgt v2.4s, v8.4s, v2.4s
0x2660bae9d47c   13c  4e221ce2       and v2.16b, v7.16b, v2.16b
0x2660bae9d480   140  6e651c62       bsl v2.16b, v3.16b, v5.16b
0x2660bae9d484   144  9102202b       add x11, x1, #0x88 (136)
0x2660bae9d488   148  8b08016c       add x12, x11, x8
0x2660bae9d48c   14c  0d008582       st1 {v2.d}[0], [x12]
0x2660bae9d490   150  9103310c       add x12, x8, #0xcc (204)
0x2660bae9d494   154  b86c682c       ldr w12, [x1, x12]
0x2660bae9d498   158  9100a08d       add x13, x4, #0x28 (40)
0x2660bae9d49c   15c  b82d682c       str w12, [x1, x13]
0x2660bae9d4a0   160  9103110c       add x12, x8, #0xc4 (196)
0x2660bae9d4a4   164  f86c682c       ldr x12, [x1, x12]
0x2660bae9d4a8   168  9100808d       add x13, x4, #0x20 (32)
0x2660bae9d4ac   16c  f82d682c       str x12, [x1, x13]
0x2660bae9d4b0   170  1101800c       add w12, w0, #0x60 (96)
0x2660bae9d4b4   174  9100110d       add x13, x8, #0x4 (4)
0x2660bae9d4b8   178  b86d6822       ldr w2, [x1, x13]
0x2660bae9d4bc   17c  9100210e       add x14, x8, #0x8 (8)
0x2660bae9d4c0   180  b86e6823       ldr w3, [x1, x14]
0x2660bae9d4c4   184  9100410f       add x15, x8, #0x10 (16)
0x2660bae9d4c8   188  b86f6833       ldr w19, [x1, x15]
0x2660bae9d4cc   18c  91005114       add x20, x8, #0x14 (20)
0x2660bae9d4d0   190  b8746825       ldr w5, [x1, x20]
0x2660bae9d4d4   194  3d8017e5       str q5, [sp, #80]
0x2660bae9d4d8   198  3d800be6       str q6, [sp, #32]
0x2660bae9d4dc   19c  3d8023e8       str q8, [sp, #128]
0x2660bae9d4e0   1a0  f900e3eb       str x11, [sp, #448]
0x2660bae9d4e4   1a4  f900bbed       str x13, [sp, #368]
0x2660bae9d4e8   1a8  f900efee       str x14, [sp, #472]
0x2660bae9d4ec   1ac  f900bfef       str x15, [sp, #376]
0x2660bae9d4f0   1b0  f900e7f4       str x20, [sp, #456]
0x2660bae9d4f4   1b4  aa0c03e0       mov x0, x12
0x2660bae9d4f8   1b8  aa1303e4       mov x4, x19
0x2660bae9d4fc   1bc  97fbe060       bl #-0x107e80 (addr 0x2660bad9567c)
0x2660bae9d500   1c0  f94063e1       ldr x1, [sp, #192]
0x2660bae9d504   1c4  f940efe6       ldr x6, [sp, #472]
0x2660bae9d508   1c8  b8666826       ldr w6, [x1, x6]
0x2660bae9d50c   1cc  f900efe6       str x6, [sp, #472]
0x2660bae9d510   1d0  35000106       cbnz w6, #+0x20 (addr 0x2660bae9d530)
0x2660bae9d514   1d4  f940f3e4       ldr x4, [sp, #480]
0x2660bae9d518   1d8  11014081       add w1, w4, #0x50 (80)
0x2660bae9d51c   1dc  f940f7e8       ldr x8, [sp, #488]
0x2660bae9d520   1e0  b9000101       str w1, [x8]
0x2660bae9d524   1e4  910003bf       mov sp, fp
0x2660bae9d528   1e8  a8c17bfd       ldp fp, lr, [sp], #16
0x2660bae9d52c   1ec  d65f03c0       ret
0x2660bae9d530   1f0  f9408fe0       ldr x0, [sp, #280]
0x2660bae9d534   1f4  11028002       add w2, w0, #0xa0 (160)
0x2660bae9d538   1f8  f940ebe8       ldr x8, [sp, #464]
0x2660bae9d53c   1fc  91017109       add x9, x8, #0x5c (92)
0x2660bae9d540   200  b8696829       ldr w9, [x1, x9]
0x2660bae9d544   204  9101410a       add x10, x8, #0x50 (80)
0x2660bae9d548   208  b86a682a       ldr w10, [x1, x10]
0x2660bae9d54c   20c  9101110b       add x11, x8, #0x44 (68)
0x2660bae9d550   210  b86b682b       ldr w11, [x1, x11]
0x2660bae9d554   214  9100e10c       add x12, x8, #0x38 (56)
0x2660bae9d558   218  b86c682c       ldr w12, [x1, x12]
0x2660bae9d55c   21c  6b0c017f       cmp w11, w12
0x2660bae9d560   220  1a8c316d       csel w13, w11, w12, lo
0x2660bae9d564   224  6b0d015f       cmp w10, w13
0x2660bae9d568   228  1a8d314b       csel w11, w10, w13, lo
0x2660bae9d56c   22c  6b0b013f       cmp w9, w11
0x2660bae9d570   230  1a8b312a       csel w10, w9, w11, lo
0x2660bae9d574   234  f940e7e9       ldr x9, [sp, #456]
0x2660bae9d578   238  b8696829       ldr w9, [x1, x9]
0x2660bae9d57c   23c  9100810b       add x11, x8, #0x20 (32)
0x2660bae9d580   240  b86b682b       ldr w11, [x1, x11]
0x2660bae9d584   244  9100b10c       add x12, x8, #0x2c (44)
0x2660bae9d588   248  b86c682c       ldr w12, [x1, x12]
0x2660bae9d58c   24c  6b0c017f       cmp w11, w12
0x2660bae9d590   250  1a8c316d       csel w13, w11, w12, lo
0x2660bae9d594   254  6b0d013f       cmp w9, w13
0x2660bae9d598   258  1a8d312b       csel w11, w9, w13, lo
0x2660bae9d59c   25c  f940e3ec       ldr x12, [sp, #448]
0x2660bae9d5a0   260  fc686982       ldr d2, [x12, x8]
0x2660bae9d5a4   264  3dc017e3       ldr q3, [sp, #80]
0x2660bae9d5a8   268  4e040464       dup v4.4s, v3.s[0]
0x2660bae9d5ac   26c  6e0c0444       mov v4.s[1], v2.s[0]
0x2660bae9d5b0   270  6ea36442       umax v2.4s, v2.4s, v3.4s
0x2660bae9d5b4   274  6ea38442       sub v2.4s, v2.4s, v3.4s
0x2660bae9d5b8   278  9101610c       add x12, x8, #0x58 (88)
0x2660bae9d5bc   27c  b86c682c       ldr w12, [x1, x12]
0x2660bae9d5c0   280  9101310e       add x14, x8, #0x4c (76)
0x2660bae9d5c4   284  b86e682e       ldr w14, [x1, x14]
0x2660bae9d5c8   288  9101010f       add x15, x8, #0x40 (64)
0x2660bae9d5cc   28c  b86f682f       ldr w15, [x1, x15]
0x2660bae9d5d0   290  9100d113       add x19, x8, #0x34 (52)
0x2660bae9d5d4   294  b8736833       ldr w19, [x1, x19]
0x2660bae9d5d8   298  9101f114       add x20, x8, #0x7c (124)
0x2660bae9d5dc   29c  b8746834       ldr w20, [x1, x20]
0x2660bae9d5e0   2a0  91020115       add x21, x8, #0x80 (128)
0x2660bae9d5e4   2a4  b8756835       ldr w21, [x1, x21]
0x2660bae9d5e8   2a8  91019116       add x22, x8, #0x64 (100)
0x2660bae9d5ec   2ac  b8766836       ldr w22, [x1, x22]
0x2660bae9d5f0   2b0  9101a117       add x23, x8, #0x68 (104)
0x2660bae9d5f4   2b4  b8776837       ldr w23, [x1, x23]
0x2660bae9d5f8   2b8  91022118       add x24, x8, #0x88 (136)
0x2660bae9d5fc   2bc  b8786838       ldr w24, [x1, x24]
0x2660bae9d600   2c0  f940dff9       ldr x25, [sp, #440]
0x2660bae9d604   2c4  bc796825       ldr s5, [x1, x25]
0x2660bae9d608   2c8  91007119       add x25, x8, #0x1c (28)
0x2660bae9d60c   2cc  b8796839       ldr w25, [x1, x25]
0x2660bae9d610   2d0  9100a11b       add cp, x8, #0x28 (40)
0x2660bae9d614   2d4  b87b683b       ldr w27, [x1, x27]
0x2660bae9d618   2d8  f940bffc       ldr x28, [sp, #376]
0x2660bae9d61c   2dc  b87c683c       ldr w28, [x1, x28]
0x2660bae9d620   2e0  f940bbe3       ldr x3, [sp, #368]
0x2660bae9d624   2e4  b8636823       ldr w3, [x1, x3]
0x2660bae9d628   2e8  f940b7e4       ldr x4, [sp, #360]
0x2660bae9d62c   2ec  bc646826       ldr s6, [x1, x4]
0x2660bae9d630   2f0  1e2608c6       fmul s6, s6, s6
0x2660bae9d634   2f4  91029108       add x8, x8, #0xa4 (164)
0x2660bae9d638   2f8  bc686827       ldr s7, [x1, x8]
0x2660bae9d63c   2fc  1e2708e7       fmul s7, s7, s7
0x2660bae9d640   300  f900cbe2       str x2, [sp, #400]
0x2660bae9d644   304  f900cfea       str x10, [sp, #408]
0x2660bae9d648   308  f90087e9       str x9, [sp, #264]
0x2660bae9d64c   30c  f9008bed       str x13, [sp, #272]
0x2660bae9d650   310  f90037eb       str x11, [sp, #104]
0x2660bae9d654   314  3d8007e4       str q4, [sp, #16]
0x2660bae9d658   318  3d8003e2       str q2, [sp]
0x2660bae9d65c   31c  f900e3ec       str x12, [sp, #448]
0x2660bae9d660   320  f900dbee       str x14, [sp, #432]
0x2660bae9d664   324  f900d7ef       str x15, [sp, #424]
0x2660bae9d668   328  f900d3f3       str x19, [sp, #416]
0x2660bae9d66c   32c  f9007ff4       str x20, [sp, #248]
0x2660bae9d670   330  f9007bf5       str x21, [sp, #240]
0x2660bae9d674   334  f9005bf6       str x22, [sp, #176]
0x2660bae9d678   338  f90057f7       str x23, [sp, #168]
0x2660bae9d67c   33c  f9004bf8       str x24, [sp, #144]
0x2660bae9d680   340  fd005fe5       str d5, [sp, #184]
0x2660bae9d684   344  f900b3f9       str x25, [sp, #352]
0x2660bae9d688   348  f900affb       str cp, [sp, #344]
0x2660bae9d68c   34c  f90097fc       str x28, [sp, #296]
0x2660bae9d690   350  f9009fe3       str x3, [sp, #312]
0x2660bae9d694   354  fd00a7e6       str d6, [sp, #328]
0x2660bae9d698   358  fd00abe7       str d7, [sp, #336]
0x2660bae9d69c   35c  aa0103e4       mov x4, x1
0x2660bae9d6a0   360  d2800001       movz x1, #0x0
0x2660bae9d6a4   364  f900e7e1       str x1, [sp, #456]
0x2660bae9d6a8   368  14000016       b #+0x58 (addr 0x2660bae9d700)
0x2660bae9d6ac   36c  f94037eb       ldr x11, [sp, #104]
0x2660bae9d6b0   370  fd405fe5       ldr d5, [sp, #184]
0x2660bae9d6b4   374  f9408fe0       ldr x0, [sp, #280]
0x2660bae9d6b8   378  aa0d03e4       mov x4, x13
0x2660bae9d6bc   37c  aa0803e6       mov x6, x8
0x2660bae9d6c0   380  f940b3f9       ldr x25, [sp, #352]
0x2660bae9d6c4   384  f940affb       ldr cp, [sp, #344]
0x2660bae9d6c8   388  fd40abe7       ldr d7, [sp, #336]
0x2660bae9d6cc   38c  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9d6d0   390  3dc017e3       ldr q3, [sp, #80]
0x2660bae9d6d4   394  f9409fe3       ldr x3, [sp, #312]
0x2660bae9d6d8   398  f94097fc       ldr x28, [sp, #296]
0x2660bae9d6dc   39c  f9408bed       ldr x13, [sp, #272]
0x2660bae9d6e0   3a0  f94087e9       ldr x9, [sp, #264]
0x2660bae9d6e4   3a4  f9407ff4       ldr x20, [sp, #248]
0x2660bae9d6e8   3a8  f9407bf5       ldr x21, [sp, #240]
0x2660bae9d6ec   3ac  f9405bf6       ldr x22, [sp, #176]
0x2660bae9d6f0   3b0  f94057f7       ldr x23, [sp, #168]
0x2660bae9d6f4   3b4  f9404bf8       ldr x24, [sp, #144]
0x2660bae9d6f8   3b8  3dc007e4       ldr q4, [sp, #16]
0x2660bae9d6fc   3bc  3dc003e2       ldr q2, [sp]
0x2660bae9d700   3c0  f8520345       ldur x5, [x26, #-224]
0x2660bae9d704   3c4  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9d708   3c8  3dc023e8       ldr q8, [sp, #128]
0x2660bae9d70c   3cc  eb2563ff       cmp sp, x5
0x2660bae9d710   3d0  540048e9       b.ls #+0x91c (addr 0x2660bae9e02c)
0x2660bae9d714   3d4  6b01017f       cmp w11, w1
0x2660bae9d718   3d8  54004429       b.ls #+0x884 (addr 0x2660bae9df9c)
0x2660bae9d71c   3dc  531e7425       lsl w5, w1, #2
0x2660bae9d720   3e0  0b050067       add w7, w3, w5
0x2660bae9d724   3e4  bc67688b       ldr s11, [x4, x7]
0x2660bae9d728   3e8  0b050387       add w7, w28, w5
0x2660bae9d72c   3ec  bc67688c       ldr s12, [x4, x7]
0x2660bae9d730   3f0  0b050327       add w7, w25, w5
0x2660bae9d734   3f4  bc67688d       ldr s13, [x4, x7]
0x2660bae9d738   3f8  0b050367       add w7, w27, w5
0x2660bae9d73c   3fc  bc67688e       ldr s14, [x4, x7]
0x2660bae9d740   400  f940f3e8       ldr x8, [sp, #480]
0x2660bae9d744   404  91003107       add x7, x8, #0xc (12)
0x2660bae9d748   408  bc27688e       str s14, [x4, x7]
0x2660bae9d74c   40c  91002107       add x7, x8, #0x8 (8)
0x2660bae9d750   410  bc27688d       str s13, [x4, x7]
0x2660bae9d754   414  91001107       add x7, x8, #0x4 (4)
0x2660bae9d758   418  bc27688c       str s12, [x4, x7]
0x2660bae9d75c   41c  bc28688b       str s11, [x4, x8]
0x2660bae9d760   420  91012107       add x7, x8, #0x48 (72)
0x2660bae9d764   424  b827689f       str wzr, [x4, x7]
0x2660bae9d768   428  9101010a       add x10, x8, #0x40 (64)
0x2660bae9d76c   42c  f82a689f       str xzr, [x4, x10]
0x2660bae9d770   430  6f00e40d       movi v13.2d, #0x0
0x2660bae9d774   434  9100c10b       add x11, x8, #0x30 (48)
0x2660bae9d778   438  3cab688d       str q13, [x4, x11]
0x2660bae9d77c   43c  1e25096d       fmul s13, s11, s5
0x2660bae9d780   440  1e2541ad       frintm s13, s13
0x2660bae9d784   444  1e2d21a0       fcmp s13, s13
0x2660bae9d788   448  1e2d1ded       fcsel s13, s15, s13, ne
0x2660bae9d78c   44c  1e2021a8       fcmp s13, #0.0
0x2660bae9d790   450  1e2fcdad       fcsel s13, s13, s15, gt
0x2660bae9d794   454  4e0405ae       dup v14.4s, v13.s[0]
0x2660bae9d798   458  1e250990       fmul s16, s12, s5
0x2660bae9d79c   45c  1e254210       frintm s16, s16
0x2660bae9d7a0   460  1e302200       fcmp s16, s16
0x2660bae9d7a4   464  1e301df0       fcsel s16, s15, s16, ne
0x2660bae9d7a8   468  1e202208       fcmp s16, #0.0
0x2660bae9d7ac   46c  1e2fce11       fcsel s17, s16, s15, gt
0x2660bae9d7b0   470  f90063e4       str x4, [sp, #192]
0x2660bae9d7b4   474  1e260204       fmov w4, s16
0x2660bae9d7b8   478  6a04009f       tst w4, w4
0x2660bae9d7bc   47c  1e301e30       fcsel s16, s17, s16, ne
0x2660bae9d7c0   480  1e202228       fcmp s17, #0.0
0x2660bae9d7c4   484  1e310e10       fcsel s16, s16, s17, eq
0x2660bae9d7c8   488  6e0c060e       mov v14.s[1], v16.s[0]
0x2660bae9d7cc   48c  6eaee50e       fcmgt v14.4s, v8.4s, v14.4s
0x2660bae9d7d0   490  4e040c11       dup v17.4s, w0
0x2660bae9d7d4   494  1e22c1b2       fcvt d18, s13
0x2660bae9d7d8   498  1e65c253       frintz d19, d18
0x2660bae9d7dc   49c  1e790260       fcvtzu w0, d19
0x2660bae9d7e0   4a0  1e630014       ucvtf d20, w0
0x2660bae9d7e4   4a4  f900ebe1       str x1, [sp, #464]
0x2660bae9d7e8   4a8  f900dfe5       str x5, [sp, #440]
0x2660bae9d7ec   4ac  f900bbea       str x10, [sp, #368]
0x2660bae9d7f0   4b0  f900bfeb       str x11, [sp, #376]
0x2660bae9d7f4   4b4  1e742260       fcmp d19, d20
0x2660bae9d7f8   4b8  54004541       b.ne #+0x8a8 (addr 0x2660bae9e0a0)
0x2660bae9d7fc   4bc  4eb11e2d       mov v13.16b, v17.16b
0x2660bae9d800   4c0  4e041c0d       mov v13.s[0], w0
0x2660bae9d804   4c4  1e22c211       fcvt d17, s16
0x2660bae9d808   4c8  1e65c232       frintz d18, d17
0x2660bae9d80c   4cc  1e790240       fcvtzu w0, d18
0x2660bae9d810   4d0  1e630013       ucvtf d19, w0
0x2660bae9d814   4d4  1e732240       fcmp d18, d19
0x2660bae9d818   4d8  54004541       b.ne #+0x8a8 (addr 0x2660bae9e0c0)
0x2660bae9d81c   4dc  4e0c1c0d       mov v13.s[1], w0
0x2660bae9d820   4e0  6ead6c4d       umin v13.4s, v2.4s, v13.4s
0x2660bae9d824   4e4  4e2d1dcd       and v13.16b, v14.16b, v13.16b
0x2660bae9d828   4e8  4ea385ae       add v14.4s, v13.4s, v3.4s
0x2660bae9d82c   4ec  6eae6c4e       umin v14.4s, v2.4s, v14.4s
0x2660bae9d830   4f0  4eae9c90       mul v16.4s, v4.4s, v14.4s
0x2660bae9d834   4f4  0e0c3e00       mov w0, v16.s[1]
0x2660bae9d838   4f8  0e043da4       mov w4, v13.s[0]
0x2660bae9d83c   4fc  7100009f       cmp w4, #0x0 (0)
0x2660bae9d840   500  9a9f07ec       cset x12, ne
0x2660bae9d844   504  4b0c008c       sub w12, w4, w12
0x2660bae9d848   508  0b0c0004       add w4, w0, w12
0x2660bae9d84c   50c  4eae8490       add v16.4s, v4.4s, v14.4s
0x2660bae9d850   510  0e043e0e       mov w14, v16.s[0]
0x2660bae9d854   514  0b0e0000       add w0, w0, w14
0x2660bae9d858   518  6b17009f       cmp w4, w23
0x2660bae9d85c   51c  7a573002       ccmp w0, w23, #nzCv, lo
0x2660bae9d860   520  9a9f27ef       cset x15, lo
0x2660bae9d864   524  0e0c3db3       mov w19, v13.s[1]
0x2660bae9d868   528  7100027f       cmp w19, #0x0 (0)
0x2660bae9d86c   52c  9a9f07e2       cset x2, ne
0x2660bae9d870   530  4b020273       sub w19, w19, w2
0x2660bae9d874   534  0b000ac0       add w0, w22, w0, lsl #2
0x2660bae9d878   538  0b040ac2       add w2, w22, w4, lsl #2
0x2660bae9d87c   53c  0e0c3dc4       mov w4, v14.s[1]
0x2660bae9d880   540  f9006fef       str x15, [sp, #216]
0x2660bae9d884   544  f90073e0       str x0, [sp, #224]
0x2660bae9d888   548  f90077e2       str x2, [sp, #232]
0x2660bae9d88c   54c  f940e7e5       ldr x5, [sp, #456]
0x2660bae9d890   550  2f00e40d       movi d13, #0x0
0x2660bae9d894   554  f9003bf3       str x19, [sp, #112]
0x2660bae9d898   558  f94063f3       ldr x19, [sp, #192]
0x2660bae9d89c   55c  d2800002       movz x2, #0x0
0x2660bae9d8a0   560  3dc00bf1       ldr q17, [sp, #32]
0x2660bae9d8a4   564  f90093e2       str x2, [sp, #288]
0x2660bae9d8a8   568  4ead1dae       mov v14.16b, v13.16b
0x2660bae9d8ac   56c  4ead1db0       mov v16.16b, v13.16b
0x2660bae9d8b0   570  1400002f       b #+0xbc (addr 0x2660bae9d96c)
0x2660bae9d8b4   574  531e756b       lsl w11, w11, #2
0x2660bae9d8b8   578  0b0b0386       add w6, w28, w11
0x2660bae9d8bc   57c  bc666a72       ldr s18, [x19, x6]
0x2660bae9d8c0   580  1e323993       fsub s19, s12, s18
0x2660bae9d8c4   584  0b0b0066       add w6, w3, w11
0x2660bae9d8c8   588  bc666a74       ldr s20, [x19, x6]
0x2660bae9d8cc   58c  1e343975       fsub s21, s11, s20
0x2660bae9d8d0   590  1e350ab6       fmul s22, s21, s21
0x2660bae9d8d4   594  1e330a77       fmul s23, s19, s19
0x2660bae9d8d8   598  1e372ad6       fadd s22, s22, s23
0x2660bae9d8dc   59c  1e2722c0       fcmp s22, s7
0x2660bae9d8e0   5a0  1e2f3d57       fcsel s23, s10, s15, lo
0x2660bae9d8e4   5a4  1e370a73       fmul s19, s19, s23
0x2660bae9d8e8   5a8  1e332a10       fadd s16, s16, s19
0x2660bae9d8ec   5ac  bc276a70       str s16, [x19, x7]
0x2660bae9d8f0   5b0  1e370ab3       fmul s19, s21, s23
0x2660bae9d8f4   5b4  1e3329ce       fadd s14, s14, s19
0x2660bae9d8f8   5b8  91011106       add x6, x8, #0x44 (68)
0x2660bae9d8fc   5bc  bc266a6e       str s14, [x19, x6]
0x2660bae9d900   5c0  1e2622c0       fcmp s22, s6
0x2660bae9d904   5c4  1e2f3d53       fcsel s19, s10, s15, lo
0x2660bae9d908   5c8  1e3620e0       fcmp s7, s22
0x2660bae9d90c   5cc  1e2f9e73       fcsel s19, s19, s15, ls
0x2660bae9d910   5d0  1e2022c8       fcmp s22, #0.0
0x2660bae9d914   5d4  1e2fce73       fcsel s19, s19, s15, gt
0x2660bae9d918   5d8  1e3329ad       fadd s13, s13, s19
0x2660bae9d91c   5dc  f940bbe0       ldr x0, [sp, #368]
0x2660bae9d920   5e0  bc206a6d       str s13, [x19, x0]
0x2660bae9d924   5e4  0b0b0366       add w6, w27, w11
0x2660bae9d928   5e8  0b0b032b       add w11, w25, w11
0x2660bae9d92c   5ec  4e040694       dup v20.4s, v20.s[0]
0x2660bae9d930   5f0  6e0c0654       mov v20.s[1], v18.s[0]
0x2660bae9d934   5f4  8b0b026b       add x11, x19, x11
0x2660bae9d938   5f8  4d408174       ld1 {v20.s}[2], [x11]
0x2660bae9d93c   5fc  8b060266       add x6, x19, x6
0x2660bae9d940   600  4d4090d4       ld1 {v20.s}[3], [x6]
0x2660bae9d944   604  4e040672       dup v18.4s, v19.s[0]
0x2660bae9d948   608  6e32de92       fmul v18.4s, v20.4s, v18.4s
0x2660bae9d94c   60c  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x2660bae9d950   610  f940bfe1       ldr x1, [sp, #376]
0x2660bae9d954   614  3ca16a71       str q17, [x19, x1]
0x2660bae9d958   618  f940ebe1       ldr x1, [sp, #464]
0x2660bae9d95c   61c  f940efe6       ldr x6, [sp, #472]
0x2660bae9d960   620  f9003be2       str x2, [sp, #112]
0x2660bae9d964   624  f90093ef       str x15, [sp, #288]
0x2660bae9d968   628  aa0a03e2       mov x2, x10
0x2660bae9d96c   62c  f8520340       ldur x0, [x26, #-224]
0x2660bae9d970   630  eb2063ff       cmp sp, x0
0x2660bae9d974   634  54003b69       b.ls #+0x76c (addr 0x2660bae9e0e0)
0x2660bae9d978   638  340000a2       cbz w2, #+0x14 (addr 0x2660bae9d98c)
0x2660bae9d97c   63c  6b05005f       cmp w2, w5
0x2660bae9d980   640  54000060       b.eq #+0xc (addr 0x2660bae9d98c)
0x2660bae9d984   644  d2800000       movz x0, #0x0
0x2660bae9d988   648  14000002       b #+0x8 (addr 0x2660bae9d990)
0x2660bae9d98c   64c  d2800020       movz x0, #0x1
0x2660bae9d990   650  aa0203eb       mov x11, x2
0x2660bae9d994   654  f94093ef       ldr x15, [sp, #288]
0x2660bae9d998   658  f9403be2       ldr x2, [sp, #112]
0x2660bae9d99c   65c  14000004       b #+0x10 (addr 0x2660bae9d9ac)
0x2660bae9d9a0   660  aa0003eb       mov x11, x0
0x2660bae9d9a4   664  f9408fe0       ldr x0, [sp, #280]
0x2660bae9d9a8   668  aa0a03e2       mov x2, x10
0x2660bae9d9ac   66c  f852034a       ldur x10, [x26, #-224]
0x2660bae9d9b0   670  eb2a63ff       cmp sp, x10
0x2660bae9d9b4   674  54003fa9       b.ls #+0x7f4 (addr 0x2660bae9e1a8)
0x2660bae9d9b8   678  35000340       cbnz w0, #+0x68 (addr 0x2660bae9da20)
0x2660bae9d9bc   67c  1100116a       add w10, w11, #0x4 (4)
0x2660bae9d9c0   680  2a0b03eb       mov w11, w11
0x2660bae9d9c4   684  b86b6a6b       ldr w11, [x19, x11]
0x2660bae9d9c8   688  6b01017f       cmp w11, w1
0x2660bae9d9cc   68c  540000e0       b.eq #+0x1c (addr 0x2660bae9d9e8)
0x2660bae9d9d0   690  6b0b00df       cmp w6, w11
0x2660bae9d9d4   694  540000a9       b.ls #+0x14 (addr 0x2660bae9d9e8)
0x2660bae9d9d8   698  6b0b013f       cmp w9, w11
0x2660bae9d9dc   69c  54000069       b.ls #+0xc (addr 0x2660bae9d9e8)
0x2660bae9d9e0   6a0  6b0d017f       cmp w11, w13
0x2660bae9d9e4   6a4  54fff683       b.lo #-0x130 (addr 0x2660bae9d8b4)
0x2660bae9d9e8   6a8  6b05015f       cmp w10, w5
0x2660bae9d9ec   6ac  540000c0       b.eq #+0x18 (addr 0x2660bae9da04)
0x2660bae9d9f0   6b0  f940bbeb       ldr x11, [sp, #368]
0x2660bae9d9f4   6b4  aa0a03e0       mov x0, x10
0x2660bae9d9f8   6b8  aa0203ea       mov x10, x2
0x2660bae9d9fc   6bc  f940bfe2       ldr x2, [sp, #376]
0x2660bae9da00   6c0  14000122       b #+0x488 (addr 0x2660bae9de88)
0x2660bae9da04   6c4  f940bbeb       ldr x11, [sp, #368]
0x2660bae9da08   6c8  aa0a03e0       mov x0, x10
0x2660bae9da0c   6cc  aa0203ea       mov x10, x2
0x2660bae9da10   6d0  d2800030       movz x16, #0x1
0x2660bae9da14   6d4  f9008ff0       str x16, [sp, #280]
0x2660bae9da18   6d8  f940bfe2       ldr x2, [sp, #376]
0x2660bae9da1c   6dc  17ffffe1       b #-0x7c (addr 0x2660bae9d9a0)
0x2660bae9da20   6e0  72001dff       tst w15, #0xff
0x2660bae9da24   6e4  54002621       b.ne #+0x4c4 (addr 0x2660bae9dee8)
0x2660bae9da28   6e8  6b02009f       cmp w4, w2
0x2660bae9da2c   6ec  540024c3       b.lo #+0x498 (addr 0x2660bae9dec4)
0x2660bae9da30   6f0  14000003       b #+0xc (addr 0x2660bae9da3c)
0x2660bae9da34   6f4  aa0b03e0       mov x0, x11
0x2660bae9da38   6f8  aa0a03e2       mov x2, x10
0x2660bae9da3c   6fc  f852034a       ldur x10, [x26, #-224]
0x2660bae9da40   700  eb2a63ff       cmp sp, x10
0x2660bae9da44   704  54004229       b.ls #+0x844 (addr 0x2660bae9e288)
0x2660bae9da48   708  6b02009f       cmp w4, w2
0x2660bae9da4c   70c  540011a9       b.ls #+0x234 (addr 0x2660bae9dc80)
0x2660bae9da50   710  14000002       b #+0x8 (addr 0x2660bae9da58)
0x2660bae9da54   714  aa0a03e2       mov x2, x10
0x2660bae9da58   718  f852034a       ldur x10, [x26, #-224]
0x2660bae9da5c   71c  eb2a63ff       cmp sp, x10
0x2660bae9da60   720  540047c9       b.ls #+0x8f8 (addr 0x2660bae9e358)
0x2660bae9da64   724  1100044a       add w10, w2, #0x1 (1)
0x2660bae9da68   728  1b187c40       mul w0, w2, w24
0x2660bae9da6c   72c  0b0c000b       add w11, w0, w12
0x2660bae9da70   730  6b0b02ff       cmp w23, w11
0x2660bae9da74   734  540008e9       b.ls #+0x11c (addr 0x2660bae9db90)
0x2660bae9da78   738  0b0e0000       add w0, w0, w14
0x2660bae9da7c   73c  6b0002ff       cmp w23, w0
0x2660bae9da80   740  54000889       b.ls #+0x110 (addr 0x2660bae9db90)
0x2660bae9da84   744  0b000acf       add w15, w22, w0, lsl #2
0x2660bae9da88   748  b86f6a60       ldr w0, [x19, x15]
0x2660bae9da8c   74c  0b0b0acb       add w11, w22, w11, lsl #2
0x2660bae9da90   750  b86b6a6b       ldr w11, [x19, x11]
0x2660bae9da94   754  6b0b001f       cmp w0, w11
0x2660bae9da98   758  540007c3       b.lo #+0xf8 (addr 0x2660bae9db90)
0x2660bae9da9c   75c  6b0002bf       cmp w21, w0
0x2660bae9daa0   760  54000783       b.lo #+0xf0 (addr 0x2660bae9db90)
0x2660bae9daa4   764  6b0b001f       cmp w0, w11
0x2660bae9daa8   768  54000740       b.eq #+0xe8 (addr 0x2660bae9db90)
0x2660bae9daac   76c  0b0b0a8f       add w15, w20, w11, lsl #2
0x2660bae9dab0   770  4b0b000b       sub w11, w0, w11
0x2660bae9dab4   774  531e756b       lsl w11, w11, #2
0x2660bae9dab8   778  0b0b01e5       add w5, w15, w11
0x2660bae9dabc   77c  110011e0       add w0, w15, #0x4 (4)
0x2660bae9dac0   780  b86f6a62       ldr w2, [x19, x15]
0x2660bae9dac4   784  6b01005f       cmp w2, w1
0x2660bae9dac8   788  540000e0       b.eq #+0x1c (addr 0x2660bae9dae4)
0x2660bae9dacc   78c  6b0200df       cmp w6, w2
0x2660bae9dad0   790  540000a9       b.ls #+0x14 (addr 0x2660bae9dae4)
0x2660bae9dad4   794  6b02013f       cmp w9, w2
0x2660bae9dad8   798  54000069       b.ls #+0xc (addr 0x2660bae9dae4)
0x2660bae9dadc   79c  6b0d005f       cmp w2, w13
0x2660bae9dae0   7a0  540006a3       b.lo #+0xd4 (addr 0x2660bae9dbb4)
0x2660bae9dae4   7a4  5100116b       sub w11, w11, #0x4 (4)
0x2660bae9dae8   7a8  3400052b       cbz w11, #+0xa4 (addr 0x2660bae9db8c)
0x2660bae9daec   7ac  110021e2       add w2, w15, #0x8 (8)
0x2660bae9daf0   7b0  b8606a60       ldr w0, [x19, x0]
0x2660bae9daf4   7b4  6b01001f       cmp w0, w1
0x2660bae9daf8   7b8  540000e0       b.eq #+0x1c (addr 0x2660bae9db14)
0x2660bae9dafc   7bc  6b0000df       cmp w6, w0
0x2660bae9db00   7c0  540000a9       b.ls #+0x14 (addr 0x2660bae9db14)
0x2660bae9db04   7c4  6b00013f       cmp w9, w0
0x2660bae9db08   7c8  54000069       b.ls #+0xc (addr 0x2660bae9db14)
0x2660bae9db0c   7cc  6b0d001f       cmp w0, w13
0x2660bae9db10   7d0  54000463       b.lo #+0x8c (addr 0x2660bae9db9c)
0x2660bae9db14   7d4  5100116b       sub w11, w11, #0x4 (4)
0x2660bae9db18   7d8  340003cb       cbz w11, #+0x78 (addr 0x2660bae9db90)
0x2660bae9db1c   7dc  110031e0       add w0, w15, #0xc (12)
0x2660bae9db20   7e0  b8626a62       ldr w2, [x19, x2]
0x2660bae9db24   7e4  6b01005f       cmp w2, w1
0x2660bae9db28   7e8  540000e0       b.eq #+0x1c (addr 0x2660bae9db44)
0x2660bae9db2c   7ec  6b0200df       cmp w6, w2
0x2660bae9db30   7f0  540000a9       b.ls #+0x14 (addr 0x2660bae9db44)
0x2660bae9db34   7f4  6b02013f       cmp w9, w2
0x2660bae9db38   7f8  54000069       b.ls #+0xc (addr 0x2660bae9db44)
0x2660bae9db3c   7fc  6b0d005f       cmp w2, w13
0x2660bae9db40   800  540003a3       b.lo #+0x74 (addr 0x2660bae9dbb4)
0x2660bae9db44   804  5100116b       sub w11, w11, #0x4 (4)
0x2660bae9db48   808  3400022b       cbz w11, #+0x44 (addr 0x2660bae9db8c)
0x2660bae9db4c   80c  f8520342       ldur x2, [x26, #-224]
0x2660bae9db50   810  eb2263ff       cmp sp, x2
0x2660bae9db54   814  54004669       b.ls #+0x8cc (addr 0x2660bae9e420)
0x2660bae9db58   818  110041ef       add w15, w15, #0x10 (16)
0x2660bae9db5c   81c  b8606a60       ldr w0, [x19, x0]
0x2660bae9db60   820  6b01001f       cmp w0, w1
0x2660bae9db64   824  540000e0       b.eq #+0x1c (addr 0x2660bae9db80)
0x2660bae9db68   828  6b0000df       cmp w6, w0
0x2660bae9db6c   82c  540000a9       b.ls #+0x14 (addr 0x2660bae9db80)
0x2660bae9db70   830  6b00013f       cmp w9, w0
0x2660bae9db74   834  54000069       b.ls #+0xc (addr 0x2660bae9db80)
0x2660bae9db78   838  6b0d001f       cmp w0, w13
0x2660bae9db7c   83c  54000183       b.lo #+0x30 (addr 0x2660bae9dbac)
0x2660bae9db80   840  5100116b       sub w11, w11, #0x4 (4)
0x2660bae9db84   844  35fff9cb       cbnz w11, #-0xc8 (addr 0x2660bae9dabc)
0x2660bae9db88   848  14000002       b #+0x8 (addr 0x2660bae9db90)
0x2660bae9db8c   84c  aa0203e0       mov x0, x2
0x2660bae9db90   850  6b04015f       cmp w10, w4
0x2660bae9db94   854  54fff601       b.ne #-0x140 (addr 0x2660bae9da54)
0x2660bae9db98   858  14000038       b #+0xe0 (addr 0x2660bae9dc78)
0x2660bae9db9c   85c  aa0203f0       mov x16, x2
0x2660bae9dba0   860  aa0003e2       mov x2, x0
0x2660bae9dba4   864  aa1003e0       mov x0, x16
0x2660bae9dba8   868  14000003       b #+0xc (addr 0x2660bae9dbb4)
0x2660bae9dbac   86c  aa0003e2       mov x2, x0
0x2660bae9dbb0   870  aa0f03e0       mov x0, x15
0x2660bae9dbb4   874  531e744b       lsl w11, w2, #2
0x2660bae9dbb8   878  0b0b006f       add w15, w3, w11
0x2660bae9dbbc   87c  bc6f6a72       ldr s18, [x19, x15]
0x2660bae9dbc0   880  1e323973       fsub s19, s11, s18
0x2660bae9dbc4   884  1e330a74       fmul s20, s19, s19
0x2660bae9dbc8   888  0b0b038f       add w15, w28, w11
0x2660bae9dbcc   88c  bc6f6a75       ldr s21, [x19, x15]
0x2660bae9dbd0   890  1e353996       fsub s22, s12, s21
0x2660bae9dbd4   894  1e360ad7       fmul s23, s22, s22
0x2660bae9dbd8   898  1e372a94       fadd s20, s20, s23
0x2660bae9dbdc   89c  1e262280       fcmp s20, s6
0x2660bae9dbe0   8a0  1e2f3d57       fcsel s23, s10, s15, lo
0x2660bae9dbe4   8a4  1e3420e0       fcmp s7, s20
0x2660bae9dbe8   8a8  1e2f9ef7       fcsel s23, s23, s15, ls
0x2660bae9dbec   8ac  1e202288       fcmp s20, #0.0
0x2660bae9dbf0   8b0  1e2fcef7       fcsel s23, s23, s15, gt
0x2660bae9dbf4   8b4  1e3729ad       fadd s13, s13, s23
0x2660bae9dbf8   8b8  0b0b036f       add w15, w27, w11
0x2660bae9dbfc   8bc  0b0b0322       add w2, w25, w11
0x2660bae9dc00   8c0  4e040652       dup v18.4s, v18.s[0]
0x2660bae9dc04   8c4  6e0c06b2       mov v18.s[1], v21.s[0]
0x2660bae9dc08   8c8  8b020262       add x2, x19, x2
0x2660bae9dc0c   8cc  4d408052       ld1 {v18.s}[2], [x2]
0x2660bae9dc10   8d0  8b0f026f       add x15, x19, x15
0x2660bae9dc14   8d4  4d4091f2       ld1 {v18.s}[3], [x15]
0x2660bae9dc18   8d8  4e0406f5       dup v21.4s, v23.s[0]
0x2660bae9dc1c   8dc  6e35de52       fmul v18.4s, v18.4s, v21.4s
0x2660bae9dc20   8e0  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x2660bae9dc24   8e4  1e272280       fcmp s20, s7
0x2660bae9dc28   8e8  1e2f3d52       fcsel s18, s10, s15, lo
0x2660bae9dc2c   8ec  1e320ad4       fmul s20, s22, s18
0x2660bae9dc30   8f0  1e342a10       fadd s16, s16, s20
0x2660bae9dc34   8f4  1e320a72       fmul s18, s19, s18
0x2660bae9dc38   8f8  1e3229ce       fadd s14, s14, s18
0x2660bae9dc3c   8fc  6b05001f       cmp w0, w5
0x2660bae9dc40   900  54000081       b.ne #+0x10 (addr 0x2660bae9dc50)
0x2660bae9dc44   904  6b0a009f       cmp w4, w10
0x2660bae9dc48   908  54ffef62       b.hs #-0x214 (addr 0x2660bae9da34)
0x2660bae9dc4c   90c  1400009f       b #+0x27c (addr 0x2660bae9dec8)
0x2660bae9dc50   910  bc276a70       str s16, [x19, x7]
0x2660bae9dc54   914  9101110b       add x11, x8, #0x44 (68)
0x2660bae9dc58   918  bc2b6a6e       str s14, [x19, x11]
0x2660bae9dc5c   91c  f940bbeb       ldr x11, [sp, #368]
0x2660bae9dc60   920  bc2b6a6d       str s13, [x19, x11]
0x2660bae9dc64   924  f940bfef       ldr x15, [sp, #376]
0x2660bae9dc68   928  3caf6a71       str q17, [x19, x15]
0x2660bae9dc6c   92c  aa0f03e2       mov x2, x15
0x2660bae9dc70   930  d280000f       movz x15, #0x0
0x2660bae9dc74   934  14000085       b #+0x214 (addr 0x2660bae9de88)
0x2660bae9dc78   938  aa0403ea       mov x10, x4
0x2660bae9dc7c   93c  14000002       b #+0x8 (addr 0x2660bae9dc84)
0x2660bae9dc80   940  aa0203ea       mov x10, x2
0x2660bae9dc84   944  bc276a70       str s16, [x19, x7]
0x2660bae9dc88   948  9101110b       add x11, x8, #0x44 (68)
0x2660bae9dc8c   94c  bc2b6a6e       str s14, [x19, x11]
0x2660bae9dc90   950  f940bbef       ldr x15, [sp, #368]
0x2660bae9dc94   954  bc2f6a6d       str s13, [x19, x15]
0x2660bae9dc98   958  f940bfe2       ldr x2, [sp, #376]
0x2660bae9dc9c   95c  3ca26a71       str q17, [x19, x2]
0x2660bae9dca0   960  f900e7e5       str x5, [sp, #456]
0x2660bae9dca4   964  f9406ff6       ldr x22, [sp, #216]
0x2660bae9dca8   968  34001216       cbz w22, #+0x240 (addr 0x2660bae9dee8)
0x2660bae9dcac   96c  f94073e0       ldr x0, [sp, #224]
0x2660bae9dcb0   970  b8606a77       ldr w23, [x19, x0]
0x2660bae9dcb4   974  f94077f8       ldr x24, [sp, #232]
0x2660bae9dcb8   978  b8786a65       ldr w5, [x19, x24]
0x2660bae9dcbc   97c  6b0502ff       cmp w23, w5
0x2660bae9dcc0   980  54000fc3       b.lo #+0x1f8 (addr 0x2660bae9deb8)
0x2660bae9dcc4   984  6b1702bf       cmp w21, w23
0x2660bae9dcc8   988  54000f83       b.lo #+0x1f0 (addr 0x2660bae9deb8)
0x2660bae9dccc   98c  6b0502ff       cmp w23, w5
0x2660bae9dcd0   990  54000ec0       b.eq #+0x1d8 (addr 0x2660bae9dea8)
0x2660bae9dcd4   994  0b050a95       add w21, w20, w5, lsl #2
0x2660bae9dcd8   998  4b0502f7       sub w23, w23, w5
0x2660bae9dcdc   99c  531e76f7       lsl w23, w23, #2
0x2660bae9dce0   9a0  0b1702a5       add w5, w21, w23
0x2660bae9dce4   9a4  110012b4       add w20, w21, #0x4 (4)
0x2660bae9dce8   9a8  b8756a60       ldr w0, [x19, x21]
0x2660bae9dcec   9ac  6b01001f       cmp w0, w1
0x2660bae9dcf0   9b0  540000e0       b.eq #+0x1c (addr 0x2660bae9dd0c)
0x2660bae9dcf4   9b4  6b0000df       cmp w6, w0
0x2660bae9dcf8   9b8  540000a9       b.ls #+0x14 (addr 0x2660bae9dd0c)
0x2660bae9dcfc   9bc  6b00013f       cmp w9, w0
0x2660bae9dd00   9c0  54000069       b.ls #+0xc (addr 0x2660bae9dd0c)
0x2660bae9dd04   9c4  6b0d001f       cmp w0, w13
0x2660bae9dd08   9c8  54000603       b.lo #+0xc0 (addr 0x2660bae9ddc8)
0x2660bae9dd0c   9cc  510012f7       sub w23, w23, #0x4 (4)
0x2660bae9dd10   9d0  34000c37       cbz w23, #+0x184 (addr 0x2660bae9de94)
0x2660bae9dd14   9d4  110022a0       add w0, w21, #0x8 (8)
0x2660bae9dd18   9d8  b8746a74       ldr w20, [x19, x20]
0x2660bae9dd1c   9dc  6b01029f       cmp w20, w1
0x2660bae9dd20   9e0  540000e0       b.eq #+0x1c (addr 0x2660bae9dd3c)
0x2660bae9dd24   9e4  6b1400df       cmp w6, w20
0x2660bae9dd28   9e8  540000a9       b.ls #+0x14 (addr 0x2660bae9dd3c)
0x2660bae9dd2c   9ec  6b14013f       cmp w9, w20
0x2660bae9dd30   9f0  54000069       b.ls #+0xc (addr 0x2660bae9dd3c)
0x2660bae9dd34   9f4  6b0d029f       cmp w20, w13
0x2660bae9dd38   9f8  540003e3       b.lo #+0x7c (addr 0x2660bae9ddb4)
0x2660bae9dd3c   9fc  510012f7       sub w23, w23, #0x4 (4)
0x2660bae9dd40   a00  34000af7       cbz w23, #+0x15c (addr 0x2660bae9de9c)
0x2660bae9dd44   a04  110032b4       add w20, w21, #0xc (12)
0x2660bae9dd48   a08  b8606a60       ldr w0, [x19, x0]
0x2660bae9dd4c   a0c  6b01001f       cmp w0, w1
0x2660bae9dd50   a10  540000e0       b.eq #+0x1c (addr 0x2660bae9dd6c)
0x2660bae9dd54   a14  6b0000df       cmp w6, w0
0x2660bae9dd58   a18  540000a9       b.ls #+0x14 (addr 0x2660bae9dd6c)
0x2660bae9dd5c   a1c  6b00013f       cmp w9, w0
0x2660bae9dd60   a20  54000069       b.ls #+0xc (addr 0x2660bae9dd6c)
0x2660bae9dd64   a24  6b0d001f       cmp w0, w13
0x2660bae9dd68   a28  54000303       b.lo #+0x60 (addr 0x2660bae9ddc8)
0x2660bae9dd6c   a2c  510012f7       sub w23, w23, #0x4 (4)
0x2660bae9dd70   a30  34000937       cbz w23, #+0x124 (addr 0x2660bae9de94)
0x2660bae9dd74   a34  f8520340       ldur x0, [x26, #-224]
0x2660bae9dd78   a38  eb2063ff       cmp sp, x0
0x2660bae9dd7c   a3c  54003c29       b.ls #+0x784 (addr 0x2660bae9e500)
0x2660bae9dd80   a40  110042b5       add w21, w21, #0x10 (16)
0x2660bae9dd84   a44  b8746a60       ldr w0, [x19, x20]
0x2660bae9dd88   a48  6b01001f       cmp w0, w1
0x2660bae9dd8c   a4c  540000e0       b.eq #+0x1c (addr 0x2660bae9dda8)
0x2660bae9dd90   a50  6b0000df       cmp w6, w0
0x2660bae9dd94   a54  540000a9       b.ls #+0x14 (addr 0x2660bae9dda8)
0x2660bae9dd98   a58  6b00013f       cmp w9, w0
0x2660bae9dd9c   a5c  54000069       b.ls #+0xc (addr 0x2660bae9dda8)
0x2660bae9dda0   a60  6b0d001f       cmp w0, w13
0x2660bae9dda4   a64  54000103       b.lo #+0x20 (addr 0x2660bae9ddc4)
0x2660bae9dda8   a68  510012f7       sub w23, w23, #0x4 (4)
0x2660bae9ddac   a6c  35fff9d7       cbnz w23, #-0xc8 (addr 0x2660bae9dce4)
0x2660bae9ddb0   a70  14000039       b #+0xe4 (addr 0x2660bae9de94)
0x2660bae9ddb4   a74  aa0003f0       mov x16, x0
0x2660bae9ddb8   a78  aa1403e0       mov x0, x20
0x2660bae9ddbc   a7c  aa1003f4       mov x20, x16
0x2660bae9ddc0   a80  14000002       b #+0x8 (addr 0x2660bae9ddc8)
0x2660bae9ddc4   a84  aa1503f4       mov x20, x21
0x2660bae9ddc8   a88  531e7400       lsl w0, w0, #2
0x2660bae9ddcc   a8c  0b000395       add w21, w28, w0
0x2660bae9ddd0   a90  bc756a72       ldr s18, [x19, x21]
0x2660bae9ddd4   a94  1e323993       fsub s19, s12, s18
0x2660bae9ddd8   a98  0b000075       add w21, w3, w0
0x2660bae9dddc   a9c  bc756a74       ldr s20, [x19, x21]
0x2660bae9dde0   aa0  1e343975       fsub s21, s11, s20
0x2660bae9dde4   aa4  1e350ab6       fmul s22, s21, s21
0x2660bae9dde8   aa8  1e330a77       fmul s23, s19, s19
0x2660bae9ddec   aac  1e372ad6       fadd s22, s22, s23
0x2660bae9ddf0   ab0  1e2722c0       fcmp s22, s7
0x2660bae9ddf4   ab4  1e2f3d57       fcsel s23, s10, s15, lo
0x2660bae9ddf8   ab8  1e370a73       fmul s19, s19, s23
0x2660bae9ddfc   abc  1e332a10       fadd s16, s16, s19
0x2660bae9de00   ac0  bc276a70       str s16, [x19, x7]
0x2660bae9de04   ac4  1e370ab3       fmul s19, s21, s23
0x2660bae9de08   ac8  1e3329ce       fadd s14, s14, s19
0x2660bae9de0c   acc  bc2b6a6e       str s14, [x19, x11]
0x2660bae9de10   ad0  1e2622c0       fcmp s22, s6
0x2660bae9de14   ad4  1e2f3d53       fcsel s19, s10, s15, lo
0x2660bae9de18   ad8  1e3620e0       fcmp s7, s22
0x2660bae9de1c   adc  1e2f9e73       fcsel s19, s19, s15, ls
0x2660bae9de20   ae0  1e2022c8       fcmp s22, #0.0
0x2660bae9de24   ae4  1e2fce73       fcsel s19, s19, s15, gt
0x2660bae9de28   ae8  1e3329ad       fadd s13, s13, s19
0x2660bae9de2c   aec  bc2f6a6d       str s13, [x19, x15]
0x2660bae9de30   af0  0b00036b       add w11, w27, w0
0x2660bae9de34   af4  0b000335       add w21, w25, w0
0x2660bae9de38   af8  4e040694       dup v20.4s, v20.s[0]
0x2660bae9de3c   afc  6e0c0654       mov v20.s[1], v18.s[0]
0x2660bae9de40   b00  8b150275       add x21, x19, x21
0x2660bae9de44   b04  4d4082b4       ld1 {v20.s}[2], [x21]
0x2660bae9de48   b08  8b0b026b       add x11, x19, x11
0x2660bae9de4c   b0c  4d409174       ld1 {v20.s}[3], [x11]
0x2660bae9de50   b10  4e040672       dup v18.4s, v19.s[0]
0x2660bae9de54   b14  6e32de92       fmul v18.4s, v20.4s, v18.4s
0x2660bae9de58   b18  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x2660bae9de5c   b1c  3ca26a71       str q17, [x19, x2]
0x2660bae9de60   b20  6b05029f       cmp w20, w5
0x2660bae9de64   b24  54000420       b.eq #+0x84 (addr 0x2660bae9dee8)
0x2660bae9de68   b28  f9404bf8       ldr x24, [sp, #144]
0x2660bae9de6c   b2c  aa0f03eb       mov x11, x15
0x2660bae9de70   b30  d280002f       movz x15, #0x1
0x2660bae9de74   b34  aa1403e0       mov x0, x20
0x2660bae9de78   b38  f9407ff4       ldr x20, [sp, #248]
0x2660bae9de7c   b3c  f9407bf5       ldr x21, [sp, #240]
0x2660bae9de80   b40  f9405bf6       ldr x22, [sp, #176]
0x2660bae9de84   b44  f94057f7       ldr x23, [sp, #168]
0x2660bae9de88   b48  d2800010       movz x16, #0x0
0x2660bae9de8c   b4c  f9008ff0       str x16, [sp, #280]
0x2660bae9de90   b50  17fffec4       b #-0x4f0 (addr 0x2660bae9d9a0)
0x2660bae9de94   b54  aa0003f4       mov x20, x0
0x2660bae9de98   b58  14000002       b #+0x8 (addr 0x2660bae9dea0)
0x2660bae9de9c   b5c  f9407fea       ldr x10, [sp, #248]
0x2660bae9dea0   b60  aa1403e0       mov x0, x20
0x2660bae9dea4   b64  14000011       b #+0x44 (addr 0x2660bae9dee8)
0x2660bae9dea8   b68  f94057ea       ldr x10, [sp, #168]
0x2660bae9deac   b6c  aa1703e0       mov x0, x23
0x2660bae9deb0   b70  f940e7e5       ldr x5, [sp, #456]
0x2660bae9deb4   b74  1400000d       b #+0x34 (addr 0x2660bae9dee8)
0x2660bae9deb8   b78  aa1703e0       mov x0, x23
0x2660bae9debc   b7c  f940e7e5       ldr x5, [sp, #456]
0x2660bae9dec0   b80  1400000a       b #+0x28 (addr 0x2660bae9dee8)
0x2660bae9dec4   b84  aa0003eb       mov x11, x0
0x2660bae9dec8   b88  bc276a70       str s16, [x19, x7]
0x2660bae9decc   b8c  9101110c       add x12, x8, #0x44 (68)
0x2660bae9ded0   b90  bc2c6a6e       str s14, [x19, x12]
0x2660bae9ded4   b94  f940bbea       ldr x10, [sp, #368]
0x2660bae9ded8   b98  bc2a6a6d       str s13, [x19, x10]
0x2660bae9dedc   b9c  f940bfec       ldr x12, [sp, #376]
0x2660bae9dee0   ba0  3cac6a71       str q17, [x19, x12]
0x2660bae9dee4   ba4  aa0b03e0       mov x0, x11
0x2660bae9dee8   ba8  1100410a       add w10, w8, #0x10 (16)
0x2660bae9deec   bac  1100810b       add w11, w8, #0x20 (32)
0x2660bae9def0   bb0  1100c10c       add w12, w8, #0x30 (48)
0x2660bae9def4   bb4  f90063f3       str x19, [sp, #192]
0x2660bae9def8   bb8  f900e7e5       str x5, [sp, #456]
0x2660bae9defc   bbc  f9008fe0       str x0, [sp, #280]
0x2660bae9df00   bc0  f940fbe7       ldr x7, [sp, #496]
0x2660bae9df04   bc4  aa0a03e0       mov x0, x10
0x2660bae9df08   bc8  f940cbe2       ldr x2, [sp, #400]
0x2660bae9df0c   bcc  fd40c7e0       ldr d0, [sp, #392]
0x2660bae9df10   bd0  fd40c3e1       ldr d1, [sp, #384]
0x2660bae9df14   bd4  aa0b03e3       mov x3, x11
0x2660bae9df18   bd8  aa0803e4       mov x4, x8
0x2660bae9df1c   bdc  aa0c03e5       mov x5, x12
0x2660bae9df20   be0  97fbdde1       bl #-0x10887c (addr 0x2660bad956a4)
0x2660bae9df24   be4  f940ebe1       ldr x1, [sp, #464]
0x2660bae9df28   be8  f940cfe6       ldr x6, [sp, #408]
0x2660bae9df2c   bec  6b0100df       cmp w6, w1
0x2660bae9df30   bf0  54000329       b.ls #+0x64 (addr 0x2660bae9df94)
0x2660bae9df34   bf4  f940dfe8       ldr x8, [sp, #440]
0x2660bae9df38   bf8  f940d3e9       ldr x9, [sp, #416]
0x2660bae9df3c   bfc  0b08012a       add w10, w9, w8
0x2660bae9df40   c00  f940f3eb       ldr x11, [sp, #480]
0x2660bae9df44   c04  9100416c       add x12, x11, #0x10 (16)
0x2660bae9df48   c08  f94063ed       ldr x13, [sp, #192]
0x2660bae9df4c   c0c  bc6c69a2       ldr s2, [x13, x12]
0x2660bae9df50   c10  bc2a69a2       str s2, [x13, x10]
0x2660bae9df54   c14  f940d7ea       ldr x10, [sp, #424]
0x2660bae9df58   c18  0b08014c       add w12, w10, w8
0x2660bae9df5c   c1c  9100516e       add x14, x11, #0x14 (20)
0x2660bae9df60   c20  bc6e69a2       ldr s2, [x13, x14]
0x2660bae9df64   c24  bc2c69a2       str s2, [x13, x12]
0x2660bae9df68   c28  f940dbec       ldr x12, [sp, #432]
0x2660bae9df6c   c2c  0b08018e       add w14, w12, w8
0x2660bae9df70   c30  9100616f       add x15, x11, #0x18 (24)
0x2660bae9df74   c34  bc6f69a2       ldr s2, [x13, x15]
0x2660bae9df78   c38  bc2e69a2       str s2, [x13, x14]
0x2660bae9df7c   c3c  f940e3ee       ldr x14, [sp, #448]
0x2660bae9df80   c40  0b0801c8       add w8, w14, w8
0x2660bae9df84   c44  9100716f       add x15, x11, #0x1c (28)
0x2660bae9df88   c48  bc6f69a2       ldr s2, [x13, x15]
0x2660bae9df8c   c4c  bc2869a2       str s2, [x13, x8]
0x2660bae9df90   c50  14000006       b #+0x18 (addr 0x2660bae9dfa8)
0x2660bae9df94   c54  f94063ed       ldr x13, [sp, #192]
0x2660bae9df98   c58  14000004       b #+0x10 (addr 0x2660bae9dfa8)
0x2660bae9df9c   c5c  f940cfe6       ldr x6, [sp, #408]
0x2660bae9dfa0   c60  f9008fe0       str x0, [sp, #280]
0x2660bae9dfa4   c64  aa0403ed       mov x13, x4
0x2660bae9dfa8   c68  11000421       add w1, w1, #0x1 (1)
0x2660bae9dfac   c6c  f940efe8       ldr x8, [sp, #472]
0x2660bae9dfb0   c70  6b08003f       cmp w1, w8
0x2660bae9dfb4   c74  54ffb7c1       b.ne #-0x908 (addr 0x2660bae9d6ac)
0x2660bae9dfb8   c78  f940f3e1       ldr x1, [sp, #480]
0x2660bae9dfbc   c7c  11014021       add w1, w1, #0x50 (80)
0x2660bae9dfc0   c80  f940f7e6       ldr x6, [sp, #488]
0x2660bae9dfc4   c84  b90000c1       str w1, [x6]
0x2660bae9dfc8   c88  17fffd57       b #-0xaa4 (addr 0x2660bae9d524)
0x2660bae9dfcc   c8c  97fbdf01       bl #-0x1083fc (addr 0x2660bad95bd0)
0x2660bae9dfd0   c90  f940fbe7       ldr x7, [sp, #496]
0x2660bae9dfd4   c94  f9408fe0       ldr x0, [sp, #280]
0x2660bae9dfd8   c98  f94063e1       ldr x1, [sp, #192]
0x2660bae9dfdc   c9c  17fffce4       b #-0xc70 (addr 0x2660bae9d36c)
0x2660bae9dfe0   ca0  1e6520a0       fcmp d5, d5
0x2660bae9dfe4   ca4  54000080       b.eq #+0x10 (addr 0x2660bae9dff4)
0x2660bae9dfe8   ca8  d280000c       movz x12, #0x0
0x2660bae9dfec   cac  aa0c03eb       mov x11, x12
0x2660bae9dff0   cb0  17fffd13       b #-0xbb4 (addr 0x2660bae9d43c)
0x2660bae9dff4   cb4  1e202068       fcmp s3, #0.0
0x2660bae9dff8   cb8  54000063       b.lo #+0xc (addr 0x2660bae9e004)
0x2660bae9dffc   cbc  9280000b       movn x11, #0x0
0x2660bae9e000   cc0  17fffd0f       b #-0xbc4 (addr 0x2660bae9d43c)
0x2660bae9e004   cc4  d280000b       movz x11, #0x0
0x2660bae9e008   cc8  17fffd0d       b #-0xbcc (addr 0x2660bae9d43c)
0x2660bae9e00c   ccc  1e6620c0       fcmp d6, d6
0x2660bae9e010   cd0  54000060       b.eq #+0xc (addr 0x2660bae9e01c)
0x2660bae9e014   cd4  d280000b       movz x11, #0x0
0x2660bae9e018   cd8  17fffd11       b #-0xbbc (addr 0x2660bae9d45c)
0x2660bae9e01c   cdc  1e2020a8       fcmp s5, #0.0
0x2660bae9e020   ce0  54ffffa3       b.lo #-0xc (addr 0x2660bae9e014)
0x2660bae9e024   ce4  9280000b       movn x11, #0x0
0x2660bae9e028   ce8  17fffd0d       b #-0xbcc (addr 0x2660bae9d45c)
0x2660bae9e02c   cec  f9008fe0       str x0, [sp, #280]
0x2660bae9e030   cf0  f900ebe1       str x1, [sp, #464]
0x2660bae9e034   cf4  f90063e4       str x4, [sp, #192]
0x2660bae9e038   cf8  97fbdee6       bl #-0x108468 (addr 0x2660bad95bd0)
0x2660bae9e03c   cfc  f940efe6       ldr x6, [sp, #472]
0x2660bae9e040   d00  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e044   d04  f9408fe0       ldr x0, [sp, #280]
0x2660bae9e048   d08  f94063e4       ldr x4, [sp, #192]
0x2660bae9e04c   d0c  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e050   d10  f940affb       ldr cp, [sp, #344]
0x2660bae9e054   d14  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e058   d18  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e05c   d1c  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e060   d20  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e064   d24  f94097fc       ldr x28, [sp, #296]
0x2660bae9e068   d28  f9408bed       ldr x13, [sp, #272]
0x2660bae9e06c   d2c  f94087e9       ldr x9, [sp, #264]
0x2660bae9e070   d30  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e074   d34  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e078   d38  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e07c   d3c  f94057f7       ldr x23, [sp, #168]
0x2660bae9e080   d40  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e084   d44  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e088   d48  3dc003e2       ldr q2, [sp]
0x2660bae9e08c   d4c  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e090   d50  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e094   d54  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e098   d58  f94037eb       ldr x11, [sp, #104]
0x2660bae9e09c   d5c  17fffd9e       b #-0x988 (addr 0x2660bae9d714)
0x2660bae9e0a0   d60  1e722240       fcmp d18, d18
0x2660bae9e0a4   d64  54000060       b.eq #+0xc (addr 0x2660bae9e0b0)
0x2660bae9e0a8   d68  d2800000       movz x0, #0x0
0x2660bae9e0ac   d6c  17fffdd4       b #-0x8b0 (addr 0x2660bae9d7fc)
0x2660bae9e0b0   d70  1e2021a8       fcmp s13, #0.0
0x2660bae9e0b4   d74  54ffffa3       b.lo #-0xc (addr 0x2660bae9e0a8)
0x2660bae9e0b8   d78  92800000       movn x0, #0x0
0x2660bae9e0bc   d7c  17fffdd0       b #-0x8c0 (addr 0x2660bae9d7fc)
0x2660bae9e0c0   d80  1e712220       fcmp d17, d17
0x2660bae9e0c4   d84  54000060       b.eq #+0xc (addr 0x2660bae9e0d0)
0x2660bae9e0c8   d88  d2800000       movz x0, #0x0
0x2660bae9e0cc   d8c  17fffdd4       b #-0x8b0 (addr 0x2660bae9d81c)
0x2660bae9e0d0   d90  1e202208       fcmp s16, #0.0
0x2660bae9e0d4   d94  54ffffa3       b.lo #-0xc (addr 0x2660bae9e0c8)
0x2660bae9e0d8   d98  92800000       movn x0, #0x0
0x2660bae9e0dc   d9c  17fffdd0       b #-0x8c0 (addr 0x2660bae9d81c)
0x2660bae9e0e0   da0  f900b7e7       str x7, [sp, #360]
0x2660bae9e0e4   da4  fd00a3eb       str d11, [sp, #320]
0x2660bae9e0e8   da8  fd009bec       str d12, [sp, #304]
0x2660bae9e0ec   dac  f9006be4       str x4, [sp, #208]
0x2660bae9e0f0   db0  f90053ee       str x14, [sp, #160]
0x2660bae9e0f4   db4  f9004fec       str x12, [sp, #152]
0x2660bae9e0f8   db8  f900e7e5       str x5, [sp, #456]
0x2660bae9e0fc   dbc  fd003fed       str d13, [sp, #120]
0x2660bae9e100   dc0  f90083e2       str x2, [sp, #256]
0x2660bae9e104   dc4  fd0033ee       str d14, [sp, #96]
0x2660bae9e108   dc8  fd0027f0       str d16, [sp, #72]
0x2660bae9e10c   dcc  3d800ff1       str q17, [sp, #48]
0x2660bae9e110   dd0  f90063f3       str x19, [sp, #192]
0x2660bae9e114   dd4  97fbdeaf       bl #-0x108544 (addr 0x2660bad95bd0)
0x2660bae9e118   dd8  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e11c   ddc  f940efe6       ldr x6, [sp, #472]
0x2660bae9e120   de0  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e124   de4  f94063f3       ldr x19, [sp, #192]
0x2660bae9e128   de8  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e12c   dec  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e130   df0  f940affb       ldr cp, [sp, #344]
0x2660bae9e134   df4  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e138   df8  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e13c   dfc  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e140   e00  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e144   e04  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e148   e08  fd409bec       ldr d12, [sp, #304]
0x2660bae9e14c   e0c  f94097fc       ldr x28, [sp, #296]
0x2660bae9e150   e10  f9408bed       ldr x13, [sp, #272]
0x2660bae9e154   e14  f94087e9       ldr x9, [sp, #264]
0x2660bae9e158   e18  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e15c   e1c  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e160   e20  f9406be4       ldr x4, [sp, #208]
0x2660bae9e164   e24  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e168   e28  f94057f7       ldr x23, [sp, #168]
0x2660bae9e16c   e2c  f94053ee       ldr x14, [sp, #160]
0x2660bae9e170   e30  f9404fec       ldr x12, [sp, #152]
0x2660bae9e174   e34  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e178   e38  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e17c   e3c  fd403fed       ldr d13, [sp, #120]
0x2660bae9e180   e40  f94083e2       ldr x2, [sp, #256]
0x2660bae9e184   e44  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e188   e48  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e18c   e4c  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e190   e50  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e194   e54  3dc003e2       ldr q2, [sp]
0x2660bae9e198   e58  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e19c   e5c  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e1a0   e60  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e1a4   e64  17fffdf5       b #-0x82c (addr 0x2660bae9d978)
0x2660bae9e1a8   e68  f900e7e5       str x5, [sp, #456]
0x2660bae9e1ac   e6c  f9008fe0       str x0, [sp, #280]
0x2660bae9e1b0   e70  f900b7e7       str x7, [sp, #360]
0x2660bae9e1b4   e74  fd003fed       str d13, [sp, #120]
0x2660bae9e1b8   e78  fd0033ee       str d14, [sp, #96]
0x2660bae9e1bc   e7c  fd0027f0       str d16, [sp, #72]
0x2660bae9e1c0   e80  3d800ff1       str q17, [sp, #48]
0x2660bae9e1c4   e84  fd00a3eb       str d11, [sp, #320]
0x2660bae9e1c8   e88  fd009bec       str d12, [sp, #304]
0x2660bae9e1cc   e8c  f9003be2       str x2, [sp, #112]
0x2660bae9e1d0   e90  f90093ef       str x15, [sp, #288]
0x2660bae9e1d4   e94  f9006be4       str x4, [sp, #208]
0x2660bae9e1d8   e98  f90053ee       str x14, [sp, #160]
0x2660bae9e1dc   e9c  f9004fec       str x12, [sp, #152]
0x2660bae9e1e0   ea0  f90083eb       str x11, [sp, #256]
0x2660bae9e1e4   ea4  f90063f3       str x19, [sp, #192]
0x2660bae9e1e8   ea8  97fbde7a       bl #-0x108618 (addr 0x2660bad95bd0)
0x2660bae9e1ec   eac  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e1f0   eb0  f940efe6       ldr x6, [sp, #472]
0x2660bae9e1f4   eb4  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e1f8   eb8  f94063f3       ldr x19, [sp, #192]
0x2660bae9e1fc   ebc  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e200   ec0  f9408fe0       ldr x0, [sp, #280]
0x2660bae9e204   ec4  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e208   ec8  fd403fed       ldr d13, [sp, #120]
0x2660bae9e20c   ecc  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e210   ed0  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e214   ed4  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e218   ed8  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e21c   edc  f940affb       ldr cp, [sp, #344]
0x2660bae9e220   ee0  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e224   ee4  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e228   ee8  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e22c   eec  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e230   ef0  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e234   ef4  fd409bec       ldr d12, [sp, #304]
0x2660bae9e238   ef8  f94097fc       ldr x28, [sp, #296]
0x2660bae9e23c   efc  f9403be2       ldr x2, [sp, #112]
0x2660bae9e240   f00  f94093ef       ldr x15, [sp, #288]
0x2660bae9e244   f04  f9408bed       ldr x13, [sp, #272]
0x2660bae9e248   f08  f94087e9       ldr x9, [sp, #264]
0x2660bae9e24c   f0c  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e250   f10  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e254   f14  f9406be4       ldr x4, [sp, #208]
0x2660bae9e258   f18  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e25c   f1c  f94057f7       ldr x23, [sp, #168]
0x2660bae9e260   f20  f94053ee       ldr x14, [sp, #160]
0x2660bae9e264   f24  f9404fec       ldr x12, [sp, #152]
0x2660bae9e268   f28  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e26c   f2c  f94083eb       ldr x11, [sp, #256]
0x2660bae9e270   f30  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e274   f34  3dc003e2       ldr q2, [sp]
0x2660bae9e278   f38  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e27c   f3c  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e280   f40  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e284   f44  17fffdcd       b #-0x8cc (addr 0x2660bae9d9b8)
0x2660bae9e288   f48  f900b7e7       str x7, [sp, #360]
0x2660bae9e28c   f4c  fd00a3eb       str d11, [sp, #320]
0x2660bae9e290   f50  fd009bec       str d12, [sp, #304]
0x2660bae9e294   f54  3d800ff1       str q17, [sp, #48]
0x2660bae9e298   f58  fd003fed       str d13, [sp, #120]
0x2660bae9e29c   f5c  fd0033ee       str d14, [sp, #96]
0x2660bae9e2a0   f60  fd0027f0       str d16, [sp, #72]
0x2660bae9e2a4   f64  f900e7e5       str x5, [sp, #456]
0x2660bae9e2a8   f68  f9006be4       str x4, [sp, #208]
0x2660bae9e2ac   f6c  f9003be2       str x2, [sp, #112]
0x2660bae9e2b0   f70  f9008fe0       str x0, [sp, #280]
0x2660bae9e2b4   f74  f90053ee       str x14, [sp, #160]
0x2660bae9e2b8   f78  f9004fec       str x12, [sp, #152]
0x2660bae9e2bc   f7c  f90063f3       str x19, [sp, #192]
0x2660bae9e2c0   f80  97fbde44       bl #-0x1086f0 (addr 0x2660bad95bd0)
0x2660bae9e2c4   f84  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e2c8   f88  f940efe6       ldr x6, [sp, #472]
0x2660bae9e2cc   f8c  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e2d0   f90  f94063f3       ldr x19, [sp, #192]
0x2660bae9e2d4   f94  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e2d8   f98  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e2dc   f9c  f940affb       ldr cp, [sp, #344]
0x2660bae9e2e0   fa0  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e2e4   fa4  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e2e8   fa8  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e2ec   fac  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e2f0   fb0  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e2f4   fb4  fd409bec       ldr d12, [sp, #304]
0x2660bae9e2f8   fb8  f94097fc       ldr x28, [sp, #296]
0x2660bae9e2fc   fbc  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e300   fc0  fd403fed       ldr d13, [sp, #120]
0x2660bae9e304   fc4  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e308   fc8  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e30c   fcc  f9408bed       ldr x13, [sp, #272]
0x2660bae9e310   fd0  f94087e9       ldr x9, [sp, #264]
0x2660bae9e314   fd4  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e318   fd8  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e31c   fdc  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e320   fe0  f9406be4       ldr x4, [sp, #208]
0x2660bae9e324   fe4  f9403be2       ldr x2, [sp, #112]
0x2660bae9e328   fe8  f9408fe0       ldr x0, [sp, #280]
0x2660bae9e32c   fec  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e330   ff0  f94057f7       ldr x23, [sp, #168]
0x2660bae9e334   ff4  f94053ee       ldr x14, [sp, #160]
0x2660bae9e338   ff8  f9404fec       ldr x12, [sp, #152]
0x2660bae9e33c   ffc  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e340  1000  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e344  1004  3dc003e2       ldr q2, [sp]
0x2660bae9e348  1008  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e34c  100c  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e350  1010  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e354  1014  17fffdbd       b #-0x90c (addr 0x2660bae9da48)
0x2660bae9e358  1018  f900b7e7       str x7, [sp, #360]
0x2660bae9e35c  101c  fd00a3eb       str d11, [sp, #320]
0x2660bae9e360  1020  fd009bec       str d12, [sp, #304]
0x2660bae9e364  1024  3d800ff1       str q17, [sp, #48]
0x2660bae9e368  1028  fd003fed       str d13, [sp, #120]
0x2660bae9e36c  102c  fd0033ee       str d14, [sp, #96]
0x2660bae9e370  1030  fd0027f0       str d16, [sp, #72]
0x2660bae9e374  1034  f9006be4       str x4, [sp, #208]
0x2660bae9e378  1038  f900e7e5       str x5, [sp, #456]
0x2660bae9e37c  103c  f90053ee       str x14, [sp, #160]
0x2660bae9e380  1040  f9004fec       str x12, [sp, #152]
0x2660bae9e384  1044  f90093e2       str x2, [sp, #288]
0x2660bae9e388  1048  f90063f3       str x19, [sp, #192]
0x2660bae9e38c  104c  97fbde11       bl #-0x1087bc (addr 0x2660bad95bd0)
0x2660bae9e390  1050  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e394  1054  f940efe6       ldr x6, [sp, #472]
0x2660bae9e398  1058  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e39c  105c  f94063f3       ldr x19, [sp, #192]
0x2660bae9e3a0  1060  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e3a4  1064  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e3a8  1068  f940affb       ldr cp, [sp, #344]
0x2660bae9e3ac  106c  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e3b0  1070  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e3b4  1074  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e3b8  1078  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e3bc  107c  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e3c0  1080  fd409bec       ldr d12, [sp, #304]
0x2660bae9e3c4  1084  f94097fc       ldr x28, [sp, #296]
0x2660bae9e3c8  1088  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e3cc  108c  fd403fed       ldr d13, [sp, #120]
0x2660bae9e3d0  1090  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e3d4  1094  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e3d8  1098  f9408bed       ldr x13, [sp, #272]
0x2660bae9e3dc  109c  f94087e9       ldr x9, [sp, #264]
0x2660bae9e3e0  10a0  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e3e4  10a4  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e3e8  10a8  f9406be4       ldr x4, [sp, #208]
0x2660bae9e3ec  10ac  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e3f0  10b0  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e3f4  10b4  f94057f7       ldr x23, [sp, #168]
0x2660bae9e3f8  10b8  f94053ee       ldr x14, [sp, #160]
0x2660bae9e3fc  10bc  f9404fec       ldr x12, [sp, #152]
0x2660bae9e400  10c0  f94093e2       ldr x2, [sp, #288]
0x2660bae9e404  10c4  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e408  10c8  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e40c  10cc  3dc003e2       ldr q2, [sp]
0x2660bae9e410  10d0  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e414  10d4  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e418  10d8  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e41c  10dc  17fffd92       b #-0x9b8 (addr 0x2660bae9da64)
0x2660bae9e420  10e0  f900b7e7       str x7, [sp, #360]
0x2660bae9e424  10e4  f900e7e5       str x5, [sp, #456]
0x2660bae9e428  10e8  fd00a3eb       str d11, [sp, #320]
0x2660bae9e42c  10ec  fd009bec       str d12, [sp, #304]
0x2660bae9e430  10f0  f9003bea       str x10, [sp, #112]
0x2660bae9e434  10f4  3d800ff1       str q17, [sp, #48]
0x2660bae9e438  10f8  fd003fed       str d13, [sp, #120]
0x2660bae9e43c  10fc  fd0033ee       str d14, [sp, #96]
0x2660bae9e440  1100  fd0027f0       str d16, [sp, #72]
0x2660bae9e444  1104  f9006be4       str x4, [sp, #208]
0x2660bae9e448  1108  f90067e0       str x0, [sp, #200]
0x2660bae9e44c  110c  f90093eb       str x11, [sp, #288]
0x2660bae9e450  1110  f9008fef       str x15, [sp, #280]
0x2660bae9e454  1114  f90053ee       str x14, [sp, #160]
0x2660bae9e458  1118  f9004fec       str x12, [sp, #152]
0x2660bae9e45c  111c  f90063f3       str x19, [sp, #192]
0x2660bae9e460  1120  97fbdddc       bl #-0x108890 (addr 0x2660bad95bd0)
0x2660bae9e464  1124  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e468  1128  f940efe6       ldr x6, [sp, #472]
0x2660bae9e46c  112c  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e470  1130  f94063f3       ldr x19, [sp, #192]
0x2660bae9e474  1134  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e478  1138  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e47c  113c  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e480  1140  f940affb       ldr cp, [sp, #344]
0x2660bae9e484  1144  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e488  1148  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e48c  114c  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e490  1150  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e494  1154  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e498  1158  fd409bec       ldr d12, [sp, #304]
0x2660bae9e49c  115c  f94097fc       ldr x28, [sp, #296]
0x2660bae9e4a0  1160  f9403bea       ldr x10, [sp, #112]
0x2660bae9e4a4  1164  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e4a8  1168  fd403fed       ldr d13, [sp, #120]
0x2660bae9e4ac  116c  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e4b0  1170  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e4b4  1174  f9408bed       ldr x13, [sp, #272]
0x2660bae9e4b8  1178  f94087e9       ldr x9, [sp, #264]
0x2660bae9e4bc  117c  f9407ff4       ldr x20, [sp, #248]
0x2660bae9e4c0  1180  f9407bf5       ldr x21, [sp, #240]
0x2660bae9e4c4  1184  f9406be4       ldr x4, [sp, #208]
0x2660bae9e4c8  1188  f94067e0       ldr x0, [sp, #200]
0x2660bae9e4cc  118c  f94093eb       ldr x11, [sp, #288]
0x2660bae9e4d0  1190  f9408fef       ldr x15, [sp, #280]
0x2660bae9e4d4  1194  f9405bf6       ldr x22, [sp, #176]
0x2660bae9e4d8  1198  f94057f7       ldr x23, [sp, #168]
0x2660bae9e4dc  119c  f94053ee       ldr x14, [sp, #160]
0x2660bae9e4e0  11a0  f9404fec       ldr x12, [sp, #152]
0x2660bae9e4e4  11a4  f9404bf8       ldr x24, [sp, #144]
0x2660bae9e4e8  11a8  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e4ec  11ac  3dc003e2       ldr q2, [sp]
0x2660bae9e4f0  11b0  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e4f4  11b4  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e4f8  11b8  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e4fc  11bc  17fffd97       b #-0x9a4 (addr 0x2660bae9db58)
0x2660bae9e500  11c0  f900e7e5       str x5, [sp, #456]
0x2660bae9e504  11c4  f900b7e7       str x7, [sp, #360]
0x2660bae9e508  11c8  fd00a3eb       str d11, [sp, #320]
0x2660bae9e50c  11cc  fd009bec       str d12, [sp, #304]
0x2660bae9e510  11d0  f9003bea       str x10, [sp, #112]
0x2660bae9e514  11d4  3d800ff1       str q17, [sp, #48]
0x2660bae9e518  11d8  fd003fed       str d13, [sp, #120]
0x2660bae9e51c  11dc  f90093eb       str x11, [sp, #288]
0x2660bae9e520  11e0  fd0033ee       str d14, [sp, #96]
0x2660bae9e524  11e4  fd0027f0       str d16, [sp, #72]
0x2660bae9e528  11e8  f90067f4       str x20, [sp, #200]
0x2660bae9e52c  11ec  f9008ff7       str x23, [sp, #280]
0x2660bae9e530  11f0  f90083f5       str x21, [sp, #256]
0x2660bae9e534  11f4  f9006be4       str x4, [sp, #208]
0x2660bae9e538  11f8  f90053ee       str x14, [sp, #160]
0x2660bae9e53c  11fc  f9004fec       str x12, [sp, #152]
0x2660bae9e540  1200  f90063f3       str x19, [sp, #192]
0x2660bae9e544  1204  97fbdda3       bl #-0x108974 (addr 0x2660bad95bd0)
0x2660bae9e548  1208  f940f3e8       ldr x8, [sp, #480]
0x2660bae9e54c  120c  f940efe6       ldr x6, [sp, #472]
0x2660bae9e550  1210  f940ebe1       ldr x1, [sp, #464]
0x2660bae9e554  1214  f94063f3       ldr x19, [sp, #192]
0x2660bae9e558  1218  f940e7e5       ldr x5, [sp, #456]
0x2660bae9e55c  121c  f940bfe2       ldr x2, [sp, #376]
0x2660bae9e560  1220  f940bbef       ldr x15, [sp, #368]
0x2660bae9e564  1224  f940b7e7       ldr x7, [sp, #360]
0x2660bae9e568  1228  f940b3f9       ldr x25, [sp, #352]
0x2660bae9e56c  122c  f940affb       ldr cp, [sp, #344]
0x2660bae9e570  1230  fd40abe7       ldr d7, [sp, #336]
0x2660bae9e574  1234  fd40a7e6       ldr d6, [sp, #328]
0x2660bae9e578  1238  1e2e100a       fmov s10, #0x70 (1.0000)
0x2660bae9e57c  123c  fd40a3eb       ldr d11, [sp, #320]
0x2660bae9e580  1240  f9409fe3       ldr x3, [sp, #312]
0x2660bae9e584  1244  fd409bec       ldr d12, [sp, #304]
0x2660bae9e588  1248  f94097fc       ldr x28, [sp, #296]
0x2660bae9e58c  124c  f9403bea       ldr x10, [sp, #112]
0x2660bae9e590  1250  3dc00ff1       ldr q17, [sp, #48]
0x2660bae9e594  1254  fd403fed       ldr d13, [sp, #120]
0x2660bae9e598  1258  f94093eb       ldr x11, [sp, #288]
0x2660bae9e59c  125c  fd4033ee       ldr d14, [sp, #96]
0x2660bae9e5a0  1260  fd4027f0       ldr d16, [sp, #72]
0x2660bae9e5a4  1264  f94067f4       ldr x20, [sp, #200]
0x2660bae9e5a8  1268  f9408ff7       ldr x23, [sp, #280]
0x2660bae9e5ac  126c  f9408bed       ldr x13, [sp, #272]
0x2660bae9e5b0  1270  f94087e9       ldr x9, [sp, #264]
0x2660bae9e5b4  1274  f94083f5       ldr x21, [sp, #256]
0x2660bae9e5b8  1278  f94077f8       ldr x24, [sp, #232]
0x2660bae9e5bc  127c  f9406ff6       ldr x22, [sp, #216]
0x2660bae9e5c0  1280  f9406be4       ldr x4, [sp, #208]
0x2660bae9e5c4  1284  f94053ee       ldr x14, [sp, #160]
0x2660bae9e5c8  1288  f9404fec       ldr x12, [sp, #152]
0x2660bae9e5cc  128c  3dc007e4       ldr q4, [sp, #16]
0x2660bae9e5d0  1290  3dc003e2       ldr q2, [sp]
0x2660bae9e5d4  1294  3dc017e3       ldr q3, [sp, #80]
0x2660bae9e5d8  1298  3dc023e8       ldr q8, [sp, #128]
0x2660bae9e5dc  129c  fd405fe5       ldr d5, [sp, #184]
0x2660bae9e5e0  12a0  17fffde8       b #-0x860 (addr 0x2660bae9dd80)
0x2660bae9e5e4  12a4  d503201f       nop

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
0x2660bae9d500    1c0  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0x2660bae9d4fc  internal wasm call
0x2660bae9df20  internal wasm call
0x2660bae9dfcc  wasm stub call  (0x2660bad95bd0)
0x2660bae9e038  wasm stub call  (0x2660bad95bd0)
0x2660bae9e114  wasm stub call  (0x2660bad95bd0)
0x2660bae9e1e8  wasm stub call  (0x2660bad95bd0)
0x2660bae9e2c0  wasm stub call  (0x2660bad95bd0)
0x2660bae9e38c  wasm stub call  (0x2660bad95bd0)
0x2660bae9e460  wasm stub call  (0x2660bad95bd0)
0x2660bae9e544  wasm stub call  (0x2660bad95bd0)
