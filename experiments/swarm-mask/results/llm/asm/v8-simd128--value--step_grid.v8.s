name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 6400 = 6384 + 16 padding)
Instructions (size = 6360)
0x35d3e83d4c80     0  55                   push rbp
0x35d3e83d4c81     1  4889e5               REX.W movq rbp,rsp
0x35d3e83d4c84     4  6a08                 push 0x8
0x35d3e83d4c86     6  56                   push rsi
0x35d3e83d4c87     7  4881ecc0010000       REX.W subq rsp,0x1c0
0x35d3e83d4c8e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x35d3e83d4c92    12  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x35d3e83d4c99    19  4889bde8feffff       REX.W movq [rbp-0x118],rdi
0x35d3e83d4ca0    20  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d4ca4    24  0f8671120000         jna 0x35d3e83d5f1b  <+0x129b>
0x35d3e83d4caa    2a  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x35d3e83d4cae    2e  458b18               movl r11,[r8]
0x35d3e83d4cb1    31  418d5bb0             leal rbx,[r11-0x50]
0x35d3e83d4cb5    35  418918               movl [r8],rbx
0x35d3e83d4cb8    38  448bd8               movl r11,rax
0x35d3e83d4cbb    3b  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0x35d3e83d4cc2    42  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0x35d3e83d4cc8    48  c5fa16d0             vmovshdup xmm2,xmm0
0x35d3e83d4ccc    4c  41ba0000803a         movl r10,0x3a800000
0x35d3e83d4cd2    52  c4c1796eda           vmovd xmm3,r10
0x35d3e83d4cd7    57  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x35d3e83d4cdb    5b  c5f828c8             vmovaps xmm1,xmm0
0x35d3e83d4cdf    5f  c5e259d9             vmulss xmm3,xmm3,xmm1
0x35d3e83d4ce3    63  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0x35d3e83d4ced    6d  4c8945e8             REX.W movq [rbp-0x18],r8
0x35d3e83d4cf1    71  48895de0             REX.W movq [rbp-0x20],rbx
0x35d3e83d4cf5    75  4c895dd0             REX.W movq [rbp-0x30],r11
0x35d3e83d4cf9    79  c5fb115588           vmovsd [rbp-0x78],xmm2
0x35d3e83d4cfe    7e  c5fb114d90           vmovsd [rbp-0x70],xmm1
0x35d3e83d4d03    83  c5f82eed             vucomiss xmm5,xmm5
0x35d3e83d4d07    87  7a06                 jpe 0x35d3e83d4d0f  <+0x8f>
0x35d3e83d4d09    89  0f8404000000         jz 0x35d3e83d4d13  <+0x93>
0x35d3e83d4d0f    8f  c5f928eb             vmovapd xmm5,xmm3
0x35d3e83d4d13    93  c5f82edb             vucomiss xmm3,xmm3
0x35d3e83d4d17    97  7a06                 jpe 0x35d3e83d4d1f  <+0x9f>
0x35d3e83d4d19    99  0f8404000000         jz 0x35d3e83d4d23  <+0xa3>
0x35d3e83d4d1f    9f  c5f928dd             vmovapd xmm3,xmm5
0x35d3e83d4d23    a3  c5f82eeb             vucomiss xmm5,xmm3
0x35d3e83d4d27    a7  0f8704000000         ja 0x35d3e83d4d31  <+0xb1>
0x35d3e83d4d2d    ad  c5f928eb             vmovapd xmm5,xmm3
0x35d3e83d4d31    b1  c5f82eed             vucomiss xmm5,xmm5
0x35d3e83d4d35    b5  7a06                 jpe 0x35d3e83d4d3d  <+0xbd>
0x35d3e83d4d37    b7  0f8409000000         jz 0x35d3e83d4d46  <+0xc6>
0x35d3e83d4d3d    bd  c5f928dc             vmovapd xmm3,xmm4
0x35d3e83d4d41    c1  e904000000           jmp 0x35d3e83d4d4a  <+0xca>
0x35d3e83d4d46    c6  c5f928dd             vmovapd xmm3,xmm5
0x35d3e83d4d4a    ca  c5f82ee4             vucomiss xmm4,xmm4
0x35d3e83d4d4e    ce  7a06                 jpe 0x35d3e83d4d56  <+0xd6>
0x35d3e83d4d50    d0  0f8404000000         jz 0x35d3e83d4d5a  <+0xda>
0x35d3e83d4d56    d6  c5f928e3             vmovapd xmm4,xmm3
0x35d3e83d4d5a    da  c5f82edc             vucomiss xmm3,xmm4
0x35d3e83d4d5e    de  0f8704000000         ja 0x35d3e83d4d68  <+0xe8>
0x35d3e83d4d64    e4  c5f928dc             vmovapd xmm3,xmm4
0x35d3e83d4d68    e8  41ba0020803f         movl r10,0x3f802000
0x35d3e83d4d6e    ee  c4c1796ee2           vmovd xmm4,r10
0x35d3e83d4d73    f3  c5da59db             vmulss xmm3,xmm4,xmm3
0x35d3e83d4d77    f7  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x35d3e83d4d7b    fb  c5d972f419           vpslld xmm4,xmm4,25
0x35d3e83d4d80   100  c5d972d402           vpsrld xmm4,xmm4,2
0x35d3e83d4d85   105  c5da5edb             vdivss xmm3,xmm4,xmm3
0x35d3e83d4d89   109  c5f828db             vmovaps xmm3,xmm3
0x35d3e83d4d8d   10d  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0x35d3e83d4d97   117  c4e27918db           vbroadcastss xmm3,xmm3
0x35d3e83d4d9c   11c  c5f859c3             vmulps xmm0,xmm0,xmm3
0x35d3e83d4da0   120  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x35d3e83d4da6   126  c5f828d8             vmovaps xmm3,xmm0
0x35d3e83d4daa   12a  c5e25ae3             vcvtss2sd xmm4,xmm3,xmm3
0x35d3e83d4dae   12e  c4e3510bec0b         vroundsd xmm5,xmm5,xmm4,0xb
0x35d3e83d4db4   134  c57b2ce5             vcvttsd2si r12,xmm5
0x35d3e83d4db8   138  4585e4               testl r12,r12
0x35d3e83d4dbb   13b  0f892a000000         jns 0x35d3e83d4deb  <+0x16b>
0x35d3e83d4dc1   141  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x35d3e83d4dcb   14b  c441f96efa           vmovq xmm15,r10
0x35d3e83d4dd0   150  c50358fd             vaddsd xmm15,xmm15,xmm5
0x35d3e83d4dd4   154  c4417b2ce7           vcvttsd2si r12,xmm15
0x35d3e83d4dd9   159  4585e4               testl r12,r12
0x35d3e83d4ddc   15c  0f8809000000         js 0x35d3e83d4deb  <+0x16b>
0x35d3e83d4de2   162  41ba00000080         movl r10,0x80000000
0x35d3e83d4de8   168  450be2               orl r12,r10
0x35d3e83d4deb   16b  4589e2               movl r10,r12
0x35d3e83d4dee   16e  c4c1832af2           vcvtqsi2sd xmm6,xmm15,r10
0x35d3e83d4df3   173  c5f92ef5             vucomisd xmm6,xmm5
0x35d3e83d4df7   177  0f8a39110000         jpe 0x35d3e83d5f36  <+0x12b6>
0x35d3e83d4dfd   17d  0f8533110000         jnz 0x35d3e83d5f36  <+0x12b6>
0x35d3e83d4e03   183  c4c1796edc           vmovd xmm3,r12
0x35d3e83d4e08   188  c5f970db00           vpshufd xmm3,xmm3,0x0
0x35d3e83d4e0d   18d  c5fa16e0             vmovshdup xmm4,xmm0
0x35d3e83d4e11   191  c5da5aec             vcvtss2sd xmm5,xmm4,xmm4
0x35d3e83d4e15   195  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x35d3e83d4e1b   19b  c57b2ce6             vcvttsd2si r12,xmm6
0x35d3e83d4e1f   19f  4585e4               testl r12,r12
0x35d3e83d4e22   1a2  0f8927000000         jns 0x35d3e83d4e4f  <+0x1cf>
0x35d3e83d4e28   1a8  4c8b1594ffffff       REX.W movq r10,[rip+0xffffff94]
0x35d3e83d4e2f   1af  c441f96efa           vmovq xmm15,r10
0x35d3e83d4e34   1b4  c50358fe             vaddsd xmm15,xmm15,xmm6
0x35d3e83d4e38   1b8  c4417b2ce7           vcvttsd2si r12,xmm15
0x35d3e83d4e3d   1bd  4585e4               testl r12,r12
0x35d3e83d4e40   1c0  0f8809000000         js 0x35d3e83d4e4f  <+0x1cf>
0x35d3e83d4e46   1c6  41ba00000080         movl r10,0x80000000
0x35d3e83d4e4c   1cc  450be2               orl r12,r10
0x35d3e83d4e4f   1cf  4589e2               movl r10,r12
0x35d3e83d4e52   1d2  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x35d3e83d4e57   1d7  c5f92efe             vucomisd xmm7,xmm6
0x35d3e83d4e5b   1db  0f8a0b110000         jpe 0x35d3e83d5f6c  <+0x12ec>
0x35d3e83d4e61   1e1  0f8505110000         jnz 0x35d3e83d5f6c  <+0x12ec>
0x35d3e83d4e67   1e7  c4c36122dc01         vpinsrd xmm3,xmm3,r12,0x1
0x35d3e83d4e6d   1ed  49ba0100000001000000 REX.W movq r10,0x100000001
0x35d3e83d4e77   1f7  c4c1f96ee2           vmovq xmm4,r10
0x35d3e83d4e7c   1fc  c5d96ce4             vpunpcklqdq xmm4,xmm4,xmm4
0x35d3e83d4e80   200  c4e2613fdc           vpmaxud xmm3,xmm3,xmm4
0x35d3e83d4e85   205  c5d1efed             vpxor xmm5,xmm5,xmm5
0x35d3e83d4e89   209  c5d0c2f002           vcmpps xmm6,xmm5,xmm0, (le)
0x35d3e83d4e8e   20e  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x35d3e83d4e98   218  c4c1f96efa           vmovq xmm7,r10
0x35d3e83d4e9d   21d  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x35d3e83d4ea1   221  c5f8c2c701           vcmpps xmm0,xmm0,xmm7, (lt)
0x35d3e83d4ea6   226  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x35d3e83d4eaa   22a  c579dffc             vpandn xmm15,xmm0,xmm4
0x35d3e83d4eae   22e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x35d3e83d4eb2   232  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x35d3e83d4eb7   237  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0x35d3e83d4ebe   23e  c4817813041c         vmovlps [r12+r11*1],xmm0
0x35d3e83d4ec4   244  468bbc1fcc000000     movl r15,[rdi+r11*1+0xcc]
0x35d3e83d4ecc   24c  44897c1f28           movl [rdi+rbx*1+0x28],r15
0x35d3e83d4ed1   251  4e8bbc1fc4000000     REX.W movq r15,[rdi+r11*1+0xc4]
0x35d3e83d4ed9   259  4c897c1f20           REX.W movq [rdi+rbx*1+0x20],r15
0x35d3e83d4ede   25e  448d7860             leal r15,[rax+0x60]
0x35d3e83d4ee2   262  428b541f04           movl rdx,[rdi+r11*1+0x4]
0x35d3e83d4ee7   267  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0x35d3e83d4eec   26c  468b741f10           movl r14,[rdi+r11*1+0x10]
0x35d3e83d4ef1   271  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0x35d3e83d4ef6   276  c5f811a580feffff     vmovups [rbp-0x180],xmm4
0x35d3e83d4efe   27e  c5f811ad50feffff     vmovups [rbp-0x1b0],xmm5
0x35d3e83d4f06   286  c5f811bdb0feffff     vmovups [rbp-0x150],xmm7
0x35d3e83d4f0e   28e  4c8965c8             REX.W movq [rbp-0x38],r12
0x35d3e83d4f12   292  418bc7               movl rax,r15
0x35d3e83d4f15   295  418bde               movl rbx,r14
0x35d3e83d4f18   298  e8dbcdf1ff           call 0x35d3e82f1cf8  (jump table)
0x35d3e83d4f1d   29d  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0x35d3e83d4f24   2a4  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x35d3e83d4f28   2a8  468b5c0708           movl r11,[rdi+r8*1+0x8]
0x35d3e83d4f2d   2ad  4c895dd8             REX.W movq [rbp-0x28],r11
0x35d3e83d4f31   2b1  4585db               testl r11,r11
0x35d3e83d4f34   2b4  0f8513000000         jnz 0x35d3e83d4f4d  <+0x2cd>
0x35d3e83d4f3a   2ba  8b5de0               movl rbx,[rbp-0x20]
0x35d3e83d4f3d   2bd  8d7b50               leal rdi,[rbx+0x50]
0x35d3e83d4f40   2c0  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x35d3e83d4f44   2c4  41893c24             movl [r12],rdi
0x35d3e83d4f48   2c8  488be5               REX.W movq rsp,rbp
0x35d3e83d4f4b   2cb  5d                   pop rbp
0x35d3e83d4f4c   2cc  c3                   retl
0x35d3e83d4f4d   2cd  8b8528ffffff         movl rax,[rbp-0xd8]
0x35d3e83d4f53   2d3  8d90a0000000         leal rdx,[rax+0xa0]
0x35d3e83d4f59   2d9  468b64075c           movl r12,[rdi+r8*1+0x5c]
0x35d3e83d4f5e   2de  468b7c0750           movl r15,[rdi+r8*1+0x50]
0x35d3e83d4f63   2e3  468b740744           movl r14,[rdi+r8*1+0x44]
0x35d3e83d4f68   2e8  428b5c0738           movl rbx,[rdi+r8*1+0x38]
0x35d3e83d4f6d   2ed  8bcb                 movl rcx,rbx
0x35d3e83d4f6f   2ef  443bf3               cmpl r14,rbx
0x35d3e83d4f72   2f2  410f42ce             cmovcl rcx,r14
0x35d3e83d4f76   2f6  448bf1               movl r14,rcx
0x35d3e83d4f79   2f9  443bf9               cmpl r15,rcx
0x35d3e83d4f7c   2fc  450f42f7             cmovcl r14,r15
0x35d3e83d4f80   300  458bfe               movl r15,r14
0x35d3e83d4f83   303  453be6               cmpl r12,r14
0x35d3e83d4f86   306  450f42fc             cmovcl r15,r12
0x35d3e83d4f8a   30a  468b640714           movl r12,[rdi+r8*1+0x14]
0x35d3e83d4f8f   30f  468b740720           movl r14,[rdi+r8*1+0x20]
0x35d3e83d4f94   314  428b5c072c           movl rbx,[rdi+r8*1+0x2c]
0x35d3e83d4f99   319  8bcb                 movl rcx,rbx
0x35d3e83d4f9b   31b  443bf3               cmpl r14,rbx
0x35d3e83d4f9e   31e  410f42ce             cmovcl rcx,r14
0x35d3e83d4fa2   322  448bf1               movl r14,rcx
0x35d3e83d4fa5   325  443be1               cmpl r12,rcx
0x35d3e83d4fa8   328  450f42f4             cmovcl r14,r12
0x35d3e83d4fac   32c  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x35d3e83d4fb0   330  c4a17b100403         vmovsd xmm0,[rbx+r8*1]
0x35d3e83d4fb6   336  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x35d3e83d4fbe   33e  c57970f800           vpshufd xmm15,xmm0,0x0
0x35d3e83d4fc3   343  c5f970e300           vpshufd xmm4,xmm3,0x0
0x35d3e83d4fc8   348  c4c3590ee70c         vpblendw xmm4,xmm4,xmm15,0xc
0x35d3e83d4fce   34e  c4e2793fc3           vpmaxud xmm0,xmm0,xmm3
0x35d3e83d4fd3   353  c5f9fac3             vpsubd xmm0,xmm0,xmm3
0x35d3e83d4fd7   357  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0x35d3e83d4fdc   35c  428b74074c           movl rsi,[rdi+r8*1+0x4c]
0x35d3e83d4fe1   361  468b4c0740           movl r9,[rdi+r8*1+0x40]
0x35d3e83d4fe6   366  4c897da0             REX.W movq [rbp-0x60],r15
0x35d3e83d4fea   36a  468b7c0734           movl r15,[rdi+r8*1+0x34]
0x35d3e83d4fef   36f  48895dc0             REX.W movq [rbp-0x40],rbx
0x35d3e83d4ff3   373  428b5c077c           movl rbx,[rdi+r8*1+0x7c]
0x35d3e83d4ff8   378  48895598             REX.W movq [rbp-0x68],rdx
0x35d3e83d4ffc   37c  428b940780000000     movl rdx,[rdi+r8*1+0x80]
0x35d3e83d5004   384  488975b8             REX.W movq [rbp-0x48],rsi
0x35d3e83d5008   388  428b740764           movl rsi,[rdi+r8*1+0x64]
0x35d3e83d500d   38d  4c894db0             REX.W movq [rbp-0x50],r9
0x35d3e83d5011   391  468b4c0768           movl r9,[rdi+r8*1+0x68]
0x35d3e83d5016   396  48898d38ffffff       REX.W movq [rbp-0xc8],rcx
0x35d3e83d501d   39d  428b8c0788000000     movl rcx,[rdi+r8*1+0x88]
0x35d3e83d5025   3a5  c4a17a10ac0784000000 vmovss xmm5,[rdi+r8*1+0x84]
0x35d3e83d502f   3af  4c89a530ffffff       REX.W movq [rbp-0xd0],r12
0x35d3e83d5036   3b6  468b64071c           movl r12,[rdi+r8*1+0x1c]
0x35d3e83d503b   3bb  468b5c0728           movl r11,[rdi+r8*1+0x28]
0x35d3e83d5040   3c0  4c89b590feffff       REX.W movq [rbp-0x170],r14
0x35d3e83d5047   3c7  468b740710           movl r14,[rdi+r8*1+0x10]
0x35d3e83d504c   3cc  4c895d80             REX.W movq [rbp-0x80],r11
0x35d3e83d5050   3d0  468b5c0704           movl r11,[rdi+r8*1+0x4]
0x35d3e83d5055   3d5  c4a17a10b407a0000000 vmovss xmm6,[rdi+r8*1+0xa0]
0x35d3e83d505f   3df  c5ca59f6             vmulss xmm6,xmm6,xmm6
0x35d3e83d5063   3e3  c4a17a10bc07a4000000 vmovss xmm7,[rdi+r8*1+0xa4]
0x35d3e83d506d   3ed  c5c259ff             vmulss xmm7,xmm7,xmm7
0x35d3e83d5071   3f1  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0x35d3e83d5079   3f9  c5f8118530feffff     vmovups [rbp-0x1d0],xmm0
0x35d3e83d5081   401  4c897da8             REX.W movq [rbp-0x58],r15
0x35d3e83d5085   405  48899d20ffffff       REX.W movq [rbp-0xe0],rbx
0x35d3e83d508c   40c  48899518ffffff       REX.W movq [rbp-0xe8],rdx
0x35d3e83d5093   413  4889b5d8feffff       REX.W movq [rbp-0x128],rsi
0x35d3e83d509a   41a  4c898dd0feffff       REX.W movq [rbp-0x130],r9
0x35d3e83d50a1   421  48898da8feffff       REX.W movq [rbp-0x158],rcx
0x35d3e83d50a8   428  c5fb11ade0feffff     vmovsd [rbp-0x120],xmm5
0x35d3e83d50b0   430  4c89a578ffffff       REX.W movq [rbp-0x88],r12
0x35d3e83d50b7   437  4c89b548ffffff       REX.W movq [rbp-0xb8],r14
0x35d3e83d50be   43e  4c899d58ffffff       REX.W movq [rbp-0xa8],r11
0x35d3e83d50c5   445  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0x35d3e83d50cd   44d  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x35d3e83d50d5   455  418bc9               movl rcx,r9
0x35d3e83d50d8   458  458bfb               movl r15,r11
0x35d3e83d50db   45b  4c8bdf               REX.W movq r11,rdi
0x35d3e83d50de   45e  33ff                 xorl rdi,rdi
0x35d3e83d50e0   460  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d50e4   464  4489e3               movl rbx,r12
0x35d3e83d50e7   467  48897dc8             REX.W movq [rbp-0x38],rdi
0x35d3e83d50eb   46b  e96c000000           jmp 0x35d3e83d515c  <+0x4dc>
0x35d3e83d50f0   470  660f1f840000000000   nop
0x35d3e83d50f9   479  0f1f8000000000       nop
0x35d3e83d5100   480  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0x35d3e83d5108   488  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x35d3e83d5110   490  8b8528ffffff         movl rax,[rbp-0xd8]
0x35d3e83d5116   496  458bcb               movl r9,r11
0x35d3e83d5119   499  4d8bde               REX.W movq r11,r14
0x35d3e83d511c   49c  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0x35d3e83d5124   4a4  8b9d78ffffff         movl rbx,[rbp-0x88]
0x35d3e83d512a   4aa  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x35d3e83d5132   4b2  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d513a   4ba  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d5142   4c2  448bbd58ffffff       movl r15,[rbp-0xa8]
0x35d3e83d5149   4c9  448bb548ffffff       movl r14,[rbp-0xb8]
0x35d3e83d5150   4d0  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d5156   4d6  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d515c   4dc  8b5580               movl rdx,[rbp-0x80]
0x35d3e83d515f   4df  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d5164   4e4  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0x35d3e83d516c   4ec  448ba590feffff       movl r12,[rbp-0x170]
0x35d3e83d5173   4f3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d5177   4f7  0f86160e0000         jna 0x35d3e83d5f93  <+0x1313>
0x35d3e83d517d   4fd  443be7               cmpl r12,rdi
0x35d3e83d5180   500  0f86650d0000         jna 0x35d3e83d5eeb  <+0x126b>
0x35d3e83d5186   506  458d04bf             leal r8,[r15+rdi*4]
0x35d3e83d518a   50a  c4017a101403         vmovss xmm10,[r11+r8*1]
0x35d3e83d5190   510  458d04be             leal r8,[r14+rdi*4]
0x35d3e83d5194   514  c4017a101c03         vmovss xmm11,[r11+r8*1]
0x35d3e83d519a   51a  448d04bb             leal r8,[rbx+rdi*4]
0x35d3e83d519e   51e  c4017a102403         vmovss xmm12,[r11+r8*1]
0x35d3e83d51a4   524  448d04ba             leal r8,[rdx+rdi*4]
0x35d3e83d51a8   528  c4017a102c03         vmovss xmm13,[r11+r8*1]
0x35d3e83d51ae   52e  448b65e0             movl r12,[rbp-0x20]
0x35d3e83d51b2   532  c4017a116c230c       vmovss [r11+r12*1+0xc],xmm13
0x35d3e83d51b9   539  c4017a11642308       vmovss [r11+r12*1+0x8],xmm12
0x35d3e83d51c0   540  c4017a115c2304       vmovss [r11+r12*1+0x4],xmm11
0x35d3e83d51c7   547  c4017a111423         vmovss [r11+r12*1],xmm10
0x35d3e83d51cd   54d  43c744234800000000   movl [r11+r12*1+0x48],0x0
0x35d3e83d51d6   556  4bc744234000000000   REX.W movq [r11+r12*1+0x40],0x0
0x35d3e83d51df   55f  c44119efe4           vpxor xmm12,xmm12,xmm12
0x35d3e83d51e4   564  c4017a7f642330       vmovdqu [r11+r12*1+0x30],xmm12
0x35d3e83d51eb   56b  c52a59e5             vmulss xmm12,xmm10,xmm5
0x35d3e83d51ef   56f  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0x35d3e83d51f5   575  48897dd0             REX.W movq [rbp-0x30],rdi
0x35d3e83d51f9   579  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x35d3e83d5200   580  c441782ee4           vucomiss xmm12,xmm12
0x35d3e83d5205   585  7a06                 jpe 0x35d3e83d520d  <+0x58d>
0x35d3e83d5207   587  0f8405000000         jz 0x35d3e83d5212  <+0x592>
0x35d3e83d520d   58d  c4417928e0           vmovapd xmm12,xmm8
0x35d3e83d5212   592  c441782ee0           vucomiss xmm12,xmm8
0x35d3e83d5217   597  0f8705000000         ja 0x35d3e83d5222  <+0x5a2>
0x35d3e83d521d   59d  c4417928e0           vmovapd xmm12,xmm8
0x35d3e83d5222   5a2  c4427918ec           vbroadcastss xmm13,xmm12
0x35d3e83d5227   5a7  c4415259f3           vmulss xmm14,xmm5,xmm11
0x35d3e83d522c   5ac  c443090af609         vroundss xmm14,xmm14,xmm14,0x9
0x35d3e83d5232   5b2  c441782ef6           vucomiss xmm14,xmm14
0x35d3e83d5237   5b7  7a06                 jpe 0x35d3e83d523f  <+0x5bf>
0x35d3e83d5239   5b9  0f8405000000         jz 0x35d3e83d5244  <+0x5c4>
0x35d3e83d523f   5bf  c4417928f0           vmovapd xmm14,xmm8
0x35d3e83d5244   5c4  c441782ef0           vucomiss xmm14,xmm8
0x35d3e83d5249   5c9  0f870a000000         ja 0x35d3e83d5259  <+0x5d9>
0x35d3e83d524f   5cf  c4c17928c8           vmovapd xmm1,xmm8
0x35d3e83d5254   5d4  e905000000           jmp 0x35d3e83d525e  <+0x5de>
0x35d3e83d5259   5d9  c4c17928ce           vmovapd xmm1,xmm14
0x35d3e83d525e   5de  c441797ef0           vmovd r8,xmm14
0x35d3e83d5263   5e3  4585c0               testl r8,r8
0x35d3e83d5266   5e6  0f8404000000         jz 0x35d3e83d5270  <+0x5f0>
0x35d3e83d526c   5ec  c57928f1             vmovapd xmm14,xmm1
0x35d3e83d5270   5f0  c5782ec1             vucomiss xmm8,xmm1
0x35d3e83d5274   5f4  7a06                 jpe 0x35d3e83d527c  <+0x5fc>
0x35d3e83d5276   5f6  0f8404000000         jz 0x35d3e83d5280  <+0x600>
0x35d3e83d527c   5fc  c57928f1             vmovapd xmm14,xmm1
0x35d3e83d5280   600  c4431121ee10         vinsertps xmm13,xmm13,xmm14,0x10
0x35d3e83d5286   606  c44110c2e901         vcmpps xmm13,xmm13,xmm9, (lt)
0x35d3e83d528c   60c  c5f96ec8             vmovd xmm1,rax
0x35d3e83d5290   610  c5f970c900           vpshufd xmm1,xmm1,0x0
0x35d3e83d5295   615  c4c11a5ad4           vcvtss2sd xmm2,xmm12,xmm12
0x35d3e83d529a   61a  c4e3510bea0b         vroundsd xmm5,xmm5,xmm2,0xb
0x35d3e83d52a0   620  c57b2cc5             vcvttsd2si r8,xmm5
0x35d3e83d52a4   624  4585c0               testl r8,r8
0x35d3e83d52a7   627  0f8927000000         jns 0x35d3e83d52d4  <+0x654>
0x35d3e83d52ad   62d  4c8b150ffbffff       REX.W movq r10,[rip+0xfffffb0f]
0x35d3e83d52b4   634  c441f96efa           vmovq xmm15,r10
0x35d3e83d52b9   639  c50358fd             vaddsd xmm15,xmm15,xmm5
0x35d3e83d52bd   63d  c4417b2cc7           vcvttsd2si r8,xmm15
0x35d3e83d52c2   642  4585c0               testl r8,r8
0x35d3e83d52c5   645  0f8809000000         js 0x35d3e83d52d4  <+0x654>
0x35d3e83d52cb   64b  41ba00000080         movl r10,0x80000000
0x35d3e83d52d1   651  450bc2               orl r8,r10
0x35d3e83d52d4   654  458bd0               movl r10,r8
0x35d3e83d52d7   657  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x35d3e83d52dc   65c  c5792ecd             vucomisd xmm9,xmm5
0x35d3e83d52e0   660  0f8a440d0000         jpe 0x35d3e83d602a  <+0x13aa>
0x35d3e83d52e6   666  0f853e0d0000         jnz 0x35d3e83d602a  <+0x13aa>
0x35d3e83d52ec   66c  c4c37122e800         vpinsrd xmm5,xmm1,r8,0x0
0x35d3e83d52f2   672  c4410a5ace           vcvtss2sd xmm9,xmm14,xmm14
0x35d3e83d52f7   677  c443190be10b         vroundsd xmm12,xmm12,xmm9,0xb
0x35d3e83d52fd   67d  c4417b2cc4           vcvttsd2si r8,xmm12
0x35d3e83d5302   682  4585c0               testl r8,r8
0x35d3e83d5305   685  0f8928000000         jns 0x35d3e83d5333  <+0x6b3>
0x35d3e83d530b   68b  4c8b15b1faffff       REX.W movq r10,[rip+0xfffffab1]
0x35d3e83d5312   692  c441f96efa           vmovq xmm15,r10
0x35d3e83d5317   697  c4410358fc           vaddsd xmm15,xmm15,xmm12
0x35d3e83d531c   69c  c4417b2cc7           vcvttsd2si r8,xmm15
0x35d3e83d5321   6a1  4585c0               testl r8,r8
0x35d3e83d5324   6a4  0f8809000000         js 0x35d3e83d5333  <+0x6b3>
0x35d3e83d532a   6aa  41ba00000080         movl r10,0x80000000
0x35d3e83d5330   6b0  450bc2               orl r8,r10
0x35d3e83d5333   6b3  458bd0               movl r10,r8
0x35d3e83d5336   6b6  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x35d3e83d533b   6bb  c4c1792ecc           vucomisd xmm1,xmm12
0x35d3e83d5340   6c0  0f8a080d0000         jpe 0x35d3e83d604e  <+0x13ce>
0x35d3e83d5346   6c6  0f85020d0000         jnz 0x35d3e83d604e  <+0x13ce>
0x35d3e83d534c   6cc  c4c35122e801         vpinsrd xmm5,xmm5,r8,0x1
0x35d3e83d5352   6d2  c4e2793bed           vpminud xmm5,xmm0,xmm5
0x35d3e83d5357   6d7  c591dbed             vpand xmm5,xmm13,xmm5
0x35d3e83d535b   6db  c551fecb             vpaddd xmm9,xmm5,xmm3
0x35d3e83d535f   6df  c442793bc9           vpminud xmm9,xmm0,xmm9
0x35d3e83d5364   6e4  c4425940e1           vpmulld xmm12,xmm4,xmm9
0x35d3e83d5369   6e9  c4437916e001         vpextrd r8,xmm12,0x1
0x35d3e83d536f   6ef  c5f97ee8             vmovd rax,xmm5
0x35d3e83d5373   6f3  4533db               xorl r11,r11
0x35d3e83d5376   6f6  85c0                 testl rax,rax
0x35d3e83d5378   6f8  410f95c3             setnzl r11l
0x35d3e83d537c   6fc  412bc3               subl rax,r11
0x35d3e83d537f   6ff  468d1c00             leal r11,[rax+r8*1]
0x35d3e83d5383   703  4531e4               xorl r12,r12
0x35d3e83d5386   706  443bd9               cmpl r11,rcx
0x35d3e83d5389   709  410f92c4             setcl r12l
0x35d3e83d538d   70d  c44159fee1           vpaddd xmm12,xmm4,xmm9
0x35d3e83d5392   712  c5797ee2             vmovd rdx,xmm12
0x35d3e83d5396   716  4403c2               addl r8,rdx
0x35d3e83d5399   719  33db                 xorl rbx,rbx
0x35d3e83d539b   71b  443bc1               cmpl r8,rcx
0x35d3e83d539e   71e  0f92c3               setcl bl
0x35d3e83d53a1   721  4421e3               andl rbx,r12
0x35d3e83d53a4   724  c4c37916ec01         vpextrd r12,xmm5,0x1
0x35d3e83d53aa   72a  48899d00ffffff       REX.W movq [rbp-0x100],rbx
0x35d3e83d53b1   731  33db                 xorl rbx,rbx
0x35d3e83d53b3   733  4585e4               testl r12,r12
0x35d3e83d53b6   736  0f95c3               setnzl bl
0x35d3e83d53b9   739  442be3               subl r12,rbx
0x35d3e83d53bc   73c  468d0486             leal r8,[rsi+r8*4]
0x35d3e83d53c0   740  468d1c9e             leal r11,[rsi+r11*4]
0x35d3e83d53c4   744  c4637916cb01         vpextrd rbx,xmm9,0x1
0x35d3e83d53ca   74a  488985c0feffff       REX.W movq [rbp-0x140],rax
0x35d3e83d53d1   751  488995c8feffff       REX.W movq [rbp-0x138],rdx
0x35d3e83d53d8   758  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0x35d3e83d53df   75f  4c899d10ffffff       REX.W movq [rbp-0xf0],r11
0x35d3e83d53e6   766  48899df8feffff       REX.W movq [rbp-0x108],rbx
0x35d3e83d53ed   76d  c4c17928e8           vmovapd xmm5,xmm8
0x35d3e83d53f2   772  4c89a598feffff       REX.W movq [rbp-0x168],r12
0x35d3e83d53f9   779  448b8530ffffff       movl r8,[rbp-0xd0]
0x35d3e83d5400   780  4533db               xorl r11,r11
0x35d3e83d5403   783  c4417928c8           vmovapd xmm9,xmm8
0x35d3e83d5408   788  c4417928e0           vmovapd xmm12,xmm8
0x35d3e83d540d   78d  c57810ad50feffff     vmovups xmm13,[rbp-0x1b0]
0x35d3e83d5415   795  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d541c   79c  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0x35d3e83d5423   7a3  e9a1000000           jmp 0x35d3e83d54c9  <+0x849>
0x35d3e83d5428   7a8  660f1f840000000000   nop
0x35d3e83d5431   7b1  660f1f840000000000   nop
0x35d3e83d543a   7ba  660f1f440000         nop
0x35d3e83d5440   7c0  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x35d3e83d5445   7c5  c4417a11643c30       vmovss [r12+rdi*1+0x30],xmm12
0x35d3e83d544c   7cc  c4c1796ed9           vmovd xmm3,r9
0x35d3e83d5451   7d1  c5f970db00           vpshufd xmm3,xmm3,0x0
0x35d3e83d5456   7d6  c5e172f31f           vpslld xmm3,xmm3,31
0x35d3e83d545b   7db  c5e172e31f           vpsrad xmm3,xmm3,31
0x35d3e83d5460   7e0  c5d957e4             vxorpd xmm4,xmm4,xmm4
0x35d3e83d5464   7e4  49ba000000000000803f REX.W movq r10,0x3f80000000000000
0x35d3e83d546e   7ee  c4c3d922e201         vpinsrq xmm4,xmm4,r10,0x1
0x35d3e83d5474   7f4  c4e35921e000         vinsertps xmm4,xmm4,xmm0,0x0
0x35d3e83d547a   7fa  8b8d78ffffff         movl rcx,[rbp-0x88]
0x35d3e83d5480   800  428d34b9             leal rsi,[rcx+r15*4]
0x35d3e83d5484   804  c4c17a100434         vmovss xmm0,[r12+rsi*1]
0x35d3e83d548a   80a  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0x35d3e83d5490   810  8b7580               movl rsi,[rbp-0x80]
0x35d3e83d5493   813  468d3cbe             leal r15,[rsi+r15*4]
0x35d3e83d5497   817  c4817a10043c         vmovss xmm0,[r12+r15*1]
0x35d3e83d549d   81d  c4e35921e020         vinsertps xmm4,xmm4,xmm0,0x20
0x35d3e83d54a3   823  c5e1dbc4             vpand xmm0,xmm3,xmm4
0x35d3e83d54a7   827  c51058e8             vaddps xmm13,xmm13,xmm0
0x35d3e83d54ab   82b  c4417a7f6c3c34       vmovdqu [r12+rdi*1+0x34],xmm13
0x35d3e83d54b2   832  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d54b6   836  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d54bc   83c  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d54c2   842  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d54c6   846  458bde               movl r11,r14
0x35d3e83d54c9   849  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d54cd   84d  0f86a00b0000         jna 0x35d3e83d6073  <+0x13f3>
0x35d3e83d54d3   853  4585db               testl r11,r11
0x35d3e83d54d6   856  0f841a000000         jz 0x35d3e83d54f6  <+0x876>
0x35d3e83d54dc   85c  443b5dc8             cmpl r11,[rbp-0x38]
0x35d3e83d54e0   860  0f8410000000         jz 0x35d3e83d54f6  <+0x876>
0x35d3e83d54e6   866  48c78528ffffff00000000 REX.W movq [rbp-0xd8],0x0
0x35d3e83d54f1   871  e90b000000           jmp 0x35d3e83d5501  <+0x881>
0x35d3e83d54f6   876  48c78528ffffff01000000 REX.W movq [rbp-0xd8],0x1
0x35d3e83d5501   881  458bfb               movl r15,r11
0x35d3e83d5504   884  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d5508   888  e96c000000           jmp 0x35d3e83d5579  <+0x8f9>
0x35d3e83d550d   88d  660f1f840000000000   nop
0x35d3e83d5516   896  660f1f840000000000   nop
0x35d3e83d551f   89f  660f1f840000000000   nop
0x35d3e83d5528   8a8  660f1f840000000000   nop
0x35d3e83d5531   8b1  660f1f840000000000   nop
0x35d3e83d553a   8ba  660f1f440000         nop
0x35d3e83d5540   8c0  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0x35d3e83d5547   8c7  458bd8               movl r11,r8
0x35d3e83d554a   8ca  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d5550   8d0  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0x35d3e83d5557   8d7  448bfa               movl r15,rdx
0x35d3e83d555a   8da  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d5560   8e0  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d5566   8e6  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d556c   8ec  8b9df8feffff         movl rbx,[rbp-0x108]
0x35d3e83d5572   8f2  448b8530ffffff       movl r8,[rbp-0xd0]
0x35d3e83d5579   8f9  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d557d   8fd  0f86b40b0000         jna 0x35d3e83d6137  <+0x14b7>
0x35d3e83d5583   903  83bd28ffffff00       cmpl [rbp-0xd8],0x0
0x35d3e83d558a   90a  0f8596000000         jnz 0x35d3e83d5626  <+0x9a6>
0x35d3e83d5590   910  458d7704             leal r14,[r15+0x4]
0x35d3e83d5594   914  478b3c3c             movl r15,[r12+r15*1]
0x35d3e83d5598   918  443b7dd0             cmpl r15,[rbp-0x30]
0x35d3e83d559c   91c  0f841f000000         jz 0x35d3e83d55c1  <+0x941>
0x35d3e83d55a2   922  453bcf               cmpl r9,r15
0x35d3e83d55a5   925  0f8616000000         jna 0x35d3e83d55c1  <+0x941>
0x35d3e83d55ab   92b  453bc7               cmpl r8,r15
0x35d3e83d55ae   92e  0f860d000000         jna 0x35d3e83d55c1  <+0x941>
0x35d3e83d55b4   934  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0x35d3e83d55bb   93b  0f8232070000         jc 0x35d3e83d5cf3  <+0x1073>
0x35d3e83d55c1   941  453bf3               cmpl r14,r11
0x35d3e83d55c4   944  0f842b000000         jz 0x35d3e83d55f5  <+0x975>
0x35d3e83d55ca   94a  458bc3               movl r8,r11
0x35d3e83d55cd   94d  418bd6               movl rdx,r14
0x35d3e83d55d0   950  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d55d7   957  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x35d3e83d55dd   95d  448b9d40ffffff       movl r11,[rbp-0xc0]
0x35d3e83d55e4   964  8b9d78ffffff         movl rbx,[rbp-0x88]
0x35d3e83d55ea   96a  8b4580               movl rax,[rbp-0x80]
0x35d3e83d55ed   96d  8b4de0               movl rcx,[rbp-0x20]
0x35d3e83d55f0   970  e9f6060000           jmp 0x35d3e83d5ceb  <+0x106b>
0x35d3e83d55f5   975  41bf01000000         movl r15,0x1
0x35d3e83d55fb   97b  458bc3               movl r8,r11
0x35d3e83d55fe   97e  448b9d40ffffff       movl r11,[rbp-0xc0]
0x35d3e83d5605   985  418bd6               movl rdx,r14
0x35d3e83d5608   988  8b4de0               movl rcx,[rbp-0x20]
0x35d3e83d560b   98b  8b4580               movl rax,[rbp-0x80]
0x35d3e83d560e   98e  8b9d78ffffff         movl rbx,[rbp-0x88]
0x35d3e83d5614   994  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x35d3e83d561a   99a  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d5621   9a1  e91affffff           jmp 0x35d3e83d5540  <+0x8c0>
0x35d3e83d5626   9a6  f68540ffffffff       testb [rbp-0xc0],0xff
0x35d3e83d562d   9ad  0f85e8070000         jnz 0x35d3e83d5e1b  <+0x119b>
0x35d3e83d5633   9b3  3b9d98feffff         cmpl rbx,[rbp-0x168]
0x35d3e83d5639   9b9  0f82ad070000         jc 0x35d3e83d5dec  <+0x116c>
0x35d3e83d563f   9bf  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d5646   9c6  448b8520ffffff       movl r8,[rbp-0xe0]
0x35d3e83d564d   9cd  e94f000000           jmp 0x35d3e83d56a1  <+0xa21>
0x35d3e83d5652   9d2  660f1f840000000000   nop
0x35d3e83d565b   9db  660f1f840000000000   nop
0x35d3e83d5664   9e4  660f1f840000000000   nop
0x35d3e83d566d   9ed  660f1f840000000000   nop
0x35d3e83d5676   9f6  660f1f840000000000   nop
0x35d3e83d567f   9ff  90                   nop
0x35d3e83d5680   a00  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x35d3e83d5687   a07  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d568d   a0d  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d5693   a13  8bd9                 movl rbx,rcx
0x35d3e83d5695   a15  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d569b   a1b  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d56a1   a21  448bbd98feffff       movl r15,[rbp-0x168]
0x35d3e83d56a8   a28  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d56ac   a2c  0f86510b0000         jna 0x35d3e83d6203  <+0x1583>
0x35d3e83d56b2   a32  413bdf               cmpl rbx,r15
0x35d3e83d56b5   a35  0f8663030000         jna 0x35d3e83d5a1e  <+0xd9e>
0x35d3e83d56bb   a3b  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d56bf   a3f  8b9d30ffffff         movl rbx,[rbp-0xd0]
0x35d3e83d56c5   a45  660f1f840000000000   nop
0x35d3e83d56ce   a4e  660f1f840000000000   nop
0x35d3e83d56d7   a57  660f1f840000000000   nop
0x35d3e83d56e0   a60  660f1f840000000000   nop
0x35d3e83d56e9   a69  660f1f840000000000   nop
0x35d3e83d56f2   a72  660f1f840000000000   nop
0x35d3e83d56fb   a7b  0f1f440000           nop
0x35d3e83d5700   a80  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d5704   a84  0f86cc0b0000         jna 0x35d3e83d62d6  <+0x1656>
0x35d3e83d570a   a8a  458d5f01             leal r11,[r15+0x1]
0x35d3e83d570e   a8e  4c899d98feffff       REX.W movq [rbp-0x168],r11
0x35d3e83d5715   a95  448b9da8feffff       movl r11,[rbp-0x158]
0x35d3e83d571c   a9c  450fafdf             imull r11,r15
0x35d3e83d5720   aa0  468d3c18             leal r15,[rax+r11*1]
0x35d3e83d5724   aa4  413bcf               cmpl rcx,r15
0x35d3e83d5727   aa7  0f8654010000         jna 0x35d3e83d5881  <+0xc01>
0x35d3e83d572d   aad  4403da               addl r11,rdx
0x35d3e83d5730   ab0  413bcb               cmpl rcx,r11
0x35d3e83d5733   ab3  0f8648010000         jna 0x35d3e83d5881  <+0xc01>
0x35d3e83d5739   ab9  468d1c9e             leal r11,[rsi+r11*4]
0x35d3e83d573d   abd  478b1c1c             movl r11,[r12+r11*1]
0x35d3e83d5741   ac1  468d3cbe             leal r15,[rsi+r15*4]
0x35d3e83d5745   ac5  478b3c3c             movl r15,[r12+r15*1]
0x35d3e83d5749   ac9  453bdf               cmpl r11,r15
0x35d3e83d574c   acc  0f822f010000         jc 0x35d3e83d5881  <+0xc01>
0x35d3e83d5752   ad2  453bf3               cmpl r14,r11
0x35d3e83d5755   ad5  0f8226010000         jc 0x35d3e83d5881  <+0xc01>
0x35d3e83d575b   adb  453bdf               cmpl r11,r15
0x35d3e83d575e   ade  0f841d010000         jz 0x35d3e83d5881  <+0xc01>
0x35d3e83d5764   ae4  438d0cb8             leal rcx,[r8+r15*4]
0x35d3e83d5768   ae8  452bdf               subl r11,r15
0x35d3e83d576b   aeb  468d3c9d00000000     leal r15,[r11*4+0x0]
0x35d3e83d5773   af3  468d1c99             leal r11,[rcx+r11*4]
0x35d3e83d5777   af7  660f1f840000000000   nop
0x35d3e83d5780   b00  8d7104               leal rsi,[rcx+0x4]
0x35d3e83d5783   b03  418b040c             movl rax,[r12+rcx*1]
0x35d3e83d5787   b07  3b45d0               cmpl rax,[rbp-0x30]
0x35d3e83d578a   b0a  0f841d000000         jz 0x35d3e83d57ad  <+0xb2d>
0x35d3e83d5790   b10  443bc8               cmpl r9,rax
0x35d3e83d5793   b13  0f8614000000         jna 0x35d3e83d57ad  <+0xb2d>
0x35d3e83d5799   b19  3bd8                 cmpl rbx,rax
0x35d3e83d579b   b1b  0f860c000000         jna 0x35d3e83d57ad  <+0xb2d>
0x35d3e83d57a1   b21  3b8538ffffff         cmpl rax,[rbp-0xc8]
0x35d3e83d57a7   b27  0f82ed000000         jc 0x35d3e83d589a  <+0xc1a>
0x35d3e83d57ad   b2d  4183c7fc             addl r15,0xfc
0x35d3e83d57b1   b31  0f84af000000         jz 0x35d3e83d5866  <+0xbe6>
0x35d3e83d57b7   b37  8d4108               leal rax,[rcx+0x8]
0x35d3e83d57ba   b3a  418b3434             movl rsi,[r12+rsi*1]
0x35d3e83d57be   b3e  3b75d0               cmpl rsi,[rbp-0x30]
0x35d3e83d57c1   b41  0f841d000000         jz 0x35d3e83d57e4  <+0xb64>
0x35d3e83d57c7   b47  443bce               cmpl r9,rsi
0x35d3e83d57ca   b4a  0f8614000000         jna 0x35d3e83d57e4  <+0xb64>
0x35d3e83d57d0   b50  3bde                 cmpl rbx,rsi
0x35d3e83d57d2   b52  0f860c000000         jna 0x35d3e83d57e4  <+0xb64>
0x35d3e83d57d8   b58  3bb538ffffff         cmpl rsi,[rbp-0xc8]
0x35d3e83d57de   b5e  0f82c8000000         jc 0x35d3e83d58ac  <+0xc2c>
0x35d3e83d57e4   b64  4183c7fc             addl r15,0xfc
0x35d3e83d57e8   b68  0f847a000000         jz 0x35d3e83d5868  <+0xbe8>
0x35d3e83d57ee   b6e  8d710c               leal rsi,[rcx+0xc]
0x35d3e83d57f1   b71  418b0404             movl rax,[r12+rax*1]
0x35d3e83d57f5   b75  3b45d0               cmpl rax,[rbp-0x30]
0x35d3e83d57f8   b78  0f841d000000         jz 0x35d3e83d581b  <+0xb9b>
0x35d3e83d57fe   b7e  443bc8               cmpl r9,rax
0x35d3e83d5801   b81  0f8614000000         jna 0x35d3e83d581b  <+0xb9b>
0x35d3e83d5807   b87  3bd8                 cmpl rbx,rax
0x35d3e83d5809   b89  0f860c000000         jna 0x35d3e83d581b  <+0xb9b>
0x35d3e83d580f   b8f  3b8538ffffff         cmpl rax,[rbp-0xc8]
0x35d3e83d5815   b95  0f82a7000000         jc 0x35d3e83d58c2  <+0xc42>
0x35d3e83d581b   b9b  4183c7fc             addl r15,0xfc
0x35d3e83d581f   b9f  0f8441000000         jz 0x35d3e83d5866  <+0xbe6>
0x35d3e83d5825   ba5  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d5829   ba9  0f86720b0000         jna 0x35d3e83d63a1  <+0x1721>
0x35d3e83d582f   baf  83c110               addl rcx,0x10
0x35d3e83d5832   bb2  418b0434             movl rax,[r12+rsi*1]
0x35d3e83d5836   bb6  3b45d0               cmpl rax,[rbp-0x30]
0x35d3e83d5839   bb9  0f841d000000         jz 0x35d3e83d585c  <+0xbdc>
0x35d3e83d583f   bbf  443bc8               cmpl r9,rax
0x35d3e83d5842   bc2  0f8614000000         jna 0x35d3e83d585c  <+0xbdc>
0x35d3e83d5848   bc8  3bd8                 cmpl rbx,rax
0x35d3e83d584a   bca  0f860c000000         jna 0x35d3e83d585c  <+0xbdc>
0x35d3e83d5850   bd0  3b8538ffffff         cmpl rax,[rbp-0xc8]
0x35d3e83d5856   bd6  0f825d000000         jc 0x35d3e83d58b9  <+0xc39>
0x35d3e83d585c   bdc  4183c7fc             addl r15,0xfc
0x35d3e83d5860   be0  0f851affffff         jnz 0x35d3e83d5780  <+0xb00>
0x35d3e83d5866   be6  8bf0                 movl rsi,rax
0x35d3e83d5868   be8  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d586c   bec  448bde               movl r11,rsi
0x35d3e83d586f   bef  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d5875   bf5  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d587b   bfb  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d5881   c01  448bbd98feffff       movl r15,[rbp-0x168]
0x35d3e83d5888   c08  443bbdf8feffff       cmpl r15,[rbp-0x108]
0x35d3e83d588f   c0f  0f8470010000         jz 0x35d3e83d5a05  <+0xd85>
0x35d3e83d5895   c15  e966feffff           jmp 0x35d3e83d5700  <+0xa80>
0x35d3e83d589a   c1a  448bbdd8feffff       movl r15,[rbp-0x128]
0x35d3e83d58a1   c21  8b8dc0feffff         movl rcx,[rbp-0x140]
0x35d3e83d58a7   c27  e916000000           jmp 0x35d3e83d58c2  <+0xc42>
0x35d3e83d58ac   c2c  448bd6               movl r10,rsi
0x35d3e83d58af   c2f  8bf0                 movl rsi,rax
0x35d3e83d58b1   c31  418bc2               movl rax,r10
0x35d3e83d58b4   c34  e909000000           jmp 0x35d3e83d58c2  <+0xc42>
0x35d3e83d58b9   c39  8bf1                 movl rsi,rcx
0x35d3e83d58bb   c3b  448bbdc0feffff       movl r15,[rbp-0x140]
0x35d3e83d58c2   c42  8b8d58ffffff         movl rcx,[rbp-0xa8]
0x35d3e83d58c8   c48  448d3c81             leal r15,[rcx+rax*4]
0x35d3e83d58cc   c4c  c4017a10343c         vmovss xmm14,[r12+r15*1]
0x35d3e83d58d2   c52  c4c12a5cce           vsubss xmm1,xmm10,xmm14
0x35d3e83d58d7   c57  c5f259d1             vmulss xmm2,xmm1,xmm1
0x35d3e83d58db   c5b  448bbd48ffffff       movl r15,[rbp-0xb8]
0x35d3e83d58e2   c62  418d1487             leal rdx,[r15+rax*4]
0x35d3e83d58e6   c66  c4c17a100414         vmovss xmm0,[r12+rdx*1]
0x35d3e83d58ec   c6c  c5a25cd8             vsubss xmm3,xmm11,xmm0
0x35d3e83d58f0   c70  c5e259e3             vmulss xmm4,xmm3,xmm3
0x35d3e83d58f4   c74  c5da58e2             vaddss xmm4,xmm4,xmm2
0x35d3e83d58f8   c78  33d2                 xorl rdx,rdx
0x35d3e83d58fa   c7a  c4c1782ee0           vucomiss xmm4,xmm8
0x35d3e83d58ff   c7f  0f97c2               setal dl
0x35d3e83d5902   c82  33c9                 xorl rcx,rcx
0x35d3e83d5904   c84  c5f82ee7             vucomiss xmm4,xmm7
0x35d3e83d5908   c88  0f93c1               setncl cl
0x35d3e83d590b   c8b  33db                 xorl rbx,rbx
0x35d3e83d590d   c8d  c5f82ef4             vucomiss xmm6,xmm4
0x35d3e83d5911   c91  0f97c3               setal bl
0x35d3e83d5914   c94  23d9                 andl rbx,rcx
0x35d3e83d5916   c96  23da                 andl rbx,rdx
0x35d3e83d5918   c98  0f8505000000         jnz 0x35d3e83d5923  <+0xca3>
0x35d3e83d591e   c9e  c4417928f0           vmovapd xmm14,xmm8
0x35d3e83d5923   ca3  c4410a58e4           vaddss xmm12,xmm14,xmm12
0x35d3e83d5928   ca8  c5796ef3             vmovd xmm14,rbx
0x35d3e83d592c   cac  c4417970f600         vpshufd xmm14,xmm14,0x0
0x35d3e83d5932   cb2  c4c10972f61f         vpslld xmm14,xmm14,31
0x35d3e83d5938   cb8  c4c10972e61f         vpsrad xmm14,xmm14,31
0x35d3e83d593e   cbe  c5e957d2             vxorpd xmm2,xmm2,xmm2
0x35d3e83d5942   cc2  4c8b151dfbffff       REX.W movq r10,[rip+0xfffffb1d]
0x35d3e83d5949   cc9  c4c3e922d201         vpinsrq xmm2,xmm2,r10,0x1
0x35d3e83d594f   ccf  c4e36921d000         vinsertps xmm2,xmm2,xmm0,0x0
0x35d3e83d5955   cd5  8b9d78ffffff         movl rbx,[rbp-0x88]
0x35d3e83d595b   cdb  8d1483               leal rdx,[rbx+rax*4]
0x35d3e83d595e   cde  c4c17a100414         vmovss xmm0,[r12+rdx*1]
0x35d3e83d5964   ce4  c4e36921d010         vinsertps xmm2,xmm2,xmm0,0x10
0x35d3e83d596a   cea  8b5580               movl rdx,[rbp-0x80]
0x35d3e83d596d   ced  8d0482               leal rax,[rdx+rax*4]
0x35d3e83d5970   cf0  c4c17a100404         vmovss xmm0,[r12+rax*1]
0x35d3e83d5976   cf6  c4e36921d020         vinsertps xmm2,xmm2,xmm0,0x20
0x35d3e83d597c   cfc  c589dbc2             vpand xmm0,xmm14,xmm2
0x35d3e83d5980   d00  c51058e8             vaddps xmm13,xmm13,xmm0
0x35d3e83d5984   d04  33c0                 xorl rax,rax
0x35d3e83d5986   d06  c5f82efc             vucomiss xmm7,xmm4
0x35d3e83d598a   d0a  0f97c0               setal al
0x35d3e83d598d   d0d  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x35d3e83d5994   d14  85c0                 testl rax,rax
0x35d3e83d5996   d16  0f850f000000         jnz 0x35d3e83d59ab  <+0xd2b>
0x35d3e83d599c   d1c  c4413258c8           vaddss xmm9,xmm9,xmm8
0x35d3e83d59a1   d21  c4c17928c8           vmovapd xmm1,xmm8
0x35d3e83d59a6   d26  e905000000           jmp 0x35d3e83d59b0  <+0xd30>
0x35d3e83d59ab   d2b  c4416258c9           vaddss xmm9,xmm3,xmm9
0x35d3e83d59b0   d30  c5f258ed             vaddss xmm5,xmm1,xmm5
0x35d3e83d59b4   d34  413bf3               cmpl rsi,r11
0x35d3e83d59b7   d37  0f8517000000         jnz 0x35d3e83d59d4  <+0xd54>
0x35d3e83d59bd   d3d  8b8df8feffff         movl rcx,[rbp-0x108]
0x35d3e83d59c3   d43  3b8d98feffff         cmpl rcx,[rbp-0x168]
0x35d3e83d59c9   d49  0f83b1fcffff         jnc 0x35d3e83d5680  <+0xa00>
0x35d3e83d59cf   d4f  e9c6030000           jmp 0x35d3e83d5d9a  <+0x111a>
0x35d3e83d59d4   d54  8b4de0               movl rcx,[rbp-0x20]
0x35d3e83d59d7   d57  c4417a114c0c48       vmovss [r12+rcx*1+0x48],xmm9
0x35d3e83d59de   d5e  c4c17a116c0c44       vmovss [r12+rcx*1+0x44],xmm5
0x35d3e83d59e5   d65  c4417a7f6c0c34       vmovdqu [r12+rcx*1+0x34],xmm13
0x35d3e83d59ec   d6c  c4417a11640c30       vmovss [r12+rcx*1+0x30],xmm12
0x35d3e83d59f3   d73  458bc3               movl r8,r11
0x35d3e83d59f6   d76  418bff               movl rdi,r15
0x35d3e83d59f9   d79  8bc2                 movl rax,rdx
0x35d3e83d59fb   d7b  4533db               xorl r11,r11
0x35d3e83d59fe   d7e  8bd6                 movl rdx,rsi
0x35d3e83d5a00   d80  e9e6020000           jmp 0x35d3e83d5ceb  <+0x106b>
0x35d3e83d5a05   d85  458bfb               movl r15,r11
0x35d3e83d5a08   d88  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d5a0c   d8c  8b9df8feffff         movl rbx,[rbp-0x108]
0x35d3e83d5a12   d92  48899d98feffff       REX.W movq [rbp-0x168],rbx
0x35d3e83d5a19   d99  e90e000000           jmp 0x35d3e83d5a2c  <+0xdac>
0x35d3e83d5a1e   d9e  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0x35d3e83d5a25   da5  448bbd28ffffff       movl r15,[rbp-0xd8]
0x35d3e83d5a2c   dac  8b75e0               movl rsi,[rbp-0x20]
0x35d3e83d5a2f   daf  c4417a114c3448       vmovss [r12+rsi*1+0x48],xmm9
0x35d3e83d5a36   db6  c4c17a116c3444       vmovss [r12+rsi*1+0x44],xmm5
0x35d3e83d5a3d   dbd  c4417a7f6c3434       vmovdqu [r12+rsi*1+0x34],xmm13
0x35d3e83d5a44   dc4  c4417a11643430       vmovss [r12+rsi*1+0x30],xmm12
0x35d3e83d5a4b   dcb  8b8d48ffffff         movl rcx,[rbp-0xb8]
0x35d3e83d5a51   dd1  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d5a55   dd5  83bd00ffffff00       cmpl [rbp-0x100],0x0
0x35d3e83d5a5c   ddc  0f84c3030000         jz 0x35d3e83d5e25  <+0x11a5>
0x35d3e83d5a62   de2  448bbd08ffffff       movl r15,[rbp-0xf8]
0x35d3e83d5a69   de9  478b1c3c             movl r11,[r12+r15*1]
0x35d3e83d5a6d   ded  8b8510ffffff         movl rax,[rbp-0xf0]
0x35d3e83d5a73   df3  418b1c04             movl rbx,[r12+rax*1]
0x35d3e83d5a77   df7  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x35d3e83d5a7e   dfe  443bdb               cmpl r11,rbx
0x35d3e83d5a81   e01  0f8259030000         jc 0x35d3e83d5de0  <+0x1160>
0x35d3e83d5a87   e07  453bf3               cmpl r14,r11
0x35d3e83d5a8a   e0a  0f8250030000         jc 0x35d3e83d5de0  <+0x1160>
0x35d3e83d5a90   e10  443bdb               cmpl r11,rbx
0x35d3e83d5a93   e13  0f8447030000         jz 0x35d3e83d5de0  <+0x1160>
0x35d3e83d5a99   e19  458d1c98             leal r11,[r8+rbx*4]
0x35d3e83d5a9d   e1d  448b8528ffffff       movl r8,[rbp-0xd8]
0x35d3e83d5aa4   e24  442bc3               subl r8,rbx
0x35d3e83d5aa7   e27  428d1c8500000000     leal rbx,[r8*4+0x0]
0x35d3e83d5aaf   e2f  478d0483             leal r8,[r11+r8*4]
0x35d3e83d5ab3   e33  8b8530ffffff         movl rax,[rbp-0xd0]
0x35d3e83d5ab9   e39  0f1f8000000000       nop
0x35d3e83d5ac0   e40  418d5304             leal rdx,[r11+0x4]
0x35d3e83d5ac4   e44  478b3c1c             movl r15,[r12+r11*1]
0x35d3e83d5ac8   e48  443b7dd0             cmpl r15,[rbp-0x30]
0x35d3e83d5acc   e4c  0f841f000000         jz 0x35d3e83d5af1  <+0xe71>
0x35d3e83d5ad2   e52  453bcf               cmpl r9,r15
0x35d3e83d5ad5   e55  0f8616000000         jna 0x35d3e83d5af1  <+0xe71>
0x35d3e83d5adb   e5b  413bc7               cmpl rax,r15
0x35d3e83d5ade   e5e  0f860d000000         jna 0x35d3e83d5af1  <+0xe71>
0x35d3e83d5ae4   e64  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0x35d3e83d5aeb   e6b  0f82d4000000         jc 0x35d3e83d5bc5  <+0xf45>
0x35d3e83d5af1   e71  83c3fc               addl rbx,0xfc
0x35d3e83d5af4   e74  0f84ba020000         jz 0x35d3e83d5db4  <+0x1134>
0x35d3e83d5afa   e7a  458d7b08             leal r15,[r11+0x8]
0x35d3e83d5afe   e7e  418b1414             movl rdx,[r12+rdx*1]
0x35d3e83d5b02   e82  3b55d0               cmpl rdx,[rbp-0x30]
0x35d3e83d5b05   e85  0f841d000000         jz 0x35d3e83d5b28  <+0xea8>
0x35d3e83d5b0b   e8b  443bca               cmpl r9,rdx
0x35d3e83d5b0e   e8e  0f8614000000         jna 0x35d3e83d5b28  <+0xea8>
0x35d3e83d5b14   e94  3bc2                 cmpl rax,rdx
0x35d3e83d5b16   e96  0f860c000000         jna 0x35d3e83d5b28  <+0xea8>
0x35d3e83d5b1c   e9c  3b9538ffffff         cmpl rdx,[rbp-0xc8]
0x35d3e83d5b22   ea2  0f828c000000         jc 0x35d3e83d5bb4  <+0xf34>
0x35d3e83d5b28   ea8  83c3fc               addl rbx,0xfc
0x35d3e83d5b2b   eab  0f84a4020000         jz 0x35d3e83d5dd5  <+0x1155>
0x35d3e83d5b31   eb1  418d530c             leal rdx,[r11+0xc]
0x35d3e83d5b35   eb5  478b3c3c             movl r15,[r12+r15*1]
0x35d3e83d5b39   eb9  443b7dd0             cmpl r15,[rbp-0x30]
0x35d3e83d5b3d   ebd  0f841f000000         jz 0x35d3e83d5b62  <+0xee2>
0x35d3e83d5b43   ec3  453bcf               cmpl r9,r15
0x35d3e83d5b46   ec6  0f8616000000         jna 0x35d3e83d5b62  <+0xee2>
0x35d3e83d5b4c   ecc  413bc7               cmpl rax,r15
0x35d3e83d5b4f   ecf  0f860d000000         jna 0x35d3e83d5b62  <+0xee2>
0x35d3e83d5b55   ed5  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0x35d3e83d5b5c   edc  0f8263000000         jc 0x35d3e83d5bc5  <+0xf45>
0x35d3e83d5b62   ee2  83c3fc               addl rbx,0xfc
0x35d3e83d5b65   ee5  0f8457020000         jz 0x35d3e83d5dc2  <+0x1142>
0x35d3e83d5b6b   eeb  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e83d5b6f   eef  0f8607090000         jna 0x35d3e83d647c  <+0x17fc>
0x35d3e83d5b75   ef5  4183c310             addl r11,0x10
0x35d3e83d5b79   ef9  458b3c14             movl r15,[r12+rdx*1]
0x35d3e83d5b7d   efd  443b7dd0             cmpl r15,[rbp-0x30]
0x35d3e83d5b81   f01  0f841f000000         jz 0x35d3e83d5ba6  <+0xf26>
0x35d3e83d5b87   f07  453bcf               cmpl r9,r15
0x35d3e83d5b8a   f0a  0f8616000000         jna 0x35d3e83d5ba6  <+0xf26>
0x35d3e83d5b90   f10  413bc7               cmpl rax,r15
0x35d3e83d5b93   f13  0f860d000000         jna 0x35d3e83d5ba6  <+0xf26>
0x35d3e83d5b99   f19  443bbd38ffffff       cmpl r15,[rbp-0xc8]
0x35d3e83d5ba0   f20  0f821c000000         jc 0x35d3e83d5bc2  <+0xf42>
0x35d3e83d5ba6   f26  83c3fc               addl rbx,0xfc
0x35d3e83d5ba9   f29  0f8511ffffff         jnz 0x35d3e83d5ac0  <+0xe40>
0x35d3e83d5baf   f2f  e90e020000           jmp 0x35d3e83d5dc2  <+0x1142>
0x35d3e83d5bb4   f34  448bd2               movl r10,rdx
0x35d3e83d5bb7   f37  418bd7               movl rdx,r15
0x35d3e83d5bba   f3a  458bfa               movl r15,r10
0x35d3e83d5bbd   f3d  e903000000           jmp 0x35d3e83d5bc5  <+0xf45>
0x35d3e83d5bc2   f42  418bd3               movl rdx,r11
0x35d3e83d5bc5   f45  468d1cbd00000000     leal r11,[r15*4+0x0]
0x35d3e83d5bcd   f4d  428d1cb9             leal rbx,[rcx+r15*4]
0x35d3e83d5bd1   f51  c4c17a10041c         vmovss xmm0,[r12+rbx*1]
0x35d3e83d5bd7   f57  c5a25cd8             vsubss xmm3,xmm11,xmm0
0x35d3e83d5bdb   f5b  8b9d58ffffff         movl rbx,[rbp-0xa8]
0x35d3e83d5be1   f61  428d3cbb             leal rdi,[rbx+r15*4]
0x35d3e83d5be5   f65  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0x35d3e83d5beb   f6b  c52a5cf4             vsubss xmm14,xmm10,xmm4
0x35d3e83d5bef   f6f  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0x35d3e83d5bf4   f74  c5e259d3             vmulss xmm2,xmm3,xmm3
0x35d3e83d5bf8   f78  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x35d3e83d5bfc   f7c  c5f82ef9             vucomiss xmm7,xmm1
0x35d3e83d5c00   f80  0f8716000000         ja 0x35d3e83d5c1c  <+0xf9c>
0x35d3e83d5c06   f86  c4413258c8           vaddss xmm9,xmm9,xmm8
0x35d3e83d5c0b   f8b  c4417a114c3448       vmovss [r12+rsi*1+0x48],xmm9
0x35d3e83d5c12   f92  c4417928f0           vmovapd xmm14,xmm8
0x35d3e83d5c17   f97  e90c000000           jmp 0x35d3e83d5c28  <+0xfa8>
0x35d3e83d5c1c   f9c  c4416258c9           vaddss xmm9,xmm3,xmm9
0x35d3e83d5c21   fa1  c4417a114c3448       vmovss [r12+rsi*1+0x48],xmm9
0x35d3e83d5c28   fa8  c58a58ed             vaddss xmm5,xmm14,xmm5
0x35d3e83d5c2c   fac  c4c17a116c3444       vmovss [r12+rsi*1+0x44],xmm5
0x35d3e83d5c33   fb3  33ff                 xorl rdi,rdi
0x35d3e83d5c35   fb5  c4c1782ec8           vucomiss xmm1,xmm8
0x35d3e83d5c3a   fba  400f97c7             setal dil
0x35d3e83d5c3e   fbe  33c0                 xorl rax,rax
0x35d3e83d5c40   fc0  c5f82ecf             vucomiss xmm1,xmm7
0x35d3e83d5c44   fc4  0f93c0               setncl al
0x35d3e83d5c47   fc7  4533c9               xorl r9,r9
0x35d3e83d5c4a   fca  c5f82ef1             vucomiss xmm6,xmm1
0x35d3e83d5c4e   fce  410f97c1             setal r9l
0x35d3e83d5c52   fd2  4423c8               andl r9,rax
0x35d3e83d5c55   fd5  4423cf               andl r9,rdi
0x35d3e83d5c58   fd8  0f8505000000         jnz 0x35d3e83d5c63  <+0xfe3>
0x35d3e83d5c5e   fde  c4c17928e0           vmovapd xmm4,xmm8
0x35d3e83d5c63   fe3  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x35d3e83d5c68   fe8  c4417a11643430       vmovss [r12+rsi*1+0x30],xmm12
0x35d3e83d5c6f   fef  c4c1796ed9           vmovd xmm3,r9
0x35d3e83d5c74   ff4  c5f970db00           vpshufd xmm3,xmm3,0x0
0x35d3e83d5c79   ff9  c5e172f31f           vpslld xmm3,xmm3,31
0x35d3e83d5c7e   ffe  c5e172e31f           vpsrad xmm3,xmm3,31
0x35d3e83d5c83  1003  c5d957e4             vxorpd xmm4,xmm4,xmm4
0x35d3e83d5c87  1007  4c8b15d8f7ffff       REX.W movq r10,[rip+0xfffff7d8]
0x35d3e83d5c8e  100e  c4c3d922e201         vpinsrq xmm4,xmm4,r10,0x1
0x35d3e83d5c94  1014  c4e35921e000         vinsertps xmm4,xmm4,xmm0,0x0
0x35d3e83d5c9a  101a  8bbd78ffffff         movl rdi,[rbp-0x88]
0x35d3e83d5ca0  1020  428d04bf             leal rax,[rdi+r15*4]
0x35d3e83d5ca4  1024  c4c17a100404         vmovss xmm0,[r12+rax*1]
0x35d3e83d5caa  102a  c4e35921e010         vinsertps xmm4,xmm4,xmm0,0x10
0x35d3e83d5cb0  1030  8b4580               movl rax,[rbp-0x80]
0x35d3e83d5cb3  1033  468d3cb8             leal r15,[rax+r15*4]
0x35d3e83d5cb7  1037  c4817a10043c         vmovss xmm0,[r12+r15*1]
0x35d3e83d5cbd  103d  c4e35921e020         vinsertps xmm4,xmm4,xmm0,0x20
0x35d3e83d5cc3  1043  c5e1dbc4             vpand xmm0,xmm3,xmm4
0x35d3e83d5cc7  1047  c51058e8             vaddps xmm13,xmm13,xmm0
0x35d3e83d5ccb  104b  c4417a7f6c3434       vmovdqu [r12+rsi*1+0x34],xmm13
0x35d3e83d5cd2  1052  413bd0               cmpl rdx,r8
0x35d3e83d5cd5  1055  0f84ef000000         jz 0x35d3e83d5dca  <+0x114a>
0x35d3e83d5cdb  105b  41bb01000000         movl r11,0x1
0x35d3e83d5ce1  1061  8bdf                 movl rbx,rdi
0x35d3e83d5ce3  1063  8bf9                 movl rdi,rcx
0x35d3e83d5ce5  1065  8bce                 movl rcx,rsi
0x35d3e83d5ce7  1067  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d5ceb  106b  4533ff               xorl r15,r15
0x35d3e83d5cee  106e  e94df8ffff           jmp 0x35d3e83d5540  <+0x8c0>
0x35d3e83d5cf3  1073  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x35d3e83d5cf9  1079  428d0cbf             leal rcx,[rdi+r15*4]
0x35d3e83d5cfd  107d  c4c17a10040c         vmovss xmm0,[r12+rcx*1]
0x35d3e83d5d03  1083  c5a25cd8             vsubss xmm3,xmm11,xmm0
0x35d3e83d5d07  1087  8b8d58ffffff         movl rcx,[rbp-0xa8]
0x35d3e83d5d0d  108d  428d3cb9             leal rdi,[rcx+r15*4]
0x35d3e83d5d11  1091  c4c17a10243c         vmovss xmm4,[r12+rdi*1]
0x35d3e83d5d17  1097  c52a5cf4             vsubss xmm14,xmm10,xmm4
0x35d3e83d5d1b  109b  c4c10a59ce           vmulss xmm1,xmm14,xmm14
0x35d3e83d5d20  10a0  c5e259d3             vmulss xmm2,xmm3,xmm3
0x35d3e83d5d24  10a4  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x35d3e83d5d28  10a8  c5f82ef9             vucomiss xmm7,xmm1
0x35d3e83d5d2c  10ac  0f8719000000         ja 0x35d3e83d5d4b  <+0x10cb>
0x35d3e83d5d32  10b2  c4413258c8           vaddss xmm9,xmm9,xmm8
0x35d3e83d5d37  10b7  8b7de0               movl rdi,[rbp-0x20]
0x35d3e83d5d3a  10ba  c4417a114c3c48       vmovss [r12+rdi*1+0x48],xmm9
0x35d3e83d5d41  10c1  c4417928f0           vmovapd xmm14,xmm8
0x35d3e83d5d46  10c6  e90f000000           jmp 0x35d3e83d5d5a  <+0x10da>
0x35d3e83d5d4b  10cb  c4416258c9           vaddss xmm9,xmm3,xmm9
0x35d3e83d5d50  10d0  8b7de0               movl rdi,[rbp-0x20]
0x35d3e83d5d53  10d3  c4417a114c3c48       vmovss [r12+rdi*1+0x48],xmm9
0x35d3e83d5d5a  10da  c58a58ed             vaddss xmm5,xmm14,xmm5
0x35d3e83d5d5e  10de  c4c17a116c3c44       vmovss [r12+rdi*1+0x44],xmm5
0x35d3e83d5d65  10e5  33c9                 xorl rcx,rcx
0x35d3e83d5d67  10e7  c4c1782ec8           vucomiss xmm1,xmm8
0x35d3e83d5d6c  10ec  0f97c1               setal cl
0x35d3e83d5d6f  10ef  33f6                 xorl rsi,rsi
0x35d3e83d5d71  10f1  c5f82ecf             vucomiss xmm1,xmm7
0x35d3e83d5d75  10f5  400f93c6             setncl sil
0x35d3e83d5d79  10f9  4533c9               xorl r9,r9
0x35d3e83d5d7c  10fc  c5f82ef1             vucomiss xmm6,xmm1
0x35d3e83d5d80  1100  410f97c1             setal r9l
0x35d3e83d5d84  1104  4423ce               andl r9,rsi
0x35d3e83d5d87  1107  4423c9               andl r9,rcx
0x35d3e83d5d8a  110a  0f85b0f6ffff         jnz 0x35d3e83d5440  <+0x7c0>
0x35d3e83d5d90  1110  c4c17928e0           vmovapd xmm4,xmm8
0x35d3e83d5d95  1115  e9a6f6ffff           jmp 0x35d3e83d5440  <+0x7c0>
0x35d3e83d5d9a  111a  8bfa                 movl rdi,rdx
0x35d3e83d5d9c  111c  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d5da2  1122  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d5da8  1128  448b8530ffffff       movl r8,[rbp-0xd0]
0x35d3e83d5daf  112f  e93e000000           jmp 0x35d3e83d5df2  <+0x1172>
0x35d3e83d5db4  1134  8bbd20ffffff         movl rdi,[rbp-0xe0]
0x35d3e83d5dba  113a  418bd7               movl rdx,r15
0x35d3e83d5dbd  113d  e913000000           jmp 0x35d3e83d5dd5  <+0x1155>
0x35d3e83d5dc2  1142  418bd7               movl rdx,r15
0x35d3e83d5dc5  1145  e90b000000           jmp 0x35d3e83d5dd5  <+0x1155>
0x35d3e83d5dca  114a  458bfb               movl r15,r11
0x35d3e83d5dcd  114d  458bd8               movl r11,r8
0x35d3e83d5dd0  1150  e950000000           jmp 0x35d3e83d5e25  <+0x11a5>
0x35d3e83d5dd5  1155  448bfa               movl r15,rdx
0x35d3e83d5dd8  1158  458bd8               movl r11,r8
0x35d3e83d5ddb  115b  e945000000           jmp 0x35d3e83d5e25  <+0x11a5>
0x35d3e83d5de0  1160  458bfb               movl r15,r11
0x35d3e83d5de3  1163  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d5de7  1167  e939000000           jmp 0x35d3e83d5e25  <+0x11a5>
0x35d3e83d5dec  116c  8b8528ffffff         movl rax,[rbp-0xd8]
0x35d3e83d5df2  1172  8b5de0               movl rbx,[rbp-0x20]
0x35d3e83d5df5  1175  c4417a114c1c48       vmovss [r12+rbx*1+0x48],xmm9
0x35d3e83d5dfc  117c  c4c17a116c1c44       vmovss [r12+rbx*1+0x44],xmm5
0x35d3e83d5e03  1183  c4417a7f6c1c34       vmovdqu [r12+rbx*1+0x34],xmm13
0x35d3e83d5e0a  118a  c4417a11641c30       vmovss [r12+rbx*1+0x30],xmm12
0x35d3e83d5e11  1191  8bf3                 movl rsi,rbx
0x35d3e83d5e13  1193  448bf8               movl r15,rax
0x35d3e83d5e16  1196  e90a000000           jmp 0x35d3e83d5e25  <+0x11a5>
0x35d3e83d5e1b  119b  8b75e0               movl rsi,[rbp-0x20]
0x35d3e83d5e1e  119e  448bbd28ffffff       movl r15,[rbp-0xd8]
0x35d3e83d5e25  11a5  8d4610               leal rax,[rsi+0x10]
0x35d3e83d5e28  11a8  8d7e20               leal rdi,[rsi+0x20]
0x35d3e83d5e2b  11ab  448d4630             leal r8,[rsi+0x30]
0x35d3e83d5e2f  11af  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d5e36  11b6  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d5e3a  11ba  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0x35d3e83d5e41  11c1  8bde                 movl rbx,rsi
0x35d3e83d5e43  11c3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e83d5e47  11c7  8b5598               movl rdx,[rbp-0x68]
0x35d3e83d5e4a  11ca  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0x35d3e83d5e4f  11cf  c5fb105588           vmovsd xmm2,[rbp-0x78]
0x35d3e83d5e54  11d4  8bcf                 movl rcx,rdi
0x35d3e83d5e56  11d6  458bc8               movl r9,r8
0x35d3e83d5e59  11d9  e8eabef1ff           call 0x35d3e82f1d48  (jump table)
0x35d3e83d5e5e  11de  8b7da0               movl rdi,[rbp-0x60]
0x35d3e83d5e61  11e1  3b7dd0               cmpl rdi,[rbp-0x30]
0x35d3e83d5e64  11e4  0f866f000000         jna 0x35d3e83d5ed9  <+0x1259>
0x35d3e83d5e6a  11ea  448b45d0             movl r8,[rbp-0x30]
0x35d3e83d5e6e  11ee  448b5da8             movl r11,[rbp-0x58]
0x35d3e83d5e72  11f2  478d2483             leal r12,[r11+r8*4]
0x35d3e83d5e76  11f6  448b7de0             movl r15,[rbp-0x20]
0x35d3e83d5e7a  11fa  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0x35d3e83d5e81  1201  c4817a10443e10       vmovss xmm0,[r14+r15*1+0x10]
0x35d3e83d5e88  1208  c4817a110426         vmovss [r14+r12*1],xmm0
0x35d3e83d5e8e  120e  448b65b0             movl r12,[rbp-0x50]
0x35d3e83d5e92  1212  438d0484             leal rax,[r12+r8*4]
0x35d3e83d5e96  1216  c4817a10443e14       vmovss xmm0,[r14+r15*1+0x14]
0x35d3e83d5e9d  121d  c4c17a110406         vmovss [r14+rax*1],xmm0
0x35d3e83d5ea3  1223  8b5db8               movl rbx,[rbp-0x48]
0x35d3e83d5ea6  1226  428d0483             leal rax,[rbx+r8*4]
0x35d3e83d5eaa  122a  c4817a10443e18       vmovss xmm0,[r14+r15*1+0x18]
0x35d3e83d5eb1  1231  c4c17a110406         vmovss [r14+rax*1],xmm0
0x35d3e83d5eb7  1237  8b55c0               movl rdx,[rbp-0x40]
0x35d3e83d5eba  123a  428d0482             leal rax,[rdx+r8*4]
0x35d3e83d5ebe  123e  c4817a10443e1c       vmovss xmm0,[r14+r15*1+0x1c]
0x35d3e83d5ec5  1245  c4c17a110406         vmovss [r14+rax*1],xmm0
0x35d3e83d5ecb  124b  458bd0               movl r10,r8
0x35d3e83d5ece  124e  448bc7               movl r8,rdi
0x35d3e83d5ed1  1251  418bfa               movl rdi,r10
0x35d3e83d5ed4  1254  e920000000           jmp 0x35d3e83d5ef9  <+0x1279>
0x35d3e83d5ed9  1259  448bc7               movl r8,rdi
0x35d3e83d5edc  125c  8b7dd0               movl rdi,[rbp-0x30]
0x35d3e83d5edf  125f  4c8bb5e8feffff       REX.W movq r14,[rbp-0x118]
0x35d3e83d5ee6  1266  e90e000000           jmp 0x35d3e83d5ef9  <+0x1279>
0x35d3e83d5eeb  126b  448b45a0             movl r8,[rbp-0x60]
0x35d3e83d5eef  126f  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x35d3e83d5ef6  1276  4d8bf3               REX.W movq r14,r11
0x35d3e83d5ef9  1279  83c701               addl rdi,0x1
0x35d3e83d5efc  127c  448b5dd8             movl r11,[rbp-0x28]
0x35d3e83d5f00  1280  443bdf               cmpl r11,rdi
0x35d3e83d5f03  1283  0f85f7f1ffff         jnz 0x35d3e83d5100  <+0x480>
0x35d3e83d5f09  1289  8b7de0               movl rdi,[rbp-0x20]
0x35d3e83d5f0c  128c  83c750               addl rdi,0x50
0x35d3e83d5f0f  128f  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x35d3e83d5f13  1293  418938               movl [r8],rdi
0x35d3e83d5f16  1296  488be5               REX.W movq rsp,rbp
0x35d3e83d5f19  1299  5d                   pop rbp
0x35d3e83d5f1a  129a  c3                   retl
0x35d3e83d5f1b  129b  e8b0c5f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d5f20  12a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e83d5f24  12a4  8b8528ffffff         movl rax,[rbp-0xd8]
0x35d3e83d5f2a  12aa  488bbde8feffff       REX.W movq rdi,[rbp-0x118]
0x35d3e83d5f31  12b1  e974edffff           jmp 0x35d3e83d4caa  <+0x2a>
0x35d3e83d5f36  12b6  c5f92ee4             vucomisd xmm4,xmm4
0x35d3e83d5f3a  12ba  0f8b0b000000         jpo 0x35d3e83d5f4b  <+0x12cb>
0x35d3e83d5f40  12c0  4533ff               xorl r15,r15
0x35d3e83d5f43  12c3  4d8be7               REX.W movq r12,r15
0x35d3e83d5f46  12c6  e9b8eeffff           jmp 0x35d3e83d4e03  <+0x183>
0x35d3e83d5f4b  12cb  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e83d5f4f  12cf  c5f82ee3             vucomiss xmm4,xmm3
0x35d3e83d5f53  12d3  0f870b000000         ja 0x35d3e83d5f64  <+0x12e4>
0x35d3e83d5f59  12d9  41bcffffffff         movl r12,0xffffffff
0x35d3e83d5f5f  12df  e99feeffff           jmp 0x35d3e83d4e03  <+0x183>
0x35d3e83d5f64  12e4  4531e4               xorl r12,r12
0x35d3e83d5f67  12e7  e997eeffff           jmp 0x35d3e83d4e03  <+0x183>
0x35d3e83d5f6c  12ec  c5f92eed             vucomisd xmm5,xmm5
0x35d3e83d5f70  12f0  0f8b08000000         jpo 0x35d3e83d5f7e  <+0x12fe>
0x35d3e83d5f76  12f6  4531e4               xorl r12,r12
0x35d3e83d5f79  12f9  e9e9eeffff           jmp 0x35d3e83d4e67  <+0x1e7>
0x35d3e83d5f7e  12fe  c5d057ed             vxorps xmm5,xmm5,xmm5
0x35d3e83d5f82  1302  c5f82eec             vucomiss xmm5,xmm4
0x35d3e83d5f86  1306  77ee                 ja 0x35d3e83d5f76  <+0x12f6>
0x35d3e83d5f88  1308  41bcffffffff         movl r12,0xffffffff
0x35d3e83d5f8e  130e  e9d4eeffff           jmp 0x35d3e83d4e67  <+0x1e7>
0x35d3e83d5f93  1313  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x35d3e83d5f9a  131a  48897dd0             REX.W movq [rbp-0x30],rdi
0x35d3e83d5f9e  131e  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x35d3e83d5fa5  1325  e826c5f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d5faa  132a  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d5fae  132e  8b7dd0               movl rdi,[rbp-0x30]
0x35d3e83d5fb1  1331  8b8528ffffff         movl rax,[rbp-0xd8]
0x35d3e83d5fb7  1337  4c8b9de8feffff       REX.W movq r11,[rbp-0x118]
0x35d3e83d5fbe  133e  8b5580               movl rdx,[rbp-0x80]
0x35d3e83d5fc1  1341  8b9d78ffffff         movl rbx,[rbp-0x88]
0x35d3e83d5fc7  1347  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d5fcc  134c  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d5fd4  1354  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d5fdc  135c  448bbd58ffffff       movl r15,[rbp-0xa8]
0x35d3e83d5fe3  1363  448bb548ffffff       movl r14,[rbp-0xb8]
0x35d3e83d5fea  136a  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d5ff0  1370  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d5ff6  1376  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x35d3e83d5ffe  137e  c5f8108530feffff     vmovups xmm0,[rbp-0x1d0]
0x35d3e83d6006  1386  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x35d3e83d600e  138e  c578108db0feffff     vmovups xmm9,[rbp-0x150]
0x35d3e83d6016  1396  c5fb10ade0feffff     vmovsd xmm5,[rbp-0x120]
0x35d3e83d601e  139e  448ba590feffff       movl r12,[rbp-0x170]
0x35d3e83d6025  13a5  e953f1ffff           jmp 0x35d3e83d517d  <+0x4fd>
0x35d3e83d602a  13aa  c5f92ed2             vucomisd xmm2,xmm2
0x35d3e83d602e  13ae  0f8b08000000         jpo 0x35d3e83d603c  <+0x13bc>
0x35d3e83d6034  13b4  4533c0               xorl r8,r8
0x35d3e83d6037  13b7  e9b0f2ffff           jmp 0x35d3e83d52ec  <+0x66c>
0x35d3e83d603c  13bc  c441782ec4           vucomiss xmm8,xmm12
0x35d3e83d6041  13c1  77f1                 ja 0x35d3e83d6034  <+0x13b4>
0x35d3e83d6043  13c3  41b8ffffffff         movl r8,0xffffffff
0x35d3e83d6049  13c9  e99ef2ffff           jmp 0x35d3e83d52ec  <+0x66c>
0x35d3e83d604e  13ce  c441792ec9           vucomisd xmm9,xmm9
0x35d3e83d6053  13d3  0f8b08000000         jpo 0x35d3e83d6061  <+0x13e1>
0x35d3e83d6059  13d9  4533c0               xorl r8,r8
0x35d3e83d605c  13dc  e9ebf2ffff           jmp 0x35d3e83d534c  <+0x6cc>
0x35d3e83d6061  13e1  c441782ec6           vucomiss xmm8,xmm14
0x35d3e83d6066  13e6  77f1                 ja 0x35d3e83d6059  <+0x13d9>
0x35d3e83d6068  13e8  41b8ffffffff         movl r8,0xffffffff
0x35d3e83d606e  13ee  e9d9f2ffff           jmp 0x35d3e83d534c  <+0x6cc>
0x35d3e83d6073  13f3  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d607b  13fb  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d6083  1403  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d608b  140b  4c899df0feffff       REX.W movq [rbp-0x110],r11
0x35d3e83d6092  1412  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d609a  141a  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d60a2  1422  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d60aa  142a  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d60b1  1431  e81ac4f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d60b6  1436  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d60ba  143a  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d60c1  1441  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d60c6  1446  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d60ce  144e  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d60d6  1456  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d60de  145e  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d60e6  1466  448b8530ffffff       movl r8,[rbp-0xd0]
0x35d3e83d60ed  146d  8b9df8feffff         movl rbx,[rbp-0x108]
0x35d3e83d60f3  1473  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d60f9  1479  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d60ff  147f  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d6105  1485  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d610b  148b  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6113  1493  448b9df0feffff       movl r11,[rbp-0x110]
0x35d3e83d611a  149a  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d6122  14a2  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d612a  14aa  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d6132  14b2  e99cf3ffff           jmp 0x35d3e83d54d3  <+0x853>
0x35d3e83d6137  14b7  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d613b  14bb  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d6143  14c3  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d614b  14cb  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d6153  14d3  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d615b  14db  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d6163  14e3  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d616b  14eb  4c89bdf0feffff       REX.W movq [rbp-0x110],r15
0x35d3e83d6172  14f2  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d6179  14f9  e852c3f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d617e  14fe  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d6182  1502  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d6189  1509  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d618d  150d  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6195  1515  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d619d  151d  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d61a5  1525  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d61ad  152d  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d61b2  1532  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d61ba  153a  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d61c2  1542  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d61ca  154a  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d61d2  1552  448b8530ffffff       movl r8,[rbp-0xd0]
0x35d3e83d61d9  1559  8b9df8feffff         movl rbx,[rbp-0x108]
0x35d3e83d61df  155f  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d61e5  1565  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d61eb  156b  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d61f1  1571  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d61f7  1577  448bbdf0feffff       movl r15,[rbp-0x110]
0x35d3e83d61fe  157e  e980f3ffff           jmp 0x35d3e83d5583  <+0x903>
0x35d3e83d6203  1583  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d620b  158b  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d6213  1593  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d621b  159b  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d6223  15a3  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d622b  15ab  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d6233  15b3  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d6237  15b7  4c89bd98feffff       REX.W movq [rbp-0x168],r15
0x35d3e83d623e  15be  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d6245  15c5  e886c2f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d624a  15ca  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d624e  15ce  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d6255  15d5  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d625a  15da  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d6262  15e2  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d626a  15ea  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d6272  15f2  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d627a  15fa  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d6282  1602  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d628a  160a  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6292  1612  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d629a  161a  448b8520ffffff       movl r8,[rbp-0xe0]
0x35d3e83d62a1  1621  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d62a8  1628  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d62ac  162c  8b9df8feffff         movl rbx,[rbp-0x108]
0x35d3e83d62b2  1632  448bbd98feffff       movl r15,[rbp-0x168]
0x35d3e83d62b9  1639  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d62bf  163f  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d62c5  1645  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d62cb  164b  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d62d1  1651  e9dcf3ffff           jmp 0x35d3e83d56b2  <+0xa32>
0x35d3e83d62d6  1656  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d62de  165e  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d62e6  1666  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d62ee  166e  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d62f6  1676  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d62fe  167e  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d6306  1686  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0x35d3e83d630d  168d  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d6314  1694  e8b7c1f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d6319  1699  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d631d  169d  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d6324  16a4  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d6329  16a9  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d6331  16b1  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d6339  16b9  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d6341  16c1  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d6349  16c9  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d6351  16d1  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d6359  16d9  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6361  16e1  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d6369  16e9  8b9d30ffffff         movl rbx,[rbp-0xd0]
0x35d3e83d636f  16ef  448b8520ffffff       movl r8,[rbp-0xe0]
0x35d3e83d6376  16f6  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d637d  16fd  8bb5d8feffff         movl rsi,[rbp-0x128]
0x35d3e83d6383  1703  8b8dd0feffff         movl rcx,[rbp-0x130]
0x35d3e83d6389  1709  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d638f  170f  8b85c0feffff         movl rax,[rbp-0x140]
0x35d3e83d6395  1715  448bbd40ffffff       movl r15,[rbp-0xc0]
0x35d3e83d639c  171c  e969f3ffff           jmp 0x35d3e83d570a  <+0xa8a>
0x35d3e83d63a1  1721  4c895dc8             REX.W movq [rbp-0x38],r11
0x35d3e83d63a5  1725  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d63ad  172d  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d63b5  1735  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d63bd  173d  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d63c5  1745  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d63cd  174d  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d63d5  1755  4889b5f0feffff       REX.W movq [rbp-0x110],rsi
0x35d3e83d63dc  175c  4c89bd40ffffff       REX.W movq [rbp-0xc0],r15
0x35d3e83d63e3  1763  48898d28ffffff       REX.W movq [rbp-0xd8],rcx
0x35d3e83d63ea  176a  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d63f1  1771  e8dac0f1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d63f6  1776  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d63fa  177a  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d6401  1781  448b5dc8             movl r11,[rbp-0x38]
0x35d3e83d6405  1785  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d640a  178a  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d6412  1792  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d641a  179a  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d6422  17a2  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d642a  17aa  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d6432  17b2  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d643a  17ba  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6442  17c2  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d644a  17ca  8b9d30ffffff         movl rbx,[rbp-0xd0]
0x35d3e83d6450  17d0  448b8520ffffff       movl r8,[rbp-0xe0]
0x35d3e83d6457  17d7  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d645e  17de  8bb5f0feffff         movl rsi,[rbp-0x110]
0x35d3e83d6464  17e4  4c8bbd40ffffff       REX.W movq r15,[rbp-0xc0]
0x35d3e83d646b  17eb  8b8d28ffffff         movl rcx,[rbp-0xd8]
0x35d3e83d6471  17f1  8b95c8feffff         movl rdx,[rbp-0x138]
0x35d3e83d6477  17f7  e9b3f3ffff           jmp 0x35d3e83d582f  <+0xbaf>
0x35d3e83d647c  17fc  4c8945c8             REX.W movq [rbp-0x38],r8
0x35d3e83d6480  1800  c57b119560ffffff     vmovsd [rbp-0xa0],xmm10
0x35d3e83d6488  1808  c57b119d50ffffff     vmovsd [rbp-0xb0],xmm11
0x35d3e83d6490  1810  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x35d3e83d6498  1818  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x35d3e83d64a0  1820  c5fb11ada0feffff     vmovsd [rbp-0x160],xmm5
0x35d3e83d64a8  1828  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x35d3e83d64b0  1830  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x35d3e83d64b7  1837  48899d40ffffff       REX.W movq [rbp-0xc0],rbx
0x35d3e83d64be  183e  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x35d3e83d64c5  1845  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x35d3e83d64cc  184c  e8ffbff1ff           call 0x35d3e82f24d0  (jump table)
0x35d3e83d64d1  1851  8b75e0               movl rsi,[rbp-0x20]
0x35d3e83d64d4  1854  448b4dd8             movl r9,[rbp-0x28]
0x35d3e83d64d8  1858  4c8ba5e8feffff       REX.W movq r12,[rbp-0x118]
0x35d3e83d64df  185f  448b45c8             movl r8,[rbp-0x38]
0x35d3e83d64e3  1863  c4413857c0           vxorps xmm8,xmm8,xmm8
0x35d3e83d64e8  1868  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e83d64f0  1870  c5fb10bd68ffffff     vmovsd xmm7,[rbp-0x98]
0x35d3e83d64f8  1878  c57b109560ffffff     vmovsd xmm10,[rbp-0xa0]
0x35d3e83d6500  1880  c57b109d50ffffff     vmovsd xmm11,[rbp-0xb0]
0x35d3e83d6508  1888  8b8d48ffffff         movl rcx,[rbp-0xb8]
0x35d3e83d650e  188e  c57810ad60feffff     vmovups xmm13,[rbp-0x1a0]
0x35d3e83d6516  1896  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x35d3e83d651e  189e  c5fb10ada0feffff     vmovsd xmm5,[rbp-0x160]
0x35d3e83d6526  18a6  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x35d3e83d652e  18ae  8b95f0feffff         movl rdx,[rbp-0x110]
0x35d3e83d6534  18b4  488b9d40ffffff       REX.W movq rbx,[rbp-0xc0]
0x35d3e83d653b  18bb  8b8530ffffff         movl rax,[rbp-0xd0]
0x35d3e83d6541  18c1  448b9d28ffffff       movl r11,[rbp-0xd8]
0x35d3e83d6548  18c8  448bb518ffffff       movl r14,[rbp-0xe8]
0x35d3e83d654f  18cf  e921f6ffff           jmp 0x35d3e83d5b75  <+0xef5>
0x35d3e83d6554  18d4  90                   nop
0x35d3e83d6555  18d5  0f1f00               nop

