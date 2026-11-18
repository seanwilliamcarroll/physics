name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2616 + 8 padding)
Instructions (size = 2600)
0x2d15098c26a0     0  d2800110       movz x16, #0x8
0x2d15098c26a4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x2d15098c26a8     8  a9017bfd       stp fp, lr, [sp, #16]
0x2d15098c26ac     c  910043fd       add fp, sp, #0x10 (16)
0x2d15098c26b0    10  d10243ff       sub sp, sp, #0x90 (144)
0x2d15098c26b4    14  f841f0e6       ldur x6, [x7, #31]
0x2d15098c26b8    18  f8520348       ldur x8, [x26, #-224]
0x2d15098c26bc    1c  f90013e0       str x0, [sp, #32]
0x2d15098c26c0    20  f90017e2       str x2, [sp, #40]
0x2d15098c26c4    24  f9001fe3       str x3, [sp, #56]
0x2d15098c26c8    28  f9001be4       str x4, [sp, #48]
0x2d15098c26cc    2c  f90027e5       str x5, [sp, #72]
0x2d15098c26d0    30  f9003fe6       str x6, [sp, #120]
0x2d15098c26d4    34  eb2863ff       cmp sp, x8
0x2d15098c26d8    38  54003c09       b.ls #+0x780 (addr 0x2d15098c2e58)
0x2d15098c26dc    3c  2a0003e8       mov w8, w0
0x2d15098c26e0    40  91002109       add x9, x8, #0x8 (8)
0x2d15098c26e4    44  b82968df       str wzr, [x6, x9]
0x2d15098c26e8    48  9100b10a       add x10, x8, #0x2c (44)
0x2d15098c26ec    4c  b86a68cb       ldr w11, [x6, x10]
0x2d15098c26f0    50  9100a10c       add x12, x8, #0x28 (40)
0x2d15098c26f4    54  b86c68cd       ldr w13, [x6, x12]
0x2d15098c26f8    58  1b0d7d6b       mul w11, w11, w13
0x2d15098c26fc    5c  1100056d       add w13, w11, #0x1 (1)
0x2d15098c2700    60  f90043e8       str x8, [sp, #128]
0x2d15098c2704    64  f90047e9       str x9, [sp, #136]
0x2d15098c2708    68  f9000bea       str x10, [sp, #16]
0x2d15098c270c    6c  f9000fec       str x12, [sp, #24]
0x2d15098c2710    70  f9002feb       str x11, [sp, #88]
0x2d15098c2714    74  f9003bed       str x13, [sp, #112]
0x2d15098c2718    78  3500006d       cbnz w13, #+0xc (addr 0x2d15098c2724)
0x2d15098c271c    7c  d280000b       movz x11, #0x0
0x2d15098c2720    80  14000047       b #+0x11c (addr 0x2d15098c283c)
0x2d15098c2724    84  b86868ce       ldr w14, [x6, x8]
0x2d15098c2728    88  6b0e01bf       cmp w13, w14
0x2d15098c272c    8c  540002a9       b.ls #+0x54 (addr 0x2d15098c2780)
0x2d15098c2730    90  aa0d03e3       mov x3, x13
0x2d15098c2734    94  d2800002       movz x2, #0x0
0x2d15098c2738    98  97fc0bd2       bl #-0xfd0b8 (addr 0x2d15097c5680)
0x2d15098c273c    9c  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2740    a0  f94047e8       ldr x8, [sp, #136]
0x2d15098c2744    a4  b86868c9       ldr w9, [x6, x8]
0x2d15098c2748    a8  aa0903ee       mov x14, x9
0x2d15098c274c    ac  f9401be4       ldr x4, [sp, #48]
0x2d15098c2750    b0  f94017e2       ldr x2, [sp, #40]
0x2d15098c2754    b4  aa0803e9       mov x9, x8
0x2d15098c2758    b8  f94043e8       ldr x8, [sp, #128]
0x2d15098c275c    bc  f9400fec       ldr x12, [sp, #24]
0x2d15098c2760    c0  f9400bea       ldr x10, [sp, #16]
0x2d15098c2764    c4  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2768    c8  f9404be7       ldr x7, [sp, #144]
0x2d15098c276c    cc  f94013e0       ldr x0, [sp, #32]
0x2d15098c2770    d0  f94027e5       ldr x5, [sp, #72]
0x2d15098c2774    d4  f9403bed       ldr x13, [sp, #112]
0x2d15098c2778    d8  f9402feb       ldr x11, [sp, #88]
0x2d15098c277c    dc  14000002       b #+0x8 (addr 0x2d15098c2784)
0x2d15098c2780    e0  d280000e       movz x14, #0x0
0x2d15098c2784    e4  9100110f       add x15, x8, #0x4 (4)
0x2d15098c2788    e8  b86f68cf       ldr w15, [x6, x15]
0x2d15098c278c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x2d15098c2790    f0  f90033ee       str x14, [sp, #96]
0x2d15098c2794    f4  f90037ef       str x15, [sp, #104]
0x2d15098c2798    f8  340004eb       cbz w11, #+0x9c (addr 0x2d15098c2834)
0x2d15098c279c    fc  531e75b4       lsl w20, w13, #2
0x2d15098c27a0   100  51001294       sub w20, w20, #0x4 (4)
0x2d15098c27a4   104  34000394       cbz w20, #+0x70 (addr 0x2d15098c2814)
0x2d15098c27a8   108  aa0703e0       mov x0, x7
0x2d15098c27ac   10c  d2800001       movz x1, #0x0
0x2d15098c27b0   110  aa1303e2       mov x2, x19
0x2d15098c27b4   114  aa1403e4       mov x4, x20
0x2d15098c27b8   118  aa0103e3       mov x3, x1
0x2d15098c27bc   11c  58004830       ldr x16, pc+2308 (addr 0x00002d15098c30c0)
0x2d15098c27c0   120  10000068       adr x8, #+0xc (addr 0x2d15098c27cc)
0x2d15098c27c4   124  a9027748       stp x8, fp, [x26, #32]
0x2d15098c27c8   128  d63f0200       blr x16
0x2d15098c27cc   12c  f900175f       str xzr, [x26, #40]
0x2d15098c27d0   130  6a00001f       tst w0, w0
0x2d15098c27d4   134  54004680       b.eq #+0x8d0 (addr 0x2d15098c30a4)
0x2d15098c27d8   138  f9403fe6       ldr x6, [sp, #120]
0x2d15098c27dc   13c  f9401be4       ldr x4, [sp, #48]
0x2d15098c27e0   140  f94017e2       ldr x2, [sp, #40]
0x2d15098c27e4   144  f94043e8       ldr x8, [sp, #128]
0x2d15098c27e8   148  f9400fec       ldr x12, [sp, #24]
0x2d15098c27ec   14c  f9400bea       ldr x10, [sp, #16]
0x2d15098c27f0   150  f9401fe3       ldr x3, [sp, #56]
0x2d15098c27f4   154  f9404be7       ldr x7, [sp, #144]
0x2d15098c27f8   158  f94013e0       ldr x0, [sp, #32]
0x2d15098c27fc   15c  f94027e5       ldr x5, [sp, #72]
0x2d15098c2800   160  f94047e9       ldr x9, [sp, #136]
0x2d15098c2804   164  f94033ee       ldr x14, [sp, #96]
0x2d15098c2808   168  f94037ef       ldr x15, [sp, #104]
0x2d15098c280c   16c  f9403bed       ldr x13, [sp, #112]
0x2d15098c2810   170  f9402feb       ldr x11, [sp, #88]
0x2d15098c2814   174  aa0e03f0       mov x16, x14
0x2d15098c2818   178  aa0b03ee       mov x14, x11
0x2d15098c281c   17c  aa1003eb       mov x11, x16
0x2d15098c2820   180  0b0e016e       add w14, w11, w14
0x2d15098c2824   184  0b0d016b       add w11, w11, w13
0x2d15098c2828   188  aa0f03ed       mov x13, x15
0x2d15098c282c   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x2d15098c2830   190  51001173       sub w19, w11, #0x4 (4)
0x2d15098c2834   194  b83368df       str wzr, [x6, x19]
0x2d15098c2838   198  110005cb       add w11, w14, #0x1 (1)
0x2d15098c283c   19c  b82968cb       str w11, [x6, x9]
0x2d15098c2840   1a0  aa0503e9       mov x9, x5
0x2d15098c2844   1a4  6b03013f       cmp w9, w3
0x2d15098c2848   1a8  1a83312d       csel w13, w9, w3, lo
0x2d15098c284c   1ac  d280000e       movz x14, #0x0
0x2d15098c2850   1b0  f90037eb       str x11, [sp, #104]
0x2d15098c2854   1b4  f90047ed       str x13, [sp, #136]
0x2d15098c2858   1b8  350000cd       cbnz w13, #+0x18 (addr 0x2d15098c2870)
0x2d15098c285c   1bc  91001109       add x9, x8, #0x4 (4)
0x2d15098c2860   1c0  b86968c9       ldr w9, [x6, x9]
0x2d15098c2864   1c4  aa0903f4       mov x20, x9
0x2d15098c2868   1c8  aa0a03e9       mov x9, x10
0x2d15098c286c   1cc  14000047       b #+0x11c (addr 0x2d15098c2988)
0x2d15098c2870   1d0  aa0a03e9       mov x9, x10
0x2d15098c2874   1d4  b86968ca       ldr w10, [x6, x9]
0x2d15098c2878   1d8  7100015f       cmp w10, #0x0 (0)
0x2d15098c287c   1dc  9a9f07ef       cset x15, ne
0x2d15098c2880   1e0  4b0f014a       sub w10, w10, w15
0x2d15098c2884   1e4  b86c68cf       ldr w15, [x6, x12]
0x2d15098c2888   1e8  710001ff       cmp w15, #0x0 (0)
0x2d15098c288c   1ec  9a9f07f3       cset x19, ne
0x2d15098c2890   1f0  4b1301f3       sub w19, w15, w19
0x2d15098c2894   1f4  91001114       add x20, x8, #0x4 (4)
0x2d15098c2898   1f8  b87468d4       ldr w20, [x6, x20]
0x2d15098c289c   1fc  91009115       add x21, x8, #0x24 (36)
0x2d15098c28a0   200  bc7568c0       ldr s0, [x6, x21]
0x2d15098c28a4   204  aa0d03f5       mov x21, x13
0x2d15098c28a8   208  aa0403f6       mov x22, x4
0x2d15098c28ac   20c  aa0203f7       mov x23, x2
0x2d15098c28b0   210  d2800038       movz x24, #0x1
0x2d15098c28b4   214  f8520359       ldur x25, [x26, #-224]
0x2d15098c28b8   218  eb3963ff       cmp sp, x25
0x2d15098c28bc   21c  54002e09       b.ls #+0x5c0 (addr 0x2d15098c2e7c)
0x2d15098c28c0   220  2a1703f9       mov w25, w23
0x2d15098c28c4   224  bc7968c1       ldr s1, [x6, x25]
0x2d15098c28c8   228  1e200821       fmul s1, s1, s0
0x2d15098c28cc   22c  1e212020       fcmp s1, s1
0x2d15098c28d0   230  1e211de1       fcsel s1, s15, s1, ne
0x2d15098c28d4   234  1e202028       fcmp s1, #0.0
0x2d15098c28d8   238  1e2fcc21       fcsel s1, s1, s15, gt
0x2d15098c28dc   23c  1e254021       frintm s1, s1
0x2d15098c28e0   240  1e22c022       fcvt d2, s1
0x2d15098c28e4   244  1e65c043       frintz d3, d2
0x2d15098c28e8   248  1e790079       fcvtzu w25, d3
0x2d15098c28ec   24c  1e630324       ucvtf d4, w25
0x2d15098c28f0   250  1e642060       fcmp d3, d4
0x2d15098c28f4   254  54003021       b.ne #+0x604 (addr 0x2d15098c2ef8)
0x2d15098c28f8   258  6b19027f       cmp w19, w25
0x2d15098c28fc   25c  1a99327b       csel w27, w19, w25, lo
0x2d15098c2900   260  11000779       add w25, w27, #0x1 (1)
0x2d15098c2904   264  52a9f010       movz w16, #0x4f800000
0x2d15098c2908   268  1e270202       fmov s2, w16
0x2d15098c290c   26c  1e222020       fcmp s1, s2
0x2d15098c2910   270  1a983339       csel w25, w25, w24, lo
0x2d15098c2914   274  2a1603fb       mov w27, w22
0x2d15098c2918   278  bc7b68c1       ldr s1, [x6, x27]
0x2d15098c291c   27c  1e200821       fmul s1, s1, s0
0x2d15098c2920   280  1e212020       fcmp s1, s1
0x2d15098c2924   284  1e211de1       fcsel s1, s15, s1, ne
0x2d15098c2928   288  1e202028       fcmp s1, #0.0
0x2d15098c292c   28c  1e2fcc21       fcsel s1, s1, s15, gt
0x2d15098c2930   290  1e254021       frintm s1, s1
0x2d15098c2934   294  1e22c023       fcvt d3, s1
0x2d15098c2938   298  1e65c064       frintz d4, d3
0x2d15098c293c   29c  1e79009b       fcvtzu w27, d4
0x2d15098c2940   2a0  1e630365       ucvtf d5, w27
0x2d15098c2944   2a4  1e652080       fcmp d4, d5
0x2d15098c2948   2a8  54002e81       b.ne #+0x5d0 (addr 0x2d15098c2f18)
0x2d15098c294c   2ac  6b1b015f       cmp w10, w27
0x2d15098c2950   2b0  1a9b315c       csel w28, w10, w27, lo
0x2d15098c2954   2b4  1e222020       fcmp s1, s2
0x2d15098c2958   2b8  1a9f339b       csel w27, w28, wzr, lo
0x2d15098c295c   2bc  1b0f6779       madd w25, w27, w15, w25
0x2d15098c2960   2c0  6b19017f       cmp w11, w25
0x2d15098c2964   2c4  540000a9       b.ls #+0x14 (addr 0x2d15098c2978)
0x2d15098c2968   2c8  0b190a99       add w25, w20, w25, lsl #2
0x2d15098c296c   2cc  b87968db       ldr w27, [x6, x25]
0x2d15098c2970   2d0  1100077b       add w27, w27, #0x1 (1)
0x2d15098c2974   2d4  b83968db       str w27, [x6, x25]
0x2d15098c2978   2d8  110012f7       add w23, w23, #0x4 (4)
0x2d15098c297c   2dc  110012d6       add w22, w22, #0x4 (4)
0x2d15098c2980   2e0  510006b5       sub w21, w21, #0x1 (1)
0x2d15098c2984   2e4  35fff995       cbnz w21, #-0xd0 (addr 0x2d15098c28b4)
0x2d15098c2988   2e8  f90007f4       str x20, [sp, #8]
0x2d15098c298c   2ec  3500006b       cbnz w11, #+0xc (addr 0x2d15098c2998)
0x2d15098c2990   2f0  aa0e03ea       mov x10, x14
0x2d15098c2994   2f4  1400008f       b #+0x23c (addr 0x2d15098c2bd0)
0x2d15098c2998   2f8  531e7565       lsl w5, w11, #2
0x2d15098c299c   2fc  510010aa       sub w10, w5, #0x4 (4)
0x2d15098c29a0   300  53027d4f       lsr w15, w10, #2
0x2d15098c29a4   304  110005ef       add w15, w15, #0x1 (1)
0x2d15098c29a8   308  120009f3       and w19, w15, #0x7
0x2d15098c29ac   30c  f90033e5       str x5, [sp, #96]
0x2d15098c29b0   310  7100715f       cmp w10, #0x1c (28)
0x2d15098c29b4   314  54000563       b.lo #+0xac (addr 0x2d15098c2a60)
0x2d15098c29b8   318  121d6dea       and w10, w15, #0x7ffffff8
0x2d15098c29bc   31c  aa1403ef       mov x15, x20
0x2d15098c29c0   320  aa0e03f5       mov x21, x14
0x2d15098c29c4   324  f8520356       ldur x22, [x26, #-224]
0x2d15098c29c8   328  eb3663ff       cmp sp, x22
0x2d15098c29cc   32c  54002b69       b.ls #+0x56c (addr 0x2d15098c2f38)
0x2d15098c29d0   330  b86f68d6       ldr w22, [x6, x15]
0x2d15098c29d4   334  0b1502d5       add w21, w22, w21
0x2d15098c29d8   338  b82f68d5       str w21, [x6, x15]
0x2d15098c29dc   33c  110011f6       add w22, w15, #0x4 (4)
0x2d15098c29e0   340  b87668d7       ldr w23, [x6, x22]
0x2d15098c29e4   344  0b1502f5       add w21, w23, w21
0x2d15098c29e8   348  b83668d5       str w21, [x6, x22]
0x2d15098c29ec   34c  110021f6       add w22, w15, #0x8 (8)
0x2d15098c29f0   350  b87668d7       ldr w23, [x6, x22]
0x2d15098c29f4   354  0b1502f5       add w21, w23, w21
0x2d15098c29f8   358  b83668d5       str w21, [x6, x22]
0x2d15098c29fc   35c  110031f6       add w22, w15, #0xc (12)
0x2d15098c2a00   360  b87668d7       ldr w23, [x6, x22]
0x2d15098c2a04   364  0b1502f5       add w21, w23, w21
0x2d15098c2a08   368  b83668d5       str w21, [x6, x22]
0x2d15098c2a0c   36c  110041f6       add w22, w15, #0x10 (16)
0x2d15098c2a10   370  b87668d7       ldr w23, [x6, x22]
0x2d15098c2a14   374  0b1502f5       add w21, w23, w21
0x2d15098c2a18   378  b83668d5       str w21, [x6, x22]
0x2d15098c2a1c   37c  110051f6       add w22, w15, #0x14 (20)
0x2d15098c2a20   380  b87668d7       ldr w23, [x6, x22]
0x2d15098c2a24   384  0b1502f5       add w21, w23, w21
0x2d15098c2a28   388  b83668d5       str w21, [x6, x22]
0x2d15098c2a2c   38c  110061f6       add w22, w15, #0x18 (24)
0x2d15098c2a30   390  b87668d7       ldr w23, [x6, x22]
0x2d15098c2a34   394  0b1502f5       add w21, w23, w21
0x2d15098c2a38   398  b83668d5       str w21, [x6, x22]
0x2d15098c2a3c   39c  110071f6       add w22, w15, #0x1c (28)
0x2d15098c2a40   3a0  b87668d7       ldr w23, [x6, x22]
0x2d15098c2a44   3a4  0b1502f5       add w21, w23, w21
0x2d15098c2a48   3a8  b83668d5       str w21, [x6, x22]
0x2d15098c2a4c   3ac  110081ef       add w15, w15, #0x20 (32)
0x2d15098c2a50   3b0  5100214a       sub w10, w10, #0x8 (8)
0x2d15098c2a54   3b4  35fffb8a       cbnz w10, #-0x90 (addr 0x2d15098c29c4)
0x2d15098c2a58   3b8  35000093       cbnz w19, #+0x10 (addr 0x2d15098c2a68)
0x2d15098c2a5c   3bc  1400001f       b #+0x7c (addr 0x2d15098c2ad8)
0x2d15098c2a60   3c0  aa0e03f5       mov x21, x14
0x2d15098c2a64   3c4  aa1403ef       mov x15, x20
0x2d15098c2a68   3c8  531e766a       lsl w10, w19, #2
0x2d15098c2a6c   3cc  b86f68d3       ldr w19, [x6, x15]
0x2d15098c2a70   3d0  0b150273       add w19, w19, w21
0x2d15098c2a74   3d4  b82f68d3       str w19, [x6, x15]
0x2d15098c2a78   3d8  110011ef       add w15, w15, #0x4 (4)
0x2d15098c2a7c   3dc  5100114a       sub w10, w10, #0x4 (4)
0x2d15098c2a80   3e0  340002ca       cbz w10, #+0x58 (addr 0x2d15098c2ad8)
0x2d15098c2a84   3e4  b86f68d5       ldr w21, [x6, x15]
0x2d15098c2a88   3e8  0b1302b3       add w19, w21, w19
0x2d15098c2a8c   3ec  b82f68d3       str w19, [x6, x15]
0x2d15098c2a90   3f0  110011ef       add w15, w15, #0x4 (4)
0x2d15098c2a94   3f4  5100114a       sub w10, w10, #0x4 (4)
0x2d15098c2a98   3f8  3400020a       cbz w10, #+0x40 (addr 0x2d15098c2ad8)
0x2d15098c2a9c   3fc  b86f68d5       ldr w21, [x6, x15]
0x2d15098c2aa0   400  0b1302b3       add w19, w21, w19
0x2d15098c2aa4   404  b82f68d3       str w19, [x6, x15]
0x2d15098c2aa8   408  110011ef       add w15, w15, #0x4 (4)
0x2d15098c2aac   40c  5100114a       sub w10, w10, #0x4 (4)
0x2d15098c2ab0   410  3400014a       cbz w10, #+0x28 (addr 0x2d15098c2ad8)
0x2d15098c2ab4   414  f8520355       ldur x21, [x26, #-224]
0x2d15098c2ab8   418  eb3563ff       cmp sp, x21
0x2d15098c2abc   41c  540026e9       b.ls #+0x4dc (addr 0x2d15098c2f98)
0x2d15098c2ac0   420  b86f68d5       ldr w21, [x6, x15]
0x2d15098c2ac4   424  0b1302b5       add w21, w21, w19
0x2d15098c2ac8   428  b82f68d5       str w21, [x6, x15]
0x2d15098c2acc   42c  110011ef       add w15, w15, #0x4 (4)
0x2d15098c2ad0   430  5100114a       sub w10, w10, #0x4 (4)
0x2d15098c2ad4   434  35fffcca       cbnz w10, #-0x68 (addr 0x2d15098c2a6c)
0x2d15098c2ad8   438  9100510a       add x10, x8, #0x14 (20)
0x2d15098c2adc   43c  b82a68df       str wzr, [x6, x10]
0x2d15098c2ae0   440  9100310f       add x15, x8, #0xc (12)
0x2d15098c2ae4   444  b86f68cf       ldr w15, [x6, x15]
0x2d15098c2ae8   448  f9003bea       str x10, [sp, #112]
0x2d15098c2aec   44c  6b0f017f       cmp w11, w15
0x2d15098c2af0   450  54000309       b.ls #+0x60 (addr 0x2d15098c2b50)
0x2d15098c2af4   454  aa0003ef       mov x15, x0
0x2d15098c2af8   458  110031e0       add w0, w15, #0xc (12)
0x2d15098c2afc   45c  aa0b03e3       mov x3, x11
0x2d15098c2b00   460  aa0e03e2       mov x2, x14
0x2d15098c2b04   464  97fc0adf       bl #-0xfd484 (addr 0x2d15097c5680)
0x2d15098c2b08   468  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2b0c   46c  f9403be8       ldr x8, [sp, #112]
0x2d15098c2b10   470  b86868c8       ldr w8, [x6, x8]
0x2d15098c2b14   474  aa0803ea       mov x10, x8
0x2d15098c2b18   478  f94047ed       ldr x13, [sp, #136]
0x2d15098c2b1c   47c  d280000e       movz x14, #0x0
0x2d15098c2b20   480  f9401be4       ldr x4, [sp, #48]
0x2d15098c2b24   484  f94017e2       ldr x2, [sp, #40]
0x2d15098c2b28   488  f94043e8       ldr x8, [sp, #128]
0x2d15098c2b2c   48c  f9400fec       ldr x12, [sp, #24]
0x2d15098c2b30   490  f9400be9       ldr x9, [sp, #16]
0x2d15098c2b34   494  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2b38   498  f9404be7       ldr x7, [sp, #144]
0x2d15098c2b3c   49c  f94013e0       ldr x0, [sp, #32]
0x2d15098c2b40   4a0  f94037eb       ldr x11, [sp, #104]
0x2d15098c2b44   4a4  f94033e5       ldr x5, [sp, #96]
0x2d15098c2b48   4a8  f94007f4       ldr x20, [sp, #8]
0x2d15098c2b4c   4ac  14000002       b #+0x8 (addr 0x2d15098c2b54)
0x2d15098c2b50   4b0  aa0e03ea       mov x10, x14
0x2d15098c2b54   4b4  531e756f       lsl w15, w11, #2
0x2d15098c2b58   4b8  f9003bea       str x10, [sp, #112]
0x2d15098c2b5c   4bc  340003af       cbz w15, #+0x74 (addr 0x2d15098c2bd0)
0x2d15098c2b60   4c0  9100410f       add x15, x8, #0x10 (16)
0x2d15098c2b64   4c4  b86f68cf       ldr w15, [x6, x15]
0x2d15098c2b68   4c8  0b0a09ef       add w15, w15, w10, lsl #2
0x2d15098c2b6c   4cc  aa0703e0       mov x0, x7
0x2d15098c2b70   4d0  aa0e03e1       mov x1, x14
0x2d15098c2b74   4d4  aa0e03e2       mov x2, x14
0x2d15098c2b78   4d8  aa0f03e3       mov x3, x15
0x2d15098c2b7c   4dc  aa1403e4       mov x4, x20
0x2d15098c2b80   4e0  580029d0       ldr x16, pc+1336 (addr 0x00002d15098c30b8)
0x2d15098c2b84   4e4  10000068       adr x8, #+0xc (addr 0x2d15098c2b90)
0x2d15098c2b88   4e8  a9027748       stp x8, fp, [x26, #32]
0x2d15098c2b8c   4ec  d63f0200       blr x16
0x2d15098c2b90   4f0  f900175f       str xzr, [x26, #40]
0x2d15098c2b94   4f4  6a00001f       tst w0, w0
0x2d15098c2b98   4f8  54002840       b.eq #+0x508 (addr 0x2d15098c30a0)
0x2d15098c2b9c   4fc  f9403bea       ldr x10, [sp, #112]
0x2d15098c2ba0   500  f94047ed       ldr x13, [sp, #136]
0x2d15098c2ba4   504  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2ba8   508  d280000e       movz x14, #0x0
0x2d15098c2bac   50c  f9401be4       ldr x4, [sp, #48]
0x2d15098c2bb0   510  f94017e2       ldr x2, [sp, #40]
0x2d15098c2bb4   514  f94043e8       ldr x8, [sp, #128]
0x2d15098c2bb8   518  f9400fec       ldr x12, [sp, #24]
0x2d15098c2bbc   51c  f9400be9       ldr x9, [sp, #16]
0x2d15098c2bc0   520  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2bc4   524  f9404be7       ldr x7, [sp, #144]
0x2d15098c2bc8   528  f94013e0       ldr x0, [sp, #32]
0x2d15098c2bcc   52c  f94037eb       ldr x11, [sp, #104]
0x2d15098c2bd0   530  9100810f       add x15, x8, #0x20 (32)
0x2d15098c2bd4   534  b82f68df       str wzr, [x6, x15]
0x2d15098c2bd8   538  0b0b014a       add w10, w10, w11
0x2d15098c2bdc   53c  9100510b       add x11, x8, #0x14 (20)
0x2d15098c2be0   540  b82b68ca       str w10, [x6, x11]
0x2d15098c2be4   544  f9003bef       str x15, [sp, #112]
0x2d15098c2be8   548  f9002feb       str x11, [sp, #88]
0x2d15098c2bec   54c  35000063       cbnz w3, #+0xc (addr 0x2d15098c2bf8)
0x2d15098c2bf0   550  aa0e03ea       mov x10, x14
0x2d15098c2bf4   554  14000048       b #+0x120 (addr 0x2d15098c2d14)
0x2d15098c2bf8   558  9100610a       add x10, x8, #0x18 (24)
0x2d15098c2bfc   55c  b86a68ca       ldr w10, [x6, x10]
0x2d15098c2c00   560  6b0a007f       cmp w3, w10
0x2d15098c2c04   564  540002a9       b.ls #+0x54 (addr 0x2d15098c2c58)
0x2d15098c2c08   568  aa0003ea       mov x10, x0
0x2d15098c2c0c   56c  11006140       add w0, w10, #0x18 (24)
0x2d15098c2c10   570  aa0e03e2       mov x2, x14
0x2d15098c2c14   574  97fc0a9b       bl #-0xfd594 (addr 0x2d15097c5680)
0x2d15098c2c18   578  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2c1c   57c  f9403be8       ldr x8, [sp, #112]
0x2d15098c2c20   580  b86868c9       ldr w9, [x6, x8]
0x2d15098c2c24   584  aa0903ea       mov x10, x9
0x2d15098c2c28   588  f94047ed       ldr x13, [sp, #136]
0x2d15098c2c2c   58c  d280000e       movz x14, #0x0
0x2d15098c2c30   590  f9401be4       ldr x4, [sp, #48]
0x2d15098c2c34   594  f94017e2       ldr x2, [sp, #40]
0x2d15098c2c38   598  aa0803ef       mov x15, x8
0x2d15098c2c3c   59c  f94043e8       ldr x8, [sp, #128]
0x2d15098c2c40   5a0  f9402feb       ldr x11, [sp, #88]
0x2d15098c2c44   5a4  f9400fec       ldr x12, [sp, #24]
0x2d15098c2c48   5a8  f9400be9       ldr x9, [sp, #16]
0x2d15098c2c4c   5ac  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2c50   5b0  f9404be7       ldr x7, [sp, #144]
0x2d15098c2c54   5b4  14000002       b #+0x8 (addr 0x2d15098c2c5c)
0x2d15098c2c58   5b8  aa0e03ea       mov x10, x14
0x2d15098c2c5c   5bc  91007113       add x19, x8, #0x1c (28)
0x2d15098c2c60   5c0  b87368d3       ldr w19, [x6, x19]
0x2d15098c2c64   5c4  0b0a0a74       add w20, w19, w10, lsl #2
0x2d15098c2c68   5c8  f90037ea       str x10, [sp, #104]
0x2d15098c2c6c   5cc  f90033f3       str x19, [sp, #96]
0x2d15098c2c70   5d0  aa0303f5       mov x21, x3
0x2d15098c2c74   5d4  710006bf       cmp w21, #0x1 (1)
0x2d15098c2c78   5d8  540004a0       b.eq #+0x94 (addr 0x2d15098c2d0c)
0x2d15098c2c7c   5dc  531e76b6       lsl w22, w21, #2
0x2d15098c2c80   5e0  510012d6       sub w22, w22, #0x4 (4)
0x2d15098c2c84   5e4  34000356       cbz w22, #+0x68 (addr 0x2d15098c2cec)
0x2d15098c2c88   5e8  aa0703e0       mov x0, x7
0x2d15098c2c8c   5ec  aa0e03e1       mov x1, x14
0x2d15098c2c90   5f0  aa1403e2       mov x2, x20
0x2d15098c2c94   5f4  aa0e03e3       mov x3, x14
0x2d15098c2c98   5f8  aa1603e4       mov x4, x22
0x2d15098c2c9c   5fc  58002130       ldr x16, pc+1060 (addr 0x00002d15098c30c0)    ;; external reference (wasm::memory_fill)
0x2d15098c2ca0   600  10000068       adr x8, #+0xc (addr 0x2d15098c2cac)
0x2d15098c2ca4   604  a9027748       stp x8, fp, [x26, #32]
0x2d15098c2ca8   608  d63f0200       blr x16
0x2d15098c2cac   60c  f900175f       str xzr, [x26, #40]
0x2d15098c2cb0   610  6a00001f       tst w0, w0
0x2d15098c2cb4   614  54001f40       b.eq #+0x3e8 (addr 0x2d15098c309c)
0x2d15098c2cb8   618  f94047ed       ldr x13, [sp, #136]
0x2d15098c2cbc   61c  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2cc0   620  d280000e       movz x14, #0x0
0x2d15098c2cc4   624  f9401be4       ldr x4, [sp, #48]
0x2d15098c2cc8   628  f94017e2       ldr x2, [sp, #40]
0x2d15098c2ccc   62c  f94043e8       ldr x8, [sp, #128]
0x2d15098c2cd0   630  f9402feb       ldr x11, [sp, #88]
0x2d15098c2cd4   634  f9400fec       ldr x12, [sp, #24]
0x2d15098c2cd8   638  f9400be9       ldr x9, [sp, #16]
0x2d15098c2cdc   63c  f9403bef       ldr x15, [sp, #112]
0x2d15098c2ce0   640  f94037ea       ldr x10, [sp, #104]
0x2d15098c2ce4   644  f94033f3       ldr x19, [sp, #96]
0x2d15098c2ce8   648  f9401ff5       ldr x21, [sp, #56]
0x2d15098c2cec   64c  aa1503f4       mov x20, x21
0x2d15098c2cf0   650  0b14014a       add w10, w10, w20
0x2d15098c2cf4   654  51000554       sub w20, w10, #0x1 (1)
0x2d15098c2cf8   658  0b0a0a6a       add w10, w19, w10, lsl #2
0x2d15098c2cfc   65c  5100114a       sub w10, w10, #0x4 (4)
0x2d15098c2d00   660  aa0a03f0       mov x16, x10
0x2d15098c2d04   664  aa1403ea       mov x10, x20
0x2d15098c2d08   668  aa1003f4       mov x20, x16
0x2d15098c2d0c   66c  b83468df       str wzr, [x6, x20]
0x2d15098c2d10   670  1100054a       add w10, w10, #0x1 (1)
0x2d15098c2d14   674  b82f68ca       str w10, [x6, x15]
0x2d15098c2d18   678  3500008d       cbnz w13, #+0x10 (addr 0x2d15098c2d28)
0x2d15098c2d1c   67c  910003bf       mov sp, fp
0x2d15098c2d20   680  a8c17bfd       ldp fp, lr, [sp], #16
0x2d15098c2d24   684  d65f03c0       ret
0x2d15098c2d28   688  b86968c9       ldr w9, [x6, x9]
0x2d15098c2d2c   68c  7100013f       cmp w9, #0x0 (0)
0x2d15098c2d30   690  9a9f07ef       cset x15, ne
0x2d15098c2d34   694  4b0f0129       sub w9, w9, w15
0x2d15098c2d38   698  b86c68cc       ldr w12, [x6, x12]
0x2d15098c2d3c   69c  7100019f       cmp w12, #0x0 (0)
0x2d15098c2d40   6a0  9a9f07ef       cset x15, ne
0x2d15098c2d44   6a4  4b0f018f       sub w15, w12, w15
0x2d15098c2d48   6a8  91007113       add x19, x8, #0x1c (28)
0x2d15098c2d4c   6ac  b87368d3       ldr w19, [x6, x19]
0x2d15098c2d50   6b0  91004114       add x20, x8, #0x10 (16)
0x2d15098c2d54   6b4  b87468d4       ldr w20, [x6, x20]
0x2d15098c2d58   6b8  b86b68cb       ldr w11, [x6, x11]
0x2d15098c2d5c   6bc  91009108       add x8, x8, #0x24 (36)
0x2d15098c2d60   6c0  bc6868c0       ldr s0, [x6, x8]
0x2d15098c2d64   6c4  aa0e03e8       mov x8, x14
0x2d15098c2d68   6c8  f8520355       ldur x21, [x26, #-224]
0x2d15098c2d6c   6cc  eb3563ff       cmp sp, x21
0x2d15098c2d70   6d0  54001409       b.ls #+0x280 (addr 0x2d15098c2ff0)
0x2d15098c2d74   6d4  2a0403f5       mov w21, w4
0x2d15098c2d78   6d8  bc7568c1       ldr s1, [x6, x21]
0x2d15098c2d7c   6dc  1e200821       fmul s1, s1, s0
0x2d15098c2d80   6e0  1e212020       fcmp s1, s1
0x2d15098c2d84   6e4  1e211de1       fcsel s1, s15, s1, ne
0x2d15098c2d88   6e8  1e202028       fcmp s1, #0.0
0x2d15098c2d8c   6ec  1e2fcc21       fcsel s1, s1, s15, gt
0x2d15098c2d90   6f0  1e254021       frintm s1, s1
0x2d15098c2d94   6f4  1e22c022       fcvt d2, s1
0x2d15098c2d98   6f8  1e65c043       frintz d3, d2
0x2d15098c2d9c   6fc  1e790075       fcvtzu w21, d3
0x2d15098c2da0   700  1e6302a4       ucvtf d4, w21
0x2d15098c2da4   704  1e642060       fcmp d3, d4
0x2d15098c2da8   708  540015a1       b.ne #+0x2b4 (addr 0x2d15098c305c)
0x2d15098c2dac   70c  6b15013f       cmp w9, w21
0x2d15098c2db0   710  1a953136       csel w22, w9, w21, lo
0x2d15098c2db4   714  52a9f010       movz w16, #0x4f800000
0x2d15098c2db8   718  1e270202       fmov s2, w16
0x2d15098c2dbc   71c  1e222020       fcmp s1, s2
0x2d15098c2dc0   720  1a9f32d5       csel w21, w22, wzr, lo
0x2d15098c2dc4   724  1b0c7eb5       mul w21, w21, w12
0x2d15098c2dc8   728  2a0203f6       mov w22, w2
0x2d15098c2dcc   72c  bc7668c1       ldr s1, [x6, x22]
0x2d15098c2dd0   730  1e200821       fmul s1, s1, s0
0x2d15098c2dd4   734  1e212020       fcmp s1, s1
0x2d15098c2dd8   738  1e211de1       fcsel s1, s15, s1, ne
0x2d15098c2ddc   73c  1e202028       fcmp s1, #0.0
0x2d15098c2de0   740  1e2fcc21       fcsel s1, s1, s15, gt
0x2d15098c2de4   744  1e254021       frintm s1, s1
0x2d15098c2de8   748  1e22c023       fcvt d3, s1
0x2d15098c2dec   74c  1e65c064       frintz d4, d3
0x2d15098c2df0   750  1e790096       fcvtzu w22, d4
0x2d15098c2df4   754  1e6302c5       ucvtf d5, w22
0x2d15098c2df8   758  1e652080       fcmp d4, d5
0x2d15098c2dfc   75c  54001401       b.ne #+0x280 (addr 0x2d15098c307c)
0x2d15098c2e00   760  6b1601ff       cmp w15, w22
0x2d15098c2e04   764  1a9631f7       csel w23, w15, w22, lo
0x2d15098c2e08   768  1e222020       fcmp s1, s2
0x2d15098c2e0c   76c  1a9f32f6       csel w22, w23, wzr, lo
0x2d15098c2e10   770  0b1602b5       add w21, w21, w22
0x2d15098c2e14   774  6b15017f       cmp w11, w21
0x2d15098c2e18   778  54000149       b.ls #+0x28 (addr 0x2d15098c2e40)
0x2d15098c2e1c   77c  0b150a95       add w21, w20, w21, lsl #2
0x2d15098c2e20   780  b87568d6       ldr w22, [x6, x21]
0x2d15098c2e24   784  6b16015f       cmp w10, w22
0x2d15098c2e28   788  54000089       b.ls #+0x10 (addr 0x2d15098c2e38)
0x2d15098c2e2c   78c  0b160a76       add w22, w19, w22, lsl #2
0x2d15098c2e30   790  b83668c8       str w8, [x6, x22]
0x2d15098c2e34   794  b87568d6       ldr w22, [x6, x21]
0x2d15098c2e38   798  110006d6       add w22, w22, #0x1 (1)
0x2d15098c2e3c   79c  b83568d6       str w22, [x6, x21]
0x2d15098c2e40   7a0  11001042       add w2, w2, #0x4 (4)
0x2d15098c2e44   7a4  11001084       add w4, w4, #0x4 (4)
0x2d15098c2e48   7a8  11000508       add w8, w8, #0x1 (1)
0x2d15098c2e4c   7ac  6b0801bf       cmp w13, w8
0x2d15098c2e50   7b0  54fff660       b.eq #-0x134 (addr 0x2d15098c2d1c)
0x2d15098c2e54   7b4  17ffffc5       b #-0xec (addr 0x2d15098c2d68)
0x2d15098c2e58   7b8  97fc0b5e       bl #-0xfd288 (addr 0x2d15097c5bd0)
0x2d15098c2e5c   7bc  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2e60   7c0  f9401be4       ldr x4, [sp, #48]
0x2d15098c2e64   7c4  f94017e2       ldr x2, [sp, #40]
0x2d15098c2e68   7c8  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2e6c   7cc  f9404be7       ldr x7, [sp, #144]
0x2d15098c2e70   7d0  f94013e0       ldr x0, [sp, #32]
0x2d15098c2e74   7d4  f94027e5       ldr x5, [sp, #72]
0x2d15098c2e78   7d8  17fffe19       b #-0x79c (addr 0x2d15098c26dc)
0x2d15098c2e7c   7dc  f90007f4       str x20, [sp, #8]
0x2d15098c2e80   7e0  f9003bf5       str x21, [sp, #112]
0x2d15098c2e84   7e4  f90023f6       str x22, [sp, #64]
0x2d15098c2e88   7e8  f90003f7       str x23, [sp]
0x2d15098c2e8c   7ec  f90033ef       str x15, [sp, #96]
0x2d15098c2e90   7f0  f9002fea       str x10, [sp, #88]
0x2d15098c2e94   7f4  fd002be0       str d0, [sp, #80]
0x2d15098c2e98   7f8  f90027f3       str x19, [sp, #72]
0x2d15098c2e9c   7fc  97fc0b4d       bl #-0xfd2cc (addr 0x2d15097c5bd0)
0x2d15098c2ea0   800  f94047ed       ldr x13, [sp, #136]
0x2d15098c2ea4   804  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2ea8   808  d280000e       movz x14, #0x0
0x2d15098c2eac   80c  f9401be4       ldr x4, [sp, #48]
0x2d15098c2eb0   810  f94017e2       ldr x2, [sp, #40]
0x2d15098c2eb4   814  f94043e8       ldr x8, [sp, #128]
0x2d15098c2eb8   818  f9400fec       ldr x12, [sp, #24]
0x2d15098c2ebc   81c  f9400be9       ldr x9, [sp, #16]
0x2d15098c2ec0   820  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2ec4   824  f9404be7       ldr x7, [sp, #144]
0x2d15098c2ec8   828  f94013e0       ldr x0, [sp, #32]
0x2d15098c2ecc   82c  f94037eb       ldr x11, [sp, #104]
0x2d15098c2ed0   830  f94007f4       ldr x20, [sp, #8]
0x2d15098c2ed4   834  f9403bf5       ldr x21, [sp, #112]
0x2d15098c2ed8   838  f94023f6       ldr x22, [sp, #64]
0x2d15098c2edc   83c  f94003f7       ldr x23, [sp]
0x2d15098c2ee0   840  f94033ef       ldr x15, [sp, #96]
0x2d15098c2ee4   844  f9402fea       ldr x10, [sp, #88]
0x2d15098c2ee8   848  fd402be0       ldr d0, [sp, #80]
0x2d15098c2eec   84c  d2800038       movz x24, #0x1
0x2d15098c2ef0   850  f94027f3       ldr x19, [sp, #72]
0x2d15098c2ef4   854  17fffe73       b #-0x634 (addr 0x2d15098c28c0)
0x2d15098c2ef8   858  1e622040       fcmp d2, d2
0x2d15098c2efc   85c  54000060       b.eq #+0xc (addr 0x2d15098c2f08)
0x2d15098c2f00   860  aa0e03f9       mov x25, x14
0x2d15098c2f04   864  17fffe7d       b #-0x60c (addr 0x2d15098c28f8)
0x2d15098c2f08   868  1e202028       fcmp s1, #0.0
0x2d15098c2f0c   86c  54ffffa3       b.lo #-0xc (addr 0x2d15098c2f00)
0x2d15098c2f10   870  92800019       movn x25, #0x0
0x2d15098c2f14   874  17fffe79       b #-0x61c (addr 0x2d15098c28f8)
0x2d15098c2f18   878  1e632060       fcmp d3, d3
0x2d15098c2f1c   87c  54000060       b.eq #+0xc (addr 0x2d15098c2f28)
0x2d15098c2f20   880  aa0e03fb       mov cp, x14
0x2d15098c2f24   884  17fffe8a       b #-0x5d8 (addr 0x2d15098c294c)
0x2d15098c2f28   888  1e202028       fcmp s1, #0.0
0x2d15098c2f2c   88c  54ffffa3       b.lo #-0xc (addr 0x2d15098c2f20)
0x2d15098c2f30   890  9280001b       movn cp, #0x0
0x2d15098c2f34   894  17fffe86       b #-0x5e8 (addr 0x2d15098c294c)
0x2d15098c2f38   898  f9003bf3       str x19, [sp, #112]
0x2d15098c2f3c   89c  f9002bea       str x10, [sp, #80]
0x2d15098c2f40   8a0  f90027ef       str x15, [sp, #72]
0x2d15098c2f44   8a4  f9002ff5       str x21, [sp, #88]
0x2d15098c2f48   8a8  97fc0b22       bl #-0xfd378 (addr 0x2d15097c5bd0)
0x2d15098c2f4c   8ac  f94047ed       ldr x13, [sp, #136]
0x2d15098c2f50   8b0  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2f54   8b4  d280000e       movz x14, #0x0
0x2d15098c2f58   8b8  f9401be4       ldr x4, [sp, #48]
0x2d15098c2f5c   8bc  f94017e2       ldr x2, [sp, #40]
0x2d15098c2f60   8c0  f94043e8       ldr x8, [sp, #128]
0x2d15098c2f64   8c4  f9400fec       ldr x12, [sp, #24]
0x2d15098c2f68   8c8  f9400be9       ldr x9, [sp, #16]
0x2d15098c2f6c   8cc  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2f70   8d0  f9404be7       ldr x7, [sp, #144]
0x2d15098c2f74   8d4  f94013e0       ldr x0, [sp, #32]
0x2d15098c2f78   8d8  f94037eb       ldr x11, [sp, #104]
0x2d15098c2f7c   8dc  f94033e5       ldr x5, [sp, #96]
0x2d15098c2f80   8e0  f94007f4       ldr x20, [sp, #8]
0x2d15098c2f84   8e4  f9403bf3       ldr x19, [sp, #112]
0x2d15098c2f88   8e8  f9402bea       ldr x10, [sp, #80]
0x2d15098c2f8c   8ec  f94027ef       ldr x15, [sp, #72]
0x2d15098c2f90   8f0  f9402ff5       ldr x21, [sp, #88]
0x2d15098c2f94   8f4  17fffe8f       b #-0x5c4 (addr 0x2d15098c29d0)
0x2d15098c2f98   8f8  f9003bea       str x10, [sp, #112]
0x2d15098c2f9c   8fc  f90023ef       str x15, [sp, #64]
0x2d15098c2fa0   900  f9002bf3       str x19, [sp, #80]
0x2d15098c2fa4   904  97fc0b0b       bl #-0xfd3d4 (addr 0x2d15097c5bd0)
0x2d15098c2fa8   908  f94047ed       ldr x13, [sp, #136]
0x2d15098c2fac   90c  f9403fe6       ldr x6, [sp, #120]
0x2d15098c2fb0   910  d280000e       movz x14, #0x0
0x2d15098c2fb4   914  f9401be4       ldr x4, [sp, #48]
0x2d15098c2fb8   918  f94017e2       ldr x2, [sp, #40]
0x2d15098c2fbc   91c  f94043e8       ldr x8, [sp, #128]
0x2d15098c2fc0   920  f9400fec       ldr x12, [sp, #24]
0x2d15098c2fc4   924  f9400be9       ldr x9, [sp, #16]
0x2d15098c2fc8   928  f9401fe3       ldr x3, [sp, #56]
0x2d15098c2fcc   92c  f9404be7       ldr x7, [sp, #144]
0x2d15098c2fd0   930  f94013e0       ldr x0, [sp, #32]
0x2d15098c2fd4   934  f94037eb       ldr x11, [sp, #104]
0x2d15098c2fd8   938  f94033e5       ldr x5, [sp, #96]
0x2d15098c2fdc   93c  f94007f4       ldr x20, [sp, #8]
0x2d15098c2fe0   940  f9403bea       ldr x10, [sp, #112]
0x2d15098c2fe4   944  f94023ef       ldr x15, [sp, #64]
0x2d15098c2fe8   948  f9402bf3       ldr x19, [sp, #80]
0x2d15098c2fec   94c  17fffeb5       b #-0x52c (addr 0x2d15098c2ac0)
0x2d15098c2ff0   950  f90043e8       str x8, [sp, #128]
0x2d15098c2ff4   954  f9001be4       str x4, [sp, #48]
0x2d15098c2ff8   958  f90017e2       str x2, [sp, #40]
0x2d15098c2ffc   95c  f9003bf3       str x19, [sp, #112]
0x2d15098c3000   960  f90037ea       str x10, [sp, #104]
0x2d15098c3004   964  f90033f4       str x20, [sp, #96]
0x2d15098c3008   968  f9002feb       str x11, [sp, #88]
0x2d15098c300c   96c  f9002bef       str x15, [sp, #80]
0x2d15098c3010   970  fd0027e0       str d0, [sp, #72]
0x2d15098c3014   974  f90023ec       str x12, [sp, #64]
0x2d15098c3018   978  f9001fe9       str x9, [sp, #56]
0x2d15098c301c   97c  97fc0aed       bl #-0xfd44c (addr 0x2d15097c5bd0)
0x2d15098c3020   980  f94047ed       ldr x13, [sp, #136]
0x2d15098c3024   984  f94043e8       ldr x8, [sp, #128]
0x2d15098c3028   988  f9401be4       ldr x4, [sp, #48]
0x2d15098c302c   98c  f94017e2       ldr x2, [sp, #40]
0x2d15098c3030   990  f9403fe6       ldr x6, [sp, #120]
0x2d15098c3034   994  f9403bf3       ldr x19, [sp, #112]
0x2d15098c3038   998  f94037ea       ldr x10, [sp, #104]
0x2d15098c303c   99c  f94033f4       ldr x20, [sp, #96]
0x2d15098c3040   9a0  f9402feb       ldr x11, [sp, #88]
0x2d15098c3044   9a4  f9402bef       ldr x15, [sp, #80]
0x2d15098c3048   9a8  d280000e       movz x14, #0x0
0x2d15098c304c   9ac  fd4027e0       ldr d0, [sp, #72]
0x2d15098c3050   9b0  f94023ec       ldr x12, [sp, #64]
0x2d15098c3054   9b4  f9401fe9       ldr x9, [sp, #56]
0x2d15098c3058   9b8  17ffff47       b #-0x2e4 (addr 0x2d15098c2d74)
0x2d15098c305c   9bc  1e622040       fcmp d2, d2
0x2d15098c3060   9c0  54000060       b.eq #+0xc (addr 0x2d15098c306c)
0x2d15098c3064   9c4  aa0e03f5       mov x21, x14
0x2d15098c3068   9c8  17ffff51       b #-0x2bc (addr 0x2d15098c2dac)
0x2d15098c306c   9cc  1e202028       fcmp s1, #0.0
0x2d15098c3070   9d0  54ffffa3       b.lo #-0xc (addr 0x2d15098c3064)
0x2d15098c3074   9d4  92800015       movn x21, #0x0
0x2d15098c3078   9d8  17ffff4d       b #-0x2cc (addr 0x2d15098c2dac)
0x2d15098c307c   9dc  1e632060       fcmp d3, d3
0x2d15098c3080   9e0  54000060       b.eq #+0xc (addr 0x2d15098c308c)
0x2d15098c3084   9e4  aa0e03f6       mov x22, x14
0x2d15098c3088   9e8  17ffff5e       b #-0x288 (addr 0x2d15098c2e00)
0x2d15098c308c   9ec  1e202028       fcmp s1, #0.0
0x2d15098c3090   9f0  54ffffa3       b.lo #-0xc (addr 0x2d15098c3084)
0x2d15098c3094   9f4  92800016       movn x22, #0x0
0x2d15098c3098   9f8  17ffff5a       b #-0x298 (addr 0x2d15098c2e00)
0x2d15098c309c   9fc  97fc0a1d       bl #-0xfd78c (addr 0x2d15097c5910)
0x2d15098c30a0   a00  97fc0a1c       bl #-0xfd790 (addr 0x2d15097c5910)
0x2d15098c30a4   a04  97fc0a1b       bl #-0xfd794 (addr 0x2d15097c5910)
0x2d15098c30a8   a08  d503201f       nop
0x2d15098c30ac   a0c  580000df       constant pool begin (num_const = 6)
0x2d15098c30b0   a10  d63f03e0       constant
0x2d15098c30b4   a14  d503201f       constant
0x2d15098c30b8   a18  01ccaa68       constant
0x2d15098c30bc   a1c  00000001       constant
0x2d15098c30c0   a20  01ccaaf4       constant
0x2d15098c30c4   a24  00000001       constant

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
0x2d15098c273c     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x2d15098c2738  internal wasm call
0x2d15098c27bc  external reference (0x101ccaaf4)
0x2d15098c2b04  internal wasm call
0x2d15098c2b80  external reference (0x101ccaa68)
0x2d15098c2c14  internal wasm call
0x2d15098c2e58  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2e9c  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2f48  wasm stub call  (0x2d15097c5bd0)
0x2d15098c2fa4  wasm stub call  (0x2d15097c5bd0)
0x2d15098c301c  wasm stub call  (0x2d15097c5bd0)
0x2d15098c309c  wasm stub call  (0x2d15097c5910)
0x2d15098c30a0  wasm stub call  (0x2d15097c5910)
0x2d15098c30a4  wasm stub call  (0x2d15097c5910)
0x2d15098c30ac  constant pool (size 28)
