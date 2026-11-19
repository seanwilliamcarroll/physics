name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1467
kind: wasm function
compiler: TurboFan
Body (size = 8832 = 8812 + 20 padding)
Instructions (size = 8776)
0x321fc577c340     0  55                   push rbp
0x321fc577c341     1  4889e5               REX.W movq rbp,rsp
0x321fc577c344     4  6a08                 push 0x8
0x321fc577c346     6  56                   push rsi
0x321fc577c347     7  4881eca8040000       REX.W subq rsp,0x4a8
0x321fc577c34e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x321fc577c352    12  488945d8             REX.W movq [rbp-0x28],rax
0x321fc577c356    16  48897dc8             REX.W movq [rbp-0x38],rdi
0x321fc577c35a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577c35e    1e  0f86451e0000         jna 0x321fc577e1a9  <+0x1e69>
0x321fc577c364    24  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x321fc577c368    28  458b18               movl r11,[r8]
0x321fc577c36b    2b  418d5bb0             leal rbx,[r11-0x50]
0x321fc577c36f    2f  418918               movl [r8],rbx
0x321fc577c372    32  448bd8               movl r11,rax
0x321fc577c375    35  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0x321fc577c37c    3c  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0x321fc577c382    42  c5fa16d0             vmovshdup xmm2,xmm0
0x321fc577c386    46  41ba0000803a         movl r10,0x3a800000
0x321fc577c38c    4c  c4c1796eda           vmovd xmm3,r10
0x321fc577c391    51  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x321fc577c395    55  c5f828c8             vmovaps xmm1,xmm0
0x321fc577c399    59  c5e259d9             vmulss xmm3,xmm3,xmm1
0x321fc577c39d    5d  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0x321fc577c3a7    67  4c8945e8             REX.W movq [rbp-0x18],r8
0x321fc577c3ab    6b  48895de0             REX.W movq [rbp-0x20],rbx
0x321fc577c3af    6f  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x321fc577c3b6    76  c5fb115588           vmovsd [rbp-0x78],xmm2
0x321fc577c3bb    7b  c5fb114d90           vmovsd [rbp-0x70],xmm1
0x321fc577c3c0    80  c5f82eed             vucomiss xmm5,xmm5
0x321fc577c3c4    84  7a06                 jpe 0x321fc577c3cc  <+0x8c>
0x321fc577c3c6    86  0f8404000000         jz 0x321fc577c3d0  <+0x90>
0x321fc577c3cc    8c  c5f928eb             vmovapd xmm5,xmm3
0x321fc577c3d0    90  c5f82edb             vucomiss xmm3,xmm3
0x321fc577c3d4    94  7a06                 jpe 0x321fc577c3dc  <+0x9c>
0x321fc577c3d6    96  0f8404000000         jz 0x321fc577c3e0  <+0xa0>
0x321fc577c3dc    9c  c5f928dd             vmovapd xmm3,xmm5
0x321fc577c3e0    a0  c5f82eeb             vucomiss xmm5,xmm3
0x321fc577c3e4    a4  0f8704000000         ja 0x321fc577c3ee  <+0xae>
0x321fc577c3ea    aa  c5f928eb             vmovapd xmm5,xmm3
0x321fc577c3ee    ae  c5f82eed             vucomiss xmm5,xmm5
0x321fc577c3f2    b2  7a06                 jpe 0x321fc577c3fa  <+0xba>
0x321fc577c3f4    b4  0f8409000000         jz 0x321fc577c403  <+0xc3>
0x321fc577c3fa    ba  c5f928dc             vmovapd xmm3,xmm4
0x321fc577c3fe    be  e904000000           jmp 0x321fc577c407  <+0xc7>
0x321fc577c403    c3  c5f928dd             vmovapd xmm3,xmm5
0x321fc577c407    c7  c5f82ee4             vucomiss xmm4,xmm4
0x321fc577c40b    cb  7a06                 jpe 0x321fc577c413  <+0xd3>
0x321fc577c40d    cd  0f8404000000         jz 0x321fc577c417  <+0xd7>
0x321fc577c413    d3  c5f928e3             vmovapd xmm4,xmm3
0x321fc577c417    d7  c5f82edc             vucomiss xmm3,xmm4
0x321fc577c41b    db  0f8704000000         ja 0x321fc577c425  <+0xe5>
0x321fc577c421    e1  c5f928dc             vmovapd xmm3,xmm4
0x321fc577c425    e5  41ba0020803f         movl r10,0x3f802000
0x321fc577c42b    eb  c4c1796ee2           vmovd xmm4,r10
0x321fc577c430    f0  c5da59db             vmulss xmm3,xmm4,xmm3
0x321fc577c434    f4  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x321fc577c438    f8  c5d972f419           vpslld xmm4,xmm4,25
0x321fc577c43d    fd  c5d972d402           vpsrld xmm4,xmm4,2
0x321fc577c442   102  c5da5edb             vdivss xmm3,xmm4,xmm3
0x321fc577c446   106  c5f828db             vmovaps xmm3,xmm3
0x321fc577c44a   10a  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0x321fc577c454   114  c4e27918eb           vbroadcastss xmm5,xmm3
0x321fc577c459   119  c5f859c5             vmulps xmm0,xmm0,xmm5
0x321fc577c45d   11d  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x321fc577c463   123  c5f828e8             vmovaps xmm5,xmm0
0x321fc577c467   127  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0x321fc577c46b   12b  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x321fc577c471   131  c57b2ce7             vcvttsd2si r12,xmm7
0x321fc577c475   135  4585e4               testl r12,r12
0x321fc577c478   138  0f892a000000         jns 0x321fc577c4a8  <+0x168>
0x321fc577c47e   13e  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x321fc577c488   148  c441f96efa           vmovq xmm15,r10
0x321fc577c48d   14d  c50358ff             vaddsd xmm15,xmm15,xmm7
0x321fc577c491   151  c4417b2ce7           vcvttsd2si r12,xmm15
0x321fc577c496   156  4585e4               testl r12,r12
0x321fc577c499   159  0f8809000000         js 0x321fc577c4a8  <+0x168>
0x321fc577c49f   15f  41ba00000080         movl r10,0x80000000
0x321fc577c4a5   165  450be2               orl r12,r10
0x321fc577c4a8   168  4589e2               movl r10,r12
0x321fc577c4ab   16b  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x321fc577c4b0   170  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577c4b8   178  c5792ec7             vucomisd xmm8,xmm7
0x321fc577c4bc   17c  0f8afc1c0000         jpe 0x321fc577e1be  <+0x1e7e>
0x321fc577c4c2   182  0f85f61c0000         jnz 0x321fc577e1be  <+0x1e7e>
0x321fc577c4c8   188  c4c1796eec           vmovd xmm5,r12
0x321fc577c4cd   18d  c5f970ed00           vpshufd xmm5,xmm5,0x0
0x321fc577c4d2   192  c5fa16f0             vmovshdup xmm6,xmm0
0x321fc577c4d6   196  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x321fc577c4da   19a  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x321fc577c4e0   1a0  c4417b2ce0           vcvttsd2si r12,xmm8
0x321fc577c4e5   1a5  4585e4               testl r12,r12
0x321fc577c4e8   1a8  0f8928000000         jns 0x321fc577c516  <+0x1d6>
0x321fc577c4ee   1ae  4c8b158bffffff       REX.W movq r10,[rip+0xffffff8b]
0x321fc577c4f5   1b5  c441f96efa           vmovq xmm15,r10
0x321fc577c4fa   1ba  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x321fc577c4ff   1bf  c4417b2ce7           vcvttsd2si r12,xmm15
0x321fc577c504   1c4  4585e4               testl r12,r12
0x321fc577c507   1c7  0f8809000000         js 0x321fc577c516  <+0x1d6>
0x321fc577c50d   1cd  41ba00000080         movl r10,0x80000000
0x321fc577c513   1d3  450be2               orl r12,r10
0x321fc577c516   1d6  4589e2               movl r10,r12
0x321fc577c519   1d9  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x321fc577c51e   1de  c441792ec8           vucomisd xmm9,xmm8
0x321fc577c523   1e3  0f8acb1c0000         jpe 0x321fc577e1f4  <+0x1eb4>
0x321fc577c529   1e9  0f85c51c0000         jnz 0x321fc577e1f4  <+0x1eb4>
0x321fc577c52f   1ef  c4c35122ec01         vpinsrd xmm5,xmm5,r12,0x1
0x321fc577c535   1f5  49ba0100000001000000 REX.W movq r10,0x100000001
0x321fc577c53f   1ff  c4c1f96ef2           vmovq xmm6,r10
0x321fc577c544   204  c5c96cf6             vpunpcklqdq xmm6,xmm6,xmm6
0x321fc577c548   208  c4e2513fee           vpmaxud xmm5,xmm5,xmm6
0x321fc577c54d   20d  c5c1efff             vpxor xmm7,xmm7,xmm7
0x321fc577c551   211  c540c2c002           vcmpps xmm8,xmm7,xmm0, (le)
0x321fc577c556   216  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x321fc577c560   220  c441f96eca           vmovq xmm9,r10
0x321fc577c565   225  c441316cc9           vpunpcklqdq xmm9,xmm9,xmm9
0x321fc577c56a   22a  c4c178c2c101         vcmpps xmm0,xmm0,xmm9, (lt)
0x321fc577c570   230  c5b9dbc0             vpand xmm0,xmm8,xmm0
0x321fc577c574   234  c579dffe             vpandn xmm15,xmm0,xmm6
0x321fc577c578   238  c5d1dbc0             vpand xmm0,xmm5,xmm0
0x321fc577c57c   23c  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x321fc577c581   241  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0x321fc577c588   248  c4817813041c         vmovlps [r12+r11*1],xmm0
0x321fc577c58e   24e  468ba41fcc000000     movl r12,[rdi+r11*1+0xcc]
0x321fc577c596   256  4489641f48           movl [rdi+rbx*1+0x48],r12
0x321fc577c59b   25b  4e8ba41fc4000000     REX.W movq r12,[rdi+r11*1+0xc4]
0x321fc577c5a3   263  4c89641f40           REX.W movq [rdi+rbx*1+0x40],r12
0x321fc577c5a8   268  448d6060             leal r12,[rax+0x60]
0x321fc577c5ac   26c  428b541f04           movl rdx,[rdi+r11*1+0x4]
0x321fc577c5b1   271  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0x321fc577c5b6   276  468b7c1f10           movl r15,[rdi+r11*1+0x10]
0x321fc577c5bb   27b  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0x321fc577c5c0   280  c5f811b560feffff     vmovups [rbp-0x1a0],xmm6
0x321fc577c5c8   288  c5f811bd10ffffff     vmovups [rbp-0xf0],xmm7
0x321fc577c5d0   290  4489e0               movl rax,r12
0x321fc577c5d3   293  418bdf               movl rbx,r15
0x321fc577c5d6   296  e81d87f2ff           call 0x321fc56a4cf8  (jump table)
0x321fc577c5db   29b  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577c5df   29f  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577c5e6   2a6  42c744073800000000   movl [rdi+r8*1+0x38],0x0
0x321fc577c5ef   2af  448b5dd8             movl r11,[rbp-0x28]
0x321fc577c5f3   2b3  418d93a0000000       leal rdx,[r11+0xa0]
0x321fc577c5fa   2ba  468b64077c           movl r12,[rdi+r8*1+0x7c]
0x321fc577c5ff   2bf  468bbc0780000000     movl r15,[rdi+r8*1+0x80]
0x321fc577c607   2c7  478d3cbc             leal r15,[r12+r15*4]
0x321fc577c60b   2cb  468b740708           movl r14,[rdi+r8*1+0x8]
0x321fc577c610   2d0  428b440704           movl rax,[rdi+r8*1+0x4]
0x321fc577c615   2d5  418d5b30             leal rbx,[r11+0x30]
0x321fc577c619   2d9  48895598             REX.W movq [rbp-0x68],rdx
0x321fc577c61d   2dd  4c8965a0             REX.W movq [rbp-0x60],r12
0x321fc577c621   2e1  4c89bd78ffffff       REX.W movq [rbp-0x88],r15
0x321fc577c628   2e8  4c8975c0             REX.W movq [rbp-0x40],r14
0x321fc577c62c   2ec  488945b8             REX.W movq [rbp-0x48],rax
0x321fc577c630   2f0  48895da8             REX.W movq [rbp-0x58],rbx
0x321fc577c634   2f4  4489e6               movl rsi,r12
0x321fc577c637   2f7  33c9                 xorl rcx,rcx
0x321fc577c639   2f9  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577c641   301  660f1f840000000000   nop
0x321fc577c64a   30a  660f1f840000000000   nop
0x321fc577c653   313  660f1f840000000000   nop
0x321fc577c65c   31c  660f1f840000000000   nop
0x321fc577c665   325  660f1f840000000000   nop
0x321fc577c66e   32e  660f1f840000000000   nop
0x321fc577c677   337  660f1f840000000000   nop
0x321fc577c680   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577c684   344  0f86911b0000         jna 0x321fc577e21b  <+0x1edb>
0x321fc577c68a   34a  3bb578ffffff         cmpl rsi,[rbp-0x88]
0x321fc577c690   350  0f8421000000         jz 0x321fc577c6b7  <+0x377>
0x321fc577c696   356  448b0c37             movl r9,[rdi+rsi*1]
0x321fc577c69a   35a  83c604               addl rsi,0x4
0x321fc577c69d   35d  453bf1               cmpl r14,r9
0x321fc577c6a0   360  76de                 jna 0x321fc577c680  <+0x340>
0x321fc577c6a2   362  468d0c88             leal r9,[rax+r9*4]
0x321fc577c6a6   366  c4a17a101c0f         vmovss xmm3,[rdi+r9*1]
0x321fc577c6ac   36c  41b901000000         movl r9,0x1
0x321fc577c6b2   372  e909000000           jmp 0x321fc577c6c0  <+0x380>
0x321fc577c6b7   377  4533c9               xorl r9,r9
0x321fc577c6ba   37a  8bb578ffffff         movl rsi,[rbp-0x88]
0x321fc577c6c0   380  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577c6c8   388  488975d0             REX.W movq [rbp-0x30],rsi
0x321fc577c6cc   38c  4183f901             cmpl r9,0x1
0x321fc577c6d0   390  0f8570000000         jnz 0x321fc577c746  <+0x406>
0x321fc577c6d6   396  468b4c0730           movl r9,[rdi+r8*1+0x30]
0x321fc577c6db   39b  42394c0730           cmpl [rdi+r8*1+0x30],rcx
0x321fc577c6e0   3a0  0f8540000000         jnz 0x321fc577c726  <+0x3e6>
0x321fc577c6e6   3a6  48894db0             REX.W movq [rbp-0x50],rcx
0x321fc577c6ea   3aa  8bd1                 movl rdx,rcx
0x321fc577c6ec   3ac  b901000000           movl rcx,0x1
0x321fc577c6f1   3b1  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577c6f5   3b5  8bc3                 movl rax,rbx
0x321fc577c6f7   3b7  4c8bc9               REX.W movq r9,rcx
0x321fc577c6fa   3ba  e80186f2ff           call 0x321fc56a4d00  (jump table)
0x321fc577c6ff   3bf  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577c703   3c3  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577c70a   3ca  448b5dd8             movl r11,[rbp-0x28]
0x321fc577c70e   3ce  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577c716   3d6  8b75d0               movl rsi,[rbp-0x30]
0x321fc577c719   3d9  8b4db0               movl rcx,[rbp-0x50]
0x321fc577c71c   3dc  8b5da8               movl rbx,[rbp-0x58]
0x321fc577c71f   3df  8b45b8               movl rax,[rbp-0x48]
0x321fc577c722   3e2  448b75c0             movl r14,[rbp-0x40]
0x321fc577c726   3e6  448d6101             leal r12,[rcx+0x1]
0x321fc577c72a   3ea  4689640738           movl [rdi+r8*1+0x38],r12
0x321fc577c72f   3ef  468b7c0734           movl r15,[rdi+r8*1+0x34]
0x321fc577c734   3f4  458d3c8f             leal r15,[r15+rcx*4]
0x321fc577c738   3f8  c4a17a111c3f         vmovss [rdi+r15*1],xmm3
0x321fc577c73e   3fe  4489e1               movl rcx,r12
0x321fc577c741   401  e93affffff           jmp 0x321fc577c680  <+0x340>
0x321fc577c746   406  42c744074400000000   movl [rdi+r8*1+0x44],0x0
0x321fc577c74f   40f  468b640714           movl r12,[rdi+r8*1+0x14]
0x321fc577c754   414  468b7c0710           movl r15,[rdi+r8*1+0x10]
0x321fc577c759   419  418d433c             leal rax,[r11+0x3c]
0x321fc577c75d   41d  4c8965b0             REX.W movq [rbp-0x50],r12
0x321fc577c761   421  4c897da8             REX.W movq [rbp-0x58],r15
0x321fc577c765   425  488945c0             REX.W movq [rbp-0x40],rax
0x321fc577c769   429  448b75a0             movl r14,[rbp-0x60]
0x321fc577c76d   42d  33d2                 xorl rdx,rdx
0x321fc577c76f   42f  660f1f840000000000   nop
0x321fc577c778   438  0f1f840000000000     nop
0x321fc577c780   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577c784   444  0f86d21a0000         jna 0x321fc577e25c  <+0x1f1c>
0x321fc577c78a   44a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x321fc577c791   451  0f8420000000         jz 0x321fc577c7b7  <+0x477>
0x321fc577c797   457  428b1c37             movl rbx,[rdi+r14*1]
0x321fc577c79b   45b  4183c604             addl r14,0x4
0x321fc577c79f   45f  443be3               cmpl r12,rbx
0x321fc577c7a2   462  76dc                 jna 0x321fc577c780  <+0x440>
0x321fc577c7a4   464  418d1c9f             leal rbx,[r15+rbx*4]
0x321fc577c7a8   468  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x321fc577c7ad   46d  bb01000000           movl rbx,0x1
0x321fc577c7b2   472  e909000000           jmp 0x321fc577c7c0  <+0x480>
0x321fc577c7b7   477  33db                 xorl rbx,rbx
0x321fc577c7b9   479  448bb578ffffff       movl r14,[rbp-0x88]
0x321fc577c7c0   480  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577c7c8   488  4c8975b8             REX.W movq [rbp-0x48],r14
0x321fc577c7cc   48c  83fb01               cmpl rbx,0x1
0x321fc577c7cf   48f  0f8567000000         jnz 0x321fc577c83c  <+0x4fc>
0x321fc577c7d5   495  428b5c073c           movl rbx,[rdi+r8*1+0x3c]
0x321fc577c7da   49a  423954073c           cmpl [rdi+r8*1+0x3c],rdx
0x321fc577c7df   49f  0f853b000000         jnz 0x321fc577c820  <+0x4e0>
0x321fc577c7e5   4a5  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577c7e9   4a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577c7ed   4ad  b901000000           movl rcx,0x1
0x321fc577c7f2   4b2  e80985f2ff           call 0x321fc56a4d00  (jump table)
0x321fc577c7f7   4b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577c7fb   4bb  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577c802   4c2  448b5dd8             movl r11,[rbp-0x28]
0x321fc577c806   4c6  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577c80e   4ce  448b75b8             movl r14,[rbp-0x48]
0x321fc577c812   4d2  8b55d0               movl rdx,[rbp-0x30]
0x321fc577c815   4d5  8b45c0               movl rax,[rbp-0x40]
0x321fc577c818   4d8  448b7da8             movl r15,[rbp-0x58]
0x321fc577c81c   4dc  448b65b0             movl r12,[rbp-0x50]
0x321fc577c820   4e0  8d5a01               leal rbx,[rdx+0x1]
0x321fc577c823   4e3  42895c0744           movl [rdi+r8*1+0x44],rbx
0x321fc577c828   4e8  428b4c0740           movl rcx,[rdi+r8*1+0x40]
0x321fc577c82d   4ed  8d1491               leal rdx,[rcx+rdx*4]
0x321fc577c830   4f0  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x321fc577c835   4f5  8bd3                 movl rdx,rbx
0x321fc577c837   4f7  e944ffffff           jmp 0x321fc577c780  <+0x440>
0x321fc577c83c   4fc  42c744075000000000   movl [rdi+r8*1+0x50],0x0
0x321fc577c845   505  468b640720           movl r12,[rdi+r8*1+0x20]
0x321fc577c84a   50a  468b7c071c           movl r15,[rdi+r8*1+0x1c]
0x321fc577c84f   50f  418d4348             leal rax,[r11+0x48]
0x321fc577c853   513  4c896580             REX.W movq [rbp-0x80],r12
0x321fc577c857   517  4c897db8             REX.W movq [rbp-0x48],r15
0x321fc577c85b   51b  488945c0             REX.W movq [rbp-0x40],rax
0x321fc577c85f   51f  448b75a0             movl r14,[rbp-0x60]
0x321fc577c863   523  33d2                 xorl rdx,rdx
0x321fc577c865   525  660f1f840000000000   nop
0x321fc577c86e   52e  660f1f840000000000   nop
0x321fc577c877   537  660f1f840000000000   nop
0x321fc577c880   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577c884   544  0f86151a0000         jna 0x321fc577e29f  <+0x1f5f>
0x321fc577c88a   54a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x321fc577c891   551  0f8420000000         jz 0x321fc577c8b7  <+0x577>
0x321fc577c897   557  428b1c37             movl rbx,[rdi+r14*1]
0x321fc577c89b   55b  4183c604             addl r14,0x4
0x321fc577c89f   55f  443be3               cmpl r12,rbx
0x321fc577c8a2   562  76dc                 jna 0x321fc577c880  <+0x540>
0x321fc577c8a4   564  418d1c9f             leal rbx,[r15+rbx*4]
0x321fc577c8a8   568  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x321fc577c8ad   56d  bb01000000           movl rbx,0x1
0x321fc577c8b2   572  e909000000           jmp 0x321fc577c8c0  <+0x580>
0x321fc577c8b7   577  33db                 xorl rbx,rbx
0x321fc577c8b9   579  448bb578ffffff       movl r14,[rbp-0x88]
0x321fc577c8c0   580  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577c8c8   588  4c8975b0             REX.W movq [rbp-0x50],r14
0x321fc577c8cc   58c  83fb01               cmpl rbx,0x1
0x321fc577c8cf   58f  0f8567000000         jnz 0x321fc577c93c  <+0x5fc>
0x321fc577c8d5   595  428b5c0748           movl rbx,[rdi+r8*1+0x48]
0x321fc577c8da   59a  4239540748           cmpl [rdi+r8*1+0x48],rdx
0x321fc577c8df   59f  0f853b000000         jnz 0x321fc577c920  <+0x5e0>
0x321fc577c8e5   5a5  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577c8e9   5a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577c8ed   5ad  b901000000           movl rcx,0x1
0x321fc577c8f2   5b2  e80984f2ff           call 0x321fc56a4d00  (jump table)
0x321fc577c8f7   5b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577c8fb   5bb  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577c902   5c2  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577c90a   5ca  448b5dd8             movl r11,[rbp-0x28]
0x321fc577c90e   5ce  448b75b0             movl r14,[rbp-0x50]
0x321fc577c912   5d2  8b55d0               movl rdx,[rbp-0x30]
0x321fc577c915   5d5  8b45c0               movl rax,[rbp-0x40]
0x321fc577c918   5d8  448b7db8             movl r15,[rbp-0x48]
0x321fc577c91c   5dc  448b6580             movl r12,[rbp-0x80]
0x321fc577c920   5e0  8d5a01               leal rbx,[rdx+0x1]
0x321fc577c923   5e3  42895c0750           movl [rdi+r8*1+0x50],rbx
0x321fc577c928   5e8  428b4c074c           movl rcx,[rdi+r8*1+0x4c]
0x321fc577c92d   5ed  8d1491               leal rdx,[rcx+rdx*4]
0x321fc577c930   5f0  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x321fc577c935   5f5  8bd3                 movl rdx,rbx
0x321fc577c937   5f7  e944ffffff           jmp 0x321fc577c880  <+0x540>
0x321fc577c93c   5fc  42c744075c00000000   movl [rdi+r8*1+0x5c],0x0
0x321fc577c945   605  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x321fc577c94a   60a  468b7c0728           movl r15,[rdi+r8*1+0x28]
0x321fc577c94f   60f  418d4354             leal rax,[r11+0x54]
0x321fc577c953   613  4c8965b8             REX.W movq [rbp-0x48],r12
0x321fc577c957   617  4c897dc0             REX.W movq [rbp-0x40],r15
0x321fc577c95b   61b  488945d8             REX.W movq [rbp-0x28],rax
0x321fc577c95f   61f  33d2                 xorl rdx,rdx
0x321fc577c961   621  448b5da0             movl r11,[rbp-0x60]
0x321fc577c965   625  660f1f840000000000   nop
0x321fc577c96e   62e  660f1f840000000000   nop
0x321fc577c977   637  660f1f840000000000   nop
0x321fc577c980   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577c984   644  0f8658190000         jna 0x321fc577e2e2  <+0x1fa2>
0x321fc577c98a   64a  443b9d78ffffff       cmpl r11,[rbp-0x88]
0x321fc577c991   651  0f8422000000         jz 0x321fc577c9b9  <+0x679>
0x321fc577c997   657  468b341f             movl r14,[rdi+r11*1]
0x321fc577c99b   65b  4183c304             addl r11,0x4
0x321fc577c99f   65f  453be6               cmpl r12,r14
0x321fc577c9a2   662  76dc                 jna 0x321fc577c980  <+0x640>
0x321fc577c9a4   664  478d34b7             leal r14,[r15+r14*4]
0x321fc577c9a8   668  c4a17a101c37         vmovss xmm3,[rdi+r14*1]
0x321fc577c9ae   66e  41be01000000         movl r14,0x1
0x321fc577c9b4   674  e90a000000           jmp 0x321fc577c9c3  <+0x683>
0x321fc577c9b9   679  4533f6               xorl r14,r14
0x321fc577c9bc   67c  448b9d78ffffff       movl r11,[rbp-0x88]
0x321fc577c9c3   683  4c895da0             REX.W movq [rbp-0x60],r11
0x321fc577c9c7   687  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577c9cf   68f  4183fe01             cmpl r14,0x1
0x321fc577c9d3   693  0f8565000000         jnz 0x321fc577ca3e  <+0x6fe>
0x321fc577c9d9   699  468b740754           movl r14,[rdi+r8*1+0x54]
0x321fc577c9de   69e  4239540754           cmpl [rdi+r8*1+0x54],rdx
0x321fc577c9e3   6a3  0f8537000000         jnz 0x321fc577ca20  <+0x6e0>
0x321fc577c9e9   6a9  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577c9ed   6ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577c9f1   6b1  b901000000           movl rcx,0x1
0x321fc577c9f6   6b6  e80583f2ff           call 0x321fc56a4d00  (jump table)
0x321fc577c9fb   6bb  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577c9ff   6bf  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577ca06   6c6  8b55d0               movl rdx,[rbp-0x30]
0x321fc577ca09   6c9  448b5da0             movl r11,[rbp-0x60]
0x321fc577ca0d   6cd  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577ca15   6d5  8b45d8               movl rax,[rbp-0x28]
0x321fc577ca18   6d8  448b7dc0             movl r15,[rbp-0x40]
0x321fc577ca1c   6dc  448b65b8             movl r12,[rbp-0x48]
0x321fc577ca20   6e0  448d7201             leal r14,[rdx+0x1]
0x321fc577ca24   6e4  468974075c           movl [rdi+r8*1+0x5c],r14
0x321fc577ca29   6e9  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0x321fc577ca2e   6ee  8d1c93               leal rbx,[rbx+rdx*4]
0x321fc577ca31   6f1  c5fa111c1f           vmovss [rdi+rbx*1],xmm3
0x321fc577ca36   6f6  418bd6               movl rdx,r14
0x321fc577ca39   6f9  e942ffffff           jmp 0x321fc577c980  <+0x640>
0x321fc577ca3e   6fe  468b5c0738           movl r11,[rdi+r8*1+0x38]
0x321fc577ca43   703  c4a17a6f440730       vmovdqu xmm0,[rdi+r8*1+0x30]
0x321fc577ca4a   70a  c4a17a6f1c07         vmovdqu xmm3,[rdi+r8*1]
0x321fc577ca50   710  c4a17a7f5c0730       vmovdqu [rdi+r8*1+0x30],xmm3
0x321fc577ca57   717  c4a17a7f0407         vmovdqu [rdi+r8*1],xmm0
0x321fc577ca5d   71d  c4a17a6f440740       vmovdqu xmm0,[rdi+r8*1+0x40]
0x321fc577ca64   724  c4a17a6f5c0710       vmovdqu xmm3,[rdi+r8*1+0x10]
0x321fc577ca6b   72b  c4a17a7f5c0740       vmovdqu [rdi+r8*1+0x40],xmm3
0x321fc577ca72   732  c4a17a7f440710       vmovdqu [rdi+r8*1+0x10],xmm0
0x321fc577ca79   739  4e8b640750           REX.W movq r12,[rdi+r8*1+0x50]
0x321fc577ca7e   73e  468b7c0758           movl r15,[rdi+r8*1+0x58]
0x321fc577ca83   743  c4a17a6f440720       vmovdqu xmm0,[rdi+r8*1+0x20]
0x321fc577ca8a   74a  c4a17a7f440750       vmovdqu [rdi+r8*1+0x50],xmm0
0x321fc577ca91   751  46897c0728           movl [rdi+r8*1+0x28],r15
0x321fc577ca96   756  428954072c           movl [rdi+r8*1+0x2c],rdx
0x321fc577ca9b   75b  4e89640720           REX.W movq [rdi+r8*1+0x20],r12
0x321fc577caa0   760  4c895dd8             REX.W movq [rbp-0x28],r11
0x321fc577caa4   764  4585db               testl r11,r11
0x321fc577caa7   767  0f8513000000         jnz 0x321fc577cac0  <+0x780>
0x321fc577caad   76d  8b5de0               movl rbx,[rbp-0x20]
0x321fc577cab0   770  8d7b50               leal rdi,[rbx+0x50]
0x321fc577cab3   773  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x321fc577cab7   777  41893c24             movl [r12],rdi
0x321fc577cabb   77b  488be5               REX.W movq rsp,rbp
0x321fc577cabe   77e  5d                   pop rbp
0x321fc577cabf   77f  c3                   retl
0x321fc577cac0   780  468b64075c           movl r12,[rdi+r8*1+0x5c]
0x321fc577cac5   785  468b7c0750           movl r15,[rdi+r8*1+0x50]
0x321fc577caca   78a  468b740744           movl r14,[rdi+r8*1+0x44]
0x321fc577cacf   78f  428b440738           movl rax,[rdi+r8*1+0x38]
0x321fc577cad4   794  8bd8                 movl rbx,rax
0x321fc577cad6   796  443bf0               cmpl r14,rax
0x321fc577cad9   799  410f42de             cmovcl rbx,r14
0x321fc577cadd   79d  448bf3               movl r14,rbx
0x321fc577cae0   7a0  443bfb               cmpl r15,rbx
0x321fc577cae3   7a3  450f42f7             cmovcl r14,r15
0x321fc577cae7   7a7  458bfe               movl r15,r14
0x321fc577caea   7aa  453be6               cmpl r12,r14
0x321fc577caed   7ad  450f42fc             cmovcl r15,r12
0x321fc577caf1   7b1  c4a17a108407a4000000 vmovss xmm0,[rdi+r8*1+0xa4]
0x321fc577cafb   7bb  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x321fc577caff   7bf  c4e27918d8           vbroadcastss xmm3,xmm0
0x321fc577cb04   7c4  c4a17a10a407a0000000 vmovss xmm4,[rdi+r8*1+0xa0]
0x321fc577cb0e   7ce  c5da59e4             vmulss xmm4,xmm4,xmm4
0x321fc577cb12   7d2  c4e27918ec           vbroadcastss xmm5,xmm4
0x321fc577cb17   7d7  468b640758           movl r12,[rdi+r8*1+0x58]
0x321fc577cb1c   7dc  468b74074c           movl r14,[rdi+r8*1+0x4c]
0x321fc577cb21   7e1  428b440740           movl rax,[rdi+r8*1+0x40]
0x321fc577cb26   7e6  428b5c0734           movl rbx,[rdi+r8*1+0x34]
0x321fc577cb2b   7eb  4c897da0             REX.W movq [rbp-0x60],r15
0x321fc577cb2f   7ef  c5fb118540ffffff     vmovsd [rbp-0xc0],xmm0
0x321fc577cb37   7f7  c5f8119d50feffff     vmovups [rbp-0x1b0],xmm3
0x321fc577cb3f   7ff  c5fb11a548ffffff     vmovsd [rbp-0xb8],xmm4
0x321fc577cb47   807  c5f811ad00fcffff     vmovups [rbp-0x400],xmm5
0x321fc577cb4f   80f  4c8965c0             REX.W movq [rbp-0x40],r12
0x321fc577cb53   813  4c8975b8             REX.W movq [rbp-0x48],r14
0x321fc577cb57   817  488945b0             REX.W movq [rbp-0x50],rax
0x321fc577cb5b   81b  48895da8             REX.W movq [rbp-0x58],rbx
0x321fc577cb5f   81f  33c9                 xorl rcx,rcx
0x321fc577cb61   821  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577cb65   825  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577cb6d   82d  488bd1               REX.W movq rdx,rcx
0x321fc577cb70   830  660f1f840000000000   nop
0x321fc577cb79   839  0f1f8000000000       nop
0x321fc577cb80   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577cb84   844  0f8697170000         jna 0x321fc577e321  <+0x1fe1>
0x321fc577cb8a   84a  428b740708           movl rsi,[rdi+r8*1+0x8]
0x321fc577cb8f   84f  4889b548fbffff       REX.W movq [rbp-0x4b8],rsi
0x321fc577cb96   856  3bf2                 cmpl rsi,rdx
0x321fc577cb98   858  0f86e9150000         jna 0x321fc577e187  <+0x1e47>
0x321fc577cb9e   85e  468b4c0714           movl r9,[rdi+r8*1+0x14]
0x321fc577cba3   863  4c898d68fbffff       REX.W movq [rbp-0x498],r9
0x321fc577cbaa   86a  443bca               cmpl r9,rdx
0x321fc577cbad   86d  0f86d4150000         jna 0x321fc577e187  <+0x1e47>
0x321fc577cbb3   873  468b5c0720           movl r11,[rdi+r8*1+0x20]
0x321fc577cbb8   878  4c899d58fbffff       REX.W movq [rbp-0x4a8],r11
0x321fc577cbbf   87f  443bda               cmpl r11,rdx
0x321fc577cbc2   882  0f86bf150000         jna 0x321fc577e187  <+0x1e47>
0x321fc577cbc8   888  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x321fc577cbcd   88d  4c89a570fbffff       REX.W movq [rbp-0x490],r12
0x321fc577cbd4   894  443be2               cmpl r12,rdx
0x321fc577cbd7   897  0f86aa150000         jna 0x321fc577e187  <+0x1e47>
0x321fc577cbdd   89d  468b7c0704           movl r15,[rdi+r8*1+0x4]
0x321fc577cbe2   8a2  458d3497             leal r14,[r15+rdx*4]
0x321fc577cbe6   8a6  c4217a100c37         vmovss xmm9,[rdi+r14*1]
0x321fc577cbec   8ac  468b740710           movl r14,[rdi+r8*1+0x10]
0x321fc577cbf1   8b1  418d0496             leal rax,[r14+rdx*4]
0x321fc577cbf5   8b5  c57a101407           vmovss xmm10,[rdi+rax*1]
0x321fc577cbfa   8ba  428b44071c           movl rax,[rdi+r8*1+0x1c]
0x321fc577cbff   8bf  8d1c90               leal rbx,[rax+rdx*4]
0x321fc577cc02   8c2  c57a101c1f           vmovss xmm11,[rdi+rbx*1]
0x321fc577cc07   8c7  428b5c0728           movl rbx,[rdi+r8*1+0x28]
0x321fc577cc0c   8cc  448d2493             leal r12,[rbx+rdx*4]
0x321fc577cc10   8d0  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577cc14   8d4  c4217a102427         vmovss xmm12,[rdi+r12*1]
0x321fc577cc1a   8da  8b55e0               movl rdx,[rbp-0x20]
0x321fc577cc1d   8dd  c57a1164170c         vmovss [rdi+rdx*1+0xc],xmm12
0x321fc577cc23   8e3  c57a115c1708         vmovss [rdi+rdx*1+0x8],xmm11
0x321fc577cc29   8e9  c57a11541704         vmovss [rdi+rdx*1+0x4],xmm10
0x321fc577cc2f   8ef  c57a110c17           vmovss [rdi+rdx*1],xmm9
0x321fc577cc34   8f4  48c744172000000000   REX.W movq [rdi+rdx*1+0x20],0x0
0x321fc577cc3d   8fd  c44121efdb           vpxor xmm11,xmm11,xmm11
0x321fc577cc42   902  c57a7f5c1710         vmovdqu [rdi+rdx*1+0x10],xmm11
0x321fc577cc48   908  c4217a109c0784000000 vmovss xmm11,[rdi+r8*1+0x84]
0x321fc577cc52   912  c744172800000000     movl [rdi+rdx*1+0x28],0x0
0x321fc577cc5a   91a  468ba4078c000000     movl r12,[rdi+r8*1+0x8c]
0x321fc577cc62   922  33d2                 xorl rdx,rdx
0x321fc577cc64   924  4585e4               testl r12,r12
0x321fc577cc67   927  0f95c2               setnzl dl
0x321fc577cc6a   92a  442be2               subl r12,rdx
0x321fc577cc6d   92d  c4412a59e3           vmulss xmm12,xmm10,xmm11
0x321fc577cc72   932  4c89bd90fbffff       REX.W movq [rbp-0x470],r15
0x321fc577cc79   939  c57b118d30ffffff     vmovsd [rbp-0xd0],xmm9
0x321fc577cc81   941  4c89b560fbffff       REX.W movq [rbp-0x4a0],r14
0x321fc577cc88   948  c57b119538ffffff     vmovsd [rbp-0xc8],xmm10
0x321fc577cc90   950  48898550fbffff       REX.W movq [rbp-0x4b0],rax
0x321fc577cc97   957  48899d78fbffff       REX.W movq [rbp-0x488],rbx
0x321fc577cc9e   95e  c441782ee4           vucomiss xmm12,xmm12
0x321fc577cca3   963  7a06                 jpe 0x321fc577ccab  <+0x96b>
0x321fc577cca5   965  0f8404000000         jz 0x321fc577ccaf  <+0x96f>
0x321fc577ccab   96b  c57928e6             vmovapd xmm12,xmm6
0x321fc577ccaf   96f  c5782ee6             vucomiss xmm12,xmm6
0x321fc577ccb3   973  0f8704000000         ja 0x321fc577ccbd  <+0x97d>
0x321fc577ccb9   979  c57928e6             vmovapd xmm12,xmm6
0x321fc577ccbd   97d  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0x321fc577ccc3   983  c4411a5aec           vcvtss2sd xmm13,xmm12,xmm12
0x321fc577ccc8   988  c443090bf50b         vroundsd xmm14,xmm14,xmm13,0xb
0x321fc577ccce   98e  c4c17b2cd6           vcvttsd2si rdx,xmm14
0x321fc577ccd3   993  85d2                 testl rdx,rdx
0x321fc577ccd5   995  0f8927000000         jns 0x321fc577cd02  <+0x9c2>
0x321fc577ccdb   99b  4c8b159ef7ffff       REX.W movq r10,[rip+0xfffff79e]
0x321fc577cce2   9a2  c441f96efa           vmovq xmm15,r10
0x321fc577cce7   9a7  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x321fc577ccec   9ac  c4c17b2cd7           vcvttsd2si rdx,xmm15
0x321fc577ccf1   9b1  85d2                 testl rdx,rdx
0x321fc577ccf3   9b3  0f8809000000         js 0x321fc577cd02  <+0x9c2>
0x321fc577ccf9   9b9  41ba00000080         movl r10,0x80000000
0x321fc577ccff   9bf  410bd2               orl rdx,r10
0x321fc577cd02   9c2  448bd2               movl r10,rdx
0x321fc577cd05   9c5  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x321fc577cd0a   9ca  c4c1792ece           vucomisd xmm1,xmm14
0x321fc577cd0f   9cf  0f8a46160000         jpe 0x321fc577e35b  <+0x201b>
0x321fc577cd15   9d5  0f8540160000         jnz 0x321fc577e35b  <+0x201b>
0x321fc577cd1b   9db  8bda                 movl rbx,rdx
0x321fc577cd1d   9dd  443be2               cmpl r12,rdx
0x321fc577cd20   9e0  410f42dc             cmovcl rbx,r12
0x321fc577cd24   9e4  41ba0000804f         movl r10,0x4f800000
0x321fc577cd2a   9ea  c441796eea           vmovd xmm13,r10
0x321fc577cd2f   9ef  488bd1               REX.W movq rdx,rcx
0x321fc577cd32   9f2  c441782eec           vucomiss xmm13,xmm12
0x321fc577cd37   9f7  0f47d3               cmoval rdx,rbx
0x321fc577cd3a   9fa  33db                 xorl rbx,rbx
0x321fc577cd3c   9fc  85d2                 testl rdx,rdx
0x321fc577cd3e   9fe  0f95c3               setnzl bl
0x321fc577cd41   a01  448bca               movl r9,rdx
0x321fc577cd44   a04  442bcb               subl r9,rbx
0x321fc577cd47   a07  8d5a01               leal rbx,[rdx+0x1]
0x321fc577cd4a   a0a  8bd3                 movl rdx,rbx
0x321fc577cd4c   a0c  443be3               cmpl r12,rbx
0x321fc577cd4f   a0f  410f42d4             cmovcl rdx,r12
0x321fc577cd53   a13  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x321fc577cd5a   a1a  413bd1               cmpl rdx,r9
0x321fc577cd5d   a1d  0f823a130000         jc 0x321fc577e09d  <+0x1d5d>
0x321fc577cd63   a23  468ba40788000000     movl r12,[rdi+r8*1+0x88]
0x321fc577cd6b   a2b  33db                 xorl rbx,rbx
0x321fc577cd6d   a2d  4585e4               testl r12,r12
0x321fc577cd70   a30  0f95c3               setnzl bl
0x321fc577cd73   a33  4c89a520ffffff       REX.W movq [rbp-0xe0],r12
0x321fc577cd7a   a3a  442be3               subl r12,rbx
0x321fc577cd7d   a3d  c4412259d9           vmulss xmm11,xmm11,xmm9
0x321fc577cd82   a42  c441782edb           vucomiss xmm11,xmm11
0x321fc577cd87   a47  7a06                 jpe 0x321fc577cd8f  <+0xa4f>
0x321fc577cd89   a49  0f8404000000         jz 0x321fc577cd93  <+0xa53>
0x321fc577cd8f   a4f  c57928de             vmovapd xmm11,xmm6
0x321fc577cd93   a53  c5782ede             vucomiss xmm11,xmm6
0x321fc577cd97   a57  0f8704000000         ja 0x321fc577cda1  <+0xa61>
0x321fc577cd9d   a5d  c57928de             vmovapd xmm11,xmm6
0x321fc577cda1   a61  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0x321fc577cda7   a67  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0x321fc577cdac   a6c  c443090bf40b         vroundsd xmm14,xmm14,xmm12,0xb
0x321fc577cdb2   a72  c4c17b2cde           vcvttsd2si rbx,xmm14
0x321fc577cdb7   a77  85db                 testl rbx,rbx
0x321fc577cdb9   a79  0f8927000000         jns 0x321fc577cde6  <+0xaa6>
0x321fc577cdbf   a7f  4c8b15baf6ffff       REX.W movq r10,[rip+0xfffff6ba]
0x321fc577cdc6   a86  c441f96efa           vmovq xmm15,r10
0x321fc577cdcb   a8b  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x321fc577cdd0   a90  c4c17b2cdf           vcvttsd2si rbx,xmm15
0x321fc577cdd5   a95  85db                 testl rbx,rbx
0x321fc577cdd7   a97  0f8809000000         js 0x321fc577cde6  <+0xaa6>
0x321fc577cddd   a9d  41ba00000080         movl r10,0x80000000
0x321fc577cde3   aa3  410bda               orl rbx,r10
0x321fc577cde6   aa6  448bd3               movl r10,rbx
0x321fc577cde9   aa9  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x321fc577cdee   aae  c4c1792ece           vucomisd xmm1,xmm14
0x321fc577cdf3   ab3  0f8a86150000         jpe 0x321fc577e37f  <+0x203f>
0x321fc577cdf9   ab9  0f8580150000         jnz 0x321fc577e37f  <+0x203f>
0x321fc577cdff   abf  8bd3                 movl rdx,rbx
0x321fc577ce01   ac1  443be3               cmpl r12,rbx
0x321fc577ce04   ac4  410f42d4             cmovcl rdx,r12
0x321fc577ce08   ac8  488bd9               REX.W movq rbx,rcx
0x321fc577ce0b   acb  c441782eeb           vucomiss xmm13,xmm11
0x321fc577ce10   ad0  0f47da               cmoval rbx,rdx
0x321fc577ce13   ad3  33d2                 xorl rdx,rdx
0x321fc577ce15   ad5  85db                 testl rbx,rbx
0x321fc577ce17   ad7  0f95c2               setnzl dl
0x321fc577ce1a   ada  448bf3               movl r14,rbx
0x321fc577ce1d   add  442bf2               subl r14,rdx
0x321fc577ce20   ae0  83c301               addl rbx,0x1
0x321fc577ce23   ae3  8bd3                 movl rdx,rbx
0x321fc577ce25   ae5  443be3               cmpl r12,rbx
0x321fc577ce28   ae8  410f42d4             cmovcl rdx,r12
0x321fc577ce2c   aec  448d6201             leal r12,[rdx+0x1]
0x321fc577ce30   af0  c4427918d9           vbroadcastss xmm11,xmm9
0x321fc577ce35   af5  c4427918e2           vbroadcastss xmm12,xmm10
0x321fc577ce3a   afa  428b5c0764           movl rbx,[rdi+r8*1+0x64]
0x321fc577ce3f   aff  428b540768           movl rdx,[rdi+r8*1+0x68]
0x321fc577ce44   b04  4c89b508ffffff       REX.W movq [rbp-0xf8],r14
0x321fc577ce4b   b0b  4c89a5a0fbffff       REX.W movq [rbp-0x460],r12
0x321fc577ce52   b12  c578119de0fbffff     vmovups [rbp-0x420],xmm11
0x321fc577ce5a   b1a  c57811a5f0fbffff     vmovups [rbp-0x410],xmm12
0x321fc577ce62   b22  48899d98fbffff       REX.W movq [rbp-0x468],rbx
0x321fc577ce69   b29  48899500ffffff       REX.W movq [rbp-0x100],rdx
0x321fc577ce70   b30  c57810bd10ffffff     vmovups xmm15,[rbp-0xf0]
0x321fc577ce78   b38  c57811bdc0feffff     vmovups [rbp-0x140],xmm15
0x321fc577ce80   b40  c5fb11b5e8feffff     vmovsd [rbp-0x118],xmm6
0x321fc577ce88   b48  c5fb11b5e0feffff     vmovsd [rbp-0x120],xmm6
0x321fc577ce90   b50  c5fb11b5d8feffff     vmovsd [rbp-0x128],xmm6
0x321fc577ce98   b58  e9a7000000           jmp 0x321fc577cf44  <+0xc04>
0x321fc577ce9d   b5d  660f1f840000000000   nop
0x321fc577cea6   b66  660f1f840000000000   nop
0x321fc577ceaf   b6f  660f1f840000000000   nop
0x321fc577ceb8   b78  0f1f840000000000     nop
0x321fc577cec0   b80  c5f81195c0feffff     vmovups [rbp-0x140],xmm2
0x321fc577cec8   b88  c57b11ade8feffff     vmovsd [rbp-0x118],xmm13
0x321fc577ced0   b90  c57b11b5e0feffff     vmovsd [rbp-0x120],xmm14
0x321fc577ced8   b98  c5fb118dd8feffff     vmovsd [rbp-0x128],xmm1
0x321fc577cee0   ba0  448bcf               movl r9,rdi
0x321fc577cee3   ba3  488bf8               REX.W movq rdi,rax
0x321fc577cee6   ba6  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577ceee   bae  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577cef6   bb6  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577cefe   bbe  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x321fc577cf06   bc6  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x321fc577cf0e   bce  33c9                 xorl rcx,rcx
0x321fc577cf10   bd0  448b9d58fbffff       movl r11,[rbp-0x4a8]
0x321fc577cf17   bd7  8b8550fbffff         movl rax,[rbp-0x4b0]
0x321fc577cf1d   bdd  8bb548fbffff         movl rsi,[rbp-0x4b8]
0x321fc577cf23   be3  448bbd90fbffff       movl r15,[rbp-0x470]
0x321fc577cf2a   bea  8b9d98fbffff         movl rbx,[rbp-0x468]
0x321fc577cf30   bf0  8b9500ffffff         movl rdx,[rbp-0x100]
0x321fc577cf36   bf6  448ba5a0fbffff       movl r12,[rbp-0x460]
0x321fc577cf3d   bfd  448bb508ffffff       movl r14,[rbp-0xf8]
0x321fc577cf44   c04  4c894d80             REX.W movq [rbp-0x80],r9
0x321fc577cf48   c08  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577cf4c   c0c  0f8651140000         jna 0x321fc577e3a3  <+0x2063>
0x321fc577cf52   c12  448b8520ffffff       movl r8,[rbp-0xe0]
0x321fc577cf59   c19  450fafc1             imull r8,r9
0x321fc577cf5d   c1d  478d0c06             leal r9,[r14+r8*1]
0x321fc577cf61   c21  413bd1               cmpl rdx,r9
0x321fc577cf64   c24  0f862a000000         jna 0x321fc577cf94  <+0xc54>
0x321fc577cf6a   c2a  4501e0               addl r8,r12
0x321fc577cf6d   c2d  413bd0               cmpl rdx,r8
0x321fc577cf70   c30  0f861e000000         jna 0x321fc577cf94  <+0xc54>
0x321fc577cf76   c36  468d0483             leal r8,[rbx+r8*4]
0x321fc577cf7a   c3a  468b0407             movl r8,[rdi+r8*1]
0x321fc577cf7e   c3e  468d0c8b             leal r9,[rbx+r9*4]
0x321fc577cf82   c42  468b0c0f             movl r9,[rdi+r9*1]
0x321fc577cf86   c46  458bd1               movl r10,r9
0x321fc577cf89   c49  458bc8               movl r9,r8
0x321fc577cf8c   c4c  458bc2               movl r8,r10
0x321fc577cf8f   c4f  e906000000           jmp 0x321fc577cf9a  <+0xc5a>
0x321fc577cf94   c54  4c8bc9               REX.W movq r9,rcx
0x321fc577cf97   c57  4c8bc1               REX.W movq r8,rcx
0x321fc577cf9a   c5a  478d2487             leal r12,[r15+r8*4]
0x321fc577cf9e   c5e  458bf9               movl r15,r9
0x321fc577cfa1   c61  452bf8               subl r15,r8
0x321fc577cfa4   c64  4533f6               xorl r14,r14
0x321fc577cfa7   c67  413bf1               cmpl rsi,r9
0x321fc577cfaa   c6a  410f92c6             setcl r14l
0x321fc577cfae   c6e  33db                 xorl rbx,rbx
0x321fc577cfb0   c70  453bc8               cmpl r9,r8
0x321fc577cfb3   c73  0f92c3               setcl bl
0x321fc577cfb6   c76  498bd6               REX.W movq rdx,r14
0x321fc577cfb9   c79  0bd3                 orl rdx,rbx
0x321fc577cfbb   c7b  418bf7               movl rsi,r15
0x321fc577cfbe   c7e  85d2                 testl rdx,rdx
0x321fc577cfc0   c80  0f45f1               cmovnzl rsi,rcx
0x321fc577cfc3   c83  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x321fc577cfca   c8a  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0x321fc577cfd1   c91  48899dd0feffff       REX.W movq [rbp-0x130],rbx
0x321fc577cfd8   c98  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0x321fc577cfdf   c9f  453bc8               cmpl r9,r8
0x321fc577cfe2   ca2  0f82aa000000         jc 0x321fc577d092  <+0xd52>
0x321fc577cfe8   ca8  428d1480             leal rdx,[rax+r8*4]
0x321fc577cfec   cac  b804000000           movl rax,0x4
0x321fc577cff1   cb1  453bd9               cmpl r11,r9
0x321fc577cff4   cb4  0f42d0               cmovcl rdx,rax
0x321fc577cff7   cb7  418bf7               movl rsi,r15
0x321fc577cffa   cba  453bd9               cmpl r11,r9
0x321fc577cffd   cbd  0f42f1               cmovcl rsi,rcx
0x321fc577d000   cc0  448bde               movl r11,rsi
0x321fc577d003   cc3  4181e3f0ffff1f       andl r11,0x1ffffff0
0x321fc577d00a   cca  468d1c9a             leal r11,[rdx+r11*4]
0x321fc577d00e   cce  8bbd60fbffff         movl rdi,[rbp-0x4a0]
0x321fc577d014   cd4  468d2487             leal r12,[rdi+r8*4]
0x321fc577d018   cd8  8bbd68fbffff         movl rdi,[rbp-0x498]
0x321fc577d01e   cde  413bf9               cmpl rdi,r9
0x321fc577d021   ce1  440f42e0             cmovcl r12,rax
0x321fc577d025   ce5  458bf7               movl r14,r15
0x321fc577d028   ce8  413bf9               cmpl rdi,r9
0x321fc577d02b   ceb  440f42f1             cmovcl r14,rcx
0x321fc577d02f   cef  418bfe               movl rdi,r14
0x321fc577d032   cf2  81e7f0ffff1f         andl rdi,0x1ffffff0
0x321fc577d038   cf8  418d3cbc             leal rdi,[r12+rdi*4]
0x321fc577d03c   cfc  8bde                 movl rbx,rsi
0x321fc577d03e   cfe  c1eb04               shrl rbx, 4
0x321fc577d041   d01  83e60f               andl rsi,0xf
0x321fc577d044   d04  4889bd88fbffff       REX.W movq [rbp-0x478],rdi
0x321fc577d04b   d0b  418bfe               movl rdi,r14
0x321fc577d04e   d0e  c1ef04               shrl rdi, 4
0x321fc577d051   d11  4183e60f             andl r14,0xf
0x321fc577d055   d15  4889bd80fbffff       REX.W movq [rbp-0x480],rdi
0x321fc577d05c   d1c  8bbd70fbffff         movl rdi,[rbp-0x490]
0x321fc577d062   d22  413bf9               cmpl rdi,r9
0x321fc577d065   d25  0f8219000000         jc 0x321fc577d084  <+0xd44>
0x321fc577d06b   d2b  448b8d78fbffff       movl r9,[rbp-0x488]
0x321fc577d072   d32  478d0481             leal r8,[r9+r8*4]
0x321fc577d076   d36  4589e2               movl r10,r12
0x321fc577d079   d39  458be7               movl r12,r15
0x321fc577d07c   d3c  458bfa               movl r15,r10
0x321fc577d07f   d3f  e939000000           jmp 0x321fc577d0bd  <+0xd7d>
0x321fc577d084   d44  4589e7               movl r15,r12
0x321fc577d087   d47  4c8be1               REX.W movq r12,rcx
0x321fc577d08a   d4a  4c8bc0               REX.W movq r8,rax
0x321fc577d08d   d4d  e92b000000           jmp 0x321fc577d0bd  <+0xd7d>
0x321fc577d092   d52  4c8be1               REX.W movq r12,rcx
0x321fc577d095   d55  488bf1               REX.W movq rsi,rcx
0x321fc577d098   d58  b804000000           movl rax,0x4
0x321fc577d09d   d5d  4c8bf1               REX.W movq r14,rcx
0x321fc577d0a0   d60  48898d80fbffff       REX.W movq [rbp-0x480],rcx
0x321fc577d0a7   d67  488bd9               REX.W movq rbx,rcx
0x321fc577d0aa   d6a  488bd0               REX.W movq rdx,rax
0x321fc577d0ad   d6d  4c8bc0               REX.W movq r8,rax
0x321fc577d0b0   d70  4c8bd8               REX.W movq r11,rax
0x321fc577d0b3   d73  4c8bf8               REX.W movq r15,rax
0x321fc577d0b6   d76  48898588fbffff       REX.W movq [rbp-0x478],rax
0x321fc577d0bd   d7d  4c8b8dd0feffff       REX.W movq r9,[rbp-0x130]
0x321fc577d0c4   d84  440b8db8feffff       orl r9,[rbp-0x148]
0x321fc577d0cb   d8b  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x321fc577d0d1   d91  4585c9               testl r9,r9
0x321fc577d0d4   d94  0f45f8               cmovnzl rdi,rax
0x321fc577d0d7   d97  4489e0               movl rax,r12
0x321fc577d0da   d9a  c1e804               shrl rax, 4
0x321fc577d0dd   d9d  448b8d50ffffff       movl r9,[rbp-0xb0]
0x321fc577d0e4   da4  41c1e904             shrl r9, 4
0x321fc577d0e8   da8  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x321fc577d0ef   daf  4c89a560ffffff       REX.W movq [rbp-0xa0],r12
0x321fc577d0f6   db6  458bd9               movl r11,r9
0x321fc577d0f9   db9  448ba580fbffff       movl r12,[rbp-0x480]
0x321fc577d100   dc0  453be1               cmpl r12,r9
0x321fc577d103   dc3  450f42dc             cmovcl r11,r12
0x321fc577d107   dc7  458be3               movl r12,r11
0x321fc577d10a   dca  413bdb               cmpl rbx,r11
0x321fc577d10d   dcd  440f42e3             cmovcl r12,rbx
0x321fc577d111   dd1  4589e3               movl r11,r12
0x321fc577d114   dd4  4439e0               cmpl rax,r12
0x321fc577d117   dd7  440f42d8             cmovcl r11,rax
0x321fc577d11b   ddb  4585db               testl r11,r11
0x321fc577d11e   dde  0f85ad000000         jnz 0x321fc577d1d1  <+0xe91>
0x321fc577d124   de4  c5f9efc0             vpxor xmm0,xmm0,xmm0
0x321fc577d128   de8  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x321fc577d130   df0  c5f8118550fdffff     vmovups [rbp-0x2b0],xmm0
0x321fc577d138   df8  c5f8118500fdffff     vmovups [rbp-0x300],xmm0
0x321fc577d140   e00  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x321fc577d148   e08  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x321fc577d150   e10  c5f8118530fdffff     vmovups [rbp-0x2d0],xmm0
0x321fc577d158   e18  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x321fc577d160   e20  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x321fc577d168   e28  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x321fc577d170   e30  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x321fc577d178   e38  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x321fc577d180   e40  c5f8118580fcffff     vmovups [rbp-0x380],xmm0
0x321fc577d188   e48  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x321fc577d190   e50  c5f928f8             vmovapd xmm7,xmm0
0x321fc577d194   e54  c57928e0             vmovapd xmm12,xmm0
0x321fc577d198   e58  c57928d0             vmovapd xmm10,xmm0
0x321fc577d19c   e5c  c57928f0             vmovapd xmm14,xmm0
0x321fc577d1a0   e60  488b45c8             REX.W movq rax,[rbp-0x38]
0x321fc577d1a4   e64  c5f928d0             vmovapd xmm2,xmm0
0x321fc577d1a8   e68  c5f928c8             vmovapd xmm1,xmm0
0x321fc577d1ac   e6c  c5f928e8             vmovapd xmm5,xmm0
0x321fc577d1b0   e70  c57928d8             vmovapd xmm11,xmm0
0x321fc577d1b4   e74  c5f928d8             vmovapd xmm3,xmm0
0x321fc577d1b8   e78  c5f928e0             vmovapd xmm4,xmm0
0x321fc577d1bc   e7c  c57928c0             vmovapd xmm8,xmm0
0x321fc577d1c0   e80  c5f928f0             vmovapd xmm6,xmm0
0x321fc577d1c4   e84  c57928c8             vmovapd xmm9,xmm0
0x321fc577d1c8   e88  c57928e8             vmovapd xmm13,xmm0
0x321fc577d1cc   e8c  e917070000           jmp 0x321fc577d8e8  <+0x15a8>
0x321fc577d1d1   e91  c5f9efc0             vpxor xmm0,xmm0,xmm0
0x321fc577d1d5   e95  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x321fc577d1dd   e9d  c5f8118550fdffff     vmovups [rbp-0x2b0],xmm0
0x321fc577d1e5   ea5  c5f8118500fdffff     vmovups [rbp-0x300],xmm0
0x321fc577d1ed   ead  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x321fc577d1f5   eb5  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x321fc577d1fd   ebd  c5f8118530fdffff     vmovups [rbp-0x2d0],xmm0
0x321fc577d205   ec5  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x321fc577d20d   ecd  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x321fc577d215   ed5  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x321fc577d21d   edd  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x321fc577d225   ee5  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x321fc577d22d   eed  c5f8118580fcffff     vmovups [rbp-0x380],xmm0
0x321fc577d235   ef5  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x321fc577d23d   efd  c5f8118510fdffff     vmovups [rbp-0x2f0],xmm0
0x321fc577d245   f05  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x321fc577d24d   f0d  c5f8118570fcffff     vmovups [rbp-0x390],xmm0
0x321fc577d255   f15  c5f81185b0fbffff     vmovups [rbp-0x450],xmm0
0x321fc577d25d   f1d  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x321fc577d265   f25  c5f81185d0fbffff     vmovups [rbp-0x430],xmm0
0x321fc577d26d   f2d  c5f81185c0fbffff     vmovups [rbp-0x440],xmm0
0x321fc577d275   f35  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x321fc577d27d   f3d  c5f81185a0feffff     vmovups [rbp-0x160],xmm0
0x321fc577d285   f45  c5f8118540feffff     vmovups [rbp-0x1c0],xmm0
0x321fc577d28d   f4d  c5f81185f0fdffff     vmovups [rbp-0x210],xmm0
0x321fc577d295   f55  c5f8118580fdffff     vmovups [rbp-0x280],xmm0
0x321fc577d29d   f5d  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x321fc577d2a5   f65  c5f8118520feffff     vmovups [rbp-0x1e0],xmm0
0x321fc577d2ad   f6d  c5f81185d0fdffff     vmovups [rbp-0x230],xmm0
0x321fc577d2b5   f75  488b45c8             REX.W movq rax,[rbp-0x38]
0x321fc577d2b9   f79  4c8be1               REX.W movq r12,rcx
0x321fc577d2bc   f7c  e9bf000000           jmp 0x321fc577d380  <+0x1040>
0x321fc577d2c1   f81  660f1f840000000000   nop
0x321fc577d2ca   f8a  660f1f840000000000   nop
0x321fc577d2d3   f93  660f1f840000000000   nop
0x321fc577d2dc   f9c  660f1f840000000000   nop
0x321fc577d2e5   fa5  660f1f840000000000   nop
0x321fc577d2ee   fae  660f1f840000000000   nop
0x321fc577d2f7   fb7  660f1f840000000000   nop
0x321fc577d300   fc0  c578119da0feffff     vmovups [rbp-0x160],xmm11
0x321fc577d308   fc8  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x321fc577d310   fd0  c5f811ad50fdffff     vmovups [rbp-0x2b0],xmm5
0x321fc577d318   fd8  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x321fc577d320   fe0  c5781195a0fcffff     vmovups [rbp-0x360],xmm10
0x321fc577d328   fe8  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577d330   ff0  c578118530fdffff     vmovups [rbp-0x2d0],xmm8
0x321fc577d338   ff8  c5f8119d80feffff     vmovups [rbp-0x180],xmm3
0x321fc577d340  1000  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577d348  1008  c5f811b590fcffff     vmovups [rbp-0x370],xmm6
0x321fc577d350  1010  c5f8119540fcffff     vmovups [rbp-0x3c0],xmm2
0x321fc577d358  1018  c57811add0fdffff     vmovups [rbp-0x230],xmm13
0x321fc577d360  1020  c578118d20feffff     vmovups [rbp-0x1e0],xmm9
0x321fc577d368  1028  c5f8118d80fdffff     vmovups [rbp-0x280],xmm1
0x321fc577d370  1030  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0x321fc577d378  1038  c57811b5b0fcffff     vmovups [rbp-0x350],xmm14
0x321fc577d380  1040  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577d384  1044  0f8689100000         jna 0x321fc577e413  <+0x20d3>
0x321fc577d38a  104a  418d1c3c             leal rbx,[r12+rdi*1]
0x321fc577d38e  104e  c5fa6f2418           vmovdqu xmm4,[rax+rbx*1]
0x321fc577d393  1053  c5a05cf4             vsubps xmm6,xmm11,xmm4
0x321fc577d397  1057  c54859c6             vmulps xmm8,xmm6,xmm6
0x321fc577d39b  105b  478d0c3c             leal r9,[r12+r15*1]
0x321fc577d39f  105f  c4217a6f0c08         vmovdqu xmm9,[rax+r9*1]
0x321fc577d3a5  1065  c441185cd1           vsubps xmm10,xmm12,xmm9
0x321fc577d3aa  106a  c4412859ea           vmulps xmm13,xmm10,xmm10
0x321fc577d3af  106f  c4413858c5           vaddps xmm8,xmm8,xmm13
0x321fc577d3b4  1074  c44160c2e802         vcmpps xmm13,xmm3,xmm8, (le)
0x321fc577d3ba  107a  c538c2f501           vcmpps xmm14,xmm8,xmm5, (lt)
0x321fc577d3bf  107f  c44111dbee           vpand xmm13,xmm13,xmm14
0x321fc577d3c4  1084  c44178c2f001         vcmpps xmm14,xmm0,xmm8, (lt)
0x321fc577d3ca  108a  c509dbf7             vpand xmm14,xmm14,xmm7
0x321fc577d3ce  108e  c441785bf6           vcvtdq2ps xmm14,xmm14
0x321fc577d3d3  1093  c44111dbee           vpand xmm13,xmm13,xmm14
0x321fc577d3d8  1098  c57810b5b0fbffff     vmovups xmm14,[rbp-0x450]
0x321fc577d3e0  10a0  c4411058f6           vaddps xmm14,xmm13,xmm14
0x321fc577d3e5  10a5  8d4b30               leal rcx,[rbx+0x30]
0x321fc577d3e8  10a8  c57811b5b0fbffff     vmovups [rbp-0x450],xmm14
0x321fc577d3f0  10b0  c57a6f3408           vmovdqu xmm14,[rax+rcx*1]
0x321fc577d3f5  10b5  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x321fc577d3fd  10bd  c4c1205cf6           vsubps xmm6,xmm11,xmm14
0x321fc577d402  10c2  c5c859ce             vmulps xmm1,xmm6,xmm6
0x321fc577d406  10c6  418d4930             leal rcx,[r9+0x30]
0x321fc577d40a  10ca  c5f811b5e0fdffff     vmovups [rbp-0x220],xmm6
0x321fc577d412  10d2  c5fa6f3408           vmovdqu xmm6,[rax+rcx*1]
0x321fc577d417  10d7  c578119570fdffff     vmovups [rbp-0x290],xmm10
0x321fc577d41f  10df  c5185cd6             vsubps xmm10,xmm12,xmm6
0x321fc577d423  10e3  c578118560fdffff     vmovups [rbp-0x2a0],xmm8
0x321fc577d42b  10eb  c4412859c2           vmulps xmm8,xmm10,xmm10
0x321fc577d430  10f0  c4417058c0           vaddps xmm8,xmm1,xmm8
0x321fc577d435  10f5  c4c160c2c802         vcmpps xmm1,xmm3,xmm8, (le)
0x321fc577d43b  10fb  c5781195c0fdffff     vmovups [rbp-0x240],xmm10
0x321fc577d443  1103  c538c2d501           vcmpps xmm10,xmm8,xmm5, (lt)
0x321fc577d448  1108  c44171dbd2           vpand xmm10,xmm1,xmm10
0x321fc577d44d  110d  c4c178c2c801         vcmpps xmm1,xmm0,xmm8, (lt)
0x321fc577d453  1113  c5f1dbcf             vpand xmm1,xmm1,xmm7
0x321fc577d457  1117  c5f85bc9             vcvtdq2ps xmm1,xmm1
0x321fc577d45b  111b  c529dbd1             vpand xmm10,xmm10,xmm1
0x321fc577d45f  111f  c5f8108dc0fbffff     vmovups xmm1,[rbp-0x440]
0x321fc577d467  1127  c5a858c9             vaddps xmm1,xmm10,xmm1
0x321fc577d46b  112b  8d4b20               leal rcx,[rbx+0x20]
0x321fc577d46e  112e  c5f8118dc0fbffff     vmovups [rbp-0x440],xmm1
0x321fc577d476  1136  c5fa6f0c08           vmovdqu xmm1,[rax+rcx*1]
0x321fc577d47b  113b  c5781185b0fdffff     vmovups [rbp-0x250],xmm8
0x321fc577d483  1143  c5205cc1             vsubps xmm8,xmm11,xmm1
0x321fc577d487  1147  c4c13859d0           vmulps xmm2,xmm8,xmm8
0x321fc577d48c  114c  418d4920             leal rcx,[r9+0x20]
0x321fc577d490  1150  c578118530feffff     vmovups [rbp-0x1d0],xmm8
0x321fc577d498  1158  c57a6f0408           vmovdqu xmm8,[rax+rcx*1]
0x321fc577d49d  115d  c5f8118df0fcffff     vmovups [rbp-0x310],xmm1
0x321fc577d4a5  1165  c4c1185cc8           vsubps xmm1,xmm12,xmm8
0x321fc577d4aa  116a  c5781185d0fcffff     vmovups [rbp-0x330],xmm8
0x321fc577d4b2  1172  c57059c1             vmulps xmm8,xmm1,xmm1
0x321fc577d4b6  1176  c4416858c0           vaddps xmm8,xmm2,xmm8
0x321fc577d4bb  117b  c4c160c2d002         vcmpps xmm2,xmm3,xmm8, (le)
0x321fc577d4c1  1181  c5f8118d10feffff     vmovups [rbp-0x1f0],xmm1
0x321fc577d4c9  1189  c5b8c2cd01           vcmpps xmm1,xmm8,xmm5, (lt)
0x321fc577d4ce  118e  c5e9dbc9             vpand xmm1,xmm2,xmm1
0x321fc577d4d2  1192  c4c178c2d001         vcmpps xmm2,xmm0,xmm8, (lt)
0x321fc577d4d8  1198  c5e9dbd7             vpand xmm2,xmm2,xmm7
0x321fc577d4dc  119c  c5f85bd2             vcvtdq2ps xmm2,xmm2
0x321fc577d4e0  11a0  c5f1dbca             vpand xmm1,xmm1,xmm2
0x321fc577d4e4  11a4  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x321fc577d4ec  11ac  c5f058d2             vaddps xmm2,xmm1,xmm2
0x321fc577d4f0  11b0  83c310               addl rbx,0x10
0x321fc577d4f3  11b3  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x321fc577d4fb  11bb  c5fa6f1418           vmovdqu xmm2,[rax+rbx*1]
0x321fc577d500  11c0  c578118500feffff     vmovups [rbp-0x200],xmm8
0x321fc577d508  11c8  c5205cc2             vsubps xmm8,xmm11,xmm2
0x321fc577d50c  11cc  c4413859d8           vmulps xmm11,xmm8,xmm8
0x321fc577d511  11d1  418d5910             leal rbx,[r9+0x10]
0x321fc577d515  11d5  c578118590feffff     vmovups [rbp-0x170],xmm8
0x321fc577d51d  11dd  c57a6f0418           vmovdqu xmm8,[rax+rbx*1]
0x321fc577d522  11e2  c5f8119540fdffff     vmovups [rbp-0x2c0],xmm2
0x321fc577d52a  11ea  c4c1185cd0           vsubps xmm2,xmm12,xmm8
0x321fc577d52f  11ef  c56859e2             vmulps xmm12,xmm2,xmm2
0x321fc577d533  11f3  c4412058dc           vaddps xmm11,xmm11,xmm12
0x321fc577d538  11f8  c44160c2e302         vcmpps xmm12,xmm3,xmm11, (le)
0x321fc577d53e  11fe  c5f8119570feffff     vmovups [rbp-0x190],xmm2
0x321fc577d546  1206  c5a0c2d501           vcmpps xmm2,xmm11,xmm5, (lt)
0x321fc577d54b  120b  c519dbe2             vpand xmm12,xmm12,xmm2
0x321fc577d54f  120f  c4c178c2d301         vcmpps xmm2,xmm0,xmm11, (lt)
0x321fc577d555  1215  c5e9dbd7             vpand xmm2,xmm2,xmm7
0x321fc577d559  1219  c5f85bd2             vcvtdq2ps xmm2,xmm2
0x321fc577d55d  121d  c519dbe2             vpand xmm12,xmm12,xmm2
0x321fc577d561  1221  c5f8109520fcffff     vmovups xmm2,[rbp-0x3e0]
0x321fc577d569  1229  c59858d2             vaddps xmm2,xmm12,xmm2
0x321fc577d56d  122d  438d1c04             leal rbx,[r12+r8*1]
0x321fc577d571  1231  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x321fc577d576  1236  c4c15059ed           vmulps xmm5,xmm5,xmm13
0x321fc577d57b  123b  c5f8119520fcffff     vmovups [rbp-0x3e0],xmm2
0x321fc577d583  1243  c5f8109530fcffff     vmovups xmm2,[rbp-0x3d0]
0x321fc577d58b  124b  c5d058d2             vaddps xmm2,xmm5,xmm2
0x321fc577d58f  124f  418d0c14             leal rcx,[r12+rdx*1]
0x321fc577d593  1253  c5fa6f2c08           vmovdqu xmm5,[rax+rcx*1]
0x321fc577d598  1258  c4c15059ed           vmulps xmm5,xmm5,xmm13
0x321fc577d59d  125d  c5f8119530fcffff     vmovups [rbp-0x3d0],xmm2
0x321fc577d5a5  1265  c5f8109540fcffff     vmovups xmm2,[rbp-0x3c0]
0x321fc577d5ad  126d  c5d058d2             vaddps xmm2,xmm5,xmm2
0x321fc577d5b1  1271  c4c13059ed           vmulps xmm5,xmm9,xmm13
0x321fc577d5b6  1276  c578108d50fcffff     vmovups xmm9,[rbp-0x3b0]
0x321fc577d5be  127e  c4415058c9           vaddps xmm9,xmm5,xmm9
0x321fc577d5c3  1283  c4c15859e5           vmulps xmm4,xmm4,xmm13
0x321fc577d5c8  1288  c5f810ad60fcffff     vmovups xmm5,[rbp-0x3a0]
0x321fc577d5d0  1290  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d5d4  1294  448d4b30             leal r9,[rbx+0x30]
0x321fc577d5d8  1298  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x321fc577d5de  129e  c4c15059ea           vmulps xmm5,xmm5,xmm10
0x321fc577d5e3  12a3  c57810ad70fcffff     vmovups xmm13,[rbp-0x390]
0x321fc577d5eb  12ab  c4415058ed           vaddps xmm13,xmm5,xmm13
0x321fc577d5f0  12b0  448d4930             leal r9,[rcx+0x30]
0x321fc577d5f4  12b4  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x321fc577d5fa  12ba  c4c15059ea           vmulps xmm5,xmm5,xmm10
0x321fc577d5ff  12bf  c5f811a560fcffff     vmovups [rbp-0x3a0],xmm4
0x321fc577d607  12c7  c5f810a580fcffff     vmovups xmm4,[rbp-0x380]
0x321fc577d60f  12cf  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d613  12d3  c4c14859ea           vmulps xmm5,xmm6,xmm10
0x321fc577d618  12d8  c5f810b590fcffff     vmovups xmm6,[rbp-0x370]
0x321fc577d620  12e0  c5d058f6             vaddps xmm6,xmm5,xmm6
0x321fc577d624  12e4  c4c10859ea           vmulps xmm5,xmm14,xmm10
0x321fc577d629  12e9  c5781095a0fcffff     vmovups xmm10,[rbp-0x360]
0x321fc577d631  12f1  c52858d5             vaddps xmm10,xmm10,xmm5
0x321fc577d635  12f5  448d4b20             leal r9,[rbx+0x20]
0x321fc577d639  12f9  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x321fc577d63f  12ff  c5d059e9             vmulps xmm5,xmm5,xmm1
0x321fc577d643  1303  c57810b5b0fcffff     vmovups xmm14,[rbp-0x350]
0x321fc577d64b  130b  c4415058f6           vaddps xmm14,xmm5,xmm14
0x321fc577d650  1310  448d4920             leal r9,[rcx+0x20]
0x321fc577d654  1314  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x321fc577d65a  131a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x321fc577d65e  131e  c5f811a580fcffff     vmovups [rbp-0x380],xmm4
0x321fc577d666  1326  c5f810a5c0fcffff     vmovups xmm4,[rbp-0x340]
0x321fc577d66e  132e  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d672  1332  c5f810add0fcffff     vmovups xmm5,[rbp-0x330]
0x321fc577d67a  133a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x321fc577d67e  133e  c5f811a5c0fcffff     vmovups [rbp-0x340],xmm4
0x321fc577d686  1346  c5f810a5e0fcffff     vmovups xmm4,[rbp-0x320]
0x321fc577d68e  134e  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d692  1352  c5f810adf0fcffff     vmovups xmm5,[rbp-0x310]
0x321fc577d69a  135a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x321fc577d69e  135e  c5f8108d00fdffff     vmovups xmm1,[rbp-0x300]
0x321fc577d6a6  1366  c5f058cd             vaddps xmm1,xmm1,xmm5
0x321fc577d6aa  136a  83c310               addl rbx,0x10
0x321fc577d6ad  136d  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x321fc577d6b2  1372  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x321fc577d6b7  1377  c5f811a5e0fcffff     vmovups [rbp-0x320],xmm4
0x321fc577d6bf  137f  c5f810a510fdffff     vmovups xmm4,[rbp-0x2f0]
0x321fc577d6c7  1387  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d6cb  138b  8d5910               leal rbx,[rcx+0x10]
0x321fc577d6ce  138e  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x321fc577d6d3  1393  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x321fc577d6d8  1398  c5f811a510fdffff     vmovups [rbp-0x2f0],xmm4
0x321fc577d6e0  13a0  c5f810a520fdffff     vmovups xmm4,[rbp-0x2e0]
0x321fc577d6e8  13a8  c5d058e4             vaddps xmm4,xmm5,xmm4
0x321fc577d6ec  13ac  c4c13859ec           vmulps xmm5,xmm8,xmm12
0x321fc577d6f1  13b1  c578108530fdffff     vmovups xmm8,[rbp-0x2d0]
0x321fc577d6f9  13b9  c4415058c0           vaddps xmm8,xmm5,xmm8
0x321fc577d6fe  13be  c5f810ad40fdffff     vmovups xmm5,[rbp-0x2c0]
0x321fc577d706  13c6  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x321fc577d70b  13cb  c57810a550fdffff     vmovups xmm12,[rbp-0x2b0]
0x321fc577d713  13d3  c59858ed             vaddps xmm5,xmm12,xmm5
0x321fc577d717  13d7  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x321fc577d71f  13df  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x321fc577d724  13e4  c519dbe7             vpand xmm12,xmm12,xmm7
0x321fc577d728  13e8  c441785be4           vcvtdq2ps xmm12,xmm12
0x321fc577d72d  13ed  c5f811a520fdffff     vmovups [rbp-0x2e0],xmm4
0x321fc577d735  13f5  c5f810a570fdffff     vmovups xmm4,[rbp-0x290]
0x321fc577d73d  13fd  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d742  1402  c5f8118d00fdffff     vmovups [rbp-0x300],xmm1
0x321fc577d74a  140a  c5f8108d80fdffff     vmovups xmm1,[rbp-0x280]
0x321fc577d752  1412  c5f058cc             vaddps xmm1,xmm1,xmm4
0x321fc577d756  1416  c5f810a590fdffff     vmovups xmm4,[rbp-0x270]
0x321fc577d75e  141e  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d763  1423  c57810a5a0fdffff     vmovups xmm12,[rbp-0x260]
0x321fc577d76b  142b  c59858e4             vaddps xmm4,xmm12,xmm4
0x321fc577d76f  142f  c57810a5b0fdffff     vmovups xmm12,[rbp-0x250]
0x321fc577d777  1437  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x321fc577d77c  143c  c519dbe7             vpand xmm12,xmm12,xmm7
0x321fc577d780  1440  c441785be4           vcvtdq2ps xmm12,xmm12
0x321fc577d785  1445  c5f811a5a0fdffff     vmovups [rbp-0x260],xmm4
0x321fc577d78d  144d  c5f810a5c0fdffff     vmovups xmm4,[rbp-0x240]
0x321fc577d795  1455  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d79a  145a  c57811ad70fcffff     vmovups [rbp-0x390],xmm13
0x321fc577d7a2  1462  c57810add0fdffff     vmovups xmm13,[rbp-0x230]
0x321fc577d7aa  146a  c51058ec             vaddps xmm13,xmm13,xmm4
0x321fc577d7ae  146e  c5f810a5e0fdffff     vmovups xmm4,[rbp-0x220]
0x321fc577d7b6  1476  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d7bb  147b  c57810a5f0fdffff     vmovups xmm12,[rbp-0x210]
0x321fc577d7c3  1483  c59858e4             vaddps xmm4,xmm12,xmm4
0x321fc577d7c7  1487  c57810a500feffff     vmovups xmm12,[rbp-0x200]
0x321fc577d7cf  148f  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x321fc577d7d4  1494  c519dbe7             vpand xmm12,xmm12,xmm7
0x321fc577d7d8  1498  c441785be4           vcvtdq2ps xmm12,xmm12
0x321fc577d7dd  149d  c5f811a5f0fdffff     vmovups [rbp-0x210],xmm4
0x321fc577d7e5  14a5  c5f810a510feffff     vmovups xmm4,[rbp-0x1f0]
0x321fc577d7ed  14ad  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d7f2  14b2  c578118d50fcffff     vmovups [rbp-0x3b0],xmm9
0x321fc577d7fa  14ba  c578108d20feffff     vmovups xmm9,[rbp-0x1e0]
0x321fc577d802  14c2  c53058cc             vaddps xmm9,xmm9,xmm4
0x321fc577d806  14c6  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x321fc577d80e  14ce  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x321fc577d813  14d3  c57810a540feffff     vmovups xmm12,[rbp-0x1c0]
0x321fc577d81b  14db  c59858e4             vaddps xmm4,xmm12,xmm4
0x321fc577d81f  14df  c520c2db01           vcmpps xmm11,xmm11,xmm3, (lt)
0x321fc577d824  14e4  c521dbdf             vpand xmm11,xmm11,xmm7
0x321fc577d828  14e8  c441785bdb           vcvtdq2ps xmm11,xmm11
0x321fc577d82d  14ed  c57810a570feffff     vmovups xmm12,[rbp-0x190]
0x321fc577d835  14f5  c4411859e3           vmulps xmm12,xmm12,xmm11
0x321fc577d83a  14fa  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x321fc577d842  1502  c4c16058dc           vaddps xmm3,xmm3,xmm12
0x321fc577d847  1507  c57810a590feffff     vmovups xmm12,[rbp-0x170]
0x321fc577d84f  150f  c4411859db           vmulps xmm11,xmm12,xmm11
0x321fc577d854  1514  c57810a5a0feffff     vmovups xmm12,[rbp-0x160]
0x321fc577d85c  151c  c4411858db           vaddps xmm11,xmm12,xmm11
0x321fc577d861  1521  4183c440             addl r12,0x40
0x321fc577d865  1525  4183c3ff             addl r11,0xff
0x321fc577d869  1529  0f8591faffff         jnz 0x321fc577d300  <+0xfc0>
0x321fc577d86f  152f  c5f811b590fcffff     vmovups [rbp-0x370],xmm6
0x321fc577d877  1537  c5f928f3             vmovapd xmm6,xmm3
0x321fc577d87b  153b  c5f811ad50fdffff     vmovups [rbp-0x2b0],xmm5
0x321fc577d883  1543  c578118530fdffff     vmovups [rbp-0x2d0],xmm8
0x321fc577d88b  154b  c57928c1             vmovapd xmm8,xmm1
0x321fc577d88f  154f  c5781195a0fcffff     vmovups [rbp-0x360],xmm10
0x321fc577d897  1557  c5f928dc             vmovapd xmm3,xmm4
0x321fc577d89b  155b  c5f810a5f0fdffff     vmovups xmm4,[rbp-0x210]
0x321fc577d8a3  1563  c5f8119540fcffff     vmovups [rbp-0x3c0],xmm2
0x321fc577d8ab  156b  c5f810ada0fdffff     vmovups xmm5,[rbp-0x260]
0x321fc577d8b3  1573  c5f8108dc0fbffff     vmovups xmm1,[rbp-0x440]
0x321fc577d8bb  157b  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x321fc577d8c3  1583  c5f8108520fcffff     vmovups xmm0,[rbp-0x3e0]
0x321fc577d8cb  158b  c5f810bd10fdffff     vmovups xmm7,[rbp-0x2f0]
0x321fc577d8d3  1593  c4417928e6           vmovapd xmm12,xmm14
0x321fc577d8d8  1598  c578109570fcffff     vmovups xmm10,[rbp-0x390]
0x321fc577d8e0  15a0  c57810b5b0fbffff     vmovups xmm14,[rbp-0x450]
0x321fc577d8e8  15a8  c5f8118dc0fbffff     vmovups [rbp-0x440],xmm1
0x321fc577d8f0  15b0  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x321fc577d8f8  15b8  c5f8108d60fcffff     vmovups xmm1,[rbp-0x3a0]
0x321fc577d900  15c0  c5f828d1             vmovaps xmm2,xmm1
0x321fc577d904  15c4  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x321fc577d90c  15cc  c5fa16c1             vmovshdup xmm0,xmm1
0x321fc577d910  15d0  c5fa58c2             vaddss xmm0,xmm0,xmm2
0x321fc577d914  15d4  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577d919  15d9  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d91d  15dd  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577d922  15e2  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d926  15e6  c5f8109550fdffff     vmovups xmm2,[rbp-0x2b0]
0x321fc577d92e  15ee  c5f828ca             vmovaps xmm1,xmm2
0x321fc577d932  15f2  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d936  15f6  c5fa16ca             vmovshdup xmm1,xmm2
0x321fc577d93a  15fa  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d93e  15fe  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x321fc577d943  1603  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d947  1607  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x321fc577d94c  160c  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d950  1610  c5f8108d00fdffff     vmovups xmm1,[rbp-0x300]
0x321fc577d958  1618  c5f828d1             vmovaps xmm2,xmm1
0x321fc577d95c  161c  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d960  1620  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577d964  1624  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d968  1628  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577d96d  162d  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d971  1631  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577d976  1636  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d97a  163a  c5f8108da0fcffff     vmovups xmm1,[rbp-0x360]
0x321fc577d982  1642  c5f828d1             vmovaps xmm2,xmm1
0x321fc577d986  1646  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d98a  164a  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577d98e  164e  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d992  1652  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577d997  1657  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x321fc577d99b  165b  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577d9a0  1660  c5f258c0             vaddss xmm0,xmm1,xmm0
0x321fc577d9a4  1664  c4e27918c0           vbroadcastss xmm0,xmm0
0x321fc577d9a9  1669  c5f8108d50fcffff     vmovups xmm1,[rbp-0x3b0]
0x321fc577d9b1  1671  c5f828d1             vmovaps xmm2,xmm1
0x321fc577d9b5  1675  c57811b5b0fbffff     vmovups [rbp-0x450],xmm14
0x321fc577d9bd  167d  c57a16f1             vmovshdup xmm14,xmm1
0x321fc577d9c1  1681  c50a58f2             vaddss xmm14,xmm14,xmm2
0x321fc577d9c5  1685  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577d9ca  168a  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577d9cf  168f  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577d9d4  1694  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577d9d9  1699  c5f8108d30fdffff     vmovups xmm1,[rbp-0x2d0]
0x321fc577d9e1  16a1  c5f828d1             vmovaps xmm2,xmm1
0x321fc577d9e5  16a5  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577d9ea  16aa  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577d9ee  16ae  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577d9f3  16b3  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577d9f8  16b8  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577d9fd  16bd  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577da02  16c2  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da07  16c7  c5f8108de0fcffff     vmovups xmm1,[rbp-0x320]
0x321fc577da0f  16cf  c5f828d1             vmovaps xmm2,xmm1
0x321fc577da13  16d3  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da18  16d8  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577da1c  16dc  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da21  16e1  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577da26  16e6  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da2b  16eb  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577da30  16f0  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da35  16f5  c5f8108d90fcffff     vmovups xmm1,[rbp-0x370]
0x321fc577da3d  16fd  c5f828d1             vmovaps xmm2,xmm1
0x321fc577da41  1701  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da46  1706  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577da4a  170a  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da4f  170f  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577da54  1714  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577da59  1719  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577da5e  171e  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da63  1723  c4c37921c610         vinsertps xmm0,xmm0,xmm14,0x10
0x321fc577da69  1729  c5f8109540fcffff     vmovups xmm2,[rbp-0x3c0]
0x321fc577da71  1731  c57828f2             vmovaps xmm14,xmm2
0x321fc577da75  1735  c5fa16ca             vmovshdup xmm1,xmm2
0x321fc577da79  1739  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da7e  173e  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x321fc577da83  1743  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da88  1748  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x321fc577da8d  174d  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577da92  1752  c5f8108d20fdffff     vmovups xmm1,[rbp-0x2e0]
0x321fc577da9a  175a  c5f828d1             vmovaps xmm2,xmm1
0x321fc577da9e  175e  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577daa3  1763  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577daa7  1767  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577daac  176c  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577dab1  1771  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577dab6  1776  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577dabb  177b  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577dac0  1780  c5f8108dc0fcffff     vmovups xmm1,[rbp-0x340]
0x321fc577dac8  1788  c5f828d1             vmovaps xmm2,xmm1
0x321fc577dacc  178c  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577dad1  1791  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577dad5  1795  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577dada  179a  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577dadf  179f  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577dae4  17a4  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577dae9  17a9  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577daee  17ae  c5f8108d80fcffff     vmovups xmm1,[rbp-0x380]
0x321fc577daf6  17b6  c5f828d1             vmovaps xmm2,xmm1
0x321fc577dafa  17ba  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577daff  17bf  c5fa16d1             vmovshdup xmm2,xmm1
0x321fc577db03  17c3  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577db08  17c8  c5f970d102           vpshufd xmm2,xmm1,0x2
0x321fc577db0d  17cd  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x321fc577db12  17d2  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x321fc577db17  17d7  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db1c  17dc  c4c37921c620         vinsertps xmm0,xmm0,xmm14,0x20
0x321fc577db22  17e2  c5f8109530fcffff     vmovups xmm2,[rbp-0x3d0]
0x321fc577db2a  17ea  c57828f2             vmovaps xmm14,xmm2
0x321fc577db2e  17ee  c5fa16ca             vmovshdup xmm1,xmm2
0x321fc577db32  17f2  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db37  17f7  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x321fc577db3c  17fc  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db41  1801  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x321fc577db46  1806  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db4b  180b  c5f828cf             vmovaps xmm1,xmm7
0x321fc577db4f  180f  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db54  1814  c5fa16cf             vmovshdup xmm1,xmm7
0x321fc577db58  1818  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db5d  181d  c5f970cf02           vpshufd xmm1,xmm7,0x2
0x321fc577db62  1822  c4417258f6           vaddss xmm14,xmm1,xmm14
0x321fc577db67  1827  c5c0c6ff03           vshufps xmm7,xmm7,xmm7,0x3
0x321fc577db6c  182c  c4c14258fe           vaddss xmm7,xmm7,xmm14
0x321fc577db71  1831  c4417828f4           vmovaps xmm14,xmm12
0x321fc577db76  1836  c58a58ff             vaddss xmm7,xmm14,xmm7
0x321fc577db7a  183a  c4417a16f4           vmovshdup xmm14,xmm12
0x321fc577db7f  183f  c58a58ff             vaddss xmm7,xmm14,xmm7
0x321fc577db83  1843  c4417970f402         vpshufd xmm14,xmm12,0x2
0x321fc577db89  1849  c58a58ff             vaddss xmm7,xmm14,xmm7
0x321fc577db8d  184d  c44118c6e403         vshufps xmm12,xmm12,xmm12,0x3
0x321fc577db93  1853  c59a58ff             vaddss xmm7,xmm12,xmm7
0x321fc577db97  1857  c4417828e2           vmovaps xmm12,xmm10
0x321fc577db9c  185c  c59a58ff             vaddss xmm7,xmm12,xmm7
0x321fc577dba0  1860  c4417a16e2           vmovshdup xmm12,xmm10
0x321fc577dba5  1865  c59a58ff             vaddss xmm7,xmm12,xmm7
0x321fc577dba9  1869  c4417970e202         vpshufd xmm12,xmm10,0x2
0x321fc577dbaf  186f  c59a58ff             vaddss xmm7,xmm12,xmm7
0x321fc577dbb3  1873  c44128c6d203         vshufps xmm10,xmm10,xmm10,0x3
0x321fc577dbb9  1879  c5aa58ff             vaddss xmm7,xmm10,xmm7
0x321fc577dbbd  187d  c4e37921c730         vinsertps xmm0,xmm0,xmm7,0x30
0x321fc577dbc3  1883  c5f81095c0feffff     vmovups xmm2,[rbp-0x140]
0x321fc577dbcb  188b  c5f858d2             vaddps xmm2,xmm0,xmm2
0x321fc577dbcf  188f  c4c17828c0           vmovaps xmm0,xmm8
0x321fc577dbd4  1894  c4c17a16f8           vmovshdup xmm7,xmm8
0x321fc577dbd9  1899  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dbdd  189d  c4c17970f802         vpshufd xmm7,xmm8,0x2
0x321fc577dbe3  18a3  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dbe7  18a7  c4c17970f803         vpshufd xmm7,xmm8,0x3
0x321fc577dbed  18ad  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dbf1  18b1  c5f828fe             vmovaps xmm7,xmm6
0x321fc577dbf5  18b5  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dbf9  18b9  c5fa16fe             vmovshdup xmm7,xmm6
0x321fc577dbfd  18bd  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dc01  18c1  c5f970fe02           vpshufd xmm7,xmm6,0x2
0x321fc577dc06  18c6  c5c258c0             vaddss xmm0,xmm7,xmm0
0x321fc577dc0a  18ca  c5c8c6f603           vshufps xmm6,xmm6,xmm6,0x3
0x321fc577dc0f  18cf  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc13  18d3  c4c17828f1           vmovaps xmm6,xmm9
0x321fc577dc18  18d8  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc1c  18dc  c4c17a16f1           vmovshdup xmm6,xmm9
0x321fc577dc21  18e1  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc25  18e5  c4c17970f102         vpshufd xmm6,xmm9,0x2
0x321fc577dc2b  18eb  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc2f  18ef  c4c17970f103         vpshufd xmm6,xmm9,0x3
0x321fc577dc35  18f5  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc39  18f9  c4c17828f5           vmovaps xmm6,xmm13
0x321fc577dc3e  18fe  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc42  1902  c4c17a16f5           vmovshdup xmm6,xmm13
0x321fc577dc47  1907  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc4b  190b  c4c17970f502         vpshufd xmm6,xmm13,0x2
0x321fc577dc51  1911  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc55  1915  c4c17970f503         vpshufd xmm6,xmm13,0x3
0x321fc577dc5b  191b  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc5f  191f  c5fb108dd8feffff     vmovsd xmm1,[rbp-0x128]
0x321fc577dc67  1927  c5f258c8             vaddss xmm1,xmm1,xmm0
0x321fc577dc6b  192b  c5f828c5             vmovaps xmm0,xmm5
0x321fc577dc6f  192f  c5fa16f5             vmovshdup xmm6,xmm5
0x321fc577dc73  1933  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc77  1937  c5f970f502           vpshufd xmm6,xmm5,0x2
0x321fc577dc7c  193c  c5ca58c0             vaddss xmm0,xmm6,xmm0
0x321fc577dc80  1940  c5d0c6ed03           vshufps xmm5,xmm5,xmm5,0x3
0x321fc577dc85  1945  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dc89  1949  c4c17828eb           vmovaps xmm5,xmm11
0x321fc577dc8e  194e  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dc92  1952  c4c17a16eb           vmovshdup xmm5,xmm11
0x321fc577dc97  1957  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dc9b  195b  c4c17970eb02         vpshufd xmm5,xmm11,0x2
0x321fc577dca1  1961  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dca5  1965  c4c17970eb03         vpshufd xmm5,xmm11,0x3
0x321fc577dcab  196b  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dcaf  196f  c5f828eb             vmovaps xmm5,xmm3
0x321fc577dcb3  1973  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dcb7  1977  c5fa16eb             vmovshdup xmm5,xmm3
0x321fc577dcbb  197b  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dcbf  197f  c5f970eb02           vpshufd xmm5,xmm3,0x2
0x321fc577dcc4  1984  c5d258c0             vaddss xmm0,xmm5,xmm0
0x321fc577dcc8  1988  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x321fc577dccd  198d  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dcd1  1991  c5f828dc             vmovaps xmm3,xmm4
0x321fc577dcd5  1995  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dcd9  1999  c5fa16dc             vmovshdup xmm3,xmm4
0x321fc577dcdd  199d  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dce1  19a1  c5f970dc02           vpshufd xmm3,xmm4,0x2
0x321fc577dce6  19a6  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dcea  19aa  c5f970dc03           vpshufd xmm3,xmm4,0x3
0x321fc577dcef  19af  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dcf3  19b3  c57b10b5e0feffff     vmovsd xmm14,[rbp-0x120]
0x321fc577dcfb  19bb  c50a58f0             vaddss xmm14,xmm14,xmm0
0x321fc577dcff  19bf  c5f81085b0fbffff     vmovups xmm0,[rbp-0x450]
0x321fc577dd07  19c7  c5f828d8             vmovaps xmm3,xmm0
0x321fc577dd0b  19cb  c5fa16e0             vmovshdup xmm4,xmm0
0x321fc577dd0f  19cf  c5da58db             vaddss xmm3,xmm4,xmm3
0x321fc577dd13  19d3  c5f970e002           vpshufd xmm4,xmm0,0x2
0x321fc577dd18  19d8  c5da58db             vaddss xmm3,xmm4,xmm3
0x321fc577dd1c  19dc  c5f8c6c003           vshufps xmm0,xmm0,xmm0,0x3
0x321fc577dd21  19e1  c5fa58c3             vaddss xmm0,xmm0,xmm3
0x321fc577dd25  19e5  c5f8109d20fcffff     vmovups xmm3,[rbp-0x3e0]
0x321fc577dd2d  19ed  c5f828e3             vmovaps xmm4,xmm3
0x321fc577dd31  19f1  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd35  19f5  c5fa16e3             vmovshdup xmm4,xmm3
0x321fc577dd39  19f9  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd3d  19fd  c5f970e302           vpshufd xmm4,xmm3,0x2
0x321fc577dd42  1a02  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd46  1a06  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x321fc577dd4b  1a0b  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dd4f  1a0f  c5f8109dd0fbffff     vmovups xmm3,[rbp-0x430]
0x321fc577dd57  1a17  c5f828e3             vmovaps xmm4,xmm3
0x321fc577dd5b  1a1b  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd5f  1a1f  c5fa16e3             vmovshdup xmm4,xmm3
0x321fc577dd63  1a23  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd67  1a27  c5f970e302           vpshufd xmm4,xmm3,0x2
0x321fc577dd6c  1a2c  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd70  1a30  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x321fc577dd75  1a35  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dd79  1a39  c5f8109dc0fbffff     vmovups xmm3,[rbp-0x440]
0x321fc577dd81  1a41  c5f828e3             vmovaps xmm4,xmm3
0x321fc577dd85  1a45  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd89  1a49  c5fa16e3             vmovshdup xmm4,xmm3
0x321fc577dd8d  1a4d  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd91  1a51  c5f970e302           vpshufd xmm4,xmm3,0x2
0x321fc577dd96  1a56  c5da58c0             vaddss xmm0,xmm4,xmm0
0x321fc577dd9a  1a5a  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x321fc577dd9f  1a5f  c5e258c0             vaddss xmm0,xmm3,xmm0
0x321fc577dda3  1a63  c57b10ade8feffff     vmovsd xmm13,[rbp-0x118]
0x321fc577ddab  1a6b  c51258e8             vaddss xmm13,xmm13,xmm0
0x321fc577ddaf  1a6f  448ba560ffffff       movl r12,[rbp-0xa0]
0x321fc577ddb6  1a76  4183e40f             andl r12,0xf
0x321fc577ddba  1a7a  448b9d50ffffff       movl r11,[rbp-0xb0]
0x321fc577ddc1  1a81  4183e30f             andl r11,0xf
0x321fc577ddc5  1a85  458bfb               movl r15,r11
0x321fc577ddc8  1a88  453bf3               cmpl r14,r11
0x321fc577ddcb  1a8b  450f42fe             cmovcl r15,r14
0x321fc577ddcf  1a8f  458bdf               movl r11,r15
0x321fc577ddd2  1a92  413bf7               cmpl rsi,r15
0x321fc577ddd5  1a95  440f42de             cmovcl r11,rsi
0x321fc577ddd9  1a99  458bfb               movl r15,r11
0x321fc577dddc  1a9c  453be3               cmpl r12,r11
0x321fc577dddf  1a9f  450f42fc             cmovcl r15,r12
0x321fc577dde3  1aa3  4585ff               testl r15,r15
0x321fc577dde6  1aa6  0f8479020000         jz 0x321fc577e065  <+0x1d25>
0x321fc577ddec  1aac  8bb550ffffff         movl rsi,[rbp-0xb0]
0x321fc577ddf2  1ab2  81e6f0ffff1f         andl rsi,0x1ffffff0
0x321fc577ddf8  1ab8  8d3cb7               leal rdi,[rdi+rsi*4]
0x321fc577ddfb  1abb  448ba560ffffff       movl r12,[rbp-0xa0]
0x321fc577de02  1ac2  4181e4f0ffff1f       andl r12,0x1ffffff0
0x321fc577de09  1ac9  478d04a0             leal r8,[r8+r12*4]
0x321fc577de0d  1acd  c57b109538ffffff     vmovsd xmm10,[rbp-0xc8]
0x321fc577de15  1ad5  c5fb108540ffffff     vmovsd xmm0,[rbp-0xc0]
0x321fc577de1d  1add  c5fb10a548ffffff     vmovsd xmm4,[rbp-0xb8]
0x321fc577de25  1ae5  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577de29  1ae9  448b9d70ffffff       movl r11,[rbp-0x90]
0x321fc577de30  1af0  448be7               movl r12,rdi
0x321fc577de33  1af3  8bbd88fbffff         movl rdi,[rbp-0x478]
0x321fc577de39  1af9  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x321fc577de3e  1afe  c4c13972f019         vpslld xmm8,xmm8,25
0x321fc577de44  1b04  c4c13972d002         vpsrld xmm8,xmm8,2
0x321fc577de4a  1b0a  e936000000           jmp 0x321fc577de85  <+0x1b45>
0x321fc577de4f  1b0f  660f1f840000000000   nop
0x321fc577de58  1b18  660f1f840000000000   nop
0x321fc577de61  1b21  660f1f840000000000   nop
0x321fc577de6a  1b2a  660f1f840000000000   nop
0x321fc577de73  1b33  660f1f840000000000   nop
0x321fc577de7c  1b3c  0f1f4000             nop
0x321fc577de80  1b40  c4417928d3           vmovapd xmm10,xmm11
0x321fc577de85  1b45  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x321fc577de8b  1b4b  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x321fc577de93  1b53  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x321fc577de97  1b57  c5d259fd             vmulss xmm7,xmm5,xmm5
0x321fc577de9b  1b5b  c57a101c38           vmovss xmm11,[rax+rdi*1]
0x321fc577dea0  1b60  c4412a5ce3           vsubss xmm12,xmm10,xmm11
0x321fc577dea5  1b65  c4411a59d4           vmulss xmm10,xmm12,xmm12
0x321fc577deaa  1b6a  c5aa58ff             vaddss xmm7,xmm10,xmm7
0x321fc577deae  1b6e  c5f82ec7             vucomiss xmm0,xmm7
0x321fc577deb2  1b72  0f8745000000         ja 0x321fc577defd  <+0x1bbd>
0x321fc577deb8  1b78  c5f82ee7             vucomiss xmm4,xmm7
0x321fc577debc  1b7c  0f8644000000         jna 0x321fc577df06  <+0x1bc6>
0x321fc577dec2  1b82  c5f82efe             vucomiss xmm7,xmm6
0x321fc577dec6  1b86  0f863a000000         jna 0x321fc577df06  <+0x1bc6>
0x321fc577decc  1b8c  c4411258e8           vaddss xmm13,xmm13,xmm8
0x321fc577ded1  1b91  c4e27918db           vbroadcastss xmm3,xmm3
0x321fc577ded6  1b96  c4c36121db10         vinsertps xmm3,xmm3,xmm11,0x10
0x321fc577dedc  1b9c  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x321fc577dee2  1ba2  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x321fc577dee8  1ba8  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x321fc577deee  1bae  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x321fc577def4  1bb4  c5e858d3             vaddps xmm2,xmm2,xmm3
0x321fc577def8  1bb8  e909000000           jmp 0x321fc577df06  <+0x1bc6>
0x321fc577defd  1bbd  c59a58c9             vaddss xmm1,xmm12,xmm1
0x321fc577df01  1bc1  c4415258f6           vaddss xmm14,xmm5,xmm14
0x321fc577df06  1bc6  4183c404             addl r12,0x4
0x321fc577df0a  1bca  83c704               addl rdi,0x4
0x321fc577df0d  1bcd  4183c304             addl r11,0x4
0x321fc577df11  1bd1  4183c004             addl r8,0x4
0x321fc577df15  1bd5  4183c7ff             addl r15,0xff
0x321fc577df19  1bd9  0f8446010000         jz 0x321fc577e065  <+0x1d25>
0x321fc577df1f  1bdf  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x321fc577df25  1be5  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x321fc577df29  1be9  c5d259fd             vmulss xmm7,xmm5,xmm5
0x321fc577df2d  1bed  c57a101438           vmovss xmm10,[rax+rdi*1]
0x321fc577df32  1bf2  c57b109d38ffffff     vmovsd xmm11,[rbp-0xc8]
0x321fc577df3a  1bfa  c441225ce2           vsubss xmm12,xmm11,xmm10
0x321fc577df3f  1bff  c4411a59dc           vmulss xmm11,xmm12,xmm12
0x321fc577df44  1c04  c5a258ff             vaddss xmm7,xmm11,xmm7
0x321fc577df48  1c08  c5f82ec7             vucomiss xmm0,xmm7
0x321fc577df4c  1c0c  0f8745000000         ja 0x321fc577df97  <+0x1c57>
0x321fc577df52  1c12  c5f82ee7             vucomiss xmm4,xmm7
0x321fc577df56  1c16  0f8644000000         jna 0x321fc577dfa0  <+0x1c60>
0x321fc577df5c  1c1c  c5f82efe             vucomiss xmm7,xmm6
0x321fc577df60  1c20  0f863a000000         jna 0x321fc577dfa0  <+0x1c60>
0x321fc577df66  1c26  c4411258e8           vaddss xmm13,xmm13,xmm8
0x321fc577df6b  1c2b  c4e27918db           vbroadcastss xmm3,xmm3
0x321fc577df70  1c30  c4c36121da10         vinsertps xmm3,xmm3,xmm10,0x10
0x321fc577df76  1c36  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x321fc577df7c  1c3c  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x321fc577df82  1c42  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x321fc577df88  1c48  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x321fc577df8e  1c4e  c5e858d3             vaddps xmm2,xmm2,xmm3
0x321fc577df92  1c52  e909000000           jmp 0x321fc577dfa0  <+0x1c60>
0x321fc577df97  1c57  c59a58c9             vaddss xmm1,xmm12,xmm1
0x321fc577df9b  1c5b  c4415258f6           vaddss xmm14,xmm5,xmm14
0x321fc577dfa0  1c60  4183c404             addl r12,0x4
0x321fc577dfa4  1c64  83c704               addl rdi,0x4
0x321fc577dfa7  1c67  4183c304             addl r11,0x4
0x321fc577dfab  1c6b  4183c004             addl r8,0x4
0x321fc577dfaf  1c6f  4183c7ff             addl r15,0xff
0x321fc577dfb3  1c73  0f84ac000000         jz 0x321fc577e065  <+0x1d25>
0x321fc577dfb9  1c79  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x321fc577dfbd  1c7d  0f8603050000         jna 0x321fc577e4c6  <+0x2186>
0x321fc577dfc3  1c83  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x321fc577dfc9  1c89  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x321fc577dfcd  1c8d  c5d259fd             vmulss xmm7,xmm5,xmm5
0x321fc577dfd1  1c91  c57a101438           vmovss xmm10,[rax+rdi*1]
0x321fc577dfd6  1c96  c57b109d38ffffff     vmovsd xmm11,[rbp-0xc8]
0x321fc577dfde  1c9e  c441225ce2           vsubss xmm12,xmm11,xmm10
0x321fc577dfe3  1ca3  c4411a59cc           vmulss xmm9,xmm12,xmm12
0x321fc577dfe8  1ca8  c5b258ff             vaddss xmm7,xmm9,xmm7
0x321fc577dfec  1cac  c5f82ec7             vucomiss xmm0,xmm7
0x321fc577dff0  1cb0  0f8745000000         ja 0x321fc577e03b  <+0x1cfb>
0x321fc577dff6  1cb6  c5f82ee7             vucomiss xmm4,xmm7
0x321fc577dffa  1cba  0f8644000000         jna 0x321fc577e044  <+0x1d04>
0x321fc577e000  1cc0  c5f82efe             vucomiss xmm7,xmm6
0x321fc577e004  1cc4  0f863a000000         jna 0x321fc577e044  <+0x1d04>
0x321fc577e00a  1cca  c4413a58ed           vaddss xmm13,xmm8,xmm13
0x321fc577e00f  1ccf  c4e27918db           vbroadcastss xmm3,xmm3
0x321fc577e014  1cd4  c4c36121da10         vinsertps xmm3,xmm3,xmm10,0x10
0x321fc577e01a  1cda  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x321fc577e020  1ce0  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x321fc577e026  1ce6  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x321fc577e02c  1cec  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x321fc577e032  1cf2  c5e858d3             vaddps xmm2,xmm2,xmm3
0x321fc577e036  1cf6  e909000000           jmp 0x321fc577e044  <+0x1d04>
0x321fc577e03b  1cfb  c59a58c9             vaddss xmm1,xmm12,xmm1
0x321fc577e03f  1cff  c4415258f6           vaddss xmm14,xmm5,xmm14
0x321fc577e044  1d04  4183c404             addl r12,0x4
0x321fc577e048  1d08  83c704               addl rdi,0x4
0x321fc577e04b  1d0b  4183c304             addl r11,0x4
0x321fc577e04f  1d0f  4183c004             addl r8,0x4
0x321fc577e053  1d13  4183c7ff             addl r15,0xff
0x321fc577e057  1d17  0f8523feffff         jnz 0x321fc577de80  <+0x1b40>
0x321fc577e05d  1d1d  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x321fc577e065  1d25  448b4d80             movl r9,[rbp-0x80]
0x321fc577e069  1d29  418d7901             leal rdi,[r9+0x1]
0x321fc577e06d  1d2d  448b8578ffffff       movl r8,[rbp-0x88]
0x321fc577e074  1d34  453bc1               cmpl r8,r9
0x321fc577e077  1d37  0f8543eeffff         jnz 0x321fc577cec0  <+0xb80>
0x321fc577e07d  1d3d  8b5de0               movl rbx,[rbp-0x20]
0x321fc577e080  1d40  c5fa114c1828         vmovss [rax+rbx*1+0x28],xmm1
0x321fc577e086  1d46  c57a11741824         vmovss [rax+rbx*1+0x24],xmm14
0x321fc577e08c  1d4c  c57a116c1820         vmovss [rax+rbx*1+0x20],xmm13
0x321fc577e092  1d52  c5fa7f541810         vmovdqu [rax+rbx*1+0x10],xmm2
0x321fc577e098  1d58  e906000000           jmp 0x321fc577e0a3  <+0x1d63>
0x321fc577e09d  1d5d  8b5de0               movl rbx,[rbp-0x20]
0x321fc577e0a0  1d60  488bc7               REX.W movq rax,rdi
0x321fc577e0a3  1d63  8d7b30               leal rdi,[rbx+0x30]
0x321fc577e0a6  1d66  8d4b40               leal rcx,[rbx+0x40]
0x321fc577e0a9  1d69  448d4b10             leal r9,[rbx+0x10]
0x321fc577e0ad  1d6d  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577e0b1  1d71  8bc7                 movl rax,rdi
0x321fc577e0b3  1d73  8b5598               movl rdx,[rbp-0x68]
0x321fc577e0b6  1d76  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0x321fc577e0bb  1d7b  c5fb105588           vmovsd xmm2,[rbp-0x78]
0x321fc577e0c0  1d80  e87b6cf2ff           call 0x321fc56a4d40  (jump table)
0x321fc577e0c5  1d85  8b7da0               movl rdi,[rbp-0x60]
0x321fc577e0c8  1d88  3b7dd0               cmpl rdi,[rbp-0x30]
0x321fc577e0cb  1d8b  0f868a000000         jna 0x321fc577e15b  <+0x1e1b>
0x321fc577e0d1  1d91  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e0d4  1d94  448b45a8             movl r8,[rbp-0x58]
0x321fc577e0d8  1d98  458d1c90             leal r11,[r8+rdx*4]
0x321fc577e0dc  1d9c  448b65e0             movl r12,[rbp-0x20]
0x321fc577e0e0  1da0  4c8b7dc8             REX.W movq r15,[rbp-0x38]
0x321fc577e0e4  1da4  c4817a10442730       vmovss xmm0,[r15+r12*1+0x30]
0x321fc577e0eb  1dab  c4817a11041f         vmovss [r15+r11*1],xmm0
0x321fc577e0f1  1db1  448b5db0             movl r11,[rbp-0x50]
0x321fc577e0f5  1db5  458d3493             leal r14,[r11+rdx*4]
0x321fc577e0f9  1db9  c4817a10442734       vmovss xmm0,[r15+r12*1+0x34]
0x321fc577e100  1dc0  c4817a110437         vmovss [r15+r14*1],xmm0
0x321fc577e106  1dc6  448b75b8             movl r14,[rbp-0x48]
0x321fc577e10a  1dca  418d0496             leal rax,[r14+rdx*4]
0x321fc577e10e  1dce  c4817a10442738       vmovss xmm0,[r15+r12*1+0x38]
0x321fc577e115  1dd5  c4c17a110407         vmovss [r15+rax*1],xmm0
0x321fc577e11b  1ddb  8b45c0               movl rax,[rbp-0x40]
0x321fc577e11e  1dde  8d1c90               leal rbx,[rax+rdx*4]
0x321fc577e121  1de1  c4817a1044273c       vmovss xmm0,[r15+r12*1+0x3c]
0x321fc577e128  1de8  c4c17a11041f         vmovss [r15+rbx*1],xmm0
0x321fc577e12e  1dee  498bff               REX.W movq rdi,r15
0x321fc577e131  1df1  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577e135  1df5  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577e13d  1dfd  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577e145  1e05  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577e14d  1e0d  33c9                 xorl rcx,rcx
0x321fc577e14f  1e0f  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e156  1e16  e92c000000           jmp 0x321fc577e187  <+0x1e47>
0x321fc577e15b  1e1b  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e15e  1e1e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e162  1e22  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577e166  1e26  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577e16e  1e2e  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577e176  1e36  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577e17e  1e3e  33c9                 xorl rcx,rcx
0x321fc577e180  1e40  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e187  1e47  83c201               addl rdx,0x1
0x321fc577e18a  1e4a  448b5dd8             movl r11,[rbp-0x28]
0x321fc577e18e  1e4e  443bda               cmpl r11,rdx
0x321fc577e191  1e51  0f85e9e9ffff         jnz 0x321fc577cb80  <+0x840>
0x321fc577e197  1e57  8b7de0               movl rdi,[rbp-0x20]
0x321fc577e19a  1e5a  83c750               addl rdi,0x50
0x321fc577e19d  1e5d  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x321fc577e1a1  1e61  418938               movl [r8],rdi
0x321fc577e1a4  1e64  488be5               REX.W movq rsp,rbp
0x321fc577e1a7  1e67  5d                   pop rbp
0x321fc577e1a8  1e68  c3                   retl
0x321fc577e1a9  1e69  e82273f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e1ae  1e6e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e1b2  1e72  488b75f0             REX.W movq rsi,[rbp-0x10]
0x321fc577e1b6  1e76  8b45d8               movl rax,[rbp-0x28]
0x321fc577e1b9  1e79  e9a6e1ffff           jmp 0x321fc577c364  <+0x24>
0x321fc577e1be  1e7e  c5f92ef6             vucomisd xmm6,xmm6
0x321fc577e1c2  1e82  0f8b0b000000         jpo 0x321fc577e1d3  <+0x1e93>
0x321fc577e1c8  1e88  4533ff               xorl r15,r15
0x321fc577e1cb  1e8b  4d8be7               REX.W movq r12,r15
0x321fc577e1ce  1e8e  e9f5e2ffff           jmp 0x321fc577c4c8  <+0x188>
0x321fc577e1d3  1e93  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577e1d7  1e97  c5f82ef5             vucomiss xmm6,xmm5
0x321fc577e1db  1e9b  0f870b000000         ja 0x321fc577e1ec  <+0x1eac>
0x321fc577e1e1  1ea1  41bcffffffff         movl r12,0xffffffff
0x321fc577e1e7  1ea7  e9dce2ffff           jmp 0x321fc577c4c8  <+0x188>
0x321fc577e1ec  1eac  4531e4               xorl r12,r12
0x321fc577e1ef  1eaf  e9d4e2ffff           jmp 0x321fc577c4c8  <+0x188>
0x321fc577e1f4  1eb4  c5f92eff             vucomisd xmm7,xmm7
0x321fc577e1f8  1eb8  0f8b08000000         jpo 0x321fc577e206  <+0x1ec6>
0x321fc577e1fe  1ebe  4531e4               xorl r12,r12
0x321fc577e201  1ec1  e929e3ffff           jmp 0x321fc577c52f  <+0x1ef>
0x321fc577e206  1ec6  c5c057ff             vxorps xmm7,xmm7,xmm7
0x321fc577e20a  1eca  c5f82efe             vucomiss xmm7,xmm6
0x321fc577e20e  1ece  77ee                 ja 0x321fc577e1fe  <+0x1ebe>
0x321fc577e210  1ed0  41bcffffffff         movl r12,0xffffffff
0x321fc577e216  1ed6  e914e3ffff           jmp 0x321fc577c52f  <+0x1ef>
0x321fc577e21b  1edb  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577e223  1ee3  488975d0             REX.W movq [rbp-0x30],rsi
0x321fc577e227  1ee7  48894db0             REX.W movq [rbp-0x50],rcx
0x321fc577e22b  1eeb  e8a072f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e230  1ef0  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e234  1ef4  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e23b  1efb  448b5dd8             movl r11,[rbp-0x28]
0x321fc577e23f  1eff  8b4db0               movl rcx,[rbp-0x50]
0x321fc577e242  1f02  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577e24a  1f0a  8b5da8               movl rbx,[rbp-0x58]
0x321fc577e24d  1f0d  8b45b8               movl rax,[rbp-0x48]
0x321fc577e250  1f10  448b75c0             movl r14,[rbp-0x40]
0x321fc577e254  1f14  8b75d0               movl rsi,[rbp-0x30]
0x321fc577e257  1f17  e92ee4ffff           jmp 0x321fc577c68a  <+0x34a>
0x321fc577e25c  1f1c  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577e264  1f24  4c8975b8             REX.W movq [rbp-0x48],r14
0x321fc577e268  1f28  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577e26c  1f2c  e85f72f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e271  1f31  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e275  1f35  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e27c  1f3c  448b5dd8             movl r11,[rbp-0x28]
0x321fc577e280  1f40  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e283  1f43  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577e28b  1f4b  8b45c0               movl rax,[rbp-0x40]
0x321fc577e28e  1f4e  448b7da8             movl r15,[rbp-0x58]
0x321fc577e292  1f52  448b65b0             movl r12,[rbp-0x50]
0x321fc577e296  1f56  448b75b8             movl r14,[rbp-0x48]
0x321fc577e29a  1f5a  e9ebe4ffff           jmp 0x321fc577c78a  <+0x44a>
0x321fc577e29f  1f5f  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577e2a7  1f67  4c8975b0             REX.W movq [rbp-0x50],r14
0x321fc577e2ab  1f6b  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577e2af  1f6f  e81c72f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e2b4  1f74  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e2b8  1f78  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e2bf  1f7f  448b5dd8             movl r11,[rbp-0x28]
0x321fc577e2c3  1f83  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e2c6  1f86  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577e2ce  1f8e  8b45c0               movl rax,[rbp-0x40]
0x321fc577e2d1  1f91  448b7db8             movl r15,[rbp-0x48]
0x321fc577e2d5  1f95  448b6580             movl r12,[rbp-0x80]
0x321fc577e2d9  1f99  448b75b0             movl r14,[rbp-0x50]
0x321fc577e2dd  1f9d  e9a8e5ffff           jmp 0x321fc577c88a  <+0x54a>
0x321fc577e2e2  1fa2  c5fb119d68ffffff     vmovsd [rbp-0x98],xmm3
0x321fc577e2ea  1faa  4c895da0             REX.W movq [rbp-0x60],r11
0x321fc577e2ee  1fae  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577e2f2  1fb2  e8d971f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e2f7  1fb7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e2fb  1fbb  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e302  1fc2  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e305  1fc5  c5fb109d68ffffff     vmovsd xmm3,[rbp-0x98]
0x321fc577e30d  1fcd  8b45d8               movl rax,[rbp-0x28]
0x321fc577e310  1fd0  448b7dc0             movl r15,[rbp-0x40]
0x321fc577e314  1fd4  448b65b8             movl r12,[rbp-0x48]
0x321fc577e318  1fd8  448b5da0             movl r11,[rbp-0x60]
0x321fc577e31c  1fdc  e969e6ffff           jmp 0x321fc577c98a  <+0x64a>
0x321fc577e321  1fe1  488955d0             REX.W movq [rbp-0x30],rdx
0x321fc577e325  1fe5  e8a671f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e32a  1fea  8b55d0               movl rdx,[rbp-0x30]
0x321fc577e32d  1fed  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e331  1ff1  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577e335  1ff5  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577e33d  1ffd  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577e345  2005  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577e34d  200d  33c9                 xorl rcx,rcx
0x321fc577e34f  200f  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x321fc577e356  2016  e92fe8ffff           jmp 0x321fc577cb8a  <+0x84a>
0x321fc577e35b  201b  c441792eed           vucomisd xmm13,xmm13
0x321fc577e360  2020  0f8b08000000         jpo 0x321fc577e36e  <+0x202e>
0x321fc577e366  2026  488bd1               REX.W movq rdx,rcx
0x321fc577e369  2029  e9ade9ffff           jmp 0x321fc577cd1b  <+0x9db>
0x321fc577e36e  202e  c4c1782ef4           vucomiss xmm6,xmm12
0x321fc577e373  2033  77f1                 ja 0x321fc577e366  <+0x2026>
0x321fc577e375  2035  baffffffff           movl rdx,0xffffffff
0x321fc577e37a  203a  e99ce9ffff           jmp 0x321fc577cd1b  <+0x9db>
0x321fc577e37f  203f  c441792ee4           vucomisd xmm12,xmm12
0x321fc577e384  2044  0f8b08000000         jpo 0x321fc577e392  <+0x2052>
0x321fc577e38a  204a  488bd9               REX.W movq rbx,rcx
0x321fc577e38d  204d  e96deaffff           jmp 0x321fc577cdff  <+0xabf>
0x321fc577e392  2052  c4c1782ef3           vucomiss xmm6,xmm11
0x321fc577e397  2057  77f1                 ja 0x321fc577e38a  <+0x204a>
0x321fc577e399  2059  bbffffffff           movl rbx,0xffffffff
0x321fc577e39e  205e  e95ceaffff           jmp 0x321fc577cdff  <+0xabf>
0x321fc577e3a3  2063  e82871f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e3a8  2068  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x321fc577e3ac  206c  448b4d80             movl r9,[rbp-0x80]
0x321fc577e3b0  2070  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577e3b8  2078  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577e3c0  2080  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577e3c8  2088  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x321fc577e3d0  2090  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x321fc577e3d8  2098  33c9                 xorl rcx,rcx
0x321fc577e3da  209a  448b9d58fbffff       movl r11,[rbp-0x4a8]
0x321fc577e3e1  20a1  8b8550fbffff         movl rax,[rbp-0x4b0]
0x321fc577e3e7  20a7  8bb548fbffff         movl rsi,[rbp-0x4b8]
0x321fc577e3ed  20ad  448bbd90fbffff       movl r15,[rbp-0x470]
0x321fc577e3f4  20b4  8b9d98fbffff         movl rbx,[rbp-0x468]
0x321fc577e3fa  20ba  8b9500ffffff         movl rdx,[rbp-0x100]
0x321fc577e400  20c0  448ba5a0fbffff       movl r12,[rbp-0x460]
0x321fc577e407  20c7  448bb508ffffff       movl r14,[rbp-0xf8]
0x321fc577e40e  20ce  e93febffff           jmp 0x321fc577cf52  <+0xc12>
0x321fc577e413  20d3  4c898568ffffff       REX.W movq [rbp-0x98],r8
0x321fc577e41a  20da  4889bd58ffffff       REX.W movq [rbp-0xa8],rdi
0x321fc577e421  20e1  4889b5f8feffff       REX.W movq [rbp-0x108],rsi
0x321fc577e428  20e8  4c89b5f0feffff       REX.W movq [rbp-0x110],r14
0x321fc577e42f  20ef  4c899dd0feffff       REX.W movq [rbp-0x130],r11
0x321fc577e436  20f6  4c89a5b8feffff       REX.W movq [rbp-0x148],r12
0x321fc577e43d  20fd  488995b0feffff       REX.W movq [rbp-0x150],rdx
0x321fc577e444  2104  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x321fc577e44c  210c  4c89bda8fbffff       REX.W movq [rbp-0x458],r15
0x321fc577e453  2113  e87870f2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e458  2118  488b45c8             REX.W movq rax,[rbp-0x38]
0x321fc577e45c  211c  448b8568ffffff       movl r8,[rbp-0x98]
0x321fc577e463  2123  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x321fc577e469  2129  8bb5f8feffff         movl rsi,[rbp-0x108]
0x321fc577e46f  212f  448bb5f0feffff       movl r14,[rbp-0x110]
0x321fc577e476  2136  448b9dd0feffff       movl r11,[rbp-0x130]
0x321fc577e47d  213d  448ba5b8feffff       movl r12,[rbp-0x148]
0x321fc577e484  2144  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x321fc577e48c  214c  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x321fc577e494  2154  8b95b0feffff         movl rdx,[rbp-0x150]
0x321fc577e49a  215a  c5f8108510fcffff     vmovups xmm0,[rbp-0x3f0]
0x321fc577e4a2  2162  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x321fc577e4aa  216a  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x321fc577e4b2  2172  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x321fc577e4ba  217a  448bbda8fbffff       movl r15,[rbp-0x458]
0x321fc577e4c1  2181  e9c4eeffff           jmp 0x321fc577d38a  <+0x104a>
0x321fc577e4c6  2186  c5fb118dd8feffff     vmovsd [rbp-0x128],xmm1
0x321fc577e4ce  218e  c57b11b5e0feffff     vmovsd [rbp-0x120],xmm14
0x321fc577e4d6  2196  c57b11ade8feffff     vmovsd [rbp-0x118],xmm13
0x321fc577e4de  219e  c5f81195c0feffff     vmovups [rbp-0x140],xmm2
0x321fc577e4e6  21a6  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x321fc577e4ed  21ad  4c898568ffffff       REX.W movq [rbp-0x98],r8
0x321fc577e4f4  21b4  4c899d60ffffff       REX.W movq [rbp-0xa0],r11
0x321fc577e4fb  21bb  4889bd58ffffff       REX.W movq [rbp-0xa8],rdi
0x321fc577e502  21c2  4c89a550ffffff       REX.W movq [rbp-0xb0],r12
0x321fc577e509  21c9  e8c26ff2ff           call 0x321fc56a54d0  (jump table)
0x321fc577e50e  21ce  488b45c8             REX.W movq rax,[rbp-0x38]
0x321fc577e512  21d2  c5fb108dd8feffff     vmovsd xmm1,[rbp-0x128]
0x321fc577e51a  21da  c57b10b5e0feffff     vmovsd xmm14,[rbp-0x120]
0x321fc577e522  21e2  c57b10ade8feffff     vmovsd xmm13,[rbp-0x118]
0x321fc577e52a  21ea  c5f81095c0feffff     vmovups xmm2,[rbp-0x140]
0x321fc577e532  21f2  4c8bbd70ffffff       REX.W movq r15,[rbp-0x90]
0x321fc577e539  21f9  448b8568ffffff       movl r8,[rbp-0x98]
0x321fc577e540  2200  448b9d60ffffff       movl r11,[rbp-0xa0]
0x321fc577e547  2207  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x321fc577e54d  220d  448ba550ffffff       movl r12,[rbp-0xb0]
0x321fc577e554  2214  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x321fc577e559  2219  c4c13972f019         vpslld xmm8,xmm8,25
0x321fc577e55f  221f  c4c13972d002         vpsrld xmm8,xmm8,2
0x321fc577e565  2225  c5c857f6             vxorps xmm6,xmm6,xmm6
0x321fc577e569  2229  c5fb10a548ffffff     vmovsd xmm4,[rbp-0xb8]
0x321fc577e571  2231  c5fb108540ffffff     vmovsd xmm0,[rbp-0xc0]
0x321fc577e579  2239  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x321fc577e581  2241  e93dfaffff           jmp 0x321fc577dfc3  <+0x1c83>
0x321fc577e586  2246  90                   nop
0x321fc577e587  2247  90                   nop

