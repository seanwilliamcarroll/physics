name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock4gridNtB4_5Flock9step_grid
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 6784 = 6764 + 20 padding)
Instructions (size = 6740)
0x1a01489f0f00     0  55                   push rbp
0x1a01489f0f01     1  4889e5               REX.W movq rbp,rsp
0x1a01489f0f04     4  6a08                 push 0x8
0x1a01489f0f06     6  56                   push rsi
0x1a01489f0f07     7  4881ecd0010000       REX.W subq rsp,0x1d0
0x1a01489f0f0e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x1a01489f0f12    12  48898530ffffff       REX.W movq [rbp-0xd0],rax
0x1a01489f0f19    19  4889bd38ffffff       REX.W movq [rbp-0xc8],rdi
0x1a01489f0f20    20  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f0f24    24  0f8612130000         jna 0x1a01489f223c  <+0x133c>
0x1a01489f0f2a    2a  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x1a01489f0f2e    2e  458b18               movl r11,[r8]
0x1a01489f0f31    31  418d5bb0             leal rbx,[r11-0x50]
0x1a01489f0f35    35  418918               movl [r8],rbx
0x1a01489f0f38    38  448bd8               movl r11,rax
0x1a01489f0f3b    3b  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0x1a01489f0f42    42  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0x1a01489f0f48    48  c5fa16d0             vmovshdup xmm2,xmm0
0x1a01489f0f4c    4c  41ba0000803a         movl r10,0x3a800000
0x1a01489f0f52    52  c4c1796eda           vmovd xmm3,r10
0x1a01489f0f57    57  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x1a01489f0f5b    5b  c5f828c8             vmovaps xmm1,xmm0
0x1a01489f0f5f    5f  c5e259d9             vmulss xmm3,xmm3,xmm1
0x1a01489f0f63    63  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0x1a01489f0f6d    6d  4c8945e8             REX.W movq [rbp-0x18],r8
0x1a01489f0f71    71  48895de0             REX.W movq [rbp-0x20],rbx
0x1a01489f0f75    75  4c895dd0             REX.W movq [rbp-0x30],r11
0x1a01489f0f79    79  c5fb115588           vmovsd [rbp-0x78],xmm2
0x1a01489f0f7e    7e  c5fb114d90           vmovsd [rbp-0x70],xmm1
0x1a01489f0f83    83  c5f82eed             vucomiss xmm5,xmm5
0x1a01489f0f87    87  7a06                 jpe 0x1a01489f0f8f  <+0x8f>
0x1a01489f0f89    89  0f8404000000         jz 0x1a01489f0f93  <+0x93>
0x1a01489f0f8f    8f  c5f928eb             vmovapd xmm5,xmm3
0x1a01489f0f93    93  c5f82edb             vucomiss xmm3,xmm3
0x1a01489f0f97    97  7a06                 jpe 0x1a01489f0f9f  <+0x9f>
0x1a01489f0f99    99  0f8404000000         jz 0x1a01489f0fa3  <+0xa3>
0x1a01489f0f9f    9f  c5f928dd             vmovapd xmm3,xmm5
0x1a01489f0fa3    a3  c5f82eeb             vucomiss xmm5,xmm3
0x1a01489f0fa7    a7  0f8704000000         ja 0x1a01489f0fb1  <+0xb1>
0x1a01489f0fad    ad  c5f928eb             vmovapd xmm5,xmm3
0x1a01489f0fb1    b1  c5f82eed             vucomiss xmm5,xmm5
0x1a01489f0fb5    b5  7a06                 jpe 0x1a01489f0fbd  <+0xbd>
0x1a01489f0fb7    b7  0f8409000000         jz 0x1a01489f0fc6  <+0xc6>
0x1a01489f0fbd    bd  c5f928dc             vmovapd xmm3,xmm4
0x1a01489f0fc1    c1  e904000000           jmp 0x1a01489f0fca  <+0xca>
0x1a01489f0fc6    c6  c5f928dd             vmovapd xmm3,xmm5
0x1a01489f0fca    ca  c5f82ee4             vucomiss xmm4,xmm4
0x1a01489f0fce    ce  7a06                 jpe 0x1a01489f0fd6  <+0xd6>
0x1a01489f0fd0    d0  0f8404000000         jz 0x1a01489f0fda  <+0xda>
0x1a01489f0fd6    d6  c5f928e3             vmovapd xmm4,xmm3
0x1a01489f0fda    da  c5f82edc             vucomiss xmm3,xmm4
0x1a01489f0fde    de  0f8704000000         ja 0x1a01489f0fe8  <+0xe8>
0x1a01489f0fe4    e4  c5f928dc             vmovapd xmm3,xmm4
0x1a01489f0fe8    e8  41ba0020803f         movl r10,0x3f802000
0x1a01489f0fee    ee  c4c1796ee2           vmovd xmm4,r10
0x1a01489f0ff3    f3  c5da59db             vmulss xmm3,xmm4,xmm3
0x1a01489f0ff7    f7  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x1a01489f0ffb    fb  c5d972f419           vpslld xmm4,xmm4,25
0x1a01489f1000   100  c5d972d402           vpsrld xmm4,xmm4,2
0x1a01489f1005   105  c5da5edb             vdivss xmm3,xmm4,xmm3
0x1a01489f1009   109  c5f828db             vmovaps xmm3,xmm3
0x1a01489f100d   10d  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0x1a01489f1017   117  c4e27918db           vbroadcastss xmm3,xmm3
0x1a01489f101c   11c  c5f859c3             vmulps xmm0,xmm0,xmm3
0x1a01489f1020   120  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x1a01489f1026   126  c5f828d8             vmovaps xmm3,xmm0
0x1a01489f102a   12a  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x1a01489f102e   12e  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x1a01489f1034   134  c57b2ce6             vcvttsd2si r12,xmm6
0x1a01489f1038   138  4585e4               testl r12,r12
0x1a01489f103b   13b  0f892a000000         jns 0x1a01489f106b  <+0x16b>
0x1a01489f1041   141  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x1a01489f104b   14b  c441f96efa           vmovq xmm15,r10
0x1a01489f1050   150  c50358fe             vaddsd xmm15,xmm15,xmm6
0x1a01489f1054   154  c4417b2ce7           vcvttsd2si r12,xmm15
0x1a01489f1059   159  4585e4               testl r12,r12
0x1a01489f105c   15c  0f8809000000         js 0x1a01489f106b  <+0x16b>
0x1a01489f1062   162  41ba00000080         movl r10,0x80000000
0x1a01489f1068   168  450be2               orl r12,r10
0x1a01489f106b   16b  4589e2               movl r10,r12
0x1a01489f106e   16e  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x1a01489f1073   173  c5f92efe             vucomisd xmm7,xmm6
0x1a01489f1077   177  0f8ada110000         jpe 0x1a01489f2257  <+0x1357>
0x1a01489f107d   17d  0f85d4110000         jnz 0x1a01489f2257  <+0x1357>
0x1a01489f1083   183  c4c1796edc           vmovd xmm3,r12
0x1a01489f1088   188  c5f970db00           vpshufd xmm3,xmm3,0x0
0x1a01489f108d   18d  c5fa16e8             vmovshdup xmm5,xmm0
0x1a01489f1091   191  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0x1a01489f1095   195  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x1a01489f109b   19b  c57b2ce7             vcvttsd2si r12,xmm7
0x1a01489f109f   19f  4585e4               testl r12,r12
0x1a01489f10a2   1a2  0f8927000000         jns 0x1a01489f10cf  <+0x1cf>
0x1a01489f10a8   1a8  4c8b1594ffffff       REX.W movq r10,[rip+0xffffff94]
0x1a01489f10af   1af  c441f96efa           vmovq xmm15,r10
0x1a01489f10b4   1b4  c50358ff             vaddsd xmm15,xmm15,xmm7
0x1a01489f10b8   1b8  c4417b2ce7           vcvttsd2si r12,xmm15
0x1a01489f10bd   1bd  4585e4               testl r12,r12
0x1a01489f10c0   1c0  0f8809000000         js 0x1a01489f10cf  <+0x1cf>
0x1a01489f10c6   1c6  41ba00000080         movl r10,0x80000000
0x1a01489f10cc   1cc  450be2               orl r12,r10
0x1a01489f10cf   1cf  4589e2               movl r10,r12
0x1a01489f10d2   1d2  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x1a01489f10d7   1d7  c5792ec7             vucomisd xmm8,xmm7
0x1a01489f10db   1db  0f8aac110000         jpe 0x1a01489f228d  <+0x138d>
0x1a01489f10e1   1e1  0f85a6110000         jnz 0x1a01489f228d  <+0x138d>
0x1a01489f10e7   1e7  c4c36122dc01         vpinsrd xmm3,xmm3,r12,0x1
0x1a01489f10ed   1ed  49ba0100000001000000 REX.W movq r10,0x100000001
0x1a01489f10f7   1f7  c4c1f96eea           vmovq xmm5,r10
0x1a01489f10fc   1fc  c5d16ced             vpunpcklqdq xmm5,xmm5,xmm5
0x1a01489f1100   200  c4e2613fdd           vpmaxud xmm3,xmm3,xmm5
0x1a01489f1105   205  c5c9eff6             vpxor xmm6,xmm6,xmm6
0x1a01489f1109   209  c5c8c2f002           vcmpps xmm6,xmm6,xmm0, (le)
0x1a01489f110e   20e  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x1a01489f1118   218  c4c1f96efa           vmovq xmm7,r10
0x1a01489f111d   21d  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x1a01489f1121   221  c5f8c2c701           vcmpps xmm0,xmm0,xmm7, (lt)
0x1a01489f1126   226  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x1a01489f112a   22a  c579dffd             vpandn xmm15,xmm0,xmm5
0x1a01489f112e   22e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x1a01489f1132   232  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x1a01489f1137   237  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0x1a01489f113e   23e  c4817813041c         vmovlps [r12+r11*1],xmm0
0x1a01489f1144   244  468bbc1fcc000000     movl r15,[rdi+r11*1+0xcc]
0x1a01489f114c   24c  44897c1f28           movl [rdi+rbx*1+0x28],r15
0x1a01489f1151   251  4e8bbc1fc4000000     REX.W movq r15,[rdi+r11*1+0xc4]
0x1a01489f1159   259  4c897c1f20           REX.W movq [rdi+rbx*1+0x20],r15
0x1a01489f115e   25e  448d7860             leal r15,[rax+0x60]
0x1a01489f1162   262  428b541f04           movl rdx,[rdi+r11*1+0x4]
0x1a01489f1167   267  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0x1a01489f116c   26c  468b741f10           movl r14,[rdi+r11*1+0x10]
0x1a01489f1171   271  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0x1a01489f1176   276  c5f811ad20feffff     vmovups [rbp-0x1e0],xmm5
0x1a01489f117e   27e  c5f811bd90feffff     vmovups [rbp-0x170],xmm7
0x1a01489f1186   286  4c8965c8             REX.W movq [rbp-0x38],r12
0x1a01489f118a   28a  418bc7               movl rax,r15
0x1a01489f118d   28d  418bde               movl rbx,r14
0x1a01489f1190   290  e863cbf1ff           call 0x1a014890dcf8  (jump table)
0x1a01489f1195   295  488bbd38ffffff       REX.W movq rdi,[rbp-0xc8]
0x1a01489f119c   29c  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x1a01489f11a0   2a0  468b5c0708           movl r11,[rdi+r8*1+0x8]
0x1a01489f11a5   2a5  4c895dd8             REX.W movq [rbp-0x28],r11
0x1a01489f11a9   2a9  4585db               testl r11,r11
0x1a01489f11ac   2ac  0f8513000000         jnz 0x1a01489f11c5  <+0x2c5>
0x1a01489f11b2   2b2  8b5de0               movl rbx,[rbp-0x20]
0x1a01489f11b5   2b5  8d7b50               leal rdi,[rbx+0x50]
0x1a01489f11b8   2b8  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x1a01489f11bc   2bc  41893c24             movl [r12],rdi
0x1a01489f11c0   2c0  488be5               REX.W movq rsp,rbp
0x1a01489f11c3   2c3  5d                   pop rbp
0x1a01489f11c4   2c4  c3                   retl
0x1a01489f11c5   2c5  8b8530ffffff         movl rax,[rbp-0xd0]
0x1a01489f11cb   2cb  8d90a0000000         leal rdx,[rax+0xa0]
0x1a01489f11d1   2d1  468b64075c           movl r12,[rdi+r8*1+0x5c]
0x1a01489f11d6   2d6  468b7c0750           movl r15,[rdi+r8*1+0x50]
0x1a01489f11db   2db  468b740744           movl r14,[rdi+r8*1+0x44]
0x1a01489f11e0   2e0  428b5c0738           movl rbx,[rdi+r8*1+0x38]
0x1a01489f11e5   2e5  8bcb                 movl rcx,rbx
0x1a01489f11e7   2e7  443bf3               cmpl r14,rbx
0x1a01489f11ea   2ea  410f42ce             cmovcl rcx,r14
0x1a01489f11ee   2ee  448bf1               movl r14,rcx
0x1a01489f11f1   2f1  443bf9               cmpl r15,rcx
0x1a01489f11f4   2f4  450f42f7             cmovcl r14,r15
0x1a01489f11f8   2f8  458bfe               movl r15,r14
0x1a01489f11fb   2fb  453be6               cmpl r12,r14
0x1a01489f11fe   2fe  450f42fc             cmovcl r15,r12
0x1a01489f1202   302  468b640714           movl r12,[rdi+r8*1+0x14]
0x1a01489f1207   307  468b740720           movl r14,[rdi+r8*1+0x20]
0x1a01489f120c   30c  428b5c072c           movl rbx,[rdi+r8*1+0x2c]
0x1a01489f1211   311  8bcb                 movl rcx,rbx
0x1a01489f1213   313  443bf3               cmpl r14,rbx
0x1a01489f1216   316  410f42ce             cmovcl rcx,r14
0x1a01489f121a   31a  448bf1               movl r14,rcx
0x1a01489f121d   31d  443be1               cmpl r12,rcx
0x1a01489f1220   320  450f42f4             cmovcl r14,r12
0x1a01489f1224   324  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x1a01489f1228   328  c4a17b100403         vmovsd xmm0,[rbx+r8*1]
0x1a01489f122e   32e  c5f8109d20feffff     vmovups xmm3,[rbp-0x1e0]
0x1a01489f1236   336  c57970f800           vpshufd xmm15,xmm0,0x0
0x1a01489f123b   33b  c5f970e300           vpshufd xmm4,xmm3,0x0
0x1a01489f1240   340  c4c3590ee70c         vpblendw xmm4,xmm4,xmm15,0xc
0x1a01489f1246   346  c4e2793fc3           vpmaxud xmm0,xmm0,xmm3
0x1a01489f124b   34b  c5f9fac3             vpsubd xmm0,xmm0,xmm3
0x1a01489f124f   34f  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0x1a01489f1254   354  428b74074c           movl rsi,[rdi+r8*1+0x4c]
0x1a01489f1259   359  468b4c0740           movl r9,[rdi+r8*1+0x40]
0x1a01489f125e   35e  4c897da0             REX.W movq [rbp-0x60],r15
0x1a01489f1262   362  468b7c0734           movl r15,[rdi+r8*1+0x34]
0x1a01489f1267   367  48895dc0             REX.W movq [rbp-0x40],rbx
0x1a01489f126b   36b  428b5c077c           movl rbx,[rdi+r8*1+0x7c]
0x1a01489f1270   370  48895598             REX.W movq [rbp-0x68],rdx
0x1a01489f1274   374  428b940780000000     movl rdx,[rdi+r8*1+0x80]
0x1a01489f127c   37c  488975b8             REX.W movq [rbp-0x48],rsi
0x1a01489f1280   380  428b740764           movl rsi,[rdi+r8*1+0x64]
0x1a01489f1285   385  4c894db0             REX.W movq [rbp-0x50],r9
0x1a01489f1289   389  468b4c0768           movl r9,[rdi+r8*1+0x68]
0x1a01489f128e   38e  48898d28ffffff       REX.W movq [rbp-0xd8],rcx
0x1a01489f1295   395  428b8c0788000000     movl rcx,[rdi+r8*1+0x88]
0x1a01489f129d   39d  c4a17a10ac0784000000 vmovss xmm5,[rdi+r8*1+0x84]
0x1a01489f12a7   3a7  4c89a520ffffff       REX.W movq [rbp-0xe0],r12
0x1a01489f12ae   3ae  468b64071c           movl r12,[rdi+r8*1+0x1c]
0x1a01489f12b3   3b3  468b5c0728           movl r11,[rdi+r8*1+0x28]
0x1a01489f12b8   3b8  4c89b5e0feffff       REX.W movq [rbp-0x120],r14
0x1a01489f12bf   3bf  468b740710           movl r14,[rdi+r8*1+0x10]
0x1a01489f12c4   3c4  4c899d78ffffff       REX.W movq [rbp-0x88],r11
0x1a01489f12cb   3cb  468b5c0704           movl r11,[rdi+r8*1+0x4]
0x1a01489f12d0   3d0  c4a17a10b407a0000000 vmovss xmm6,[rdi+r8*1+0xa0]
0x1a01489f12da   3da  c5ca59f6             vmulss xmm6,xmm6,xmm6
0x1a01489f12de   3de  c4a17a10bc07a4000000 vmovss xmm7,[rdi+r8*1+0xa4]
0x1a01489f12e8   3e8  c5c259ff             vmulss xmm7,xmm7,xmm7
0x1a01489f12ec   3ec  c5f811a530feffff     vmovups [rbp-0x1d0],xmm4
0x1a01489f12f4   3f4  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x1a01489f12fc   3fc  4c897da8             REX.W movq [rbp-0x58],r15
0x1a01489f1300   400  48899d10ffffff       REX.W movq [rbp-0xf0],rbx
0x1a01489f1307   407  48899508ffffff       REX.W movq [rbp-0xf8],rdx
0x1a01489f130e   40e  4889b5b8feffff       REX.W movq [rbp-0x148],rsi
0x1a01489f1315   415  4c898db0feffff       REX.W movq [rbp-0x150],r9
0x1a01489f131c   41c  48898d88feffff       REX.W movq [rbp-0x178],rcx
0x1a01489f1323   423  c5fb11add0feffff     vmovsd [rbp-0x130],xmm5
0x1a01489f132b   42b  4c89a570ffffff       REX.W movq [rbp-0x90],r12
0x1a01489f1332   432  4c89b550ffffff       REX.W movq [rbp-0xb0],r14
0x1a01489f1339   439  4c899d40ffffff       REX.W movq [rbp-0xc0],r11
0x1a01489f1340   440  c5fb11b568ffffff     vmovsd [rbp-0x98],xmm6
0x1a01489f1348   448  c5fb11bd60ffffff     vmovsd [rbp-0xa0],xmm7
0x1a01489f1350   450  418bc9               movl rcx,r9
0x1a01489f1353   453  458bfb               movl r15,r11
0x1a01489f1356   456  4c8bdf               REX.W movq r11,rdi
0x1a01489f1359   459  33ff                 xorl rdi,rdi
0x1a01489f135b   45b  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f135f   45f  4489e3               movl rbx,r12
0x1a01489f1362   462  48897dc8             REX.W movq [rbp-0x38],rdi
0x1a01489f1366   466  e971000000           jmp 0x1a01489f13dc  <+0x4dc>
0x1a01489f136b   46b  660f1f840000000000   nop
0x1a01489f1374   474  660f1f840000000000   nop
0x1a01489f137d   47d  0f1f00               nop
0x1a01489f1380   480  c5fb10add0feffff     vmovsd xmm5,[rbp-0x130]
0x1a01489f1388   488  c5f8109d20feffff     vmovups xmm3,[rbp-0x1e0]
0x1a01489f1390   490  8b8530ffffff         movl rax,[rbp-0xd0]
0x1a01489f1396   496  458bcb               movl r9,r11
0x1a01489f1399   499  4d8bde               REX.W movq r11,r14
0x1a01489f139c   49c  c5f81085c0feffff     vmovups xmm0,[rbp-0x140]
0x1a01489f13a4   4a4  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x1a01489f13ac   4ac  8b9d70ffffff         movl rbx,[rbp-0x90]
0x1a01489f13b2   4b2  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f13b8   4b8  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f13c0   4c0  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f13c8   4c8  448bb550ffffff       movl r14,[rbp-0xb0]
0x1a01489f13cf   4cf  448bbd40ffffff       movl r15,[rbp-0xc0]
0x1a01489f13d6   4d6  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f13dc   4dc  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f13e1   4e1  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f13e7   4e7  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f13ed   4ed  8b9578ffffff         movl rdx,[rbp-0x88]
0x1a01489f13f3   4f3  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f13f8   4f8  c578108d90feffff     vmovups xmm9,[rbp-0x170]
0x1a01489f1400   500  448ba5e0feffff       movl r12,[rbp-0x120]
0x1a01489f1407   507  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f140b   50b  0f86a30e0000         jna 0x1a01489f22b4  <+0x13b4>
0x1a01489f1411   511  443be7               cmpl r12,rdi
0x1a01489f1414   514  0f86f20d0000         jna 0x1a01489f220c  <+0x130c>
0x1a01489f141a   51a  458d04bf             leal r8,[r15+rdi*4]
0x1a01489f141e   51e  c4017a101c03         vmovss xmm11,[r11+r8*1]
0x1a01489f1424   524  458d04be             leal r8,[r14+rdi*4]
0x1a01489f1428   528  c4017a102403         vmovss xmm12,[r11+r8*1]
0x1a01489f142e   52e  448d04bb             leal r8,[rbx+rdi*4]
0x1a01489f1432   532  c4017a102c03         vmovss xmm13,[r11+r8*1]
0x1a01489f1438   538  448d04ba             leal r8,[rdx+rdi*4]
0x1a01489f143c   53c  c4017a103403         vmovss xmm14,[r11+r8*1]
0x1a01489f1442   542  448b65e0             movl r12,[rbp-0x20]
0x1a01489f1446   546  c4017a1174230c       vmovss [r11+r12*1+0xc],xmm14
0x1a01489f144d   54d  c4017a116c2308       vmovss [r11+r12*1+0x8],xmm13
0x1a01489f1454   554  c4017a11642304       vmovss [r11+r12*1+0x4],xmm12
0x1a01489f145b   55b  c4017a111c23         vmovss [r11+r12*1],xmm11
0x1a01489f1461   561  43c744234800000000   movl [r11+r12*1+0x48],0x0
0x1a01489f146a   56a  4bc744234000000000   REX.W movq [r11+r12*1+0x40],0x0
0x1a01489f1473   573  c44111efed           vpxor xmm13,xmm13,xmm13
0x1a01489f1478   578  c4017a7f6c2330       vmovdqu [r11+r12*1+0x30],xmm13
0x1a01489f147f   57f  c52259ed             vmulss xmm13,xmm11,xmm5
0x1a01489f1483   583  c443110aed09         vroundss xmm13,xmm13,xmm13,0x9
0x1a01489f1489   589  48897dd0             REX.W movq [rbp-0x30],rdi
0x1a01489f148d   58d  4c899d38ffffff       REX.W movq [rbp-0xc8],r11
0x1a01489f1494   594  c57b119d48ffffff     vmovsd [rbp-0xb8],xmm11
0x1a01489f149c   59c  c57b11a558ffffff     vmovsd [rbp-0xa8],xmm12
0x1a01489f14a4   5a4  c441782eed           vucomiss xmm13,xmm13
0x1a01489f14a9   5a9  7a06                 jpe 0x1a01489f14b1  <+0x5b1>
0x1a01489f14ab   5ab  0f8405000000         jz 0x1a01489f14b6  <+0x5b6>
0x1a01489f14b1   5b1  c4417928e8           vmovapd xmm13,xmm8
0x1a01489f14b6   5b6  c441782ee8           vucomiss xmm13,xmm8
0x1a01489f14bb   5bb  0f8705000000         ja 0x1a01489f14c6  <+0x5c6>
0x1a01489f14c1   5c1  c4417928e8           vmovapd xmm13,xmm8
0x1a01489f14c6   5c6  c4427918f5           vbroadcastss xmm14,xmm13
0x1a01489f14cb   5cb  c4c15259cc           vmulss xmm1,xmm5,xmm12
0x1a01489f14d0   5d0  c4e3710ac909         vroundss xmm1,xmm1,xmm1,0x9
0x1a01489f14d6   5d6  c5f82ec9             vucomiss xmm1,xmm1
0x1a01489f14da   5da  7a06                 jpe 0x1a01489f14e2  <+0x5e2>
0x1a01489f14dc   5dc  0f8405000000         jz 0x1a01489f14e7  <+0x5e7>
0x1a01489f14e2   5e2  c4c17928c8           vmovapd xmm1,xmm8
0x1a01489f14e7   5e7  c4c1782ec8           vucomiss xmm1,xmm8
0x1a01489f14ec   5ec  0f870a000000         ja 0x1a01489f14fc  <+0x5fc>
0x1a01489f14f2   5f2  c4c17928d0           vmovapd xmm2,xmm8
0x1a01489f14f7   5f7  e904000000           jmp 0x1a01489f1500  <+0x600>
0x1a01489f14fc   5fc  c5f928d1             vmovapd xmm2,xmm1
0x1a01489f1500   600  c4c1797ec8           vmovd r8,xmm1
0x1a01489f1505   605  4585c0               testl r8,r8
0x1a01489f1508   608  0f8404000000         jz 0x1a01489f1512  <+0x612>
0x1a01489f150e   60e  c5f928ca             vmovapd xmm1,xmm2
0x1a01489f1512   612  c5782ec2             vucomiss xmm8,xmm2
0x1a01489f1516   616  7a06                 jpe 0x1a01489f151e  <+0x61e>
0x1a01489f1518   618  0f8404000000         jz 0x1a01489f1522  <+0x622>
0x1a01489f151e   61e  c5f928ca             vmovapd xmm1,xmm2
0x1a01489f1522   622  c4630921f110         vinsertps xmm14,xmm14,xmm1,0x10
0x1a01489f1528   628  c44108c2f101         vcmpps xmm14,xmm14,xmm9, (lt)
0x1a01489f152e   62e  c5f96ed0             vmovd xmm2,rax
0x1a01489f1532   632  c5f970d200           vpshufd xmm2,xmm2,0x0
0x1a01489f1537   637  c4c1125aed           vcvtss2sd xmm5,xmm13,xmm13
0x1a01489f153c   63c  c463310bcd0b         vroundsd xmm9,xmm9,xmm5,0xb
0x1a01489f1542   642  c4417b2cc1           vcvttsd2si r8,xmm9
0x1a01489f1547   647  4585c0               testl r8,r8
0x1a01489f154a   64a  0f8928000000         jns 0x1a01489f1578  <+0x678>
0x1a01489f1550   650  4c8b15ecfaffff       REX.W movq r10,[rip+0xfffffaec]
0x1a01489f1557   657  c441f96efa           vmovq xmm15,r10
0x1a01489f155c   65c  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x1a01489f1561   661  c4417b2cc7           vcvttsd2si r8,xmm15
0x1a01489f1566   666  4585c0               testl r8,r8
0x1a01489f1569   669  0f8809000000         js 0x1a01489f1578  <+0x678>
0x1a01489f156f   66f  41ba00000080         movl r10,0x80000000
0x1a01489f1575   675  450bc2               orl r8,r10
0x1a01489f1578   678  458bd0               movl r10,r8
0x1a01489f157b   67b  c441832ae2           vcvtqsi2sd xmm12,xmm15,r10
0x1a01489f1580   680  c441792ee1           vucomisd xmm12,xmm9
0x1a01489f1585   685  0f8ad40d0000         jpe 0x1a01489f235f  <+0x145f>
0x1a01489f158b   68b  0f85ce0d0000         jnz 0x1a01489f235f  <+0x145f>
0x1a01489f1591   691  c4c36922e800         vpinsrd xmm5,xmm2,r8,0x0
0x1a01489f1597   697  c5725ac9             vcvtss2sd xmm9,xmm1,xmm1
0x1a01489f159b   69b  c443190be10b         vroundsd xmm12,xmm12,xmm9,0xb
0x1a01489f15a1   6a1  c4417b2cc4           vcvttsd2si r8,xmm12
0x1a01489f15a6   6a6  4585c0               testl r8,r8
0x1a01489f15a9   6a9  0f8928000000         jns 0x1a01489f15d7  <+0x6d7>
0x1a01489f15af   6af  4c8b158dfaffff       REX.W movq r10,[rip+0xfffffa8d]
0x1a01489f15b6   6b6  c441f96efa           vmovq xmm15,r10
0x1a01489f15bb   6bb  c4410358fc           vaddsd xmm15,xmm15,xmm12
0x1a01489f15c0   6c0  c4417b2cc7           vcvttsd2si r8,xmm15
0x1a01489f15c5   6c5  4585c0               testl r8,r8
0x1a01489f15c8   6c8  0f8809000000         js 0x1a01489f15d7  <+0x6d7>
0x1a01489f15ce   6ce  41ba00000080         movl r10,0x80000000
0x1a01489f15d4   6d4  450bc2               orl r8,r10
0x1a01489f15d7   6d7  458bd0               movl r10,r8
0x1a01489f15da   6da  c441832aea           vcvtqsi2sd xmm13,xmm15,r10
0x1a01489f15df   6df  c441792eec           vucomisd xmm13,xmm12
0x1a01489f15e4   6e4  0f8a990d0000         jpe 0x1a01489f2383  <+0x1483>
0x1a01489f15ea   6ea  0f85930d0000         jnz 0x1a01489f2383  <+0x1483>
0x1a01489f15f0   6f0  c4c35122e801         vpinsrd xmm5,xmm5,r8,0x1
0x1a01489f15f6   6f6  c4e2793bed           vpminud xmm5,xmm0,xmm5
0x1a01489f15fb   6fb  c589dbed             vpand xmm5,xmm14,xmm5
0x1a01489f15ff   6ff  c551fecb             vpaddd xmm9,xmm5,xmm3
0x1a01489f1603   703  c442793bc9           vpminud xmm9,xmm0,xmm9
0x1a01489f1608   708  c4425940e1           vpmulld xmm12,xmm4,xmm9
0x1a01489f160d   70d  c4437916e001         vpextrd r8,xmm12,0x1
0x1a01489f1613   713  c5f97ee8             vmovd rax,xmm5
0x1a01489f1617   717  4533db               xorl r11,r11
0x1a01489f161a   71a  85c0                 testl rax,rax
0x1a01489f161c   71c  410f95c3             setnzl r11l
0x1a01489f1620   720  412bc3               subl rax,r11
0x1a01489f1623   723  468d1c00             leal r11,[rax+r8*1]
0x1a01489f1627   727  4531e4               xorl r12,r12
0x1a01489f162a   72a  443bd9               cmpl r11,rcx
0x1a01489f162d   72d  410f92c4             setcl r12l
0x1a01489f1631   731  c44159fee1           vpaddd xmm12,xmm4,xmm9
0x1a01489f1636   736  c5797ee3             vmovd rbx,xmm12
0x1a01489f163a   73a  4403c3               addl r8,rbx
0x1a01489f163d   73d  33d2                 xorl rdx,rdx
0x1a01489f163f   73f  443bc1               cmpl r8,rcx
0x1a01489f1642   742  0f92c2               setcl dl
0x1a01489f1645   745  4421e2               andl rdx,r12
0x1a01489f1648   748  c4c37916ec01         vpextrd r12,xmm5,0x1
0x1a01489f164e   74e  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x1a01489f1655   755  33d2                 xorl rdx,rdx
0x1a01489f1657   757  4585e4               testl r12,r12
0x1a01489f165a   75a  0f95c2               setnzl dl
0x1a01489f165d   75d  442be2               subl r12,rdx
0x1a01489f1660   760  468d0486             leal r8,[rsi+r8*4]
0x1a01489f1664   764  468d1c9e             leal r11,[rsi+r11*4]
0x1a01489f1668   768  c4637916ca01         vpextrd rdx,xmm9,0x1
0x1a01489f166e   76e  488985a0feffff       REX.W movq [rbp-0x160],rax
0x1a01489f1675   775  48899da8feffff       REX.W movq [rbp-0x158],rbx
0x1a01489f167c   77c  4c8985f8feffff       REX.W movq [rbp-0x108],r8
0x1a01489f1683   783  4c899d00ffffff       REX.W movq [rbp-0x100],r11
0x1a01489f168a   78a  488995e8feffff       REX.W movq [rbp-0x118],rdx
0x1a01489f1691   791  c4c17928e8           vmovapd xmm5,xmm8
0x1a01489f1696   796  c4417928c8           vmovapd xmm9,xmm8
0x1a01489f169b   79b  c4417928e0           vmovapd xmm12,xmm8
0x1a01489f16a0   7a0  c4417928e8           vmovapd xmm13,xmm8
0x1a01489f16a5   7a5  c4417928f0           vmovapd xmm14,xmm8
0x1a01489f16aa   7aa  c4c17928c8           vmovapd xmm1,xmm8
0x1a01489f16af   7af  c4c17928d0           vmovapd xmm2,xmm8
0x1a01489f16b4   7b4  4c89a548feffff       REX.W movq [rbp-0x1b8],r12
0x1a01489f16bb   7bb  448b8520ffffff       movl r8,[rbp-0xe0]
0x1a01489f16c2   7c2  4533db               xorl r11,r11
0x1a01489f16c5   7c5  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f16cc   7cc  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x1a01489f16d3   7d3  e945000000           jmp 0x1a01489f171d  <+0x81d>
0x1a01489f16d8   7d8  660f1f840000000000   nop
0x1a01489f16e1   7e1  660f1f840000000000   nop
0x1a01489f16ea   7ea  660f1f840000000000   nop
0x1a01489f16f3   7f3  660f1f840000000000   nop
0x1a01489f16fc   7fc  0f1f4000             nop
0x1a01489f1700   800  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f1704   804  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f170a   80a  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f1712   812  458bde               movl r11,r14
0x1a01489f1715   815  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f171d   81d  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f1725   825  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f1729   829  0f86780c0000         jna 0x1a01489f23a7  <+0x14a7>
0x1a01489f172f   82f  4585db               testl r11,r11
0x1a01489f1732   832  0f841a000000         jz 0x1a01489f1752  <+0x852>
0x1a01489f1738   838  443b5dc8             cmpl r11,[rbp-0x38]
0x1a01489f173c   83c  0f8410000000         jz 0x1a01489f1752  <+0x852>
0x1a01489f1742   842  48c78530ffffff00000000 REX.W movq [rbp-0xd0],0x0
0x1a01489f174d   84d  e90b000000           jmp 0x1a01489f175d  <+0x85d>
0x1a01489f1752   852  48c78530ffffff01000000 REX.W movq [rbp-0xd0],0x1
0x1a01489f175d   85d  458bfb               movl r15,r11
0x1a01489f1760   860  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f1764   864  e95c000000           jmp 0x1a01489f17c5  <+0x8c5>
0x1a01489f1769   869  660f1f840000000000   nop
0x1a01489f1772   872  660f1f840000000000   nop
0x1a01489f177b   87b  0f1f440000           nop
0x1a01489f1780   880  4c899d30ffffff       REX.W movq [rbp-0xd0],r11
0x1a01489f1787   887  458bd8               movl r11,r8
0x1a01489f178a   88a  448bf8               movl r15,rax
0x1a01489f178d   88d  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f1793   893  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f1799   899  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f179f   89f  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f17a5   8a5  448bc2               movl r8,rdx
0x1a01489f17a8   8a8  8b95e8feffff         movl rdx,[rbp-0x118]
0x1a01489f17ae   8ae  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f17b6   8b6  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f17be   8be  4889bd18ffffff       REX.W movq [rbp-0xe8],rdi
0x1a01489f17c5   8c5  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f17c9   8c9  0f86c70c0000         jna 0x1a01489f2496  <+0x1596>
0x1a01489f17cf   8cf  83bd30ffffff00       cmpl [rbp-0xd0],0x0
0x1a01489f17d6   8d6  0f8597000000         jnz 0x1a01489f1873  <+0x973>
0x1a01489f17dc   8dc  458d7704             leal r14,[r15+0x4]
0x1a01489f17e0   8e0  478b3c3c             movl r15,[r12+r15*1]
0x1a01489f17e4   8e4  443b7dd0             cmpl r15,[rbp-0x30]
0x1a01489f17e8   8e8  0f841f000000         jz 0x1a01489f180d  <+0x90d>
0x1a01489f17ee   8ee  453bcf               cmpl r9,r15
0x1a01489f17f1   8f1  0f8616000000         jna 0x1a01489f180d  <+0x90d>
0x1a01489f17f7   8f7  453bc7               cmpl r8,r15
0x1a01489f17fa   8fa  0f860d000000         jna 0x1a01489f180d  <+0x90d>
0x1a01489f1800   900  443bbd28ffffff       cmpl r15,[rbp-0xd8]
0x1a01489f1807   907  0f828f070000         jc 0x1a01489f1f9c  <+0x109c>
0x1a01489f180d   90d  453bf3               cmpl r14,r11
0x1a01489f1810   910  0f842a000000         jz 0x1a01489f1840  <+0x940>
0x1a01489f1816   916  418bd0               movl rdx,r8
0x1a01489f1819   919  458bc3               movl r8,r11
0x1a01489f181c   91c  418bc6               movl rax,r14
0x1a01489f181f   91f  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f1826   926  8bb540ffffff         movl rsi,[rbp-0xc0]
0x1a01489f182c   92c  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f1832   932  8b5de0               movl rbx,[rbp-0x20]
0x1a01489f1835   935  8bbd18ffffff         movl rdi,[rbp-0xe8]
0x1a01489f183b   93b  e954070000           jmp 0x1a01489f1f94  <+0x1094>
0x1a01489f1840   940  41bf01000000         movl r15,0x1
0x1a01489f1846   946  418bd0               movl rdx,r8
0x1a01489f1849   949  458bc3               movl r8,r11
0x1a01489f184c   94c  8bbd18ffffff         movl rdi,[rbp-0xe8]
0x1a01489f1852   952  418bc6               movl rax,r14
0x1a01489f1855   955  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f185c   95c  8b5de0               movl rbx,[rbp-0x20]
0x1a01489f185f   95f  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f1865   965  8bb540ffffff         movl rsi,[rbp-0xc0]
0x1a01489f186b   96b  4d8bdf               REX.W movq r11,r15
0x1a01489f186e   96e  e90dffffff           jmp 0x1a01489f1780  <+0x880>
0x1a01489f1873   973  f68518ffffffff       testb [rbp-0xe8],0xff
0x1a01489f187a   97a  0f85b6080000         jnz 0x1a01489f2136  <+0x1236>
0x1a01489f1880   980  3b9548feffff         cmpl rdx,[rbp-0x1b8]
0x1a01489f1886   986  0f8268080000         jc 0x1a01489f20f4  <+0x11f4>
0x1a01489f188c   98c  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f1893   993  448b8510ffffff       movl r8,[rbp-0xf0]
0x1a01489f189a   99a  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f18a2   9a2  e943000000           jmp 0x1a01489f18ea  <+0x9ea>
0x1a01489f18a7   9a7  660f1f840000000000   nop
0x1a01489f18b0   9b0  660f1f840000000000   nop
0x1a01489f18b9   9b9  0f1f8000000000       nop
0x1a01489f18c0   9c0  8bd0                 movl rdx,rax
0x1a01489f18c2   9c2  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f18c8   9c8  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f18ce   9ce  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f18d4   9d4  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f18da   9da  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f18e2   9e2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f18ea   9ea  448bbd48feffff       movl r15,[rbp-0x1b8]
0x1a01489f18f1   9f1  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f18f5   9f5  0f86920c0000         jna 0x1a01489f258d  <+0x168d>
0x1a01489f18fb   9fb  413bd7               cmpl rdx,r15
0x1a01489f18fe   9fe  0f8647030000         jna 0x1a01489f1c4b  <+0xd4b>
0x1a01489f1904   a04  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f1908   a08  8b9520ffffff         movl rdx,[rbp-0xe0]
0x1a01489f190e   a0e  660f1f840000000000   nop
0x1a01489f1917   a17  660f1f840000000000   nop
0x1a01489f1920   a20  660f1f840000000000   nop
0x1a01489f1929   a29  660f1f840000000000   nop
0x1a01489f1932   a32  660f1f840000000000   nop
0x1a01489f193b   a3b  0f1f440000           nop
0x1a01489f1940   a40  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f1944   a44  0f86370d0000         jna 0x1a01489f2681  <+0x1781>
0x1a01489f194a   a4a  458d5f01             leal r11,[r15+0x1]
0x1a01489f194e   a4e  4c899d48feffff       REX.W movq [rbp-0x1b8],r11
0x1a01489f1955   a55  448b9d88feffff       movl r11,[rbp-0x178]
0x1a01489f195c   a5c  450fafdf             imull r11,r15
0x1a01489f1960   a60  468d3c18             leal r15,[rax+r11*1]
0x1a01489f1964   a64  413bcf               cmpl rcx,r15
0x1a01489f1967   a67  0f8654010000         jna 0x1a01489f1ac1  <+0xbc1>
0x1a01489f196d   a6d  4403db               addl r11,rbx
0x1a01489f1970   a70  413bcb               cmpl rcx,r11
0x1a01489f1973   a73  0f8648010000         jna 0x1a01489f1ac1  <+0xbc1>
0x1a01489f1979   a79  468d1c9e             leal r11,[rsi+r11*4]
0x1a01489f197d   a7d  478b1c1c             movl r11,[r12+r11*1]
0x1a01489f1981   a81  468d3cbe             leal r15,[rsi+r15*4]
0x1a01489f1985   a85  478b3c3c             movl r15,[r12+r15*1]
0x1a01489f1989   a89  453bdf               cmpl r11,r15
0x1a01489f198c   a8c  0f822f010000         jc 0x1a01489f1ac1  <+0xbc1>
0x1a01489f1992   a92  453bf3               cmpl r14,r11
0x1a01489f1995   a95  0f8226010000         jc 0x1a01489f1ac1  <+0xbc1>
0x1a01489f199b   a9b  453bdf               cmpl r11,r15
0x1a01489f199e   a9e  0f841d010000         jz 0x1a01489f1ac1  <+0xbc1>
0x1a01489f19a4   aa4  438d0cb8             leal rcx,[r8+r15*4]
0x1a01489f19a8   aa8  452bdf               subl r11,r15
0x1a01489f19ab   aab  468d3c9d00000000     leal r15,[r11*4+0x0]
0x1a01489f19b3   ab3  468d1c99             leal r11,[rcx+r11*4]
0x1a01489f19b7   ab7  660f1f840000000000   nop
0x1a01489f19c0   ac0  8d7104               leal rsi,[rcx+0x4]
0x1a01489f19c3   ac3  418b040c             movl rax,[r12+rcx*1]
0x1a01489f19c7   ac7  3b45d0               cmpl rax,[rbp-0x30]
0x1a01489f19ca   aca  0f841d000000         jz 0x1a01489f19ed  <+0xaed>
0x1a01489f19d0   ad0  443bc8               cmpl r9,rax
0x1a01489f19d3   ad3  0f8614000000         jna 0x1a01489f19ed  <+0xaed>
0x1a01489f19d9   ad9  3bd0                 cmpl rdx,rax
0x1a01489f19db   adb  0f860c000000         jna 0x1a01489f19ed  <+0xaed>
0x1a01489f19e1   ae1  3b8528ffffff         cmpl rax,[rbp-0xd8]
0x1a01489f19e7   ae7  0f82ed000000         jc 0x1a01489f1ada  <+0xbda>
0x1a01489f19ed   aed  4183c7fc             addl r15,0xfc
0x1a01489f19f1   af1  0f84af000000         jz 0x1a01489f1aa6  <+0xba6>
0x1a01489f19f7   af7  8d4108               leal rax,[rcx+0x8]
0x1a01489f19fa   afa  418b3434             movl rsi,[r12+rsi*1]
0x1a01489f19fe   afe  3b75d0               cmpl rsi,[rbp-0x30]
0x1a01489f1a01   b01  0f841d000000         jz 0x1a01489f1a24  <+0xb24>
0x1a01489f1a07   b07  443bce               cmpl r9,rsi
0x1a01489f1a0a   b0a  0f8614000000         jna 0x1a01489f1a24  <+0xb24>
0x1a01489f1a10   b10  3bd6                 cmpl rdx,rsi
0x1a01489f1a12   b12  0f860c000000         jna 0x1a01489f1a24  <+0xb24>
0x1a01489f1a18   b18  3bb528ffffff         cmpl rsi,[rbp-0xd8]
0x1a01489f1a1e   b1e  0f82c8000000         jc 0x1a01489f1aec  <+0xbec>
0x1a01489f1a24   b24  4183c7fc             addl r15,0xfc
0x1a01489f1a28   b28  0f847a000000         jz 0x1a01489f1aa8  <+0xba8>
0x1a01489f1a2e   b2e  8d710c               leal rsi,[rcx+0xc]
0x1a01489f1a31   b31  418b0404             movl rax,[r12+rax*1]
0x1a01489f1a35   b35  3b45d0               cmpl rax,[rbp-0x30]
0x1a01489f1a38   b38  0f841d000000         jz 0x1a01489f1a5b  <+0xb5b>
0x1a01489f1a3e   b3e  443bc8               cmpl r9,rax
0x1a01489f1a41   b41  0f8614000000         jna 0x1a01489f1a5b  <+0xb5b>
0x1a01489f1a47   b47  3bd0                 cmpl rdx,rax
0x1a01489f1a49   b49  0f860c000000         jna 0x1a01489f1a5b  <+0xb5b>
0x1a01489f1a4f   b4f  3b8528ffffff         cmpl rax,[rbp-0xd8]
0x1a01489f1a55   b55  0f82a7000000         jc 0x1a01489f1b02  <+0xc02>
0x1a01489f1a5b   b5b  4183c7fc             addl r15,0xfc
0x1a01489f1a5f   b5f  0f8441000000         jz 0x1a01489f1aa6  <+0xba6>
0x1a01489f1a65   b65  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f1a69   b69  0f86f80c0000         jna 0x1a01489f2767  <+0x1867>
0x1a01489f1a6f   b6f  83c110               addl rcx,0x10
0x1a01489f1a72   b72  418b0434             movl rax,[r12+rsi*1]
0x1a01489f1a76   b76  3b45d0               cmpl rax,[rbp-0x30]
0x1a01489f1a79   b79  0f841d000000         jz 0x1a01489f1a9c  <+0xb9c>
0x1a01489f1a7f   b7f  443bc8               cmpl r9,rax
0x1a01489f1a82   b82  0f8614000000         jna 0x1a01489f1a9c  <+0xb9c>
0x1a01489f1a88   b88  3bd0                 cmpl rdx,rax
0x1a01489f1a8a   b8a  0f860c000000         jna 0x1a01489f1a9c  <+0xb9c>
0x1a01489f1a90   b90  3b8528ffffff         cmpl rax,[rbp-0xd8]
0x1a01489f1a96   b96  0f825d000000         jc 0x1a01489f1af9  <+0xbf9>
0x1a01489f1a9c   b9c  4183c7fc             addl r15,0xfc
0x1a01489f1aa0   ba0  0f851affffff         jnz 0x1a01489f19c0  <+0xac0>
0x1a01489f1aa6   ba6  8bf0                 movl rsi,rax
0x1a01489f1aa8   ba8  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f1aac   bac  448bde               movl r11,rsi
0x1a01489f1aaf   baf  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f1ab5   bb5  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f1abb   bbb  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f1ac1   bc1  448bbd48feffff       movl r15,[rbp-0x1b8]
0x1a01489f1ac8   bc8  443bbde8feffff       cmpl r15,[rbp-0x118]
0x1a01489f1acf   bcf  0f845d010000         jz 0x1a01489f1c32  <+0xd32>
0x1a01489f1ad5   bd5  e966feffff           jmp 0x1a01489f1940  <+0xa40>
0x1a01489f1ada   bda  448bbdb8feffff       movl r15,[rbp-0x148]
0x1a01489f1ae1   be1  8b8da0feffff         movl rcx,[rbp-0x160]
0x1a01489f1ae7   be7  e916000000           jmp 0x1a01489f1b02  <+0xc02>
0x1a01489f1aec   bec  448bd6               movl r10,rsi
0x1a01489f1aef   bef  8bf0                 movl rsi,rax
0x1a01489f1af1   bf1  418bc2               movl rax,r10
0x1a01489f1af4   bf4  e909000000           jmp 0x1a01489f1b02  <+0xc02>
0x1a01489f1af9   bf9  8bf1                 movl rsi,rcx
0x1a01489f1afb   bfb  448bbda0feffff       movl r15,[rbp-0x160]
0x1a01489f1b02   c02  448d3c8500000000     leal r15,[rax*4+0x0]
0x1a01489f1b0a   c0a  4c89bd30ffffff       REX.W movq [rbp-0xd0],r15
0x1a01489f1b11   c11  8b8d40ffffff         movl rcx,[rbp-0xc0]
0x1a01489f1b17   c17  448d3c81             leal r15,[rcx+rax*4]
0x1a01489f1b1b   c1b  c4817a101c3c         vmovss xmm3,[r12+r15*1]
0x1a01489f1b21   c21  c5a25ce3             vsubss xmm4,xmm11,xmm3
0x1a01489f1b25   c25  c55a59dc             vmulss xmm11,xmm4,xmm4
0x1a01489f1b29   c29  448bbd50ffffff       movl r15,[rbp-0xb0]
0x1a01489f1b30   c30  418d1c87             leal rbx,[r15+rax*4]
0x1a01489f1b34   c34  c5fb116580           vmovsd [rbp-0x80],xmm4
0x1a01489f1b39   c39  c4c17a10241c         vmovss xmm4,[r12+rbx*1]
0x1a01489f1b3f   c3f  c5fa5ccc             vsubss xmm1,xmm0,xmm4
0x1a01489f1b43   c43  c5f259c1             vmulss xmm0,xmm1,xmm1
0x1a01489f1b47   c47  c4c17a58c3           vaddss xmm0,xmm0,xmm11
0x1a01489f1b4c   c4c  c5f82ef8             vucomiss xmm7,xmm0
0x1a01489f1b50   c50  0f8756000000         ja 0x1a01489f1bac  <+0xcac>
0x1a01489f1b56   c56  c5f82ef0             vucomiss xmm6,xmm0
0x1a01489f1b5a   c5a  0f8665000000         jna 0x1a01489f1bc5  <+0xcc5>
0x1a01489f1b60   c60  c4c1782ec0           vucomiss xmm0,xmm8
0x1a01489f1b65   c65  0f865a000000         jna 0x1a01489f1bc5  <+0xcc5>
0x1a01489f1b6b   c6b  c4410a58f2           vaddss xmm14,xmm14,xmm10
0x1a01489f1b70   c70  8b9d78ffffff         movl rbx,[rbp-0x88]
0x1a01489f1b76   c76  8d0c83               leal rcx,[rbx+rax*4]
0x1a01489f1b79   c79  c4c17a10040c         vmovss xmm0,[r12+rcx*1]
0x1a01489f1b7f   c7f  c4417a58ed           vaddss xmm13,xmm0,xmm13
0x1a01489f1b84   c84  8b8d70ffffff         movl rcx,[rbp-0x90]
0x1a01489f1b8a   c8a  8d0481               leal rax,[rcx+rax*4]
0x1a01489f1b8d   c8d  c4c17a100404         vmovss xmm0,[r12+rax*1]
0x1a01489f1b93   c93  c4417a58e4           vaddss xmm12,xmm0,xmm12
0x1a01489f1b98   c98  c4415a58c9           vaddss xmm9,xmm4,xmm9
0x1a01489f1b9d   c9d  c5e258ed             vaddss xmm5,xmm3,xmm5
0x1a01489f1ba1   ca1  8b8d40ffffff         movl rcx,[rbp-0xc0]
0x1a01489f1ba7   ca7  e919000000           jmp 0x1a01489f1bc5  <+0xcc5>
0x1a01489f1bac   cac  c5f258d2             vaddss xmm2,xmm1,xmm2
0x1a01489f1bb0   cb0  c5fb104580           vmovsd xmm0,[rbp-0x80]
0x1a01489f1bb5   cb5  c5fa588d58feffff     vaddss xmm1,xmm0,[rbp-0x1a8]
0x1a01489f1bbd   cbd  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f1bc5   cc5  413bf3               cmpl rsi,r11
0x1a01489f1bc8   cc8  0f8517000000         jnz 0x1a01489f1be5  <+0xce5>
0x1a01489f1bce   cce  8b85e8feffff         movl rax,[rbp-0x118]
0x1a01489f1bd4   cd4  3b8548feffff         cmpl rax,[rbp-0x1b8]
0x1a01489f1bda   cda  0f83e0fcffff         jnc 0x1a01489f18c0  <+0x9c0>
0x1a01489f1be0   ce0  e9b6040000           jmp 0x1a01489f209b  <+0x119b>
0x1a01489f1be5   ce5  8b5de0               movl rbx,[rbp-0x20]
0x1a01489f1be8   ce8  c4c17a11541c48       vmovss [r12+rbx*1+0x48],xmm2
0x1a01489f1bef   cef  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f1bf7   cf7  c4c17a114c1c44       vmovss [r12+rbx*1+0x44],xmm1
0x1a01489f1bfe   cfe  c4417a11741c40       vmovss [r12+rbx*1+0x40],xmm14
0x1a01489f1c05   d05  c4417a116c1c3c       vmovss [r12+rbx*1+0x3c],xmm13
0x1a01489f1c0c   d0c  c4417a11641c38       vmovss [r12+rbx*1+0x38],xmm12
0x1a01489f1c13   d13  c4417a114c1c34       vmovss [r12+rbx*1+0x34],xmm9
0x1a01489f1c1a   d1a  c4c17a116c1c30       vmovss [r12+rbx*1+0x30],xmm5
0x1a01489f1c21   d21  458bc3               movl r8,r11
0x1a01489f1c24   d24  8bc6                 movl rax,rsi
0x1a01489f1c26   d26  8bf1                 movl rsi,rcx
0x1a01489f1c28   d28  418bcf               movl rcx,r15
0x1a01489f1c2b   d2b  33ff                 xorl rdi,rdi
0x1a01489f1c2d   d2d  e962030000           jmp 0x1a01489f1f94  <+0x1094>
0x1a01489f1c32   d32  458bfb               movl r15,r11
0x1a01489f1c35   d35  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f1c39   d39  8b95e8feffff         movl rdx,[rbp-0x118]
0x1a01489f1c3f   d3f  48899548feffff       REX.W movq [rbp-0x1b8],rdx
0x1a01489f1c46   d46  e90e000000           jmp 0x1a01489f1c59  <+0xd59>
0x1a01489f1c4b   d4b  4c89bd48feffff       REX.W movq [rbp-0x1b8],r15
0x1a01489f1c52   d52  448bbd30ffffff       movl r15,[rbp-0xd0]
0x1a01489f1c59   d59  8b75e0               movl rsi,[rbp-0x20]
0x1a01489f1c5c   d5c  c4c17a11543448       vmovss [r12+rsi*1+0x48],xmm2
0x1a01489f1c63   d63  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f1c6b   d6b  c4c17a114c3444       vmovss [r12+rsi*1+0x44],xmm1
0x1a01489f1c72   d72  c4417a11743440       vmovss [r12+rsi*1+0x40],xmm14
0x1a01489f1c79   d79  c4417a116c343c       vmovss [r12+rsi*1+0x3c],xmm13
0x1a01489f1c80   d80  c4417a11643438       vmovss [r12+rsi*1+0x38],xmm12
0x1a01489f1c87   d87  c4417a114c3434       vmovss [r12+rsi*1+0x34],xmm9
0x1a01489f1c8e   d8e  c4c17a116c3430       vmovss [r12+rsi*1+0x30],xmm5
0x1a01489f1c95   d95  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f1c9b   d9b  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f1c9f   d9f  4c89bd30ffffff       REX.W movq [rbp-0xd0],r15
0x1a01489f1ca6   da6  83bdf0feffff00       cmpl [rbp-0x110],0x0
0x1a01489f1cad   dad  0f848d040000         jz 0x1a01489f2140  <+0x1240>
0x1a01489f1cb3   db3  448bbdf8feffff       movl r15,[rbp-0x108]
0x1a01489f1cba   dba  478b1c3c             movl r11,[r12+r15*1]
0x1a01489f1cbe   dbe  8b8500ffffff         movl rax,[rbp-0x100]
0x1a01489f1cc4   dc4  418b1c04             movl rbx,[r12+rax*1]
0x1a01489f1cc8   dc8  4c899d30ffffff       REX.W movq [rbp-0xd0],r11
0x1a01489f1ccf   dcf  443bdb               cmpl r11,rbx
0x1a01489f1cd2   dd2  0f8210040000         jc 0x1a01489f20e8  <+0x11e8>
0x1a01489f1cd8   dd8  453bf3               cmpl r14,r11
0x1a01489f1cdb   ddb  0f8207040000         jc 0x1a01489f20e8  <+0x11e8>
0x1a01489f1ce1   de1  443bdb               cmpl r11,rbx
0x1a01489f1ce4   de4  0f84fe030000         jz 0x1a01489f20e8  <+0x11e8>
0x1a01489f1cea   dea  458d1c98             leal r11,[r8+rbx*4]
0x1a01489f1cee   dee  448b8530ffffff       movl r8,[rbp-0xd0]
0x1a01489f1cf5   df5  442bc3               subl r8,rbx
0x1a01489f1cf8   df8  428d1c8500000000     leal rbx,[r8*4+0x0]
0x1a01489f1d00   e00  478d0483             leal r8,[r11+r8*4]
0x1a01489f1d04   e04  660f1f840000000000   nop
0x1a01489f1d0d   e0d  660f1f840000000000   nop
0x1a01489f1d16   e16  660f1f840000000000   nop
0x1a01489f1d1f   e1f  660f1f840000000000   nop
0x1a01489f1d28   e28  660f1f840000000000   nop
0x1a01489f1d31   e31  660f1f840000000000   nop
0x1a01489f1d3a   e3a  660f1f440000         nop
0x1a01489f1d40   e40  418d4304             leal rax,[r11+0x4]
0x1a01489f1d44   e44  438b141c             movl rdx,[r12+r11*1]
0x1a01489f1d48   e48  3b55d0               cmpl rdx,[rbp-0x30]
0x1a01489f1d4b   e4b  0f8425000000         jz 0x1a01489f1d76  <+0xe76>
0x1a01489f1d51   e51  443bca               cmpl r9,rdx
0x1a01489f1d54   e54  0f861c000000         jna 0x1a01489f1d76  <+0xe76>
0x1a01489f1d5a   e5a  448bbd20ffffff       movl r15,[rbp-0xe0]
0x1a01489f1d61   e61  443bfa               cmpl r15,rdx
0x1a01489f1d64   e64  0f860c000000         jna 0x1a01489f1d76  <+0xe76>
0x1a01489f1d6a   e6a  3b9528ffffff         cmpl rdx,[rbp-0xd8]
0x1a01489f1d70   e70  0f82db000000         jc 0x1a01489f1e51  <+0xf51>
0x1a01489f1d76   e76  83c3fc               addl rbx,0xfc
0x1a01489f1d79   e79  0f843b030000         jz 0x1a01489f20ba  <+0x11ba>
0x1a01489f1d7f   e7f  458d7b08             leal r15,[r11+0x8]
0x1a01489f1d83   e83  418b0404             movl rax,[r12+rax*1]
0x1a01489f1d87   e87  3b45d0               cmpl rax,[rbp-0x30]
0x1a01489f1d8a   e8a  0f8423000000         jz 0x1a01489f1db3  <+0xeb3>
0x1a01489f1d90   e90  443bc8               cmpl r9,rax
0x1a01489f1d93   e93  0f861a000000         jna 0x1a01489f1db3  <+0xeb3>
0x1a01489f1d99   e99  8b9520ffffff         movl rdx,[rbp-0xe0]
0x1a01489f1d9f   e9f  3bd0                 cmpl rdx,rax
0x1a01489f1da1   ea1  0f860c000000         jna 0x1a01489f1db3  <+0xeb3>
0x1a01489f1da7   ea7  3b8528ffffff         cmpl rax,[rbp-0xd8]
0x1a01489f1dad   ead  0f82a9000000         jc 0x1a01489f1e5c  <+0xf5c>
0x1a01489f1db3   eb3  83c3fc               addl rbx,0xfc
0x1a01489f1db6   eb6  0f8421030000         jz 0x1a01489f20dd  <+0x11dd>
0x1a01489f1dbc   ebc  418d430c             leal rax,[r11+0xc]
0x1a01489f1dc0   ec0  478b3c3c             movl r15,[r12+r15*1]
0x1a01489f1dc4   ec4  4c89bd30ffffff       REX.W movq [rbp-0xd0],r15
0x1a01489f1dcb   ecb  443b7dd0             cmpl r15,[rbp-0x30]
0x1a01489f1dcf   ecf  0f8425000000         jz 0x1a01489f1dfa  <+0xefa>
0x1a01489f1dd5   ed5  453bcf               cmpl r9,r15
0x1a01489f1dd8   ed8  0f861c000000         jna 0x1a01489f1dfa  <+0xefa>
0x1a01489f1dde   ede  8b9520ffffff         movl rdx,[rbp-0xe0]
0x1a01489f1de4   ee4  413bd7               cmpl rdx,r15
0x1a01489f1de7   ee7  0f860d000000         jna 0x1a01489f1dfa  <+0xefa>
0x1a01489f1ded   eed  443bbd28ffffff       cmpl r15,[rbp-0xd8]
0x1a01489f1df4   ef4  0f826d000000         jc 0x1a01489f1e67  <+0xf67>
0x1a01489f1dfa   efa  83c3fc               addl rbx,0xfc
0x1a01489f1dfd   efd  0f84ca020000         jz 0x1a01489f20cd  <+0x11cd>
0x1a01489f1e03   f03  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a01489f1e07   f07  0f86500a0000         jna 0x1a01489f285d  <+0x195d>
0x1a01489f1e0d   f0d  4183c310             addl r11,0x10
0x1a01489f1e11   f11  418b0404             movl rax,[r12+rax*1]
0x1a01489f1e15   f15  3b45d0               cmpl rax,[rbp-0x30]
0x1a01489f1e18   f18  0f8425000000         jz 0x1a01489f1e43  <+0xf43>
0x1a01489f1e1e   f1e  443bc8               cmpl r9,rax
0x1a01489f1e21   f21  0f861c000000         jna 0x1a01489f1e43  <+0xf43>
0x1a01489f1e27   f27  448bbd20ffffff       movl r15,[rbp-0xe0]
0x1a01489f1e2e   f2e  443bf8               cmpl r15,rax
0x1a01489f1e31   f31  0f860c000000         jna 0x1a01489f1e43  <+0xf43>
0x1a01489f1e37   f37  3b8528ffffff         cmpl rax,[rbp-0xd8]
0x1a01489f1e3d   f3d  0f822c000000         jc 0x1a01489f1e6f  <+0xf6f>
0x1a01489f1e43   f43  83c3fc               addl rbx,0xfc
0x1a01489f1e46   f46  0f85f4feffff         jnz 0x1a01489f1d40  <+0xe40>
0x1a01489f1e4c   f4c  e98c020000           jmp 0x1a01489f20dd  <+0x11dd>
0x1a01489f1e51   f51  448bda               movl r11,rdx
0x1a01489f1e54   f54  418bd7               movl rdx,r15
0x1a01489f1e57   f57  e91f000000           jmp 0x1a01489f1e7b  <+0xf7b>
0x1a01489f1e5c   f5c  448bd8               movl r11,rax
0x1a01489f1e5f   f5f  418bc7               movl rax,r15
0x1a01489f1e62   f62  e914000000           jmp 0x1a01489f1e7b  <+0xf7b>
0x1a01489f1e67   f67  458bdf               movl r11,r15
0x1a01489f1e6a   f6a  e90c000000           jmp 0x1a01489f1e7b  <+0xf7b>
0x1a01489f1e6f   f6f  448bd0               movl r10,rax
0x1a01489f1e72   f72  418bc3               movl rax,r11
0x1a01489f1e75   f75  458bda               movl r11,r10
0x1a01489f1e78   f78  418bd7               movl rdx,r15
0x1a01489f1e7b   f7b  468d3c9d00000000     leal r15,[r11*4+0x0]
0x1a01489f1e83   f83  8b9d40ffffff         movl rbx,[rbp-0xc0]
0x1a01489f1e89   f89  428d3c9b             leal rdi,[rbx+r11*4]
0x1a01489f1e8d   f8d  c4c17a101c3c         vmovss xmm3,[r12+rdi*1]
0x1a01489f1e93   f93  c4c17928e3           vmovapd xmm4,xmm11
0x1a01489f1e98   f98  c55a5cdb             vsubss xmm11,xmm4,xmm3
0x1a01489f1e9c   f9c  c4c12259e3           vmulss xmm4,xmm11,xmm11
0x1a01489f1ea1   fa1  428d3c99             leal rdi,[rcx+r11*4]
0x1a01489f1ea5   fa5  c57b115d80           vmovsd [rbp-0x80],xmm11
0x1a01489f1eaa   faa  c4417a101c3c         vmovss xmm11,[r12+rdi*1]
0x1a01489f1eb0   fb0  c4c17a5ccb           vsubss xmm1,xmm0,xmm11
0x1a01489f1eb5   fb5  c5f259c1             vmulss xmm0,xmm1,xmm1
0x1a01489f1eb9   fb9  c5fa58c4             vaddss xmm0,xmm0,xmm4
0x1a01489f1ebd   fbd  4c89bd30ffffff       REX.W movq [rbp-0xd0],r15
0x1a01489f1ec4   fc4  c5f82ef8             vucomiss xmm7,xmm0
0x1a01489f1ec8   fc8  0f8781000000         ja 0x1a01489f1f4f  <+0x104f>
0x1a01489f1ece   fce  c5f82ef0             vucomiss xmm6,xmm0
0x1a01489f1ed2   fd2  0f869e000000         jna 0x1a01489f1f76  <+0x1076>
0x1a01489f1ed8   fd8  c4c1782ec0           vucomiss xmm0,xmm8
0x1a01489f1edd   fdd  0f8693000000         jna 0x1a01489f1f76  <+0x1076>
0x1a01489f1ee3   fe3  8bbd70ffffff         movl rdi,[rbp-0x90]
0x1a01489f1ee9   fe9  468d0c9f             leal r9,[rdi+r11*4]
0x1a01489f1eed   fed  c4817a10040c         vmovss xmm0,[r12+r9*1]
0x1a01489f1ef3   ff3  448bbd78ffffff       movl r15,[rbp-0x88]
0x1a01489f1efa   ffa  478d1c9f             leal r11,[r15+r11*4]
0x1a01489f1efe   ffe  c4817a10241c         vmovss xmm4,[r12+r11*1]
0x1a01489f1f04  1004  c4410a58f2           vaddss xmm14,xmm14,xmm10
0x1a01489f1f09  1009  c4417a11743440       vmovss [r12+rsi*1+0x40],xmm14
0x1a01489f1f10  1010  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x1a01489f1f15  1015  c4417a116c343c       vmovss [r12+rsi*1+0x3c],xmm13
0x1a01489f1f1c  101c  c4417a58e4           vaddss xmm12,xmm0,xmm12
0x1a01489f1f21  1021  c4417a11643438       vmovss [r12+rsi*1+0x38],xmm12
0x1a01489f1f28  1028  c4412258c9           vaddss xmm9,xmm11,xmm9
0x1a01489f1f2d  102d  c4417a114c3434       vmovss [r12+rsi*1+0x34],xmm9
0x1a01489f1f34  1034  c5e258ed             vaddss xmm5,xmm3,xmm5
0x1a01489f1f38  1038  c4c17a116c3430       vmovss [r12+rsi*1+0x30],xmm5
0x1a01489f1f3f  103f  448bbd30ffffff       movl r15,[rbp-0xd0]
0x1a01489f1f46  1046  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f1f4a  104a  e927000000           jmp 0x1a01489f1f76  <+0x1076>
0x1a01489f1f4f  104f  c5f258d2             vaddss xmm2,xmm1,xmm2
0x1a01489f1f53  1053  c4c17a11543448       vmovss [r12+rsi*1+0x48],xmm2
0x1a01489f1f5a  105a  c5fb104580           vmovsd xmm0,[rbp-0x80]
0x1a01489f1f5f  105f  c5fa588d58feffff     vaddss xmm1,xmm0,[rbp-0x1a8]
0x1a01489f1f67  1067  c4c17a114c3444       vmovss [r12+rsi*1+0x44],xmm1
0x1a01489f1f6e  106e  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f1f76  1076  413bc0               cmpl rax,r8
0x1a01489f1f79  1079  0f8456010000         jz 0x1a01489f20d5  <+0x11d5>
0x1a01489f1f7f  107f  bf01000000           movl rdi,0x1
0x1a01489f1f84  1084  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f1f8c  108c  448bd3               movl r10,rbx
0x1a01489f1f8f  108f  8bde                 movl rbx,rsi
0x1a01489f1f91  1091  418bf2               movl rsi,r10
0x1a01489f1f94  1094  4533db               xorl r11,r11
0x1a01489f1f97  1097  e9e4f7ffff           jmp 0x1a01489f1780  <+0x880>
0x1a01489f1f9c  109c  8bbd40ffffff         movl rdi,[rbp-0xc0]
0x1a01489f1fa2  10a2  428d0cbf             leal rcx,[rdi+r15*4]
0x1a01489f1fa6  10a6  c4c17a101c0c         vmovss xmm3,[r12+rcx*1]
0x1a01489f1fac  10ac  c4c17928e3           vmovapd xmm4,xmm11
0x1a01489f1fb1  10b1  c55a5cdb             vsubss xmm11,xmm4,xmm3
0x1a01489f1fb5  10b5  c4c12259e3           vmulss xmm4,xmm11,xmm11
0x1a01489f1fba  10ba  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f1fc0  10c0  428d3cb9             leal rdi,[rcx+r15*4]
0x1a01489f1fc4  10c4  c57b115d80           vmovsd [rbp-0x80],xmm11
0x1a01489f1fc9  10c9  c4417a101c3c         vmovss xmm11,[r12+rdi*1]
0x1a01489f1fcf  10cf  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f1fd7  10d7  c4c17a5ccb           vsubss xmm1,xmm0,xmm11
0x1a01489f1fdc  10dc  c5f259c1             vmulss xmm0,xmm1,xmm1
0x1a01489f1fe0  10e0  c5fa58c4             vaddss xmm0,xmm0,xmm4
0x1a01489f1fe4  10e4  c5f82ef8             vucomiss xmm7,xmm0
0x1a01489f1fe8  10e8  0f877e000000         ja 0x1a01489f206c  <+0x116c>
0x1a01489f1fee  10ee  c5f82ef0             vucomiss xmm6,xmm0
0x1a01489f1ff2  10f2  0f8608f7ffff         jna 0x1a01489f1700  <+0x800>
0x1a01489f1ff8  10f8  c4c1782ec0           vucomiss xmm0,xmm8
0x1a01489f1ffd  10fd  0f86fdf6ffff         jna 0x1a01489f1700  <+0x800>
0x1a01489f2003  1103  8bbd70ffffff         movl rdi,[rbp-0x90]
0x1a01489f2009  1109  428d0cbf             leal rcx,[rdi+r15*4]
0x1a01489f200d  110d  c4c17a10040c         vmovss xmm0,[r12+rcx*1]
0x1a01489f2013  1113  8bbd78ffffff         movl rdi,[rbp-0x88]
0x1a01489f2019  1119  468d3cbf             leal r15,[rdi+r15*4]
0x1a01489f201d  111d  c4817a10243c         vmovss xmm4,[r12+r15*1]
0x1a01489f2023  1123  c4412a58f6           vaddss xmm14,xmm10,xmm14
0x1a01489f2028  1128  8b4de0               movl rcx,[rbp-0x20]
0x1a01489f202b  112b  c4417a11740c40       vmovss [r12+rcx*1+0x40],xmm14
0x1a01489f2032  1132  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x1a01489f2037  1137  c4417a116c0c3c       vmovss [r12+rcx*1+0x3c],xmm13
0x1a01489f203e  113e  c4417a58e4           vaddss xmm12,xmm0,xmm12
0x1a01489f2043  1143  c4417a11640c38       vmovss [r12+rcx*1+0x38],xmm12
0x1a01489f204a  114a  c4412258c9           vaddss xmm9,xmm11,xmm9
0x1a01489f204f  114f  c4417a114c0c34       vmovss [r12+rcx*1+0x34],xmm9
0x1a01489f2056  1156  c5e258ed             vaddss xmm5,xmm3,xmm5
0x1a01489f205a  115a  c4c17a116c0c30       vmovss [r12+rcx*1+0x30],xmm5
0x1a01489f2061  1161  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f2067  1167  e994f6ffff           jmp 0x1a01489f1700  <+0x800>
0x1a01489f206c  116c  c5f258d2             vaddss xmm2,xmm1,xmm2
0x1a01489f2070  1170  8b7de0               movl rdi,[rbp-0x20]
0x1a01489f2073  1173  c4c17a11543c48       vmovss [r12+rdi*1+0x48],xmm2
0x1a01489f207a  117a  c5fb104580           vmovsd xmm0,[rbp-0x80]
0x1a01489f207f  117f  c5fa588d58feffff     vaddss xmm1,xmm0,[rbp-0x1a8]
0x1a01489f2087  1187  c4c17a114c3c44       vmovss [r12+rdi*1+0x44],xmm1
0x1a01489f208e  118e  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f2096  1196  e965f6ffff           jmp 0x1a01489f1700  <+0x800>
0x1a01489f209b  119b  418bff               movl rdi,r15
0x1a01489f209e  119e  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f20a4  11a4  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f20ac  11ac  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f20b2  11b2  448bc2               movl r8,rdx
0x1a01489f20b5  11b5  e93a000000           jmp 0x1a01489f20f4  <+0x11f4>
0x1a01489f20ba  11ba  8bbd20ffffff         movl rdi,[rbp-0xe0]
0x1a01489f20c0  11c0  8b9d10ffffff         movl rbx,[rbp-0xf0]
0x1a01489f20c6  11c6  8bc2                 movl rax,rdx
0x1a01489f20c8  11c8  e910000000           jmp 0x1a01489f20dd  <+0x11dd>
0x1a01489f20cd  11cd  418bc7               movl rax,r15
0x1a01489f20d0  11d0  e908000000           jmp 0x1a01489f20dd  <+0x11dd>
0x1a01489f20d5  11d5  458bd8               movl r11,r8
0x1a01489f20d8  11d8  e963000000           jmp 0x1a01489f2140  <+0x1240>
0x1a01489f20dd  11dd  448bf8               movl r15,rax
0x1a01489f20e0  11e0  458bd8               movl r11,r8
0x1a01489f20e3  11e3  e958000000           jmp 0x1a01489f2140  <+0x1240>
0x1a01489f20e8  11e8  458bfb               movl r15,r11
0x1a01489f20eb  11eb  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f20ef  11ef  e94c000000           jmp 0x1a01489f2140  <+0x1240>
0x1a01489f20f4  11f4  8b5de0               movl rbx,[rbp-0x20]
0x1a01489f20f7  11f7  c4c17a11541c48       vmovss [r12+rbx*1+0x48],xmm2
0x1a01489f20fe  11fe  c4c17a114c1c44       vmovss [r12+rbx*1+0x44],xmm1
0x1a01489f2105  1205  c4417a11741c40       vmovss [r12+rbx*1+0x40],xmm14
0x1a01489f210c  120c  c4417a116c1c3c       vmovss [r12+rbx*1+0x3c],xmm13
0x1a01489f2113  1213  c4417a11641c38       vmovss [r12+rbx*1+0x38],xmm12
0x1a01489f211a  121a  c4417a114c1c34       vmovss [r12+rbx*1+0x34],xmm9
0x1a01489f2121  1221  c4c17a116c1c30       vmovss [r12+rbx*1+0x30],xmm5
0x1a01489f2128  1228  8bf3                 movl rsi,rbx
0x1a01489f212a  122a  448bbd30ffffff       movl r15,[rbp-0xd0]
0x1a01489f2131  1231  e90a000000           jmp 0x1a01489f2140  <+0x1240>
0x1a01489f2136  1236  8b75e0               movl rsi,[rbp-0x20]
0x1a01489f2139  1239  448bbd30ffffff       movl r15,[rbp-0xd0]
0x1a01489f2140  1240  8d4610               leal rax,[rsi+0x10]
0x1a01489f2143  1243  8d7e20               leal rdi,[rsi+0x20]
0x1a01489f2146  1246  448d4630             leal r8,[rsi+0x30]
0x1a01489f214a  124a  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f2151  1251  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f2155  1255  4c89bd30ffffff       REX.W movq [rbp-0xd0],r15
0x1a01489f215c  125c  8bde                 movl rbx,rsi
0x1a01489f215e  125e  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a01489f2162  1262  8b5598               movl rdx,[rbp-0x68]
0x1a01489f2165  1265  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0x1a01489f216a  126a  c5fb105588           vmovsd xmm2,[rbp-0x78]
0x1a01489f216f  126f  8bcf                 movl rcx,rdi
0x1a01489f2171  1271  458bc8               movl r9,r8
0x1a01489f2174  1274  8bbd10ffffff         movl rdi,[rbp-0xf0]
0x1a01489f217a  127a  e8c9bbf1ff           call 0x1a014890dd48  (jump table)
0x1a01489f217f  127f  8b7da0               movl rdi,[rbp-0x60]
0x1a01489f2182  1282  3b7dd0               cmpl rdi,[rbp-0x30]
0x1a01489f2185  1285  0f866f000000         jna 0x1a01489f21fa  <+0x12fa>
0x1a01489f218b  128b  448b45d0             movl r8,[rbp-0x30]
0x1a01489f218f  128f  448b5da8             movl r11,[rbp-0x58]
0x1a01489f2193  1293  478d2483             leal r12,[r11+r8*4]
0x1a01489f2197  1297  448b7de0             movl r15,[rbp-0x20]
0x1a01489f219b  129b  4c8bb538ffffff       REX.W movq r14,[rbp-0xc8]
0x1a01489f21a2  12a2  c4817a10443e10       vmovss xmm0,[r14+r15*1+0x10]
0x1a01489f21a9  12a9  c4817a110426         vmovss [r14+r12*1],xmm0
0x1a01489f21af  12af  448b65b0             movl r12,[rbp-0x50]
0x1a01489f21b3  12b3  438d0484             leal rax,[r12+r8*4]
0x1a01489f21b7  12b7  c4817a10443e14       vmovss xmm0,[r14+r15*1+0x14]
0x1a01489f21be  12be  c4c17a110406         vmovss [r14+rax*1],xmm0
0x1a01489f21c4  12c4  8b5db8               movl rbx,[rbp-0x48]
0x1a01489f21c7  12c7  428d0483             leal rax,[rbx+r8*4]
0x1a01489f21cb  12cb  c4817a10443e18       vmovss xmm0,[r14+r15*1+0x18]
0x1a01489f21d2  12d2  c4c17a110406         vmovss [r14+rax*1],xmm0
0x1a01489f21d8  12d8  8b55c0               movl rdx,[rbp-0x40]
0x1a01489f21db  12db  428d0482             leal rax,[rdx+r8*4]
0x1a01489f21df  12df  c4817a10443e1c       vmovss xmm0,[r14+r15*1+0x1c]
0x1a01489f21e6  12e6  c4c17a110406         vmovss [r14+rax*1],xmm0
0x1a01489f21ec  12ec  458bd0               movl r10,r8
0x1a01489f21ef  12ef  448bc7               movl r8,rdi
0x1a01489f21f2  12f2  418bfa               movl rdi,r10
0x1a01489f21f5  12f5  e920000000           jmp 0x1a01489f221a  <+0x131a>
0x1a01489f21fa  12fa  448bc7               movl r8,rdi
0x1a01489f21fd  12fd  8b7dd0               movl rdi,[rbp-0x30]
0x1a01489f2200  1300  4c8bb538ffffff       REX.W movq r14,[rbp-0xc8]
0x1a01489f2207  1307  e90e000000           jmp 0x1a01489f221a  <+0x131a>
0x1a01489f220c  130c  448b45a0             movl r8,[rbp-0x60]
0x1a01489f2210  1310  48898530ffffff       REX.W movq [rbp-0xd0],rax
0x1a01489f2217  1317  4d8bf3               REX.W movq r14,r11
0x1a01489f221a  131a  83c701               addl rdi,0x1
0x1a01489f221d  131d  448b5dd8             movl r11,[rbp-0x28]
0x1a01489f2221  1321  443bdf               cmpl r11,rdi
0x1a01489f2224  1324  0f8556f1ffff         jnz 0x1a01489f1380  <+0x480>
0x1a01489f222a  132a  8b7de0               movl rdi,[rbp-0x20]
0x1a01489f222d  132d  83c750               addl rdi,0x50
0x1a01489f2230  1330  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x1a01489f2234  1334  418938               movl [r8],rdi
0x1a01489f2237  1337  488be5               REX.W movq rsp,rbp
0x1a01489f223a  133a  5d                   pop rbp
0x1a01489f223b  133b  c3                   retl
0x1a01489f223c  133c  e88fc2f1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f2241  1341  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a01489f2245  1345  8b8530ffffff         movl rax,[rbp-0xd0]
0x1a01489f224b  134b  488bbd38ffffff       REX.W movq rdi,[rbp-0xc8]
0x1a01489f2252  1352  e9d3ecffff           jmp 0x1a01489f0f2a  <+0x2a>
0x1a01489f2257  1357  c5f92eed             vucomisd xmm5,xmm5
0x1a01489f225b  135b  0f8b0b000000         jpo 0x1a01489f226c  <+0x136c>
0x1a01489f2261  1361  4533ff               xorl r15,r15
0x1a01489f2264  1364  4d8be7               REX.W movq r12,r15
0x1a01489f2267  1367  e917eeffff           jmp 0x1a01489f1083  <+0x183>
0x1a01489f226c  136c  c5d057ed             vxorps xmm5,xmm5,xmm5
0x1a01489f2270  1370  c5f82eeb             vucomiss xmm5,xmm3
0x1a01489f2274  1374  0f870b000000         ja 0x1a01489f2285  <+0x1385>
0x1a01489f227a  137a  41bcffffffff         movl r12,0xffffffff
0x1a01489f2280  1380  e9feedffff           jmp 0x1a01489f1083  <+0x183>
0x1a01489f2285  1385  4531e4               xorl r12,r12
0x1a01489f2288  1388  e9f6edffff           jmp 0x1a01489f1083  <+0x183>
0x1a01489f228d  138d  c5f92ef6             vucomisd xmm6,xmm6
0x1a01489f2291  1391  0f8b08000000         jpo 0x1a01489f229f  <+0x139f>
0x1a01489f2297  1397  4531e4               xorl r12,r12
0x1a01489f229a  139a  e948eeffff           jmp 0x1a01489f10e7  <+0x1e7>
0x1a01489f229f  139f  c5c857f6             vxorps xmm6,xmm6,xmm6
0x1a01489f22a3  13a3  c5f82ef5             vucomiss xmm6,xmm5
0x1a01489f22a7  13a7  77ee                 ja 0x1a01489f2297  <+0x1397>
0x1a01489f22a9  13a9  41bcffffffff         movl r12,0xffffffff
0x1a01489f22af  13af  e933eeffff           jmp 0x1a01489f10e7  <+0x1e7>
0x1a01489f22b4  13b4  48898530ffffff       REX.W movq [rbp-0xd0],rax
0x1a01489f22bb  13bb  48897dd0             REX.W movq [rbp-0x30],rdi
0x1a01489f22bf  13bf  4c899d38ffffff       REX.W movq [rbp-0xc8],r11
0x1a01489f22c6  13c6  e805c2f1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f22cb  13cb  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f22cf  13cf  8b7dd0               movl rdi,[rbp-0x30]
0x1a01489f22d2  13d2  8b8530ffffff         movl rax,[rbp-0xd0]
0x1a01489f22d8  13d8  4c8b9d38ffffff       REX.W movq r11,[rbp-0xc8]
0x1a01489f22df  13df  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f22e4  13e4  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f22ea  13ea  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f22f0  13f0  8b9578ffffff         movl rdx,[rbp-0x88]
0x1a01489f22f6  13f6  8b9d70ffffff         movl rbx,[rbp-0x90]
0x1a01489f22fc  13fc  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f2301  1401  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f2309  1409  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f2311  1411  448bb550ffffff       movl r14,[rbp-0xb0]
0x1a01489f2318  1418  448bbd40ffffff       movl r15,[rbp-0xc0]
0x1a01489f231f  141f  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f2325  1425  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f232b  142b  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x1a01489f2333  1433  c5f81085c0feffff     vmovups xmm0,[rbp-0x140]
0x1a01489f233b  143b  c5f8109d20feffff     vmovups xmm3,[rbp-0x1e0]
0x1a01489f2343  1443  c578108d90feffff     vmovups xmm9,[rbp-0x170]
0x1a01489f234b  144b  c5fb10add0feffff     vmovsd xmm5,[rbp-0x130]
0x1a01489f2353  1453  448ba5e0feffff       movl r12,[rbp-0x120]
0x1a01489f235a  145a  e9b2f0ffff           jmp 0x1a01489f1411  <+0x511>
0x1a01489f235f  145f  c5f92eed             vucomisd xmm5,xmm5
0x1a01489f2363  1463  0f8b08000000         jpo 0x1a01489f2371  <+0x1471>
0x1a01489f2369  1469  4533c0               xorl r8,r8
0x1a01489f236c  146c  e920f2ffff           jmp 0x1a01489f1591  <+0x691>
0x1a01489f2371  1471  c441782ec5           vucomiss xmm8,xmm13
0x1a01489f2376  1476  77f1                 ja 0x1a01489f2369  <+0x1469>
0x1a01489f2378  1478  41b8ffffffff         movl r8,0xffffffff
0x1a01489f237e  147e  e90ef2ffff           jmp 0x1a01489f1591  <+0x691>
0x1a01489f2383  1483  c441792ec9           vucomisd xmm9,xmm9
0x1a01489f2388  1488  0f8b08000000         jpo 0x1a01489f2396  <+0x1496>
0x1a01489f238e  148e  4533c0               xorl r8,r8
0x1a01489f2391  1491  e95af2ffff           jmp 0x1a01489f15f0  <+0x6f0>
0x1a01489f2396  1496  c5782ec1             vucomiss xmm8,xmm1
0x1a01489f239a  149a  77f2                 ja 0x1a01489f238e  <+0x148e>
0x1a01489f239c  149c  41b8ffffffff         movl r8,0xffffffff
0x1a01489f23a2  14a2  e949f2ffff           jmp 0x1a01489f15f0  <+0x6f0>
0x1a01489f23a7  14a7  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f23af  14af  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f23b7  14b7  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f23bf  14bf  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f23c7  14c7  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f23cf  14cf  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f23d7  14d7  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f23df  14df  4c895d80             REX.W movq [rbp-0x80],r11
0x1a01489f23e3  14e3  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f23ea  14ea  e8e1c0f1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f23ef  14ef  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f23f3  14f3  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f23fa  14fa  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f23ff  14ff  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f2405  1505  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f240b  150b  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f2410  1510  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f2418  1518  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f2420  1520  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f2428  1528  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f2430  1530  448b8520ffffff       movl r8,[rbp-0xe0]
0x1a01489f2437  1537  8b95e8feffff         movl rdx,[rbp-0x118]
0x1a01489f243d  153d  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f2443  1543  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f2449  1549  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f244f  154f  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f2455  1555  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f245d  155d  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f2465  1565  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f246d  156d  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f2475  1575  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f247d  157d  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f2485  1585  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f248d  158d  448b5d80             movl r11,[rbp-0x80]
0x1a01489f2491  1591  e999f2ffff           jmp 0x1a01489f172f  <+0x82f>
0x1a01489f2496  1596  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f249a  159a  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f24a2  15a2  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f24aa  15aa  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f24b2  15b2  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f24ba  15ba  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f24c2  15c2  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f24ca  15ca  4c897d80             REX.W movq [rbp-0x80],r15
0x1a01489f24ce  15ce  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f24d5  15d5  c5fb118d58feffff     vmovsd [rbp-0x1a8],xmm1
0x1a01489f24dd  15dd  e8eebff1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f24e2  15e2  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f24e6  15e6  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f24ed  15ed  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f24f1  15f1  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f24f9  15f9  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f2501  1601  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f2509  1609  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f2511  1611  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f2519  1619  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f2521  1621  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f2529  1629  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f252e  162e  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f2534  1634  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f253a  163a  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f253f  163f  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f2547  1647  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f254f  164f  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f2557  1657  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f255f  165f  448b8520ffffff       movl r8,[rbp-0xe0]
0x1a01489f2566  1666  8b95e8feffff         movl rdx,[rbp-0x118]
0x1a01489f256c  166c  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f2572  1672  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f2578  1678  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f257e  167e  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f2584  1684  448b7d80             movl r15,[rbp-0x80]
0x1a01489f2588  1688  e942f2ffff           jmp 0x1a01489f17cf  <+0x8cf>
0x1a01489f258d  168d  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f2595  1695  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f259d  169d  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f25a5  16a5  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f25ad  16ad  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f25b5  16b5  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f25bd  16bd  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f25c1  16c1  4c89bd48feffff       REX.W movq [rbp-0x1b8],r15
0x1a01489f25c8  16c8  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f25cf  16cf  e8fcbef1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f25d4  16d4  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f25d8  16d8  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f25df  16df  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f25e4  16e4  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f25ea  16ea  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f25f0  16f0  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f25f5  16f5  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f25fd  16fd  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f2605  1705  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f260d  170d  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f2615  1715  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f261d  171d  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f2625  1725  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f262d  172d  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f2635  1735  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f263d  173d  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f2645  1745  448b8510ffffff       movl r8,[rbp-0xf0]
0x1a01489f264c  174c  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f2653  1753  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f2657  1757  8b95e8feffff         movl rdx,[rbp-0x118]
0x1a01489f265d  175d  448bbd48feffff       movl r15,[rbp-0x1b8]
0x1a01489f2664  1764  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f266a  176a  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f2670  1770  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f2676  1776  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f267c  177c  e97af2ffff           jmp 0x1a01489f18fb  <+0x9fb>
0x1a01489f2681  1781  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f2689  1789  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f2691  1791  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f2699  1799  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f26a1  17a1  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f26a9  17a9  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f26b1  17b1  4c897d80             REX.W movq [rbp-0x80],r15
0x1a01489f26b5  17b5  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f26bc  17bc  e80fbef1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f26c1  17c1  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f26c5  17c5  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f26cc  17cc  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f26d1  17d1  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f26d7  17d7  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f26dd  17dd  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f26e2  17e2  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f26ea  17ea  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f26f2  17f2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f26fa  17fa  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f2702  1802  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f270a  180a  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f2712  1812  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f271a  181a  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f2722  1822  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f272a  182a  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f2732  1832  8b9520ffffff         movl rdx,[rbp-0xe0]
0x1a01489f2738  1838  448b8510ffffff       movl r8,[rbp-0xf0]
0x1a01489f273f  183f  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f2746  1846  8bb5b8feffff         movl rsi,[rbp-0x148]
0x1a01489f274c  184c  8b8db0feffff         movl rcx,[rbp-0x150]
0x1a01489f2752  1852  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f2758  1858  8b85a0feffff         movl rax,[rbp-0x160]
0x1a01489f275e  185e  448b7d80             movl r15,[rbp-0x80]
0x1a01489f2762  1862  e9e3f1ffff           jmp 0x1a01489f194a  <+0xa4a>
0x1a01489f2767  1867  4c895dc8             REX.W movq [rbp-0x38],r11
0x1a01489f276b  186b  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f2773  1873  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f277b  187b  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f2783  1883  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f278b  188b  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f2793  1893  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f279b  189b  4889b5d8feffff       REX.W movq [rbp-0x128],rsi
0x1a01489f27a2  18a2  4c897d80             REX.W movq [rbp-0x80],r15
0x1a01489f27a6  18a6  48898d30ffffff       REX.W movq [rbp-0xd0],rcx
0x1a01489f27ad  18ad  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f27b4  18b4  e817bdf1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f27b9  18b9  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f27bd  18bd  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f27c4  18c4  448b5dc8             movl r11,[rbp-0x38]
0x1a01489f27c8  18c8  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f27cd  18cd  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f27d3  18d3  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f27d9  18d9  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f27de  18de  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f27e6  18e6  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f27ee  18ee  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f27f6  18f6  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f27fe  18fe  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f2806  1906  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f280e  190e  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f2816  1916  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f281e  191e  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f2826  1926  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f282e  192e  8b9520ffffff         movl rdx,[rbp-0xe0]
0x1a01489f2834  1934  448b8510ffffff       movl r8,[rbp-0xf0]
0x1a01489f283b  193b  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f2842  1942  8bb5d8feffff         movl rsi,[rbp-0x128]
0x1a01489f2848  1948  4c8b7d80             REX.W movq r15,[rbp-0x80]
0x1a01489f284c  194c  8b8d30ffffff         movl rcx,[rbp-0xd0]
0x1a01489f2852  1952  8b9da8feffff         movl rbx,[rbp-0x158]
0x1a01489f2858  1958  e912f2ffff           jmp 0x1a01489f1a6f  <+0xb6f>
0x1a01489f285d  195d  4c8945c8             REX.W movq [rbp-0x38],r8
0x1a01489f2861  1961  c5fb11ad80feffff     vmovsd [rbp-0x180],xmm5
0x1a01489f2869  1969  c57b118d78feffff     vmovsd [rbp-0x188],xmm9
0x1a01489f2871  1971  c57b11a570feffff     vmovsd [rbp-0x190],xmm12
0x1a01489f2879  1979  c57b11ad68feffff     vmovsd [rbp-0x198],xmm13
0x1a01489f2881  1981  c57b11b560feffff     vmovsd [rbp-0x1a0],xmm14
0x1a01489f2889  1989  c5fb119550feffff     vmovsd [rbp-0x1b0],xmm2
0x1a01489f2891  1991  488985d8feffff       REX.W movq [rbp-0x128],rax
0x1a01489f2898  1998  48895d80             REX.W movq [rbp-0x80],rbx
0x1a01489f289c  199c  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x1a01489f28a3  19a3  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x1a01489f28aa  19aa  e821bcf1ff           call 0x1a014890e4d0  (jump table)
0x1a01489f28af  19af  8b75e0               movl rsi,[rbp-0x20]
0x1a01489f28b2  19b2  448b4dd8             movl r9,[rbp-0x28]
0x1a01489f28b6  19b6  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x1a01489f28bd  19bd  448b45c8             movl r8,[rbp-0x38]
0x1a01489f28c1  19c1  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x1a01489f28c6  19c6  c4c12972f219         vpslld xmm10,xmm10,25
0x1a01489f28cc  19cc  c4c12972d202         vpsrld xmm10,xmm10,2
0x1a01489f28d2  19d2  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1a01489f28d7  19d7  c5fb10b568ffffff     vmovsd xmm6,[rbp-0x98]
0x1a01489f28df  19df  c5fb10bd60ffffff     vmovsd xmm7,[rbp-0xa0]
0x1a01489f28e7  19e7  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a01489f28ef  19ef  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a01489f28f5  19f5  c57b109d48ffffff     vmovsd xmm11,[rbp-0xb8]
0x1a01489f28fd  19fd  c5fb10ad80feffff     vmovsd xmm5,[rbp-0x180]
0x1a01489f2905  1a05  c57b108d78feffff     vmovsd xmm9,[rbp-0x188]
0x1a01489f290d  1a0d  c57b10a570feffff     vmovsd xmm12,[rbp-0x190]
0x1a01489f2915  1a15  c57b10ad68feffff     vmovsd xmm13,[rbp-0x198]
0x1a01489f291d  1a1d  c57b10b560feffff     vmovsd xmm14,[rbp-0x1a0]
0x1a01489f2925  1a25  c5fb108d58feffff     vmovsd xmm1,[rbp-0x1a8]
0x1a01489f292d  1a2d  c5fb109550feffff     vmovsd xmm2,[rbp-0x1b0]
0x1a01489f2935  1a35  8b85d8feffff         movl rax,[rbp-0x128]
0x1a01489f293b  1a3b  488b5d80             REX.W movq rbx,[rbp-0x80]
0x1a01489f293f  1a3f  448b9d18ffffff       movl r11,[rbp-0xe8]
0x1a01489f2946  1a46  448bb508ffffff       movl r14,[rbp-0xf8]
0x1a01489f294d  1a4d  e9bbf4ffff           jmp 0x1a01489f1e0d  <+0xf0d>
0x1a01489f2952  1a52  90                   nop
0x1a01489f2953  1a53  90                   nop

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
       2a0         
       2d1         
       2d6         
       2db         
       2e0         
       302         
       307         
       30c         
       328         
       34f         
       354         
       359         
       362         
       36b         
       374         
       380         
       389         
       395         
       39d         
       3ae         
       3b3         
       3bf         
       3cb         
       3d0         
       3de         
       51e         
       528         
       532         
       53c         
       546         
       54d         
       554         
       55b         
       561         
       56a         
       578         
       8e0         
       a7d         
       a85         
       ac3         
       afa         
       b31         
       b72         
       c1b         
       c39         
       c79         
       c8d         
       ce8         
       cf7         
       cfe         
       d05         
       d0c         
       d13         
       d1a         
       d5c         
       d6b         
       d72         
       d79         
       d80         
       d87         
       d8e         
       dba         
       dc4         
       e44         
       e83         
       ec0         
       f11         
       f8d         
       faa         
       fed         
       ffe         
      1009         
      1015         
      1021         
      102d         
      1038         
      1053         
      1067         
      10a6         
      10c9         
      110d         
      111d         
      112b         
      1137         
      1143         
      114f         
      115a         
      1173         
      1187         
      11f7         
      11fe         
      1205         
      120c         
      1213         
      121a         
      1221         
      12a2         
      12a9         
      12b7         
      12be         
      12cb         
      12d2         
      12df         
      12e6         

