name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 7680 = 7652 + 28 padding)
Instructions (size = 7624)
0xb9c900119c0     0  d2800110       movz x16, #0x8
0xb9c900119c4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0xb9c900119c8     8  a9017bfd       stp fp, lr, [sp, #16]
0xb9c900119cc     c  910043fd       add fp, sp, #0x10 (16)
0xb9c900119d0    10  d10a43ff       sub sp, sp, #0x290 (656)
0xb9c900119d4    14  f841f0e6       ldur x6, [x7, #31]
0xb9c900119d8    18  f8520348       ldur x8, [x26, #-224]
0xb9c900119dc    1c  f9013fe0       str x0, [sp, #632]
0xb9c900119e0    20  f90133e6       str x6, [sp, #608]
0xb9c900119e4    24  eb2863ff       cmp sp, x8
0xb9c900119e8    28  5400d5a9       b.ls #+0x1ab4 (addr 0xb9c9001349c)
0xb9c900119ec    2c  f842f0e8       ldur x8, [x7, #47]
0xb9c900119f0    30  b9400109       ldr w9, [x8]
0xb9c900119f4    34  51050124       sub w4, w9, #0x140 (320)
0xb9c900119f8    38  b9000104       str w4, [x8]
0xb9c900119fc    3c  2a0003e9       mov w9, w0
0xb9c90011a00    40  910240ca       add x10, x6, #0x90 (144)
0xb9c90011a04    44  fc696944       ldr d4, [x10, x9]
0xb9c90011a08    48  5e0c0481       mov s1, v4.s[1]
0xb9c90011a0c    4c  52a75010       movz w16, #0x3a800000
0xb9c90011a10    50  1e270205       fmov s5, w16
0xb9c90011a14    54  1e250826       fmul s6, s1, s5
0xb9c90011a18    58  5e040480       mov s0, v4.s[0]
0xb9c90011a1c    5c  1e250805       fmul s5, s0, s5
0xb9c90011a20    60  9102812a       add x10, x9, #0xa0 (160)
0xb9c90011a24    64  bc6a68c7       ldr s7, [x6, x10]
0xb9c90011a28    68  1e2720e0       fcmp s7, s7
0xb9c90011a2c    6c  1e271ca7       fcsel s7, s5, s7, ne
0xb9c90011a30    70  1e2520a0       fcmp s5, s5
0xb9c90011a34    74  1e251ce5       fcsel s5, s7, s5, ne
0xb9c90011a38    78  1e2720a0       fcmp s5, s7
0xb9c90011a3c    7c  1e253ce5       fcsel s5, s7, s5, lo
0xb9c90011a40    80  1e2520a0       fcmp s5, s5
0xb9c90011a44    84  1e251cc5       fcsel s5, s6, s5, ne
0xb9c90011a48    88  1e2620c0       fcmp s6, s6
0xb9c90011a4c    8c  1e261ca6       fcsel s6, s5, s6, ne
0xb9c90011a50    90  1e2520c0       fcmp s6, s5
0xb9c90011a54    94  1e263ca5       fcsel s5, s5, s6, lo
0xb9c90011a58    98  52840010       movz w16, #0x2000
0xb9c90011a5c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0xb9c90011a60    a0  1e270206       fmov s6, w16
0xb9c90011a64    a4  1e2608a5       fmul s5, s5, s6
0xb9c90011a68    a8  1e2e1006       fmov s6, #0x70 (1.0000)
0xb9c90011a6c    ac  1e2518c5       fdiv s5, s6, s5
0xb9c90011a70    b0  9102112b       add x11, x9, #0x84 (132)
0xb9c90011a74    b4  bc2b68c5       str s5, [x6, x11]
0xb9c90011a78    b8  4e0404a7       dup v7.4s, v5.s[0]
0xb9c90011a7c    bc  6e27dc84       fmul v4.4s, v4.4s, v7.4s
0xb9c90011a80    c0  4ea18884       frintp v4.4s, v4.4s
0xb9c90011a84    c4  5e040487       mov s7, v4.s[0]
0xb9c90011a88    c8  1e22c0e8       fcvt d8, s7
0xb9c90011a8c    cc  1e65c109       frintz d9, d8
0xb9c90011a90    d0  1e79012c       fcvtzu w12, d9
0xb9c90011a94    d4  1e63018a       ucvtf d10, w12
0xb9c90011a98    d8  f90147e8       str x8, [sp, #648]
0xb9c90011a9c    dc  f90143e4       str x4, [sp, #640]
0xb9c90011aa0    e0  f90017e9       str x9, [sp, #40]
0xb9c90011aa4    e4  fd010be1       str d1, [sp, #528]
0xb9c90011aa8    e8  fd010fe0       str d0, [sp, #536]
0xb9c90011aac    ec  f9013bea       str x10, [sp, #624]
0xb9c90011ab0    f0  fd0117e5       str d5, [sp, #552]
0xb9c90011ab4    f4  f9001beb       str x11, [sp, #48]
0xb9c90011ab8    f8  1e6a2120       fcmp d9, d10
0xb9c90011abc    fc  5400cfa1       b.ne #+0x19f4 (addr 0xb9c900134b0)
0xb9c90011ac0   100  4e040d87       dup v7.4s, w12
0xb9c90011ac4   104  5e0c0488       mov s8, v4.s[1]
0xb9c90011ac8   108  1e22c109       fcvt d9, s8
0xb9c90011acc   10c  1e65c12a       frintz d10, d9
0xb9c90011ad0   110  1e79014c       fcvtzu w12, d10
0xb9c90011ad4   114  1e63018b       ucvtf d11, w12
0xb9c90011ad8   118  1e6b2140       fcmp d10, d11
0xb9c90011adc   11c  5400d001       b.ne #+0x1a00 (addr 0xb9c900134dc)
0xb9c90011ae0   120  4e0c1d87       mov v7.s[1], w12
0xb9c90011ae4   124  4f000428       movi v8.4s, #0x1, lsl #0
0xb9c90011ae8   128  6ea864e7       umax v7.4s, v7.4s, v8.4s
0xb9c90011aec   12c  6f00e409       movi v9.2d, #0x0
0xb9c90011af0   130  6ea0c88a       fcmge v10.4s, v4.4s, #0.0
0xb9c90011af4   134  52a9f010       movz w16, #0x4f800000
0xb9c90011af8   138  4e040e0b       dup v11.4s, w16
0xb9c90011afc   13c  6ea4e564       fcmgt v4.4s, v11.4s, v4.4s
0xb9c90011b00   140  4e241d44       and v4.16b, v10.16b, v4.16b
0xb9c90011b04   144  6e681ce4       bsl v4.16b, v7.16b, v8.16b
0xb9c90011b08   148  910220cc       add x12, x6, #0x88 (136)
0xb9c90011b0c   14c  8b09018c       add x12, x12, x9
0xb9c90011b10   150  0d008584       st1 {v4.d}[0], [x12]
0xb9c90011b14   154  9103312c       add x12, x9, #0xcc (204)
0xb9c90011b18   158  b86c68cc       ldr w12, [x6, x12]
0xb9c90011b1c   15c  9100e08d       add x13, x4, #0x38 (56)
0xb9c90011b20   160  b82d68cc       str w12, [x6, x13]
0xb9c90011b24   164  9103112c       add x12, x9, #0xc4 (196)
0xb9c90011b28   168  f86c68cc       ldr x12, [x6, x12]
0xb9c90011b2c   16c  9100c08d       add x13, x4, #0x30 (48)
0xb9c90011b30   170  f82d68cc       str x12, [x6, x13]
0xb9c90011b34   174  1101800c       add w12, w0, #0x60 (96)
0xb9c90011b38   178  9100112d       add x13, x9, #0x4 (4)
0xb9c90011b3c   17c  b86d68c2       ldr w2, [x6, x13]
0xb9c90011b40   180  9100212e       add x14, x9, #0x8 (8)
0xb9c90011b44   184  b86e68c3       ldr w3, [x6, x14]
0xb9c90011b48   188  9100412f       add x15, x9, #0x10 (16)
0xb9c90011b4c   18c  b86f68d3       ldr w19, [x6, x15]
0xb9c90011b50   190  91005134       add x20, x9, #0x14 (20)
0xb9c90011b54   194  b87468c5       ldr w5, [x6, x20]
0xb9c90011b58   198  3d804fe8       str q8, [sp, #304]
0xb9c90011b5c   19c  3d807fe9       str q9, [sp, #496]
0xb9c90011b60   1a0  f90033ed       str x13, [sp, #96]
0xb9c90011b64   1a4  f900efee       str x14, [sp, #472]
0xb9c90011b68   1a8  f9001fef       str x15, [sp, #56]
0xb9c90011b6c   1ac  f9003ff4       str x20, [sp, #120]
0xb9c90011b70   1b0  aa0c03e0       mov x0, x12
0xb9c90011b74   1b4  aa1303e4       mov x4, x19
0xb9c90011b78   1b8  97fc0ec1       bl #-0xfc4fc (addr 0xb9c8ff1567c)
0xb9c90011b7c   1bc  f94017e6       ldr x6, [sp, #40]
0xb9c90011b80   1c0  9100e0c8       add x8, x6, #0x38 (56)
0xb9c90011b84   1c4  f94133e9       ldr x9, [sp, #608]
0xb9c90011b88   1c8  b828693f       str wzr, [x9, x8]
0xb9c90011b8c   1cc  f9413fea       ldr x10, [sp, #632]
0xb9c90011b90   1d0  11028142       add w2, w10, #0xa0 (160)
0xb9c90011b94   1d4  9101f0cb       add x11, x6, #0x7c (124)
0xb9c90011b98   1d8  b86b692b       ldr w11, [x9, x11]
0xb9c90011b9c   1dc  910200cc       add x12, x6, #0x80 (128)
0xb9c90011ba0   1e0  b86c692c       ldr w12, [x9, x12]
0xb9c90011ba4   1e4  0b0c096c       add w12, w11, w12, lsl #2
0xb9c90011ba8   1e8  f940efed       ldr x13, [sp, #472]
0xb9c90011bac   1ec  b86d692e       ldr w14, [x9, x13]
0xb9c90011bb0   1f0  f94033ef       ldr x15, [sp, #96]
0xb9c90011bb4   1f4  b86f6933       ldr w19, [x9, x15]
0xb9c90011bb8   1f8  1100c140       add w0, w10, #0x30 (48)
0xb9c90011bbc   1fc  f900f7e8       str x8, [sp, #488]
0xb9c90011bc0   200  f90113e2       str x2, [sp, #544]
0xb9c90011bc4   204  f9011feb       str x11, [sp, #568]
0xb9c90011bc8   208  f9011bec       str x12, [sp, #560]
0xb9c90011bcc   20c  f90137ee       str x14, [sp, #616]
0xb9c90011bd0   210  f9012ff3       str x19, [sp, #600]
0xb9c90011bd4   214  f9012be0       str x0, [sp, #592]
0xb9c90011bd8   218  aa0b03f5       mov x21, x11
0xb9c90011bdc   21c  d2800014       movz x20, #0x0
0xb9c90011be0   220  fd4117e5       ldr d5, [sp, #552]
0xb9c90011be4   224  f8520356       ldur x22, [x26, #-224]
0xb9c90011be8   228  eb3663ff       cmp sp, x22
0xb9c90011bec   22c  5400c889       b.ls #+0x1910 (addr 0xb9c900134fc)
0xb9c90011bf0   230  6b0c02bf       cmp w21, w12
0xb9c90011bf4   234  54000120       b.eq #+0x24 (addr 0xb9c90011c18)
0xb9c90011bf8   238  b8756936       ldr w22, [x9, x21]
0xb9c90011bfc   23c  110012b5       add w21, w21, #0x4 (4)
0xb9c90011c00   240  6b1601df       cmp w14, w22
0xb9c90011c04   244  54ffff09       b.ls #-0x20 (addr 0xb9c90011be4)
0xb9c90011c08   248  0b160a76       add w22, w19, w22, lsl #2
0xb9c90011c0c   24c  bc766925       ldr s5, [x9, x22]
0xb9c90011c10   250  d2800036       movz x22, #0x1
0xb9c90011c14   254  14000003       b #+0xc (addr 0xb9c90011c20)
0xb9c90011c18   258  d2800016       movz x22, #0x0
0xb9c90011c1c   25c  aa0c03f5       mov x21, x12
0xb9c90011c20   260  fd0117e5       str d5, [sp, #552]
0xb9c90011c24   264  f90123f5       str x21, [sp, #576]
0xb9c90011c28   268  710006df       cmp w22, #0x1 (1)
0xb9c90011c2c   26c  540004a1       b.ne #+0x94 (addr 0xb9c90011cc0)
0xb9c90011c30   270  9100c0d6       add x22, x6, #0x30 (48)
0xb9c90011c34   274  b8766936       ldr w22, [x9, x22]
0xb9c90011c38   278  6b16029f       cmp w20, w22
0xb9c90011c3c   27c  54000261       b.ne #+0x4c (addr 0xb9c90011c88)
0xb9c90011c40   280  d2800023       movz x3, #0x1
0xb9c90011c44   284  f90127f4       str x20, [sp, #584]
0xb9c90011c48   288  f9414be7       ldr x7, [sp, #656]
0xb9c90011c4c   28c  aa1403e2       mov x2, x20
0xb9c90011c50   290  97fc0e8c       bl #-0xfc5d0 (addr 0xb9c8ff15680)
0xb9c90011c54   294  f94133e9       ldr x9, [sp, #608]
0xb9c90011c58   298  f94017e6       ldr x6, [sp, #40]
0xb9c90011c5c   29c  f94033ef       ldr x15, [sp, #96]
0xb9c90011c60   2a0  f940efed       ldr x13, [sp, #472]
0xb9c90011c64   2a4  f940f7e8       ldr x8, [sp, #488]
0xb9c90011c68   2a8  f9411bec       ldr x12, [sp, #560]
0xb9c90011c6c   2ac  f9413fea       ldr x10, [sp, #632]
0xb9c90011c70   2b0  fd4117e5       ldr d5, [sp, #552]
0xb9c90011c74   2b4  f94123f5       ldr x21, [sp, #576]
0xb9c90011c78   2b8  f94127f4       ldr x20, [sp, #584]
0xb9c90011c7c   2bc  f9412be0       ldr x0, [sp, #592]
0xb9c90011c80   2c0  f9412ff3       ldr x19, [sp, #600]
0xb9c90011c84   2c4  f94137ee       ldr x14, [sp, #616]
0xb9c90011c88   2c8  1100068b       add w11, w20, #0x1 (1)
0xb9c90011c8c   2cc  aa0903f0       mov x16, x9
0xb9c90011c90   2d0  aa0803e9       mov x9, x8
0xb9c90011c94   2d4  aa1003e8       mov x8, x16
0xb9c90011c98   2d8  b829690b       str w11, [x8, x9]
0xb9c90011c9c   2dc  9100d0d6       add x22, x6, #0x34 (52)
0xb9c90011ca0   2e0  b8766916       ldr w22, [x8, x22]
0xb9c90011ca4   2e4  0b140ad4       add w20, w22, w20, lsl #2
0xb9c90011ca8   2e8  bc346905       str s5, [x8, x20]
0xb9c90011cac   2ec  aa0903f0       mov x16, x9
0xb9c90011cb0   2f0  aa0803e9       mov x9, x8
0xb9c90011cb4   2f4  aa1003e8       mov x8, x16
0xb9c90011cb8   2f8  aa0b03f4       mov x20, x11
0xb9c90011cbc   2fc  17ffffca       b #-0xd8 (addr 0xb9c90011be4)
0xb9c90011cc0   300  910110cb       add x11, x6, #0x44 (68)
0xb9c90011cc4   304  b82b693f       str wzr, [x9, x11]
0xb9c90011cc8   308  f9403fee       ldr x14, [sp, #120]
0xb9c90011ccc   30c  b86e6933       ldr w19, [x9, x14]
0xb9c90011cd0   310  f9401ff4       ldr x20, [sp, #56]
0xb9c90011cd4   314  b8746935       ldr w21, [x9, x20]
0xb9c90011cd8   318  1100f140       add w0, w10, #0x3c (60)
0xb9c90011cdc   31c  f9012feb       str x11, [sp, #600]
0xb9c90011ce0   320  f90127f3       str x19, [sp, #584]
0xb9c90011ce4   324  f9012bf5       str x21, [sp, #592]
0xb9c90011ce8   328  f90103e0       str x0, [sp, #512]
0xb9c90011cec   32c  aa0c03f6       mov x22, x12
0xb9c90011cf0   330  f9411fec       ldr x12, [sp, #568]
0xb9c90011cf4   334  d2800002       movz x2, #0x0
0xb9c90011cf8   338  f8520357       ldur x23, [x26, #-224]
0xb9c90011cfc   33c  eb3763ff       cmp sp, x23
0xb9c90011d00   340  5400c229       b.ls #+0x1844 (addr 0xb9c90013544)
0xb9c90011d04   344  6b16019f       cmp w12, w22
0xb9c90011d08   348  54000120       b.eq #+0x24 (addr 0xb9c90011d2c)
0xb9c90011d0c   34c  b86c6937       ldr w23, [x9, x12]
0xb9c90011d10   350  1100118c       add w12, w12, #0x4 (4)
0xb9c90011d14   354  6b17027f       cmp w19, w23
0xb9c90011d18   358  54ffff09       b.ls #-0x20 (addr 0xb9c90011cf8)
0xb9c90011d1c   35c  0b170ab7       add w23, w21, w23, lsl #2
0xb9c90011d20   360  bc776925       ldr s5, [x9, x23]
0xb9c90011d24   364  d2800037       movz x23, #0x1
0xb9c90011d28   368  14000003       b #+0xc (addr 0xb9c90011d34)
0xb9c90011d2c   36c  d2800017       movz x23, #0x0
0xb9c90011d30   370  aa1603ec       mov x12, x22
0xb9c90011d34   374  fd0117e5       str d5, [sp, #552]
0xb9c90011d38   378  f90123ec       str x12, [sp, #576]
0xb9c90011d3c   37c  710006ff       cmp w23, #0x1 (1)
0xb9c90011d40   380  540003e1       b.ne #+0x7c (addr 0xb9c90011dbc)
0xb9c90011d44   384  9100f0d7       add x23, x6, #0x3c (60)
0xb9c90011d48   388  b8776937       ldr w23, [x9, x23]
0xb9c90011d4c   38c  6b17005f       cmp w2, w23
0xb9c90011d50   390  54000261       b.ne #+0x4c (addr 0xb9c90011d9c)
0xb9c90011d54   394  f90137e2       str x2, [sp, #616]
0xb9c90011d58   398  f9414be7       ldr x7, [sp, #656]
0xb9c90011d5c   39c  d2800023       movz x3, #0x1
0xb9c90011d60   3a0  97fc0e48       bl #-0xfc6e0 (addr 0xb9c8ff15680)
0xb9c90011d64   3a4  f94133e9       ldr x9, [sp, #608]
0xb9c90011d68   3a8  f94017e6       ldr x6, [sp, #40]
0xb9c90011d6c   3ac  f9401ff4       ldr x20, [sp, #56]
0xb9c90011d70   3b0  f9403fee       ldr x14, [sp, #120]
0xb9c90011d74   3b4  f940f7e8       ldr x8, [sp, #488]
0xb9c90011d78   3b8  f9412feb       ldr x11, [sp, #600]
0xb9c90011d7c   3bc  f9411bf6       ldr x22, [sp, #560]
0xb9c90011d80   3c0  f9413fea       ldr x10, [sp, #632]
0xb9c90011d84   3c4  fd4117e5       ldr d5, [sp, #552]
0xb9c90011d88   3c8  f94123ec       ldr x12, [sp, #576]
0xb9c90011d8c   3cc  f94137e2       ldr x2, [sp, #616]
0xb9c90011d90   3d0  f94103e0       ldr x0, [sp, #512]
0xb9c90011d94   3d4  f9412bf5       ldr x21, [sp, #592]
0xb9c90011d98   3d8  f94127f3       ldr x19, [sp, #584]
0xb9c90011d9c   3dc  1100044d       add w13, w2, #0x1 (1)
0xb9c90011da0   3e0  b82b692d       str w13, [x9, x11]
0xb9c90011da4   3e4  910100cf       add x15, x6, #0x40 (64)
0xb9c90011da8   3e8  b86f692f       ldr w15, [x9, x15]
0xb9c90011dac   3ec  0b0209ef       add w15, w15, w2, lsl #2
0xb9c90011db0   3f0  bc2f6925       str s5, [x9, x15]
0xb9c90011db4   3f4  aa0d03e2       mov x2, x13
0xb9c90011db8   3f8  17ffffd0       b #-0xc0 (addr 0xb9c90011cf8)
0xb9c90011dbc   3fc  910140cc       add x12, x6, #0x50 (80)
0xb9c90011dc0   400  b82c693f       str wzr, [x9, x12]
0xb9c90011dc4   404  910080cd       add x13, x6, #0x20 (32)
0xb9c90011dc8   408  b86d692f       ldr w15, [x9, x13]
0xb9c90011dcc   40c  910070d3       add x19, x6, #0x1c (28)
0xb9c90011dd0   410  b8736935       ldr w21, [x9, x19]
0xb9c90011dd4   414  11012140       add w0, w10, #0x48 (72)
0xb9c90011dd8   418  f9012bec       str x12, [sp, #592]
0xb9c90011ddc   41c  f9002bed       str x13, [sp, #80]
0xb9c90011de0   420  f90103ef       str x15, [sp, #512]
0xb9c90011de4   424  f90043f3       str x19, [sp, #128]
0xb9c90011de8   428  f90123f5       str x21, [sp, #576]
0xb9c90011dec   42c  f90107e0       str x0, [sp, #520]
0xb9c90011df0   430  aa1603f7       mov x23, x22
0xb9c90011df4   434  f9411ff6       ldr x22, [sp, #568]
0xb9c90011df8   438  d2800002       movz x2, #0x0
0xb9c90011dfc   43c  f8520358       ldur x24, [x26, #-224]
0xb9c90011e00   440  eb3863ff       cmp sp, x24
0xb9c90011e04   444  5400bc69       b.ls #+0x178c (addr 0xb9c90013590)
0xb9c90011e08   448  6b1702df       cmp w22, w23
0xb9c90011e0c   44c  54000120       b.eq #+0x24 (addr 0xb9c90011e30)
0xb9c90011e10   450  b8766938       ldr w24, [x9, x22]
0xb9c90011e14   454  110012d6       add w22, w22, #0x4 (4)
0xb9c90011e18   458  6b1801ff       cmp w15, w24
0xb9c90011e1c   45c  54ffff09       b.ls #-0x20 (addr 0xb9c90011dfc)
0xb9c90011e20   460  0b180ab8       add w24, w21, w24, lsl #2
0xb9c90011e24   464  bc786925       ldr s5, [x9, x24]
0xb9c90011e28   468  d2800038       movz x24, #0x1
0xb9c90011e2c   46c  14000003       b #+0xc (addr 0xb9c90011e38)
0xb9c90011e30   470  d2800018       movz x24, #0x0
0xb9c90011e34   474  aa1703f6       mov x22, x23
0xb9c90011e38   478  fd0117e5       str d5, [sp, #552]
0xb9c90011e3c   47c  f90127f6       str x22, [sp, #584]
0xb9c90011e40   480  7100071f       cmp w24, #0x1 (1)
0xb9c90011e44   484  540003e1       b.ne #+0x7c (addr 0xb9c90011ec0)
0xb9c90011e48   488  910120d8       add x24, x6, #0x48 (72)
0xb9c90011e4c   48c  b8786938       ldr w24, [x9, x24]
0xb9c90011e50   490  6b18005f       cmp w2, w24
0xb9c90011e54   494  54000261       b.ne #+0x4c (addr 0xb9c90011ea0)
0xb9c90011e58   498  f90137e2       str x2, [sp, #616]
0xb9c90011e5c   49c  f9414be7       ldr x7, [sp, #656]
0xb9c90011e60   4a0  d2800023       movz x3, #0x1
0xb9c90011e64   4a4  97fc0e07       bl #-0xfc7e4 (addr 0xb9c8ff15680)
0xb9c90011e68   4a8  f94133e9       ldr x9, [sp, #608]
0xb9c90011e6c   4ac  f94017e6       ldr x6, [sp, #40]
0xb9c90011e70   4b0  f94043f3       ldr x19, [sp, #128]
0xb9c90011e74   4b4  f9402bed       ldr x13, [sp, #80]
0xb9c90011e78   4b8  f9412feb       ldr x11, [sp, #600]
0xb9c90011e7c   4bc  f9412bec       ldr x12, [sp, #592]
0xb9c90011e80   4c0  f9411bf7       ldr x23, [sp, #560]
0xb9c90011e84   4c4  fd4117e5       ldr d5, [sp, #552]
0xb9c90011e88   4c8  f9413fea       ldr x10, [sp, #632]
0xb9c90011e8c   4cc  f94127f6       ldr x22, [sp, #584]
0xb9c90011e90   4d0  f94137e2       ldr x2, [sp, #616]
0xb9c90011e94   4d4  f94107e0       ldr x0, [sp, #520]
0xb9c90011e98   4d8  f94123f5       ldr x21, [sp, #576]
0xb9c90011e9c   4dc  f94103ef       ldr x15, [sp, #512]
0xb9c90011ea0   4e0  11000448       add w8, w2, #0x1 (1)
0xb9c90011ea4   4e4  b82c6928       str w8, [x9, x12]
0xb9c90011ea8   4e8  910130ce       add x14, x6, #0x4c (76)
0xb9c90011eac   4ec  b86e692e       ldr w14, [x9, x14]
0xb9c90011eb0   4f0  0b0209ce       add w14, w14, w2, lsl #2
0xb9c90011eb4   4f4  bc2e6925       str s5, [x9, x14]
0xb9c90011eb8   4f8  aa0803e2       mov x2, x8
0xb9c90011ebc   4fc  17ffffd0       b #-0xc0 (addr 0xb9c90011dfc)
0xb9c90011ec0   500  910170c8       add x8, x6, #0x5c (92)
0xb9c90011ec4   504  b828693f       str wzr, [x9, x8]
0xb9c90011ec8   508  9100b0ce       add x14, x6, #0x2c (44)
0xb9c90011ecc   50c  b86e692f       ldr w15, [x9, x14]
0xb9c90011ed0   510  9100a0d4       add x20, x6, #0x28 (40)
0xb9c90011ed4   514  b8746935       ldr w21, [x9, x20]
0xb9c90011ed8   518  11015140       add w0, w10, #0x54 (84)
0xb9c90011edc   51c  f90137e8       str x8, [sp, #616]
0xb9c90011ee0   520  f90047ee       str x14, [sp, #136]
0xb9c90011ee4   524  f900f3ef       str x15, [sp, #480]
0xb9c90011ee8   528  f9002ff4       str x20, [sp, #88]
0xb9c90011eec   52c  f90107f5       str x21, [sp, #520]
0xb9c90011ef0   530  f9013fe0       str x0, [sp, #632]
0xb9c90011ef4   534  d2800002       movz x2, #0x0
0xb9c90011ef8   538  f9411fea       ldr x10, [sp, #568]
0xb9c90011efc   53c  aa1703f6       mov x22, x23
0xb9c90011f00   540  14000004       b #+0x10 (addr 0xb9c90011f10)
0xb9c90011f04   544  aa0903f0       mov x16, x9
0xb9c90011f08   548  aa0803e9       mov x9, x8
0xb9c90011f0c   54c  aa1003e8       mov x8, x16
0xb9c90011f10   550  f8520357       ldur x23, [x26, #-224]
0xb9c90011f14   554  eb3763ff       cmp sp, x23
0xb9c90011f18   558  5400b629       b.ls #+0x16c4 (addr 0xb9c900135dc)
0xb9c90011f1c   55c  6b16015f       cmp w10, w22
0xb9c90011f20   560  540001a0       b.eq #+0x34 (addr 0xb9c90011f54)
0xb9c90011f24   564  b86a6937       ldr w23, [x9, x10]
0xb9c90011f28   568  1100114a       add w10, w10, #0x4 (4)
0xb9c90011f2c   56c  6b1701ff       cmp w15, w23
0xb9c90011f30   570  540000a9       b.ls #+0x14 (addr 0xb9c90011f44)
0xb9c90011f34   574  0b170ab7       add w23, w21, w23, lsl #2
0xb9c90011f38   578  bc776925       ldr s5, [x9, x23]
0xb9c90011f3c   57c  d2800037       movz x23, #0x1
0xb9c90011f40   580  14000007       b #+0x1c (addr 0xb9c90011f5c)
0xb9c90011f44   584  aa0803f0       mov x16, x8
0xb9c90011f48   588  aa0903e8       mov x8, x9
0xb9c90011f4c   58c  aa1003e9       mov x9, x16
0xb9c90011f50   590  17ffffed       b #-0x4c (addr 0xb9c90011f04)
0xb9c90011f54   594  d2800017       movz x23, #0x0
0xb9c90011f58   598  aa1603ea       mov x10, x22
0xb9c90011f5c   59c  f9011fea       str x10, [sp, #568]
0xb9c90011f60   5a0  fd0117e5       str d5, [sp, #552]
0xb9c90011f64   5a4  710006ff       cmp w23, #0x1 (1)
0xb9c90011f68   5a8  54000421       b.ne #+0x84 (addr 0xb9c90011fec)
0xb9c90011f6c   5ac  910150d7       add x23, x6, #0x54 (84)
0xb9c90011f70   5b0  b8776937       ldr w23, [x9, x23]
0xb9c90011f74   5b4  6b17005f       cmp w2, w23
0xb9c90011f78   5b8  54000241       b.ne #+0x48 (addr 0xb9c90011fc0)
0xb9c90011f7c   5bc  f90127e2       str x2, [sp, #584]
0xb9c90011f80   5c0  f9414be7       ldr x7, [sp, #656]
0xb9c90011f84   5c4  d2800023       movz x3, #0x1
0xb9c90011f88   5c8  97fc0dbe       bl #-0xfc908 (addr 0xb9c8ff15680)
0xb9c90011f8c   5cc  f94133e9       ldr x9, [sp, #608]
0xb9c90011f90   5d0  f94017e6       ldr x6, [sp, #40]
0xb9c90011f94   5d4  f9402ff4       ldr x20, [sp, #88]
0xb9c90011f98   5d8  f94047ee       ldr x14, [sp, #136]
0xb9c90011f9c   5dc  f94137e8       ldr x8, [sp, #616]
0xb9c90011fa0   5e0  f9412bec       ldr x12, [sp, #592]
0xb9c90011fa4   5e4  f94127e2       ldr x2, [sp, #584]
0xb9c90011fa8   5e8  f9411fea       ldr x10, [sp, #568]
0xb9c90011fac   5ec  fd4117e5       ldr d5, [sp, #552]
0xb9c90011fb0   5f0  f9413fe0       ldr x0, [sp, #632]
0xb9c90011fb4   5f4  f9411bf6       ldr x22, [sp, #560]
0xb9c90011fb8   5f8  f94107f5       ldr x21, [sp, #520]
0xb9c90011fbc   5fc  f940f3ef       ldr x15, [sp, #480]
0xb9c90011fc0   600  1100044b       add w11, w2, #0x1 (1)
0xb9c90011fc4   604  aa0903f0       mov x16, x9
0xb9c90011fc8   608  aa0803e9       mov x9, x8
0xb9c90011fcc   60c  aa1003e8       mov x8, x16
0xb9c90011fd0   610  b829690b       str w11, [x8, x9]
0xb9c90011fd4   614  910160cd       add x13, x6, #0x58 (88)
0xb9c90011fd8   618  b86d690d       ldr w13, [x8, x13]
0xb9c90011fdc   61c  0b0209ad       add w13, w13, w2, lsl #2
0xb9c90011fe0   620  bc2d6905       str s5, [x8, x13]
0xb9c90011fe4   624  aa0b03e2       mov x2, x11
0xb9c90011fe8   628  17ffffc7       b #-0xe4 (addr 0xb9c90011f04)
0xb9c90011fec   62c  f940f7ea       ldr x10, [sp, #488]
0xb9c90011ff0   630  b86a692b       ldr w11, [x9, x10]
0xb9c90011ff4   634  9100c0cd       add x13, x6, #0x30 (48)
0xb9c90011ff8   638  3ced6924       ldr q4, [x9, x13]
0xb9c90011ffc   63c  3ce66925       ldr q5, [x9, x6]
0xb9c90012000   640  3cad6925       str q5, [x9, x13]
0xb9c90012004   644  3ca66924       str q4, [x9, x6]
0xb9c90012008   648  910100cd       add x13, x6, #0x40 (64)
0xb9c9001200c   64c  3ced6924       ldr q4, [x9, x13]
0xb9c90012010   650  f9401fef       ldr x15, [sp, #56]
0xb9c90012014   654  3cef6925       ldr q5, [x9, x15]
0xb9c90012018   658  3cad6925       str q5, [x9, x13]
0xb9c9001201c   65c  3caf6924       str q4, [x9, x15]
0xb9c90012020   660  f86c6933       ldr x19, [x9, x12]
0xb9c90012024   664  910160d5       add x21, x6, #0x58 (88)
0xb9c90012028   668  b8756936       ldr w22, [x9, x21]
0xb9c9001202c   66c  f9402bf7       ldr x23, [sp, #80]
0xb9c90012030   670  3cf76924       ldr q4, [x9, x23]
0xb9c90012034   674  3cac6924       str q4, [x9, x12]
0xb9c90012038   678  b86e6938       ldr w24, [x9, x14]
0xb9c9001203c   67c  b82e6922       str w2, [x9, x14]
0xb9c90012040   680  b8346936       str w22, [x9, x20]
0xb9c90012044   684  f8376933       str x19, [x9, x23]
0xb9c90012048   688  f9013feb       str x11, [sp, #632]
0xb9c9001204c   68c  3500010b       cbnz w11, #+0x20 (addr 0xb9c9001206c)
0xb9c90012050   690  f94143e4       ldr x4, [sp, #640]
0xb9c90012054   694  11050086       add w6, w4, #0x140 (320)
0xb9c90012058   698  f94147f3       ldr x19, [sp, #648]
0xb9c9001205c   69c  b9000266       str w6, [x19]
0xb9c90012060   6a0  910003bf       mov sp, fp
0xb9c90012064   6a4  a8c17bfd       ldp fp, lr, [sp], #16
0xb9c90012068   6a8  d65f03c0       ret
0xb9c9001206c   6ac  b86c692c       ldr w12, [x9, x12]
0xb9c90012070   6b0  f9412ff3       ldr x19, [sp, #600]
0xb9c90012074   6b4  b8736933       ldr w19, [x9, x19]
0xb9c90012078   6b8  b86a692a       ldr w10, [x9, x10]
0xb9c9001207c   6bc  6b0a027f       cmp w19, w10
0xb9c90012080   6c0  1a8a3276       csel w22, w19, w10, lo
0xb9c90012084   6c4  6b16019f       cmp w12, w22
0xb9c90012088   6c8  1a96318a       csel w10, w12, w22, lo
0xb9c9001208c   6cc  b875692c       ldr w12, [x9, x21]
0xb9c90012090   6d0  910130d3       add x19, x6, #0x4c (76)
0xb9c90012094   6d4  b8736933       ldr w19, [x9, x19]
0xb9c90012098   6d8  b86d692d       ldr w13, [x9, x13]
0xb9c9001209c   6dc  9100d0d5       add x21, x6, #0x34 (52)
0xb9c900120a0   6e0  b8756935       ldr w21, [x9, x21]
0xb9c900120a4   6e4  b8686928       ldr w8, [x9, x8]
0xb9c900120a8   6e8  f9413bf6       ldr x22, [sp, #624]
0xb9c900120ac   6ec  bc766924       ldr s4, [x9, x22]
0xb9c900120b0   6f0  1e240881       fmul s1, s4, s4
0xb9c900120b4   6f4  4e040424       dup v4.4s, v1.s[0]
0xb9c900120b8   6f8  910290d6       add x22, x6, #0xa4 (164)
0xb9c900120bc   6fc  bc766925       ldr s5, [x9, x22]
0xb9c900120c0   700  1e2508a0       fmul s0, s5, s5
0xb9c900120c4   704  4e040405       dup v5.4s, v0.s[0]
0xb9c900120c8   708  f9011bea       str x10, [sp, #560]
0xb9c900120cc   70c  f9012fec       str x12, [sp, #600]
0xb9c900120d0   710  f90127f3       str x19, [sp, #584]
0xb9c900120d4   714  f90123ed       str x13, [sp, #576]
0xb9c900120d8   718  f9011ff5       str x21, [sp, #568]
0xb9c900120dc   71c  f900f7e8       str x8, [sp, #488]
0xb9c900120e0   720  fd00cfe1       str d1, [sp, #408]
0xb9c900120e4   724  3d804be4       str q4, [sp, #288]
0xb9c900120e8   728  fd00cbe0       str d0, [sp, #400]
0xb9c900120ec   72c  3d8047e5       str q5, [sp, #272]
0xb9c900120f0   730  f940eff9       ldr x25, [sp, #472]
0xb9c900120f4   734  f90137f8       str x24, [sp, #616]
0xb9c900120f8   738  2f00e406       movi d6, #0x0
0xb9c900120fc   73c  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c90012100   740  3dc04fe8       ldr q8, [sp, #304]
0xb9c90012104   744  d2800002       movz x2, #0x0
0xb9c90012108   748  f9401be1       ldr x1, [sp, #48]
0xb9c9001210c   74c  f94043e0       ldr x0, [sp, #128]
0xb9c90012110   750  f94033fc       ldr x28, [sp, #96]
0xb9c90012114   754  f9403ffb       ldr cp, [sp, #120]
0xb9c90012118   758  aa0203f6       mov x22, x2
0xb9c9001211c   75c  f8520343       ldur x3, [x26, #-224]
0xb9c90012120   760  eb2363ff       cmp sp, x3
0xb9c90012124   764  5400a809       b.ls #+0x1500 (addr 0xb9c90013624)
0xb9c90012128   768  b8796923       ldr w3, [x9, x25]
0xb9c9001212c   76c  f9005fe3       str x3, [sp, #184]
0xb9c90012130   770  6b16007f       cmp w3, w22
0xb9c90012134   774  54009a29       b.ls #+0x1344 (addr 0xb9c90013478)
0xb9c90012138   778  b87b6924       ldr w4, [x9, x27]
0xb9c9001213c   77c  f90007e4       str x4, [sp, #8]
0xb9c90012140   780  6b16009f       cmp w4, w22
0xb9c90012144   784  540099a9       b.ls #+0x1334 (addr 0xb9c90013478)
0xb9c90012148   788  b8776925       ldr w5, [x9, x23]
0xb9c9001214c   78c  f9000fe5       str x5, [sp, #24]
0xb9c90012150   790  6b1600bf       cmp w5, w22
0xb9c90012154   794  54009929       b.ls #+0x1324 (addr 0xb9c90013478)
0xb9c90012158   798  b86e6927       ldr w7, [x9, x14]
0xb9c9001215c   79c  f9000be7       str x7, [sp, #16]
0xb9c90012160   7a0  6b1600ff       cmp w7, w22
0xb9c90012164   7a4  540098a9       b.ls #+0x1314 (addr 0xb9c90013478)
0xb9c90012168   7a8  b87c6928       ldr w8, [x9, x28]
0xb9c9001216c   7ac  531e76ca       lsl w10, w22, #2
0xb9c90012170   7b0  0b0a010b       add w11, w8, w10
0xb9c90012174   7b4  bc6b6922       ldr s2, [x9, x11]
0xb9c90012178   7b8  b86f692b       ldr w11, [x9, x15]
0xb9c9001217c   7bc  f90067e8       str x8, [sp, #200]
0xb9c90012180   7c0  0b0a0168       add w8, w11, w10
0xb9c90012184   7c4  bc686923       ldr s3, [x9, x8]
0xb9c90012188   7c8  b8606928       ldr w8, [x9, x0]
0xb9c9001218c   7cc  f9006beb       str x11, [sp, #208]
0xb9c90012190   7d0  0b0a010b       add w11, w8, w10
0xb9c90012194   7d4  bc6b6929       ldr s9, [x9, x11]
0xb9c90012198   7d8  b874692b       ldr w11, [x9, x20]
0xb9c9001219c   7dc  f90073e8       str x8, [sp, #224]
0xb9c900121a0   7e0  0b0a0168       add w8, w11, w10
0xb9c900121a4   7e4  f9012bea       str x10, [sp, #592]
0xb9c900121a8   7e8  bc68692a       ldr s10, [x9, x8]
0xb9c900121ac   7ec  f94143ea       ldr x10, [sp, #640]
0xb9c900121b0   7f0  91003148       add x8, x10, #0xc (12)
0xb9c900121b4   7f4  bc28692a       str s10, [x9, x8]
0xb9c900121b8   7f8  91002148       add x8, x10, #0x8 (8)
0xb9c900121bc   7fc  bc286929       str s9, [x9, x8]
0xb9c900121c0   800  91001148       add x8, x10, #0x4 (4)
0xb9c900121c4   804  bc286923       str s3, [x9, x8]
0xb9c900121c8   808  bc2a6922       str s2, [x9, x10]
0xb9c900121cc   80c  9100a148       add x8, x10, #0x28 (40)
0xb9c900121d0   810  b828693f       str wzr, [x9, x8]
0xb9c900121d4   814  f90103e8       str x8, [sp, #512]
0xb9c900121d8   818  91008148       add x8, x10, #0x20 (32)
0xb9c900121dc   81c  f828693f       str xzr, [x9, x8]
0xb9c900121e0   820  6f00e409       movi v9.2d, #0x0
0xb9c900121e4   824  f900f3e8       str x8, [sp, #480]
0xb9c900121e8   828  91004148       add x8, x10, #0x10 (16)
0xb9c900121ec   82c  3ca86929       str q9, [x9, x8]
0xb9c900121f0   830  f90107e8       str x8, [sp, #520]
0xb9c900121f4   834  910220c8       add x8, x6, #0x88 (136)
0xb9c900121f8   838  b8686928       ldr w8, [x9, x8]
0xb9c900121fc   83c  f9003be8       str x8, [sp, #112]
0xb9c90012200   840  910230c8       add x8, x6, #0x8c (140)
0xb9c90012204   844  b8686928       ldr w8, [x9, x8]
0xb9c90012208   848  bc616929       ldr s9, [x9, x1]
0xb9c9001220c   84c  11010146       add w6, w10, #0x40 (64)
0xb9c90012210   850  f9013bf6       str x22, [sp, #624]
0xb9c90012214   854  fd00c3e2       str d2, [sp, #384]
0xb9c90012218   858  fd00c7e3       str d3, [sp, #392]
0xb9c9001221c   85c  f9006feb       str x11, [sp, #216]
0xb9c90012220   860  f900ebe8       str x8, [sp, #464]
0xb9c90012224   864  fd00e7e9       str d9, [sp, #456]
0xb9c90012228   868  f90117e6       str x6, [sp, #552]
0xb9c9001222c   86c  f9414be0       ldr x0, [sp, #656]
0xb9c90012230   870  aa0203e1       mov x1, x2
0xb9c90012234   874  aa0203e3       mov x3, x2
0xb9c90012238   878  aa0603e2       mov x2, x6
0xb9c9001223c   87c  d2801c04       movz x4, #0xe0
0xb9c90012240   880  5800aa10       ldr x16, pc+5440 (addr 0x00000b9c90013780)
0xb9c90012244   884  10000068       adr x8, #+0xc (addr 0xb9c90012250)
0xb9c90012248   888  a9027748       stp x8, fp, [x26, #32]
0xb9c9001224c   88c  d63f0200       blr x16
0xb9c90012250   890  f900175f       str xzr, [x26, #40]
0xb9c90012254   894  6a00001f       tst w0, w0
0xb9c90012258   898  5400a8c0       b.eq #+0x1518 (addr 0xb9c90013770)
0xb9c9001225c   89c  f940ebe6       ldr x6, [sp, #464]
0xb9c90012260   8a0  710000df       cmp w6, #0x0 (0)
0xb9c90012264   8a4  9a9f07e8       cset x8, ne
0xb9c90012268   8a8  4b0800c6       sub w6, w6, w8
0xb9c9001226c   8ac  fd40c7e3       ldr d3, [sp, #392]
0xb9c90012270   8b0  fd40e7e4       ldr d4, [sp, #456]
0xb9c90012274   8b4  1e240865       fmul s5, s3, s4
0xb9c90012278   8b8  1e2520a0       fcmp s5, s5
0xb9c9001227c   8bc  1e251de5       fcsel s5, s15, s5, ne
0xb9c90012280   8c0  1e2020a8       fcmp s5, #0.0
0xb9c90012284   8c4  1e2fcca5       fcsel s5, s5, s15, gt
0xb9c90012288   8c8  1e22c0a6       fcvt d6, s5
0xb9c9001228c   8cc  1e65c0c7       frintz d7, d6
0xb9c90012290   8d0  1e7900e8       fcvtzu w8, d7
0xb9c90012294   8d4  1e630108       ucvtf d8, w8
0xb9c90012298   8d8  1e6820e0       fcmp d7, d8
0xb9c9001229c   8dc  54009fa1       b.ne #+0x13f4 (addr 0xb9c90013690)
0xb9c900122a0   8e0  6b0800df       cmp w6, w8
0xb9c900122a4   8e4  1a8830c9       csel w9, w6, w8, lo
0xb9c900122a8   8e8  52a9f010       movz w16, #0x4f800000
0xb9c900122ac   8ec  1e270206       fmov s6, w16
0xb9c900122b0   8f0  1e2620a0       fcmp s5, s6
0xb9c900122b4   8f4  1a9f3128       csel w8, w9, wzr, lo
0xb9c900122b8   8f8  7100011f       cmp w8, #0x0 (0)
0xb9c900122bc   8fc  9a9f07e9       cset x9, ne
0xb9c900122c0   900  4b090109       sub w9, w8, w9
0xb9c900122c4   904  11000508       add w8, w8, #0x1 (1)
0xb9c900122c8   908  6b0800df       cmp w6, w8
0xb9c900122cc   90c  1a8830ca       csel w10, w6, w8, lo
0xb9c900122d0   910  f900ebea       str x10, [sp, #464]
0xb9c900122d4   914  6b0a013f       cmp w9, w10
0xb9c900122d8   918  54000149       b.ls #+0x28 (addr 0xb9c90012300)
0xb9c900122dc   91c  f94103e6       ldr x6, [sp, #512]
0xb9c900122e0   920  2f00e406       movi d6, #0x0
0xb9c900122e4   924  f94137f8       ldr x24, [sp, #616]
0xb9c900122e8   928  3dc07fe4       ldr q4, [sp, #496]
0xb9c900122ec   92c  f94143e4       ldr x4, [sp, #640]
0xb9c900122f0   930  f94133ec       ldr x12, [sp, #608]
0xb9c900122f4   934  f94107e8       ldr x8, [sp, #520]
0xb9c900122f8   938  4ea41c85       mov v5.16b, v4.16b
0xb9c900122fc   93c  14000402       b #+0x1008 (addr 0xb9c90013304)
0xb9c90012300   940  f9403be6       ldr x6, [sp, #112]
0xb9c90012304   944  710000df       cmp w6, #0x0 (0)
0xb9c90012308   948  9a9f07e8       cset x8, ne
0xb9c9001230c   94c  4b0800c8       sub w8, w6, w8
0xb9c90012310   950  fd40c3e2       ldr d2, [sp, #384]
0xb9c90012314   954  1e240844       fmul s4, s2, s4
0xb9c90012318   958  1e242080       fcmp s4, s4
0xb9c9001231c   95c  1e241de4       fcsel s4, s15, s4, ne
0xb9c90012320   960  1e202088       fcmp s4, #0.0
0xb9c90012324   964  1e2fcc84       fcsel s4, s4, s15, gt
0xb9c90012328   968  1e22c085       fcvt d5, s4
0xb9c9001232c   96c  1e65c0a7       frintz d7, d5
0xb9c90012330   970  1e7900eb       fcvtzu w11, d7
0xb9c90012334   974  1e630168       ucvtf d8, w11
0xb9c90012338   978  1e6820e0       fcmp d7, d8
0xb9c9001233c   97c  54009ba1       b.ne #+0x1374 (addr 0xb9c900136b0)
0xb9c90012340   980  6b0b011f       cmp w8, w11
0xb9c90012344   984  1a8b310c       csel w12, w8, w11, lo
0xb9c90012348   988  1e262080       fcmp s4, s6
0xb9c9001234c   98c  1a9f318b       csel w11, w12, wzr, lo
0xb9c90012350   990  7100017f       cmp w11, #0x0 (0)
0xb9c90012354   994  9a9f07ec       cset x12, ne
0xb9c90012358   998  4b0c016c       sub w12, w11, w12
0xb9c9001235c   99c  f9400fee       ldr x14, [sp, #24]
0xb9c90012360   9a0  f9400bed       ldr x13, [sp, #16]
0xb9c90012364   9a4  6b0d01df       cmp w14, w13
0xb9c90012368   9a8  1a8d31cf       csel w15, w14, w13, lo
0xb9c9001236c   9ac  f94007f3       ldr x19, [sp, #8]
0xb9c90012370   9b0  6b0f027f       cmp w19, w15
0xb9c90012374   9b4  1a8f3274       csel w20, w19, w15, lo
0xb9c90012378   9b8  1100056b       add w11, w11, #0x1 (1)
0xb9c9001237c   9bc  6b0b011f       cmp w8, w11
0xb9c90012380   9c0  1a8b310f       csel w15, w8, w11, lo
0xb9c90012384   9c4  110005e8       add w8, w15, #0x1 (1)
0xb9c90012388   9c8  4e040464       dup v4.4s, v3.s[0]
0xb9c9001238c   9cc  4e040445       dup v5.4s, v2.s[0]
0xb9c90012390   9d0  f94017eb       ldr x11, [sp, #40]
0xb9c90012394   9d4  9101916f       add x15, x11, #0x64 (100)
0xb9c90012398   9d8  f94133f5       ldr x21, [sp, #608]
0xb9c9001239c   9dc  b86f6aaf       ldr w15, [x21, x15]
0xb9c900123a0   9e0  9101a176       add x22, x11, #0x68 (104)
0xb9c900123a4   9e4  b8766ab6       ldr w22, [x21, x22]
0xb9c900123a8   9e8  6f00e406       movi v6.2d, #0x0
0xb9c900123ac   9ec  f90027ec       str x12, [sp, #72]
0xb9c900123b0   9f0  f90063f4       str x20, [sp, #192]
0xb9c900123b4   9f4  f90013e8       str x8, [sp, #32]
0xb9c900123b8   9f8  3d8043e4       str q4, [sp, #256]
0xb9c900123bc   9fc  3d803fe5       str q5, [sp, #240]
0xb9c900123c0   a00  f90023ef       str x15, [sp, #64]
0xb9c900123c4   a04  f90037f6       str x22, [sp, #104]
0xb9c900123c8   a08  4ea61cc8       mov v8.16b, v6.16b
0xb9c900123cc   a0c  2f00e406       movi d6, #0x0
0xb9c900123d0   a10  d2800017       movz x23, #0x0
0xb9c900123d4   a14  f9405ff9       ldr x25, [sp, #184]
0xb9c900123d8   a18  fd40cbe0       ldr d0, [sp, #400]
0xb9c900123dc   a1c  fd40cfe1       ldr d1, [sp, #408]
0xb9c900123e0   a20  4ea61cc7       mov v7.16b, v6.16b
0xb9c900123e4   a24  4ea61cc9       mov v9.16b, v6.16b
0xb9c900123e8   a28  14000017       b #+0x5c (addr 0xb9c90012444)
0xb9c900123ec   a2c  fd40e7e6       ldr d6, [sp, #456]
0xb9c900123f0   a30  fd40e3e7       ldr d7, [sp, #448]
0xb9c900123f4   a34  3dc06fe8       ldr q8, [sp, #432]
0xb9c900123f8   a38  4ea91d23       mov v3.16b, v9.16b
0xb9c900123fc   a3c  fd40d7e9       ldr d9, [sp, #424]
0xb9c90012400   a40  aa0903f7       mov x23, x9
0xb9c90012404   a44  aa0803e9       mov x9, x8
0xb9c90012408   a48  f9403be6       ldr x6, [sp, #112]
0xb9c9001240c   a4c  aa0c03f5       mov x21, x12
0xb9c90012410   a50  f94027ec       ldr x12, [sp, #72]
0xb9c90012414   a54  f94013e8       ldr x8, [sp, #32]
0xb9c90012418   a58  4eac1d81       mov v1.16b, v12.16b
0xb9c9001241c   a5c  4eab1d60       mov v0.16b, v11.16b
0xb9c90012420   a60  4ea51ca2       mov v2.16b, v5.16b
0xb9c90012424   a64  f94037f6       ldr x22, [sp, #104]
0xb9c90012428   a68  f94023ef       ldr x15, [sp, #64]
0xb9c9001242c   a6c  f9400fee       ldr x14, [sp, #24]
0xb9c90012430   a70  3dc043e4       ldr q4, [sp, #256]
0xb9c90012434   a74  3dc03fe5       ldr q5, [sp, #240]
0xb9c90012438   a78  f94007f3       ldr x19, [sp, #8]
0xb9c9001243c   a7c  f9400bed       ldr x13, [sp, #16]
0xb9c90012440   a80  aa0b03f9       mov x25, x11
0xb9c90012444   a84  f8520341       ldur x1, [x26, #-224]
0xb9c90012448   a88  f94143e4       ldr x4, [sp, #640]
0xb9c9001244c   a8c  2f00e40a       movi d10, #0x0
0xb9c90012450   a90  1e2e100b       fmov s11, #0x70 (1.0000)
0xb9c90012454   a94  3dc04fec       ldr q12, [sp, #304]
0xb9c90012458   a98  3dc04bee       ldr q14, [sp, #288]
0xb9c9001245c   a9c  3dc047ed       ldr q13, [sp, #272]
0xb9c90012460   aa0  f94073fb       ldr cp, [sp, #224]
0xb9c90012464   aa4  f9406fe0       ldr x0, [sp, #216]
0xb9c90012468   aa8  f9406bfc       ldr x28, [sp, #208]
0xb9c9001246c   aac  f94067f8       ldr x24, [sp, #200]
0xb9c90012470   ab0  f90137e9       str x9, [sp, #616]
0xb9c90012474   ab4  fd00e7e6       str d6, [sp, #456]
0xb9c90012478   ab8  fd00e3e7       str d7, [sp, #448]
0xb9c9001247c   abc  3d806fe8       str q8, [sp, #432]
0xb9c90012480   ac0  fd00d7e9       str d9, [sp, #424]
0xb9c90012484   ac4  eb2163ff       cmp sp, x1
0xb9c90012488   ac8  54009249       b.ls #+0x1248 (addr 0xb9c900136d0)
0xb9c9001248c   acc  1b097cc1       mul w1, w6, w9
0xb9c90012490   ad0  0b0c0022       add w2, w1, w12
0xb9c90012494   ad4  6b0202df       cmp w22, w2
0xb9c90012498   ad8  54000129       b.ls #+0x24 (addr 0xb9c900124bc)
0xb9c9001249c   adc  0b010101       add w1, w8, w1
0xb9c900124a0   ae0  6b0102df       cmp w22, w1
0xb9c900124a4   ae4  540000c9       b.ls #+0x18 (addr 0xb9c900124bc)
0xb9c900124a8   ae8  0b0109e1       add w1, w15, w1, lsl #2
0xb9c900124ac   aec  b8616aa1       ldr w1, [x21, x1]
0xb9c900124b0   af0  0b0209e2       add w2, w15, w2, lsl #2
0xb9c900124b4   af4  b8626aa2       ldr w2, [x21, x2]
0xb9c900124b8   af8  14000003       b #+0xc (addr 0xb9c900124c4)
0xb9c900124bc   afc  aa1703e1       mov x1, x23
0xb9c900124c0   b00  aa1703e2       mov x2, x23
0xb9c900124c4   b04  531e7443       lsl w3, w2, #2
0xb9c900124c8   b08  0b030305       add w5, w24, w3
0xb9c900124cc   b0c  4b020027       sub w7, w1, w2
0xb9c900124d0   b10  6b01033f       cmp w25, w1
0xb9c900124d4   b14  9a9f27e6       cset x6, lo
0xb9c900124d8   b18  6b02003f       cmp w1, w2
0xb9c900124dc   b1c  9a9f27e8       cset x8, lo
0xb9c900124e0   b20  2a0800c9       orr w9, w6, w8
0xb9c900124e4   b24  6a09013f       tst w9, w9
0xb9c900124e8   b28  1a8713e9       csel w9, wzr, w7, ne
0xb9c900124ec   b2c  f90077e1       str x1, [sp, #232]
0xb9c900124f0   b30  f900b7e9       str x9, [sp, #360]
0xb9c900124f4   b34  6b02003f       cmp w1, w2
0xb9c900124f8   b38  54000523       b.lo #+0xa4 (addr 0xb9c9001259c)
0xb9c900124fc   b3c  0b030362       add w2, w27, w3
0xb9c90012500   b40  d280008a       movz x10, #0x4
0xb9c90012504   b44  6b0101df       cmp w14, w1
0xb9c90012508   b48  1a82314b       csel w11, w10, w2, lo
0xb9c9001250c   b4c  6b0101df       cmp w14, w1
0xb9c90012510   b50  1a8732e2       csel w2, w23, w7, lo
0xb9c90012514   b54  121d644c       and w12, w2, #0x1ffffff8
0xb9c90012518   b58  0b0c096c       add w12, w11, w12, lsl #2
0xb9c9001251c   b5c  0b03038e       add w14, w28, w3
0xb9c90012520   b60  6b01027f       cmp w19, w1
0xb9c90012524   b64  1a8e314f       csel w15, w10, w14, lo
0xb9c90012528   b68  6b01027f       cmp w19, w1
0xb9c9001252c   b6c  1a8732ee       csel w14, w23, w7, lo
0xb9c90012530   b70  121d65d3       and w19, w14, #0x1ffffff8
0xb9c90012534   b74  0b1309f3       add w19, w15, w19, lsl #2
0xb9c90012538   b78  53037c54       lsr w20, w2, #3
0xb9c9001253c   b7c  12000842       and w2, w2, #0x7
0xb9c90012540   b80  53037dd5       lsr w21, w14, #3
0xb9c90012544   b84  120009ce       and w14, w14, #0x7
0xb9c90012548   b88  6b0101bf       cmp w13, w1
0xb9c9001254c   b8c  54000183       b.lo #+0x30 (addr 0xb9c9001257c)
0xb9c90012550   b90  0b030003       add w3, w0, w3
0xb9c90012554   b94  aa0b03f0       mov x16, x11
0xb9c90012558   b98  aa0303eb       mov x11, x3
0xb9c9001255c   b9c  aa1403e3       mov x3, x20
0xb9c90012560   ba0  aa1003f4       mov x20, x16
0xb9c90012564   ba4  aa0e03f0       mov x16, x14
0xb9c90012568   ba8  aa0703ee       mov x14, x7
0xb9c9001256c   bac  aa1503e7       mov x7, x21
0xb9c90012570   bb0  aa0f03f5       mov x21, x15
0xb9c90012574   bb4  aa1003ef       mov x15, x16
0xb9c90012578   bb8  14000014       b #+0x50 (addr 0xb9c900125c8)
0xb9c9001257c   bbc  aa1403e3       mov x3, x20
0xb9c90012580   bc0  aa0b03f4       mov x20, x11
0xb9c90012584   bc4  aa0a03eb       mov x11, x10
0xb9c90012588   bc8  aa1503e7       mov x7, x21
0xb9c9001258c   bcc  aa0f03f5       mov x21, x15
0xb9c90012590   bd0  aa0e03ef       mov x15, x14
0xb9c90012594   bd4  aa1703ee       mov x14, x23
0xb9c90012598   bd8  1400000c       b #+0x30 (addr 0xb9c900125c8)
0xb9c9001259c   bdc  d280008a       movz x10, #0x4
0xb9c900125a0   be0  aa1703ee       mov x14, x23
0xb9c900125a4   be4  aa1703ef       mov x15, x23
0xb9c900125a8   be8  aa1703e3       mov x3, x23
0xb9c900125ac   bec  aa1703e2       mov x2, x23
0xb9c900125b0   bf0  aa1703e7       mov x7, x23
0xb9c900125b4   bf4  aa0a03eb       mov x11, x10
0xb9c900125b8   bf8  aa0a03ec       mov x12, x10
0xb9c900125bc   bfc  aa0a03f3       mov x19, x10
0xb9c900125c0   c00  aa0a03f4       mov x20, x10
0xb9c900125c4   c04  aa0a03f5       mov x21, x10
0xb9c900125c8   c08  2a0800c6       orr w6, w6, w8
0xb9c900125cc   c0c  6a0600df       tst w6, w6
0xb9c900125d0   c10  1a851146       csel w6, w10, w5, ne
0xb9c900125d4   c14  12000928       and w8, w9, #0x7
0xb9c900125d8   c18  53037dca       lsr w10, w14, #3
0xb9c900125dc   c1c  53037d25       lsr w5, w9, #3
0xb9c900125e0   c20  f900bbe6       str x6, [sp, #368]
0xb9c900125e4   c24  6b0500ff       cmp w7, w5
0xb9c900125e8   c28  1a8530e6       csel w6, w7, w5, lo
0xb9c900125ec   c2c  6b06007f       cmp w3, w6
0xb9c900125f0   c30  1a863065       csel w5, w3, w6, lo
0xb9c900125f4   c34  6b05015f       cmp w10, w5
0xb9c900125f8   c38  1a853146       csel w6, w10, w5, lo
0xb9c900125fc   c3c  f900d3ec       str x12, [sp, #416]
0xb9c90012600   c40  f900bff3       str x19, [sp, #376]
0xb9c90012604   c44  f900b3eb       str x11, [sp, #352]
0xb9c90012608   c48  f900afee       str x14, [sp, #344]
0xb9c9001260c   c4c  f900abe2       str x2, [sp, #336]
0xb9c90012610   c50  f900a7ef       str x15, [sp, #328]
0xb9c90012614   c54  f900a3e8       str x8, [sp, #320]
0xb9c90012618   c58  34000ce6       cbz w6, #+0x19c (addr 0xb9c900127b4)
0xb9c9001261c   c5c  f940bbe3       ldr x3, [sp, #368]
0xb9c90012620   c60  aa0b03ea       mov x10, x11
0xb9c90012624   c64  14000005       b #+0x14 (addr 0xb9c90012638)
0xb9c90012628   c68  fd40c3e2       ldr d2, [sp, #384]
0xb9c9001262c   c6c  fd40c7e3       ldr d3, [sp, #392]
0xb9c90012630   c70  fd40cbe0       ldr d0, [sp, #400]
0xb9c90012634   c74  fd40cfe1       ldr d1, [sp, #408]
0xb9c90012638   c78  f9005be6       str x6, [sp, #176]
0xb9c9001263c   c7c  f90057ea       str x10, [sp, #168]
0xb9c90012640   c80  f90053f4       str x20, [sp, #160]
0xb9c90012644   c84  f9004ff5       str x21, [sp, #152]
0xb9c90012648   c88  f9004be3       str x3, [sp, #144]
0xb9c9001264c   c8c  f9414be7       ldr x7, [sp, #656]
0xb9c90012650   c90  f94117e0       ldr x0, [sp, #552]
0xb9c90012654   c94  aa0303e2       mov x2, x3
0xb9c90012658   c98  aa1503e3       mov x3, x21
0xb9c9001265c   c9c  aa1403e4       mov x4, x20
0xb9c90012660   ca0  aa0a03e5       mov x5, x10
0xb9c90012664   ca4  97fc0c0f       bl #-0xfcfc4 (addr 0xb9c8ff156a0)
0xb9c90012668   ca8  f9404be3       ldr x3, [sp, #144]
0xb9c9001266c   cac  11008062       add w2, w3, #0x20 (32)
0xb9c90012670   cb0  f9404fef       ldr x15, [sp, #152]
0xb9c90012674   cb4  110081e3       add w3, w15, #0x20 (32)
0xb9c90012678   cb8  f94053eb       ldr x11, [sp, #160]
0xb9c9001267c   cbc  11008164       add w4, w11, #0x20 (32)
0xb9c90012680   cc0  f94057ea       ldr x10, [sp, #168]
0xb9c90012684   cc4  11008145       add w5, w10, #0x20 (32)
0xb9c90012688   cc8  f9405be6       ldr x6, [sp, #176]
0xb9c9001268c   ccc  510004c6       sub w6, w6, #0x1 (1)
0xb9c90012690   cd0  f9004be2       str x2, [sp, #144]
0xb9c90012694   cd4  f9004fe3       str x3, [sp, #152]
0xb9c90012698   cd8  f90053e4       str x4, [sp, #160]
0xb9c9001269c   cdc  f90057e5       str x5, [sp, #168]
0xb9c900126a0   ce0  f9005be6       str x6, [sp, #176]
0xb9c900126a4   ce4  34000886       cbz w6, #+0x110 (addr 0xb9c900127b4)
0xb9c900126a8   ce8  f9414be7       ldr x7, [sp, #656]
0xb9c900126ac   cec  f94117e0       ldr x0, [sp, #552]
0xb9c900126b0   cf0  fd40cbe0       ldr d0, [sp, #400]
0xb9c900126b4   cf4  fd40cfe1       ldr d1, [sp, #408]
0xb9c900126b8   cf8  fd40c3e2       ldr d2, [sp, #384]
0xb9c900126bc   cfc  fd40c7e3       ldr d3, [sp, #392]
0xb9c900126c0   d00  97fc0bf8       bl #-0xfd020 (addr 0xb9c8ff156a0)
0xb9c900126c4   d04  f9404be6       ldr x6, [sp, #144]
0xb9c900126c8   d08  110080c2       add w2, w6, #0x20 (32)
0xb9c900126cc   d0c  f9404fe6       ldr x6, [sp, #152]
0xb9c900126d0   d10  110080c3       add w3, w6, #0x20 (32)
0xb9c900126d4   d14  f94053e6       ldr x6, [sp, #160]
0xb9c900126d8   d18  110080c4       add w4, w6, #0x20 (32)
0xb9c900126dc   d1c  f94057e6       ldr x6, [sp, #168]
0xb9c900126e0   d20  110080c5       add w5, w6, #0x20 (32)
0xb9c900126e4   d24  f9405be6       ldr x6, [sp, #176]
0xb9c900126e8   d28  510004c6       sub w6, w6, #0x1 (1)
0xb9c900126ec   d2c  f9004be2       str x2, [sp, #144]
0xb9c900126f0   d30  f9004fe3       str x3, [sp, #152]
0xb9c900126f4   d34  f90053e4       str x4, [sp, #160]
0xb9c900126f8   d38  f90057e5       str x5, [sp, #168]
0xb9c900126fc   d3c  f9005be6       str x6, [sp, #176]
0xb9c90012700   d40  340005a6       cbz w6, #+0xb4 (addr 0xb9c900127b4)
0xb9c90012704   d44  f9414be7       ldr x7, [sp, #656]
0xb9c90012708   d48  f94117e0       ldr x0, [sp, #552]
0xb9c9001270c   d4c  fd40cbe0       ldr d0, [sp, #400]
0xb9c90012710   d50  fd40cfe1       ldr d1, [sp, #408]
0xb9c90012714   d54  fd40c3e2       ldr d2, [sp, #384]
0xb9c90012718   d58  fd40c7e3       ldr d3, [sp, #392]
0xb9c9001271c   d5c  97fc0be1       bl #-0xfd07c (addr 0xb9c8ff156a0)
0xb9c90012720   d60  f9404be6       ldr x6, [sp, #144]
0xb9c90012724   d64  110080c2       add w2, w6, #0x20 (32)
0xb9c90012728   d68  f9404fe6       ldr x6, [sp, #152]
0xb9c9001272c   d6c  110080c3       add w3, w6, #0x20 (32)
0xb9c90012730   d70  f94053e6       ldr x6, [sp, #160]
0xb9c90012734   d74  110080c4       add w4, w6, #0x20 (32)
0xb9c90012738   d78  f94057e6       ldr x6, [sp, #168]
0xb9c9001273c   d7c  110080c5       add w5, w6, #0x20 (32)
0xb9c90012740   d80  f9405be6       ldr x6, [sp, #176]
0xb9c90012744   d84  510004c6       sub w6, w6, #0x1 (1)
0xb9c90012748   d88  f9004be2       str x2, [sp, #144]
0xb9c9001274c   d8c  f9004fe3       str x3, [sp, #152]
0xb9c90012750   d90  f90053e4       str x4, [sp, #160]
0xb9c90012754   d94  f90057e5       str x5, [sp, #168]
0xb9c90012758   d98  f9005be6       str x6, [sp, #176]
0xb9c9001275c   d9c  340002c6       cbz w6, #+0x58 (addr 0xb9c900127b4)
0xb9c90012760   da0  f8520348       ldur x8, [x26, #-224]
0xb9c90012764   da4  eb2863ff       cmp sp, x8
0xb9c90012768   da8  54007f89       b.ls #+0xff0 (addr 0xb9c90013758)
0xb9c9001276c   dac  f9414be7       ldr x7, [sp, #656]
0xb9c90012770   db0  f94117e0       ldr x0, [sp, #552]
0xb9c90012774   db4  fd40cbe0       ldr d0, [sp, #400]
0xb9c90012778   db8  fd40cfe1       ldr d1, [sp, #408]
0xb9c9001277c   dbc  fd40c3e2       ldr d2, [sp, #384]
0xb9c90012780   dc0  fd40c7e3       ldr d3, [sp, #392]
0xb9c90012784   dc4  97fc0bc7       bl #-0xfd0e4 (addr 0xb9c8ff156a0)
0xb9c90012788   dc8  f9404be6       ldr x6, [sp, #144]
0xb9c9001278c   dcc  110080c3       add w3, w6, #0x20 (32)
0xb9c90012790   dd0  f9404fe6       ldr x6, [sp, #152]
0xb9c90012794   dd4  110080d5       add w21, w6, #0x20 (32)
0xb9c90012798   dd8  f94053e6       ldr x6, [sp, #160]
0xb9c9001279c   ddc  110080d4       add w20, w6, #0x20 (32)
0xb9c900127a0   de0  f94057e6       ldr x6, [sp, #168]
0xb9c900127a4   de4  110080ca       add w10, w6, #0x20 (32)
0xb9c900127a8   de8  f9405be6       ldr x6, [sp, #176]
0xb9c900127ac   dec  510004c6       sub w6, w6, #0x1 (1)
0xb9c900127b0   df0  35fff3c6       cbnz w6, #-0x188 (addr 0xb9c90012628)
0xb9c900127b4   df4  f940a3e6       ldr x6, [sp, #320]
0xb9c900127b8   df8  35000086       cbnz w6, #+0x10 (addr 0xb9c900127c8)
0xb9c900127bc   dfc  f9405feb       ldr x11, [sp, #184]
0xb9c900127c0   e00  d2800009       movz x9, #0x0
0xb9c900127c4   e04  140000e5       b #+0x394 (addr 0xb9c90012b58)
0xb9c900127c8   e08  f94077e1       ldr x1, [sp, #232]
0xb9c900127cc   e0c  51002028       sub w8, w1, #0x8 (8)
0xb9c900127d0   e10  d2800009       movz x9, #0x0
0xb9c900127d4   e14  6b08003f       cmp w1, w8
0xb9c900127d8   e18  1a88312a       csel w10, w9, w8, lo
0xb9c900127dc   e1c  11002148       add w8, w10, #0x8 (8)
0xb9c900127e0   e20  f9405feb       ldr x11, [sp, #184]
0xb9c900127e4   e24  6b08017f       cmp w11, w8
0xb9c900127e8   e28  54001b83       b.lo #+0x370 (addr 0xb9c90012b58)
0xb9c900127ec   e2c  f94063ec       ldr x12, [sp, #192]
0xb9c900127f0   e30  6b08019f       cmp w12, w8
0xb9c900127f4   e34  54001b23       b.lo #+0x364 (addr 0xb9c90012b58)
0xb9c900127f8   e38  531e7548       lsl w8, w10, #2
0xb9c900127fc   e3c  f94067ed       ldr x13, [sp, #200]
0xb9c90012800   e40  0b0801ae       add w14, w13, w8
0xb9c90012804   e44  f9406bef       ldr x15, [sp, #208]
0xb9c90012808   e48  0b0801f3       add w19, w15, w8
0xb9c9001280c   e4c  f9406ff4       ldr x20, [sp, #216]
0xb9c90012810   e50  0b080295       add w21, w20, w8
0xb9c90012814   e54  f94073f6       ldr x22, [sp, #224]
0xb9c90012818   e58  0b0802c8       add w8, w22, w8
0xb9c9001281c   e5c  4b0a002a       sub w10, w1, w10
0xb9c90012820   e60  7100215f       cmp w10, #0x8 (8)
0xb9c90012824   e64  54000720       b.eq #+0xe4 (addr 0xb9c90012908)
0xb9c90012828   e68  2f00e404       movi d4, #0x0
0xb9c9001282c   e6c  1e2e1005       fmov s5, #0x70 (1.0000)
0xb9c90012830   e70  6b06015f       cmp w10, w6
0xb9c90012834   e74  1e240ca6       fcsel s6, s5, s4, eq
0xb9c90012838   e78  f94143e4       ldr x4, [sp, #640]
0xb9c9001283c   e7c  91048097       add x23, x4, #0x120 (288)
0xb9c90012840   e80  f94133f8       ldr x24, [sp, #608]
0xb9c90012844   e84  bc376b06       str s6, [x24, x23]
0xb9c90012848   e88  4b060146       sub w6, w10, w6
0xb9c9001284c   e8c  d28000f7       movz x23, #0x7
0xb9c90012850   e90  6b0a02ff       cmp w23, w10
0xb9c90012854   e94  7a4838c2       ccmp w6, #8, #nzCv, lo
0xb9c90012858   e98  9a9f27f7       cset x23, lo
0xb9c9001285c   e9c  1e2302e7       ucvtf s7, w23
0xb9c90012860   ea0  9104f097       add x23, x4, #0x13c (316)
0xb9c90012864   ea4  bc376b07       str s7, [x24, x23]
0xb9c90012868   ea8  d28000d7       movz x23, #0x6
0xb9c9001286c   eac  6b0a02ff       cmp w23, w10
0xb9c90012870   eb0  7a4738c2       ccmp w6, #7, #nzCv, lo
0xb9c90012874   eb4  9a9f27f7       cset x23, lo
0xb9c90012878   eb8  1e2302e7       ucvtf s7, w23
0xb9c9001287c   ebc  9104e097       add x23, x4, #0x138 (312)
0xb9c90012880   ec0  bc376b07       str s7, [x24, x23]
0xb9c90012884   ec4  d28000b7       movz x23, #0x5
0xb9c90012888   ec8  6b0a02ff       cmp w23, w10
0xb9c9001288c   ecc  7a4638c2       ccmp w6, #6, #nzCv, lo
0xb9c90012890   ed0  9a9f27f7       cset x23, lo
0xb9c90012894   ed4  1e2302e7       ucvtf s7, w23
0xb9c90012898   ed8  9104d097       add x23, x4, #0x134 (308)
0xb9c9001289c   edc  bc376b07       str s7, [x24, x23]
0xb9c900128a0   ee0  4e040d47       dup v7.4s, w10
0xb9c900128a4   ee4  d2800030       movz x16, #0x1
0xb9c900128a8   ee8  f2c00050       movk x16, #0x2, lsl #32
0xb9c900128ac   eec  9e670208       fmov d8, x16
0xb9c900128b0   ef0  d2800070       movz x16, #0x3
0xb9c900128b4   ef4  f2c00090       movk x16, #0x4, lsl #32
0xb9c900128b8   ef8  4e181e08       mov v8.d[1], x16
0xb9c900128bc   efc  6ea834e7       cmhi v7.4s, v7.4s, v8.4s
0xb9c900128c0   f00  4e040cc8       dup v8.4s, w6
0xb9c900128c4   f04  d2800050       movz x16, #0x2
0xb9c900128c8   f08  f2c00070       movk x16, #0x3, lsl #32
0xb9c900128cc   f0c  9e670209       fmov d9, x16
0xb9c900128d0   f10  d2800090       movz x16, #0x4
0xb9c900128d4   f14  f2c000b0       movk x16, #0x5, lsl #32
0xb9c900128d8   f18  4e181e09       mov v9.d[1], x16
0xb9c900128dc   f1c  6ea83528       cmhi v8.4s, v9.4s, v8.4s
0xb9c900128e0   f20  4e281ce7       and v7.16b, v7.16b, v8.16b
0xb9c900128e4   f24  3dc04fe8       ldr q8, [sp, #304]
0xb9c900128e8   f28  4e281ce7       and v7.16b, v7.16b, v8.16b
0xb9c900128ec   f2c  4e21d8e7       scvtf v7.4s, v7.4s
0xb9c900128f0   f30  91049086       add x6, x4, #0x124 (292)
0xb9c900128f4   f34  3ca66b07       str q7, [x24, x6]
0xb9c900128f8   f38  5e0404e7       mov s7, v7.s[0]
0xb9c900128fc   f3c  11048086       add w6, w4, #0x120 (288)
0xb9c90012900   f40  aa0603ea       mov x10, x6
0xb9c90012904   f44  14000012       b #+0x48 (addr 0xb9c9001294c)
0xb9c90012908   f48  531e74c6       lsl w6, w6, #2
0xb9c9001290c   f4c  d286df0a       movz x10, #0x36f8
0xb9c90012910   f50  f2a002ca       movk x10, #0x16, lsl #16
0xb9c90012914   f54  0b0a00ca       add w10, w6, w10
0xb9c90012918   f58  d286df97       movz x23, #0x36fc
0xb9c9001291c   f5c  f2a002d7       movk x23, #0x16, lsl #16
0xb9c90012920   f60  8b1700d7       add x23, x6, x23
0xb9c90012924   f64  f94133f8       ldr x24, [sp, #608]
0xb9c90012928   f68  bc776b07       ldr s7, [x24, x23]
0xb9c9001292c   f6c  d286df17       movz x23, #0x36f8
0xb9c90012930   f70  f2a002d7       movk x23, #0x16, lsl #16
0xb9c90012934   f74  8b1700c6       add x6, x6, x23
0xb9c90012938   f78  bc666b06       ldr s6, [x24, x6]
0xb9c9001293c   f7c  3dc04fe8       ldr q8, [sp, #304]
0xb9c90012940   f80  1e2e1005       fmov s5, #0x70 (1.0000)
0xb9c90012944   f84  2f00e404       movi d4, #0x0
0xb9c90012948   f88  f94143e4       ldr x4, [sp, #640]
0xb9c9001294c   f8c  91038086       add x6, x4, #0xe0 (224)
0xb9c90012950   f90  3ce66b09       ldr q9, [x24, x6]
0xb9c90012954   f94  3cee6b0a       ldr q10, [x24, x14]
0xb9c90012958   f98  3dc03feb       ldr q11, [sp, #240]
0xb9c9001295c   f9c  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0xb9c90012960   fa0  4e0404c6       dup v6.4s, v6.s[0]
0xb9c90012964   fa4  6e0c04e6       mov v6.s[1], v7.s[0]
0xb9c90012968   fa8  91002317       add x23, x24, #0x8 (8)
0xb9c9001296c   fac  fc6a6ae7       ldr d7, [x23, x10]
0xb9c90012970   fb0  4ec718c6       uzp1 v6.2d, v6.2d, v7.2d
0xb9c90012974   fb4  6e2cdd87       fmul v7.4s, v12.4s, v12.4s
0xb9c90012978   fb8  3cf36b0d       ldr q13, [x24, x19]
0xb9c9001297c   fbc  3dc043ee       ldr q14, [sp, #256]
0xb9c90012980   fc0  4eadd5d0       fsub v16.4s, v14.4s, v13.4s
0xb9c90012984   fc4  6e30de11       fmul v17.4s, v16.4s, v16.4s
0xb9c90012988   fc8  4e31d4e7       fadd v7.4s, v7.4s, v17.4s
0xb9c9001298c   fcc  3dc047f1       ldr q17, [sp, #272]
0xb9c90012990   fd0  6ea7e632       fcmgt v18.4s, v17.4s, v7.4s
0xb9c90012994   fd4  4e281e52       and v18.16b, v18.16b, v8.16b
0xb9c90012998   fd8  4e21da52       scvtf v18.4s, v18.4s
0xb9c9001299c   fdc  6e32dcd2       fmul v18.4s, v6.4s, v18.4s
0xb9c900129a0   fe0  6e32dd8c       fmul v12.4s, v12.4s, v18.4s
0xb9c900129a4   fe4  4e2cd529       fadd v9.4s, v9.4s, v12.4s
0xb9c900129a8   fe8  3ca66b09       str q9, [x24, x6]
0xb9c900129ac   fec  91040086       add x6, x4, #0x100 (256)
0xb9c900129b0   ff0  3ce66b09       ldr q9, [x24, x6]
0xb9c900129b4   ff4  6e32de0c       fmul v12.4s, v16.4s, v18.4s
0xb9c900129b8   ff8  4e2cd529       fadd v9.4s, v9.4s, v12.4s
0xb9c900129bc   ffc  3ca66b09       str q9, [x24, x6]
0xb9c900129c0  1000  6e31e4e9       fcmge v9.4s, v7.4s, v17.4s
0xb9c900129c4  1004  3dc04bec       ldr q12, [sp, #288]
0xb9c900129c8  1008  6ea7e590       fcmgt v16.4s, v12.4s, v7.4s
0xb9c900129cc  100c  4e301d29       and v9.16b, v9.16b, v16.16b
0xb9c900129d0  1010  4ea0c8e7       fcmgt v7.4s, v7.4s, #0.0
0xb9c900129d4  1014  4e281ce7       and v7.16b, v7.16b, v8.16b
0xb9c900129d8  1018  4e21d8e7       scvtf v7.4s, v7.4s
0xb9c900129dc  101c  4e271d27       and v7.16b, v9.16b, v7.16b
0xb9c900129e0  1020  6e27dcc6       fmul v6.4s, v6.4s, v7.4s
0xb9c900129e4  1024  91030086       add x6, x4, #0xc0 (192)
0xb9c900129e8  1028  3ce66b07       ldr q7, [x24, x6]
0xb9c900129ec  102c  4e27d4c7       fadd v7.4s, v6.4s, v7.4s
0xb9c900129f0  1030  3ca66b07       str q7, [x24, x6]
0xb9c900129f4  1034  91010086       add x6, x4, #0x40 (64)
0xb9c900129f8  1038  3ce66b07       ldr q7, [x24, x6]
0xb9c900129fc  103c  6e26dd49       fmul v9.4s, v10.4s, v6.4s
0xb9c90012a00  1040  4e29d4e7       fadd v7.4s, v7.4s, v9.4s
0xb9c90012a04  1044  3ca66b07       str q7, [x24, x6]
0xb9c90012a08  1048  6e26dda7       fmul v7.4s, v13.4s, v6.4s
0xb9c90012a0c  104c  91018086       add x6, x4, #0x60 (96)
0xb9c90012a10  1050  3ce66b09       ldr q9, [x24, x6]
0xb9c90012a14  1054  4e29d4e7       fadd v7.4s, v7.4s, v9.4s
0xb9c90012a18  1058  3ca66b07       str q7, [x24, x6]
0xb9c90012a1c  105c  3ce86b07       ldr q7, [x24, x8]
0xb9c90012a20  1060  6e26dce7       fmul v7.4s, v7.4s, v6.4s
0xb9c90012a24  1064  91020086       add x6, x4, #0x80 (128)
0xb9c90012a28  1068  3ce66b09       ldr q9, [x24, x6]
0xb9c90012a2c  106c  4e29d4e7       fadd v7.4s, v7.4s, v9.4s
0xb9c90012a30  1070  3ca66b07       str q7, [x24, x6]
0xb9c90012a34  1074  3cf56b07       ldr q7, [x24, x21]
0xb9c90012a38  1078  6e26dce6       fmul v6.4s, v7.4s, v6.4s
0xb9c90012a3c  107c  91028086       add x6, x4, #0xa0 (160)
0xb9c90012a40  1080  3ce66b07       ldr q7, [x24, x6]
0xb9c90012a44  1084  4e27d4c6       fadd v6.4s, v6.4s, v7.4s
0xb9c90012a48  1088  3ca66b06       str q6, [x24, x6]
0xb9c90012a4c  108c  9103c086       add x6, x4, #0xf0 (240)
0xb9c90012a50  1090  3ce66b06       ldr q6, [x24, x6]
0xb9c90012a54  1094  910041ce       add x14, x14, #0x10 (16)
0xb9c90012a58  1098  3cee6b07       ldr q7, [x24, x14]
0xb9c90012a5c  109c  4ea7d569       fsub v9.4s, v11.4s, v7.4s
0xb9c90012a60  10a0  9100414a       add x10, x10, #0x10 (16)
0xb9c90012a64  10a4  3cea6b0a       ldr q10, [x24, x10]
0xb9c90012a68  10a8  6e29dd2d       fmul v13.4s, v9.4s, v9.4s
0xb9c90012a6c  10ac  9100426a       add x10, x19, #0x10 (16)
0xb9c90012a70  10b0  3cea6b10       ldr q16, [x24, x10]
0xb9c90012a74  10b4  4eb0d5d2       fsub v18.4s, v14.4s, v16.4s
0xb9c90012a78  10b8  6e32de53       fmul v19.4s, v18.4s, v18.4s
0xb9c90012a7c  10bc  4e33d5ad       fadd v13.4s, v13.4s, v19.4s
0xb9c90012a80  10c0  6eade633       fcmgt v19.4s, v17.4s, v13.4s
0xb9c90012a84  10c4  4e281e73       and v19.16b, v19.16b, v8.16b
0xb9c90012a88  10c8  4e21da73       scvtf v19.4s, v19.4s
0xb9c90012a8c  10cc  6e33dd53       fmul v19.4s, v10.4s, v19.4s
0xb9c90012a90  10d0  6e33dd29       fmul v9.4s, v9.4s, v19.4s
0xb9c90012a94  10d4  4e29d4c6       fadd v6.4s, v6.4s, v9.4s
0xb9c90012a98  10d8  3ca66b06       str q6, [x24, x6]
0xb9c90012a9c  10dc  91044086       add x6, x4, #0x110 (272)
0xb9c90012aa0  10e0  3ce66b06       ldr q6, [x24, x6]
0xb9c90012aa4  10e4  6e33de49       fmul v9.4s, v18.4s, v19.4s
0xb9c90012aa8  10e8  4e29d4c6       fadd v6.4s, v6.4s, v9.4s
0xb9c90012aac  10ec  3ca66b06       str q6, [x24, x6]
0xb9c90012ab0  10f0  91014086       add x6, x4, #0x50 (80)
0xb9c90012ab4  10f4  3ce66b06       ldr q6, [x24, x6]
0xb9c90012ab8  10f8  6e31e5a9       fcmge v9.4s, v13.4s, v17.4s
0xb9c90012abc  10fc  6eade592       fcmgt v18.4s, v12.4s, v13.4s
0xb9c90012ac0  1100  4e321d29       and v9.16b, v9.16b, v18.16b
0xb9c90012ac4  1104  4ea0c9ad       fcmgt v13.4s, v13.4s, #0.0
0xb9c90012ac8  1108  4e281dad       and v13.16b, v13.16b, v8.16b
0xb9c90012acc  110c  4e21d9ad       scvtf v13.4s, v13.4s
0xb9c90012ad0  1110  4e2d1d29       and v9.16b, v9.16b, v13.16b
0xb9c90012ad4  1114  6e29dd49       fmul v9.4s, v10.4s, v9.4s
0xb9c90012ad8  1118  6e29dce7       fmul v7.4s, v7.4s, v9.4s
0xb9c90012adc  111c  4e27d4c6       fadd v6.4s, v6.4s, v7.4s
0xb9c90012ae0  1120  3ca66b06       str q6, [x24, x6]
0xb9c90012ae4  1124  6e29de06       fmul v6.4s, v16.4s, v9.4s
0xb9c90012ae8  1128  9101c086       add x6, x4, #0x70 (112)
0xb9c90012aec  112c  3ce66b07       ldr q7, [x24, x6]
0xb9c90012af0  1130  4e27d4c6       fadd v6.4s, v6.4s, v7.4s
0xb9c90012af4  1134  3ca66b06       str q6, [x24, x6]
0xb9c90012af8  1138  91004106       add x6, x8, #0x10 (16)
0xb9c90012afc  113c  3ce66b06       ldr q6, [x24, x6]
0xb9c90012b00  1140  6e29dcc6       fmul v6.4s, v6.4s, v9.4s
0xb9c90012b04  1144  91024086       add x6, x4, #0x90 (144)
0xb9c90012b08  1148  3ce66b07       ldr q7, [x24, x6]
0xb9c90012b0c  114c  4e27d4c6       fadd v6.4s, v6.4s, v7.4s
0xb9c90012b10  1150  3ca66b06       str q6, [x24, x6]
0xb9c90012b14  1154  910042a6       add x6, x21, #0x10 (16)
0xb9c90012b18  1158  3ce66b06       ldr q6, [x24, x6]
0xb9c90012b1c  115c  6e29dcc6       fmul v6.4s, v6.4s, v9.4s
0xb9c90012b20  1160  9102c086       add x6, x4, #0xb0 (176)
0xb9c90012b24  1164  3ce66b07       ldr q7, [x24, x6]
0xb9c90012b28  1168  4e27d4c6       fadd v6.4s, v6.4s, v7.4s
0xb9c90012b2c  116c  3ca66b06       str q6, [x24, x6]
0xb9c90012b30  1170  91034086       add x6, x4, #0xd0 (208)
0xb9c90012b34  1174  3ce66b06       ldr q6, [x24, x6]
0xb9c90012b38  1178  4e26d526       fadd v6.4s, v9.4s, v6.4s
0xb9c90012b3c  117c  3ca66b06       str q6, [x24, x6]
0xb9c90012b40  1180  fd40c3e5       ldr d5, [sp, #384]
0xb9c90012b44  1184  fd40c7e9       ldr d9, [sp, #392]
0xb9c90012b48  1188  fd40cbeb       ldr d11, [sp, #400]
0xb9c90012b4c  118c  fd40cfec       ldr d12, [sp, #408]
0xb9c90012b50  1190  aa1803ec       mov x12, x24
0xb9c90012b54  1194  1400013a       b #+0x4e8 (addr 0xb9c9001303c)
0xb9c90012b58  1198  f940afe7       ldr x7, [sp, #344]
0xb9c90012b5c  119c  120008e8       and w8, w7, #0x7
0xb9c90012b60  11a0  f940a7ee       ldr x14, [sp, #328]
0xb9c90012b64  11a4  6b0601df       cmp w14, w6
0xb9c90012b68  11a8  1a8631ca       csel w10, w14, w6, lo
0xb9c90012b6c  11ac  f940abe2       ldr x2, [sp, #336]
0xb9c90012b70  11b0  6b0a005f       cmp w2, w10
0xb9c90012b74  11b4  1a8a3046       csel w6, w2, w10, lo
0xb9c90012b78  11b8  6b06011f       cmp w8, w6
0xb9c90012b7c  11bc  1a86310a       csel w10, w8, w6, lo
0xb9c90012b80  11c0  350000ea       cbnz w10, #+0x1c (addr 0xb9c90012b9c)
0xb9c90012b84  11c4  fd40c3e5       ldr d5, [sp, #384]
0xb9c90012b88  11c8  fd40c7e9       ldr d9, [sp, #392]
0xb9c90012b8c  11cc  fd40cbeb       ldr d11, [sp, #400]
0xb9c90012b90  11d0  fd40cfec       ldr d12, [sp, #408]
0xb9c90012b94  11d4  f94133ec       ldr x12, [sp, #608]
0xb9c90012b98  11d8  14000129       b #+0x4a4 (addr 0xb9c9001303c)
0xb9c90012b9c  11dc  121d64e6       and w6, w7, #0x1ffffff8
0xb9c90012ba0  11e0  f940b3e3       ldr x3, [sp, #352]
0xb9c90012ba4  11e4  0b060866       add w6, w3, w6, lsl #2
0xb9c90012ba8  11e8  f940b7e8       ldr x8, [sp, #360]
0xb9c90012bac  11ec  121d6508       and w8, w8, #0x1ffffff8
0xb9c90012bb0  11f0  f940bbed       ldr x13, [sp, #368]
0xb9c90012bb4  11f4  0b0809a8       add w8, w13, w8, lsl #2
0xb9c90012bb8  11f8  f94133ec       ldr x12, [sp, #608]
0xb9c90012bbc  11fc  bc686984       ldr s4, [x12, x8]
0xb9c90012bc0  1200  fd40c3e5       ldr d5, [sp, #384]
0xb9c90012bc4  1204  1e2438a6       fsub s6, s5, s4
0xb9c90012bc8  1208  1e2608c7       fmul s7, s6, s6
0xb9c90012bcc  120c  f940bff3       ldr x19, [sp, #376]
0xb9c90012bd0  1210  2a1303ed       mov w13, w19
0xb9c90012bd4  1214  bc6d6988       ldr s8, [x12, x13]
0xb9c90012bd8  1218  fd40c7e9       ldr d9, [sp, #392]
0xb9c90012bdc  121c  1e28392a       fsub s10, s9, s8
0xb9c90012be0  1220  1e2a094b       fmul s11, s10, s10
0xb9c90012be4  1224  1e2b28e7       fadd s7, s7, s11
0xb9c90012be8  1228  fd40cbeb       ldr d11, [sp, #400]
0xb9c90012bec  122c  1e2b20e0       fcmp s7, s11
0xb9c90012bf0  1230  540002c3       b.lo #+0x58 (addr 0xb9c90012c48)
0xb9c90012bf4  1234  fd40cfec       ldr d12, [sp, #408]
0xb9c90012bf8  1238  1e2c20e0       fcmp s7, s12
0xb9c90012bfc  123c  54000342       b.hs #+0x68 (addr 0xb9c90012c64)
0xb9c90012c00  1240  1e2020e8       fcmp s7, #0.0
0xb9c90012c04  1244  5400030d       b.le #+0x60 (addr 0xb9c90012c64)
0xb9c90012c08  1248  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c90012c0c  124c  fd40e7ed       ldr d13, [sp, #456]
0xb9c90012c10  1250  1e2729a6       fadd s6, s13, s7
0xb9c90012c14  1254  4e040484       dup v4.4s, v4.s[0]
0xb9c90012c18  1258  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012c1c  125c  f940d3ee       ldr x14, [sp, #416]
0xb9c90012c20  1260  2a0e03ef       mov w15, w14
0xb9c90012c24  1264  bc6f6988       ldr s8, [x12, x15]
0xb9c90012c28  1268  6e140504       mov v4.s[2], v8.s[0]
0xb9c90012c2c  126c  bc666988       ldr s8, [x12, x6]
0xb9c90012c30  1270  6e1c0504       mov v4.s[3], v8.s[0]
0xb9c90012c34  1274  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012c38  1278  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012c3c  127c  fd00e7e6       str d6, [sp, #456]
0xb9c90012c40  1280  3d806fe4       str q4, [sp, #432]
0xb9c90012c44  1284  14000008       b #+0x20 (addr 0xb9c90012c64)
0xb9c90012c48  1288  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012c4c  128c  1e2a2884       fadd s4, s4, s10
0xb9c90012c50  1290  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012c54  1294  1e2628e7       fadd s7, s7, s6
0xb9c90012c58  1298  fd40cfec       ldr d12, [sp, #408]
0xb9c90012c5c  129c  fd00e3e7       str d7, [sp, #448]
0xb9c90012c60  12a0  fd00d7e4       str d4, [sp, #424]
0xb9c90012c64  12a4  7100055f       cmp w10, #0x1 (1)
0xb9c90012c68  12a8  54001ea0       b.eq #+0x3d4 (addr 0xb9c9001303c)
0xb9c90012c6c  12ac  9100110e       add x14, x8, #0x4 (4)
0xb9c90012c70  12b0  bc6e6984       ldr s4, [x12, x14]
0xb9c90012c74  12b4  1e2438a6       fsub s6, s5, s4
0xb9c90012c78  12b8  1e2608c7       fmul s7, s6, s6
0xb9c90012c7c  12bc  910011ae       add x14, x13, #0x4 (4)
0xb9c90012c80  12c0  bc6e6988       ldr s8, [x12, x14]
0xb9c90012c84  12c4  1e28392a       fsub s10, s9, s8
0xb9c90012c88  12c8  1e2a094d       fmul s13, s10, s10
0xb9c90012c8c  12cc  1e2d28e7       fadd s7, s7, s13
0xb9c90012c90  12d0  1e2b20e0       fcmp s7, s11
0xb9c90012c94  12d4  540002e3       b.lo #+0x5c (addr 0xb9c90012cf0)
0xb9c90012c98  12d8  1e2c20e0       fcmp s7, s12
0xb9c90012c9c  12dc  54000362       b.hs #+0x6c (addr 0xb9c90012d08)
0xb9c90012ca0  12e0  1e2020e8       fcmp s7, #0.0
0xb9c90012ca4  12e4  5400032d       b.le #+0x64 (addr 0xb9c90012d08)
0xb9c90012ca8  12e8  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c90012cac  12ec  fd40e7ed       ldr d13, [sp, #456]
0xb9c90012cb0  12f0  1e2729a6       fadd s6, s13, s7
0xb9c90012cb4  12f4  4e040484       dup v4.4s, v4.s[0]
0xb9c90012cb8  12f8  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012cbc  12fc  f940d3ee       ldr x14, [sp, #416]
0xb9c90012cc0  1300  2a0e03ef       mov w15, w14
0xb9c90012cc4  1304  910011ef       add x15, x15, #0x4 (4)
0xb9c90012cc8  1308  bc6f6988       ldr s8, [x12, x15]
0xb9c90012ccc  130c  6e140504       mov v4.s[2], v8.s[0]
0xb9c90012cd0  1310  910010cf       add x15, x6, #0x4 (4)
0xb9c90012cd4  1314  bc6f6988       ldr s8, [x12, x15]
0xb9c90012cd8  1318  6e1c0504       mov v4.s[3], v8.s[0]
0xb9c90012cdc  131c  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012ce0  1320  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012ce4  1324  fd00e7e6       str d6, [sp, #456]
0xb9c90012ce8  1328  3d806fe4       str q4, [sp, #432]
0xb9c90012cec  132c  14000007       b #+0x1c (addr 0xb9c90012d08)
0xb9c90012cf0  1330  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012cf4  1334  1e2a2884       fadd s4, s4, s10
0xb9c90012cf8  1338  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012cfc  133c  1e2628e7       fadd s7, s7, s6
0xb9c90012d00  1340  fd00d7e4       str d4, [sp, #424]
0xb9c90012d04  1344  fd00e3e7       str d7, [sp, #448]
0xb9c90012d08  1348  7100095f       cmp w10, #0x2 (2)
0xb9c90012d0c  134c  54001980       b.eq #+0x330 (addr 0xb9c9001303c)
0xb9c90012d10  1350  9100210e       add x14, x8, #0x8 (8)
0xb9c90012d14  1354  bc6e6984       ldr s4, [x12, x14]
0xb9c90012d18  1358  1e2438a6       fsub s6, s5, s4
0xb9c90012d1c  135c  1e2608c7       fmul s7, s6, s6
0xb9c90012d20  1360  910021ae       add x14, x13, #0x8 (8)
0xb9c90012d24  1364  bc6e6988       ldr s8, [x12, x14]
0xb9c90012d28  1368  1e28392a       fsub s10, s9, s8
0xb9c90012d2c  136c  1e2a094d       fmul s13, s10, s10
0xb9c90012d30  1370  1e2d28e7       fadd s7, s7, s13
0xb9c90012d34  1374  1e2b20e0       fcmp s7, s11
0xb9c90012d38  1378  540002e3       b.lo #+0x5c (addr 0xb9c90012d94)
0xb9c90012d3c  137c  1e2c20e0       fcmp s7, s12
0xb9c90012d40  1380  54000362       b.hs #+0x6c (addr 0xb9c90012dac)
0xb9c90012d44  1384  1e2020e8       fcmp s7, #0.0
0xb9c90012d48  1388  5400032d       b.le #+0x64 (addr 0xb9c90012dac)
0xb9c90012d4c  138c  1e2e100d       fmov s13, #0x70 (1.0000)
0xb9c90012d50  1390  fd40e7e7       ldr d7, [sp, #456]
0xb9c90012d54  1394  1e2d28e6       fadd s6, s7, s13
0xb9c90012d58  1398  4e040484       dup v4.4s, v4.s[0]
0xb9c90012d5c  139c  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012d60  13a0  f940d3ee       ldr x14, [sp, #416]
0xb9c90012d64  13a4  2a0e03ef       mov w15, w14
0xb9c90012d68  13a8  910021ef       add x15, x15, #0x8 (8)
0xb9c90012d6c  13ac  bc6f6987       ldr s7, [x12, x15]
0xb9c90012d70  13b0  6e1404e4       mov v4.s[2], v7.s[0]
0xb9c90012d74  13b4  910020cf       add x15, x6, #0x8 (8)
0xb9c90012d78  13b8  bc6f6987       ldr s7, [x12, x15]
0xb9c90012d7c  13bc  6e1c04e4       mov v4.s[3], v7.s[0]
0xb9c90012d80  13c0  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012d84  13c4  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012d88  13c8  fd00e7e6       str d6, [sp, #456]
0xb9c90012d8c  13cc  3d806fe4       str q4, [sp, #432]
0xb9c90012d90  13d0  14000007       b #+0x1c (addr 0xb9c90012dac)
0xb9c90012d94  13d4  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012d98  13d8  1e2a2884       fadd s4, s4, s10
0xb9c90012d9c  13dc  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012da0  13e0  1e2628e7       fadd s7, s7, s6
0xb9c90012da4  13e4  fd00d7e4       str d4, [sp, #424]
0xb9c90012da8  13e8  fd00e3e7       str d7, [sp, #448]
0xb9c90012dac  13ec  71000d5f       cmp w10, #0x3 (3)
0xb9c90012db0  13f0  54001460       b.eq #+0x28c (addr 0xb9c9001303c)
0xb9c90012db4  13f4  9100310e       add x14, x8, #0xc (12)
0xb9c90012db8  13f8  bc6e6984       ldr s4, [x12, x14]
0xb9c90012dbc  13fc  1e2438a6       fsub s6, s5, s4
0xb9c90012dc0  1400  1e2608c7       fmul s7, s6, s6
0xb9c90012dc4  1404  910031ae       add x14, x13, #0xc (12)
0xb9c90012dc8  1408  bc6e6988       ldr s8, [x12, x14]
0xb9c90012dcc  140c  1e28392a       fsub s10, s9, s8
0xb9c90012dd0  1410  1e2a094d       fmul s13, s10, s10
0xb9c90012dd4  1414  1e2d28e7       fadd s7, s7, s13
0xb9c90012dd8  1418  1e2b20e0       fcmp s7, s11
0xb9c90012ddc  141c  540002e3       b.lo #+0x5c (addr 0xb9c90012e38)
0xb9c90012de0  1420  1e2c20e0       fcmp s7, s12
0xb9c90012de4  1424  54000362       b.hs #+0x6c (addr 0xb9c90012e50)
0xb9c90012de8  1428  1e2020e8       fcmp s7, #0.0
0xb9c90012dec  142c  5400032d       b.le #+0x64 (addr 0xb9c90012e50)
0xb9c90012df0  1430  1e2e100d       fmov s13, #0x70 (1.0000)
0xb9c90012df4  1434  fd40e7e7       ldr d7, [sp, #456]
0xb9c90012df8  1438  1e2d28e6       fadd s6, s7, s13
0xb9c90012dfc  143c  4e040484       dup v4.4s, v4.s[0]
0xb9c90012e00  1440  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012e04  1444  f940d3ee       ldr x14, [sp, #416]
0xb9c90012e08  1448  2a0e03ef       mov w15, w14
0xb9c90012e0c  144c  910031ef       add x15, x15, #0xc (12)
0xb9c90012e10  1450  bc6f6987       ldr s7, [x12, x15]
0xb9c90012e14  1454  6e1404e4       mov v4.s[2], v7.s[0]
0xb9c90012e18  1458  910030cf       add x15, x6, #0xc (12)
0xb9c90012e1c  145c  bc6f6987       ldr s7, [x12, x15]
0xb9c90012e20  1460  6e1c04e4       mov v4.s[3], v7.s[0]
0xb9c90012e24  1464  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012e28  1468  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012e2c  146c  fd00e7e6       str d6, [sp, #456]
0xb9c90012e30  1470  3d806fe4       str q4, [sp, #432]
0xb9c90012e34  1474  14000007       b #+0x1c (addr 0xb9c90012e50)
0xb9c90012e38  1478  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012e3c  147c  1e2a2884       fadd s4, s4, s10
0xb9c90012e40  1480  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012e44  1484  1e2628e7       fadd s7, s7, s6
0xb9c90012e48  1488  fd00d7e4       str d4, [sp, #424]
0xb9c90012e4c  148c  fd00e3e7       str d7, [sp, #448]
0xb9c90012e50  1490  7100115f       cmp w10, #0x4 (4)
0xb9c90012e54  1494  54000f40       b.eq #+0x1e8 (addr 0xb9c9001303c)
0xb9c90012e58  1498  9100410e       add x14, x8, #0x10 (16)
0xb9c90012e5c  149c  bc6e6984       ldr s4, [x12, x14]
0xb9c90012e60  14a0  1e2438a6       fsub s6, s5, s4
0xb9c90012e64  14a4  1e2608c7       fmul s7, s6, s6
0xb9c90012e68  14a8  910041ae       add x14, x13, #0x10 (16)
0xb9c90012e6c  14ac  bc6e6988       ldr s8, [x12, x14]
0xb9c90012e70  14b0  1e28392a       fsub s10, s9, s8
0xb9c90012e74  14b4  1e2a094d       fmul s13, s10, s10
0xb9c90012e78  14b8  1e2d28e7       fadd s7, s7, s13
0xb9c90012e7c  14bc  1e2b20e0       fcmp s7, s11
0xb9c90012e80  14c0  540002e3       b.lo #+0x5c (addr 0xb9c90012edc)
0xb9c90012e84  14c4  1e2c20e0       fcmp s7, s12
0xb9c90012e88  14c8  54000362       b.hs #+0x6c (addr 0xb9c90012ef4)
0xb9c90012e8c  14cc  1e2020e8       fcmp s7, #0.0
0xb9c90012e90  14d0  5400032d       b.le #+0x64 (addr 0xb9c90012ef4)
0xb9c90012e94  14d4  1e2e100d       fmov s13, #0x70 (1.0000)
0xb9c90012e98  14d8  fd40e7e7       ldr d7, [sp, #456]
0xb9c90012e9c  14dc  1e2d28e6       fadd s6, s7, s13
0xb9c90012ea0  14e0  4e040484       dup v4.4s, v4.s[0]
0xb9c90012ea4  14e4  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012ea8  14e8  f940d3ee       ldr x14, [sp, #416]
0xb9c90012eac  14ec  2a0e03ef       mov w15, w14
0xb9c90012eb0  14f0  910041ef       add x15, x15, #0x10 (16)
0xb9c90012eb4  14f4  bc6f6987       ldr s7, [x12, x15]
0xb9c90012eb8  14f8  6e1404e4       mov v4.s[2], v7.s[0]
0xb9c90012ebc  14fc  910040cf       add x15, x6, #0x10 (16)
0xb9c90012ec0  1500  bc6f6987       ldr s7, [x12, x15]
0xb9c90012ec4  1504  6e1c04e4       mov v4.s[3], v7.s[0]
0xb9c90012ec8  1508  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012ecc  150c  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012ed0  1510  fd00e7e6       str d6, [sp, #456]
0xb9c90012ed4  1514  3d806fe4       str q4, [sp, #432]
0xb9c90012ed8  1518  14000007       b #+0x1c (addr 0xb9c90012ef4)
0xb9c90012edc  151c  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012ee0  1520  1e2a2884       fadd s4, s4, s10
0xb9c90012ee4  1524  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012ee8  1528  1e2628e7       fadd s7, s7, s6
0xb9c90012eec  152c  fd00d7e4       str d4, [sp, #424]
0xb9c90012ef0  1530  fd00e3e7       str d7, [sp, #448]
0xb9c90012ef4  1534  7100155f       cmp w10, #0x5 (5)
0xb9c90012ef8  1538  54000a20       b.eq #+0x144 (addr 0xb9c9001303c)
0xb9c90012efc  153c  9100510e       add x14, x8, #0x14 (20)
0xb9c90012f00  1540  bc6e6984       ldr s4, [x12, x14]
0xb9c90012f04  1544  1e2438a6       fsub s6, s5, s4
0xb9c90012f08  1548  1e2608c7       fmul s7, s6, s6
0xb9c90012f0c  154c  910051ae       add x14, x13, #0x14 (20)
0xb9c90012f10  1550  bc6e6988       ldr s8, [x12, x14]
0xb9c90012f14  1554  1e28392a       fsub s10, s9, s8
0xb9c90012f18  1558  1e2a094d       fmul s13, s10, s10
0xb9c90012f1c  155c  1e2d28e7       fadd s7, s7, s13
0xb9c90012f20  1560  1e2b20e0       fcmp s7, s11
0xb9c90012f24  1564  540002e3       b.lo #+0x5c (addr 0xb9c90012f80)
0xb9c90012f28  1568  1e2c20e0       fcmp s7, s12
0xb9c90012f2c  156c  54000362       b.hs #+0x6c (addr 0xb9c90012f98)
0xb9c90012f30  1570  1e2020e8       fcmp s7, #0.0
0xb9c90012f34  1574  5400032d       b.le #+0x64 (addr 0xb9c90012f98)
0xb9c90012f38  1578  1e2e100d       fmov s13, #0x70 (1.0000)
0xb9c90012f3c  157c  fd40e7e7       ldr d7, [sp, #456]
0xb9c90012f40  1580  1e2d28e6       fadd s6, s7, s13
0xb9c90012f44  1584  4e040484       dup v4.4s, v4.s[0]
0xb9c90012f48  1588  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012f4c  158c  f940d3ee       ldr x14, [sp, #416]
0xb9c90012f50  1590  2a0e03ef       mov w15, w14
0xb9c90012f54  1594  910051ef       add x15, x15, #0x14 (20)
0xb9c90012f58  1598  bc6f6987       ldr s7, [x12, x15]
0xb9c90012f5c  159c  6e1404e4       mov v4.s[2], v7.s[0]
0xb9c90012f60  15a0  910050cf       add x15, x6, #0x14 (20)
0xb9c90012f64  15a4  bc6f6987       ldr s7, [x12, x15]
0xb9c90012f68  15a8  6e1c04e4       mov v4.s[3], v7.s[0]
0xb9c90012f6c  15ac  3dc06fe8       ldr q8, [sp, #432]
0xb9c90012f70  15b0  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90012f74  15b4  fd00e7e6       str d6, [sp, #456]
0xb9c90012f78  15b8  3d806fe4       str q4, [sp, #432]
0xb9c90012f7c  15bc  14000007       b #+0x1c (addr 0xb9c90012f98)
0xb9c90012f80  15c0  fd40d7e4       ldr d4, [sp, #424]
0xb9c90012f84  15c4  1e2a2884       fadd s4, s4, s10
0xb9c90012f88  15c8  fd40e3e7       ldr d7, [sp, #448]
0xb9c90012f8c  15cc  1e2628e7       fadd s7, s7, s6
0xb9c90012f90  15d0  fd00d7e4       str d4, [sp, #424]
0xb9c90012f94  15d4  fd00e3e7       str d7, [sp, #448]
0xb9c90012f98  15d8  7100195f       cmp w10, #0x6 (6)
0xb9c90012f9c  15dc  54000500       b.eq #+0xa0 (addr 0xb9c9001303c)
0xb9c90012fa0  15e0  91006108       add x8, x8, #0x18 (24)
0xb9c90012fa4  15e4  bc686984       ldr s4, [x12, x8]
0xb9c90012fa8  15e8  1e2438a6       fsub s6, s5, s4
0xb9c90012fac  15ec  1e2608c7       fmul s7, s6, s6
0xb9c90012fb0  15f0  910061a8       add x8, x13, #0x18 (24)
0xb9c90012fb4  15f4  bc686988       ldr s8, [x12, x8]
0xb9c90012fb8  15f8  1e28392a       fsub s10, s9, s8
0xb9c90012fbc  15fc  1e2a094d       fmul s13, s10, s10
0xb9c90012fc0  1600  1e2d28e7       fadd s7, s7, s13
0xb9c90012fc4  1604  1e2b20e0       fcmp s7, s11
0xb9c90012fc8  1608  540002e3       b.lo #+0x5c (addr 0xb9c90013024)
0xb9c90012fcc  160c  1e2c20e0       fcmp s7, s12
0xb9c90012fd0  1610  54000362       b.hs #+0x6c (addr 0xb9c9001303c)
0xb9c90012fd4  1614  1e2020e8       fcmp s7, #0.0
0xb9c90012fd8  1618  5400032d       b.le #+0x64 (addr 0xb9c9001303c)
0xb9c90012fdc  161c  1e2e100d       fmov s13, #0x70 (1.0000)
0xb9c90012fe0  1620  fd40e7e7       ldr d7, [sp, #456]
0xb9c90012fe4  1624  1e2d28e6       fadd s6, s7, s13
0xb9c90012fe8  1628  4e040484       dup v4.4s, v4.s[0]
0xb9c90012fec  162c  6e0c0504       mov v4.s[1], v8.s[0]
0xb9c90012ff0  1630  f940d3e8       ldr x8, [sp, #416]
0xb9c90012ff4  1634  2a0803e8       mov w8, w8
0xb9c90012ff8  1638  91006108       add x8, x8, #0x18 (24)
0xb9c90012ffc  163c  bc686987       ldr s7, [x12, x8]
0xb9c90013000  1640  6e1404e4       mov v4.s[2], v7.s[0]
0xb9c90013004  1644  910060c6       add x6, x6, #0x18 (24)
0xb9c90013008  1648  bc666987       ldr s7, [x12, x6]
0xb9c9001300c  164c  6e1c04e4       mov v4.s[3], v7.s[0]
0xb9c90013010  1650  3dc06fe8       ldr q8, [sp, #432]
0xb9c90013014  1654  4e24d504       fadd v4.4s, v8.4s, v4.4s
0xb9c90013018  1658  fd00e7e6       str d6, [sp, #456]
0xb9c9001301c  165c  3d806fe4       str q4, [sp, #432]
0xb9c90013020  1660  14000007       b #+0x1c (addr 0xb9c9001303c)
0xb9c90013024  1664  fd40d7e4       ldr d4, [sp, #424]
0xb9c90013028  1668  1e2a2884       fadd s4, s4, s10
0xb9c9001302c  166c  fd40e3e7       ldr d7, [sp, #448]
0xb9c90013030  1670  1e2628e7       fadd s7, s7, s6
0xb9c90013034  1674  fd00d7e4       str d4, [sp, #424]
0xb9c90013038  1678  fd00e3e7       str d7, [sp, #448]
0xb9c9001303c  167c  f94137e6       ldr x6, [sp, #616]
0xb9c90013040  1680  110004c8       add w8, w6, #0x1 (1)
0xb9c90013044  1684  f940ebea       ldr x10, [sp, #464]
0xb9c90013048  1688  6b0a00df       cmp w6, w10
0xb9c9001304c  168c  54ff9d01       b.ne #-0xc60 (addr 0xb9c900123ec)
0xb9c90013050  1690  f94143e4       ldr x4, [sp, #640]
0xb9c90013054  1694  91009086       add x6, x4, #0x24 (36)
0xb9c90013058  1698  fd40e3e7       ldr d7, [sp, #448]
0xb9c9001305c  169c  bc266987       str s7, [x12, x6]
0xb9c90013060  16a0  f940f3e6       ldr x6, [sp, #480]
0xb9c90013064  16a4  fd40e7e6       ldr d6, [sp, #456]
0xb9c90013068  16a8  bc266986       str s6, [x12, x6]
0xb9c9001306c  16ac  91028088       add x8, x4, #0xa0 (160)
0xb9c90013070  16b0  3ce86984       ldr q4, [x12, x8]
0xb9c90013074  16b4  91020088       add x8, x4, #0x80 (128)
0xb9c90013078  16b8  3ce86985       ldr q5, [x12, x8]
0xb9c9001307c  16bc  91018088       add x8, x4, #0x60 (96)
0xb9c90013080  16c0  3ce86986       ldr q6, [x12, x8]
0xb9c90013084  16c4  91010088       add x8, x4, #0x40 (64)
0xb9c90013088  16c8  3ce86987       ldr q7, [x12, x8]
0xb9c9001308c  16cc  9102c088       add x8, x4, #0xb0 (176)
0xb9c90013090  16d0  3ce86988       ldr q8, [x12, x8]
0xb9c90013094  16d4  91024088       add x8, x4, #0x90 (144)
0xb9c90013098  16d8  3ce86989       ldr q9, [x12, x8]
0xb9c9001309c  16dc  9101c088       add x8, x4, #0x70 (112)
0xb9c900130a0  16e0  3ce8698a       ldr q10, [x12, x8]
0xb9c900130a4  16e4  91014088       add x8, x4, #0x50 (80)
0xb9c900130a8  16e8  3ce8698d       ldr q13, [x12, x8]
0xb9c900130ac  16ec  f94107e8       ldr x8, [sp, #520]
0xb9c900130b0  16f0  3dc06fee       ldr q14, [sp, #432]
0xb9c900130b4  16f4  3ca8698e       str q14, [x12, x8]
0xb9c900130b8  16f8  4e0404f0       dup v16.4s, v7.s[0]
0xb9c900130bc  16fc  6e0c04d0       mov v16.s[1], v6.s[0]
0xb9c900130c0  1700  4e0404b1       dup v17.4s, v5.s[0]
0xb9c900130c4  1704  6e1c0491       mov v17.s[3], v4.s[0]
0xb9c900130c8  1708  4eb01e1e       mov v30.16b, v16.16b
0xb9c900130cc  170c  6e0807d0       mov v16.d[0], v30.d[0]
0xb9c900130d0  1710  6e184630       mov v16.d[1], v17.d[1]
0xb9c900130d4  1714  4e0404f1       dup v17.4s, v7.s[0]
0xb9c900130d8  1718  6e0424f1       mov v17.s[0], v7.s[1]
0xb9c900130dc  171c  6e0c24d1       mov v17.s[1], v6.s[1]
0xb9c900130e0  1720  4e0404b2       dup v18.4s, v5.s[0]
0xb9c900130e4  1724  6e1424b2       mov v18.s[2], v5.s[1]
0xb9c900130e8  1728  6e1c2492       mov v18.s[3], v4.s[1]
0xb9c900130ec  172c  4eb11e3e       mov v30.16b, v17.16b
0xb9c900130f0  1730  6e0807d1       mov v17.d[0], v30.d[0]
0xb9c900130f4  1734  6e184651       mov v17.d[1], v18.d[1]
0xb9c900130f8  1738  4e31d610       fadd v16.4s, v16.4s, v17.4s
0xb9c900130fc  173c  4e0404f1       dup v17.4s, v7.s[0]
0xb9c90013100  1740  6e0444f1       mov v17.s[0], v7.s[2]
0xb9c90013104  1744  6e0c44d1       mov v17.s[1], v6.s[2]
0xb9c90013108  1748  4e0404b2       dup v18.4s, v5.s[0]
0xb9c9001310c  174c  6e1444b2       mov v18.s[2], v5.s[2]
0xb9c90013110  1750  6e1c4492       mov v18.s[3], v4.s[2]
0xb9c90013114  1754  4eb11e3e       mov v30.16b, v17.16b
0xb9c90013118  1758  6e0807d1       mov v17.d[0], v30.d[0]
0xb9c9001311c  175c  6e184651       mov v17.d[1], v18.d[1]
0xb9c90013120  1760  4e31d610       fadd v16.4s, v16.4s, v17.4s
0xb9c90013124  1764  4ea61cde       mov v30.16b, v6.16b
0xb9c90013128  1768  4e0404e6       dup v6.4s, v7.s[0]
0xb9c9001312c  176c  6e0464e6       mov v6.s[0], v7.s[3]
0xb9c90013130  1770  6e0c67c6       mov v6.s[1], v30.s[3]
0xb9c90013134  1774  4ea41c9e       mov v30.16b, v4.16b
0xb9c90013138  1778  4e0404a4       dup v4.4s, v5.s[0]
0xb9c9001313c  177c  6e1464a4       mov v4.s[2], v5.s[3]
0xb9c90013140  1780  6e1c67c4       mov v4.s[3], v30.s[3]
0xb9c90013144  1784  4ea41c9e       mov v30.16b, v4.16b
0xb9c90013148  1788  6e0804c4       mov v4.d[0], v6.d[0]
0xb9c9001314c  178c  6e1847c4       mov v4.d[1], v30.d[1]
0xb9c90013150  1790  4e24d604       fadd v4.4s, v16.4s, v4.4s
0xb9c90013154  1794  4e0405a5       dup v5.4s, v13.s[0]
0xb9c90013158  1798  6e0c0545       mov v5.s[1], v10.s[0]
0xb9c9001315c  179c  4e040526       dup v6.4s, v9.s[0]
0xb9c90013160  17a0  6e1c0506       mov v6.s[3], v8.s[0]
0xb9c90013164  17a4  4ea51cbe       mov v30.16b, v5.16b
0xb9c90013168  17a8  6e0807c5       mov v5.d[0], v30.d[0]
0xb9c9001316c  17ac  6e1844c5       mov v5.d[1], v6.d[1]
0xb9c90013170  17b0  4e25d484       fadd v4.4s, v4.4s, v5.4s
0xb9c90013174  17b4  4e0405a5       dup v5.4s, v13.s[0]
0xb9c90013178  17b8  6e0425a5       mov v5.s[0], v13.s[1]
0xb9c9001317c  17bc  6e0c2545       mov v5.s[1], v10.s[1]
0xb9c90013180  17c0  4e040526       dup v6.4s, v9.s[0]
0xb9c90013184  17c4  6e142526       mov v6.s[2], v9.s[1]
0xb9c90013188  17c8  6e1c2506       mov v6.s[3], v8.s[1]
0xb9c9001318c  17cc  4ea51cbe       mov v30.16b, v5.16b
0xb9c90013190  17d0  6e0807c5       mov v5.d[0], v30.d[0]
0xb9c90013194  17d4  6e1844c5       mov v5.d[1], v6.d[1]
0xb9c90013198  17d8  4e25d484       fadd v4.4s, v4.4s, v5.4s
0xb9c9001319c  17dc  4e0405a5       dup v5.4s, v13.s[0]
0xb9c900131a0  17e0  6e0445a5       mov v5.s[0], v13.s[2]
0xb9c900131a4  17e4  6e0c4545       mov v5.s[1], v10.s[2]
0xb9c900131a8  17e8  4e040526       dup v6.4s, v9.s[0]
0xb9c900131ac  17ec  6e144526       mov v6.s[2], v9.s[2]
0xb9c900131b0  17f0  6e1c4506       mov v6.s[3], v8.s[2]
0xb9c900131b4  17f4  4ea51cbe       mov v30.16b, v5.16b
0xb9c900131b8  17f8  6e0807c5       mov v5.d[0], v30.d[0]
0xb9c900131bc  17fc  6e1844c5       mov v5.d[1], v6.d[1]
0xb9c900131c0  1800  4e25d484       fadd v4.4s, v4.4s, v5.4s
0xb9c900131c4  1804  4e0405a5       dup v5.4s, v13.s[0]
0xb9c900131c8  1808  6e0465a5       mov v5.s[0], v13.s[3]
0xb9c900131cc  180c  6e0c6545       mov v5.s[1], v10.s[3]
0xb9c900131d0  1810  4e040526       dup v6.4s, v9.s[0]
0xb9c900131d4  1814  6e146526       mov v6.s[2], v9.s[3]
0xb9c900131d8  1818  6e1c6506       mov v6.s[3], v8.s[3]
0xb9c900131dc  181c  4ea51cbe       mov v30.16b, v5.16b
0xb9c900131e0  1820  6e0807c5       mov v5.d[0], v30.d[0]
0xb9c900131e4  1824  6e1844c5       mov v5.d[1], v6.d[1]
0xb9c900131e8  1828  4e25d484       fadd v4.4s, v4.4s, v5.4s
0xb9c900131ec  182c  4e2ed484       fadd v4.4s, v4.4s, v14.4s
0xb9c900131f0  1830  9103008a       add x10, x4, #0xc0 (192)
0xb9c900131f4  1834  3cea6985       ldr q5, [x12, x10]
0xb9c900131f8  1838  9103808a       add x10, x4, #0xe0 (224)
0xb9c900131fc  183c  3cea6986       ldr q6, [x12, x10]
0xb9c90013200  1840  4e0404a7       dup v7.4s, v5.s[0]
0xb9c90013204  1844  6e0c04c7       mov v7.s[1], v6.s[0]
0xb9c90013208  1848  4e0404a8       dup v8.4s, v5.s[0]
0xb9c9001320c  184c  6e0424a8       mov v8.s[0], v5.s[1]
0xb9c90013210  1850  6e0c24c8       mov v8.s[1], v6.s[1]
0xb9c90013214  1854  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0xb9c90013218  1858  4e0404a8       dup v8.4s, v5.s[0]
0xb9c9001321c  185c  6e0444a8       mov v8.s[0], v5.s[2]
0xb9c90013220  1860  6e0c44c8       mov v8.s[1], v6.s[2]
0xb9c90013224  1864  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0xb9c90013228  1868  4ea51cbe       mov v30.16b, v5.16b
0xb9c9001322c  186c  4e0407c5       dup v5.4s, v30.s[0]
0xb9c90013230  1870  6e0467c5       mov v5.s[0], v30.s[3]
0xb9c90013234  1874  6e0c64c5       mov v5.s[1], v6.s[3]
0xb9c90013238  1878  4e25d4e5       fadd v5.4s, v7.4s, v5.4s
0xb9c9001323c  187c  9103408a       add x10, x4, #0xd0 (208)
0xb9c90013240  1880  3cea6986       ldr q6, [x12, x10]
0xb9c90013244  1884  9103c08a       add x10, x4, #0xf0 (240)
0xb9c90013248  1888  3cea6987       ldr q7, [x12, x10]
0xb9c9001324c  188c  4e0404c8       dup v8.4s, v6.s[0]
0xb9c90013250  1890  6e0c04e8       mov v8.s[1], v7.s[0]
0xb9c90013254  1894  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0xb9c90013258  1898  4e0404c8       dup v8.4s, v6.s[0]
0xb9c9001325c  189c  6e0424c8       mov v8.s[0], v6.s[1]
0xb9c90013260  18a0  6e0c24e8       mov v8.s[1], v7.s[1]
0xb9c90013264  18a4  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0xb9c90013268  18a8  4e0404c8       dup v8.4s, v6.s[0]
0xb9c9001326c  18ac  6e0444c8       mov v8.s[0], v6.s[2]
0xb9c90013270  18b0  6e0c44e8       mov v8.s[1], v7.s[2]
0xb9c90013274  18b4  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0xb9c90013278  18b8  4ea61cde       mov v30.16b, v6.16b
0xb9c9001327c  18bc  4e0407c6       dup v6.4s, v30.s[0]
0xb9c90013280  18c0  6e0467c6       mov v6.s[0], v30.s[3]
0xb9c90013284  18c4  6e0c64e6       mov v6.s[1], v7.s[3]
0xb9c90013288  18c8  4e26d4a5       fadd v5.4s, v5.4s, v6.4s
0xb9c9001328c  18cc  3ce66986       ldr q6, [x12, x6]
0xb9c90013290  18d0  4e26d4a5       fadd v5.4s, v5.4s, v6.4s
0xb9c90013294  18d4  91041086       add x6, x4, #0x104 (260)
0xb9c90013298  18d8  bc666986       ldr s6, [x12, x6]
0xb9c9001329c  18dc  91040086       add x6, x4, #0x100 (256)
0xb9c900132a0  18e0  bc666987       ldr s7, [x12, x6]
0xb9c900132a4  18e4  91042086       add x6, x4, #0x108 (264)
0xb9c900132a8  18e8  bc666988       ldr s8, [x12, x6]
0xb9c900132ac  18ec  91043086       add x6, x4, #0x10c (268)
0xb9c900132b0  18f0  bc666989       ldr s9, [x12, x6]
0xb9c900132b4  18f4  91044086       add x6, x4, #0x110 (272)
0xb9c900132b8  18f8  bc66698a       ldr s10, [x12, x6]
0xb9c900132bc  18fc  91045086       add x6, x4, #0x114 (276)
0xb9c900132c0  1900  bc66698d       ldr s13, [x12, x6]
0xb9c900132c4  1904  91046086       add x6, x4, #0x118 (280)
0xb9c900132c8  1908  bc66698e       ldr s14, [x12, x6]
0xb9c900132cc  190c  91047086       add x6, x4, #0x11c (284)
0xb9c900132d0  1910  bc666990       ldr s16, [x12, x6]
0xb9c900132d4  1914  f94103e6       ldr x6, [sp, #512]
0xb9c900132d8  1918  fd40d7f1       ldr d17, [sp, #424]
0xb9c900132dc  191c  bc266991       str s17, [x12, x6]
0xb9c900132e0  1920  1e2628e6       fadd s6, s7, s6
0xb9c900132e4  1924  1e262906       fadd s6, s8, s6
0xb9c900132e8  1928  1e262926       fadd s6, s9, s6
0xb9c900132ec  192c  1e262946       fadd s6, s10, s6
0xb9c900132f0  1930  1e2629a6       fadd s6, s13, s6
0xb9c900132f4  1934  1e2629c6       fadd s6, s14, s6
0xb9c900132f8  1938  1e262a06       fadd s6, s16, s6
0xb9c900132fc  193c  1e3128c6       fadd s6, s6, s17
0xb9c90013300  1940  f940f7f8       ldr x24, [sp, #488]
0xb9c90013304  1944  bc266986       str s6, [x12, x6]
0xb9c90013308  1948  91008186       add x6, x12, #0x20 (32)
0xb9c9001330c  194c  8b0400c6       add x6, x6, x4
0xb9c90013310  1950  0d0084c5       st1 {v5.d}[0], [x6]
0xb9c90013314  1954  3ca86984       str q4, [x12, x8]
0xb9c90013318  1958  1100c083       add w3, w4, #0x30 (48)
0xb9c9001331c  195c  11004085       add w5, w4, #0x10 (16)
0xb9c90013320  1960  f90137f8       str x24, [sp, #616]
0xb9c90013324  1964  f9414be7       ldr x7, [sp, #656]
0xb9c90013328  1968  f94117e0       ldr x0, [sp, #552]
0xb9c9001332c  196c  f94113e2       ldr x2, [sp, #544]
0xb9c90013330  1970  fd410fe0       ldr d0, [sp, #536]
0xb9c90013334  1974  fd410be1       ldr d1, [sp, #528]
0xb9c90013338  1978  97fc08db       bl #-0xfdc94 (addr 0xb9c8ff156a4)
0xb9c9001333c  197c  f9413bf6       ldr x22, [sp, #624]
0xb9c90013340  1980  f94137f8       ldr x24, [sp, #616]
0xb9c90013344  1984  6b16031f       cmp w24, w22
0xb9c90013348  1988  54000689       b.ls #+0xd0 (addr 0xb9c90013418)
0xb9c9001334c  198c  f9411be6       ldr x6, [sp, #560]
0xb9c90013350  1990  6b1600df       cmp w6, w22
0xb9c90013354  1994  54000629       b.ls #+0xc4 (addr 0xb9c90013418)
0xb9c90013358  1998  f9412be8       ldr x8, [sp, #592]
0xb9c9001335c  199c  f9411fe9       ldr x9, [sp, #568]
0xb9c90013360  19a0  0b08012a       add w10, w9, w8
0xb9c90013364  19a4  f94143eb       ldr x11, [sp, #640]
0xb9c90013368  19a8  9101016c       add x12, x11, #0x40 (64)
0xb9c9001336c  19ac  f94133ed       ldr x13, [sp, #608]
0xb9c90013370  19b0  bc6c69a4       ldr s4, [x13, x12]
0xb9c90013374  19b4  bc2a69a4       str s4, [x13, x10]
0xb9c90013378  19b8  f94123ea       ldr x10, [sp, #576]
0xb9c9001337c  19bc  0b08014c       add w12, w10, w8
0xb9c90013380  19c0  9101116e       add x14, x11, #0x44 (68)
0xb9c90013384  19c4  bc6e69a4       ldr s4, [x13, x14]
0xb9c90013388  19c8  bc2c69a4       str s4, [x13, x12]
0xb9c9001338c  19cc  f94127ec       ldr x12, [sp, #584]
0xb9c90013390  19d0  0b08018e       add w14, w12, w8
0xb9c90013394  19d4  9101216f       add x15, x11, #0x48 (72)
0xb9c90013398  19d8  bc6f69a4       ldr s4, [x13, x15]
0xb9c9001339c  19dc  bc2e69a4       str s4, [x13, x14]
0xb9c900133a0  19e0  f9412fee       ldr x14, [sp, #600]
0xb9c900133a4  19e4  0b0801c8       add w8, w14, w8
0xb9c900133a8  19e8  9101316f       add x15, x11, #0x4c (76)
0xb9c900133ac  19ec  bc6f69a4       ldr s4, [x13, x15]
0xb9c900133b0  19f0  bc2869a4       str s4, [x13, x8]
0xb9c900133b4  19f4  f90137f8       str x24, [sp, #616]
0xb9c900133b8  19f8  aa0903f5       mov x21, x9
0xb9c900133bc  19fc  aa0d03e9       mov x9, x13
0xb9c900133c0  1a00  aa0c03f3       mov x19, x12
0xb9c900133c4  1a04  aa0e03ec       mov x12, x14
0xb9c900133c8  1a08  aa0a03ed       mov x13, x10
0xb9c900133cc  1a0c  2f00e406       movi d6, #0x0
0xb9c900133d0  1a10  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c900133d4  1a14  fd40cfe1       ldr d1, [sp, #408]
0xb9c900133d8  1a18  fd40cbe0       ldr d0, [sp, #400]
0xb9c900133dc  1a1c  3dc04fe8       ldr q8, [sp, #304]
0xb9c900133e0  1a20  3dc04be4       ldr q4, [sp, #288]
0xb9c900133e4  1a24  3dc047e5       ldr q5, [sp, #272]
0xb9c900133e8  1a28  d2800002       movz x2, #0x0
0xb9c900133ec  1a2c  f94017e6       ldr x6, [sp, #40]
0xb9c900133f0  1a30  f9401be1       ldr x1, [sp, #48]
0xb9c900133f4  1a34  f9402ff4       ldr x20, [sp, #88]
0xb9c900133f8  1a38  f94043e0       ldr x0, [sp, #128]
0xb9c900133fc  1a3c  f9401fef       ldr x15, [sp, #56]
0xb9c90013400  1a40  f94033fc       ldr x28, [sp, #96]
0xb9c90013404  1a44  f94047ee       ldr x14, [sp, #136]
0xb9c90013408  1a48  f9402bf7       ldr x23, [sp, #80]
0xb9c9001340c  1a4c  f9403ffb       ldr cp, [sp, #120]
0xb9c90013410  1a50  f940eff9       ldr x25, [sp, #472]
0xb9c90013414  1a54  14000019       b #+0x64 (addr 0xb9c90013478)
0xb9c90013418  1a58  f90137f8       str x24, [sp, #616]
0xb9c9001341c  1a5c  f94133e9       ldr x9, [sp, #608]
0xb9c90013420  1a60  f9412fec       ldr x12, [sp, #600]
0xb9c90013424  1a64  f94127f3       ldr x19, [sp, #584]
0xb9c90013428  1a68  f94123ed       ldr x13, [sp, #576]
0xb9c9001342c  1a6c  f9411ff5       ldr x21, [sp, #568]
0xb9c90013430  1a70  2f00e406       movi d6, #0x0
0xb9c90013434  1a74  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c90013438  1a78  fd40cfe1       ldr d1, [sp, #408]
0xb9c9001343c  1a7c  fd40cbe0       ldr d0, [sp, #400]
0xb9c90013440  1a80  3dc04fe8       ldr q8, [sp, #304]
0xb9c90013444  1a84  3dc04be4       ldr q4, [sp, #288]
0xb9c90013448  1a88  3dc047e5       ldr q5, [sp, #272]
0xb9c9001344c  1a8c  d2800002       movz x2, #0x0
0xb9c90013450  1a90  f94017e6       ldr x6, [sp, #40]
0xb9c90013454  1a94  f9401be1       ldr x1, [sp, #48]
0xb9c90013458  1a98  f9402ff4       ldr x20, [sp, #88]
0xb9c9001345c  1a9c  f94043e0       ldr x0, [sp, #128]
0xb9c90013460  1aa0  f9401fef       ldr x15, [sp, #56]
0xb9c90013464  1aa4  f94033fc       ldr x28, [sp, #96]
0xb9c90013468  1aa8  f94047ee       ldr x14, [sp, #136]
0xb9c9001346c  1aac  f9402bf7       ldr x23, [sp, #80]
0xb9c90013470  1ab0  f9403ffb       ldr cp, [sp, #120]
0xb9c90013474  1ab4  f940eff9       ldr x25, [sp, #472]
0xb9c90013478  1ab8  110006d6       add w22, w22, #0x1 (1)
0xb9c9001347c  1abc  f9413fe8       ldr x8, [sp, #632]
0xb9c90013480  1ac0  6b0802df       cmp w22, w8
0xb9c90013484  1ac4  54ff64c1       b.ne #-0x1368 (addr 0xb9c9001211c)
0xb9c90013488  1ac8  f94143e6       ldr x6, [sp, #640]
0xb9c9001348c  1acc  110500c6       add w6, w6, #0x140 (320)
0xb9c90013490  1ad0  f94147e8       ldr x8, [sp, #648]
0xb9c90013494  1ad4  b9000106       str w6, [x8]
0xb9c90013498  1ad8  17fffaf2       b #-0x1438 (addr 0xb9c90012060)
0xb9c9001349c  1adc  97fc09cd       bl #-0xfd8cc (addr 0xb9c8ff15bd0)
0xb9c900134a0  1ae0  f94133e6       ldr x6, [sp, #608]
0xb9c900134a4  1ae4  f9414be7       ldr x7, [sp, #656]
0xb9c900134a8  1ae8  f9413fe0       ldr x0, [sp, #632]
0xb9c900134ac  1aec  17fff950       b #-0x1ac0 (addr 0xb9c900119ec)
0xb9c900134b0  1af0  1e682100       fcmp d8, d8
0xb9c900134b4  1af4  54000080       b.eq #+0x10 (addr 0xb9c900134c4)
0xb9c900134b8  1af8  d2800001       movz x1, #0x0
0xb9c900134bc  1afc  aa0103ec       mov x12, x1
0xb9c900134c0  1b00  17fff980       b #-0x1a00 (addr 0xb9c90011ac0)
0xb9c900134c4  1b04  1e2020e8       fcmp s7, #0.0
0xb9c900134c8  1b08  54000063       b.lo #+0xc (addr 0xb9c900134d4)
0xb9c900134cc  1b0c  9280000c       movn x12, #0x0
0xb9c900134d0  1b10  17fff97c       b #-0x1a10 (addr 0xb9c90011ac0)
0xb9c900134d4  1b14  d280000c       movz x12, #0x0
0xb9c900134d8  1b18  17fff97a       b #-0x1a18 (addr 0xb9c90011ac0)
0xb9c900134dc  1b1c  1e692120       fcmp d9, d9
0xb9c900134e0  1b20  54000060       b.eq #+0xc (addr 0xb9c900134ec)
0xb9c900134e4  1b24  d280000c       movz x12, #0x0
0xb9c900134e8  1b28  17fff97e       b #-0x1a08 (addr 0xb9c90011ae0)
0xb9c900134ec  1b2c  1e202108       fcmp s8, #0.0
0xb9c900134f0  1b30  54ffffa3       b.lo #-0xc (addr 0xb9c900134e4)
0xb9c900134f4  1b34  9280000c       movn x12, #0x0
0xb9c900134f8  1b38  17fff97a       b #-0x1a18 (addr 0xb9c90011ae0)
0xb9c900134fc  1b3c  fd0117e5       str d5, [sp, #552]
0xb9c90013500  1b40  f90123f5       str x21, [sp, #576]
0xb9c90013504  1b44  f90127f4       str x20, [sp, #584]
0xb9c90013508  1b48  97fc09b2       bl #-0xfd938 (addr 0xb9c8ff15bd0)
0xb9c9001350c  1b4c  f94133e9       ldr x9, [sp, #608]
0xb9c90013510  1b50  f94017e6       ldr x6, [sp, #40]
0xb9c90013514  1b54  f94033ef       ldr x15, [sp, #96]
0xb9c90013518  1b58  f940efed       ldr x13, [sp, #472]
0xb9c9001351c  1b5c  f940f7e8       ldr x8, [sp, #488]
0xb9c90013520  1b60  f9411bec       ldr x12, [sp, #560]
0xb9c90013524  1b64  f9413fea       ldr x10, [sp, #632]
0xb9c90013528  1b68  f94127f4       ldr x20, [sp, #584]
0xb9c9001352c  1b6c  fd4117e5       ldr d5, [sp, #552]
0xb9c90013530  1b70  f9412be0       ldr x0, [sp, #592]
0xb9c90013534  1b74  f9412ff3       ldr x19, [sp, #600]
0xb9c90013538  1b78  f94137ee       ldr x14, [sp, #616]
0xb9c9001353c  1b7c  f94123f5       ldr x21, [sp, #576]
0xb9c90013540  1b80  17fff9ac       b #-0x1950 (addr 0xb9c90011bf0)
0xb9c90013544  1b84  fd0117e5       str d5, [sp, #552]
0xb9c90013548  1b88  f90123ec       str x12, [sp, #576]
0xb9c9001354c  1b8c  f90137e2       str x2, [sp, #616]
0xb9c90013550  1b90  97fc09a0       bl #-0xfd980 (addr 0xb9c8ff15bd0)
0xb9c90013554  1b94  f94133e9       ldr x9, [sp, #608]
0xb9c90013558  1b98  f94017e6       ldr x6, [sp, #40]
0xb9c9001355c  1b9c  f9401ff4       ldr x20, [sp, #56]
0xb9c90013560  1ba0  f9403fee       ldr x14, [sp, #120]
0xb9c90013564  1ba4  f940f7e8       ldr x8, [sp, #488]
0xb9c90013568  1ba8  f9412feb       ldr x11, [sp, #600]
0xb9c9001356c  1bac  f9411bf6       ldr x22, [sp, #560]
0xb9c90013570  1bb0  f9413fea       ldr x10, [sp, #632]
0xb9c90013574  1bb4  f94137e2       ldr x2, [sp, #616]
0xb9c90013578  1bb8  fd4117e5       ldr d5, [sp, #552]
0xb9c9001357c  1bbc  f94103e0       ldr x0, [sp, #512]
0xb9c90013580  1bc0  f9412bf5       ldr x21, [sp, #592]
0xb9c90013584  1bc4  f94127f3       ldr x19, [sp, #584]
0xb9c90013588  1bc8  f94123ec       ldr x12, [sp, #576]
0xb9c9001358c  1bcc  17fff9de       b #-0x1888 (addr 0xb9c90011d04)
0xb9c90013590  1bd0  fd0117e5       str d5, [sp, #552]
0xb9c90013594  1bd4  f90127f6       str x22, [sp, #584]
0xb9c90013598  1bd8  f90137e2       str x2, [sp, #616]
0xb9c9001359c  1bdc  97fc098d       bl #-0xfd9cc (addr 0xb9c8ff15bd0)
0xb9c900135a0  1be0  f94133e9       ldr x9, [sp, #608]
0xb9c900135a4  1be4  f94017e6       ldr x6, [sp, #40]
0xb9c900135a8  1be8  f94043f3       ldr x19, [sp, #128]
0xb9c900135ac  1bec  f9402bed       ldr x13, [sp, #80]
0xb9c900135b0  1bf0  f9412feb       ldr x11, [sp, #600]
0xb9c900135b4  1bf4  f9412bec       ldr x12, [sp, #592]
0xb9c900135b8  1bf8  f9411bf7       ldr x23, [sp, #560]
0xb9c900135bc  1bfc  f9413fea       ldr x10, [sp, #632]
0xb9c900135c0  1c00  f94137e2       ldr x2, [sp, #616]
0xb9c900135c4  1c04  fd4117e5       ldr d5, [sp, #552]
0xb9c900135c8  1c08  f94107e0       ldr x0, [sp, #520]
0xb9c900135cc  1c0c  f94123f5       ldr x21, [sp, #576]
0xb9c900135d0  1c10  f94103ef       ldr x15, [sp, #512]
0xb9c900135d4  1c14  f94127f6       ldr x22, [sp, #584]
0xb9c900135d8  1c18  17fffa0c       b #-0x17d0 (addr 0xb9c90011e08)
0xb9c900135dc  1c1c  fd0117e5       str d5, [sp, #552]
0xb9c900135e0  1c20  f9011fea       str x10, [sp, #568]
0xb9c900135e4  1c24  f90127e2       str x2, [sp, #584]
0xb9c900135e8  1c28  97fc097a       bl #-0xfda18 (addr 0xb9c8ff15bd0)
0xb9c900135ec  1c2c  f94133e9       ldr x9, [sp, #608]
0xb9c900135f0  1c30  f94017e6       ldr x6, [sp, #40]
0xb9c900135f4  1c34  f9402ff4       ldr x20, [sp, #88]
0xb9c900135f8  1c38  f94047ee       ldr x14, [sp, #136]
0xb9c900135fc  1c3c  f94137e8       ldr x8, [sp, #616]
0xb9c90013600  1c40  f9412bec       ldr x12, [sp, #592]
0xb9c90013604  1c44  f94127e2       ldr x2, [sp, #584]
0xb9c90013608  1c48  fd4117e5       ldr d5, [sp, #552]
0xb9c9001360c  1c4c  f9413fe0       ldr x0, [sp, #632]
0xb9c90013610  1c50  f9411bf6       ldr x22, [sp, #560]
0xb9c90013614  1c54  f94107f5       ldr x21, [sp, #520]
0xb9c90013618  1c58  f940f3ef       ldr x15, [sp, #480]
0xb9c9001361c  1c5c  f9411fea       ldr x10, [sp, #568]
0xb9c90013620  1c60  17fffa3f       b #-0x1704 (addr 0xb9c90011f1c)
0xb9c90013624  1c64  f9013bf6       str x22, [sp, #624]
0xb9c90013628  1c68  97fc096a       bl #-0xfda58 (addr 0xb9c8ff15bd0)
0xb9c9001362c  1c6c  f9413bf6       ldr x22, [sp, #624]
0xb9c90013630  1c70  f94133e9       ldr x9, [sp, #608]
0xb9c90013634  1c74  f9412fec       ldr x12, [sp, #600]
0xb9c90013638  1c78  f94127f3       ldr x19, [sp, #584]
0xb9c9001363c  1c7c  f94123ed       ldr x13, [sp, #576]
0xb9c90013640  1c80  f9411ff5       ldr x21, [sp, #568]
0xb9c90013644  1c84  2f00e406       movi d6, #0x0
0xb9c90013648  1c88  1e2e1007       fmov s7, #0x70 (1.0000)
0xb9c9001364c  1c8c  fd40cfe1       ldr d1, [sp, #408]
0xb9c90013650  1c90  fd40cbe0       ldr d0, [sp, #400]
0xb9c90013654  1c94  3dc04fe8       ldr q8, [sp, #304]
0xb9c90013658  1c98  3dc04be4       ldr q4, [sp, #288]
0xb9c9001365c  1c9c  3dc047e5       ldr q5, [sp, #272]
0xb9c90013660  1ca0  d2800002       movz x2, #0x0
0xb9c90013664  1ca4  f94017e6       ldr x6, [sp, #40]
0xb9c90013668  1ca8  f9401be1       ldr x1, [sp, #48]
0xb9c9001366c  1cac  f9402ff4       ldr x20, [sp, #88]
0xb9c90013670  1cb0  f94043e0       ldr x0, [sp, #128]
0xb9c90013674  1cb4  f9401fef       ldr x15, [sp, #56]
0xb9c90013678  1cb8  f94033fc       ldr x28, [sp, #96]
0xb9c9001367c  1cbc  f94047ee       ldr x14, [sp, #136]
0xb9c90013680  1cc0  f9402bf7       ldr x23, [sp, #80]
0xb9c90013684  1cc4  f9403ffb       ldr cp, [sp, #120]
0xb9c90013688  1cc8  f940eff9       ldr x25, [sp, #472]
0xb9c9001368c  1ccc  17fffaa7       b #-0x1564 (addr 0xb9c90012128)
0xb9c90013690  1cd0  1e6620c0       fcmp d6, d6
0xb9c90013694  1cd4  54000060       b.eq #+0xc (addr 0xb9c900136a0)
0xb9c90013698  1cd8  d2800008       movz x8, #0x0
0xb9c9001369c  1cdc  17fffb01       b #-0x13fc (addr 0xb9c900122a0)
0xb9c900136a0  1ce0  1e2020a8       fcmp s5, #0.0
0xb9c900136a4  1ce4  54ffffa3       b.lo #-0xc (addr 0xb9c90013698)
0xb9c900136a8  1ce8  92800008       movn x8, #0x0
0xb9c900136ac  1cec  17fffafd       b #-0x140c (addr 0xb9c900122a0)
0xb9c900136b0  1cf0  1e6520a0       fcmp d5, d5
0xb9c900136b4  1cf4  54000060       b.eq #+0xc (addr 0xb9c900136c0)
0xb9c900136b8  1cf8  d280000b       movz x11, #0x0
0xb9c900136bc  1cfc  17fffb21       b #-0x137c (addr 0xb9c90012340)
0xb9c900136c0  1d00  1e202088       fcmp s4, #0.0
0xb9c900136c4  1d04  54ffffa3       b.lo #-0xc (addr 0xb9c900136b8)
0xb9c900136c8  1d08  9280000b       movn x11, #0x0
0xb9c900136cc  1d0c  17fffb1d       b #-0x138c (addr 0xb9c90012340)
0xb9c900136d0  1d10  97fc0940       bl #-0xfdb00 (addr 0xb9c8ff15bd0)
0xb9c900136d4  1d14  f94143e4       ldr x4, [sp, #640]
0xb9c900136d8  1d18  f94133f5       ldr x21, [sp, #608]
0xb9c900136dc  1d1c  2f00e40a       movi d10, #0x0
0xb9c900136e0  1d20  f94137e9       ldr x9, [sp, #616]
0xb9c900136e4  1d24  fd40e7e6       ldr d6, [sp, #456]
0xb9c900136e8  1d28  fd40e3e7       ldr d7, [sp, #448]
0xb9c900136ec  1d2c  3dc06fe8       ldr q8, [sp, #432]
0xb9c900136f0  1d30  fd40d7e9       ldr d9, [sp, #424]
0xb9c900136f4  1d34  1e2e100b       fmov s11, #0x70 (1.0000)
0xb9c900136f8  1d38  fd40cfe1       ldr d1, [sp, #408]
0xb9c900136fc  1d3c  fd40cbe0       ldr d0, [sp, #400]
0xb9c90013700  1d40  fd40c7e3       ldr d3, [sp, #392]
0xb9c90013704  1d44  fd40c3e2       ldr d2, [sp, #384]
0xb9c90013708  1d48  3dc04fec       ldr q12, [sp, #304]
0xb9c9001370c  1d4c  3dc04bee       ldr q14, [sp, #288]
0xb9c90013710  1d50  3dc047ed       ldr q13, [sp, #272]
0xb9c90013714  1d54  3dc043e4       ldr q4, [sp, #256]
0xb9c90013718  1d58  3dc03fe5       ldr q5, [sp, #240]
0xb9c9001371c  1d5c  f94073fb       ldr cp, [sp, #224]
0xb9c90013720  1d60  f9406fe0       ldr x0, [sp, #216]
0xb9c90013724  1d64  f9406bfc       ldr x28, [sp, #208]
0xb9c90013728  1d68  f94067f8       ldr x24, [sp, #200]
0xb9c9001372c  1d6c  f9405ff9       ldr x25, [sp, #184]
0xb9c90013730  1d70  d2800017       movz x23, #0x0
0xb9c90013734  1d74  f9400bed       ldr x13, [sp, #16]
0xb9c90013738  1d78  f94007f3       ldr x19, [sp, #8]
0xb9c9001373c  1d7c  f9400fee       ldr x14, [sp, #24]
0xb9c90013740  1d80  f94023ef       ldr x15, [sp, #64]
0xb9c90013744  1d84  f94037f6       ldr x22, [sp, #104]
0xb9c90013748  1d88  f94013e8       ldr x8, [sp, #32]
0xb9c9001374c  1d8c  f94027ec       ldr x12, [sp, #72]
0xb9c90013750  1d90  f9403be6       ldr x6, [sp, #112]
0xb9c90013754  1d94  17fffb4e       b #-0x12c8 (addr 0xb9c9001248c)
0xb9c90013758  1d98  97fc091e       bl #-0xfdb88 (addr 0xb9c8ff15bd0)
0xb9c9001375c  1d9c  f94057e5       ldr x5, [sp, #168]
0xb9c90013760  1da0  f94053e4       ldr x4, [sp, #160]
0xb9c90013764  1da4  f9404fe3       ldr x3, [sp, #152]
0xb9c90013768  1da8  f9404be2       ldr x2, [sp, #144]
0xb9c9001376c  1dac  17fffc00       b #-0x1000 (addr 0xb9c9001276c)
0xb9c90013770  1db0  97fc0868       bl #-0xfde60 (addr 0xb9c8ff15910)
0xb9c90013774  1db4  d503201f       nop
0xb9c90013778  1db8  5800007f       constant pool begin (num_const = 3)
0xb9c9001377c  1dbc  d63f03e0       constant
0xb9c90013780  1dc0  0102aaf4       constant
0xb9c90013784  1dc4  00000001       constant

Protected instructions:
 pc offset
        44         
        64         
        b4         
       150         
       158         
       160         
       168         
       170         
       17c         
       184         
       18c         
       194         
       1c8         
       1d8         
       1e0         
       1ec         
       1f4         
       238         
       24c         
       274         
       2d8         
       2e0         
       2e8         
       304         
       30c         
       314         
       34c         
       360         
       388         
       3e0         
       3e8         
       3f0         
       400         
       408         
       410         
       450         
       464         
       48c         
       4e4         
       4ec         
       4f4         
       504         
       50c         
       514         
       564         
       578         
       5b0         
       610         
       618         
       620         
       630         
       638         
       63c         
       640         
       644         
       64c         
       654         
       658         
       65c         
       660         
       668         
       670         
       674         
       678         
       67c         
       680         
       684         
       6ac         
       6b4         
       6b8         
       6cc         
       6d4         
       6d8         
       6e0         
       6e4         
       6ec         
       6fc         
       768         
       778         
       788         
       798         
       7a8         
       7b4         
       7b8         
       7c4         
       7c8         
       7d4         
       7d8         
       7e8         
       7f4         
       7fc         
       804         
       808         
       810         
       81c         
       82c         
       838         
       844         
       848         
       9dc         
       9e4         
       aec         
       af4         
       e84         
       ea4         
       ec0         
       edc         
       f34         
       f68         
       f78         
       f90         
       f94         
       fac         
       fb8         
       fe8         
       ff0         
       ffc         
      1028         
      1030         
      1038         
      1044         
      1050         
      1058         
      105c         
      1068         
      1070         
      1074         
      1080         
      1088         
      1090         
      1098         
      10a4         
      10b0         
      10d8         
      10e0         
      10ec         
      10f4         
      1120         
      112c         
      1134         
      113c         
      1148         
      1150         
      1158         
      1164         
      116c         
      1174         
      117c         
      11fc         
      1214         
      1264         
      126c         
      12b0         
      12c0         
      1308         
      1314         
      1354         
      1364         
      13ac         
      13b8         
      13f8         
      1408         
      1450         
      145c         
      149c         
      14ac         
      14f4         
      1500         
      1540         
      1550         
      1598         
      15a4         
      15e4         
      15f4         
      163c         
      1648         
      169c         
      16a8         
      16b0         
      16b8         
      16c0         
      16c8         
      16d0         
      16d8         
      16e0         
      16e8         
      16f4         
      1834         
      183c         
      1880         
      1888         
      18cc         
      18d8         
      18e0         
      18e8         
      18f0         
      18f8         
      1900         
      1908         
      1910         
      191c         
      1944         
      1950         
      1954         
      19b0         
      19b4         
      19c4         
      19c8         
      19d8         
      19dc         
      19ec         
      19f0         

Source positions:
 pc offset  position
        44        72
        64       109
        b4       178
       14c       291
       158       301
       160       305
       168       312
       170       316
       17c       327
       184       332
       18c       337
       194       342
       198       345
       1c4       359
       1d8       372
       1e0       379
       1e8       391
       1f0       398
       238       440
       24c       469
       274       498
       280       510
       2cc       526
       2e0       531
       2e8       542
       304       561
       308       566
       310       573
       34c       615
       360       644
       388       673
       394       685
       3e0       701
       3e8       706
       3f0       717
       400       736
       408       741
       410       748
       450       791
       464       820
       48c       849
       498       861
       4e4       877
       4ec       882
       4f4       893
       504       912
       50c       917
       514       924
       564       963
       578       992
       5b0      1021
       5bc      1033
       604      1049
       618      1054
       620      1065
       62c      1078
       638      1085
       63c      1095
       640      1099
       644      1107
       64c      1113
       650      1123
       658      1127
       65c      1135
       660      1141
       668      1148
       66c      1157
       674      1161
       678      1167
       67c      1176
       680      1183
       684      1190
       6ac      1202
       6b0      1209
       6b8      1216
       6cc      1239
       6d4      1246
       6d8      1253
       6e0      1260
       6e4      1267
       6e8      1274
       6fc      1291
       768      1318
       778      1330
       788      1342
       798      1354
       7a8      1364
       7b4      1377
       7b8      1384
       7c4      1392
       7c8      1399
       7d4      1407
       7d8      1416
       7e4      1424
       7f4      1427
       7fc      1434
       804      1441
       808      1448
       810      1455
       81c      1462
       82c      1485
       838      1491
       844      1499
       848      1507
       850      1524
       9d8      1781
       9e4      1788
       aec      1897
       af4      1910
       c78      2225
       e80      2423
       ea4      2446
       ec0      2464
       edc      2482
       f34      2547
       f64      2380
       f78      2391
       f90      2572
       f94      2581
       fac      2603
       fb8      2638
       fe8      2681
       ff0      2690
       ffc      2705
      1028      2768
      1030      2776
      1038      2785
      1044      2799
      1050      2814
      1058      2821
      105c      2829
      1068      2840
      1070      2848
      1074      2857
      1080      2868
      1088      2876
      1090      2885
      1098      2894
      10a4      2907
      10b0      2924
      10d8      2967
      10e0      2976
      10ec      2991
      10f4      3000
      1120      3048
      112c      3063
      1134      3070
      113c      3078
      1148      3089
      1150      3097
      1158      3106
      1164      3117
      116c      3125
      1174      3136
      117c      3144
      11f8      3232
      1214      3247
      1264      3308
      126c      3316
      12b0      3360
      12c0      3375
      1308      3436
      1314      3444
      1354      3488
      1364      3503
      13ac      3564
      13b8      3572
      13f8      3616
      1408      3631
      1450      3692
      145c      3700
      149c      3744
      14ac      3759
      14f4      3820
      1500      3828
      1540      3872
      1550      3887
      1598      3948
      15a4      3956
      15e4      3998
      15f4      4013
      163c      4074
      1648      4082
      1698      4130
      16a0      4137
      16b0      4142
      16b8      4151
      16c0      4160
      16c8      4168
      16d0      4176
      16d8      4185
      16e0      4194
      16e8      4202
      16ec      4212
      1834      4742
      183c      4751
      1880      4853
      1888      4862
      18cc      4967
      18d8      4978
      18e0      4986
      18e8      4994
      18f0      5002
      18f8      5010
      1900      5018
      1908      5026
      1910      5034
      1914      5044
      1944      5084
      194c      5091
      1954      5100
      1960      5128
      19ac      5155
      19b4      5158
      19c4      5168
      19c8      5171
      19d8      5181
      19dc      5184
      19ec      5194
      19f0      5197
      1adc         0
      1b3c       414
      1b84       589
      1bd0       765
      1c1c       937
      1c64      1310
      1d10      1834
      1d98      2201
      1db0      1524

Safepoints (stack slots = 86, entries = 1, byte size = 25)
0xb9c90011b7c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 75)
0xb9c90011b78  internal wasm call
0xb9c90011c50  internal wasm call
0xb9c90011d60  internal wasm call
0xb9c90011e64  internal wasm call
0xb9c90011f88  internal wasm call
0xb9c90012240  external reference (0x10102aaf4)
0xb9c90012664  internal wasm call
0xb9c900126c0  internal wasm call
0xb9c9001271c  internal wasm call
0xb9c90012784  internal wasm call
0xb9c90013338  internal wasm call
0xb9c9001349c  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013508  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013550  wasm stub call  (0xb9c8ff15bd0)
0xb9c9001359c  wasm stub call  (0xb9c8ff15bd0)
0xb9c900135e8  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013628  wasm stub call  (0xb9c8ff15bd0)
0xb9c900136d0  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013758  wasm stub call  (0xb9c8ff15bd0)
0xb9c90013770  wasm stub call  (0xb9c8ff15910)
0xb9c90013778  constant pool (size 16)
