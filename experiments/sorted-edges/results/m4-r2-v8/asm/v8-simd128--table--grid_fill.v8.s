name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0x100482f8c540     0  d2800110       movz x16, #0x8
0x100482f8c544     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x100482f8c548     8  a9017bfd       stp fp, lr, [sp, #16]
0x100482f8c54c     c  910043fd       add fp, sp, #0x10 (16)
0x100482f8c550    10  d10243ff       sub sp, sp, #0x90 (144)
0x100482f8c554    14  f841f0e6       ldur x6, [x7, #31]
0x100482f8c558    18  f8520348       ldur x8, [x26, #-224]
0x100482f8c55c    1c  f90013e0       str x0, [sp, #32]
0x100482f8c560    20  f90017e2       str x2, [sp, #40]
0x100482f8c564    24  f9001fe3       str x3, [sp, #56]
0x100482f8c568    28  f9001be4       str x4, [sp, #48]
0x100482f8c56c    2c  f90027e5       str x5, [sp, #72]
0x100482f8c570    30  f9003fe6       str x6, [sp, #120]
0x100482f8c574    34  eb2863ff       cmp sp, x8
0x100482f8c578    38  54003b89       b.ls #+0x770 (addr 0x100482f8cce8)
0x100482f8c57c    3c  2a0003e8       mov w8, w0
0x100482f8c580    40  91002109       add x9, x8, #0x8 (8)
0x100482f8c584    44  b82968df       str wzr, [x6, x9]
0x100482f8c588    48  9100b10a       add x10, x8, #0x2c (44)
0x100482f8c58c    4c  b86a68cb       ldr w11, [x6, x10]
0x100482f8c590    50  9100a10c       add x12, x8, #0x28 (40)
0x100482f8c594    54  b86c68cd       ldr w13, [x6, x12]
0x100482f8c598    58  1b0d7d6b       mul w11, w11, w13
0x100482f8c59c    5c  1100056d       add w13, w11, #0x1 (1)
0x100482f8c5a0    60  f90043e8       str x8, [sp, #128]
0x100482f8c5a4    64  f90047e9       str x9, [sp, #136]
0x100482f8c5a8    68  f9000bea       str x10, [sp, #16]
0x100482f8c5ac    6c  f9000fec       str x12, [sp, #24]
0x100482f8c5b0    70  f9002feb       str x11, [sp, #88]
0x100482f8c5b4    74  f9003bed       str x13, [sp, #112]
0x100482f8c5b8    78  3500006d       cbnz w13, #+0xc (addr 0x100482f8c5c4)
0x100482f8c5bc    7c  d280000b       movz x11, #0x0
0x100482f8c5c0    80  14000047       b #+0x11c (addr 0x100482f8c6dc)
0x100482f8c5c4    84  b86868ce       ldr w14, [x6, x8]
0x100482f8c5c8    88  6b0e01bf       cmp w13, w14
0x100482f8c5cc    8c  540002a9       b.ls #+0x54 (addr 0x100482f8c620)
0x100482f8c5d0    90  aa0d03e3       mov x3, x13
0x100482f8c5d4    94  d2800002       movz x2, #0x0
0x100482f8c5d8    98  97fc042a       bl #-0xfef58 (addr 0x100482e8d680)
0x100482f8c5dc    9c  f9403fe6       ldr x6, [sp, #120]
0x100482f8c5e0    a0  f94047e8       ldr x8, [sp, #136]
0x100482f8c5e4    a4  b86868c9       ldr w9, [x6, x8]
0x100482f8c5e8    a8  aa0903ee       mov x14, x9
0x100482f8c5ec    ac  f9401be4       ldr x4, [sp, #48]
0x100482f8c5f0    b0  f94017e2       ldr x2, [sp, #40]
0x100482f8c5f4    b4  aa0803e9       mov x9, x8
0x100482f8c5f8    b8  f94043e8       ldr x8, [sp, #128]
0x100482f8c5fc    bc  f9400fec       ldr x12, [sp, #24]
0x100482f8c600    c0  f9400bea       ldr x10, [sp, #16]
0x100482f8c604    c4  f9401fe3       ldr x3, [sp, #56]
0x100482f8c608    c8  f9404be7       ldr x7, [sp, #144]
0x100482f8c60c    cc  f94013e0       ldr x0, [sp, #32]
0x100482f8c610    d0  f94027e5       ldr x5, [sp, #72]
0x100482f8c614    d4  f9403bed       ldr x13, [sp, #112]
0x100482f8c618    d8  f9402feb       ldr x11, [sp, #88]
0x100482f8c61c    dc  14000002       b #+0x8 (addr 0x100482f8c624)
0x100482f8c620    e0  d280000e       movz x14, #0x0
0x100482f8c624    e4  9100110f       add x15, x8, #0x4 (4)
0x100482f8c628    e8  b86f68cf       ldr w15, [x6, x15]
0x100482f8c62c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x100482f8c630    f0  f90033ee       str x14, [sp, #96]
0x100482f8c634    f4  f90037ef       str x15, [sp, #104]
0x100482f8c638    f8  340004eb       cbz w11, #+0x9c (addr 0x100482f8c6d4)
0x100482f8c63c    fc  531e75b4       lsl w20, w13, #2
0x100482f8c640   100  51001294       sub w20, w20, #0x4 (4)
0x100482f8c644   104  34000394       cbz w20, #+0x70 (addr 0x100482f8c6b4)
0x100482f8c648   108  aa0703e0       mov x0, x7
0x100482f8c64c   10c  d2800001       movz x1, #0x0
0x100482f8c650   110  aa1303e2       mov x2, x19
0x100482f8c654   114  aa1403e4       mov x4, x20
0x100482f8c658   118  aa0103e3       mov x3, x1
0x100482f8c65c   11c  580047b0       ldr x16, pc+2292 (addr 0x0000100482f8cf50)
0x100482f8c660   120  10000068       adr x8, #+0xc (addr 0x100482f8c66c)
0x100482f8c664   124  a9027748       stp x8, fp, [x26, #32]
0x100482f8c668   128  d63f0200       blr x16
0x100482f8c66c   12c  f900175f       str xzr, [x26, #40]
0x100482f8c670   130  6a00001f       tst w0, w0
0x100482f8c674   134  54004600       b.eq #+0x8c0 (addr 0x100482f8cf34)
0x100482f8c678   138  f9403fe6       ldr x6, [sp, #120]
0x100482f8c67c   13c  f9401be4       ldr x4, [sp, #48]
0x100482f8c680   140  f94017e2       ldr x2, [sp, #40]
0x100482f8c684   144  f94043e8       ldr x8, [sp, #128]
0x100482f8c688   148  f9400fec       ldr x12, [sp, #24]
0x100482f8c68c   14c  f9400bea       ldr x10, [sp, #16]
0x100482f8c690   150  f9401fe3       ldr x3, [sp, #56]
0x100482f8c694   154  f9404be7       ldr x7, [sp, #144]
0x100482f8c698   158  f94013e0       ldr x0, [sp, #32]
0x100482f8c69c   15c  f94027e5       ldr x5, [sp, #72]
0x100482f8c6a0   160  f94047e9       ldr x9, [sp, #136]
0x100482f8c6a4   164  f94033ee       ldr x14, [sp, #96]
0x100482f8c6a8   168  f94037ef       ldr x15, [sp, #104]
0x100482f8c6ac   16c  f9403bed       ldr x13, [sp, #112]
0x100482f8c6b0   170  f9402feb       ldr x11, [sp, #88]
0x100482f8c6b4   174  aa0e03f0       mov x16, x14
0x100482f8c6b8   178  aa0b03ee       mov x14, x11
0x100482f8c6bc   17c  aa1003eb       mov x11, x16
0x100482f8c6c0   180  0b0e016e       add w14, w11, w14
0x100482f8c6c4   184  0b0d016b       add w11, w11, w13
0x100482f8c6c8   188  aa0f03ed       mov x13, x15
0x100482f8c6cc   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x100482f8c6d0   190  51001173       sub w19, w11, #0x4 (4)
0x100482f8c6d4   194  b83368df       str wzr, [x6, x19]
0x100482f8c6d8   198  110005cb       add w11, w14, #0x1 (1)
0x100482f8c6dc   19c  b82968cb       str w11, [x6, x9]
0x100482f8c6e0   1a0  aa0503e9       mov x9, x5
0x100482f8c6e4   1a4  6b03013f       cmp w9, w3
0x100482f8c6e8   1a8  1a83312d       csel w13, w9, w3, lo
0x100482f8c6ec   1ac  d280000e       movz x14, #0x0
0x100482f8c6f0   1b0  f90037eb       str x11, [sp, #104]
0x100482f8c6f4   1b4  f90047ed       str x13, [sp, #136]
0x100482f8c6f8   1b8  350000cd       cbnz w13, #+0x18 (addr 0x100482f8c710)
0x100482f8c6fc   1bc  91001109       add x9, x8, #0x4 (4)
0x100482f8c700   1c0  b86968c9       ldr w9, [x6, x9]
0x100482f8c704   1c4  aa0903f4       mov x20, x9
0x100482f8c708   1c8  aa0a03e9       mov x9, x10
0x100482f8c70c   1cc  14000045       b #+0x114 (addr 0x100482f8c820)
0x100482f8c710   1d0  aa0a03e9       mov x9, x10
0x100482f8c714   1d4  b86968ca       ldr w10, [x6, x9]
0x100482f8c718   1d8  7100015f       cmp w10, #0x0 (0)
0x100482f8c71c   1dc  9a9f07ef       cset x15, ne
0x100482f8c720   1e0  4b0f014a       sub w10, w10, w15
0x100482f8c724   1e4  b86c68cf       ldr w15, [x6, x12]
0x100482f8c728   1e8  710001ff       cmp w15, #0x0 (0)
0x100482f8c72c   1ec  9a9f07f3       cset x19, ne
0x100482f8c730   1f0  4b1301f3       sub w19, w15, w19
0x100482f8c734   1f4  91001114       add x20, x8, #0x4 (4)
0x100482f8c738   1f8  b87468d4       ldr w20, [x6, x20]
0x100482f8c73c   1fc  91009115       add x21, x8, #0x24 (36)
0x100482f8c740   200  bc7568c0       ldr s0, [x6, x21]
0x100482f8c744   204  aa0d03f5       mov x21, x13
0x100482f8c748   208  aa0403f6       mov x22, x4
0x100482f8c74c   20c  aa0203f7       mov x23, x2
0x100482f8c750   210  d2800038       movz x24, #0x1
0x100482f8c754   214  f8520359       ldur x25, [x26, #-224]
0x100482f8c758   218  eb3963ff       cmp sp, x25
0x100482f8c75c   21c  54002d89       b.ls #+0x5b0 (addr 0x100482f8cd0c)
0x100482f8c760   220  2a1703f9       mov w25, w23
0x100482f8c764   224  bc7968c1       ldr s1, [x6, x25]
0x100482f8c768   228  1e200821       fmul s1, s1, s0
0x100482f8c76c   22c  1e212020       fcmp s1, s1
0x100482f8c770   230  1e211de1       fcsel s1, s15, s1, ne
0x100482f8c774   234  1e202028       fcmp s1, #0.0
0x100482f8c778   238  1e2fcc21       fcsel s1, s1, s15, gt
0x100482f8c77c   23c  1e22c022       fcvt d2, s1
0x100482f8c780   240  1e65c043       frintz d3, d2
0x100482f8c784   244  1e790079       fcvtzu w25, d3
0x100482f8c788   248  1e630324       ucvtf d4, w25
0x100482f8c78c   24c  1e642060       fcmp d3, d4
0x100482f8c790   250  54002fc1       b.ne #+0x5f8 (addr 0x100482f8cd88)
0x100482f8c794   254  6b19027f       cmp w19, w25
0x100482f8c798   258  1a99327b       csel w27, w19, w25, lo
0x100482f8c79c   25c  11000779       add w25, w27, #0x1 (1)
0x100482f8c7a0   260  52a9f010       movz w16, #0x4f800000
0x100482f8c7a4   264  1e270202       fmov s2, w16
0x100482f8c7a8   268  1e222020       fcmp s1, s2
0x100482f8c7ac   26c  1a983339       csel w25, w25, w24, lo
0x100482f8c7b0   270  2a1603fb       mov w27, w22
0x100482f8c7b4   274  bc7b68c1       ldr s1, [x6, x27]
0x100482f8c7b8   278  1e200821       fmul s1, s1, s0
0x100482f8c7bc   27c  1e212020       fcmp s1, s1
0x100482f8c7c0   280  1e211de1       fcsel s1, s15, s1, ne
0x100482f8c7c4   284  1e202028       fcmp s1, #0.0
0x100482f8c7c8   288  1e2fcc21       fcsel s1, s1, s15, gt
0x100482f8c7cc   28c  1e22c023       fcvt d3, s1
0x100482f8c7d0   290  1e65c064       frintz d4, d3
0x100482f8c7d4   294  1e79009b       fcvtzu w27, d4
0x100482f8c7d8   298  1e630365       ucvtf d5, w27
0x100482f8c7dc   29c  1e652080       fcmp d4, d5
0x100482f8c7e0   2a0  54002e41       b.ne #+0x5c8 (addr 0x100482f8cda8)
0x100482f8c7e4   2a4  6b1b015f       cmp w10, w27
0x100482f8c7e8   2a8  1a9b315c       csel w28, w10, w27, lo
0x100482f8c7ec   2ac  1e222020       fcmp s1, s2
0x100482f8c7f0   2b0  1a9f339b       csel w27, w28, wzr, lo
0x100482f8c7f4   2b4  1b0f6779       madd w25, w27, w15, w25
0x100482f8c7f8   2b8  6b19017f       cmp w11, w25
0x100482f8c7fc   2bc  540000a9       b.ls #+0x14 (addr 0x100482f8c810)
0x100482f8c800   2c0  0b190a99       add w25, w20, w25, lsl #2
0x100482f8c804   2c4  b87968db       ldr w27, [x6, x25]
0x100482f8c808   2c8  1100077b       add w27, w27, #0x1 (1)
0x100482f8c80c   2cc  b83968db       str w27, [x6, x25]
0x100482f8c810   2d0  110012f7       add w23, w23, #0x4 (4)
0x100482f8c814   2d4  110012d6       add w22, w22, #0x4 (4)
0x100482f8c818   2d8  510006b5       sub w21, w21, #0x1 (1)
0x100482f8c81c   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0x100482f8c754)
0x100482f8c820   2e0  f90007f4       str x20, [sp, #8]
0x100482f8c824   2e4  3500006b       cbnz w11, #+0xc (addr 0x100482f8c830)
0x100482f8c828   2e8  aa0e03ea       mov x10, x14
0x100482f8c82c   2ec  1400008f       b #+0x23c (addr 0x100482f8ca68)
0x100482f8c830   2f0  531e7565       lsl w5, w11, #2
0x100482f8c834   2f4  510010aa       sub w10, w5, #0x4 (4)
0x100482f8c838   2f8  53027d4f       lsr w15, w10, #2
0x100482f8c83c   2fc  110005ef       add w15, w15, #0x1 (1)
0x100482f8c840   300  120009f3       and w19, w15, #0x7
0x100482f8c844   304  f90033e5       str x5, [sp, #96]
0x100482f8c848   308  7100715f       cmp w10, #0x1c (28)
0x100482f8c84c   30c  54000563       b.lo #+0xac (addr 0x100482f8c8f8)
0x100482f8c850   310  121d6dea       and w10, w15, #0x7ffffff8
0x100482f8c854   314  aa1403ef       mov x15, x20
0x100482f8c858   318  aa0e03f5       mov x21, x14
0x100482f8c85c   31c  f8520356       ldur x22, [x26, #-224]
0x100482f8c860   320  eb3663ff       cmp sp, x22
0x100482f8c864   324  54002b29       b.ls #+0x564 (addr 0x100482f8cdc8)
0x100482f8c868   328  b86f68d6       ldr w22, [x6, x15]
0x100482f8c86c   32c  0b1502d5       add w21, w22, w21
0x100482f8c870   330  b82f68d5       str w21, [x6, x15]
0x100482f8c874   334  110011f6       add w22, w15, #0x4 (4)
0x100482f8c878   338  b87668d7       ldr w23, [x6, x22]
0x100482f8c87c   33c  0b1502f5       add w21, w23, w21
0x100482f8c880   340  b83668d5       str w21, [x6, x22]
0x100482f8c884   344  110021f6       add w22, w15, #0x8 (8)
0x100482f8c888   348  b87668d7       ldr w23, [x6, x22]
0x100482f8c88c   34c  0b1502f5       add w21, w23, w21
0x100482f8c890   350  b83668d5       str w21, [x6, x22]
0x100482f8c894   354  110031f6       add w22, w15, #0xc (12)
0x100482f8c898   358  b87668d7       ldr w23, [x6, x22]
0x100482f8c89c   35c  0b1502f5       add w21, w23, w21
0x100482f8c8a0   360  b83668d5       str w21, [x6, x22]
0x100482f8c8a4   364  110041f6       add w22, w15, #0x10 (16)
0x100482f8c8a8   368  b87668d7       ldr w23, [x6, x22]
0x100482f8c8ac   36c  0b1502f5       add w21, w23, w21
0x100482f8c8b0   370  b83668d5       str w21, [x6, x22]
0x100482f8c8b4   374  110051f6       add w22, w15, #0x14 (20)
0x100482f8c8b8   378  b87668d7       ldr w23, [x6, x22]
0x100482f8c8bc   37c  0b1502f5       add w21, w23, w21
0x100482f8c8c0   380  b83668d5       str w21, [x6, x22]
0x100482f8c8c4   384  110061f6       add w22, w15, #0x18 (24)
0x100482f8c8c8   388  b87668d7       ldr w23, [x6, x22]
0x100482f8c8cc   38c  0b1502f5       add w21, w23, w21
0x100482f8c8d0   390  b83668d5       str w21, [x6, x22]
0x100482f8c8d4   394  110071f6       add w22, w15, #0x1c (28)
0x100482f8c8d8   398  b87668d7       ldr w23, [x6, x22]
0x100482f8c8dc   39c  0b1502f5       add w21, w23, w21
0x100482f8c8e0   3a0  b83668d5       str w21, [x6, x22]
0x100482f8c8e4   3a4  110081ef       add w15, w15, #0x20 (32)
0x100482f8c8e8   3a8  5100214a       sub w10, w10, #0x8 (8)
0x100482f8c8ec   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0x100482f8c85c)
0x100482f8c8f0   3b0  35000093       cbnz w19, #+0x10 (addr 0x100482f8c900)
0x100482f8c8f4   3b4  1400001f       b #+0x7c (addr 0x100482f8c970)
0x100482f8c8f8   3b8  aa0e03f5       mov x21, x14
0x100482f8c8fc   3bc  aa1403ef       mov x15, x20
0x100482f8c900   3c0  531e766a       lsl w10, w19, #2
0x100482f8c904   3c4  b86f68d3       ldr w19, [x6, x15]
0x100482f8c908   3c8  0b150273       add w19, w19, w21
0x100482f8c90c   3cc  b82f68d3       str w19, [x6, x15]
0x100482f8c910   3d0  110011ef       add w15, w15, #0x4 (4)
0x100482f8c914   3d4  5100114a       sub w10, w10, #0x4 (4)
0x100482f8c918   3d8  340002ca       cbz w10, #+0x58 (addr 0x100482f8c970)
0x100482f8c91c   3dc  b86f68d5       ldr w21, [x6, x15]
0x100482f8c920   3e0  0b1302b3       add w19, w21, w19
0x100482f8c924   3e4  b82f68d3       str w19, [x6, x15]
0x100482f8c928   3e8  110011ef       add w15, w15, #0x4 (4)
0x100482f8c92c   3ec  5100114a       sub w10, w10, #0x4 (4)
0x100482f8c930   3f0  3400020a       cbz w10, #+0x40 (addr 0x100482f8c970)
0x100482f8c934   3f4  b86f68d5       ldr w21, [x6, x15]
0x100482f8c938   3f8  0b1302b3       add w19, w21, w19
0x100482f8c93c   3fc  b82f68d3       str w19, [x6, x15]
0x100482f8c940   400  110011ef       add w15, w15, #0x4 (4)
0x100482f8c944   404  5100114a       sub w10, w10, #0x4 (4)
0x100482f8c948   408  3400014a       cbz w10, #+0x28 (addr 0x100482f8c970)
0x100482f8c94c   40c  f8520355       ldur x21, [x26, #-224]
0x100482f8c950   410  eb3563ff       cmp sp, x21
0x100482f8c954   414  540026a9       b.ls #+0x4d4 (addr 0x100482f8ce28)
0x100482f8c958   418  b86f68d5       ldr w21, [x6, x15]
0x100482f8c95c   41c  0b1302b5       add w21, w21, w19
0x100482f8c960   420  b82f68d5       str w21, [x6, x15]
0x100482f8c964   424  110011ef       add w15, w15, #0x4 (4)
0x100482f8c968   428  5100114a       sub w10, w10, #0x4 (4)
0x100482f8c96c   42c  35fffcca       cbnz w10, #-0x68 (addr 0x100482f8c904)
0x100482f8c970   430  9100510a       add x10, x8, #0x14 (20)
0x100482f8c974   434  b82a68df       str wzr, [x6, x10]
0x100482f8c978   438  9100310f       add x15, x8, #0xc (12)
0x100482f8c97c   43c  b86f68cf       ldr w15, [x6, x15]
0x100482f8c980   440  f9003bea       str x10, [sp, #112]
0x100482f8c984   444  6b0f017f       cmp w11, w15
0x100482f8c988   448  54000309       b.ls #+0x60 (addr 0x100482f8c9e8)
0x100482f8c98c   44c  aa0003ef       mov x15, x0
0x100482f8c990   450  110031e0       add w0, w15, #0xc (12)
0x100482f8c994   454  aa0b03e3       mov x3, x11
0x100482f8c998   458  aa0e03e2       mov x2, x14
0x100482f8c99c   45c  97fc0339       bl #-0xff31c (addr 0x100482e8d680)
0x100482f8c9a0   460  f9403fe6       ldr x6, [sp, #120]
0x100482f8c9a4   464  f9403be8       ldr x8, [sp, #112]
0x100482f8c9a8   468  b86868c8       ldr w8, [x6, x8]
0x100482f8c9ac   46c  aa0803ea       mov x10, x8
0x100482f8c9b0   470  f94047ed       ldr x13, [sp, #136]
0x100482f8c9b4   474  d280000e       movz x14, #0x0
0x100482f8c9b8   478  f9401be4       ldr x4, [sp, #48]
0x100482f8c9bc   47c  f94017e2       ldr x2, [sp, #40]
0x100482f8c9c0   480  f94043e8       ldr x8, [sp, #128]
0x100482f8c9c4   484  f9400fec       ldr x12, [sp, #24]
0x100482f8c9c8   488  f9400be9       ldr x9, [sp, #16]
0x100482f8c9cc   48c  f9401fe3       ldr x3, [sp, #56]
0x100482f8c9d0   490  f9404be7       ldr x7, [sp, #144]
0x100482f8c9d4   494  f94013e0       ldr x0, [sp, #32]
0x100482f8c9d8   498  f94037eb       ldr x11, [sp, #104]
0x100482f8c9dc   49c  f94033e5       ldr x5, [sp, #96]
0x100482f8c9e0   4a0  f94007f4       ldr x20, [sp, #8]
0x100482f8c9e4   4a4  14000002       b #+0x8 (addr 0x100482f8c9ec)
0x100482f8c9e8   4a8  aa0e03ea       mov x10, x14
0x100482f8c9ec   4ac  531e756f       lsl w15, w11, #2
0x100482f8c9f0   4b0  f9003bea       str x10, [sp, #112]
0x100482f8c9f4   4b4  340003af       cbz w15, #+0x74 (addr 0x100482f8ca68)
0x100482f8c9f8   4b8  9100410f       add x15, x8, #0x10 (16)
0x100482f8c9fc   4bc  b86f68cf       ldr w15, [x6, x15]
0x100482f8ca00   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0x100482f8ca04   4c4  aa0703e0       mov x0, x7
0x100482f8ca08   4c8  aa0e03e1       mov x1, x14
0x100482f8ca0c   4cc  aa0e03e2       mov x2, x14
0x100482f8ca10   4d0  aa0f03e3       mov x3, x15
0x100482f8ca14   4d4  aa1403e4       mov x4, x20
0x100482f8ca18   4d8  58002990       ldr x16, pc+1328 (addr 0x0000100482f8cf48)
0x100482f8ca1c   4dc  10000068       adr x8, #+0xc (addr 0x100482f8ca28)
0x100482f8ca20   4e0  a9027748       stp x8, fp, [x26, #32]
0x100482f8ca24   4e4  d63f0200       blr x16
0x100482f8ca28   4e8  f900175f       str xzr, [x26, #40]
0x100482f8ca2c   4ec  6a00001f       tst w0, w0
0x100482f8ca30   4f0  54002800       b.eq #+0x500 (addr 0x100482f8cf30)
0x100482f8ca34   4f4  f9403bea       ldr x10, [sp, #112]
0x100482f8ca38   4f8  f94047ed       ldr x13, [sp, #136]
0x100482f8ca3c   4fc  f9403fe6       ldr x6, [sp, #120]
0x100482f8ca40   500  d280000e       movz x14, #0x0
0x100482f8ca44   504  f9401be4       ldr x4, [sp, #48]
0x100482f8ca48   508  f94017e2       ldr x2, [sp, #40]
0x100482f8ca4c   50c  f94043e8       ldr x8, [sp, #128]
0x100482f8ca50   510  f9400fec       ldr x12, [sp, #24]
0x100482f8ca54   514  f9400be9       ldr x9, [sp, #16]
0x100482f8ca58   518  f9401fe3       ldr x3, [sp, #56]
0x100482f8ca5c   51c  f9404be7       ldr x7, [sp, #144]
0x100482f8ca60   520  f94013e0       ldr x0, [sp, #32]
0x100482f8ca64   524  f94037eb       ldr x11, [sp, #104]
0x100482f8ca68   528  9100810f       add x15, x8, #0x20 (32)
0x100482f8ca6c   52c  b82f68df       str wzr, [x6, x15]
0x100482f8ca70   530  0b0b014a       add w10, w10, w11
0x100482f8ca74   534  9100510b       add x11, x8, #0x14 (20)
0x100482f8ca78   538  b82b68ca       str w10, [x6, x11]
0x100482f8ca7c   53c  f9003bef       str x15, [sp, #112]
0x100482f8ca80   540  f9002feb       str x11, [sp, #88]
0x100482f8ca84   544  35000063       cbnz w3, #+0xc (addr 0x100482f8ca90)
0x100482f8ca88   548  aa0e03ea       mov x10, x14
0x100482f8ca8c   54c  14000048       b #+0x120 (addr 0x100482f8cbac)
0x100482f8ca90   550  9100610a       add x10, x8, #0x18 (24)
0x100482f8ca94   554  b86a68ca       ldr w10, [x6, x10]
0x100482f8ca98   558  6b0a007f       cmp w3, w10
0x100482f8ca9c   55c  540002a9       b.ls #+0x54 (addr 0x100482f8caf0)
0x100482f8caa0   560  aa0003ea       mov x10, x0
0x100482f8caa4   564  11006140       add w0, w10, #0x18 (24)
0x100482f8caa8   568  aa0e03e2       mov x2, x14
0x100482f8caac   56c  97fc02f5       bl #-0xff42c (addr 0x100482e8d680)
0x100482f8cab0   570  f9403fe6       ldr x6, [sp, #120]
0x100482f8cab4   574  f9403be8       ldr x8, [sp, #112]
0x100482f8cab8   578  b86868c9       ldr w9, [x6, x8]
0x100482f8cabc   57c  aa0903ea       mov x10, x9
0x100482f8cac0   580  f94047ed       ldr x13, [sp, #136]
0x100482f8cac4   584  d280000e       movz x14, #0x0
0x100482f8cac8   588  f9401be4       ldr x4, [sp, #48]
0x100482f8cacc   58c  f94017e2       ldr x2, [sp, #40]
0x100482f8cad0   590  aa0803ef       mov x15, x8
0x100482f8cad4   594  f94043e8       ldr x8, [sp, #128]
0x100482f8cad8   598  f9402feb       ldr x11, [sp, #88]
0x100482f8cadc   59c  f9400fec       ldr x12, [sp, #24]
0x100482f8cae0   5a0  f9400be9       ldr x9, [sp, #16]
0x100482f8cae4   5a4  f9401fe3       ldr x3, [sp, #56]
0x100482f8cae8   5a8  f9404be7       ldr x7, [sp, #144]
0x100482f8caec   5ac  14000002       b #+0x8 (addr 0x100482f8caf4)
0x100482f8caf0   5b0  aa0e03ea       mov x10, x14
0x100482f8caf4   5b4  91007113       add x19, x8, #0x1c (28)
0x100482f8caf8   5b8  b87368d3       ldr w19, [x6, x19]
0x100482f8cafc   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0x100482f8cb00   5c0  f90037ea       str x10, [sp, #104]
0x100482f8cb04   5c4  f90033f3       str x19, [sp, #96]
0x100482f8cb08   5c8  aa0303f5       mov x21, x3
0x100482f8cb0c   5cc  710006bf       cmp w21, #0x1 (1)
0x100482f8cb10   5d0  540004a0       b.eq #+0x94 (addr 0x100482f8cba4)
0x100482f8cb14   5d4  531e76b6       lsl w22, w21, #2
0x100482f8cb18   5d8  510012d6       sub w22, w22, #0x4 (4)
0x100482f8cb1c   5dc  34000356       cbz w22, #+0x68 (addr 0x100482f8cb84)
0x100482f8cb20   5e0  aa0703e0       mov x0, x7
0x100482f8cb24   5e4  aa0e03e1       mov x1, x14
0x100482f8cb28   5e8  aa1403e2       mov x2, x20
0x100482f8cb2c   5ec  aa0e03e3       mov x3, x14
0x100482f8cb30   5f0  aa1603e4       mov x4, x22
0x100482f8cb34   5f4  580020f0       ldr x16, pc+1052 (addr 0x0000100482f8cf50)    ;; external reference (wasm::memory_fill)
0x100482f8cb38   5f8  10000068       adr x8, #+0xc (addr 0x100482f8cb44)
0x100482f8cb3c   5fc  a9027748       stp x8, fp, [x26, #32]
0x100482f8cb40   600  d63f0200       blr x16
0x100482f8cb44   604  f900175f       str xzr, [x26, #40]
0x100482f8cb48   608  6a00001f       tst w0, w0
0x100482f8cb4c   60c  54001f00       b.eq #+0x3e0 (addr 0x100482f8cf2c)
0x100482f8cb50   610  f94047ed       ldr x13, [sp, #136]
0x100482f8cb54   614  f9403fe6       ldr x6, [sp, #120]
0x100482f8cb58   618  d280000e       movz x14, #0x0
0x100482f8cb5c   61c  f9401be4       ldr x4, [sp, #48]
0x100482f8cb60   620  f94017e2       ldr x2, [sp, #40]
0x100482f8cb64   624  f94043e8       ldr x8, [sp, #128]
0x100482f8cb68   628  f9402feb       ldr x11, [sp, #88]
0x100482f8cb6c   62c  f9400fec       ldr x12, [sp, #24]
0x100482f8cb70   630  f9400be9       ldr x9, [sp, #16]
0x100482f8cb74   634  f9403bef       ldr x15, [sp, #112]
0x100482f8cb78   638  f94037ea       ldr x10, [sp, #104]
0x100482f8cb7c   63c  f94033f3       ldr x19, [sp, #96]
0x100482f8cb80   640  f9401ff5       ldr x21, [sp, #56]
0x100482f8cb84   644  aa1503f4       mov x20, x21
0x100482f8cb88   648  0b14014a       add w10, w10, w20
0x100482f8cb8c   64c  51000554       sub w20, w10, #0x1 (1)
0x100482f8cb90   650  0b0a0a6a       add w10, w19, w10, lsl #2
0x100482f8cb94   654  5100114a       sub w10, w10, #0x4 (4)
0x100482f8cb98   658  aa0a03f0       mov x16, x10
0x100482f8cb9c   65c  aa1403ea       mov x10, x20
0x100482f8cba0   660  aa1003f4       mov x20, x16
0x100482f8cba4   664  b83468df       str wzr, [x6, x20]
0x100482f8cba8   668  1100054a       add w10, w10, #0x1 (1)
0x100482f8cbac   66c  b82f68ca       str w10, [x6, x15]
0x100482f8cbb0   670  3500008d       cbnz w13, #+0x10 (addr 0x100482f8cbc0)
0x100482f8cbb4   674  910003bf       mov sp, fp
0x100482f8cbb8   678  a8c17bfd       ldp fp, lr, [sp], #16
0x100482f8cbbc   67c  d65f03c0       ret
0x100482f8cbc0   680  b86968c9       ldr w9, [x6, x9]
0x100482f8cbc4   684  7100013f       cmp w9, #0x0 (0)
0x100482f8cbc8   688  9a9f07ef       cset x15, ne
0x100482f8cbcc   68c  4b0f0129       sub w9, w9, w15
0x100482f8cbd0   690  b86c68cc       ldr w12, [x6, x12]
0x100482f8cbd4   694  7100019f       cmp w12, #0x0 (0)
0x100482f8cbd8   698  9a9f07ef       cset x15, ne
0x100482f8cbdc   69c  4b0f018f       sub w15, w12, w15
0x100482f8cbe0   6a0  91007113       add x19, x8, #0x1c (28)
0x100482f8cbe4   6a4  b87368d3       ldr w19, [x6, x19]
0x100482f8cbe8   6a8  91004114       add x20, x8, #0x10 (16)
0x100482f8cbec   6ac  b87468d4       ldr w20, [x6, x20]
0x100482f8cbf0   6b0  b86b68cb       ldr w11, [x6, x11]
0x100482f8cbf4   6b4  91009108       add x8, x8, #0x24 (36)
0x100482f8cbf8   6b8  bc6868c0       ldr s0, [x6, x8]
0x100482f8cbfc   6bc  aa0e03e8       mov x8, x14
0x100482f8cc00   6c0  f8520355       ldur x21, [x26, #-224]
0x100482f8cc04   6c4  eb3563ff       cmp sp, x21
0x100482f8cc08   6c8  540013c9       b.ls #+0x278 (addr 0x100482f8ce80)
0x100482f8cc0c   6cc  2a0403f5       mov w21, w4
0x100482f8cc10   6d0  bc7568c1       ldr s1, [x6, x21]
0x100482f8cc14   6d4  1e200821       fmul s1, s1, s0
0x100482f8cc18   6d8  1e212020       fcmp s1, s1
0x100482f8cc1c   6dc  1e211de1       fcsel s1, s15, s1, ne
0x100482f8cc20   6e0  1e202028       fcmp s1, #0.0
0x100482f8cc24   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0x100482f8cc28   6e8  1e22c022       fcvt d2, s1
0x100482f8cc2c   6ec  1e65c043       frintz d3, d2
0x100482f8cc30   6f0  1e790075       fcvtzu w21, d3
0x100482f8cc34   6f4  1e6302a4       ucvtf d4, w21
0x100482f8cc38   6f8  1e642060       fcmp d3, d4
0x100482f8cc3c   6fc  54001581       b.ne #+0x2b0 (addr 0x100482f8ceec)
0x100482f8cc40   700  6b15013f       cmp w9, w21
0x100482f8cc44   704  1a953136       csel w22, w9, w21, lo
0x100482f8cc48   708  52a9f010       movz w16, #0x4f800000
0x100482f8cc4c   70c  1e270202       fmov s2, w16
0x100482f8cc50   710  1e222020       fcmp s1, s2
0x100482f8cc54   714  1a9f32d5       csel w21, w22, wzr, lo
0x100482f8cc58   718  1b0c7eb5       mul w21, w21, w12
0x100482f8cc5c   71c  2a0203f6       mov w22, w2
0x100482f8cc60   720  bc7668c1       ldr s1, [x6, x22]
0x100482f8cc64   724  1e200821       fmul s1, s1, s0
0x100482f8cc68   728  1e212020       fcmp s1, s1
0x100482f8cc6c   72c  1e211de1       fcsel s1, s15, s1, ne
0x100482f8cc70   730  1e202028       fcmp s1, #0.0
0x100482f8cc74   734  1e2fcc21       fcsel s1, s1, s15, gt
0x100482f8cc78   738  1e22c023       fcvt d3, s1
0x100482f8cc7c   73c  1e65c064       frintz d4, d3
0x100482f8cc80   740  1e790096       fcvtzu w22, d4
0x100482f8cc84   744  1e6302c5       ucvtf d5, w22
0x100482f8cc88   748  1e652080       fcmp d4, d5
0x100482f8cc8c   74c  54001401       b.ne #+0x280 (addr 0x100482f8cf0c)
0x100482f8cc90   750  6b1601ff       cmp w15, w22
0x100482f8cc94   754  1a9631f7       csel w23, w15, w22, lo
0x100482f8cc98   758  1e222020       fcmp s1, s2
0x100482f8cc9c   75c  1a9f32f6       csel w22, w23, wzr, lo
0x100482f8cca0   760  0b1602b5       add w21, w21, w22
0x100482f8cca4   764  6b15017f       cmp w11, w21
0x100482f8cca8   768  54000149       b.ls #+0x28 (addr 0x100482f8ccd0)
0x100482f8ccac   76c  0b150a95       add w21, w20, w21, lsl #2
0x100482f8ccb0   770  b87568d6       ldr w22, [x6, x21]
0x100482f8ccb4   774  6b16015f       cmp w10, w22
0x100482f8ccb8   778  54000089       b.ls #+0x10 (addr 0x100482f8ccc8)
0x100482f8ccbc   77c  0b160a76       add w22, w19, w22, lsl #2
0x100482f8ccc0   780  b83668c8       str w8, [x6, x22]
0x100482f8ccc4   784  b87568d6       ldr w22, [x6, x21]
0x100482f8ccc8   788  110006d6       add w22, w22, #0x1 (1)
0x100482f8cccc   78c  b83568d6       str w22, [x6, x21]
0x100482f8ccd0   790  11001042       add w2, w2, #0x4 (4)
0x100482f8ccd4   794  11001084       add w4, w4, #0x4 (4)
0x100482f8ccd8   798  11000508       add w8, w8, #0x1 (1)
0x100482f8ccdc   79c  6b0801bf       cmp w13, w8
0x100482f8cce0   7a0  54fff6a0       b.eq #-0x12c (addr 0x100482f8cbb4)
0x100482f8cce4   7a4  17ffffc7       b #-0xe4 (addr 0x100482f8cc00)
0x100482f8cce8   7a8  97fc03ba       bl #-0xff118 (addr 0x100482e8dbd0)
0x100482f8ccec   7ac  f9403fe6       ldr x6, [sp, #120]
0x100482f8ccf0   7b0  f9401be4       ldr x4, [sp, #48]
0x100482f8ccf4   7b4  f94017e2       ldr x2, [sp, #40]
0x100482f8ccf8   7b8  f9401fe3       ldr x3, [sp, #56]
0x100482f8ccfc   7bc  f9404be7       ldr x7, [sp, #144]
0x100482f8cd00   7c0  f94013e0       ldr x0, [sp, #32]
0x100482f8cd04   7c4  f94027e5       ldr x5, [sp, #72]
0x100482f8cd08   7c8  17fffe1d       b #-0x78c (addr 0x100482f8c57c)
0x100482f8cd0c   7cc  f90007f4       str x20, [sp, #8]
0x100482f8cd10   7d0  f9003bf5       str x21, [sp, #112]
0x100482f8cd14   7d4  f90023f6       str x22, [sp, #64]
0x100482f8cd18   7d8  f90003f7       str x23, [sp]
0x100482f8cd1c   7dc  f90033ef       str x15, [sp, #96]
0x100482f8cd20   7e0  f9002fea       str x10, [sp, #88]
0x100482f8cd24   7e4  fd002be0       str d0, [sp, #80]
0x100482f8cd28   7e8  f90027f3       str x19, [sp, #72]
0x100482f8cd2c   7ec  97fc03a9       bl #-0xff15c (addr 0x100482e8dbd0)
0x100482f8cd30   7f0  f94047ed       ldr x13, [sp, #136]
0x100482f8cd34   7f4  f9403fe6       ldr x6, [sp, #120]
0x100482f8cd38   7f8  d280000e       movz x14, #0x0
0x100482f8cd3c   7fc  f9401be4       ldr x4, [sp, #48]
0x100482f8cd40   800  f94017e2       ldr x2, [sp, #40]
0x100482f8cd44   804  f94043e8       ldr x8, [sp, #128]
0x100482f8cd48   808  f9400fec       ldr x12, [sp, #24]
0x100482f8cd4c   80c  f9400be9       ldr x9, [sp, #16]
0x100482f8cd50   810  f9401fe3       ldr x3, [sp, #56]
0x100482f8cd54   814  f9404be7       ldr x7, [sp, #144]
0x100482f8cd58   818  f94013e0       ldr x0, [sp, #32]
0x100482f8cd5c   81c  f94037eb       ldr x11, [sp, #104]
0x100482f8cd60   820  f94007f4       ldr x20, [sp, #8]
0x100482f8cd64   824  f9403bf5       ldr x21, [sp, #112]
0x100482f8cd68   828  f94023f6       ldr x22, [sp, #64]
0x100482f8cd6c   82c  f94003f7       ldr x23, [sp]
0x100482f8cd70   830  f94033ef       ldr x15, [sp, #96]
0x100482f8cd74   834  f9402fea       ldr x10, [sp, #88]
0x100482f8cd78   838  fd402be0       ldr d0, [sp, #80]
0x100482f8cd7c   83c  d2800038       movz x24, #0x1
0x100482f8cd80   840  f94027f3       ldr x19, [sp, #72]
0x100482f8cd84   844  17fffe77       b #-0x624 (addr 0x100482f8c760)
0x100482f8cd88   848  1e622040       fcmp d2, d2
0x100482f8cd8c   84c  54000060       b.eq #+0xc (addr 0x100482f8cd98)
0x100482f8cd90   850  aa0e03f9       mov x25, x14
0x100482f8cd94   854  17fffe80       b #-0x600 (addr 0x100482f8c794)
0x100482f8cd98   858  1e202028       fcmp s1, #0.0
0x100482f8cd9c   85c  54ffffa3       b.lo #-0xc (addr 0x100482f8cd90)
0x100482f8cda0   860  92800019       movn x25, #0x0
0x100482f8cda4   864  17fffe7c       b #-0x610 (addr 0x100482f8c794)
0x100482f8cda8   868  1e632060       fcmp d3, d3
0x100482f8cdac   86c  54000060       b.eq #+0xc (addr 0x100482f8cdb8)
0x100482f8cdb0   870  aa0e03fb       mov cp, x14
0x100482f8cdb4   874  17fffe8c       b #-0x5d0 (addr 0x100482f8c7e4)
0x100482f8cdb8   878  1e202028       fcmp s1, #0.0
0x100482f8cdbc   87c  54ffffa3       b.lo #-0xc (addr 0x100482f8cdb0)
0x100482f8cdc0   880  9280001b       movn cp, #0x0
0x100482f8cdc4   884  17fffe88       b #-0x5e0 (addr 0x100482f8c7e4)
0x100482f8cdc8   888  f9003bf3       str x19, [sp, #112]
0x100482f8cdcc   88c  f9002bea       str x10, [sp, #80]
0x100482f8cdd0   890  f90027ef       str x15, [sp, #72]
0x100482f8cdd4   894  f9002ff5       str x21, [sp, #88]
0x100482f8cdd8   898  97fc037e       bl #-0xff208 (addr 0x100482e8dbd0)
0x100482f8cddc   89c  f94047ed       ldr x13, [sp, #136]
0x100482f8cde0   8a0  f9403fe6       ldr x6, [sp, #120]
0x100482f8cde4   8a4  d280000e       movz x14, #0x0
0x100482f8cde8   8a8  f9401be4       ldr x4, [sp, #48]
0x100482f8cdec   8ac  f94017e2       ldr x2, [sp, #40]
0x100482f8cdf0   8b0  f94043e8       ldr x8, [sp, #128]
0x100482f8cdf4   8b4  f9400fec       ldr x12, [sp, #24]
0x100482f8cdf8   8b8  f9400be9       ldr x9, [sp, #16]
0x100482f8cdfc   8bc  f9401fe3       ldr x3, [sp, #56]
0x100482f8ce00   8c0  f9404be7       ldr x7, [sp, #144]
0x100482f8ce04   8c4  f94013e0       ldr x0, [sp, #32]
0x100482f8ce08   8c8  f94037eb       ldr x11, [sp, #104]
0x100482f8ce0c   8cc  f94033e5       ldr x5, [sp, #96]
0x100482f8ce10   8d0  f94007f4       ldr x20, [sp, #8]
0x100482f8ce14   8d4  f9403bf3       ldr x19, [sp, #112]
0x100482f8ce18   8d8  f9402bea       ldr x10, [sp, #80]
0x100482f8ce1c   8dc  f94027ef       ldr x15, [sp, #72]
0x100482f8ce20   8e0  f9402ff5       ldr x21, [sp, #88]
0x100482f8ce24   8e4  17fffe91       b #-0x5bc (addr 0x100482f8c868)
0x100482f8ce28   8e8  f9003bea       str x10, [sp, #112]
0x100482f8ce2c   8ec  f90023ef       str x15, [sp, #64]
0x100482f8ce30   8f0  f9002bf3       str x19, [sp, #80]
0x100482f8ce34   8f4  97fc0367       bl #-0xff264 (addr 0x100482e8dbd0)
0x100482f8ce38   8f8  f94047ed       ldr x13, [sp, #136]
0x100482f8ce3c   8fc  f9403fe6       ldr x6, [sp, #120]
0x100482f8ce40   900  d280000e       movz x14, #0x0
0x100482f8ce44   904  f9401be4       ldr x4, [sp, #48]
0x100482f8ce48   908  f94017e2       ldr x2, [sp, #40]
0x100482f8ce4c   90c  f94043e8       ldr x8, [sp, #128]
0x100482f8ce50   910  f9400fec       ldr x12, [sp, #24]
0x100482f8ce54   914  f9400be9       ldr x9, [sp, #16]
0x100482f8ce58   918  f9401fe3       ldr x3, [sp, #56]
0x100482f8ce5c   91c  f9404be7       ldr x7, [sp, #144]
0x100482f8ce60   920  f94013e0       ldr x0, [sp, #32]
0x100482f8ce64   924  f94037eb       ldr x11, [sp, #104]
0x100482f8ce68   928  f94033e5       ldr x5, [sp, #96]
0x100482f8ce6c   92c  f94007f4       ldr x20, [sp, #8]
0x100482f8ce70   930  f9403bea       ldr x10, [sp, #112]
0x100482f8ce74   934  f94023ef       ldr x15, [sp, #64]
0x100482f8ce78   938  f9402bf3       ldr x19, [sp, #80]
0x100482f8ce7c   93c  17fffeb7       b #-0x524 (addr 0x100482f8c958)
0x100482f8ce80   940  f90043e8       str x8, [sp, #128]
0x100482f8ce84   944  f9001be4       str x4, [sp, #48]
0x100482f8ce88   948  f90017e2       str x2, [sp, #40]
0x100482f8ce8c   94c  f9003bf3       str x19, [sp, #112]
0x100482f8ce90   950  f90037ea       str x10, [sp, #104]
0x100482f8ce94   954  f90033f4       str x20, [sp, #96]
0x100482f8ce98   958  f9002feb       str x11, [sp, #88]
0x100482f8ce9c   95c  f9002bef       str x15, [sp, #80]
0x100482f8cea0   960  fd0027e0       str d0, [sp, #72]
0x100482f8cea4   964  f90023ec       str x12, [sp, #64]
0x100482f8cea8   968  f9001fe9       str x9, [sp, #56]
0x100482f8ceac   96c  97fc0349       bl #-0xff2dc (addr 0x100482e8dbd0)
0x100482f8ceb0   970  f94047ed       ldr x13, [sp, #136]
0x100482f8ceb4   974  f94043e8       ldr x8, [sp, #128]
0x100482f8ceb8   978  f9401be4       ldr x4, [sp, #48]
0x100482f8cebc   97c  f94017e2       ldr x2, [sp, #40]
0x100482f8cec0   980  f9403fe6       ldr x6, [sp, #120]
0x100482f8cec4   984  f9403bf3       ldr x19, [sp, #112]
0x100482f8cec8   988  f94037ea       ldr x10, [sp, #104]
0x100482f8cecc   98c  f94033f4       ldr x20, [sp, #96]
0x100482f8ced0   990  f9402feb       ldr x11, [sp, #88]
0x100482f8ced4   994  f9402bef       ldr x15, [sp, #80]
0x100482f8ced8   998  d280000e       movz x14, #0x0
0x100482f8cedc   99c  fd4027e0       ldr d0, [sp, #72]
0x100482f8cee0   9a0  f94023ec       ldr x12, [sp, #64]
0x100482f8cee4   9a4  f9401fe9       ldr x9, [sp, #56]
0x100482f8cee8   9a8  17ffff49       b #-0x2dc (addr 0x100482f8cc0c)
0x100482f8ceec   9ac  1e622040       fcmp d2, d2
0x100482f8cef0   9b0  54000060       b.eq #+0xc (addr 0x100482f8cefc)
0x100482f8cef4   9b4  aa0e03f5       mov x21, x14
0x100482f8cef8   9b8  17ffff52       b #-0x2b8 (addr 0x100482f8cc40)
0x100482f8cefc   9bc  1e202028       fcmp s1, #0.0
0x100482f8cf00   9c0  54ffffa3       b.lo #-0xc (addr 0x100482f8cef4)
0x100482f8cf04   9c4  92800015       movn x21, #0x0
0x100482f8cf08   9c8  17ffff4e       b #-0x2c8 (addr 0x100482f8cc40)
0x100482f8cf0c   9cc  1e632060       fcmp d3, d3
0x100482f8cf10   9d0  54000060       b.eq #+0xc (addr 0x100482f8cf1c)
0x100482f8cf14   9d4  aa0e03f6       mov x22, x14
0x100482f8cf18   9d8  17ffff5e       b #-0x288 (addr 0x100482f8cc90)
0x100482f8cf1c   9dc  1e202028       fcmp s1, #0.0
0x100482f8cf20   9e0  54ffffa3       b.lo #-0xc (addr 0x100482f8cf14)
0x100482f8cf24   9e4  92800016       movn x22, #0x0
0x100482f8cf28   9e8  17ffff5a       b #-0x298 (addr 0x100482f8cc90)
0x100482f8cf2c   9ec  97fc0279       bl #-0xff61c (addr 0x100482e8d910)
0x100482f8cf30   9f0  97fc0278       bl #-0xff620 (addr 0x100482e8d910)
0x100482f8cf34   9f4  97fc0277       bl #-0xff624 (addr 0x100482e8d910)
0x100482f8cf38   9f8  d503201f       nop
0x100482f8cf3c   9fc  580000df       constant pool begin (num_const = 6)
0x100482f8cf40   a00  d63f03e0       constant
0x100482f8cf44   a04  d503201f       constant
0x100482f8cf48   a08  01c0ea68       constant
0x100482f8cf4c   a0c  00000001       constant
0x100482f8cf50   a10  01c0eaf4       constant
0x100482f8cf54   a14  00000001       constant

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
0x100482f8c5dc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x100482f8c5d8  internal wasm call
0x100482f8c65c  external reference (0x101c0eaf4)
0x100482f8c99c  internal wasm call
0x100482f8ca18  external reference (0x101c0ea68)
0x100482f8caac  internal wasm call
0x100482f8cce8  wasm stub call  (0x100482e8dbd0)
0x100482f8cd2c  wasm stub call  (0x100482e8dbd0)
0x100482f8cdd8  wasm stub call  (0x100482e8dbd0)
0x100482f8ce34  wasm stub call  (0x100482e8dbd0)
0x100482f8ceac  wasm stub call  (0x100482e8dbd0)
0x100482f8cf2c  wasm stub call  (0x100482e8d910)
0x100482f8cf30  wasm stub call  (0x100482e8d910)
0x100482f8cf34  wasm stub call  (0x100482e8d910)
0x100482f8cf3c  constant pool (size 28)