Source positions:
 pc offset  position
        42        62
        63        99
       10d       168
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
       295       345
       2d1       363
       2d6       370
       2db       377
       2e0       384
       302       415
       307       422
       30c       429
       324       454
       34f       497
       354       504
       359       511
       35e       518
       367       525
       370       532
       37c       540
       385       547
       38e       554
       39d       562
       3a7       570
       3b3       577
       3b8       584
       3c4       591
       3d0       598
       3de       611
       51e       647
       528       657
       532       667
       53c       679
       542       682
       54d       689
       554       696
       55b       703
       561       714
       56a       721
       578       744
       8e0      1108
       a7d      1236
       a85      1249
       ac3      1309
       c1b      1705
       c34      1723
       c79      1796
       c8d      1809
       ce5      1843
       cef      1850
       cfe      1857
       d05      1864
       d0c      1871
       d13      1878
       d1a      1885
       d59      1369
       d63      1376
       d72      1383
       d79      1390
       d80      1397
       d87      1404
       d8e      1411
       db3      1421
       dbe      1428
       e44      1490
       f8d      1547
       fa5      1565
       fed      1608
       ffe      1618
      1009      1635
      1015      1647
      1021      1659
      102d      1671
      1038      1683
      1053      1915
      1067      1927
      10a6      1965
      10c4      1983
      110d      2026
      111d      2036
      1128      2053
      1137      2065
      1143      2077
      114f      2089
      115a      2101
      1170      2116
      1187      2128
      11f4      2139
      11fe      2146
      1205      2153
      120c      2160
      1213      2167
      121a      2174
      1221      2181
      124a      2208
      1297      2228
      12a9      2231
      12b7      2241
      12be      2244
      12cb      2254
      12d2      2257
      12df      2267
      12e6      2270
      133c         0
      13b4       626
      14a7      1042
      1596      1079
      168d      1173
      1781      1186
      1867      1294
      195d      1475

Safepoints (stack slots = 62, entries = 1, byte size = 22)
0x1a01489f1195    295  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 32)
0x1a01489f1191  internal wasm call
0x1a01489f217b  internal wasm call
0x1a01489f223d  wasm stub call  (0x1a014890e4d0)
0x1a01489f22c7  wasm stub call  (0x1a014890e4d0)
0x1a01489f23eb  wasm stub call  (0x1a014890e4d0)
0x1a01489f24de  wasm stub call  (0x1a014890e4d0)
0x1a01489f25d0  wasm stub call  (0x1a014890e4d0)
0x1a01489f26bd  wasm stub call  (0x1a014890e4d0)
0x1a01489f27b5  wasm stub call  (0x1a014890e4d0)
0x1a01489f28ab  wasm stub call  (0x1a014890e4d0)
