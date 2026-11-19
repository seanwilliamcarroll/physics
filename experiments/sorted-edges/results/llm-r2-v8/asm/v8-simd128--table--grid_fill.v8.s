name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x290ee9ff4b40     0  55                   push rbp
0x290ee9ff4b41     1  4889e5               REX.W movq rbp,rsp
0x290ee9ff4b44     4  6a08                 push 0x8
0x290ee9ff4b46     6  56                   push rsi
0x290ee9ff4b47     7  4881ec80000000       REX.W subq rsp,0x80
0x290ee9ff4b4e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x290ee9ff4b52    12  48894580             REX.W movq [rbp-0x80],rax
0x290ee9ff4b56    16  48895588             REX.W movq [rbp-0x78],rdx
0x290ee9ff4b5a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x290ee9ff4b61    21  48895d90             REX.W movq [rbp-0x70],rbx
0x290ee9ff4b65    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x290ee9ff4b69    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x290ee9ff4b6d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff4b71    31  0f8667090000         jna 0x290ee9ff54de  <+0x99e>
0x290ee9ff4b77    37  448be0               movl r12,rax
0x290ee9ff4b7a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x290ee9ff4b83    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x290ee9ff4b88    48  478b742328           movl r14,[r11+r12*1+0x28]
0x290ee9ff4b8d    4d  450faff7             imull r14,r15
0x290ee9ff4b91    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x290ee9ff4b95    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x290ee9ff4b99    59  4d8bfe               REX.W movq r15,r14
0x290ee9ff4b9c    5c  4183c701             addl r15,0x1
0x290ee9ff4ba0    60  0f850c000000         jnz 0x290ee9ff4bb2  <+0x72>
0x290ee9ff4ba6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x290ee9ff4baa    6a  4533ff               xorl r15,r15
0x290ee9ff4bad    6d  e928010000           jmp 0x290ee9ff4cda  <+0x19a>
0x290ee9ff4bb2    72  438b3c23             movl rdi,[r11+r12*1]
0x290ee9ff4bb6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x290ee9ff4bba    7a  47393c23             cmpl [r11+r12*1],r15
0x290ee9ff4bbe    7e  0f8341000000         jnc 0x290ee9ff4c05  <+0xc5>
0x290ee9ff4bc4    84  498bcf               REX.W movq rcx,r15
0x290ee9ff4bc7    87  33d2                 xorl rdx,rdx
0x290ee9ff4bc9    89  e83241f2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff4bce    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x290ee9ff4bd2    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x290ee9ff4bd6    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x290ee9ff4bdb    9b  4489e7               movl rdi,r12
0x290ee9ff4bde    9e  4d8be3               REX.W movq r12,r11
0x290ee9ff4be1    a1  4c8bdb               REX.W movq r11,rbx
0x290ee9ff4be4    a4  8b5588               movl rdx,[rbp-0x78]
0x290ee9ff4be7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff4bed    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff4bf1    b1  8b4580               movl rax,[rbp-0x80]
0x290ee9ff4bf4    b4  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff4bf8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x290ee9ff4bfc    bc  448b75b0             movl r14,[rbp-0x50]
0x290ee9ff4c00    c0  e902000000           jmp 0x290ee9ff4c07  <+0xc7>
0x290ee9ff4c05    c5  33ff                 xorl rdi,rdi
0x290ee9ff4c07    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x290ee9ff4c0c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x290ee9ff4c10    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x290ee9ff4c14    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x290ee9ff4c18    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x290ee9ff4c1c    dc  4585f6               testl r14,r14
0x290ee9ff4c1f    df  0f84a4000000         jz 0x290ee9ff4cc9  <+0x189>
0x290ee9ff4c25    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x290ee9ff4c2d    ed  83c3fc               addl rbx,0xfc
0x290ee9ff4c30    f0  0f8480000000         jz 0x290ee9ff4cb6  <+0x176>
0x290ee9ff4c36    f6  4989e2               REX.W movq r10,rsp
0x290ee9ff4c39    f9  4883ec08             REX.W subq rsp,0x8
0x290ee9ff4c3d    fd  4883e4f0             REX.W andq rsp,0xf0
0x290ee9ff4c41   101  4c891424             REX.W movq [rsp],r10
0x290ee9ff4c45   105  488bfe               REX.W movq rdi,rsi
0x290ee9ff4c48   108  4c8bc3               REX.W movq r8,rbx
0x290ee9ff4c4b   10b  8b55e8               movl rdx,[rbp-0x18]
0x290ee9ff4c4e   10e  33c9                 xorl rcx,rcx
0x290ee9ff4c50   110  488bf1               REX.W movq rsi,rcx
0x290ee9ff4c53   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x290ee9ff4c5d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x290ee9ff4c64   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x290ee9ff4c6b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x290ee9ff4c72   132  ffd0                 call rax
0x290ee9ff4c74   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x290ee9ff4c7f   13f  488b2424             REX.W movq rsp,[rsp]
0x290ee9ff4c83   143  85c0                 testl rax,rax
0x290ee9ff4c85   145  0f843b0a0000         jz 0x290ee9ff56c6  <+0xb86>
0x290ee9ff4c8b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff4c8f   14f  8b5588               movl rdx,[rbp-0x78]
0x290ee9ff4c92   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff4c96   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff4c9c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff4ca0   160  8b4580               movl rax,[rbp-0x80]
0x290ee9ff4ca3   163  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff4ca7   167  8b7db8               movl rdi,[rbp-0x48]
0x290ee9ff4caa   16a  448b45c8             movl r8,[rbp-0x38]
0x290ee9ff4cae   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x290ee9ff4cb2   172  448b75b0             movl r14,[rbp-0x50]
0x290ee9ff4cb6   176  8bdf                 movl rbx,rdi
0x290ee9ff4cb8   178  4403f3               addl r14,rbx
0x290ee9ff4cbb   17b  4103df               addl rbx,r15
0x290ee9ff4cbe   17e  458bf8               movl r15,r8
0x290ee9ff4cc1   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x290ee9ff4cc6   186  418bfe               movl rdi,r14
0x290ee9ff4cc9   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x290ee9ff4cd1   191  8d5f01               leal rbx,[rdi+0x1]
0x290ee9ff4cd4   194  448bfb               movl r15,rbx
0x290ee9ff4cd7   197  8b5d90               movl rbx,[rbp-0x70]
0x290ee9ff4cda   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x290ee9ff4cdf   19f  458bc1               movl r8,r9
0x290ee9ff4ce2   1a2  448bf1               movl r14,rcx
0x290ee9ff4ce5   1a5  443bc1               cmpl r8,rcx
0x290ee9ff4ce8   1a8  450f42f0             cmovcl r14,r8
0x290ee9ff4cec   1ac  33ff                 xorl rdi,rdi
0x290ee9ff4cee   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x290ee9ff4cf2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x290ee9ff4cf6   1b6  4585f6               testl r14,r14
0x290ee9ff4cf9   1b9  0f850e000000         jnz 0x290ee9ff4d0d  <+0x1cd>
0x290ee9ff4cff   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x290ee9ff4d04   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff4d08   1c8  e904020000           jmp 0x290ee9ff4f11  <+0x3d1>
0x290ee9ff4d0d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x290ee9ff4d12   1d2  4533c9               xorl r9,r9
0x290ee9ff4d15   1d5  4585c0               testl r8,r8
0x290ee9ff4d18   1d8  410f95c1             setnzl r9l
0x290ee9ff4d1c   1dc  452bc1               subl r8,r9
0x290ee9ff4d1f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x290ee9ff4d24   1e4  33db                 xorl rbx,rbx
0x290ee9ff4d26   1e6  4585c9               testl r9,r9
0x290ee9ff4d29   1e9  0f95c3               setnzl bl
0x290ee9ff4d2c   1ec  458bf1               movl r14,r9
0x290ee9ff4d2f   1ef  442bf3               subl r14,rbx
0x290ee9ff4d32   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x290ee9ff4d37   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x290ee9ff4d3e   1fe  448b55e8             movl r10,[rbp-0x18]
0x290ee9ff4d42   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x290ee9ff4d46   206  8bca                 movl rcx,rdx
0x290ee9ff4d48   208  8b5590               movl rdx,[rbp-0x70]
0x290ee9ff4d4b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff4d4f   20f  e930000000           jmp 0x290ee9ff4d84  <+0x244>
0x290ee9ff4d54   214  660f1f840000000000   nop
0x290ee9ff4d5d   21d  660f1f840000000000   nop
0x290ee9ff4d66   226  660f1f840000000000   nop
0x290ee9ff4d6f   22f  660f1f840000000000   nop
0x290ee9ff4d78   238  0f1f840000000000     nop
0x290ee9ff4d80   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x290ee9ff4d84   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff4d88   248  0f8675070000         jna 0x290ee9ff5503  <+0x9c3>
0x290ee9ff4d8e   24e  8bf1                 movl rsi,rcx
0x290ee9ff4d90   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x290ee9ff4d96   256  c5f82ed2             vucomiss xmm2,xmm2
0x290ee9ff4d9a   25a  7a06                 jpe 0x290ee9ff4da2  <+0x262>
0x290ee9ff4d9c   25c  0f8404000000         jz 0x290ee9ff4da6  <+0x266>
0x290ee9ff4da2   262  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff4da6   266  c5f82ed1             vucomiss xmm2,xmm1
0x290ee9ff4daa   26a  0f8704000000         ja 0x290ee9ff4db4  <+0x274>
0x290ee9ff4db0   270  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff4db4   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x290ee9ff4db8   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x290ee9ff4dbe   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x290ee9ff4dc2   282  85f6                 testl rsi,rsi
0x290ee9ff4dc4   284  0f8929000000         jns 0x290ee9ff4df3  <+0x2b3>
0x290ee9ff4dca   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x290ee9ff4dd4   294  c441f96efa           vmovq xmm15,r10
0x290ee9ff4dd9   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x290ee9ff4ddd   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x290ee9ff4de2   2a2  85f6                 testl rsi,rsi
0x290ee9ff4de4   2a4  0f8809000000         js 0x290ee9ff4df3  <+0x2b3>
0x290ee9ff4dea   2aa  41ba00000080         movl r10,0x80000000
0x290ee9ff4df0   2b0  410bf2               orl rsi,r10
0x290ee9ff4df3   2b3  448bd6               movl r10,rsi
0x290ee9ff4df6   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x290ee9ff4dfb   2bb  c5f92eec             vucomisd xmm5,xmm4
0x290ee9ff4dff   2bf  0f8a53070000         jpe 0x290ee9ff5558  <+0xa18>
0x290ee9ff4e05   2c5  0f854d070000         jnz 0x290ee9ff5558  <+0xa18>
0x290ee9ff4e0b   2cb  8bc6                 movl rax,rsi
0x290ee9ff4e0d   2cd  443bf6               cmpl r14,rsi
0x290ee9ff4e10   2d0  410f42c6             cmovcl rax,r14
0x290ee9ff4e14   2d4  83c001               addl rax,0x1
0x290ee9ff4e17   2d7  41ba0000804f         movl r10,0x4f800000
0x290ee9ff4e1d   2dd  c4c1796eda           vmovd xmm3,r10
0x290ee9ff4e22   2e2  be01000000           movl rsi,0x1
0x290ee9ff4e27   2e7  c5f82eda             vucomiss xmm3,xmm2
0x290ee9ff4e2b   2eb  0f47f0               cmoval rsi,rax
0x290ee9ff4e2e   2ee  8bc2                 movl rax,rdx
0x290ee9ff4e30   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x290ee9ff4e36   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x290ee9ff4e3a   2fa  7a06                 jpe 0x290ee9ff4e42  <+0x302>
0x290ee9ff4e3c   2fc  0f8404000000         jz 0x290ee9ff4e46  <+0x306>
0x290ee9ff4e42   302  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff4e46   306  c5f82ed1             vucomiss xmm2,xmm1
0x290ee9ff4e4a   30a  0f8704000000         ja 0x290ee9ff4e54  <+0x314>
0x290ee9ff4e50   310  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff4e54   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x290ee9ff4e58   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x290ee9ff4e5e   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x290ee9ff4e62   322  85c0                 testl rax,rax
0x290ee9ff4e64   324  0f8926000000         jns 0x290ee9ff4e90  <+0x350>
0x290ee9ff4e6a   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x290ee9ff4e71   331  c441f96efa           vmovq xmm15,r10
0x290ee9ff4e76   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x290ee9ff4e7a   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x290ee9ff4e7f   33f  85c0                 testl rax,rax
0x290ee9ff4e81   341  0f8809000000         js 0x290ee9ff4e90  <+0x350>
0x290ee9ff4e87   347  41ba00000080         movl r10,0x80000000
0x290ee9ff4e8d   34d  410bc2               orl rax,r10
0x290ee9ff4e90   350  448bd0               movl r10,rax
0x290ee9ff4e93   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x290ee9ff4e98   358  c5f92ef5             vucomisd xmm6,xmm5
0x290ee9ff4e9c   35c  0f8ad8060000         jpe 0x290ee9ff557a  <+0xa3a>
0x290ee9ff4ea2   362  0f85d2060000         jnz 0x290ee9ff557a  <+0xa3a>
0x290ee9ff4ea8   368  448be0               movl r12,rax
0x290ee9ff4eab   36b  443bc0               cmpl r8,rax
0x290ee9ff4eae   36e  450f42e0             cmovcl r12,r8
0x290ee9ff4eb2   372  488bc7               REX.W movq rax,rdi
0x290ee9ff4eb5   375  c5f82eda             vucomiss xmm3,xmm2
0x290ee9ff4eb9   379  410f47c4             cmoval rax,r12
0x290ee9ff4ebd   37d  458be1               movl r12,r9
0x290ee9ff4ec0   380  440fafe0             imull r12,rax
0x290ee9ff4ec4   384  4403e6               addl r12,rsi
0x290ee9ff4ec7   387  4539e7               cmpl r15,r12
0x290ee9ff4eca   38a  0f860f000000         jna 0x290ee9ff4edf  <+0x39f>
0x290ee9ff4ed0   390  468d24a3             leal r12,[rbx+r12*4]
0x290ee9ff4ed4   394  438b0423             movl rax,[r11+r12*1]
0x290ee9ff4ed8   398  83c001               addl rax,0x1
0x290ee9ff4edb   39b  43890423             movl [r11+r12*1],rax
0x290ee9ff4edf   39f  83c104               addl rcx,0x4
0x290ee9ff4ee2   3a2  83c204               addl rdx,0x4
0x290ee9ff4ee5   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x290ee9ff4ee9   3a9  4183c4ff             addl r12,0xff
0x290ee9ff4eed   3ad  0f858dfeffff         jnz 0x290ee9ff4d80  <+0x240>
0x290ee9ff4ef3   3b3  448bc3               movl r8,rbx
0x290ee9ff4ef6   3b6  448b75e8             movl r14,[rbp-0x18]
0x290ee9ff4efa   3ba  8b5d90               movl rbx,[rbp-0x70]
0x290ee9ff4efd   3bd  8b5588               movl rdx,[rbp-0x78]
0x290ee9ff4f00   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff4f04   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff4f0a   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff4f0e   3ce  8b4580               movl rax,[rbp-0x80]
0x290ee9ff4f11   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x290ee9ff4f18   3d8  4585ff               testl r15,r15
0x290ee9ff4f1b   3db  0f8508000000         jnz 0x290ee9ff4f29  <+0x3e9>
0x290ee9ff4f21   3e1  488bdf               REX.W movq rbx,rdi
0x290ee9ff4f24   3e4  e968020000           jmp 0x290ee9ff5191  <+0x651>
0x290ee9ff4f29   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x290ee9ff4f31   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x290ee9ff4f39   3f9  448bf3               movl r14,rbx
0x290ee9ff4f3c   3fc  41c1ee02             shrl r14, 2
0x290ee9ff4f40   400  4183c601             addl r14,0x1
0x290ee9ff4f44   404  418bd6               movl rdx,r14
0x290ee9ff4f47   407  83e207               andl rdx,0x7
0x290ee9ff4f4a   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x290ee9ff4f4e   40e  83fb1c               cmpl rbx,0x1c
0x290ee9ff4f51   411  0f82db000000         jc 0x290ee9ff5032  <+0x4f2>
0x290ee9ff4f57   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x290ee9ff4f5e   41e  418bd8               movl rbx,r8
0x290ee9ff4f61   421  488bcf               REX.W movq rcx,rdi
0x290ee9ff4f64   424  660f1f840000000000   nop
0x290ee9ff4f6d   42d  660f1f840000000000   nop
0x290ee9ff4f76   436  660f1f840000000000   nop
0x290ee9ff4f7f   43f  90                   nop
0x290ee9ff4f80   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff4f84   444  0f8612060000         jna 0x290ee9ff559c  <+0xa5c>
0x290ee9ff4f8a   44a  418b341b             movl rsi,[r11+rbx*1]
0x290ee9ff4f8e   44e  03ce                 addl rcx,rsi
0x290ee9ff4f90   450  41890c1b             movl [r11+rbx*1],rcx
0x290ee9ff4f94   454  8d7304               leal rsi,[rbx+0x4]
0x290ee9ff4f97   457  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4f9b   45b  4103c8               addl rcx,r8
0x290ee9ff4f9e   45e  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fa2   462  8d7308               leal rsi,[rbx+0x8]
0x290ee9ff4fa5   465  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fa9   469  4103c8               addl rcx,r8
0x290ee9ff4fac   46c  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fb0   470  8d730c               leal rsi,[rbx+0xc]
0x290ee9ff4fb3   473  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fb7   477  4103c8               addl rcx,r8
0x290ee9ff4fba   47a  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fbe   47e  8d7310               leal rsi,[rbx+0x10]
0x290ee9ff4fc1   481  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fc5   485  4103c8               addl rcx,r8
0x290ee9ff4fc8   488  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fcc   48c  8d7314               leal rsi,[rbx+0x14]
0x290ee9ff4fcf   48f  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fd3   493  4103c8               addl rcx,r8
0x290ee9ff4fd6   496  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fda   49a  8d7318               leal rsi,[rbx+0x18]
0x290ee9ff4fdd   49d  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fe1   4a1  4103c8               addl rcx,r8
0x290ee9ff4fe4   4a4  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4fe8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x290ee9ff4feb   4ab  458b0433             movl r8,[r11+rsi*1]
0x290ee9ff4fef   4af  4103c8               addl rcx,r8
0x290ee9ff4ff2   4b2  41890c33             movl [r11+rsi*1],rcx
0x290ee9ff4ff6   4b6  83c320               addl rbx,0x20
0x290ee9ff4ff9   4b9  4183c6f8             addl r14,0xf8
0x290ee9ff4ffd   4bd  7581                 jnz 0x290ee9ff4f80  <+0x440>
0x290ee9ff4fff   4bf  85d2                 testl rdx,rdx
0x290ee9ff5001   4c1  0f8510000000         jnz 0x290ee9ff5017  <+0x4d7>
0x290ee9ff5007   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff500b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x290ee9ff5012   4d2  e98b000000           jmp 0x290ee9ff50a2  <+0x562>
0x290ee9ff5017   4d7  448bf3               movl r14,rbx
0x290ee9ff501a   4da  8bd9                 movl rbx,rcx
0x290ee9ff501c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff5022   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff5026   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x290ee9ff502d   4ed  e906000000           jmp 0x290ee9ff5038  <+0x4f8>
0x290ee9ff5032   4f2  488bdf               REX.W movq rbx,rdi
0x290ee9ff5035   4f5  458bf0               movl r14,r8
0x290ee9ff5038   4f8  c1e202               shll rdx, 2
0x290ee9ff503b   4fb  0f1f440000           nop
0x290ee9ff5040   500  438b0c33             movl rcx,[r11+r14*1]
0x290ee9ff5044   504  03d9                 addl rbx,rcx
0x290ee9ff5046   506  43891c33             movl [r11+r14*1],rbx
0x290ee9ff504a   50a  4183c604             addl r14,0x4
0x290ee9ff504e   50e  83c2fc               addl rdx,0xfc
0x290ee9ff5051   511  0f844b000000         jz 0x290ee9ff50a2  <+0x562>
0x290ee9ff5057   517  438b0c33             movl rcx,[r11+r14*1]
0x290ee9ff505b   51b  03d9                 addl rbx,rcx
0x290ee9ff505d   51d  43891c33             movl [r11+r14*1],rbx
0x290ee9ff5061   521  4183c604             addl r14,0x4
0x290ee9ff5065   525  83c2fc               addl rdx,0xfc
0x290ee9ff5068   528  0f8434000000         jz 0x290ee9ff50a2  <+0x562>
0x290ee9ff506e   52e  438b0c33             movl rcx,[r11+r14*1]
0x290ee9ff5072   532  03d9                 addl rbx,rcx
0x290ee9ff5074   534  43891c33             movl [r11+r14*1],rbx
0x290ee9ff5078   538  4183c604             addl r14,0x4
0x290ee9ff507c   53c  83c2fc               addl rdx,0xfc
0x290ee9ff507f   53f  0f841d000000         jz 0x290ee9ff50a2  <+0x562>
0x290ee9ff5085   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff5089   549  0f864d050000         jna 0x290ee9ff55dc  <+0xa9c>
0x290ee9ff508f   54f  438b0c33             movl rcx,[r11+r14*1]
0x290ee9ff5093   553  03d9                 addl rbx,rcx
0x290ee9ff5095   555  43891c33             movl [r11+r14*1],rbx
0x290ee9ff5099   559  4183c604             addl r14,0x4
0x290ee9ff509d   55d  83c2fc               addl rdx,0xfc
0x290ee9ff50a0   560  759e                 jnz 0x290ee9ff5040  <+0x500>
0x290ee9ff50a2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x290ee9ff50ab   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x290ee9ff50b0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x290ee9ff50b5   575  0f834a000000         jnc 0x290ee9ff5105  <+0x5c5>
0x290ee9ff50bb   57b  8bd8                 movl rbx,rax
0x290ee9ff50bd   57d  8d430c               leal rax,[rbx+0xc]
0x290ee9ff50c0   580  418bcf               movl rcx,r15
0x290ee9ff50c3   583  488bd7               REX.W movq rdx,rdi
0x290ee9ff50c6   586  e8353cf2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff50cb   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x290ee9ff50cf   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x290ee9ff50d3   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x290ee9ff50d8   598  4c8bd3               REX.W movq r10,rbx
0x290ee9ff50db   59b  4489e3               movl rbx,r12
0x290ee9ff50de   59e  4d8be3               REX.W movq r12,r11
0x290ee9ff50e1   5a1  4d8bda               REX.W movq r11,r10
0x290ee9ff50e4   5a4  33ff                 xorl rdi,rdi
0x290ee9ff50e6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff50ea   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff50ee   5ae  8b4580               movl rax,[rbp-0x80]
0x290ee9ff50f1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x290ee9ff50f5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff50f9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x290ee9ff5100   5c0  e903000000           jmp 0x290ee9ff5108  <+0x5c8>
0x290ee9ff5105   5c5  488bdf               REX.W movq rbx,rdi
0x290ee9ff5108   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x290ee9ff510c   5cc  4d8bf7               REX.W movq r14,r15
0x290ee9ff510f   5cf  41c1e602             shll r14, 2
0x290ee9ff5113   5d3  0f8478000000         jz 0x290ee9ff5191  <+0x651>
0x290ee9ff5119   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x290ee9ff511e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x290ee9ff5122   5e2  4989e2               REX.W movq r10,rsp
0x290ee9ff5125   5e5  4883ec08             REX.W subq rsp,0x8
0x290ee9ff5129   5e9  4883e4f0             REX.W andq rsp,0xf0
0x290ee9ff512d   5ed  4c891424             REX.W movq [rsp],r10
0x290ee9ff5131   5f1  488bd7               REX.W movq rdx,rdi
0x290ee9ff5134   5f4  4c8bd7               REX.W movq r10,rdi
0x290ee9ff5137   5f7  488bfe               REX.W movq rdi,rsi
0x290ee9ff513a   5fa  498bf2               REX.W movq rsi,r10
0x290ee9ff513d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x290ee9ff5147   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x290ee9ff514e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x290ee9ff5155   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x290ee9ff515c   61c  ffd0                 call rax
0x290ee9ff515e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x290ee9ff5169   629  488b2424             REX.W movq rsp,[rsp]
0x290ee9ff516d   62d  85c0                 testl rax,rax
0x290ee9ff516f   62f  0f844c050000         jz 0x290ee9ff56c1  <+0xb81>
0x290ee9ff5175   635  8b5dc8               movl rbx,[rbp-0x38]
0x290ee9ff5178   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff517c   63c  33ff                 xorl rdi,rdi
0x290ee9ff517e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff5182   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff5186   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff518a   64a  8b4580               movl rax,[rbp-0x80]
0x290ee9ff518d   64d  448b7dd0             movl r15,[rbp-0x30]
0x290ee9ff5191   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x290ee9ff519a   65a  4103df               addl rbx,r15
0x290ee9ff519d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x290ee9ff51a2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x290ee9ff51a9   669  0f8508000000         jnz 0x290ee9ff51b7  <+0x677>
0x290ee9ff51af   66f  488bdf               REX.W movq rbx,rdi
0x290ee9ff51b2   672  e90b010000           jmp 0x290ee9ff52c2  <+0x782>
0x290ee9ff51b7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x290ee9ff51bc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff51c2   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x290ee9ff51c7   687  0f833b000000         jnc 0x290ee9ff5208  <+0x6c8>
0x290ee9ff51cd   68d  8bd8                 movl rbx,rax
0x290ee9ff51cf   68f  8d4318               leal rax,[rbx+0x18]
0x290ee9ff51d2   692  488bd7               REX.W movq rdx,rdi
0x290ee9ff51d5   695  e8263bf2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff51da   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x290ee9ff51de   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x290ee9ff51e2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x290ee9ff51e7   6a7  4c8bd3               REX.W movq r10,rbx
0x290ee9ff51ea   6aa  4489e3               movl rbx,r12
0x290ee9ff51ed   6ad  4d8be3               REX.W movq r12,r11
0x290ee9ff51f0   6b0  4d8bda               REX.W movq r11,r10
0x290ee9ff51f3   6b3  33ff                 xorl rdi,rdi
0x290ee9ff51f5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff51f9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff51ff   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff5203   6c3  e903000000           jmp 0x290ee9ff520b  <+0x6cb>
0x290ee9ff5208   6c8  488bdf               REX.W movq rbx,rdi
0x290ee9ff520b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x290ee9ff5210   6d0  418d149f             leal rdx,[r15+rbx*4]
0x290ee9ff5214   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x290ee9ff5218   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x290ee9ff521c   6dc  83f901               cmpl rcx,0x1
0x290ee9ff521f   6df  0f8492000000         jz 0x290ee9ff52b7  <+0x777>
0x290ee9ff5225   6e5  448bf1               movl r14,rcx
0x290ee9ff5228   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x290ee9ff5230   6f0  83c0fc               addl rax,0xfc
0x290ee9ff5233   6f3  0f846f000000         jz 0x290ee9ff52a8  <+0x768>
0x290ee9ff5239   6f9  4989e2               REX.W movq r10,rsp
0x290ee9ff523c   6fc  4883ec08             REX.W subq rsp,0x8
0x290ee9ff5240   700  4883e4f0             REX.W andq rsp,0xf0
0x290ee9ff5244   704  4c891424             REX.W movq [rsp],r10
0x290ee9ff5248   708  488bcf               REX.W movq rcx,rdi
0x290ee9ff524b   70b  4c8bd7               REX.W movq r10,rdi
0x290ee9ff524e   70e  488bfe               REX.W movq rdi,rsi
0x290ee9ff5251   711  498bf2               REX.W movq rsi,r10
0x290ee9ff5254   714  4c8bc0               REX.W movq r8,rax
0x290ee9ff5257   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x290ee9ff525e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x290ee9ff5265   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x290ee9ff526c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x290ee9ff5273   733  ffd0                 call rax
0x290ee9ff5275   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x290ee9ff5280   740  488b2424             REX.W movq rsp,[rsp]
0x290ee9ff5284   744  85c0                 testl rax,rax
0x290ee9ff5286   746  0f8430040000         jz 0x290ee9ff56bc  <+0xb7c>
0x290ee9ff528c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff5290   750  33ff                 xorl rdi,rdi
0x290ee9ff5292   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff5296   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff529a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x290ee9ff529d   75d  448b7dc8             movl r15,[rbp-0x38]
0x290ee9ff52a1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x290ee9ff52a8   768  4103de               addl rbx,r14
0x290ee9ff52ab   76b  448d73ff             leal r14,[rbx-0x1]
0x290ee9ff52af   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x290ee9ff52b4   774  418bde               movl rbx,r14
0x290ee9ff52b7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x290ee9ff52bf   77f  83c301               addl rbx,0x1
0x290ee9ff52c2   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x290ee9ff52c7   787  837de800             cmpl [rbp-0x18],0x0
0x290ee9ff52cb   78b  0f8505000000         jnz 0x290ee9ff52d6  <+0x796>
0x290ee9ff52d1   791  488be5               REX.W movq rsp,rbp
0x290ee9ff52d4   794  5d                   pop rbp
0x290ee9ff52d5   795  c3                   retl
0x290ee9ff52d6   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x290ee9ff52db   79b  4533f6               xorl r14,r14
0x290ee9ff52de   79e  4585ff               testl r15,r15
0x290ee9ff52e1   7a1  410f95c6             setnzl r14l
0x290ee9ff52e5   7a5  452bfe               subl r15,r14
0x290ee9ff52e8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x290ee9ff52ed   7ad  33c0                 xorl rax,rax
0x290ee9ff52ef   7af  4585f6               testl r14,r14
0x290ee9ff52f2   7b2  0f95c0               setnzl al
0x290ee9ff52f5   7b5  418bd6               movl rdx,r14
0x290ee9ff52f8   7b8  2bd0                 subl rdx,rax
0x290ee9ff52fa   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x290ee9ff52ff   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x290ee9ff5304   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x290ee9ff5309   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x290ee9ff5310   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x290ee9ff5314   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x290ee9ff5318   7d8  4c8be7               REX.W movq r12,rdi
0x290ee9ff531b   7db  448b4d88             movl r9,[rbp-0x78]
0x290ee9ff531f   7df  e924000000           jmp 0x290ee9ff5348  <+0x808>
0x290ee9ff5324   7e4  660f1f840000000000   nop
0x290ee9ff532d   7ed  660f1f840000000000   nop
0x290ee9ff5336   7f6  660f1f840000000000   nop
0x290ee9ff533f   7ff  90                   nop
0x290ee9ff5340   800  448b7d98             movl r15,[rbp-0x68]
0x290ee9ff5344   804  4c894590             REX.W movq [rbp-0x70],r8
0x290ee9ff5348   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff534c   80c  0f86cf020000         jna 0x290ee9ff5621  <+0xae1>
0x290ee9ff5352   812  448b7590             movl r14,[rbp-0x70]
0x290ee9ff5356   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x290ee9ff535c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x290ee9ff5360   820  7a06                 jpe 0x290ee9ff5368  <+0x828>
0x290ee9ff5362   822  0f8404000000         jz 0x290ee9ff536c  <+0x82c>
0x290ee9ff5368   828  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff536c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x290ee9ff5370   830  0f8704000000         ja 0x290ee9ff537a  <+0x83a>
0x290ee9ff5376   836  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff537a   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x290ee9ff537e   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x290ee9ff5384   844  c57b2cf4             vcvttsd2si r14,xmm4
0x290ee9ff5388   848  4585f6               testl r14,r14
0x290ee9ff538b   84b  0f8927000000         jns 0x290ee9ff53b8  <+0x878>
0x290ee9ff5391   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x290ee9ff5398   858  c441f96efa           vmovq xmm15,r10
0x290ee9ff539d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x290ee9ff53a1   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x290ee9ff53a6   866  4585f6               testl r14,r14
0x290ee9ff53a9   869  0f8809000000         js 0x290ee9ff53b8  <+0x878>
0x290ee9ff53af   86f  41ba00000080         movl r10,0x80000000
0x290ee9ff53b5   875  450bf2               orl r14,r10
0x290ee9ff53b8   878  458bd6               movl r10,r14
0x290ee9ff53bb   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x290ee9ff53c0   880  c5f92eec             vucomisd xmm5,xmm4
0x290ee9ff53c4   884  0f8aac020000         jpe 0x290ee9ff5676  <+0xb36>
0x290ee9ff53ca   88a  0f85a6020000         jnz 0x290ee9ff5676  <+0xb36>
0x290ee9ff53d0   890  458bc6               movl r8,r14
0x290ee9ff53d3   893  453bfe               cmpl r15,r14
0x290ee9ff53d6   896  450f42c7             cmovcl r8,r15
0x290ee9ff53da   89a  41ba0000804f         movl r10,0x4f800000
0x290ee9ff53e0   8a0  c4c1796eda           vmovd xmm3,r10
0x290ee9ff53e5   8a5  4c8bf7               REX.W movq r14,rdi
0x290ee9ff53e8   8a8  c5f82eda             vucomiss xmm3,xmm2
0x290ee9ff53ec   8ac  450f47f0             cmoval r14,r8
0x290ee9ff53f0   8b0  448b45a0             movl r8,[rbp-0x60]
0x290ee9ff53f4   8b4  450fafc6             imull r8,r14
0x290ee9ff53f8   8b8  458bf1               movl r14,r9
0x290ee9ff53fb   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x290ee9ff5401   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x290ee9ff5405   8c5  7a06                 jpe 0x290ee9ff540d  <+0x8cd>
0x290ee9ff5407   8c7  0f8404000000         jz 0x290ee9ff5411  <+0x8d1>
0x290ee9ff540d   8cd  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff5411   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x290ee9ff5415   8d5  0f8704000000         ja 0x290ee9ff541f  <+0x8df>
0x290ee9ff541b   8db  c5f928d1             vmovapd xmm2,xmm1
0x290ee9ff541f   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x290ee9ff5423   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x290ee9ff5429   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x290ee9ff542d   8ed  4585f6               testl r14,r14
0x290ee9ff5430   8f0  0f8927000000         jns 0x290ee9ff545d  <+0x91d>
0x290ee9ff5436   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x290ee9ff543d   8fd  c441f96efa           vmovq xmm15,r10
0x290ee9ff5442   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x290ee9ff5446   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x290ee9ff544b   90b  4585f6               testl r14,r14
0x290ee9ff544e   90e  0f8809000000         js 0x290ee9ff545d  <+0x91d>
0x290ee9ff5454   914  41ba00000080         movl r10,0x80000000
0x290ee9ff545a   91a  450bf2               orl r14,r10
0x290ee9ff545d   91d  458bd6               movl r10,r14
0x290ee9ff5460   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x290ee9ff5465   925  c5f92ef5             vucomisd xmm6,xmm5
0x290ee9ff5469   929  0f8a2a020000         jpe 0x290ee9ff5699  <+0xb59>
0x290ee9ff546f   92f  0f8524020000         jnz 0x290ee9ff5699  <+0xb59>
0x290ee9ff5475   935  458bfe               movl r15,r14
0x290ee9ff5478   938  413bd6               cmpl rdx,r14
0x290ee9ff547b   93b  440f42fa             cmovcl r15,rdx
0x290ee9ff547f   93f  4c8bf7               REX.W movq r14,rdi
0x290ee9ff5482   942  c5f82eda             vucomiss xmm3,xmm2
0x290ee9ff5486   946  450f47f7             cmoval r14,r15
0x290ee9ff548a   94a  478d3c06             leal r15,[r14+r8*1]
0x290ee9ff548e   94e  413bf7               cmpl rsi,r15
0x290ee9ff5491   951  0f8625000000         jna 0x290ee9ff54bc  <+0x97c>
0x290ee9ff5497   957  468d3cb9             leal r15,[rcx+r15*4]
0x290ee9ff549b   95b  478b343b             movl r14,[r11+r15*1]
0x290ee9ff549f   95f  413bde               cmpl rbx,r14
0x290ee9ff54a2   962  0f860c000000         jna 0x290ee9ff54b4  <+0x974>
0x290ee9ff54a8   968  468d34b0             leal r14,[rax+r14*4]
0x290ee9ff54ac   96c  47892433             movl [r11+r14*1],r12
0x290ee9ff54b0   970  478b343b             movl r14,[r11+r15*1]
0x290ee9ff54b4   974  4183c601             addl r14,0x1
0x290ee9ff54b8   978  4789343b             movl [r11+r15*1],r14
0x290ee9ff54bc   97c  4183c104             addl r9,0x4
0x290ee9ff54c0   980  448b4590             movl r8,[rbp-0x70]
0x290ee9ff54c4   984  4183c004             addl r8,0x4
0x290ee9ff54c8   988  4183c401             addl r12,0x1
0x290ee9ff54cc   98c  448b75e8             movl r14,[rbp-0x18]
0x290ee9ff54d0   990  4539e6               cmpl r14,r12
0x290ee9ff54d3   993  0f8567feffff         jnz 0x290ee9ff5340  <+0x800>
0x290ee9ff54d9   999  e9f3fdffff           jmp 0x290ee9ff52d1  <+0x791>
0x290ee9ff54de   99e  e8ed3ff2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff54e3   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff54e7   9a7  8b5d90               movl rbx,[rbp-0x70]
0x290ee9ff54ea   9aa  8b5588               movl rdx,[rbp-0x78]
0x290ee9ff54ed   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x290ee9ff54f3   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff54f7   9b7  8b4580               movl rax,[rbp-0x80]
0x290ee9ff54fa   9ba  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff54fe   9be  e974f6ffff           jmp 0x290ee9ff4b77  <+0x37>
0x290ee9ff5503   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x290ee9ff550a   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x290ee9ff550e   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x290ee9ff5512   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x290ee9ff5516   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x290ee9ff551a   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x290ee9ff551f   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x290ee9ff5523   9e3  e8a83ff2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff5528   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff552c   9ec  33ff                 xorl rdi,rdi
0x290ee9ff552e   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff5532   9f2  448b7dd0             movl r15,[rbp-0x30]
0x290ee9ff5536   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x290ee9ff553c   9fc  8b55b8               movl rdx,[rbp-0x48]
0x290ee9ff553f   9ff  8b4db0               movl rcx,[rbp-0x50]
0x290ee9ff5542   a02  448b4da8             movl r9,[rbp-0x58]
0x290ee9ff5546   a06  448b45a0             movl r8,[rbp-0x60]
0x290ee9ff554a   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x290ee9ff554f   a0f  448b75c0             movl r14,[rbp-0x40]
0x290ee9ff5553   a13  e936f8ffff           jmp 0x290ee9ff4d8e  <+0x24e>
0x290ee9ff5558   a18  c5f92edb             vucomisd xmm3,xmm3
0x290ee9ff555c   a1c  0f8b08000000         jpo 0x290ee9ff556a  <+0xa2a>
0x290ee9ff5562   a22  488bf7               REX.W movq rsi,rdi
0x290ee9ff5565   a25  e9a1f8ffff           jmp 0x290ee9ff4e0b  <+0x2cb>
0x290ee9ff556a   a2a  c5f82eca             vucomiss xmm1,xmm2
0x290ee9ff556e   a2e  77f2                 ja 0x290ee9ff5562  <+0xa22>
0x290ee9ff5570   a30  beffffffff           movl rsi,0xffffffff
0x290ee9ff5575   a35  e991f8ffff           jmp 0x290ee9ff4e0b  <+0x2cb>
0x290ee9ff557a   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x290ee9ff557e   a3e  0f8b08000000         jpo 0x290ee9ff558c  <+0xa4c>
0x290ee9ff5584   a44  488bc7               REX.W movq rax,rdi
0x290ee9ff5587   a47  e91cf9ffff           jmp 0x290ee9ff4ea8  <+0x368>
0x290ee9ff558c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x290ee9ff5590   a50  77f2                 ja 0x290ee9ff5584  <+0xa44>
0x290ee9ff5592   a52  b8ffffffff           movl rax,0xffffffff
0x290ee9ff5597   a57  e90cf9ffff           jmp 0x290ee9ff4ea8  <+0x368>
0x290ee9ff559c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x290ee9ff55a0   a60  4c897598             REX.W movq [rbp-0x68],r14
0x290ee9ff55a4   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x290ee9ff55a8   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x290ee9ff55ac   a6c  e81f3ff2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff55b1   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff55b5   a75  33ff                 xorl rdi,rdi
0x290ee9ff55b7   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff55bb   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff55bf   a7f  8b4580               movl rax,[rbp-0x80]
0x290ee9ff55c2   a82  448b7dd0             movl r15,[rbp-0x30]
0x290ee9ff55c6   a86  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff55ca   a8a  8b55c8               movl rdx,[rbp-0x38]
0x290ee9ff55cd   a8d  448b7598             movl r14,[rbp-0x68]
0x290ee9ff55d1   a91  8b5da8               movl rbx,[rbp-0x58]
0x290ee9ff55d4   a94  8b4db0               movl rcx,[rbp-0x50]
0x290ee9ff55d7   a97  e9aef9ffff           jmp 0x290ee9ff4f8a  <+0x44a>
0x290ee9ff55dc   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x290ee9ff55e0   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x290ee9ff55e4   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x290ee9ff55e8   aa8  e8e33ef2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff55ed   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff55f1   ab1  33ff                 xorl rdi,rdi
0x290ee9ff55f3   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff55f7   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x290ee9ff55fb   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff55ff   abf  8b4580               movl rax,[rbp-0x80]
0x290ee9ff5602   ac2  448b7dd0             movl r15,[rbp-0x30]
0x290ee9ff5606   ac6  448b4dc0             movl r9,[rbp-0x40]
0x290ee9ff560a   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x290ee9ff5611   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x290ee9ff5615   ad5  448b75b8             movl r14,[rbp-0x48]
0x290ee9ff5619   ad9  8b5da8               movl rbx,[rbp-0x58]
0x290ee9ff561c   adc  e96efaffff           jmp 0x290ee9ff508f  <+0x54f>
0x290ee9ff5621   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x290ee9ff5625   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x290ee9ff5629   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x290ee9ff562d   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x290ee9ff5631   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x290ee9ff5635   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x290ee9ff5639   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x290ee9ff563d   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x290ee9ff5642   b02  e8893ef2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff5647   b07  448b65e0             movl r12,[rbp-0x20]
0x290ee9ff564b   b0b  448b4d88             movl r9,[rbp-0x78]
0x290ee9ff564f   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x290ee9ff5653   b13  8b45d0               movl rax,[rbp-0x30]
0x290ee9ff5656   b16  8b5dc8               movl rbx,[rbp-0x38]
0x290ee9ff5659   b19  8b4dc0               movl rcx,[rbp-0x40]
0x290ee9ff565c   b1c  8b75b8               movl rsi,[rbp-0x48]
0x290ee9ff565f   b1f  33ff                 xorl rdi,rdi
0x290ee9ff5661   b21  8b55b0               movl rdx,[rbp-0x50]
0x290ee9ff5664   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x290ee9ff5668   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x290ee9ff566d   b2d  448b7d98             movl r15,[rbp-0x68]
0x290ee9ff5671   b31  e9dcfcffff           jmp 0x290ee9ff5352  <+0x812>
0x290ee9ff5676   b36  c5f92edb             vucomisd xmm3,xmm3
0x290ee9ff567a   b3a  0f8b08000000         jpo 0x290ee9ff5688  <+0xb48>
0x290ee9ff5680   b40  4c8bf7               REX.W movq r14,rdi
0x290ee9ff5683   b43  e948fdffff           jmp 0x290ee9ff53d0  <+0x890>
0x290ee9ff5688   b48  c5f82eca             vucomiss xmm1,xmm2
0x290ee9ff568c   b4c  77f2                 ja 0x290ee9ff5680  <+0xb40>
0x290ee9ff568e   b4e  41beffffffff         movl r14,0xffffffff
0x290ee9ff5694   b54  e937fdffff           jmp 0x290ee9ff53d0  <+0x890>
0x290ee9ff5699   b59  c5f92ee4             vucomisd xmm4,xmm4
0x290ee9ff569d   b5d  0f8b08000000         jpo 0x290ee9ff56ab  <+0xb6b>
0x290ee9ff56a3   b63  4c8bf7               REX.W movq r14,rdi
0x290ee9ff56a6   b66  e9cafdffff           jmp 0x290ee9ff5475  <+0x935>
0x290ee9ff56ab   b6b  c5f82eca             vucomiss xmm1,xmm2
0x290ee9ff56af   b6f  77f2                 ja 0x290ee9ff56a3  <+0xb63>
0x290ee9ff56b1   b71  41beffffffff         movl r14,0xffffffff
0x290ee9ff56b7   b77  e9b9fdffff           jmp 0x290ee9ff5475  <+0x935>
0x290ee9ff56bc   b7c  e84f3bf2ff           call 0x290ee9f19210  (jump table)
0x290ee9ff56c1   b81  e84a3bf2ff           call 0x290ee9f19210  (jump table)
0x290ee9ff56c6   b86  e8453bf2ff           call 0x290ee9f19210  (jump table)
0x290ee9ff56cb   b8b  90                   nop

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
0x290ee9ff4bce     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x290ee9ff4bca  internal wasm call
0x290ee9ff4c55  external reference (0x193f2f0)
0x290ee9ff50c7  internal wasm call
0x290ee9ff513f  external reference (0x193f270)
0x290ee9ff51d6  internal wasm call
0x290ee9ff54df  wasm stub call  (0x290ee9f194d0)
0x290ee9ff5524  wasm stub call  (0x290ee9f194d0)
0x290ee9ff55ad  wasm stub call  (0x290ee9f194d0)
0x290ee9ff55e9  wasm stub call  (0x290ee9f194d0)
0x290ee9ff5643  wasm stub call  (0x290ee9f194d0)
0x290ee9ff56bd  wasm stub call  (0x290ee9f19210)
0x290ee9ff56c2  wasm stub call  (0x290ee9f19210)
0x290ee9ff56c7  wasm stub call  (0x290ee9f19210)
