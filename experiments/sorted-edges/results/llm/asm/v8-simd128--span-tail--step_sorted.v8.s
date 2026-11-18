name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 10560 = 10532 + 28 padding)
Instructions (size = 10500)
0x19b556c45100     0  55                   push rbp
0x19b556c45101     1  4889e5               REX.W movq rbp,rsp
0x19b556c45104     4  6a08                 push 0x8
0x19b556c45106     6  56                   push rsi
0x19b556c45107     7  4881ec20040000       REX.W subq rsp,0x420
0x19b556c4510e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x19b556c45112    12  488945d8             REX.W movq [rbp-0x28],rax
0x19b556c45116    16  4c895dc8             REX.W movq [rbp-0x38],r11
0x19b556c4511a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c4511e    1e  0f86bb240000         jna 0x19b556c475df  <+0x24df>
0x19b556c45124    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x19b556c45128    28  458b3c24             movl r15,[r12]
0x19b556c4512c    2c  418d9f00feffff       leal rbx,[r15-0x200]
0x19b556c45133    33  41891c24             movl [r12],rbx
0x19b556c45137    37  448bf8               movl r15,rax
0x19b556c4513a    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x19b556c45141    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x19b556c45147    47  c5fa16d0             vmovshdup xmm2,xmm0
0x19b556c4514b    4b  41ba0000803a         movl r10,0x3a800000
0x19b556c45151    51  c4c1796eda           vmovd xmm3,r10
0x19b556c45156    56  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x19b556c4515a    5a  c5f828c8             vmovaps xmm1,xmm0
0x19b556c4515e    5e  c5e259d9             vmulss xmm3,xmm3,xmm1
0x19b556c45162    62  c4817a10ac3ba0000000 vmovss xmm5,[r11+r15*1+0xa0]
0x19b556c4516c    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x19b556c45170    70  48895de0             REX.W movq [rbp-0x20],rbx
0x19b556c45174    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x19b556c4517b    7b  c5fb115580           vmovsd [rbp-0x80],xmm2
0x19b556c45180    80  c5fb114d88           vmovsd [rbp-0x78],xmm1
0x19b556c45185    85  c5fb116dd0           vmovsd [rbp-0x30],xmm5
0x19b556c4518a    8a  c5f82eed             vucomiss xmm5,xmm5
0x19b556c4518e    8e  7a06                 jpe 0x19b556c45196  <+0x96>
0x19b556c45190    90  0f8409000000         jz 0x19b556c4519f  <+0x9f>
0x19b556c45196    96  c5f928f3             vmovapd xmm6,xmm3
0x19b556c4519a    9a  e904000000           jmp 0x19b556c451a3  <+0xa3>
0x19b556c4519f    9f  c5f928f5             vmovapd xmm6,xmm5
0x19b556c451a3    a3  c5f82edb             vucomiss xmm3,xmm3
0x19b556c451a7    a7  7a06                 jpe 0x19b556c451af  <+0xaf>
0x19b556c451a9    a9  0f8404000000         jz 0x19b556c451b3  <+0xb3>
0x19b556c451af    af  c5f928de             vmovapd xmm3,xmm6
0x19b556c451b3    b3  c5f82ef3             vucomiss xmm6,xmm3
0x19b556c451b7    b7  0f8704000000         ja 0x19b556c451c1  <+0xc1>
0x19b556c451bd    bd  c5f928f3             vmovapd xmm6,xmm3
0x19b556c451c1    c1  c5f82ef6             vucomiss xmm6,xmm6
0x19b556c451c5    c5  7a06                 jpe 0x19b556c451cd  <+0xcd>
0x19b556c451c7    c7  0f8409000000         jz 0x19b556c451d6  <+0xd6>
0x19b556c451cd    cd  c5f928dc             vmovapd xmm3,xmm4
0x19b556c451d1    d1  e904000000           jmp 0x19b556c451da  <+0xda>
0x19b556c451d6    d6  c5f928de             vmovapd xmm3,xmm6
0x19b556c451da    da  c5f82ee4             vucomiss xmm4,xmm4
0x19b556c451de    de  7a06                 jpe 0x19b556c451e6  <+0xe6>
0x19b556c451e0    e0  0f8404000000         jz 0x19b556c451ea  <+0xea>
0x19b556c451e6    e6  c5f928e3             vmovapd xmm4,xmm3
0x19b556c451ea    ea  c5f82edc             vucomiss xmm3,xmm4
0x19b556c451ee    ee  0f8704000000         ja 0x19b556c451f8  <+0xf8>
0x19b556c451f4    f4  c5f928dc             vmovapd xmm3,xmm4
0x19b556c451f8    f8  41ba0020803f         movl r10,0x3f802000
0x19b556c451fe    fe  c4c1796ee2           vmovd xmm4,r10
0x19b556c45203   103  c5da59db             vmulss xmm3,xmm4,xmm3
0x19b556c45207   107  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x19b556c4520b   10b  c5d972f419           vpslld xmm4,xmm4,25
0x19b556c45210   110  c5d972d402           vpsrld xmm4,xmm4,2
0x19b556c45215   115  c5da5edb             vdivss xmm3,xmm4,xmm3
0x19b556c45219   119  c5f828db             vmovaps xmm3,xmm3
0x19b556c4521d   11d  c4817a119c3b84000000 vmovss [r11+r15*1+0x84],xmm3
0x19b556c45227   127  c4e27918f3           vbroadcastss xmm6,xmm3
0x19b556c4522c   12c  c5f859c6             vmulps xmm0,xmm0,xmm6
0x19b556c45230   130  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x19b556c45236   136  c5f828f0             vmovaps xmm6,xmm0
0x19b556c4523a   13a  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x19b556c4523e   13e  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x19b556c45244   144  c4417b2cf0           vcvttsd2si r14,xmm8
0x19b556c45249   149  4585f6               testl r14,r14
0x19b556c4524c   14c  0f892b000000         jns 0x19b556c4527d  <+0x17d>
0x19b556c45252   152  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x19b556c4525c   15c  c441f96efa           vmovq xmm15,r10
0x19b556c45261   161  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x19b556c45266   166  c4417b2cf7           vcvttsd2si r14,xmm15
0x19b556c4526b   16b  4585f6               testl r14,r14
0x19b556c4526e   16e  0f8809000000         js 0x19b556c4527d  <+0x17d>
0x19b556c45274   174  41ba00000080         movl r10,0x80000000
0x19b556c4527a   17a  450bf2               orl r14,r10
0x19b556c4527d   17d  458bd6               movl r10,r14
0x19b556c45280   180  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x19b556c45285   185  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c4528d   18d  c441792ec8           vucomisd xmm9,xmm8
0x19b556c45292   192  0f8a5c230000         jpe 0x19b556c475f4  <+0x24f4>
0x19b556c45298   198  0f8556230000         jnz 0x19b556c475f4  <+0x24f4>
0x19b556c4529e   19e  c4c1796ef6           vmovd xmm6,r14
0x19b556c452a3   1a3  c5f970f600           vpshufd xmm6,xmm6,0x0
0x19b556c452a8   1a8  c5fa16f8             vmovshdup xmm7,xmm0
0x19b556c452ac   1ac  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x19b556c452b0   1b0  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x19b556c452b6   1b6  c4417b2cf1           vcvttsd2si r14,xmm9
0x19b556c452bb   1bb  4585f6               testl r14,r14
0x19b556c452be   1be  0f8928000000         jns 0x19b556c452ec  <+0x1ec>
0x19b556c452c4   1c4  4c8b1589ffffff       REX.W movq r10,[rip+0xffffff89]
0x19b556c452cb   1cb  c441f96efa           vmovq xmm15,r10
0x19b556c452d0   1d0  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x19b556c452d5   1d5  c4417b2cf7           vcvttsd2si r14,xmm15
0x19b556c452da   1da  4585f6               testl r14,r14
0x19b556c452dd   1dd  0f8809000000         js 0x19b556c452ec  <+0x1ec>
0x19b556c452e3   1e3  41ba00000080         movl r10,0x80000000
0x19b556c452e9   1e9  450bf2               orl r14,r10
0x19b556c452ec   1ec  458bd6               movl r10,r14
0x19b556c452ef   1ef  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x19b556c452f4   1f4  c441792ed1           vucomisd xmm10,xmm9
0x19b556c452f9   1f9  0f8a2a230000         jpe 0x19b556c47629  <+0x2529>
0x19b556c452ff   1ff  0f8524230000         jnz 0x19b556c47629  <+0x2529>
0x19b556c45305   205  c4c34922f601         vpinsrd xmm6,xmm6,r14,0x1
0x19b556c4530b   20b  49ba0100000001000000 REX.W movq r10,0x100000001
0x19b556c45315   215  c4c1f96efa           vmovq xmm7,r10
0x19b556c4531a   21a  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x19b556c4531e   21e  c4e2493ff7           vpmaxud xmm6,xmm6,xmm7
0x19b556c45323   223  c44139efc0           vpxor xmm8,xmm8,xmm8
0x19b556c45328   228  c538c2c802           vcmpps xmm9,xmm8,xmm0, (le)
0x19b556c4532d   22d  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x19b556c45337   237  c441f96ed2           vmovq xmm10,r10
0x19b556c4533c   23c  c441296cd2           vpunpcklqdq xmm10,xmm10,xmm10
0x19b556c45341   241  c4c178c2c201         vcmpps xmm0,xmm0,xmm10, (lt)
0x19b556c45347   247  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x19b556c4534b   24b  c579dfff             vpandn xmm15,xmm0,xmm7
0x19b556c4534f   24f  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x19b556c45353   253  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x19b556c45358   258  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x19b556c4535f   25f  c4817813043e         vmovlps [r14+r15*1],xmm0
0x19b556c45365   265  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x19b556c4536d   26d  4589741b38           movl [r11+rbx*1+0x38],r14
0x19b556c45372   272  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x19b556c4537a   27a  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x19b556c4537f   27f  448d7060             leal r14,[rax+0x60]
0x19b556c45383   283  438b543b04           movl rdx,[r11+r15*1+0x4]
0x19b556c45388   288  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x19b556c4538d   28d  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x19b556c45392   292  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x19b556c45397   297  c5f811bd80feffff     vmovups [rbp-0x180],xmm7
0x19b556c4539f   29f  c578118540fcffff     vmovups [rbp-0x3c0],xmm8
0x19b556c453a7   2a7  418bc6               movl rax,r14
0x19b556c453aa   2aa  8bdf                 movl rbx,rdi
0x19b556c453ac   2ac  e84769f2ff           call 0x19b556b6bcf8  (jump table)
0x19b556c453b1   2b1  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c453b5   2b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c453bc   2bc  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x19b556c453c5   2c5  448b7dd8             movl r15,[rbp-0x28]
0x19b556c453c9   2c9  418d97a0000000       leal rdx,[r15+0xa0]
0x19b556c453d0   2d0  478b74237c           movl r14,[r11+r12*1+0x7c]
0x19b556c453d5   2d5  438b842380000000     movl rax,[r11+r12*1+0x80]
0x19b556c453dd   2dd  418d0486             leal rax,[r14+rax*4]
0x19b556c453e1   2e1  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x19b556c453e6   2e6  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x19b556c453eb   2eb  418d7730             leal rsi,[r15+0x30]
0x19b556c453ef   2ef  48895590             REX.W movq [rbp-0x70],rdx
0x19b556c453f3   2f3  4c897598             REX.W movq [rbp-0x68],r14
0x19b556c453f7   2f7  48898578ffffff       REX.W movq [rbp-0x88],rax
0x19b556c453fe   2fe  48895dc0             REX.W movq [rbp-0x40],rbx
0x19b556c45402   302  48894db8             REX.W movq [rbp-0x48],rcx
0x19b556c45406   306  488975b0             REX.W movq [rbp-0x50],rsi
0x19b556c4540a   30a  458bc6               movl r8,r14
0x19b556c4540d   30d  33ff                 xorl rdi,rdi
0x19b556c4540f   30f  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c45417   317  660f1f840000000000   nop
0x19b556c45420   320  660f1f840000000000   nop
0x19b556c45429   329  660f1f840000000000   nop
0x19b556c45432   332  660f1f840000000000   nop
0x19b556c4543b   33b  0f1f440000           nop
0x19b556c45440   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c45444   344  0f8608220000         jna 0x19b556c47652  <+0x2552>
0x19b556c4544a   34a  443b8578ffffff       cmpl r8,[rbp-0x88]
0x19b556c45451   351  0f8422000000         jz 0x19b556c45479  <+0x379>
0x19b556c45457   357  478b0c03             movl r9,[r11+r8*1]
0x19b556c4545b   35b  4183c004             addl r8,0x4
0x19b556c4545f   35f  413bd9               cmpl rbx,r9
0x19b556c45462   362  76dc                 jna 0x19b556c45440  <+0x340>
0x19b556c45464   364  468d0c89             leal r9,[rcx+r9*4]
0x19b556c45468   368  c4817a101c0b         vmovss xmm3,[r11+r9*1]
0x19b556c4546e   36e  41b901000000         movl r9,0x1
0x19b556c45474   374  e90a000000           jmp 0x19b556c45483  <+0x383>
0x19b556c45479   379  4533c9               xorl r9,r9
0x19b556c4547c   37c  448b8578ffffff       movl r8,[rbp-0x88]
0x19b556c45483   383  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c4548b   38b  4c8945a8             REX.W movq [rbp-0x58],r8
0x19b556c4548f   38f  4183f901             cmpl r9,0x1
0x19b556c45493   393  0f856f000000         jnz 0x19b556c45508  <+0x408>
0x19b556c45499   399  478b4c2330           movl r9,[r11+r12*1+0x30]
0x19b556c4549e   39e  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x19b556c454a3   3a3  0f8540000000         jnz 0x19b556c454e9  <+0x3e9>
0x19b556c454a9   3a9  b901000000           movl rcx,0x1
0x19b556c454ae   3ae  48897da0             REX.W movq [rbp-0x60],rdi
0x19b556c454b2   3b2  8bc6                 movl rax,rsi
0x19b556c454b4   3b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c454b8   3b8  8bd7                 movl rdx,rdi
0x19b556c454ba   3ba  4c8bc9               REX.W movq r9,rcx
0x19b556c454bd   3bd  e83e68f2ff           call 0x19b556b6bd00  (jump table)
0x19b556c454c2   3c2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c454c6   3c6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c454cd   3cd  448b7dd8             movl r15,[rbp-0x28]
0x19b556c454d1   3d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c454d9   3d9  448b45a8             movl r8,[rbp-0x58]
0x19b556c454dd   3dd  8b7da0               movl rdi,[rbp-0x60]
0x19b556c454e0   3e0  8b75b0               movl rsi,[rbp-0x50]
0x19b556c454e3   3e3  8b4db8               movl rcx,[rbp-0x48]
0x19b556c454e6   3e6  8b5dc0               movl rbx,[rbp-0x40]
0x19b556c454e9   3e9  448d7701             leal r14,[rdi+0x1]
0x19b556c454ed   3ed  4789742338           movl [r11+r12*1+0x38],r14
0x19b556c454f2   3f2  438b442334           movl rax,[r11+r12*1+0x34]
0x19b556c454f7   3f7  8d04b8               leal rax,[rax+rdi*4]
0x19b556c454fa   3fa  c4c17a111c03         vmovss [r11+rax*1],xmm3
0x19b556c45500   400  418bfe               movl rdi,r14
0x19b556c45503   403  e938ffffff           jmp 0x19b556c45440  <+0x340>
0x19b556c45508   408  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x19b556c45511   411  478b742314           movl r14,[r11+r12*1+0x14]
0x19b556c45516   416  438b442310           movl rax,[r11+r12*1+0x10]
0x19b556c4551b   41b  418d5f3c             leal rbx,[r15+0x3c]
0x19b556c4551f   41f  4c8975b0             REX.W movq [rbp-0x50],r14
0x19b556c45523   423  488945a8             REX.W movq [rbp-0x58],rax
0x19b556c45527   427  48895da0             REX.W movq [rbp-0x60],rbx
0x19b556c4552b   42b  8b4d98               movl rcx,[rbp-0x68]
0x19b556c4552e   42e  33d2                 xorl rdx,rdx
0x19b556c45530   430  660f1f840000000000   nop
0x19b556c45539   439  0f1f8000000000       nop
0x19b556c45540   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c45544   444  0f8649210000         jna 0x19b556c47693  <+0x2593>
0x19b556c4554a   44a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x19b556c45550   450  0f841f000000         jz 0x19b556c45575  <+0x475>
0x19b556c45556   456  418b340b             movl rsi,[r11+rcx*1]
0x19b556c4555a   45a  83c104               addl rcx,0x4
0x19b556c4555d   45d  443bf6               cmpl r14,rsi
0x19b556c45560   460  76de                 jna 0x19b556c45540  <+0x440>
0x19b556c45562   462  8d34b0               leal rsi,[rax+rsi*4]
0x19b556c45565   465  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x19b556c4556b   46b  be01000000           movl rsi,0x1
0x19b556c45570   470  e908000000           jmp 0x19b556c4557d  <+0x47d>
0x19b556c45575   475  33f6                 xorl rsi,rsi
0x19b556c45577   477  8b8d78ffffff         movl rcx,[rbp-0x88]
0x19b556c4557d   47d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c45585   485  48894db8             REX.W movq [rbp-0x48],rcx
0x19b556c45589   489  83fe01               cmpl rsi,0x1
0x19b556c4558c   48c  0f8568000000         jnz 0x19b556c455fa  <+0x4fa>
0x19b556c45592   492  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x19b556c45597   497  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x19b556c4559c   49c  0f853b000000         jnz 0x19b556c455dd  <+0x4dd>
0x19b556c455a2   4a2  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c455a6   4a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c455aa   4aa  8bc3                 movl rax,rbx
0x19b556c455ac   4ac  b901000000           movl rcx,0x1
0x19b556c455b1   4b1  e84a67f2ff           call 0x19b556b6bd00  (jump table)
0x19b556c455b6   4b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c455ba   4ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c455c1   4c1  448b7dd8             movl r15,[rbp-0x28]
0x19b556c455c5   4c5  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c455cd   4cd  8b4db8               movl rcx,[rbp-0x48]
0x19b556c455d0   4d0  8b55c0               movl rdx,[rbp-0x40]
0x19b556c455d3   4d3  8b5da0               movl rbx,[rbp-0x60]
0x19b556c455d6   4d6  8b45a8               movl rax,[rbp-0x58]
0x19b556c455d9   4d9  448b75b0             movl r14,[rbp-0x50]
0x19b556c455dd   4dd  8d7201               leal rsi,[rdx+0x1]
0x19b556c455e0   4e0  4389742344           movl [r11+r12*1+0x44],rsi
0x19b556c455e5   4e5  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x19b556c455ea   4ea  8d1497               leal rdx,[rdi+rdx*4]
0x19b556c455ed   4ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x19b556c455f3   4f3  8bd6                 movl rdx,rsi
0x19b556c455f5   4f5  e946ffffff           jmp 0x19b556c45540  <+0x440>
0x19b556c455fa   4fa  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x19b556c45603   503  478b742320           movl r14,[r11+r12*1+0x20]
0x19b556c45608   508  438b44231c           movl rax,[r11+r12*1+0x1c]
0x19b556c4560d   50d  418d5f48             leal rbx,[r15+0x48]
0x19b556c45611   511  4c8975a0             REX.W movq [rbp-0x60],r14
0x19b556c45615   515  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x19b556c4561c   51c  48895db8             REX.W movq [rbp-0x48],rbx
0x19b556c45620   520  8b4d98               movl rcx,[rbp-0x68]
0x19b556c45623   523  33d2                 xorl rdx,rdx
0x19b556c45625   525  660f1f840000000000   nop
0x19b556c4562e   52e  660f1f840000000000   nop
0x19b556c45637   537  660f1f840000000000   nop
0x19b556c45640   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c45644   544  0f868a200000         jna 0x19b556c476d4  <+0x25d4>
0x19b556c4564a   54a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x19b556c45650   550  0f841f000000         jz 0x19b556c45675  <+0x575>
0x19b556c45656   556  418b340b             movl rsi,[r11+rcx*1]
0x19b556c4565a   55a  83c104               addl rcx,0x4
0x19b556c4565d   55d  443bf6               cmpl r14,rsi
0x19b556c45660   560  76de                 jna 0x19b556c45640  <+0x540>
0x19b556c45662   562  8d34b0               leal rsi,[rax+rsi*4]
0x19b556c45665   565  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x19b556c4566b   56b  be01000000           movl rsi,0x1
0x19b556c45670   570  e908000000           jmp 0x19b556c4567d  <+0x57d>
0x19b556c45675   575  33f6                 xorl rsi,rsi
0x19b556c45677   577  8b8d78ffffff         movl rcx,[rbp-0x88]
0x19b556c4567d   57d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c45685   585  48894da8             REX.W movq [rbp-0x58],rcx
0x19b556c45689   589  83fe01               cmpl rsi,0x1
0x19b556c4568c   58c  0f856b000000         jnz 0x19b556c456fd  <+0x5fd>
0x19b556c45692   592  438b742348           movl rsi,[r11+r12*1+0x48]
0x19b556c45697   597  4339542348           cmpl [r11+r12*1+0x48],rdx
0x19b556c4569c   59c  0f853e000000         jnz 0x19b556c456e0  <+0x5e0>
0x19b556c456a2   5a2  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c456a6   5a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c456aa   5aa  8bc3                 movl rax,rbx
0x19b556c456ac   5ac  b901000000           movl rcx,0x1
0x19b556c456b1   5b1  e84a66f2ff           call 0x19b556b6bd00  (jump table)
0x19b556c456b6   5b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c456ba   5ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c456c1   5c1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c456c9   5c9  448b7dd8             movl r15,[rbp-0x28]
0x19b556c456cd   5cd  8b4da8               movl rcx,[rbp-0x58]
0x19b556c456d0   5d0  8b55c0               movl rdx,[rbp-0x40]
0x19b556c456d3   5d3  8b5db8               movl rbx,[rbp-0x48]
0x19b556c456d6   5d6  8b8560ffffff         movl rax,[rbp-0xa0]
0x19b556c456dc   5dc  448b75a0             movl r14,[rbp-0x60]
0x19b556c456e0   5e0  8d7201               leal rsi,[rdx+0x1]
0x19b556c456e3   5e3  4389742350           movl [r11+r12*1+0x50],rsi
0x19b556c456e8   5e8  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x19b556c456ed   5ed  8d1497               leal rdx,[rdi+rdx*4]
0x19b556c456f0   5f0  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x19b556c456f6   5f6  8bd6                 movl rdx,rsi
0x19b556c456f8   5f8  e943ffffff           jmp 0x19b556c45640  <+0x540>
0x19b556c456fd   5fd  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x19b556c45706   606  478b74232c           movl r14,[r11+r12*1+0x2c]
0x19b556c4570b   60b  438b442328           movl rax,[r11+r12*1+0x28]
0x19b556c45710   610  4183c754             addl r15,0x54
0x19b556c45714   614  4c8975b0             REX.W movq [rbp-0x50],r14
0x19b556c45718   618  488945b8             REX.W movq [rbp-0x48],rax
0x19b556c4571c   61c  4c897dd8             REX.W movq [rbp-0x28],r15
0x19b556c45720   620  33d2                 xorl rdx,rdx
0x19b556c45722   622  8b5d98               movl rbx,[rbp-0x68]
0x19b556c45725   625  660f1f840000000000   nop
0x19b556c4572e   62e  660f1f840000000000   nop
0x19b556c45737   637  660f1f840000000000   nop
0x19b556c45740   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c45744   644  0f86ce1f0000         jna 0x19b556c47718  <+0x2618>
0x19b556c4574a   64a  3b9d78ffffff         cmpl rbx,[rbp-0x88]
0x19b556c45750   650  0f841f000000         jz 0x19b556c45775  <+0x675>
0x19b556c45756   656  418b0c1b             movl rcx,[r11+rbx*1]
0x19b556c4575a   65a  83c304               addl rbx,0x4
0x19b556c4575d   65d  443bf1               cmpl r14,rcx
0x19b556c45760   660  76de                 jna 0x19b556c45740  <+0x640>
0x19b556c45762   662  8d0c88               leal rcx,[rax+rcx*4]
0x19b556c45765   665  c4c17a101c0b         vmovss xmm3,[r11+rcx*1]
0x19b556c4576b   66b  b901000000           movl rcx,0x1
0x19b556c45770   670  e908000000           jmp 0x19b556c4577d  <+0x67d>
0x19b556c45775   675  33c9                 xorl rcx,rcx
0x19b556c45777   677  8b9d78ffffff         movl rbx,[rbp-0x88]
0x19b556c4577d   67d  48895d98             REX.W movq [rbp-0x68],rbx
0x19b556c45781   681  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c45789   689  83f901               cmpl rcx,0x1
0x19b556c4578c   68c  0f8566000000         jnz 0x19b556c457f8  <+0x6f8>
0x19b556c45792   692  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x19b556c45797   697  4339542354           cmpl [r11+r12*1+0x54],rdx
0x19b556c4579c   69c  0f8539000000         jnz 0x19b556c457db  <+0x6db>
0x19b556c457a2   6a2  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c457a6   6a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c457aa   6aa  418bc7               movl rax,r15
0x19b556c457ad   6ad  b901000000           movl rcx,0x1
0x19b556c457b2   6b2  e84965f2ff           call 0x19b556b6bd00  (jump table)
0x19b556c457b7   6b7  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c457bb   6bb  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c457c2   6c2  8b55c0               movl rdx,[rbp-0x40]
0x19b556c457c5   6c5  8b5d98               movl rbx,[rbp-0x68]
0x19b556c457c8   6c8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c457d0   6d0  448b7dd8             movl r15,[rbp-0x28]
0x19b556c457d4   6d4  8b45b8               movl rax,[rbp-0x48]
0x19b556c457d7   6d7  448b75b0             movl r14,[rbp-0x50]
0x19b556c457db   6db  8d4a01               leal rcx,[rdx+0x1]
0x19b556c457de   6de  43894c235c           movl [r11+r12*1+0x5c],rcx
0x19b556c457e3   6e3  438b742358           movl rsi,[r11+r12*1+0x58]
0x19b556c457e8   6e8  8d1496               leal rdx,[rsi+rdx*4]
0x19b556c457eb   6eb  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x19b556c457f1   6f1  8bd1                 movl rdx,rcx
0x19b556c457f3   6f3  e948ffffff           jmp 0x19b556c45740  <+0x640>
0x19b556c457f8   6f8  478b7c2338           movl r15,[r11+r12*1+0x38]
0x19b556c457fd   6fd  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x19b556c45804   704  c4817a6f1c23         vmovdqu xmm3,[r11+r12*1]
0x19b556c4580a   70a  c4817a7f5c2330       vmovdqu [r11+r12*1+0x30],xmm3
0x19b556c45811   711  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x19b556c45817   717  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x19b556c4581e   71e  c4817a6f642310       vmovdqu xmm4,[r11+r12*1+0x10]
0x19b556c45825   725  c4817a7f642340       vmovdqu [r11+r12*1+0x40],xmm4
0x19b556c4582c   72c  478b742310           movl r14,[r11+r12*1+0x10]
0x19b556c45831   731  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x19b556c45838   738  4b8b442354           REX.W movq rax,[r11+r12*1+0x54]
0x19b556c4583d   73d  438b5c2350           movl rbx,[r11+r12*1+0x50]
0x19b556c45842   742  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x19b556c45849   749  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x19b556c45850   750  438954232c           movl [r11+r12*1+0x2c],rdx
0x19b556c45855   755  438b542320           movl rdx,[r11+r12*1+0x20]
0x19b556c4585a   75a  43895c2320           movl [r11+r12*1+0x20],rbx
0x19b556c4585f   75f  4b89442324           REX.W movq [r11+r12*1+0x24],rax
0x19b556c45864   764  4c897dd8             REX.W movq [rbp-0x28],r15
0x19b556c45868   768  4c8975b0             REX.W movq [rbp-0x50],r14
0x19b556c4586c   76c  4585ff               testl r15,r15
0x19b556c4586f   76f  0f8516000000         jnz 0x19b556c4588b  <+0x78b>
0x19b556c45875   775  8b5de0               movl rbx,[rbp-0x20]
0x19b556c45878   778  448d9b00020000       leal r11,[rbx+0x200]
0x19b556c4587f   77f  488b45e8             REX.W movq rax,[rbp-0x18]
0x19b556c45883   783  448918               movl [rax],r11
0x19b556c45886   786  488be5               REX.W movq rsp,rbp
0x19b556c45889   789  5d                   pop rbp
0x19b556c4588a   78a  c3                   retl
0x19b556c4588b   78b  c4e37916c002         vpextrd rax,xmm0,0x2
0x19b556c45891   791  c4e37916e303         vpextrd rbx,xmm4,0x3
0x19b556c45897   797  c4e37916d901         vpextrd rcx,xmm3,0x1
0x19b556c4589d   79d  c4e37916c603         vpextrd rsi,xmm0,0x3
0x19b556c458a3   7a3  c4e37916e701         vpextrd rdi,xmm4,0x1
0x19b556c458a9   7a9  c4c37916d802         vpextrd r8,xmm3,0x2
0x19b556c458af   7af  458bc8               movl r9,r8
0x19b556c458b2   7b2  413bf8               cmpl rdi,r8
0x19b556c458b5   7b5  440f42cf             cmovcl r9,rdi
0x19b556c458b9   7b9  418bf9               movl rdi,r9
0x19b556c458bc   7bc  413bd1               cmpl rdx,r9
0x19b556c458bf   7bf  0f42fa               cmovcl rdi,rdx
0x19b556c458c2   7c2  8bd7                 movl rdx,rdi
0x19b556c458c4   7c4  3bf7                 cmpl rsi,rdi
0x19b556c458c6   7c6  0f42d6               cmovcl rdx,rsi
0x19b556c458c9   7c9  c4817a108423a4000000 vmovss xmm0,[r11+r12*1+0xa4]
0x19b556c458d3   7d3  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x19b556c458d7   7d7  c4e27918d8           vbroadcastss xmm3,xmm0
0x19b556c458dc   7dc  c5fb1065d0           vmovsd xmm4,[rbp-0x30]
0x19b556c458e1   7e1  c5da59e4             vmulss xmm4,xmm4,xmm4
0x19b556c458e5   7e5  c4e27918ec           vbroadcastss xmm5,xmm4
0x19b556c458ea   7ea  488945c0             REX.W movq [rbp-0x40],rax
0x19b556c458ee   7ee  48895db8             REX.W movq [rbp-0x48],rbx
0x19b556c458f2   7f2  48894da8             REX.W movq [rbp-0x58],rcx
0x19b556c458f6   7f6  488955a0             REX.W movq [rbp-0x60],rdx
0x19b556c458fa   7fa  c5fb118508ffffff     vmovsd [rbp-0xf8],xmm0
0x19b556c45902   802  c5f8119d60feffff     vmovups [rbp-0x1a0],xmm3
0x19b556c4590a   80a  c5fb11a510ffffff     vmovsd [rbp-0xf0],xmm4
0x19b556c45912   812  c5f811ad70feffff     vmovups [rbp-0x190],xmm5
0x19b556c4591a   81a  33ff                 xorl rdi,rdi
0x19b556c4591c   81c  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x19b556c45921   821  c4c13972f019         vpslld xmm8,xmm8,25
0x19b556c45927   827  c4c13972d002         vpsrld xmm8,xmm8,2
0x19b556c4592d   82d  c5c857f6             vxorps xmm6,xmm6,xmm6
0x19b556c45931   831  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x19b556c45939   839  488bf7               REX.W movq rsi,rdi
0x19b556c4593c   83c  0f1f4000             nop
0x19b556c45940   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c45944   844  0f860c1e0000         jna 0x19b556c47756  <+0x2656>
0x19b556c4594a   84a  478b442308           movl r8,[r11+r12*1+0x8]
0x19b556c4594f   84f  4c8985d0fdffff       REX.W movq [rbp-0x230],r8
0x19b556c45956   856  443bc6               cmpl r8,rsi
0x19b556c45959   859  0f86581c0000         jna 0x19b556c475b7  <+0x24b7>
0x19b556c4595f   85f  478b4c2314           movl r9,[r11+r12*1+0x14]
0x19b556c45964   864  4c898d80fcffff       REX.W movq [rbp-0x380],r9
0x19b556c4596b   86b  443bce               cmpl r9,rsi
0x19b556c4596e   86e  0f86431c0000         jna 0x19b556c475b7  <+0x24b7>
0x19b556c45974   874  478b7c2320           movl r15,[r11+r12*1+0x20]
0x19b556c45979   879  4c89bd78fcffff       REX.W movq [rbp-0x388],r15
0x19b556c45980   880  443bfe               cmpl r15,rsi
0x19b556c45983   883  0f862e1c0000         jna 0x19b556c475b7  <+0x24b7>
0x19b556c45989   889  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x19b556c4598e   88e  4c89bd88fcffff       REX.W movq [rbp-0x378],r15
0x19b556c45995   895  443bfe               cmpl r15,rsi
0x19b556c45998   898  0f86191c0000         jna 0x19b556c475b7  <+0x24b7>
0x19b556c4599e   89e  478b7c2304           movl r15,[r11+r12*1+0x4]
0x19b556c459a3   8a3  458d34b7             leal r14,[r15+rsi*4]
0x19b556c459a7   8a7  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x19b556c459ad   8ad  478b742310           movl r14,[r11+r12*1+0x10]
0x19b556c459b2   8b2  4c89bd90feffff       REX.W movq [rbp-0x170],r15
0x19b556c459b9   8b9  458d3cb6             leal r15,[r14+rsi*4]
0x19b556c459bd   8bd  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x19b556c459c3   8c3  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x19b556c459c8   8c8  4c89b5f0fdffff       REX.W movq [rbp-0x210],r14
0x19b556c459cf   8cf  458d34b7             leal r14,[r15+rsi*4]
0x19b556c459d3   8d3  c4017a101c33         vmovss xmm11,[r11+r14*1]
0x19b556c459d9   8d9  478b742328           movl r14,[r11+r12*1+0x28]
0x19b556c459de   8de  4c89bde0fdffff       REX.W movq [rbp-0x220],r15
0x19b556c459e5   8e5  458d3cb6             leal r15,[r14+rsi*4]
0x19b556c459e9   8e9  4c89b5e8fdffff       REX.W movq [rbp-0x218],r14
0x19b556c459f0   8f0  c4017a10243b         vmovss xmm12,[r11+r15*1]
0x19b556c459f6   8f6  448b75e0             movl r14,[rbp-0x20]
0x19b556c459fa   8fa  c4017a1164330c       vmovss [r11+r14*1+0xc],xmm12
0x19b556c45a01   901  c4017a115c3308       vmovss [r11+r14*1+0x8],xmm11
0x19b556c45a08   908  c4017a11543304       vmovss [r11+r14*1+0x4],xmm10
0x19b556c45a0f   90f  c4017a110c33         vmovss [r11+r14*1],xmm9
0x19b556c45a15   915  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x19b556c45a1e   91e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x19b556c45a27   927  c44121efdb           vpxor xmm11,xmm11,xmm11
0x19b556c45a2c   92c  c4017a7f5c3310       vmovdqu [r11+r14*1+0x10],xmm11
0x19b556c45a33   933  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x19b556c45a3b   93b  4c89bd50fcffff       REX.W movq [rbp-0x3b0],r15
0x19b556c45a42   942  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x19b556c45a4a   94a  c4017a109c2384000000 vmovss xmm11,[r11+r12*1+0x84]
0x19b556c45a54   954  458d5e40             leal r11,[r14+0x40]
0x19b556c45a58   958  4989e2               REX.W movq r10,rsp
0x19b556c45a5b   95b  4883ec08             REX.W subq rsp,0x8
0x19b556c45a5f   95f  4883e4f0             REX.W andq rsp,0xf0
0x19b556c45a63   963  4c891424             REX.W movq [rsp],r10
0x19b556c45a67   967  488975d0             REX.W movq [rbp-0x30],rsi
0x19b556c45a6b   96b  c57b118df8feffff     vmovsd [rbp-0x108],xmm9
0x19b556c45a73   973  c57b119500ffffff     vmovsd [rbp-0x100],xmm10
0x19b556c45a7b   97b  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x19b556c45a82   982  c57b119d78ffffff     vmovsd [rbp-0x88],xmm11
0x19b556c45a8a   98a  4c895d98             REX.W movq [rbp-0x68],r11
0x19b556c45a8e   98e  488bf7               REX.W movq rsi,rdi
0x19b556c45a91   991  488bcf               REX.W movq rcx,rdi
0x19b556c45a94   994  488b7df0             REX.W movq rdi,[rbp-0x10]
0x19b556c45a98   998  418bd3               movl rdx,r11
0x19b556c45a9b   99b  41b8c0010000         movl r8,0x1c0
0x19b556c45aa1   9a1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x19b556c45aab   9ab  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x19b556c45ab2   9b2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x19b556c45ab9   9b9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x19b556c45ac0   9c0  ffd0                 call rax
0x19b556c45ac2   9c2  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x19b556c45acd   9cd  488b2424             REX.W movq rsp,[rsp]
0x19b556c45ad1   9d1  85c0                 testl rax,rax
0x19b556c45ad3   9d3  0f84221f0000         jz 0x19b556c479fb  <+0x28fb>
0x19b556c45ad9   9d9  4533db               xorl r11,r11
0x19b556c45adc   9dc  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x19b556c45ae3   9e3  410f95c3             setnzl r11l
0x19b556c45ae7   9e7  448ba568ffffff       movl r12,[rbp-0x98]
0x19b556c45aee   9ee  452be3               subl r12,r11
0x19b556c45af1   9f1  c5fb108500ffffff     vmovsd xmm0,[rbp-0x100]
0x19b556c45af9   9f9  c5fa599d78ffffff     vmulss xmm3,xmm0,[rbp-0x88]
0x19b556c45b01   a01  c5f82edb             vucomiss xmm3,xmm3
0x19b556c45b05   a05  7a06                 jpe 0x19b556c45b0d  <+0xa0d>
0x19b556c45b07   a07  0f8404000000         jz 0x19b556c45b11  <+0xa11>
0x19b556c45b0d   a0d  c5e057db             vxorps xmm3,xmm3,xmm3
0x19b556c45b11   a11  c5d857e4             vxorps xmm4,xmm4,xmm4
0x19b556c45b15   a15  c5f82edc             vucomiss xmm3,xmm4
0x19b556c45b19   a19  0f8704000000         ja 0x19b556c45b23  <+0xa23>
0x19b556c45b1f   a1f  c5f928dc             vmovapd xmm3,xmm4
0x19b556c45b23   a23  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x19b556c45b29   a29  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x19b556c45b2d   a2d  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x19b556c45b33   a33  c57b2cde             vcvttsd2si r11,xmm6
0x19b556c45b37   a37  4585db               testl r11,r11
0x19b556c45b3a   a3a  0f8927000000         jns 0x19b556c45b67  <+0xa67>
0x19b556c45b40   a40  4c8b150df7ffff       REX.W movq r10,[rip+0xfffff70d]
0x19b556c45b47   a47  c441f96efa           vmovq xmm15,r10
0x19b556c45b4c   a4c  c50358fe             vaddsd xmm15,xmm15,xmm6
0x19b556c45b50   a50  c4417b2cdf           vcvttsd2si r11,xmm15
0x19b556c45b55   a55  4585db               testl r11,r11
0x19b556c45b58   a58  0f8809000000         js 0x19b556c45b67  <+0xa67>
0x19b556c45b5e   a5e  41ba00000080         movl r10,0x80000000
0x19b556c45b64   a64  450bda               orl r11,r10
0x19b556c45b67   a67  458bd3               movl r10,r11
0x19b556c45b6a   a6a  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x19b556c45b6f   a6f  c5f92efe             vucomisd xmm7,xmm6
0x19b556c45b73   a73  0f8a441c0000         jpe 0x19b556c477bd  <+0x26bd>
0x19b556c45b79   a79  0f853e1c0000         jnz 0x19b556c477bd  <+0x26bd>
0x19b556c45b7f   a7f  458bfb               movl r15,r11
0x19b556c45b82   a82  453be3               cmpl r12,r11
0x19b556c45b85   a85  450f42fc             cmovcl r15,r12
0x19b556c45b89   a89  41ba0000804f         movl r10,0x4f800000
0x19b556c45b8f   a8f  c4c1796eea           vmovd xmm5,r10
0x19b556c45b94   a94  4533db               xorl r11,r11
0x19b556c45b97   a97  c5f82eeb             vucomiss xmm5,xmm3
0x19b556c45b9b   a9b  450f47df             cmoval r11,r15
0x19b556c45b9f   a9f  4533ff               xorl r15,r15
0x19b556c45ba2   aa2  4585db               testl r11,r11
0x19b556c45ba5   aa5  410f95c7             setnzl r15l
0x19b556c45ba9   aa9  458bf3               movl r14,r11
0x19b556c45bac   aac  452bf7               subl r14,r15
0x19b556c45baf   aaf  4183c301             addl r11,0x1
0x19b556c45bb3   ab3  458bfb               movl r15,r11
0x19b556c45bb6   ab6  453be3               cmpl r12,r11
0x19b556c45bb9   ab9  450f42fc             cmovcl r15,r12
0x19b556c45bbd   abd  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x19b556c45bc4   ac4  453bfe               cmpl r15,r14
0x19b556c45bc7   ac7  0f828c180000         jc 0x19b556c47459  <+0x2359>
0x19b556c45bcd   acd  4533db               xorl r11,r11
0x19b556c45bd0   ad0  83bd50fcffff00       cmpl [rbp-0x3b0],0x0
0x19b556c45bd7   ad7  410f95c3             setnzl r11l
0x19b556c45bdb   adb  448ba550fcffff       movl r12,[rbp-0x3b0]
0x19b556c45be2   ae2  452be3               subl r12,r11
0x19b556c45be5   ae5  c5fb109d78ffffff     vmovsd xmm3,[rbp-0x88]
0x19b556c45bed   aed  c5e2599df8feffff     vmulss xmm3,xmm3,[rbp-0x108]
0x19b556c45bf5   af5  c5f82edb             vucomiss xmm3,xmm3
0x19b556c45bf9   af9  7a06                 jpe 0x19b556c45c01  <+0xb01>
0x19b556c45bfb   afb  0f8404000000         jz 0x19b556c45c05  <+0xb05>
0x19b556c45c01   b01  c5f928dc             vmovapd xmm3,xmm4
0x19b556c45c05   b05  c5f82edc             vucomiss xmm3,xmm4
0x19b556c45c09   b09  0f8704000000         ja 0x19b556c45c13  <+0xb13>
0x19b556c45c0f   b0f  c5f928dc             vmovapd xmm3,xmm4
0x19b556c45c13   b13  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x19b556c45c19   b19  c5e25af3             vcvtss2sd xmm6,xmm3,xmm3
0x19b556c45c1d   b1d  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x19b556c45c23   b23  c57b2cdf             vcvttsd2si r11,xmm7
0x19b556c45c27   b27  4585db               testl r11,r11
0x19b556c45c2a   b2a  0f8927000000         jns 0x19b556c45c57  <+0xb57>
0x19b556c45c30   b30  4c8b151df6ffff       REX.W movq r10,[rip+0xfffff61d]
0x19b556c45c37   b37  c441f96efa           vmovq xmm15,r10
0x19b556c45c3c   b3c  c50358ff             vaddsd xmm15,xmm15,xmm7
0x19b556c45c40   b40  c4417b2cdf           vcvttsd2si r11,xmm15
0x19b556c45c45   b45  4585db               testl r11,r11
0x19b556c45c48   b48  0f8809000000         js 0x19b556c45c57  <+0xb57>
0x19b556c45c4e   b4e  41ba00000080         movl r10,0x80000000
0x19b556c45c54   b54  450bda               orl r11,r10
0x19b556c45c57   b57  458bd3               movl r10,r11
0x19b556c45c5a   b5a  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x19b556c45c5f   b5f  c5792ec7             vucomisd xmm8,xmm7
0x19b556c45c63   b63  0f8a771b0000         jpe 0x19b556c477e0  <+0x26e0>
0x19b556c45c69   b69  0f85711b0000         jnz 0x19b556c477e0  <+0x26e0>
0x19b556c45c6f   b6f  418bc3               movl rax,r11
0x19b556c45c72   b72  453be3               cmpl r12,r11
0x19b556c45c75   b75  410f42c4             cmovcl rax,r12
0x19b556c45c79   b79  4533db               xorl r11,r11
0x19b556c45c7c   b7c  c5f82eeb             vucomiss xmm5,xmm3
0x19b556c45c80   b80  440f47d8             cmoval r11,rax
0x19b556c45c84   b84  33c0                 xorl rax,rax
0x19b556c45c86   b86  4585db               testl r11,r11
0x19b556c45c89   b89  0f95c0               setnzl al
0x19b556c45c8c   b8c  418bdb               movl rbx,r11
0x19b556c45c8f   b8f  2bd8                 subl rbx,rax
0x19b556c45c91   b91  8b9578fcffff         movl rdx,[rbp-0x388]
0x19b556c45c97   b97  8b8588fcffff         movl rax,[rbp-0x378]
0x19b556c45c9d   b9d  3b9588fcffff         cmpl rdx,[rbp-0x378]
0x19b556c45ca3   ba3  0f42c2               cmovcl rax,rdx
0x19b556c45ca6   ba6  8bb580fcffff         movl rsi,[rbp-0x380]
0x19b556c45cac   bac  8bc8                 movl rcx,rax
0x19b556c45cae   bae  3bf0                 cmpl rsi,rax
0x19b556c45cb0   bb0  0f42ce               cmovcl rcx,rsi
0x19b556c45cb3   bb3  4183c301             addl r11,0x1
0x19b556c45cb7   bb7  418bc3               movl rax,r11
0x19b556c45cba   bba  453be3               cmpl r12,r11
0x19b556c45cbd   bbd  410f42c4             cmovcl rax,r12
0x19b556c45cc1   bc1  448d5801             leal r11,[rax+0x1]
0x19b556c45cc5   bc5  c5fb109df8feffff     vmovsd xmm3,[rbp-0x108]
0x19b556c45ccd   bcd  c4e27918eb           vbroadcastss xmm5,xmm3
0x19b556c45cd2   bd2  c4e27918f0           vbroadcastss xmm6,xmm0
0x19b556c45cd7   bd7  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x19b556c45cde   bde  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x19b556c45ce2   be2  418b7c0464           movl rdi,[r12+rax*1+0x64]
0x19b556c45ce7   be7  458b440468           movl r8,[r12+rax*1+0x68]
0x19b556c45cec   bec  448b4de0             movl r9,[rbp-0x20]
0x19b556c45cf0   bf0  c4817a6fbc0c70010000 vmovdqu xmm7,[r12+r9*1+0x170]
0x19b556c45cfa   bfa  c4017a6f840c30010000 vmovdqu xmm8,[r12+r9*1+0x130]
0x19b556c45d04   c04  c4017a6f8c0cf0000000 vmovdqu xmm9,[r12+r9*1+0xf0]
0x19b556c45d0e   c0e  c4017a6f940cb0000000 vmovdqu xmm10,[r12+r9*1+0xb0]
0x19b556c45d18   c18  c4017a6f5c0c70       vmovdqu xmm11,[r12+r9*1+0x70]
0x19b556c45d1f   c1f  c4017a6fa40cf0010000 vmovdqu xmm12,[r12+r9*1+0x1f0]
0x19b556c45d29   c29  c4017a6fac0cb0010000 vmovdqu xmm13,[r12+r9*1+0x1b0]
0x19b556c45d33   c33  c4017a6fb40c60010000 vmovdqu xmm14,[r12+r9*1+0x160]
0x19b556c45d3d   c3d  c4817a6f8c0c20010000 vmovdqu xmm1,[r12+r9*1+0x120]
0x19b556c45d47   c47  c4817a6f940ce0000000 vmovdqu xmm2,[r12+r9*1+0xe0]
0x19b556c45d51   c51  c4817a6f840ca0000000 vmovdqu xmm0,[r12+r9*1+0xa0]
0x19b556c45d5b   c5b  c4817a6f5c0c60       vmovdqu xmm3,[r12+r9*1+0x60]
0x19b556c45d62   c62  c5f811ad50feffff     vmovups [rbp-0x1b0],xmm5
0x19b556c45d6a   c6a  c4817a6fac0ce0010000 vmovdqu xmm5,[r12+r9*1+0x1e0]
0x19b556c45d74   c74  c5f811b520feffff     vmovups [rbp-0x1e0],xmm6
0x19b556c45d7c   c7c  c4817a6fb40ca0010000 vmovdqu xmm6,[r12+r9*1+0x1a0]
0x19b556c45d86   c86  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x19b556c45d8e   c8e  c4817a6f840c50010000 vmovdqu xmm0,[r12+r9*1+0x150]
0x19b556c45d98   c98  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x19b556c45da0   ca0  c4817a6f840c10010000 vmovdqu xmm0,[r12+r9*1+0x110]
0x19b556c45daa   caa  c5f81185b0feffff     vmovups [rbp-0x150],xmm0
0x19b556c45db2   cb2  c4817a6f840cd0000000 vmovdqu xmm0,[r12+r9*1+0xd0]
0x19b556c45dbc   cbc  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x19b556c45dc4   cc4  c4817a6f840c90000000 vmovdqu xmm0,[r12+r9*1+0x90]
0x19b556c45dce   cce  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x19b556c45dd6   cd6  c4817a6f440c50       vmovdqu xmm0,[r12+r9*1+0x50]
0x19b556c45ddd   cdd  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x19b556c45de5   ce5  c4817a6f840cd0010000 vmovdqu xmm0,[r12+r9*1+0x1d0]
0x19b556c45def   cef  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x19b556c45df7   cf7  c4817a6f840c90010000 vmovdqu xmm0,[r12+r9*1+0x190]
0x19b556c45e01   d01  c5f81185d0fbffff     vmovups [rbp-0x430],xmm0
0x19b556c45e09   d09  c4817a6f840c40010000 vmovdqu xmm0,[r12+r9*1+0x140]
0x19b556c45e13   d13  c5f81185e0fbffff     vmovups [rbp-0x420],xmm0
0x19b556c45e1b   d1b  c4817a6f840c00010000 vmovdqu xmm0,[r12+r9*1+0x100]
0x19b556c45e25   d25  c5f81185f0fbffff     vmovups [rbp-0x410],xmm0
0x19b556c45e2d   d2d  c4817a6f840cc0000000 vmovdqu xmm0,[r12+r9*1+0xc0]
0x19b556c45e37   d37  c5f8118500fcffff     vmovups [rbp-0x400],xmm0
0x19b556c45e3f   d3f  c4817a6f840c80000000 vmovdqu xmm0,[r12+r9*1+0x80]
0x19b556c45e49   d49  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x19b556c45e51   d51  c4817a6f440c40       vmovdqu xmm0,[r12+r9*1+0x40]
0x19b556c45e58   d58  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x19b556c45e60   d60  c4817a6f840cc0010000 vmovdqu xmm0,[r12+r9*1+0x1c0]
0x19b556c45e6a   d6a  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x19b556c45e72   d72  c4817a6f840c80010000 vmovdqu xmm0,[r12+r9*1+0x180]
0x19b556c45e7c   d7c  48899d58fcffff       REX.W movq [rbp-0x3a8],rbx
0x19b556c45e83   d83  48898dd8fdffff       REX.W movq [rbp-0x228],rcx
0x19b556c45e8a   d8a  4c899d60fcffff       REX.W movq [rbp-0x3a0],r11
0x19b556c45e91   d91  4889bd70fcffff       REX.W movq [rbp-0x390],rdi
0x19b556c45e98   d98  4c898568fcffff       REX.W movq [rbp-0x398],r8
0x19b556c45e9f   d9f  c57810bd40fcffff     vmovups xmm15,[rbp-0x3c0]
0x19b556c45ea7   da7  c57811bd50ffffff     vmovups [rbp-0xb0],xmm15
0x19b556c45eaf   daf  c5fb11a568ffffff     vmovsd [rbp-0x98],xmm4
0x19b556c45eb7   db7  c5fb11a560ffffff     vmovsd [rbp-0xa0],xmm4
0x19b556c45ebf   dbf  c5fb11a540ffffff     vmovsd [rbp-0xc0],xmm4
0x19b556c45ec7   dc7  c5fb11a538ffffff     vmovsd [rbp-0xc8],xmm4
0x19b556c45ecf   dcf  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x19b556c45ed7   dd7  c57928c8             vmovapd xmm9,xmm0
0x19b556c45edb   ddb  33c0                 xorl rax,rax
0x19b556c45edd   ddd  8b8dd0fdffff         movl rcx,[rbp-0x230]
0x19b556c45ee3   de3  c5fb11a530ffffff     vmovsd [rbp-0xd0],xmm4
0x19b556c45eeb   deb  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x19b556c45ef3   df3  c578118500fdffff     vmovups [rbp-0x300],xmm8
0x19b556c45efb   dfb  c578119520fdffff     vmovups [rbp-0x2e0],xmm10
0x19b556c45f03   e03  c5f811b5b0fdffff     vmovups [rbp-0x250],xmm6
0x19b556c45f0b   e0b  c5f811ada0fdffff     vmovups [rbp-0x260],xmm5
0x19b556c45f13   e13  c5f8119d90fdffff     vmovups [rbp-0x270],xmm3
0x19b556c45f1b   e1b  c5f8119580fdffff     vmovups [rbp-0x280],xmm2
0x19b556c45f23   e23  c5f8118d70fdffff     vmovups [rbp-0x290],xmm1
0x19b556c45f2b   e2b  c57811b560fdffff     vmovups [rbp-0x2a0],xmm14
0x19b556c45f33   e33  c57811ad50fdffff     vmovups [rbp-0x2b0],xmm13
0x19b556c45f3b   e3b  c57811a540fdffff     vmovups [rbp-0x2c0],xmm12
0x19b556c45f43   e43  c578119d30fdffff     vmovups [rbp-0x2d0],xmm11
0x19b556c45f4b   e4b  e981000000           jmp 0x19b556c45fd1  <+0xed1>
0x19b556c45f50   e50  660f1f840000000000   nop
0x19b556c45f59   e59  660f1f840000000000   nop
0x19b556c45f62   e62  660f1f840000000000   nop
0x19b556c45f6b   e6b  660f1f840000000000   nop
0x19b556c45f74   e74  660f1f840000000000   nop
0x19b556c45f7d   e7d  0f1f00               nop
0x19b556c45f80   e80  8b9d58fcffff         movl rbx,[rbp-0x3a8]
0x19b556c45f86   e86  458bf3               movl r14,r11
0x19b556c45f89   e89  448b9d60fcffff       movl r11,[rbp-0x3a0]
0x19b556c45f90   e90  448b8568fcffff       movl r8,[rbp-0x398]
0x19b556c45f97   e97  8bbd70fcffff         movl rdi,[rbp-0x390]
0x19b556c45f9d   e9d  8b9578fcffff         movl rdx,[rbp-0x388]
0x19b556c45fa3   ea3  c578108dc0fdffff     vmovups xmm9,[rbp-0x240]
0x19b556c45fab   eab  418bcf               movl rcx,r15
0x19b556c45fae   eae  4c8be6               REX.W movq r12,rsi
0x19b556c45fb1   eb1  c57811ad40fdffff     vmovups [rbp-0x2c0],xmm13
0x19b556c45fb9   eb9  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x19b556c45fc1   ec1  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x19b556c45fc9   ec9  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x19b556c45fd1   ed1  c578109530fcffff     vmovups xmm10,[rbp-0x3d0]
0x19b556c45fd9   ed9  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x19b556c45fe1   ee1  c57810a510fcffff     vmovups xmm12,[rbp-0x3f0]
0x19b556c45fe9   ee9  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x19b556c45ff1   ef1  c57810b5f0fbffff     vmovups xmm14,[rbp-0x410]
0x19b556c45ff9   ef9  c5f8108de0fbffff     vmovups xmm1,[rbp-0x420]
0x19b556c46001   f01  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x19b556c46009   f09  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x19b556c46011   f11  448bbd90feffff       movl r15,[rbp-0x170]
0x19b556c46018   f18  448b8de0fdffff       movl r9,[rbp-0x220]
0x19b556c4601f   f1f  4c89b578ffffff       REX.W movq [rbp-0x88],r14
0x19b556c46026   f26  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c4602a   f2a  0f86d3170000         jna 0x19b556c47803  <+0x2703>
0x19b556c46030   f30  8bb550fcffff         movl rsi,[rbp-0x3b0]
0x19b556c46036   f36  410faff6             imull rsi,r14
0x19b556c4603a   f3a  448d3433             leal r14,[rbx+rsi*1]
0x19b556c4603e   f3e  453bc6               cmpl r8,r14
0x19b556c46041   f41  0f8629000000         jna 0x19b556c46070  <+0xf70>
0x19b556c46047   f47  4103f3               addl rsi,r11
0x19b556c4604a   f4a  443bc6               cmpl r8,rsi
0x19b556c4604d   f4d  0f861d000000         jna 0x19b556c46070  <+0xf70>
0x19b556c46053   f53  8d34b7               leal rsi,[rdi+rsi*4]
0x19b556c46056   f56  418b3434             movl rsi,[r12+rsi*1]
0x19b556c4605a   f5a  468d34b7             leal r14,[rdi+r14*4]
0x19b556c4605e   f5e  478b3434             movl r14,[r12+r14*1]
0x19b556c46062   f62  458bd6               movl r10,r14
0x19b556c46065   f65  448bf6               movl r14,rsi
0x19b556c46068   f68  418bf2               movl rsi,r10
0x19b556c4606b   f6b  e906000000           jmp 0x19b556c46076  <+0xf76>
0x19b556c46070   f70  4c8bf0               REX.W movq r14,rax
0x19b556c46073   f73  488bf0               REX.W movq rsi,rax
0x19b556c46076   f76  458d1cb7             leal r11,[r15+rsi*4]
0x19b556c4607a   f7a  418bde               movl rbx,r14
0x19b556c4607d   f7d  2bde                 subl rbx,rsi
0x19b556c4607f   f7f  33ff                 xorl rdi,rdi
0x19b556c46081   f81  413bce               cmpl rcx,r14
0x19b556c46084   f84  400f92c7             setcl dil
0x19b556c46088   f88  4533c0               xorl r8,r8
0x19b556c4608b   f8b  443bf6               cmpl r14,rsi
0x19b556c4608e   f8e  410f92c0             setcl r8l
0x19b556c46092   f92  4c8bff               REX.W movq r15,rdi
0x19b556c46095   f95  450bf8               orl r15,r8
0x19b556c46098   f98  8bcb                 movl rcx,rbx
0x19b556c4609a   f9a  4585ff               testl r15,r15
0x19b556c4609d   f9d  0f45c8               cmovnzl rcx,rax
0x19b556c460a0   fa0  4c89b5f8fdffff       REX.W movq [rbp-0x208],r14
0x19b556c460a7   fa7  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x19b556c460ae   fae  4889bde8fcffff       REX.W movq [rbp-0x318],rdi
0x19b556c460b5   fb5  4c8985a0feffff       REX.W movq [rbp-0x160],r8
0x19b556c460bc   fbc  48898de0feffff       REX.W movq [rbp-0x120],rcx
0x19b556c460c3   fc3  443bf6               cmpl r14,rsi
0x19b556c460c6   fc6  0f82b3000000         jc 0x19b556c4617f  <+0x107f>
0x19b556c460cc   fcc  458d3cb1             leal r15,[r9+rsi*4]
0x19b556c460d0   fd0  b904000000           movl rcx,0x4
0x19b556c460d5   fd5  413bd6               cmpl rdx,r14
0x19b556c460d8   fd8  440f42f9             cmovcl r15,rcx
0x19b556c460dc   fdc  448bcb               movl r9,rbx
0x19b556c460df   fdf  413bd6               cmpl rdx,r14
0x19b556c460e2   fe2  440f42c8             cmovcl r9,rax
0x19b556c460e6   fe6  418bd1               movl rdx,r9
0x19b556c460e9   fe9  81e2f0ffff1f         andl rdx,0x1ffffff0
0x19b556c460ef   fef  418d1497             leal rdx,[r15+rdx*4]
0x19b556c460f3   ff3  448ba5f0fdffff       movl r12,[rbp-0x210]
0x19b556c460fa   ffa  458d1cb4             leal r11,[r12+rsi*4]
0x19b556c460fe   ffe  448ba580fcffff       movl r12,[rbp-0x380]
0x19b556c46105  1005  453be6               cmpl r12,r14
0x19b556c46108  1008  440f42d9             cmovcl r11,rcx
0x19b556c4610c  100c  8bfb                 movl rdi,rbx
0x19b556c4610e  100e  453be6               cmpl r12,r14
0x19b556c46111  1011  0f42f8               cmovcl rdi,rax
0x19b556c46114  1014  448be7               movl r12,rdi
0x19b556c46117  1017  4181e4f0ffff1f       andl r12,0x1ffffff0
0x19b556c4611e  101e  478d24a3             leal r12,[r11+r12*4]
0x19b556c46122  1022  458bc1               movl r8,r9
0x19b556c46125  1025  41c1e804             shrl r8, 4
0x19b556c46129  1029  4183e10f             andl r9,0xf
0x19b556c4612d  102d  4c899dd0fcffff       REX.W movq [rbp-0x330],r11
0x19b556c46134  1034  448bdf               movl r11,rdi
0x19b556c46137  1037  41c1eb04             shrl r11, 4
0x19b556c4613b  103b  83e70f               andl rdi,0xf
0x19b556c4613e  103e  4c899de0fcffff       REX.W movq [rbp-0x320],r11
0x19b556c46145  1045  448b9d88fcffff       movl r11,[rbp-0x378]
0x19b556c4614c  104c  453bde               cmpl r11,r14
0x19b556c4614f  104f  0f821c000000         jc 0x19b556c46171  <+0x1071>
0x19b556c46155  1055  448b9de8fdffff       movl r11,[rbp-0x218]
0x19b556c4615c  105c  418d34b3             leal rsi,[r11+rsi*4]
0x19b556c46160  1060  458bd7               movl r10,r15
0x19b556c46163  1063  448bfb               movl r15,rbx
0x19b556c46166  1066  418bda               movl rbx,r10
0x19b556c46169  1069  448bde               movl r11,rsi
0x19b556c4616c  106c  e939000000           jmp 0x19b556c461aa  <+0x10aa>
0x19b556c46171  1071  418bdf               movl rbx,r15
0x19b556c46174  1074  4c8bf8               REX.W movq r15,rax
0x19b556c46177  1077  4c8bd9               REX.W movq r11,rcx
0x19b556c4617a  107a  e92b000000           jmp 0x19b556c461aa  <+0x10aa>
0x19b556c4617f  107f  4c8bf8               REX.W movq r15,rax
0x19b556c46182  1082  b904000000           movl rcx,0x4
0x19b556c46187  1087  488bf8               REX.W movq rdi,rax
0x19b556c4618a  108a  488985e0fcffff       REX.W movq [rbp-0x320],rax
0x19b556c46191  1091  4c8bc8               REX.W movq r9,rax
0x19b556c46194  1094  4c8bc0               REX.W movq r8,rax
0x19b556c46197  1097  488bd1               REX.W movq rdx,rcx
0x19b556c4619a  109a  488bd9               REX.W movq rbx,rcx
0x19b556c4619d  109d  4c8bd9               REX.W movq r11,rcx
0x19b556c461a0  10a0  4c8be1               REX.W movq r12,rcx
0x19b556c461a3  10a3  48898dd0fcffff       REX.W movq [rbp-0x330],rcx
0x19b556c461aa  10aa  488bb5a0feffff       REX.W movq rsi,[rbp-0x160]
0x19b556c461b1  10b1  0bb5e8fcffff         orl rsi,[rbp-0x318]
0x19b556c461b7  10b7  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x19b556c461be  10be  448ba518ffffff       movl r12,[rbp-0xe8]
0x19b556c461c5  10c5  85f6                 testl rsi,rsi
0x19b556c461c7  10c7  440f45e1             cmovnzl r12,rcx
0x19b556c461cb  10cb  8b8de0feffff         movl rcx,[rbp-0x120]
0x19b556c461d1  10d1  83e10f               andl rcx,0xf
0x19b556c461d4  10d4  418bf7               movl rsi,r15
0x19b556c461d7  10d7  c1ee04               shrl rsi, 4
0x19b556c461da  10da  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x19b556c461e1  10e1  8b95e0feffff         movl rdx,[rbp-0x120]
0x19b556c461e7  10e7  c1ea04               shrl rdx, 4
0x19b556c461ea  10ea  4c898da8feffff       REX.W movq [rbp-0x158],r9
0x19b556c461f1  10f1  448b8de0fcffff       movl r9,[rbp-0x320]
0x19b556c461f8  10f8  4c89bd20ffffff       REX.W movq [rbp-0xe0],r15
0x19b556c461ff  10ff  448bfa               movl r15,rdx
0x19b556c46202  1102  443bca               cmpl r9,rdx
0x19b556c46205  1105  450f42f9             cmovcl r15,r9
0x19b556c46209  1109  418bd7               movl rdx,r15
0x19b556c4620c  110c  453bc7               cmpl r8,r15
0x19b556c4620f  110f  410f42d0             cmovcl rdx,r8
0x19b556c46213  1113  448bfa               movl r15,rdx
0x19b556c46216  1116  3bf2                 cmpl rsi,rdx
0x19b556c46218  1118  440f42fe             cmovcl r15,rsi
0x19b556c4621c  111c  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x19b556c46223  1123  4889bd98feffff       REX.W movq [rbp-0x168],rdi
0x19b556c4622a  112a  4c89a518ffffff       REX.W movq [rbp-0xe8],r12
0x19b556c46231  1131  4585ff               testl r15,r15
0x19b556c46234  1134  0f856b000000         jnz 0x19b556c462a5  <+0x11a5>
0x19b556c4623a  113a  c4c17928d9           vmovapd xmm3,xmm9
0x19b556c4623f  113f  c4c17928f2           vmovapd xmm6,xmm10
0x19b556c46244  1144  c4c17928c3           vmovapd xmm0,xmm11
0x19b556c46249  1149  c4417928cc           vmovapd xmm9,xmm12
0x19b556c4624e  114e  c4417928d5           vmovapd xmm10,xmm13
0x19b556c46253  1153  c4c17928e6           vmovapd xmm4,xmm14
0x19b556c46258  1158  c5f928f9             vmovapd xmm7,xmm1
0x19b556c4625c  115c  c57928c2             vmovapd xmm8,xmm2
0x19b556c46260  1160  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x19b556c46268  1168  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x19b556c46270  1170  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x19b556c46278  1178  488b75c8             REX.W movq rsi,[rbp-0x38]
0x19b556c4627c  117c  448b4de0             movl r9,[rbp-0x20]
0x19b556c46280  1180  c57810ad40fdffff     vmovups xmm13,[rbp-0x2c0]
0x19b556c46288  1188  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x19b556c46290  1190  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x19b556c46298  1198  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x19b556c462a0  11a0  e981060000           jmp 0x19b556c46926  <+0x1826>
0x19b556c462a5  11a5  c578118dc0fdffff     vmovups [rbp-0x240],xmm9
0x19b556c462ad  11ad  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x19b556c462b5  11b5  c578119d20fcffff     vmovups [rbp-0x3e0],xmm11
0x19b556c462bd  11bd  c57811a510fcffff     vmovups [rbp-0x3f0],xmm12
0x19b556c462c5  11c5  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x19b556c462cd  11cd  c57811b5f0fbffff     vmovups [rbp-0x410],xmm14
0x19b556c462d5  11d5  c5f8118de0fbffff     vmovups [rbp-0x420],xmm1
0x19b556c462dd  11dd  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x19b556c462e5  11e5  448b85d0fcffff       movl r8,[rbp-0x330]
0x19b556c462ec  11ec  488b75c8             REX.W movq rsi,[rbp-0x38]
0x19b556c462f0  11f0  448b4de0             movl r9,[rbp-0x20]
0x19b556c462f4  11f4  488bd0               REX.W movq rdx,rax
0x19b556c462f7  11f7  e962000000           jmp 0x19b556c4635e  <+0x125e>
0x19b556c462fc  11fc  0f1f4000             nop
0x19b556c46300  1200  c5f811a530fdffff     vmovups [rbp-0x2d0],xmm4
0x19b556c46308  1208  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x19b556c46310  1210  448ba518ffffff       movl r12,[rbp-0xe8]
0x19b556c46317  1217  448b9d28ffffff       movl r11,[rbp-0xd8]
0x19b556c4631e  121e  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x19b556c46326  1226  c57811a500fdffff     vmovups [rbp-0x300],xmm12
0x19b556c4632e  122e  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x19b556c46336  1236  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x19b556c4633e  123e  c5f8119d40fdffff     vmovups [rbp-0x2c0],xmm3
0x19b556c46346  1246  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x19b556c4634e  124e  c578119560fdffff     vmovups [rbp-0x2a0],xmm10
0x19b556c46356  1256  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x19b556c4635e  125e  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c46362  1262  0f866e150000         jna 0x19b556c478d6  <+0x27d6>
0x19b556c46368  1268  8d3c1a               leal rdi,[rdx+rbx*1]
0x19b556c4636b  126b  c57a6f1c3e           vmovdqu xmm11,[rsi+rdi*1]
0x19b556c46370  1270  428d041a             leal rax,[rdx+r11*1]
0x19b556c46374  1274  c57a6f1406           vmovdqu xmm10,[rsi+rax*1]
0x19b556c46379  1279  468d1c02             leal r11,[rdx+r8*1]
0x19b556c4637d  127d  c4217a6f0c1e         vmovdqu xmm9,[rsi+r11*1]
0x19b556c46383  1283  c441585ce1           vsubps xmm12,xmm4,xmm9
0x19b556c46388  1288  468d3422             leal r14,[rdx+r12*1]
0x19b556c4638c  128c  c4217a6f2c36         vmovdqu xmm13,[rsi+r14*1]
0x19b556c46392  1292  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x19b556c4639a  129a  c4c1085ccd           vsubps xmm1,xmm14,xmm13
0x19b556c4639f  129f  c5f059d1             vmulps xmm2,xmm1,xmm1
0x19b556c463a3  12a3  c4c11859c4           vmulps xmm0,xmm12,xmm12
0x19b556c463a8  12a8  c5e858c0             vaddps xmm0,xmm2,xmm0
0x19b556c463ac  12ac  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x19b556c463b4  12b4  c5f8c2da01           vcmpps xmm3,xmm0,xmm2, (lt)
0x19b556c463b9  12b9  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x19b556c463c1  12c1  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x19b556c463c5  12c5  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x19b556c463c9  12c9  c51859e3             vmulps xmm12,xmm12,xmm3
0x19b556c463cd  12cd  c5f810b530fcffff     vmovups xmm6,[rbp-0x3d0]
0x19b556c463d5  12d5  c4c14858f4           vaddps xmm6,xmm6,xmm12
0x19b556c463da  12da  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x19b556c463e4  12e4  c5f059db             vmulps xmm3,xmm1,xmm3
0x19b556c463e8  12e8  c57810a5c0fdffff     vmovups xmm12,[rbp-0x240]
0x19b556c463f0  12f0  c59858db             vaddps xmm3,xmm12,xmm3
0x19b556c463f4  12f4  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x19b556c463fe  12fe  c568c2e002           vcmpps xmm12,xmm2,xmm0, (le)
0x19b556c46403  1303  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x19b556c4640b  130b  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x19b556c46413  1313  c5f8c2d901           vcmpps xmm3,xmm0,xmm1, (lt)
0x19b556c46418  1318  c599dbdb             vpand xmm3,xmm12,xmm3
0x19b556c4641c  131c  c44119efe4           vpxor xmm12,xmm12,xmm12
0x19b556c46421  1321  c598c2c001           vcmpps xmm0,xmm12,xmm0, (lt)
0x19b556c46426  1326  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x19b556c4642a  132a  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x19b556c4642e  132e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x19b556c46432  1332  c5f8109de0fbffff     vmovups xmm3,[rbp-0x420]
0x19b556c4643a  133a  c5f858db             vaddps xmm3,xmm0,xmm3
0x19b556c4643e  133e  c4a17a7f9c0e40010000 vmovdqu [rsi+r9*1+0x140],xmm3
0x19b556c46448  1348  c52859d0             vmulps xmm10,xmm10,xmm0
0x19b556c4644c  134c  c5f8119de0fbffff     vmovups [rbp-0x420],xmm3
0x19b556c46454  1354  c5f8109df0fbffff     vmovups xmm3,[rbp-0x410]
0x19b556c4645c  135c  c5a858db             vaddps xmm3,xmm10,xmm3
0x19b556c46460  1360  c4a17a7f9c0e00010000 vmovdqu [rsi+r9*1+0x100],xmm3
0x19b556c4646a  136a  c52059d0             vmulps xmm10,xmm11,xmm0
0x19b556c4646e  136e  c578109d00fcffff     vmovups xmm11,[rbp-0x400]
0x19b556c46476  1376  c4412858d3           vaddps xmm10,xmm10,xmm11
0x19b556c4647b  137b  c4217a7f940ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm10
0x19b556c46485  1385  c53059c8             vmulps xmm9,xmm9,xmm0
0x19b556c46489  1389  c578109d10fcffff     vmovups xmm11,[rbp-0x3f0]
0x19b556c46491  1391  c4413058cb           vaddps xmm9,xmm9,xmm11
0x19b556c46496  1396  c4217a7f8c0e80000000 vmovdqu [rsi+r9*1+0x80],xmm9
0x19b556c464a0  13a0  c59059c0             vmulps xmm0,xmm13,xmm0
0x19b556c464a4  13a4  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x19b556c464ac  13ac  c5a058c0             vaddps xmm0,xmm11,xmm0
0x19b556c464b0  13b0  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x19b556c464b7  13b7  448d6710             leal r12,[rdi+0x10]
0x19b556c464bb  13bb  c4217a6f1c26         vmovdqu xmm11,[rsi+r12*1]
0x19b556c464c1  13c1  448d6010             leal r12,[rax+0x10]
0x19b556c464c5  13c5  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x19b556c464cb  13cb  458d6310             leal r12,[r11+0x10]
0x19b556c464cf  13cf  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x19b556c464d7  13d7  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x19b556c464dd  13dd  c5f8119df0fbffff     vmovups [rbp-0x410],xmm3
0x19b556c464e5  13e5  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x19b556c464e9  13e9  458d6610             leal r12,[r14+0x10]
0x19b556c464ed  13ed  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x19b556c464f5  13f5  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x19b556c464fb  13fb  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x19b556c46503  1403  c5085cce             vsubps xmm9,xmm14,xmm6
0x19b556c46507  1407  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x19b556c4650f  140f  c4413059d1           vmulps xmm10,xmm9,xmm9
0x19b556c46514  1414  c5e059fb             vmulps xmm7,xmm3,xmm3
0x19b556c46518  1418  c5a858ff             vaddps xmm7,xmm10,xmm7
0x19b556c4651c  141c  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x19b556c46521  1421  c529dbd5             vpand xmm10,xmm10,xmm5
0x19b556c46525  1425  c441785bd2           vcvtdq2ps xmm10,xmm10
0x19b556c4652a  142a  c4c16059da           vmulps xmm3,xmm3,xmm10
0x19b556c4652f  142f  c578108590fcffff     vmovups xmm8,[rbp-0x370]
0x19b556c46537  1437  c5b858db             vaddps xmm3,xmm8,xmm3
0x19b556c4653b  143b  c4a17a7f9c0ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm3
0x19b556c46545  1445  c4413059c2           vmulps xmm8,xmm9,xmm10
0x19b556c4654a  144a  c578108dd0fbffff     vmovups xmm9,[rbp-0x430]
0x19b556c46552  1452  c4413058c0           vaddps xmm8,xmm9,xmm8
0x19b556c46557  1457  c4217a7f840e90010000 vmovdqu [rsi+r9*1+0x190],xmm8
0x19b556c46561  1461  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x19b556c46566  1466  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x19b556c4656b  146b  c44131dbca           vpand xmm9,xmm9,xmm10
0x19b556c46570  1470  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x19b556c46575  1475  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x19b556c46579  1479  c5f85bff             vcvtdq2ps xmm7,xmm7
0x19b556c4657d  147d  c5b1dbff             vpand xmm7,xmm9,xmm7
0x19b556c46581  1481  c578108dc0feffff     vmovups xmm9,[rbp-0x140]
0x19b556c46589  1489  c4414058c9           vaddps xmm9,xmm7,xmm9
0x19b556c4658e  148e  c4217a7f8c0e50010000 vmovdqu [rsi+r9*1+0x150],xmm9
0x19b556c46598  1498  c51059d7             vmulps xmm10,xmm13,xmm7
0x19b556c4659c  149c  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x19b556c465a4  14a4  c4412858d5           vaddps xmm10,xmm10,xmm13
0x19b556c465a9  14a9  c4217a7f940e10010000 vmovdqu [rsi+r9*1+0x110],xmm10
0x19b556c465b3  14b3  c52059df             vmulps xmm11,xmm11,xmm7
0x19b556c465b7  14b7  c57810adc0fcffff     vmovups xmm13,[rbp-0x340]
0x19b556c465bf  14bf  c4412058dd           vaddps xmm11,xmm11,xmm13
0x19b556c465c4  14c4  c4217a7f9c0ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm11
0x19b556c465ce  14ce  c5f859c7             vmulps xmm0,xmm0,xmm7
0x19b556c465d2  14d2  c57810adb0fcffff     vmovups xmm13,[rbp-0x350]
0x19b556c465da  14da  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x19b556c465df  14df  c4a17a7f840e90000000 vmovdqu [rsi+r9*1+0x90],xmm0
0x19b556c465e9  14e9  c5c859f7             vmulps xmm6,xmm6,xmm7
0x19b556c465ed  14ed  c5f810bda0fcffff     vmovups xmm7,[rbp-0x360]
0x19b556c465f5  14f5  c5c058f6             vaddps xmm6,xmm7,xmm6
0x19b556c465f9  14f9  c4a17a7f740e50       vmovdqu [rsi+r9*1+0x50],xmm6
0x19b556c46600  1500  448d6720             leal r12,[rdi+0x20]
0x19b556c46604  1504  c4a17a6f3c26         vmovdqu xmm7,[rsi+r12*1]
0x19b556c4660a  150a  448d6020             leal r12,[rax+0x20]
0x19b556c4660e  150e  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x19b556c46614  1514  458d6320             leal r12,[r11+0x20]
0x19b556c46618  1518  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x19b556c46620  1520  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x19b556c46626  1526  c5f8119d90fcffff     vmovups [rbp-0x370],xmm3
0x19b556c4662e  152e  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x19b556c46632  1532  458d6620             leal r12,[r14+0x20]
0x19b556c46636  1536  c5f811b5a0fcffff     vmovups [rbp-0x360],xmm6
0x19b556c4663e  153e  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x19b556c46644  1544  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x19b556c4664c  154c  c5085cc6             vsubps xmm8,xmm14,xmm6
0x19b556c46650  1550  c578118dc0feffff     vmovups [rbp-0x140],xmm9
0x19b556c46658  1558  c4413859c8           vmulps xmm9,xmm8,xmm8
0x19b556c4665d  155d  c5781195b0feffff     vmovups [rbp-0x150],xmm10
0x19b556c46665  1565  c56059d3             vmulps xmm10,xmm3,xmm3
0x19b556c46669  1569  c4413058ca           vaddps xmm9,xmm9,xmm10
0x19b556c4666e  156e  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x19b556c46673  1573  c529dbd5             vpand xmm10,xmm10,xmm5
0x19b556c46677  1577  c441785bd2           vcvtdq2ps xmm10,xmm10
0x19b556c4667c  157c  c4c16059da           vmulps xmm3,xmm3,xmm10
0x19b556c46681  1581  c578119dc0fcffff     vmovups [rbp-0x340],xmm11
0x19b556c46689  1589  c578109da0fdffff     vmovups xmm11,[rbp-0x260]
0x19b556c46691  1591  c5a058db             vaddps xmm3,xmm11,xmm3
0x19b556c46695  1595  c4a17a7f9c0ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm3
0x19b556c4669f  159f  c4413859c2           vmulps xmm8,xmm8,xmm10
0x19b556c466a4  15a4  c5781095b0fdffff     vmovups xmm10,[rbp-0x250]
0x19b556c466ac  15ac  c4412858c0           vaddps xmm8,xmm10,xmm8
0x19b556c466b1  15b1  c4217a7f840ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm8
0x19b556c466bb  15bb  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x19b556c466c1  15c1  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x19b556c466c6  15c6  c44129dbd3           vpand xmm10,xmm10,xmm11
0x19b556c466cb  15cb  c44118c2c901         vcmpps xmm9,xmm12,xmm9, (lt)
0x19b556c466d1  15d1  c531dbcd             vpand xmm9,xmm9,xmm5
0x19b556c466d5  15d5  c441785bc9           vcvtdq2ps xmm9,xmm9
0x19b556c466da  15da  c44129dbc9           vpand xmm9,xmm10,xmm9
0x19b556c466df  15df  c578109560fdffff     vmovups xmm10,[rbp-0x2a0]
0x19b556c466e7  15e7  c4413058d2           vaddps xmm10,xmm9,xmm10
0x19b556c466ec  15ec  c4217a7f940e60010000 vmovdqu [rsi+r9*1+0x160],xmm10
0x19b556c466f6  15f6  c4411059d9           vmulps xmm11,xmm13,xmm9
0x19b556c466fb  15fb  c57810ad70fdffff     vmovups xmm13,[rbp-0x290]
0x19b556c46703  1603  c4412058dd           vaddps xmm11,xmm11,xmm13
0x19b556c46708  1608  c4217a7f9c0e20010000 vmovdqu [rsi+r9*1+0x120],xmm11
0x19b556c46712  1612  c4c14059f9           vmulps xmm7,xmm7,xmm9
0x19b556c46717  1617  c57810ad80fdffff     vmovups xmm13,[rbp-0x280]
0x19b556c4671f  161f  c4c14058fd           vaddps xmm7,xmm7,xmm13
0x19b556c46724  1624  c4a17a7fbc0ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm7
0x19b556c4672e  162e  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x19b556c46733  1633  c57810add0feffff     vmovups xmm13,[rbp-0x130]
0x19b556c4673b  163b  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x19b556c46740  1640  c4a17a7f840ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm0
0x19b556c4674a  164a  c4c14859f1           vmulps xmm6,xmm6,xmm9
0x19b556c4674f  164f  c578108d90fdffff     vmovups xmm9,[rbp-0x270]
0x19b556c46757  1657  c5b058f6             vaddps xmm6,xmm9,xmm6
0x19b556c4675b  165b  c4a17a7f740e60       vmovdqu [rsi+r9*1+0x60],xmm6
0x19b556c46762  1662  448d6730             leal r12,[rdi+0x30]
0x19b556c46766  1666  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x19b556c4676c  166c  448d6030             leal r12,[rax+0x30]
0x19b556c46770  1670  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x19b556c46776  1676  4183c330             addl r11,0x30
0x19b556c4677a  167a  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x19b556c46782  1682  c4a17a6f041e         vmovdqu xmm0,[rsi+r11*1]
0x19b556c46788  1688  c5f8119da0fdffff     vmovups [rbp-0x260],xmm3
0x19b556c46790  1690  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x19b556c46794  1694  458d5e30             leal r11,[r14+0x30]
0x19b556c46798  1698  c4a17a6f241e         vmovdqu xmm4,[rsi+r11*1]
0x19b556c4679e  169e  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x19b556c467a6  16a6  c5885cf4             vsubps xmm6,xmm14,xmm4
0x19b556c467aa  16aa  c54859f6             vmulps xmm14,xmm6,xmm6
0x19b556c467ae  16ae  c5f811bd80fdffff     vmovups [rbp-0x280],xmm7
0x19b556c467b6  16b6  c5e059fb             vmulps xmm7,xmm3,xmm3
0x19b556c467ba  16ba  c58858ff             vaddps xmm7,xmm14,xmm7
0x19b556c467be  16be  c540c2f201           vcmpps xmm14,xmm7,xmm2, (lt)
0x19b556c467c3  16c3  c509dbf5             vpand xmm14,xmm14,xmm5
0x19b556c467c7  16c7  c441785bf6           vcvtdq2ps xmm14,xmm14
0x19b556c467cc  16cc  c4c16059de           vmulps xmm3,xmm3,xmm14
0x19b556c467d1  16d1  c5781185b0fdffff     vmovups [rbp-0x250],xmm8
0x19b556c467d9  16d9  c578108540fdffff     vmovups xmm8,[rbp-0x2c0]
0x19b556c467e1  16e1  c5b858db             vaddps xmm3,xmm8,xmm3
0x19b556c467e5  16e5  c4a17a7f9c0ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm3
0x19b556c467ef  16ef  c4c14859f6           vmulps xmm6,xmm6,xmm14
0x19b556c467f4  16f4  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x19b556c467fc  16fc  c50858f6             vaddps xmm14,xmm14,xmm6
0x19b556c46800  1700  c4217a7fb40eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm14
0x19b556c4680a  170a  c5e8c2f702           vcmpps xmm6,xmm2,xmm7, (le)
0x19b556c4680f  170f  c540c2c101           vcmpps xmm8,xmm7,xmm1, (lt)
0x19b556c46814  1714  c4c149dbf0           vpand xmm6,xmm6,xmm8
0x19b556c46819  1719  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x19b556c4681e  171e  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x19b556c46822  1722  c5f85bff             vcvtdq2ps xmm7,xmm7
0x19b556c46826  1726  c5c9dbf7             vpand xmm6,xmm6,xmm7
0x19b556c4682a  172a  c5f810bdf0fcffff     vmovups xmm7,[rbp-0x310]
0x19b556c46832  1732  c5c858ff             vaddps xmm7,xmm6,xmm7
0x19b556c46836  1736  c4a17a7fbc0e70010000 vmovdqu [rsi+r9*1+0x170],xmm7
0x19b556c46840  1740  c51059c6             vmulps xmm8,xmm13,xmm6
0x19b556c46844  1744  c57810a500fdffff     vmovups xmm12,[rbp-0x300]
0x19b556c4684c  174c  c4413858e4           vaddps xmm12,xmm8,xmm12
0x19b556c46851  1751  c4217a7fa40e30010000 vmovdqu [rsi+r9*1+0x130],xmm12
0x19b556c4685b  175b  c53059c6             vmulps xmm8,xmm9,xmm6
0x19b556c4685f  175f  c578108d10fdffff     vmovups xmm9,[rbp-0x2f0]
0x19b556c46867  1767  c4413858c9           vaddps xmm9,xmm8,xmm9
0x19b556c4686c  176c  c4217a7f8c0ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm9
0x19b556c46876  1776  c5f859c6             vmulps xmm0,xmm0,xmm6
0x19b556c4687a  177a  c578108520fdffff     vmovups xmm8,[rbp-0x2e0]
0x19b556c46882  1782  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x19b556c46887  1787  c4a17a7f840eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm0
0x19b556c46891  1791  c5d859e6             vmulps xmm4,xmm4,xmm6
0x19b556c46895  1795  c5f810b530fdffff     vmovups xmm6,[rbp-0x2d0]
0x19b556c4689d  179d  c5c858e4             vaddps xmm4,xmm6,xmm4
0x19b556c468a1  17a1  c4a17a7f640e70       vmovdqu [rsi+r9*1+0x70],xmm4
0x19b556c468a8  17a8  83c240               addl rdx,0x40
0x19b556c468ab  17ab  4183c7ff             addl r15,0xff
0x19b556c468af  17af  0f854bfaffff         jnz 0x19b556c46300  <+0x1200>
0x19b556c468b5  17b5  c57928eb             vmovapd xmm13,xmm3
0x19b556c468b9  17b9  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x19b556c468c1  17c1  c5f810b530fcffff     vmovups xmm6,[rbp-0x3d0]
0x19b556c468c9  17c9  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x19b556c468d1  17d1  c5f8108520fcffff     vmovups xmm0,[rbp-0x3e0]
0x19b556c468d9  17d9  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x19b556c468e1  17e1  c578108d10fcffff     vmovups xmm9,[rbp-0x3f0]
0x19b556c468e9  17e9  c57811a500fdffff     vmovups [rbp-0x300],xmm12
0x19b556c468f1  17f1  c4417928e2           vmovapd xmm12,xmm10
0x19b556c468f6  17f6  c578109500fcffff     vmovups xmm10,[rbp-0x400]
0x19b556c468fe  17fe  c5f811a530fdffff     vmovups [rbp-0x2d0],xmm4
0x19b556c46906  1806  c5f810a5f0fbffff     vmovups xmm4,[rbp-0x410]
0x19b556c4690e  180e  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x19b556c46916  1816  c5f810bde0fbffff     vmovups xmm7,[rbp-0x420]
0x19b556c4691e  181e  c5781085d0fbffff     vmovups xmm8,[rbp-0x430]
0x19b556c46926  1826  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x19b556c4692e  182e  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x19b556c46936  1836  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x19b556c4693e  183e  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x19b556c46946  1846  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x19b556c4694e  184e  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x19b556c46956  1856  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x19b556c4695e  185e  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x19b556c46966  1866  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x19b556c4696e  186e  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x19b556c46976  1876  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x19b556c4697e  187e  c57811ad40fdffff     vmovups [rbp-0x2c0],xmm13
0x19b556c46986  1886  85c9                 testl rcx,rcx
0x19b556c46988  1888  0f850e000000         jnz 0x19b556c4699c  <+0x189c>
0x19b556c4698e  188e  448bbdd0fdffff       movl r15,[rbp-0x230]
0x19b556c46995  1895  33c0                 xorl rax,rax
0x19b556c46997  1897  e947080000           jmp 0x19b556c471e3  <+0x20e3>
0x19b556c4699c  189c  448bb5f8fdffff       movl r14,[rbp-0x208]
0x19b556c469a3  18a3  458d5ef0             leal r11,[r14-0x10]
0x19b556c469a7  18a7  458be3               movl r12,r11
0x19b556c469aa  18aa  33c0                 xorl rax,rax
0x19b556c469ac  18ac  453bf3               cmpl r14,r11
0x19b556c469af  18af  440f42e0             cmovcl r12,rax
0x19b556c469b3  18b3  458d5c2410           leal r11,[r12+0x10]
0x19b556c469b8  18b8  448bbdd0fdffff       movl r15,[rbp-0x230]
0x19b556c469bf  18bf  453bfb               cmpl r15,r11
0x19b556c469c2  18c2  0f821b080000         jc 0x19b556c471e3  <+0x20e3>
0x19b556c469c8  18c8  8b9dd8fdffff         movl rbx,[rbp-0x228]
0x19b556c469ce  18ce  413bdb               cmpl rbx,r11
0x19b556c469d1  18d1  0f820c080000         jc 0x19b556c471e3  <+0x20e3>
0x19b556c469d7  18d7  448b9de0fdffff       movl r11,[rbp-0x220]
0x19b556c469de  18de  438d14a3             leal rdx,[r11+r12*4]
0x19b556c469e2  18e2  c57a6f3416           vmovdqu xmm14,[rsi+rdx*1]
0x19b556c469e7  18e7  8bbde8fdffff         movl rdi,[rbp-0x218]
0x19b556c469ed  18ed  468d04a7             leal r8,[rdi+r12*4]
0x19b556c469f1  18f1  c4217a6f2c06         vmovdqu xmm13,[rsi+r8*1]
0x19b556c469f7  18f7  8b85f0fdffff         movl rax,[rbp-0x210]
0x19b556c469fd  18fd  468d1ca0             leal r11,[rax+r12*4]
0x19b556c46a01  1901  c4217a6f1c1e         vmovdqu xmm11,[rsi+r11*1]
0x19b556c46a07  1907  c57810a520feffff     vmovups xmm12,[rbp-0x1e0]
0x19b556c46a0f  190f  c441185cc3           vsubps xmm8,xmm12,xmm11
0x19b556c46a14  1914  4401e1               addl rcx,r12
0x19b556c46a17  1917  458bfe               movl r15,r14
0x19b556c46a1a  191a  442bf9               subl r15,rcx
0x19b556c46a1d  191d  c441796ee7           vmovd xmm12,r15
0x19b556c46a22  1922  c4417970e400         vpshufd xmm12,xmm12,0x0
0x19b556c46a28  1928  49ba0100000002000000 REX.W movq r10,0x200000001
0x19b556c46a32  1932  c4c1f96ec2           vmovq xmm0,r10
0x19b556c46a37  1937  49ba0300000004000000 REX.W movq r10,0x400000003
0x19b556c46a41  1941  c4c3f922c201         vpinsrq xmm0,xmm0,r10,0x1
0x19b556c46a47  1947  c4c2793fc4           vpmaxud xmm0,xmm0,xmm12
0x19b556c46a4c  194c  c4c17976c4           vpcmpeqd xmm0,xmm0,xmm12
0x19b556c46a51  1951  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46a56  1956  c4c179efc7           vpxor xmm0,xmm0,xmm15
0x19b556c46a5b  195b  4529e6               subl r14,r12
0x19b556c46a5e  195e  c57811a530feffff     vmovups [rbp-0x1d0],xmm12
0x19b556c46a66  1966  c441796ee6           vmovd xmm12,r14
0x19b556c46a6b  196b  c4417970e400         vpshufd xmm12,xmm12,0x0
0x19b556c46a71  1971  c57811a540feffff     vmovups [rbp-0x1c0],xmm12
0x19b556c46a79  1979  c4411976e4           vpcmpeqd xmm12,xmm12,xmm12
0x19b556c46a7e  197e  c4c11973f43f         vpsllq xmm12,xmm12,63
0x19b556c46a84  1984  c4c11973d41f         vpsrlq xmm12,xmm12,31
0x19b556c46a8a  198a  49ba0200000003000000 REX.W movq r10,0x300000002
0x19b556c46a94  1994  c4439922e201         vpinsrq xmm12,xmm12,r10,0x1
0x19b556c46a9a  199a  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x19b556c46aa2  19a2  c442313fcc           vpmaxud xmm9,xmm9,xmm12
0x19b556c46aa7  19a7  c4413176cc           vpcmpeqd xmm9,xmm9,xmm12
0x19b556c46aac  19ac  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46ab1  19b1  c44131efcf           vpxor xmm9,xmm9,xmm15
0x19b556c46ab6  19b6  c4c179dbc1           vpand xmm0,xmm0,xmm9
0x19b556c46abb  19bb  448bbd90feffff       movl r15,[rbp-0x170]
0x19b556c46ac2  19c2  478d24a7             leal r12,[r15+r12*4]
0x19b556c46ac6  19c6  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x19b556c46acc  19cc  c578119d00feffff     vmovups [rbp-0x200],xmm11
0x19b556c46ad4  19d4  c57810a550feffff     vmovups xmm12,[rbp-0x1b0]
0x19b556c46adc  19dc  c441185cd9           vsubps xmm11,xmm12,xmm9
0x19b556c46ae1  19e1  c4412059e3           vmulps xmm12,xmm11,xmm11
0x19b556c46ae6  19e6  c578118d10feffff     vmovups [rbp-0x1f0],xmm9
0x19b556c46aee  19ee  c4413859c8           vmulps xmm9,xmm8,xmm8
0x19b556c46af3  19f3  c4411858c9           vaddps xmm9,xmm12,xmm9
0x19b556c46af8  19f8  c530c2e201           vcmpps xmm12,xmm9,xmm2, (lt)
0x19b556c46afd  19fd  c519dbe5             vpand xmm12,xmm12,xmm5
0x19b556c46b01  1a01  c441785be4           vcvtdq2ps xmm12,xmm12
0x19b556c46b06  1a06  c44179dbe4           vpand xmm12,xmm0,xmm12
0x19b556c46b0b  1a0b  c4413859c4           vmulps xmm8,xmm8,xmm12
0x19b556c46b10  1a10  c5b858f6             vaddps xmm6,xmm8,xmm6
0x19b556c46b14  1a14  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x19b556c46b1e  1a1e  c4412059c4           vmulps xmm8,xmm11,xmm12
0x19b556c46b23  1a23  c5b858db             vaddps xmm3,xmm8,xmm3
0x19b556c46b27  1a27  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x19b556c46b31  1a31  c44168c2c102         vcmpps xmm8,xmm2,xmm9, (le)
0x19b556c46b37  1a37  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x19b556c46b3c  1a3c  c44139dbc3           vpand xmm8,xmm8,xmm11
0x19b556c46b41  1a41  c4c179dbc0           vpand xmm0,xmm0,xmm8
0x19b556c46b46  1a46  c5f972f01f           vpslld xmm0,xmm0,31
0x19b556c46b4b  1a4b  c5f972e01f           vpsrad xmm0,xmm0,31
0x19b556c46b50  1a50  c44139efc0           vpxor xmm8,xmm8,xmm8
0x19b556c46b55  1a55  c44138c2c901         vcmpps xmm9,xmm8,xmm9, (lt)
0x19b556c46b5b  1a5b  c531dbcd             vpand xmm9,xmm9,xmm5
0x19b556c46b5f  1a5f  c441785bc9           vcvtdq2ps xmm9,xmm9
0x19b556c46b64  1a64  c4c179dbc1           vpand xmm0,xmm0,xmm9
0x19b556c46b69  1a69  c5f858ff             vaddps xmm7,xmm0,xmm7
0x19b556c46b6d  1a6d  c4a17a7fbc0e40010000 vmovdqu [rsi+r9*1+0x140],xmm7
0x19b556c46b77  1a77  c51059c8             vmulps xmm9,xmm13,xmm0
0x19b556c46b7b  1a7b  c5b058e4             vaddps xmm4,xmm9,xmm4
0x19b556c46b7f  1a7f  c4a17a7fa40e00010000 vmovdqu [rsi+r9*1+0x100],xmm4
0x19b556c46b89  1a89  c50859c8             vmulps xmm9,xmm14,xmm0
0x19b556c46b8d  1a8d  c4413058ca           vaddps xmm9,xmm9,xmm10
0x19b556c46b92  1a92  c4217a7f8c0ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm9
0x19b556c46b9c  1a9c  c578109500feffff     vmovups xmm10,[rbp-0x200]
0x19b556c46ba4  1aa4  c52859d0             vmulps xmm10,xmm10,xmm0
0x19b556c46ba8  1aa8  c578109d10fcffff     vmovups xmm11,[rbp-0x3f0]
0x19b556c46bb0  1ab0  c4412858d3           vaddps xmm10,xmm10,xmm11
0x19b556c46bb5  1ab5  c4217a7f940e80000000 vmovdqu [rsi+r9*1+0x80],xmm10
0x19b556c46bbf  1abf  c578109d10feffff     vmovups xmm11,[rbp-0x1f0]
0x19b556c46bc7  1ac7  c5a059c0             vmulps xmm0,xmm11,xmm0
0x19b556c46bcb  1acb  c57810a520fcffff     vmovups xmm12,[rbp-0x3e0]
0x19b556c46bd3  1ad3  c4c17858c4           vaddps xmm0,xmm0,xmm12
0x19b556c46bd8  1ad8  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x19b556c46bdf  1adf  c57a6f5c1610         vmovdqu xmm11,[rsi+rdx*1+0x10]
0x19b556c46be5  1ae5  c4217a6f640610       vmovdqu xmm12,[rsi+r8*1+0x10]
0x19b556c46bec  1aec  c4217a6f6c1e10       vmovdqu xmm13,[rsi+r11*1+0x10]
0x19b556c46bf3  1af3  c57810b520feffff     vmovups xmm14,[rbp-0x1e0]
0x19b556c46bfb  1afb  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x19b556c46c03  1b03  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x19b556c46c08  1b08  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x19b556c46c10  1b10  49ba0500000006000000 REX.W movq r10,0x600000005
0x19b556c46c1a  1b1a  c4c1f96eda           vmovq xmm3,r10
0x19b556c46c1f  1b1f  49ba0700000008000000 REX.W movq r10,0x800000007
0x19b556c46c29  1b29  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x19b556c46c2f  1b2f  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x19b556c46c37  1b37  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x19b556c46c3f  1b3f  c4e2613fdc           vpmaxud xmm3,xmm3,xmm4
0x19b556c46c44  1b44  c5e176dc             vpcmpeqd xmm3,xmm3,xmm4
0x19b556c46c48  1b48  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46c4d  1b4d  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x19b556c46c52  1b52  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x19b556c46c5a  1b5a  49ba0400000005000000 REX.W movq r10,0x500000004
0x19b556c46c64  1b64  c4c1f96ef2           vmovq xmm6,r10
0x19b556c46c69  1b69  49ba0600000007000000 REX.W movq r10,0x700000006
0x19b556c46c73  1b73  c4c3c922f201         vpinsrq xmm6,xmm6,r10,0x1
0x19b556c46c79  1b79  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x19b556c46c81  1b81  c5f810bd40feffff     vmovups xmm7,[rbp-0x1c0]
0x19b556c46c89  1b89  c4e2413ffe           vpmaxud xmm7,xmm7,xmm6
0x19b556c46c8e  1b8e  c5c176fe             vpcmpeqd xmm7,xmm7,xmm6
0x19b556c46c92  1b92  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46c97  1b97  c4c141efff           vpxor xmm7,xmm7,xmm15
0x19b556c46c9c  1b9c  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x19b556c46ca0  1ba0  c4a17a6f742610       vmovdqu xmm6,[rsi+r12*1+0x10]
0x19b556c46ca7  1ba7  c578118d00fcffff     vmovups [rbp-0x400],xmm9
0x19b556c46caf  1baf  c5f810bd50feffff     vmovups xmm7,[rbp-0x1b0]
0x19b556c46cb7  1bb7  c5405cce             vsubps xmm9,xmm7,xmm6
0x19b556c46cbb  1bbb  c578119510fcffff     vmovups [rbp-0x3f0],xmm10
0x19b556c46cc3  1bc3  c4413059d1           vmulps xmm10,xmm9,xmm9
0x19b556c46cc8  1bc8  c5f859f8             vmulps xmm7,xmm0,xmm0
0x19b556c46ccc  1bcc  c5a858ff             vaddps xmm7,xmm10,xmm7
0x19b556c46cd0  1bd0  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x19b556c46cd5  1bd5  c529dbd5             vpand xmm10,xmm10,xmm5
0x19b556c46cd9  1bd9  c441785bd2           vcvtdq2ps xmm10,xmm10
0x19b556c46cde  1bde  c44161dbd2           vpand xmm10,xmm3,xmm10
0x19b556c46ce3  1be3  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x19b556c46ce8  1be8  c5f810a590fcffff     vmovups xmm4,[rbp-0x370]
0x19b556c46cf0  1bf0  c5f858c4             vaddps xmm0,xmm0,xmm4
0x19b556c46cf4  1bf4  c4a17a7f840ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm0
0x19b556c46cfe  1bfe  c4c13059e2           vmulps xmm4,xmm9,xmm10
0x19b556c46d03  1c03  c578108dd0fbffff     vmovups xmm9,[rbp-0x430]
0x19b556c46d0b  1c0b  c4c15858e1           vaddps xmm4,xmm4,xmm9
0x19b556c46d10  1c10  c4a17a7fa40e90010000 vmovdqu [rsi+r9*1+0x190],xmm4
0x19b556c46d1a  1c1a  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x19b556c46d1f  1c1f  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x19b556c46d24  1c24  c44131dbca           vpand xmm9,xmm9,xmm10
0x19b556c46d29  1c29  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x19b556c46d2e  1c2e  c5e172f31f           vpslld xmm3,xmm3,31
0x19b556c46d33  1c33  c5e172e31f           vpsrad xmm3,xmm3,31
0x19b556c46d38  1c38  c5b8c2ff01           vcmpps xmm7,xmm8,xmm7, (lt)
0x19b556c46d3d  1c3d  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x19b556c46d41  1c41  c5f85bff             vcvtdq2ps xmm7,xmm7
0x19b556c46d45  1c45  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x19b556c46d49  1c49  c5f810bdc0feffff     vmovups xmm7,[rbp-0x140]
0x19b556c46d51  1c51  c5e058ff             vaddps xmm7,xmm3,xmm7
0x19b556c46d55  1c55  c4a17a7fbc0e50010000 vmovdqu [rsi+r9*1+0x150],xmm7
0x19b556c46d5f  1c5f  c51859cb             vmulps xmm9,xmm12,xmm3
0x19b556c46d63  1c63  c5781095b0feffff     vmovups xmm10,[rbp-0x150]
0x19b556c46d6b  1c6b  c4413058ca           vaddps xmm9,xmm9,xmm10
0x19b556c46d70  1c70  c4217a7f8c0e10010000 vmovdqu [rsi+r9*1+0x110],xmm9
0x19b556c46d7a  1c7a  c52059d3             vmulps xmm10,xmm11,xmm3
0x19b556c46d7e  1c7e  c578109dc0fcffff     vmovups xmm11,[rbp-0x340]
0x19b556c46d86  1c86  c4412858d3           vaddps xmm10,xmm10,xmm11
0x19b556c46d8b  1c8b  c4217a7f940ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm10
0x19b556c46d95  1c95  c51059db             vmulps xmm11,xmm13,xmm3
0x19b556c46d99  1c99  c57810adb0fcffff     vmovups xmm13,[rbp-0x350]
0x19b556c46da1  1ca1  c4412058dd           vaddps xmm11,xmm11,xmm13
0x19b556c46da6  1ca6  c4217a7f9c0e90000000 vmovdqu [rsi+r9*1+0x90],xmm11
0x19b556c46db0  1cb0  c5c859db             vmulps xmm3,xmm6,xmm3
0x19b556c46db4  1cb4  c5f810b5a0fcffff     vmovups xmm6,[rbp-0x360]
0x19b556c46dbc  1cbc  c5e058de             vaddps xmm3,xmm3,xmm6
0x19b556c46dc0  1cc0  c4a17a7f5c0e50       vmovdqu [rsi+r9*1+0x50],xmm3
0x19b556c46dc7  1cc7  c5fa6f741620         vmovdqu xmm6,[rsi+rdx*1+0x20]
0x19b556c46dcd  1ccd  c4217a6f640620       vmovdqu xmm12,[rsi+r8*1+0x20]
0x19b556c46dd4  1cd4  c4217a6f6c1e20       vmovdqu xmm13,[rsi+r11*1+0x20]
0x19b556c46ddb  1cdb  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x19b556c46de3  1ce3  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x19b556c46de8  1ce8  c5f8119da0fcffff     vmovups [rbp-0x360],xmm3
0x19b556c46df0  1cf0  49ba090000000a000000 REX.W movq r10,0xa00000009
0x19b556c46dfa  1cfa  c4c1f96eda           vmovq xmm3,r10
0x19b556c46dff  1cff  49ba0b0000000c000000 REX.W movq r10,0xc0000000b
0x19b556c46e09  1d09  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x19b556c46e0f  1d0f  c5f811a5d0fbffff     vmovups [rbp-0x430],xmm4
0x19b556c46e17  1d17  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x19b556c46e1f  1d1f  c4e2613fdc           vpmaxud xmm3,xmm3,xmm4
0x19b556c46e24  1d24  c5e176dc             vpcmpeqd xmm3,xmm3,xmm4
0x19b556c46e28  1d28  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46e2d  1d2d  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x19b556c46e32  1d32  c5f811bdc0feffff     vmovups [rbp-0x140],xmm7
0x19b556c46e3a  1d3a  49ba0800000009000000 REX.W movq r10,0x900000008
0x19b556c46e44  1d44  c4c1f96efa           vmovq xmm7,r10
0x19b556c46e49  1d49  49ba0a0000000b000000 REX.W movq r10,0xb0000000a
0x19b556c46e53  1d53  c4c3c122fa01         vpinsrq xmm7,xmm7,r10,0x1
0x19b556c46e59  1d59  c578118db0feffff     vmovups [rbp-0x150],xmm9
0x19b556c46e61  1d61  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x19b556c46e69  1d69  c462313fcf           vpmaxud xmm9,xmm9,xmm7
0x19b556c46e6e  1d6e  c53176cf             vpcmpeqd xmm9,xmm9,xmm7
0x19b556c46e72  1d72  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c46e77  1d77  c44131efcf           vpxor xmm9,xmm9,xmm15
0x19b556c46e7c  1d7c  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x19b556c46e81  1d81  c4a17a6f7c2620       vmovdqu xmm7,[rsi+r12*1+0x20]
0x19b556c46e88  1d88  c5781195c0fcffff     vmovups [rbp-0x340],xmm10
0x19b556c46e90  1d90  c578108d50feffff     vmovups xmm9,[rbp-0x1b0]
0x19b556c46e98  1d98  c5305cd7             vsubps xmm10,xmm9,xmm7
0x19b556c46e9c  1d9c  c578119db0fcffff     vmovups [rbp-0x350],xmm11
0x19b556c46ea4  1da4  c4412859da           vmulps xmm11,xmm10,xmm10
0x19b556c46ea9  1da9  c57859c8             vmulps xmm9,xmm0,xmm0
0x19b556c46ead  1dad  c4412058c9           vaddps xmm9,xmm11,xmm9
0x19b556c46eb2  1db2  c530c2da01           vcmpps xmm11,xmm9,xmm2, (lt)
0x19b556c46eb7  1db7  c521dbdd             vpand xmm11,xmm11,xmm5
0x19b556c46ebb  1dbb  c441785bdb           vcvtdq2ps xmm11,xmm11
0x19b556c46ec0  1dc0  c44161dbdb           vpand xmm11,xmm3,xmm11
0x19b556c46ec5  1dc5  c4c17859c3           vmulps xmm0,xmm0,xmm11
0x19b556c46eca  1dca  c5f810a5a0fdffff     vmovups xmm4,[rbp-0x260]
0x19b556c46ed2  1dd2  c5f858c4             vaddps xmm0,xmm0,xmm4
0x19b556c46ed6  1dd6  c4a17a7f840ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm0
0x19b556c46ee0  1de0  c4c12859e3           vmulps xmm4,xmm10,xmm11
0x19b556c46ee5  1de5  c5781095b0fdffff     vmovups xmm10,[rbp-0x250]
0x19b556c46eed  1ded  c4c15858e2           vaddps xmm4,xmm4,xmm10
0x19b556c46ef2  1df2  c4a17a7fa40ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm4
0x19b556c46efc  1dfc  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x19b556c46f02  1e02  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x19b556c46f07  1e07  c44129dbd3           vpand xmm10,xmm10,xmm11
0x19b556c46f0c  1e0c  c4c161dbda           vpand xmm3,xmm3,xmm10
0x19b556c46f11  1e11  c5e172f31f           vpslld xmm3,xmm3,31
0x19b556c46f16  1e16  c5e172e31f           vpsrad xmm3,xmm3,31
0x19b556c46f1b  1e1b  c44138c2c901         vcmpps xmm9,xmm8,xmm9, (lt)
0x19b556c46f21  1e21  c531dbcd             vpand xmm9,xmm9,xmm5
0x19b556c46f25  1e25  c441785bc9           vcvtdq2ps xmm9,xmm9
0x19b556c46f2a  1e2a  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x19b556c46f2f  1e2f  c578108d60fdffff     vmovups xmm9,[rbp-0x2a0]
0x19b556c46f37  1e37  c4416058c9           vaddps xmm9,xmm3,xmm9
0x19b556c46f3c  1e3c  c4217a7f8c0e60010000 vmovdqu [rsi+r9*1+0x160],xmm9
0x19b556c46f46  1e46  c51859d3             vmulps xmm10,xmm12,xmm3
0x19b556c46f4a  1e4a  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x19b556c46f52  1e52  c4412858d3           vaddps xmm10,xmm10,xmm11
0x19b556c46f57  1e57  c4217a7f940e20010000 vmovdqu [rsi+r9*1+0x120],xmm10
0x19b556c46f61  1e61  c5c859f3             vmulps xmm6,xmm6,xmm3
0x19b556c46f65  1e65  c578109d80fdffff     vmovups xmm11,[rbp-0x280]
0x19b556c46f6d  1e6d  c4c14858f3           vaddps xmm6,xmm6,xmm11
0x19b556c46f72  1e72  c4a17a7fb40ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm6
0x19b556c46f7c  1e7c  c51059db             vmulps xmm11,xmm13,xmm3
0x19b556c46f80  1e80  c57810a5d0feffff     vmovups xmm12,[rbp-0x130]
0x19b556c46f88  1e88  c4412058dc           vaddps xmm11,xmm11,xmm12
0x19b556c46f8d  1e8d  c4217a7f9c0ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm11
0x19b556c46f97  1e97  c5c059db             vmulps xmm3,xmm7,xmm3
0x19b556c46f9b  1e9b  c5f810bd90fdffff     vmovups xmm7,[rbp-0x270]
0x19b556c46fa3  1ea3  c5e058df             vaddps xmm3,xmm3,xmm7
0x19b556c46fa7  1ea7  c4a17a7f5c0e60       vmovdqu [rsi+r9*1+0x60],xmm3
0x19b556c46fae  1eae  c5fa6f7c1630         vmovdqu xmm7,[rsi+rdx*1+0x30]
0x19b556c46fb4  1eb4  c4217a6f640630       vmovdqu xmm12,[rsi+r8*1+0x30]
0x19b556c46fbb  1ebb  c4217a6f6c1e30       vmovdqu xmm13,[rsi+r11*1+0x30]
0x19b556c46fc2  1ec2  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x19b556c46fca  1eca  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x19b556c46fcf  1ecf  49ba0d0000000e000000 REX.W movq r10,0xe0000000d
0x19b556c46fd9  1ed9  c441f96ef2           vmovq xmm14,r10
0x19b556c46fde  1ede  49ba0f00000010000000 REX.W movq r10,0x100000000f
0x19b556c46fe8  1ee8  c4438922f201         vpinsrq xmm14,xmm14,r10,0x1
0x19b556c46fee  1eee  c5f8119d90fdffff     vmovups [rbp-0x270],xmm3
0x19b556c46ff6  1ef6  c5f8109d30feffff     vmovups xmm3,[rbp-0x1d0]
0x19b556c46ffe  1efe  c462093ff3           vpmaxud xmm14,xmm14,xmm3
0x19b556c47003  1f03  c50976f3             vpcmpeqd xmm14,xmm14,xmm3
0x19b556c47007  1f07  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c4700c  1f0c  c44109eff7           vpxor xmm14,xmm14,xmm15
0x19b556c47011  1f11  49ba0c0000000d000000 REX.W movq r10,0xd0000000c
0x19b556c4701b  1f1b  c4c1f96eda           vmovq xmm3,r10
0x19b556c47020  1f20  49ba0e0000000f000000 REX.W movq r10,0xf0000000e
0x19b556c4702a  1f2a  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x19b556c47030  1f30  c5f811a5b0fdffff     vmovups [rbp-0x250],xmm4
0x19b556c47038  1f38  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x19b556c47040  1f40  c4e2593fe3           vpmaxud xmm4,xmm4,xmm3
0x19b556c47045  1f45  c5d976e3             vpcmpeqd xmm4,xmm4,xmm3
0x19b556c47049  1f49  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x19b556c4704e  1f4e  c4c159efe7           vpxor xmm4,xmm4,xmm15
0x19b556c47053  1f53  c589dbdc             vpand xmm3,xmm14,xmm4
0x19b556c47057  1f57  c4a17a6f642630       vmovdqu xmm4,[rsi+r12*1+0x30]
0x19b556c4705e  1f5e  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x19b556c47066  1f66  c5f811b580fdffff     vmovups [rbp-0x280],xmm6
0x19b556c4706e  1f6e  c5885cf4             vsubps xmm6,xmm14,xmm4
0x19b556c47072  1f72  c578118d60fdffff     vmovups [rbp-0x2a0],xmm9
0x19b556c4707a  1f7a  c54859ce             vmulps xmm9,xmm6,xmm6
0x19b556c4707e  1f7e  c578119570fdffff     vmovups [rbp-0x290],xmm10
0x19b556c47086  1f86  c57859d0             vmulps xmm10,xmm0,xmm0
0x19b556c4708a  1f8a  c4413058ca           vaddps xmm9,xmm9,xmm10
0x19b556c4708f  1f8f  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x19b556c47094  1f94  c529dbd5             vpand xmm10,xmm10,xmm5
0x19b556c47098  1f98  c441785bd2           vcvtdq2ps xmm10,xmm10
0x19b556c4709d  1f9d  c44161dbd2           vpand xmm10,xmm3,xmm10
0x19b556c470a2  1fa2  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x19b556c470a7  1fa7  c578119dd0feffff     vmovups [rbp-0x130],xmm11
0x19b556c470af  1faf  c578109d40fdffff     vmovups xmm11,[rbp-0x2c0]
0x19b556c470b7  1fb7  c4c17858c3           vaddps xmm0,xmm0,xmm11
0x19b556c470bc  1fbc  c4a17a7f840ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm0
0x19b556c470c6  1fc6  c4c14859f2           vmulps xmm6,xmm6,xmm10
0x19b556c470cb  1fcb  c578109550fdffff     vmovups xmm10,[rbp-0x2b0]
0x19b556c470d3  1fd3  c4c14858f2           vaddps xmm6,xmm6,xmm10
0x19b556c470d8  1fd8  c4a17a7fb40eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm6
0x19b556c470e2  1fe2  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x19b556c470e8  1fe8  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x19b556c470ed  1fed  c44129dbd3           vpand xmm10,xmm10,xmm11
0x19b556c470f2  1ff2  c4c161dbda           vpand xmm3,xmm3,xmm10
0x19b556c470f7  1ff7  c5e172f31f           vpslld xmm3,xmm3,31
0x19b556c470fc  1ffc  c5e172e31f           vpsrad xmm3,xmm3,31
0x19b556c47101  2001  c44138c2c101         vcmpps xmm8,xmm8,xmm9, (lt)
0x19b556c47107  2007  c539dbc5             vpand xmm8,xmm8,xmm5
0x19b556c4710b  200b  c441785bc0           vcvtdq2ps xmm8,xmm8
0x19b556c47110  2010  c4c161dbd8           vpand xmm3,xmm3,xmm8
0x19b556c47115  2015  c5781085f0fcffff     vmovups xmm8,[rbp-0x310]
0x19b556c4711d  201d  c4416058c0           vaddps xmm8,xmm3,xmm8
0x19b556c47122  2022  c4217a7f840e70010000 vmovdqu [rsi+r9*1+0x170],xmm8
0x19b556c4712c  202c  c51859cb             vmulps xmm9,xmm12,xmm3
0x19b556c47130  2030  c578109500fdffff     vmovups xmm10,[rbp-0x300]
0x19b556c47138  2038  c4413058ca           vaddps xmm9,xmm9,xmm10
0x19b556c4713d  203d  c4217a7f8c0e30010000 vmovdqu [rsi+r9*1+0x130],xmm9
0x19b556c47147  2047  c5c059fb             vmulps xmm7,xmm7,xmm3
0x19b556c4714b  204b  c578109510fdffff     vmovups xmm10,[rbp-0x2f0]
0x19b556c47153  2053  c4c14058fa           vaddps xmm7,xmm7,xmm10
0x19b556c47158  2058  c4a17a7fbc0ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm7
0x19b556c47162  2062  c51059d3             vmulps xmm10,xmm13,xmm3
0x19b556c47166  2066  c578109d20fdffff     vmovups xmm11,[rbp-0x2e0]
0x19b556c4716e  206e  c4412858d3           vaddps xmm10,xmm10,xmm11
0x19b556c47173  2073  c4217a7f940eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm10
0x19b556c4717d  207d  c5d859db             vmulps xmm3,xmm4,xmm3
0x19b556c47181  2081  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x19b556c47189  2089  c4416058db           vaddps xmm11,xmm3,xmm11
0x19b556c4718e  208e  c4217a7f5c0e70       vmovdqu [rsi+r9*1+0x70],xmm11
0x19b556c47195  2095  33c0                 xorl rax,rax
0x19b556c47197  2097  448bbdd0fdffff       movl r15,[rbp-0x230]
0x19b556c4719e  209e  c5781185f0fcffff     vmovups [rbp-0x310],xmm8
0x19b556c471a6  20a6  c578118d00fdffff     vmovups [rbp-0x300],xmm9
0x19b556c471ae  20ae  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x19b556c471b6  20b6  c578119520fdffff     vmovups [rbp-0x2e0],xmm10
0x19b556c471be  20be  c578119d30fdffff     vmovups [rbp-0x2d0],xmm11
0x19b556c471c6  20c6  c57928e8             vmovapd xmm13,xmm0
0x19b556c471ca  20ca  c57928f6             vmovapd xmm14,xmm6
0x19b556c471ce  20ce  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x19b556c471d6  20d6  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x19b556c471de  20de  e91a020000           jmp 0x19b556c473fd  <+0x22fd>
0x19b556c471e3  20e3  448b9d20ffffff       movl r11,[rbp-0xe0]
0x19b556c471ea  20ea  4183e30f             andl r11,0xf
0x19b556c471ee  20ee  448be1               movl r12,rcx
0x19b556c471f1  20f1  8bbd98feffff         movl rdi,[rbp-0x168]
0x19b556c471f7  20f7  3bf9                 cmpl rdi,rcx
0x19b556c471f9  20f9  440f42e7             cmovcl r12,rdi
0x19b556c471fd  20fd  4589e6               movl r14,r12
0x19b556c47200  2100  8b9da8feffff         movl rbx,[rbp-0x158]
0x19b556c47206  2106  4439e3               cmpl rbx,r12
0x19b556c47209  2109  440f42f3             cmovcl r14,rbx
0x19b556c4720d  210d  458be6               movl r12,r14
0x19b556c47210  2110  453bde               cmpl r11,r14
0x19b556c47213  2113  450f42e3             cmovcl r12,r11
0x19b556c47217  2117  4585e4               testl r12,r12
0x19b556c4721a  211a  0f8545000000         jnz 0x19b556c47265  <+0x2165>
0x19b556c47220  2120  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x19b556c47228  2128  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x19b556c47230  2130  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x19b556c47238  2138  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x19b556c47240  2140  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x19b556c47248  2148  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x19b556c47250  2150  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x19b556c47258  2158  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x19b556c47260  2160  e998010000           jmp 0x19b556c473fd  <+0x22fd>
0x19b556c47265  2165  8b8de0feffff         movl rcx,[rbp-0x120]
0x19b556c4726b  216b  81e1f0ffff1f         andl rcx,0x1ffffff0
0x19b556c47271  2171  448b9d18ffffff       movl r11,[rbp-0xe8]
0x19b556c47278  2178  458d1c8b             leal r11,[r11+rcx*4]
0x19b556c4727c  217c  448bb520ffffff       movl r14,[rbp-0xe0]
0x19b556c47283  2183  4181e6f0ffff1f       andl r14,0x1ffffff0
0x19b556c4728a  218a  8b9d28ffffff         movl rbx,[rbp-0xd8]
0x19b556c47290  2190  468d34b3             leal r14,[rbx+r14*4]
0x19b556c47294  2194  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x19b556c4729c  219c  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x19b556c472a4  21a4  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x19b556c472ac  21ac  c5d857e4             vxorps xmm4,xmm4,xmm4
0x19b556c472b0  21b0  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x19b556c472b4  21b4  c5c972f619           vpslld xmm6,xmm6,25
0x19b556c472b9  21b9  c5c972d602           vpsrld xmm6,xmm6,2
0x19b556c472be  21be  418bdb               movl rbx,r11
0x19b556c472c1  21c1  448b9de8feffff       movl r11,[rbp-0x118]
0x19b556c472c8  21c8  8b95f0feffff         movl rdx,[rbp-0x110]
0x19b556c472ce  21ce  660f1f840000000000   nop
0x19b556c472d7  21d7  660f1f840000000000   nop
0x19b556c472e0  21e0  660f1f840000000000   nop
0x19b556c472e9  21e9  660f1f840000000000   nop
0x19b556c472f2  21f2  660f1f840000000000   nop
0x19b556c472fb  21fb  0f1f440000           nop
0x19b556c47300  2200  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x19b556c47308  2208  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x19b556c47310  2210  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x19b556c47314  2214  0f8620060000         jna 0x19b556c4793a  <+0x283a>
0x19b556c4731a  221a  c5fa103c1e           vmovss xmm7,[rsi+rbx*1]
0x19b556c4731f  221f  c5725cc7             vsubss xmm8,xmm1,xmm7
0x19b556c47323  2223  c4c13a59c8           vmulss xmm1,xmm8,xmm8
0x19b556c47328  2228  c4217a100c1e         vmovss xmm9,[rsi+r11*1]
0x19b556c4732e  222e  c4416a5cd1           vsubss xmm10,xmm2,xmm9
0x19b556c47333  2233  c4c12a59d2           vmulss xmm2,xmm10,xmm10
0x19b556c47338  2238  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x19b556c4733c  223c  c5f82ec1             vucomiss xmm0,xmm1
0x19b556c47340  2240  0f8757000000         ja 0x19b556c4739d  <+0x229d>
0x19b556c47346  2246  c5f82ed9             vucomiss xmm3,xmm1
0x19b556c4734a  224a  0f8675000000         jna 0x19b556c473c5  <+0x22c5>
0x19b556c47350  2250  c5f82ecc             vucomiss xmm1,xmm4
0x19b556c47354  2254  0f866b000000         jna 0x19b556c473c5  <+0x22c5>
0x19b556c4735a  225a  c4e27918ff           vbroadcastss xmm7,xmm7
0x19b556c4735f  225f  c4c34121f910         vinsertps xmm7,xmm7,xmm9,0x10
0x19b556c47365  2265  c57a100416           vmovss xmm8,[rsi+rdx*1]
0x19b556c4736a  226a  c4c34121f820         vinsertps xmm7,xmm7,xmm8,0x20
0x19b556c47370  2270  c4217a100436         vmovss xmm8,[rsi+r14*1]
0x19b556c47376  2276  c4c34121f830         vinsertps xmm7,xmm7,xmm8,0x30
0x19b556c4737c  227c  c5d058ef             vaddps xmm5,xmm5,xmm7
0x19b556c47380  2280  c5ca58bd68ffffff     vaddss xmm7,xmm6,[rbp-0x98]
0x19b556c47388  2288  c5fb11bd40ffffff     vmovsd [rbp-0xc0],xmm7
0x19b556c47390  2290  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x19b556c47398  2298  e928000000           jmp 0x19b556c473c5  <+0x22c5>
0x19b556c4739d  229d  c5aa58bd30ffffff     vaddss xmm7,xmm10,[rbp-0xd0]
0x19b556c473a5  22a5  c53a588560ffffff     vaddss xmm8,xmm8,[rbp-0xa0]
0x19b556c473ad  22ad  c5fb11bd30ffffff     vmovsd [rbp-0xd0],xmm7
0x19b556c473b5  22b5  c57b118538ffffff     vmovsd [rbp-0xc8],xmm8
0x19b556c473bd  22bd  c57b118560ffffff     vmovsd [rbp-0xa0],xmm8
0x19b556c473c5  22c5  83c304               addl rbx,0x4
0x19b556c473c8  22c8  4183c304             addl r11,0x4
0x19b556c473cc  22cc  83c204               addl rdx,0x4
0x19b556c473cf  22cf  4183c604             addl r14,0x4
0x19b556c473d3  22d3  4183c4ff             addl r12,0xff
0x19b556c473d7  22d7  0f8523ffffff         jnz 0x19b556c47300  <+0x2200>
0x19b556c473dd  22dd  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x19b556c473e5  22e5  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x19b556c473ed  22ed  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x19b556c473f5  22f5  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x19b556c473fd  22fd  448bb578ffffff       movl r14,[rbp-0x88]
0x19b556c47404  2304  458d5e01             leal r11,[r14+0x1]
0x19b556c47408  2308  448ba570ffffff       movl r12,[rbp-0x90]
0x19b556c4740f  230f  453be6               cmpl r12,r14
0x19b556c47412  2312  0f8568ebffff         jnz 0x19b556c45f80  <+0xe80>
0x19b556c47418  2318  c57b108530ffffff     vmovsd xmm8,[rbp-0xd0]
0x19b556c47420  2320  c4217a11440e28       vmovss [rsi+r9*1+0x28],xmm8
0x19b556c47427  2327  c5fb10bd38ffffff     vmovsd xmm7,[rbp-0xc8]
0x19b556c4742f  232f  c4a17a117c0e24       vmovss [rsi+r9*1+0x24],xmm7
0x19b556c47436  2336  c5fb10b540ffffff     vmovsd xmm6,[rbp-0xc0]
0x19b556c4743e  233e  c4a17a11740e20       vmovss [rsi+r9*1+0x20],xmm6
0x19b556c47445  2345  c5f8108550ffffff     vmovups xmm0,[rbp-0xb0]
0x19b556c4744d  234d  c4a17a7f440e10       vmovdqu [rsi+r9*1+0x10],xmm0
0x19b556c47454  2354  e906000000           jmp 0x19b556c4745f  <+0x235f>
0x19b556c47459  2359  448b4de0             movl r9,[rbp-0x20]
0x19b556c4745d  235d  33c0                 xorl rax,rax
0x19b556c4745f  235f  418d5110             leal rdx,[r9+0x10]
0x19b556c47463  2363  4c8bd8               REX.W movq r11,rax
0x19b556c47466  2366  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x19b556c4746d  236d  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47471  2371  8b4598               movl rax,[rbp-0x68]
0x19b556c47474  2374  e8c748f2ff           call 0x19b556b6bd40  (jump table)
0x19b556c47479  2379  8b5de0               movl rbx,[rbp-0x20]
0x19b556c4747c  237c  8d4b30               leal rcx,[rbx+0x30]
0x19b556c4747f  237f  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c47483  2383  8b4598               movl rax,[rbp-0x68]
0x19b556c47486  2386  8b5590               movl rdx,[rbp-0x70]
0x19b556c47489  2389  c5fb104d88           vmovsd xmm1,[rbp-0x78]
0x19b556c4748e  238e  c5fb105580           vmovsd xmm2,[rbp-0x80]
0x19b556c47493  2393  448b8d78ffffff       movl r9,[rbp-0x88]
0x19b556c4749a  239a  e8a948f2ff           call 0x19b556b6bd48  (jump table)
0x19b556c4749f  239f  448b5da0             movl r11,[rbp-0x60]
0x19b556c474a3  23a3  443b5dd0             cmpl r11,[rbp-0x30]
0x19b556c474a7  23a7  0f86b1000000         jna 0x19b556c4755e  <+0x245e>
0x19b556c474ad  23ad  8b75d0               movl rsi,[rbp-0x30]
0x19b556c474b0  23b0  448b65a8             movl r12,[rbp-0x58]
0x19b556c474b4  23b4  458d3cb4             leal r15,[r12+rsi*4]
0x19b556c474b8  23b8  448b75e0             movl r14,[rbp-0x20]
0x19b556c474bc  23bc  488b45c8             REX.W movq rax,[rbp-0x38]
0x19b556c474c0  23c0  c4a17a10443040       vmovss xmm0,[rax+r14*1+0x40]
0x19b556c474c7  23c7  c4a17a110438         vmovss [rax+r15*1],xmm0
0x19b556c474cd  23cd  448b7db0             movl r15,[rbp-0x50]
0x19b556c474d1  23d1  418d1cb7             leal rbx,[r15+rsi*4]
0x19b556c474d5  23d5  c4a17a10443044       vmovss xmm0,[rax+r14*1+0x44]
0x19b556c474dc  23dc  c5fa110418           vmovss [rax+rbx*1],xmm0
0x19b556c474e1  23e1  8b5db8               movl rbx,[rbp-0x48]
0x19b556c474e4  23e4  8d14b3               leal rdx,[rbx+rsi*4]
0x19b556c474e7  23e7  c4a17a10443048       vmovss xmm0,[rax+r14*1+0x48]
0x19b556c474ee  23ee  c5fa110410           vmovss [rax+rdx*1],xmm0
0x19b556c474f3  23f3  8b55c0               movl rdx,[rbp-0x40]
0x19b556c474f6  23f6  8d0cb2               leal rcx,[rdx+rsi*4]
0x19b556c474f9  23f9  c4a17a1044304c       vmovss xmm0,[rax+r14*1+0x4c]
0x19b556c47500  2400  c5fa110408           vmovss [rax+rcx*1],xmm0
0x19b556c47505  2405  458bd3               movl r10,r11
0x19b556c47508  2408  4c8bd8               REX.W movq r11,rax
0x19b556c4750b  240b  8bc2                 movl rax,rdx
0x19b556c4750d  240d  418bd2               movl rdx,r10
0x19b556c47510  2410  4489e1               movl rcx,r12
0x19b556c47513  2413  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x19b556c47518  2418  c4c13972f019         vpslld xmm8,xmm8,25
0x19b556c4751e  241e  c4c13972d002         vpsrld xmm8,xmm8,2
0x19b556c47524  2424  c5c857f6             vxorps xmm6,xmm6,xmm6
0x19b556c47528  2428  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x19b556c47530  2430  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x19b556c47538  2438  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x19b556c47540  2440  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x19b556c47548  2448  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x19b556c47550  2450  33ff                 xorl rdi,rdi
0x19b556c47552  2452  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c47559  2459  e959000000           jmp 0x19b556c475b7  <+0x24b7>
0x19b556c4755e  245e  8b75d0               movl rsi,[rbp-0x30]
0x19b556c47561  2461  418bd3               movl rdx,r11
0x19b556c47564  2464  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c47568  2468  8b45c0               movl rax,[rbp-0x40]
0x19b556c4756b  246b  8b5db8               movl rbx,[rbp-0x48]
0x19b556c4756e  246e  8b4da8               movl rcx,[rbp-0x58]
0x19b556c47571  2471  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x19b556c47576  2476  c4c13972f019         vpslld xmm8,xmm8,25
0x19b556c4757c  247c  c4c13972d002         vpsrld xmm8,xmm8,2
0x19b556c47582  2482  c5c857f6             vxorps xmm6,xmm6,xmm6
0x19b556c47586  2486  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x19b556c4758e  248e  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x19b556c47596  2496  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x19b556c4759e  249e  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x19b556c475a6  24a6  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x19b556c475ae  24ae  33ff                 xorl rdi,rdi
0x19b556c475b0  24b0  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c475b7  24b7  83c601               addl rsi,0x1
0x19b556c475ba  24ba  448b7dd8             movl r15,[rbp-0x28]
0x19b556c475be  24be  443bfe               cmpl r15,rsi
0x19b556c475c1  24c1  0f8579e3ffff         jnz 0x19b556c45940  <+0x840>
0x19b556c475c7  24c7  448b5de0             movl r11,[rbp-0x20]
0x19b556c475cb  24cb  4181c300020000       addl r11,0x200
0x19b556c475d2  24d2  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x19b556c475d6  24d6  45891c24             movl [r12],r11
0x19b556c475da  24da  488be5               REX.W movq rsp,rbp
0x19b556c475dd  24dd  5d                   pop rbp
0x19b556c475de  24de  c3                   retl
0x19b556c475df  24df  e8ec4ef2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c475e4  24e4  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c475e8  24e8  488b75f0             REX.W movq rsi,[rbp-0x10]
0x19b556c475ec  24ec  8b45d8               movl rax,[rbp-0x28]
0x19b556c475ef  24ef  e930dbffff           jmp 0x19b556c45124  <+0x24>
0x19b556c475f4  24f4  c5f92eff             vucomisd xmm7,xmm7
0x19b556c475f8  24f8  0f8b0a000000         jpo 0x19b556c47608  <+0x2508>
0x19b556c475fe  24fe  33d2                 xorl rdx,rdx
0x19b556c47600  2500  4c8bf2               REX.W movq r14,rdx
0x19b556c47603  2503  e996dcffff           jmp 0x19b556c4529e  <+0x19e>
0x19b556c47608  2508  c5c057ff             vxorps xmm7,xmm7,xmm7
0x19b556c4760c  250c  c5f82efe             vucomiss xmm7,xmm6
0x19b556c47610  2510  0f870b000000         ja 0x19b556c47621  <+0x2521>
0x19b556c47616  2516  41beffffffff         movl r14,0xffffffff
0x19b556c4761c  251c  e97ddcffff           jmp 0x19b556c4529e  <+0x19e>
0x19b556c47621  2521  4533f6               xorl r14,r14
0x19b556c47624  2524  e975dcffff           jmp 0x19b556c4529e  <+0x19e>
0x19b556c47629  2529  c441792ec0           vucomisd xmm8,xmm8
0x19b556c4762e  252e  0f8b08000000         jpo 0x19b556c4763c  <+0x253c>
0x19b556c47634  2534  4533f6               xorl r14,r14
0x19b556c47637  2537  e9c9dcffff           jmp 0x19b556c45305  <+0x205>
0x19b556c4763c  253c  c4413857c0           vxorps xmm8,xmm8,xmm8
0x19b556c47641  2541  c5782ec7             vucomiss xmm8,xmm7
0x19b556c47645  2545  77ed                 ja 0x19b556c47634  <+0x2534>
0x19b556c47647  2547  41beffffffff         movl r14,0xffffffff
0x19b556c4764d  254d  e9b3dcffff           jmp 0x19b556c45305  <+0x205>
0x19b556c47652  2552  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c4765a  255a  4c8945a8             REX.W movq [rbp-0x58],r8
0x19b556c4765e  255e  48897da0             REX.W movq [rbp-0x60],rdi
0x19b556c47662  2562  e8694ef2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c47667  2567  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c4766b  256b  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c47672  2572  448b7dd8             movl r15,[rbp-0x28]
0x19b556c47676  2576  8b7da0               movl rdi,[rbp-0x60]
0x19b556c47679  2579  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c47681  2581  8b75b0               movl rsi,[rbp-0x50]
0x19b556c47684  2584  8b4db8               movl rcx,[rbp-0x48]
0x19b556c47687  2587  8b5dc0               movl rbx,[rbp-0x40]
0x19b556c4768a  258a  448b45a8             movl r8,[rbp-0x58]
0x19b556c4768e  258e  e9b7ddffff           jmp 0x19b556c4544a  <+0x34a>
0x19b556c47693  2593  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c4769b  259b  48894db8             REX.W movq [rbp-0x48],rcx
0x19b556c4769f  259f  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c476a3  25a3  e8284ef2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c476a8  25a8  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c476ac  25ac  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c476b3  25b3  448b7dd8             movl r15,[rbp-0x28]
0x19b556c476b7  25b7  8b55c0               movl rdx,[rbp-0x40]
0x19b556c476ba  25ba  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c476c2  25c2  8b5da0               movl rbx,[rbp-0x60]
0x19b556c476c5  25c5  8b45a8               movl rax,[rbp-0x58]
0x19b556c476c8  25c8  448b75b0             movl r14,[rbp-0x50]
0x19b556c476cc  25cc  8b4db8               movl rcx,[rbp-0x48]
0x19b556c476cf  25cf  e976deffff           jmp 0x19b556c4554a  <+0x44a>
0x19b556c476d4  25d4  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c476dc  25dc  48894da8             REX.W movq [rbp-0x58],rcx
0x19b556c476e0  25e0  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c476e4  25e4  e8e74df2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c476e9  25e9  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c476ed  25ed  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c476f4  25f4  448b7dd8             movl r15,[rbp-0x28]
0x19b556c476f8  25f8  8b55c0               movl rdx,[rbp-0x40]
0x19b556c476fb  25fb  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c47703  2603  8b5db8               movl rbx,[rbp-0x48]
0x19b556c47706  2606  8b8560ffffff         movl rax,[rbp-0xa0]
0x19b556c4770c  260c  448b75a0             movl r14,[rbp-0x60]
0x19b556c47710  2610  8b4da8               movl rcx,[rbp-0x58]
0x19b556c47713  2613  e932dfffff           jmp 0x19b556c4564a  <+0x54a>
0x19b556c47718  2618  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x19b556c47720  2620  48895d98             REX.W movq [rbp-0x68],rbx
0x19b556c47724  2624  488955c0             REX.W movq [rbp-0x40],rdx
0x19b556c47728  2628  e8a34df2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c4772d  262d  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c47731  2631  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c47738  2638  8b55c0               movl rdx,[rbp-0x40]
0x19b556c4773b  263b  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x19b556c47743  2643  448b7dd8             movl r15,[rbp-0x28]
0x19b556c47747  2647  8b45b8               movl rax,[rbp-0x48]
0x19b556c4774a  264a  448b75b0             movl r14,[rbp-0x50]
0x19b556c4774e  264e  8b5d98               movl rbx,[rbp-0x68]
0x19b556c47751  2651  e9f4dfffff           jmp 0x19b556c4574a  <+0x64a>
0x19b556c47756  2656  488975d0             REX.W movq [rbp-0x30],rsi
0x19b556c4775a  265a  e8714df2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c4775f  265f  8b75d0               movl rsi,[rbp-0x30]
0x19b556c47762  2662  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x19b556c47766  2666  8b45c0               movl rax,[rbp-0x40]
0x19b556c47769  2669  8b5db8               movl rbx,[rbp-0x48]
0x19b556c4776c  266c  8b4da8               movl rcx,[rbp-0x58]
0x19b556c4776f  266f  8b55a0               movl rdx,[rbp-0x60]
0x19b556c47772  2672  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x19b556c47777  2677  c4c13972f019         vpslld xmm8,xmm8,25
0x19b556c4777d  267d  c4c13972d002         vpsrld xmm8,xmm8,2
0x19b556c47783  2683  c5c857f6             vxorps xmm6,xmm6,xmm6
0x19b556c47787  2687  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x19b556c4778f  268f  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x19b556c47797  2697  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x19b556c4779f  269f  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x19b556c477a7  26a7  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x19b556c477af  26af  33ff                 xorl rdi,rdi
0x19b556c477b1  26b1  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x19b556c477b8  26b8  e98de1ffff           jmp 0x19b556c4594a  <+0x84a>
0x19b556c477bd  26bd  c5f92eed             vucomisd xmm5,xmm5
0x19b556c477c1  26c1  0f8b08000000         jpo 0x19b556c477cf  <+0x26cf>
0x19b556c477c7  26c7  4533db               xorl r11,r11
0x19b556c477ca  26ca  e9b0e3ffff           jmp 0x19b556c45b7f  <+0xa7f>
0x19b556c477cf  26cf  c5f82ee3             vucomiss xmm4,xmm3
0x19b556c477d3  26d3  77f2                 ja 0x19b556c477c7  <+0x26c7>
0x19b556c477d5  26d5  41bbffffffff         movl r11,0xffffffff
0x19b556c477db  26db  e99fe3ffff           jmp 0x19b556c45b7f  <+0xa7f>
0x19b556c477e0  26e0  c5f92ef6             vucomisd xmm6,xmm6
0x19b556c477e4  26e4  0f8b08000000         jpo 0x19b556c477f2  <+0x26f2>
0x19b556c477ea  26ea  4533db               xorl r11,r11
0x19b556c477ed  26ed  e97de4ffff           jmp 0x19b556c45c6f  <+0xb6f>
0x19b556c477f2  26f2  c5f82ee3             vucomiss xmm4,xmm3
0x19b556c477f6  26f6  77f2                 ja 0x19b556c477ea  <+0x26ea>
0x19b556c477f8  26f8  41bbffffffff         movl r11,0xffffffff
0x19b556c477fe  26fe  e96ce4ffff           jmp 0x19b556c45c6f  <+0xb6f>
0x19b556c47803  2703  c578118dc0fdffff     vmovups [rbp-0x240],xmm9
0x19b556c4780b  270b  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x19b556c47813  2713  c578119d20fcffff     vmovups [rbp-0x3e0],xmm11
0x19b556c4781b  271b  c57811a510fcffff     vmovups [rbp-0x3f0],xmm12
0x19b556c47823  2723  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x19b556c4782b  272b  c57811b5f0fbffff     vmovups [rbp-0x410],xmm14
0x19b556c47833  2733  c5f8118de0fbffff     vmovups [rbp-0x420],xmm1
0x19b556c4783b  273b  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x19b556c47843  2743  e8884cf2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c47848  2748  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x19b556c4784c  274c  448bb578ffffff       movl r14,[rbp-0x88]
0x19b556c47853  2753  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x19b556c4785b  275b  448bbd90feffff       movl r15,[rbp-0x170]
0x19b556c47862  2762  448b8de0fdffff       movl r9,[rbp-0x220]
0x19b556c47869  2769  8b8dd0fdffff         movl rcx,[rbp-0x230]
0x19b556c4786f  276f  33c0                 xorl rax,rax
0x19b556c47871  2771  c578108dc0fdffff     vmovups xmm9,[rbp-0x240]
0x19b556c47879  2779  c578109530fcffff     vmovups xmm10,[rbp-0x3d0]
0x19b556c47881  2781  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x19b556c47889  2789  c57810a510fcffff     vmovups xmm12,[rbp-0x3f0]
0x19b556c47891  2791  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x19b556c47899  2799  c57810b5f0fbffff     vmovups xmm14,[rbp-0x410]
0x19b556c478a1  27a1  c5f8108de0fbffff     vmovups xmm1,[rbp-0x420]
0x19b556c478a9  27a9  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x19b556c478b1  27b1  8b9578fcffff         movl rdx,[rbp-0x388]
0x19b556c478b7  27b7  8bbd70fcffff         movl rdi,[rbp-0x390]
0x19b556c478bd  27bd  448b8568fcffff       movl r8,[rbp-0x398]
0x19b556c478c4  27c4  448b9d60fcffff       movl r11,[rbp-0x3a0]
0x19b556c478cb  27cb  8b9d58fcffff         movl rbx,[rbp-0x3a8]
0x19b556c478d1  27d1  e95ae7ffff           jmp 0x19b556c46030  <+0xf30>
0x19b556c478d6  27d6  48898da0feffff       REX.W movq [rbp-0x160],rcx
0x19b556c478dd  27dd  4c89bde8fcffff       REX.W movq [rbp-0x318],r15
0x19b556c478e4  27e4  488995e0fcffff       REX.W movq [rbp-0x320],rdx
0x19b556c478eb  27eb  48899dd8fcffff       REX.W movq [rbp-0x328],rbx
0x19b556c478f2  27f2  e8d94bf2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c478f7  27f7  448b4de0             movl r9,[rbp-0x20]
0x19b556c478fb  27fb  488b75c8             REX.W movq rsi,[rbp-0x38]
0x19b556c478ff  27ff  448b9d28ffffff       movl r11,[rbp-0xd8]
0x19b556c47906  2806  448ba518ffffff       movl r12,[rbp-0xe8]
0x19b556c4790d  280d  8b8da0feffff         movl rcx,[rbp-0x160]
0x19b556c47913  2813  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x19b556c4791b  281b  448bbde8fcffff       movl r15,[rbp-0x318]
0x19b556c47922  2822  8b95e0fcffff         movl rdx,[rbp-0x320]
0x19b556c47928  2828  448b85d0fcffff       movl r8,[rbp-0x330]
0x19b556c4792f  282f  8b9dd8fcffff         movl rbx,[rbp-0x328]
0x19b556c47935  2835  e92eeaffff           jmp 0x19b556c46368  <+0x1268>
0x19b556c4793a  283a  4c89a528ffffff       REX.W movq [rbp-0xd8],r12
0x19b556c47941  2841  4c89b520ffffff       REX.W movq [rbp-0xe0],r14
0x19b556c47948  2848  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x19b556c4794f  284f  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x19b556c47956  2856  48899d18ffffff       REX.W movq [rbp-0xe8],rbx
0x19b556c4795d  285d  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x19b556c47965  2865  e8664bf2ff           call 0x19b556b6c4d0  (jump table)
0x19b556c4796a  286a  448b4de0             movl r9,[rbp-0x20]
0x19b556c4796e  286e  488b75c8             REX.W movq rsi,[rbp-0x38]
0x19b556c47972  2872  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x19b556c4797a  287a  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x19b556c47982  2882  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x19b556c4798a  288a  c57810ad40fdffff     vmovups xmm13,[rbp-0x2c0]
0x19b556c47992  2892  448ba528ffffff       movl r12,[rbp-0xd8]
0x19b556c47999  2899  448bb520ffffff       movl r14,[rbp-0xe0]
0x19b556c479a0  28a0  8b95f0feffff         movl rdx,[rbp-0x110]
0x19b556c479a6  28a6  448b9de8feffff       movl r11,[rbp-0x118]
0x19b556c479ad  28ad  8b9d18ffffff         movl rbx,[rbp-0xe8]
0x19b556c479b3  28b3  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x19b556c479bb  28bb  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x19b556c479bf  28bf  c5c972f619           vpslld xmm6,xmm6,25
0x19b556c479c4  28c4  c5c972d602           vpsrld xmm6,xmm6,2
0x19b556c479c9  28c9  c5d857e4             vxorps xmm4,xmm4,xmm4
0x19b556c479cd  28cd  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x19b556c479d5  28d5  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x19b556c479dd  28dd  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x19b556c479e5  28e5  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x19b556c479ed  28ed  448bbdd0fdffff       movl r15,[rbp-0x230]
0x19b556c479f4  28f4  33c0                 xorl rax,rax
0x19b556c479f6  28f6  e91ff9ffff           jmp 0x19b556c4731a  <+0x221a>
0x19b556c479fb  28fb  e81048f2ff           call 0x19b556b6c210  (jump table)
0x19b556c47a00  2900  90                   nop
0x19b556c47a01  2901  0f1f00               nop

