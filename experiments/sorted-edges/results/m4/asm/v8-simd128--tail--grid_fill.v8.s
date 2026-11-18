name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2616 + 8 padding)
Instructions (size = 2600)
0x1de12ab1b1a0     0  d2800110       movz x16, #0x8
0x1de12ab1b1a4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x1de12ab1b1a8     8  a9017bfd       stp fp, lr, [sp, #16]
0x1de12ab1b1ac     c  910043fd       add fp, sp, #0x10 (16)
0x1de12ab1b1b0    10  d10243ff       sub sp, sp, #0x90 (144)
0x1de12ab1b1b4    14  f841f0e6       ldur x6, [x7, #31]
0x1de12ab1b1b8    18  f8520348       ldur x8, [x26, #-224]
0x1de12ab1b1bc    1c  f90013e0       str x0, [sp, #32]
0x1de12ab1b1c0    20  f90017e2       str x2, [sp, #40]
0x1de12ab1b1c4    24  f9001fe3       str x3, [sp, #56]
0x1de12ab1b1c8    28  f9001be4       str x4, [sp, #48]
0x1de12ab1b1cc    2c  f90027e5       str x5, [sp, #72]
0x1de12ab1b1d0    30  f9003fe6       str x6, [sp, #120]
0x1de12ab1b1d4    34  eb2863ff       cmp sp, x8
0x1de12ab1b1d8    38  54003c09       b.ls #+0x780 (addr 0x1de12ab1b958)
0x1de12ab1b1dc    3c  2a0003e8       mov w8, w0
0x1de12ab1b1e0    40  91002109       add x9, x8, #0x8 (8)
0x1de12ab1b1e4    44  b82968df       str wzr, [x6, x9]
0x1de12ab1b1e8    48  9100b10a       add x10, x8, #0x2c (44)
0x1de12ab1b1ec    4c  b86a68cb       ldr w11, [x6, x10]
0x1de12ab1b1f0    50  9100a10c       add x12, x8, #0x28 (40)
0x1de12ab1b1f4    54  b86c68cd       ldr w13, [x6, x12]
0x1de12ab1b1f8    58  1b0d7d6b       mul w11, w11, w13
0x1de12ab1b1fc    5c  1100056d       add w13, w11, #0x1 (1)
0x1de12ab1b200    60  f90043e8       str x8, [sp, #128]
0x1de12ab1b204    64  f90047e9       str x9, [sp, #136]
0x1de12ab1b208    68  f9000bea       str x10, [sp, #16]
0x1de12ab1b20c    6c  f9000fec       str x12, [sp, #24]
0x1de12ab1b210    70  f9002feb       str x11, [sp, #88]
0x1de12ab1b214    74  f9003bed       str x13, [sp, #112]
0x1de12ab1b218    78  3500006d       cbnz w13, #+0xc (addr 0x1de12ab1b224)
0x1de12ab1b21c    7c  d280000b       movz x11, #0x0
0x1de12ab1b220    80  14000047       b #+0x11c (addr 0x1de12ab1b33c)
0x1de12ab1b224    84  b86868ce       ldr w14, [x6, x8]
0x1de12ab1b228    88  6b0e01bf       cmp w13, w14
0x1de12ab1b22c    8c  540002a9       b.ls #+0x54 (addr 0x1de12ab1b280)
0x1de12ab1b230    90  aa0d03e3       mov x3, x13
0x1de12ab1b234    94  d2800002       movz x2, #0x0
0x1de12ab1b238    98  97fc0912       bl #-0xfdbb8 (addr 0x1de12aa1d680)
0x1de12ab1b23c    9c  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b240    a0  f94047e8       ldr x8, [sp, #136]
0x1de12ab1b244    a4  b86868c9       ldr w9, [x6, x8]
0x1de12ab1b248    a8  aa0903ee       mov x14, x9
0x1de12ab1b24c    ac  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b250    b0  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b254    b4  aa0803e9       mov x9, x8
0x1de12ab1b258    b8  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b25c    bc  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b260    c0  f9400bea       ldr x10, [sp, #16]
0x1de12ab1b264    c4  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b268    c8  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b26c    cc  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b270    d0  f94027e5       ldr x5, [sp, #72]
0x1de12ab1b274    d4  f9403bed       ldr x13, [sp, #112]
0x1de12ab1b278    d8  f9402feb       ldr x11, [sp, #88]
0x1de12ab1b27c    dc  14000002       b #+0x8 (addr 0x1de12ab1b284)
0x1de12ab1b280    e0  d280000e       movz x14, #0x0
0x1de12ab1b284    e4  9100110f       add x15, x8, #0x4 (4)
0x1de12ab1b288    e8  b86f68cf       ldr w15, [x6, x15]
0x1de12ab1b28c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x1de12ab1b290    f0  f90033ee       str x14, [sp, #96]
0x1de12ab1b294    f4  f90037ef       str x15, [sp, #104]
0x1de12ab1b298    f8  340004eb       cbz w11, #+0x9c (addr 0x1de12ab1b334)
0x1de12ab1b29c    fc  531e75b4       lsl w20, w13, #2
0x1de12ab1b2a0   100  51001294       sub w20, w20, #0x4 (4)
0x1de12ab1b2a4   104  34000394       cbz w20, #+0x70 (addr 0x1de12ab1b314)
0x1de12ab1b2a8   108  aa0703e0       mov x0, x7
0x1de12ab1b2ac   10c  d2800001       movz x1, #0x0
0x1de12ab1b2b0   110  aa1303e2       mov x2, x19
0x1de12ab1b2b4   114  aa1403e4       mov x4, x20
0x1de12ab1b2b8   118  aa0103e3       mov x3, x1
0x1de12ab1b2bc   11c  58004830       ldr x16, pc+2308 (addr 0x00001de12ab1bbc0)
0x1de12ab1b2c0   120  10000068       adr x8, #+0xc (addr 0x1de12ab1b2cc)
0x1de12ab1b2c4   124  a9027748       stp x8, fp, [x26, #32]
0x1de12ab1b2c8   128  d63f0200       blr x16
0x1de12ab1b2cc   12c  f900175f       str xzr, [x26, #40]
0x1de12ab1b2d0   130  6a00001f       tst w0, w0
0x1de12ab1b2d4   134  54004680       b.eq #+0x8d0 (addr 0x1de12ab1bba4)
0x1de12ab1b2d8   138  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b2dc   13c  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b2e0   140  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b2e4   144  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b2e8   148  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b2ec   14c  f9400bea       ldr x10, [sp, #16]
0x1de12ab1b2f0   150  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b2f4   154  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b2f8   158  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b2fc   15c  f94027e5       ldr x5, [sp, #72]
0x1de12ab1b300   160  f94047e9       ldr x9, [sp, #136]
0x1de12ab1b304   164  f94033ee       ldr x14, [sp, #96]
0x1de12ab1b308   168  f94037ef       ldr x15, [sp, #104]
0x1de12ab1b30c   16c  f9403bed       ldr x13, [sp, #112]
0x1de12ab1b310   170  f9402feb       ldr x11, [sp, #88]
0x1de12ab1b314   174  aa0e03f0       mov x16, x14
0x1de12ab1b318   178  aa0b03ee       mov x14, x11
0x1de12ab1b31c   17c  aa1003eb       mov x11, x16
0x1de12ab1b320   180  0b0e016e       add w14, w11, w14
0x1de12ab1b324   184  0b0d016b       add w11, w11, w13
0x1de12ab1b328   188  aa0f03ed       mov x13, x15
0x1de12ab1b32c   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x1de12ab1b330   190  51001173       sub w19, w11, #0x4 (4)
0x1de12ab1b334   194  b83368df       str wzr, [x6, x19]
0x1de12ab1b338   198  110005cb       add w11, w14, #0x1 (1)
0x1de12ab1b33c   19c  b82968cb       str w11, [x6, x9]
0x1de12ab1b340   1a0  aa0503e9       mov x9, x5
0x1de12ab1b344   1a4  6b03013f       cmp w9, w3
0x1de12ab1b348   1a8  1a83312d       csel w13, w9, w3, lo
0x1de12ab1b34c   1ac  d280000e       movz x14, #0x0
0x1de12ab1b350   1b0  f90037eb       str x11, [sp, #104]
0x1de12ab1b354   1b4  f90047ed       str x13, [sp, #136]
0x1de12ab1b358   1b8  350000cd       cbnz w13, #+0x18 (addr 0x1de12ab1b370)
0x1de12ab1b35c   1bc  91001109       add x9, x8, #0x4 (4)
0x1de12ab1b360   1c0  b86968c9       ldr w9, [x6, x9]
0x1de12ab1b364   1c4  aa0903f4       mov x20, x9
0x1de12ab1b368   1c8  aa0a03e9       mov x9, x10
0x1de12ab1b36c   1cc  14000047       b #+0x11c (addr 0x1de12ab1b488)
0x1de12ab1b370   1d0  aa0a03e9       mov x9, x10
0x1de12ab1b374   1d4  b86968ca       ldr w10, [x6, x9]
0x1de12ab1b378   1d8  7100015f       cmp w10, #0x0 (0)
0x1de12ab1b37c   1dc  9a9f07ef       cset x15, ne
0x1de12ab1b380   1e0  4b0f014a       sub w10, w10, w15
0x1de12ab1b384   1e4  b86c68cf       ldr w15, [x6, x12]
0x1de12ab1b388   1e8  710001ff       cmp w15, #0x0 (0)
0x1de12ab1b38c   1ec  9a9f07f3       cset x19, ne
0x1de12ab1b390   1f0  4b1301f3       sub w19, w15, w19
0x1de12ab1b394   1f4  91001114       add x20, x8, #0x4 (4)
0x1de12ab1b398   1f8  b87468d4       ldr w20, [x6, x20]
0x1de12ab1b39c   1fc  91009115       add x21, x8, #0x24 (36)
0x1de12ab1b3a0   200  bc7568c0       ldr s0, [x6, x21]
0x1de12ab1b3a4   204  aa0d03f5       mov x21, x13
0x1de12ab1b3a8   208  aa0403f6       mov x22, x4
0x1de12ab1b3ac   20c  aa0203f7       mov x23, x2
0x1de12ab1b3b0   210  d2800038       movz x24, #0x1
0x1de12ab1b3b4   214  f8520359       ldur x25, [x26, #-224]
0x1de12ab1b3b8   218  eb3963ff       cmp sp, x25
0x1de12ab1b3bc   21c  54002e09       b.ls #+0x5c0 (addr 0x1de12ab1b97c)
0x1de12ab1b3c0   220  2a1703f9       mov w25, w23
0x1de12ab1b3c4   224  bc7968c1       ldr s1, [x6, x25]
0x1de12ab1b3c8   228  1e200821       fmul s1, s1, s0
0x1de12ab1b3cc   22c  1e212020       fcmp s1, s1
0x1de12ab1b3d0   230  1e211de1       fcsel s1, s15, s1, ne
0x1de12ab1b3d4   234  1e202028       fcmp s1, #0.0
0x1de12ab1b3d8   238  1e2fcc21       fcsel s1, s1, s15, gt
0x1de12ab1b3dc   23c  1e254021       frintm s1, s1
0x1de12ab1b3e0   240  1e22c022       fcvt d2, s1
0x1de12ab1b3e4   244  1e65c043       frintz d3, d2
0x1de12ab1b3e8   248  1e790079       fcvtzu w25, d3
0x1de12ab1b3ec   24c  1e630324       ucvtf d4, w25
0x1de12ab1b3f0   250  1e642060       fcmp d3, d4
0x1de12ab1b3f4   254  54003021       b.ne #+0x604 (addr 0x1de12ab1b9f8)
0x1de12ab1b3f8   258  6b19027f       cmp w19, w25
0x1de12ab1b3fc   25c  1a99327b       csel w27, w19, w25, lo
0x1de12ab1b400   260  11000779       add w25, w27, #0x1 (1)
0x1de12ab1b404   264  52a9f010       movz w16, #0x4f800000
0x1de12ab1b408   268  1e270202       fmov s2, w16
0x1de12ab1b40c   26c  1e222020       fcmp s1, s2
0x1de12ab1b410   270  1a983339       csel w25, w25, w24, lo
0x1de12ab1b414   274  2a1603fb       mov w27, w22
0x1de12ab1b418   278  bc7b68c1       ldr s1, [x6, x27]
0x1de12ab1b41c   27c  1e200821       fmul s1, s1, s0
0x1de12ab1b420   280  1e212020       fcmp s1, s1
0x1de12ab1b424   284  1e211de1       fcsel s1, s15, s1, ne
0x1de12ab1b428   288  1e202028       fcmp s1, #0.0
0x1de12ab1b42c   28c  1e2fcc21       fcsel s1, s1, s15, gt
0x1de12ab1b430   290  1e254021       frintm s1, s1
0x1de12ab1b434   294  1e22c023       fcvt d3, s1
0x1de12ab1b438   298  1e65c064       frintz d4, d3
0x1de12ab1b43c   29c  1e79009b       fcvtzu w27, d4
0x1de12ab1b440   2a0  1e630365       ucvtf d5, w27
0x1de12ab1b444   2a4  1e652080       fcmp d4, d5
0x1de12ab1b448   2a8  54002e81       b.ne #+0x5d0 (addr 0x1de12ab1ba18)
0x1de12ab1b44c   2ac  6b1b015f       cmp w10, w27
0x1de12ab1b450   2b0  1a9b315c       csel w28, w10, w27, lo
0x1de12ab1b454   2b4  1e222020       fcmp s1, s2
0x1de12ab1b458   2b8  1a9f339b       csel w27, w28, wzr, lo
0x1de12ab1b45c   2bc  1b0f6779       madd w25, w27, w15, w25
0x1de12ab1b460   2c0  6b19017f       cmp w11, w25
0x1de12ab1b464   2c4  540000a9       b.ls #+0x14 (addr 0x1de12ab1b478)
0x1de12ab1b468   2c8  0b190a99       add w25, w20, w25, lsl #2
0x1de12ab1b46c   2cc  b87968db       ldr w27, [x6, x25]
0x1de12ab1b470   2d0  1100077b       add w27, w27, #0x1 (1)
0x1de12ab1b474   2d4  b83968db       str w27, [x6, x25]
0x1de12ab1b478   2d8  110012f7       add w23, w23, #0x4 (4)
0x1de12ab1b47c   2dc  110012d6       add w22, w22, #0x4 (4)
0x1de12ab1b480   2e0  510006b5       sub w21, w21, #0x1 (1)
0x1de12ab1b484   2e4  35fff995       cbnz w21, #-0xd0 (addr 0x1de12ab1b3b4)
0x1de12ab1b488   2e8  f90007f4       str x20, [sp, #8]
0x1de12ab1b48c   2ec  3500006b       cbnz w11, #+0xc (addr 0x1de12ab1b498)
0x1de12ab1b490   2f0  aa0e03ea       mov x10, x14
0x1de12ab1b494   2f4  1400008f       b #+0x23c (addr 0x1de12ab1b6d0)
0x1de12ab1b498   2f8  531e7565       lsl w5, w11, #2
0x1de12ab1b49c   2fc  510010aa       sub w10, w5, #0x4 (4)
0x1de12ab1b4a0   300  53027d4f       lsr w15, w10, #2
0x1de12ab1b4a4   304  110005ef       add w15, w15, #0x1 (1)
0x1de12ab1b4a8   308  120009f3       and w19, w15, #0x7
0x1de12ab1b4ac   30c  f90033e5       str x5, [sp, #96]
0x1de12ab1b4b0   310  7100715f       cmp w10, #0x1c (28)
0x1de12ab1b4b4   314  54000563       b.lo #+0xac (addr 0x1de12ab1b560)
0x1de12ab1b4b8   318  121d6dea       and w10, w15, #0x7ffffff8
0x1de12ab1b4bc   31c  aa1403ef       mov x15, x20
0x1de12ab1b4c0   320  aa0e03f5       mov x21, x14
0x1de12ab1b4c4   324  f8520356       ldur x22, [x26, #-224]
0x1de12ab1b4c8   328  eb3663ff       cmp sp, x22
0x1de12ab1b4cc   32c  54002b69       b.ls #+0x56c (addr 0x1de12ab1ba38)
0x1de12ab1b4d0   330  b86f68d6       ldr w22, [x6, x15]
0x1de12ab1b4d4   334  0b1502d5       add w21, w22, w21
0x1de12ab1b4d8   338  b82f68d5       str w21, [x6, x15]
0x1de12ab1b4dc   33c  110011f6       add w22, w15, #0x4 (4)
0x1de12ab1b4e0   340  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b4e4   344  0b1502f5       add w21, w23, w21
0x1de12ab1b4e8   348  b83668d5       str w21, [x6, x22]
0x1de12ab1b4ec   34c  110021f6       add w22, w15, #0x8 (8)
0x1de12ab1b4f0   350  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b4f4   354  0b1502f5       add w21, w23, w21
0x1de12ab1b4f8   358  b83668d5       str w21, [x6, x22]
0x1de12ab1b4fc   35c  110031f6       add w22, w15, #0xc (12)
0x1de12ab1b500   360  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b504   364  0b1502f5       add w21, w23, w21
0x1de12ab1b508   368  b83668d5       str w21, [x6, x22]
0x1de12ab1b50c   36c  110041f6       add w22, w15, #0x10 (16)
0x1de12ab1b510   370  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b514   374  0b1502f5       add w21, w23, w21
0x1de12ab1b518   378  b83668d5       str w21, [x6, x22]
0x1de12ab1b51c   37c  110051f6       add w22, w15, #0x14 (20)
0x1de12ab1b520   380  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b524   384  0b1502f5       add w21, w23, w21
0x1de12ab1b528   388  b83668d5       str w21, [x6, x22]
0x1de12ab1b52c   38c  110061f6       add w22, w15, #0x18 (24)
0x1de12ab1b530   390  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b534   394  0b1502f5       add w21, w23, w21
0x1de12ab1b538   398  b83668d5       str w21, [x6, x22]
0x1de12ab1b53c   39c  110071f6       add w22, w15, #0x1c (28)
0x1de12ab1b540   3a0  b87668d7       ldr w23, [x6, x22]
0x1de12ab1b544   3a4  0b1502f5       add w21, w23, w21
0x1de12ab1b548   3a8  b83668d5       str w21, [x6, x22]
0x1de12ab1b54c   3ac  110081ef       add w15, w15, #0x20 (32)
0x1de12ab1b550   3b0  5100214a       sub w10, w10, #0x8 (8)
0x1de12ab1b554   3b4  35fffb8a       cbnz w10, #-0x90 (addr 0x1de12ab1b4c4)
0x1de12ab1b558   3b8  35000093       cbnz w19, #+0x10 (addr 0x1de12ab1b568)
0x1de12ab1b55c   3bc  1400001f       b #+0x7c (addr 0x1de12ab1b5d8)
0x1de12ab1b560   3c0  aa0e03f5       mov x21, x14
0x1de12ab1b564   3c4  aa1403ef       mov x15, x20
0x1de12ab1b568   3c8  531e766a       lsl w10, w19, #2
0x1de12ab1b56c   3cc  b86f68d3       ldr w19, [x6, x15]
0x1de12ab1b570   3d0  0b150273       add w19, w19, w21
0x1de12ab1b574   3d4  b82f68d3       str w19, [x6, x15]
0x1de12ab1b578   3d8  110011ef       add w15, w15, #0x4 (4)
0x1de12ab1b57c   3dc  5100114a       sub w10, w10, #0x4 (4)
0x1de12ab1b580   3e0  340002ca       cbz w10, #+0x58 (addr 0x1de12ab1b5d8)
0x1de12ab1b584   3e4  b86f68d5       ldr w21, [x6, x15]
0x1de12ab1b588   3e8  0b1302b3       add w19, w21, w19
0x1de12ab1b58c   3ec  b82f68d3       str w19, [x6, x15]
0x1de12ab1b590   3f0  110011ef       add w15, w15, #0x4 (4)
0x1de12ab1b594   3f4  5100114a       sub w10, w10, #0x4 (4)
0x1de12ab1b598   3f8  3400020a       cbz w10, #+0x40 (addr 0x1de12ab1b5d8)
0x1de12ab1b59c   3fc  b86f68d5       ldr w21, [x6, x15]
0x1de12ab1b5a0   400  0b1302b3       add w19, w21, w19
0x1de12ab1b5a4   404  b82f68d3       str w19, [x6, x15]
0x1de12ab1b5a8   408  110011ef       add w15, w15, #0x4 (4)
0x1de12ab1b5ac   40c  5100114a       sub w10, w10, #0x4 (4)
0x1de12ab1b5b0   410  3400014a       cbz w10, #+0x28 (addr 0x1de12ab1b5d8)
0x1de12ab1b5b4   414  f8520355       ldur x21, [x26, #-224]
0x1de12ab1b5b8   418  eb3563ff       cmp sp, x21
0x1de12ab1b5bc   41c  540026e9       b.ls #+0x4dc (addr 0x1de12ab1ba98)
0x1de12ab1b5c0   420  b86f68d5       ldr w21, [x6, x15]
0x1de12ab1b5c4   424  0b1302b5       add w21, w21, w19
0x1de12ab1b5c8   428  b82f68d5       str w21, [x6, x15]
0x1de12ab1b5cc   42c  110011ef       add w15, w15, #0x4 (4)
0x1de12ab1b5d0   430  5100114a       sub w10, w10, #0x4 (4)
0x1de12ab1b5d4   434  35fffcca       cbnz w10, #-0x68 (addr 0x1de12ab1b56c)
0x1de12ab1b5d8   438  9100510a       add x10, x8, #0x14 (20)
0x1de12ab1b5dc   43c  b82a68df       str wzr, [x6, x10]
0x1de12ab1b5e0   440  9100310f       add x15, x8, #0xc (12)
0x1de12ab1b5e4   444  b86f68cf       ldr w15, [x6, x15]
0x1de12ab1b5e8   448  f9003bea       str x10, [sp, #112]
0x1de12ab1b5ec   44c  6b0f017f       cmp w11, w15
0x1de12ab1b5f0   450  54000309       b.ls #+0x60 (addr 0x1de12ab1b650)
0x1de12ab1b5f4   454  aa0003ef       mov x15, x0
0x1de12ab1b5f8   458  110031e0       add w0, w15, #0xc (12)
0x1de12ab1b5fc   45c  aa0b03e3       mov x3, x11
0x1de12ab1b600   460  aa0e03e2       mov x2, x14
0x1de12ab1b604   464  97fc081f       bl #-0xfdf84 (addr 0x1de12aa1d680)
0x1de12ab1b608   468  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b60c   46c  f9403be8       ldr x8, [sp, #112]
0x1de12ab1b610   470  b86868c8       ldr w8, [x6, x8]
0x1de12ab1b614   474  aa0803ea       mov x10, x8
0x1de12ab1b618   478  f94047ed       ldr x13, [sp, #136]
0x1de12ab1b61c   47c  d280000e       movz x14, #0x0
0x1de12ab1b620   480  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b624   484  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b628   488  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b62c   48c  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b630   490  f9400be9       ldr x9, [sp, #16]
0x1de12ab1b634   494  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b638   498  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b63c   49c  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b640   4a0  f94037eb       ldr x11, [sp, #104]
0x1de12ab1b644   4a4  f94033e5       ldr x5, [sp, #96]
0x1de12ab1b648   4a8  f94007f4       ldr x20, [sp, #8]
0x1de12ab1b64c   4ac  14000002       b #+0x8 (addr 0x1de12ab1b654)
0x1de12ab1b650   4b0  aa0e03ea       mov x10, x14
0x1de12ab1b654   4b4  531e756f       lsl w15, w11, #2
0x1de12ab1b658   4b8  f9003bea       str x10, [sp, #112]
0x1de12ab1b65c   4bc  340003af       cbz w15, #+0x74 (addr 0x1de12ab1b6d0)
0x1de12ab1b660   4c0  9100410f       add x15, x8, #0x10 (16)
0x1de12ab1b664   4c4  b86f68cf       ldr w15, [x6, x15]
0x1de12ab1b668   4c8  0b0a09ef       add w15, w15, w10, lsl #2
0x1de12ab1b66c   4cc  aa0703e0       mov x0, x7
0x1de12ab1b670   4d0  aa0e03e1       mov x1, x14
0x1de12ab1b674   4d4  aa0e03e2       mov x2, x14
0x1de12ab1b678   4d8  aa0f03e3       mov x3, x15
0x1de12ab1b67c   4dc  aa1403e4       mov x4, x20
0x1de12ab1b680   4e0  580029d0       ldr x16, pc+1336 (addr 0x00001de12ab1bbb8)
0x1de12ab1b684   4e4  10000068       adr x8, #+0xc (addr 0x1de12ab1b690)
0x1de12ab1b688   4e8  a9027748       stp x8, fp, [x26, #32]
0x1de12ab1b68c   4ec  d63f0200       blr x16
0x1de12ab1b690   4f0  f900175f       str xzr, [x26, #40]
0x1de12ab1b694   4f4  6a00001f       tst w0, w0
0x1de12ab1b698   4f8  54002840       b.eq #+0x508 (addr 0x1de12ab1bba0)
0x1de12ab1b69c   4fc  f9403bea       ldr x10, [sp, #112]
0x1de12ab1b6a0   500  f94047ed       ldr x13, [sp, #136]
0x1de12ab1b6a4   504  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b6a8   508  d280000e       movz x14, #0x0
0x1de12ab1b6ac   50c  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b6b0   510  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b6b4   514  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b6b8   518  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b6bc   51c  f9400be9       ldr x9, [sp, #16]
0x1de12ab1b6c0   520  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b6c4   524  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b6c8   528  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b6cc   52c  f94037eb       ldr x11, [sp, #104]
0x1de12ab1b6d0   530  9100810f       add x15, x8, #0x20 (32)
0x1de12ab1b6d4   534  b82f68df       str wzr, [x6, x15]
0x1de12ab1b6d8   538  0b0b014a       add w10, w10, w11
0x1de12ab1b6dc   53c  9100510b       add x11, x8, #0x14 (20)
0x1de12ab1b6e0   540  b82b68ca       str w10, [x6, x11]
0x1de12ab1b6e4   544  f9003bef       str x15, [sp, #112]
0x1de12ab1b6e8   548  f9002feb       str x11, [sp, #88]
0x1de12ab1b6ec   54c  35000063       cbnz w3, #+0xc (addr 0x1de12ab1b6f8)
0x1de12ab1b6f0   550  aa0e03ea       mov x10, x14
0x1de12ab1b6f4   554  14000048       b #+0x120 (addr 0x1de12ab1b814)
0x1de12ab1b6f8   558  9100610a       add x10, x8, #0x18 (24)
0x1de12ab1b6fc   55c  b86a68ca       ldr w10, [x6, x10]
0x1de12ab1b700   560  6b0a007f       cmp w3, w10
0x1de12ab1b704   564  540002a9       b.ls #+0x54 (addr 0x1de12ab1b758)
0x1de12ab1b708   568  aa0003ea       mov x10, x0
0x1de12ab1b70c   56c  11006140       add w0, w10, #0x18 (24)
0x1de12ab1b710   570  aa0e03e2       mov x2, x14
0x1de12ab1b714   574  97fc07db       bl #-0xfe094 (addr 0x1de12aa1d680)
0x1de12ab1b718   578  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b71c   57c  f9403be8       ldr x8, [sp, #112]
0x1de12ab1b720   580  b86868c9       ldr w9, [x6, x8]
0x1de12ab1b724   584  aa0903ea       mov x10, x9
0x1de12ab1b728   588  f94047ed       ldr x13, [sp, #136]
0x1de12ab1b72c   58c  d280000e       movz x14, #0x0
0x1de12ab1b730   590  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b734   594  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b738   598  aa0803ef       mov x15, x8
0x1de12ab1b73c   59c  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b740   5a0  f9402feb       ldr x11, [sp, #88]
0x1de12ab1b744   5a4  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b748   5a8  f9400be9       ldr x9, [sp, #16]
0x1de12ab1b74c   5ac  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b750   5b0  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b754   5b4  14000002       b #+0x8 (addr 0x1de12ab1b75c)
0x1de12ab1b758   5b8  aa0e03ea       mov x10, x14
0x1de12ab1b75c   5bc  91007113       add x19, x8, #0x1c (28)
0x1de12ab1b760   5c0  b87368d3       ldr w19, [x6, x19]
0x1de12ab1b764   5c4  0b0a0a74       add w20, w19, w10, lsl #2
0x1de12ab1b768   5c8  f90037ea       str x10, [sp, #104]
0x1de12ab1b76c   5cc  f90033f3       str x19, [sp, #96]
0x1de12ab1b770   5d0  aa0303f5       mov x21, x3
0x1de12ab1b774   5d4  710006bf       cmp w21, #0x1 (1)
0x1de12ab1b778   5d8  540004a0       b.eq #+0x94 (addr 0x1de12ab1b80c)
0x1de12ab1b77c   5dc  531e76b6       lsl w22, w21, #2
0x1de12ab1b780   5e0  510012d6       sub w22, w22, #0x4 (4)
0x1de12ab1b784   5e4  34000356       cbz w22, #+0x68 (addr 0x1de12ab1b7ec)
0x1de12ab1b788   5e8  aa0703e0       mov x0, x7
0x1de12ab1b78c   5ec  aa0e03e1       mov x1, x14
0x1de12ab1b790   5f0  aa1403e2       mov x2, x20
0x1de12ab1b794   5f4  aa0e03e3       mov x3, x14
0x1de12ab1b798   5f8  aa1603e4       mov x4, x22
0x1de12ab1b79c   5fc  58002130       ldr x16, pc+1060 (addr 0x00001de12ab1bbc0)    ;; external reference (wasm::memory_fill)
0x1de12ab1b7a0   600  10000068       adr x8, #+0xc (addr 0x1de12ab1b7ac)
0x1de12ab1b7a4   604  a9027748       stp x8, fp, [x26, #32]
0x1de12ab1b7a8   608  d63f0200       blr x16
0x1de12ab1b7ac   60c  f900175f       str xzr, [x26, #40]
0x1de12ab1b7b0   610  6a00001f       tst w0, w0
0x1de12ab1b7b4   614  54001f40       b.eq #+0x3e8 (addr 0x1de12ab1bb9c)
0x1de12ab1b7b8   618  f94047ed       ldr x13, [sp, #136]
0x1de12ab1b7bc   61c  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b7c0   620  d280000e       movz x14, #0x0
0x1de12ab1b7c4   624  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b7c8   628  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b7cc   62c  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b7d0   630  f9402feb       ldr x11, [sp, #88]
0x1de12ab1b7d4   634  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b7d8   638  f9400be9       ldr x9, [sp, #16]
0x1de12ab1b7dc   63c  f9403bef       ldr x15, [sp, #112]
0x1de12ab1b7e0   640  f94037ea       ldr x10, [sp, #104]
0x1de12ab1b7e4   644  f94033f3       ldr x19, [sp, #96]
0x1de12ab1b7e8   648  f9401ff5       ldr x21, [sp, #56]
0x1de12ab1b7ec   64c  aa1503f4       mov x20, x21
0x1de12ab1b7f0   650  0b14014a       add w10, w10, w20
0x1de12ab1b7f4   654  51000554       sub w20, w10, #0x1 (1)
0x1de12ab1b7f8   658  0b0a0a6a       add w10, w19, w10, lsl #2
0x1de12ab1b7fc   65c  5100114a       sub w10, w10, #0x4 (4)
0x1de12ab1b800   660  aa0a03f0       mov x16, x10
0x1de12ab1b804   664  aa1403ea       mov x10, x20
0x1de12ab1b808   668  aa1003f4       mov x20, x16
0x1de12ab1b80c   66c  b83468df       str wzr, [x6, x20]
0x1de12ab1b810   670  1100054a       add w10, w10, #0x1 (1)
0x1de12ab1b814   674  b82f68ca       str w10, [x6, x15]
0x1de12ab1b818   678  3500008d       cbnz w13, #+0x10 (addr 0x1de12ab1b828)
0x1de12ab1b81c   67c  910003bf       mov sp, fp
0x1de12ab1b820   680  a8c17bfd       ldp fp, lr, [sp], #16
0x1de12ab1b824   684  d65f03c0       ret
0x1de12ab1b828   688  b86968c9       ldr w9, [x6, x9]
0x1de12ab1b82c   68c  7100013f       cmp w9, #0x0 (0)
0x1de12ab1b830   690  9a9f07ef       cset x15, ne
0x1de12ab1b834   694  4b0f0129       sub w9, w9, w15
0x1de12ab1b838   698  b86c68cc       ldr w12, [x6, x12]
0x1de12ab1b83c   69c  7100019f       cmp w12, #0x0 (0)
0x1de12ab1b840   6a0  9a9f07ef       cset x15, ne
0x1de12ab1b844   6a4  4b0f018f       sub w15, w12, w15
0x1de12ab1b848   6a8  91007113       add x19, x8, #0x1c (28)
0x1de12ab1b84c   6ac  b87368d3       ldr w19, [x6, x19]
0x1de12ab1b850   6b0  91004114       add x20, x8, #0x10 (16)
0x1de12ab1b854   6b4  b87468d4       ldr w20, [x6, x20]
0x1de12ab1b858   6b8  b86b68cb       ldr w11, [x6, x11]
0x1de12ab1b85c   6bc  91009108       add x8, x8, #0x24 (36)
0x1de12ab1b860   6c0  bc6868c0       ldr s0, [x6, x8]
0x1de12ab1b864   6c4  aa0e03e8       mov x8, x14
0x1de12ab1b868   6c8  f8520355       ldur x21, [x26, #-224]
0x1de12ab1b86c   6cc  eb3563ff       cmp sp, x21
0x1de12ab1b870   6d0  54001409       b.ls #+0x280 (addr 0x1de12ab1baf0)
0x1de12ab1b874   6d4  2a0403f5       mov w21, w4
0x1de12ab1b878   6d8  bc7568c1       ldr s1, [x6, x21]
0x1de12ab1b87c   6dc  1e200821       fmul s1, s1, s0
0x1de12ab1b880   6e0  1e212020       fcmp s1, s1
0x1de12ab1b884   6e4  1e211de1       fcsel s1, s15, s1, ne
0x1de12ab1b888   6e8  1e202028       fcmp s1, #0.0
0x1de12ab1b88c   6ec  1e2fcc21       fcsel s1, s1, s15, gt
0x1de12ab1b890   6f0  1e254021       frintm s1, s1
0x1de12ab1b894   6f4  1e22c022       fcvt d2, s1
0x1de12ab1b898   6f8  1e65c043       frintz d3, d2
0x1de12ab1b89c   6fc  1e790075       fcvtzu w21, d3
0x1de12ab1b8a0   700  1e6302a4       ucvtf d4, w21
0x1de12ab1b8a4   704  1e642060       fcmp d3, d4
0x1de12ab1b8a8   708  540015a1       b.ne #+0x2b4 (addr 0x1de12ab1bb5c)
0x1de12ab1b8ac   70c  6b15013f       cmp w9, w21
0x1de12ab1b8b0   710  1a953136       csel w22, w9, w21, lo
0x1de12ab1b8b4   714  52a9f010       movz w16, #0x4f800000
0x1de12ab1b8b8   718  1e270202       fmov s2, w16
0x1de12ab1b8bc   71c  1e222020       fcmp s1, s2
0x1de12ab1b8c0   720  1a9f32d5       csel w21, w22, wzr, lo
0x1de12ab1b8c4   724  1b0c7eb5       mul w21, w21, w12
0x1de12ab1b8c8   728  2a0203f6       mov w22, w2
0x1de12ab1b8cc   72c  bc7668c1       ldr s1, [x6, x22]
0x1de12ab1b8d0   730  1e200821       fmul s1, s1, s0
0x1de12ab1b8d4   734  1e212020       fcmp s1, s1
0x1de12ab1b8d8   738  1e211de1       fcsel s1, s15, s1, ne
0x1de12ab1b8dc   73c  1e202028       fcmp s1, #0.0
0x1de12ab1b8e0   740  1e2fcc21       fcsel s1, s1, s15, gt
0x1de12ab1b8e4   744  1e254021       frintm s1, s1
0x1de12ab1b8e8   748  1e22c023       fcvt d3, s1
0x1de12ab1b8ec   74c  1e65c064       frintz d4, d3
0x1de12ab1b8f0   750  1e790096       fcvtzu w22, d4
0x1de12ab1b8f4   754  1e6302c5       ucvtf d5, w22
0x1de12ab1b8f8   758  1e652080       fcmp d4, d5
0x1de12ab1b8fc   75c  54001401       b.ne #+0x280 (addr 0x1de12ab1bb7c)
0x1de12ab1b900   760  6b1601ff       cmp w15, w22
0x1de12ab1b904   764  1a9631f7       csel w23, w15, w22, lo
0x1de12ab1b908   768  1e222020       fcmp s1, s2
0x1de12ab1b90c   76c  1a9f32f6       csel w22, w23, wzr, lo
0x1de12ab1b910   770  0b1602b5       add w21, w21, w22
0x1de12ab1b914   774  6b15017f       cmp w11, w21
0x1de12ab1b918   778  54000149       b.ls #+0x28 (addr 0x1de12ab1b940)
0x1de12ab1b91c   77c  0b150a95       add w21, w20, w21, lsl #2
0x1de12ab1b920   780  b87568d6       ldr w22, [x6, x21]
0x1de12ab1b924   784  6b16015f       cmp w10, w22
0x1de12ab1b928   788  54000089       b.ls #+0x10 (addr 0x1de12ab1b938)
0x1de12ab1b92c   78c  0b160a76       add w22, w19, w22, lsl #2
0x1de12ab1b930   790  b83668c8       str w8, [x6, x22]
0x1de12ab1b934   794  b87568d6       ldr w22, [x6, x21]
0x1de12ab1b938   798  110006d6       add w22, w22, #0x1 (1)
0x1de12ab1b93c   79c  b83568d6       str w22, [x6, x21]
0x1de12ab1b940   7a0  11001042       add w2, w2, #0x4 (4)
0x1de12ab1b944   7a4  11001084       add w4, w4, #0x4 (4)
0x1de12ab1b948   7a8  11000508       add w8, w8, #0x1 (1)
0x1de12ab1b94c   7ac  6b0801bf       cmp w13, w8
0x1de12ab1b950   7b0  54fff660       b.eq #-0x134 (addr 0x1de12ab1b81c)
0x1de12ab1b954   7b4  17ffffc5       b #-0xec (addr 0x1de12ab1b868)
0x1de12ab1b958   7b8  97fc089e       bl #-0xfdd88 (addr 0x1de12aa1dbd0)
0x1de12ab1b95c   7bc  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b960   7c0  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b964   7c4  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b968   7c8  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b96c   7cc  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b970   7d0  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b974   7d4  f94027e5       ldr x5, [sp, #72]
0x1de12ab1b978   7d8  17fffe19       b #-0x79c (addr 0x1de12ab1b1dc)
0x1de12ab1b97c   7dc  f90007f4       str x20, [sp, #8]
0x1de12ab1b980   7e0  f9003bf5       str x21, [sp, #112]
0x1de12ab1b984   7e4  f90023f6       str x22, [sp, #64]
0x1de12ab1b988   7e8  f90003f7       str x23, [sp]
0x1de12ab1b98c   7ec  f90033ef       str x15, [sp, #96]
0x1de12ab1b990   7f0  f9002fea       str x10, [sp, #88]
0x1de12ab1b994   7f4  fd002be0       str d0, [sp, #80]
0x1de12ab1b998   7f8  f90027f3       str x19, [sp, #72]
0x1de12ab1b99c   7fc  97fc088d       bl #-0xfddcc (addr 0x1de12aa1dbd0)
0x1de12ab1b9a0   800  f94047ed       ldr x13, [sp, #136]
0x1de12ab1b9a4   804  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1b9a8   808  d280000e       movz x14, #0x0
0x1de12ab1b9ac   80c  f9401be4       ldr x4, [sp, #48]
0x1de12ab1b9b0   810  f94017e2       ldr x2, [sp, #40]
0x1de12ab1b9b4   814  f94043e8       ldr x8, [sp, #128]
0x1de12ab1b9b8   818  f9400fec       ldr x12, [sp, #24]
0x1de12ab1b9bc   81c  f9400be9       ldr x9, [sp, #16]
0x1de12ab1b9c0   820  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1b9c4   824  f9404be7       ldr x7, [sp, #144]
0x1de12ab1b9c8   828  f94013e0       ldr x0, [sp, #32]
0x1de12ab1b9cc   82c  f94037eb       ldr x11, [sp, #104]
0x1de12ab1b9d0   830  f94007f4       ldr x20, [sp, #8]
0x1de12ab1b9d4   834  f9403bf5       ldr x21, [sp, #112]
0x1de12ab1b9d8   838  f94023f6       ldr x22, [sp, #64]
0x1de12ab1b9dc   83c  f94003f7       ldr x23, [sp]
0x1de12ab1b9e0   840  f94033ef       ldr x15, [sp, #96]
0x1de12ab1b9e4   844  f9402fea       ldr x10, [sp, #88]
0x1de12ab1b9e8   848  fd402be0       ldr d0, [sp, #80]
0x1de12ab1b9ec   84c  d2800038       movz x24, #0x1
0x1de12ab1b9f0   850  f94027f3       ldr x19, [sp, #72]
0x1de12ab1b9f4   854  17fffe73       b #-0x634 (addr 0x1de12ab1b3c0)
0x1de12ab1b9f8   858  1e622040       fcmp d2, d2
0x1de12ab1b9fc   85c  54000060       b.eq #+0xc (addr 0x1de12ab1ba08)
0x1de12ab1ba00   860  aa0e03f9       mov x25, x14
0x1de12ab1ba04   864  17fffe7d       b #-0x60c (addr 0x1de12ab1b3f8)
0x1de12ab1ba08   868  1e202028       fcmp s1, #0.0
0x1de12ab1ba0c   86c  54ffffa3       b.lo #-0xc (addr 0x1de12ab1ba00)
0x1de12ab1ba10   870  92800019       movn x25, #0x0
0x1de12ab1ba14   874  17fffe79       b #-0x61c (addr 0x1de12ab1b3f8)
0x1de12ab1ba18   878  1e632060       fcmp d3, d3
0x1de12ab1ba1c   87c  54000060       b.eq #+0xc (addr 0x1de12ab1ba28)
0x1de12ab1ba20   880  aa0e03fb       mov cp, x14
0x1de12ab1ba24   884  17fffe8a       b #-0x5d8 (addr 0x1de12ab1b44c)
0x1de12ab1ba28   888  1e202028       fcmp s1, #0.0
0x1de12ab1ba2c   88c  54ffffa3       b.lo #-0xc (addr 0x1de12ab1ba20)
0x1de12ab1ba30   890  9280001b       movn cp, #0x0
0x1de12ab1ba34   894  17fffe86       b #-0x5e8 (addr 0x1de12ab1b44c)
0x1de12ab1ba38   898  f9003bf3       str x19, [sp, #112]
0x1de12ab1ba3c   89c  f9002bea       str x10, [sp, #80]
0x1de12ab1ba40   8a0  f90027ef       str x15, [sp, #72]
0x1de12ab1ba44   8a4  f9002ff5       str x21, [sp, #88]
0x1de12ab1ba48   8a8  97fc0862       bl #-0xfde78 (addr 0x1de12aa1dbd0)
0x1de12ab1ba4c   8ac  f94047ed       ldr x13, [sp, #136]
0x1de12ab1ba50   8b0  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1ba54   8b4  d280000e       movz x14, #0x0
0x1de12ab1ba58   8b8  f9401be4       ldr x4, [sp, #48]
0x1de12ab1ba5c   8bc  f94017e2       ldr x2, [sp, #40]
0x1de12ab1ba60   8c0  f94043e8       ldr x8, [sp, #128]
0x1de12ab1ba64   8c4  f9400fec       ldr x12, [sp, #24]
0x1de12ab1ba68   8c8  f9400be9       ldr x9, [sp, #16]
0x1de12ab1ba6c   8cc  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1ba70   8d0  f9404be7       ldr x7, [sp, #144]
0x1de12ab1ba74   8d4  f94013e0       ldr x0, [sp, #32]
0x1de12ab1ba78   8d8  f94037eb       ldr x11, [sp, #104]
0x1de12ab1ba7c   8dc  f94033e5       ldr x5, [sp, #96]
0x1de12ab1ba80   8e0  f94007f4       ldr x20, [sp, #8]
0x1de12ab1ba84   8e4  f9403bf3       ldr x19, [sp, #112]
0x1de12ab1ba88   8e8  f9402bea       ldr x10, [sp, #80]
0x1de12ab1ba8c   8ec  f94027ef       ldr x15, [sp, #72]
0x1de12ab1ba90   8f0  f9402ff5       ldr x21, [sp, #88]
0x1de12ab1ba94   8f4  17fffe8f       b #-0x5c4 (addr 0x1de12ab1b4d0)
0x1de12ab1ba98   8f8  f9003bea       str x10, [sp, #112]
0x1de12ab1ba9c   8fc  f90023ef       str x15, [sp, #64]
0x1de12ab1baa0   900  f9002bf3       str x19, [sp, #80]
0x1de12ab1baa4   904  97fc084b       bl #-0xfded4 (addr 0x1de12aa1dbd0)
0x1de12ab1baa8   908  f94047ed       ldr x13, [sp, #136]
0x1de12ab1baac   90c  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1bab0   910  d280000e       movz x14, #0x0
0x1de12ab1bab4   914  f9401be4       ldr x4, [sp, #48]
0x1de12ab1bab8   918  f94017e2       ldr x2, [sp, #40]
0x1de12ab1babc   91c  f94043e8       ldr x8, [sp, #128]
0x1de12ab1bac0   920  f9400fec       ldr x12, [sp, #24]
0x1de12ab1bac4   924  f9400be9       ldr x9, [sp, #16]
0x1de12ab1bac8   928  f9401fe3       ldr x3, [sp, #56]
0x1de12ab1bacc   92c  f9404be7       ldr x7, [sp, #144]
0x1de12ab1bad0   930  f94013e0       ldr x0, [sp, #32]
0x1de12ab1bad4   934  f94037eb       ldr x11, [sp, #104]
0x1de12ab1bad8   938  f94033e5       ldr x5, [sp, #96]
0x1de12ab1badc   93c  f94007f4       ldr x20, [sp, #8]
0x1de12ab1bae0   940  f9403bea       ldr x10, [sp, #112]
0x1de12ab1bae4   944  f94023ef       ldr x15, [sp, #64]
0x1de12ab1bae8   948  f9402bf3       ldr x19, [sp, #80]
0x1de12ab1baec   94c  17fffeb5       b #-0x52c (addr 0x1de12ab1b5c0)
0x1de12ab1baf0   950  f90043e8       str x8, [sp, #128]
0x1de12ab1baf4   954  f9001be4       str x4, [sp, #48]
0x1de12ab1baf8   958  f90017e2       str x2, [sp, #40]
0x1de12ab1bafc   95c  f9003bf3       str x19, [sp, #112]
0x1de12ab1bb00   960  f90037ea       str x10, [sp, #104]
0x1de12ab1bb04   964  f90033f4       str x20, [sp, #96]
0x1de12ab1bb08   968  f9002feb       str x11, [sp, #88]
0x1de12ab1bb0c   96c  f9002bef       str x15, [sp, #80]
0x1de12ab1bb10   970  fd0027e0       str d0, [sp, #72]
0x1de12ab1bb14   974  f90023ec       str x12, [sp, #64]
0x1de12ab1bb18   978  f9001fe9       str x9, [sp, #56]
0x1de12ab1bb1c   97c  97fc082d       bl #-0xfdf4c (addr 0x1de12aa1dbd0)
0x1de12ab1bb20   980  f94047ed       ldr x13, [sp, #136]
0x1de12ab1bb24   984  f94043e8       ldr x8, [sp, #128]
0x1de12ab1bb28   988  f9401be4       ldr x4, [sp, #48]
0x1de12ab1bb2c   98c  f94017e2       ldr x2, [sp, #40]
0x1de12ab1bb30   990  f9403fe6       ldr x6, [sp, #120]
0x1de12ab1bb34   994  f9403bf3       ldr x19, [sp, #112]
0x1de12ab1bb38   998  f94037ea       ldr x10, [sp, #104]
0x1de12ab1bb3c   99c  f94033f4       ldr x20, [sp, #96]
0x1de12ab1bb40   9a0  f9402feb       ldr x11, [sp, #88]
0x1de12ab1bb44   9a4  f9402bef       ldr x15, [sp, #80]
0x1de12ab1bb48   9a8  d280000e       movz x14, #0x0
0x1de12ab1bb4c   9ac  fd4027e0       ldr d0, [sp, #72]
0x1de12ab1bb50   9b0  f94023ec       ldr x12, [sp, #64]
0x1de12ab1bb54   9b4  f9401fe9       ldr x9, [sp, #56]
0x1de12ab1bb58   9b8  17ffff47       b #-0x2e4 (addr 0x1de12ab1b874)
0x1de12ab1bb5c   9bc  1e622040       fcmp d2, d2
0x1de12ab1bb60   9c0  54000060       b.eq #+0xc (addr 0x1de12ab1bb6c)
0x1de12ab1bb64   9c4  aa0e03f5       mov x21, x14
0x1de12ab1bb68   9c8  17ffff51       b #-0x2bc (addr 0x1de12ab1b8ac)
0x1de12ab1bb6c   9cc  1e202028       fcmp s1, #0.0
0x1de12ab1bb70   9d0  54ffffa3       b.lo #-0xc (addr 0x1de12ab1bb64)
0x1de12ab1bb74   9d4  92800015       movn x21, #0x0
0x1de12ab1bb78   9d8  17ffff4d       b #-0x2cc (addr 0x1de12ab1b8ac)
0x1de12ab1bb7c   9dc  1e632060       fcmp d3, d3
0x1de12ab1bb80   9e0  54000060       b.eq #+0xc (addr 0x1de12ab1bb8c)
0x1de12ab1bb84   9e4  aa0e03f6       mov x22, x14
0x1de12ab1bb88   9e8  17ffff5e       b #-0x288 (addr 0x1de12ab1b900)
0x1de12ab1bb8c   9ec  1e202028       fcmp s1, #0.0
0x1de12ab1bb90   9f0  54ffffa3       b.lo #-0xc (addr 0x1de12ab1bb84)
0x1de12ab1bb94   9f4  92800016       movn x22, #0x0
0x1de12ab1bb98   9f8  17ffff5a       b #-0x298 (addr 0x1de12ab1b900)
0x1de12ab1bb9c   9fc  97fc075d       bl #-0xfe28c (addr 0x1de12aa1d910)
0x1de12ab1bba0   a00  97fc075c       bl #-0xfe290 (addr 0x1de12aa1d910)
0x1de12ab1bba4   a04  97fc075b       bl #-0xfe294 (addr 0x1de12aa1d910)
0x1de12ab1bba8   a08  d503201f       nop
0x1de12ab1bbac   a0c  580000df       constant pool begin (num_const = 6)
0x1de12ab1bbb0   a10  d63f03e0       constant
0x1de12ab1bbb4   a14  d503201f       constant
0x1de12ab1bbb8   a18  03b5ea68       constant
0x1de12ab1bbbc   a1c  00000001       constant
0x1de12ab1bbc0   a20  03b5eaf4       constant
0x1de12ab1bbc4   a24  00000001       constant

Protected instructions:
 pc offset
        44         
        4c         
        54         
        84         
        a4         
        e8         
       194         
       19c         
       1c0         
       1d4         
       1e4         
       1f8         
       200         
       224         
       278         
       2cc         
       2d4         
       330         
       338         
       340         
       348         
       350         
       358         
       360         
       368         
       370         
       378         
       380         
       388         
       390         
       398         
       3a0         
       3a8         
       3cc         
       3d4         
       3e4         
       3ec         
       3fc         
       404         
       420         
       428         
       43c         
       444         
       470         
       4c4         
       534         
       540         
       55c         
       580         
       5c0         
       66c         
       674         
       688         
       698         
       6ac         
       6b4         
       6b8         
       6c0         
       6d8         
       72c         
       780         
       790         
       794         
       79c         

Source positions:
 pc offset  position
        44        13
        4c        20
        54        25
        84        49
        90        61
        9c        69
        e8        77
       108       126
       194       158
       19c       173
       1c0       196
       1d0       206
       1e4       221
       1f8       236
       200       243
       224       273
       278       340
       2cc       418
       2d4       424
       330       531
       338       539
       340       551
       348       559
       350       571
       358       579
       360       591
       368       599
       370       611
       378       619
       380       631
       388       639
       390       651
       398       659
       3a0       671
       3a8       679
       3cc       718
       3d4       726
       3e4       718
       3ec       726
       3fc       718
       404       726
       420       718
       428       726
       43c       755
       444       764
       45c       779
       468       787
       4c4       800
       4cc       813
       534       833
       540       843
       55c       863
       570       878
       578       886
       5c0       894
       5e8       937
       66c       971
       674       986
       688       998
       698      1013
       6ac      1028
       6b4      1035
       6b8      1042
       6c0      1049
       6d8      1071
       72c      1138
       780      1213
       790      1233
       794      1238
       79c      1251
       7b8         0
       7dc       260
       898       525
       8f8       712
       950      1058
       9fc       937
       a00       813
       a04       126

Safepoints (stack slots = 22, entries = 1, byte size = 16)
0x1de12ab1b23c     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x1de12ab1b238  internal wasm call
0x1de12ab1b2bc  external reference (0x103b5eaf4)
0x1de12ab1b604  internal wasm call
0x1de12ab1b680  external reference (0x103b5ea68)
0x1de12ab1b714  internal wasm call
0x1de12ab1b958  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1b99c  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1ba48  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1baa4  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1bb1c  wasm stub call  (0x1de12aa1dbd0)
0x1de12ab1bb9c  wasm stub call  (0x1de12aa1d910)
0x1de12ab1bba0  wasm stub call  (0x1de12aa1d910)
0x1de12ab1bba4  wasm stub call  (0x1de12aa1d910)
0x1de12ab1bbac  constant pool (size 28)
