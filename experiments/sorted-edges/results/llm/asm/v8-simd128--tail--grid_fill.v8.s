name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2984 + 24 padding)
Instructions (size = 2968)
0x33f76367ae40     0  55                   push rbp
0x33f76367ae41     1  4889e5               REX.W movq rbp,rsp
0x33f76367ae44     4  6a08                 push 0x8
0x33f76367ae46     6  56                   push rsi
0x33f76367ae47     7  4881ec80000000       REX.W subq rsp,0x80
0x33f76367ae4e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x33f76367ae52    12  48894580             REX.W movq [rbp-0x80],rax
0x33f76367ae56    16  48895588             REX.W movq [rbp-0x78],rdx
0x33f76367ae5a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x33f76367ae61    21  48895d90             REX.W movq [rbp-0x70],rbx
0x33f76367ae65    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x33f76367ae69    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x33f76367ae6d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367ae71    31  0f8673090000         jna 0x33f76367b7ea  <+0x9aa>
0x33f76367ae77    37  448be0               movl r12,rax
0x33f76367ae7a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x33f76367ae83    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x33f76367ae88    48  478b742328           movl r14,[r11+r12*1+0x28]
0x33f76367ae8d    4d  450faff7             imull r14,r15
0x33f76367ae91    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x33f76367ae95    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x33f76367ae99    59  4d8bfe               REX.W movq r15,r14
0x33f76367ae9c    5c  4183c701             addl r15,0x1
0x33f76367aea0    60  0f850c000000         jnz 0x33f76367aeb2  <+0x72>
0x33f76367aea6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x33f76367aeaa    6a  4533ff               xorl r15,r15
0x33f76367aead    6d  e928010000           jmp 0x33f76367afda  <+0x19a>
0x33f76367aeb2    72  438b3c23             movl rdi,[r11+r12*1]
0x33f76367aeb6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x33f76367aeba    7a  47393c23             cmpl [r11+r12*1],r15
0x33f76367aebe    7e  0f8341000000         jnc 0x33f76367af05  <+0xc5>
0x33f76367aec4    84  498bcf               REX.W movq rcx,r15
0x33f76367aec7    87  33d2                 xorl rdx,rdx
0x33f76367aec9    89  e8322ef2ff           call 0x33f76359dd00  (jump table)
0x33f76367aece    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x33f76367aed2    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x33f76367aed6    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x33f76367aedb    9b  4489e7               movl rdi,r12
0x33f76367aede    9e  4d8be3               REX.W movq r12,r11
0x33f76367aee1    a1  4c8bdb               REX.W movq r11,rbx
0x33f76367aee4    a4  8b5588               movl rdx,[rbp-0x78]
0x33f76367aee7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367aeed    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367aef1    b1  8b4580               movl rax,[rbp-0x80]
0x33f76367aef4    b4  448b4dc0             movl r9,[rbp-0x40]
0x33f76367aef8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x33f76367aefc    bc  448b75b0             movl r14,[rbp-0x50]
0x33f76367af00    c0  e902000000           jmp 0x33f76367af07  <+0xc7>
0x33f76367af05    c5  33ff                 xorl rdi,rdi
0x33f76367af07    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x33f76367af0c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x33f76367af10    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x33f76367af14    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x33f76367af18    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x33f76367af1c    dc  4585f6               testl r14,r14
0x33f76367af1f    df  0f84a4000000         jz 0x33f76367afc9  <+0x189>
0x33f76367af25    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x33f76367af2d    ed  83c3fc               addl rbx,0xfc
0x33f76367af30    f0  0f8480000000         jz 0x33f76367afb6  <+0x176>
0x33f76367af36    f6  4989e2               REX.W movq r10,rsp
0x33f76367af39    f9  4883ec08             REX.W subq rsp,0x8
0x33f76367af3d    fd  4883e4f0             REX.W andq rsp,0xf0
0x33f76367af41   101  4c891424             REX.W movq [rsp],r10
0x33f76367af45   105  488bfe               REX.W movq rdi,rsi
0x33f76367af48   108  4c8bc3               REX.W movq r8,rbx
0x33f76367af4b   10b  8b55e8               movl rdx,[rbp-0x18]
0x33f76367af4e   10e  33c9                 xorl rcx,rcx
0x33f76367af50   110  488bf1               REX.W movq rsi,rcx
0x33f76367af53   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x33f76367af5d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x33f76367af64   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x33f76367af6b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x33f76367af72   132  ffd0                 call rax
0x33f76367af74   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x33f76367af7f   13f  488b2424             REX.W movq rsp,[rsp]
0x33f76367af83   143  85c0                 testl rax,rax
0x33f76367af85   145  0f84470a0000         jz 0x33f76367b9d2  <+0xb92>
0x33f76367af8b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367af8f   14f  8b5588               movl rdx,[rbp-0x78]
0x33f76367af92   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367af96   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367af9c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367afa0   160  8b4580               movl rax,[rbp-0x80]
0x33f76367afa3   163  448b4dc0             movl r9,[rbp-0x40]
0x33f76367afa7   167  8b7db8               movl rdi,[rbp-0x48]
0x33f76367afaa   16a  448b45c8             movl r8,[rbp-0x38]
0x33f76367afae   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x33f76367afb2   172  448b75b0             movl r14,[rbp-0x50]
0x33f76367afb6   176  8bdf                 movl rbx,rdi
0x33f76367afb8   178  4403f3               addl r14,rbx
0x33f76367afbb   17b  4103df               addl rbx,r15
0x33f76367afbe   17e  458bf8               movl r15,r8
0x33f76367afc1   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x33f76367afc6   186  418bfe               movl rdi,r14
0x33f76367afc9   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x33f76367afd1   191  8d5f01               leal rbx,[rdi+0x1]
0x33f76367afd4   194  448bfb               movl r15,rbx
0x33f76367afd7   197  8b5d90               movl rbx,[rbp-0x70]
0x33f76367afda   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x33f76367afdf   19f  458bc1               movl r8,r9
0x33f76367afe2   1a2  448bf1               movl r14,rcx
0x33f76367afe5   1a5  443bc1               cmpl r8,rcx
0x33f76367afe8   1a8  450f42f0             cmovcl r14,r8
0x33f76367afec   1ac  33ff                 xorl rdi,rdi
0x33f76367afee   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x33f76367aff2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x33f76367aff6   1b6  4585f6               testl r14,r14
0x33f76367aff9   1b9  0f850e000000         jnz 0x33f76367b00d  <+0x1cd>
0x33f76367afff   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x33f76367b004   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b008   1c8  e910020000           jmp 0x33f76367b21d  <+0x3dd>
0x33f76367b00d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x33f76367b012   1d2  4533c9               xorl r9,r9
0x33f76367b015   1d5  4585c0               testl r8,r8
0x33f76367b018   1d8  410f95c1             setnzl r9l
0x33f76367b01c   1dc  452bc1               subl r8,r9
0x33f76367b01f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x33f76367b024   1e4  33db                 xorl rbx,rbx
0x33f76367b026   1e6  4585c9               testl r9,r9
0x33f76367b029   1e9  0f95c3               setnzl bl
0x33f76367b02c   1ec  458bf1               movl r14,r9
0x33f76367b02f   1ef  442bf3               subl r14,rbx
0x33f76367b032   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x33f76367b037   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x33f76367b03e   1fe  448b55e8             movl r10,[rbp-0x18]
0x33f76367b042   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x33f76367b046   206  8bca                 movl rcx,rdx
0x33f76367b048   208  8b5590               movl rdx,[rbp-0x70]
0x33f76367b04b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b04f   20f  e930000000           jmp 0x33f76367b084  <+0x244>
0x33f76367b054   214  660f1f840000000000   nop
0x33f76367b05d   21d  660f1f840000000000   nop
0x33f76367b066   226  660f1f840000000000   nop
0x33f76367b06f   22f  660f1f840000000000   nop
0x33f76367b078   238  0f1f840000000000     nop
0x33f76367b080   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x33f76367b084   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367b088   248  0f8681070000         jna 0x33f76367b80f  <+0x9cf>
0x33f76367b08e   24e  8bf1                 movl rsi,rcx
0x33f76367b090   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x33f76367b096   256  c5f82ed2             vucomiss xmm2,xmm2
0x33f76367b09a   25a  7a06                 jpe 0x33f76367b0a2  <+0x262>
0x33f76367b09c   25c  0f8404000000         jz 0x33f76367b0a6  <+0x266>
0x33f76367b0a2   262  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b0a6   266  c5f82ed1             vucomiss xmm2,xmm1
0x33f76367b0aa   26a  0f8704000000         ja 0x33f76367b0b4  <+0x274>
0x33f76367b0b0   270  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b0b4   274  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x33f76367b0ba   27a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x33f76367b0be   27e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x33f76367b0c4   284  c5fb2cf4             vcvttsd2si rsi,xmm4
0x33f76367b0c8   288  85f6                 testl rsi,rsi
0x33f76367b0ca   28a  0f8929000000         jns 0x33f76367b0f9  <+0x2b9>
0x33f76367b0d0   290  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x33f76367b0da   29a  c441f96efa           vmovq xmm15,r10
0x33f76367b0df   29f  c50358fc             vaddsd xmm15,xmm15,xmm4
0x33f76367b0e3   2a3  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x33f76367b0e8   2a8  85f6                 testl rsi,rsi
0x33f76367b0ea   2aa  0f8809000000         js 0x33f76367b0f9  <+0x2b9>
0x33f76367b0f0   2b0  41ba00000080         movl r10,0x80000000
0x33f76367b0f6   2b6  410bf2               orl rsi,r10
0x33f76367b0f9   2b9  448bd6               movl r10,rsi
0x33f76367b0fc   2bc  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x33f76367b101   2c1  c5f92eec             vucomisd xmm5,xmm4
0x33f76367b105   2c5  0f8a59070000         jpe 0x33f76367b864  <+0xa24>
0x33f76367b10b   2cb  0f8553070000         jnz 0x33f76367b864  <+0xa24>
0x33f76367b111   2d1  8bc6                 movl rax,rsi
0x33f76367b113   2d3  443bf6               cmpl r14,rsi
0x33f76367b116   2d6  410f42c6             cmovcl rax,r14
0x33f76367b11a   2da  83c001               addl rax,0x1
0x33f76367b11d   2dd  41ba0000804f         movl r10,0x4f800000
0x33f76367b123   2e3  c4c1796eda           vmovd xmm3,r10
0x33f76367b128   2e8  be01000000           movl rsi,0x1
0x33f76367b12d   2ed  c5f82eda             vucomiss xmm3,xmm2
0x33f76367b131   2f1  0f47f0               cmoval rsi,rax
0x33f76367b134   2f4  8bc2                 movl rax,rdx
0x33f76367b136   2f6  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x33f76367b13c   2fc  c5f82ed2             vucomiss xmm2,xmm2
0x33f76367b140   300  7a06                 jpe 0x33f76367b148  <+0x308>
0x33f76367b142   302  0f8404000000         jz 0x33f76367b14c  <+0x30c>
0x33f76367b148   308  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b14c   30c  c5f82ed1             vucomiss xmm2,xmm1
0x33f76367b150   310  0f8704000000         ja 0x33f76367b15a  <+0x31a>
0x33f76367b156   316  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b15a   31a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x33f76367b160   320  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x33f76367b164   324  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x33f76367b16a   32a  c5fb2cc5             vcvttsd2si rax,xmm5
0x33f76367b16e   32e  85c0                 testl rax,rax
0x33f76367b170   330  0f8926000000         jns 0x33f76367b19c  <+0x35c>
0x33f76367b176   336  4c8b1555ffffff       REX.W movq r10,[rip+0xffffff55]
0x33f76367b17d   33d  c441f96efa           vmovq xmm15,r10
0x33f76367b182   342  c50358fd             vaddsd xmm15,xmm15,xmm5
0x33f76367b186   346  c4c17b2cc7           vcvttsd2si rax,xmm15
0x33f76367b18b   34b  85c0                 testl rax,rax
0x33f76367b18d   34d  0f8809000000         js 0x33f76367b19c  <+0x35c>
0x33f76367b193   353  41ba00000080         movl r10,0x80000000
0x33f76367b199   359  410bc2               orl rax,r10
0x33f76367b19c   35c  448bd0               movl r10,rax
0x33f76367b19f   35f  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x33f76367b1a4   364  c5f92ef5             vucomisd xmm6,xmm5
0x33f76367b1a8   368  0f8ad8060000         jpe 0x33f76367b886  <+0xa46>
0x33f76367b1ae   36e  0f85d2060000         jnz 0x33f76367b886  <+0xa46>
0x33f76367b1b4   374  448be0               movl r12,rax
0x33f76367b1b7   377  443bc0               cmpl r8,rax
0x33f76367b1ba   37a  450f42e0             cmovcl r12,r8
0x33f76367b1be   37e  488bc7               REX.W movq rax,rdi
0x33f76367b1c1   381  c5f82eda             vucomiss xmm3,xmm2
0x33f76367b1c5   385  410f47c4             cmoval rax,r12
0x33f76367b1c9   389  458be1               movl r12,r9
0x33f76367b1cc   38c  440fafe0             imull r12,rax
0x33f76367b1d0   390  4403e6               addl r12,rsi
0x33f76367b1d3   393  4539e7               cmpl r15,r12
0x33f76367b1d6   396  0f860f000000         jna 0x33f76367b1eb  <+0x3ab>
0x33f76367b1dc   39c  468d24a3             leal r12,[rbx+r12*4]
0x33f76367b1e0   3a0  438b0423             movl rax,[r11+r12*1]
0x33f76367b1e4   3a4  83c001               addl rax,0x1
0x33f76367b1e7   3a7  43890423             movl [r11+r12*1],rax
0x33f76367b1eb   3ab  83c104               addl rcx,0x4
0x33f76367b1ee   3ae  83c204               addl rdx,0x4
0x33f76367b1f1   3b1  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x33f76367b1f5   3b5  4183c4ff             addl r12,0xff
0x33f76367b1f9   3b9  0f8581feffff         jnz 0x33f76367b080  <+0x240>
0x33f76367b1ff   3bf  448bc3               movl r8,rbx
0x33f76367b202   3c2  448b75e8             movl r14,[rbp-0x18]
0x33f76367b206   3c6  8b5d90               movl rbx,[rbp-0x70]
0x33f76367b209   3c9  8b5588               movl rdx,[rbp-0x78]
0x33f76367b20c   3cc  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367b210   3d0  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367b216   3d6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b21a   3da  8b4580               movl rax,[rbp-0x80]
0x33f76367b21d   3dd  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x33f76367b224   3e4  4585ff               testl r15,r15
0x33f76367b227   3e7  0f8508000000         jnz 0x33f76367b235  <+0x3f5>
0x33f76367b22d   3ed  488bdf               REX.W movq rbx,rdi
0x33f76367b230   3f0  e95c020000           jmp 0x33f76367b491  <+0x651>
0x33f76367b235   3f5  468d0cbd00000000     leal r9,[r15*4+0x0]
0x33f76367b23d   3fd  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x33f76367b245   405  448bf3               movl r14,rbx
0x33f76367b248   408  41c1ee02             shrl r14, 2
0x33f76367b24c   40c  4183c601             addl r14,0x1
0x33f76367b250   410  418bd6               movl rdx,r14
0x33f76367b253   413  83e207               andl rdx,0x7
0x33f76367b256   416  4c894dc0             REX.W movq [rbp-0x40],r9
0x33f76367b25a   41a  83fb1c               cmpl rbx,0x1c
0x33f76367b25d   41d  0f82cf000000         jc 0x33f76367b332  <+0x4f2>
0x33f76367b263   423  4181e6f8ffff7f       andl r14,0x7ffffff8
0x33f76367b26a   42a  418bd8               movl rbx,r8
0x33f76367b26d   42d  488bcf               REX.W movq rcx,rdi
0x33f76367b270   430  660f1f840000000000   nop
0x33f76367b279   439  0f1f8000000000       nop
0x33f76367b280   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367b284   444  0f861e060000         jna 0x33f76367b8a8  <+0xa68>
0x33f76367b28a   44a  418b341b             movl rsi,[r11+rbx*1]
0x33f76367b28e   44e  03ce                 addl rcx,rsi
0x33f76367b290   450  41890c1b             movl [r11+rbx*1],rcx
0x33f76367b294   454  8d7304               leal rsi,[rbx+0x4]
0x33f76367b297   457  458b0433             movl r8,[r11+rsi*1]
0x33f76367b29b   45b  4103c8               addl rcx,r8
0x33f76367b29e   45e  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2a2   462  8d7308               leal rsi,[rbx+0x8]
0x33f76367b2a5   465  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2a9   469  4103c8               addl rcx,r8
0x33f76367b2ac   46c  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2b0   470  8d730c               leal rsi,[rbx+0xc]
0x33f76367b2b3   473  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2b7   477  4103c8               addl rcx,r8
0x33f76367b2ba   47a  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2be   47e  8d7310               leal rsi,[rbx+0x10]
0x33f76367b2c1   481  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2c5   485  4103c8               addl rcx,r8
0x33f76367b2c8   488  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2cc   48c  8d7314               leal rsi,[rbx+0x14]
0x33f76367b2cf   48f  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2d3   493  4103c8               addl rcx,r8
0x33f76367b2d6   496  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2da   49a  8d7318               leal rsi,[rbx+0x18]
0x33f76367b2dd   49d  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2e1   4a1  4103c8               addl rcx,r8
0x33f76367b2e4   4a4  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2e8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x33f76367b2eb   4ab  458b0433             movl r8,[r11+rsi*1]
0x33f76367b2ef   4af  4103c8               addl rcx,r8
0x33f76367b2f2   4b2  41890c33             movl [r11+rsi*1],rcx
0x33f76367b2f6   4b6  83c320               addl rbx,0x20
0x33f76367b2f9   4b9  4183c6f8             addl r14,0xf8
0x33f76367b2fd   4bd  7581                 jnz 0x33f76367b280  <+0x440>
0x33f76367b2ff   4bf  85d2                 testl rdx,rdx
0x33f76367b301   4c1  0f8510000000         jnz 0x33f76367b317  <+0x4d7>
0x33f76367b307   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b30b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x33f76367b312   4d2  e98b000000           jmp 0x33f76367b3a2  <+0x562>
0x33f76367b317   4d7  448bf3               movl r14,rbx
0x33f76367b31a   4da  8bd9                 movl rbx,rcx
0x33f76367b31c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367b322   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b326   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x33f76367b32d   4ed  e906000000           jmp 0x33f76367b338  <+0x4f8>
0x33f76367b332   4f2  488bdf               REX.W movq rbx,rdi
0x33f76367b335   4f5  458bf0               movl r14,r8
0x33f76367b338   4f8  c1e202               shll rdx, 2
0x33f76367b33b   4fb  0f1f440000           nop
0x33f76367b340   500  438b0c33             movl rcx,[r11+r14*1]
0x33f76367b344   504  03d9                 addl rbx,rcx
0x33f76367b346   506  43891c33             movl [r11+r14*1],rbx
0x33f76367b34a   50a  4183c604             addl r14,0x4
0x33f76367b34e   50e  83c2fc               addl rdx,0xfc
0x33f76367b351   511  0f844b000000         jz 0x33f76367b3a2  <+0x562>
0x33f76367b357   517  438b0c33             movl rcx,[r11+r14*1]
0x33f76367b35b   51b  03d9                 addl rbx,rcx
0x33f76367b35d   51d  43891c33             movl [r11+r14*1],rbx
0x33f76367b361   521  4183c604             addl r14,0x4
0x33f76367b365   525  83c2fc               addl rdx,0xfc
0x33f76367b368   528  0f8434000000         jz 0x33f76367b3a2  <+0x562>
0x33f76367b36e   52e  438b0c33             movl rcx,[r11+r14*1]
0x33f76367b372   532  03d9                 addl rbx,rcx
0x33f76367b374   534  43891c33             movl [r11+r14*1],rbx
0x33f76367b378   538  4183c604             addl r14,0x4
0x33f76367b37c   53c  83c2fc               addl rdx,0xfc
0x33f76367b37f   53f  0f841d000000         jz 0x33f76367b3a2  <+0x562>
0x33f76367b385   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367b389   549  0f8659050000         jna 0x33f76367b8e8  <+0xaa8>
0x33f76367b38f   54f  438b0c33             movl rcx,[r11+r14*1]
0x33f76367b393   553  03d9                 addl rbx,rcx
0x33f76367b395   555  43891c33             movl [r11+r14*1],rbx
0x33f76367b399   559  4183c604             addl r14,0x4
0x33f76367b39d   55d  83c2fc               addl rdx,0xfc
0x33f76367b3a0   560  759e                 jnz 0x33f76367b340  <+0x500>
0x33f76367b3a2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x33f76367b3ab   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x33f76367b3b0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x33f76367b3b5   575  0f834a000000         jnc 0x33f76367b405  <+0x5c5>
0x33f76367b3bb   57b  8bd8                 movl rbx,rax
0x33f76367b3bd   57d  8d430c               leal rax,[rbx+0xc]
0x33f76367b3c0   580  418bcf               movl rcx,r15
0x33f76367b3c3   583  488bd7               REX.W movq rdx,rdi
0x33f76367b3c6   586  e83529f2ff           call 0x33f76359dd00  (jump table)
0x33f76367b3cb   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x33f76367b3cf   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x33f76367b3d3   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x33f76367b3d8   598  4c8bd3               REX.W movq r10,rbx
0x33f76367b3db   59b  4489e3               movl rbx,r12
0x33f76367b3de   59e  4d8be3               REX.W movq r12,r11
0x33f76367b3e1   5a1  4d8bda               REX.W movq r11,r10
0x33f76367b3e4   5a4  33ff                 xorl rdi,rdi
0x33f76367b3e6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b3ea   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b3ee   5ae  8b4580               movl rax,[rbp-0x80]
0x33f76367b3f1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x33f76367b3f5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x33f76367b3f9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x33f76367b400   5c0  e903000000           jmp 0x33f76367b408  <+0x5c8>
0x33f76367b405   5c5  488bdf               REX.W movq rbx,rdi
0x33f76367b408   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x33f76367b40c   5cc  4d8bf7               REX.W movq r14,r15
0x33f76367b40f   5cf  41c1e602             shll r14, 2
0x33f76367b413   5d3  0f8478000000         jz 0x33f76367b491  <+0x651>
0x33f76367b419   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x33f76367b41e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x33f76367b422   5e2  4989e2               REX.W movq r10,rsp
0x33f76367b425   5e5  4883ec08             REX.W subq rsp,0x8
0x33f76367b429   5e9  4883e4f0             REX.W andq rsp,0xf0
0x33f76367b42d   5ed  4c891424             REX.W movq [rsp],r10
0x33f76367b431   5f1  488bd7               REX.W movq rdx,rdi
0x33f76367b434   5f4  4c8bd7               REX.W movq r10,rdi
0x33f76367b437   5f7  488bfe               REX.W movq rdi,rsi
0x33f76367b43a   5fa  498bf2               REX.W movq rsi,r10
0x33f76367b43d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x33f76367b447   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x33f76367b44e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x33f76367b455   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x33f76367b45c   61c  ffd0                 call rax
0x33f76367b45e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x33f76367b469   629  488b2424             REX.W movq rsp,[rsp]
0x33f76367b46d   62d  85c0                 testl rax,rax
0x33f76367b46f   62f  0f8458050000         jz 0x33f76367b9cd  <+0xb8d>
0x33f76367b475   635  8b5dc8               movl rbx,[rbp-0x38]
0x33f76367b478   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b47c   63c  33ff                 xorl rdi,rdi
0x33f76367b47e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b482   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367b486   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b48a   64a  8b4580               movl rax,[rbp-0x80]
0x33f76367b48d   64d  448b7dd0             movl r15,[rbp-0x30]
0x33f76367b491   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x33f76367b49a   65a  4103df               addl rbx,r15
0x33f76367b49d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x33f76367b4a2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x33f76367b4a9   669  0f8508000000         jnz 0x33f76367b4b7  <+0x677>
0x33f76367b4af   66f  488bdf               REX.W movq rbx,rdi
0x33f76367b4b2   672  e90b010000           jmp 0x33f76367b5c2  <+0x782>
0x33f76367b4b7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x33f76367b4bc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367b4c2   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x33f76367b4c7   687  0f833b000000         jnc 0x33f76367b508  <+0x6c8>
0x33f76367b4cd   68d  8bd8                 movl rbx,rax
0x33f76367b4cf   68f  8d4318               leal rax,[rbx+0x18]
0x33f76367b4d2   692  488bd7               REX.W movq rdx,rdi
0x33f76367b4d5   695  e82628f2ff           call 0x33f76359dd00  (jump table)
0x33f76367b4da   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x33f76367b4de   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x33f76367b4e2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x33f76367b4e7   6a7  4c8bd3               REX.W movq r10,rbx
0x33f76367b4ea   6aa  4489e3               movl rbx,r12
0x33f76367b4ed   6ad  4d8be3               REX.W movq r12,r11
0x33f76367b4f0   6b0  4d8bda               REX.W movq r11,r10
0x33f76367b4f3   6b3  33ff                 xorl rdi,rdi
0x33f76367b4f5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b4f9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367b4ff   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b503   6c3  e903000000           jmp 0x33f76367b50b  <+0x6cb>
0x33f76367b508   6c8  488bdf               REX.W movq rbx,rdi
0x33f76367b50b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x33f76367b510   6d0  418d149f             leal rdx,[r15+rbx*4]
0x33f76367b514   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x33f76367b518   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x33f76367b51c   6dc  83f901               cmpl rcx,0x1
0x33f76367b51f   6df  0f8492000000         jz 0x33f76367b5b7  <+0x777>
0x33f76367b525   6e5  448bf1               movl r14,rcx
0x33f76367b528   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x33f76367b530   6f0  83c0fc               addl rax,0xfc
0x33f76367b533   6f3  0f846f000000         jz 0x33f76367b5a8  <+0x768>
0x33f76367b539   6f9  4989e2               REX.W movq r10,rsp
0x33f76367b53c   6fc  4883ec08             REX.W subq rsp,0x8
0x33f76367b540   700  4883e4f0             REX.W andq rsp,0xf0
0x33f76367b544   704  4c891424             REX.W movq [rsp],r10
0x33f76367b548   708  488bcf               REX.W movq rcx,rdi
0x33f76367b54b   70b  4c8bd7               REX.W movq r10,rdi
0x33f76367b54e   70e  488bfe               REX.W movq rdi,rsi
0x33f76367b551   711  498bf2               REX.W movq rsi,r10
0x33f76367b554   714  4c8bc0               REX.W movq r8,rax
0x33f76367b557   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x33f76367b55e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x33f76367b565   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x33f76367b56c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x33f76367b573   733  ffd0                 call rax
0x33f76367b575   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x33f76367b580   740  488b2424             REX.W movq rsp,[rsp]
0x33f76367b584   744  85c0                 testl rax,rax
0x33f76367b586   746  0f843c040000         jz 0x33f76367b9c8  <+0xb88>
0x33f76367b58c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b590   750  33ff                 xorl rdi,rdi
0x33f76367b592   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b596   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367b59a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x33f76367b59d   75d  448b7dc8             movl r15,[rbp-0x38]
0x33f76367b5a1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x33f76367b5a8   768  4103de               addl rbx,r14
0x33f76367b5ab   76b  448d73ff             leal r14,[rbx-0x1]
0x33f76367b5af   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x33f76367b5b4   774  418bde               movl rbx,r14
0x33f76367b5b7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x33f76367b5bf   77f  83c301               addl rbx,0x1
0x33f76367b5c2   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x33f76367b5c7   787  837de800             cmpl [rbp-0x18],0x0
0x33f76367b5cb   78b  0f8505000000         jnz 0x33f76367b5d6  <+0x796>
0x33f76367b5d1   791  488be5               REX.W movq rsp,rbp
0x33f76367b5d4   794  5d                   pop rbp
0x33f76367b5d5   795  c3                   retl
0x33f76367b5d6   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x33f76367b5db   79b  4533f6               xorl r14,r14
0x33f76367b5de   79e  4585ff               testl r15,r15
0x33f76367b5e1   7a1  410f95c6             setnzl r14l
0x33f76367b5e5   7a5  452bfe               subl r15,r14
0x33f76367b5e8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x33f76367b5ed   7ad  33c0                 xorl rax,rax
0x33f76367b5ef   7af  4585f6               testl r14,r14
0x33f76367b5f2   7b2  0f95c0               setnzl al
0x33f76367b5f5   7b5  418bd6               movl rdx,r14
0x33f76367b5f8   7b8  2bd0                 subl rdx,rax
0x33f76367b5fa   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x33f76367b5ff   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x33f76367b604   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x33f76367b609   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x33f76367b610   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x33f76367b614   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x33f76367b618   7d8  4c8be7               REX.W movq r12,rdi
0x33f76367b61b   7db  448b4d88             movl r9,[rbp-0x78]
0x33f76367b61f   7df  e924000000           jmp 0x33f76367b648  <+0x808>
0x33f76367b624   7e4  660f1f840000000000   nop
0x33f76367b62d   7ed  660f1f840000000000   nop
0x33f76367b636   7f6  660f1f840000000000   nop
0x33f76367b63f   7ff  90                   nop
0x33f76367b640   800  448b7d98             movl r15,[rbp-0x68]
0x33f76367b644   804  4c894590             REX.W movq [rbp-0x70],r8
0x33f76367b648   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367b64c   80c  0f86db020000         jna 0x33f76367b92d  <+0xaed>
0x33f76367b652   812  448b7590             movl r14,[rbp-0x70]
0x33f76367b656   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x33f76367b65c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x33f76367b660   820  7a06                 jpe 0x33f76367b668  <+0x828>
0x33f76367b662   822  0f8404000000         jz 0x33f76367b66c  <+0x82c>
0x33f76367b668   828  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b66c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x33f76367b670   830  0f8704000000         ja 0x33f76367b67a  <+0x83a>
0x33f76367b676   836  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b67a   83a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x33f76367b680   840  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x33f76367b684   844  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x33f76367b68a   84a  c57b2cf4             vcvttsd2si r14,xmm4
0x33f76367b68e   84e  4585f6               testl r14,r14
0x33f76367b691   851  0f8927000000         jns 0x33f76367b6be  <+0x87e>
0x33f76367b697   857  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x33f76367b69e   85e  c441f96efa           vmovq xmm15,r10
0x33f76367b6a3   863  c50358fc             vaddsd xmm15,xmm15,xmm4
0x33f76367b6a7   867  c4417b2cf7           vcvttsd2si r14,xmm15
0x33f76367b6ac   86c  4585f6               testl r14,r14
0x33f76367b6af   86f  0f8809000000         js 0x33f76367b6be  <+0x87e>
0x33f76367b6b5   875  41ba00000080         movl r10,0x80000000
0x33f76367b6bb   87b  450bf2               orl r14,r10
0x33f76367b6be   87e  458bd6               movl r10,r14
0x33f76367b6c1   881  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x33f76367b6c6   886  c5f92eec             vucomisd xmm5,xmm4
0x33f76367b6ca   88a  0f8ab2020000         jpe 0x33f76367b982  <+0xb42>
0x33f76367b6d0   890  0f85ac020000         jnz 0x33f76367b982  <+0xb42>
0x33f76367b6d6   896  458bc6               movl r8,r14
0x33f76367b6d9   899  453bfe               cmpl r15,r14
0x33f76367b6dc   89c  450f42c7             cmovcl r8,r15
0x33f76367b6e0   8a0  41ba0000804f         movl r10,0x4f800000
0x33f76367b6e6   8a6  c4c1796eda           vmovd xmm3,r10
0x33f76367b6eb   8ab  4c8bf7               REX.W movq r14,rdi
0x33f76367b6ee   8ae  c5f82eda             vucomiss xmm3,xmm2
0x33f76367b6f2   8b2  450f47f0             cmoval r14,r8
0x33f76367b6f6   8b6  448b45a0             movl r8,[rbp-0x60]
0x33f76367b6fa   8ba  450fafc6             imull r8,r14
0x33f76367b6fe   8be  458bf1               movl r14,r9
0x33f76367b701   8c1  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x33f76367b707   8c7  c5f82ed2             vucomiss xmm2,xmm2
0x33f76367b70b   8cb  7a06                 jpe 0x33f76367b713  <+0x8d3>
0x33f76367b70d   8cd  0f8404000000         jz 0x33f76367b717  <+0x8d7>
0x33f76367b713   8d3  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b717   8d7  c5f82ed1             vucomiss xmm2,xmm1
0x33f76367b71b   8db  0f8704000000         ja 0x33f76367b725  <+0x8e5>
0x33f76367b721   8e1  c5f928d1             vmovapd xmm2,xmm1
0x33f76367b725   8e5  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x33f76367b72b   8eb  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x33f76367b72f   8ef  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x33f76367b735   8f5  c57b2cf5             vcvttsd2si r14,xmm5
0x33f76367b739   8f9  4585f6               testl r14,r14
0x33f76367b73c   8fc  0f8927000000         jns 0x33f76367b769  <+0x929>
0x33f76367b742   902  4c8b1589f9ffff       REX.W movq r10,[rip+0xfffff989]
0x33f76367b749   909  c441f96efa           vmovq xmm15,r10
0x33f76367b74e   90e  c50358fd             vaddsd xmm15,xmm15,xmm5
0x33f76367b752   912  c4417b2cf7           vcvttsd2si r14,xmm15
0x33f76367b757   917  4585f6               testl r14,r14
0x33f76367b75a   91a  0f8809000000         js 0x33f76367b769  <+0x929>
0x33f76367b760   920  41ba00000080         movl r10,0x80000000
0x33f76367b766   926  450bf2               orl r14,r10
0x33f76367b769   929  458bd6               movl r10,r14
0x33f76367b76c   92c  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x33f76367b771   931  c5f92ef5             vucomisd xmm6,xmm5
0x33f76367b775   935  0f8a2a020000         jpe 0x33f76367b9a5  <+0xb65>
0x33f76367b77b   93b  0f8524020000         jnz 0x33f76367b9a5  <+0xb65>
0x33f76367b781   941  458bfe               movl r15,r14
0x33f76367b784   944  413bd6               cmpl rdx,r14
0x33f76367b787   947  440f42fa             cmovcl r15,rdx
0x33f76367b78b   94b  4c8bf7               REX.W movq r14,rdi
0x33f76367b78e   94e  c5f82eda             vucomiss xmm3,xmm2
0x33f76367b792   952  450f47f7             cmoval r14,r15
0x33f76367b796   956  478d3c06             leal r15,[r14+r8*1]
0x33f76367b79a   95a  413bf7               cmpl rsi,r15
0x33f76367b79d   95d  0f8625000000         jna 0x33f76367b7c8  <+0x988>
0x33f76367b7a3   963  468d3cb9             leal r15,[rcx+r15*4]
0x33f76367b7a7   967  478b343b             movl r14,[r11+r15*1]
0x33f76367b7ab   96b  413bde               cmpl rbx,r14
0x33f76367b7ae   96e  0f860c000000         jna 0x33f76367b7c0  <+0x980>
0x33f76367b7b4   974  468d34b0             leal r14,[rax+r14*4]
0x33f76367b7b8   978  47892433             movl [r11+r14*1],r12
0x33f76367b7bc   97c  478b343b             movl r14,[r11+r15*1]
0x33f76367b7c0   980  4183c601             addl r14,0x1
0x33f76367b7c4   984  4789343b             movl [r11+r15*1],r14
0x33f76367b7c8   988  4183c104             addl r9,0x4
0x33f76367b7cc   98c  448b4590             movl r8,[rbp-0x70]
0x33f76367b7d0   990  4183c004             addl r8,0x4
0x33f76367b7d4   994  4183c401             addl r12,0x1
0x33f76367b7d8   998  448b75e8             movl r14,[rbp-0x18]
0x33f76367b7dc   99c  4539e6               cmpl r14,r12
0x33f76367b7df   99f  0f855bfeffff         jnz 0x33f76367b640  <+0x800>
0x33f76367b7e5   9a5  e9e7fdffff           jmp 0x33f76367b5d1  <+0x791>
0x33f76367b7ea   9aa  e8e12cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367b7ef   9af  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b7f3   9b3  8b5d90               movl rbx,[rbp-0x70]
0x33f76367b7f6   9b6  8b5588               movl rdx,[rbp-0x78]
0x33f76367b7f9   9b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x33f76367b7ff   9bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b803   9c3  8b4580               movl rax,[rbp-0x80]
0x33f76367b806   9c6  448b4dc0             movl r9,[rbp-0x40]
0x33f76367b80a   9ca  e968f6ffff           jmp 0x33f76367ae77  <+0x37>
0x33f76367b80f   9cf  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x33f76367b816   9d6  488955b8             REX.W movq [rbp-0x48],rdx
0x33f76367b81a   9da  48894db0             REX.W movq [rbp-0x50],rcx
0x33f76367b81e   9de  4c894da8             REX.W movq [rbp-0x58],r9
0x33f76367b822   9e2  4c8945a0             REX.W movq [rbp-0x60],r8
0x33f76367b826   9e6  c5fb114598           vmovsd [rbp-0x68],xmm0
0x33f76367b82b   9eb  4c8975c0             REX.W movq [rbp-0x40],r14
0x33f76367b82f   9ef  e89c2cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367b834   9f4  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b838   9f8  33ff                 xorl rdi,rdi
0x33f76367b83a   9fa  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b83e   9fe  448b7dd0             movl r15,[rbp-0x30]
0x33f76367b842   a02  8b9d78ffffff         movl rbx,[rbp-0x88]
0x33f76367b848   a08  8b55b8               movl rdx,[rbp-0x48]
0x33f76367b84b   a0b  8b4db0               movl rcx,[rbp-0x50]
0x33f76367b84e   a0e  448b4da8             movl r9,[rbp-0x58]
0x33f76367b852   a12  448b45a0             movl r8,[rbp-0x60]
0x33f76367b856   a16  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x33f76367b85b   a1b  448b75c0             movl r14,[rbp-0x40]
0x33f76367b85f   a1f  e92af8ffff           jmp 0x33f76367b08e  <+0x24e>
0x33f76367b864   a24  c5f92edb             vucomisd xmm3,xmm3
0x33f76367b868   a28  0f8b08000000         jpo 0x33f76367b876  <+0xa36>
0x33f76367b86e   a2e  488bf7               REX.W movq rsi,rdi
0x33f76367b871   a31  e99bf8ffff           jmp 0x33f76367b111  <+0x2d1>
0x33f76367b876   a36  c5f82eca             vucomiss xmm1,xmm2
0x33f76367b87a   a3a  77f2                 ja 0x33f76367b86e  <+0xa2e>
0x33f76367b87c   a3c  beffffffff           movl rsi,0xffffffff
0x33f76367b881   a41  e98bf8ffff           jmp 0x33f76367b111  <+0x2d1>
0x33f76367b886   a46  c5f92ee4             vucomisd xmm4,xmm4
0x33f76367b88a   a4a  0f8b08000000         jpo 0x33f76367b898  <+0xa58>
0x33f76367b890   a50  488bc7               REX.W movq rax,rdi
0x33f76367b893   a53  e91cf9ffff           jmp 0x33f76367b1b4  <+0x374>
0x33f76367b898   a58  c5f82eca             vucomiss xmm1,xmm2
0x33f76367b89c   a5c  77f2                 ja 0x33f76367b890  <+0xa50>
0x33f76367b89e   a5e  b8ffffffff           movl rax,0xffffffff
0x33f76367b8a3   a63  e90cf9ffff           jmp 0x33f76367b1b4  <+0x374>
0x33f76367b8a8   a68  488955c8             REX.W movq [rbp-0x38],rdx
0x33f76367b8ac   a6c  4c897598             REX.W movq [rbp-0x68],r14
0x33f76367b8b0   a70  48895da8             REX.W movq [rbp-0x58],rbx
0x33f76367b8b4   a74  48894db0             REX.W movq [rbp-0x50],rcx
0x33f76367b8b8   a78  e8132cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367b8bd   a7d  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b8c1   a81  33ff                 xorl rdi,rdi
0x33f76367b8c3   a83  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b8c7   a87  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367b8cb   a8b  8b4580               movl rax,[rbp-0x80]
0x33f76367b8ce   a8e  448b7dd0             movl r15,[rbp-0x30]
0x33f76367b8d2   a92  448b4dc0             movl r9,[rbp-0x40]
0x33f76367b8d6   a96  8b55c8               movl rdx,[rbp-0x38]
0x33f76367b8d9   a99  448b7598             movl r14,[rbp-0x68]
0x33f76367b8dd   a9d  8b5da8               movl rbx,[rbp-0x58]
0x33f76367b8e0   aa0  8b4db0               movl rcx,[rbp-0x50]
0x33f76367b8e3   aa3  e9a2f9ffff           jmp 0x33f76367b28a  <+0x44a>
0x33f76367b8e8   aa8  488955c8             REX.W movq [rbp-0x38],rdx
0x33f76367b8ec   aac  4c8975b8             REX.W movq [rbp-0x48],r14
0x33f76367b8f0   ab0  48895da8             REX.W movq [rbp-0x58],rbx
0x33f76367b8f4   ab4  e8d72bf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367b8f9   ab9  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b8fd   abd  33ff                 xorl rdi,rdi
0x33f76367b8ff   abf  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b903   ac3  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x33f76367b907   ac7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367b90b   acb  8b4580               movl rax,[rbp-0x80]
0x33f76367b90e   ace  448b7dd0             movl r15,[rbp-0x30]
0x33f76367b912   ad2  448b4dc0             movl r9,[rbp-0x40]
0x33f76367b916   ad6  448b8578ffffff       movl r8,[rbp-0x88]
0x33f76367b91d   add  488b55c8             REX.W movq rdx,[rbp-0x38]
0x33f76367b921   ae1  448b75b8             movl r14,[rbp-0x48]
0x33f76367b925   ae5  8b5da8               movl rbx,[rbp-0x58]
0x33f76367b928   ae8  e962faffff           jmp 0x33f76367b38f  <+0x54f>
0x33f76367b92d   aed  4c8965e0             REX.W movq [rbp-0x20],r12
0x33f76367b931   af1  4c894d88             REX.W movq [rbp-0x78],r9
0x33f76367b935   af5  488945d0             REX.W movq [rbp-0x30],rax
0x33f76367b939   af9  48895dc8             REX.W movq [rbp-0x38],rbx
0x33f76367b93d   afd  48894dc0             REX.W movq [rbp-0x40],rcx
0x33f76367b941   b01  488975b8             REX.W movq [rbp-0x48],rsi
0x33f76367b945   b05  488955b0             REX.W movq [rbp-0x50],rdx
0x33f76367b949   b09  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x33f76367b94e   b0e  e87d2bf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367b953   b13  448b65e0             movl r12,[rbp-0x20]
0x33f76367b957   b17  448b4d88             movl r9,[rbp-0x78]
0x33f76367b95b   b1b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x33f76367b95f   b1f  8b45d0               movl rax,[rbp-0x30]
0x33f76367b962   b22  8b5dc8               movl rbx,[rbp-0x38]
0x33f76367b965   b25  8b4dc0               movl rcx,[rbp-0x40]
0x33f76367b968   b28  8b75b8               movl rsi,[rbp-0x48]
0x33f76367b96b   b2b  33ff                 xorl rdi,rdi
0x33f76367b96d   b2d  8b55b0               movl rdx,[rbp-0x50]
0x33f76367b970   b30  c5f057c9             vxorps xmm1,xmm1,xmm1
0x33f76367b974   b34  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x33f76367b979   b39  448b7d98             movl r15,[rbp-0x68]
0x33f76367b97d   b3d  e9d0fcffff           jmp 0x33f76367b652  <+0x812>
0x33f76367b982   b42  c5f92edb             vucomisd xmm3,xmm3
0x33f76367b986   b46  0f8b08000000         jpo 0x33f76367b994  <+0xb54>
0x33f76367b98c   b4c  4c8bf7               REX.W movq r14,rdi
0x33f76367b98f   b4f  e942fdffff           jmp 0x33f76367b6d6  <+0x896>
0x33f76367b994   b54  c5f82eca             vucomiss xmm1,xmm2
0x33f76367b998   b58  77f2                 ja 0x33f76367b98c  <+0xb4c>
0x33f76367b99a   b5a  41beffffffff         movl r14,0xffffffff
0x33f76367b9a0   b60  e931fdffff           jmp 0x33f76367b6d6  <+0x896>
0x33f76367b9a5   b65  c5f92ee4             vucomisd xmm4,xmm4
0x33f76367b9a9   b69  0f8b08000000         jpo 0x33f76367b9b7  <+0xb77>
0x33f76367b9af   b6f  4c8bf7               REX.W movq r14,rdi
0x33f76367b9b2   b72  e9cafdffff           jmp 0x33f76367b781  <+0x941>
0x33f76367b9b7   b77  c5f82eca             vucomiss xmm1,xmm2
0x33f76367b9bb   b7b  77f2                 ja 0x33f76367b9af  <+0xb6f>
0x33f76367b9bd   b7d  41beffffffff         movl r14,0xffffffff
0x33f76367b9c3   b83  e9b9fdffff           jmp 0x33f76367b781  <+0x941>
0x33f76367b9c8   b88  e84328f2ff           call 0x33f76359e210  (jump table)
0x33f76367b9cd   b8d  e83e28f2ff           call 0x33f76359e210  (jump table)
0x33f76367b9d2   b92  e83928f2ff           call 0x33f76359e210  (jump table)
0x33f76367b9d7   b97  90                   nop

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
0x33f76367aece     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x33f76367aeca  internal wasm call
0x33f76367af55  external reference (0x193f2f0)
0x33f76367b3c7  internal wasm call
0x33f76367b43f  external reference (0x193f270)
0x33f76367b4d6  internal wasm call
0x33f76367b7eb  wasm stub call  (0x33f76359e4d0)
0x33f76367b830  wasm stub call  (0x33f76359e4d0)
0x33f76367b8b9  wasm stub call  (0x33f76359e4d0)
0x33f76367b8f5  wasm stub call  (0x33f76359e4d0)
0x33f76367b94f  wasm stub call  (0x33f76359e4d0)
0x33f76367b9c9  wasm stub call  (0x33f76359e210)
0x33f76367b9ce  wasm stub call  (0x33f76359e210)
0x33f76367b9d3  wasm stub call  (0x33f76359e210)
