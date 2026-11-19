name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2616 + 8 padding)
Instructions (size = 2600)
0x12e28fa37420     0  d2800110       movz x16, #0x8
0x12e28fa37424     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x12e28fa37428     8  a9017bfd       stp fp, lr, [sp, #16]
0x12e28fa3742c     c  910043fd       add fp, sp, #0x10 (16)
0x12e28fa37430    10  d10243ff       sub sp, sp, #0x90 (144)
0x12e28fa37434    14  f841f0e6       ldur x6, [x7, #31]
0x12e28fa37438    18  f8520348       ldur x8, [x26, #-224]
0x12e28fa3743c    1c  f90013e0       str x0, [sp, #32]
0x12e28fa37440    20  f90017e2       str x2, [sp, #40]
0x12e28fa37444    24  f9001fe3       str x3, [sp, #56]
0x12e28fa37448    28  f9001be4       str x4, [sp, #48]
0x12e28fa3744c    2c  f90027e5       str x5, [sp, #72]
0x12e28fa37450    30  f9003fe6       str x6, [sp, #120]
0x12e28fa37454    34  eb2863ff       cmp sp, x8
0x12e28fa37458    38  54003c09       b.ls #+0x780 (addr 0x12e28fa37bd8)
0x12e28fa3745c    3c  2a0003e8       mov w8, w0
0x12e28fa37460    40  91002109       add x9, x8, #0x8 (8)
0x12e28fa37464    44  b82968df       str wzr, [x6, x9]
0x12e28fa37468    48  9100b10a       add x10, x8, #0x2c (44)
0x12e28fa3746c    4c  b86a68cb       ldr w11, [x6, x10]
0x12e28fa37470    50  9100a10c       add x12, x8, #0x28 (40)
0x12e28fa37474    54  b86c68cd       ldr w13, [x6, x12]
0x12e28fa37478    58  1b0d7d6b       mul w11, w11, w13
0x12e28fa3747c    5c  1100056d       add w13, w11, #0x1 (1)
0x12e28fa37480    60  f90043e8       str x8, [sp, #128]
0x12e28fa37484    64  f90047e9       str x9, [sp, #136]
0x12e28fa37488    68  f9000bea       str x10, [sp, #16]
0x12e28fa3748c    6c  f9000fec       str x12, [sp, #24]
0x12e28fa37490    70  f9002feb       str x11, [sp, #88]
0x12e28fa37494    74  f9003bed       str x13, [sp, #112]
0x12e28fa37498    78  3500006d       cbnz w13, #+0xc (addr 0x12e28fa374a4)
0x12e28fa3749c    7c  d280000b       movz x11, #0x0
0x12e28fa374a0    80  14000047       b #+0x11c (addr 0x12e28fa375bc)
0x12e28fa374a4    84  b86868ce       ldr w14, [x6, x8]
0x12e28fa374a8    88  6b0e01bf       cmp w13, w14
0x12e28fa374ac    8c  540002a9       b.ls #+0x54 (addr 0x12e28fa37500)
0x12e28fa374b0    90  aa0d03e3       mov x3, x13
0x12e28fa374b4    94  d2800002       movz x2, #0x0
0x12e28fa374b8    98  97fc0872       bl #-0xfde38 (addr 0x12e28f939680)
0x12e28fa374bc    9c  f9403fe6       ldr x6, [sp, #120]
0x12e28fa374c0    a0  f94047e8       ldr x8, [sp, #136]
0x12e28fa374c4    a4  b86868c9       ldr w9, [x6, x8]
0x12e28fa374c8    a8  aa0903ee       mov x14, x9
0x12e28fa374cc    ac  f9401be4       ldr x4, [sp, #48]
0x12e28fa374d0    b0  f94017e2       ldr x2, [sp, #40]
0x12e28fa374d4    b4  aa0803e9       mov x9, x8
0x12e28fa374d8    b8  f94043e8       ldr x8, [sp, #128]
0x12e28fa374dc    bc  f9400fec       ldr x12, [sp, #24]
0x12e28fa374e0    c0  f9400bea       ldr x10, [sp, #16]
0x12e28fa374e4    c4  f9401fe3       ldr x3, [sp, #56]
0x12e28fa374e8    c8  f9404be7       ldr x7, [sp, #144]
0x12e28fa374ec    cc  f94013e0       ldr x0, [sp, #32]
0x12e28fa374f0    d0  f94027e5       ldr x5, [sp, #72]
0x12e28fa374f4    d4  f9403bed       ldr x13, [sp, #112]
0x12e28fa374f8    d8  f9402feb       ldr x11, [sp, #88]
0x12e28fa374fc    dc  14000002       b #+0x8 (addr 0x12e28fa37504)
0x12e28fa37500    e0  d280000e       movz x14, #0x0
0x12e28fa37504    e4  9100110f       add x15, x8, #0x4 (4)
0x12e28fa37508    e8  b86f68cf       ldr w15, [x6, x15]
0x12e28fa3750c    ec  0b0e09f3       add w19, w15, w14, lsl #2
0x12e28fa37510    f0  f90033ee       str x14, [sp, #96]
0x12e28fa37514    f4  f90037ef       str x15, [sp, #104]
0x12e28fa37518    f8  340004eb       cbz w11, #+0x9c (addr 0x12e28fa375b4)
0x12e28fa3751c    fc  531e75b4       lsl w20, w13, #2
0x12e28fa37520   100  51001294       sub w20, w20, #0x4 (4)
0x12e28fa37524   104  34000394       cbz w20, #+0x70 (addr 0x12e28fa37594)
0x12e28fa37528   108  aa0703e0       mov x0, x7
0x12e28fa3752c   10c  d2800001       movz x1, #0x0
0x12e28fa37530   110  aa1303e2       mov x2, x19
0x12e28fa37534   114  aa1403e4       mov x4, x20
0x12e28fa37538   118  aa0103e3       mov x3, x1
0x12e28fa3753c   11c  58004830       ldr x16, pc+2308 (addr 0x000012e28fa37e40)
0x12e28fa37540   120  10000068       adr x8, #+0xc (addr 0x12e28fa3754c)
0x12e28fa37544   124  a9027748       stp x8, fp, [x26, #32]
0x12e28fa37548   128  d63f0200       blr x16
0x12e28fa3754c   12c  f900175f       str xzr, [x26, #40]
0x12e28fa37550   130  6a00001f       tst w0, w0
0x12e28fa37554   134  54004680       b.eq #+0x8d0 (addr 0x12e28fa37e24)
0x12e28fa37558   138  f9403fe6       ldr x6, [sp, #120]
0x12e28fa3755c   13c  f9401be4       ldr x4, [sp, #48]
0x12e28fa37560   140  f94017e2       ldr x2, [sp, #40]
0x12e28fa37564   144  f94043e8       ldr x8, [sp, #128]
0x12e28fa37568   148  f9400fec       ldr x12, [sp, #24]
0x12e28fa3756c   14c  f9400bea       ldr x10, [sp, #16]
0x12e28fa37570   150  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37574   154  f9404be7       ldr x7, [sp, #144]
0x12e28fa37578   158  f94013e0       ldr x0, [sp, #32]
0x12e28fa3757c   15c  f94027e5       ldr x5, [sp, #72]
0x12e28fa37580   160  f94047e9       ldr x9, [sp, #136]
0x12e28fa37584   164  f94033ee       ldr x14, [sp, #96]
0x12e28fa37588   168  f94037ef       ldr x15, [sp, #104]
0x12e28fa3758c   16c  f9403bed       ldr x13, [sp, #112]
0x12e28fa37590   170  f9402feb       ldr x11, [sp, #88]
0x12e28fa37594   174  aa0e03f0       mov x16, x14
0x12e28fa37598   178  aa0b03ee       mov x14, x11
0x12e28fa3759c   17c  aa1003eb       mov x11, x16
0x12e28fa375a0   180  0b0e016e       add w14, w11, w14
0x12e28fa375a4   184  0b0d016b       add w11, w11, w13
0x12e28fa375a8   188  aa0f03ed       mov x13, x15
0x12e28fa375ac   18c  0b0b09ab       add w11, w13, w11, lsl #2
0x12e28fa375b0   190  51001173       sub w19, w11, #0x4 (4)
0x12e28fa375b4   194  b83368df       str wzr, [x6, x19]
0x12e28fa375b8   198  110005cb       add w11, w14, #0x1 (1)
0x12e28fa375bc   19c  b82968cb       str w11, [x6, x9]
0x12e28fa375c0   1a0  aa0503e9       mov x9, x5
0x12e28fa375c4   1a4  6b03013f       cmp w9, w3
0x12e28fa375c8   1a8  1a83312d       csel w13, w9, w3, lo
0x12e28fa375cc   1ac  d280000e       movz x14, #0x0
0x12e28fa375d0   1b0  f90037eb       str x11, [sp, #104]
0x12e28fa375d4   1b4  f90047ed       str x13, [sp, #136]
0x12e28fa375d8   1b8  350000cd       cbnz w13, #+0x18 (addr 0x12e28fa375f0)
0x12e28fa375dc   1bc  91001109       add x9, x8, #0x4 (4)
0x12e28fa375e0   1c0  b86968c9       ldr w9, [x6, x9]
0x12e28fa375e4   1c4  aa0903f4       mov x20, x9
0x12e28fa375e8   1c8  aa0a03e9       mov x9, x10
0x12e28fa375ec   1cc  14000047       b #+0x11c (addr 0x12e28fa37708)
0x12e28fa375f0   1d0  aa0a03e9       mov x9, x10
0x12e28fa375f4   1d4  b86968ca       ldr w10, [x6, x9]
0x12e28fa375f8   1d8  7100015f       cmp w10, #0x0 (0)
0x12e28fa375fc   1dc  9a9f07ef       cset x15, ne
0x12e28fa37600   1e0  4b0f014a       sub w10, w10, w15
0x12e28fa37604   1e4  b86c68cf       ldr w15, [x6, x12]
0x12e28fa37608   1e8  710001ff       cmp w15, #0x0 (0)
0x12e28fa3760c   1ec  9a9f07f3       cset x19, ne
0x12e28fa37610   1f0  4b1301f3       sub w19, w15, w19
0x12e28fa37614   1f4  91001114       add x20, x8, #0x4 (4)
0x12e28fa37618   1f8  b87468d4       ldr w20, [x6, x20]
0x12e28fa3761c   1fc  91009115       add x21, x8, #0x24 (36)
0x12e28fa37620   200  bc7568c0       ldr s0, [x6, x21]
0x12e28fa37624   204  aa0d03f5       mov x21, x13
0x12e28fa37628   208  aa0403f6       mov x22, x4
0x12e28fa3762c   20c  aa0203f7       mov x23, x2
0x12e28fa37630   210  d2800038       movz x24, #0x1
0x12e28fa37634   214  f8520359       ldur x25, [x26, #-224]
0x12e28fa37638   218  eb3963ff       cmp sp, x25
0x12e28fa3763c   21c  54002e09       b.ls #+0x5c0 (addr 0x12e28fa37bfc)
0x12e28fa37640   220  2a1703f9       mov w25, w23
0x12e28fa37644   224  bc7968c1       ldr s1, [x6, x25]
0x12e28fa37648   228  1e200821       fmul s1, s1, s0
0x12e28fa3764c   22c  1e212020       fcmp s1, s1
0x12e28fa37650   230  1e211de1       fcsel s1, s15, s1, ne
0x12e28fa37654   234  1e202028       fcmp s1, #0.0
0x12e28fa37658   238  1e2fcc21       fcsel s1, s1, s15, gt
0x12e28fa3765c   23c  1e254021       frintm s1, s1
0x12e28fa37660   240  1e22c022       fcvt d2, s1
0x12e28fa37664   244  1e65c043       frintz d3, d2
0x12e28fa37668   248  1e790079       fcvtzu w25, d3
0x12e28fa3766c   24c  1e630324       ucvtf d4, w25
0x12e28fa37670   250  1e642060       fcmp d3, d4
0x12e28fa37674   254  54003021       b.ne #+0x604 (addr 0x12e28fa37c78)
0x12e28fa37678   258  6b19027f       cmp w19, w25
0x12e28fa3767c   25c  1a99327b       csel w27, w19, w25, lo
0x12e28fa37680   260  11000779       add w25, w27, #0x1 (1)
0x12e28fa37684   264  52a9f010       movz w16, #0x4f800000
0x12e28fa37688   268  1e270202       fmov s2, w16
0x12e28fa3768c   26c  1e222020       fcmp s1, s2
0x12e28fa37690   270  1a983339       csel w25, w25, w24, lo
0x12e28fa37694   274  2a1603fb       mov w27, w22
0x12e28fa37698   278  bc7b68c1       ldr s1, [x6, x27]
0x12e28fa3769c   27c  1e200821       fmul s1, s1, s0
0x12e28fa376a0   280  1e212020       fcmp s1, s1
0x12e28fa376a4   284  1e211de1       fcsel s1, s15, s1, ne
0x12e28fa376a8   288  1e202028       fcmp s1, #0.0
0x12e28fa376ac   28c  1e2fcc21       fcsel s1, s1, s15, gt
0x12e28fa376b0   290  1e254021       frintm s1, s1
0x12e28fa376b4   294  1e22c023       fcvt d3, s1
0x12e28fa376b8   298  1e65c064       frintz d4, d3
0x12e28fa376bc   29c  1e79009b       fcvtzu w27, d4
0x12e28fa376c0   2a0  1e630365       ucvtf d5, w27
0x12e28fa376c4   2a4  1e652080       fcmp d4, d5
0x12e28fa376c8   2a8  54002e81       b.ne #+0x5d0 (addr 0x12e28fa37c98)
0x12e28fa376cc   2ac  6b1b015f       cmp w10, w27
0x12e28fa376d0   2b0  1a9b315c       csel w28, w10, w27, lo
0x12e28fa376d4   2b4  1e222020       fcmp s1, s2
0x12e28fa376d8   2b8  1a9f339b       csel w27, w28, wzr, lo
0x12e28fa376dc   2bc  1b0f6779       madd w25, w27, w15, w25
0x12e28fa376e0   2c0  6b19017f       cmp w11, w25
0x12e28fa376e4   2c4  540000a9       b.ls #+0x14 (addr 0x12e28fa376f8)
0x12e28fa376e8   2c8  0b190a99       add w25, w20, w25, lsl #2
0x12e28fa376ec   2cc  b87968db       ldr w27, [x6, x25]
0x12e28fa376f0   2d0  1100077b       add w27, w27, #0x1 (1)
0x12e28fa376f4   2d4  b83968db       str w27, [x6, x25]
0x12e28fa376f8   2d8  110012f7       add w23, w23, #0x4 (4)
0x12e28fa376fc   2dc  110012d6       add w22, w22, #0x4 (4)
0x12e28fa37700   2e0  510006b5       sub w21, w21, #0x1 (1)
0x12e28fa37704   2e4  35fff995       cbnz w21, #-0xd0 (addr 0x12e28fa37634)
0x12e28fa37708   2e8  f90007f4       str x20, [sp, #8]
0x12e28fa3770c   2ec  3500006b       cbnz w11, #+0xc (addr 0x12e28fa37718)
0x12e28fa37710   2f0  aa0e03ea       mov x10, x14
0x12e28fa37714   2f4  1400008f       b #+0x23c (addr 0x12e28fa37950)
0x12e28fa37718   2f8  531e7565       lsl w5, w11, #2
0x12e28fa3771c   2fc  510010aa       sub w10, w5, #0x4 (4)
0x12e28fa37720   300  53027d4f       lsr w15, w10, #2
0x12e28fa37724   304  110005ef       add w15, w15, #0x1 (1)
0x12e28fa37728   308  120009f3       and w19, w15, #0x7
0x12e28fa3772c   30c  f90033e5       str x5, [sp, #96]
0x12e28fa37730   310  7100715f       cmp w10, #0x1c (28)
0x12e28fa37734   314  54000563       b.lo #+0xac (addr 0x12e28fa377e0)
0x12e28fa37738   318  121d6dea       and w10, w15, #0x7ffffff8
0x12e28fa3773c   31c  aa1403ef       mov x15, x20
0x12e28fa37740   320  aa0e03f5       mov x21, x14
0x12e28fa37744   324  f8520356       ldur x22, [x26, #-224]
0x12e28fa37748   328  eb3663ff       cmp sp, x22
0x12e28fa3774c   32c  54002b69       b.ls #+0x56c (addr 0x12e28fa37cb8)
0x12e28fa37750   330  b86f68d6       ldr w22, [x6, x15]
0x12e28fa37754   334  0b1502d5       add w21, w22, w21
0x12e28fa37758   338  b82f68d5       str w21, [x6, x15]
0x12e28fa3775c   33c  110011f6       add w22, w15, #0x4 (4)
0x12e28fa37760   340  b87668d7       ldr w23, [x6, x22]
0x12e28fa37764   344  0b1502f5       add w21, w23, w21
0x12e28fa37768   348  b83668d5       str w21, [x6, x22]
0x12e28fa3776c   34c  110021f6       add w22, w15, #0x8 (8)
0x12e28fa37770   350  b87668d7       ldr w23, [x6, x22]
0x12e28fa37774   354  0b1502f5       add w21, w23, w21
0x12e28fa37778   358  b83668d5       str w21, [x6, x22]
0x12e28fa3777c   35c  110031f6       add w22, w15, #0xc (12)
0x12e28fa37780   360  b87668d7       ldr w23, [x6, x22]
0x12e28fa37784   364  0b1502f5       add w21, w23, w21
0x12e28fa37788   368  b83668d5       str w21, [x6, x22]
0x12e28fa3778c   36c  110041f6       add w22, w15, #0x10 (16)
0x12e28fa37790   370  b87668d7       ldr w23, [x6, x22]
0x12e28fa37794   374  0b1502f5       add w21, w23, w21
0x12e28fa37798   378  b83668d5       str w21, [x6, x22]
0x12e28fa3779c   37c  110051f6       add w22, w15, #0x14 (20)
0x12e28fa377a0   380  b87668d7       ldr w23, [x6, x22]
0x12e28fa377a4   384  0b1502f5       add w21, w23, w21
0x12e28fa377a8   388  b83668d5       str w21, [x6, x22]
0x12e28fa377ac   38c  110061f6       add w22, w15, #0x18 (24)
0x12e28fa377b0   390  b87668d7       ldr w23, [x6, x22]
0x12e28fa377b4   394  0b1502f5       add w21, w23, w21
0x12e28fa377b8   398  b83668d5       str w21, [x6, x22]
0x12e28fa377bc   39c  110071f6       add w22, w15, #0x1c (28)
0x12e28fa377c0   3a0  b87668d7       ldr w23, [x6, x22]
0x12e28fa377c4   3a4  0b1502f5       add w21, w23, w21
0x12e28fa377c8   3a8  b83668d5       str w21, [x6, x22]
0x12e28fa377cc   3ac  110081ef       add w15, w15, #0x20 (32)
0x12e28fa377d0   3b0  5100214a       sub w10, w10, #0x8 (8)
0x12e28fa377d4   3b4  35fffb8a       cbnz w10, #-0x90 (addr 0x12e28fa37744)
0x12e28fa377d8   3b8  35000093       cbnz w19, #+0x10 (addr 0x12e28fa377e8)
0x12e28fa377dc   3bc  1400001f       b #+0x7c (addr 0x12e28fa37858)
0x12e28fa377e0   3c0  aa0e03f5       mov x21, x14
0x12e28fa377e4   3c4  aa1403ef       mov x15, x20
0x12e28fa377e8   3c8  531e766a       lsl w10, w19, #2
0x12e28fa377ec   3cc  b86f68d3       ldr w19, [x6, x15]
0x12e28fa377f0   3d0  0b150273       add w19, w19, w21
0x12e28fa377f4   3d4  b82f68d3       str w19, [x6, x15]
0x12e28fa377f8   3d8  110011ef       add w15, w15, #0x4 (4)
0x12e28fa377fc   3dc  5100114a       sub w10, w10, #0x4 (4)
0x12e28fa37800   3e0  340002ca       cbz w10, #+0x58 (addr 0x12e28fa37858)
0x12e28fa37804   3e4  b86f68d5       ldr w21, [x6, x15]
0x12e28fa37808   3e8  0b1302b3       add w19, w21, w19
0x12e28fa3780c   3ec  b82f68d3       str w19, [x6, x15]
0x12e28fa37810   3f0  110011ef       add w15, w15, #0x4 (4)
0x12e28fa37814   3f4  5100114a       sub w10, w10, #0x4 (4)
0x12e28fa37818   3f8  3400020a       cbz w10, #+0x40 (addr 0x12e28fa37858)
0x12e28fa3781c   3fc  b86f68d5       ldr w21, [x6, x15]
0x12e28fa37820   400  0b1302b3       add w19, w21, w19
0x12e28fa37824   404  b82f68d3       str w19, [x6, x15]
0x12e28fa37828   408  110011ef       add w15, w15, #0x4 (4)
0x12e28fa3782c   40c  5100114a       sub w10, w10, #0x4 (4)
0x12e28fa37830   410  3400014a       cbz w10, #+0x28 (addr 0x12e28fa37858)
0x12e28fa37834   414  f8520355       ldur x21, [x26, #-224]
0x12e28fa37838   418  eb3563ff       cmp sp, x21
0x12e28fa3783c   41c  540026e9       b.ls #+0x4dc (addr 0x12e28fa37d18)
0x12e28fa37840   420  b86f68d5       ldr w21, [x6, x15]
0x12e28fa37844   424  0b1302b5       add w21, w21, w19
0x12e28fa37848   428  b82f68d5       str w21, [x6, x15]
0x12e28fa3784c   42c  110011ef       add w15, w15, #0x4 (4)
0x12e28fa37850   430  5100114a       sub w10, w10, #0x4 (4)
0x12e28fa37854   434  35fffcca       cbnz w10, #-0x68 (addr 0x12e28fa377ec)
0x12e28fa37858   438  9100510a       add x10, x8, #0x14 (20)
0x12e28fa3785c   43c  b82a68df       str wzr, [x6, x10]
0x12e28fa37860   440  9100310f       add x15, x8, #0xc (12)
0x12e28fa37864   444  b86f68cf       ldr w15, [x6, x15]
0x12e28fa37868   448  f9003bea       str x10, [sp, #112]
0x12e28fa3786c   44c  6b0f017f       cmp w11, w15
0x12e28fa37870   450  54000309       b.ls #+0x60 (addr 0x12e28fa378d0)
0x12e28fa37874   454  aa0003ef       mov x15, x0
0x12e28fa37878   458  110031e0       add w0, w15, #0xc (12)
0x12e28fa3787c   45c  aa0b03e3       mov x3, x11
0x12e28fa37880   460  aa0e03e2       mov x2, x14
0x12e28fa37884   464  97fc077f       bl #-0xfe204 (addr 0x12e28f939680)
0x12e28fa37888   468  f9403fe6       ldr x6, [sp, #120]
0x12e28fa3788c   46c  f9403be8       ldr x8, [sp, #112]
0x12e28fa37890   470  b86868c8       ldr w8, [x6, x8]
0x12e28fa37894   474  aa0803ea       mov x10, x8
0x12e28fa37898   478  f94047ed       ldr x13, [sp, #136]
0x12e28fa3789c   47c  d280000e       movz x14, #0x0
0x12e28fa378a0   480  f9401be4       ldr x4, [sp, #48]
0x12e28fa378a4   484  f94017e2       ldr x2, [sp, #40]
0x12e28fa378a8   488  f94043e8       ldr x8, [sp, #128]
0x12e28fa378ac   48c  f9400fec       ldr x12, [sp, #24]
0x12e28fa378b0   490  f9400be9       ldr x9, [sp, #16]
0x12e28fa378b4   494  f9401fe3       ldr x3, [sp, #56]
0x12e28fa378b8   498  f9404be7       ldr x7, [sp, #144]
0x12e28fa378bc   49c  f94013e0       ldr x0, [sp, #32]
0x12e28fa378c0   4a0  f94037eb       ldr x11, [sp, #104]
0x12e28fa378c4   4a4  f94033e5       ldr x5, [sp, #96]
0x12e28fa378c8   4a8  f94007f4       ldr x20, [sp, #8]
0x12e28fa378cc   4ac  14000002       b #+0x8 (addr 0x12e28fa378d4)
0x12e28fa378d0   4b0  aa0e03ea       mov x10, x14
0x12e28fa378d4   4b4  531e756f       lsl w15, w11, #2
0x12e28fa378d8   4b8  f9003bea       str x10, [sp, #112]
0x12e28fa378dc   4bc  340003af       cbz w15, #+0x74 (addr 0x12e28fa37950)
0x12e28fa378e0   4c0  9100410f       add x15, x8, #0x10 (16)
0x12e28fa378e4   4c4  b86f68cf       ldr w15, [x6, x15]
0x12e28fa378e8   4c8  0b0a09ef       add w15, w15, w10, lsl #2
0x12e28fa378ec   4cc  aa0703e0       mov x0, x7
0x12e28fa378f0   4d0  aa0e03e1       mov x1, x14
0x12e28fa378f4   4d4  aa0e03e2       mov x2, x14
0x12e28fa378f8   4d8  aa0f03e3       mov x3, x15
0x12e28fa378fc   4dc  aa1403e4       mov x4, x20
0x12e28fa37900   4e0  580029d0       ldr x16, pc+1336 (addr 0x000012e28fa37e38)
0x12e28fa37904   4e4  10000068       adr x8, #+0xc (addr 0x12e28fa37910)
0x12e28fa37908   4e8  a9027748       stp x8, fp, [x26, #32]
0x12e28fa3790c   4ec  d63f0200       blr x16
0x12e28fa37910   4f0  f900175f       str xzr, [x26, #40]
0x12e28fa37914   4f4  6a00001f       tst w0, w0
0x12e28fa37918   4f8  54002840       b.eq #+0x508 (addr 0x12e28fa37e20)
0x12e28fa3791c   4fc  f9403bea       ldr x10, [sp, #112]
0x12e28fa37920   500  f94047ed       ldr x13, [sp, #136]
0x12e28fa37924   504  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37928   508  d280000e       movz x14, #0x0
0x12e28fa3792c   50c  f9401be4       ldr x4, [sp, #48]
0x12e28fa37930   510  f94017e2       ldr x2, [sp, #40]
0x12e28fa37934   514  f94043e8       ldr x8, [sp, #128]
0x12e28fa37938   518  f9400fec       ldr x12, [sp, #24]
0x12e28fa3793c   51c  f9400be9       ldr x9, [sp, #16]
0x12e28fa37940   520  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37944   524  f9404be7       ldr x7, [sp, #144]
0x12e28fa37948   528  f94013e0       ldr x0, [sp, #32]
0x12e28fa3794c   52c  f94037eb       ldr x11, [sp, #104]
0x12e28fa37950   530  9100810f       add x15, x8, #0x20 (32)
0x12e28fa37954   534  b82f68df       str wzr, [x6, x15]
0x12e28fa37958   538  0b0b014a       add w10, w10, w11
0x12e28fa3795c   53c  9100510b       add x11, x8, #0x14 (20)
0x12e28fa37960   540  b82b68ca       str w10, [x6, x11]
0x12e28fa37964   544  f9003bef       str x15, [sp, #112]
0x12e28fa37968   548  f9002feb       str x11, [sp, #88]
0x12e28fa3796c   54c  35000063       cbnz w3, #+0xc (addr 0x12e28fa37978)
0x12e28fa37970   550  aa0e03ea       mov x10, x14
0x12e28fa37974   554  14000048       b #+0x120 (addr 0x12e28fa37a94)
0x12e28fa37978   558  9100610a       add x10, x8, #0x18 (24)
0x12e28fa3797c   55c  b86a68ca       ldr w10, [x6, x10]
0x12e28fa37980   560  6b0a007f       cmp w3, w10
0x12e28fa37984   564  540002a9       b.ls #+0x54 (addr 0x12e28fa379d8)
0x12e28fa37988   568  aa0003ea       mov x10, x0
0x12e28fa3798c   56c  11006140       add w0, w10, #0x18 (24)
0x12e28fa37990   570  aa0e03e2       mov x2, x14
0x12e28fa37994   574  97fc073b       bl #-0xfe314 (addr 0x12e28f939680)
0x12e28fa37998   578  f9403fe6       ldr x6, [sp, #120]
0x12e28fa3799c   57c  f9403be8       ldr x8, [sp, #112]
0x12e28fa379a0   580  b86868c9       ldr w9, [x6, x8]
0x12e28fa379a4   584  aa0903ea       mov x10, x9
0x12e28fa379a8   588  f94047ed       ldr x13, [sp, #136]
0x12e28fa379ac   58c  d280000e       movz x14, #0x0
0x12e28fa379b0   590  f9401be4       ldr x4, [sp, #48]
0x12e28fa379b4   594  f94017e2       ldr x2, [sp, #40]
0x12e28fa379b8   598  aa0803ef       mov x15, x8
0x12e28fa379bc   59c  f94043e8       ldr x8, [sp, #128]
0x12e28fa379c0   5a0  f9402feb       ldr x11, [sp, #88]
0x12e28fa379c4   5a4  f9400fec       ldr x12, [sp, #24]
0x12e28fa379c8   5a8  f9400be9       ldr x9, [sp, #16]
0x12e28fa379cc   5ac  f9401fe3       ldr x3, [sp, #56]
0x12e28fa379d0   5b0  f9404be7       ldr x7, [sp, #144]
0x12e28fa379d4   5b4  14000002       b #+0x8 (addr 0x12e28fa379dc)
0x12e28fa379d8   5b8  aa0e03ea       mov x10, x14
0x12e28fa379dc   5bc  91007113       add x19, x8, #0x1c (28)
0x12e28fa379e0   5c0  b87368d3       ldr w19, [x6, x19]
0x12e28fa379e4   5c4  0b0a0a74       add w20, w19, w10, lsl #2
0x12e28fa379e8   5c8  f90037ea       str x10, [sp, #104]
0x12e28fa379ec   5cc  f90033f3       str x19, [sp, #96]
0x12e28fa379f0   5d0  aa0303f5       mov x21, x3
0x12e28fa379f4   5d4  710006bf       cmp w21, #0x1 (1)
0x12e28fa379f8   5d8  540004a0       b.eq #+0x94 (addr 0x12e28fa37a8c)
0x12e28fa379fc   5dc  531e76b6       lsl w22, w21, #2
0x12e28fa37a00   5e0  510012d6       sub w22, w22, #0x4 (4)
0x12e28fa37a04   5e4  34000356       cbz w22, #+0x68 (addr 0x12e28fa37a6c)
0x12e28fa37a08   5e8  aa0703e0       mov x0, x7
0x12e28fa37a0c   5ec  aa0e03e1       mov x1, x14
0x12e28fa37a10   5f0  aa1403e2       mov x2, x20
0x12e28fa37a14   5f4  aa0e03e3       mov x3, x14
0x12e28fa37a18   5f8  aa1603e4       mov x4, x22
0x12e28fa37a1c   5fc  58002130       ldr x16, pc+1060 (addr 0x000012e28fa37e40)    ;; external reference (wasm::memory_fill)
0x12e28fa37a20   600  10000068       adr x8, #+0xc (addr 0x12e28fa37a2c)
0x12e28fa37a24   604  a9027748       stp x8, fp, [x26, #32]
0x12e28fa37a28   608  d63f0200       blr x16
0x12e28fa37a2c   60c  f900175f       str xzr, [x26, #40]
0x12e28fa37a30   610  6a00001f       tst w0, w0
0x12e28fa37a34   614  54001f40       b.eq #+0x3e8 (addr 0x12e28fa37e1c)
0x12e28fa37a38   618  f94047ed       ldr x13, [sp, #136]
0x12e28fa37a3c   61c  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37a40   620  d280000e       movz x14, #0x0
0x12e28fa37a44   624  f9401be4       ldr x4, [sp, #48]
0x12e28fa37a48   628  f94017e2       ldr x2, [sp, #40]
0x12e28fa37a4c   62c  f94043e8       ldr x8, [sp, #128]
0x12e28fa37a50   630  f9402feb       ldr x11, [sp, #88]
0x12e28fa37a54   634  f9400fec       ldr x12, [sp, #24]
0x12e28fa37a58   638  f9400be9       ldr x9, [sp, #16]
0x12e28fa37a5c   63c  f9403bef       ldr x15, [sp, #112]
0x12e28fa37a60   640  f94037ea       ldr x10, [sp, #104]
0x12e28fa37a64   644  f94033f3       ldr x19, [sp, #96]
0x12e28fa37a68   648  f9401ff5       ldr x21, [sp, #56]
0x12e28fa37a6c   64c  aa1503f4       mov x20, x21
0x12e28fa37a70   650  0b14014a       add w10, w10, w20
0x12e28fa37a74   654  51000554       sub w20, w10, #0x1 (1)
0x12e28fa37a78   658  0b0a0a6a       add w10, w19, w10, lsl #2
0x12e28fa37a7c   65c  5100114a       sub w10, w10, #0x4 (4)
0x12e28fa37a80   660  aa0a03f0       mov x16, x10
0x12e28fa37a84   664  aa1403ea       mov x10, x20
0x12e28fa37a88   668  aa1003f4       mov x20, x16
0x12e28fa37a8c   66c  b83468df       str wzr, [x6, x20]
0x12e28fa37a90   670  1100054a       add w10, w10, #0x1 (1)
0x12e28fa37a94   674  b82f68ca       str w10, [x6, x15]
0x12e28fa37a98   678  3500008d       cbnz w13, #+0x10 (addr 0x12e28fa37aa8)
0x12e28fa37a9c   67c  910003bf       mov sp, fp
0x12e28fa37aa0   680  a8c17bfd       ldp fp, lr, [sp], #16
0x12e28fa37aa4   684  d65f03c0       ret
0x12e28fa37aa8   688  b86968c9       ldr w9, [x6, x9]
0x12e28fa37aac   68c  7100013f       cmp w9, #0x0 (0)
0x12e28fa37ab0   690  9a9f07ef       cset x15, ne
0x12e28fa37ab4   694  4b0f0129       sub w9, w9, w15
0x12e28fa37ab8   698  b86c68cc       ldr w12, [x6, x12]
0x12e28fa37abc   69c  7100019f       cmp w12, #0x0 (0)
0x12e28fa37ac0   6a0  9a9f07ef       cset x15, ne
0x12e28fa37ac4   6a4  4b0f018f       sub w15, w12, w15
0x12e28fa37ac8   6a8  91007113       add x19, x8, #0x1c (28)
0x12e28fa37acc   6ac  b87368d3       ldr w19, [x6, x19]
0x12e28fa37ad0   6b0  91004114       add x20, x8, #0x10 (16)
0x12e28fa37ad4   6b4  b87468d4       ldr w20, [x6, x20]
0x12e28fa37ad8   6b8  b86b68cb       ldr w11, [x6, x11]
0x12e28fa37adc   6bc  91009108       add x8, x8, #0x24 (36)
0x12e28fa37ae0   6c0  bc6868c0       ldr s0, [x6, x8]
0x12e28fa37ae4   6c4  aa0e03e8       mov x8, x14
0x12e28fa37ae8   6c8  f8520355       ldur x21, [x26, #-224]
0x12e28fa37aec   6cc  eb3563ff       cmp sp, x21
0x12e28fa37af0   6d0  54001409       b.ls #+0x280 (addr 0x12e28fa37d70)
0x12e28fa37af4   6d4  2a0403f5       mov w21, w4
0x12e28fa37af8   6d8  bc7568c1       ldr s1, [x6, x21]
0x12e28fa37afc   6dc  1e200821       fmul s1, s1, s0
0x12e28fa37b00   6e0  1e212020       fcmp s1, s1
0x12e28fa37b04   6e4  1e211de1       fcsel s1, s15, s1, ne
0x12e28fa37b08   6e8  1e202028       fcmp s1, #0.0
0x12e28fa37b0c   6ec  1e2fcc21       fcsel s1, s1, s15, gt
0x12e28fa37b10   6f0  1e254021       frintm s1, s1
0x12e28fa37b14   6f4  1e22c022       fcvt d2, s1
0x12e28fa37b18   6f8  1e65c043       frintz d3, d2
0x12e28fa37b1c   6fc  1e790075       fcvtzu w21, d3
0x12e28fa37b20   700  1e6302a4       ucvtf d4, w21
0x12e28fa37b24   704  1e642060       fcmp d3, d4
0x12e28fa37b28   708  540015a1       b.ne #+0x2b4 (addr 0x12e28fa37ddc)
0x12e28fa37b2c   70c  6b15013f       cmp w9, w21
0x12e28fa37b30   710  1a953136       csel w22, w9, w21, lo
0x12e28fa37b34   714  52a9f010       movz w16, #0x4f800000
0x12e28fa37b38   718  1e270202       fmov s2, w16
0x12e28fa37b3c   71c  1e222020       fcmp s1, s2
0x12e28fa37b40   720  1a9f32d5       csel w21, w22, wzr, lo
0x12e28fa37b44   724  1b0c7eb5       mul w21, w21, w12
0x12e28fa37b48   728  2a0203f6       mov w22, w2
0x12e28fa37b4c   72c  bc7668c1       ldr s1, [x6, x22]
0x12e28fa37b50   730  1e200821       fmul s1, s1, s0
0x12e28fa37b54   734  1e212020       fcmp s1, s1
0x12e28fa37b58   738  1e211de1       fcsel s1, s15, s1, ne
0x12e28fa37b5c   73c  1e202028       fcmp s1, #0.0
0x12e28fa37b60   740  1e2fcc21       fcsel s1, s1, s15, gt
0x12e28fa37b64   744  1e254021       frintm s1, s1
0x12e28fa37b68   748  1e22c023       fcvt d3, s1
0x12e28fa37b6c   74c  1e65c064       frintz d4, d3
0x12e28fa37b70   750  1e790096       fcvtzu w22, d4
0x12e28fa37b74   754  1e6302c5       ucvtf d5, w22
0x12e28fa37b78   758  1e652080       fcmp d4, d5
0x12e28fa37b7c   75c  54001401       b.ne #+0x280 (addr 0x12e28fa37dfc)
0x12e28fa37b80   760  6b1601ff       cmp w15, w22
0x12e28fa37b84   764  1a9631f7       csel w23, w15, w22, lo
0x12e28fa37b88   768  1e222020       fcmp s1, s2
0x12e28fa37b8c   76c  1a9f32f6       csel w22, w23, wzr, lo
0x12e28fa37b90   770  0b1602b5       add w21, w21, w22
0x12e28fa37b94   774  6b15017f       cmp w11, w21
0x12e28fa37b98   778  54000149       b.ls #+0x28 (addr 0x12e28fa37bc0)
0x12e28fa37b9c   77c  0b150a95       add w21, w20, w21, lsl #2
0x12e28fa37ba0   780  b87568d6       ldr w22, [x6, x21]
0x12e28fa37ba4   784  6b16015f       cmp w10, w22
0x12e28fa37ba8   788  54000089       b.ls #+0x10 (addr 0x12e28fa37bb8)
0x12e28fa37bac   78c  0b160a76       add w22, w19, w22, lsl #2
0x12e28fa37bb0   790  b83668c8       str w8, [x6, x22]
0x12e28fa37bb4   794  b87568d6       ldr w22, [x6, x21]
0x12e28fa37bb8   798  110006d6       add w22, w22, #0x1 (1)
0x12e28fa37bbc   79c  b83568d6       str w22, [x6, x21]
0x12e28fa37bc0   7a0  11001042       add w2, w2, #0x4 (4)
0x12e28fa37bc4   7a4  11001084       add w4, w4, #0x4 (4)
0x12e28fa37bc8   7a8  11000508       add w8, w8, #0x1 (1)
0x12e28fa37bcc   7ac  6b0801bf       cmp w13, w8
0x12e28fa37bd0   7b0  54fff660       b.eq #-0x134 (addr 0x12e28fa37a9c)
0x12e28fa37bd4   7b4  17ffffc5       b #-0xec (addr 0x12e28fa37ae8)
0x12e28fa37bd8   7b8  97fc07fe       bl #-0xfe008 (addr 0x12e28f939bd0)
0x12e28fa37bdc   7bc  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37be0   7c0  f9401be4       ldr x4, [sp, #48]
0x12e28fa37be4   7c4  f94017e2       ldr x2, [sp, #40]
0x12e28fa37be8   7c8  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37bec   7cc  f9404be7       ldr x7, [sp, #144]
0x12e28fa37bf0   7d0  f94013e0       ldr x0, [sp, #32]
0x12e28fa37bf4   7d4  f94027e5       ldr x5, [sp, #72]
0x12e28fa37bf8   7d8  17fffe19       b #-0x79c (addr 0x12e28fa3745c)
0x12e28fa37bfc   7dc  f90007f4       str x20, [sp, #8]
0x12e28fa37c00   7e0  f9003bf5       str x21, [sp, #112]
0x12e28fa37c04   7e4  f90023f6       str x22, [sp, #64]
0x12e28fa37c08   7e8  f90003f7       str x23, [sp]
0x12e28fa37c0c   7ec  f90033ef       str x15, [sp, #96]
0x12e28fa37c10   7f0  f9002fea       str x10, [sp, #88]
0x12e28fa37c14   7f4  fd002be0       str d0, [sp, #80]
0x12e28fa37c18   7f8  f90027f3       str x19, [sp, #72]
0x12e28fa37c1c   7fc  97fc07ed       bl #-0xfe04c (addr 0x12e28f939bd0)
0x12e28fa37c20   800  f94047ed       ldr x13, [sp, #136]
0x12e28fa37c24   804  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37c28   808  d280000e       movz x14, #0x0
0x12e28fa37c2c   80c  f9401be4       ldr x4, [sp, #48]
0x12e28fa37c30   810  f94017e2       ldr x2, [sp, #40]
0x12e28fa37c34   814  f94043e8       ldr x8, [sp, #128]
0x12e28fa37c38   818  f9400fec       ldr x12, [sp, #24]
0x12e28fa37c3c   81c  f9400be9       ldr x9, [sp, #16]
0x12e28fa37c40   820  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37c44   824  f9404be7       ldr x7, [sp, #144]
0x12e28fa37c48   828  f94013e0       ldr x0, [sp, #32]
0x12e28fa37c4c   82c  f94037eb       ldr x11, [sp, #104]
0x12e28fa37c50   830  f94007f4       ldr x20, [sp, #8]
0x12e28fa37c54   834  f9403bf5       ldr x21, [sp, #112]
0x12e28fa37c58   838  f94023f6       ldr x22, [sp, #64]
0x12e28fa37c5c   83c  f94003f7       ldr x23, [sp]
0x12e28fa37c60   840  f94033ef       ldr x15, [sp, #96]
0x12e28fa37c64   844  f9402fea       ldr x10, [sp, #88]
0x12e28fa37c68   848  fd402be0       ldr d0, [sp, #80]
0x12e28fa37c6c   84c  d2800038       movz x24, #0x1
0x12e28fa37c70   850  f94027f3       ldr x19, [sp, #72]
0x12e28fa37c74   854  17fffe73       b #-0x634 (addr 0x12e28fa37640)
0x12e28fa37c78   858  1e622040       fcmp d2, d2
0x12e28fa37c7c   85c  54000060       b.eq #+0xc (addr 0x12e28fa37c88)
0x12e28fa37c80   860  aa0e03f9       mov x25, x14
0x12e28fa37c84   864  17fffe7d       b #-0x60c (addr 0x12e28fa37678)
0x12e28fa37c88   868  1e202028       fcmp s1, #0.0
0x12e28fa37c8c   86c  54ffffa3       b.lo #-0xc (addr 0x12e28fa37c80)
0x12e28fa37c90   870  92800019       movn x25, #0x0
0x12e28fa37c94   874  17fffe79       b #-0x61c (addr 0x12e28fa37678)
0x12e28fa37c98   878  1e632060       fcmp d3, d3
0x12e28fa37c9c   87c  54000060       b.eq #+0xc (addr 0x12e28fa37ca8)
0x12e28fa37ca0   880  aa0e03fb       mov cp, x14
0x12e28fa37ca4   884  17fffe8a       b #-0x5d8 (addr 0x12e28fa376cc)
0x12e28fa37ca8   888  1e202028       fcmp s1, #0.0
0x12e28fa37cac   88c  54ffffa3       b.lo #-0xc (addr 0x12e28fa37ca0)
0x12e28fa37cb0   890  9280001b       movn cp, #0x0
0x12e28fa37cb4   894  17fffe86       b #-0x5e8 (addr 0x12e28fa376cc)
0x12e28fa37cb8   898  f9003bf3       str x19, [sp, #112]
0x12e28fa37cbc   89c  f9002bea       str x10, [sp, #80]
0x12e28fa37cc0   8a0  f90027ef       str x15, [sp, #72]
0x12e28fa37cc4   8a4  f9002ff5       str x21, [sp, #88]
0x12e28fa37cc8   8a8  97fc07c2       bl #-0xfe0f8 (addr 0x12e28f939bd0)
0x12e28fa37ccc   8ac  f94047ed       ldr x13, [sp, #136]
0x12e28fa37cd0   8b0  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37cd4   8b4  d280000e       movz x14, #0x0
0x12e28fa37cd8   8b8  f9401be4       ldr x4, [sp, #48]
0x12e28fa37cdc   8bc  f94017e2       ldr x2, [sp, #40]
0x12e28fa37ce0   8c0  f94043e8       ldr x8, [sp, #128]
0x12e28fa37ce4   8c4  f9400fec       ldr x12, [sp, #24]
0x12e28fa37ce8   8c8  f9400be9       ldr x9, [sp, #16]
0x12e28fa37cec   8cc  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37cf0   8d0  f9404be7       ldr x7, [sp, #144]
0x12e28fa37cf4   8d4  f94013e0       ldr x0, [sp, #32]
0x12e28fa37cf8   8d8  f94037eb       ldr x11, [sp, #104]
0x12e28fa37cfc   8dc  f94033e5       ldr x5, [sp, #96]
0x12e28fa37d00   8e0  f94007f4       ldr x20, [sp, #8]
0x12e28fa37d04   8e4  f9403bf3       ldr x19, [sp, #112]
0x12e28fa37d08   8e8  f9402bea       ldr x10, [sp, #80]
0x12e28fa37d0c   8ec  f94027ef       ldr x15, [sp, #72]
0x12e28fa37d10   8f0  f9402ff5       ldr x21, [sp, #88]
0x12e28fa37d14   8f4  17fffe8f       b #-0x5c4 (addr 0x12e28fa37750)
0x12e28fa37d18   8f8  f9003bea       str x10, [sp, #112]
0x12e28fa37d1c   8fc  f90023ef       str x15, [sp, #64]
0x12e28fa37d20   900  f9002bf3       str x19, [sp, #80]
0x12e28fa37d24   904  97fc07ab       bl #-0xfe154 (addr 0x12e28f939bd0)
0x12e28fa37d28   908  f94047ed       ldr x13, [sp, #136]
0x12e28fa37d2c   90c  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37d30   910  d280000e       movz x14, #0x0
0x12e28fa37d34   914  f9401be4       ldr x4, [sp, #48]
0x12e28fa37d38   918  f94017e2       ldr x2, [sp, #40]
0x12e28fa37d3c   91c  f94043e8       ldr x8, [sp, #128]
0x12e28fa37d40   920  f9400fec       ldr x12, [sp, #24]
0x12e28fa37d44   924  f9400be9       ldr x9, [sp, #16]
0x12e28fa37d48   928  f9401fe3       ldr x3, [sp, #56]
0x12e28fa37d4c   92c  f9404be7       ldr x7, [sp, #144]
0x12e28fa37d50   930  f94013e0       ldr x0, [sp, #32]
0x12e28fa37d54   934  f94037eb       ldr x11, [sp, #104]
0x12e28fa37d58   938  f94033e5       ldr x5, [sp, #96]
0x12e28fa37d5c   93c  f94007f4       ldr x20, [sp, #8]
0x12e28fa37d60   940  f9403bea       ldr x10, [sp, #112]
0x12e28fa37d64   944  f94023ef       ldr x15, [sp, #64]
0x12e28fa37d68   948  f9402bf3       ldr x19, [sp, #80]
0x12e28fa37d6c   94c  17fffeb5       b #-0x52c (addr 0x12e28fa37840)
0x12e28fa37d70   950  f90043e8       str x8, [sp, #128]
0x12e28fa37d74   954  f9001be4       str x4, [sp, #48]
0x12e28fa37d78   958  f90017e2       str x2, [sp, #40]
0x12e28fa37d7c   95c  f9003bf3       str x19, [sp, #112]
0x12e28fa37d80   960  f90037ea       str x10, [sp, #104]
0x12e28fa37d84   964  f90033f4       str x20, [sp, #96]
0x12e28fa37d88   968  f9002feb       str x11, [sp, #88]
0x12e28fa37d8c   96c  f9002bef       str x15, [sp, #80]
0x12e28fa37d90   970  fd0027e0       str d0, [sp, #72]
0x12e28fa37d94   974  f90023ec       str x12, [sp, #64]
0x12e28fa37d98   978  f9001fe9       str x9, [sp, #56]
0x12e28fa37d9c   97c  97fc078d       bl #-0xfe1cc (addr 0x12e28f939bd0)
0x12e28fa37da0   980  f94047ed       ldr x13, [sp, #136]
0x12e28fa37da4   984  f94043e8       ldr x8, [sp, #128]
0x12e28fa37da8   988  f9401be4       ldr x4, [sp, #48]
0x12e28fa37dac   98c  f94017e2       ldr x2, [sp, #40]
0x12e28fa37db0   990  f9403fe6       ldr x6, [sp, #120]
0x12e28fa37db4   994  f9403bf3       ldr x19, [sp, #112]
0x12e28fa37db8   998  f94037ea       ldr x10, [sp, #104]
0x12e28fa37dbc   99c  f94033f4       ldr x20, [sp, #96]
0x12e28fa37dc0   9a0  f9402feb       ldr x11, [sp, #88]
0x12e28fa37dc4   9a4  f9402bef       ldr x15, [sp, #80]
0x12e28fa37dc8   9a8  d280000e       movz x14, #0x0
0x12e28fa37dcc   9ac  fd4027e0       ldr d0, [sp, #72]
0x12e28fa37dd0   9b0  f94023ec       ldr x12, [sp, #64]
0x12e28fa37dd4   9b4  f9401fe9       ldr x9, [sp, #56]
0x12e28fa37dd8   9b8  17ffff47       b #-0x2e4 (addr 0x12e28fa37af4)
0x12e28fa37ddc   9bc  1e622040       fcmp d2, d2
0x12e28fa37de0   9c0  54000060       b.eq #+0xc (addr 0x12e28fa37dec)
0x12e28fa37de4   9c4  aa0e03f5       mov x21, x14
0x12e28fa37de8   9c8  17ffff51       b #-0x2bc (addr 0x12e28fa37b2c)
0x12e28fa37dec   9cc  1e202028       fcmp s1, #0.0
0x12e28fa37df0   9d0  54ffffa3       b.lo #-0xc (addr 0x12e28fa37de4)
0x12e28fa37df4   9d4  92800015       movn x21, #0x0
0x12e28fa37df8   9d8  17ffff4d       b #-0x2cc (addr 0x12e28fa37b2c)
0x12e28fa37dfc   9dc  1e632060       fcmp d3, d3
0x12e28fa37e00   9e0  54000060       b.eq #+0xc (addr 0x12e28fa37e0c)
0x12e28fa37e04   9e4  aa0e03f6       mov x22, x14
0x12e28fa37e08   9e8  17ffff5e       b #-0x288 (addr 0x12e28fa37b80)
0x12e28fa37e0c   9ec  1e202028       fcmp s1, #0.0
0x12e28fa37e10   9f0  54ffffa3       b.lo #-0xc (addr 0x12e28fa37e04)
0x12e28fa37e14   9f4  92800016       movn x22, #0x0
0x12e28fa37e18   9f8  17ffff5a       b #-0x298 (addr 0x12e28fa37b80)
0x12e28fa37e1c   9fc  97fc06bd       bl #-0xfe50c (addr 0x12e28f939910)
0x12e28fa37e20   a00  97fc06bc       bl #-0xfe510 (addr 0x12e28f939910)
0x12e28fa37e24   a04  97fc06bb       bl #-0xfe514 (addr 0x12e28f939910)
0x12e28fa37e28   a08  d503201f       nop
0x12e28fa37e2c   a0c  580000df       constant pool begin (num_const = 6)
0x12e28fa37e30   a10  d63f03e0       constant
0x12e28fa37e34   a14  d503201f       constant
0x12e28fa37e38   a18  0504ea68       constant
0x12e28fa37e3c   a1c  00000001       constant
0x12e28fa37e40   a20  0504eaf4       constant
0x12e28fa37e44   a24  00000001       constant

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
0x12e28fa374bc     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0x12e28fa374b8  internal wasm call
0x12e28fa3753c  external reference (0x10504eaf4)
0x12e28fa37884  internal wasm call
0x12e28fa37900  external reference (0x10504ea68)
0x12e28fa37994  internal wasm call
0x12e28fa37bd8  wasm stub call  (0x12e28f939bd0)
0x12e28fa37c1c  wasm stub call  (0x12e28f939bd0)
0x12e28fa37cc8  wasm stub call  (0x12e28f939bd0)
0x12e28fa37d24  wasm stub call  (0x12e28f939bd0)
0x12e28fa37d9c  wasm stub call  (0x12e28f939bd0)
0x12e28fa37e1c  wasm stub call  (0x12e28f939910)
0x12e28fa37e20  wasm stub call  (0x12e28f939910)
0x12e28fa37e24  wasm stub call  (0x12e28f939910)
0x12e28fa37e2c  constant pool (size 28)
