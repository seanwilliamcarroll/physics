name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x3cfe68ef93c0     0  55                   push rbp
0x3cfe68ef93c1     1  4889e5               REX.W movq rbp,rsp
0x3cfe68ef93c4     4  6a08                 push 0x8
0x3cfe68ef93c6     6  56                   push rsi
0x3cfe68ef93c7     7  4881ec80000000       REX.W subq rsp,0x80
0x3cfe68ef93ce     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3cfe68ef93d2    12  48894580             REX.W movq [rbp-0x80],rax
0x3cfe68ef93d6    16  48895588             REX.W movq [rbp-0x78],rdx
0x3cfe68ef93da    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x3cfe68ef93e1    21  48895d90             REX.W movq [rbp-0x70],rbx
0x3cfe68ef93e5    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x3cfe68ef93e9    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x3cfe68ef93ed    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef93f1    31  0f8667090000         jna 0x3cfe68ef9d5e  <+0x99e>
0x3cfe68ef93f7    37  448be0               movl r12,rax
0x3cfe68ef93fa    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x3cfe68ef9403    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3cfe68ef9408    48  478b742328           movl r14,[r11+r12*1+0x28]
0x3cfe68ef940d    4d  450faff7             imull r14,r15
0x3cfe68ef9411    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x3cfe68ef9415    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x3cfe68ef9419    59  4d8bfe               REX.W movq r15,r14
0x3cfe68ef941c    5c  4183c701             addl r15,0x1
0x3cfe68ef9420    60  0f850c000000         jnz 0x3cfe68ef9432  <+0x72>
0x3cfe68ef9426    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x3cfe68ef942a    6a  4533ff               xorl r15,r15
0x3cfe68ef942d    6d  e928010000           jmp 0x3cfe68ef955a  <+0x19a>
0x3cfe68ef9432    72  438b3c23             movl rdi,[r11+r12*1]
0x3cfe68ef9436    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x3cfe68ef943a    7a  47393c23             cmpl [r11+r12*1],r15
0x3cfe68ef943e    7e  0f8341000000         jnc 0x3cfe68ef9485  <+0xc5>
0x3cfe68ef9444    84  498bcf               REX.W movq rcx,r15
0x3cfe68ef9447    87  33d2                 xorl rdx,rdx
0x3cfe68ef9449    89  e8b248f2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef944e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3cfe68ef9452    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3cfe68ef9456    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x3cfe68ef945b    9b  4489e7               movl rdi,r12
0x3cfe68ef945e    9e  4d8be3               REX.W movq r12,r11
0x3cfe68ef9461    a1  4c8bdb               REX.W movq r11,rbx
0x3cfe68ef9464    a4  8b5588               movl rdx,[rbp-0x78]
0x3cfe68ef9467    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef946d    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9471    b1  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9474    b4  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9478    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3cfe68ef947c    bc  448b75b0             movl r14,[rbp-0x50]
0x3cfe68ef9480    c0  e902000000           jmp 0x3cfe68ef9487  <+0xc7>
0x3cfe68ef9485    c5  33ff                 xorl rdi,rdi
0x3cfe68ef9487    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x3cfe68ef948c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x3cfe68ef9490    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x3cfe68ef9494    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x3cfe68ef9498    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x3cfe68ef949c    dc  4585f6               testl r14,r14
0x3cfe68ef949f    df  0f84a4000000         jz 0x3cfe68ef9549  <+0x189>
0x3cfe68ef94a5    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x3cfe68ef94ad    ed  83c3fc               addl rbx,0xfc
0x3cfe68ef94b0    f0  0f8480000000         jz 0x3cfe68ef9536  <+0x176>
0x3cfe68ef94b6    f6  4989e2               REX.W movq r10,rsp
0x3cfe68ef94b9    f9  4883ec08             REX.W subq rsp,0x8
0x3cfe68ef94bd    fd  4883e4f0             REX.W andq rsp,0xf0
0x3cfe68ef94c1   101  4c891424             REX.W movq [rsp],r10
0x3cfe68ef94c5   105  488bfe               REX.W movq rdi,rsi
0x3cfe68ef94c8   108  4c8bc3               REX.W movq r8,rbx
0x3cfe68ef94cb   10b  8b55e8               movl rdx,[rbp-0x18]
0x3cfe68ef94ce   10e  33c9                 xorl rcx,rcx
0x3cfe68ef94d0   110  488bf1               REX.W movq rsi,rcx
0x3cfe68ef94d3   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3cfe68ef94dd   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3cfe68ef94e4   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3cfe68ef94eb   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3cfe68ef94f2   132  ffd0                 call rax
0x3cfe68ef94f4   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3cfe68ef94ff   13f  488b2424             REX.W movq rsp,[rsp]
0x3cfe68ef9503   143  85c0                 testl rax,rax
0x3cfe68ef9505   145  0f843b0a0000         jz 0x3cfe68ef9f46  <+0xb86>
0x3cfe68ef950b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef950f   14f  8b5588               movl rdx,[rbp-0x78]
0x3cfe68ef9512   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9516   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef951c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9520   160  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9523   163  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9527   167  8b7db8               movl rdi,[rbp-0x48]
0x3cfe68ef952a   16a  448b45c8             movl r8,[rbp-0x38]
0x3cfe68ef952e   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x3cfe68ef9532   172  448b75b0             movl r14,[rbp-0x50]
0x3cfe68ef9536   176  8bdf                 movl rbx,rdi
0x3cfe68ef9538   178  4403f3               addl r14,rbx
0x3cfe68ef953b   17b  4103df               addl rbx,r15
0x3cfe68ef953e   17e  458bf8               movl r15,r8
0x3cfe68ef9541   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x3cfe68ef9546   186  418bfe               movl rdi,r14
0x3cfe68ef9549   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x3cfe68ef9551   191  8d5f01               leal rbx,[rdi+0x1]
0x3cfe68ef9554   194  448bfb               movl r15,rbx
0x3cfe68ef9557   197  8b5d90               movl rbx,[rbp-0x70]
0x3cfe68ef955a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x3cfe68ef955f   19f  458bc1               movl r8,r9
0x3cfe68ef9562   1a2  448bf1               movl r14,rcx
0x3cfe68ef9565   1a5  443bc1               cmpl r8,rcx
0x3cfe68ef9568   1a8  450f42f0             cmovcl r14,r8
0x3cfe68ef956c   1ac  33ff                 xorl rdi,rdi
0x3cfe68ef956e   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x3cfe68ef9572   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x3cfe68ef9576   1b6  4585f6               testl r14,r14
0x3cfe68ef9579   1b9  0f850e000000         jnz 0x3cfe68ef958d  <+0x1cd>
0x3cfe68ef957f   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x3cfe68ef9584   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9588   1c8  e904020000           jmp 0x3cfe68ef9791  <+0x3d1>
0x3cfe68ef958d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x3cfe68ef9592   1d2  4533c9               xorl r9,r9
0x3cfe68ef9595   1d5  4585c0               testl r8,r8
0x3cfe68ef9598   1d8  410f95c1             setnzl r9l
0x3cfe68ef959c   1dc  452bc1               subl r8,r9
0x3cfe68ef959f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x3cfe68ef95a4   1e4  33db                 xorl rbx,rbx
0x3cfe68ef95a6   1e6  4585c9               testl r9,r9
0x3cfe68ef95a9   1e9  0f95c3               setnzl bl
0x3cfe68ef95ac   1ec  458bf1               movl r14,r9
0x3cfe68ef95af   1ef  442bf3               subl r14,rbx
0x3cfe68ef95b2   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x3cfe68ef95b7   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3cfe68ef95be   1fe  448b55e8             movl r10,[rbp-0x18]
0x3cfe68ef95c2   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x3cfe68ef95c6   206  8bca                 movl rcx,rdx
0x3cfe68ef95c8   208  8b5590               movl rdx,[rbp-0x70]
0x3cfe68ef95cb   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef95cf   20f  e930000000           jmp 0x3cfe68ef9604  <+0x244>
0x3cfe68ef95d4   214  660f1f840000000000   nop
0x3cfe68ef95dd   21d  660f1f840000000000   nop
0x3cfe68ef95e6   226  660f1f840000000000   nop
0x3cfe68ef95ef   22f  660f1f840000000000   nop
0x3cfe68ef95f8   238  0f1f840000000000     nop
0x3cfe68ef9600   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x3cfe68ef9604   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef9608   248  0f8675070000         jna 0x3cfe68ef9d83  <+0x9c3>
0x3cfe68ef960e   24e  8bf1                 movl rsi,rcx
0x3cfe68ef9610   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x3cfe68ef9616   256  c5f82ed2             vucomiss xmm2,xmm2
0x3cfe68ef961a   25a  7a06                 jpe 0x3cfe68ef9622  <+0x262>
0x3cfe68ef961c   25c  0f8404000000         jz 0x3cfe68ef9626  <+0x266>
0x3cfe68ef9622   262  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9626   266  c5f82ed1             vucomiss xmm2,xmm1
0x3cfe68ef962a   26a  0f8704000000         ja 0x3cfe68ef9634  <+0x274>
0x3cfe68ef9630   270  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9634   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3cfe68ef9638   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3cfe68ef963e   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x3cfe68ef9642   282  85f6                 testl rsi,rsi
0x3cfe68ef9644   284  0f8929000000         jns 0x3cfe68ef9673  <+0x2b3>
0x3cfe68ef964a   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3cfe68ef9654   294  c441f96efa           vmovq xmm15,r10
0x3cfe68ef9659   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3cfe68ef965d   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x3cfe68ef9662   2a2  85f6                 testl rsi,rsi
0x3cfe68ef9664   2a4  0f8809000000         js 0x3cfe68ef9673  <+0x2b3>
0x3cfe68ef966a   2aa  41ba00000080         movl r10,0x80000000
0x3cfe68ef9670   2b0  410bf2               orl rsi,r10
0x3cfe68ef9673   2b3  448bd6               movl r10,rsi
0x3cfe68ef9676   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3cfe68ef967b   2bb  c5f92eec             vucomisd xmm5,xmm4
0x3cfe68ef967f   2bf  0f8a53070000         jpe 0x3cfe68ef9dd8  <+0xa18>
0x3cfe68ef9685   2c5  0f854d070000         jnz 0x3cfe68ef9dd8  <+0xa18>
0x3cfe68ef968b   2cb  8bc6                 movl rax,rsi
0x3cfe68ef968d   2cd  443bf6               cmpl r14,rsi
0x3cfe68ef9690   2d0  410f42c6             cmovcl rax,r14
0x3cfe68ef9694   2d4  83c001               addl rax,0x1
0x3cfe68ef9697   2d7  41ba0000804f         movl r10,0x4f800000
0x3cfe68ef969d   2dd  c4c1796eda           vmovd xmm3,r10
0x3cfe68ef96a2   2e2  be01000000           movl rsi,0x1
0x3cfe68ef96a7   2e7  c5f82eda             vucomiss xmm3,xmm2
0x3cfe68ef96ab   2eb  0f47f0               cmoval rsi,rax
0x3cfe68ef96ae   2ee  8bc2                 movl rax,rdx
0x3cfe68ef96b0   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x3cfe68ef96b6   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x3cfe68ef96ba   2fa  7a06                 jpe 0x3cfe68ef96c2  <+0x302>
0x3cfe68ef96bc   2fc  0f8404000000         jz 0x3cfe68ef96c6  <+0x306>
0x3cfe68ef96c2   302  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef96c6   306  c5f82ed1             vucomiss xmm2,xmm1
0x3cfe68ef96ca   30a  0f8704000000         ja 0x3cfe68ef96d4  <+0x314>
0x3cfe68ef96d0   310  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef96d4   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3cfe68ef96d8   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3cfe68ef96de   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x3cfe68ef96e2   322  85c0                 testl rax,rax
0x3cfe68ef96e4   324  0f8926000000         jns 0x3cfe68ef9710  <+0x350>
0x3cfe68ef96ea   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x3cfe68ef96f1   331  c441f96efa           vmovq xmm15,r10
0x3cfe68ef96f6   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3cfe68ef96fa   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x3cfe68ef96ff   33f  85c0                 testl rax,rax
0x3cfe68ef9701   341  0f8809000000         js 0x3cfe68ef9710  <+0x350>
0x3cfe68ef9707   347  41ba00000080         movl r10,0x80000000
0x3cfe68ef970d   34d  410bc2               orl rax,r10
0x3cfe68ef9710   350  448bd0               movl r10,rax
0x3cfe68ef9713   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3cfe68ef9718   358  c5f92ef5             vucomisd xmm6,xmm5
0x3cfe68ef971c   35c  0f8ad8060000         jpe 0x3cfe68ef9dfa  <+0xa3a>
0x3cfe68ef9722   362  0f85d2060000         jnz 0x3cfe68ef9dfa  <+0xa3a>
0x3cfe68ef9728   368  448be0               movl r12,rax
0x3cfe68ef972b   36b  443bc0               cmpl r8,rax
0x3cfe68ef972e   36e  450f42e0             cmovcl r12,r8
0x3cfe68ef9732   372  488bc7               REX.W movq rax,rdi
0x3cfe68ef9735   375  c5f82eda             vucomiss xmm3,xmm2
0x3cfe68ef9739   379  410f47c4             cmoval rax,r12
0x3cfe68ef973d   37d  458be1               movl r12,r9
0x3cfe68ef9740   380  440fafe0             imull r12,rax
0x3cfe68ef9744   384  4403e6               addl r12,rsi
0x3cfe68ef9747   387  4539e7               cmpl r15,r12
0x3cfe68ef974a   38a  0f860f000000         jna 0x3cfe68ef975f  <+0x39f>
0x3cfe68ef9750   390  468d24a3             leal r12,[rbx+r12*4]
0x3cfe68ef9754   394  438b0423             movl rax,[r11+r12*1]
0x3cfe68ef9758   398  83c001               addl rax,0x1
0x3cfe68ef975b   39b  43890423             movl [r11+r12*1],rax
0x3cfe68ef975f   39f  83c104               addl rcx,0x4
0x3cfe68ef9762   3a2  83c204               addl rdx,0x4
0x3cfe68ef9765   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x3cfe68ef9769   3a9  4183c4ff             addl r12,0xff
0x3cfe68ef976d   3ad  0f858dfeffff         jnz 0x3cfe68ef9600  <+0x240>
0x3cfe68ef9773   3b3  448bc3               movl r8,rbx
0x3cfe68ef9776   3b6  448b75e8             movl r14,[rbp-0x18]
0x3cfe68ef977a   3ba  8b5d90               movl rbx,[rbp-0x70]
0x3cfe68ef977d   3bd  8b5588               movl rdx,[rbp-0x78]
0x3cfe68ef9780   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9784   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef978a   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef978e   3ce  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9791   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x3cfe68ef9798   3d8  4585ff               testl r15,r15
0x3cfe68ef979b   3db  0f8508000000         jnz 0x3cfe68ef97a9  <+0x3e9>
0x3cfe68ef97a1   3e1  488bdf               REX.W movq rbx,rdi
0x3cfe68ef97a4   3e4  e968020000           jmp 0x3cfe68ef9a11  <+0x651>
0x3cfe68ef97a9   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x3cfe68ef97b1   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x3cfe68ef97b9   3f9  448bf3               movl r14,rbx
0x3cfe68ef97bc   3fc  41c1ee02             shrl r14, 2
0x3cfe68ef97c0   400  4183c601             addl r14,0x1
0x3cfe68ef97c4   404  418bd6               movl rdx,r14
0x3cfe68ef97c7   407  83e207               andl rdx,0x7
0x3cfe68ef97ca   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x3cfe68ef97ce   40e  83fb1c               cmpl rbx,0x1c
0x3cfe68ef97d1   411  0f82db000000         jc 0x3cfe68ef98b2  <+0x4f2>
0x3cfe68ef97d7   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x3cfe68ef97de   41e  418bd8               movl rbx,r8
0x3cfe68ef97e1   421  488bcf               REX.W movq rcx,rdi
0x3cfe68ef97e4   424  660f1f840000000000   nop
0x3cfe68ef97ed   42d  660f1f840000000000   nop
0x3cfe68ef97f6   436  660f1f840000000000   nop
0x3cfe68ef97ff   43f  90                   nop
0x3cfe68ef9800   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef9804   444  0f8612060000         jna 0x3cfe68ef9e1c  <+0xa5c>
0x3cfe68ef980a   44a  418b341b             movl rsi,[r11+rbx*1]
0x3cfe68ef980e   44e  03ce                 addl rcx,rsi
0x3cfe68ef9810   450  41890c1b             movl [r11+rbx*1],rcx
0x3cfe68ef9814   454  8d7304               leal rsi,[rbx+0x4]
0x3cfe68ef9817   457  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef981b   45b  4103c8               addl rcx,r8
0x3cfe68ef981e   45e  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef9822   462  8d7308               leal rsi,[rbx+0x8]
0x3cfe68ef9825   465  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef9829   469  4103c8               addl rcx,r8
0x3cfe68ef982c   46c  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef9830   470  8d730c               leal rsi,[rbx+0xc]
0x3cfe68ef9833   473  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef9837   477  4103c8               addl rcx,r8
0x3cfe68ef983a   47a  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef983e   47e  8d7310               leal rsi,[rbx+0x10]
0x3cfe68ef9841   481  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef9845   485  4103c8               addl rcx,r8
0x3cfe68ef9848   488  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef984c   48c  8d7314               leal rsi,[rbx+0x14]
0x3cfe68ef984f   48f  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef9853   493  4103c8               addl rcx,r8
0x3cfe68ef9856   496  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef985a   49a  8d7318               leal rsi,[rbx+0x18]
0x3cfe68ef985d   49d  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef9861   4a1  4103c8               addl rcx,r8
0x3cfe68ef9864   4a4  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef9868   4a8  8d731c               leal rsi,[rbx+0x1c]
0x3cfe68ef986b   4ab  458b0433             movl r8,[r11+rsi*1]
0x3cfe68ef986f   4af  4103c8               addl rcx,r8
0x3cfe68ef9872   4b2  41890c33             movl [r11+rsi*1],rcx
0x3cfe68ef9876   4b6  83c320               addl rbx,0x20
0x3cfe68ef9879   4b9  4183c6f8             addl r14,0xf8
0x3cfe68ef987d   4bd  7581                 jnz 0x3cfe68ef9800  <+0x440>
0x3cfe68ef987f   4bf  85d2                 testl rdx,rdx
0x3cfe68ef9881   4c1  0f8510000000         jnz 0x3cfe68ef9897  <+0x4d7>
0x3cfe68ef9887   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef988b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x3cfe68ef9892   4d2  e98b000000           jmp 0x3cfe68ef9922  <+0x562>
0x3cfe68ef9897   4d7  448bf3               movl r14,rbx
0x3cfe68ef989a   4da  8bd9                 movl rbx,rcx
0x3cfe68ef989c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef98a2   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef98a6   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x3cfe68ef98ad   4ed  e906000000           jmp 0x3cfe68ef98b8  <+0x4f8>
0x3cfe68ef98b2   4f2  488bdf               REX.W movq rbx,rdi
0x3cfe68ef98b5   4f5  458bf0               movl r14,r8
0x3cfe68ef98b8   4f8  c1e202               shll rdx, 2
0x3cfe68ef98bb   4fb  0f1f440000           nop
0x3cfe68ef98c0   500  438b0c33             movl rcx,[r11+r14*1]
0x3cfe68ef98c4   504  03d9                 addl rbx,rcx
0x3cfe68ef98c6   506  43891c33             movl [r11+r14*1],rbx
0x3cfe68ef98ca   50a  4183c604             addl r14,0x4
0x3cfe68ef98ce   50e  83c2fc               addl rdx,0xfc
0x3cfe68ef98d1   511  0f844b000000         jz 0x3cfe68ef9922  <+0x562>
0x3cfe68ef98d7   517  438b0c33             movl rcx,[r11+r14*1]
0x3cfe68ef98db   51b  03d9                 addl rbx,rcx
0x3cfe68ef98dd   51d  43891c33             movl [r11+r14*1],rbx
0x3cfe68ef98e1   521  4183c604             addl r14,0x4
0x3cfe68ef98e5   525  83c2fc               addl rdx,0xfc
0x3cfe68ef98e8   528  0f8434000000         jz 0x3cfe68ef9922  <+0x562>
0x3cfe68ef98ee   52e  438b0c33             movl rcx,[r11+r14*1]
0x3cfe68ef98f2   532  03d9                 addl rbx,rcx
0x3cfe68ef98f4   534  43891c33             movl [r11+r14*1],rbx
0x3cfe68ef98f8   538  4183c604             addl r14,0x4
0x3cfe68ef98fc   53c  83c2fc               addl rdx,0xfc
0x3cfe68ef98ff   53f  0f841d000000         jz 0x3cfe68ef9922  <+0x562>
0x3cfe68ef9905   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef9909   549  0f864d050000         jna 0x3cfe68ef9e5c  <+0xa9c>
0x3cfe68ef990f   54f  438b0c33             movl rcx,[r11+r14*1]
0x3cfe68ef9913   553  03d9                 addl rbx,rcx
0x3cfe68ef9915   555  43891c33             movl [r11+r14*1],rbx
0x3cfe68ef9919   559  4183c604             addl r14,0x4
0x3cfe68ef991d   55d  83c2fc               addl rdx,0xfc
0x3cfe68ef9920   560  759e                 jnz 0x3cfe68ef98c0  <+0x500>
0x3cfe68ef9922   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x3cfe68ef992b   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x3cfe68ef9930   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x3cfe68ef9935   575  0f834a000000         jnc 0x3cfe68ef9985  <+0x5c5>
0x3cfe68ef993b   57b  8bd8                 movl rbx,rax
0x3cfe68ef993d   57d  8d430c               leal rax,[rbx+0xc]
0x3cfe68ef9940   580  418bcf               movl rcx,r15
0x3cfe68ef9943   583  488bd7               REX.W movq rdx,rdi
0x3cfe68ef9946   586  e8b543f2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef994b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3cfe68ef994f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3cfe68ef9953   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x3cfe68ef9958   598  4c8bd3               REX.W movq r10,rbx
0x3cfe68ef995b   59b  4489e3               movl rbx,r12
0x3cfe68ef995e   59e  4d8be3               REX.W movq r12,r11
0x3cfe68ef9961   5a1  4d8bda               REX.W movq r11,r10
0x3cfe68ef9964   5a4  33ff                 xorl rdi,rdi
0x3cfe68ef9966   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef996a   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef996e   5ae  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9971   5b1  448b7dd0             movl r15,[rbp-0x30]
0x3cfe68ef9975   5b5  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9979   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x3cfe68ef9980   5c0  e903000000           jmp 0x3cfe68ef9988  <+0x5c8>
0x3cfe68ef9985   5c5  488bdf               REX.W movq rbx,rdi
0x3cfe68ef9988   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef998c   5cc  4d8bf7               REX.W movq r14,r15
0x3cfe68ef998f   5cf  41c1e602             shll r14, 2
0x3cfe68ef9993   5d3  0f8478000000         jz 0x3cfe68ef9a11  <+0x651>
0x3cfe68ef9999   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x3cfe68ef999e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x3cfe68ef99a2   5e2  4989e2               REX.W movq r10,rsp
0x3cfe68ef99a5   5e5  4883ec08             REX.W subq rsp,0x8
0x3cfe68ef99a9   5e9  4883e4f0             REX.W andq rsp,0xf0
0x3cfe68ef99ad   5ed  4c891424             REX.W movq [rsp],r10
0x3cfe68ef99b1   5f1  488bd7               REX.W movq rdx,rdi
0x3cfe68ef99b4   5f4  4c8bd7               REX.W movq r10,rdi
0x3cfe68ef99b7   5f7  488bfe               REX.W movq rdi,rsi
0x3cfe68ef99ba   5fa  498bf2               REX.W movq rsi,r10
0x3cfe68ef99bd   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x3cfe68ef99c7   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3cfe68ef99ce   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3cfe68ef99d5   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3cfe68ef99dc   61c  ffd0                 call rax
0x3cfe68ef99de   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3cfe68ef99e9   629  488b2424             REX.W movq rsp,[rsp]
0x3cfe68ef99ed   62d  85c0                 testl rax,rax
0x3cfe68ef99ef   62f  0f844c050000         jz 0x3cfe68ef9f41  <+0xb81>
0x3cfe68ef99f5   635  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef99f8   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef99fc   63c  33ff                 xorl rdi,rdi
0x3cfe68ef99fe   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9a02   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9a06   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9a0a   64a  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9a0d   64d  448b7dd0             movl r15,[rbp-0x30]
0x3cfe68ef9a11   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x3cfe68ef9a1a   65a  4103df               addl rbx,r15
0x3cfe68ef9a1d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x3cfe68ef9a22   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x3cfe68ef9a29   669  0f8508000000         jnz 0x3cfe68ef9a37  <+0x677>
0x3cfe68ef9a2f   66f  488bdf               REX.W movq rbx,rdi
0x3cfe68ef9a32   672  e90b010000           jmp 0x3cfe68ef9b42  <+0x782>
0x3cfe68ef9a37   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x3cfe68ef9a3c   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef9a42   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x3cfe68ef9a47   687  0f833b000000         jnc 0x3cfe68ef9a88  <+0x6c8>
0x3cfe68ef9a4d   68d  8bd8                 movl rbx,rax
0x3cfe68ef9a4f   68f  8d4318               leal rax,[rbx+0x18]
0x3cfe68ef9a52   692  488bd7               REX.W movq rdx,rdi
0x3cfe68ef9a55   695  e8a642f2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef9a5a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x3cfe68ef9a5e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x3cfe68ef9a62   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x3cfe68ef9a67   6a7  4c8bd3               REX.W movq r10,rbx
0x3cfe68ef9a6a   6aa  4489e3               movl rbx,r12
0x3cfe68ef9a6d   6ad  4d8be3               REX.W movq r12,r11
0x3cfe68ef9a70   6b0  4d8bda               REX.W movq r11,r10
0x3cfe68ef9a73   6b3  33ff                 xorl rdi,rdi
0x3cfe68ef9a75   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9a79   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef9a7f   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9a83   6c3  e903000000           jmp 0x3cfe68ef9a8b  <+0x6cb>
0x3cfe68ef9a88   6c8  488bdf               REX.W movq rbx,rdi
0x3cfe68ef9a8b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3cfe68ef9a90   6d0  418d149f             leal rdx,[r15+rbx*4]
0x3cfe68ef9a94   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x3cfe68ef9a98   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x3cfe68ef9a9c   6dc  83f901               cmpl rcx,0x1
0x3cfe68ef9a9f   6df  0f8492000000         jz 0x3cfe68ef9b37  <+0x777>
0x3cfe68ef9aa5   6e5  448bf1               movl r14,rcx
0x3cfe68ef9aa8   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x3cfe68ef9ab0   6f0  83c0fc               addl rax,0xfc
0x3cfe68ef9ab3   6f3  0f846f000000         jz 0x3cfe68ef9b28  <+0x768>
0x3cfe68ef9ab9   6f9  4989e2               REX.W movq r10,rsp
0x3cfe68ef9abc   6fc  4883ec08             REX.W subq rsp,0x8
0x3cfe68ef9ac0   700  4883e4f0             REX.W andq rsp,0xf0
0x3cfe68ef9ac4   704  4c891424             REX.W movq [rsp],r10
0x3cfe68ef9ac8   708  488bcf               REX.W movq rcx,rdi
0x3cfe68ef9acb   70b  4c8bd7               REX.W movq r10,rdi
0x3cfe68ef9ace   70e  488bfe               REX.W movq rdi,rsi
0x3cfe68ef9ad1   711  498bf2               REX.W movq rsi,r10
0x3cfe68ef9ad4   714  4c8bc0               REX.W movq r8,rax
0x3cfe68ef9ad7   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x3cfe68ef9ade   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3cfe68ef9ae5   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3cfe68ef9aec   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3cfe68ef9af3   733  ffd0                 call rax
0x3cfe68ef9af5   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3cfe68ef9b00   740  488b2424             REX.W movq rsp,[rsp]
0x3cfe68ef9b04   744  85c0                 testl rax,rax
0x3cfe68ef9b06   746  0f8430040000         jz 0x3cfe68ef9f3c  <+0xb7c>
0x3cfe68ef9b0c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9b10   750  33ff                 xorl rdi,rdi
0x3cfe68ef9b12   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9b16   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9b1a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x3cfe68ef9b1d   75d  448b7dc8             movl r15,[rbp-0x38]
0x3cfe68ef9b21   761  448bb570ffffff       movl r14,[rbp-0x90]
0x3cfe68ef9b28   768  4103de               addl rbx,r14
0x3cfe68ef9b2b   76b  448d73ff             leal r14,[rbx-0x1]
0x3cfe68ef9b2f   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x3cfe68ef9b34   774  418bde               movl rbx,r14
0x3cfe68ef9b37   777  41c7041300000000     movl [r11+rdx*1],0x0
0x3cfe68ef9b3f   77f  83c301               addl rbx,0x1
0x3cfe68ef9b42   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x3cfe68ef9b47   787  837de800             cmpl [rbp-0x18],0x0
0x3cfe68ef9b4b   78b  0f8505000000         jnz 0x3cfe68ef9b56  <+0x796>
0x3cfe68ef9b51   791  488be5               REX.W movq rsp,rbp
0x3cfe68ef9b54   794  5d                   pop rbp
0x3cfe68ef9b55   795  c3                   retl
0x3cfe68ef9b56   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3cfe68ef9b5b   79b  4533f6               xorl r14,r14
0x3cfe68ef9b5e   79e  4585ff               testl r15,r15
0x3cfe68ef9b61   7a1  410f95c6             setnzl r14l
0x3cfe68ef9b65   7a5  452bfe               subl r15,r14
0x3cfe68ef9b68   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x3cfe68ef9b6d   7ad  33c0                 xorl rax,rax
0x3cfe68ef9b6f   7af  4585f6               testl r14,r14
0x3cfe68ef9b72   7b2  0f95c0               setnzl al
0x3cfe68ef9b75   7b5  418bd6               movl rdx,r14
0x3cfe68ef9b78   7b8  2bd0                 subl rdx,rax
0x3cfe68ef9b7a   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3cfe68ef9b7f   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x3cfe68ef9b84   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x3cfe68ef9b89   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x3cfe68ef9b90   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x3cfe68ef9b94   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x3cfe68ef9b98   7d8  4c8be7               REX.W movq r12,rdi
0x3cfe68ef9b9b   7db  448b4d88             movl r9,[rbp-0x78]
0x3cfe68ef9b9f   7df  e924000000           jmp 0x3cfe68ef9bc8  <+0x808>
0x3cfe68ef9ba4   7e4  660f1f840000000000   nop
0x3cfe68ef9bad   7ed  660f1f840000000000   nop
0x3cfe68ef9bb6   7f6  660f1f840000000000   nop
0x3cfe68ef9bbf   7ff  90                   nop
0x3cfe68ef9bc0   800  448b7d98             movl r15,[rbp-0x68]
0x3cfe68ef9bc4   804  4c894590             REX.W movq [rbp-0x70],r8
0x3cfe68ef9bc8   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef9bcc   80c  0f86cf020000         jna 0x3cfe68ef9ea1  <+0xae1>
0x3cfe68ef9bd2   812  448b7590             movl r14,[rbp-0x70]
0x3cfe68ef9bd6   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3cfe68ef9bdc   81c  c5f82ed2             vucomiss xmm2,xmm2
0x3cfe68ef9be0   820  7a06                 jpe 0x3cfe68ef9be8  <+0x828>
0x3cfe68ef9be2   822  0f8404000000         jz 0x3cfe68ef9bec  <+0x82c>
0x3cfe68ef9be8   828  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9bec   82c  c5f82ed1             vucomiss xmm2,xmm1
0x3cfe68ef9bf0   830  0f8704000000         ja 0x3cfe68ef9bfa  <+0x83a>
0x3cfe68ef9bf6   836  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9bfa   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x3cfe68ef9bfe   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x3cfe68ef9c04   844  c57b2cf4             vcvttsd2si r14,xmm4
0x3cfe68ef9c08   848  4585f6               testl r14,r14
0x3cfe68ef9c0b   84b  0f8927000000         jns 0x3cfe68ef9c38  <+0x878>
0x3cfe68ef9c11   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x3cfe68ef9c18   858  c441f96efa           vmovq xmm15,r10
0x3cfe68ef9c1d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x3cfe68ef9c21   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x3cfe68ef9c26   866  4585f6               testl r14,r14
0x3cfe68ef9c29   869  0f8809000000         js 0x3cfe68ef9c38  <+0x878>
0x3cfe68ef9c2f   86f  41ba00000080         movl r10,0x80000000
0x3cfe68ef9c35   875  450bf2               orl r14,r10
0x3cfe68ef9c38   878  458bd6               movl r10,r14
0x3cfe68ef9c3b   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x3cfe68ef9c40   880  c5f92eec             vucomisd xmm5,xmm4
0x3cfe68ef9c44   884  0f8aac020000         jpe 0x3cfe68ef9ef6  <+0xb36>
0x3cfe68ef9c4a   88a  0f85a6020000         jnz 0x3cfe68ef9ef6  <+0xb36>
0x3cfe68ef9c50   890  458bc6               movl r8,r14
0x3cfe68ef9c53   893  453bfe               cmpl r15,r14
0x3cfe68ef9c56   896  450f42c7             cmovcl r8,r15
0x3cfe68ef9c5a   89a  41ba0000804f         movl r10,0x4f800000
0x3cfe68ef9c60   8a0  c4c1796eda           vmovd xmm3,r10
0x3cfe68ef9c65   8a5  4c8bf7               REX.W movq r14,rdi
0x3cfe68ef9c68   8a8  c5f82eda             vucomiss xmm3,xmm2
0x3cfe68ef9c6c   8ac  450f47f0             cmoval r14,r8
0x3cfe68ef9c70   8b0  448b45a0             movl r8,[rbp-0x60]
0x3cfe68ef9c74   8b4  450fafc6             imull r8,r14
0x3cfe68ef9c78   8b8  458bf1               movl r14,r9
0x3cfe68ef9c7b   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x3cfe68ef9c81   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x3cfe68ef9c85   8c5  7a06                 jpe 0x3cfe68ef9c8d  <+0x8cd>
0x3cfe68ef9c87   8c7  0f8404000000         jz 0x3cfe68ef9c91  <+0x8d1>
0x3cfe68ef9c8d   8cd  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9c91   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x3cfe68ef9c95   8d5  0f8704000000         ja 0x3cfe68ef9c9f  <+0x8df>
0x3cfe68ef9c9b   8db  c5f928d1             vmovapd xmm2,xmm1
0x3cfe68ef9c9f   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x3cfe68ef9ca3   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x3cfe68ef9ca9   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x3cfe68ef9cad   8ed  4585f6               testl r14,r14
0x3cfe68ef9cb0   8f0  0f8927000000         jns 0x3cfe68ef9cdd  <+0x91d>
0x3cfe68ef9cb6   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x3cfe68ef9cbd   8fd  c441f96efa           vmovq xmm15,r10
0x3cfe68ef9cc2   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x3cfe68ef9cc6   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x3cfe68ef9ccb   90b  4585f6               testl r14,r14
0x3cfe68ef9cce   90e  0f8809000000         js 0x3cfe68ef9cdd  <+0x91d>
0x3cfe68ef9cd4   914  41ba00000080         movl r10,0x80000000
0x3cfe68ef9cda   91a  450bf2               orl r14,r10
0x3cfe68ef9cdd   91d  458bd6               movl r10,r14
0x3cfe68ef9ce0   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x3cfe68ef9ce5   925  c5f92ef5             vucomisd xmm6,xmm5
0x3cfe68ef9ce9   929  0f8a2a020000         jpe 0x3cfe68ef9f19  <+0xb59>
0x3cfe68ef9cef   92f  0f8524020000         jnz 0x3cfe68ef9f19  <+0xb59>
0x3cfe68ef9cf5   935  458bfe               movl r15,r14
0x3cfe68ef9cf8   938  413bd6               cmpl rdx,r14
0x3cfe68ef9cfb   93b  440f42fa             cmovcl r15,rdx
0x3cfe68ef9cff   93f  4c8bf7               REX.W movq r14,rdi
0x3cfe68ef9d02   942  c5f82eda             vucomiss xmm3,xmm2
0x3cfe68ef9d06   946  450f47f7             cmoval r14,r15
0x3cfe68ef9d0a   94a  478d3c06             leal r15,[r14+r8*1]
0x3cfe68ef9d0e   94e  413bf7               cmpl rsi,r15
0x3cfe68ef9d11   951  0f8625000000         jna 0x3cfe68ef9d3c  <+0x97c>
0x3cfe68ef9d17   957  468d3cb9             leal r15,[rcx+r15*4]
0x3cfe68ef9d1b   95b  478b343b             movl r14,[r11+r15*1]
0x3cfe68ef9d1f   95f  413bde               cmpl rbx,r14
0x3cfe68ef9d22   962  0f860c000000         jna 0x3cfe68ef9d34  <+0x974>
0x3cfe68ef9d28   968  468d34b0             leal r14,[rax+r14*4]
0x3cfe68ef9d2c   96c  47892433             movl [r11+r14*1],r12
0x3cfe68ef9d30   970  478b343b             movl r14,[r11+r15*1]
0x3cfe68ef9d34   974  4183c601             addl r14,0x1
0x3cfe68ef9d38   978  4789343b             movl [r11+r15*1],r14
0x3cfe68ef9d3c   97c  4183c104             addl r9,0x4
0x3cfe68ef9d40   980  448b4590             movl r8,[rbp-0x70]
0x3cfe68ef9d44   984  4183c004             addl r8,0x4
0x3cfe68ef9d48   988  4183c401             addl r12,0x1
0x3cfe68ef9d4c   98c  448b75e8             movl r14,[rbp-0x18]
0x3cfe68ef9d50   990  4539e6               cmpl r14,r12
0x3cfe68ef9d53   993  0f8567feffff         jnz 0x3cfe68ef9bc0  <+0x800>
0x3cfe68ef9d59   999  e9f3fdffff           jmp 0x3cfe68ef9b51  <+0x791>
0x3cfe68ef9d5e   99e  e86d47f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9d63   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9d67   9a7  8b5d90               movl rbx,[rbp-0x70]
0x3cfe68ef9d6a   9aa  8b5588               movl rdx,[rbp-0x78]
0x3cfe68ef9d6d   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x3cfe68ef9d73   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9d77   9b7  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9d7a   9ba  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9d7e   9be  e974f6ffff           jmp 0x3cfe68ef93f7  <+0x37>
0x3cfe68ef9d83   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x3cfe68ef9d8a   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x3cfe68ef9d8e   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x3cfe68ef9d92   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x3cfe68ef9d96   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x3cfe68ef9d9a   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x3cfe68ef9d9f   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x3cfe68ef9da3   9e3  e82847f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9da8   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9dac   9ec  33ff                 xorl rdi,rdi
0x3cfe68ef9dae   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9db2   9f2  448b7dd0             movl r15,[rbp-0x30]
0x3cfe68ef9db6   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x3cfe68ef9dbc   9fc  8b55b8               movl rdx,[rbp-0x48]
0x3cfe68ef9dbf   9ff  8b4db0               movl rcx,[rbp-0x50]
0x3cfe68ef9dc2   a02  448b4da8             movl r9,[rbp-0x58]
0x3cfe68ef9dc6   a06  448b45a0             movl r8,[rbp-0x60]
0x3cfe68ef9dca   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x3cfe68ef9dcf   a0f  448b75c0             movl r14,[rbp-0x40]
0x3cfe68ef9dd3   a13  e936f8ffff           jmp 0x3cfe68ef960e  <+0x24e>
0x3cfe68ef9dd8   a18  c5f92edb             vucomisd xmm3,xmm3
0x3cfe68ef9ddc   a1c  0f8b08000000         jpo 0x3cfe68ef9dea  <+0xa2a>
0x3cfe68ef9de2   a22  488bf7               REX.W movq rsi,rdi
0x3cfe68ef9de5   a25  e9a1f8ffff           jmp 0x3cfe68ef968b  <+0x2cb>
0x3cfe68ef9dea   a2a  c5f82eca             vucomiss xmm1,xmm2
0x3cfe68ef9dee   a2e  77f2                 ja 0x3cfe68ef9de2  <+0xa22>
0x3cfe68ef9df0   a30  beffffffff           movl rsi,0xffffffff
0x3cfe68ef9df5   a35  e991f8ffff           jmp 0x3cfe68ef968b  <+0x2cb>
0x3cfe68ef9dfa   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x3cfe68ef9dfe   a3e  0f8b08000000         jpo 0x3cfe68ef9e0c  <+0xa4c>
0x3cfe68ef9e04   a44  488bc7               REX.W movq rax,rdi
0x3cfe68ef9e07   a47  e91cf9ffff           jmp 0x3cfe68ef9728  <+0x368>
0x3cfe68ef9e0c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x3cfe68ef9e10   a50  77f2                 ja 0x3cfe68ef9e04  <+0xa44>
0x3cfe68ef9e12   a52  b8ffffffff           movl rax,0xffffffff
0x3cfe68ef9e17   a57  e90cf9ffff           jmp 0x3cfe68ef9728  <+0x368>
0x3cfe68ef9e1c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x3cfe68ef9e20   a60  4c897598             REX.W movq [rbp-0x68],r14
0x3cfe68ef9e24   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x3cfe68ef9e28   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x3cfe68ef9e2c   a6c  e89f46f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9e31   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9e35   a75  33ff                 xorl rdi,rdi
0x3cfe68ef9e37   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9e3b   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9e3f   a7f  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9e42   a82  448b7dd0             movl r15,[rbp-0x30]
0x3cfe68ef9e46   a86  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9e4a   a8a  8b55c8               movl rdx,[rbp-0x38]
0x3cfe68ef9e4d   a8d  448b7598             movl r14,[rbp-0x68]
0x3cfe68ef9e51   a91  8b5da8               movl rbx,[rbp-0x58]
0x3cfe68ef9e54   a94  8b4db0               movl rcx,[rbp-0x50]
0x3cfe68ef9e57   a97  e9aef9ffff           jmp 0x3cfe68ef980a  <+0x44a>
0x3cfe68ef9e5c   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x3cfe68ef9e60   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x3cfe68ef9e64   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x3cfe68ef9e68   aa8  e86346f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9e6d   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9e71   ab1  33ff                 xorl rdi,rdi
0x3cfe68ef9e73   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9e77   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x3cfe68ef9e7b   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef9e7f   abf  8b4580               movl rax,[rbp-0x80]
0x3cfe68ef9e82   ac2  448b7dd0             movl r15,[rbp-0x30]
0x3cfe68ef9e86   ac6  448b4dc0             movl r9,[rbp-0x40]
0x3cfe68ef9e8a   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x3cfe68ef9e91   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x3cfe68ef9e95   ad5  448b75b8             movl r14,[rbp-0x48]
0x3cfe68ef9e99   ad9  8b5da8               movl rbx,[rbp-0x58]
0x3cfe68ef9e9c   adc  e96efaffff           jmp 0x3cfe68ef990f  <+0x54f>
0x3cfe68ef9ea1   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x3cfe68ef9ea5   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x3cfe68ef9ea9   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x3cfe68ef9ead   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef9eb1   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x3cfe68ef9eb5   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x3cfe68ef9eb9   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x3cfe68ef9ebd   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x3cfe68ef9ec2   b02  e80946f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9ec7   b07  448b65e0             movl r12,[rbp-0x20]
0x3cfe68ef9ecb   b0b  448b4d88             movl r9,[rbp-0x78]
0x3cfe68ef9ecf   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x3cfe68ef9ed3   b13  8b45d0               movl rax,[rbp-0x30]
0x3cfe68ef9ed6   b16  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef9ed9   b19  8b4dc0               movl rcx,[rbp-0x40]
0x3cfe68ef9edc   b1c  8b75b8               movl rsi,[rbp-0x48]
0x3cfe68ef9edf   b1f  33ff                 xorl rdi,rdi
0x3cfe68ef9ee1   b21  8b55b0               movl rdx,[rbp-0x50]
0x3cfe68ef9ee4   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x3cfe68ef9ee8   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x3cfe68ef9eed   b2d  448b7d98             movl r15,[rbp-0x68]
0x3cfe68ef9ef1   b31  e9dcfcffff           jmp 0x3cfe68ef9bd2  <+0x812>
0x3cfe68ef9ef6   b36  c5f92edb             vucomisd xmm3,xmm3
0x3cfe68ef9efa   b3a  0f8b08000000         jpo 0x3cfe68ef9f08  <+0xb48>
0x3cfe68ef9f00   b40  4c8bf7               REX.W movq r14,rdi
0x3cfe68ef9f03   b43  e948fdffff           jmp 0x3cfe68ef9c50  <+0x890>
0x3cfe68ef9f08   b48  c5f82eca             vucomiss xmm1,xmm2
0x3cfe68ef9f0c   b4c  77f2                 ja 0x3cfe68ef9f00  <+0xb40>
0x3cfe68ef9f0e   b4e  41beffffffff         movl r14,0xffffffff
0x3cfe68ef9f14   b54  e937fdffff           jmp 0x3cfe68ef9c50  <+0x890>
0x3cfe68ef9f19   b59  c5f92ee4             vucomisd xmm4,xmm4
0x3cfe68ef9f1d   b5d  0f8b08000000         jpo 0x3cfe68ef9f2b  <+0xb6b>
0x3cfe68ef9f23   b63  4c8bf7               REX.W movq r14,rdi
0x3cfe68ef9f26   b66  e9cafdffff           jmp 0x3cfe68ef9cf5  <+0x935>
0x3cfe68ef9f2b   b6b  c5f82eca             vucomiss xmm1,xmm2
0x3cfe68ef9f2f   b6f  77f2                 ja 0x3cfe68ef9f23  <+0xb63>
0x3cfe68ef9f31   b71  41beffffffff         movl r14,0xffffffff
0x3cfe68ef9f37   b77  e9b9fdffff           jmp 0x3cfe68ef9cf5  <+0x935>
0x3cfe68ef9f3c   b7c  e8cf42f2ff           call 0x3cfe68e1e210  (jump table)
0x3cfe68ef9f41   b81  e8ca42f2ff           call 0x3cfe68e1e210  (jump table)
0x3cfe68ef9f46   b86  e8c542f2ff           call 0x3cfe68e1e210  (jump table)
0x3cfe68ef9f4b   b8b  90                   nop

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
0x3cfe68ef944e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x3cfe68ef944a  internal wasm call
0x3cfe68ef94d5  external reference (0x193f2f0)
0x3cfe68ef9947  internal wasm call
0x3cfe68ef99bf  external reference (0x193f270)
0x3cfe68ef9a56  internal wasm call
0x3cfe68ef9d5f  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9da4  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9e2d  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9e69  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9ec3  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9f3d  wasm stub call  (0x3cfe68e1e210)
0x3cfe68ef9f42  wasm stub call  (0x3cfe68e1e210)
0x3cfe68ef9f47  wasm stub call  (0x3cfe68e1e210)