Protected instructions:
 pc offset
        3c         
        5d         
       10a         
       248         
       24e         
       256         
       25b         
       263         
       26c         
       271         
       276         
       27b         
       2a6         
       2ba         
       2bf         
       2cb         
       2d0         
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
       5e3         
       5e8         
       5f0         
       5fc         
       605         
       60a         
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
       780         
       785         
       78a         
       78f         
       7b1         
       7c4         
       7d7         
       7dc         
       7e1         
       7e6         
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
       8d4         
       8dd         
       8e3         
       8e9         
       8ef         
       8f4         
       902         
       908         
       912         
       91a         
       a23         
       afa         
       aff         
       c3a         
       c42         
      104e         
      105f         
      10b0         
      10d2         
      1136         
      1158         
      11bb         
      11dd         
      1231         
      1253         
      1298         
      12b4         
      12f9         
      1314         
      136d         
      138e         
      1b45         
      1b5b         
      1b9c         
      1ba8         
      1bdf         
      1bed         
      1c36         
      1c42         
      1c83         
      1c91         
      1cda         
      1ce6         
      1d40         
      1d46         
      1d4c         
      1d52         
      1da4         
      1dab         
      1db9         
      1dc0         
      1dce         
      1dd5         
      1de1         
      1de8         

Source positions:
 pc offset  position
        3c        70
        5d       107
       10a       176
       248       289
       24e       299
       256       303
       25b       310
       263       314
       26c       325
       271       330
       276       335
       27b       340
       280       343
       29b       357
       2ba       370
       2bf       377
       2cb       389
       2d0       396
       356       438
       366       467
       396       496
       3a6       508
       3ea       524
       3ef       529
       3f8       540
       406       559
       40f       564
       414       571
       457       613
       468       642
       495       671
       4a5       683
       4e3       699
       4e8       704
       4f0       715
       4fc       734
       505       739
       50a       746
       557       789
       568       818
       595       847
       5a5       859
       5e3       875
       5e8       880
       5f0       891
       5fc       910
       605       915
       60a       922
       657       961
       668       990
       699      1019
       6a9      1031
       6e4      1047
       6e9      1052
       6f1      1063
       6fe      1076
       703      1083
       70a      1093
       710      1097
       717      1105
       71d      1111
       724      1121
       72b      1125
       732      1133
       739      1139
       73e      1146
       743      1155
       74a      1159
       751      1167
       756      1174
       75b      1181
       780      1193
       785      1200
       78a      1207
       78f      1214
       7b1      1245
       7c4      1262
       7d7      1279
       7dc      1286
       7e1      1293
       7e6      1300
       84a      1317
       85e      1329
       873      1341
       888      1353
       89d      1363
       8a6      1376
       8ac      1383
       8b5      1391
       8ba      1398
       8c2      1406
       8c7      1415
       8d0      1423
       8da      1426
       8e3      1433
       8e9      1440
       8ef      1447
       8f4      1454
       902      1477
       908      1483
       912      1493
       91a      1500
       a23      1605
       afa      1722
       aff      1729
       c3a      1822
       c42      1835
      104e      2386
      105f      2411
      10a8      2475
      10ca      2498
      112e      2562
      1150      2585
      11b3      2649
      11d5      2672
      1231      2736
      1253      2759
      1298      2808
      12b4      2829
      12f9      2878
      1314      2899
      136d      2948
      138e      2969
      1b45      3985
      1b5b      4000
      1b9c      4061
      1ba8      4069
      1bdf      3985
      1bed      4000
      1c36      4061
      1c42      4069
      1c83      3985
      1c91      4000
      1cda      4061
      1ce6      4069
      1d3d      4156
      1d46      4163
      1d4c      4170
      1d52      4177
      1d6d      4206
      1d9c      4226
      1dab      4229
      1db9      4239
      1dc0      4242
      1dce      4252
      1dd5      4255
      1de1      4265
      1de8      4268
      1e69         0
      1edb       412
      1f1c       587
      1f5f       763
      1fa2       935
      1fe1      1309
      2063      1759
      20d3      2375
      2186      3975

Safepoints (stack slots = 153, entries = 1, byte size = 34)
0x321fc577c5db    29b  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 49)
0x321fc577c5d7  internal wasm call
0x321fc577c6fb  internal wasm call
0x321fc577c7f3  internal wasm call
0x321fc577c8f3  internal wasm call
0x321fc577c9f7  internal wasm call
0x321fc577e0c1  internal wasm call
0x321fc577e1aa  wasm stub call  (0x321fc56a54d0)
0x321fc577e22c  wasm stub call  (0x321fc56a54d0)
0x321fc577e26d  wasm stub call  (0x321fc56a54d0)
0x321fc577e2b0  wasm stub call  (0x321fc56a54d0)
0x321fc577e2f3  wasm stub call  (0x321fc56a54d0)
0x321fc577e326  wasm stub call  (0x321fc56a54d0)
0x321fc577e3a4  wasm stub call  (0x321fc56a54d0)
0x321fc577e454  wasm stub call  (0x321fc56a54d0)
0x321fc577e50a  wasm stub call  (0x321fc56a54d0)
