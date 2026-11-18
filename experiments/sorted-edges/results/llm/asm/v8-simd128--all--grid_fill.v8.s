name: _RNvMNtCskbGeSEnUfEA_5swarm4gridNtB2_4Grid4fill
index: 1457
kind: wasm function
compiler: TurboFan
Body (size = 3008 = 2972 + 36 padding)
Instructions (size = 2956)
0x1863c40f30c0     0  55                   push rbp
0x1863c40f30c1     1  4889e5               REX.W movq rbp,rsp
0x1863c40f30c4     4  6a08                 push 0x8
0x1863c40f30c6     6  56                   push rsi
0x1863c40f30c7     7  4881ec80000000       REX.W subq rsp,0x80
0x1863c40f30ce     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x1863c40f30d2    12  48894580             REX.W movq [rbp-0x80],rax
0x1863c40f30d6    16  48895588             REX.W movq [rbp-0x78],rdx
0x1863c40f30da    1a  48898d70ffffff       REX.W movq [rbp-0x90],rcx
0x1863c40f30e1    21  48895d90             REX.W movq [rbp-0x70],rbx
0x1863c40f30e5    25  4c894dc0             REX.W movq [rbp-0x40],r9
0x1863c40f30e9    29  4c895dd8             REX.W movq [rbp-0x28],r11
0x1863c40f30ed    2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f30f1    31  0f8667090000         jna 0x1863c40f3a5e  <+0x99e>
0x1863c40f30f7    37  448be0               movl r12,rax
0x1863c40f30fa    3a  43c744230800000000   movl [r11+r12*1+0x8],0x0
0x1863c40f3103    43  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x1863c40f3108    48  478b742328           movl r14,[r11+r12*1+0x28]
0x1863c40f310d    4d  450faff7             imull r14,r15
0x1863c40f3111    51  4c8965e0             REX.W movq [rbp-0x20],r12
0x1863c40f3115    55  4c8975b0             REX.W movq [rbp-0x50],r14
0x1863c40f3119    59  4d8bfe               REX.W movq r15,r14
0x1863c40f311c    5c  4183c701             addl r15,0x1
0x1863c40f3120    60  0f850c000000         jnz 0x1863c40f3132  <+0x72>
0x1863c40f3126    66  4c897dd0             REX.W movq [rbp-0x30],r15
0x1863c40f312a    6a  4533ff               xorl r15,r15
0x1863c40f312d    6d  e928010000           jmp 0x1863c40f325a  <+0x19a>
0x1863c40f3132    72  438b3c23             movl rdi,[r11+r12*1]
0x1863c40f3136    76  4c897dd0             REX.W movq [rbp-0x30],r15
0x1863c40f313a    7a  47393c23             cmpl [r11+r12*1],r15
0x1863c40f313e    7e  0f8341000000         jnc 0x1863c40f3185  <+0xc5>
0x1863c40f3144    84  498bcf               REX.W movq rcx,r15
0x1863c40f3147    87  33d2                 xorl rdx,rdx
0x1863c40f3149    89  e8b26bf2ff           call 0x1863c4019d00  (jump table)
0x1863c40f314e    8e  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x1863c40f3152    92  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x1863c40f3156    96  468b641b08           movl r12,[rbx+r11*1+0x8]
0x1863c40f315b    9b  4489e7               movl rdi,r12
0x1863c40f315e    9e  4d8be3               REX.W movq r12,r11
0x1863c40f3161    a1  4c8bdb               REX.W movq r11,rbx
0x1863c40f3164    a4  8b5588               movl rdx,[rbp-0x78]
0x1863c40f3167    a7  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f316d    ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f3171    b1  8b4580               movl rax,[rbp-0x80]
0x1863c40f3174    b4  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3178    b8  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x1863c40f317c    bc  448b75b0             movl r14,[rbp-0x50]
0x1863c40f3180    c0  e902000000           jmp 0x1863c40f3187  <+0xc7>
0x1863c40f3185    c5  33ff                 xorl rdi,rdi
0x1863c40f3187    c7  478b442304           movl r8,[r11+r12*1+0x4]
0x1863c40f318c    cc  418d1cb8             leal rbx,[r8+rdi*4]
0x1863c40f3190    d0  48897db8             REX.W movq [rbp-0x48],rdi
0x1863c40f3194    d4  4c8945c8             REX.W movq [rbp-0x38],r8
0x1863c40f3198    d8  48895de8             REX.W movq [rbp-0x18],rbx
0x1863c40f319c    dc  4585f6               testl r14,r14
0x1863c40f319f    df  0f84a4000000         jz 0x1863c40f3249  <+0x189>
0x1863c40f31a5    e5  428d1cbd00000000     leal rbx,[r15*4+0x0]
0x1863c40f31ad    ed  83c3fc               addl rbx,0xfc
0x1863c40f31b0    f0  0f8480000000         jz 0x1863c40f3236  <+0x176>
0x1863c40f31b6    f6  4989e2               REX.W movq r10,rsp
0x1863c40f31b9    f9  4883ec08             REX.W subq rsp,0x8
0x1863c40f31bd    fd  4883e4f0             REX.W andq rsp,0xf0
0x1863c40f31c1   101  4c891424             REX.W movq [rsp],r10
0x1863c40f31c5   105  488bfe               REX.W movq rdi,rsi
0x1863c40f31c8   108  4c8bc3               REX.W movq r8,rbx
0x1863c40f31cb   10b  8b55e8               movl rdx,[rbp-0x18]
0x1863c40f31ce   10e  33c9                 xorl rcx,rcx
0x1863c40f31d0   110  488bf1               REX.W movq rsi,rcx
0x1863c40f31d3   113  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x1863c40f31dd   11d  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x1863c40f31e4   124  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x1863c40f31eb   12b  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x1863c40f31f2   132  ffd0                 call rax
0x1863c40f31f4   134  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x1863c40f31ff   13f  488b2424             REX.W movq rsp,[rsp]
0x1863c40f3203   143  85c0                 testl rax,rax
0x1863c40f3205   145  0f843b0a0000         jz 0x1863c40f3c46  <+0xb86>
0x1863c40f320b   14b  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f320f   14f  8b5588               movl rdx,[rbp-0x78]
0x1863c40f3212   152  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f3216   156  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f321c   15c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f3220   160  8b4580               movl rax,[rbp-0x80]
0x1863c40f3223   163  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3227   167  8b7db8               movl rdi,[rbp-0x48]
0x1863c40f322a   16a  448b45c8             movl r8,[rbp-0x38]
0x1863c40f322e   16e  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x1863c40f3232   172  448b75b0             movl r14,[rbp-0x50]
0x1863c40f3236   176  8bdf                 movl rbx,rdi
0x1863c40f3238   178  4403f3               addl r14,rbx
0x1863c40f323b   17b  4103df               addl rbx,r15
0x1863c40f323e   17e  458bf8               movl r15,r8
0x1863c40f3241   181  418d5c9ffc           leal rbx,[r15+rbx*4-0x4]
0x1863c40f3246   186  418bfe               movl rdi,r14
0x1863c40f3249   189  41c7041b00000000     movl [r11+rbx*1],0x0
0x1863c40f3251   191  8d5f01               leal rbx,[rdi+0x1]
0x1863c40f3254   194  448bfb               movl r15,rbx
0x1863c40f3257   197  8b5d90               movl rbx,[rbp-0x70]
0x1863c40f325a   19a  47897c2308           movl [r11+r12*1+0x8],r15
0x1863c40f325f   19f  458bc1               movl r8,r9
0x1863c40f3262   1a2  448bf1               movl r14,rcx
0x1863c40f3265   1a5  443bc1               cmpl r8,rcx
0x1863c40f3268   1a8  450f42f0             cmovcl r14,r8
0x1863c40f326c   1ac  33ff                 xorl rdi,rdi
0x1863c40f326e   1ae  4c897dd0             REX.W movq [rbp-0x30],r15
0x1863c40f3272   1b2  4c8975e8             REX.W movq [rbp-0x18],r14
0x1863c40f3276   1b6  4585f6               testl r14,r14
0x1863c40f3279   1b9  0f850e000000         jnz 0x1863c40f328d  <+0x1cd>
0x1863c40f327f   1bf  478b442304           movl r8,[r11+r12*1+0x4]
0x1863c40f3284   1c4  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3288   1c8  e904020000           jmp 0x1863c40f3491  <+0x3d1>
0x1863c40f328d   1cd  478b44232c           movl r8,[r11+r12*1+0x2c]
0x1863c40f3292   1d2  4533c9               xorl r9,r9
0x1863c40f3295   1d5  4585c0               testl r8,r8
0x1863c40f3298   1d8  410f95c1             setnzl r9l
0x1863c40f329c   1dc  452bc1               subl r8,r9
0x1863c40f329f   1df  478b4c2328           movl r9,[r11+r12*1+0x28]
0x1863c40f32a4   1e4  33db                 xorl rbx,rbx
0x1863c40f32a6   1e6  4585c9               testl r9,r9
0x1863c40f32a9   1e9  0f95c3               setnzl bl
0x1863c40f32ac   1ec  458bf1               movl r14,r9
0x1863c40f32af   1ef  442bf3               subl r14,rbx
0x1863c40f32b2   1f2  438b5c2304           movl rbx,[r11+r12*1+0x4]
0x1863c40f32b7   1f7  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x1863c40f32be   1fe  448b55e8             movl r10,[rbp-0x18]
0x1863c40f32c2   202  4c8955c8             REX.W movq [rbp-0x38],r10
0x1863c40f32c6   206  8bca                 movl rcx,rdx
0x1863c40f32c8   208  8b5590               movl rdx,[rbp-0x70]
0x1863c40f32cb   20b  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f32cf   20f  e930000000           jmp 0x1863c40f3304  <+0x244>
0x1863c40f32d4   214  660f1f840000000000   nop
0x1863c40f32dd   21d  660f1f840000000000   nop
0x1863c40f32e6   226  660f1f840000000000   nop
0x1863c40f32ef   22f  660f1f840000000000   nop
0x1863c40f32f8   238  0f1f840000000000     nop
0x1863c40f3300   240  4c8965c8             REX.W movq [rbp-0x38],r12
0x1863c40f3304   244  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f3308   248  0f8675070000         jna 0x1863c40f3a83  <+0x9c3>
0x1863c40f330e   24e  8bf1                 movl rsi,rcx
0x1863c40f3310   250  c4c17a591433         vmulss xmm2,xmm0,[r11+rsi*1]
0x1863c40f3316   256  c5f82ed2             vucomiss xmm2,xmm2
0x1863c40f331a   25a  7a06                 jpe 0x1863c40f3322  <+0x262>
0x1863c40f331c   25c  0f8404000000         jz 0x1863c40f3326  <+0x266>
0x1863c40f3322   262  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f3326   266  c5f82ed1             vucomiss xmm2,xmm1
0x1863c40f332a   26a  0f8704000000         ja 0x1863c40f3334  <+0x274>
0x1863c40f3330   270  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f3334   274  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x1863c40f3338   278  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x1863c40f333e   27e  c5fb2cf4             vcvttsd2si rsi,xmm4
0x1863c40f3342   282  85f6                 testl rsi,rsi
0x1863c40f3344   284  0f8929000000         jns 0x1863c40f3373  <+0x2b3>
0x1863c40f334a   28a  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x1863c40f3354   294  c441f96efa           vmovq xmm15,r10
0x1863c40f3359   299  c50358fc             vaddsd xmm15,xmm15,xmm4
0x1863c40f335d   29d  c4c17b2cf7           vcvttsd2si rsi,xmm15
0x1863c40f3362   2a2  85f6                 testl rsi,rsi
0x1863c40f3364   2a4  0f8809000000         js 0x1863c40f3373  <+0x2b3>
0x1863c40f336a   2aa  41ba00000080         movl r10,0x80000000
0x1863c40f3370   2b0  410bf2               orl rsi,r10
0x1863c40f3373   2b3  448bd6               movl r10,rsi
0x1863c40f3376   2b6  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x1863c40f337b   2bb  c5f92eec             vucomisd xmm5,xmm4
0x1863c40f337f   2bf  0f8a53070000         jpe 0x1863c40f3ad8  <+0xa18>
0x1863c40f3385   2c5  0f854d070000         jnz 0x1863c40f3ad8  <+0xa18>
0x1863c40f338b   2cb  8bc6                 movl rax,rsi
0x1863c40f338d   2cd  443bf6               cmpl r14,rsi
0x1863c40f3390   2d0  410f42c6             cmovcl rax,r14
0x1863c40f3394   2d4  83c001               addl rax,0x1
0x1863c40f3397   2d7  41ba0000804f         movl r10,0x4f800000
0x1863c40f339d   2dd  c4c1796eda           vmovd xmm3,r10
0x1863c40f33a2   2e2  be01000000           movl rsi,0x1
0x1863c40f33a7   2e7  c5f82eda             vucomiss xmm3,xmm2
0x1863c40f33ab   2eb  0f47f0               cmoval rsi,rax
0x1863c40f33ae   2ee  8bc2                 movl rax,rdx
0x1863c40f33b0   2f0  c4c17a591403         vmulss xmm2,xmm0,[r11+rax*1]
0x1863c40f33b6   2f6  c5f82ed2             vucomiss xmm2,xmm2
0x1863c40f33ba   2fa  7a06                 jpe 0x1863c40f33c2  <+0x302>
0x1863c40f33bc   2fc  0f8404000000         jz 0x1863c40f33c6  <+0x306>
0x1863c40f33c2   302  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f33c6   306  c5f82ed1             vucomiss xmm2,xmm1
0x1863c40f33ca   30a  0f8704000000         ja 0x1863c40f33d4  <+0x314>
0x1863c40f33d0   310  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f33d4   314  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x1863c40f33d8   318  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x1863c40f33de   31e  c5fb2cc5             vcvttsd2si rax,xmm5
0x1863c40f33e2   322  85c0                 testl rax,rax
0x1863c40f33e4   324  0f8926000000         jns 0x1863c40f3410  <+0x350>
0x1863c40f33ea   32a  4c8b155bffffff       REX.W movq r10,[rip+0xffffff5b]
0x1863c40f33f1   331  c441f96efa           vmovq xmm15,r10
0x1863c40f33f6   336  c50358fd             vaddsd xmm15,xmm15,xmm5
0x1863c40f33fa   33a  c4c17b2cc7           vcvttsd2si rax,xmm15
0x1863c40f33ff   33f  85c0                 testl rax,rax
0x1863c40f3401   341  0f8809000000         js 0x1863c40f3410  <+0x350>
0x1863c40f3407   347  41ba00000080         movl r10,0x80000000
0x1863c40f340d   34d  410bc2               orl rax,r10
0x1863c40f3410   350  448bd0               movl r10,rax
0x1863c40f3413   353  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x1863c40f3418   358  c5f92ef5             vucomisd xmm6,xmm5
0x1863c40f341c   35c  0f8ad8060000         jpe 0x1863c40f3afa  <+0xa3a>
0x1863c40f3422   362  0f85d2060000         jnz 0x1863c40f3afa  <+0xa3a>
0x1863c40f3428   368  448be0               movl r12,rax
0x1863c40f342b   36b  443bc0               cmpl r8,rax
0x1863c40f342e   36e  450f42e0             cmovcl r12,r8
0x1863c40f3432   372  488bc7               REX.W movq rax,rdi
0x1863c40f3435   375  c5f82eda             vucomiss xmm3,xmm2
0x1863c40f3439   379  410f47c4             cmoval rax,r12
0x1863c40f343d   37d  458be1               movl r12,r9
0x1863c40f3440   380  440fafe0             imull r12,rax
0x1863c40f3444   384  4403e6               addl r12,rsi
0x1863c40f3447   387  4539e7               cmpl r15,r12
0x1863c40f344a   38a  0f860f000000         jna 0x1863c40f345f  <+0x39f>
0x1863c40f3450   390  468d24a3             leal r12,[rbx+r12*4]
0x1863c40f3454   394  438b0423             movl rax,[r11+r12*1]
0x1863c40f3458   398  83c001               addl rax,0x1
0x1863c40f345b   39b  43890423             movl [r11+r12*1],rax
0x1863c40f345f   39f  83c104               addl rcx,0x4
0x1863c40f3462   3a2  83c204               addl rdx,0x4
0x1863c40f3465   3a5  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x1863c40f3469   3a9  4183c4ff             addl r12,0xff
0x1863c40f346d   3ad  0f858dfeffff         jnz 0x1863c40f3300  <+0x240>
0x1863c40f3473   3b3  448bc3               movl r8,rbx
0x1863c40f3476   3b6  448b75e8             movl r14,[rbp-0x18]
0x1863c40f347a   3ba  8b5d90               movl rbx,[rbp-0x70]
0x1863c40f347d   3bd  8b5588               movl rdx,[rbp-0x78]
0x1863c40f3480   3c0  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f3484   3c4  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f348a   3ca  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f348e   3ce  8b4580               movl rax,[rbp-0x80]
0x1863c40f3491   3d1  4c898578ffffff       REX.W movq [rbp-0x88],r8
0x1863c40f3498   3d8  4585ff               testl r15,r15
0x1863c40f349b   3db  0f8508000000         jnz 0x1863c40f34a9  <+0x3e9>
0x1863c40f34a1   3e1  488bdf               REX.W movq rbx,rdi
0x1863c40f34a4   3e4  e968020000           jmp 0x1863c40f3711  <+0x651>
0x1863c40f34a9   3e9  468d0cbd00000000     leal r9,[r15*4+0x0]
0x1863c40f34b1   3f1  428d1cbdfcffffff     leal rbx,[r15*4-0x4]
0x1863c40f34b9   3f9  448bf3               movl r14,rbx
0x1863c40f34bc   3fc  41c1ee02             shrl r14, 2
0x1863c40f34c0   400  4183c601             addl r14,0x1
0x1863c40f34c4   404  418bd6               movl rdx,r14
0x1863c40f34c7   407  83e207               andl rdx,0x7
0x1863c40f34ca   40a  4c894dc0             REX.W movq [rbp-0x40],r9
0x1863c40f34ce   40e  83fb1c               cmpl rbx,0x1c
0x1863c40f34d1   411  0f82db000000         jc 0x1863c40f35b2  <+0x4f2>
0x1863c40f34d7   417  4181e6f8ffff7f       andl r14,0x7ffffff8
0x1863c40f34de   41e  418bd8               movl rbx,r8
0x1863c40f34e1   421  488bcf               REX.W movq rcx,rdi
0x1863c40f34e4   424  660f1f840000000000   nop
0x1863c40f34ed   42d  660f1f840000000000   nop
0x1863c40f34f6   436  660f1f840000000000   nop
0x1863c40f34ff   43f  90                   nop
0x1863c40f3500   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f3504   444  0f8612060000         jna 0x1863c40f3b1c  <+0xa5c>
0x1863c40f350a   44a  418b341b             movl rsi,[r11+rbx*1]
0x1863c40f350e   44e  03ce                 addl rcx,rsi
0x1863c40f3510   450  41890c1b             movl [r11+rbx*1],rcx
0x1863c40f3514   454  8d7304               leal rsi,[rbx+0x4]
0x1863c40f3517   457  458b0433             movl r8,[r11+rsi*1]
0x1863c40f351b   45b  4103c8               addl rcx,r8
0x1863c40f351e   45e  41890c33             movl [r11+rsi*1],rcx
0x1863c40f3522   462  8d7308               leal rsi,[rbx+0x8]
0x1863c40f3525   465  458b0433             movl r8,[r11+rsi*1]
0x1863c40f3529   469  4103c8               addl rcx,r8
0x1863c40f352c   46c  41890c33             movl [r11+rsi*1],rcx
0x1863c40f3530   470  8d730c               leal rsi,[rbx+0xc]
0x1863c40f3533   473  458b0433             movl r8,[r11+rsi*1]
0x1863c40f3537   477  4103c8               addl rcx,r8
0x1863c40f353a   47a  41890c33             movl [r11+rsi*1],rcx
0x1863c40f353e   47e  8d7310               leal rsi,[rbx+0x10]
0x1863c40f3541   481  458b0433             movl r8,[r11+rsi*1]
0x1863c40f3545   485  4103c8               addl rcx,r8
0x1863c40f3548   488  41890c33             movl [r11+rsi*1],rcx
0x1863c40f354c   48c  8d7314               leal rsi,[rbx+0x14]
0x1863c40f354f   48f  458b0433             movl r8,[r11+rsi*1]
0x1863c40f3553   493  4103c8               addl rcx,r8
0x1863c40f3556   496  41890c33             movl [r11+rsi*1],rcx
0x1863c40f355a   49a  8d7318               leal rsi,[rbx+0x18]
0x1863c40f355d   49d  458b0433             movl r8,[r11+rsi*1]
0x1863c40f3561   4a1  4103c8               addl rcx,r8
0x1863c40f3564   4a4  41890c33             movl [r11+rsi*1],rcx
0x1863c40f3568   4a8  8d731c               leal rsi,[rbx+0x1c]
0x1863c40f356b   4ab  458b0433             movl r8,[r11+rsi*1]
0x1863c40f356f   4af  4103c8               addl rcx,r8
0x1863c40f3572   4b2  41890c33             movl [r11+rsi*1],rcx
0x1863c40f3576   4b6  83c320               addl rbx,0x20
0x1863c40f3579   4b9  4183c6f8             addl r14,0xf8
0x1863c40f357d   4bd  7581                 jnz 0x1863c40f3500  <+0x440>
0x1863c40f357f   4bf  85d2                 testl rdx,rdx
0x1863c40f3581   4c1  0f8510000000         jnz 0x1863c40f3597  <+0x4d7>
0x1863c40f3587   4c7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f358b   4cb  448b8578ffffff       movl r8,[rbp-0x88]
0x1863c40f3592   4d2  e98b000000           jmp 0x1863c40f3622  <+0x562>
0x1863c40f3597   4d7  448bf3               movl r14,rbx
0x1863c40f359a   4da  8bd9                 movl rbx,rcx
0x1863c40f359c   4dc  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f35a2   4e2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f35a6   4e6  448b8578ffffff       movl r8,[rbp-0x88]
0x1863c40f35ad   4ed  e906000000           jmp 0x1863c40f35b8  <+0x4f8>
0x1863c40f35b2   4f2  488bdf               REX.W movq rbx,rdi
0x1863c40f35b5   4f5  458bf0               movl r14,r8
0x1863c40f35b8   4f8  c1e202               shll rdx, 2
0x1863c40f35bb   4fb  0f1f440000           nop
0x1863c40f35c0   500  438b0c33             movl rcx,[r11+r14*1]
0x1863c40f35c4   504  03d9                 addl rbx,rcx
0x1863c40f35c6   506  43891c33             movl [r11+r14*1],rbx
0x1863c40f35ca   50a  4183c604             addl r14,0x4
0x1863c40f35ce   50e  83c2fc               addl rdx,0xfc
0x1863c40f35d1   511  0f844b000000         jz 0x1863c40f3622  <+0x562>
0x1863c40f35d7   517  438b0c33             movl rcx,[r11+r14*1]
0x1863c40f35db   51b  03d9                 addl rbx,rcx
0x1863c40f35dd   51d  43891c33             movl [r11+r14*1],rbx
0x1863c40f35e1   521  4183c604             addl r14,0x4
0x1863c40f35e5   525  83c2fc               addl rdx,0xfc
0x1863c40f35e8   528  0f8434000000         jz 0x1863c40f3622  <+0x562>
0x1863c40f35ee   52e  438b0c33             movl rcx,[r11+r14*1]
0x1863c40f35f2   532  03d9                 addl rbx,rcx
0x1863c40f35f4   534  43891c33             movl [r11+r14*1],rbx
0x1863c40f35f8   538  4183c604             addl r14,0x4
0x1863c40f35fc   53c  83c2fc               addl rdx,0xfc
0x1863c40f35ff   53f  0f841d000000         jz 0x1863c40f3622  <+0x562>
0x1863c40f3605   545  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f3609   549  0f864d050000         jna 0x1863c40f3b5c  <+0xa9c>
0x1863c40f360f   54f  438b0c33             movl rcx,[r11+r14*1]
0x1863c40f3613   553  03d9                 addl rbx,rcx
0x1863c40f3615   555  43891c33             movl [r11+r14*1],rbx
0x1863c40f3619   559  4183c604             addl r14,0x4
0x1863c40f361d   55d  83c2fc               addl rdx,0xfc
0x1863c40f3620   560  759e                 jnz 0x1863c40f35c0  <+0x500>
0x1863c40f3622   562  43c744231400000000   movl [r11+r12*1+0x14],0x0
0x1863c40f362b   56b  438b5c230c           movl rbx,[r11+r12*1+0xc]
0x1863c40f3630   570  47397c230c           cmpl [r11+r12*1+0xc],r15
0x1863c40f3635   575  0f834a000000         jnc 0x1863c40f3685  <+0x5c5>
0x1863c40f363b   57b  8bd8                 movl rbx,rax
0x1863c40f363d   57d  8d430c               leal rax,[rbx+0xc]
0x1863c40f3640   580  418bcf               movl rcx,r15
0x1863c40f3643   583  488bd7               REX.W movq rdx,rdi
0x1863c40f3646   586  e8b566f2ff           call 0x1863c4019d00  (jump table)
0x1863c40f364b   58b  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x1863c40f364f   58f  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x1863c40f3653   593  468b641b14           movl r12,[rbx+r11*1+0x14]
0x1863c40f3658   598  4c8bd3               REX.W movq r10,rbx
0x1863c40f365b   59b  4489e3               movl rbx,r12
0x1863c40f365e   59e  4d8be3               REX.W movq r12,r11
0x1863c40f3661   5a1  4d8bda               REX.W movq r11,r10
0x1863c40f3664   5a4  33ff                 xorl rdi,rdi
0x1863c40f3666   5a6  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f366a   5aa  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f366e   5ae  8b4580               movl rax,[rbp-0x80]
0x1863c40f3671   5b1  448b7dd0             movl r15,[rbp-0x30]
0x1863c40f3675   5b5  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3679   5b9  448b8578ffffff       movl r8,[rbp-0x88]
0x1863c40f3680   5c0  e903000000           jmp 0x1863c40f3688  <+0x5c8>
0x1863c40f3685   5c5  488bdf               REX.W movq rbx,rdi
0x1863c40f3688   5c8  48895dc8             REX.W movq [rbp-0x38],rbx
0x1863c40f368c   5cc  4d8bf7               REX.W movq r14,r15
0x1863c40f368f   5cf  41c1e602             shll r14, 2
0x1863c40f3693   5d3  0f8478000000         jz 0x1863c40f3711  <+0x651>
0x1863c40f3699   5d9  478b742310           movl r14,[r11+r12*1+0x10]
0x1863c40f369e   5de  418d0c9e             leal rcx,[r14+rbx*4]
0x1863c40f36a2   5e2  4989e2               REX.W movq r10,rsp
0x1863c40f36a5   5e5  4883ec08             REX.W subq rsp,0x8
0x1863c40f36a9   5e9  4883e4f0             REX.W andq rsp,0xf0
0x1863c40f36ad   5ed  4c891424             REX.W movq [rsp],r10
0x1863c40f36b1   5f1  488bd7               REX.W movq rdx,rdi
0x1863c40f36b4   5f4  4c8bd7               REX.W movq r10,rdi
0x1863c40f36b7   5f7  488bfe               REX.W movq rdi,rsi
0x1863c40f36ba   5fa  498bf2               REX.W movq rsi,r10
0x1863c40f36bd   5fd  48b870f2930100000000 REX.W movq rax,0x193f270
0x1863c40f36c7   607  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x1863c40f36ce   60e  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x1863c40f36d5   615  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x1863c40f36dc   61c  ffd0                 call rax
0x1863c40f36de   61e  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x1863c40f36e9   629  488b2424             REX.W movq rsp,[rsp]
0x1863c40f36ed   62d  85c0                 testl rax,rax
0x1863c40f36ef   62f  0f844c050000         jz 0x1863c40f3c41  <+0xb81>
0x1863c40f36f5   635  8b5dc8               movl rbx,[rbp-0x38]
0x1863c40f36f8   638  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f36fc   63c  33ff                 xorl rdi,rdi
0x1863c40f36fe   63e  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3702   642  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f3706   646  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f370a   64a  8b4580               movl rax,[rbp-0x80]
0x1863c40f370d   64d  448b7dd0             movl r15,[rbp-0x30]
0x1863c40f3711   651  43c744232000000000   movl [r11+r12*1+0x20],0x0
0x1863c40f371a   65a  4103df               addl rbx,r15
0x1863c40f371d   65d  43895c2314           movl [r11+r12*1+0x14],rbx
0x1863c40f3722   662  83bd70ffffff00       cmpl [rbp-0x90],0x0
0x1863c40f3729   669  0f8508000000         jnz 0x1863c40f3737  <+0x677>
0x1863c40f372f   66f  488bdf               REX.W movq rbx,rdi
0x1863c40f3732   672  e90b010000           jmp 0x1863c40f3842  <+0x782>
0x1863c40f3737   677  438b5c2318           movl rbx,[r11+r12*1+0x18]
0x1863c40f373c   67c  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f3742   682  43394c2318           cmpl [r11+r12*1+0x18],rcx
0x1863c40f3747   687  0f833b000000         jnc 0x1863c40f3788  <+0x6c8>
0x1863c40f374d   68d  8bd8                 movl rbx,rax
0x1863c40f374f   68f  8d4318               leal rax,[rbx+0x18]
0x1863c40f3752   692  488bd7               REX.W movq rdx,rdi
0x1863c40f3755   695  e8a665f2ff           call 0x1863c4019d00  (jump table)
0x1863c40f375a   69a  488b5dd8             REX.W movq rbx,[rbp-0x28]
0x1863c40f375e   69e  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x1863c40f3762   6a2  468b641b20           movl r12,[rbx+r11*1+0x20]
0x1863c40f3767   6a7  4c8bd3               REX.W movq r10,rbx
0x1863c40f376a   6aa  4489e3               movl rbx,r12
0x1863c40f376d   6ad  4d8be3               REX.W movq r12,r11
0x1863c40f3770   6b0  4d8bda               REX.W movq r11,r10
0x1863c40f3773   6b3  33ff                 xorl rdi,rdi
0x1863c40f3775   6b5  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3779   6b9  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f377f   6bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f3783   6c3  e903000000           jmp 0x1863c40f378b  <+0x6cb>
0x1863c40f3788   6c8  488bdf               REX.W movq rbx,rdi
0x1863c40f378b   6cb  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x1863c40f3790   6d0  418d149f             leal rdx,[r15+rbx*4]
0x1863c40f3794   6d4  48895dd0             REX.W movq [rbp-0x30],rbx
0x1863c40f3798   6d8  4c897dc8             REX.W movq [rbp-0x38],r15
0x1863c40f379c   6dc  83f901               cmpl rcx,0x1
0x1863c40f379f   6df  0f8492000000         jz 0x1863c40f3837  <+0x777>
0x1863c40f37a5   6e5  448bf1               movl r14,rcx
0x1863c40f37a8   6e8  428d04b500000000     leal rax,[r14*4+0x0]
0x1863c40f37b0   6f0  83c0fc               addl rax,0xfc
0x1863c40f37b3   6f3  0f846f000000         jz 0x1863c40f3828  <+0x768>
0x1863c40f37b9   6f9  4989e2               REX.W movq r10,rsp
0x1863c40f37bc   6fc  4883ec08             REX.W subq rsp,0x8
0x1863c40f37c0   700  4883e4f0             REX.W andq rsp,0xf0
0x1863c40f37c4   704  4c891424             REX.W movq [rsp],r10
0x1863c40f37c8   708  488bcf               REX.W movq rcx,rdi
0x1863c40f37cb   70b  4c8bd7               REX.W movq r10,rdi
0x1863c40f37ce   70e  488bfe               REX.W movq rdi,rsi
0x1863c40f37d1   711  498bf2               REX.W movq rsi,r10
0x1863c40f37d4   714  4c8bc0               REX.W movq r8,rax
0x1863c40f37d7   717  488b05f7f9ffff       REX.W movq rax,[rip+0xfffff9f7]
0x1863c40f37de   71e  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x1863c40f37e5   725  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x1863c40f37ec   72c  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x1863c40f37f3   733  ffd0                 call rax
0x1863c40f37f5   735  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x1863c40f3800   740  488b2424             REX.W movq rsp,[rsp]
0x1863c40f3804   744  85c0                 testl rax,rax
0x1863c40f3806   746  0f8430040000         jz 0x1863c40f3c3c  <+0xb7c>
0x1863c40f380c   74c  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3810   750  33ff                 xorl rdi,rdi
0x1863c40f3812   752  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3816   756  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f381a   75a  8b5dd0               movl rbx,[rbp-0x30]
0x1863c40f381d   75d  448b7dc8             movl r15,[rbp-0x38]
0x1863c40f3821   761  448bb570ffffff       movl r14,[rbp-0x90]
0x1863c40f3828   768  4103de               addl rbx,r14
0x1863c40f382b   76b  448d73ff             leal r14,[rbx-0x1]
0x1863c40f382f   76f  418d549ffc           leal rdx,[r15+rbx*4-0x4]
0x1863c40f3834   774  418bde               movl rbx,r14
0x1863c40f3837   777  41c7041300000000     movl [r11+rdx*1],0x0
0x1863c40f383f   77f  83c301               addl rbx,0x1
0x1863c40f3842   782  43895c2320           movl [r11+r12*1+0x20],rbx
0x1863c40f3847   787  837de800             cmpl [rbp-0x18],0x0
0x1863c40f384b   78b  0f8505000000         jnz 0x1863c40f3856  <+0x796>
0x1863c40f3851   791  488be5               REX.W movq rsp,rbp
0x1863c40f3854   794  5d                   pop rbp
0x1863c40f3855   795  c3                   retl
0x1863c40f3856   796  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x1863c40f385b   79b  4533f6               xorl r14,r14
0x1863c40f385e   79e  4585ff               testl r15,r15
0x1863c40f3861   7a1  410f95c6             setnzl r14l
0x1863c40f3865   7a5  452bfe               subl r15,r14
0x1863c40f3868   7a8  478b742328           movl r14,[r11+r12*1+0x28]
0x1863c40f386d   7ad  33c0                 xorl rax,rax
0x1863c40f386f   7af  4585f6               testl r14,r14
0x1863c40f3872   7b2  0f95c0               setnzl al
0x1863c40f3875   7b5  418bd6               movl rdx,r14
0x1863c40f3878   7b8  2bd0                 subl rdx,rax
0x1863c40f387a   7ba  438b44231c           movl rax,[r11+r12*1+0x1c]
0x1863c40f387f   7bf  438b4c2310           movl rcx,[r11+r12*1+0x10]
0x1863c40f3884   7c4  438b742314           movl rsi,[r11+r12*1+0x14]
0x1863c40f3889   7c9  c4817a10442324       vmovss xmm0,[r11+r12*1+0x24]
0x1863c40f3890   7d0  4c897d98             REX.W movq [rbp-0x68],r15
0x1863c40f3894   7d4  4c8975a0             REX.W movq [rbp-0x60],r14
0x1863c40f3898   7d8  4c8be7               REX.W movq r12,rdi
0x1863c40f389b   7db  448b4d88             movl r9,[rbp-0x78]
0x1863c40f389f   7df  e924000000           jmp 0x1863c40f38c8  <+0x808>
0x1863c40f38a4   7e4  660f1f840000000000   nop
0x1863c40f38ad   7ed  660f1f840000000000   nop
0x1863c40f38b6   7f6  660f1f840000000000   nop
0x1863c40f38bf   7ff  90                   nop
0x1863c40f38c0   800  448b7d98             movl r15,[rbp-0x68]
0x1863c40f38c4   804  4c894590             REX.W movq [rbp-0x70],r8
0x1863c40f38c8   808  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f38cc   80c  0f86cf020000         jna 0x1863c40f3ba1  <+0xae1>
0x1863c40f38d2   812  448b7590             movl r14,[rbp-0x70]
0x1863c40f38d6   816  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x1863c40f38dc   81c  c5f82ed2             vucomiss xmm2,xmm2
0x1863c40f38e0   820  7a06                 jpe 0x1863c40f38e8  <+0x828>
0x1863c40f38e2   822  0f8404000000         jz 0x1863c40f38ec  <+0x82c>
0x1863c40f38e8   828  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f38ec   82c  c5f82ed1             vucomiss xmm2,xmm1
0x1863c40f38f0   830  0f8704000000         ja 0x1863c40f38fa  <+0x83a>
0x1863c40f38f6   836  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f38fa   83a  c5ea5ada             vcvtss2sd xmm3,xmm2,xmm2
0x1863c40f38fe   83e  c4e3590be30b         vroundsd xmm4,xmm4,xmm3,0xb
0x1863c40f3904   844  c57b2cf4             vcvttsd2si r14,xmm4
0x1863c40f3908   848  4585f6               testl r14,r14
0x1863c40f390b   84b  0f8927000000         jns 0x1863c40f3938  <+0x878>
0x1863c40f3911   851  4c8b1534faffff       REX.W movq r10,[rip+0xfffffa34]
0x1863c40f3918   858  c441f96efa           vmovq xmm15,r10
0x1863c40f391d   85d  c50358fc             vaddsd xmm15,xmm15,xmm4
0x1863c40f3921   861  c4417b2cf7           vcvttsd2si r14,xmm15
0x1863c40f3926   866  4585f6               testl r14,r14
0x1863c40f3929   869  0f8809000000         js 0x1863c40f3938  <+0x878>
0x1863c40f392f   86f  41ba00000080         movl r10,0x80000000
0x1863c40f3935   875  450bf2               orl r14,r10
0x1863c40f3938   878  458bd6               movl r10,r14
0x1863c40f393b   87b  c4c1832aea           vcvtqsi2sd xmm5,xmm15,r10
0x1863c40f3940   880  c5f92eec             vucomisd xmm5,xmm4
0x1863c40f3944   884  0f8aac020000         jpe 0x1863c40f3bf6  <+0xb36>
0x1863c40f394a   88a  0f85a6020000         jnz 0x1863c40f3bf6  <+0xb36>
0x1863c40f3950   890  458bc6               movl r8,r14
0x1863c40f3953   893  453bfe               cmpl r15,r14
0x1863c40f3956   896  450f42c7             cmovcl r8,r15
0x1863c40f395a   89a  41ba0000804f         movl r10,0x4f800000
0x1863c40f3960   8a0  c4c1796eda           vmovd xmm3,r10
0x1863c40f3965   8a5  4c8bf7               REX.W movq r14,rdi
0x1863c40f3968   8a8  c5f82eda             vucomiss xmm3,xmm2
0x1863c40f396c   8ac  450f47f0             cmoval r14,r8
0x1863c40f3970   8b0  448b45a0             movl r8,[rbp-0x60]
0x1863c40f3974   8b4  450fafc6             imull r8,r14
0x1863c40f3978   8b8  458bf1               movl r14,r9
0x1863c40f397b   8bb  c4817a591433         vmulss xmm2,xmm0,[r11+r14*1]
0x1863c40f3981   8c1  c5f82ed2             vucomiss xmm2,xmm2
0x1863c40f3985   8c5  7a06                 jpe 0x1863c40f398d  <+0x8cd>
0x1863c40f3987   8c7  0f8404000000         jz 0x1863c40f3991  <+0x8d1>
0x1863c40f398d   8cd  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f3991   8d1  c5f82ed1             vucomiss xmm2,xmm1
0x1863c40f3995   8d5  0f8704000000         ja 0x1863c40f399f  <+0x8df>
0x1863c40f399b   8db  c5f928d1             vmovapd xmm2,xmm1
0x1863c40f399f   8df  c5ea5ae2             vcvtss2sd xmm4,xmm2,xmm2
0x1863c40f39a3   8e3  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x1863c40f39a9   8e9  c57b2cf5             vcvttsd2si r14,xmm5
0x1863c40f39ad   8ed  4585f6               testl r14,r14
0x1863c40f39b0   8f0  0f8927000000         jns 0x1863c40f39dd  <+0x91d>
0x1863c40f39b6   8f6  4c8b158ff9ffff       REX.W movq r10,[rip+0xfffff98f]
0x1863c40f39bd   8fd  c441f96efa           vmovq xmm15,r10
0x1863c40f39c2   902  c50358fd             vaddsd xmm15,xmm15,xmm5
0x1863c40f39c6   906  c4417b2cf7           vcvttsd2si r14,xmm15
0x1863c40f39cb   90b  4585f6               testl r14,r14
0x1863c40f39ce   90e  0f8809000000         js 0x1863c40f39dd  <+0x91d>
0x1863c40f39d4   914  41ba00000080         movl r10,0x80000000
0x1863c40f39da   91a  450bf2               orl r14,r10
0x1863c40f39dd   91d  458bd6               movl r10,r14
0x1863c40f39e0   920  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x1863c40f39e5   925  c5f92ef5             vucomisd xmm6,xmm5
0x1863c40f39e9   929  0f8a2a020000         jpe 0x1863c40f3c19  <+0xb59>
0x1863c40f39ef   92f  0f8524020000         jnz 0x1863c40f3c19  <+0xb59>
0x1863c40f39f5   935  458bfe               movl r15,r14
0x1863c40f39f8   938  413bd6               cmpl rdx,r14
0x1863c40f39fb   93b  440f42fa             cmovcl r15,rdx
0x1863c40f39ff   93f  4c8bf7               REX.W movq r14,rdi
0x1863c40f3a02   942  c5f82eda             vucomiss xmm3,xmm2
0x1863c40f3a06   946  450f47f7             cmoval r14,r15
0x1863c40f3a0a   94a  478d3c06             leal r15,[r14+r8*1]
0x1863c40f3a0e   94e  413bf7               cmpl rsi,r15
0x1863c40f3a11   951  0f8625000000         jna 0x1863c40f3a3c  <+0x97c>
0x1863c40f3a17   957  468d3cb9             leal r15,[rcx+r15*4]
0x1863c40f3a1b   95b  478b343b             movl r14,[r11+r15*1]
0x1863c40f3a1f   95f  413bde               cmpl rbx,r14
0x1863c40f3a22   962  0f860c000000         jna 0x1863c40f3a34  <+0x974>
0x1863c40f3a28   968  468d34b0             leal r14,[rax+r14*4]
0x1863c40f3a2c   96c  47892433             movl [r11+r14*1],r12
0x1863c40f3a30   970  478b343b             movl r14,[r11+r15*1]
0x1863c40f3a34   974  4183c601             addl r14,0x1
0x1863c40f3a38   978  4789343b             movl [r11+r15*1],r14
0x1863c40f3a3c   97c  4183c104             addl r9,0x4
0x1863c40f3a40   980  448b4590             movl r8,[rbp-0x70]
0x1863c40f3a44   984  4183c004             addl r8,0x4
0x1863c40f3a48   988  4183c401             addl r12,0x1
0x1863c40f3a4c   98c  448b75e8             movl r14,[rbp-0x18]
0x1863c40f3a50   990  4539e6               cmpl r14,r12
0x1863c40f3a53   993  0f8567feffff         jnz 0x1863c40f38c0  <+0x800>
0x1863c40f3a59   999  e9f3fdffff           jmp 0x1863c40f3851  <+0x791>
0x1863c40f3a5e   99e  e86d6af2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f3a63   9a3  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3a67   9a7  8b5d90               movl rbx,[rbp-0x70]
0x1863c40f3a6a   9aa  8b5588               movl rdx,[rbp-0x78]
0x1863c40f3a6d   9ad  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1863c40f3a73   9b3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f3a77   9b7  8b4580               movl rax,[rbp-0x80]
0x1863c40f3a7a   9ba  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3a7e   9be  e974f6ffff           jmp 0x1863c40f30f7  <+0x37>
0x1863c40f3a83   9c3  48899d78ffffff       REX.W movq [rbp-0x88],rbx
0x1863c40f3a8a   9ca  488955b8             REX.W movq [rbp-0x48],rdx
0x1863c40f3a8e   9ce  48894db0             REX.W movq [rbp-0x50],rcx
0x1863c40f3a92   9d2  4c894da8             REX.W movq [rbp-0x58],r9
0x1863c40f3a96   9d6  4c8945a0             REX.W movq [rbp-0x60],r8
0x1863c40f3a9a   9da  c5fb114598           vmovsd [rbp-0x68],xmm0
0x1863c40f3a9f   9df  4c8975c0             REX.W movq [rbp-0x40],r14
0x1863c40f3aa3   9e3  e8286af2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f3aa8   9e8  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3aac   9ec  33ff                 xorl rdi,rdi
0x1863c40f3aae   9ee  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3ab2   9f2  448b7dd0             movl r15,[rbp-0x30]
0x1863c40f3ab6   9f6  8b9d78ffffff         movl rbx,[rbp-0x88]
0x1863c40f3abc   9fc  8b55b8               movl rdx,[rbp-0x48]
0x1863c40f3abf   9ff  8b4db0               movl rcx,[rbp-0x50]
0x1863c40f3ac2   a02  448b4da8             movl r9,[rbp-0x58]
0x1863c40f3ac6   a06  448b45a0             movl r8,[rbp-0x60]
0x1863c40f3aca   a0a  c5fb104598           vmovsd xmm0,[rbp-0x68]
0x1863c40f3acf   a0f  448b75c0             movl r14,[rbp-0x40]
0x1863c40f3ad3   a13  e936f8ffff           jmp 0x1863c40f330e  <+0x24e>
0x1863c40f3ad8   a18  c5f92edb             vucomisd xmm3,xmm3
0x1863c40f3adc   a1c  0f8b08000000         jpo 0x1863c40f3aea  <+0xa2a>
0x1863c40f3ae2   a22  488bf7               REX.W movq rsi,rdi
0x1863c40f3ae5   a25  e9a1f8ffff           jmp 0x1863c40f338b  <+0x2cb>
0x1863c40f3aea   a2a  c5f82eca             vucomiss xmm1,xmm2
0x1863c40f3aee   a2e  77f2                 ja 0x1863c40f3ae2  <+0xa22>
0x1863c40f3af0   a30  beffffffff           movl rsi,0xffffffff
0x1863c40f3af5   a35  e991f8ffff           jmp 0x1863c40f338b  <+0x2cb>
0x1863c40f3afa   a3a  c5f92ee4             vucomisd xmm4,xmm4
0x1863c40f3afe   a3e  0f8b08000000         jpo 0x1863c40f3b0c  <+0xa4c>
0x1863c40f3b04   a44  488bc7               REX.W movq rax,rdi
0x1863c40f3b07   a47  e91cf9ffff           jmp 0x1863c40f3428  <+0x368>
0x1863c40f3b0c   a4c  c5f82eca             vucomiss xmm1,xmm2
0x1863c40f3b10   a50  77f2                 ja 0x1863c40f3b04  <+0xa44>
0x1863c40f3b12   a52  b8ffffffff           movl rax,0xffffffff
0x1863c40f3b17   a57  e90cf9ffff           jmp 0x1863c40f3428  <+0x368>
0x1863c40f3b1c   a5c  488955c8             REX.W movq [rbp-0x38],rdx
0x1863c40f3b20   a60  4c897598             REX.W movq [rbp-0x68],r14
0x1863c40f3b24   a64  48895da8             REX.W movq [rbp-0x58],rbx
0x1863c40f3b28   a68  48894db0             REX.W movq [rbp-0x50],rcx
0x1863c40f3b2c   a6c  e89f69f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f3b31   a71  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3b35   a75  33ff                 xorl rdi,rdi
0x1863c40f3b37   a77  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3b3b   a7b  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f3b3f   a7f  8b4580               movl rax,[rbp-0x80]
0x1863c40f3b42   a82  448b7dd0             movl r15,[rbp-0x30]
0x1863c40f3b46   a86  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3b4a   a8a  8b55c8               movl rdx,[rbp-0x38]
0x1863c40f3b4d   a8d  448b7598             movl r14,[rbp-0x68]
0x1863c40f3b51   a91  8b5da8               movl rbx,[rbp-0x58]
0x1863c40f3b54   a94  8b4db0               movl rcx,[rbp-0x50]
0x1863c40f3b57   a97  e9aef9ffff           jmp 0x1863c40f350a  <+0x44a>
0x1863c40f3b5c   a9c  488955c8             REX.W movq [rbp-0x38],rdx
0x1863c40f3b60   aa0  4c8975b8             REX.W movq [rbp-0x48],r14
0x1863c40f3b64   aa4  48895da8             REX.W movq [rbp-0x58],rbx
0x1863c40f3b68   aa8  e86369f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f3b6d   aad  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3b71   ab1  33ff                 xorl rdi,rdi
0x1863c40f3b73   ab3  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3b77   ab7  4c8b65e0             REX.W movq r12,[rbp-0x20]
0x1863c40f3b7b   abb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f3b7f   abf  8b4580               movl rax,[rbp-0x80]
0x1863c40f3b82   ac2  448b7dd0             movl r15,[rbp-0x30]
0x1863c40f3b86   ac6  448b4dc0             movl r9,[rbp-0x40]
0x1863c40f3b8a   aca  448b8578ffffff       movl r8,[rbp-0x88]
0x1863c40f3b91   ad1  488b55c8             REX.W movq rdx,[rbp-0x38]
0x1863c40f3b95   ad5  448b75b8             movl r14,[rbp-0x48]
0x1863c40f3b99   ad9  8b5da8               movl rbx,[rbp-0x58]
0x1863c40f3b9c   adc  e96efaffff           jmp 0x1863c40f360f  <+0x54f>
0x1863c40f3ba1   ae1  4c8965e0             REX.W movq [rbp-0x20],r12
0x1863c40f3ba5   ae5  4c894d88             REX.W movq [rbp-0x78],r9
0x1863c40f3ba9   ae9  488945d0             REX.W movq [rbp-0x30],rax
0x1863c40f3bad   aed  48895dc8             REX.W movq [rbp-0x38],rbx
0x1863c40f3bb1   af1  48894dc0             REX.W movq [rbp-0x40],rcx
0x1863c40f3bb5   af5  488975b8             REX.W movq [rbp-0x48],rsi
0x1863c40f3bb9   af9  488955b0             REX.W movq [rbp-0x50],rdx
0x1863c40f3bbd   afd  c5fb1145a8           vmovsd [rbp-0x58],xmm0
0x1863c40f3bc2   b02  e80969f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f3bc7   b07  448b65e0             movl r12,[rbp-0x20]
0x1863c40f3bcb   b0b  448b4d88             movl r9,[rbp-0x78]
0x1863c40f3bcf   b0f  4c8b5dd8             REX.W movq r11,[rbp-0x28]
0x1863c40f3bd3   b13  8b45d0               movl rax,[rbp-0x30]
0x1863c40f3bd6   b16  8b5dc8               movl rbx,[rbp-0x38]
0x1863c40f3bd9   b19  8b4dc0               movl rcx,[rbp-0x40]
0x1863c40f3bdc   b1c  8b75b8               movl rsi,[rbp-0x48]
0x1863c40f3bdf   b1f  33ff                 xorl rdi,rdi
0x1863c40f3be1   b21  8b55b0               movl rdx,[rbp-0x50]
0x1863c40f3be4   b24  c5f057c9             vxorps xmm1,xmm1,xmm1
0x1863c40f3be8   b28  c5fb1045a8           vmovsd xmm0,[rbp-0x58]
0x1863c40f3bed   b2d  448b7d98             movl r15,[rbp-0x68]
0x1863c40f3bf1   b31  e9dcfcffff           jmp 0x1863c40f38d2  <+0x812>
0x1863c40f3bf6   b36  c5f92edb             vucomisd xmm3,xmm3
0x1863c40f3bfa   b3a  0f8b08000000         jpo 0x1863c40f3c08  <+0xb48>
0x1863c40f3c00   b40  4c8bf7               REX.W movq r14,rdi
0x1863c40f3c03   b43  e948fdffff           jmp 0x1863c40f3950  <+0x890>
0x1863c40f3c08   b48  c5f82eca             vucomiss xmm1,xmm2
0x1863c40f3c0c   b4c  77f2                 ja 0x1863c40f3c00  <+0xb40>
0x1863c40f3c0e   b4e  41beffffffff         movl r14,0xffffffff
0x1863c40f3c14   b54  e937fdffff           jmp 0x1863c40f3950  <+0x890>
0x1863c40f3c19   b59  c5f92ee4             vucomisd xmm4,xmm4
0x1863c40f3c1d   b5d  0f8b08000000         jpo 0x1863c40f3c2b  <+0xb6b>
0x1863c40f3c23   b63  4c8bf7               REX.W movq r14,rdi
0x1863c40f3c26   b66  e9cafdffff           jmp 0x1863c40f39f5  <+0x935>
0x1863c40f3c2b   b6b  c5f82eca             vucomiss xmm1,xmm2
0x1863c40f3c2f   b6f  77f2                 ja 0x1863c40f3c23  <+0xb63>
0x1863c40f3c31   b71  41beffffffff         movl r14,0xffffffff
0x1863c40f3c37   b77  e9b9fdffff           jmp 0x1863c40f39f5  <+0x935>
0x1863c40f3c3c   b7c  e8cf65f2ff           call 0x1863c401a210  (jump table)
0x1863c40f3c41   b81  e8ca65f2ff           call 0x1863c401a210  (jump table)
0x1863c40f3c46   b86  e8c565f2ff           call 0x1863c401a210  (jump table)
0x1863c40f3c4b   b8b  90                   nop

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
0x1863c40f314e     8e  slots (sp->fp): 00000000000000000000

RelocInfo (size = 38)
0x1863c40f314a  internal wasm call
0x1863c40f31d5  external reference (0x193f2f0)
0x1863c40f3647  internal wasm call
0x1863c40f36bf  external reference (0x193f270)
0x1863c40f3756  internal wasm call
0x1863c40f3a5f  wasm stub call  (0x1863c401a4d0)
0x1863c40f3aa4  wasm stub call  (0x1863c401a4d0)
0x1863c40f3b2d  wasm stub call  (0x1863c401a4d0)
0x1863c40f3b69  wasm stub call  (0x1863c401a4d0)
0x1863c40f3bc3  wasm stub call  (0x1863c401a4d0)
0x1863c40f3c3d  wasm stub call  (0x1863c401a210)
0x1863c40f3c42  wasm stub call  (0x1863c401a210)
0x1863c40f3c47  wasm stub call  (0x1863c401a210)
