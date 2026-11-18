name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2984 + 24 padding)
Instructions (size = 2968)
0x19b556c47a40     0  55                   push rbp
0x19b556c47a41     1  4889e5               REX.W movq rbp,rsp
0x19b556c47a44     4  6a08                 push 0x8
0x19b556c47a46     6  56                   push rsi
0x19b556c47a47     7  4881ec80000000       REX.W subq rsp,0x80
0x19b556c47a4e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x19b556c47a52    12  48894580             REX.W movq [rbp-0x80],rax
0x19b556c47a56    16  48895588             REX.W movq [rbp-0x78],rdx
0x19b556c47a5a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x19b556c47a61    21  48895d90             REX.W movq [rbp-0x70],rbx
0x19b556c47a65    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x19b556c47a69    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x19b556c47a6d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c47a71    31  0f8673090000         jna 0x19b556c483ea  <+0x9aa>
0x19b556c47a77    37  448be0               movl r12,rax
0x19b556c47a7a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x19b556c47a83    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x19b556c47a88    48  478b742328           movl r14,[r11+r12*1+0x28]
0x19b556c47a8d    4d  450faff7             imull r14,r15
0x19b556c47a91    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x19b556c47a95    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x19b556c47a99    59  4d8bfe               REX.W movq r15,r14
0x19b556c47a9c    5c  4183c701             addl r15,0x1
0x19b556c47aa0    60  0f850c000000         jnz 0x19b556c47ab2  <+0x72>
0x19b556c47aa6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x19b556c47aaa    6a  4533ff               xorl r15,r15
0x19b556c47aad    6d  e928010000           jmp 0x19b556c47bda  <+0x19a>
0x19b556c47ab2    72  438b3c23             movl rdi,[r11+r12*1]
0x19b556c47ab6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x19b556c47aba    7a  47393c23             cmpl [r11+r12*1],r15
0x19b556c47abe    7e  0f8341000000         jnc 0x19b556c47b05  <+0xc5>
0x19b556c47ac4    84  498bcf               REX.W movq rcx,r15
0x19b556c47ac7    87  33d2                 xorl rdx,rdx
0x19b556c47ac9    89  e83242f2ff           call 0x19b556b6bd00  (jump table)
0x19b556c47ace    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x19b556c47ad2    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x19b556c47ad6    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x19b556c47adb    9b  4489e7               movl rdi,r12
0x19b556c47ade    9e  4d8be3               REX.W movq r12,r11
0x19b556c47ae1    a1  4c8bdb               REX.W movq r11,rbx
0x19b556c47ae4    a4  8b5588               movl rdx,[rbp-0x78]
0x19b556c47ae7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c47aed    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47af1    b1  8b4580               movl rax,[rbp-0x80]
0x19b556c47af4    b4  448b4dc0             movl r9,[rbp-0x40]
0x19b556c47af8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x19b556c47afc    bc  448b75b0             movl r14,[rbp-0x50]
0x19b556c47b00    c0  e902000000           jmp 0x19b556c47b07  <+0xc7>
0x19b556c47b05    c5  33ff                 xorl rdi,rdi
0x19b556c47b07    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x19b556c47b0c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x19b556c47b10    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x19b556c47b14    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x19b556c47b18    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x19b556c47b1c    dc  4585f6               testl r14,r14
0x19b556c47b1f    df  0f84a4000000         jz 0x19b556c47bc9  <+0x189>
0x19b556c47b25    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x19b556c47b2d    ed  83c3fc               addl rbx,0xfc
0x19b556c47b30    f0  0f8480000000         jz 0x19b556c47bb6  <+0x176>
0x19b556c47b36    f6  4989e2               REX.W movq r10,rsp
0x19b556c47b39    f9  4883ec08             REX.W subq rsp,0x8
0x19b556c47b3d    fd  4883e4f0             REX.W andq rsp,0xf0
0x19b556c47b41   101  4c891424             REX.W movq [rsp],r10
0x19b556c47b45   105  488bfe               REX.W movq rdi,rsi
0x19b556c47b48   108  4c8bc3               REX.W movq r8,rbx
0x19b556c47b4b   10b  8b55e8               movl rdx,[rbp-0x18]
0x19b556c47b4e   10e  33c9                 xorl rcx,rcx
0x19b556c47b50   110  488bf1               REX.W movq rsi,rcx
0x19b556c47b53   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x19b556c47b5d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x19b556c47b64   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x19b556c47b6b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x19b556c47b72   132  ffd0                 call rax
0x19b556c47b74   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x19b556c47b7f   13f  488b2424             REX.W movq rsp,[rsp]
0x19b556c47b83   143  85c0                 testl rax,rax
0x19b556c47b85   145  0f84470a0000         jz 0x19b556c485d2  <+0xb92>
0x19b556c47b8b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c47b8f   14f  8b5588               movl rdx,[rbp-0x78]
0x19b556c47b92   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c47b96   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c47b9c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47ba0   160  8b4580               movl rax,[rbp-0x80]
0x19b556c47ba3   163  448b4dc0             movl r9,[rbp-0x40]
0x19b556c47ba7   167  8b7db8               movl rdi,[rbp-0x48]
0x19b556c47baa   16a  448b45c8             movl r8,[rbp-0x38]
0x19b556c47bae   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x19b556c47bb2   172  448b75b0             movl r14,[rbp-0x50]
0x19b556c47bb6   176  8bdf                 movl rbx,rdi
0x19b556c47bb8   178  4403f3               addl r14,rbx
0x19b556c47bbb   17b  4103df               addl rbx,r15
0x19b556c47bbe   17e  458bf8               movl r15,r8
0x19b556c47bc1   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x19b556c47bc6   186  418bfe               movl rdi,r14
0x19b556c47bc9   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x19b556c47bd1   191  8d5f01               leal rbx,[rdi+0x1]
0x19b556c47bd4   194  448bfb               movl r15,rbx
0x19b556c47bd7   197  8b5d90               movl rbx,[rbp-0x70]
0x19b556c47bda   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x19b556c47bdf   19f  458bc1               movl r8,r9
0x19b556c47be2   1a2  448bf1               movl r14,rcx
0x19b556c47be5   1a5  443bc1               cmpl r8,rcx
0x19b556c47be8   1a8  450f42f0             cmovcl r14,r8
0x19b556c47bec   1ac  33ff                 xorl rdi,rdi
0x19b556c47bee   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x19b556c47bf2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x19b556c47bf6   1b6  4585f6               testl r14,r14
0x19b556c47bf9   1b9  0f850e000000         jnz 0x19b556c47c0d  <+0x1cd>
0x19b556c47bff   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x19b556c47c04   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c47c08   1c8  e910020000           jmp 0x19b556c47e1d  <+0x3dd>
0x19b556c47c0d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x19b556c47c12   1d2  4533c9               xorl r9,r9
0x19b556c47c15   1d5  4585c0               testl r8,r8
0x19b556c47c18   1d8  410f95c1             setnzl r9l
0x19b556c47c1c   1dc  452bc1               subl r8,r9
0x19b556c47c1f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x19b556c47c24   1e4  33db                 xorl rbx,rbx
0x19b556c47c26   1e6  4585c9               testl r9,r9
0x19b556c47c29   1e9  0f95c3               setnzl bl
0x19b556c47c2c   1ec  458bf1               movl r14,r9
0x19b556c47c2f   1ef  442bf3               subl r14,rbx
0x19b556c47c32   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x19b556c47c37   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x19b556c47c3e   1fe  448b55e8             movl r10,[rbp-0x18]
0x19b556c47c42   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x19b556c47c46   206  8bca                 movl rcx,rdx
0x19b556c47c48   208  8b5590               movl rdx,[rbp-0x70]
0x19b556c47c4b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c47c4f   20f  e930000000           jmp 0x19b556c47c84  <+0x244>
0x19b556c47c54   214  660f1f840000000000   nop
0x19b556c47c5d   21d  660f1f840000000000   nop
0x19b556c47c66   226  660f1f840000000000   nop
0x19b556c47c6f   22f  660f1f840000000000   nop
0x19b556c47c78   238  0f1f840000000000     nop
0x19b556c47c80   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x19b556c47c84   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c47c88   248  0f8681070000         jna 0x19b556c4840f  <+0x9cf>
0x19b556c47c8e   24e  8bf1                 movl rsi,rcx
0x19b556c47c90   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x19b556c47c96   256  c5f82ed2             vucomiss xmm2,xmm2
0x19b556c47c9a   25a  7a06                 jpe 0x19b556c47ca2  <+0x262>
0x19b556c47c9c   25c  0f8404000000         jz 0x19b556c47ca6  <+0x266>
0x19b556c47ca2   262  c5f928d1             vmovapd xmm2,xmm1
0x19b556c47ca6   266  c5f82ed1             vucomiss xmm2,xmm1
0x19b556c47caa   26a  0f8704000000         ja 0x19b556c47cb4  <+0x274>
0x19b556c47cb0   270  c5f928d1             vmovapd xmm2,xmm1
0x19b556c47cb4   274  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x19b556c47cba   27a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x19b556c47cbe   27e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x19b556c47cc4   284  c5fb2cf4             vcvttsd2si rsi,xmm4
0x19b556c47cc8   288  85f6                 testl rsi,rsi
0x19b556c47cca   28a  0f8929000000         jns 0x19b556c47cf9  <+0x2b9>
0x19b556c47cd0   290  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x19b556c47cda   29a  c441f96efa           vmovq xmm15,r10
0x19b556c47cdf   29f  c50358fc             vaddsd xmm15,xmm15,xmm4
0x19b556c47ce3   2a3  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x19b556c47ce8   2a8  85f6                 testl rsi,rsi
0x19b556c47cea   2aa  0f8809000000         js 0x19b556c47cf9  <+0x2b9>
0x19b556c47cf0   2b0  41ba00000080         movl r10,0x80000000
0x19b556c47cf6   2b6  410bf2               orl rsi,r10
0x19b556c47cf9   2b9  448bd6               movl r10,rsi
0x19b556c47cfc   2bc  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x19b556c47d01   2c1  c5f92eec             vucomisd xmm5,xmm4
0x19b556c47d05   2c5  0f8a59070000         jpe 0x19b556c48464  <+0xa24>
0x19b556c47d0b   2cb  0f8553070000         jnz 0x19b556c48464  <+0xa24>
0x19b556c47d11   2d1  8bc6                 movl rax,rsi
0x19b556c47d13   2d3  443bf6               cmpl r14,rsi
0x19b556c47d16   2d6  410f42c6             cmovcl rax,r14
0x19b556c47d1a   2da  83c001               addl rax,0x1
0x19b556c47d1d   2dd  41ba0000804f         movl r10,0x4f800000
0x19b556c47d23   2e3  c4c1796eda           vmovd xmm3,r10
0x19b556c47d28   2e8  be01000000           movl rsi,0x1
0x19b556c47d2d   2ed  c5f82eda             vucomiss xmm3,xmm2
0x19b556c47d31   2f1  0f47f0               cmoval rsi,rax
0x19b556c47d34   2f4  8bc2                 movl rax,rdx
0x19b556c47d36   2f6  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x19b556c47d3c   2fc  c5f82ed2             vucomiss xmm2,xmm2
0x19b556c47d40   300  7a06                 jpe 0x19b556c47d48  <+0x308>
0x19b556c47d42   302  0f8404000000         jz 0x19b556c47d4c  <+0x30c>
0x19b556c47d48   308  c5f928d1             vmovapd xmm2,xmm1
0x19b556c47d4c   30c  c5f82ed1             vucomiss xmm2,xmm1
0x19b556c47d50   310  0f8704000000         ja 0x19b556c47d5a  <+0x31a>
0x19b556c47d56   316  c5f928d1             vmovapd xmm2,xmm1
0x19b556c47d5a   31a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x19b556c47d60   320  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x19b556c47d64   324  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x19b556c47d6a   32a  c5fb2cc5             vcvttsd2si rax,xmm5
0x19b556c47d6e   32e  85c0                 testl rax,rax
0x19b556c47d70   330  0f8926000000         jns 0x19b556c47d9c  <+0x35c>
0x19b556c47d76   336  4c8b1555ffffff       REX.W movq r10,[rip+0xffffff55]
0x19b556c47d7d   33d  c441f96efa           vmovq xmm15,r10
0x19b556c47d82   342  c50358fd             vaddsd xmm15,xmm15,xmm5
0x19b556c47d86   346  c4c17b2cc7           vcvttsd2si rax,xmm15
0x19b556c47d8b   34b  85c0                 testl rax,rax
0x19b556c47d8d   34d  0f8809000000         js 0x19b556c47d9c  <+0x35c>
0x19b556c47d93   353  41ba00000080         movl r10,0x80000000
0x19b556c47d99   359  410bc2               orl rax,r10
0x19b556c47d9c   35c  448bd0               movl r10,rax
0x19b556c47d9f   35f  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x19b556c47da4   364  c5f92ef5             vucomisd xmm6,xmm5
0x19b556c47da8   368  0f8ad8060000         jpe 0x19b556c48486  <+0xa46>
0x19b556c47dae   36e  0f85d2060000         jnz 0x19b556c48486  <+0xa46>
0x19b556c47db4   374  448be0               movl r12,rax
0x19b556c47db7   377  443bc0               cmpl r8,rax
0x19b556c47dba   37a  450f42e0             cmovcl r12,r8
0x19b556c47dbe   37e  488bc7               REX.W movq rax,rdi
0x19b556c47dc1   381  c5f82eda             vucomiss xmm3,xmm2
0x19b556c47dc5   385  410f47c4             cmoval rax,r12
0x19b556c47dc9   389  458be1               movl r12,r9
0x19b556c47dcc   38c  440fafe0             imull r12,rax
0x19b556c47dd0   390  4403e6               addl r12,rsi
0x19b556c47dd3   393  4539e7               cmpl r15,r12
0x19b556c47dd6   396  0f860f000000         jna 0x19b556c47deb  <+0x3ab>
0x19b556c47ddc   39c  468d24a3             leal r12,[rbx+r12*4]
0x19b556c47de0   3a0  438b0423             movl rax,[r11+r12*1]
0x19b556c47de4   3a4  83c001               addl rax,0x1
0x19b556c47de7   3a7  43890423             movl [r11+r12*1],rax
0x19b556c47deb   3ab  83c104               addl rcx,0x4
0x19b556c47dee   3ae  83c204               addl rdx,0x4
0x19b556c47df1   3b1  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x19b556c47df5   3b5  4183c4ff             addl r12,0xff
0x19b556c47df9   3b9  0f8581feffff         jnz 0x19b556c47c80  <+0x240>
0x19b556c47dff   3bf  448bc3               movl r8,rbx
0x19b556c47e02   3c2  448b75e8             movl r14,[rbp-0x18]
0x19b556c47e06   3c6  8b5d90               movl rbx,[rbp-0x70]
0x19b556c47e09   3c9  8b5588               movl rdx,[rbp-0x78]
0x19b556c47e0c   3cc  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c47e10   3d0  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c47e16   3d6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47e1a   3da  8b4580               movl rax,[rbp-0x80]
0x19b556c47e1d   3dd  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x19b556c47e24   3e4  4585ff               testl r15,r15
0x19b556c47e27   3e7  0f8508000000         jnz 0x19b556c47e35  <+0x3f5>
0x19b556c47e2d   3ed  488bdf               REX.W movq rbx,rdi
0x19b556c47e30   3f0  e95c020000           jmp 0x19b556c48091  <+0x651>
0x19b556c47e35   3f5  468d0cbd00000000     leal r9,[r15*4+0x0]
0x19b556c47e3d   3fd  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x19b556c47e45   405  448bf3               movl r14,rbx
0x19b556c47e48   408  41c1ee02             shrl r14, 2
0x19b556c47e4c   40c  4183c601             addl r14,0x1
0x19b556c47e50   410  418bd6               movl rdx,r14
0x19b556c47e53   413  83e207               andl rdx,0x7
0x19b556c47e56   416  4c894dc0             REX.W movq [rbp-0x40],r9
0x19b556c47e5a   41a  83fb1c               cmpl rbx,0x1c
0x19b556c47e5d   41d  0f82cf000000         jc 0x19b556c47f32  <+0x4f2>
0x19b556c47e63   423  4181e6f8ffff7f       andl r14,0x7ffffff8
0x19b556c47e6a   42a  418bd8               movl rbx,r8
0x19b556c47e6d   42d  488bcf               REX.W movq rcx,rdi
0x19b556c47e70   430  660f1f840000000000   nop
0x19b556c47e79   439  0f1f8000000000       nop
0x19b556c47e80   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c47e84   444  0f861e060000         jna 0x19b556c484a8  <+0xa68>
0x19b556c47e8a   44a  418b341b             movl rsi,[r11+rbx*1]
0x19b556c47e8e   44e  03ce                 addl rcx,rsi
0x19b556c47e90   450  41890c1b             movl [r11+rbx*1],rcx
0x19b556c47e94   454  8d7304               leal rsi,[rbx+0x4]
0x19b556c47e97   457  458b0433             movl r8,[r11+rsi*1]
0x19b556c47e9b   45b  4103c8               addl rcx,r8
0x19b556c47e9e   45e  41890c33             movl [r11+rsi*1],rcx
0x19b556c47ea2   462  8d7308               leal rsi,[rbx+0x8]
0x19b556c47ea5   465  458b0433             movl r8,[r11+rsi*1]
0x19b556c47ea9   469  4103c8               addl rcx,r8
0x19b556c47eac   46c  41890c33             movl [r11+rsi*1],rcx
0x19b556c47eb0   470  8d730c               leal rsi,[rbx+0xc]
0x19b556c47eb3   473  458b0433             movl r8,[r11+rsi*1]
0x19b556c47eb7   477  4103c8               addl rcx,r8
0x19b556c47eba   47a  41890c33             movl [r11+rsi*1],rcx
0x19b556c47ebe   47e  8d7310               leal rsi,[rbx+0x10]
0x19b556c47ec1   481  458b0433             movl r8,[r11+rsi*1]
0x19b556c47ec5   485  4103c8               addl rcx,r8
0x19b556c47ec8   488  41890c33             movl [r11+rsi*1],rcx
0x19b556c47ecc   48c  8d7314               leal rsi,[rbx+0x14]
0x19b556c47ecf   48f  458b0433             movl r8,[r11+rsi*1]
0x19b556c47ed3   493  4103c8               addl rcx,r8
0x19b556c47ed6   496  41890c33             movl [r11+rsi*1],rcx
0x19b556c47eda   49a  8d7318               leal rsi,[rbx+0x18]
0x19b556c47edd   49d  458b0433             movl r8,[r11+rsi*1]
0x19b556c47ee1   4a1  4103c8               addl rcx,r8
0x19b556c47ee4   4a4  41890c33             movl [r11+rsi*1],rcx
0x19b556c47ee8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x19b556c47eeb   4ab  458b0433             movl r8,[r11+rsi*1]
0x19b556c47eef   4af  4103c8               addl rcx,r8
0x19b556c47ef2   4b2  41890c33             movl [r11+rsi*1],rcx
0x19b556c47ef6   4b6  83c320               addl rbx,0x20
0x19b556c47ef9   4b9  4183c6f8             addl r14,0xf8
0x19b556c47efd   4bd  7581                 jnz 0x19b556c47e80  <+0x440>
0x19b556c47eff   4bf  85d2                 testl rdx,rdx
0x19b556c47f01   4c1  0f8510000000         jnz 0x19b556c47f17  <+0x4d7>
0x19b556c47f07   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47f0b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x19b556c47f12   4d2  e98b000000           jmp 0x19b556c47fa2  <+0x562>
0x19b556c47f17   4d7  448bf3               movl r14,rbx
0x19b556c47f1a   4da  8bd9                 movl rbx,rcx
0x19b556c47f1c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c47f22   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47f26   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x19b556c47f2d   4ed  e906000000           jmp 0x19b556c47f38  <+0x4f8>
0x19b556c47f32   4f2  488bdf               REX.W movq rbx,rdi
0x19b556c47f35   4f5  458bf0               movl r14,r8
0x19b556c47f38   4f8  c1e202               shll rdx, 2
0x19b556c47f3b   4fb  0f1f440000           nop
0x19b556c47f40   500  438b0c33             movl rcx,[r11+r14*1]
0x19b556c47f44   504  03d9                 addl rbx,rcx
0x19b556c47f46   506  43891c33             movl [r11+r14*1],rbx
0x19b556c47f4a   50a  4183c604             addl r14,0x4
0x19b556c47f4e   50e  83c2fc               addl rdx,0xfc
0x19b556c47f51   511  0f844b000000         jz 0x19b556c47fa2  <+0x562>
0x19b556c47f57   517  438b0c33             movl rcx,[r11+r14*1]
0x19b556c47f5b   51b  03d9                 addl rbx,rcx
0x19b556c47f5d   51d  43891c33             movl [r11+r14*1],rbx
0x19b556c47f61   521  4183c604             addl r14,0x4
0x19b556c47f65   525  83c2fc               addl rdx,0xfc
0x19b556c47f68   528  0f8434000000         jz 0x19b556c47fa2  <+0x562>
0x19b556c47f6e   52e  438b0c33             movl rcx,[r11+r14*1]
0x19b556c47f72   532  03d9                 addl rbx,rcx
0x19b556c47f74   534  43891c33             movl [r11+r14*1],rbx
0x19b556c47f78   538  4183c604             addl r14,0x4
0x19b556c47f7c   53c  83c2fc               addl rdx,0xfc
0x19b556c47f7f   53f  0f841d000000         jz 0x19b556c47fa2  <+0x562>
0x19b556c47f85   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c47f89   549  0f8659050000         jna 0x19b556c484e8  <+0xaa8>
0x19b556c47f8f   54f  438b0c33             movl rcx,[r11+r14*1]
0x19b556c47f93   553  03d9                 addl rbx,rcx
0x19b556c47f95   555  43891c33             movl [r11+r14*1],rbx
0x19b556c47f99   559  4183c604             addl r14,0x4
0x19b556c47f9d   55d  83c2fc               addl rdx,0xfc
0x19b556c47fa0   560  759e                 jnz 0x19b556c47f40  <+0x500>
0x19b556c47fa2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x19b556c47fab   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x19b556c47fb0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x19b556c47fb5   575  0f834a000000         jnc 0x19b556c48005  <+0x5c5>
0x19b556c47fbb   57b  8bd8                 movl rbx,rax
0x19b556c47fbd   57d  8d430c               leal rax,[rbx+0xc]
0x19b556c47fc0   580  418bcf               movl rcx,r15
0x19b556c47fc3   583  488bd7               REX.W movq rdx,rdi
0x19b556c47fc6   586  e8353df2ff           call 0x19b556b6bd00  (jump table)
0x19b556c47fcb   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x19b556c47fcf   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x19b556c47fd3   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x19b556c47fd8   598  4c8bd3               REX.W movq r10,rbx
0x19b556c47fdb   59b  4489e3               movl rbx,r12
0x19b556c47fde   59e  4d8be3               REX.W movq r12,r11
0x19b556c47fe1   5a1  4d8bda               REX.W movq r11,r10
0x19b556c47fe4   5a4  33ff                 xorl rdi,rdi
0x19b556c47fe6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c47fea   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47fee   5ae  8b4580               movl rax,[rbp-0x80]
0x19b556c47ff1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x19b556c47ff5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x19b556c47ff9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x19b556c48000   5c0  e903000000           jmp 0x19b556c48008  <+0x5c8>
0x19b556c48005   5c5  488bdf               REX.W movq rbx,rdi
0x19b556c48008   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x19b556c4800c   5cc  4d8bf7               REX.W movq r14,r15
0x19b556c4800f   5cf  41c1e602             shll r14, 2
0x19b556c48013   5d3  0f8478000000         jz 0x19b556c48091  <+0x651>
0x19b556c48019   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x19b556c4801e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x19b556c48022   5e2  4989e2               REX.W movq r10,rsp
0x19b556c48025   5e5  4883ec08             REX.W subq rsp,0x8
0x19b556c48029   5e9  4883e4f0             REX.W andq rsp,0xf0
0x19b556c4802d   5ed  4c891424             REX.W movq [rsp],r10
0x19b556c48031   5f1  488bd7               REX.W movq rdx,rdi
0x19b556c48034   5f4  4c8bd7               REX.W movq r10,rdi
0x19b556c48037   5f7  488bfe               REX.W movq rdi,rsi
0x19b556c4803a   5fa  498bf2               REX.W movq rsi,r10
0x19b556c4803d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x19b556c48047   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x19b556c4804e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x19b556c48055   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x19b556c4805c   61c  ffd0                 call rax
0x19b556c4805e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x19b556c48069   629  488b2424             REX.W movq rsp,[rsp]
0x19b556c4806d   62d  85c0                 testl rax,rax
0x19b556c4806f   62f  0f8458050000         jz 0x19b556c485cd  <+0xb8d>
0x19b556c48075   635  8b5dc8               movl rbx,[rbp-0x38]
0x19b556c48078   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c4807c   63c  33ff                 xorl rdi,rdi
0x19b556c4807e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c48082   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c48086   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c4808a   64a  8b4580               movl rax,[rbp-0x80]
0x19b556c4808d   64d  448b7dd0             movl r15,[rbp-0x30]
0x19b556c48091   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x19b556c4809a   65a  4103df               addl rbx,r15
0x19b556c4809d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x19b556c480a2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x19b556c480a9   669  0f8508000000         jnz 0x19b556c480b7  <+0x677>
0x19b556c480af   66f  488bdf               REX.W movq rbx,rdi
0x19b556c480b2   672  e90b010000           jmp 0x19b556c481c2  <+0x782>
0x19b556c480b7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x19b556c480bc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c480c2   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x19b556c480c7   687  0f833b000000         jnc 0x19b556c48108  <+0x6c8>
0x19b556c480cd   68d  8bd8                 movl rbx,rax
0x19b556c480cf   68f  8d4318               leal rax,[rbx+0x18]
0x19b556c480d2   692  488bd7               REX.W movq rdx,rdi
0x19b556c480d5   695  e8263cf2ff           call 0x19b556b6bd00  (jump table)
0x19b556c480da   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x19b556c480de   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x19b556c480e2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x19b556c480e7   6a7  4c8bd3               REX.W movq r10,rbx
0x19b556c480ea   6aa  4489e3               movl rbx,r12
0x19b556c480ed   6ad  4d8be3               REX.W movq r12,r11
0x19b556c480f0   6b0  4d8bda               REX.W movq r11,r10
0x19b556c480f3   6b3  33ff                 xorl rdi,rdi
0x19b556c480f5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c480f9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c480ff   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c48103   6c3  e903000000           jmp 0x19b556c4810b  <+0x6cb>
0x19b556c48108   6c8  488bdf               REX.W movq rbx,rdi
0x19b556c4810b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x19b556c48110   6d0  418d149f             leal rdx,[r15+rbx*4]
0x19b556c48114   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x19b556c48118   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x19b556c4811c   6dc  83f901               cmpl rcx,0x1
0x19b556c4811f   6df  0f8492000000         jz 0x19b556c481b7  <+0x777>
0x19b556c48125   6e5  448bf1               movl r14,rcx
0x19b556c48128   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x19b556c48130   6f0  83c0fc               addl rax,0xfc
0x19b556c48133   6f3  0f846f000000         jz 0x19b556c481a8  <+0x768>
0x19b556c48139   6f9  4989e2               REX.W movq r10,rsp
0x19b556c4813c   6fc  4883ec08             REX.W subq rsp,0x8
0x19b556c48140   700  4883e4f0             REX.W andq rsp,0xf0
0x19b556c48144   704  4c891424             REX.W movq [rsp],r10
0x19b556c48148   708  488bcf               REX.W movq rcx,rdi
0x19b556c4814b   70b  4c8bd7               REX.W movq r10,rdi
0x19b556c4814e   70e  488bfe               REX.W movq rdi,rsi
0x19b556c48151   711  498bf2               REX.W movq rsi,r10
0x19b556c48154   714  4c8bc0               REX.W movq r8,rax
0x19b556c48157   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x19b556c4815e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x19b556c48165   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x19b556c4816c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x19b556c48173   733  ffd0                 call rax
0x19b556c48175   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x19b556c48180   740  488b2424             REX.W movq rsp,[rsp]
0x19b556c48184   744  85c0                 testl rax,rax
0x19b556c48186   746  0f843c040000         jz 0x19b556c485c8  <+0xb88>
0x19b556c4818c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c48190   750  33ff                 xorl rdi,rdi
0x19b556c48192   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c48196   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c4819a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x19b556c4819d   75d  448b7dc8             movl r15,[rbp-0x38]
0x19b556c481a1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x19b556c481a8   768  4103de               addl rbx,r14
0x19b556c481ab   76b  448d73ff             leal r14,[rbx-0x1]
0x19b556c481af   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x19b556c481b4   774  418bde               movl rbx,r14
0x19b556c481b7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x19b556c481bf   77f  83c301               addl rbx,0x1
0x19b556c481c2   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x19b556c481c7   787  837de800             cmpl [rbp-0x18],0x0
0x19b556c481cb   78b  0f8505000000         jnz 0x19b556c481d6  <+0x796>
0x19b556c481d1   791  488be5               REX.W movq rsp,rbp
0x19b556c481d4   794  5d                   pop rbp
0x19b556c481d5   795  c3                   retl
0x19b556c481d6   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x19b556c481db   79b  4533f6               xorl r14,r14
0x19b556c481de   79e  4585ff               testl r15,r15
0x19b556c481e1   7a1  410f95c6             setnzl r14l
0x19b556c481e5   7a5  452bfe               subl r15,r14
0x19b556c481e8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x19b556c481ed   7ad  33c0                 xorl rax,rax
0x19b556c481ef   7af  4585f6               testl r14,r14
0x19b556c481f2   7b2  0f95c0               setnzl al
0x19b556c481f5   7b5  418bd6               movl rdx,r14
0x19b556c481f8   7b8  2bd0                 subl rdx,rax
0x19b556c481fa   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x19b556c481ff   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x19b556c48204   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x19b556c48209   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x19b556c48210   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x19b556c48214   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x19b556c48218   7d8  4c8be7               REX.W movq r12,rdi
0x19b556c4821b   7db  448b4d88             movl r9,[rbp-0x78]
0x19b556c4821f   7df  e924000000           jmp 0x19b556c48248  <+0x808>
0x19b556c48224   7e4  660f1f840000000000   nop
0x19b556c4822d   7ed  660f1f840000000000   nop
0x19b556c48236   7f6  660f1f840000000000   nop
0x19b556c4823f   7ff  90                   nop
0x19b556c48240   800  448b7d98             movl r15,[rbp-0x68]
0x19b556c48244   804  4c894590             REX.W movq [rbp-0x70],r8
0x19b556c48248   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c4824c   80c  0f86db020000         jna 0x19b556c4852d  <+0xaed>
0x19b556c48252   812  448b7590             movl r14,[rbp-0x70]
0x19b556c48256   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x19b556c4825c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x19b556c48260   820  7a06                 jpe 0x19b556c48268  <+0x828>
0x19b556c48262   822  0f8404000000         jz 0x19b556c4826c  <+0x82c>
0x19b556c48268   828  c5f928d1             vmovapd xmm2,xmm1
0x19b556c4826c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x19b556c48270   830  0f8704000000         ja 0x19b556c4827a  <+0x83a>
0x19b556c48276   836  c5f928d1             vmovapd xmm2,xmm1
0x19b556c4827a   83a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x19b556c48280   840  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x19b556c48284   844  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x19b556c4828a   84a  c57b2cf4             vcvttsd2si r14,xmm4
0x19b556c4828e   84e  4585f6               testl r14,r14
0x19b556c48291   851  0f8927000000         jns 0x19b556c482be  <+0x87e>
0x19b556c48297   857  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x19b556c4829e   85e  c441f96efa           vmovq xmm15,r10
0x19b556c482a3   863  c50358fc             vaddsd xmm15,xmm15,xmm4
0x19b556c482a7   867  c4417b2cf7           vcvttsd2si r14,xmm15
0x19b556c482ac   86c  4585f6               testl r14,r14
0x19b556c482af   86f  0f8809000000         js 0x19b556c482be  <+0x87e>
0x19b556c482b5   875  41ba00000080         movl r10,0x80000000
0x19b556c482bb   87b  450bf2               orl r14,r10
0x19b556c482be   87e  458bd6               movl r10,r14
0x19b556c482c1   881  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x19b556c482c6   886  c5f92eec             vucomisd xmm5,xmm4
0x19b556c482ca   88a  0f8ab2020000         jpe 0x19b556c48582  <+0xb42>
0x19b556c482d0   890  0f85ac020000         jnz 0x19b556c48582  <+0xb42>
0x19b556c482d6   896  458bc6               movl r8,r14
0x19b556c482d9   899  453bfe               cmpl r15,r14
0x19b556c482dc   89c  450f42c7             cmovcl r8,r15
0x19b556c482e0   8a0  41ba0000804f         movl r10,0x4f800000
0x19b556c482e6   8a6  c4c1796eda           vmovd xmm3,r10
0x19b556c482eb   8ab  4c8bf7               REX.W movq r14,rdi
0x19b556c482ee   8ae  c5f82eda             vucomiss xmm3,xmm2
0x19b556c482f2   8b2  450f47f0             cmoval r14,r8
0x19b556c482f6   8b6  448b45a0             movl r8,[rbp-0x60]
0x19b556c482fa   8ba  450fafc6             imull r8,r14
0x19b556c482fe   8be  458bf1               movl r14,r9
0x19b556c48301   8c1  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x19b556c48307   8c7  c5f82ed2             vucomiss xmm2,xmm2
0x19b556c4830b   8cb  7a06                 jpe 0x19b556c48313  <+0x8d3>
0x19b556c4830d   8cd  0f8404000000         jz 0x19b556c48317  <+0x8d7>
0x19b556c48313   8d3  c5f928d1             vmovapd xmm2,xmm1
0x19b556c48317   8d7  c5f82ed1             vucomiss xmm2,xmm1
0x19b556c4831b   8db  0f8704000000         ja 0x19b556c48325  <+0x8e5>
0x19b556c48321   8e1  c5f928d1             vmovapd xmm2,xmm1
0x19b556c48325   8e5  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x19b556c4832b   8eb  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x19b556c4832f   8ef  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x19b556c48335   8f5  c57b2cf5             vcvttsd2si r14,xmm5
0x19b556c48339   8f9  4585f6               testl r14,r14
0x19b556c4833c   8fc  0f8927000000         jns 0x19b556c48369  <+0x929>
0x19b556c48342   902  4c8b1589f9ffff       REX.W movq r10,[rip+0xfffff989]
0x19b556c48349   909  c441f96efa           vmovq xmm15,r10
0x19b556c4834e   90e  c50358fd             vaddsd xmm15,xmm15,xmm5
0x19b556c48352   912  c4417b2cf7           vcvttsd2si r14,xmm15
0x19b556c48357   917  4585f6               testl r14,r14
0x19b556c4835a   91a  0f8809000000         js 0x19b556c48369  <+0x929>
0x19b556c48360   920  41ba00000080         movl r10,0x80000000
0x19b556c48366   926  450bf2               orl r14,r10
0x19b556c48369   929  458bd6               movl r10,r14
0x19b556c4836c   92c  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x19b556c48371   931  c5f92ef5             vucomisd xmm6,xmm5
0x19b556c48375   935  0f8a2a020000         jpe 0x19b556c485a5  <+0xb65>
0x19b556c4837b   93b  0f8524020000         jnz 0x19b556c485a5  <+0xb65>
0x19b556c48381   941  458bfe               movl r15,r14
0x19b556c48384   944  413bd6               cmpl rdx,r14
0x19b556c48387   947  440f42fa             cmovcl r15,rdx
0x19b556c4838b   94b  4c8bf7               REX.W movq r14,rdi
0x19b556c4838e   94e  c5f82eda             vucomiss xmm3,xmm2
0x19b556c48392   952  450f47f7             cmoval r14,r15
0x19b556c48396   956  478d3c06             leal r15,[r14+r8*1]
0x19b556c4839a   95a  413bf7               cmpl rsi,r15
0x19b556c4839d   95d  0f8625000000         jna 0x19b556c483c8  <+0x988>
0x19b556c483a3   963  468d3cb9             leal r15,[rcx+r15*4]
0x19b556c483a7   967  478b343b             movl r14,[r11+r15*1]
0x19b556c483ab   96b  413bde               cmpl rbx,r14
0x19b556c483ae   96e  0f860c000000         jna 0x19b556c483c0  <+0x980>
0x19b556c483b4   974  468d34b0             leal r14,[rax+r14*4]
0x19b556c483b8   978  47892433             movl [r11+r14*1],r12
0x19b556c483bc   97c  478b343b             movl r14,[r11+r15*1]
0x19b556c483c0   980  4183c601             addl r14,0x1
0x19b556c483c4   984  4789343b             movl [r11+r15*1],r14
0x19b556c483c8   988  4183c104             addl r9,0x4
0x19b556c483cc   98c  448b4590             movl r8,[rbp-0x70]
0x19b556c483d0   990  4183c004             addl r8,0x4
0x19b556c483d4   994  4183c401             addl r12,0x1
0x19b556c483d8   998  448b75e8             movl r14,[rbp-0x18]
0x19b556c483dc   99c  4539e6               cmpl r14,r12
0x19b556c483df   99f  0f855bfeffff         jnz 0x19b556c48240  <+0x800>
0x19b556c483e5   9a5  e9e7fdffff           jmp 0x19b556c481d1  <+0x791>
0x19b556c483ea   9aa  e8e140f2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c483ef   9af  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c483f3   9b3  8b5d90               movl rbx,[rbp-0x70]
0x19b556c483f6   9b6  8b5588               movl rdx,[rbp-0x78]
0x19b556c483f9   9b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x19b556c483ff   9bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c48403   9c3  8b4580               movl rax,[rbp-0x80]
0x19b556c48406   9c6  448b4dc0             movl r9,[rbp-0x40]
0x19b556c4840a   9ca  e968f6ffff           jmp 0x19b556c47a77  <+0x37>
0x19b556c4840f   9cf  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x19b556c48416   9d6  488955b8             REX.W movq [rbp-0x48],rdx
0x19b556c4841a   9da  48894db0             REX.W movq [rbp-0x50],rcx
0x19b556c4841e   9de  4c894da8             REX.W movq [rbp-0x58],r9
0x19b556c48422   9e2  4c8945a0             REX.W movq [rbp-0x60],r8
0x19b556c48426   9e6  c5fb114598           vmovsd [rbp-0x68],xmm0
0x19b556c4842b   9eb  4c8975c0             REX.W movq [rbp-0x40],r14
0x19b556c4842f   9ef  e89c40f2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c48434   9f4  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c48438   9f8  33ff                 xorl rdi,rdi
0x19b556c4843a   9fa  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c4843e   9fe  448b7dd0             movl r15,[rbp-0x30]
0x19b556c48442   a02  8b9d78ffffff         movl rbx,[rbp-0x88]
0x19b556c48448   a08  8b55b8               movl rdx,[rbp-0x48]
0x19b556c4844b   a0b  8b4db0               movl rcx,[rbp-0x50]
0x19b556c4844e   a0e  448b4da8             movl r9,[rbp-0x58]
0x19b556c48452   a12  448b45a0             movl r8,[rbp-0x60]
0x19b556c48456   a16  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x19b556c4845b   a1b  448b75c0             movl r14,[rbp-0x40]
0x19b556c4845f   a1f  e92af8ffff           jmp 0x19b556c47c8e  <+0x24e>
0x19b556c48464   a24  c5f92edb             vucomisd xmm3,xmm3
0x19b556c48468   a28  0f8b08000000         jpo 0x19b556c48476  <+0xa36>
0x19b556c4846e   a2e  488bf7               REX.W movq rsi,rdi
0x19b556c48471   a31  e99bf8ffff           jmp 0x19b556c47d11  <+0x2d1>
0x19b556c48476   a36  c5f82eca             vucomiss xmm1,xmm2
0x19b556c4847a   a3a  77f2                 ja 0x19b556c4846e  <+0xa2e>
0x19b556c4847c   a3c  beffffffff           movl rsi,0xffffffff
0x19b556c48481   a41  e98bf8ffff           jmp 0x19b556c47d11  <+0x2d1>
0x19b556c48486   a46  c5f92ee4             vucomisd xmm4,xmm4
0x19b556c4848a   a4a  0f8b08000000         jpo 0x19b556c48498  <+0xa58>
0x19b556c48490   a50  488bc7               REX.W movq rax,rdi
0x19b556c48493   a53  e91cf9ffff           jmp 0x19b556c47db4  <+0x374>
0x19b556c48498   a58  c5f82eca             vucomiss xmm1,xmm2
0x19b556c4849c   a5c  77f2                 ja 0x19b556c48490  <+0xa50>
0x19b556c4849e   a5e  b8ffffffff           movl rax,0xffffffff
0x19b556c484a3   a63  e90cf9ffff           jmp 0x19b556c47db4  <+0x374>
0x19b556c484a8   a68  488955c8             REX.W movq [rbp-0x38],rdx
0x19b556c484ac   a6c  4c897598             REX.W movq [rbp-0x68],r14
0x19b556c484b0   a70  48895da8             REX.W movq [rbp-0x58],rbx
0x19b556c484b4   a74  48894db0             REX.W movq [rbp-0x50],rcx
0x19b556c484b8   a78  e81340f2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c484bd   a7d  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c484c1   a81  33ff                 xorl rdi,rdi
0x19b556c484c3   a83  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c484c7   a87  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c484cb   a8b  8b4580               movl rax,[rbp-0x80]
0x19b556c484ce   a8e  448b7dd0             movl r15,[rbp-0x30]
0x19b556c484d2   a92  448b4dc0             movl r9,[rbp-0x40]
0x19b556c484d6   a96  8b55c8               movl rdx,[rbp-0x38]
0x19b556c484d9   a99  448b7598             movl r14,[rbp-0x68]
0x19b556c484dd   a9d  8b5da8               movl rbx,[rbp-0x58]
0x19b556c484e0   aa0  8b4db0               movl rcx,[rbp-0x50]
0x19b556c484e3   aa3  e9a2f9ffff           jmp 0x19b556c47e8a  <+0x44a>
0x19b556c484e8   aa8  488955c8             REX.W movq [rbp-0x38],rdx
0x19b556c484ec   aac  4c8975b8             REX.W movq [rbp-0x48],r14
0x19b556c484f0   ab0  48895da8             REX.W movq [rbp-0x58],rbx
0x19b556c484f4   ab4  e8d73ff2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c484f9   ab9  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c484fd   abd  33ff                 xorl rdi,rdi
0x19b556c484ff   abf  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c48503   ac3  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x19b556c48507   ac7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c4850b   acb  8b4580               movl rax,[rbp-0x80]
0x19b556c4850e   ace  448b7dd0             movl r15,[rbp-0x30]
0x19b556c48512   ad2  448b4dc0             movl r9,[rbp-0x40]
0x19b556c48516   ad6  448b8578ffffff       movl r8,[rbp-0x88]
0x19b556c4851d   add  488b55c8             REX.W movq rdx,[rbp-0x38]
0x19b556c48521   ae1  448b75b8             movl r14,[rbp-0x48]
0x19b556c48525   ae5  8b5da8               movl rbx,[rbp-0x58]
0x19b556c48528   ae8  e962faffff           jmp 0x19b556c47f8f  <+0x54f>
0x19b556c4852d   aed  4c8965e0             REX.W movq [rbp-0x20],r12
0x19b556c48531   af1  4c894d88             REX.W movq [rbp-0x78],r9
0x19b556c48535   af5  488945d0             REX.W movq [rbp-0x30],rax
0x19b556c48539   af9  48895dc8             REX.W movq [rbp-0x38],rbx
0x19b556c4853d   afd  48894dc0             REX.W movq [rbp-0x40],rcx
0x19b556c48541   b01  488975b8             REX.W movq [rbp-0x48],rsi
0x19b556c48545   b05  488955b0             REX.W movq [rbp-0x50],rdx
0x19b556c48549   b09  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x19b556c4854e   b0e  e87d3ff2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c48553   b13  448b65e0             movl r12,[rbp-0x20]
0x19b556c48557   b17  448b4d88             movl r9,[rbp-0x78]
0x19b556c4855b   b1b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x19b556c4855f   b1f  8b45d0               movl rax,[rbp-0x30]
0x19b556c48562   b22  8b5dc8               movl rbx,[rbp-0x38]
0x19b556c48565   b25  8b4dc0               movl rcx,[rbp-0x40]
0x19b556c48568   b28  8b75b8               movl rsi,[rbp-0x48]
0x19b556c4856b   b2b  33ff                 xorl rdi,rdi
0x19b556c4856d   b2d  8b55b0               movl rdx,[rbp-0x50]
0x19b556c48570   b30  c5f057c9             vxorps xmm1,xmm1,xmm1
0x19b556c48574   b34  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x19b556c48579   b39  448b7d98             movl r15,[rbp-0x68]
0x19b556c4857d   b3d  e9d0fcffff           jmp 0x19b556c48252  <+0x812>
0x19b556c48582   b42  c5f92edb             vucomisd xmm3,xmm3
0x19b556c48586   b46  0f8b08000000         jpo 0x19b556c48594  <+0xb54>
0x19b556c4858c   b4c  4c8bf7               REX.W movq r14,rdi
0x19b556c4858f   b4f  e942fdffff           jmp 0x19b556c482d6  <+0x896>
0x19b556c48594   b54  c5f82eca             vucomiss xmm1,xmm2
0x19b556c48598   b58  77f2                 ja 0x19b556c4858c  <+0xb4c>
0x19b556c4859a   b5a  41beffffffff         movl r14,0xffffffff
0x19b556c485a0   b60  e931fdffff           jmp 0x19b556c482d6  <+0x896>
0x19b556c485a5   b65  c5f92ee4             vucomisd xmm4,xmm4
0x19b556c485a9   b69  0f8b08000000         jpo 0x19b556c485b7  <+0xb77>
0x19b556c485af   b6f  4c8bf7               REX.W movq r14,rdi
0x19b556c485b2   b72  e9cafdffff           jmp 0x19b556c48381  <+0x941>
0x19b556c485b7   b77  c5f82eca             vucomiss xmm1,xmm2
0x19b556c485bb   b7b  77f2                 ja 0x19b556c485af  <+0xb6f>
0x19b556c485bd   b7d  41beffffffff         movl r14,0xffffffff
0x19b556c485c3   b83  e9b9fdffff           jmp 0x19b556c48381  <+0x941>
0x19b556c485c8   b88  e8433cf2ff           call 0x19b556b6c210  (jump table)
0x19b556c485cd   b8d  e83e3cf2ff           call 0x19b556b6c210  (jump table)
0x19b556c485d2   b92  e8393cf2ff           call 0x19b556b6c210  (jump table)
0x19b556c485d7   b97  90                   nop

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
       2f6         
       3a0         
       3a7         
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
       8c1         
       967         
       978         
       97c         
       984         

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
       2f6       340
       3a0       418
       3a7       424
       44a       531
       450       539
       457       551
       45e       559
       465       571
       46c       579
       473       591
       47a       599
       481       611
       488       619
       48f       631
       496       639
       49d       651
       4a4       659
       4ab       671
       4b2       679
       500       718
       506       726
       517       718
       51d       726
       52e       718
       534       726
       54f       718
       555       726
       562       755
       56b       764
       580       779
       58b       787
       5d9       800
       5e2       813
       651       833
       65d       843
       677       863
       692       878
       69a       886
       6cb       894
       6f9       937
       777       971
       782       986
       796       998
       7a8      1013
       7ba      1028
       7bf      1035
       7c4      1042
       7c9      1049
       816      1071
       8c1      1138
       967      1213
       978      1233
       97c      1238
       984      1251
       9aa         0
       9cf       260
       a68       525
       aa8       712
       aed      1058
       b88       937
       b8d       813
       b92       126

Safepoints (stack slots = 20, entries = 1, byte size = 16)
0x19b556c47ace     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x19b556c47aca  internal wasm call
0x19b556c47b55  external reference (0x193f2f0)
0x19b556c47fc7  internal wasm call
0x19b556c4803f  external reference (0x193f270)
0x19b556c480d6  internal wasm call
0x19b556c483eb  wasm stub call  (0x19b556b6c4d0)
0x19b556c48430  wasm stub call  (0x19b556b6c4d0)
0x19b556c484b9  wasm stub call  (0x19b556b6c4d0)
0x19b556c484f5  wasm stub call  (0x19b556b6c4d0)
0x19b556c4854f  wasm stub call  (0x19b556b6c4d0)
0x19b556c485c9  wasm stub call  (0x19b556b6c210)
0x19b556c485ce  wasm stub call  (0x19b556b6c210)
0x19b556c485d3  wasm stub call  (0x19b556b6c210)
