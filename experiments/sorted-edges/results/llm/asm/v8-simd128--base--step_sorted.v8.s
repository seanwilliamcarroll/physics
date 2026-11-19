name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1467
kind: wasm function
compiler: TurboFan
Body (size = 8832 = 8816 + 16 padding)
Instructions (size = 8780)
0x20220d9243c0     0  55                   push rbp
0x20220d9243c1     1  4889e5               REX.W movq rbp,rsp
0x20220d9243c4     4  6a08                 push 0x8
0x20220d9243c6     6  56                   push rsi
0x20220d9243c7     7  4881eca8040000       REX.W subq rsp,0x4a8
0x20220d9243ce     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x20220d9243d2    12  488945d8             REX.W movq [rbp-0x28],rax
0x20220d9243d6    16  48897dc8             REX.W movq [rbp-0x38],rdi
0x20220d9243da    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d9243de    1e  0f86451e0000         jna 0x20220d926229  <+0x1e69>
0x20220d9243e4    24  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x20220d9243e8    28  458b18               movl r11,[r8]
0x20220d9243eb    2b  418d5bb0             leal rbx,[r11-0x50]
0x20220d9243ef    2f  418918               movl [r8],rbx
0x20220d9243f2    32  448bd8               movl r11,rax
0x20220d9243f5    35  4c8da790000000       REX.W leaq r12,[rdi+0x90]
0x20220d9243fc    3c  c4817b10041c         vmovsd xmm0,[r12+r11*1]
0x20220d924402    42  c5fa16d0             vmovshdup xmm2,xmm0
0x20220d924406    46  41ba0000803a         movl r10,0x3a800000
0x20220d92440c    4c  c4c1796eda           vmovd xmm3,r10
0x20220d924411    51  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x20220d924415    55  c5f828c8             vmovaps xmm1,xmm0
0x20220d924419    59  c5e259d9             vmulss xmm3,xmm3,xmm1
0x20220d92441d    5d  c4a17a10ac1fa0000000 vmovss xmm5,[rdi+r11*1+0xa0]
0x20220d924427    67  4c8945e8             REX.W movq [rbp-0x18],r8
0x20220d92442b    6b  48895de0             REX.W movq [rbp-0x20],rbx
0x20220d92442f    6f  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x20220d924436    76  c5fb115588           vmovsd [rbp-0x78],xmm2
0x20220d92443b    7b  c5fb114d90           vmovsd [rbp-0x70],xmm1
0x20220d924440    80  c5fb116dd0           vmovsd [rbp-0x30],xmm5
0x20220d924445    85  c5f82eed             vucomiss xmm5,xmm5
0x20220d924449    89  7a06                 jpe 0x20220d924451  <+0x91>
0x20220d92444b    8b  0f8409000000         jz 0x20220d92445a  <+0x9a>
0x20220d924451    91  c5f928f3             vmovapd xmm6,xmm3
0x20220d924455    95  e904000000           jmp 0x20220d92445e  <+0x9e>
0x20220d92445a    9a  c5f928f5             vmovapd xmm6,xmm5
0x20220d92445e    9e  c5f82edb             vucomiss xmm3,xmm3
0x20220d924462    a2  7a06                 jpe 0x20220d92446a  <+0xaa>
0x20220d924464    a4  0f8404000000         jz 0x20220d92446e  <+0xae>
0x20220d92446a    aa  c5f928de             vmovapd xmm3,xmm6
0x20220d92446e    ae  c5f82ef3             vucomiss xmm6,xmm3
0x20220d924472    b2  0f8704000000         ja 0x20220d92447c  <+0xbc>
0x20220d924478    b8  c5f928f3             vmovapd xmm6,xmm3
0x20220d92447c    bc  c5f82ef6             vucomiss xmm6,xmm6
0x20220d924480    c0  7a06                 jpe 0x20220d924488  <+0xc8>
0x20220d924482    c2  0f8409000000         jz 0x20220d924491  <+0xd1>
0x20220d924488    c8  c5f928dc             vmovapd xmm3,xmm4
0x20220d92448c    cc  e904000000           jmp 0x20220d924495  <+0xd5>
0x20220d924491    d1  c5f928de             vmovapd xmm3,xmm6
0x20220d924495    d5  c5f82ee4             vucomiss xmm4,xmm4
0x20220d924499    d9  7a06                 jpe 0x20220d9244a1  <+0xe1>
0x20220d92449b    db  0f8404000000         jz 0x20220d9244a5  <+0xe5>
0x20220d9244a1    e1  c5f928e3             vmovapd xmm4,xmm3
0x20220d9244a5    e5  c5f82edc             vucomiss xmm3,xmm4
0x20220d9244a9    e9  0f8704000000         ja 0x20220d9244b3  <+0xf3>
0x20220d9244af    ef  c5f928dc             vmovapd xmm3,xmm4
0x20220d9244b3    f3  41ba0020803f         movl r10,0x3f802000
0x20220d9244b9    f9  c4c1796ee2           vmovd xmm4,r10
0x20220d9244be    fe  c5da59db             vmulss xmm3,xmm4,xmm3
0x20220d9244c2   102  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x20220d9244c6   106  c5d972f419           vpslld xmm4,xmm4,25
0x20220d9244cb   10b  c5d972d402           vpsrld xmm4,xmm4,2
0x20220d9244d0   110  c5da5edb             vdivss xmm3,xmm4,xmm3
0x20220d9244d4   114  c5f828db             vmovaps xmm3,xmm3
0x20220d9244d8   118  c4a17a119c1f84000000 vmovss [rdi+r11*1+0x84],xmm3
0x20220d9244e2   122  c4e27918f3           vbroadcastss xmm6,xmm3
0x20220d9244e7   127  c5f859c6             vmulps xmm0,xmm0,xmm6
0x20220d9244eb   12b  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x20220d9244f1   131  c5f828f0             vmovaps xmm6,xmm0
0x20220d9244f5   135  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x20220d9244f9   139  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x20220d9244ff   13f  c4417b2ce0           vcvttsd2si r12,xmm8
0x20220d924504   144  4585e4               testl r12,r12
0x20220d924507   147  0f892b000000         jns 0x20220d924538  <+0x178>
0x20220d92450d   14d  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x20220d924517   157  c441f96efa           vmovq xmm15,r10
0x20220d92451c   15c  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x20220d924521   161  c4417b2ce7           vcvttsd2si r12,xmm15
0x20220d924526   166  4585e4               testl r12,r12
0x20220d924529   169  0f8809000000         js 0x20220d924538  <+0x178>
0x20220d92452f   16f  41ba00000080         movl r10,0x80000000
0x20220d924535   175  450be2               orl r12,r10
0x20220d924538   178  4589e2               movl r10,r12
0x20220d92453b   17b  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x20220d924540   180  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d924548   188  c441792ec8           vucomisd xmm9,xmm8
0x20220d92454d   18d  0f8aeb1c0000         jpe 0x20220d92623e  <+0x1e7e>
0x20220d924553   193  0f85e51c0000         jnz 0x20220d92623e  <+0x1e7e>
0x20220d924559   199  c4c1796ef4           vmovd xmm6,r12
0x20220d92455e   19e  c5f970f600           vpshufd xmm6,xmm6,0x0
0x20220d924563   1a3  c5fa16f8             vmovshdup xmm7,xmm0
0x20220d924567   1a7  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x20220d92456b   1ab  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x20220d924571   1b1  c4417b2ce1           vcvttsd2si r12,xmm9
0x20220d924576   1b6  4585e4               testl r12,r12
0x20220d924579   1b9  0f8928000000         jns 0x20220d9245a7  <+0x1e7>
0x20220d92457f   1bf  4c8b1589ffffff       REX.W movq r10,[rip+0xffffff89]
0x20220d924586   1c6  c441f96efa           vmovq xmm15,r10
0x20220d92458b   1cb  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x20220d924590   1d0  c4417b2ce7           vcvttsd2si r12,xmm15
0x20220d924595   1d5  4585e4               testl r12,r12
0x20220d924598   1d8  0f8809000000         js 0x20220d9245a7  <+0x1e7>
0x20220d92459e   1de  41ba00000080         movl r10,0x80000000
0x20220d9245a4   1e4  450be2               orl r12,r10
0x20220d9245a7   1e7  4589e2               movl r10,r12
0x20220d9245aa   1ea  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x20220d9245af   1ef  c441792ed1           vucomisd xmm10,xmm9
0x20220d9245b4   1f4  0f8aba1c0000         jpe 0x20220d926274  <+0x1eb4>
0x20220d9245ba   1fa  0f85b41c0000         jnz 0x20220d926274  <+0x1eb4>
0x20220d9245c0   200  c4c34922f401         vpinsrd xmm6,xmm6,r12,0x1
0x20220d9245c6   206  49ba0100000001000000 REX.W movq r10,0x100000001
0x20220d9245d0   210  c4c1f96efa           vmovq xmm7,r10
0x20220d9245d5   215  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x20220d9245d9   219  c4e2493ff7           vpmaxud xmm6,xmm6,xmm7
0x20220d9245de   21e  c44139efc0           vpxor xmm8,xmm8,xmm8
0x20220d9245e3   223  c538c2c802           vcmpps xmm9,xmm8,xmm0, (le)
0x20220d9245e8   228  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x20220d9245f2   232  c441f96ed2           vmovq xmm10,r10
0x20220d9245f7   237  c441296cd2           vpunpcklqdq xmm10,xmm10,xmm10
0x20220d9245fc   23c  c4c178c2c201         vcmpps xmm0,xmm0,xmm10, (lt)
0x20220d924602   242  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x20220d924606   246  c579dfff             vpandn xmm15,xmm0,xmm7
0x20220d92460a   24a  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x20220d92460e   24e  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x20220d924613   253  4c8da788000000       REX.W leaq r12,[rdi+0x88]
0x20220d92461a   25a  c4817813041c         vmovlps [r12+r11*1],xmm0
0x20220d924620   260  468ba41fcc000000     movl r12,[rdi+r11*1+0xcc]
0x20220d924628   268  4489641f48           movl [rdi+rbx*1+0x48],r12
0x20220d92462d   26d  4e8ba41fc4000000     REX.W movq r12,[rdi+r11*1+0xc4]
0x20220d924635   275  4c89641f40           REX.W movq [rdi+rbx*1+0x40],r12
0x20220d92463a   27a  448d6060             leal r12,[rax+0x60]
0x20220d92463e   27e  428b541f04           movl rdx,[rdi+r11*1+0x4]
0x20220d924643   283  428b4c1f08           movl rcx,[rdi+r11*1+0x8]
0x20220d924648   288  468b7c1f10           movl r15,[rdi+r11*1+0x10]
0x20220d92464d   28d  468b4c1f14           movl r9,[rdi+r11*1+0x14]
0x20220d924652   292  c5f811bd60feffff     vmovups [rbp-0x1a0],xmm7
0x20220d92465a   29a  c578118510ffffff     vmovups [rbp-0xf0],xmm8
0x20220d924662   2a2  4489e0               movl rax,r12
0x20220d924665   2a5  418bdf               movl rbx,r15
0x20220d924668   2a8  e88b86f2ff           call 0x20220d84ccf8  (jump table)
0x20220d92466d   2ad  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d924671   2b1  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d924678   2b8  42c744073800000000   movl [rdi+r8*1+0x38],0x0
0x20220d924681   2c1  448b5dd8             movl r11,[rbp-0x28]
0x20220d924685   2c5  418d93a0000000       leal rdx,[r11+0xa0]
0x20220d92468c   2cc  468b64077c           movl r12,[rdi+r8*1+0x7c]
0x20220d924691   2d1  468bbc0780000000     movl r15,[rdi+r8*1+0x80]
0x20220d924699   2d9  478d3cbc             leal r15,[r12+r15*4]
0x20220d92469d   2dd  468b740708           movl r14,[rdi+r8*1+0x8]
0x20220d9246a2   2e2  428b440704           movl rax,[rdi+r8*1+0x4]
0x20220d9246a7   2e7  418d5b30             leal rbx,[r11+0x30]
0x20220d9246ab   2eb  48895598             REX.W movq [rbp-0x68],rdx
0x20220d9246af   2ef  4c896580             REX.W movq [rbp-0x80],r12
0x20220d9246b3   2f3  4c89bd78ffffff       REX.W movq [rbp-0x88],r15
0x20220d9246ba   2fa  4c8975c0             REX.W movq [rbp-0x40],r14
0x20220d9246be   2fe  488945b8             REX.W movq [rbp-0x48],rax
0x20220d9246c2   302  48895db0             REX.W movq [rbp-0x50],rbx
0x20220d9246c6   306  4489e6               movl rsi,r12
0x20220d9246c9   309  33c9                 xorl rcx,rcx
0x20220d9246cb   30b  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d9246d3   313  660f1f840000000000   nop
0x20220d9246dc   31c  660f1f840000000000   nop
0x20220d9246e5   325  660f1f840000000000   nop
0x20220d9246ee   32e  660f1f840000000000   nop
0x20220d9246f7   337  660f1f840000000000   nop
0x20220d924700   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924704   344  0f86931b0000         jna 0x20220d92629d  <+0x1edd>
0x20220d92470a   34a  3bb578ffffff         cmpl rsi,[rbp-0x88]
0x20220d924710   350  0f8421000000         jz 0x20220d924737  <+0x377>
0x20220d924716   356  448b0c37             movl r9,[rdi+rsi*1]
0x20220d92471a   35a  83c604               addl rsi,0x4
0x20220d92471d   35d  453bf1               cmpl r14,r9
0x20220d924720   360  76de                 jna 0x20220d924700  <+0x340>
0x20220d924722   362  468d0c88             leal r9,[rax+r9*4]
0x20220d924726   366  c4a17a101c0f         vmovss xmm3,[rdi+r9*1]
0x20220d92472c   36c  41b901000000         movl r9,0x1
0x20220d924732   372  e909000000           jmp 0x20220d924740  <+0x380>
0x20220d924737   377  4533c9               xorl r9,r9
0x20220d92473a   37a  8bb578ffffff         movl rsi,[rbp-0x88]
0x20220d924740   380  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d924748   388  488975a8             REX.W movq [rbp-0x58],rsi
0x20220d92474c   38c  4183f901             cmpl r9,0x1
0x20220d924750   390  0f8570000000         jnz 0x20220d9247c6  <+0x406>
0x20220d924756   396  468b4c0730           movl r9,[rdi+r8*1+0x30]
0x20220d92475b   39b  42394c0730           cmpl [rdi+r8*1+0x30],rcx
0x20220d924760   3a0  0f8540000000         jnz 0x20220d9247a6  <+0x3e6>
0x20220d924766   3a6  48894da0             REX.W movq [rbp-0x60],rcx
0x20220d92476a   3aa  8bd1                 movl rdx,rcx
0x20220d92476c   3ac  b901000000           movl rcx,0x1
0x20220d924771   3b1  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d924775   3b5  8bc3                 movl rax,rbx
0x20220d924777   3b7  4c8bc9               REX.W movq r9,rcx
0x20220d92477a   3ba  e88185f2ff           call 0x20220d84cd00  (jump table)
0x20220d92477f   3bf  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d924783   3c3  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d92478a   3ca  448b5dd8             movl r11,[rbp-0x28]
0x20220d92478e   3ce  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d924796   3d6  8b75a8               movl rsi,[rbp-0x58]
0x20220d924799   3d9  8b4da0               movl rcx,[rbp-0x60]
0x20220d92479c   3dc  8b5db0               movl rbx,[rbp-0x50]
0x20220d92479f   3df  8b45b8               movl rax,[rbp-0x48]
0x20220d9247a2   3e2  448b75c0             movl r14,[rbp-0x40]
0x20220d9247a6   3e6  448d6101             leal r12,[rcx+0x1]
0x20220d9247aa   3ea  4689640738           movl [rdi+r8*1+0x38],r12
0x20220d9247af   3ef  468b7c0734           movl r15,[rdi+r8*1+0x34]
0x20220d9247b4   3f4  458d3c8f             leal r15,[r15+rcx*4]
0x20220d9247b8   3f8  c4a17a111c3f         vmovss [rdi+r15*1],xmm3
0x20220d9247be   3fe  4489e1               movl rcx,r12
0x20220d9247c1   401  e93affffff           jmp 0x20220d924700  <+0x340>
0x20220d9247c6   406  42c744074400000000   movl [rdi+r8*1+0x44],0x0
0x20220d9247cf   40f  468b640714           movl r12,[rdi+r8*1+0x14]
0x20220d9247d4   414  468b7c0710           movl r15,[rdi+r8*1+0x10]
0x20220d9247d9   419  418d433c             leal rax,[r11+0x3c]
0x20220d9247dd   41d  4c8965b0             REX.W movq [rbp-0x50],r12
0x20220d9247e1   421  4c897da8             REX.W movq [rbp-0x58],r15
0x20220d9247e5   425  488945a0             REX.W movq [rbp-0x60],rax
0x20220d9247e9   429  448b7580             movl r14,[rbp-0x80]
0x20220d9247ed   42d  33d2                 xorl rdx,rdx
0x20220d9247ef   42f  660f1f840000000000   nop
0x20220d9247f8   438  0f1f840000000000     nop
0x20220d924800   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924804   444  0f86d41a0000         jna 0x20220d9262de  <+0x1f1e>
0x20220d92480a   44a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x20220d924811   451  0f8420000000         jz 0x20220d924837  <+0x477>
0x20220d924817   457  428b1c37             movl rbx,[rdi+r14*1]
0x20220d92481b   45b  4183c604             addl r14,0x4
0x20220d92481f   45f  443be3               cmpl r12,rbx
0x20220d924822   462  76dc                 jna 0x20220d924800  <+0x440>
0x20220d924824   464  418d1c9f             leal rbx,[r15+rbx*4]
0x20220d924828   468  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x20220d92482d   46d  bb01000000           movl rbx,0x1
0x20220d924832   472  e909000000           jmp 0x20220d924840  <+0x480>
0x20220d924837   477  33db                 xorl rbx,rbx
0x20220d924839   479  448bb578ffffff       movl r14,[rbp-0x88]
0x20220d924840   480  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d924848   488  4c8975b8             REX.W movq [rbp-0x48],r14
0x20220d92484c   48c  83fb01               cmpl rbx,0x1
0x20220d92484f   48f  0f8567000000         jnz 0x20220d9248bc  <+0x4fc>
0x20220d924855   495  428b5c073c           movl rbx,[rdi+r8*1+0x3c]
0x20220d92485a   49a  423954073c           cmpl [rdi+r8*1+0x3c],rdx
0x20220d92485f   49f  0f853b000000         jnz 0x20220d9248a0  <+0x4e0>
0x20220d924865   4a5  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d924869   4a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d92486d   4ad  b901000000           movl rcx,0x1
0x20220d924872   4b2  e88984f2ff           call 0x20220d84cd00  (jump table)
0x20220d924877   4b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d92487b   4bb  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d924882   4c2  448b5dd8             movl r11,[rbp-0x28]
0x20220d924886   4c6  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d92488e   4ce  448b75b8             movl r14,[rbp-0x48]
0x20220d924892   4d2  8b55c0               movl rdx,[rbp-0x40]
0x20220d924895   4d5  8b45a0               movl rax,[rbp-0x60]
0x20220d924898   4d8  448b7da8             movl r15,[rbp-0x58]
0x20220d92489c   4dc  448b65b0             movl r12,[rbp-0x50]
0x20220d9248a0   4e0  8d5a01               leal rbx,[rdx+0x1]
0x20220d9248a3   4e3  42895c0744           movl [rdi+r8*1+0x44],rbx
0x20220d9248a8   4e8  428b4c0740           movl rcx,[rdi+r8*1+0x40]
0x20220d9248ad   4ed  8d1491               leal rdx,[rcx+rdx*4]
0x20220d9248b0   4f0  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x20220d9248b5   4f5  8bd3                 movl rdx,rbx
0x20220d9248b7   4f7  e944ffffff           jmp 0x20220d924800  <+0x440>
0x20220d9248bc   4fc  42c744075000000000   movl [rdi+r8*1+0x50],0x0
0x20220d9248c5   505  468b640720           movl r12,[rdi+r8*1+0x20]
0x20220d9248ca   50a  468b7c071c           movl r15,[rdi+r8*1+0x1c]
0x20220d9248cf   50f  418d4348             leal rax,[r11+0x48]
0x20220d9248d3   513  4c8965a0             REX.W movq [rbp-0x60],r12
0x20220d9248d7   517  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x20220d9248de   51e  488945b8             REX.W movq [rbp-0x48],rax
0x20220d9248e2   522  448b7580             movl r14,[rbp-0x80]
0x20220d9248e6   526  33d2                 xorl rdx,rdx
0x20220d9248e8   528  660f1f840000000000   nop
0x20220d9248f1   531  660f1f840000000000   nop
0x20220d9248fa   53a  660f1f440000         nop
0x20220d924900   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924904   544  0f86171a0000         jna 0x20220d926321  <+0x1f61>
0x20220d92490a   54a  443bb578ffffff       cmpl r14,[rbp-0x88]
0x20220d924911   551  0f8420000000         jz 0x20220d924937  <+0x577>
0x20220d924917   557  428b1c37             movl rbx,[rdi+r14*1]
0x20220d92491b   55b  4183c604             addl r14,0x4
0x20220d92491f   55f  443be3               cmpl r12,rbx
0x20220d924922   562  76dc                 jna 0x20220d924900  <+0x540>
0x20220d924924   564  418d1c9f             leal rbx,[r15+rbx*4]
0x20220d924928   568  c5fa101c1f           vmovss xmm3,[rdi+rbx*1]
0x20220d92492d   56d  bb01000000           movl rbx,0x1
0x20220d924932   572  e909000000           jmp 0x20220d924940  <+0x580>
0x20220d924937   577  33db                 xorl rbx,rbx
0x20220d924939   579  448bb578ffffff       movl r14,[rbp-0x88]
0x20220d924940   580  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d924948   588  4c8975a8             REX.W movq [rbp-0x58],r14
0x20220d92494c   58c  83fb01               cmpl rbx,0x1
0x20220d92494f   58f  0f856a000000         jnz 0x20220d9249bf  <+0x5ff>
0x20220d924955   595  428b5c0748           movl rbx,[rdi+r8*1+0x48]
0x20220d92495a   59a  4239540748           cmpl [rdi+r8*1+0x48],rdx
0x20220d92495f   59f  0f853e000000         jnz 0x20220d9249a3  <+0x5e3>
0x20220d924965   5a5  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d924969   5a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d92496d   5ad  b901000000           movl rcx,0x1
0x20220d924972   5b2  e88983f2ff           call 0x20220d84cd00  (jump table)
0x20220d924977   5b7  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d92497b   5bb  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d924982   5c2  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d92498a   5ca  448b5dd8             movl r11,[rbp-0x28]
0x20220d92498e   5ce  448b75a8             movl r14,[rbp-0x58]
0x20220d924992   5d2  8b55c0               movl rdx,[rbp-0x40]
0x20220d924995   5d5  8b45b8               movl rax,[rbp-0x48]
0x20220d924998   5d8  448bbd68ffffff       movl r15,[rbp-0x98]
0x20220d92499f   5df  448b65a0             movl r12,[rbp-0x60]
0x20220d9249a3   5e3  8d5a01               leal rbx,[rdx+0x1]
0x20220d9249a6   5e6  42895c0750           movl [rdi+r8*1+0x50],rbx
0x20220d9249ab   5eb  428b4c074c           movl rcx,[rdi+r8*1+0x4c]
0x20220d9249b0   5f0  8d1491               leal rdx,[rcx+rdx*4]
0x20220d9249b3   5f3  c5fa111c17           vmovss [rdi+rdx*1],xmm3
0x20220d9249b8   5f8  8bd3                 movl rdx,rbx
0x20220d9249ba   5fa  e941ffffff           jmp 0x20220d924900  <+0x540>
0x20220d9249bf   5ff  42c744075c00000000   movl [rdi+r8*1+0x5c],0x0
0x20220d9249c8   608  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x20220d9249cd   60d  468b7c0728           movl r15,[rdi+r8*1+0x28]
0x20220d9249d2   612  418d4354             leal rax,[r11+0x54]
0x20220d9249d6   616  4c8965b0             REX.W movq [rbp-0x50],r12
0x20220d9249da   61a  4c897db8             REX.W movq [rbp-0x48],r15
0x20220d9249de   61e  488945d8             REX.W movq [rbp-0x28],rax
0x20220d9249e2   622  33d2                 xorl rdx,rdx
0x20220d9249e4   624  448b5d80             movl r11,[rbp-0x80]
0x20220d9249e8   628  660f1f840000000000   nop
0x20220d9249f1   631  660f1f840000000000   nop
0x20220d9249fa   63a  660f1f440000         nop
0x20220d924a00   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924a04   644  0f865d190000         jna 0x20220d926367  <+0x1fa7>
0x20220d924a0a   64a  443b9d78ffffff       cmpl r11,[rbp-0x88]
0x20220d924a11   651  0f8422000000         jz 0x20220d924a39  <+0x679>
0x20220d924a17   657  468b341f             movl r14,[rdi+r11*1]
0x20220d924a1b   65b  4183c304             addl r11,0x4
0x20220d924a1f   65f  453be6               cmpl r12,r14
0x20220d924a22   662  76dc                 jna 0x20220d924a00  <+0x640>
0x20220d924a24   664  478d34b7             leal r14,[r15+r14*4]
0x20220d924a28   668  c4a17a101c37         vmovss xmm3,[rdi+r14*1]
0x20220d924a2e   66e  41be01000000         movl r14,0x1
0x20220d924a34   674  e90a000000           jmp 0x20220d924a43  <+0x683>
0x20220d924a39   679  4533f6               xorl r14,r14
0x20220d924a3c   67c  448b9d78ffffff       movl r11,[rbp-0x88]
0x20220d924a43   683  4c895d80             REX.W movq [rbp-0x80],r11
0x20220d924a47   687  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d924a4f   68f  4183fe01             cmpl r14,0x1
0x20220d924a53   693  0f8565000000         jnz 0x20220d924abe  <+0x6fe>
0x20220d924a59   699  468b740754           movl r14,[rdi+r8*1+0x54]
0x20220d924a5e   69e  4239540754           cmpl [rdi+r8*1+0x54],rdx
0x20220d924a63   6a3  0f8537000000         jnz 0x20220d924aa0  <+0x6e0>
0x20220d924a69   6a9  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d924a6d   6ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d924a71   6b1  b901000000           movl rcx,0x1
0x20220d924a76   6b6  e88582f2ff           call 0x20220d84cd00  (jump table)
0x20220d924a7b   6bb  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d924a7f   6bf  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d924a86   6c6  8b55c0               movl rdx,[rbp-0x40]
0x20220d924a89   6c9  448b5d80             movl r11,[rbp-0x80]
0x20220d924a8d   6cd  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d924a95   6d5  8b45d8               movl rax,[rbp-0x28]
0x20220d924a98   6d8  448b7db8             movl r15,[rbp-0x48]
0x20220d924a9c   6dc  448b65b0             movl r12,[rbp-0x50]
0x20220d924aa0   6e0  448d7201             leal r14,[rdx+0x1]
0x20220d924aa4   6e4  468974075c           movl [rdi+r8*1+0x5c],r14
0x20220d924aa9   6e9  428b5c0758           movl rbx,[rdi+r8*1+0x58]
0x20220d924aae   6ee  8d1c93               leal rbx,[rbx+rdx*4]
0x20220d924ab1   6f1  c5fa111c1f           vmovss [rdi+rbx*1],xmm3
0x20220d924ab6   6f6  418bd6               movl rdx,r14
0x20220d924ab9   6f9  e942ffffff           jmp 0x20220d924a00  <+0x640>
0x20220d924abe   6fe  468b5c0738           movl r11,[rdi+r8*1+0x38]
0x20220d924ac3   703  c4a17a6f440730       vmovdqu xmm0,[rdi+r8*1+0x30]
0x20220d924aca   70a  c4a17a6f1c07         vmovdqu xmm3,[rdi+r8*1]
0x20220d924ad0   710  c4a17a7f5c0730       vmovdqu [rdi+r8*1+0x30],xmm3
0x20220d924ad7   717  c4a17a7f0407         vmovdqu [rdi+r8*1],xmm0
0x20220d924add   71d  c4a17a6f440740       vmovdqu xmm0,[rdi+r8*1+0x40]
0x20220d924ae4   724  c4a17a6f5c0710       vmovdqu xmm3,[rdi+r8*1+0x10]
0x20220d924aeb   72b  c4a17a7f5c0740       vmovdqu [rdi+r8*1+0x40],xmm3
0x20220d924af2   732  c4a17a7f440710       vmovdqu [rdi+r8*1+0x10],xmm0
0x20220d924af9   739  4e8b640750           REX.W movq r12,[rdi+r8*1+0x50]
0x20220d924afe   73e  468b7c0758           movl r15,[rdi+r8*1+0x58]
0x20220d924b03   743  c4a17a6f440720       vmovdqu xmm0,[rdi+r8*1+0x20]
0x20220d924b0a   74a  c4a17a7f440750       vmovdqu [rdi+r8*1+0x50],xmm0
0x20220d924b11   751  46897c0728           movl [rdi+r8*1+0x28],r15
0x20220d924b16   756  428954072c           movl [rdi+r8*1+0x2c],rdx
0x20220d924b1b   75b  4e89640720           REX.W movq [rdi+r8*1+0x20],r12
0x20220d924b20   760  4c895dd8             REX.W movq [rbp-0x28],r11
0x20220d924b24   764  4585db               testl r11,r11
0x20220d924b27   767  0f8513000000         jnz 0x20220d924b40  <+0x780>
0x20220d924b2d   76d  8b5de0               movl rbx,[rbp-0x20]
0x20220d924b30   770  8d7b50               leal rdi,[rbx+0x50]
0x20220d924b33   773  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x20220d924b37   777  41893c24             movl [r12],rdi
0x20220d924b3b   77b  488be5               REX.W movq rsp,rbp
0x20220d924b3e   77e  5d                   pop rbp
0x20220d924b3f   77f  c3                   retl
0x20220d924b40   780  468b64075c           movl r12,[rdi+r8*1+0x5c]
0x20220d924b45   785  468b7c0750           movl r15,[rdi+r8*1+0x50]
0x20220d924b4a   78a  468b740744           movl r14,[rdi+r8*1+0x44]
0x20220d924b4f   78f  428b440738           movl rax,[rdi+r8*1+0x38]
0x20220d924b54   794  8bd8                 movl rbx,rax
0x20220d924b56   796  443bf0               cmpl r14,rax
0x20220d924b59   799  410f42de             cmovcl rbx,r14
0x20220d924b5d   79d  448bf3               movl r14,rbx
0x20220d924b60   7a0  443bfb               cmpl r15,rbx
0x20220d924b63   7a3  450f42f7             cmovcl r14,r15
0x20220d924b67   7a7  458bfe               movl r15,r14
0x20220d924b6a   7aa  453be6               cmpl r12,r14
0x20220d924b6d   7ad  450f42fc             cmovcl r15,r12
0x20220d924b71   7b1  c4a17a108407a4000000 vmovss xmm0,[rdi+r8*1+0xa4]
0x20220d924b7b   7bb  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x20220d924b7f   7bf  c4e27918d8           vbroadcastss xmm3,xmm0
0x20220d924b84   7c4  c5fb1065d0           vmovsd xmm4,[rbp-0x30]
0x20220d924b89   7c9  c5da59e4             vmulss xmm4,xmm4,xmm4
0x20220d924b8d   7cd  c4e27918ec           vbroadcastss xmm5,xmm4
0x20220d924b92   7d2  468b640758           movl r12,[rdi+r8*1+0x58]
0x20220d924b97   7d7  468b74074c           movl r14,[rdi+r8*1+0x4c]
0x20220d924b9c   7dc  428b440740           movl rax,[rdi+r8*1+0x40]
0x20220d924ba1   7e1  428b5c0734           movl rbx,[rdi+r8*1+0x34]
0x20220d924ba6   7e6  4c897da0             REX.W movq [rbp-0x60],r15
0x20220d924baa   7ea  c5fb118540ffffff     vmovsd [rbp-0xc0],xmm0
0x20220d924bb2   7f2  c5f8119d50feffff     vmovups [rbp-0x1b0],xmm3
0x20220d924bba   7fa  c5fb11a548ffffff     vmovsd [rbp-0xb8],xmm4
0x20220d924bc2   802  c5f811ad00fcffff     vmovups [rbp-0x400],xmm5
0x20220d924bca   80a  4c8965c0             REX.W movq [rbp-0x40],r12
0x20220d924bce   80e  4c8975b8             REX.W movq [rbp-0x48],r14
0x20220d924bd2   812  488945b0             REX.W movq [rbp-0x50],rax
0x20220d924bd6   816  48895da8             REX.W movq [rbp-0x58],rbx
0x20220d924bda   81a  33c9                 xorl rcx,rcx
0x20220d924bdc   81c  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d924be0   820  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d924be8   828  488bd1               REX.W movq rdx,rcx
0x20220d924beb   82b  660f1f840000000000   nop
0x20220d924bf4   834  660f1f840000000000   nop
0x20220d924bfd   83d  0f1f00               nop
0x20220d924c00   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924c04   844  0f869c170000         jna 0x20220d9263a6  <+0x1fe6>
0x20220d924c0a   84a  428b740708           movl rsi,[rdi+r8*1+0x8]
0x20220d924c0f   84f  4889b548fbffff       REX.W movq [rbp-0x4b8],rsi
0x20220d924c16   856  3bf2                 cmpl rsi,rdx
0x20220d924c18   858  0f86e9150000         jna 0x20220d926207  <+0x1e47>
0x20220d924c1e   85e  468b4c0714           movl r9,[rdi+r8*1+0x14]
0x20220d924c23   863  4c898d68fbffff       REX.W movq [rbp-0x498],r9
0x20220d924c2a   86a  443bca               cmpl r9,rdx
0x20220d924c2d   86d  0f86d4150000         jna 0x20220d926207  <+0x1e47>
0x20220d924c33   873  468b5c0720           movl r11,[rdi+r8*1+0x20]
0x20220d924c38   878  4c899d58fbffff       REX.W movq [rbp-0x4a8],r11
0x20220d924c3f   87f  443bda               cmpl r11,rdx
0x20220d924c42   882  0f86bf150000         jna 0x20220d926207  <+0x1e47>
0x20220d924c48   888  468b64072c           movl r12,[rdi+r8*1+0x2c]
0x20220d924c4d   88d  4c89a570fbffff       REX.W movq [rbp-0x490],r12
0x20220d924c54   894  443be2               cmpl r12,rdx
0x20220d924c57   897  0f86aa150000         jna 0x20220d926207  <+0x1e47>
0x20220d924c5d   89d  468b7c0704           movl r15,[rdi+r8*1+0x4]
0x20220d924c62   8a2  458d3497             leal r14,[r15+rdx*4]
0x20220d924c66   8a6  c4217a100c37         vmovss xmm9,[rdi+r14*1]
0x20220d924c6c   8ac  468b740710           movl r14,[rdi+r8*1+0x10]
0x20220d924c71   8b1  418d0496             leal rax,[r14+rdx*4]
0x20220d924c75   8b5  c57a101407           vmovss xmm10,[rdi+rax*1]
0x20220d924c7a   8ba  428b44071c           movl rax,[rdi+r8*1+0x1c]
0x20220d924c7f   8bf  8d1c90               leal rbx,[rax+rdx*4]
0x20220d924c82   8c2  c57a101c1f           vmovss xmm11,[rdi+rbx*1]
0x20220d924c87   8c7  428b5c0728           movl rbx,[rdi+r8*1+0x28]
0x20220d924c8c   8cc  448d2493             leal r12,[rbx+rdx*4]
0x20220d924c90   8d0  488955d0             REX.W movq [rbp-0x30],rdx
0x20220d924c94   8d4  c4217a102427         vmovss xmm12,[rdi+r12*1]
0x20220d924c9a   8da  8b55e0               movl rdx,[rbp-0x20]
0x20220d924c9d   8dd  c57a1164170c         vmovss [rdi+rdx*1+0xc],xmm12
0x20220d924ca3   8e3  c57a115c1708         vmovss [rdi+rdx*1+0x8],xmm11
0x20220d924ca9   8e9  c57a11541704         vmovss [rdi+rdx*1+0x4],xmm10
0x20220d924caf   8ef  c57a110c17           vmovss [rdi+rdx*1],xmm9
0x20220d924cb4   8f4  48c744172000000000   REX.W movq [rdi+rdx*1+0x20],0x0
0x20220d924cbd   8fd  c44121efdb           vpxor xmm11,xmm11,xmm11
0x20220d924cc2   902  c57a7f5c1710         vmovdqu [rdi+rdx*1+0x10],xmm11
0x20220d924cc8   908  c4217a109c0784000000 vmovss xmm11,[rdi+r8*1+0x84]
0x20220d924cd2   912  c744172800000000     movl [rdi+rdx*1+0x28],0x0
0x20220d924cda   91a  468ba4078c000000     movl r12,[rdi+r8*1+0x8c]
0x20220d924ce2   922  33d2                 xorl rdx,rdx
0x20220d924ce4   924  4585e4               testl r12,r12
0x20220d924ce7   927  0f95c2               setnzl dl
0x20220d924cea   92a  442be2               subl r12,rdx
0x20220d924ced   92d  c4412a59e3           vmulss xmm12,xmm10,xmm11
0x20220d924cf2   932  4c89bd90fbffff       REX.W movq [rbp-0x470],r15
0x20220d924cf9   939  c57b118d30ffffff     vmovsd [rbp-0xd0],xmm9
0x20220d924d01   941  4c89b560fbffff       REX.W movq [rbp-0x4a0],r14
0x20220d924d08   948  c57b119538ffffff     vmovsd [rbp-0xc8],xmm10
0x20220d924d10   950  48898550fbffff       REX.W movq [rbp-0x4b0],rax
0x20220d924d17   957  48899d78fbffff       REX.W movq [rbp-0x488],rbx
0x20220d924d1e   95e  c441782ee4           vucomiss xmm12,xmm12
0x20220d924d23   963  7a06                 jpe 0x20220d924d2b  <+0x96b>
0x20220d924d25   965  0f8404000000         jz 0x20220d924d2f  <+0x96f>
0x20220d924d2b   96b  c57928e6             vmovapd xmm12,xmm6
0x20220d924d2f   96f  c5782ee6             vucomiss xmm12,xmm6
0x20220d924d33   973  0f8704000000         ja 0x20220d924d3d  <+0x97d>
0x20220d924d39   979  c57928e6             vmovapd xmm12,xmm6
0x20220d924d3d   97d  c443190ae409         vroundss xmm12,xmm12,xmm12,0x9
0x20220d924d43   983  c4411a5aec           vcvtss2sd xmm13,xmm12,xmm12
0x20220d924d48   988  c443090bf50b         vroundsd xmm14,xmm14,xmm13,0xb
0x20220d924d4e   98e  c4c17b2cd6           vcvttsd2si rdx,xmm14
0x20220d924d53   993  85d2                 testl rdx,rdx
0x20220d924d55   995  0f8927000000         jns 0x20220d924d82  <+0x9c2>
0x20220d924d5b   99b  4c8b15adf7ffff       REX.W movq r10,[rip+0xfffff7ad]
0x20220d924d62   9a2  c441f96efa           vmovq xmm15,r10
0x20220d924d67   9a7  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x20220d924d6c   9ac  c4c17b2cd7           vcvttsd2si rdx,xmm15
0x20220d924d71   9b1  85d2                 testl rdx,rdx
0x20220d924d73   9b3  0f8809000000         js 0x20220d924d82  <+0x9c2>
0x20220d924d79   9b9  41ba00000080         movl r10,0x80000000
0x20220d924d7f   9bf  410bd2               orl rdx,r10
0x20220d924d82   9c2  448bd2               movl r10,rdx
0x20220d924d85   9c5  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x20220d924d8a   9ca  c4c1792ece           vucomisd xmm1,xmm14
0x20220d924d8f   9cf  0f8a4b160000         jpe 0x20220d9263e0  <+0x2020>
0x20220d924d95   9d5  0f8545160000         jnz 0x20220d9263e0  <+0x2020>
0x20220d924d9b   9db  8bda                 movl rbx,rdx
0x20220d924d9d   9dd  443be2               cmpl r12,rdx
0x20220d924da0   9e0  410f42dc             cmovcl rbx,r12
0x20220d924da4   9e4  41ba0000804f         movl r10,0x4f800000
0x20220d924daa   9ea  c441796eea           vmovd xmm13,r10
0x20220d924daf   9ef  488bd1               REX.W movq rdx,rcx
0x20220d924db2   9f2  c441782eec           vucomiss xmm13,xmm12
0x20220d924db7   9f7  0f47d3               cmoval rdx,rbx
0x20220d924dba   9fa  33db                 xorl rbx,rbx
0x20220d924dbc   9fc  85d2                 testl rdx,rdx
0x20220d924dbe   9fe  0f95c3               setnzl bl
0x20220d924dc1   a01  448bca               movl r9,rdx
0x20220d924dc4   a04  442bcb               subl r9,rbx
0x20220d924dc7   a07  8d5a01               leal rbx,[rdx+0x1]
0x20220d924dca   a0a  8bd3                 movl rdx,rbx
0x20220d924dcc   a0c  443be3               cmpl r12,rbx
0x20220d924dcf   a0f  410f42d4             cmovcl rdx,r12
0x20220d924dd3   a13  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x20220d924dda   a1a  413bd1               cmpl rdx,r9
0x20220d924ddd   a1d  0f823a130000         jc 0x20220d92611d  <+0x1d5d>
0x20220d924de3   a23  468ba40788000000     movl r12,[rdi+r8*1+0x88]
0x20220d924deb   a2b  33db                 xorl rbx,rbx
0x20220d924ded   a2d  4585e4               testl r12,r12
0x20220d924df0   a30  0f95c3               setnzl bl
0x20220d924df3   a33  4c89a520ffffff       REX.W movq [rbp-0xe0],r12
0x20220d924dfa   a3a  442be3               subl r12,rbx
0x20220d924dfd   a3d  c4412259d9           vmulss xmm11,xmm11,xmm9
0x20220d924e02   a42  c441782edb           vucomiss xmm11,xmm11
0x20220d924e07   a47  7a06                 jpe 0x20220d924e0f  <+0xa4f>
0x20220d924e09   a49  0f8404000000         jz 0x20220d924e13  <+0xa53>
0x20220d924e0f   a4f  c57928de             vmovapd xmm11,xmm6
0x20220d924e13   a53  c5782ede             vucomiss xmm11,xmm6
0x20220d924e17   a57  0f8704000000         ja 0x20220d924e21  <+0xa61>
0x20220d924e1d   a5d  c57928de             vmovapd xmm11,xmm6
0x20220d924e21   a61  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0x20220d924e27   a67  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0x20220d924e2c   a6c  c443090bf40b         vroundsd xmm14,xmm14,xmm12,0xb
0x20220d924e32   a72  c4c17b2cde           vcvttsd2si rbx,xmm14
0x20220d924e37   a77  85db                 testl rbx,rbx
0x20220d924e39   a79  0f8927000000         jns 0x20220d924e66  <+0xaa6>
0x20220d924e3f   a7f  4c8b15c9f6ffff       REX.W movq r10,[rip+0xfffff6c9]
0x20220d924e46   a86  c441f96efa           vmovq xmm15,r10
0x20220d924e4b   a8b  c4410358fe           vaddsd xmm15,xmm15,xmm14
0x20220d924e50   a90  c4c17b2cdf           vcvttsd2si rbx,xmm15
0x20220d924e55   a95  85db                 testl rbx,rbx
0x20220d924e57   a97  0f8809000000         js 0x20220d924e66  <+0xaa6>
0x20220d924e5d   a9d  41ba00000080         movl r10,0x80000000
0x20220d924e63   aa3  410bda               orl rbx,r10
0x20220d924e66   aa6  448bd3               movl r10,rbx
0x20220d924e69   aa9  c4c1832aca           vcvtqsi2sd xmm1,xmm15,r10
0x20220d924e6e   aae  c4c1792ece           vucomisd xmm1,xmm14
0x20220d924e73   ab3  0f8a8b150000         jpe 0x20220d926404  <+0x2044>
0x20220d924e79   ab9  0f8585150000         jnz 0x20220d926404  <+0x2044>
0x20220d924e7f   abf  8bd3                 movl rdx,rbx
0x20220d924e81   ac1  443be3               cmpl r12,rbx
0x20220d924e84   ac4  410f42d4             cmovcl rdx,r12
0x20220d924e88   ac8  488bd9               REX.W movq rbx,rcx
0x20220d924e8b   acb  c441782eeb           vucomiss xmm13,xmm11
0x20220d924e90   ad0  0f47da               cmoval rbx,rdx
0x20220d924e93   ad3  33d2                 xorl rdx,rdx
0x20220d924e95   ad5  85db                 testl rbx,rbx
0x20220d924e97   ad7  0f95c2               setnzl dl
0x20220d924e9a   ada  448bf3               movl r14,rbx
0x20220d924e9d   add  442bf2               subl r14,rdx
0x20220d924ea0   ae0  83c301               addl rbx,0x1
0x20220d924ea3   ae3  8bd3                 movl rdx,rbx
0x20220d924ea5   ae5  443be3               cmpl r12,rbx
0x20220d924ea8   ae8  410f42d4             cmovcl rdx,r12
0x20220d924eac   aec  448d6201             leal r12,[rdx+0x1]
0x20220d924eb0   af0  c4427918d9           vbroadcastss xmm11,xmm9
0x20220d924eb5   af5  c4427918e2           vbroadcastss xmm12,xmm10
0x20220d924eba   afa  428b5c0764           movl rbx,[rdi+r8*1+0x64]
0x20220d924ebf   aff  428b540768           movl rdx,[rdi+r8*1+0x68]
0x20220d924ec4   b04  4c89b508ffffff       REX.W movq [rbp-0xf8],r14
0x20220d924ecb   b0b  4c89a5a0fbffff       REX.W movq [rbp-0x460],r12
0x20220d924ed2   b12  c578119de0fbffff     vmovups [rbp-0x420],xmm11
0x20220d924eda   b1a  c57811a5f0fbffff     vmovups [rbp-0x410],xmm12
0x20220d924ee2   b22  48899d98fbffff       REX.W movq [rbp-0x468],rbx
0x20220d924ee9   b29  48899500ffffff       REX.W movq [rbp-0x100],rdx
0x20220d924ef0   b30  c57810bd10ffffff     vmovups xmm15,[rbp-0xf0]
0x20220d924ef8   b38  c57811bdc0feffff     vmovups [rbp-0x140],xmm15
0x20220d924f00   b40  c5fb11b5e8feffff     vmovsd [rbp-0x118],xmm6
0x20220d924f08   b48  c5fb11b5e0feffff     vmovsd [rbp-0x120],xmm6
0x20220d924f10   b50  c5fb11b5d8feffff     vmovsd [rbp-0x128],xmm6
0x20220d924f18   b58  e9a7000000           jmp 0x20220d924fc4  <+0xc04>
0x20220d924f1d   b5d  660f1f840000000000   nop
0x20220d924f26   b66  660f1f840000000000   nop
0x20220d924f2f   b6f  660f1f840000000000   nop
0x20220d924f38   b78  0f1f840000000000     nop
0x20220d924f40   b80  c5f81195c0feffff     vmovups [rbp-0x140],xmm2
0x20220d924f48   b88  c57b11ade8feffff     vmovsd [rbp-0x118],xmm13
0x20220d924f50   b90  c57b11b5e0feffff     vmovsd [rbp-0x120],xmm14
0x20220d924f58   b98  c5fb118dd8feffff     vmovsd [rbp-0x128],xmm1
0x20220d924f60   ba0  448bcf               movl r9,rdi
0x20220d924f63   ba3  488bf8               REX.W movq rdi,rax
0x20220d924f66   ba6  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d924f6e   bae  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d924f76   bb6  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d924f7e   bbe  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x20220d924f86   bc6  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x20220d924f8e   bce  33c9                 xorl rcx,rcx
0x20220d924f90   bd0  448b9d58fbffff       movl r11,[rbp-0x4a8]
0x20220d924f97   bd7  8b8550fbffff         movl rax,[rbp-0x4b0]
0x20220d924f9d   bdd  8bb548fbffff         movl rsi,[rbp-0x4b8]
0x20220d924fa3   be3  448bbd90fbffff       movl r15,[rbp-0x470]
0x20220d924faa   bea  8b9d98fbffff         movl rbx,[rbp-0x468]
0x20220d924fb0   bf0  8b9500ffffff         movl rdx,[rbp-0x100]
0x20220d924fb6   bf6  448ba5a0fbffff       movl r12,[rbp-0x460]
0x20220d924fbd   bfd  448bb508ffffff       movl r14,[rbp-0xf8]
0x20220d924fc4   c04  4c894d80             REX.W movq [rbp-0x80],r9
0x20220d924fc8   c08  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d924fcc   c0c  0f8656140000         jna 0x20220d926428  <+0x2068>
0x20220d924fd2   c12  448b8520ffffff       movl r8,[rbp-0xe0]
0x20220d924fd9   c19  450fafc1             imull r8,r9
0x20220d924fdd   c1d  478d0c06             leal r9,[r14+r8*1]
0x20220d924fe1   c21  413bd1               cmpl rdx,r9
0x20220d924fe4   c24  0f862a000000         jna 0x20220d925014  <+0xc54>
0x20220d924fea   c2a  4501e0               addl r8,r12
0x20220d924fed   c2d  413bd0               cmpl rdx,r8
0x20220d924ff0   c30  0f861e000000         jna 0x20220d925014  <+0xc54>
0x20220d924ff6   c36  468d0483             leal r8,[rbx+r8*4]
0x20220d924ffa   c3a  468b0407             movl r8,[rdi+r8*1]
0x20220d924ffe   c3e  468d0c8b             leal r9,[rbx+r9*4]
0x20220d925002   c42  468b0c0f             movl r9,[rdi+r9*1]
0x20220d925006   c46  458bd1               movl r10,r9
0x20220d925009   c49  458bc8               movl r9,r8
0x20220d92500c   c4c  458bc2               movl r8,r10
0x20220d92500f   c4f  e906000000           jmp 0x20220d92501a  <+0xc5a>
0x20220d925014   c54  4c8bc9               REX.W movq r9,rcx
0x20220d925017   c57  4c8bc1               REX.W movq r8,rcx
0x20220d92501a   c5a  478d2487             leal r12,[r15+r8*4]
0x20220d92501e   c5e  458bf9               movl r15,r9
0x20220d925021   c61  452bf8               subl r15,r8
0x20220d925024   c64  4533f6               xorl r14,r14
0x20220d925027   c67  413bf1               cmpl rsi,r9
0x20220d92502a   c6a  410f92c6             setcl r14l
0x20220d92502e   c6e  33db                 xorl rbx,rbx
0x20220d925030   c70  453bc8               cmpl r9,r8
0x20220d925033   c73  0f92c3               setcl bl
0x20220d925036   c76  498bd6               REX.W movq rdx,r14
0x20220d925039   c79  0bd3                 orl rdx,rbx
0x20220d92503b   c7b  418bf7               movl rsi,r15
0x20220d92503e   c7e  85d2                 testl rdx,rdx
0x20220d925040   c80  0f45f1               cmovnzl rsi,rcx
0x20220d925043   c83  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x20220d92504a   c8a  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0x20220d925051   c91  48899dd0feffff       REX.W movq [rbp-0x130],rbx
0x20220d925058   c98  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0x20220d92505f   c9f  453bc8               cmpl r9,r8
0x20220d925062   ca2  0f82aa000000         jc 0x20220d925112  <+0xd52>
0x20220d925068   ca8  428d1480             leal rdx,[rax+r8*4]
0x20220d92506c   cac  b804000000           movl rax,0x4
0x20220d925071   cb1  453bd9               cmpl r11,r9
0x20220d925074   cb4  0f42d0               cmovcl rdx,rax
0x20220d925077   cb7  418bf7               movl rsi,r15
0x20220d92507a   cba  453bd9               cmpl r11,r9
0x20220d92507d   cbd  0f42f1               cmovcl rsi,rcx
0x20220d925080   cc0  448bde               movl r11,rsi
0x20220d925083   cc3  4181e3f0ffff1f       andl r11,0x1ffffff0
0x20220d92508a   cca  468d1c9a             leal r11,[rdx+r11*4]
0x20220d92508e   cce  8bbd60fbffff         movl rdi,[rbp-0x4a0]
0x20220d925094   cd4  468d2487             leal r12,[rdi+r8*4]
0x20220d925098   cd8  8bbd68fbffff         movl rdi,[rbp-0x498]
0x20220d92509e   cde  413bf9               cmpl rdi,r9
0x20220d9250a1   ce1  440f42e0             cmovcl r12,rax
0x20220d9250a5   ce5  458bf7               movl r14,r15
0x20220d9250a8   ce8  413bf9               cmpl rdi,r9
0x20220d9250ab   ceb  440f42f1             cmovcl r14,rcx
0x20220d9250af   cef  418bfe               movl rdi,r14
0x20220d9250b2   cf2  81e7f0ffff1f         andl rdi,0x1ffffff0
0x20220d9250b8   cf8  418d3cbc             leal rdi,[r12+rdi*4]
0x20220d9250bc   cfc  8bde                 movl rbx,rsi
0x20220d9250be   cfe  c1eb04               shrl rbx, 4
0x20220d9250c1   d01  83e60f               andl rsi,0xf
0x20220d9250c4   d04  4889bd88fbffff       REX.W movq [rbp-0x478],rdi
0x20220d9250cb   d0b  418bfe               movl rdi,r14
0x20220d9250ce   d0e  c1ef04               shrl rdi, 4
0x20220d9250d1   d11  4183e60f             andl r14,0xf
0x20220d9250d5   d15  4889bd80fbffff       REX.W movq [rbp-0x480],rdi
0x20220d9250dc   d1c  8bbd70fbffff         movl rdi,[rbp-0x490]
0x20220d9250e2   d22  413bf9               cmpl rdi,r9
0x20220d9250e5   d25  0f8219000000         jc 0x20220d925104  <+0xd44>
0x20220d9250eb   d2b  448b8d78fbffff       movl r9,[rbp-0x488]
0x20220d9250f2   d32  478d0481             leal r8,[r9+r8*4]
0x20220d9250f6   d36  4589e2               movl r10,r12
0x20220d9250f9   d39  458be7               movl r12,r15
0x20220d9250fc   d3c  458bfa               movl r15,r10
0x20220d9250ff   d3f  e939000000           jmp 0x20220d92513d  <+0xd7d>
0x20220d925104   d44  4589e7               movl r15,r12
0x20220d925107   d47  4c8be1               REX.W movq r12,rcx
0x20220d92510a   d4a  4c8bc0               REX.W movq r8,rax
0x20220d92510d   d4d  e92b000000           jmp 0x20220d92513d  <+0xd7d>
0x20220d925112   d52  4c8be1               REX.W movq r12,rcx
0x20220d925115   d55  488bf1               REX.W movq rsi,rcx
0x20220d925118   d58  b804000000           movl rax,0x4
0x20220d92511d   d5d  4c8bf1               REX.W movq r14,rcx
0x20220d925120   d60  48898d80fbffff       REX.W movq [rbp-0x480],rcx
0x20220d925127   d67  488bd9               REX.W movq rbx,rcx
0x20220d92512a   d6a  488bd0               REX.W movq rdx,rax
0x20220d92512d   d6d  4c8bc0               REX.W movq r8,rax
0x20220d925130   d70  4c8bd8               REX.W movq r11,rax
0x20220d925133   d73  4c8bf8               REX.W movq r15,rax
0x20220d925136   d76  48898588fbffff       REX.W movq [rbp-0x478],rax
0x20220d92513d   d7d  4c8b8dd0feffff       REX.W movq r9,[rbp-0x130]
0x20220d925144   d84  440b8db8feffff       orl r9,[rbp-0x148]
0x20220d92514b   d8b  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x20220d925151   d91  4585c9               testl r9,r9
0x20220d925154   d94  0f45f8               cmovnzl rdi,rax
0x20220d925157   d97  4489e0               movl rax,r12
0x20220d92515a   d9a  c1e804               shrl rax, 4
0x20220d92515d   d9d  448b8d50ffffff       movl r9,[rbp-0xb0]
0x20220d925164   da4  41c1e904             shrl r9, 4
0x20220d925168   da8  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x20220d92516f   daf  4c89a560ffffff       REX.W movq [rbp-0xa0],r12
0x20220d925176   db6  458bd9               movl r11,r9
0x20220d925179   db9  448ba580fbffff       movl r12,[rbp-0x480]
0x20220d925180   dc0  453be1               cmpl r12,r9
0x20220d925183   dc3  450f42dc             cmovcl r11,r12
0x20220d925187   dc7  458be3               movl r12,r11
0x20220d92518a   dca  413bdb               cmpl rbx,r11
0x20220d92518d   dcd  440f42e3             cmovcl r12,rbx
0x20220d925191   dd1  4589e3               movl r11,r12
0x20220d925194   dd4  4439e0               cmpl rax,r12
0x20220d925197   dd7  440f42d8             cmovcl r11,rax
0x20220d92519b   ddb  4585db               testl r11,r11
0x20220d92519e   dde  0f85ad000000         jnz 0x20220d925251  <+0xe91>
0x20220d9251a4   de4  c5f9efc0             vpxor xmm0,xmm0,xmm0
0x20220d9251a8   de8  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x20220d9251b0   df0  c5f8118550fdffff     vmovups [rbp-0x2b0],xmm0
0x20220d9251b8   df8  c5f8118500fdffff     vmovups [rbp-0x300],xmm0
0x20220d9251c0   e00  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x20220d9251c8   e08  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x20220d9251d0   e10  c5f8118530fdffff     vmovups [rbp-0x2d0],xmm0
0x20220d9251d8   e18  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x20220d9251e0   e20  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x20220d9251e8   e28  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x20220d9251f0   e30  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x20220d9251f8   e38  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x20220d925200   e40  c5f8118580fcffff     vmovups [rbp-0x380],xmm0
0x20220d925208   e48  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x20220d925210   e50  c57928e0             vmovapd xmm12,xmm0
0x20220d925214   e54  c57928d8             vmovapd xmm11,xmm0
0x20220d925218   e58  c5f928f8             vmovapd xmm7,xmm0
0x20220d92521c   e5c  c57928f0             vmovapd xmm14,xmm0
0x20220d925220   e60  488b45c8             REX.W movq rax,[rbp-0x38]
0x20220d925224   e64  c5f928d0             vmovapd xmm2,xmm0
0x20220d925228   e68  c5f928c8             vmovapd xmm1,xmm0
0x20220d92522c   e6c  c57928c8             vmovapd xmm9,xmm0
0x20220d925230   e70  c57928c0             vmovapd xmm8,xmm0
0x20220d925234   e74  c5f928f0             vmovapd xmm6,xmm0
0x20220d925238   e78  c5f928e0             vmovapd xmm4,xmm0
0x20220d92523c   e7c  c5f928e8             vmovapd xmm5,xmm0
0x20220d925240   e80  c5f928d8             vmovapd xmm3,xmm0
0x20220d925244   e84  c57928d0             vmovapd xmm10,xmm0
0x20220d925248   e88  c57928e8             vmovapd xmm13,xmm0
0x20220d92524c   e8c  e91d070000           jmp 0x20220d92596e  <+0x15ae>
0x20220d925251   e91  c5f9efc0             vpxor xmm0,xmm0,xmm0
0x20220d925255   e95  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x20220d92525d   e9d  c5f8118550fdffff     vmovups [rbp-0x2b0],xmm0
0x20220d925265   ea5  c5f8118500fdffff     vmovups [rbp-0x300],xmm0
0x20220d92526d   ead  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x20220d925275   eb5  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x20220d92527d   ebd  c5f8118530fdffff     vmovups [rbp-0x2d0],xmm0
0x20220d925285   ec5  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x20220d92528d   ecd  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x20220d925295   ed5  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x20220d92529d   edd  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x20220d9252a5   ee5  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x20220d9252ad   eed  c5f8118580fcffff     vmovups [rbp-0x380],xmm0
0x20220d9252b5   ef5  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x20220d9252bd   efd  c5f8118510fdffff     vmovups [rbp-0x2f0],xmm0
0x20220d9252c5   f05  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x20220d9252cd   f0d  c5f8118570fcffff     vmovups [rbp-0x390],xmm0
0x20220d9252d5   f15  c5f81185b0fbffff     vmovups [rbp-0x450],xmm0
0x20220d9252dd   f1d  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x20220d9252e5   f25  c5f81185d0fbffff     vmovups [rbp-0x430],xmm0
0x20220d9252ed   f2d  c5f81185c0fbffff     vmovups [rbp-0x440],xmm0
0x20220d9252f5   f35  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x20220d9252fd   f3d  c5f81185a0feffff     vmovups [rbp-0x160],xmm0
0x20220d925305   f45  c5f8118540feffff     vmovups [rbp-0x1c0],xmm0
0x20220d92530d   f4d  c5f81185f0fdffff     vmovups [rbp-0x210],xmm0
0x20220d925315   f55  c5f8118580fdffff     vmovups [rbp-0x280],xmm0
0x20220d92531d   f5d  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x20220d925325   f65  c5f8118520feffff     vmovups [rbp-0x1e0],xmm0
0x20220d92532d   f6d  c5f81185d0fdffff     vmovups [rbp-0x230],xmm0
0x20220d925335   f75  488b45c8             REX.W movq rax,[rbp-0x38]
0x20220d925339   f79  4c8be1               REX.W movq r12,rcx
0x20220d92533c   f7c  e9bf000000           jmp 0x20220d925400  <+0x1040>
0x20220d925341   f81  660f1f840000000000   nop
0x20220d92534a   f8a  660f1f840000000000   nop
0x20220d925353   f93  660f1f840000000000   nop
0x20220d92535c   f9c  660f1f840000000000   nop
0x20220d925365   fa5  660f1f840000000000   nop
0x20220d92536e   fae  660f1f840000000000   nop
0x20220d925377   fb7  660f1f840000000000   nop
0x20220d925380   fc0  c578119da0feffff     vmovups [rbp-0x160],xmm11
0x20220d925388   fc8  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x20220d925390   fd0  c5f811ad50fdffff     vmovups [rbp-0x2b0],xmm5
0x20220d925398   fd8  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x20220d9253a0   fe0  c5781195a0fcffff     vmovups [rbp-0x360],xmm10
0x20220d9253a8   fe8  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d9253b0   ff0  c578118530fdffff     vmovups [rbp-0x2d0],xmm8
0x20220d9253b8   ff8  c5f8119d80feffff     vmovups [rbp-0x180],xmm3
0x20220d9253c0  1000  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d9253c8  1008  c5f811b590fcffff     vmovups [rbp-0x370],xmm6
0x20220d9253d0  1010  c5f8119540fcffff     vmovups [rbp-0x3c0],xmm2
0x20220d9253d8  1018  c57811add0fdffff     vmovups [rbp-0x230],xmm13
0x20220d9253e0  1020  c578118d20feffff     vmovups [rbp-0x1e0],xmm9
0x20220d9253e8  1028  c5f8118d80fdffff     vmovups [rbp-0x280],xmm1
0x20220d9253f0  1030  c5f811a540feffff     vmovups [rbp-0x1c0],xmm4
0x20220d9253f8  1038  c57811b5b0fcffff     vmovups [rbp-0x350],xmm14
0x20220d925400  1040  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d925404  1044  0f868e100000         jna 0x20220d926498  <+0x20d8>
0x20220d92540a  104a  418d1c3c             leal rbx,[r12+rdi*1]
0x20220d92540e  104e  c5fa6f2418           vmovdqu xmm4,[rax+rbx*1]
0x20220d925413  1053  c5a05cf4             vsubps xmm6,xmm11,xmm4
0x20220d925417  1057  c54859c6             vmulps xmm8,xmm6,xmm6
0x20220d92541b  105b  478d0c3c             leal r9,[r12+r15*1]
0x20220d92541f  105f  c4217a6f0c08         vmovdqu xmm9,[rax+r9*1]
0x20220d925425  1065  c441185cd1           vsubps xmm10,xmm12,xmm9
0x20220d92542a  106a  c4412859ea           vmulps xmm13,xmm10,xmm10
0x20220d92542f  106f  c4413858c5           vaddps xmm8,xmm8,xmm13
0x20220d925434  1074  c44160c2e802         vcmpps xmm13,xmm3,xmm8, (le)
0x20220d92543a  107a  c538c2f501           vcmpps xmm14,xmm8,xmm5, (lt)
0x20220d92543f  107f  c44111dbee           vpand xmm13,xmm13,xmm14
0x20220d925444  1084  c44178c2f001         vcmpps xmm14,xmm0,xmm8, (lt)
0x20220d92544a  108a  c509dbf7             vpand xmm14,xmm14,xmm7
0x20220d92544e  108e  c441785bf6           vcvtdq2ps xmm14,xmm14
0x20220d925453  1093  c44111dbee           vpand xmm13,xmm13,xmm14
0x20220d925458  1098  c57810b5b0fbffff     vmovups xmm14,[rbp-0x450]
0x20220d925460  10a0  c4411058f6           vaddps xmm14,xmm13,xmm14
0x20220d925465  10a5  8d4b30               leal rcx,[rbx+0x30]
0x20220d925468  10a8  c57811b5b0fbffff     vmovups [rbp-0x450],xmm14
0x20220d925470  10b0  c57a6f3408           vmovdqu xmm14,[rax+rcx*1]
0x20220d925475  10b5  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x20220d92547d  10bd  c4c1205cf6           vsubps xmm6,xmm11,xmm14
0x20220d925482  10c2  c5c859ce             vmulps xmm1,xmm6,xmm6
0x20220d925486  10c6  418d4930             leal rcx,[r9+0x30]
0x20220d92548a  10ca  c5f811b5e0fdffff     vmovups [rbp-0x220],xmm6
0x20220d925492  10d2  c5fa6f3408           vmovdqu xmm6,[rax+rcx*1]
0x20220d925497  10d7  c578119570fdffff     vmovups [rbp-0x290],xmm10
0x20220d92549f  10df  c5185cd6             vsubps xmm10,xmm12,xmm6
0x20220d9254a3  10e3  c578118560fdffff     vmovups [rbp-0x2a0],xmm8
0x20220d9254ab  10eb  c4412859c2           vmulps xmm8,xmm10,xmm10
0x20220d9254b0  10f0  c4417058c0           vaddps xmm8,xmm1,xmm8
0x20220d9254b5  10f5  c4c160c2c802         vcmpps xmm1,xmm3,xmm8, (le)
0x20220d9254bb  10fb  c5781195c0fdffff     vmovups [rbp-0x240],xmm10
0x20220d9254c3  1103  c538c2d501           vcmpps xmm10,xmm8,xmm5, (lt)
0x20220d9254c8  1108  c44171dbd2           vpand xmm10,xmm1,xmm10
0x20220d9254cd  110d  c4c178c2c801         vcmpps xmm1,xmm0,xmm8, (lt)
0x20220d9254d3  1113  c5f1dbcf             vpand xmm1,xmm1,xmm7
0x20220d9254d7  1117  c5f85bc9             vcvtdq2ps xmm1,xmm1
0x20220d9254db  111b  c529dbd1             vpand xmm10,xmm10,xmm1
0x20220d9254df  111f  c5f8108dc0fbffff     vmovups xmm1,[rbp-0x440]
0x20220d9254e7  1127  c5a858c9             vaddps xmm1,xmm10,xmm1
0x20220d9254eb  112b  8d4b20               leal rcx,[rbx+0x20]
0x20220d9254ee  112e  c5f8118dc0fbffff     vmovups [rbp-0x440],xmm1
0x20220d9254f6  1136  c5fa6f0c08           vmovdqu xmm1,[rax+rcx*1]
0x20220d9254fb  113b  c5781185b0fdffff     vmovups [rbp-0x250],xmm8
0x20220d925503  1143  c5205cc1             vsubps xmm8,xmm11,xmm1
0x20220d925507  1147  c4c13859d0           vmulps xmm2,xmm8,xmm8
0x20220d92550c  114c  418d4920             leal rcx,[r9+0x20]
0x20220d925510  1150  c578118530feffff     vmovups [rbp-0x1d0],xmm8
0x20220d925518  1158  c57a6f0408           vmovdqu xmm8,[rax+rcx*1]
0x20220d92551d  115d  c5f8118df0fcffff     vmovups [rbp-0x310],xmm1
0x20220d925525  1165  c4c1185cc8           vsubps xmm1,xmm12,xmm8
0x20220d92552a  116a  c5781185d0fcffff     vmovups [rbp-0x330],xmm8
0x20220d925532  1172  c57059c1             vmulps xmm8,xmm1,xmm1
0x20220d925536  1176  c4416858c0           vaddps xmm8,xmm2,xmm8
0x20220d92553b  117b  c4c160c2d002         vcmpps xmm2,xmm3,xmm8, (le)
0x20220d925541  1181  c5f8118d10feffff     vmovups [rbp-0x1f0],xmm1
0x20220d925549  1189  c5b8c2cd01           vcmpps xmm1,xmm8,xmm5, (lt)
0x20220d92554e  118e  c5e9dbc9             vpand xmm1,xmm2,xmm1
0x20220d925552  1192  c4c178c2d001         vcmpps xmm2,xmm0,xmm8, (lt)
0x20220d925558  1198  c5e9dbd7             vpand xmm2,xmm2,xmm7
0x20220d92555c  119c  c5f85bd2             vcvtdq2ps xmm2,xmm2
0x20220d925560  11a0  c5f1dbca             vpand xmm1,xmm1,xmm2
0x20220d925564  11a4  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x20220d92556c  11ac  c5f058d2             vaddps xmm2,xmm1,xmm2
0x20220d925570  11b0  83c310               addl rbx,0x10
0x20220d925573  11b3  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x20220d92557b  11bb  c5fa6f1418           vmovdqu xmm2,[rax+rbx*1]
0x20220d925580  11c0  c578118500feffff     vmovups [rbp-0x200],xmm8
0x20220d925588  11c8  c5205cc2             vsubps xmm8,xmm11,xmm2
0x20220d92558c  11cc  c4413859d8           vmulps xmm11,xmm8,xmm8
0x20220d925591  11d1  418d5910             leal rbx,[r9+0x10]
0x20220d925595  11d5  c578118590feffff     vmovups [rbp-0x170],xmm8
0x20220d92559d  11dd  c57a6f0418           vmovdqu xmm8,[rax+rbx*1]
0x20220d9255a2  11e2  c5f8119540fdffff     vmovups [rbp-0x2c0],xmm2
0x20220d9255aa  11ea  c4c1185cd0           vsubps xmm2,xmm12,xmm8
0x20220d9255af  11ef  c56859e2             vmulps xmm12,xmm2,xmm2
0x20220d9255b3  11f3  c4412058dc           vaddps xmm11,xmm11,xmm12
0x20220d9255b8  11f8  c44160c2e302         vcmpps xmm12,xmm3,xmm11, (le)
0x20220d9255be  11fe  c5f8119570feffff     vmovups [rbp-0x190],xmm2
0x20220d9255c6  1206  c5a0c2d501           vcmpps xmm2,xmm11,xmm5, (lt)
0x20220d9255cb  120b  c519dbe2             vpand xmm12,xmm12,xmm2
0x20220d9255cf  120f  c4c178c2d301         vcmpps xmm2,xmm0,xmm11, (lt)
0x20220d9255d5  1215  c5e9dbd7             vpand xmm2,xmm2,xmm7
0x20220d9255d9  1219  c5f85bd2             vcvtdq2ps xmm2,xmm2
0x20220d9255dd  121d  c519dbe2             vpand xmm12,xmm12,xmm2
0x20220d9255e1  1221  c5f8109520fcffff     vmovups xmm2,[rbp-0x3e0]
0x20220d9255e9  1229  c59858d2             vaddps xmm2,xmm12,xmm2
0x20220d9255ed  122d  438d1c04             leal rbx,[r12+r8*1]
0x20220d9255f1  1231  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x20220d9255f6  1236  c4c15059ed           vmulps xmm5,xmm5,xmm13
0x20220d9255fb  123b  c5f8119520fcffff     vmovups [rbp-0x3e0],xmm2
0x20220d925603  1243  c5f8109530fcffff     vmovups xmm2,[rbp-0x3d0]
0x20220d92560b  124b  c5d058d2             vaddps xmm2,xmm5,xmm2
0x20220d92560f  124f  418d0c14             leal rcx,[r12+rdx*1]
0x20220d925613  1253  c5fa6f2c08           vmovdqu xmm5,[rax+rcx*1]
0x20220d925618  1258  c4c15059ed           vmulps xmm5,xmm5,xmm13
0x20220d92561d  125d  c5f8119530fcffff     vmovups [rbp-0x3d0],xmm2
0x20220d925625  1265  c5f8109540fcffff     vmovups xmm2,[rbp-0x3c0]
0x20220d92562d  126d  c5d058d2             vaddps xmm2,xmm5,xmm2
0x20220d925631  1271  c4c13059ed           vmulps xmm5,xmm9,xmm13
0x20220d925636  1276  c578108d50fcffff     vmovups xmm9,[rbp-0x3b0]
0x20220d92563e  127e  c4415058c9           vaddps xmm9,xmm5,xmm9
0x20220d925643  1283  c4c15859e5           vmulps xmm4,xmm4,xmm13
0x20220d925648  1288  c5f810ad60fcffff     vmovups xmm5,[rbp-0x3a0]
0x20220d925650  1290  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d925654  1294  448d4b30             leal r9,[rbx+0x30]
0x20220d925658  1298  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x20220d92565e  129e  c4c15059ea           vmulps xmm5,xmm5,xmm10
0x20220d925663  12a3  c57810ad70fcffff     vmovups xmm13,[rbp-0x390]
0x20220d92566b  12ab  c4415058ed           vaddps xmm13,xmm5,xmm13
0x20220d925670  12b0  448d4930             leal r9,[rcx+0x30]
0x20220d925674  12b4  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x20220d92567a  12ba  c4c15059ea           vmulps xmm5,xmm5,xmm10
0x20220d92567f  12bf  c5f811a560fcffff     vmovups [rbp-0x3a0],xmm4
0x20220d925687  12c7  c5f810a580fcffff     vmovups xmm4,[rbp-0x380]
0x20220d92568f  12cf  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d925693  12d3  c4c14859ea           vmulps xmm5,xmm6,xmm10
0x20220d925698  12d8  c5f810b590fcffff     vmovups xmm6,[rbp-0x370]
0x20220d9256a0  12e0  c5d058f6             vaddps xmm6,xmm5,xmm6
0x20220d9256a4  12e4  c4c10859ea           vmulps xmm5,xmm14,xmm10
0x20220d9256a9  12e9  c5781095a0fcffff     vmovups xmm10,[rbp-0x360]
0x20220d9256b1  12f1  c52858d5             vaddps xmm10,xmm10,xmm5
0x20220d9256b5  12f5  448d4b20             leal r9,[rbx+0x20]
0x20220d9256b9  12f9  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x20220d9256bf  12ff  c5d059e9             vmulps xmm5,xmm5,xmm1
0x20220d9256c3  1303  c57810b5b0fcffff     vmovups xmm14,[rbp-0x350]
0x20220d9256cb  130b  c4415058f6           vaddps xmm14,xmm5,xmm14
0x20220d9256d0  1310  448d4920             leal r9,[rcx+0x20]
0x20220d9256d4  1314  c4a17a6f2c08         vmovdqu xmm5,[rax+r9*1]
0x20220d9256da  131a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x20220d9256de  131e  c5f811a580fcffff     vmovups [rbp-0x380],xmm4
0x20220d9256e6  1326  c5f810a5c0fcffff     vmovups xmm4,[rbp-0x340]
0x20220d9256ee  132e  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d9256f2  1332  c5f810add0fcffff     vmovups xmm5,[rbp-0x330]
0x20220d9256fa  133a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x20220d9256fe  133e  c5f811a5c0fcffff     vmovups [rbp-0x340],xmm4
0x20220d925706  1346  c5f810a5e0fcffff     vmovups xmm4,[rbp-0x320]
0x20220d92570e  134e  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d925712  1352  c5f810adf0fcffff     vmovups xmm5,[rbp-0x310]
0x20220d92571a  135a  c5d059e9             vmulps xmm5,xmm5,xmm1
0x20220d92571e  135e  c5f8108d00fdffff     vmovups xmm1,[rbp-0x300]
0x20220d925726  1366  c5f058cd             vaddps xmm1,xmm1,xmm5
0x20220d92572a  136a  83c310               addl rbx,0x10
0x20220d92572d  136d  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x20220d925732  1372  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x20220d925737  1377  c5f811a5e0fcffff     vmovups [rbp-0x320],xmm4
0x20220d92573f  137f  c5f810a510fdffff     vmovups xmm4,[rbp-0x2f0]
0x20220d925747  1387  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d92574b  138b  8d5910               leal rbx,[rcx+0x10]
0x20220d92574e  138e  c5fa6f2c18           vmovdqu xmm5,[rax+rbx*1]
0x20220d925753  1393  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x20220d925758  1398  c5f811a510fdffff     vmovups [rbp-0x2f0],xmm4
0x20220d925760  13a0  c5f810a520fdffff     vmovups xmm4,[rbp-0x2e0]
0x20220d925768  13a8  c5d058e4             vaddps xmm4,xmm5,xmm4
0x20220d92576c  13ac  c4c13859ec           vmulps xmm5,xmm8,xmm12
0x20220d925771  13b1  c578108530fdffff     vmovups xmm8,[rbp-0x2d0]
0x20220d925779  13b9  c4415058c0           vaddps xmm8,xmm5,xmm8
0x20220d92577e  13be  c5f810ad40fdffff     vmovups xmm5,[rbp-0x2c0]
0x20220d925786  13c6  c4c15059ec           vmulps xmm5,xmm5,xmm12
0x20220d92578b  13cb  c57810a550fdffff     vmovups xmm12,[rbp-0x2b0]
0x20220d925793  13d3  c59858ed             vaddps xmm5,xmm12,xmm5
0x20220d925797  13d7  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x20220d92579f  13df  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x20220d9257a4  13e4  c519dbe7             vpand xmm12,xmm12,xmm7
0x20220d9257a8  13e8  c441785be4           vcvtdq2ps xmm12,xmm12
0x20220d9257ad  13ed  c5f811a520fdffff     vmovups [rbp-0x2e0],xmm4
0x20220d9257b5  13f5  c5f810a570fdffff     vmovups xmm4,[rbp-0x290]
0x20220d9257bd  13fd  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d9257c2  1402  c5f8118d00fdffff     vmovups [rbp-0x300],xmm1
0x20220d9257ca  140a  c5f8108d80fdffff     vmovups xmm1,[rbp-0x280]
0x20220d9257d2  1412  c5f058cc             vaddps xmm1,xmm1,xmm4
0x20220d9257d6  1416  c5f810a590fdffff     vmovups xmm4,[rbp-0x270]
0x20220d9257de  141e  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d9257e3  1423  c57810a5a0fdffff     vmovups xmm12,[rbp-0x260]
0x20220d9257eb  142b  c59858e4             vaddps xmm4,xmm12,xmm4
0x20220d9257ef  142f  c57810a5b0fdffff     vmovups xmm12,[rbp-0x250]
0x20220d9257f7  1437  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x20220d9257fc  143c  c519dbe7             vpand xmm12,xmm12,xmm7
0x20220d925800  1440  c441785be4           vcvtdq2ps xmm12,xmm12
0x20220d925805  1445  c5f811a5a0fdffff     vmovups [rbp-0x260],xmm4
0x20220d92580d  144d  c5f810a5c0fdffff     vmovups xmm4,[rbp-0x240]
0x20220d925815  1455  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d92581a  145a  c57811ad70fcffff     vmovups [rbp-0x390],xmm13
0x20220d925822  1462  c57810add0fdffff     vmovups xmm13,[rbp-0x230]
0x20220d92582a  146a  c51058ec             vaddps xmm13,xmm13,xmm4
0x20220d92582e  146e  c5f810a5e0fdffff     vmovups xmm4,[rbp-0x220]
0x20220d925836  1476  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d92583b  147b  c57810a5f0fdffff     vmovups xmm12,[rbp-0x210]
0x20220d925843  1483  c59858e4             vaddps xmm4,xmm12,xmm4
0x20220d925847  1487  c57810a500feffff     vmovups xmm12,[rbp-0x200]
0x20220d92584f  148f  c518c2e301           vcmpps xmm12,xmm12,xmm3, (lt)
0x20220d925854  1494  c519dbe7             vpand xmm12,xmm12,xmm7
0x20220d925858  1498  c441785be4           vcvtdq2ps xmm12,xmm12
0x20220d92585d  149d  c5f811a5f0fdffff     vmovups [rbp-0x210],xmm4
0x20220d925865  14a5  c5f810a510feffff     vmovups xmm4,[rbp-0x1f0]
0x20220d92586d  14ad  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d925872  14b2  c578118d50fcffff     vmovups [rbp-0x3b0],xmm9
0x20220d92587a  14ba  c578108d20feffff     vmovups xmm9,[rbp-0x1e0]
0x20220d925882  14c2  c53058cc             vaddps xmm9,xmm9,xmm4
0x20220d925886  14c6  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x20220d92588e  14ce  c4c15859e4           vmulps xmm4,xmm4,xmm12
0x20220d925893  14d3  c57810a540feffff     vmovups xmm12,[rbp-0x1c0]
0x20220d92589b  14db  c59858e4             vaddps xmm4,xmm12,xmm4
0x20220d92589f  14df  c520c2db01           vcmpps xmm11,xmm11,xmm3, (lt)
0x20220d9258a4  14e4  c521dbdf             vpand xmm11,xmm11,xmm7
0x20220d9258a8  14e8  c441785bdb           vcvtdq2ps xmm11,xmm11
0x20220d9258ad  14ed  c57810a570feffff     vmovups xmm12,[rbp-0x190]
0x20220d9258b5  14f5  c4411859e3           vmulps xmm12,xmm12,xmm11
0x20220d9258ba  14fa  c5f8109d80feffff     vmovups xmm3,[rbp-0x180]
0x20220d9258c2  1502  c4c16058dc           vaddps xmm3,xmm3,xmm12
0x20220d9258c7  1507  c57810a590feffff     vmovups xmm12,[rbp-0x170]
0x20220d9258cf  150f  c4411859db           vmulps xmm11,xmm12,xmm11
0x20220d9258d4  1514  c57810a5a0feffff     vmovups xmm12,[rbp-0x160]
0x20220d9258dc  151c  c4411858db           vaddps xmm11,xmm12,xmm11
0x20220d9258e1  1521  4183c440             addl r12,0x40
0x20220d9258e5  1525  4183c3ff             addl r11,0xff
0x20220d9258e9  1529  0f8591faffff         jnz 0x20220d925380  <+0xfc0>
0x20220d9258ef  152f  c5781195a0fcffff     vmovups [rbp-0x360],xmm10
0x20220d9258f7  1537  c4417928d1           vmovapd xmm10,xmm9
0x20220d9258fc  153c  c5f811ad50fdffff     vmovups [rbp-0x2b0],xmm5
0x20220d925904  1544  c5f928e9             vmovapd xmm5,xmm1
0x20220d925908  1548  c5f811b590fcffff     vmovups [rbp-0x370],xmm6
0x20220d925910  1550  c5f928f4             vmovapd xmm6,xmm4
0x20220d925914  1554  c5f810a5f0fdffff     vmovups xmm4,[rbp-0x210]
0x20220d92591c  155c  c578118530fdffff     vmovups [rbp-0x2d0],xmm8
0x20220d925924  1564  c5f8119540fcffff     vmovups [rbp-0x3c0],xmm2
0x20220d92592c  156c  c4417928c3           vmovapd xmm8,xmm11
0x20220d925931  1571  c578108da0fdffff     vmovups xmm9,[rbp-0x260]
0x20220d925939  1579  c5f8108dc0fbffff     vmovups xmm1,[rbp-0x440]
0x20220d925941  1581  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x20220d925949  1589  c57810a510fdffff     vmovups xmm12,[rbp-0x2f0]
0x20220d925951  1591  c4417928de           vmovapd xmm11,xmm14
0x20220d925956  1596  c5f810bd70fcffff     vmovups xmm7,[rbp-0x390]
0x20220d92595e  159e  c57810b5b0fbffff     vmovups xmm14,[rbp-0x450]
0x20220d925966  15a6  c5f8108520fcffff     vmovups xmm0,[rbp-0x3e0]
0x20220d92596e  15ae  c5f8118dc0fbffff     vmovups [rbp-0x440],xmm1
0x20220d925976  15b6  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x20220d92597e  15be  c5f8108d60fcffff     vmovups xmm1,[rbp-0x3a0]
0x20220d925986  15c6  c5f828d1             vmovaps xmm2,xmm1
0x20220d92598a  15ca  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x20220d925992  15d2  c5fa16c1             vmovshdup xmm0,xmm1
0x20220d925996  15d6  c5fa58c2             vaddss xmm0,xmm0,xmm2
0x20220d92599a  15da  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d92599f  15df  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d9259a3  15e3  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d9259a8  15e8  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d9259ac  15ec  c5f8109550fdffff     vmovups xmm2,[rbp-0x2b0]
0x20220d9259b4  15f4  c5f828ca             vmovaps xmm1,xmm2
0x20220d9259b8  15f8  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d9259bc  15fc  c5fa16ca             vmovshdup xmm1,xmm2
0x20220d9259c0  1600  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d9259c4  1604  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x20220d9259c9  1609  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d9259cd  160d  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x20220d9259d2  1612  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d9259d6  1616  c5f8108d00fdffff     vmovups xmm1,[rbp-0x300]
0x20220d9259de  161e  c5f828d1             vmovaps xmm2,xmm1
0x20220d9259e2  1622  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d9259e6  1626  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d9259ea  162a  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d9259ee  162e  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d9259f3  1633  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d9259f7  1637  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d9259fc  163c  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d925a00  1640  c5f8108da0fcffff     vmovups xmm1,[rbp-0x360]
0x20220d925a08  1648  c5f828d1             vmovaps xmm2,xmm1
0x20220d925a0c  164c  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d925a10  1650  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925a14  1654  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d925a18  1658  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925a1d  165d  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x20220d925a21  1661  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925a26  1666  c5f258c0             vaddss xmm0,xmm1,xmm0
0x20220d925a2a  166a  c4e27918c0           vbroadcastss xmm0,xmm0
0x20220d925a2f  166f  c5f8108d50fcffff     vmovups xmm1,[rbp-0x3b0]
0x20220d925a37  1677  c5f828d1             vmovaps xmm2,xmm1
0x20220d925a3b  167b  c57811b5b0fbffff     vmovups [rbp-0x450],xmm14
0x20220d925a43  1683  c57a16f1             vmovshdup xmm14,xmm1
0x20220d925a47  1687  c50a58f2             vaddss xmm14,xmm14,xmm2
0x20220d925a4b  168b  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925a50  1690  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925a55  1695  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925a5a  169a  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925a5f  169f  c5f8108d30fdffff     vmovups xmm1,[rbp-0x2d0]
0x20220d925a67  16a7  c5f828d1             vmovaps xmm2,xmm1
0x20220d925a6b  16ab  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925a70  16b0  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925a74  16b4  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925a79  16b9  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925a7e  16be  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925a83  16c3  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925a88  16c8  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925a8d  16cd  c5f8108de0fcffff     vmovups xmm1,[rbp-0x320]
0x20220d925a95  16d5  c5f828d1             vmovaps xmm2,xmm1
0x20220d925a99  16d9  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925a9e  16de  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925aa2  16e2  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925aa7  16e7  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925aac  16ec  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925ab1  16f1  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925ab6  16f6  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925abb  16fb  c5f8108d90fcffff     vmovups xmm1,[rbp-0x370]
0x20220d925ac3  1703  c5f828d1             vmovaps xmm2,xmm1
0x20220d925ac7  1707  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925acc  170c  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925ad0  1710  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925ad5  1715  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925ada  171a  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925adf  171f  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925ae4  1724  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925ae9  1729  c4c37921c610         vinsertps xmm0,xmm0,xmm14,0x10
0x20220d925aef  172f  c5f8109540fcffff     vmovups xmm2,[rbp-0x3c0]
0x20220d925af7  1737  c57828f2             vmovaps xmm14,xmm2
0x20220d925afb  173b  c5fa16ca             vmovshdup xmm1,xmm2
0x20220d925aff  173f  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925b04  1744  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x20220d925b09  1749  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925b0e  174e  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x20220d925b13  1753  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925b18  1758  c5f8108d20fdffff     vmovups xmm1,[rbp-0x2e0]
0x20220d925b20  1760  c5f828d1             vmovaps xmm2,xmm1
0x20220d925b24  1764  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b29  1769  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925b2d  176d  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b32  1772  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925b37  1777  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b3c  177c  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925b41  1781  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925b46  1786  c5f8108dc0fcffff     vmovups xmm1,[rbp-0x340]
0x20220d925b4e  178e  c5f828d1             vmovaps xmm2,xmm1
0x20220d925b52  1792  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b57  1797  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925b5b  179b  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b60  17a0  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925b65  17a5  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b6a  17aa  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925b6f  17af  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925b74  17b4  c5f8108d80fcffff     vmovups xmm1,[rbp-0x380]
0x20220d925b7c  17bc  c5f828d1             vmovaps xmm2,xmm1
0x20220d925b80  17c0  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b85  17c5  c5fa16d1             vmovshdup xmm2,xmm1
0x20220d925b89  17c9  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b8e  17ce  c5f970d102           vpshufd xmm2,xmm1,0x2
0x20220d925b93  17d3  c4416a58f6           vaddss xmm14,xmm2,xmm14
0x20220d925b98  17d8  c5f0c6c903           vshufps xmm1,xmm1,xmm1,0x3
0x20220d925b9d  17dd  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925ba2  17e2  c4c37921c620         vinsertps xmm0,xmm0,xmm14,0x20
0x20220d925ba8  17e8  c5f8109530fcffff     vmovups xmm2,[rbp-0x3d0]
0x20220d925bb0  17f0  c57828f2             vmovaps xmm14,xmm2
0x20220d925bb4  17f4  c5fa16ca             vmovshdup xmm1,xmm2
0x20220d925bb8  17f8  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925bbd  17fd  c5f970ca02           vpshufd xmm1,xmm2,0x2
0x20220d925bc2  1802  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925bc7  1807  c5f970ca03           vpshufd xmm1,xmm2,0x3
0x20220d925bcc  180c  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925bd1  1811  c4c17828cc           vmovaps xmm1,xmm12
0x20220d925bd6  1816  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925bdb  181b  c4c17a16cc           vmovshdup xmm1,xmm12
0x20220d925be0  1820  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925be5  1825  c4c17970cc02         vpshufd xmm1,xmm12,0x2
0x20220d925beb  182b  c4417258f6           vaddss xmm14,xmm1,xmm14
0x20220d925bf0  1830  c44118c6e403         vshufps xmm12,xmm12,xmm12,0x3
0x20220d925bf6  1836  c4411a58e6           vaddss xmm12,xmm12,xmm14
0x20220d925bfb  183b  c4417828f3           vmovaps xmm14,xmm11
0x20220d925c00  1840  c4410a58e4           vaddss xmm12,xmm14,xmm12
0x20220d925c05  1845  c4417a16f3           vmovshdup xmm14,xmm11
0x20220d925c0a  184a  c4410a58e4           vaddss xmm12,xmm14,xmm12
0x20220d925c0f  184f  c4417970f302         vpshufd xmm14,xmm11,0x2
0x20220d925c15  1855  c4410a58e4           vaddss xmm12,xmm14,xmm12
0x20220d925c1a  185a  c44120c6db03         vshufps xmm11,xmm11,xmm11,0x3
0x20220d925c20  1860  c4412258dc           vaddss xmm11,xmm11,xmm12
0x20220d925c25  1865  c57828e7             vmovaps xmm12,xmm7
0x20220d925c29  1869  c4411a58db           vaddss xmm11,xmm12,xmm11
0x20220d925c2e  186e  c57a16e7             vmovshdup xmm12,xmm7
0x20220d925c32  1872  c4411a58db           vaddss xmm11,xmm12,xmm11
0x20220d925c37  1877  c57970e702           vpshufd xmm12,xmm7,0x2
0x20220d925c3c  187c  c4411a58db           vaddss xmm11,xmm12,xmm11
0x20220d925c41  1881  c5c0c6ff03           vshufps xmm7,xmm7,xmm7,0x3
0x20220d925c46  1886  c4c14258fb           vaddss xmm7,xmm7,xmm11
0x20220d925c4b  188b  c4e37921c730         vinsertps xmm0,xmm0,xmm7,0x30
0x20220d925c51  1891  c5f81095c0feffff     vmovups xmm2,[rbp-0x140]
0x20220d925c59  1899  c5e858d0             vaddps xmm2,xmm2,xmm0
0x20220d925c5d  189d  c5f828c5             vmovaps xmm0,xmm5
0x20220d925c61  18a1  c5fa16fd             vmovshdup xmm7,xmm5
0x20220d925c65  18a5  c5c258c0             vaddss xmm0,xmm7,xmm0
0x20220d925c69  18a9  c5f970fd02           vpshufd xmm7,xmm5,0x2
0x20220d925c6e  18ae  c5c258c0             vaddss xmm0,xmm7,xmm0
0x20220d925c72  18b2  c5d0c6ed03           vshufps xmm5,xmm5,xmm5,0x3
0x20220d925c77  18b7  c5d258c0             vaddss xmm0,xmm5,xmm0
0x20220d925c7b  18bb  c5f828eb             vmovaps xmm5,xmm3
0x20220d925c7f  18bf  c5d258c0             vaddss xmm0,xmm5,xmm0
0x20220d925c83  18c3  c5fa16eb             vmovshdup xmm5,xmm3
0x20220d925c87  18c7  c5d258c0             vaddss xmm0,xmm5,xmm0
0x20220d925c8b  18cb  c5f970eb02           vpshufd xmm5,xmm3,0x2
0x20220d925c90  18d0  c5d258c0             vaddss xmm0,xmm5,xmm0
0x20220d925c94  18d4  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x20220d925c99  18d9  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925c9d  18dd  c4c17828da           vmovaps xmm3,xmm10
0x20220d925ca2  18e2  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925ca6  18e6  c4c17a16da           vmovshdup xmm3,xmm10
0x20220d925cab  18eb  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925caf  18ef  c4c17970da02         vpshufd xmm3,xmm10,0x2
0x20220d925cb5  18f5  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925cb9  18f9  c4c17970da03         vpshufd xmm3,xmm10,0x3
0x20220d925cbf  18ff  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925cc3  1903  c4c17828dd           vmovaps xmm3,xmm13
0x20220d925cc8  1908  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925ccc  190c  c4c17a16dd           vmovshdup xmm3,xmm13
0x20220d925cd1  1911  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925cd5  1915  c4c17970dd02         vpshufd xmm3,xmm13,0x2
0x20220d925cdb  191b  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925cdf  191f  c4c17970dd03         vpshufd xmm3,xmm13,0x3
0x20220d925ce5  1925  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925ce9  1929  c5fa588dd8feffff     vaddss xmm1,xmm0,[rbp-0x128]
0x20220d925cf1  1931  c4c17828c1           vmovaps xmm0,xmm9
0x20220d925cf6  1936  c4c17a16d9           vmovshdup xmm3,xmm9
0x20220d925cfb  193b  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925cff  193f  c4c17970d902         vpshufd xmm3,xmm9,0x2
0x20220d925d05  1945  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d09  1949  c4c17970d903         vpshufd xmm3,xmm9,0x3
0x20220d925d0f  194f  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d13  1953  c4c17828d8           vmovaps xmm3,xmm8
0x20220d925d18  1958  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d1c  195c  c4c17a16d8           vmovshdup xmm3,xmm8
0x20220d925d21  1961  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d25  1965  c4c17970d802         vpshufd xmm3,xmm8,0x2
0x20220d925d2b  196b  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d2f  196f  c4c17970d803         vpshufd xmm3,xmm8,0x3
0x20220d925d35  1975  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d39  1979  c5f828de             vmovaps xmm3,xmm6
0x20220d925d3d  197d  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d41  1981  c5fa16de             vmovshdup xmm3,xmm6
0x20220d925d45  1985  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d49  1989  c5f970de02           vpshufd xmm3,xmm6,0x2
0x20220d925d4e  198e  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d52  1992  c5f970de03           vpshufd xmm3,xmm6,0x3
0x20220d925d57  1997  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d5b  199b  c5f828dc             vmovaps xmm3,xmm4
0x20220d925d5f  199f  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d63  19a3  c5fa16dc             vmovshdup xmm3,xmm4
0x20220d925d67  19a7  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d6b  19ab  c5f970dc02           vpshufd xmm3,xmm4,0x2
0x20220d925d70  19b0  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d74  19b4  c5f970dc03           vpshufd xmm3,xmm4,0x3
0x20220d925d79  19b9  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925d7d  19bd  c57a58b5e0feffff     vaddss xmm14,xmm0,[rbp-0x120]
0x20220d925d85  19c5  c5f81085b0fbffff     vmovups xmm0,[rbp-0x450]
0x20220d925d8d  19cd  c5f828d8             vmovaps xmm3,xmm0
0x20220d925d91  19d1  c5fa16e0             vmovshdup xmm4,xmm0
0x20220d925d95  19d5  c5da58db             vaddss xmm3,xmm4,xmm3
0x20220d925d99  19d9  c5f970e002           vpshufd xmm4,xmm0,0x2
0x20220d925d9e  19de  c5da58db             vaddss xmm3,xmm4,xmm3
0x20220d925da2  19e2  c5f8c6c003           vshufps xmm0,xmm0,xmm0,0x3
0x20220d925da7  19e7  c5fa58c3             vaddss xmm0,xmm0,xmm3
0x20220d925dab  19eb  c5f8109d20fcffff     vmovups xmm3,[rbp-0x3e0]
0x20220d925db3  19f3  c5f828e3             vmovaps xmm4,xmm3
0x20220d925db7  19f7  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925dbb  19fb  c5fa16e3             vmovshdup xmm4,xmm3
0x20220d925dbf  19ff  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925dc3  1a03  c5f970e302           vpshufd xmm4,xmm3,0x2
0x20220d925dc8  1a08  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925dcc  1a0c  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x20220d925dd1  1a11  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925dd5  1a15  c5f8109dd0fbffff     vmovups xmm3,[rbp-0x430]
0x20220d925ddd  1a1d  c5f828e3             vmovaps xmm4,xmm3
0x20220d925de1  1a21  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925de5  1a25  c5fa16e3             vmovshdup xmm4,xmm3
0x20220d925de9  1a29  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925ded  1a2d  c5f970e302           vpshufd xmm4,xmm3,0x2
0x20220d925df2  1a32  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925df6  1a36  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x20220d925dfb  1a3b  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925dff  1a3f  c5f8109dc0fbffff     vmovups xmm3,[rbp-0x440]
0x20220d925e07  1a47  c5f828e3             vmovaps xmm4,xmm3
0x20220d925e0b  1a4b  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925e0f  1a4f  c5fa16e3             vmovshdup xmm4,xmm3
0x20220d925e13  1a53  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925e17  1a57  c5f970e302           vpshufd xmm4,xmm3,0x2
0x20220d925e1c  1a5c  c5da58c0             vaddss xmm0,xmm4,xmm0
0x20220d925e20  1a60  c5e0c6db03           vshufps xmm3,xmm3,xmm3,0x3
0x20220d925e25  1a65  c5e258c0             vaddss xmm0,xmm3,xmm0
0x20220d925e29  1a69  c57a58ade8feffff     vaddss xmm13,xmm0,[rbp-0x118]
0x20220d925e31  1a71  448ba560ffffff       movl r12,[rbp-0xa0]
0x20220d925e38  1a78  4183e40f             andl r12,0xf
0x20220d925e3c  1a7c  448b9d50ffffff       movl r11,[rbp-0xb0]
0x20220d925e43  1a83  4183e30f             andl r11,0xf
0x20220d925e47  1a87  458bfb               movl r15,r11
0x20220d925e4a  1a8a  453bf3               cmpl r14,r11
0x20220d925e4d  1a8d  450f42fe             cmovcl r15,r14
0x20220d925e51  1a91  458bdf               movl r11,r15
0x20220d925e54  1a94  413bf7               cmpl rsi,r15
0x20220d925e57  1a97  440f42de             cmovcl r11,rsi
0x20220d925e5b  1a9b  458bfb               movl r15,r11
0x20220d925e5e  1a9e  453be3               cmpl r12,r11
0x20220d925e61  1aa1  450f42fc             cmovcl r15,r12
0x20220d925e65  1aa5  4585ff               testl r15,r15
0x20220d925e68  1aa8  0f8477020000         jz 0x20220d9260e5  <+0x1d25>
0x20220d925e6e  1aae  8bb550ffffff         movl rsi,[rbp-0xb0]
0x20220d925e74  1ab4  81e6f0ffff1f         andl rsi,0x1ffffff0
0x20220d925e7a  1aba  8d3cb7               leal rdi,[rdi+rsi*4]
0x20220d925e7d  1abd  448ba560ffffff       movl r12,[rbp-0xa0]
0x20220d925e84  1ac4  4181e4f0ffff1f       andl r12,0x1ffffff0
0x20220d925e8b  1acb  478d04a0             leal r8,[r8+r12*4]
0x20220d925e8f  1acf  c57b109538ffffff     vmovsd xmm10,[rbp-0xc8]
0x20220d925e97  1ad7  c5fb108540ffffff     vmovsd xmm0,[rbp-0xc0]
0x20220d925e9f  1adf  c5fb10a548ffffff     vmovsd xmm4,[rbp-0xb8]
0x20220d925ea7  1ae7  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d925eab  1aeb  448b9d70ffffff       movl r11,[rbp-0x90]
0x20220d925eb2  1af2  448be7               movl r12,rdi
0x20220d925eb5  1af5  8bbd88fbffff         movl rdi,[rbp-0x478]
0x20220d925ebb  1afb  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x20220d925ec0  1b00  c4c13972f019         vpslld xmm8,xmm8,25
0x20220d925ec6  1b06  c4c13972d002         vpsrld xmm8,xmm8,2
0x20220d925ecc  1b0c  e934000000           jmp 0x20220d925f05  <+0x1b45>
0x20220d925ed1  1b11  660f1f840000000000   nop
0x20220d925eda  1b1a  660f1f840000000000   nop
0x20220d925ee3  1b23  660f1f840000000000   nop
0x20220d925eec  1b2c  660f1f840000000000   nop
0x20220d925ef5  1b35  660f1f840000000000   nop
0x20220d925efe  1b3e  6690                 nop
0x20220d925f00  1b40  c4417928d3           vmovapd xmm10,xmm11
0x20220d925f05  1b45  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x20220d925f0b  1b4b  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x20220d925f13  1b53  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x20220d925f17  1b57  c5d259fd             vmulss xmm7,xmm5,xmm5
0x20220d925f1b  1b5b  c57a101c38           vmovss xmm11,[rax+rdi*1]
0x20220d925f20  1b60  c4412a5ce3           vsubss xmm12,xmm10,xmm11
0x20220d925f25  1b65  c4411a59d4           vmulss xmm10,xmm12,xmm12
0x20220d925f2a  1b6a  c5aa58ff             vaddss xmm7,xmm10,xmm7
0x20220d925f2e  1b6e  c5f82ec7             vucomiss xmm0,xmm7
0x20220d925f32  1b72  0f8745000000         ja 0x20220d925f7d  <+0x1bbd>
0x20220d925f38  1b78  c5f82ee7             vucomiss xmm4,xmm7
0x20220d925f3c  1b7c  0f8644000000         jna 0x20220d925f86  <+0x1bc6>
0x20220d925f42  1b82  c5f82efe             vucomiss xmm7,xmm6
0x20220d925f46  1b86  0f863a000000         jna 0x20220d925f86  <+0x1bc6>
0x20220d925f4c  1b8c  c4411258e8           vaddss xmm13,xmm13,xmm8
0x20220d925f51  1b91  c4e27918db           vbroadcastss xmm3,xmm3
0x20220d925f56  1b96  c4c36121db10         vinsertps xmm3,xmm3,xmm11,0x10
0x20220d925f5c  1b9c  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x20220d925f62  1ba2  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x20220d925f68  1ba8  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x20220d925f6e  1bae  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x20220d925f74  1bb4  c5e858d3             vaddps xmm2,xmm2,xmm3
0x20220d925f78  1bb8  e909000000           jmp 0x20220d925f86  <+0x1bc6>
0x20220d925f7d  1bbd  c59a58c9             vaddss xmm1,xmm12,xmm1
0x20220d925f81  1bc1  c4415258f6           vaddss xmm14,xmm5,xmm14
0x20220d925f86  1bc6  4183c404             addl r12,0x4
0x20220d925f8a  1bca  83c704               addl rdi,0x4
0x20220d925f8d  1bcd  4183c304             addl r11,0x4
0x20220d925f91  1bd1  4183c004             addl r8,0x4
0x20220d925f95  1bd5  4183c7ff             addl r15,0xff
0x20220d925f99  1bd9  0f8446010000         jz 0x20220d9260e5  <+0x1d25>
0x20220d925f9f  1bdf  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x20220d925fa5  1be5  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x20220d925fa9  1be9  c5d259fd             vmulss xmm7,xmm5,xmm5
0x20220d925fad  1bed  c57a101438           vmovss xmm10,[rax+rdi*1]
0x20220d925fb2  1bf2  c57b109d38ffffff     vmovsd xmm11,[rbp-0xc8]
0x20220d925fba  1bfa  c441225ce2           vsubss xmm12,xmm11,xmm10
0x20220d925fbf  1bff  c4411a59dc           vmulss xmm11,xmm12,xmm12
0x20220d925fc4  1c04  c5a258ff             vaddss xmm7,xmm11,xmm7
0x20220d925fc8  1c08  c5f82ec7             vucomiss xmm0,xmm7
0x20220d925fcc  1c0c  0f8745000000         ja 0x20220d926017  <+0x1c57>
0x20220d925fd2  1c12  c5f82ee7             vucomiss xmm4,xmm7
0x20220d925fd6  1c16  0f8644000000         jna 0x20220d926020  <+0x1c60>
0x20220d925fdc  1c1c  c5f82efe             vucomiss xmm7,xmm6
0x20220d925fe0  1c20  0f863a000000         jna 0x20220d926020  <+0x1c60>
0x20220d925fe6  1c26  c4411258e8           vaddss xmm13,xmm13,xmm8
0x20220d925feb  1c2b  c4e27918db           vbroadcastss xmm3,xmm3
0x20220d925ff0  1c30  c4c36121da10         vinsertps xmm3,xmm3,xmm10,0x10
0x20220d925ff6  1c36  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x20220d925ffc  1c3c  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x20220d926002  1c42  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x20220d926008  1c48  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x20220d92600e  1c4e  c5e858d3             vaddps xmm2,xmm2,xmm3
0x20220d926012  1c52  e909000000           jmp 0x20220d926020  <+0x1c60>
0x20220d926017  1c57  c59a58c9             vaddss xmm1,xmm12,xmm1
0x20220d92601b  1c5b  c4415258f6           vaddss xmm14,xmm5,xmm14
0x20220d926020  1c60  4183c404             addl r12,0x4
0x20220d926024  1c64  83c704               addl rdi,0x4
0x20220d926027  1c67  4183c304             addl r11,0x4
0x20220d92602b  1c6b  4183c004             addl r8,0x4
0x20220d92602f  1c6f  4183c7ff             addl r15,0xff
0x20220d926033  1c73  0f84ac000000         jz 0x20220d9260e5  <+0x1d25>
0x20220d926039  1c79  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x20220d92603d  1c7d  0f8608050000         jna 0x20220d92654b  <+0x218b>
0x20220d926043  1c83  c4a17a101c20         vmovss xmm3,[rax+r12*1]
0x20220d926049  1c89  c5b25ceb             vsubss xmm5,xmm9,xmm3
0x20220d92604d  1c8d  c5d259fd             vmulss xmm7,xmm5,xmm5
0x20220d926051  1c91  c57a101438           vmovss xmm10,[rax+rdi*1]
0x20220d926056  1c96  c57b109d38ffffff     vmovsd xmm11,[rbp-0xc8]
0x20220d92605e  1c9e  c441225ce2           vsubss xmm12,xmm11,xmm10
0x20220d926063  1ca3  c4411a59cc           vmulss xmm9,xmm12,xmm12
0x20220d926068  1ca8  c5b258ff             vaddss xmm7,xmm9,xmm7
0x20220d92606c  1cac  c5f82ec7             vucomiss xmm0,xmm7
0x20220d926070  1cb0  0f8745000000         ja 0x20220d9260bb  <+0x1cfb>
0x20220d926076  1cb6  c5f82ee7             vucomiss xmm4,xmm7
0x20220d92607a  1cba  0f8644000000         jna 0x20220d9260c4  <+0x1d04>
0x20220d926080  1cc0  c5f82efe             vucomiss xmm7,xmm6
0x20220d926084  1cc4  0f863a000000         jna 0x20220d9260c4  <+0x1d04>
0x20220d92608a  1cca  c4413a58ed           vaddss xmm13,xmm8,xmm13
0x20220d92608f  1ccf  c4e27918db           vbroadcastss xmm3,xmm3
0x20220d926094  1cd4  c4c36121da10         vinsertps xmm3,xmm3,xmm10,0x10
0x20220d92609a  1cda  c4a17a102c18         vmovss xmm5,[rax+r11*1]
0x20220d9260a0  1ce0  c4e36121dd20         vinsertps xmm3,xmm3,xmm5,0x20
0x20220d9260a6  1ce6  c4a17a102c00         vmovss xmm5,[rax+r8*1]
0x20220d9260ac  1cec  c4e36121dd30         vinsertps xmm3,xmm3,xmm5,0x30
0x20220d9260b2  1cf2  c5e858d3             vaddps xmm2,xmm2,xmm3
0x20220d9260b6  1cf6  e909000000           jmp 0x20220d9260c4  <+0x1d04>
0x20220d9260bb  1cfb  c59a58c9             vaddss xmm1,xmm12,xmm1
0x20220d9260bf  1cff  c4415258f6           vaddss xmm14,xmm5,xmm14
0x20220d9260c4  1d04  4183c404             addl r12,0x4
0x20220d9260c8  1d08  83c704               addl rdi,0x4
0x20220d9260cb  1d0b  4183c304             addl r11,0x4
0x20220d9260cf  1d0f  4183c004             addl r8,0x4
0x20220d9260d3  1d13  4183c7ff             addl r15,0xff
0x20220d9260d7  1d17  0f8523feffff         jnz 0x20220d925f00  <+0x1b40>
0x20220d9260dd  1d1d  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x20220d9260e5  1d25  448b4d80             movl r9,[rbp-0x80]
0x20220d9260e9  1d29  418d7901             leal rdi,[r9+0x1]
0x20220d9260ed  1d2d  448b8578ffffff       movl r8,[rbp-0x88]
0x20220d9260f4  1d34  453bc1               cmpl r8,r9
0x20220d9260f7  1d37  0f8543eeffff         jnz 0x20220d924f40  <+0xb80>
0x20220d9260fd  1d3d  8b5de0               movl rbx,[rbp-0x20]
0x20220d926100  1d40  c5fa114c1828         vmovss [rax+rbx*1+0x28],xmm1
0x20220d926106  1d46  c57a11741824         vmovss [rax+rbx*1+0x24],xmm14
0x20220d92610c  1d4c  c57a116c1820         vmovss [rax+rbx*1+0x20],xmm13
0x20220d926112  1d52  c5fa7f541810         vmovdqu [rax+rbx*1+0x10],xmm2
0x20220d926118  1d58  e906000000           jmp 0x20220d926123  <+0x1d63>
0x20220d92611d  1d5d  8b5de0               movl rbx,[rbp-0x20]
0x20220d926120  1d60  488bc7               REX.W movq rax,rdi
0x20220d926123  1d63  8d7b30               leal rdi,[rbx+0x30]
0x20220d926126  1d66  8d4b40               leal rcx,[rbx+0x40]
0x20220d926129  1d69  448d4b10             leal r9,[rbx+0x10]
0x20220d92612d  1d6d  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926131  1d71  8bc7                 movl rax,rdi
0x20220d926133  1d73  8b5598               movl rdx,[rbp-0x68]
0x20220d926136  1d76  c5fb104d90           vmovsd xmm1,[rbp-0x70]
0x20220d92613b  1d7b  c5fb105588           vmovsd xmm2,[rbp-0x78]
0x20220d926140  1d80  e8fb6bf2ff           call 0x20220d84cd40  (jump table)
0x20220d926145  1d85  8b7da0               movl rdi,[rbp-0x60]
0x20220d926148  1d88  3b7dd0               cmpl rdi,[rbp-0x30]
0x20220d92614b  1d8b  0f868a000000         jna 0x20220d9261db  <+0x1e1b>
0x20220d926151  1d91  8b55d0               movl rdx,[rbp-0x30]
0x20220d926154  1d94  448b45a8             movl r8,[rbp-0x58]
0x20220d926158  1d98  458d1c90             leal r11,[r8+rdx*4]
0x20220d92615c  1d9c  448b65e0             movl r12,[rbp-0x20]
0x20220d926160  1da0  4c8b7dc8             REX.W movq r15,[rbp-0x38]
0x20220d926164  1da4  c4817a10442730       vmovss xmm0,[r15+r12*1+0x30]
0x20220d92616b  1dab  c4817a11041f         vmovss [r15+r11*1],xmm0
0x20220d926171  1db1  448b5db0             movl r11,[rbp-0x50]
0x20220d926175  1db5  458d3493             leal r14,[r11+rdx*4]
0x20220d926179  1db9  c4817a10442734       vmovss xmm0,[r15+r12*1+0x34]
0x20220d926180  1dc0  c4817a110437         vmovss [r15+r14*1],xmm0
0x20220d926186  1dc6  448b75b8             movl r14,[rbp-0x48]
0x20220d92618a  1dca  418d0496             leal rax,[r14+rdx*4]
0x20220d92618e  1dce  c4817a10442738       vmovss xmm0,[r15+r12*1+0x38]
0x20220d926195  1dd5  c4c17a110407         vmovss [r15+rax*1],xmm0
0x20220d92619b  1ddb  8b45c0               movl rax,[rbp-0x40]
0x20220d92619e  1dde  8d1c90               leal rbx,[rax+rdx*4]
0x20220d9261a1  1de1  c4817a1044273c       vmovss xmm0,[r15+r12*1+0x3c]
0x20220d9261a8  1de8  c4c17a11041f         vmovss [r15+rbx*1],xmm0
0x20220d9261ae  1dee  498bff               REX.W movq rdi,r15
0x20220d9261b1  1df1  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d9261b5  1df5  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d9261bd  1dfd  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d9261c5  1e05  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d9261cd  1e0d  33c9                 xorl rcx,rcx
0x20220d9261cf  1e0f  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d9261d6  1e16  e92c000000           jmp 0x20220d926207  <+0x1e47>
0x20220d9261db  1e1b  8b55d0               movl rdx,[rbp-0x30]
0x20220d9261de  1e1e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d9261e2  1e22  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d9261e6  1e26  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d9261ee  1e2e  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d9261f6  1e36  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d9261fe  1e3e  33c9                 xorl rcx,rcx
0x20220d926200  1e40  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d926207  1e47  83c201               addl rdx,0x1
0x20220d92620a  1e4a  448b5dd8             movl r11,[rbp-0x28]
0x20220d92620e  1e4e  443bda               cmpl r11,rdx
0x20220d926211  1e51  0f85e9e9ffff         jnz 0x20220d924c00  <+0x840>
0x20220d926217  1e57  8b7de0               movl rdi,[rbp-0x20]
0x20220d92621a  1e5a  83c750               addl rdi,0x50
0x20220d92621d  1e5d  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x20220d926221  1e61  418938               movl [r8],rdi
0x20220d926224  1e64  488be5               REX.W movq rsp,rbp
0x20220d926227  1e67  5d                   pop rbp
0x20220d926228  1e68  c3                   retl
0x20220d926229  1e69  e8a272f2ff           call 0x20220d84d4d0  (jump table)
0x20220d92622e  1e6e  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d926232  1e72  488b75f0             REX.W movq rsi,[rbp-0x10]
0x20220d926236  1e76  8b45d8               movl rax,[rbp-0x28]
0x20220d926239  1e79  e9a6e1ffff           jmp 0x20220d9243e4  <+0x24>
0x20220d92623e  1e7e  c5f92eff             vucomisd xmm7,xmm7
0x20220d926242  1e82  0f8b0b000000         jpo 0x20220d926253  <+0x1e93>
0x20220d926248  1e88  4533ff               xorl r15,r15
0x20220d92624b  1e8b  4d8be7               REX.W movq r12,r15
0x20220d92624e  1e8e  e906e3ffff           jmp 0x20220d924559  <+0x199>
0x20220d926253  1e93  c5c057ff             vxorps xmm7,xmm7,xmm7
0x20220d926257  1e97  c5f82efe             vucomiss xmm7,xmm6
0x20220d92625b  1e9b  0f870b000000         ja 0x20220d92626c  <+0x1eac>
0x20220d926261  1ea1  41bcffffffff         movl r12,0xffffffff
0x20220d926267  1ea7  e9ede2ffff           jmp 0x20220d924559  <+0x199>
0x20220d92626c  1eac  4531e4               xorl r12,r12
0x20220d92626f  1eaf  e9e5e2ffff           jmp 0x20220d924559  <+0x199>
0x20220d926274  1eb4  c441792ec0           vucomisd xmm8,xmm8
0x20220d926279  1eb9  0f8b08000000         jpo 0x20220d926287  <+0x1ec7>
0x20220d92627f  1ebf  4531e4               xorl r12,r12
0x20220d926282  1ec2  e939e3ffff           jmp 0x20220d9245c0  <+0x200>
0x20220d926287  1ec7  c4413857c0           vxorps xmm8,xmm8,xmm8
0x20220d92628c  1ecc  c5782ec7             vucomiss xmm8,xmm7
0x20220d926290  1ed0  77ed                 ja 0x20220d92627f  <+0x1ebf>
0x20220d926292  1ed2  41bcffffffff         movl r12,0xffffffff
0x20220d926298  1ed8  e923e3ffff           jmp 0x20220d9245c0  <+0x200>
0x20220d92629d  1edd  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d9262a5  1ee5  488975a8             REX.W movq [rbp-0x58],rsi
0x20220d9262a9  1ee9  48894da0             REX.W movq [rbp-0x60],rcx
0x20220d9262ad  1eed  e81e72f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9262b2  1ef2  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d9262b6  1ef6  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d9262bd  1efd  448b5dd8             movl r11,[rbp-0x28]
0x20220d9262c1  1f01  8b4da0               movl rcx,[rbp-0x60]
0x20220d9262c4  1f04  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d9262cc  1f0c  8b5db0               movl rbx,[rbp-0x50]
0x20220d9262cf  1f0f  8b45b8               movl rax,[rbp-0x48]
0x20220d9262d2  1f12  448b75c0             movl r14,[rbp-0x40]
0x20220d9262d6  1f16  8b75a8               movl rsi,[rbp-0x58]
0x20220d9262d9  1f19  e92ce4ffff           jmp 0x20220d92470a  <+0x34a>
0x20220d9262de  1f1e  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d9262e6  1f26  4c8975b8             REX.W movq [rbp-0x48],r14
0x20220d9262ea  1f2a  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d9262ee  1f2e  e8dd71f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9262f3  1f33  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d9262f7  1f37  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d9262fe  1f3e  448b5dd8             movl r11,[rbp-0x28]
0x20220d926302  1f42  8b55c0               movl rdx,[rbp-0x40]
0x20220d926305  1f45  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d92630d  1f4d  8b45a0               movl rax,[rbp-0x60]
0x20220d926310  1f50  448b7da8             movl r15,[rbp-0x58]
0x20220d926314  1f54  448b65b0             movl r12,[rbp-0x50]
0x20220d926318  1f58  448b75b8             movl r14,[rbp-0x48]
0x20220d92631c  1f5c  e9e9e4ffff           jmp 0x20220d92480a  <+0x44a>
0x20220d926321  1f61  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d926329  1f69  4c8975a8             REX.W movq [rbp-0x58],r14
0x20220d92632d  1f6d  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d926331  1f71  e89a71f2ff           call 0x20220d84d4d0  (jump table)
0x20220d926336  1f76  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d92633a  1f7a  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d926341  1f81  448b5dd8             movl r11,[rbp-0x28]
0x20220d926345  1f85  8b55c0               movl rdx,[rbp-0x40]
0x20220d926348  1f88  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d926350  1f90  8b45b8               movl rax,[rbp-0x48]
0x20220d926353  1f93  448bbd68ffffff       movl r15,[rbp-0x98]
0x20220d92635a  1f9a  448b65a0             movl r12,[rbp-0x60]
0x20220d92635e  1f9e  448b75a8             movl r14,[rbp-0x58]
0x20220d926362  1fa2  e9a3e5ffff           jmp 0x20220d92490a  <+0x54a>
0x20220d926367  1fa7  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x20220d92636f  1faf  4c895d80             REX.W movq [rbp-0x80],r11
0x20220d926373  1fb3  488955c0             REX.W movq [rbp-0x40],rdx
0x20220d926377  1fb7  e85471f2ff           call 0x20220d84d4d0  (jump table)
0x20220d92637c  1fbc  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d926380  1fc0  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d926387  1fc7  8b55c0               movl rdx,[rbp-0x40]
0x20220d92638a  1fca  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x20220d926392  1fd2  8b45d8               movl rax,[rbp-0x28]
0x20220d926395  1fd5  448b7db8             movl r15,[rbp-0x48]
0x20220d926399  1fd9  448b65b0             movl r12,[rbp-0x50]
0x20220d92639d  1fdd  448b5d80             movl r11,[rbp-0x80]
0x20220d9263a1  1fe1  e964e6ffff           jmp 0x20220d924a0a  <+0x64a>
0x20220d9263a6  1fe6  488955d0             REX.W movq [rbp-0x30],rdx
0x20220d9263aa  1fea  e82171f2ff           call 0x20220d84d4d0  (jump table)
0x20220d9263af  1fef  8b55d0               movl rdx,[rbp-0x30]
0x20220d9263b2  1ff2  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d9263b6  1ff6  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d9263ba  1ffa  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d9263c2  2002  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d9263ca  200a  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d9263d2  2012  33c9                 xorl rcx,rcx
0x20220d9263d4  2014  4c8b8528ffffff       REX.W movq r8,[rbp-0xd8]
0x20220d9263db  201b  e92ae8ffff           jmp 0x20220d924c0a  <+0x84a>
0x20220d9263e0  2020  c441792eed           vucomisd xmm13,xmm13
0x20220d9263e5  2025  0f8b08000000         jpo 0x20220d9263f3  <+0x2033>
0x20220d9263eb  202b  488bd1               REX.W movq rdx,rcx
0x20220d9263ee  202e  e9a8e9ffff           jmp 0x20220d924d9b  <+0x9db>
0x20220d9263f3  2033  c4c1782ef4           vucomiss xmm6,xmm12
0x20220d9263f8  2038  77f1                 ja 0x20220d9263eb  <+0x202b>
0x20220d9263fa  203a  baffffffff           movl rdx,0xffffffff
0x20220d9263ff  203f  e997e9ffff           jmp 0x20220d924d9b  <+0x9db>
0x20220d926404  2044  c441792ee4           vucomisd xmm12,xmm12
0x20220d926409  2049  0f8b08000000         jpo 0x20220d926417  <+0x2057>
0x20220d92640f  204f  488bd9               REX.W movq rbx,rcx
0x20220d926412  2052  e968eaffff           jmp 0x20220d924e7f  <+0xabf>
0x20220d926417  2057  c4c1782ef3           vucomiss xmm6,xmm11
0x20220d92641c  205c  77f1                 ja 0x20220d92640f  <+0x204f>
0x20220d92641e  205e  bbffffffff           movl rbx,0xffffffff
0x20220d926423  2063  e957eaffff           jmp 0x20220d924e7f  <+0xabf>
0x20220d926428  2068  e8a370f2ff           call 0x20220d84d4d0  (jump table)
0x20220d92642d  206d  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x20220d926431  2071  448b4d80             movl r9,[rbp-0x80]
0x20220d926435  2075  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d92643d  207d  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d926445  2085  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d92644d  208d  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x20220d926455  2095  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x20220d92645d  209d  33c9                 xorl rcx,rcx
0x20220d92645f  209f  448b9d58fbffff       movl r11,[rbp-0x4a8]
0x20220d926466  20a6  8b8550fbffff         movl rax,[rbp-0x4b0]
0x20220d92646c  20ac  8bb548fbffff         movl rsi,[rbp-0x4b8]
0x20220d926472  20b2  448bbd90fbffff       movl r15,[rbp-0x470]
0x20220d926479  20b9  8b9d98fbffff         movl rbx,[rbp-0x468]
0x20220d92647f  20bf  8b9500ffffff         movl rdx,[rbp-0x100]
0x20220d926485  20c5  448ba5a0fbffff       movl r12,[rbp-0x460]
0x20220d92648c  20cc  448bb508ffffff       movl r14,[rbp-0xf8]
0x20220d926493  20d3  e93aebffff           jmp 0x20220d924fd2  <+0xc12>
0x20220d926498  20d8  4c898568ffffff       REX.W movq [rbp-0x98],r8
0x20220d92649f  20df  4889bd58ffffff       REX.W movq [rbp-0xa8],rdi
0x20220d9264a6  20e6  4889b5f8feffff       REX.W movq [rbp-0x108],rsi
0x20220d9264ad  20ed  4c89b5f0feffff       REX.W movq [rbp-0x110],r14
0x20220d9264b4  20f4  4c899dd0feffff       REX.W movq [rbp-0x130],r11
0x20220d9264bb  20fb  4c89a5b8feffff       REX.W movq [rbp-0x148],r12
0x20220d9264c2  2102  488995b0feffff       REX.W movq [rbp-0x150],rdx
0x20220d9264c9  2109  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x20220d9264d1  2111  4c89bda8fbffff       REX.W movq [rbp-0x458],r15
0x20220d9264d8  2118  e8f36ff2ff           call 0x20220d84d4d0  (jump table)
0x20220d9264dd  211d  488b45c8             REX.W movq rax,[rbp-0x38]
0x20220d9264e1  2121  448b8568ffffff       movl r8,[rbp-0x98]
0x20220d9264e8  2128  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x20220d9264ee  212e  8bb5f8feffff         movl rsi,[rbp-0x108]
0x20220d9264f4  2134  448bb5f0feffff       movl r14,[rbp-0x110]
0x20220d9264fb  213b  448b9dd0feffff       movl r11,[rbp-0x130]
0x20220d926502  2142  448ba5b8feffff       movl r12,[rbp-0x148]
0x20220d926509  2149  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x20220d926511  2151  c5f8109d50feffff     vmovups xmm3,[rbp-0x1b0]
0x20220d926519  2159  8b95b0feffff         movl rdx,[rbp-0x150]
0x20220d92651f  215f  c5f8108510fcffff     vmovups xmm0,[rbp-0x3f0]
0x20220d926527  2167  c5f810ad00fcffff     vmovups xmm5,[rbp-0x400]
0x20220d92652f  216f  c57810a5f0fbffff     vmovups xmm12,[rbp-0x410]
0x20220d926537  2177  c578109de0fbffff     vmovups xmm11,[rbp-0x420]
0x20220d92653f  217f  448bbda8fbffff       movl r15,[rbp-0x458]
0x20220d926546  2186  e9bfeeffff           jmp 0x20220d92540a  <+0x104a>
0x20220d92654b  218b  c5fb118dd8feffff     vmovsd [rbp-0x128],xmm1
0x20220d926553  2193  c57b11b5e0feffff     vmovsd [rbp-0x120],xmm14
0x20220d92655b  219b  c57b11ade8feffff     vmovsd [rbp-0x118],xmm13
0x20220d926563  21a3  c5f81195c0feffff     vmovups [rbp-0x140],xmm2
0x20220d92656b  21ab  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x20220d926572  21b2  4c898568ffffff       REX.W movq [rbp-0x98],r8
0x20220d926579  21b9  4c899d60ffffff       REX.W movq [rbp-0xa0],r11
0x20220d926580  21c0  4889bd58ffffff       REX.W movq [rbp-0xa8],rdi
0x20220d926587  21c7  4c89a550ffffff       REX.W movq [rbp-0xb0],r12
0x20220d92658e  21ce  e83d6ff2ff           call 0x20220d84d4d0  (jump table)
0x20220d926593  21d3  488b45c8             REX.W movq rax,[rbp-0x38]
0x20220d926597  21d7  c5fb108dd8feffff     vmovsd xmm1,[rbp-0x128]
0x20220d92659f  21df  c57b10b5e0feffff     vmovsd xmm14,[rbp-0x120]
0x20220d9265a7  21e7  c57b10ade8feffff     vmovsd xmm13,[rbp-0x118]
0x20220d9265af  21ef  c5f81095c0feffff     vmovups xmm2,[rbp-0x140]
0x20220d9265b7  21f7  4c8bbd70ffffff       REX.W movq r15,[rbp-0x90]
0x20220d9265be  21fe  448b8568ffffff       movl r8,[rbp-0x98]
0x20220d9265c5  2205  448b9d60ffffff       movl r11,[rbp-0xa0]
0x20220d9265cc  220c  8bbd58ffffff         movl rdi,[rbp-0xa8]
0x20220d9265d2  2212  448ba550ffffff       movl r12,[rbp-0xb0]
0x20220d9265d9  2219  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x20220d9265de  221e  c4c13972f019         vpslld xmm8,xmm8,25
0x20220d9265e4  2224  c4c13972d002         vpsrld xmm8,xmm8,2
0x20220d9265ea  222a  c5c857f6             vxorps xmm6,xmm6,xmm6
0x20220d9265ee  222e  c5fb10a548ffffff     vmovsd xmm4,[rbp-0xb8]
0x20220d9265f6  2236  c5fb108540ffffff     vmovsd xmm0,[rbp-0xc0]
0x20220d9265fe  223e  c57b108d30ffffff     vmovsd xmm9,[rbp-0xd0]
0x20220d926606  2246  e938faffff           jmp 0x20220d926043  <+0x1c83>
0x20220d92660b  224b  90                   nop

