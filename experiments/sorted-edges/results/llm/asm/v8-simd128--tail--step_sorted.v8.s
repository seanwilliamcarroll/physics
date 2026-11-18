name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 11584 = 11548 + 36 padding)
Instructions (size = 11512)
0x33f763677e40     0  55                   push rbp
0x33f763677e41     1  4889e5               REX.W movq rbp,rsp
0x33f763677e44     4  6a08                 push 0x8
0x33f763677e46     6  56                   push rsi
0x33f763677e47     7  4881ecd0040000       REX.W subq rsp,0x4d0
0x33f763677e4e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x33f763677e52    12  488945d8             REX.W movq [rbp-0x28],rax
0x33f763677e56    16  48897dc8             REX.W movq [rbp-0x38],rdi
0x33f763677e5a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763677e5e    1e  0f86d1280000         jna 0x33f76367a735  <+0x28f5>
0x33f763677e64    24  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x33f763677e68    28  458b18               movl r11,[r8]
0x33f763677e6b    2b  418d9b00feffff       leal rbx,[r11-0x200]
0x33f763677e72    32  418918               movl [r8],rbx
0x33f763677e75    35  448bd8               movl r11,rax
0x33f763677e78    38  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0x33f763677e7f    3f  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0x33f763677e85    45  c5fa16d0             vmovshdup xmm2,xmm0
0x33f763677e89    49  41ba0000803a         movl r10,0x3a800000
0x33f763677e8f    4f  c4c1796eda           vmovd xmm3,r10
0x33f763677e94    54  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x33f763677e98    58  c5f828c8             vmovaps xmm1,xmm0
0x33f763677e9c    5c  c5e259d9             vmulss xmm3,xmm3,xmm1
0x33f763677ea0    60  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0x33f763677eaa    6a  4c8945e8             REX.W movq [rbp-0x18],r8
0x33f763677eae    6e  48895de0             REX.W movq [rbp-0x20],rbx
0x33f763677eb2    72  4c899df8feffff       REX.W movq [rbp-0x108],r11
0x33f763677eb9    79  c5fb115588           vmovsd [rbp-0x78],xmm2
0x33f763677ebe    7e  c5fb114d90           vmovsd [rbp-0x70],xmm1
0x33f763677ec3    83  c5fb116dd0           vmovsd [rbp-0x30],xmm5
0x33f763677ec8    88  c5f82eed             vucomiss xmm5,xmm5
0x33f763677ecc    8c  7a06                 jpe 0x33f763677ed4  <+0x94>
0x33f763677ece    8e  0f8409000000         jz 0x33f763677edd  <+0x9d>
0x33f763677ed4    94  c5f928f3             vmovapd xmm6,xmm3
0x33f763677ed8    98  e904000000           jmp 0x33f763677ee1  <+0xa1>
0x33f763677edd    9d  c5f928f5             vmovapd xmm6,xmm5
0x33f763677ee1    a1  c5f82edb             vucomiss xmm3,xmm3
0x33f763677ee5    a5  7a06                 jpe 0x33f763677eed  <+0xad>
0x33f763677ee7    a7  0f8404000000         jz 0x33f763677ef1  <+0xb1>
0x33f763677eed    ad  c5f928de             vmovapd xmm3,xmm6
0x33f763677ef1    b1  c5f82ef3             vucomiss xmm6,xmm3
0x33f763677ef5    b5  0f8704000000         ja 0x33f763677eff  <+0xbf>
0x33f763677efb    bb  c5f928f3             vmovapd xmm6,xmm3
0x33f763677eff    bf  c5f82ef6             vucomiss xmm6,xmm6
0x33f763677f03    c3  7a06                 jpe 0x33f763677f0b  <+0xcb>
0x33f763677f05    c5  0f8409000000         jz 0x33f763677f14  <+0xd4>
0x33f763677f0b    cb  c5f928dc             vmovapd xmm3,xmm4
0x33f763677f0f    cf  e904000000           jmp 0x33f763677f18  <+0xd8>
0x33f763677f14    d4  c5f928de             vmovapd xmm3,xmm6
0x33f763677f18    d8  c5f82ee4             vucomiss xmm4,xmm4
0x33f763677f1c    dc  7a06                 jpe 0x33f763677f24  <+0xe4>
0x33f763677f1e    de  0f8404000000         jz 0x33f763677f28  <+0xe8>
0x33f763677f24    e4  c5f928e3             vmovapd xmm4,xmm3
0x33f763677f28    e8  c5f82edc             vucomiss xmm3,xmm4
0x33f763677f2c    ec  0f8704000000         ja 0x33f763677f36  <+0xf6>
0x33f763677f32    f2  c5f928dc             vmovapd xmm3,xmm4
0x33f763677f36    f6  41ba0020803f         movl r10,0x3f802000
0x33f763677f3c    fc  c4c1796ee2           vmovd xmm4,r10
0x33f763677f41   101  c5da59db             vmulss xmm3,xmm4,xmm3
0x33f763677f45   105  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x33f763677f49   109  c5d972f419           vpslld xmm4,xmm4,25
0x33f763677f4e   10e  c5d972d402           vpsrld xmm4,xmm4,2
0x33f763677f53   113  c5da5edb             vdivss xmm3,xmm4,xmm3
0x33f763677f57   117  c5f828db             vmovaps xmm3,xmm3
0x33f763677f5b   11b  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0x33f763677f65   125  c4e27918f3           vbroadcastss xmm6,xmm3
0x33f763677f6a   12a  c5f859c6             vmulps xmm0,xmm0,xmm6
0x33f763677f6e   12e  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x33f763677f74   134  c5f828f0             vmovaps xmm6,xmm0
0x33f763677f78   138  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x33f763677f7c   13c  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x33f763677f82   142  c4417b2ce0           vcvttsd2si r12,xmm8
0x33f763677f87   147  4585e4               testl r12,r12
0x33f763677f8a   14a  0f892b000000         jns 0x33f763677fbb  <+0x17b>
0x33f763677f90   150  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x33f763677f9a   15a  c441f96efa           vmovq xmm15,r10
0x33f763677f9f   15f  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x33f763677fa4   164  c4417b2ce7           vcvttsd2si r12,xmm15
0x33f763677fa9   169  4585e4               testl r12,r12
0x33f763677fac   16c  0f8809000000         js 0x33f763677fbb  <+0x17b>
0x33f763677fb2   172  41ba00000080         movl r10,0x80000000
0x33f763677fb8   178  450be2               orl r12,r10
0x33f763677fbb   17b  4589e2               movl r10,r12
0x33f763677fbe   17e  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x33f763677fc3   183  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f763677fcb   18b  c441792ec8           vucomisd xmm9,xmm8
0x33f763677fd0   190  0f8a74270000         jpe 0x33f76367a74a  <+0x290a>
0x33f763677fd6   196  0f856e270000         jnz 0x33f76367a74a  <+0x290a>
0x33f763677fdc   19c  c4c1796ef4           vmovd xmm6,r12
0x33f763677fe1   1a1  c5f970f600           vpshufd xmm6,xmm6,0x0
0x33f763677fe6   1a6  c5fa16f8             vmovshdup xmm7,xmm0
0x33f763677fea   1aa  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x33f763677fee   1ae  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x33f763677ff4   1b4  c4417b2ce1           vcvttsd2si r12,xmm9
0x33f763677ff9   1b9  4585e4               testl r12,r12
0x33f763677ffc   1bc  0f8928000000         jns 0x33f76367802a  <+0x1ea>
0x33f763678002   1c2  4c8b1589ffffff       REX.W movq r10,[rip+0xffffff89]
0x33f763678009   1c9  c441f96efa           vmovq xmm15,r10
0x33f76367800e   1ce  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x33f763678013   1d3  c4417b2ce7           vcvttsd2si r12,xmm15
0x33f763678018   1d8  4585e4               testl r12,r12
0x33f76367801b   1db  0f8809000000         js 0x33f76367802a  <+0x1ea>
0x33f763678021   1e1  41ba00000080         movl r10,0x80000000
0x33f763678027   1e7  450be2               orl r12,r10
0x33f76367802a   1ea  4589e2               movl r10,r12
0x33f76367802d   1ed  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x33f763678032   1f2  c441792ed1           vucomisd xmm10,xmm9
0x33f763678037   1f7  0f8a43270000         jpe 0x33f76367a780  <+0x2940>
0x33f76367803d   1fd  0f853d270000         jnz 0x33f76367a780  <+0x2940>
0x33f763678043   203  c4c34922f401         vpinsrd xmm6,xmm6,r12,0x1
0x33f763678049   209  49ba0100000001000000 REX.W movq r10,0x100000001
0x33f763678053   213  c4c1f96efa           vmovq xmm7,r10
0x33f763678058   218  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x33f76367805c   21c  c4e2493ff7           vpmaxud xmm6,xmm6,xmm7
0x33f763678061   221  c44139efc0           vpxor xmm8,xmm8,xmm8
0x33f763678066   226  c538c2c802           vcmpps xmm9,xmm8,xmm0, (le)
0x33f76367806b   22b  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x33f763678075   235  c441f96ed2           vmovq xmm10,r10
0x33f76367807a   23a  c441296cd2           vpunpcklqdq xmm10,xmm10,xmm10
0x33f76367807f   23f  c4c178c2c201         vcmpps xmm0,xmm0,xmm10, (lt)
0x33f763678085   245  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x33f763678089   249  c579dfff             vpandn xmm15,xmm0,xmm7
0x33f76367808d   24d  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x33f763678091   251  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x33f763678096   256  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0x33f76367809d   25d  c4817813041c         vmovlps [r12+r11*1],xmm0
0x33f7636780a3   263  468ba41fcc000000     movl r12,[rdi+r11*1+0xcc]
0x33f7636780ab   26b  4489641f38           movl [rdi+rbx*1+0x38],r12
0x33f7636780b0   270  4e8ba41fc4000000     REX.W movq r12,[rdi+r11*1+0xc4]
0x33f7636780b8   278  4c89641f30           REX.W movq [rdi+rbx*1+0x30],r12
0x33f7636780bd   27d  448d6060             leal r12,[rax+0x60]
0x33f7636780c1   281  428b541f04           movl rdx,[rdi+r11*1+0x4]
0x33f7636780c6   286  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0x33f7636780cb   28b  468b7c1f10           movl r15,[rdi+r11*1+0x10]
0x33f7636780d0   290  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0x33f7636780d5   295  c5f811bdd0fdffff     vmovups [rbp-0x230],xmm7
0x33f7636780dd   29d  c5781185f0fcffff     vmovups [rbp-0x310],xmm8
0x33f7636780e5   2a5  4489e0               movl rax,r12
0x33f7636780e8   2a8  418bdf               movl rbx,r15
0x33f7636780eb   2ab  e8085cf2ff           call 0x33f76359dcf8  (jump table)
0x33f7636780f0   2b0  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f7636780f4   2b4  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f7636780fb   2bb  42c744073800000000   movl [rdi+r8*1+0x38],0x0
0x33f763678104   2c4  448b5dd8             movl r11,[rbp-0x28]
0x33f763678108   2c8  418d93a0000000       leal rdx,[r11+0xa0]
0x33f76367810f   2cf  468b64077c           movl r12,[rdi+r8*1+0x7c]
0x33f763678114   2d4  468bbc0780000000     movl r15,[rdi+r8*1+0x80]
0x33f76367811c   2dc  478d3cbc             leal r15,[r12+r15*4]
0x33f763678120   2e0  468b740708           movl r14,[rdi+r8*1+0x8]
0x33f763678125   2e5  428b440704           movl rax,[rdi+r8*1+0x4]
0x33f76367812a   2ea  418d5b30             leal rbx,[r11+0x30]
0x33f76367812e   2ee  48895598             REX.W movq [rbp-0x68],rdx
0x33f763678132   2f2  4c896580             REX.W movq [rbp-0x80],r12
0x33f763678136   2f6  4c89bd78ffffff       REX.W movq [rbp-0x88],r15
0x33f76367813d   2fd  4c8975c0             REX.W movq [rbp-0x40],r14
0x33f763678141   301  488945b8             REX.W movq [rbp-0x48],rax
0x33f763678145   305  48895db0             REX.W movq [rbp-0x50],rbx
0x33f763678149   309  4489e6               movl rsi,r12
0x33f76367814c   30c  33c9                 xorl rcx,rcx
0x33f76367814e   30e  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f763678156   316  660f1f840000000000   nop
0x33f76367815f   31f  660f1f840000000000   nop
0x33f763678168   328  660f1f840000000000   nop
0x33f763678171   331  660f1f840000000000   nop
0x33f76367817a   33a  660f1f440000         nop
0x33f763678180   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678184   344  0f861f260000         jna 0x33f76367a7a9  <+0x2969>
0x33f76367818a   34a  3bb578ffffff         cmpl rsi,[rbp-0x88]
0x33f763678190   350  0f8421000000         jz 0x33f7636781b7  <+0x377>
0x33f763678196   356  448b0c37             movl r9,[rdi+rsi*1]
0x33f76367819a   35a  83c604               addl rsi,0x4
0x33f76367819d   35d  453bf1               cmpl r14,r9
0x33f7636781a0   360  76de                 jna 0x33f763678180  <+0x340>
0x33f7636781a2   362  468d0c88             leal r9,[rax+r9*4]
0x33f7636781a6   366  c4a17a101c0f         vmovss xmm3,[rdi+r9*1]
0x33f7636781ac   36c  41b901000000         movl r9,0x1
0x33f7636781b2   372  e909000000           jmp 0x33f7636781c0  <+0x380>
0x33f7636781b7   377  4533c9               xorl r9,r9
0x33f7636781ba   37a  8bb578ffffff         movl rsi,[rbp-0x88]
0x33f7636781c0   380  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f7636781c8   388  488975a8             REX.W movq [rbp-0x58],rsi
0x33f7636781cc   38c  4183f901             cmpl r9,0x1
0x33f7636781d0   390  0f8570000000         jnz 0x33f763678246  <+0x406>
0x33f7636781d6   396  468b4c0730           movl r9,[rdi+r8*1+0x30]
0x33f7636781db   39b  42394c0730           cmpl [rdi+r8*1+0x30],rcx
0x33f7636781e0   3a0  0f8540000000         jnz 0x33f763678226  <+0x3e6>
0x33f7636781e6   3a6  48894da0             REX.W movq [rbp-0x60],rcx
0x33f7636781ea   3aa  8bd1                 movl rdx,rcx
0x33f7636781ec   3ac  b901000000           movl rcx,0x1
0x33f7636781f1   3b1  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f7636781f5   3b5  8bc3                 movl rax,rbx
0x33f7636781f7   3b7  4c8bc9               REX.W movq r9,rcx
0x33f7636781fa   3ba  e8015bf2ff           call 0x33f76359dd00  (jump table)
0x33f7636781ff   3bf  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f763678203   3c3  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367820a   3ca  448b5dd8             movl r11,[rbp-0x28]
0x33f76367820e   3ce  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f763678216   3d6  8b75a8               movl rsi,[rbp-0x58]
0x33f763678219   3d9  8b4da0               movl rcx,[rbp-0x60]
0x33f76367821c   3dc  8b5db0               movl rbx,[rbp-0x50]
0x33f76367821f   3df  8b45b8               movl rax,[rbp-0x48]
0x33f763678222   3e2  448b75c0             movl r14,[rbp-0x40]
0x33f763678226   3e6  448d6101             leal r12,[rcx+0x1]
0x33f76367822a   3ea  4689640738           movl [rdi+r8*1+0x38],r12
0x33f76367822f   3ef  468b7c0734           movl r15,[rdi+r8*1+0x34]
0x33f763678234   3f4  458d3c8f             leal r15,[r15+rcx*4]
0x33f763678238   3f8  c4a17a111c3f         vmovss [rdi+r15*1],xmm3
0x33f76367823e   3fe  4489e1               movl rcx,r12
0x33f763678241   401  e93affffff           jmp 0x33f763678180  <+0x340>
0x33f763678246   406  42c744074400000000   movl [rdi+r8*1+0x44],0x0
0x33f76367824f   40f  468b640714           movl r12,[rdi+r8*1+0x14]
0x33f763678254   414  468b7c0710           movl r15,[rdi+r8*1+0x10]
0x33f763678259   419  418d433c             leal rax,[r11+0x3c]
0x33f76367825d   41d  4c8965b0             REX.W movq [rbp-0x50],r12
0x33f763678261   421  4c897da8             REX.W movq [rbp-0x58],r15
0x33f763678265   425  488945a0             REX.W movq [rbp-0x60],rax
0x33f763678269   429  448b7580             movl r14,[rbp-0x80]
0x33f76367826d   42d  33d2                 xorl rdx,rdx
0x33f76367826f   42f  660f1f840000000000   nop
0x33f763678278   438  0f1f840000000000     nop
0x33f763678280   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678284   444  0f8660250000         jna 0x33f76367a7ea  <+0x29aa>
0x33f76367828a   44a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x33f763678291   451  0f8420000000         jz 0x33f7636782b7  <+0x477>
0x33f763678297   457  428b1c37             movl rbx,[rdi+r14*1]
0x33f76367829b   45b  4183c604             addl r14,0x4
0x33f76367829f   45f  443be3               cmpl r12,rbx
0x33f7636782a2   462  76dc                 jna 0x33f763678280  <+0x440>
0x33f7636782a4   464  418d1c9f             leal rbx,[r15+rbx*4]
0x33f7636782a8   468  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x33f7636782ad   46d  bb01000000           movl rbx,0x1
0x33f7636782b2   472  e909000000           jmp 0x33f7636782c0  <+0x480>
0x33f7636782b7   477  33db                 xorl rbx,rbx
0x33f7636782b9   479  448bb578ffffff       movl r14,[rbp-0x88]
0x33f7636782c0   480  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f7636782c8   488  4c8975b8             REX.W movq [rbp-0x48],r14
0x33f7636782cc   48c  83fb01               cmpl rbx,0x1
0x33f7636782cf   48f  0f8567000000         jnz 0x33f76367833c  <+0x4fc>
0x33f7636782d5   495  428b5c073c           movl rbx,[rdi+r8*1+0x3c]
0x33f7636782da   49a  423954073c           cmpl [rdi+r8*1+0x3c],rdx
0x33f7636782df   49f  0f853b000000         jnz 0x33f763678320  <+0x4e0>
0x33f7636782e5   4a5  488955c0             REX.W movq [rbp-0x40],rdx
0x33f7636782e9   4a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f7636782ed   4ad  b901000000           movl rcx,0x1
0x33f7636782f2   4b2  e8095af2ff           call 0x33f76359dd00  (jump table)
0x33f7636782f7   4b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f7636782fb   4bb  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f763678302   4c2  448b5dd8             movl r11,[rbp-0x28]
0x33f763678306   4c6  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367830e   4ce  448b75b8             movl r14,[rbp-0x48]
0x33f763678312   4d2  8b55c0               movl rdx,[rbp-0x40]
0x33f763678315   4d5  8b45a0               movl rax,[rbp-0x60]
0x33f763678318   4d8  448b7da8             movl r15,[rbp-0x58]
0x33f76367831c   4dc  448b65b0             movl r12,[rbp-0x50]
0x33f763678320   4e0  8d5a01               leal rbx,[rdx+0x1]
0x33f763678323   4e3  42895c0744           movl [rdi+r8*1+0x44],rbx
0x33f763678328   4e8  428b4c0740           movl rcx,[rdi+r8*1+0x40]
0x33f76367832d   4ed  8d1491               leal rdx,[rcx+rdx*4]
0x33f763678330   4f0  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x33f763678335   4f5  8bd3                 movl rdx,rbx
0x33f763678337   4f7  e944ffffff           jmp 0x33f763678280  <+0x440>
0x33f76367833c   4fc  42c744075000000000   movl [rdi+r8*1+0x50],0x0
0x33f763678345   505  468b640720           movl r12,[rdi+r8*1+0x20]
0x33f76367834a   50a  468b7c071c           movl r15,[rdi+r8*1+0x1c]
0x33f76367834f   50f  418d4348             leal rax,[r11+0x48]
0x33f763678353   513  4c8965a0             REX.W movq [rbp-0x60],r12
0x33f763678357   517  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x33f76367835e   51e  488945b8             REX.W movq [rbp-0x48],rax
0x33f763678362   522  448b7580             movl r14,[rbp-0x80]
0x33f763678366   526  33d2                 xorl rdx,rdx
0x33f763678368   528  660f1f840000000000   nop
0x33f763678371   531  660f1f840000000000   nop
0x33f76367837a   53a  660f1f440000         nop
0x33f763678380   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678384   544  0f86a3240000         jna 0x33f76367a82d  <+0x29ed>
0x33f76367838a   54a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x33f763678391   551  0f8420000000         jz 0x33f7636783b7  <+0x577>
0x33f763678397   557  428b1c37             movl rbx,[rdi+r14*1]
0x33f76367839b   55b  4183c604             addl r14,0x4
0x33f76367839f   55f  443be3               cmpl r12,rbx
0x33f7636783a2   562  76dc                 jna 0x33f763678380  <+0x540>
0x33f7636783a4   564  418d1c9f             leal rbx,[r15+rbx*4]
0x33f7636783a8   568  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x33f7636783ad   56d  bb01000000           movl rbx,0x1
0x33f7636783b2   572  e909000000           jmp 0x33f7636783c0  <+0x580>
0x33f7636783b7   577  33db                 xorl rbx,rbx
0x33f7636783b9   579  448bb578ffffff       movl r14,[rbp-0x88]
0x33f7636783c0   580  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f7636783c8   588  4c8975a8             REX.W movq [rbp-0x58],r14
0x33f7636783cc   58c  83fb01               cmpl rbx,0x1
0x33f7636783cf   58f  0f856a000000         jnz 0x33f76367843f  <+0x5ff>
0x33f7636783d5   595  428b5c0748           movl rbx,[rdi+r8*1+0x48]
0x33f7636783da   59a  4239540748           cmpl [rdi+r8*1+0x48],rdx
0x33f7636783df   59f  0f853e000000         jnz 0x33f763678423  <+0x5e3>
0x33f7636783e5   5a5  488955c0             REX.W movq [rbp-0x40],rdx
0x33f7636783e9   5a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f7636783ed   5ad  b901000000           movl rcx,0x1
0x33f7636783f2   5b2  e80959f2ff           call 0x33f76359dd00  (jump table)
0x33f7636783f7   5b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f7636783fb   5bb  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f763678402   5c2  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367840a   5ca  448b5dd8             movl r11,[rbp-0x28]
0x33f76367840e   5ce  448b75a8             movl r14,[rbp-0x58]
0x33f763678412   5d2  8b55c0               movl rdx,[rbp-0x40]
0x33f763678415   5d5  8b45b8               movl rax,[rbp-0x48]
0x33f763678418   5d8  448bbd68ffffff       movl r15,[rbp-0x98]
0x33f76367841f   5df  448b65a0             movl r12,[rbp-0x60]
0x33f763678423   5e3  8d5a01               leal rbx,[rdx+0x1]
0x33f763678426   5e6  42895c0750           movl [rdi+r8*1+0x50],rbx
0x33f76367842b   5eb  428b4c074c           movl rcx,[rdi+r8*1+0x4c]
0x33f763678430   5f0  8d1491               leal rdx,[rcx+rdx*4]
0x33f763678433   5f3  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x33f763678438   5f8  8bd3                 movl rdx,rbx
0x33f76367843a   5fa  e941ffffff           jmp 0x33f763678380  <+0x540>
0x33f76367843f   5ff  42c744075c00000000   movl [rdi+r8*1+0x5c],0x0
0x33f763678448   608  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x33f76367844d   60d  468b7c0728           movl r15,[rdi+r8*1+0x28]
0x33f763678452   612  418d4354             leal rax,[r11+0x54]
0x33f763678456   616  4c8965b0             REX.W movq [rbp-0x50],r12
0x33f76367845a   61a  4c897db8             REX.W movq [rbp-0x48],r15
0x33f76367845e   61e  488945d8             REX.W movq [rbp-0x28],rax
0x33f763678462   622  33d2                 xorl rdx,rdx
0x33f763678464   624  448b5d80             movl r11,[rbp-0x80]
0x33f763678468   628  660f1f840000000000   nop
0x33f763678471   631  660f1f840000000000   nop
0x33f76367847a   63a  660f1f440000         nop
0x33f763678480   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678484   644  0f86e9230000         jna 0x33f76367a873  <+0x2a33>
0x33f76367848a   64a  443b9d78ffffff       cmpl r11,[rbp-0x88]
0x33f763678491   651  0f8422000000         jz 0x33f7636784b9  <+0x679>
0x33f763678497   657  468b341f             movl r14,[rdi+r11*1]
0x33f76367849b   65b  4183c304             addl r11,0x4
0x33f76367849f   65f  453be6               cmpl r12,r14
0x33f7636784a2   662  76dc                 jna 0x33f763678480  <+0x640>
0x33f7636784a4   664  478d34b7             leal r14,[r15+r14*4]
0x33f7636784a8   668  c4a17a101c37         vmovss xmm3,[rdi+r14*1]
0x33f7636784ae   66e  41be01000000         movl r14,0x1
0x33f7636784b4   674  e90a000000           jmp 0x33f7636784c3  <+0x683>
0x33f7636784b9   679  4533f6               xorl r14,r14
0x33f7636784bc   67c  448b9d78ffffff       movl r11,[rbp-0x88]
0x33f7636784c3   683  4c895d80             REX.W movq [rbp-0x80],r11
0x33f7636784c7   687  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f7636784cf   68f  4183fe01             cmpl r14,0x1
0x33f7636784d3   693  0f8565000000         jnz 0x33f76367853e  <+0x6fe>
0x33f7636784d9   699  468b740754           movl r14,[rdi+r8*1+0x54]
0x33f7636784de   69e  4239540754           cmpl [rdi+r8*1+0x54],rdx
0x33f7636784e3   6a3  0f8537000000         jnz 0x33f763678520  <+0x6e0>
0x33f7636784e9   6a9  488955c0             REX.W movq [rbp-0x40],rdx
0x33f7636784ed   6ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f7636784f1   6b1  b901000000           movl rcx,0x1
0x33f7636784f6   6b6  e80558f2ff           call 0x33f76359dd00  (jump table)
0x33f7636784fb   6bb  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f7636784ff   6bf  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f763678506   6c6  8b55c0               movl rdx,[rbp-0x40]
0x33f763678509   6c9  448b5d80             movl r11,[rbp-0x80]
0x33f76367850d   6cd  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f763678515   6d5  8b45d8               movl rax,[rbp-0x28]
0x33f763678518   6d8  448b7db8             movl r15,[rbp-0x48]
0x33f76367851c   6dc  448b65b0             movl r12,[rbp-0x50]
0x33f763678520   6e0  448d7201             leal r14,[rdx+0x1]
0x33f763678524   6e4  468974075c           movl [rdi+r8*1+0x5c],r14
0x33f763678529   6e9  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0x33f76367852e   6ee  8d1c93               leal rbx,[rbx+rdx*4]
0x33f763678531   6f1  c5fa111c1f           vmovss [rdi+rbx*1],xmm3
0x33f763678536   6f6  418bd6               movl rdx,r14
0x33f763678539   6f9  e942ffffff           jmp 0x33f763678480  <+0x640>
0x33f76367853e   6fe  468b5c0738           movl r11,[rdi+r8*1+0x38]
0x33f763678543   703  c4a17a6f440730       vmovdqu xmm0,[rdi+r8*1+0x30]
0x33f76367854a   70a  c4a17a6f1c07         vmovdqu xmm3,[rdi+r8*1]
0x33f763678550   710  c4a17a7f5c0730       vmovdqu [rdi+r8*1+0x30],xmm3
0x33f763678557   717  c4a17a7f0407         vmovdqu [rdi+r8*1],xmm0
0x33f76367855d   71d  c4a17a6f440740       vmovdqu xmm0,[rdi+r8*1+0x40]
0x33f763678564   724  c4a17a6f5c0710       vmovdqu xmm3,[rdi+r8*1+0x10]
0x33f76367856b   72b  c4a17a7f5c0740       vmovdqu [rdi+r8*1+0x40],xmm3
0x33f763678572   732  c4a17a7f440710       vmovdqu [rdi+r8*1+0x10],xmm0
0x33f763678579   739  4e8b640750           REX.W movq r12,[rdi+r8*1+0x50]
0x33f76367857e   73e  468b7c0758           movl r15,[rdi+r8*1+0x58]
0x33f763678583   743  c4a17a6f440720       vmovdqu xmm0,[rdi+r8*1+0x20]
0x33f76367858a   74a  c4a17a7f440750       vmovdqu [rdi+r8*1+0x50],xmm0
0x33f763678591   751  46897c0728           movl [rdi+r8*1+0x28],r15
0x33f763678596   756  428954072c           movl [rdi+r8*1+0x2c],rdx
0x33f76367859b   75b  4e89640720           REX.W movq [rdi+r8*1+0x20],r12
0x33f7636785a0   760  4c895dd8             REX.W movq [rbp-0x28],r11
0x33f7636785a4   764  4585db               testl r11,r11
0x33f7636785a7   767  0f8516000000         jnz 0x33f7636785c3  <+0x783>
0x33f7636785ad   76d  8b5de0               movl rbx,[rbp-0x20]
0x33f7636785b0   770  8dbb00020000         leal rdi,[rbx+0x200]
0x33f7636785b6   776  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x33f7636785ba   77a  41893c24             movl [r12],rdi
0x33f7636785be   77e  488be5               REX.W movq rsp,rbp
0x33f7636785c1   781  5d                   pop rbp
0x33f7636785c2   782  c3                   retl
0x33f7636785c3   783  468b64075c           movl r12,[rdi+r8*1+0x5c]
0x33f7636785c8   788  468b7c0750           movl r15,[rdi+r8*1+0x50]
0x33f7636785cd   78d  468b740744           movl r14,[rdi+r8*1+0x44]
0x33f7636785d2   792  428b440738           movl rax,[rdi+r8*1+0x38]
0x33f7636785d7   797  8bd8                 movl rbx,rax
0x33f7636785d9   799  443bf0               cmpl r14,rax
0x33f7636785dc   79c  410f42de             cmovcl rbx,r14
0x33f7636785e0   7a0  448bf3               movl r14,rbx
0x33f7636785e3   7a3  443bfb               cmpl r15,rbx
0x33f7636785e6   7a6  450f42f7             cmovcl r14,r15
0x33f7636785ea   7aa  458bfe               movl r15,r14
0x33f7636785ed   7ad  453be6               cmpl r12,r14
0x33f7636785f0   7b0  450f42fc             cmovcl r15,r12
0x33f7636785f4   7b4  c5fb1045d0           vmovsd xmm0,[rbp-0x30]
0x33f7636785f9   7b9  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x33f7636785fd   7bd  c4e27918d8           vbroadcastss xmm3,xmm0
0x33f763678602   7c2  c4a17a10a407a4000000 vmovss xmm4,[rdi+r8*1+0xa4]
0x33f76367860c   7cc  c5da59e4             vmulss xmm4,xmm4,xmm4
0x33f763678610   7d0  c4e27918ec           vbroadcastss xmm5,xmm4
0x33f763678615   7d5  468b640758           movl r12,[rdi+r8*1+0x58]
0x33f76367861a   7da  468b74074c           movl r14,[rdi+r8*1+0x4c]
0x33f76367861f   7df  428b440740           movl rax,[rdi+r8*1+0x40]
0x33f763678624   7e4  428b5c0734           movl rbx,[rdi+r8*1+0x34]
0x33f763678629   7e9  4c897da0             REX.W movq [rbp-0x60],r15
0x33f76367862d   7ed  c5fb118540ffffff     vmovsd [rbp-0xc0],xmm0
0x33f763678635   7f5  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x33f76367863d   7fd  c5fb11a518ffffff     vmovsd [rbp-0xe8],xmm4
0x33f763678645   805  c5f811adb0fdffff     vmovups [rbp-0x250],xmm5
0x33f76367864d   80d  4c8965c0             REX.W movq [rbp-0x40],r12
0x33f763678651   811  4c8975b8             REX.W movq [rbp-0x48],r14
0x33f763678655   815  488945b0             REX.W movq [rbp-0x50],rax
0x33f763678659   819  48895da8             REX.W movq [rbp-0x58],rbx
0x33f76367865d   81d  33c9                 xorl rcx,rcx
0x33f76367865f   81f  c5c857f6             vxorps xmm6,xmm6,xmm6
0x33f763678663   823  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367866b   82b  488bd1               REX.W movq rdx,rcx
0x33f76367866e   82e  660f1f840000000000   nop
0x33f763678677   837  660f1f840000000000   nop
0x33f763678680   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678684   844  0f8628220000         jna 0x33f76367a8b2  <+0x2a72>
0x33f76367868a   84a  428b740708           movl rsi,[rdi+r8*1+0x8]
0x33f76367868f   84f  4889b500fdffff       REX.W movq [rbp-0x300],rsi
0x33f763678696   856  3bf2                 cmpl rsi,rdx
0x33f763678698   858  0f8672200000         jna 0x33f76367a710  <+0x28d0>
0x33f76367869e   85e  468b4c0714           movl r9,[rdi+r8*1+0x14]
0x33f7636786a3   863  4c898d88fcffff       REX.W movq [rbp-0x378],r9
0x33f7636786aa   86a  443bca               cmpl r9,rdx
0x33f7636786ad   86d  0f865d200000         jna 0x33f76367a710  <+0x28d0>
0x33f7636786b3   873  468b5c0720           movl r11,[rdi+r8*1+0x20]
0x33f7636786b8   878  4c899dd0feffff       REX.W movq [rbp-0x130],r11
0x33f7636786bf   87f  443bda               cmpl r11,rdx
0x33f7636786c2   882  0f8648200000         jna 0x33f76367a710  <+0x28d0>
0x33f7636786c8   888  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x33f7636786cd   88d  4c89a5c0feffff       REX.W movq [rbp-0x140],r12
0x33f7636786d4   894  443be2               cmpl r12,rdx
0x33f7636786d7   897  0f8633200000         jna 0x33f76367a710  <+0x28d0>
0x33f7636786dd   89d  468b7c0704           movl r15,[rdi+r8*1+0x4]
0x33f7636786e2   8a2  458d3497             leal r14,[r15+rdx*4]
0x33f7636786e6   8a6  c4217a100c37         vmovss xmm9,[rdi+r14*1]
0x33f7636786ec   8ac  468b740710           movl r14,[rdi+r8*1+0x10]
0x33f7636786f1   8b1  418d0496             leal rax,[r14+rdx*4]
0x33f7636786f5   8b5  c57a101407           vmovss xmm10,[rdi+rax*1]
0x33f7636786fa   8ba  428b44071c           movl rax,[rdi+r8*1+0x1c]
0x33f7636786ff   8bf  8d1c90               leal rbx,[rax+rdx*4]
0x33f763678702   8c2  c57a101c1f           vmovss xmm11,[rdi+rbx*1]
0x33f763678707   8c7  428b5c0728           movl rbx,[rdi+r8*1+0x28]
0x33f76367870c   8cc  4c89b520fdffff       REX.W movq [rbp-0x2e0],r14
0x33f763678713   8d3  448d3493             leal r14,[rbx+rdx*4]
0x33f763678717   8d7  488955d0             REX.W movq [rbp-0x30],rdx
0x33f76367871b   8db  c4217a102437         vmovss xmm12,[rdi+r14*1]
0x33f763678721   8e1  8b55e0               movl rdx,[rbp-0x20]
0x33f763678724   8e4  c57a1164170c         vmovss [rdi+rdx*1+0xc],xmm12
0x33f76367872a   8ea  c57a115c1708         vmovss [rdi+rdx*1+0x8],xmm11
0x33f763678730   8f0  c57a11541704         vmovss [rdi+rdx*1+0x4],xmm10
0x33f763678736   8f6  c57a110c17           vmovss [rdi+rdx*1],xmm9
0x33f76367873b   8fb  48c744172000000000   REX.W movq [rdi+rdx*1+0x20],0x0
0x33f763678744   904  c44121efdb           vpxor xmm11,xmm11,xmm11
0x33f763678749   909  c57a7f5c1710         vmovdqu [rdi+rdx*1+0x10],xmm11
0x33f76367874f   90f  c4217a109c0784000000 vmovss xmm11,[rdi+r8*1+0x84]
0x33f763678759   919  c744172800000000     movl [rdi+rdx*1+0x28],0x0
0x33f763678761   921  468bb4078c000000     movl r14,[rdi+r8*1+0x8c]
0x33f763678769   929  33d2                 xorl rdx,rdx
0x33f76367876b   92b  4585f6               testl r14,r14
0x33f76367876e   92e  0f95c2               setnzl dl
0x33f763678771   931  442bf2               subl r14,rdx
0x33f763678774   934  c4412a59e3           vmulss xmm12,xmm10,xmm11
0x33f763678779   939  4c89bd28fdffff       REX.W movq [rbp-0x2d8],r15
0x33f763678780   940  c57b118d08ffffff     vmovsd [rbp-0xf8],xmm9
0x33f763678788   948  c57b119510ffffff     vmovsd [rbp-0xf0],xmm10
0x33f763678790   950  48898510fdffff       REX.W movq [rbp-0x2f0],rax
0x33f763678797   957  48899d18fdffff       REX.W movq [rbp-0x2e8],rbx
0x33f76367879e   95e  c441782ee4           vucomiss xmm12,xmm12
0x33f7636787a3   963  7a06                 jpe 0x33f7636787ab  <+0x96b>
0x33f7636787a5   965  0f8404000000         jz 0x33f7636787af  <+0x96f>
0x33f7636787ab   96b  c57928e6             vmovapd xmm12,xmm6
0x33f7636787af   96f  c5782ee6             vucomiss xmm12,xmm6
0x33f7636787b3   973  0f8704000000         ja 0x33f7636787bd  <+0x97d>
0x33f7636787b9   979  c57928e6             vmovapd xmm12,xmm6
0x33f7636787bd   97d  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0x33f7636787c3   983  c4411a5aec           vcvtss2sd xmm13,xmm12,xmm12
0x33f7636787c8   988  c443090bf50b         vroundsd xmm14,xmm14,xmm13,0xb
0x33f7636787ce   98e  c4c17b2cd6           vcvttsd2si rdx,xmm14
0x33f7636787d3   993  85d2                 testl rdx,rdx
0x33f7636787d5   995  0f8927000000         jns 0x33f763678802  <+0x9c2>
0x33f7636787db   99b  4c8b15b0f7ffff       REX.W movq r10,[rip+0xfffff7b0]
0x33f7636787e2   9a2  c441f96efa           vmovq xmm15,r10
0x33f7636787e7   9a7  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x33f7636787ec   9ac  c4c17b2cd7           vcvttsd2si rdx,xmm15
0x33f7636787f1   9b1  85d2                 testl rdx,rdx
0x33f7636787f3   9b3  0f8809000000         js 0x33f763678802  <+0x9c2>
0x33f7636787f9   9b9  41ba00000080         movl r10,0x80000000
0x33f7636787ff   9bf  410bd2               orl rdx,r10
0x33f763678802   9c2  448bd2               movl r10,rdx
0x33f763678805   9c5  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x33f76367880a   9ca  c4c1792ece           vucomisd xmm1,xmm14
0x33f76367880f   9cf  0f8ad7200000         jpe 0x33f76367a8ec  <+0x2aac>
0x33f763678815   9d5  0f85d1200000         jnz 0x33f76367a8ec  <+0x2aac>
0x33f76367881b   9db  8bda                 movl rbx,rdx
0x33f76367881d   9dd  443bf2               cmpl r14,rdx
0x33f763678820   9e0  410f42de             cmovcl rbx,r14
0x33f763678824   9e4  41ba0000804f         movl r10,0x4f800000
0x33f76367882a   9ea  c441796eea           vmovd xmm13,r10
0x33f76367882f   9ef  488bd1               REX.W movq rdx,rcx
0x33f763678832   9f2  c441782eec           vucomiss xmm13,xmm12
0x33f763678837   9f7  0f47d3               cmoval rdx,rbx
0x33f76367883a   9fa  33db                 xorl rbx,rbx
0x33f76367883c   9fc  85d2                 testl rdx,rdx
0x33f76367883e   9fe  0f95c3               setnzl bl
0x33f763678841   a01  8bc2                 movl rax,rdx
0x33f763678843   a03  2bc3                 subl rax,rbx
0x33f763678845   a05  8d5a01               leal rbx,[rdx+0x1]
0x33f763678848   a08  8bd3                 movl rdx,rbx
0x33f76367884a   a0a  443bf3               cmpl r14,rbx
0x33f76367884d   a0d  410f42d6             cmovcl rdx,r14
0x33f763678851   a11  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x33f763678858   a18  3bd0                 cmpl rdx,rax
0x33f76367885a   a1a  0f82c61d0000         jc 0x33f76367a626  <+0x27e6>
0x33f763678860   a20  468bb40788000000     movl r14,[rdi+r8*1+0x88]
0x33f763678868   a28  33db                 xorl rbx,rbx
0x33f76367886a   a2a  4585f6               testl r14,r14
0x33f76367886d   a2d  0f95c3               setnzl bl
0x33f763678870   a30  4c89b5f0feffff       REX.W movq [rbp-0x110],r14
0x33f763678877   a37  442bf3               subl r14,rbx
0x33f76367887a   a3a  c4412259d9           vmulss xmm11,xmm11,xmm9
0x33f76367887f   a3f  c441782edb           vucomiss xmm11,xmm11
0x33f763678884   a44  7a06                 jpe 0x33f76367888c  <+0xa4c>
0x33f763678886   a46  0f8404000000         jz 0x33f763678890  <+0xa50>
0x33f76367888c   a4c  c57928de             vmovapd xmm11,xmm6
0x33f763678890   a50  c5782ede             vucomiss xmm11,xmm6
0x33f763678894   a54  0f8704000000         ja 0x33f76367889e  <+0xa5e>
0x33f76367889a   a5a  c57928de             vmovapd xmm11,xmm6
0x33f76367889e   a5e  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0x33f7636788a4   a64  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0x33f7636788a9   a69  c443090bf40b         vroundsd xmm14,xmm14,xmm12,0xb
0x33f7636788af   a6f  c4c17b2cde           vcvttsd2si rbx,xmm14
0x33f7636788b4   a74  85db                 testl rbx,rbx
0x33f7636788b6   a76  0f8927000000         jns 0x33f7636788e3  <+0xaa3>
0x33f7636788bc   a7c  4c8b15cff6ffff       REX.W movq r10,[rip+0xfffff6cf]
0x33f7636788c3   a83  c441f96efa           vmovq xmm15,r10
0x33f7636788c8   a88  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x33f7636788cd   a8d  c4c17b2cdf           vcvttsd2si rbx,xmm15
0x33f7636788d2   a92  85db                 testl rbx,rbx
0x33f7636788d4   a94  0f8809000000         js 0x33f7636788e3  <+0xaa3>
0x33f7636788da   a9a  41ba00000080         movl r10,0x80000000
0x33f7636788e0   aa0  410bda               orl rbx,r10
0x33f7636788e3   aa3  448bd3               movl r10,rbx
0x33f7636788e6   aa6  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x33f7636788eb   aab  c4c1792ece           vucomisd xmm1,xmm14
0x33f7636788f0   ab0  0f8a1a200000         jpe 0x33f76367a910  <+0x2ad0>
0x33f7636788f6   ab6  0f8514200000         jnz 0x33f76367a910  <+0x2ad0>
0x33f7636788fc   abc  8bd3                 movl rdx,rbx
0x33f7636788fe   abe  443bf3               cmpl r14,rbx
0x33f763678901   ac1  410f42d6             cmovcl rdx,r14
0x33f763678905   ac5  488bd9               REX.W movq rbx,rcx
0x33f763678908   ac8  c441782eeb           vucomiss xmm13,xmm11
0x33f76367890d   acd  0f47da               cmoval rbx,rdx
0x33f763678910   ad0  33d2                 xorl rdx,rdx
0x33f763678912   ad2  85db                 testl rbx,rbx
0x33f763678914   ad4  0f95c2               setnzl dl
0x33f763678917   ad7  8bf3                 movl rsi,rbx
0x33f763678919   ad9  2bf2                 subl rsi,rdx
0x33f76367891b   adb  4489e2               movl rdx,r12
0x33f76367891e   ade  4539e3               cmpl r11,r12
0x33f763678921   ae1  410f42d3             cmovcl rdx,r11
0x33f763678925   ae5  448bda               movl r11,rdx
0x33f763678928   ae8  443bca               cmpl r9,rdx
0x33f76367892b   aeb  450f42d9             cmovcl r11,r9
0x33f76367892f   aef  83c301               addl rbx,0x1
0x33f763678932   af2  8bd3                 movl rdx,rbx
0x33f763678934   af4  443bf3               cmpl r14,rbx
0x33f763678937   af7  410f42d6             cmovcl rdx,r14
0x33f76367893b   afb  448d7201             leal r14,[rdx+0x1]
0x33f76367893f   aff  c4427918da           vbroadcastss xmm11,xmm10
0x33f763678944   b04  c4427918e1           vbroadcastss xmm12,xmm9
0x33f763678949   b09  428b5c0764           movl rbx,[rdi+r8*1+0x64]
0x33f76367894e   b0e  428b540768           movl rdx,[rdi+r8*1+0x68]
0x33f763678953   b13  4889b5e8feffff       REX.W movq [rbp-0x118],rsi
0x33f76367895a   b1a  4c899d08fdffff       REX.W movq [rbp-0x2f8],r11
0x33f763678961   b21  4c89b580fcffff       REX.W movq [rbp-0x380],r14
0x33f763678968   b28  c578119d30fdffff     vmovups [rbp-0x2d0],xmm11
0x33f763678970   b30  c57811a540fdffff     vmovups [rbp-0x2c0],xmm12
0x33f763678978   b38  48899dd8feffff       REX.W movq [rbp-0x128],rbx
0x33f76367897f   b3f  488995e0feffff       REX.W movq [rbp-0x120],rdx
0x33f763678986   b46  458be7               movl r12,r15
0x33f763678989   b49  448bde               movl r11,rsi
0x33f76367898c   b4c  448bbd00fdffff       movl r15,[rbp-0x300]
0x33f763678993   b53  e979000000           jmp 0x33f763678a11  <+0xbd1>
0x33f763678998   b58  660f1f840000000000   nop
0x33f7636789a1   b61  660f1f840000000000   nop
0x33f7636789aa   b6a  660f1f840000000000   nop
0x33f7636789b3   b73  660f1f840000000000   nop
0x33f7636789bc   b7c  0f1f4000             nop
0x33f7636789c0   b80  8bc7                 movl rax,rdi
0x33f7636789c2   b82  498bf8               REX.W movq rdi,r8
0x33f7636789c5   b85  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f7636789cd   b8d  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f7636789d5   b95  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f7636789dd   b9d  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f7636789e5   ba5  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f7636789ed   bad  4589e7               movl r15,r12
0x33f7636789f0   bb0  448ba528fdffff       movl r12,[rbp-0x2d8]
0x33f7636789f7   bb7  448b9de8feffff       movl r11,[rbp-0x118]
0x33f7636789fe   bbe  448bb580fcffff       movl r14,[rbp-0x380]
0x33f763678a05   bc5  8b9dd8feffff         movl rbx,[rbp-0x128]
0x33f763678a0b   bcb  8b95e0feffff         movl rdx,[rbp-0x120]
0x33f763678a11   bd1  8bb510fdffff         movl rsi,[rbp-0x2f0]
0x33f763678a17   bd7  448b85d0feffff       movl r8,[rbp-0x130]
0x33f763678a1e   bde  48894580             REX.W movq [rbp-0x80],rax
0x33f763678a22   be2  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678a26   be6  0f86081f0000         jna 0x33f76367a934  <+0x2af4>
0x33f763678a2c   bec  448b8df0feffff       movl r9,[rbp-0x110]
0x33f763678a33   bf3  440fafc8             imull r9,rax
0x33f763678a37   bf7  438d040b             leal rax,[r11+r9*1]
0x33f763678a3b   bfb  3bd0                 cmpl rdx,rax
0x33f763678a3d   bfd  0f8628000000         jna 0x33f763678a6b  <+0xc2b>
0x33f763678a43   c03  4503ce               addl r9,r14
0x33f763678a46   c06  413bd1               cmpl rdx,r9
0x33f763678a49   c09  0f861c000000         jna 0x33f763678a6b  <+0xc2b>
0x33f763678a4f   c0f  468d0c8b             leal r9,[rbx+r9*4]
0x33f763678a53   c13  468b0c0f             movl r9,[rdi+r9*1]
0x33f763678a57   c17  8d0483               leal rax,[rbx+rax*4]
0x33f763678a5a   c1a  8b0407               movl rax,[rdi+rax*1]
0x33f763678a5d   c1d  448bd0               movl r10,rax
0x33f763678a60   c20  418bc1               movl rax,r9
0x33f763678a63   c23  458bca               movl r9,r10
0x33f763678a66   c26  e906000000           jmp 0x33f763678a71  <+0xc31>
0x33f763678a6b   c2b  488bc1               REX.W movq rax,rcx
0x33f763678a6e   c2e  4c8bc9               REX.W movq r9,rcx
0x33f763678a71   c31  478d1c8c             leal r11,[r12+r9*4]
0x33f763678a75   c35  448bf0               movl r14,rax
0x33f763678a78   c38  452bf1               subl r14,r9
0x33f763678a7b   c3b  33db                 xorl rbx,rbx
0x33f763678a7d   c3d  443bf8               cmpl r15,rax
0x33f763678a80   c40  0f92c3               setcl bl
0x33f763678a83   c43  33d2                 xorl rdx,rdx
0x33f763678a85   c45  413bc1               cmpl rax,r9
0x33f763678a88   c48  0f92c2               setcl dl
0x33f763678a8b   c4b  4c8be3               REX.W movq r12,rbx
0x33f763678a8e   c4e  440be2               orl r12,rdx
0x33f763678a91   c51  458bfe               movl r15,r14
0x33f763678a94   c54  4585e4               testl r12,r12
0x33f763678a97   c57  440f45f9             cmovnzl r15,rcx
0x33f763678a9b   c5b  4c899d60ffffff       REX.W movq [rbp-0xa0],r11
0x33f763678aa2   c62  48899de0fcffff       REX.W movq [rbp-0x320],rbx
0x33f763678aa9   c69  48899548ffffff       REX.W movq [rbp-0xb8],rdx
0x33f763678ab0   c70  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x33f763678ab7   c77  413bc1               cmpl rax,r9
0x33f763678aba   c7a  0f82a7000000         jc 0x33f763678b67  <+0xd27>
0x33f763678ac0   c80  468d248e             leal r12,[rsi+r9*4]
0x33f763678ac4   c84  41bf04000000         movl r15,0x4
0x33f763678aca   c8a  443bc0               cmpl r8,rax
0x33f763678acd   c8d  450f42e7             cmovcl r12,r15
0x33f763678ad1   c91  418bf6               movl rsi,r14
0x33f763678ad4   c94  443bc0               cmpl r8,rax
0x33f763678ad7   c97  0f42f1               cmovcl rsi,rcx
0x33f763678ada   c9a  448bc6               movl r8,rsi
0x33f763678add   c9d  4181e0f0ffff1f       andl r8,0x1ffffff0
0x33f763678ae4   ca4  478d0484             leal r8,[r12+r8*4]
0x33f763678ae8   ca8  8bbd20fdffff         movl rdi,[rbp-0x2e0]
0x33f763678aee   cae  468d1c8f             leal r11,[rdi+r9*4]
0x33f763678af2   cb2  8bbd88fcffff         movl rdi,[rbp-0x378]
0x33f763678af8   cb8  3bf8                 cmpl rdi,rax
0x33f763678afa   cba  450f42df             cmovcl r11,r15
0x33f763678afe   cbe  418bde               movl rbx,r14
0x33f763678b01   cc1  3bf8                 cmpl rdi,rax
0x33f763678b03   cc3  0f42d9               cmovcl rbx,rcx
0x33f763678b06   cc6  8bfb                 movl rdi,rbx
0x33f763678b08   cc8  81e7f0ffff1f         andl rdi,0x1ffffff0
0x33f763678b0e   cce  418d3cbb             leal rdi,[r11+rdi*4]
0x33f763678b12   cd2  8bd6                 movl rdx,rsi
0x33f763678b14   cd4  c1ea04               shrl rdx, 4
0x33f763678b17   cd7  83e60f               andl rsi,0xf
0x33f763678b1a   cda  4889bdb8feffff       REX.W movq [rbp-0x148],rdi
0x33f763678b21   ce1  8bfb                 movl rdi,rbx
0x33f763678b23   ce3  c1ef04               shrl rdi, 4
0x33f763678b26   ce6  83e30f               andl rbx,0xf
0x33f763678b29   ce9  4889bde8fcffff       REX.W movq [rbp-0x318],rdi
0x33f763678b30   cf0  8bbdc0feffff         movl rdi,[rbp-0x140]
0x33f763678b36   cf6  3bf8                 cmpl rdi,rax
0x33f763678b38   cf8  0f821b000000         jc 0x33f763678b59  <+0xd19>
0x33f763678b3e   cfe  8bbd18fdffff         movl rdi,[rbp-0x2e8]
0x33f763678b44   d04  468d0c8f             leal r9,[rdi+r9*4]
0x33f763678b48   d08  458bd3               movl r10,r11
0x33f763678b4b   d0b  458bde               movl r11,r14
0x33f763678b4e   d0e  458bf2               movl r14,r10
0x33f763678b51   d11  418bf9               movl rdi,r9
0x33f763678b54   d14  e93a000000           jmp 0x33f763678b93  <+0xd53>
0x33f763678b59   d19  458bf3               movl r14,r11
0x33f763678b5c   d1c  4c8bd9               REX.W movq r11,rcx
0x33f763678b5f   d1f  498bff               REX.W movq rdi,r15
0x33f763678b62   d22  e92c000000           jmp 0x33f763678b93  <+0xd53>
0x33f763678b67   d27  4c8bd9               REX.W movq r11,rcx
0x33f763678b6a   d2a  488bd9               REX.W movq rbx,rcx
0x33f763678b6d   d2d  488bf1               REX.W movq rsi,rcx
0x33f763678b70   d30  41bf04000000         movl r15,0x4
0x33f763678b76   d36  48898de8fcffff       REX.W movq [rbp-0x318],rcx
0x33f763678b7d   d3d  488bd1               REX.W movq rdx,rcx
0x33f763678b80   d40  498bff               REX.W movq rdi,r15
0x33f763678b83   d43  4d8bc7               REX.W movq r8,r15
0x33f763678b86   d46  4d8be7               REX.W movq r12,r15
0x33f763678b89   d49  4d8bf7               REX.W movq r14,r15
0x33f763678b8c   d4c  4c89bdb8feffff       REX.W movq [rbp-0x148],r15
0x33f763678b93   d53  4c8b8d48ffffff       REX.W movq r9,[rbp-0xb8]
0x33f763678b9a   d5a  440b8de0fcffff       orl r9,[rbp-0x320]
0x33f763678ba1   d61  4c898500ffffff       REX.W movq [rbp-0x100],r8
0x33f763678ba8   d68  448b8560ffffff       movl r8,[rbp-0xa0]
0x33f763678baf   d6f  4585c9               testl r9,r9
0x33f763678bb2   d72  450f45c7             cmovnzl r8,r15
0x33f763678bb6   d76  448bbd58ffffff       movl r15,[rbp-0xa8]
0x33f763678bbd   d7d  4183e70f             andl r15,0xf
0x33f763678bc1   d81  458bcb               movl r9,r11
0x33f763678bc4   d84  41c1e904             shrl r9, 4
0x33f763678bc8   d88  4c899d68ffffff       REX.W movq [rbp-0x98],r11
0x33f763678bcf   d8f  448b9d58ffffff       movl r11,[rbp-0xa8]
0x33f763678bd6   d96  41c1eb04             shrl r11, 4
0x33f763678bda   d9a  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0x33f763678be1   da1  48899dc8feffff       REX.W movq [rbp-0x138],rbx
0x33f763678be8   da8  8b9de8fcffff         movl rbx,[rbp-0x318]
0x33f763678bee   dae  418bf3               movl rsi,r11
0x33f763678bf1   db1  413bdb               cmpl rbx,r11
0x33f763678bf4   db4  0f42f3               cmovcl rsi,rbx
0x33f763678bf7   db7  448bde               movl r11,rsi
0x33f763678bfa   dba  3bd6                 cmpl rdx,rsi
0x33f763678bfc   dbc  440f42da             cmovcl r11,rdx
0x33f763678c00   dc0  418bdb               movl rbx,r11
0x33f763678c03   dc3  453bcb               cmpl r9,r11
0x33f763678c06   dc6  410f42d9             cmovcl rbx,r9
0x33f763678c0a   dca  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x33f763678c11   dd1  85db                 testl rbx,rbx
0x33f763678c13   dd3  0f85c1000000         jnz 0x33f763678cda  <+0xe9a>
0x33f763678c19   dd9  488b55c8             REX.W movq rdx,[rbp-0x38]
0x33f763678c1d   ddd  c5f81085f0fcffff     vmovups xmm0,[rbp-0x310]
0x33f763678c25   de5  c5f928c8             vmovapd xmm1,xmm0
0x33f763678c29   de9  c5f928d0             vmovapd xmm2,xmm0
0x33f763678c2d   ded  c5f928d8             vmovapd xmm3,xmm0
0x33f763678c31   df1  c5f928e0             vmovapd xmm4,xmm0
0x33f763678c35   df5  c5f928f0             vmovapd xmm6,xmm0
0x33f763678c39   df9  c57928c0             vmovapd xmm8,xmm0
0x33f763678c3d   dfd  c57928c8             vmovapd xmm9,xmm0
0x33f763678c41   e01  c57928d0             vmovapd xmm10,xmm0
0x33f763678c45   e05  c57928e8             vmovapd xmm13,xmm0
0x33f763678c49   e09  c57928f0             vmovapd xmm14,xmm0
0x33f763678c4d   e0d  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x33f763678c55   e15  c5f8118590fdffff     vmovups [rbp-0x270],xmm0
0x33f763678c5d   e1d  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x33f763678c65   e25  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x33f763678c6d   e2d  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x33f763678c75   e35  c5f8118570fcffff     vmovups [rbp-0x390],xmm0
0x33f763678c7d   e3d  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x33f763678c85   e45  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x33f763678c8d   e4d  c5f81185c0fbffff     vmovups [rbp-0x440],xmm0
0x33f763678c95   e55  c5f81185b0fbffff     vmovups [rbp-0x450],xmm0
0x33f763678c9d   e5d  c5f81185a0fbffff     vmovups [rbp-0x460],xmm0
0x33f763678ca5   e65  c5f8118570fbffff     vmovups [rbp-0x490],xmm0
0x33f763678cad   e6d  c5f8118560fbffff     vmovups [rbp-0x4a0],xmm0
0x33f763678cb5   e75  c5f8118550fbffff     vmovups [rbp-0x4b0],xmm0
0x33f763678cbd   e7d  c5f8118540fbffff     vmovups [rbp-0x4c0],xmm0
0x33f763678cc5   e85  c5f8118530fbffff     vmovups [rbp-0x4d0],xmm0
0x33f763678ccd   e8d  c5f8118520fbffff     vmovups [rbp-0x4e0],xmm0
0x33f763678cd5   e95  e943070000           jmp 0x33f76367941d  <+0x15dd>
0x33f763678cda   e9a  c44111efed           vpxor xmm13,xmm13,xmm13
0x33f763678cdf   e9f  c57811ad40fbffff     vmovups [rbp-0x4c0],xmm13
0x33f763678ce7   ea7  c57811adc0fbffff     vmovups [rbp-0x440],xmm13
0x33f763678cef   eaf  c57811ad70fbffff     vmovups [rbp-0x490],xmm13
0x33f763678cf7   eb7  c57811ada0fcffff     vmovups [rbp-0x360],xmm13
0x33f763678cff   ebf  c57811ad60fbffff     vmovups [rbp-0x4a0],xmm13
0x33f763678d07   ec7  c57811ada0fbffff     vmovups [rbp-0x460],xmm13
0x33f763678d0f   ecf  c57811ad50fbffff     vmovups [rbp-0x4b0],xmm13
0x33f763678d17   ed7  c57811adc0fcffff     vmovups [rbp-0x340],xmm13
0x33f763678d1f   edf  c57811adb0fbffff     vmovups [rbp-0x450],xmm13
0x33f763678d27   ee7  c57811ad90fbffff     vmovups [rbp-0x470],xmm13
0x33f763678d2f   eef  c57811ad30fbffff     vmovups [rbp-0x4d0],xmm13
0x33f763678d37   ef7  c57811ad30fcffff     vmovups [rbp-0x3d0],xmm13
0x33f763678d3f   eff  c57811add0fbffff     vmovups [rbp-0x430],xmm13
0x33f763678d47   f07  c57811ad80fbffff     vmovups [rbp-0x480],xmm13
0x33f763678d4f   f0f  c57811ad20fbffff     vmovups [rbp-0x4e0],xmm13
0x33f763678d57   f17  c57811ad70fcffff     vmovups [rbp-0x390],xmm13
0x33f763678d5f   f1f  c57811ad40fcffff     vmovups [rbp-0x3c0],xmm13
0x33f763678d67   f27  c57811adf0fbffff     vmovups [rbp-0x410],xmm13
0x33f763678d6f   f2f  c57811ad10fcffff     vmovups [rbp-0x3f0],xmm13
0x33f763678d77   f37  c57811ad20fcffff     vmovups [rbp-0x3e0],xmm13
0x33f763678d7f   f3f  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x33f763678d87   f47  c57811add0fcffff     vmovups [rbp-0x330],xmm13
0x33f763678d8f   f4f  c57811ad90fcffff     vmovups [rbp-0x370],xmm13
0x33f763678d97   f57  c57811ad50fcffff     vmovups [rbp-0x3b0],xmm13
0x33f763678d9f   f5f  c57811ade0fbffff     vmovups [rbp-0x420],xmm13
0x33f763678da7   f67  c57811adb0fcffff     vmovups [rbp-0x350],xmm13
0x33f763678daf   f6f  c57811ada0fdffff     vmovups [rbp-0x260],xmm13
0x33f763678db7   f77  c57811ad90fdffff     vmovups [rbp-0x270],xmm13
0x33f763678dbf   f7f  488b55c8             REX.W movq rdx,[rbp-0x38]
0x33f763678dc3   f83  4c8bd9               REX.W movq r11,rcx
0x33f763678dc6   f86  e9bc000000           jmp 0x33f763678e87  <+0x1047>
0x33f763678dcb   f8b  660f1f840000000000   nop
0x33f763678dd4   f94  660f1f840000000000   nop
0x33f763678ddd   f9d  660f1f840000000000   nop
0x33f763678de6   fa6  660f1f840000000000   nop
0x33f763678def   faf  660f1f840000000000   nop
0x33f763678df8   fb8  0f1f840000000000     nop
0x33f763678e00   fc0  c578118540fbffff     vmovups [rbp-0x4c0],xmm8
0x33f763678e08   fc8  c5781195c0fbffff     vmovups [rbp-0x440],xmm10
0x33f763678e10   fd0  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f763678e18   fd8  c57811a5b0fbffff     vmovups [rbp-0x450],xmm12
0x33f763678e20   fe0  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f763678e28   fe8  c5f8119d90fcffff     vmovups [rbp-0x370],xmm3
0x33f763678e30   ff0  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f763678e38   ff8  c5f811bdb0fcffff     vmovups [rbp-0x350],xmm7
0x33f763678e40  1000  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f763678e48  1008  448b8560ffffff       movl r8,[rbp-0xa0]
0x33f763678e4f  100f  c5f8118dc0fcffff     vmovups [rbp-0x340],xmm1
0x33f763678e57  1017  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x33f763678e5f  101f  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x33f763678e67  1027  c578118de0fbffff     vmovups [rbp-0x420],xmm9
0x33f763678e6f  102f  c5f8119520fbffff     vmovups [rbp-0x4e0],xmm2
0x33f763678e77  1037  c57811b570fcffff     vmovups [rbp-0x390],xmm14
0x33f763678e7f  103f  c5f811a5d0fcffff     vmovups [rbp-0x330],xmm4
0x33f763678e87  1047  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f763678e8b  104b  0f86131b0000         jna 0x33f76367a9a4  <+0x2b64>
0x33f763678e91  1051  438d3403             leal rsi,[r11+r8*1]
0x33f763678e95  1055  c57a6f3432           vmovdqu xmm14,[rdx+rsi*1]
0x33f763678e9a  105a  c4c1185cce           vsubps xmm1,xmm12,xmm14
0x33f763678e9f  105f  c5f059d1             vmulps xmm2,xmm1,xmm1
0x33f763678ea3  1063  478d0c33             leal r9,[r11+r14*1]
0x33f763678ea7  1067  c4a17a6f040a         vmovdqu xmm0,[rdx+r9*1]
0x33f763678ead  106d  c5a05ce0             vsubps xmm4,xmm11,xmm0
0x33f763678eb1  1071  c5d859f4             vmulps xmm6,xmm4,xmm4
0x33f763678eb5  1075  c5e858f6             vaddps xmm6,xmm2,xmm6
0x33f763678eb9  1079  c5d0c2d602           vcmpps xmm2,xmm5,xmm6, (le)
0x33f763678ebe  107e  c548c2c301           vcmpps xmm8,xmm6,xmm3, (lt)
0x33f763678ec3  1083  c44169dbc0           vpand xmm8,xmm2,xmm8
0x33f763678ec8  1088  c590c2d601           vcmpps xmm2,xmm13,xmm6, (lt)
0x33f763678ecd  108d  c5e9dbd7             vpand xmm2,xmm2,xmm7
0x33f763678ed1  1091  c5f85bd2             vcvtdq2ps xmm2,xmm2
0x33f763678ed5  1095  c539dbc2             vpand xmm8,xmm8,xmm2
0x33f763678ed9  1099  c5f8109540fcffff     vmovups xmm2,[rbp-0x3c0]
0x33f763678ee1  10a1  c5b858d2             vaddps xmm2,xmm8,xmm2
0x33f763678ee5  10a5  448d4630             leal r8,[rsi+0x30]
0x33f763678ee9  10a9  c5f8119540fcffff     vmovups [rbp-0x3c0],xmm2
0x33f763678ef1  10b1  c4a17a6f1402         vmovdqu xmm2,[rdx+r8*1]
0x33f763678ef7  10b7  c5f8118d40feffff     vmovups [rbp-0x1c0],xmm1
0x33f763678eff  10bf  c5985cca             vsubps xmm1,xmm12,xmm2
0x33f763678f03  10c3  c57059c9             vmulps xmm9,xmm1,xmm1
0x33f763678f07  10c7  458d4130             leal r8,[r9+0x30]
0x33f763678f0b  10cb  c5f8118d70feffff     vmovups [rbp-0x190],xmm1
0x33f763678f13  10d3  c4a17a6f0c02         vmovdqu xmm1,[rdx+r8*1]
0x33f763678f19  10d9  c5f811a520feffff     vmovups [rbp-0x1e0],xmm4
0x33f763678f21  10e1  c5a05ce1             vsubps xmm4,xmm11,xmm1
0x33f763678f25  10e5  c5f811b510feffff     vmovups [rbp-0x1f0],xmm6
0x33f763678f2d  10ed  c5d859f4             vmulps xmm6,xmm4,xmm4
0x33f763678f31  10f1  c5b058f6             vaddps xmm6,xmm9,xmm6
0x33f763678f35  10f5  c550c2ce02           vcmpps xmm9,xmm5,xmm6, (le)
0x33f763678f3a  10fa  c5f811a560feffff     vmovups [rbp-0x1a0],xmm4
0x33f763678f42  1102  c5c8c2e301           vcmpps xmm4,xmm6,xmm3, (lt)
0x33f763678f47  1107  c5b1dbe4             vpand xmm4,xmm9,xmm4
0x33f763678f4b  110b  c510c2ce01           vcmpps xmm9,xmm13,xmm6, (lt)
0x33f763678f50  1110  c531dbcf             vpand xmm9,xmm9,xmm7
0x33f763678f54  1114  c441785bc9           vcvtdq2ps xmm9,xmm9
0x33f763678f59  1119  c4c159dbe1           vpand xmm4,xmm4,xmm9
0x33f763678f5e  111e  c578108d20fcffff     vmovups xmm9,[rbp-0x3e0]
0x33f763678f66  1126  c4415858c9           vaddps xmm9,xmm4,xmm9
0x33f763678f6b  112b  448d4620             leal r8,[rsi+0x20]
0x33f763678f6f  112f  c578118d20fcffff     vmovups [rbp-0x3e0],xmm9
0x33f763678f77  1137  c4217a6f0c02         vmovdqu xmm9,[rdx+r8*1]
0x33f763678f7d  113d  c5f811b550feffff     vmovups [rbp-0x1b0],xmm6
0x33f763678f85  1145  c4c1185cf1           vsubps xmm6,xmm12,xmm9
0x33f763678f8a  114a  c54859d6             vmulps xmm10,xmm6,xmm6
0x33f763678f8e  114e  458d4120             leal r8,[r9+0x20]
0x33f763678f92  1152  c5f811b5a0feffff     vmovups [rbp-0x160],xmm6
0x33f763678f9a  115a  c4a17a6f3402         vmovdqu xmm6,[rdx+r8*1]
0x33f763678fa0  1160  c578118df0fdffff     vmovups [rbp-0x210],xmm9
0x33f763678fa8  1168  c5205cce             vsubps xmm9,xmm11,xmm6
0x33f763678fac  116c  c5f811b5e0fdffff     vmovups [rbp-0x220],xmm6
0x33f763678fb4  1174  c4c13059f1           vmulps xmm6,xmm9,xmm9
0x33f763678fb9  1179  c5a858f6             vaddps xmm6,xmm10,xmm6
0x33f763678fbd  117d  c550c2d602           vcmpps xmm10,xmm5,xmm6, (le)
0x33f763678fc2  1182  c578118d90feffff     vmovups [rbp-0x170],xmm9
0x33f763678fca  118a  c548c2cb01           vcmpps xmm9,xmm6,xmm3, (lt)
0x33f763678fcf  118f  c44129dbc9           vpand xmm9,xmm10,xmm9
0x33f763678fd4  1194  c510c2d601           vcmpps xmm10,xmm13,xmm6, (lt)
0x33f763678fd9  1199  c529dbd7             vpand xmm10,xmm10,xmm7
0x33f763678fdd  119d  c441785bd2           vcvtdq2ps xmm10,xmm10
0x33f763678fe2  11a2  c44131dbca           vpand xmm9,xmm9,xmm10
0x33f763678fe7  11a7  c578109510fcffff     vmovups xmm10,[rbp-0x3f0]
0x33f763678fef  11af  c4413058d2           vaddps xmm10,xmm9,xmm10
0x33f763678ff4  11b4  448d4610             leal r8,[rsi+0x10]
0x33f763678ff8  11b8  c578119510fcffff     vmovups [rbp-0x3f0],xmm10
0x33f763679000  11c0  c4217a6f1402         vmovdqu xmm10,[rdx+r8*1]
0x33f763679006  11c6  c5f811b580feffff     vmovups [rbp-0x180],xmm6
0x33f76367900e  11ce  c4c1185cf2           vsubps xmm6,xmm12,xmm10
0x33f763679013  11d3  c54859e6             vmulps xmm12,xmm6,xmm6
0x33f763679017  11d7  458d4110             leal r8,[r9+0x10]
0x33f76367901b  11db  c5f811b530ffffff     vmovups [rbp-0xd0],xmm6
0x33f763679023  11e3  c4a17a6f3402         vmovdqu xmm6,[rdx+r8*1]
0x33f763679029  11e9  c578119500feffff     vmovups [rbp-0x200],xmm10
0x33f763679031  11f1  c5205cd6             vsubps xmm10,xmm11,xmm6
0x33f763679035  11f5  c4412859da           vmulps xmm11,xmm10,xmm10
0x33f76367903a  11fa  c4411858db           vaddps xmm11,xmm12,xmm11
0x33f76367903f  11ff  c44150c2e302         vcmpps xmm12,xmm5,xmm11, (le)
0x33f763679045  1205  c578119520ffffff     vmovups [rbp-0xe0],xmm10
0x33f76367904d  120d  c520c2d301           vcmpps xmm10,xmm11,xmm3, (lt)
0x33f763679052  1212  c44119dbd2           vpand xmm10,xmm12,xmm10
0x33f763679057  1217  c44110c2e301         vcmpps xmm12,xmm13,xmm11, (lt)
0x33f76367905d  121d  c519dbe7             vpand xmm12,xmm12,xmm7
0x33f763679061  1221  c441785be4           vcvtdq2ps xmm12,xmm12
0x33f763679066  1226  c44129dbd4           vpand xmm10,xmm10,xmm12
0x33f76367906b  122b  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x33f763679073  1233  c4412858e4           vaddps xmm12,xmm10,xmm12
0x33f763679078  1238  458d043b             leal r8,[r11+rdi*1]
0x33f76367907c  123c  c4a17a6f1c02         vmovdqu xmm3,[rdx+r8*1]
0x33f763679082  1242  c4c16059d8           vmulps xmm3,xmm3,xmm8
0x33f763679087  1247  c57811a5f0fbffff     vmovups [rbp-0x410],xmm12
0x33f76367908f  124f  c57810a5d0fbffff     vmovups xmm12,[rbp-0x430]
0x33f763679097  1257  c4416058e4           vaddps xmm12,xmm3,xmm12
0x33f76367909c  125c  438d3423             leal rsi,[r11+r12*1]
0x33f7636790a0  1260  c5fa6f1c32           vmovdqu xmm3,[rdx+rsi*1]
0x33f7636790a5  1265  c4c16059d8           vmulps xmm3,xmm3,xmm8
0x33f7636790aa  126a  c57811a5d0fbffff     vmovups [rbp-0x430],xmm12
0x33f7636790b2  1272  c57810a5b0fbffff     vmovups xmm12,[rbp-0x450]
0x33f7636790ba  127a  c4416058e4           vaddps xmm12,xmm3,xmm12
0x33f7636790bf  127f  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x33f7636790c4  1284  c5f8109d60fbffff     vmovups xmm3,[rbp-0x4a0]
0x33f7636790cc  128c  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f7636790d0  1290  c4c10859c0           vmulps xmm0,xmm14,xmm8
0x33f7636790d5  1295  c578108540fbffff     vmovups xmm8,[rbp-0x4c0]
0x33f7636790dd  129d  c53858c0             vaddps xmm8,xmm8,xmm0
0x33f7636790e1  12a1  458d4830             leal r9,[r8+0x30]
0x33f7636790e5  12a5  c4a17a6f040a         vmovdqu xmm0,[rdx+r9*1]
0x33f7636790eb  12ab  c5f859c4             vmulps xmm0,xmm0,xmm4
0x33f7636790ef  12af  c57810b570fcffff     vmovups xmm14,[rbp-0x390]
0x33f7636790f7  12b7  c4417858f6           vaddps xmm14,xmm0,xmm14
0x33f7636790fc  12bc  448d4e30             leal r9,[rsi+0x30]
0x33f763679100  12c0  c4a17a6f040a         vmovdqu xmm0,[rdx+r9*1]
0x33f763679106  12c6  c5f859c4             vmulps xmm0,xmm0,xmm4
0x33f76367910a  12ca  c5f8119d60fbffff     vmovups [rbp-0x4a0],xmm3
0x33f763679112  12d2  c5f8109d30fcffff     vmovups xmm3,[rbp-0x3d0]
0x33f76367911a  12da  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f76367911e  12de  c5f059c4             vmulps xmm0,xmm1,xmm4
0x33f763679122  12e2  c5f8108dc0fcffff     vmovups xmm1,[rbp-0x340]
0x33f76367912a  12ea  c5f858c9             vaddps xmm1,xmm0,xmm1
0x33f76367912e  12ee  c5e859c4             vmulps xmm0,xmm2,xmm4
0x33f763679132  12f2  c5f810a5a0fcffff     vmovups xmm4,[rbp-0x360]
0x33f76367913a  12fa  c5d858e0             vaddps xmm4,xmm4,xmm0
0x33f76367913e  12fe  458d4820             leal r9,[r8+0x20]
0x33f763679142  1302  c4a17a6f040a         vmovdqu xmm0,[rdx+r9*1]
0x33f763679148  1308  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x33f76367914d  130d  c5f8109520fbffff     vmovups xmm2,[rbp-0x4e0]
0x33f763679155  1315  c5f858d2             vaddps xmm2,xmm0,xmm2
0x33f763679159  1319  448d4e20             leal r9,[rsi+0x20]
0x33f76367915d  131d  c4a17a6f040a         vmovdqu xmm0,[rdx+r9*1]
0x33f763679163  1323  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x33f763679168  1328  c5f8119d30fcffff     vmovups [rbp-0x3d0],xmm3
0x33f763679170  1330  c5f8109d30fbffff     vmovups xmm3,[rbp-0x4d0]
0x33f763679178  1338  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f76367917c  133c  c5f81085e0fdffff     vmovups xmm0,[rbp-0x220]
0x33f763679184  1344  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x33f763679189  1349  c5f8119d30fbffff     vmovups [rbp-0x4d0],xmm3
0x33f763679191  1351  c5f8109d50fbffff     vmovups xmm3,[rbp-0x4b0]
0x33f763679199  1359  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f76367919d  135d  c5f81085f0fdffff     vmovups xmm0,[rbp-0x210]
0x33f7636791a5  1365  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x33f7636791aa  136a  c578108d70fbffff     vmovups xmm9,[rbp-0x490]
0x33f7636791b2  1372  c53058c8             vaddps xmm9,xmm9,xmm0
0x33f7636791b6  1376  4183c010             addl r8,0x10
0x33f7636791ba  137a  c4a17a6f0402         vmovdqu xmm0,[rdx+r8*1]
0x33f7636791c0  1380  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x33f7636791c5  1385  c5f8119d50fbffff     vmovups [rbp-0x4b0],xmm3
0x33f7636791cd  138d  c5f8109d80fbffff     vmovups xmm3,[rbp-0x480]
0x33f7636791d5  1395  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f7636791d9  1399  448d4610             leal r8,[rsi+0x10]
0x33f7636791dd  139d  c4a17a6f0402         vmovdqu xmm0,[rdx+r8*1]
0x33f7636791e3  13a3  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x33f7636791e8  13a8  c5f8119d80fbffff     vmovups [rbp-0x480],xmm3
0x33f7636791f0  13b0  c5f8109d90fbffff     vmovups xmm3,[rbp-0x470]
0x33f7636791f8  13b8  c5f858db             vaddps xmm3,xmm0,xmm3
0x33f7636791fc  13bc  c4c14859c2           vmulps xmm0,xmm6,xmm10
0x33f763679201  13c1  c5f810b5a0fbffff     vmovups xmm6,[rbp-0x460]
0x33f763679209  13c9  c5f858f6             vaddps xmm6,xmm0,xmm6
0x33f76367920d  13cd  c5f8108500feffff     vmovups xmm0,[rbp-0x200]
0x33f763679215  13d5  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x33f76367921a  13da  c5781095c0fbffff     vmovups xmm10,[rbp-0x440]
0x33f763679222  13e2  c52858d0             vaddps xmm10,xmm10,xmm0
0x33f763679226  13e6  c5f8108510feffff     vmovups xmm0,[rbp-0x1f0]
0x33f76367922e  13ee  c5f8c2c501           vcmpps xmm0,xmm0,xmm5, (lt)
0x33f763679233  13f3  c5f9dbc7             vpand xmm0,xmm0,xmm7
0x33f763679237  13f7  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x33f76367923b  13fb  c5f8119d90fbffff     vmovups [rbp-0x470],xmm3
0x33f763679243  1403  c5f8109d20feffff     vmovups xmm3,[rbp-0x1e0]
0x33f76367924b  140b  c5e059d8             vmulps xmm3,xmm3,xmm0
0x33f76367924f  140f  c578118d70fbffff     vmovups [rbp-0x490],xmm9
0x33f763679257  1417  c578108de0fbffff     vmovups xmm9,[rbp-0x420]
0x33f76367925f  141f  c53058cb             vaddps xmm9,xmm9,xmm3
0x33f763679263  1423  c5f8109d40feffff     vmovups xmm3,[rbp-0x1c0]
0x33f76367926b  142b  c5e059c0             vmulps xmm0,xmm3,xmm0
0x33f76367926f  142f  c5f8109d00fcffff     vmovups xmm3,[rbp-0x400]
0x33f763679277  1437  c5e058c0             vaddps xmm0,xmm3,xmm0
0x33f76367927b  143b  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x33f763679283  1443  c5e0c2dd01           vcmpps xmm3,xmm3,xmm5, (lt)
0x33f763679288  1448  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x33f76367928c  144c  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x33f763679290  1450  c5f8118500fcffff     vmovups [rbp-0x400],xmm0
0x33f763679298  1458  c5f8108560feffff     vmovups xmm0,[rbp-0x1a0]
0x33f7636792a0  1460  c5f859c3             vmulps xmm0,xmm0,xmm3
0x33f7636792a4  1464  c5f811b5a0fbffff     vmovups [rbp-0x460],xmm6
0x33f7636792ac  146c  c5f810b590fdffff     vmovups xmm6,[rbp-0x270]
0x33f7636792b4  1474  c5c858f0             vaddps xmm6,xmm6,xmm0
0x33f7636792b8  1478  c5f8108570feffff     vmovups xmm0,[rbp-0x190]
0x33f7636792c0  1480  c5f859c3             vmulps xmm0,xmm0,xmm3
0x33f7636792c4  1484  c5f8109d50fcffff     vmovups xmm3,[rbp-0x3b0]
0x33f7636792cc  148c  c5e058c0             vaddps xmm0,xmm3,xmm0
0x33f7636792d0  1490  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x33f7636792d8  1498  c5e0c2dd01           vcmpps xmm3,xmm3,xmm5, (lt)
0x33f7636792dd  149d  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x33f7636792e1  14a1  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x33f7636792e5  14a5  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x33f7636792ed  14ad  c5f8108590feffff     vmovups xmm0,[rbp-0x170]
0x33f7636792f5  14b5  c5f859c3             vmulps xmm0,xmm0,xmm3
0x33f7636792f9  14b9  c5f811a5a0fcffff     vmovups [rbp-0x360],xmm4
0x33f763679301  14c1  c5f810a5a0fdffff     vmovups xmm4,[rbp-0x260]
0x33f763679309  14c9  c5d858c0             vaddps xmm0,xmm4,xmm0
0x33f76367930d  14cd  c5f810a5a0feffff     vmovups xmm4,[rbp-0x160]
0x33f763679315  14d5  c5d859db             vmulps xmm3,xmm4,xmm3
0x33f763679319  14d9  c5f810a590fcffff     vmovups xmm4,[rbp-0x370]
0x33f763679321  14e1  c5d858db             vaddps xmm3,xmm4,xmm3
0x33f763679325  14e5  c5a0c2e501           vcmpps xmm4,xmm11,xmm5, (lt)
0x33f76367932a  14ea  c5d9dbe7             vpand xmm4,xmm4,xmm7
0x33f76367932e  14ee  c5f85be4             vcvtdq2ps xmm4,xmm4
0x33f763679332  14f2  c578109d20ffffff     vmovups xmm11,[rbp-0xe0]
0x33f76367933a  14fa  c52059dc             vmulps xmm11,xmm11,xmm4
0x33f76367933e  14fe  c5f810bdb0fcffff     vmovups xmm7,[rbp-0x350]
0x33f763679346  1506  c4c14058fb           vaddps xmm7,xmm7,xmm11
0x33f76367934b  150b  c578109d30ffffff     vmovups xmm11,[rbp-0xd0]
0x33f763679353  1513  c5a059e4             vmulps xmm4,xmm11,xmm4
0x33f763679357  1517  c578109dd0fcffff     vmovups xmm11,[rbp-0x330]
0x33f76367935f  151f  c5a058e4             vaddps xmm4,xmm11,xmm4
0x33f763679363  1523  4183c340             addl r11,0x40
0x33f763679367  1527  83c3ff               addl rbx,0xff
0x33f76367936a  152a  0f8590faffff         jnz 0x33f763678e00  <+0xfc0>
0x33f763679370  1530  c578118540fbffff     vmovups [rbp-0x4c0],xmm8
0x33f763679378  1538  c5781195c0fbffff     vmovups [rbp-0x440],xmm10
0x33f763679380  1540  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f763679388  1548  c57811a5b0fbffff     vmovups [rbp-0x450],xmm12
0x33f763679390  1550  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f763679398  1558  c5f811bdb0fcffff     vmovups [rbp-0x350],xmm7
0x33f7636793a0  1560  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f7636793a8  1568  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x33f7636793b0  1570  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x33f7636793b8  1578  c5f8118dc0fcffff     vmovups [rbp-0x340],xmm1
0x33f7636793c0  1580  c57811b570fcffff     vmovups [rbp-0x390],xmm14
0x33f7636793c8  1588  c57928f4             vmovapd xmm14,xmm4
0x33f7636793cc  158c  c5f810a590fbffff     vmovups xmm4,[rbp-0x470]
0x33f7636793d4  1594  c5f928cb             vmovapd xmm1,xmm3
0x33f7636793d8  1598  c4c17928d9           vmovapd xmm3,xmm9
0x33f7636793dd  159d  c5f810b5d0fbffff     vmovups xmm6,[rbp-0x430]
0x33f7636793e5  15a5  c5f8108580fbffff     vmovups xmm0,[rbp-0x480]
0x33f7636793ed  15ad  c5f8119520fbffff     vmovups [rbp-0x4e0],xmm2
0x33f7636793f5  15b5  c5f8109550fcffff     vmovups xmm2,[rbp-0x3b0]
0x33f7636793fd  15bd  c5781085f0fbffff     vmovups xmm8,[rbp-0x410]
0x33f763679405  15c5  c578109510fcffff     vmovups xmm10,[rbp-0x3f0]
0x33f76367940d  15cd  c578108d20fcffff     vmovups xmm9,[rbp-0x3e0]
0x33f763679415  15d5  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x33f76367941d  15dd  c5f8118580fbffff     vmovups [rbp-0x480],xmm0
0x33f763679425  15e5  c5f811a590fbffff     vmovups [rbp-0x470],xmm4
0x33f76367942d  15ed  c5f811b5d0fbffff     vmovups [rbp-0x430],xmm6
0x33f763679435  15f5  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x33f76367943d  15fd  c578119510fcffff     vmovups [rbp-0x3f0],xmm10
0x33f763679445  1605  c578118d20fcffff     vmovups [rbp-0x3e0],xmm9
0x33f76367944d  160d  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x33f763679455  1615  c57811b5d0fcffff     vmovups [rbp-0x330],xmm14
0x33f76367945d  161d  c5f8118d90fcffff     vmovups [rbp-0x370],xmm1
0x33f763679465  1625  c5f8119550fcffff     vmovups [rbp-0x3b0],xmm2
0x33f76367946d  162d  c5f8119de0fbffff     vmovups [rbp-0x420],xmm3
0x33f763679475  1635  4585ff               testl r15,r15
0x33f763679478  1638  0f850c000000         jnz 0x33f76367948a  <+0x164a>
0x33f76367947e  163e  448ba500fdffff       movl r12,[rbp-0x300]
0x33f763679485  1645  e996080000           jmp 0x33f763679d20  <+0x1ee0>
0x33f76367948a  164a  448d40f0             leal r8,[rax-0x10]
0x33f76367948e  164e  458bd8               movl r11,r8
0x33f763679491  1651  413bc0               cmpl rax,r8
0x33f763679494  1654  440f42d9             cmovcl r11,rcx
0x33f763679498  1658  458d4310             leal r8,[r11+0x10]
0x33f76367949c  165c  448ba500fdffff       movl r12,[rbp-0x300]
0x33f7636794a3  1663  453be0               cmpl r12,r8
0x33f7636794a6  1666  0f8274080000         jc 0x33f763679d20  <+0x1ee0>
0x33f7636794ac  166c  448bb508fdffff       movl r14,[rbp-0x2f8]
0x33f7636794b3  1673  453bf0               cmpl r14,r8
0x33f7636794b6  1676  0f821c080000         jc 0x33f763679cd8  <+0x1e98>
0x33f7636794bc  167c  8bbd10fdffff         movl rdi,[rbp-0x2f0]
0x33f7636794c2  1682  468d049f             leal r8,[rdi+r11*4]
0x33f7636794c6  1686  c4a17a6f2402         vmovdqu xmm4,[rdx+r8*1]
0x33f7636794cc  168c  c5f811a550feffff     vmovups [rbp-0x1b0],xmm4
0x33f7636794d4  1694  c4a17a6f640210       vmovdqu xmm4,[rdx+r8*1+0x10]
0x33f7636794db  169b  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0x33f7636794e3  16a3  c4a17a6f640220       vmovdqu xmm4,[rdx+r8*1+0x20]
0x33f7636794ea  16aa  c5f811a530feffff     vmovups [rbp-0x1d0],xmm4
0x33f7636794f2  16b2  c4a17a6f640230       vmovdqu xmm4,[rdx+r8*1+0x30]
0x33f7636794f9  16b9  8b9d18fdffff         movl rbx,[rbp-0x2e8]
0x33f7636794ff  16bf  468d049b             leal r8,[rbx+r11*4]
0x33f763679503  16c3  c5f811a520feffff     vmovups [rbp-0x1e0],xmm4
0x33f76367950b  16cb  c4a17a6f2402         vmovdqu xmm4,[rdx+r8*1]
0x33f763679511  16d1  c4a17a6f740210       vmovdqu xmm6,[rdx+r8*1+0x10]
0x33f763679518  16d8  c5f811a510feffff     vmovups [rbp-0x1f0],xmm4
0x33f763679520  16e0  c4a17a6f640220       vmovdqu xmm4,[rdx+r8*1+0x20]
0x33f763679527  16e7  c4a17a6f440230       vmovdqu xmm0,[rdx+r8*1+0x30]
0x33f76367952e  16ee  448b8520fdffff       movl r8,[rbp-0x2e0]
0x33f763679535  16f5  438d3498             leal rsi,[r8+r11*4]
0x33f763679539  16f9  c5f811b500feffff     vmovups [rbp-0x200],xmm6
0x33f763679541  1701  c5fa6f3432           vmovdqu xmm6,[rdx+rsi*1]
0x33f763679546  1706  c5f811a5f0fdffff     vmovups [rbp-0x210],xmm4
0x33f76367954e  170e  c5fa6f643210         vmovdqu xmm4,[rdx+rsi*1+0x10]
0x33f763679554  1714  c5f81185e0fdffff     vmovups [rbp-0x220],xmm0
0x33f76367955c  171c  c5fa6f443220         vmovdqu xmm0,[rdx+rsi*1+0x20]
0x33f763679562  1722  448b8d28fdffff       movl r9,[rbp-0x2d8]
0x33f763679569  1729  438d3c99             leal rdi,[r9+r11*4]
0x33f76367956d  172d  c57a6f043a           vmovdqu xmm8,[rdx+rdi*1]
0x33f763679572  1732  c57a6f543a10         vmovdqu xmm10,[rdx+rdi*1+0x10]
0x33f763679578  1738  c57a6f4c3a20         vmovdqu xmm9,[rdx+rdi*1+0x20]
0x33f76367957e  173e  c57a6f6c3230         vmovdqu xmm13,[rdx+rsi*1+0x30]
0x33f763679584  1744  c441205cf5           vsubps xmm14,xmm11,xmm13
0x33f763679589  1749  4503fb               addl r15,r11
0x33f76367958c  174c  8bf0                 movl rsi,rax
0x33f76367958e  174e  412bf7               subl rsi,r15
0x33f763679591  1751  c57811ad60feffff     vmovups [rbp-0x1a0],xmm13
0x33f763679599  1759  c5796eee             vmovd xmm13,rsi
0x33f76367959d  175d  c4417970ed00         vpshufd xmm13,xmm13,0x0
0x33f7636795a3  1763  49ba0d0000000e000000 REX.W movq r10,0xe0000000d
0x33f7636795ad  176d  c4c1f96eca           vmovq xmm1,r10
0x33f7636795b2  1772  49ba0f00000010000000 REX.W movq r10,0x100000000f
0x33f7636795bc  177c  c4c3f122ca01         vpinsrq xmm1,xmm1,r10,0x1
0x33f7636795c2  1782  c4c2713fcd           vpmaxud xmm1,xmm1,xmm13
0x33f7636795c7  1787  c4c17176cd           vpcmpeqd xmm1,xmm1,xmm13
0x33f7636795cc  178c  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f7636795d1  1791  c4c171efcf           vpxor xmm1,xmm1,xmm15
0x33f7636795d6  1796  412bc3               subl rax,r11
0x33f7636795d9  1799  c5f96ed0             vmovd xmm2,rax
0x33f7636795dd  179d  c5f970d200           vpshufd xmm2,xmm2,0x0
0x33f7636795e2  17a2  49ba0c0000000d000000 REX.W movq r10,0xd0000000c
0x33f7636795ec  17ac  c4c1f96eda           vmovq xmm3,r10
0x33f7636795f1  17b1  49ba0e0000000f000000 REX.W movq r10,0xf0000000e
0x33f7636795fb  17bb  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x33f763679601  17c1  c578118530ffffff     vmovups [rbp-0xd0],xmm8
0x33f763679609  17c9  c57928c2             vmovapd xmm8,xmm2
0x33f76367960d  17cd  c462393fc3           vpmaxud xmm8,xmm8,xmm3
0x33f763679612  17d2  c53976c3             vpcmpeqd xmm8,xmm8,xmm3
0x33f763679616  17d6  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f76367961b  17db  c44139efc7           vpxor xmm8,xmm8,xmm15
0x33f763679620  17e0  c4c171dbd8           vpand xmm3,xmm1,xmm8
0x33f763679625  17e5  c57a6f443a30         vmovdqu xmm8,[rdx+rdi*1+0x30]
0x33f76367962b  17eb  c4c1185cc8           vsubps xmm1,xmm12,xmm8
0x33f763679630  17f0  c578118590feffff     vmovups [rbp-0x170],xmm8
0x33f763679638  17f8  c57059c1             vmulps xmm8,xmm1,xmm1
0x33f76367963c  17fc  c5f8118d50fdffff     vmovups [rbp-0x2b0],xmm1
0x33f763679644  1804  c4c10859ce           vmulps xmm1,xmm14,xmm14
0x33f763679649  1809  c53858c1             vaddps xmm8,xmm8,xmm1
0x33f76367964d  180d  c5b8c2cd01           vcmpps xmm1,xmm8,xmm5, (lt)
0x33f763679652  1812  c5f1dbcf             vpand xmm1,xmm1,xmm7
0x33f763679656  1816  c5f85bc9             vcvtdq2ps xmm1,xmm1
0x33f76367965a  181a  c5e1dbc9             vpand xmm1,xmm3,xmm1
0x33f76367965e  181e  c50859f1             vmulps xmm14,xmm14,xmm1
0x33f763679662  1822  c5f8119d60fdffff     vmovups [rbp-0x2a0],xmm3
0x33f76367966a  182a  c5f8109d90fdffff     vmovups xmm3,[rbp-0x270]
0x33f763679672  1832  c58858db             vaddps xmm3,xmm14,xmm3
0x33f763679676  1836  8b7de0               movl rdi,[rbp-0x20]
0x33f763679679  1839  c5fa7f9c3af0010000   vmovdqu [rdx+rdi*1+0x1f0],xmm3
0x33f763679682  1842  c5a05cd8             vsubps xmm3,xmm11,xmm0
0x33f763679686  1846  49ba090000000a000000 REX.W movq r10,0xa00000009
0x33f763679690  1850  c441f96ef2           vmovq xmm14,r10
0x33f763679695  1855  49ba0b0000000c000000 REX.W movq r10,0xc0000000b
0x33f76367969f  185f  c4438922f201         vpinsrq xmm14,xmm14,r10,0x1
0x33f7636796a5  1865  c442093ff5           vpmaxud xmm14,xmm14,xmm13
0x33f7636796aa  186a  c4410976f5           vpcmpeqd xmm14,xmm14,xmm13
0x33f7636796af  186f  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f7636796b4  1874  c44109eff7           vpxor xmm14,xmm14,xmm15
0x33f7636796b9  1879  c5f8118570feffff     vmovups [rbp-0x190],xmm0
0x33f7636796c1  1881  49ba0800000009000000 REX.W movq r10,0x900000008
0x33f7636796cb  188b  c4c1f96ec2           vmovq xmm0,r10
0x33f7636796d0  1890  49ba0a0000000b000000 REX.W movq r10,0xb0000000a
0x33f7636796da  189a  c4c3f922c201         vpinsrq xmm0,xmm0,r10,0x1
0x33f7636796e0  18a0  c578118570fdffff     vmovups [rbp-0x290],xmm8
0x33f7636796e8  18a8  c57928c2             vmovapd xmm8,xmm2
0x33f7636796ec  18ac  c462393fc0           vpmaxud xmm8,xmm8,xmm0
0x33f7636796f1  18b1  c53976c0             vpcmpeqd xmm8,xmm8,xmm0
0x33f7636796f5  18b5  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f7636796fa  18ba  c44139efc7           vpxor xmm8,xmm8,xmm15
0x33f7636796ff  18bf  c4c109dbc0           vpand xmm0,xmm14,xmm8
0x33f763679704  18c4  c441185cc1           vsubps xmm8,xmm12,xmm9
0x33f763679709  18c9  c4413859f0           vmulps xmm14,xmm8,xmm8
0x33f76367970e  18ce  c578118da0feffff     vmovups [rbp-0x160],xmm9
0x33f763679716  18d6  c56059cb             vmulps xmm9,xmm3,xmm3
0x33f76367971a  18da  c4410858c9           vaddps xmm9,xmm14,xmm9
0x33f76367971f  18df  c530c2f501           vcmpps xmm14,xmm9,xmm5, (lt)
0x33f763679724  18e4  c509dbf7             vpand xmm14,xmm14,xmm7
0x33f763679728  18e8  c441785bf6           vcvtdq2ps xmm14,xmm14
0x33f76367972d  18ed  c44179dbf6           vpand xmm14,xmm0,xmm14
0x33f763679732  18f2  c4c16059de           vmulps xmm3,xmm3,xmm14
0x33f763679737  18f7  c5f8118580fdffff     vmovups [rbp-0x280],xmm0
0x33f76367973f  18ff  c5f81085a0fdffff     vmovups xmm0,[rbp-0x260]
0x33f763679747  1907  c5e058c0             vaddps xmm0,xmm3,xmm0
0x33f76367974b  190b  c5fa7f843ae0010000   vmovdqu [rdx+rdi*1+0x1e0],xmm0
0x33f763679754  1914  c5a05cc4             vsubps xmm0,xmm11,xmm4
0x33f763679758  1918  49ba0500000006000000 REX.W movq r10,0x600000005
0x33f763679762  1922  c4c1f96eda           vmovq xmm3,r10
0x33f763679767  1927  49ba0700000008000000 REX.W movq r10,0x800000007
0x33f763679771  1931  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x33f763679777  1937  c4c2613fdd           vpmaxud xmm3,xmm3,xmm13
0x33f76367977c  193c  c4c16176dd           vpcmpeqd xmm3,xmm3,xmm13
0x33f763679781  1941  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f763679786  1946  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x33f76367978b  194b  c5f811a580feffff     vmovups [rbp-0x180],xmm4
0x33f763679793  1953  49ba0400000005000000 REX.W movq r10,0x500000004
0x33f76367979d  195d  c4c1f96ee2           vmovq xmm4,r10
0x33f7636797a2  1962  49ba0600000007000000 REX.W movq r10,0x700000006
0x33f7636797ac  196c  c4c3d922e201         vpinsrq xmm4,xmm4,r10,0x1
0x33f7636797b2  1972  c578118d90fdffff     vmovups [rbp-0x270],xmm9
0x33f7636797ba  197a  c57928ca             vmovapd xmm9,xmm2
0x33f7636797be  197e  c462313fcc           vpmaxud xmm9,xmm9,xmm4
0x33f7636797c3  1983  c53176cc             vpcmpeqd xmm9,xmm9,xmm4
0x33f7636797c7  1987  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f7636797cc  198c  c44131efcf           vpxor xmm9,xmm9,xmm15
0x33f7636797d1  1991  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x33f7636797d6  1996  c4c1185ce2           vsubps xmm4,xmm12,xmm10
0x33f7636797db  199b  c55859cc             vmulps xmm9,xmm4,xmm4
0x33f7636797df  199f  c578119520ffffff     vmovups [rbp-0xe0],xmm10
0x33f7636797e7  19a7  c57859d0             vmulps xmm10,xmm0,xmm0
0x33f7636797eb  19ab  c4413058ca           vaddps xmm9,xmm9,xmm10
0x33f7636797f0  19b0  c530c2d501           vcmpps xmm10,xmm9,xmm5, (lt)
0x33f7636797f5  19b5  c529dbd7             vpand xmm10,xmm10,xmm7
0x33f7636797f9  19b9  c441785bd2           vcvtdq2ps xmm10,xmm10
0x33f7636797fe  19be  c44161dbd2           vpand xmm10,xmm3,xmm10
0x33f763679803  19c3  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x33f763679808  19c8  c5f8119da0fdffff     vmovups [rbp-0x260],xmm3
0x33f763679810  19d0  c5f8109db0fcffff     vmovups xmm3,[rbp-0x350]
0x33f763679818  19d8  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367981c  19dc  c5fa7f843ad0010000   vmovdqu [rdx+rdi*1+0x1d0],xmm0
0x33f763679825  19e5  c5a05cc6             vsubps xmm0,xmm11,xmm6
0x33f763679829  19e9  49ba0100000002000000 REX.W movq r10,0x200000001
0x33f763679833  19f3  c4c1f96eda           vmovq xmm3,r10
0x33f763679838  19f8  49ba0300000004000000 REX.W movq r10,0x400000003
0x33f763679842  1a02  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x33f763679848  1a08  c4c2613fdd           vpmaxud xmm3,xmm3,xmm13
0x33f76367984d  1a0d  c4c16176dd           vpcmpeqd xmm3,xmm3,xmm13
0x33f763679852  1a12  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f763679857  1a17  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x33f76367985c  1a1c  c4411176ed           vpcmpeqd xmm13,xmm13,xmm13
0x33f763679861  1a21  c4c11173f53f         vpsllq xmm13,xmm13,63
0x33f763679867  1a27  c4c11173d51f         vpsrlq xmm13,xmm13,31
0x33f76367986d  1a2d  49ba0200000003000000 REX.W movq r10,0x300000002
0x33f763679877  1a37  c4439122ea01         vpinsrq xmm13,xmm13,r10,0x1
0x33f76367987d  1a3d  c4c2693fd5           vpmaxud xmm2,xmm2,xmm13
0x33f763679882  1a42  c4c16976d5           vpcmpeqd xmm2,xmm2,xmm13
0x33f763679887  1a47  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x33f76367988c  1a4c  c4c169efd7           vpxor xmm2,xmm2,xmm15
0x33f763679891  1a51  c5e1dbda             vpand xmm3,xmm3,xmm2
0x33f763679895  1a55  c57810ad30ffffff     vmovups xmm13,[rbp-0xd0]
0x33f76367989d  1a5d  c4c1185cd5           vsubps xmm2,xmm12,xmm13
0x33f7636798a2  1a62  c56859da             vmulps xmm11,xmm2,xmm2
0x33f7636798a6  1a66  c57859e0             vmulps xmm12,xmm0,xmm0
0x33f7636798aa  1a6a  c4412058dc           vaddps xmm11,xmm11,xmm12
0x33f7636798af  1a6f  c520c2e501           vcmpps xmm12,xmm11,xmm5, (lt)
0x33f7636798b4  1a74  c519dbe7             vpand xmm12,xmm12,xmm7
0x33f7636798b8  1a78  c441785be4           vcvtdq2ps xmm12,xmm12
0x33f7636798bd  1a7d  c44161dbe4           vpand xmm12,xmm3,xmm12
0x33f7636798c2  1a82  c4c17859c4           vmulps xmm0,xmm0,xmm12
0x33f7636798c7  1a87  c57810ade0fbffff     vmovups xmm13,[rbp-0x420]
0x33f7636798cf  1a8f  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x33f7636798d4  1a94  c5fa7f843ac0010000   vmovdqu [rdx+rdi*1+0x1c0],xmm0
0x33f7636798dd  1a9d  c5f8108550fdffff     vmovups xmm0,[rbp-0x2b0]
0x33f7636798e5  1aa5  c5f859c1             vmulps xmm0,xmm0,xmm1
0x33f7636798e9  1aa9  c5f8108d50fcffff     vmovups xmm1,[rbp-0x3b0]
0x33f7636798f1  1ab1  c5f858c1             vaddps xmm0,xmm0,xmm1
0x33f7636798f5  1ab5  c5fa7f843ab0010000   vmovdqu [rdx+rdi*1+0x1b0],xmm0
0x33f7636798fe  1abe  c4c13859c6           vmulps xmm0,xmm8,xmm14
0x33f763679903  1ac3  c578108590fcffff     vmovups xmm8,[rbp-0x370]
0x33f76367990b  1acb  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x33f763679910  1ad0  c5fa7f843aa0010000   vmovdqu [rdx+rdi*1+0x1a0],xmm0
0x33f763679919  1ad9  c4c15859c2           vmulps xmm0,xmm4,xmm10
0x33f76367991e  1ade  c57810b5d0fcffff     vmovups xmm14,[rbp-0x330]
0x33f763679926  1ae6  c4c17858c6           vaddps xmm0,xmm0,xmm14
0x33f76367992b  1aeb  c5fa7f843a90010000   vmovdqu [rdx+rdi*1+0x190],xmm0
0x33f763679934  1af4  c4c16859c4           vmulps xmm0,xmm2,xmm12
0x33f763679939  1af9  c5f810a500fcffff     vmovups xmm4,[rbp-0x400]
0x33f763679941  1b01  c5f858c4             vaddps xmm0,xmm0,xmm4
0x33f763679945  1b05  c5fa7f843a80010000   vmovdqu [rdx+rdi*1+0x180],xmm0
0x33f76367994e  1b0e  c5f8108570fdffff     vmovups xmm0,[rbp-0x290]
0x33f763679956  1b16  c5d0c2e002           vcmpps xmm4,xmm5,xmm0, (le)
0x33f76367995b  1b1b  c5781085c0fdffff     vmovups xmm8,[rbp-0x240]
0x33f763679963  1b23  c44178c2d001         vcmpps xmm10,xmm0,xmm8, (lt)
0x33f763679969  1b29  c4c159dbe2           vpand xmm4,xmm4,xmm10
0x33f76367996e  1b2e  c578109560fdffff     vmovups xmm10,[rbp-0x2a0]
0x33f763679976  1b36  c5a9dbe4             vpand xmm4,xmm10,xmm4
0x33f76367997a  1b3a  c5d972f41f           vpslld xmm4,xmm4,31
0x33f76367997f  1b3f  c5d972e41f           vpsrad xmm4,xmm4,31
0x33f763679984  1b44  c44129efd2           vpxor xmm10,xmm10,xmm10
0x33f763679989  1b49  c5a8c2c001           vcmpps xmm0,xmm10,xmm0, (lt)
0x33f76367998e  1b4e  c5f9dbc7             vpand xmm0,xmm0,xmm7
0x33f763679992  1b52  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x33f763679996  1b56  c5d9dbc0             vpand xmm0,xmm4,xmm0
0x33f76367999a  1b5a  c57810a520fcffff     vmovups xmm12,[rbp-0x3e0]
0x33f7636799a2  1b62  c4c17858e4           vaddps xmm4,xmm0,xmm12
0x33f7636799a7  1b67  c5fa7fa43a70010000   vmovdqu [rdx+rdi*1+0x170],xmm4
0x33f7636799b0  1b70  c5f810a590fdffff     vmovups xmm4,[rbp-0x270]
0x33f7636799b8  1b78  c550c2e402           vcmpps xmm12,xmm5,xmm4, (le)
0x33f7636799bd  1b7d  c44158c2e801         vcmpps xmm13,xmm4,xmm8, (lt)
0x33f7636799c3  1b83  c44119dbe5           vpand xmm12,xmm12,xmm13
0x33f7636799c8  1b88  c57810ad80fdffff     vmovups xmm13,[rbp-0x280]
0x33f7636799d0  1b90  c44111dbe4           vpand xmm12,xmm13,xmm12
0x33f7636799d5  1b95  c4c11972f41f         vpslld xmm12,xmm12,31
0x33f7636799db  1b9b  c4c11972e41f         vpsrad xmm12,xmm12,31
0x33f7636799e1  1ba1  c5a8c2e401           vcmpps xmm4,xmm10,xmm4, (lt)
0x33f7636799e6  1ba6  c5d9dbe7             vpand xmm4,xmm4,xmm7
0x33f7636799ea  1baa  c5f85be4             vcvtdq2ps xmm4,xmm4
0x33f7636799ee  1bae  c599dbe4             vpand xmm4,xmm12,xmm4
0x33f7636799f2  1bb2  c5f8109510fcffff     vmovups xmm2,[rbp-0x3f0]
0x33f7636799fa  1bba  c55858e2             vaddps xmm12,xmm4,xmm2
0x33f7636799fe  1bbe  c57a7fa43a60010000   vmovdqu [rdx+rdi*1+0x160],xmm12
0x33f763679a07  1bc7  c44150c2e102         vcmpps xmm12,xmm5,xmm9, (le)
0x33f763679a0d  1bcd  c44130c2e801         vcmpps xmm13,xmm9,xmm8, (lt)
0x33f763679a13  1bd3  c44119dbe5           vpand xmm12,xmm12,xmm13
0x33f763679a18  1bd8  c57810ada0fdffff     vmovups xmm13,[rbp-0x260]
0x33f763679a20  1be0  c44111dbe4           vpand xmm12,xmm13,xmm12
0x33f763679a25  1be5  c4c11972f41f         vpslld xmm12,xmm12,31
0x33f763679a2b  1beb  c4c11972e41f         vpsrad xmm12,xmm12,31
0x33f763679a31  1bf1  c44128c2c901         vcmpps xmm9,xmm10,xmm9, (lt)
0x33f763679a37  1bf7  c531dbcf             vpand xmm9,xmm9,xmm7
0x33f763679a3b  1bfb  c441785bc9           vcvtdq2ps xmm9,xmm9
0x33f763679a40  1c00  c44119dbc9           vpand xmm9,xmm12,xmm9
0x33f763679a45  1c05  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x33f763679a4d  1c0d  c4413058e4           vaddps xmm12,xmm9,xmm12
0x33f763679a52  1c12  c57a7fa43a50010000   vmovdqu [rdx+rdi*1+0x150],xmm12
0x33f763679a5b  1c1b  c44150c2e302         vcmpps xmm12,xmm5,xmm11, (le)
0x33f763679a61  1c21  c44120c2e801         vcmpps xmm13,xmm11,xmm8, (lt)
0x33f763679a67  1c27  c44119dbe5           vpand xmm12,xmm12,xmm13
0x33f763679a6c  1c2c  c4c161dbdc           vpand xmm3,xmm3,xmm12
0x33f763679a71  1c31  c5e172f31f           vpslld xmm3,xmm3,31
0x33f763679a76  1c36  c5e172e31f           vpsrad xmm3,xmm3,31
0x33f763679a7b  1c3b  c44128c2d301         vcmpps xmm10,xmm10,xmm11, (lt)
0x33f763679a81  1c41  c529dbd7             vpand xmm10,xmm10,xmm7
0x33f763679a85  1c45  c441785bd2           vcvtdq2ps xmm10,xmm10
0x33f763679a8a  1c4a  c4c161dbda           vpand xmm3,xmm3,xmm10
0x33f763679a8f  1c4f  c578109540fcffff     vmovups xmm10,[rbp-0x3c0]
0x33f763679a97  1c57  c4416058d2           vaddps xmm10,xmm3,xmm10
0x33f763679a9c  1c5c  c57a7f943a40010000   vmovdqu [rdx+rdi*1+0x140],xmm10
0x33f763679aa5  1c65  c5781095e0fdffff     vmovups xmm10,[rbp-0x220]
0x33f763679aad  1c6d  c52859d0             vmulps xmm10,xmm10,xmm0
0x33f763679ab1  1c71  c578109d70fcffff     vmovups xmm11,[rbp-0x390]
0x33f763679ab9  1c79  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679abe  1c7e  c57a7f943a30010000   vmovdqu [rdx+rdi*1+0x130],xmm10
0x33f763679ac7  1c87  c5781095f0fdffff     vmovups xmm10,[rbp-0x210]
0x33f763679acf  1c8f  c52859d4             vmulps xmm10,xmm10,xmm4
0x33f763679ad3  1c93  c5f8109520fbffff     vmovups xmm2,[rbp-0x4e0]
0x33f763679adb  1c9b  c52858d2             vaddps xmm10,xmm10,xmm2
0x33f763679adf  1c9f  c57a7f943a20010000   vmovdqu [rdx+rdi*1+0x120],xmm10
0x33f763679ae8  1ca8  c578109500feffff     vmovups xmm10,[rbp-0x200]
0x33f763679af0  1cb0  c4412859d1           vmulps xmm10,xmm10,xmm9
0x33f763679af5  1cb5  c578109d80fbffff     vmovups xmm11,[rbp-0x480]
0x33f763679afd  1cbd  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679b02  1cc2  c57a7f943a10010000   vmovdqu [rdx+rdi*1+0x110],xmm10
0x33f763679b0b  1ccb  c578109510feffff     vmovups xmm10,[rbp-0x1f0]
0x33f763679b13  1cd3  c52859d3             vmulps xmm10,xmm10,xmm3
0x33f763679b17  1cd7  c57810a5d0fbffff     vmovups xmm12,[rbp-0x430]
0x33f763679b1f  1cdf  c4412858d4           vaddps xmm10,xmm10,xmm12
0x33f763679b24  1ce4  c57a7f943a00010000   vmovdqu [rdx+rdi*1+0x100],xmm10
0x33f763679b2d  1ced  c578109520feffff     vmovups xmm10,[rbp-0x1e0]
0x33f763679b35  1cf5  c52859d0             vmulps xmm10,xmm10,xmm0
0x33f763679b39  1cf9  c578109d30fcffff     vmovups xmm11,[rbp-0x3d0]
0x33f763679b41  1d01  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679b46  1d06  c57a7f943af0000000   vmovdqu [rdx+rdi*1+0xf0],xmm10
0x33f763679b4f  1d0f  c578109530feffff     vmovups xmm10,[rbp-0x1d0]
0x33f763679b57  1d17  c52859d4             vmulps xmm10,xmm10,xmm4
0x33f763679b5b  1d1b  c578109d30fbffff     vmovups xmm11,[rbp-0x4d0]
0x33f763679b63  1d23  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679b68  1d28  c57a7f943ae0000000   vmovdqu [rdx+rdi*1+0xe0],xmm10
0x33f763679b71  1d31  c578109540feffff     vmovups xmm10,[rbp-0x1c0]
0x33f763679b79  1d39  c4412859d1           vmulps xmm10,xmm10,xmm9
0x33f763679b7e  1d3e  c578109d90fbffff     vmovups xmm11,[rbp-0x470]
0x33f763679b86  1d46  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679b8b  1d4b  c57a7f943ad0000000   vmovdqu [rdx+rdi*1+0xd0],xmm10
0x33f763679b94  1d54  c578109550feffff     vmovups xmm10,[rbp-0x1b0]
0x33f763679b9c  1d5c  c52859d3             vmulps xmm10,xmm10,xmm3
0x33f763679ba0  1d60  c57810a5b0fbffff     vmovups xmm12,[rbp-0x450]
0x33f763679ba8  1d68  c4412858d4           vaddps xmm10,xmm10,xmm12
0x33f763679bad  1d6d  c57a7f943ac0000000   vmovdqu [rdx+rdi*1+0xc0],xmm10
0x33f763679bb6  1d76  c578109560feffff     vmovups xmm10,[rbp-0x1a0]
0x33f763679bbe  1d7e  c52859d0             vmulps xmm10,xmm10,xmm0
0x33f763679bc2  1d82  c5f8108dc0fcffff     vmovups xmm1,[rbp-0x340]
0x33f763679bca  1d8a  c52858d1             vaddps xmm10,xmm10,xmm1
0x33f763679bce  1d8e  c57a7f943ab0000000   vmovdqu [rdx+rdi*1+0xb0],xmm10
0x33f763679bd7  1d97  c578109570feffff     vmovups xmm10,[rbp-0x190]
0x33f763679bdf  1d9f  c52859d4             vmulps xmm10,xmm10,xmm4
0x33f763679be3  1da3  c578109d50fbffff     vmovups xmm11,[rbp-0x4b0]
0x33f763679beb  1dab  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679bf0  1db0  c57a7f943aa0000000   vmovdqu [rdx+rdi*1+0xa0],xmm10
0x33f763679bf9  1db9  c578109580feffff     vmovups xmm10,[rbp-0x180]
0x33f763679c01  1dc1  c4412859d1           vmulps xmm10,xmm10,xmm9
0x33f763679c06  1dc6  c578109da0fbffff     vmovups xmm11,[rbp-0x460]
0x33f763679c0e  1dce  c4412858d3           vaddps xmm10,xmm10,xmm11
0x33f763679c13  1dd3  c57a7f943a90000000   vmovdqu [rdx+rdi*1+0x90],xmm10
0x33f763679c1c  1ddc  c5c859f3             vmulps xmm6,xmm6,xmm3
0x33f763679c20  1de0  c578109560fbffff     vmovups xmm10,[rbp-0x4a0]
0x33f763679c28  1de8  c4c14858f2           vaddps xmm6,xmm6,xmm10
0x33f763679c2d  1ded  c5fa7fb43a80000000   vmovdqu [rdx+rdi*1+0x80],xmm6
0x33f763679c36  1df6  c5f810b590feffff     vmovups xmm6,[rbp-0x170]
0x33f763679c3e  1dfe  c5c859c0             vmulps xmm0,xmm6,xmm0
0x33f763679c42  1e02  c5f810b5a0fcffff     vmovups xmm6,[rbp-0x360]
0x33f763679c4a  1e0a  c5f858c6             vaddps xmm0,xmm0,xmm6
0x33f763679c4e  1e0e  c5fa7f443a70         vmovdqu [rdx+rdi*1+0x70],xmm0
0x33f763679c54  1e14  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x33f763679c5c  1e1c  c5f859c4             vmulps xmm0,xmm0,xmm4
0x33f763679c60  1e20  c5f810a570fbffff     vmovups xmm4,[rbp-0x490]
0x33f763679c68  1e28  c5f858c4             vaddps xmm0,xmm0,xmm4
0x33f763679c6c  1e2c  c5fa7f443a60         vmovdqu [rdx+rdi*1+0x60],xmm0
0x33f763679c72  1e32  c5f8108520ffffff     vmovups xmm0,[rbp-0xe0]
0x33f763679c7a  1e3a  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x33f763679c7f  1e3f  c578108dc0fbffff     vmovups xmm9,[rbp-0x440]
0x33f763679c87  1e47  c4c17858c1           vaddps xmm0,xmm0,xmm9
0x33f763679c8c  1e4c  c5fa7f443a50         vmovdqu [rdx+rdi*1+0x50],xmm0
0x33f763679c92  1e52  c5f8108530ffffff     vmovups xmm0,[rbp-0xd0]
0x33f763679c9a  1e5a  c5f859c3             vmulps xmm0,xmm0,xmm3
0x33f763679c9e  1e5e  c5f8109d40fbffff     vmovups xmm3,[rbp-0x4c0]
0x33f763679ca6  1e66  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f763679caa  1e6a  c5fa7f443a40         vmovdqu [rdx+rdi*1+0x40],xmm0
0x33f763679cb0  1e70  8d4740               leal rax,[rdi+0x40]
0x33f763679cb3  1e73  448d5f10             leal r11,[rdi+0x10]
0x33f763679cb7  1e77  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f763679cbb  1e7b  418bd3               movl rdx,r11
0x33f763679cbe  1e7e  e87d40f2ff           call 0x33f76359dd40  (jump table)
0x33f763679cc3  1e83  8b5de0               movl rbx,[rbp-0x20]
0x33f763679cc6  1e86  4c8b45c8             REX.W movq r8,[rbp-0x38]
0x33f763679cca  1e8a  448ba500fdffff       movl r12,[rbp-0x300]
0x33f763679cd1  1e91  33c9                 xorl rcx,rcx
0x33f763679cd3  1e93  e933090000           jmp 0x33f76367a60b  <+0x27cb>
0x33f763679cd8  1e98  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f763679ce0  1ea0  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f763679ce8  1ea8  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x33f763679cf0  1eb0  c578108d20fcffff     vmovups xmm9,[rbp-0x3e0]
0x33f763679cf8  1eb8  c578109510fcffff     vmovups xmm10,[rbp-0x3f0]
0x33f763679d00  1ec0  c5781085f0fbffff     vmovups xmm8,[rbp-0x410]
0x33f763679d08  1ec8  c5f810b5d0fbffff     vmovups xmm6,[rbp-0x430]
0x33f763679d10  1ed0  c5f810a590fbffff     vmovups xmm4,[rbp-0x470]
0x33f763679d18  1ed8  c5f8108580fbffff     vmovups xmm0,[rbp-0x480]
0x33f763679d20  1ee0  4c8bc2               REX.W movq r8,rdx
0x33f763679d23  1ee3  c5f810ad30fbffff     vmovups xmm5,[rbp-0x4d0]
0x33f763679d2b  1eeb  8b5de0               movl rbx,[rbp-0x20]
0x33f763679d2e  1eee  c4c17a7fac18e0000000 vmovdqu [r8+rbx*1+0xe0],xmm5
0x33f763679d38  1ef8  c5f810bdb0fbffff     vmovups xmm7,[rbp-0x450]
0x33f763679d40  1f00  c4c17a7fbc18c0000000 vmovdqu [r8+rbx*1+0xc0],xmm7
0x33f763679d4a  1f0a  c5f810adc0fcffff     vmovups xmm5,[rbp-0x340]
0x33f763679d52  1f12  c4c17a7fac18b0000000 vmovdqu [r8+rbx*1+0xb0],xmm5
0x33f763679d5c  1f1c  c5f810bd50fbffff     vmovups xmm7,[rbp-0x4b0]
0x33f763679d64  1f24  c4c17a7fbc18a0000000 vmovdqu [r8+rbx*1+0xa0],xmm7
0x33f763679d6e  1f2e  c5f810ada0fbffff     vmovups xmm5,[rbp-0x460]
0x33f763679d76  1f36  c4c17a7fac1890000000 vmovdqu [r8+rbx*1+0x90],xmm5
0x33f763679d80  1f40  c5f810bd60fbffff     vmovups xmm7,[rbp-0x4a0]
0x33f763679d88  1f48  c4c17a7fbc1880000000 vmovdqu [r8+rbx*1+0x80],xmm7
0x33f763679d92  1f52  c5f810ada0fcffff     vmovups xmm5,[rbp-0x360]
0x33f763679d9a  1f5a  c4c17a7f6c1870       vmovdqu [r8+rbx*1+0x70],xmm5
0x33f763679da1  1f61  c5f810bd70fbffff     vmovups xmm7,[rbp-0x490]
0x33f763679da9  1f69  c4c17a7f7c1860       vmovdqu [r8+rbx*1+0x60],xmm7
0x33f763679db0  1f70  c5f810adc0fbffff     vmovups xmm5,[rbp-0x440]
0x33f763679db8  1f78  c4c17a7f6c1850       vmovdqu [r8+rbx*1+0x50],xmm5
0x33f763679dbf  1f7f  c5f810bd40fbffff     vmovups xmm7,[rbp-0x4c0]
0x33f763679dc7  1f87  c4c17a7f7c1840       vmovdqu [r8+rbx*1+0x40],xmm7
0x33f763679dce  1f8e  c5f810ad30fcffff     vmovups xmm5,[rbp-0x3d0]
0x33f763679dd6  1f96  c4c17a7fac18f0000000 vmovdqu [r8+rbx*1+0xf0],xmm5
0x33f763679de0  1fa0  c5f810bd20fbffff     vmovups xmm7,[rbp-0x4e0]
0x33f763679de8  1fa8  c4c17a7fbc1820010000 vmovdqu [r8+rbx*1+0x120],xmm7
0x33f763679df2  1fb2  c5f810ad70fcffff     vmovups xmm5,[rbp-0x390]
0x33f763679dfa  1fba  c4c17a7fac1830010000 vmovdqu [r8+rbx*1+0x130],xmm5
0x33f763679e04  1fc4  c5f810bd40fcffff     vmovups xmm7,[rbp-0x3c0]
0x33f763679e0c  1fcc  c4c17a7fbc1840010000 vmovdqu [r8+rbx*1+0x140],xmm7
0x33f763679e16  1fd6  c5f810ad90fdffff     vmovups xmm5,[rbp-0x270]
0x33f763679e1e  1fde  c4c17a7fac18f0010000 vmovdqu [r8+rbx*1+0x1f0],xmm5
0x33f763679e28  1fe8  c5f810bda0fdffff     vmovups xmm7,[rbp-0x260]
0x33f763679e30  1ff0  c4c17a7fbc18e0010000 vmovdqu [r8+rbx*1+0x1e0],xmm7
0x33f763679e3a  1ffa  c5f810adb0fcffff     vmovups xmm5,[rbp-0x350]
0x33f763679e42  2002  c4c17a7fac18d0010000 vmovdqu [r8+rbx*1+0x1d0],xmm5
0x33f763679e4c  200c  c4c17a7f9c18c0010000 vmovdqu [r8+rbx*1+0x1c0],xmm3
0x33f763679e56  2016  c4c17a7f9418b0010000 vmovdqu [r8+rbx*1+0x1b0],xmm2
0x33f763679e60  2020  c4c17a7f8c18a0010000 vmovdqu [r8+rbx*1+0x1a0],xmm1
0x33f763679e6a  202a  c4417a7fb41890010000 vmovdqu [r8+rbx*1+0x190],xmm14
0x33f763679e74  2034  c4c17928dd           vmovapd xmm3,xmm13
0x33f763679e79  2039  c4c17a7f9c1880010000 vmovdqu [r8+rbx*1+0x180],xmm3
0x33f763679e83  2043  c4417a7f8c1870010000 vmovdqu [r8+rbx*1+0x170],xmm9
0x33f763679e8d  204d  c4417a7f941860010000 vmovdqu [r8+rbx*1+0x160],xmm10
0x33f763679e97  2057  c4c17928d8           vmovapd xmm3,xmm8
0x33f763679e9c  205c  c4c17a7f9c1850010000 vmovdqu [r8+rbx*1+0x150],xmm3
0x33f763679ea6  2066  c5f928d8             vmovapd xmm3,xmm0
0x33f763679eaa  206a  c4c17a7f9c1810010000 vmovdqu [r8+rbx*1+0x110],xmm3
0x33f763679eb4  2074  c5f928c4             vmovapd xmm0,xmm4
0x33f763679eb8  2078  c4c17a7f8418d0000000 vmovdqu [r8+rbx*1+0xd0],xmm0
0x33f763679ec2  2082  c5f928e6             vmovapd xmm4,xmm6
0x33f763679ec6  2086  c4c17a7fa41800010000 vmovdqu [r8+rbx*1+0x100],xmm4
0x33f763679ed0  2090  c4c17a6f6c1840       vmovdqu xmm5,[r8+rbx*1+0x40]
0x33f763679ed7  2097  c4c17a6fb41880000000 vmovdqu xmm6,[r8+rbx*1+0x80]
0x33f763679ee1  20a1  c57970fe00           vpshufd xmm15,xmm6,0x0
0x33f763679ee6  20a6  c5f970fd00           vpshufd xmm7,xmm5,0x0
0x33f763679eeb  20ab  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x33f763679ef1  20b1  c4417a6f8418c0000000 vmovdqu xmm8,[r8+rbx*1+0xc0]
0x33f763679efb  20bb  c4417970f804         vpshufd xmm15,xmm8,0x4
0x33f763679f01  20c1  c5f970ff04           vpshufd xmm7,xmm7,0x4
0x33f763679f06  20c6  c4c3410eff30         vpblendw xmm7,xmm7,xmm15,0x30
0x33f763679f0c  20cc  c57970fc24           vpshufd xmm15,xmm4,0x24
0x33f763679f11  20d1  c5f970ff24           vpshufd xmm7,xmm7,0x24
0x33f763679f16  20d6  c4c3410effc0         vpblendw xmm7,xmm7,xmm15,0xc0
0x33f763679f1c  20dc  c57970fe05           vpshufd xmm15,xmm6,0x5
0x33f763679f21  20e1  c57970cd05           vpshufd xmm9,xmm5,0x5
0x33f763679f26  20e6  c443310ecf0c         vpblendw xmm9,xmm9,xmm15,0xc
0x33f763679f2c  20ec  c4417970f814         vpshufd xmm15,xmm8,0x14
0x33f763679f32  20f2  c4417970c914         vpshufd xmm9,xmm9,0x14
0x33f763679f38  20f8  c443310ecf30         vpblendw xmm9,xmm9,xmm15,0x30
0x33f763679f3e  20fe  c57970fc64           vpshufd xmm15,xmm4,0x64
0x33f763679f43  2103  c4417970c964         vpshufd xmm9,xmm9,0x64
0x33f763679f49  2109  c443310ecfc0         vpblendw xmm9,xmm9,xmm15,0xc0
0x33f763679f4f  210f  c4c14058f9           vaddps xmm7,xmm7,xmm9
0x33f763679f54  2114  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x33f763679f59  2119  c57970cd0a           vpshufd xmm9,xmm5,0xa
0x33f763679f5e  211e  c443310ecf0c         vpblendw xmm9,xmm9,xmm15,0xc
0x33f763679f64  2124  c4417970f824         vpshufd xmm15,xmm8,0x24
0x33f763679f6a  212a  c4417970c924         vpshufd xmm9,xmm9,0x24
0x33f763679f70  2130  c443310ecf30         vpblendw xmm9,xmm9,xmm15,0x30
0x33f763679f76  2136  c57970fca4           vpshufd xmm15,xmm4,0xa4
0x33f763679f7b  213b  c4417970c9a4         vpshufd xmm9,xmm9,0xa4
0x33f763679f81  2141  c443310ecfc0         vpblendw xmm9,xmm9,xmm15,0xc0
0x33f763679f87  2147  c4c14058f9           vaddps xmm7,xmm7,xmm9
0x33f763679f8c  214c  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x33f763679f91  2151  c5f970ed0f           vpshufd xmm5,xmm5,0xf
0x33f763679f96  2156  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f763679f9c  215c  c4417970f834         vpshufd xmm15,xmm8,0x34
0x33f763679fa2  2162  c5f970ed34           vpshufd xmm5,xmm5,0x34
0x33f763679fa7  2167  c4c3510eef30         vpblendw xmm5,xmm5,xmm15,0x30
0x33f763679fad  216d  c4e3510ee4c0         vpblendw xmm4,xmm5,xmm4,0xc0
0x33f763679fb3  2173  c5c058e4             vaddps xmm4,xmm7,xmm4
0x33f763679fb7  2177  c4c17a6f6c1850       vmovdqu xmm5,[r8+rbx*1+0x50]
0x33f763679fbe  217e  c4c17a6fb41890000000 vmovdqu xmm6,[r8+rbx*1+0x90]
0x33f763679fc8  2188  c57970fe00           vpshufd xmm15,xmm6,0x0
0x33f763679fcd  218d  c5f970fd00           vpshufd xmm7,xmm5,0x0
0x33f763679fd2  2192  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x33f763679fd8  2198  c57970f804           vpshufd xmm15,xmm0,0x4
0x33f763679fdd  219d  c5f970ff04           vpshufd xmm7,xmm7,0x4
0x33f763679fe2  21a2  c4c3410eff30         vpblendw xmm7,xmm7,xmm15,0x30
0x33f763679fe8  21a8  c57970fb24           vpshufd xmm15,xmm3,0x24
0x33f763679fed  21ad  c5f970ff24           vpshufd xmm7,xmm7,0x24
0x33f763679ff2  21b2  c4c3410effc0         vpblendw xmm7,xmm7,xmm15,0xc0
0x33f763679ff8  21b8  c5d858e7             vaddps xmm4,xmm4,xmm7
0x33f763679ffc  21bc  c57970fe05           vpshufd xmm15,xmm6,0x5
0x33f76367a001  21c1  c5f970fd05           vpshufd xmm7,xmm5,0x5
0x33f76367a006  21c6  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x33f76367a00c  21cc  c57970f814           vpshufd xmm15,xmm0,0x14
0x33f76367a011  21d1  c5f970ff14           vpshufd xmm7,xmm7,0x14
0x33f76367a016  21d6  c4c3410eff30         vpblendw xmm7,xmm7,xmm15,0x30
0x33f76367a01c  21dc  c57970fb64           vpshufd xmm15,xmm3,0x64
0x33f76367a021  21e1  c5f970ff64           vpshufd xmm7,xmm7,0x64
0x33f76367a026  21e6  c4c3410effc0         vpblendw xmm7,xmm7,xmm15,0xc0
0x33f76367a02c  21ec  c5d858e7             vaddps xmm4,xmm4,xmm7
0x33f76367a030  21f0  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x33f76367a035  21f5  c5f970fd0a           vpshufd xmm7,xmm5,0xa
0x33f76367a03a  21fa  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x33f76367a040  2200  c57970f824           vpshufd xmm15,xmm0,0x24
0x33f76367a045  2205  c5f970ff24           vpshufd xmm7,xmm7,0x24
0x33f76367a04a  220a  c4c3410eff30         vpblendw xmm7,xmm7,xmm15,0x30
0x33f76367a050  2210  c57970fba4           vpshufd xmm15,xmm3,0xa4
0x33f76367a055  2215  c5f970ffa4           vpshufd xmm7,xmm7,0xa4
0x33f76367a05a  221a  c4c3410effc0         vpblendw xmm7,xmm7,xmm15,0xc0
0x33f76367a060  2220  c5d858e7             vaddps xmm4,xmm4,xmm7
0x33f76367a064  2224  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x33f76367a069  2229  c5f970ed0f           vpshufd xmm5,xmm5,0xf
0x33f76367a06e  222e  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f76367a074  2234  c57970f834           vpshufd xmm15,xmm0,0x34
0x33f76367a079  2239  c5f970c534           vpshufd xmm0,xmm5,0x34
0x33f76367a07e  223e  c4c3790ec730         vpblendw xmm0,xmm0,xmm15,0x30
0x33f76367a084  2244  c4e3790ec3c0         vpblendw xmm0,xmm0,xmm3,0xc0
0x33f76367a08a  224a  c5d858c0             vaddps xmm0,xmm4,xmm0
0x33f76367a08e  224e  c4c17a6f5c1860       vmovdqu xmm3,[r8+rbx*1+0x60]
0x33f76367a095  2255  4d8d98a0000000       REX.W leaq r11,[r8+0xa0]
0x33f76367a09c  225c  c4c361221c1b01       vpinsrd xmm3,xmm3,[r11+rbx*1],0x1
0x33f76367a0a3  2263  4d8d98e0000000       REX.W leaq r11,[r8+0xe0]
0x33f76367a0aa  226a  c4c361221c1b02       vpinsrd xmm3,xmm3,[r11+rbx*1],0x2
0x33f76367a0b1  2271  4d8d9820010000       REX.W leaq r11,[r8+0x120]
0x33f76367a0b8  2278  c4c361221c1b03       vpinsrd xmm3,xmm3,[r11+rbx*1],0x3
0x33f76367a0bf  227f  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367a0c3  2283  c4c17a6f5c1864       vmovdqu xmm3,[r8+rbx*1+0x64]
0x33f76367a0ca  228a  c4c17a6fa418a4000000 vmovdqu xmm4,[r8+rbx*1+0xa4]
0x33f76367a0d4  2294  c57970fc00           vpshufd xmm15,xmm4,0x0
0x33f76367a0d9  2299  c5f970eb00           vpshufd xmm5,xmm3,0x0
0x33f76367a0de  229e  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f76367a0e4  22a4  c4c17a6fb418e4000000 vmovdqu xmm6,[r8+rbx*1+0xe4]
0x33f76367a0ee  22ae  c57970fe04           vpshufd xmm15,xmm6,0x4
0x33f76367a0f3  22b3  c5f970ed04           vpshufd xmm5,xmm5,0x4
0x33f76367a0f8  22b8  c4c3510eef30         vpblendw xmm5,xmm5,xmm15,0x30
0x33f76367a0fe  22be  c4c17a6fbc1824010000 vmovdqu xmm7,[r8+rbx*1+0x124]
0x33f76367a108  22c8  c57970ff24           vpshufd xmm15,xmm7,0x24
0x33f76367a10d  22cd  c5f970ed24           vpshufd xmm5,xmm5,0x24
0x33f76367a112  22d2  c4c3510eefc0         vpblendw xmm5,xmm5,xmm15,0xc0
0x33f76367a118  22d8  c5f858c5             vaddps xmm0,xmm0,xmm5
0x33f76367a11c  22dc  c57970fc05           vpshufd xmm15,xmm4,0x5
0x33f76367a121  22e1  c5f970eb05           vpshufd xmm5,xmm3,0x5
0x33f76367a126  22e6  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f76367a12c  22ec  c57970fe14           vpshufd xmm15,xmm6,0x14
0x33f76367a131  22f1  c5f970ed14           vpshufd xmm5,xmm5,0x14
0x33f76367a136  22f6  c4c3510eef30         vpblendw xmm5,xmm5,xmm15,0x30
0x33f76367a13c  22fc  c57970ff64           vpshufd xmm15,xmm7,0x64
0x33f76367a141  2301  c5f970ed64           vpshufd xmm5,xmm5,0x64
0x33f76367a146  2306  c4c3510eefc0         vpblendw xmm5,xmm5,xmm15,0xc0
0x33f76367a14c  230c  c5f858c5             vaddps xmm0,xmm0,xmm5
0x33f76367a150  2310  c57970fc0a           vpshufd xmm15,xmm4,0xa
0x33f76367a155  2315  c5f970eb0a           vpshufd xmm5,xmm3,0xa
0x33f76367a15a  231a  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f76367a160  2320  c57970fe24           vpshufd xmm15,xmm6,0x24
0x33f76367a165  2325  c5f970ed24           vpshufd xmm5,xmm5,0x24
0x33f76367a16a  232a  c4c3510eef30         vpblendw xmm5,xmm5,xmm15,0x30
0x33f76367a170  2330  c57970ffa4           vpshufd xmm15,xmm7,0xa4
0x33f76367a175  2335  c5f970eda4           vpshufd xmm5,xmm5,0xa4
0x33f76367a17a  233a  c4c3510eefc0         vpblendw xmm5,xmm5,xmm15,0xc0
0x33f76367a180  2340  c5f858c5             vaddps xmm0,xmm0,xmm5
0x33f76367a184  2344  c57970fc0f           vpshufd xmm15,xmm4,0xf
0x33f76367a189  2349  c5f970db0f           vpshufd xmm3,xmm3,0xf
0x33f76367a18e  234e  c4c3610edf0c         vpblendw xmm3,xmm3,xmm15,0xc
0x33f76367a194  2354  c57970fe34           vpshufd xmm15,xmm6,0x34
0x33f76367a199  2359  c5f970db34           vpshufd xmm3,xmm3,0x34
0x33f76367a19e  235e  c4c3610edf30         vpblendw xmm3,xmm3,xmm15,0x30
0x33f76367a1a4  2364  c4e3610edfc0         vpblendw xmm3,xmm3,xmm7,0xc0
0x33f76367a1aa  236a  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367a1ae  236e  4d8d5874             REX.W leaq r11,[r8+0x74]
0x33f76367a1b2  2372  c4c17b101c1b         vmovsd xmm3,[r11+rbx*1]
0x33f76367a1b8  2378  4d8d98b4000000       REX.W leaq r11,[r8+0xb4]
0x33f76367a1bf  237f  c4c17b10241b         vmovsd xmm4,[r11+rbx*1]
0x33f76367a1c5  2385  c57970fc00           vpshufd xmm15,xmm4,0x0
0x33f76367a1ca  238a  c5f970eb00           vpshufd xmm5,xmm3,0x0
0x33f76367a1cf  238f  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x33f76367a1d5  2395  c4c17a6fb418f4000000 vmovdqu xmm6,[r8+rbx*1+0xf4]
0x33f76367a1df  239f  c57970fe04           vpshufd xmm15,xmm6,0x4
0x33f76367a1e4  23a4  c5f970ed04           vpshufd xmm5,xmm5,0x4
0x33f76367a1e9  23a9  c4c3510eef30         vpblendw xmm5,xmm5,xmm15,0x30
0x33f76367a1ef  23af  c4c17a6fbc1834010000 vmovdqu xmm7,[r8+rbx*1+0x134]
0x33f76367a1f9  23b9  c57970ff24           vpshufd xmm15,xmm7,0x24
0x33f76367a1fe  23be  c5f970ed24           vpshufd xmm5,xmm5,0x24
0x33f76367a203  23c3  c4c3510eefc0         vpblendw xmm5,xmm5,xmm15,0xc0
0x33f76367a209  23c9  c5f858c5             vaddps xmm0,xmm0,xmm5
0x33f76367a20d  23cd  c57970fc05           vpshufd xmm15,xmm4,0x5
0x33f76367a212  23d2  c5f970db05           vpshufd xmm3,xmm3,0x5
0x33f76367a217  23d7  c4c3610edf0c         vpblendw xmm3,xmm3,xmm15,0xc
0x33f76367a21d  23dd  c57970fe14           vpshufd xmm15,xmm6,0x14
0x33f76367a222  23e2  c5f970db14           vpshufd xmm3,xmm3,0x14
0x33f76367a227  23e7  c4c3610edf30         vpblendw xmm3,xmm3,xmm15,0x30
0x33f76367a22d  23ed  c57970ff64           vpshufd xmm15,xmm7,0x64
0x33f76367a232  23f2  c5f970db64           vpshufd xmm3,xmm3,0x64
0x33f76367a237  23f7  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x33f76367a23d  23fd  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367a241  2401  c4c17a6f5c187c       vmovdqu xmm3,[r8+rbx*1+0x7c]
0x33f76367a248  2408  4d8d98bc000000       REX.W leaq r11,[r8+0xbc]
0x33f76367a24f  240f  c4c361221c1b01       vpinsrd xmm3,xmm3,[r11+rbx*1],0x1
0x33f76367a256  2416  4d8d98fc000000       REX.W leaq r11,[r8+0xfc]
0x33f76367a25d  241d  c4c361221c1b02       vpinsrd xmm3,xmm3,[r11+rbx*1],0x2
0x33f76367a264  2424  c57970ffa4           vpshufd xmm15,xmm7,0xa4
0x33f76367a269  2429  c5f970dba4           vpshufd xmm3,xmm3,0xa4
0x33f76367a26e  242e  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x33f76367a274  2434  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367a278  2438  c4c17a6f5c1810       vmovdqu xmm3,[r8+rbx*1+0x10]
0x33f76367a27f  243f  c5f858c3             vaddps xmm0,xmm0,xmm3
0x33f76367a283  2443  c4c17a7f441810       vmovdqu [r8+rbx*1+0x10],xmm0
0x33f76367a28a  244a  c4c17a109c1840010000 vmovss xmm3,[r8+rbx*1+0x140]
0x33f76367a294  2454  c4c162589c1844010000 vaddss xmm3,xmm3,[r8+rbx*1+0x144]
0x33f76367a29e  245e  c4c162589c1848010000 vaddss xmm3,xmm3,[r8+rbx*1+0x148]
0x33f76367a2a8  2468  c4c162589c184c010000 vaddss xmm3,xmm3,[r8+rbx*1+0x14c]
0x33f76367a2b2  2472  c4c162589c1850010000 vaddss xmm3,xmm3,[r8+rbx*1+0x150]
0x33f76367a2bc  247c  c4c162589c1854010000 vaddss xmm3,xmm3,[r8+rbx*1+0x154]
0x33f76367a2c6  2486  c4c162589c1858010000 vaddss xmm3,xmm3,[r8+rbx*1+0x158]
0x33f76367a2d0  2490  c4c162589c185c010000 vaddss xmm3,xmm3,[r8+rbx*1+0x15c]
0x33f76367a2da  249a  c4c162589c1860010000 vaddss xmm3,xmm3,[r8+rbx*1+0x160]
0x33f76367a2e4  24a4  c4c162589c1864010000 vaddss xmm3,xmm3,[r8+rbx*1+0x164]
0x33f76367a2ee  24ae  c4c162589c1868010000 vaddss xmm3,xmm3,[r8+rbx*1+0x168]
0x33f76367a2f8  24b8  c4c162589c186c010000 vaddss xmm3,xmm3,[r8+rbx*1+0x16c]
0x33f76367a302  24c2  c4c162589c1870010000 vaddss xmm3,xmm3,[r8+rbx*1+0x170]
0x33f76367a30c  24cc  c4c162589c1874010000 vaddss xmm3,xmm3,[r8+rbx*1+0x174]
0x33f76367a316  24d6  c4c162589c1878010000 vaddss xmm3,xmm3,[r8+rbx*1+0x178]
0x33f76367a320  24e0  c4c162589c187c010000 vaddss xmm3,xmm3,[r8+rbx*1+0x17c]
0x33f76367a32a  24ea  c4c162585c1820       vaddss xmm3,xmm3,[r8+rbx*1+0x20]
0x33f76367a331  24f1  c4c17a115c1820       vmovss [r8+rbx*1+0x20],xmm3
0x33f76367a338  24f8  c4c17a10a41880010000 vmovss xmm4,[r8+rbx*1+0x180]
0x33f76367a342  2502  c4c15a58a41884010000 vaddss xmm4,xmm4,[r8+rbx*1+0x184]
0x33f76367a34c  250c  c4c15a58a41888010000 vaddss xmm4,xmm4,[r8+rbx*1+0x188]
0x33f76367a356  2516  c4c15a58a4188c010000 vaddss xmm4,xmm4,[r8+rbx*1+0x18c]
0x33f76367a360  2520  c4c15a58a41890010000 vaddss xmm4,xmm4,[r8+rbx*1+0x190]
0x33f76367a36a  252a  c4c15a58a41894010000 vaddss xmm4,xmm4,[r8+rbx*1+0x194]
0x33f76367a374  2534  c4c15a58a41898010000 vaddss xmm4,xmm4,[r8+rbx*1+0x198]
0x33f76367a37e  253e  c4c15a58a4189c010000 vaddss xmm4,xmm4,[r8+rbx*1+0x19c]
0x33f76367a388  2548  c4c15a58a418a0010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1a0]
0x33f76367a392  2552  c4c15a58a418a4010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1a4]
0x33f76367a39c  255c  c4c15a58a418a8010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1a8]
0x33f76367a3a6  2566  c4c15a58a418ac010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1ac]
0x33f76367a3b0  2570  c4c15a58a418b0010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1b0]
0x33f76367a3ba  257a  c4c15a58a418b4010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1b4]
0x33f76367a3c4  2584  c4c15a58a418b8010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1b8]
0x33f76367a3ce  258e  c4c15a58a418bc010000 vaddss xmm4,xmm4,[r8+rbx*1+0x1bc]
0x33f76367a3d8  2598  c4c15a58641824       vaddss xmm4,xmm4,[r8+rbx*1+0x24]
0x33f76367a3df  259f  c4c17a11641824       vmovss [r8+rbx*1+0x24],xmm4
0x33f76367a3e6  25a6  c4c17a10ac18c0010000 vmovss xmm5,[r8+rbx*1+0x1c0]
0x33f76367a3f0  25b0  c4c15258ac18c4010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1c4]
0x33f76367a3fa  25ba  c4c15258ac18c8010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1c8]
0x33f76367a404  25c4  c4c15258ac18cc010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1cc]
0x33f76367a40e  25ce  c4c15258ac18d0010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1d0]
0x33f76367a418  25d8  c4c15258ac18d4010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1d4]
0x33f76367a422  25e2  c4c15258ac18d8010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1d8]
0x33f76367a42c  25ec  c4c15258ac18dc010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1dc]
0x33f76367a436  25f6  c4c15258ac18e0010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1e0]
0x33f76367a440  2600  c4c15258ac18e4010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1e4]
0x33f76367a44a  260a  c4c15258ac18e8010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1e8]
0x33f76367a454  2614  c4c15258ac18ec010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1ec]
0x33f76367a45e  261e  c4c15258ac18f0010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1f0]
0x33f76367a468  2628  c4c15258ac18f4010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1f4]
0x33f76367a472  2632  c4c15258ac18f8010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1f8]
0x33f76367a47c  263c  c4c15258ac18fc010000 vaddss xmm5,xmm5,[r8+rbx*1+0x1fc]
0x33f76367a486  2646  c4c152586c1828       vaddss xmm5,xmm5,[r8+rbx*1+0x28]
0x33f76367a48d  264d  c4c17a116c1828       vmovss [r8+rbx*1+0x28],xmm5
0x33f76367a494  2654  448b9d68ffffff       movl r11,[rbp-0x98]
0x33f76367a49b  265b  4183e30f             andl r11,0xf
0x33f76367a49f  265f  458bf7               movl r14,r15
0x33f76367a4a2  2662  8b85c8feffff         movl rax,[rbp-0x138]
0x33f76367a4a8  2668  413bc7               cmpl rax,r15
0x33f76367a4ab  266b  440f42f0             cmovcl r14,rax
0x33f76367a4af  266f  458bfe               movl r15,r14
0x33f76367a4b2  2672  8bb550ffffff         movl rsi,[rbp-0xb0]
0x33f76367a4b8  2678  413bf6               cmpl rsi,r14
0x33f76367a4bb  267b  440f42fe             cmovcl r15,rsi
0x33f76367a4bf  267f  458bf7               movl r14,r15
0x33f76367a4c2  2682  453bdf               cmpl r11,r15
0x33f76367a4c5  2685  450f42f3             cmovcl r14,r11
0x33f76367a4c9  2689  4585f6               testl r14,r14
0x33f76367a4cc  268c  0f8439010000         jz 0x33f76367a60b  <+0x27cb>
0x33f76367a4d2  2692  448bbd58ffffff       movl r15,[rbp-0xa8]
0x33f76367a4d9  2699  4181e7f0ffff1f       andl r15,0x1ffffff0
0x33f76367a4e0  26a0  448b9d60ffffff       movl r11,[rbp-0xa0]
0x33f76367a4e7  26a7  478d1cbb             leal r11,[r11+r15*4]
0x33f76367a4eb  26ab  448bbd68ffffff       movl r15,[rbp-0x98]
0x33f76367a4f2  26b2  4181e7f0ffff1f       andl r15,0x1ffffff0
0x33f76367a4f9  26b9  428d3cbf             leal rdi,[rdi+r15*4]
0x33f76367a4fd  26bd  c4c17a6f741810       vmovdqu xmm6,[r8+rbx*1+0x10]
0x33f76367a504  26c4  c57b108d18ffffff     vmovsd xmm9,[rbp-0xe8]
0x33f76367a50c  26cc  c57b109540ffffff     vmovsd xmm10,[rbp-0xc0]
0x33f76367a514  26d4  c4411057ed           vxorps xmm13,xmm13,xmm13
0x33f76367a519  26d9  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x33f76367a51e  26de  c4c10972f619         vpslld xmm14,xmm14,25
0x33f76367a524  26e4  c4c10972d602         vpsrld xmm14,xmm14,2
0x33f76367a52a  26ea  418bc3               movl rax,r11
0x33f76367a52d  26ed  448bbdb8feffff       movl r15,[rbp-0x148]
0x33f76367a534  26f4  448b9d00ffffff       movl r11,[rbp-0x100]
0x33f76367a53b  26fb  0f1f440000           nop
0x33f76367a540  2700  c57b108510ffffff     vmovsd xmm8,[rbp-0xf0]
0x33f76367a548  2708  c5fb10bd08ffffff     vmovsd xmm7,[rbp-0xf8]
0x33f76367a550  2710  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x33f76367a554  2714  0f86f8040000         jna 0x33f76367aa52  <+0x2c12>
0x33f76367a55a  271a  c4c17a100c00         vmovss xmm1,[r8+rax*1]
0x33f76367a560  2720  c5c25cd1             vsubss xmm2,xmm7,xmm1
0x33f76367a564  2724  c5ea59fa             vmulss xmm7,xmm2,xmm2
0x33f76367a568  2728  c4017a101c38         vmovss xmm11,[r8+r15*1]
0x33f76367a56e  272e  c4413a5ce3           vsubss xmm12,xmm8,xmm11
0x33f76367a573  2733  c4411a59c4           vmulss xmm8,xmm12,xmm12
0x33f76367a578  2738  c5ba58ff             vaddss xmm7,xmm8,xmm7
0x33f76367a57c  273c  c5782ecf             vucomiss xmm9,xmm7
0x33f76367a580  2740  0f8749000000         ja 0x33f76367a5cf  <+0x278f>
0x33f76367a586  2746  c5782ed7             vucomiss xmm10,xmm7
0x33f76367a58a  274a  0f8647000000         jna 0x33f76367a5d7  <+0x2797>
0x33f76367a590  2750  c4c1782efd           vucomiss xmm7,xmm13
0x33f76367a595  2755  0f863c000000         jna 0x33f76367a5d7  <+0x2797>
0x33f76367a59b  275b  c58a58db             vaddss xmm3,xmm14,xmm3
0x33f76367a59f  275f  c4e27918f1           vbroadcastss xmm6,xmm1
0x33f76367a5a4  2764  c4c34921f310         vinsertps xmm6,xmm6,xmm11,0x10
0x33f76367a5aa  276a  c4817a103c18         vmovss xmm7,[r8+r11*1]
0x33f76367a5b0  2770  c4e34921f720         vinsertps xmm6,xmm6,xmm7,0x20
0x33f76367a5b6  2776  c4c17a103c38         vmovss xmm7,[r8+rdi*1]
0x33f76367a5bc  277c  c4e34921f730         vinsertps xmm6,xmm6,xmm7,0x30
0x33f76367a5c2  2782  c5f858f6             vaddps xmm6,xmm0,xmm6
0x33f76367a5c6  2786  c5f928c6             vmovapd xmm0,xmm6
0x33f76367a5ca  278a  e908000000           jmp 0x33f76367a5d7  <+0x2797>
0x33f76367a5cf  278f  c59a58ed             vaddss xmm5,xmm12,xmm5
0x33f76367a5d3  2793  c5ea58e4             vaddss xmm4,xmm2,xmm4
0x33f76367a5d7  2797  83c004               addl rax,0x4
0x33f76367a5da  279a  4183c704             addl r15,0x4
0x33f76367a5de  279e  4183c304             addl r11,0x4
0x33f76367a5e2  27a2  83c704               addl rdi,0x4
0x33f76367a5e5  27a5  4183c6ff             addl r14,0xff
0x33f76367a5e9  27a9  0f8551ffffff         jnz 0x33f76367a540  <+0x2700>
0x33f76367a5ef  27af  c4c17a116c1828       vmovss [r8+rbx*1+0x28],xmm5
0x33f76367a5f6  27b6  c4c17a11641824       vmovss [r8+rbx*1+0x24],xmm4
0x33f76367a5fd  27bd  c4c17a115c1820       vmovss [r8+rbx*1+0x20],xmm3
0x33f76367a604  27c4  c4c17a7f741810       vmovdqu [r8+rbx*1+0x10],xmm6
0x33f76367a60b  27cb  8b4580               movl rax,[rbp-0x80]
0x33f76367a60e  27ce  8d7801               leal rdi,[rax+0x1]
0x33f76367a611  27d1  448b9d78ffffff       movl r11,[rbp-0x88]
0x33f76367a618  27d8  443bd8               cmpl r11,rax
0x33f76367a61b  27db  0f859fe3ffff         jnz 0x33f7636789c0  <+0xb80>
0x33f76367a621  27e1  e906000000           jmp 0x33f76367a62c  <+0x27ec>
0x33f76367a626  27e6  8b5de0               movl rbx,[rbp-0x20]
0x33f76367a629  27e9  4c8bc7               REX.W movq r8,rdi
0x33f76367a62c  27ec  8d4340               leal rax,[rbx+0x40]
0x33f76367a62f  27ef  8d7b30               leal rdi,[rbx+0x30]
0x33f76367a632  27f2  448d4b10             leal r9,[rbx+0x10]
0x33f76367a636  27f6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367a63a  27fa  8bcf                 movl rcx,rdi
0x33f76367a63c  27fc  8b5598               movl rdx,[rbp-0x68]
0x33f76367a63f  27ff  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0x33f76367a644  2804  c5fb105588           vmovsd xmm2,[rbp-0x78]
0x33f76367a649  2809  e8fa36f2ff           call 0x33f76359dd48  (jump table)
0x33f76367a64e  280e  8b7da0               movl rdi,[rbp-0x60]
0x33f76367a651  2811  3b7dd0               cmpl rdi,[rbp-0x30]
0x33f76367a654  2814  0f868a000000         jna 0x33f76367a6e4  <+0x28a4>
0x33f76367a65a  281a  8b55d0               movl rdx,[rbp-0x30]
0x33f76367a65d  281d  448b45a8             movl r8,[rbp-0x58]
0x33f76367a661  2821  458d1c90             leal r11,[r8+rdx*4]
0x33f76367a665  2825  448b65e0             movl r12,[rbp-0x20]
0x33f76367a669  2829  4c8b7dc8             REX.W movq r15,[rbp-0x38]
0x33f76367a66d  282d  c4817a10442740       vmovss xmm0,[r15+r12*1+0x40]
0x33f76367a674  2834  c4817a11041f         vmovss [r15+r11*1],xmm0
0x33f76367a67a  283a  448b5db0             movl r11,[rbp-0x50]
0x33f76367a67e  283e  458d3493             leal r14,[r11+rdx*4]
0x33f76367a682  2842  c4817a10442744       vmovss xmm0,[r15+r12*1+0x44]
0x33f76367a689  2849  c4817a110437         vmovss [r15+r14*1],xmm0
0x33f76367a68f  284f  448b75b8             movl r14,[rbp-0x48]
0x33f76367a693  2853  418d0496             leal rax,[r14+rdx*4]
0x33f76367a697  2857  c4817a10442748       vmovss xmm0,[r15+r12*1+0x48]
0x33f76367a69e  285e  c4c17a110407         vmovss [r15+rax*1],xmm0
0x33f76367a6a4  2864  8b45c0               movl rax,[rbp-0x40]
0x33f76367a6a7  2867  8d1c90               leal rbx,[rax+rdx*4]
0x33f76367a6aa  286a  c4817a1044274c       vmovss xmm0,[r15+r12*1+0x4c]
0x33f76367a6b1  2871  c4c17a11041f         vmovss [r15+rbx*1],xmm0
0x33f76367a6b7  2877  498bff               REX.W movq rdi,r15
0x33f76367a6ba  287a  c5c857f6             vxorps xmm6,xmm6,xmm6
0x33f76367a6be  287e  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367a6c6  2886  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f76367a6ce  288e  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f76367a6d6  2896  33c9                 xorl rcx,rcx
0x33f76367a6d8  2898  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a6df  289f  e92c000000           jmp 0x33f76367a710  <+0x28d0>
0x33f76367a6e4  28a4  8b55d0               movl rdx,[rbp-0x30]
0x33f76367a6e7  28a7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a6eb  28ab  c5c857f6             vxorps xmm6,xmm6,xmm6
0x33f76367a6ef  28af  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367a6f7  28b7  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f76367a6ff  28bf  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f76367a707  28c7  33c9                 xorl rcx,rcx
0x33f76367a709  28c9  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a710  28d0  83c201               addl rdx,0x1
0x33f76367a713  28d3  448b5dd8             movl r11,[rbp-0x28]
0x33f76367a717  28d7  443bda               cmpl r11,rdx
0x33f76367a71a  28da  0f8560dfffff         jnz 0x33f763678680  <+0x840>
0x33f76367a720  28e0  8b7de0               movl rdi,[rbp-0x20]
0x33f76367a723  28e3  81c700020000         addl rdi,0x200
0x33f76367a729  28e9  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x33f76367a72d  28ed  418938               movl [r8],rdi
0x33f76367a730  28f0  488be5               REX.W movq rsp,rbp
0x33f76367a733  28f3  5d                   pop rbp
0x33f76367a734  28f4  c3                   retl
0x33f76367a735  28f5  e8963df2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a73a  28fa  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a73e  28fe  488b75f0             REX.W movq rsi,[rbp-0x10]
0x33f76367a742  2902  8b45d8               movl rax,[rbp-0x28]
0x33f76367a745  2905  e91ad7ffff           jmp 0x33f763677e64  <+0x24>
0x33f76367a74a  290a  c5f92eff             vucomisd xmm7,xmm7
0x33f76367a74e  290e  0f8b0b000000         jpo 0x33f76367a75f  <+0x291f>
0x33f76367a754  2914  4533ff               xorl r15,r15
0x33f76367a757  2917  4d8be7               REX.W movq r12,r15
0x33f76367a75a  291a  e97dd8ffff           jmp 0x33f763677fdc  <+0x19c>
0x33f76367a75f  291f  c5c057ff             vxorps xmm7,xmm7,xmm7
0x33f76367a763  2923  c5f82efe             vucomiss xmm7,xmm6
0x33f76367a767  2927  0f870b000000         ja 0x33f76367a778  <+0x2938>
0x33f76367a76d  292d  41bcffffffff         movl r12,0xffffffff
0x33f76367a773  2933  e964d8ffff           jmp 0x33f763677fdc  <+0x19c>
0x33f76367a778  2938  4531e4               xorl r12,r12
0x33f76367a77b  293b  e95cd8ffff           jmp 0x33f763677fdc  <+0x19c>
0x33f76367a780  2940  c441792ec0           vucomisd xmm8,xmm8
0x33f76367a785  2945  0f8b08000000         jpo 0x33f76367a793  <+0x2953>
0x33f76367a78b  294b  4531e4               xorl r12,r12
0x33f76367a78e  294e  e9b0d8ffff           jmp 0x33f763678043  <+0x203>
0x33f76367a793  2953  c4413857c0           vxorps xmm8,xmm8,xmm8
0x33f76367a798  2958  c5782ec7             vucomiss xmm8,xmm7
0x33f76367a79c  295c  77ed                 ja 0x33f76367a78b  <+0x294b>
0x33f76367a79e  295e  41bcffffffff         movl r12,0xffffffff
0x33f76367a7a4  2964  e99ad8ffff           jmp 0x33f763678043  <+0x203>
0x33f76367a7a9  2969  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f76367a7b1  2971  488975a8             REX.W movq [rbp-0x58],rsi
0x33f76367a7b5  2975  48894da0             REX.W movq [rbp-0x60],rcx
0x33f76367a7b9  2979  e8123df2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a7be  297e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a7c2  2982  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a7c9  2989  448b5dd8             movl r11,[rbp-0x28]
0x33f76367a7cd  298d  8b4da0               movl rcx,[rbp-0x60]
0x33f76367a7d0  2990  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367a7d8  2998  8b5db0               movl rbx,[rbp-0x50]
0x33f76367a7db  299b  8b45b8               movl rax,[rbp-0x48]
0x33f76367a7de  299e  448b75c0             movl r14,[rbp-0x40]
0x33f76367a7e2  29a2  8b75a8               movl rsi,[rbp-0x58]
0x33f76367a7e5  29a5  e9a0d9ffff           jmp 0x33f76367818a  <+0x34a>
0x33f76367a7ea  29aa  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f76367a7f2  29b2  4c8975b8             REX.W movq [rbp-0x48],r14
0x33f76367a7f6  29b6  488955c0             REX.W movq [rbp-0x40],rdx
0x33f76367a7fa  29ba  e8d13cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a7ff  29bf  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a803  29c3  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a80a  29ca  448b5dd8             movl r11,[rbp-0x28]
0x33f76367a80e  29ce  8b55c0               movl rdx,[rbp-0x40]
0x33f76367a811  29d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367a819  29d9  8b45a0               movl rax,[rbp-0x60]
0x33f76367a81c  29dc  448b7da8             movl r15,[rbp-0x58]
0x33f76367a820  29e0  448b65b0             movl r12,[rbp-0x50]
0x33f76367a824  29e4  448b75b8             movl r14,[rbp-0x48]
0x33f76367a828  29e8  e95ddaffff           jmp 0x33f76367828a  <+0x44a>
0x33f76367a82d  29ed  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f76367a835  29f5  4c8975a8             REX.W movq [rbp-0x58],r14
0x33f76367a839  29f9  488955c0             REX.W movq [rbp-0x40],rdx
0x33f76367a83d  29fd  e88e3cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a842  2a02  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a846  2a06  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a84d  2a0d  448b5dd8             movl r11,[rbp-0x28]
0x33f76367a851  2a11  8b55c0               movl rdx,[rbp-0x40]
0x33f76367a854  2a14  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367a85c  2a1c  8b45b8               movl rax,[rbp-0x48]
0x33f76367a85f  2a1f  448bbd68ffffff       movl r15,[rbp-0x98]
0x33f76367a866  2a26  448b65a0             movl r12,[rbp-0x60]
0x33f76367a86a  2a2a  448b75a8             movl r14,[rbp-0x58]
0x33f76367a86e  2a2e  e917dbffff           jmp 0x33f76367838a  <+0x54a>
0x33f76367a873  2a33  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x33f76367a87b  2a3b  4c895d80             REX.W movq [rbp-0x80],r11
0x33f76367a87f  2a3f  488955c0             REX.W movq [rbp-0x40],rdx
0x33f76367a883  2a43  e8483cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a888  2a48  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a88c  2a4c  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a893  2a53  8b55c0               movl rdx,[rbp-0x40]
0x33f76367a896  2a56  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x33f76367a89e  2a5e  8b45d8               movl rax,[rbp-0x28]
0x33f76367a8a1  2a61  448b7db8             movl r15,[rbp-0x48]
0x33f76367a8a5  2a65  448b65b0             movl r12,[rbp-0x50]
0x33f76367a8a9  2a69  448b5d80             movl r11,[rbp-0x80]
0x33f76367a8ad  2a6d  e9d8dbffff           jmp 0x33f76367848a  <+0x64a>
0x33f76367a8b2  2a72  488955d0             REX.W movq [rbp-0x30],rdx
0x33f76367a8b6  2a76  e8153cf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a8bb  2a7b  8b55d0               movl rdx,[rbp-0x30]
0x33f76367a8be  2a7e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a8c2  2a82  c5c857f6             vxorps xmm6,xmm6,xmm6
0x33f76367a8c6  2a86  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367a8ce  2a8e  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f76367a8d6  2a96  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f76367a8de  2a9e  33c9                 xorl rcx,rcx
0x33f76367a8e0  2aa0  4c8b85f8feffff       REX.W movq r8,[rbp-0x108]
0x33f76367a8e7  2aa7  e99eddffff           jmp 0x33f76367868a  <+0x84a>
0x33f76367a8ec  2aac  c441792eed           vucomisd xmm13,xmm13
0x33f76367a8f1  2ab1  0f8b08000000         jpo 0x33f76367a8ff  <+0x2abf>
0x33f76367a8f7  2ab7  488bd1               REX.W movq rdx,rcx
0x33f76367a8fa  2aba  e91cdfffff           jmp 0x33f76367881b  <+0x9db>
0x33f76367a8ff  2abf  c4c1782ef4           vucomiss xmm6,xmm12
0x33f76367a904  2ac4  77f1                 ja 0x33f76367a8f7  <+0x2ab7>
0x33f76367a906  2ac6  baffffffff           movl rdx,0xffffffff
0x33f76367a90b  2acb  e90bdfffff           jmp 0x33f76367881b  <+0x9db>
0x33f76367a910  2ad0  c441792ee4           vucomisd xmm12,xmm12
0x33f76367a915  2ad5  0f8b08000000         jpo 0x33f76367a923  <+0x2ae3>
0x33f76367a91b  2adb  488bd9               REX.W movq rbx,rcx
0x33f76367a91e  2ade  e9d9dfffff           jmp 0x33f7636788fc  <+0xabc>
0x33f76367a923  2ae3  c4c1782ef3           vucomiss xmm6,xmm11
0x33f76367a928  2ae8  77f1                 ja 0x33f76367a91b  <+0x2adb>
0x33f76367a92a  2aea  bbffffffff           movl rbx,0xffffffff
0x33f76367a92f  2aef  e9c8dfffff           jmp 0x33f7636788fc  <+0xabc>
0x33f76367a934  2af4  e8973bf2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a939  2af9  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x33f76367a93d  2afd  8b4580               movl rax,[rbp-0x80]
0x33f76367a940  2b00  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367a948  2b08  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f76367a950  2b10  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f76367a958  2b18  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f76367a960  2b20  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f76367a968  2b28  448ba528fdffff       movl r12,[rbp-0x2d8]
0x33f76367a96f  2b2f  8bb510fdffff         movl rsi,[rbp-0x2f0]
0x33f76367a975  2b35  448bbd00fdffff       movl r15,[rbp-0x300]
0x33f76367a97c  2b3c  33c9                 xorl rcx,rcx
0x33f76367a97e  2b3e  448b85d0feffff       movl r8,[rbp-0x130]
0x33f76367a985  2b45  8b9dd8feffff         movl rbx,[rbp-0x128]
0x33f76367a98b  2b4b  8b95e0feffff         movl rdx,[rbp-0x120]
0x33f76367a991  2b51  448bb580fcffff       movl r14,[rbp-0x380]
0x33f76367a998  2b58  448b9de8feffff       movl r11,[rbp-0x118]
0x33f76367a99f  2b5f  e988e0ffff           jmp 0x33f763678a2c  <+0xbec>
0x33f76367a9a4  2b64  4889bd70ffffff       REX.W movq [rbp-0x90],rdi
0x33f76367a9ab  2b6b  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x33f76367a9b2  2b72  488985b0feffff       REX.W movq [rbp-0x150],rax
0x33f76367a9b9  2b79  48899de8fcffff       REX.W movq [rbp-0x318],rbx
0x33f76367a9c0  2b80  4c899de0fcffff       REX.W movq [rbp-0x320],r11
0x33f76367a9c7  2b87  4c89a560fcffff       REX.W movq [rbp-0x3a0],r12
0x33f76367a9ce  2b8e  c57811ad30feffff     vmovups [rbp-0x1d0],xmm13
0x33f76367a9d6  2b96  4c89b568fcffff       REX.W movq [rbp-0x398],r14
0x33f76367a9dd  2b9d  e8ee3af2ff           call 0x33f76359e4d0  (jump table)
0x33f76367a9e2  2ba2  488b55c8             REX.W movq rdx,[rbp-0x38]
0x33f76367a9e6  2ba6  8bbd70ffffff         movl rdi,[rbp-0x90]
0x33f76367a9ec  2bac  448b8560ffffff       movl r8,[rbp-0xa0]
0x33f76367a9f3  2bb3  448bbd48ffffff       movl r15,[rbp-0xb8]
0x33f76367a9fa  2bba  c5f810bdd0fdffff     vmovups xmm7,[rbp-0x230]
0x33f76367aa02  2bc2  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x33f76367aa0a  2bca  c5f810adb0fdffff     vmovups xmm5,[rbp-0x250]
0x33f76367aa12  2bd2  c57810a540fdffff     vmovups xmm12,[rbp-0x2c0]
0x33f76367aa1a  2bda  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x33f76367aa22  2be2  8b85b0feffff         movl rax,[rbp-0x150]
0x33f76367aa28  2be8  33c9                 xorl rcx,rcx
0x33f76367aa2a  2bea  8b9de8fcffff         movl rbx,[rbp-0x318]
0x33f76367aa30  2bf0  448b9de0fcffff       movl r11,[rbp-0x320]
0x33f76367aa37  2bf7  448ba560fcffff       movl r12,[rbp-0x3a0]
0x33f76367aa3e  2bfe  c57810ad30feffff     vmovups xmm13,[rbp-0x1d0]
0x33f76367aa46  2c06  448bb568fcffff       movl r14,[rbp-0x398]
0x33f76367aa4d  2c0d  e93fe4ffff           jmp 0x33f763678e91  <+0x1051>
0x33f76367aa52  2c12  4c89b570ffffff       REX.W movq [rbp-0x90],r14
0x33f76367aa59  2c19  4889bd68ffffff       REX.W movq [rbp-0x98],rdi
0x33f76367aa60  2c20  4c899d00ffffff       REX.W movq [rbp-0x100],r11
0x33f76367aa67  2c27  4c89bdb8feffff       REX.W movq [rbp-0x148],r15
0x33f76367aa6e  2c2e  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x33f76367aa75  2c35  c5fb11ad58ffffff     vmovsd [rbp-0xa8],xmm5
0x33f76367aa7d  2c3d  c5fb11a550ffffff     vmovsd [rbp-0xb0],xmm4
0x33f76367aa85  2c45  c5fb119d48ffffff     vmovsd [rbp-0xb8],xmm3
0x33f76367aa8d  2c4d  c5f811b530ffffff     vmovups [rbp-0xd0],xmm6
0x33f76367aa95  2c55  c5f8118520ffffff     vmovups [rbp-0xe0],xmm0
0x33f76367aa9d  2c5d  e82e3af2ff           call 0x33f76359e4d0  (jump table)
0x33f76367aaa2  2c62  8b5de0               movl rbx,[rbp-0x20]
0x33f76367aaa5  2c65  4c8b45c8             REX.W movq r8,[rbp-0x38]
0x33f76367aaa9  2c69  448bb570ffffff       movl r14,[rbp-0x90]
0x33f76367aab0  2c70  8bbd68ffffff         movl rdi,[rbp-0x98]
0x33f76367aab6  2c76  448b9d00ffffff       movl r11,[rbp-0x100]
0x33f76367aabd  2c7d  448bbdb8feffff       movl r15,[rbp-0x148]
0x33f76367aac4  2c84  8b8560ffffff         movl rax,[rbp-0xa0]
0x33f76367aaca  2c8a  c5fb10ad58ffffff     vmovsd xmm5,[rbp-0xa8]
0x33f76367aad2  2c92  c5fb10a550ffffff     vmovsd xmm4,[rbp-0xb0]
0x33f76367aada  2c9a  c5fb109d48ffffff     vmovsd xmm3,[rbp-0xb8]
0x33f76367aae2  2ca2  c5f810b530ffffff     vmovups xmm6,[rbp-0xd0]
0x33f76367aaea  2caa  c5f8108520ffffff     vmovups xmm0,[rbp-0xe0]
0x33f76367aaf2  2cb2  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x33f76367aaf7  2cb7  c4c10972f619         vpslld xmm14,xmm14,25
0x33f76367aafd  2cbd  c4c10972d602         vpsrld xmm14,xmm14,2
0x33f76367ab03  2cc3  c4411057ed           vxorps xmm13,xmm13,xmm13
0x33f76367ab08  2cc8  c57b109540ffffff     vmovsd xmm10,[rbp-0xc0]
0x33f76367ab10  2cd0  c57b108d18ffffff     vmovsd xmm9,[rbp-0xe8]
0x33f76367ab18  2cd8  c57b108510ffffff     vmovsd xmm8,[rbp-0xf0]
0x33f76367ab20  2ce0  c5fb10bd08ffffff     vmovsd xmm7,[rbp-0xf8]
0x33f76367ab28  2ce8  448ba500fdffff       movl r12,[rbp-0x300]
0x33f76367ab2f  2cef  33c9                 xorl rcx,rcx
0x33f76367ab31  2cf1  e924faffff           jmp 0x33f76367a55a  <+0x271a>
0x33f76367ab36  2cf6  90                   nop
0x33f76367ab37  2cf7  90                   nop

