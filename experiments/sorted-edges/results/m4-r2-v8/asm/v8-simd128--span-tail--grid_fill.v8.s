name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2616 + 8 padding)
Instructions (size = 2600)
0x2a456924660     0  d2800110       movz x16, #0x8
0x2a456924664     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x2a456924668     8  a9017bfd       stp fp, lr, [sp, #16]
0x2a45692466c     c  910043fd       add fp, sp, #0x10 (16)
0x2a456924670    10  d10243ff       sub sp, sp, #0x90 (144)
0x2a456924674    14  f841f0e6       ldur x6, [x7, #31]
0x2a456924678    18  f8520348       ldur x8, [x26, #-224]
0x2a45692467c    1c  f90013e0       str x0, [sp, #32]
0x2a456924680    20  f90017e2       str x2, [sp, #40]
0x2a456924684    24  f9001fe3       str x3, [sp, #56]
0x2a456924688    28  f9001be4       str x4, [sp, #48]
0x2a45692468c    2c  f90027e5       str x5, [sp, #72]
0x2a456924690    30  f9003fe6       str x6, [sp, #120]
0x2a456924694    34  eb2863ff       cmp sp, x8
0x2a456924698    38  54003c09       b.ls #+0x780 (addr 0x2a456924e18)
0x2a45692469c    3c  2a0003e8       mov w8, w0
0x2a4569246a0    40  91002109       add x9, x8, #0x8 (8)
0x2a4569246a4    44  b82968df       str wzr, [x6, x9]
0x2a4569246a8    48  9100b10a       add x10, x8, #0x2c (44)
0x2a4569246ac    4c  b86a68cb       ldr w11, [x6, x10]
0x2a4569246b0    50  9100a10c       add x12, x8, #0x28 (40)
0x2a4569246b4    54  b86c68cd       ldr w13, [x6, x12]
0x2a4569246b8    58  1b0d7d6b       mul w11, w11, w13
0x2a4569246bc    5c  1100056d       add w13, w11, #0x1 (1)
0x2a4569246c0    60  f90043e8       str x8, [sp, #128]
0x2a4569246c4    64  f90047e9       str x9, [sp, #136]
0x2a4569246c8    68  f9000bea       str x10, [sp, #16]
0x2a4569246cc    6c  f9000fec       str x12, [sp, #24]
0x2a4569246d0    70  f9002feb       str x11, [sp, #88]
0x2a4569246d4    74  f9003bed       str x13, [sp, #112]
0x2a4569246d8    78  3500006d       cbnz w13, #+0xc (addr 0x2a4569246e4)
0x2a4569246dc    7c  d280000b       movz x11, #0x0
0x2a4569246e0    80  14000047       b #+0x11c (addr 0x2a4569247fc)
0x2a4569246e4    84  b86868ce       ldr w14, [x6, x8]
0x2a4569246e8    88  6b0e01bf       cmp w13, w14
0x2a4569246ec    8c  540002a9       b.ls #+0x54 (addr 0x2a456924740)
0x2a4569246f0    90  aa0d03e3       mov x3, x13
0x2a4569246f4    94  d2800002       movz x2, #0x0
0x2a4569246f8    98  97fc03e2       bl #-0xff078 (addr 0x2a456825680)
0x2a4569246fc    9c  f9403fe6       ldr x6, [sp, #120]
0x2a456924700    a0  f94047e8       ldr x8, [sp, #136]
0x2a456924704    a4  b86868c9       ldr w9, [x6, x8]
0x2a456924708    a8  aa0903ee       mov x14, x9
0x2a45692470c    ac  f9401be4       ldr x4, [sp, #48]
0x2a456924710    b0  f94017e2       ldr x2, [sp, #40]
0x2a456924714    b4  aa0803e9       mov x9, x8
0x2a456924718    b8  f94043e8       ldr x8, [sp, #128]
0x2a45692471c    bc  f9400fec       ldr x12, [sp, #24]
0x2a456924720    c0  f9400bea       ldr x10, [sp, #16]
0x2a456924724    c4  f9401fe3       ldr x3, [sp, #56]
0x2a456924728    c8  f9404be7       ldr x7, [sp, #144]
0x2a45692472c    cc  f94013e0       ldr x0, [sp, #32]
0x2a456924730    d0  f94027e5       ldr x5, [sp, #72]
0x2a456924734    d4  f9403bed       ldr x13, [sp, #112]
0x2a456924738    d8  f9402feb       ldr x11, [sp, #88]
0x2a45692473c    dc  14000002       b #+0x8 (addr 0x2a456924744)
0x2a456924740    e0  d280000e       movz x14, #0x0
0x2a456924744    e4  9100110f       add x15, x8, #0x4 (4)
0x2a456924748    e8  b86f68cf       ldr w15, [x6, x15]
0x2a45692474c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x2a456924750    f0  f90033ee       str x14, [sp, #96]
0x2a456924754    f4  f90037ef       str x15, [sp, #104]
0x2a456924758    f8  340004eb       cbz w11, #+0x9c (addr 0x2a4569247f4)
0x2a45692475c    fc  531e75b4       lsl w20, w13, #2
0x2a456924760   100  51001294       sub w20, w20, #0x4 (4)
0x2a456924764   104  34000394       cbz w20, #+0x70 (addr 0x2a4569247d4)
0x2a456924768   108  aa0703e0       mov x0, x7
0x2a45692476c   10c  d2800001       movz x1, #0x0
0x2a456924770   110  aa1303e2       mov x2, x19
0x2a456924774   114  aa1403e4       mov x4, x20
0x2a456924778   118  aa0103e3       mov x3, x1
0x2a45692477c   11c  58004830       ldr x16, pc+2308 (addr 0x000002a456925080)
0x2a456924780   120  10000068       adr x8, #+0xc (addr 0x2a45692478c)
0x2a456924784   124  a9027748       stp x8, fp, [x26, #32]
0x2a456924788   128  d63f0200       blr x16
0x2a45692478c   12c  f900175f       str xzr, [x26, #40]
0x2a456924790   130  6a00001f       tst w0, w0
0x2a456924794   134  54004680       b.eq #+0x8d0 (addr 0x2a456925064)
0x2a456924798   138  f9403fe6       ldr x6, [sp, #120]
0x2a45692479c   13c  f9401be4       ldr x4, [sp, #48]
0x2a4569247a0   140  f94017e2       ldr x2, [sp, #40]
0x2a4569247a4   144  f94043e8       ldr x8, [sp, #128]
0x2a4569247a8   148  f9400fec       ldr x12, [sp, #24]
0x2a4569247ac   14c  f9400bea       ldr x10, [sp, #16]
0x2a4569247b0   150  f9401fe3       ldr x3, [sp, #56]
0x2a4569247b4   154  f9404be7       ldr x7, [sp, #144]
0x2a4569247b8   158  f94013e0       ldr x0, [sp, #32]
0x2a4569247bc   15c  f94027e5       ldr x5, [sp, #72]
0x2a4569247c0   160  f94047e9       ldr x9, [sp, #136]
0x2a4569247c4   164  f94033ee       ldr x14, [sp, #96]
0x2a4569247c8   168  f94037ef       ldr x15, [sp, #104]
0x2a4569247cc   16c  f9403bed       ldr x13, [sp, #112]
0x2a4569247d0   170  f9402feb       ldr x11, [sp, #88]
0x2a4569247d4   174  aa0e03f0       mov x16, x14
0x2a4569247d8   178  aa0b03ee       mov x14, x11
0x2a4569247dc   17c  aa1003eb       mov x11, x16
0x2a4569247e0   180  0b0e016e       add w14, w11, w14
0x2a4569247e4   184  0b0d016b       add w11, w11, w13
0x2a4569247e8   188  aa0f03ed       mov x13, x15
0x2a4569247ec   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x2a4569247f0   190  51001173       sub w19, w11, #0x4 (4)
0x2a4569247f4   194  b83368df       str wzr, [x6, x19]
0x2a4569247f8   198  110005cb       add w11, w14, #0x1 (1)
0x2a4569247fc   19c  b82968cb       str w11, [x6, x9]
0x2a456924800   1a0  aa0503e9       mov x9, x5
0x2a456924804   1a4  6b03013f       cmp w9, w3
0x2a456924808   1a8  1a83312d       csel w13, w9, w3, lo
0x2a45692480c   1ac  d280000e       movz x14, #0x0
0x2a456924810   1b0  f90037eb       str x11, [sp, #104]
0x2a456924814   1b4  f90047ed       str x13, [sp, #136]
0x2a456924818   1b8  350000cd       cbnz w13, #+0x18 (addr 0x2a456924830)
0x2a45692481c   1bc  91001109       add x9, x8, #0x4 (4)
0x2a456924820   1c0  b86968c9       ldr w9, [x6, x9]
0x2a456924824   1c4  aa0903f4       mov x20, x9
0x2a456924828   1c8  aa0a03e9       mov x9, x10
0x2a45692482c   1cc  14000047       b #+0x11c (addr 0x2a456924948)
0x2a456924830   1d0  aa0a03e9       mov x9, x10
0x2a456924834   1d4  b86968ca       ldr w10, [x6, x9]
0x2a456924838   1d8  7100015f       cmp w10, #0x0 (0)
0x2a45692483c   1dc  9a9f07ef       cset x15, ne
0x2a456924840   1e0  4b0f014a       sub w10, w10, w15
0x2a456924844   1e4  b86c68cf       ldr w15, [x6, x12]
0x2a456924848   1e8  710001ff       cmp w15, #0x0 (0)
0x2a45692484c   1ec  9a9f07f3       cset x19, ne
0x2a456924850   1f0  4b1301f3       sub w19, w15, w19
0x2a456924854   1f4  91001114       add x20, x8, #0x4 (4)
0x2a456924858   1f8  b87468d4       ldr w20, [x6, x20]
0x2a45692485c   1fc  91009115       add x21, x8, #0x24 (36)
0x2a456924860   200  bc7568c0       ldr s0, [x6, x21]
0x2a456924864   204  aa0d03f5       mov x21, x13
0x2a456924868   208  aa0403f6       mov x22, x4
0x2a45692486c   20c  aa0203f7       mov x23, x2
0x2a456924870   210  d2800038       movz x24, #0x1
0x2a456924874   214  f8520359       ldur x25, [x26, #-224]
0x2a456924878   218  eb3963ff       cmp sp, x25
0x2a45692487c   21c  54002e09       b.ls #+0x5c0 (addr 0x2a456924e3c)
0x2a456924880   220  2a1703f9       mov w25, w23
0x2a456924884   224  bc7968c1       ldr s1, [x6, x25]
0x2a456924888   228  1e200821       fmul s1, s1, s0
0x2a45692488c   22c  1e212020       fcmp s1, s1
0x2a456924890   230  1e211de1       fcsel s1, s15, s1, ne
0x2a456924894   234  1e202028       fcmp s1, #0.0
0x2a456924898   238  1e2fcc21       fcsel s1, s1, s15, gt
0x2a45692489c   23c  1e254021       frintm s1, s1
0x2a4569248a0   240  1e22c022       fcvt d2, s1
0x2a4569248a4   244  1e65c043       frintz d3, d2
0x2a4569248a8   248  1e790079       fcvtzu w25, d3
0x2a4569248ac   24c  1e630324       ucvtf d4, w25
0x2a4569248b0   250  1e642060       fcmp d3, d4
0x2a4569248b4   254  54003021       b.ne #+0x604 (addr 0x2a456924eb8)
0x2a4569248b8   258  6b19027f       cmp w19, w25
0x2a4569248bc   25c  1a99327b       csel w27, w19, w25, lo
0x2a4569248c0   260  11000779       add w25, w27, #0x1 (1)
0x2a4569248c4   264  52a9f010       movz w16, #0x4f800000
0x2a4569248c8   268  1e270202       fmov s2, w16
0x2a4569248cc   26c  1e222020       fcmp s1, s2
0x2a4569248d0   270  1a983339       csel w25, w25, w24, lo
0x2a4569248d4   274  2a1603fb       mov w27, w22
0x2a4569248d8   278  bc7b68c1       ldr s1, [x6, x27]
0x2a4569248dc   27c  1e200821       fmul s1, s1, s0
0x2a4569248e0   280  1e212020       fcmp s1, s1
0x2a4569248e4   284  1e211de1       fcsel s1, s15, s1, ne
0x2a4569248e8   288  1e202028       fcmp s1, #0.0
0x2a4569248ec   28c  1e2fcc21       fcsel s1, s1, s15, gt
0x2a4569248f0   290  1e254021       frintm s1, s1
0x2a4569248f4   294  1e22c023       fcvt d3, s1
0x2a4569248f8   298  1e65c064       frintz d4, d3
0x2a4569248fc   29c  1e79009b       fcvtzu w27, d4
0x2a456924900   2a0  1e630365       ucvtf d5, w27
0x2a456924904   2a4  1e652080       fcmp d4, d5
0x2a456924908   2a8  54002e81       b.ne #+0x5d0 (addr 0x2a456924ed8)
0x2a45692490c   2ac  6b1b015f       cmp w10, w27
0x2a456924910   2b0  1a9b315c       csel w28, w10, w27, lo
0x2a456924914   2b4  1e222020       fcmp s1, s2
0x2a456924918   2b8  1a9f339b       csel w27, w28, wzr, lo
0x2a45692491c   2bc  1b0f6779       madd w25, w27, w15, w25
0x2a456924920   2c0  6b19017f       cmp w11, w25
0x2a456924924   2c4  540000a9       b.ls #+0x14 (addr 0x2a456924938)
0x2a456924928   2c8  0b190a99       add w25, w20, w25, lsl #2
0x2a45692492c   2cc  b87968db       ldr w27, [x6, x25]
0x2a456924930   2d0  1100077b       add w27, w27, #0x1 (1)
0x2a456924934   2d4  b83968db       str w27, [x6, x25]
0x2a456924938   2d8  110012f7       add w23, w23, #0x4 (4)
0x2a45692493c   2dc  110012d6       add w22, w22, #0x4 (4)
0x2a456924940   2e0  510006b5       sub w21, w21, #0x1 (1)
0x2a456924944   2e4  35fff995       cbnz w21, #-0xd0 (addr 0x2a456924874)
0x2a456924948   2e8  f90007f4       str x20, [sp, #8]
0x2a45692494c   2ec  3500006b       cbnz w11, #+0xc (addr 0x2a456924958)
0x2a456924950   2f0  aa0e03ea       mov x10, x14
0x2a456924954   2f4  1400008f       b #+0x23c (addr 0x2a456924b90)
0x2a456924958   2f8  531e7565       lsl w5, w11, #2
0x2a45692495c   2fc  510010aa       sub w10, w5, #0x4 (4)
0x2a456924960   300  53027d4f       lsr w15, w10, #2
0x2a456924964   304  110005ef       add w15, w15, #0x1 (1)
0x2a456924968   308  120009f3       and w19, w15, #0x7
0x2a45692496c   30c  f90033e5       str x5, [sp, #96]
0x2a456924970   310  7100715f       cmp w10, #0x1c (28)
0x2a456924974   314  54000563       b.lo #+0xac (addr 0x2a456924a20)
0x2a456924978   318  121d6dea       and w10, w15, #0x7ffffff8
0x2a45692497c   31c  aa1403ef       mov x15, x20
0x2a456924980   320  aa0e03f5       mov x21, x14
0x2a456924984   324  f8520356       ldur x22, [x26, #-224]
0x2a456924988   328  eb3663ff       cmp sp, x22
0x2a45692498c   32c  54002b69       b.ls #+0x56c (addr 0x2a456924ef8)
0x2a456924990   330  b86f68d6       ldr w22, [x6, x15]
0x2a456924994   334  0b1502d5       add w21, w22, w21
0x2a456924998   338  b82f68d5       str w21, [x6, x15]
0x2a45692499c   33c  110011f6       add w22, w15, #0x4 (4)
0x2a4569249a0   340  b87668d7       ldr w23, [x6, x22]
0x2a4569249a4   344  0b1502f5       add w21, w23, w21
0x2a4569249a8   348  b83668d5       str w21, [x6, x22]
0x2a4569249ac   34c  110021f6       add w22, w15, #0x8 (8)
0x2a4569249b0   350  b87668d7       ldr w23, [x6, x22]
0x2a4569249b4   354  0b1502f5       add w21, w23, w21
0x2a4569249b8   358  b83668d5       str w21, [x6, x22]
0x2a4569249bc   35c  110031f6       add w22, w15, #0xc (12)
0x2a4569249c0   360  b87668d7       ldr w23, [x6, x22]
0x2a4569249c4   364  0b1502f5       add w21, w23, w21
0x2a4569249c8   368  b83668d5       str w21, [x6, x22]
0x2a4569249cc   36c  110041f6       add w22, w15, #0x10 (16)
0x2a4569249d0   370  b87668d7       ldr w23, [x6, x22]
0x2a4569249d4   374  0b1502f5       add w21, w23, w21
0x2a4569249d8   378  b83668d5       str w21, [x6, x22]
0x2a4569249dc   37c  110051f6       add w22, w15, #0x14 (20)
0x2a4569249e0   380  b87668d7       ldr w23, [x6, x22]
0x2a4569249e4   384  0b1502f5       add w21, w23, w21
0x2a4569249e8   388  b83668d5       str w21, [x6, x22]
0x2a4569249ec   38c  110061f6       add w22, w15, #0x18 (24)
0x2a4569249f0   390  b87668d7       ldr w23, [x6, x22]
0x2a4569249f4   394  0b1502f5       add w21, w23, w21
0x2a4569249f8   398  b83668d5       str w21, [x6, x22]
0x2a4569249fc   39c  110071f6       add w22, w15, #0x1c (28)
0x2a456924a00   3a0  b87668d7       ldr w23, [x6, x22]
0x2a456924a04   3a4  0b1502f5       add w21, w23, w21
0x2a456924a08   3a8  b83668d5       str w21, [x6, x22]
0x2a456924a0c   3ac  110081ef       add w15, w15, #0x20 (32)
0x2a456924a10   3b0  5100214a       sub w10, w10, #0x8 (8)
0x2a456924a14   3b4  35fffb8a       cbnz w10, #-0x90 (addr 0x2a456924984)
0x2a456924a18   3b8  35000093       cbnz w19, #+0x10 (addr 0x2a456924a28)
0x2a456924a1c   3bc  1400001f       b #+0x7c (addr 0x2a456924a98)
0x2a456924a20   3c0  aa0e03f5       mov x21, x14
0x2a456924a24   3c4  aa1403ef       mov x15, x20
0x2a456924a28   3c8  531e766a       lsl w10, w19, #2
0x2a456924a2c   3cc  b86f68d3       ldr w19, [x6, x15]
0x2a456924a30   3d0  0b150273       add w19, w19, w21
0x2a456924a34   3d4  b82f68d3       str w19, [x6, x15]
0x2a456924a38   3d8  110011ef       add w15, w15, #0x4 (4)
0x2a456924a3c   3dc  5100114a       sub w10, w10, #0x4 (4)
0x2a456924a40   3e0  340002ca       cbz w10, #+0x58 (addr 0x2a456924a98)
0x2a456924a44   3e4  b86f68d5       ldr w21, [x6, x15]
0x2a456924a48   3e8  0b1302b3       add w19, w21, w19
0x2a456924a4c   3ec  b82f68d3       str w19, [x6, x15]
0x2a456924a50   3f0  110011ef       add w15, w15, #0x4 (4)
0x2a456924a54   3f4  5100114a       sub w10, w10, #0x4 (4)
0x2a456924a58   3f8  3400020a       cbz w10, #+0x40 (addr 0x2a456924a98)
0x2a456924a5c   3fc  b86f68d5       ldr w21, [x6, x15]
0x2a456924a60   400  0b1302b3       add w19, w21, w19
0x2a456924a64   404  b82f68d3       str w19, [x6, x15]
0x2a456924a68   408  110011ef       add w15, w15, #0x4 (4)
0x2a456924a6c   40c  5100114a       sub w10, w10, #0x4 (4)
0x2a456924a70   410  3400014a       cbz w10, #+0x28 (addr 0x2a456924a98)
0x2a456924a74   414  f8520355       ldur x21, [x26, #-224]
0x2a456924a78   418  eb3563ff       cmp sp, x21
0x2a456924a7c   41c  540026e9       b.ls #+0x4dc (addr 0x2a456924f58)
0x2a456924a80   420  b86f68d5       ldr w21, [x6, x15]
0x2a456924a84   424  0b1302b5       add w21, w21, w19
0x2a456924a88   428  b82f68d5       str w21, [x6, x15]
0x2a456924a8c   42c  110011ef       add w15, w15, #0x4 (4)
0x2a456924a90   430  5100114a       sub w10, w10, #0x4 (4)
0x2a456924a94   434  35fffcca       cbnz w10, #-0x68 (addr 0x2a456924a2c)
0x2a456924a98   438  9100510a       add x10, x8, #0x14 (20)
0x2a456924a9c   43c  b82a68df       str wzr, [x6, x10]
0x2a456924aa0   440  9100310f       add x15, x8, #0xc (12)
0x2a456924aa4   444  b86f68cf       ldr w15, [x6, x15]
0x2a456924aa8   448  f9003bea       str x10, [sp, #112]
0x2a456924aac   44c  6b0f017f       cmp w11, w15
0x2a456924ab0   450  54000309       b.ls #+0x60 (addr 0x2a456924b10)
0x2a456924ab4   454  aa0003ef       mov x15, x0
0x2a456924ab8   458  110031e0       add w0, w15, #0xc (12)
0x2a456924abc   45c  aa0b03e3       mov x3, x11
0x2a456924ac0   460  aa0e03e2       mov x2, x14
0x2a456924ac4   464  97fc02ef       bl #-0xff444 (addr 0x2a456825680)
0x2a456924ac8   468  f9403fe6       ldr x6, [sp, #120]
0x2a456924acc   46c  f9403be8       ldr x8, [sp, #112]
0x2a456924ad0   470  b86868c8       ldr w8, [x6, x8]
0x2a456924ad4   474  aa0803ea       mov x10, x8
0x2a456924ad8   478  f94047ed       ldr x13, [sp, #136]
0x2a456924adc   47c  d280000e       movz x14, #0x0
0x2a456924ae0   480  f9401be4       ldr x4, [sp, #48]
0x2a456924ae4   484  f94017e2       ldr x2, [sp, #40]
0x2a456924ae8   488  f94043e8       ldr x8, [sp, #128]
0x2a456924aec   48c  f9400fec       ldr x12, [sp, #24]
0x2a456924af0   490  f9400be9       ldr x9, [sp, #16]
0x2a456924af4   494  f9401fe3       ldr x3, [sp, #56]
0x2a456924af8   498  f9404be7       ldr x7, [sp, #144]
0x2a456924afc   49c  f94013e0       ldr x0, [sp, #32]
0x2a456924b00   4a0  f94037eb       ldr x11, [sp, #104]
0x2a456924b04   4a4  f94033e5       ldr x5, [sp, #96]
0x2a456924b08   4a8  f94007f4       ldr x20, [sp, #8]
0x2a456924b0c   4ac  14000002       b #+0x8 (addr 0x2a456924b14)
0x2a456924b10   4b0  aa0e03ea       mov x10, x14
0x2a456924b14   4b4  531e756f       lsl w15, w11, #2
0x2a456924b18   4b8  f9003bea       str x10, [sp, #112]
0x2a456924b1c   4bc  340003af       cbz w15, #+0x74 (addr 0x2a456924b90)
0x2a456924b20   4c0  9100410f       add x15, x8, #0x10 (16)
0x2a456924b24   4c4  b86f68cf       ldr w15, [x6, x15]
0x2a456924b28   4c8  0b0a09ef       add w15, w15, w10, lsl #2
0x2a456924b2c   4cc  aa0703e0       mov x0, x7
0x2a456924b30   4d0  aa0e03e1       mov x1, x14
0x2a456924b34   4d4  aa0e03e2       mov x2, x14
0x2a456924b38   4d8  aa0f03e3       mov x3, x15
0x2a456924b3c   4dc  aa1403e4       mov x4, x20
0x2a456924b40   4e0  580029d0       ldr x16, pc+1336 (addr 0x000002a456925078)
0x2a456924b44   4e4  10000068       adr x8, #+0xc (addr 0x2a456924b50)
0x2a456924b48   4e8  a9027748       stp x8, fp, [x26, #32]
0x2a456924b4c   4ec  d63f0200       blr x16
0x2a456924b50   4f0  f900175f       str xzr, [x26, #40]
0x2a456924b54   4f4  6a00001f       tst w0, w0
0x2a456924b58   4f8  54002840       b.eq #+0x508 (addr 0x2a456925060)
0x2a456924b5c   4fc  f9403bea       ldr x10, [sp, #112]
0x2a456924b60   500  f94047ed       ldr x13, [sp, #136]
0x2a456924b64   504  f9403fe6       ldr x6, [sp, #120]
0x2a456924b68   508  d280000e       movz x14, #0x0
0x2a456924b6c   50c  f9401be4       ldr x4, [sp, #48]
0x2a456924b70   510  f94017e2       ldr x2, [sp, #40]
0x2a456924b74   514  f94043e8       ldr x8, [sp, #128]
0x2a456924b78   518  f9400fec       ldr x12, [sp, #24]
0x2a456924b7c   51c  f9400be9       ldr x9, [sp, #16]
0x2a456924b80   520  f9401fe3       ldr x3, [sp, #56]
0x2a456924b84   524  f9404be7       ldr x7, [sp, #144]
0x2a456924b88   528  f94013e0       ldr x0, [sp, #32]
0x2a456924b8c   52c  f94037eb       ldr x11, [sp, #104]
0x2a456924b90   530  9100810f       add x15, x8, #0x20 (32)
0x2a456924b94   534  b82f68df       str wzr, [x6, x15]
0x2a456924b98   538  0b0b014a       add w10, w10, w11
0x2a456924b9c   53c  9100510b       add x11, x8, #0x14 (20)
0x2a456924ba0   540  b82b68ca       str w10, [x6, x11]
0x2a456924ba4   544  f9003bef       str x15, [sp, #112]
0x2a456924ba8   548  f9002feb       str x11, [sp, #88]
0x2a456924bac   54c  35000063       cbnz w3, #+0xc (addr 0x2a456924bb8)
0x2a456924bb0   550  aa0e03ea       mov x10, x14
0x2a456924bb4   554  14000048       b #+0x120 (addr 0x2a456924cd4)
0x2a456924bb8   558  9100610a       add x10, x8, #0x18 (24)
0x2a456924bbc   55c  b86a68ca       ldr w10, [x6, x10]
0x2a456924bc0   560  6b0a007f       cmp w3, w10
0x2a456924bc4   564  540002a9       b.ls #+0x54 (addr 0x2a456924c18)
0x2a456924bc8   568  aa0003ea       mov x10, x0
0x2a456924bcc   56c  11006140       add w0, w10, #0x18 (24)
0x2a456924bd0   570  aa0e03e2       mov x2, x14
0x2a456924bd4   574  97fc02ab       bl #-0xff554 (addr 0x2a456825680)
0x2a456924bd8   578  f9403fe6       ldr x6, [sp, #120]
0x2a456924bdc   57c  f9403be8       ldr x8, [sp, #112]
0x2a456924be0   580  b86868c9       ldr w9, [x6, x8]
0x2a456924be4   584  aa0903ea       mov x10, x9
0x2a456924be8   588  f94047ed       ldr x13, [sp, #136]
0x2a456924bec   58c  d280000e       movz x14, #0x0
0x2a456924bf0   590  f9401be4       ldr x4, [sp, #48]
0x2a456924bf4   594  f94017e2       ldr x2, [sp, #40]
0x2a456924bf8   598  aa0803ef       mov x15, x8
0x2a456924bfc   59c  f94043e8       ldr x8, [sp, #128]
0x2a456924c00   5a0  f9402feb       ldr x11, [sp, #88]
0x2a456924c04   5a4  f9400fec       ldr x12, [sp, #24]
0x2a456924c08   5a8  f9400be9       ldr x9, [sp, #16]
0x2a456924c0c   5ac  f9401fe3       ldr x3, [sp, #56]
0x2a456924c10   5b0  f9404be7       ldr x7, [sp, #144]
0x2a456924c14   5b4  14000002       b #+0x8 (addr 0x2a456924c1c)
0x2a456924c18   5b8  aa0e03ea       mov x10, x14
0x2a456924c1c   5bc  91007113       add x19, x8, #0x1c (28)
0x2a456924c20   5c0  b87368d3       ldr w19, [x6, x19]
0x2a456924c24   5c4  0b0a0a74       add w20, w19, w10, lsl #2
0x2a456924c28   5c8  f90037ea       str x10, [sp, #104]
0x2a456924c2c   5cc  f90033f3       str x19, [sp, #96]
0x2a456924c30   5d0  aa0303f5       mov x21, x3
0x2a456924c34   5d4  710006bf       cmp w21, #0x1 (1)
0x2a456924c38   5d8  540004a0       b.eq #+0x94 (addr 0x2a456924ccc)
0x2a456924c3c   5dc  531e76b6       lsl w22, w21, #2
0x2a456924c40   5e0  510012d6       sub w22, w22, #0x4 (4)
0x2a456924c44   5e4  34000356       cbz w22, #+0x68 (addr 0x2a456924cac)
0x2a456924c48   5e8  aa0703e0       mov x0, x7
0x2a456924c4c   5ec  aa0e03e1       mov x1, x14
0x2a456924c50   5f0  aa1403e2       mov x2, x20
0x2a456924c54   5f4  aa0e03e3       mov x3, x14
0x2a456924c58   5f8  aa1603e4       mov x4, x22
0x2a456924c5c   5fc  58002130       ldr x16, pc+1060 (addr 0x000002a456925080)    ;; external reference (wasm::memory_fill)
0x2a456924c60   600  10000068       adr x8, #+0xc (addr 0x2a456924c6c)
0x2a456924c64   604  a9027748       stp x8, fp, [x26, #32]
0x2a456924c68   608  d63f0200       blr x16
0x2a456924c6c   60c  f900175f       str xzr, [x26, #40]
0x2a456924c70   610  6a00001f       tst w0, w0
0x2a456924c74   614  54001f40       b.eq #+0x3e8 (addr 0x2a45692505c)
0x2a456924c78   618  f94047ed       ldr x13, [sp, #136]
0x2a456924c7c   61c  f9403fe6       ldr x6, [sp, #120]
0x2a456924c80   620  d280000e       movz x14, #0x0
0x2a456924c84   624  f9401be4       ldr x4, [sp, #48]
0x2a456924c88   628  f94017e2       ldr x2, [sp, #40]
0x2a456924c8c   62c  f94043e8       ldr x8, [sp, #128]
0x2a456924c90   630  f9402feb       ldr x11, [sp, #88]
0x2a456924c94   634  f9400fec       ldr x12, [sp, #24]
0x2a456924c98   638  f9400be9       ldr x9, [sp, #16]
0x2a456924c9c   63c  f9403bef       ldr x15, [sp, #112]
0x2a456924ca0   640  f94037ea       ldr x10, [sp, #104]
0x2a456924ca4   644  f94033f3       ldr x19, [sp, #96]
0x2a456924ca8   648  f9401ff5       ldr x21, [sp, #56]
0x2a456924cac   64c  aa1503f4       mov x20, x21
0x2a456924cb0   650  0b14014a       add w10, w10, w20
0x2a456924cb4   654  51000554       sub w20, w10, #0x1 (1)
0x2a456924cb8   658  0b0a0a6a       add w10, w19, w10, lsl #2
0x2a456924cbc   65c  5100114a       sub w10, w10, #0x4 (4)
0x2a456924cc0   660  aa0a03f0       mov x16, x10
0x2a456924cc4   664  aa1403ea       mov x10, x20
0x2a456924cc8   668  aa1003f4       mov x20, x16
0x2a456924ccc   66c  b83468df       str wzr, [x6, x20]
0x2a456924cd0   670  1100054a       add w10, w10, #0x1 (1)
0x2a456924cd4   674  b82f68ca       str w10, [x6, x15]
0x2a456924cd8   678  3500008d       cbnz w13, #+0x10 (addr 0x2a456924ce8)
0x2a456924cdc   67c  910003bf       mov sp, fp
0x2a456924ce0   680  a8c17bfd       ldp fp, lr, [sp], #16
0x2a456924ce4   684  d65f03c0       ret
0x2a456924ce8   688  b86968c9       ldr w9, [x6, x9]
0x2a456924cec   68c  7100013f       cmp w9, #0x0 (0)
0x2a456924cf0   690  9a9f07ef       cset x15, ne
0x2a456924cf4   694  4b0f0129       sub w9, w9, w15
0x2a456924cf8   698  b86c68cc       ldr w12, [x6, x12]
0x2a456924cfc   69c  7100019f       cmp w12, #0x0 (0)
0x2a456924d00   6a0  9a9f07ef       cset x15, ne
0x2a456924d04   6a4  4b0f018f       sub w15, w12, w15
0x2a456924d08   6a8  91007113       add x19, x8, #0x1c (28)
0x2a456924d0c   6ac  b87368d3       ldr w19, [x6, x19]
0x2a456924d10   6b0  91004114       add x20, x8, #0x10 (16)
0x2a456924d14   6b4  b87468d4       ldr w20, [x6, x20]
0x2a456924d18   6b8  b86b68cb       ldr w11, [x6, x11]
0x2a456924d1c   6bc  91009108       add x8, x8, #0x24 (36)
0x2a456924d20   6c0  bc6868c0       ldr s0, [x6, x8]
0x2a456924d24   6c4  aa0e03e8       mov x8, x14
0x2a456924d28   6c8  f8520355       ldur x21, [x26, #-224]
0x2a456924d2c   6cc  eb3563ff       cmp sp, x21
0x2a456924d30   6d0  54001409       b.ls #+0x280 (addr 0x2a456924fb0)
0x2a456924d34   6d4  2a0403f5       mov w21, w4
0x2a456924d38   6d8  bc7568c1       ldr s1, [x6, x21]
0x2a456924d3c   6dc  1e200821       fmul s1, s1, s0
0x2a456924d40   6e0  1e212020       fcmp s1, s1
0x2a456924d44   6e4  1e211de1       fcsel s1, s15, s1, ne
0x2a456924d48   6e8  1e202028       fcmp s1, #0.0
0x2a456924d4c   6ec  1e2fcc21       fcsel s1, s1, s15, gt
0x2a456924d50   6f0  1e254021       frintm s1, s1
0x2a456924d54   6f4  1e22c022       fcvt d2, s1
0x2a456924d58   6f8  1e65c043       frintz d3, d2
0x2a456924d5c   6fc  1e790075       fcvtzu w21, d3
0x2a456924d60   700  1e6302a4       ucvtf d4, w21
0x2a456924d64   704  1e642060       fcmp d3, d4
0x2a456924d68   708  540015a1       b.ne #+0x2b4 (addr 0x2a45692501c)
0x2a456924d6c   70c  6b15013f       cmp w9, w21
0x2a456924d70   710  1a953136       csel w22, w9, w21, lo
0x2a456924d74   714  52a9f010       movz w16, #0x4f800000
0x2a456924d78   718  1e270202       fmov s2, w16
0x2a456924d7c   71c  1e222020       fcmp s1, s2
0x2a456924d80   720  1a9f32d5       csel w21, w22, wzr, lo
0x2a456924d84   724  1b0c7eb5       mul w21, w21, w12
0x2a456924d88   728  2a0203f6       mov w22, w2
0x2a456924d8c   72c  bc7668c1       ldr s1, [x6, x22]
0x2a456924d90   730  1e200821       fmul s1, s1, s0
0x2a456924d94   734  1e212020       fcmp s1, s1
0x2a456924d98   738  1e211de1       fcsel s1, s15, s1, ne
0x2a456924d9c   73c  1e202028       fcmp s1, #0.0
0x2a456924da0   740  1e2fcc21       fcsel s1, s1, s15, gt
0x2a456924da4   744  1e254021       frintm s1, s1
0x2a456924da8   748  1e22c023       fcvt d3, s1
0x2a456924dac   74c  1e65c064       frintz d4, d3
0x2a456924db0   750  1e790096       fcvtzu w22, d4
0x2a456924db4   754  1e6302c5       ucvtf d5, w22
0x2a456924db8   758  1e652080       fcmp d4, d5
0x2a456924dbc   75c  54001401       b.ne #+0x280 (addr 0x2a45692503c)
0x2a456924dc0   760  6b1601ff       cmp w15, w22
0x2a456924dc4   764  1a9631f7       csel w23, w15, w22, lo
0x2a456924dc8   768  1e222020       fcmp s1, s2
0x2a456924dcc   76c  1a9f32f6       csel w22, w23, wzr, lo
0x2a456924dd0   770  0b1602b5       add w21, w21, w22
0x2a456924dd4   774  6b15017f       cmp w11, w21
0x2a456924dd8   778  54000149       b.ls #+0x28 (addr 0x2a456924e00)
0x2a456924ddc   77c  0b150a95       add w21, w20, w21, lsl #2
0x2a456924de0   780  b87568d6       ldr w22, [x6, x21]
0x2a456924de4   784  6b16015f       cmp w10, w22
0x2a456924de8   788  54000089       b.ls #+0x10 (addr 0x2a456924df8)
0x2a456924dec   78c  0b160a76       add w22, w19, w22, lsl #2
0x2a456924df0   790  b83668c8       str w8, [x6, x22]
0x2a456924df4   794  b87568d6       ldr w22, [x6, x21]
0x2a456924df8   798  110006d6       add w22, w22, #0x1 (1)
0x2a456924dfc   79c  b83568d6       str w22, [x6, x21]
0x2a456924e00   7a0  11001042       add w2, w2, #0x4 (4)
0x2a456924e04   7a4  11001084       add w4, w4, #0x4 (4)
0x2a456924e08   7a8  11000508       add w8, w8, #0x1 (1)
0x2a456924e0c   7ac  6b0801bf       cmp w13, w8
0x2a456924e10   7b0  54fff660       b.eq #-0x134 (addr 0x2a456924cdc)
0x2a456924e14   7b4  17ffffc5       b #-0xec (addr 0x2a456924d28)
0x2a456924e18   7b8  97fc036e       bl #-0xff248 (addr 0x2a456825bd0)
0x2a456924e1c   7bc  f9403fe6       ldr x6, [sp, #120]
0x2a456924e20   7c0  f9401be4       ldr x4, [sp, #48]
0x2a456924e24   7c4  f94017e2       ldr x2, [sp, #40]
0x2a456924e28   7c8  f9401fe3       ldr x3, [sp, #56]
0x2a456924e2c   7cc  f9404be7       ldr x7, [sp, #144]
0x2a456924e30   7d0  f94013e0       ldr x0, [sp, #32]
0x2a456924e34   7d4  f94027e5       ldr x5, [sp, #72]
0x2a456924e38   7d8  17fffe19       b #-0x79c (addr 0x2a45692469c)
0x2a456924e3c   7dc  f90007f4       str x20, [sp, #8]
0x2a456924e40   7e0  f9003bf5       str x21, [sp, #112]
0x2a456924e44   7e4  f90023f6       str x22, [sp, #64]
0x2a456924e48   7e8  f90003f7       str x23, [sp]
0x2a456924e4c   7ec  f90033ef       str x15, [sp, #96]
0x2a456924e50   7f0  f9002fea       str x10, [sp, #88]
0x2a456924e54   7f4  fd002be0       str d0, [sp, #80]
0x2a456924e58   7f8  f90027f3       str x19, [sp, #72]
0x2a456924e5c   7fc  97fc035d       bl #-0xff28c (addr 0x2a456825bd0)
0x2a456924e60   800  f94047ed       ldr x13, [sp, #136]
0x2a456924e64   804  f9403fe6       ldr x6, [sp, #120]
0x2a456924e68   808  d280000e       movz x14, #0x0
0x2a456924e6c   80c  f9401be4       ldr x4, [sp, #48]
0x2a456924e70   810  f94017e2       ldr x2, [sp, #40]
0x2a456924e74   814  f94043e8       ldr x8, [sp, #128]
0x2a456924e78   818  f9400fec       ldr x12, [sp, #24]
0x2a456924e7c   81c  f9400be9       ldr x9, [sp, #16]
0x2a456924e80   820  f9401fe3       ldr x3, [sp, #56]
0x2a456924e84   824  f9404be7       ldr x7, [sp, #144]
0x2a456924e88   828  f94013e0       ldr x0, [sp, #32]
0x2a456924e8c   82c  f94037eb       ldr x11, [sp, #104]
0x2a456924e90   830  f94007f4       ldr x20, [sp, #8]
0x2a456924e94   834  f9403bf5       ldr x21, [sp, #112]
0x2a456924e98   838  f94023f6       ldr x22, [sp, #64]
0x2a456924e9c   83c  f94003f7       ldr x23, [sp]
0x2a456924ea0   840  f94033ef       ldr x15, [sp, #96]
0x2a456924ea4   844  f9402fea       ldr x10, [sp, #88]
0x2a456924ea8   848  fd402be0       ldr d0, [sp, #80]
0x2a456924eac   84c  d2800038       movz x24, #0x1
0x2a456924eb0   850  f94027f3       ldr x19, [sp, #72]
0x2a456924eb4   854  17fffe73       b #-0x634 (addr 0x2a456924880)
0x2a456924eb8   858  1e622040       fcmp d2, d2
0x2a456924ebc   85c  54000060       b.eq #+0xc (addr 0x2a456924ec8)
0x2a456924ec0   860  aa0e03f9       mov x25, x14
0x2a456924ec4   864  17fffe7d       b #-0x60c (addr 0x2a4569248b8)
0x2a456924ec8   868  1e202028       fcmp s1, #0.0
0x2a456924ecc   86c  54ffffa3       b.lo #-0xc (addr 0x2a456924ec0)
0x2a456924ed0   870  92800019       movn x25, #0x0
0x2a456924ed4   874  17fffe79       b #-0x61c (addr 0x2a4569248b8)
0x2a456924ed8   878  1e632060       fcmp d3, d3
0x2a456924edc   87c  54000060       b.eq #+0xc (addr 0x2a456924ee8)
0x2a456924ee0   880  aa0e03fb       mov cp, x14
0x2a456924ee4   884  17fffe8a       b #-0x5d8 (addr 0x2a45692490c)
0x2a456924ee8   888  1e202028       fcmp s1, #0.0
0x2a456924eec   88c  54ffffa3       b.lo #-0xc (addr 0x2a456924ee0)
0x2a456924ef0   890  9280001b       movn cp, #0x0
0x2a456924ef4   894  17fffe86       b #-0x5e8 (addr 0x2a45692490c)
0x2a456924ef8   898  f9003bf3       str x19, [sp, #112]
0x2a456924efc   89c  f9002bea       str x10, [sp, #80]
0x2a456924f00   8a0  f90027ef       str x15, [sp, #72]
0x2a456924f04   8a4  f9002ff5       str x21, [sp, #88]
0x2a456924f08   8a8  97fc0332       bl #-0xff338 (addr 0x2a456825bd0)
0x2a456924f0c   8ac  f94047ed       ldr x13, [sp, #136]
0x2a456924f10   8b0  f9403fe6       ldr x6, [sp, #120]
0x2a456924f14   8b4  d280000e       movz x14, #0x0
0x2a456924f18   8b8  f9401be4       ldr x4, [sp, #48]
0x2a456924f1c   8bc  f94017e2       ldr x2, [sp, #40]
0x2a456924f20   8c0  f94043e8       ldr x8, [sp, #128]
0x2a456924f24   8c4  f9400fec       ldr x12, [sp, #24]
0x2a456924f28   8c8  f9400be9       ldr x9, [sp, #16]
0x2a456924f2c   8cc  f9401fe3       ldr x3, [sp, #56]
0x2a456924f30   8d0  f9404be7       ldr x7, [sp, #144]
0x2a456924f34   8d4  f94013e0       ldr x0, [sp, #32]
0x2a456924f38   8d8  f94037eb       ldr x11, [sp, #104]
0x2a456924f3c   8dc  f94033e5       ldr x5, [sp, #96]
0x2a456924f40   8e0  f94007f4       ldr x20, [sp, #8]
0x2a456924f44   8e4  f9403bf3       ldr x19, [sp, #112]
0x2a456924f48   8e8  f9402bea       ldr x10, [sp, #80]
0x2a456924f4c   8ec  f94027ef       ldr x15, [sp, #72]
0x2a456924f50   8f0  f9402ff5       ldr x21, [sp, #88]
0x2a456924f54   8f4  17fffe8f       b #-0x5c4 (addr 0x2a456924990)
0x2a456924f58   8f8  f9003bea       str x10, [sp, #112]
0x2a456924f5c   8fc  f90023ef       str x15, [sp, #64]
0x2a456924f60   900  f9002bf3       str x19, [sp, #80]
0x2a456924f64   904  97fc031b       bl #-0xff394 (addr 0x2a456825bd0)
0x2a456924f68   908  f94047ed       ldr x13, [sp, #136]
0x2a456924f6c   90c  f9403fe6       ldr x6, [sp, #120]
0x2a456924f70   910  d280000e       movz x14, #0x0
0x2a456924f74   914  f9401be4       ldr x4, [sp, #48]
0x2a456924f78   918  f94017e2       ldr x2, [sp, #40]
0x2a456924f7c   91c  f94043e8       ldr x8, [sp, #128]
0x2a456924f80   920  f9400fec       ldr x12, [sp, #24]
0x2a456924f84   924  f9400be9       ldr x9, [sp, #16]
0x2a456924f88   928  f9401fe3       ldr x3, [sp, #56]
0x2a456924f8c   92c  f9404be7       ldr x7, [sp, #144]
0x2a456924f90   930  f94013e0       ldr x0, [sp, #32]
0x2a456924f94   934  f94037eb       ldr x11, [sp, #104]
0x2a456924f98   938  f94033e5       ldr x5, [sp, #96]
0x2a456924f9c   93c  f94007f4       ldr x20, [sp, #8]
0x2a456924fa0   940  f9403bea       ldr x10, [sp, #112]
0x2a456924fa4   944  f94023ef       ldr x15, [sp, #64]
0x2a456924fa8   948  f9402bf3       ldr x19, [sp, #80]
0x2a456924fac   94c  17fffeb5       b #-0x52c (addr 0x2a456924a80)
0x2a456924fb0   950  f90043e8       str x8, [sp, #128]
0x2a456924fb4   954  f9001be4       str x4, [sp, #48]
0x2a456924fb8   958  f90017e2       str x2, [sp, #40]
0x2a456924fbc   95c  f9003bf3       str x19, [sp, #112]
0x2a456924fc0   960  f90037ea       str x10, [sp, #104]
0x2a456924fc4   964  f90033f4       str x20, [sp, #96]
0x2a456924fc8   968  f9002feb       str x11, [sp, #88]
0x2a456924fcc   96c  f9002bef       str x15, [sp, #80]
0x2a456924fd0   970  fd0027e0       str d0, [sp, #72]
0x2a456924fd4   974  f90023ec       str x12, [sp, #64]
0x2a456924fd8   978  f9001fe9       str x9, [sp, #56]
0x2a456924fdc   97c  97fc02fd       bl #-0xff40c (addr 0x2a456825bd0)
0x2a456924fe0   980  f94047ed       ldr x13, [sp, #136]
0x2a456924fe4   984  f94043e8       ldr x8, [sp, #128]
0x2a456924fe8   988  f9401be4       ldr x4, [sp, #48]
0x2a456924fec   98c  f94017e2       ldr x2, [sp, #40]
0x2a456924ff0   990  f9403fe6       ldr x6, [sp, #120]
0x2a456924ff4   994  f9403bf3       ldr x19, [sp, #112]
0x2a456924ff8   998  f94037ea       ldr x10, [sp, #104]
0x2a456924ffc   99c  f94033f4       ldr x20, [sp, #96]
0x2a456925000   9a0  f9402feb       ldr x11, [sp, #88]
0x2a456925004   9a4  f9402bef       ldr x15, [sp, #80]
0x2a456925008   9a8  d280000e       movz x14, #0x0
0x2a45692500c   9ac  fd4027e0       ldr d0, [sp, #72]
0x2a456925010   9b0  f94023ec       ldr x12, [sp, #64]
0x2a456925014   9b4  f9401fe9       ldr x9, [sp, #56]
0x2a456925018   9b8  17ffff47       b #-0x2e4 (addr 0x2a456924d34)
0x2a45692501c   9bc  1e622040       fcmp d2, d2
0x2a456925020   9c0  54000060       b.eq #+0xc (addr 0x2a45692502c)
0x2a456925024   9c4  aa0e03f5       mov x21, x14
0x2a456925028   9c8  17ffff51       b #-0x2bc (addr 0x2a456924d6c)
0x2a45692502c   9cc  1e202028       fcmp s1, #0.0
0x2a456925030   9d0  54ffffa3       b.lo #-0xc (addr 0x2a456925024)
0x2a456925034   9d4  92800015       movn x21, #0x0
0x2a456925038   9d8  17ffff4d       b #-0x2cc (addr 0x2a456924d6c)
0x2a45692503c   9dc  1e632060       fcmp d3, d3
0x2a456925040   9e0  54000060       b.eq #+0xc (addr 0x2a45692504c)
0x2a456925044   9e4  aa0e03f6       mov x22, x14
0x2a456925048   9e8  17ffff5e       b #-0x288 (addr 0x2a456924dc0)
0x2a45692504c   9ec  1e202028       fcmp s1, #0.0
0x2a456925050   9f0  54ffffa3       b.lo #-0xc (addr 0x2a456925044)
0x2a456925054   9f4  92800016       movn x22, #0x0
0x2a456925058   9f8  17ffff5a       b #-0x298 (addr 0x2a456924dc0)
0x2a45692505c   9fc  97fc022d       bl #-0xff74c (addr 0x2a456825910)
0x2a456925060   a00  97fc022c       bl #-0xff750 (addr 0x2a456825910)
0x2a456925064   a04  97fc022b       bl #-0xff754 (addr 0x2a456825910)
0x2a456925068   a08  d503201f       nop
0x2a45692506c   a0c  580000df       constant pool begin (num_const = 6)
0x2a456925070   a10  d63f03e0       constant
0x2a456925074   a14  d503201f       constant
0x2a456925078   a18  057baa68       constant
0x2a45692507c   a1c  00000001       constant
0x2a456925080   a20  057baaf4       constant
0x2a456925084   a24  00000001       constant

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
0x2a4569246fc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x2a4569246f8  internal wasm call
0x2a45692477c  external reference (0x1057baaf4)
0x2a456924ac4  internal wasm call
0x2a456924b40  external reference (0x1057baa68)
0x2a456924bd4  internal wasm call
0x2a456924e18  wasm stub call  (0x2a456825bd0)
0x2a456924e5c  wasm stub call  (0x2a456825bd0)
0x2a456924f08  wasm stub call  (0x2a456825bd0)
0x2a456924f64  wasm stub call  (0x2a456825bd0)
0x2a456924fdc  wasm stub call  (0x2a456825bd0)
0x2a45692505c  wasm stub call  (0x2a456825910)
0x2a456925060  wasm stub call  (0x2a456825910)
0x2a456925064  wasm stub call  (0x2a456825910)
0x2a45692506c  constant pool (size 28)