Protected instructions:
 pc offset
        3c         
        5d         
       118         
       25a         
       260         
       268         
       26d         
       275         
       27e         
       283         
       288         
       28d         
       2b8         
       2cc         
       2d1         
       2dd         
       2e2         
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
       780         
       785         
       78a         
       78f         
       7b1         
       7d2         
       7d7         
       7dc         
       7e1         
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
       118       176
       25a       289
       260       299
       268       303
       26d       310
       275       314
       27e       325
       283       330
       288       335
       28d       340
       292       343
       2ad       357
       2cc       370
       2d1       377
       2dd       389
       2e2       396
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
       5e6       875
       5eb       880
       5f3       891
       5ff       910
       608       915
       60d       922
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
       7d2      1273
       7d7      1280
       7dc      1287
       7e1      1294
       84a      1311
       85e      1323
       873      1335
       888      1347
       89d      1357
       8a6      1370
       8ac      1377
       8b5      1385
       8ba      1392
       8c2      1400
       8c7      1409
       8d0      1417
       8da      1420
       8e3      1427
       8e9      1434
       8ef      1441
       8f4      1448
       902      1471
       908      1477
       912      1487
       91a      1494
       a23      1599
       afa      1716
       aff      1723
       c3a      1816
       c42      1829
      104e      2380
      105f      2405
      10a8      2469
      10ca      2492
      112e      2556
      1150      2579
      11b3      2643
      11d5      2666
      1231      2730
      1253      2753
      1298      2802
      12b4      2823
      12f9      2872
      1314      2893
      136d      2942
      138e      2963
      1b45      3979
      1b5b      3994
      1b9c      4055
      1ba8      4063
      1bdf      3979
      1bed      3994
      1c36      4055
      1c42      4063
      1c83      3979
      1c91      3994
      1cda      4055
      1ce6      4063
      1d3d      4150
      1d46      4157
      1d4c      4164
      1d52      4171
      1d6d      4200
      1d9c      4220
      1dab      4223
      1db9      4233
      1dc0      4236
      1dce      4246
      1dd5      4249
      1de1      4259
      1de8      4262
      1e69         0
      1edd       412
      1f1e       587
      1f61       763
      1fa7       935
      1fe6      1303
      2068      1753
      20d8      2369
      218b      3969

Safepoints (stack slots = 153, entries = 1, byte size = 34)
0x20220d92466d    2ad  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 49)
0x20220d924669  internal wasm call
0x20220d92477b  internal wasm call
0x20220d924873  internal wasm call
0x20220d924973  internal wasm call
0x20220d924a77  internal wasm call
0x20220d926141  internal wasm call
0x20220d92622a  wasm stub call  (0x20220d84d4d0)
0x20220d9262ae  wasm stub call  (0x20220d84d4d0)
0x20220d9262ef  wasm stub call  (0x20220d84d4d0)
0x20220d926332  wasm stub call  (0x20220d84d4d0)
0x20220d926378  wasm stub call  (0x20220d84d4d0)
0x20220d9263ab  wasm stub call  (0x20220d84d4d0)
0x20220d926429  wasm stub call  (0x20220d84d4d0)
0x20220d9264d9  wasm stub call  (0x20220d84d4d0)
0x20220d92658f  wasm stub call  (0x20220d84d4d0)
