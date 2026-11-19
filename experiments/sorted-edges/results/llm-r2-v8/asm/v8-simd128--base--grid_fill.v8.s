name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2984 + 24 padding)
Instructions (size = 2968)
0x321fc577e880     0  55                   push rbp
0x321fc577e881     1  4889e5               REX.W movq rbp,rsp
0x321fc577e884     4  6a08                 push 0x8
0x321fc577e886     6  56                   push rsi
0x321fc577e887     7  4881ec80000000       REX.W subq rsp,0x80
0x321fc577e88e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x321fc577e892    12  48894580             REX.W movq [rbp-0x80],rax
0x321fc577e896    16  48895588             REX.W movq [rbp-0x78],rdx
0x321fc577e89a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x321fc577e8a1    21  48895d90             REX.W movq [rbp-0x70],rbx
0x321fc577e8a5    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x321fc577e8a9    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x321fc577e8ad    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577e8b1    31  0f8673090000         jna 0x321fc577f22a  <+0x9aa>
0x321fc577e8b7    37  448be0               movl r12,rax
0x321fc577e8ba    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x321fc577e8c3    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x321fc577e8c8    48  478b742328           movl r14,[r11+r12*1+0x28]
0x321fc577e8cd    4d  450faff7             imull r14,r15
0x321fc577e8d1    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x321fc577e8d5    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x321fc577e8d9    59  4d8bfe               REX.W movq r15,r14
0x321fc577e8dc    5c  4183c701             addl r15,0x1
0x321fc577e8e0    60  0f850c000000         jnz 0x321fc577e8f2  <+0x72>
0x321fc577e8e6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x321fc577e8ea    6a  4533ff               xorl r15,r15
0x321fc577e8ed    6d  e928010000           jmp 0x321fc577ea1a  <+0x19a>
0x321fc577e8f2    72  438b3c23             movl rdi,[r11+r12*1]
0x321fc577e8f6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x321fc577e8fa    7a  47393c23             cmpl [r11+r12*1],r15
0x321fc577e8fe    7e  0f8341000000         jnc 0x321fc577e945  <+0xc5>
0x321fc577e904    84  498bcf               REX.W movq rcx,r15
0x321fc577e907    87  33d2                 xorl rdx,rdx
0x321fc577e909    89  e8f263f2ff           call 0x321fc56a4d00  (jump table)
0x321fc577e90e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x321fc577e912    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x321fc577e916    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x321fc577e91b    9b  4489e7               movl rdi,r12
0x321fc577e91e    9e  4d8be3               REX.W movq r12,r11
0x321fc577e921    a1  4c8bdb               REX.W movq r11,rbx
0x321fc577e924    a4  8b5588               movl rdx,[rbp-0x78]
0x321fc577e927    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577e92d    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577e931    b1  8b4580               movl rax,[rbp-0x80]
0x321fc577e934    b4  448b4dc0             movl r9,[rbp-0x40]
0x321fc577e938    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x321fc577e93c    bc  448b75b0             movl r14,[rbp-0x50]
0x321fc577e940    c0  e902000000           jmp 0x321fc577e947  <+0xc7>
0x321fc577e945    c5  33ff                 xorl rdi,rdi
0x321fc577e947    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x321fc577e94c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x321fc577e950    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x321fc577e954    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x321fc577e958    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x321fc577e95c    dc  4585f6               testl r14,r14
0x321fc577e95f    df  0f84a4000000         jz 0x321fc577ea09  <+0x189>
0x321fc577e965    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x321fc577e96d    ed  83c3fc               addl rbx,0xfc
0x321fc577e970    f0  0f8480000000         jz 0x321fc577e9f6  <+0x176>
0x321fc577e976    f6  4989e2               REX.W movq r10,rsp
0x321fc577e979    f9  4883ec08             REX.W subq rsp,0x8
0x321fc577e97d    fd  4883e4f0             REX.W andq rsp,0xf0
0x321fc577e981   101  4c891424             REX.W movq [rsp],r10
0x321fc577e985   105  488bfe               REX.W movq rdi,rsi
0x321fc577e988   108  4c8bc3               REX.W movq r8,rbx
0x321fc577e98b   10b  8b55e8               movl rdx,[rbp-0x18]
0x321fc577e98e   10e  33c9                 xorl rcx,rcx
0x321fc577e990   110  488bf1               REX.W movq rsi,rcx
0x321fc577e993   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x321fc577e99d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x321fc577e9a4   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x321fc577e9ab   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x321fc577e9b2   132  ffd0                 call rax
0x321fc577e9b4   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x321fc577e9bf   13f  488b2424             REX.W movq rsp,[rsp]
0x321fc577e9c3   143  85c0                 testl rax,rax
0x321fc577e9c5   145  0f84470a0000         jz 0x321fc577f412  <+0xb92>
0x321fc577e9cb   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577e9cf   14f  8b5588               movl rdx,[rbp-0x78]
0x321fc577e9d2   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577e9d6   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577e9dc   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577e9e0   160  8b4580               movl rax,[rbp-0x80]
0x321fc577e9e3   163  448b4dc0             movl r9,[rbp-0x40]
0x321fc577e9e7   167  8b7db8               movl rdi,[rbp-0x48]
0x321fc577e9ea   16a  448b45c8             movl r8,[rbp-0x38]
0x321fc577e9ee   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x321fc577e9f2   172  448b75b0             movl r14,[rbp-0x50]
0x321fc577e9f6   176  8bdf                 movl rbx,rdi
0x321fc577e9f8   178  4403f3               addl r14,rbx
0x321fc577e9fb   17b  4103df               addl rbx,r15
0x321fc577e9fe   17e  458bf8               movl r15,r8
0x321fc577ea01   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x321fc577ea06   186  418bfe               movl rdi,r14
0x321fc577ea09   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x321fc577ea11   191  8d5f01               leal rbx,[rdi+0x1]
0x321fc577ea14   194  448bfb               movl r15,rbx
0x321fc577ea17   197  8b5d90               movl rbx,[rbp-0x70]
0x321fc577ea1a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x321fc577ea1f   19f  458bc1               movl r8,r9
0x321fc577ea22   1a2  448bf1               movl r14,rcx
0x321fc577ea25   1a5  443bc1               cmpl r8,rcx
0x321fc577ea28   1a8  450f42f0             cmovcl r14,r8
0x321fc577ea2c   1ac  33ff                 xorl rdi,rdi
0x321fc577ea2e   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x321fc577ea32   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x321fc577ea36   1b6  4585f6               testl r14,r14
0x321fc577ea39   1b9  0f850e000000         jnz 0x321fc577ea4d  <+0x1cd>
0x321fc577ea3f   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x321fc577ea44   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577ea48   1c8  e910020000           jmp 0x321fc577ec5d  <+0x3dd>
0x321fc577ea4d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x321fc577ea52   1d2  4533c9               xorl r9,r9
0x321fc577ea55   1d5  4585c0               testl r8,r8
0x321fc577ea58   1d8  410f95c1             setnzl r9l
0x321fc577ea5c   1dc  452bc1               subl r8,r9
0x321fc577ea5f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x321fc577ea64   1e4  33db                 xorl rbx,rbx
0x321fc577ea66   1e6  4585c9               testl r9,r9
0x321fc577ea69   1e9  0f95c3               setnzl bl
0x321fc577ea6c   1ec  458bf1               movl r14,r9
0x321fc577ea6f   1ef  442bf3               subl r14,rbx
0x321fc577ea72   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x321fc577ea77   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x321fc577ea7e   1fe  448b55e8             movl r10,[rbp-0x18]
0x321fc577ea82   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x321fc577ea86   206  8bca                 movl rcx,rdx
0x321fc577ea88   208  8b5590               movl rdx,[rbp-0x70]
0x321fc577ea8b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577ea8f   20f  e930000000           jmp 0x321fc577eac4  <+0x244>
0x321fc577ea94   214  660f1f840000000000   nop
0x321fc577ea9d   21d  660f1f840000000000   nop
0x321fc577eaa6   226  660f1f840000000000   nop
0x321fc577eaaf   22f  660f1f840000000000   nop
0x321fc577eab8   238  0f1f840000000000     nop
0x321fc577eac0   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x321fc577eac4   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577eac8   248  0f8681070000         jna 0x321fc577f24f  <+0x9cf>
0x321fc577eace   24e  8bf1                 movl rsi,rcx
0x321fc577ead0   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x321fc577ead6   256  c5f82ed2             vucomiss xmm2,xmm2
0x321fc577eada   25a  7a06                 jpe 0x321fc577eae2  <+0x262>
0x321fc577eadc   25c  0f8404000000         jz 0x321fc577eae6  <+0x266>
0x321fc577eae2   262  c5f928d1             vmovapd xmm2,xmm1
0x321fc577eae6   266  c5f82ed1             vucomiss xmm2,xmm1
0x321fc577eaea   26a  0f8704000000         ja 0x321fc577eaf4  <+0x274>
0x321fc577eaf0   270  c5f928d1             vmovapd xmm2,xmm1
0x321fc577eaf4   274  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x321fc577eafa   27a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x321fc577eafe   27e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x321fc577eb04   284  c5fb2cf4             vcvttsd2si rsi,xmm4
0x321fc577eb08   288  85f6                 testl rsi,rsi
0x321fc577eb0a   28a  0f8929000000         jns 0x321fc577eb39  <+0x2b9>
0x321fc577eb10   290  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x321fc577eb1a   29a  c441f96efa           vmovq xmm15,r10
0x321fc577eb1f   29f  c50358fc             vaddsd xmm15,xmm15,xmm4
0x321fc577eb23   2a3  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x321fc577eb28   2a8  85f6                 testl rsi,rsi
0x321fc577eb2a   2aa  0f8809000000         js 0x321fc577eb39  <+0x2b9>
0x321fc577eb30   2b0  41ba00000080         movl r10,0x80000000
0x321fc577eb36   2b6  410bf2               orl rsi,r10
0x321fc577eb39   2b9  448bd6               movl r10,rsi
0x321fc577eb3c   2bc  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x321fc577eb41   2c1  c5f92eec             vucomisd xmm5,xmm4
0x321fc577eb45   2c5  0f8a59070000         jpe 0x321fc577f2a4  <+0xa24>
0x321fc577eb4b   2cb  0f8553070000         jnz 0x321fc577f2a4  <+0xa24>
0x321fc577eb51   2d1  8bc6                 movl rax,rsi
0x321fc577eb53   2d3  443bf6               cmpl r14,rsi
0x321fc577eb56   2d6  410f42c6             cmovcl rax,r14
0x321fc577eb5a   2da  83c001               addl rax,0x1
0x321fc577eb5d   2dd  41ba0000804f         movl r10,0x4f800000
0x321fc577eb63   2e3  c4c1796eda           vmovd xmm3,r10
0x321fc577eb68   2e8  be01000000           movl rsi,0x1
0x321fc577eb6d   2ed  c5f82eda             vucomiss xmm3,xmm2
0x321fc577eb71   2f1  0f47f0               cmoval rsi,rax
0x321fc577eb74   2f4  8bc2                 movl rax,rdx
0x321fc577eb76   2f6  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x321fc577eb7c   2fc  c5f82ed2             vucomiss xmm2,xmm2
0x321fc577eb80   300  7a06                 jpe 0x321fc577eb88  <+0x308>
0x321fc577eb82   302  0f8404000000         jz 0x321fc577eb8c  <+0x30c>
0x321fc577eb88   308  c5f928d1             vmovapd xmm2,xmm1
0x321fc577eb8c   30c  c5f82ed1             vucomiss xmm2,xmm1
0x321fc577eb90   310  0f8704000000         ja 0x321fc577eb9a  <+0x31a>
0x321fc577eb96   316  c5f928d1             vmovapd xmm2,xmm1
0x321fc577eb9a   31a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x321fc577eba0   320  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x321fc577eba4   324  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x321fc577ebaa   32a  c5fb2cc5             vcvttsd2si rax,xmm5
0x321fc577ebae   32e  85c0                 testl rax,rax
0x321fc577ebb0   330  0f8926000000         jns 0x321fc577ebdc  <+0x35c>
0x321fc577ebb6   336  4c8b1555ffffff       REX.W movq r10,[rip+0xffffff55]
0x321fc577ebbd   33d  c441f96efa           vmovq xmm15,r10
0x321fc577ebc2   342  c50358fd             vaddsd xmm15,xmm15,xmm5
0x321fc577ebc6   346  c4c17b2cc7           vcvttsd2si rax,xmm15
0x321fc577ebcb   34b  85c0                 testl rax,rax
0x321fc577ebcd   34d  0f8809000000         js 0x321fc577ebdc  <+0x35c>
0x321fc577ebd3   353  41ba00000080         movl r10,0x80000000
0x321fc577ebd9   359  410bc2               orl rax,r10
0x321fc577ebdc   35c  448bd0               movl r10,rax
0x321fc577ebdf   35f  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x321fc577ebe4   364  c5f92ef5             vucomisd xmm6,xmm5
0x321fc577ebe8   368  0f8ad8060000         jpe 0x321fc577f2c6  <+0xa46>
0x321fc577ebee   36e  0f85d2060000         jnz 0x321fc577f2c6  <+0xa46>
0x321fc577ebf4   374  448be0               movl r12,rax
0x321fc577ebf7   377  443bc0               cmpl r8,rax
0x321fc577ebfa   37a  450f42e0             cmovcl r12,r8
0x321fc577ebfe   37e  488bc7               REX.W movq rax,rdi
0x321fc577ec01   381  c5f82eda             vucomiss xmm3,xmm2
0x321fc577ec05   385  410f47c4             cmoval rax,r12
0x321fc577ec09   389  458be1               movl r12,r9
0x321fc577ec0c   38c  440fafe0             imull r12,rax
0x321fc577ec10   390  4403e6               addl r12,rsi
0x321fc577ec13   393  4539e7               cmpl r15,r12
0x321fc577ec16   396  0f860f000000         jna 0x321fc577ec2b  <+0x3ab>
0x321fc577ec1c   39c  468d24a3             leal r12,[rbx+r12*4]
0x321fc577ec20   3a0  438b0423             movl rax,[r11+r12*1]
0x321fc577ec24   3a4  83c001               addl rax,0x1
0x321fc577ec27   3a7  43890423             movl [r11+r12*1],rax
0x321fc577ec2b   3ab  83c104               addl rcx,0x4
0x321fc577ec2e   3ae  83c204               addl rdx,0x4
0x321fc577ec31   3b1  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x321fc577ec35   3b5  4183c4ff             addl r12,0xff
0x321fc577ec39   3b9  0f8581feffff         jnz 0x321fc577eac0  <+0x240>
0x321fc577ec3f   3bf  448bc3               movl r8,rbx
0x321fc577ec42   3c2  448b75e8             movl r14,[rbp-0x18]
0x321fc577ec46   3c6  8b5d90               movl rbx,[rbp-0x70]
0x321fc577ec49   3c9  8b5588               movl rdx,[rbp-0x78]
0x321fc577ec4c   3cc  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577ec50   3d0  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577ec56   3d6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577ec5a   3da  8b4580               movl rax,[rbp-0x80]
0x321fc577ec5d   3dd  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x321fc577ec64   3e4  4585ff               testl r15,r15
0x321fc577ec67   3e7  0f8508000000         jnz 0x321fc577ec75  <+0x3f5>
0x321fc577ec6d   3ed  488bdf               REX.W movq rbx,rdi
0x321fc577ec70   3f0  e95c020000           jmp 0x321fc577eed1  <+0x651>
0x321fc577ec75   3f5  468d0cbd00000000     leal r9,[r15*4+0x0]
0x321fc577ec7d   3fd  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x321fc577ec85   405  448bf3               movl r14,rbx
0x321fc577ec88   408  41c1ee02             shrl r14, 2
0x321fc577ec8c   40c  4183c601             addl r14,0x1
0x321fc577ec90   410  418bd6               movl rdx,r14
0x321fc577ec93   413  83e207               andl rdx,0x7
0x321fc577ec96   416  4c894dc0             REX.W movq [rbp-0x40],r9
0x321fc577ec9a   41a  83fb1c               cmpl rbx,0x1c
0x321fc577ec9d   41d  0f82cf000000         jc 0x321fc577ed72  <+0x4f2>
0x321fc577eca3   423  4181e6f8ffff7f       andl r14,0x7ffffff8
0x321fc577ecaa   42a  418bd8               movl rbx,r8
0x321fc577ecad   42d  488bcf               REX.W movq rcx,rdi
0x321fc577ecb0   430  660f1f840000000000   nop
0x321fc577ecb9   439  0f1f8000000000       nop
0x321fc577ecc0   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577ecc4   444  0f861e060000         jna 0x321fc577f2e8  <+0xa68>
0x321fc577ecca   44a  418b341b             movl rsi,[r11+rbx*1]
0x321fc577ecce   44e  03ce                 addl rcx,rsi
0x321fc577ecd0   450  41890c1b             movl [r11+rbx*1],rcx
0x321fc577ecd4   454  8d7304               leal rsi,[rbx+0x4]
0x321fc577ecd7   457  458b0433             movl r8,[r11+rsi*1]
0x321fc577ecdb   45b  4103c8               addl rcx,r8
0x321fc577ecde   45e  41890c33             movl [r11+rsi*1],rcx
0x321fc577ece2   462  8d7308               leal rsi,[rbx+0x8]
0x321fc577ece5   465  458b0433             movl r8,[r11+rsi*1]
0x321fc577ece9   469  4103c8               addl rcx,r8
0x321fc577ecec   46c  41890c33             movl [r11+rsi*1],rcx
0x321fc577ecf0   470  8d730c               leal rsi,[rbx+0xc]
0x321fc577ecf3   473  458b0433             movl r8,[r11+rsi*1]
0x321fc577ecf7   477  4103c8               addl rcx,r8
0x321fc577ecfa   47a  41890c33             movl [r11+rsi*1],rcx
0x321fc577ecfe   47e  8d7310               leal rsi,[rbx+0x10]
0x321fc577ed01   481  458b0433             movl r8,[r11+rsi*1]
0x321fc577ed05   485  4103c8               addl rcx,r8
0x321fc577ed08   488  41890c33             movl [r11+rsi*1],rcx
0x321fc577ed0c   48c  8d7314               leal rsi,[rbx+0x14]
0x321fc577ed0f   48f  458b0433             movl r8,[r11+rsi*1]
0x321fc577ed13   493  4103c8               addl rcx,r8
0x321fc577ed16   496  41890c33             movl [r11+rsi*1],rcx
0x321fc577ed1a   49a  8d7318               leal rsi,[rbx+0x18]
0x321fc577ed1d   49d  458b0433             movl r8,[r11+rsi*1]
0x321fc577ed21   4a1  4103c8               addl rcx,r8
0x321fc577ed24   4a4  41890c33             movl [r11+rsi*1],rcx
0x321fc577ed28   4a8  8d731c               leal rsi,[rbx+0x1c]
0x321fc577ed2b   4ab  458b0433             movl r8,[r11+rsi*1]
0x321fc577ed2f   4af  4103c8               addl rcx,r8
0x321fc577ed32   4b2  41890c33             movl [r11+rsi*1],rcx
0x321fc577ed36   4b6  83c320               addl rbx,0x20
0x321fc577ed39   4b9  4183c6f8             addl r14,0xf8
0x321fc577ed3d   4bd  7581                 jnz 0x321fc577ecc0  <+0x440>
0x321fc577ed3f   4bf  85d2                 testl rdx,rdx
0x321fc577ed41   4c1  0f8510000000         jnz 0x321fc577ed57  <+0x4d7>
0x321fc577ed47   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577ed4b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x321fc577ed52   4d2  e98b000000           jmp 0x321fc577ede2  <+0x562>
0x321fc577ed57   4d7  448bf3               movl r14,rbx
0x321fc577ed5a   4da  8bd9                 movl rbx,rcx
0x321fc577ed5c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577ed62   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577ed66   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x321fc577ed6d   4ed  e906000000           jmp 0x321fc577ed78  <+0x4f8>
0x321fc577ed72   4f2  488bdf               REX.W movq rbx,rdi
0x321fc577ed75   4f5  458bf0               movl r14,r8
0x321fc577ed78   4f8  c1e202               shll rdx, 2
0x321fc577ed7b   4fb  0f1f440000           nop
0x321fc577ed80   500  438b0c33             movl rcx,[r11+r14*1]
0x321fc577ed84   504  03d9                 addl rbx,rcx
0x321fc577ed86   506  43891c33             movl [r11+r14*1],rbx
0x321fc577ed8a   50a  4183c604             addl r14,0x4
0x321fc577ed8e   50e  83c2fc               addl rdx,0xfc
0x321fc577ed91   511  0f844b000000         jz 0x321fc577ede2  <+0x562>
0x321fc577ed97   517  438b0c33             movl rcx,[r11+r14*1]
0x321fc577ed9b   51b  03d9                 addl rbx,rcx
0x321fc577ed9d   51d  43891c33             movl [r11+r14*1],rbx
0x321fc577eda1   521  4183c604             addl r14,0x4
0x321fc577eda5   525  83c2fc               addl rdx,0xfc
0x321fc577eda8   528  0f8434000000         jz 0x321fc577ede2  <+0x562>
0x321fc577edae   52e  438b0c33             movl rcx,[r11+r14*1]
0x321fc577edb2   532  03d9                 addl rbx,rcx
0x321fc577edb4   534  43891c33             movl [r11+r14*1],rbx
0x321fc577edb8   538  4183c604             addl r14,0x4
0x321fc577edbc   53c  83c2fc               addl rdx,0xfc
0x321fc577edbf   53f  0f841d000000         jz 0x321fc577ede2  <+0x562>
0x321fc577edc5   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577edc9   549  0f8659050000         jna 0x321fc577f328  <+0xaa8>
0x321fc577edcf   54f  438b0c33             movl rcx,[r11+r14*1]
0x321fc577edd3   553  03d9                 addl rbx,rcx
0x321fc577edd5   555  43891c33             movl [r11+r14*1],rbx
0x321fc577edd9   559  4183c604             addl r14,0x4
0x321fc577eddd   55d  83c2fc               addl rdx,0xfc
0x321fc577ede0   560  759e                 jnz 0x321fc577ed80  <+0x500>
0x321fc577ede2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x321fc577edeb   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x321fc577edf0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x321fc577edf5   575  0f834a000000         jnc 0x321fc577ee45  <+0x5c5>
0x321fc577edfb   57b  8bd8                 movl rbx,rax
0x321fc577edfd   57d  8d430c               leal rax,[rbx+0xc]
0x321fc577ee00   580  418bcf               movl rcx,r15
0x321fc577ee03   583  488bd7               REX.W movq rdx,rdi
0x321fc577ee06   586  e8f55ef2ff           call 0x321fc56a4d00  (jump table)
0x321fc577ee0b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x321fc577ee0f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x321fc577ee13   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x321fc577ee18   598  4c8bd3               REX.W movq r10,rbx
0x321fc577ee1b   59b  4489e3               movl rbx,r12
0x321fc577ee1e   59e  4d8be3               REX.W movq r12,r11
0x321fc577ee21   5a1  4d8bda               REX.W movq r11,r10
0x321fc577ee24   5a4  33ff                 xorl rdi,rdi
0x321fc577ee26   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577ee2a   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577ee2e   5ae  8b4580               movl rax,[rbp-0x80]
0x321fc577ee31   5b1  448b7dd0             movl r15,[rbp-0x30]
0x321fc577ee35   5b5  448b4dc0             movl r9,[rbp-0x40]
0x321fc577ee39   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x321fc577ee40   5c0  e903000000           jmp 0x321fc577ee48  <+0x5c8>
0x321fc577ee45   5c5  488bdf               REX.W movq rbx,rdi
0x321fc577ee48   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x321fc577ee4c   5cc  4d8bf7               REX.W movq r14,r15
0x321fc577ee4f   5cf  41c1e602             shll r14, 2
0x321fc577ee53   5d3  0f8478000000         jz 0x321fc577eed1  <+0x651>
0x321fc577ee59   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x321fc577ee5e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x321fc577ee62   5e2  4989e2               REX.W movq r10,rsp
0x321fc577ee65   5e5  4883ec08             REX.W subq rsp,0x8
0x321fc577ee69   5e9  4883e4f0             REX.W andq rsp,0xf0
0x321fc577ee6d   5ed  4c891424             REX.W movq [rsp],r10
0x321fc577ee71   5f1  488bd7               REX.W movq rdx,rdi
0x321fc577ee74   5f4  4c8bd7               REX.W movq r10,rdi
0x321fc577ee77   5f7  488bfe               REX.W movq rdi,rsi
0x321fc577ee7a   5fa  498bf2               REX.W movq rsi,r10
0x321fc577ee7d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x321fc577ee87   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x321fc577ee8e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x321fc577ee95   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x321fc577ee9c   61c  ffd0                 call rax
0x321fc577ee9e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x321fc577eea9   629  488b2424             REX.W movq rsp,[rsp]
0x321fc577eead   62d  85c0                 testl rax,rax
0x321fc577eeaf   62f  0f8458050000         jz 0x321fc577f40d  <+0xb8d>
0x321fc577eeb5   635  8b5dc8               movl rbx,[rbp-0x38]
0x321fc577eeb8   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577eebc   63c  33ff                 xorl rdi,rdi
0x321fc577eebe   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577eec2   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577eec6   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577eeca   64a  8b4580               movl rax,[rbp-0x80]
0x321fc577eecd   64d  448b7dd0             movl r15,[rbp-0x30]
0x321fc577eed1   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x321fc577eeda   65a  4103df               addl rbx,r15
0x321fc577eedd   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x321fc577eee2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x321fc577eee9   669  0f8508000000         jnz 0x321fc577eef7  <+0x677>
0x321fc577eeef   66f  488bdf               REX.W movq rbx,rdi
0x321fc577eef2   672  e90b010000           jmp 0x321fc577f002  <+0x782>
0x321fc577eef7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x321fc577eefc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577ef02   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x321fc577ef07   687  0f833b000000         jnc 0x321fc577ef48  <+0x6c8>
0x321fc577ef0d   68d  8bd8                 movl rbx,rax
0x321fc577ef0f   68f  8d4318               leal rax,[rbx+0x18]
0x321fc577ef12   692  488bd7               REX.W movq rdx,rdi
0x321fc577ef15   695  e8e65df2ff           call 0x321fc56a4d00  (jump table)
0x321fc577ef1a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x321fc577ef1e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x321fc577ef22   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x321fc577ef27   6a7  4c8bd3               REX.W movq r10,rbx
0x321fc577ef2a   6aa  4489e3               movl rbx,r12
0x321fc577ef2d   6ad  4d8be3               REX.W movq r12,r11
0x321fc577ef30   6b0  4d8bda               REX.W movq r11,r10
0x321fc577ef33   6b3  33ff                 xorl rdi,rdi
0x321fc577ef35   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577ef39   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577ef3f   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577ef43   6c3  e903000000           jmp 0x321fc577ef4b  <+0x6cb>
0x321fc577ef48   6c8  488bdf               REX.W movq rbx,rdi
0x321fc577ef4b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x321fc577ef50   6d0  418d149f             leal rdx,[r15+rbx*4]
0x321fc577ef54   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x321fc577ef58   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x321fc577ef5c   6dc  83f901               cmpl rcx,0x1
0x321fc577ef5f   6df  0f8492000000         jz 0x321fc577eff7  <+0x777>
0x321fc577ef65   6e5  448bf1               movl r14,rcx
0x321fc577ef68   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x321fc577ef70   6f0  83c0fc               addl rax,0xfc
0x321fc577ef73   6f3  0f846f000000         jz 0x321fc577efe8  <+0x768>
0x321fc577ef79   6f9  4989e2               REX.W movq r10,rsp
0x321fc577ef7c   6fc  4883ec08             REX.W subq rsp,0x8
0x321fc577ef80   700  4883e4f0             REX.W andq rsp,0xf0
0x321fc577ef84   704  4c891424             REX.W movq [rsp],r10
0x321fc577ef88   708  488bcf               REX.W movq rcx,rdi
0x321fc577ef8b   70b  4c8bd7               REX.W movq r10,rdi
0x321fc577ef8e   70e  488bfe               REX.W movq rdi,rsi
0x321fc577ef91   711  498bf2               REX.W movq rsi,r10
0x321fc577ef94   714  4c8bc0               REX.W movq r8,rax
0x321fc577ef97   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x321fc577ef9e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x321fc577efa5   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x321fc577efac   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x321fc577efb3   733  ffd0                 call rax
0x321fc577efb5   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x321fc577efc0   740  488b2424             REX.W movq rsp,[rsp]
0x321fc577efc4   744  85c0                 testl rax,rax
0x321fc577efc6   746  0f843c040000         jz 0x321fc577f408  <+0xb88>
0x321fc577efcc   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577efd0   750  33ff                 xorl rdi,rdi
0x321fc577efd2   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577efd6   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577efda   75a  8b5dd0               movl rbx,[rbp-0x30]
0x321fc577efdd   75d  448b7dc8             movl r15,[rbp-0x38]
0x321fc577efe1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x321fc577efe8   768  4103de               addl rbx,r14
0x321fc577efeb   76b  448d73ff             leal r14,[rbx-0x1]
0x321fc577efef   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x321fc577eff4   774  418bde               movl rbx,r14
0x321fc577eff7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x321fc577efff   77f  83c301               addl rbx,0x1
0x321fc577f002   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x321fc577f007   787  837de800             cmpl [rbp-0x18],0x0
0x321fc577f00b   78b  0f8505000000         jnz 0x321fc577f016  <+0x796>
0x321fc577f011   791  488be5               REX.W movq rsp,rbp
0x321fc577f014   794  5d                   pop rbp
0x321fc577f015   795  c3                   retl
0x321fc577f016   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x321fc577f01b   79b  4533f6               xorl r14,r14
0x321fc577f01e   79e  4585ff               testl r15,r15
0x321fc577f021   7a1  410f95c6             setnzl r14l
0x321fc577f025   7a5  452bfe               subl r15,r14
0x321fc577f028   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x321fc577f02d   7ad  33c0                 xorl rax,rax
0x321fc577f02f   7af  4585f6               testl r14,r14
0x321fc577f032   7b2  0f95c0               setnzl al
0x321fc577f035   7b5  418bd6               movl rdx,r14
0x321fc577f038   7b8  2bd0                 subl rdx,rax
0x321fc577f03a   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x321fc577f03f   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x321fc577f044   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x321fc577f049   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x321fc577f050   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x321fc577f054   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x321fc577f058   7d8  4c8be7               REX.W movq r12,rdi
0x321fc577f05b   7db  448b4d88             movl r9,[rbp-0x78]
0x321fc577f05f   7df  e924000000           jmp 0x321fc577f088  <+0x808>
0x321fc577f064   7e4  660f1f840000000000   nop
0x321fc577f06d   7ed  660f1f840000000000   nop
0x321fc577f076   7f6  660f1f840000000000   nop
0x321fc577f07f   7ff  90                   nop
0x321fc577f080   800  448b7d98             movl r15,[rbp-0x68]
0x321fc577f084   804  4c894590             REX.W movq [rbp-0x70],r8
0x321fc577f088   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577f08c   80c  0f86db020000         jna 0x321fc577f36d  <+0xaed>
0x321fc577f092   812  448b7590             movl r14,[rbp-0x70]
0x321fc577f096   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x321fc577f09c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x321fc577f0a0   820  7a06                 jpe 0x321fc577f0a8  <+0x828>
0x321fc577f0a2   822  0f8404000000         jz 0x321fc577f0ac  <+0x82c>
0x321fc577f0a8   828  c5f928d1             vmovapd xmm2,xmm1
0x321fc577f0ac   82c  c5f82ed1             vucomiss xmm2,xmm1
0x321fc577f0b0   830  0f8704000000         ja 0x321fc577f0ba  <+0x83a>
0x321fc577f0b6   836  c5f928d1             vmovapd xmm2,xmm1
0x321fc577f0ba   83a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x321fc577f0c0   840  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x321fc577f0c4   844  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x321fc577f0ca   84a  c57b2cf4             vcvttsd2si r14,xmm4
0x321fc577f0ce   84e  4585f6               testl r14,r14
0x321fc577f0d1   851  0f8927000000         jns 0x321fc577f0fe  <+0x87e>
0x321fc577f0d7   857  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x321fc577f0de   85e  c441f96efa           vmovq xmm15,r10
0x321fc577f0e3   863  c50358fc             vaddsd xmm15,xmm15,xmm4
0x321fc577f0e7   867  c4417b2cf7           vcvttsd2si r14,xmm15
0x321fc577f0ec   86c  4585f6               testl r14,r14
0x321fc577f0ef   86f  0f8809000000         js 0x321fc577f0fe  <+0x87e>
0x321fc577f0f5   875  41ba00000080         movl r10,0x80000000
0x321fc577f0fb   87b  450bf2               orl r14,r10
0x321fc577f0fe   87e  458bd6               movl r10,r14
0x321fc577f101   881  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x321fc577f106   886  c5f92eec             vucomisd xmm5,xmm4
0x321fc577f10a   88a  0f8ab2020000         jpe 0x321fc577f3c2  <+0xb42>
0x321fc577f110   890  0f85ac020000         jnz 0x321fc577f3c2  <+0xb42>
0x321fc577f116   896  458bc6               movl r8,r14
0x321fc577f119   899  453bfe               cmpl r15,r14
0x321fc577f11c   89c  450f42c7             cmovcl r8,r15
0x321fc577f120   8a0  41ba0000804f         movl r10,0x4f800000
0x321fc577f126   8a6  c4c1796eda           vmovd xmm3,r10
0x321fc577f12b   8ab  4c8bf7               REX.W movq r14,rdi
0x321fc577f12e   8ae  c5f82eda             vucomiss xmm3,xmm2
0x321fc577f132   8b2  450f47f0             cmoval r14,r8
0x321fc577f136   8b6  448b45a0             movl r8,[rbp-0x60]
0x321fc577f13a   8ba  450fafc6             imull r8,r14
0x321fc577f13e   8be  458bf1               movl r14,r9
0x321fc577f141   8c1  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x321fc577f147   8c7  c5f82ed2             vucomiss xmm2,xmm2
0x321fc577f14b   8cb  7a06                 jpe 0x321fc577f153  <+0x8d3>
0x321fc577f14d   8cd  0f8404000000         jz 0x321fc577f157  <+0x8d7>
0x321fc577f153   8d3  c5f928d1             vmovapd xmm2,xmm1
0x321fc577f157   8d7  c5f82ed1             vucomiss xmm2,xmm1
0x321fc577f15b   8db  0f8704000000         ja 0x321fc577f165  <+0x8e5>
0x321fc577f161   8e1  c5f928d1             vmovapd xmm2,xmm1
0x321fc577f165   8e5  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x321fc577f16b   8eb  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x321fc577f16f   8ef  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x321fc577f175   8f5  c57b2cf5             vcvttsd2si r14,xmm5
0x321fc577f179   8f9  4585f6               testl r14,r14
0x321fc577f17c   8fc  0f8927000000         jns 0x321fc577f1a9  <+0x929>
0x321fc577f182   902  4c8b1589f9ffff       REX.W movq r10,[rip+0xfffff989]
0x321fc577f189   909  c441f96efa           vmovq xmm15,r10
0x321fc577f18e   90e  c50358fd             vaddsd xmm15,xmm15,xmm5
0x321fc577f192   912  c4417b2cf7           vcvttsd2si r14,xmm15
0x321fc577f197   917  4585f6               testl r14,r14
0x321fc577f19a   91a  0f8809000000         js 0x321fc577f1a9  <+0x929>
0x321fc577f1a0   920  41ba00000080         movl r10,0x80000000
0x321fc577f1a6   926  450bf2               orl r14,r10
0x321fc577f1a9   929  458bd6               movl r10,r14
0x321fc577f1ac   92c  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x321fc577f1b1   931  c5f92ef5             vucomisd xmm6,xmm5
0x321fc577f1b5   935  0f8a2a020000         jpe 0x321fc577f3e5  <+0xb65>
0x321fc577f1bb   93b  0f8524020000         jnz 0x321fc577f3e5  <+0xb65>
0x321fc577f1c1   941  458bfe               movl r15,r14
0x321fc577f1c4   944  413bd6               cmpl rdx,r14
0x321fc577f1c7   947  440f42fa             cmovcl r15,rdx
0x321fc577f1cb   94b  4c8bf7               REX.W movq r14,rdi
0x321fc577f1ce   94e  c5f82eda             vucomiss xmm3,xmm2
0x321fc577f1d2   952  450f47f7             cmoval r14,r15
0x321fc577f1d6   956  478d3c06             leal r15,[r14+r8*1]
0x321fc577f1da   95a  413bf7               cmpl rsi,r15
0x321fc577f1dd   95d  0f8625000000         jna 0x321fc577f208  <+0x988>
0x321fc577f1e3   963  468d3cb9             leal r15,[rcx+r15*4]
0x321fc577f1e7   967  478b343b             movl r14,[r11+r15*1]
0x321fc577f1eb   96b  413bde               cmpl rbx,r14
0x321fc577f1ee   96e  0f860c000000         jna 0x321fc577f200  <+0x980>
0x321fc577f1f4   974  468d34b0             leal r14,[rax+r14*4]
0x321fc577f1f8   978  47892433             movl [r11+r14*1],r12
0x321fc577f1fc   97c  478b343b             movl r14,[r11+r15*1]
0x321fc577f200   980  4183c601             addl r14,0x1
0x321fc577f204   984  4789343b             movl [r11+r15*1],r14
0x321fc577f208   988  4183c104             addl r9,0x4
0x321fc577f20c   98c  448b4590             movl r8,[rbp-0x70]
0x321fc577f210   990  4183c004             addl r8,0x4
0x321fc577f214   994  4183c401             addl r12,0x1
0x321fc577f218   998  448b75e8             movl r14,[rbp-0x18]
0x321fc577f21c   99c  4539e6               cmpl r14,r12
0x321fc577f21f   99f  0f855bfeffff         jnz 0x321fc577f080  <+0x800>
0x321fc577f225   9a5  e9e7fdffff           jmp 0x321fc577f011  <+0x791>
0x321fc577f22a   9aa  e8a162f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577f22f   9af  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577f233   9b3  8b5d90               movl rbx,[rbp-0x70]
0x321fc577f236   9b6  8b5588               movl rdx,[rbp-0x78]
0x321fc577f239   9b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x321fc577f23f   9bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577f243   9c3  8b4580               movl rax,[rbp-0x80]
0x321fc577f246   9c6  448b4dc0             movl r9,[rbp-0x40]
0x321fc577f24a   9ca  e968f6ffff           jmp 0x321fc577e8b7  <+0x37>
0x321fc577f24f   9cf  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x321fc577f256   9d6  488955b8             REX.W movq [rbp-0x48],rdx
0x321fc577f25a   9da  48894db0             REX.W movq [rbp-0x50],rcx
0x321fc577f25e   9de  4c894da8             REX.W movq [rbp-0x58],r9
0x321fc577f262   9e2  4c8945a0             REX.W movq [rbp-0x60],r8
0x321fc577f266   9e6  c5fb114598           vmovsd [rbp-0x68],xmm0
0x321fc577f26b   9eb  4c8975c0             REX.W movq [rbp-0x40],r14
0x321fc577f26f   9ef  e85c62f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577f274   9f4  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577f278   9f8  33ff                 xorl rdi,rdi
0x321fc577f27a   9fa  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577f27e   9fe  448b7dd0             movl r15,[rbp-0x30]
0x321fc577f282   a02  8b9d78ffffff         movl rbx,[rbp-0x88]
0x321fc577f288   a08  8b55b8               movl rdx,[rbp-0x48]
0x321fc577f28b   a0b  8b4db0               movl rcx,[rbp-0x50]
0x321fc577f28e   a0e  448b4da8             movl r9,[rbp-0x58]
0x321fc577f292   a12  448b45a0             movl r8,[rbp-0x60]
0x321fc577f296   a16  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x321fc577f29b   a1b  448b75c0             movl r14,[rbp-0x40]
0x321fc577f29f   a1f  e92af8ffff           jmp 0x321fc577eace  <+0x24e>
0x321fc577f2a4   a24  c5f92edb             vucomisd xmm3,xmm3
0x321fc577f2a8   a28  0f8b08000000         jpo 0x321fc577f2b6  <+0xa36>
0x321fc577f2ae   a2e  488bf7               REX.W movq rsi,rdi
0x321fc577f2b1   a31  e99bf8ffff           jmp 0x321fc577eb51  <+0x2d1>
0x321fc577f2b6   a36  c5f82eca             vucomiss xmm1,xmm2
0x321fc577f2ba   a3a  77f2                 ja 0x321fc577f2ae  <+0xa2e>
0x321fc577f2bc   a3c  beffffffff           movl rsi,0xffffffff
0x321fc577f2c1   a41  e98bf8ffff           jmp 0x321fc577eb51  <+0x2d1>
0x321fc577f2c6   a46  c5f92ee4             vucomisd xmm4,xmm4
0x321fc577f2ca   a4a  0f8b08000000         jpo 0x321fc577f2d8  <+0xa58>
0x321fc577f2d0   a50  488bc7               REX.W movq rax,rdi
0x321fc577f2d3   a53  e91cf9ffff           jmp 0x321fc577ebf4  <+0x374>
0x321fc577f2d8   a58  c5f82eca             vucomiss xmm1,xmm2
0x321fc577f2dc   a5c  77f2                 ja 0x321fc577f2d0  <+0xa50>
0x321fc577f2de   a5e  b8ffffffff           movl rax,0xffffffff
0x321fc577f2e3   a63  e90cf9ffff           jmp 0x321fc577ebf4  <+0x374>
0x321fc577f2e8   a68  488955c8             REX.W movq [rbp-0x38],rdx
0x321fc577f2ec   a6c  4c897598             REX.W movq [rbp-0x68],r14
0x321fc577f2f0   a70  48895da8             REX.W movq [rbp-0x58],rbx
0x321fc577f2f4   a74  48894db0             REX.W movq [rbp-0x50],rcx
0x321fc577f2f8   a78  e8d361f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577f2fd   a7d  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577f301   a81  33ff                 xorl rdi,rdi
0x321fc577f303   a83  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577f307   a87  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577f30b   a8b  8b4580               movl rax,[rbp-0x80]
0x321fc577f30e   a8e  448b7dd0             movl r15,[rbp-0x30]
0x321fc577f312   a92  448b4dc0             movl r9,[rbp-0x40]
0x321fc577f316   a96  8b55c8               movl rdx,[rbp-0x38]
0x321fc577f319   a99  448b7598             movl r14,[rbp-0x68]
0x321fc577f31d   a9d  8b5da8               movl rbx,[rbp-0x58]
0x321fc577f320   aa0  8b4db0               movl rcx,[rbp-0x50]
0x321fc577f323   aa3  e9a2f9ffff           jmp 0x321fc577ecca  <+0x44a>
0x321fc577f328   aa8  488955c8             REX.W movq [rbp-0x38],rdx
0x321fc577f32c   aac  4c8975b8             REX.W movq [rbp-0x48],r14
0x321fc577f330   ab0  48895da8             REX.W movq [rbp-0x58],rbx
0x321fc577f334   ab4  e89761f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577f339   ab9  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577f33d   abd  33ff                 xorl rdi,rdi
0x321fc577f33f   abf  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577f343   ac3  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x321fc577f347   ac7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577f34b   acb  8b4580               movl rax,[rbp-0x80]
0x321fc577f34e   ace  448b7dd0             movl r15,[rbp-0x30]
0x321fc577f352   ad2  448b4dc0             movl r9,[rbp-0x40]
0x321fc577f356   ad6  448b8578ffffff       movl r8,[rbp-0x88]
0x321fc577f35d   add  488b55c8             REX.W movq rdx,[rbp-0x38]
0x321fc577f361   ae1  448b75b8             movl r14,[rbp-0x48]
0x321fc577f365   ae5  8b5da8               movl rbx,[rbp-0x58]
0x321fc577f368   ae8  e962faffff           jmp 0x321fc577edcf  <+0x54f>
0x321fc577f36d   aed  4c8965e0             REX.W movq [rbp-0x20],r12
0x321fc577f371   af1  4c894d88             REX.W movq [rbp-0x78],r9
0x321fc577f375   af5  488945d0             REX.W movq [rbp-0x30],rax
0x321fc577f379   af9  48895dc8             REX.W movq [rbp-0x38],rbx
0x321fc577f37d   afd  48894dc0             REX.W movq [rbp-0x40],rcx
0x321fc577f381   b01  488975b8             REX.W movq [rbp-0x48],rsi
0x321fc577f385   b05  488955b0             REX.W movq [rbp-0x50],rdx
0x321fc577f389   b09  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x321fc577f38e   b0e  e83d61f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577f393   b13  448b65e0             movl r12,[rbp-0x20]
0x321fc577f397   b17  448b4d88             movl r9,[rbp-0x78]
0x321fc577f39b   b1b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x321fc577f39f   b1f  8b45d0               movl rax,[rbp-0x30]
0x321fc577f3a2   b22  8b5dc8               movl rbx,[rbp-0x38]
0x321fc577f3a5   b25  8b4dc0               movl rcx,[rbp-0x40]
0x321fc577f3a8   b28  8b75b8               movl rsi,[rbp-0x48]
0x321fc577f3ab   b2b  33ff                 xorl rdi,rdi
0x321fc577f3ad   b2d  8b55b0               movl rdx,[rbp-0x50]
0x321fc577f3b0   b30  c5f057c9             vxorps xmm1,xmm1,xmm1
0x321fc577f3b4   b34  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x321fc577f3b9   b39  448b7d98             movl r15,[rbp-0x68]
0x321fc577f3bd   b3d  e9d0fcffff           jmp 0x321fc577f092  <+0x812>
0x321fc577f3c2   b42  c5f92edb             vucomisd xmm3,xmm3
0x321fc577f3c6   b46  0f8b08000000         jpo 0x321fc577f3d4  <+0xb54>
0x321fc577f3cc   b4c  4c8bf7               REX.W movq r14,rdi
0x321fc577f3cf   b4f  e942fdffff           jmp 0x321fc577f116  <+0x896>
0x321fc577f3d4   b54  c5f82eca             vucomiss xmm1,xmm2
0x321fc577f3d8   b58  77f2                 ja 0x321fc577f3cc  <+0xb4c>
0x321fc577f3da   b5a  41beffffffff         movl r14,0xffffffff
0x321fc577f3e0   b60  e931fdffff           jmp 0x321fc577f116  <+0x896>
0x321fc577f3e5   b65  c5f92ee4             vucomisd xmm4,xmm4
0x321fc577f3e9   b69  0f8b08000000         jpo 0x321fc577f3f7  <+0xb77>
0x321fc577f3ef   b6f  4c8bf7               REX.W movq r14,rdi
0x321fc577f3f2   b72  e9cafdffff           jmp 0x321fc577f1c1  <+0x941>
0x321fc577f3f7   b77  c5f82eca             vucomiss xmm1,xmm2
0x321fc577f3fb   b7b  77f2                 ja 0x321fc577f3ef  <+0xb6f>
0x321fc577f3fd   b7d  41beffffffff         movl r14,0xffffffff
0x321fc577f403   b83  e9b9fdffff           jmp 0x321fc577f1c1  <+0x941>
0x321fc577f408   b88  e8035ef2ff           call 0x321fc56a5210  (jump table)
0x321fc577f40d   b8d  e8fe5df2ff           call 0x321fc56a5210  (jump table)
0x321fc577f412   b92  e8f95df2ff           call 0x321fc56a5210  (jump table)
0x321fc577f417   b97  90                   nop

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
0x321fc577e90e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x321fc577e90a  internal wasm call
0x321fc577e995  external reference (0x193f2f0)
0x321fc577ee07  internal wasm call
0x321fc577ee7f  external reference (0x193f270)
0x321fc577ef16  internal wasm call
0x321fc577f22b  wasm stub call  (0x321fc56a54d0)
0x321fc577f270  wasm stub call  (0x321fc56a54d0)
0x321fc577f2f9  wasm stub call  (0x321fc56a54d0)
0x321fc577f335  wasm stub call  (0x321fc56a54d0)
0x321fc577f38f  wasm stub call  (0x321fc56a54d0)
0x321fc577f409  wasm stub call  (0x321fc56a5210)
0x321fc577f40e  wasm stub call  (0x321fc56a5210)
0x321fc577f413  wasm stub call  (0x321fc56a5210)
