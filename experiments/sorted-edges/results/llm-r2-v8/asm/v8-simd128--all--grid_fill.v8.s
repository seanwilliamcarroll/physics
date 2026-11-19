name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x3b29a858fdc0     0  55                   push rbp
0x3b29a858fdc1     1  4889e5               REX.W movq rbp,rsp
0x3b29a858fdc4     4  6a08                 push 0x8
0x3b29a858fdc6     6  56                   push rsi
0x3b29a858fdc7     7  4881ec80000000       REX.W subq rsp,0x80
0x3b29a858fdce     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3b29a858fdd2    12  48894580             REX.W movq [rbp-0x80],rax
0x3b29a858fdd6    16  48895588             REX.W movq [rbp-0x78],rdx
0x3b29a858fdda    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x3b29a858fde1    21  48895d90             REX.W movq [rbp-0x70],rbx
0x3b29a858fde5    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x3b29a858fde9    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x3b29a858fded    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858fdf1    31  0f8667090000         jna 0x3b29a859075e  <+0x99e>
0x3b29a858fdf7    37  448be0               movl r12,rax
0x3b29a858fdfa    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x3b29a858fe03    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3b29a858fe08    48  478b742328           movl r14,[r11+r12*1+0x28]
0x3b29a858fe0d    4d  450faff7             imull r14,r15
0x3b29a858fe11    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x3b29a858fe15    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x3b29a858fe19    59  4d8bfe               REX.W movq r15,r14
0x3b29a858fe1c    5c  4183c701             addl r15,0x1
0x3b29a858fe20    60  0f850c000000         jnz 0x3b29a858fe32  <+0x72>
0x3b29a858fe26    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x3b29a858fe2a    6a  4533ff               xorl r15,r15
0x3b29a858fe2d    6d  e928010000           jmp 0x3b29a858ff5a  <+0x19a>
0x3b29a858fe32    72  438b3c23             movl rdi,[r11+r12*1]
0x3b29a858fe36    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x3b29a858fe3a    7a  47393c23             cmpl [r11+r12*1],r15
0x3b29a858fe3e    7e  0f8341000000         jnc 0x3b29a858fe85  <+0xc5>
0x3b29a858fe44    84  498bcf               REX.W movq rcx,r15
0x3b29a858fe47    87  33d2                 xorl rdx,rdx
0x3b29a858fe49    89  e8b23ef2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a858fe4e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3b29a858fe52    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3b29a858fe56    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x3b29a858fe5b    9b  4489e7               movl rdi,r12
0x3b29a858fe5e    9e  4d8be3               REX.W movq r12,r11
0x3b29a858fe61    a1  4c8bdb               REX.W movq r11,rbx
0x3b29a858fe64    a4  8b5588               movl rdx,[rbp-0x78]
0x3b29a858fe67    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a858fe6d    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858fe71    b1  8b4580               movl rax,[rbp-0x80]
0x3b29a858fe74    b4  448b4dc0             movl r9,[rbp-0x40]
0x3b29a858fe78    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3b29a858fe7c    bc  448b75b0             movl r14,[rbp-0x50]
0x3b29a858fe80    c0  e902000000           jmp 0x3b29a858fe87  <+0xc7>
0x3b29a858fe85    c5  33ff                 xorl rdi,rdi
0x3b29a858fe87    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x3b29a858fe8c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x3b29a858fe90    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x3b29a858fe94    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x3b29a858fe98    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x3b29a858fe9c    dc  4585f6               testl r14,r14
0x3b29a858fe9f    df  0f84a4000000         jz 0x3b29a858ff49  <+0x189>
0x3b29a858fea5    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x3b29a858fead    ed  83c3fc               addl rbx,0xfc
0x3b29a858feb0    f0  0f8480000000         jz 0x3b29a858ff36  <+0x176>
0x3b29a858feb6    f6  4989e2               REX.W movq r10,rsp
0x3b29a858feb9    f9  4883ec08             REX.W subq rsp,0x8
0x3b29a858febd    fd  4883e4f0             REX.W andq rsp,0xf0
0x3b29a858fec1   101  4c891424             REX.W movq [rsp],r10
0x3b29a858fec5   105  488bfe               REX.W movq rdi,rsi
0x3b29a858fec8   108  4c8bc3               REX.W movq r8,rbx
0x3b29a858fecb   10b  8b55e8               movl rdx,[rbp-0x18]
0x3b29a858fece   10e  33c9                 xorl rcx,rcx
0x3b29a858fed0   110  488bf1               REX.W movq rsi,rcx
0x3b29a858fed3   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3b29a858fedd   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3b29a858fee4   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3b29a858feeb   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3b29a858fef2   132  ffd0                 call rax
0x3b29a858fef4   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3b29a858feff   13f  488b2424             REX.W movq rsp,[rsp]
0x3b29a858ff03   143  85c0                 testl rax,rax
0x3b29a858ff05   145  0f843b0a0000         jz 0x3b29a8590946  <+0xb86>
0x3b29a858ff0b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a858ff0f   14f  8b5588               movl rdx,[rbp-0x78]
0x3b29a858ff12   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a858ff16   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a858ff1c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858ff20   160  8b4580               movl rax,[rbp-0x80]
0x3b29a858ff23   163  448b4dc0             movl r9,[rbp-0x40]
0x3b29a858ff27   167  8b7db8               movl rdi,[rbp-0x48]
0x3b29a858ff2a   16a  448b45c8             movl r8,[rbp-0x38]
0x3b29a858ff2e   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3b29a858ff32   172  448b75b0             movl r14,[rbp-0x50]
0x3b29a858ff36   176  8bdf                 movl rbx,rdi
0x3b29a858ff38   178  4403f3               addl r14,rbx
0x3b29a858ff3b   17b  4103df               addl rbx,r15
0x3b29a858ff3e   17e  458bf8               movl r15,r8
0x3b29a858ff41   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x3b29a858ff46   186  418bfe               movl rdi,r14
0x3b29a858ff49   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x3b29a858ff51   191  8d5f01               leal rbx,[rdi+0x1]
0x3b29a858ff54   194  448bfb               movl r15,rbx
0x3b29a858ff57   197  8b5d90               movl rbx,[rbp-0x70]
0x3b29a858ff5a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x3b29a858ff5f   19f  458bc1               movl r8,r9
0x3b29a858ff62   1a2  448bf1               movl r14,rcx
0x3b29a858ff65   1a5  443bc1               cmpl r8,rcx
0x3b29a858ff68   1a8  450f42f0             cmovcl r14,r8
0x3b29a858ff6c   1ac  33ff                 xorl rdi,rdi
0x3b29a858ff6e   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x3b29a858ff72   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x3b29a858ff76   1b6  4585f6               testl r14,r14
0x3b29a858ff79   1b9  0f850e000000         jnz 0x3b29a858ff8d  <+0x1cd>
0x3b29a858ff7f   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x3b29a858ff84   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a858ff88   1c8  e904020000           jmp 0x3b29a8590191  <+0x3d1>
0x3b29a858ff8d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x3b29a858ff92   1d2  4533c9               xorl r9,r9
0x3b29a858ff95   1d5  4585c0               testl r8,r8
0x3b29a858ff98   1d8  410f95c1             setnzl r9l
0x3b29a858ff9c   1dc  452bc1               subl r8,r9
0x3b29a858ff9f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x3b29a858ffa4   1e4  33db                 xorl rbx,rbx
0x3b29a858ffa6   1e6  4585c9               testl r9,r9
0x3b29a858ffa9   1e9  0f95c3               setnzl bl
0x3b29a858ffac   1ec  458bf1               movl r14,r9
0x3b29a858ffaf   1ef  442bf3               subl r14,rbx
0x3b29a858ffb2   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x3b29a858ffb7   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3b29a858ffbe   1fe  448b55e8             movl r10,[rbp-0x18]
0x3b29a858ffc2   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x3b29a858ffc6   206  8bca                 movl rcx,rdx
0x3b29a858ffc8   208  8b5590               movl rdx,[rbp-0x70]
0x3b29a858ffcb   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a858ffcf   20f  e930000000           jmp 0x3b29a8590004  <+0x244>
0x3b29a858ffd4   214  660f1f840000000000   nop
0x3b29a858ffdd   21d  660f1f840000000000   nop
0x3b29a858ffe6   226  660f1f840000000000   nop
0x3b29a858ffef   22f  660f1f840000000000   nop
0x3b29a858fff8   238  0f1f840000000000     nop
0x3b29a8590000   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x3b29a8590004   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a8590008   248  0f8675070000         jna 0x3b29a8590783  <+0x9c3>
0x3b29a859000e   24e  8bf1                 movl rsi,rcx
0x3b29a8590010   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x3b29a8590016   256  c5f82ed2             vucomiss xmm2,xmm2
0x3b29a859001a   25a  7a06                 jpe 0x3b29a8590022  <+0x262>
0x3b29a859001c   25c  0f8404000000         jz 0x3b29a8590026  <+0x266>
0x3b29a8590022   262  c5f928d1             vmovapd xmm2,xmm1
0x3b29a8590026   266  c5f82ed1             vucomiss xmm2,xmm1
0x3b29a859002a   26a  0f8704000000         ja 0x3b29a8590034  <+0x274>
0x3b29a8590030   270  c5f928d1             vmovapd xmm2,xmm1
0x3b29a8590034   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3b29a8590038   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3b29a859003e   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x3b29a8590042   282  85f6                 testl rsi,rsi
0x3b29a8590044   284  0f8929000000         jns 0x3b29a8590073  <+0x2b3>
0x3b29a859004a   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3b29a8590054   294  c441f96efa           vmovq xmm15,r10
0x3b29a8590059   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3b29a859005d   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x3b29a8590062   2a2  85f6                 testl rsi,rsi
0x3b29a8590064   2a4  0f8809000000         js 0x3b29a8590073  <+0x2b3>
0x3b29a859006a   2aa  41ba00000080         movl r10,0x80000000
0x3b29a8590070   2b0  410bf2               orl rsi,r10
0x3b29a8590073   2b3  448bd6               movl r10,rsi
0x3b29a8590076   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3b29a859007b   2bb  c5f92eec             vucomisd xmm5,xmm4
0x3b29a859007f   2bf  0f8a53070000         jpe 0x3b29a85907d8  <+0xa18>
0x3b29a8590085   2c5  0f854d070000         jnz 0x3b29a85907d8  <+0xa18>
0x3b29a859008b   2cb  8bc6                 movl rax,rsi
0x3b29a859008d   2cd  443bf6               cmpl r14,rsi
0x3b29a8590090   2d0  410f42c6             cmovcl rax,r14
0x3b29a8590094   2d4  83c001               addl rax,0x1
0x3b29a8590097   2d7  41ba0000804f         movl r10,0x4f800000
0x3b29a859009d   2dd  c4c1796eda           vmovd xmm3,r10
0x3b29a85900a2   2e2  be01000000           movl rsi,0x1
0x3b29a85900a7   2e7  c5f82eda             vucomiss xmm3,xmm2
0x3b29a85900ab   2eb  0f47f0               cmoval rsi,rax
0x3b29a85900ae   2ee  8bc2                 movl rax,rdx
0x3b29a85900b0   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x3b29a85900b6   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x3b29a85900ba   2fa  7a06                 jpe 0x3b29a85900c2  <+0x302>
0x3b29a85900bc   2fc  0f8404000000         jz 0x3b29a85900c6  <+0x306>
0x3b29a85900c2   302  c5f928d1             vmovapd xmm2,xmm1
0x3b29a85900c6   306  c5f82ed1             vucomiss xmm2,xmm1
0x3b29a85900ca   30a  0f8704000000         ja 0x3b29a85900d4  <+0x314>
0x3b29a85900d0   310  c5f928d1             vmovapd xmm2,xmm1
0x3b29a85900d4   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3b29a85900d8   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3b29a85900de   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x3b29a85900e2   322  85c0                 testl rax,rax
0x3b29a85900e4   324  0f8926000000         jns 0x3b29a8590110  <+0x350>
0x3b29a85900ea   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x3b29a85900f1   331  c441f96efa           vmovq xmm15,r10
0x3b29a85900f6   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3b29a85900fa   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x3b29a85900ff   33f  85c0                 testl rax,rax
0x3b29a8590101   341  0f8809000000         js 0x3b29a8590110  <+0x350>
0x3b29a8590107   347  41ba00000080         movl r10,0x80000000
0x3b29a859010d   34d  410bc2               orl rax,r10
0x3b29a8590110   350  448bd0               movl r10,rax
0x3b29a8590113   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3b29a8590118   358  c5f92ef5             vucomisd xmm6,xmm5
0x3b29a859011c   35c  0f8ad8060000         jpe 0x3b29a85907fa  <+0xa3a>
0x3b29a8590122   362  0f85d2060000         jnz 0x3b29a85907fa  <+0xa3a>
0x3b29a8590128   368  448be0               movl r12,rax
0x3b29a859012b   36b  443bc0               cmpl r8,rax
0x3b29a859012e   36e  450f42e0             cmovcl r12,r8
0x3b29a8590132   372  488bc7               REX.W movq rax,rdi
0x3b29a8590135   375  c5f82eda             vucomiss xmm3,xmm2
0x3b29a8590139   379  410f47c4             cmoval rax,r12
0x3b29a859013d   37d  458be1               movl r12,r9
0x3b29a8590140   380  440fafe0             imull r12,rax
0x3b29a8590144   384  4403e6               addl r12,rsi
0x3b29a8590147   387  4539e7               cmpl r15,r12
0x3b29a859014a   38a  0f860f000000         jna 0x3b29a859015f  <+0x39f>
0x3b29a8590150   390  468d24a3             leal r12,[rbx+r12*4]
0x3b29a8590154   394  438b0423             movl rax,[r11+r12*1]
0x3b29a8590158   398  83c001               addl rax,0x1
0x3b29a859015b   39b  43890423             movl [r11+r12*1],rax
0x3b29a859015f   39f  83c104               addl rcx,0x4
0x3b29a8590162   3a2  83c204               addl rdx,0x4
0x3b29a8590165   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x3b29a8590169   3a9  4183c4ff             addl r12,0xff
0x3b29a859016d   3ad  0f858dfeffff         jnz 0x3b29a8590000  <+0x240>
0x3b29a8590173   3b3  448bc3               movl r8,rbx
0x3b29a8590176   3b6  448b75e8             movl r14,[rbp-0x18]
0x3b29a859017a   3ba  8b5d90               movl rbx,[rbp-0x70]
0x3b29a859017d   3bd  8b5588               movl rdx,[rbp-0x78]
0x3b29a8590180   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a8590184   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a859018a   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a859018e   3ce  8b4580               movl rax,[rbp-0x80]
0x3b29a8590191   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x3b29a8590198   3d8  4585ff               testl r15,r15
0x3b29a859019b   3db  0f8508000000         jnz 0x3b29a85901a9  <+0x3e9>
0x3b29a85901a1   3e1  488bdf               REX.W movq rbx,rdi
0x3b29a85901a4   3e4  e968020000           jmp 0x3b29a8590411  <+0x651>
0x3b29a85901a9   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x3b29a85901b1   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x3b29a85901b9   3f9  448bf3               movl r14,rbx
0x3b29a85901bc   3fc  41c1ee02             shrl r14, 2
0x3b29a85901c0   400  4183c601             addl r14,0x1
0x3b29a85901c4   404  418bd6               movl rdx,r14
0x3b29a85901c7   407  83e207               andl rdx,0x7
0x3b29a85901ca   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x3b29a85901ce   40e  83fb1c               cmpl rbx,0x1c
0x3b29a85901d1   411  0f82db000000         jc 0x3b29a85902b2  <+0x4f2>
0x3b29a85901d7   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x3b29a85901de   41e  418bd8               movl rbx,r8
0x3b29a85901e1   421  488bcf               REX.W movq rcx,rdi
0x3b29a85901e4   424  660f1f840000000000   nop
0x3b29a85901ed   42d  660f1f840000000000   nop
0x3b29a85901f6   436  660f1f840000000000   nop
0x3b29a85901ff   43f  90                   nop
0x3b29a8590200   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a8590204   444  0f8612060000         jna 0x3b29a859081c  <+0xa5c>
0x3b29a859020a   44a  418b341b             movl rsi,[r11+rbx*1]
0x3b29a859020e   44e  03ce                 addl rcx,rsi
0x3b29a8590210   450  41890c1b             movl [r11+rbx*1],rcx
0x3b29a8590214   454  8d7304               leal rsi,[rbx+0x4]
0x3b29a8590217   457  458b0433             movl r8,[r11+rsi*1]
0x3b29a859021b   45b  4103c8               addl rcx,r8
0x3b29a859021e   45e  41890c33             movl [r11+rsi*1],rcx
0x3b29a8590222   462  8d7308               leal rsi,[rbx+0x8]
0x3b29a8590225   465  458b0433             movl r8,[r11+rsi*1]
0x3b29a8590229   469  4103c8               addl rcx,r8
0x3b29a859022c   46c  41890c33             movl [r11+rsi*1],rcx
0x3b29a8590230   470  8d730c               leal rsi,[rbx+0xc]
0x3b29a8590233   473  458b0433             movl r8,[r11+rsi*1]
0x3b29a8590237   477  4103c8               addl rcx,r8
0x3b29a859023a   47a  41890c33             movl [r11+rsi*1],rcx
0x3b29a859023e   47e  8d7310               leal rsi,[rbx+0x10]
0x3b29a8590241   481  458b0433             movl r8,[r11+rsi*1]
0x3b29a8590245   485  4103c8               addl rcx,r8
0x3b29a8590248   488  41890c33             movl [r11+rsi*1],rcx
0x3b29a859024c   48c  8d7314               leal rsi,[rbx+0x14]
0x3b29a859024f   48f  458b0433             movl r8,[r11+rsi*1]
0x3b29a8590253   493  4103c8               addl rcx,r8
0x3b29a8590256   496  41890c33             movl [r11+rsi*1],rcx
0x3b29a859025a   49a  8d7318               leal rsi,[rbx+0x18]
0x3b29a859025d   49d  458b0433             movl r8,[r11+rsi*1]
0x3b29a8590261   4a1  4103c8               addl rcx,r8
0x3b29a8590264   4a4  41890c33             movl [r11+rsi*1],rcx
0x3b29a8590268   4a8  8d731c               leal rsi,[rbx+0x1c]
0x3b29a859026b   4ab  458b0433             movl r8,[r11+rsi*1]
0x3b29a859026f   4af  4103c8               addl rcx,r8
0x3b29a8590272   4b2  41890c33             movl [r11+rsi*1],rcx
0x3b29a8590276   4b6  83c320               addl rbx,0x20
0x3b29a8590279   4b9  4183c6f8             addl r14,0xf8
0x3b29a859027d   4bd  7581                 jnz 0x3b29a8590200  <+0x440>
0x3b29a859027f   4bf  85d2                 testl rdx,rdx
0x3b29a8590281   4c1  0f8510000000         jnz 0x3b29a8590297  <+0x4d7>
0x3b29a8590287   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a859028b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x3b29a8590292   4d2  e98b000000           jmp 0x3b29a8590322  <+0x562>
0x3b29a8590297   4d7  448bf3               movl r14,rbx
0x3b29a859029a   4da  8bd9                 movl rbx,rcx
0x3b29a859029c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a85902a2   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a85902a6   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x3b29a85902ad   4ed  e906000000           jmp 0x3b29a85902b8  <+0x4f8>
0x3b29a85902b2   4f2  488bdf               REX.W movq rbx,rdi
0x3b29a85902b5   4f5  458bf0               movl r14,r8
0x3b29a85902b8   4f8  c1e202               shll rdx, 2
0x3b29a85902bb   4fb  0f1f440000           nop
0x3b29a85902c0   500  438b0c33             movl rcx,[r11+r14*1]
0x3b29a85902c4   504  03d9                 addl rbx,rcx
0x3b29a85902c6   506  43891c33             movl [r11+r14*1],rbx
0x3b29a85902ca   50a  4183c604             addl r14,0x4
0x3b29a85902ce   50e  83c2fc               addl rdx,0xfc
0x3b29a85902d1   511  0f844b000000         jz 0x3b29a8590322  <+0x562>
0x3b29a85902d7   517  438b0c33             movl rcx,[r11+r14*1]
0x3b29a85902db   51b  03d9                 addl rbx,rcx
0x3b29a85902dd   51d  43891c33             movl [r11+r14*1],rbx
0x3b29a85902e1   521  4183c604             addl r14,0x4
0x3b29a85902e5   525  83c2fc               addl rdx,0xfc
0x3b29a85902e8   528  0f8434000000         jz 0x3b29a8590322  <+0x562>
0x3b29a85902ee   52e  438b0c33             movl rcx,[r11+r14*1]
0x3b29a85902f2   532  03d9                 addl rbx,rcx
0x3b29a85902f4   534  43891c33             movl [r11+r14*1],rbx
0x3b29a85902f8   538  4183c604             addl r14,0x4
0x3b29a85902fc   53c  83c2fc               addl rdx,0xfc
0x3b29a85902ff   53f  0f841d000000         jz 0x3b29a8590322  <+0x562>
0x3b29a8590305   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a8590309   549  0f864d050000         jna 0x3b29a859085c  <+0xa9c>
0x3b29a859030f   54f  438b0c33             movl rcx,[r11+r14*1]
0x3b29a8590313   553  03d9                 addl rbx,rcx
0x3b29a8590315   555  43891c33             movl [r11+r14*1],rbx
0x3b29a8590319   559  4183c604             addl r14,0x4
0x3b29a859031d   55d  83c2fc               addl rdx,0xfc
0x3b29a8590320   560  759e                 jnz 0x3b29a85902c0  <+0x500>
0x3b29a8590322   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x3b29a859032b   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x3b29a8590330   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x3b29a8590335   575  0f834a000000         jnc 0x3b29a8590385  <+0x5c5>
0x3b29a859033b   57b  8bd8                 movl rbx,rax
0x3b29a859033d   57d  8d430c               leal rax,[rbx+0xc]
0x3b29a8590340   580  418bcf               movl rcx,r15
0x3b29a8590343   583  488bd7               REX.W movq rdx,rdi
0x3b29a8590346   586  e8b539f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a859034b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3b29a859034f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3b29a8590353   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x3b29a8590358   598  4c8bd3               REX.W movq r10,rbx
0x3b29a859035b   59b  4489e3               movl rbx,r12
0x3b29a859035e   59e  4d8be3               REX.W movq r12,r11
0x3b29a8590361   5a1  4d8bda               REX.W movq r11,r10
0x3b29a8590364   5a4  33ff                 xorl rdi,rdi
0x3b29a8590366   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a859036a   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a859036e   5ae  8b4580               movl rax,[rbp-0x80]
0x3b29a8590371   5b1  448b7dd0             movl r15,[rbp-0x30]
0x3b29a8590375   5b5  448b4dc0             movl r9,[rbp-0x40]
0x3b29a8590379   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x3b29a8590380   5c0  e903000000           jmp 0x3b29a8590388  <+0x5c8>
0x3b29a8590385   5c5  488bdf               REX.W movq rbx,rdi
0x3b29a8590388   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x3b29a859038c   5cc  4d8bf7               REX.W movq r14,r15
0x3b29a859038f   5cf  41c1e602             shll r14, 2
0x3b29a8590393   5d3  0f8478000000         jz 0x3b29a8590411  <+0x651>
0x3b29a8590399   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x3b29a859039e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x3b29a85903a2   5e2  4989e2               REX.W movq r10,rsp
0x3b29a85903a5   5e5  4883ec08             REX.W subq rsp,0x8
0x3b29a85903a9   5e9  4883e4f0             REX.W andq rsp,0xf0
0x3b29a85903ad   5ed  4c891424             REX.W movq [rsp],r10
0x3b29a85903b1   5f1  488bd7               REX.W movq rdx,rdi
0x3b29a85903b4   5f4  4c8bd7               REX.W movq r10,rdi
0x3b29a85903b7   5f7  488bfe               REX.W movq rdi,rsi
0x3b29a85903ba   5fa  498bf2               REX.W movq rsi,r10
0x3b29a85903bd   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x3b29a85903c7   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3b29a85903ce   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3b29a85903d5   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3b29a85903dc   61c  ffd0                 call rax
0x3b29a85903de   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3b29a85903e9   629  488b2424             REX.W movq rsp,[rsp]
0x3b29a85903ed   62d  85c0                 testl rax,rax
0x3b29a85903ef   62f  0f844c050000         jz 0x3b29a8590941  <+0xb81>
0x3b29a85903f5   635  8b5dc8               movl rbx,[rbp-0x38]
0x3b29a85903f8   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a85903fc   63c  33ff                 xorl rdi,rdi
0x3b29a85903fe   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a8590402   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a8590406   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a859040a   64a  8b4580               movl rax,[rbp-0x80]
0x3b29a859040d   64d  448b7dd0             movl r15,[rbp-0x30]
0x3b29a8590411   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x3b29a859041a   65a  4103df               addl rbx,r15
0x3b29a859041d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x3b29a8590422   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x3b29a8590429   669  0f8508000000         jnz 0x3b29a8590437  <+0x677>
0x3b29a859042f   66f  488bdf               REX.W movq rbx,rdi
0x3b29a8590432   672  e90b010000           jmp 0x3b29a8590542  <+0x782>
0x3b29a8590437   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x3b29a859043c   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a8590442   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x3b29a8590447   687  0f833b000000         jnc 0x3b29a8590488  <+0x6c8>
0x3b29a859044d   68d  8bd8                 movl rbx,rax
0x3b29a859044f   68f  8d4318               leal rax,[rbx+0x18]
0x3b29a8590452   692  488bd7               REX.W movq rdx,rdi
0x3b29a8590455   695  e8a638f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a859045a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3b29a859045e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3b29a8590462   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x3b29a8590467   6a7  4c8bd3               REX.W movq r10,rbx
0x3b29a859046a   6aa  4489e3               movl rbx,r12
0x3b29a859046d   6ad  4d8be3               REX.W movq r12,r11
0x3b29a8590470   6b0  4d8bda               REX.W movq r11,r10
0x3b29a8590473   6b3  33ff                 xorl rdi,rdi
0x3b29a8590475   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a8590479   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a859047f   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a8590483   6c3  e903000000           jmp 0x3b29a859048b  <+0x6cb>
0x3b29a8590488   6c8  488bdf               REX.W movq rbx,rdi
0x3b29a859048b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3b29a8590490   6d0  418d149f             leal rdx,[r15+rbx*4]
0x3b29a8590494   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x3b29a8590498   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x3b29a859049c   6dc  83f901               cmpl rcx,0x1
0x3b29a859049f   6df  0f8492000000         jz 0x3b29a8590537  <+0x777>
0x3b29a85904a5   6e5  448bf1               movl r14,rcx
0x3b29a85904a8   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x3b29a85904b0   6f0  83c0fc               addl rax,0xfc
0x3b29a85904b3   6f3  0f846f000000         jz 0x3b29a8590528  <+0x768>
0x3b29a85904b9   6f9  4989e2               REX.W movq r10,rsp
0x3b29a85904bc   6fc  4883ec08             REX.W subq rsp,0x8
0x3b29a85904c0   700  4883e4f0             REX.W andq rsp,0xf0
0x3b29a85904c4   704  4c891424             REX.W movq [rsp],r10
0x3b29a85904c8   708  488bcf               REX.W movq rcx,rdi
0x3b29a85904cb   70b  4c8bd7               REX.W movq r10,rdi
0x3b29a85904ce   70e  488bfe               REX.W movq rdi,rsi
0x3b29a85904d1   711  498bf2               REX.W movq rsi,r10
0x3b29a85904d4   714  4c8bc0               REX.W movq r8,rax
0x3b29a85904d7   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x3b29a85904de   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3b29a85904e5   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3b29a85904ec   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3b29a85904f3   733  ffd0                 call rax
0x3b29a85904f5   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3b29a8590500   740  488b2424             REX.W movq rsp,[rsp]
0x3b29a8590504   744  85c0                 testl rax,rax
0x3b29a8590506   746  0f8430040000         jz 0x3b29a859093c  <+0xb7c>
0x3b29a859050c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a8590510   750  33ff                 xorl rdi,rdi
0x3b29a8590512   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a8590516   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a859051a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x3b29a859051d   75d  448b7dc8             movl r15,[rbp-0x38]
0x3b29a8590521   761  448bb570ffffff       movl r14,[rbp-0x90]
0x3b29a8590528   768  4103de               addl rbx,r14
0x3b29a859052b   76b  448d73ff             leal r14,[rbx-0x1]
0x3b29a859052f   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x3b29a8590534   774  418bde               movl rbx,r14
0x3b29a8590537   777  41c7041300000000     movl [r11+rdx*1],0x0
0x3b29a859053f   77f  83c301               addl rbx,0x1
0x3b29a8590542   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x3b29a8590547   787  837de800             cmpl [rbp-0x18],0x0
0x3b29a859054b   78b  0f8505000000         jnz 0x3b29a8590556  <+0x796>
0x3b29a8590551   791  488be5               REX.W movq rsp,rbp
0x3b29a8590554   794  5d                   pop rbp
0x3b29a8590555   795  c3                   retl
0x3b29a8590556   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3b29a859055b   79b  4533f6               xorl r14,r14
0x3b29a859055e   79e  4585ff               testl r15,r15
0x3b29a8590561   7a1  410f95c6             setnzl r14l
0x3b29a8590565   7a5  452bfe               subl r15,r14
0x3b29a8590568   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x3b29a859056d   7ad  33c0                 xorl rax,rax
0x3b29a859056f   7af  4585f6               testl r14,r14
0x3b29a8590572   7b2  0f95c0               setnzl al
0x3b29a8590575   7b5  418bd6               movl rdx,r14
0x3b29a8590578   7b8  2bd0                 subl rdx,rax
0x3b29a859057a   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3b29a859057f   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x3b29a8590584   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x3b29a8590589   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3b29a8590590   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x3b29a8590594   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x3b29a8590598   7d8  4c8be7               REX.W movq r12,rdi
0x3b29a859059b   7db  448b4d88             movl r9,[rbp-0x78]
0x3b29a859059f   7df  e924000000           jmp 0x3b29a85905c8  <+0x808>
0x3b29a85905a4   7e4  660f1f840000000000   nop
0x3b29a85905ad   7ed  660f1f840000000000   nop
0x3b29a85905b6   7f6  660f1f840000000000   nop
0x3b29a85905bf   7ff  90                   nop
0x3b29a85905c0   800  448b7d98             movl r15,[rbp-0x68]
0x3b29a85905c4   804  4c894590             REX.W movq [rbp-0x70],r8
0x3b29a85905c8   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a85905cc   80c  0f86cf020000         jna 0x3b29a85908a1  <+0xae1>
0x3b29a85905d2   812  448b7590             movl r14,[rbp-0x70]
0x3b29a85905d6   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3b29a85905dc   81c  c5f82ed2             vucomiss xmm2,xmm2
0x3b29a85905e0   820  7a06                 jpe 0x3b29a85905e8  <+0x828>
0x3b29a85905e2   822  0f8404000000         jz 0x3b29a85905ec  <+0x82c>
0x3b29a85905e8   828  c5f928d1             vmovapd xmm2,xmm1
0x3b29a85905ec   82c  c5f82ed1             vucomiss xmm2,xmm1
0x3b29a85905f0   830  0f8704000000         ja 0x3b29a85905fa  <+0x83a>
0x3b29a85905f6   836  c5f928d1             vmovapd xmm2,xmm1
0x3b29a85905fa   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3b29a85905fe   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3b29a8590604   844  c57b2cf4             vcvttsd2si r14,xmm4
0x3b29a8590608   848  4585f6               testl r14,r14
0x3b29a859060b   84b  0f8927000000         jns 0x3b29a8590638  <+0x878>
0x3b29a8590611   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x3b29a8590618   858  c441f96efa           vmovq xmm15,r10
0x3b29a859061d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3b29a8590621   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x3b29a8590626   866  4585f6               testl r14,r14
0x3b29a8590629   869  0f8809000000         js 0x3b29a8590638  <+0x878>
0x3b29a859062f   86f  41ba00000080         movl r10,0x80000000
0x3b29a8590635   875  450bf2               orl r14,r10
0x3b29a8590638   878  458bd6               movl r10,r14
0x3b29a859063b   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3b29a8590640   880  c5f92eec             vucomisd xmm5,xmm4
0x3b29a8590644   884  0f8aac020000         jpe 0x3b29a85908f6  <+0xb36>
0x3b29a859064a   88a  0f85a6020000         jnz 0x3b29a85908f6  <+0xb36>
0x3b29a8590650   890  458bc6               movl r8,r14
0x3b29a8590653   893  453bfe               cmpl r15,r14
0x3b29a8590656   896  450f42c7             cmovcl r8,r15
0x3b29a859065a   89a  41ba0000804f         movl r10,0x4f800000
0x3b29a8590660   8a0  c4c1796eda           vmovd xmm3,r10
0x3b29a8590665   8a5  4c8bf7               REX.W movq r14,rdi
0x3b29a8590668   8a8  c5f82eda             vucomiss xmm3,xmm2
0x3b29a859066c   8ac  450f47f0             cmoval r14,r8
0x3b29a8590670   8b0  448b45a0             movl r8,[rbp-0x60]
0x3b29a8590674   8b4  450fafc6             imull r8,r14
0x3b29a8590678   8b8  458bf1               movl r14,r9
0x3b29a859067b   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3b29a8590681   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x3b29a8590685   8c5  7a06                 jpe 0x3b29a859068d  <+0x8cd>
0x3b29a8590687   8c7  0f8404000000         jz 0x3b29a8590691  <+0x8d1>
0x3b29a859068d   8cd  c5f928d1             vmovapd xmm2,xmm1
0x3b29a8590691   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x3b29a8590695   8d5  0f8704000000         ja 0x3b29a859069f  <+0x8df>
0x3b29a859069b   8db  c5f928d1             vmovapd xmm2,xmm1
0x3b29a859069f   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3b29a85906a3   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3b29a85906a9   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x3b29a85906ad   8ed  4585f6               testl r14,r14
0x3b29a85906b0   8f0  0f8927000000         jns 0x3b29a85906dd  <+0x91d>
0x3b29a85906b6   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x3b29a85906bd   8fd  c441f96efa           vmovq xmm15,r10
0x3b29a85906c2   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3b29a85906c6   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x3b29a85906cb   90b  4585f6               testl r14,r14
0x3b29a85906ce   90e  0f8809000000         js 0x3b29a85906dd  <+0x91d>
0x3b29a85906d4   914  41ba00000080         movl r10,0x80000000
0x3b29a85906da   91a  450bf2               orl r14,r10
0x3b29a85906dd   91d  458bd6               movl r10,r14
0x3b29a85906e0   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3b29a85906e5   925  c5f92ef5             vucomisd xmm6,xmm5
0x3b29a85906e9   929  0f8a2a020000         jpe 0x3b29a8590919  <+0xb59>
0x3b29a85906ef   92f  0f8524020000         jnz 0x3b29a8590919  <+0xb59>
0x3b29a85906f5   935  458bfe               movl r15,r14
0x3b29a85906f8   938  413bd6               cmpl rdx,r14
0x3b29a85906fb   93b  440f42fa             cmovcl r15,rdx
0x3b29a85906ff   93f  4c8bf7               REX.W movq r14,rdi
0x3b29a8590702   942  c5f82eda             vucomiss xmm3,xmm2
0x3b29a8590706   946  450f47f7             cmoval r14,r15
0x3b29a859070a   94a  478d3c06             leal r15,[r14+r8*1]
0x3b29a859070e   94e  413bf7               cmpl rsi,r15
0x3b29a8590711   951  0f8625000000         jna 0x3b29a859073c  <+0x97c>
0x3b29a8590717   957  468d3cb9             leal r15,[rcx+r15*4]
0x3b29a859071b   95b  478b343b             movl r14,[r11+r15*1]
0x3b29a859071f   95f  413bde               cmpl rbx,r14
0x3b29a8590722   962  0f860c000000         jna 0x3b29a8590734  <+0x974>
0x3b29a8590728   968  468d34b0             leal r14,[rax+r14*4]
0x3b29a859072c   96c  47892433             movl [r11+r14*1],r12
0x3b29a8590730   970  478b343b             movl r14,[r11+r15*1]
0x3b29a8590734   974  4183c601             addl r14,0x1
0x3b29a8590738   978  4789343b             movl [r11+r15*1],r14
0x3b29a859073c   97c  4183c104             addl r9,0x4
0x3b29a8590740   980  448b4590             movl r8,[rbp-0x70]
0x3b29a8590744   984  4183c004             addl r8,0x4
0x3b29a8590748   988  4183c401             addl r12,0x1
0x3b29a859074c   98c  448b75e8             movl r14,[rbp-0x18]
0x3b29a8590750   990  4539e6               cmpl r14,r12
0x3b29a8590753   993  0f8567feffff         jnz 0x3b29a85905c0  <+0x800>
0x3b29a8590759   999  e9f3fdffff           jmp 0x3b29a8590551  <+0x791>
0x3b29a859075e   99e  e86d3df2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a8590763   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a8590767   9a7  8b5d90               movl rbx,[rbp-0x70]
0x3b29a859076a   9aa  8b5588               movl rdx,[rbp-0x78]
0x3b29a859076d   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3b29a8590773   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a8590777   9b7  8b4580               movl rax,[rbp-0x80]
0x3b29a859077a   9ba  448b4dc0             movl r9,[rbp-0x40]
0x3b29a859077e   9be  e974f6ffff           jmp 0x3b29a858fdf7  <+0x37>
0x3b29a8590783   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x3b29a859078a   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x3b29a859078e   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x3b29a8590792   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x3b29a8590796   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x3b29a859079a   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x3b29a859079f   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x3b29a85907a3   9e3  e8283df2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a85907a8   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a85907ac   9ec  33ff                 xorl rdi,rdi
0x3b29a85907ae   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a85907b2   9f2  448b7dd0             movl r15,[rbp-0x30]
0x3b29a85907b6   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x3b29a85907bc   9fc  8b55b8               movl rdx,[rbp-0x48]
0x3b29a85907bf   9ff  8b4db0               movl rcx,[rbp-0x50]
0x3b29a85907c2   a02  448b4da8             movl r9,[rbp-0x58]
0x3b29a85907c6   a06  448b45a0             movl r8,[rbp-0x60]
0x3b29a85907ca   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x3b29a85907cf   a0f  448b75c0             movl r14,[rbp-0x40]
0x3b29a85907d3   a13  e936f8ffff           jmp 0x3b29a859000e  <+0x24e>
0x3b29a85907d8   a18  c5f92edb             vucomisd xmm3,xmm3
0x3b29a85907dc   a1c  0f8b08000000         jpo 0x3b29a85907ea  <+0xa2a>
0x3b29a85907e2   a22  488bf7               REX.W movq rsi,rdi
0x3b29a85907e5   a25  e9a1f8ffff           jmp 0x3b29a859008b  <+0x2cb>
0x3b29a85907ea   a2a  c5f82eca             vucomiss xmm1,xmm2
0x3b29a85907ee   a2e  77f2                 ja 0x3b29a85907e2  <+0xa22>
0x3b29a85907f0   a30  beffffffff           movl rsi,0xffffffff
0x3b29a85907f5   a35  e991f8ffff           jmp 0x3b29a859008b  <+0x2cb>
0x3b29a85907fa   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x3b29a85907fe   a3e  0f8b08000000         jpo 0x3b29a859080c  <+0xa4c>
0x3b29a8590804   a44  488bc7               REX.W movq rax,rdi
0x3b29a8590807   a47  e91cf9ffff           jmp 0x3b29a8590128  <+0x368>
0x3b29a859080c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x3b29a8590810   a50  77f2                 ja 0x3b29a8590804  <+0xa44>
0x3b29a8590812   a52  b8ffffffff           movl rax,0xffffffff
0x3b29a8590817   a57  e90cf9ffff           jmp 0x3b29a8590128  <+0x368>
0x3b29a859081c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x3b29a8590820   a60  4c897598             REX.W movq [rbp-0x68],r14
0x3b29a8590824   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x3b29a8590828   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x3b29a859082c   a6c  e89f3cf2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a8590831   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a8590835   a75  33ff                 xorl rdi,rdi
0x3b29a8590837   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a859083b   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a859083f   a7f  8b4580               movl rax,[rbp-0x80]
0x3b29a8590842   a82  448b7dd0             movl r15,[rbp-0x30]
0x3b29a8590846   a86  448b4dc0             movl r9,[rbp-0x40]
0x3b29a859084a   a8a  8b55c8               movl rdx,[rbp-0x38]
0x3b29a859084d   a8d  448b7598             movl r14,[rbp-0x68]
0x3b29a8590851   a91  8b5da8               movl rbx,[rbp-0x58]
0x3b29a8590854   a94  8b4db0               movl rcx,[rbp-0x50]
0x3b29a8590857   a97  e9aef9ffff           jmp 0x3b29a859020a  <+0x44a>
0x3b29a859085c   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x3b29a8590860   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x3b29a8590864   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x3b29a8590868   aa8  e8633cf2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a859086d   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a8590871   ab1  33ff                 xorl rdi,rdi
0x3b29a8590873   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a8590877   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3b29a859087b   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a859087f   abf  8b4580               movl rax,[rbp-0x80]
0x3b29a8590882   ac2  448b7dd0             movl r15,[rbp-0x30]
0x3b29a8590886   ac6  448b4dc0             movl r9,[rbp-0x40]
0x3b29a859088a   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x3b29a8590891   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x3b29a8590895   ad5  448b75b8             movl r14,[rbp-0x48]
0x3b29a8590899   ad9  8b5da8               movl rbx,[rbp-0x58]
0x3b29a859089c   adc  e96efaffff           jmp 0x3b29a859030f  <+0x54f>
0x3b29a85908a1   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x3b29a85908a5   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x3b29a85908a9   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x3b29a85908ad   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x3b29a85908b1   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x3b29a85908b5   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x3b29a85908b9   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x3b29a85908bd   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x3b29a85908c2   b02  e8093cf2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a85908c7   b07  448b65e0             movl r12,[rbp-0x20]
0x3b29a85908cb   b0b  448b4d88             movl r9,[rbp-0x78]
0x3b29a85908cf   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3b29a85908d3   b13  8b45d0               movl rax,[rbp-0x30]
0x3b29a85908d6   b16  8b5dc8               movl rbx,[rbp-0x38]
0x3b29a85908d9   b19  8b4dc0               movl rcx,[rbp-0x40]
0x3b29a85908dc   b1c  8b75b8               movl rsi,[rbp-0x48]
0x3b29a85908df   b1f  33ff                 xorl rdi,rdi
0x3b29a85908e1   b21  8b55b0               movl rdx,[rbp-0x50]
0x3b29a85908e4   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3b29a85908e8   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x3b29a85908ed   b2d  448b7d98             movl r15,[rbp-0x68]
0x3b29a85908f1   b31  e9dcfcffff           jmp 0x3b29a85905d2  <+0x812>
0x3b29a85908f6   b36  c5f92edb             vucomisd xmm3,xmm3
0x3b29a85908fa   b3a  0f8b08000000         jpo 0x3b29a8590908  <+0xb48>
0x3b29a8590900   b40  4c8bf7               REX.W movq r14,rdi
0x3b29a8590903   b43  e948fdffff           jmp 0x3b29a8590650  <+0x890>
0x3b29a8590908   b48  c5f82eca             vucomiss xmm1,xmm2
0x3b29a859090c   b4c  77f2                 ja 0x3b29a8590900  <+0xb40>
0x3b29a859090e   b4e  41beffffffff         movl r14,0xffffffff
0x3b29a8590914   b54  e937fdffff           jmp 0x3b29a8590650  <+0x890>
0x3b29a8590919   b59  c5f92ee4             vucomisd xmm4,xmm4
0x3b29a859091d   b5d  0f8b08000000         jpo 0x3b29a859092b  <+0xb6b>
0x3b29a8590923   b63  4c8bf7               REX.W movq r14,rdi
0x3b29a8590926   b66  e9cafdffff           jmp 0x3b29a85906f5  <+0x935>
0x3b29a859092b   b6b  c5f82eca             vucomiss xmm1,xmm2
0x3b29a859092f   b6f  77f2                 ja 0x3b29a8590923  <+0xb63>
0x3b29a8590931   b71  41beffffffff         movl r14,0xffffffff
0x3b29a8590937   b77  e9b9fdffff           jmp 0x3b29a85906f5  <+0x935>
0x3b29a859093c   b7c  e8cf38f2ff           call 0x3b29a84b4210  (jump table)
0x3b29a8590941   b81  e8ca38f2ff           call 0x3b29a84b4210  (jump table)
0x3b29a8590946   b86  e8c538f2ff           call 0x3b29a84b4210  (jump table)
0x3b29a859094b   b8b  90                   nop

