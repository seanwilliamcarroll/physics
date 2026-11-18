name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 4864 = 4860 + 4 padding)
Instructions (size = 4836)
0x194a8cfb92e0     0  d2800110       movz x16, #0x8
0x194a8cfb92e4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x194a8cfb92e8     8  a9017bfd       stp fp, lr, [sp, #16]
0x194a8cfb92ec     c  910043fd       add fp, sp, #0x10 (16)
0x194a8cfb92f0    10  d107c3ff       sub sp, sp, #0x1f0 (496)
0x194a8cfb92f4    14  f841f0e1       ldur x1, [x7, #31]
0x194a8cfb92f8    18  f8520346       ldur x6, [x26, #-224]
0x194a8cfb92fc    1c  f9008fe0       str x0, [sp, #280]
0x194a8cfb9300    20  f90063e1       str x1, [sp, #192]
0x194a8cfb9304    24  eb2663ff       cmp sp, x6
0x194a8cfb9308    28  54006509       b.ls #+0xca0 (addr 0x194a8cfb9fa8)
0x194a8cfb930c    2c  f842f0e6       ldur x6, [x7, #47]
0x194a8cfb9310    30  b94000c8       ldr w8, [x6]
0x194a8cfb9314    34  51014104       sub w4, w8, #0x50 (80)
0x194a8cfb9318    38  b90000c4       str w4, [x6]
0x194a8cfb931c    3c  2a0003e8       mov w8, w0
0x194a8cfb9320    40  91024029       add x9, x1, #0x90 (144)
0x194a8cfb9324    44  fc686922       ldr d2, [x9, x8]
0x194a8cfb9328    48  5e0c0441       mov s1, v2.s[1]
0x194a8cfb932c    4c  52a75010       movz w16, #0x3a800000
0x194a8cfb9330    50  1e270203       fmov s3, w16
0x194a8cfb9334    54  1e230824       fmul s4, s1, s3
0x194a8cfb9338    58  5e040440       mov s0, v2.s[0]
0x194a8cfb933c    5c  1e230803       fmul s3, s0, s3
0x194a8cfb9340    60  91028109       add x9, x8, #0xa0 (160)
0x194a8cfb9344    64  bc696825       ldr s5, [x1, x9]
0x194a8cfb9348    68  1e2520a0       fcmp s5, s5
0x194a8cfb934c    6c  1e251c65       fcsel s5, s3, s5, ne
0x194a8cfb9350    70  1e232060       fcmp s3, s3
0x194a8cfb9354    74  1e231ca3       fcsel s3, s5, s3, ne
0x194a8cfb9358    78  1e252060       fcmp s3, s5
0x194a8cfb935c    7c  1e233ca3       fcsel s3, s5, s3, lo
0x194a8cfb9360    80  1e232060       fcmp s3, s3
0x194a8cfb9364    84  1e231c83       fcsel s3, s4, s3, ne
0x194a8cfb9368    88  1e242080       fcmp s4, s4
0x194a8cfb936c    8c  1e241c64       fcsel s4, s3, s4, ne
0x194a8cfb9370    90  1e232080       fcmp s4, s3
0x194a8cfb9374    94  1e243c63       fcsel s3, s3, s4, lo
0x194a8cfb9378    98  52840010       movz w16, #0x2000
0x194a8cfb937c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x194a8cfb9380    a0  1e270204       fmov s4, w16
0x194a8cfb9384    a4  1e240863       fmul s3, s3, s4
0x194a8cfb9388    a8  1e2e1004       fmov s4, #0x70 (1.0000)
0x194a8cfb938c    ac  1e231883       fdiv s3, s4, s3
0x194a8cfb9390    b0  9102110a       add x10, x8, #0x84 (132)
0x194a8cfb9394    b4  bc2a6823       str s3, [x1, x10]
0x194a8cfb9398    b8  4e040463       dup v3.4s, v3.s[0]
0x194a8cfb939c    bc  6e23dc42       fmul v2.4s, v2.4s, v3.4s
0x194a8cfb93a0    c0  4ea18842       frintp v2.4s, v2.4s
0x194a8cfb93a4    c4  5e040443       mov s3, v2.s[0]
0x194a8cfb93a8    c8  1e22c065       fcvt d5, s3
0x194a8cfb93ac    cc  1e65c0a6       frintz d6, d5
0x194a8cfb93b0    d0  1e7900cb       fcvtzu w11, d6
0x194a8cfb93b4    d4  1e630167       ucvtf d7, w11
0x194a8cfb93b8    d8  f900f7e6       str x6, [sp, #488]
0x194a8cfb93bc    dc  f900f3e4       str x4, [sp, #480]
0x194a8cfb93c0    e0  f900ebe8       str x8, [sp, #464]
0x194a8cfb93c4    e4  fd00c3e1       str d1, [sp, #384]
0x194a8cfb93c8    e8  fd00c7e0       str d0, [sp, #392]
0x194a8cfb93cc    ec  f900b7e9       str x9, [sp, #360]
0x194a8cfb93d0    f0  f900dfea       str x10, [sp, #440]
0x194a8cfb93d4    f4  1e6720c0       fcmp d6, d7
0x194a8cfb93d8    f8  54005f21       b.ne #+0xbe4 (addr 0x194a8cfb9fbc)
0x194a8cfb93dc    fc  4e040d63       dup v3.4s, w11
0x194a8cfb93e0   100  5e0c0445       mov s5, v2.s[1]
0x194a8cfb93e4   104  1e22c0a6       fcvt d6, s5
0x194a8cfb93e8   108  1e65c0c7       frintz d7, d6
0x194a8cfb93ec   10c  1e7900eb       fcvtzu w11, d7
0x194a8cfb93f0   110  1e630168       ucvtf d8, w11
0x194a8cfb93f4   114  1e6820e0       fcmp d7, d8
0x194a8cfb93f8   118  54005f81       b.ne #+0xbf0 (addr 0x194a8cfb9fe8)
0x194a8cfb93fc   11c  4e0c1d63       mov v3.s[1], w11
0x194a8cfb9400   120  4f000425       movi v5.4s, #0x1, lsl #0
0x194a8cfb9404   124  6ea56463       umax v3.4s, v3.4s, v5.4s
0x194a8cfb9408   128  6f00e406       movi v6.2d, #0x0
0x194a8cfb940c   12c  6ea0c847       fcmge v7.4s, v2.4s, #0.0
0x194a8cfb9410   130  52a9f010       movz w16, #0x4f800000
0x194a8cfb9414   134  4e040e08       dup v8.4s, w16
0x194a8cfb9418   138  6ea2e502       fcmgt v2.4s, v8.4s, v2.4s
0x194a8cfb941c   13c  4e221ce2       and v2.16b, v7.16b, v2.16b
0x194a8cfb9420   140  6e651c62       bsl v2.16b, v3.16b, v5.16b
0x194a8cfb9424   144  9102202b       add x11, x1, #0x88 (136)
0x194a8cfb9428   148  8b08016c       add x12, x11, x8
0x194a8cfb942c   14c  0d008582       st1 {v2.d}[0], [x12]
0x194a8cfb9430   150  9103310c       add x12, x8, #0xcc (204)
0x194a8cfb9434   154  b86c682c       ldr w12, [x1, x12]
0x194a8cfb9438   158  9100a08d       add x13, x4, #0x28 (40)
0x194a8cfb943c   15c  b82d682c       str w12, [x1, x13]
0x194a8cfb9440   160  9103110c       add x12, x8, #0xc4 (196)
0x194a8cfb9444   164  f86c682c       ldr x12, [x1, x12]
0x194a8cfb9448   168  9100808d       add x13, x4, #0x20 (32)
0x194a8cfb944c   16c  f82d682c       str x12, [x1, x13]
0x194a8cfb9450   170  1101800c       add w12, w0, #0x60 (96)
0x194a8cfb9454   174  9100110d       add x13, x8, #0x4 (4)
0x194a8cfb9458   178  b86d6822       ldr w2, [x1, x13]
0x194a8cfb945c   17c  9100210e       add x14, x8, #0x8 (8)
0x194a8cfb9460   180  b86e6823       ldr w3, [x1, x14]
0x194a8cfb9464   184  9100410f       add x15, x8, #0x10 (16)
0x194a8cfb9468   188  b86f6833       ldr w19, [x1, x15]
0x194a8cfb946c   18c  91005114       add x20, x8, #0x14 (20)
0x194a8cfb9470   190  b8746825       ldr w5, [x1, x20]
0x194a8cfb9474   194  3d8017e5       str q5, [sp, #80]
0x194a8cfb9478   198  3d800be6       str q6, [sp, #32]
0x194a8cfb947c   19c  3d8023e8       str q8, [sp, #128]
0x194a8cfb9480   1a0  f900e3eb       str x11, [sp, #448]
0x194a8cfb9484   1a4  f900bbed       str x13, [sp, #368]
0x194a8cfb9488   1a8  f900efee       str x14, [sp, #472]
0x194a8cfb948c   1ac  f900bfef       str x15, [sp, #376]
0x194a8cfb9490   1b0  f900e7f4       str x20, [sp, #456]
0x194a8cfb9494   1b4  aa0c03e0       mov x0, x12
0x194a8cfb9498   1b8  aa1303e4       mov x4, x19
0x194a8cfb949c   1bc  97fbe078       bl #-0x107e20 (addr 0x194a8ceb167c)
0x194a8cfb94a0   1c0  f94063e1       ldr x1, [sp, #192]
0x194a8cfb94a4   1c4  f940efe6       ldr x6, [sp, #472]
0x194a8cfb94a8   1c8  b8666826       ldr w6, [x1, x6]
0x194a8cfb94ac   1cc  f900efe6       str x6, [sp, #472]
0x194a8cfb94b0   1d0  35000106       cbnz w6, #+0x20 (addr 0x194a8cfb94d0)
0x194a8cfb94b4   1d4  f940f3e4       ldr x4, [sp, #480]
0x194a8cfb94b8   1d8  11014081       add w1, w4, #0x50 (80)
0x194a8cfb94bc   1dc  f940f7e8       ldr x8, [sp, #488]
0x194a8cfb94c0   1e0  b9000101       str w1, [x8]
0x194a8cfb94c4   1e4  910003bf       mov sp, fp
0x194a8cfb94c8   1e8  a8c17bfd       ldp fp, lr, [sp], #16
0x194a8cfb94cc   1ec  d65f03c0       ret
0x194a8cfb94d0   1f0  f9408fe0       ldr x0, [sp, #280]
0x194a8cfb94d4   1f4  11028002       add w2, w0, #0xa0 (160)
0x194a8cfb94d8   1f8  f940ebe8       ldr x8, [sp, #464]
0x194a8cfb94dc   1fc  91017109       add x9, x8, #0x5c (92)
0x194a8cfb94e0   200  b8696829       ldr w9, [x1, x9]
0x194a8cfb94e4   204  9101410a       add x10, x8, #0x50 (80)
0x194a8cfb94e8   208  b86a682a       ldr w10, [x1, x10]
0x194a8cfb94ec   20c  9101110b       add x11, x8, #0x44 (68)
0x194a8cfb94f0   210  b86b682b       ldr w11, [x1, x11]
0x194a8cfb94f4   214  9100e10c       add x12, x8, #0x38 (56)
0x194a8cfb94f8   218  b86c682c       ldr w12, [x1, x12]
0x194a8cfb94fc   21c  6b0c017f       cmp w11, w12
0x194a8cfb9500   220  1a8c316d       csel w13, w11, w12, lo
0x194a8cfb9504   224  6b0d015f       cmp w10, w13
0x194a8cfb9508   228  1a8d314b       csel w11, w10, w13, lo
0x194a8cfb950c   22c  6b0b013f       cmp w9, w11
0x194a8cfb9510   230  1a8b312a       csel w10, w9, w11, lo
0x194a8cfb9514   234  f940e7e9       ldr x9, [sp, #456]
0x194a8cfb9518   238  b8696829       ldr w9, [x1, x9]
0x194a8cfb951c   23c  9100810b       add x11, x8, #0x20 (32)
0x194a8cfb9520   240  b86b682b       ldr w11, [x1, x11]
0x194a8cfb9524   244  9100b10c       add x12, x8, #0x2c (44)
0x194a8cfb9528   248  b86c682c       ldr w12, [x1, x12]
0x194a8cfb952c   24c  6b0c017f       cmp w11, w12
0x194a8cfb9530   250  1a8c316d       csel w13, w11, w12, lo
0x194a8cfb9534   254  6b0d013f       cmp w9, w13
0x194a8cfb9538   258  1a8d312b       csel w11, w9, w13, lo
0x194a8cfb953c   25c  f940e3ec       ldr x12, [sp, #448]
0x194a8cfb9540   260  fc686982       ldr d2, [x12, x8]
0x194a8cfb9544   264  3dc017e3       ldr q3, [sp, #80]
0x194a8cfb9548   268  4e040464       dup v4.4s, v3.s[0]
0x194a8cfb954c   26c  6e0c0444       mov v4.s[1], v2.s[0]
0x194a8cfb9550   270  6ea36442       umax v2.4s, v2.4s, v3.4s
0x194a8cfb9554   274  6ea38442       sub v2.4s, v2.4s, v3.4s
0x194a8cfb9558   278  9101610c       add x12, x8, #0x58 (88)
0x194a8cfb955c   27c  b86c682c       ldr w12, [x1, x12]
0x194a8cfb9560   280  9101310e       add x14, x8, #0x4c (76)
0x194a8cfb9564   284  b86e682e       ldr w14, [x1, x14]
0x194a8cfb9568   288  9101010f       add x15, x8, #0x40 (64)
0x194a8cfb956c   28c  b86f682f       ldr w15, [x1, x15]
0x194a8cfb9570   290  9100d113       add x19, x8, #0x34 (52)
0x194a8cfb9574   294  b8736833       ldr w19, [x1, x19]
0x194a8cfb9578   298  9101f114       add x20, x8, #0x7c (124)
0x194a8cfb957c   29c  b8746834       ldr w20, [x1, x20]
0x194a8cfb9580   2a0  91020115       add x21, x8, #0x80 (128)
0x194a8cfb9584   2a4  b8756835       ldr w21, [x1, x21]
0x194a8cfb9588   2a8  91019116       add x22, x8, #0x64 (100)
0x194a8cfb958c   2ac  b8766836       ldr w22, [x1, x22]
0x194a8cfb9590   2b0  9101a117       add x23, x8, #0x68 (104)
0x194a8cfb9594   2b4  b8776837       ldr w23, [x1, x23]
0x194a8cfb9598   2b8  91022118       add x24, x8, #0x88 (136)
0x194a8cfb959c   2bc  b8786838       ldr w24, [x1, x24]
0x194a8cfb95a0   2c0  f940dff9       ldr x25, [sp, #440]
0x194a8cfb95a4   2c4  bc796825       ldr s5, [x1, x25]
0x194a8cfb95a8   2c8  91007119       add x25, x8, #0x1c (28)
0x194a8cfb95ac   2cc  b8796839       ldr w25, [x1, x25]
0x194a8cfb95b0   2d0  9100a11b       add cp, x8, #0x28 (40)
0x194a8cfb95b4   2d4  b87b683b       ldr w27, [x1, x27]
0x194a8cfb95b8   2d8  f940bffc       ldr x28, [sp, #376]
0x194a8cfb95bc   2dc  b87c683c       ldr w28, [x1, x28]
0x194a8cfb95c0   2e0  f940bbe3       ldr x3, [sp, #368]
0x194a8cfb95c4   2e4  b8636823       ldr w3, [x1, x3]
0x194a8cfb95c8   2e8  f940b7e4       ldr x4, [sp, #360]
0x194a8cfb95cc   2ec  bc646826       ldr s6, [x1, x4]
0x194a8cfb95d0   2f0  1e2608c6       fmul s6, s6, s6
0x194a8cfb95d4   2f4  91029108       add x8, x8, #0xa4 (164)
0x194a8cfb95d8   2f8  bc686827       ldr s7, [x1, x8]
0x194a8cfb95dc   2fc  1e2708e7       fmul s7, s7, s7
0x194a8cfb95e0   300  f900cbe2       str x2, [sp, #400]
0x194a8cfb95e4   304  f900cfea       str x10, [sp, #408]
0x194a8cfb95e8   308  f90087e9       str x9, [sp, #264]
0x194a8cfb95ec   30c  f9008bed       str x13, [sp, #272]
0x194a8cfb95f0   310  f90037eb       str x11, [sp, #104]
0x194a8cfb95f4   314  3d8007e4       str q4, [sp, #16]
0x194a8cfb95f8   318  3d8003e2       str q2, [sp]
0x194a8cfb95fc   31c  f900e3ec       str x12, [sp, #448]
0x194a8cfb9600   320  f900dbee       str x14, [sp, #432]
0x194a8cfb9604   324  f900d7ef       str x15, [sp, #424]
0x194a8cfb9608   328  f900d3f3       str x19, [sp, #416]
0x194a8cfb960c   32c  f9007ff4       str x20, [sp, #248]
0x194a8cfb9610   330  f9007bf5       str x21, [sp, #240]
0x194a8cfb9614   334  f9005bf6       str x22, [sp, #176]
0x194a8cfb9618   338  f90057f7       str x23, [sp, #168]
0x194a8cfb961c   33c  f9004bf8       str x24, [sp, #144]
0x194a8cfb9620   340  fd005fe5       str d5, [sp, #184]
0x194a8cfb9624   344  f900b3f9       str x25, [sp, #352]
0x194a8cfb9628   348  f900affb       str cp, [sp, #344]
0x194a8cfb962c   34c  f90097fc       str x28, [sp, #296]
0x194a8cfb9630   350  f9009fe3       str x3, [sp, #312]
0x194a8cfb9634   354  fd00abe6       str d6, [sp, #336]
0x194a8cfb9638   358  fd00a7e7       str d7, [sp, #328]
0x194a8cfb963c   35c  aa0103e4       mov x4, x1
0x194a8cfb9640   360  d2800001       movz x1, #0x0
0x194a8cfb9644   364  f900e7e1       str x1, [sp, #456]
0x194a8cfb9648   368  14000016       b #+0x58 (addr 0x194a8cfb96a0)
0x194a8cfb964c   36c  f94037eb       ldr x11, [sp, #104]
0x194a8cfb9650   370  fd405fe5       ldr d5, [sp, #184]
0x194a8cfb9654   374  f9408fe0       ldr x0, [sp, #280]
0x194a8cfb9658   378  aa0d03e4       mov x4, x13
0x194a8cfb965c   37c  aa0803e6       mov x6, x8
0x194a8cfb9660   380  f940b3f9       ldr x25, [sp, #352]
0x194a8cfb9664   384  f940affb       ldr cp, [sp, #344]
0x194a8cfb9668   388  fd40abe6       ldr d6, [sp, #336]
0x194a8cfb966c   38c  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfb9670   390  3dc017e3       ldr q3, [sp, #80]
0x194a8cfb9674   394  f9409fe3       ldr x3, [sp, #312]
0x194a8cfb9678   398  f94097fc       ldr x28, [sp, #296]
0x194a8cfb967c   39c  f9408bed       ldr x13, [sp, #272]
0x194a8cfb9680   3a0  f94087e9       ldr x9, [sp, #264]
0x194a8cfb9684   3a4  f9407ff4       ldr x20, [sp, #248]
0x194a8cfb9688   3a8  f9407bf5       ldr x21, [sp, #240]
0x194a8cfb968c   3ac  f9405bf6       ldr x22, [sp, #176]
0x194a8cfb9690   3b0  f94057f7       ldr x23, [sp, #168]
0x194a8cfb9694   3b4  f9404bf8       ldr x24, [sp, #144]
0x194a8cfb9698   3b8  3dc007e4       ldr q4, [sp, #16]
0x194a8cfb969c   3bc  3dc003e2       ldr q2, [sp]
0x194a8cfb96a0   3c0  f8520345       ldur x5, [x26, #-224]
0x194a8cfb96a4   3c4  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfb96a8   3c8  3dc023e8       ldr q8, [sp, #128]
0x194a8cfb96ac   3cc  eb2563ff       cmp sp, x5
0x194a8cfb96b0   3d0  54004ac9       b.ls #+0x958 (addr 0x194a8cfba008)
0x194a8cfb96b4   3d4  6b01017f       cmp w11, w1
0x194a8cfb96b8   3d8  54004609       b.ls #+0x8c0 (addr 0x194a8cfb9f78)
0x194a8cfb96bc   3dc  531e7425       lsl w5, w1, #2
0x194a8cfb96c0   3e0  0b050067       add w7, w3, w5
0x194a8cfb96c4   3e4  bc67688b       ldr s11, [x4, x7]
0x194a8cfb96c8   3e8  0b050387       add w7, w28, w5
0x194a8cfb96cc   3ec  bc67688c       ldr s12, [x4, x7]
0x194a8cfb96d0   3f0  0b050327       add w7, w25, w5
0x194a8cfb96d4   3f4  bc67688d       ldr s13, [x4, x7]
0x194a8cfb96d8   3f8  0b050367       add w7, w27, w5
0x194a8cfb96dc   3fc  bc67688e       ldr s14, [x4, x7]
0x194a8cfb96e0   400  f940f3e8       ldr x8, [sp, #480]
0x194a8cfb96e4   404  91003107       add x7, x8, #0xc (12)
0x194a8cfb96e8   408  bc27688e       str s14, [x4, x7]
0x194a8cfb96ec   40c  91002107       add x7, x8, #0x8 (8)
0x194a8cfb96f0   410  bc27688d       str s13, [x4, x7]
0x194a8cfb96f4   414  91001107       add x7, x8, #0x4 (4)
0x194a8cfb96f8   418  bc27688c       str s12, [x4, x7]
0x194a8cfb96fc   41c  bc28688b       str s11, [x4, x8]
0x194a8cfb9700   420  91012107       add x7, x8, #0x48 (72)
0x194a8cfb9704   424  b827689f       str wzr, [x4, x7]
0x194a8cfb9708   428  9101010a       add x10, x8, #0x40 (64)
0x194a8cfb970c   42c  f82a689f       str xzr, [x4, x10]
0x194a8cfb9710   430  6f00e40d       movi v13.2d, #0x0
0x194a8cfb9714   434  9100c10b       add x11, x8, #0x30 (48)
0x194a8cfb9718   438  3cab688d       str q13, [x4, x11]
0x194a8cfb971c   43c  1e25096d       fmul s13, s11, s5
0x194a8cfb9720   440  1e2541ad       frintm s13, s13
0x194a8cfb9724   444  1e2d21a0       fcmp s13, s13
0x194a8cfb9728   448  1e2d1ded       fcsel s13, s15, s13, ne
0x194a8cfb972c   44c  1e2021a8       fcmp s13, #0.0
0x194a8cfb9730   450  1e2fcdad       fcsel s13, s13, s15, gt
0x194a8cfb9734   454  4e0405ae       dup v14.4s, v13.s[0]
0x194a8cfb9738   458  1e250990       fmul s16, s12, s5
0x194a8cfb973c   45c  1e254210       frintm s16, s16
0x194a8cfb9740   460  1e302200       fcmp s16, s16
0x194a8cfb9744   464  1e301df0       fcsel s16, s15, s16, ne
0x194a8cfb9748   468  1e202208       fcmp s16, #0.0
0x194a8cfb974c   46c  1e2fce11       fcsel s17, s16, s15, gt
0x194a8cfb9750   470  f90063e4       str x4, [sp, #192]
0x194a8cfb9754   474  1e260204       fmov w4, s16
0x194a8cfb9758   478  6a04009f       tst w4, w4
0x194a8cfb975c   47c  1e301e30       fcsel s16, s17, s16, ne
0x194a8cfb9760   480  1e202228       fcmp s17, #0.0
0x194a8cfb9764   484  1e310e10       fcsel s16, s16, s17, eq
0x194a8cfb9768   488  6e0c060e       mov v14.s[1], v16.s[0]
0x194a8cfb976c   48c  6eaee50e       fcmgt v14.4s, v8.4s, v14.4s
0x194a8cfb9770   490  4e040c11       dup v17.4s, w0
0x194a8cfb9774   494  1e22c1b2       fcvt d18, s13
0x194a8cfb9778   498  1e65c253       frintz d19, d18
0x194a8cfb977c   49c  1e790260       fcvtzu w0, d19
0x194a8cfb9780   4a0  1e630014       ucvtf d20, w0
0x194a8cfb9784   4a4  f900ebe1       str x1, [sp, #464]
0x194a8cfb9788   4a8  f900dfe5       str x5, [sp, #440]
0x194a8cfb978c   4ac  f900bbea       str x10, [sp, #368]
0x194a8cfb9790   4b0  f900bfeb       str x11, [sp, #376]
0x194a8cfb9794   4b4  1e742260       fcmp d19, d20
0x194a8cfb9798   4b8  54004721       b.ne #+0x8e4 (addr 0x194a8cfba07c)
0x194a8cfb979c   4bc  4eb11e2d       mov v13.16b, v17.16b
0x194a8cfb97a0   4c0  4e041c0d       mov v13.s[0], w0
0x194a8cfb97a4   4c4  1e22c211       fcvt d17, s16
0x194a8cfb97a8   4c8  1e65c232       frintz d18, d17
0x194a8cfb97ac   4cc  1e790240       fcvtzu w0, d18
0x194a8cfb97b0   4d0  1e630013       ucvtf d19, w0
0x194a8cfb97b4   4d4  1e732240       fcmp d18, d19
0x194a8cfb97b8   4d8  54004721       b.ne #+0x8e4 (addr 0x194a8cfba09c)
0x194a8cfb97bc   4dc  4e0c1c0d       mov v13.s[1], w0
0x194a8cfb97c0   4e0  6ead6c4d       umin v13.4s, v2.4s, v13.4s
0x194a8cfb97c4   4e4  4e2d1dcd       and v13.16b, v14.16b, v13.16b
0x194a8cfb97c8   4e8  4ea385ae       add v14.4s, v13.4s, v3.4s
0x194a8cfb97cc   4ec  6eae6c4e       umin v14.4s, v2.4s, v14.4s
0x194a8cfb97d0   4f0  4eae9c90       mul v16.4s, v4.4s, v14.4s
0x194a8cfb97d4   4f4  0e0c3e00       mov w0, v16.s[1]
0x194a8cfb97d8   4f8  0e043da4       mov w4, v13.s[0]
0x194a8cfb97dc   4fc  7100009f       cmp w4, #0x0 (0)
0x194a8cfb97e0   500  9a9f07ec       cset x12, ne
0x194a8cfb97e4   504  4b0c008c       sub w12, w4, w12
0x194a8cfb97e8   508  0b0c0004       add w4, w0, w12
0x194a8cfb97ec   50c  4eae8490       add v16.4s, v4.4s, v14.4s
0x194a8cfb97f0   510  0e043e0e       mov w14, v16.s[0]
0x194a8cfb97f4   514  0b0e0000       add w0, w0, w14
0x194a8cfb97f8   518  6b17009f       cmp w4, w23
0x194a8cfb97fc   51c  7a573002       ccmp w0, w23, #nzCv, lo
0x194a8cfb9800   520  9a9f27ef       cset x15, lo
0x194a8cfb9804   524  0e0c3db3       mov w19, v13.s[1]
0x194a8cfb9808   528  7100027f       cmp w19, #0x0 (0)
0x194a8cfb980c   52c  9a9f07e2       cset x2, ne
0x194a8cfb9810   530  4b020273       sub w19, w19, w2
0x194a8cfb9814   534  0b000ac0       add w0, w22, w0, lsl #2
0x194a8cfb9818   538  0b040ac2       add w2, w22, w4, lsl #2
0x194a8cfb981c   53c  0e0c3dc4       mov w4, v14.s[1]
0x194a8cfb9820   540  f9006fef       str x15, [sp, #216]
0x194a8cfb9824   544  f90073e0       str x0, [sp, #224]
0x194a8cfb9828   548  f90077e2       str x2, [sp, #232]
0x194a8cfb982c   54c  f940e7e5       ldr x5, [sp, #456]
0x194a8cfb9830   550  2f00e40d       movi d13, #0x0
0x194a8cfb9834   554  f9003bf3       str x19, [sp, #112]
0x194a8cfb9838   558  f94063f3       ldr x19, [sp, #192]
0x194a8cfb983c   55c  d2800002       movz x2, #0x0
0x194a8cfb9840   560  3dc00bf1       ldr q17, [sp, #32]
0x194a8cfb9844   564  f90093e2       str x2, [sp, #288]
0x194a8cfb9848   568  4ead1dae       mov v14.16b, v13.16b
0x194a8cfb984c   56c  4ead1db0       mov v16.16b, v13.16b
0x194a8cfb9850   570  14000034       b #+0xd0 (addr 0x194a8cfb9920)
0x194a8cfb9854   574  531e756b       lsl w11, w11, #2
0x194a8cfb9858   578  0b0b0386       add w6, w28, w11
0x194a8cfb985c   57c  bc666a72       ldr s18, [x19, x6]
0x194a8cfb9860   580  1e323993       fsub s19, s12, s18
0x194a8cfb9864   584  0b0b0066       add w6, w3, w11
0x194a8cfb9868   588  bc666a74       ldr s20, [x19, x6]
0x194a8cfb986c   58c  1e343975       fsub s21, s11, s20
0x194a8cfb9870   590  1e350ab6       fmul s22, s21, s21
0x194a8cfb9874   594  1e330a77       fmul s23, s19, s19
0x194a8cfb9878   598  1e372ad6       fadd s22, s22, s23
0x194a8cfb987c   59c  1e2722c0       fcmp s22, s7
0x194a8cfb9880   5a0  1e2f3d57       fcsel s23, s10, s15, lo
0x194a8cfb9884   5a4  1e370a73       fmul s19, s19, s23
0x194a8cfb9888   5a8  1e332a10       fadd s16, s16, s19
0x194a8cfb988c   5ac  bc276a70       str s16, [x19, x7]
0x194a8cfb9890   5b0  1e370ab3       fmul s19, s21, s23
0x194a8cfb9894   5b4  1e3329ce       fadd s14, s14, s19
0x194a8cfb9898   5b8  91011106       add x6, x8, #0x44 (68)
0x194a8cfb989c   5bc  bc266a6e       str s14, [x19, x6]
0x194a8cfb98a0   5c0  1e2022c8       fcmp s22, #0.0
0x194a8cfb98a4   5c4  9a9fd7e6       cset x6, gt
0x194a8cfb98a8   5c8  1e3620e0       fcmp s7, s22
0x194a8cfb98ac   5cc  9a9f87e9       cset x9, ls
0x194a8cfb98b0   5d0  1e2622c0       fcmp s22, s6
0x194a8cfb98b4   5d4  9a9f27ed       cset x13, lo
0x194a8cfb98b8   5d8  0a0d0129       and w9, w9, w13
0x194a8cfb98bc   5dc  0a0900c6       and w6, w6, w9
0x194a8cfb98c0   5e0  1e2300d3       ucvtf s19, w6
0x194a8cfb98c4   5e4  1e3329ad       fadd s13, s13, s19
0x194a8cfb98c8   5e8  f940bbe0       ldr x0, [sp, #368]
0x194a8cfb98cc   5ec  bc206a6d       str s13, [x19, x0]
0x194a8cfb98d0   5f0  0b0b0366       add w6, w27, w11
0x194a8cfb98d4   5f4  0b0b0329       add w9, w25, w11
0x194a8cfb98d8   5f8  4e040694       dup v20.4s, v20.s[0]
0x194a8cfb98dc   5fc  6e0c0654       mov v20.s[1], v18.s[0]
0x194a8cfb98e0   600  8b090269       add x9, x19, x9
0x194a8cfb98e4   604  4d408134       ld1 {v20.s}[2], [x9]
0x194a8cfb98e8   608  8b060266       add x6, x19, x6
0x194a8cfb98ec   60c  4d4090d4       ld1 {v20.s}[3], [x6]
0x194a8cfb98f0   610  4e040672       dup v18.4s, v19.s[0]
0x194a8cfb98f4   614  6e32de92       fmul v18.4s, v20.4s, v18.4s
0x194a8cfb98f8   618  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x194a8cfb98fc   61c  f940bfe1       ldr x1, [sp, #376]
0x194a8cfb9900   620  3ca16a71       str q17, [x19, x1]
0x194a8cfb9904   624  f94087e9       ldr x9, [sp, #264]
0x194a8cfb9908   628  f9408bed       ldr x13, [sp, #272]
0x194a8cfb990c   62c  f9003be2       str x2, [sp, #112]
0x194a8cfb9910   630  f90093ef       str x15, [sp, #288]
0x194a8cfb9914   634  aa0a03e2       mov x2, x10
0x194a8cfb9918   638  f940ebe1       ldr x1, [sp, #464]
0x194a8cfb991c   63c  f940efe6       ldr x6, [sp, #472]
0x194a8cfb9920   640  f8520340       ldur x0, [x26, #-224]
0x194a8cfb9924   644  eb2063ff       cmp sp, x0
0x194a8cfb9928   648  54003ca9       b.ls #+0x794 (addr 0x194a8cfba0bc)
0x194a8cfb992c   64c  340000a2       cbz w2, #+0x14 (addr 0x194a8cfb9940)
0x194a8cfb9930   650  6b05005f       cmp w2, w5
0x194a8cfb9934   654  54000060       b.eq #+0xc (addr 0x194a8cfb9940)
0x194a8cfb9938   658  d2800000       movz x0, #0x0
0x194a8cfb993c   65c  14000002       b #+0x8 (addr 0x194a8cfb9944)
0x194a8cfb9940   660  d2800020       movz x0, #0x1
0x194a8cfb9944   664  aa0203eb       mov x11, x2
0x194a8cfb9948   668  f94093ef       ldr x15, [sp, #288]
0x194a8cfb994c   66c  f9403be2       ldr x2, [sp, #112]
0x194a8cfb9950   670  14000005       b #+0x14 (addr 0x194a8cfb9964)
0x194a8cfb9954   674  aa0b03ef       mov x15, x11
0x194a8cfb9958   678  aa1603eb       mov x11, x22
0x194a8cfb995c   67c  f9405bf6       ldr x22, [sp, #176]
0x194a8cfb9960   680  aa0a03e2       mov x2, x10
0x194a8cfb9964   684  f852034a       ldur x10, [x26, #-224]
0x194a8cfb9968   688  eb2a63ff       cmp sp, x10
0x194a8cfb996c   68c  540040c9       b.ls #+0x818 (addr 0x194a8cfba184)
0x194a8cfb9970   690  35000360       cbnz w0, #+0x6c (addr 0x194a8cfb99dc)
0x194a8cfb9974   694  1100116a       add w10, w11, #0x4 (4)
0x194a8cfb9978   698  2a0b03eb       mov w11, w11
0x194a8cfb997c   69c  b86b6a6b       ldr w11, [x19, x11]
0x194a8cfb9980   6a0  6b01017f       cmp w11, w1
0x194a8cfb9984   6a4  540000e0       b.eq #+0x1c (addr 0x194a8cfb99a0)
0x194a8cfb9988   6a8  6b0b00df       cmp w6, w11
0x194a8cfb998c   6ac  540000a9       b.ls #+0x14 (addr 0x194a8cfb99a0)
0x194a8cfb9990   6b0  6b0b013f       cmp w9, w11
0x194a8cfb9994   6b4  54000069       b.ls #+0xc (addr 0x194a8cfb99a0)
0x194a8cfb9998   6b8  6b0d017f       cmp w11, w13
0x194a8cfb999c   6bc  54fff5c3       b.lo #-0x148 (addr 0x194a8cfb9854)
0x194a8cfb99a0   6c0  6b05015f       cmp w10, w5
0x194a8cfb99a4   6c4  540000e0       b.eq #+0x1c (addr 0x194a8cfb99c0)
0x194a8cfb99a8   6c8  aa0f03eb       mov x11, x15
0x194a8cfb99ac   6cc  f940bbef       ldr x15, [sp, #368]
0x194a8cfb99b0   6d0  aa0a03f6       mov x22, x10
0x194a8cfb99b4   6d4  aa0203ea       mov x10, x2
0x194a8cfb99b8   6d8  f940bfe2       ldr x2, [sp, #376]
0x194a8cfb99bc   6dc  14000129       b #+0x4a4 (addr 0x194a8cfb9e60)
0x194a8cfb99c0   6e0  d2800020       movz x0, #0x1
0x194a8cfb99c4   6e4  aa0a03f6       mov x22, x10
0x194a8cfb99c8   6e8  aa0203ea       mov x10, x2
0x194a8cfb99cc   6ec  aa0f03eb       mov x11, x15
0x194a8cfb99d0   6f0  f940bfe2       ldr x2, [sp, #376]
0x194a8cfb99d4   6f4  f940bbef       ldr x15, [sp, #368]
0x194a8cfb99d8   6f8  17ffffdf       b #-0x84 (addr 0x194a8cfb9954)
0x194a8cfb99dc   6fc  72001dff       tst w15, #0xff
0x194a8cfb99e0   700  54002721       b.ne #+0x4e4 (addr 0x194a8cfb9ec4)
0x194a8cfb99e4   704  6b02009f       cmp w4, w2
0x194a8cfb99e8   708  540025c3       b.lo #+0x4b8 (addr 0x194a8cfb9ea0)
0x194a8cfb99ec   70c  14000004       b #+0x10 (addr 0x194a8cfb99fc)
0x194a8cfb99f0   710  f9405bf6       ldr x22, [sp, #176]
0x194a8cfb99f4   714  aa0b03e0       mov x0, x11
0x194a8cfb99f8   718  aa0a03e2       mov x2, x10
0x194a8cfb99fc   71c  f852034a       ldur x10, [x26, #-224]
0x194a8cfb9a00   720  eb2a63ff       cmp sp, x10
0x194a8cfb9a04   724  54004309       b.ls #+0x860 (addr 0x194a8cfba264)
0x194a8cfb9a08   728  6b02009f       cmp w4, w2
0x194a8cfb9a0c   72c  54001249       b.ls #+0x248 (addr 0x194a8cfb9c54)
0x194a8cfb9a10   730  14000002       b #+0x8 (addr 0x194a8cfb9a18)
0x194a8cfb9a14   734  aa0a03e2       mov x2, x10
0x194a8cfb9a18   738  f852034a       ldur x10, [x26, #-224]
0x194a8cfb9a1c   73c  eb2a63ff       cmp sp, x10
0x194a8cfb9a20   740  540048a9       b.ls #+0x914 (addr 0x194a8cfba334)
0x194a8cfb9a24   744  1100044a       add w10, w2, #0x1 (1)
0x194a8cfb9a28   748  1b187c40       mul w0, w2, w24
0x194a8cfb9a2c   74c  0b0c000b       add w11, w0, w12
0x194a8cfb9a30   750  6b0b02ff       cmp w23, w11
0x194a8cfb9a34   754  540008e9       b.ls #+0x11c (addr 0x194a8cfb9b50)
0x194a8cfb9a38   758  0b0e0000       add w0, w0, w14
0x194a8cfb9a3c   75c  6b0002ff       cmp w23, w0
0x194a8cfb9a40   760  54000889       b.ls #+0x110 (addr 0x194a8cfb9b50)
0x194a8cfb9a44   764  0b000acf       add w15, w22, w0, lsl #2
0x194a8cfb9a48   768  b86f6a60       ldr w0, [x19, x15]
0x194a8cfb9a4c   76c  0b0b0acb       add w11, w22, w11, lsl #2
0x194a8cfb9a50   770  b86b6a6b       ldr w11, [x19, x11]
0x194a8cfb9a54   774  6b0b001f       cmp w0, w11
0x194a8cfb9a58   778  540007c3       b.lo #+0xf8 (addr 0x194a8cfb9b50)
0x194a8cfb9a5c   77c  6b0002bf       cmp w21, w0
0x194a8cfb9a60   780  54000783       b.lo #+0xf0 (addr 0x194a8cfb9b50)
0x194a8cfb9a64   784  6b0b001f       cmp w0, w11
0x194a8cfb9a68   788  54000740       b.eq #+0xe8 (addr 0x194a8cfb9b50)
0x194a8cfb9a6c   78c  0b0b0a8f       add w15, w20, w11, lsl #2
0x194a8cfb9a70   790  4b0b000b       sub w11, w0, w11
0x194a8cfb9a74   794  531e756b       lsl w11, w11, #2
0x194a8cfb9a78   798  0b0b01e5       add w5, w15, w11
0x194a8cfb9a7c   79c  110011e0       add w0, w15, #0x4 (4)
0x194a8cfb9a80   7a0  b86f6a62       ldr w2, [x19, x15]
0x194a8cfb9a84   7a4  6b01005f       cmp w2, w1
0x194a8cfb9a88   7a8  540000e0       b.eq #+0x1c (addr 0x194a8cfb9aa4)
0x194a8cfb9a8c   7ac  6b0200df       cmp w6, w2
0x194a8cfb9a90   7b0  540000a9       b.ls #+0x14 (addr 0x194a8cfb9aa4)
0x194a8cfb9a94   7b4  6b02013f       cmp w9, w2
0x194a8cfb9a98   7b8  54000069       b.ls #+0xc (addr 0x194a8cfb9aa4)
0x194a8cfb9a9c   7bc  6b0d005f       cmp w2, w13
0x194a8cfb9aa0   7c0  540006a3       b.lo #+0xd4 (addr 0x194a8cfb9b74)
0x194a8cfb9aa4   7c4  5100116b       sub w11, w11, #0x4 (4)
0x194a8cfb9aa8   7c8  3400052b       cbz w11, #+0xa4 (addr 0x194a8cfb9b4c)
0x194a8cfb9aac   7cc  110021e2       add w2, w15, #0x8 (8)
0x194a8cfb9ab0   7d0  b8606a60       ldr w0, [x19, x0]
0x194a8cfb9ab4   7d4  6b01001f       cmp w0, w1
0x194a8cfb9ab8   7d8  540000e0       b.eq #+0x1c (addr 0x194a8cfb9ad4)
0x194a8cfb9abc   7dc  6b0000df       cmp w6, w0
0x194a8cfb9ac0   7e0  540000a9       b.ls #+0x14 (addr 0x194a8cfb9ad4)
0x194a8cfb9ac4   7e4  6b00013f       cmp w9, w0
0x194a8cfb9ac8   7e8  54000069       b.ls #+0xc (addr 0x194a8cfb9ad4)
0x194a8cfb9acc   7ec  6b0d001f       cmp w0, w13
0x194a8cfb9ad0   7f0  54000463       b.lo #+0x8c (addr 0x194a8cfb9b5c)
0x194a8cfb9ad4   7f4  5100116b       sub w11, w11, #0x4 (4)
0x194a8cfb9ad8   7f8  340003cb       cbz w11, #+0x78 (addr 0x194a8cfb9b50)
0x194a8cfb9adc   7fc  110031e0       add w0, w15, #0xc (12)
0x194a8cfb9ae0   800  b8626a62       ldr w2, [x19, x2]
0x194a8cfb9ae4   804  6b01005f       cmp w2, w1
0x194a8cfb9ae8   808  540000e0       b.eq #+0x1c (addr 0x194a8cfb9b04)
0x194a8cfb9aec   80c  6b0200df       cmp w6, w2
0x194a8cfb9af0   810  540000a9       b.ls #+0x14 (addr 0x194a8cfb9b04)
0x194a8cfb9af4   814  6b02013f       cmp w9, w2
0x194a8cfb9af8   818  54000069       b.ls #+0xc (addr 0x194a8cfb9b04)
0x194a8cfb9afc   81c  6b0d005f       cmp w2, w13
0x194a8cfb9b00   820  540003a3       b.lo #+0x74 (addr 0x194a8cfb9b74)
0x194a8cfb9b04   824  5100116b       sub w11, w11, #0x4 (4)
0x194a8cfb9b08   828  3400022b       cbz w11, #+0x44 (addr 0x194a8cfb9b4c)
0x194a8cfb9b0c   82c  f8520342       ldur x2, [x26, #-224]
0x194a8cfb9b10   830  eb2263ff       cmp sp, x2
0x194a8cfb9b14   834  54004749       b.ls #+0x8e8 (addr 0x194a8cfba3fc)
0x194a8cfb9b18   838  110041ef       add w15, w15, #0x10 (16)
0x194a8cfb9b1c   83c  b8606a60       ldr w0, [x19, x0]
0x194a8cfb9b20   840  6b01001f       cmp w0, w1
0x194a8cfb9b24   844  540000e0       b.eq #+0x1c (addr 0x194a8cfb9b40)
0x194a8cfb9b28   848  6b0000df       cmp w6, w0
0x194a8cfb9b2c   84c  540000a9       b.ls #+0x14 (addr 0x194a8cfb9b40)
0x194a8cfb9b30   850  6b00013f       cmp w9, w0
0x194a8cfb9b34   854  54000069       b.ls #+0xc (addr 0x194a8cfb9b40)
0x194a8cfb9b38   858  6b0d001f       cmp w0, w13
0x194a8cfb9b3c   85c  54000183       b.lo #+0x30 (addr 0x194a8cfb9b6c)
0x194a8cfb9b40   860  5100116b       sub w11, w11, #0x4 (4)
0x194a8cfb9b44   864  35fff9cb       cbnz w11, #-0xc8 (addr 0x194a8cfb9a7c)
0x194a8cfb9b48   868  14000002       b #+0x8 (addr 0x194a8cfb9b50)
0x194a8cfb9b4c   86c  aa0203e0       mov x0, x2
0x194a8cfb9b50   870  6b04015f       cmp w10, w4
0x194a8cfb9b54   874  54fff601       b.ne #-0x140 (addr 0x194a8cfb9a14)
0x194a8cfb9b58   878  1400003d       b #+0xf4 (addr 0x194a8cfb9c4c)
0x194a8cfb9b5c   87c  aa0203f0       mov x16, x2
0x194a8cfb9b60   880  aa0003e2       mov x2, x0
0x194a8cfb9b64   884  aa1003e0       mov x0, x16
0x194a8cfb9b68   888  14000003       b #+0xc (addr 0x194a8cfb9b74)
0x194a8cfb9b6c   88c  aa0003e2       mov x2, x0
0x194a8cfb9b70   890  aa0f03e0       mov x0, x15
0x194a8cfb9b74   894  531e744b       lsl w11, w2, #2
0x194a8cfb9b78   898  0b0b006f       add w15, w3, w11
0x194a8cfb9b7c   89c  bc6f6a72       ldr s18, [x19, x15]
0x194a8cfb9b80   8a0  1e323973       fsub s19, s11, s18
0x194a8cfb9b84   8a4  1e330a74       fmul s20, s19, s19
0x194a8cfb9b88   8a8  0b0b038f       add w15, w28, w11
0x194a8cfb9b8c   8ac  bc6f6a75       ldr s21, [x19, x15]
0x194a8cfb9b90   8b0  1e353996       fsub s22, s12, s21
0x194a8cfb9b94   8b4  1e360ad7       fmul s23, s22, s22
0x194a8cfb9b98   8b8  1e372a94       fadd s20, s20, s23
0x194a8cfb9b9c   8bc  1e202288       fcmp s20, #0.0
0x194a8cfb9ba0   8c0  9a9fd7ef       cset x15, gt
0x194a8cfb9ba4   8c4  1e3420e0       fcmp s7, s20
0x194a8cfb9ba8   8c8  9a9f87e2       cset x2, ls
0x194a8cfb9bac   8cc  1e262280       fcmp s20, s6
0x194a8cfb9bb0   8d0  9a9f27f6       cset x22, lo
0x194a8cfb9bb4   8d4  0a160056       and w22, w2, w22
0x194a8cfb9bb8   8d8  0a1601ef       and w15, w15, w22
0x194a8cfb9bbc   8dc  1e2301f7       ucvtf s23, w15
0x194a8cfb9bc0   8e0  1e3729ad       fadd s13, s13, s23
0x194a8cfb9bc4   8e4  0b0b036f       add w15, w27, w11
0x194a8cfb9bc8   8e8  0b0b0336       add w22, w25, w11
0x194a8cfb9bcc   8ec  4e040652       dup v18.4s, v18.s[0]
0x194a8cfb9bd0   8f0  6e0c06b2       mov v18.s[1], v21.s[0]
0x194a8cfb9bd4   8f4  8b160276       add x22, x19, x22
0x194a8cfb9bd8   8f8  4d4082d2       ld1 {v18.s}[2], [x22]
0x194a8cfb9bdc   8fc  8b0f026f       add x15, x19, x15
0x194a8cfb9be0   900  4d4091f2       ld1 {v18.s}[3], [x15]
0x194a8cfb9be4   904  4e0406f5       dup v21.4s, v23.s[0]
0x194a8cfb9be8   908  6e35de52       fmul v18.4s, v18.4s, v21.4s
0x194a8cfb9bec   90c  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x194a8cfb9bf0   910  1e272280       fcmp s20, s7
0x194a8cfb9bf4   914  1e2f3d52       fcsel s18, s10, s15, lo
0x194a8cfb9bf8   918  1e320ad4       fmul s20, s22, s18
0x194a8cfb9bfc   91c  1e342a10       fadd s16, s16, s20
0x194a8cfb9c00   920  1e320a72       fmul s18, s19, s18
0x194a8cfb9c04   924  1e3229ce       fadd s14, s14, s18
0x194a8cfb9c08   928  6b05001f       cmp w0, w5
0x194a8cfb9c0c   92c  54000081       b.ne #+0x10 (addr 0x194a8cfb9c1c)
0x194a8cfb9c10   930  6b0a009f       cmp w4, w10
0x194a8cfb9c14   934  54ffeee2       b.hs #-0x224 (addr 0x194a8cfb99f0)
0x194a8cfb9c18   938  14000094       b #+0x250 (addr 0x194a8cfb9e68)
0x194a8cfb9c1c   93c  bc276a70       str s16, [x19, x7]
0x194a8cfb9c20   940  9101110b       add x11, x8, #0x44 (68)
0x194a8cfb9c24   944  bc2b6a6e       str s14, [x19, x11]
0x194a8cfb9c28   948  f940bbf6       ldr x22, [sp, #368]
0x194a8cfb9c2c   94c  bc366a6d       str s13, [x19, x22]
0x194a8cfb9c30   950  f940bfeb       ldr x11, [sp, #376]
0x194a8cfb9c34   954  3cab6a71       str q17, [x19, x11]
0x194a8cfb9c38   958  aa1603ef       mov x15, x22
0x194a8cfb9c3c   95c  aa0b03e2       mov x2, x11
0x194a8cfb9c40   960  aa0003f6       mov x22, x0
0x194a8cfb9c44   964  d280000b       movz x11, #0x0
0x194a8cfb9c48   968  14000086       b #+0x218 (addr 0x194a8cfb9e60)
0x194a8cfb9c4c   96c  aa0403ea       mov x10, x4
0x194a8cfb9c50   970  14000002       b #+0x8 (addr 0x194a8cfb9c58)
0x194a8cfb9c54   974  aa0203ea       mov x10, x2
0x194a8cfb9c58   978  bc276a70       str s16, [x19, x7]
0x194a8cfb9c5c   97c  9101110b       add x11, x8, #0x44 (68)
0x194a8cfb9c60   980  bc2b6a6e       str s14, [x19, x11]
0x194a8cfb9c64   984  f940bbef       ldr x15, [sp, #368]
0x194a8cfb9c68   988  bc2f6a6d       str s13, [x19, x15]
0x194a8cfb9c6c   98c  f940bfe2       ldr x2, [sp, #376]
0x194a8cfb9c70   990  3ca26a71       str q17, [x19, x2]
0x194a8cfb9c74   994  f900e7e5       str x5, [sp, #456]
0x194a8cfb9c78   998  f9406ff6       ldr x22, [sp, #216]
0x194a8cfb9c7c   99c  34001256       cbz w22, #+0x248 (addr 0x194a8cfb9ec4)
0x194a8cfb9c80   9a0  f94073e0       ldr x0, [sp, #224]
0x194a8cfb9c84   9a4  b8606a77       ldr w23, [x19, x0]
0x194a8cfb9c88   9a8  f94077f8       ldr x24, [sp, #232]
0x194a8cfb9c8c   9ac  b8786a65       ldr w5, [x19, x24]
0x194a8cfb9c90   9b0  6b0502ff       cmp w23, w5
0x194a8cfb9c94   9b4  54001003       b.lo #+0x200 (addr 0x194a8cfb9e94)
0x194a8cfb9c98   9b8  6b1702bf       cmp w21, w23
0x194a8cfb9c9c   9bc  54000fc3       b.lo #+0x1f8 (addr 0x194a8cfb9e94)
0x194a8cfb9ca0   9c0  6b0502ff       cmp w23, w5
0x194a8cfb9ca4   9c4  54000f00       b.eq #+0x1e0 (addr 0x194a8cfb9e84)
0x194a8cfb9ca8   9c8  0b050a95       add w21, w20, w5, lsl #2
0x194a8cfb9cac   9cc  4b0502f7       sub w23, w23, w5
0x194a8cfb9cb0   9d0  531e76f7       lsl w23, w23, #2
0x194a8cfb9cb4   9d4  0b1702a5       add w5, w21, w23
0x194a8cfb9cb8   9d8  110012b4       add w20, w21, #0x4 (4)
0x194a8cfb9cbc   9dc  b8756a60       ldr w0, [x19, x21]
0x194a8cfb9cc0   9e0  6b01001f       cmp w0, w1
0x194a8cfb9cc4   9e4  540000e0       b.eq #+0x1c (addr 0x194a8cfb9ce0)
0x194a8cfb9cc8   9e8  6b0000df       cmp w6, w0
0x194a8cfb9ccc   9ec  540000a9       b.ls #+0x14 (addr 0x194a8cfb9ce0)
0x194a8cfb9cd0   9f0  6b00013f       cmp w9, w0
0x194a8cfb9cd4   9f4  54000069       b.ls #+0xc (addr 0x194a8cfb9ce0)
0x194a8cfb9cd8   9f8  6b0d001f       cmp w0, w13
0x194a8cfb9cdc   9fc  54000603       b.lo #+0xc0 (addr 0x194a8cfb9d9c)
0x194a8cfb9ce0   a00  510012f7       sub w23, w23, #0x4 (4)
0x194a8cfb9ce4   a04  34000c77       cbz w23, #+0x18c (addr 0x194a8cfb9e70)
0x194a8cfb9ce8   a08  110022a0       add w0, w21, #0x8 (8)
0x194a8cfb9cec   a0c  b8746a74       ldr w20, [x19, x20]
0x194a8cfb9cf0   a10  6b01029f       cmp w20, w1
0x194a8cfb9cf4   a14  540000e0       b.eq #+0x1c (addr 0x194a8cfb9d10)
0x194a8cfb9cf8   a18  6b1400df       cmp w6, w20
0x194a8cfb9cfc   a1c  540000a9       b.ls #+0x14 (addr 0x194a8cfb9d10)
0x194a8cfb9d00   a20  6b14013f       cmp w9, w20
0x194a8cfb9d04   a24  54000069       b.ls #+0xc (addr 0x194a8cfb9d10)
0x194a8cfb9d08   a28  6b0d029f       cmp w20, w13
0x194a8cfb9d0c   a2c  540003e3       b.lo #+0x7c (addr 0x194a8cfb9d88)
0x194a8cfb9d10   a30  510012f7       sub w23, w23, #0x4 (4)
0x194a8cfb9d14   a34  34000b37       cbz w23, #+0x164 (addr 0x194a8cfb9e78)
0x194a8cfb9d18   a38  110032b4       add w20, w21, #0xc (12)
0x194a8cfb9d1c   a3c  b8606a60       ldr w0, [x19, x0]
0x194a8cfb9d20   a40  6b01001f       cmp w0, w1
0x194a8cfb9d24   a44  540000e0       b.eq #+0x1c (addr 0x194a8cfb9d40)
0x194a8cfb9d28   a48  6b0000df       cmp w6, w0
0x194a8cfb9d2c   a4c  540000a9       b.ls #+0x14 (addr 0x194a8cfb9d40)
0x194a8cfb9d30   a50  6b00013f       cmp w9, w0
0x194a8cfb9d34   a54  54000069       b.ls #+0xc (addr 0x194a8cfb9d40)
0x194a8cfb9d38   a58  6b0d001f       cmp w0, w13
0x194a8cfb9d3c   a5c  54000303       b.lo #+0x60 (addr 0x194a8cfb9d9c)
0x194a8cfb9d40   a60  510012f7       sub w23, w23, #0x4 (4)
0x194a8cfb9d44   a64  34000977       cbz w23, #+0x12c (addr 0x194a8cfb9e70)
0x194a8cfb9d48   a68  f8520340       ldur x0, [x26, #-224]
0x194a8cfb9d4c   a6c  eb2063ff       cmp sp, x0
0x194a8cfb9d50   a70  54003c69       b.ls #+0x78c (addr 0x194a8cfba4dc)
0x194a8cfb9d54   a74  110042b5       add w21, w21, #0x10 (16)
0x194a8cfb9d58   a78  b8746a60       ldr w0, [x19, x20]
0x194a8cfb9d5c   a7c  6b01001f       cmp w0, w1
0x194a8cfb9d60   a80  540000e0       b.eq #+0x1c (addr 0x194a8cfb9d7c)
0x194a8cfb9d64   a84  6b0000df       cmp w6, w0
0x194a8cfb9d68   a88  540000a9       b.ls #+0x14 (addr 0x194a8cfb9d7c)
0x194a8cfb9d6c   a8c  6b00013f       cmp w9, w0
0x194a8cfb9d70   a90  54000069       b.ls #+0xc (addr 0x194a8cfb9d7c)
0x194a8cfb9d74   a94  6b0d001f       cmp w0, w13
0x194a8cfb9d78   a98  54000103       b.lo #+0x20 (addr 0x194a8cfb9d98)
0x194a8cfb9d7c   a9c  510012f7       sub w23, w23, #0x4 (4)
0x194a8cfb9d80   aa0  35fff9d7       cbnz w23, #-0xc8 (addr 0x194a8cfb9cb8)
0x194a8cfb9d84   aa4  1400003b       b #+0xec (addr 0x194a8cfb9e70)
0x194a8cfb9d88   aa8  aa0003f0       mov x16, x0
0x194a8cfb9d8c   aac  aa1403e0       mov x0, x20
0x194a8cfb9d90   ab0  aa1003f4       mov x20, x16
0x194a8cfb9d94   ab4  14000002       b #+0x8 (addr 0x194a8cfb9d9c)
0x194a8cfb9d98   ab8  aa1503f4       mov x20, x21
0x194a8cfb9d9c   abc  531e7400       lsl w0, w0, #2
0x194a8cfb9da0   ac0  0b000395       add w21, w28, w0
0x194a8cfb9da4   ac4  bc756a72       ldr s18, [x19, x21]
0x194a8cfb9da8   ac8  1e323993       fsub s19, s12, s18
0x194a8cfb9dac   acc  0b000075       add w21, w3, w0
0x194a8cfb9db0   ad0  bc756a74       ldr s20, [x19, x21]
0x194a8cfb9db4   ad4  1e343975       fsub s21, s11, s20
0x194a8cfb9db8   ad8  1e350ab6       fmul s22, s21, s21
0x194a8cfb9dbc   adc  1e330a77       fmul s23, s19, s19
0x194a8cfb9dc0   ae0  1e372ad6       fadd s22, s22, s23
0x194a8cfb9dc4   ae4  1e2722c0       fcmp s22, s7
0x194a8cfb9dc8   ae8  1e2f3d57       fcsel s23, s10, s15, lo
0x194a8cfb9dcc   aec  1e370a73       fmul s19, s19, s23
0x194a8cfb9dd0   af0  1e332a10       fadd s16, s16, s19
0x194a8cfb9dd4   af4  bc276a70       str s16, [x19, x7]
0x194a8cfb9dd8   af8  1e370ab3       fmul s19, s21, s23
0x194a8cfb9ddc   afc  1e3329ce       fadd s14, s14, s19
0x194a8cfb9de0   b00  bc2b6a6e       str s14, [x19, x11]
0x194a8cfb9de4   b04  1e2022c8       fcmp s22, #0.0
0x194a8cfb9de8   b08  9a9fd7eb       cset x11, gt
0x194a8cfb9dec   b0c  1e3620e0       fcmp s7, s22
0x194a8cfb9df0   b10  9a9f87f5       cset x21, ls
0x194a8cfb9df4   b14  1e2622c0       fcmp s22, s6
0x194a8cfb9df8   b18  9a9f27f7       cset x23, lo
0x194a8cfb9dfc   b1c  0a1702b5       and w21, w21, w23
0x194a8cfb9e00   b20  0a15016b       and w11, w11, w21
0x194a8cfb9e04   b24  1e230173       ucvtf s19, w11
0x194a8cfb9e08   b28  1e3329ad       fadd s13, s13, s19
0x194a8cfb9e0c   b2c  bc2f6a6d       str s13, [x19, x15]
0x194a8cfb9e10   b30  0b00036b       add w11, w27, w0
0x194a8cfb9e14   b34  0b000335       add w21, w25, w0
0x194a8cfb9e18   b38  4e040694       dup v20.4s, v20.s[0]
0x194a8cfb9e1c   b3c  6e0c0654       mov v20.s[1], v18.s[0]
0x194a8cfb9e20   b40  8b150275       add x21, x19, x21
0x194a8cfb9e24   b44  4d4082b4       ld1 {v20.s}[2], [x21]
0x194a8cfb9e28   b48  8b0b026b       add x11, x19, x11
0x194a8cfb9e2c   b4c  4d409174       ld1 {v20.s}[3], [x11]
0x194a8cfb9e30   b50  4e040672       dup v18.4s, v19.s[0]
0x194a8cfb9e34   b54  6e32de92       fmul v18.4s, v20.4s, v18.4s
0x194a8cfb9e38   b58  4e32d631       fadd v17.4s, v17.4s, v18.4s
0x194a8cfb9e3c   b5c  3ca26a71       str q17, [x19, x2]
0x194a8cfb9e40   b60  6b05029f       cmp w20, w5
0x194a8cfb9e44   b64  54000400       b.eq #+0x80 (addr 0x194a8cfb9ec4)
0x194a8cfb9e48   b68  d280002b       movz x11, #0x1
0x194a8cfb9e4c   b6c  aa1403f6       mov x22, x20
0x194a8cfb9e50   b70  f9407ff4       ldr x20, [sp, #248]
0x194a8cfb9e54   b74  f9407bf5       ldr x21, [sp, #240]
0x194a8cfb9e58   b78  f94057f7       ldr x23, [sp, #168]
0x194a8cfb9e5c   b7c  f9404bf8       ldr x24, [sp, #144]
0x194a8cfb9e60   b80  d2800000       movz x0, #0x0
0x194a8cfb9e64   b84  17fffebc       b #-0x510 (addr 0x194a8cfb9954)
0x194a8cfb9e68   b88  f9405bf6       ldr x22, [sp, #176]
0x194a8cfb9e6c   b8c  1400000e       b #+0x38 (addr 0x194a8cfb9ea4)
0x194a8cfb9e70   b90  aa0003f4       mov x20, x0
0x194a8cfb9e74   b94  14000002       b #+0x8 (addr 0x194a8cfb9e7c)
0x194a8cfb9e78   b98  f9407fea       ldr x10, [sp, #248]
0x194a8cfb9e7c   b9c  aa1403e0       mov x0, x20
0x194a8cfb9e80   ba0  14000011       b #+0x44 (addr 0x194a8cfb9ec4)
0x194a8cfb9e84   ba4  f94057ea       ldr x10, [sp, #168]
0x194a8cfb9e88   ba8  aa1703e0       mov x0, x23
0x194a8cfb9e8c   bac  f940e7e5       ldr x5, [sp, #456]
0x194a8cfb9e90   bb0  1400000d       b #+0x34 (addr 0x194a8cfb9ec4)
0x194a8cfb9e94   bb4  aa1703e0       mov x0, x23
0x194a8cfb9e98   bb8  f940e7e5       ldr x5, [sp, #456]
0x194a8cfb9e9c   bbc  1400000a       b #+0x28 (addr 0x194a8cfb9ec4)
0x194a8cfb9ea0   bc0  aa0003eb       mov x11, x0
0x194a8cfb9ea4   bc4  bc276a70       str s16, [x19, x7]
0x194a8cfb9ea8   bc8  9101110c       add x12, x8, #0x44 (68)
0x194a8cfb9eac   bcc  bc2c6a6e       str s14, [x19, x12]
0x194a8cfb9eb0   bd0  f940bbea       ldr x10, [sp, #368]
0x194a8cfb9eb4   bd4  bc2a6a6d       str s13, [x19, x10]
0x194a8cfb9eb8   bd8  f940bfec       ldr x12, [sp, #376]
0x194a8cfb9ebc   bdc  3cac6a71       str q17, [x19, x12]
0x194a8cfb9ec0   be0  aa0b03e0       mov x0, x11
0x194a8cfb9ec4   be4  1100410a       add w10, w8, #0x10 (16)
0x194a8cfb9ec8   be8  1100810b       add w11, w8, #0x20 (32)
0x194a8cfb9ecc   bec  1100c10c       add w12, w8, #0x30 (48)
0x194a8cfb9ed0   bf0  f90063f3       str x19, [sp, #192]
0x194a8cfb9ed4   bf4  f900e7e5       str x5, [sp, #456]
0x194a8cfb9ed8   bf8  f9008fe0       str x0, [sp, #280]
0x194a8cfb9edc   bfc  f940fbe7       ldr x7, [sp, #496]
0x194a8cfb9ee0   c00  aa0a03e0       mov x0, x10
0x194a8cfb9ee4   c04  f940cbe2       ldr x2, [sp, #400]
0x194a8cfb9ee8   c08  fd40c7e0       ldr d0, [sp, #392]
0x194a8cfb9eec   c0c  fd40c3e1       ldr d1, [sp, #384]
0x194a8cfb9ef0   c10  aa0b03e3       mov x3, x11
0x194a8cfb9ef4   c14  aa0803e4       mov x4, x8
0x194a8cfb9ef8   c18  aa0c03e5       mov x5, x12
0x194a8cfb9efc   c1c  97fbddea       bl #-0x108858 (addr 0x194a8ceb16a4)
0x194a8cfb9f00   c20  f940ebe1       ldr x1, [sp, #464]
0x194a8cfb9f04   c24  f940cfe6       ldr x6, [sp, #408]
0x194a8cfb9f08   c28  6b0100df       cmp w6, w1
0x194a8cfb9f0c   c2c  54000329       b.ls #+0x64 (addr 0x194a8cfb9f70)
0x194a8cfb9f10   c30  f940dfe8       ldr x8, [sp, #440]
0x194a8cfb9f14   c34  f940d3e9       ldr x9, [sp, #416]
0x194a8cfb9f18   c38  0b08012a       add w10, w9, w8
0x194a8cfb9f1c   c3c  f940f3eb       ldr x11, [sp, #480]
0x194a8cfb9f20   c40  9100416c       add x12, x11, #0x10 (16)
0x194a8cfb9f24   c44  f94063ed       ldr x13, [sp, #192]
0x194a8cfb9f28   c48  bc6c69a2       ldr s2, [x13, x12]
0x194a8cfb9f2c   c4c  bc2a69a2       str s2, [x13, x10]
0x194a8cfb9f30   c50  f940d7ea       ldr x10, [sp, #424]
0x194a8cfb9f34   c54  0b08014c       add w12, w10, w8
0x194a8cfb9f38   c58  9100516e       add x14, x11, #0x14 (20)
0x194a8cfb9f3c   c5c  bc6e69a2       ldr s2, [x13, x14]
0x194a8cfb9f40   c60  bc2c69a2       str s2, [x13, x12]
0x194a8cfb9f44   c64  f940dbec       ldr x12, [sp, #432]
0x194a8cfb9f48   c68  0b08018e       add w14, w12, w8
0x194a8cfb9f4c   c6c  9100616f       add x15, x11, #0x18 (24)
0x194a8cfb9f50   c70  bc6f69a2       ldr s2, [x13, x15]
0x194a8cfb9f54   c74  bc2e69a2       str s2, [x13, x14]
0x194a8cfb9f58   c78  f940e3ee       ldr x14, [sp, #448]
0x194a8cfb9f5c   c7c  0b0801c8       add w8, w14, w8
0x194a8cfb9f60   c80  9100716f       add x15, x11, #0x1c (28)
0x194a8cfb9f64   c84  bc6f69a2       ldr s2, [x13, x15]
0x194a8cfb9f68   c88  bc2869a2       str s2, [x13, x8]
0x194a8cfb9f6c   c8c  14000006       b #+0x18 (addr 0x194a8cfb9f84)
0x194a8cfb9f70   c90  f94063ed       ldr x13, [sp, #192]
0x194a8cfb9f74   c94  14000004       b #+0x10 (addr 0x194a8cfb9f84)
0x194a8cfb9f78   c98  f940cfe6       ldr x6, [sp, #408]
0x194a8cfb9f7c   c9c  f9008fe0       str x0, [sp, #280]
0x194a8cfb9f80   ca0  aa0403ed       mov x13, x4
0x194a8cfb9f84   ca4  11000421       add w1, w1, #0x1 (1)
0x194a8cfb9f88   ca8  f940efe8       ldr x8, [sp, #472]
0x194a8cfb9f8c   cac  6b08003f       cmp w1, w8
0x194a8cfb9f90   cb0  54ffb5e1       b.ne #-0x944 (addr 0x194a8cfb964c)
0x194a8cfb9f94   cb4  f940f3e1       ldr x1, [sp, #480]
0x194a8cfb9f98   cb8  11014021       add w1, w1, #0x50 (80)
0x194a8cfb9f9c   cbc  f940f7e6       ldr x6, [sp, #488]
0x194a8cfb9fa0   cc0  b90000c1       str w1, [x6]
0x194a8cfb9fa4   cc4  17fffd48       b #-0xae0 (addr 0x194a8cfb94c4)
0x194a8cfb9fa8   cc8  97fbdf0a       bl #-0x1083d8 (addr 0x194a8ceb1bd0)
0x194a8cfb9fac   ccc  f940fbe7       ldr x7, [sp, #496]
0x194a8cfb9fb0   cd0  f9408fe0       ldr x0, [sp, #280]
0x194a8cfb9fb4   cd4  f94063e1       ldr x1, [sp, #192]
0x194a8cfb9fb8   cd8  17fffcd5       b #-0xcac (addr 0x194a8cfb930c)
0x194a8cfb9fbc   cdc  1e6520a0       fcmp d5, d5
0x194a8cfb9fc0   ce0  54000080       b.eq #+0x10 (addr 0x194a8cfb9fd0)
0x194a8cfb9fc4   ce4  d280000c       movz x12, #0x0
0x194a8cfb9fc8   ce8  aa0c03eb       mov x11, x12
0x194a8cfb9fcc   cec  17fffd04       b #-0xbf0 (addr 0x194a8cfb93dc)
0x194a8cfb9fd0   cf0  1e202068       fcmp s3, #0.0
0x194a8cfb9fd4   cf4  54000063       b.lo #+0xc (addr 0x194a8cfb9fe0)
0x194a8cfb9fd8   cf8  9280000b       movn x11, #0x0
0x194a8cfb9fdc   cfc  17fffd00       b #-0xc00 (addr 0x194a8cfb93dc)
0x194a8cfb9fe0   d00  d280000b       movz x11, #0x0
0x194a8cfb9fe4   d04  17fffcfe       b #-0xc08 (addr 0x194a8cfb93dc)
0x194a8cfb9fe8   d08  1e6620c0       fcmp d6, d6
0x194a8cfb9fec   d0c  54000060       b.eq #+0xc (addr 0x194a8cfb9ff8)
0x194a8cfb9ff0   d10  d280000b       movz x11, #0x0
0x194a8cfb9ff4   d14  17fffd02       b #-0xbf8 (addr 0x194a8cfb93fc)
0x194a8cfb9ff8   d18  1e2020a8       fcmp s5, #0.0
0x194a8cfb9ffc   d1c  54ffffa3       b.lo #-0xc (addr 0x194a8cfb9ff0)
0x194a8cfba000   d20  9280000b       movn x11, #0x0
0x194a8cfba004   d24  17fffcfe       b #-0xc08 (addr 0x194a8cfb93fc)
0x194a8cfba008   d28  f9008fe0       str x0, [sp, #280]
0x194a8cfba00c   d2c  f900ebe1       str x1, [sp, #464]
0x194a8cfba010   d30  f90063e4       str x4, [sp, #192]
0x194a8cfba014   d34  97fbdeef       bl #-0x108444 (addr 0x194a8ceb1bd0)
0x194a8cfba018   d38  f940efe6       ldr x6, [sp, #472]
0x194a8cfba01c   d3c  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba020   d40  f9408fe0       ldr x0, [sp, #280]
0x194a8cfba024   d44  f94063e4       ldr x4, [sp, #192]
0x194a8cfba028   d48  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba02c   d4c  f940affb       ldr cp, [sp, #344]
0x194a8cfba030   d50  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba034   d54  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba038   d58  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba03c   d5c  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba040   d60  f94097fc       ldr x28, [sp, #296]
0x194a8cfba044   d64  f9408bed       ldr x13, [sp, #272]
0x194a8cfba048   d68  f94087e9       ldr x9, [sp, #264]
0x194a8cfba04c   d6c  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba050   d70  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba054   d74  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba058   d78  f94057f7       ldr x23, [sp, #168]
0x194a8cfba05c   d7c  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba060   d80  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba064   d84  3dc003e2       ldr q2, [sp]
0x194a8cfba068   d88  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba06c   d8c  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba070   d90  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba074   d94  f94037eb       ldr x11, [sp, #104]
0x194a8cfba078   d98  17fffd8f       b #-0x9c4 (addr 0x194a8cfb96b4)
0x194a8cfba07c   d9c  1e722240       fcmp d18, d18
0x194a8cfba080   da0  54000060       b.eq #+0xc (addr 0x194a8cfba08c)
0x194a8cfba084   da4  d2800000       movz x0, #0x0
0x194a8cfba088   da8  17fffdc5       b #-0x8ec (addr 0x194a8cfb979c)
0x194a8cfba08c   dac  1e2021a8       fcmp s13, #0.0
0x194a8cfba090   db0  54ffffa3       b.lo #-0xc (addr 0x194a8cfba084)
0x194a8cfba094   db4  92800000       movn x0, #0x0
0x194a8cfba098   db8  17fffdc1       b #-0x8fc (addr 0x194a8cfb979c)
0x194a8cfba09c   dbc  1e712220       fcmp d17, d17
0x194a8cfba0a0   dc0  54000060       b.eq #+0xc (addr 0x194a8cfba0ac)
0x194a8cfba0a4   dc4  d2800000       movz x0, #0x0
0x194a8cfba0a8   dc8  17fffdc5       b #-0x8ec (addr 0x194a8cfb97bc)
0x194a8cfba0ac   dcc  1e202208       fcmp s16, #0.0
0x194a8cfba0b0   dd0  54ffffa3       b.lo #-0xc (addr 0x194a8cfba0a4)
0x194a8cfba0b4   dd4  92800000       movn x0, #0x0
0x194a8cfba0b8   dd8  17fffdc1       b #-0x8fc (addr 0x194a8cfb97bc)
0x194a8cfba0bc   ddc  f900b7e7       str x7, [sp, #360]
0x194a8cfba0c0   de0  fd00a3eb       str d11, [sp, #320]
0x194a8cfba0c4   de4  fd009bec       str d12, [sp, #304]
0x194a8cfba0c8   de8  f9006be4       str x4, [sp, #208]
0x194a8cfba0cc   dec  f90053ee       str x14, [sp, #160]
0x194a8cfba0d0   df0  f9004fec       str x12, [sp, #152]
0x194a8cfba0d4   df4  f900e7e5       str x5, [sp, #456]
0x194a8cfba0d8   df8  fd003fed       str d13, [sp, #120]
0x194a8cfba0dc   dfc  f90083e2       str x2, [sp, #256]
0x194a8cfba0e0   e00  fd0033ee       str d14, [sp, #96]
0x194a8cfba0e4   e04  fd0027f0       str d16, [sp, #72]
0x194a8cfba0e8   e08  3d800ff1       str q17, [sp, #48]
0x194a8cfba0ec   e0c  f90063f3       str x19, [sp, #192]
0x194a8cfba0f0   e10  97fbdeb8       bl #-0x108520 (addr 0x194a8ceb1bd0)
0x194a8cfba0f4   e14  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba0f8   e18  f940efe6       ldr x6, [sp, #472]
0x194a8cfba0fc   e1c  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba100   e20  f94063f3       ldr x19, [sp, #192]
0x194a8cfba104   e24  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba108   e28  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba10c   e2c  f940affb       ldr cp, [sp, #344]
0x194a8cfba110   e30  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba114   e34  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba118   e38  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba11c   e3c  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba120   e40  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba124   e44  fd409bec       ldr d12, [sp, #304]
0x194a8cfba128   e48  f94097fc       ldr x28, [sp, #296]
0x194a8cfba12c   e4c  f9408bed       ldr x13, [sp, #272]
0x194a8cfba130   e50  f94087e9       ldr x9, [sp, #264]
0x194a8cfba134   e54  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba138   e58  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba13c   e5c  f9406be4       ldr x4, [sp, #208]
0x194a8cfba140   e60  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba144   e64  f94057f7       ldr x23, [sp, #168]
0x194a8cfba148   e68  f94053ee       ldr x14, [sp, #160]
0x194a8cfba14c   e6c  f9404fec       ldr x12, [sp, #152]
0x194a8cfba150   e70  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba154   e74  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba158   e78  fd403fed       ldr d13, [sp, #120]
0x194a8cfba15c   e7c  f94083e2       ldr x2, [sp, #256]
0x194a8cfba160   e80  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba164   e84  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba168   e88  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba16c   e8c  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba170   e90  3dc003e2       ldr q2, [sp]
0x194a8cfba174   e94  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba178   e98  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba17c   e9c  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba180   ea0  17fffdeb       b #-0x854 (addr 0x194a8cfb992c)
0x194a8cfba184   ea4  f900e7e5       str x5, [sp, #456]
0x194a8cfba188   ea8  f9008fe0       str x0, [sp, #280]
0x194a8cfba18c   eac  f900b7e7       str x7, [sp, #360]
0x194a8cfba190   eb0  fd003fed       str d13, [sp, #120]
0x194a8cfba194   eb4  fd0033ee       str d14, [sp, #96]
0x194a8cfba198   eb8  fd0027f0       str d16, [sp, #72]
0x194a8cfba19c   ebc  3d800ff1       str q17, [sp, #48]
0x194a8cfba1a0   ec0  fd00a3eb       str d11, [sp, #320]
0x194a8cfba1a4   ec4  fd009bec       str d12, [sp, #304]
0x194a8cfba1a8   ec8  f9003be2       str x2, [sp, #112]
0x194a8cfba1ac   ecc  f90093ef       str x15, [sp, #288]
0x194a8cfba1b0   ed0  f9006be4       str x4, [sp, #208]
0x194a8cfba1b4   ed4  f90053ee       str x14, [sp, #160]
0x194a8cfba1b8   ed8  f9004fec       str x12, [sp, #152]
0x194a8cfba1bc   edc  f90083eb       str x11, [sp, #256]
0x194a8cfba1c0   ee0  f90063f3       str x19, [sp, #192]
0x194a8cfba1c4   ee4  97fbde83       bl #-0x1085f4 (addr 0x194a8ceb1bd0)
0x194a8cfba1c8   ee8  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba1cc   eec  f940efe6       ldr x6, [sp, #472]
0x194a8cfba1d0   ef0  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba1d4   ef4  f94063f3       ldr x19, [sp, #192]
0x194a8cfba1d8   ef8  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba1dc   efc  f9408fe0       ldr x0, [sp, #280]
0x194a8cfba1e0   f00  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba1e4   f04  fd403fed       ldr d13, [sp, #120]
0x194a8cfba1e8   f08  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba1ec   f0c  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba1f0   f10  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba1f4   f14  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba1f8   f18  f940affb       ldr cp, [sp, #344]
0x194a8cfba1fc   f1c  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba200   f20  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba204   f24  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba208   f28  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba20c   f2c  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba210   f30  fd409bec       ldr d12, [sp, #304]
0x194a8cfba214   f34  f94097fc       ldr x28, [sp, #296]
0x194a8cfba218   f38  f9403be2       ldr x2, [sp, #112]
0x194a8cfba21c   f3c  f94093ef       ldr x15, [sp, #288]
0x194a8cfba220   f40  f9408bed       ldr x13, [sp, #272]
0x194a8cfba224   f44  f94087e9       ldr x9, [sp, #264]
0x194a8cfba228   f48  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba22c   f4c  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba230   f50  f9406be4       ldr x4, [sp, #208]
0x194a8cfba234   f54  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba238   f58  f94057f7       ldr x23, [sp, #168]
0x194a8cfba23c   f5c  f94053ee       ldr x14, [sp, #160]
0x194a8cfba240   f60  f9404fec       ldr x12, [sp, #152]
0x194a8cfba244   f64  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba248   f68  f94083eb       ldr x11, [sp, #256]
0x194a8cfba24c   f6c  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba250   f70  3dc003e2       ldr q2, [sp]
0x194a8cfba254   f74  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba258   f78  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba25c   f7c  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba260   f80  17fffdc4       b #-0x8f0 (addr 0x194a8cfb9970)
0x194a8cfba264   f84  f900b7e7       str x7, [sp, #360]
0x194a8cfba268   f88  fd00a3eb       str d11, [sp, #320]
0x194a8cfba26c   f8c  fd009bec       str d12, [sp, #304]
0x194a8cfba270   f90  3d800ff1       str q17, [sp, #48]
0x194a8cfba274   f94  fd003fed       str d13, [sp, #120]
0x194a8cfba278   f98  fd0033ee       str d14, [sp, #96]
0x194a8cfba27c   f9c  fd0027f0       str d16, [sp, #72]
0x194a8cfba280   fa0  f900e7e5       str x5, [sp, #456]
0x194a8cfba284   fa4  f9006be4       str x4, [sp, #208]
0x194a8cfba288   fa8  f9003be2       str x2, [sp, #112]
0x194a8cfba28c   fac  f9008fe0       str x0, [sp, #280]
0x194a8cfba290   fb0  f90053ee       str x14, [sp, #160]
0x194a8cfba294   fb4  f9004fec       str x12, [sp, #152]
0x194a8cfba298   fb8  f90063f3       str x19, [sp, #192]
0x194a8cfba29c   fbc  97fbde4d       bl #-0x1086cc (addr 0x194a8ceb1bd0)
0x194a8cfba2a0   fc0  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba2a4   fc4  f940efe6       ldr x6, [sp, #472]
0x194a8cfba2a8   fc8  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba2ac   fcc  f94063f3       ldr x19, [sp, #192]
0x194a8cfba2b0   fd0  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba2b4   fd4  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba2b8   fd8  f940affb       ldr cp, [sp, #344]
0x194a8cfba2bc   fdc  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba2c0   fe0  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba2c4   fe4  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba2c8   fe8  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba2cc   fec  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba2d0   ff0  fd409bec       ldr d12, [sp, #304]
0x194a8cfba2d4   ff4  f94097fc       ldr x28, [sp, #296]
0x194a8cfba2d8   ff8  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba2dc   ffc  fd403fed       ldr d13, [sp, #120]
0x194a8cfba2e0  1000  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba2e4  1004  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba2e8  1008  f9408bed       ldr x13, [sp, #272]
0x194a8cfba2ec  100c  f94087e9       ldr x9, [sp, #264]
0x194a8cfba2f0  1010  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba2f4  1014  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba2f8  1018  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba2fc  101c  f9406be4       ldr x4, [sp, #208]
0x194a8cfba300  1020  f9403be2       ldr x2, [sp, #112]
0x194a8cfba304  1024  f9408fe0       ldr x0, [sp, #280]
0x194a8cfba308  1028  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba30c  102c  f94057f7       ldr x23, [sp, #168]
0x194a8cfba310  1030  f94053ee       ldr x14, [sp, #160]
0x194a8cfba314  1034  f9404fec       ldr x12, [sp, #152]
0x194a8cfba318  1038  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba31c  103c  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba320  1040  3dc003e2       ldr q2, [sp]
0x194a8cfba324  1044  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba328  1048  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba32c  104c  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba330  1050  17fffdb6       b #-0x928 (addr 0x194a8cfb9a08)
0x194a8cfba334  1054  f900b7e7       str x7, [sp, #360]
0x194a8cfba338  1058  fd00a3eb       str d11, [sp, #320]
0x194a8cfba33c  105c  fd009bec       str d12, [sp, #304]
0x194a8cfba340  1060  3d800ff1       str q17, [sp, #48]
0x194a8cfba344  1064  fd003fed       str d13, [sp, #120]
0x194a8cfba348  1068  fd0033ee       str d14, [sp, #96]
0x194a8cfba34c  106c  fd0027f0       str d16, [sp, #72]
0x194a8cfba350  1070  f9006be4       str x4, [sp, #208]
0x194a8cfba354  1074  f900e7e5       str x5, [sp, #456]
0x194a8cfba358  1078  f90053ee       str x14, [sp, #160]
0x194a8cfba35c  107c  f9004fec       str x12, [sp, #152]
0x194a8cfba360  1080  f90093e2       str x2, [sp, #288]
0x194a8cfba364  1084  f90063f3       str x19, [sp, #192]
0x194a8cfba368  1088  97fbde1a       bl #-0x108798 (addr 0x194a8ceb1bd0)
0x194a8cfba36c  108c  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba370  1090  f940efe6       ldr x6, [sp, #472]
0x194a8cfba374  1094  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba378  1098  f94063f3       ldr x19, [sp, #192]
0x194a8cfba37c  109c  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba380  10a0  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba384  10a4  f940affb       ldr cp, [sp, #344]
0x194a8cfba388  10a8  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba38c  10ac  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba390  10b0  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba394  10b4  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba398  10b8  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba39c  10bc  fd409bec       ldr d12, [sp, #304]
0x194a8cfba3a0  10c0  f94097fc       ldr x28, [sp, #296]
0x194a8cfba3a4  10c4  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba3a8  10c8  fd403fed       ldr d13, [sp, #120]
0x194a8cfba3ac  10cc  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba3b0  10d0  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba3b4  10d4  f9408bed       ldr x13, [sp, #272]
0x194a8cfba3b8  10d8  f94087e9       ldr x9, [sp, #264]
0x194a8cfba3bc  10dc  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba3c0  10e0  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba3c4  10e4  f9406be4       ldr x4, [sp, #208]
0x194a8cfba3c8  10e8  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba3cc  10ec  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba3d0  10f0  f94057f7       ldr x23, [sp, #168]
0x194a8cfba3d4  10f4  f94053ee       ldr x14, [sp, #160]
0x194a8cfba3d8  10f8  f9404fec       ldr x12, [sp, #152]
0x194a8cfba3dc  10fc  f94093e2       ldr x2, [sp, #288]
0x194a8cfba3e0  1100  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba3e4  1104  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba3e8  1108  3dc003e2       ldr q2, [sp]
0x194a8cfba3ec  110c  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba3f0  1110  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba3f4  1114  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba3f8  1118  17fffd8b       b #-0x9d4 (addr 0x194a8cfb9a24)
0x194a8cfba3fc  111c  f900b7e7       str x7, [sp, #360]
0x194a8cfba400  1120  f900e7e5       str x5, [sp, #456]
0x194a8cfba404  1124  fd00a3eb       str d11, [sp, #320]
0x194a8cfba408  1128  fd009bec       str d12, [sp, #304]
0x194a8cfba40c  112c  f9003bea       str x10, [sp, #112]
0x194a8cfba410  1130  3d800ff1       str q17, [sp, #48]
0x194a8cfba414  1134  fd003fed       str d13, [sp, #120]
0x194a8cfba418  1138  fd0033ee       str d14, [sp, #96]
0x194a8cfba41c  113c  fd0027f0       str d16, [sp, #72]
0x194a8cfba420  1140  f9006be4       str x4, [sp, #208]
0x194a8cfba424  1144  f90067e0       str x0, [sp, #200]
0x194a8cfba428  1148  f90093eb       str x11, [sp, #288]
0x194a8cfba42c  114c  f9008fef       str x15, [sp, #280]
0x194a8cfba430  1150  f90053ee       str x14, [sp, #160]
0x194a8cfba434  1154  f9004fec       str x12, [sp, #152]
0x194a8cfba438  1158  f90063f3       str x19, [sp, #192]
0x194a8cfba43c  115c  97fbdde5       bl #-0x10886c (addr 0x194a8ceb1bd0)
0x194a8cfba440  1160  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba444  1164  f940efe6       ldr x6, [sp, #472]
0x194a8cfba448  1168  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba44c  116c  f94063f3       ldr x19, [sp, #192]
0x194a8cfba450  1170  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba454  1174  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba458  1178  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba45c  117c  f940affb       ldr cp, [sp, #344]
0x194a8cfba460  1180  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba464  1184  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba468  1188  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba46c  118c  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba470  1190  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba474  1194  fd409bec       ldr d12, [sp, #304]
0x194a8cfba478  1198  f94097fc       ldr x28, [sp, #296]
0x194a8cfba47c  119c  f9403bea       ldr x10, [sp, #112]
0x194a8cfba480  11a0  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba484  11a4  fd403fed       ldr d13, [sp, #120]
0x194a8cfba488  11a8  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba48c  11ac  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba490  11b0  f9408bed       ldr x13, [sp, #272]
0x194a8cfba494  11b4  f94087e9       ldr x9, [sp, #264]
0x194a8cfba498  11b8  f9407ff4       ldr x20, [sp, #248]
0x194a8cfba49c  11bc  f9407bf5       ldr x21, [sp, #240]
0x194a8cfba4a0  11c0  f9406be4       ldr x4, [sp, #208]
0x194a8cfba4a4  11c4  f94067e0       ldr x0, [sp, #200]
0x194a8cfba4a8  11c8  f94093eb       ldr x11, [sp, #288]
0x194a8cfba4ac  11cc  f9408fef       ldr x15, [sp, #280]
0x194a8cfba4b0  11d0  f9405bf6       ldr x22, [sp, #176]
0x194a8cfba4b4  11d4  f94057f7       ldr x23, [sp, #168]
0x194a8cfba4b8  11d8  f94053ee       ldr x14, [sp, #160]
0x194a8cfba4bc  11dc  f9404fec       ldr x12, [sp, #152]
0x194a8cfba4c0  11e0  f9404bf8       ldr x24, [sp, #144]
0x194a8cfba4c4  11e4  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba4c8  11e8  3dc003e2       ldr q2, [sp]
0x194a8cfba4cc  11ec  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba4d0  11f0  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba4d4  11f4  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba4d8  11f8  17fffd90       b #-0x9c0 (addr 0x194a8cfb9b18)
0x194a8cfba4dc  11fc  f900e7e5       str x5, [sp, #456]
0x194a8cfba4e0  1200  f900b7e7       str x7, [sp, #360]
0x194a8cfba4e4  1204  fd00a3eb       str d11, [sp, #320]
0x194a8cfba4e8  1208  fd009bec       str d12, [sp, #304]
0x194a8cfba4ec  120c  f9003bea       str x10, [sp, #112]
0x194a8cfba4f0  1210  3d800ff1       str q17, [sp, #48]
0x194a8cfba4f4  1214  fd003fed       str d13, [sp, #120]
0x194a8cfba4f8  1218  f90093eb       str x11, [sp, #288]
0x194a8cfba4fc  121c  fd0033ee       str d14, [sp, #96]
0x194a8cfba500  1220  fd0027f0       str d16, [sp, #72]
0x194a8cfba504  1224  f90067f4       str x20, [sp, #200]
0x194a8cfba508  1228  f9008ff7       str x23, [sp, #280]
0x194a8cfba50c  122c  f90083f5       str x21, [sp, #256]
0x194a8cfba510  1230  f9006be4       str x4, [sp, #208]
0x194a8cfba514  1234  f90053ee       str x14, [sp, #160]
0x194a8cfba518  1238  f9004fec       str x12, [sp, #152]
0x194a8cfba51c  123c  f90063f3       str x19, [sp, #192]
0x194a8cfba520  1240  97fbddac       bl #-0x108950 (addr 0x194a8ceb1bd0)
0x194a8cfba524  1244  f940f3e8       ldr x8, [sp, #480]
0x194a8cfba528  1248  f940efe6       ldr x6, [sp, #472]
0x194a8cfba52c  124c  f940ebe1       ldr x1, [sp, #464]
0x194a8cfba530  1250  f94063f3       ldr x19, [sp, #192]
0x194a8cfba534  1254  f940e7e5       ldr x5, [sp, #456]
0x194a8cfba538  1258  f940bfe2       ldr x2, [sp, #376]
0x194a8cfba53c  125c  f940bbef       ldr x15, [sp, #368]
0x194a8cfba540  1260  f940b7e7       ldr x7, [sp, #360]
0x194a8cfba544  1264  f940b3f9       ldr x25, [sp, #352]
0x194a8cfba548  1268  f940affb       ldr cp, [sp, #344]
0x194a8cfba54c  126c  fd40abe6       ldr d6, [sp, #336]
0x194a8cfba550  1270  fd40a7e7       ldr d7, [sp, #328]
0x194a8cfba554  1274  1e2e100a       fmov s10, #0x70 (1.0000)
0x194a8cfba558  1278  fd40a3eb       ldr d11, [sp, #320]
0x194a8cfba55c  127c  f9409fe3       ldr x3, [sp, #312]
0x194a8cfba560  1280  fd409bec       ldr d12, [sp, #304]
0x194a8cfba564  1284  f94097fc       ldr x28, [sp, #296]
0x194a8cfba568  1288  f9403bea       ldr x10, [sp, #112]
0x194a8cfba56c  128c  3dc00ff1       ldr q17, [sp, #48]
0x194a8cfba570  1290  fd403fed       ldr d13, [sp, #120]
0x194a8cfba574  1294  f94093eb       ldr x11, [sp, #288]
0x194a8cfba578  1298  fd4033ee       ldr d14, [sp, #96]
0x194a8cfba57c  129c  fd4027f0       ldr d16, [sp, #72]
0x194a8cfba580  12a0  f94067f4       ldr x20, [sp, #200]
0x194a8cfba584  12a4  f9408ff7       ldr x23, [sp, #280]
0x194a8cfba588  12a8  f9408bed       ldr x13, [sp, #272]
0x194a8cfba58c  12ac  f94087e9       ldr x9, [sp, #264]
0x194a8cfba590  12b0  f94083f5       ldr x21, [sp, #256]
0x194a8cfba594  12b4  f94077f8       ldr x24, [sp, #232]
0x194a8cfba598  12b8  f9406ff6       ldr x22, [sp, #216]
0x194a8cfba59c  12bc  f9406be4       ldr x4, [sp, #208]
0x194a8cfba5a0  12c0  f94053ee       ldr x14, [sp, #160]
0x194a8cfba5a4  12c4  f9404fec       ldr x12, [sp, #152]
0x194a8cfba5a8  12c8  3dc007e4       ldr q4, [sp, #16]
0x194a8cfba5ac  12cc  3dc003e2       ldr q2, [sp]
0x194a8cfba5b0  12d0  3dc017e3       ldr q3, [sp, #80]
0x194a8cfba5b4  12d4  3dc023e8       ldr q8, [sp, #128]
0x194a8cfba5b8  12d8  fd405fe5       ldr d5, [sp, #184]
0x194a8cfba5bc  12dc  17fffde6       b #-0x868 (addr 0x194a8cfb9d54)
0x194a8cfba5c0  12e0  d503201f       nop

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
       5ec         
       604         
       60c         
       620         
       69c         
       768         
       770         
       7a0         
       7d0         
       800         
       83c         
       89c         
       8ac         
       8f8         
       900         
       93c         
       944         
       94c         
       954         
       978         
       980         
       988         
       990         
       9a4         
       9ac         
       9dc         
       a0c         
       a3c         
       a78         
       ac4         
       ad0         
       af4         
       b00         
       b2c         
       b44         
       b4c         
       b5c         
       bc4         
       bcc         
       bd4         
       bdc         
       c48         
       c4c         
       c5c         
       c60         
       c70         
       c74         
       c84         
       c88         

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
       57c      1890
       588      1915
       5ac      1944
       5bc      1959
       5e8      1992
       600      2018
       608      2023
       61c      2040
       69c      1082
       768      1206
       770      1219
       7a0      1279
       89c      1683
       8ac      1701
       8f4      1760
       8fc      1765
       93c      1831
       944      1838
       948      1845
       950      1852
       978      1339
       980      1346
       984      1353
       98c      1360
       9a0      1371
       9a8      1378
       9dc      1440
       ac4      1501
       ad0      1526
       af4      1555
       b00      1570
       b2c      1603
       b40      1629
       b48      1634
       b5c      1651
       bc4      2051
       bcc      2058
       bd0      2065
       bd8      2072
       bf0      2100
       c44      2120
       c4c      2123
       c5c      2133
       c60      2136
       c70      2146
       c74      2149
       c84      2159
       c88      2162
       cc8         0
       d28       624
       ddc      1014
       ea4      1047
       f84      1143
      1054      1156
      111c      1264
      11fc      1425

Safepoints (stack slots = 66, entries = 1, byte size = 23)
0x194a8cfb94a0    1c0  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0x194a8cfb949c  internal wasm call
0x194a8cfb9efc  internal wasm call
0x194a8cfb9fa8  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba014  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba0f0  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba1c4  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba29c  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba368  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba43c  wasm stub call  (0x194a8ceb1bd0)
0x194a8cfba520  wasm stub call  (0x194a8ceb1bd0)
