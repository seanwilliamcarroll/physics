name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0x9430ff9f740     0  d2800110       movz x16, #0x8
0x9430ff9f744     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x9430ff9f748     8  a9017bfd       stp fp, lr, [sp, #16]
0x9430ff9f74c     c  910043fd       add fp, sp, #0x10 (16)
0x9430ff9f750    10  d10243ff       sub sp, sp, #0x90 (144)
0x9430ff9f754    14  f841f0e6       ldur x6, [x7, #31]
0x9430ff9f758    18  f8520348       ldur x8, [x26, #-224]
0x9430ff9f75c    1c  f90013e0       str x0, [sp, #32]
0x9430ff9f760    20  f90017e2       str x2, [sp, #40]
0x9430ff9f764    24  f9001fe3       str x3, [sp, #56]
0x9430ff9f768    28  f9001be4       str x4, [sp, #48]
0x9430ff9f76c    2c  f90027e5       str x5, [sp, #72]
0x9430ff9f770    30  f9003fe6       str x6, [sp, #120]
0x9430ff9f774    34  eb2863ff       cmp sp, x8
0x9430ff9f778    38  54003b89       b.ls #+0x770 (addr 0x9430ff9fee8)
0x9430ff9f77c    3c  2a0003e8       mov w8, w0
0x9430ff9f780    40  91002109       add x9, x8, #0x8 (8)
0x9430ff9f784    44  b82968df       str wzr, [x6, x9]
0x9430ff9f788    48  9100b10a       add x10, x8, #0x2c (44)
0x9430ff9f78c    4c  b86a68cb       ldr w11, [x6, x10]
0x9430ff9f790    50  9100a10c       add x12, x8, #0x28 (40)
0x9430ff9f794    54  b86c68cd       ldr w13, [x6, x12]
0x9430ff9f798    58  1b0d7d6b       mul w11, w11, w13
0x9430ff9f79c    5c  1100056d       add w13, w11, #0x1 (1)
0x9430ff9f7a0    60  f90043e8       str x8, [sp, #128]
0x9430ff9f7a4    64  f90047e9       str x9, [sp, #136]
0x9430ff9f7a8    68  f9000bea       str x10, [sp, #16]
0x9430ff9f7ac    6c  f9000fec       str x12, [sp, #24]
0x9430ff9f7b0    70  f9002feb       str x11, [sp, #88]
0x9430ff9f7b4    74  f9003bed       str x13, [sp, #112]
0x9430ff9f7b8    78  3500006d       cbnz w13, #+0xc (addr 0x9430ff9f7c4)
0x9430ff9f7bc    7c  d280000b       movz x11, #0x0
0x9430ff9f7c0    80  14000047       b #+0x11c (addr 0x9430ff9f8dc)
0x9430ff9f7c4    84  b86868ce       ldr w14, [x6, x8]
0x9430ff9f7c8    88  6b0e01bf       cmp w13, w14
0x9430ff9f7cc    8c  540002a9       b.ls #+0x54 (addr 0x9430ff9f820)
0x9430ff9f7d0    90  aa0d03e3       mov x3, x13
0x9430ff9f7d4    94  d2800002       movz x2, #0x0
0x9430ff9f7d8    98  97fc07aa       bl #-0xfe158 (addr 0x9430fea1680)
0x9430ff9f7dc    9c  f9403fe6       ldr x6, [sp, #120]
0x9430ff9f7e0    a0  f94047e8       ldr x8, [sp, #136]
0x9430ff9f7e4    a4  b86868c9       ldr w9, [x6, x8]
0x9430ff9f7e8    a8  aa0903ee       mov x14, x9
0x9430ff9f7ec    ac  f9401be4       ldr x4, [sp, #48]
0x9430ff9f7f0    b0  f94017e2       ldr x2, [sp, #40]
0x9430ff9f7f4    b4  aa0803e9       mov x9, x8
0x9430ff9f7f8    b8  f94043e8       ldr x8, [sp, #128]
0x9430ff9f7fc    bc  f9400fec       ldr x12, [sp, #24]
0x9430ff9f800    c0  f9400bea       ldr x10, [sp, #16]
0x9430ff9f804    c4  f9401fe3       ldr x3, [sp, #56]
0x9430ff9f808    c8  f9404be7       ldr x7, [sp, #144]
0x9430ff9f80c    cc  f94013e0       ldr x0, [sp, #32]
0x9430ff9f810    d0  f94027e5       ldr x5, [sp, #72]
0x9430ff9f814    d4  f9403bed       ldr x13, [sp, #112]
0x9430ff9f818    d8  f9402feb       ldr x11, [sp, #88]
0x9430ff9f81c    dc  14000002       b #+0x8 (addr 0x9430ff9f824)
0x9430ff9f820    e0  d280000e       movz x14, #0x0
0x9430ff9f824    e4  9100110f       add x15, x8, #0x4 (4)
0x9430ff9f828    e8  b86f68cf       ldr w15, [x6, x15]
0x9430ff9f82c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x9430ff9f830    f0  f90033ee       str x14, [sp, #96]
0x9430ff9f834    f4  f90037ef       str x15, [sp, #104]
0x9430ff9f838    f8  340004eb       cbz w11, #+0x9c (addr 0x9430ff9f8d4)
0x9430ff9f83c    fc  531e75b4       lsl w20, w13, #2
0x9430ff9f840   100  51001294       sub w20, w20, #0x4 (4)
0x9430ff9f844   104  34000394       cbz w20, #+0x70 (addr 0x9430ff9f8b4)
0x9430ff9f848   108  aa0703e0       mov x0, x7
0x9430ff9f84c   10c  d2800001       movz x1, #0x0
0x9430ff9f850   110  aa1303e2       mov x2, x19
0x9430ff9f854   114  aa1403e4       mov x4, x20
0x9430ff9f858   118  aa0103e3       mov x3, x1
0x9430ff9f85c   11c  580047b0       ldr x16, pc+2292 (addr 0x000009430ffa0150)
0x9430ff9f860   120  10000068       adr x8, #+0xc (addr 0x9430ff9f86c)
0x9430ff9f864   124  a9027748       stp x8, fp, [x26, #32]
0x9430ff9f868   128  d63f0200       blr x16
0x9430ff9f86c   12c  f900175f       str xzr, [x26, #40]
0x9430ff9f870   130  6a00001f       tst w0, w0
0x9430ff9f874   134  54004600       b.eq #+0x8c0 (addr 0x9430ffa0134)
0x9430ff9f878   138  f9403fe6       ldr x6, [sp, #120]
0x9430ff9f87c   13c  f9401be4       ldr x4, [sp, #48]
0x9430ff9f880   140  f94017e2       ldr x2, [sp, #40]
0x9430ff9f884   144  f94043e8       ldr x8, [sp, #128]
0x9430ff9f888   148  f9400fec       ldr x12, [sp, #24]
0x9430ff9f88c   14c  f9400bea       ldr x10, [sp, #16]
0x9430ff9f890   150  f9401fe3       ldr x3, [sp, #56]
0x9430ff9f894   154  f9404be7       ldr x7, [sp, #144]
0x9430ff9f898   158  f94013e0       ldr x0, [sp, #32]
0x9430ff9f89c   15c  f94027e5       ldr x5, [sp, #72]
0x9430ff9f8a0   160  f94047e9       ldr x9, [sp, #136]
0x9430ff9f8a4   164  f94033ee       ldr x14, [sp, #96]
0x9430ff9f8a8   168  f94037ef       ldr x15, [sp, #104]
0x9430ff9f8ac   16c  f9403bed       ldr x13, [sp, #112]
0x9430ff9f8b0   170  f9402feb       ldr x11, [sp, #88]
0x9430ff9f8b4   174  aa0e03f0       mov x16, x14
0x9430ff9f8b8   178  aa0b03ee       mov x14, x11
0x9430ff9f8bc   17c  aa1003eb       mov x11, x16
0x9430ff9f8c0   180  0b0e016e       add w14, w11, w14
0x9430ff9f8c4   184  0b0d016b       add w11, w11, w13
0x9430ff9f8c8   188  aa0f03ed       mov x13, x15
0x9430ff9f8cc   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x9430ff9f8d0   190  51001173       sub w19, w11, #0x4 (4)
0x9430ff9f8d4   194  b83368df       str wzr, [x6, x19]
0x9430ff9f8d8   198  110005cb       add w11, w14, #0x1 (1)
0x9430ff9f8dc   19c  b82968cb       str w11, [x6, x9]
0x9430ff9f8e0   1a0  aa0503e9       mov x9, x5
0x9430ff9f8e4   1a4  6b03013f       cmp w9, w3
0x9430ff9f8e8   1a8  1a83312d       csel w13, w9, w3, lo
0x9430ff9f8ec   1ac  d280000e       movz x14, #0x0
0x9430ff9f8f0   1b0  f90037eb       str x11, [sp, #104]
0x9430ff9f8f4   1b4  f90047ed       str x13, [sp, #136]
0x9430ff9f8f8   1b8  350000cd       cbnz w13, #+0x18 (addr 0x9430ff9f910)
0x9430ff9f8fc   1bc  91001109       add x9, x8, #0x4 (4)
0x9430ff9f900   1c0  b86968c9       ldr w9, [x6, x9]
0x9430ff9f904   1c4  aa0903f4       mov x20, x9
0x9430ff9f908   1c8  aa0a03e9       mov x9, x10
0x9430ff9f90c   1cc  14000045       b #+0x114 (addr 0x9430ff9fa20)
0x9430ff9f910   1d0  aa0a03e9       mov x9, x10
0x9430ff9f914   1d4  b86968ca       ldr w10, [x6, x9]
0x9430ff9f918   1d8  7100015f       cmp w10, #0x0 (0)
0x9430ff9f91c   1dc  9a9f07ef       cset x15, ne
0x9430ff9f920   1e0  4b0f014a       sub w10, w10, w15
0x9430ff9f924   1e4  b86c68cf       ldr w15, [x6, x12]
0x9430ff9f928   1e8  710001ff       cmp w15, #0x0 (0)
0x9430ff9f92c   1ec  9a9f07f3       cset x19, ne
0x9430ff9f930   1f0  4b1301f3       sub w19, w15, w19
0x9430ff9f934   1f4  91001114       add x20, x8, #0x4 (4)
0x9430ff9f938   1f8  b87468d4       ldr w20, [x6, x20]
0x9430ff9f93c   1fc  91009115       add x21, x8, #0x24 (36)
0x9430ff9f940   200  bc7568c0       ldr s0, [x6, x21]
0x9430ff9f944   204  aa0d03f5       mov x21, x13
0x9430ff9f948   208  aa0403f6       mov x22, x4
0x9430ff9f94c   20c  aa0203f7       mov x23, x2
0x9430ff9f950   210  d2800038       movz x24, #0x1
0x9430ff9f954   214  f8520359       ldur x25, [x26, #-224]
0x9430ff9f958   218  eb3963ff       cmp sp, x25
0x9430ff9f95c   21c  54002d89       b.ls #+0x5b0 (addr 0x9430ff9ff0c)
0x9430ff9f960   220  2a1703f9       mov w25, w23
0x9430ff9f964   224  bc7968c1       ldr s1, [x6, x25]
0x9430ff9f968   228  1e200821       fmul s1, s1, s0
0x9430ff9f96c   22c  1e212020       fcmp s1, s1
0x9430ff9f970   230  1e211de1       fcsel s1, s15, s1, ne
0x9430ff9f974   234  1e202028       fcmp s1, #0.0
0x9430ff9f978   238  1e2fcc21       fcsel s1, s1, s15, gt
0x9430ff9f97c   23c  1e22c022       fcvt d2, s1
0x9430ff9f980   240  1e65c043       frintz d3, d2
0x9430ff9f984   244  1e790079       fcvtzu w25, d3
0x9430ff9f988   248  1e630324       ucvtf d4, w25
0x9430ff9f98c   24c  1e642060       fcmp d3, d4
0x9430ff9f990   250  54002fc1       b.ne #+0x5f8 (addr 0x9430ff9ff88)
0x9430ff9f994   254  6b19027f       cmp w19, w25
0x9430ff9f998   258  1a99327b       csel w27, w19, w25, lo
0x9430ff9f99c   25c  11000779       add w25, w27, #0x1 (1)
0x9430ff9f9a0   260  52a9f010       movz w16, #0x4f800000
0x9430ff9f9a4   264  1e270202       fmov s2, w16
0x9430ff9f9a8   268  1e222020       fcmp s1, s2
0x9430ff9f9ac   26c  1a983339       csel w25, w25, w24, lo
0x9430ff9f9b0   270  2a1603fb       mov w27, w22
0x9430ff9f9b4   274  bc7b68c1       ldr s1, [x6, x27]
0x9430ff9f9b8   278  1e200821       fmul s1, s1, s0
0x9430ff9f9bc   27c  1e212020       fcmp s1, s1
0x9430ff9f9c0   280  1e211de1       fcsel s1, s15, s1, ne
0x9430ff9f9c4   284  1e202028       fcmp s1, #0.0
0x9430ff9f9c8   288  1e2fcc21       fcsel s1, s1, s15, gt
0x9430ff9f9cc   28c  1e22c023       fcvt d3, s1
0x9430ff9f9d0   290  1e65c064       frintz d4, d3
0x9430ff9f9d4   294  1e79009b       fcvtzu w27, d4
0x9430ff9f9d8   298  1e630365       ucvtf d5, w27
0x9430ff9f9dc   29c  1e652080       fcmp d4, d5
0x9430ff9f9e0   2a0  54002e41       b.ne #+0x5c8 (addr 0x9430ff9ffa8)
0x9430ff9f9e4   2a4  6b1b015f       cmp w10, w27
0x9430ff9f9e8   2a8  1a9b315c       csel w28, w10, w27, lo
0x9430ff9f9ec   2ac  1e222020       fcmp s1, s2
0x9430ff9f9f0   2b0  1a9f339b       csel w27, w28, wzr, lo
0x9430ff9f9f4   2b4  1b0f6779       madd w25, w27, w15, w25
0x9430ff9f9f8   2b8  6b19017f       cmp w11, w25
0x9430ff9f9fc   2bc  540000a9       b.ls #+0x14 (addr 0x9430ff9fa10)
0x9430ff9fa00   2c0  0b190a99       add w25, w20, w25, lsl #2
0x9430ff9fa04   2c4  b87968db       ldr w27, [x6, x25]
0x9430ff9fa08   2c8  1100077b       add w27, w27, #0x1 (1)
0x9430ff9fa0c   2cc  b83968db       str w27, [x6, x25]
0x9430ff9fa10   2d0  110012f7       add w23, w23, #0x4 (4)
0x9430ff9fa14   2d4  110012d6       add w22, w22, #0x4 (4)
0x9430ff9fa18   2d8  510006b5       sub w21, w21, #0x1 (1)
0x9430ff9fa1c   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0x9430ff9f954)
0x9430ff9fa20   2e0  f90007f4       str x20, [sp, #8]
0x9430ff9fa24   2e4  3500006b       cbnz w11, #+0xc (addr 0x9430ff9fa30)
0x9430ff9fa28   2e8  aa0e03ea       mov x10, x14
0x9430ff9fa2c   2ec  1400008f       b #+0x23c (addr 0x9430ff9fc68)
0x9430ff9fa30   2f0  531e7565       lsl w5, w11, #2
0x9430ff9fa34   2f4  510010aa       sub w10, w5, #0x4 (4)
0x9430ff9fa38   2f8  53027d4f       lsr w15, w10, #2
0x9430ff9fa3c   2fc  110005ef       add w15, w15, #0x1 (1)
0x9430ff9fa40   300  120009f3       and w19, w15, #0x7
0x9430ff9fa44   304  f90033e5       str x5, [sp, #96]
0x9430ff9fa48   308  7100715f       cmp w10, #0x1c (28)
0x9430ff9fa4c   30c  54000563       b.lo #+0xac (addr 0x9430ff9faf8)
0x9430ff9fa50   310  121d6dea       and w10, w15, #0x7ffffff8
0x9430ff9fa54   314  aa1403ef       mov x15, x20
0x9430ff9fa58   318  aa0e03f5       mov x21, x14
0x9430ff9fa5c   31c  f8520356       ldur x22, [x26, #-224]
0x9430ff9fa60   320  eb3663ff       cmp sp, x22
0x9430ff9fa64   324  54002b29       b.ls #+0x564 (addr 0x9430ff9ffc8)
0x9430ff9fa68   328  b86f68d6       ldr w22, [x6, x15]
0x9430ff9fa6c   32c  0b1502d5       add w21, w22, w21
0x9430ff9fa70   330  b82f68d5       str w21, [x6, x15]
0x9430ff9fa74   334  110011f6       add w22, w15, #0x4 (4)
0x9430ff9fa78   338  b87668d7       ldr w23, [x6, x22]
0x9430ff9fa7c   33c  0b1502f5       add w21, w23, w21
0x9430ff9fa80   340  b83668d5       str w21, [x6, x22]
0x9430ff9fa84   344  110021f6       add w22, w15, #0x8 (8)
0x9430ff9fa88   348  b87668d7       ldr w23, [x6, x22]
0x9430ff9fa8c   34c  0b1502f5       add w21, w23, w21
0x9430ff9fa90   350  b83668d5       str w21, [x6, x22]
0x9430ff9fa94   354  110031f6       add w22, w15, #0xc (12)
0x9430ff9fa98   358  b87668d7       ldr w23, [x6, x22]
0x9430ff9fa9c   35c  0b1502f5       add w21, w23, w21
0x9430ff9faa0   360  b83668d5       str w21, [x6, x22]
0x9430ff9faa4   364  110041f6       add w22, w15, #0x10 (16)
0x9430ff9faa8   368  b87668d7       ldr w23, [x6, x22]
0x9430ff9faac   36c  0b1502f5       add w21, w23, w21
0x9430ff9fab0   370  b83668d5       str w21, [x6, x22]
0x9430ff9fab4   374  110051f6       add w22, w15, #0x14 (20)
0x9430ff9fab8   378  b87668d7       ldr w23, [x6, x22]
0x9430ff9fabc   37c  0b1502f5       add w21, w23, w21
0x9430ff9fac0   380  b83668d5       str w21, [x6, x22]
0x9430ff9fac4   384  110061f6       add w22, w15, #0x18 (24)
0x9430ff9fac8   388  b87668d7       ldr w23, [x6, x22]
0x9430ff9facc   38c  0b1502f5       add w21, w23, w21
0x9430ff9fad0   390  b83668d5       str w21, [x6, x22]
0x9430ff9fad4   394  110071f6       add w22, w15, #0x1c (28)
0x9430ff9fad8   398  b87668d7       ldr w23, [x6, x22]
0x9430ff9fadc   39c  0b1502f5       add w21, w23, w21
0x9430ff9fae0   3a0  b83668d5       str w21, [x6, x22]
0x9430ff9fae4   3a4  110081ef       add w15, w15, #0x20 (32)
0x9430ff9fae8   3a8  5100214a       sub w10, w10, #0x8 (8)
0x9430ff9faec   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0x9430ff9fa5c)
0x9430ff9faf0   3b0  35000093       cbnz w19, #+0x10 (addr 0x9430ff9fb00)
0x9430ff9faf4   3b4  1400001f       b #+0x7c (addr 0x9430ff9fb70)
0x9430ff9faf8   3b8  aa0e03f5       mov x21, x14
0x9430ff9fafc   3bc  aa1403ef       mov x15, x20
0x9430ff9fb00   3c0  531e766a       lsl w10, w19, #2
0x9430ff9fb04   3c4  b86f68d3       ldr w19, [x6, x15]
0x9430ff9fb08   3c8  0b150273       add w19, w19, w21
0x9430ff9fb0c   3cc  b82f68d3       str w19, [x6, x15]
0x9430ff9fb10   3d0  110011ef       add w15, w15, #0x4 (4)
0x9430ff9fb14   3d4  5100114a       sub w10, w10, #0x4 (4)
0x9430ff9fb18   3d8  340002ca       cbz w10, #+0x58 (addr 0x9430ff9fb70)
0x9430ff9fb1c   3dc  b86f68d5       ldr w21, [x6, x15]
0x9430ff9fb20   3e0  0b1302b3       add w19, w21, w19
0x9430ff9fb24   3e4  b82f68d3       str w19, [x6, x15]
0x9430ff9fb28   3e8  110011ef       add w15, w15, #0x4 (4)
0x9430ff9fb2c   3ec  5100114a       sub w10, w10, #0x4 (4)
0x9430ff9fb30   3f0  3400020a       cbz w10, #+0x40 (addr 0x9430ff9fb70)
0x9430ff9fb34   3f4  b86f68d5       ldr w21, [x6, x15]
0x9430ff9fb38   3f8  0b1302b3       add w19, w21, w19
0x9430ff9fb3c   3fc  b82f68d3       str w19, [x6, x15]
0x9430ff9fb40   400  110011ef       add w15, w15, #0x4 (4)
0x9430ff9fb44   404  5100114a       sub w10, w10, #0x4 (4)
0x9430ff9fb48   408  3400014a       cbz w10, #+0x28 (addr 0x9430ff9fb70)
0x9430ff9fb4c   40c  f8520355       ldur x21, [x26, #-224]
0x9430ff9fb50   410  eb3563ff       cmp sp, x21
0x9430ff9fb54   414  540026a9       b.ls #+0x4d4 (addr 0x9430ffa0028)
0x9430ff9fb58   418  b86f68d5       ldr w21, [x6, x15]
0x9430ff9fb5c   41c  0b1302b5       add w21, w21, w19
0x9430ff9fb60   420  b82f68d5       str w21, [x6, x15]
0x9430ff9fb64   424  110011ef       add w15, w15, #0x4 (4)
0x9430ff9fb68   428  5100114a       sub w10, w10, #0x4 (4)
0x9430ff9fb6c   42c  35fffcca       cbnz w10, #-0x68 (addr 0x9430ff9fb04)
0x9430ff9fb70   430  9100510a       add x10, x8, #0x14 (20)
0x9430ff9fb74   434  b82a68df       str wzr, [x6, x10]
0x9430ff9fb78   438  9100310f       add x15, x8, #0xc (12)
0x9430ff9fb7c   43c  b86f68cf       ldr w15, [x6, x15]
0x9430ff9fb80   440  f9003bea       str x10, [sp, #112]
0x9430ff9fb84   444  6b0f017f       cmp w11, w15
0x9430ff9fb88   448  54000309       b.ls #+0x60 (addr 0x9430ff9fbe8)
0x9430ff9fb8c   44c  aa0003ef       mov x15, x0
0x9430ff9fb90   450  110031e0       add w0, w15, #0xc (12)
0x9430ff9fb94   454  aa0b03e3       mov x3, x11
0x9430ff9fb98   458  aa0e03e2       mov x2, x14
0x9430ff9fb9c   45c  97fc06b9       bl #-0xfe51c (addr 0x9430fea1680)
0x9430ff9fba0   460  f9403fe6       ldr x6, [sp, #120]
0x9430ff9fba4   464  f9403be8       ldr x8, [sp, #112]
0x9430ff9fba8   468  b86868c8       ldr w8, [x6, x8]
0x9430ff9fbac   46c  aa0803ea       mov x10, x8
0x9430ff9fbb0   470  f94047ed       ldr x13, [sp, #136]
0x9430ff9fbb4   474  d280000e       movz x14, #0x0
0x9430ff9fbb8   478  f9401be4       ldr x4, [sp, #48]
0x9430ff9fbbc   47c  f94017e2       ldr x2, [sp, #40]
0x9430ff9fbc0   480  f94043e8       ldr x8, [sp, #128]
0x9430ff9fbc4   484  f9400fec       ldr x12, [sp, #24]
0x9430ff9fbc8   488  f9400be9       ldr x9, [sp, #16]
0x9430ff9fbcc   48c  f9401fe3       ldr x3, [sp, #56]
0x9430ff9fbd0   490  f9404be7       ldr x7, [sp, #144]
0x9430ff9fbd4   494  f94013e0       ldr x0, [sp, #32]
0x9430ff9fbd8   498  f94037eb       ldr x11, [sp, #104]
0x9430ff9fbdc   49c  f94033e5       ldr x5, [sp, #96]
0x9430ff9fbe0   4a0  f94007f4       ldr x20, [sp, #8]
0x9430ff9fbe4   4a4  14000002       b #+0x8 (addr 0x9430ff9fbec)
0x9430ff9fbe8   4a8  aa0e03ea       mov x10, x14
0x9430ff9fbec   4ac  531e756f       lsl w15, w11, #2
0x9430ff9fbf0   4b0  f9003bea       str x10, [sp, #112]
0x9430ff9fbf4   4b4  340003af       cbz w15, #+0x74 (addr 0x9430ff9fc68)
0x9430ff9fbf8   4b8  9100410f       add x15, x8, #0x10 (16)
0x9430ff9fbfc   4bc  b86f68cf       ldr w15, [x6, x15]
0x9430ff9fc00   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0x9430ff9fc04   4c4  aa0703e0       mov x0, x7
0x9430ff9fc08   4c8  aa0e03e1       mov x1, x14
0x9430ff9fc0c   4cc  aa0e03e2       mov x2, x14
0x9430ff9fc10   4d0  aa0f03e3       mov x3, x15
0x9430ff9fc14   4d4  aa1403e4       mov x4, x20
0x9430ff9fc18   4d8  58002990       ldr x16, pc+1328 (addr 0x000009430ffa0148)
0x9430ff9fc1c   4dc  10000068       adr x8, #+0xc (addr 0x9430ff9fc28)
0x9430ff9fc20   4e0  a9027748       stp x8, fp, [x26, #32]
0x9430ff9fc24   4e4  d63f0200       blr x16
0x9430ff9fc28   4e8  f900175f       str xzr, [x26, #40]
0x9430ff9fc2c   4ec  6a00001f       tst w0, w0
0x9430ff9fc30   4f0  54002800       b.eq #+0x500 (addr 0x9430ffa0130)
0x9430ff9fc34   4f4  f9403bea       ldr x10, [sp, #112]
0x9430ff9fc38   4f8  f94047ed       ldr x13, [sp, #136]
0x9430ff9fc3c   4fc  f9403fe6       ldr x6, [sp, #120]
0x9430ff9fc40   500  d280000e       movz x14, #0x0
0x9430ff9fc44   504  f9401be4       ldr x4, [sp, #48]
0x9430ff9fc48   508  f94017e2       ldr x2, [sp, #40]
0x9430ff9fc4c   50c  f94043e8       ldr x8, [sp, #128]
0x9430ff9fc50   510  f9400fec       ldr x12, [sp, #24]
0x9430ff9fc54   514  f9400be9       ldr x9, [sp, #16]
0x9430ff9fc58   518  f9401fe3       ldr x3, [sp, #56]
0x9430ff9fc5c   51c  f9404be7       ldr x7, [sp, #144]
0x9430ff9fc60   520  f94013e0       ldr x0, [sp, #32]
0x9430ff9fc64   524  f94037eb       ldr x11, [sp, #104]
0x9430ff9fc68   528  9100810f       add x15, x8, #0x20 (32)
0x9430ff9fc6c   52c  b82f68df       str wzr, [x6, x15]
0x9430ff9fc70   530  0b0b014a       add w10, w10, w11
0x9430ff9fc74   534  9100510b       add x11, x8, #0x14 (20)
0x9430ff9fc78   538  b82b68ca       str w10, [x6, x11]
0x9430ff9fc7c   53c  f9003bef       str x15, [sp, #112]
0x9430ff9fc80   540  f9002feb       str x11, [sp, #88]
0x9430ff9fc84   544  35000063       cbnz w3, #+0xc (addr 0x9430ff9fc90)
0x9430ff9fc88   548  aa0e03ea       mov x10, x14
0x9430ff9fc8c   54c  14000048       b #+0x120 (addr 0x9430ff9fdac)
0x9430ff9fc90   550  9100610a       add x10, x8, #0x18 (24)
0x9430ff9fc94   554  b86a68ca       ldr w10, [x6, x10]
0x9430ff9fc98   558  6b0a007f       cmp w3, w10
0x9430ff9fc9c   55c  540002a9       b.ls #+0x54 (addr 0x9430ff9fcf0)
0x9430ff9fca0   560  aa0003ea       mov x10, x0
0x9430ff9fca4   564  11006140       add w0, w10, #0x18 (24)
0x9430ff9fca8   568  aa0e03e2       mov x2, x14
0x9430ff9fcac   56c  97fc0675       bl #-0xfe62c (addr 0x9430fea1680)
0x9430ff9fcb0   570  f9403fe6       ldr x6, [sp, #120]
0x9430ff9fcb4   574  f9403be8       ldr x8, [sp, #112]
0x9430ff9fcb8   578  b86868c9       ldr w9, [x6, x8]
0x9430ff9fcbc   57c  aa0903ea       mov x10, x9
0x9430ff9fcc0   580  f94047ed       ldr x13, [sp, #136]
0x9430ff9fcc4   584  d280000e       movz x14, #0x0
0x9430ff9fcc8   588  f9401be4       ldr x4, [sp, #48]
0x9430ff9fccc   58c  f94017e2       ldr x2, [sp, #40]
0x9430ff9fcd0   590  aa0803ef       mov x15, x8
0x9430ff9fcd4   594  f94043e8       ldr x8, [sp, #128]
0x9430ff9fcd8   598  f9402feb       ldr x11, [sp, #88]
0x9430ff9fcdc   59c  f9400fec       ldr x12, [sp, #24]
0x9430ff9fce0   5a0  f9400be9       ldr x9, [sp, #16]
0x9430ff9fce4   5a4  f9401fe3       ldr x3, [sp, #56]
0x9430ff9fce8   5a8  f9404be7       ldr x7, [sp, #144]
0x9430ff9fcec   5ac  14000002       b #+0x8 (addr 0x9430ff9fcf4)
0x9430ff9fcf0   5b0  aa0e03ea       mov x10, x14
0x9430ff9fcf4   5b4  91007113       add x19, x8, #0x1c (28)
0x9430ff9fcf8   5b8  b87368d3       ldr w19, [x6, x19]
0x9430ff9fcfc   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0x9430ff9fd00   5c0  f90037ea       str x10, [sp, #104]
0x9430ff9fd04   5c4  f90033f3       str x19, [sp, #96]
0x9430ff9fd08   5c8  aa0303f5       mov x21, x3
0x9430ff9fd0c   5cc  710006bf       cmp w21, #0x1 (1)
0x9430ff9fd10   5d0  540004a0       b.eq #+0x94 (addr 0x9430ff9fda4)
0x9430ff9fd14   5d4  531e76b6       lsl w22, w21, #2
0x9430ff9fd18   5d8  510012d6       sub w22, w22, #0x4 (4)
0x9430ff9fd1c   5dc  34000356       cbz w22, #+0x68 (addr 0x9430ff9fd84)
0x9430ff9fd20   5e0  aa0703e0       mov x0, x7
0x9430ff9fd24   5e4  aa0e03e1       mov x1, x14
0x9430ff9fd28   5e8  aa1403e2       mov x2, x20
0x9430ff9fd2c   5ec  aa0e03e3       mov x3, x14
0x9430ff9fd30   5f0  aa1603e4       mov x4, x22
0x9430ff9fd34   5f4  580020f0       ldr x16, pc+1052 (addr 0x000009430ffa0150)    ;; external reference (wasm::memory_fill)
0x9430ff9fd38   5f8  10000068       adr x8, #+0xc (addr 0x9430ff9fd44)
0x9430ff9fd3c   5fc  a9027748       stp x8, fp, [x26, #32]
0x9430ff9fd40   600  d63f0200       blr x16
0x9430ff9fd44   604  f900175f       str xzr, [x26, #40]
0x9430ff9fd48   608  6a00001f       tst w0, w0
0x9430ff9fd4c   60c  54001f00       b.eq #+0x3e0 (addr 0x9430ffa012c)
0x9430ff9fd50   610  f94047ed       ldr x13, [sp, #136]
0x9430ff9fd54   614  f9403fe6       ldr x6, [sp, #120]
0x9430ff9fd58   618  d280000e       movz x14, #0x0
0x9430ff9fd5c   61c  f9401be4       ldr x4, [sp, #48]
0x9430ff9fd60   620  f94017e2       ldr x2, [sp, #40]
0x9430ff9fd64   624  f94043e8       ldr x8, [sp, #128]
0x9430ff9fd68   628  f9402feb       ldr x11, [sp, #88]
0x9430ff9fd6c   62c  f9400fec       ldr x12, [sp, #24]
0x9430ff9fd70   630  f9400be9       ldr x9, [sp, #16]
0x9430ff9fd74   634  f9403bef       ldr x15, [sp, #112]
0x9430ff9fd78   638  f94037ea       ldr x10, [sp, #104]
0x9430ff9fd7c   63c  f94033f3       ldr x19, [sp, #96]
0x9430ff9fd80   640  f9401ff5       ldr x21, [sp, #56]
0x9430ff9fd84   644  aa1503f4       mov x20, x21
0x9430ff9fd88   648  0b14014a       add w10, w10, w20
0x9430ff9fd8c   64c  51000554       sub w20, w10, #0x1 (1)
0x9430ff9fd90   650  0b0a0a6a       add w10, w19, w10, lsl #2
0x9430ff9fd94   654  5100114a       sub w10, w10, #0x4 (4)
0x9430ff9fd98   658  aa0a03f0       mov x16, x10
0x9430ff9fd9c   65c  aa1403ea       mov x10, x20
0x9430ff9fda0   660  aa1003f4       mov x20, x16
0x9430ff9fda4   664  b83468df       str wzr, [x6, x20]
0x9430ff9fda8   668  1100054a       add w10, w10, #0x1 (1)
0x9430ff9fdac   66c  b82f68ca       str w10, [x6, x15]
0x9430ff9fdb0   670  3500008d       cbnz w13, #+0x10 (addr 0x9430ff9fdc0)
0x9430ff9fdb4   674  910003bf       mov sp, fp
0x9430ff9fdb8   678  a8c17bfd       ldp fp, lr, [sp], #16
0x9430ff9fdbc   67c  d65f03c0       ret
0x9430ff9fdc0   680  b86968c9       ldr w9, [x6, x9]
0x9430ff9fdc4   684  7100013f       cmp w9, #0x0 (0)
0x9430ff9fdc8   688  9a9f07ef       cset x15, ne
0x9430ff9fdcc   68c  4b0f0129       sub w9, w9, w15
0x9430ff9fdd0   690  b86c68cc       ldr w12, [x6, x12]
0x9430ff9fdd4   694  7100019f       cmp w12, #0x0 (0)
0x9430ff9fdd8   698  9a9f07ef       cset x15, ne
0x9430ff9fddc   69c  4b0f018f       sub w15, w12, w15
0x9430ff9fde0   6a0  91007113       add x19, x8, #0x1c (28)
0x9430ff9fde4   6a4  b87368d3       ldr w19, [x6, x19]
0x9430ff9fde8   6a8  91004114       add x20, x8, #0x10 (16)
0x9430ff9fdec   6ac  b87468d4       ldr w20, [x6, x20]
0x9430ff9fdf0   6b0  b86b68cb       ldr w11, [x6, x11]
0x9430ff9fdf4   6b4  91009108       add x8, x8, #0x24 (36)
0x9430ff9fdf8   6b8  bc6868c0       ldr s0, [x6, x8]
0x9430ff9fdfc   6bc  aa0e03e8       mov x8, x14
0x9430ff9fe00   6c0  f8520355       ldur x21, [x26, #-224]
0x9430ff9fe04   6c4  eb3563ff       cmp sp, x21
0x9430ff9fe08   6c8  540013c9       b.ls #+0x278 (addr 0x9430ffa0080)
0x9430ff9fe0c   6cc  2a0403f5       mov w21, w4
0x9430ff9fe10   6d0  bc7568c1       ldr s1, [x6, x21]
0x9430ff9fe14   6d4  1e200821       fmul s1, s1, s0
0x9430ff9fe18   6d8  1e212020       fcmp s1, s1
0x9430ff9fe1c   6dc  1e211de1       fcsel s1, s15, s1, ne
0x9430ff9fe20   6e0  1e202028       fcmp s1, #0.0
0x9430ff9fe24   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0x9430ff9fe28   6e8  1e22c022       fcvt d2, s1
0x9430ff9fe2c   6ec  1e65c043       frintz d3, d2
0x9430ff9fe30   6f0  1e790075       fcvtzu w21, d3
0x9430ff9fe34   6f4  1e6302a4       ucvtf d4, w21
0x9430ff9fe38   6f8  1e642060       fcmp d3, d4
0x9430ff9fe3c   6fc  54001581       b.ne #+0x2b0 (addr 0x9430ffa00ec)
0x9430ff9fe40   700  6b15013f       cmp w9, w21
0x9430ff9fe44   704  1a953136       csel w22, w9, w21, lo
0x9430ff9fe48   708  52a9f010       movz w16, #0x4f800000
0x9430ff9fe4c   70c  1e270202       fmov s2, w16
0x9430ff9fe50   710  1e222020       fcmp s1, s2
0x9430ff9fe54   714  1a9f32d5       csel w21, w22, wzr, lo
0x9430ff9fe58   718  1b0c7eb5       mul w21, w21, w12
0x9430ff9fe5c   71c  2a0203f6       mov w22, w2
0x9430ff9fe60   720  bc7668c1       ldr s1, [x6, x22]
0x9430ff9fe64   724  1e200821       fmul s1, s1, s0
0x9430ff9fe68   728  1e212020       fcmp s1, s1
0x9430ff9fe6c   72c  1e211de1       fcsel s1, s15, s1, ne
0x9430ff9fe70   730  1e202028       fcmp s1, #0.0
0x9430ff9fe74   734  1e2fcc21       fcsel s1, s1, s15, gt
0x9430ff9fe78   738  1e22c023       fcvt d3, s1
0x9430ff9fe7c   73c  1e65c064       frintz d4, d3
0x9430ff9fe80   740  1e790096       fcvtzu w22, d4
0x9430ff9fe84   744  1e6302c5       ucvtf d5, w22
0x9430ff9fe88   748  1e652080       fcmp d4, d5
0x9430ff9fe8c   74c  54001401       b.ne #+0x280 (addr 0x9430ffa010c)
0x9430ff9fe90   750  6b1601ff       cmp w15, w22
0x9430ff9fe94   754  1a9631f7       csel w23, w15, w22, lo
0x9430ff9fe98   758  1e222020       fcmp s1, s2
0x9430ff9fe9c   75c  1a9f32f6       csel w22, w23, wzr, lo
0x9430ff9fea0   760  0b1602b5       add w21, w21, w22
0x9430ff9fea4   764  6b15017f       cmp w11, w21
0x9430ff9fea8   768  54000149       b.ls #+0x28 (addr 0x9430ff9fed0)
0x9430ff9feac   76c  0b150a95       add w21, w20, w21, lsl #2
0x9430ff9feb0   770  b87568d6       ldr w22, [x6, x21]
0x9430ff9feb4   774  6b16015f       cmp w10, w22
0x9430ff9feb8   778  54000089       b.ls #+0x10 (addr 0x9430ff9fec8)
0x9430ff9febc   77c  0b160a76       add w22, w19, w22, lsl #2
0x9430ff9fec0   780  b83668c8       str w8, [x6, x22]
0x9430ff9fec4   784  b87568d6       ldr w22, [x6, x21]
0x9430ff9fec8   788  110006d6       add w22, w22, #0x1 (1)
0x9430ff9fecc   78c  b83568d6       str w22, [x6, x21]
0x9430ff9fed0   790  11001042       add w2, w2, #0x4 (4)
0x9430ff9fed4   794  11001084       add w4, w4, #0x4 (4)
0x9430ff9fed8   798  11000508       add w8, w8, #0x1 (1)
0x9430ff9fedc   79c  6b0801bf       cmp w13, w8
0x9430ff9fee0   7a0  54fff6a0       b.eq #-0x12c (addr 0x9430ff9fdb4)
0x9430ff9fee4   7a4  17ffffc7       b #-0xe4 (addr 0x9430ff9fe00)
0x9430ff9fee8   7a8  97fc073a       bl #-0xfe318 (addr 0x9430fea1bd0)
0x9430ff9feec   7ac  f9403fe6       ldr x6, [sp, #120]
0x9430ff9fef0   7b0  f9401be4       ldr x4, [sp, #48]
0x9430ff9fef4   7b4  f94017e2       ldr x2, [sp, #40]
0x9430ff9fef8   7b8  f9401fe3       ldr x3, [sp, #56]
0x9430ff9fefc   7bc  f9404be7       ldr x7, [sp, #144]
0x9430ff9ff00   7c0  f94013e0       ldr x0, [sp, #32]
0x9430ff9ff04   7c4  f94027e5       ldr x5, [sp, #72]
0x9430ff9ff08   7c8  17fffe1d       b #-0x78c (addr 0x9430ff9f77c)
0x9430ff9ff0c   7cc  f90007f4       str x20, [sp, #8]
0x9430ff9ff10   7d0  f9003bf5       str x21, [sp, #112]
0x9430ff9ff14   7d4  f90023f6       str x22, [sp, #64]
0x9430ff9ff18   7d8  f90003f7       str x23, [sp]
0x9430ff9ff1c   7dc  f90033ef       str x15, [sp, #96]
0x9430ff9ff20   7e0  f9002fea       str x10, [sp, #88]
0x9430ff9ff24   7e4  fd002be0       str d0, [sp, #80]
0x9430ff9ff28   7e8  f90027f3       str x19, [sp, #72]
0x9430ff9ff2c   7ec  97fc0729       bl #-0xfe35c (addr 0x9430fea1bd0)
0x9430ff9ff30   7f0  f94047ed       ldr x13, [sp, #136]
0x9430ff9ff34   7f4  f9403fe6       ldr x6, [sp, #120]
0x9430ff9ff38   7f8  d280000e       movz x14, #0x0
0x9430ff9ff3c   7fc  f9401be4       ldr x4, [sp, #48]
0x9430ff9ff40   800  f94017e2       ldr x2, [sp, #40]
0x9430ff9ff44   804  f94043e8       ldr x8, [sp, #128]
0x9430ff9ff48   808  f9400fec       ldr x12, [sp, #24]
0x9430ff9ff4c   80c  f9400be9       ldr x9, [sp, #16]
0x9430ff9ff50   810  f9401fe3       ldr x3, [sp, #56]
0x9430ff9ff54   814  f9404be7       ldr x7, [sp, #144]
0x9430ff9ff58   818  f94013e0       ldr x0, [sp, #32]
0x9430ff9ff5c   81c  f94037eb       ldr x11, [sp, #104]
0x9430ff9ff60   820  f94007f4       ldr x20, [sp, #8]
0x9430ff9ff64   824  f9403bf5       ldr x21, [sp, #112]
0x9430ff9ff68   828  f94023f6       ldr x22, [sp, #64]
0x9430ff9ff6c   82c  f94003f7       ldr x23, [sp]
0x9430ff9ff70   830  f94033ef       ldr x15, [sp, #96]
0x9430ff9ff74   834  f9402fea       ldr x10, [sp, #88]
0x9430ff9ff78   838  fd402be0       ldr d0, [sp, #80]
0x9430ff9ff7c   83c  d2800038       movz x24, #0x1
0x9430ff9ff80   840  f94027f3       ldr x19, [sp, #72]
0x9430ff9ff84   844  17fffe77       b #-0x624 (addr 0x9430ff9f960)
0x9430ff9ff88   848  1e622040       fcmp d2, d2
0x9430ff9ff8c   84c  54000060       b.eq #+0xc (addr 0x9430ff9ff98)
0x9430ff9ff90   850  aa0e03f9       mov x25, x14
0x9430ff9ff94   854  17fffe80       b #-0x600 (addr 0x9430ff9f994)
0x9430ff9ff98   858  1e202028       fcmp s1, #0.0
0x9430ff9ff9c   85c  54ffffa3       b.lo #-0xc (addr 0x9430ff9ff90)
0x9430ff9ffa0   860  92800019       movn x25, #0x0
0x9430ff9ffa4   864  17fffe7c       b #-0x610 (addr 0x9430ff9f994)
0x9430ff9ffa8   868  1e632060       fcmp d3, d3
0x9430ff9ffac   86c  54000060       b.eq #+0xc (addr 0x9430ff9ffb8)
0x9430ff9ffb0   870  aa0e03fb       mov cp, x14
0x9430ff9ffb4   874  17fffe8c       b #-0x5d0 (addr 0x9430ff9f9e4)
0x9430ff9ffb8   878  1e202028       fcmp s1, #0.0
0x9430ff9ffbc   87c  54ffffa3       b.lo #-0xc (addr 0x9430ff9ffb0)
0x9430ff9ffc0   880  9280001b       movn cp, #0x0
0x9430ff9ffc4   884  17fffe88       b #-0x5e0 (addr 0x9430ff9f9e4)
0x9430ff9ffc8   888  f9003bf3       str x19, [sp, #112]
0x9430ff9ffcc   88c  f9002bea       str x10, [sp, #80]
0x9430ff9ffd0   890  f90027ef       str x15, [sp, #72]
0x9430ff9ffd4   894  f9002ff5       str x21, [sp, #88]
0x9430ff9ffd8   898  97fc06fe       bl #-0xfe408 (addr 0x9430fea1bd0)
0x9430ff9ffdc   89c  f94047ed       ldr x13, [sp, #136]
0x9430ff9ffe0   8a0  f9403fe6       ldr x6, [sp, #120]
0x9430ff9ffe4   8a4  d280000e       movz x14, #0x0
0x9430ff9ffe8   8a8  f9401be4       ldr x4, [sp, #48]
0x9430ff9ffec   8ac  f94017e2       ldr x2, [sp, #40]
0x9430ff9fff0   8b0  f94043e8       ldr x8, [sp, #128]
0x9430ff9fff4   8b4  f9400fec       ldr x12, [sp, #24]
0x9430ff9fff8   8b8  f9400be9       ldr x9, [sp, #16]
0x9430ff9fffc   8bc  f9401fe3       ldr x3, [sp, #56]
0x9430ffa0000   8c0  f9404be7       ldr x7, [sp, #144]
0x9430ffa0004   8c4  f94013e0       ldr x0, [sp, #32]
0x9430ffa0008   8c8  f94037eb       ldr x11, [sp, #104]
0x9430ffa000c   8cc  f94033e5       ldr x5, [sp, #96]
0x9430ffa0010   8d0  f94007f4       ldr x20, [sp, #8]
0x9430ffa0014   8d4  f9403bf3       ldr x19, [sp, #112]
0x9430ffa0018   8d8  f9402bea       ldr x10, [sp, #80]
0x9430ffa001c   8dc  f94027ef       ldr x15, [sp, #72]
0x9430ffa0020   8e0  f9402ff5       ldr x21, [sp, #88]
0x9430ffa0024   8e4  17fffe91       b #-0x5bc (addr 0x9430ff9fa68)
0x9430ffa0028   8e8  f9003bea       str x10, [sp, #112]
0x9430ffa002c   8ec  f90023ef       str x15, [sp, #64]
0x9430ffa0030   8f0  f9002bf3       str x19, [sp, #80]
0x9430ffa0034   8f4  97fc06e7       bl #-0xfe464 (addr 0x9430fea1bd0)
0x9430ffa0038   8f8  f94047ed       ldr x13, [sp, #136]
0x9430ffa003c   8fc  f9403fe6       ldr x6, [sp, #120]
0x9430ffa0040   900  d280000e       movz x14, #0x0
0x9430ffa0044   904  f9401be4       ldr x4, [sp, #48]
0x9430ffa0048   908  f94017e2       ldr x2, [sp, #40]
0x9430ffa004c   90c  f94043e8       ldr x8, [sp, #128]
0x9430ffa0050   910  f9400fec       ldr x12, [sp, #24]
0x9430ffa0054   914  f9400be9       ldr x9, [sp, #16]
0x9430ffa0058   918  f9401fe3       ldr x3, [sp, #56]
0x9430ffa005c   91c  f9404be7       ldr x7, [sp, #144]
0x9430ffa0060   920  f94013e0       ldr x0, [sp, #32]
0x9430ffa0064   924  f94037eb       ldr x11, [sp, #104]
0x9430ffa0068   928  f94033e5       ldr x5, [sp, #96]
0x9430ffa006c   92c  f94007f4       ldr x20, [sp, #8]
0x9430ffa0070   930  f9403bea       ldr x10, [sp, #112]
0x9430ffa0074   934  f94023ef       ldr x15, [sp, #64]
0x9430ffa0078   938  f9402bf3       ldr x19, [sp, #80]
0x9430ffa007c   93c  17fffeb7       b #-0x524 (addr 0x9430ff9fb58)
0x9430ffa0080   940  f90043e8       str x8, [sp, #128]
0x9430ffa0084   944  f9001be4       str x4, [sp, #48]
0x9430ffa0088   948  f90017e2       str x2, [sp, #40]
0x9430ffa008c   94c  f9003bf3       str x19, [sp, #112]
0x9430ffa0090   950  f90037ea       str x10, [sp, #104]
0x9430ffa0094   954  f90033f4       str x20, [sp, #96]
0x9430ffa0098   958  f9002feb       str x11, [sp, #88]
0x9430ffa009c   95c  f9002bef       str x15, [sp, #80]
0x9430ffa00a0   960  fd0027e0       str d0, [sp, #72]
0x9430ffa00a4   964  f90023ec       str x12, [sp, #64]
0x9430ffa00a8   968  f9001fe9       str x9, [sp, #56]
0x9430ffa00ac   96c  97fc06c9       bl #-0xfe4dc (addr 0x9430fea1bd0)
0x9430ffa00b0   970  f94047ed       ldr x13, [sp, #136]
0x9430ffa00b4   974  f94043e8       ldr x8, [sp, #128]
0x9430ffa00b8   978  f9401be4       ldr x4, [sp, #48]
0x9430ffa00bc   97c  f94017e2       ldr x2, [sp, #40]
0x9430ffa00c0   980  f9403fe6       ldr x6, [sp, #120]
0x9430ffa00c4   984  f9403bf3       ldr x19, [sp, #112]
0x9430ffa00c8   988  f94037ea       ldr x10, [sp, #104]
0x9430ffa00cc   98c  f94033f4       ldr x20, [sp, #96]
0x9430ffa00d0   990  f9402feb       ldr x11, [sp, #88]
0x9430ffa00d4   994  f9402bef       ldr x15, [sp, #80]
0x9430ffa00d8   998  d280000e       movz x14, #0x0
0x9430ffa00dc   99c  fd4027e0       ldr d0, [sp, #72]
0x9430ffa00e0   9a0  f94023ec       ldr x12, [sp, #64]
0x9430ffa00e4   9a4  f9401fe9       ldr x9, [sp, #56]
0x9430ffa00e8   9a8  17ffff49       b #-0x2dc (addr 0x9430ff9fe0c)
0x9430ffa00ec   9ac  1e622040       fcmp d2, d2
0x9430ffa00f0   9b0  54000060       b.eq #+0xc (addr 0x9430ffa00fc)
0x9430ffa00f4   9b4  aa0e03f5       mov x21, x14
0x9430ffa00f8   9b8  17ffff52       b #-0x2b8 (addr 0x9430ff9fe40)
0x9430ffa00fc   9bc  1e202028       fcmp s1, #0.0
0x9430ffa0100   9c0  54ffffa3       b.lo #-0xc (addr 0x9430ffa00f4)
0x9430ffa0104   9c4  92800015       movn x21, #0x0
0x9430ffa0108   9c8  17ffff4e       b #-0x2c8 (addr 0x9430ff9fe40)
0x9430ffa010c   9cc  1e632060       fcmp d3, d3
0x9430ffa0110   9d0  54000060       b.eq #+0xc (addr 0x9430ffa011c)
0x9430ffa0114   9d4  aa0e03f6       mov x22, x14
0x9430ffa0118   9d8  17ffff5e       b #-0x288 (addr 0x9430ff9fe90)
0x9430ffa011c   9dc  1e202028       fcmp s1, #0.0
0x9430ffa0120   9e0  54ffffa3       b.lo #-0xc (addr 0x9430ffa0114)
0x9430ffa0124   9e4  92800016       movn x22, #0x0
0x9430ffa0128   9e8  17ffff5a       b #-0x298 (addr 0x9430ff9fe90)
0x9430ffa012c   9ec  97fc05f9       bl #-0xfe81c (addr 0x9430fea1910)
0x9430ffa0130   9f0  97fc05f8       bl #-0xfe820 (addr 0x9430fea1910)
0x9430ffa0134   9f4  97fc05f7       bl #-0xfe824 (addr 0x9430fea1910)
0x9430ffa0138   9f8  d503201f       nop
0x9430ffa013c   9fc  580000df       constant pool begin (num_const = 6)
0x9430ffa0140   a00  d63f03e0       constant
0x9430ffa0144   a04  d503201f       constant
0x9430ffa0148   a08  05502a68       constant
0x9430ffa014c   a0c  00000001       constant
0x9430ffa0150   a10  05502af4       constant
0x9430ffa0154   a14  00000001       constant

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
       274         
       2c4         
       2cc         
       328         
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
       3c4         
       3cc         
       3dc         
       3e4         
       3f4         
       3fc         
       418         
       420         
       434         
       43c         
       468         
       4bc         
       52c         
       538         
       554         
       578         
       5b8         
       664         
       66c         
       680         
       690         
       6a4         
       6ac         
       6b0         
       6b8         
       6d0         
       720         
       770         
       780         
       784         
       78c         

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
       274       339
       2c4       416
       2cc       422
       328       529
       330       537
       338       549
       340       557
       348       569
       350       577
       358       589
       360       597
       368       609
       370       617
       378       629
       380       637
       388       649
       390       657
       398       669
       3a0       677
       3c4       716
       3cc       724
       3dc       716
       3e4       724
       3f4       716
       3fc       724
       418       716
       420       724
       434       753
       43c       762
       454       777
       460       785
       4bc       798
       4c4       811
       52c       831
       538       841
       554       861
       568       876
       570       884
       5b8       892
       5e0       935
       664       969
       66c       984
       680       996
       690      1011
       6a4      1026
       6ac      1033
       6b0      1040
       6b8      1047
       6d0      1069
       720      1135
       770      1209
       780      1229
       784      1234
       78c      1247
       7a8         0
       7cc       260
       888       523
       8e8       710
       940      1056
       9ec       935
       9f0       811
       9f4       126

Safepoints (stack slots = 22, entries = 1, byte size = 16)
0x9430ff9f7dc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x9430ff9f7d8  internal wasm call
0x9430ff9f85c  external reference (0x105502af4)
0x9430ff9fb9c  internal wasm call
0x9430ff9fc18  external reference (0x105502a68)
0x9430ff9fcac  internal wasm call
0x9430ff9fee8  wasm stub call  (0x9430fea1bd0)
0x9430ff9ff2c  wasm stub call  (0x9430fea1bd0)
0x9430ff9ffd8  wasm stub call  (0x9430fea1bd0)
0x9430ffa0034  wasm stub call  (0x9430fea1bd0)
0x9430ffa00ac  wasm stub call  (0x9430fea1bd0)
0x9430ffa012c  wasm stub call  (0x9430fea1910)
0x9430ffa0130  wasm stub call  (0x9430fea1910)
0x9430ffa0134  wasm stub call  (0x9430fea1910)
0x9430ffa013c  constant pool (size 28)