Protected instructions:
 pc offset
        42         
        63         
       10d         
       23e         
       244         
       24c         
       251         
       259         
       262         
       267         
       26c         
       271         
       2a8         
       2d9         
       2de         
       2e3         
       2e8         
       30a         
       30f         
       314         
       330         
       357         
       35c         
       361         
       36a         
       373         
       37c         
       388         
       391         
       39d         
       3a5         
       3b6         
       3bb         
       3c7         
       3d0         
       3d5         
       3e3         
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
       7c5         
       804         
       817         
       82b         
       914         
       abd         
       ac5         
       b03         
       b3a         
       b71         
       bb2         
       c4c         
       c66         
       cde         
       cf0         
       d57         
       d5e         
       d65         
       d6c         
       daf         
       db6         
       dbd         
       dc4         
       de9         
       df3         
       e44         
       e7e         
       eb5         
       ef9         
       f51         
       f65         
       f8b         
       fa1         
       fac         
       fe8         
      1024         
      1037         
      104b         
      107d         
      1091         
      10ba         
      10d3         
      10de         
      1175         
      117c         
      1183         
      118a         
      1201         
      1208         
      1216         
      121d         
      122a         
      1231         
      123e         
      1245         

Source positions:
 pc offset  position
        42        60
        63        97
       10d       166
       23e       281
       244       291
       24c       295
       251       302
       259       306
       262       317
       267       322
       26c       327
       271       332
       276       335
       29d       345
       2d9       363
       2de       370
       2e3       377
       2e8       384
       30a       415
       30f       422
       314       429
       32c       454
       357       497
       35c       504
       361       511
       366       518
       36f       525
       378       532
       384       540
       38d       547
       396       554
       3a5       562
       3af       570
       3bb       577
       3c0       584
       3cc       591
       3d5       598
       3e3       611
       50a       647
       514       657
       51e       667
       528       679
       52e       682
       539       689
       540       696
       547       703
       54d       714
       556       721
       564       744
       7c5      2062
       804      2111
       817      2122
       82b      2135
       914      1084
       abd      1208
       ac5      1221
       b03      1281
       c4c      1714
       c66      1741
       cde      1823
       cf0      1834
       d54      1895
       d5e      1902
       d65      1909
       d6c      1917
       dac      1341
       db6      1348
       dbd      1355
       dc4      1363
       de2      1373
       ded      1380
       e44      1442
       f51      1503
       f65      1523
       f8b      1551
       fac      1571
       fe8      1611
      1024      1660
      1037      1671
      104b      1684
      107d      1954
      1091      1974
      10b7      2002
      10de      2022
      1172      2146
      117c      2153
      1183      2160
      118a      2168
      11af      2195
      11f6      2215
      1208      2218
      1216      2228
      121d      2231
      122a      2241
      1231      2244
      123e      2254
      1245      2257
      129b         0
      1313       626
      13f3      1016
      14b7      1049
      1583      1145
      1656      1158
      1721      1266
      17fc      1427

Safepoints (stack slots = 60, entries = 1, byte size = 22)
0x35d3e83d4f1d    29d  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0x35d3e83d4f19  internal wasm call
0x35d3e83d5e5a  internal wasm call
0x35d3e83d5f1c  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d5fa6  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d60b2  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d617a  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d6246  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d6315  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d63f2  wasm stub call  (0x35d3e82f24d0)
0x35d3e83d64cd  wasm stub call  (0x35d3e82f24d0)
