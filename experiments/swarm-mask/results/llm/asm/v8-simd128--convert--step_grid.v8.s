name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 6272 = 6212 + 60 padding)
Instructions (size = 6188)
0xde6dc383c40     0  55                   push rbp
0xde6dc383c41     1  4889e5               REX.W movq rbp,rsp
0xde6dc383c44     4  6a08                 push 0x8
0xde6dc383c46     6  56                   push rsi
0xde6dc383c47     7  4881ecc0010000       REX.W subq rsp,0x1c0
0xde6dc383c4e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0xde6dc383c52    12  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xde6dc383c59    19  4889bde8feffff       REX.W movq [rbp-0x118],rdi
0xde6dc383c60    20  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc383c64    24  0f86c7110000         jna 0xde6dc384e31  <+0x11f1>
0xde6dc383c6a    2a  4c8b462f             REX.W movq r8,[rsi+0x2f]
0xde6dc383c6e    2e  458b18               movl r11,[r8]
0xde6dc383c71    31  418d5bb0             leal rbx,[r11-0x50]
0xde6dc383c75    35  418918               movl [r8],rbx
0xde6dc383c78    38  448bd8               movl r11,rax
0xde6dc383c7b    3b  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0xde6dc383c82    42  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0xde6dc383c88    48  c5fa16d0             vmovshdup xmm2,xmm0
0xde6dc383c8c    4c  41ba0000803a         movl r10,0x3a800000
0xde6dc383c92    52  c4c1796eda           vmovd xmm3,r10
0xde6dc383c97    57  c5ea59e3             vmulss xmm4,xmm2,xmm3
0xde6dc383c9b    5b  c5f828c8             vmovaps xmm1,xmm0
0xde6dc383c9f    5f  c5e259d9             vmulss xmm3,xmm3,xmm1
0xde6dc383ca3    63  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0xde6dc383cad    6d  4c8945e8             REX.W movq [rbp-0x18],r8
0xde6dc383cb1    71  48895de0             REX.W movq [rbp-0x20],rbx
0xde6dc383cb5    75  4c895dd0             REX.W movq [rbp-0x30],r11
0xde6dc383cb9    79  c5fb115588           vmovsd [rbp-0x78],xmm2
0xde6dc383cbe    7e  c5fb114d90           vmovsd [rbp-0x70],xmm1
0xde6dc383cc3    83  c5f82eed             vucomiss xmm5,xmm5
0xde6dc383cc7    87  7a06                 jpe 0xde6dc383ccf  <+0x8f>
0xde6dc383cc9    89  0f8404000000         jz 0xde6dc383cd3  <+0x93>
0xde6dc383ccf    8f  c5f928eb             vmovapd xmm5,xmm3
0xde6dc383cd3    93  c5f82edb             vucomiss xmm3,xmm3
0xde6dc383cd7    97  7a06                 jpe 0xde6dc383cdf  <+0x9f>
0xde6dc383cd9    99  0f8404000000         jz 0xde6dc383ce3  <+0xa3>
0xde6dc383cdf    9f  c5f928dd             vmovapd xmm3,xmm5
0xde6dc383ce3    a3  c5f82eeb             vucomiss xmm5,xmm3
0xde6dc383ce7    a7  0f8704000000         ja 0xde6dc383cf1  <+0xb1>
0xde6dc383ced    ad  c5f928eb             vmovapd xmm5,xmm3
0xde6dc383cf1    b1  c5f82eed             vucomiss xmm5,xmm5
0xde6dc383cf5    b5  7a06                 jpe 0xde6dc383cfd  <+0xbd>
0xde6dc383cf7    b7  0f8409000000         jz 0xde6dc383d06  <+0xc6>
0xde6dc383cfd    bd  c5f928dc             vmovapd xmm3,xmm4
0xde6dc383d01    c1  e904000000           jmp 0xde6dc383d0a  <+0xca>
0xde6dc383d06    c6  c5f928dd             vmovapd xmm3,xmm5
0xde6dc383d0a    ca  c5f82ee4             vucomiss xmm4,xmm4
0xde6dc383d0e    ce  7a06                 jpe 0xde6dc383d16  <+0xd6>
0xde6dc383d10    d0  0f8404000000         jz 0xde6dc383d1a  <+0xda>
0xde6dc383d16    d6  c5f928e3             vmovapd xmm4,xmm3
0xde6dc383d1a    da  c5f82edc             vucomiss xmm3,xmm4
0xde6dc383d1e    de  0f8704000000         ja 0xde6dc383d28  <+0xe8>
0xde6dc383d24    e4  c5f928dc             vmovapd xmm3,xmm4
0xde6dc383d28    e8  41ba0020803f         movl r10,0x3f802000
0xde6dc383d2e    ee  c4c1796ee2           vmovd xmm4,r10
0xde6dc383d33    f3  c5da59db             vmulss xmm3,xmm4,xmm3
0xde6dc383d37    f7  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0xde6dc383d3b    fb  c5d972f419           vpslld xmm4,xmm4,25
0xde6dc383d40   100  c5d972d402           vpsrld xmm4,xmm4,2
0xde6dc383d45   105  c5da5edb             vdivss xmm3,xmm4,xmm3
0xde6dc383d49   109  c5f828db             vmovaps xmm3,xmm3
0xde6dc383d4d   10d  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0xde6dc383d57   117  c4e27918db           vbroadcastss xmm3,xmm3
0xde6dc383d5c   11c  c5f859c3             vmulps xmm0,xmm0,xmm3
0xde6dc383d60   120  c4e37908c00a         vroundps xmm0,xmm0,0xa
0xde6dc383d66   126  c5f828d8             vmovaps xmm3,xmm0
0xde6dc383d6a   12a  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0xde6dc383d6e   12e  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0xde6dc383d74   134  c57b2ce6             vcvttsd2si r12,xmm6
0xde6dc383d78   138  4585e4               testl r12,r12
0xde6dc383d7b   13b  0f892a000000         jns 0xde6dc383dab  <+0x16b>
0xde6dc383d81   141  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0xde6dc383d8b   14b  c441f96efa           vmovq xmm15,r10
0xde6dc383d90   150  c50358fe             vaddsd xmm15,xmm15,xmm6
0xde6dc383d94   154  c4417b2ce7           vcvttsd2si r12,xmm15
0xde6dc383d99   159  4585e4               testl r12,r12
0xde6dc383d9c   15c  0f8809000000         js 0xde6dc383dab  <+0x16b>
0xde6dc383da2   162  41ba00000080         movl r10,0x80000000
0xde6dc383da8   168  450be2               orl r12,r10
0xde6dc383dab   16b  4589e2               movl r10,r12
0xde6dc383dae   16e  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0xde6dc383db3   173  c5f92efe             vucomisd xmm7,xmm6
0xde6dc383db7   177  0f8a8f100000         jpe 0xde6dc384e4c  <+0x120c>
0xde6dc383dbd   17d  0f8589100000         jnz 0xde6dc384e4c  <+0x120c>
0xde6dc383dc3   183  c4c1796edc           vmovd xmm3,r12
0xde6dc383dc8   188  c5f970db00           vpshufd xmm3,xmm3,0x0
0xde6dc383dcd   18d  c5fa16e8             vmovshdup xmm5,xmm0
0xde6dc383dd1   191  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0xde6dc383dd5   195  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0xde6dc383ddb   19b  c57b2ce7             vcvttsd2si r12,xmm7
0xde6dc383ddf   19f  4585e4               testl r12,r12
0xde6dc383de2   1a2  0f8927000000         jns 0xde6dc383e0f  <+0x1cf>
0xde6dc383de8   1a8  4c8b1594ffffff       REX.W movq r10,[rip+0xffffff94]
0xde6dc383def   1af  c441f96efa           vmovq xmm15,r10
0xde6dc383df4   1b4  c50358ff             vaddsd xmm15,xmm15,xmm7
0xde6dc383df8   1b8  c4417b2ce7           vcvttsd2si r12,xmm15
0xde6dc383dfd   1bd  4585e4               testl r12,r12
0xde6dc383e00   1c0  0f8809000000         js 0xde6dc383e0f  <+0x1cf>
0xde6dc383e06   1c6  41ba00000080         movl r10,0x80000000
0xde6dc383e0c   1cc  450be2               orl r12,r10
0xde6dc383e0f   1cf  4589e2               movl r10,r12
0xde6dc383e12   1d2  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0xde6dc383e17   1d7  c5792ec7             vucomisd xmm8,xmm7
0xde6dc383e1b   1db  0f8a61100000         jpe 0xde6dc384e82  <+0x1242>
0xde6dc383e21   1e1  0f855b100000         jnz 0xde6dc384e82  <+0x1242>
0xde6dc383e27   1e7  c4c36122dc01         vpinsrd xmm3,xmm3,r12,0x1
0xde6dc383e2d   1ed  49ba0100000001000000 REX.W movq r10,0x100000001
0xde6dc383e37   1f7  c4c1f96eea           vmovq xmm5,r10
0xde6dc383e3c   1fc  c5d16ced             vpunpcklqdq xmm5,xmm5,xmm5
0xde6dc383e40   200  c4e2613fdd           vpmaxud xmm3,xmm3,xmm5
0xde6dc383e45   205  c5c9eff6             vpxor xmm6,xmm6,xmm6
0xde6dc383e49   209  c5c8c2f802           vcmpps xmm7,xmm6,xmm0, (le)
0xde6dc383e4e   20e  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0xde6dc383e58   218  c441f96ec2           vmovq xmm8,r10
0xde6dc383e5d   21d  c441396cc0           vpunpcklqdq xmm8,xmm8,xmm8
0xde6dc383e62   222  c4c178c2c001         vcmpps xmm0,xmm0,xmm8, (lt)
0xde6dc383e68   228  c5c1dbc0             vpand xmm0,xmm7,xmm0
0xde6dc383e6c   22c  c579dffd             vpandn xmm15,xmm0,xmm5
0xde6dc383e70   230  c5e1dbc0             vpand xmm0,xmm3,xmm0
0xde6dc383e74   234  c4c179ebc7           vpor xmm0,xmm0,xmm15
0xde6dc383e79   239  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0xde6dc383e80   240  c4817813041c         vmovlps [r12+r11*1],xmm0
0xde6dc383e86   246  468bbc1fcc000000     movl r15,[rdi+r11*1+0xcc]
0xde6dc383e8e   24e  44897c1f28           movl [rdi+rbx*1+0x28],r15
0xde6dc383e93   253  4e8bbc1fc4000000     REX.W movq r15,[rdi+r11*1+0xc4]
0xde6dc383e9b   25b  4c897c1f20           REX.W movq [rdi+rbx*1+0x20],r15
0xde6dc383ea0   260  448d7860             leal r15,[rax+0x60]
0xde6dc383ea4   264  428b541f04           movl rdx,[rdi+r11*1+0x4]
0xde6dc383ea9   269  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0xde6dc383eae   26e  468b741f10           movl r14,[rdi+r11*1+0x10]
0xde6dc383eb3   273  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0xde6dc383eb8   278  c5f811ad80feffff     vmovups [rbp-0x180],xmm5
0xde6dc383ec0   280  c5f811b550feffff     vmovups [rbp-0x1b0],xmm6
0xde6dc383ec8   288  c5781185b0feffff     vmovups [rbp-0x150],xmm8
0xde6dc383ed0   290  4c8965c8             REX.W movq [rbp-0x38],r12
0xde6dc383ed4   294  418bc7               movl rax,r15
0xde6dc383ed7   297  418bde               movl rbx,r14
0xde6dc383eda   29a  e819cef1ff           call 0xde6dc2a0cf8  (jump table)
0xde6dc383edf   29f  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0xde6dc383ee6   2a6  4c8b45d0             REX.W movq r8,[rbp-0x30]
0xde6dc383eea   2aa  468b5c0708           movl r11,[rdi+r8*1+0x8]
0xde6dc383eef   2af  4c895dd8             REX.W movq [rbp-0x28],r11
0xde6dc383ef3   2b3  4585db               testl r11,r11
0xde6dc383ef6   2b6  0f8513000000         jnz 0xde6dc383f0f  <+0x2cf>
0xde6dc383efc   2bc  8b5de0               movl rbx,[rbp-0x20]
0xde6dc383eff   2bf  8d7b50               leal rdi,[rbx+0x50]
0xde6dc383f02   2c2  4c8b65e8             REX.W movq r12,[rbp-0x18]
0xde6dc383f06   2c6  41893c24             movl [r12],rdi
0xde6dc383f0a   2ca  488be5               REX.W movq rsp,rbp
0xde6dc383f0d   2cd  5d                   pop rbp
0xde6dc383f0e   2ce  c3                   retl
0xde6dc383f0f   2cf  8b8528ffffff         movl rax,[rbp-0xd8]
0xde6dc383f15   2d5  8d90a0000000         leal rdx,[rax+0xa0]
0xde6dc383f1b   2db  468b64075c           movl r12,[rdi+r8*1+0x5c]
0xde6dc383f20   2e0  468b7c0750           movl r15,[rdi+r8*1+0x50]
0xde6dc383f25   2e5  468b740744           movl r14,[rdi+r8*1+0x44]
0xde6dc383f2a   2ea  428b5c0738           movl rbx,[rdi+r8*1+0x38]
0xde6dc383f2f   2ef  8bcb                 movl rcx,rbx
0xde6dc383f31   2f1  443bf3               cmpl r14,rbx
0xde6dc383f34   2f4  410f42ce             cmovcl rcx,r14
0xde6dc383f38   2f8  448bf1               movl r14,rcx
0xde6dc383f3b   2fb  443bf9               cmpl r15,rcx
0xde6dc383f3e   2fe  450f42f7             cmovcl r14,r15
0xde6dc383f42   302  458bfe               movl r15,r14
0xde6dc383f45   305  453be6               cmpl r12,r14
0xde6dc383f48   308  450f42fc             cmovcl r15,r12
0xde6dc383f4c   30c  468b640714           movl r12,[rdi+r8*1+0x14]
0xde6dc383f51   311  468b740720           movl r14,[rdi+r8*1+0x20]
0xde6dc383f56   316  428b5c072c           movl rbx,[rdi+r8*1+0x2c]
0xde6dc383f5b   31b  8bcb                 movl rcx,rbx
0xde6dc383f5d   31d  443bf3               cmpl r14,rbx
0xde6dc383f60   320  410f42ce             cmovcl rcx,r14
0xde6dc383f64   324  448bf1               movl r14,rcx
0xde6dc383f67   327  443be1               cmpl r12,rcx
0xde6dc383f6a   32a  450f42f4             cmovcl r14,r12
0xde6dc383f6e   32e  488b5dc8             REX.W movq rbx,[rbp-0x38]
0xde6dc383f72   332  c4a17b100403         vmovsd xmm0,[rbx+r8*1]
0xde6dc383f78   338  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xde6dc383f80   340  c57970f800           vpshufd xmm15,xmm0,0x0
0xde6dc383f85   345  c5f970e300           vpshufd xmm4,xmm3,0x0
0xde6dc383f8a   34a  c4c3590ee70c         vpblendw xmm4,xmm4,xmm15,0xc
0xde6dc383f90   350  c4e2793fc3           vpmaxud xmm0,xmm0,xmm3
0xde6dc383f95   355  c5f9fac3             vpsubd xmm0,xmm0,xmm3
0xde6dc383f99   359  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0xde6dc383f9e   35e  428b74074c           movl rsi,[rdi+r8*1+0x4c]
0xde6dc383fa3   363  468b4c0740           movl r9,[rdi+r8*1+0x40]
0xde6dc383fa8   368  4c897da0             REX.W movq [rbp-0x60],r15
0xde6dc383fac   36c  468b7c0734           movl r15,[rdi+r8*1+0x34]
0xde6dc383fb1   371  48895dc0             REX.W movq [rbp-0x40],rbx
0xde6dc383fb5   375  428b5c077c           movl rbx,[rdi+r8*1+0x7c]
0xde6dc383fba   37a  48895598             REX.W movq [rbp-0x68],rdx
0xde6dc383fbe   37e  428b940780000000     movl rdx,[rdi+r8*1+0x80]
0xde6dc383fc6   386  488975b8             REX.W movq [rbp-0x48],rsi
0xde6dc383fca   38a  428b740764           movl rsi,[rdi+r8*1+0x64]
0xde6dc383fcf   38f  4c894db0             REX.W movq [rbp-0x50],r9
0xde6dc383fd3   393  468b4c0768           movl r9,[rdi+r8*1+0x68]
0xde6dc383fd8   398  48898d38ffffff       REX.W movq [rbp-0xc8],rcx
0xde6dc383fdf   39f  428b8c0788000000     movl rcx,[rdi+r8*1+0x88]
0xde6dc383fe7   3a7  c4a17a10ac0784000000 vmovss xmm5,[rdi+r8*1+0x84]
0xde6dc383ff1   3b1  4c89a530ffffff       REX.W movq [rbp-0xd0],r12
0xde6dc383ff8   3b8  468b64071c           movl r12,[rdi+r8*1+0x1c]
0xde6dc383ffd   3bd  468b5c0728           movl r11,[rdi+r8*1+0x28]
0xde6dc384002   3c2  4c89b590feffff       REX.W movq [rbp-0x170],r14
0xde6dc384009   3c9  468b740710           movl r14,[rdi+r8*1+0x10]
0xde6dc38400e   3ce  4c899d78ffffff       REX.W movq [rbp-0x88],r11
0xde6dc384015   3d5  468b5c0704           movl r11,[rdi+r8*1+0x4]
0xde6dc38401a   3da  c4a17a10b407a0000000 vmovss xmm6,[rdi+r8*1+0xa0]
0xde6dc384024   3e4  c5ca59f6             vmulss xmm6,xmm6,xmm6
0xde6dc384028   3e8  c4a17a10bc07a4000000 vmovss xmm7,[rdi+r8*1+0xa4]
0xde6dc384032   3f2  c5c259ff             vmulss xmm7,xmm7,xmm7
0xde6dc384036   3f6  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0xde6dc38403e   3fe  c5f8118530feffff     vmovups [rbp-0x1d0],xmm0
0xde6dc384046   406  4c897da8             REX.W movq [rbp-0x58],r15
0xde6dc38404a   40a  48899d20ffffff       REX.W movq [rbp-0xe0],rbx
0xde6dc384051   411  48899518ffffff       REX.W movq [rbp-0xe8],rdx
0xde6dc384058   418  4889b5d8feffff       REX.W movq [rbp-0x128],rsi
0xde6dc38405f   41f  4c898dd0feffff       REX.W movq [rbp-0x130],r9
0xde6dc384066   426  48898da8feffff       REX.W movq [rbp-0x158],rcx
0xde6dc38406d   42d  c5fb11ade0feffff     vmovsd [rbp-0x120],xmm5
0xde6dc384075   435  4c896580             REX.W movq [rbp-0x80],r12
0xde6dc384079   439  4c89b548ffffff       REX.W movq [rbp-0xb8],r14
0xde6dc384080   440  4c899d58ffffff       REX.W movq [rbp-0xa8],r11
0xde6dc384087   447  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0xde6dc38408f   44f  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0xde6dc384097   457  418bc9               movl rcx,r9
0xde6dc38409a   45a  458bfb               movl r15,r11
0xde6dc38409d   45d  4c8bdf               REX.W movq r11,rdi
0xde6dc3840a0   460  33ff                 xorl rdi,rdi
0xde6dc3840a2   462  448b4dd8             movl r9,[rbp-0x28]
0xde6dc3840a6   466  4489e3               movl rbx,r12
0xde6dc3840a9   469  48897dc8             REX.W movq [rbp-0x38],rdi
0xde6dc3840ad   46d  e967000000           jmp 0xde6dc384119  <+0x4d9>
0xde6dc3840b2   472  660f1f840000000000   nop
0xde6dc3840bb   47b  0f1f440000           nop
0xde6dc3840c0   480  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0xde6dc3840c8   488  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xde6dc3840d0   490  8b8528ffffff         movl rax,[rbp-0xd8]
0xde6dc3840d6   496  458bcb               movl r9,r11
0xde6dc3840d9   499  4d8bde               REX.W movq r11,r14
0xde6dc3840dc   49c  8b5d80               movl rbx,[rbp-0x80]
0xde6dc3840df   49f  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0xde6dc3840e7   4a7  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3840ef   4af  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc3840f7   4b7  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0xde6dc3840ff   4bf  448bbd58ffffff       movl r15,[rbp-0xa8]
0xde6dc384106   4c6  448bb548ffffff       movl r14,[rbp-0xb8]
0xde6dc38410d   4cd  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc384113   4d3  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc384119   4d9  8b9578ffffff         movl rdx,[rbp-0x88]
0xde6dc38411f   4df  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc384124   4e4  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0xde6dc38412c   4ec  448ba590feffff       movl r12,[rbp-0x170]
0xde6dc384133   4f3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc384137   4f7  0f866c0d0000         jna 0xde6dc384ea9  <+0x1269>
0xde6dc38413d   4fd  443be7               cmpl r12,rdi
0xde6dc384140   500  0f86bb0c0000         jna 0xde6dc384e01  <+0x11c1>
0xde6dc384146   506  458d04bf             leal r8,[r15+rdi*4]
0xde6dc38414a   50a  c4017a101403         vmovss xmm10,[r11+r8*1]
0xde6dc384150   510  458d04be             leal r8,[r14+rdi*4]
0xde6dc384154   514  c4017a101c03         vmovss xmm11,[r11+r8*1]
0xde6dc38415a   51a  448d04bb             leal r8,[rbx+rdi*4]
0xde6dc38415e   51e  c4017a102403         vmovss xmm12,[r11+r8*1]
0xde6dc384164   524  448d04ba             leal r8,[rdx+rdi*4]
0xde6dc384168   528  c4017a102c03         vmovss xmm13,[r11+r8*1]
0xde6dc38416e   52e  448b65e0             movl r12,[rbp-0x20]
0xde6dc384172   532  c4017a116c230c       vmovss [r11+r12*1+0xc],xmm13
0xde6dc384179   539  c4017a11642308       vmovss [r11+r12*1+0x8],xmm12
0xde6dc384180   540  c4017a115c2304       vmovss [r11+r12*1+0x4],xmm11
0xde6dc384187   547  c4017a111423         vmovss [r11+r12*1],xmm10
0xde6dc38418d   54d  43c744234800000000   movl [r11+r12*1+0x48],0x0
0xde6dc384196   556  4bc744234000000000   REX.W movq [r11+r12*1+0x40],0x0
0xde6dc38419f   55f  c44119efe4           vpxor xmm12,xmm12,xmm12
0xde6dc3841a4   564  c4017a7f642330       vmovdqu [r11+r12*1+0x30],xmm12
0xde6dc3841ab   56b  c52a59e5             vmulss xmm12,xmm10,xmm5
0xde6dc3841af   56f  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0xde6dc3841b5   575  48897dd0             REX.W movq [rbp-0x30],rdi
0xde6dc3841b9   579  4c899de8feffff       REX.W movq [rbp-0x118],r11
0xde6dc3841c0   580  c441782ee4           vucomiss xmm12,xmm12
0xde6dc3841c5   585  7a06                 jpe 0xde6dc3841cd  <+0x58d>
0xde6dc3841c7   587  0f8405000000         jz 0xde6dc3841d2  <+0x592>
0xde6dc3841cd   58d  c4417928e0           vmovapd xmm12,xmm8
0xde6dc3841d2   592  c441782ee0           vucomiss xmm12,xmm8
0xde6dc3841d7   597  0f8705000000         ja 0xde6dc3841e2  <+0x5a2>
0xde6dc3841dd   59d  c4417928e0           vmovapd xmm12,xmm8
0xde6dc3841e2   5a2  c4427918ec           vbroadcastss xmm13,xmm12
0xde6dc3841e7   5a7  c4415259f3           vmulss xmm14,xmm5,xmm11
0xde6dc3841ec   5ac  c443090af609         vroundss xmm14,xmm14,xmm14,0x9
0xde6dc3841f2   5b2  c441782ef6           vucomiss xmm14,xmm14
0xde6dc3841f7   5b7  7a06                 jpe 0xde6dc3841ff  <+0x5bf>
0xde6dc3841f9   5b9  0f8405000000         jz 0xde6dc384204  <+0x5c4>
0xde6dc3841ff   5bf  c4417928f0           vmovapd xmm14,xmm8
0xde6dc384204   5c4  c441782ef0           vucomiss xmm14,xmm8
0xde6dc384209   5c9  0f870a000000         ja 0xde6dc384219  <+0x5d9>
0xde6dc38420f   5cf  c4c17928c8           vmovapd xmm1,xmm8
0xde6dc384214   5d4  e905000000           jmp 0xde6dc38421e  <+0x5de>
0xde6dc384219   5d9  c4c17928ce           vmovapd xmm1,xmm14
0xde6dc38421e   5de  c441797ef0           vmovd r8,xmm14
0xde6dc384223   5e3  4585c0               testl r8,r8
0xde6dc384226   5e6  0f8404000000         jz 0xde6dc384230  <+0x5f0>
0xde6dc38422c   5ec  c57928f1             vmovapd xmm14,xmm1
0xde6dc384230   5f0  c5782ec1             vucomiss xmm8,xmm1
0xde6dc384234   5f4  7a06                 jpe 0xde6dc38423c  <+0x5fc>
0xde6dc384236   5f6  0f8404000000         jz 0xde6dc384240  <+0x600>
0xde6dc38423c   5fc  c57928f1             vmovapd xmm14,xmm1
0xde6dc384240   600  c4431121ee10         vinsertps xmm13,xmm13,xmm14,0x10
0xde6dc384246   606  c44110c2e901         vcmpps xmm13,xmm13,xmm9, (lt)
0xde6dc38424c   60c  c5f96ec8             vmovd xmm1,rax
0xde6dc384250   610  c5f970c900           vpshufd xmm1,xmm1,0x0
0xde6dc384255   615  c4c11a5ad4           vcvtss2sd xmm2,xmm12,xmm12
0xde6dc38425a   61a  c4e3510bea0b         vroundsd xmm5,xmm5,xmm2,0xb
0xde6dc384260   620  c57b2cc5             vcvttsd2si r8,xmm5
0xde6dc384264   624  4585c0               testl r8,r8
0xde6dc384267   627  0f8927000000         jns 0xde6dc384294  <+0x654>
0xde6dc38426d   62d  4c8b150ffbffff       REX.W movq r10,[rip+0xfffffb0f]
0xde6dc384274   634  c441f96efa           vmovq xmm15,r10
0xde6dc384279   639  c50358fd             vaddsd xmm15,xmm15,xmm5
0xde6dc38427d   63d  c4417b2cc7           vcvttsd2si r8,xmm15
0xde6dc384282   642  4585c0               testl r8,r8
0xde6dc384285   645  0f8809000000         js 0xde6dc384294  <+0x654>
0xde6dc38428b   64b  41ba00000080         movl r10,0x80000000
0xde6dc384291   651  450bc2               orl r8,r10
0xde6dc384294   654  458bd0               movl r10,r8
0xde6dc384297   657  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0xde6dc38429c   65c  c5792ecd             vucomisd xmm9,xmm5
0xde6dc3842a0   660  0f8a9a0c0000         jpe 0xde6dc384f40  <+0x1300>
0xde6dc3842a6   666  0f85940c0000         jnz 0xde6dc384f40  <+0x1300>
0xde6dc3842ac   66c  c4c37122e800         vpinsrd xmm5,xmm1,r8,0x0
0xde6dc3842b2   672  c4410a5ace           vcvtss2sd xmm9,xmm14,xmm14
0xde6dc3842b7   677  c443190be10b         vroundsd xmm12,xmm12,xmm9,0xb
0xde6dc3842bd   67d  c4417b2cc4           vcvttsd2si r8,xmm12
0xde6dc3842c2   682  4585c0               testl r8,r8
0xde6dc3842c5   685  0f8928000000         jns 0xde6dc3842f3  <+0x6b3>
0xde6dc3842cb   68b  4c8b15b1faffff       REX.W movq r10,[rip+0xfffffab1]
0xde6dc3842d2   692  c441f96efa           vmovq xmm15,r10
0xde6dc3842d7   697  c4410358fc           vaddsd xmm15,xmm15,xmm12
0xde6dc3842dc   69c  c4417b2cc7           vcvttsd2si r8,xmm15
0xde6dc3842e1   6a1  4585c0               testl r8,r8
0xde6dc3842e4   6a4  0f8809000000         js 0xde6dc3842f3  <+0x6b3>
0xde6dc3842ea   6aa  41ba00000080         movl r10,0x80000000
0xde6dc3842f0   6b0  450bc2               orl r8,r10
0xde6dc3842f3   6b3  458bd0               movl r10,r8
0xde6dc3842f6   6b6  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0xde6dc3842fb   6bb  c4c1792ecc           vucomisd xmm1,xmm12
0xde6dc384300   6c0  0f8a5e0c0000         jpe 0xde6dc384f64  <+0x1324>
0xde6dc384306   6c6  0f85580c0000         jnz 0xde6dc384f64  <+0x1324>
0xde6dc38430c   6cc  c4c35122e801         vpinsrd xmm5,xmm5,r8,0x1
0xde6dc384312   6d2  c4e2793bed           vpminud xmm5,xmm0,xmm5
0xde6dc384317   6d7  c591dbed             vpand xmm5,xmm13,xmm5
0xde6dc38431b   6db  c551fecb             vpaddd xmm9,xmm5,xmm3
0xde6dc38431f   6df  c442793bc9           vpminud xmm9,xmm0,xmm9
0xde6dc384324   6e4  c4425940e1           vpmulld xmm12,xmm4,xmm9
0xde6dc384329   6e9  c4437916e001         vpextrd r8,xmm12,0x1
0xde6dc38432f   6ef  c5f97ee8             vmovd rax,xmm5
0xde6dc384333   6f3  4533db               xorl r11,r11
0xde6dc384336   6f6  85c0                 testl rax,rax
0xde6dc384338   6f8  410f95c3             setnzl r11l
0xde6dc38433c   6fc  412bc3               subl rax,r11
0xde6dc38433f   6ff  468d1c00             leal r11,[rax+r8*1]
0xde6dc384343   703  4531e4               xorl r12,r12
0xde6dc384346   706  443bd9               cmpl r11,rcx
0xde6dc384349   709  410f92c4             setcl r12l
0xde6dc38434d   70d  c44159fee1           vpaddd xmm12,xmm4,xmm9
0xde6dc384352   712  c5797ee3             vmovd rbx,xmm12
0xde6dc384356   716  4403c3               addl r8,rbx
0xde6dc384359   719  33d2                 xorl rdx,rdx
0xde6dc38435b   71b  443bc1               cmpl r8,rcx
0xde6dc38435e   71e  0f92c2               setcl dl
0xde6dc384361   721  4421e2               andl rdx,r12
0xde6dc384364   724  c4c37916ec01         vpextrd r12,xmm5,0x1
0xde6dc38436a   72a  48899500ffffff       REX.W movq [rbp-0x100],rdx
0xde6dc384371   731  33d2                 xorl rdx,rdx
0xde6dc384373   733  4585e4               testl r12,r12
0xde6dc384376   736  0f95c2               setnzl dl
0xde6dc384379   739  442be2               subl r12,rdx
0xde6dc38437c   73c  468d0486             leal r8,[rsi+r8*4]
0xde6dc384380   740  468d1c9e             leal r11,[rsi+r11*4]
0xde6dc384384   744  c4637916ca01         vpextrd rdx,xmm9,0x1
0xde6dc38438a   74a  488985c0feffff       REX.W movq [rbp-0x140],rax
0xde6dc384391   751  48899dc8feffff       REX.W movq [rbp-0x138],rbx
0xde6dc384398   758  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0xde6dc38439f   75f  4c899d10ffffff       REX.W movq [rbp-0xf0],r11
0xde6dc3843a6   766  488995f8feffff       REX.W movq [rbp-0x108],rdx
0xde6dc3843ad   76d  c4c17928e8           vmovapd xmm5,xmm8
0xde6dc3843b2   772  4c89a598feffff       REX.W movq [rbp-0x168],r12
0xde6dc3843b9   779  448b8530ffffff       movl r8,[rbp-0xd0]
0xde6dc3843c0   780  4533db               xorl r11,r11
0xde6dc3843c3   783  c4417928c8           vmovapd xmm9,xmm8
0xde6dc3843c8   788  c4417928e0           vmovapd xmm12,xmm8
0xde6dc3843cd   78d  c57810ad50feffff     vmovups xmm13,[rbp-0x1b0]
0xde6dc3843d5   795  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc3843dc   79c  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0xde6dc3843e3   7a3  e9c9000000           jmp 0xde6dc3844b1  <+0x871>
0xde6dc3843e8   7a8  660f1f840000000000   nop
0xde6dc3843f1   7b1  660f1f840000000000   nop
0xde6dc3843fa   7ba  660f1f440000         nop
0xde6dc384400   7c0  c5e259da             vmulss xmm3,xmm3,xmm2
0xde6dc384404   7c4  c4416258e4           vaddss xmm12,xmm3,xmm12
0xde6dc384409   7c9  8b7de0               movl rdi,[rbp-0x20]
0xde6dc38440c   7cc  c4417a11643c48       vmovss [r12+rdi*1+0x48],xmm12
0xde6dc384413   7d3  c4c16a59de           vmulss xmm3,xmm2,xmm14
0xde6dc384418   7d8  c4416258c9           vaddss xmm9,xmm3,xmm9
0xde6dc38441d   7dd  c4417a114c3c44       vmovss [r12+rdi*1+0x44],xmm9
0xde6dc384424   7e4  33c9                 xorl rcx,rcx
0xde6dc384426   7e6  c4c1782ec8           vucomiss xmm1,xmm8
0xde6dc38442b   7eb  0f97c1               setal cl
0xde6dc38442e   7ee  33f6                 xorl rsi,rsi
0xde6dc384430   7f0  c5f82ecf             vucomiss xmm1,xmm7
0xde6dc384434   7f4  400f93c6             setncl sil
0xde6dc384438   7f8  4533c9               xorl r9,r9
0xde6dc38443b   7fb  c5f82ef1             vucomiss xmm6,xmm1
0xde6dc38443f   7ff  410f97c1             setal r9l
0xde6dc384443   803  4423ce               andl r9,rsi
0xde6dc384446   806  4423c9               andl r9,rcx
0xde6dc384449   809  458bd1               movl r10,r9
0xde6dc38444c   80c  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0xde6dc384451   811  c5d258eb             vaddss xmm5,xmm5,xmm3
0xde6dc384455   815  c4c17a116c3c40       vmovss [r12+rdi*1+0x40],xmm5
0xde6dc38445c   81c  8b8d78ffffff         movl rcx,[rbp-0x88]
0xde6dc384462   822  468d0cb9             leal r9,[rcx+r15*4]
0xde6dc384466   826  8b7580               movl rsi,[rbp-0x80]
0xde6dc384469   829  468d3cbe             leal r15,[rsi+r15*4]
0xde6dc38446d   82d  c4e27918e4           vbroadcastss xmm4,xmm4
0xde6dc384472   832  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0xde6dc384478   838  c4835922043c02       vpinsrd xmm0,xmm4,[r12+r15*1],0x2
0xde6dc38447f   83f  c4837922040c03       vpinsrd xmm0,xmm0,[r12+r9*1],0x3
0xde6dc384486   846  c4e27918db           vbroadcastss xmm3,xmm3
0xde6dc38448b   84b  c5f859c3             vmulps xmm0,xmm0,xmm3
0xde6dc38448f   84f  c51058e8             vaddps xmm13,xmm13,xmm0
0xde6dc384493   853  c4417a7f6c3c30       vmovdqu [r12+rdi*1+0x30],xmm13
0xde6dc38449a   85a  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc38449e   85e  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc3844a4   864  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc3844aa   86a  448b4dd8             movl r9,[rbp-0x28]
0xde6dc3844ae   86e  458bde               movl r11,r14
0xde6dc3844b1   871  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3844b5   875  0f86ce0a0000         jna 0xde6dc384f89  <+0x1349>
0xde6dc3844bb   87b  4585db               testl r11,r11
0xde6dc3844be   87e  0f841a000000         jz 0xde6dc3844de  <+0x89e>
0xde6dc3844c4   884  443b5dc8             cmpl r11,[rbp-0x38]
0xde6dc3844c8   888  0f8410000000         jz 0xde6dc3844de  <+0x89e>
0xde6dc3844ce   88e  48c78528ffffff00000000 REX.W movq [rbp-0xd8],0x0
0xde6dc3844d9   899  e90b000000           jmp 0xde6dc3844e9  <+0x8a9>
0xde6dc3844de   89e  48c78528ffffff01000000 REX.W movq [rbp-0xd8],0x1
0xde6dc3844e9   8a9  458bfb               movl r15,r11
0xde6dc3844ec   8ac  448b5dc8             movl r11,[rbp-0x38]
0xde6dc3844f0   8b0  e944000000           jmp 0xde6dc384539  <+0x8f9>
0xde6dc3844f5   8b5  660f1f840000000000   nop
0xde6dc3844fe   8be  6690                 nop
0xde6dc384500   8c0  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0xde6dc384507   8c7  458bd8               movl r11,r8
0xde6dc38450a   8ca  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc384510   8d0  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc384516   8d6  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xde6dc38451d   8dd  448bfa               movl r15,rdx
0xde6dc384520   8e0  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc384526   8e6  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc38452c   8ec  8b95f8feffff         movl rdx,[rbp-0x108]
0xde6dc384532   8f2  448b8530ffffff       movl r8,[rbp-0xd0]
0xde6dc384539   8f9  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc38453d   8fd  0f860a0b0000         jna 0xde6dc38504d  <+0x140d>
0xde6dc384543   903  83bd28ffffff00       cmpl [rbp-0xd8],0x0
0xde6dc38454a   90a  0f8596000000         jnz 0xde6dc3845e6  <+0x9a6>
0xde6dc384550   910  458d7704             leal r14,[r15+0x4]
0xde6dc384554   914  478b3c3c             movl r15,[r12+r15*1]
0xde6dc384558   918  443b7dd0             cmpl r15,[rbp-0x30]
0xde6dc38455c   91c  0f841f000000         jz 0xde6dc384581  <+0x941>
0xde6dc384562   922  453bcf               cmpl r9,r15
0xde6dc384565   925  0f8616000000         jna 0xde6dc384581  <+0x941>
0xde6dc38456b   92b  453bc7               cmpl r8,r15
0xde6dc38456e   92e  0f860d000000         jna 0xde6dc384581  <+0x941>
0xde6dc384574   934  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xde6dc38457b   93b  0f82d7060000         jc 0xde6dc384c58  <+0x1018>
0xde6dc384581   941  453bf3               cmpl r14,r11
0xde6dc384584   944  0f842b000000         jz 0xde6dc3845b5  <+0x975>
0xde6dc38458a   94a  458bc3               movl r8,r11
0xde6dc38458d   94d  418bd6               movl rdx,r14
0xde6dc384590   950  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc384597   957  8bbd48ffffff         movl rdi,[rbp-0xb8]
0xde6dc38459d   95d  448b9d40ffffff       movl r11,[rbp-0xc0]
0xde6dc3845a4   964  8b9d78ffffff         movl rbx,[rbp-0x88]
0xde6dc3845aa   96a  8b4d80               movl rcx,[rbp-0x80]
0xde6dc3845ad   96d  8b45e0               movl rax,[rbp-0x20]
0xde6dc3845b0   970  e99b060000           jmp 0xde6dc384c50  <+0x1010>
0xde6dc3845b5   975  41bf01000000         movl r15,0x1
0xde6dc3845bb   97b  458bc3               movl r8,r11
0xde6dc3845be   97e  448b9d40ffffff       movl r11,[rbp-0xc0]
0xde6dc3845c5   985  418bd6               movl rdx,r14
0xde6dc3845c8   988  8b45e0               movl rax,[rbp-0x20]
0xde6dc3845cb   98b  8b4d80               movl rcx,[rbp-0x80]
0xde6dc3845ce   98e  8b9d78ffffff         movl rbx,[rbp-0x88]
0xde6dc3845d4   994  8bbd48ffffff         movl rdi,[rbp-0xb8]
0xde6dc3845da   99a  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc3845e1   9a1  e91affffff           jmp 0xde6dc384500  <+0x8c0>
0xde6dc3845e6   9a6  f68540ffffffff       testb [rbp-0xc0],0xff
0xde6dc3845ed   9ad  0f853e070000         jnz 0xde6dc384d31  <+0x10f1>
0xde6dc3845f3   9b3  3b9598feffff         cmpl rdx,[rbp-0x168]
0xde6dc3845f9   9b9  0f8205070000         jc 0xde6dc384d04  <+0x10c4>
0xde6dc3845ff   9bf  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc384606   9c6  448b8520ffffff       movl r8,[rbp-0xe0]
0xde6dc38460d   9cd  e948000000           jmp 0xde6dc38465a  <+0xa1a>
0xde6dc384612   9d2  660f1f840000000000   nop
0xde6dc38461b   9db  660f1f840000000000   nop
0xde6dc384624   9e4  660f1f840000000000   nop
0xde6dc38462d   9ed  660f1f840000000000   nop
0xde6dc384636   9f6  660f1f840000000000   nop
0xde6dc38463f   9ff  90                   nop
0xde6dc384640   a00  8bd0                 movl rdx,rax
0xde6dc384642   a02  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc384648   a08  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc38464e   a0e  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc384654   a14  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc38465a   a1a  448bbd98feffff       movl r15,[rbp-0x168]
0xde6dc384661   a21  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc384665   a25  0f86ae0a0000         jna 0xde6dc385119  <+0x14d9>
0xde6dc38466b   a2b  413bd7               cmpl rdx,r15
0xde6dc38466e   a2e  0f8611030000         jna 0xde6dc384985  <+0xd45>
0xde6dc384674   a34  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc384678   a38  8b9530ffffff         movl rdx,[rbp-0xd0]
0xde6dc38467e   a3e  6690                 nop
0xde6dc384680   a40  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc384684   a44  0f86620b0000         jna 0xde6dc3851ec  <+0x15ac>
0xde6dc38468a   a4a  458d5f01             leal r11,[r15+0x1]
0xde6dc38468e   a4e  4c899d98feffff       REX.W movq [rbp-0x168],r11
0xde6dc384695   a55  448b9da8feffff       movl r11,[rbp-0x158]
0xde6dc38469c   a5c  450fafdf             imull r11,r15
0xde6dc3846a0   a60  468d3c18             leal r15,[rax+r11*1]
0xde6dc3846a4   a64  413bcf               cmpl rcx,r15
0xde6dc3846a7   a67  0f8654010000         jna 0xde6dc384801  <+0xbc1>
0xde6dc3846ad   a6d  4403db               addl r11,rbx
0xde6dc3846b0   a70  413bcb               cmpl rcx,r11
0xde6dc3846b3   a73  0f8648010000         jna 0xde6dc384801  <+0xbc1>
0xde6dc3846b9   a79  468d1c9e             leal r11,[rsi+r11*4]
0xde6dc3846bd   a7d  478b1c1c             movl r11,[r12+r11*1]
0xde6dc3846c1   a81  468d3cbe             leal r15,[rsi+r15*4]
0xde6dc3846c5   a85  478b3c3c             movl r15,[r12+r15*1]
0xde6dc3846c9   a89  453bdf               cmpl r11,r15
0xde6dc3846cc   a8c  0f822f010000         jc 0xde6dc384801  <+0xbc1>
0xde6dc3846d2   a92  453bf3               cmpl r14,r11
0xde6dc3846d5   a95  0f8226010000         jc 0xde6dc384801  <+0xbc1>
0xde6dc3846db   a9b  453bdf               cmpl r11,r15
0xde6dc3846de   a9e  0f841d010000         jz 0xde6dc384801  <+0xbc1>
0xde6dc3846e4   aa4  438d0cb8             leal rcx,[r8+r15*4]
0xde6dc3846e8   aa8  452bdf               subl r11,r15
0xde6dc3846eb   aab  468d3c9d00000000     leal r15,[r11*4+0x0]
0xde6dc3846f3   ab3  468d1c99             leal r11,[rcx+r11*4]
0xde6dc3846f7   ab7  660f1f840000000000   nop
0xde6dc384700   ac0  8d7104               leal rsi,[rcx+0x4]
0xde6dc384703   ac3  418b040c             movl rax,[r12+rcx*1]
0xde6dc384707   ac7  3b45d0               cmpl rax,[rbp-0x30]
0xde6dc38470a   aca  0f841d000000         jz 0xde6dc38472d  <+0xaed>
0xde6dc384710   ad0  443bc8               cmpl r9,rax
0xde6dc384713   ad3  0f8614000000         jna 0xde6dc38472d  <+0xaed>
0xde6dc384719   ad9  3bd0                 cmpl rdx,rax
0xde6dc38471b   adb  0f860c000000         jna 0xde6dc38472d  <+0xaed>
0xde6dc384721   ae1  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xde6dc384727   ae7  0f82ed000000         jc 0xde6dc38481a  <+0xbda>
0xde6dc38472d   aed  4183c7fc             addl r15,0xfc
0xde6dc384731   af1  0f84af000000         jz 0xde6dc3847e6  <+0xba6>
0xde6dc384737   af7  8d4108               leal rax,[rcx+0x8]
0xde6dc38473a   afa  418b3434             movl rsi,[r12+rsi*1]
0xde6dc38473e   afe  3b75d0               cmpl rsi,[rbp-0x30]
0xde6dc384741   b01  0f841d000000         jz 0xde6dc384764  <+0xb24>
0xde6dc384747   b07  443bce               cmpl r9,rsi
0xde6dc38474a   b0a  0f8614000000         jna 0xde6dc384764  <+0xb24>
0xde6dc384750   b10  3bd6                 cmpl rdx,rsi
0xde6dc384752   b12  0f860c000000         jna 0xde6dc384764  <+0xb24>
0xde6dc384758   b18  3bb538ffffff         cmpl rsi,[rbp-0xc8]
0xde6dc38475e   b1e  0f82c8000000         jc 0xde6dc38482c  <+0xbec>
0xde6dc384764   b24  4183c7fc             addl r15,0xfc
0xde6dc384768   b28  0f847a000000         jz 0xde6dc3847e8  <+0xba8>
0xde6dc38476e   b2e  8d710c               leal rsi,[rcx+0xc]
0xde6dc384771   b31  418b0404             movl rax,[r12+rax*1]
0xde6dc384775   b35  3b45d0               cmpl rax,[rbp-0x30]
0xde6dc384778   b38  0f841d000000         jz 0xde6dc38479b  <+0xb5b>
0xde6dc38477e   b3e  443bc8               cmpl r9,rax
0xde6dc384781   b41  0f8614000000         jna 0xde6dc38479b  <+0xb5b>
0xde6dc384787   b47  3bd0                 cmpl rdx,rax
0xde6dc384789   b49  0f860c000000         jna 0xde6dc38479b  <+0xb5b>
0xde6dc38478f   b4f  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xde6dc384795   b55  0f82a7000000         jc 0xde6dc384842  <+0xc02>
0xde6dc38479b   b5b  4183c7fc             addl r15,0xfc
0xde6dc38479f   b5f  0f8441000000         jz 0xde6dc3847e6  <+0xba6>
0xde6dc3847a5   b65  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3847a9   b69  0f86080b0000         jna 0xde6dc3852b7  <+0x1677>
0xde6dc3847af   b6f  83c110               addl rcx,0x10
0xde6dc3847b2   b72  418b0434             movl rax,[r12+rsi*1]
0xde6dc3847b6   b76  3b45d0               cmpl rax,[rbp-0x30]
0xde6dc3847b9   b79  0f841d000000         jz 0xde6dc3847dc  <+0xb9c>
0xde6dc3847bf   b7f  443bc8               cmpl r9,rax
0xde6dc3847c2   b82  0f8614000000         jna 0xde6dc3847dc  <+0xb9c>
0xde6dc3847c8   b88  3bd0                 cmpl rdx,rax
0xde6dc3847ca   b8a  0f860c000000         jna 0xde6dc3847dc  <+0xb9c>
0xde6dc3847d0   b90  3b8538ffffff         cmpl rax,[rbp-0xc8]
0xde6dc3847d6   b96  0f825d000000         jc 0xde6dc384839  <+0xbf9>
0xde6dc3847dc   b9c  4183c7fc             addl r15,0xfc
0xde6dc3847e0   ba0  0f851affffff         jnz 0xde6dc384700  <+0xac0>
0xde6dc3847e6   ba6  8bf0                 movl rsi,rax
0xde6dc3847e8   ba8  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc3847ec   bac  448bde               movl r11,rsi
0xde6dc3847ef   baf  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc3847f5   bb5  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc3847fb   bbb  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc384801   bc1  448bbd98feffff       movl r15,[rbp-0x168]
0xde6dc384808   bc8  443bbdf8feffff       cmpl r15,[rbp-0x108]
0xde6dc38480f   bcf  0f8457010000         jz 0xde6dc38496c  <+0xd2c>
0xde6dc384815   bd5  e966feffff           jmp 0xde6dc384680  <+0xa40>
0xde6dc38481a   bda  448bbdd8feffff       movl r15,[rbp-0x128]
0xde6dc384821   be1  8b8dc0feffff         movl rcx,[rbp-0x140]
0xde6dc384827   be7  e916000000           jmp 0xde6dc384842  <+0xc02>
0xde6dc38482c   bec  448bd6               movl r10,rsi
0xde6dc38482f   bef  8bf0                 movl rsi,rax
0xde6dc384831   bf1  418bc2               movl rax,r10
0xde6dc384834   bf4  e909000000           jmp 0xde6dc384842  <+0xc02>
0xde6dc384839   bf9  8bf1                 movl rsi,rcx
0xde6dc38483b   bfb  448bbdc0feffff       movl r15,[rbp-0x140]
0xde6dc384842   c02  448d3c8500000000     leal r15,[rax*4+0x0]
0xde6dc38484a   c0a  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xde6dc384851   c11  8b8d58ffffff         movl rcx,[rbp-0xa8]
0xde6dc384857   c17  448d3c81             leal r15,[rcx+rax*4]
0xde6dc38485b   c1b  c4017a10343c         vmovss xmm14,[r12+r15*1]
0xde6dc384861   c21  c4c12a5cce           vsubss xmm1,xmm10,xmm14
0xde6dc384866   c26  c5f259d1             vmulss xmm2,xmm1,xmm1
0xde6dc38486a   c2a  448bbd48ffffff       movl r15,[rbp-0xb8]
0xde6dc384871   c31  418d1c87             leal rbx,[r15+rax*4]
0xde6dc384875   c35  c4c17a10041c         vmovss xmm0,[r12+rbx*1]
0xde6dc38487b   c3b  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xde6dc38487f   c3f  c5e259e3             vmulss xmm4,xmm3,xmm3
0xde6dc384883   c43  c5da58e2             vaddss xmm4,xmm4,xmm2
0xde6dc384887   c47  33db                 xorl rbx,rbx
0xde6dc384889   c49  c4c1782ee0           vucomiss xmm4,xmm8
0xde6dc38488e   c4e  0f97c3               setal bl
0xde6dc384891   c51  33c9                 xorl rcx,rcx
0xde6dc384893   c53  c5f82ee7             vucomiss xmm4,xmm7
0xde6dc384897   c57  0f93c1               setncl cl
0xde6dc38489a   c5a  33d2                 xorl rdx,rdx
0xde6dc38489c   c5c  c5f82ef4             vucomiss xmm6,xmm4
0xde6dc3848a0   c60  0f97c2               setal dl
0xde6dc3848a3   c63  23d1                 andl rdx,rcx
0xde6dc3848a5   c65  23d3                 andl rdx,rbx
0xde6dc3848a7   c67  448bd2               movl r10,rdx
0xde6dc3848aa   c6a  c4c1822ad2           vcvtqsi2ss xmm2,xmm15,r10
0xde6dc3848af   c6f  c5d258ea             vaddss xmm5,xmm5,xmm2
0xde6dc3848b3   c73  8b9d78ffffff         movl rbx,[rbp-0x88]
0xde6dc3848b9   c79  8d1483               leal rdx,[rbx+rax*4]
0xde6dc3848bc   c7c  8b4d80               movl rcx,[rbp-0x80]
0xde6dc3848bf   c7f  8d0481               leal rax,[rcx+rax*4]
0xde6dc3848c2   c82  c4427918f6           vbroadcastss xmm14,xmm14
0xde6dc3848c7   c87  c4630921f010         vinsertps xmm14,xmm14,xmm0,0x10
0xde6dc3848cd   c8d  c4c30922040402       vpinsrd xmm0,xmm14,[r12+rax*1],0x2
0xde6dc3848d4   c94  c4c37922041403       vpinsrd xmm0,xmm0,[r12+rdx*1],0x3
0xde6dc3848db   c9b  c4627918f2           vbroadcastss xmm14,xmm2
0xde6dc3848e0   ca0  c4c17859c6           vmulps xmm0,xmm0,xmm14
0xde6dc3848e5   ca5  c51058e8             vaddps xmm13,xmm13,xmm0
0xde6dc3848e9   ca9  c5f82efc             vucomiss xmm7,xmm4
0xde6dc3848ed   cad  0f870a000000         ja 0xde6dc3848fd  <+0xcbd>
0xde6dc3848f3   cb3  c4c17928c0           vmovapd xmm0,xmm8
0xde6dc3848f8   cb8  e90e000000           jmp 0xde6dc38490b  <+0xccb>
0xde6dc3848fd   cbd  c5f976c0             vpcmpeqd xmm0,xmm0,xmm0
0xde6dc384901   cc1  c5f972f019           vpslld xmm0,xmm0,25
0xde6dc384906   cc6  c5f972d002           vpsrld xmm0,xmm0,2
0xde6dc38490b   ccb  c5e259d8             vmulss xmm3,xmm3,xmm0
0xde6dc38490f   ccf  c4416258e4           vaddss xmm12,xmm3,xmm12
0xde6dc384914   cd4  c5fa59c1             vmulss xmm0,xmm0,xmm1
0xde6dc384918   cd8  c4417a58c9           vaddss xmm9,xmm0,xmm9
0xde6dc38491d   cdd  413bf3               cmpl rsi,r11
0xde6dc384920   ce0  0f8517000000         jnz 0xde6dc38493d  <+0xcfd>
0xde6dc384926   ce6  8b85f8feffff         movl rax,[rbp-0x108]
0xde6dc38492c   cec  3b8598feffff         cmpl rax,[rbp-0x168]
0xde6dc384932   cf2  0f8308fdffff         jnc 0xde6dc384640  <+0xa00>
0xde6dc384938   cf8  e977030000           jmp 0xde6dc384cb4  <+0x1074>
0xde6dc38493d   cfd  8b45e0               movl rax,[rbp-0x20]
0xde6dc384940   d00  c4417a11640448       vmovss [r12+rax*1+0x48],xmm12
0xde6dc384947   d07  c4417a114c0444       vmovss [r12+rax*1+0x44],xmm9
0xde6dc38494e   d0e  c4c17a116c0440       vmovss [r12+rax*1+0x40],xmm5
0xde6dc384955   d15  c4417a7f6c0430       vmovdqu [r12+rax*1+0x30],xmm13
0xde6dc38495c   d1c  458bc3               movl r8,r11
0xde6dc38495f   d1f  418bff               movl rdi,r15
0xde6dc384962   d22  8bd6                 movl rdx,rsi
0xde6dc384964   d24  4533db               xorl r11,r11
0xde6dc384967   d27  e9e4020000           jmp 0xde6dc384c50  <+0x1010>
0xde6dc38496c   d2c  458bfb               movl r15,r11
0xde6dc38496f   d2f  448b5dc8             movl r11,[rbp-0x38]
0xde6dc384973   d33  8b95f8feffff         movl rdx,[rbp-0x108]
0xde6dc384979   d39  48899598feffff       REX.W movq [rbp-0x168],rdx
0xde6dc384980   d40  e90e000000           jmp 0xde6dc384993  <+0xd53>
0xde6dc384985   d45  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0xde6dc38498c   d4c  448bbd28ffffff       movl r15,[rbp-0xd8]
0xde6dc384993   d53  8b75e0               movl rsi,[rbp-0x20]
0xde6dc384996   d56  c4417a11643448       vmovss [r12+rsi*1+0x48],xmm12
0xde6dc38499d   d5d  c4417a114c3444       vmovss [r12+rsi*1+0x44],xmm9
0xde6dc3849a4   d64  c4c17a116c3440       vmovss [r12+rsi*1+0x40],xmm5
0xde6dc3849ab   d6b  c4417a7f6c3430       vmovdqu [r12+rsi*1+0x30],xmm13
0xde6dc3849b2   d72  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xde6dc3849b8   d78  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc3849bc   d7c  83bd00ffffff00       cmpl [rbp-0x100],0x0
0xde6dc3849c3   d83  0f8472030000         jz 0xde6dc384d3b  <+0x10fb>
0xde6dc3849c9   d89  448bbd08ffffff       movl r15,[rbp-0xf8]
0xde6dc3849d0   d90  478b1c3c             movl r11,[r12+r15*1]
0xde6dc3849d4   d94  8b8510ffffff         movl rax,[rbp-0xf0]
0xde6dc3849da   d9a  418b1c04             movl rbx,[r12+rax*1]
0xde6dc3849de   d9e  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0xde6dc3849e5   da5  443bdb               cmpl r11,rbx
0xde6dc3849e8   da8  0f820a030000         jc 0xde6dc384cf8  <+0x10b8>
0xde6dc3849ee   dae  453bf3               cmpl r14,r11
0xde6dc3849f1   db1  0f8201030000         jc 0xde6dc384cf8  <+0x10b8>
0xde6dc3849f7   db7  443bdb               cmpl r11,rbx
0xde6dc3849fa   dba  0f84f8020000         jz 0xde6dc384cf8  <+0x10b8>
0xde6dc384a00   dc0  458d1c98             leal r11,[r8+rbx*4]
0xde6dc384a04   dc4  448b8528ffffff       movl r8,[rbp-0xd8]
0xde6dc384a0b   dcb  442bc3               subl r8,rbx
0xde6dc384a0e   dce  428d1c8500000000     leal rbx,[r8*4+0x0]
0xde6dc384a16   dd6  478d0483             leal r8,[r11+r8*4]
0xde6dc384a1a   dda  8b8530ffffff         movl rax,[rbp-0xd0]
0xde6dc384a20   de0  660f1f840000000000   nop
0xde6dc384a29   de9  660f1f840000000000   nop
0xde6dc384a32   df2  660f1f840000000000   nop
0xde6dc384a3b   dfb  0f1f440000           nop
0xde6dc384a40   e00  418d5304             leal rdx,[r11+0x4]
0xde6dc384a44   e04  478b3c1c             movl r15,[r12+r11*1]
0xde6dc384a48   e08  443b7dd0             cmpl r15,[rbp-0x30]
0xde6dc384a4c   e0c  0f841f000000         jz 0xde6dc384a71  <+0xe31>
0xde6dc384a52   e12  453bcf               cmpl r9,r15
0xde6dc384a55   e15  0f8616000000         jna 0xde6dc384a71  <+0xe31>
0xde6dc384a5b   e1b  413bc7               cmpl rax,r15
0xde6dc384a5e   e1e  0f860d000000         jna 0xde6dc384a71  <+0xe31>
0xde6dc384a64   e24  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xde6dc384a6b   e2b  0f82d4000000         jc 0xde6dc384b45  <+0xf05>
0xde6dc384a71   e31  83c3fc               addl rbx,0xfc
0xde6dc384a74   e34  0f8452020000         jz 0xde6dc384ccc  <+0x108c>
0xde6dc384a7a   e3a  458d7b08             leal r15,[r11+0x8]
0xde6dc384a7e   e3e  418b1414             movl rdx,[r12+rdx*1]
0xde6dc384a82   e42  3b55d0               cmpl rdx,[rbp-0x30]
0xde6dc384a85   e45  0f841d000000         jz 0xde6dc384aa8  <+0xe68>
0xde6dc384a8b   e4b  443bca               cmpl r9,rdx
0xde6dc384a8e   e4e  0f8614000000         jna 0xde6dc384aa8  <+0xe68>
0xde6dc384a94   e54  3bc2                 cmpl rax,rdx
0xde6dc384a96   e56  0f860c000000         jna 0xde6dc384aa8  <+0xe68>
0xde6dc384a9c   e5c  3b9538ffffff         cmpl rdx,[rbp-0xc8]
0xde6dc384aa2   e62  0f828c000000         jc 0xde6dc384b34  <+0xef4>
0xde6dc384aa8   e68  83c3fc               addl rbx,0xfc
0xde6dc384aab   e6b  0f843c020000         jz 0xde6dc384ced  <+0x10ad>
0xde6dc384ab1   e71  418d530c             leal rdx,[r11+0xc]
0xde6dc384ab5   e75  478b3c3c             movl r15,[r12+r15*1]
0xde6dc384ab9   e79  443b7dd0             cmpl r15,[rbp-0x30]
0xde6dc384abd   e7d  0f841f000000         jz 0xde6dc384ae2  <+0xea2>
0xde6dc384ac3   e83  453bcf               cmpl r9,r15
0xde6dc384ac6   e86  0f8616000000         jna 0xde6dc384ae2  <+0xea2>
0xde6dc384acc   e8c  413bc7               cmpl rax,r15
0xde6dc384acf   e8f  0f860d000000         jna 0xde6dc384ae2  <+0xea2>
0xde6dc384ad5   e95  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xde6dc384adc   e9c  0f8263000000         jc 0xde6dc384b45  <+0xf05>
0xde6dc384ae2   ea2  83c3fc               addl rbx,0xfc
0xde6dc384ae5   ea5  0f84ef010000         jz 0xde6dc384cda  <+0x109a>
0xde6dc384aeb   eab  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc384aef   eaf  0f869d080000         jna 0xde6dc385392  <+0x1752>
0xde6dc384af5   eb5  4183c310             addl r11,0x10
0xde6dc384af9   eb9  458b3c14             movl r15,[r12+rdx*1]
0xde6dc384afd   ebd  443b7dd0             cmpl r15,[rbp-0x30]
0xde6dc384b01   ec1  0f841f000000         jz 0xde6dc384b26  <+0xee6>
0xde6dc384b07   ec7  453bcf               cmpl r9,r15
0xde6dc384b0a   eca  0f8616000000         jna 0xde6dc384b26  <+0xee6>
0xde6dc384b10   ed0  413bc7               cmpl rax,r15
0xde6dc384b13   ed3  0f860d000000         jna 0xde6dc384b26  <+0xee6>
0xde6dc384b19   ed9  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0xde6dc384b20   ee0  0f821c000000         jc 0xde6dc384b42  <+0xf02>
0xde6dc384b26   ee6  83c3fc               addl rbx,0xfc
0xde6dc384b29   ee9  0f8511ffffff         jnz 0xde6dc384a40  <+0xe00>
0xde6dc384b2f   eef  e9a6010000           jmp 0xde6dc384cda  <+0x109a>
0xde6dc384b34   ef4  448bd2               movl r10,rdx
0xde6dc384b37   ef7  418bd7               movl rdx,r15
0xde6dc384b3a   efa  458bfa               movl r15,r10
0xde6dc384b3d   efd  e903000000           jmp 0xde6dc384b45  <+0xf05>
0xde6dc384b42   f02  418bd3               movl rdx,r11
0xde6dc384b45   f05  468d1cbd00000000     leal r11,[r15*4+0x0]
0xde6dc384b4d   f0d  428d1cb9             leal rbx,[rcx+r15*4]
0xde6dc384b51   f11  c4c17a10041c         vmovss xmm0,[r12+rbx*1]
0xde6dc384b57   f17  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xde6dc384b5b   f1b  8b9d58ffffff         movl rbx,[rbp-0xa8]
0xde6dc384b61   f21  428d3cbb             leal rdi,[rbx+r15*4]
0xde6dc384b65   f25  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0xde6dc384b6b   f2b  c52a5cf4             vsubss xmm14,xmm10,xmm4
0xde6dc384b6f   f2f  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0xde6dc384b74   f34  c5e259d3             vmulss xmm2,xmm3,xmm3
0xde6dc384b78   f38  c5ea58c9             vaddss xmm1,xmm2,xmm1
0xde6dc384b7c   f3c  c5f82ef9             vucomiss xmm7,xmm1
0xde6dc384b80   f40  0f870a000000         ja 0xde6dc384b90  <+0xf50>
0xde6dc384b86   f46  c4c17928d0           vmovapd xmm2,xmm8
0xde6dc384b8b   f4b  e90e000000           jmp 0xde6dc384b9e  <+0xf5e>
0xde6dc384b90   f50  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0xde6dc384b94   f54  c5e972f219           vpslld xmm2,xmm2,25
0xde6dc384b99   f59  c5e972d202           vpsrld xmm2,xmm2,2
0xde6dc384b9e   f5e  c5e259da             vmulss xmm3,xmm3,xmm2
0xde6dc384ba2   f62  c4416258e4           vaddss xmm12,xmm3,xmm12
0xde6dc384ba7   f67  c4417a11643448       vmovss [r12+rsi*1+0x48],xmm12
0xde6dc384bae   f6e  c4c16a59de           vmulss xmm3,xmm2,xmm14
0xde6dc384bb3   f73  c4416258c9           vaddss xmm9,xmm3,xmm9
0xde6dc384bb8   f78  c4417a114c3444       vmovss [r12+rsi*1+0x44],xmm9
0xde6dc384bbf   f7f  33ff                 xorl rdi,rdi
0xde6dc384bc1   f81  c4c1782ec8           vucomiss xmm1,xmm8
0xde6dc384bc6   f86  400f97c7             setal dil
0xde6dc384bca   f8a  33c0                 xorl rax,rax
0xde6dc384bcc   f8c  c5f82ecf             vucomiss xmm1,xmm7
0xde6dc384bd0   f90  0f93c0               setncl al
0xde6dc384bd3   f93  4533c9               xorl r9,r9
0xde6dc384bd6   f96  c5f82ef1             vucomiss xmm6,xmm1
0xde6dc384bda   f9a  410f97c1             setal r9l
0xde6dc384bde   f9e  4423c8               andl r9,rax
0xde6dc384be1   fa1  4423cf               andl r9,rdi
0xde6dc384be4   fa4  458bd1               movl r10,r9
0xde6dc384be7   fa7  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0xde6dc384bec   fac  c5d258eb             vaddss xmm5,xmm5,xmm3
0xde6dc384bf0   fb0  c4c17a116c3440       vmovss [r12+rsi*1+0x40],xmm5
0xde6dc384bf7   fb7  8bbd78ffffff         movl rdi,[rbp-0x88]
0xde6dc384bfd   fbd  468d0cbf             leal r9,[rdi+r15*4]
0xde6dc384c01   fc1  8b4580               movl rax,[rbp-0x80]
0xde6dc384c04   fc4  468d3cb8             leal r15,[rax+r15*4]
0xde6dc384c08   fc8  c4e27918e4           vbroadcastss xmm4,xmm4
0xde6dc384c0d   fcd  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0xde6dc384c13   fd3  c4835922043c02       vpinsrd xmm0,xmm4,[r12+r15*1],0x2
0xde6dc384c1a   fda  c4837922040c03       vpinsrd xmm0,xmm0,[r12+r9*1],0x3
0xde6dc384c21   fe1  c4e27918db           vbroadcastss xmm3,xmm3
0xde6dc384c26   fe6  c5f859c3             vmulps xmm0,xmm0,xmm3
0xde6dc384c2a   fea  c51058e8             vaddps xmm13,xmm13,xmm0
0xde6dc384c2e   fee  c4417a7f6c3430       vmovdqu [r12+rsi*1+0x30],xmm13
0xde6dc384c35   ff5  413bd0               cmpl rdx,r8
0xde6dc384c38   ff8  0f84a4000000         jz 0xde6dc384ce2  <+0x10a2>
0xde6dc384c3e   ffe  41bb01000000         movl r11,0x1
0xde6dc384c44  1004  8bdf                 movl rbx,rdi
0xde6dc384c46  1006  8bf9                 movl rdi,rcx
0xde6dc384c48  1008  8bc8                 movl rcx,rax
0xde6dc384c4a  100a  8bc6                 movl rax,rsi
0xde6dc384c4c  100c  448b4dd8             movl r9,[rbp-0x28]
0xde6dc384c50  1010  4533ff               xorl r15,r15
0xde6dc384c53  1013  e9a8f8ffff           jmp 0xde6dc384500  <+0x8c0>
0xde6dc384c58  1018  8bbd48ffffff         movl rdi,[rbp-0xb8]
0xde6dc384c5e  101e  428d0cbf             leal rcx,[rdi+r15*4]
0xde6dc384c62  1022  c4c17a10040c         vmovss xmm0,[r12+rcx*1]
0xde6dc384c68  1028  c5a25cd8             vsubss xmm3,xmm11,xmm0
0xde6dc384c6c  102c  8b8d58ffffff         movl rcx,[rbp-0xa8]
0xde6dc384c72  1032  428d3cb9             leal rdi,[rcx+r15*4]
0xde6dc384c76  1036  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0xde6dc384c7c  103c  c52a5cf4             vsubss xmm14,xmm10,xmm4
0xde6dc384c80  1040  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0xde6dc384c85  1045  c5e259d3             vmulss xmm2,xmm3,xmm3
0xde6dc384c89  1049  c5ea58c9             vaddss xmm1,xmm2,xmm1
0xde6dc384c8d  104d  c5f82ef9             vucomiss xmm7,xmm1
0xde6dc384c91  1051  0f870a000000         ja 0xde6dc384ca1  <+0x1061>
0xde6dc384c97  1057  c4c17928d0           vmovapd xmm2,xmm8
0xde6dc384c9c  105c  e95ff7ffff           jmp 0xde6dc384400  <+0x7c0>
0xde6dc384ca1  1061  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0xde6dc384ca5  1065  c5e972f219           vpslld xmm2,xmm2,25
0xde6dc384caa  106a  c5e972d202           vpsrld xmm2,xmm2,2
0xde6dc384caf  106f  e94cf7ffff           jmp 0xde6dc384400  <+0x7c0>
0xde6dc384cb4  1074  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc384cba  107a  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc384cc0  1080  448b8530ffffff       movl r8,[rbp-0xd0]
0xde6dc384cc7  1087  e938000000           jmp 0xde6dc384d04  <+0x10c4>
0xde6dc384ccc  108c  8bbd20ffffff         movl rdi,[rbp-0xe0]
0xde6dc384cd2  1092  418bd7               movl rdx,r15
0xde6dc384cd5  1095  e913000000           jmp 0xde6dc384ced  <+0x10ad>
0xde6dc384cda  109a  418bd7               movl rdx,r15
0xde6dc384cdd  109d  e90b000000           jmp 0xde6dc384ced  <+0x10ad>
0xde6dc384ce2  10a2  458bfb               movl r15,r11
0xde6dc384ce5  10a5  458bd8               movl r11,r8
0xde6dc384ce8  10a8  e94e000000           jmp 0xde6dc384d3b  <+0x10fb>
0xde6dc384ced  10ad  448bfa               movl r15,rdx
0xde6dc384cf0  10b0  458bd8               movl r11,r8
0xde6dc384cf3  10b3  e943000000           jmp 0xde6dc384d3b  <+0x10fb>
0xde6dc384cf8  10b8  458bfb               movl r15,r11
0xde6dc384cfb  10bb  448b5dc8             movl r11,[rbp-0x38]
0xde6dc384cff  10bf  e937000000           jmp 0xde6dc384d3b  <+0x10fb>
0xde6dc384d04  10c4  8b5de0               movl rbx,[rbp-0x20]
0xde6dc384d07  10c7  c4417a11641c48       vmovss [r12+rbx*1+0x48],xmm12
0xde6dc384d0e  10ce  c4417a114c1c44       vmovss [r12+rbx*1+0x44],xmm9
0xde6dc384d15  10d5  c4c17a116c1c40       vmovss [r12+rbx*1+0x40],xmm5
0xde6dc384d1c  10dc  c4417a7f6c1c30       vmovdqu [r12+rbx*1+0x30],xmm13
0xde6dc384d23  10e3  8bf3                 movl rsi,rbx
0xde6dc384d25  10e5  448bbd28ffffff       movl r15,[rbp-0xd8]
0xde6dc384d2c  10ec  e90a000000           jmp 0xde6dc384d3b  <+0x10fb>
0xde6dc384d31  10f1  8b75e0               movl rsi,[rbp-0x20]
0xde6dc384d34  10f4  448bbd28ffffff       movl r15,[rbp-0xd8]
0xde6dc384d3b  10fb  8d4610               leal rax,[rsi+0x10]
0xde6dc384d3e  10fe  8d7e20               leal rdi,[rsi+0x20]
0xde6dc384d41  1101  448d4630             leal r8,[rsi+0x30]
0xde6dc384d45  1105  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc384d4c  110c  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc384d50  1110  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0xde6dc384d57  1117  8bde                 movl rbx,rsi
0xde6dc384d59  1119  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc384d5d  111d  8b5598               movl rdx,[rbp-0x68]
0xde6dc384d60  1120  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0xde6dc384d65  1125  c5fb105588           vmovsd xmm2,[rbp-0x78]
0xde6dc384d6a  112a  8bcf                 movl rcx,rdi
0xde6dc384d6c  112c  458bc8               movl r9,r8
0xde6dc384d6f  112f  e8d4bff1ff           call 0xde6dc2a0d48  (jump table)
0xde6dc384d74  1134  8b7da0               movl rdi,[rbp-0x60]
0xde6dc384d77  1137  3b7dd0               cmpl rdi,[rbp-0x30]
0xde6dc384d7a  113a  0f866f000000         jna 0xde6dc384def  <+0x11af>
0xde6dc384d80  1140  448b45d0             movl r8,[rbp-0x30]
0xde6dc384d84  1144  448b5da8             movl r11,[rbp-0x58]
0xde6dc384d88  1148  478d2483             leal r12,[r11+r8*4]
0xde6dc384d8c  114c  448b7de0             movl r15,[rbp-0x20]
0xde6dc384d90  1150  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0xde6dc384d97  1157  c4817a10443e10       vmovss xmm0,[r14+r15*1+0x10]
0xde6dc384d9e  115e  c4817a110426         vmovss [r14+r12*1],xmm0
0xde6dc384da4  1164  448b65b0             movl r12,[rbp-0x50]
0xde6dc384da8  1168  438d0484             leal rax,[r12+r8*4]
0xde6dc384dac  116c  c4817a10443e14       vmovss xmm0,[r14+r15*1+0x14]
0xde6dc384db3  1173  c4c17a110406         vmovss [r14+rax*1],xmm0
0xde6dc384db9  1179  8b5db8               movl rbx,[rbp-0x48]
0xde6dc384dbc  117c  428d0483             leal rax,[rbx+r8*4]
0xde6dc384dc0  1180  c4817a10443e18       vmovss xmm0,[r14+r15*1+0x18]
0xde6dc384dc7  1187  c4c17a110406         vmovss [r14+rax*1],xmm0
0xde6dc384dcd  118d  8b55c0               movl rdx,[rbp-0x40]
0xde6dc384dd0  1190  428d0482             leal rax,[rdx+r8*4]
0xde6dc384dd4  1194  c4817a10443e1c       vmovss xmm0,[r14+r15*1+0x1c]
0xde6dc384ddb  119b  c4c17a110406         vmovss [r14+rax*1],xmm0
0xde6dc384de1  11a1  458bd0               movl r10,r8
0xde6dc384de4  11a4  448bc7               movl r8,rdi
0xde6dc384de7  11a7  418bfa               movl rdi,r10
0xde6dc384dea  11aa  e920000000           jmp 0xde6dc384e0f  <+0x11cf>
0xde6dc384def  11af  448bc7               movl r8,rdi
0xde6dc384df2  11b2  8b7dd0               movl rdi,[rbp-0x30]
0xde6dc384df5  11b5  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0xde6dc384dfc  11bc  e90e000000           jmp 0xde6dc384e0f  <+0x11cf>
0xde6dc384e01  11c1  448b45a0             movl r8,[rbp-0x60]
0xde6dc384e05  11c5  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xde6dc384e0c  11cc  4d8bf3               REX.W movq r14,r11
0xde6dc384e0f  11cf  83c701               addl rdi,0x1
0xde6dc384e12  11d2  448b5dd8             movl r11,[rbp-0x28]
0xde6dc384e16  11d6  443bdf               cmpl r11,rdi
0xde6dc384e19  11d9  0f85a1f2ffff         jnz 0xde6dc3840c0  <+0x480>
0xde6dc384e1f  11df  8b7de0               movl rdi,[rbp-0x20]
0xde6dc384e22  11e2  83c750               addl rdi,0x50
0xde6dc384e25  11e5  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xde6dc384e29  11e9  418938               movl [r8],rdi
0xde6dc384e2c  11ec  488be5               REX.W movq rsp,rbp
0xde6dc384e2f  11ef  5d                   pop rbp
0xde6dc384e30  11f0  c3                   retl
0xde6dc384e31  11f1  e89ac6f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc384e36  11f6  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc384e3a  11fa  8b8528ffffff         movl rax,[rbp-0xd8]
0xde6dc384e40  1200  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0xde6dc384e47  1207  e91eeeffff           jmp 0xde6dc383c6a  <+0x2a>
0xde6dc384e4c  120c  c5f92eed             vucomisd xmm5,xmm5
0xde6dc384e50  1210  0f8b0b000000         jpo 0xde6dc384e61  <+0x1221>
0xde6dc384e56  1216  4533ff               xorl r15,r15
0xde6dc384e59  1219  4d8be7               REX.W movq r12,r15
0xde6dc384e5c  121c  e962efffff           jmp 0xde6dc383dc3  <+0x183>
0xde6dc384e61  1221  c5d057ed             vxorps xmm5,xmm5,xmm5
0xde6dc384e65  1225  c5f82eeb             vucomiss xmm5,xmm3
0xde6dc384e69  1229  0f870b000000         ja 0xde6dc384e7a  <+0x123a>
0xde6dc384e6f  122f  41bcffffffff         movl r12,0xffffffff
0xde6dc384e75  1235  e949efffff           jmp 0xde6dc383dc3  <+0x183>
0xde6dc384e7a  123a  4531e4               xorl r12,r12
0xde6dc384e7d  123d  e941efffff           jmp 0xde6dc383dc3  <+0x183>
0xde6dc384e82  1242  c5f92ef6             vucomisd xmm6,xmm6
0xde6dc384e86  1246  0f8b08000000         jpo 0xde6dc384e94  <+0x1254>
0xde6dc384e8c  124c  4531e4               xorl r12,r12
0xde6dc384e8f  124f  e993efffff           jmp 0xde6dc383e27  <+0x1e7>
0xde6dc384e94  1254  c5c857f6             vxorps xmm6,xmm6,xmm6
0xde6dc384e98  1258  c5f82ef5             vucomiss xmm6,xmm5
0xde6dc384e9c  125c  77ee                 ja 0xde6dc384e8c  <+0x124c>
0xde6dc384e9e  125e  41bcffffffff         movl r12,0xffffffff
0xde6dc384ea4  1264  e97eefffff           jmp 0xde6dc383e27  <+0x1e7>
0xde6dc384ea9  1269  48898528ffffff       REX.W movq [rbp-0xd8],rax
0xde6dc384eb0  1270  48897dd0             REX.W movq [rbp-0x30],rdi
0xde6dc384eb4  1274  4c899de8feffff       REX.W movq [rbp-0x118],r11
0xde6dc384ebb  127b  e810c6f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc384ec0  1280  448b4dd8             movl r9,[rbp-0x28]
0xde6dc384ec4  1284  8b7dd0               movl rdi,[rbp-0x30]
0xde6dc384ec7  1287  8b8528ffffff         movl rax,[rbp-0xd8]
0xde6dc384ecd  128d  4c8b9de8feffff       REX.W movq r11,[rbp-0x118]
0xde6dc384ed4  1294  8b5d80               movl rbx,[rbp-0x80]
0xde6dc384ed7  1297  8b9578ffffff         movl rdx,[rbp-0x88]
0xde6dc384edd  129d  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc384ee5  12a5  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc384eed  12ad  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc384ef2  12b2  448bbd58ffffff       movl r15,[rbp-0xa8]
0xde6dc384ef9  12b9  448bb548ffffff       movl r14,[rbp-0xb8]
0xde6dc384f00  12c0  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc384f06  12c6  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc384f0c  12cc  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0xde6dc384f14  12d4  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0xde6dc384f1c  12dc  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0xde6dc384f24  12e4  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0xde6dc384f2c  12ec  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0xde6dc384f34  12f4  448ba590feffff       movl r12,[rbp-0x170]
0xde6dc384f3b  12fb  e9fdf1ffff           jmp 0xde6dc38413d  <+0x4fd>
0xde6dc384f40  1300  c5f92ed2             vucomisd xmm2,xmm2
0xde6dc384f44  1304  0f8b08000000         jpo 0xde6dc384f52  <+0x1312>
0xde6dc384f4a  130a  4533c0               xorl r8,r8
0xde6dc384f4d  130d  e95af3ffff           jmp 0xde6dc3842ac  <+0x66c>
0xde6dc384f52  1312  c441782ec4           vucomiss xmm8,xmm12
0xde6dc384f57  1317  77f1                 ja 0xde6dc384f4a  <+0x130a>
0xde6dc384f59  1319  41b8ffffffff         movl r8,0xffffffff
0xde6dc384f5f  131f  e948f3ffff           jmp 0xde6dc3842ac  <+0x66c>
0xde6dc384f64  1324  c441792ec9           vucomisd xmm9,xmm9
0xde6dc384f69  1329  0f8b08000000         jpo 0xde6dc384f77  <+0x1337>
0xde6dc384f6f  132f  4533c0               xorl r8,r8
0xde6dc384f72  1332  e995f3ffff           jmp 0xde6dc38430c  <+0x6cc>
0xde6dc384f77  1337  c441782ec6           vucomiss xmm8,xmm14
0xde6dc384f7c  133c  77f1                 ja 0xde6dc384f6f  <+0x132f>
0xde6dc384f7e  133e  41b8ffffffff         movl r8,0xffffffff
0xde6dc384f84  1344  e983f3ffff           jmp 0xde6dc38430c  <+0x6cc>
0xde6dc384f89  1349  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc384f91  1351  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc384f99  1359  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc384fa1  1361  4c899df0feffff       REX.W movq [rbp-0x110],r11
0xde6dc384fa8  1368  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc384fb0  1370  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc384fb8  1378  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc384fc0  1380  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc384fc7  1387  e804c5f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc384fcc  138c  448b4dd8             movl r9,[rbp-0x28]
0xde6dc384fd0  1390  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc384fd7  1397  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc384fdf  139f  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc384fe7  13a7  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc384fec  13ac  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc384ff4  13b4  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc384ffc  13bc  448b8530ffffff       movl r8,[rbp-0xd0]
0xde6dc385003  13c3  8b95f8feffff         movl rdx,[rbp-0x108]
0xde6dc385009  13c9  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc38500f  13cf  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc385015  13d5  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc38501b  13db  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc385021  13e1  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc385029  13e9  448b9df0feffff       movl r11,[rbp-0x110]
0xde6dc385030  13f0  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc385038  13f8  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc385040  1400  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc385048  1408  e96ef4ffff           jmp 0xde6dc3844bb  <+0x87b>
0xde6dc38504d  140d  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc385051  1411  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc385059  1419  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc385061  1421  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc385069  1429  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc385071  1431  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc385079  1439  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc385081  1441  4c89bdf0feffff       REX.W movq [rbp-0x110],r15
0xde6dc385088  1448  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc38508f  144f  e83cc4f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc385094  1454  448b4dd8             movl r9,[rbp-0x28]
0xde6dc385098  1458  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc38509f  145f  448b5dc8             movl r11,[rbp-0x38]
0xde6dc3850a3  1463  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc3850ab  146b  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc3850b3  1473  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc3850bb  147b  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc3850c3  1483  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3850cb  148b  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc3850d3  1493  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc3850d8  1498  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc3850e0  14a0  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc3850e8  14a8  448b8530ffffff       movl r8,[rbp-0xd0]
0xde6dc3850ef  14af  8b95f8feffff         movl rdx,[rbp-0x108]
0xde6dc3850f5  14b5  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc3850fb  14bb  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc385101  14c1  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc385107  14c7  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc38510d  14cd  448bbdf0feffff       movl r15,[rbp-0x110]
0xde6dc385114  14d4  e92af4ffff           jmp 0xde6dc384543  <+0x903>
0xde6dc385119  14d9  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc385121  14e1  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc385129  14e9  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc385131  14f1  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc385139  14f9  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc385141  1501  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc385149  1509  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc38514d  150d  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0xde6dc385154  1514  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc38515b  151b  e870c3f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc385160  1520  448b4dd8             movl r9,[rbp-0x28]
0xde6dc385164  1524  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc38516b  152b  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc385173  1533  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc38517b  153b  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc385180  1540  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc385188  1548  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc385190  1550  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc385198  1558  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc3851a0  1560  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc3851a8  1568  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc3851b0  1570  448b8520ffffff       movl r8,[rbp-0xe0]
0xde6dc3851b7  1577  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc3851be  157e  448b5dc8             movl r11,[rbp-0x38]
0xde6dc3851c2  1582  8b95f8feffff         movl rdx,[rbp-0x108]
0xde6dc3851c8  1588  448bbd98feffff       movl r15,[rbp-0x168]
0xde6dc3851cf  158f  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc3851d5  1595  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc3851db  159b  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc3851e1  15a1  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc3851e7  15a7  e97ff4ffff           jmp 0xde6dc38466b  <+0xa2b>
0xde6dc3851ec  15ac  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc3851f4  15b4  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc3851fc  15bc  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc385204  15c4  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc38520c  15cc  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc385214  15d4  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc38521c  15dc  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0xde6dc385223  15e3  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc38522a  15ea  e8a1c2f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc38522f  15ef  448b4dd8             movl r9,[rbp-0x28]
0xde6dc385233  15f3  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc38523a  15fa  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc385242  1602  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc38524a  160a  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc38524f  160f  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc385257  1617  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc38525f  161f  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc385267  1627  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc38526f  162f  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc385277  1637  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc38527f  163f  8b9530ffffff         movl rdx,[rbp-0xd0]
0xde6dc385285  1645  448b8520ffffff       movl r8,[rbp-0xe0]
0xde6dc38528c  164c  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc385293  1653  8bb5d8feffff         movl rsi,[rbp-0x128]
0xde6dc385299  1659  8b8dd0feffff         movl rcx,[rbp-0x130]
0xde6dc38529f  165f  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc3852a5  1665  8b85c0feffff         movl rax,[rbp-0x140]
0xde6dc3852ab  166b  448bbd40ffffff       movl r15,[rbp-0xc0]
0xde6dc3852b2  1672  e9d3f3ffff           jmp 0xde6dc38468a  <+0xa4a>
0xde6dc3852b7  1677  4c895dc8             REX.W movq [rbp-0x38],r11
0xde6dc3852bb  167b  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc3852c3  1683  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc3852cb  168b  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc3852d3  1693  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc3852db  169b  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc3852e3  16a3  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc3852eb  16ab  4889b5f0feffff       REX.W movq [rbp-0x110],rsi
0xde6dc3852f2  16b2  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0xde6dc3852f9  16b9  48898d28ffffff       REX.W movq [rbp-0xd8],rcx
0xde6dc385300  16c0  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc385307  16c7  e8c4c1f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc38530c  16cc  448b4dd8             movl r9,[rbp-0x28]
0xde6dc385310  16d0  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc385317  16d7  448b5dc8             movl r11,[rbp-0x38]
0xde6dc38531b  16db  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc385323  16e3  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc38532b  16eb  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc385330  16f0  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc385338  16f8  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc385340  1700  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc385348  1708  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc385350  1710  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc385358  1718  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc385360  1720  8b9530ffffff         movl rdx,[rbp-0xd0]
0xde6dc385366  1726  448b8520ffffff       movl r8,[rbp-0xe0]
0xde6dc38536d  172d  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc385374  1734  8bb5f0feffff         movl rsi,[rbp-0x110]
0xde6dc38537a  173a  4c8bbd40ffffff       REX.W movq r15,[rbp-0xc0]
0xde6dc385381  1741  8b8d28ffffff         movl rcx,[rbp-0xd8]
0xde6dc385387  1747  8b9dc8feffff         movl rbx,[rbp-0x138]
0xde6dc38538d  174d  e91df4ffff           jmp 0xde6dc3847af  <+0xb6f>
0xde6dc385392  1752  4c8945c8             REX.W movq [rbp-0x38],r8
0xde6dc385396  1756  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0xde6dc38539e  175e  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0xde6dc3853a6  1766  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0xde6dc3853ae  176e  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0xde6dc3853b6  1776  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0xde6dc3853be  177e  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0xde6dc3853c6  1786  488995f0feffff       REX.W movq [rbp-0x110],rdx
0xde6dc3853cd  178d  48899d40ffffff       REX.W movq [rbp-0xc0],rbx
0xde6dc3853d4  1794  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0xde6dc3853db  179b  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0xde6dc3853e2  17a2  e8e9c0f1ff           call 0xde6dc2a14d0  (jump table)
0xde6dc3853e7  17a7  8b75e0               movl rsi,[rbp-0x20]
0xde6dc3853ea  17aa  448b4dd8             movl r9,[rbp-0x28]
0xde6dc3853ee  17ae  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0xde6dc3853f5  17b5  448b45c8             movl r8,[rbp-0x38]
0xde6dc3853f9  17b9  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc385401  17c1  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0xde6dc385409  17c9  c4413857c0           vxorps xmm8,xmm8,xmm8
0xde6dc38540e  17ce  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0xde6dc385416  17d6  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0xde6dc38541e  17de  8b8d48ffffff         movl rcx,[rbp-0xb8]
0xde6dc385424  17e4  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0xde6dc38542c  17ec  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0xde6dc385434  17f4  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0xde6dc38543c  17fc  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0xde6dc385444  1804  8b95f0feffff         movl rdx,[rbp-0x110]
0xde6dc38544a  180a  488b9d40ffffff       REX.W movq rbx,[rbp-0xc0]
0xde6dc385451  1811  8b8530ffffff         movl rax,[rbp-0xd0]
0xde6dc385457  1817  448b9d28ffffff       movl r11,[rbp-0xd8]
0xde6dc38545e  181e  448bb518ffffff       movl r14,[rbp-0xe8]
0xde6dc385465  1825  e98bf6ffff           jmp 0xde6dc384af5  <+0xeb5>
0xde6dc38546a  182a  90                   nop
0xde6dc38546b  182b  90                   nop

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
       7cc         
       7dd         
       815         
       838         
       83f         
       853         
       914         
       a7d         
       a85         
       ac3         
       afa         
       b31         
       b72         
       c1b         
       c35         
       c8d         
       c94         
       d00         
       d07         
       d0e         
       d15         
       d56         
       d5d         
       d64         
       d6b         
       d90         
       d9a         
       e04         
       e3e         
       e75         
       eb9         
       f11         
       f25         
       f67         
       f78         
       fb0         
       fd3         
       fda         
       fee         
      1022         
      1036         
      10c7         
      10ce         
      10d5         
      10dc         
      1157         
      115e         
      116c         
      1173         
      1180         
      1187         
      1194         
      119b         

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
       7c9      1944
       7dd      1959
       815      1992
       838      2018
       83f      2023
       853      2040
       914      1082
       a7d      1206
       a85      1219
       ac3      1279
       c1b      1683
       c35      1701
       c8d      1760
       c94      1765
       cfd      1831
       d07      1838
       d0e      1845
       d15      1852
       d53      1339
       d5d      1346
       d64      1353
       d6b      1360
       d89      1371
       d94      1378
       e04      1440
       f11      1501
       f25      1526
       f67      1555
       f78      1570
       fb0      1603
       fd3      1629
       fda      1634
       fee      1651
      1022      1890
      1036      1915
      10c4      2051
      10ce      2058
      10d5      2065
      10dc      2072
      1105      2100
      114c      2120
      115e      2123
      116c      2133
      1173      2136
      1180      2146
      1187      2149
      1194      2159
      119b      2162
      11f1         0
      1269       624
      1349      1014
      140d      1047
      14d9      1143
      15ac      1156
      1677      1264
      1752      1425

Safepoints (stack slots = 60, entries = 1, byte size = 22)
0xde6dc383edf    29f  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0xde6dc383edb  internal wasm call
0xde6dc384d70  internal wasm call
0xde6dc384e32  wasm stub call  (0xde6dc2a14d0)
0xde6dc384ebc  wasm stub call  (0xde6dc2a14d0)
0xde6dc384fc8  wasm stub call  (0xde6dc2a14d0)
0xde6dc385090  wasm stub call  (0xde6dc2a14d0)
0xde6dc38515c  wasm stub call  (0xde6dc2a14d0)
0xde6dc38522b  wasm stub call  (0xde6dc2a14d0)
0xde6dc385308  wasm stub call  (0xde6dc2a14d0)
0xde6dc3853e3  wasm stub call  (0xde6dc2a14d0)
