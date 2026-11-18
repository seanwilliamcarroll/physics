name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 6336 = 6324 + 12 padding)
Instructions (size = 6300)
0xc708ff2d00     0  55                   push rbp
0xc708ff2d01     1  4889e5               REX.W movq rbp,rsp
0xc708ff2d04     4  6a08                 push 0x8
0xc708ff2d06     6  56                   push rsi
0xc708ff2d07     7  4881ecc0010000       REX.W subq rsp,0x1c0
0xc708ff2d0e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0xc708ff2d12    12  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xc708ff2d19    19  4889bde8feffff       REX.W movq [rbp-0x118],rdi
0xc708ff2d20    20  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff2d24    24  0f863e120000         jna 0xc708ff3f68  <+0x1268>
0xc708ff2d2a    2a  4c8b462f             REX.W movq r8,[rsi+0x2f]
0xc708ff2d2e    2e  458b18               movl r11,[r8]
0xc708ff2d31    31  418d5bb0             leal rbx,[r11-0x50]
0xc708ff2d35    35  418918               movl [r8],rbx
0xc708ff2d38    38  448bd8               movl r11,rax
0xc708ff2d3b    3b  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0xc708ff2d42    42  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0xc708ff2d48    48  c5fa16d0             vmovshdup xmm2,xmm0
0xc708ff2d4c    4c  41ba0000803a         movl r10,0x3a800000
0xc708ff2d52    52  c4c1796eda           vmovd xmm3,r10
0xc708ff2d57    57  c5ea59e3             vmulss xmm4,xmm2,xmm3
0xc708ff2d5b    5b  c5f828c8             vmovaps xmm1,xmm0
0xc708ff2d5f    5f  c5e259d9             vmulss xmm3,xmm3,xmm1
0xc708ff2d63    63  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0xc708ff2d6d    6d  4c8945e8             REX.W movq [rbp-0x18],r8
0xc708ff2d71    71  48895de0             REX.W movq [rbp-0x20],rbx
0xc708ff2d75    75  4c895dd0             REX.W movq [rbp-0x30],r11
0xc708ff2d79    79  c5fb115588           vmovsd [rbp-0x78],xmm2
0xc708ff2d7e    7e  c5fb114d90           vmovsd [rbp-0x70],xmm1
0xc708ff2d83    83  c5f82eed             vucomiss xmm5,xmm5
0xc708ff2d87    87  7a06                 jpe 0xc708ff2d8f  <+0x8f>
0xc708ff2d89    89  0f8404000000         jz 0xc708ff2d93  <+0x93>
0xc708ff2d8f    8f  c5f928eb             vmovapd xmm5,xmm3
0xc708ff2d93    93  c5f82edb             vucomiss xmm3,xmm3
0xc708ff2d97    97  7a06                 jpe 0xc708ff2d9f  <+0x9f>
0xc708ff2d99    99  0f8404000000         jz 0xc708ff2da3  <+0xa3>
0xc708ff2d9f    9f  c5f928dd             vmovapd xmm3,xmm5
0xc708ff2da3    a3  c5f82eeb             vucomiss xmm5,xmm3
0xc708ff2da7    a7  0f8704000000         ja 0xc708ff2db1  <+0xb1>
0xc708ff2dad    ad  c5f928eb             vmovapd xmm5,xmm3
0xc708ff2db1    b1  c5f82eed             vucomiss xmm5,xmm5
0xc708ff2db5    b5  7a06                 jpe 0xc708ff2dbd  <+0xbd>
0xc708ff2db7    b7  0f8409000000         jz 0xc708ff2dc6  <+0xc6>
0xc708ff2dbd    bd  c5f928dc             vmovapd xmm3,xmm4
0xc708ff2dc1    c1  e904000000           jmp 0xc708ff2dca  <+0xca>
0xc708ff2dc6    c6  c5f928dd             vmovapd xmm3,xmm5
0xc708ff2dca    ca  c5f82ee4             vucomiss xmm4,xmm4
0xc708ff2dce    ce  7a06                 jpe 0xc708ff2dd6  <+0xd6>
0xc708ff2dd0    d0  0f8404000000         jz 0xc708ff2dda  <+0xda>
0xc708ff2dd6    d6  c5f928e3             vmovapd xmm4,xmm3
0xc708ff2dda    da  c5f82edc             vucomiss xmm3,xmm4
0xc708ff2dde    de  0f8704000000         ja 0xc708ff2de8  <+0xe8>
0xc708ff2de4    e4  c5f928dc             vmovapd xmm3,xmm4
0xc708ff2de8    e8  41ba0020803f         movl r10,0x3f802000
0xc708ff2dee    ee  c4c1796ee2           vmovd xmm4,r10
0xc708ff2df3    f3  c5da59db             vmulss xmm3,xmm4,xmm3
0xc708ff2df7    f7  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0xc708ff2dfb    fb  c5d972f419           vpslld xmm4,xmm4,25
0xc708ff2e00   100  c5d972d402           vpsrld xmm4,xmm4,2
0xc708ff2e05   105  c5da5edb             vdivss xmm3,xmm4,xmm3
0xc708ff2e09   109  c5f828db             vmovaps xmm3,xmm3
0xc708ff2e0d   10d  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0xc708ff2e17   117  c4e27918db           vbroadcastss xmm3,xmm3
0xc708ff2e1c   11c  c5f859c3             vmulps xmm0,xmm0,xmm3
0xc708ff2e20   120  c4e37908c00a         vroundps xmm0,xmm0,0xa
0xc708ff2e26   126  c5f828d8             vmovaps xmm3,xmm0
0xc708ff2e2a   12a  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0xc708ff2e2e   12e  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0xc708ff2e34   134  c57b2ce6             vcvttsd2si r12,xmm6
0xc708ff2e38   138  4585e4               testl r12,r12
0xc708ff2e3b   13b  0f892a000000         jns 0xc708ff2e6b  <+0x16b>
0xc708ff2e41   141  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0xc708ff2e4b   14b  c441f96efa           vmovq xmm15,r10
0xc708ff2e50   150  c50358fe             vaddsd xmm15,xmm15,xmm6
0xc708ff2e54   154  c4417b2ce7           vcvttsd2si r12,xmm15
0xc708ff2e59   159  4585e4               testl r12,r12
0xc708ff2e5c   15c  0f8809000000         js 0xc708ff2e6b  <+0x16b>
0xc708ff2e62   162  41ba00000080         movl r10,0x80000000
0xc708ff2e68   168  450be2               orl r12,r10
0xc708ff2e6b   16b  4589e2               movl r10,r12
0xc708ff2e6e   16e  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0xc708ff2e73   173  c5f92efe             vucomisd xmm7,xmm6
0xc708ff2e77   177  0f8a06110000         jpe 0xc708ff3f83  <+0x1283>
0xc708ff2e7d   17d  0f8500110000         jnz 0xc708ff3f83  <+0x1283>
0xc708ff2e83   183  c4c1796edc           vmovd xmm3,r12
0xc708ff2e88   188  c5f970db00           vpshufd xmm3,xmm3,0x0
0xc708ff2e8d   18d  c5fa16e8             vmovshdup xmm5,xmm0
0xc708ff2e91   191  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0xc708ff2e95   195  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0xc708ff2e9b   19b  c57b2ce7             vcvttsd2si r12,xmm7
0xc708ff2e9f   19f  4585e4               testl r12,r12
0xc708ff2ea2   1a2  0f8927000000         jns 0xc708ff2ecf  <+0x1cf>
0xc708ff2ea8   1a8  4c8b1594ffffff       REX.W movq r10,[rip+0xffffff94]
0xc708ff2eaf   1af  c441f96efa           vmovq xmm15,r10
0xc708ff2eb4   1b4  c50358ff             vaddsd xmm15,xmm15,xmm7
0xc708ff2eb8   1b8  c4417b2ce7           vcvttsd2si r12,xmm15
0xc708ff2ebd   1bd  4585e4               testl r12,r12
0xc708ff2ec0   1c0  0f8809000000         js 0xc708ff2ecf  <+0x1cf>
0xc708ff2ec6   1c6  41ba00000080         movl r10,0x80000000
0xc708ff2ecc   1cc  450be2               orl r12,r10
0xc708ff2ecf   1cf  4589e2               movl r10,r12
0xc708ff2ed2   1d2  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0xc708ff2ed7   1d7  c5792ec7             vucomisd xmm8,xmm7
0xc708ff2edb   1db  0f8ad8100000         jpe 0xc708ff3fb9  <+0x12b9>
0xc708ff2ee1   1e1  0f85d2100000         jnz 0xc708ff3fb9  <+0x12b9>
0xc708ff2ee7   1e7  c4c36122dc01         vpinsrd xmm3,xmm3,r12,0x1
0xc708ff2eed   1ed  49ba0100000001000000 REX.W movq r10,0x100000001
0xc708ff2ef7   1f7  c4c1f96eea           vmovq xmm5,r10
0xc708ff2efc   1fc  c5d16ced             vpunpcklqdq xmm5,xmm5,xmm5
0xc708ff2f00   200  c4e2613fdd           vpmaxud xmm3,xmm3,xmm5
0xc708ff2f05   205  c5c9eff6             vpxor xmm6,xmm6,xmm6
0xc708ff2f09   209  c5c8c2f802           vcmpps xmm7,xmm6,xmm0, (le)
0xc708ff2f0e   20e  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0xc708ff2f18   218  c441f96ec2           vmovq xmm8,r10
0xc708ff2f1d   21d  c441396cc0           vpunpcklqdq xmm8,xmm8,xmm8
0xc708ff2f22   222  c4c178c2c001         vcmpps xmm0,xmm0,xmm8, (lt)
0xc708ff2f28   228  c5c1dbc0             vpand xmm0,xmm7,xmm0
0xc708ff2f2c   22c  c579dffd             vpandn xmm15,xmm0,xmm5
0xc708ff2f30   230  c5e1dbc0             vpand xmm0,xmm3,xmm0
0xc708ff2f34   234  c4c179ebc7           vpor xmm0,xmm0,xmm15
0xc708ff2f39   239  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0xc708ff2f40   240  c4817813041c         vmovlps [r12+r11*1],xmm0
0xc708ff2f46   246  468bbc1fcc000000     movl r15,[rdi+r11*1+0xcc]
0xc708ff2f4e   24e  44897c1f28           movl [rdi+rbx*1+0x28],r15
0xc708ff2f53   253  4e8bbc1fc4000000     REX.W movq r15,[rdi+r11*1+0xc4]
0xc708ff2f5b   25b  4c897c1f20           REX.W movq [rdi+rbx*1+0x20],r15
0xc708ff2f60   260  448d7860             leal r15,[rax+0x60]
0xc708ff2f64   264  428b541f04           movl rdx,[rdi+r11*1+0x4]
0xc708ff2f69   269  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0xc708ff2f6e   26e  468b741f10           movl r14,[rdi+r11*1+0x10]
0xc708ff2f73   273  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0xc708ff2f78   278  c5f811ad80feffff     vmovups [rbp-0x180],xmm5
0xc708ff2f80   280  c5f811b550feffff     vmovups [rbp-0x1b0],xmm6
0xc708ff2f88   288  c5781185b0feffff     vmovups [rbp-0x150],xmm8
0xc708ff2f90   290  4c8965c8             REX.W movq [rbp-0x38],r12
0xc708ff2f94   294  418bc7               movl rax,r15
0xc708ff2f97   297  418bde               movl rbx,r14
0xc708ff2f9a   29a  e859cdf1ff           call 0xc708f0fcf8  (jump table)
0xc708ff2f9f   29f  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0xc708ff2fa6   2a6  4c8b45d0             REX.W movq r8,[rbp-0x30]
0xc708ff2faa   2aa  468b5c0708           movl r11,[rdi+r8*1+0x8]
0xc708ff2faf   2af  4c895dd8             REX.W movq [rbp-0x28],r11
0xc708ff2fb3   2b3  4585db               testl r11,r11
0xc708ff2fb6   2b6  0f8513000000         jnz 0xc708ff2fcf  <+0x2cf>
0xc708ff2fbc   2bc  8b5de0               movl rbx,[rbp-0x20]
0xc708ff2fbf   2bf  8d7b50               leal rdi,[rbx+0x50]
0xc708ff2fc2   2c2  4c8b65e8             REX.W movq r12,[rbp-0x18]
0xc708ff2fc6   2c6  41893c24             movl [r12],rdi
0xc708ff2fca   2ca  488be5               REX.W movq rsp,rbp
0xc708ff2fcd   2cd  5d                   pop rbp
0xc708ff2fce   2ce  c3                   retl
0xc708ff2fcf   2cf  8b8528ffffff         movl rax,[rbp-0xd8]
0xc708ff2fd5   2d5  8d90a0000000         leal rdx,[rax+0xa0]
0xc708ff2fdb   2db  468b64075c           movl r12,[rdi+r8*1+0x5c]
0xc708ff2fe0   2e0  468b7c0750           movl r15,[rdi+r8*1+0x50]
0xc708ff2fe5   2e5  468b740744           movl r14,[rdi+r8*1+0x44]
0xc708ff2fea   2ea  428b5c0738           movl rbx,[rdi+r8*1+0x38]
0xc708ff2fef   2ef  8bcb                 movl rcx,rbx
0xc708ff2ff1   2f1  443bf3               cmpl r14,rbx
0xc708ff2ff4   2f4  410f42ce             cmovcl rcx,r14
0xc708ff2ff8   2f8  448bf1               movl r14,rcx
0xc708ff2ffb   2fb  443bf9               cmpl r15,rcx
0xc708ff2ffe   2fe  450f42f7             cmovcl r14,r15
0xc708ff3002   302  458bfe               movl r15,r14
0xc708ff3005   305  453be6               cmpl r12,r14
0xc708ff3008   308  450f42fc             cmovcl r15,r12
0xc708ff300c   30c  468b640714           movl r12,[rdi+r8*1+0x14]
0xc708ff3011   311  468b740720           movl r14,[rdi+r8*1+0x20]
0xc708ff3016   316  428b5c072c           movl rbx,[rdi+r8*1+0x2c]
0xc708ff301b   31b  8bcb                 movl rcx,rbx
0xc708ff301d   31d  443bf3               cmpl r14,rbx
0xc708ff3020   320  410f42ce             cmovcl rcx,r14
0xc708ff3024   324  448bf1               movl r14,rcx
0xc708ff3027   327  443be1               cmpl r12,rcx
0xc708ff302a   32a  450f42f4             cmovcl r14,r12
0xc708ff302e   32e  488b5dc8             REX.W movq rbx,[rbp-0x38]
0xc708ff3032   332  c4a17b100403         vmovsd xmm0,[rbx+r8*1]
0xc708ff3038   338  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xc708ff3040   340  c57970f800           vpshufd xmm15,xmm0,0x0
0xc708ff3045   345  c5f970e300           vpshufd xmm4,xmm3,0x0
0xc708ff304a   34a  c4c3590ee70c         vpblendw xmm4,xmm4,xmm15,0xc
0xc708ff3050   350  c4e2793fc3           vpmaxud xmm0,xmm0,xmm3
0xc708ff3055   355  c5f9fac3             vpsubd xmm0,xmm0,xmm3
0xc708ff3059   359  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0xc708ff305e   35e  428b74074c           movl rsi,[rdi+r8*1+0x4c]
0xc708ff3063   363  468b4c0740           movl r9,[rdi+r8*1+0x40]
0xc708ff3068   368  4c897da0             REX.W movq [rbp-0x60],r15
0xc708ff306c   36c  468b7c0734           movl r15,[rdi+r8*1+0x34]
0xc708ff3071   371  48895dc0             REX.W movq [rbp-0x40],rbx
0xc708ff3075   375  428b5c077c           movl rbx,[rdi+r8*1+0x7c]
0xc708ff307a   37a  48895598             REX.W movq [rbp-0x68],rdx
0xc708ff307e   37e  428b940780000000     movl rdx,[rdi+r8*1+0x80]
0xc708ff3086   386  488975b8             REX.W movq [rbp-0x48],rsi
0xc708ff308a   38a  428b740764           movl rsi,[rdi+r8*1+0x64]
0xc708ff308f   38f  4c894db0             REX.W movq [rbp-0x50],r9
0xc708ff3093   393  468b4c0768           movl r9,[rdi+r8*1+0x68]
0xc708ff3098   398  48898d38ffffff       REX.W movq [rbp-0xc8],rcx
0xc708ff309f   39f  428b8c0788000000     movl rcx,[rdi+r8*1+0x88]
0xc708ff30a7   3a7  c4a17a10ac0784000000 vmovss xmm5,[rdi+r8*1+0x84]
0xc708ff30b1   3b1  4c89a530ffffff       REX.W movq [rbp-0xd0],r12
0xc708ff30b8   3b8  468b64071c           movl r12,[rdi+r8*1+0x1c]
0xc708ff30bd   3bd  468b5c0728           movl r11,[rdi+r8*1+0x28]
0xc708ff30c2   3c2  4c89b590feffff       REX.W movq [rbp-0x170],r14
0xc708ff30c9   3c9  468b740710           movl r14,[rdi+r8*1+0x10]
0xc708ff30ce   3ce  4c899d78ffffff       REX.W movq [rbp-0x88],r11
0xc708ff30d5   3d5  468b5c0704           movl r11,[rdi+r8*1+0x4]
0xc708ff30da   3da  c4a17a10b407a0000000 vmovss xmm6,[rdi+r8*1+0xa0]
0xc708ff30e4   3e4  c5ca59f6             vmulss xmm6,xmm6,xmm6
0xc708ff30e8   3e8  c4a17a10bc07a4000000 vmovss xmm7,[rdi+r8*1+0xa4]
0xc708ff30f2   3f2  c5c259ff             vmulss xmm7,xmm7,xmm7
0xc708ff30f6   3f6  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0xc708ff30fe   3fe  c5f8118530feffff     vmovups [rbp-0x1d0],xmm0
0xc708ff3106   406  4c897da8             REX.W movq [rbp-0x58],r15
0xc708ff310a   40a  48899d20ffffff       REX.W movq [rbp-0xe0],rbx
0xc708ff3111   411  48899518ffffff       REX.W movq [rbp-0xe8],rdx
0xc708ff3118   418  4889b5d8feffff       REX.W movq [rbp-0x128],rsi
0xc708ff311f   41f  4c898dd0feffff       REX.W movq [rbp-0x130],r9
0xc708ff3126   426  48898da8feffff       REX.W movq [rbp-0x158],rcx
0xc708ff312d   42d  c5fb11ade0feffff     vmovsd [rbp-0x120],xmm5
0xc708ff3135   435  4c896580             REX.W movq [rbp-0x80],r12
0xc708ff3139   439  4c89b548ffffff       REX.W movq [rbp-0xb8],r14
0xc708ff3140   440  4c899d58ffffff       REX.W movq [rbp-0xa8],r11
0xc708ff3147   447  c5fb11b568ffffff     vmovsd [rbp-0x98],xmm6
0xc708ff314f   44f  c5fb11bd70ffffff     vmovsd [rbp-0x90],xmm7
0xc708ff3157   457  418bc9               movl rcx,r9
0xc708ff315a   45a  458bfb               movl r15,r11
0xc708ff315d   45d  4c8bdf               REX.W movq r11,rdi
0xc708ff3160   460  33ff                 xorl rdi,rdi
0xc708ff3162   462  448b4dd8             movl r9,[rbp-0x28]
0xc708ff3166   466  4489e3               movl rbx,r12
0xc708ff3169   469  48897dc8             REX.W movq [rbp-0x38],rdi
0xc708ff316d   46d  e967000000           jmp 0xc708ff31d9  <+0x4d9>
0xc708ff3172   472  660f1f840000000000   nop
0xc708ff317b   47b  0f1f440000           nop
0xc708ff3180   480  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0xc708ff3188   488  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xc708ff3190   490  8b8528ffffff         movl rax,[rbp-0xd8]
0xc708ff3196   496  458bcb               movl r9,r11
0xc708ff3199   499  4d8bde               REX.W movq r11,r14
0xc708ff319c   49c  8b5d80               movl rbx,[rbp-0x80]
0xc708ff319f   49f  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0xc708ff31a7   4a7  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0xc708ff31af   4af  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff31b7   4b7  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff31bf   4bf  448bbd58ffffff       movl r15,[rbp-0xa8]
0xc708ff31c6   4c6  448bb548ffffff       movl r14,[rbp-0xb8]
0xc708ff31cd   4cd  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff31d3   4d3  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff31d9   4d9  8b9578ffffff         movl rdx,[rbp-0x88]
0xc708ff31df   4df  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff31e4   4e4  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0xc708ff31ec   4ec  448ba590feffff       movl r12,[rbp-0x170]
0xc708ff31f3   4f3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff31f7   4f7  0f86e30d0000         jna 0xc708ff3fe0  <+0x12e0>
0xc708ff31fd   4fd  443be7               cmpl r12,rdi
0xc708ff3200   500  0f86320d0000         jna 0xc708ff3f38  <+0x1238>
0xc708ff3206   506  458d04bf             leal r8,[r15+rdi*4]
0xc708ff320a   50a  c4017a101403         vmovss xmm10,[r11+r8*1]
0xc708ff3210   510  458d04be             leal r8,[r14+rdi*4]
0xc708ff3214   514  c4017a101c03         vmovss xmm11,[r11+r8*1]
0xc708ff321a   51a  448d04bb             leal r8,[rbx+rdi*4]
0xc708ff321e   51e  c4017a102403         vmovss xmm12,[r11+r8*1]
0xc708ff3224   524  448d04ba             leal r8,[rdx+rdi*4]
0xc708ff3228   528  c4017a102c03         vmovss xmm13,[r11+r8*1]
0xc708ff322e   52e  448b65e0             movl r12,[rbp-0x20]
0xc708ff3232   532  c4017a116c230c       vmovss [r11+r12*1+0xc],xmm13
0xc708ff3239   539  c4017a11642308       vmovss [r11+r12*1+0x8],xmm12
0xc708ff3240   540  c4017a115c2304       vmovss [r11+r12*1+0x4],xmm11
0xc708ff3247   547  c4017a111423         vmovss [r11+r12*1],xmm10
0xc708ff324d   54d  43c744234800000000   movl [r11+r12*1+0x48],0x0
0xc708ff3256   556  4bc744234000000000   REX.W movq [r11+r12*1+0x40],0x0
0xc708ff325f   55f  c44119efe4           vpxor xmm12,xmm12,xmm12
0xc708ff3264   564  c4017a7f642330       vmovdqu [r11+r12*1+0x30],xmm12
0xc708ff326b   56b  c52a59e5             vmulss xmm12,xmm10,xmm5
0xc708ff326f   56f  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0xc708ff3275   575  48897dd0             REX.W movq [rbp-0x30],rdi
0xc708ff3279   579  4c899de8feffff       REX.W movq [rbp-0x118],r11
0xc708ff3280   580  c441782ee4           vucomiss xmm12,xmm12
0xc708ff3285   585  7a06                 jpe 0xc708ff328d  <+0x58d>
0xc708ff3287   587  0f8405000000         jz 0xc708ff3292  <+0x592>
0xc708ff328d   58d  c4417928e0           vmovapd xmm12,xmm8
0xc708ff3292   592  c441782ee0           vucomiss xmm12,xmm8
0xc708ff3297   597  0f8705000000         ja 0xc708ff32a2  <+0x5a2>
0xc708ff329d   59d  c4417928e0           vmovapd xmm12,xmm8
0xc708ff32a2   5a2  c4427918ec           vbroadcastss xmm13,xmm12
0xc708ff32a7   5a7  c4415259f3           vmulss xmm14,xmm5,xmm11
0xc708ff32ac   5ac  c443090af609         vroundss xmm14,xmm14,xmm14,0x9
0xc708ff32b2   5b2  c441782ef6           vucomiss xmm14,xmm14
0xc708ff32b7   5b7  7a06                 jpe 0xc708ff32bf  <+0x5bf>
0xc708ff32b9   5b9  0f8405000000         jz 0xc708ff32c4  <+0x5c4>
0xc708ff32bf   5bf  c4417928f0           vmovapd xmm14,xmm8
0xc708ff32c4   5c4  c441782ef0           vucomiss xmm14,xmm8
0xc708ff32c9   5c9  0f870a000000         ja 0xc708ff32d9  <+0x5d9>
0xc708ff32cf   5cf  c4c17928c8           vmovapd xmm1,xmm8
0xc708ff32d4   5d4  e905000000           jmp 0xc708ff32de  <+0x5de>
0xc708ff32d9   5d9  c4c17928ce           vmovapd xmm1,xmm14
0xc708ff32de   5de  c441797ef0           vmovd r8,xmm14
0xc708ff32e3   5e3  4585c0               testl r8,r8
0xc708ff32e6   5e6  0f8404000000         jz 0xc708ff32f0  <+0x5f0>
0xc708ff32ec   5ec  c57928f1             vmovapd xmm14,xmm1
0xc708ff32f0   5f0  c5782ec1             vucomiss xmm8,xmm1
0xc708ff32f4   5f4  7a06                 jpe 0xc708ff32fc  <+0x5fc>
0xc708ff32f6   5f6  0f8404000000         jz 0xc708ff3300  <+0x600>
0xc708ff32fc   5fc  c57928f1             vmovapd xmm14,xmm1
0xc708ff3300   600  c4431121ee10         vinsertps xmm13,xmm13,xmm14,0x10
0xc708ff3306   606  c44110c2e901         vcmpps xmm13,xmm13,xmm9, (lt)
0xc708ff330c   60c  c5f96ec8             vmovd xmm1,rax
0xc708ff3310   610  c5f970c900           vpshufd xmm1,xmm1,0x0
0xc708ff3315   615  c4c11a5ad4           vcvtss2sd xmm2,xmm12,xmm12
0xc708ff331a   61a  c4e3510bea0b         vroundsd xmm5,xmm5,xmm2,0xb
0xc708ff3320   620  c57b2cc5             vcvttsd2si r8,xmm5
0xc708ff3324   624  4585c0               testl r8,r8
0xc708ff3327   627  0f8927000000         jns 0xc708ff3354  <+0x654>
0xc708ff332d   62d  4c8b150ffbffff       REX.W movq r10,[rip+0xfffffb0f]
0xc708ff3334   634  c441f96efa           vmovq xmm15,r10
0xc708ff3339   639  c50358fd             vaddsd xmm15,xmm15,xmm5
0xc708ff333d   63d  c4417b2cc7           vcvttsd2si r8,xmm15
0xc708ff3342   642  4585c0               testl r8,r8
0xc708ff3345   645  0f8809000000         js 0xc708ff3354  <+0x654>
0xc708ff334b   64b  41ba00000080         movl r10,0x80000000
0xc708ff3351   651  450bc2               orl r8,r10
0xc708ff3354   654  458bd0               movl r10,r8
0xc708ff3357   657  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0xc708ff335c   65c  c5792ecd             vucomisd xmm9,xmm5
0xc708ff3360   660  0f8a110d0000         jpe 0xc708ff4077  <+0x1377>
0xc708ff3366   666  0f850b0d0000         jnz 0xc708ff4077  <+0x1377>
0xc708ff336c   66c  c4c37122e800         vpinsrd xmm5,xmm1,r8,0x0
0xc708ff3372   672  c4410a5ace           vcvtss2sd xmm9,xmm14,xmm14
0xc708ff3377   677  c443190be10b         vroundsd xmm12,xmm12,xmm9,0xb
0xc708ff337d   67d  c4417b2cc4           vcvttsd2si r8,xmm12
0xc708ff3382   682  4585c0               testl r8,r8
0xc708ff3385   685  0f8928000000         jns 0xc708ff33b3  <+0x6b3>
0xc708ff338b   68b  4c8b15b1faffff       REX.W movq r10,[rip+0xfffffab1]
0xc708ff3392   692  c441f96efa           vmovq xmm15,r10
0xc708ff3397   697  c4410358fc           vaddsd xmm15,xmm15,xmm12
0xc708ff339c   69c  c4417b2cc7           vcvttsd2si r8,xmm15
0xc708ff33a1   6a1  4585c0               testl r8,r8
0xc708ff33a4   6a4  0f8809000000         js 0xc708ff33b3  <+0x6b3>
0xc708ff33aa   6aa  41ba00000080         movl r10,0x80000000
0xc708ff33b0   6b0  450bc2               orl r8,r10
0xc708ff33b3   6b3  458bd0               movl r10,r8
0xc708ff33b6   6b6  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0xc708ff33bb   6bb  c4c1792ecc           vucomisd xmm1,xmm12
0xc708ff33c0   6c0  0f8ad50c0000         jpe 0xc708ff409b  <+0x139b>
0xc708ff33c6   6c6  0f85cf0c0000         jnz 0xc708ff409b  <+0x139b>
0xc708ff33cc   6cc  c4c35122e801         vpinsrd xmm5,xmm5,r8,0x1
0xc708ff33d2   6d2  c4e2793bed           vpminud xmm5,xmm0,xmm5
0xc708ff33d7   6d7  c591dbed             vpand xmm5,xmm13,xmm5
0xc708ff33db   6db  c551fecb             vpaddd xmm9,xmm5,xmm3
0xc708ff33df   6df  c442793bc9           vpminud xmm9,xmm0,xmm9
0xc708ff33e4   6e4  c4425940e1           vpmulld xmm12,xmm4,xmm9
0xc708ff33e9   6e9  c4437916e001         vpextrd r8,xmm12,0x1
0xc708ff33ef   6ef  c5f97ee8             vmovd rax,xmm5
0xc708ff33f3   6f3  4533db               xorl r11,r11
0xc708ff33f6   6f6  85c0                 testl rax,rax
0xc708ff33f8   6f8  410f95c3             setnzl r11l
0xc708ff33fc   6fc  412bc3               subl rax,r11
0xc708ff33ff   6ff  468d1c00             leal r11,[rax+r8*1]
0xc708ff3403   703  4531e4               xorl r12,r12
0xc708ff3406   706  443bd9               cmpl r11,rcx
0xc708ff3409   709  410f92c4             setcl r12l
0xc708ff340d   70d  c44159fee1           vpaddd xmm12,xmm4,xmm9
0xc708ff3412   712  c5797ee3             vmovd rbx,xmm12
0xc708ff3416   716  4403c3               addl r8,rbx
0xc708ff3419   719  33d2                 xorl rdx,rdx
0xc708ff341b   71b  443bc1               cmpl r8,rcx
0xc708ff341e   71e  0f92c2               setcl dl
0xc708ff3421   721  4421e2               andl rdx,r12
0xc708ff3424   724  c4c37916ec01         vpextrd r12,xmm5,0x1
0xc708ff342a   72a  48899500ffffff       REX.W movq [rbp-0x100],rdx
0xc708ff3431   731  33d2                 xorl rdx,rdx
0xc708ff3433   733  4585e4               testl r12,r12
0xc708ff3436   736  0f95c2               setnzl dl
0xc708ff3439   739  442be2               subl r12,rdx
0xc708ff343c   73c  468d0486             leal r8,[rsi+r8*4]
0xc708ff3440   740  468d1c9e             leal r11,[rsi+r11*4]
0xc708ff3444   744  c4637916ca01         vpextrd rdx,xmm9,0x1
0xc708ff344a   74a  488985c0feffff       REX.W movq [rbp-0x140],rax
0xc708ff3451   751  48899dc8feffff       REX.W movq [rbp-0x138],rbx
0xc708ff3458   758  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0xc708ff345f   75f  4c899d10ffffff       REX.W movq [rbp-0xf0],r11
0xc708ff3466   766  488995f8feffff       REX.W movq [rbp-0x108],rdx
0xc708ff346d   76d  c4c17928e8           vmovapd xmm5,xmm8
0xc708ff3472   772  4c89a598feffff       REX.W movq [rbp-0x168],r12
0xc708ff3479   779  448b8530ffffff       movl r8,[rbp-0xd0]
0xc708ff3480   780  4533db               xorl r11,r11
0xc708ff3483   783  c4417928c8           vmovapd xmm9,xmm8
0xc708ff3488   788  c4417928e0           vmovapd xmm12,xmm8
0xc708ff348d   78d  c57810ad50feffff     vmovups xmm13,[rbp-0x1b0]
0xc708ff3495   795  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff349c   79c  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0xc708ff34a3   7a3  e978000000           jmp 0xc708ff3520  <+0x820>
0xc708ff34a8   7a8  660f1f840000000000   nop
0xc708ff34b1   7b1  660f1f840000000000   nop
0xc708ff34ba   7ba  660f1f440000         nop
0xc708ff34c0   7c0  c5d258eb             vaddss xmm5,xmm5,xmm3
0xc708ff34c4   7c4  c4c17a116c3c40       vmovss [r12+rdi*1+0x40],xmm5
0xc708ff34cb   7cb  8b8d78ffffff         movl rcx,[rbp-0x88]
0xc708ff34d1   7d1  468d0cb9             leal r9,[rcx+r15*4]
0xc708ff34d5   7d5  8b7580               movl rsi,[rbp-0x80]
0xc708ff34d8   7d8  468d3cbe             leal r15,[rsi+r15*4]
0xc708ff34dc   7dc  c4e27918e4           vbroadcastss xmm4,xmm4
0xc708ff34e1   7e1  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0xc708ff34e7   7e7  c4835922043c02       vpinsrd xmm0,xmm4,[r12+r15*1],0x2
0xc708ff34ee   7ee  c4837922040c03       vpinsrd xmm0,xmm0,[r12+r9*1],0x3
0xc708ff34f5   7f5  c4e27918db           vbroadcastss xmm3,xmm3
0xc708ff34fa   7fa  c5f859c3             vmulps xmm0,xmm0,xmm3
0xc708ff34fe   7fe  c51058e8             vaddps xmm13,xmm13,xmm0
0xc708ff3502   802  c4417a7f6c3c30       vmovdqu [r12+rdi*1+0x30],xmm13
0xc708ff3509   809  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff350d   80d  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff3513   813  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff3519   819  448b4dd8             movl r9,[rbp-0x28]
0xc708ff351d   81d  458bde               movl r11,r14
0xc708ff3520   820  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff3524   824  0f86960b0000         jna 0xc708ff40c0  <+0x13c0>
0xc708ff352a   82a  4585db               testl r11,r11
0xc708ff352d   82d  0f841a000000         jz 0xc708ff354d  <+0x84d>
0xc708ff3533   833  443b5dc8             cmpl r11,[rbp-0x38]
0xc708ff3537   837  0f8410000000         jz 0xc708ff354d  <+0x84d>
0xc708ff353d   83d  48c78528ffffff00000000 REX.W movq [rbp-0xd8],0x0
0xc708ff3548   848  e90b000000           jmp 0xc708ff3558  <+0x858>
0xc708ff354d   84d  48c78528ffffff01000000 REX.W movq [rbp-0xd8],0x1
0xc708ff3558   858  458bfb               movl r15,r11
0xc708ff355b   85b  448b5dc8             movl r11,[rbp-0x38]
0xc708ff355f   85f  e951000000           jmp 0xc708ff35b5  <+0x8b5>
0xc708ff3564   864  660f1f840000000000   nop
0xc708ff356d   86d  660f1f840000000000   nop
0xc708ff3576   876  660f1f840000000000   nop
0xc708ff357f   87f  90                   nop
0xc708ff3580   880  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0xc708ff3587   887  458bd8               movl r11,r8
0xc708ff358a   88a  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xc708ff3591   891  448bf8               movl r15,rax
0xc708ff3594   894  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff359a   89a  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff35a0   8a0  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff35a6   8a6  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff35ac   8ac  448bc2               movl r8,rdx
0xc708ff35af   8af  8b95f8feffff         movl rdx,[rbp-0x108]
0xc708ff35b5   8b5  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff35b9   8b9  0f86c50b0000         jna 0xc708ff4184  <+0x1484>
0xc708ff35bf   8bf  83bd28ffffff00       cmpl [rbp-0xd8],0x0
0xc708ff35c6   8c6  0f8590000000         jnz 0xc708ff365c  <+0x95c>
0xc708ff35cc   8cc  458d7704             leal r14,[r15+0x4]
0xc708ff35d0   8d0  478b3c3c             movl r15,[r12+r15*1]
0xc708ff35d4   8d4  443b7dd0             cmpl r15,[rbp-0x30]
0xc708ff35d8   8d8  0f841f000000         jz 0xc708ff35fd  <+0x8fd>
0xc708ff35de   8de  453bcf               cmpl r9,r15
0xc708ff35e1   8e1  0f8616000000         jna 0xc708ff35fd  <+0x8fd>
0xc708ff35e7   8e7  453bc7               cmpl r8,r15
0xc708ff35ea   8ea  0f860d000000         jna 0xc708ff35fd  <+0x8fd>
0xc708ff35f0   8f0  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xc708ff35f7   8f7  0f8222070000         jc 0xc708ff3d1f  <+0x101f>
0xc708ff35fd   8fd  453bf3               cmpl r14,r11
0xc708ff3600   900  0f8428000000         jz 0xc708ff362e  <+0x92e>
0xc708ff3606   906  418bd0               movl rdx,r8
0xc708ff3609   909  458bc3               movl r8,r11
0xc708ff360c   90c  418bc6               movl rax,r14
0xc708ff360f   90f  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff3616   916  448b9d40ffffff       movl r11,[rbp-0xc0]
0xc708ff361d   91d  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xc708ff3623   923  8b5d80               movl rbx,[rbp-0x80]
0xc708ff3626   926  8b7de0               movl rdi,[rbp-0x20]
0xc708ff3629   929  e9e9060000           jmp 0xc708ff3d17  <+0x1017>
0xc708ff362e   92e  41bf01000000         movl r15,0x1
0xc708ff3634   934  418bd0               movl rdx,r8
0xc708ff3637   937  458bc3               movl r8,r11
0xc708ff363a   93a  448b9d40ffffff       movl r11,[rbp-0xc0]
0xc708ff3641   941  418bc6               movl rax,r14
0xc708ff3644   944  8b7de0               movl rdi,[rbp-0x20]
0xc708ff3647   947  8b5d80               movl rbx,[rbp-0x80]
0xc708ff364a   94a  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xc708ff3650   950  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff3657   957  e924ffffff           jmp 0xc708ff3580  <+0x880>
0xc708ff365c   95c  f68540ffffffff       testb [rbp-0xc0],0xff
0xc708ff3663   963  0f85f9070000         jnz 0xc708ff3e62  <+0x1162>
0xc708ff3669   969  3b9598feffff         cmpl rdx,[rbp-0x168]
0xc708ff366f   96f  0f82c0070000         jc 0xc708ff3e35  <+0x1135>
0xc708ff3675   975  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff367c   97c  448b8520ffffff       movl r8,[rbp-0xe0]
0xc708ff3683   983  e952000000           jmp 0xc708ff36da  <+0x9da>
0xc708ff3688   988  660f1f840000000000   nop
0xc708ff3691   991  660f1f840000000000   nop
0xc708ff369a   99a  660f1f840000000000   nop
0xc708ff36a3   9a3  660f1f840000000000   nop
0xc708ff36ac   9ac  660f1f840000000000   nop
0xc708ff36b5   9b5  660f1f840000000000   nop
0xc708ff36be   9be  6690                 nop
0xc708ff36c0   9c0  8bd0                 movl rdx,rax
0xc708ff36c2   9c2  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff36c8   9c8  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff36ce   9ce  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff36d4   9d4  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff36da   9da  448bbd98feffff       movl r15,[rbp-0x168]
0xc708ff36e1   9e1  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff36e5   9e5  0f86650b0000         jna 0xc708ff4250  <+0x1550>
0xc708ff36eb   9eb  413bd7               cmpl rdx,r15
0xc708ff36ee   9ee  0f862c030000         jna 0xc708ff3a20  <+0xd20>
0xc708ff36f4   9f4  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff36f8   9f8  8b9530ffffff         movl rdx,[rbp-0xd0]
0xc708ff36fe   9fe  6690                 nop
0xc708ff3700   a00  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff3704   a04  0f86190c0000         jna 0xc708ff4323  <+0x1623>
0xc708ff370a   a0a  458d5f01             leal r11,[r15+0x1]
0xc708ff370e   a0e  4c899d98feffff       REX.W movq [rbp-0x168],r11
0xc708ff3715   a15  448b9da8feffff       movl r11,[rbp-0x158]
0xc708ff371c   a1c  450fafdf             imull r11,r15
0xc708ff3720   a20  468d3c18             leal r15,[rax+r11*1]
0xc708ff3724   a24  413bcf               cmpl rcx,r15
0xc708ff3727   a27  0f8654010000         jna 0xc708ff3881  <+0xb81>
0xc708ff372d   a2d  4403db               addl r11,rbx
0xc708ff3730   a30  413bcb               cmpl rcx,r11
0xc708ff3733   a33  0f8648010000         jna 0xc708ff3881  <+0xb81>
0xc708ff3739   a39  468d1c9e             leal r11,[rsi+r11*4]
0xc708ff373d   a3d  478b1c1c             movl r11,[r12+r11*1]
0xc708ff3741   a41  468d3cbe             leal r15,[rsi+r15*4]
0xc708ff3745   a45  478b3c3c             movl r15,[r12+r15*1]
0xc708ff3749   a49  453bdf               cmpl r11,r15
0xc708ff374c   a4c  0f822f010000         jc 0xc708ff3881  <+0xb81>
0xc708ff3752   a52  453bf3               cmpl r14,r11
0xc708ff3755   a55  0f8226010000         jc 0xc708ff3881  <+0xb81>
0xc708ff375b   a5b  453bdf               cmpl r11,r15
0xc708ff375e   a5e  0f841d010000         jz 0xc708ff3881  <+0xb81>
0xc708ff3764   a64  438d0cb8             leal rcx,[r8+r15*4]
0xc708ff3768   a68  452bdf               subl r11,r15
0xc708ff376b   a6b  468d3c9d00000000     leal r15,[r11*4+0x0]
0xc708ff3773   a73  468d1c99             leal r11,[rcx+r11*4]
0xc708ff3777   a77  660f1f840000000000   nop
0xc708ff3780   a80  8d7104               leal rsi,[rcx+0x4]
0xc708ff3783   a83  418b040c             movl rax,[r12+rcx*1]
0xc708ff3787   a87  3b45d0               cmpl rax,[rbp-0x30]
0xc708ff378a   a8a  0f841d000000         jz 0xc708ff37ad  <+0xaad>
0xc708ff3790   a90  443bc8               cmpl r9,rax
0xc708ff3793   a93  0f8614000000         jna 0xc708ff37ad  <+0xaad>
0xc708ff3799   a99  3bd0                 cmpl rdx,rax
0xc708ff379b   a9b  0f860c000000         jna 0xc708ff37ad  <+0xaad>
0xc708ff37a1   aa1  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xc708ff37a7   aa7  0f82ed000000         jc 0xc708ff389a  <+0xb9a>
0xc708ff37ad   aad  4183c7fc             addl r15,0xfc
0xc708ff37b1   ab1  0f84af000000         jz 0xc708ff3866  <+0xb66>
0xc708ff37b7   ab7  8d4108               leal rax,[rcx+0x8]
0xc708ff37ba   aba  418b3434             movl rsi,[r12+rsi*1]
0xc708ff37be   abe  3b75d0               cmpl rsi,[rbp-0x30]
0xc708ff37c1   ac1  0f841d000000         jz 0xc708ff37e4  <+0xae4>
0xc708ff37c7   ac7  443bce               cmpl r9,rsi
0xc708ff37ca   aca  0f8614000000         jna 0xc708ff37e4  <+0xae4>
0xc708ff37d0   ad0  3bd6                 cmpl rdx,rsi
0xc708ff37d2   ad2  0f860c000000         jna 0xc708ff37e4  <+0xae4>
0xc708ff37d8   ad8  3bb538ffffff         cmpl rsi,[rbp-0xc8]
0xc708ff37de   ade  0f82c8000000         jc 0xc708ff38ac  <+0xbac>
0xc708ff37e4   ae4  4183c7fc             addl r15,0xfc
0xc708ff37e8   ae8  0f847a000000         jz 0xc708ff3868  <+0xb68>
0xc708ff37ee   aee  8d710c               leal rsi,[rcx+0xc]
0xc708ff37f1   af1  418b0404             movl rax,[r12+rax*1]
0xc708ff37f5   af5  3b45d0               cmpl rax,[rbp-0x30]
0xc708ff37f8   af8  0f841d000000         jz 0xc708ff381b  <+0xb1b>
0xc708ff37fe   afe  443bc8               cmpl r9,rax
0xc708ff3801   b01  0f8614000000         jna 0xc708ff381b  <+0xb1b>
0xc708ff3807   b07  3bd0                 cmpl rdx,rax
0xc708ff3809   b09  0f860c000000         jna 0xc708ff381b  <+0xb1b>
0xc708ff380f   b0f  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xc708ff3815   b15  0f82a7000000         jc 0xc708ff38c2  <+0xbc2>
0xc708ff381b   b1b  4183c7fc             addl r15,0xfc
0xc708ff381f   b1f  0f8441000000         jz 0xc708ff3866  <+0xb66>
0xc708ff3825   b25  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff3829   b29  0f86bf0b0000         jna 0xc708ff43ee  <+0x16ee>
0xc708ff382f   b2f  83c110               addl rcx,0x10
0xc708ff3832   b32  418b0434             movl rax,[r12+rsi*1]
0xc708ff3836   b36  3b45d0               cmpl rax,[rbp-0x30]
0xc708ff3839   b39  0f841d000000         jz 0xc708ff385c  <+0xb5c>
0xc708ff383f   b3f  443bc8               cmpl r9,rax
0xc708ff3842   b42  0f8614000000         jna 0xc708ff385c  <+0xb5c>
0xc708ff3848   b48  3bd0                 cmpl rdx,rax
0xc708ff384a   b4a  0f860c000000         jna 0xc708ff385c  <+0xb5c>
0xc708ff3850   b50  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xc708ff3856   b56  0f825d000000         jc 0xc708ff38b9  <+0xbb9>
0xc708ff385c   b5c  4183c7fc             addl r15,0xfc
0xc708ff3860   b60  0f851affffff         jnz 0xc708ff3780  <+0xa80>
0xc708ff3866   b66  8bf0                 movl rsi,rax
0xc708ff3868   b68  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff386c   b6c  448bde               movl r11,rsi
0xc708ff386f   b6f  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff3875   b75  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff387b   b7b  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff3881   b81  448bbd98feffff       movl r15,[rbp-0x168]
0xc708ff3888   b88  443bbdf8feffff       cmpl r15,[rbp-0x108]
0xc708ff388f   b8f  0f8472010000         jz 0xc708ff3a07  <+0xd07>
0xc708ff3895   b95  e966feffff           jmp 0xc708ff3700  <+0xa00>
0xc708ff389a   b9a  448bbdd8feffff       movl r15,[rbp-0x128]
0xc708ff38a1   ba1  8b8dc0feffff         movl rcx,[rbp-0x140]
0xc708ff38a7   ba7  e916000000           jmp 0xc708ff38c2  <+0xbc2>
0xc708ff38ac   bac  448bd6               movl r10,rsi
0xc708ff38af   baf  8bf0                 movl rsi,rax
0xc708ff38b1   bb1  418bc2               movl rax,r10
0xc708ff38b4   bb4  e909000000           jmp 0xc708ff38c2  <+0xbc2>
0xc708ff38b9   bb9  8bf1                 movl rsi,rcx
0xc708ff38bb   bbb  448bbdc0feffff       movl r15,[rbp-0x140]
0xc708ff38c2   bc2  448d3c8500000000     leal r15,[rax*4+0x0]
0xc708ff38ca   bca  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xc708ff38d1   bd1  8b8d58ffffff         movl rcx,[rbp-0xa8]
0xc708ff38d7   bd7  448d3c81             leal r15,[rcx+rax*4]
0xc708ff38db   bdb  c4017a10343c         vmovss xmm14,[r12+r15*1]
0xc708ff38e1   be1  c4c12a5cce           vsubss xmm1,xmm10,xmm14
0xc708ff38e6   be6  c5f259d1             vmulss xmm2,xmm1,xmm1
0xc708ff38ea   bea  448bbd48ffffff       movl r15,[rbp-0xb8]
0xc708ff38f1   bf1  418d1c87             leal rbx,[r15+rax*4]
0xc708ff38f5   bf5  c4c17a10041c         vmovss xmm0,[r12+rbx*1]
0xc708ff38fb   bfb  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xc708ff38ff   bff  c5e259e3             vmulss xmm4,xmm3,xmm3
0xc708ff3903   c03  c5da58e2             vaddss xmm4,xmm4,xmm2
0xc708ff3907   c07  c5f82ef4             vucomiss xmm6,xmm4
0xc708ff390b   c0b  0f870a000000         ja 0xc708ff391b  <+0xc1b>
0xc708ff3911   c11  c4c17928d0           vmovapd xmm2,xmm8
0xc708ff3916   c16  e90e000000           jmp 0xc708ff3929  <+0xc29>
0xc708ff391b   c1b  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0xc708ff391f   c1f  c5e972f219           vpslld xmm2,xmm2,25
0xc708ff3924   c24  c5e972d202           vpsrld xmm2,xmm2,2
0xc708ff3929   c29  c5f82ee7             vucomiss xmm4,xmm7
0xc708ff392d   c2d  0f8305000000         jnc 0xc708ff3938  <+0xc38>
0xc708ff3933   c33  c4c17928d0           vmovapd xmm2,xmm8
0xc708ff3938   c38  c4c1782ee0           vucomiss xmm4,xmm8
0xc708ff393d   c3d  0f8705000000         ja 0xc708ff3948  <+0xc48>
0xc708ff3943   c43  c4c17928d0           vmovapd xmm2,xmm8
0xc708ff3948   c48  c5d258ea             vaddss xmm5,xmm5,xmm2
0xc708ff394c   c4c  8b9d78ffffff         movl rbx,[rbp-0x88]
0xc708ff3952   c52  8d0c83               leal rcx,[rbx+rax*4]
0xc708ff3955   c55  8b5d80               movl rbx,[rbp-0x80]
0xc708ff3958   c58  8d0483               leal rax,[rbx+rax*4]
0xc708ff395b   c5b  c4427918f6           vbroadcastss xmm14,xmm14
0xc708ff3960   c60  c4630921f010         vinsertps xmm14,xmm14,xmm0,0x10
0xc708ff3966   c66  c4c30922040402       vpinsrd xmm0,xmm14,[r12+rax*1],0x2
0xc708ff396d   c6d  c4c37922040c03       vpinsrd xmm0,xmm0,[r12+rcx*1],0x3
0xc708ff3974   c74  c4627918f2           vbroadcastss xmm14,xmm2
0xc708ff3979   c79  c4c17859c6           vmulps xmm0,xmm0,xmm14
0xc708ff397e   c7e  c51058e8             vaddps xmm13,xmm13,xmm0
0xc708ff3982   c82  c5f82efc             vucomiss xmm7,xmm4
0xc708ff3986   c86  0f870a000000         ja 0xc708ff3996  <+0xc96>
0xc708ff398c   c8c  c4c17928c0           vmovapd xmm0,xmm8
0xc708ff3991   c91  e90e000000           jmp 0xc708ff39a4  <+0xca4>
0xc708ff3996   c96  c5f976c0             vpcmpeqd xmm0,xmm0,xmm0
0xc708ff399a   c9a  c5f972f019           vpslld xmm0,xmm0,25
0xc708ff399f   c9f  c5f972d002           vpsrld xmm0,xmm0,2
0xc708ff39a4   ca4  c5e259d8             vmulss xmm3,xmm3,xmm0
0xc708ff39a8   ca8  c4416258e4           vaddss xmm12,xmm3,xmm12
0xc708ff39ad   cad  c5fa59c1             vmulss xmm0,xmm0,xmm1
0xc708ff39b1   cb1  c4417a58c9           vaddss xmm9,xmm0,xmm9
0xc708ff39b6   cb6  413bf3               cmpl rsi,r11
0xc708ff39b9   cb9  0f8517000000         jnz 0xc708ff39d6  <+0xcd6>
0xc708ff39bf   cbf  8b85f8feffff         movl rax,[rbp-0x108]
0xc708ff39c5   cc5  3b8598feffff         cmpl rax,[rbp-0x168]
0xc708ff39cb   ccb  0f83effcffff         jnc 0xc708ff36c0  <+0x9c0>
0xc708ff39d1   cd1  e90a040000           jmp 0xc708ff3de0  <+0x10e0>
0xc708ff39d6   cd6  8b45e0               movl rax,[rbp-0x20]
0xc708ff39d9   cd9  c4417a11640448       vmovss [r12+rax*1+0x48],xmm12
0xc708ff39e0   ce0  c4417a114c0444       vmovss [r12+rax*1+0x44],xmm9
0xc708ff39e7   ce7  c4c17a116c0440       vmovss [r12+rax*1+0x40],xmm5
0xc708ff39ee   cee  c4417a7f6c0430       vmovdqu [r12+rax*1+0x30],xmm13
0xc708ff39f5   cf5  458bc3               movl r8,r11
0xc708ff39f8   cf8  418bcf               movl rcx,r15
0xc708ff39fb   cfb  8bf8                 movl rdi,rax
0xc708ff39fd   cfd  4533db               xorl r11,r11
0xc708ff3a00   d00  8bc6                 movl rax,rsi
0xc708ff3a02   d02  e910030000           jmp 0xc708ff3d17  <+0x1017>
0xc708ff3a07   d07  458bfb               movl r15,r11
0xc708ff3a0a   d0a  448b5dc8             movl r11,[rbp-0x38]
0xc708ff3a0e   d0e  8b95f8feffff         movl rdx,[rbp-0x108]
0xc708ff3a14   d14  48899598feffff       REX.W movq [rbp-0x168],rdx
0xc708ff3a1b   d1b  e90e000000           jmp 0xc708ff3a2e  <+0xd2e>
0xc708ff3a20   d20  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0xc708ff3a27   d27  448bbd28ffffff       movl r15,[rbp-0xd8]
0xc708ff3a2e   d2e  8b75e0               movl rsi,[rbp-0x20]
0xc708ff3a31   d31  c4417a11643448       vmovss [r12+rsi*1+0x48],xmm12
0xc708ff3a38   d38  c4417a114c3444       vmovss [r12+rsi*1+0x44],xmm9
0xc708ff3a3f   d3f  c4c17a116c3440       vmovss [r12+rsi*1+0x40],xmm5
0xc708ff3a46   d46  c4417a7f6c3430       vmovdqu [r12+rsi*1+0x30],xmm13
0xc708ff3a4d   d4d  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xc708ff3a53   d53  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff3a57   d57  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xc708ff3a5e   d5e  83bd00ffffff00       cmpl [rbp-0x100],0x0
0xc708ff3a65   d65  0f8401040000         jz 0xc708ff3e6c  <+0x116c>
0xc708ff3a6b   d6b  448bbd08ffffff       movl r15,[rbp-0xf8]
0xc708ff3a72   d72  478b1c3c             movl r11,[r12+r15*1]
0xc708ff3a76   d76  8b8510ffffff         movl rax,[rbp-0xf0]
0xc708ff3a7c   d7c  418b1c04             movl rbx,[r12+rax*1]
0xc708ff3a80   d80  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0xc708ff3a87   d87  443bdb               cmpl r11,rbx
0xc708ff3a8a   d8a  0f8299030000         jc 0xc708ff3e29  <+0x1129>
0xc708ff3a90   d90  453bf3               cmpl r14,r11
0xc708ff3a93   d93  0f8290030000         jc 0xc708ff3e29  <+0x1129>
0xc708ff3a99   d99  443bdb               cmpl r11,rbx
0xc708ff3a9c   d9c  0f8487030000         jz 0xc708ff3e29  <+0x1129>
0xc708ff3aa2   da2  458d1c98             leal r11,[r8+rbx*4]
0xc708ff3aa6   da6  448b8528ffffff       movl r8,[rbp-0xd8]
0xc708ff3aad   dad  442bc3               subl r8,rbx
0xc708ff3ab0   db0  428d1c8500000000     leal rbx,[r8*4+0x0]
0xc708ff3ab8   db8  478d0483             leal r8,[r11+r8*4]
0xc708ff3abc   dbc  0f1f4000             nop
0xc708ff3ac0   dc0  418d4304             leal rax,[r11+0x4]
0xc708ff3ac4   dc4  438b141c             movl rdx,[r12+r11*1]
0xc708ff3ac8   dc8  3b55d0               cmpl rdx,[rbp-0x30]
0xc708ff3acb   dcb  0f8425000000         jz 0xc708ff3af6  <+0xdf6>
0xc708ff3ad1   dd1  443bca               cmpl r9,rdx
0xc708ff3ad4   dd4  0f861c000000         jna 0xc708ff3af6  <+0xdf6>
0xc708ff3ada   dda  448bbd30ffffff       movl r15,[rbp-0xd0]
0xc708ff3ae1   de1  443bfa               cmpl r15,rdx
0xc708ff3ae4   de4  0f860c000000         jna 0xc708ff3af6  <+0xdf6>
0xc708ff3aea   dea  3b9538ffffff         cmpl rdx,[rbp-0xc8]
0xc708ff3af0   df0  0f82d4000000         jc 0xc708ff3bca  <+0xeca>
0xc708ff3af6   df6  83c3fc               addl rbx,0xfc
0xc708ff3af9   df9  0f84f5020000         jz 0xc708ff3df4  <+0x10f4>
0xc708ff3aff   dff  458d7b08             leal r15,[r11+0x8]
0xc708ff3b03   e03  418b0404             movl rax,[r12+rax*1]
0xc708ff3b07   e07  3b45d0               cmpl rax,[rbp-0x30]
0xc708ff3b0a   e0a  0f8423000000         jz 0xc708ff3b33  <+0xe33>
0xc708ff3b10   e10  443bc8               cmpl r9,rax
0xc708ff3b13   e13  0f861a000000         jna 0xc708ff3b33  <+0xe33>
0xc708ff3b19   e19  8b9530ffffff         movl rdx,[rbp-0xd0]
0xc708ff3b1f   e1f  3bd0                 cmpl rdx,rax
0xc708ff3b21   e21  0f860c000000         jna 0xc708ff3b33  <+0xe33>
0xc708ff3b27   e27  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xc708ff3b2d   e2d  0f82a2000000         jc 0xc708ff3bd5  <+0xed5>
0xc708ff3b33   e33  83c3fc               addl rbx,0xfc
0xc708ff3b36   e36  0f84e2020000         jz 0xc708ff3e1e  <+0x111e>
0xc708ff3b3c   e3c  418d430c             leal rax,[r11+0xc]
0xc708ff3b40   e40  478b3c3c             movl r15,[r12+r15*1]
0xc708ff3b44   e44  443b7dd0             cmpl r15,[rbp-0x30]
0xc708ff3b48   e48  0f8425000000         jz 0xc708ff3b73  <+0xe73>
0xc708ff3b4e   e4e  453bcf               cmpl r9,r15
0xc708ff3b51   e51  0f861c000000         jna 0xc708ff3b73  <+0xe73>
0xc708ff3b57   e57  8b9530ffffff         movl rdx,[rbp-0xd0]
0xc708ff3b5d   e5d  413bd7               cmpl rdx,r15
0xc708ff3b60   e60  0f860d000000         jna 0xc708ff3b73  <+0xe73>
0xc708ff3b66   e66  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xc708ff3b6d   e6d  0f826d000000         jc 0xc708ff3be0  <+0xee0>
0xc708ff3b73   e73  83c3fc               addl rbx,0xfc
0xc708ff3b76   e76  0f848b020000         jz 0xc708ff3e07  <+0x1107>
0xc708ff3b7c   e7c  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc708ff3b80   e80  0f8643090000         jna 0xc708ff44c9  <+0x17c9>
0xc708ff3b86   e86  4183c310             addl r11,0x10
0xc708ff3b8a   e8a  418b0404             movl rax,[r12+rax*1]
0xc708ff3b8e   e8e  3b45d0               cmpl rax,[rbp-0x30]
0xc708ff3b91   e91  0f8425000000         jz 0xc708ff3bbc  <+0xebc>
0xc708ff3b97   e97  443bc8               cmpl r9,rax
0xc708ff3b9a   e9a  0f861c000000         jna 0xc708ff3bbc  <+0xebc>
0xc708ff3ba0   ea0  448bbd30ffffff       movl r15,[rbp-0xd0]
0xc708ff3ba7   ea7  443bf8               cmpl r15,rax
0xc708ff3baa   eaa  0f860c000000         jna 0xc708ff3bbc  <+0xebc>
0xc708ff3bb0   eb0  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xc708ff3bb6   eb6  0f822c000000         jc 0xc708ff3be8  <+0xee8>
0xc708ff3bbc   ebc  83c3fc               addl rbx,0xfc
0xc708ff3bbf   ebf  0f85fbfeffff         jnz 0xc708ff3ac0  <+0xdc0>
0xc708ff3bc5   ec5  e954020000           jmp 0xc708ff3e1e  <+0x111e>
0xc708ff3bca   eca  448bda               movl r11,rdx
0xc708ff3bcd   ecd  418bd7               movl rdx,r15
0xc708ff3bd0   ed0  e91f000000           jmp 0xc708ff3bf4  <+0xef4>
0xc708ff3bd5   ed5  448bd8               movl r11,rax
0xc708ff3bd8   ed8  418bc7               movl rax,r15
0xc708ff3bdb   edb  e914000000           jmp 0xc708ff3bf4  <+0xef4>
0xc708ff3be0   ee0  458bdf               movl r11,r15
0xc708ff3be3   ee3  e90c000000           jmp 0xc708ff3bf4  <+0xef4>
0xc708ff3be8   ee8  448bd0               movl r10,rax
0xc708ff3beb   eeb  418bc3               movl rax,r11
0xc708ff3bee   eee  458bda               movl r11,r10
0xc708ff3bf1   ef1  418bd7               movl rdx,r15
0xc708ff3bf4   ef4  468d3c9d00000000     leal r15,[r11*4+0x0]
0xc708ff3bfc   efc  428d1c99             leal rbx,[rcx+r11*4]
0xc708ff3c00   f00  c4c17a10041c         vmovss xmm0,[r12+rbx*1]
0xc708ff3c06   f06  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xc708ff3c0a   f0a  8b9d58ffffff         movl rbx,[rbp-0xa8]
0xc708ff3c10   f10  428d3c9b             leal rdi,[rbx+r11*4]
0xc708ff3c14   f14  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0xc708ff3c1a   f1a  c52a5cf4             vsubss xmm14,xmm10,xmm4
0xc708ff3c1e   f1e  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0xc708ff3c23   f23  c5e259d3             vmulss xmm2,xmm3,xmm3
0xc708ff3c27   f27  c5ea58c9             vaddss xmm1,xmm2,xmm1
0xc708ff3c2b   f2b  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xc708ff3c32   f32  c5f82ef9             vucomiss xmm7,xmm1
0xc708ff3c36   f36  0f870a000000         ja 0xc708ff3c46  <+0xf46>
0xc708ff3c3c   f3c  c4c17928d0           vmovapd xmm2,xmm8
0xc708ff3c41   f41  e90e000000           jmp 0xc708ff3c54  <+0xf54>
0xc708ff3c46   f46  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0xc708ff3c4a   f4a  c5e972f219           vpslld xmm2,xmm2,25
0xc708ff3c4f   f4f  c5e972d202           vpsrld xmm2,xmm2,2
0xc708ff3c54   f54  c5e259da             vmulss xmm3,xmm3,xmm2
0xc708ff3c58   f58  c4416258e4           vaddss xmm12,xmm3,xmm12
0xc708ff3c5d   f5d  c4417a11643448       vmovss [r12+rsi*1+0x48],xmm12
0xc708ff3c64   f64  c4c16a59de           vmulss xmm3,xmm2,xmm14
0xc708ff3c69   f69  c4416258c9           vaddss xmm9,xmm3,xmm9
0xc708ff3c6e   f6e  c4417a114c3444       vmovss [r12+rsi*1+0x44],xmm9
0xc708ff3c75   f75  c5f82ef1             vucomiss xmm6,xmm1
0xc708ff3c79   f79  0f870a000000         ja 0xc708ff3c89  <+0xf89>
0xc708ff3c7f   f7f  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3c84   f84  e90e000000           jmp 0xc708ff3c97  <+0xf97>
0xc708ff3c89   f89  c5e176db             vpcmpeqd xmm3,xmm3,xmm3
0xc708ff3c8d   f8d  c5e172f319           vpslld xmm3,xmm3,25
0xc708ff3c92   f92  c5e172d302           vpsrld xmm3,xmm3,2
0xc708ff3c97   f97  c5f82ecf             vucomiss xmm1,xmm7
0xc708ff3c9b   f9b  0f8305000000         jnc 0xc708ff3ca6  <+0xfa6>
0xc708ff3ca1   fa1  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3ca6   fa6  c4c1782ec8           vucomiss xmm1,xmm8
0xc708ff3cab   fab  0f8705000000         ja 0xc708ff3cb6  <+0xfb6>
0xc708ff3cb1   fb1  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3cb6   fb6  c5d258eb             vaddss xmm5,xmm5,xmm3
0xc708ff3cba   fba  c4c17a116c3440       vmovss [r12+rsi*1+0x40],xmm5
0xc708ff3cc1   fc1  448b8d78ffffff       movl r9,[rbp-0x88]
0xc708ff3cc8   fc8  478d3c99             leal r15,[r9+r11*4]
0xc708ff3ccc   fcc  8b7d80               movl rdi,[rbp-0x80]
0xc708ff3ccf   fcf  468d1c9f             leal r11,[rdi+r11*4]
0xc708ff3cd3   fd3  c4e27918e4           vbroadcastss xmm4,xmm4
0xc708ff3cd8   fd8  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0xc708ff3cde   fde  c4835922041c02       vpinsrd xmm0,xmm4,[r12+r11*1],0x2
0xc708ff3ce5   fe5  c4837922043c03       vpinsrd xmm0,xmm0,[r12+r15*1],0x3
0xc708ff3cec   fec  c4e27918db           vbroadcastss xmm3,xmm3
0xc708ff3cf1   ff1  c5f859c3             vmulps xmm0,xmm0,xmm3
0xc708ff3cf5   ff5  c51058e8             vaddps xmm13,xmm13,xmm0
0xc708ff3cf9   ff9  c4417a7f6c3430       vmovdqu [r12+rsi*1+0x30],xmm13
0xc708ff3d00  1000  413bc0               cmpl rax,r8
0xc708ff3d03  1003  0f8406010000         jz 0xc708ff3e0f  <+0x110f>
0xc708ff3d09  1009  41bb01000000         movl r11,0x1
0xc708ff3d0f  100f  8bdf                 movl rbx,rdi
0xc708ff3d11  1011  8bfe                 movl rdi,rsi
0xc708ff3d13  1013  448b4dd8             movl r9,[rbp-0x28]
0xc708ff3d17  1017  4533ff               xorl r15,r15
0xc708ff3d1a  101a  e961f8ffff           jmp 0xc708ff3580  <+0x880>
0xc708ff3d1f  101f  8bbd48ffffff         movl rdi,[rbp-0xb8]
0xc708ff3d25  1025  428d0cbf             leal rcx,[rdi+r15*4]
0xc708ff3d29  1029  c4c17a10040c         vmovss xmm0,[r12+rcx*1]
0xc708ff3d2f  102f  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xc708ff3d33  1033  8b8d58ffffff         movl rcx,[rbp-0xa8]
0xc708ff3d39  1039  428d3cb9             leal rdi,[rcx+r15*4]
0xc708ff3d3d  103d  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0xc708ff3d43  1043  c52a5cf4             vsubss xmm14,xmm10,xmm4
0xc708ff3d47  1047  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0xc708ff3d4c  104c  c5e259d3             vmulss xmm2,xmm3,xmm3
0xc708ff3d50  1050  c5ea58c9             vaddss xmm1,xmm2,xmm1
0xc708ff3d54  1054  c5f82ef9             vucomiss xmm7,xmm1
0xc708ff3d58  1058  0f870a000000         ja 0xc708ff3d68  <+0x1068>
0xc708ff3d5e  105e  c4c17928d0           vmovapd xmm2,xmm8
0xc708ff3d63  1063  e90e000000           jmp 0xc708ff3d76  <+0x1076>
0xc708ff3d68  1068  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0xc708ff3d6c  106c  c5e972f219           vpslld xmm2,xmm2,25
0xc708ff3d71  1071  c5e972d202           vpsrld xmm2,xmm2,2
0xc708ff3d76  1076  c5e259da             vmulss xmm3,xmm3,xmm2
0xc708ff3d7a  107a  c4416258e4           vaddss xmm12,xmm3,xmm12
0xc708ff3d7f  107f  8b7de0               movl rdi,[rbp-0x20]
0xc708ff3d82  1082  c4417a11643c48       vmovss [r12+rdi*1+0x48],xmm12
0xc708ff3d89  1089  c4c16a59de           vmulss xmm3,xmm2,xmm14
0xc708ff3d8e  108e  c4416258c9           vaddss xmm9,xmm3,xmm9
0xc708ff3d93  1093  c4417a114c3c44       vmovss [r12+rdi*1+0x44],xmm9
0xc708ff3d9a  109a  c5f82ef1             vucomiss xmm6,xmm1
0xc708ff3d9e  109e  0f870a000000         ja 0xc708ff3dae  <+0x10ae>
0xc708ff3da4  10a4  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3da9  10a9  e90e000000           jmp 0xc708ff3dbc  <+0x10bc>
0xc708ff3dae  10ae  c5e176db             vpcmpeqd xmm3,xmm3,xmm3
0xc708ff3db2  10b2  c5e172f319           vpslld xmm3,xmm3,25
0xc708ff3db7  10b7  c5e172d302           vpsrld xmm3,xmm3,2
0xc708ff3dbc  10bc  c5f82ecf             vucomiss xmm1,xmm7
0xc708ff3dc0  10c0  0f8305000000         jnc 0xc708ff3dcb  <+0x10cb>
0xc708ff3dc6  10c6  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3dcb  10cb  c4c1782ec8           vucomiss xmm1,xmm8
0xc708ff3dd0  10d0  0f87eaf6ffff         ja 0xc708ff34c0  <+0x7c0>
0xc708ff3dd6  10d6  c4c17928d8           vmovapd xmm3,xmm8
0xc708ff3ddb  10db  e9e0f6ffff           jmp 0xc708ff34c0  <+0x7c0>
0xc708ff3de0  10e0  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff3de6  10e6  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff3dec  10ec  448bc2               movl r8,rdx
0xc708ff3def  10ef  e941000000           jmp 0xc708ff3e35  <+0x1135>
0xc708ff3df4  10f4  8bbd30ffffff         movl rdi,[rbp-0xd0]
0xc708ff3dfa  10fa  8b9d20ffffff         movl rbx,[rbp-0xe0]
0xc708ff3e00  1100  8bc2                 movl rax,rdx
0xc708ff3e02  1102  e917000000           jmp 0xc708ff3e1e  <+0x111e>
0xc708ff3e07  1107  418bc7               movl rax,r15
0xc708ff3e0a  110a  e90f000000           jmp 0xc708ff3e1e  <+0x111e>
0xc708ff3e0f  110f  448bbd28ffffff       movl r15,[rbp-0xd8]
0xc708ff3e16  1116  458bd8               movl r11,r8
0xc708ff3e19  1119  e94e000000           jmp 0xc708ff3e6c  <+0x116c>
0xc708ff3e1e  111e  448bf8               movl r15,rax
0xc708ff3e21  1121  458bd8               movl r11,r8
0xc708ff3e24  1124  e943000000           jmp 0xc708ff3e6c  <+0x116c>
0xc708ff3e29  1129  458bfb               movl r15,r11
0xc708ff3e2c  112c  448b5dc8             movl r11,[rbp-0x38]
0xc708ff3e30  1130  e937000000           jmp 0xc708ff3e6c  <+0x116c>
0xc708ff3e35  1135  8b5de0               movl rbx,[rbp-0x20]
0xc708ff3e38  1138  c4417a11641c48       vmovss [r12+rbx*1+0x48],xmm12
0xc708ff3e3f  113f  c4417a114c1c44       vmovss [r12+rbx*1+0x44],xmm9
0xc708ff3e46  1146  c4c17a116c1c40       vmovss [r12+rbx*1+0x40],xmm5
0xc708ff3e4d  114d  c4417a7f6c1c30       vmovdqu [r12+rbx*1+0x30],xmm13
0xc708ff3e54  1154  8bf3                 movl rsi,rbx
0xc708ff3e56  1156  448bbd28ffffff       movl r15,[rbp-0xd8]
0xc708ff3e5d  115d  e90a000000           jmp 0xc708ff3e6c  <+0x116c>
0xc708ff3e62  1162  8b75e0               movl rsi,[rbp-0x20]
0xc708ff3e65  1165  448bbd28ffffff       movl r15,[rbp-0xd8]
0xc708ff3e6c  116c  8d4610               leal rax,[rsi+0x10]
0xc708ff3e6f  116f  8d7e20               leal rdi,[rsi+0x20]
0xc708ff3e72  1172  448d4630             leal r8,[rsi+0x30]
0xc708ff3e76  1176  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff3e7d  117d  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff3e81  1181  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xc708ff3e88  1188  8bde                 movl rbx,rsi
0xc708ff3e8a  118a  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc708ff3e8e  118e  8b5598               movl rdx,[rbp-0x68]
0xc708ff3e91  1191  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0xc708ff3e96  1196  c5fb105588           vmovsd xmm2,[rbp-0x78]
0xc708ff3e9b  119b  8bcf                 movl rcx,rdi
0xc708ff3e9d  119d  458bc8               movl r9,r8
0xc708ff3ea0  11a0  8bbd20ffffff         movl rdi,[rbp-0xe0]
0xc708ff3ea6  11a6  e89dbef1ff           call 0xc708f0fd48  (jump table)
0xc708ff3eab  11ab  8b7da0               movl rdi,[rbp-0x60]
0xc708ff3eae  11ae  3b7dd0               cmpl rdi,[rbp-0x30]
0xc708ff3eb1  11b1  0f866f000000         jna 0xc708ff3f26  <+0x1226>
0xc708ff3eb7  11b7  448b45d0             movl r8,[rbp-0x30]
0xc708ff3ebb  11bb  448b5da8             movl r11,[rbp-0x58]
0xc708ff3ebf  11bf  478d2483             leal r12,[r11+r8*4]
0xc708ff3ec3  11c3  448b7de0             movl r15,[rbp-0x20]
0xc708ff3ec7  11c7  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0xc708ff3ece  11ce  c4817a10443e10       vmovss xmm0,[r14+r15*1+0x10]
0xc708ff3ed5  11d5  c4817a110426         vmovss [r14+r12*1],xmm0
0xc708ff3edb  11db  448b65b0             movl r12,[rbp-0x50]
0xc708ff3edf  11df  438d0484             leal rax,[r12+r8*4]
0xc708ff3ee3  11e3  c4817a10443e14       vmovss xmm0,[r14+r15*1+0x14]
0xc708ff3eea  11ea  c4c17a110406         vmovss [r14+rax*1],xmm0
0xc708ff3ef0  11f0  8b5db8               movl rbx,[rbp-0x48]
0xc708ff3ef3  11f3  428d0483             leal rax,[rbx+r8*4]
0xc708ff3ef7  11f7  c4817a10443e18       vmovss xmm0,[r14+r15*1+0x18]
0xc708ff3efe  11fe  c4c17a110406         vmovss [r14+rax*1],xmm0
0xc708ff3f04  1204  8b55c0               movl rdx,[rbp-0x40]
0xc708ff3f07  1207  428d0482             leal rax,[rdx+r8*4]
0xc708ff3f0b  120b  c4817a10443e1c       vmovss xmm0,[r14+r15*1+0x1c]
0xc708ff3f12  1212  c4c17a110406         vmovss [r14+rax*1],xmm0
0xc708ff3f18  1218  458bd0               movl r10,r8
0xc708ff3f1b  121b  448bc7               movl r8,rdi
0xc708ff3f1e  121e  418bfa               movl rdi,r10
0xc708ff3f21  1221  e920000000           jmp 0xc708ff3f46  <+0x1246>
0xc708ff3f26  1226  448bc7               movl r8,rdi
0xc708ff3f29  1229  8b7dd0               movl rdi,[rbp-0x30]
0xc708ff3f2c  122c  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0xc708ff3f33  1233  e90e000000           jmp 0xc708ff3f46  <+0x1246>
0xc708ff3f38  1238  448b45a0             movl r8,[rbp-0x60]
0xc708ff3f3c  123c  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xc708ff3f43  1243  4d8bf3               REX.W movq r14,r11
0xc708ff3f46  1246  83c701               addl rdi,0x1
0xc708ff3f49  1249  448b5dd8             movl r11,[rbp-0x28]
0xc708ff3f4d  124d  443bdf               cmpl r11,rdi
0xc708ff3f50  1250  0f852af2ffff         jnz 0xc708ff3180  <+0x480>
0xc708ff3f56  1256  8b7de0               movl rdi,[rbp-0x20]
0xc708ff3f59  1259  83c750               addl rdi,0x50
0xc708ff3f5c  125c  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xc708ff3f60  1260  418938               movl [r8],rdi
0xc708ff3f63  1263  488be5               REX.W movq rsp,rbp
0xc708ff3f66  1266  5d                   pop rbp
0xc708ff3f67  1267  c3                   retl
0xc708ff3f68  1268  e863c5f1ff           call 0xc708f104d0  (jump table)
0xc708ff3f6d  126d  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc708ff3f71  1271  8b8528ffffff         movl rax,[rbp-0xd8]
0xc708ff3f77  1277  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0xc708ff3f7e  127e  e9a7edffff           jmp 0xc708ff2d2a  <+0x2a>
0xc708ff3f83  1283  c5f92eed             vucomisd xmm5,xmm5
0xc708ff3f87  1287  0f8b0b000000         jpo 0xc708ff3f98  <+0x1298>
0xc708ff3f8d  128d  4533ff               xorl r15,r15
0xc708ff3f90  1290  4d8be7               REX.W movq r12,r15
0xc708ff3f93  1293  e9ebeeffff           jmp 0xc708ff2e83  <+0x183>
0xc708ff3f98  1298  c5d057ed             vxorps xmm5,xmm5,xmm5
0xc708ff3f9c  129c  c5f82eeb             vucomiss xmm5,xmm3
0xc708ff3fa0  12a0  0f870b000000         ja 0xc708ff3fb1  <+0x12b1>
0xc708ff3fa6  12a6  41bcffffffff         movl r12,0xffffffff
0xc708ff3fac  12ac  e9d2eeffff           jmp 0xc708ff2e83  <+0x183>
0xc708ff3fb1  12b1  4531e4               xorl r12,r12
0xc708ff3fb4  12b4  e9caeeffff           jmp 0xc708ff2e83  <+0x183>
0xc708ff3fb9  12b9  c5f92ef6             vucomisd xmm6,xmm6
0xc708ff3fbd  12bd  0f8b08000000         jpo 0xc708ff3fcb  <+0x12cb>
0xc708ff3fc3  12c3  4531e4               xorl r12,r12
0xc708ff3fc6  12c6  e91cefffff           jmp 0xc708ff2ee7  <+0x1e7>
0xc708ff3fcb  12cb  c5c857f6             vxorps xmm6,xmm6,xmm6
0xc708ff3fcf  12cf  c5f82ef5             vucomiss xmm6,xmm5
0xc708ff3fd3  12d3  77ee                 ja 0xc708ff3fc3  <+0x12c3>
0xc708ff3fd5  12d5  41bcffffffff         movl r12,0xffffffff
0xc708ff3fdb  12db  e907efffff           jmp 0xc708ff2ee7  <+0x1e7>
0xc708ff3fe0  12e0  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xc708ff3fe7  12e7  48897dd0             REX.W movq [rbp-0x30],rdi
0xc708ff3feb  12eb  4c899de8feffff       REX.W movq [rbp-0x118],r11
0xc708ff3ff2  12f2  e8d9c4f1ff           call 0xc708f104d0  (jump table)
0xc708ff3ff7  12f7  448b4dd8             movl r9,[rbp-0x28]
0xc708ff3ffb  12fb  8b7dd0               movl rdi,[rbp-0x30]
0xc708ff3ffe  12fe  8b8528ffffff         movl rax,[rbp-0xd8]
0xc708ff4004  1304  4c8b9de8feffff       REX.W movq r11,[rbp-0x118]
0xc708ff400b  130b  8b5d80               movl rbx,[rbp-0x80]
0xc708ff400e  130e  8b9578ffffff         movl rdx,[rbp-0x88]
0xc708ff4014  1314  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff4019  1319  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff4021  1321  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff4029  1329  448bbd58ffffff       movl r15,[rbp-0xa8]
0xc708ff4030  1330  448bb548ffffff       movl r14,[rbp-0xb8]
0xc708ff4037  1337  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff403d  133d  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff4043  1343  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0xc708ff404b  134b  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0xc708ff4053  1353  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xc708ff405b  135b  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0xc708ff4063  1363  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0xc708ff406b  136b  448ba590feffff       movl r12,[rbp-0x170]
0xc708ff4072  1372  e986f1ffff           jmp 0xc708ff31fd  <+0x4fd>
0xc708ff4077  1377  c5f92ed2             vucomisd xmm2,xmm2
0xc708ff407b  137b  0f8b08000000         jpo 0xc708ff4089  <+0x1389>
0xc708ff4081  1381  4533c0               xorl r8,r8
0xc708ff4084  1384  e9e3f2ffff           jmp 0xc708ff336c  <+0x66c>
0xc708ff4089  1389  c441782ec4           vucomiss xmm8,xmm12
0xc708ff408e  138e  77f1                 ja 0xc708ff4081  <+0x1381>
0xc708ff4090  1390  41b8ffffffff         movl r8,0xffffffff
0xc708ff4096  1396  e9d1f2ffff           jmp 0xc708ff336c  <+0x66c>
0xc708ff409b  139b  c441792ec9           vucomisd xmm9,xmm9
0xc708ff40a0  13a0  0f8b08000000         jpo 0xc708ff40ae  <+0x13ae>
0xc708ff40a6  13a6  4533c0               xorl r8,r8
0xc708ff40a9  13a9  e91ef3ffff           jmp 0xc708ff33cc  <+0x6cc>
0xc708ff40ae  13ae  c441782ec6           vucomiss xmm8,xmm14
0xc708ff40b3  13b3  77f1                 ja 0xc708ff40a6  <+0x13a6>
0xc708ff40b5  13b5  41b8ffffffff         movl r8,0xffffffff
0xc708ff40bb  13bb  e90cf3ffff           jmp 0xc708ff33cc  <+0x6cc>
0xc708ff40c0  13c0  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff40c8  13c8  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff40d0  13d0  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff40d8  13d8  4c899df0feffff       REX.W movq [rbp-0x110],r11
0xc708ff40df  13df  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff40e7  13e7  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff40ef  13ef  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff40f7  13f7  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff40fe  13fe  e8cdc3f1ff           call 0xc708f104d0  (jump table)
0xc708ff4103  1403  448b4dd8             movl r9,[rbp-0x28]
0xc708ff4107  1407  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff410e  140e  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff4113  1413  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff411b  141b  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff4123  1423  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff412b  142b  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff4133  1433  448b8530ffffff       movl r8,[rbp-0xd0]
0xc708ff413a  143a  8b95f8feffff         movl rdx,[rbp-0x108]
0xc708ff4140  1440  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff4146  1446  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff414c  144c  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff4152  1452  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff4158  1458  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff4160  1460  448b9df0feffff       movl r11,[rbp-0x110]
0xc708ff4167  1467  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff416f  146f  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff4177  1477  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff417f  147f  e9a6f3ffff           jmp 0xc708ff352a  <+0x82a>
0xc708ff4184  1484  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff4188  1488  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff4190  1490  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff4198  1498  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff41a0  14a0  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff41a8  14a8  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff41b0  14b0  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff41b8  14b8  4c89bdf0feffff       REX.W movq [rbp-0x110],r15
0xc708ff41bf  14bf  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff41c6  14c6  e805c3f1ff           call 0xc708f104d0  (jump table)
0xc708ff41cb  14cb  448b4dd8             movl r9,[rbp-0x28]
0xc708ff41cf  14cf  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff41d6  14d6  448b5dc8             movl r11,[rbp-0x38]
0xc708ff41da  14da  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff41e2  14e2  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff41ea  14ea  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff41f2  14f2  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff41fa  14fa  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff41ff  14ff  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff4207  1507  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff420f  150f  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff4217  1517  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff421f  151f  448b8530ffffff       movl r8,[rbp-0xd0]
0xc708ff4226  1526  8b95f8feffff         movl rdx,[rbp-0x108]
0xc708ff422c  152c  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff4232  1532  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff4238  1538  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff423e  153e  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff4244  1544  448bbdf0feffff       movl r15,[rbp-0x110]
0xc708ff424b  154b  e96ff3ffff           jmp 0xc708ff35bf  <+0x8bf>
0xc708ff4250  1550  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff4258  1558  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff4260  1560  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff4268  1568  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff4270  1570  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff4278  1578  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff4280  1580  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff4284  1584  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0xc708ff428b  158b  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff4292  1592  e839c2f1ff           call 0xc708f104d0  (jump table)
0xc708ff4297  1597  448b4dd8             movl r9,[rbp-0x28]
0xc708ff429b  159b  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff42a2  15a2  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff42a7  15a7  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff42af  15af  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff42b7  15b7  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff42bf  15bf  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff42c7  15c7  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff42cf  15cf  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff42d7  15d7  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff42df  15df  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff42e7  15e7  448b8520ffffff       movl r8,[rbp-0xe0]
0xc708ff42ee  15ee  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff42f5  15f5  448b5dc8             movl r11,[rbp-0x38]
0xc708ff42f9  15f9  8b95f8feffff         movl rdx,[rbp-0x108]
0xc708ff42ff  15ff  448bbd98feffff       movl r15,[rbp-0x168]
0xc708ff4306  1606  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff430c  160c  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff4312  1612  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff4318  1618  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff431e  161e  e9c8f3ffff           jmp 0xc708ff36eb  <+0x9eb>
0xc708ff4323  1623  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff432b  162b  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff4333  1633  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff433b  163b  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff4343  1643  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff434b  164b  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff4353  1653  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0xc708ff435a  165a  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff4361  1661  e86ac1f1ff           call 0xc708f104d0  (jump table)
0xc708ff4366  1666  448b4dd8             movl r9,[rbp-0x28]
0xc708ff436a  166a  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff4371  1671  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff4376  1676  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff437e  167e  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff4386  1686  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff438e  168e  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff4396  1696  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff439e  169e  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff43a6  16a6  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff43ae  16ae  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff43b6  16b6  8b9530ffffff         movl rdx,[rbp-0xd0]
0xc708ff43bc  16bc  448b8520ffffff       movl r8,[rbp-0xe0]
0xc708ff43c3  16c3  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff43ca  16ca  8bb5d8feffff         movl rsi,[rbp-0x128]
0xc708ff43d0  16d0  8b8dd0feffff         movl rcx,[rbp-0x130]
0xc708ff43d6  16d6  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff43dc  16dc  8b85c0feffff         movl rax,[rbp-0x140]
0xc708ff43e2  16e2  448bbd40ffffff       movl r15,[rbp-0xc0]
0xc708ff43e9  16e9  e91cf3ffff           jmp 0xc708ff370a  <+0xa0a>
0xc708ff43ee  16ee  4c895dc8             REX.W movq [rbp-0x38],r11
0xc708ff43f2  16f2  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff43fa  16fa  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff4402  1702  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff440a  170a  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff4412  1712  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff441a  171a  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff4422  1722  4889b5f0feffff       REX.W movq [rbp-0x110],rsi
0xc708ff4429  1729  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0xc708ff4430  1730  48898d28ffffff       REX.W movq [rbp-0xd8],rcx
0xc708ff4437  1737  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff443e  173e  e88dc0f1ff           call 0xc708f104d0  (jump table)
0xc708ff4443  1743  448b4dd8             movl r9,[rbp-0x28]
0xc708ff4447  1747  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff444e  174e  448b5dc8             movl r11,[rbp-0x38]
0xc708ff4452  1752  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff4457  1757  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff445f  175f  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff4467  1767  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff446f  176f  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff4477  1777  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff447f  177f  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff4487  1787  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff448f  178f  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff4497  1797  8b9530ffffff         movl rdx,[rbp-0xd0]
0xc708ff449d  179d  448b8520ffffff       movl r8,[rbp-0xe0]
0xc708ff44a4  17a4  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff44ab  17ab  8bb5f0feffff         movl rsi,[rbp-0x110]
0xc708ff44b1  17b1  4c8bbd40ffffff       REX.W movq r15,[rbp-0xc0]
0xc708ff44b8  17b8  8b8d28ffffff         movl rcx,[rbp-0xd8]
0xc708ff44be  17be  8b9dc8feffff         movl rbx,[rbp-0x138]
0xc708ff44c4  17c4  e966f3ffff           jmp 0xc708ff382f  <+0xb2f>
0xc708ff44c9  17c9  4c8945c8             REX.W movq [rbp-0x38],r8
0xc708ff44cd  17cd  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xc708ff44d5  17d5  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xc708ff44dd  17dd  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xc708ff44e5  17e5  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xc708ff44ed  17ed  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xc708ff44f5  17f5  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xc708ff44fd  17fd  488985f0feffff       REX.W movq [rbp-0x110],rax
0xc708ff4504  1804  48899d40ffffff       REX.W movq [rbp-0xc0],rbx
0xc708ff450b  180b  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0xc708ff4512  1812  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xc708ff4519  1819  e8b2bff1ff           call 0xc708f104d0  (jump table)
0xc708ff451e  181e  8b75e0               movl rsi,[rbp-0x20]
0xc708ff4521  1821  448b4dd8             movl r9,[rbp-0x28]
0xc708ff4525  1825  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xc708ff452c  182c  448b45c8             movl r8,[rbp-0x38]
0xc708ff4530  1830  c4413857c0           vxorps xmm8,xmm8,xmm8
0xc708ff4535  1835  c5fb10bd70ffffff     vmovsd xmm7,[rbp-0x90]
0xc708ff453d  183d  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0xc708ff4545  1845  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xc708ff454d  184d  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xc708ff4555  1855  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xc708ff455b  185b  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xc708ff4563  1863  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xc708ff456b  186b  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xc708ff4573  1873  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xc708ff457b  187b  8b85f0feffff         movl rax,[rbp-0x110]
0xc708ff4581  1881  488b9d40ffffff       REX.W movq rbx,[rbp-0xc0]
0xc708ff4588  1888  448b9d28ffffff       movl r11,[rbp-0xd8]
0xc708ff458f  188f  448bb518ffffff       movl r14,[rbp-0xe8]
0xc708ff4596  1896  e9ebf5ffff           jmp 0xc708ff3b86  <+0xe86>
0xc708ff459b  189b  90                   nop

