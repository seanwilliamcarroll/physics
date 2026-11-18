name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2984 + 24 padding)
Instructions (size = 2968)
0x177442cbe780     0  55                   push rbp
0x177442cbe781     1  4889e5               REX.W movq rbp,rsp
0x177442cbe784     4  6a08                 push 0x8
0x177442cbe786     6  56                   push rsi
0x177442cbe787     7  4881ec80000000       REX.W subq rsp,0x80
0x177442cbe78e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x177442cbe792    12  48894580             REX.W movq [rbp-0x80],rax
0x177442cbe796    16  48895588             REX.W movq [rbp-0x78],rdx
0x177442cbe79a    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x177442cbe7a1    21  48895d90             REX.W movq [rbp-0x70],rbx
0x177442cbe7a5    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x177442cbe7a9    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x177442cbe7ad    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbe7b1    31  0f8673090000         jna 0x177442cbf12a  <+0x9aa>
0x177442cbe7b7    37  448be0               movl r12,rax
0x177442cbe7ba    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x177442cbe7c3    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x177442cbe7c8    48  478b742328           movl r14,[r11+r12*1+0x28]
0x177442cbe7cd    4d  450faff7             imull r14,r15
0x177442cbe7d1    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x177442cbe7d5    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x177442cbe7d9    59  4d8bfe               REX.W movq r15,r14
0x177442cbe7dc    5c  4183c701             addl r15,0x1
0x177442cbe7e0    60  0f850c000000         jnz 0x177442cbe7f2  <+0x72>
0x177442cbe7e6    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x177442cbe7ea    6a  4533ff               xorl r15,r15
0x177442cbe7ed    6d  e928010000           jmp 0x177442cbe91a  <+0x19a>
0x177442cbe7f2    72  438b3c23             movl rdi,[r11+r12*1]
0x177442cbe7f6    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x177442cbe7fa    7a  47393c23             cmpl [r11+r12*1],r15
0x177442cbe7fe    7e  0f8341000000         jnc 0x177442cbe845  <+0xc5>
0x177442cbe804    84  498bcf               REX.W movq rcx,r15
0x177442cbe807    87  33d2                 xorl rdx,rdx
0x177442cbe809    89  e8f254f2ff           call 0x177442be3d00  (jump table)
0x177442cbe80e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x177442cbe812    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x177442cbe816    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x177442cbe81b    9b  4489e7               movl rdi,r12
0x177442cbe81e    9e  4d8be3               REX.W movq r12,r11
0x177442cbe821    a1  4c8bdb               REX.W movq r11,rbx
0x177442cbe824    a4  8b5588               movl rdx,[rbp-0x78]
0x177442cbe827    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbe82d    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbe831    b1  8b4580               movl rax,[rbp-0x80]
0x177442cbe834    b4  448b4dc0             movl r9,[rbp-0x40]
0x177442cbe838    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x177442cbe83c    bc  448b75b0             movl r14,[rbp-0x50]
0x177442cbe840    c0  e902000000           jmp 0x177442cbe847  <+0xc7>
0x177442cbe845    c5  33ff                 xorl rdi,rdi
0x177442cbe847    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x177442cbe84c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x177442cbe850    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x177442cbe854    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x177442cbe858    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x177442cbe85c    dc  4585f6               testl r14,r14
0x177442cbe85f    df  0f84a4000000         jz 0x177442cbe909  <+0x189>
0x177442cbe865    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x177442cbe86d    ed  83c3fc               addl rbx,0xfc
0x177442cbe870    f0  0f8480000000         jz 0x177442cbe8f6  <+0x176>
0x177442cbe876    f6  4989e2               REX.W movq r10,rsp
0x177442cbe879    f9  4883ec08             REX.W subq rsp,0x8
0x177442cbe87d    fd  4883e4f0             REX.W andq rsp,0xf0
0x177442cbe881   101  4c891424             REX.W movq [rsp],r10
0x177442cbe885   105  488bfe               REX.W movq rdi,rsi
0x177442cbe888   108  4c8bc3               REX.W movq r8,rbx
0x177442cbe88b   10b  8b55e8               movl rdx,[rbp-0x18]
0x177442cbe88e   10e  33c9                 xorl rcx,rcx
0x177442cbe890   110  488bf1               REX.W movq rsi,rcx
0x177442cbe893   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x177442cbe89d   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x177442cbe8a4   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x177442cbe8ab   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x177442cbe8b2   132  ffd0                 call rax
0x177442cbe8b4   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x177442cbe8bf   13f  488b2424             REX.W movq rsp,[rsp]
0x177442cbe8c3   143  85c0                 testl rax,rax
0x177442cbe8c5   145  0f84470a0000         jz 0x177442cbf312  <+0xb92>
0x177442cbe8cb   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbe8cf   14f  8b5588               movl rdx,[rbp-0x78]
0x177442cbe8d2   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbe8d6   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbe8dc   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbe8e0   160  8b4580               movl rax,[rbp-0x80]
0x177442cbe8e3   163  448b4dc0             movl r9,[rbp-0x40]
0x177442cbe8e7   167  8b7db8               movl rdi,[rbp-0x48]
0x177442cbe8ea   16a  448b45c8             movl r8,[rbp-0x38]
0x177442cbe8ee   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x177442cbe8f2   172  448b75b0             movl r14,[rbp-0x50]
0x177442cbe8f6   176  8bdf                 movl rbx,rdi
0x177442cbe8f8   178  4403f3               addl r14,rbx
0x177442cbe8fb   17b  4103df               addl rbx,r15
0x177442cbe8fe   17e  458bf8               movl r15,r8
0x177442cbe901   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x177442cbe906   186  418bfe               movl rdi,r14
0x177442cbe909   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x177442cbe911   191  8d5f01               leal rbx,[rdi+0x1]
0x177442cbe914   194  448bfb               movl r15,rbx
0x177442cbe917   197  8b5d90               movl rbx,[rbp-0x70]
0x177442cbe91a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x177442cbe91f   19f  458bc1               movl r8,r9
0x177442cbe922   1a2  448bf1               movl r14,rcx
0x177442cbe925   1a5  443bc1               cmpl r8,rcx
0x177442cbe928   1a8  450f42f0             cmovcl r14,r8
0x177442cbe92c   1ac  33ff                 xorl rdi,rdi
0x177442cbe92e   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x177442cbe932   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x177442cbe936   1b6  4585f6               testl r14,r14
0x177442cbe939   1b9  0f850e000000         jnz 0x177442cbe94d  <+0x1cd>
0x177442cbe93f   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x177442cbe944   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbe948   1c8  e910020000           jmp 0x177442cbeb5d  <+0x3dd>
0x177442cbe94d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x177442cbe952   1d2  4533c9               xorl r9,r9
0x177442cbe955   1d5  4585c0               testl r8,r8
0x177442cbe958   1d8  410f95c1             setnzl r9l
0x177442cbe95c   1dc  452bc1               subl r8,r9
0x177442cbe95f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x177442cbe964   1e4  33db                 xorl rbx,rbx
0x177442cbe966   1e6  4585c9               testl r9,r9
0x177442cbe969   1e9  0f95c3               setnzl bl
0x177442cbe96c   1ec  458bf1               movl r14,r9
0x177442cbe96f   1ef  442bf3               subl r14,rbx
0x177442cbe972   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x177442cbe977   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x177442cbe97e   1fe  448b55e8             movl r10,[rbp-0x18]
0x177442cbe982   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x177442cbe986   206  8bca                 movl rcx,rdx
0x177442cbe988   208  8b5590               movl rdx,[rbp-0x70]
0x177442cbe98b   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbe98f   20f  e930000000           jmp 0x177442cbe9c4  <+0x244>
0x177442cbe994   214  660f1f840000000000   nop
0x177442cbe99d   21d  660f1f840000000000   nop
0x177442cbe9a6   226  660f1f840000000000   nop
0x177442cbe9af   22f  660f1f840000000000   nop
0x177442cbe9b8   238  0f1f840000000000     nop
0x177442cbe9c0   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x177442cbe9c4   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbe9c8   248  0f8681070000         jna 0x177442cbf14f  <+0x9cf>
0x177442cbe9ce   24e  8bf1                 movl rsi,rcx
0x177442cbe9d0   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x177442cbe9d6   256  c5f82ed2             vucomiss xmm2,xmm2
0x177442cbe9da   25a  7a06                 jpe 0x177442cbe9e2  <+0x262>
0x177442cbe9dc   25c  0f8404000000         jz 0x177442cbe9e6  <+0x266>
0x177442cbe9e2   262  c5f928d1             vmovapd xmm2,xmm1
0x177442cbe9e6   266  c5f82ed1             vucomiss xmm2,xmm1
0x177442cbe9ea   26a  0f8704000000         ja 0x177442cbe9f4  <+0x274>
0x177442cbe9f0   270  c5f928d1             vmovapd xmm2,xmm1
0x177442cbe9f4   274  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x177442cbe9fa   27a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x177442cbe9fe   27e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x177442cbea04   284  c5fb2cf4             vcvttsd2si rsi,xmm4
0x177442cbea08   288  85f6                 testl rsi,rsi
0x177442cbea0a   28a  0f8929000000         jns 0x177442cbea39  <+0x2b9>
0x177442cbea10   290  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x177442cbea1a   29a  c441f96efa           vmovq xmm15,r10
0x177442cbea1f   29f  c50358fc             vaddsd xmm15,xmm15,xmm4
0x177442cbea23   2a3  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x177442cbea28   2a8  85f6                 testl rsi,rsi
0x177442cbea2a   2aa  0f8809000000         js 0x177442cbea39  <+0x2b9>
0x177442cbea30   2b0  41ba00000080         movl r10,0x80000000
0x177442cbea36   2b6  410bf2               orl rsi,r10
0x177442cbea39   2b9  448bd6               movl r10,rsi
0x177442cbea3c   2bc  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x177442cbea41   2c1  c5f92eec             vucomisd xmm5,xmm4
0x177442cbea45   2c5  0f8a59070000         jpe 0x177442cbf1a4  <+0xa24>
0x177442cbea4b   2cb  0f8553070000         jnz 0x177442cbf1a4  <+0xa24>
0x177442cbea51   2d1  8bc6                 movl rax,rsi
0x177442cbea53   2d3  443bf6               cmpl r14,rsi
0x177442cbea56   2d6  410f42c6             cmovcl rax,r14
0x177442cbea5a   2da  83c001               addl rax,0x1
0x177442cbea5d   2dd  41ba0000804f         movl r10,0x4f800000
0x177442cbea63   2e3  c4c1796eda           vmovd xmm3,r10
0x177442cbea68   2e8  be01000000           movl rsi,0x1
0x177442cbea6d   2ed  c5f82eda             vucomiss xmm3,xmm2
0x177442cbea71   2f1  0f47f0               cmoval rsi,rax
0x177442cbea74   2f4  8bc2                 movl rax,rdx
0x177442cbea76   2f6  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x177442cbea7c   2fc  c5f82ed2             vucomiss xmm2,xmm2
0x177442cbea80   300  7a06                 jpe 0x177442cbea88  <+0x308>
0x177442cbea82   302  0f8404000000         jz 0x177442cbea8c  <+0x30c>
0x177442cbea88   308  c5f928d1             vmovapd xmm2,xmm1
0x177442cbea8c   30c  c5f82ed1             vucomiss xmm2,xmm1
0x177442cbea90   310  0f8704000000         ja 0x177442cbea9a  <+0x31a>
0x177442cbea96   316  c5f928d1             vmovapd xmm2,xmm1
0x177442cbea9a   31a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x177442cbeaa0   320  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x177442cbeaa4   324  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x177442cbeaaa   32a  c5fb2cc5             vcvttsd2si rax,xmm5
0x177442cbeaae   32e  85c0                 testl rax,rax
0x177442cbeab0   330  0f8926000000         jns 0x177442cbeadc  <+0x35c>
0x177442cbeab6   336  4c8b1555ffffff       REX.W movq r10,[rip+0xffffff55]
0x177442cbeabd   33d  c441f96efa           vmovq xmm15,r10
0x177442cbeac2   342  c50358fd             vaddsd xmm15,xmm15,xmm5
0x177442cbeac6   346  c4c17b2cc7           vcvttsd2si rax,xmm15
0x177442cbeacb   34b  85c0                 testl rax,rax
0x177442cbeacd   34d  0f8809000000         js 0x177442cbeadc  <+0x35c>
0x177442cbead3   353  41ba00000080         movl r10,0x80000000
0x177442cbead9   359  410bc2               orl rax,r10
0x177442cbeadc   35c  448bd0               movl r10,rax
0x177442cbeadf   35f  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x177442cbeae4   364  c5f92ef5             vucomisd xmm6,xmm5
0x177442cbeae8   368  0f8ad8060000         jpe 0x177442cbf1c6  <+0xa46>
0x177442cbeaee   36e  0f85d2060000         jnz 0x177442cbf1c6  <+0xa46>
0x177442cbeaf4   374  448be0               movl r12,rax
0x177442cbeaf7   377  443bc0               cmpl r8,rax
0x177442cbeafa   37a  450f42e0             cmovcl r12,r8
0x177442cbeafe   37e  488bc7               REX.W movq rax,rdi
0x177442cbeb01   381  c5f82eda             vucomiss xmm3,xmm2
0x177442cbeb05   385  410f47c4             cmoval rax,r12
0x177442cbeb09   389  458be1               movl r12,r9
0x177442cbeb0c   38c  440fafe0             imull r12,rax
0x177442cbeb10   390  4403e6               addl r12,rsi
0x177442cbeb13   393  4539e7               cmpl r15,r12
0x177442cbeb16   396  0f860f000000         jna 0x177442cbeb2b  <+0x3ab>
0x177442cbeb1c   39c  468d24a3             leal r12,[rbx+r12*4]
0x177442cbeb20   3a0  438b0423             movl rax,[r11+r12*1]
0x177442cbeb24   3a4  83c001               addl rax,0x1
0x177442cbeb27   3a7  43890423             movl [r11+r12*1],rax
0x177442cbeb2b   3ab  83c104               addl rcx,0x4
0x177442cbeb2e   3ae  83c204               addl rdx,0x4
0x177442cbeb31   3b1  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x177442cbeb35   3b5  4183c4ff             addl r12,0xff
0x177442cbeb39   3b9  0f8581feffff         jnz 0x177442cbe9c0  <+0x240>
0x177442cbeb3f   3bf  448bc3               movl r8,rbx
0x177442cbeb42   3c2  448b75e8             movl r14,[rbp-0x18]
0x177442cbeb46   3c6  8b5d90               movl rbx,[rbp-0x70]
0x177442cbeb49   3c9  8b5588               movl rdx,[rbp-0x78]
0x177442cbeb4c   3cc  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbeb50   3d0  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbeb56   3d6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbeb5a   3da  8b4580               movl rax,[rbp-0x80]
0x177442cbeb5d   3dd  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x177442cbeb64   3e4  4585ff               testl r15,r15
0x177442cbeb67   3e7  0f8508000000         jnz 0x177442cbeb75  <+0x3f5>
0x177442cbeb6d   3ed  488bdf               REX.W movq rbx,rdi
0x177442cbeb70   3f0  e95c020000           jmp 0x177442cbedd1  <+0x651>
0x177442cbeb75   3f5  468d0cbd00000000     leal r9,[r15*4+0x0]
0x177442cbeb7d   3fd  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x177442cbeb85   405  448bf3               movl r14,rbx
0x177442cbeb88   408  41c1ee02             shrl r14, 2
0x177442cbeb8c   40c  4183c601             addl r14,0x1
0x177442cbeb90   410  418bd6               movl rdx,r14
0x177442cbeb93   413  83e207               andl rdx,0x7
0x177442cbeb96   416  4c894dc0             REX.W movq [rbp-0x40],r9
0x177442cbeb9a   41a  83fb1c               cmpl rbx,0x1c
0x177442cbeb9d   41d  0f82cf000000         jc 0x177442cbec72  <+0x4f2>
0x177442cbeba3   423  4181e6f8ffff7f       andl r14,0x7ffffff8
0x177442cbebaa   42a  418bd8               movl rbx,r8
0x177442cbebad   42d  488bcf               REX.W movq rcx,rdi
0x177442cbebb0   430  660f1f840000000000   nop
0x177442cbebb9   439  0f1f8000000000       nop
0x177442cbebc0   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbebc4   444  0f861e060000         jna 0x177442cbf1e8  <+0xa68>
0x177442cbebca   44a  418b341b             movl rsi,[r11+rbx*1]
0x177442cbebce   44e  03ce                 addl rcx,rsi
0x177442cbebd0   450  41890c1b             movl [r11+rbx*1],rcx
0x177442cbebd4   454  8d7304               leal rsi,[rbx+0x4]
0x177442cbebd7   457  458b0433             movl r8,[r11+rsi*1]
0x177442cbebdb   45b  4103c8               addl rcx,r8
0x177442cbebde   45e  41890c33             movl [r11+rsi*1],rcx
0x177442cbebe2   462  8d7308               leal rsi,[rbx+0x8]
0x177442cbebe5   465  458b0433             movl r8,[r11+rsi*1]
0x177442cbebe9   469  4103c8               addl rcx,r8
0x177442cbebec   46c  41890c33             movl [r11+rsi*1],rcx
0x177442cbebf0   470  8d730c               leal rsi,[rbx+0xc]
0x177442cbebf3   473  458b0433             movl r8,[r11+rsi*1]
0x177442cbebf7   477  4103c8               addl rcx,r8
0x177442cbebfa   47a  41890c33             movl [r11+rsi*1],rcx
0x177442cbebfe   47e  8d7310               leal rsi,[rbx+0x10]
0x177442cbec01   481  458b0433             movl r8,[r11+rsi*1]
0x177442cbec05   485  4103c8               addl rcx,r8
0x177442cbec08   488  41890c33             movl [r11+rsi*1],rcx
0x177442cbec0c   48c  8d7314               leal rsi,[rbx+0x14]
0x177442cbec0f   48f  458b0433             movl r8,[r11+rsi*1]
0x177442cbec13   493  4103c8               addl rcx,r8
0x177442cbec16   496  41890c33             movl [r11+rsi*1],rcx
0x177442cbec1a   49a  8d7318               leal rsi,[rbx+0x18]
0x177442cbec1d   49d  458b0433             movl r8,[r11+rsi*1]
0x177442cbec21   4a1  4103c8               addl rcx,r8
0x177442cbec24   4a4  41890c33             movl [r11+rsi*1],rcx
0x177442cbec28   4a8  8d731c               leal rsi,[rbx+0x1c]
0x177442cbec2b   4ab  458b0433             movl r8,[r11+rsi*1]
0x177442cbec2f   4af  4103c8               addl rcx,r8
0x177442cbec32   4b2  41890c33             movl [r11+rsi*1],rcx
0x177442cbec36   4b6  83c320               addl rbx,0x20
0x177442cbec39   4b9  4183c6f8             addl r14,0xf8
0x177442cbec3d   4bd  7581                 jnz 0x177442cbebc0  <+0x440>
0x177442cbec3f   4bf  85d2                 testl rdx,rdx
0x177442cbec41   4c1  0f8510000000         jnz 0x177442cbec57  <+0x4d7>
0x177442cbec47   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbec4b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x177442cbec52   4d2  e98b000000           jmp 0x177442cbece2  <+0x562>
0x177442cbec57   4d7  448bf3               movl r14,rbx
0x177442cbec5a   4da  8bd9                 movl rbx,rcx
0x177442cbec5c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbec62   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbec66   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x177442cbec6d   4ed  e906000000           jmp 0x177442cbec78  <+0x4f8>
0x177442cbec72   4f2  488bdf               REX.W movq rbx,rdi
0x177442cbec75   4f5  458bf0               movl r14,r8
0x177442cbec78   4f8  c1e202               shll rdx, 2
0x177442cbec7b   4fb  0f1f440000           nop
0x177442cbec80   500  438b0c33             movl rcx,[r11+r14*1]
0x177442cbec84   504  03d9                 addl rbx,rcx
0x177442cbec86   506  43891c33             movl [r11+r14*1],rbx
0x177442cbec8a   50a  4183c604             addl r14,0x4
0x177442cbec8e   50e  83c2fc               addl rdx,0xfc
0x177442cbec91   511  0f844b000000         jz 0x177442cbece2  <+0x562>
0x177442cbec97   517  438b0c33             movl rcx,[r11+r14*1]
0x177442cbec9b   51b  03d9                 addl rbx,rcx
0x177442cbec9d   51d  43891c33             movl [r11+r14*1],rbx
0x177442cbeca1   521  4183c604             addl r14,0x4
0x177442cbeca5   525  83c2fc               addl rdx,0xfc
0x177442cbeca8   528  0f8434000000         jz 0x177442cbece2  <+0x562>
0x177442cbecae   52e  438b0c33             movl rcx,[r11+r14*1]
0x177442cbecb2   532  03d9                 addl rbx,rcx
0x177442cbecb4   534  43891c33             movl [r11+r14*1],rbx
0x177442cbecb8   538  4183c604             addl r14,0x4
0x177442cbecbc   53c  83c2fc               addl rdx,0xfc
0x177442cbecbf   53f  0f841d000000         jz 0x177442cbece2  <+0x562>
0x177442cbecc5   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbecc9   549  0f8659050000         jna 0x177442cbf228  <+0xaa8>
0x177442cbeccf   54f  438b0c33             movl rcx,[r11+r14*1]
0x177442cbecd3   553  03d9                 addl rbx,rcx
0x177442cbecd5   555  43891c33             movl [r11+r14*1],rbx
0x177442cbecd9   559  4183c604             addl r14,0x4
0x177442cbecdd   55d  83c2fc               addl rdx,0xfc
0x177442cbece0   560  759e                 jnz 0x177442cbec80  <+0x500>
0x177442cbece2   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x177442cbeceb   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x177442cbecf0   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x177442cbecf5   575  0f834a000000         jnc 0x177442cbed45  <+0x5c5>
0x177442cbecfb   57b  8bd8                 movl rbx,rax
0x177442cbecfd   57d  8d430c               leal rax,[rbx+0xc]
0x177442cbed00   580  418bcf               movl rcx,r15
0x177442cbed03   583  488bd7               REX.W movq rdx,rdi
0x177442cbed06   586  e8f54ff2ff           call 0x177442be3d00  (jump table)
0x177442cbed0b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x177442cbed0f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x177442cbed13   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x177442cbed18   598  4c8bd3               REX.W movq r10,rbx
0x177442cbed1b   59b  4489e3               movl rbx,r12
0x177442cbed1e   59e  4d8be3               REX.W movq r12,r11
0x177442cbed21   5a1  4d8bda               REX.W movq r11,r10
0x177442cbed24   5a4  33ff                 xorl rdi,rdi
0x177442cbed26   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbed2a   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbed2e   5ae  8b4580               movl rax,[rbp-0x80]
0x177442cbed31   5b1  448b7dd0             movl r15,[rbp-0x30]
0x177442cbed35   5b5  448b4dc0             movl r9,[rbp-0x40]
0x177442cbed39   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x177442cbed40   5c0  e903000000           jmp 0x177442cbed48  <+0x5c8>
0x177442cbed45   5c5  488bdf               REX.W movq rbx,rdi
0x177442cbed48   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x177442cbed4c   5cc  4d8bf7               REX.W movq r14,r15
0x177442cbed4f   5cf  41c1e602             shll r14, 2
0x177442cbed53   5d3  0f8478000000         jz 0x177442cbedd1  <+0x651>
0x177442cbed59   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x177442cbed5e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x177442cbed62   5e2  4989e2               REX.W movq r10,rsp
0x177442cbed65   5e5  4883ec08             REX.W subq rsp,0x8
0x177442cbed69   5e9  4883e4f0             REX.W andq rsp,0xf0
0x177442cbed6d   5ed  4c891424             REX.W movq [rsp],r10
0x177442cbed71   5f1  488bd7               REX.W movq rdx,rdi
0x177442cbed74   5f4  4c8bd7               REX.W movq r10,rdi
0x177442cbed77   5f7  488bfe               REX.W movq rdi,rsi
0x177442cbed7a   5fa  498bf2               REX.W movq rsi,r10
0x177442cbed7d   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x177442cbed87   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x177442cbed8e   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x177442cbed95   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x177442cbed9c   61c  ffd0                 call rax
0x177442cbed9e   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x177442cbeda9   629  488b2424             REX.W movq rsp,[rsp]
0x177442cbedad   62d  85c0                 testl rax,rax
0x177442cbedaf   62f  0f8458050000         jz 0x177442cbf30d  <+0xb8d>
0x177442cbedb5   635  8b5dc8               movl rbx,[rbp-0x38]
0x177442cbedb8   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbedbc   63c  33ff                 xorl rdi,rdi
0x177442cbedbe   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbedc2   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbedc6   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbedca   64a  8b4580               movl rax,[rbp-0x80]
0x177442cbedcd   64d  448b7dd0             movl r15,[rbp-0x30]
0x177442cbedd1   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x177442cbedda   65a  4103df               addl rbx,r15
0x177442cbeddd   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x177442cbede2   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x177442cbede9   669  0f8508000000         jnz 0x177442cbedf7  <+0x677>
0x177442cbedef   66f  488bdf               REX.W movq rbx,rdi
0x177442cbedf2   672  e90b010000           jmp 0x177442cbef02  <+0x782>
0x177442cbedf7   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x177442cbedfc   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbee02   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x177442cbee07   687  0f833b000000         jnc 0x177442cbee48  <+0x6c8>
0x177442cbee0d   68d  8bd8                 movl rbx,rax
0x177442cbee0f   68f  8d4318               leal rax,[rbx+0x18]
0x177442cbee12   692  488bd7               REX.W movq rdx,rdi
0x177442cbee15   695  e8e64ef2ff           call 0x177442be3d00  (jump table)
0x177442cbee1a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x177442cbee1e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x177442cbee22   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x177442cbee27   6a7  4c8bd3               REX.W movq r10,rbx
0x177442cbee2a   6aa  4489e3               movl rbx,r12
0x177442cbee2d   6ad  4d8be3               REX.W movq r12,r11
0x177442cbee30   6b0  4d8bda               REX.W movq r11,r10
0x177442cbee33   6b3  33ff                 xorl rdi,rdi
0x177442cbee35   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbee39   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbee3f   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbee43   6c3  e903000000           jmp 0x177442cbee4b  <+0x6cb>
0x177442cbee48   6c8  488bdf               REX.W movq rbx,rdi
0x177442cbee4b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x177442cbee50   6d0  418d149f             leal rdx,[r15+rbx*4]
0x177442cbee54   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x177442cbee58   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x177442cbee5c   6dc  83f901               cmpl rcx,0x1
0x177442cbee5f   6df  0f8492000000         jz 0x177442cbeef7  <+0x777>
0x177442cbee65   6e5  448bf1               movl r14,rcx
0x177442cbee68   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x177442cbee70   6f0  83c0fc               addl rax,0xfc
0x177442cbee73   6f3  0f846f000000         jz 0x177442cbeee8  <+0x768>
0x177442cbee79   6f9  4989e2               REX.W movq r10,rsp
0x177442cbee7c   6fc  4883ec08             REX.W subq rsp,0x8
0x177442cbee80   700  4883e4f0             REX.W andq rsp,0xf0
0x177442cbee84   704  4c891424             REX.W movq [rsp],r10
0x177442cbee88   708  488bcf               REX.W movq rcx,rdi
0x177442cbee8b   70b  4c8bd7               REX.W movq r10,rdi
0x177442cbee8e   70e  488bfe               REX.W movq rdi,rsi
0x177442cbee91   711  498bf2               REX.W movq rsi,r10
0x177442cbee94   714  4c8bc0               REX.W movq r8,rax
0x177442cbee97   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x177442cbee9e   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x177442cbeea5   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x177442cbeeac   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x177442cbeeb3   733  ffd0                 call rax
0x177442cbeeb5   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x177442cbeec0   740  488b2424             REX.W movq rsp,[rsp]
0x177442cbeec4   744  85c0                 testl rax,rax
0x177442cbeec6   746  0f843c040000         jz 0x177442cbf308  <+0xb88>
0x177442cbeecc   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbeed0   750  33ff                 xorl rdi,rdi
0x177442cbeed2   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbeed6   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbeeda   75a  8b5dd0               movl rbx,[rbp-0x30]
0x177442cbeedd   75d  448b7dc8             movl r15,[rbp-0x38]
0x177442cbeee1   761  448bb570ffffff       movl r14,[rbp-0x90]
0x177442cbeee8   768  4103de               addl rbx,r14
0x177442cbeeeb   76b  448d73ff             leal r14,[rbx-0x1]
0x177442cbeeef   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x177442cbeef4   774  418bde               movl rbx,r14
0x177442cbeef7   777  41c7041300000000     movl [r11+rdx*1],0x0
0x177442cbeeff   77f  83c301               addl rbx,0x1
0x177442cbef02   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x177442cbef07   787  837de800             cmpl [rbp-0x18],0x0
0x177442cbef0b   78b  0f8505000000         jnz 0x177442cbef16  <+0x796>
0x177442cbef11   791  488be5               REX.W movq rsp,rbp
0x177442cbef14   794  5d                   pop rbp
0x177442cbef15   795  c3                   retl
0x177442cbef16   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x177442cbef1b   79b  4533f6               xorl r14,r14
0x177442cbef1e   79e  4585ff               testl r15,r15
0x177442cbef21   7a1  410f95c6             setnzl r14l
0x177442cbef25   7a5  452bfe               subl r15,r14
0x177442cbef28   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x177442cbef2d   7ad  33c0                 xorl rax,rax
0x177442cbef2f   7af  4585f6               testl r14,r14
0x177442cbef32   7b2  0f95c0               setnzl al
0x177442cbef35   7b5  418bd6               movl rdx,r14
0x177442cbef38   7b8  2bd0                 subl rdx,rax
0x177442cbef3a   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x177442cbef3f   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x177442cbef44   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x177442cbef49   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x177442cbef50   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x177442cbef54   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x177442cbef58   7d8  4c8be7               REX.W movq r12,rdi
0x177442cbef5b   7db  448b4d88             movl r9,[rbp-0x78]
0x177442cbef5f   7df  e924000000           jmp 0x177442cbef88  <+0x808>
0x177442cbef64   7e4  660f1f840000000000   nop
0x177442cbef6d   7ed  660f1f840000000000   nop
0x177442cbef76   7f6  660f1f840000000000   nop
0x177442cbef7f   7ff  90                   nop
0x177442cbef80   800  448b7d98             movl r15,[rbp-0x68]
0x177442cbef84   804  4c894590             REX.W movq [rbp-0x70],r8
0x177442cbef88   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbef8c   80c  0f86db020000         jna 0x177442cbf26d  <+0xaed>
0x177442cbef92   812  448b7590             movl r14,[rbp-0x70]
0x177442cbef96   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x177442cbef9c   81c  c5f82ed2             vucomiss xmm2,xmm2
0x177442cbefa0   820  7a06                 jpe 0x177442cbefa8  <+0x828>
0x177442cbefa2   822  0f8404000000         jz 0x177442cbefac  <+0x82c>
0x177442cbefa8   828  c5f928d1             vmovapd xmm2,xmm1
0x177442cbefac   82c  c5f82ed1             vucomiss xmm2,xmm1
0x177442cbefb0   830  0f8704000000         ja 0x177442cbefba  <+0x83a>
0x177442cbefb6   836  c5f928d1             vmovapd xmm2,xmm1
0x177442cbefba   83a  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x177442cbefc0   840  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x177442cbefc4   844  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x177442cbefca   84a  c57b2cf4             vcvttsd2si r14,xmm4
0x177442cbefce   84e  4585f6               testl r14,r14
0x177442cbefd1   851  0f8927000000         jns 0x177442cbeffe  <+0x87e>
0x177442cbefd7   857  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x177442cbefde   85e  c441f96efa           vmovq xmm15,r10
0x177442cbefe3   863  c50358fc             vaddsd xmm15,xmm15,xmm4
0x177442cbefe7   867  c4417b2cf7           vcvttsd2si r14,xmm15
0x177442cbefec   86c  4585f6               testl r14,r14
0x177442cbefef   86f  0f8809000000         js 0x177442cbeffe  <+0x87e>
0x177442cbeff5   875  41ba00000080         movl r10,0x80000000
0x177442cbeffb   87b  450bf2               orl r14,r10
0x177442cbeffe   87e  458bd6               movl r10,r14
0x177442cbf001   881  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x177442cbf006   886  c5f92eec             vucomisd xmm5,xmm4
0x177442cbf00a   88a  0f8ab2020000         jpe 0x177442cbf2c2  <+0xb42>
0x177442cbf010   890  0f85ac020000         jnz 0x177442cbf2c2  <+0xb42>
0x177442cbf016   896  458bc6               movl r8,r14
0x177442cbf019   899  453bfe               cmpl r15,r14
0x177442cbf01c   89c  450f42c7             cmovcl r8,r15
0x177442cbf020   8a0  41ba0000804f         movl r10,0x4f800000
0x177442cbf026   8a6  c4c1796eda           vmovd xmm3,r10
0x177442cbf02b   8ab  4c8bf7               REX.W movq r14,rdi
0x177442cbf02e   8ae  c5f82eda             vucomiss xmm3,xmm2
0x177442cbf032   8b2  450f47f0             cmoval r14,r8
0x177442cbf036   8b6  448b45a0             movl r8,[rbp-0x60]
0x177442cbf03a   8ba  450fafc6             imull r8,r14
0x177442cbf03e   8be  458bf1               movl r14,r9
0x177442cbf041   8c1  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x177442cbf047   8c7  c5f82ed2             vucomiss xmm2,xmm2
0x177442cbf04b   8cb  7a06                 jpe 0x177442cbf053  <+0x8d3>
0x177442cbf04d   8cd  0f8404000000         jz 0x177442cbf057  <+0x8d7>
0x177442cbf053   8d3  c5f928d1             vmovapd xmm2,xmm1
0x177442cbf057   8d7  c5f82ed1             vucomiss xmm2,xmm1
0x177442cbf05b   8db  0f8704000000         ja 0x177442cbf065  <+0x8e5>
0x177442cbf061   8e1  c5f928d1             vmovapd xmm2,xmm1
0x177442cbf065   8e5  c4e3690ad209         vroundss xmm2,xmm2,xmm2,0x9
0x177442cbf06b   8eb  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x177442cbf06f   8ef  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x177442cbf075   8f5  c57b2cf5             vcvttsd2si r14,xmm5
0x177442cbf079   8f9  4585f6               testl r14,r14
0x177442cbf07c   8fc  0f8927000000         jns 0x177442cbf0a9  <+0x929>
0x177442cbf082   902  4c8b1589f9ffff       REX.W movq r10,[rip+0xfffff989]
0x177442cbf089   909  c441f96efa           vmovq xmm15,r10
0x177442cbf08e   90e  c50358fd             vaddsd xmm15,xmm15,xmm5
0x177442cbf092   912  c4417b2cf7           vcvttsd2si r14,xmm15
0x177442cbf097   917  4585f6               testl r14,r14
0x177442cbf09a   91a  0f8809000000         js 0x177442cbf0a9  <+0x929>
0x177442cbf0a0   920  41ba00000080         movl r10,0x80000000
0x177442cbf0a6   926  450bf2               orl r14,r10
0x177442cbf0a9   929  458bd6               movl r10,r14
0x177442cbf0ac   92c  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x177442cbf0b1   931  c5f92ef5             vucomisd xmm6,xmm5
0x177442cbf0b5   935  0f8a2a020000         jpe 0x177442cbf2e5  <+0xb65>
0x177442cbf0bb   93b  0f8524020000         jnz 0x177442cbf2e5  <+0xb65>
0x177442cbf0c1   941  458bfe               movl r15,r14
0x177442cbf0c4   944  413bd6               cmpl rdx,r14
0x177442cbf0c7   947  440f42fa             cmovcl r15,rdx
0x177442cbf0cb   94b  4c8bf7               REX.W movq r14,rdi
0x177442cbf0ce   94e  c5f82eda             vucomiss xmm3,xmm2
0x177442cbf0d2   952  450f47f7             cmoval r14,r15
0x177442cbf0d6   956  478d3c06             leal r15,[r14+r8*1]
0x177442cbf0da   95a  413bf7               cmpl rsi,r15
0x177442cbf0dd   95d  0f8625000000         jna 0x177442cbf108  <+0x988>
0x177442cbf0e3   963  468d3cb9             leal r15,[rcx+r15*4]
0x177442cbf0e7   967  478b343b             movl r14,[r11+r15*1]
0x177442cbf0eb   96b  413bde               cmpl rbx,r14
0x177442cbf0ee   96e  0f860c000000         jna 0x177442cbf100  <+0x980>
0x177442cbf0f4   974  468d34b0             leal r14,[rax+r14*4]
0x177442cbf0f8   978  47892433             movl [r11+r14*1],r12
0x177442cbf0fc   97c  478b343b             movl r14,[r11+r15*1]
0x177442cbf100   980  4183c601             addl r14,0x1
0x177442cbf104   984  4789343b             movl [r11+r15*1],r14
0x177442cbf108   988  4183c104             addl r9,0x4
0x177442cbf10c   98c  448b4590             movl r8,[rbp-0x70]
0x177442cbf110   990  4183c004             addl r8,0x4
0x177442cbf114   994  4183c401             addl r12,0x1
0x177442cbf118   998  448b75e8             movl r14,[rbp-0x18]
0x177442cbf11c   99c  4539e6               cmpl r14,r12
0x177442cbf11f   99f  0f855bfeffff         jnz 0x177442cbef80  <+0x800>
0x177442cbf125   9a5  e9e7fdffff           jmp 0x177442cbef11  <+0x791>
0x177442cbf12a   9aa  e8a153f2ff           call 0x177442be44d0  (jump table)
0x177442cbf12f   9af  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbf133   9b3  8b5d90               movl rbx,[rbp-0x70]
0x177442cbf136   9b6  8b5588               movl rdx,[rbp-0x78]
0x177442cbf139   9b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x177442cbf13f   9bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbf143   9c3  8b4580               movl rax,[rbp-0x80]
0x177442cbf146   9c6  448b4dc0             movl r9,[rbp-0x40]
0x177442cbf14a   9ca  e968f6ffff           jmp 0x177442cbe7b7  <+0x37>
0x177442cbf14f   9cf  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x177442cbf156   9d6  488955b8             REX.W movq [rbp-0x48],rdx
0x177442cbf15a   9da  48894db0             REX.W movq [rbp-0x50],rcx
0x177442cbf15e   9de  4c894da8             REX.W movq [rbp-0x58],r9
0x177442cbf162   9e2  4c8945a0             REX.W movq [rbp-0x60],r8
0x177442cbf166   9e6  c5fb114598           vmovsd [rbp-0x68],xmm0
0x177442cbf16b   9eb  4c8975c0             REX.W movq [rbp-0x40],r14
0x177442cbf16f   9ef  e85c53f2ff           call 0x177442be44d0  (jump table)
0x177442cbf174   9f4  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbf178   9f8  33ff                 xorl rdi,rdi
0x177442cbf17a   9fa  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbf17e   9fe  448b7dd0             movl r15,[rbp-0x30]
0x177442cbf182   a02  8b9d78ffffff         movl rbx,[rbp-0x88]
0x177442cbf188   a08  8b55b8               movl rdx,[rbp-0x48]
0x177442cbf18b   a0b  8b4db0               movl rcx,[rbp-0x50]
0x177442cbf18e   a0e  448b4da8             movl r9,[rbp-0x58]
0x177442cbf192   a12  448b45a0             movl r8,[rbp-0x60]
0x177442cbf196   a16  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x177442cbf19b   a1b  448b75c0             movl r14,[rbp-0x40]
0x177442cbf19f   a1f  e92af8ffff           jmp 0x177442cbe9ce  <+0x24e>
0x177442cbf1a4   a24  c5f92edb             vucomisd xmm3,xmm3
0x177442cbf1a8   a28  0f8b08000000         jpo 0x177442cbf1b6  <+0xa36>
0x177442cbf1ae   a2e  488bf7               REX.W movq rsi,rdi
0x177442cbf1b1   a31  e99bf8ffff           jmp 0x177442cbea51  <+0x2d1>
0x177442cbf1b6   a36  c5f82eca             vucomiss xmm1,xmm2
0x177442cbf1ba   a3a  77f2                 ja 0x177442cbf1ae  <+0xa2e>
0x177442cbf1bc   a3c  beffffffff           movl rsi,0xffffffff
0x177442cbf1c1   a41  e98bf8ffff           jmp 0x177442cbea51  <+0x2d1>
0x177442cbf1c6   a46  c5f92ee4             vucomisd xmm4,xmm4
0x177442cbf1ca   a4a  0f8b08000000         jpo 0x177442cbf1d8  <+0xa58>
0x177442cbf1d0   a50  488bc7               REX.W movq rax,rdi
0x177442cbf1d3   a53  e91cf9ffff           jmp 0x177442cbeaf4  <+0x374>
0x177442cbf1d8   a58  c5f82eca             vucomiss xmm1,xmm2
0x177442cbf1dc   a5c  77f2                 ja 0x177442cbf1d0  <+0xa50>
0x177442cbf1de   a5e  b8ffffffff           movl rax,0xffffffff
0x177442cbf1e3   a63  e90cf9ffff           jmp 0x177442cbeaf4  <+0x374>
0x177442cbf1e8   a68  488955c8             REX.W movq [rbp-0x38],rdx
0x177442cbf1ec   a6c  4c897598             REX.W movq [rbp-0x68],r14
0x177442cbf1f0   a70  48895da8             REX.W movq [rbp-0x58],rbx
0x177442cbf1f4   a74  48894db0             REX.W movq [rbp-0x50],rcx
0x177442cbf1f8   a78  e8d352f2ff           call 0x177442be44d0  (jump table)
0x177442cbf1fd   a7d  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbf201   a81  33ff                 xorl rdi,rdi
0x177442cbf203   a83  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbf207   a87  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbf20b   a8b  8b4580               movl rax,[rbp-0x80]
0x177442cbf20e   a8e  448b7dd0             movl r15,[rbp-0x30]
0x177442cbf212   a92  448b4dc0             movl r9,[rbp-0x40]
0x177442cbf216   a96  8b55c8               movl rdx,[rbp-0x38]
0x177442cbf219   a99  448b7598             movl r14,[rbp-0x68]
0x177442cbf21d   a9d  8b5da8               movl rbx,[rbp-0x58]
0x177442cbf220   aa0  8b4db0               movl rcx,[rbp-0x50]
0x177442cbf223   aa3  e9a2f9ffff           jmp 0x177442cbebca  <+0x44a>
0x177442cbf228   aa8  488955c8             REX.W movq [rbp-0x38],rdx
0x177442cbf22c   aac  4c8975b8             REX.W movq [rbp-0x48],r14
0x177442cbf230   ab0  48895da8             REX.W movq [rbp-0x58],rbx
0x177442cbf234   ab4  e89752f2ff           call 0x177442be44d0  (jump table)
0x177442cbf239   ab9  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbf23d   abd  33ff                 xorl rdi,rdi
0x177442cbf23f   abf  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbf243   ac3  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x177442cbf247   ac7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbf24b   acb  8b4580               movl rax,[rbp-0x80]
0x177442cbf24e   ace  448b7dd0             movl r15,[rbp-0x30]
0x177442cbf252   ad2  448b4dc0             movl r9,[rbp-0x40]
0x177442cbf256   ad6  448b8578ffffff       movl r8,[rbp-0x88]
0x177442cbf25d   add  488b55c8             REX.W movq rdx,[rbp-0x38]
0x177442cbf261   ae1  448b75b8             movl r14,[rbp-0x48]
0x177442cbf265   ae5  8b5da8               movl rbx,[rbp-0x58]
0x177442cbf268   ae8  e962faffff           jmp 0x177442cbeccf  <+0x54f>
0x177442cbf26d   aed  4c8965e0             REX.W movq [rbp-0x20],r12
0x177442cbf271   af1  4c894d88             REX.W movq [rbp-0x78],r9
0x177442cbf275   af5  488945d0             REX.W movq [rbp-0x30],rax
0x177442cbf279   af9  48895dc8             REX.W movq [rbp-0x38],rbx
0x177442cbf27d   afd  48894dc0             REX.W movq [rbp-0x40],rcx
0x177442cbf281   b01  488975b8             REX.W movq [rbp-0x48],rsi
0x177442cbf285   b05  488955b0             REX.W movq [rbp-0x50],rdx
0x177442cbf289   b09  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x177442cbf28e   b0e  e83d52f2ff           call 0x177442be44d0  (jump table)
0x177442cbf293   b13  448b65e0             movl r12,[rbp-0x20]
0x177442cbf297   b17  448b4d88             movl r9,[rbp-0x78]
0x177442cbf29b   b1b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x177442cbf29f   b1f  8b45d0               movl rax,[rbp-0x30]
0x177442cbf2a2   b22  8b5dc8               movl rbx,[rbp-0x38]
0x177442cbf2a5   b25  8b4dc0               movl rcx,[rbp-0x40]
0x177442cbf2a8   b28  8b75b8               movl rsi,[rbp-0x48]
0x177442cbf2ab   b2b  33ff                 xorl rdi,rdi
0x177442cbf2ad   b2d  8b55b0               movl rdx,[rbp-0x50]
0x177442cbf2b0   b30  c5f057c9             vxorps xmm1,xmm1,xmm1
0x177442cbf2b4   b34  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x177442cbf2b9   b39  448b7d98             movl r15,[rbp-0x68]
0x177442cbf2bd   b3d  e9d0fcffff           jmp 0x177442cbef92  <+0x812>
0x177442cbf2c2   b42  c5f92edb             vucomisd xmm3,xmm3
0x177442cbf2c6   b46  0f8b08000000         jpo 0x177442cbf2d4  <+0xb54>
0x177442cbf2cc   b4c  4c8bf7               REX.W movq r14,rdi
0x177442cbf2cf   b4f  e942fdffff           jmp 0x177442cbf016  <+0x896>
0x177442cbf2d4   b54  c5f82eca             vucomiss xmm1,xmm2
0x177442cbf2d8   b58  77f2                 ja 0x177442cbf2cc  <+0xb4c>
0x177442cbf2da   b5a  41beffffffff         movl r14,0xffffffff
0x177442cbf2e0   b60  e931fdffff           jmp 0x177442cbf016  <+0x896>
0x177442cbf2e5   b65  c5f92ee4             vucomisd xmm4,xmm4
0x177442cbf2e9   b69  0f8b08000000         jpo 0x177442cbf2f7  <+0xb77>
0x177442cbf2ef   b6f  4c8bf7               REX.W movq r14,rdi
0x177442cbf2f2   b72  e9cafdffff           jmp 0x177442cbf0c1  <+0x941>
0x177442cbf2f7   b77  c5f82eca             vucomiss xmm1,xmm2
0x177442cbf2fb   b7b  77f2                 ja 0x177442cbf2ef  <+0xb6f>
0x177442cbf2fd   b7d  41beffffffff         movl r14,0xffffffff
0x177442cbf303   b83  e9b9fdffff           jmp 0x177442cbf0c1  <+0x941>
0x177442cbf308   b88  e8034ff2ff           call 0x177442be4210  (jump table)
0x177442cbf30d   b8d  e8fe4ef2ff           call 0x177442be4210  (jump table)
0x177442cbf312   b92  e8f94ef2ff           call 0x177442be4210  (jump table)
0x177442cbf317   b97  90                   nop

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
0x177442cbe80e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x177442cbe80a  internal wasm call
0x177442cbe895  external reference (0x193f2f0)
0x177442cbed07  internal wasm call
0x177442cbed7f  external reference (0x193f270)
0x177442cbee16  internal wasm call
0x177442cbf12b  wasm stub call  (0x177442be44d0)
0x177442cbf170  wasm stub call  (0x177442be44d0)
0x177442cbf1f9  wasm stub call  (0x177442be44d0)
0x177442cbf235  wasm stub call  (0x177442be44d0)
0x177442cbf28f  wasm stub call  (0x177442be44d0)
0x177442cbf309  wasm stub call  (0x177442be4210)
0x177442cbf30e  wasm stub call  (0x177442be4210)
0x177442cbf313  wasm stub call  (0x177442be4210)
