name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x3558f1e1e440     0  55                   push rbp
0x3558f1e1e441     1  4889e5               REX.W movq rbp,rsp
0x3558f1e1e444     4  6a08                 push 0x8
0x3558f1e1e446     6  56                   push rsi
0x3558f1e1e447     7  4881ec80000000       REX.W subq rsp,0x80
0x3558f1e1e44e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3558f1e1e452    12  48894580             REX.W movq [rbp-0x80],rax
0x3558f1e1e456    16  48895588             REX.W movq [rbp-0x78],rdx
0x3558f1e1e45a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x3558f1e1e461    21  48895d90             REX.W movq [rbp-0x70],rbx
0x3558f1e1e465    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x3558f1e1e469    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x3558f1e1e46d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1e471    31  0f8667090000         jna 0x3558f1e1edde  <+0x99e>
0x3558f1e1e477    37  448be0               movl r12,rax
0x3558f1e1e47a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x3558f1e1e483    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3558f1e1e488    48  478b742328           movl r14,[r11+r12*1+0x28]
0x3558f1e1e48d    4d  450faff7             imull r14,r15
0x3558f1e1e491    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x3558f1e1e495    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x3558f1e1e499    59  4d8bfe               REX.W movq r15,r14
0x3558f1e1e49c    5c  4183c701             addl r15,0x1
0x3558f1e1e4a0    60  0f850c000000         jnz 0x3558f1e1e4b2  <+0x72>
0x3558f1e1e4a6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x3558f1e1e4aa    6a  4533ff               xorl r15,r15
0x3558f1e1e4ad    6d  e928010000           jmp 0x3558f1e1e5da  <+0x19a>
0x3558f1e1e4b2    72  438b3c23             movl rdi,[r11+r12*1]
0x3558f1e1e4b6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x3558f1e1e4ba    7a  47393c23             cmpl [r11+r12*1],r15
0x3558f1e1e4be    7e  0f8341000000         jnc 0x3558f1e1e505  <+0xc5>
0x3558f1e1e4c4    84  498bcf               REX.W movq rcx,r15
0x3558f1e1e4c7    87  33d2                 xorl rdx,rdx
0x3558f1e1e4c9    89  e83248f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1e4ce    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3558f1e1e4d2    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3558f1e1e4d6    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x3558f1e1e4db    9b  4489e7               movl rdi,r12
0x3558f1e1e4de    9e  4d8be3               REX.W movq r12,r11
0x3558f1e1e4e1    a1  4c8bdb               REX.W movq r11,rbx
0x3558f1e1e4e4    a4  8b5588               movl rdx,[rbp-0x78]
0x3558f1e1e4e7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1e4ed    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e4f1    b1  8b4580               movl rax,[rbp-0x80]
0x3558f1e1e4f4    b4  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1e4f8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3558f1e1e4fc    bc  448b75b0             movl r14,[rbp-0x50]
0x3558f1e1e500    c0  e902000000           jmp 0x3558f1e1e507  <+0xc7>
0x3558f1e1e505    c5  33ff                 xorl rdi,rdi
0x3558f1e1e507    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x3558f1e1e50c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x3558f1e1e510    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x3558f1e1e514    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x3558f1e1e518    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x3558f1e1e51c    dc  4585f6               testl r14,r14
0x3558f1e1e51f    df  0f84a4000000         jz 0x3558f1e1e5c9  <+0x189>
0x3558f1e1e525    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x3558f1e1e52d    ed  83c3fc               addl rbx,0xfc
0x3558f1e1e530    f0  0f8480000000         jz 0x3558f1e1e5b6  <+0x176>
0x3558f1e1e536    f6  4989e2               REX.W movq r10,rsp
0x3558f1e1e539    f9  4883ec08             REX.W subq rsp,0x8
0x3558f1e1e53d    fd  4883e4f0             REX.W andq rsp,0xf0
0x3558f1e1e541   101  4c891424             REX.W movq [rsp],r10
0x3558f1e1e545   105  488bfe               REX.W movq rdi,rsi
0x3558f1e1e548   108  4c8bc3               REX.W movq r8,rbx
0x3558f1e1e54b   10b  8b55e8               movl rdx,[rbp-0x18]
0x3558f1e1e54e   10e  33c9                 xorl rcx,rcx
0x3558f1e1e550   110  488bf1               REX.W movq rsi,rcx
0x3558f1e1e553   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3558f1e1e55d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3558f1e1e564   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3558f1e1e56b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3558f1e1e572   132  ffd0                 call rax
0x3558f1e1e574   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3558f1e1e57f   13f  488b2424             REX.W movq rsp,[rsp]
0x3558f1e1e583   143  85c0                 testl rax,rax
0x3558f1e1e585   145  0f843b0a0000         jz 0x3558f1e1efc6  <+0xb86>
0x3558f1e1e58b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1e58f   14f  8b5588               movl rdx,[rbp-0x78]
0x3558f1e1e592   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1e596   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1e59c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e5a0   160  8b4580               movl rax,[rbp-0x80]
0x3558f1e1e5a3   163  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1e5a7   167  8b7db8               movl rdi,[rbp-0x48]
0x3558f1e1e5aa   16a  448b45c8             movl r8,[rbp-0x38]
0x3558f1e1e5ae   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3558f1e1e5b2   172  448b75b0             movl r14,[rbp-0x50]
0x3558f1e1e5b6   176  8bdf                 movl rbx,rdi
0x3558f1e1e5b8   178  4403f3               addl r14,rbx
0x3558f1e1e5bb   17b  4103df               addl rbx,r15
0x3558f1e1e5be   17e  458bf8               movl r15,r8
0x3558f1e1e5c1   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x3558f1e1e5c6   186  418bfe               movl rdi,r14
0x3558f1e1e5c9   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x3558f1e1e5d1   191  8d5f01               leal rbx,[rdi+0x1]
0x3558f1e1e5d4   194  448bfb               movl r15,rbx
0x3558f1e1e5d7   197  8b5d90               movl rbx,[rbp-0x70]
0x3558f1e1e5da   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x3558f1e1e5df   19f  458bc1               movl r8,r9
0x3558f1e1e5e2   1a2  448bf1               movl r14,rcx
0x3558f1e1e5e5   1a5  443bc1               cmpl r8,rcx
0x3558f1e1e5e8   1a8  450f42f0             cmovcl r14,r8
0x3558f1e1e5ec   1ac  33ff                 xorl rdi,rdi
0x3558f1e1e5ee   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x3558f1e1e5f2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x3558f1e1e5f6   1b6  4585f6               testl r14,r14
0x3558f1e1e5f9   1b9  0f850e000000         jnz 0x3558f1e1e60d  <+0x1cd>
0x3558f1e1e5ff   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x3558f1e1e604   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1e608   1c8  e904020000           jmp 0x3558f1e1e811  <+0x3d1>
0x3558f1e1e60d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x3558f1e1e612   1d2  4533c9               xorl r9,r9
0x3558f1e1e615   1d5  4585c0               testl r8,r8
0x3558f1e1e618   1d8  410f95c1             setnzl r9l
0x3558f1e1e61c   1dc  452bc1               subl r8,r9
0x3558f1e1e61f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x3558f1e1e624   1e4  33db                 xorl rbx,rbx
0x3558f1e1e626   1e6  4585c9               testl r9,r9
0x3558f1e1e629   1e9  0f95c3               setnzl bl
0x3558f1e1e62c   1ec  458bf1               movl r14,r9
0x3558f1e1e62f   1ef  442bf3               subl r14,rbx
0x3558f1e1e632   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x3558f1e1e637   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3558f1e1e63e   1fe  448b55e8             movl r10,[rbp-0x18]
0x3558f1e1e642   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x3558f1e1e646   206  8bca                 movl rcx,rdx
0x3558f1e1e648   208  8b5590               movl rdx,[rbp-0x70]
0x3558f1e1e64b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1e64f   20f  e930000000           jmp 0x3558f1e1e684  <+0x244>
0x3558f1e1e654   214  660f1f840000000000   nop
0x3558f1e1e65d   21d  660f1f840000000000   nop
0x3558f1e1e666   226  660f1f840000000000   nop
0x3558f1e1e66f   22f  660f1f840000000000   nop
0x3558f1e1e678   238  0f1f840000000000     nop
0x3558f1e1e680   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x3558f1e1e684   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1e688   248  0f8675070000         jna 0x3558f1e1ee03  <+0x9c3>
0x3558f1e1e68e   24e  8bf1                 movl rsi,rcx
0x3558f1e1e690   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x3558f1e1e696   256  c5f82ed2             vucomiss xmm2,xmm2
0x3558f1e1e69a   25a  7a06                 jpe 0x3558f1e1e6a2  <+0x262>
0x3558f1e1e69c   25c  0f8404000000         jz 0x3558f1e1e6a6  <+0x266>
0x3558f1e1e6a2   262  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1e6a6   266  c5f82ed1             vucomiss xmm2,xmm1
0x3558f1e1e6aa   26a  0f8704000000         ja 0x3558f1e1e6b4  <+0x274>
0x3558f1e1e6b0   270  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1e6b4   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3558f1e1e6b8   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3558f1e1e6be   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x3558f1e1e6c2   282  85f6                 testl rsi,rsi
0x3558f1e1e6c4   284  0f8929000000         jns 0x3558f1e1e6f3  <+0x2b3>
0x3558f1e1e6ca   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3558f1e1e6d4   294  c441f96efa           vmovq xmm15,r10
0x3558f1e1e6d9   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3558f1e1e6dd   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x3558f1e1e6e2   2a2  85f6                 testl rsi,rsi
0x3558f1e1e6e4   2a4  0f8809000000         js 0x3558f1e1e6f3  <+0x2b3>
0x3558f1e1e6ea   2aa  41ba00000080         movl r10,0x80000000
0x3558f1e1e6f0   2b0  410bf2               orl rsi,r10
0x3558f1e1e6f3   2b3  448bd6               movl r10,rsi
0x3558f1e1e6f6   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3558f1e1e6fb   2bb  c5f92eec             vucomisd xmm5,xmm4
0x3558f1e1e6ff   2bf  0f8a53070000         jpe 0x3558f1e1ee58  <+0xa18>
0x3558f1e1e705   2c5  0f854d070000         jnz 0x3558f1e1ee58  <+0xa18>
0x3558f1e1e70b   2cb  8bc6                 movl rax,rsi
0x3558f1e1e70d   2cd  443bf6               cmpl r14,rsi
0x3558f1e1e710   2d0  410f42c6             cmovcl rax,r14
0x3558f1e1e714   2d4  83c001               addl rax,0x1
0x3558f1e1e717   2d7  41ba0000804f         movl r10,0x4f800000
0x3558f1e1e71d   2dd  c4c1796eda           vmovd xmm3,r10
0x3558f1e1e722   2e2  be01000000           movl rsi,0x1
0x3558f1e1e727   2e7  c5f82eda             vucomiss xmm3,xmm2
0x3558f1e1e72b   2eb  0f47f0               cmoval rsi,rax
0x3558f1e1e72e   2ee  8bc2                 movl rax,rdx
0x3558f1e1e730   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x3558f1e1e736   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x3558f1e1e73a   2fa  7a06                 jpe 0x3558f1e1e742  <+0x302>
0x3558f1e1e73c   2fc  0f8404000000         jz 0x3558f1e1e746  <+0x306>
0x3558f1e1e742   302  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1e746   306  c5f82ed1             vucomiss xmm2,xmm1
0x3558f1e1e74a   30a  0f8704000000         ja 0x3558f1e1e754  <+0x314>
0x3558f1e1e750   310  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1e754   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3558f1e1e758   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3558f1e1e75e   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x3558f1e1e762   322  85c0                 testl rax,rax
0x3558f1e1e764   324  0f8926000000         jns 0x3558f1e1e790  <+0x350>
0x3558f1e1e76a   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x3558f1e1e771   331  c441f96efa           vmovq xmm15,r10
0x3558f1e1e776   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3558f1e1e77a   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x3558f1e1e77f   33f  85c0                 testl rax,rax
0x3558f1e1e781   341  0f8809000000         js 0x3558f1e1e790  <+0x350>
0x3558f1e1e787   347  41ba00000080         movl r10,0x80000000
0x3558f1e1e78d   34d  410bc2               orl rax,r10
0x3558f1e1e790   350  448bd0               movl r10,rax
0x3558f1e1e793   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3558f1e1e798   358  c5f92ef5             vucomisd xmm6,xmm5
0x3558f1e1e79c   35c  0f8ad8060000         jpe 0x3558f1e1ee7a  <+0xa3a>
0x3558f1e1e7a2   362  0f85d2060000         jnz 0x3558f1e1ee7a  <+0xa3a>
0x3558f1e1e7a8   368  448be0               movl r12,rax
0x3558f1e1e7ab   36b  443bc0               cmpl r8,rax
0x3558f1e1e7ae   36e  450f42e0             cmovcl r12,r8
0x3558f1e1e7b2   372  488bc7               REX.W movq rax,rdi
0x3558f1e1e7b5   375  c5f82eda             vucomiss xmm3,xmm2
0x3558f1e1e7b9   379  410f47c4             cmoval rax,r12
0x3558f1e1e7bd   37d  458be1               movl r12,r9
0x3558f1e1e7c0   380  440fafe0             imull r12,rax
0x3558f1e1e7c4   384  4403e6               addl r12,rsi
0x3558f1e1e7c7   387  4539e7               cmpl r15,r12
0x3558f1e1e7ca   38a  0f860f000000         jna 0x3558f1e1e7df  <+0x39f>
0x3558f1e1e7d0   390  468d24a3             leal r12,[rbx+r12*4]
0x3558f1e1e7d4   394  438b0423             movl rax,[r11+r12*1]
0x3558f1e1e7d8   398  83c001               addl rax,0x1
0x3558f1e1e7db   39b  43890423             movl [r11+r12*1],rax
0x3558f1e1e7df   39f  83c104               addl rcx,0x4
0x3558f1e1e7e2   3a2  83c204               addl rdx,0x4
0x3558f1e1e7e5   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x3558f1e1e7e9   3a9  4183c4ff             addl r12,0xff
0x3558f1e1e7ed   3ad  0f858dfeffff         jnz 0x3558f1e1e680  <+0x240>
0x3558f1e1e7f3   3b3  448bc3               movl r8,rbx
0x3558f1e1e7f6   3b6  448b75e8             movl r14,[rbp-0x18]
0x3558f1e1e7fa   3ba  8b5d90               movl rbx,[rbp-0x70]
0x3558f1e1e7fd   3bd  8b5588               movl rdx,[rbp-0x78]
0x3558f1e1e800   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1e804   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1e80a   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e80e   3ce  8b4580               movl rax,[rbp-0x80]
0x3558f1e1e811   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x3558f1e1e818   3d8  4585ff               testl r15,r15
0x3558f1e1e81b   3db  0f8508000000         jnz 0x3558f1e1e829  <+0x3e9>
0x3558f1e1e821   3e1  488bdf               REX.W movq rbx,rdi
0x3558f1e1e824   3e4  e968020000           jmp 0x3558f1e1ea91  <+0x651>
0x3558f1e1e829   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x3558f1e1e831   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x3558f1e1e839   3f9  448bf3               movl r14,rbx
0x3558f1e1e83c   3fc  41c1ee02             shrl r14, 2
0x3558f1e1e840   400  4183c601             addl r14,0x1
0x3558f1e1e844   404  418bd6               movl rdx,r14
0x3558f1e1e847   407  83e207               andl rdx,0x7
0x3558f1e1e84a   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x3558f1e1e84e   40e  83fb1c               cmpl rbx,0x1c
0x3558f1e1e851   411  0f82db000000         jc 0x3558f1e1e932  <+0x4f2>
0x3558f1e1e857   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x3558f1e1e85e   41e  418bd8               movl rbx,r8
0x3558f1e1e861   421  488bcf               REX.W movq rcx,rdi
0x3558f1e1e864   424  660f1f840000000000   nop
0x3558f1e1e86d   42d  660f1f840000000000   nop
0x3558f1e1e876   436  660f1f840000000000   nop
0x3558f1e1e87f   43f  90                   nop
0x3558f1e1e880   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1e884   444  0f8612060000         jna 0x3558f1e1ee9c  <+0xa5c>
0x3558f1e1e88a   44a  418b341b             movl rsi,[r11+rbx*1]
0x3558f1e1e88e   44e  03ce                 addl rcx,rsi
0x3558f1e1e890   450  41890c1b             movl [r11+rbx*1],rcx
0x3558f1e1e894   454  8d7304               leal rsi,[rbx+0x4]
0x3558f1e1e897   457  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e89b   45b  4103c8               addl rcx,r8
0x3558f1e1e89e   45e  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8a2   462  8d7308               leal rsi,[rbx+0x8]
0x3558f1e1e8a5   465  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8a9   469  4103c8               addl rcx,r8
0x3558f1e1e8ac   46c  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8b0   470  8d730c               leal rsi,[rbx+0xc]
0x3558f1e1e8b3   473  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8b7   477  4103c8               addl rcx,r8
0x3558f1e1e8ba   47a  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8be   47e  8d7310               leal rsi,[rbx+0x10]
0x3558f1e1e8c1   481  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8c5   485  4103c8               addl rcx,r8
0x3558f1e1e8c8   488  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8cc   48c  8d7314               leal rsi,[rbx+0x14]
0x3558f1e1e8cf   48f  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8d3   493  4103c8               addl rcx,r8
0x3558f1e1e8d6   496  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8da   49a  8d7318               leal rsi,[rbx+0x18]
0x3558f1e1e8dd   49d  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8e1   4a1  4103c8               addl rcx,r8
0x3558f1e1e8e4   4a4  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8e8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x3558f1e1e8eb   4ab  458b0433             movl r8,[r11+rsi*1]
0x3558f1e1e8ef   4af  4103c8               addl rcx,r8
0x3558f1e1e8f2   4b2  41890c33             movl [r11+rsi*1],rcx
0x3558f1e1e8f6   4b6  83c320               addl rbx,0x20
0x3558f1e1e8f9   4b9  4183c6f8             addl r14,0xf8
0x3558f1e1e8fd   4bd  7581                 jnz 0x3558f1e1e880  <+0x440>
0x3558f1e1e8ff   4bf  85d2                 testl rdx,rdx
0x3558f1e1e901   4c1  0f8510000000         jnz 0x3558f1e1e917  <+0x4d7>
0x3558f1e1e907   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e90b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x3558f1e1e912   4d2  e98b000000           jmp 0x3558f1e1e9a2  <+0x562>
0x3558f1e1e917   4d7  448bf3               movl r14,rbx
0x3558f1e1e91a   4da  8bd9                 movl rbx,rcx
0x3558f1e1e91c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1e922   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e926   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x3558f1e1e92d   4ed  e906000000           jmp 0x3558f1e1e938  <+0x4f8>
0x3558f1e1e932   4f2  488bdf               REX.W movq rbx,rdi
0x3558f1e1e935   4f5  458bf0               movl r14,r8
0x3558f1e1e938   4f8  c1e202               shll rdx, 2
0x3558f1e1e93b   4fb  0f1f440000           nop
0x3558f1e1e940   500  438b0c33             movl rcx,[r11+r14*1]
0x3558f1e1e944   504  03d9                 addl rbx,rcx
0x3558f1e1e946   506  43891c33             movl [r11+r14*1],rbx
0x3558f1e1e94a   50a  4183c604             addl r14,0x4
0x3558f1e1e94e   50e  83c2fc               addl rdx,0xfc
0x3558f1e1e951   511  0f844b000000         jz 0x3558f1e1e9a2  <+0x562>
0x3558f1e1e957   517  438b0c33             movl rcx,[r11+r14*1]
0x3558f1e1e95b   51b  03d9                 addl rbx,rcx
0x3558f1e1e95d   51d  43891c33             movl [r11+r14*1],rbx
0x3558f1e1e961   521  4183c604             addl r14,0x4
0x3558f1e1e965   525  83c2fc               addl rdx,0xfc
0x3558f1e1e968   528  0f8434000000         jz 0x3558f1e1e9a2  <+0x562>
0x3558f1e1e96e   52e  438b0c33             movl rcx,[r11+r14*1]
0x3558f1e1e972   532  03d9                 addl rbx,rcx
0x3558f1e1e974   534  43891c33             movl [r11+r14*1],rbx
0x3558f1e1e978   538  4183c604             addl r14,0x4
0x3558f1e1e97c   53c  83c2fc               addl rdx,0xfc
0x3558f1e1e97f   53f  0f841d000000         jz 0x3558f1e1e9a2  <+0x562>
0x3558f1e1e985   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1e989   549  0f864d050000         jna 0x3558f1e1eedc  <+0xa9c>
0x3558f1e1e98f   54f  438b0c33             movl rcx,[r11+r14*1]
0x3558f1e1e993   553  03d9                 addl rbx,rcx
0x3558f1e1e995   555  43891c33             movl [r11+r14*1],rbx
0x3558f1e1e999   559  4183c604             addl r14,0x4
0x3558f1e1e99d   55d  83c2fc               addl rdx,0xfc
0x3558f1e1e9a0   560  759e                 jnz 0x3558f1e1e940  <+0x500>
0x3558f1e1e9a2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x3558f1e1e9ab   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x3558f1e1e9b0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x3558f1e1e9b5   575  0f834a000000         jnc 0x3558f1e1ea05  <+0x5c5>
0x3558f1e1e9bb   57b  8bd8                 movl rbx,rax
0x3558f1e1e9bd   57d  8d430c               leal rax,[rbx+0xc]
0x3558f1e1e9c0   580  418bcf               movl rcx,r15
0x3558f1e1e9c3   583  488bd7               REX.W movq rdx,rdi
0x3558f1e1e9c6   586  e83543f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1e9cb   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3558f1e1e9cf   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3558f1e1e9d3   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x3558f1e1e9d8   598  4c8bd3               REX.W movq r10,rbx
0x3558f1e1e9db   59b  4489e3               movl rbx,r12
0x3558f1e1e9de   59e  4d8be3               REX.W movq r12,r11
0x3558f1e1e9e1   5a1  4d8bda               REX.W movq r11,r10
0x3558f1e1e9e4   5a4  33ff                 xorl rdi,rdi
0x3558f1e1e9e6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1e9ea   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e9ee   5ae  8b4580               movl rax,[rbp-0x80]
0x3558f1e1e9f1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x3558f1e1e9f5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1e9f9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x3558f1e1ea00   5c0  e903000000           jmp 0x3558f1e1ea08  <+0x5c8>
0x3558f1e1ea05   5c5  488bdf               REX.W movq rbx,rdi
0x3558f1e1ea08   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1ea0c   5cc  4d8bf7               REX.W movq r14,r15
0x3558f1e1ea0f   5cf  41c1e602             shll r14, 2
0x3558f1e1ea13   5d3  0f8478000000         jz 0x3558f1e1ea91  <+0x651>
0x3558f1e1ea19   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x3558f1e1ea1e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x3558f1e1ea22   5e2  4989e2               REX.W movq r10,rsp
0x3558f1e1ea25   5e5  4883ec08             REX.W subq rsp,0x8
0x3558f1e1ea29   5e9  4883e4f0             REX.W andq rsp,0xf0
0x3558f1e1ea2d   5ed  4c891424             REX.W movq [rsp],r10
0x3558f1e1ea31   5f1  488bd7               REX.W movq rdx,rdi
0x3558f1e1ea34   5f4  4c8bd7               REX.W movq r10,rdi
0x3558f1e1ea37   5f7  488bfe               REX.W movq rdi,rsi
0x3558f1e1ea3a   5fa  498bf2               REX.W movq rsi,r10
0x3558f1e1ea3d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x3558f1e1ea47   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3558f1e1ea4e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3558f1e1ea55   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3558f1e1ea5c   61c  ffd0                 call rax
0x3558f1e1ea5e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3558f1e1ea69   629  488b2424             REX.W movq rsp,[rsp]
0x3558f1e1ea6d   62d  85c0                 testl rax,rax
0x3558f1e1ea6f   62f  0f844c050000         jz 0x3558f1e1efc1  <+0xb81>
0x3558f1e1ea75   635  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1ea78   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1ea7c   63c  33ff                 xorl rdi,rdi
0x3558f1e1ea7e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1ea82   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1ea86   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1ea8a   64a  8b4580               movl rax,[rbp-0x80]
0x3558f1e1ea8d   64d  448b7dd0             movl r15,[rbp-0x30]
0x3558f1e1ea91   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x3558f1e1ea9a   65a  4103df               addl rbx,r15
0x3558f1e1ea9d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x3558f1e1eaa2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x3558f1e1eaa9   669  0f8508000000         jnz 0x3558f1e1eab7  <+0x677>
0x3558f1e1eaaf   66f  488bdf               REX.W movq rbx,rdi
0x3558f1e1eab2   672  e90b010000           jmp 0x3558f1e1ebc2  <+0x782>
0x3558f1e1eab7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x3558f1e1eabc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1eac2   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x3558f1e1eac7   687  0f833b000000         jnc 0x3558f1e1eb08  <+0x6c8>
0x3558f1e1eacd   68d  8bd8                 movl rbx,rax
0x3558f1e1eacf   68f  8d4318               leal rax,[rbx+0x18]
0x3558f1e1ead2   692  488bd7               REX.W movq rdx,rdi
0x3558f1e1ead5   695  e82642f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1eada   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3558f1e1eade   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3558f1e1eae2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x3558f1e1eae7   6a7  4c8bd3               REX.W movq r10,rbx
0x3558f1e1eaea   6aa  4489e3               movl rbx,r12
0x3558f1e1eaed   6ad  4d8be3               REX.W movq r12,r11
0x3558f1e1eaf0   6b0  4d8bda               REX.W movq r11,r10
0x3558f1e1eaf3   6b3  33ff                 xorl rdi,rdi
0x3558f1e1eaf5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1eaf9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1eaff   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1eb03   6c3  e903000000           jmp 0x3558f1e1eb0b  <+0x6cb>
0x3558f1e1eb08   6c8  488bdf               REX.W movq rbx,rdi
0x3558f1e1eb0b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3558f1e1eb10   6d0  418d149f             leal rdx,[r15+rbx*4]
0x3558f1e1eb14   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x3558f1e1eb18   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x3558f1e1eb1c   6dc  83f901               cmpl rcx,0x1
0x3558f1e1eb1f   6df  0f8492000000         jz 0x3558f1e1ebb7  <+0x777>
0x3558f1e1eb25   6e5  448bf1               movl r14,rcx
0x3558f1e1eb28   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x3558f1e1eb30   6f0  83c0fc               addl rax,0xfc
0x3558f1e1eb33   6f3  0f846f000000         jz 0x3558f1e1eba8  <+0x768>
0x3558f1e1eb39   6f9  4989e2               REX.W movq r10,rsp
0x3558f1e1eb3c   6fc  4883ec08             REX.W subq rsp,0x8
0x3558f1e1eb40   700  4883e4f0             REX.W andq rsp,0xf0
0x3558f1e1eb44   704  4c891424             REX.W movq [rsp],r10
0x3558f1e1eb48   708  488bcf               REX.W movq rcx,rdi
0x3558f1e1eb4b   70b  4c8bd7               REX.W movq r10,rdi
0x3558f1e1eb4e   70e  488bfe               REX.W movq rdi,rsi
0x3558f1e1eb51   711  498bf2               REX.W movq rsi,r10
0x3558f1e1eb54   714  4c8bc0               REX.W movq r8,rax
0x3558f1e1eb57   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x3558f1e1eb5e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3558f1e1eb65   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3558f1e1eb6c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3558f1e1eb73   733  ffd0                 call rax
0x3558f1e1eb75   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3558f1e1eb80   740  488b2424             REX.W movq rsp,[rsp]
0x3558f1e1eb84   744  85c0                 testl rax,rax
0x3558f1e1eb86   746  0f8430040000         jz 0x3558f1e1efbc  <+0xb7c>
0x3558f1e1eb8c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1eb90   750  33ff                 xorl rdi,rdi
0x3558f1e1eb92   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1eb96   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1eb9a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x3558f1e1eb9d   75d  448b7dc8             movl r15,[rbp-0x38]
0x3558f1e1eba1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x3558f1e1eba8   768  4103de               addl rbx,r14
0x3558f1e1ebab   76b  448d73ff             leal r14,[rbx-0x1]
0x3558f1e1ebaf   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x3558f1e1ebb4   774  418bde               movl rbx,r14
0x3558f1e1ebb7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x3558f1e1ebbf   77f  83c301               addl rbx,0x1
0x3558f1e1ebc2   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x3558f1e1ebc7   787  837de800             cmpl [rbp-0x18],0x0
0x3558f1e1ebcb   78b  0f8505000000         jnz 0x3558f1e1ebd6  <+0x796>
0x3558f1e1ebd1   791  488be5               REX.W movq rsp,rbp
0x3558f1e1ebd4   794  5d                   pop rbp
0x3558f1e1ebd5   795  c3                   retl
0x3558f1e1ebd6   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3558f1e1ebdb   79b  4533f6               xorl r14,r14
0x3558f1e1ebde   79e  4585ff               testl r15,r15
0x3558f1e1ebe1   7a1  410f95c6             setnzl r14l
0x3558f1e1ebe5   7a5  452bfe               subl r15,r14
0x3558f1e1ebe8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x3558f1e1ebed   7ad  33c0                 xorl rax,rax
0x3558f1e1ebef   7af  4585f6               testl r14,r14
0x3558f1e1ebf2   7b2  0f95c0               setnzl al
0x3558f1e1ebf5   7b5  418bd6               movl rdx,r14
0x3558f1e1ebf8   7b8  2bd0                 subl rdx,rax
0x3558f1e1ebfa   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3558f1e1ebff   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x3558f1e1ec04   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x3558f1e1ec09   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3558f1e1ec10   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x3558f1e1ec14   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x3558f1e1ec18   7d8  4c8be7               REX.W movq r12,rdi
0x3558f1e1ec1b   7db  448b4d88             movl r9,[rbp-0x78]
0x3558f1e1ec1f   7df  e924000000           jmp 0x3558f1e1ec48  <+0x808>
0x3558f1e1ec24   7e4  660f1f840000000000   nop
0x3558f1e1ec2d   7ed  660f1f840000000000   nop
0x3558f1e1ec36   7f6  660f1f840000000000   nop
0x3558f1e1ec3f   7ff  90                   nop
0x3558f1e1ec40   800  448b7d98             movl r15,[rbp-0x68]
0x3558f1e1ec44   804  4c894590             REX.W movq [rbp-0x70],r8
0x3558f1e1ec48   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1ec4c   80c  0f86cf020000         jna 0x3558f1e1ef21  <+0xae1>
0x3558f1e1ec52   812  448b7590             movl r14,[rbp-0x70]
0x3558f1e1ec56   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3558f1e1ec5c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x3558f1e1ec60   820  7a06                 jpe 0x3558f1e1ec68  <+0x828>
0x3558f1e1ec62   822  0f8404000000         jz 0x3558f1e1ec6c  <+0x82c>
0x3558f1e1ec68   828  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1ec6c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x3558f1e1ec70   830  0f8704000000         ja 0x3558f1e1ec7a  <+0x83a>
0x3558f1e1ec76   836  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1ec7a   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3558f1e1ec7e   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3558f1e1ec84   844  c57b2cf4             vcvttsd2si r14,xmm4
0x3558f1e1ec88   848  4585f6               testl r14,r14
0x3558f1e1ec8b   84b  0f8927000000         jns 0x3558f1e1ecb8  <+0x878>
0x3558f1e1ec91   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x3558f1e1ec98   858  c441f96efa           vmovq xmm15,r10
0x3558f1e1ec9d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3558f1e1eca1   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x3558f1e1eca6   866  4585f6               testl r14,r14
0x3558f1e1eca9   869  0f8809000000         js 0x3558f1e1ecb8  <+0x878>
0x3558f1e1ecaf   86f  41ba00000080         movl r10,0x80000000
0x3558f1e1ecb5   875  450bf2               orl r14,r10
0x3558f1e1ecb8   878  458bd6               movl r10,r14
0x3558f1e1ecbb   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3558f1e1ecc0   880  c5f92eec             vucomisd xmm5,xmm4
0x3558f1e1ecc4   884  0f8aac020000         jpe 0x3558f1e1ef76  <+0xb36>
0x3558f1e1ecca   88a  0f85a6020000         jnz 0x3558f1e1ef76  <+0xb36>
0x3558f1e1ecd0   890  458bc6               movl r8,r14
0x3558f1e1ecd3   893  453bfe               cmpl r15,r14
0x3558f1e1ecd6   896  450f42c7             cmovcl r8,r15
0x3558f1e1ecda   89a  41ba0000804f         movl r10,0x4f800000
0x3558f1e1ece0   8a0  c4c1796eda           vmovd xmm3,r10
0x3558f1e1ece5   8a5  4c8bf7               REX.W movq r14,rdi
0x3558f1e1ece8   8a8  c5f82eda             vucomiss xmm3,xmm2
0x3558f1e1ecec   8ac  450f47f0             cmoval r14,r8
0x3558f1e1ecf0   8b0  448b45a0             movl r8,[rbp-0x60]
0x3558f1e1ecf4   8b4  450fafc6             imull r8,r14
0x3558f1e1ecf8   8b8  458bf1               movl r14,r9
0x3558f1e1ecfb   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3558f1e1ed01   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x3558f1e1ed05   8c5  7a06                 jpe 0x3558f1e1ed0d  <+0x8cd>
0x3558f1e1ed07   8c7  0f8404000000         jz 0x3558f1e1ed11  <+0x8d1>
0x3558f1e1ed0d   8cd  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1ed11   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x3558f1e1ed15   8d5  0f8704000000         ja 0x3558f1e1ed1f  <+0x8df>
0x3558f1e1ed1b   8db  c5f928d1             vmovapd xmm2,xmm1
0x3558f1e1ed1f   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3558f1e1ed23   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3558f1e1ed29   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x3558f1e1ed2d   8ed  4585f6               testl r14,r14
0x3558f1e1ed30   8f0  0f8927000000         jns 0x3558f1e1ed5d  <+0x91d>
0x3558f1e1ed36   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x3558f1e1ed3d   8fd  c441f96efa           vmovq xmm15,r10
0x3558f1e1ed42   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3558f1e1ed46   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x3558f1e1ed4b   90b  4585f6               testl r14,r14
0x3558f1e1ed4e   90e  0f8809000000         js 0x3558f1e1ed5d  <+0x91d>
0x3558f1e1ed54   914  41ba00000080         movl r10,0x80000000
0x3558f1e1ed5a   91a  450bf2               orl r14,r10
0x3558f1e1ed5d   91d  458bd6               movl r10,r14
0x3558f1e1ed60   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3558f1e1ed65   925  c5f92ef5             vucomisd xmm6,xmm5
0x3558f1e1ed69   929  0f8a2a020000         jpe 0x3558f1e1ef99  <+0xb59>
0x3558f1e1ed6f   92f  0f8524020000         jnz 0x3558f1e1ef99  <+0xb59>
0x3558f1e1ed75   935  458bfe               movl r15,r14
0x3558f1e1ed78   938  413bd6               cmpl rdx,r14
0x3558f1e1ed7b   93b  440f42fa             cmovcl r15,rdx
0x3558f1e1ed7f   93f  4c8bf7               REX.W movq r14,rdi
0x3558f1e1ed82   942  c5f82eda             vucomiss xmm3,xmm2
0x3558f1e1ed86   946  450f47f7             cmoval r14,r15
0x3558f1e1ed8a   94a  478d3c06             leal r15,[r14+r8*1]
0x3558f1e1ed8e   94e  413bf7               cmpl rsi,r15
0x3558f1e1ed91   951  0f8625000000         jna 0x3558f1e1edbc  <+0x97c>
0x3558f1e1ed97   957  468d3cb9             leal r15,[rcx+r15*4]
0x3558f1e1ed9b   95b  478b343b             movl r14,[r11+r15*1]
0x3558f1e1ed9f   95f  413bde               cmpl rbx,r14
0x3558f1e1eda2   962  0f860c000000         jna 0x3558f1e1edb4  <+0x974>
0x3558f1e1eda8   968  468d34b0             leal r14,[rax+r14*4]
0x3558f1e1edac   96c  47892433             movl [r11+r14*1],r12
0x3558f1e1edb0   970  478b343b             movl r14,[r11+r15*1]
0x3558f1e1edb4   974  4183c601             addl r14,0x1
0x3558f1e1edb8   978  4789343b             movl [r11+r15*1],r14
0x3558f1e1edbc   97c  4183c104             addl r9,0x4
0x3558f1e1edc0   980  448b4590             movl r8,[rbp-0x70]
0x3558f1e1edc4   984  4183c004             addl r8,0x4
0x3558f1e1edc8   988  4183c401             addl r12,0x1
0x3558f1e1edcc   98c  448b75e8             movl r14,[rbp-0x18]
0x3558f1e1edd0   990  4539e6               cmpl r14,r12
0x3558f1e1edd3   993  0f8567feffff         jnz 0x3558f1e1ec40  <+0x800>
0x3558f1e1edd9   999  e9f3fdffff           jmp 0x3558f1e1ebd1  <+0x791>
0x3558f1e1edde   99e  e8ed46f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1ede3   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1ede7   9a7  8b5d90               movl rbx,[rbp-0x70]
0x3558f1e1edea   9aa  8b5588               movl rdx,[rbp-0x78]
0x3558f1e1eded   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3558f1e1edf3   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1edf7   9b7  8b4580               movl rax,[rbp-0x80]
0x3558f1e1edfa   9ba  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1edfe   9be  e974f6ffff           jmp 0x3558f1e1e477  <+0x37>
0x3558f1e1ee03   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x3558f1e1ee0a   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x3558f1e1ee0e   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x3558f1e1ee12   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x3558f1e1ee16   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x3558f1e1ee1a   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x3558f1e1ee1f   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x3558f1e1ee23   9e3  e8a846f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1ee28   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1ee2c   9ec  33ff                 xorl rdi,rdi
0x3558f1e1ee2e   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1ee32   9f2  448b7dd0             movl r15,[rbp-0x30]
0x3558f1e1ee36   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x3558f1e1ee3c   9fc  8b55b8               movl rdx,[rbp-0x48]
0x3558f1e1ee3f   9ff  8b4db0               movl rcx,[rbp-0x50]
0x3558f1e1ee42   a02  448b4da8             movl r9,[rbp-0x58]
0x3558f1e1ee46   a06  448b45a0             movl r8,[rbp-0x60]
0x3558f1e1ee4a   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x3558f1e1ee4f   a0f  448b75c0             movl r14,[rbp-0x40]
0x3558f1e1ee53   a13  e936f8ffff           jmp 0x3558f1e1e68e  <+0x24e>
0x3558f1e1ee58   a18  c5f92edb             vucomisd xmm3,xmm3
0x3558f1e1ee5c   a1c  0f8b08000000         jpo 0x3558f1e1ee6a  <+0xa2a>
0x3558f1e1ee62   a22  488bf7               REX.W movq rsi,rdi
0x3558f1e1ee65   a25  e9a1f8ffff           jmp 0x3558f1e1e70b  <+0x2cb>
0x3558f1e1ee6a   a2a  c5f82eca             vucomiss xmm1,xmm2
0x3558f1e1ee6e   a2e  77f2                 ja 0x3558f1e1ee62  <+0xa22>
0x3558f1e1ee70   a30  beffffffff           movl rsi,0xffffffff
0x3558f1e1ee75   a35  e991f8ffff           jmp 0x3558f1e1e70b  <+0x2cb>
0x3558f1e1ee7a   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x3558f1e1ee7e   a3e  0f8b08000000         jpo 0x3558f1e1ee8c  <+0xa4c>
0x3558f1e1ee84   a44  488bc7               REX.W movq rax,rdi
0x3558f1e1ee87   a47  e91cf9ffff           jmp 0x3558f1e1e7a8  <+0x368>
0x3558f1e1ee8c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x3558f1e1ee90   a50  77f2                 ja 0x3558f1e1ee84  <+0xa44>
0x3558f1e1ee92   a52  b8ffffffff           movl rax,0xffffffff
0x3558f1e1ee97   a57  e90cf9ffff           jmp 0x3558f1e1e7a8  <+0x368>
0x3558f1e1ee9c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x3558f1e1eea0   a60  4c897598             REX.W movq [rbp-0x68],r14
0x3558f1e1eea4   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x3558f1e1eea8   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x3558f1e1eeac   a6c  e81f46f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1eeb1   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1eeb5   a75  33ff                 xorl rdi,rdi
0x3558f1e1eeb7   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1eebb   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1eebf   a7f  8b4580               movl rax,[rbp-0x80]
0x3558f1e1eec2   a82  448b7dd0             movl r15,[rbp-0x30]
0x3558f1e1eec6   a86  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1eeca   a8a  8b55c8               movl rdx,[rbp-0x38]
0x3558f1e1eecd   a8d  448b7598             movl r14,[rbp-0x68]
0x3558f1e1eed1   a91  8b5da8               movl rbx,[rbp-0x58]
0x3558f1e1eed4   a94  8b4db0               movl rcx,[rbp-0x50]
0x3558f1e1eed7   a97  e9aef9ffff           jmp 0x3558f1e1e88a  <+0x44a>
0x3558f1e1eedc   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x3558f1e1eee0   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x3558f1e1eee4   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x3558f1e1eee8   aa8  e8e345f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1eeed   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1eef1   ab1  33ff                 xorl rdi,rdi
0x3558f1e1eef3   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1eef7   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3558f1e1eefb   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1eeff   abf  8b4580               movl rax,[rbp-0x80]
0x3558f1e1ef02   ac2  448b7dd0             movl r15,[rbp-0x30]
0x3558f1e1ef06   ac6  448b4dc0             movl r9,[rbp-0x40]
0x3558f1e1ef0a   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x3558f1e1ef11   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x3558f1e1ef15   ad5  448b75b8             movl r14,[rbp-0x48]
0x3558f1e1ef19   ad9  8b5da8               movl rbx,[rbp-0x58]
0x3558f1e1ef1c   adc  e96efaffff           jmp 0x3558f1e1e98f  <+0x54f>
0x3558f1e1ef21   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x3558f1e1ef25   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x3558f1e1ef29   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x3558f1e1ef2d   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1ef31   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x3558f1e1ef35   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x3558f1e1ef39   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x3558f1e1ef3d   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x3558f1e1ef42   b02  e88945f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1ef47   b07  448b65e0             movl r12,[rbp-0x20]
0x3558f1e1ef4b   b0b  448b4d88             movl r9,[rbp-0x78]
0x3558f1e1ef4f   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3558f1e1ef53   b13  8b45d0               movl rax,[rbp-0x30]
0x3558f1e1ef56   b16  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1ef59   b19  8b4dc0               movl rcx,[rbp-0x40]
0x3558f1e1ef5c   b1c  8b75b8               movl rsi,[rbp-0x48]
0x3558f1e1ef5f   b1f  33ff                 xorl rdi,rdi
0x3558f1e1ef61   b21  8b55b0               movl rdx,[rbp-0x50]
0x3558f1e1ef64   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3558f1e1ef68   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x3558f1e1ef6d   b2d  448b7d98             movl r15,[rbp-0x68]
0x3558f1e1ef71   b31  e9dcfcffff           jmp 0x3558f1e1ec52  <+0x812>
0x3558f1e1ef76   b36  c5f92edb             vucomisd xmm3,xmm3
0x3558f1e1ef7a   b3a  0f8b08000000         jpo 0x3558f1e1ef88  <+0xb48>
0x3558f1e1ef80   b40  4c8bf7               REX.W movq r14,rdi
0x3558f1e1ef83   b43  e948fdffff           jmp 0x3558f1e1ecd0  <+0x890>
0x3558f1e1ef88   b48  c5f82eca             vucomiss xmm1,xmm2
0x3558f1e1ef8c   b4c  77f2                 ja 0x3558f1e1ef80  <+0xb40>
0x3558f1e1ef8e   b4e  41beffffffff         movl r14,0xffffffff
0x3558f1e1ef94   b54  e937fdffff           jmp 0x3558f1e1ecd0  <+0x890>
0x3558f1e1ef99   b59  c5f92ee4             vucomisd xmm4,xmm4
0x3558f1e1ef9d   b5d  0f8b08000000         jpo 0x3558f1e1efab  <+0xb6b>
0x3558f1e1efa3   b63  4c8bf7               REX.W movq r14,rdi
0x3558f1e1efa6   b66  e9cafdffff           jmp 0x3558f1e1ed75  <+0x935>
0x3558f1e1efab   b6b  c5f82eca             vucomiss xmm1,xmm2
0x3558f1e1efaf   b6f  77f2                 ja 0x3558f1e1efa3  <+0xb63>
0x3558f1e1efb1   b71  41beffffffff         movl r14,0xffffffff
0x3558f1e1efb7   b77  e9b9fdffff           jmp 0x3558f1e1ed75  <+0x935>
0x3558f1e1efbc   b7c  e84f42f2ff           call 0x3558f1d43210  (jump table)
0x3558f1e1efc1   b81  e84a42f2ff           call 0x3558f1d43210  (jump table)
0x3558f1e1efc6   b86  e84542f2ff           call 0x3558f1d43210  (jump table)
0x3558f1e1efcb   b8b  90                   nop

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
0x3558f1e1e4ce     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x3558f1e1e4ca  internal wasm call
0x3558f1e1e555  external reference (0x193f2f0)
0x3558f1e1e9c7  internal wasm call
0x3558f1e1ea3f  external reference (0x193f270)
0x3558f1e1ead6  internal wasm call
0x3558f1e1eddf  wasm stub call  (0x3558f1d434d0)
0x3558f1e1ee24  wasm stub call  (0x3558f1d434d0)
0x3558f1e1eead  wasm stub call  (0x3558f1d434d0)
0x3558f1e1eee9  wasm stub call  (0x3558f1d434d0)
0x3558f1e1ef43  wasm stub call  (0x3558f1d434d0)
0x3558f1e1efbd  wasm stub call  (0x3558f1d43210)
0x3558f1e1efc2  wasm stub call  (0x3558f1d43210)
0x3558f1e1efc7  wasm stub call  (0x3558f1d43210)