Protected instructions:
 pc offset
        42         
        63         
       10d         
       240         
       246         
       24e         
       253         
       25b         
       264         
       269         
       26e         
       273         
       2aa         
       2db         
       2e0         
       2e5         
       2ea         
       30c         
       311         
       316         
       332         
       359         
       35e         
       363         
       36c         
       375         
       37e         
       38a         
       393         
       39f         
       3a7         
       3b8         
       3bd         
       3c9         
       3d5         
       3da         
       3e8         
       50a         
       514         
       51e         
       528         
       532         
       539         
       540         
       547         
       54d         
       556         
       564         
       7c4         
       7e7         
       7ee         
       802         
       8d0         
       a3d         
       a45         
       a83         
       aba         
       af1         
       b32         
       bdb         
       bf5         
       c66         
       c6d         
       cd9         
       ce0         
       ce7         
       cee         
       d31         
       d38         
       d3f         
       d46         
       d72         
       d7c         
       dc4         
       e03         
       e40         
       e8a         
       f00         
       f14         
       f5d         
       f6e         
       fba         
       fde         
       fe5         
       ff9         
      1029         
      103d         
      1082         
      1093         
      1138         
      113f         
      1146         
      114d         
      11ce         
      11d5         
      11e3         
      11ea         
      11f7         
      11fe         
      120b         
      1212         

