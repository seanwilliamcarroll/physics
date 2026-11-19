name: _RNvMNtCshBZZPcGIfde_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 2624 = 2600 + 24 padding)
Instructions (size = 2584)
0xb9c900137c0     0  d2800110       movz x16, #0x8
0xb9c900137c4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0xb9c900137c8     8  a9017bfd       stp fp, lr, [sp, #16]
0xb9c900137cc     c  910043fd       add fp, sp, #0x10 (16)
0xb9c900137d0    10  d10243ff       sub sp, sp, #0x90 (144)
0xb9c900137d4    14  f841f0e6       ldur x6, [x7, #31]
0xb9c900137d8    18  f8520348       ldur x8, [x26, #-224]
0xb9c900137dc    1c  f90013e0       str x0, [sp, #32]
0xb9c900137e0    20  f90017e2       str x2, [sp, #40]
0xb9c900137e4    24  f9001fe3       str x3, [sp, #56]
0xb9c900137e8    28  f9001be4       str x4, [sp, #48]
0xb9c900137ec    2c  f90027e5       str x5, [sp, #72]
0xb9c900137f0    30  f9003fe6       str x6, [sp, #120]
0xb9c900137f4    34  eb2863ff       cmp sp, x8
0xb9c900137f8    38  54003b89       b.ls #+0x770 (addr 0xb9c90013f68)
0xb9c900137fc    3c  2a0003e8       mov w8, w0
0xb9c90013800    40  91002109       add x9, x8, #0x8 (8)
0xb9c90013804    44  b82968df       str wzr, [x6, x9]
0xb9c90013808    48  9100b10a       add x10, x8, #0x2c (44)
0xb9c9001380c    4c  b86a68cb       ldr w11, [x6, x10]
0xb9c90013810    50  9100a10c       add x12, x8, #0x28 (40)
0xb9c90013814    54  b86c68cd       ldr w13, [x6, x12]
0xb9c90013818    58  1b0d7d6b       mul w11, w11, w13
0xb9c9001381c    5c  1100056d       add w13, w11, #0x1 (1)
0xb9c90013820    60  f90043e8       str x8, [sp, #128]
0xb9c90013824    64  f90047e9       str x9, [sp, #136]
0xb9c90013828    68  f9000bea       str x10, [sp, #16]
0xb9c9001382c    6c  f9000fec       str x12, [sp, #24]
0xb9c90013830    70  f9002feb       str x11, [sp, #88]
0xb9c90013834    74  f9003bed       str x13, [sp, #112]
0xb9c90013838    78  3500006d       cbnz w13, #+0xc (addr 0xb9c90013844)
0xb9c9001383c    7c  d280000b       movz x11, #0x0
0xb9c90013840    80  14000047       b #+0x11c (addr 0xb9c9001395c)
0xb9c90013844    84  b86868ce       ldr w14, [x6, x8]
0xb9c90013848    88  6b0e01bf       cmp w13, w14
0xb9c9001384c    8c  540002a9       b.ls #+0x54 (addr 0xb9c900138a0)
0xb9c90013850    90  aa0d03e3       mov x3, x13
0xb9c90013854    94  d2800002       movz x2, #0x0
0xb9c90013858    98  97fc078a       bl #-0xfe1d8 (addr 0xb9c8ff15680)
0xb9c9001385c    9c  f9403fe6       ldr x6, [sp, #120]
0xb9c90013860    a0  f94047e8       ldr x8, [sp, #136]
0xb9c90013864    a4  b86868c9       ldr w9, [x6, x8]
0xb9c90013868    a8  aa0903ee       mov x14, x9
0xb9c9001386c    ac  f9401be4       ldr x4, [sp, #48]
0xb9c90013870    b0  f94017e2       ldr x2, [sp, #40]
0xb9c90013874    b4  aa0803e9       mov x9, x8
0xb9c90013878    b8  f94043e8       ldr x8, [sp, #128]
0xb9c9001387c    bc  f9400fec       ldr x12, [sp, #24]
0xb9c90013880    c0  f9400bea       ldr x10, [sp, #16]
0xb9c90013884    c4  f9401fe3       ldr x3, [sp, #56]
0xb9c90013888    c8  f9404be7       ldr x7, [sp, #144]
0xb9c9001388c    cc  f94013e0       ldr x0, [sp, #32]
0xb9c90013890    d0  f94027e5       ldr x5, [sp, #72]
0xb9c90013894    d4  f9403bed       ldr x13, [sp, #112]
0xb9c90013898    d8  f9402feb       ldr x11, [sp, #88]
0xb9c9001389c    dc  14000002       b #+0x8 (addr 0xb9c900138a4)
0xb9c900138a0    e0  d280000e       movz x14, #0x0
0xb9c900138a4    e4  9100110f       add x15, x8, #0x4 (4)
0xb9c900138a8    e8  b86f68cf       ldr w15, [x6, x15]
0xb9c900138ac    ec  0b0e09f3       add w19, w15, w14, lsl #2
0xb9c900138b0    f0  f90033ee       str x14, [sp, #96]
0xb9c900138b4    f4  f90037ef       str x15, [sp, #104]
0xb9c900138b8    f8  340004eb       cbz w11, #+0x9c (addr 0xb9c90013954)
0xb9c900138bc    fc  531e75b4       lsl w20, w13, #2
0xb9c900138c0   100  51001294       sub w20, w20, #0x4 (4)
0xb9c900138c4   104  34000394       cbz w20, #+0x70 (addr 0xb9c90013934)
0xb9c900138c8   108  aa0703e0       mov x0, x7
0xb9c900138cc   10c  d2800001       movz x1, #0x0
0xb9c900138d0   110  aa1303e2       mov x2, x19
0xb9c900138d4   114  aa1403e4       mov x4, x20
0xb9c900138d8   118  aa0103e3       mov x3, x1
0xb9c900138dc   11c  580047b0       ldr x16, pc+2292 (addr 0x00000b9c900141d0)
0xb9c900138e0   120  10000068       adr x8, #+0xc (addr 0xb9c900138ec)
0xb9c900138e4   124  a9027748       stp x8, fp, [x26, #32]
0xb9c900138e8   128  d63f0200       blr x16
0xb9c900138ec   12c  f900175f       str xzr, [x26, #40]
0xb9c900138f0   130  6a00001f       tst w0, w0
0xb9c900138f4   134  54004600       b.eq #+0x8c0 (addr 0xb9c900141b4)
0xb9c900138f8   138  f9403fe6       ldr x6, [sp, #120]
0xb9c900138fc   13c  f9401be4       ldr x4, [sp, #48]
0xb9c90013900   140  f94017e2       ldr x2, [sp, #40]
0xb9c90013904   144  f94043e8       ldr x8, [sp, #128]
0xb9c90013908   148  f9400fec       ldr x12, [sp, #24]
0xb9c9001390c   14c  f9400bea       ldr x10, [sp, #16]
0xb9c90013910   150  f9401fe3       ldr x3, [sp, #56]
0xb9c90013914   154  f9404be7       ldr x7, [sp, #144]
0xb9c90013918   158  f94013e0       ldr x0, [sp, #32]
0xb9c9001391c   15c  f94027e5       ldr x5, [sp, #72]
0xb9c90013920   160  f94047e9       ldr x9, [sp, #136]
0xb9c90013924   164  f94033ee       ldr x14, [sp, #96]
0xb9c90013928   168  f94037ef       ldr x15, [sp, #104]
0xb9c9001392c   16c  f9403bed       ldr x13, [sp, #112]
0xb9c90013930   170  f9402feb       ldr x11, [sp, #88]
0xb9c90013934   174  aa0e03f0       mov x16, x14
0xb9c90013938   178  aa0b03ee       mov x14, x11
0xb9c9001393c   17c  aa1003eb       mov x11, x16
0xb9c90013940   180  0b0e016e       add w14, w11, w14
0xb9c90013944   184  0b0d016b       add w11, w11, w13
0xb9c90013948   188  aa0f03ed       mov x13, x15
0xb9c9001394c   18c  0b0b09ab       add w11, w13, w11, lsl #2
0xb9c90013950   190  51001173       sub w19, w11, #0x4 (4)
0xb9c90013954   194  b83368df       str wzr, [x6, x19]
0xb9c90013958   198  110005cb       add w11, w14, #0x1 (1)
0xb9c9001395c   19c  b82968cb       str w11, [x6, x9]
0xb9c90013960   1a0  aa0503e9       mov x9, x5
0xb9c90013964   1a4  6b03013f       cmp w9, w3
0xb9c90013968   1a8  1a83312d       csel w13, w9, w3, lo
0xb9c9001396c   1ac  d280000e       movz x14, #0x0
0xb9c90013970   1b0  f90037eb       str x11, [sp, #104]
0xb9c90013974   1b4  f90047ed       str x13, [sp, #136]
0xb9c90013978   1b8  350000cd       cbnz w13, #+0x18 (addr 0xb9c90013990)
0xb9c9001397c   1bc  91001109       add x9, x8, #0x4 (4)
0xb9c90013980   1c0  b86968c9       ldr w9, [x6, x9]
0xb9c90013984   1c4  aa0903f4       mov x20, x9
0xb9c90013988   1c8  aa0a03e9       mov x9, x10
0xb9c9001398c   1cc  14000045       b #+0x114 (addr 0xb9c90013aa0)
0xb9c90013990   1d0  aa0a03e9       mov x9, x10
0xb9c90013994   1d4  b86968ca       ldr w10, [x6, x9]
0xb9c90013998   1d8  7100015f       cmp w10, #0x0 (0)
0xb9c9001399c   1dc  9a9f07ef       cset x15, ne
0xb9c900139a0   1e0  4b0f014a       sub w10, w10, w15
0xb9c900139a4   1e4  b86c68cf       ldr w15, [x6, x12]
0xb9c900139a8   1e8  710001ff       cmp w15, #0x0 (0)
0xb9c900139ac   1ec  9a9f07f3       cset x19, ne
0xb9c900139b0   1f0  4b1301f3       sub w19, w15, w19
0xb9c900139b4   1f4  91001114       add x20, x8, #0x4 (4)
0xb9c900139b8   1f8  b87468d4       ldr w20, [x6, x20]
0xb9c900139bc   1fc  91009115       add x21, x8, #0x24 (36)
0xb9c900139c0   200  bc7568c0       ldr s0, [x6, x21]
0xb9c900139c4   204  aa0d03f5       mov x21, x13
0xb9c900139c8   208  aa0403f6       mov x22, x4
0xb9c900139cc   20c  aa0203f7       mov x23, x2
0xb9c900139d0   210  d2800038       movz x24, #0x1
0xb9c900139d4   214  f8520359       ldur x25, [x26, #-224]
0xb9c900139d8   218  eb3963ff       cmp sp, x25
0xb9c900139dc   21c  54002d89       b.ls #+0x5b0 (addr 0xb9c90013f8c)
0xb9c900139e0   220  2a1703f9       mov w25, w23
0xb9c900139e4   224  bc7968c1       ldr s1, [x6, x25]
0xb9c900139e8   228  1e200821       fmul s1, s1, s0
0xb9c900139ec   22c  1e212020       fcmp s1, s1
0xb9c900139f0   230  1e211de1       fcsel s1, s15, s1, ne
0xb9c900139f4   234  1e202028       fcmp s1, #0.0
0xb9c900139f8   238  1e2fcc21       fcsel s1, s1, s15, gt
0xb9c900139fc   23c  1e22c022       fcvt d2, s1
0xb9c90013a00   240  1e65c043       frintz d3, d2
0xb9c90013a04   244  1e790079       fcvtzu w25, d3
0xb9c90013a08   248  1e630324       ucvtf d4, w25
0xb9c90013a0c   24c  1e642060       fcmp d3, d4
0xb9c90013a10   250  54002fc1       b.ne #+0x5f8 (addr 0xb9c90014008)
0xb9c90013a14   254  6b19027f       cmp w19, w25
0xb9c90013a18   258  1a99327b       csel w27, w19, w25, lo
0xb9c90013a1c   25c  11000779       add w25, w27, #0x1 (1)
0xb9c90013a20   260  52a9f010       movz w16, #0x4f800000
0xb9c90013a24   264  1e270202       fmov s2, w16
0xb9c90013a28   268  1e222020       fcmp s1, s2
0xb9c90013a2c   26c  1a983339       csel w25, w25, w24, lo
0xb9c90013a30   270  2a1603fb       mov w27, w22
0xb9c90013a34   274  bc7b68c1       ldr s1, [x6, x27]
0xb9c90013a38   278  1e200821       fmul s1, s1, s0
0xb9c90013a3c   27c  1e212020       fcmp s1, s1
0xb9c90013a40   280  1e211de1       fcsel s1, s15, s1, ne
0xb9c90013a44   284  1e202028       fcmp s1, #0.0
0xb9c90013a48   288  1e2fcc21       fcsel s1, s1, s15, gt
0xb9c90013a4c   28c  1e22c023       fcvt d3, s1
0xb9c90013a50   290  1e65c064       frintz d4, d3
0xb9c90013a54   294  1e79009b       fcvtzu w27, d4
0xb9c90013a58   298  1e630365       ucvtf d5, w27
0xb9c90013a5c   29c  1e652080       fcmp d4, d5
0xb9c90013a60   2a0  54002e41       b.ne #+0x5c8 (addr 0xb9c90014028)
0xb9c90013a64   2a4  6b1b015f       cmp w10, w27
0xb9c90013a68   2a8  1a9b315c       csel w28, w10, w27, lo
0xb9c90013a6c   2ac  1e222020       fcmp s1, s2
0xb9c90013a70   2b0  1a9f339b       csel w27, w28, wzr, lo
0xb9c90013a74   2b4  1b0f6779       madd w25, w27, w15, w25
0xb9c90013a78   2b8  6b19017f       cmp w11, w25
0xb9c90013a7c   2bc  540000a9       b.ls #+0x14 (addr 0xb9c90013a90)
0xb9c90013a80   2c0  0b190a99       add w25, w20, w25, lsl #2
0xb9c90013a84   2c4  b87968db       ldr w27, [x6, x25]
0xb9c90013a88   2c8  1100077b       add w27, w27, #0x1 (1)
0xb9c90013a8c   2cc  b83968db       str w27, [x6, x25]
0xb9c90013a90   2d0  110012f7       add w23, w23, #0x4 (4)
0xb9c90013a94   2d4  110012d6       add w22, w22, #0x4 (4)
0xb9c90013a98   2d8  510006b5       sub w21, w21, #0x1 (1)
0xb9c90013a9c   2dc  35fff9d5       cbnz w21, #-0xc8 (addr 0xb9c900139d4)
0xb9c90013aa0   2e0  f90007f4       str x20, [sp, #8]
0xb9c90013aa4   2e4  3500006b       cbnz w11, #+0xc (addr 0xb9c90013ab0)
0xb9c90013aa8   2e8  aa0e03ea       mov x10, x14
0xb9c90013aac   2ec  1400008f       b #+0x23c (addr 0xb9c90013ce8)
0xb9c90013ab0   2f0  531e7565       lsl w5, w11, #2
0xb9c90013ab4   2f4  510010aa       sub w10, w5, #0x4 (4)
0xb9c90013ab8   2f8  53027d4f       lsr w15, w10, #2
0xb9c90013abc   2fc  110005ef       add w15, w15, #0x1 (1)
0xb9c90013ac0   300  120009f3       and w19, w15, #0x7
0xb9c90013ac4   304  f90033e5       str x5, [sp, #96]
0xb9c90013ac8   308  7100715f       cmp w10, #0x1c (28)
0xb9c90013acc   30c  54000563       b.lo #+0xac (addr 0xb9c90013b78)
0xb9c90013ad0   310  121d6dea       and w10, w15, #0x7ffffff8
0xb9c90013ad4   314  aa1403ef       mov x15, x20
0xb9c90013ad8   318  aa0e03f5       mov x21, x14
0xb9c90013adc   31c  f8520356       ldur x22, [x26, #-224]
0xb9c90013ae0   320  eb3663ff       cmp sp, x22
0xb9c90013ae4   324  54002b29       b.ls #+0x564 (addr 0xb9c90014048)
0xb9c90013ae8   328  b86f68d6       ldr w22, [x6, x15]
0xb9c90013aec   32c  0b1502d5       add w21, w22, w21
0xb9c90013af0   330  b82f68d5       str w21, [x6, x15]
0xb9c90013af4   334  110011f6       add w22, w15, #0x4 (4)
0xb9c90013af8   338  b87668d7       ldr w23, [x6, x22]
0xb9c90013afc   33c  0b1502f5       add w21, w23, w21
0xb9c90013b00   340  b83668d5       str w21, [x6, x22]
0xb9c90013b04   344  110021f6       add w22, w15, #0x8 (8)
0xb9c90013b08   348  b87668d7       ldr w23, [x6, x22]
0xb9c90013b0c   34c  0b1502f5       add w21, w23, w21
0xb9c90013b10   350  b83668d5       str w21, [x6, x22]
0xb9c90013b14   354  110031f6       add w22, w15, #0xc (12)
0xb9c90013b18   358  b87668d7       ldr w23, [x6, x22]
0xb9c90013b1c   35c  0b1502f5       add w21, w23, w21
0xb9c90013b20   360  b83668d5       str w21, [x6, x22]
0xb9c90013b24   364  110041f6       add w22, w15, #0x10 (16)
0xb9c90013b28   368  b87668d7       ldr w23, [x6, x22]
0xb9c90013b2c   36c  0b1502f5       add w21, w23, w21
0xb9c90013b30   370  b83668d5       str w21, [x6, x22]
0xb9c90013b34   374  110051f6       add w22, w15, #0x14 (20)
0xb9c90013b38   378  b87668d7       ldr w23, [x6, x22]
0xb9c90013b3c   37c  0b1502f5       add w21, w23, w21
0xb9c90013b40   380  b83668d5       str w21, [x6, x22]
0xb9c90013b44   384  110061f6       add w22, w15, #0x18 (24)
0xb9c90013b48   388  b87668d7       ldr w23, [x6, x22]
0xb9c90013b4c   38c  0b1502f5       add w21, w23, w21
0xb9c90013b50   390  b83668d5       str w21, [x6, x22]
0xb9c90013b54   394  110071f6       add w22, w15, #0x1c (28)
0xb9c90013b58   398  b87668d7       ldr w23, [x6, x22]
0xb9c90013b5c   39c  0b1502f5       add w21, w23, w21
0xb9c90013b60   3a0  b83668d5       str w21, [x6, x22]
0xb9c90013b64   3a4  110081ef       add w15, w15, #0x20 (32)
0xb9c90013b68   3a8  5100214a       sub w10, w10, #0x8 (8)
0xb9c90013b6c   3ac  35fffb8a       cbnz w10, #-0x90 (addr 0xb9c90013adc)
0xb9c90013b70   3b0  35000093       cbnz w19, #+0x10 (addr 0xb9c90013b80)
0xb9c90013b74   3b4  1400001f       b #+0x7c (addr 0xb9c90013bf0)
0xb9c90013b78   3b8  aa0e03f5       mov x21, x14
0xb9c90013b7c   3bc  aa1403ef       mov x15, x20
0xb9c90013b80   3c0  531e766a       lsl w10, w19, #2
0xb9c90013b84   3c4  b86f68d3       ldr w19, [x6, x15]
0xb9c90013b88   3c8  0b150273       add w19, w19, w21
0xb9c90013b8c   3cc  b82f68d3       str w19, [x6, x15]
0xb9c90013b90   3d0  110011ef       add w15, w15, #0x4 (4)
0xb9c90013b94   3d4  5100114a       sub w10, w10, #0x4 (4)
0xb9c90013b98   3d8  340002ca       cbz w10, #+0x58 (addr 0xb9c90013bf0)
0xb9c90013b9c   3dc  b86f68d5       ldr w21, [x6, x15]
0xb9c90013ba0   3e0  0b1302b3       add w19, w21, w19
0xb9c90013ba4   3e4  b82f68d3       str w19, [x6, x15]
0xb9c90013ba8   3e8  110011ef       add w15, w15, #0x4 (4)
0xb9c90013bac   3ec  5100114a       sub w10, w10, #0x4 (4)
0xb9c90013bb0   3f0  3400020a       cbz w10, #+0x40 (addr 0xb9c90013bf0)
0xb9c90013bb4   3f4  b86f68d5       ldr w21, [x6, x15]
0xb9c90013bb8   3f8  0b1302b3       add w19, w21, w19
0xb9c90013bbc   3fc  b82f68d3       str w19, [x6, x15]
0xb9c90013bc0   400  110011ef       add w15, w15, #0x4 (4)
0xb9c90013bc4   404  5100114a       sub w10, w10, #0x4 (4)
0xb9c90013bc8   408  3400014a       cbz w10, #+0x28 (addr 0xb9c90013bf0)
0xb9c90013bcc   40c  f8520355       ldur x21, [x26, #-224]
0xb9c90013bd0   410  eb3563ff       cmp sp, x21
0xb9c90013bd4   414  540026a9       b.ls #+0x4d4 (addr 0xb9c900140a8)
0xb9c90013bd8   418  b86f68d5       ldr w21, [x6, x15]
0xb9c90013bdc   41c  0b1302b5       add w21, w21, w19
0xb9c90013be0   420  b82f68d5       str w21, [x6, x15]
0xb9c90013be4   424  110011ef       add w15, w15, #0x4 (4)
0xb9c90013be8   428  5100114a       sub w10, w10, #0x4 (4)
0xb9c90013bec   42c  35fffcca       cbnz w10, #-0x68 (addr 0xb9c90013b84)
0xb9c90013bf0   430  9100510a       add x10, x8, #0x14 (20)
0xb9c90013bf4   434  b82a68df       str wzr, [x6, x10]
0xb9c90013bf8   438  9100310f       add x15, x8, #0xc (12)
0xb9c90013bfc   43c  b86f68cf       ldr w15, [x6, x15]
0xb9c90013c00   440  f9003bea       str x10, [sp, #112]
0xb9c90013c04   444  6b0f017f       cmp w11, w15
0xb9c90013c08   448  54000309       b.ls #+0x60 (addr 0xb9c90013c68)
0xb9c90013c0c   44c  aa0003ef       mov x15, x0
0xb9c90013c10   450  110031e0       add w0, w15, #0xc (12)
0xb9c90013c14   454  aa0b03e3       mov x3, x11
0xb9c90013c18   458  aa0e03e2       mov x2, x14
0xb9c90013c1c   45c  97fc0699       bl #-0xfe59c (addr 0xb9c8ff15680)
0xb9c90013c20   460  f9403fe6       ldr x6, [sp, #120]
0xb9c90013c24   464  f9403be8       ldr x8, [sp, #112]
0xb9c90013c28   468  b86868c8       ldr w8, [x6, x8]
0xb9c90013c2c   46c  aa0803ea       mov x10, x8
0xb9c90013c30   470  f94047ed       ldr x13, [sp, #136]
0xb9c90013c34   474  d280000e       movz x14, #0x0
0xb9c90013c38   478  f9401be4       ldr x4, [sp, #48]
0xb9c90013c3c   47c  f94017e2       ldr x2, [sp, #40]
0xb9c90013c40   480  f94043e8       ldr x8, [sp, #128]
0xb9c90013c44   484  f9400fec       ldr x12, [sp, #24]
0xb9c90013c48   488  f9400be9       ldr x9, [sp, #16]
0xb9c90013c4c   48c  f9401fe3       ldr x3, [sp, #56]
0xb9c90013c50   490  f9404be7       ldr x7, [sp, #144]
0xb9c90013c54   494  f94013e0       ldr x0, [sp, #32]
0xb9c90013c58   498  f94037eb       ldr x11, [sp, #104]
0xb9c90013c5c   49c  f94033e5       ldr x5, [sp, #96]
0xb9c90013c60   4a0  f94007f4       ldr x20, [sp, #8]
0xb9c90013c64   4a4  14000002       b #+0x8 (addr 0xb9c90013c6c)
0xb9c90013c68   4a8  aa0e03ea       mov x10, x14
0xb9c90013c6c   4ac  531e756f       lsl w15, w11, #2
0xb9c90013c70   4b0  f9003bea       str x10, [sp, #112]
0xb9c90013c74   4b4  340003af       cbz w15, #+0x74 (addr 0xb9c90013ce8)
0xb9c90013c78   4b8  9100410f       add x15, x8, #0x10 (16)
0xb9c90013c7c   4bc  b86f68cf       ldr w15, [x6, x15]
0xb9c90013c80   4c0  0b0a09ef       add w15, w15, w10, lsl #2
0xb9c90013c84   4c4  aa0703e0       mov x0, x7
0xb9c90013c88   4c8  aa0e03e1       mov x1, x14
0xb9c90013c8c   4cc  aa0e03e2       mov x2, x14
0xb9c90013c90   4d0  aa0f03e3       mov x3, x15
0xb9c90013c94   4d4  aa1403e4       mov x4, x20
0xb9c90013c98   4d8  58002990       ldr x16, pc+1328 (addr 0x00000b9c900141c8)
0xb9c90013c9c   4dc  10000068       adr x8, #+0xc (addr 0xb9c90013ca8)
0xb9c90013ca0   4e0  a9027748       stp x8, fp, [x26, #32]
0xb9c90013ca4   4e4  d63f0200       blr x16
0xb9c90013ca8   4e8  f900175f       str xzr, [x26, #40]
0xb9c90013cac   4ec  6a00001f       tst w0, w0
0xb9c90013cb0   4f0  54002800       b.eq #+0x500 (addr 0xb9c900141b0)
0xb9c90013cb4   4f4  f9403bea       ldr x10, [sp, #112]
0xb9c90013cb8   4f8  f94047ed       ldr x13, [sp, #136]
0xb9c90013cbc   4fc  f9403fe6       ldr x6, [sp, #120]
0xb9c90013cc0   500  d280000e       movz x14, #0x0
0xb9c90013cc4   504  f9401be4       ldr x4, [sp, #48]
0xb9c90013cc8   508  f94017e2       ldr x2, [sp, #40]
0xb9c90013ccc   50c  f94043e8       ldr x8, [sp, #128]
0xb9c90013cd0   510  f9400fec       ldr x12, [sp, #24]
0xb9c90013cd4   514  f9400be9       ldr x9, [sp, #16]
0xb9c90013cd8   518  f9401fe3       ldr x3, [sp, #56]
0xb9c90013cdc   51c  f9404be7       ldr x7, [sp, #144]
0xb9c90013ce0   520  f94013e0       ldr x0, [sp, #32]
0xb9c90013ce4   524  f94037eb       ldr x11, [sp, #104]
0xb9c90013ce8   528  9100810f       add x15, x8, #0x20 (32)
0xb9c90013cec   52c  b82f68df       str wzr, [x6, x15]
0xb9c90013cf0   530  0b0b014a       add w10, w10, w11
0xb9c90013cf4   534  9100510b       add x11, x8, #0x14 (20)
0xb9c90013cf8   538  b82b68ca       str w10, [x6, x11]
0xb9c90013cfc   53c  f9003bef       str x15, [sp, #112]
0xb9c90013d00   540  f9002feb       str x11, [sp, #88]
0xb9c90013d04   544  35000063       cbnz w3, #+0xc (addr 0xb9c90013d10)
0xb9c90013d08   548  aa0e03ea       mov x10, x14
0xb9c90013d0c   54c  14000048       b #+0x120 (addr 0xb9c90013e2c)
0xb9c90013d10   550  9100610a       add x10, x8, #0x18 (24)
0xb9c90013d14   554  b86a68ca       ldr w10, [x6, x10]
0xb9c90013d18   558  6b0a007f       cmp w3, w10
0xb9c90013d1c   55c  540002a9       b.ls #+0x54 (addr 0xb9c90013d70)
0xb9c90013d20   560  aa0003ea       mov x10, x0
0xb9c90013d24   564  11006140       add w0, w10, #0x18 (24)
0xb9c90013d28   568  aa0e03e2       mov x2, x14
0xb9c90013d2c   56c  97fc0655       bl #-0xfe6ac (addr 0xb9c8ff15680)
0xb9c90013d30   570  f9403fe6       ldr x6, [sp, #120]
0xb9c90013d34   574  f9403be8       ldr x8, [sp, #112]
0xb9c90013d38   578  b86868c9       ldr w9, [x6, x8]
0xb9c90013d3c   57c  aa0903ea       mov x10, x9
0xb9c90013d40   580  f94047ed       ldr x13, [sp, #136]
0xb9c90013d44   584  d280000e       movz x14, #0x0
0xb9c90013d48   588  f9401be4       ldr x4, [sp, #48]
0xb9c90013d4c   58c  f94017e2       ldr x2, [sp, #40]
0xb9c90013d50   590  aa0803ef       mov x15, x8
0xb9c90013d54   594  f94043e8       ldr x8, [sp, #128]
0xb9c90013d58   598  f9402feb       ldr x11, [sp, #88]
0xb9c90013d5c   59c  f9400fec       ldr x12, [sp, #24]
0xb9c90013d60   5a0  f9400be9       ldr x9, [sp, #16]
0xb9c90013d64   5a4  f9401fe3       ldr x3, [sp, #56]
0xb9c90013d68   5a8  f9404be7       ldr x7, [sp, #144]
0xb9c90013d6c   5ac  14000002       b #+0x8 (addr 0xb9c90013d74)
0xb9c90013d70   5b0  aa0e03ea       mov x10, x14
0xb9c90013d74   5b4  91007113       add x19, x8, #0x1c (28)
0xb9c90013d78   5b8  b87368d3       ldr w19, [x6, x19]
0xb9c90013d7c   5bc  0b0a0a74       add w20, w19, w10, lsl #2
0xb9c90013d80   5c0  f90037ea       str x10, [sp, #104]
0xb9c90013d84   5c4  f90033f3       str x19, [sp, #96]
0xb9c90013d88   5c8  aa0303f5       mov x21, x3
0xb9c90013d8c   5cc  710006bf       cmp w21, #0x1 (1)
0xb9c90013d90   5d0  540004a0       b.eq #+0x94 (addr 0xb9c90013e24)
0xb9c90013d94   5d4  531e76b6       lsl w22, w21, #2
0xb9c90013d98   5d8  510012d6       sub w22, w22, #0x4 (4)
0xb9c90013d9c   5dc  34000356       cbz w22, #+0x68 (addr 0xb9c90013e04)
0xb9c90013da0   5e0  aa0703e0       mov x0, x7
0xb9c90013da4   5e4  aa0e03e1       mov x1, x14
0xb9c90013da8   5e8  aa1403e2       mov x2, x20
0xb9c90013dac   5ec  aa0e03e3       mov x3, x14
0xb9c90013db0   5f0  aa1603e4       mov x4, x22
0xb9c90013db4   5f4  580020f0       ldr x16, pc+1052 (addr 0x00000b9c900141d0)    ;; external reference (wasm::memory_fill)
0xb9c90013db8   5f8  10000068       adr x8, #+0xc (addr 0xb9c90013dc4)
0xb9c90013dbc   5fc  a9027748       stp x8, fp, [x26, #32]
0xb9c90013dc0   600  d63f0200       blr x16
0xb9c90013dc4   604  f900175f       str xzr, [x26, #40]
0xb9c90013dc8   608  6a00001f       tst w0, w0
0xb9c90013dcc   60c  54001f00       b.eq #+0x3e0 (addr 0xb9c900141ac)
0xb9c90013dd0   610  f94047ed       ldr x13, [sp, #136]
0xb9c90013dd4   614  f9403fe6       ldr x6, [sp, #120]
0xb9c90013dd8   618  d280000e       movz x14, #0x0
0xb9c90013ddc   61c  f9401be4       ldr x4, [sp, #48]
0xb9c90013de0   620  f94017e2       ldr x2, [sp, #40]
0xb9c90013de4   624  f94043e8       ldr x8, [sp, #128]
0xb9c90013de8   628  f9402feb       ldr x11, [sp, #88]
0xb9c90013dec   62c  f9400fec       ldr x12, [sp, #24]
0xb9c90013df0   630  f9400be9       ldr x9, [sp, #16]
0xb9c90013df4   634  f9403bef       ldr x15, [sp, #112]
0xb9c90013df8   638  f94037ea       ldr x10, [sp, #104]
0xb9c90013dfc   63c  f94033f3       ldr x19, [sp, #96]
0xb9c90013e00   640  f9401ff5       ldr x21, [sp, #56]
0xb9c90013e04   644  aa1503f4       mov x20, x21
0xb9c90013e08   648  0b14014a       add w10, w10, w20
0xb9c90013e0c   64c  51000554       sub w20, w10, #0x1 (1)
0xb9c90013e10   650  0b0a0a6a       add w10, w19, w10, lsl #2
0xb9c90013e14   654  5100114a       sub w10, w10, #0x4 (4)
0xb9c90013e18   658  aa0a03f0       mov x16, x10
0xb9c90013e1c   65c  aa1403ea       mov x10, x20
0xb9c90013e20   660  aa1003f4       mov x20, x16
0xb9c90013e24   664  b83468df       str wzr, [x6, x20]
0xb9c90013e28   668  1100054a       add w10, w10, #0x1 (1)
0xb9c90013e2c   66c  b82f68ca       str w10, [x6, x15]
0xb9c90013e30   670  3500008d       cbnz w13, #+0x10 (addr 0xb9c90013e40)
0xb9c90013e34   674  910003bf       mov sp, fp
0xb9c90013e38   678  a8c17bfd       ldp fp, lr, [sp], #16
0xb9c90013e3c   67c  d65f03c0       ret
0xb9c90013e40   680  b86968c9       ldr w9, [x6, x9]
0xb9c90013e44   684  7100013f       cmp w9, #0x0 (0)
0xb9c90013e48   688  9a9f07ef       cset x15, ne
0xb9c90013e4c   68c  4b0f0129       sub w9, w9, w15
0xb9c90013e50   690  b86c68cc       ldr w12, [x6, x12]
0xb9c90013e54   694  7100019f       cmp w12, #0x0 (0)
0xb9c90013e58   698  9a9f07ef       cset x15, ne
0xb9c90013e5c   69c  4b0f018f       sub w15, w12, w15
0xb9c90013e60   6a0  91007113       add x19, x8, #0x1c (28)
0xb9c90013e64   6a4  b87368d3       ldr w19, [x6, x19]
0xb9c90013e68   6a8  91004114       add x20, x8, #0x10 (16)
0xb9c90013e6c   6ac  b87468d4       ldr w20, [x6, x20]
0xb9c90013e70   6b0  b86b68cb       ldr w11, [x6, x11]
0xb9c90013e74   6b4  91009108       add x8, x8, #0x24 (36)
0xb9c90013e78   6b8  bc6868c0       ldr s0, [x6, x8]
0xb9c90013e7c   6bc  aa0e03e8       mov x8, x14
0xb9c90013e80   6c0  f8520355       ldur x21, [x26, #-224]
0xb9c90013e84   6c4  eb3563ff       cmp sp, x21
0xb9c90013e88   6c8  540013c9       b.ls #+0x278 (addr 0xb9c90014100)
0xb9c90013e8c   6cc  2a0403f5       mov w21, w4
0xb9c90013e90   6d0  bc7568c1       ldr s1, [x6, x21]
0xb9c90013e94   6d4  1e200821       fmul s1, s1, s0
0xb9c90013e98   6d8  1e212020       fcmp s1, s1
0xb9c90013e9c   6dc  1e211de1       fcsel s1, s15, s1, ne
0xb9c90013ea0   6e0  1e202028       fcmp s1, #0.0
0xb9c90013ea4   6e4  1e2fcc21       fcsel s1, s1, s15, gt
0xb9c90013ea8   6e8  1e22c022       fcvt d2, s1
0xb9c90013eac   6ec  1e65c043       frintz d3, d2
0xb9c90013eb0   6f0  1e790075       fcvtzu w21, d3
0xb9c90013eb4   6f4  1e6302a4       ucvtf d4, w21
0xb9c90013eb8   6f8  1e642060       fcmp d3, d4
0xb9c90013ebc   6fc  54001581       b.ne #+0x2b0 (addr 0xb9c9001416c)
0xb9c90013ec0   700  6b15013f       cmp w9, w21
0xb9c90013ec4   704  1a953136       csel w22, w9, w21, lo
0xb9c90013ec8   708  52a9f010       movz w16, #0x4f800000
0xb9c90013ecc   70c  1e270202       fmov s2, w16
0xb9c90013ed0   710  1e222020       fcmp s1, s2
0xb9c90013ed4   714  1a9f32d5       csel w21, w22, wzr, lo
0xb9c90013ed8   718  1b0c7eb5       mul w21, w21, w12
0xb9c90013edc   71c  2a0203f6       mov w22, w2
0xb9c90013ee0   720  bc7668c1       ldr s1, [x6, x22]
0xb9c90013ee4   724  1e200821       fmul s1, s1, s0
0xb9c90013ee8   728  1e212020       fcmp s1, s1
0xb9c90013eec   72c  1e211de1       fcsel s1, s15, s1, ne
0xb9c90013ef0   730  1e202028       fcmp s1, #0.0
0xb9c90013ef4   734  1e2fcc21       fcsel s1, s1, s15, gt
0xb9c90013ef8   738  1e22c023       fcvt d3, s1
0xb9c90013efc   73c  1e65c064       frintz d4, d3
0xb9c90013f00   740  1e790096       fcvtzu w22, d4
0xb9c90013f04   744  1e6302c5       ucvtf d5, w22
0xb9c90013f08   748  1e652080       fcmp d4, d5
0xb9c90013f0c   74c  54001401       b.ne #+0x280 (addr 0xb9c9001418c)
0xb9c90013f10   750  6b1601ff       cmp w15, w22
0xb9c90013f14   754  1a9631f7       csel w23, w15, w22, lo
0xb9c90013f18   758  1e222020       fcmp s1, s2
0xb9c90013f1c   75c  1a9f32f6       csel w22, w23, wzr, lo
0xb9c90013f20   760  0b1602b5       add w21, w21, w22
0xb9c90013f24   764  6b15017f       cmp w11, w21
0xb9c90013f28   768  54000149       b.ls #+0x28 (addr 0xb9c90013f50)
0xb9c90013f2c   76c  0b150a95       add w21, w20, w21, lsl #2
0xb9c90013f30   770  b87568d6       ldr w22, [x6, x21]
0xb9c90013f34   774  6b16015f       cmp w10, w22
0xb9c90013f38   778  54000089       b.ls #+0x10 (addr 0xb9c90013f48)
0xb9c90013f3c   77c  0b160a76       add w22, w19, w22, lsl #2
0xb9c90013f40   780  b83668c8       str w8, [x6, x22]
0xb9c90013f44   784  b87568d6       ldr w22, [x6, x21]
0xb9c90013f48   788  110006d6       add w22, w22, #0x1 (1)
0xb9c90013f4c   78c  b83568d6       str w22, [x6, x21]
0xb9c90013f50   790  11001042       add w2, w2, #0x4 (4)
0xb9c90013f54   794  11001084       add w4, w4, #0x4 (4)
0xb9c90013f58   798  11000508       add w8, w8, #0x1 (1)
0xb9c90013f5c   79c  6b0801bf       cmp w13, w8
0xb9c90013f60   7a0  54fff6a0       b.eq #-0x12c (addr 0xb9c90013e34)
0xb9c90013f64   7a4  17ffffc7       b #-0xe4 (addr 0xb9c90013e80)
0xb9c90013f68   7a8  97fc071a       bl #-0xfe398 (addr 0xb9c8ff15bd0)
0xb9c90013f6c   7ac  f9403fe6       ldr x6, [sp, #120]
0xb9c90013f70   7b0  f9401be4       ldr x4, [sp, #48]
0xb9c90013f74   7b4  f94017e2       ldr x2, [sp, #40]
0xb9c90013f78   7b8  f9401fe3       ldr x3, [sp, #56]
0xb9c90013f7c   7bc  f9404be7       ldr x7, [sp, #144]
0xb9c90013f80   7c0  f94013e0       ldr x0, [sp, #32]
0xb9c90013f84   7c4  f94027e5       ldr x5, [sp, #72]
0xb9c90013f88   7c8  17fffe1d       b #-0x78c (addr 0xb9c900137fc)
0xb9c90013f8c   7cc  f90007f4       str x20, [sp, #8]
0xb9c90013f90   7d0  f9003bf5       str x21, [sp, #112]
0xb9c90013f94   7d4  f90023f6       str x22, [sp, #64]
0xb9c90013f98   7d8  f90003f7       str x23, [sp]
0xb9c90013f9c   7dc  f90033ef       str x15, [sp, #96]
0xb9c90013fa0   7e0  f9002fea       str x10, [sp, #88]
0xb9c90013fa4   7e4  fd002be0       str d0, [sp, #80]
0xb9c90013fa8   7e8  f90027f3       str x19, [sp, #72]
0xb9c90013fac   7ec  97fc0709       bl #-0xfe3dc (addr 0xb9c8ff15bd0)
0xb9c90013fb0   7f0  f94047ed       ldr x13, [sp, #136]
0xb9c90013fb4   7f4  f9403fe6       ldr x6, [sp, #120]
0xb9c90013fb8   7f8  d280000e       movz x14, #0x0
0xb9c90013fbc   7fc  f9401be4       ldr x4, [sp, #48]
0xb9c90013fc0   800  f94017e2       ldr x2, [sp, #40]
0xb9c90013fc4   804  f94043e8       ldr x8, [sp, #128]
0xb9c90013fc8   808  f9400fec       ldr x12, [sp, #24]
0xb9c90013fcc   80c  f9400be9       ldr x9, [sp, #16]
0xb9c90013fd0   810  f9401fe3       ldr x3, [sp, #56]
0xb9c90013fd4   814  f9404be7       ldr x7, [sp, #144]
0xb9c90013fd8   818  f94013e0       ldr x0, [sp, #32]
0xb9c90013fdc   81c  f94037eb       ldr x11, [sp, #104]
0xb9c90013fe0   820  f94007f4       ldr x20, [sp, #8]
0xb9c90013fe4   824  f9403bf5       ldr x21, [sp, #112]
0xb9c90013fe8   828  f94023f6       ldr x22, [sp, #64]
0xb9c90013fec   82c  f94003f7       ldr x23, [sp]
0xb9c90013ff0   830  f94033ef       ldr x15, [sp, #96]
0xb9c90013ff4   834  f9402fea       ldr x10, [sp, #88]
0xb9c90013ff8   838  fd402be0       ldr d0, [sp, #80]
0xb9c90013ffc   83c  d2800038       movz x24, #0x1
0xb9c90014000   840  f94027f3       ldr x19, [sp, #72]
0xb9c90014004   844  17fffe77       b #-0x624 (addr 0xb9c900139e0)
0xb9c90014008   848  1e622040       fcmp d2, d2
0xb9c9001400c   84c  54000060       b.eq #+0xc (addr 0xb9c90014018)
0xb9c90014010   850  aa0e03f9       mov x25, x14
0xb9c90014014   854  17fffe80       b #-0x600 (addr 0xb9c90013a14)
0xb9c90014018   858  1e202028       fcmp s1, #0.0
0xb9c9001401c   85c  54ffffa3       b.lo #-0xc (addr 0xb9c90014010)
0xb9c90014020   860  92800019       movn x25, #0x0
0xb9c90014024   864  17fffe7c       b #-0x610 (addr 0xb9c90013a14)
0xb9c90014028   868  1e632060       fcmp d3, d3
0xb9c9001402c   86c  54000060       b.eq #+0xc (addr 0xb9c90014038)
0xb9c90014030   870  aa0e03fb       mov cp, x14
0xb9c90014034   874  17fffe8c       b #-0x5d0 (addr 0xb9c90013a64)
0xb9c90014038   878  1e202028       fcmp s1, #0.0
0xb9c9001403c   87c  54ffffa3       b.lo #-0xc (addr 0xb9c90014030)
0xb9c90014040   880  9280001b       movn cp, #0x0
0xb9c90014044   884  17fffe88       b #-0x5e0 (addr 0xb9c90013a64)
0xb9c90014048   888  f9003bf3       str x19, [sp, #112]
0xb9c9001404c   88c  f9002bea       str x10, [sp, #80]
0xb9c90014050   890  f90027ef       str x15, [sp, #72]
0xb9c90014054   894  f9002ff5       str x21, [sp, #88]
0xb9c90014058   898  97fc06de       bl #-0xfe488 (addr 0xb9c8ff15bd0)
0xb9c9001405c   89c  f94047ed       ldr x13, [sp, #136]
0xb9c90014060   8a0  f9403fe6       ldr x6, [sp, #120]
0xb9c90014064   8a4  d280000e       movz x14, #0x0
0xb9c90014068   8a8  f9401be4       ldr x4, [sp, #48]
0xb9c9001406c   8ac  f94017e2       ldr x2, [sp, #40]
0xb9c90014070   8b0  f94043e8       ldr x8, [sp, #128]
0xb9c90014074   8b4  f9400fec       ldr x12, [sp, #24]
0xb9c90014078   8b8  f9400be9       ldr x9, [sp, #16]
0xb9c9001407c   8bc  f9401fe3       ldr x3, [sp, #56]
0xb9c90014080   8c0  f9404be7       ldr x7, [sp, #144]
0xb9c90014084   8c4  f94013e0       ldr x0, [sp, #32]
0xb9c90014088   8c8  f94037eb       ldr x11, [sp, #104]
0xb9c9001408c   8cc  f94033e5       ldr x5, [sp, #96]
0xb9c90014090   8d0  f94007f4       ldr x20, [sp, #8]
0xb9c90014094   8d4  f9403bf3       ldr x19, [sp, #112]
0xb9c90014098   8d8  f9402bea       ldr x10, [sp, #80]
0xb9c9001409c   8dc  f94027ef       ldr x15, [sp, #72]
0xb9c900140a0   8e0  f9402ff5       ldr x21, [sp, #88]
0xb9c900140a4   8e4  17fffe91       b #-0x5bc (addr 0xb9c90013ae8)
0xb9c900140a8   8e8  f9003bea       str x10, [sp, #112]
0xb9c900140ac   8ec  f90023ef       str x15, [sp, #64]
0xb9c900140b0   8f0  f9002bf3       str x19, [sp, #80]
0xb9c900140b4   8f4  97fc06c7       bl #-0xfe4e4 (addr 0xb9c8ff15bd0)
0xb9c900140b8   8f8  f94047ed       ldr x13, [sp, #136]
0xb9c900140bc   8fc  f9403fe6       ldr x6, [sp, #120]
0xb9c900140c0   900  d280000e       movz x14, #0x0
0xb9c900140c4   904  f9401be4       ldr x4, [sp, #48]
0xb9c900140c8   908  f94017e2       ldr x2, [sp, #40]
0xb9c900140cc   90c  f94043e8       ldr x8, [sp, #128]
0xb9c900140d0   910  f9400fec       ldr x12, [sp, #24]
0xb9c900140d4   914  f9400be9       ldr x9, [sp, #16]
0xb9c900140d8   918  f9401fe3       ldr x3, [sp, #56]
0xb9c900140dc   91c  f9404be7       ldr x7, [sp, #144]
0xb9c900140e0   920  f94013e0       ldr x0, [sp, #32]
0xb9c900140e4   924  f94037eb       ldr x11, [sp, #104]
0xb9c900140e8   928  f94033e5       ldr x5, [sp, #96]
0xb9c900140ec   92c  f94007f4       ldr x20, [sp, #8]
0xb9c900140f0   930  f9403bea       ldr x10, [sp, #112]
0xb9c900140f4   934  f94023ef       ldr x15, [sp, #64]
0xb9c900140f8   938  f9402bf3       ldr x19, [sp, #80]
0xb9c900140fc   93c  17fffeb7       b #-0x524 (addr 0xb9c90013bd8)
0xb9c90014100   940  f90043e8       str x8, [sp, #128]
0xb9c90014104   944  f9001be4       str x4, [sp, #48]
0xb9c90014108   948  f90017e2       str x2, [sp, #40]
0xb9c9001410c   94c  f9003bf3       str x19, [sp, #112]
0xb9c90014110   950  f90037ea       str x10, [sp, #104]
0xb9c90014114   954  f90033f4       str x20, [sp, #96]
0xb9c90014118   958  f9002feb       str x11, [sp, #88]
0xb9c9001411c   95c  f9002bef       str x15, [sp, #80]
0xb9c90014120   960  fd0027e0       str d0, [sp, #72]
0xb9c90014124   964  f90023ec       str x12, [sp, #64]
0xb9c90014128   968  f9001fe9       str x9, [sp, #56]
0xb9c9001412c   96c  97fc06a9       bl #-0xfe55c (addr 0xb9c8ff15bd0)
0xb9c90014130   970  f94047ed       ldr x13, [sp, #136]
0xb9c90014134   974  f94043e8       ldr x8, [sp, #128]
0xb9c90014138   978  f9401be4       ldr x4, [sp, #48]
0xb9c9001413c   97c  f94017e2       ldr x2, [sp, #40]
0xb9c90014140   980  f9403fe6       ldr x6, [sp, #120]
0xb9c90014144   984  f9403bf3       ldr x19, [sp, #112]
0xb9c90014148   988  f94037ea       ldr x10, [sp, #104]
0xb9c9001414c   98c  f94033f4       ldr x20, [sp, #96]
0xb9c90014150   990  f9402feb       ldr x11, [sp, #88]
0xb9c90014154   994  f9402bef       ldr x15, [sp, #80]
0xb9c90014158   998  d280000e       movz x14, #0x0
0xb9c9001415c   99c  fd4027e0       ldr d0, [sp, #72]
0xb9c90014160   9a0  f94023ec       ldr x12, [sp, #64]
0xb9c90014164   9a4  f9401fe9       ldr x9, [sp, #56]
0xb9c90014168   9a8  17ffff49       b #-0x2dc (addr 0xb9c90013e8c)
0xb9c9001416c   9ac  1e622040       fcmp d2, d2
0xb9c90014170   9b0  54000060       b.eq #+0xc (addr 0xb9c9001417c)
0xb9c90014174   9b4  aa0e03f5       mov x21, x14
0xb9c90014178   9b8  17ffff52       b #-0x2b8 (addr 0xb9c90013ec0)
0xb9c9001417c   9bc  1e202028       fcmp s1, #0.0
0xb9c90014180   9c0  54ffffa3       b.lo #-0xc (addr 0xb9c90014174)
0xb9c90014184   9c4  92800015       movn x21, #0x0
0xb9c90014188   9c8  17ffff4e       b #-0x2c8 (addr 0xb9c90013ec0)
0xb9c9001418c   9cc  1e632060       fcmp d3, d3
0xb9c90014190   9d0  54000060       b.eq #+0xc (addr 0xb9c9001419c)
0xb9c90014194   9d4  aa0e03f6       mov x22, x14
0xb9c90014198   9d8  17ffff5e       b #-0x288 (addr 0xb9c90013f10)
0xb9c9001419c   9dc  1e202028       fcmp s1, #0.0
0xb9c900141a0   9e0  54ffffa3       b.lo #-0xc (addr 0xb9c90014194)
0xb9c900141a4   9e4  92800016       movn x22, #0x0
0xb9c900141a8   9e8  17ffff5a       b #-0x298 (addr 0xb9c90013f10)
0xb9c900141ac   9ec  97fc05d9       bl #-0xfe89c (addr 0xb9c8ff15910)
0xb9c900141b0   9f0  97fc05d8       bl #-0xfe8a0 (addr 0xb9c8ff15910)
0xb9c900141b4   9f4  97fc05d7       bl #-0xfe8a4 (addr 0xb9c8ff15910)
0xb9c900141b8   9f8  d503201f       nop
0xb9c900141bc   9fc  580000df       constant pool begin (num_const = 6)
0xb9c900141c0   a00  d63f03e0       constant
0xb9c900141c4   a04  d503201f       constant
0xb9c900141c8   a08  0102aa68       constant
0xb9c900141cc   a0c  00000001       constant
0xb9c900141d0   a10  0102aaf4       constant
0xb9c900141d4   a14  00000001       constant

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
0xb9c9001385c     9c  slots (sp->fp): 0000000000000000000000

RelocInfo (size = 46)
0xb9c90013858  internal wasm call
0xb9c900138dc  external reference (0x10102aaf4)
0xb9c90013c1c  internal wasm call
0xb9c90013c98  external reference (0x10102aa68)
0xb9c90013d2c  internal wasm call
0xb9c90013f68  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013fac  wasm stub call  (0xb9c8ff15bd0)
0xb9c90014058  wasm stub call  (0xb9c8ff15bd0)
0xb9c900140b4  wasm stub call  (0xb9c8ff15bd0)
0xb9c9001412c  wasm stub call  (0xb9c8ff15bd0)
0xb9c900141ac  wasm stub call  (0xb9c8ff15910)
0xb9c900141b0  wasm stub call  (0xb9c8ff15910)
0xb9c900141b4  wasm stub call  (0xb9c8ff15910)
0xb9c900141bc  constant pool (size 28)