Protected instructions:
 pc offset
        3f         
        60         
       11b         
       25d         
       263         
       26b         
       270         
       278         
       281         
       286         
       28b         
       290         
       2bb         
       2cf         
       2d4         
       2e0         
       2e5         
       356         
       366         
       396         
       3ea         
       3ef         
       3f8         
       406         
       40f         
       414         
       457         
       468         
       495         
       4e3         
       4e8         
       4f0         
       4fc         
       505         
       50a         
       557         
       568         
       595         
       5e6         
       5eb         
       5f3         
       5ff         
       608         
       60d         
       657         
       668         
       699         
       6e4         
       6e9         
       6f1         
       6fe         
       703         
       70a         
       710         
       717         
       71d         
       724         
       72b         
       732         
       739         
       73e         
       743         
       74a         
       751         
       756         
       75b         
       783         
       788         
       78d         
       792         
       7c2         
       7d5         
       7da         
       7df         
       7e4         
       84a         
       85e         
       873         
       888         
       89d         
       8a6         
       8ac         
       8b5         
       8ba         
       8c2         
       8c7         
       8db         
       8e4         
       8ea         
       8f0         
       8f6         
       8fb         
       909         
       90f         
       919         
       921         
       a20         
       b09         
       b0e         
       c13         
       c1a         
      1055         
      1067         
      10b1         
      10d3         
      1137         
      115a         
      11c0         
      11e3         
      123c         
      1260         
      12a5         
      12c0         
      1302         
      131d         
      137a         
      139d         
      1686         
      1694         
      16a3         
      16b2         
      16cb         
      16d1         
      16e0         
      16e7         
      1701         
      170e         
      171c         
      172d         
      1732         
      1738         
      173e         
      17e5         
      1839         
      190b         
      19dc         
      1a94         
      1ab5         
      1ad0         
      1aeb         
      1b05         
      1b67         
      1bbe         
      1c12         
      1c5c         
      1c7e         
      1c9f         
      1cc2         
      1ce4         
      1d06         
      1d28         
      1d4b         
      1d6d         
      1d8e         
      1db0         
      1dd3         
      1ded         
      1e0e         
      1e2c         
      1e4c         
      1e6a         
      1eee         
      1f00         
      1f12         
      1f24         
      1f36         
      1f48         
      1f5a         
      1f69         
      1f78         
      1f87         
      1f96         
      1fa8         
      1fba         
      1fcc         
      1fde         
      1ff0         
      2002         
      200c         
      2016         
      2020         
      202a         
      2039         
      2043         
      204d         
      205c         
      206a         
      2078         
      2086         
      2090         
      2097         
      20b1         
      2177         
      217e         
      224e         
      225c         
      226a         
      2278         
      2283         
      228a         
      22a4         
      22be         
      2372         
      237f         
      2395         
      23af         
      2401         
      240f         
      241d         
      2438         
      2443         
      244a         
      2454         
      245e         
      2468         
      2472         
      247c         
      2486         
      2490         
      249a         
      24a4         
      24ae         
      24b8         
      24c2         
      24cc         
      24d6         
      24e0         
      24ea         
      24f1         
      24f8         
      2502         
      250c         
      2516         
      2520         
      252a         
      2534         
      253e         
      2548         
      2552         
      255c         
      2566         
      2570         
      257a         
      2584         
      258e         
      2598         
      259f         
      25a6         
      25b0         
      25ba         
      25c4         
      25ce         
      25d8         
      25e2         
      25ec         
      25f6         
      2600         
      260a         
      2614         
      261e         
      2628         
      2632         
      263c         
      2646         
      264d         
      26bd         
      271a         
      2728         
      276a         
      2776         
      27af         
      27b6         
      27bd         
      27c4         
      282d         
      2834         
      2842         
      2849         
      2857         
      285e         
      286a         
      2871         

