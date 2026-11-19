name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0x277a52770420     0  d2800110       movz x16, #0x8
0x277a52770424     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x277a52770428     8  a9017bfd       stp fp, lr, [sp, #16]
0x277a5277042c     c  910043fd       add fp, sp, #0x10 (16)
0x277a52770430    10  d10243ff       sub sp, sp, #0x90 (144)
0x277a52770434    14  f841f0e6       ldur x6, [x7, #31]
0x277a52770438    18  f8520348       ldur x8, [x26, #-224]
0x277a5277043c    1c  f90013e0       str x0, [sp, #32]
0x277a52770440    20  f90017e2       str x2, [sp, #40]
0x277a52770444    24  f9001fe3       str x3, [sp, #56]
0x277a52770448    28  f9001be4       str x4, [sp, #48]
0x277a5277044c    2c  f90027e5       str x5, [sp, #72]
0x277a52770450    30  f9003fe6       str x6, [sp, #120]
0x277a52770454    34  eb2863ff       cmp sp, x8
0x277a52770458    38  54003b89       b.ls #+0x770 (addr 0x277a52770bc8)
0x277a5277045c    3c  2a0003e8       mov w8, w0
0x277a52770460    40  91002109       add x9, x8, #0x8 (8)
0x277a52770464    44  b82968df       str wzr, [x6, x9]
0x277a52770468    48  9100b10a       add x10, x8, #0x2c (44)
0x277a5277046c    4c  b86a68cb       ldr w11, [x6, x10]
0x277a52770470    50  9100a10c       add x12, x8, #0x28 (40)
0x277a52770474    54  b86c68cd       ldr w13, [x6, x12]
0x277a52770478    58  1b0d7d6b       mul w11, w11, w13
0x277a5277047c    5c  1100056d       add w13, w11, #0x1 (1)
0x277a52770480    60  f90043e8       str x8, [sp, #128]
0x277a52770484    64  f90047e9       str x9, [sp, #136]
0x277a52770488    68  f9000bea       str x10, [sp, #16]
0x277a5277048c    6c  f9000fec       str x12, [sp, #24]
0x277a52770490    70  f9002feb       str x11, [sp, #88]
0x277a52770494    74  f9003bed       str x13, [sp, #112]
0x277a52770498    78  3500006d       cbnz w13, #+0xc (addr 0x277a527704a4)
0x277a5277049c    7c  d280000b       movz x11, #0x0
0x277a527704a0    80  14000047       b #+0x11c (addr 0x277a527705bc)
0x277a527704a4    84  b86868ce       ldr w14, [x6, x8]
0x277a527704a8    88  6b0e01bf       cmp w13, w14
0x277a527704ac    8c  540002a9       b.ls #+0x54 (addr 0x277a52770500)
0x277a527704b0    90  aa0d03e3       mov x3, x13
0x277a527704b4    94  d2800002       movz x2, #0x0
0x277a527704b8    98  97fc0472       bl #-0xfee38 (addr 0x277a52671680)
0x277a527704bc    9c  f9403fe6       ldr x6, [sp, #120]
0x277a527704c0    a0  f94047e8       ldr x8, [sp, #136]
0x277a527704c4    a4  b86868c9       ldr w9, [x6, x8]
0x277a527704c8    a8  aa0903ee       mov x14, x9
0x277a527704cc    ac  f9401be4       ldr x4, [sp, #48]
0x277a527704d0    b0  f94017e2       ldr x2, [sp, #40]
0x277a527704d4    b4  aa0803e9       mov x9, x8
0x277a527704d8    b8  f94043e8       ldr x8, [sp, #128]
0x277a527704dc    bc  f9400fec       ldr x12, [sp, #24]
0x277a527704e0    c0  f9400bea       ldr x10, [sp, #16]
0x277a527704e4    c4  f9401fe3       ldr x3, [sp, #56]
0x277a527704e8    c8  f9404be7       ldr x7, [sp, #144]
0x277a527704ec    cc  f94013e0       ldr x0, [sp, #32]
0x277a527704f0    d0  f94027e5       ldr x5, [sp, #72]
0x277a527704f4    d4  f9403bed       ldr x13, [sp, #112]
0x277a527704f8    d8  f9402feb       ldr x11, [sp, #88]
0x277a527704fc    dc  14000002       b #+0x8 (addr 0x277a52770504)
0x277a52770500    e0  d280000e       movz x14, #0x0
0x277a52770504    e4  9100110f       add x15, x8, #0x4 (4)
0x277a52770508    e8  b86f68cf       ldr w15, [x6, x15]
0x277a5277050c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x277a52770510    f0  f90033ee       str x14, [sp, #96]
0x277a52770514    f4  f90037ef       str x15, [sp, #104]
0x277a52770518    f8  340004eb       cbz w11, #+0x9c (addr 0x277a527705b4)
0x277a5277051c    fc  531e75b4       lsl w20, w13, #2
0x277a52770520   100  51001294       sub w20, w20, #0x4 (4)
0x277a52770524   104  34000394       cbz w20, #+0x70 (addr 0x277a52770594)
0x277a52770528   108  aa0703e0       mov x0, x7
0x277a5277052c   10c  d2800001       movz x1, #0x0
0x277a52770530   110  aa1303e2       mov x2, x19
0x277a52770534   114  aa1403e4       mov x4, x20
0x277a52770538   118  aa0103e3       mov x3, x1
0x277a5277053c   11c  580047b0       ldr x16, pc+2292 (addr 0x0000277a52770e30)
0x277a52770540   120  10000068       adr x8, #+0xc (addr 0x277a5277054c)
0x277a52770544   124  a9027748       stp x8, fp, [x26, #32]
0x277a52770548   128  d63f0200       blr x16
0x277a5277054c   12c  f900175f       str xzr, [x26, #40]
0x277a52770550   130  6a00001f       tst w0, w0
0x277a52770554   134  54004600       b.eq #+0x8c0 (addr 0x277a52770e14)
0x277a52770558   138  f9403fe6       ldr x6, [sp, #120]
0x277a5277055c   13c  f9401be4       ldr x4, [sp, #48]
0x277a52770560   140  f94017e2       ldr x2, [sp, #40]
0x277a52770564   144  f94043e8       ldr x8, [sp, #128]
0x277a52770568   148  f9400fec       ldr x12, [sp, #24]
0x277a5277056c   14c  f9400bea       ldr x10, [sp, #16]
0x277a52770570   150  f9401fe3       ldr x3, [sp, #56]
0x277a52770574   154  f9404be7       ldr x7, [sp, #144]
0x277a52770578   158  f94013e0       ldr x0, [sp, #32]
0x277a5277057c   15c  f94027e5       ldr x5, [sp, #72]
0x277a52770580   160  f94047e9       ldr x9, [sp, #136]
0x277a52770584   164  f94033ee       ldr x14, [sp, #96]
0x277a52770588   168  f94037ef       ldr x15, [sp, #104]
0x277a5277058c   16c  f9403bed       ldr x13, [sp, #112]
0x277a52770590   170  f9402feb       ldr x11, [sp, #88]
0x277a52770594   174  aa0e03f0       mov x16, x14
0x277a52770598   178  aa0b03ee       mov x14, x11
0x277a5277059c   17c  aa1003eb       mov x11, x16
0x277a527705a0   180  0b0e016e       add w14, w11, w14
0x277a527705a4   184  0b0d016b       add w11, w11, w13
0x277a527705a8   188  aa0f03ed       mov x13, x15
0x277a527705ac   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x277a527705b0   190  51001173       sub w19, w11, #0x4 (4)
0x277a527705b4   194  b83368df       str wzr, [x6, x19]
0x277a527705b8   198  110005cb       add w11, w14, #0x1 (1)
0x277a527705bc   19c  b82968cb       str w11, [x6, x9]
0x277a527705c0   1a0  aa0503e9       mov x9, x5
0x277a527705c4   1a4  6b03013f       cmp w9, w3
0x277a527705c8   1a8  1a83312d       csel w13, w9, w3, lo
0x277a527705cc   1ac  d280000e       movz x14, #0x0
0x277a527705d0   1b0  f90037eb       str x11, [sp, #104]
0x277a527705d4   1b4  f90047ed       str x13, [sp, #136]
0x277a527705d8   1b8  350000cd       cbnz w13, #+0x18 (addr 0x277a527705f0)
0x277a527705dc   1bc  91001109       add x9, x8, #0x4 (4)
0x277a527705e0   1c0  b86968c9       ldr w9, [x6, x9]
0x277a527705e4   1c4  aa0903f4       mov x20, x9
0x277a527705e8   1c8  aa0a03e9       mov x9, x10
0x277a527705ec   1cc  14000045       b #+0x114 (addr 0x277a52770700)
0x277a527705f0   1d0  aa0a03e9       mov x9, x10
0x277a527705f4   1d4  b86968ca       ldr w10, [x6, x9]
0x277a527705f8   1d8  7100015f       cmp w10, #0x0 (0)
0x277a527705fc   1dc  9a9f07ef       cset x15, ne
0x277a52770600   1e0  4b0f014a       sub w10, w10, w15
0x277a52770604   1e4  b86c68cf       ldr w15, [x6, x12]
0x277a52770608   1e8  710001ff       cmp w15, #0x0 (0)
0x277a5277060c   1ec  9a9f07f3       cset x19, ne
0x277a52770610   1f0  4b1301f3       sub w19, w15, w19
0x277a52770614   1f4  91001114       add x20, x8, #0x4 (4)
0x277a52770618   1f8  b87468d4       ldr w20, [x6, x20]
0x277a5277061c   1fc  91009115       add x21, x8, #0x24 (36)
0x277a52770620   200  bc7568c0       ldr s0, [x6, x21]
0x277a52770624   204  aa0d03f5       mov x21, x13
0x277a52770628   208  aa0403f6       mov x22, x4
0x277a5277062c   20c  aa0203f7       mov x23, x2
0x277a52770630   210  d2800038       movz x24, #0x1
0x277a52770634   214  f8520359       ldur x25, [x26, #-224]
0x277a52770638   218  eb3963ff       cmp sp, x25
0x277a5277063c   21c  54002d89       b.ls #+0x5b0 (addr 0x277a52770bec)
0x277a52770640   220  2a1703f9       mov w25, w23
0x277a52770644   224  bc7968c1       ldr s1, [x6, x25]
0x277a52770648   228  1e200821       fmul s1, s1, s0
0x277a5277064c   22c  1e212020       fcmp s1, s1
0x277a52770650   230  1e211de1       fcsel s1, s15, s1, ne
0x277a52770654   234  1e202028       fcmp s1, #0.0
0x277a52770658   238  1e2fcc21       fcsel s1, s1, s15, gt
0x277a5277065c   23c  1e22c022       fcvt d2, s1
0x277a52770660   240  1e65c043       frintz d3, d2
0x277a52770664   244  1e790079       fcvtzu w25, d3
0x277a52770668   248  1e630324       ucvtf d4, w25
0x277a5277066c   24c  1e642060       fcmp d3, d4
0x277a52770670   250  54002fc1       b.ne #+0x5f8 (addr 0x277a52770c68)
0x277a52770674   254  6b19027f       cmp w19, w25
0x277a52770678   258  1a99327b       csel w27, w19, w25, lo
0x277a5277067c   25c  11000779       add w25, w27, #0x1 (1)
0x277a52770680   260  52a9f010       movz w16, #0x4f800000
0x277a52770684   264  1e270202       fmov s2, w16
0x277a52770688   268  1e222020       fcmp s1, s2
0x277a5277068c   26c  1a983339       csel w25, w25, w24, lo
0x277a52770690   270  2a1603fb       mov w27, w22
0x277a52770694   274  bc7b68c1       ldr s1, [x6, x27]
0x277a52770698   278  1e200821       fmul s1, s1, s0
0x277a5277069c   27c  1e212020       fcmp s1, s1
0x277a527706a0   280  1e211de1       fcsel s1, s15, s1, ne
0x277a527706a4   284  1e202028       fcmp s1, #0.0
0x277a527706a8   288  1e2fcc21       fcsel s1, s1, s15, gt
0x277a527706ac   28c  1e22c023       fcvt d3, s1
0x277a527706b0   290  1e65c064       frintz d4, d3
0x277a527706b4   294  1e79009b       fcvtzu w27, d4
0x277a527706b8   298  1e630365       ucvtf d5, w27
0x277a527706bc   29c  1e652080       fcmp d4, d5
0x277a527706c0   2a0  54002e41       b.ne #+0x5c8 (addr 0x277a52770c88)
0x277a527706c4   2a4  6b1b015f       cmp w10, w27
0x277a527706c8   2a8  1a9b315c       csel w28, w10, w27, lo
0x277a527706cc   2ac  1e222020       fcmp s1, s2
0x277a527706d0   2b0  1a9f339b       csel w27, w28, wzr, lo
0x277a527706d4   2b4  1b0f6779       madd w25, w27, w15, w25
0x277a527706d8   2b8  6b19017f       cmp w11, w25
0x277a527706dc   2bc  540000a9       b.ls #+0x14 (addr 0x277a527706f0)
0x277a527706e0   2c0  0b190a99       add w25, w20, w25, lsl #2
0x277a527706e4   2c4  b87968db       ldr w27, [x6, x25]
0x277a527706e8   2c8  1100077b       add w27, w27, #0x1 (1)
0x277a527706ec   2cc  b83968db       str w27, [x6, x25]
0x277a527706f0   2d0  110012f7       add w23, w23, #0x4 (4)
0x277a527706f4   2d4  110012d6       add w22, w22, #0x4 (4)
0x277a527706f8   2d8  510006b5       sub w21, w21, #0x1 (1)
0x277a527706fc   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0x277a52770634)
0x277a52770700   2e0  f90007f4       str x20, [sp, #8]
0x277a52770704   2e4  3500006b       cbnz w11, #+0xc (addr 0x277a52770710)
0x277a52770708   2e8  aa0e03ea       mov x10, x14
0x277a5277070c   2ec  1400008f       b #+0x23c (addr 0x277a52770948)
0x277a52770710   2f0  531e7565       lsl w5, w11, #2
0x277a52770714   2f4  510010aa       sub w10, w5, #0x4 (4)
0x277a52770718   2f8  53027d4f       lsr w15, w10, #2
0x277a5277071c   2fc  110005ef       add w15, w15, #0x1 (1)
0x277a52770720   300  120009f3       and w19, w15, #0x7
0x277a52770724   304  f90033e5       str x5, [sp, #96]
0x277a52770728   308  7100715f       cmp w10, #0x1c (28)
0x277a5277072c   30c  54000563       b.lo #+0xac (addr 0x277a527707d8)
0x277a52770730   310  121d6dea       and w10, w15, #0x7ffffff8
0x277a52770734   314  aa1403ef       mov x15, x20
0x277a52770738   318  aa0e03f5       mov x21, x14
0x277a5277073c   31c  f8520356       ldur x22, [x26, #-224]
0x277a52770740   320  eb3663ff       cmp sp, x22
0x277a52770744   324  54002b29       b.ls #+0x564 (addr 0x277a52770ca8)
0x277a52770748   328  b86f68d6       ldr w22, [x6, x15]
0x277a5277074c   32c  0b1502d5       add w21, w22, w21
0x277a52770750   330  b82f68d5       str w21, [x6, x15]
0x277a52770754   334  110011f6       add w22, w15, #0x4 (4)
0x277a52770758   338  b87668d7       ldr w23, [x6, x22]
0x277a5277075c   33c  0b1502f5       add w21, w23, w21
0x277a52770760   340  b83668d5       str w21, [x6, x22]
0x277a52770764   344  110021f6       add w22, w15, #0x8 (8)
0x277a52770768   348  b87668d7       ldr w23, [x6, x22]
0x277a5277076c   34c  0b1502f5       add w21, w23, w21
0x277a52770770   350  b83668d5       str w21, [x6, x22]
0x277a52770774   354  110031f6       add w22, w15, #0xc (12)
0x277a52770778   358  b87668d7       ldr w23, [x6, x22]
0x277a5277077c   35c  0b1502f5       add w21, w23, w21
0x277a52770780   360  b83668d5       str w21, [x6, x22]
0x277a52770784   364  110041f6       add w22, w15, #0x10 (16)
0x277a52770788   368  b87668d7       ldr w23, [x6, x22]
0x277a5277078c   36c  0b1502f5       add w21, w23, w21
0x277a52770790   370  b83668d5       str w21, [x6, x22]
0x277a52770794   374  110051f6       add w22, w15, #0x14 (20)
0x277a52770798   378  b87668d7       ldr w23, [x6, x22]
0x277a5277079c   37c  0b1502f5       add w21, w23, w21
0x277a527707a0   380  b83668d5       str w21, [x6, x22]
0x277a527707a4   384  110061f6       add w22, w15, #0x18 (24)
0x277a527707a8   388  b87668d7       ldr w23, [x6, x22]
0x277a527707ac   38c  0b1502f5       add w21, w23, w21
0x277a527707b0   390  b83668d5       str w21, [x6, x22]
0x277a527707b4   394  110071f6       add w22, w15, #0x1c (28)
0x277a527707b8   398  b87668d7       ldr w23, [x6, x22]
0x277a527707bc   39c  0b1502f5       add w21, w23, w21
0x277a527707c0   3a0  b83668d5       str w21, [x6, x22]
0x277a527707c4   3a4  110081ef       add w15, w15, #0x20 (32)
0x277a527707c8   3a8  5100214a       sub w10, w10, #0x8 (8)
0x277a527707cc   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0x277a5277073c)
0x277a527707d0   3b0  35000093       cbnz w19, #+0x10 (addr 0x277a527707e0)
0x277a527707d4   3b4  1400001f       b #+0x7c (addr 0x277a52770850)
0x277a527707d8   3b8  aa0e03f5       mov x21, x14
0x277a527707dc   3bc  aa1403ef       mov x15, x20
0x277a527707e0   3c0  531e766a       lsl w10, w19, #2
0x277a527707e4   3c4  b86f68d3       ldr w19, [x6, x15]
0x277a527707e8   3c8  0b150273       add w19, w19, w21
0x277a527707ec   3cc  b82f68d3       str w19, [x6, x15]
0x277a527707f0   3d0  110011ef       add w15, w15, #0x4 (4)
0x277a527707f4   3d4  5100114a       sub w10, w10, #0x4 (4)
0x277a527707f8   3d8  340002ca       cbz w10, #+0x58 (addr 0x277a52770850)
0x277a527707fc   3dc  b86f68d5       ldr w21, [x6, x15]
0x277a52770800   3e0  0b1302b3       add w19, w21, w19
0x277a52770804   3e4  b82f68d3       str w19, [x6, x15]
0x277a52770808   3e8  110011ef       add w15, w15, #0x4 (4)
0x277a5277080c   3ec  5100114a       sub w10, w10, #0x4 (4)
0x277a52770810   3f0  3400020a       cbz w10, #+0x40 (addr 0x277a52770850)
0x277a52770814   3f4  b86f68d5       ldr w21, [x6, x15]
0x277a52770818   3f8  0b1302b3       add w19, w21, w19
0x277a5277081c   3fc  b82f68d3       str w19, [x6, x15]
0x277a52770820   400  110011ef       add w15, w15, #0x4 (4)
0x277a52770824   404  5100114a       sub w10, w10, #0x4 (4)
0x277a52770828   408  3400014a       cbz w10, #+0x28 (addr 0x277a52770850)
0x277a5277082c   40c  f8520355       ldur x21, [x26, #-224]
0x277a52770830   410  eb3563ff       cmp sp, x21
0x277a52770834   414  540026a9       b.ls #+0x4d4 (addr 0x277a52770d08)
0x277a52770838   418  b86f68d5       ldr w21, [x6, x15]
0x277a5277083c   41c  0b1302b5       add w21, w21, w19
0x277a52770840   420  b82f68d5       str w21, [x6, x15]
0x277a52770844   424  110011ef       add w15, w15, #0x4 (4)
0x277a52770848   428  5100114a       sub w10, w10, #0x4 (4)
0x277a5277084c   42c  35fffcca       cbnz w10, #-0x68 (addr 0x277a527707e4)
0x277a52770850   430  9100510a       add x10, x8, #0x14 (20)
0x277a52770854   434  b82a68df       str wzr, [x6, x10]
0x277a52770858   438  9100310f       add x15, x8, #0xc (12)
0x277a5277085c   43c  b86f68cf       ldr w15, [x6, x15]
0x277a52770860   440  f9003bea       str x10, [sp, #112]
0x277a52770864   444  6b0f017f       cmp w11, w15
0x277a52770868   448  54000309       b.ls #+0x60 (addr 0x277a527708c8)
0x277a5277086c   44c  aa0003ef       mov x15, x0
0x277a52770870   450  110031e0       add w0, w15, #0xc (12)
0x277a52770874   454  aa0b03e3       mov x3, x11
0x277a52770878   458  aa0e03e2       mov x2, x14
0x277a5277087c   45c  97fc0381       bl #-0xff1fc (addr 0x277a52671680)
0x277a52770880   460  f9403fe6       ldr x6, [sp, #120]
0x277a52770884   464  f9403be8       ldr x8, [sp, #112]
0x277a52770888   468  b86868c8       ldr w8, [x6, x8]
0x277a5277088c   46c  aa0803ea       mov x10, x8
0x277a52770890   470  f94047ed       ldr x13, [sp, #136]
0x277a52770894   474  d280000e       movz x14, #0x0
0x277a52770898   478  f9401be4       ldr x4, [sp, #48]
0x277a5277089c   47c  f94017e2       ldr x2, [sp, #40]
0x277a527708a0   480  f94043e8       ldr x8, [sp, #128]
0x277a527708a4   484  f9400fec       ldr x12, [sp, #24]
0x277a527708a8   488  f9400be9       ldr x9, [sp, #16]
0x277a527708ac   48c  f9401fe3       ldr x3, [sp, #56]
0x277a527708b0   490  f9404be7       ldr x7, [sp, #144]
0x277a527708b4   494  f94013e0       ldr x0, [sp, #32]
0x277a527708b8   498  f94037eb       ldr x11, [sp, #104]
0x277a527708bc   49c  f94033e5       ldr x5, [sp, #96]
0x277a527708c0   4a0  f94007f4       ldr x20, [sp, #8]
0x277a527708c4   4a4  14000002       b #+0x8 (addr 0x277a527708cc)
0x277a527708c8   4a8  aa0e03ea       mov x10, x14
0x277a527708cc   4ac  531e756f       lsl w15, w11, #2
0x277a527708d0   4b0  f9003bea       str x10, [sp, #112]
0x277a527708d4   4b4  340003af       cbz w15, #+0x74 (addr 0x277a52770948)
0x277a527708d8   4b8  9100410f       add x15, x8, #0x10 (16)
0x277a527708dc   4bc  b86f68cf       ldr w15, [x6, x15]
0x277a527708e0   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0x277a527708e4   4c4  aa0703e0       mov x0, x7
0x277a527708e8   4c8  aa0e03e1       mov x1, x14
0x277a527708ec   4cc  aa0e03e2       mov x2, x14
0x277a527708f0   4d0  aa0f03e3       mov x3, x15
0x277a527708f4   4d4  aa1403e4       mov x4, x20
0x277a527708f8   4d8  58002990       ldr x16, pc+1328 (addr 0x0000277a52770e28)
0x277a527708fc   4dc  10000068       adr x8, #+0xc (addr 0x277a52770908)
0x277a52770900   4e0  a9027748       stp x8, fp, [x26, #32]
0x277a52770904   4e4  d63f0200       blr x16
0x277a52770908   4e8  f900175f       str xzr, [x26, #40]
0x277a5277090c   4ec  6a00001f       tst w0, w0
0x277a52770910   4f0  54002800       b.eq #+0x500 (addr 0x277a52770e10)
0x277a52770914   4f4  f9403bea       ldr x10, [sp, #112]
0x277a52770918   4f8  f94047ed       ldr x13, [sp, #136]
0x277a5277091c   4fc  f9403fe6       ldr x6, [sp, #120]
0x277a52770920   500  d280000e       movz x14, #0x0
0x277a52770924   504  f9401be4       ldr x4, [sp, #48]
0x277a52770928   508  f94017e2       ldr x2, [sp, #40]
0x277a5277092c   50c  f94043e8       ldr x8, [sp, #128]
0x277a52770930   510  f9400fec       ldr x12, [sp, #24]
0x277a52770934   514  f9400be9       ldr x9, [sp, #16]
0x277a52770938   518  f9401fe3       ldr x3, [sp, #56]
0x277a5277093c   51c  f9404be7       ldr x7, [sp, #144]
0x277a52770940   520  f94013e0       ldr x0, [sp, #32]
0x277a52770944   524  f94037eb       ldr x11, [sp, #104]
0x277a52770948   528  9100810f       add x15, x8, #0x20 (32)
0x277a5277094c   52c  b82f68df       str wzr, [x6, x15]
0x277a52770950   530  0b0b014a       add w10, w10, w11
0x277a52770954   534  9100510b       add x11, x8, #0x14 (20)
0x277a52770958   538  b82b68ca       str w10, [x6, x11]
0x277a5277095c   53c  f9003bef       str x15, [sp, #112]
0x277a52770960   540  f9002feb       str x11, [sp, #88]
0x277a52770964   544  35000063       cbnz w3, #+0xc (addr 0x277a52770970)
0x277a52770968   548  aa0e03ea       mov x10, x14
0x277a5277096c   54c  14000048       b #+0x120 (addr 0x277a52770a8c)
0x277a52770970   550  9100610a       add x10, x8, #0x18 (24)
0x277a52770974   554  b86a68ca       ldr w10, [x6, x10]
0x277a52770978   558  6b0a007f       cmp w3, w10
0x277a5277097c   55c  540002a9       b.ls #+0x54 (addr 0x277a527709d0)
0x277a52770980   560  aa0003ea       mov x10, x0
0x277a52770984   564  11006140       add w0, w10, #0x18 (24)
0x277a52770988   568  aa0e03e2       mov x2, x14
0x277a5277098c   56c  97fc033d       bl #-0xff30c (addr 0x277a52671680)
0x277a52770990   570  f9403fe6       ldr x6, [sp, #120]
0x277a52770994   574  f9403be8       ldr x8, [sp, #112]
0x277a52770998   578  b86868c9       ldr w9, [x6, x8]
0x277a5277099c   57c  aa0903ea       mov x10, x9
0x277a527709a0   580  f94047ed       ldr x13, [sp, #136]
0x277a527709a4   584  d280000e       movz x14, #0x0
0x277a527709a8   588  f9401be4       ldr x4, [sp, #48]
0x277a527709ac   58c  f94017e2       ldr x2, [sp, #40]
0x277a527709b0   590  aa0803ef       mov x15, x8
0x277a527709b4   594  f94043e8       ldr x8, [sp, #128]
0x277a527709b8   598  f9402feb       ldr x11, [sp, #88]
0x277a527709bc   59c  f9400fec       ldr x12, [sp, #24]
0x277a527709c0   5a0  f9400be9       ldr x9, [sp, #16]
0x277a527709c4   5a4  f9401fe3       ldr x3, [sp, #56]
0x277a527709c8   5a8  f9404be7       ldr x7, [sp, #144]
0x277a527709cc   5ac  14000002       b #+0x8 (addr 0x277a527709d4)
0x277a527709d0   5b0  aa0e03ea       mov x10, x14
0x277a527709d4   5b4  91007113       add x19, x8, #0x1c (28)
0x277a527709d8   5b8  b87368d3       ldr w19, [x6, x19]
0x277a527709dc   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0x277a527709e0   5c0  f90037ea       str x10, [sp, #104]
0x277a527709e4   5c4  f90033f3       str x19, [sp, #96]
0x277a527709e8   5c8  aa0303f5       mov x21, x3
0x277a527709ec   5cc  710006bf       cmp w21, #0x1 (1)
0x277a527709f0   5d0  540004a0       b.eq #+0x94 (addr 0x277a52770a84)
0x277a527709f4   5d4  531e76b6       lsl w22, w21, #2
0x277a527709f8   5d8  510012d6       sub w22, w22, #0x4 (4)
0x277a527709fc   5dc  34000356       cbz w22, #+0x68 (addr 0x277a52770a64)
0x277a52770a00   5e0  aa0703e0       mov x0, x7
0x277a52770a04   5e4  aa0e03e1       mov x1, x14
0x277a52770a08   5e8  aa1403e2       mov x2, x20
0x277a52770a0c   5ec  aa0e03e3       mov x3, x14
0x277a52770a10   5f0  aa1603e4       mov x4, x22
0x277a52770a14   5f4  580020f0       ldr x16, pc+1052 (addr 0x0000277a52770e30)    ;; external reference (wasm::memory_fill)
0x277a52770a18   5f8  10000068       adr x8, #+0xc (addr 0x277a52770a24)
0x277a52770a1c   5fc  a9027748       stp x8, fp, [x26, #32]
0x277a52770a20   600  d63f0200       blr x16
0x277a52770a24   604  f900175f       str xzr, [x26, #40]
0x277a52770a28   608  6a00001f       tst w0, w0
0x277a52770a2c   60c  54001f00       b.eq #+0x3e0 (addr 0x277a52770e0c)
0x277a52770a30   610  f94047ed       ldr x13, [sp, #136]
0x277a52770a34   614  f9403fe6       ldr x6, [sp, #120]
0x277a52770a38   618  d280000e       movz x14, #0x0
0x277a52770a3c   61c  f9401be4       ldr x4, [sp, #48]
0x277a52770a40   620  f94017e2       ldr x2, [sp, #40]
0x277a52770a44   624  f94043e8       ldr x8, [sp, #128]
0x277a52770a48   628  f9402feb       ldr x11, [sp, #88]
0x277a52770a4c   62c  f9400fec       ldr x12, [sp, #24]
0x277a52770a50   630  f9400be9       ldr x9, [sp, #16]
0x277a52770a54   634  f9403bef       ldr x15, [sp, #112]
0x277a52770a58   638  f94037ea       ldr x10, [sp, #104]
0x277a52770a5c   63c  f94033f3       ldr x19, [sp, #96]
0x277a52770a60   640  f9401ff5       ldr x21, [sp, #56]
0x277a52770a64   644  aa1503f4       mov x20, x21
0x277a52770a68   648  0b14014a       add w10, w10, w20
0x277a52770a6c   64c  51000554       sub w20, w10, #0x1 (1)
0x277a52770a70   650  0b0a0a6a       add w10, w19, w10, lsl #2
0x277a52770a74   654  5100114a       sub w10, w10, #0x4 (4)
0x277a52770a78   658  aa0a03f0       mov x16, x10
0x277a52770a7c   65c  aa1403ea       mov x10, x20
0x277a52770a80   660  aa1003f4       mov x20, x16
0x277a52770a84   664  b83468df       str wzr, [x6, x20]
0x277a52770a88   668  1100054a       add w10, w10, #0x1 (1)
0x277a52770a8c   66c  b82f68ca       str w10, [x6, x15]
0x277a52770a90   670  3500008d       cbnz w13, #+0x10 (addr 0x277a52770aa0)
0x277a52770a94   674  910003bf       mov sp, fp
0x277a52770a98   678  a8c17bfd       ldp fp, lr, [sp], #16
0x277a52770a9c   67c  d65f03c0       ret
0x277a52770aa0   680  b86968c9       ldr w9, [x6, x9]
0x277a52770aa4   684  7100013f       cmp w9, #0x0 (0)
0x277a52770aa8   688  9a9f07ef       cset x15, ne
0x277a52770aac   68c  4b0f0129       sub w9, w9, w15
0x277a52770ab0   690  b86c68cc       ldr w12, [x6, x12]
0x277a52770ab4   694  7100019f       cmp w12, #0x0 (0)
0x277a52770ab8   698  9a9f07ef       cset x15, ne
0x277a52770abc   69c  4b0f018f       sub w15, w12, w15
0x277a52770ac0   6a0  91007113       add x19, x8, #0x1c (28)
0x277a52770ac4   6a4  b87368d3       ldr w19, [x6, x19]
0x277a52770ac8   6a8  91004114       add x20, x8, #0x10 (16)
0x277a52770acc   6ac  b87468d4       ldr w20, [x6, x20]
0x277a52770ad0   6b0  b86b68cb       ldr w11, [x6, x11]
0x277a52770ad4   6b4  91009108       add x8, x8, #0x24 (36)
0x277a52770ad8   6b8  bc6868c0       ldr s0, [x6, x8]
0x277a52770adc   6bc  aa0e03e8       mov x8, x14
0x277a52770ae0   6c0  f8520355       ldur x21, [x26, #-224]
0x277a52770ae4   6c4  eb3563ff       cmp sp, x21
0x277a52770ae8   6c8  540013c9       b.ls #+0x278 (addr 0x277a52770d60)
0x277a52770aec   6cc  2a0403f5       mov w21, w4
0x277a52770af0   6d0  bc7568c1       ldr s1, [x6, x21]
0x277a52770af4   6d4  1e200821       fmul s1, s1, s0
0x277a52770af8   6d8  1e212020       fcmp s1, s1
0x277a52770afc   6dc  1e211de1       fcsel s1, s15, s1, ne
0x277a52770b00   6e0  1e202028       fcmp s1, #0.0
0x277a52770b04   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0x277a52770b08   6e8  1e22c022       fcvt d2, s1
0x277a52770b0c   6ec  1e65c043       frintz d3, d2
0x277a52770b10   6f0  1e790075       fcvtzu w21, d3
0x277a52770b14   6f4  1e6302a4       ucvtf d4, w21
0x277a52770b18   6f8  1e642060       fcmp d3, d4
0x277a52770b1c   6fc  54001581       b.ne #+0x2b0 (addr 0x277a52770dcc)
0x277a52770b20   700  6b15013f       cmp w9, w21
0x277a52770b24   704  1a953136       csel w22, w9, w21, lo
0x277a52770b28   708  52a9f010       movz w16, #0x4f800000
0x277a52770b2c   70c  1e270202       fmov s2, w16
0x277a52770b30   710  1e222020       fcmp s1, s2
0x277a52770b34   714  1a9f32d5       csel w21, w22, wzr, lo
0x277a52770b38   718  1b0c7eb5       mul w21, w21, w12
0x277a52770b3c   71c  2a0203f6       mov w22, w2
0x277a52770b40   720  bc7668c1       ldr s1, [x6, x22]
0x277a52770b44   724  1e200821       fmul s1, s1, s0
0x277a52770b48   728  1e212020       fcmp s1, s1
0x277a52770b4c   72c  1e211de1       fcsel s1, s15, s1, ne
0x277a52770b50   730  1e202028       fcmp s1, #0.0
0x277a52770b54   734  1e2fcc21       fcsel s1, s1, s15, gt
0x277a52770b58   738  1e22c023       fcvt d3, s1
0x277a52770b5c   73c  1e65c064       frintz d4, d3
0x277a52770b60   740  1e790096       fcvtzu w22, d4
0x277a52770b64   744  1e6302c5       ucvtf d5, w22
0x277a52770b68   748  1e652080       fcmp d4, d5
0x277a52770b6c   74c  54001401       b.ne #+0x280 (addr 0x277a52770dec)
0x277a52770b70   750  6b1601ff       cmp w15, w22
0x277a52770b74   754  1a9631f7       csel w23, w15, w22, lo
0x277a52770b78   758  1e222020       fcmp s1, s2
0x277a52770b7c   75c  1a9f32f6       csel w22, w23, wzr, lo
0x277a52770b80   760  0b1602b5       add w21, w21, w22
0x277a52770b84   764  6b15017f       cmp w11, w21
0x277a52770b88   768  54000149       b.ls #+0x28 (addr 0x277a52770bb0)
0x277a52770b8c   76c  0b150a95       add w21, w20, w21, lsl #2
0x277a52770b90   770  b87568d6       ldr w22, [x6, x21]
0x277a52770b94   774  6b16015f       cmp w10, w22
0x277a52770b98   778  54000089       b.ls #+0x10 (addr 0x277a52770ba8)
0x277a52770b9c   77c  0b160a76       add w22, w19, w22, lsl #2
0x277a52770ba0   780  b83668c8       str w8, [x6, x22]
0x277a52770ba4   784  b87568d6       ldr w22, [x6, x21]
0x277a52770ba8   788  110006d6       add w22, w22, #0x1 (1)
0x277a52770bac   78c  b83568d6       str w22, [x6, x21]
0x277a52770bb0   790  11001042       add w2, w2, #0x4 (4)
0x277a52770bb4   794  11001084       add w4, w4, #0x4 (4)
0x277a52770bb8   798  11000508       add w8, w8, #0x1 (1)
0x277a52770bbc   79c  6b0801bf       cmp w13, w8
0x277a52770bc0   7a0  54fff6a0       b.eq #-0x12c (addr 0x277a52770a94)
0x277a52770bc4   7a4  17ffffc7       b #-0xe4 (addr 0x277a52770ae0)
0x277a52770bc8   7a8  97fc0402       bl #-0xfeff8 (addr 0x277a52671bd0)
0x277a52770bcc   7ac  f9403fe6       ldr x6, [sp, #120]
0x277a52770bd0   7b0  f9401be4       ldr x4, [sp, #48]
0x277a52770bd4   7b4  f94017e2       ldr x2, [sp, #40]
0x277a52770bd8   7b8  f9401fe3       ldr x3, [sp, #56]
0x277a52770bdc   7bc  f9404be7       ldr x7, [sp, #144]
0x277a52770be0   7c0  f94013e0       ldr x0, [sp, #32]
0x277a52770be4   7c4  f94027e5       ldr x5, [sp, #72]
0x277a52770be8   7c8  17fffe1d       b #-0x78c (addr 0x277a5277045c)
0x277a52770bec   7cc  f90007f4       str x20, [sp, #8]
0x277a52770bf0   7d0  f9003bf5       str x21, [sp, #112]
0x277a52770bf4   7d4  f90023f6       str x22, [sp, #64]
0x277a52770bf8   7d8  f90003f7       str x23, [sp]
0x277a52770bfc   7dc  f90033ef       str x15, [sp, #96]
0x277a52770c00   7e0  f9002fea       str x10, [sp, #88]
0x277a52770c04   7e4  fd002be0       str d0, [sp, #80]
0x277a52770c08   7e8  f90027f3       str x19, [sp, #72]
0x277a52770c0c   7ec  97fc03f1       bl #-0xff03c (addr 0x277a52671bd0)
0x277a52770c10   7f0  f94047ed       ldr x13, [sp, #136]
0x277a52770c14   7f4  f9403fe6       ldr x6, [sp, #120]
0x277a52770c18   7f8  d280000e       movz x14, #0x0
0x277a52770c1c   7fc  f9401be4       ldr x4, [sp, #48]
0x277a52770c20   800  f94017e2       ldr x2, [sp, #40]
0x277a52770c24   804  f94043e8       ldr x8, [sp, #128]
0x277a52770c28   808  f9400fec       ldr x12, [sp, #24]
0x277a52770c2c   80c  f9400be9       ldr x9, [sp, #16]
0x277a52770c30   810  f9401fe3       ldr x3, [sp, #56]
0x277a52770c34   814  f9404be7       ldr x7, [sp, #144]
0x277a52770c38   818  f94013e0       ldr x0, [sp, #32]
0x277a52770c3c   81c  f94037eb       ldr x11, [sp, #104]
0x277a52770c40   820  f94007f4       ldr x20, [sp, #8]
0x277a52770c44   824  f9403bf5       ldr x21, [sp, #112]
0x277a52770c48   828  f94023f6       ldr x22, [sp, #64]
0x277a52770c4c   82c  f94003f7       ldr x23, [sp]
0x277a52770c50   830  f94033ef       ldr x15, [sp, #96]
0x277a52770c54   834  f9402fea       ldr x10, [sp, #88]
0x277a52770c58   838  fd402be0       ldr d0, [sp, #80]
0x277a52770c5c   83c  d2800038       movz x24, #0x1
0x277a52770c60   840  f94027f3       ldr x19, [sp, #72]
0x277a52770c64   844  17fffe77       b #-0x624 (addr 0x277a52770640)
0x277a52770c68   848  1e622040       fcmp d2, d2
0x277a52770c6c   84c  54000060       b.eq #+0xc (addr 0x277a52770c78)
0x277a52770c70   850  aa0e03f9       mov x25, x14
0x277a52770c74   854  17fffe80       b #-0x600 (addr 0x277a52770674)
0x277a52770c78   858  1e202028       fcmp s1, #0.0
0x277a52770c7c   85c  54ffffa3       b.lo #-0xc (addr 0x277a52770c70)
0x277a52770c80   860  92800019       movn x25, #0x0
0x277a52770c84   864  17fffe7c       b #-0x610 (addr 0x277a52770674)
0x277a52770c88   868  1e632060       fcmp d3, d3
0x277a52770c8c   86c  54000060       b.eq #+0xc (addr 0x277a52770c98)
0x277a52770c90   870  aa0e03fb       mov cp, x14
0x277a52770c94   874  17fffe8c       b #-0x5d0 (addr 0x277a527706c4)
0x277a52770c98   878  1e202028       fcmp s1, #0.0
0x277a52770c9c   87c  54ffffa3       b.lo #-0xc (addr 0x277a52770c90)
0x277a52770ca0   880  9280001b       movn cp, #0x0
0x277a52770ca4   884  17fffe88       b #-0x5e0 (addr 0x277a527706c4)
0x277a52770ca8   888  f9003bf3       str x19, [sp, #112]
0x277a52770cac   88c  f9002bea       str x10, [sp, #80]
0x277a52770cb0   890  f90027ef       str x15, [sp, #72]
0x277a52770cb4   894  f9002ff5       str x21, [sp, #88]
0x277a52770cb8   898  97fc03c6       bl #-0xff0e8 (addr 0x277a52671bd0)
0x277a52770cbc   89c  f94047ed       ldr x13, [sp, #136]
0x277a52770cc0   8a0  f9403fe6       ldr x6, [sp, #120]
0x277a52770cc4   8a4  d280000e       movz x14, #0x0
0x277a52770cc8   8a8  f9401be4       ldr x4, [sp, #48]
0x277a52770ccc   8ac  f94017e2       ldr x2, [sp, #40]
0x277a52770cd0   8b0  f94043e8       ldr x8, [sp, #128]
0x277a52770cd4   8b4  f9400fec       ldr x12, [sp, #24]
0x277a52770cd8   8b8  f9400be9       ldr x9, [sp, #16]
0x277a52770cdc   8bc  f9401fe3       ldr x3, [sp, #56]
0x277a52770ce0   8c0  f9404be7       ldr x7, [sp, #144]
0x277a52770ce4   8c4  f94013e0       ldr x0, [sp, #32]
0x277a52770ce8   8c8  f94037eb       ldr x11, [sp, #104]
0x277a52770cec   8cc  f94033e5       ldr x5, [sp, #96]
0x277a52770cf0   8d0  f94007f4       ldr x20, [sp, #8]
0x277a52770cf4   8d4  f9403bf3       ldr x19, [sp, #112]
0x277a52770cf8   8d8  f9402bea       ldr x10, [sp, #80]
0x277a52770cfc   8dc  f94027ef       ldr x15, [sp, #72]
0x277a52770d00   8e0  f9402ff5       ldr x21, [sp, #88]
0x277a52770d04   8e4  17fffe91       b #-0x5bc (addr 0x277a52770748)
0x277a52770d08   8e8  f9003bea       str x10, [sp, #112]
0x277a52770d0c   8ec  f90023ef       str x15, [sp, #64]
0x277a52770d10   8f0  f9002bf3       str x19, [sp, #80]
0x277a52770d14   8f4  97fc03af       bl #-0xff144 (addr 0x277a52671bd0)
0x277a52770d18   8f8  f94047ed       ldr x13, [sp, #136]
0x277a52770d1c   8fc  f9403fe6       ldr x6, [sp, #120]
0x277a52770d20   900  d280000e       movz x14, #0x0
0x277a52770d24   904  f9401be4       ldr x4, [sp, #48]
0x277a52770d28   908  f94017e2       ldr x2, [sp, #40]
0x277a52770d2c   90c  f94043e8       ldr x8, [sp, #128]
0x277a52770d30   910  f9400fec       ldr x12, [sp, #24]
0x277a52770d34   914  f9400be9       ldr x9, [sp, #16]
0x277a52770d38   918  f9401fe3       ldr x3, [sp, #56]
0x277a52770d3c   91c  f9404be7       ldr x7, [sp, #144]
0x277a52770d40   920  f94013e0       ldr x0, [sp, #32]
0x277a52770d44   924  f94037eb       ldr x11, [sp, #104]
0x277a52770d48   928  f94033e5       ldr x5, [sp, #96]
0x277a52770d4c   92c  f94007f4       ldr x20, [sp, #8]
0x277a52770d50   930  f9403bea       ldr x10, [sp, #112]
0x277a52770d54   934  f94023ef       ldr x15, [sp, #64]
0x277a52770d58   938  f9402bf3       ldr x19, [sp, #80]
0x277a52770d5c   93c  17fffeb7       b #-0x524 (addr 0x277a52770838)
0x277a52770d60   940  f90043e8       str x8, [sp, #128]
0x277a52770d64   944  f9001be4       str x4, [sp, #48]
0x277a52770d68   948  f90017e2       str x2, [sp, #40]
0x277a52770d6c   94c  f9003bf3       str x19, [sp, #112]
0x277a52770d70   950  f90037ea       str x10, [sp, #104]
0x277a52770d74   954  f90033f4       str x20, [sp, #96]
0x277a52770d78   958  f9002feb       str x11, [sp, #88]
0x277a52770d7c   95c  f9002bef       str x15, [sp, #80]
0x277a52770d80   960  fd0027e0       str d0, [sp, #72]
0x277a52770d84   964  f90023ec       str x12, [sp, #64]
0x277a52770d88   968  f9001fe9       str x9, [sp, #56]
0x277a52770d8c   96c  97fc0391       bl #-0xff1bc (addr 0x277a52671bd0)
0x277a52770d90   970  f94047ed       ldr x13, [sp, #136]
0x277a52770d94   974  f94043e8       ldr x8, [sp, #128]
0x277a52770d98   978  f9401be4       ldr x4, [sp, #48]
0x277a52770d9c   97c  f94017e2       ldr x2, [sp, #40]
0x277a52770da0   980  f9403fe6       ldr x6, [sp, #120]
0x277a52770da4   984  f9403bf3       ldr x19, [sp, #112]
0x277a52770da8   988  f94037ea       ldr x10, [sp, #104]
0x277a52770dac   98c  f94033f4       ldr x20, [sp, #96]
0x277a52770db0   990  f9402feb       ldr x11, [sp, #88]
0x277a52770db4   994  f9402bef       ldr x15, [sp, #80]
0x277a52770db8   998  d280000e       movz x14, #0x0
0x277a52770dbc   99c  fd4027e0       ldr d0, [sp, #72]
0x277a52770dc0   9a0  f94023ec       ldr x12, [sp, #64]
0x277a52770dc4   9a4  f9401fe9       ldr x9, [sp, #56]
0x277a52770dc8   9a8  17ffff49       b #-0x2dc (addr 0x277a52770aec)
0x277a52770dcc   9ac  1e622040       fcmp d2, d2
0x277a52770dd0   9b0  54000060       b.eq #+0xc (addr 0x277a52770ddc)
0x277a52770dd4   9b4  aa0e03f5       mov x21, x14
0x277a52770dd8   9b8  17ffff52       b #-0x2b8 (addr 0x277a52770b20)
0x277a52770ddc   9bc  1e202028       fcmp s1, #0.0
0x277a52770de0   9c0  54ffffa3       b.lo #-0xc (addr 0x277a52770dd4)
0x277a52770de4   9c4  92800015       movn x21, #0x0
0x277a52770de8   9c8  17ffff4e       b #-0x2c8 (addr 0x277a52770b20)
0x277a52770dec   9cc  1e632060       fcmp d3, d3
0x277a52770df0   9d0  54000060       b.eq #+0xc (addr 0x277a52770dfc)
0x277a52770df4   9d4  aa0e03f6       mov x22, x14
0x277a52770df8   9d8  17ffff5e       b #-0x288 (addr 0x277a52770b70)
0x277a52770dfc   9dc  1e202028       fcmp s1, #0.0
0x277a52770e00   9e0  54ffffa3       b.lo #-0xc (addr 0x277a52770df4)
0x277a52770e04   9e4  92800016       movn x22, #0x0
0x277a52770e08   9e8  17ffff5a       b #-0x298 (addr 0x277a52770b70)
0x277a52770e0c   9ec  97fc02c1       bl #-0xff4fc (addr 0x277a52671910)
0x277a52770e10   9f0  97fc02c0       bl #-0xff500 (addr 0x277a52671910)
0x277a52770e14   9f4  97fc02bf       bl #-0xff504 (addr 0x277a52671910)
0x277a52770e18   9f8  d503201f       nop
0x277a52770e1c   9fc  580000df       constant pool begin (num_const = 6)
0x277a52770e20   a00  d63f03e0       constant
0x277a52770e24   a04  d503201f       constant
0x277a52770e28   a08  0374aa68       constant
0x277a52770e2c   a0c  00000001       constant
0x277a52770e30   a10  0374aaf4       constant
0x277a52770e34   a14  00000001       constant

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
0x277a527704bc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x277a527704b8  internal wasm call
0x277a5277053c  external reference (0x10374aaf4)
0x277a5277087c  internal wasm call
0x277a527708f8  external reference (0x10374aa68)
0x277a5277098c  internal wasm call
0x277a52770bc8  wasm stub call  (0x277a52671bd0)
0x277a52770c0c  wasm stub call  (0x277a52671bd0)
0x277a52770cb8  wasm stub call  (0x277a52671bd0)
0x277a52770d14  wasm stub call  (0x277a52671bd0)
0x277a52770d8c  wasm stub call  (0x277a52671bd0)
0x277a52770e0c  wasm stub call  (0x277a52671910)
0x277a52770e10  wasm stub call  (0x277a52671910)
0x277a52770e14  wasm stub call  (0x277a52671910)
0x277a52770e1c  constant pool (size 28)