Source positions:
 pc offset  position
        42        58
        63        95
       10d       164
       240       279
       246       289
       24e       293
       253       300
       25b       304
       264       315
       269       320
       26e       325
       273       330
       278       333
       29f       343
       2db       361
       2e0       368
       2e5       375
       2ea       382
       30c       413
       311       420
       316       427
       32e       452
       359       495
       35e       502
       363       509
       368       516
       371       523
       37a       530
       386       538
       38f       545
       398       552
       3a7       560
       3b1       568
       3bd       575
       3c2       582
       3ce       589
       3da       596
       3e8       609
       50a       645
       514       655
       51e       665
       528       677
       52e       680
       539       687
       540       694
       547       701
       54d       712
       556       719
       564       742
       7c4      2052
       7e7      2078
       7ee      2083
       802      2100
       8d0      1082
       a3d      1206
       a45      1219
       a83      1279
       bdb      1713
       bf5      1731
       c66      1800
       c6d      1805
       cd6      1871
       ce0      1878
       ce7      1885
       cee      1892
       d2e      1339
       d38      1346
       d3f      1353
       d46      1360
       d6b      1371
       d76      1378
       dc4      1440
       f00      1501
       f14      1526
       f5d      1555
       f6e      1570
       fba      1623
       fde      1649
       fe5      1654
       ff9      1671
      1029      1930
      103d      1955
      107f      1984
      1093      1999
      1135      2111
      113f      2118
      1146      2125
      114d      2132
      1176      2160
      11c3      2180
      11d5      2183
      11e3      2193
      11ea      2196
      11f7      2206
      11fe      2209
      120b      2219
      1212      2222
      1268         0
      12e0       624
      13c0      1014
      1484      1047
      1550      1143
      1623      1156
      16ee      1264
      17c9      1425

Safepoints (stack slots = 60, entries = 1, byte size = 22)
0xc708ff2f9f    29f  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0xc708ff2f9b  internal wasm call
0xc708ff3ea7  internal wasm call
0xc708ff3f69  wasm stub call  (0xc708f104d0)
0xc708ff3ff3  wasm stub call  (0xc708f104d0)
0xc708ff40ff  wasm stub call  (0xc708f104d0)
0xc708ff41c7  wasm stub call  (0xc708f104d0)
0xc708ff4293  wasm stub call  (0xc708f104d0)
0xc708ff4362  wasm stub call  (0xc708f104d0)
0xc708ff443f  wasm stub call  (0xc708f104d0)
0xc708ff451a  wasm stub call  (0xc708f104d0)