Source positions:
 pc offset  position
        3f        66
        60       103
       11b       172
       25d       285
       263       295
       26b       299
       270       306
       278       310
       281       321
       286       326
       28b       331
       290       336
       295       339
       2b0       353
       2cf       366
       2d4       373
       2e0       385
       2e5       392
       356       434
       366       463
       396       492
       3a6       504
       3ea       520
       3ef       525
       3f8       536
       406       555
       40f       560
       414       567
       457       609
       468       638
       495       667
       4a5       679
       4e3       695
       4e8       700
       4f0       711
       4fc       730
       505       735
       50a       742
       557       785
       568       814
       595       843
       5a5       855
       5e6       871
       5eb       876
       5f3       887
       5ff       906
       608       911
       60d       918
       657       957
       668       986
       699      1015
       6a9      1027
       6e4      1043
       6e9      1048
       6f1      1059
       6fe      1072
       703      1079
       70a      1089
       710      1093
       717      1101
       71d      1107
       724      1117
       72b      1121
       732      1129
       739      1135
       73e      1142
       743      1151
       74a      1155
       751      1163
       756      1170
       75b      1177
       783      1189
       788      1196
       78d      1203
       792      1210
       7c2      1252
       7d5      1269
       7da      1276
       7df      1283
       7e4      1290
       84a      1307
       85e      1319
       873      1331
       888      1343
       89d      1353
       8a6      1366
       8ac      1373
       8b5      1381
       8ba      1388
       8c2      1396
       8c7      1405
       8d7      1413
       8e1      1416
       8ea      1423
       8f0      1430
       8f6      1437
       8fb      1444
       909      1467
       90f      1473
       919      1483
       921      1490
       a20      1595
       b09      1734
       b0e      1741
       c13      1809
       c1a      1822
      1055      2362
      1067      2387
      10a9      2451
      10cb      2474
      112f      2538
      1152      2561
      11b8      2625
      11db      2648
      123c      2712
      1260      2735
      12a5      2784
      12c0      2805
      1302      2854
      131d      2875
      137a      2924
      139d      2945
      1686      3227
      168c      3235
      169b      3243
      16aa      3251
      16c3      3264
      16d1      3272
      16d8      3280
      16e7      3288
      16f9      3301
      1706      3309
      1714      3317
      172d      3330
      1732      3338
      1738      3346
      173e      3358
      17e5      3438
      1836      3489
      190b      3602
      19dc      3715
      1a94      3828
      1ab5      3847
      1ad0      3866
      1aeb      3885
      1b05      3904
      1b67      3979
      1bbe      4036
      1c12      4093
      1c5c      4150
      1c7e      4169
      1c9f      4188
      1cc2      4207
      1ce4      4226
      1d06      4245
      1d28      4264
      1d4b      4283
      1d6d      4302
      1d8e      4321
      1db0      4340
      1dd3      4359
      1ded      4378
      1e0e      4397
      1e2c      4415
      1e4c      4433
      1e6a      4451
      1e77      4466
      1ee0      4479
      1ef8      4488
      1f0a      4497
      1f1c      4506
      1f2e      4515
      1f40      4524
      1f52      4533
      1f61      4541
      1f70      4549
      1f7f      4557
      1f8e      4565
      1fa0      4574
      1fb2      4583
      1fc4      4592
      1fd6      4601
      1fe8      4610
      1ffa      4619
      200c      4628
      2016      4637
      2020      4646
      202a      4655
      2034      4664
      2043      4673
      204d      4682
      2057      4691
      2066      4700
      2074      4709
      2082      4718
      2090      4727
      2097      4735
      20b1      4762
      2177      5004
      217e      5012
      224e      5283
      225c      5287
      226a      5293
      2278      5299
      2283      5310
      228a      5318
      22a4      5345
      22be      5372
      2372      5597
      237f      5605
      2395      5632
      23af      5659
      2401      5758
      240f      5762
      241d      5768
      2438      5799
      2443      5808
      244a      5816
      2454      5822
      245e      5829
      2468      5836
      2472      5843
      247c      5850
      2486      5857
      2490      5864
      249a      5871
      24a4      5878
      24ae      5885
      24b8      5892
      24c2      5899
      24cc      5906
      24d6      5913
      24e0      5920
      24ea      5927
      24f1      5933
      24f8      5940
      2502      5946
      250c      5953
      2516      5960
      2520      5967
      252a      5974
      2534      5981
      253e      5988
      2548      5995
      2552      6002
      255c      6009
      2566      6016
      2570      6023
      257a      6030
      2584      6037
      258e      6044
      2598      6051
      259f      6057
      25a6      6064
      25b0      6070
      25ba      6077
      25c4      6084
      25ce      6091
      25d8      6098
      25e2      6105
      25ec      6112
      25f6      6119
      2600      6126
      260a      6133
      2614      6140
      261e      6147
      2628      6154
      2632      6161
      263c      6168
      2646      6175
      264d      6181
      26bd      6260
      271a      6276
      2728      6291
      276a      6352
      2776      6360
      27af      6433
      27b6      6440
      27bd      6447
      27c4      6454
      27f6      6499
      2825      6519
      2834      6522
      2842      6532
      2849      6535
      2857      6545
      285e      6548
      286a      6558
      2871      6561
      28f5         0
      2969       408
      29aa       583
      29ed       759
      2a33       931
      2a72      1299
      2af4      1746
      2b64      2351
      2c12      6266

Safepoints (stack slots = 158, entries = 1, byte size = 34)
0x33f7636780f0    2b0  slots (sp->fp): 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 53)
0x33f7636780ec  internal wasm call
0x33f7636781fb  internal wasm call
0x33f7636782f3  internal wasm call
0x33f7636783f3  internal wasm call
0x33f7636784f7  internal wasm call
0x33f763679cbf  internal wasm call
0x33f76367a64a  internal wasm call
0x33f76367a736  wasm stub call  (0x33f76359e4d0)
0x33f76367a7ba  wasm stub call  (0x33f76359e4d0)
0x33f76367a7fb  wasm stub call  (0x33f76359e4d0)
0x33f76367a83e  wasm stub call  (0x33f76359e4d0)
0x33f76367a884  wasm stub call  (0x33f76359e4d0)
0x33f76367a8b7  wasm stub call  (0x33f76359e4d0)
0x33f76367a935  wasm stub call  (0x33f76359e4d0)
0x33f76367a9de  wasm stub call  (0x33f76359e4d0)
0x33f76367aa9e  wasm stub call  (0x33f76359e4d0)
