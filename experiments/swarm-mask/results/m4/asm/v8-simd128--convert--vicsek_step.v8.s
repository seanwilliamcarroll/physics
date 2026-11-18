name: _RNvMs0_NtCshBZZPcGIfde_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 4512 = 4492 + 20 padding)
Instructions (size = 4472)
0x194a8d000680     0  d2800110       movz x16, #0x8
0x194a8d000684     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x194a8d000688     8  a9017bfd       stp fp, lr, [sp, #16]
0x194a8d00068c     c  910043fd       add fp, sp, #0x10 (16)
0x194a8d000690    10  d10443ff       sub sp, sp, #0x110 (272)
0x194a8d000694    14  f841f0e1       ldur x1, [x7, #31]
0x194a8d000698    18  f8520346       ldur x6, [x26, #-224]
0x194a8d00069c    1c  f9007fe1       str x1, [sp, #248]
0x194a8d0006a0    20  eb2663ff       cmp sp, x6
0x194a8d0006a4    24  54007249       b.ls #+0xe48 (addr 0x194a8d0014ec)
0x194a8d0006a8    28  f842f0e6       ldur x6, [x7, #47]
0x194a8d0006ac    2c  b94000c8       ldr w8, [x6]
0x194a8d0006b0    30  51014108       sub w8, w8, #0x50 (80)
0x194a8d0006b4    34  b90000c8       str w8, [x6]
0x194a8d0006b8    38  2a0003e9       mov w9, w0
0x194a8d0006bc    3c  9102b12a       add x10, x9, #0xac (172)
0x194a8d0006c0    40  bc6a6821       ldr s1, [x1, x10]
0x194a8d0006c4    44  9102a12a       add x10, x9, #0xa8 (168)
0x194a8d0006c8    48  bc6a6822       ldr s2, [x1, x10]
0x194a8d0006cc    4c  9100212b       add x11, x9, #0x8 (8)
0x194a8d0006d0    50  b86b6823       ldr w3, [x1, x11]
0x194a8d0006d4    54  9102e12c       add x12, x9, #0xb8 (184)
0x194a8d0006d8    58  386c682c       ldrb w12, [x1, x12]
0x194a8d0006dc    5c  f90087e6       str x6, [sp, #264]
0x194a8d0006e0    60  f90083e8       str x8, [sp, #256]
0x194a8d0006e4    64  f9007be9       str x9, [sp, #240]
0x194a8d0006e8    68  fd0073e1       str d1, [sp, #224]
0x194a8d0006ec    6c  f90047ea       str x10, [sp, #136]
0x194a8d0006f0    70  fd001fe2       str d2, [sp, #56]
0x194a8d0006f4    74  f90027eb       str x11, [sp, #72]
0x194a8d0006f8    78  f90077e3       str x3, [sp, #232]
0x194a8d0006fc    7c  350001ec       cbnz w12, #+0x3c (addr 0x194a8d000738)
0x194a8d000700    80  52840010       movz w16, #0x2000
0x194a8d000704    84  72a7f010       movk w16, #0x3f80, lsl #16
0x194a8d000708    88  1e270203       fmov s3, w16
0x194a8d00070c    8c  1e230823       fmul s3, s1, s3
0x194a8d000710    90  1e231843       fdiv s3, s2, s3
0x194a8d000714    94  1e254063       frintm s3, s3
0x194a8d000718    98  1e202068       fcmp s3, #0.0
0x194a8d00071c    9c  5400006a       b.ge #+0xc (addr 0x194a8d000728)
0x194a8d000720    a0  d280000c       movz x12, #0x0
0x194a8d000724    a4  1400002d       b #+0xb4 (addr 0x194a8d0007d8)
0x194a8d000728    a8  52a9f010       movz w16, #0x4f800000
0x194a8d00072c    ac  1e270204       fmov s4, w16
0x194a8d000730    b0  1e242060       fcmp s3, s4
0x194a8d000734    b4  54000063       b.lo #+0xc (addr 0x194a8d000740)
0x194a8d000738    b8  d280000c       movz x12, #0x0
0x194a8d00073c    bc  14000027       b #+0x9c (addr 0x194a8d0007d8)
0x194a8d000740    c0  1e22c064       fcvt d4, s3
0x194a8d000744    c4  1e65c085       frintz d5, d4
0x194a8d000748    c8  1e7900ac       fcvtzu w12, d5
0x194a8d00074c    cc  1e630186       ucvtf d6, w12
0x194a8d000750    d0  1e6620a0       fcmp d5, d6
0x194a8d000754    d4  54006d81       b.ne #+0xdb0 (addr 0x194a8d001504)
0x194a8d000758    d8  71000d9f       cmp w12, #0x3 (3)
0x194a8d00075c    dc  54fffee3       b.lo #-0x24 (addr 0x194a8d000738)
0x194a8d000760    e0  9100512d       add x13, x9, #0x14 (20)
0x194a8d000764    e4  b86d6825       ldr w5, [x1, x13]
0x194a8d000768    e8  9100412d       add x13, x9, #0x10 (16)
0x194a8d00076c    ec  b86d6824       ldr w4, [x1, x13]
0x194a8d000770    f0  9100112d       add x13, x9, #0x4 (4)
0x194a8d000774    f4  b86d6822       ldr w2, [x1, x13]
0x194a8d000778    f8  d280800d       movz x13, #0x400
0x194a8d00077c    fc  7110019f       cmp w12, #0x400 (1024)
0x194a8d000780   100  1a8d318e       csel w14, w12, w13, lo
0x194a8d000784   104  9102312c       add x12, x9, #0x8c (140)
0x194a8d000788   108  b82c682e       str w14, [x1, x12]
0x194a8d00078c   10c  9102212c       add x12, x9, #0x88 (136)
0x194a8d000790   110  b82c682e       str w14, [x1, x12]
0x194a8d000794   114  1e2301c3       ucvtf s3, w14
0x194a8d000798   118  1e221863       fdiv s3, s3, s2
0x194a8d00079c   11c  9102112c       add x12, x9, #0x84 (132)
0x194a8d0007a0   120  bc2c6823       str s3, [x1, x12]
0x194a8d0007a4   124  11018000       add w0, w0, #0x60 (96)
0x194a8d0007a8   128  97fac3b5       bl #-0x14f12c (addr 0x194a8ceb167c)
0x194a8d0007ac   12c  fd4073e1       ldr d1, [sp, #224]
0x194a8d0007b0   130  d280002c       movz x12, #0x1
0x194a8d0007b4   134  f94087e6       ldr x6, [sp, #264]
0x194a8d0007b8   138  f94083e8       ldr x8, [sp, #256]
0x194a8d0007bc   13c  f9407fe1       ldr x1, [sp, #248]
0x194a8d0007c0   140  f9407be9       ldr x9, [sp, #240]
0x194a8d0007c4   144  f9408be7       ldr x7, [sp, #272]
0x194a8d0007c8   148  f94077e3       ldr x3, [sp, #232]
0x194a8d0007cc   14c  f94047ea       ldr x10, [sp, #136]
0x194a8d0007d0   150  fd401fe2       ldr d2, [sp, #56]
0x194a8d0007d4   154  f94027eb       ldr x11, [sp, #72]
0x194a8d0007d8   158  f90033ec       str x12, [sp, #96]
0x194a8d0007dc   15c  aa0303ed       mov x13, x3
0x194a8d0007e0   160  3400650d       cbz w13, #+0xca0 (addr 0x194a8d001480)
0x194a8d0007e4   164  9101712e       add x14, x9, #0x5c (92)
0x194a8d0007e8   168  b86e682e       ldr w14, [x1, x14]
0x194a8d0007ec   16c  9101412f       add x15, x9, #0x50 (80)
0x194a8d0007f0   170  b86f682f       ldr w15, [x1, x15]
0x194a8d0007f4   174  91011133       add x19, x9, #0x44 (68)
0x194a8d0007f8   178  b8736833       ldr w19, [x1, x19]
0x194a8d0007fc   17c  9100e134       add x20, x9, #0x38 (56)
0x194a8d000800   180  b8746834       ldr w20, [x1, x20]
0x194a8d000804   184  6b14027f       cmp w19, w20
0x194a8d000808   188  1a943275       csel w21, w19, w20, lo
0x194a8d00080c   18c  6b1501ff       cmp w15, w21
0x194a8d000810   190  1a9531f3       csel w19, w15, w21, lo
0x194a8d000814   194  6b1301df       cmp w14, w19
0x194a8d000818   198  1a9331cf       csel w15, w14, w19, lo
0x194a8d00081c   19c  1e3c1003       fmov s3, #0xe0 (-0.5000)
0x194a8d000820   1a0  1e230843       fmul s3, s2, s3
0x194a8d000824   1a4  1e2c1004       fmov s4, #0x60 (0.5000)
0x194a8d000828   1a8  1e240844       fmul s4, s2, s4
0x194a8d00082c   1ac  9101612e       add x14, x9, #0x58 (88)
0x194a8d000830   1b0  b86e682e       ldr w14, [x1, x14]
0x194a8d000834   1b4  91013133       add x19, x9, #0x4c (76)
0x194a8d000838   1b8  b8736833       ldr w19, [x1, x19]
0x194a8d00083c   1bc  91010134       add x20, x9, #0x40 (64)
0x194a8d000840   1c0  b8746834       ldr w20, [x1, x20]
0x194a8d000844   1c4  9100d135       add x21, x9, #0x34 (52)
0x194a8d000848   1c8  b8756835       ldr w21, [x1, x21]
0x194a8d00084c   1cc  11002116       add w22, w8, #0x8 (8)
0x194a8d000850   1d0  1e210821       fmul s1, s1, s1
0x194a8d000854   1d4  f90053ef       str x15, [sp, #160]
0x194a8d000858   1d8  fd001be3       str d3, [sp, #48]
0x194a8d00085c   1dc  fd0017e4       str d4, [sp, #40]
0x194a8d000860   1e0  f90067ee       str x14, [sp, #200]
0x194a8d000864   1e4  f9005ff3       str x19, [sp, #184]
0x194a8d000868   1e8  f9005bf4       str x20, [sp, #176]
0x194a8d00086c   1ec  f90057f5       str x21, [sp, #168]
0x194a8d000870   1f0  f90003f6       str x22, [sp]
0x194a8d000874   1f4  fd0023e1       str d1, [sp, #64]
0x194a8d000878   1f8  d280000a       movz x10, #0x0
0x194a8d00087c   1fc  14000002       b #+0x8 (addr 0x194a8d000884)
0x194a8d000880   200  aa0603ed       mov x13, x6
0x194a8d000884   204  f8520358       ldur x24, [x26, #-224]
0x194a8d000888   208  eb3863ff       cmp sp, x24
0x194a8d00088c   20c  540064c9       b.ls #+0xc98 (addr 0x194a8d001524)
0x194a8d000890   210  b86b6838       ldr w24, [x1, x11]
0x194a8d000894   214  f9003bf8       str x24, [sp, #112]
0x194a8d000898   218  6b0a031f       cmp w24, w10
0x194a8d00089c   21c  54005c69       b.ls #+0xb8c (addr 0x194a8d001428)
0x194a8d0008a0   220  91005139       add x25, x9, #0x14 (20)
0x194a8d0008a4   224  b8796839       ldr w25, [x1, x25]
0x194a8d0008a8   228  6b0a033f       cmp w25, w10
0x194a8d0008ac   22c  54005be9       b.ls #+0xb7c (addr 0x194a8d001428)
0x194a8d0008b0   230  9100813b       add cp, x9, #0x20 (32)
0x194a8d0008b4   234  b87b683b       ldr w27, [x1, x27]
0x194a8d0008b8   238  f9006ffb       str cp, [sp, #216]
0x194a8d0008bc   23c  6b0a037f       cmp w27, w10
0x194a8d0008c0   240  54005b49       b.ls #+0xb68 (addr 0x194a8d001428)
0x194a8d0008c4   244  9100b13c       add x28, x9, #0x2c (44)
0x194a8d0008c8   248  b87c683c       ldr w28, [x1, x28]
0x194a8d0008cc   24c  f9006bfc       str x28, [sp, #208]
0x194a8d0008d0   250  6b0a039f       cmp w28, w10
0x194a8d0008d4   254  54005aa9       b.ls #+0xb54 (addr 0x194a8d001428)
0x194a8d0008d8   258  91001120       add x0, x9, #0x4 (4)
0x194a8d0008dc   25c  b8606820       ldr w0, [x1, x0]
0x194a8d0008e0   260  531e7542       lsl w2, w10, #2
0x194a8d0008e4   264  0b020003       add w3, w0, w2
0x194a8d0008e8   268  bc636826       ldr s6, [x1, x3]
0x194a8d0008ec   26c  9100a123       add x3, x9, #0x28 (40)
0x194a8d0008f0   270  b8636823       ldr w3, [x1, x3]
0x194a8d0008f4   274  0b020064       add w4, w3, w2
0x194a8d0008f8   278  bc646827       ldr s7, [x1, x4]
0x194a8d0008fc   27c  91007124       add x4, x9, #0x1c (28)
0x194a8d000900   280  b8646824       ldr w4, [x1, x4]
0x194a8d000904   284  0b020085       add w5, w4, w2
0x194a8d000908   288  bc656828       ldr s8, [x1, x5]
0x194a8d00090c   28c  91004125       add x5, x9, #0x10 (16)
0x194a8d000910   290  b8656825       ldr w5, [x1, x5]
0x194a8d000914   294  0b0200a6       add w6, w5, w2
0x194a8d000918   298  bc666829       ldr s9, [x1, x6]
0x194a8d00091c   29c  f90073ea       str x10, [sp, #224]
0x194a8d000920   2a0  f90013e0       str x0, [sp, #32]
0x194a8d000924   2a4  f90063e2       str x2, [sp, #192]
0x194a8d000928   2a8  fd0043e6       str d6, [sp, #128]
0x194a8d00092c   2ac  f90007e3       str x3, [sp, #8]
0x194a8d000930   2b0  fd004be7       str d7, [sp, #144]
0x194a8d000934   2b4  f9000be4       str x4, [sp, #16]
0x194a8d000938   2b8  fd003fe8       str d8, [sp, #120]
0x194a8d00093c   2bc  f9000fe5       str x5, [sp, #24]
0x194a8d000940   2c0  fd004fe9       str d9, [sp, #152]
0x194a8d000944   2c4  3500090c       cbnz w12, #+0x120 (addr 0x194a8d000a64)
0x194a8d000948   2c8  6b19031f       cmp w24, w25
0x194a8d00094c   2cc  1a993306       csel w6, w24, w25, lo
0x194a8d000950   2d0  6b1c037f       cmp w27, w28
0x194a8d000954   2d4  1a9c3378       csel w24, w27, w28, lo
0x194a8d000958   2d8  6b1800df       cmp w6, w24
0x194a8d00095c   2dc  1a9830d9       csel w25, w6, w24, lo
0x194a8d000960   2e0  2f00e40a       movi d10, #0x0
0x194a8d000964   2e4  d2800006       movz x6, #0x0
0x194a8d000968   2e8  4eaa1d4b       mov v11.16b, v10.16b
0x194a8d00096c   2ec  14000002       b #+0x8 (addr 0x194a8d000974)
0x194a8d000970   2f0  aa1b03e6       mov x6, cp
0x194a8d000974   2f4  f8520358       ldur x24, [x26, #-224]
0x194a8d000978   2f8  eb3863ff       cmp sp, x24
0x194a8d00097c   2fc  54005f09       b.ls #+0xbe0 (addr 0x194a8d00155c)
0x194a8d000980   300  6b06033f       cmp w25, w6
0x194a8d000984   304  9a9f87f8       cset x24, ls
0x194a8d000988   308  aa0603fb       mov cp, x6
0x194a8d00098c   30c  1100077b       add w27, w27, #0x1 (1)
0x194a8d000990   310  34000218       cbz w24, #+0x40 (addr 0x194a8d0009d0)
0x194a8d000994   314  6b0d037f       cmp w27, w13
0x194a8d000998   318  54004382       b.hs #+0x870 (addr 0x194a8d001208)
0x194a8d00099c   31c  1100077b       add w27, w27, #0x1 (1)
0x194a8d0009a0   320  6b0d037f       cmp w27, w13
0x194a8d0009a4   324  54004322       b.hs #+0x864 (addr 0x194a8d001208)
0x194a8d0009a8   328  1100077b       add w27, w27, #0x1 (1)
0x194a8d0009ac   32c  6b0d037f       cmp w27, w13
0x194a8d0009b0   330  540042c2       b.hs #+0x858 (addr 0x194a8d001208)
0x194a8d0009b4   334  f852035c       ldur x28, [x26, #-224]
0x194a8d0009b8   338  eb3c63ff       cmp sp, x28
0x194a8d0009bc   33c  540060a9       b.ls #+0xc14 (addr 0x194a8d0015d0)
0x194a8d0009c0   340  1100077b       add w27, w27, #0x1 (1)
0x194a8d0009c4   344  6b0d037f       cmp w27, w13
0x194a8d0009c8   348  54fffe23       b.lo #-0x3c (addr 0x194a8d00098c)
0x194a8d0009cc   34c  1400020f       b #+0x83c (addr 0x194a8d001208)
0x194a8d0009d0   350  531e74c6       lsl w6, w6, #2
0x194a8d0009d4   354  0b060078       add w24, w3, w6
0x194a8d0009d8   358  0b06009c       add w28, w4, w6
0x194a8d0009dc   35c  0b0600aa       add w10, w5, w6
0x194a8d0009e0   360  bc6a682c       ldr s12, [x1, x10]
0x194a8d0009e4   364  0b060006       add w6, w0, w6
0x194a8d0009e8   368  bc66682d       ldr s13, [x1, x6]
0x194a8d0009ec   36c  1e2d38cd       fsub s13, s6, s13
0x194a8d0009f0   370  1e2d2080       fcmp s4, s13
0x194a8d0009f4   374  540000a3       b.lo #+0x14 (addr 0x194a8d000a08)
0x194a8d0009f8   378  1e2321a0       fcmp s13, s3
0x194a8d0009fc   37c  54000082       b.hs #+0x10 (addr 0x194a8d000a0c)
0x194a8d000a00   380  1e2d284d       fadd s13, s2, s13
0x194a8d000a04   384  14000002       b #+0x8 (addr 0x194a8d000a0c)
0x194a8d000a08   388  1e2239ad       fsub s13, s13, s2
0x194a8d000a0c   38c  bc78682e       ldr s14, [x1, x24]
0x194a8d000a10   390  bc7c6830       ldr s16, [x1, x28]
0x194a8d000a14   394  1e2c392c       fsub s12, s9, s12
0x194a8d000a18   398  1e2c2080       fcmp s4, s12
0x194a8d000a1c   39c  540000a3       b.lo #+0x14 (addr 0x194a8d000a30)
0x194a8d000a20   3a0  1e232180       fcmp s12, s3
0x194a8d000a24   3a4  54000082       b.hs #+0x10 (addr 0x194a8d000a34)
0x194a8d000a28   3a8  1e2c284c       fadd s12, s2, s12
0x194a8d000a2c   3ac  14000002       b #+0x8 (addr 0x194a8d000a34)
0x194a8d000a30   3b0  1e22398c       fsub s12, s12, s2
0x194a8d000a34   3b4  1e302970       fadd s16, s11, s16
0x194a8d000a38   3b8  1e2d09ad       fmul s13, s13, s13
0x194a8d000a3c   3bc  1e2c098c       fmul s12, s12, s12
0x194a8d000a40   3c0  1e2c29ac       fadd s12, s13, s12
0x194a8d000a44   3c4  1e212180       fcmp s12, s1
0x194a8d000a48   3c8  1e2b3e0b       fcsel s11, s16, s11, lo
0x194a8d000a4c   3cc  1e2e294d       fadd s13, s10, s14
0x194a8d000a50   3d0  1e212180       fcmp s12, s1
0x194a8d000a54   3d4  1e2a3daa       fcsel s10, s13, s10, lo
0x194a8d000a58   3d8  6b0d037f       cmp w27, w13
0x194a8d000a5c   3dc  54fff8a3       b.lo #-0xec (addr 0x194a8d000970)
0x194a8d000a60   3e0  140001ea       b #+0x7a8 (addr 0x194a8d001208)
0x194a8d000a64   3e4  91023126       add x6, x9, #0x8c (140)
0x194a8d000a68   3e8  b8666826       ldr w6, [x1, x6]
0x194a8d000a6c   3ec  710000df       cmp w6, #0x0 (0)
0x194a8d000a70   3f0  9a9f17ea       cset x10, eq
0x194a8d000a74   3f4  34004e46       cbz w6, #+0x9c8 (addr 0x194a8d00143c)
0x194a8d000a78   3f8  9102212b       add x11, x9, #0x88 (136)
0x194a8d000a7c   3fc  b86b682b       ldr w11, [x1, x11]
0x194a8d000a80   400  7100017f       cmp w11, #0x0 (0)
0x194a8d000a84   404  9a9f17ec       cset x12, eq
0x194a8d000a88   408  34004eab       cbz w11, #+0x9d4 (addr 0x194a8d00145c)
0x194a8d000a8c   40c  9101912d       add x13, x9, #0x64 (100)
0x194a8d000a90   410  b86d682d       ldr w13, [x1, x13]
0x194a8d000a94   414  7100015f       cmp w10, #0x0 (0)
0x194a8d000a98   418  9a9f17ea       cset x10, eq
0x194a8d000a9c   41c  4b0a00ca       sub w10, w6, w10
0x194a8d000aa0   420  9102112e       add x14, x9, #0x84 (132)
0x194a8d000aa4   424  bc6e682a       ldr s10, [x1, x14]
0x194a8d000aa8   428  1e2a092b       fmul s11, s9, s10
0x194a8d000aac   42c  1e25416b       frintm s11, s11
0x194a8d000ab0   430  1e2b2160       fcmp s11, s11
0x194a8d000ab4   434  1e2b1deb       fcsel s11, s15, s11, ne
0x194a8d000ab8   438  1e202168       fcmp s11, #0.0
0x194a8d000abc   43c  1e2fcd6b       fcsel s11, s11, s15, gt
0x194a8d000ac0   440  1e22c16c       fcvt d12, s11
0x194a8d000ac4   444  1e65c18d       frintz d13, d12
0x194a8d000ac8   448  1e7901ae       fcvtzu w14, d13
0x194a8d000acc   44c  1e6301ce       ucvtf d14, w14
0x194a8d000ad0   450  1e6e21a0       fcmp d13, d14
0x194a8d000ad4   454  54005c01       b.ne #+0xb80 (addr 0x194a8d001654)
0x194a8d000ad8   458  6b0e015f       cmp w10, w14
0x194a8d000adc   45c  1a8e314f       csel w15, w10, w14, lo
0x194a8d000ae0   460  52a9f010       movz w16, #0x4f800000
0x194a8d000ae4   464  1e27020c       fmov s12, w16
0x194a8d000ae8   468  1e2c2160       fcmp s11, s12
0x194a8d000aec   46c  1a9f31ea       csel w10, w15, wzr, lo
0x194a8d000af0   470  0b06014a       add w10, w10, w6
0x194a8d000af4   474  5100054e       sub w14, w10, #0x1 (1)
0x194a8d000af8   478  1ac609d0       udiv w16, w14, w6
0x194a8d000afc   47c  1b06ba0e       msub w14, w16, w6, w14
0x194a8d000b00   480  1b0b7dce       mul w14, w14, w11
0x194a8d000b04   484  7100019f       cmp w12, #0x0 (0)
0x194a8d000b08   488  9a9f17ec       cset x12, eq
0x194a8d000b0c   48c  4b0c016c       sub w12, w11, w12
0x194a8d000b10   490  1e2a08ca       fmul s10, s6, s10
0x194a8d000b14   494  1e25414a       frintm s10, s10
0x194a8d000b18   498  1e2a2140       fcmp s10, s10
0x194a8d000b1c   49c  1e2a1dea       fcsel s10, s15, s10, ne
0x194a8d000b20   4a0  1e202148       fcmp s10, #0.0
0x194a8d000b24   4a4  1e2fcd4a       fcsel s10, s10, s15, gt
0x194a8d000b28   4a8  1e22c14b       fcvt d11, s10
0x194a8d000b2c   4ac  1e65c16d       frintz d13, d11
0x194a8d000b30   4b0  1e7901af       fcvtzu w15, d13
0x194a8d000b34   4b4  1e6301ee       ucvtf d14, w15
0x194a8d000b38   4b8  1e6e21a0       fcmp d13, d14
0x194a8d000b3c   4bc  540059c1       b.ne #+0xb38 (addr 0x194a8d001674)
0x194a8d000b40   4c0  6b0f019f       cmp w12, w15
0x194a8d000b44   4c4  1a8f3193       csel w19, w12, w15, lo
0x194a8d000b48   4c8  1e2c2140       fcmp s10, s12
0x194a8d000b4c   4cc  1a9f326c       csel w12, w19, wzr, lo
0x194a8d000b50   4d0  0b0b018c       add w12, w12, w11
0x194a8d000b54   4d4  5100058f       sub w15, w12, #0x1 (1)
0x194a8d000b58   4d8  1acb09f0       udiv w16, w15, w11
0x194a8d000b5c   4dc  1b0bbe0f       msub w15, w16, w11, w15
0x194a8d000b60   4e0  0b0f01d3       add w19, w14, w15
0x194a8d000b64   4e4  9101a134       add x20, x9, #0x68 (104)
0x194a8d000b68   4e8  b8746834       ldr w20, [x1, x20]
0x194a8d000b6c   4ec  6b14027f       cmp w19, w20
0x194a8d000b70   4f0  54000083       b.lo #+0x10 (addr 0x194a8d000b80)
0x194a8d000b74   4f4  d2800013       movz x19, #0x0
0x194a8d000b78   4f8  aa1303f5       mov x21, x19
0x194a8d000b7c   4fc  14000014       b #+0x50 (addr 0x194a8d000bcc)
0x194a8d000b80   500  11000675       add w21, w19, #0x1 (1)
0x194a8d000b84   504  6b15029f       cmp w20, w21
0x194a8d000b88   508  54ffff69       b.ls #-0x14 (addr 0x194a8d000b74)
0x194a8d000b8c   50c  0b1509b5       add w21, w13, w21, lsl #2
0x194a8d000b90   510  b8756835       ldr w21, [x1, x21]
0x194a8d000b94   514  0b1309b3       add w19, w13, w19, lsl #2
0x194a8d000b98   518  b8736833       ldr w19, [x1, x19]
0x194a8d000b9c   51c  6b1302bf       cmp w21, w19
0x194a8d000ba0   520  54000103       b.lo #+0x20 (addr 0x194a8d000bc0)
0x194a8d000ba4   524  91020137       add x23, x9, #0x80 (128)
0x194a8d000ba8   528  b8776837       ldr w23, [x1, x23]
0x194a8d000bac   52c  6b1502ff       cmp w23, w21
0x194a8d000bb0   530  540000e2       b.hs #+0x1c (addr 0x194a8d000bcc)
0x194a8d000bb4   534  d2800093       movz x19, #0x4
0x194a8d000bb8   538  d2800015       movz x21, #0x0
0x194a8d000bbc   53c  14000008       b #+0x20 (addr 0x194a8d000bdc)
0x194a8d000bc0   540  d2800015       movz x21, #0x0
0x194a8d000bc4   544  d2800093       movz x19, #0x4
0x194a8d000bc8   548  14000005       b #+0x14 (addr 0x194a8d000bdc)
0x194a8d000bcc   54c  4b1302b5       sub w21, w21, w19
0x194a8d000bd0   550  9101f137       add x23, x9, #0x7c (124)
0x194a8d000bd4   554  b8776837       ldr w23, [x1, x23]
0x194a8d000bd8   558  0b130af3       add w19, w23, w19, lsl #2
0x194a8d000bdc   55c  1acb0990       udiv w16, w12, w11
0x194a8d000be0   560  1b0bb217       msub w23, w16, w11, w12
0x194a8d000be4   564  0b0e02e2       add w2, w23, w14
0x194a8d000be8   568  6b14005f       cmp w2, w20
0x194a8d000bec   56c  54000083       b.lo #+0x10 (addr 0x194a8d000bfc)
0x194a8d000bf0   570  d2800002       movz x2, #0x0
0x194a8d000bf4   574  aa0203e7       mov x7, x2
0x194a8d000bf8   578  14000017       b #+0x5c (addr 0x194a8d000c54)
0x194a8d000bfc   57c  11000447       add w7, w2, #0x1 (1)
0x194a8d000c00   580  6b07029f       cmp w20, w7
0x194a8d000c04   584  54ffff69       b.ls #-0x14 (addr 0x194a8d000bf0)
0x194a8d000c08   588  0b0709a7       add w7, w13, w7, lsl #2
0x194a8d000c0c   58c  b8676827       ldr w7, [x1, x7]
0x194a8d000c10   590  0b0209a2       add w2, w13, w2, lsl #2
0x194a8d000c14   594  b8626822       ldr w2, [x1, x2]
0x194a8d000c18   598  6b0200ff       cmp w7, w2
0x194a8d000c1c   59c  54000163       b.lo #+0x2c (addr 0x194a8d000c48)
0x194a8d000c20   5a0  91020120       add x0, x9, #0x80 (128)
0x194a8d000c24   5a4  b8606820       ldr w0, [x1, x0]
0x194a8d000c28   5a8  6b07001f       cmp w0, w7
0x194a8d000c2c   5ac  54000063       b.lo #+0xc (addr 0x194a8d000c38)
0x194a8d000c30   5b0  f94013e0       ldr x0, [sp, #32]
0x194a8d000c34   5b4  14000008       b #+0x20 (addr 0x194a8d000c54)
0x194a8d000c38   5b8  f94013e0       ldr x0, [sp, #32]
0x194a8d000c3c   5bc  d2800007       movz x7, #0x0
0x194a8d000c40   5c0  d2800082       movz x2, #0x4
0x194a8d000c44   5c4  14000009       b #+0x24 (addr 0x194a8d000c68)
0x194a8d000c48   5c8  d2800007       movz x7, #0x0
0x194a8d000c4c   5cc  d2800082       movz x2, #0x4
0x194a8d000c50   5d0  14000006       b #+0x18 (addr 0x194a8d000c68)
0x194a8d000c54   5d4  4b0200e7       sub w7, w7, w2
0x194a8d000c58   5d8  9101f125       add x5, x9, #0x7c (124)
0x194a8d000c5c   5dc  b8656825       ldr w5, [x1, x5]
0x194a8d000c60   5e0  0b0208a2       add w2, w5, w2, lsl #2
0x194a8d000c64   5e4  f9400fe5       ldr x5, [sp, #24]
0x194a8d000c68   5e8  1100058c       add w12, w12, #0x1 (1)
0x194a8d000c6c   5ec  1acb0990       udiv w16, w12, w11
0x194a8d000c70   5f0  1b0bb20c       msub w12, w16, w11, w12
0x194a8d000c74   5f4  0b0e018e       add w14, w12, w14
0x194a8d000c78   5f8  6b1401df       cmp w14, w20
0x194a8d000c7c   5fc  54000083       b.lo #+0x10 (addr 0x194a8d000c8c)
0x194a8d000c80   600  d2800004       movz x4, #0x0
0x194a8d000c84   604  aa0403ee       mov x14, x4
0x194a8d000c88   608  14000017       b #+0x5c (addr 0x194a8d000ce4)
0x194a8d000c8c   60c  110005c4       add w4, w14, #0x1 (1)
0x194a8d000c90   610  6b04029f       cmp w20, w4
0x194a8d000c94   614  54ffff69       b.ls #-0x14 (addr 0x194a8d000c80)
0x194a8d000c98   618  0b0409a4       add w4, w13, w4, lsl #2
0x194a8d000c9c   61c  b8646824       ldr w4, [x1, x4]
0x194a8d000ca0   620  0b0e09ae       add w14, w13, w14, lsl #2
0x194a8d000ca4   624  b86e682e       ldr w14, [x1, x14]
0x194a8d000ca8   628  6b0e009f       cmp w4, w14
0x194a8d000cac   62c  54000163       b.lo #+0x2c (addr 0x194a8d000cd8)
0x194a8d000cb0   630  91020123       add x3, x9, #0x80 (128)
0x194a8d000cb4   634  b8636823       ldr w3, [x1, x3]
0x194a8d000cb8   638  6b04007f       cmp w3, w4
0x194a8d000cbc   63c  54000063       b.lo #+0xc (addr 0x194a8d000cc8)
0x194a8d000cc0   640  f94007e3       ldr x3, [sp, #8]
0x194a8d000cc4   644  14000008       b #+0x20 (addr 0x194a8d000ce4)
0x194a8d000cc8   648  d280008e       movz x14, #0x4
0x194a8d000ccc   64c  d2800004       movz x4, #0x0
0x194a8d000cd0   650  f94007e3       ldr x3, [sp, #8]
0x194a8d000cd4   654  14000008       b #+0x20 (addr 0x194a8d000cf4)
0x194a8d000cd8   658  d2800004       movz x4, #0x0
0x194a8d000cdc   65c  d280008e       movz x14, #0x4
0x194a8d000ce0   660  14000005       b #+0x14 (addr 0x194a8d000cf4)
0x194a8d000ce4   664  4b0e0084       sub w4, w4, w14
0x194a8d000ce8   668  9101f136       add x22, x9, #0x7c (124)
0x194a8d000cec   66c  b8766836       ldr w22, [x1, x22]
0x194a8d000cf0   670  0b0e0ace       add w14, w22, w14, lsl #2
0x194a8d000cf4   674  1ac60950       udiv w16, w10, w6
0x194a8d000cf8   678  1b06aa16       msub w22, w16, w6, w10
0x194a8d000cfc   67c  1b0b7ed6       mul w22, w22, w11
0x194a8d000d00   680  0b0f02c0       add w0, w22, w15
0x194a8d000d04   684  6b14001f       cmp w0, w20
0x194a8d000d08   688  54000083       b.lo #+0x10 (addr 0x194a8d000d18)
0x194a8d000d0c   68c  d2800000       movz x0, #0x0
0x194a8d000d10   690  aa0003e3       mov x3, x0
0x194a8d000d14   694  14000014       b #+0x50 (addr 0x194a8d000d64)
0x194a8d000d18   698  11000403       add w3, w0, #0x1 (1)
0x194a8d000d1c   69c  6b03029f       cmp w20, w3
0x194a8d000d20   6a0  54ffff69       b.ls #-0x14 (addr 0x194a8d000d0c)
0x194a8d000d24   6a4  0b0309a3       add w3, w13, w3, lsl #2
0x194a8d000d28   6a8  b8636823       ldr w3, [x1, x3]
0x194a8d000d2c   6ac  0b0009a0       add w0, w13, w0, lsl #2
0x194a8d000d30   6b0  b8606820       ldr w0, [x1, x0]
0x194a8d000d34   6b4  6b00007f       cmp w3, w0
0x194a8d000d38   6b8  54000103       b.lo #+0x20 (addr 0x194a8d000d58)
0x194a8d000d3c   6bc  91020125       add x5, x9, #0x80 (128)
0x194a8d000d40   6c0  b8656825       ldr w5, [x1, x5]
0x194a8d000d44   6c4  6b0300bf       cmp w5, w3
0x194a8d000d48   6c8  540000e2       b.hs #+0x1c (addr 0x194a8d000d64)
0x194a8d000d4c   6cc  d2800080       movz x0, #0x4
0x194a8d000d50   6d0  d2800003       movz x3, #0x0
0x194a8d000d54   6d4  14000008       b #+0x20 (addr 0x194a8d000d74)
0x194a8d000d58   6d8  d2800003       movz x3, #0x0
0x194a8d000d5c   6dc  d2800080       movz x0, #0x4
0x194a8d000d60   6e0  14000005       b #+0x14 (addr 0x194a8d000d74)
0x194a8d000d64   6e4  4b000063       sub w3, w3, w0
0x194a8d000d68   6e8  9101f125       add x5, x9, #0x7c (124)
0x194a8d000d6c   6ec  b8656825       ldr w5, [x1, x5]
0x194a8d000d70   6f0  0b0008a0       add w0, w5, w0, lsl #2
0x194a8d000d74   6f4  0b1702c5       add w5, w22, w23
0x194a8d000d78   6f8  6b1400bf       cmp w5, w20
0x194a8d000d7c   6fc  54000083       b.lo #+0x10 (addr 0x194a8d000d8c)
0x194a8d000d80   700  d2800005       movz x5, #0x0
0x194a8d000d84   704  aa0503fb       mov cp, x5
0x194a8d000d88   708  14000014       b #+0x50 (addr 0x194a8d000dd8)
0x194a8d000d8c   70c  110004bb       add w27, w5, #0x1 (1)
0x194a8d000d90   710  6b1b029f       cmp w20, w27
0x194a8d000d94   714  54ffff69       b.ls #-0x14 (addr 0x194a8d000d80)
0x194a8d000d98   718  0b1b09bb       add w27, w13, w27, lsl #2
0x194a8d000d9c   71c  b87b683b       ldr w27, [x1, x27]
0x194a8d000da0   720  0b0509a5       add w5, w13, w5, lsl #2
0x194a8d000da4   724  b8656825       ldr w5, [x1, x5]
0x194a8d000da8   728  6b05037f       cmp w27, w5
0x194a8d000dac   72c  54000103       b.lo #+0x20 (addr 0x194a8d000dcc)
0x194a8d000db0   730  9102013c       add x28, x9, #0x80 (128)
0x194a8d000db4   734  b87c683c       ldr w28, [x1, x28]
0x194a8d000db8   738  6b1b039f       cmp w28, w27
0x194a8d000dbc   73c  540000e2       b.hs #+0x1c (addr 0x194a8d000dd8)
0x194a8d000dc0   740  d280009b       movz cp, #0x4
0x194a8d000dc4   744  d280001c       movz x28, #0x0
0x194a8d000dc8   748  1400000b       b #+0x2c (addr 0x194a8d000df4)
0x194a8d000dcc   74c  d280001c       movz x28, #0x0
0x194a8d000dd0   750  d280009b       movz cp, #0x4
0x194a8d000dd4   754  14000008       b #+0x20 (addr 0x194a8d000df4)
0x194a8d000dd8   758  4b05037b       sub w27, w27, w5
0x194a8d000ddc   75c  9101f13c       add x28, x9, #0x7c (124)
0x194a8d000de0   760  b87c683c       ldr w28, [x1, x28]
0x194a8d000de4   764  0b050b9c       add w28, w28, w5, lsl #2
0x194a8d000de8   768  aa1b03f0       mov x16, cp
0x194a8d000dec   76c  aa1c03fb       mov cp, x28
0x194a8d000df0   770  aa1003fc       mov x28, x16
0x194a8d000df4   774  0b0c02d6       add w22, w22, w12
0x194a8d000df8   778  6b1402df       cmp w22, w20
0x194a8d000dfc   77c  54000083       b.lo #+0x10 (addr 0x194a8d000e0c)
0x194a8d000e00   780  d2800005       movz x5, #0x0
0x194a8d000e04   784  aa0503f6       mov x22, x5
0x194a8d000e08   788  14000014       b #+0x50 (addr 0x194a8d000e58)
0x194a8d000e0c   78c  110006c5       add w5, w22, #0x1 (1)
0x194a8d000e10   790  6b05029f       cmp w20, w5
0x194a8d000e14   794  54ffff69       b.ls #-0x14 (addr 0x194a8d000e00)
0x194a8d000e18   798  0b0509a5       add w5, w13, w5, lsl #2
0x194a8d000e1c   79c  b8656825       ldr w5, [x1, x5]
0x194a8d000e20   7a0  0b1609b6       add w22, w13, w22, lsl #2
0x194a8d000e24   7a4  b8766836       ldr w22, [x1, x22]
0x194a8d000e28   7a8  6b1600bf       cmp w5, w22
0x194a8d000e2c   7ac  54000103       b.lo #+0x20 (addr 0x194a8d000e4c)
0x194a8d000e30   7b0  91020138       add x24, x9, #0x80 (128)
0x194a8d000e34   7b4  b8786838       ldr w24, [x1, x24]
0x194a8d000e38   7b8  6b05031f       cmp w24, w5
0x194a8d000e3c   7bc  540000e2       b.hs #+0x1c (addr 0x194a8d000e58)
0x194a8d000e40   7c0  d2800096       movz x22, #0x4
0x194a8d000e44   7c4  d2800005       movz x5, #0x0
0x194a8d000e48   7c8  14000008       b #+0x20 (addr 0x194a8d000e68)
0x194a8d000e4c   7cc  d2800005       movz x5, #0x0
0x194a8d000e50   7d0  d2800096       movz x22, #0x4
0x194a8d000e54   7d4  14000005       b #+0x14 (addr 0x194a8d000e68)
0x194a8d000e58   7d8  4b1600a5       sub w5, w5, w22
0x194a8d000e5c   7dc  9101f138       add x24, x9, #0x7c (124)
0x194a8d000e60   7e0  b8786838       ldr w24, [x1, x24]
0x194a8d000e64   7e4  0b160b16       add w22, w24, w22, lsl #2
0x194a8d000e68   7e8  1100054a       add w10, w10, #0x1 (1)
0x194a8d000e6c   7ec  1ac60950       udiv w16, w10, w6
0x194a8d000e70   7f0  1b06aa06       msub w6, w16, w6, w10
0x194a8d000e74   7f4  1b0b7cc6       mul w6, w6, w11
0x194a8d000e78   7f8  0b0f00ca       add w10, w6, w15
0x194a8d000e7c   7fc  6b14015f       cmp w10, w20
0x194a8d000e80   800  54000083       b.lo #+0x10 (addr 0x194a8d000e90)
0x194a8d000e84   804  d280000a       movz x10, #0x0
0x194a8d000e88   808  aa0a03eb       mov x11, x10
0x194a8d000e8c   80c  14000014       b #+0x50 (addr 0x194a8d000edc)
0x194a8d000e90   810  1100054b       add w11, w10, #0x1 (1)
0x194a8d000e94   814  6b0b029f       cmp w20, w11
0x194a8d000e98   818  54ffff69       b.ls #-0x14 (addr 0x194a8d000e84)
0x194a8d000e9c   81c  0b0b09ab       add w11, w13, w11, lsl #2
0x194a8d000ea0   820  b86b682b       ldr w11, [x1, x11]
0x194a8d000ea4   824  0b0a09aa       add w10, w13, w10, lsl #2
0x194a8d000ea8   828  b86a682a       ldr w10, [x1, x10]
0x194a8d000eac   82c  6b0a017f       cmp w11, w10
0x194a8d000eb0   830  54000103       b.lo #+0x20 (addr 0x194a8d000ed0)
0x194a8d000eb4   834  9102012f       add x15, x9, #0x80 (128)
0x194a8d000eb8   838  b86f682f       ldr w15, [x1, x15]
0x194a8d000ebc   83c  6b0b01ff       cmp w15, w11
0x194a8d000ec0   840  540000e2       b.hs #+0x1c (addr 0x194a8d000edc)
0x194a8d000ec4   844  d280008a       movz x10, #0x4
0x194a8d000ec8   848  d280000b       movz x11, #0x0
0x194a8d000ecc   84c  14000008       b #+0x20 (addr 0x194a8d000eec)
0x194a8d000ed0   850  d280000b       movz x11, #0x0
0x194a8d000ed4   854  d280008a       movz x10, #0x4
0x194a8d000ed8   858  14000005       b #+0x14 (addr 0x194a8d000eec)
0x194a8d000edc   85c  4b0a016b       sub w11, w11, w10
0x194a8d000ee0   860  9101f12f       add x15, x9, #0x7c (124)
0x194a8d000ee4   864  b86f682f       ldr w15, [x1, x15]
0x194a8d000ee8   868  0b0a09ea       add w10, w15, w10, lsl #2
0x194a8d000eec   86c  0b1700cf       add w15, w6, w23
0x194a8d000ef0   870  6b1401ff       cmp w15, w20
0x194a8d000ef4   874  54000083       b.lo #+0x10 (addr 0x194a8d000f04)
0x194a8d000ef8   878  d280000f       movz x15, #0x0
0x194a8d000efc   87c  aa0f03f7       mov x23, x15
0x194a8d000f00   880  14000014       b #+0x50 (addr 0x194a8d000f50)
0x194a8d000f04   884  110005f7       add w23, w15, #0x1 (1)
0x194a8d000f08   888  6b17029f       cmp w20, w23
0x194a8d000f0c   88c  54ffff69       b.ls #-0x14 (addr 0x194a8d000ef8)
0x194a8d000f10   890  0b1709b7       add w23, w13, w23, lsl #2
0x194a8d000f14   894  b8776837       ldr w23, [x1, x23]
0x194a8d000f18   898  0b0f09af       add w15, w13, w15, lsl #2
0x194a8d000f1c   89c  b86f682f       ldr w15, [x1, x15]
0x194a8d000f20   8a0  6b0f02ff       cmp w23, w15
0x194a8d000f24   8a4  54000103       b.lo #+0x20 (addr 0x194a8d000f44)
0x194a8d000f28   8a8  91020138       add x24, x9, #0x80 (128)
0x194a8d000f2c   8ac  b8786838       ldr w24, [x1, x24]
0x194a8d000f30   8b0  6b17031f       cmp w24, w23
0x194a8d000f34   8b4  540000e2       b.hs #+0x1c (addr 0x194a8d000f50)
0x194a8d000f38   8b8  d280008f       movz x15, #0x4
0x194a8d000f3c   8bc  d2800017       movz x23, #0x0
0x194a8d000f40   8c0  14000008       b #+0x20 (addr 0x194a8d000f60)
0x194a8d000f44   8c4  d2800017       movz x23, #0x0
0x194a8d000f48   8c8  d280008f       movz x15, #0x4
0x194a8d000f4c   8cc  14000005       b #+0x14 (addr 0x194a8d000f60)
0x194a8d000f50   8d0  4b0f02f7       sub w23, w23, w15
0x194a8d000f54   8d4  9101f138       add x24, x9, #0x7c (124)
0x194a8d000f58   8d8  b8786838       ldr w24, [x1, x24]
0x194a8d000f5c   8dc  0b0f0b0f       add w15, w24, w15, lsl #2
0x194a8d000f60   8e0  0b0c00c6       add w6, w6, w12
0x194a8d000f64   8e4  6b1400df       cmp w6, w20
0x194a8d000f68   8e8  54000083       b.lo #+0x10 (addr 0x194a8d000f78)
0x194a8d000f6c   8ec  d2800006       movz x6, #0x0
0x194a8d000f70   8f0  aa0603ec       mov x12, x6
0x194a8d000f74   8f4  14000014       b #+0x50 (addr 0x194a8d000fc4)
0x194a8d000f78   8f8  110004cc       add w12, w6, #0x1 (1)
0x194a8d000f7c   8fc  6b0c029f       cmp w20, w12
0x194a8d000f80   900  54ffff69       b.ls #-0x14 (addr 0x194a8d000f6c)
0x194a8d000f84   904  0b0c09ac       add w12, w13, w12, lsl #2
0x194a8d000f88   908  b86c682c       ldr w12, [x1, x12]
0x194a8d000f8c   90c  0b0609a6       add w6, w13, w6, lsl #2
0x194a8d000f90   910  b8666826       ldr w6, [x1, x6]
0x194a8d000f94   914  6b06019f       cmp w12, w6
0x194a8d000f98   918  54000103       b.lo #+0x20 (addr 0x194a8d000fb8)
0x194a8d000f9c   91c  9102012d       add x13, x9, #0x80 (128)
0x194a8d000fa0   920  b86d682d       ldr w13, [x1, x13]
0x194a8d000fa4   924  6b0c01bf       cmp w13, w12
0x194a8d000fa8   928  540000e2       b.hs #+0x1c (addr 0x194a8d000fc4)
0x194a8d000fac   92c  d2800086       movz x6, #0x4
0x194a8d000fb0   930  d280000c       movz x12, #0x0
0x194a8d000fb4   934  14000008       b #+0x20 (addr 0x194a8d000fd4)
0x194a8d000fb8   938  d280000c       movz x12, #0x0
0x194a8d000fbc   93c  d2800086       movz x6, #0x4
0x194a8d000fc0   940  14000005       b #+0x14 (addr 0x194a8d000fd4)
0x194a8d000fc4   944  4b06018c       sub w12, w12, w6
0x194a8d000fc8   948  9101f12d       add x13, x9, #0x7c (124)
0x194a8d000fcc   94c  b86d682d       ldr w13, [x1, x13]
0x194a8d000fd0   950  0b0609a6       add w6, w13, w6, lsl #2
0x194a8d000fd4   954  9101310d       add x13, x8, #0x4c (76)
0x194a8d000fd8   958  b82d682c       str w12, [x1, x13]
0x194a8d000fdc   95c  9101210c       add x12, x8, #0x48 (72)
0x194a8d000fe0   960  b82c6826       str w6, [x1, x12]
0x194a8d000fe4   964  91011106       add x6, x8, #0x44 (68)
0x194a8d000fe8   968  b8266837       str w23, [x1, x6]
0x194a8d000fec   96c  91010106       add x6, x8, #0x40 (64)
0x194a8d000ff0   970  b826682f       str w15, [x1, x6]
0x194a8d000ff4   974  9100f106       add x6, x8, #0x3c (60)
0x194a8d000ff8   978  b826682b       str w11, [x1, x6]
0x194a8d000ffc   97c  9100e106       add x6, x8, #0x38 (56)
0x194a8d001000   980  b826682a       str w10, [x1, x6]
0x194a8d001004   984  9100d106       add x6, x8, #0x34 (52)
0x194a8d001008   988  b8266825       str w5, [x1, x6]
0x194a8d00100c   98c  9100c106       add x6, x8, #0x30 (48)
0x194a8d001010   990  b8266836       str w22, [x1, x6]
0x194a8d001014   994  9100b106       add x6, x8, #0x2c (44)
0x194a8d001018   998  b826683c       str w28, [x1, x6]
0x194a8d00101c   99c  9100a106       add x6, x8, #0x28 (40)
0x194a8d001020   9a0  b826683b       str w27, [x1, x6]
0x194a8d001024   9a4  91009106       add x6, x8, #0x24 (36)
0x194a8d001028   9a8  b8266823       str w3, [x1, x6]
0x194a8d00102c   9ac  91008106       add x6, x8, #0x20 (32)
0x194a8d001030   9b0  b8266820       str w0, [x1, x6]
0x194a8d001034   9b4  91007106       add x6, x8, #0x1c (28)
0x194a8d001038   9b8  b8266824       str w4, [x1, x6]
0x194a8d00103c   9bc  91006106       add x6, x8, #0x18 (24)
0x194a8d001040   9c0  b826682e       str w14, [x1, x6]
0x194a8d001044   9c4  91005106       add x6, x8, #0x14 (20)
0x194a8d001048   9c8  b8266827       str w7, [x1, x6]
0x194a8d00104c   9cc  91004106       add x6, x8, #0x10 (16)
0x194a8d001050   9d0  b8266822       str w2, [x1, x6]
0x194a8d001054   9d4  91003106       add x6, x8, #0xc (12)
0x194a8d001058   9d8  b8266835       str w21, [x1, x6]
0x194a8d00105c   9dc  91002106       add x6, x8, #0x8 (8)
0x194a8d001060   9e0  b8266833       str w19, [x1, x6]
0x194a8d001064   9e4  d2c00126       movz x6, #0x900000000
0x194a8d001068   9e8  f8286826       str x6, [x1, x8]
0x194a8d00106c   9ec  f9403be6       ldr x6, [sp, #112]
0x194a8d001070   9f0  6b1900df       cmp w6, w25
0x194a8d001074   9f4  1a9930ca       csel w10, w6, w25, lo
0x194a8d001078   9f8  f9406fe6       ldr x6, [sp, #216]
0x194a8d00107c   9fc  f9406beb       ldr x11, [sp, #208]
0x194a8d001080   a00  6b0b00df       cmp w6, w11
0x194a8d001084   a04  1a8b30cc       csel w12, w6, w11, lo
0x194a8d001088   a08  6b0c015f       cmp w10, w12
0x194a8d00108c   a0c  1a8c3146       csel w6, w10, w12, lo
0x194a8d001090   a10  2f00e40a       movi d10, #0x0
0x194a8d001094   a14  f94003f6       ldr x22, [sp]
0x194a8d001098   a18  d280000a       movz x10, #0x0
0x194a8d00109c   a1c  f94013ee       ldr x14, [sp, #32]
0x194a8d0010a0   a20  f9400fed       ldr x13, [sp, #24]
0x194a8d0010a4   a24  f9400bec       ldr x12, [sp, #16]
0x194a8d0010a8   a28  f94007eb       ldr x11, [sp, #8]
0x194a8d0010ac   a2c  4eaa1d4b       mov v11.16b, v10.16b
0x194a8d0010b0   a30  f852034f       ldur x15, [x26, #-224]
0x194a8d0010b4   a34  eb2f63ff       cmp sp, x15
0x194a8d0010b8   a38  54002ee9       b.ls #+0x5dc (addr 0x194a8d001694)
0x194a8d0010bc   a3c  0b0a0ecf       add w15, w22, w10, lsl #3
0x194a8d0010c0   a40  910011f3       add x19, x15, #0x4 (4)
0x194a8d0010c4   a44  b8736833       ldr w19, [x1, x19]
0x194a8d0010c8   a48  34000933       cbz w19, #+0x124 (addr 0x194a8d0011ec)
0x194a8d0010cc   a4c  b86f682f       ldr w15, [x1, x15]
0x194a8d0010d0   a50  0b1309f3       add w19, w15, w19, lsl #2
0x194a8d0010d4   a54  f8520354       ldur x20, [x26, #-224]
0x194a8d0010d8   a58  eb3463ff       cmp sp, x20
0x194a8d0010dc   a5c  54003109       b.ls #+0x620 (addr 0x194a8d0016fc)
0x194a8d0010e0   a60  110011f4       add w20, w15, #0x4 (4)
0x194a8d0010e4   a64  b86f682f       ldr w15, [x1, x15]
0x194a8d0010e8   a68  6b0f00df       cmp w6, w15
0x194a8d0010ec   a6c  54000328       b.hi #+0x64 (addr 0x194a8d001150)
0x194a8d0010f0   a70  6b13029f       cmp w20, w19
0x194a8d0010f4   a74  540007c0       b.eq #+0xf8 (addr 0x194a8d0011ec)
0x194a8d0010f8   a78  1100128f       add w15, w20, #0x4 (4)
0x194a8d0010fc   a7c  b8746834       ldr w20, [x1, x20]
0x194a8d001100   a80  6b1400df       cmp w6, w20
0x194a8d001104   a84  540002c8       b.hi #+0x58 (addr 0x194a8d00115c)
0x194a8d001108   a88  6b1301ff       cmp w15, w19
0x194a8d00110c   a8c  54000700       b.eq #+0xe0 (addr 0x194a8d0011ec)
0x194a8d001110   a90  110011f4       add w20, w15, #0x4 (4)
0x194a8d001114   a94  b86f682f       ldr w15, [x1, x15]
0x194a8d001118   a98  6b0f00df       cmp w6, w15
0x194a8d00111c   a9c  540001a8       b.hi #+0x34 (addr 0x194a8d001150)
0x194a8d001120   aa0  6b13029f       cmp w20, w19
0x194a8d001124   aa4  54000640       b.eq #+0xc8 (addr 0x194a8d0011ec)
0x194a8d001128   aa8  f852034f       ldur x15, [x26, #-224]
0x194a8d00112c   aac  eb2f63ff       cmp sp, x15
0x194a8d001130   ab0  54003229       b.ls #+0x644 (addr 0x194a8d001774)
0x194a8d001134   ab4  1100128f       add w15, w20, #0x4 (4)
0x194a8d001138   ab8  b8746834       ldr w20, [x1, x20]
0x194a8d00113c   abc  6b1400df       cmp w6, w20
0x194a8d001140   ac0  540000e8       b.hi #+0x1c (addr 0x194a8d00115c)
0x194a8d001144   ac4  6b1301ff       cmp w15, w19
0x194a8d001148   ac8  54000520       b.eq #+0xa4 (addr 0x194a8d0011ec)
0x194a8d00114c   acc  17ffffe5       b #-0x6c (addr 0x194a8d0010e0)
0x194a8d001150   ad0  aa1403f0       mov x16, x20
0x194a8d001154   ad4  aa0f03f4       mov x20, x15
0x194a8d001158   ad8  aa1003ef       mov x15, x16
0x194a8d00115c   adc  531e7694       lsl w20, w20, #2
0x194a8d001160   ae0  0b140175       add w21, w11, w20
0x194a8d001164   ae4  0b140197       add w23, w12, w20
0x194a8d001168   ae8  0b1401b8       add w24, w13, w20
0x194a8d00116c   aec  bc78682c       ldr s12, [x1, x24]
0x194a8d001170   af0  0b1401d4       add w20, w14, w20
0x194a8d001174   af4  bc74682d       ldr s13, [x1, x20]
0x194a8d001178   af8  1e2d38cd       fsub s13, s6, s13
0x194a8d00117c   afc  1e2d2080       fcmp s4, s13
0x194a8d001180   b00  540000a3       b.lo #+0x14 (addr 0x194a8d001194)
0x194a8d001184   b04  1e2321a0       fcmp s13, s3
0x194a8d001188   b08  54000082       b.hs #+0x10 (addr 0x194a8d001198)
0x194a8d00118c   b0c  1e2d284d       fadd s13, s2, s13
0x194a8d001190   b10  14000002       b #+0x8 (addr 0x194a8d001198)
0x194a8d001194   b14  1e2239ad       fsub s13, s13, s2
0x194a8d001198   b18  bc75682e       ldr s14, [x1, x21]
0x194a8d00119c   b1c  bc776830       ldr s16, [x1, x23]
0x194a8d0011a0   b20  1e2c392c       fsub s12, s9, s12
0x194a8d0011a4   b24  1e2c2080       fcmp s4, s12
0x194a8d0011a8   b28  540000a3       b.lo #+0x14 (addr 0x194a8d0011bc)
0x194a8d0011ac   b2c  1e232180       fcmp s12, s3
0x194a8d0011b0   b30  54000082       b.hs #+0x10 (addr 0x194a8d0011c0)
0x194a8d0011b4   b34  1e2c284c       fadd s12, s2, s12
0x194a8d0011b8   b38  14000002       b #+0x8 (addr 0x194a8d0011c0)
0x194a8d0011bc   b3c  1e22398c       fsub s12, s12, s2
0x194a8d0011c0   b40  1e302970       fadd s16, s11, s16
0x194a8d0011c4   b44  1e2d09ad       fmul s13, s13, s13
0x194a8d0011c8   b48  1e2c098c       fmul s12, s12, s12
0x194a8d0011cc   b4c  1e2c29ac       fadd s12, s13, s12
0x194a8d0011d0   b50  1e212180       fcmp s12, s1
0x194a8d0011d4   b54  1e2b3e0b       fcsel s11, s16, s11, lo
0x194a8d0011d8   b58  1e2e294d       fadd s13, s10, s14
0x194a8d0011dc   b5c  1e212180       fcmp s12, s1
0x194a8d0011e0   b60  1e2a3daa       fcsel s10, s13, s10, lo
0x194a8d0011e4   b64  6b1301ff       cmp w15, w19
0x194a8d0011e8   b68  54fff761       b.ne #-0x114 (addr 0x194a8d0010d4)
0x194a8d0011ec   b6c  1100054a       add w10, w10, #0x1 (1)
0x194a8d0011f0   b70  7100255f       cmp w10, #0x9 (9)
0x194a8d0011f4   b74  54fff5e1       b.ne #-0x144 (addr 0x194a8d0010b0)
0x194a8d0011f8   b78  f94027eb       ldr x11, [sp, #72]
0x194a8d0011fc   b7c  f94033ec       ldr x12, [sp, #96]
0x194a8d001200   b80  f94077ed       ldr x13, [sp, #232]
0x194a8d001204   b84  f94063e2       ldr x2, [sp, #192]
0x194a8d001208   b88  1e2b096c       fmul s12, s11, s11
0x194a8d00120c   b8c  1e2a094d       fmul s13, s10, s10
0x194a8d001210   b90  1e2d298c       fadd s12, s12, s13
0x194a8d001214   b94  1e202188       fcmp s12, #0.0
0x194a8d001218   b98  5400010c       b.gt #+0x20 (addr 0x194a8d001238)
0x194a8d00121c   b9c  91028126       add x6, x9, #0xa0 (160)
0x194a8d001220   ba0  f866682a       ldr x10, [x1, x6]
0x194a8d001224   ba4  9100054a       add x10, x10, #0x1 (1)
0x194a8d001228   ba8  f826682a       str x10, [x1, x6]
0x194a8d00122c   bac  4ea81d0b       mov v11.16b, v8.16b
0x194a8d001230   bb0  4ea71cea       mov v10.16b, v7.16b
0x194a8d001234   bb4  14000004       b #+0x10 (addr 0x194a8d001244)
0x194a8d001238   bb8  1e21c18c       fsqrt s12, s12
0x194a8d00123c   bbc  1e2c194a       fdiv s10, s10, s12
0x194a8d001240   bc0  1e2c196b       fdiv s11, s11, s12
0x194a8d001244   bc4  91024126       add x6, x9, #0x90 (144)
0x194a8d001248   bc8  f866682a       ldr x10, [x1, x6]
0x194a8d00124c   bcc  d28f82ae       movz x14, #0x7c15
0x194a8d001250   bd0  f2afe94e       movk x14, #0x7f4a, lsl #16
0x194a8d001254   bd4  f2cf372e       movk x14, #0x79b9, lsl #32
0x194a8d001258   bd8  f2f3c6ee       movk x14, #0x9e37, lsl #48
0x194a8d00125c   bdc  8b0e014a       add x10, x10, x14
0x194a8d001260   be0  f826682a       str x10, [x1, x6]
0x194a8d001264   be4  ca4a7946       eor x6, x10, x10, lsr #30
0x194a8d001268   be8  d29cb72a       movz x10, #0xe5b9
0x194a8d00126c   bec  f2a39c8a       movk x10, #0x1ce4, lsl #16
0x194a8d001270   bf0  f2c8edaa       movk x10, #0x476d, lsl #32
0x194a8d001274   bf4  f2f7eb0a       movk x10, #0xbf58, lsl #48
0x194a8d001278   bf8  9b0a7cc6       mul x6, x6, x10
0x194a8d00127c   bfc  ca466cc6       eor x6, x6, x6, lsr #27
0x194a8d001280   c00  d2823d6a       movz x10, #0x11eb
0x194a8d001284   c04  f2a2662a       movk x10, #0x1331, lsl #16
0x194a8d001288   c08  f2c9376a       movk x10, #0x49bb, lsl #32
0x194a8d00128c   c0c  f2f29a0a       movk x10, #0x94d0, lsl #48
0x194a8d001290   c10  9b0a7cc6       mul x6, x6, x10
0x194a8d001294   c14  d36bfcca       lsr x10, x6, #43
0x194a8d001298   c18  ca463146       eor x6, x10, x6, lsr #12
0x194a8d00129c   c1c  b24c24c6       orr x6, x6, #0x3ff0000000000000
0x194a8d0012a0   c20  9e6700cc       fmov d12, x6
0x194a8d0012a4   c24  1e7e100d       fmov d13, #0xf0 (-1.0000)
0x194a8d0012a8   c28  1e6d298c       fadd d12, d12, d13
0x194a8d0012ac   c2c  1e7c100d       fmov d13, #0xe0 (-0.5000)
0x194a8d0012b0   c30  1e6d298c       fadd d12, d12, d13
0x194a8d0012b4   c34  9102d126       add x6, x9, #0xb4 (180)
0x194a8d0012b8   c38  bc66682d       ldr s13, [x1, x6]
0x194a8d0012bc   c3c  1e22c1ad       fcvt d13, s13
0x194a8d0012c0   c40  1e6d098c       fmul d12, d12, d13
0x194a8d0012c4   c44  1e624180       fcvt s0, d12
0x194a8d0012c8   c48  fd006fea       str d10, [sp, #216]
0x194a8d0012cc   c4c  fd006beb       str d11, [sp, #208]
0x194a8d0012d0   c50  fd003be0       str d0, [sp, #112]
0x194a8d0012d4   c54  f9408be7       ldr x7, [sp, #272]
0x194a8d0012d8   c58  97fabf09       bl #-0x1503dc (addr 0x194a8ceb0efc)
0x194a8d0012dc   c5c  fd0037e0       str d0, [sp, #104]
0x194a8d0012e0   c60  fd403be0       ldr d0, [sp, #112]
0x194a8d0012e4   c64  f9408be7       ldr x7, [sp, #272]
0x194a8d0012e8   c68  97fabf06       bl #-0x1503e8 (addr 0x194a8ceb0f00)
0x194a8d0012ec   c6c  f9407be1       ldr x1, [sp, #240]
0x194a8d0012f0   c70  9102c026       add x6, x1, #0xb0 (176)
0x194a8d0012f4   c74  f9407fe8       ldr x8, [sp, #248]
0x194a8d0012f8   c78  bc666901       ldr s1, [x8, x6]
0x194a8d0012fc   c7c  fd403fe2       ldr d2, [sp, #120]
0x194a8d001300   c80  1e210842       fmul s2, s2, s1
0x194a8d001304   c84  fd4043e3       ldr d3, [sp, #128]
0x194a8d001308   c88  1e222862       fadd s2, s3, s2
0x194a8d00130c   c8c  f94047e6       ldr x6, [sp, #136]
0x194a8d001310   c90  bc666903       ldr s3, [x8, x6]
0x194a8d001314   c94  1e222060       fcmp s3, s2
0x194a8d001318   c98  540000a9       b.ls #+0x14 (addr 0x194a8d00132c)
0x194a8d00131c   c9c  1e202048       fcmp s2, #0.0
0x194a8d001320   ca0  54000082       b.hs #+0x10 (addr 0x194a8d001330)
0x194a8d001324   ca4  1e222862       fadd s2, s3, s2
0x194a8d001328   ca8  14000002       b #+0x8 (addr 0x194a8d001330)
0x194a8d00132c   cac  1e233842       fsub s2, s2, s3
0x194a8d001330   cb0  fd404be4       ldr d4, [sp, #144]
0x194a8d001334   cb4  1e210881       fmul s1, s4, s1
0x194a8d001338   cb8  fd404fe4       ldr d4, [sp, #152]
0x194a8d00133c   cbc  1e212881       fadd s1, s4, s1
0x194a8d001340   cc0  1e212060       fcmp s3, s1
0x194a8d001344   cc4  540000a9       b.ls #+0x14 (addr 0x194a8d001358)
0x194a8d001348   cc8  1e202028       fcmp s1, #0.0
0x194a8d00134c   ccc  54000082       b.hs #+0x10 (addr 0x194a8d00135c)
0x194a8d001350   cd0  1e212861       fadd s1, s3, s1
0x194a8d001354   cd4  14000002       b #+0x8 (addr 0x194a8d00135c)
0x194a8d001358   cd8  1e233821       fsub s1, s1, s3
0x194a8d00135c   cdc  f94073ea       ldr x10, [sp, #224]
0x194a8d001360   ce0  f94053e9       ldr x9, [sp, #160]
0x194a8d001364   ce4  6b0a013f       cmp w9, w10
0x194a8d001368   ce8  540004c9       b.ls #+0x98 (addr 0x194a8d001400)
0x194a8d00136c   cec  f94063eb       ldr x11, [sp, #192]
0x194a8d001370   cf0  f94057ec       ldr x12, [sp, #168]
0x194a8d001374   cf4  0b0b018d       add w13, w12, w11
0x194a8d001378   cf8  1e222060       fcmp s3, s2
0x194a8d00137c   cfc  1e229de2       fcsel s2, s15, s2, ls
0x194a8d001380   d00  bc2d6902       str s2, [x8, x13]
0x194a8d001384   d04  f9405bed       ldr x13, [sp, #176]
0x194a8d001388   d08  0b0b01ae       add w14, w13, w11
0x194a8d00138c   d0c  1e212060       fcmp s3, s1
0x194a8d001390   d10  1e219de1       fcsel s1, s15, s1, ls
0x194a8d001394   d14  bc2e6901       str s1, [x8, x14]
0x194a8d001398   d18  f9405fee       ldr x14, [sp, #184]
0x194a8d00139c   d1c  0b0b01cf       add w15, w14, w11
0x194a8d0013a0   d20  fd406beb       ldr d11, [sp, #208]
0x194a8d0013a4   d24  1e200961       fmul s1, s11, s0
0x194a8d0013a8   d28  fd406fea       ldr d10, [sp, #216]
0x194a8d0013ac   d2c  fd4037e2       ldr d2, [sp, #104]
0x194a8d0013b0   d30  1e220943       fmul s3, s10, s2
0x194a8d0013b4   d34  1e233821       fsub s1, s1, s3
0x194a8d0013b8   d38  bc2f6901       str s1, [x8, x15]
0x194a8d0013bc   d3c  f94067ef       ldr x15, [sp, #200]
0x194a8d0013c0   d40  0b0b01eb       add w11, w15, w11
0x194a8d0013c4   d44  1e220961       fmul s1, s11, s2
0x194a8d0013c8   d48  1e200942       fmul s2, s10, s0
0x194a8d0013cc   d4c  1e222821       fadd s1, s1, s2
0x194a8d0013d0   d50  bc2b6901       str s1, [x8, x11]
0x194a8d0013d4   d54  aa0103e9       mov x9, x1
0x194a8d0013d8   d58  aa0803e1       mov x1, x8
0x194a8d0013dc   d5c  f94083e8       ldr x8, [sp, #256]
0x194a8d0013e0   d60  f94077ed       ldr x13, [sp, #232]
0x194a8d0013e4   d64  fd4023e1       ldr d1, [sp, #64]
0x194a8d0013e8   d68  fd401fe2       ldr d2, [sp, #56]
0x194a8d0013ec   d6c  fd401be3       ldr d3, [sp, #48]
0x194a8d0013f0   d70  fd4017e4       ldr d4, [sp, #40]
0x194a8d0013f4   d74  f94033ec       ldr x12, [sp, #96]
0x194a8d0013f8   d78  f94027eb       ldr x11, [sp, #72]
0x194a8d0013fc   d7c  1400000b       b #+0x2c (addr 0x194a8d001428)
0x194a8d001400   d80  aa0103e9       mov x9, x1
0x194a8d001404   d84  aa0803e1       mov x1, x8
0x194a8d001408   d88  f94083e8       ldr x8, [sp, #256]
0x194a8d00140c   d8c  f94077ed       ldr x13, [sp, #232]
0x194a8d001410   d90  fd4023e1       ldr d1, [sp, #64]
0x194a8d001414   d94  fd401fe2       ldr d2, [sp, #56]
0x194a8d001418   d98  fd401be3       ldr d3, [sp, #48]
0x194a8d00141c   d9c  fd4017e4       ldr d4, [sp, #40]
0x194a8d001420   da0  f94033ec       ldr x12, [sp, #96]
0x194a8d001424   da4  f94027eb       ldr x11, [sp, #72]
0x194a8d001428   da8  1100054a       add w10, w10, #0x1 (1)
0x194a8d00142c   dac  aa0d03e6       mov x6, x13
0x194a8d001430   db0  6b06015f       cmp w10, w6
0x194a8d001434   db4  54ffa261       b.ne #-0xbb4 (addr 0x194a8d000880)
0x194a8d001438   db8  14000011       b #+0x44 (addr 0x194a8d00147c)
0x194a8d00143c   dbc  d286bf00       movz x0, #0x35f8
0x194a8d001440   dc0  f2a002c0       movk x0, #0x16, lsl #16
0x194a8d001444   dc4  f9408be7       ldr x7, [sp, #272]
0x194a8d001448   dc8  97fabbbe       bl #-0x151108 (addr 0x194a8ceb0340)
0x194a8d00144c   dcc  d2800001       movz x1, #0x0
0x194a8d001450   dd0  6a01003f       tst w1, w1
0x194a8d001454   dd4  54001ce0       b.eq #+0x39c (addr 0x194a8d0017f0)
0x194a8d001458   dd8  d4200000       brk #0x0
0x194a8d00145c   ddc  d286bf00       movz x0, #0x35f8
0x194a8d001460   de0  f2a002c0       movk x0, #0x16, lsl #16
0x194a8d001464   de4  f9408be7       ldr x7, [sp, #272]
0x194a8d001468   de8  97fabbb6       bl #-0x151128 (addr 0x194a8ceb0340)
0x194a8d00146c   dec  d2800001       movz x1, #0x0
0x194a8d001470   df0  6a01003f       tst w1, w1
0x194a8d001474   df4  54001bc0       b.eq #+0x378 (addr 0x194a8d0017ec)
0x194a8d001478   df8  d4200000       brk #0x0
0x194a8d00147c   dfc  f94087e6       ldr x6, [sp, #264]
0x194a8d001480   e00  9100c12a       add x10, x9, #0x30 (48)
0x194a8d001484   e04  3cea6821       ldr q1, [x1, x10]
0x194a8d001488   e08  3ce96822       ldr q2, [x1, x9]
0x194a8d00148c   e0c  3caa6822       str q2, [x1, x10]
0x194a8d001490   e10  3ca96821       str q1, [x1, x9]
0x194a8d001494   e14  9101012a       add x10, x9, #0x40 (64)
0x194a8d001498   e18  3cea6821       ldr q1, [x1, x10]
0x194a8d00149c   e1c  9100412b       add x11, x9, #0x10 (16)
0x194a8d0014a0   e20  3ceb6822       ldr q2, [x1, x11]
0x194a8d0014a4   e24  3caa6822       str q2, [x1, x10]
0x194a8d0014a8   e28  3cab6821       str q1, [x1, x11]
0x194a8d0014ac   e2c  9101412a       add x10, x9, #0x50 (80)
0x194a8d0014b0   e30  3cea6821       ldr q1, [x1, x10]
0x194a8d0014b4   e34  9100812b       add x11, x9, #0x20 (32)
0x194a8d0014b8   e38  3ceb6822       ldr q2, [x1, x11]
0x194a8d0014bc   e3c  3caa6822       str q2, [x1, x10]
0x194a8d0014c0   e40  3cab6821       str q1, [x1, x11]
0x194a8d0014c4   e44  91026129       add x9, x9, #0x98 (152)
0x194a8d0014c8   e48  f869682a       ldr x10, [x1, x9]
0x194a8d0014cc   e4c  9100054a       add x10, x10, #0x1 (1)
0x194a8d0014d0   e50  f829682a       str x10, [x1, x9]
0x194a8d0014d4   e54  aa0803e1       mov x1, x8
0x194a8d0014d8   e58  11014021       add w1, w1, #0x50 (80)
0x194a8d0014dc   e5c  b90000c1       str w1, [x6]
0x194a8d0014e0   e60  910003bf       mov sp, fp
0x194a8d0014e4   e64  a8c17bfd       ldp fp, lr, [sp], #16
0x194a8d0014e8   e68  d65f03c0       ret
0x194a8d0014ec   e6c  f9006be0       str x0, [sp, #208]
0x194a8d0014f0   e70  97fac1b8       bl #-0x14f920 (addr 0x194a8ceb1bd0)
0x194a8d0014f4   e74  f9407fe1       ldr x1, [sp, #248]
0x194a8d0014f8   e78  f9408be7       ldr x7, [sp, #272]
0x194a8d0014fc   e7c  f9406be0       ldr x0, [sp, #208]
0x194a8d001500   e80  17fffc6a       b #-0xe58 (addr 0x194a8d0006a8)
0x194a8d001504   e84  1e642080       fcmp d4, d4
0x194a8d001508   e88  54000060       b.eq #+0xc (addr 0x194a8d001514)
0x194a8d00150c   e8c  d280000c       movz x12, #0x0
0x194a8d001510   e90  17fffc92       b #-0xdb8 (addr 0x194a8d000758)
0x194a8d001514   e94  1e202068       fcmp s3, #0.0
0x194a8d001518   e98  54ffffa3       b.lo #-0xc (addr 0x194a8d00150c)
0x194a8d00151c   e9c  9280000c       movn x12, #0x0
0x194a8d001520   ea0  17fffc8e       b #-0xdc8 (addr 0x194a8d000758)
0x194a8d001524   ea4  f90073ea       str x10, [sp, #224]
0x194a8d001528   ea8  97fac1aa       bl #-0x14f958 (addr 0x194a8ceb1bd0)
0x194a8d00152c   eac  f94083e8       ldr x8, [sp, #256]
0x194a8d001530   eb0  f9407fe1       ldr x1, [sp, #248]
0x194a8d001534   eb4  f9407be9       ldr x9, [sp, #240]
0x194a8d001538   eb8  f94077ed       ldr x13, [sp, #232]
0x194a8d00153c   ebc  f94073ea       ldr x10, [sp, #224]
0x194a8d001540   ec0  fd4023e1       ldr d1, [sp, #64]
0x194a8d001544   ec4  fd401fe2       ldr d2, [sp, #56]
0x194a8d001548   ec8  fd401be3       ldr d3, [sp, #48]
0x194a8d00154c   ecc  fd4017e4       ldr d4, [sp, #40]
0x194a8d001550   ed0  f94033ec       ldr x12, [sp, #96]
0x194a8d001554   ed4  f94027eb       ldr x11, [sp, #72]
0x194a8d001558   ed8  17fffcce       b #-0xcc8 (addr 0x194a8d000890)
0x194a8d00155c   edc  fd006fea       str d10, [sp, #216]
0x194a8d001560   ee0  fd006beb       str d11, [sp, #208]
0x194a8d001564   ee4  f9002be6       str x6, [sp, #80]
0x194a8d001568   ee8  f9003bf9       str x25, [sp, #112]
0x194a8d00156c   eec  97fac199       bl #-0x14f99c (addr 0x194a8ceb1bd0)
0x194a8d001570   ef0  f94083e8       ldr x8, [sp, #256]
0x194a8d001574   ef4  f9407fe1       ldr x1, [sp, #248]
0x194a8d001578   ef8  f9407be9       ldr x9, [sp, #240]
0x194a8d00157c   efc  f94077ed       ldr x13, [sp, #232]
0x194a8d001580   f00  f94063e2       ldr x2, [sp, #192]
0x194a8d001584   f04  fd404fe9       ldr d9, [sp, #152]
0x194a8d001588   f08  fd404be7       ldr d7, [sp, #144]
0x194a8d00158c   f0c  fd4043e6       ldr d6, [sp, #128]
0x194a8d001590   f10  fd403fe8       ldr d8, [sp, #120]
0x194a8d001594   f14  fd406fea       ldr d10, [sp, #216]
0x194a8d001598   f18  fd406beb       ldr d11, [sp, #208]
0x194a8d00159c   f1c  fd4023e1       ldr d1, [sp, #64]
0x194a8d0015a0   f20  fd401fe2       ldr d2, [sp, #56]
0x194a8d0015a4   f24  fd401be3       ldr d3, [sp, #48]
0x194a8d0015a8   f28  fd4017e4       ldr d4, [sp, #40]
0x194a8d0015ac   f2c  f94013e0       ldr x0, [sp, #32]
0x194a8d0015b0   f30  f9400fe5       ldr x5, [sp, #24]
0x194a8d0015b4   f34  f9400be4       ldr x4, [sp, #16]
0x194a8d0015b8   f38  f94007e3       ldr x3, [sp, #8]
0x194a8d0015bc   f3c  f9402be6       ldr x6, [sp, #80]
0x194a8d0015c0   f40  f9403bf9       ldr x25, [sp, #112]
0x194a8d0015c4   f44  f94033ec       ldr x12, [sp, #96]
0x194a8d0015c8   f48  f94027eb       ldr x11, [sp, #72]
0x194a8d0015cc   f4c  17fffced       b #-0xc4c (addr 0x194a8d000980)
0x194a8d0015d0   f50  fd006fea       str d10, [sp, #216]
0x194a8d0015d4   f54  fd006beb       str d11, [sp, #208]
0x194a8d0015d8   f58  f9002be6       str x6, [sp, #80]
0x194a8d0015dc   f5c  f90037fb       str cp, [sp, #104]
0x194a8d0015e0   f60  f9002ff8       str x24, [sp, #88]
0x194a8d0015e4   f64  f9003bf9       str x25, [sp, #112]
0x194a8d0015e8   f68  97fac17a       bl #-0x14fa18 (addr 0x194a8ceb1bd0)
0x194a8d0015ec   f6c  f94083e8       ldr x8, [sp, #256]
0x194a8d0015f0   f70  f9407fe1       ldr x1, [sp, #248]
0x194a8d0015f4   f74  f9407be9       ldr x9, [sp, #240]
0x194a8d0015f8   f78  f94077ed       ldr x13, [sp, #232]
0x194a8d0015fc   f7c  f94063e2       ldr x2, [sp, #192]
0x194a8d001600   f80  fd404fe9       ldr d9, [sp, #152]
0x194a8d001604   f84  fd404be7       ldr d7, [sp, #144]
0x194a8d001608   f88  fd4043e6       ldr d6, [sp, #128]
0x194a8d00160c   f8c  fd403fe8       ldr d8, [sp, #120]
0x194a8d001610   f90  fd406fea       ldr d10, [sp, #216]
0x194a8d001614   f94  fd406beb       ldr d11, [sp, #208]
0x194a8d001618   f98  fd4023e1       ldr d1, [sp, #64]
0x194a8d00161c   f9c  fd401fe2       ldr d2, [sp, #56]
0x194a8d001620   fa0  fd401be3       ldr d3, [sp, #48]
0x194a8d001624   fa4  fd4017e4       ldr d4, [sp, #40]
0x194a8d001628   fa8  f94013e0       ldr x0, [sp, #32]
0x194a8d00162c   fac  f9400fe5       ldr x5, [sp, #24]
0x194a8d001630   fb0  f9400be4       ldr x4, [sp, #16]
0x194a8d001634   fb4  f94007e3       ldr x3, [sp, #8]
0x194a8d001638   fb8  f9402be6       ldr x6, [sp, #80]
0x194a8d00163c   fbc  f94037fb       ldr cp, [sp, #104]
0x194a8d001640   fc0  f9402ff8       ldr x24, [sp, #88]
0x194a8d001644   fc4  f9403bf9       ldr x25, [sp, #112]
0x194a8d001648   fc8  f94033ec       ldr x12, [sp, #96]
0x194a8d00164c   fcc  f94027eb       ldr x11, [sp, #72]
0x194a8d001650   fd0  17fffcdc       b #-0xc90 (addr 0x194a8d0009c0)
0x194a8d001654   fd4  1e6c2180       fcmp d12, d12
0x194a8d001658   fd8  54000060       b.eq #+0xc (addr 0x194a8d001664)
0x194a8d00165c   fdc  d280000e       movz x14, #0x0
0x194a8d001660   fe0  17fffd1e       b #-0xb88 (addr 0x194a8d000ad8)
0x194a8d001664   fe4  1e202168       fcmp s11, #0.0
0x194a8d001668   fe8  54ffffa3       b.lo #-0xc (addr 0x194a8d00165c)
0x194a8d00166c   fec  9280000e       movn x14, #0x0
0x194a8d001670   ff0  17fffd1a       b #-0xb98 (addr 0x194a8d000ad8)
0x194a8d001674   ff4  1e6b2160       fcmp d11, d11
0x194a8d001678   ff8  54000060       b.eq #+0xc (addr 0x194a8d001684)
0x194a8d00167c   ffc  d280000f       movz x15, #0x0
0x194a8d001680  1000  17fffd30       b #-0xb40 (addr 0x194a8d000b40)
0x194a8d001684  1004  1e202148       fcmp s10, #0.0
0x194a8d001688  1008  54ffffa3       b.lo #-0xc (addr 0x194a8d00167c)
0x194a8d00168c  100c  9280000f       movn x15, #0x0
0x194a8d001690  1010  17fffd2c       b #-0xb50 (addr 0x194a8d000b40)
0x194a8d001694  1014  f9003bea       str x10, [sp, #112]
0x194a8d001698  1018  fd006fea       str d10, [sp, #216]
0x194a8d00169c  101c  fd006beb       str d11, [sp, #208]
0x194a8d0016a0  1020  f9002be6       str x6, [sp, #80]
0x194a8d0016a4  1024  97fac14b       bl #-0x14fad4 (addr 0x194a8ceb1bd0)
0x194a8d0016a8  1028  f94083e8       ldr x8, [sp, #256]
0x194a8d0016ac  102c  f9407fe1       ldr x1, [sp, #248]
0x194a8d0016b0  1030  f9407be9       ldr x9, [sp, #240]
0x194a8d0016b4  1034  fd404fe9       ldr d9, [sp, #152]
0x194a8d0016b8  1038  fd404be7       ldr d7, [sp, #144]
0x194a8d0016bc  103c  fd4043e6       ldr d6, [sp, #128]
0x194a8d0016c0  1040  fd403fe8       ldr d8, [sp, #120]
0x194a8d0016c4  1044  f9403bea       ldr x10, [sp, #112]
0x194a8d0016c8  1048  fd406fea       ldr d10, [sp, #216]
0x194a8d0016cc  104c  fd406beb       ldr d11, [sp, #208]
0x194a8d0016d0  1050  fd4023e1       ldr d1, [sp, #64]
0x194a8d0016d4  1054  fd401fe2       ldr d2, [sp, #56]
0x194a8d0016d8  1058  fd401be3       ldr d3, [sp, #48]
0x194a8d0016dc  105c  fd4017e4       ldr d4, [sp, #40]
0x194a8d0016e0  1060  f94013ee       ldr x14, [sp, #32]
0x194a8d0016e4  1064  f9400fed       ldr x13, [sp, #24]
0x194a8d0016e8  1068  f9400bec       ldr x12, [sp, #16]
0x194a8d0016ec  106c  f94007eb       ldr x11, [sp, #8]
0x194a8d0016f0  1070  f9402be6       ldr x6, [sp, #80]
0x194a8d0016f4  1074  f94003f6       ldr x22, [sp]
0x194a8d0016f8  1078  17fffe71       b #-0x63c (addr 0x194a8d0010bc)
0x194a8d0016fc  107c  f9003bea       str x10, [sp, #112]
0x194a8d001700  1080  fd006fea       str d10, [sp, #216]
0x194a8d001704  1084  fd006beb       str d11, [sp, #208]
0x194a8d001708  1088  f90037f3       str x19, [sp, #104]
0x194a8d00170c  108c  f9002be6       str x6, [sp, #80]
0x194a8d001710  1090  f9002fef       str x15, [sp, #88]
0x194a8d001714  1094  97fac12f       bl #-0x14fb44 (addr 0x194a8ceb1bd0)
0x194a8d001718  1098  f94083e8       ldr x8, [sp, #256]
0x194a8d00171c  109c  f9407fe1       ldr x1, [sp, #248]
0x194a8d001720  10a0  f9407be9       ldr x9, [sp, #240]
0x194a8d001724  10a4  fd404fe9       ldr d9, [sp, #152]
0x194a8d001728  10a8  fd404be7       ldr d7, [sp, #144]
0x194a8d00172c  10ac  fd4043e6       ldr d6, [sp, #128]
0x194a8d001730  10b0  fd403fe8       ldr d8, [sp, #120]
0x194a8d001734  10b4  f9403bea       ldr x10, [sp, #112]
0x194a8d001738  10b8  fd406fea       ldr d10, [sp, #216]
0x194a8d00173c  10bc  fd406beb       ldr d11, [sp, #208]
0x194a8d001740  10c0  f94037f3       ldr x19, [sp, #104]
0x194a8d001744  10c4  fd4023e1       ldr d1, [sp, #64]
0x194a8d001748  10c8  fd401fe2       ldr d2, [sp, #56]
0x194a8d00174c  10cc  fd401be3       ldr d3, [sp, #48]
0x194a8d001750  10d0  fd4017e4       ldr d4, [sp, #40]
0x194a8d001754  10d4  f94013ee       ldr x14, [sp, #32]
0x194a8d001758  10d8  f9400fed       ldr x13, [sp, #24]
0x194a8d00175c  10dc  f9400bec       ldr x12, [sp, #16]
0x194a8d001760  10e0  f94007eb       ldr x11, [sp, #8]
0x194a8d001764  10e4  f9402be6       ldr x6, [sp, #80]
0x194a8d001768  10e8  f9402fef       ldr x15, [sp, #88]
0x194a8d00176c  10ec  f94003f6       ldr x22, [sp]
0x194a8d001770  10f0  17fffe5c       b #-0x690 (addr 0x194a8d0010e0)
0x194a8d001774  10f4  f9003bea       str x10, [sp, #112]
0x194a8d001778  10f8  fd006fea       str d10, [sp, #216]
0x194a8d00177c  10fc  fd006beb       str d11, [sp, #208]
0x194a8d001780  1100  f90037f3       str x19, [sp, #104]
0x194a8d001784  1104  f9002ff4       str x20, [sp, #88]
0x194a8d001788  1108  f9002be6       str x6, [sp, #80]
0x194a8d00178c  110c  97fac111       bl #-0x14fbbc (addr 0x194a8ceb1bd0)
0x194a8d001790  1110  f94083e8       ldr x8, [sp, #256]
0x194a8d001794  1114  f9407fe1       ldr x1, [sp, #248]
0x194a8d001798  1118  f9407be9       ldr x9, [sp, #240]
0x194a8d00179c  111c  fd404fe9       ldr d9, [sp, #152]
0x194a8d0017a0  1120  fd404be7       ldr d7, [sp, #144]
0x194a8d0017a4  1124  fd4043e6       ldr d6, [sp, #128]
0x194a8d0017a8  1128  fd403fe8       ldr d8, [sp, #120]
0x194a8d0017ac  112c  f9403bea       ldr x10, [sp, #112]
0x194a8d0017b0  1130  fd406fea       ldr d10, [sp, #216]
0x194a8d0017b4  1134  fd406beb       ldr d11, [sp, #208]
0x194a8d0017b8  1138  f94037f3       ldr x19, [sp, #104]
0x194a8d0017bc  113c  fd4023e1       ldr d1, [sp, #64]
0x194a8d0017c0  1140  fd401fe2       ldr d2, [sp, #56]
0x194a8d0017c4  1144  fd401be3       ldr d3, [sp, #48]
0x194a8d0017c8  1148  fd4017e4       ldr d4, [sp, #40]
0x194a8d0017cc  114c  f94013ee       ldr x14, [sp, #32]
0x194a8d0017d0  1150  f9400fed       ldr x13, [sp, #24]
0x194a8d0017d4  1154  f9400bec       ldr x12, [sp, #16]
0x194a8d0017d8  1158  f94007eb       ldr x11, [sp, #8]
0x194a8d0017dc  115c  f9402ff4       ldr x20, [sp, #88]
0x194a8d0017e0  1160  f9402be6       ldr x6, [sp, #80]
0x194a8d0017e4  1164  f94003f6       ldr x22, [sp]
0x194a8d0017e8  1168  17fffe53       b #-0x6b4 (addr 0x194a8d001134)
0x194a8d0017ec  116c  97fac045       bl #-0x14feec (addr 0x194a8ceb1900)
0x194a8d0017f0  1170  97fac044       bl #-0x14fef0 (addr 0x194a8ceb1900)
0x194a8d0017f4  1174  d503201f       nop

Protected instructions:
 pc offset
        40         
        48         
        50         
        58         
        e4         
        ec         
        f4         
       108         
       110         
       120         
       168         
       170         
       178         
       180         
       1b0         
       1b8         
       1c0         
       1c8         
       210         
       224         
       234         
       248         
       25c         
       268         
       270         
       278         
       280         
       288         
       290         
       298         
       360         
       368         
       38c         
       390         
       3e8         
       3fc         
       410         
       424         
       4e8         
       510         
       518         
       528         
       554         
       58c         
       594         
       5a4         
       5dc         
       61c         
       624         
       634         
       66c         
       6a8         
       6b0         
       6c0         
       6ec         
       71c         
       724         
       734         
       760         
       79c         
       7a4         
       7b4         
       7e0         
       820         
       828         
       838         
       864         
       894         
       89c         
       8ac         
       8d8         
       908         
       910         
       920         
       94c         
       958         
       960         
       968         
       970         
       978         
       980         
       988         
       990         
       998         
       9a0         
       9a8         
       9b0         
       9b8         
       9c0         
       9c8         
       9d0         
       9d8         
       9e0         
       9e8         
       a44         
       a4c         
       a64         
       a7c         
       a94         
       ab8         
       aec         
       af4         
       b18         
       b1c         
       ba0         
       ba8         
       bc8         
       be0         
       c38         
       c78         
       c90         
       d00         
       d14         
       d38         
       d50         
       e04         
       e08         
       e0c         
       e10         
       e18         
       e20         
       e24         
       e28         
       e30         
       e38         
       e3c         
       e40         
       e48         
       e50         

Source positions:
 pc offset  position
        40        61
        48        69
        50        77
        58        90
        e4       144
        ec       151
        f4       158
       108       179
       110       187
       120       199
       128       217
       168       237
       170       244
       178       251
       180       258
       1b0       309
       1b8       316
       1c0       323
       1c8       330
       210       361
       224       373
       234       385
       248       397
       25c       407
       268       420
       270       427
       278       435
       280       442
       288       450
       290       457
       298       465
       360       582
       368       598
       38c       637
       390       644
       3e8       751
       3fc       764
       410       775
       424       809
       4e8       968
       510      1015
       518      1028
       528      1040
       554      1057
       58c      1135
       594      1148
       5a4      1160
       5dc      1177
       61c      1258
       624      1271
       634      1283
       66c      1300
       6a8      1381
       6b0      1394
       6c0      1406
       6ec      1423
       71c      1496
       724      1509
       734      1521
       760      1538
       79c      1611
       7a4      1624
       7b4      1636
       7e0      1653
       820      1737
       828      1750
       838      1762
       864      1779
       894      1852
       89c      1865
       8ac      1877
       8d8      1894
       908      1967
       910      1980
       920      1992
       94c      2009
       958      2025
       960      2032
       968      2039
       970      2046
       978      2053
       980      2060
       988      2067
       990      2074
       998      2081
       9a0      2088
       9a8      2095
       9b0      2102
       9b8      2109
       9c0      2116
       9c8      2123
       9d0      2130
       9d8      2137
       9e0      2144
       9e4      2156
       a44      2223
       a4c      2233
       a64      2269
       aec      2303
       af4      2315
       b18      2369
       b1c      2376
       ba0      2543
       ba8      2550
       bc8      2587
       be0      2605
       c38      2694
       c48      2703
       c5c      2713
       c74      2731
       c8c      2743
       d00      2854
       d14      2875
       d38      2894
       d50      2913
       dbc      2506
       ddc      2492
       e04      2933
       e08      2943
       e0c      2947
       e10      2955
       e18      2961
       e20      2971
       e24      2975
       e28      2983
       e30      2989
       e38      2999
       e3c      3003
       e40      3011
       e48      3019
       e50      3026
       e6c         0
       ea4       353
       edc       528
       f50       543
      1014      2209
      107c      2246
      10f4      2256
      116c      2498
      1170      2512

Safepoints (stack slots = 38, entries = 1, byte size = 19)
0x194a8d0007ac    12c  slots (sp->fp): 00000000000000000000000000000000000000

RelocInfo (size = 39)
0x194a8d0007a8  internal wasm call
0x194a8d0012d8  internal wasm call
0x194a8d0012e8  internal wasm call
0x194a8d001448  internal wasm call
0x194a8d001468  internal wasm call
0x194a8d0014f0  wasm stub call  (0x194a8ceb1bd0)
0x194a8d001528  wasm stub call  (0x194a8ceb1bd0)
0x194a8d00156c  wasm stub call  (0x194a8ceb1bd0)
0x194a8d0015e8  wasm stub call  (0x194a8ceb1bd0)
0x194a8d0016a4  wasm stub call  (0x194a8ceb1bd0)
0x194a8d001714  wasm stub call  (0x194a8ceb1bd0)
0x194a8d00178c  wasm stub call  (0x194a8ceb1bd0)
0x194a8d0017ec  wasm stub call  (0x194a8ceb1900)
0x194a8d0017f0  wasm stub call  (0x194a8ceb1900)