Protected instructions:
 pc offset
        41         
        62         
       11d         
       25f         
       265         
       26d         
       272         
       27a         
       283         
       288         
       28d         
       292         
       2bc         
       2d0         
       2d5         
       2e1         
       2e6         
       357         
       368         
       399         
       3ed         
       3f2         
       3fa         
       408         
       411         
       416         
       456         
       465         
       492         
       4e0         
       4e5         
       4ed         
       4fa         
       503         
       508         
       556         
       565         
       592         
       5e3         
       5e8         
       5f0         
       5fd         
       606         
       60b         
       656         
       665         
       692         
       6de         
       6e3         
       6eb         
       6f8         
       6fd         
       704         
       70a         
       711         
       717         
       71e         
       725         
       72c         
       731         
       738         
       73d         
       742         
       749         
       750         
       755         
       75a         
       75f         
       7c9         
       84a         
       85f         
       874         
       889         
       89e         
       8a7         
       8ad         
       8bd         
       8c3         
       8d3         
       8d9         
       8f0         
       8fa         
       901         
       908         
       90f         
       915         
       91e         
       92c         
       933         
       942         
       94a         
       be2         
       be7         
       bf0         
       bfa         
       c04         
       c0e         
       c18         
       c1f         
       c29         
       c33         
       c3d         
       c47         
       c51         
       c5b         
       c6a         
       c7c         
       c8e         
       ca0         
       cb2         
       cc4         
       cd6         
       ce5         
       cf7         
       d09         
       d1b         
       d2d         
       d3f         
       d51         
       d60         
       d72         
       f56         
       f5e         
      126b         
      1274         
      127d         
      128c         
      12da         
      12f4         
      133e         
      1360         
      137b         
      1396         
      13b0         
      13bb         
      13c5         
      13d7         
      13f5         
      143b         
      1457         
      148e         
      14a9         
      14c4         
      14df         
      14f9         
      1504         
      150e         
      1520         
      153e         
      1595         
      15b1         
      15ec         
      1608         
      1624         
      1640         
      165b         
      1666         
      1670         
      1682         
      1698         
      16e5         
      1700         
      1736         
      1751         
      176c         
      1787         
      17a1         
      18e2         
      18f1         
      1901         
      19c6         
      1a14         
      1a27         
      1a6d         
      1a7f         
      1a92         
      1ab5         
      1ad8         
      1adf         
      1ae5         
      1aec         
      1ba0         
      1bf4         
      1c10         
      1c55         
      1c70         
      1c8b         
      1ca6         
      1cc0         
      1cc7         
      1ccd         
      1cd4         
      1d81         
      1dd6         
      1df2         
      1e3c         
      1e57         
      1e72         
      1e8d         
      1ea7         
      1eae         
      1eb4         
      1ebb         
      1f57         
      1fbc         
      1fd8         
      2022         
      203d         
      2058         
      2073         
      208e         
      221a         
      2228         
      2265         
      2270         
      2320         
      232f         
      233e         
      234d         
      23c0         
      23c7         
      23d5         
      23dc         
      23e7         
      23ee         
      23f9         
      2400         

