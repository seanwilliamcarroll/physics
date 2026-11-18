name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x14be8dbb6900     0  55                   push rbp
0x14be8dbb6901     1  4889e5               REX.W movq rbp,rsp
0x14be8dbb6904     4  6a08                 push 0x8
0x14be8dbb6906     6  56                   push rsi
0x14be8dbb6907     7  4881ec80000000       REX.W subq rsp,0x80
0x14be8dbb690e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x14be8dbb6912    12  48894580             REX.W movq [rbp-0x80],rax
0x14be8dbb6916    16  48895588             REX.W movq [rbp-0x78],rdx
0x14be8dbb691a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x14be8dbb6921    21  48895d90             REX.W movq [rbp-0x70],rbx
0x14be8dbb6925    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x14be8dbb6929    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x14be8dbb692d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x14be8dbb6931    31  0f8667090000         jna 0x14be8dbb729e  <+0x99e>
0x14be8dbb6937    37  448be0               movl r12,rax
0x14be8dbb693a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x14be8dbb6943    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x14be8dbb6948    48  478b742328           movl r14,[r11+r12*1+0x28]
0x14be8dbb694d    4d  450faff7             imull r14,r15
0x14be8dbb6951    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x14be8dbb6955    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x14be8dbb6959    59  4d8bfe               REX.W movq r15,r14
0x14be8dbb695c    5c  4183c701             addl r15,0x1
0x14be8dbb6960    60  0f850c000000         jnz 0x14be8dbb6972  <+0x72>
0x14be8dbb6966    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x14be8dbb696a    6a  4533ff               xorl r15,r15
0x14be8dbb696d    6d  e928010000           jmp 0x14be8dbb6a9a  <+0x19a>
0x14be8dbb6972    72  438b3c23             movl rdi,[r11+r12*1]
0x14be8dbb6976    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x14be8dbb697a    7a  47393c23             cmpl [r11+r12*1],r15
0x14be8dbb697e    7e  0f8341000000         jnc 0x14be8dbb69c5  <+0xc5>
0x14be8dbb6984    84  498bcf               REX.W movq rcx,r15
0x14be8dbb6987    87  33d2                 xorl rdx,rdx
0x14be8dbb6989    89  e87263f2ff           call 0x14be8dadcd00  (jump table)
0x14be8dbb698e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x14be8dbb6992    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x14be8dbb6996    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x14be8dbb699b    9b  4489e7               movl rdi,r12
0x14be8dbb699e    9e  4d8be3               REX.W movq r12,r11
0x14be8dbb69a1    a1  4c8bdb               REX.W movq r11,rbx
0x14be8dbb69a4    a4  8b5588               movl rdx,[rbp-0x78]
0x14be8dbb69a7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb69ad    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb69b1    b1  8b4580               movl rax,[rbp-0x80]
0x14be8dbb69b4    b4  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb69b8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x14be8dbb69bc    bc  448b75b0             movl r14,[rbp-0x50]
0x14be8dbb69c0    c0  e902000000           jmp 0x14be8dbb69c7  <+0xc7>
0x14be8dbb69c5    c5  33ff                 xorl rdi,rdi
0x14be8dbb69c7    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x14be8dbb69cc    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x14be8dbb69d0    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x14be8dbb69d4    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x14be8dbb69d8    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x14be8dbb69dc    dc  4585f6               testl r14,r14
0x14be8dbb69df    df  0f84a4000000         jz 0x14be8dbb6a89  <+0x189>
0x14be8dbb69e5    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x14be8dbb69ed    ed  83c3fc               addl rbx,0xfc
0x14be8dbb69f0    f0  0f8480000000         jz 0x14be8dbb6a76  <+0x176>
0x14be8dbb69f6    f6  4989e2               REX.W movq r10,rsp
0x14be8dbb69f9    f9  4883ec08             REX.W subq rsp,0x8
0x14be8dbb69fd    fd  4883e4f0             REX.W andq rsp,0xf0
0x14be8dbb6a01   101  4c891424             REX.W movq [rsp],r10
0x14be8dbb6a05   105  488bfe               REX.W movq rdi,rsi
0x14be8dbb6a08   108  4c8bc3               REX.W movq r8,rbx
0x14be8dbb6a0b   10b  8b55e8               movl rdx,[rbp-0x18]
0x14be8dbb6a0e   10e  33c9                 xorl rcx,rcx
0x14be8dbb6a10   110  488bf1               REX.W movq rsi,rcx
0x14be8dbb6a13   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x14be8dbb6a1d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x14be8dbb6a24   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x14be8dbb6a2b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x14be8dbb6a32   132  ffd0                 call rax
0x14be8dbb6a34   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x14be8dbb6a3f   13f  488b2424             REX.W movq rsp,[rsp]
0x14be8dbb6a43   143  85c0                 testl rax,rax
0x14be8dbb6a45   145  0f843b0a0000         jz 0x14be8dbb7486  <+0xb86>
0x14be8dbb6a4b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb6a4f   14f  8b5588               movl rdx,[rbp-0x78]
0x14be8dbb6a52   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb6a56   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb6a5c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6a60   160  8b4580               movl rax,[rbp-0x80]
0x14be8dbb6a63   163  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb6a67   167  8b7db8               movl rdi,[rbp-0x48]
0x14be8dbb6a6a   16a  448b45c8             movl r8,[rbp-0x38]
0x14be8dbb6a6e   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x14be8dbb6a72   172  448b75b0             movl r14,[rbp-0x50]
0x14be8dbb6a76   176  8bdf                 movl rbx,rdi
0x14be8dbb6a78   178  4403f3               addl r14,rbx
0x14be8dbb6a7b   17b  4103df               addl rbx,r15
0x14be8dbb6a7e   17e  458bf8               movl r15,r8
0x14be8dbb6a81   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x14be8dbb6a86   186  418bfe               movl rdi,r14
0x14be8dbb6a89   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x14be8dbb6a91   191  8d5f01               leal rbx,[rdi+0x1]
0x14be8dbb6a94   194  448bfb               movl r15,rbx
0x14be8dbb6a97   197  8b5d90               movl rbx,[rbp-0x70]
0x14be8dbb6a9a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x14be8dbb6a9f   19f  458bc1               movl r8,r9
0x14be8dbb6aa2   1a2  448bf1               movl r14,rcx
0x14be8dbb6aa5   1a5  443bc1               cmpl r8,rcx
0x14be8dbb6aa8   1a8  450f42f0             cmovcl r14,r8
0x14be8dbb6aac   1ac  33ff                 xorl rdi,rdi
0x14be8dbb6aae   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x14be8dbb6ab2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x14be8dbb6ab6   1b6  4585f6               testl r14,r14
0x14be8dbb6ab9   1b9  0f850e000000         jnz 0x14be8dbb6acd  <+0x1cd>
0x14be8dbb6abf   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x14be8dbb6ac4   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb6ac8   1c8  e904020000           jmp 0x14be8dbb6cd1  <+0x3d1>
0x14be8dbb6acd   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x14be8dbb6ad2   1d2  4533c9               xorl r9,r9
0x14be8dbb6ad5   1d5  4585c0               testl r8,r8
0x14be8dbb6ad8   1d8  410f95c1             setnzl r9l
0x14be8dbb6adc   1dc  452bc1               subl r8,r9
0x14be8dbb6adf   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x14be8dbb6ae4   1e4  33db                 xorl rbx,rbx
0x14be8dbb6ae6   1e6  4585c9               testl r9,r9
0x14be8dbb6ae9   1e9  0f95c3               setnzl bl
0x14be8dbb6aec   1ec  458bf1               movl r14,r9
0x14be8dbb6aef   1ef  442bf3               subl r14,rbx
0x14be8dbb6af2   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x14be8dbb6af7   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x14be8dbb6afe   1fe  448b55e8             movl r10,[rbp-0x18]
0x14be8dbb6b02   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x14be8dbb6b06   206  8bca                 movl rcx,rdx
0x14be8dbb6b08   208  8b5590               movl rdx,[rbp-0x70]
0x14be8dbb6b0b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb6b0f   20f  e930000000           jmp 0x14be8dbb6b44  <+0x244>
0x14be8dbb6b14   214  660f1f840000000000   nop
0x14be8dbb6b1d   21d  660f1f840000000000   nop
0x14be8dbb6b26   226  660f1f840000000000   nop
0x14be8dbb6b2f   22f  660f1f840000000000   nop
0x14be8dbb6b38   238  0f1f840000000000     nop
0x14be8dbb6b40   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x14be8dbb6b44   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x14be8dbb6b48   248  0f8675070000         jna 0x14be8dbb72c3  <+0x9c3>
0x14be8dbb6b4e   24e  8bf1                 movl rsi,rcx
0x14be8dbb6b50   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x14be8dbb6b56   256  c5f82ed2             vucomiss xmm2,xmm2
0x14be8dbb6b5a   25a  7a06                 jpe 0x14be8dbb6b62  <+0x262>
0x14be8dbb6b5c   25c  0f8404000000         jz 0x14be8dbb6b66  <+0x266>
0x14be8dbb6b62   262  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb6b66   266  c5f82ed1             vucomiss xmm2,xmm1
0x14be8dbb6b6a   26a  0f8704000000         ja 0x14be8dbb6b74  <+0x274>
0x14be8dbb6b70   270  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb6b74   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x14be8dbb6b78   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x14be8dbb6b7e   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x14be8dbb6b82   282  85f6                 testl rsi,rsi
0x14be8dbb6b84   284  0f8929000000         jns 0x14be8dbb6bb3  <+0x2b3>
0x14be8dbb6b8a   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x14be8dbb6b94   294  c441f96efa           vmovq xmm15,r10
0x14be8dbb6b99   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x14be8dbb6b9d   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x14be8dbb6ba2   2a2  85f6                 testl rsi,rsi
0x14be8dbb6ba4   2a4  0f8809000000         js 0x14be8dbb6bb3  <+0x2b3>
0x14be8dbb6baa   2aa  41ba00000080         movl r10,0x80000000
0x14be8dbb6bb0   2b0  410bf2               orl rsi,r10
0x14be8dbb6bb3   2b3  448bd6               movl r10,rsi
0x14be8dbb6bb6   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x14be8dbb6bbb   2bb  c5f92eec             vucomisd xmm5,xmm4
0x14be8dbb6bbf   2bf  0f8a53070000         jpe 0x14be8dbb7318  <+0xa18>
0x14be8dbb6bc5   2c5  0f854d070000         jnz 0x14be8dbb7318  <+0xa18>
0x14be8dbb6bcb   2cb  8bc6                 movl rax,rsi
0x14be8dbb6bcd   2cd  443bf6               cmpl r14,rsi
0x14be8dbb6bd0   2d0  410f42c6             cmovcl rax,r14
0x14be8dbb6bd4   2d4  83c001               addl rax,0x1
0x14be8dbb6bd7   2d7  41ba0000804f         movl r10,0x4f800000
0x14be8dbb6bdd   2dd  c4c1796eda           vmovd xmm3,r10
0x14be8dbb6be2   2e2  be01000000           movl rsi,0x1
0x14be8dbb6be7   2e7  c5f82eda             vucomiss xmm3,xmm2
0x14be8dbb6beb   2eb  0f47f0               cmoval rsi,rax
0x14be8dbb6bee   2ee  8bc2                 movl rax,rdx
0x14be8dbb6bf0   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x14be8dbb6bf6   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x14be8dbb6bfa   2fa  7a06                 jpe 0x14be8dbb6c02  <+0x302>
0x14be8dbb6bfc   2fc  0f8404000000         jz 0x14be8dbb6c06  <+0x306>
0x14be8dbb6c02   302  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb6c06   306  c5f82ed1             vucomiss xmm2,xmm1
0x14be8dbb6c0a   30a  0f8704000000         ja 0x14be8dbb6c14  <+0x314>
0x14be8dbb6c10   310  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb6c14   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x14be8dbb6c18   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x14be8dbb6c1e   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x14be8dbb6c22   322  85c0                 testl rax,rax
0x14be8dbb6c24   324  0f8926000000         jns 0x14be8dbb6c50  <+0x350>
0x14be8dbb6c2a   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x14be8dbb6c31   331  c441f96efa           vmovq xmm15,r10
0x14be8dbb6c36   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x14be8dbb6c3a   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x14be8dbb6c3f   33f  85c0                 testl rax,rax
0x14be8dbb6c41   341  0f8809000000         js 0x14be8dbb6c50  <+0x350>
0x14be8dbb6c47   347  41ba00000080         movl r10,0x80000000
0x14be8dbb6c4d   34d  410bc2               orl rax,r10
0x14be8dbb6c50   350  448bd0               movl r10,rax
0x14be8dbb6c53   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x14be8dbb6c58   358  c5f92ef5             vucomisd xmm6,xmm5
0x14be8dbb6c5c   35c  0f8ad8060000         jpe 0x14be8dbb733a  <+0xa3a>
0x14be8dbb6c62   362  0f85d2060000         jnz 0x14be8dbb733a  <+0xa3a>
0x14be8dbb6c68   368  448be0               movl r12,rax
0x14be8dbb6c6b   36b  443bc0               cmpl r8,rax
0x14be8dbb6c6e   36e  450f42e0             cmovcl r12,r8
0x14be8dbb6c72   372  488bc7               REX.W movq rax,rdi
0x14be8dbb6c75   375  c5f82eda             vucomiss xmm3,xmm2
0x14be8dbb6c79   379  410f47c4             cmoval rax,r12
0x14be8dbb6c7d   37d  458be1               movl r12,r9
0x14be8dbb6c80   380  440fafe0             imull r12,rax
0x14be8dbb6c84   384  4403e6               addl r12,rsi
0x14be8dbb6c87   387  4539e7               cmpl r15,r12
0x14be8dbb6c8a   38a  0f860f000000         jna 0x14be8dbb6c9f  <+0x39f>
0x14be8dbb6c90   390  468d24a3             leal r12,[rbx+r12*4]
0x14be8dbb6c94   394  438b0423             movl rax,[r11+r12*1]
0x14be8dbb6c98   398  83c001               addl rax,0x1
0x14be8dbb6c9b   39b  43890423             movl [r11+r12*1],rax
0x14be8dbb6c9f   39f  83c104               addl rcx,0x4
0x14be8dbb6ca2   3a2  83c204               addl rdx,0x4
0x14be8dbb6ca5   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x14be8dbb6ca9   3a9  4183c4ff             addl r12,0xff
0x14be8dbb6cad   3ad  0f858dfeffff         jnz 0x14be8dbb6b40  <+0x240>
0x14be8dbb6cb3   3b3  448bc3               movl r8,rbx
0x14be8dbb6cb6   3b6  448b75e8             movl r14,[rbp-0x18]
0x14be8dbb6cba   3ba  8b5d90               movl rbx,[rbp-0x70]
0x14be8dbb6cbd   3bd  8b5588               movl rdx,[rbp-0x78]
0x14be8dbb6cc0   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb6cc4   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb6cca   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6cce   3ce  8b4580               movl rax,[rbp-0x80]
0x14be8dbb6cd1   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x14be8dbb6cd8   3d8  4585ff               testl r15,r15
0x14be8dbb6cdb   3db  0f8508000000         jnz 0x14be8dbb6ce9  <+0x3e9>
0x14be8dbb6ce1   3e1  488bdf               REX.W movq rbx,rdi
0x14be8dbb6ce4   3e4  e968020000           jmp 0x14be8dbb6f51  <+0x651>
0x14be8dbb6ce9   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x14be8dbb6cf1   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x14be8dbb6cf9   3f9  448bf3               movl r14,rbx
0x14be8dbb6cfc   3fc  41c1ee02             shrl r14, 2
0x14be8dbb6d00   400  4183c601             addl r14,0x1
0x14be8dbb6d04   404  418bd6               movl rdx,r14
0x14be8dbb6d07   407  83e207               andl rdx,0x7
0x14be8dbb6d0a   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x14be8dbb6d0e   40e  83fb1c               cmpl rbx,0x1c
0x14be8dbb6d11   411  0f82db000000         jc 0x14be8dbb6df2  <+0x4f2>
0x14be8dbb6d17   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x14be8dbb6d1e   41e  418bd8               movl rbx,r8
0x14be8dbb6d21   421  488bcf               REX.W movq rcx,rdi
0x14be8dbb6d24   424  660f1f840000000000   nop
0x14be8dbb6d2d   42d  660f1f840000000000   nop
0x14be8dbb6d36   436  660f1f840000000000   nop
0x14be8dbb6d3f   43f  90                   nop
0x14be8dbb6d40   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x14be8dbb6d44   444  0f8612060000         jna 0x14be8dbb735c  <+0xa5c>
0x14be8dbb6d4a   44a  418b341b             movl rsi,[r11+rbx*1]
0x14be8dbb6d4e   44e  03ce                 addl rcx,rsi
0x14be8dbb6d50   450  41890c1b             movl [r11+rbx*1],rcx
0x14be8dbb6d54   454  8d7304               leal rsi,[rbx+0x4]
0x14be8dbb6d57   457  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6d5b   45b  4103c8               addl rcx,r8
0x14be8dbb6d5e   45e  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6d62   462  8d7308               leal rsi,[rbx+0x8]
0x14be8dbb6d65   465  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6d69   469  4103c8               addl rcx,r8
0x14be8dbb6d6c   46c  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6d70   470  8d730c               leal rsi,[rbx+0xc]
0x14be8dbb6d73   473  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6d77   477  4103c8               addl rcx,r8
0x14be8dbb6d7a   47a  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6d7e   47e  8d7310               leal rsi,[rbx+0x10]
0x14be8dbb6d81   481  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6d85   485  4103c8               addl rcx,r8
0x14be8dbb6d88   488  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6d8c   48c  8d7314               leal rsi,[rbx+0x14]
0x14be8dbb6d8f   48f  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6d93   493  4103c8               addl rcx,r8
0x14be8dbb6d96   496  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6d9a   49a  8d7318               leal rsi,[rbx+0x18]
0x14be8dbb6d9d   49d  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6da1   4a1  4103c8               addl rcx,r8
0x14be8dbb6da4   4a4  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6da8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x14be8dbb6dab   4ab  458b0433             movl r8,[r11+rsi*1]
0x14be8dbb6daf   4af  4103c8               addl rcx,r8
0x14be8dbb6db2   4b2  41890c33             movl [r11+rsi*1],rcx
0x14be8dbb6db6   4b6  83c320               addl rbx,0x20
0x14be8dbb6db9   4b9  4183c6f8             addl r14,0xf8
0x14be8dbb6dbd   4bd  7581                 jnz 0x14be8dbb6d40  <+0x440>
0x14be8dbb6dbf   4bf  85d2                 testl rdx,rdx
0x14be8dbb6dc1   4c1  0f8510000000         jnz 0x14be8dbb6dd7  <+0x4d7>
0x14be8dbb6dc7   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6dcb   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x14be8dbb6dd2   4d2  e98b000000           jmp 0x14be8dbb6e62  <+0x562>
0x14be8dbb6dd7   4d7  448bf3               movl r14,rbx
0x14be8dbb6dda   4da  8bd9                 movl rbx,rcx
0x14be8dbb6ddc   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb6de2   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6de6   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x14be8dbb6ded   4ed  e906000000           jmp 0x14be8dbb6df8  <+0x4f8>
0x14be8dbb6df2   4f2  488bdf               REX.W movq rbx,rdi
0x14be8dbb6df5   4f5  458bf0               movl r14,r8
0x14be8dbb6df8   4f8  c1e202               shll rdx, 2
0x14be8dbb6dfb   4fb  0f1f440000           nop
0x14be8dbb6e00   500  438b0c33             movl rcx,[r11+r14*1]
0x14be8dbb6e04   504  03d9                 addl rbx,rcx
0x14be8dbb6e06   506  43891c33             movl [r11+r14*1],rbx
0x14be8dbb6e0a   50a  4183c604             addl r14,0x4
0x14be8dbb6e0e   50e  83c2fc               addl rdx,0xfc
0x14be8dbb6e11   511  0f844b000000         jz 0x14be8dbb6e62  <+0x562>
0x14be8dbb6e17   517  438b0c33             movl rcx,[r11+r14*1]
0x14be8dbb6e1b   51b  03d9                 addl rbx,rcx
0x14be8dbb6e1d   51d  43891c33             movl [r11+r14*1],rbx
0x14be8dbb6e21   521  4183c604             addl r14,0x4
0x14be8dbb6e25   525  83c2fc               addl rdx,0xfc
0x14be8dbb6e28   528  0f8434000000         jz 0x14be8dbb6e62  <+0x562>
0x14be8dbb6e2e   52e  438b0c33             movl rcx,[r11+r14*1]
0x14be8dbb6e32   532  03d9                 addl rbx,rcx
0x14be8dbb6e34   534  43891c33             movl [r11+r14*1],rbx
0x14be8dbb6e38   538  4183c604             addl r14,0x4
0x14be8dbb6e3c   53c  83c2fc               addl rdx,0xfc
0x14be8dbb6e3f   53f  0f841d000000         jz 0x14be8dbb6e62  <+0x562>
0x14be8dbb6e45   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x14be8dbb6e49   549  0f864d050000         jna 0x14be8dbb739c  <+0xa9c>
0x14be8dbb6e4f   54f  438b0c33             movl rcx,[r11+r14*1]
0x14be8dbb6e53   553  03d9                 addl rbx,rcx
0x14be8dbb6e55   555  43891c33             movl [r11+r14*1],rbx
0x14be8dbb6e59   559  4183c604             addl r14,0x4
0x14be8dbb6e5d   55d  83c2fc               addl rdx,0xfc
0x14be8dbb6e60   560  759e                 jnz 0x14be8dbb6e00  <+0x500>
0x14be8dbb6e62   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x14be8dbb6e6b   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x14be8dbb6e70   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x14be8dbb6e75   575  0f834a000000         jnc 0x14be8dbb6ec5  <+0x5c5>
0x14be8dbb6e7b   57b  8bd8                 movl rbx,rax
0x14be8dbb6e7d   57d  8d430c               leal rax,[rbx+0xc]
0x14be8dbb6e80   580  418bcf               movl rcx,r15
0x14be8dbb6e83   583  488bd7               REX.W movq rdx,rdi
0x14be8dbb6e86   586  e8755ef2ff           call 0x14be8dadcd00  (jump table)
0x14be8dbb6e8b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x14be8dbb6e8f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x14be8dbb6e93   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x14be8dbb6e98   598  4c8bd3               REX.W movq r10,rbx
0x14be8dbb6e9b   59b  4489e3               movl rbx,r12
0x14be8dbb6e9e   59e  4d8be3               REX.W movq r12,r11
0x14be8dbb6ea1   5a1  4d8bda               REX.W movq r11,r10
0x14be8dbb6ea4   5a4  33ff                 xorl rdi,rdi
0x14be8dbb6ea6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb6eaa   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6eae   5ae  8b4580               movl rax,[rbp-0x80]
0x14be8dbb6eb1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x14be8dbb6eb5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb6eb9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x14be8dbb6ec0   5c0  e903000000           jmp 0x14be8dbb6ec8  <+0x5c8>
0x14be8dbb6ec5   5c5  488bdf               REX.W movq rbx,rdi
0x14be8dbb6ec8   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x14be8dbb6ecc   5cc  4d8bf7               REX.W movq r14,r15
0x14be8dbb6ecf   5cf  41c1e602             shll r14, 2
0x14be8dbb6ed3   5d3  0f8478000000         jz 0x14be8dbb6f51  <+0x651>
0x14be8dbb6ed9   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x14be8dbb6ede   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x14be8dbb6ee2   5e2  4989e2               REX.W movq r10,rsp
0x14be8dbb6ee5   5e5  4883ec08             REX.W subq rsp,0x8
0x14be8dbb6ee9   5e9  4883e4f0             REX.W andq rsp,0xf0
0x14be8dbb6eed   5ed  4c891424             REX.W movq [rsp],r10
0x14be8dbb6ef1   5f1  488bd7               REX.W movq rdx,rdi
0x14be8dbb6ef4   5f4  4c8bd7               REX.W movq r10,rdi
0x14be8dbb6ef7   5f7  488bfe               REX.W movq rdi,rsi
0x14be8dbb6efa   5fa  498bf2               REX.W movq rsi,r10
0x14be8dbb6efd   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x14be8dbb6f07   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x14be8dbb6f0e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x14be8dbb6f15   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x14be8dbb6f1c   61c  ffd0                 call rax
0x14be8dbb6f1e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x14be8dbb6f29   629  488b2424             REX.W movq rsp,[rsp]
0x14be8dbb6f2d   62d  85c0                 testl rax,rax
0x14be8dbb6f2f   62f  0f844c050000         jz 0x14be8dbb7481  <+0xb81>
0x14be8dbb6f35   635  8b5dc8               movl rbx,[rbp-0x38]
0x14be8dbb6f38   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb6f3c   63c  33ff                 xorl rdi,rdi
0x14be8dbb6f3e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb6f42   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb6f46   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6f4a   64a  8b4580               movl rax,[rbp-0x80]
0x14be8dbb6f4d   64d  448b7dd0             movl r15,[rbp-0x30]
0x14be8dbb6f51   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x14be8dbb6f5a   65a  4103df               addl rbx,r15
0x14be8dbb6f5d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x14be8dbb6f62   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x14be8dbb6f69   669  0f8508000000         jnz 0x14be8dbb6f77  <+0x677>
0x14be8dbb6f6f   66f  488bdf               REX.W movq rbx,rdi
0x14be8dbb6f72   672  e90b010000           jmp 0x14be8dbb7082  <+0x782>
0x14be8dbb6f77   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x14be8dbb6f7c   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb6f82   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x14be8dbb6f87   687  0f833b000000         jnc 0x14be8dbb6fc8  <+0x6c8>
0x14be8dbb6f8d   68d  8bd8                 movl rbx,rax
0x14be8dbb6f8f   68f  8d4318               leal rax,[rbx+0x18]
0x14be8dbb6f92   692  488bd7               REX.W movq rdx,rdi
0x14be8dbb6f95   695  e8665df2ff           call 0x14be8dadcd00  (jump table)
0x14be8dbb6f9a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x14be8dbb6f9e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x14be8dbb6fa2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x14be8dbb6fa7   6a7  4c8bd3               REX.W movq r10,rbx
0x14be8dbb6faa   6aa  4489e3               movl rbx,r12
0x14be8dbb6fad   6ad  4d8be3               REX.W movq r12,r11
0x14be8dbb6fb0   6b0  4d8bda               REX.W movq r11,r10
0x14be8dbb6fb3   6b3  33ff                 xorl rdi,rdi
0x14be8dbb6fb5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb6fb9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb6fbf   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb6fc3   6c3  e903000000           jmp 0x14be8dbb6fcb  <+0x6cb>
0x14be8dbb6fc8   6c8  488bdf               REX.W movq rbx,rdi
0x14be8dbb6fcb   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x14be8dbb6fd0   6d0  418d149f             leal rdx,[r15+rbx*4]
0x14be8dbb6fd4   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x14be8dbb6fd8   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x14be8dbb6fdc   6dc  83f901               cmpl rcx,0x1
0x14be8dbb6fdf   6df  0f8492000000         jz 0x14be8dbb7077  <+0x777>
0x14be8dbb6fe5   6e5  448bf1               movl r14,rcx
0x14be8dbb6fe8   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x14be8dbb6ff0   6f0  83c0fc               addl rax,0xfc
0x14be8dbb6ff3   6f3  0f846f000000         jz 0x14be8dbb7068  <+0x768>
0x14be8dbb6ff9   6f9  4989e2               REX.W movq r10,rsp
0x14be8dbb6ffc   6fc  4883ec08             REX.W subq rsp,0x8
0x14be8dbb7000   700  4883e4f0             REX.W andq rsp,0xf0
0x14be8dbb7004   704  4c891424             REX.W movq [rsp],r10
0x14be8dbb7008   708  488bcf               REX.W movq rcx,rdi
0x14be8dbb700b   70b  4c8bd7               REX.W movq r10,rdi
0x14be8dbb700e   70e  488bfe               REX.W movq rdi,rsi
0x14be8dbb7011   711  498bf2               REX.W movq rsi,r10
0x14be8dbb7014   714  4c8bc0               REX.W movq r8,rax
0x14be8dbb7017   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x14be8dbb701e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x14be8dbb7025   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x14be8dbb702c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x14be8dbb7033   733  ffd0                 call rax
0x14be8dbb7035   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x14be8dbb7040   740  488b2424             REX.W movq rsp,[rsp]
0x14be8dbb7044   744  85c0                 testl rax,rax
0x14be8dbb7046   746  0f8430040000         jz 0x14be8dbb747c  <+0xb7c>
0x14be8dbb704c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb7050   750  33ff                 xorl rdi,rdi
0x14be8dbb7052   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb7056   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb705a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x14be8dbb705d   75d  448b7dc8             movl r15,[rbp-0x38]
0x14be8dbb7061   761  448bb570ffffff       movl r14,[rbp-0x90]
0x14be8dbb7068   768  4103de               addl rbx,r14
0x14be8dbb706b   76b  448d73ff             leal r14,[rbx-0x1]
0x14be8dbb706f   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x14be8dbb7074   774  418bde               movl rbx,r14
0x14be8dbb7077   777  41c7041300000000     movl [r11+rdx*1],0x0
0x14be8dbb707f   77f  83c301               addl rbx,0x1
0x14be8dbb7082   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x14be8dbb7087   787  837de800             cmpl [rbp-0x18],0x0
0x14be8dbb708b   78b  0f8505000000         jnz 0x14be8dbb7096  <+0x796>
0x14be8dbb7091   791  488be5               REX.W movq rsp,rbp
0x14be8dbb7094   794  5d                   pop rbp
0x14be8dbb7095   795  c3                   retl
0x14be8dbb7096   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x14be8dbb709b   79b  4533f6               xorl r14,r14
0x14be8dbb709e   79e  4585ff               testl r15,r15
0x14be8dbb70a1   7a1  410f95c6             setnzl r14l
0x14be8dbb70a5   7a5  452bfe               subl r15,r14
0x14be8dbb70a8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x14be8dbb70ad   7ad  33c0                 xorl rax,rax
0x14be8dbb70af   7af  4585f6               testl r14,r14
0x14be8dbb70b2   7b2  0f95c0               setnzl al
0x14be8dbb70b5   7b5  418bd6               movl rdx,r14
0x14be8dbb70b8   7b8  2bd0                 subl rdx,rax
0x14be8dbb70ba   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x14be8dbb70bf   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x14be8dbb70c4   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x14be8dbb70c9   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x14be8dbb70d0   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x14be8dbb70d4   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x14be8dbb70d8   7d8  4c8be7               REX.W movq r12,rdi
0x14be8dbb70db   7db  448b4d88             movl r9,[rbp-0x78]
0x14be8dbb70df   7df  e924000000           jmp 0x14be8dbb7108  <+0x808>
0x14be8dbb70e4   7e4  660f1f840000000000   nop
0x14be8dbb70ed   7ed  660f1f840000000000   nop
0x14be8dbb70f6   7f6  660f1f840000000000   nop
0x14be8dbb70ff   7ff  90                   nop
0x14be8dbb7100   800  448b7d98             movl r15,[rbp-0x68]
0x14be8dbb7104   804  4c894590             REX.W movq [rbp-0x70],r8
0x14be8dbb7108   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x14be8dbb710c   80c  0f86cf020000         jna 0x14be8dbb73e1  <+0xae1>
0x14be8dbb7112   812  448b7590             movl r14,[rbp-0x70]
0x14be8dbb7116   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x14be8dbb711c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x14be8dbb7120   820  7a06                 jpe 0x14be8dbb7128  <+0x828>
0x14be8dbb7122   822  0f8404000000         jz 0x14be8dbb712c  <+0x82c>
0x14be8dbb7128   828  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb712c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x14be8dbb7130   830  0f8704000000         ja 0x14be8dbb713a  <+0x83a>
0x14be8dbb7136   836  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb713a   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x14be8dbb713e   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x14be8dbb7144   844  c57b2cf4             vcvttsd2si r14,xmm4
0x14be8dbb7148   848  4585f6               testl r14,r14
0x14be8dbb714b   84b  0f8927000000         jns 0x14be8dbb7178  <+0x878>
0x14be8dbb7151   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x14be8dbb7158   858  c441f96efa           vmovq xmm15,r10
0x14be8dbb715d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x14be8dbb7161   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x14be8dbb7166   866  4585f6               testl r14,r14
0x14be8dbb7169   869  0f8809000000         js 0x14be8dbb7178  <+0x878>
0x14be8dbb716f   86f  41ba00000080         movl r10,0x80000000
0x14be8dbb7175   875  450bf2               orl r14,r10
0x14be8dbb7178   878  458bd6               movl r10,r14
0x14be8dbb717b   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x14be8dbb7180   880  c5f92eec             vucomisd xmm5,xmm4
0x14be8dbb7184   884  0f8aac020000         jpe 0x14be8dbb7436  <+0xb36>
0x14be8dbb718a   88a  0f85a6020000         jnz 0x14be8dbb7436  <+0xb36>
0x14be8dbb7190   890  458bc6               movl r8,r14
0x14be8dbb7193   893  453bfe               cmpl r15,r14
0x14be8dbb7196   896  450f42c7             cmovcl r8,r15
0x14be8dbb719a   89a  41ba0000804f         movl r10,0x4f800000
0x14be8dbb71a0   8a0  c4c1796eda           vmovd xmm3,r10
0x14be8dbb71a5   8a5  4c8bf7               REX.W movq r14,rdi
0x14be8dbb71a8   8a8  c5f82eda             vucomiss xmm3,xmm2
0x14be8dbb71ac   8ac  450f47f0             cmoval r14,r8
0x14be8dbb71b0   8b0  448b45a0             movl r8,[rbp-0x60]
0x14be8dbb71b4   8b4  450fafc6             imull r8,r14
0x14be8dbb71b8   8b8  458bf1               movl r14,r9
0x14be8dbb71bb   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x14be8dbb71c1   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x14be8dbb71c5   8c5  7a06                 jpe 0x14be8dbb71cd  <+0x8cd>
0x14be8dbb71c7   8c7  0f8404000000         jz 0x14be8dbb71d1  <+0x8d1>
0x14be8dbb71cd   8cd  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb71d1   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x14be8dbb71d5   8d5  0f8704000000         ja 0x14be8dbb71df  <+0x8df>
0x14be8dbb71db   8db  c5f928d1             vmovapd xmm2,xmm1
0x14be8dbb71df   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x14be8dbb71e3   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x14be8dbb71e9   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x14be8dbb71ed   8ed  4585f6               testl r14,r14
0x14be8dbb71f0   8f0  0f8927000000         jns 0x14be8dbb721d  <+0x91d>
0x14be8dbb71f6   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x14be8dbb71fd   8fd  c441f96efa           vmovq xmm15,r10
0x14be8dbb7202   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x14be8dbb7206   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x14be8dbb720b   90b  4585f6               testl r14,r14
0x14be8dbb720e   90e  0f8809000000         js 0x14be8dbb721d  <+0x91d>
0x14be8dbb7214   914  41ba00000080         movl r10,0x80000000
0x14be8dbb721a   91a  450bf2               orl r14,r10
0x14be8dbb721d   91d  458bd6               movl r10,r14
0x14be8dbb7220   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x14be8dbb7225   925  c5f92ef5             vucomisd xmm6,xmm5
0x14be8dbb7229   929  0f8a2a020000         jpe 0x14be8dbb7459  <+0xb59>
0x14be8dbb722f   92f  0f8524020000         jnz 0x14be8dbb7459  <+0xb59>
0x14be8dbb7235   935  458bfe               movl r15,r14
0x14be8dbb7238   938  413bd6               cmpl rdx,r14
0x14be8dbb723b   93b  440f42fa             cmovcl r15,rdx
0x14be8dbb723f   93f  4c8bf7               REX.W movq r14,rdi
0x14be8dbb7242   942  c5f82eda             vucomiss xmm3,xmm2
0x14be8dbb7246   946  450f47f7             cmoval r14,r15
0x14be8dbb724a   94a  478d3c06             leal r15,[r14+r8*1]
0x14be8dbb724e   94e  413bf7               cmpl rsi,r15
0x14be8dbb7251   951  0f8625000000         jna 0x14be8dbb727c  <+0x97c>
0x14be8dbb7257   957  468d3cb9             leal r15,[rcx+r15*4]
0x14be8dbb725b   95b  478b343b             movl r14,[r11+r15*1]
0x14be8dbb725f   95f  413bde               cmpl rbx,r14
0x14be8dbb7262   962  0f860c000000         jna 0x14be8dbb7274  <+0x974>
0x14be8dbb7268   968  468d34b0             leal r14,[rax+r14*4]
0x14be8dbb726c   96c  47892433             movl [r11+r14*1],r12
0x14be8dbb7270   970  478b343b             movl r14,[r11+r15*1]
0x14be8dbb7274   974  4183c601             addl r14,0x1
0x14be8dbb7278   978  4789343b             movl [r11+r15*1],r14
0x14be8dbb727c   97c  4183c104             addl r9,0x4
0x14be8dbb7280   980  448b4590             movl r8,[rbp-0x70]
0x14be8dbb7284   984  4183c004             addl r8,0x4
0x14be8dbb7288   988  4183c401             addl r12,0x1
0x14be8dbb728c   98c  448b75e8             movl r14,[rbp-0x18]
0x14be8dbb7290   990  4539e6               cmpl r14,r12
0x14be8dbb7293   993  0f8567feffff         jnz 0x14be8dbb7100  <+0x800>
0x14be8dbb7299   999  e9f3fdffff           jmp 0x14be8dbb7091  <+0x791>
0x14be8dbb729e   99e  e82d62f2ff           call 0x14be8dadd4d0  (jump table)
0x14be8dbb72a3   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb72a7   9a7  8b5d90               movl rbx,[rbp-0x70]
0x14be8dbb72aa   9aa  8b5588               movl rdx,[rbp-0x78]
0x14be8dbb72ad   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x14be8dbb72b3   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb72b7   9b7  8b4580               movl rax,[rbp-0x80]
0x14be8dbb72ba   9ba  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb72be   9be  e974f6ffff           jmp 0x14be8dbb6937  <+0x37>
0x14be8dbb72c3   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x14be8dbb72ca   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x14be8dbb72ce   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x14be8dbb72d2   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x14be8dbb72d6   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x14be8dbb72da   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x14be8dbb72df   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x14be8dbb72e3   9e3  e8e861f2ff           call 0x14be8dadd4d0  (jump table)
0x14be8dbb72e8   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb72ec   9ec  33ff                 xorl rdi,rdi
0x14be8dbb72ee   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb72f2   9f2  448b7dd0             movl r15,[rbp-0x30]
0x14be8dbb72f6   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x14be8dbb72fc   9fc  8b55b8               movl rdx,[rbp-0x48]
0x14be8dbb72ff   9ff  8b4db0               movl rcx,[rbp-0x50]
0x14be8dbb7302   a02  448b4da8             movl r9,[rbp-0x58]
0x14be8dbb7306   a06  448b45a0             movl r8,[rbp-0x60]
0x14be8dbb730a   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x14be8dbb730f   a0f  448b75c0             movl r14,[rbp-0x40]
0x14be8dbb7313   a13  e936f8ffff           jmp 0x14be8dbb6b4e  <+0x24e>
0x14be8dbb7318   a18  c5f92edb             vucomisd xmm3,xmm3
0x14be8dbb731c   a1c  0f8b08000000         jpo 0x14be8dbb732a  <+0xa2a>
0x14be8dbb7322   a22  488bf7               REX.W movq rsi,rdi
0x14be8dbb7325   a25  e9a1f8ffff           jmp 0x14be8dbb6bcb  <+0x2cb>
0x14be8dbb732a   a2a  c5f82eca             vucomiss xmm1,xmm2
0x14be8dbb732e   a2e  77f2                 ja 0x14be8dbb7322  <+0xa22>
0x14be8dbb7330   a30  beffffffff           movl rsi,0xffffffff
0x14be8dbb7335   a35  e991f8ffff           jmp 0x14be8dbb6bcb  <+0x2cb>
0x14be8dbb733a   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x14be8dbb733e   a3e  0f8b08000000         jpo 0x14be8dbb734c  <+0xa4c>
0x14be8dbb7344   a44  488bc7               REX.W movq rax,rdi
0x14be8dbb7347   a47  e91cf9ffff           jmp 0x14be8dbb6c68  <+0x368>
0x14be8dbb734c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x14be8dbb7350   a50  77f2                 ja 0x14be8dbb7344  <+0xa44>
0x14be8dbb7352   a52  b8ffffffff           movl rax,0xffffffff
0x14be8dbb7357   a57  e90cf9ffff           jmp 0x14be8dbb6c68  <+0x368>
0x14be8dbb735c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x14be8dbb7360   a60  4c897598             REX.W movq [rbp-0x68],r14
0x14be8dbb7364   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x14be8dbb7368   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x14be8dbb736c   a6c  e85f61f2ff           call 0x14be8dadd4d0  (jump table)
0x14be8dbb7371   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb7375   a75  33ff                 xorl rdi,rdi
0x14be8dbb7377   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb737b   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb737f   a7f  8b4580               movl rax,[rbp-0x80]
0x14be8dbb7382   a82  448b7dd0             movl r15,[rbp-0x30]
0x14be8dbb7386   a86  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb738a   a8a  8b55c8               movl rdx,[rbp-0x38]
0x14be8dbb738d   a8d  448b7598             movl r14,[rbp-0x68]
0x14be8dbb7391   a91  8b5da8               movl rbx,[rbp-0x58]
0x14be8dbb7394   a94  8b4db0               movl rcx,[rbp-0x50]
0x14be8dbb7397   a97  e9aef9ffff           jmp 0x14be8dbb6d4a  <+0x44a>
0x14be8dbb739c   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x14be8dbb73a0   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x14be8dbb73a4   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x14be8dbb73a8   aa8  e82361f2ff           call 0x14be8dadd4d0  (jump table)
0x14be8dbb73ad   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb73b1   ab1  33ff                 xorl rdi,rdi
0x14be8dbb73b3   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb73b7   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x14be8dbb73bb   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x14be8dbb73bf   abf  8b4580               movl rax,[rbp-0x80]
0x14be8dbb73c2   ac2  448b7dd0             movl r15,[rbp-0x30]
0x14be8dbb73c6   ac6  448b4dc0             movl r9,[rbp-0x40]
0x14be8dbb73ca   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x14be8dbb73d1   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x14be8dbb73d5   ad5  448b75b8             movl r14,[rbp-0x48]
0x14be8dbb73d9   ad9  8b5da8               movl rbx,[rbp-0x58]
0x14be8dbb73dc   adc  e96efaffff           jmp 0x14be8dbb6e4f  <+0x54f>
0x14be8dbb73e1   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x14be8dbb73e5   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x14be8dbb73e9   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x14be8dbb73ed   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x14be8dbb73f1   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x14be8dbb73f5   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x14be8dbb73f9   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x14be8dbb73fd   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x14be8dbb7402   b02  e8c960f2ff           call 0x14be8dadd4d0  (jump table)
0x14be8dbb7407   b07  448b65e0             movl r12,[rbp-0x20]
0x14be8dbb740b   b0b  448b4d88             movl r9,[rbp-0x78]
0x14be8dbb740f   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x14be8dbb7413   b13  8b45d0               movl rax,[rbp-0x30]
0x14be8dbb7416   b16  8b5dc8               movl rbx,[rbp-0x38]
0x14be8dbb7419   b19  8b4dc0               movl rcx,[rbp-0x40]
0x14be8dbb741c   b1c  8b75b8               movl rsi,[rbp-0x48]
0x14be8dbb741f   b1f  33ff                 xorl rdi,rdi
0x14be8dbb7421   b21  8b55b0               movl rdx,[rbp-0x50]
0x14be8dbb7424   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x14be8dbb7428   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x14be8dbb742d   b2d  448b7d98             movl r15,[rbp-0x68]
0x14be8dbb7431   b31  e9dcfcffff           jmp 0x14be8dbb7112  <+0x812>
0x14be8dbb7436   b36  c5f92edb             vucomisd xmm3,xmm3
0x14be8dbb743a   b3a  0f8b08000000         jpo 0x14be8dbb7448  <+0xb48>
0x14be8dbb7440   b40  4c8bf7               REX.W movq r14,rdi
0x14be8dbb7443   b43  e948fdffff           jmp 0x14be8dbb7190  <+0x890>
0x14be8dbb7448   b48  c5f82eca             vucomiss xmm1,xmm2
0x14be8dbb744c   b4c  77f2                 ja 0x14be8dbb7440  <+0xb40>
0x14be8dbb744e   b4e  41beffffffff         movl r14,0xffffffff
0x14be8dbb7454   b54  e937fdffff           jmp 0x14be8dbb7190  <+0x890>
0x14be8dbb7459   b59  c5f92ee4             vucomisd xmm4,xmm4
0x14be8dbb745d   b5d  0f8b08000000         jpo 0x14be8dbb746b  <+0xb6b>
0x14be8dbb7463   b63  4c8bf7               REX.W movq r14,rdi
0x14be8dbb7466   b66  e9cafdffff           jmp 0x14be8dbb7235  <+0x935>
0x14be8dbb746b   b6b  c5f82eca             vucomiss xmm1,xmm2
0x14be8dbb746f   b6f  77f2                 ja 0x14be8dbb7463  <+0xb63>
0x14be8dbb7471   b71  41beffffffff         movl r14,0xffffffff
0x14be8dbb7477   b77  e9b9fdffff           jmp 0x14be8dbb7235  <+0x935>
0x14be8dbb747c   b7c  e88f5df2ff           call 0x14be8dadd210  (jump table)
0x14be8dbb7481   b81  e88a5df2ff           call 0x14be8dadd210  (jump table)
0x14be8dbb7486   b86  e8855df2ff           call 0x14be8dadd210  (jump table)
0x14be8dbb748b   b8b  90                   nop

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
0x14be8dbb698e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x14be8dbb698a  internal wasm call
0x14be8dbb6a15  external reference (0x193f2f0)
0x14be8dbb6e87  internal wasm call
0x14be8dbb6eff  external reference (0x193f270)
0x14be8dbb6f96  internal wasm call
0x14be8dbb729f  wasm stub call  (0x14be8dadd4d0)
0x14be8dbb72e4  wasm stub call  (0x14be8dadd4d0)
0x14be8dbb736d  wasm stub call  (0x14be8dadd4d0)
0x14be8dbb73a9  wasm stub call  (0x14be8dadd4d0)
0x14be8dbb7403  wasm stub call  (0x14be8dadd4d0)
0x14be8dbb747d  wasm stub call  (0x14be8dadd210)
0x14be8dbb7482  wasm stub call  (0x14be8dadd210)
0x14be8dbb7487  wasm stub call  (0x14be8dadd210)
