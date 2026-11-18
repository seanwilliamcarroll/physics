name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 5024 = 5004 + 20 padding)
Instructions (size = 4980)
0x20d29c68d5e0     0  d2800110       movz x16, #0x8
0x20d29c68d5e4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x20d29c68d5e8     8  a9017bfd       stp fp, lr, [sp, #16]
0x20d29c68d5ec     c  910043fd       add fp, sp, #0x10 (16)
0x20d29c68d5f0    10  d10803ff       sub sp, sp, #0x200 (512)
0x20d29c68d5f4    14  f841f0e1       ldur x1, [x7, #31]
0x20d29c68d5f8    18  f8520346       ldur x6, [x26, #-224]
0x20d29c68d5fc    1c  f9008be0       str x0, [sp, #272]
0x20d29c68d600    20  f9005fe1       str x1, [sp, #184]
0x20d29c68d604    24  eb2663ff       cmp sp, x6
0x20d29c68d608    28  54006629       b.ls #+0xcc4 (addr 0x20d29c68e2cc)
0x20d29c68d60c    2c  f842f0e6       ldur x6, [x7, #47]
0x20d29c68d610    30  b94000c8       ldr w8, [x6]
0x20d29c68d614    34  51014104       sub w4, w8, #0x50 (80)
0x20d29c68d618    38  b90000c4       str w4, [x6]
0x20d29c68d61c    3c  2a0003e8       mov w8, w0
0x20d29c68d620    40  91024029       add x9, x1, #0x90 (144)
0x20d29c68d624    44  fc686922       ldr d2, [x9, x8]
0x20d29c68d628    48  5e0c0441       mov s1, v2.s[1]
0x20d29c68d62c    4c  52a75010       movz w16, #0x3a800000
0x20d29c68d630    50  1e270203       fmov s3, w16
0x20d29c68d634    54  1e230824       fmul s4, s1, s3
0x20d29c68d638    58  5e040440       mov s0, v2.s[0]
0x20d29c68d63c    5c  1e230803       fmul s3, s0, s3
0x20d29c68d640    60  91028109       add x9, x8, #0xa0 (160)
0x20d29c68d644    64  bc696825       ldr s5, [x1, x9]
0x20d29c68d648    68  1e2520a0       fcmp s5, s5
0x20d29c68d64c    6c  1e251c65       fcsel s5, s3, s5, ne
0x20d29c68d650    70  1e232060       fcmp s3, s3
0x20d29c68d654    74  1e231ca3       fcsel s3, s5, s3, ne
0x20d29c68d658    78  1e252060       fcmp s3, s5
0x20d29c68d65c    7c  1e233ca3       fcsel s3, s5, s3, lo
0x20d29c68d660    80  1e232060       fcmp s3, s3
0x20d29c68d664    84  1e231c83       fcsel s3, s4, s3, ne
0x20d29c68d668    88  1e242080       fcmp s4, s4
0x20d29c68d66c    8c  1e241c64       fcsel s4, s3, s4, ne
0x20d29c68d670    90  1e232080       fcmp s4, s3
0x20d29c68d674    94  1e243c63       fcsel s3, s3, s4, lo
0x20d29c68d678    98  52840010       movz w16, #0x2000
0x20d29c68d67c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x20d29c68d680    a0  1e270204       fmov s4, w16
0x20d29c68d684    a4  1e240863       fmul s3, s3, s4
0x20d29c68d688    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x20d29c68d68c    ac  1e231883       fdiv s3, s4, s3
0x20d29c68d690    b0  9102110a       add x10, x8, #0x84 (132)
0x20d29c68d694    b4  bc2a6823       str s3, [x1, x10]
0x20d29c68d698    b8  4e040463       dup v3.4s, v3.s[0]
0x20d29c68d69c    bc  6e23dc42       fmul v2.4s, v2.4s, v3.4s
0x20d29c68d6a0    c0  4ea18842       frintp v2.4s, v2.4s
0x20d29c68d6a4    c4  5e040443       mov s3, v2.s[0]
0x20d29c68d6a8    c8  1e22c065       fcvt d5, s3
0x20d29c68d6ac    cc  1e65c0a6       frintz d6, d5
0x20d29c68d6b0    d0  1e7900cb       fcvtzu w11, d6
0x20d29c68d6b4    d4  1e630167       ucvtf d7, w11
0x20d29c68d6b8    d8  f900ffe6       str x6, [sp, #504]
0x20d29c68d6bc    dc  f900fbe4       str x4, [sp, #496]
0x20d29c68d6c0    e0  f900f3e8       str x8, [sp, #480]
0x20d29c68d6c4    e4  fd00cbe1       str d1, [sp, #400]
0x20d29c68d6c8    e8  fd00cfe0       str d0, [sp, #408]
0x20d29c68d6cc    ec  f900bfe9       str x9, [sp, #376]
0x20d29c68d6d0    f0  f900e7ea       str x10, [sp, #456]
0x20d29c68d6d4    f4  1e6720c0       fcmp d6, d7
0x20d29c68d6d8    f8  54006041       b.ne #+0xc08 (addr 0x20d29c68e2e0)
0x20d29c68d6dc    fc  4e040d63       dup v3.4s, w11
0x20d29c68d6e0   100  5e0c0445       mov s5, v2.s[1]
0x20d29c68d6e4   104  1e22c0a6       fcvt d6, s5
0x20d29c68d6e8   108  1e65c0c7       frintz d7, d6
0x20d29c68d6ec   10c  1e7900eb       fcvtzu w11, d7
0x20d29c68d6f0   110  1e630168       ucvtf d8, w11
0x20d29c68d6f4   114  1e6820e0       fcmp d7, d8
0x20d29c68d6f8   118  540060a1       b.ne #+0xc14 (addr 0x20d29c68e30c)
0x20d29c68d6fc   11c  4e0c1d63       mov v3.s[1], w11
0x20d29c68d700   120  4f000425       movi v5.4s, #0x1, lsl #0
0x20d29c68d704   124  6ea56463       umax v3.4s, v3.4s, v5.4s
0x20d29c68d708   128  6ea0c846       fcmge v6.4s, v2.4s, #0.0
0x20d29c68d70c   12c  52a9f010       movz w16, #0x4f800000
0x20d29c68d710   130  4e040e07       dup v7.4s, w16
0x20d29c68d714   134  6ea2e4e2       fcmgt v2.4s, v7.4s, v2.4s
0x20d29c68d718   138  4e221cc2       and v2.16b, v6.16b, v2.16b
0x20d29c68d71c   13c  6e651c62       bsl v2.16b, v3.16b, v5.16b
0x20d29c68d720   140  9102202b       add x11, x1, #0x88 (136)
0x20d29c68d724   144  8b08016c       add x12, x11, x8
0x20d29c68d728   148  0d008582       st1 {v2.d}[0], [x12]
0x20d29c68d72c   14c  9103310c       add x12, x8, #0xcc (204)
0x20d29c68d730   150  b86c682c       ldr w12, [x1, x12]
0x20d29c68d734   154  9100a08d       add x13, x4, #0x28 (40)
0x20d29c68d738   158  b82d682c       str w12, [x1, x13]
0x20d29c68d73c   15c  9103110c       add x12, x8, #0xc4 (196)
0x20d29c68d740   160  f86c682c       ldr x12, [x1, x12]
0x20d29c68d744   164  9100808d       add x13, x4, #0x20 (32)
0x20d29c68d748   168  f82d682c       str x12, [x1, x13]
0x20d29c68d74c   16c  1101800c       add w12, w0, #0x60 (96)
0x20d29c68d750   170  9100110d       add x13, x8, #0x4 (4)
0x20d29c68d754   174  b86d6822       ldr w2, [x1, x13]
0x20d29c68d758   178  9100210e       add x14, x8, #0x8 (8)
0x20d29c68d75c   17c  b86e6823       ldr w3, [x1, x14]
0x20d29c68d760   180  9100410f       add x15, x8, #0x10 (16)
0x20d29c68d764   184  b86f6833       ldr w19, [x1, x15]
0x20d29c68d768   188  91005114       add x20, x8, #0x14 (20)
0x20d29c68d76c   18c  b8746825       ldr w5, [x1, x20]
0x20d29c68d770   190  3d8023e5       str q5, [sp, #128]
0x20d29c68d774   194  3d800be7       str q7, [sp, #32]
0x20d29c68d778   198  f900ebeb       str x11, [sp, #464]
0x20d29c68d77c   19c  f900c3ed       str x13, [sp, #384]
0x20d29c68d780   1a0  f900f7ee       str x14, [sp, #488]
0x20d29c68d784   1a4  f900c7ef       str x15, [sp, #392]
0x20d29c68d788   1a8  f900eff4       str x20, [sp, #472]
0x20d29c68d78c   1ac  aa0c03e0       mov x0, x12
0x20d29c68d790   1b0  aa1303e4       mov x4, x19
0x20d29c68d794   1b4  97fbdfba       bl #-0x108118 (addr 0x20d29c58567c)
0x20d29c68d798   1b8  f9405fe1       ldr x1, [sp, #184]
0x20d29c68d79c   1bc  f940f7e6       ldr x6, [sp, #488]
0x20d29c68d7a0   1c0  b8666826       ldr w6, [x1, x6]
0x20d29c68d7a4   1c4  f900f7e6       str x6, [sp, #488]
0x20d29c68d7a8   1c8  35000106       cbnz w6, #+0x20 (addr 0x20d29c68d7c8)
0x20d29c68d7ac   1cc  f940fbe4       ldr x4, [sp, #496]
0x20d29c68d7b0   1d0  11014081       add w1, w4, #0x50 (80)
0x20d29c68d7b4   1d4  f940ffe8       ldr x8, [sp, #504]
0x20d29c68d7b8   1d8  b9000101       str w1, [x8]
0x20d29c68d7bc   1dc  910003bf       mov sp, fp
0x20d29c68d7c0   1e0  a8c17bfd       ldp fp, lr, [sp], #16
0x20d29c68d7c4   1e4  d65f03c0       ret
0x20d29c68d7c8   1e8  f9408be0       ldr x0, [sp, #272]
0x20d29c68d7cc   1ec  11028002       add w2, w0, #0xa0 (160)
0x20d29c68d7d0   1f0  f940f3e8       ldr x8, [sp, #480]
0x20d29c68d7d4   1f4  91017109       add x9, x8, #0x5c (92)
0x20d29c68d7d8   1f8  b8696829       ldr w9, [x1, x9]
0x20d29c68d7dc   1fc  9101410a       add x10, x8, #0x50 (80)
0x20d29c68d7e0   200  b86a682a       ldr w10, [x1, x10]
0x20d29c68d7e4   204  9101110b       add x11, x8, #0x44 (68)
0x20d29c68d7e8   208  b86b682b       ldr w11, [x1, x11]
0x20d29c68d7ec   20c  9100e10c       add x12, x8, #0x38 (56)
0x20d29c68d7f0   210  b86c682c       ldr w12, [x1, x12]
0x20d29c68d7f4   214  6b0c017f       cmp w11, w12
0x20d29c68d7f8   218  1a8c316d       csel w13, w11, w12, lo
0x20d29c68d7fc   21c  6b0d015f       cmp w10, w13
0x20d29c68d800   220  1a8d314b       csel w11, w10, w13, lo
0x20d29c68d804   224  6b0b013f       cmp w9, w11
0x20d29c68d808   228  1a8b312a       csel w10, w9, w11, lo
0x20d29c68d80c   22c  f940efe9       ldr x9, [sp, #472]
0x20d29c68d810   230  b8696829       ldr w9, [x1, x9]
0x20d29c68d814   234  9100810b       add x11, x8, #0x20 (32)
0x20d29c68d818   238  b86b682b       ldr w11, [x1, x11]
0x20d29c68d81c   23c  9100b10c       add x12, x8, #0x2c (44)
0x20d29c68d820   240  b86c682c       ldr w12, [x1, x12]
0x20d29c68d824   244  6b0c017f       cmp w11, w12
0x20d29c68d828   248  1a8c316d       csel w13, w11, w12, lo
0x20d29c68d82c   24c  6b0d013f       cmp w9, w13
0x20d29c68d830   250  1a8d312b       csel w11, w9, w13, lo
0x20d29c68d834   254  f940ebec       ldr x12, [sp, #464]
0x20d29c68d838   258  fc686982       ldr d2, [x12, x8]
0x20d29c68d83c   25c  3dc023e3       ldr q3, [sp, #128]
0x20d29c68d840   260  4e040464       dup v4.4s, v3.s[0]
0x20d29c68d844   264  6e0c0444       mov v4.s[1], v2.s[0]
0x20d29c68d848   268  6ea36442       umax v2.4s, v2.4s, v3.4s
0x20d29c68d84c   26c  6ea38442       sub v2.4s, v2.4s, v3.4s
0x20d29c68d850   270  9101610c       add x12, x8, #0x58 (88)
0x20d29c68d854   274  b86c682c       ldr w12, [x1, x12]
0x20d29c68d858   278  9101310e       add x14, x8, #0x4c (76)
0x20d29c68d85c   27c  b86e682e       ldr w14, [x1, x14]
0x20d29c68d860   280  9101010f       add x15, x8, #0x40 (64)
0x20d29c68d864   284  b86f682f       ldr w15, [x1, x15]
0x20d29c68d868   288  9100d113       add x19, x8, #0x34 (52)
0x20d29c68d86c   28c  b8736833       ldr w19, [x1, x19]
0x20d29c68d870   290  9101f114       add x20, x8, #0x7c (124)
0x20d29c68d874   294  b8746834       ldr w20, [x1, x20]
0x20d29c68d878   298  91020115       add x21, x8, #0x80 (128)
0x20d29c68d87c   29c  b8756835       ldr w21, [x1, x21]
0x20d29c68d880   2a0  91019116       add x22, x8, #0x64 (100)
0x20d29c68d884   2a4  b8766836       ldr w22, [x1, x22]
0x20d29c68d888   2a8  9101a117       add x23, x8, #0x68 (104)
0x20d29c68d88c   2ac  b8776837       ldr w23, [x1, x23]
0x20d29c68d890   2b0  91022118       add x24, x8, #0x88 (136)
0x20d29c68d894   2b4  b8786838       ldr w24, [x1, x24]
0x20d29c68d898   2b8  f940e7f9       ldr x25, [sp, #456]
0x20d29c68d89c   2bc  bc796825       ldr s5, [x1, x25]
0x20d29c68d8a0   2c0  91007119       add x25, x8, #0x1c (28)
0x20d29c68d8a4   2c4  b8796839       ldr w25, [x1, x25]
0x20d29c68d8a8   2c8  9100a11b       add cp, x8, #0x28 (40)
0x20d29c68d8ac   2cc  b87b683b       ldr w27, [x1, x27]
0x20d29c68d8b0   2d0  f940c7fc       ldr x28, [sp, #392]
0x20d29c68d8b4   2d4  b87c683c       ldr w28, [x1, x28]
0x20d29c68d8b8   2d8  f940c3e3       ldr x3, [sp, #384]
0x20d29c68d8bc   2dc  b8636823       ldr w3, [x1, x3]
0x20d29c68d8c0   2e0  f940bfe4       ldr x4, [sp, #376]
0x20d29c68d8c4   2e4  bc646826       ldr s6, [x1, x4]
0x20d29c68d8c8   2e8  1e2608c6       fmul s6, s6, s6
0x20d29c68d8cc   2ec  91029108       add x8, x8, #0xa4 (164)
0x20d29c68d8d0   2f0  bc686827       ldr s7, [x1, x8]
0x20d29c68d8d4   2f4  1e2708e7       fmul s7, s7, s7
0x20d29c68d8d8   2f8  f900d3e2       str x2, [sp, #416]
0x20d29c68d8dc   2fc  f900d7ea       str x10, [sp, #424]
0x20d29c68d8e0   300  f90083e9       str x9, [sp, #256]
0x20d29c68d8e4   304  f90087ed       str x13, [sp, #264]
0x20d29c68d8e8   308  f9001beb       str x11, [sp, #48]
0x20d29c68d8ec   30c  3d8007e4       str q4, [sp, #16]
0x20d29c68d8f0   310  3d8003e2       str q2, [sp]
0x20d29c68d8f4   314  f900ebec       str x12, [sp, #464]
0x20d29c68d8f8   318  f900e3ee       str x14, [sp, #448]
0x20d29c68d8fc   31c  f900dfef       str x15, [sp, #440]
0x20d29c68d900   320  f900dbf3       str x19, [sp, #432]
0x20d29c68d904   324  f9007bf4       str x20, [sp, #240]
0x20d29c68d908   328  f90077f5       str x21, [sp, #232]
0x20d29c68d90c   32c  f90057f6       str x22, [sp, #168]
0x20d29c68d910   330  f90053f7       str x23, [sp, #160]
0x20d29c68d914   334  f9003ff8       str x24, [sp, #120]
0x20d29c68d918   338  fd005be5       str d5, [sp, #176]
0x20d29c68d91c   33c  f900b7f9       str x25, [sp, #360]
0x20d29c68d920   340  f900bbfb       str cp, [sp, #368]
0x20d29c68d924   344  f900a7fc       str x28, [sp, #328]
0x20d29c68d928   348  f9009fe3       str x3, [sp, #312]
0x20d29c68d92c   34c  fd00b3e6       str d6, [sp, #352]
0x20d29c68d930   350  fd00afe7       str d7, [sp, #344]
0x20d29c68d934   354  aa0103e4       mov x4, x1
0x20d29c68d938   358  d2800001       movz x1, #0x0
0x20d29c68d93c   35c  f900efe1       str x1, [sp, #472]
0x20d29c68d940   360  14000016       b #+0x58 (addr 0x20d29c68d998)
0x20d29c68d944   364  f9401beb       ldr x11, [sp, #48]
0x20d29c68d948   368  fd405be5       ldr d5, [sp, #176]
0x20d29c68d94c   36c  f9408be0       ldr x0, [sp, #272]
0x20d29c68d950   370  aa0d03e4       mov x4, x13
0x20d29c68d954   374  aa0803e6       mov x6, x8
0x20d29c68d958   378  3dc023e3       ldr q3, [sp, #128]
0x20d29c68d95c   37c  f940bbfb       ldr cp, [sp, #368]
0x20d29c68d960   380  f940b7f9       ldr x25, [sp, #360]
0x20d29c68d964   384  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68d968   388  fd40afe7       ldr d7, [sp, #344]
0x20d29c68d96c   38c  f940a7fc       ldr x28, [sp, #328]
0x20d29c68d970   390  f9409fe3       ldr x3, [sp, #312]
0x20d29c68d974   394  f94087ed       ldr x13, [sp, #264]
0x20d29c68d978   398  f94083e9       ldr x9, [sp, #256]
0x20d29c68d97c   39c  f9407bf4       ldr x20, [sp, #240]
0x20d29c68d980   3a0  f94077f5       ldr x21, [sp, #232]
0x20d29c68d984   3a4  f94057f6       ldr x22, [sp, #168]
0x20d29c68d988   3a8  f94053f7       ldr x23, [sp, #160]
0x20d29c68d98c   3ac  f9403ff8       ldr x24, [sp, #120]
0x20d29c68d990   3b0  3dc007e4       ldr q4, [sp, #16]
0x20d29c68d994   3b4  3dc003e2       ldr q2, [sp]
0x20d29c68d998   3b8  f8520345       ldur x5, [x26, #-224]
0x20d29c68d99c   3bc  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68d9a0   3c0  3dc00be8       ldr q8, [sp, #32]
0x20d29c68d9a4   3c4  eb2563ff       cmp sp, x5
0x20d29c68d9a8   3c8  54004c29       b.ls #+0x984 (addr 0x20d29c68e32c)
0x20d29c68d9ac   3cc  6b01017f       cmp w11, w1
0x20d29c68d9b0   3d0  54004769       b.ls #+0x8ec (addr 0x20d29c68e29c)
0x20d29c68d9b4   3d4  531e7425       lsl w5, w1, #2
0x20d29c68d9b8   3d8  0b050067       add w7, w3, w5
0x20d29c68d9bc   3dc  bc67688b       ldr s11, [x4, x7]
0x20d29c68d9c0   3e0  0b050387       add w7, w28, w5
0x20d29c68d9c4   3e4  bc67688c       ldr s12, [x4, x7]
0x20d29c68d9c8   3e8  0b050327       add w7, w25, w5
0x20d29c68d9cc   3ec  bc67688d       ldr s13, [x4, x7]
0x20d29c68d9d0   3f0  0b050367       add w7, w27, w5
0x20d29c68d9d4   3f4  bc67688e       ldr s14, [x4, x7]
0x20d29c68d9d8   3f8  f940fbe8       ldr x8, [sp, #496]
0x20d29c68d9dc   3fc  91003107       add x7, x8, #0xc (12)
0x20d29c68d9e0   400  bc27688e       str s14, [x4, x7]
0x20d29c68d9e4   404  91002107       add x7, x8, #0x8 (8)
0x20d29c68d9e8   408  bc27688d       str s13, [x4, x7]
0x20d29c68d9ec   40c  91001107       add x7, x8, #0x4 (4)
0x20d29c68d9f0   410  bc27688c       str s12, [x4, x7]
0x20d29c68d9f4   414  bc28688b       str s11, [x4, x8]
0x20d29c68d9f8   418  91012107       add x7, x8, #0x48 (72)
0x20d29c68d9fc   41c  b827689f       str wzr, [x4, x7]
0x20d29c68da00   420  9101010a       add x10, x8, #0x40 (64)
0x20d29c68da04   424  f82a689f       str xzr, [x4, x10]
0x20d29c68da08   428  6f00e40d       movi v13.2d, #0x0
0x20d29c68da0c   42c  9100c10b       add x11, x8, #0x30 (48)
0x20d29c68da10   430  3cab688d       str q13, [x4, x11]
0x20d29c68da14   434  1e25096d       fmul s13, s11, s5
0x20d29c68da18   438  1e2541ad       frintm s13, s13
0x20d29c68da1c   43c  1e2d21a0       fcmp s13, s13
0x20d29c68da20   440  1e2d1ded       fcsel s13, s15, s13, ne
0x20d29c68da24   444  1e2021a8       fcmp s13, #0.0
0x20d29c68da28   448  1e2fcdad       fcsel s13, s13, s15, gt
0x20d29c68da2c   44c  4e0405ae       dup v14.4s, v13.s[0]
0x20d29c68da30   450  1e250990       fmul s16, s12, s5
0x20d29c68da34   454  1e254210       frintm s16, s16
0x20d29c68da38   458  1e302200       fcmp s16, s16
0x20d29c68da3c   45c  1e301df0       fcsel s16, s15, s16, ne
0x20d29c68da40   460  1e202208       fcmp s16, #0.0
0x20d29c68da44   464  1e2fce11       fcsel s17, s16, s15, gt
0x20d29c68da48   468  f9005fe4       str x4, [sp, #184]
0x20d29c68da4c   46c  1e260204       fmov w4, s16
0x20d29c68da50   470  6a04009f       tst w4, w4
0x20d29c68da54   474  1e301e30       fcsel s16, s17, s16, ne
0x20d29c68da58   478  1e202228       fcmp s17, #0.0
0x20d29c68da5c   47c  1e310e10       fcsel s16, s16, s17, eq
0x20d29c68da60   480  6e0c060e       mov v14.s[1], v16.s[0]
0x20d29c68da64   484  6eaee50e       fcmgt v14.4s, v8.4s, v14.4s
0x20d29c68da68   488  4e040c11       dup v17.4s, w0
0x20d29c68da6c   48c  1e22c1b2       fcvt d18, s13
0x20d29c68da70   490  1e65c253       frintz d19, d18
0x20d29c68da74   494  1e790260       fcvtzu w0, d19
0x20d29c68da78   498  1e630014       ucvtf d20, w0
0x20d29c68da7c   49c  f900f3e1       str x1, [sp, #480]
0x20d29c68da80   4a0  f900e7e5       str x5, [sp, #456]
0x20d29c68da84   4a4  f900c3ea       str x10, [sp, #384]
0x20d29c68da88   4a8  f900c7eb       str x11, [sp, #392]
0x20d29c68da8c   4ac  1e742260       fcmp d19, d20
0x20d29c68da90   4b0  54004881       b.ne #+0x910 (addr 0x20d29c68e3a0)
0x20d29c68da94   4b4  4eb11e2d       mov v13.16b, v17.16b
0x20d29c68da98   4b8  4e041c0d       mov v13.s[0], w0
0x20d29c68da9c   4bc  1e22c211       fcvt d17, s16
0x20d29c68daa0   4c0  1e65c232       frintz d18, d17
0x20d29c68daa4   4c4  1e790240       fcvtzu w0, d18
0x20d29c68daa8   4c8  1e630013       ucvtf d19, w0
0x20d29c68daac   4cc  1e732240       fcmp d18, d19
0x20d29c68dab0   4d0  54004881       b.ne #+0x910 (addr 0x20d29c68e3c0)
0x20d29c68dab4   4d4  4e0c1c0d       mov v13.s[1], w0
0x20d29c68dab8   4d8  6ead6c4d       umin v13.4s, v2.4s, v13.4s
0x20d29c68dabc   4dc  4e2d1dcd       and v13.16b, v14.16b, v13.16b
0x20d29c68dac0   4e0  4ea385ae       add v14.4s, v13.4s, v3.4s
0x20d29c68dac4   4e4  6eae6c4e       umin v14.4s, v2.4s, v14.4s
0x20d29c68dac8   4e8  4eae9c90       mul v16.4s, v4.4s, v14.4s
0x20d29c68dacc   4ec  0e0c3e00       mov w0, v16.s[1]
0x20d29c68dad0   4f0  0e043da4       mov w4, v13.s[0]
0x20d29c68dad4   4f4  7100009f       cmp w4, #0x0 (0)
0x20d29c68dad8   4f8  9a9f07ec       cset x12, ne
0x20d29c68dadc   4fc  4b0c008c       sub w12, w4, w12
0x20d29c68dae0   500  0b0c0004       add w4, w0, w12
0x20d29c68dae4   504  4eae8490       add v16.4s, v4.4s, v14.4s
0x20d29c68dae8   508  0e043e0e       mov w14, v16.s[0]
0x20d29c68daec   50c  0b0e0000       add w0, w0, w14
0x20d29c68daf0   510  6b17009f       cmp w4, w23
0x20d29c68daf4   514  7a573002       ccmp w0, w23, #nzCv, lo
0x20d29c68daf8   518  9a9f27ef       cset x15, lo
0x20d29c68dafc   51c  0e0c3db3       mov w19, v13.s[1]
0x20d29c68db00   520  7100027f       cmp w19, #0x0 (0)
0x20d29c68db04   524  9a9f07e2       cset x2, ne
0x20d29c68db08   528  4b020273       sub w19, w19, w2
0x20d29c68db0c   52c  0b000ac0       add w0, w22, w0, lsl #2
0x20d29c68db10   530  0b040ac2       add w2, w22, w4, lsl #2
0x20d29c68db14   534  0e0c3dc4       mov w4, v14.s[1]
0x20d29c68db18   538  f9004bec       str x12, [sp, #144]
0x20d29c68db1c   53c  f9004fee       str x14, [sp, #152]
0x20d29c68db20   540  f9006bef       str x15, [sp, #208]
0x20d29c68db24   544  f9006fe0       str x0, [sp, #216]
0x20d29c68db28   548  f90073e2       str x2, [sp, #224]
0x20d29c68db2c   54c  f940efe5       ldr x5, [sp, #472]
0x20d29c68db30   550  2f00e40d       movi d13, #0x0
0x20d29c68db34   554  f9001ff3       str x19, [sp, #56]
0x20d29c68db38   558  f9405ff3       ldr x19, [sp, #184]
0x20d29c68db3c   55c  d2800002       movz x2, #0x0
0x20d29c68db40   560  f9009be2       str x2, [sp, #304]
0x20d29c68db44   564  4ead1dae       mov v14.16b, v13.16b
0x20d29c68db48   568  4ead1db0       mov v16.16b, v13.16b
0x20d29c68db4c   56c  4ead1db1       mov v17.16b, v13.16b
0x20d29c68db50   570  4ead1db2       mov v18.16b, v13.16b
0x20d29c68db54   574  4ead1db3       mov v19.16b, v13.16b
0x20d29c68db58   578  4ead1db4       mov v20.16b, v13.16b
0x20d29c68db5c   57c  14000006       b #+0x18 (addr 0x20d29c68db74)
0x20d29c68db60   580  f940f3e1       ldr x1, [sp, #480]
0x20d29c68db64   584  f940f7e6       ldr x6, [sp, #488]
0x20d29c68db68   588  f9001fe2       str x2, [sp, #56]
0x20d29c68db6c   58c  aa0a03e2       mov x2, x10
0x20d29c68db70   590  f9009bef       str x15, [sp, #304]
0x20d29c68db74   594  f8520340       ldur x0, [x26, #-224]
0x20d29c68db78   598  eb2063ff       cmp sp, x0
0x20d29c68db7c   59c  54004329       b.ls #+0x864 (addr 0x20d29c68e3e0)
0x20d29c68db80   5a0  340000a2       cbz w2, #+0x14 (addr 0x20d29c68db94)
0x20d29c68db84   5a4  6b05005f       cmp w2, w5
0x20d29c68db88   5a8  54000060       b.eq #+0xc (addr 0x20d29c68db94)
0x20d29c68db8c   5ac  d2800000       movz x0, #0x0
0x20d29c68db90   5b0  14000002       b #+0x8 (addr 0x20d29c68db98)
0x20d29c68db94   5b4  d2800020       movz x0, #0x1
0x20d29c68db98   5b8  aa0203eb       mov x11, x2
0x20d29c68db9c   5bc  f9409bef       ldr x15, [sp, #304]
0x20d29c68dba0   5c0  f9401fe2       ldr x2, [sp, #56]
0x20d29c68dba4   5c4  14000005       b #+0x14 (addr 0x20d29c68dbb8)
0x20d29c68dba8   5c8  aa0003ef       mov x15, x0
0x20d29c68dbac   5cc  f9408be0       ldr x0, [sp, #272]
0x20d29c68dbb0   5d0  aa0203eb       mov x11, x2
0x20d29c68dbb4   5d4  aa0a03e2       mov x2, x10
0x20d29c68dbb8   5d8  f852034a       ldur x10, [x26, #-224]
0x20d29c68dbbc   5dc  eb2a63ff       cmp sp, x10
0x20d29c68dbc0   5e0  540047c9       b.ls #+0x8f8 (addr 0x20d29c68e4b8)
0x20d29c68dbc4   5e4  350003c0       cbnz w0, #+0x78 (addr 0x20d29c68dc3c)
0x20d29c68dbc8   5e8  1100116a       add w10, w11, #0x4 (4)
0x20d29c68dbcc   5ec  2a0b03eb       mov w11, w11
0x20d29c68dbd0   5f0  b86b6a6b       ldr w11, [x19, x11]
0x20d29c68dbd4   5f4  6b01017f       cmp w11, w1
0x20d29c68dbd8   5f8  540000e0       b.eq #+0x1c (addr 0x20d29c68dbf4)
0x20d29c68dbdc   5fc  6b0b00df       cmp w6, w11
0x20d29c68dbe0   600  540000a9       b.ls #+0x14 (addr 0x20d29c68dbf4)
0x20d29c68dbe4   604  6b0b013f       cmp w9, w11
0x20d29c68dbe8   608  54000069       b.ls #+0xc (addr 0x20d29c68dbf4)
0x20d29c68dbec   60c  6b0d017f       cmp w11, w13
0x20d29c68dbf0   610  540026e3       b.lo #+0x4dc (addr 0x20d29c68e0cc)
0x20d29c68dbf4   614  6b05015f       cmp w10, w5
0x20d29c68dbf8   618  54000100       b.eq #+0x20 (addr 0x20d29c68dc18)
0x20d29c68dbfc   61c  f940c3eb       ldr x11, [sp, #384]
0x20d29c68dc00   620  aa0f03e0       mov x0, x15
0x20d29c68dc04   624  f940c7ef       ldr x15, [sp, #392]
0x20d29c68dc08   628  aa0a03f0       mov x16, x10
0x20d29c68dc0c   62c  aa0203ea       mov x10, x2
0x20d29c68dc10   630  aa1003e2       mov x2, x16
0x20d29c68dc14   634  1400012b       b #+0x4ac (addr 0x20d29c68e0c0)
0x20d29c68dc18   638  f940c3eb       ldr x11, [sp, #384]
0x20d29c68dc1c   63c  aa0203f0       mov x16, x2
0x20d29c68dc20   640  aa0a03e2       mov x2, x10
0x20d29c68dc24   644  aa1003ea       mov x10, x16
0x20d29c68dc28   648  aa0f03e0       mov x0, x15
0x20d29c68dc2c   64c  d2800030       movz x16, #0x1
0x20d29c68dc30   650  f9008bf0       str x16, [sp, #272]
0x20d29c68dc34   654  f940c7ef       ldr x15, [sp, #392]
0x20d29c68dc38   658  17ffffdc       b #-0x90 (addr 0x20d29c68dba8)
0x20d29c68dc3c   65c  72001dff       tst w15, #0xff
0x20d29c68dc40   660  54002d41       b.ne #+0x5a8 (addr 0x20d29c68e1e8)
0x20d29c68dc44   664  6b02009f       cmp w4, w2
0x20d29c68dc48   668  54002b23       b.lo #+0x564 (addr 0x20d29c68e1ac)
0x20d29c68dc4c   66c  14000003       b #+0xc (addr 0x20d29c68dc58)
0x20d29c68dc50   670  aa0b03e0       mov x0, x11
0x20d29c68dc54   674  aa0a03e2       mov x2, x10
0x20d29c68dc58   678  f852034a       ldur x10, [x26, #-224]
0x20d29c68dc5c   67c  eb2a63ff       cmp sp, x10
0x20d29c68dc60   680  54004a49       b.ls #+0x948 (addr 0x20d29c68e5a8)
0x20d29c68dc64   684  6b02009f       cmp w4, w2
0x20d29c68dc68   688  540011a9       b.ls #+0x234 (addr 0x20d29c68de9c)
0x20d29c68dc6c   68c  14000002       b #+0x8 (addr 0x20d29c68dc74)
0x20d29c68dc70   690  aa0a03e2       mov x2, x10
0x20d29c68dc74   694  f852034a       ldur x10, [x26, #-224]
0x20d29c68dc78   698  eb2a63ff       cmp sp, x10
0x20d29c68dc7c   69c  54005069       b.ls #+0xa0c (addr 0x20d29c68e688)
0x20d29c68dc80   6a0  1100044a       add w10, w2, #0x1 (1)
0x20d29c68dc84   6a4  1b187c40       mul w0, w2, w24
0x20d29c68dc88   6a8  0b0c000b       add w11, w0, w12
0x20d29c68dc8c   6ac  6b0b02ff       cmp w23, w11
0x20d29c68dc90   6b0  540008e9       b.ls #+0x11c (addr 0x20d29c68ddac)
0x20d29c68dc94   6b4  0b0e0000       add w0, w0, w14
0x20d29c68dc98   6b8  6b0002ff       cmp w23, w0
0x20d29c68dc9c   6bc  54000889       b.ls #+0x110 (addr 0x20d29c68ddac)
0x20d29c68dca0   6c0  0b000acf       add w15, w22, w0, lsl #2
0x20d29c68dca4   6c4  b86f6a60       ldr w0, [x19, x15]
0x20d29c68dca8   6c8  0b0b0acb       add w11, w22, w11, lsl #2
0x20d29c68dcac   6cc  b86b6a6b       ldr w11, [x19, x11]
0x20d29c68dcb0   6d0  6b0b001f       cmp w0, w11
0x20d29c68dcb4   6d4  540007c3       b.lo #+0xf8 (addr 0x20d29c68ddac)
0x20d29c68dcb8   6d8  6b0002bf       cmp w21, w0
0x20d29c68dcbc   6dc  54000783       b.lo #+0xf0 (addr 0x20d29c68ddac)
0x20d29c68dcc0   6e0  6b0b001f       cmp w0, w11
0x20d29c68dcc4   6e4  54000740       b.eq #+0xe8 (addr 0x20d29c68ddac)
0x20d29c68dcc8   6e8  0b0b0a8f       add w15, w20, w11, lsl #2
0x20d29c68dccc   6ec  4b0b000b       sub w11, w0, w11
0x20d29c68dcd0   6f0  531e756b       lsl w11, w11, #2
0x20d29c68dcd4   6f4  0b0b01e5       add w5, w15, w11
0x20d29c68dcd8   6f8  110011e0       add w0, w15, #0x4 (4)
0x20d29c68dcdc   6fc  b86f6a62       ldr w2, [x19, x15]
0x20d29c68dce0   700  6b01005f       cmp w2, w1
0x20d29c68dce4   704  540000e0       b.eq #+0x1c (addr 0x20d29c68dd00)
0x20d29c68dce8   708  6b0200df       cmp w6, w2
0x20d29c68dcec   70c  540000a9       b.ls #+0x14 (addr 0x20d29c68dd00)
0x20d29c68dcf0   710  6b02013f       cmp w9, w2
0x20d29c68dcf4   714  54000069       b.ls #+0xc (addr 0x20d29c68dd00)
0x20d29c68dcf8   718  6b0d005f       cmp w2, w13
0x20d29c68dcfc   71c  540006a3       b.lo #+0xd4 (addr 0x20d29c68ddd0)
0x20d29c68dd00   720  5100116b       sub w11, w11, #0x4 (4)
0x20d29c68dd04   724  3400052b       cbz w11, #+0xa4 (addr 0x20d29c68dda8)
0x20d29c68dd08   728  110021e2       add w2, w15, #0x8 (8)
0x20d29c68dd0c   72c  b8606a60       ldr w0, [x19, x0]
0x20d29c68dd10   730  6b01001f       cmp w0, w1
0x20d29c68dd14   734  540000e0       b.eq #+0x1c (addr 0x20d29c68dd30)
0x20d29c68dd18   738  6b0000df       cmp w6, w0
0x20d29c68dd1c   73c  540000a9       b.ls #+0x14 (addr 0x20d29c68dd30)
0x20d29c68dd20   740  6b00013f       cmp w9, w0
0x20d29c68dd24   744  54000069       b.ls #+0xc (addr 0x20d29c68dd30)
0x20d29c68dd28   748  6b0d001f       cmp w0, w13
0x20d29c68dd2c   74c  54000463       b.lo #+0x8c (addr 0x20d29c68ddb8)
0x20d29c68dd30   750  5100116b       sub w11, w11, #0x4 (4)
0x20d29c68dd34   754  340003cb       cbz w11, #+0x78 (addr 0x20d29c68ddac)
0x20d29c68dd38   758  110031e0       add w0, w15, #0xc (12)
0x20d29c68dd3c   75c  b8626a62       ldr w2, [x19, x2]
0x20d29c68dd40   760  6b01005f       cmp w2, w1
0x20d29c68dd44   764  540000e0       b.eq #+0x1c (addr 0x20d29c68dd60)
0x20d29c68dd48   768  6b0200df       cmp w6, w2
0x20d29c68dd4c   76c  540000a9       b.ls #+0x14 (addr 0x20d29c68dd60)
0x20d29c68dd50   770  6b02013f       cmp w9, w2
0x20d29c68dd54   774  54000069       b.ls #+0xc (addr 0x20d29c68dd60)
0x20d29c68dd58   778  6b0d005f       cmp w2, w13
0x20d29c68dd5c   77c  540003a3       b.lo #+0x74 (addr 0x20d29c68ddd0)
0x20d29c68dd60   780  5100116b       sub w11, w11, #0x4 (4)
0x20d29c68dd64   784  3400022b       cbz w11, #+0x44 (addr 0x20d29c68dda8)
0x20d29c68dd68   788  f8520342       ldur x2, [x26, #-224]
0x20d29c68dd6c   78c  eb2263ff       cmp sp, x2
0x20d29c68dd70   790  54004f89       b.ls #+0x9f0 (addr 0x20d29c68e760)
0x20d29c68dd74   794  110041ef       add w15, w15, #0x10 (16)
0x20d29c68dd78   798  b8606a60       ldr w0, [x19, x0]
0x20d29c68dd7c   79c  6b01001f       cmp w0, w1
0x20d29c68dd80   7a0  540000e0       b.eq #+0x1c (addr 0x20d29c68dd9c)
0x20d29c68dd84   7a4  6b0000df       cmp w6, w0
0x20d29c68dd88   7a8  540000a9       b.ls #+0x14 (addr 0x20d29c68dd9c)
0x20d29c68dd8c   7ac  6b00013f       cmp w9, w0
0x20d29c68dd90   7b0  54000069       b.ls #+0xc (addr 0x20d29c68dd9c)
0x20d29c68dd94   7b4  6b0d001f       cmp w0, w13
0x20d29c68dd98   7b8  54000183       b.lo #+0x30 (addr 0x20d29c68ddc8)
0x20d29c68dd9c   7bc  5100116b       sub w11, w11, #0x4 (4)
0x20d29c68dda0   7c0  35fff9cb       cbnz w11, #-0xc8 (addr 0x20d29c68dcd8)
0x20d29c68dda4   7c4  14000002       b #+0x8 (addr 0x20d29c68ddac)
0x20d29c68dda8   7c8  aa0203e0       mov x0, x2
0x20d29c68ddac   7cc  6b04015f       cmp w10, w4
0x20d29c68ddb0   7d0  54fff601       b.ne #-0x140 (addr 0x20d29c68dc70)
0x20d29c68ddb4   7d4  14000038       b #+0xe0 (addr 0x20d29c68de94)
0x20d29c68ddb8   7d8  aa0203f0       mov x16, x2
0x20d29c68ddbc   7dc  aa0003e2       mov x2, x0
0x20d29c68ddc0   7e0  aa1003e0       mov x0, x16
0x20d29c68ddc4   7e4  14000003       b #+0xc (addr 0x20d29c68ddd0)
0x20d29c68ddc8   7e8  aa0003e2       mov x2, x0
0x20d29c68ddcc   7ec  aa0f03e0       mov x0, x15
0x20d29c68ddd0   7f0  531e744b       lsl w11, w2, #2
0x20d29c68ddd4   7f4  0b0b006f       add w15, w3, w11
0x20d29c68ddd8   7f8  bc6f6a75       ldr s21, [x19, x15]
0x20d29c68dddc   7fc  1e353976       fsub s22, s11, s21
0x20d29c68dde0   800  1e360ad7       fmul s23, s22, s22
0x20d29c68dde4   804  0b0b038f       add w15, w28, w11
0x20d29c68dde8   808  bc6f6a78       ldr s24, [x19, x15]
0x20d29c68ddec   80c  1e383999       fsub s25, s12, s24
0x20d29c68ddf0   810  1e390b3a       fmul s26, s25, s25
0x20d29c68ddf4   814  1e3a2af7       fadd s23, s23, s26
0x20d29c68ddf8   818  1e2722e0       fcmp s23, s7
0x20d29c68ddfc   81c  540001e3       b.lo #+0x3c (addr 0x20d29c68de38)
0x20d29c68de00   820  1e2622e0       fcmp s23, s6
0x20d29c68de04   824  540001e2       b.hs #+0x3c (addr 0x20d29c68de40)
0x20d29c68de08   828  1e2022e8       fcmp s23, #0.0
0x20d29c68de0c   82c  540001ad       b.le #+0x34 (addr 0x20d29c68de40)
0x20d29c68de10   830  1e2a2a52       fadd s18, s18, s10
0x20d29c68de14   834  0b0b036f       add w15, w27, w11
0x20d29c68de18   838  bc6f6a76       ldr s22, [x19, x15]
0x20d29c68de1c   83c  1e362a31       fadd s17, s17, s22
0x20d29c68de20   840  0b0b032f       add w15, w25, w11
0x20d29c68de24   844  bc6f6a76       ldr s22, [x19, x15]
0x20d29c68de28   848  1e362a10       fadd s16, s16, s22
0x20d29c68de2c   84c  1e3829ce       fadd s14, s14, s24
0x20d29c68de30   850  1e3529ad       fadd s13, s13, s21
0x20d29c68de34   854  14000003       b #+0xc (addr 0x20d29c68de40)
0x20d29c68de38   858  1e392a94       fadd s20, s20, s25
0x20d29c68de3c   85c  1e362a73       fadd s19, s19, s22
0x20d29c68de40   860  6b05001f       cmp w0, w5
0x20d29c68de44   864  54000081       b.ne #+0x10 (addr 0x20d29c68de54)
0x20d29c68de48   868  6b0a009f       cmp w4, w10
0x20d29c68de4c   86c  54fff022       b.hs #-0x1fc (addr 0x20d29c68dc50)
0x20d29c68de50   870  140000d8       b #+0x360 (addr 0x20d29c68e1b0)
0x20d29c68de54   874  bc276a74       str s20, [x19, x7]
0x20d29c68de58   878  9101110b       add x11, x8, #0x44 (68)
0x20d29c68de5c   87c  bc2b6a73       str s19, [x19, x11]
0x20d29c68de60   880  f940c3eb       ldr x11, [sp, #384]
0x20d29c68de64   884  bc2b6a72       str s18, [x19, x11]
0x20d29c68de68   888  9100f10f       add x15, x8, #0x3c (60)
0x20d29c68de6c   88c  bc2f6a71       str s17, [x19, x15]
0x20d29c68de70   890  9100e10f       add x15, x8, #0x38 (56)
0x20d29c68de74   894  bc2f6a70       str s16, [x19, x15]
0x20d29c68de78   898  9100d10f       add x15, x8, #0x34 (52)
0x20d29c68de7c   89c  bc2f6a6e       str s14, [x19, x15]
0x20d29c68de80   8a0  f940c7ef       ldr x15, [sp, #392]
0x20d29c68de84   8a4  bc2f6a6d       str s13, [x19, x15]
0x20d29c68de88   8a8  aa0003e2       mov x2, x0
0x20d29c68de8c   8ac  d2800000       movz x0, #0x0
0x20d29c68de90   8b0  1400008c       b #+0x230 (addr 0x20d29c68e0c0)
0x20d29c68de94   8b4  aa0403ea       mov x10, x4
0x20d29c68de98   8b8  14000002       b #+0x8 (addr 0x20d29c68dea0)
0x20d29c68de9c   8bc  aa0203ea       mov x10, x2
0x20d29c68dea0   8c0  bc276a74       str s20, [x19, x7]
0x20d29c68dea4   8c4  9101110b       add x11, x8, #0x44 (68)
0x20d29c68dea8   8c8  bc2b6a73       str s19, [x19, x11]
0x20d29c68deac   8cc  f940c3ef       ldr x15, [sp, #384]
0x20d29c68deb0   8d0  bc2f6a72       str s18, [x19, x15]
0x20d29c68deb4   8d4  9100f102       add x2, x8, #0x3c (60)
0x20d29c68deb8   8d8  bc226a71       str s17, [x19, x2]
0x20d29c68debc   8dc  9100e116       add x22, x8, #0x38 (56)
0x20d29c68dec0   8e0  bc366a70       str s16, [x19, x22]
0x20d29c68dec4   8e4  9100d117       add x23, x8, #0x34 (52)
0x20d29c68dec8   8e8  bc376a6e       str s14, [x19, x23]
0x20d29c68decc   8ec  f940c7f8       ldr x24, [sp, #392]
0x20d29c68ded0   8f0  bc386a6d       str s13, [x19, x24]
0x20d29c68ded4   8f4  f900efe5       str x5, [sp, #472]
0x20d29c68ded8   8f8  f9008be0       str x0, [sp, #272]
0x20d29c68dedc   8fc  f9406be0       ldr x0, [sp, #208]
0x20d29c68dee0   900  340014a0       cbz w0, #+0x294 (addr 0x20d29c68e174)
0x20d29c68dee4   904  f9406fec       ldr x12, [sp, #216]
0x20d29c68dee8   908  b86c6a65       ldr w5, [x19, x12]
0x20d29c68deec   90c  f94073ec       ldr x12, [sp, #224]
0x20d29c68def0   910  b86c6a6e       ldr w14, [x19, x12]
0x20d29c68def4   914  6b0e00bf       cmp w5, w14
0x20d29c68def8   918  54001543       b.lo #+0x2a8 (addr 0x20d29c68e1a0)
0x20d29c68defc   91c  6b0502bf       cmp w21, w5
0x20d29c68df00   920  54001503       b.lo #+0x2a0 (addr 0x20d29c68e1a0)
0x20d29c68df04   924  6b0e00bf       cmp w5, w14
0x20d29c68df08   928  54001440       b.eq #+0x288 (addr 0x20d29c68e190)
0x20d29c68df0c   92c  0b0e0a95       add w21, w20, w14, lsl #2
0x20d29c68df10   930  4b0e00ae       sub w14, w5, w14
0x20d29c68df14   934  531e75ce       lsl w14, w14, #2
0x20d29c68df18   938  0b0e02a5       add w5, w21, w14
0x20d29c68df1c   93c  110012b4       add w20, w21, #0x4 (4)
0x20d29c68df20   940  b8756a60       ldr w0, [x19, x21]
0x20d29c68df24   944  6b01001f       cmp w0, w1
0x20d29c68df28   948  540000e0       b.eq #+0x1c (addr 0x20d29c68df44)
0x20d29c68df2c   94c  6b0000df       cmp w6, w0
0x20d29c68df30   950  540000a9       b.ls #+0x14 (addr 0x20d29c68df44)
0x20d29c68df34   954  6b00013f       cmp w9, w0
0x20d29c68df38   958  54000069       b.ls #+0xc (addr 0x20d29c68df44)
0x20d29c68df3c   95c  6b0d001f       cmp w0, w13
0x20d29c68df40   960  54000603       b.lo #+0xc0 (addr 0x20d29c68e000)
0x20d29c68df44   964  510011ce       sub w14, w14, #0x4 (4)
0x20d29c68df48   968  340011ae       cbz w14, #+0x234 (addr 0x20d29c68e17c)
0x20d29c68df4c   96c  110022a0       add w0, w21, #0x8 (8)
0x20d29c68df50   970  b8746a74       ldr w20, [x19, x20]
0x20d29c68df54   974  6b01029f       cmp w20, w1
0x20d29c68df58   978  540000e0       b.eq #+0x1c (addr 0x20d29c68df74)
0x20d29c68df5c   97c  6b1400df       cmp w6, w20
0x20d29c68df60   980  540000a9       b.ls #+0x14 (addr 0x20d29c68df74)
0x20d29c68df64   984  6b14013f       cmp w9, w20
0x20d29c68df68   988  54000069       b.ls #+0xc (addr 0x20d29c68df74)
0x20d29c68df6c   98c  6b0d029f       cmp w20, w13
0x20d29c68df70   990  540003e3       b.lo #+0x7c (addr 0x20d29c68dfec)
0x20d29c68df74   994  510011ce       sub w14, w14, #0x4 (4)
0x20d29c68df78   998  3400106e       cbz w14, #+0x20c (addr 0x20d29c68e184)
0x20d29c68df7c   99c  110032b4       add w20, w21, #0xc (12)
0x20d29c68df80   9a0  b8606a60       ldr w0, [x19, x0]
0x20d29c68df84   9a4  6b01001f       cmp w0, w1
0x20d29c68df88   9a8  540000e0       b.eq #+0x1c (addr 0x20d29c68dfa4)
0x20d29c68df8c   9ac  6b0000df       cmp w6, w0
0x20d29c68df90   9b0  540000a9       b.ls #+0x14 (addr 0x20d29c68dfa4)
0x20d29c68df94   9b4  6b00013f       cmp w9, w0
0x20d29c68df98   9b8  54000069       b.ls #+0xc (addr 0x20d29c68dfa4)
0x20d29c68df9c   9bc  6b0d001f       cmp w0, w13
0x20d29c68dfa0   9c0  54000303       b.lo #+0x60 (addr 0x20d29c68e000)
0x20d29c68dfa4   9c4  510011ce       sub w14, w14, #0x4 (4)
0x20d29c68dfa8   9c8  34000eae       cbz w14, #+0x1d4 (addr 0x20d29c68e17c)
0x20d29c68dfac   9cc  f8520340       ldur x0, [x26, #-224]
0x20d29c68dfb0   9d0  eb2063ff       cmp sp, x0
0x20d29c68dfb4   9d4  540044e9       b.ls #+0x89c (addr 0x20d29c68e850)
0x20d29c68dfb8   9d8  110042b5       add w21, w21, #0x10 (16)
0x20d29c68dfbc   9dc  b8746a60       ldr w0, [x19, x20]
0x20d29c68dfc0   9e0  6b01001f       cmp w0, w1
0x20d29c68dfc4   9e4  540000e0       b.eq #+0x1c (addr 0x20d29c68dfe0)
0x20d29c68dfc8   9e8  6b0000df       cmp w6, w0
0x20d29c68dfcc   9ec  540000a9       b.ls #+0x14 (addr 0x20d29c68dfe0)
0x20d29c68dfd0   9f0  6b00013f       cmp w9, w0
0x20d29c68dfd4   9f4  54000069       b.ls #+0xc (addr 0x20d29c68dfe0)
0x20d29c68dfd8   9f8  6b0d001f       cmp w0, w13
0x20d29c68dfdc   9fc  54000103       b.lo #+0x20 (addr 0x20d29c68dffc)
0x20d29c68dfe0   a00  510011ce       sub w14, w14, #0x4 (4)
0x20d29c68dfe4   a04  35fff9ce       cbnz w14, #-0xc8 (addr 0x20d29c68df1c)
0x20d29c68dfe8   a08  14000065       b #+0x194 (addr 0x20d29c68e17c)
0x20d29c68dfec   a0c  aa0003f0       mov x16, x0
0x20d29c68dff0   a10  aa1403e0       mov x0, x20
0x20d29c68dff4   a14  aa1003f4       mov x20, x16
0x20d29c68dff8   a18  14000002       b #+0x8 (addr 0x20d29c68e000)
0x20d29c68dffc   a1c  aa1503f4       mov x20, x21
0x20d29c68e000   a20  531e7400       lsl w0, w0, #2
0x20d29c68e004   a24  0b00006e       add w14, w3, w0
0x20d29c68e008   a28  bc6e6a75       ldr s21, [x19, x14]
0x20d29c68e00c   a2c  1e353976       fsub s22, s11, s21
0x20d29c68e010   a30  1e360ad7       fmul s23, s22, s22
0x20d29c68e014   a34  0b00038e       add w14, w28, w0
0x20d29c68e018   a38  bc6e6a78       ldr s24, [x19, x14]
0x20d29c68e01c   a3c  1e383999       fsub s25, s12, s24
0x20d29c68e020   a40  1e390b3a       fmul s26, s25, s25
0x20d29c68e024   a44  1e3a2af7       fadd s23, s23, s26
0x20d29c68e028   a48  1e2722e0       fcmp s23, s7
0x20d29c68e02c   a4c  54000283       b.lo #+0x50 (addr 0x20d29c68e07c)
0x20d29c68e030   a50  1e2622e0       fcmp s23, s6
0x20d29c68e034   a54  540002c2       b.hs #+0x58 (addr 0x20d29c68e08c)
0x20d29c68e038   a58  1e2022e8       fcmp s23, #0.0
0x20d29c68e03c   a5c  5400028d       b.le #+0x50 (addr 0x20d29c68e08c)
0x20d29c68e040   a60  0b00032b       add w11, w25, w0
0x20d29c68e044   a64  bc6b6a76       ldr s22, [x19, x11]
0x20d29c68e048   a68  0b00036b       add w11, w27, w0
0x20d29c68e04c   a6c  bc6b6a77       ldr s23, [x19, x11]
0x20d29c68e050   a70  1e2a2a52       fadd s18, s18, s10
0x20d29c68e054   a74  bc2f6a72       str s18, [x19, x15]
0x20d29c68e058   a78  1e372a31       fadd s17, s17, s23
0x20d29c68e05c   a7c  bc226a71       str s17, [x19, x2]
0x20d29c68e060   a80  1e362a10       fadd s16, s16, s22
0x20d29c68e064   a84  bc366a70       str s16, [x19, x22]
0x20d29c68e068   a88  1e3829ce       fadd s14, s14, s24
0x20d29c68e06c   a8c  bc376a6e       str s14, [x19, x23]
0x20d29c68e070   a90  1e3529ad       fadd s13, s13, s21
0x20d29c68e074   a94  bc386a6d       str s13, [x19, x24]
0x20d29c68e078   a98  14000005       b #+0x14 (addr 0x20d29c68e08c)
0x20d29c68e07c   a9c  1e392a94       fadd s20, s20, s25
0x20d29c68e080   aa0  bc276a74       str s20, [x19, x7]
0x20d29c68e084   aa4  1e362a73       fadd s19, s19, s22
0x20d29c68e088   aa8  bc2b6a73       str s19, [x19, x11]
0x20d29c68e08c   aac  6b05029f       cmp w20, w5
0x20d29c68e090   ab0  54000ac0       b.eq #+0x158 (addr 0x20d29c68e1e8)
0x20d29c68e094   ab4  aa0f03eb       mov x11, x15
0x20d29c68e098   ab8  aa1803ef       mov x15, x24
0x20d29c68e09c   abc  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e0a0   ac0  d2800020       movz x0, #0x1
0x20d29c68e0a4   ac4  aa1403e2       mov x2, x20
0x20d29c68e0a8   ac8  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e0ac   acc  f94077f5       ldr x21, [sp, #232]
0x20d29c68e0b0   ad0  f94057f6       ldr x22, [sp, #168]
0x20d29c68e0b4   ad4  f94053f7       ldr x23, [sp, #160]
0x20d29c68e0b8   ad8  f9404fee       ldr x14, [sp, #152]
0x20d29c68e0bc   adc  f9404bec       ldr x12, [sp, #144]
0x20d29c68e0c0   ae0  d2800010       movz x16, #0x0
0x20d29c68e0c4   ae4  f9008bf0       str x16, [sp, #272]
0x20d29c68e0c8   ae8  17fffeb8       b #-0x520 (addr 0x20d29c68dba8)
0x20d29c68e0cc   aec  531e756b       lsl w11, w11, #2
0x20d29c68e0d0   af0  0b0b0066       add w6, w3, w11
0x20d29c68e0d4   af4  bc666a75       ldr s21, [x19, x6]
0x20d29c68e0d8   af8  1e353976       fsub s22, s11, s21
0x20d29c68e0dc   afc  1e360ad7       fmul s23, s22, s22
0x20d29c68e0e0   b00  0b0b0386       add w6, w28, w11
0x20d29c68e0e4   b04  bc666a78       ldr s24, [x19, x6]
0x20d29c68e0e8   b08  1e383999       fsub s25, s12, s24
0x20d29c68e0ec   b0c  1e390b3a       fmul s26, s25, s25
0x20d29c68e0f0   b10  1e3a2af7       fadd s23, s23, s26
0x20d29c68e0f4   b14  f940c7e1       ldr x1, [sp, #392]
0x20d29c68e0f8   b18  f940c3e0       ldr x0, [sp, #384]
0x20d29c68e0fc   b1c  1e2722e0       fcmp s23, s7
0x20d29c68e100   b20  540002e3       b.lo #+0x5c (addr 0x20d29c68e15c)
0x20d29c68e104   b24  1e2622e0       fcmp s23, s6
0x20d29c68e108   b28  54ffd2c2       b.hs #-0x5a8 (addr 0x20d29c68db60)
0x20d29c68e10c   b2c  1e2022e8       fcmp s23, #0.0
0x20d29c68e110   b30  54ffd28d       b.le #-0x5b0 (addr 0x20d29c68db60)
0x20d29c68e114   b34  0b0b0326       add w6, w25, w11
0x20d29c68e118   b38  bc666a76       ldr s22, [x19, x6]
0x20d29c68e11c   b3c  0b0b0366       add w6, w27, w11
0x20d29c68e120   b40  bc666a77       ldr s23, [x19, x6]
0x20d29c68e124   b44  1e2a2a52       fadd s18, s18, s10
0x20d29c68e128   b48  bc206a72       str s18, [x19, x0]
0x20d29c68e12c   b4c  1e372a31       fadd s17, s17, s23
0x20d29c68e130   b50  9100f106       add x6, x8, #0x3c (60)
0x20d29c68e134   b54  bc266a71       str s17, [x19, x6]
0x20d29c68e138   b58  1e362a10       fadd s16, s16, s22
0x20d29c68e13c   b5c  9100e106       add x6, x8, #0x38 (56)
0x20d29c68e140   b60  bc266a70       str s16, [x19, x6]
0x20d29c68e144   b64  1e3829ce       fadd s14, s14, s24
0x20d29c68e148   b68  9100d106       add x6, x8, #0x34 (52)
0x20d29c68e14c   b6c  bc266a6e       str s14, [x19, x6]
0x20d29c68e150   b70  1e3529ad       fadd s13, s13, s21
0x20d29c68e154   b74  bc216a6d       str s13, [x19, x1]
0x20d29c68e158   b78  17fffe82       b #-0x5f8 (addr 0x20d29c68db60)
0x20d29c68e15c   b7c  1e392a94       fadd s20, s20, s25
0x20d29c68e160   b80  bc276a74       str s20, [x19, x7]
0x20d29c68e164   b84  1e362a73       fadd s19, s19, s22
0x20d29c68e168   b88  91011106       add x6, x8, #0x44 (68)
0x20d29c68e16c   b8c  bc266a73       str s19, [x19, x6]
0x20d29c68e170   b90  17fffe7c       b #-0x610 (addr 0x20d29c68db60)
0x20d29c68e174   b94  f9408be0       ldr x0, [sp, #272]
0x20d29c68e178   b98  1400001c       b #+0x70 (addr 0x20d29c68e1e8)
0x20d29c68e17c   b9c  aa0003f4       mov x20, x0
0x20d29c68e180   ba0  14000002       b #+0x8 (addr 0x20d29c68e188)
0x20d29c68e184   ba4  f9407bea       ldr x10, [sp, #240]
0x20d29c68e188   ba8  aa1403e0       mov x0, x20
0x20d29c68e18c   bac  14000017       b #+0x5c (addr 0x20d29c68e1e8)
0x20d29c68e190   bb0  aa0503e0       mov x0, x5
0x20d29c68e194   bb4  f940efe5       ldr x5, [sp, #472]
0x20d29c68e198   bb8  aa0503ea       mov x10, x5
0x20d29c68e19c   bbc  14000013       b #+0x4c (addr 0x20d29c68e1e8)
0x20d29c68e1a0   bc0  aa0503e0       mov x0, x5
0x20d29c68e1a4   bc4  f940efe5       ldr x5, [sp, #472]
0x20d29c68e1a8   bc8  14000010       b #+0x40 (addr 0x20d29c68e1e8)
0x20d29c68e1ac   bcc  aa0003eb       mov x11, x0
0x20d29c68e1b0   bd0  bc276a74       str s20, [x19, x7]
0x20d29c68e1b4   bd4  9101110c       add x12, x8, #0x44 (68)
0x20d29c68e1b8   bd8  bc2c6a73       str s19, [x19, x12]
0x20d29c68e1bc   bdc  f940c3ea       ldr x10, [sp, #384]
0x20d29c68e1c0   be0  bc2a6a72       str s18, [x19, x10]
0x20d29c68e1c4   be4  9100f10a       add x10, x8, #0x3c (60)
0x20d29c68e1c8   be8  bc2a6a71       str s17, [x19, x10]
0x20d29c68e1cc   bec  9100e10a       add x10, x8, #0x38 (56)
0x20d29c68e1d0   bf0  bc2a6a70       str s16, [x19, x10]
0x20d29c68e1d4   bf4  9100d10a       add x10, x8, #0x34 (52)
0x20d29c68e1d8   bf8  bc2a6a6e       str s14, [x19, x10]
0x20d29c68e1dc   bfc  f940c7ec       ldr x12, [sp, #392]
0x20d29c68e1e0   c00  bc2c6a6d       str s13, [x19, x12]
0x20d29c68e1e4   c04  aa0b03e0       mov x0, x11
0x20d29c68e1e8   c08  1100410a       add w10, w8, #0x10 (16)
0x20d29c68e1ec   c0c  1100810b       add w11, w8, #0x20 (32)
0x20d29c68e1f0   c10  1100c10c       add w12, w8, #0x30 (48)
0x20d29c68e1f4   c14  f9005ff3       str x19, [sp, #184]
0x20d29c68e1f8   c18  f900efe5       str x5, [sp, #472]
0x20d29c68e1fc   c1c  f9008be0       str x0, [sp, #272]
0x20d29c68e200   c20  f94103e7       ldr x7, [sp, #512]
0x20d29c68e204   c24  aa0a03e0       mov x0, x10
0x20d29c68e208   c28  f940d3e2       ldr x2, [sp, #416]
0x20d29c68e20c   c2c  fd40cfe0       ldr d0, [sp, #408]
0x20d29c68e210   c30  fd40cbe1       ldr d1, [sp, #400]
0x20d29c68e214   c34  aa0b03e3       mov x3, x11
0x20d29c68e218   c38  aa0803e4       mov x4, x8
0x20d29c68e21c   c3c  aa0c03e5       mov x5, x12
0x20d29c68e220   c40  97fbdd21       bl #-0x108b7c (addr 0x20d29c5856a4)
0x20d29c68e224   c44  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e228   c48  f940d7e6       ldr x6, [sp, #424]
0x20d29c68e22c   c4c  6b0100df       cmp w6, w1
0x20d29c68e230   c50  54000329       b.ls #+0x64 (addr 0x20d29c68e294)
0x20d29c68e234   c54  f940e7e8       ldr x8, [sp, #456]
0x20d29c68e238   c58  f940dbe9       ldr x9, [sp, #432]
0x20d29c68e23c   c5c  0b08012a       add w10, w9, w8
0x20d29c68e240   c60  f940fbeb       ldr x11, [sp, #496]
0x20d29c68e244   c64  9100416c       add x12, x11, #0x10 (16)
0x20d29c68e248   c68  f9405fed       ldr x13, [sp, #184]
0x20d29c68e24c   c6c  bc6c69a2       ldr s2, [x13, x12]
0x20d29c68e250   c70  bc2a69a2       str s2, [x13, x10]
0x20d29c68e254   c74  f940dfea       ldr x10, [sp, #440]
0x20d29c68e258   c78  0b08014c       add w12, w10, w8
0x20d29c68e25c   c7c  9100516e       add x14, x11, #0x14 (20)
0x20d29c68e260   c80  bc6e69a2       ldr s2, [x13, x14]
0x20d29c68e264   c84  bc2c69a2       str s2, [x13, x12]
0x20d29c68e268   c88  f940e3ec       ldr x12, [sp, #448]
0x20d29c68e26c   c8c  0b08018e       add w14, w12, w8
0x20d29c68e270   c90  9100616f       add x15, x11, #0x18 (24)
0x20d29c68e274   c94  bc6f69a2       ldr s2, [x13, x15]
0x20d29c68e278   c98  bc2e69a2       str s2, [x13, x14]
0x20d29c68e27c   c9c  f940ebee       ldr x14, [sp, #464]
0x20d29c68e280   ca0  0b0801c8       add w8, w14, w8
0x20d29c68e284   ca4  9100716f       add x15, x11, #0x1c (28)
0x20d29c68e288   ca8  bc6f69a2       ldr s2, [x13, x15]
0x20d29c68e28c   cac  bc2869a2       str s2, [x13, x8]
0x20d29c68e290   cb0  14000006       b #+0x18 (addr 0x20d29c68e2a8)
0x20d29c68e294   cb4  f9405fed       ldr x13, [sp, #184]
0x20d29c68e298   cb8  14000004       b #+0x10 (addr 0x20d29c68e2a8)
0x20d29c68e29c   cbc  f940d7e6       ldr x6, [sp, #424]
0x20d29c68e2a0   cc0  f9008be0       str x0, [sp, #272]
0x20d29c68e2a4   cc4  aa0403ed       mov x13, x4
0x20d29c68e2a8   cc8  11000421       add w1, w1, #0x1 (1)
0x20d29c68e2ac   ccc  f940f7e8       ldr x8, [sp, #488]
0x20d29c68e2b0   cd0  6b08003f       cmp w1, w8
0x20d29c68e2b4   cd4  54ffb481       b.ne #-0x970 (addr 0x20d29c68d944)
0x20d29c68e2b8   cd8  f940fbe1       ldr x1, [sp, #496]
0x20d29c68e2bc   cdc  11014021       add w1, w1, #0x50 (80)
0x20d29c68e2c0   ce0  f940ffe6       ldr x6, [sp, #504]
0x20d29c68e2c4   ce4  b90000c1       str w1, [x6]
0x20d29c68e2c8   ce8  17fffd3d       b #-0xb0c (addr 0x20d29c68d7bc)
0x20d29c68e2cc   cec  97fbde41       bl #-0x1086fc (addr 0x20d29c585bd0)
0x20d29c68e2d0   cf0  f94103e7       ldr x7, [sp, #512]
0x20d29c68e2d4   cf4  f9408be0       ldr x0, [sp, #272]
0x20d29c68e2d8   cf8  f9405fe1       ldr x1, [sp, #184]
0x20d29c68e2dc   cfc  17fffccc       b #-0xcd0 (addr 0x20d29c68d60c)
0x20d29c68e2e0   d00  1e6520a0       fcmp d5, d5
0x20d29c68e2e4   d04  54000080       b.eq #+0x10 (addr 0x20d29c68e2f4)
0x20d29c68e2e8   d08  d280000c       movz x12, #0x0
0x20d29c68e2ec   d0c  aa0c03eb       mov x11, x12
0x20d29c68e2f0   d10  17fffcfb       b #-0xc14 (addr 0x20d29c68d6dc)
0x20d29c68e2f4   d14  1e202068       fcmp s3, #0.0
0x20d29c68e2f8   d18  54000063       b.lo #+0xc (addr 0x20d29c68e304)
0x20d29c68e2fc   d1c  9280000b       movn x11, #0x0
0x20d29c68e300   d20  17fffcf7       b #-0xc24 (addr 0x20d29c68d6dc)
0x20d29c68e304   d24  d280000b       movz x11, #0x0
0x20d29c68e308   d28  17fffcf5       b #-0xc2c (addr 0x20d29c68d6dc)
0x20d29c68e30c   d2c  1e6620c0       fcmp d6, d6
0x20d29c68e310   d30  54000060       b.eq #+0xc (addr 0x20d29c68e31c)
0x20d29c68e314   d34  d280000b       movz x11, #0x0
0x20d29c68e318   d38  17fffcf9       b #-0xc1c (addr 0x20d29c68d6fc)
0x20d29c68e31c   d3c  1e2020a8       fcmp s5, #0.0
0x20d29c68e320   d40  54ffffa3       b.lo #-0xc (addr 0x20d29c68e314)
0x20d29c68e324   d44  9280000b       movn x11, #0x0
0x20d29c68e328   d48  17fffcf5       b #-0xc2c (addr 0x20d29c68d6fc)
0x20d29c68e32c   d4c  f9008be0       str x0, [sp, #272]
0x20d29c68e330   d50  f900f3e1       str x1, [sp, #480]
0x20d29c68e334   d54  f9005fe4       str x4, [sp, #184]
0x20d29c68e338   d58  97fbde26       bl #-0x108768 (addr 0x20d29c585bd0)
0x20d29c68e33c   d5c  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e340   d60  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e344   d64  f9408be0       ldr x0, [sp, #272]
0x20d29c68e348   d68  f9405fe4       ldr x4, [sp, #184]
0x20d29c68e34c   d6c  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e350   d70  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e354   d74  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e358   d78  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e35c   d7c  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e360   d80  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e364   d84  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e368   d88  f94087ed       ldr x13, [sp, #264]
0x20d29c68e36c   d8c  f94083e9       ldr x9, [sp, #256]
0x20d29c68e370   d90  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e374   d94  f94077f5       ldr x21, [sp, #232]
0x20d29c68e378   d98  f94057f6       ldr x22, [sp, #168]
0x20d29c68e37c   d9c  f94053f7       ldr x23, [sp, #160]
0x20d29c68e380   da0  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e384   da4  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e388   da8  3dc003e2       ldr q2, [sp]
0x20d29c68e38c   dac  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e390   db0  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e394   db4  fd405be5       ldr d5, [sp, #176]
0x20d29c68e398   db8  f9401beb       ldr x11, [sp, #48]
0x20d29c68e39c   dbc  17fffd84       b #-0x9f0 (addr 0x20d29c68d9ac)
0x20d29c68e3a0   dc0  1e722240       fcmp d18, d18
0x20d29c68e3a4   dc4  54000060       b.eq #+0xc (addr 0x20d29c68e3b0)
0x20d29c68e3a8   dc8  d2800000       movz x0, #0x0
0x20d29c68e3ac   dcc  17fffdba       b #-0x918 (addr 0x20d29c68da94)
0x20d29c68e3b0   dd0  1e2021a8       fcmp s13, #0.0
0x20d29c68e3b4   dd4  54ffffa3       b.lo #-0xc (addr 0x20d29c68e3a8)
0x20d29c68e3b8   dd8  92800000       movn x0, #0x0
0x20d29c68e3bc   ddc  17fffdb6       b #-0x928 (addr 0x20d29c68da94)
0x20d29c68e3c0   de0  1e712220       fcmp d17, d17
0x20d29c68e3c4   de4  54000060       b.eq #+0xc (addr 0x20d29c68e3d0)
0x20d29c68e3c8   de8  d2800000       movz x0, #0x0
0x20d29c68e3cc   dec  17fffdba       b #-0x918 (addr 0x20d29c68dab4)
0x20d29c68e3d0   df0  1e202208       fcmp s16, #0.0
0x20d29c68e3d4   df4  54ffffa3       b.lo #-0xc (addr 0x20d29c68e3c8)
0x20d29c68e3d8   df8  92800000       movn x0, #0x0
0x20d29c68e3dc   dfc  17fffdb6       b #-0x928 (addr 0x20d29c68dab4)
0x20d29c68e3e0   e00  f900bfe7       str x7, [sp, #376]
0x20d29c68e3e4   e04  fd00abec       str d12, [sp, #336]
0x20d29c68e3e8   e08  fd00a3eb       str d11, [sp, #320]
0x20d29c68e3ec   e0c  f90067e4       str x4, [sp, #200]
0x20d29c68e3f0   e10  f900efe5       str x5, [sp, #472]
0x20d29c68e3f4   e14  fd003bed       str d13, [sp, #112]
0x20d29c68e3f8   e18  fd0037ee       str d14, [sp, #104]
0x20d29c68e3fc   e1c  fd0033f0       str d16, [sp, #96]
0x20d29c68e400   e20  fd002ff1       str d17, [sp, #88]
0x20d29c68e404   e24  fd002bf2       str d18, [sp, #80]
0x20d29c68e408   e28  fd0027f3       str d19, [sp, #72]
0x20d29c68e40c   e2c  fd0023f4       str d20, [sp, #64]
0x20d29c68e410   e30  f90097e2       str x2, [sp, #296]
0x20d29c68e414   e34  f9005ff3       str x19, [sp, #184]
0x20d29c68e418   e38  97fbddee       bl #-0x108848 (addr 0x20d29c585bd0)
0x20d29c68e41c   e3c  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e420   e40  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e424   e44  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e428   e48  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e42c   e4c  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e430   e50  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e434   e54  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e438   e58  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e43c   e5c  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e440   e60  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e444   e64  fd40abec       ldr d12, [sp, #336]
0x20d29c68e448   e68  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e44c   e6c  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e450   e70  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e454   e74  f94087ed       ldr x13, [sp, #264]
0x20d29c68e458   e78  f94083e9       ldr x9, [sp, #256]
0x20d29c68e45c   e7c  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e460   e80  f94077f5       ldr x21, [sp, #232]
0x20d29c68e464   e84  f94067e4       ldr x4, [sp, #200]
0x20d29c68e468   e88  f94057f6       ldr x22, [sp, #168]
0x20d29c68e46c   e8c  f94053f7       ldr x23, [sp, #160]
0x20d29c68e470   e90  f9404fee       ldr x14, [sp, #152]
0x20d29c68e474   e94  f9404bec       ldr x12, [sp, #144]
0x20d29c68e478   e98  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e47c   e9c  f940efe5       ldr x5, [sp, #472]
0x20d29c68e480   ea0  fd403bed       ldr d13, [sp, #112]
0x20d29c68e484   ea4  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e488   ea8  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e48c   eac  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e490   eb0  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e494   eb4  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e498   eb8  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e49c   ebc  f94097e2       ldr x2, [sp, #296]
0x20d29c68e4a0   ec0  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e4a4   ec4  3dc003e2       ldr q2, [sp]
0x20d29c68e4a8   ec8  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e4ac   ecc  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e4b0   ed0  fd405be5       ldr d5, [sp, #176]
0x20d29c68e4b4   ed4  17fffdb3       b #-0x934 (addr 0x20d29c68db80)
0x20d29c68e4b8   ed8  f900efe5       str x5, [sp, #472]
0x20d29c68e4bc   edc  f9008be0       str x0, [sp, #272]
0x20d29c68e4c0   ee0  f900bfe7       str x7, [sp, #376]
0x20d29c68e4c4   ee4  fd003bed       str d13, [sp, #112]
0x20d29c68e4c8   ee8  fd0037ee       str d14, [sp, #104]
0x20d29c68e4cc   eec  fd0033f0       str d16, [sp, #96]
0x20d29c68e4d0   ef0  fd002ff1       str d17, [sp, #88]
0x20d29c68e4d4   ef4  fd002bf2       str d18, [sp, #80]
0x20d29c68e4d8   ef8  fd0027f3       str d19, [sp, #72]
0x20d29c68e4dc   efc  fd0023f4       str d20, [sp, #64]
0x20d29c68e4e0   f00  fd00abec       str d12, [sp, #336]
0x20d29c68e4e4   f04  fd00a3eb       str d11, [sp, #320]
0x20d29c68e4e8   f08  f9001fe2       str x2, [sp, #56]
0x20d29c68e4ec   f0c  f9009bef       str x15, [sp, #304]
0x20d29c68e4f0   f10  f90067e4       str x4, [sp, #200]
0x20d29c68e4f4   f14  f90097eb       str x11, [sp, #296]
0x20d29c68e4f8   f18  f9005ff3       str x19, [sp, #184]
0x20d29c68e4fc   f1c  97fbddb5       bl #-0x10892c (addr 0x20d29c585bd0)
0x20d29c68e500   f20  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e504   f24  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e508   f28  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e50c   f2c  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e510   f30  f940efe5       ldr x5, [sp, #472]
0x20d29c68e514   f34  f9408be0       ldr x0, [sp, #272]
0x20d29c68e518   f38  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e51c   f3c  fd403bed       ldr d13, [sp, #112]
0x20d29c68e520   f40  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e524   f44  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e528   f48  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e52c   f4c  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e530   f50  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e534   f54  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e538   f58  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e53c   f5c  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e540   f60  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e544   f64  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e548   f68  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e54c   f6c  fd40abec       ldr d12, [sp, #336]
0x20d29c68e550   f70  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e554   f74  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e558   f78  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e55c   f7c  f9401fe2       ldr x2, [sp, #56]
0x20d29c68e560   f80  f9409bef       ldr x15, [sp, #304]
0x20d29c68e564   f84  f94087ed       ldr x13, [sp, #264]
0x20d29c68e568   f88  f94083e9       ldr x9, [sp, #256]
0x20d29c68e56c   f8c  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e570   f90  f94077f5       ldr x21, [sp, #232]
0x20d29c68e574   f94  f94067e4       ldr x4, [sp, #200]
0x20d29c68e578   f98  f94057f6       ldr x22, [sp, #168]
0x20d29c68e57c   f9c  f94053f7       ldr x23, [sp, #160]
0x20d29c68e580   fa0  f9404fee       ldr x14, [sp, #152]
0x20d29c68e584   fa4  f9404bec       ldr x12, [sp, #144]
0x20d29c68e588   fa8  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e58c   fac  f94097eb       ldr x11, [sp, #296]
0x20d29c68e590   fb0  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e594   fb4  3dc003e2       ldr q2, [sp]
0x20d29c68e598   fb8  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e59c   fbc  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e5a0   fc0  fd405be5       ldr d5, [sp, #176]
0x20d29c68e5a4   fc4  17fffd88       b #-0x9e0 (addr 0x20d29c68dbc4)
0x20d29c68e5a8   fc8  f900bfe7       str x7, [sp, #376]
0x20d29c68e5ac   fcc  fd00abec       str d12, [sp, #336]
0x20d29c68e5b0   fd0  fd00a3eb       str d11, [sp, #320]
0x20d29c68e5b4   fd4  fd003bed       str d13, [sp, #112]
0x20d29c68e5b8   fd8  fd0037ee       str d14, [sp, #104]
0x20d29c68e5bc   fdc  fd0033f0       str d16, [sp, #96]
0x20d29c68e5c0   fe0  fd002ff1       str d17, [sp, #88]
0x20d29c68e5c4   fe4  fd002bf2       str d18, [sp, #80]
0x20d29c68e5c8   fe8  fd0027f3       str d19, [sp, #72]
0x20d29c68e5cc   fec  fd0023f4       str d20, [sp, #64]
0x20d29c68e5d0   ff0  f900efe5       str x5, [sp, #472]
0x20d29c68e5d4   ff4  f90067e4       str x4, [sp, #200]
0x20d29c68e5d8   ff8  f9001fe2       str x2, [sp, #56]
0x20d29c68e5dc   ffc  f9008be0       str x0, [sp, #272]
0x20d29c68e5e0  1000  f9005ff3       str x19, [sp, #184]
0x20d29c68e5e4  1004  97fbdd7b       bl #-0x108a14 (addr 0x20d29c585bd0)
0x20d29c68e5e8  1008  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e5ec  100c  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e5f0  1010  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e5f4  1014  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e5f8  1018  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e5fc  101c  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e600  1020  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e604  1024  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e608  1028  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e60c  102c  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e610  1030  fd40abec       ldr d12, [sp, #336]
0x20d29c68e614  1034  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e618  1038  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e61c  103c  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e620  1040  fd403bed       ldr d13, [sp, #112]
0x20d29c68e624  1044  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e628  1048  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e62c  104c  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e630  1050  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e634  1054  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e638  1058  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e63c  105c  f94087ed       ldr x13, [sp, #264]
0x20d29c68e640  1060  f94083e9       ldr x9, [sp, #256]
0x20d29c68e644  1064  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e648  1068  f94077f5       ldr x21, [sp, #232]
0x20d29c68e64c  106c  f940efe5       ldr x5, [sp, #472]
0x20d29c68e650  1070  f94067e4       ldr x4, [sp, #200]
0x20d29c68e654  1074  f9401fe2       ldr x2, [sp, #56]
0x20d29c68e658  1078  f9408be0       ldr x0, [sp, #272]
0x20d29c68e65c  107c  f94057f6       ldr x22, [sp, #168]
0x20d29c68e660  1080  f94053f7       ldr x23, [sp, #160]
0x20d29c68e664  1084  f9404fee       ldr x14, [sp, #152]
0x20d29c68e668  1088  f9404bec       ldr x12, [sp, #144]
0x20d29c68e66c  108c  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e670  1090  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e674  1094  3dc003e2       ldr q2, [sp]
0x20d29c68e678  1098  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e67c  109c  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e680  10a0  fd405be5       ldr d5, [sp, #176]
0x20d29c68e684  10a4  17fffd78       b #-0xa20 (addr 0x20d29c68dc64)
0x20d29c68e688  10a8  f900bfe7       str x7, [sp, #376]
0x20d29c68e68c  10ac  fd00abec       str d12, [sp, #336]
0x20d29c68e690  10b0  fd00a3eb       str d11, [sp, #320]
0x20d29c68e694  10b4  fd003bed       str d13, [sp, #112]
0x20d29c68e698  10b8  fd0037ee       str d14, [sp, #104]
0x20d29c68e69c  10bc  fd0033f0       str d16, [sp, #96]
0x20d29c68e6a0  10c0  fd002ff1       str d17, [sp, #88]
0x20d29c68e6a4  10c4  fd002bf2       str d18, [sp, #80]
0x20d29c68e6a8  10c8  fd0027f3       str d19, [sp, #72]
0x20d29c68e6ac  10cc  fd0023f4       str d20, [sp, #64]
0x20d29c68e6b0  10d0  f90067e4       str x4, [sp, #200]
0x20d29c68e6b4  10d4  f900efe5       str x5, [sp, #472]
0x20d29c68e6b8  10d8  f9009be2       str x2, [sp, #304]
0x20d29c68e6bc  10dc  f9005ff3       str x19, [sp, #184]
0x20d29c68e6c0  10e0  97fbdd44       bl #-0x108af0 (addr 0x20d29c585bd0)
0x20d29c68e6c4  10e4  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e6c8  10e8  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e6cc  10ec  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e6d0  10f0  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e6d4  10f4  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e6d8  10f8  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e6dc  10fc  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e6e0  1100  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e6e4  1104  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e6e8  1108  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e6ec  110c  fd40abec       ldr d12, [sp, #336]
0x20d29c68e6f0  1110  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e6f4  1114  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e6f8  1118  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e6fc  111c  fd403bed       ldr d13, [sp, #112]
0x20d29c68e700  1120  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e704  1124  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e708  1128  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e70c  112c  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e710  1130  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e714  1134  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e718  1138  f94087ed       ldr x13, [sp, #264]
0x20d29c68e71c  113c  f94083e9       ldr x9, [sp, #256]
0x20d29c68e720  1140  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e724  1144  f94077f5       ldr x21, [sp, #232]
0x20d29c68e728  1148  f94067e4       ldr x4, [sp, #200]
0x20d29c68e72c  114c  f940efe5       ldr x5, [sp, #472]
0x20d29c68e730  1150  f94057f6       ldr x22, [sp, #168]
0x20d29c68e734  1154  f94053f7       ldr x23, [sp, #160]
0x20d29c68e738  1158  f9404fee       ldr x14, [sp, #152]
0x20d29c68e73c  115c  f9404bec       ldr x12, [sp, #144]
0x20d29c68e740  1160  f9409be2       ldr x2, [sp, #304]
0x20d29c68e744  1164  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e748  1168  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e74c  116c  3dc003e2       ldr q2, [sp]
0x20d29c68e750  1170  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e754  1174  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e758  1178  fd405be5       ldr d5, [sp, #176]
0x20d29c68e75c  117c  17fffd49       b #-0xadc (addr 0x20d29c68dc80)
0x20d29c68e760  1180  f900bfe7       str x7, [sp, #376]
0x20d29c68e764  1184  f900efe5       str x5, [sp, #472]
0x20d29c68e768  1188  fd00abec       str d12, [sp, #336]
0x20d29c68e76c  118c  fd00a3eb       str d11, [sp, #320]
0x20d29c68e770  1190  f9001fea       str x10, [sp, #56]
0x20d29c68e774  1194  fd003bed       str d13, [sp, #112]
0x20d29c68e778  1198  fd0037ee       str d14, [sp, #104]
0x20d29c68e77c  119c  fd0033f0       str d16, [sp, #96]
0x20d29c68e780  11a0  fd002ff1       str d17, [sp, #88]
0x20d29c68e784  11a4  fd002bf2       str d18, [sp, #80]
0x20d29c68e788  11a8  fd0027f3       str d19, [sp, #72]
0x20d29c68e78c  11ac  fd0023f4       str d20, [sp, #64]
0x20d29c68e790  11b0  f90067e4       str x4, [sp, #200]
0x20d29c68e794  11b4  f90063e0       str x0, [sp, #192]
0x20d29c68e798  11b8  f9009beb       str x11, [sp, #304]
0x20d29c68e79c  11bc  f90097ef       str x15, [sp, #296]
0x20d29c68e7a0  11c0  f9005ff3       str x19, [sp, #184]
0x20d29c68e7a4  11c4  97fbdd0b       bl #-0x108bd4 (addr 0x20d29c585bd0)
0x20d29c68e7a8  11c8  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e7ac  11cc  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e7b0  11d0  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e7b4  11d4  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e7b8  11d8  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e7bc  11dc  f940efe5       ldr x5, [sp, #472]
0x20d29c68e7c0  11e0  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e7c4  11e4  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e7c8  11e8  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e7cc  11ec  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e7d0  11f0  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e7d4  11f4  fd40abec       ldr d12, [sp, #336]
0x20d29c68e7d8  11f8  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e7dc  11fc  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e7e0  1200  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e7e4  1204  f9401fea       ldr x10, [sp, #56]
0x20d29c68e7e8  1208  fd403bed       ldr d13, [sp, #112]
0x20d29c68e7ec  120c  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e7f0  1210  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e7f4  1214  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e7f8  1218  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e7fc  121c  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e800  1220  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e804  1224  f94087ed       ldr x13, [sp, #264]
0x20d29c68e808  1228  f94083e9       ldr x9, [sp, #256]
0x20d29c68e80c  122c  f9407bf4       ldr x20, [sp, #240]
0x20d29c68e810  1230  f94077f5       ldr x21, [sp, #232]
0x20d29c68e814  1234  f94067e4       ldr x4, [sp, #200]
0x20d29c68e818  1238  f94063e0       ldr x0, [sp, #192]
0x20d29c68e81c  123c  f9409beb       ldr x11, [sp, #304]
0x20d29c68e820  1240  f94097ef       ldr x15, [sp, #296]
0x20d29c68e824  1244  f94057f6       ldr x22, [sp, #168]
0x20d29c68e828  1248  f94053f7       ldr x23, [sp, #160]
0x20d29c68e82c  124c  f9404fee       ldr x14, [sp, #152]
0x20d29c68e830  1250  f9404bec       ldr x12, [sp, #144]
0x20d29c68e834  1254  f9403ff8       ldr x24, [sp, #120]
0x20d29c68e838  1258  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e83c  125c  3dc003e2       ldr q2, [sp]
0x20d29c68e840  1260  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e844  1264  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e848  1268  fd405be5       ldr d5, [sp, #176]
0x20d29c68e84c  126c  17fffd4a       b #-0xad8 (addr 0x20d29c68dd74)
0x20d29c68e850  1270  f900efe5       str x5, [sp, #472]
0x20d29c68e854  1274  f900bfe7       str x7, [sp, #376]
0x20d29c68e858  1278  fd00abec       str d12, [sp, #336]
0x20d29c68e85c  127c  fd00a3eb       str d11, [sp, #320]
0x20d29c68e860  1280  f9001fea       str x10, [sp, #56]
0x20d29c68e864  1284  fd003bed       str d13, [sp, #112]
0x20d29c68e868  1288  fd0037ee       str d14, [sp, #104]
0x20d29c68e86c  128c  fd0033f0       str d16, [sp, #96]
0x20d29c68e870  1290  fd002ff1       str d17, [sp, #88]
0x20d29c68e874  1294  fd002bf2       str d18, [sp, #80]
0x20d29c68e878  1298  fd0027f3       str d19, [sp, #72]
0x20d29c68e87c  129c  fd0023f4       str d20, [sp, #64]
0x20d29c68e880  12a0  f9009beb       str x11, [sp, #304]
0x20d29c68e884  12a4  f90097f7       str x23, [sp, #296]
0x20d29c68e888  12a8  f90093f6       str x22, [sp, #288]
0x20d29c68e88c  12ac  f9008fe2       str x2, [sp, #280]
0x20d29c68e890  12b0  f90063f4       str x20, [sp, #192]
0x20d29c68e894  12b4  f9008bee       str x14, [sp, #272]
0x20d29c68e898  12b8  f9007ff5       str x21, [sp, #248]
0x20d29c68e89c  12bc  f90067e4       str x4, [sp, #200]
0x20d29c68e8a0  12c0  f9005ff3       str x19, [sp, #184]
0x20d29c68e8a4  12c4  97fbdccb       bl #-0x108cd4 (addr 0x20d29c585bd0)
0x20d29c68e8a8  12c8  f940fbe8       ldr x8, [sp, #496]
0x20d29c68e8ac  12cc  f940f7e6       ldr x6, [sp, #488]
0x20d29c68e8b0  12d0  f940f3e1       ldr x1, [sp, #480]
0x20d29c68e8b4  12d4  f9405ff3       ldr x19, [sp, #184]
0x20d29c68e8b8  12d8  f940efe5       ldr x5, [sp, #472]
0x20d29c68e8bc  12dc  f940c7f8       ldr x24, [sp, #392]
0x20d29c68e8c0  12e0  f940c3ef       ldr x15, [sp, #384]
0x20d29c68e8c4  12e4  f940bfe7       ldr x7, [sp, #376]
0x20d29c68e8c8  12e8  1e2e100a       fmov s10, #0x70 (1.0000)
0x20d29c68e8cc  12ec  f940bbfb       ldr cp, [sp, #368]
0x20d29c68e8d0  12f0  f940b7f9       ldr x25, [sp, #360]
0x20d29c68e8d4  12f4  fd40b3e6       ldr d6, [sp, #352]
0x20d29c68e8d8  12f8  fd40afe7       ldr d7, [sp, #344]
0x20d29c68e8dc  12fc  fd40abec       ldr d12, [sp, #336]
0x20d29c68e8e0  1300  f940a7fc       ldr x28, [sp, #328]
0x20d29c68e8e4  1304  fd40a3eb       ldr d11, [sp, #320]
0x20d29c68e8e8  1308  f9409fe3       ldr x3, [sp, #312]
0x20d29c68e8ec  130c  f9401fea       ldr x10, [sp, #56]
0x20d29c68e8f0  1310  fd403bed       ldr d13, [sp, #112]
0x20d29c68e8f4  1314  fd4037ee       ldr d14, [sp, #104]
0x20d29c68e8f8  1318  fd4033f0       ldr d16, [sp, #96]
0x20d29c68e8fc  131c  fd402ff1       ldr d17, [sp, #88]
0x20d29c68e900  1320  fd402bf2       ldr d18, [sp, #80]
0x20d29c68e904  1324  fd4027f3       ldr d19, [sp, #72]
0x20d29c68e908  1328  fd4023f4       ldr d20, [sp, #64]
0x20d29c68e90c  132c  f9409beb       ldr x11, [sp, #304]
0x20d29c68e910  1330  f94097f7       ldr x23, [sp, #296]
0x20d29c68e914  1334  f94093f6       ldr x22, [sp, #288]
0x20d29c68e918  1338  f9408fe2       ldr x2, [sp, #280]
0x20d29c68e91c  133c  f94063f4       ldr x20, [sp, #192]
0x20d29c68e920  1340  f9408bee       ldr x14, [sp, #272]
0x20d29c68e924  1344  f94087ed       ldr x13, [sp, #264]
0x20d29c68e928  1348  f94083e9       ldr x9, [sp, #256]
0x20d29c68e92c  134c  f9407ff5       ldr x21, [sp, #248]
0x20d29c68e930  1350  f94073ec       ldr x12, [sp, #224]
0x20d29c68e934  1354  f94067e4       ldr x4, [sp, #200]
0x20d29c68e938  1358  3dc007e4       ldr q4, [sp, #16]
0x20d29c68e93c  135c  3dc003e2       ldr q2, [sp]
0x20d29c68e940  1360  3dc023e3       ldr q3, [sp, #128]
0x20d29c68e944  1364  3dc00be8       ldr q8, [sp, #32]
0x20d29c68e948  1368  fd405be5       ldr d5, [sp, #176]
0x20d29c68e94c  136c  17fffd9b       b #-0x994 (addr 0x20d29c68dfb8)
0x20d29c68e950  1370  d503201f       nop

Protected instructions:
 pc offset
        44         
        64         
        b4         
       148         
       150         
       158         
       160         
       168         
       174         
       17c         
       184         
       18c         
       1c0         
       1f8         
       200         
       208         
       210         
       230         
       238         
       240         
       258         
       274         
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
       2f0         
       3dc         
       3e4         
       3ec         
       3f4         
       400         
       408         
       410         
       414         
       41c         
       424         
       430         
       5f0         
       6c4         
       6cc         
       6fc         
       72c         
       75c         
       798         
       7f8         
       808         
       838         
       844         
       874         
       87c         
       884         
       88c         
       894         
       89c         
       8a4         
       8c0         
       8c8         
       8d0         
       8d8         
       8e0         
       8e8         
       8f0         
       908         
       910         
       940         
       970         
       9a0         
       9dc         
       a28         
       a38         
       a64         
       a6c         
       a74         
       a7c         
       a84         
       a8c         
       a94         
       aa0         
       aa8         
       af4         
       b04         
       b38         
       b40         
       b48         
       b54         
       b60         
       b6c         
       b74         
       b80         
       b8c         
       bd0         
       bd8         
       be0         
       be8         
       bf0         
       bf8         
       c00         
       c6c         
       c70         
       c80         
       c84         
       c94         
       c98         
       ca8         
       cac         

Source positions:
 pc offset  position
        44        62
        64        99
        b4       168
       144       281
       150       291
       158       295
       160       302
       168       306
       174       317
       17c       322
       184       327
       18c       332
       190       335
       1b8       345
       1f8       363
       200       370
       208       377
       210       384
       22c       415
       238       422
       240       429
       254       454
       274       497
       27c       504
       284       511
       28c       518
       294       525
       29c       532
       2a4       540
       2ac       547
       2b4       554
       2b8       562
       2c4       570
       2cc       577
       2d0       584
       2d8       591
       2e0       598
       2f0       611
       3dc       647
       3e4       657
       3ec       667
       3f4       679
       400       682
       408       689
       410       696
       414       703
       41c       714
       424       721
       430       744
       5f0      1108
       6c4      1236
       6cc      1249
       6fc      1309
       7f8      1705
       808      1723
       838      1796
       844      1809
       874      1843
       87c      1850
       880      1857
       88c      1864
       894      1871
       89c      1878
       8a0      1885
       8c0      1369
       8c8      1376
       8cc      1383
       8d8      1390
       8e0      1397
       8e8      1404
       8ec      1411
       904      1421
       90c      1428
       940      1490
       a28      1547
       a38      1565
       a64      1608
       a6c      1618
       a74      1635
       a7c      1647
       a84      1659
       a8c      1671
       a94      1683
       aa0      1915
       aa8      1927
       af4      1965
       b04      1983
       b38      2026
       b40      2036
       b48      2053
       b54      2065
       b60      2077
       b6c      2089
       b74      2101
       b80      2116
       b8c      2128
       bd0      2139
       bd8      2146
       bdc      2153
       be8      2160
       bf0      2167
       bf8      2174
       bfc      2181
       c14      2208
       c68      2228
       c70      2231
       c80      2241
       c84      2244
       c94      2254
       c98      2257
       ca8      2267
       cac      2270
       cec         0
       d4c       626
       e00      1042
       ed8      1079
       fc8      1173
      10a8      1186
      1180      1294
      1270      1475

Safepoints (stack slots = 68, entries = 1, byte size = 23)
0x20d29c68d798    1b8  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0x20d29c68d794  internal wasm call
0x20d29c68e220  internal wasm call
0x20d29c68e2cc  wasm stub call  (0x20d29c585bd0)
0x20d29c68e338  wasm stub call  (0x20d29c585bd0)
0x20d29c68e418  wasm stub call  (0x20d29c585bd0)
0x20d29c68e4fc  wasm stub call  (0x20d29c585bd0)
0x20d29c68e5e4  wasm stub call  (0x20d29c585bd0)
0x20d29c68e6c0  wasm stub call  (0x20d29c585bd0)
0x20d29c68e7a4  wasm stub call  (0x20d29c585bd0)
0x20d29c68e8a4  wasm stub call  (0x20d29c585bd0)
