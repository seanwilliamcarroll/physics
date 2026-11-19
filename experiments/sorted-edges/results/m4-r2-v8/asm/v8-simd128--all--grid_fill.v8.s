name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0x5b539d08660     0  d2800110       movz x16, #0x8
0x5b539d08664     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x5b539d08668     8  a9017bfd       stp fp, lr, [sp, #16]
0x5b539d0866c     c  910043fd       add fp, sp, #0x10 (16)
0x5b539d08670    10  d10243ff       sub sp, sp, #0x90 (144)
0x5b539d08674    14  f841f0e6       ldur x6, [x7, #31]
0x5b539d08678    18  f8520348       ldur x8, [x26, #-224]
0x5b539d0867c    1c  f90013e0       str x0, [sp, #32]
0x5b539d08680    20  f90017e2       str x2, [sp, #40]
0x5b539d08684    24  f9001fe3       str x3, [sp, #56]
0x5b539d08688    28  f9001be4       str x4, [sp, #48]
0x5b539d0868c    2c  f90027e5       str x5, [sp, #72]
0x5b539d08690    30  f9003fe6       str x6, [sp, #120]
0x5b539d08694    34  eb2863ff       cmp sp, x8
0x5b539d08698    38  54003b89       b.ls #+0x770 (addr 0x5b539d08e08)
0x5b539d0869c    3c  2a0003e8       mov w8, w0
0x5b539d086a0    40  91002109       add x9, x8, #0x8 (8)
0x5b539d086a4    44  b82968df       str wzr, [x6, x9]
0x5b539d086a8    48  9100b10a       add x10, x8, #0x2c (44)
0x5b539d086ac    4c  b86a68cb       ldr w11, [x6, x10]
0x5b539d086b0    50  9100a10c       add x12, x8, #0x28 (40)
0x5b539d086b4    54  b86c68cd       ldr w13, [x6, x12]
0x5b539d086b8    58  1b0d7d6b       mul w11, w11, w13
0x5b539d086bc    5c  1100056d       add w13, w11, #0x1 (1)
0x5b539d086c0    60  f90043e8       str x8, [sp, #128]
0x5b539d086c4    64  f90047e9       str x9, [sp, #136]
0x5b539d086c8    68  f9000bea       str x10, [sp, #16]
0x5b539d086cc    6c  f9000fec       str x12, [sp, #24]
0x5b539d086d0    70  f9002feb       str x11, [sp, #88]
0x5b539d086d4    74  f9003bed       str x13, [sp, #112]
0x5b539d086d8    78  3500006d       cbnz w13, #+0xc (addr 0x5b539d086e4)
0x5b539d086dc    7c  d280000b       movz x11, #0x0
0x5b539d086e0    80  14000047       b #+0x11c (addr 0x5b539d087fc)
0x5b539d086e4    84  b86868ce       ldr w14, [x6, x8]
0x5b539d086e8    88  6b0e01bf       cmp w13, w14
0x5b539d086ec    8c  540002a9       b.ls #+0x54 (addr 0x5b539d08740)
0x5b539d086f0    90  aa0d03e3       mov x3, x13
0x5b539d086f4    94  d2800002       movz x2, #0x0
0x5b539d086f8    98  97fc03e2       bl #-0xff078 (addr 0x5b539c09680)
0x5b539d086fc    9c  f9403fe6       ldr x6, [sp, #120]
0x5b539d08700    a0  f94047e8       ldr x8, [sp, #136]
0x5b539d08704    a4  b86868c9       ldr w9, [x6, x8]
0x5b539d08708    a8  aa0903ee       mov x14, x9
0x5b539d0870c    ac  f9401be4       ldr x4, [sp, #48]
0x5b539d08710    b0  f94017e2       ldr x2, [sp, #40]
0x5b539d08714    b4  aa0803e9       mov x9, x8
0x5b539d08718    b8  f94043e8       ldr x8, [sp, #128]
0x5b539d0871c    bc  f9400fec       ldr x12, [sp, #24]
0x5b539d08720    c0  f9400bea       ldr x10, [sp, #16]
0x5b539d08724    c4  f9401fe3       ldr x3, [sp, #56]
0x5b539d08728    c8  f9404be7       ldr x7, [sp, #144]
0x5b539d0872c    cc  f94013e0       ldr x0, [sp, #32]
0x5b539d08730    d0  f94027e5       ldr x5, [sp, #72]
0x5b539d08734    d4  f9403bed       ldr x13, [sp, #112]
0x5b539d08738    d8  f9402feb       ldr x11, [sp, #88]
0x5b539d0873c    dc  14000002       b #+0x8 (addr 0x5b539d08744)
0x5b539d08740    e0  d280000e       movz x14, #0x0
0x5b539d08744    e4  9100110f       add x15, x8, #0x4 (4)
0x5b539d08748    e8  b86f68cf       ldr w15, [x6, x15]
0x5b539d0874c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x5b539d08750    f0  f90033ee       str x14, [sp, #96]
0x5b539d08754    f4  f90037ef       str x15, [sp, #104]
0x5b539d08758    f8  340004eb       cbz w11, #+0x9c (addr 0x5b539d087f4)
0x5b539d0875c    fc  531e75b4       lsl w20, w13, #2
0x5b539d08760   100  51001294       sub w20, w20, #0x4 (4)
0x5b539d08764   104  34000394       cbz w20, #+0x70 (addr 0x5b539d087d4)
0x5b539d08768   108  aa0703e0       mov x0, x7
0x5b539d0876c   10c  d2800001       movz x1, #0x0
0x5b539d08770   110  aa1303e2       mov x2, x19
0x5b539d08774   114  aa1403e4       mov x4, x20
0x5b539d08778   118  aa0103e3       mov x3, x1
0x5b539d0877c   11c  580047b0       ldr x16, pc+2292 (addr 0x000005b539d09070)
0x5b539d08780   120  10000068       adr x8, #+0xc (addr 0x5b539d0878c)
0x5b539d08784   124  a9027748       stp x8, fp, [x26, #32]
0x5b539d08788   128  d63f0200       blr x16
0x5b539d0878c   12c  f900175f       str xzr, [x26, #40]
0x5b539d08790   130  6a00001f       tst w0, w0
0x5b539d08794   134  54004600       b.eq #+0x8c0 (addr 0x5b539d09054)
0x5b539d08798   138  f9403fe6       ldr x6, [sp, #120]
0x5b539d0879c   13c  f9401be4       ldr x4, [sp, #48]
0x5b539d087a0   140  f94017e2       ldr x2, [sp, #40]
0x5b539d087a4   144  f94043e8       ldr x8, [sp, #128]
0x5b539d087a8   148  f9400fec       ldr x12, [sp, #24]
0x5b539d087ac   14c  f9400bea       ldr x10, [sp, #16]
0x5b539d087b0   150  f9401fe3       ldr x3, [sp, #56]
0x5b539d087b4   154  f9404be7       ldr x7, [sp, #144]
0x5b539d087b8   158  f94013e0       ldr x0, [sp, #32]
0x5b539d087bc   15c  f94027e5       ldr x5, [sp, #72]
0x5b539d087c0   160  f94047e9       ldr x9, [sp, #136]
0x5b539d087c4   164  f94033ee       ldr x14, [sp, #96]
0x5b539d087c8   168  f94037ef       ldr x15, [sp, #104]
0x5b539d087cc   16c  f9403bed       ldr x13, [sp, #112]
0x5b539d087d0   170  f9402feb       ldr x11, [sp, #88]
0x5b539d087d4   174  aa0e03f0       mov x16, x14
0x5b539d087d8   178  aa0b03ee       mov x14, x11
0x5b539d087dc   17c  aa1003eb       mov x11, x16
0x5b539d087e0   180  0b0e016e       add w14, w11, w14
0x5b539d087e4   184  0b0d016b       add w11, w11, w13
0x5b539d087e8   188  aa0f03ed       mov x13, x15
0x5b539d087ec   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x5b539d087f0   190  51001173       sub w19, w11, #0x4 (4)
0x5b539d087f4   194  b83368df       str wzr, [x6, x19]
0x5b539d087f8   198  110005cb       add w11, w14, #0x1 (1)
0x5b539d087fc   19c  b82968cb       str w11, [x6, x9]
0x5b539d08800   1a0  aa0503e9       mov x9, x5
0x5b539d08804   1a4  6b03013f       cmp w9, w3
0x5b539d08808   1a8  1a83312d       csel w13, w9, w3, lo
0x5b539d0880c   1ac  d280000e       movz x14, #0x0
0x5b539d08810   1b0  f90037eb       str x11, [sp, #104]
0x5b539d08814   1b4  f90047ed       str x13, [sp, #136]
0x5b539d08818   1b8  350000cd       cbnz w13, #+0x18 (addr 0x5b539d08830)
0x5b539d0881c   1bc  91001109       add x9, x8, #0x4 (4)
0x5b539d08820   1c0  b86968c9       ldr w9, [x6, x9]
0x5b539d08824   1c4  aa0903f4       mov x20, x9
0x5b539d08828   1c8  aa0a03e9       mov x9, x10
0x5b539d0882c   1cc  14000045       b #+0x114 (addr 0x5b539d08940)
0x5b539d08830   1d0  aa0a03e9       mov x9, x10
0x5b539d08834   1d4  b86968ca       ldr w10, [x6, x9]
0x5b539d08838   1d8  7100015f       cmp w10, #0x0 (0)
0x5b539d0883c   1dc  9a9f07ef       cset x15, ne
0x5b539d08840   1e0  4b0f014a       sub w10, w10, w15
0x5b539d08844   1e4  b86c68cf       ldr w15, [x6, x12]
0x5b539d08848   1e8  710001ff       cmp w15, #0x0 (0)
0x5b539d0884c   1ec  9a9f07f3       cset x19, ne
0x5b539d08850   1f0  4b1301f3       sub w19, w15, w19
0x5b539d08854   1f4  91001114       add x20, x8, #0x4 (4)
0x5b539d08858   1f8  b87468d4       ldr w20, [x6, x20]
0x5b539d0885c   1fc  91009115       add x21, x8, #0x24 (36)
0x5b539d08860   200  bc7568c0       ldr s0, [x6, x21]
0x5b539d08864   204  aa0d03f5       mov x21, x13
0x5b539d08868   208  aa0403f6       mov x22, x4
0x5b539d0886c   20c  aa0203f7       mov x23, x2
0x5b539d08870   210  d2800038       movz x24, #0x1
0x5b539d08874   214  f8520359       ldur x25, [x26, #-224]
0x5b539d08878   218  eb3963ff       cmp sp, x25
0x5b539d0887c   21c  54002d89       b.ls #+0x5b0 (addr 0x5b539d08e2c)
0x5b539d08880   220  2a1703f9       mov w25, w23
0x5b539d08884   224  bc7968c1       ldr s1, [x6, x25]
0x5b539d08888   228  1e200821       fmul s1, s1, s0
0x5b539d0888c   22c  1e212020       fcmp s1, s1
0x5b539d08890   230  1e211de1       fcsel s1, s15, s1, ne
0x5b539d08894   234  1e202028       fcmp s1, #0.0
0x5b539d08898   238  1e2fcc21       fcsel s1, s1, s15, gt
0x5b539d0889c   23c  1e22c022       fcvt d2, s1
0x5b539d088a0   240  1e65c043       frintz d3, d2
0x5b539d088a4   244  1e790079       fcvtzu w25, d3
0x5b539d088a8   248  1e630324       ucvtf d4, w25
0x5b539d088ac   24c  1e642060       fcmp d3, d4
0x5b539d088b0   250  54002fc1       b.ne #+0x5f8 (addr 0x5b539d08ea8)
0x5b539d088b4   254  6b19027f       cmp w19, w25
0x5b539d088b8   258  1a99327b       csel w27, w19, w25, lo
0x5b539d088bc   25c  11000779       add w25, w27, #0x1 (1)
0x5b539d088c0   260  52a9f010       movz w16, #0x4f800000
0x5b539d088c4   264  1e270202       fmov s2, w16
0x5b539d088c8   268  1e222020       fcmp s1, s2
0x5b539d088cc   26c  1a983339       csel w25, w25, w24, lo
0x5b539d088d0   270  2a1603fb       mov w27, w22
0x5b539d088d4   274  bc7b68c1       ldr s1, [x6, x27]
0x5b539d088d8   278  1e200821       fmul s1, s1, s0
0x5b539d088dc   27c  1e212020       fcmp s1, s1
0x5b539d088e0   280  1e211de1       fcsel s1, s15, s1, ne
0x5b539d088e4   284  1e202028       fcmp s1, #0.0
0x5b539d088e8   288  1e2fcc21       fcsel s1, s1, s15, gt
0x5b539d088ec   28c  1e22c023       fcvt d3, s1
0x5b539d088f0   290  1e65c064       frintz d4, d3
0x5b539d088f4   294  1e79009b       fcvtzu w27, d4
0x5b539d088f8   298  1e630365       ucvtf d5, w27
0x5b539d088fc   29c  1e652080       fcmp d4, d5
0x5b539d08900   2a0  54002e41       b.ne #+0x5c8 (addr 0x5b539d08ec8)
0x5b539d08904   2a4  6b1b015f       cmp w10, w27
0x5b539d08908   2a8  1a9b315c       csel w28, w10, w27, lo
0x5b539d0890c   2ac  1e222020       fcmp s1, s2
0x5b539d08910   2b0  1a9f339b       csel w27, w28, wzr, lo
0x5b539d08914   2b4  1b0f6779       madd w25, w27, w15, w25
0x5b539d08918   2b8  6b19017f       cmp w11, w25
0x5b539d0891c   2bc  540000a9       b.ls #+0x14 (addr 0x5b539d08930)
0x5b539d08920   2c0  0b190a99       add w25, w20, w25, lsl #2
0x5b539d08924   2c4  b87968db       ldr w27, [x6, x25]
0x5b539d08928   2c8  1100077b       add w27, w27, #0x1 (1)
0x5b539d0892c   2cc  b83968db       str w27, [x6, x25]
0x5b539d08930   2d0  110012f7       add w23, w23, #0x4 (4)
0x5b539d08934   2d4  110012d6       add w22, w22, #0x4 (4)
0x5b539d08938   2d8  510006b5       sub w21, w21, #0x1 (1)
0x5b539d0893c   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0x5b539d08874)
0x5b539d08940   2e0  f90007f4       str x20, [sp, #8]
0x5b539d08944   2e4  3500006b       cbnz w11, #+0xc (addr 0x5b539d08950)
0x5b539d08948   2e8  aa0e03ea       mov x10, x14
0x5b539d0894c   2ec  1400008f       b #+0x23c (addr 0x5b539d08b88)
0x5b539d08950   2f0  531e7565       lsl w5, w11, #2
0x5b539d08954   2f4  510010aa       sub w10, w5, #0x4 (4)
0x5b539d08958   2f8  53027d4f       lsr w15, w10, #2
0x5b539d0895c   2fc  110005ef       add w15, w15, #0x1 (1)
0x5b539d08960   300  120009f3       and w19, w15, #0x7
0x5b539d08964   304  f90033e5       str x5, [sp, #96]
0x5b539d08968   308  7100715f       cmp w10, #0x1c (28)
0x5b539d0896c   30c  54000563       b.lo #+0xac (addr 0x5b539d08a18)
0x5b539d08970   310  121d6dea       and w10, w15, #0x7ffffff8
0x5b539d08974   314  aa1403ef       mov x15, x20
0x5b539d08978   318  aa0e03f5       mov x21, x14
0x5b539d0897c   31c  f8520356       ldur x22, [x26, #-224]
0x5b539d08980   320  eb3663ff       cmp sp, x22
0x5b539d08984   324  54002b29       b.ls #+0x564 (addr 0x5b539d08ee8)
0x5b539d08988   328  b86f68d6       ldr w22, [x6, x15]
0x5b539d0898c   32c  0b1502d5       add w21, w22, w21
0x5b539d08990   330  b82f68d5       str w21, [x6, x15]
0x5b539d08994   334  110011f6       add w22, w15, #0x4 (4)
0x5b539d08998   338  b87668d7       ldr w23, [x6, x22]
0x5b539d0899c   33c  0b1502f5       add w21, w23, w21
0x5b539d089a0   340  b83668d5       str w21, [x6, x22]
0x5b539d089a4   344  110021f6       add w22, w15, #0x8 (8)
0x5b539d089a8   348  b87668d7       ldr w23, [x6, x22]
0x5b539d089ac   34c  0b1502f5       add w21, w23, w21
0x5b539d089b0   350  b83668d5       str w21, [x6, x22]
0x5b539d089b4   354  110031f6       add w22, w15, #0xc (12)
0x5b539d089b8   358  b87668d7       ldr w23, [x6, x22]
0x5b539d089bc   35c  0b1502f5       add w21, w23, w21
0x5b539d089c0   360  b83668d5       str w21, [x6, x22]
0x5b539d089c4   364  110041f6       add w22, w15, #0x10 (16)
0x5b539d089c8   368  b87668d7       ldr w23, [x6, x22]
0x5b539d089cc   36c  0b1502f5       add w21, w23, w21
0x5b539d089d0   370  b83668d5       str w21, [x6, x22]
0x5b539d089d4   374  110051f6       add w22, w15, #0x14 (20)
0x5b539d089d8   378  b87668d7       ldr w23, [x6, x22]
0x5b539d089dc   37c  0b1502f5       add w21, w23, w21
0x5b539d089e0   380  b83668d5       str w21, [x6, x22]
0x5b539d089e4   384  110061f6       add w22, w15, #0x18 (24)
0x5b539d089e8   388  b87668d7       ldr w23, [x6, x22]
0x5b539d089ec   38c  0b1502f5       add w21, w23, w21
0x5b539d089f0   390  b83668d5       str w21, [x6, x22]
0x5b539d089f4   394  110071f6       add w22, w15, #0x1c (28)
0x5b539d089f8   398  b87668d7       ldr w23, [x6, x22]
0x5b539d089fc   39c  0b1502f5       add w21, w23, w21
0x5b539d08a00   3a0  b83668d5       str w21, [x6, x22]
0x5b539d08a04   3a4  110081ef       add w15, w15, #0x20 (32)
0x5b539d08a08   3a8  5100214a       sub w10, w10, #0x8 (8)
0x5b539d08a0c   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0x5b539d0897c)
0x5b539d08a10   3b0  35000093       cbnz w19, #+0x10 (addr 0x5b539d08a20)
0x5b539d08a14   3b4  1400001f       b #+0x7c (addr 0x5b539d08a90)
0x5b539d08a18   3b8  aa0e03f5       mov x21, x14
0x5b539d08a1c   3bc  aa1403ef       mov x15, x20
0x5b539d08a20   3c0  531e766a       lsl w10, w19, #2
0x5b539d08a24   3c4  b86f68d3       ldr w19, [x6, x15]
0x5b539d08a28   3c8  0b150273       add w19, w19, w21
0x5b539d08a2c   3cc  b82f68d3       str w19, [x6, x15]
0x5b539d08a30   3d0  110011ef       add w15, w15, #0x4 (4)
0x5b539d08a34   3d4  5100114a       sub w10, w10, #0x4 (4)
0x5b539d08a38   3d8  340002ca       cbz w10, #+0x58 (addr 0x5b539d08a90)
0x5b539d08a3c   3dc  b86f68d5       ldr w21, [x6, x15]
0x5b539d08a40   3e0  0b1302b3       add w19, w21, w19
0x5b539d08a44   3e4  b82f68d3       str w19, [x6, x15]
0x5b539d08a48   3e8  110011ef       add w15, w15, #0x4 (4)
0x5b539d08a4c   3ec  5100114a       sub w10, w10, #0x4 (4)
0x5b539d08a50   3f0  3400020a       cbz w10, #+0x40 (addr 0x5b539d08a90)
0x5b539d08a54   3f4  b86f68d5       ldr w21, [x6, x15]
0x5b539d08a58   3f8  0b1302b3       add w19, w21, w19
0x5b539d08a5c   3fc  b82f68d3       str w19, [x6, x15]
0x5b539d08a60   400  110011ef       add w15, w15, #0x4 (4)
0x5b539d08a64   404  5100114a       sub w10, w10, #0x4 (4)
0x5b539d08a68   408  3400014a       cbz w10, #+0x28 (addr 0x5b539d08a90)
0x5b539d08a6c   40c  f8520355       ldur x21, [x26, #-224]
0x5b539d08a70   410  eb3563ff       cmp sp, x21
0x5b539d08a74   414  540026a9       b.ls #+0x4d4 (addr 0x5b539d08f48)
0x5b539d08a78   418  b86f68d5       ldr w21, [x6, x15]
0x5b539d08a7c   41c  0b1302b5       add w21, w21, w19
0x5b539d08a80   420  b82f68d5       str w21, [x6, x15]
0x5b539d08a84   424  110011ef       add w15, w15, #0x4 (4)
0x5b539d08a88   428  5100114a       sub w10, w10, #0x4 (4)
0x5b539d08a8c   42c  35fffcca       cbnz w10, #-0x68 (addr 0x5b539d08a24)
0x5b539d08a90   430  9100510a       add x10, x8, #0x14 (20)
0x5b539d08a94   434  b82a68df       str wzr, [x6, x10]
0x5b539d08a98   438  9100310f       add x15, x8, #0xc (12)
0x5b539d08a9c   43c  b86f68cf       ldr w15, [x6, x15]
0x5b539d08aa0   440  f9003bea       str x10, [sp, #112]
0x5b539d08aa4   444  6b0f017f       cmp w11, w15
0x5b539d08aa8   448  54000309       b.ls #+0x60 (addr 0x5b539d08b08)
0x5b539d08aac   44c  aa0003ef       mov x15, x0
0x5b539d08ab0   450  110031e0       add w0, w15, #0xc (12)
0x5b539d08ab4   454  aa0b03e3       mov x3, x11
0x5b539d08ab8   458  aa0e03e2       mov x2, x14
0x5b539d08abc   45c  97fc02f1       bl #-0xff43c (addr 0x5b539c09680)
0x5b539d08ac0   460  f9403fe6       ldr x6, [sp, #120]
0x5b539d08ac4   464  f9403be8       ldr x8, [sp, #112]
0x5b539d08ac8   468  b86868c8       ldr w8, [x6, x8]
0x5b539d08acc   46c  aa0803ea       mov x10, x8
0x5b539d08ad0   470  f94047ed       ldr x13, [sp, #136]
0x5b539d08ad4   474  d280000e       movz x14, #0x0
0x5b539d08ad8   478  f9401be4       ldr x4, [sp, #48]
0x5b539d08adc   47c  f94017e2       ldr x2, [sp, #40]
0x5b539d08ae0   480  f94043e8       ldr x8, [sp, #128]
0x5b539d08ae4   484  f9400fec       ldr x12, [sp, #24]
0x5b539d08ae8   488  f9400be9       ldr x9, [sp, #16]
0x5b539d08aec   48c  f9401fe3       ldr x3, [sp, #56]
0x5b539d08af0   490  f9404be7       ldr x7, [sp, #144]
0x5b539d08af4   494  f94013e0       ldr x0, [sp, #32]
0x5b539d08af8   498  f94037eb       ldr x11, [sp, #104]
0x5b539d08afc   49c  f94033e5       ldr x5, [sp, #96]
0x5b539d08b00   4a0  f94007f4       ldr x20, [sp, #8]
0x5b539d08b04   4a4  14000002       b #+0x8 (addr 0x5b539d08b0c)
0x5b539d08b08   4a8  aa0e03ea       mov x10, x14
0x5b539d08b0c   4ac  531e756f       lsl w15, w11, #2
0x5b539d08b10   4b0  f9003bea       str x10, [sp, #112]
0x5b539d08b14   4b4  340003af       cbz w15, #+0x74 (addr 0x5b539d08b88)
0x5b539d08b18   4b8  9100410f       add x15, x8, #0x10 (16)
0x5b539d08b1c   4bc  b86f68cf       ldr w15, [x6, x15]
0x5b539d08b20   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0x5b539d08b24   4c4  aa0703e0       mov x0, x7
0x5b539d08b28   4c8  aa0e03e1       mov x1, x14
0x5b539d08b2c   4cc  aa0e03e2       mov x2, x14
0x5b539d08b30   4d0  aa0f03e3       mov x3, x15
0x5b539d08b34   4d4  aa1403e4       mov x4, x20
0x5b539d08b38   4d8  58002990       ldr x16, pc+1328 (addr 0x000005b539d09068)
0x5b539d08b3c   4dc  10000068       adr x8, #+0xc (addr 0x5b539d08b48)
0x5b539d08b40   4e0  a9027748       stp x8, fp, [x26, #32]
0x5b539d08b44   4e4  d63f0200       blr x16
0x5b539d08b48   4e8  f900175f       str xzr, [x26, #40]
0x5b539d08b4c   4ec  6a00001f       tst w0, w0
0x5b539d08b50   4f0  54002800       b.eq #+0x500 (addr 0x5b539d09050)
0x5b539d08b54   4f4  f9403bea       ldr x10, [sp, #112]
0x5b539d08b58   4f8  f94047ed       ldr x13, [sp, #136]
0x5b539d08b5c   4fc  f9403fe6       ldr x6, [sp, #120]
0x5b539d08b60   500  d280000e       movz x14, #0x0
0x5b539d08b64   504  f9401be4       ldr x4, [sp, #48]
0x5b539d08b68   508  f94017e2       ldr x2, [sp, #40]
0x5b539d08b6c   50c  f94043e8       ldr x8, [sp, #128]
0x5b539d08b70   510  f9400fec       ldr x12, [sp, #24]
0x5b539d08b74   514  f9400be9       ldr x9, [sp, #16]
0x5b539d08b78   518  f9401fe3       ldr x3, [sp, #56]
0x5b539d08b7c   51c  f9404be7       ldr x7, [sp, #144]
0x5b539d08b80   520  f94013e0       ldr x0, [sp, #32]
0x5b539d08b84   524  f94037eb       ldr x11, [sp, #104]
0x5b539d08b88   528  9100810f       add x15, x8, #0x20 (32)
0x5b539d08b8c   52c  b82f68df       str wzr, [x6, x15]
0x5b539d08b90   530  0b0b014a       add w10, w10, w11
0x5b539d08b94   534  9100510b       add x11, x8, #0x14 (20)
0x5b539d08b98   538  b82b68ca       str w10, [x6, x11]
0x5b539d08b9c   53c  f9003bef       str x15, [sp, #112]
0x5b539d08ba0   540  f9002feb       str x11, [sp, #88]
0x5b539d08ba4   544  35000063       cbnz w3, #+0xc (addr 0x5b539d08bb0)
0x5b539d08ba8   548  aa0e03ea       mov x10, x14
0x5b539d08bac   54c  14000048       b #+0x120 (addr 0x5b539d08ccc)
0x5b539d08bb0   550  9100610a       add x10, x8, #0x18 (24)
0x5b539d08bb4   554  b86a68ca       ldr w10, [x6, x10]
0x5b539d08bb8   558  6b0a007f       cmp w3, w10
0x5b539d08bbc   55c  540002a9       b.ls #+0x54 (addr 0x5b539d08c10)
0x5b539d08bc0   560  aa0003ea       mov x10, x0
0x5b539d08bc4   564  11006140       add w0, w10, #0x18 (24)
0x5b539d08bc8   568  aa0e03e2       mov x2, x14
0x5b539d08bcc   56c  97fc02ad       bl #-0xff54c (addr 0x5b539c09680)
0x5b539d08bd0   570  f9403fe6       ldr x6, [sp, #120]
0x5b539d08bd4   574  f9403be8       ldr x8, [sp, #112]
0x5b539d08bd8   578  b86868c9       ldr w9, [x6, x8]
0x5b539d08bdc   57c  aa0903ea       mov x10, x9
0x5b539d08be0   580  f94047ed       ldr x13, [sp, #136]
0x5b539d08be4   584  d280000e       movz x14, #0x0
0x5b539d08be8   588  f9401be4       ldr x4, [sp, #48]
0x5b539d08bec   58c  f94017e2       ldr x2, [sp, #40]
0x5b539d08bf0   590  aa0803ef       mov x15, x8
0x5b539d08bf4   594  f94043e8       ldr x8, [sp, #128]
0x5b539d08bf8   598  f9402feb       ldr x11, [sp, #88]
0x5b539d08bfc   59c  f9400fec       ldr x12, [sp, #24]
0x5b539d08c00   5a0  f9400be9       ldr x9, [sp, #16]
0x5b539d08c04   5a4  f9401fe3       ldr x3, [sp, #56]
0x5b539d08c08   5a8  f9404be7       ldr x7, [sp, #144]
0x5b539d08c0c   5ac  14000002       b #+0x8 (addr 0x5b539d08c14)
0x5b539d08c10   5b0  aa0e03ea       mov x10, x14
0x5b539d08c14   5b4  91007113       add x19, x8, #0x1c (28)
0x5b539d08c18   5b8  b87368d3       ldr w19, [x6, x19]
0x5b539d08c1c   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0x5b539d08c20   5c0  f90037ea       str x10, [sp, #104]
0x5b539d08c24   5c4  f90033f3       str x19, [sp, #96]
0x5b539d08c28   5c8  aa0303f5       mov x21, x3
0x5b539d08c2c   5cc  710006bf       cmp w21, #0x1 (1)
0x5b539d08c30   5d0  540004a0       b.eq #+0x94 (addr 0x5b539d08cc4)
0x5b539d08c34   5d4  531e76b6       lsl w22, w21, #2
0x5b539d08c38   5d8  510012d6       sub w22, w22, #0x4 (4)
0x5b539d08c3c   5dc  34000356       cbz w22, #+0x68 (addr 0x5b539d08ca4)
0x5b539d08c40   5e0  aa0703e0       mov x0, x7
0x5b539d08c44   5e4  aa0e03e1       mov x1, x14
0x5b539d08c48   5e8  aa1403e2       mov x2, x20
0x5b539d08c4c   5ec  aa0e03e3       mov x3, x14
0x5b539d08c50   5f0  aa1603e4       mov x4, x22
0x5b539d08c54   5f4  580020f0       ldr x16, pc+1052 (addr 0x000005b539d09070)    ;; external reference (wasm::memory_fill)
0x5b539d08c58   5f8  10000068       adr x8, #+0xc (addr 0x5b539d08c64)
0x5b539d08c5c   5fc  a9027748       stp x8, fp, [x26, #32]
0x5b539d08c60   600  d63f0200       blr x16
0x5b539d08c64   604  f900175f       str xzr, [x26, #40]
0x5b539d08c68   608  6a00001f       tst w0, w0
0x5b539d08c6c   60c  54001f00       b.eq #+0x3e0 (addr 0x5b539d0904c)
0x5b539d08c70   610  f94047ed       ldr x13, [sp, #136]
0x5b539d08c74   614  f9403fe6       ldr x6, [sp, #120]
0x5b539d08c78   618  d280000e       movz x14, #0x0
0x5b539d08c7c   61c  f9401be4       ldr x4, [sp, #48]
0x5b539d08c80   620  f94017e2       ldr x2, [sp, #40]
0x5b539d08c84   624  f94043e8       ldr x8, [sp, #128]
0x5b539d08c88   628  f9402feb       ldr x11, [sp, #88]
0x5b539d08c8c   62c  f9400fec       ldr x12, [sp, #24]
0x5b539d08c90   630  f9400be9       ldr x9, [sp, #16]
0x5b539d08c94   634  f9403bef       ldr x15, [sp, #112]
0x5b539d08c98   638  f94037ea       ldr x10, [sp, #104]
0x5b539d08c9c   63c  f94033f3       ldr x19, [sp, #96]
0x5b539d08ca0   640  f9401ff5       ldr x21, [sp, #56]
0x5b539d08ca4   644  aa1503f4       mov x20, x21
0x5b539d08ca8   648  0b14014a       add w10, w10, w20
0x5b539d08cac   64c  51000554       sub w20, w10, #0x1 (1)
0x5b539d08cb0   650  0b0a0a6a       add w10, w19, w10, lsl #2
0x5b539d08cb4   654  5100114a       sub w10, w10, #0x4 (4)
0x5b539d08cb8   658  aa0a03f0       mov x16, x10
0x5b539d08cbc   65c  aa1403ea       mov x10, x20
0x5b539d08cc0   660  aa1003f4       mov x20, x16
0x5b539d08cc4   664  b83468df       str wzr, [x6, x20]
0x5b539d08cc8   668  1100054a       add w10, w10, #0x1 (1)
0x5b539d08ccc   66c  b82f68ca       str w10, [x6, x15]
0x5b539d08cd0   670  3500008d       cbnz w13, #+0x10 (addr 0x5b539d08ce0)
0x5b539d08cd4   674  910003bf       mov sp, fp
0x5b539d08cd8   678  a8c17bfd       ldp fp, lr, [sp], #16
0x5b539d08cdc   67c  d65f03c0       ret
0x5b539d08ce0   680  b86968c9       ldr w9, [x6, x9]
0x5b539d08ce4   684  7100013f       cmp w9, #0x0 (0)
0x5b539d08ce8   688  9a9f07ef       cset x15, ne
0x5b539d08cec   68c  4b0f0129       sub w9, w9, w15
0x5b539d08cf0   690  b86c68cc       ldr w12, [x6, x12]
0x5b539d08cf4   694  7100019f       cmp w12, #0x0 (0)
0x5b539d08cf8   698  9a9f07ef       cset x15, ne
0x5b539d08cfc   69c  4b0f018f       sub w15, w12, w15
0x5b539d08d00   6a0  91007113       add x19, x8, #0x1c (28)
0x5b539d08d04   6a4  b87368d3       ldr w19, [x6, x19]
0x5b539d08d08   6a8  91004114       add x20, x8, #0x10 (16)
0x5b539d08d0c   6ac  b87468d4       ldr w20, [x6, x20]
0x5b539d08d10   6b0  b86b68cb       ldr w11, [x6, x11]
0x5b539d08d14   6b4  91009108       add x8, x8, #0x24 (36)
0x5b539d08d18   6b8  bc6868c0       ldr s0, [x6, x8]
0x5b539d08d1c   6bc  aa0e03e8       mov x8, x14
0x5b539d08d20   6c0  f8520355       ldur x21, [x26, #-224]
0x5b539d08d24   6c4  eb3563ff       cmp sp, x21
0x5b539d08d28   6c8  540013c9       b.ls #+0x278 (addr 0x5b539d08fa0)
0x5b539d08d2c   6cc  2a0403f5       mov w21, w4
0x5b539d08d30   6d0  bc7568c1       ldr s1, [x6, x21]
0x5b539d08d34   6d4  1e200821       fmul s1, s1, s0
0x5b539d08d38   6d8  1e212020       fcmp s1, s1
0x5b539d08d3c   6dc  1e211de1       fcsel s1, s15, s1, ne
0x5b539d08d40   6e0  1e202028       fcmp s1, #0.0
0x5b539d08d44   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0x5b539d08d48   6e8  1e22c022       fcvt d2, s1
0x5b539d08d4c   6ec  1e65c043       frintz d3, d2
0x5b539d08d50   6f0  1e790075       fcvtzu w21, d3
0x5b539d08d54   6f4  1e6302a4       ucvtf d4, w21
0x5b539d08d58   6f8  1e642060       fcmp d3, d4
0x5b539d08d5c   6fc  54001581       b.ne #+0x2b0 (addr 0x5b539d0900c)
0x5b539d08d60   700  6b15013f       cmp w9, w21
0x5b539d08d64   704  1a953136       csel w22, w9, w21, lo
0x5b539d08d68   708  52a9f010       movz w16, #0x4f800000
0x5b539d08d6c   70c  1e270202       fmov s2, w16
0x5b539d08d70   710  1e222020       fcmp s1, s2
0x5b539d08d74   714  1a9f32d5       csel w21, w22, wzr, lo
0x5b539d08d78   718  1b0c7eb5       mul w21, w21, w12
0x5b539d08d7c   71c  2a0203f6       mov w22, w2
0x5b539d08d80   720  bc7668c1       ldr s1, [x6, x22]
0x5b539d08d84   724  1e200821       fmul s1, s1, s0
0x5b539d08d88   728  1e212020       fcmp s1, s1
0x5b539d08d8c   72c  1e211de1       fcsel s1, s15, s1, ne
0x5b539d08d90   730  1e202028       fcmp s1, #0.0
0x5b539d08d94   734  1e2fcc21       fcsel s1, s1, s15, gt
0x5b539d08d98   738  1e22c023       fcvt d3, s1
0x5b539d08d9c   73c  1e65c064       frintz d4, d3
0x5b539d08da0   740  1e790096       fcvtzu w22, d4
0x5b539d08da4   744  1e6302c5       ucvtf d5, w22
0x5b539d08da8   748  1e652080       fcmp d4, d5
0x5b539d08dac   74c  54001401       b.ne #+0x280 (addr 0x5b539d0902c)
0x5b539d08db0   750  6b1601ff       cmp w15, w22
0x5b539d08db4   754  1a9631f7       csel w23, w15, w22, lo
0x5b539d08db8   758  1e222020       fcmp s1, s2
0x5b539d08dbc   75c  1a9f32f6       csel w22, w23, wzr, lo
0x5b539d08dc0   760  0b1602b5       add w21, w21, w22
0x5b539d08dc4   764  6b15017f       cmp w11, w21
0x5b539d08dc8   768  54000149       b.ls #+0x28 (addr 0x5b539d08df0)
0x5b539d08dcc   76c  0b150a95       add w21, w20, w21, lsl #2
0x5b539d08dd0   770  b87568d6       ldr w22, [x6, x21]
0x5b539d08dd4   774  6b16015f       cmp w10, w22
0x5b539d08dd8   778  54000089       b.ls #+0x10 (addr 0x5b539d08de8)
0x5b539d08ddc   77c  0b160a76       add w22, w19, w22, lsl #2
0x5b539d08de0   780  b83668c8       str w8, [x6, x22]
0x5b539d08de4   784  b87568d6       ldr w22, [x6, x21]
0x5b539d08de8   788  110006d6       add w22, w22, #0x1 (1)
0x5b539d08dec   78c  b83568d6       str w22, [x6, x21]
0x5b539d08df0   790  11001042       add w2, w2, #0x4 (4)
0x5b539d08df4   794  11001084       add w4, w4, #0x4 (4)
0x5b539d08df8   798  11000508       add w8, w8, #0x1 (1)
0x5b539d08dfc   79c  6b0801bf       cmp w13, w8
0x5b539d08e00   7a0  54fff6a0       b.eq #-0x12c (addr 0x5b539d08cd4)
0x5b539d08e04   7a4  17ffffc7       b #-0xe4 (addr 0x5b539d08d20)
0x5b539d08e08   7a8  97fc0372       bl #-0xff238 (addr 0x5b539c09bd0)
0x5b539d08e0c   7ac  f9403fe6       ldr x6, [sp, #120]
0x5b539d08e10   7b0  f9401be4       ldr x4, [sp, #48]
0x5b539d08e14   7b4  f94017e2       ldr x2, [sp, #40]
0x5b539d08e18   7b8  f9401fe3       ldr x3, [sp, #56]
0x5b539d08e1c   7bc  f9404be7       ldr x7, [sp, #144]
0x5b539d08e20   7c0  f94013e0       ldr x0, [sp, #32]
0x5b539d08e24   7c4  f94027e5       ldr x5, [sp, #72]
0x5b539d08e28   7c8  17fffe1d       b #-0x78c (addr 0x5b539d0869c)
0x5b539d08e2c   7cc  f90007f4       str x20, [sp, #8]
0x5b539d08e30   7d0  f9003bf5       str x21, [sp, #112]
0x5b539d08e34   7d4  f90023f6       str x22, [sp, #64]
0x5b539d08e38   7d8  f90003f7       str x23, [sp]
0x5b539d08e3c   7dc  f90033ef       str x15, [sp, #96]
0x5b539d08e40   7e0  f9002fea       str x10, [sp, #88]
0x5b539d08e44   7e4  fd002be0       str d0, [sp, #80]
0x5b539d08e48   7e8  f90027f3       str x19, [sp, #72]
0x5b539d08e4c   7ec  97fc0361       bl #-0xff27c (addr 0x5b539c09bd0)
0x5b539d08e50   7f0  f94047ed       ldr x13, [sp, #136]
0x5b539d08e54   7f4  f9403fe6       ldr x6, [sp, #120]
0x5b539d08e58   7f8  d280000e       movz x14, #0x0
0x5b539d08e5c   7fc  f9401be4       ldr x4, [sp, #48]
0x5b539d08e60   800  f94017e2       ldr x2, [sp, #40]
0x5b539d08e64   804  f94043e8       ldr x8, [sp, #128]
0x5b539d08e68   808  f9400fec       ldr x12, [sp, #24]
0x5b539d08e6c   80c  f9400be9       ldr x9, [sp, #16]
0x5b539d08e70   810  f9401fe3       ldr x3, [sp, #56]
0x5b539d08e74   814  f9404be7       ldr x7, [sp, #144]
0x5b539d08e78   818  f94013e0       ldr x0, [sp, #32]
0x5b539d08e7c   81c  f94037eb       ldr x11, [sp, #104]
0x5b539d08e80   820  f94007f4       ldr x20, [sp, #8]
0x5b539d08e84   824  f9403bf5       ldr x21, [sp, #112]
0x5b539d08e88   828  f94023f6       ldr x22, [sp, #64]
0x5b539d08e8c   82c  f94003f7       ldr x23, [sp]
0x5b539d08e90   830  f94033ef       ldr x15, [sp, #96]
0x5b539d08e94   834  f9402fea       ldr x10, [sp, #88]
0x5b539d08e98   838  fd402be0       ldr d0, [sp, #80]
0x5b539d08e9c   83c  d2800038       movz x24, #0x1
0x5b539d08ea0   840  f94027f3       ldr x19, [sp, #72]
0x5b539d08ea4   844  17fffe77       b #-0x624 (addr 0x5b539d08880)
0x5b539d08ea8   848  1e622040       fcmp d2, d2
0x5b539d08eac   84c  54000060       b.eq #+0xc (addr 0x5b539d08eb8)
0x5b539d08eb0   850  aa0e03f9       mov x25, x14
0x5b539d08eb4   854  17fffe80       b #-0x600 (addr 0x5b539d088b4)
0x5b539d08eb8   858  1e202028       fcmp s1, #0.0
0x5b539d08ebc   85c  54ffffa3       b.lo #-0xc (addr 0x5b539d08eb0)
0x5b539d08ec0   860  92800019       movn x25, #0x0
0x5b539d08ec4   864  17fffe7c       b #-0x610 (addr 0x5b539d088b4)
0x5b539d08ec8   868  1e632060       fcmp d3, d3
0x5b539d08ecc   86c  54000060       b.eq #+0xc (addr 0x5b539d08ed8)
0x5b539d08ed0   870  aa0e03fb       mov cp, x14
0x5b539d08ed4   874  17fffe8c       b #-0x5d0 (addr 0x5b539d08904)
0x5b539d08ed8   878  1e202028       fcmp s1, #0.0
0x5b539d08edc   87c  54ffffa3       b.lo #-0xc (addr 0x5b539d08ed0)
0x5b539d08ee0   880  9280001b       movn cp, #0x0
0x5b539d08ee4   884  17fffe88       b #-0x5e0 (addr 0x5b539d08904)
0x5b539d08ee8   888  f9003bf3       str x19, [sp, #112]
0x5b539d08eec   88c  f9002bea       str x10, [sp, #80]
0x5b539d08ef0   890  f90027ef       str x15, [sp, #72]
0x5b539d08ef4   894  f9002ff5       str x21, [sp, #88]
0x5b539d08ef8   898  97fc0336       bl #-0xff328 (addr 0x5b539c09bd0)
0x5b539d08efc   89c  f94047ed       ldr x13, [sp, #136]
0x5b539d08f00   8a0  f9403fe6       ldr x6, [sp, #120]
0x5b539d08f04   8a4  d280000e       movz x14, #0x0
0x5b539d08f08   8a8  f9401be4       ldr x4, [sp, #48]
0x5b539d08f0c   8ac  f94017e2       ldr x2, [sp, #40]
0x5b539d08f10   8b0  f94043e8       ldr x8, [sp, #128]
0x5b539d08f14   8b4  f9400fec       ldr x12, [sp, #24]
0x5b539d08f18   8b8  f9400be9       ldr x9, [sp, #16]
0x5b539d08f1c   8bc  f9401fe3       ldr x3, [sp, #56]
0x5b539d08f20   8c0  f9404be7       ldr x7, [sp, #144]
0x5b539d08f24   8c4  f94013e0       ldr x0, [sp, #32]
0x5b539d08f28   8c8  f94037eb       ldr x11, [sp, #104]
0x5b539d08f2c   8cc  f94033e5       ldr x5, [sp, #96]
0x5b539d08f30   8d0  f94007f4       ldr x20, [sp, #8]
0x5b539d08f34   8d4  f9403bf3       ldr x19, [sp, #112]
0x5b539d08f38   8d8  f9402bea       ldr x10, [sp, #80]
0x5b539d08f3c   8dc  f94027ef       ldr x15, [sp, #72]
0x5b539d08f40   8e0  f9402ff5       ldr x21, [sp, #88]
0x5b539d08f44   8e4  17fffe91       b #-0x5bc (addr 0x5b539d08988)
0x5b539d08f48   8e8  f9003bea       str x10, [sp, #112]
0x5b539d08f4c   8ec  f90023ef       str x15, [sp, #64]
0x5b539d08f50   8f0  f9002bf3       str x19, [sp, #80]
0x5b539d08f54   8f4  97fc031f       bl #-0xff384 (addr 0x5b539c09bd0)
0x5b539d08f58   8f8  f94047ed       ldr x13, [sp, #136]
0x5b539d08f5c   8fc  f9403fe6       ldr x6, [sp, #120]
0x5b539d08f60   900  d280000e       movz x14, #0x0
0x5b539d08f64   904  f9401be4       ldr x4, [sp, #48]
0x5b539d08f68   908  f94017e2       ldr x2, [sp, #40]
0x5b539d08f6c   90c  f94043e8       ldr x8, [sp, #128]
0x5b539d08f70   910  f9400fec       ldr x12, [sp, #24]
0x5b539d08f74   914  f9400be9       ldr x9, [sp, #16]
0x5b539d08f78   918  f9401fe3       ldr x3, [sp, #56]
0x5b539d08f7c   91c  f9404be7       ldr x7, [sp, #144]
0x5b539d08f80   920  f94013e0       ldr x0, [sp, #32]
0x5b539d08f84   924  f94037eb       ldr x11, [sp, #104]
0x5b539d08f88   928  f94033e5       ldr x5, [sp, #96]
0x5b539d08f8c   92c  f94007f4       ldr x20, [sp, #8]
0x5b539d08f90   930  f9403bea       ldr x10, [sp, #112]
0x5b539d08f94   934  f94023ef       ldr x15, [sp, #64]
0x5b539d08f98   938  f9402bf3       ldr x19, [sp, #80]
0x5b539d08f9c   93c  17fffeb7       b #-0x524 (addr 0x5b539d08a78)
0x5b539d08fa0   940  f90043e8       str x8, [sp, #128]
0x5b539d08fa4   944  f9001be4       str x4, [sp, #48]
0x5b539d08fa8   948  f90017e2       str x2, [sp, #40]
0x5b539d08fac   94c  f9003bf3       str x19, [sp, #112]
0x5b539d08fb0   950  f90037ea       str x10, [sp, #104]
0x5b539d08fb4   954  f90033f4       str x20, [sp, #96]
0x5b539d08fb8   958  f9002feb       str x11, [sp, #88]
0x5b539d08fbc   95c  f9002bef       str x15, [sp, #80]
0x5b539d08fc0   960  fd0027e0       str d0, [sp, #72]
0x5b539d08fc4   964  f90023ec       str x12, [sp, #64]
0x5b539d08fc8   968  f9001fe9       str x9, [sp, #56]
0x5b539d08fcc   96c  97fc0301       bl #-0xff3fc (addr 0x5b539c09bd0)
0x5b539d08fd0   970  f94047ed       ldr x13, [sp, #136]
0x5b539d08fd4   974  f94043e8       ldr x8, [sp, #128]
0x5b539d08fd8   978  f9401be4       ldr x4, [sp, #48]
0x5b539d08fdc   97c  f94017e2       ldr x2, [sp, #40]
0x5b539d08fe0   980  f9403fe6       ldr x6, [sp, #120]
0x5b539d08fe4   984  f9403bf3       ldr x19, [sp, #112]
0x5b539d08fe8   988  f94037ea       ldr x10, [sp, #104]
0x5b539d08fec   98c  f94033f4       ldr x20, [sp, #96]
0x5b539d08ff0   990  f9402feb       ldr x11, [sp, #88]
0x5b539d08ff4   994  f9402bef       ldr x15, [sp, #80]
0x5b539d08ff8   998  d280000e       movz x14, #0x0
0x5b539d08ffc   99c  fd4027e0       ldr d0, [sp, #72]
0x5b539d09000   9a0  f94023ec       ldr x12, [sp, #64]
0x5b539d09004   9a4  f9401fe9       ldr x9, [sp, #56]
0x5b539d09008   9a8  17ffff49       b #-0x2dc (addr 0x5b539d08d2c)
0x5b539d0900c   9ac  1e622040       fcmp d2, d2
0x5b539d09010   9b0  54000060       b.eq #+0xc (addr 0x5b539d0901c)
0x5b539d09014   9b4  aa0e03f5       mov x21, x14
0x5b539d09018   9b8  17ffff52       b #-0x2b8 (addr 0x5b539d08d60)
0x5b539d0901c   9bc  1e202028       fcmp s1, #0.0
0x5b539d09020   9c0  54ffffa3       b.lo #-0xc (addr 0x5b539d09014)
0x5b539d09024   9c4  92800015       movn x21, #0x0
0x5b539d09028   9c8  17ffff4e       b #-0x2c8 (addr 0x5b539d08d60)
0x5b539d0902c   9cc  1e632060       fcmp d3, d3
0x5b539d09030   9d0  54000060       b.eq #+0xc (addr 0x5b539d0903c)
0x5b539d09034   9d4  aa0e03f6       mov x22, x14
0x5b539d09038   9d8  17ffff5e       b #-0x288 (addr 0x5b539d08db0)
0x5b539d0903c   9dc  1e202028       fcmp s1, #0.0
0x5b539d09040   9e0  54ffffa3       b.lo #-0xc (addr 0x5b539d09034)
0x5b539d09044   9e4  92800016       movn x22, #0x0
0x5b539d09048   9e8  17ffff5a       b #-0x298 (addr 0x5b539d08db0)
0x5b539d0904c   9ec  97fc0231       bl #-0xff73c (addr 0x5b539c09910)
0x5b539d09050   9f0  97fc0230       bl #-0xff740 (addr 0x5b539c09910)
0x5b539d09054   9f4  97fc022f       bl #-0xff744 (addr 0x5b539c09910)
0x5b539d09058   9f8  d503201f       nop
0x5b539d0905c   9fc  580000df       constant pool begin (num_const = 6)
0x5b539d09060   a00  d63f03e0       constant
0x5b539d09064   a04  d503201f       constant
0x5b539d09068   a08  01d46a68       constant
0x5b539d0906c   a0c  00000001       constant
0x5b539d09070   a10  01d46af4       constant
0x5b539d09074   a14  00000001       constant

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
0x5b539d086fc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x5b539d086f8  internal wasm call
0x5b539d0877c  external reference (0x101d46af4)
0x5b539d08abc  internal wasm call
0x5b539d08b38  external reference (0x101d46a68)
0x5b539d08bcc  internal wasm call
0x5b539d08e08  wasm stub call  (0x5b539c09bd0)
0x5b539d08e4c  wasm stub call  (0x5b539c09bd0)
0x5b539d08ef8  wasm stub call  (0x5b539c09bd0)
0x5b539d08f54  wasm stub call  (0x5b539c09bd0)
0x5b539d08fcc  wasm stub call  (0x5b539c09bd0)
0x5b539d0904c  wasm stub call  (0x5b539c09910)
0x5b539d09050  wasm stub call  (0x5b539c09910)
0x5b539d09054  wasm stub call  (0x5b539c09910)
0x5b539d0905c  constant pool (size 28)
