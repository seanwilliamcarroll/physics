name: _RNvMNtNtCshBZZPcGIfde_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 7552 = 7524 + 28 padding)
Instructions (size = 7496)
0x9430ff9d9c0     0  d2800110       movz x16, #0x8
0x9430ff9d9c4     4  a9be43e7       stp x7, x16, [sp, #-32]!
0x9430ff9d9c8     8  a9017bfd       stp fp, lr, [sp, #16]
0x9430ff9d9cc     c  910043fd       add fp, sp, #0x10 (16)
0x9430ff9d9d0    10  d10a43ff       sub sp, sp, #0x290 (656)
0x9430ff9d9d4    14  f841f0e6       ldur x6, [x7, #31]
0x9430ff9d9d8    18  f8520348       ldur x8, [x26, #-224]
0x9430ff9d9dc    1c  f9013fe0       str x0, [sp, #632]
0x9430ff9d9e0    20  f90133e6       str x6, [sp, #608]
0x9430ff9d9e4    24  eb2863ff       cmp sp, x8
0x9430ff9d9e8    28  5400d169       b.ls #+0x1a2c (addr 0x9430ff9f414)
0x9430ff9d9ec    2c  f842f0e8       ldur x8, [x7, #47]
0x9430ff9d9f0    30  b9400109       ldr w9, [x8]
0x9430ff9d9f4    34  51048124       sub w4, w9, #0x120 (288)
0x9430ff9d9f8    38  b9000104       str w4, [x8]
0x9430ff9d9fc    3c  2a0003e9       mov w9, w0
0x9430ff9da00    40  910240ca       add x10, x6, #0x90 (144)
0x9430ff9da04    44  fc696944       ldr d4, [x10, x9]
0x9430ff9da08    48  5e0c0481       mov s1, v4.s[1]
0x9430ff9da0c    4c  52a75010       movz w16, #0x3a800000
0x9430ff9da10    50  1e270205       fmov s5, w16
0x9430ff9da14    54  1e250826       fmul s6, s1, s5
0x9430ff9da18    58  5e040480       mov s0, v4.s[0]
0x9430ff9da1c    5c  1e250805       fmul s5, s0, s5
0x9430ff9da20    60  9102812a       add x10, x9, #0xa0 (160)
0x9430ff9da24    64  bc6a68c7       ldr s7, [x6, x10]
0x9430ff9da28    68  1e2720e0       fcmp s7, s7
0x9430ff9da2c    6c  1e271ca7       fcsel s7, s5, s7, ne
0x9430ff9da30    70  1e2520a0       fcmp s5, s5
0x9430ff9da34    74  1e251ce5       fcsel s5, s7, s5, ne
0x9430ff9da38    78  1e2720a0       fcmp s5, s7
0x9430ff9da3c    7c  1e253ce5       fcsel s5, s7, s5, lo
0x9430ff9da40    80  1e2520a0       fcmp s5, s5
0x9430ff9da44    84  1e251cc5       fcsel s5, s6, s5, ne
0x9430ff9da48    88  1e2620c0       fcmp s6, s6
0x9430ff9da4c    8c  1e261ca6       fcsel s6, s5, s6, ne
0x9430ff9da50    90  1e2520c0       fcmp s6, s5
0x9430ff9da54    94  1e263ca5       fcsel s5, s5, s6, lo
0x9430ff9da58    98  52840010       movz w16, #0x2000
0x9430ff9da5c    9c  72a7f010       movk w16, #0x3f80, lsl #16
0x9430ff9da60    a0  1e270206       fmov s6, w16
0x9430ff9da64    a4  1e2608a5       fmul s5, s5, s6
0x9430ff9da68    a8  1e2e1006       fmov s6, #0x70 (1.0000)
0x9430ff9da6c    ac  1e2518c5       fdiv s5, s6, s5
0x9430ff9da70    b0  9102112b       add x11, x9, #0x84 (132)
0x9430ff9da74    b4  bc2b68c5       str s5, [x6, x11]
0x9430ff9da78    b8  4e0404a7       dup v7.4s, v5.s[0]
0x9430ff9da7c    bc  6e27dc84       fmul v4.4s, v4.4s, v7.4s
0x9430ff9da80    c0  4ea18884       frintp v4.4s, v4.4s
0x9430ff9da84    c4  5e040487       mov s7, v4.s[0]
0x9430ff9da88    c8  1e22c0e8       fcvt d8, s7
0x9430ff9da8c    cc  1e65c109       frintz d9, d8
0x9430ff9da90    d0  1e79012c       fcvtzu w12, d9
0x9430ff9da94    d4  1e63018a       ucvtf d10, w12
0x9430ff9da98    d8  f90147e8       str x8, [sp, #648]
0x9430ff9da9c    dc  f90143e4       str x4, [sp, #640]
0x9430ff9daa0    e0  f9001be9       str x9, [sp, #48]
0x9430ff9daa4    e4  fd010be1       str d1, [sp, #528]
0x9430ff9daa8    e8  fd010fe0       str d0, [sp, #536]
0x9430ff9daac    ec  f9013bea       str x10, [sp, #624]
0x9430ff9dab0    f0  fd0117e5       str d5, [sp, #552]
0x9430ff9dab4    f4  f9001feb       str x11, [sp, #56]
0x9430ff9dab8    f8  1e6a2120       fcmp d9, d10
0x9430ff9dabc    fc  5400cb61       b.ne #+0x196c (addr 0x9430ff9f428)
0x9430ff9dac0   100  4e040d87       dup v7.4s, w12
0x9430ff9dac4   104  5e0c0488       mov s8, v4.s[1]
0x9430ff9dac8   108  1e22c109       fcvt d9, s8
0x9430ff9dacc   10c  1e65c12a       frintz d10, d9
0x9430ff9dad0   110  1e79014c       fcvtzu w12, d10
0x9430ff9dad4   114  1e63018b       ucvtf d11, w12
0x9430ff9dad8   118  1e6b2140       fcmp d10, d11
0x9430ff9dadc   11c  5400cbc1       b.ne #+0x1978 (addr 0x9430ff9f454)
0x9430ff9dae0   120  4e0c1d87       mov v7.s[1], w12
0x9430ff9dae4   124  4f000428       movi v8.4s, #0x1, lsl #0
0x9430ff9dae8   128  6ea864e7       umax v7.4s, v7.4s, v8.4s
0x9430ff9daec   12c  6f00e409       movi v9.2d, #0x0
0x9430ff9daf0   130  6ea0c88a       fcmge v10.4s, v4.4s, #0.0
0x9430ff9daf4   134  52a9f010       movz w16, #0x4f800000
0x9430ff9daf8   138  4e040e0b       dup v11.4s, w16
0x9430ff9dafc   13c  6ea4e564       fcmgt v4.4s, v11.4s, v4.4s
0x9430ff9db00   140  4e241d44       and v4.16b, v10.16b, v4.16b
0x9430ff9db04   144  6e681ce4       bsl v4.16b, v7.16b, v8.16b
0x9430ff9db08   148  910220cc       add x12, x6, #0x88 (136)
0x9430ff9db0c   14c  8b09018c       add x12, x12, x9
0x9430ff9db10   150  0d008584       st1 {v4.d}[0], [x12]
0x9430ff9db14   154  9103312c       add x12, x9, #0xcc (204)
0x9430ff9db18   158  b86c68cc       ldr w12, [x6, x12]
0x9430ff9db1c   15c  9100e08d       add x13, x4, #0x38 (56)
0x9430ff9db20   160  b82d68cc       str w12, [x6, x13]
0x9430ff9db24   164  9103112c       add x12, x9, #0xc4 (196)
0x9430ff9db28   168  f86c68cc       ldr x12, [x6, x12]
0x9430ff9db2c   16c  9100c08d       add x13, x4, #0x30 (48)
0x9430ff9db30   170  f82d68cc       str x12, [x6, x13]
0x9430ff9db34   174  1101800c       add w12, w0, #0x60 (96)
0x9430ff9db38   178  9100112d       add x13, x9, #0x4 (4)
0x9430ff9db3c   17c  b86d68c2       ldr w2, [x6, x13]
0x9430ff9db40   180  9100212e       add x14, x9, #0x8 (8)
0x9430ff9db44   184  b86e68c3       ldr w3, [x6, x14]
0x9430ff9db48   188  9100412f       add x15, x9, #0x10 (16)
0x9430ff9db4c   18c  b86f68d3       ldr w19, [x6, x15]
0x9430ff9db50   190  91005134       add x20, x9, #0x14 (20)
0x9430ff9db54   194  b87468c5       ldr w5, [x6, x20]
0x9430ff9db58   198  3d804fe8       str q8, [sp, #304]
0x9430ff9db5c   19c  3d807fe9       str q9, [sp, #496]
0x9430ff9db60   1a0  f90037ed       str x13, [sp, #104]
0x9430ff9db64   1a4  f900efee       str x14, [sp, #472]
0x9430ff9db68   1a8  f90023ef       str x15, [sp, #64]
0x9430ff9db6c   1ac  f90043f4       str x20, [sp, #128]
0x9430ff9db70   1b0  aa0c03e0       mov x0, x12
0x9430ff9db74   1b4  aa1303e4       mov x4, x19
0x9430ff9db78   1b8  97fc0ec1       bl #-0xfc4fc (addr 0x9430fea167c)
0x9430ff9db7c   1bc  f9401be6       ldr x6, [sp, #48]
0x9430ff9db80   1c0  9100e0c8       add x8, x6, #0x38 (56)
0x9430ff9db84   1c4  f94133e9       ldr x9, [sp, #608]
0x9430ff9db88   1c8  b828693f       str wzr, [x9, x8]
0x9430ff9db8c   1cc  f9413fea       ldr x10, [sp, #632]
0x9430ff9db90   1d0  11028142       add w2, w10, #0xa0 (160)
0x9430ff9db94   1d4  9101f0cb       add x11, x6, #0x7c (124)
0x9430ff9db98   1d8  b86b692b       ldr w11, [x9, x11]
0x9430ff9db9c   1dc  910200cc       add x12, x6, #0x80 (128)
0x9430ff9dba0   1e0  b86c692c       ldr w12, [x9, x12]
0x9430ff9dba4   1e4  0b0c096c       add w12, w11, w12, lsl #2
0x9430ff9dba8   1e8  f940efed       ldr x13, [sp, #472]
0x9430ff9dbac   1ec  b86d692e       ldr w14, [x9, x13]
0x9430ff9dbb0   1f0  f94037ef       ldr x15, [sp, #104]
0x9430ff9dbb4   1f4  b86f6933       ldr w19, [x9, x15]
0x9430ff9dbb8   1f8  1100c140       add w0, w10, #0x30 (48)
0x9430ff9dbbc   1fc  f900f7e8       str x8, [sp, #488]
0x9430ff9dbc0   200  f90113e2       str x2, [sp, #544]
0x9430ff9dbc4   204  f9011feb       str x11, [sp, #568]
0x9430ff9dbc8   208  f9011bec       str x12, [sp, #560]
0x9430ff9dbcc   20c  f90137ee       str x14, [sp, #616]
0x9430ff9dbd0   210  f9012ff3       str x19, [sp, #600]
0x9430ff9dbd4   214  f9012be0       str x0, [sp, #592]
0x9430ff9dbd8   218  aa0b03f5       mov x21, x11
0x9430ff9dbdc   21c  d2800014       movz x20, #0x0
0x9430ff9dbe0   220  fd4117e5       ldr d5, [sp, #552]
0x9430ff9dbe4   224  f8520356       ldur x22, [x26, #-224]
0x9430ff9dbe8   228  eb3663ff       cmp sp, x22
0x9430ff9dbec   22c  5400c449       b.ls #+0x1888 (addr 0x9430ff9f474)
0x9430ff9dbf0   230  6b0c02bf       cmp w21, w12
0x9430ff9dbf4   234  54000120       b.eq #+0x24 (addr 0x9430ff9dc18)
0x9430ff9dbf8   238  b8756936       ldr w22, [x9, x21]
0x9430ff9dbfc   23c  110012b5       add w21, w21, #0x4 (4)
0x9430ff9dc00   240  6b1601df       cmp w14, w22
0x9430ff9dc04   244  54ffff09       b.ls #-0x20 (addr 0x9430ff9dbe4)
0x9430ff9dc08   248  0b160a76       add w22, w19, w22, lsl #2
0x9430ff9dc0c   24c  bc766925       ldr s5, [x9, x22]
0x9430ff9dc10   250  d2800036       movz x22, #0x1
0x9430ff9dc14   254  14000003       b #+0xc (addr 0x9430ff9dc20)
0x9430ff9dc18   258  d2800016       movz x22, #0x0
0x9430ff9dc1c   25c  aa0c03f5       mov x21, x12
0x9430ff9dc20   260  fd0117e5       str d5, [sp, #552]
0x9430ff9dc24   264  f90123f5       str x21, [sp, #576]
0x9430ff9dc28   268  710006df       cmp w22, #0x1 (1)
0x9430ff9dc2c   26c  540004a1       b.ne #+0x94 (addr 0x9430ff9dcc0)
0x9430ff9dc30   270  9100c0d6       add x22, x6, #0x30 (48)
0x9430ff9dc34   274  b8766936       ldr w22, [x9, x22]
0x9430ff9dc38   278  6b16029f       cmp w20, w22
0x9430ff9dc3c   27c  54000261       b.ne #+0x4c (addr 0x9430ff9dc88)
0x9430ff9dc40   280  d2800023       movz x3, #0x1
0x9430ff9dc44   284  f90127f4       str x20, [sp, #584]
0x9430ff9dc48   288  f9414be7       ldr x7, [sp, #656]
0x9430ff9dc4c   28c  aa1403e2       mov x2, x20
0x9430ff9dc50   290  97fc0e8c       bl #-0xfc5d0 (addr 0x9430fea1680)
0x9430ff9dc54   294  f94133e9       ldr x9, [sp, #608]
0x9430ff9dc58   298  f9401be6       ldr x6, [sp, #48]
0x9430ff9dc5c   29c  f94037ef       ldr x15, [sp, #104]
0x9430ff9dc60   2a0  f940efed       ldr x13, [sp, #472]
0x9430ff9dc64   2a4  f940f7e8       ldr x8, [sp, #488]
0x9430ff9dc68   2a8  f9411bec       ldr x12, [sp, #560]
0x9430ff9dc6c   2ac  f9413fea       ldr x10, [sp, #632]
0x9430ff9dc70   2b0  fd4117e5       ldr d5, [sp, #552]
0x9430ff9dc74   2b4  f94123f5       ldr x21, [sp, #576]
0x9430ff9dc78   2b8  f94127f4       ldr x20, [sp, #584]
0x9430ff9dc7c   2bc  f9412be0       ldr x0, [sp, #592]
0x9430ff9dc80   2c0  f9412ff3       ldr x19, [sp, #600]
0x9430ff9dc84   2c4  f94137ee       ldr x14, [sp, #616]
0x9430ff9dc88   2c8  1100068b       add w11, w20, #0x1 (1)
0x9430ff9dc8c   2cc  aa0903f0       mov x16, x9
0x9430ff9dc90   2d0  aa0803e9       mov x9, x8
0x9430ff9dc94   2d4  aa1003e8       mov x8, x16
0x9430ff9dc98   2d8  b829690b       str w11, [x8, x9]
0x9430ff9dc9c   2dc  9100d0d6       add x22, x6, #0x34 (52)
0x9430ff9dca0   2e0  b8766916       ldr w22, [x8, x22]
0x9430ff9dca4   2e4  0b140ad4       add w20, w22, w20, lsl #2
0x9430ff9dca8   2e8  bc346905       str s5, [x8, x20]
0x9430ff9dcac   2ec  aa0903f0       mov x16, x9
0x9430ff9dcb0   2f0  aa0803e9       mov x9, x8
0x9430ff9dcb4   2f4  aa1003e8       mov x8, x16
0x9430ff9dcb8   2f8  aa0b03f4       mov x20, x11
0x9430ff9dcbc   2fc  17ffffca       b #-0xd8 (addr 0x9430ff9dbe4)
0x9430ff9dcc0   300  910110cb       add x11, x6, #0x44 (68)
0x9430ff9dcc4   304  b82b693f       str wzr, [x9, x11]
0x9430ff9dcc8   308  f94043ee       ldr x14, [sp, #128]
0x9430ff9dccc   30c  b86e6933       ldr w19, [x9, x14]
0x9430ff9dcd0   310  f94023f4       ldr x20, [sp, #64]
0x9430ff9dcd4   314  b8746935       ldr w21, [x9, x20]
0x9430ff9dcd8   318  1100f140       add w0, w10, #0x3c (60)
0x9430ff9dcdc   31c  f9012feb       str x11, [sp, #600]
0x9430ff9dce0   320  f90127f3       str x19, [sp, #584]
0x9430ff9dce4   324  f9012bf5       str x21, [sp, #592]
0x9430ff9dce8   328  f90103e0       str x0, [sp, #512]
0x9430ff9dcec   32c  aa0c03f6       mov x22, x12
0x9430ff9dcf0   330  f9411fec       ldr x12, [sp, #568]
0x9430ff9dcf4   334  d2800002       movz x2, #0x0
0x9430ff9dcf8   338  f8520357       ldur x23, [x26, #-224]
0x9430ff9dcfc   33c  eb3763ff       cmp sp, x23
0x9430ff9dd00   340  5400bde9       b.ls #+0x17bc (addr 0x9430ff9f4bc)
0x9430ff9dd04   344  6b16019f       cmp w12, w22
0x9430ff9dd08   348  54000120       b.eq #+0x24 (addr 0x9430ff9dd2c)
0x9430ff9dd0c   34c  b86c6937       ldr w23, [x9, x12]
0x9430ff9dd10   350  1100118c       add w12, w12, #0x4 (4)
0x9430ff9dd14   354  6b17027f       cmp w19, w23
0x9430ff9dd18   358  54ffff09       b.ls #-0x20 (addr 0x9430ff9dcf8)
0x9430ff9dd1c   35c  0b170ab7       add w23, w21, w23, lsl #2
0x9430ff9dd20   360  bc776925       ldr s5, [x9, x23]
0x9430ff9dd24   364  d2800037       movz x23, #0x1
0x9430ff9dd28   368  14000003       b #+0xc (addr 0x9430ff9dd34)
0x9430ff9dd2c   36c  d2800017       movz x23, #0x0
0x9430ff9dd30   370  aa1603ec       mov x12, x22
0x9430ff9dd34   374  fd0117e5       str d5, [sp, #552]
0x9430ff9dd38   378  f90123ec       str x12, [sp, #576]
0x9430ff9dd3c   37c  710006ff       cmp w23, #0x1 (1)
0x9430ff9dd40   380  540003e1       b.ne #+0x7c (addr 0x9430ff9ddbc)
0x9430ff9dd44   384  9100f0d7       add x23, x6, #0x3c (60)
0x9430ff9dd48   388  b8776937       ldr w23, [x9, x23]
0x9430ff9dd4c   38c  6b17005f       cmp w2, w23
0x9430ff9dd50   390  54000261       b.ne #+0x4c (addr 0x9430ff9dd9c)
0x9430ff9dd54   394  f90137e2       str x2, [sp, #616]
0x9430ff9dd58   398  f9414be7       ldr x7, [sp, #656]
0x9430ff9dd5c   39c  d2800023       movz x3, #0x1
0x9430ff9dd60   3a0  97fc0e48       bl #-0xfc6e0 (addr 0x9430fea1680)
0x9430ff9dd64   3a4  f94133e9       ldr x9, [sp, #608]
0x9430ff9dd68   3a8  f9401be6       ldr x6, [sp, #48]
0x9430ff9dd6c   3ac  f94023f4       ldr x20, [sp, #64]
0x9430ff9dd70   3b0  f94043ee       ldr x14, [sp, #128]
0x9430ff9dd74   3b4  f940f7e8       ldr x8, [sp, #488]
0x9430ff9dd78   3b8  f9412feb       ldr x11, [sp, #600]
0x9430ff9dd7c   3bc  f9411bf6       ldr x22, [sp, #560]
0x9430ff9dd80   3c0  f9413fea       ldr x10, [sp, #632]
0x9430ff9dd84   3c4  fd4117e5       ldr d5, [sp, #552]
0x9430ff9dd88   3c8  f94123ec       ldr x12, [sp, #576]
0x9430ff9dd8c   3cc  f94137e2       ldr x2, [sp, #616]
0x9430ff9dd90   3d0  f94103e0       ldr x0, [sp, #512]
0x9430ff9dd94   3d4  f9412bf5       ldr x21, [sp, #592]
0x9430ff9dd98   3d8  f94127f3       ldr x19, [sp, #584]
0x9430ff9dd9c   3dc  1100044d       add w13, w2, #0x1 (1)
0x9430ff9dda0   3e0  b82b692d       str w13, [x9, x11]
0x9430ff9dda4   3e4  910100cf       add x15, x6, #0x40 (64)
0x9430ff9dda8   3e8  b86f692f       ldr w15, [x9, x15]
0x9430ff9ddac   3ec  0b0209ef       add w15, w15, w2, lsl #2
0x9430ff9ddb0   3f0  bc2f6925       str s5, [x9, x15]
0x9430ff9ddb4   3f4  aa0d03e2       mov x2, x13
0x9430ff9ddb8   3f8  17ffffd0       b #-0xc0 (addr 0x9430ff9dcf8)
0x9430ff9ddbc   3fc  910140cc       add x12, x6, #0x50 (80)
0x9430ff9ddc0   400  b82c693f       str wzr, [x9, x12]
0x9430ff9ddc4   404  910080cd       add x13, x6, #0x20 (32)
0x9430ff9ddc8   408  b86d692f       ldr w15, [x9, x13]
0x9430ff9ddcc   40c  910070d3       add x19, x6, #0x1c (28)
0x9430ff9ddd0   410  b8736935       ldr w21, [x9, x19]
0x9430ff9ddd4   414  11012140       add w0, w10, #0x48 (72)
0x9430ff9ddd8   418  f9012bec       str x12, [sp, #592]
0x9430ff9dddc   41c  f9002fed       str x13, [sp, #88]
0x9430ff9dde0   420  f90103ef       str x15, [sp, #512]
0x9430ff9dde4   424  f90047f3       str x19, [sp, #136]
0x9430ff9dde8   428  f90123f5       str x21, [sp, #576]
0x9430ff9ddec   42c  f90107e0       str x0, [sp, #520]
0x9430ff9ddf0   430  aa1603f7       mov x23, x22
0x9430ff9ddf4   434  f9411ff6       ldr x22, [sp, #568]
0x9430ff9ddf8   438  d2800002       movz x2, #0x0
0x9430ff9ddfc   43c  f8520358       ldur x24, [x26, #-224]
0x9430ff9de00   440  eb3863ff       cmp sp, x24
0x9430ff9de04   444  5400b829       b.ls #+0x1704 (addr 0x9430ff9f508)
0x9430ff9de08   448  6b1702df       cmp w22, w23
0x9430ff9de0c   44c  54000120       b.eq #+0x24 (addr 0x9430ff9de30)
0x9430ff9de10   450  b8766938       ldr w24, [x9, x22]
0x9430ff9de14   454  110012d6       add w22, w22, #0x4 (4)
0x9430ff9de18   458  6b1801ff       cmp w15, w24
0x9430ff9de1c   45c  54ffff09       b.ls #-0x20 (addr 0x9430ff9ddfc)
0x9430ff9de20   460  0b180ab8       add w24, w21, w24, lsl #2
0x9430ff9de24   464  bc786925       ldr s5, [x9, x24]
0x9430ff9de28   468  d2800038       movz x24, #0x1
0x9430ff9de2c   46c  14000003       b #+0xc (addr 0x9430ff9de38)
0x9430ff9de30   470  d2800018       movz x24, #0x0
0x9430ff9de34   474  aa1703f6       mov x22, x23
0x9430ff9de38   478  fd0117e5       str d5, [sp, #552]
0x9430ff9de3c   47c  f90127f6       str x22, [sp, #584]
0x9430ff9de40   480  7100071f       cmp w24, #0x1 (1)
0x9430ff9de44   484  540003e1       b.ne #+0x7c (addr 0x9430ff9dec0)
0x9430ff9de48   488  910120d8       add x24, x6, #0x48 (72)
0x9430ff9de4c   48c  b8786938       ldr w24, [x9, x24]
0x9430ff9de50   490  6b18005f       cmp w2, w24
0x9430ff9de54   494  54000261       b.ne #+0x4c (addr 0x9430ff9dea0)
0x9430ff9de58   498  f90137e2       str x2, [sp, #616]
0x9430ff9de5c   49c  f9414be7       ldr x7, [sp, #656]
0x9430ff9de60   4a0  d2800023       movz x3, #0x1
0x9430ff9de64   4a4  97fc0e07       bl #-0xfc7e4 (addr 0x9430fea1680)
0x9430ff9de68   4a8  f94133e9       ldr x9, [sp, #608]
0x9430ff9de6c   4ac  f9401be6       ldr x6, [sp, #48]
0x9430ff9de70   4b0  f94047f3       ldr x19, [sp, #136]
0x9430ff9de74   4b4  f9402fed       ldr x13, [sp, #88]
0x9430ff9de78   4b8  f9412feb       ldr x11, [sp, #600]
0x9430ff9de7c   4bc  f9412bec       ldr x12, [sp, #592]
0x9430ff9de80   4c0  f9411bf7       ldr x23, [sp, #560]
0x9430ff9de84   4c4  fd4117e5       ldr d5, [sp, #552]
0x9430ff9de88   4c8  f9413fea       ldr x10, [sp, #632]
0x9430ff9de8c   4cc  f94127f6       ldr x22, [sp, #584]
0x9430ff9de90   4d0  f94137e2       ldr x2, [sp, #616]
0x9430ff9de94   4d4  f94107e0       ldr x0, [sp, #520]
0x9430ff9de98   4d8  f94123f5       ldr x21, [sp, #576]
0x9430ff9de9c   4dc  f94103ef       ldr x15, [sp, #512]
0x9430ff9dea0   4e0  11000448       add w8, w2, #0x1 (1)
0x9430ff9dea4   4e4  b82c6928       str w8, [x9, x12]
0x9430ff9dea8   4e8  910130ce       add x14, x6, #0x4c (76)
0x9430ff9deac   4ec  b86e692e       ldr w14, [x9, x14]
0x9430ff9deb0   4f0  0b0209ce       add w14, w14, w2, lsl #2
0x9430ff9deb4   4f4  bc2e6925       str s5, [x9, x14]
0x9430ff9deb8   4f8  aa0803e2       mov x2, x8
0x9430ff9debc   4fc  17ffffd0       b #-0xc0 (addr 0x9430ff9ddfc)
0x9430ff9dec0   500  910170c8       add x8, x6, #0x5c (92)
0x9430ff9dec4   504  b828693f       str wzr, [x9, x8]
0x9430ff9dec8   508  9100b0ce       add x14, x6, #0x2c (44)
0x9430ff9decc   50c  b86e692f       ldr w15, [x9, x14]
0x9430ff9ded0   510  9100a0d4       add x20, x6, #0x28 (40)
0x9430ff9ded4   514  b8746935       ldr w21, [x9, x20]
0x9430ff9ded8   518  11015140       add w0, w10, #0x54 (84)
0x9430ff9dedc   51c  f90137e8       str x8, [sp, #616]
0x9430ff9dee0   520  f9004bee       str x14, [sp, #144]
0x9430ff9dee4   524  f900f3ef       str x15, [sp, #480]
0x9430ff9dee8   528  f90033f4       str x20, [sp, #96]
0x9430ff9deec   52c  f90107f5       str x21, [sp, #520]
0x9430ff9def0   530  f9013fe0       str x0, [sp, #632]
0x9430ff9def4   534  d2800002       movz x2, #0x0
0x9430ff9def8   538  f9411fea       ldr x10, [sp, #568]
0x9430ff9defc   53c  aa1703f6       mov x22, x23
0x9430ff9df00   540  14000004       b #+0x10 (addr 0x9430ff9df10)
0x9430ff9df04   544  aa0903f0       mov x16, x9
0x9430ff9df08   548  aa0803e9       mov x9, x8
0x9430ff9df0c   54c  aa1003e8       mov x8, x16
0x9430ff9df10   550  f8520357       ldur x23, [x26, #-224]
0x9430ff9df14   554  eb3763ff       cmp sp, x23
0x9430ff9df18   558  5400b1e9       b.ls #+0x163c (addr 0x9430ff9f554)
0x9430ff9df1c   55c  6b16015f       cmp w10, w22
0x9430ff9df20   560  540001a0       b.eq #+0x34 (addr 0x9430ff9df54)
0x9430ff9df24   564  b86a6937       ldr w23, [x9, x10]
0x9430ff9df28   568  1100114a       add w10, w10, #0x4 (4)
0x9430ff9df2c   56c  6b1701ff       cmp w15, w23
0x9430ff9df30   570  540000a9       b.ls #+0x14 (addr 0x9430ff9df44)
0x9430ff9df34   574  0b170ab7       add w23, w21, w23, lsl #2
0x9430ff9df38   578  bc776925       ldr s5, [x9, x23]
0x9430ff9df3c   57c  d2800037       movz x23, #0x1
0x9430ff9df40   580  14000007       b #+0x1c (addr 0x9430ff9df5c)
0x9430ff9df44   584  aa0803f0       mov x16, x8
0x9430ff9df48   588  aa0903e8       mov x8, x9
0x9430ff9df4c   58c  aa1003e9       mov x9, x16
0x9430ff9df50   590  17ffffed       b #-0x4c (addr 0x9430ff9df04)
0x9430ff9df54   594  d2800017       movz x23, #0x0
0x9430ff9df58   598  aa1603ea       mov x10, x22
0x9430ff9df5c   59c  f9011fea       str x10, [sp, #568]
0x9430ff9df60   5a0  fd0117e5       str d5, [sp, #552]
0x9430ff9df64   5a4  710006ff       cmp w23, #0x1 (1)
0x9430ff9df68   5a8  54000421       b.ne #+0x84 (addr 0x9430ff9dfec)
0x9430ff9df6c   5ac  910150d7       add x23, x6, #0x54 (84)
0x9430ff9df70   5b0  b8776937       ldr w23, [x9, x23]
0x9430ff9df74   5b4  6b17005f       cmp w2, w23
0x9430ff9df78   5b8  54000241       b.ne #+0x48 (addr 0x9430ff9dfc0)
0x9430ff9df7c   5bc  f90127e2       str x2, [sp, #584]
0x9430ff9df80   5c0  f9414be7       ldr x7, [sp, #656]
0x9430ff9df84   5c4  d2800023       movz x3, #0x1
0x9430ff9df88   5c8  97fc0dbe       bl #-0xfc908 (addr 0x9430fea1680)
0x9430ff9df8c   5cc  f94133e9       ldr x9, [sp, #608]
0x9430ff9df90   5d0  f9401be6       ldr x6, [sp, #48]
0x9430ff9df94   5d4  f94033f4       ldr x20, [sp, #96]
0x9430ff9df98   5d8  f9404bee       ldr x14, [sp, #144]
0x9430ff9df9c   5dc  f94137e8       ldr x8, [sp, #616]
0x9430ff9dfa0   5e0  f9412bec       ldr x12, [sp, #592]
0x9430ff9dfa4   5e4  f94127e2       ldr x2, [sp, #584]
0x9430ff9dfa8   5e8  f9411fea       ldr x10, [sp, #568]
0x9430ff9dfac   5ec  fd4117e5       ldr d5, [sp, #552]
0x9430ff9dfb0   5f0  f9413fe0       ldr x0, [sp, #632]
0x9430ff9dfb4   5f4  f9411bf6       ldr x22, [sp, #560]
0x9430ff9dfb8   5f8  f94107f5       ldr x21, [sp, #520]
0x9430ff9dfbc   5fc  f940f3ef       ldr x15, [sp, #480]
0x9430ff9dfc0   600  1100044b       add w11, w2, #0x1 (1)
0x9430ff9dfc4   604  aa0903f0       mov x16, x9
0x9430ff9dfc8   608  aa0803e9       mov x9, x8
0x9430ff9dfcc   60c  aa1003e8       mov x8, x16
0x9430ff9dfd0   610  b829690b       str w11, [x8, x9]
0x9430ff9dfd4   614  910160cd       add x13, x6, #0x58 (88)
0x9430ff9dfd8   618  b86d690d       ldr w13, [x8, x13]
0x9430ff9dfdc   61c  0b0209ad       add w13, w13, w2, lsl #2
0x9430ff9dfe0   620  bc2d6905       str s5, [x8, x13]
0x9430ff9dfe4   624  aa0b03e2       mov x2, x11
0x9430ff9dfe8   628  17ffffc7       b #-0xe4 (addr 0x9430ff9df04)
0x9430ff9dfec   62c  f940f7ea       ldr x10, [sp, #488]
0x9430ff9dff0   630  b86a692b       ldr w11, [x9, x10]
0x9430ff9dff4   634  9100c0cd       add x13, x6, #0x30 (48)
0x9430ff9dff8   638  3ced6924       ldr q4, [x9, x13]
0x9430ff9dffc   63c  3ce66925       ldr q5, [x9, x6]
0x9430ff9e000   640  3cad6925       str q5, [x9, x13]
0x9430ff9e004   644  3ca66924       str q4, [x9, x6]
0x9430ff9e008   648  910100cd       add x13, x6, #0x40 (64)
0x9430ff9e00c   64c  3ced6924       ldr q4, [x9, x13]
0x9430ff9e010   650  f94023ef       ldr x15, [sp, #64]
0x9430ff9e014   654  3cef6925       ldr q5, [x9, x15]
0x9430ff9e018   658  3cad6925       str q5, [x9, x13]
0x9430ff9e01c   65c  3caf6924       str q4, [x9, x15]
0x9430ff9e020   660  f86c6933       ldr x19, [x9, x12]
0x9430ff9e024   664  910160d5       add x21, x6, #0x58 (88)
0x9430ff9e028   668  b8756936       ldr w22, [x9, x21]
0x9430ff9e02c   66c  f9402ff7       ldr x23, [sp, #88]
0x9430ff9e030   670  3cf76924       ldr q4, [x9, x23]
0x9430ff9e034   674  3cac6924       str q4, [x9, x12]
0x9430ff9e038   678  b86e6938       ldr w24, [x9, x14]
0x9430ff9e03c   67c  b82e6922       str w2, [x9, x14]
0x9430ff9e040   680  b8346936       str w22, [x9, x20]
0x9430ff9e044   684  f8376933       str x19, [x9, x23]
0x9430ff9e048   688  f9013feb       str x11, [sp, #632]
0x9430ff9e04c   68c  3500010b       cbnz w11, #+0x20 (addr 0x9430ff9e06c)
0x9430ff9e050   690  f94143e4       ldr x4, [sp, #640]
0x9430ff9e054   694  11048086       add w6, w4, #0x120 (288)
0x9430ff9e058   698  f94147f3       ldr x19, [sp, #648]
0x9430ff9e05c   69c  b9000266       str w6, [x19]
0x9430ff9e060   6a0  910003bf       mov sp, fp
0x9430ff9e064   6a4  a8c17bfd       ldp fp, lr, [sp], #16
0x9430ff9e068   6a8  d65f03c0       ret
0x9430ff9e06c   6ac  b86c692c       ldr w12, [x9, x12]
0x9430ff9e070   6b0  f9412ff3       ldr x19, [sp, #600]
0x9430ff9e074   6b4  b8736933       ldr w19, [x9, x19]
0x9430ff9e078   6b8  b86a692a       ldr w10, [x9, x10]
0x9430ff9e07c   6bc  6b0a027f       cmp w19, w10
0x9430ff9e080   6c0  1a8a3276       csel w22, w19, w10, lo
0x9430ff9e084   6c4  6b16019f       cmp w12, w22
0x9430ff9e088   6c8  1a96318a       csel w10, w12, w22, lo
0x9430ff9e08c   6cc  b875692c       ldr w12, [x9, x21]
0x9430ff9e090   6d0  910130d3       add x19, x6, #0x4c (76)
0x9430ff9e094   6d4  b8736933       ldr w19, [x9, x19]
0x9430ff9e098   6d8  b86d692d       ldr w13, [x9, x13]
0x9430ff9e09c   6dc  9100d0d5       add x21, x6, #0x34 (52)
0x9430ff9e0a0   6e0  b8756935       ldr w21, [x9, x21]
0x9430ff9e0a4   6e4  b8686928       ldr w8, [x9, x8]
0x9430ff9e0a8   6e8  f9413bf6       ldr x22, [sp, #624]
0x9430ff9e0ac   6ec  bc766924       ldr s4, [x9, x22]
0x9430ff9e0b0   6f0  1e240881       fmul s1, s4, s4
0x9430ff9e0b4   6f4  4e040424       dup v4.4s, v1.s[0]
0x9430ff9e0b8   6f8  910290d6       add x22, x6, #0xa4 (164)
0x9430ff9e0bc   6fc  bc766925       ldr s5, [x9, x22]
0x9430ff9e0c0   700  1e2508a0       fmul s0, s5, s5
0x9430ff9e0c4   704  4e040405       dup v5.4s, v0.s[0]
0x9430ff9e0c8   708  f9011bea       str x10, [sp, #560]
0x9430ff9e0cc   70c  f9012fec       str x12, [sp, #600]
0x9430ff9e0d0   710  f90127f3       str x19, [sp, #584]
0x9430ff9e0d4   714  f90123ed       str x13, [sp, #576]
0x9430ff9e0d8   718  f9011ff5       str x21, [sp, #568]
0x9430ff9e0dc   71c  f900f7e8       str x8, [sp, #488]
0x9430ff9e0e0   720  fd00cfe1       str d1, [sp, #408]
0x9430ff9e0e4   724  3d804be4       str q4, [sp, #288]
0x9430ff9e0e8   728  fd00cbe0       str d0, [sp, #400]
0x9430ff9e0ec   72c  3d8047e5       str q5, [sp, #272]
0x9430ff9e0f0   730  f940eff9       ldr x25, [sp, #472]
0x9430ff9e0f4   734  f90137f8       str x24, [sp, #616]
0x9430ff9e0f8   738  1e2e1008       fmov s8, #0x70 (1.0000)
0x9430ff9e0fc   73c  3dc04fe7       ldr q7, [sp, #304]
0x9430ff9e100   740  d2800044       movz x4, #0x2
0x9430ff9e104   744  d2800023       movz x3, #0x1
0x9430ff9e108   748  d2800002       movz x2, #0x0
0x9430ff9e10c   74c  f9401fe1       ldr x1, [sp, #56]
0x9430ff9e110   750  f94047e0       ldr x0, [sp, #136]
0x9430ff9e114   754  f94037fc       ldr x28, [sp, #104]
0x9430ff9e118   758  f94043fb       ldr cp, [sp, #128]
0x9430ff9e11c   75c  aa0203f6       mov x22, x2
0x9430ff9e120   760  f8520345       ldur x5, [x26, #-224]
0x9430ff9e124   764  eb2563ff       cmp sp, x5
0x9430ff9e128   768  5400a3a9       b.ls #+0x1474 (addr 0x9430ff9f59c)
0x9430ff9e12c   76c  b8796925       ldr w5, [x9, x25]
0x9430ff9e130   770  f90013e5       str x5, [sp, #32]
0x9430ff9e134   774  6b1600bf       cmp w5, w22
0x9430ff9e138   778  540095c9       b.ls #+0x12b8 (addr 0x9430ff9f3f0)
0x9430ff9e13c   77c  b87b6927       ldr w7, [x9, x27]
0x9430ff9e140   780  f9000be7       str x7, [sp, #16]
0x9430ff9e144   784  6b1600ff       cmp w7, w22
0x9430ff9e148   788  54009549       b.ls #+0x12a8 (addr 0x9430ff9f3f0)
0x9430ff9e14c   78c  b8776928       ldr w8, [x9, x23]
0x9430ff9e150   790  f90007e8       str x8, [sp, #8]
0x9430ff9e154   794  6b16011f       cmp w8, w22
0x9430ff9e158   798  540094c9       b.ls #+0x1298 (addr 0x9430ff9f3f0)
0x9430ff9e15c   79c  b86e6928       ldr w8, [x9, x14]
0x9430ff9e160   7a0  f9000fe8       str x8, [sp, #24]
0x9430ff9e164   7a4  6b16011f       cmp w8, w22
0x9430ff9e168   7a8  54009449       b.ls #+0x1288 (addr 0x9430ff9f3f0)
0x9430ff9e16c   7ac  b87c6928       ldr w8, [x9, x28]
0x9430ff9e170   7b0  531e76ca       lsl w10, w22, #2
0x9430ff9e174   7b4  0b0a010b       add w11, w8, w10
0x9430ff9e178   7b8  bc6b6922       ldr s2, [x9, x11]
0x9430ff9e17c   7bc  b86f692b       ldr w11, [x9, x15]
0x9430ff9e180   7c0  f90067e8       str x8, [sp, #200]
0x9430ff9e184   7c4  0b0a0168       add w8, w11, w10
0x9430ff9e188   7c8  bc686923       ldr s3, [x9, x8]
0x9430ff9e18c   7cc  b8606928       ldr w8, [x9, x0]
0x9430ff9e190   7d0  f9006feb       str x11, [sp, #216]
0x9430ff9e194   7d4  0b0a010b       add w11, w8, w10
0x9430ff9e198   7d8  bc6b6929       ldr s9, [x9, x11]
0x9430ff9e19c   7dc  b874692b       ldr w11, [x9, x20]
0x9430ff9e1a0   7e0  f90073e8       str x8, [sp, #224]
0x9430ff9e1a4   7e4  0b0a0168       add w8, w11, w10
0x9430ff9e1a8   7e8  f9012bea       str x10, [sp, #592]
0x9430ff9e1ac   7ec  bc68692a       ldr s10, [x9, x8]
0x9430ff9e1b0   7f0  f94143ea       ldr x10, [sp, #640]
0x9430ff9e1b4   7f4  91003148       add x8, x10, #0xc (12)
0x9430ff9e1b8   7f8  bc28692a       str s10, [x9, x8]
0x9430ff9e1bc   7fc  91002148       add x8, x10, #0x8 (8)
0x9430ff9e1c0   800  bc286929       str s9, [x9, x8]
0x9430ff9e1c4   804  91001148       add x8, x10, #0x4 (4)
0x9430ff9e1c8   808  bc286923       str s3, [x9, x8]
0x9430ff9e1cc   80c  bc2a6922       str s2, [x9, x10]
0x9430ff9e1d0   810  9100a148       add x8, x10, #0x28 (40)
0x9430ff9e1d4   814  b828693f       str wzr, [x9, x8]
0x9430ff9e1d8   818  f90103e8       str x8, [sp, #512]
0x9430ff9e1dc   81c  91008148       add x8, x10, #0x20 (32)
0x9430ff9e1e0   820  f828693f       str xzr, [x9, x8]
0x9430ff9e1e4   824  6f00e409       movi v9.2d, #0x0
0x9430ff9e1e8   828  f900f3e8       str x8, [sp, #480]
0x9430ff9e1ec   82c  91004148       add x8, x10, #0x10 (16)
0x9430ff9e1f0   830  3ca86929       str q9, [x9, x8]
0x9430ff9e1f4   834  f90107e8       str x8, [sp, #520]
0x9430ff9e1f8   838  910220c8       add x8, x6, #0x88 (136)
0x9430ff9e1fc   83c  b8686928       ldr w8, [x9, x8]
0x9430ff9e200   840  f9003fe8       str x8, [sp, #120]
0x9430ff9e204   844  910230c8       add x8, x6, #0x8c (140)
0x9430ff9e208   848  b8686928       ldr w8, [x9, x8]
0x9430ff9e20c   84c  bc616929       ldr s9, [x9, x1]
0x9430ff9e210   850  11010146       add w6, w10, #0x40 (64)
0x9430ff9e214   854  f9013bf6       str x22, [sp, #624]
0x9430ff9e218   858  fd00c3e2       str d2, [sp, #384]
0x9430ff9e21c   85c  fd00c7e3       str d3, [sp, #392]
0x9430ff9e220   860  f90077eb       str x11, [sp, #232]
0x9430ff9e224   864  f900ebe8       str x8, [sp, #464]
0x9430ff9e228   868  fd00e7e9       str d9, [sp, #456]
0x9430ff9e22c   86c  f90117e6       str x6, [sp, #552]
0x9430ff9e230   870  f9414be0       ldr x0, [sp, #656]
0x9430ff9e234   874  aa0203e1       mov x1, x2
0x9430ff9e238   878  aa0203e3       mov x3, x2
0x9430ff9e23c   87c  aa0603e2       mov x2, x6
0x9430ff9e240   880  d2801c04       movz x4, #0xe0
0x9430ff9e244   884  5800a5f0       ldr x16, pc+5308 (addr 0x000009430ff9f700)
0x9430ff9e248   888  10000068       adr x8, #+0xc (addr 0x9430ff9e254)
0x9430ff9e24c   88c  a9027748       stp x8, fp, [x26, #32]
0x9430ff9e250   890  d63f0200       blr x16
0x9430ff9e254   894  f900175f       str xzr, [x26, #40]
0x9430ff9e258   898  6a00001f       tst w0, w0
0x9430ff9e25c   89c  5400a4a0       b.eq #+0x1494 (addr 0x9430ff9f6f0)
0x9430ff9e260   8a0  f940ebe6       ldr x6, [sp, #464]
0x9430ff9e264   8a4  710000df       cmp w6, #0x0 (0)
0x9430ff9e268   8a8  9a9f07e8       cset x8, ne
0x9430ff9e26c   8ac  4b0800c6       sub w6, w6, w8
0x9430ff9e270   8b0  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9e274   8b4  fd40e7e4       ldr d4, [sp, #456]
0x9430ff9e278   8b8  1e240865       fmul s5, s3, s4
0x9430ff9e27c   8bc  1e2520a0       fcmp s5, s5
0x9430ff9e280   8c0  1e251de5       fcsel s5, s15, s5, ne
0x9430ff9e284   8c4  1e2020a8       fcmp s5, #0.0
0x9430ff9e288   8c8  1e2fcca5       fcsel s5, s5, s15, gt
0x9430ff9e28c   8cc  1e22c0a6       fcvt d6, s5
0x9430ff9e290   8d0  1e65c0c7       frintz d7, d6
0x9430ff9e294   8d4  1e7900e8       fcvtzu w8, d7
0x9430ff9e298   8d8  1e630108       ucvtf d8, w8
0x9430ff9e29c   8dc  1e6820e0       fcmp d7, d8
0x9430ff9e2a0   8e0  54009b61       b.ne #+0x136c (addr 0x9430ff9f60c)
0x9430ff9e2a4   8e4  6b0800df       cmp w6, w8
0x9430ff9e2a8   8e8  1a8830c9       csel w9, w6, w8, lo
0x9430ff9e2ac   8ec  52a9f010       movz w16, #0x4f800000
0x9430ff9e2b0   8f0  1e270206       fmov s6, w16
0x9430ff9e2b4   8f4  1e2620a0       fcmp s5, s6
0x9430ff9e2b8   8f8  1a9f3128       csel w8, w9, wzr, lo
0x9430ff9e2bc   8fc  7100011f       cmp w8, #0x0 (0)
0x9430ff9e2c0   900  9a9f07e9       cset x9, ne
0x9430ff9e2c4   904  4b090109       sub w9, w8, w9
0x9430ff9e2c8   908  11000508       add w8, w8, #0x1 (1)
0x9430ff9e2cc   90c  6b0800df       cmp w6, w8
0x9430ff9e2d0   910  1a8830ca       csel w10, w6, w8, lo
0x9430ff9e2d4   914  f900ebea       str x10, [sp, #464]
0x9430ff9e2d8   918  6b0a013f       cmp w9, w10
0x9430ff9e2dc   91c  54000149       b.ls #+0x28 (addr 0x9430ff9e304)
0x9430ff9e2e0   920  f94103e6       ldr x6, [sp, #512]
0x9430ff9e2e4   924  2f00e406       movi d6, #0x0
0x9430ff9e2e8   928  f94137f8       ldr x24, [sp, #616]
0x9430ff9e2ec   92c  3dc07fe4       ldr q4, [sp, #496]
0x9430ff9e2f0   930  f94143e4       ldr x4, [sp, #640]
0x9430ff9e2f4   934  f94133e9       ldr x9, [sp, #608]
0x9430ff9e2f8   938  f94107e8       ldr x8, [sp, #520]
0x9430ff9e2fc   93c  4ea41c85       mov v5.16b, v4.16b
0x9430ff9e300   940  140003dd       b #+0xf74 (addr 0x9430ff9f274)
0x9430ff9e304   944  f9403fe6       ldr x6, [sp, #120]
0x9430ff9e308   948  710000df       cmp w6, #0x0 (0)
0x9430ff9e30c   94c  9a9f07e8       cset x8, ne
0x9430ff9e310   950  4b0800c8       sub w8, w6, w8
0x9430ff9e314   954  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9e318   958  1e240844       fmul s4, s2, s4
0x9430ff9e31c   95c  1e242080       fcmp s4, s4
0x9430ff9e320   960  1e241de4       fcsel s4, s15, s4, ne
0x9430ff9e324   964  1e202088       fcmp s4, #0.0
0x9430ff9e328   968  1e2fcc84       fcsel s4, s4, s15, gt
0x9430ff9e32c   96c  1e22c085       fcvt d5, s4
0x9430ff9e330   970  1e65c0a7       frintz d7, d5
0x9430ff9e334   974  1e7900eb       fcvtzu w11, d7
0x9430ff9e338   978  1e630168       ucvtf d8, w11
0x9430ff9e33c   97c  1e6820e0       fcmp d7, d8
0x9430ff9e340   980  54009761       b.ne #+0x12ec (addr 0x9430ff9f62c)
0x9430ff9e344   984  6b0b011f       cmp w8, w11
0x9430ff9e348   988  1a8b310c       csel w12, w8, w11, lo
0x9430ff9e34c   98c  1e262080       fcmp s4, s6
0x9430ff9e350   990  1a9f318b       csel w11, w12, wzr, lo
0x9430ff9e354   994  7100017f       cmp w11, #0x0 (0)
0x9430ff9e358   998  9a9f07ec       cset x12, ne
0x9430ff9e35c   99c  4b0c016c       sub w12, w11, w12
0x9430ff9e360   9a0  f94007ee       ldr x14, [sp, #8]
0x9430ff9e364   9a4  f9400fed       ldr x13, [sp, #24]
0x9430ff9e368   9a8  6b0d01df       cmp w14, w13
0x9430ff9e36c   9ac  1a8d31cf       csel w15, w14, w13, lo
0x9430ff9e370   9b0  f9400bf3       ldr x19, [sp, #16]
0x9430ff9e374   9b4  6b0f027f       cmp w19, w15
0x9430ff9e378   9b8  1a8f3274       csel w20, w19, w15, lo
0x9430ff9e37c   9bc  f94013ef       ldr x15, [sp, #32]
0x9430ff9e380   9c0  6b1401ff       cmp w15, w20
0x9430ff9e384   9c4  1a9431f5       csel w21, w15, w20, lo
0x9430ff9e388   9c8  1100056b       add w11, w11, #0x1 (1)
0x9430ff9e38c   9cc  6b0b011f       cmp w8, w11
0x9430ff9e390   9d0  1a8b3114       csel w20, w8, w11, lo
0x9430ff9e394   9d4  11000688       add w8, w20, #0x1 (1)
0x9430ff9e398   9d8  4e040464       dup v4.4s, v3.s[0]
0x9430ff9e39c   9dc  4e040445       dup v5.4s, v2.s[0]
0x9430ff9e3a0   9e0  f9401beb       ldr x11, [sp, #48]
0x9430ff9e3a4   9e4  91019174       add x20, x11, #0x64 (100)
0x9430ff9e3a8   9e8  f94133f6       ldr x22, [sp, #608]
0x9430ff9e3ac   9ec  b8746ad4       ldr w20, [x22, x20]
0x9430ff9e3b0   9f0  9101a177       add x23, x11, #0x68 (104)
0x9430ff9e3b4   9f4  b8776ad7       ldr w23, [x22, x23]
0x9430ff9e3b8   9f8  6f00e406       movi v6.2d, #0x0
0x9430ff9e3bc   9fc  f9002bec       str x12, [sp, #80]
0x9430ff9e3c0   a00  f90063f5       str x21, [sp, #192]
0x9430ff9e3c4   a04  f90017e8       str x8, [sp, #40]
0x9430ff9e3c8   a08  3d8043e4       str q4, [sp, #256]
0x9430ff9e3cc   a0c  3d803fe5       str q5, [sp, #240]
0x9430ff9e3d0   a10  f90027f4       str x20, [sp, #72]
0x9430ff9e3d4   a14  f9003bf7       str x23, [sp, #112]
0x9430ff9e3d8   a18  4ea61cc8       mov v8.16b, v6.16b
0x9430ff9e3dc   a1c  2f00e406       movi d6, #0x0
0x9430ff9e3e0   a20  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9e3e4   a24  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9e3e8   a28  4ea61cc7       mov v7.16b, v6.16b
0x9430ff9e3ec   a2c  4ea61cc9       mov v9.16b, v6.16b
0x9430ff9e3f0   a30  14000016       b #+0x58 (addr 0x9430ff9e448)
0x9430ff9e3f4   a34  fd40e7e6       ldr d6, [sp, #456]
0x9430ff9e3f8   a38  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9e3fc   a3c  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9e400   a40  4ea91d23       mov v3.16b, v9.16b
0x9430ff9e404   a44  fd40d7e9       ldr d9, [sp, #424]
0x9430ff9e408   a48  aa0903f6       mov x22, x9
0x9430ff9e40c   a4c  aa0803e9       mov x9, x8
0x9430ff9e410   a50  f9403fe6       ldr x6, [sp, #120]
0x9430ff9e414   a54  f9402bec       ldr x12, [sp, #80]
0x9430ff9e418   a58  4eac1d81       mov v1.16b, v12.16b
0x9430ff9e41c   a5c  4eab1d60       mov v0.16b, v11.16b
0x9430ff9e420   a60  4ea51ca2       mov v2.16b, v5.16b
0x9430ff9e424   a64  f94017e8       ldr x8, [sp, #40]
0x9430ff9e428   a68  f9403bf7       ldr x23, [sp, #112]
0x9430ff9e42c   a6c  f94027f4       ldr x20, [sp, #72]
0x9430ff9e430   a70  3dc043e4       ldr q4, [sp, #256]
0x9430ff9e434   a74  3dc03fe5       ldr q5, [sp, #240]
0x9430ff9e438   a78  f94013ef       ldr x15, [sp, #32]
0x9430ff9e43c   a7c  f94007ee       ldr x14, [sp, #8]
0x9430ff9e440   a80  f9400bf3       ldr x19, [sp, #16]
0x9430ff9e444   a84  f9400fed       ldr x13, [sp, #24]
0x9430ff9e448   a88  f8520343       ldur x3, [x26, #-224]
0x9430ff9e44c   a8c  f94143e4       ldr x4, [sp, #640]
0x9430ff9e450   a90  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9e454   a94  3dc04fec       ldr q12, [sp, #304]
0x9430ff9e458   a98  3dc04beb       ldr q11, [sp, #288]
0x9430ff9e45c   a9c  3dc047ea       ldr q10, [sp, #272]
0x9430ff9e460   aa0  f94077e0       ldr x0, [sp, #232]
0x9430ff9e464   aa4  f94073fb       ldr cp, [sp, #224]
0x9430ff9e468   aa8  f9406ffc       ldr x28, [sp, #216]
0x9430ff9e46c   aac  d2800042       movz x2, #0x2
0x9430ff9e470   ab0  d2800021       movz x1, #0x1
0x9430ff9e474   ab4  f94067f9       ldr x25, [sp, #200]
0x9430ff9e478   ab8  d2800018       movz x24, #0x0
0x9430ff9e47c   abc  f90137e9       str x9, [sp, #616]
0x9430ff9e480   ac0  fd00e7e6       str d6, [sp, #456]
0x9430ff9e484   ac4  fd00e3e7       str d7, [sp, #448]
0x9430ff9e488   ac8  3d806fe8       str q8, [sp, #432]
0x9430ff9e48c   acc  fd00d7e9       str d9, [sp, #424]
0x9430ff9e490   ad0  eb2363ff       cmp sp, x3
0x9430ff9e494   ad4  54008dc9       b.ls #+0x11b8 (addr 0x9430ff9f64c)
0x9430ff9e498   ad8  1b097cc3       mul w3, w6, w9
0x9430ff9e49c   adc  0b0c0065       add w5, w3, w12
0x9430ff9e4a0   ae0  6b0502ff       cmp w23, w5
0x9430ff9e4a4   ae4  54000129       b.ls #+0x24 (addr 0x9430ff9e4c8)
0x9430ff9e4a8   ae8  0b030103       add w3, w8, w3
0x9430ff9e4ac   aec  6b0302ff       cmp w23, w3
0x9430ff9e4b0   af0  540000c9       b.ls #+0x18 (addr 0x9430ff9e4c8)
0x9430ff9e4b4   af4  0b030a83       add w3, w20, w3, lsl #2
0x9430ff9e4b8   af8  b8636ac3       ldr w3, [x22, x3]
0x9430ff9e4bc   afc  0b050a85       add w5, w20, w5, lsl #2
0x9430ff9e4c0   b00  b8656ac5       ldr w5, [x22, x5]
0x9430ff9e4c4   b04  14000003       b #+0xc (addr 0x9430ff9e4d0)
0x9430ff9e4c8   b08  aa1803e3       mov x3, x24
0x9430ff9e4cc   b0c  aa1803e5       mov x5, x24
0x9430ff9e4d0   b10  531e74a7       lsl w7, w5, #2
0x9430ff9e4d4   b14  0b070326       add w6, w25, w7
0x9430ff9e4d8   b18  4b050068       sub w8, w3, w5
0x9430ff9e4dc   b1c  6b0301ff       cmp w15, w3
0x9430ff9e4e0   b20  9a9f27e9       cset x9, lo
0x9430ff9e4e4   b24  6b05007f       cmp w3, w5
0x9430ff9e4e8   b28  9a9f27ea       cset x10, lo
0x9430ff9e4ec   b2c  2a0a012b       orr w11, w9, w10
0x9430ff9e4f0   b30  6a0b017f       tst w11, w11
0x9430ff9e4f4   b34  1a8813eb       csel w11, wzr, w8, ne
0x9430ff9e4f8   b38  f9006be3       str x3, [sp, #208]
0x9430ff9e4fc   b3c  f900b7eb       str x11, [sp, #360]
0x9430ff9e500   b40  6b05007f       cmp w3, w5
0x9430ff9e504   b44  540004c3       b.lo #+0x98 (addr 0x9430ff9e59c)
0x9430ff9e508   b48  0b070365       add w5, w27, w7
0x9430ff9e50c   b4c  d280008c       movz x12, #0x4
0x9430ff9e510   b50  6b0301df       cmp w14, w3
0x9430ff9e514   b54  1a85318f       csel w15, w12, w5, lo
0x9430ff9e518   b58  6b0301df       cmp w14, w3
0x9430ff9e51c   b5c  1a883305       csel w5, w24, w8, lo
0x9430ff9e520   b60  121d64ae       and w14, w5, #0x1ffffff8
0x9430ff9e524   b64  0b0e09ee       add w14, w15, w14, lsl #2
0x9430ff9e528   b68  0b070394       add w20, w28, w7
0x9430ff9e52c   b6c  6b03027f       cmp w19, w3
0x9430ff9e530   b70  1a943195       csel w21, w12, w20, lo
0x9430ff9e534   b74  6b03027f       cmp w19, w3
0x9430ff9e538   b78  1a883314       csel w20, w24, w8, lo
0x9430ff9e53c   b7c  121d6693       and w19, w20, #0x1ffffff8
0x9430ff9e540   b80  0b130ab3       add w19, w21, w19, lsl #2
0x9430ff9e544   b84  53037cb6       lsr w22, w5, #3
0x9430ff9e548   b88  120008a5       and w5, w5, #0x7
0x9430ff9e54c   b8c  53037e97       lsr w23, w20, #3
0x9430ff9e550   b90  12000a94       and w20, w20, #0x7
0x9430ff9e554   b94  6b0301bf       cmp w13, w3
0x9430ff9e558   b98  54000143       b.lo #+0x28 (addr 0x9430ff9e580)
0x9430ff9e55c   b9c  0b070007       add w7, w0, w7
0x9430ff9e560   ba0  aa0803f0       mov x16, x8
0x9430ff9e564   ba4  aa0703e8       mov x8, x7
0x9430ff9e568   ba8  aa1703e7       mov x7, x23
0x9430ff9e56c   bac  aa1603f7       mov x23, x22
0x9430ff9e570   bb0  aa1503f6       mov x22, x21
0x9430ff9e574   bb4  aa0f03f5       mov x21, x15
0x9430ff9e578   bb8  aa1003ef       mov x15, x16
0x9430ff9e57c   bbc  14000013       b #+0x4c (addr 0x9430ff9e5c8)
0x9430ff9e580   bc0  aa0c03e8       mov x8, x12
0x9430ff9e584   bc4  aa1703e7       mov x7, x23
0x9430ff9e588   bc8  aa1603f7       mov x23, x22
0x9430ff9e58c   bcc  aa1503f6       mov x22, x21
0x9430ff9e590   bd0  aa0f03f5       mov x21, x15
0x9430ff9e594   bd4  aa1803ef       mov x15, x24
0x9430ff9e598   bd8  1400000c       b #+0x30 (addr 0x9430ff9e5c8)
0x9430ff9e59c   bdc  d280008c       movz x12, #0x4
0x9430ff9e5a0   be0  aa1803ef       mov x15, x24
0x9430ff9e5a4   be4  aa1803f4       mov x20, x24
0x9430ff9e5a8   be8  aa1803f7       mov x23, x24
0x9430ff9e5ac   bec  aa1803e5       mov x5, x24
0x9430ff9e5b0   bf0  aa1803e7       mov x7, x24
0x9430ff9e5b4   bf4  aa0c03e8       mov x8, x12
0x9430ff9e5b8   bf8  aa0c03ee       mov x14, x12
0x9430ff9e5bc   bfc  aa0c03f3       mov x19, x12
0x9430ff9e5c0   c00  aa0c03f5       mov x21, x12
0x9430ff9e5c4   c04  aa0c03f6       mov x22, x12
0x9430ff9e5c8   c08  2a0a0129       orr w9, w9, w10
0x9430ff9e5cc   c0c  6a09013f       tst w9, w9
0x9430ff9e5d0   c10  1a861186       csel w6, w12, w6, ne
0x9430ff9e5d4   c14  12000969       and w9, w11, #0x7
0x9430ff9e5d8   c18  53037dea       lsr w10, w15, #3
0x9430ff9e5dc   c1c  53037d6c       lsr w12, w11, #3
0x9430ff9e5e0   c20  f900bbe6       str x6, [sp, #368]
0x9430ff9e5e4   c24  6b0c00ff       cmp w7, w12
0x9430ff9e5e8   c28  1a8c30e6       csel w6, w7, w12, lo
0x9430ff9e5ec   c2c  6b0602ff       cmp w23, w6
0x9430ff9e5f0   c30  1a8632ec       csel w12, w23, w6, lo
0x9430ff9e5f4   c34  6b0c015f       cmp w10, w12
0x9430ff9e5f8   c38  1a8c3146       csel w6, w10, w12, lo
0x9430ff9e5fc   c3c  f900d3ee       str x14, [sp, #416]
0x9430ff9e600   c40  f900bff3       str x19, [sp, #376]
0x9430ff9e604   c44  f900b3e8       str x8, [sp, #352]
0x9430ff9e608   c48  f900afef       str x15, [sp, #344]
0x9430ff9e60c   c4c  f900abe5       str x5, [sp, #336]
0x9430ff9e610   c50  f900a7f4       str x20, [sp, #328]
0x9430ff9e614   c54  f900a3e9       str x9, [sp, #320]
0x9430ff9e618   c58  34000ce6       cbz w6, #+0x19c (addr 0x9430ff9e7b4)
0x9430ff9e61c   c5c  f940bbec       ldr x12, [sp, #368]
0x9430ff9e620   c60  aa0803ea       mov x10, x8
0x9430ff9e624   c64  14000005       b #+0x14 (addr 0x9430ff9e638)
0x9430ff9e628   c68  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9e62c   c6c  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9e630   c70  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9e634   c74  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9e638   c78  f9005fe6       str x6, [sp, #184]
0x9430ff9e63c   c7c  f9005bea       str x10, [sp, #176]
0x9430ff9e640   c80  f90057f5       str x21, [sp, #168]
0x9430ff9e644   c84  f90053f6       str x22, [sp, #160]
0x9430ff9e648   c88  f9004fec       str x12, [sp, #152]
0x9430ff9e64c   c8c  f9414be7       ldr x7, [sp, #656]
0x9430ff9e650   c90  f94117e0       ldr x0, [sp, #552]
0x9430ff9e654   c94  aa0c03e2       mov x2, x12
0x9430ff9e658   c98  aa1603e3       mov x3, x22
0x9430ff9e65c   c9c  aa1503e4       mov x4, x21
0x9430ff9e660   ca0  aa0a03e5       mov x5, x10
0x9430ff9e664   ca4  97fc0c0f       bl #-0xfcfc4 (addr 0x9430fea16a0)
0x9430ff9e668   ca8  f9404fec       ldr x12, [sp, #152]
0x9430ff9e66c   cac  11008182       add w2, w12, #0x20 (32)
0x9430ff9e670   cb0  f94053f5       ldr x21, [sp, #160]
0x9430ff9e674   cb4  110082a3       add w3, w21, #0x20 (32)
0x9430ff9e678   cb8  f94057ef       ldr x15, [sp, #168]
0x9430ff9e67c   cbc  110081e4       add w4, w15, #0x20 (32)
0x9430ff9e680   cc0  f9405bea       ldr x10, [sp, #176]
0x9430ff9e684   cc4  11008145       add w5, w10, #0x20 (32)
0x9430ff9e688   cc8  f9405fe6       ldr x6, [sp, #184]
0x9430ff9e68c   ccc  510004c6       sub w6, w6, #0x1 (1)
0x9430ff9e690   cd0  f9004fe2       str x2, [sp, #152]
0x9430ff9e694   cd4  f90053e3       str x3, [sp, #160]
0x9430ff9e698   cd8  f90057e4       str x4, [sp, #168]
0x9430ff9e69c   cdc  f9005be5       str x5, [sp, #176]
0x9430ff9e6a0   ce0  f9005fe6       str x6, [sp, #184]
0x9430ff9e6a4   ce4  34000886       cbz w6, #+0x110 (addr 0x9430ff9e7b4)
0x9430ff9e6a8   ce8  f9414be7       ldr x7, [sp, #656]
0x9430ff9e6ac   cec  f94117e0       ldr x0, [sp, #552]
0x9430ff9e6b0   cf0  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9e6b4   cf4  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9e6b8   cf8  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9e6bc   cfc  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9e6c0   d00  97fc0bf8       bl #-0xfd020 (addr 0x9430fea16a0)
0x9430ff9e6c4   d04  f9404fe6       ldr x6, [sp, #152]
0x9430ff9e6c8   d08  110080c2       add w2, w6, #0x20 (32)
0x9430ff9e6cc   d0c  f94053e6       ldr x6, [sp, #160]
0x9430ff9e6d0   d10  110080c3       add w3, w6, #0x20 (32)
0x9430ff9e6d4   d14  f94057e6       ldr x6, [sp, #168]
0x9430ff9e6d8   d18  110080c4       add w4, w6, #0x20 (32)
0x9430ff9e6dc   d1c  f9405be6       ldr x6, [sp, #176]
0x9430ff9e6e0   d20  110080c5       add w5, w6, #0x20 (32)
0x9430ff9e6e4   d24  f9405fe6       ldr x6, [sp, #184]
0x9430ff9e6e8   d28  510004c6       sub w6, w6, #0x1 (1)
0x9430ff9e6ec   d2c  f9004fe2       str x2, [sp, #152]
0x9430ff9e6f0   d30  f90053e3       str x3, [sp, #160]
0x9430ff9e6f4   d34  f90057e4       str x4, [sp, #168]
0x9430ff9e6f8   d38  f9005be5       str x5, [sp, #176]
0x9430ff9e6fc   d3c  f9005fe6       str x6, [sp, #184]
0x9430ff9e700   d40  340005a6       cbz w6, #+0xb4 (addr 0x9430ff9e7b4)
0x9430ff9e704   d44  f9414be7       ldr x7, [sp, #656]
0x9430ff9e708   d48  f94117e0       ldr x0, [sp, #552]
0x9430ff9e70c   d4c  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9e710   d50  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9e714   d54  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9e718   d58  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9e71c   d5c  97fc0be1       bl #-0xfd07c (addr 0x9430fea16a0)
0x9430ff9e720   d60  f9404fe6       ldr x6, [sp, #152]
0x9430ff9e724   d64  110080c2       add w2, w6, #0x20 (32)
0x9430ff9e728   d68  f94053e6       ldr x6, [sp, #160]
0x9430ff9e72c   d6c  110080c3       add w3, w6, #0x20 (32)
0x9430ff9e730   d70  f94057e6       ldr x6, [sp, #168]
0x9430ff9e734   d74  110080c4       add w4, w6, #0x20 (32)
0x9430ff9e738   d78  f9405be6       ldr x6, [sp, #176]
0x9430ff9e73c   d7c  110080c5       add w5, w6, #0x20 (32)
0x9430ff9e740   d80  f9405fe6       ldr x6, [sp, #184]
0x9430ff9e744   d84  510004c6       sub w6, w6, #0x1 (1)
0x9430ff9e748   d88  f9004fe2       str x2, [sp, #152]
0x9430ff9e74c   d8c  f90053e3       str x3, [sp, #160]
0x9430ff9e750   d90  f90057e4       str x4, [sp, #168]
0x9430ff9e754   d94  f9005be5       str x5, [sp, #176]
0x9430ff9e758   d98  f9005fe6       str x6, [sp, #184]
0x9430ff9e75c   d9c  340002c6       cbz w6, #+0x58 (addr 0x9430ff9e7b4)
0x9430ff9e760   da0  f8520348       ldur x8, [x26, #-224]
0x9430ff9e764   da4  eb2863ff       cmp sp, x8
0x9430ff9e768   da8  54007b89       b.ls #+0xf70 (addr 0x9430ff9f6d8)
0x9430ff9e76c   dac  f9414be7       ldr x7, [sp, #656]
0x9430ff9e770   db0  f94117e0       ldr x0, [sp, #552]
0x9430ff9e774   db4  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9e778   db8  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9e77c   dbc  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9e780   dc0  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9e784   dc4  97fc0bc7       bl #-0xfd0e4 (addr 0x9430fea16a0)
0x9430ff9e788   dc8  f9404fe6       ldr x6, [sp, #152]
0x9430ff9e78c   dcc  110080cc       add w12, w6, #0x20 (32)
0x9430ff9e790   dd0  f94053e6       ldr x6, [sp, #160]
0x9430ff9e794   dd4  110080d6       add w22, w6, #0x20 (32)
0x9430ff9e798   dd8  f94057e6       ldr x6, [sp, #168]
0x9430ff9e79c   ddc  110080d5       add w21, w6, #0x20 (32)
0x9430ff9e7a0   de0  f9405be6       ldr x6, [sp, #176]
0x9430ff9e7a4   de4  110080ca       add w10, w6, #0x20 (32)
0x9430ff9e7a8   de8  f9405fe6       ldr x6, [sp, #184]
0x9430ff9e7ac   dec  510004c6       sub w6, w6, #0x1 (1)
0x9430ff9e7b0   df0  35fff3c6       cbnz w6, #-0x188 (addr 0x9430ff9e628)
0x9430ff9e7b4   df4  f940a3e6       ldr x6, [sp, #320]
0x9430ff9e7b8   df8  34001886       cbz w6, #+0x310 (addr 0x9430ff9eac8)
0x9430ff9e7bc   dfc  f9406be3       ldr x3, [sp, #208]
0x9430ff9e7c0   e00  51002068       sub w8, w3, #0x8 (8)
0x9430ff9e7c4   e04  d2800009       movz x9, #0x0
0x9430ff9e7c8   e08  6b08007f       cmp w3, w8
0x9430ff9e7cc   e0c  1a88312a       csel w10, w9, w8, lo
0x9430ff9e7d0   e10  11002148       add w8, w10, #0x8 (8)
0x9430ff9e7d4   e14  f94063eb       ldr x11, [sp, #192]
0x9430ff9e7d8   e18  6b08017f       cmp w11, w8
0x9430ff9e7dc   e1c  54001763       b.lo #+0x2ec (addr 0x9430ff9eac8)
0x9430ff9e7e0   e20  f94143e4       ldr x4, [sp, #640]
0x9430ff9e7e4   e24  91038088       add x8, x4, #0xe0 (224)
0x9430ff9e7e8   e28  f94133ec       ldr x12, [sp, #608]
0x9430ff9e7ec   e2c  3ce86984       ldr q4, [x12, x8]
0x9430ff9e7f0   e30  531e754d       lsl w13, w10, #2
0x9430ff9e7f4   e34  f94067ee       ldr x14, [sp, #200]
0x9430ff9e7f8   e38  0b0d01cf       add w15, w14, w13
0x9430ff9e7fc   e3c  3cef6985       ldr q5, [x12, x15]
0x9430ff9e800   e40  3dc03fe6       ldr q6, [sp, #240]
0x9430ff9e804   e44  4ea5d4c7       fsub v7.4s, v6.4s, v5.4s
0x9430ff9e808   e48  4b0a006a       sub w10, w3, w10
0x9430ff9e80c   e4c  6b06015f       cmp w10, w6
0x9430ff9e810   e50  9a9f17f3       cset x19, eq
0x9430ff9e814   e54  4e040e68       dup v8.4s, w19
0x9430ff9e818   e58  4b060146       sub w6, w10, w6
0x9430ff9e81c   e5c  d2800033       movz x19, #0x1
0x9430ff9e820   e60  6b0a027f       cmp w19, w10
0x9430ff9e824   e64  7a4238c2       ccmp w6, #2, #nzCv, lo
0x9430ff9e828   e68  9a9f27f4       cset x20, lo
0x9430ff9e82c   e6c  4e0c1e88       mov v8.s[1], w20
0x9430ff9e830   e70  d2800054       movz x20, #0x2
0x9430ff9e834   e74  6b0a029f       cmp w20, w10
0x9430ff9e838   e78  7a4338c2       ccmp w6, #3, #nzCv, lo
0x9430ff9e83c   e7c  9a9f27f5       cset x21, lo
0x9430ff9e840   e80  4e141ea8       mov v8.s[2], w21
0x9430ff9e844   e84  d2800075       movz x21, #0x3
0x9430ff9e848   e88  6b0a02bf       cmp w21, w10
0x9430ff9e84c   e8c  7a4438c2       ccmp w6, #4, #nzCv, lo
0x9430ff9e850   e90  9a9f27f5       cset x21, lo
0x9430ff9e854   e94  4e1c1ea8       mov v8.s[3], w21
0x9430ff9e858   e98  6e27dce9       fmul v9.4s, v7.4s, v7.4s
0x9430ff9e85c   e9c  f9406ff5       ldr x21, [sp, #216]
0x9430ff9e860   ea0  0b0d02b6       add w22, w21, w13
0x9430ff9e864   ea4  3cf6698a       ldr q10, [x12, x22]
0x9430ff9e868   ea8  3dc043eb       ldr q11, [sp, #256]
0x9430ff9e86c   eac  4eaad56c       fsub v12.4s, v11.4s, v10.4s
0x9430ff9e870   eb0  6e2cdd8d       fmul v13.4s, v12.4s, v12.4s
0x9430ff9e874   eb4  4e2dd529       fadd v9.4s, v9.4s, v13.4s
0x9430ff9e878   eb8  3dc047ed       ldr q13, [sp, #272]
0x9430ff9e87c   ebc  6ea9e5ae       fcmgt v14.4s, v13.4s, v9.4s
0x9430ff9e880   ec0  4e2e1d0e       and v14.16b, v8.16b, v14.16b
0x9430ff9e884   ec4  4e21d9ce       scvtf v14.4s, v14.4s
0x9430ff9e888   ec8  6e2edce7       fmul v7.4s, v7.4s, v14.4s
0x9430ff9e88c   ecc  4e27d484       fadd v4.4s, v4.4s, v7.4s
0x9430ff9e890   ed0  3ca86984       str q4, [x12, x8]
0x9430ff9e894   ed4  91040088       add x8, x4, #0x100 (256)
0x9430ff9e898   ed8  3ce86984       ldr q4, [x12, x8]
0x9430ff9e89c   edc  6e2edd87       fmul v7.4s, v12.4s, v14.4s
0x9430ff9e8a0   ee0  4e27d484       fadd v4.4s, v4.4s, v7.4s
0x9430ff9e8a4   ee4  3ca86984       str q4, [x12, x8]
0x9430ff9e8a8   ee8  6e2de524       fcmge v4.4s, v9.4s, v13.4s
0x9430ff9e8ac   eec  3dc04be7       ldr q7, [sp, #288]
0x9430ff9e8b0   ef0  6ea9e4ec       fcmgt v12.4s, v7.4s, v9.4s
0x9430ff9e8b4   ef4  4e2c1c84       and v4.16b, v4.16b, v12.16b
0x9430ff9e8b8   ef8  4ea0c929       fcmgt v9.4s, v9.4s, #0.0
0x9430ff9e8bc   efc  3dc04fec       ldr q12, [sp, #304]
0x9430ff9e8c0   f00  4e2c1d29       and v9.16b, v9.16b, v12.16b
0x9430ff9e8c4   f04  4e21d929       scvtf v9.4s, v9.4s
0x9430ff9e8c8   f08  4e291c84       and v4.16b, v4.16b, v9.16b
0x9430ff9e8cc   f0c  4e21d908       scvtf v8.4s, v8.4s
0x9430ff9e8d0   f10  6e28dc84       fmul v4.4s, v4.4s, v8.4s
0x9430ff9e8d4   f14  91030088       add x8, x4, #0xc0 (192)
0x9430ff9e8d8   f18  3ce86988       ldr q8, [x12, x8]
0x9430ff9e8dc   f1c  4e28d488       fadd v8.4s, v4.4s, v8.4s
0x9430ff9e8e0   f20  3ca86988       str q8, [x12, x8]
0x9430ff9e8e4   f24  91010088       add x8, x4, #0x40 (64)
0x9430ff9e8e8   f28  3ce86988       ldr q8, [x12, x8]
0x9430ff9e8ec   f2c  6e24dca5       fmul v5.4s, v5.4s, v4.4s
0x9430ff9e8f0   f30  4e25d505       fadd v5.4s, v8.4s, v5.4s
0x9430ff9e8f4   f34  3ca86985       str q5, [x12, x8]
0x9430ff9e8f8   f38  6e24dd45       fmul v5.4s, v10.4s, v4.4s
0x9430ff9e8fc   f3c  91018088       add x8, x4, #0x60 (96)
0x9430ff9e900   f40  3ce86988       ldr q8, [x12, x8]
0x9430ff9e904   f44  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0x9430ff9e908   f48  3ca86985       str q5, [x12, x8]
0x9430ff9e90c   f4c  f94073e8       ldr x8, [sp, #224]
0x9430ff9e910   f50  0b0d0117       add w23, w8, w13
0x9430ff9e914   f54  3cf76985       ldr q5, [x12, x23]
0x9430ff9e918   f58  6e24dca5       fmul v5.4s, v5.4s, v4.4s
0x9430ff9e91c   f5c  91020098       add x24, x4, #0x80 (128)
0x9430ff9e920   f60  3cf86988       ldr q8, [x12, x24]
0x9430ff9e924   f64  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0x9430ff9e928   f68  3cb86985       str q5, [x12, x24]
0x9430ff9e92c   f6c  f94077f8       ldr x24, [sp, #232]
0x9430ff9e930   f70  0b0d030d       add w13, w24, w13
0x9430ff9e934   f74  3ced6985       ldr q5, [x12, x13]
0x9430ff9e938   f78  6e24dca4       fmul v4.4s, v5.4s, v4.4s
0x9430ff9e93c   f7c  91028099       add x25, x4, #0xa0 (160)
0x9430ff9e940   f80  3cf96985       ldr q5, [x12, x25]
0x9430ff9e944   f84  4e25d484       fadd v4.4s, v4.4s, v5.4s
0x9430ff9e948   f88  3cb96984       str q4, [x12, x25]
0x9430ff9e94c   f8c  91014099       add x25, x4, #0x50 (80)
0x9430ff9e950   f90  3cf96984       ldr q4, [x12, x25]
0x9430ff9e954   f94  9103c09b       add cp, x4, #0xf0 (240)
0x9430ff9e958   f98  3cfb6985       ldr q5, [x12, x27]
0x9430ff9e95c   f9c  910041ef       add x15, x15, #0x10 (16)
0x9430ff9e960   fa0  3cef6988       ldr q8, [x12, x15]
0x9430ff9e964   fa4  4ea8d4c9       fsub v9.4s, v6.4s, v8.4s
0x9430ff9e968   fa8  d2c000b0       movz x16, #0x500000000
0x9430ff9e96c   fac  9e67020a       fmov d10, x16
0x9430ff9e970   fb0  4e041cca       mov v10.s[0], w6
0x9430ff9e974   fb4  d28000b0       movz x16, #0x5
0x9430ff9e978   fb8  9e67020e       fmov d14, x16
0x9430ff9e97c   fbc  4e0c1d4e       mov v14.s[1], w10
0x9430ff9e980   fc0  6eaa35ca       cmhi v10.4s, v14.4s, v10.4s
0x9430ff9e984   fc4  d2c000d0       movz x16, #0x600000000
0x9430ff9e988   fc8  9e67020e       fmov d14, x16
0x9430ff9e98c   fcc  4e041d4e       mov v14.s[0], w10
0x9430ff9e990   fd0  d2800090       movz x16, #0x4
0x9430ff9e994   fd4  9e670210       fmov d16, x16
0x9430ff9e998   fd8  4e0c1cd0       mov v16.s[1], w6
0x9430ff9e99c   fdc  6eb035ce       cmhi v14.4s, v14.4s, v16.4s
0x9430ff9e9a0   fe0  4e2e1d4a       and v10.16b, v10.16b, v14.16b
0x9430ff9e9a4   fe4  0f20a54a       sxtl v10.2d, v10.2s
0x9430ff9e9a8   fe8  4eaa1d5e       mov v30.16b, v10.16b
0x9430ff9e9ac   fec  4e0407ca       dup v10.4s, v30.s[0]
0x9430ff9e9b0   ff0  6e0c47ca       mov v10.s[1], v30.s[2]
0x9430ff9e9b4   ff4  d28000cf       movz x15, #0x6
0x9430ff9e9b8   ff8  6b0a01ff       cmp w15, w10
0x9430ff9e9bc   ffc  7a4738c2       ccmp w6, #7, #nzCv, lo
0x9430ff9e9c0  1000  9a9f27ef       cset x15, lo
0x9430ff9e9c4  1004  4e141dea       mov v10.s[2], w15
0x9430ff9e9c8  1008  d28000ef       movz x15, #0x7
0x9430ff9e9cc  100c  6b0a01ff       cmp w15, w10
0x9430ff9e9d0  1010  7a4838c2       ccmp w6, #8, #nzCv, lo
0x9430ff9e9d4  1014  9a9f27ea       cset x10, lo
0x9430ff9e9d8  1018  4e1c1d4a       mov v10.s[3], w10
0x9430ff9e9dc  101c  4e2c1d4a       and v10.16b, v10.16b, v12.16b
0x9430ff9e9e0  1020  6e29dd2e       fmul v14.4s, v9.4s, v9.4s
0x9430ff9e9e4  1024  910042c6       add x6, x22, #0x10 (16)
0x9430ff9e9e8  1028  3ce66990       ldr q16, [x12, x6]
0x9430ff9e9ec  102c  4eb0d571       fsub v17.4s, v11.4s, v16.4s
0x9430ff9e9f0  1030  6e31de32       fmul v18.4s, v17.4s, v17.4s
0x9430ff9e9f4  1034  4e32d5ce       fadd v14.4s, v14.4s, v18.4s
0x9430ff9e9f8  1038  6eaee5b2       fcmgt v18.4s, v13.4s, v14.4s
0x9430ff9e9fc  103c  4e321d52       and v18.16b, v10.16b, v18.16b
0x9430ff9ea00  1040  4e21da52       scvtf v18.4s, v18.4s
0x9430ff9ea04  1044  6e32dd29       fmul v9.4s, v9.4s, v18.4s
0x9430ff9ea08  1048  4e29d4a5       fadd v5.4s, v5.4s, v9.4s
0x9430ff9ea0c  104c  3cbb6985       str q5, [x12, x27]
0x9430ff9ea10  1050  91044086       add x6, x4, #0x110 (272)
0x9430ff9ea14  1054  3ce66985       ldr q5, [x12, x6]
0x9430ff9ea18  1058  6e32de29       fmul v9.4s, v17.4s, v18.4s
0x9430ff9ea1c  105c  4e29d4a5       fadd v5.4s, v5.4s, v9.4s
0x9430ff9ea20  1060  3ca66985       str q5, [x12, x6]
0x9430ff9ea24  1064  6e2de5c5       fcmge v5.4s, v14.4s, v13.4s
0x9430ff9ea28  1068  6eaee4e9       fcmgt v9.4s, v7.4s, v14.4s
0x9430ff9ea2c  106c  4e291ca5       and v5.16b, v5.16b, v9.16b
0x9430ff9ea30  1070  4ea0c9c9       fcmgt v9.4s, v14.4s, #0.0
0x9430ff9ea34  1074  4e2c1d29       and v9.16b, v9.16b, v12.16b
0x9430ff9ea38  1078  4e21d929       scvtf v9.4s, v9.4s
0x9430ff9ea3c  107c  4e291ca5       and v5.16b, v5.16b, v9.16b
0x9430ff9ea40  1080  4e21d949       scvtf v9.4s, v10.4s
0x9430ff9ea44  1084  6e29dca5       fmul v5.4s, v5.4s, v9.4s
0x9430ff9ea48  1088  6e25dd08       fmul v8.4s, v8.4s, v5.4s
0x9430ff9ea4c  108c  4e28d484       fadd v4.4s, v4.4s, v8.4s
0x9430ff9ea50  1090  3cb96984       str q4, [x12, x25]
0x9430ff9ea54  1094  6e25de04       fmul v4.4s, v16.4s, v5.4s
0x9430ff9ea58  1098  9101c086       add x6, x4, #0x70 (112)
0x9430ff9ea5c  109c  3ce66988       ldr q8, [x12, x6]
0x9430ff9ea60  10a0  4e28d484       fadd v4.4s, v4.4s, v8.4s
0x9430ff9ea64  10a4  3ca66984       str q4, [x12, x6]
0x9430ff9ea68  10a8  910042e6       add x6, x23, #0x10 (16)
0x9430ff9ea6c  10ac  3ce66984       ldr q4, [x12, x6]
0x9430ff9ea70  10b0  6e25dc84       fmul v4.4s, v4.4s, v5.4s
0x9430ff9ea74  10b4  91024086       add x6, x4, #0x90 (144)
0x9430ff9ea78  10b8  3ce66988       ldr q8, [x12, x6]
0x9430ff9ea7c  10bc  4e28d484       fadd v4.4s, v4.4s, v8.4s
0x9430ff9ea80  10c0  3ca66984       str q4, [x12, x6]
0x9430ff9ea84  10c4  910041a6       add x6, x13, #0x10 (16)
0x9430ff9ea88  10c8  3ce66984       ldr q4, [x12, x6]
0x9430ff9ea8c  10cc  6e25dc84       fmul v4.4s, v4.4s, v5.4s
0x9430ff9ea90  10d0  9102c086       add x6, x4, #0xb0 (176)
0x9430ff9ea94  10d4  3ce66988       ldr q8, [x12, x6]
0x9430ff9ea98  10d8  4e28d484       fadd v4.4s, v4.4s, v8.4s
0x9430ff9ea9c  10dc  3ca66984       str q4, [x12, x6]
0x9430ff9eaa0  10e0  91034086       add x6, x4, #0xd0 (208)
0x9430ff9eaa4  10e4  3ce66984       ldr q4, [x12, x6]
0x9430ff9eaa8  10e8  4e24d4a4       fadd v4.4s, v5.4s, v4.4s
0x9430ff9eaac  10ec  3ca66984       str q4, [x12, x6]
0x9430ff9eab0  10f0  fd40c3e5       ldr d5, [sp, #384]
0x9430ff9eab4  10f4  fd40c7e9       ldr d9, [sp, #392]
0x9430ff9eab8  10f8  fd40cbeb       ldr d11, [sp, #400]
0x9430ff9eabc  10fc  fd40cfec       ldr d12, [sp, #408]
0x9430ff9eac0  1100  aa0c03e9       mov x9, x12
0x9430ff9eac4  1104  1400013a       b #+0x4e8 (addr 0x9430ff9efac)
0x9430ff9eac8  1108  f940afe8       ldr x8, [sp, #344]
0x9430ff9eacc  110c  12000909       and w9, w8, #0x7
0x9430ff9ead0  1110  f940a7f4       ldr x20, [sp, #328]
0x9430ff9ead4  1114  6b06029f       cmp w20, w6
0x9430ff9ead8  1118  1a86328a       csel w10, w20, w6, lo
0x9430ff9eadc  111c  f940abe5       ldr x5, [sp, #336]
0x9430ff9eae0  1120  6b0a00bf       cmp w5, w10
0x9430ff9eae4  1124  1a8a30a6       csel w6, w5, w10, lo
0x9430ff9eae8  1128  6b06013f       cmp w9, w6
0x9430ff9eaec  112c  1a86312a       csel w10, w9, w6, lo
0x9430ff9eaf0  1130  350000ea       cbnz w10, #+0x1c (addr 0x9430ff9eb0c)
0x9430ff9eaf4  1134  fd40c3e5       ldr d5, [sp, #384]
0x9430ff9eaf8  1138  fd40c7e9       ldr d9, [sp, #392]
0x9430ff9eafc  113c  fd40cbeb       ldr d11, [sp, #400]
0x9430ff9eb00  1140  fd40cfec       ldr d12, [sp, #408]
0x9430ff9eb04  1144  f94133e9       ldr x9, [sp, #608]
0x9430ff9eb08  1148  14000129       b #+0x4a4 (addr 0x9430ff9efac)
0x9430ff9eb0c  114c  121d6506       and w6, w8, #0x1ffffff8
0x9430ff9eb10  1150  f940b3e7       ldr x7, [sp, #352]
0x9430ff9eb14  1154  0b0608e6       add w6, w7, w6, lsl #2
0x9430ff9eb18  1158  f940b7e8       ldr x8, [sp, #360]
0x9430ff9eb1c  115c  121d6508       and w8, w8, #0x1ffffff8
0x9430ff9eb20  1160  f940bbeb       ldr x11, [sp, #368]
0x9430ff9eb24  1164  0b080968       add w8, w11, w8, lsl #2
0x9430ff9eb28  1168  f94133e9       ldr x9, [sp, #608]
0x9430ff9eb2c  116c  bc686924       ldr s4, [x9, x8]
0x9430ff9eb30  1170  fd40c3e5       ldr d5, [sp, #384]
0x9430ff9eb34  1174  1e2438a6       fsub s6, s5, s4
0x9430ff9eb38  1178  1e2608c7       fmul s7, s6, s6
0x9430ff9eb3c  117c  f940bff3       ldr x19, [sp, #376]
0x9430ff9eb40  1180  2a1303eb       mov w11, w19
0x9430ff9eb44  1184  bc6b6928       ldr s8, [x9, x11]
0x9430ff9eb48  1188  fd40c7e9       ldr d9, [sp, #392]
0x9430ff9eb4c  118c  1e28392a       fsub s10, s9, s8
0x9430ff9eb50  1190  1e2a094b       fmul s11, s10, s10
0x9430ff9eb54  1194  1e2b28e7       fadd s7, s7, s11
0x9430ff9eb58  1198  fd40cbeb       ldr d11, [sp, #400]
0x9430ff9eb5c  119c  1e2b20e0       fcmp s7, s11
0x9430ff9eb60  11a0  540002c3       b.lo #+0x58 (addr 0x9430ff9ebb8)
0x9430ff9eb64  11a4  fd40cfec       ldr d12, [sp, #408]
0x9430ff9eb68  11a8  1e2c20e0       fcmp s7, s12
0x9430ff9eb6c  11ac  54000342       b.hs #+0x68 (addr 0x9430ff9ebd4)
0x9430ff9eb70  11b0  1e2020e8       fcmp s7, #0.0
0x9430ff9eb74  11b4  5400030d       b.le #+0x60 (addr 0x9430ff9ebd4)
0x9430ff9eb78  11b8  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9eb7c  11bc  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9eb80  11c0  1e2d28e6       fadd s6, s7, s13
0x9430ff9eb84  11c4  4e040484       dup v4.4s, v4.s[0]
0x9430ff9eb88  11c8  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9eb8c  11cc  f940d3ee       ldr x14, [sp, #416]
0x9430ff9eb90  11d0  2a0e03ec       mov w12, w14
0x9430ff9eb94  11d4  bc6c6927       ldr s7, [x9, x12]
0x9430ff9eb98  11d8  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9eb9c  11dc  bc666927       ldr s7, [x9, x6]
0x9430ff9eba0  11e0  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9eba4  11e4  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9eba8  11e8  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ebac  11ec  fd00e7e6       str d6, [sp, #456]
0x9430ff9ebb0  11f0  3d806fe4       str q4, [sp, #432]
0x9430ff9ebb4  11f4  14000008       b #+0x20 (addr 0x9430ff9ebd4)
0x9430ff9ebb8  11f8  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9ebbc  11fc  1e2a2884       fadd s4, s4, s10
0x9430ff9ebc0  1200  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9ebc4  1204  1e2628e7       fadd s7, s7, s6
0x9430ff9ebc8  1208  fd40cfec       ldr d12, [sp, #408]
0x9430ff9ebcc  120c  fd00e3e7       str d7, [sp, #448]
0x9430ff9ebd0  1210  fd00d7e4       str d4, [sp, #424]
0x9430ff9ebd4  1214  7100055f       cmp w10, #0x1 (1)
0x9430ff9ebd8  1218  54001ea0       b.eq #+0x3d4 (addr 0x9430ff9efac)
0x9430ff9ebdc  121c  9100110c       add x12, x8, #0x4 (4)
0x9430ff9ebe0  1220  bc6c6924       ldr s4, [x9, x12]
0x9430ff9ebe4  1224  1e2438a6       fsub s6, s5, s4
0x9430ff9ebe8  1228  1e2608c7       fmul s7, s6, s6
0x9430ff9ebec  122c  9100116c       add x12, x11, #0x4 (4)
0x9430ff9ebf0  1230  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ebf4  1234  1e28392a       fsub s10, s9, s8
0x9430ff9ebf8  1238  1e2a094d       fmul s13, s10, s10
0x9430ff9ebfc  123c  1e2d28e7       fadd s7, s7, s13
0x9430ff9ec00  1240  1e2b20e0       fcmp s7, s11
0x9430ff9ec04  1244  540002e3       b.lo #+0x5c (addr 0x9430ff9ec60)
0x9430ff9ec08  1248  1e2c20e0       fcmp s7, s12
0x9430ff9ec0c  124c  54000362       b.hs #+0x6c (addr 0x9430ff9ec78)
0x9430ff9ec10  1250  1e2020e8       fcmp s7, #0.0
0x9430ff9ec14  1254  5400032d       b.le #+0x64 (addr 0x9430ff9ec78)
0x9430ff9ec18  1258  1e2e1007       fmov s7, #0x70 (1.0000)
0x9430ff9ec1c  125c  fd40e7ed       ldr d13, [sp, #456]
0x9430ff9ec20  1260  1e2729a6       fadd s6, s13, s7
0x9430ff9ec24  1264  4e040484       dup v4.4s, v4.s[0]
0x9430ff9ec28  1268  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9ec2c  126c  f940d3ee       ldr x14, [sp, #416]
0x9430ff9ec30  1270  2a0e03ec       mov w12, w14
0x9430ff9ec34  1274  9100118c       add x12, x12, #0x4 (4)
0x9430ff9ec38  1278  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ec3c  127c  6e140504       mov v4.s[2], v8.s[0]
0x9430ff9ec40  1280  910010cc       add x12, x6, #0x4 (4)
0x9430ff9ec44  1284  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ec48  1288  6e1c0504       mov v4.s[3], v8.s[0]
0x9430ff9ec4c  128c  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9ec50  1290  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ec54  1294  fd00e7e6       str d6, [sp, #456]
0x9430ff9ec58  1298  3d806fe4       str q4, [sp, #432]
0x9430ff9ec5c  129c  14000007       b #+0x1c (addr 0x9430ff9ec78)
0x9430ff9ec60  12a0  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9ec64  12a4  1e2a2884       fadd s4, s4, s10
0x9430ff9ec68  12a8  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9ec6c  12ac  1e2628e7       fadd s7, s7, s6
0x9430ff9ec70  12b0  fd00d7e4       str d4, [sp, #424]
0x9430ff9ec74  12b4  fd00e3e7       str d7, [sp, #448]
0x9430ff9ec78  12b8  7100095f       cmp w10, #0x2 (2)
0x9430ff9ec7c  12bc  54001980       b.eq #+0x330 (addr 0x9430ff9efac)
0x9430ff9ec80  12c0  9100210c       add x12, x8, #0x8 (8)
0x9430ff9ec84  12c4  bc6c6924       ldr s4, [x9, x12]
0x9430ff9ec88  12c8  1e2438a6       fsub s6, s5, s4
0x9430ff9ec8c  12cc  1e2608c7       fmul s7, s6, s6
0x9430ff9ec90  12d0  9100216c       add x12, x11, #0x8 (8)
0x9430ff9ec94  12d4  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ec98  12d8  1e28392a       fsub s10, s9, s8
0x9430ff9ec9c  12dc  1e2a094d       fmul s13, s10, s10
0x9430ff9eca0  12e0  1e2d28e7       fadd s7, s7, s13
0x9430ff9eca4  12e4  1e2b20e0       fcmp s7, s11
0x9430ff9eca8  12e8  540002e3       b.lo #+0x5c (addr 0x9430ff9ed04)
0x9430ff9ecac  12ec  1e2c20e0       fcmp s7, s12
0x9430ff9ecb0  12f0  54000362       b.hs #+0x6c (addr 0x9430ff9ed1c)
0x9430ff9ecb4  12f4  1e2020e8       fcmp s7, #0.0
0x9430ff9ecb8  12f8  5400032d       b.le #+0x64 (addr 0x9430ff9ed1c)
0x9430ff9ecbc  12fc  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9ecc0  1300  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9ecc4  1304  1e2d28e6       fadd s6, s7, s13
0x9430ff9ecc8  1308  4e040484       dup v4.4s, v4.s[0]
0x9430ff9eccc  130c  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9ecd0  1310  f940d3ee       ldr x14, [sp, #416]
0x9430ff9ecd4  1314  2a0e03ec       mov w12, w14
0x9430ff9ecd8  1318  9100218c       add x12, x12, #0x8 (8)
0x9430ff9ecdc  131c  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ece0  1320  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9ece4  1324  910020cc       add x12, x6, #0x8 (8)
0x9430ff9ece8  1328  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ecec  132c  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9ecf0  1330  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9ecf4  1334  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ecf8  1338  fd00e7e6       str d6, [sp, #456]
0x9430ff9ecfc  133c  3d806fe4       str q4, [sp, #432]
0x9430ff9ed00  1340  14000007       b #+0x1c (addr 0x9430ff9ed1c)
0x9430ff9ed04  1344  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9ed08  1348  1e2a2884       fadd s4, s4, s10
0x9430ff9ed0c  134c  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9ed10  1350  1e2628e7       fadd s7, s7, s6
0x9430ff9ed14  1354  fd00d7e4       str d4, [sp, #424]
0x9430ff9ed18  1358  fd00e3e7       str d7, [sp, #448]
0x9430ff9ed1c  135c  71000d5f       cmp w10, #0x3 (3)
0x9430ff9ed20  1360  54001460       b.eq #+0x28c (addr 0x9430ff9efac)
0x9430ff9ed24  1364  9100310c       add x12, x8, #0xc (12)
0x9430ff9ed28  1368  bc6c6924       ldr s4, [x9, x12]
0x9430ff9ed2c  136c  1e2438a6       fsub s6, s5, s4
0x9430ff9ed30  1370  1e2608c7       fmul s7, s6, s6
0x9430ff9ed34  1374  9100316c       add x12, x11, #0xc (12)
0x9430ff9ed38  1378  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ed3c  137c  1e28392a       fsub s10, s9, s8
0x9430ff9ed40  1380  1e2a094d       fmul s13, s10, s10
0x9430ff9ed44  1384  1e2d28e7       fadd s7, s7, s13
0x9430ff9ed48  1388  1e2b20e0       fcmp s7, s11
0x9430ff9ed4c  138c  540002e3       b.lo #+0x5c (addr 0x9430ff9eda8)
0x9430ff9ed50  1390  1e2c20e0       fcmp s7, s12
0x9430ff9ed54  1394  54000362       b.hs #+0x6c (addr 0x9430ff9edc0)
0x9430ff9ed58  1398  1e2020e8       fcmp s7, #0.0
0x9430ff9ed5c  139c  5400032d       b.le #+0x64 (addr 0x9430ff9edc0)
0x9430ff9ed60  13a0  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9ed64  13a4  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9ed68  13a8  1e2d28e6       fadd s6, s7, s13
0x9430ff9ed6c  13ac  4e040484       dup v4.4s, v4.s[0]
0x9430ff9ed70  13b0  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9ed74  13b4  f940d3ee       ldr x14, [sp, #416]
0x9430ff9ed78  13b8  2a0e03ec       mov w12, w14
0x9430ff9ed7c  13bc  9100318c       add x12, x12, #0xc (12)
0x9430ff9ed80  13c0  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ed84  13c4  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9ed88  13c8  910030cc       add x12, x6, #0xc (12)
0x9430ff9ed8c  13cc  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ed90  13d0  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9ed94  13d4  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9ed98  13d8  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ed9c  13dc  fd00e7e6       str d6, [sp, #456]
0x9430ff9eda0  13e0  3d806fe4       str q4, [sp, #432]
0x9430ff9eda4  13e4  14000007       b #+0x1c (addr 0x9430ff9edc0)
0x9430ff9eda8  13e8  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9edac  13ec  1e2a2884       fadd s4, s4, s10
0x9430ff9edb0  13f0  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9edb4  13f4  1e2628e7       fadd s7, s7, s6
0x9430ff9edb8  13f8  fd00d7e4       str d4, [sp, #424]
0x9430ff9edbc  13fc  fd00e3e7       str d7, [sp, #448]
0x9430ff9edc0  1400  7100115f       cmp w10, #0x4 (4)
0x9430ff9edc4  1404  54000f40       b.eq #+0x1e8 (addr 0x9430ff9efac)
0x9430ff9edc8  1408  9100410c       add x12, x8, #0x10 (16)
0x9430ff9edcc  140c  bc6c6924       ldr s4, [x9, x12]
0x9430ff9edd0  1410  1e2438a6       fsub s6, s5, s4
0x9430ff9edd4  1414  1e2608c7       fmul s7, s6, s6
0x9430ff9edd8  1418  9100416c       add x12, x11, #0x10 (16)
0x9430ff9eddc  141c  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ede0  1420  1e28392a       fsub s10, s9, s8
0x9430ff9ede4  1424  1e2a094d       fmul s13, s10, s10
0x9430ff9ede8  1428  1e2d28e7       fadd s7, s7, s13
0x9430ff9edec  142c  1e2b20e0       fcmp s7, s11
0x9430ff9edf0  1430  540002e3       b.lo #+0x5c (addr 0x9430ff9ee4c)
0x9430ff9edf4  1434  1e2c20e0       fcmp s7, s12
0x9430ff9edf8  1438  54000362       b.hs #+0x6c (addr 0x9430ff9ee64)
0x9430ff9edfc  143c  1e2020e8       fcmp s7, #0.0
0x9430ff9ee00  1440  5400032d       b.le #+0x64 (addr 0x9430ff9ee64)
0x9430ff9ee04  1444  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9ee08  1448  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9ee0c  144c  1e2d28e6       fadd s6, s7, s13
0x9430ff9ee10  1450  4e040484       dup v4.4s, v4.s[0]
0x9430ff9ee14  1454  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9ee18  1458  f940d3ee       ldr x14, [sp, #416]
0x9430ff9ee1c  145c  2a0e03ec       mov w12, w14
0x9430ff9ee20  1460  9100418c       add x12, x12, #0x10 (16)
0x9430ff9ee24  1464  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ee28  1468  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9ee2c  146c  910040cc       add x12, x6, #0x10 (16)
0x9430ff9ee30  1470  bc6c6927       ldr s7, [x9, x12]
0x9430ff9ee34  1474  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9ee38  1478  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9ee3c  147c  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ee40  1480  fd00e7e6       str d6, [sp, #456]
0x9430ff9ee44  1484  3d806fe4       str q4, [sp, #432]
0x9430ff9ee48  1488  14000007       b #+0x1c (addr 0x9430ff9ee64)
0x9430ff9ee4c  148c  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9ee50  1490  1e2a2884       fadd s4, s4, s10
0x9430ff9ee54  1494  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9ee58  1498  1e2628e7       fadd s7, s7, s6
0x9430ff9ee5c  149c  fd00d7e4       str d4, [sp, #424]
0x9430ff9ee60  14a0  fd00e3e7       str d7, [sp, #448]
0x9430ff9ee64  14a4  7100155f       cmp w10, #0x5 (5)
0x9430ff9ee68  14a8  54000a20       b.eq #+0x144 (addr 0x9430ff9efac)
0x9430ff9ee6c  14ac  9100510c       add x12, x8, #0x14 (20)
0x9430ff9ee70  14b0  bc6c6924       ldr s4, [x9, x12]
0x9430ff9ee74  14b4  1e2438a6       fsub s6, s5, s4
0x9430ff9ee78  14b8  1e2608c7       fmul s7, s6, s6
0x9430ff9ee7c  14bc  9100516c       add x12, x11, #0x14 (20)
0x9430ff9ee80  14c0  bc6c6928       ldr s8, [x9, x12]
0x9430ff9ee84  14c4  1e28392a       fsub s10, s9, s8
0x9430ff9ee88  14c8  1e2a094d       fmul s13, s10, s10
0x9430ff9ee8c  14cc  1e2d28e7       fadd s7, s7, s13
0x9430ff9ee90  14d0  1e2b20e0       fcmp s7, s11
0x9430ff9ee94  14d4  540002e3       b.lo #+0x5c (addr 0x9430ff9eef0)
0x9430ff9ee98  14d8  1e2c20e0       fcmp s7, s12
0x9430ff9ee9c  14dc  54000362       b.hs #+0x6c (addr 0x9430ff9ef08)
0x9430ff9eea0  14e0  1e2020e8       fcmp s7, #0.0
0x9430ff9eea4  14e4  5400032d       b.le #+0x64 (addr 0x9430ff9ef08)
0x9430ff9eea8  14e8  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9eeac  14ec  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9eeb0  14f0  1e2d28e6       fadd s6, s7, s13
0x9430ff9eeb4  14f4  4e040484       dup v4.4s, v4.s[0]
0x9430ff9eeb8  14f8  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9eebc  14fc  f940d3ee       ldr x14, [sp, #416]
0x9430ff9eec0  1500  2a0e03ec       mov w12, w14
0x9430ff9eec4  1504  9100518c       add x12, x12, #0x14 (20)
0x9430ff9eec8  1508  bc6c6927       ldr s7, [x9, x12]
0x9430ff9eecc  150c  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9eed0  1510  910050cc       add x12, x6, #0x14 (20)
0x9430ff9eed4  1514  bc6c6927       ldr s7, [x9, x12]
0x9430ff9eed8  1518  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9eedc  151c  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9eee0  1520  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9eee4  1524  fd00e7e6       str d6, [sp, #456]
0x9430ff9eee8  1528  3d806fe4       str q4, [sp, #432]
0x9430ff9eeec  152c  14000007       b #+0x1c (addr 0x9430ff9ef08)
0x9430ff9eef0  1530  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9eef4  1534  1e2a2884       fadd s4, s4, s10
0x9430ff9eef8  1538  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9eefc  153c  1e2628e7       fadd s7, s7, s6
0x9430ff9ef00  1540  fd00d7e4       str d4, [sp, #424]
0x9430ff9ef04  1544  fd00e3e7       str d7, [sp, #448]
0x9430ff9ef08  1548  7100195f       cmp w10, #0x6 (6)
0x9430ff9ef0c  154c  54000500       b.eq #+0xa0 (addr 0x9430ff9efac)
0x9430ff9ef10  1550  91006108       add x8, x8, #0x18 (24)
0x9430ff9ef14  1554  bc686924       ldr s4, [x9, x8]
0x9430ff9ef18  1558  1e2438a6       fsub s6, s5, s4
0x9430ff9ef1c  155c  1e2608c7       fmul s7, s6, s6
0x9430ff9ef20  1560  91006168       add x8, x11, #0x18 (24)
0x9430ff9ef24  1564  bc686928       ldr s8, [x9, x8]
0x9430ff9ef28  1568  1e28392a       fsub s10, s9, s8
0x9430ff9ef2c  156c  1e2a094d       fmul s13, s10, s10
0x9430ff9ef30  1570  1e2d28e7       fadd s7, s7, s13
0x9430ff9ef34  1574  1e2b20e0       fcmp s7, s11
0x9430ff9ef38  1578  540002e3       b.lo #+0x5c (addr 0x9430ff9ef94)
0x9430ff9ef3c  157c  1e2c20e0       fcmp s7, s12
0x9430ff9ef40  1580  54000362       b.hs #+0x6c (addr 0x9430ff9efac)
0x9430ff9ef44  1584  1e2020e8       fcmp s7, #0.0
0x9430ff9ef48  1588  5400032d       b.le #+0x64 (addr 0x9430ff9efac)
0x9430ff9ef4c  158c  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9ef50  1590  fd40e7e7       ldr d7, [sp, #456]
0x9430ff9ef54  1594  1e2d28e6       fadd s6, s7, s13
0x9430ff9ef58  1598  4e040484       dup v4.4s, v4.s[0]
0x9430ff9ef5c  159c  6e0c0504       mov v4.s[1], v8.s[0]
0x9430ff9ef60  15a0  f940d3ee       ldr x14, [sp, #416]
0x9430ff9ef64  15a4  2a0e03e8       mov w8, w14
0x9430ff9ef68  15a8  91006108       add x8, x8, #0x18 (24)
0x9430ff9ef6c  15ac  bc686927       ldr s7, [x9, x8]
0x9430ff9ef70  15b0  6e1404e4       mov v4.s[2], v7.s[0]
0x9430ff9ef74  15b4  910060c6       add x6, x6, #0x18 (24)
0x9430ff9ef78  15b8  bc666927       ldr s7, [x9, x6]
0x9430ff9ef7c  15bc  6e1c04e4       mov v4.s[3], v7.s[0]
0x9430ff9ef80  15c0  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9ef84  15c4  4e24d504       fadd v4.4s, v8.4s, v4.4s
0x9430ff9ef88  15c8  fd00e7e6       str d6, [sp, #456]
0x9430ff9ef8c  15cc  3d806fe4       str q4, [sp, #432]
0x9430ff9ef90  15d0  14000007       b #+0x1c (addr 0x9430ff9efac)
0x9430ff9ef94  15d4  fd40d7e4       ldr d4, [sp, #424]
0x9430ff9ef98  15d8  1e2a2884       fadd s4, s4, s10
0x9430ff9ef9c  15dc  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9efa0  15e0  1e2628e7       fadd s7, s7, s6
0x9430ff9efa4  15e4  fd00d7e4       str d4, [sp, #424]
0x9430ff9efa8  15e8  fd00e3e7       str d7, [sp, #448]
0x9430ff9efac  15ec  f94137e6       ldr x6, [sp, #616]
0x9430ff9efb0  15f0  110004c8       add w8, w6, #0x1 (1)
0x9430ff9efb4  15f4  f940ebea       ldr x10, [sp, #464]
0x9430ff9efb8  15f8  6b0a00df       cmp w6, w10
0x9430ff9efbc  15fc  54ffa1c1       b.ne #-0xbc8 (addr 0x9430ff9e3f4)
0x9430ff9efc0  1600  f94143e4       ldr x4, [sp, #640]
0x9430ff9efc4  1604  91009086       add x6, x4, #0x24 (36)
0x9430ff9efc8  1608  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9efcc  160c  bc266927       str s7, [x9, x6]
0x9430ff9efd0  1610  f940f3e6       ldr x6, [sp, #480]
0x9430ff9efd4  1614  fd40e7e6       ldr d6, [sp, #456]
0x9430ff9efd8  1618  bc266926       str s6, [x9, x6]
0x9430ff9efdc  161c  91028088       add x8, x4, #0xa0 (160)
0x9430ff9efe0  1620  3ce86924       ldr q4, [x9, x8]
0x9430ff9efe4  1624  91020088       add x8, x4, #0x80 (128)
0x9430ff9efe8  1628  3ce86925       ldr q5, [x9, x8]
0x9430ff9efec  162c  91018088       add x8, x4, #0x60 (96)
0x9430ff9eff0  1630  3ce86926       ldr q6, [x9, x8]
0x9430ff9eff4  1634  91010088       add x8, x4, #0x40 (64)
0x9430ff9eff8  1638  3ce86927       ldr q7, [x9, x8]
0x9430ff9effc  163c  9102c088       add x8, x4, #0xb0 (176)
0x9430ff9f000  1640  3ce86928       ldr q8, [x9, x8]
0x9430ff9f004  1644  91024088       add x8, x4, #0x90 (144)
0x9430ff9f008  1648  3ce86929       ldr q9, [x9, x8]
0x9430ff9f00c  164c  9101c088       add x8, x4, #0x70 (112)
0x9430ff9f010  1650  3ce8692a       ldr q10, [x9, x8]
0x9430ff9f014  1654  91014088       add x8, x4, #0x50 (80)
0x9430ff9f018  1658  3ce8692d       ldr q13, [x9, x8]
0x9430ff9f01c  165c  f94107e8       ldr x8, [sp, #520]
0x9430ff9f020  1660  3dc06fee       ldr q14, [sp, #432]
0x9430ff9f024  1664  3ca8692e       str q14, [x9, x8]
0x9430ff9f028  1668  4e0404f0       dup v16.4s, v7.s[0]
0x9430ff9f02c  166c  6e0c04d0       mov v16.s[1], v6.s[0]
0x9430ff9f030  1670  4e0404b1       dup v17.4s, v5.s[0]
0x9430ff9f034  1674  6e1c0491       mov v17.s[3], v4.s[0]
0x9430ff9f038  1678  4eb01e1e       mov v30.16b, v16.16b
0x9430ff9f03c  167c  6e0807d0       mov v16.d[0], v30.d[0]
0x9430ff9f040  1680  6e184630       mov v16.d[1], v17.d[1]
0x9430ff9f044  1684  4e0404f1       dup v17.4s, v7.s[0]
0x9430ff9f048  1688  6e0424f1       mov v17.s[0], v7.s[1]
0x9430ff9f04c  168c  6e0c24d1       mov v17.s[1], v6.s[1]
0x9430ff9f050  1690  4e0404b2       dup v18.4s, v5.s[0]
0x9430ff9f054  1694  6e1424b2       mov v18.s[2], v5.s[1]
0x9430ff9f058  1698  6e1c2492       mov v18.s[3], v4.s[1]
0x9430ff9f05c  169c  4eb11e3e       mov v30.16b, v17.16b
0x9430ff9f060  16a0  6e0807d1       mov v17.d[0], v30.d[0]
0x9430ff9f064  16a4  6e184651       mov v17.d[1], v18.d[1]
0x9430ff9f068  16a8  4e31d610       fadd v16.4s, v16.4s, v17.4s
0x9430ff9f06c  16ac  4e0404f1       dup v17.4s, v7.s[0]
0x9430ff9f070  16b0  6e0444f1       mov v17.s[0], v7.s[2]
0x9430ff9f074  16b4  6e0c44d1       mov v17.s[1], v6.s[2]
0x9430ff9f078  16b8  4e0404b2       dup v18.4s, v5.s[0]
0x9430ff9f07c  16bc  6e1444b2       mov v18.s[2], v5.s[2]
0x9430ff9f080  16c0  6e1c4492       mov v18.s[3], v4.s[2]
0x9430ff9f084  16c4  4eb11e3e       mov v30.16b, v17.16b
0x9430ff9f088  16c8  6e0807d1       mov v17.d[0], v30.d[0]
0x9430ff9f08c  16cc  6e184651       mov v17.d[1], v18.d[1]
0x9430ff9f090  16d0  4e31d610       fadd v16.4s, v16.4s, v17.4s
0x9430ff9f094  16d4  4ea61cde       mov v30.16b, v6.16b
0x9430ff9f098  16d8  4e0404e6       dup v6.4s, v7.s[0]
0x9430ff9f09c  16dc  6e0464e6       mov v6.s[0], v7.s[3]
0x9430ff9f0a0  16e0  6e0c67c6       mov v6.s[1], v30.s[3]
0x9430ff9f0a4  16e4  4ea41c9e       mov v30.16b, v4.16b
0x9430ff9f0a8  16e8  4e0404a4       dup v4.4s, v5.s[0]
0x9430ff9f0ac  16ec  6e1464a4       mov v4.s[2], v5.s[3]
0x9430ff9f0b0  16f0  6e1c67c4       mov v4.s[3], v30.s[3]
0x9430ff9f0b4  16f4  4ea41c9e       mov v30.16b, v4.16b
0x9430ff9f0b8  16f8  6e0804c4       mov v4.d[0], v6.d[0]
0x9430ff9f0bc  16fc  6e1847c4       mov v4.d[1], v30.d[1]
0x9430ff9f0c0  1700  4e24d604       fadd v4.4s, v16.4s, v4.4s
0x9430ff9f0c4  1704  4e0405a5       dup v5.4s, v13.s[0]
0x9430ff9f0c8  1708  6e0c0545       mov v5.s[1], v10.s[0]
0x9430ff9f0cc  170c  4e040526       dup v6.4s, v9.s[0]
0x9430ff9f0d0  1710  6e1c0506       mov v6.s[3], v8.s[0]
0x9430ff9f0d4  1714  4ea51cbe       mov v30.16b, v5.16b
0x9430ff9f0d8  1718  6e0807c5       mov v5.d[0], v30.d[0]
0x9430ff9f0dc  171c  6e1844c5       mov v5.d[1], v6.d[1]
0x9430ff9f0e0  1720  4e25d484       fadd v4.4s, v4.4s, v5.4s
0x9430ff9f0e4  1724  4e0405a5       dup v5.4s, v13.s[0]
0x9430ff9f0e8  1728  6e0425a5       mov v5.s[0], v13.s[1]
0x9430ff9f0ec  172c  6e0c2545       mov v5.s[1], v10.s[1]
0x9430ff9f0f0  1730  4e040526       dup v6.4s, v9.s[0]
0x9430ff9f0f4  1734  6e142526       mov v6.s[2], v9.s[1]
0x9430ff9f0f8  1738  6e1c2506       mov v6.s[3], v8.s[1]
0x9430ff9f0fc  173c  4ea51cbe       mov v30.16b, v5.16b
0x9430ff9f100  1740  6e0807c5       mov v5.d[0], v30.d[0]
0x9430ff9f104  1744  6e1844c5       mov v5.d[1], v6.d[1]
0x9430ff9f108  1748  4e25d484       fadd v4.4s, v4.4s, v5.4s
0x9430ff9f10c  174c  4e0405a5       dup v5.4s, v13.s[0]
0x9430ff9f110  1750  6e0445a5       mov v5.s[0], v13.s[2]
0x9430ff9f114  1754  6e0c4545       mov v5.s[1], v10.s[2]
0x9430ff9f118  1758  4e040526       dup v6.4s, v9.s[0]
0x9430ff9f11c  175c  6e144526       mov v6.s[2], v9.s[2]
0x9430ff9f120  1760  6e1c4506       mov v6.s[3], v8.s[2]
0x9430ff9f124  1764  4ea51cbe       mov v30.16b, v5.16b
0x9430ff9f128  1768  6e0807c5       mov v5.d[0], v30.d[0]
0x9430ff9f12c  176c  6e1844c5       mov v5.d[1], v6.d[1]
0x9430ff9f130  1770  4e25d484       fadd v4.4s, v4.4s, v5.4s
0x9430ff9f134  1774  4e0405a5       dup v5.4s, v13.s[0]
0x9430ff9f138  1778  6e0465a5       mov v5.s[0], v13.s[3]
0x9430ff9f13c  177c  6e0c6545       mov v5.s[1], v10.s[3]
0x9430ff9f140  1780  4e040526       dup v6.4s, v9.s[0]
0x9430ff9f144  1784  6e146526       mov v6.s[2], v9.s[3]
0x9430ff9f148  1788  6e1c6506       mov v6.s[3], v8.s[3]
0x9430ff9f14c  178c  4ea51cbe       mov v30.16b, v5.16b
0x9430ff9f150  1790  6e0807c5       mov v5.d[0], v30.d[0]
0x9430ff9f154  1794  6e1844c5       mov v5.d[1], v6.d[1]
0x9430ff9f158  1798  4e25d484       fadd v4.4s, v4.4s, v5.4s
0x9430ff9f15c  179c  4e2ed484       fadd v4.4s, v4.4s, v14.4s
0x9430ff9f160  17a0  9103008a       add x10, x4, #0xc0 (192)
0x9430ff9f164  17a4  3cea6925       ldr q5, [x9, x10]
0x9430ff9f168  17a8  9103808a       add x10, x4, #0xe0 (224)
0x9430ff9f16c  17ac  3cea6926       ldr q6, [x9, x10]
0x9430ff9f170  17b0  4e0404a7       dup v7.4s, v5.s[0]
0x9430ff9f174  17b4  6e0c04c7       mov v7.s[1], v6.s[0]
0x9430ff9f178  17b8  4e0404a8       dup v8.4s, v5.s[0]
0x9430ff9f17c  17bc  6e0424a8       mov v8.s[0], v5.s[1]
0x9430ff9f180  17c0  6e0c24c8       mov v8.s[1], v6.s[1]
0x9430ff9f184  17c4  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0x9430ff9f188  17c8  4e0404a8       dup v8.4s, v5.s[0]
0x9430ff9f18c  17cc  6e0444a8       mov v8.s[0], v5.s[2]
0x9430ff9f190  17d0  6e0c44c8       mov v8.s[1], v6.s[2]
0x9430ff9f194  17d4  4e28d4e7       fadd v7.4s, v7.4s, v8.4s
0x9430ff9f198  17d8  4ea51cbe       mov v30.16b, v5.16b
0x9430ff9f19c  17dc  4e0407c5       dup v5.4s, v30.s[0]
0x9430ff9f1a0  17e0  6e0467c5       mov v5.s[0], v30.s[3]
0x9430ff9f1a4  17e4  6e0c64c5       mov v5.s[1], v6.s[3]
0x9430ff9f1a8  17e8  4e25d4e5       fadd v5.4s, v7.4s, v5.4s
0x9430ff9f1ac  17ec  9103408a       add x10, x4, #0xd0 (208)
0x9430ff9f1b0  17f0  3cea6926       ldr q6, [x9, x10]
0x9430ff9f1b4  17f4  9103c08a       add x10, x4, #0xf0 (240)
0x9430ff9f1b8  17f8  3cea6927       ldr q7, [x9, x10]
0x9430ff9f1bc  17fc  4e0404c8       dup v8.4s, v6.s[0]
0x9430ff9f1c0  1800  6e0c04e8       mov v8.s[1], v7.s[0]
0x9430ff9f1c4  1804  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0x9430ff9f1c8  1808  4e0404c8       dup v8.4s, v6.s[0]
0x9430ff9f1cc  180c  6e0424c8       mov v8.s[0], v6.s[1]
0x9430ff9f1d0  1810  6e0c24e8       mov v8.s[1], v7.s[1]
0x9430ff9f1d4  1814  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0x9430ff9f1d8  1818  4e0404c8       dup v8.4s, v6.s[0]
0x9430ff9f1dc  181c  6e0444c8       mov v8.s[0], v6.s[2]
0x9430ff9f1e0  1820  6e0c44e8       mov v8.s[1], v7.s[2]
0x9430ff9f1e4  1824  4e28d4a5       fadd v5.4s, v5.4s, v8.4s
0x9430ff9f1e8  1828  4ea61cde       mov v30.16b, v6.16b
0x9430ff9f1ec  182c  4e0407c6       dup v6.4s, v30.s[0]
0x9430ff9f1f0  1830  6e0467c6       mov v6.s[0], v30.s[3]
0x9430ff9f1f4  1834  6e0c64e6       mov v6.s[1], v7.s[3]
0x9430ff9f1f8  1838  4e26d4a5       fadd v5.4s, v5.4s, v6.4s
0x9430ff9f1fc  183c  3ce66926       ldr q6, [x9, x6]
0x9430ff9f200  1840  4e26d4a5       fadd v5.4s, v5.4s, v6.4s
0x9430ff9f204  1844  91041086       add x6, x4, #0x104 (260)
0x9430ff9f208  1848  bc666926       ldr s6, [x9, x6]
0x9430ff9f20c  184c  91040086       add x6, x4, #0x100 (256)
0x9430ff9f210  1850  bc666927       ldr s7, [x9, x6]
0x9430ff9f214  1854  91042086       add x6, x4, #0x108 (264)
0x9430ff9f218  1858  bc666928       ldr s8, [x9, x6]
0x9430ff9f21c  185c  91043086       add x6, x4, #0x10c (268)
0x9430ff9f220  1860  bc666929       ldr s9, [x9, x6]
0x9430ff9f224  1864  91044086       add x6, x4, #0x110 (272)
0x9430ff9f228  1868  bc66692a       ldr s10, [x9, x6]
0x9430ff9f22c  186c  91045086       add x6, x4, #0x114 (276)
0x9430ff9f230  1870  bc66692d       ldr s13, [x9, x6]
0x9430ff9f234  1874  91046086       add x6, x4, #0x118 (280)
0x9430ff9f238  1878  bc66692e       ldr s14, [x9, x6]
0x9430ff9f23c  187c  91047086       add x6, x4, #0x11c (284)
0x9430ff9f240  1880  bc666930       ldr s16, [x9, x6]
0x9430ff9f244  1884  f94103e6       ldr x6, [sp, #512]
0x9430ff9f248  1888  fd40d7f1       ldr d17, [sp, #424]
0x9430ff9f24c  188c  bc266931       str s17, [x9, x6]
0x9430ff9f250  1890  1e2628e6       fadd s6, s7, s6
0x9430ff9f254  1894  1e262906       fadd s6, s8, s6
0x9430ff9f258  1898  1e262926       fadd s6, s9, s6
0x9430ff9f25c  189c  1e262946       fadd s6, s10, s6
0x9430ff9f260  18a0  1e2629a6       fadd s6, s13, s6
0x9430ff9f264  18a4  1e2629c6       fadd s6, s14, s6
0x9430ff9f268  18a8  1e262a06       fadd s6, s16, s6
0x9430ff9f26c  18ac  1e3128c6       fadd s6, s6, s17
0x9430ff9f270  18b0  f940f7f8       ldr x24, [sp, #488]
0x9430ff9f274  18b4  bc266926       str s6, [x9, x6]
0x9430ff9f278  18b8  91008126       add x6, x9, #0x20 (32)
0x9430ff9f27c  18bc  8b0400c6       add x6, x6, x4
0x9430ff9f280  18c0  0d0084c5       st1 {v5.d}[0], [x6]
0x9430ff9f284  18c4  3ca86924       str q4, [x9, x8]
0x9430ff9f288  18c8  1100c083       add w3, w4, #0x30 (48)
0x9430ff9f28c  18cc  11004085       add w5, w4, #0x10 (16)
0x9430ff9f290  18d0  f90137f8       str x24, [sp, #616]
0x9430ff9f294  18d4  f9414be7       ldr x7, [sp, #656]
0x9430ff9f298  18d8  f94117e0       ldr x0, [sp, #552]
0x9430ff9f29c  18dc  f94113e2       ldr x2, [sp, #544]
0x9430ff9f2a0  18e0  fd410fe0       ldr d0, [sp, #536]
0x9430ff9f2a4  18e4  fd410be1       ldr d1, [sp, #528]
0x9430ff9f2a8  18e8  97fc08ff       bl #-0xfdc04 (addr 0x9430fea16a4)
0x9430ff9f2ac  18ec  f9413bf6       ldr x22, [sp, #624]
0x9430ff9f2b0  18f0  f94137f8       ldr x24, [sp, #616]
0x9430ff9f2b4  18f4  6b16031f       cmp w24, w22
0x9430ff9f2b8  18f8  540006a9       b.ls #+0xd4 (addr 0x9430ff9f38c)
0x9430ff9f2bc  18fc  f9411be6       ldr x6, [sp, #560]
0x9430ff9f2c0  1900  6b1600df       cmp w6, w22
0x9430ff9f2c4  1904  54000649       b.ls #+0xc8 (addr 0x9430ff9f38c)
0x9430ff9f2c8  1908  f9412be8       ldr x8, [sp, #592]
0x9430ff9f2cc  190c  f9411fe9       ldr x9, [sp, #568]
0x9430ff9f2d0  1910  0b08012a       add w10, w9, w8
0x9430ff9f2d4  1914  f94143eb       ldr x11, [sp, #640]
0x9430ff9f2d8  1918  9101016c       add x12, x11, #0x40 (64)
0x9430ff9f2dc  191c  f94133ed       ldr x13, [sp, #608]
0x9430ff9f2e0  1920  bc6c69a4       ldr s4, [x13, x12]
0x9430ff9f2e4  1924  bc2a69a4       str s4, [x13, x10]
0x9430ff9f2e8  1928  f94123ea       ldr x10, [sp, #576]
0x9430ff9f2ec  192c  0b08014c       add w12, w10, w8
0x9430ff9f2f0  1930  9101116e       add x14, x11, #0x44 (68)
0x9430ff9f2f4  1934  bc6e69a4       ldr s4, [x13, x14]
0x9430ff9f2f8  1938  bc2c69a4       str s4, [x13, x12]
0x9430ff9f2fc  193c  f94127ec       ldr x12, [sp, #584]
0x9430ff9f300  1940  0b08018e       add w14, w12, w8
0x9430ff9f304  1944  9101216f       add x15, x11, #0x48 (72)
0x9430ff9f308  1948  bc6f69a4       ldr s4, [x13, x15]
0x9430ff9f30c  194c  bc2e69a4       str s4, [x13, x14]
0x9430ff9f310  1950  f9412fee       ldr x14, [sp, #600]
0x9430ff9f314  1954  0b0801c8       add w8, w14, w8
0x9430ff9f318  1958  9101316f       add x15, x11, #0x4c (76)
0x9430ff9f31c  195c  bc6f69a4       ldr s4, [x13, x15]
0x9430ff9f320  1960  bc2869a4       str s4, [x13, x8]
0x9430ff9f324  1964  f90137f8       str x24, [sp, #616]
0x9430ff9f328  1968  aa0903f5       mov x21, x9
0x9430ff9f32c  196c  aa0d03e9       mov x9, x13
0x9430ff9f330  1970  aa0c03f3       mov x19, x12
0x9430ff9f334  1974  aa0e03ec       mov x12, x14
0x9430ff9f338  1978  aa0a03ed       mov x13, x10
0x9430ff9f33c  197c  1e2e1008       fmov s8, #0x70 (1.0000)
0x9430ff9f340  1980  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9f344  1984  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9f348  1988  3dc04fe7       ldr q7, [sp, #304]
0x9430ff9f34c  198c  3dc04be4       ldr q4, [sp, #288]
0x9430ff9f350  1990  3dc047e5       ldr q5, [sp, #272]
0x9430ff9f354  1994  d2800044       movz x4, #0x2
0x9430ff9f358  1998  d2800023       movz x3, #0x1
0x9430ff9f35c  199c  d2800002       movz x2, #0x0
0x9430ff9f360  19a0  f9401be6       ldr x6, [sp, #48]
0x9430ff9f364  19a4  f9401fe1       ldr x1, [sp, #56]
0x9430ff9f368  19a8  f94033f4       ldr x20, [sp, #96]
0x9430ff9f36c  19ac  f94047e0       ldr x0, [sp, #136]
0x9430ff9f370  19b0  f94023ef       ldr x15, [sp, #64]
0x9430ff9f374  19b4  f94037fc       ldr x28, [sp, #104]
0x9430ff9f378  19b8  f9404bee       ldr x14, [sp, #144]
0x9430ff9f37c  19bc  f9402ff7       ldr x23, [sp, #88]
0x9430ff9f380  19c0  f94043fb       ldr cp, [sp, #128]
0x9430ff9f384  19c4  f940eff9       ldr x25, [sp, #472]
0x9430ff9f388  19c8  1400001a       b #+0x68 (addr 0x9430ff9f3f0)
0x9430ff9f38c  19cc  f90137f8       str x24, [sp, #616]
0x9430ff9f390  19d0  f94133e9       ldr x9, [sp, #608]
0x9430ff9f394  19d4  f9412fec       ldr x12, [sp, #600]
0x9430ff9f398  19d8  f94127f3       ldr x19, [sp, #584]
0x9430ff9f39c  19dc  f94123ed       ldr x13, [sp, #576]
0x9430ff9f3a0  19e0  f9411ff5       ldr x21, [sp, #568]
0x9430ff9f3a4  19e4  1e2e1008       fmov s8, #0x70 (1.0000)
0x9430ff9f3a8  19e8  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9f3ac  19ec  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9f3b0  19f0  3dc04fe7       ldr q7, [sp, #304]
0x9430ff9f3b4  19f4  3dc04be4       ldr q4, [sp, #288]
0x9430ff9f3b8  19f8  3dc047e5       ldr q5, [sp, #272]
0x9430ff9f3bc  19fc  d2800044       movz x4, #0x2
0x9430ff9f3c0  1a00  d2800023       movz x3, #0x1
0x9430ff9f3c4  1a04  d2800002       movz x2, #0x0
0x9430ff9f3c8  1a08  f9401be6       ldr x6, [sp, #48]
0x9430ff9f3cc  1a0c  f9401fe1       ldr x1, [sp, #56]
0x9430ff9f3d0  1a10  f94033f4       ldr x20, [sp, #96]
0x9430ff9f3d4  1a14  f94047e0       ldr x0, [sp, #136]
0x9430ff9f3d8  1a18  f94023ef       ldr x15, [sp, #64]
0x9430ff9f3dc  1a1c  f94037fc       ldr x28, [sp, #104]
0x9430ff9f3e0  1a20  f9404bee       ldr x14, [sp, #144]
0x9430ff9f3e4  1a24  f9402ff7       ldr x23, [sp, #88]
0x9430ff9f3e8  1a28  f94043fb       ldr cp, [sp, #128]
0x9430ff9f3ec  1a2c  f940eff9       ldr x25, [sp, #472]
0x9430ff9f3f0  1a30  110006d6       add w22, w22, #0x1 (1)
0x9430ff9f3f4  1a34  f9413fe8       ldr x8, [sp, #632]
0x9430ff9f3f8  1a38  6b0802df       cmp w22, w8
0x9430ff9f3fc  1a3c  54ff6921       b.ne #-0x12dc (addr 0x9430ff9e120)
0x9430ff9f400  1a40  f94143e6       ldr x6, [sp, #640]
0x9430ff9f404  1a44  110480c6       add w6, w6, #0x120 (288)
0x9430ff9f408  1a48  f94147e8       ldr x8, [sp, #648]
0x9430ff9f40c  1a4c  b9000106       str w6, [x8]
0x9430ff9f410  1a50  17fffb14       b #-0x13b0 (addr 0x9430ff9e060)
0x9430ff9f414  1a54  97fc09ef       bl #-0xfd844 (addr 0x9430fea1bd0)
0x9430ff9f418  1a58  f94133e6       ldr x6, [sp, #608]
0x9430ff9f41c  1a5c  f9414be7       ldr x7, [sp, #656]
0x9430ff9f420  1a60  f9413fe0       ldr x0, [sp, #632]
0x9430ff9f424  1a64  17fff972       b #-0x1a38 (addr 0x9430ff9d9ec)
0x9430ff9f428  1a68  1e682100       fcmp d8, d8
0x9430ff9f42c  1a6c  54000080       b.eq #+0x10 (addr 0x9430ff9f43c)
0x9430ff9f430  1a70  d2800001       movz x1, #0x0
0x9430ff9f434  1a74  aa0103ec       mov x12, x1
0x9430ff9f438  1a78  17fff9a2       b #-0x1978 (addr 0x9430ff9dac0)
0x9430ff9f43c  1a7c  1e2020e8       fcmp s7, #0.0
0x9430ff9f440  1a80  54000063       b.lo #+0xc (addr 0x9430ff9f44c)
0x9430ff9f444  1a84  9280000c       movn x12, #0x0
0x9430ff9f448  1a88  17fff99e       b #-0x1988 (addr 0x9430ff9dac0)
0x9430ff9f44c  1a8c  d280000c       movz x12, #0x0
0x9430ff9f450  1a90  17fff99c       b #-0x1990 (addr 0x9430ff9dac0)
0x9430ff9f454  1a94  1e692120       fcmp d9, d9
0x9430ff9f458  1a98  54000060       b.eq #+0xc (addr 0x9430ff9f464)
0x9430ff9f45c  1a9c  d280000c       movz x12, #0x0
0x9430ff9f460  1aa0  17fff9a0       b #-0x1980 (addr 0x9430ff9dae0)
0x9430ff9f464  1aa4  1e202108       fcmp s8, #0.0
0x9430ff9f468  1aa8  54ffffa3       b.lo #-0xc (addr 0x9430ff9f45c)
0x9430ff9f46c  1aac  9280000c       movn x12, #0x0
0x9430ff9f470  1ab0  17fff99c       b #-0x1990 (addr 0x9430ff9dae0)
0x9430ff9f474  1ab4  fd0117e5       str d5, [sp, #552]
0x9430ff9f478  1ab8  f90123f5       str x21, [sp, #576]
0x9430ff9f47c  1abc  f90127f4       str x20, [sp, #584]
0x9430ff9f480  1ac0  97fc09d4       bl #-0xfd8b0 (addr 0x9430fea1bd0)
0x9430ff9f484  1ac4  f94133e9       ldr x9, [sp, #608]
0x9430ff9f488  1ac8  f9401be6       ldr x6, [sp, #48]
0x9430ff9f48c  1acc  f94037ef       ldr x15, [sp, #104]
0x9430ff9f490  1ad0  f940efed       ldr x13, [sp, #472]
0x9430ff9f494  1ad4  f940f7e8       ldr x8, [sp, #488]
0x9430ff9f498  1ad8  f9411bec       ldr x12, [sp, #560]
0x9430ff9f49c  1adc  f9413fea       ldr x10, [sp, #632]
0x9430ff9f4a0  1ae0  f94127f4       ldr x20, [sp, #584]
0x9430ff9f4a4  1ae4  fd4117e5       ldr d5, [sp, #552]
0x9430ff9f4a8  1ae8  f9412be0       ldr x0, [sp, #592]
0x9430ff9f4ac  1aec  f9412ff3       ldr x19, [sp, #600]
0x9430ff9f4b0  1af0  f94137ee       ldr x14, [sp, #616]
0x9430ff9f4b4  1af4  f94123f5       ldr x21, [sp, #576]
0x9430ff9f4b8  1af8  17fff9ce       b #-0x18c8 (addr 0x9430ff9dbf0)
0x9430ff9f4bc  1afc  fd0117e5       str d5, [sp, #552]
0x9430ff9f4c0  1b00  f90123ec       str x12, [sp, #576]
0x9430ff9f4c4  1b04  f90137e2       str x2, [sp, #616]
0x9430ff9f4c8  1b08  97fc09c2       bl #-0xfd8f8 (addr 0x9430fea1bd0)
0x9430ff9f4cc  1b0c  f94133e9       ldr x9, [sp, #608]
0x9430ff9f4d0  1b10  f9401be6       ldr x6, [sp, #48]
0x9430ff9f4d4  1b14  f94023f4       ldr x20, [sp, #64]
0x9430ff9f4d8  1b18  f94043ee       ldr x14, [sp, #128]
0x9430ff9f4dc  1b1c  f940f7e8       ldr x8, [sp, #488]
0x9430ff9f4e0  1b20  f9412feb       ldr x11, [sp, #600]
0x9430ff9f4e4  1b24  f9411bf6       ldr x22, [sp, #560]
0x9430ff9f4e8  1b28  f9413fea       ldr x10, [sp, #632]
0x9430ff9f4ec  1b2c  f94137e2       ldr x2, [sp, #616]
0x9430ff9f4f0  1b30  fd4117e5       ldr d5, [sp, #552]
0x9430ff9f4f4  1b34  f94103e0       ldr x0, [sp, #512]
0x9430ff9f4f8  1b38  f9412bf5       ldr x21, [sp, #592]
0x9430ff9f4fc  1b3c  f94127f3       ldr x19, [sp, #584]
0x9430ff9f500  1b40  f94123ec       ldr x12, [sp, #576]
0x9430ff9f504  1b44  17fffa00       b #-0x1800 (addr 0x9430ff9dd04)
0x9430ff9f508  1b48  fd0117e5       str d5, [sp, #552]
0x9430ff9f50c  1b4c  f90127f6       str x22, [sp, #584]
0x9430ff9f510  1b50  f90137e2       str x2, [sp, #616]
0x9430ff9f514  1b54  97fc09af       bl #-0xfd944 (addr 0x9430fea1bd0)
0x9430ff9f518  1b58  f94133e9       ldr x9, [sp, #608]
0x9430ff9f51c  1b5c  f9401be6       ldr x6, [sp, #48]
0x9430ff9f520  1b60  f94047f3       ldr x19, [sp, #136]
0x9430ff9f524  1b64  f9402fed       ldr x13, [sp, #88]
0x9430ff9f528  1b68  f9412feb       ldr x11, [sp, #600]
0x9430ff9f52c  1b6c  f9412bec       ldr x12, [sp, #592]
0x9430ff9f530  1b70  f9411bf7       ldr x23, [sp, #560]
0x9430ff9f534  1b74  f9413fea       ldr x10, [sp, #632]
0x9430ff9f538  1b78  f94137e2       ldr x2, [sp, #616]
0x9430ff9f53c  1b7c  fd4117e5       ldr d5, [sp, #552]
0x9430ff9f540  1b80  f94107e0       ldr x0, [sp, #520]
0x9430ff9f544  1b84  f94123f5       ldr x21, [sp, #576]
0x9430ff9f548  1b88  f94103ef       ldr x15, [sp, #512]
0x9430ff9f54c  1b8c  f94127f6       ldr x22, [sp, #584]
0x9430ff9f550  1b90  17fffa2e       b #-0x1748 (addr 0x9430ff9de08)
0x9430ff9f554  1b94  fd0117e5       str d5, [sp, #552]
0x9430ff9f558  1b98  f9011fea       str x10, [sp, #568]
0x9430ff9f55c  1b9c  f90127e2       str x2, [sp, #584]
0x9430ff9f560  1ba0  97fc099c       bl #-0xfd990 (addr 0x9430fea1bd0)
0x9430ff9f564  1ba4  f94133e9       ldr x9, [sp, #608]
0x9430ff9f568  1ba8  f9401be6       ldr x6, [sp, #48]
0x9430ff9f56c  1bac  f94033f4       ldr x20, [sp, #96]
0x9430ff9f570  1bb0  f9404bee       ldr x14, [sp, #144]
0x9430ff9f574  1bb4  f94137e8       ldr x8, [sp, #616]
0x9430ff9f578  1bb8  f9412bec       ldr x12, [sp, #592]
0x9430ff9f57c  1bbc  f94127e2       ldr x2, [sp, #584]
0x9430ff9f580  1bc0  fd4117e5       ldr d5, [sp, #552]
0x9430ff9f584  1bc4  f9413fe0       ldr x0, [sp, #632]
0x9430ff9f588  1bc8  f9411bf6       ldr x22, [sp, #560]
0x9430ff9f58c  1bcc  f94107f5       ldr x21, [sp, #520]
0x9430ff9f590  1bd0  f940f3ef       ldr x15, [sp, #480]
0x9430ff9f594  1bd4  f9411fea       ldr x10, [sp, #568]
0x9430ff9f598  1bd8  17fffa61       b #-0x167c (addr 0x9430ff9df1c)
0x9430ff9f59c  1bdc  f9013bf6       str x22, [sp, #624]
0x9430ff9f5a0  1be0  97fc098c       bl #-0xfd9d0 (addr 0x9430fea1bd0)
0x9430ff9f5a4  1be4  f9413bf6       ldr x22, [sp, #624]
0x9430ff9f5a8  1be8  f94133e9       ldr x9, [sp, #608]
0x9430ff9f5ac  1bec  f9412fec       ldr x12, [sp, #600]
0x9430ff9f5b0  1bf0  f94127f3       ldr x19, [sp, #584]
0x9430ff9f5b4  1bf4  f94123ed       ldr x13, [sp, #576]
0x9430ff9f5b8  1bf8  f9411ff5       ldr x21, [sp, #568]
0x9430ff9f5bc  1bfc  1e2e1008       fmov s8, #0x70 (1.0000)
0x9430ff9f5c0  1c00  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9f5c4  1c04  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9f5c8  1c08  3dc04fe7       ldr q7, [sp, #304]
0x9430ff9f5cc  1c0c  3dc04be4       ldr q4, [sp, #288]
0x9430ff9f5d0  1c10  3dc047e5       ldr q5, [sp, #272]
0x9430ff9f5d4  1c14  d2800044       movz x4, #0x2
0x9430ff9f5d8  1c18  d2800023       movz x3, #0x1
0x9430ff9f5dc  1c1c  d2800002       movz x2, #0x0
0x9430ff9f5e0  1c20  f9401be6       ldr x6, [sp, #48]
0x9430ff9f5e4  1c24  f9401fe1       ldr x1, [sp, #56]
0x9430ff9f5e8  1c28  f94033f4       ldr x20, [sp, #96]
0x9430ff9f5ec  1c2c  f94047e0       ldr x0, [sp, #136]
0x9430ff9f5f0  1c30  f94023ef       ldr x15, [sp, #64]
0x9430ff9f5f4  1c34  f94037fc       ldr x28, [sp, #104]
0x9430ff9f5f8  1c38  f9404bee       ldr x14, [sp, #144]
0x9430ff9f5fc  1c3c  f9402ff7       ldr x23, [sp, #88]
0x9430ff9f600  1c40  f94043fb       ldr cp, [sp, #128]
0x9430ff9f604  1c44  f940eff9       ldr x25, [sp, #472]
0x9430ff9f608  1c48  17fffac9       b #-0x14dc (addr 0x9430ff9e12c)
0x9430ff9f60c  1c4c  1e6620c0       fcmp d6, d6
0x9430ff9f610  1c50  54000060       b.eq #+0xc (addr 0x9430ff9f61c)
0x9430ff9f614  1c54  d2800008       movz x8, #0x0
0x9430ff9f618  1c58  17fffb23       b #-0x1374 (addr 0x9430ff9e2a4)
0x9430ff9f61c  1c5c  1e2020a8       fcmp s5, #0.0
0x9430ff9f620  1c60  54ffffa3       b.lo #-0xc (addr 0x9430ff9f614)
0x9430ff9f624  1c64  92800008       movn x8, #0x0
0x9430ff9f628  1c68  17fffb1f       b #-0x1384 (addr 0x9430ff9e2a4)
0x9430ff9f62c  1c6c  1e6520a0       fcmp d5, d5
0x9430ff9f630  1c70  54000060       b.eq #+0xc (addr 0x9430ff9f63c)
0x9430ff9f634  1c74  d280000b       movz x11, #0x0
0x9430ff9f638  1c78  17fffb43       b #-0x12f4 (addr 0x9430ff9e344)
0x9430ff9f63c  1c7c  1e202088       fcmp s4, #0.0
0x9430ff9f640  1c80  54ffffa3       b.lo #-0xc (addr 0x9430ff9f634)
0x9430ff9f644  1c84  9280000b       movn x11, #0x0
0x9430ff9f648  1c88  17fffb3f       b #-0x1304 (addr 0x9430ff9e344)
0x9430ff9f64c  1c8c  97fc0961       bl #-0xfda7c (addr 0x9430fea1bd0)
0x9430ff9f650  1c90  f94143e4       ldr x4, [sp, #640]
0x9430ff9f654  1c94  f94133f6       ldr x22, [sp, #608]
0x9430ff9f658  1c98  f94137e9       ldr x9, [sp, #616]
0x9430ff9f65c  1c9c  fd40e7e6       ldr d6, [sp, #456]
0x9430ff9f660  1ca0  fd40e3e7       ldr d7, [sp, #448]
0x9430ff9f664  1ca4  3dc06fe8       ldr q8, [sp, #432]
0x9430ff9f668  1ca8  fd40d7e9       ldr d9, [sp, #424]
0x9430ff9f66c  1cac  1e2e100d       fmov s13, #0x70 (1.0000)
0x9430ff9f670  1cb0  fd40cfe1       ldr d1, [sp, #408]
0x9430ff9f674  1cb4  fd40cbe0       ldr d0, [sp, #400]
0x9430ff9f678  1cb8  fd40c7e3       ldr d3, [sp, #392]
0x9430ff9f67c  1cbc  fd40c3e2       ldr d2, [sp, #384]
0x9430ff9f680  1cc0  3dc04fec       ldr q12, [sp, #304]
0x9430ff9f684  1cc4  3dc04beb       ldr q11, [sp, #288]
0x9430ff9f688  1cc8  3dc047ea       ldr q10, [sp, #272]
0x9430ff9f68c  1ccc  3dc043e4       ldr q4, [sp, #256]
0x9430ff9f690  1cd0  3dc03fe5       ldr q5, [sp, #240]
0x9430ff9f694  1cd4  f94077e0       ldr x0, [sp, #232]
0x9430ff9f698  1cd8  f94073fb       ldr cp, [sp, #224]
0x9430ff9f69c  1cdc  f9406ffc       ldr x28, [sp, #216]
0x9430ff9f6a0  1ce0  d2800042       movz x2, #0x2
0x9430ff9f6a4  1ce4  d2800021       movz x1, #0x1
0x9430ff9f6a8  1ce8  f94067f9       ldr x25, [sp, #200]
0x9430ff9f6ac  1cec  d2800018       movz x24, #0x0
0x9430ff9f6b0  1cf0  f9400fed       ldr x13, [sp, #24]
0x9430ff9f6b4  1cf4  f9400bf3       ldr x19, [sp, #16]
0x9430ff9f6b8  1cf8  f94007ee       ldr x14, [sp, #8]
0x9430ff9f6bc  1cfc  f94013ef       ldr x15, [sp, #32]
0x9430ff9f6c0  1d00  f94027f4       ldr x20, [sp, #72]
0x9430ff9f6c4  1d04  f9403bf7       ldr x23, [sp, #112]
0x9430ff9f6c8  1d08  f94017e8       ldr x8, [sp, #40]
0x9430ff9f6cc  1d0c  f9402bec       ldr x12, [sp, #80]
0x9430ff9f6d0  1d10  f9403fe6       ldr x6, [sp, #120]
0x9430ff9f6d4  1d14  17fffb71       b #-0x123c (addr 0x9430ff9e498)
0x9430ff9f6d8  1d18  97fc093e       bl #-0xfdb08 (addr 0x9430fea1bd0)
0x9430ff9f6dc  1d1c  f9405be5       ldr x5, [sp, #176]
0x9430ff9f6e0  1d20  f94057e4       ldr x4, [sp, #168]
0x9430ff9f6e4  1d24  f94053e3       ldr x3, [sp, #160]
0x9430ff9f6e8  1d28  f9404fe2       ldr x2, [sp, #152]
0x9430ff9f6ec  1d2c  17fffc20       b #-0xf80 (addr 0x9430ff9e76c)
0x9430ff9f6f0  1d30  97fc0888       bl #-0xfdde0 (addr 0x9430fea1910)
0x9430ff9f6f4  1d34  d503201f       nop
0x9430ff9f6f8  1d38  5800007f       constant pool begin (num_const = 3)
0x9430ff9f6fc  1d3c  d63f03e0       constant
0x9430ff9f700  1d40  05502af4       constant
0x9430ff9f704  1d44  00000001       constant

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
       76c         
       77c         
       78c         
       79c         
       7ac         
       7b8         
       7bc         
       7c8         
       7cc         
       7d8         
       7dc         
       7ec         
       7f8         
       800         
       808         
       80c         
       814         
       820         
       830         
       83c         
       848         
       84c         
       9ec         
       9f4         
       af8         
       b00         
       e2c         
       e3c         
       ea4         
       ed0         
       ed8         
       ee4         
       f18         
       f20         
       f28         
       f34         
       f40         
       f48         
       f54         
       f60         
       f68         
       f74         
       f80         
       f88         
       f90         
       f98         
       fa0         
      1028         
      104c         
      1054         
      1060         
      1090         
      109c         
      10a4         
      10ac         
      10b8         
      10c0         
      10c8         
      10d4         
      10dc         
      10e4         
      10ec         
      116c         
      1184         
      11d4         
      11dc         
      1220         
      1230         
      1278         
      1284         
      12c4         
      12d4         
      131c         
      1328         
      1368         
      1378         
      13c0         
      13cc         
      140c         
      141c         
      1464         
      1470         
      14b0         
      14c0         
      1508         
      1514         
      1554         
      1564         
      15ac         
      15b8         
      160c         
      1618         
      1620         
      1628         
      1630         
      1638         
      1640         
      1648         
      1650         
      1658         
      1664         
      17a4         
      17ac         
      17f0         
      17f8         
      183c         
      1848         
      1850         
      1858         
      1860         
      1868         
      1870         
      1878         
      1880         
      188c         
      18b4         
      18c0         
      18c4         
      1920         
      1924         
      1934         
      1938         
      1948         
      194c         
      195c         
      1960         

Source positions:
 pc offset  position
        44        74
        64       111
        b4       180
       14c       293
       158       303
       160       307
       168       314
       170       318
       17c       329
       184       334
       18c       339
       194       344
       198       347
       1c4       361
       1d8       374
       1e0       381
       1e8       393
       1f0       400
       238       442
       24c       471
       274       500
       280       512
       2cc       528
       2e0       533
       2e8       544
       304       563
       308       568
       310       575
       34c       617
       360       646
       388       675
       394       687
       3e0       703
       3e8       708
       3f0       719
       400       738
       408       743
       410       750
       450       793
       464       822
       48c       851
       498       863
       4e4       879
       4ec       884
       4f4       895
       504       914
       50c       919
       514       926
       564       965
       578       994
       5b0      1023
       5bc      1035
       604      1051
       618      1056
       620      1067
       62c      1080
       638      1087
       63c      1097
       640      1101
       644      1109
       64c      1115
       650      1125
       658      1129
       65c      1137
       660      1143
       668      1150
       66c      1159
       674      1163
       678      1169
       67c      1178
       680      1185
       684      1192
       6ac      1204
       6b0      1211
       6b8      1218
       6cc      1241
       6d4      1248
       6d8      1255
       6e0      1262
       6e4      1269
       6e8      1276
       6fc      1293
       76c      1320
       77c      1332
       78c      1344
       79c      1356
       7ac      1366
       7b8      1379
       7bc      1386
       7c8      1394
       7cc      1401
       7d8      1409
       7dc      1418
       7e8      1426
       7f8      1429
       800      1436
       808      1443
       80c      1450
       814      1457
       820      1464
       830      1487
       83c      1493
       848      1501
       84c      1509
       854      1526
       9e8      1793
       9f4      1800
       af8      1909
       b00      1922
       c78      2237
       e28      2320
       e3c      2339
       ea4      2427
       ed0      2465
       ed8      2474
       ee4      2489
       f18      2555
       f20      2563
       f28      2572
       f34      2586
       f40      2601
       f48      2608
       f54      2621
       f60      2632
       f68      2640
       f74      2654
       f80      2665
       f88      2673
       f90      2680
       f98      2690
       fa0      2699
      1028      2876
      104c      2914
      1054      2923
      1060      2938
      1090      2994
      109c      3009
      10a4      3016
      10ac      3024
      10b8      3035
      10c0      3043
      10c8      3052
      10d4      3063
      10dc      3071
      10e4      3082
      10ec      3090
      1168      3178
      1184      3193
      11d4      3254
      11dc      3262
      1220      3306
      1230      3321
      1278      3382
      1284      3390
      12c4      3434
      12d4      3449
      131c      3510
      1328      3518
      1368      3562
      1378      3577
      13c0      3638
      13cc      3646
      140c      3690
      141c      3705
      1464      3766
      1470      3774
      14b0      3818
      14c0      3833
      1508      3894
      1514      3902
      1554      3944
      1564      3959
      15ac      4020
      15b8      4028
      1608      4076
      1610      4083
      1620      4088
      1628      4097
      1630      4106
      1638      4114
      1640      4122
      1648      4131
      1650      4140
      1658      4148
      165c      4158
      17a4      4688
      17ac      4697
      17f0      4799
      17f8      4808
      183c      4913
      1848      4924
      1850      4932
      1858      4940
      1860      4948
      1868      4956
      1870      4964
      1878      4972
      1880      4980
      1884      4990
      18b4      5030
      18bc      5037
      18c4      5046
      18d0      5074
      191c      5101
      1924      5104
      1934      5114
      1938      5117
      1948      5127
      194c      5130
      195c      5140
      1960      5143
      1a54         0
      1ab4       416
      1afc       591
      1b48       767
      1b94       939
      1bdc      1312
      1c8c      1846
      1d18      2213
      1d30      1526

Safepoints (stack slots = 86, entries = 1, byte size = 25)
0x9430ff9db7c    1bc  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 75)
0x9430ff9db78  internal wasm call
0x9430ff9dc50  internal wasm call
0x9430ff9dd60  internal wasm call
0x9430ff9de64  internal wasm call
0x9430ff9df88  internal wasm call
0x9430ff9e244  external reference (0x105502af4)
0x9430ff9e664  internal wasm call
0x9430ff9e6c0  internal wasm call
0x9430ff9e71c  internal wasm call
0x9430ff9e784  internal wasm call
0x9430ff9f2a8  internal wasm call
0x9430ff9f414  wasm stub call  (0x9430fea1bd0)
0x9430ff9f480  wasm stub call  (0x9430fea1bd0)
0x9430ff9f4c8  wasm stub call  (0x9430fea1bd0)
0x9430ff9f514  wasm stub call  (0x9430fea1bd0)
0x9430ff9f560  wasm stub call  (0x9430fea1bd0)
0x9430ff9f5a0  wasm stub call  (0x9430fea1bd0)
0x9430ff9f64c  wasm stub call  (0x9430fea1bd0)
0x9430ff9f6d8  wasm stub call  (0x9430fea1bd0)
0x9430ff9f6f0  wasm stub call  (0x9430fea1910)
0x9430ff9f6f8  constant pool (size 16)
