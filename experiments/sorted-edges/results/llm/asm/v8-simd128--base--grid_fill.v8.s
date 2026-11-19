name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2984 + 24 padding)
Instructions (size = 2968)
0x20220d926900     0  55                   push rbp
0x20220d926901     1  4889e5               REX.W movq rbp,rsp
0x20220d926904     4  6a08                 push 0x8
0x20220d926906     6  56                   push rsi
0x20220d926907     7  4881ec80000000       REX.W subq rsp,0x80
0x20220d92690e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x20220d926912    12  48894580             REX.W movq [rbp-0x80],rax
0x20220d926916    16  48895588             REX.W movq [rbp-0x78],rdx
0x20220d92691a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x20220d926921    21  48895d90             REX.W movq [rbp-0x70],rbx
0x20220d926925    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x20220d926929    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x20220d92692d    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d926931    31  0f8673090000         jna 0x20220d9272aa  <+0x9aa>
0x20220d926937    37  448be0               movl r12,rax
0x20220d92693a    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x20220d926943    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x20220d926948    48  478b742328           movl r14,[r11+r12*1+0x28]
0x20220d92694d    4d  450faff7             imull r14,r15
0x20220d926951    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x20220d926955    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x20220d926959    59  4d8bfe               REX.W movq r15,r14
0x20220d92695c    5c  4183c701             addl r15,0x1
0x20220d926960    60  0f850c000000         jnz 0x20220d926972  <+0x72>
0x20220d926966    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x20220d92696a    6a  4533ff               xorl r15,r15
0x20220d92696d    6d  e928010000           jmp 0x20220d926a9a  <+0x19a>
0x20220d926972    72  438b3c23             movl rdi,[r11+r12*1]
0x20220d926976    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x20220d92697a    7a  47393c23             cmpl [r11+r12*1],r15
0x20220d92697e    7e  0f8341000000         jnc 0x20220d9269c5  <+0xc5>
0x20220d926984    84  498bcf               REX.W movq rcx,r15
0x20220d926987    87  33d2                 xorl rdx,rdx
0x20220d926989    89  e87263f2ff           call 0x20220d84cd00  (jump table)
0x20220d92698e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x20220d926992    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x20220d926996    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x20220d92699b    9b  4489e7               movl rdi,r12
0x20220d92699e    9e  4d8be3               REX.W movq r12,r11
0x20220d9269a1    a1  4c8bdb               REX.W movq r11,rbx
0x20220d9269a4    a4  8b5588               movl rdx,[rbp-0x78]
0x20220d9269a7    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d9269ad    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d9269b1    b1  8b4580               movl rax,[rbp-0x80]
0x20220d9269b4    b4  448b4dc0             movl r9,[rbp-0x40]
0x20220d9269b8    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x20220d9269bc    bc  448b75b0             movl r14,[rbp-0x50]
0x20220d9269c0    c0  e902000000           jmp 0x20220d9269c7  <+0xc7>
0x20220d9269c5    c5  33ff                 xorl rdi,rdi
0x20220d9269c7    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x20220d9269cc    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x20220d9269d0    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x20220d9269d4    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x20220d9269d8    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x20220d9269dc    dc  4585f6               testl r14,r14
0x20220d9269df    df  0f84a4000000         jz 0x20220d926a89  <+0x189>
0x20220d9269e5    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x20220d9269ed    ed  83c3fc               addl rbx,0xfc
0x20220d9269f0    f0  0f8480000000         jz 0x20220d926a76  <+0x176>
0x20220d9269f6    f6  4989e2               REX.W movq r10,rsp
0x20220d9269f9    f9  4883ec08             REX.W subq rsp,0x8
0x20220d9269fd    fd  4883e4f0             REX.W andq rsp,0xf0
0x20220d926a01   101  4c891424             REX.W movq [rsp],r10
0x20220d926a05   105  488bfe               REX.W movq rdi,rsi
0x20220d926a08   108  4c8bc3               REX.W movq r8,rbx
0x20220d926a0b   10b  8b55e8               movl rdx,[rbp-0x18]
0x20220d926a0e   10e  33c9                 xorl rcx,rcx
0x20220d926a10   110  488bf1               REX.W movq rsi,rcx
0x20220d926a13   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x20220d926a1d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x20220d926a24   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x20220d926a2b   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x20220d926a32   132  ffd0                 call rax
0x20220d926a34   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x20220d926a3f   13f  488b2424             REX.W movq rsp,[rsp]
0x20220d926a43   143  85c0                 testl rax,rax
0x20220d926a45   145  0f84470a0000         jz 0x20220d927492  <+0xb92>
0x20220d926a4b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d926a4f   14f  8b5588               movl rdx,[rbp-0x78]
0x20220d926a52   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d926a56   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d926a5c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926a60   160  8b4580               movl rax,[rbp-0x80]
0x20220d926a63   163  448b4dc0             movl r9,[rbp-0x40]
0x20220d926a67   167  8b7db8               movl rdi,[rbp-0x48]
0x20220d926a6a   16a  448b45c8             movl r8,[rbp-0x38]
0x20220d926a6e   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x20220d926a72   172  448b75b0             movl r14,[rbp-0x50]
0x20220d926a76   176  8bdf                 movl rbx,rdi
0x20220d926a78   178  4403f3               addl r14,rbx
0x20220d926a7b   17b  4103df               addl rbx,r15
0x20220d926a7e   17e  458bf8               movl r15,r8
0x20220d926a81   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x20220d926a86   186  418bfe               movl rdi,r14
0x20220d926a89   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x20220d926a91   191  8d5f01               leal rbx,[rdi+0x1]
0x20220d926a94   194  448bfb               movl r15,rbx
0x20220d926a97   197  8b5d90               movl rbx,[rbp-0x70]
0x20220d926a9a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x20220d926a9f   19f  458bc1               movl r8,r9
0x20220d926aa2   1a2  448bf1               movl r14,rcx
0x20220d926aa5   1a5  443bc1               cmpl r8,rcx
0x20220d926aa8   1a8  450f42f0             cmovcl r14,r8
0x20220d926aac   1ac  33ff                 xorl rdi,rdi
0x20220d926aae   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x20220d926ab2   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x20220d926ab6   1b6  4585f6               testl r14,r14
0x20220d926ab9   1b9  0f850e000000         jnz 0x20220d926acd  <+0x1cd>
0x20220d926abf   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x20220d926ac4   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d926ac8   1c8  e910020000           jmp 0x20220d926cdd  <+0x3dd>
0x20220d926acd   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x20220d926ad2   1d2  4533c9               xorl r9,r9
0x20220d926ad5   1d5  4585c0               testl r8,r8
0x20220d926ad8   1d8  410f95c1             setnzl r9l
0x20220d926adc   1dc  452bc1               subl r8,r9
0x20220d926adf   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x20220d926ae4   1e4  33db                 xorl rbx,rbx
0x20220d926ae6   1e6  4585c9               testl r9,r9
0x20220d926ae9   1e9  0f95c3               setnzl bl
0x20220d926aec   1ec  458bf1               movl r14,r9
0x20220d926aef   1ef  442bf3               subl r14,rbx
0x20220d926af2   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x20220d926af7   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x20220d926afe   1fe  448b55e8             movl r10,[rbp-0x18]
0x20220d926b02   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x20220d926b06   206  8bca                 movl rcx,rdx
0x20220d926b08   208  8b5590               movl rdx,[rbp-0x70]
0x20220d926b0b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d926b0f   20f  e930000000           jmp 0x20220d926b44  <+0x244>
0x20220d926b14   214  660f1f840000000000   nop
0x20220d926b1d   21d  660f1f840000000000   nop
0x20220d926b26   226  660f1f840000000000   nop
0x20220d926b2f   22f  660f1f840000000000   nop
0x20220d926b38   238  0f1f840000000000     nop
0x20220d926b40   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x20220d926b44   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d926b48   248  0f8681070000         jna 0x20220d9272cf  <+0x9cf>
0x20220d926b4e   24e  8bf1                 movl rsi,rcx
0x20220d926b50   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x20220d926b56   256  c5f82ed2             vucomiss xmm2,xmm2
0x20220d926b5a   25a  7a06                 jpe 0x20220d926b62  <+0x262>
0x20220d926b5c   25c  0f8404000000         jz 0x20220d926b66  <+0x266>
0x20220d926b62   262  c5f928d1             vmovapd xmm2,xmm1
0x20220d926b66   266  c5f82ed1             vucomiss xmm2,xmm1
0x20220d926b6a   26a  0f8704000000         ja 0x20220d926b74  <+0x274>
0x20220d926b70   270  c5f928d1             vmovapd xmm2,xmm1
0x20220d926b74   274  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x20220d926b7a   27a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x20220d926b7e   27e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x20220d926b84   284  c5fb2cf4             vcvttsd2si rsi,xmm4
0x20220d926b88   288  85f6                 testl rsi,rsi
0x20220d926b8a   28a  0f8929000000         jns 0x20220d926bb9  <+0x2b9>
0x20220d926b90   290  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x20220d926b9a   29a  c441f96efa           vmovq xmm15,r10
0x20220d926b9f   29f  c50358fc             vaddsd xmm15,xmm15,xmm4
0x20220d926ba3   2a3  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x20220d926ba8   2a8  85f6                 testl rsi,rsi
0x20220d926baa   2aa  0f8809000000         js 0x20220d926bb9  <+0x2b9>
0x20220d926bb0   2b0  41ba00000080         movl r10,0x80000000
0x20220d926bb6   2b6  410bf2               orl rsi,r10
0x20220d926bb9   2b9  448bd6               movl r10,rsi
0x20220d926bbc   2bc  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x20220d926bc1   2c1  c5f92eec             vucomisd xmm5,xmm4
0x20220d926bc5   2c5  0f8a59070000         jpe 0x20220d927324  <+0xa24>
0x20220d926bcb   2cb  0f8553070000         jnz 0x20220d927324  <+0xa24>
0x20220d926bd1   2d1  8bc6                 movl rax,rsi
0x20220d926bd3   2d3  443bf6               cmpl r14,rsi
0x20220d926bd6   2d6  410f42c6             cmovcl rax,r14
0x20220d926bda   2da  83c001               addl rax,0x1
0x20220d926bdd   2dd  41ba0000804f         movl r10,0x4f800000
0x20220d926be3   2e3  c4c1796eda           vmovd xmm3,r10
0x20220d926be8   2e8  be01000000           movl rsi,0x1
0x20220d926bed   2ed  c5f82eda             vucomiss xmm3,xmm2
0x20220d926bf1   2f1  0f47f0               cmoval rsi,rax
0x20220d926bf4   2f4  8bc2                 movl rax,rdx
0x20220d926bf6   2f6  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x20220d926bfc   2fc  c5f82ed2             vucomiss xmm2,xmm2
0x20220d926c00   300  7a06                 jpe 0x20220d926c08  <+0x308>
0x20220d926c02   302  0f8404000000         jz 0x20220d926c0c  <+0x30c>
0x20220d926c08   308  c5f928d1             vmovapd xmm2,xmm1
0x20220d926c0c   30c  c5f82ed1             vucomiss xmm2,xmm1
0x20220d926c10   310  0f8704000000         ja 0x20220d926c1a  <+0x31a>
0x20220d926c16   316  c5f928d1             vmovapd xmm2,xmm1
0x20220d926c1a   31a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x20220d926c20   320  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x20220d926c24   324  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x20220d926c2a   32a  c5fb2cc5             vcvttsd2si rax,xmm5
0x20220d926c2e   32e  85c0                 testl rax,rax
0x20220d926c30   330  0f8926000000         jns 0x20220d926c5c  <+0x35c>
0x20220d926c36   336  4c8b1555ffffff       REX.W movq r10,[rip+0xffffff55]
0x20220d926c3d   33d  c441f96efa           vmovq xmm15,r10
0x20220d926c42   342  c50358fd             vaddsd xmm15,xmm15,xmm5
0x20220d926c46   346  c4c17b2cc7           vcvttsd2si rax,xmm15
0x20220d926c4b   34b  85c0                 testl rax,rax
0x20220d926c4d   34d  0f8809000000         js 0x20220d926c5c  <+0x35c>
0x20220d926c53   353  41ba00000080         movl r10,0x80000000
0x20220d926c59   359  410bc2               orl rax,r10
0x20220d926c5c   35c  448bd0               movl r10,rax
0x20220d926c5f   35f  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x20220d926c64   364  c5f92ef5             vucomisd xmm6,xmm5
0x20220d926c68   368  0f8ad8060000         jpe 0x20220d927346  <+0xa46>
0x20220d926c6e   36e  0f85d2060000         jnz 0x20220d927346  <+0xa46>
0x20220d926c74   374  448be0               movl r12,rax
0x20220d926c77   377  443bc0               cmpl r8,rax
0x20220d926c7a   37a  450f42e0             cmovcl r12,r8
0x20220d926c7e   37e  488bc7               REX.W movq rax,rdi
0x20220d926c81   381  c5f82eda             vucomiss xmm3,xmm2
0x20220d926c85   385  410f47c4             cmoval rax,r12
0x20220d926c89   389  458be1               movl r12,r9
0x20220d926c8c   38c  440fafe0             imull r12,rax
0x20220d926c90   390  4403e6               addl r12,rsi
0x20220d926c93   393  4539e7               cmpl r15,r12
0x20220d926c96   396  0f860f000000         jna 0x20220d926cab  <+0x3ab>
0x20220d926c9c   39c  468d24a3             leal r12,[rbx+r12*4]
0x20220d926ca0   3a0  438b0423             movl rax,[r11+r12*1]
0x20220d926ca4   3a4  83c001               addl rax,0x1
0x20220d926ca7   3a7  43890423             movl [r11+r12*1],rax
0x20220d926cab   3ab  83c104               addl rcx,0x4
0x20220d926cae   3ae  83c204               addl rdx,0x4
0x20220d926cb1   3b1  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x20220d926cb5   3b5  4183c4ff             addl r12,0xff
0x20220d926cb9   3b9  0f8581feffff         jnz 0x20220d926b40  <+0x240>
0x20220d926cbf   3bf  448bc3               movl r8,rbx
0x20220d926cc2   3c2  448b75e8             movl r14,[rbp-0x18]
0x20220d926cc6   3c6  8b5d90               movl rbx,[rbp-0x70]
0x20220d926cc9   3c9  8b5588               movl rdx,[rbp-0x78]
0x20220d926ccc   3cc  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d926cd0   3d0  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d926cd6   3d6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926cda   3da  8b4580               movl rax,[rbp-0x80]
0x20220d926cdd   3dd  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x20220d926ce4   3e4  4585ff               testl r15,r15
0x20220d926ce7   3e7  0f8508000000         jnz 0x20220d926cf5  <+0x3f5>
0x20220d926ced   3ed  488bdf               REX.W movq rbx,rdi
0x20220d926cf0   3f0  e95c020000           jmp 0x20220d926f51  <+0x651>
0x20220d926cf5   3f5  468d0cbd00000000     leal r9,[r15*4+0x0]
0x20220d926cfd   3fd  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x20220d926d05   405  448bf3               movl r14,rbx
0x20220d926d08   408  41c1ee02             shrl r14, 2
0x20220d926d0c   40c  4183c601             addl r14,0x1
0x20220d926d10   410  418bd6               movl rdx,r14
0x20220d926d13   413  83e207               andl rdx,0x7
0x20220d926d16   416  4c894dc0             REX.W movq [rbp-0x40],r9
0x20220d926d1a   41a  83fb1c               cmpl rbx,0x1c
0x20220d926d1d   41d  0f82cf000000         jc 0x20220d926df2  <+0x4f2>
0x20220d926d23   423  4181e6f8ffff7f       andl r14,0x7ffffff8
0x20220d926d2a   42a  418bd8               movl rbx,r8
0x20220d926d2d   42d  488bcf               REX.W movq rcx,rdi
0x20220d926d30   430  660f1f840000000000   nop
0x20220d926d39   439  0f1f8000000000       nop
0x20220d926d40   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d926d44   444  0f861e060000         jna 0x20220d927368  <+0xa68>
0x20220d926d4a   44a  418b341b             movl rsi,[r11+rbx*1]
0x20220d926d4e   44e  03ce                 addl rcx,rsi
0x20220d926d50   450  41890c1b             movl [r11+rbx*1],rcx
0x20220d926d54   454  8d7304               leal rsi,[rbx+0x4]
0x20220d926d57   457  458b0433             movl r8,[r11+rsi*1]
0x20220d926d5b   45b  4103c8               addl rcx,r8
0x20220d926d5e   45e  41890c33             movl [r11+rsi*1],rcx
0x20220d926d62   462  8d7308               leal rsi,[rbx+0x8]
0x20220d926d65   465  458b0433             movl r8,[r11+rsi*1]
0x20220d926d69   469  4103c8               addl rcx,r8
0x20220d926d6c   46c  41890c33             movl [r11+rsi*1],rcx
0x20220d926d70   470  8d730c               leal rsi,[rbx+0xc]
0x20220d926d73   473  458b0433             movl r8,[r11+rsi*1]
0x20220d926d77   477  4103c8               addl rcx,r8
0x20220d926d7a   47a  41890c33             movl [r11+rsi*1],rcx
0x20220d926d7e   47e  8d7310               leal rsi,[rbx+0x10]
0x20220d926d81   481  458b0433             movl r8,[r11+rsi*1]
0x20220d926d85   485  4103c8               addl rcx,r8
0x20220d926d88   488  41890c33             movl [r11+rsi*1],rcx
0x20220d926d8c   48c  8d7314               leal rsi,[rbx+0x14]
0x20220d926d8f   48f  458b0433             movl r8,[r11+rsi*1]
0x20220d926d93   493  4103c8               addl rcx,r8
0x20220d926d96   496  41890c33             movl [r11+rsi*1],rcx
0x20220d926d9a   49a  8d7318               leal rsi,[rbx+0x18]
0x20220d926d9d   49d  458b0433             movl r8,[r11+rsi*1]
0x20220d926da1   4a1  4103c8               addl rcx,r8
0x20220d926da4   4a4  41890c33             movl [r11+rsi*1],rcx
0x20220d926da8   4a8  8d731c               leal rsi,[rbx+0x1c]
0x20220d926dab   4ab  458b0433             movl r8,[r11+rsi*1]
0x20220d926daf   4af  4103c8               addl rcx,r8
0x20220d926db2   4b2  41890c33             movl [r11+rsi*1],rcx
0x20220d926db6   4b6  83c320               addl rbx,0x20
0x20220d926db9   4b9  4183c6f8             addl r14,0xf8
0x20220d926dbd   4bd  7581                 jnz 0x20220d926d40  <+0x440>
0x20220d926dbf   4bf  85d2                 testl rdx,rdx
0x20220d926dc1   4c1  0f8510000000         jnz 0x20220d926dd7  <+0x4d7>
0x20220d926dc7   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926dcb   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x20220d926dd2   4d2  e98b000000           jmp 0x20220d926e62  <+0x562>
0x20220d926dd7   4d7  448bf3               movl r14,rbx
0x20220d926dda   4da  8bd9                 movl rbx,rcx
0x20220d926ddc   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d926de2   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926de6   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x20220d926ded   4ed  e906000000           jmp 0x20220d926df8  <+0x4f8>
0x20220d926df2   4f2  488bdf               REX.W movq rbx,rdi
0x20220d926df5   4f5  458bf0               movl r14,r8
0x20220d926df8   4f8  c1e202               shll rdx, 2
0x20220d926dfb   4fb  0f1f440000           nop
0x20220d926e00   500  438b0c33             movl rcx,[r11+r14*1]
0x20220d926e04   504  03d9                 addl rbx,rcx
0x20220d926e06   506  43891c33             movl [r11+r14*1],rbx
0x20220d926e0a   50a  4183c604             addl r14,0x4
0x20220d926e0e   50e  83c2fc               addl rdx,0xfc
0x20220d926e11   511  0f844b000000         jz 0x20220d926e62  <+0x562>
0x20220d926e17   517  438b0c33             movl rcx,[r11+r14*1]
0x20220d926e1b   51b  03d9                 addl rbx,rcx
0x20220d926e1d   51d  43891c33             movl [r11+r14*1],rbx
0x20220d926e21   521  4183c604             addl r14,0x4
0x20220d926e25   525  83c2fc               addl rdx,0xfc
0x20220d926e28   528  0f8434000000         jz 0x20220d926e62  <+0x562>
0x20220d926e2e   52e  438b0c33             movl rcx,[r11+r14*1]
0x20220d926e32   532  03d9                 addl rbx,rcx
0x20220d926e34   534  43891c33             movl [r11+r14*1],rbx
0x20220d926e38   538  4183c604             addl r14,0x4
0x20220d926e3c   53c  83c2fc               addl rdx,0xfc
0x20220d926e3f   53f  0f841d000000         jz 0x20220d926e62  <+0x562>
0x20220d926e45   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d926e49   549  0f8659050000         jna 0x20220d9273a8  <+0xaa8>
0x20220d926e4f   54f  438b0c33             movl rcx,[r11+r14*1]
0x20220d926e53   553  03d9                 addl rbx,rcx
0x20220d926e55   555  43891c33             movl [r11+r14*1],rbx
0x20220d926e59   559  4183c604             addl r14,0x4
0x20220d926e5d   55d  83c2fc               addl rdx,0xfc
0x20220d926e60   560  759e                 jnz 0x20220d926e00  <+0x500>
0x20220d926e62   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x20220d926e6b   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x20220d926e70   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x20220d926e75   575  0f834a000000         jnc 0x20220d926ec5  <+0x5c5>
0x20220d926e7b   57b  8bd8                 movl rbx,rax
0x20220d926e7d   57d  8d430c               leal rax,[rbx+0xc]
0x20220d926e80   580  418bcf               movl rcx,r15
0x20220d926e83   583  488bd7               REX.W movq rdx,rdi
0x20220d926e86   586  e8755ef2ff           call 0x20220d84cd00  (jump table)
0x20220d926e8b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x20220d926e8f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x20220d926e93   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x20220d926e98   598  4c8bd3               REX.W movq r10,rbx
0x20220d926e9b   59b  4489e3               movl rbx,r12
0x20220d926e9e   59e  4d8be3               REX.W movq r12,r11
0x20220d926ea1   5a1  4d8bda               REX.W movq r11,r10
0x20220d926ea4   5a4  33ff                 xorl rdi,rdi
0x20220d926ea6   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d926eaa   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926eae   5ae  8b4580               movl rax,[rbp-0x80]
0x20220d926eb1   5b1  448b7dd0             movl r15,[rbp-0x30]
0x20220d926eb5   5b5  448b4dc0             movl r9,[rbp-0x40]
0x20220d926eb9   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x20220d926ec0   5c0  e903000000           jmp 0x20220d926ec8  <+0x5c8>
0x20220d926ec5   5c5  488bdf               REX.W movq rbx,rdi
0x20220d926ec8   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x20220d926ecc   5cc  4d8bf7               REX.W movq r14,r15
0x20220d926ecf   5cf  41c1e602             shll r14, 2
0x20220d926ed3   5d3  0f8478000000         jz 0x20220d926f51  <+0x651>
0x20220d926ed9   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x20220d926ede   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x20220d926ee2   5e2  4989e2               REX.W movq r10,rsp
0x20220d926ee5   5e5  4883ec08             REX.W subq rsp,0x8
0x20220d926ee9   5e9  4883e4f0             REX.W andq rsp,0xf0
0x20220d926eed   5ed  4c891424             REX.W movq [rsp],r10
0x20220d926ef1   5f1  488bd7               REX.W movq rdx,rdi
0x20220d926ef4   5f4  4c8bd7               REX.W movq r10,rdi
0x20220d926ef7   5f7  488bfe               REX.W movq rdi,rsi
0x20220d926efa   5fa  498bf2               REX.W movq rsi,r10
0x20220d926efd   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x20220d926f07   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x20220d926f0e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x20220d926f15   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x20220d926f1c   61c  ffd0                 call rax
0x20220d926f1e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x20220d926f29   629  488b2424             REX.W movq rsp,[rsp]
0x20220d926f2d   62d  85c0                 testl rax,rax
0x20220d926f2f   62f  0f8458050000         jz 0x20220d92748d  <+0xb8d>
0x20220d926f35   635  8b5dc8               movl rbx,[rbp-0x38]
0x20220d926f38   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d926f3c   63c  33ff                 xorl rdi,rdi
0x20220d926f3e   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d926f42   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d926f46   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926f4a   64a  8b4580               movl rax,[rbp-0x80]
0x20220d926f4d   64d  448b7dd0             movl r15,[rbp-0x30]
0x20220d926f51   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x20220d926f5a   65a  4103df               addl rbx,r15
0x20220d926f5d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x20220d926f62   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x20220d926f69   669  0f8508000000         jnz 0x20220d926f77  <+0x677>
0x20220d926f6f   66f  488bdf               REX.W movq rbx,rdi
0x20220d926f72   672  e90b010000           jmp 0x20220d927082  <+0x782>
0x20220d926f77   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x20220d926f7c   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d926f82   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x20220d926f87   687  0f833b000000         jnc 0x20220d926fc8  <+0x6c8>
0x20220d926f8d   68d  8bd8                 movl rbx,rax
0x20220d926f8f   68f  8d4318               leal rax,[rbx+0x18]
0x20220d926f92   692  488bd7               REX.W movq rdx,rdi
0x20220d926f95   695  e8665df2ff           call 0x20220d84cd00  (jump table)
0x20220d926f9a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x20220d926f9e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x20220d926fa2   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x20220d926fa7   6a7  4c8bd3               REX.W movq r10,rbx
0x20220d926faa   6aa  4489e3               movl rbx,r12
0x20220d926fad   6ad  4d8be3               REX.W movq r12,r11
0x20220d926fb0   6b0  4d8bda               REX.W movq r11,r10
0x20220d926fb3   6b3  33ff                 xorl rdi,rdi
0x20220d926fb5   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d926fb9   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d926fbf   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926fc3   6c3  e903000000           jmp 0x20220d926fcb  <+0x6cb>
0x20220d926fc8   6c8  488bdf               REX.W movq rbx,rdi
0x20220d926fcb   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x20220d926fd0   6d0  418d149f             leal rdx,[r15+rbx*4]
0x20220d926fd4   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x20220d926fd8   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x20220d926fdc   6dc  83f901               cmpl rcx,0x1
0x20220d926fdf   6df  0f8492000000         jz 0x20220d927077  <+0x777>
0x20220d926fe5   6e5  448bf1               movl r14,rcx
0x20220d926fe8   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x20220d926ff0   6f0  83c0fc               addl rax,0xfc
0x20220d926ff3   6f3  0f846f000000         jz 0x20220d927068  <+0x768>
0x20220d926ff9   6f9  4989e2               REX.W movq r10,rsp
0x20220d926ffc   6fc  4883ec08             REX.W subq rsp,0x8
0x20220d927000   700  4883e4f0             REX.W andq rsp,0xf0
0x20220d927004   704  4c891424             REX.W movq [rsp],r10
0x20220d927008   708  488bcf               REX.W movq rcx,rdi
0x20220d92700b   70b  4c8bd7               REX.W movq r10,rdi
0x20220d92700e   70e  488bfe               REX.W movq rdi,rsi
0x20220d927011   711  498bf2               REX.W movq rsi,r10
0x20220d927014   714  4c8bc0               REX.W movq r8,rax
0x20220d927017   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x20220d92701e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x20220d927025   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x20220d92702c   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x20220d927033   733  ffd0                 call rax
0x20220d927035   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x20220d927040   740  488b2424             REX.W movq rsp,[rsp]
0x20220d927044   744  85c0                 testl rax,rax
0x20220d927046   746  0f843c040000         jz 0x20220d927488  <+0xb88>
0x20220d92704c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d927050   750  33ff                 xorl rdi,rdi
0x20220d927052   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d927056   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d92705a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x20220d92705d   75d  448b7dc8             movl r15,[rbp-0x38]
0x20220d927061   761  448bb570ffffff       movl r14,[rbp-0x90]
0x20220d927068   768  4103de               addl rbx,r14
0x20220d92706b   76b  448d73ff             leal r14,[rbx-0x1]
0x20220d92706f   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x20220d927074   774  418bde               movl rbx,r14
0x20220d927077   777  41c7041300000000     movl [r11+rdx*1],0x0
0x20220d92707f   77f  83c301               addl rbx,0x1
0x20220d927082   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x20220d927087   787  837de800             cmpl [rbp-0x18],0x0
0x20220d92708b   78b  0f8505000000         jnz 0x20220d927096  <+0x796>
0x20220d927091   791  488be5               REX.W movq rsp,rbp
0x20220d927094   794  5d                   pop rbp
0x20220d927095   795  c3                   retl
0x20220d927096   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x20220d92709b   79b  4533f6               xorl r14,r14
0x20220d92709e   79e  4585ff               testl r15,r15
0x20220d9270a1   7a1  410f95c6             setnzl r14l
0x20220d9270a5   7a5  452bfe               subl r15,r14
0x20220d9270a8   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x20220d9270ad   7ad  33c0                 xorl rax,rax
0x20220d9270af   7af  4585f6               testl r14,r14
0x20220d9270b2   7b2  0f95c0               setnzl al
0x20220d9270b5   7b5  418bd6               movl rdx,r14
0x20220d9270b8   7b8  2bd0                 subl rdx,rax
0x20220d9270ba   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x20220d9270bf   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x20220d9270c4   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x20220d9270c9   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x20220d9270d0   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x20220d9270d4   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x20220d9270d8   7d8  4c8be7               REX.W movq r12,rdi
0x20220d9270db   7db  448b4d88             movl r9,[rbp-0x78]
0x20220d9270df   7df  e924000000           jmp 0x20220d927108  <+0x808>
0x20220d9270e4   7e4  660f1f840000000000   nop
0x20220d9270ed   7ed  660f1f840000000000   nop
0x20220d9270f6   7f6  660f1f840000000000   nop
0x20220d9270ff   7ff  90                   nop
0x20220d927100   800  448b7d98             movl r15,[rbp-0x68]
0x20220d927104   804  4c894590             REX.W movq [rbp-0x70],r8
0x20220d927108   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d92710c   80c  0f86db020000         jna 0x20220d9273ed  <+0xaed>
0x20220d927112   812  448b7590             movl r14,[rbp-0x70]
0x20220d927116   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x20220d92711c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x20220d927120   820  7a06                 jpe 0x20220d927128  <+0x828>
0x20220d927122   822  0f8404000000         jz 0x20220d92712c  <+0x82c>
0x20220d927128   828  c5f928d1             vmovapd xmm2,xmm1
0x20220d92712c   82c  c5f82ed1             vucomiss xmm2,xmm1
0x20220d927130   830  0f8704000000         ja 0x20220d92713a  <+0x83a>
0x20220d927136   836  c5f928d1             vmovapd xmm2,xmm1
0x20220d92713a   83a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x20220d927140   840  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x20220d927144   844  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x20220d92714a   84a  c57b2cf4             vcvttsd2si r14,xmm4
0x20220d92714e   84e  4585f6               testl r14,r14
0x20220d927151   851  0f8927000000         jns 0x20220d92717e  <+0x87e>
0x20220d927157   857  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x20220d92715e   85e  c441f96efa           vmovq xmm15,r10
0x20220d927163   863  c50358fc             vaddsd xmm15,xmm15,xmm4
0x20220d927167   867  c4417b2cf7           vcvttsd2si r14,xmm15
0x20220d92716c   86c  4585f6               testl r14,r14
0x20220d92716f   86f  0f8809000000         js 0x20220d92717e  <+0x87e>
0x20220d927175   875  41ba00000080         movl r10,0x80000000
0x20220d92717b   87b  450bf2               orl r14,r10
0x20220d92717e   87e  458bd6               movl r10,r14
0x20220d927181   881  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x20220d927186   886  c5f92eec             vucomisd xmm5,xmm4
0x20220d92718a   88a  0f8ab2020000         jpe 0x20220d927442  <+0xb42>
0x20220d927190   890  0f85ac020000         jnz 0x20220d927442  <+0xb42>
0x20220d927196   896  458bc6               movl r8,r14
0x20220d927199   899  453bfe               cmpl r15,r14
0x20220d92719c   89c  450f42c7             cmovcl r8,r15
0x20220d9271a0   8a0  41ba0000804f         movl r10,0x4f800000
0x20220d9271a6   8a6  c4c1796eda           vmovd xmm3,r10
0x20220d9271ab   8ab  4c8bf7               REX.W movq r14,rdi
0x20220d9271ae   8ae  c5f82eda             vucomiss xmm3,xmm2
0x20220d9271b2   8b2  450f47f0             cmoval r14,r8
0x20220d9271b6   8b6  448b45a0             movl r8,[rbp-0x60]
0x20220d9271ba   8ba  450fafc6             imull r8,r14
0x20220d9271be   8be  458bf1               movl r14,r9
0x20220d9271c1   8c1  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x20220d9271c7   8c7  c5f82ed2             vucomiss xmm2,xmm2
0x20220d9271cb   8cb  7a06                 jpe 0x20220d9271d3  <+0x8d3>
0x20220d9271cd   8cd  0f8404000000         jz 0x20220d9271d7  <+0x8d7>
0x20220d9271d3   8d3  c5f928d1             vmovapd xmm2,xmm1
0x20220d9271d7   8d7  c5f82ed1             vucomiss xmm2,xmm1
0x20220d9271db   8db  0f8704000000         ja 0x20220d9271e5  <+0x8e5>
0x20220d9271e1   8e1  c5f928d1             vmovapd xmm2,xmm1
0x20220d9271e5   8e5  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x20220d9271eb   8eb  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x20220d9271ef   8ef  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x20220d9271f5   8f5  c57b2cf5             vcvttsd2si r14,xmm5
0x20220d9271f9   8f9  4585f6               testl r14,r14
0x20220d9271fc   8fc  0f8927000000         jns 0x20220d927229  <+0x929>
0x20220d927202   902  4c8b1589f9ffff       REX.W movq r10,[rip+0xfffff989]
0x20220d927209   909  c441f96efa           vmovq xmm15,r10
0x20220d92720e   90e  c50358fd             vaddsd xmm15,xmm15,xmm5
0x20220d927212   912  c4417b2cf7           vcvttsd2si r14,xmm15
0x20220d927217   917  4585f6               testl r14,r14
0x20220d92721a   91a  0f8809000000         js 0x20220d927229  <+0x929>
0x20220d927220   920  41ba00000080         movl r10,0x80000000
0x20220d927226   926  450bf2               orl r14,r10
0x20220d927229   929  458bd6               movl r10,r14
0x20220d92722c   92c  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x20220d927231   931  c5f92ef5             vucomisd xmm6,xmm5
0x20220d927235   935  0f8a2a020000         jpe 0x20220d927465  <+0xb65>
0x20220d92723b   93b  0f8524020000         jnz 0x20220d927465  <+0xb65>
0x20220d927241   941  458bfe               movl r15,r14
0x20220d927244   944  413bd6               cmpl rdx,r14
0x20220d927247   947  440f42fa             cmovcl r15,rdx
0x20220d92724b   94b  4c8bf7               REX.W movq r14,rdi
0x20220d92724e   94e  c5f82eda             vucomiss xmm3,xmm2
0x20220d927252   952  450f47f7             cmoval r14,r15
0x20220d927256   956  478d3c06             leal r15,[r14+r8*1]
0x20220d92725a   95a  413bf7               cmpl rsi,r15
0x20220d92725d   95d  0f8625000000         jna 0x20220d927288  <+0x988>
0x20220d927263   963  468d3cb9             leal r15,[rcx+r15*4]
0x20220d927267   967  478b343b             movl r14,[r11+r15*1]
0x20220d92726b   96b  413bde               cmpl rbx,r14
0x20220d92726e   96e  0f860c000000         jna 0x20220d927280  <+0x980>
0x20220d927274   974  468d34b0             leal r14,[rax+r14*4]
0x20220d927278   978  47892433             movl [r11+r14*1],r12
0x20220d92727c   97c  478b343b             movl r14,[r11+r15*1]
0x20220d927280   980  4183c601             addl r14,0x1
0x20220d927284   984  4789343b             movl [r11+r15*1],r14
0x20220d927288   988  4183c104             addl r9,0x4
0x20220d92728c   98c  448b4590             movl r8,[rbp-0x70]
0x20220d927290   990  4183c004             addl r8,0x4
0x20220d927294   994  4183c401             addl r12,0x1
0x20220d927298   998  448b75e8             movl r14,[rbp-0x18]
0x20220d92729c   99c  4539e6               cmpl r14,r12
0x20220d92729f   99f  0f855bfeffff         jnz 0x20220d927100  <+0x800>
0x20220d9272a5   9a5  e9e7fdffff           jmp 0x20220d927091  <+0x791>
0x20220d9272aa   9aa  e82162f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9272af   9af  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d9272b3   9b3  8b5d90               movl rbx,[rbp-0x70]
0x20220d9272b6   9b6  8b5588               movl rdx,[rbp-0x78]
0x20220d9272b9   9b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x20220d9272bf   9bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d9272c3   9c3  8b4580               movl rax,[rbp-0x80]
0x20220d9272c6   9c6  448b4dc0             movl r9,[rbp-0x40]
0x20220d9272ca   9ca  e968f6ffff           jmp 0x20220d926937  <+0x37>
0x20220d9272cf   9cf  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x20220d9272d6   9d6  488955b8             REX.W movq [rbp-0x48],rdx
0x20220d9272da   9da  48894db0             REX.W movq [rbp-0x50],rcx
0x20220d9272de   9de  4c894da8             REX.W movq [rbp-0x58],r9
0x20220d9272e2   9e2  4c8945a0             REX.W movq [rbp-0x60],r8
0x20220d9272e6   9e6  c5fb114598           vmovsd [rbp-0x68],xmm0
0x20220d9272eb   9eb  4c8975c0             REX.W movq [rbp-0x40],r14
0x20220d9272ef   9ef  e8dc61f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9272f4   9f4  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d9272f8   9f8  33ff                 xorl rdi,rdi
0x20220d9272fa   9fa  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d9272fe   9fe  448b7dd0             movl r15,[rbp-0x30]
0x20220d927302   a02  8b9d78ffffff         movl rbx,[rbp-0x88]
0x20220d927308   a08  8b55b8               movl rdx,[rbp-0x48]
0x20220d92730b   a0b  8b4db0               movl rcx,[rbp-0x50]
0x20220d92730e   a0e  448b4da8             movl r9,[rbp-0x58]
0x20220d927312   a12  448b45a0             movl r8,[rbp-0x60]
0x20220d927316   a16  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x20220d92731b   a1b  448b75c0             movl r14,[rbp-0x40]
0x20220d92731f   a1f  e92af8ffff           jmp 0x20220d926b4e  <+0x24e>
0x20220d927324   a24  c5f92edb             vucomisd xmm3,xmm3
0x20220d927328   a28  0f8b08000000         jpo 0x20220d927336  <+0xa36>
0x20220d92732e   a2e  488bf7               REX.W movq rsi,rdi
0x20220d927331   a31  e99bf8ffff           jmp 0x20220d926bd1  <+0x2d1>
0x20220d927336   a36  c5f82eca             vucomiss xmm1,xmm2
0x20220d92733a   a3a  77f2                 ja 0x20220d92732e  <+0xa2e>
0x20220d92733c   a3c  beffffffff           movl rsi,0xffffffff
0x20220d927341   a41  e98bf8ffff           jmp 0x20220d926bd1  <+0x2d1>
0x20220d927346   a46  c5f92ee4             vucomisd xmm4,xmm4
0x20220d92734a   a4a  0f8b08000000         jpo 0x20220d927358  <+0xa58>
0x20220d927350   a50  488bc7               REX.W movq rax,rdi
0x20220d927353   a53  e91cf9ffff           jmp 0x20220d926c74  <+0x374>
0x20220d927358   a58  c5f82eca             vucomiss xmm1,xmm2
0x20220d92735c   a5c  77f2                 ja 0x20220d927350  <+0xa50>
0x20220d92735e   a5e  b8ffffffff           movl rax,0xffffffff
0x20220d927363   a63  e90cf9ffff           jmp 0x20220d926c74  <+0x374>
0x20220d927368   a68  488955c8             REX.W movq [rbp-0x38],rdx
0x20220d92736c   a6c  4c897598             REX.W movq [rbp-0x68],r14
0x20220d927370   a70  48895da8             REX.W movq [rbp-0x58],rbx
0x20220d927374   a74  48894db0             REX.W movq [rbp-0x50],rcx
0x20220d927378   a78  e85361f2ff           call 0x20220d84d4d0  (jump table)
0x20220d92737d   a7d  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d927381   a81  33ff                 xorl rdi,rdi
0x20220d927383   a83  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d927387   a87  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d92738b   a8b  8b4580               movl rax,[rbp-0x80]
0x20220d92738e   a8e  448b7dd0             movl r15,[rbp-0x30]
0x20220d927392   a92  448b4dc0             movl r9,[rbp-0x40]
0x20220d927396   a96  8b55c8               movl rdx,[rbp-0x38]
0x20220d927399   a99  448b7598             movl r14,[rbp-0x68]
0x20220d92739d   a9d  8b5da8               movl rbx,[rbp-0x58]
0x20220d9273a0   aa0  8b4db0               movl rcx,[rbp-0x50]
0x20220d9273a3   aa3  e9a2f9ffff           jmp 0x20220d926d4a  <+0x44a>
0x20220d9273a8   aa8  488955c8             REX.W movq [rbp-0x38],rdx
0x20220d9273ac   aac  4c8975b8             REX.W movq [rbp-0x48],r14
0x20220d9273b0   ab0  48895da8             REX.W movq [rbp-0x58],rbx
0x20220d9273b4   ab4  e81761f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9273b9   ab9  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d9273bd   abd  33ff                 xorl rdi,rdi
0x20220d9273bf   abf  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d9273c3   ac3  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x20220d9273c7   ac7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d9273cb   acb  8b4580               movl rax,[rbp-0x80]
0x20220d9273ce   ace  448b7dd0             movl r15,[rbp-0x30]
0x20220d9273d2   ad2  448b4dc0             movl r9,[rbp-0x40]
0x20220d9273d6   ad6  448b8578ffffff       movl r8,[rbp-0x88]
0x20220d9273dd   add  488b55c8             REX.W movq rdx,[rbp-0x38]
0x20220d9273e1   ae1  448b75b8             movl r14,[rbp-0x48]
0x20220d9273e5   ae5  8b5da8               movl rbx,[rbp-0x58]
0x20220d9273e8   ae8  e962faffff           jmp 0x20220d926e4f  <+0x54f>
0x20220d9273ed   aed  4c8965e0             REX.W movq [rbp-0x20],r12
0x20220d9273f1   af1  4c894d88             REX.W movq [rbp-0x78],r9
0x20220d9273f5   af5  488945d0             REX.W movq [rbp-0x30],rax
0x20220d9273f9   af9  48895dc8             REX.W movq [rbp-0x38],rbx
0x20220d9273fd   afd  48894dc0             REX.W movq [rbp-0x40],rcx
0x20220d927401   b01  488975b8             REX.W movq [rbp-0x48],rsi
0x20220d927405   b05  488955b0             REX.W movq [rbp-0x50],rdx
0x20220d927409   b09  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x20220d92740e   b0e  e8bd60f2ff           call 0x20220d84d4d0  (jump table)
0x20220d927413   b13  448b65e0             movl r12,[rbp-0x20]
0x20220d927417   b17  448b4d88             movl r9,[rbp-0x78]
0x20220d92741b   b1b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x20220d92741f   b1f  8b45d0               movl rax,[rbp-0x30]
0x20220d927422   b22  8b5dc8               movl rbx,[rbp-0x38]
0x20220d927425   b25  8b4dc0               movl rcx,[rbp-0x40]
0x20220d927428   b28  8b75b8               movl rsi,[rbp-0x48]
0x20220d92742b   b2b  33ff                 xorl rdi,rdi
0x20220d92742d   b2d  8b55b0               movl rdx,[rbp-0x50]
0x20220d927430   b30  c5f057c9             vxorps xmm1,xmm1,xmm1
0x20220d927434   b34  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x20220d927439   b39  448b7d98             movl r15,[rbp-0x68]
0x20220d92743d   b3d  e9d0fcffff           jmp 0x20220d927112  <+0x812>
0x20220d927442   b42  c5f92edb             vucomisd xmm3,xmm3
0x20220d927446   b46  0f8b08000000         jpo 0x20220d927454  <+0xb54>
0x20220d92744c   b4c  4c8bf7               REX.W movq r14,rdi
0x20220d92744f   b4f  e942fdffff           jmp 0x20220d927196  <+0x896>
0x20220d927454   b54  c5f82eca             vucomiss xmm1,xmm2
0x20220d927458   b58  77f2                 ja 0x20220d92744c  <+0xb4c>
0x20220d92745a   b5a  41beffffffff         movl r14,0xffffffff
0x20220d927460   b60  e931fdffff           jmp 0x20220d927196  <+0x896>
0x20220d927465   b65  c5f92ee4             vucomisd xmm4,xmm4
0x20220d927469   b69  0f8b08000000         jpo 0x20220d927477  <+0xb77>
0x20220d92746f   b6f  4c8bf7               REX.W movq r14,rdi
0x20220d927472   b72  e9cafdffff           jmp 0x20220d927241  <+0x941>
0x20220d927477   b77  c5f82eca             vucomiss xmm1,xmm2
0x20220d92747b   b7b  77f2                 ja 0x20220d92746f  <+0xb6f>
0x20220d92747d   b7d  41beffffffff         movl r14,0xffffffff
0x20220d927483   b83  e9b9fdffff           jmp 0x20220d927241  <+0x941>
0x20220d927488   b88  e8835df2ff           call 0x20220d84d210  (jump table)
0x20220d92748d   b8d  e87e5df2ff           call 0x20220d84d210  (jump table)
0x20220d927492   b92  e8795df2ff           call 0x20220d84d210  (jump table)
0x20220d927497   b97  90                   nop

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
0x20220d92698e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x20220d92698a  internal wasm call
0x20220d926a15  external reference (0x193f2f0)
0x20220d926e87  internal wasm call
0x20220d926eff  external reference (0x193f270)
0x20220d926f96  internal wasm call
0x20220d9272ab  wasm stub call  (0x20220d84d4d0)
0x20220d9272f0  wasm stub call  (0x20220d84d4d0)
0x20220d927379  wasm stub call  (0x20220d84d4d0)
0x20220d9273b5  wasm stub call  (0x20220d84d4d0)
0x20220d92740f  wasm stub call  (0x20220d84d4d0)
0x20220d927489  wasm stub call  (0x20220d84d210)
0x20220d92748e  wasm stub call  (0x20220d84d210)
0x20220d927493  wasm stub call  (0x20220d84d210)