Source positions:
 pc offset  position
        41        78
        62       115
       11d       184
       25f       297
       265       307
       26d       311
       272       318
       27a       322
       283       333
       288       338
       28d       343
       292       348
       297       351
       2b1       365
       2d0       378
       2d5       385
       2e1       397
       2e6       404
       357       446
       368       475
       399       504
       3a9       516
       3ed       532
       3f2       537
       3fa       548
       408       567
       411       572
       416       579
       456       621
       465       650
       492       679
       4a2       691
       4e0       707
       4e5       712
       4ed       723
       4fa       742
       503       747
       508       754
       556       797
       565       826
       592       855
       5a2       867
       5e3       883
       5e8       888
       5f0       899
       5fd       918
       606       923
       60b       930
       656       969
       665       998
       692      1027
       6a2      1039
       6de      1055
       6e3      1060
       6eb      1071
       6f8      1084
       6fd      1091
       704      1101
       70a      1107
       711      1115
       717      1121
       71e      1131
       725      1137
       72c      1143
       731      1152
       738      1158
       73d      1165
       742      1174
       749      1180
       750      1188
       755      1193
       75a      1202
       75f      1209
       7c9      1289
       84a      1327
       85f      1339
       874      1351
       889      1363
       89e      1373
       8a7      1386
       8ad      1393
       8bd      1401
       8c3      1408
       8d3      1416
       8d9      1425
       8e9      1433
       8f6      1436
       901      1443
       908      1450
       90f      1457
       915      1464
       91e      1471
       92c      1494
       933      1500
       93b      1508
       94a      1516
       958      1533
       bd7      1772
       be7      1779
       bec      1793
       bfa      1802
       c04      1811
       c0e      1820
       c18      1829
       c1f      1837
       c29      1846
       c33      1855
       c3d      1864
       c47      1873
       c51      1882
       c5b      1891
       c62      1899
       c74      1908
       c86      1917
       c98      1926
       caa      1935
       cbc      1944
       cce      1953
       cdd      1961
       cef      1970
       d01      1979
       d13      1988
       d25      1997
       d37      2006
       d49      2015
       d58      2023
       d6a      2032
       f56      2134
       f5e      2147
      126b      2443
      1274      2456
      127d      2475
      128c      2495
      12da      2544
      12f4      2565
      133e      2628
      1360      2649
      137b      2670
      1396      2691
      13b0      2712
      13bb      2721
      13c5      2732
      13cf      2749
      13ed      2767
      143b      2816
      1457      2837
      148e      2882
      14a9      2903
      14c4      2924
      14df      2945
      14f9      2966
      1504      2975
      150e      2986
      1518      3003
      1536      3021
      1595      3070
      15b1      3091
      15ec      3136
      1608      3157
      1624      3178
      1640      3199
      165b      3220
      1666      3229
      1670      3240
      167a      3257
      1698      3275
      16e5      3324
      1700      3345
      1736      3390
      1751      3411
      176c      3432
      1787      3453
      17a1      3474
      18e2      3552
      18f1      3565
      1901      3582
      19c6      3667
      1a14      3720
      1a27      3741
      1a6d      3818
      1a7f      3839
      1a92      3860
      1ab5      3881
      1ad8      3902
      1adf      3908
      1ae5      3916
      1aec      3928
      1ba0      3991
      1bf4      4044
      1c10      4065
      1c55      4124
      1c70      4145
      1c8b      4166
      1ca6      4187
      1cc0      4208
      1cc7      4214
      1ccd      4222
      1cd4      4234
      1d81      4297
      1dd6      4350
      1df2      4371
      1e3c      4430
      1e57      4451
      1e72      4472
      1e8d      4493
      1ea7      4514
      1eae      4520
      1eb4      4528
      1ebb      4540
      1f57      4603
      1fbc      4656
      1fd8      4677
      2022      4736
      203d      4757
      2058      4778
      2073      4799
      208e      4820
      221a      4911
      2228      4926
      2265      4977
      2270      4985
      2318      5086
      2327      5093
      2336      5100
      2345      5107
      2363      5123
      237f      5153
      23b8      5173
      23c7      5176
      23d5      5186
      23dc      5189
      23e7      5199
      23ee      5202
      23f9      5212
      2400      5215
      24df         0
      2552       420
      2593       595
      25d4       771
      2618       943
      2656      1319
      2703      2071
      27d6      2434
      283a      4901
      28fb      1533

Safepoints (stack slots = 136, entries = 1, byte size = 31)
0x19b556c453b1    2b1  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 58)
0x19b556c453ad  internal wasm call
0x19b556c454be  internal wasm call
0x19b556c455b2  internal wasm call
0x19b556c456b2  internal wasm call
0x19b556c457b3  internal wasm call
0x19b556c45aa3  external reference (0x193f2f0)
0x19b556c47475  internal wasm call
0x19b556c4749b  internal wasm call
0x19b556c475e0  wasm stub call  (0x19b556b6c4d0)
0x19b556c47663  wasm stub call  (0x19b556b6c4d0)
0x19b556c476a4  wasm stub call  (0x19b556b6c4d0)
0x19b556c476e5  wasm stub call  (0x19b556b6c4d0)
0x19b556c47729  wasm stub call  (0x19b556b6c4d0)
0x19b556c4775b  wasm stub call  (0x19b556b6c4d0)
0x19b556c47844  wasm stub call  (0x19b556b6c4d0)
0x19b556c478f3  wasm stub call  (0x19b556b6c4d0)
0x19b556c47966  wasm stub call  (0x19b556b6c4d0)
0x19b556c479fc  wasm stub call  (0x19b556b6c210)
