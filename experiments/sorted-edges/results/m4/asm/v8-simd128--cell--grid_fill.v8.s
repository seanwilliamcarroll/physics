name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0x51082eea680     0  d2800110       movz x16, #0x8
0x51082eea684     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x51082eea688     8  a9017bfd       stp fp, lr, [sp, #16]
0x51082eea68c     c  910043fd       add fp, sp, #0x10 (16)
0x51082eea690    10  d10243ff       sub sp, sp, #0x90 (144)
0x51082eea694    14  f841f0e6       ldur x6, [x7, #31]
0x51082eea698    18  f8520348       ldur x8, [x26, #-224]
0x51082eea69c    1c  f90013e0       str x0, [sp, #32]
0x51082eea6a0    20  f90017e2       str x2, [sp, #40]
0x51082eea6a4    24  f9001fe3       str x3, [sp, #56]
0x51082eea6a8    28  f9001be4       str x4, [sp, #48]
0x51082eea6ac    2c  f90027e5       str x5, [sp, #72]
0x51082eea6b0    30  f9003fe6       str x6, [sp, #120]
0x51082eea6b4    34  eb2863ff       cmp sp, x8
0x51082eea6b8    38  54003b89       b.ls #+0x770 (addr 0x51082eeae28)
0x51082eea6bc    3c  2a0003e8       mov w8, w0
0x51082eea6c0    40  91002109       add x9, x8, #0x8 (8)
0x51082eea6c4    44  b82968df       str wzr, [x6, x9]
0x51082eea6c8    48  9100b10a       add x10, x8, #0x2c (44)
0x51082eea6cc    4c  b86a68cb       ldr w11, [x6, x10]
0x51082eea6d0    50  9100a10c       add x12, x8, #0x28 (40)
0x51082eea6d4    54  b86c68cd       ldr w13, [x6, x12]
0x51082eea6d8    58  1b0d7d6b       mul w11, w11, w13
0x51082eea6dc    5c  1100056d       add w13, w11, #0x1 (1)
0x51082eea6e0    60  f90043e8       str x8, [sp, #128]
0x51082eea6e4    64  f90047e9       str x9, [sp, #136]
0x51082eea6e8    68  f9000bea       str x10, [sp, #16]
0x51082eea6ec    6c  f9000fec       str x12, [sp, #24]
0x51082eea6f0    70  f9002feb       str x11, [sp, #88]
0x51082eea6f4    74  f9003bed       str x13, [sp, #112]
0x51082eea6f8    78  3500006d       cbnz w13, #+0xc (addr 0x51082eea704)
0x51082eea6fc    7c  d280000b       movz x11, #0x0
0x51082eea700    80  14000047       b #+0x11c (addr 0x51082eea81c)
0x51082eea704    84  b86868ce       ldr w14, [x6, x8]
0x51082eea708    88  6b0e01bf       cmp w13, w14
0x51082eea70c    8c  540002a9       b.ls #+0x54 (addr 0x51082eea760)
0x51082eea710    90  aa0d03e3       mov x3, x13
0x51082eea714    94  d2800002       movz x2, #0x0
0x51082eea718    98  97fc0bda       bl #-0xfd098 (addr 0x51082ded680)
0x51082eea71c    9c  f9403fe6       ldr x6, [sp, #120]
0x51082eea720    a0  f94047e8       ldr x8, [sp, #136]
0x51082eea724    a4  b86868c9       ldr w9, [x6, x8]
0x51082eea728    a8  aa0903ee       mov x14, x9
0x51082eea72c    ac  f9401be4       ldr x4, [sp, #48]
0x51082eea730    b0  f94017e2       ldr x2, [sp, #40]
0x51082eea734    b4  aa0803e9       mov x9, x8
0x51082eea738    b8  f94043e8       ldr x8, [sp, #128]
0x51082eea73c    bc  f9400fec       ldr x12, [sp, #24]
0x51082eea740    c0  f9400bea       ldr x10, [sp, #16]
0x51082eea744    c4  f9401fe3       ldr x3, [sp, #56]
0x51082eea748    c8  f9404be7       ldr x7, [sp, #144]
0x51082eea74c    cc  f94013e0       ldr x0, [sp, #32]
0x51082eea750    d0  f94027e5       ldr x5, [sp, #72]
0x51082eea754    d4  f9403bed       ldr x13, [sp, #112]
0x51082eea758    d8  f9402feb       ldr x11, [sp, #88]
0x51082eea75c    dc  14000002       b #+0x8 (addr 0x51082eea764)
0x51082eea760    e0  d280000e       movz x14, #0x0
0x51082eea764    e4  9100110f       add x15, x8, #0x4 (4)
0x51082eea768    e8  b86f68cf       ldr w15, [x6, x15]
0x51082eea76c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x51082eea770    f0  f90033ee       str x14, [sp, #96]
0x51082eea774    f4  f90037ef       str x15, [sp, #104]
0x51082eea778    f8  340004eb       cbz w11, #+0x9c (addr 0x51082eea814)
0x51082eea77c    fc  531e75b4       lsl w20, w13, #2
0x51082eea780   100  51001294       sub w20, w20, #0x4 (4)
0x51082eea784   104  34000394       cbz w20, #+0x70 (addr 0x51082eea7f4)
0x51082eea788   108  aa0703e0       mov x0, x7
0x51082eea78c   10c  d2800001       movz x1, #0x0
0x51082eea790   110  aa1303e2       mov x2, x19
0x51082eea794   114  aa1403e4       mov x4, x20
0x51082eea798   118  aa0103e3       mov x3, x1
0x51082eea79c   11c  580047b0       ldr x16, pc+2292 (addr 0x0000051082eeb090)
0x51082eea7a0   120  10000068       adr x8, #+0xc (addr 0x51082eea7ac)
0x51082eea7a4   124  a9027748       stp x8, fp, [x26, #32]
0x51082eea7a8   128  d63f0200       blr x16
0x51082eea7ac   12c  f900175f       str xzr, [x26, #40]
0x51082eea7b0   130  6a00001f       tst w0, w0
0x51082eea7b4   134  54004600       b.eq #+0x8c0 (addr 0x51082eeb074)
0x51082eea7b8   138  f9403fe6       ldr x6, [sp, #120]
0x51082eea7bc   13c  f9401be4       ldr x4, [sp, #48]
0x51082eea7c0   140  f94017e2       ldr x2, [sp, #40]
0x51082eea7c4   144  f94043e8       ldr x8, [sp, #128]
0x51082eea7c8   148  f9400fec       ldr x12, [sp, #24]
0x51082eea7cc   14c  f9400bea       ldr x10, [sp, #16]
0x51082eea7d0   150  f9401fe3       ldr x3, [sp, #56]
0x51082eea7d4   154  f9404be7       ldr x7, [sp, #144]
0x51082eea7d8   158  f94013e0       ldr x0, [sp, #32]
0x51082eea7dc   15c  f94027e5       ldr x5, [sp, #72]
0x51082eea7e0   160  f94047e9       ldr x9, [sp, #136]
0x51082eea7e4   164  f94033ee       ldr x14, [sp, #96]
0x51082eea7e8   168  f94037ef       ldr x15, [sp, #104]
0x51082eea7ec   16c  f9403bed       ldr x13, [sp, #112]
0x51082eea7f0   170  f9402feb       ldr x11, [sp, #88]
0x51082eea7f4   174  aa0e03f0       mov x16, x14
0x51082eea7f8   178  aa0b03ee       mov x14, x11
0x51082eea7fc   17c  aa1003eb       mov x11, x16
0x51082eea800   180  0b0e016e       add w14, w11, w14
0x51082eea804   184  0b0d016b       add w11, w11, w13
0x51082eea808   188  aa0f03ed       mov x13, x15
0x51082eea80c   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x51082eea810   190  51001173       sub w19, w11, #0x4 (4)
0x51082eea814   194  b83368df       str wzr, [x6, x19]
0x51082eea818   198  110005cb       add w11, w14, #0x1 (1)
0x51082eea81c   19c  b82968cb       str w11, [x6, x9]
0x51082eea820   1a0  aa0503e9       mov x9, x5
0x51082eea824   1a4  6b03013f       cmp w9, w3
0x51082eea828   1a8  1a83312d       csel w13, w9, w3, lo
0x51082eea82c   1ac  d280000e       movz x14, #0x0
0x51082eea830   1b0  f90037eb       str x11, [sp, #104]
0x51082eea834   1b4  f90047ed       str x13, [sp, #136]
0x51082eea838   1b8  350000cd       cbnz w13, #+0x18 (addr 0x51082eea850)
0x51082eea83c   1bc  91001109       add x9, x8, #0x4 (4)
0x51082eea840   1c0  b86968c9       ldr w9, [x6, x9]
0x51082eea844   1c4  aa0903f4       mov x20, x9
0x51082eea848   1c8  aa0a03e9       mov x9, x10
0x51082eea84c   1cc  14000045       b #+0x114 (addr 0x51082eea960)
0x51082eea850   1d0  aa0a03e9       mov x9, x10
0x51082eea854   1d4  b86968ca       ldr w10, [x6, x9]
0x51082eea858   1d8  7100015f       cmp w10, #0x0 (0)
0x51082eea85c   1dc  9a9f07ef       cset x15, ne
0x51082eea860   1e0  4b0f014a       sub w10, w10, w15
0x51082eea864   1e4  b86c68cf       ldr w15, [x6, x12]
0x51082eea868   1e8  710001ff       cmp w15, #0x0 (0)
0x51082eea86c   1ec  9a9f07f3       cset x19, ne
0x51082eea870   1f0  4b1301f3       sub w19, w15, w19
0x51082eea874   1f4  91001114       add x20, x8, #0x4 (4)
0x51082eea878   1f8  b87468d4       ldr w20, [x6, x20]
0x51082eea87c   1fc  91009115       add x21, x8, #0x24 (36)
0x51082eea880   200  bc7568c0       ldr s0, [x6, x21]
0x51082eea884   204  aa0d03f5       mov x21, x13
0x51082eea888   208  aa0403f6       mov x22, x4
0x51082eea88c   20c  aa0203f7       mov x23, x2
0x51082eea890   210  d2800038       movz x24, #0x1
0x51082eea894   214  f8520359       ldur x25, [x26, #-224]
0x51082eea898   218  eb3963ff       cmp sp, x25
0x51082eea89c   21c  54002d89       b.ls #+0x5b0 (addr 0x51082eeae4c)
0x51082eea8a0   220  2a1703f9       mov w25, w23
0x51082eea8a4   224  bc7968c1       ldr s1, [x6, x25]
0x51082eea8a8   228  1e200821       fmul s1, s1, s0
0x51082eea8ac   22c  1e212020       fcmp s1, s1
0x51082eea8b0   230  1e211de1       fcsel s1, s15, s1, ne
0x51082eea8b4   234  1e202028       fcmp s1, #0.0
0x51082eea8b8   238  1e2fcc21       fcsel s1, s1, s15, gt
0x51082eea8bc   23c  1e22c022       fcvt d2, s1
0x51082eea8c0   240  1e65c043       frintz d3, d2
0x51082eea8c4   244  1e790079       fcvtzu w25, d3
0x51082eea8c8   248  1e630324       ucvtf d4, w25
0x51082eea8cc   24c  1e642060       fcmp d3, d4
0x51082eea8d0   250  54002fc1       b.ne #+0x5f8 (addr 0x51082eeaec8)
0x51082eea8d4   254  6b19027f       cmp w19, w25
0x51082eea8d8   258  1a99327b       csel w27, w19, w25, lo
0x51082eea8dc   25c  11000779       add w25, w27, #0x1 (1)
0x51082eea8e0   260  52a9f010       movz w16, #0x4f800000
0x51082eea8e4   264  1e270202       fmov s2, w16
0x51082eea8e8   268  1e222020       fcmp s1, s2
0x51082eea8ec   26c  1a983339       csel w25, w25, w24, lo
0x51082eea8f0   270  2a1603fb       mov w27, w22
0x51082eea8f4   274  bc7b68c1       ldr s1, [x6, x27]
0x51082eea8f8   278  1e200821       fmul s1, s1, s0
0x51082eea8fc   27c  1e212020       fcmp s1, s1
0x51082eea900   280  1e211de1       fcsel s1, s15, s1, ne
0x51082eea904   284  1e202028       fcmp s1, #0.0
0x51082eea908   288  1e2fcc21       fcsel s1, s1, s15, gt
0x51082eea90c   28c  1e22c023       fcvt d3, s1
0x51082eea910   290  1e65c064       frintz d4, d3
0x51082eea914   294  1e79009b       fcvtzu w27, d4
0x51082eea918   298  1e630365       ucvtf d5, w27
0x51082eea91c   29c  1e652080       fcmp d4, d5
0x51082eea920   2a0  54002e41       b.ne #+0x5c8 (addr 0x51082eeaee8)
0x51082eea924   2a4  6b1b015f       cmp w10, w27
0x51082eea928   2a8  1a9b315c       csel w28, w10, w27, lo
0x51082eea92c   2ac  1e222020       fcmp s1, s2
0x51082eea930   2b0  1a9f339b       csel w27, w28, wzr, lo
0x51082eea934   2b4  1b0f6779       madd w25, w27, w15, w25
0x51082eea938   2b8  6b19017f       cmp w11, w25
0x51082eea93c   2bc  540000a9       b.ls #+0x14 (addr 0x51082eea950)
0x51082eea940   2c0  0b190a99       add w25, w20, w25, lsl #2
0x51082eea944   2c4  b87968db       ldr w27, [x6, x25]
0x51082eea948   2c8  1100077b       add w27, w27, #0x1 (1)
0x51082eea94c   2cc  b83968db       str w27, [x6, x25]
0x51082eea950   2d0  110012f7       add w23, w23, #0x4 (4)
0x51082eea954   2d4  110012d6       add w22, w22, #0x4 (4)
0x51082eea958   2d8  510006b5       sub w21, w21, #0x1 (1)
0x51082eea95c   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0x51082eea894)
0x51082eea960   2e0  f90007f4       str x20, [sp, #8]
0x51082eea964   2e4  3500006b       cbnz w11, #+0xc (addr 0x51082eea970)
0x51082eea968   2e8  aa0e03ea       mov x10, x14
0x51082eea96c   2ec  1400008f       b #+0x23c (addr 0x51082eeaba8)
0x51082eea970   2f0  531e7565       lsl w5, w11, #2
0x51082eea974   2f4  510010aa       sub w10, w5, #0x4 (4)
0x51082eea978   2f8  53027d4f       lsr w15, w10, #2
0x51082eea97c   2fc  110005ef       add w15, w15, #0x1 (1)
0x51082eea980   300  120009f3       and w19, w15, #0x7
0x51082eea984   304  f90033e5       str x5, [sp, #96]
0x51082eea988   308  7100715f       cmp w10, #0x1c (28)
0x51082eea98c   30c  54000563       b.lo #+0xac (addr 0x51082eeaa38)
0x51082eea990   310  121d6dea       and w10, w15, #0x7ffffff8
0x51082eea994   314  aa1403ef       mov x15, x20
0x51082eea998   318  aa0e03f5       mov x21, x14
0x51082eea99c   31c  f8520356       ldur x22, [x26, #-224]
0x51082eea9a0   320  eb3663ff       cmp sp, x22
0x51082eea9a4   324  54002b29       b.ls #+0x564 (addr 0x51082eeaf08)
0x51082eea9a8   328  b86f68d6       ldr w22, [x6, x15]
0x51082eea9ac   32c  0b1502d5       add w21, w22, w21
0x51082eea9b0   330  b82f68d5       str w21, [x6, x15]
0x51082eea9b4   334  110011f6       add w22, w15, #0x4 (4)
0x51082eea9b8   338  b87668d7       ldr w23, [x6, x22]
0x51082eea9bc   33c  0b1502f5       add w21, w23, w21
0x51082eea9c0   340  b83668d5       str w21, [x6, x22]
0x51082eea9c4   344  110021f6       add w22, w15, #0x8 (8)
0x51082eea9c8   348  b87668d7       ldr w23, [x6, x22]
0x51082eea9cc   34c  0b1502f5       add w21, w23, w21
0x51082eea9d0   350  b83668d5       str w21, [x6, x22]
0x51082eea9d4   354  110031f6       add w22, w15, #0xc (12)
0x51082eea9d8   358  b87668d7       ldr w23, [x6, x22]
0x51082eea9dc   35c  0b1502f5       add w21, w23, w21
0x51082eea9e0   360  b83668d5       str w21, [x6, x22]
0x51082eea9e4   364  110041f6       add w22, w15, #0x10 (16)
0x51082eea9e8   368  b87668d7       ldr w23, [x6, x22]
0x51082eea9ec   36c  0b1502f5       add w21, w23, w21
0x51082eea9f0   370  b83668d5       str w21, [x6, x22]
0x51082eea9f4   374  110051f6       add w22, w15, #0x14 (20)
0x51082eea9f8   378  b87668d7       ldr w23, [x6, x22]
0x51082eea9fc   37c  0b1502f5       add w21, w23, w21
0x51082eeaa00   380  b83668d5       str w21, [x6, x22]
0x51082eeaa04   384  110061f6       add w22, w15, #0x18 (24)
0x51082eeaa08   388  b87668d7       ldr w23, [x6, x22]
0x51082eeaa0c   38c  0b1502f5       add w21, w23, w21
0x51082eeaa10   390  b83668d5       str w21, [x6, x22]
0x51082eeaa14   394  110071f6       add w22, w15, #0x1c (28)
0x51082eeaa18   398  b87668d7       ldr w23, [x6, x22]
0x51082eeaa1c   39c  0b1502f5       add w21, w23, w21
0x51082eeaa20   3a0  b83668d5       str w21, [x6, x22]
0x51082eeaa24   3a4  110081ef       add w15, w15, #0x20 (32)
0x51082eeaa28   3a8  5100214a       sub w10, w10, #0x8 (8)
0x51082eeaa2c   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0x51082eea99c)
0x51082eeaa30   3b0  35000093       cbnz w19, #+0x10 (addr 0x51082eeaa40)
0x51082eeaa34   3b4  1400001f       b #+0x7c (addr 0x51082eeaab0)
0x51082eeaa38   3b8  aa0e03f5       mov x21, x14
0x51082eeaa3c   3bc  aa1403ef       mov x15, x20
0x51082eeaa40   3c0  531e766a       lsl w10, w19, #2
0x51082eeaa44   3c4  b86f68d3       ldr w19, [x6, x15]
0x51082eeaa48   3c8  0b150273       add w19, w19, w21
0x51082eeaa4c   3cc  b82f68d3       str w19, [x6, x15]
0x51082eeaa50   3d0  110011ef       add w15, w15, #0x4 (4)
0x51082eeaa54   3d4  5100114a       sub w10, w10, #0x4 (4)
0x51082eeaa58   3d8  340002ca       cbz w10, #+0x58 (addr 0x51082eeaab0)
0x51082eeaa5c   3dc  b86f68d5       ldr w21, [x6, x15]
0x51082eeaa60   3e0  0b1302b3       add w19, w21, w19
0x51082eeaa64   3e4  b82f68d3       str w19, [x6, x15]
0x51082eeaa68   3e8  110011ef       add w15, w15, #0x4 (4)
0x51082eeaa6c   3ec  5100114a       sub w10, w10, #0x4 (4)
0x51082eeaa70   3f0  3400020a       cbz w10, #+0x40 (addr 0x51082eeaab0)
0x51082eeaa74   3f4  b86f68d5       ldr w21, [x6, x15]
0x51082eeaa78   3f8  0b1302b3       add w19, w21, w19
0x51082eeaa7c   3fc  b82f68d3       str w19, [x6, x15]
0x51082eeaa80   400  110011ef       add w15, w15, #0x4 (4)
0x51082eeaa84   404  5100114a       sub w10, w10, #0x4 (4)
0x51082eeaa88   408  3400014a       cbz w10, #+0x28 (addr 0x51082eeaab0)
0x51082eeaa8c   40c  f8520355       ldur x21, [x26, #-224]
0x51082eeaa90   410  eb3563ff       cmp sp, x21
0x51082eeaa94   414  540026a9       b.ls #+0x4d4 (addr 0x51082eeaf68)
0x51082eeaa98   418  b86f68d5       ldr w21, [x6, x15]
0x51082eeaa9c   41c  0b1302b5       add w21, w21, w19
0x51082eeaaa0   420  b82f68d5       str w21, [x6, x15]
0x51082eeaaa4   424  110011ef       add w15, w15, #0x4 (4)
0x51082eeaaa8   428  5100114a       sub w10, w10, #0x4 (4)
0x51082eeaaac   42c  35fffcca       cbnz w10, #-0x68 (addr 0x51082eeaa44)
0x51082eeaab0   430  9100510a       add x10, x8, #0x14 (20)
0x51082eeaab4   434  b82a68df       str wzr, [x6, x10]
0x51082eeaab8   438  9100310f       add x15, x8, #0xc (12)
0x51082eeaabc   43c  b86f68cf       ldr w15, [x6, x15]
0x51082eeaac0   440  f9003bea       str x10, [sp, #112]
0x51082eeaac4   444  6b0f017f       cmp w11, w15
0x51082eeaac8   448  54000309       b.ls #+0x60 (addr 0x51082eeab28)
0x51082eeaacc   44c  aa0003ef       mov x15, x0
0x51082eeaad0   450  110031e0       add w0, w15, #0xc (12)
0x51082eeaad4   454  aa0b03e3       mov x3, x11
0x51082eeaad8   458  aa0e03e2       mov x2, x14
0x51082eeaadc   45c  97fc0ae9       bl #-0xfd45c (addr 0x51082ded680)
0x51082eeaae0   460  f9403fe6       ldr x6, [sp, #120]
0x51082eeaae4   464  f9403be8       ldr x8, [sp, #112]
0x51082eeaae8   468  b86868c8       ldr w8, [x6, x8]
0x51082eeaaec   46c  aa0803ea       mov x10, x8
0x51082eeaaf0   470  f94047ed       ldr x13, [sp, #136]
0x51082eeaaf4   474  d280000e       movz x14, #0x0
0x51082eeaaf8   478  f9401be4       ldr x4, [sp, #48]
0x51082eeaafc   47c  f94017e2       ldr x2, [sp, #40]
0x51082eeab00   480  f94043e8       ldr x8, [sp, #128]
0x51082eeab04   484  f9400fec       ldr x12, [sp, #24]
0x51082eeab08   488  f9400be9       ldr x9, [sp, #16]
0x51082eeab0c   48c  f9401fe3       ldr x3, [sp, #56]
0x51082eeab10   490  f9404be7       ldr x7, [sp, #144]
0x51082eeab14   494  f94013e0       ldr x0, [sp, #32]
0x51082eeab18   498  f94037eb       ldr x11, [sp, #104]
0x51082eeab1c   49c  f94033e5       ldr x5, [sp, #96]
0x51082eeab20   4a0  f94007f4       ldr x20, [sp, #8]
0x51082eeab24   4a4  14000002       b #+0x8 (addr 0x51082eeab2c)
0x51082eeab28   4a8  aa0e03ea       mov x10, x14
0x51082eeab2c   4ac  531e756f       lsl w15, w11, #2
0x51082eeab30   4b0  f9003bea       str x10, [sp, #112]
0x51082eeab34   4b4  340003af       cbz w15, #+0x74 (addr 0x51082eeaba8)
0x51082eeab38   4b8  9100410f       add x15, x8, #0x10 (16)
0x51082eeab3c   4bc  b86f68cf       ldr w15, [x6, x15]
0x51082eeab40   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0x51082eeab44   4c4  aa0703e0       mov x0, x7
0x51082eeab48   4c8  aa0e03e1       mov x1, x14
0x51082eeab4c   4cc  aa0e03e2       mov x2, x14
0x51082eeab50   4d0  aa0f03e3       mov x3, x15
0x51082eeab54   4d4  aa1403e4       mov x4, x20
0x51082eeab58   4d8  58002990       ldr x16, pc+1328 (addr 0x0000051082eeb088)
0x51082eeab5c   4dc  10000068       adr x8, #+0xc (addr 0x51082eeab68)
0x51082eeab60   4e0  a9027748       stp x8, fp, [x26, #32]
0x51082eeab64   4e4  d63f0200       blr x16
0x51082eeab68   4e8  f900175f       str xzr, [x26, #40]
0x51082eeab6c   4ec  6a00001f       tst w0, w0
0x51082eeab70   4f0  54002800       b.eq #+0x500 (addr 0x51082eeb070)
0x51082eeab74   4f4  f9403bea       ldr x10, [sp, #112]
0x51082eeab78   4f8  f94047ed       ldr x13, [sp, #136]
0x51082eeab7c   4fc  f9403fe6       ldr x6, [sp, #120]
0x51082eeab80   500  d280000e       movz x14, #0x0
0x51082eeab84   504  f9401be4       ldr x4, [sp, #48]
0x51082eeab88   508  f94017e2       ldr x2, [sp, #40]
0x51082eeab8c   50c  f94043e8       ldr x8, [sp, #128]
0x51082eeab90   510  f9400fec       ldr x12, [sp, #24]
0x51082eeab94   514  f9400be9       ldr x9, [sp, #16]
0x51082eeab98   518  f9401fe3       ldr x3, [sp, #56]
0x51082eeab9c   51c  f9404be7       ldr x7, [sp, #144]
0x51082eeaba0   520  f94013e0       ldr x0, [sp, #32]
0x51082eeaba4   524  f94037eb       ldr x11, [sp, #104]
0x51082eeaba8   528  9100810f       add x15, x8, #0x20 (32)
0x51082eeabac   52c  b82f68df       str wzr, [x6, x15]
0x51082eeabb0   530  0b0b014a       add w10, w10, w11
0x51082eeabb4   534  9100510b       add x11, x8, #0x14 (20)
0x51082eeabb8   538  b82b68ca       str w10, [x6, x11]
0x51082eeabbc   53c  f9003bef       str x15, [sp, #112]
0x51082eeabc0   540  f9002feb       str x11, [sp, #88]
0x51082eeabc4   544  35000063       cbnz w3, #+0xc (addr 0x51082eeabd0)
0x51082eeabc8   548  aa0e03ea       mov x10, x14
0x51082eeabcc   54c  14000048       b #+0x120 (addr 0x51082eeacec)
0x51082eeabd0   550  9100610a       add x10, x8, #0x18 (24)
0x51082eeabd4   554  b86a68ca       ldr w10, [x6, x10]
0x51082eeabd8   558  6b0a007f       cmp w3, w10
0x51082eeabdc   55c  540002a9       b.ls #+0x54 (addr 0x51082eeac30)
0x51082eeabe0   560  aa0003ea       mov x10, x0
0x51082eeabe4   564  11006140       add w0, w10, #0x18 (24)
0x51082eeabe8   568  aa0e03e2       mov x2, x14
0x51082eeabec   56c  97fc0aa5       bl #-0xfd56c (addr 0x51082ded680)
0x51082eeabf0   570  f9403fe6       ldr x6, [sp, #120]
0x51082eeabf4   574  f9403be8       ldr x8, [sp, #112]
0x51082eeabf8   578  b86868c9       ldr w9, [x6, x8]
0x51082eeabfc   57c  aa0903ea       mov x10, x9
0x51082eeac00   580  f94047ed       ldr x13, [sp, #136]
0x51082eeac04   584  d280000e       movz x14, #0x0
0x51082eeac08   588  f9401be4       ldr x4, [sp, #48]
0x51082eeac0c   58c  f94017e2       ldr x2, [sp, #40]
0x51082eeac10   590  aa0803ef       mov x15, x8
0x51082eeac14   594  f94043e8       ldr x8, [sp, #128]
0x51082eeac18   598  f9402feb       ldr x11, [sp, #88]
0x51082eeac1c   59c  f9400fec       ldr x12, [sp, #24]
0x51082eeac20   5a0  f9400be9       ldr x9, [sp, #16]
0x51082eeac24   5a4  f9401fe3       ldr x3, [sp, #56]
0x51082eeac28   5a8  f9404be7       ldr x7, [sp, #144]
0x51082eeac2c   5ac  14000002       b #+0x8 (addr 0x51082eeac34)
0x51082eeac30   5b0  aa0e03ea       mov x10, x14
0x51082eeac34   5b4  91007113       add x19, x8, #0x1c (28)
0x51082eeac38   5b8  b87368d3       ldr w19, [x6, x19]
0x51082eeac3c   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0x51082eeac40   5c0  f90037ea       str x10, [sp, #104]
0x51082eeac44   5c4  f90033f3       str x19, [sp, #96]
0x51082eeac48   5c8  aa0303f5       mov x21, x3
0x51082eeac4c   5cc  710006bf       cmp w21, #0x1 (1)
0x51082eeac50   5d0  540004a0       b.eq #+0x94 (addr 0x51082eeace4)
0x51082eeac54   5d4  531e76b6       lsl w22, w21, #2
0x51082eeac58   5d8  510012d6       sub w22, w22, #0x4 (4)
0x51082eeac5c   5dc  34000356       cbz w22, #+0x68 (addr 0x51082eeacc4)
0x51082eeac60   5e0  aa0703e0       mov x0, x7
0x51082eeac64   5e4  aa0e03e1       mov x1, x14
0x51082eeac68   5e8  aa1403e2       mov x2, x20
0x51082eeac6c   5ec  aa0e03e3       mov x3, x14
0x51082eeac70   5f0  aa1603e4       mov x4, x22
0x51082eeac74   5f4  580020f0       ldr x16, pc+1052 (addr 0x0000051082eeb090)    ;; external reference (wasm::memory_fill)
0x51082eeac78   5f8  10000068       adr x8, #+0xc (addr 0x51082eeac84)
0x51082eeac7c   5fc  a9027748       stp x8, fp, [x26, #32]
0x51082eeac80   600  d63f0200       blr x16
0x51082eeac84   604  f900175f       str xzr, [x26, #40]
0x51082eeac88   608  6a00001f       tst w0, w0
0x51082eeac8c   60c  54001f00       b.eq #+0x3e0 (addr 0x51082eeb06c)
0x51082eeac90   610  f94047ed       ldr x13, [sp, #136]
0x51082eeac94   614  f9403fe6       ldr x6, [sp, #120]
0x51082eeac98   618  d280000e       movz x14, #0x0
0x51082eeac9c   61c  f9401be4       ldr x4, [sp, #48]
0x51082eeaca0   620  f94017e2       ldr x2, [sp, #40]
0x51082eeaca4   624  f94043e8       ldr x8, [sp, #128]
0x51082eeaca8   628  f9402feb       ldr x11, [sp, #88]
0x51082eeacac   62c  f9400fec       ldr x12, [sp, #24]
0x51082eeacb0   630  f9400be9       ldr x9, [sp, #16]
0x51082eeacb4   634  f9403bef       ldr x15, [sp, #112]
0x51082eeacb8   638  f94037ea       ldr x10, [sp, #104]
0x51082eeacbc   63c  f94033f3       ldr x19, [sp, #96]
0x51082eeacc0   640  f9401ff5       ldr x21, [sp, #56]
0x51082eeacc4   644  aa1503f4       mov x20, x21
0x51082eeacc8   648  0b14014a       add w10, w10, w20
0x51082eeaccc   64c  51000554       sub w20, w10, #0x1 (1)
0x51082eeacd0   650  0b0a0a6a       add w10, w19, w10, lsl #2
0x51082eeacd4   654  5100114a       sub w10, w10, #0x4 (4)
0x51082eeacd8   658  aa0a03f0       mov x16, x10
0x51082eeacdc   65c  aa1403ea       mov x10, x20
0x51082eeace0   660  aa1003f4       mov x20, x16
0x51082eeace4   664  b83468df       str wzr, [x6, x20]
0x51082eeace8   668  1100054a       add w10, w10, #0x1 (1)
0x51082eeacec   66c  b82f68ca       str w10, [x6, x15]
0x51082eeacf0   670  3500008d       cbnz w13, #+0x10 (addr 0x51082eead00)
0x51082eeacf4   674  910003bf       mov sp, fp
0x51082eeacf8   678  a8c17bfd       ldp fp, lr, [sp], #16
0x51082eeacfc   67c  d65f03c0       ret
0x51082eead00   680  b86968c9       ldr w9, [x6, x9]
0x51082eead04   684  7100013f       cmp w9, #0x0 (0)
0x51082eead08   688  9a9f07ef       cset x15, ne
0x51082eead0c   68c  4b0f0129       sub w9, w9, w15
0x51082eead10   690  b86c68cc       ldr w12, [x6, x12]
0x51082eead14   694  7100019f       cmp w12, #0x0 (0)
0x51082eead18   698  9a9f07ef       cset x15, ne
0x51082eead1c   69c  4b0f018f       sub w15, w12, w15
0x51082eead20   6a0  91007113       add x19, x8, #0x1c (28)
0x51082eead24   6a4  b87368d3       ldr w19, [x6, x19]
0x51082eead28   6a8  91004114       add x20, x8, #0x10 (16)
0x51082eead2c   6ac  b87468d4       ldr w20, [x6, x20]
0x51082eead30   6b0  b86b68cb       ldr w11, [x6, x11]
0x51082eead34   6b4  91009108       add x8, x8, #0x24 (36)
0x51082eead38   6b8  bc6868c0       ldr s0, [x6, x8]
0x51082eead3c   6bc  aa0e03e8       mov x8, x14
0x51082eead40   6c0  f8520355       ldur x21, [x26, #-224]
0x51082eead44   6c4  eb3563ff       cmp sp, x21
0x51082eead48   6c8  540013c9       b.ls #+0x278 (addr 0x51082eeafc0)
0x51082eead4c   6cc  2a0403f5       mov w21, w4
0x51082eead50   6d0  bc7568c1       ldr s1, [x6, x21]
0x51082eead54   6d4  1e200821       fmul s1, s1, s0
0x51082eead58   6d8  1e212020       fcmp s1, s1
0x51082eead5c   6dc  1e211de1       fcsel s1, s15, s1, ne
0x51082eead60   6e0  1e202028       fcmp s1, #0.0
0x51082eead64   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0x51082eead68   6e8  1e22c022       fcvt d2, s1
0x51082eead6c   6ec  1e65c043       frintz d3, d2
0x51082eead70   6f0  1e790075       fcvtzu w21, d3
0x51082eead74   6f4  1e6302a4       ucvtf d4, w21
0x51082eead78   6f8  1e642060       fcmp d3, d4
0x51082eead7c   6fc  54001581       b.ne #+0x2b0 (addr 0x51082eeb02c)
0x51082eead80   700  6b15013f       cmp w9, w21
0x51082eead84   704  1a953136       csel w22, w9, w21, lo
0x51082eead88   708  52a9f010       movz w16, #0x4f800000
0x51082eead8c   70c  1e270202       fmov s2, w16
0x51082eead90   710  1e222020       fcmp s1, s2
0x51082eead94   714  1a9f32d5       csel w21, w22, wzr, lo
0x51082eead98   718  1b0c7eb5       mul w21, w21, w12
0x51082eead9c   71c  2a0203f6       mov w22, w2
0x51082eeada0   720  bc7668c1       ldr s1, [x6, x22]
0x51082eeada4   724  1e200821       fmul s1, s1, s0
0x51082eeada8   728  1e212020       fcmp s1, s1
0x51082eeadac   72c  1e211de1       fcsel s1, s15, s1, ne
0x51082eeadb0   730  1e202028       fcmp s1, #0.0
0x51082eeadb4   734  1e2fcc21       fcsel s1, s1, s15, gt
0x51082eeadb8   738  1e22c023       fcvt d3, s1
0x51082eeadbc   73c  1e65c064       frintz d4, d3
0x51082eeadc0   740  1e790096       fcvtzu w22, d4
0x51082eeadc4   744  1e6302c5       ucvtf d5, w22
0x51082eeadc8   748  1e652080       fcmp d4, d5
0x51082eeadcc   74c  54001401       b.ne #+0x280 (addr 0x51082eeb04c)
0x51082eeadd0   750  6b1601ff       cmp w15, w22
0x51082eeadd4   754  1a9631f7       csel w23, w15, w22, lo
0x51082eeadd8   758  1e222020       fcmp s1, s2
0x51082eeaddc   75c  1a9f32f6       csel w22, w23, wzr, lo
0x51082eeade0   760  0b1602b5       add w21, w21, w22
0x51082eeade4   764  6b15017f       cmp w11, w21
0x51082eeade8   768  54000149       b.ls #+0x28 (addr 0x51082eeae10)
0x51082eeadec   76c  0b150a95       add w21, w20, w21, lsl #2
0x51082eeadf0   770  b87568d6       ldr w22, [x6, x21]
0x51082eeadf4   774  6b16015f       cmp w10, w22
0x51082eeadf8   778  54000089       b.ls #+0x10 (addr 0x51082eeae08)
0x51082eeadfc   77c  0b160a76       add w22, w19, w22, lsl #2
0x51082eeae00   780  b83668c8       str w8, [x6, x22]
0x51082eeae04   784  b87568d6       ldr w22, [x6, x21]
0x51082eeae08   788  110006d6       add w22, w22, #0x1 (1)
0x51082eeae0c   78c  b83568d6       str w22, [x6, x21]
0x51082eeae10   790  11001042       add w2, w2, #0x4 (4)
0x51082eeae14   794  11001084       add w4, w4, #0x4 (4)
0x51082eeae18   798  11000508       add w8, w8, #0x1 (1)
0x51082eeae1c   79c  6b0801bf       cmp w13, w8
0x51082eeae20   7a0  54fff6a0       b.eq #-0x12c (addr 0x51082eeacf4)
0x51082eeae24   7a4  17ffffc7       b #-0xe4 (addr 0x51082eead40)
0x51082eeae28   7a8  97fc0b6a       bl #-0xfd258 (addr 0x51082dedbd0)
0x51082eeae2c   7ac  f9403fe6       ldr x6, [sp, #120]
0x51082eeae30   7b0  f9401be4       ldr x4, [sp, #48]
0x51082eeae34   7b4  f94017e2       ldr x2, [sp, #40]
0x51082eeae38   7b8  f9401fe3       ldr x3, [sp, #56]
0x51082eeae3c   7bc  f9404be7       ldr x7, [sp, #144]
0x51082eeae40   7c0  f94013e0       ldr x0, [sp, #32]
0x51082eeae44   7c4  f94027e5       ldr x5, [sp, #72]
0x51082eeae48   7c8  17fffe1d       b #-0x78c (addr 0x51082eea6bc)
0x51082eeae4c   7cc  f90007f4       str x20, [sp, #8]
0x51082eeae50   7d0  f9003bf5       str x21, [sp, #112]
0x51082eeae54   7d4  f90023f6       str x22, [sp, #64]
0x51082eeae58   7d8  f90003f7       str x23, [sp]
0x51082eeae5c   7dc  f90033ef       str x15, [sp, #96]
0x51082eeae60   7e0  f9002fea       str x10, [sp, #88]
0x51082eeae64   7e4  fd002be0       str d0, [sp, #80]
0x51082eeae68   7e8  f90027f3       str x19, [sp, #72]
0x51082eeae6c   7ec  97fc0b59       bl #-0xfd29c (addr 0x51082dedbd0)
0x51082eeae70   7f0  f94047ed       ldr x13, [sp, #136]
0x51082eeae74   7f4  f9403fe6       ldr x6, [sp, #120]
0x51082eeae78   7f8  d280000e       movz x14, #0x0
0x51082eeae7c   7fc  f9401be4       ldr x4, [sp, #48]
0x51082eeae80   800  f94017e2       ldr x2, [sp, #40]
0x51082eeae84   804  f94043e8       ldr x8, [sp, #128]
0x51082eeae88   808  f9400fec       ldr x12, [sp, #24]
0x51082eeae8c   80c  f9400be9       ldr x9, [sp, #16]
0x51082eeae90   810  f9401fe3       ldr x3, [sp, #56]
0x51082eeae94   814  f9404be7       ldr x7, [sp, #144]
0x51082eeae98   818  f94013e0       ldr x0, [sp, #32]
0x51082eeae9c   81c  f94037eb       ldr x11, [sp, #104]
0x51082eeaea0   820  f94007f4       ldr x20, [sp, #8]
0x51082eeaea4   824  f9403bf5       ldr x21, [sp, #112]
0x51082eeaea8   828  f94023f6       ldr x22, [sp, #64]
0x51082eeaeac   82c  f94003f7       ldr x23, [sp]
0x51082eeaeb0   830  f94033ef       ldr x15, [sp, #96]
0x51082eeaeb4   834  f9402fea       ldr x10, [sp, #88]
0x51082eeaeb8   838  fd402be0       ldr d0, [sp, #80]
0x51082eeaebc   83c  d2800038       movz x24, #0x1
0x51082eeaec0   840  f94027f3       ldr x19, [sp, #72]
0x51082eeaec4   844  17fffe77       b #-0x624 (addr 0x51082eea8a0)
0x51082eeaec8   848  1e622040       fcmp d2, d2
0x51082eeaecc   84c  54000060       b.eq #+0xc (addr 0x51082eeaed8)
0x51082eeaed0   850  aa0e03f9       mov x25, x14
0x51082eeaed4   854  17fffe80       b #-0x600 (addr 0x51082eea8d4)
0x51082eeaed8   858  1e202028       fcmp s1, #0.0
0x51082eeaedc   85c  54ffffa3       b.lo #-0xc (addr 0x51082eeaed0)
0x51082eeaee0   860  92800019       movn x25, #0x0
0x51082eeaee4   864  17fffe7c       b #-0x610 (addr 0x51082eea8d4)
0x51082eeaee8   868  1e632060       fcmp d3, d3
0x51082eeaeec   86c  54000060       b.eq #+0xc (addr 0x51082eeaef8)
0x51082eeaef0   870  aa0e03fb       mov cp, x14
0x51082eeaef4   874  17fffe8c       b #-0x5d0 (addr 0x51082eea924)
0x51082eeaef8   878  1e202028       fcmp s1, #0.0
0x51082eeaefc   87c  54ffffa3       b.lo #-0xc (addr 0x51082eeaef0)
0x51082eeaf00   880  9280001b       movn cp, #0x0
0x51082eeaf04   884  17fffe88       b #-0x5e0 (addr 0x51082eea924)
0x51082eeaf08   888  f9003bf3       str x19, [sp, #112]
0x51082eeaf0c   88c  f9002bea       str x10, [sp, #80]
0x51082eeaf10   890  f90027ef       str x15, [sp, #72]
0x51082eeaf14   894  f9002ff5       str x21, [sp, #88]
0x51082eeaf18   898  97fc0b2e       bl #-0xfd348 (addr 0x51082dedbd0)
0x51082eeaf1c   89c  f94047ed       ldr x13, [sp, #136]
0x51082eeaf20   8a0  f9403fe6       ldr x6, [sp, #120]
0x51082eeaf24   8a4  d280000e       movz x14, #0x0
0x51082eeaf28   8a8  f9401be4       ldr x4, [sp, #48]
0x51082eeaf2c   8ac  f94017e2       ldr x2, [sp, #40]
0x51082eeaf30   8b0  f94043e8       ldr x8, [sp, #128]
0x51082eeaf34   8b4  f9400fec       ldr x12, [sp, #24]
0x51082eeaf38   8b8  f9400be9       ldr x9, [sp, #16]
0x51082eeaf3c   8bc  f9401fe3       ldr x3, [sp, #56]
0x51082eeaf40   8c0  f9404be7       ldr x7, [sp, #144]
0x51082eeaf44   8c4  f94013e0       ldr x0, [sp, #32]
0x51082eeaf48   8c8  f94037eb       ldr x11, [sp, #104]
0x51082eeaf4c   8cc  f94033e5       ldr x5, [sp, #96]
0x51082eeaf50   8d0  f94007f4       ldr x20, [sp, #8]
0x51082eeaf54   8d4  f9403bf3       ldr x19, [sp, #112]
0x51082eeaf58   8d8  f9402bea       ldr x10, [sp, #80]
0x51082eeaf5c   8dc  f94027ef       ldr x15, [sp, #72]
0x51082eeaf60   8e0  f9402ff5       ldr x21, [sp, #88]
0x51082eeaf64   8e4  17fffe91       b #-0x5bc (addr 0x51082eea9a8)
0x51082eeaf68   8e8  f9003bea       str x10, [sp, #112]
0x51082eeaf6c   8ec  f90023ef       str x15, [sp, #64]
0x51082eeaf70   8f0  f9002bf3       str x19, [sp, #80]
0x51082eeaf74   8f4  97fc0b17       bl #-0xfd3a4 (addr 0x51082dedbd0)
0x51082eeaf78   8f8  f94047ed       ldr x13, [sp, #136]
0x51082eeaf7c   8fc  f9403fe6       ldr x6, [sp, #120]
0x51082eeaf80   900  d280000e       movz x14, #0x0
0x51082eeaf84   904  f9401be4       ldr x4, [sp, #48]
0x51082eeaf88   908  f94017e2       ldr x2, [sp, #40]
0x51082eeaf8c   90c  f94043e8       ldr x8, [sp, #128]
0x51082eeaf90   910  f9400fec       ldr x12, [sp, #24]
0x51082eeaf94   914  f9400be9       ldr x9, [sp, #16]
0x51082eeaf98   918  f9401fe3       ldr x3, [sp, #56]
0x51082eeaf9c   91c  f9404be7       ldr x7, [sp, #144]
0x51082eeafa0   920  f94013e0       ldr x0, [sp, #32]
0x51082eeafa4   924  f94037eb       ldr x11, [sp, #104]
0x51082eeafa8   928  f94033e5       ldr x5, [sp, #96]
0x51082eeafac   92c  f94007f4       ldr x20, [sp, #8]
0x51082eeafb0   930  f9403bea       ldr x10, [sp, #112]
0x51082eeafb4   934  f94023ef       ldr x15, [sp, #64]
0x51082eeafb8   938  f9402bf3       ldr x19, [sp, #80]
0x51082eeafbc   93c  17fffeb7       b #-0x524 (addr 0x51082eeaa98)
0x51082eeafc0   940  f90043e8       str x8, [sp, #128]
0x51082eeafc4   944  f9001be4       str x4, [sp, #48]
0x51082eeafc8   948  f90017e2       str x2, [sp, #40]
0x51082eeafcc   94c  f9003bf3       str x19, [sp, #112]
0x51082eeafd0   950  f90037ea       str x10, [sp, #104]
0x51082eeafd4   954  f90033f4       str x20, [sp, #96]
0x51082eeafd8   958  f9002feb       str x11, [sp, #88]
0x51082eeafdc   95c  f9002bef       str x15, [sp, #80]
0x51082eeafe0   960  fd0027e0       str d0, [sp, #72]
0x51082eeafe4   964  f90023ec       str x12, [sp, #64]
0x51082eeafe8   968  f9001fe9       str x9, [sp, #56]
0x51082eeafec   96c  97fc0af9       bl #-0xfd41c (addr 0x51082dedbd0)
0x51082eeaff0   970  f94047ed       ldr x13, [sp, #136]
0x51082eeaff4   974  f94043e8       ldr x8, [sp, #128]
0x51082eeaff8   978  f9401be4       ldr x4, [sp, #48]
0x51082eeaffc   97c  f94017e2       ldr x2, [sp, #40]
0x51082eeb000   980  f9403fe6       ldr x6, [sp, #120]
0x51082eeb004   984  f9403bf3       ldr x19, [sp, #112]
0x51082eeb008   988  f94037ea       ldr x10, [sp, #104]
0x51082eeb00c   98c  f94033f4       ldr x20, [sp, #96]
0x51082eeb010   990  f9402feb       ldr x11, [sp, #88]
0x51082eeb014   994  f9402bef       ldr x15, [sp, #80]
0x51082eeb018   998  d280000e       movz x14, #0x0
0x51082eeb01c   99c  fd4027e0       ldr d0, [sp, #72]
0x51082eeb020   9a0  f94023ec       ldr x12, [sp, #64]
0x51082eeb024   9a4  f9401fe9       ldr x9, [sp, #56]
0x51082eeb028   9a8  17ffff49       b #-0x2dc (addr 0x51082eead4c)
0x51082eeb02c   9ac  1e622040       fcmp d2, d2
0x51082eeb030   9b0  54000060       b.eq #+0xc (addr 0x51082eeb03c)
0x51082eeb034   9b4  aa0e03f5       mov x21, x14
0x51082eeb038   9b8  17ffff52       b #-0x2b8 (addr 0x51082eead80)
0x51082eeb03c   9bc  1e202028       fcmp s1, #0.0
0x51082eeb040   9c0  54ffffa3       b.lo #-0xc (addr 0x51082eeb034)
0x51082eeb044   9c4  92800015       movn x21, #0x0
0x51082eeb048   9c8  17ffff4e       b #-0x2c8 (addr 0x51082eead80)
0x51082eeb04c   9cc  1e632060       fcmp d3, d3
0x51082eeb050   9d0  54000060       b.eq #+0xc (addr 0x51082eeb05c)
0x51082eeb054   9d4  aa0e03f6       mov x22, x14
0x51082eeb058   9d8  17ffff5e       b #-0x288 (addr 0x51082eeadd0)
0x51082eeb05c   9dc  1e202028       fcmp s1, #0.0
0x51082eeb060   9e0  54ffffa3       b.lo #-0xc (addr 0x51082eeb054)
0x51082eeb064   9e4  92800016       movn x22, #0x0
0x51082eeb068   9e8  17ffff5a       b #-0x298 (addr 0x51082eeadd0)
0x51082eeb06c   9ec  97fc0a29       bl #-0xfd75c (addr 0x51082ded910)
0x51082eeb070   9f0  97fc0a28       bl #-0xfd760 (addr 0x51082ded910)
0x51082eeb074   9f4  97fc0a27       bl #-0xfd764 (addr 0x51082ded910)
0x51082eeb078   9f8  d503201f       nop
0x51082eeb07c   9fc  580000df       constant pool begin (num_const = 6)
0x51082eeb080   a00  d63f03e0       constant
0x51082eeb084   a04  d503201f       constant
0x51082eeb088   a08  051e2a68       constant
0x51082eeb08c   a0c  00000001       constant
0x51082eeb090   a10  051e2af4       constant
0x51082eeb094   a14  00000001       constant

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
0x51082eea71c     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x51082eea718  internal wasm call
0x51082eea79c  external reference (0x1051e2af4)
0x51082eeaadc  internal wasm call
0x51082eeab58  external reference (0x1051e2a68)
0x51082eeabec  internal wasm call
0x51082eeae28  wasm stub call  (0x51082dedbd0)
0x51082eeae6c  wasm stub call  (0x51082dedbd0)
0x51082eeaf18  wasm stub call  (0x51082dedbd0)
0x51082eeaf74  wasm stub call  (0x51082dedbd0)
0x51082eeafec  wasm stub call  (0x51082dedbd0)
0x51082eeb06c  wasm stub call  (0x51082ded910)
0x51082eeb070  wasm stub call  (0x51082ded910)
0x51082eeb074  wasm stub call  (0x51082ded910)
0x51082eeb07c  constant pool (size 28)