Protected instructions:
 pc offset
        3a         
        43         
        48         
        72         
        96         
        c7         
       189         
       19a         
       1bf         
       1cd         
       1df         
       1f2         
       1f7         
       250         
       2f0         
       394         
       39b         
       44a         
       450         
       457         
       45e         
       465         
       46c         
       473         
       47a         
       481         
       488         
       48f         
       496         
       49d         
       4a4         
       4ab         
       4b2         
       500         
       506         
       517         
       51d         
       52e         
       534         
       54f         
       555         
       562         
       56b         
       593         
       5d9         
       651         
       65d         
       677         
       6a2         
       6cb         
       777         
       782         
       796         
       7a8         
       7ba         
       7bf         
       7c4         
       7c9         
       816         
       8bb         
       95b         
       96c         
       970         
       978         

Source positions:
 pc offset  position
        3a        13
        43        20
        48        25
        72        49
        84        61
        8e        69
        c7        77
        f6       126
       189       158
       19a       173
       1bf       196
       1cd       206
       1df       221
       1f2       236
       1f7       243
       250       273
       2f0       339
       394       416
       39b       422
       44a       529
       450       537
       457       549
       45e       557
       465       569
       46c       577
       473       589
       47a       597
       481       609
       488       617
       48f       629
       496       637
       49d       649
       4a4       657
       4ab       669
       4b2       677
       500       716
       506       724
       517       716
       51d       724
       52e       716
       534       724
       54f       716
       555       724
       562       753
       56b       762
       580       777
       58b       785
       5d9       798
       5e2       811
       651       831
       65d       841
       677       861
       692       876
       69a       884
       6cb       892
       6f9       935
       777       969
       782       984
       796       996
       7a8      1011
       7ba      1026
       7bf      1033
       7c4      1040
       7c9      1047
       816      1069
       8bb      1135
       95b      1209
       96c      1229
       970      1234
       978      1247
       99e         0
       9c3       260
       a5c       523
       a9c       710
       ae1      1056
       b7c       935
       b81       811
       b86       126

Safepoints (stack slots = 20, entries = 1, byte size = 16)
0x3b29a858fe4e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x3b29a858fe4a  internal wasm call
0x3b29a858fed5  external reference (0x193f2f0)
0x3b29a8590347  internal wasm call
0x3b29a85903bf  external reference (0x193f270)
0x3b29a8590456  internal wasm call
0x3b29a859075f  wasm stub call  (0x3b29a84b44d0)
0x3b29a85907a4  wasm stub call  (0x3b29a84b44d0)
0x3b29a859082d  wasm stub call  (0x3b29a84b44d0)
0x3b29a8590869  wasm stub call  (0x3b29a84b44d0)
0x3b29a85908c3  wasm stub call  (0x3b29a84b44d0)
0x3b29a859093d  wasm stub call  (0x3b29a84b4210)
0x3b29a8590942  wasm stub call  (0x3b29a84b4210)
0x3b29a8590947  wasm stub call  (0x3b29a84b4210)
