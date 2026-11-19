name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2616 + 8 padding)
Instructions (size = 2600)
0x7937c950440     0  d2800110       movz x16, #0x8
0x7937c950444     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x7937c950448     8  a9017bfd       stp fp, lr, [sp, #16]
0x7937c95044c     c  910043fd       add fp, sp, #0x10 (16)
0x7937c950450    10  d10243ff       sub sp, sp, #0x90 (144)
0x7937c950454    14  f841f0e6       ldur x6, [x7, #31]
0x7937c950458    18  f8520348       ldur x8, [x26, #-224]
0x7937c95045c    1c  f90013e0       str x0, [sp, #32]
0x7937c950460    20  f90017e2       str x2, [sp, #40]
0x7937c950464    24  f9001fe3       str x3, [sp, #56]
0x7937c950468    28  f9001be4       str x4, [sp, #48]
0x7937c95046c    2c  f90027e5       str x5, [sp, #72]
0x7937c950470    30  f9003fe6       str x6, [sp, #120]
0x7937c950474    34  eb2863ff       cmp sp, x8
0x7937c950478    38  54003c09       b.ls #+0x780 (addr 0x7937c950bf8)
0x7937c95047c    3c  2a0003e8       mov w8, w0
0x7937c950480    40  91002109       add x9, x8, #0x8 (8)
0x7937c950484    44  b82968df       str wzr, [x6, x9]
0x7937c950488    48  9100b10a       add x10, x8, #0x2c (44)
0x7937c95048c    4c  b86a68cb       ldr w11, [x6, x10]
0x7937c950490    50  9100a10c       add x12, x8, #0x28 (40)
0x7937c950494    54  b86c68cd       ldr w13, [x6, x12]
0x7937c950498    58  1b0d7d6b       mul w11, w11, w13
0x7937c95049c    5c  1100056d       add w13, w11, #0x1 (1)
0x7937c9504a0    60  f90043e8       str x8, [sp, #128]
0x7937c9504a4    64  f90047e9       str x9, [sp, #136]
0x7937c9504a8    68  f9000bea       str x10, [sp, #16]
0x7937c9504ac    6c  f9000fec       str x12, [sp, #24]
0x7937c9504b0    70  f9002feb       str x11, [sp, #88]
0x7937c9504b4    74  f9003bed       str x13, [sp, #112]
0x7937c9504b8    78  3500006d       cbnz w13, #+0xc (addr 0x7937c9504c4)
0x7937c9504bc    7c  d280000b       movz x11, #0x0
0x7937c9504c0    80  14000047       b #+0x11c (addr 0x7937c9505dc)
0x7937c9504c4    84  b86868ce       ldr w14, [x6, x8]
0x7937c9504c8    88  6b0e01bf       cmp w13, w14
0x7937c9504cc    8c  540002a9       b.ls #+0x54 (addr 0x7937c950520)
0x7937c9504d0    90  aa0d03e3       mov x3, x13
0x7937c9504d4    94  d2800002       movz x2, #0x0
0x7937c9504d8    98  97fc046a       bl #-0xfee58 (addr 0x7937c851680)
0x7937c9504dc    9c  f9403fe6       ldr x6, [sp, #120]
0x7937c9504e0    a0  f94047e8       ldr x8, [sp, #136]
0x7937c9504e4    a4  b86868c9       ldr w9, [x6, x8]
0x7937c9504e8    a8  aa0903ee       mov x14, x9
0x7937c9504ec    ac  f9401be4       ldr x4, [sp, #48]
0x7937c9504f0    b0  f94017e2       ldr x2, [sp, #40]
0x7937c9504f4    b4  aa0803e9       mov x9, x8
0x7937c9504f8    b8  f94043e8       ldr x8, [sp, #128]
0x7937c9504fc    bc  f9400fec       ldr x12, [sp, #24]
0x7937c950500    c0  f9400bea       ldr x10, [sp, #16]
0x7937c950504    c4  f9401fe3       ldr x3, [sp, #56]
0x7937c950508    c8  f9404be7       ldr x7, [sp, #144]
0x7937c95050c    cc  f94013e0       ldr x0, [sp, #32]
0x7937c950510    d0  f94027e5       ldr x5, [sp, #72]
0x7937c950514    d4  f9403bed       ldr x13, [sp, #112]
0x7937c950518    d8  f9402feb       ldr x11, [sp, #88]
0x7937c95051c    dc  14000002       b #+0x8 (addr 0x7937c950524)
0x7937c950520    e0  d280000e       movz x14, #0x0
0x7937c950524    e4  9100110f       add x15, x8, #0x4 (4)
0x7937c950528    e8  b86f68cf       ldr w15, [x6, x15]
0x7937c95052c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x7937c950530    f0  f90033ee       str x14, [sp, #96]
0x7937c950534    f4  f90037ef       str x15, [sp, #104]
0x7937c950538    f8  340004eb       cbz w11, #+0x9c (addr 0x7937c9505d4)
0x7937c95053c    fc  531e75b4       lsl w20, w13, #2
0x7937c950540   100  51001294       sub w20, w20, #0x4 (4)
0x7937c950544   104  34000394       cbz w20, #+0x70 (addr 0x7937c9505b4)
0x7937c950548   108  aa0703e0       mov x0, x7
0x7937c95054c   10c  d2800001       movz x1, #0x0
0x7937c950550   110  aa1303e2       mov x2, x19
0x7937c950554   114  aa1403e4       mov x4, x20
0x7937c950558   118  aa0103e3       mov x3, x1
0x7937c95055c   11c  58004830       ldr x16, pc+2308 (addr 0x000007937c950e60)
0x7937c950560   120  10000068       adr x8, #+0xc (addr 0x7937c95056c)
0x7937c950564   124  a9027748       stp x8, fp, [x26, #32]
0x7937c950568   128  d63f0200       blr x16
0x7937c95056c   12c  f900175f       str xzr, [x26, #40]
0x7937c950570   130  6a00001f       tst w0, w0
0x7937c950574   134  54004680       b.eq #+0x8d0 (addr 0x7937c950e44)
0x7937c950578   138  f9403fe6       ldr x6, [sp, #120]
0x7937c95057c   13c  f9401be4       ldr x4, [sp, #48]
0x7937c950580   140  f94017e2       ldr x2, [sp, #40]
0x7937c950584   144  f94043e8       ldr x8, [sp, #128]
0x7937c950588   148  f9400fec       ldr x12, [sp, #24]
0x7937c95058c   14c  f9400bea       ldr x10, [sp, #16]
0x7937c950590   150  f9401fe3       ldr x3, [sp, #56]
0x7937c950594   154  f9404be7       ldr x7, [sp, #144]
0x7937c950598   158  f94013e0       ldr x0, [sp, #32]
0x7937c95059c   15c  f94027e5       ldr x5, [sp, #72]
0x7937c9505a0   160  f94047e9       ldr x9, [sp, #136]
0x7937c9505a4   164  f94033ee       ldr x14, [sp, #96]
0x7937c9505a8   168  f94037ef       ldr x15, [sp, #104]
0x7937c9505ac   16c  f9403bed       ldr x13, [sp, #112]
0x7937c9505b0   170  f9402feb       ldr x11, [sp, #88]
0x7937c9505b4   174  aa0e03f0       mov x16, x14
0x7937c9505b8   178  aa0b03ee       mov x14, x11
0x7937c9505bc   17c  aa1003eb       mov x11, x16
0x7937c9505c0   180  0b0e016e       add w14, w11, w14
0x7937c9505c4   184  0b0d016b       add w11, w11, w13
0x7937c9505c8   188  aa0f03ed       mov x13, x15
0x7937c9505cc   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x7937c9505d0   190  51001173       sub w19, w11, #0x4 (4)
0x7937c9505d4   194  b83368df       str wzr, [x6, x19]
0x7937c9505d8   198  110005cb       add w11, w14, #0x1 (1)
0x7937c9505dc   19c  b82968cb       str w11, [x6, x9]
0x7937c9505e0   1a0  aa0503e9       mov x9, x5
0x7937c9505e4   1a4  6b03013f       cmp w9, w3
0x7937c9505e8   1a8  1a83312d       csel w13, w9, w3, lo
0x7937c9505ec   1ac  d280000e       movz x14, #0x0
0x7937c9505f0   1b0  f90037eb       str x11, [sp, #104]
0x7937c9505f4   1b4  f90047ed       str x13, [sp, #136]
0x7937c9505f8   1b8  350000cd       cbnz w13, #+0x18 (addr 0x7937c950610)
0x7937c9505fc   1bc  91001109       add x9, x8, #0x4 (4)
0x7937c950600   1c0  b86968c9       ldr w9, [x6, x9]
0x7937c950604   1c4  aa0903f4       mov x20, x9
0x7937c950608   1c8  aa0a03e9       mov x9, x10
0x7937c95060c   1cc  14000047       b #+0x11c (addr 0x7937c950728)
0x7937c950610   1d0  aa0a03e9       mov x9, x10
0x7937c950614   1d4  b86968ca       ldr w10, [x6, x9]
0x7937c950618   1d8  7100015f       cmp w10, #0x0 (0)
0x7937c95061c   1dc  9a9f07ef       cset x15, ne
0x7937c950620   1e0  4b0f014a       sub w10, w10, w15
0x7937c950624   1e4  b86c68cf       ldr w15, [x6, x12]
0x7937c950628   1e8  710001ff       cmp w15, #0x0 (0)
0x7937c95062c   1ec  9a9f07f3       cset x19, ne
0x7937c950630   1f0  4b1301f3       sub w19, w15, w19
0x7937c950634   1f4  91001114       add x20, x8, #0x4 (4)
0x7937c950638   1f8  b87468d4       ldr w20, [x6, x20]
0x7937c95063c   1fc  91009115       add x21, x8, #0x24 (36)
0x7937c950640   200  bc7568c0       ldr s0, [x6, x21]
0x7937c950644   204  aa0d03f5       mov x21, x13
0x7937c950648   208  aa0403f6       mov x22, x4
0x7937c95064c   20c  aa0203f7       mov x23, x2
0x7937c950650   210  d2800038       movz x24, #0x1
0x7937c950654   214  f8520359       ldur x25, [x26, #-224]
0x7937c950658   218  eb3963ff       cmp sp, x25
0x7937c95065c   21c  54002e09       b.ls #+0x5c0 (addr 0x7937c950c1c)
0x7937c950660   220  2a1703f9       mov w25, w23
0x7937c950664   224  bc7968c1       ldr s1, [x6, x25]
0x7937c950668   228  1e200821       fmul s1, s1, s0
0x7937c95066c   22c  1e212020       fcmp s1, s1
0x7937c950670   230  1e211de1       fcsel s1, s15, s1, ne
0x7937c950674   234  1e202028       fcmp s1, #0.0
0x7937c950678   238  1e2fcc21       fcsel s1, s1, s15, gt
0x7937c95067c   23c  1e254021       frintm s1, s1
0x7937c950680   240  1e22c022       fcvt d2, s1
0x7937c950684   244  1e65c043       frintz d3, d2
0x7937c950688   248  1e790079       fcvtzu w25, d3
0x7937c95068c   24c  1e630324       ucvtf d4, w25
0x7937c950690   250  1e642060       fcmp d3, d4
0x7937c950694   254  54003021       b.ne #+0x604 (addr 0x7937c950c98)
0x7937c950698   258  6b19027f       cmp w19, w25
0x7937c95069c   25c  1a99327b       csel w27, w19, w25, lo
0x7937c9506a0   260  11000779       add w25, w27, #0x1 (1)
0x7937c9506a4   264  52a9f010       movz w16, #0x4f800000
0x7937c9506a8   268  1e270202       fmov s2, w16
0x7937c9506ac   26c  1e222020       fcmp s1, s2
0x7937c9506b0   270  1a983339       csel w25, w25, w24, lo
0x7937c9506b4   274  2a1603fb       mov w27, w22
0x7937c9506b8   278  bc7b68c1       ldr s1, [x6, x27]
0x7937c9506bc   27c  1e200821       fmul s1, s1, s0
0x7937c9506c0   280  1e212020       fcmp s1, s1
0x7937c9506c4   284  1e211de1       fcsel s1, s15, s1, ne
0x7937c9506c8   288  1e202028       fcmp s1, #0.0
0x7937c9506cc   28c  1e2fcc21       fcsel s1, s1, s15, gt
0x7937c9506d0   290  1e254021       frintm s1, s1
0x7937c9506d4   294  1e22c023       fcvt d3, s1
0x7937c9506d8   298  1e65c064       frintz d4, d3
0x7937c9506dc   29c  1e79009b       fcvtzu w27, d4
0x7937c9506e0   2a0  1e630365       ucvtf d5, w27
0x7937c9506e4   2a4  1e652080       fcmp d4, d5
0x7937c9506e8   2a8  54002e81       b.ne #+0x5d0 (addr 0x7937c950cb8)
0x7937c9506ec   2ac  6b1b015f       cmp w10, w27
0x7937c9506f0   2b0  1a9b315c       csel w28, w10, w27, lo
0x7937c9506f4   2b4  1e222020       fcmp s1, s2
0x7937c9506f8   2b8  1a9f339b       csel w27, w28, wzr, lo
0x7937c9506fc   2bc  1b0f6779       madd w25, w27, w15, w25
0x7937c950700   2c0  6b19017f       cmp w11, w25
0x7937c950704   2c4  540000a9       b.ls #+0x14 (addr 0x7937c950718)
0x7937c950708   2c8  0b190a99       add w25, w20, w25, lsl #2
0x7937c95070c   2cc  b87968db       ldr w27, [x6, x25]
0x7937c950710   2d0  1100077b       add w27, w27, #0x1 (1)
0x7937c950714   2d4  b83968db       str w27, [x6, x25]
0x7937c950718   2d8  110012f7       add w23, w23, #0x4 (4)
0x7937c95071c   2dc  110012d6       add w22, w22, #0x4 (4)
0x7937c950720   2e0  510006b5       sub w21, w21, #0x1 (1)
0x7937c950724   2e4  35fff995       cbnz w21, #-0xd0 (addr 0x7937c950654)
0x7937c950728   2e8  f90007f4       str x20, [sp, #8]
0x7937c95072c   2ec  3500006b       cbnz w11, #+0xc (addr 0x7937c950738)
0x7937c950730   2f0  aa0e03ea       mov x10, x14
0x7937c950734   2f4  1400008f       b #+0x23c (addr 0x7937c950970)
0x7937c950738   2f8  531e7565       lsl w5, w11, #2
0x7937c95073c   2fc  510010aa       sub w10, w5, #0x4 (4)
0x7937c950740   300  53027d4f       lsr w15, w10, #2
0x7937c950744   304  110005ef       add w15, w15, #0x1 (1)
0x7937c950748   308  120009f3       and w19, w15, #0x7
0x7937c95074c   30c  f90033e5       str x5, [sp, #96]
0x7937c950750   310  7100715f       cmp w10, #0x1c (28)
0x7937c950754   314  54000563       b.lo #+0xac (addr 0x7937c950800)
0x7937c950758   318  121d6dea       and w10, w15, #0x7ffffff8
0x7937c95075c   31c  aa1403ef       mov x15, x20
0x7937c950760   320  aa0e03f5       mov x21, x14
0x7937c950764   324  f8520356       ldur x22, [x26, #-224]
0x7937c950768   328  eb3663ff       cmp sp, x22
0x7937c95076c   32c  54002b69       b.ls #+0x56c (addr 0x7937c950cd8)
0x7937c950770   330  b86f68d6       ldr w22, [x6, x15]
0x7937c950774   334  0b1502d5       add w21, w22, w21
0x7937c950778   338  b82f68d5       str w21, [x6, x15]
0x7937c95077c   33c  110011f6       add w22, w15, #0x4 (4)
0x7937c950780   340  b87668d7       ldr w23, [x6, x22]
0x7937c950784   344  0b1502f5       add w21, w23, w21
0x7937c950788   348  b83668d5       str w21, [x6, x22]
0x7937c95078c   34c  110021f6       add w22, w15, #0x8 (8)
0x7937c950790   350  b87668d7       ldr w23, [x6, x22]
0x7937c950794   354  0b1502f5       add w21, w23, w21
0x7937c950798   358  b83668d5       str w21, [x6, x22]
0x7937c95079c   35c  110031f6       add w22, w15, #0xc (12)
0x7937c9507a0   360  b87668d7       ldr w23, [x6, x22]
0x7937c9507a4   364  0b1502f5       add w21, w23, w21
0x7937c9507a8   368  b83668d5       str w21, [x6, x22]
0x7937c9507ac   36c  110041f6       add w22, w15, #0x10 (16)
0x7937c9507b0   370  b87668d7       ldr w23, [x6, x22]
0x7937c9507b4   374  0b1502f5       add w21, w23, w21
0x7937c9507b8   378  b83668d5       str w21, [x6, x22]
0x7937c9507bc   37c  110051f6       add w22, w15, #0x14 (20)
0x7937c9507c0   380  b87668d7       ldr w23, [x6, x22]
0x7937c9507c4   384  0b1502f5       add w21, w23, w21
0x7937c9507c8   388  b83668d5       str w21, [x6, x22]
0x7937c9507cc   38c  110061f6       add w22, w15, #0x18 (24)
0x7937c9507d0   390  b87668d7       ldr w23, [x6, x22]
0x7937c9507d4   394  0b1502f5       add w21, w23, w21
0x7937c9507d8   398  b83668d5       str w21, [x6, x22]
0x7937c9507dc   39c  110071f6       add w22, w15, #0x1c (28)
0x7937c9507e0   3a0  b87668d7       ldr w23, [x6, x22]
0x7937c9507e4   3a4  0b1502f5       add w21, w23, w21
0x7937c9507e8   3a8  b83668d5       str w21, [x6, x22]
0x7937c9507ec   3ac  110081ef       add w15, w15, #0x20 (32)
0x7937c9507f0   3b0  5100214a       sub w10, w10, #0x8 (8)
0x7937c9507f4   3b4  35fffb8a       cbnz w10, #-0x90 (addr 0x7937c950764)
0x7937c9507f8   3b8  35000093       cbnz w19, #+0x10 (addr 0x7937c950808)
0x7937c9507fc   3bc  1400001f       b #+0x7c (addr 0x7937c950878)
0x7937c950800   3c0  aa0e03f5       mov x21, x14
0x7937c950804   3c4  aa1403ef       mov x15, x20
0x7937c950808   3c8  531e766a       lsl w10, w19, #2
0x7937c95080c   3cc  b86f68d3       ldr w19, [x6, x15]
0x7937c950810   3d0  0b150273       add w19, w19, w21
0x7937c950814   3d4  b82f68d3       str w19, [x6, x15]
0x7937c950818   3d8  110011ef       add w15, w15, #0x4 (4)
0x7937c95081c   3dc  5100114a       sub w10, w10, #0x4 (4)
0x7937c950820   3e0  340002ca       cbz w10, #+0x58 (addr 0x7937c950878)
0x7937c950824   3e4  b86f68d5       ldr w21, [x6, x15]
0x7937c950828   3e8  0b1302b3       add w19, w21, w19
0x7937c95082c   3ec  b82f68d3       str w19, [x6, x15]
0x7937c950830   3f0  110011ef       add w15, w15, #0x4 (4)
0x7937c950834   3f4  5100114a       sub w10, w10, #0x4 (4)
0x7937c950838   3f8  3400020a       cbz w10, #+0x40 (addr 0x7937c950878)
0x7937c95083c   3fc  b86f68d5       ldr w21, [x6, x15]
0x7937c950840   400  0b1302b3       add w19, w21, w19
0x7937c950844   404  b82f68d3       str w19, [x6, x15]
0x7937c950848   408  110011ef       add w15, w15, #0x4 (4)
0x7937c95084c   40c  5100114a       sub w10, w10, #0x4 (4)
0x7937c950850   410  3400014a       cbz w10, #+0x28 (addr 0x7937c950878)
0x7937c950854   414  f8520355       ldur x21, [x26, #-224]
0x7937c950858   418  eb3563ff       cmp sp, x21
0x7937c95085c   41c  540026e9       b.ls #+0x4dc (addr 0x7937c950d38)
0x7937c950860   420  b86f68d5       ldr w21, [x6, x15]
0x7937c950864   424  0b1302b5       add w21, w21, w19
0x7937c950868   428  b82f68d5       str w21, [x6, x15]
0x7937c95086c   42c  110011ef       add w15, w15, #0x4 (4)
0x7937c950870   430  5100114a       sub w10, w10, #0x4 (4)
0x7937c950874   434  35fffcca       cbnz w10, #-0x68 (addr 0x7937c95080c)
0x7937c950878   438  9100510a       add x10, x8, #0x14 (20)
0x7937c95087c   43c  b82a68df       str wzr, [x6, x10]
0x7937c950880   440  9100310f       add x15, x8, #0xc (12)
0x7937c950884   444  b86f68cf       ldr w15, [x6, x15]
0x7937c950888   448  f9003bea       str x10, [sp, #112]
0x7937c95088c   44c  6b0f017f       cmp w11, w15
0x7937c950890   450  54000309       b.ls #+0x60 (addr 0x7937c9508f0)
0x7937c950894   454  aa0003ef       mov x15, x0
0x7937c950898   458  110031e0       add w0, w15, #0xc (12)
0x7937c95089c   45c  aa0b03e3       mov x3, x11
0x7937c9508a0   460  aa0e03e2       mov x2, x14
0x7937c9508a4   464  97fc0377       bl #-0xff224 (addr 0x7937c851680)
0x7937c9508a8   468  f9403fe6       ldr x6, [sp, #120]
0x7937c9508ac   46c  f9403be8       ldr x8, [sp, #112]
0x7937c9508b0   470  b86868c8       ldr w8, [x6, x8]
0x7937c9508b4   474  aa0803ea       mov x10, x8
0x7937c9508b8   478  f94047ed       ldr x13, [sp, #136]
0x7937c9508bc   47c  d280000e       movz x14, #0x0
0x7937c9508c0   480  f9401be4       ldr x4, [sp, #48]
0x7937c9508c4   484  f94017e2       ldr x2, [sp, #40]
0x7937c9508c8   488  f94043e8       ldr x8, [sp, #128]
0x7937c9508cc   48c  f9400fec       ldr x12, [sp, #24]
0x7937c9508d0   490  f9400be9       ldr x9, [sp, #16]
0x7937c9508d4   494  f9401fe3       ldr x3, [sp, #56]
0x7937c9508d8   498  f9404be7       ldr x7, [sp, #144]
0x7937c9508dc   49c  f94013e0       ldr x0, [sp, #32]
0x7937c9508e0   4a0  f94037eb       ldr x11, [sp, #104]
0x7937c9508e4   4a4  f94033e5       ldr x5, [sp, #96]
0x7937c9508e8   4a8  f94007f4       ldr x20, [sp, #8]
0x7937c9508ec   4ac  14000002       b #+0x8 (addr 0x7937c9508f4)
0x7937c9508f0   4b0  aa0e03ea       mov x10, x14
0x7937c9508f4   4b4  531e756f       lsl w15, w11, #2
0x7937c9508f8   4b8  f9003bea       str x10, [sp, #112]
0x7937c9508fc   4bc  340003af       cbz w15, #+0x74 (addr 0x7937c950970)
0x7937c950900   4c0  9100410f       add x15, x8, #0x10 (16)
0x7937c950904   4c4  b86f68cf       ldr w15, [x6, x15]
0x7937c950908   4c8  0b0a09ef       add w15, w15, w10, lsl #2
0x7937c95090c   4cc  aa0703e0       mov x0, x7
0x7937c950910   4d0  aa0e03e1       mov x1, x14
0x7937c950914   4d4  aa0e03e2       mov x2, x14
0x7937c950918   4d8  aa0f03e3       mov x3, x15
0x7937c95091c   4dc  aa1403e4       mov x4, x20
0x7937c950920   4e0  580029d0       ldr x16, pc+1336 (addr 0x000007937c950e58)
0x7937c950924   4e4  10000068       adr x8, #+0xc (addr 0x7937c950930)
0x7937c950928   4e8  a9027748       stp x8, fp, [x26, #32]
0x7937c95092c   4ec  d63f0200       blr x16
0x7937c950930   4f0  f900175f       str xzr, [x26, #40]
0x7937c950934   4f4  6a00001f       tst w0, w0
0x7937c950938   4f8  54002840       b.eq #+0x508 (addr 0x7937c950e40)
0x7937c95093c   4fc  f9403bea       ldr x10, [sp, #112]
0x7937c950940   500  f94047ed       ldr x13, [sp, #136]
0x7937c950944   504  f9403fe6       ldr x6, [sp, #120]
0x7937c950948   508  d280000e       movz x14, #0x0
0x7937c95094c   50c  f9401be4       ldr x4, [sp, #48]
0x7937c950950   510  f94017e2       ldr x2, [sp, #40]
0x7937c950954   514  f94043e8       ldr x8, [sp, #128]
0x7937c950958   518  f9400fec       ldr x12, [sp, #24]
0x7937c95095c   51c  f9400be9       ldr x9, [sp, #16]
0x7937c950960   520  f9401fe3       ldr x3, [sp, #56]
0x7937c950964   524  f9404be7       ldr x7, [sp, #144]
0x7937c950968   528  f94013e0       ldr x0, [sp, #32]
0x7937c95096c   52c  f94037eb       ldr x11, [sp, #104]
0x7937c950970   530  9100810f       add x15, x8, #0x20 (32)
0x7937c950974   534  b82f68df       str wzr, [x6, x15]
0x7937c950978   538  0b0b014a       add w10, w10, w11
0x7937c95097c   53c  9100510b       add x11, x8, #0x14 (20)
0x7937c950980   540  b82b68ca       str w10, [x6, x11]
0x7937c950984   544  f9003bef       str x15, [sp, #112]
0x7937c950988   548  f9002feb       str x11, [sp, #88]
0x7937c95098c   54c  35000063       cbnz w3, #+0xc (addr 0x7937c950998)
0x7937c950990   550  aa0e03ea       mov x10, x14
0x7937c950994   554  14000048       b #+0x120 (addr 0x7937c950ab4)
0x7937c950998   558  9100610a       add x10, x8, #0x18 (24)
0x7937c95099c   55c  b86a68ca       ldr w10, [x6, x10]
0x7937c9509a0   560  6b0a007f       cmp w3, w10
0x7937c9509a4   564  540002a9       b.ls #+0x54 (addr 0x7937c9509f8)
0x7937c9509a8   568  aa0003ea       mov x10, x0
0x7937c9509ac   56c  11006140       add w0, w10, #0x18 (24)
0x7937c9509b0   570  aa0e03e2       mov x2, x14
0x7937c9509b4   574  97fc0333       bl #-0xff334 (addr 0x7937c851680)
0x7937c9509b8   578  f9403fe6       ldr x6, [sp, #120]
0x7937c9509bc   57c  f9403be8       ldr x8, [sp, #112]
0x7937c9509c0   580  b86868c9       ldr w9, [x6, x8]
0x7937c9509c4   584  aa0903ea       mov x10, x9
0x7937c9509c8   588  f94047ed       ldr x13, [sp, #136]
0x7937c9509cc   58c  d280000e       movz x14, #0x0
0x7937c9509d0   590  f9401be4       ldr x4, [sp, #48]
0x7937c9509d4   594  f94017e2       ldr x2, [sp, #40]
0x7937c9509d8   598  aa0803ef       mov x15, x8
0x7937c9509dc   59c  f94043e8       ldr x8, [sp, #128]
0x7937c9509e0   5a0  f9402feb       ldr x11, [sp, #88]
0x7937c9509e4   5a4  f9400fec       ldr x12, [sp, #24]
0x7937c9509e8   5a8  f9400be9       ldr x9, [sp, #16]
0x7937c9509ec   5ac  f9401fe3       ldr x3, [sp, #56]
0x7937c9509f0   5b0  f9404be7       ldr x7, [sp, #144]
0x7937c9509f4   5b4  14000002       b #+0x8 (addr 0x7937c9509fc)
0x7937c9509f8   5b8  aa0e03ea       mov x10, x14
0x7937c9509fc   5bc  91007113       add x19, x8, #0x1c (28)
0x7937c950a00   5c0  b87368d3       ldr w19, [x6, x19]
0x7937c950a04   5c4  0b0a0a74       add w20, w19, w10, lsl #2
0x7937c950a08   5c8  f90037ea       str x10, [sp, #104]
0x7937c950a0c   5cc  f90033f3       str x19, [sp, #96]
0x7937c950a10   5d0  aa0303f5       mov x21, x3
0x7937c950a14   5d4  710006bf       cmp w21, #0x1 (1)
0x7937c950a18   5d8  540004a0       b.eq #+0x94 (addr 0x7937c950aac)
0x7937c950a1c   5dc  531e76b6       lsl w22, w21, #2
0x7937c950a20   5e0  510012d6       sub w22, w22, #0x4 (4)
0x7937c950a24   5e4  34000356       cbz w22, #+0x68 (addr 0x7937c950a8c)
0x7937c950a28   5e8  aa0703e0       mov x0, x7
0x7937c950a2c   5ec  aa0e03e1       mov x1, x14
0x7937c950a30   5f0  aa1403e2       mov x2, x20
0x7937c950a34   5f4  aa0e03e3       mov x3, x14
0x7937c950a38   5f8  aa1603e4       mov x4, x22
0x7937c950a3c   5fc  58002130       ldr x16, pc+1060 (addr 0x000007937c950e60)    ;; external reference (wasm::memory_fill)
0x7937c950a40   600  10000068       adr x8, #+0xc (addr 0x7937c950a4c)
0x7937c950a44   604  a9027748       stp x8, fp, [x26, #32]
0x7937c950a48   608  d63f0200       blr x16
0x7937c950a4c   60c  f900175f       str xzr, [x26, #40]
0x7937c950a50   610  6a00001f       tst w0, w0
0x7937c950a54   614  54001f40       b.eq #+0x3e8 (addr 0x7937c950e3c)
0x7937c950a58   618  f94047ed       ldr x13, [sp, #136]
0x7937c950a5c   61c  f9403fe6       ldr x6, [sp, #120]
0x7937c950a60   620  d280000e       movz x14, #0x0
0x7937c950a64   624  f9401be4       ldr x4, [sp, #48]
0x7937c950a68   628  f94017e2       ldr x2, [sp, #40]
0x7937c950a6c   62c  f94043e8       ldr x8, [sp, #128]
0x7937c950a70   630  f9402feb       ldr x11, [sp, #88]
0x7937c950a74   634  f9400fec       ldr x12, [sp, #24]
0x7937c950a78   638  f9400be9       ldr x9, [sp, #16]
0x7937c950a7c   63c  f9403bef       ldr x15, [sp, #112]
0x7937c950a80   640  f94037ea       ldr x10, [sp, #104]
0x7937c950a84   644  f94033f3       ldr x19, [sp, #96]
0x7937c950a88   648  f9401ff5       ldr x21, [sp, #56]
0x7937c950a8c   64c  aa1503f4       mov x20, x21
0x7937c950a90   650  0b14014a       add w10, w10, w20
0x7937c950a94   654  51000554       sub w20, w10, #0x1 (1)
0x7937c950a98   658  0b0a0a6a       add w10, w19, w10, lsl #2
0x7937c950a9c   65c  5100114a       sub w10, w10, #0x4 (4)
0x7937c950aa0   660  aa0a03f0       mov x16, x10
0x7937c950aa4   664  aa1403ea       mov x10, x20
0x7937c950aa8   668  aa1003f4       mov x20, x16
0x7937c950aac   66c  b83468df       str wzr, [x6, x20]
0x7937c950ab0   670  1100054a       add w10, w10, #0x1 (1)
0x7937c950ab4   674  b82f68ca       str w10, [x6, x15]
0x7937c950ab8   678  3500008d       cbnz w13, #+0x10 (addr 0x7937c950ac8)
0x7937c950abc   67c  910003bf       mov sp, fp
0x7937c950ac0   680  a8c17bfd       ldp fp, lr, [sp], #16
0x7937c950ac4   684  d65f03c0       ret
0x7937c950ac8   688  b86968c9       ldr w9, [x6, x9]
0x7937c950acc   68c  7100013f       cmp w9, #0x0 (0)
0x7937c950ad0   690  9a9f07ef       cset x15, ne
0x7937c950ad4   694  4b0f0129       sub w9, w9, w15
0x7937c950ad8   698  b86c68cc       ldr w12, [x6, x12]
0x7937c950adc   69c  7100019f       cmp w12, #0x0 (0)
0x7937c950ae0   6a0  9a9f07ef       cset x15, ne
0x7937c950ae4   6a4  4b0f018f       sub w15, w12, w15
0x7937c950ae8   6a8  91007113       add x19, x8, #0x1c (28)
0x7937c950aec   6ac  b87368d3       ldr w19, [x6, x19]
0x7937c950af0   6b0  91004114       add x20, x8, #0x10 (16)
0x7937c950af4   6b4  b87468d4       ldr w20, [x6, x20]
0x7937c950af8   6b8  b86b68cb       ldr w11, [x6, x11]
0x7937c950afc   6bc  91009108       add x8, x8, #0x24 (36)
0x7937c950b00   6c0  bc6868c0       ldr s0, [x6, x8]
0x7937c950b04   6c4  aa0e03e8       mov x8, x14
0x7937c950b08   6c8  f8520355       ldur x21, [x26, #-224]
0x7937c950b0c   6cc  eb3563ff       cmp sp, x21
0x7937c950b10   6d0  54001409       b.ls #+0x280 (addr 0x7937c950d90)
0x7937c950b14   6d4  2a0403f5       mov w21, w4
0x7937c950b18   6d8  bc7568c1       ldr s1, [x6, x21]
0x7937c950b1c   6dc  1e200821       fmul s1, s1, s0
0x7937c950b20   6e0  1e212020       fcmp s1, s1
0x7937c950b24   6e4  1e211de1       fcsel s1, s15, s1, ne
0x7937c950b28   6e8  1e202028       fcmp s1, #0.0
0x7937c950b2c   6ec  1e2fcc21       fcsel s1, s1, s15, gt
0x7937c950b30   6f0  1e254021       frintm s1, s1
0x7937c950b34   6f4  1e22c022       fcvt d2, s1
0x7937c950b38   6f8  1e65c043       frintz d3, d2
0x7937c950b3c   6fc  1e790075       fcvtzu w21, d3
0x7937c950b40   700  1e6302a4       ucvtf d4, w21
0x7937c950b44   704  1e642060       fcmp d3, d4
0x7937c950b48   708  540015a1       b.ne #+0x2b4 (addr 0x7937c950dfc)
0x7937c950b4c   70c  6b15013f       cmp w9, w21
0x7937c950b50   710  1a953136       csel w22, w9, w21, lo
0x7937c950b54   714  52a9f010       movz w16, #0x4f800000
0x7937c950b58   718  1e270202       fmov s2, w16
0x7937c950b5c   71c  1e222020       fcmp s1, s2
0x7937c950b60   720  1a9f32d5       csel w21, w22, wzr, lo
0x7937c950b64   724  1b0c7eb5       mul w21, w21, w12
0x7937c950b68   728  2a0203f6       mov w22, w2
0x7937c950b6c   72c  bc7668c1       ldr s1, [x6, x22]
0x7937c950b70   730  1e200821       fmul s1, s1, s0
0x7937c950b74   734  1e212020       fcmp s1, s1
0x7937c950b78   738  1e211de1       fcsel s1, s15, s1, ne
0x7937c950b7c   73c  1e202028       fcmp s1, #0.0
0x7937c950b80   740  1e2fcc21       fcsel s1, s1, s15, gt
0x7937c950b84   744  1e254021       frintm s1, s1
0x7937c950b88   748  1e22c023       fcvt d3, s1
0x7937c950b8c   74c  1e65c064       frintz d4, d3
0x7937c950b90   750  1e790096       fcvtzu w22, d4
0x7937c950b94   754  1e6302c5       ucvtf d5, w22
0x7937c950b98   758  1e652080       fcmp d4, d5
0x7937c950b9c   75c  54001401       b.ne #+0x280 (addr 0x7937c950e1c)
0x7937c950ba0   760  6b1601ff       cmp w15, w22
0x7937c950ba4   764  1a9631f7       csel w23, w15, w22, lo
0x7937c950ba8   768  1e222020       fcmp s1, s2
0x7937c950bac   76c  1a9f32f6       csel w22, w23, wzr, lo
0x7937c950bb0   770  0b1602b5       add w21, w21, w22
0x7937c950bb4   774  6b15017f       cmp w11, w21
0x7937c950bb8   778  54000149       b.ls #+0x28 (addr 0x7937c950be0)
0x7937c950bbc   77c  0b150a95       add w21, w20, w21, lsl #2
0x7937c950bc0   780  b87568d6       ldr w22, [x6, x21]
0x7937c950bc4   784  6b16015f       cmp w10, w22
0x7937c950bc8   788  54000089       b.ls #+0x10 (addr 0x7937c950bd8)
0x7937c950bcc   78c  0b160a76       add w22, w19, w22, lsl #2
0x7937c950bd0   790  b83668c8       str w8, [x6, x22]
0x7937c950bd4   794  b87568d6       ldr w22, [x6, x21]
0x7937c950bd8   798  110006d6       add w22, w22, #0x1 (1)
0x7937c950bdc   79c  b83568d6       str w22, [x6, x21]
0x7937c950be0   7a0  11001042       add w2, w2, #0x4 (4)
0x7937c950be4   7a4  11001084       add w4, w4, #0x4 (4)
0x7937c950be8   7a8  11000508       add w8, w8, #0x1 (1)
0x7937c950bec   7ac  6b0801bf       cmp w13, w8
0x7937c950bf0   7b0  54fff660       b.eq #-0x134 (addr 0x7937c950abc)
0x7937c950bf4   7b4  17ffffc5       b #-0xec (addr 0x7937c950b08)
0x7937c950bf8   7b8  97fc03f6       bl #-0xff028 (addr 0x7937c851bd0)
0x7937c950bfc   7bc  f9403fe6       ldr x6, [sp, #120]
0x7937c950c00   7c0  f9401be4       ldr x4, [sp, #48]
0x7937c950c04   7c4  f94017e2       ldr x2, [sp, #40]
0x7937c950c08   7c8  f9401fe3       ldr x3, [sp, #56]
0x7937c950c0c   7cc  f9404be7       ldr x7, [sp, #144]
0x7937c950c10   7d0  f94013e0       ldr x0, [sp, #32]
0x7937c950c14   7d4  f94027e5       ldr x5, [sp, #72]
0x7937c950c18   7d8  17fffe19       b #-0x79c (addr 0x7937c95047c)
0x7937c950c1c   7dc  f90007f4       str x20, [sp, #8]
0x7937c950c20   7e0  f9003bf5       str x21, [sp, #112]
0x7937c950c24   7e4  f90023f6       str x22, [sp, #64]
0x7937c950c28   7e8  f90003f7       str x23, [sp]
0x7937c950c2c   7ec  f90033ef       str x15, [sp, #96]
0x7937c950c30   7f0  f9002fea       str x10, [sp, #88]
0x7937c950c34   7f4  fd002be0       str d0, [sp, #80]
0x7937c950c38   7f8  f90027f3       str x19, [sp, #72]
0x7937c950c3c   7fc  97fc03e5       bl #-0xff06c (addr 0x7937c851bd0)
0x7937c950c40   800  f94047ed       ldr x13, [sp, #136]
0x7937c950c44   804  f9403fe6       ldr x6, [sp, #120]
0x7937c950c48   808  d280000e       movz x14, #0x0
0x7937c950c4c   80c  f9401be4       ldr x4, [sp, #48]
0x7937c950c50   810  f94017e2       ldr x2, [sp, #40]
0x7937c950c54   814  f94043e8       ldr x8, [sp, #128]
0x7937c950c58   818  f9400fec       ldr x12, [sp, #24]
0x7937c950c5c   81c  f9400be9       ldr x9, [sp, #16]
0x7937c950c60   820  f9401fe3       ldr x3, [sp, #56]
0x7937c950c64   824  f9404be7       ldr x7, [sp, #144]
0x7937c950c68   828  f94013e0       ldr x0, [sp, #32]
0x7937c950c6c   82c  f94037eb       ldr x11, [sp, #104]
0x7937c950c70   830  f94007f4       ldr x20, [sp, #8]
0x7937c950c74   834  f9403bf5       ldr x21, [sp, #112]
0x7937c950c78   838  f94023f6       ldr x22, [sp, #64]
0x7937c950c7c   83c  f94003f7       ldr x23, [sp]
0x7937c950c80   840  f94033ef       ldr x15, [sp, #96]
0x7937c950c84   844  f9402fea       ldr x10, [sp, #88]
0x7937c950c88   848  fd402be0       ldr d0, [sp, #80]
0x7937c950c8c   84c  d2800038       movz x24, #0x1
0x7937c950c90   850  f94027f3       ldr x19, [sp, #72]
0x7937c950c94   854  17fffe73       b #-0x634 (addr 0x7937c950660)
0x7937c950c98   858  1e622040       fcmp d2, d2
0x7937c950c9c   85c  54000060       b.eq #+0xc (addr 0x7937c950ca8)
0x7937c950ca0   860  aa0e03f9       mov x25, x14
0x7937c950ca4   864  17fffe7d       b #-0x60c (addr 0x7937c950698)
0x7937c950ca8   868  1e202028       fcmp s1, #0.0
0x7937c950cac   86c  54ffffa3       b.lo #-0xc (addr 0x7937c950ca0)
0x7937c950cb0   870  92800019       movn x25, #0x0
0x7937c950cb4   874  17fffe79       b #-0x61c (addr 0x7937c950698)
0x7937c950cb8   878  1e632060       fcmp d3, d3
0x7937c950cbc   87c  54000060       b.eq #+0xc (addr 0x7937c950cc8)
0x7937c950cc0   880  aa0e03fb       mov cp, x14
0x7937c950cc4   884  17fffe8a       b #-0x5d8 (addr 0x7937c9506ec)
0x7937c950cc8   888  1e202028       fcmp s1, #0.0
0x7937c950ccc   88c  54ffffa3       b.lo #-0xc (addr 0x7937c950cc0)
0x7937c950cd0   890  9280001b       movn cp, #0x0
0x7937c950cd4   894  17fffe86       b #-0x5e8 (addr 0x7937c9506ec)
0x7937c950cd8   898  f9003bf3       str x19, [sp, #112]
0x7937c950cdc   89c  f9002bea       str x10, [sp, #80]
0x7937c950ce0   8a0  f90027ef       str x15, [sp, #72]
0x7937c950ce4   8a4  f9002ff5       str x21, [sp, #88]
0x7937c950ce8   8a8  97fc03ba       bl #-0xff118 (addr 0x7937c851bd0)
0x7937c950cec   8ac  f94047ed       ldr x13, [sp, #136]
0x7937c950cf0   8b0  f9403fe6       ldr x6, [sp, #120]
0x7937c950cf4   8b4  d280000e       movz x14, #0x0
0x7937c950cf8   8b8  f9401be4       ldr x4, [sp, #48]
0x7937c950cfc   8bc  f94017e2       ldr x2, [sp, #40]
0x7937c950d00   8c0  f94043e8       ldr x8, [sp, #128]
0x7937c950d04   8c4  f9400fec       ldr x12, [sp, #24]
0x7937c950d08   8c8  f9400be9       ldr x9, [sp, #16]
0x7937c950d0c   8cc  f9401fe3       ldr x3, [sp, #56]
0x7937c950d10   8d0  f9404be7       ldr x7, [sp, #144]
0x7937c950d14   8d4  f94013e0       ldr x0, [sp, #32]
0x7937c950d18   8d8  f94037eb       ldr x11, [sp, #104]
0x7937c950d1c   8dc  f94033e5       ldr x5, [sp, #96]
0x7937c950d20   8e0  f94007f4       ldr x20, [sp, #8]
0x7937c950d24   8e4  f9403bf3       ldr x19, [sp, #112]
0x7937c950d28   8e8  f9402bea       ldr x10, [sp, #80]
0x7937c950d2c   8ec  f94027ef       ldr x15, [sp, #72]
0x7937c950d30   8f0  f9402ff5       ldr x21, [sp, #88]
0x7937c950d34   8f4  17fffe8f       b #-0x5c4 (addr 0x7937c950770)
0x7937c950d38   8f8  f9003bea       str x10, [sp, #112]
0x7937c950d3c   8fc  f90023ef       str x15, [sp, #64]
0x7937c950d40   900  f9002bf3       str x19, [sp, #80]
0x7937c950d44   904  97fc03a3       bl #-0xff174 (addr 0x7937c851bd0)
0x7937c950d48   908  f94047ed       ldr x13, [sp, #136]
0x7937c950d4c   90c  f9403fe6       ldr x6, [sp, #120]
0x7937c950d50   910  d280000e       movz x14, #0x0
0x7937c950d54   914  f9401be4       ldr x4, [sp, #48]
0x7937c950d58   918  f94017e2       ldr x2, [sp, #40]
0x7937c950d5c   91c  f94043e8       ldr x8, [sp, #128]
0x7937c950d60   920  f9400fec       ldr x12, [sp, #24]
0x7937c950d64   924  f9400be9       ldr x9, [sp, #16]
0x7937c950d68   928  f9401fe3       ldr x3, [sp, #56]
0x7937c950d6c   92c  f9404be7       ldr x7, [sp, #144]
0x7937c950d70   930  f94013e0       ldr x0, [sp, #32]
0x7937c950d74   934  f94037eb       ldr x11, [sp, #104]
0x7937c950d78   938  f94033e5       ldr x5, [sp, #96]
0x7937c950d7c   93c  f94007f4       ldr x20, [sp, #8]
0x7937c950d80   940  f9403bea       ldr x10, [sp, #112]
0x7937c950d84   944  f94023ef       ldr x15, [sp, #64]
0x7937c950d88   948  f9402bf3       ldr x19, [sp, #80]
0x7937c950d8c   94c  17fffeb5       b #-0x52c (addr 0x7937c950860)
0x7937c950d90   950  f90043e8       str x8, [sp, #128]
0x7937c950d94   954  f9001be4       str x4, [sp, #48]
0x7937c950d98   958  f90017e2       str x2, [sp, #40]
0x7937c950d9c   95c  f9003bf3       str x19, [sp, #112]
0x7937c950da0   960  f90037ea       str x10, [sp, #104]
0x7937c950da4   964  f90033f4       str x20, [sp, #96]
0x7937c950da8   968  f9002feb       str x11, [sp, #88]
0x7937c950dac   96c  f9002bef       str x15, [sp, #80]
0x7937c950db0   970  fd0027e0       str d0, [sp, #72]
0x7937c950db4   974  f90023ec       str x12, [sp, #64]
0x7937c950db8   978  f9001fe9       str x9, [sp, #56]
0x7937c950dbc   97c  97fc0385       bl #-0xff1ec (addr 0x7937c851bd0)
0x7937c950dc0   980  f94047ed       ldr x13, [sp, #136]
0x7937c950dc4   984  f94043e8       ldr x8, [sp, #128]
0x7937c950dc8   988  f9401be4       ldr x4, [sp, #48]
0x7937c950dcc   98c  f94017e2       ldr x2, [sp, #40]
0x7937c950dd0   990  f9403fe6       ldr x6, [sp, #120]
0x7937c950dd4   994  f9403bf3       ldr x19, [sp, #112]
0x7937c950dd8   998  f94037ea       ldr x10, [sp, #104]
0x7937c950ddc   99c  f94033f4       ldr x20, [sp, #96]
0x7937c950de0   9a0  f9402feb       ldr x11, [sp, #88]
0x7937c950de4   9a4  f9402bef       ldr x15, [sp, #80]
0x7937c950de8   9a8  d280000e       movz x14, #0x0
0x7937c950dec   9ac  fd4027e0       ldr d0, [sp, #72]
0x7937c950df0   9b0  f94023ec       ldr x12, [sp, #64]
0x7937c950df4   9b4  f9401fe9       ldr x9, [sp, #56]
0x7937c950df8   9b8  17ffff47       b #-0x2e4 (addr 0x7937c950b14)
0x7937c950dfc   9bc  1e622040       fcmp d2, d2
0x7937c950e00   9c0  54000060       b.eq #+0xc (addr 0x7937c950e0c)
0x7937c950e04   9c4  aa0e03f5       mov x21, x14
0x7937c950e08   9c8  17ffff51       b #-0x2bc (addr 0x7937c950b4c)
0x7937c950e0c   9cc  1e202028       fcmp s1, #0.0
0x7937c950e10   9d0  54ffffa3       b.lo #-0xc (addr 0x7937c950e04)
0x7937c950e14   9d4  92800015       movn x21, #0x0
0x7937c950e18   9d8  17ffff4d       b #-0x2cc (addr 0x7937c950b4c)
0x7937c950e1c   9dc  1e632060       fcmp d3, d3
0x7937c950e20   9e0  54000060       b.eq #+0xc (addr 0x7937c950e2c)
0x7937c950e24   9e4  aa0e03f6       mov x22, x14
0x7937c950e28   9e8  17ffff5e       b #-0x288 (addr 0x7937c950ba0)
0x7937c950e2c   9ec  1e202028       fcmp s1, #0.0
0x7937c950e30   9f0  54ffffa3       b.lo #-0xc (addr 0x7937c950e24)
0x7937c950e34   9f4  92800016       movn x22, #0x0
0x7937c950e38   9f8  17ffff5a       b #-0x298 (addr 0x7937c950ba0)
0x7937c950e3c   9fc  97fc02b5       bl #-0xff52c (addr 0x7937c851910)
0x7937c950e40   a00  97fc02b4       bl #-0xff530 (addr 0x7937c851910)
0x7937c950e44   a04  97fc02b3       bl #-0xff534 (addr 0x7937c851910)
0x7937c950e48   a08  d503201f       nop
0x7937c950e4c   a0c  580000df       constant pool begin (num_const = 6)
0x7937c950e50   a10  d63f03e0       constant
0x7937c950e54   a14  d503201f       constant
0x7937c950e58   a18  05a7ea68       constant
0x7937c950e5c   a1c  00000001       constant
0x7937c950e60   a20  05a7eaf4       constant
0x7937c950e64   a24  00000001       constant

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
0x7937c9504dc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x7937c9504d8  internal wasm call
0x7937c95055c  external reference (0x105a7eaf4)
0x7937c9508a4  internal wasm call
0x7937c950920  external reference (0x105a7ea68)
0x7937c9509b4  internal wasm call
0x7937c950bf8  wasm stub call  (0x7937c851bd0)
0x7937c950c3c  wasm stub call  (0x7937c851bd0)
0x7937c950ce8  wasm stub call  (0x7937c851bd0)
0x7937c950d44  wasm stub call  (0x7937c851bd0)
0x7937c950dbc  wasm stub call  (0x7937c851bd0)
0x7937c950e3c  wasm stub call  (0x7937c851910)
0x7937c950e40  wasm stub call  (0x7937c851910)
0x7937c950e44  wasm stub call  (0x7937c851910)
0x7937c950e4c  constant pool (size 28)
