name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 10880 = 10844 + 36 padding)
Instructions (size = 10812)
0x3b29a858d340     0  55                   push rbp
0x3b29a858d341     1  4889e5               REX.W movq rbp,rsp
0x3b29a858d344     4  6a08                 push 0x8
0x3b29a858d346     6  56                   push rsi
0x3b29a858d347     7  4881ec00040000       REX.W subq rsp,0x400
0x3b29a858d34e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3b29a858d352    12  488945d8             REX.W movq [rbp-0x28],rax
0x3b29a858d356    16  4c895dc8             REX.W movq [rbp-0x38],r11
0x3b29a858d35a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858d35e    1e  0f86fb250000         jna 0x3b29a858f95f  <+0x261f>
0x3b29a858d364    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x3b29a858d368    28  458b3c24             movl r15,[r12]
0x3b29a858d36c    2c  418d9f00feffff       leal rbx,[r15-0x200]
0x3b29a858d373    33  41891c24             movl [r12],rbx
0x3b29a858d377    37  448bf8               movl r15,rax
0x3b29a858d37a    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x3b29a858d381    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x3b29a858d387    47  c5fa16d0             vmovshdup xmm2,xmm0
0x3b29a858d38b    4b  41ba0000803a         movl r10,0x3a800000
0x3b29a858d391    51  c4c1796eda           vmovd xmm3,r10
0x3b29a858d396    56  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x3b29a858d39a    5a  c5f828c8             vmovaps xmm1,xmm0
0x3b29a858d39e    5e  c5e259d9             vmulss xmm3,xmm3,xmm1
0x3b29a858d3a2    62  c4817a10ac3ba0000000 vmovss xmm5,[r11+r15*1+0xa0]
0x3b29a858d3ac    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x3b29a858d3b0    70  48895de0             REX.W movq [rbp-0x20],rbx
0x3b29a858d3b4    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x3b29a858d3bb    7b  c5fb115580           vmovsd [rbp-0x80],xmm2
0x3b29a858d3c0    80  c5fb114d88           vmovsd [rbp-0x78],xmm1
0x3b29a858d3c5    85  c5f82eed             vucomiss xmm5,xmm5
0x3b29a858d3c9    89  7a06                 jpe 0x3b29a858d3d1  <+0x91>
0x3b29a858d3cb    8b  0f8404000000         jz 0x3b29a858d3d5  <+0x95>
0x3b29a858d3d1    91  c5f928eb             vmovapd xmm5,xmm3
0x3b29a858d3d5    95  c5f82edb             vucomiss xmm3,xmm3
0x3b29a858d3d9    99  7a06                 jpe 0x3b29a858d3e1  <+0xa1>
0x3b29a858d3db    9b  0f8404000000         jz 0x3b29a858d3e5  <+0xa5>
0x3b29a858d3e1    a1  c5f928dd             vmovapd xmm3,xmm5
0x3b29a858d3e5    a5  c5f82eeb             vucomiss xmm5,xmm3
0x3b29a858d3e9    a9  0f8704000000         ja 0x3b29a858d3f3  <+0xb3>
0x3b29a858d3ef    af  c5f928eb             vmovapd xmm5,xmm3
0x3b29a858d3f3    b3  c5f82eed             vucomiss xmm5,xmm5
0x3b29a858d3f7    b7  7a06                 jpe 0x3b29a858d3ff  <+0xbf>
0x3b29a858d3f9    b9  0f8409000000         jz 0x3b29a858d408  <+0xc8>
0x3b29a858d3ff    bf  c5f928dc             vmovapd xmm3,xmm4
0x3b29a858d403    c3  e904000000           jmp 0x3b29a858d40c  <+0xcc>
0x3b29a858d408    c8  c5f928dd             vmovapd xmm3,xmm5
0x3b29a858d40c    cc  c5f82ee4             vucomiss xmm4,xmm4
0x3b29a858d410    d0  7a06                 jpe 0x3b29a858d418  <+0xd8>
0x3b29a858d412    d2  0f8404000000         jz 0x3b29a858d41c  <+0xdc>
0x3b29a858d418    d8  c5f928e3             vmovapd xmm4,xmm3
0x3b29a858d41c    dc  c5f82edc             vucomiss xmm3,xmm4
0x3b29a858d420    e0  0f8704000000         ja 0x3b29a858d42a  <+0xea>
0x3b29a858d426    e6  c5f928dc             vmovapd xmm3,xmm4
0x3b29a858d42a    ea  41ba0020803f         movl r10,0x3f802000
0x3b29a858d430    f0  c4c1796ee2           vmovd xmm4,r10
0x3b29a858d435    f5  c5da59db             vmulss xmm3,xmm4,xmm3
0x3b29a858d439    f9  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x3b29a858d43d    fd  c5d972f419           vpslld xmm4,xmm4,25
0x3b29a858d442   102  c5d972d402           vpsrld xmm4,xmm4,2
0x3b29a858d447   107  c5da5edb             vdivss xmm3,xmm4,xmm3
0x3b29a858d44b   10b  c5f828db             vmovaps xmm3,xmm3
0x3b29a858d44f   10f  c4817a119c3b84000000 vmovss [r11+r15*1+0x84],xmm3
0x3b29a858d459   119  c4e27918eb           vbroadcastss xmm5,xmm3
0x3b29a858d45e   11e  c5f859c5             vmulps xmm0,xmm0,xmm5
0x3b29a858d462   122  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x3b29a858d468   128  c5f828e8             vmovaps xmm5,xmm0
0x3b29a858d46c   12c  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0x3b29a858d470   130  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x3b29a858d476   136  c57b2cf7             vcvttsd2si r14,xmm7
0x3b29a858d47a   13a  4585f6               testl r14,r14
0x3b29a858d47d   13d  0f892a000000         jns 0x3b29a858d4ad  <+0x16d>
0x3b29a858d483   143  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3b29a858d48d   14d  c441f96efa           vmovq xmm15,r10
0x3b29a858d492   152  c50358ff             vaddsd xmm15,xmm15,xmm7
0x3b29a858d496   156  c4417b2cf7           vcvttsd2si r14,xmm15
0x3b29a858d49b   15b  4585f6               testl r14,r14
0x3b29a858d49e   15e  0f8809000000         js 0x3b29a858d4ad  <+0x16d>
0x3b29a858d4a4   164  41ba00000080         movl r10,0x80000000
0x3b29a858d4aa   16a  450bf2               orl r14,r10
0x3b29a858d4ad   16d  458bd6               movl r10,r14
0x3b29a858d4b0   170  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x3b29a858d4b5   175  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858d4bd   17d  c5792ec7             vucomisd xmm8,xmm7
0x3b29a858d4c1   181  0f8aad240000         jpe 0x3b29a858f974  <+0x2634>
0x3b29a858d4c7   187  0f85a7240000         jnz 0x3b29a858f974  <+0x2634>
0x3b29a858d4cd   18d  c4c1796eee           vmovd xmm5,r14
0x3b29a858d4d2   192  c5f970ed00           vpshufd xmm5,xmm5,0x0
0x3b29a858d4d7   197  c5fa16f0             vmovshdup xmm6,xmm0
0x3b29a858d4db   19b  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x3b29a858d4df   19f  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x3b29a858d4e5   1a5  c4417b2cf0           vcvttsd2si r14,xmm8
0x3b29a858d4ea   1aa  4585f6               testl r14,r14
0x3b29a858d4ed   1ad  0f8928000000         jns 0x3b29a858d51b  <+0x1db>
0x3b29a858d4f3   1b3  4c8b158bffffff       REX.W movq r10,[rip+0xffffff8b]
0x3b29a858d4fa   1ba  c441f96efa           vmovq xmm15,r10
0x3b29a858d4ff   1bf  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x3b29a858d504   1c4  c4417b2cf7           vcvttsd2si r14,xmm15
0x3b29a858d509   1c9  4585f6               testl r14,r14
0x3b29a858d50c   1cc  0f8809000000         js 0x3b29a858d51b  <+0x1db>
0x3b29a858d512   1d2  41ba00000080         movl r10,0x80000000
0x3b29a858d518   1d8  450bf2               orl r14,r10
0x3b29a858d51b   1db  458bd6               movl r10,r14
0x3b29a858d51e   1de  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x3b29a858d523   1e3  c441792ec8           vucomisd xmm9,xmm8
0x3b29a858d528   1e8  0f8a7b240000         jpe 0x3b29a858f9a9  <+0x2669>
0x3b29a858d52e   1ee  0f8575240000         jnz 0x3b29a858f9a9  <+0x2669>
0x3b29a858d534   1f4  c4c35122ee01         vpinsrd xmm5,xmm5,r14,0x1
0x3b29a858d53a   1fa  49ba0100000001000000 REX.W movq r10,0x100000001
0x3b29a858d544   204  c4c1f96ef2           vmovq xmm6,r10
0x3b29a858d549   209  c5c96cf6             vpunpcklqdq xmm6,xmm6,xmm6
0x3b29a858d54d   20d  c4e2513fee           vpmaxud xmm5,xmm5,xmm6
0x3b29a858d552   212  c5c1efff             vpxor xmm7,xmm7,xmm7
0x3b29a858d556   216  c540c2c002           vcmpps xmm8,xmm7,xmm0, (le)
0x3b29a858d55b   21b  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x3b29a858d565   225  c441f96eca           vmovq xmm9,r10
0x3b29a858d56a   22a  c441316cc9           vpunpcklqdq xmm9,xmm9,xmm9
0x3b29a858d56f   22f  c4c178c2c101         vcmpps xmm0,xmm0,xmm9, (lt)
0x3b29a858d575   235  c5b9dbc0             vpand xmm0,xmm8,xmm0
0x3b29a858d579   239  c579dffe             vpandn xmm15,xmm0,xmm6
0x3b29a858d57d   23d  c5d1dbc0             vpand xmm0,xmm5,xmm0
0x3b29a858d581   241  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x3b29a858d586   246  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x3b29a858d58d   24d  c4817813043e         vmovlps [r14+r15*1],xmm0
0x3b29a858d593   253  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x3b29a858d59b   25b  4589741b38           movl [r11+rbx*1+0x38],r14
0x3b29a858d5a0   260  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x3b29a858d5a8   268  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x3b29a858d5ad   26d  448d7060             leal r14,[rax+0x60]
0x3b29a858d5b1   271  438b543b04           movl rdx,[r11+r15*1+0x4]
0x3b29a858d5b6   276  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x3b29a858d5bb   27b  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x3b29a858d5c0   280  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x3b29a858d5c5   285  c5f811b580feffff     vmovups [rbp-0x180],xmm6
0x3b29a858d5cd   28d  c5f811bd60fcffff     vmovups [rbp-0x3a0],xmm7
0x3b29a858d5d5   295  418bc6               movl rax,r14
0x3b29a858d5d8   298  8bdf                 movl rbx,rdi
0x3b29a858d5da   29a  e81967f2ff           call 0x3b29a84b3cf8  (jump table)
0x3b29a858d5df   29f  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858d5e3   2a3  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858d5ea   2aa  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x3b29a858d5f3   2b3  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858d5f7   2b7  418d97a0000000       leal rdx,[r15+0xa0]
0x3b29a858d5fe   2be  478b74237c           movl r14,[r11+r12*1+0x7c]
0x3b29a858d603   2c3  438b842380000000     movl rax,[r11+r12*1+0x80]
0x3b29a858d60b   2cb  418d0486             leal rax,[r14+rax*4]
0x3b29a858d60f   2cf  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x3b29a858d614   2d4  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x3b29a858d619   2d9  418d7730             leal rsi,[r15+0x30]
0x3b29a858d61d   2dd  48895590             REX.W movq [rbp-0x70],rdx
0x3b29a858d621   2e1  4c8975a0             REX.W movq [rbp-0x60],r14
0x3b29a858d625   2e5  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x3b29a858d62c   2ec  48895dc0             REX.W movq [rbp-0x40],rbx
0x3b29a858d630   2f0  48894db8             REX.W movq [rbp-0x48],rcx
0x3b29a858d634   2f4  488975a8             REX.W movq [rbp-0x58],rsi
0x3b29a858d638   2f8  458bc6               movl r8,r14
0x3b29a858d63b   2fb  33ff                 xorl rdi,rdi
0x3b29a858d63d   2fd  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858d645   305  660f1f840000000000   nop
0x3b29a858d64e   30e  660f1f840000000000   nop
0x3b29a858d657   317  660f1f840000000000   nop
0x3b29a858d660   320  660f1f840000000000   nop
0x3b29a858d669   329  660f1f840000000000   nop
0x3b29a858d672   332  660f1f840000000000   nop
0x3b29a858d67b   33b  0f1f440000           nop
0x3b29a858d680   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858d684   344  0f8646230000         jna 0x3b29a858f9d0  <+0x2690>
0x3b29a858d68a   34a  443b8560ffffff       cmpl r8,[rbp-0xa0]
0x3b29a858d691   351  0f8422000000         jz 0x3b29a858d6b9  <+0x379>
0x3b29a858d697   357  478b0c03             movl r9,[r11+r8*1]
0x3b29a858d69b   35b  4183c004             addl r8,0x4
0x3b29a858d69f   35f  413bd9               cmpl rbx,r9
0x3b29a858d6a2   362  76dc                 jna 0x3b29a858d680  <+0x340>
0x3b29a858d6a4   364  468d0c89             leal r9,[rcx+r9*4]
0x3b29a858d6a8   368  c4817a101c0b         vmovss xmm3,[r11+r9*1]
0x3b29a858d6ae   36e  41b901000000         movl r9,0x1
0x3b29a858d6b4   374  e90a000000           jmp 0x3b29a858d6c3  <+0x383>
0x3b29a858d6b9   379  4533c9               xorl r9,r9
0x3b29a858d6bc   37c  448b8560ffffff       movl r8,[rbp-0xa0]
0x3b29a858d6c3   383  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858d6cb   38b  4c8945d0             REX.W movq [rbp-0x30],r8
0x3b29a858d6cf   38f  4183f901             cmpl r9,0x1
0x3b29a858d6d3   393  0f856f000000         jnz 0x3b29a858d748  <+0x408>
0x3b29a858d6d9   399  478b4c2330           movl r9,[r11+r12*1+0x30]
0x3b29a858d6de   39e  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x3b29a858d6e3   3a3  0f8540000000         jnz 0x3b29a858d729  <+0x3e9>
0x3b29a858d6e9   3a9  b901000000           movl rcx,0x1
0x3b29a858d6ee   3ae  48897db0             REX.W movq [rbp-0x50],rdi
0x3b29a858d6f2   3b2  8bc6                 movl rax,rsi
0x3b29a858d6f4   3b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858d6f8   3b8  8bd7                 movl rdx,rdi
0x3b29a858d6fa   3ba  4c8bc9               REX.W movq r9,rcx
0x3b29a858d6fd   3bd  e8fe65f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a858d702   3c2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858d706   3c6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858d70d   3cd  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858d711   3d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858d719   3d9  448b45d0             movl r8,[rbp-0x30]
0x3b29a858d71d   3dd  8b7db0               movl rdi,[rbp-0x50]
0x3b29a858d720   3e0  8b75a8               movl rsi,[rbp-0x58]
0x3b29a858d723   3e3  8b4db8               movl rcx,[rbp-0x48]
0x3b29a858d726   3e6  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858d729   3e9  448d7701             leal r14,[rdi+0x1]
0x3b29a858d72d   3ed  4789742338           movl [r11+r12*1+0x38],r14
0x3b29a858d732   3f2  438b442334           movl rax,[r11+r12*1+0x34]
0x3b29a858d737   3f7  8d04b8               leal rax,[rax+rdi*4]
0x3b29a858d73a   3fa  c4c17a111c03         vmovss [r11+rax*1],xmm3
0x3b29a858d740   400  418bfe               movl rdi,r14
0x3b29a858d743   403  e938ffffff           jmp 0x3b29a858d680  <+0x340>
0x3b29a858d748   408  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x3b29a858d751   411  478b742314           movl r14,[r11+r12*1+0x14]
0x3b29a858d756   416  438b442310           movl rax,[r11+r12*1+0x10]
0x3b29a858d75b   41b  418d5f3c             leal rbx,[r15+0x3c]
0x3b29a858d75f   41f  4c8975b0             REX.W movq [rbp-0x50],r14
0x3b29a858d763   423  488945a8             REX.W movq [rbp-0x58],rax
0x3b29a858d767   427  48895dc0             REX.W movq [rbp-0x40],rbx
0x3b29a858d76b   42b  8b4da0               movl rcx,[rbp-0x60]
0x3b29a858d76e   42e  33d2                 xorl rdx,rdx
0x3b29a858d770   430  660f1f840000000000   nop
0x3b29a858d779   439  0f1f8000000000       nop
0x3b29a858d780   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858d784   444  0f8687220000         jna 0x3b29a858fa11  <+0x26d1>
0x3b29a858d78a   44a  3b8d60ffffff         cmpl rcx,[rbp-0xa0]
0x3b29a858d790   450  0f841f000000         jz 0x3b29a858d7b5  <+0x475>
0x3b29a858d796   456  418b340b             movl rsi,[r11+rcx*1]
0x3b29a858d79a   45a  83c104               addl rcx,0x4
0x3b29a858d79d   45d  443bf6               cmpl r14,rsi
0x3b29a858d7a0   460  76de                 jna 0x3b29a858d780  <+0x440>
0x3b29a858d7a2   462  8d34b0               leal rsi,[rax+rsi*4]
0x3b29a858d7a5   465  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x3b29a858d7ab   46b  be01000000           movl rsi,0x1
0x3b29a858d7b0   470  e908000000           jmp 0x3b29a858d7bd  <+0x47d>
0x3b29a858d7b5   475  33f6                 xorl rsi,rsi
0x3b29a858d7b7   477  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x3b29a858d7bd   47d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858d7c5   485  48894db8             REX.W movq [rbp-0x48],rcx
0x3b29a858d7c9   489  83fe01               cmpl rsi,0x1
0x3b29a858d7cc   48c  0f8568000000         jnz 0x3b29a858d83a  <+0x4fa>
0x3b29a858d7d2   492  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x3b29a858d7d7   497  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x3b29a858d7dc   49c  0f853b000000         jnz 0x3b29a858d81d  <+0x4dd>
0x3b29a858d7e2   4a2  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858d7e6   4a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858d7ea   4aa  8bc3                 movl rax,rbx
0x3b29a858d7ec   4ac  b901000000           movl rcx,0x1
0x3b29a858d7f1   4b1  e80a65f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a858d7f6   4b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858d7fa   4ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858d801   4c1  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858d805   4c5  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858d80d   4cd  8b4db8               movl rcx,[rbp-0x48]
0x3b29a858d810   4d0  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858d813   4d3  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858d816   4d6  8b45a8               movl rax,[rbp-0x58]
0x3b29a858d819   4d9  448b75b0             movl r14,[rbp-0x50]
0x3b29a858d81d   4dd  8d7201               leal rsi,[rdx+0x1]
0x3b29a858d820   4e0  4389742344           movl [r11+r12*1+0x44],rsi
0x3b29a858d825   4e5  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x3b29a858d82a   4ea  8d1497               leal rdx,[rdi+rdx*4]
0x3b29a858d82d   4ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x3b29a858d833   4f3  8bd6                 movl rdx,rsi
0x3b29a858d835   4f5  e946ffffff           jmp 0x3b29a858d780  <+0x440>
0x3b29a858d83a   4fa  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x3b29a858d843   503  478b742320           movl r14,[r11+r12*1+0x20]
0x3b29a858d848   508  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3b29a858d84d   50d  418d5f48             leal rbx,[r15+0x48]
0x3b29a858d851   511  4c897598             REX.W movq [rbp-0x68],r14
0x3b29a858d855   515  488945b8             REX.W movq [rbp-0x48],rax
0x3b29a858d859   519  48895dc0             REX.W movq [rbp-0x40],rbx
0x3b29a858d85d   51d  8b4da0               movl rcx,[rbp-0x60]
0x3b29a858d860   520  33d2                 xorl rdx,rdx
0x3b29a858d862   522  660f1f840000000000   nop
0x3b29a858d86b   52b  660f1f840000000000   nop
0x3b29a858d874   534  660f1f840000000000   nop
0x3b29a858d87d   53d  0f1f00               nop
0x3b29a858d880   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858d884   544  0f86c8210000         jna 0x3b29a858fa52  <+0x2712>
0x3b29a858d88a   54a  3b8d60ffffff         cmpl rcx,[rbp-0xa0]
0x3b29a858d890   550  0f841f000000         jz 0x3b29a858d8b5  <+0x575>
0x3b29a858d896   556  418b340b             movl rsi,[r11+rcx*1]
0x3b29a858d89a   55a  83c104               addl rcx,0x4
0x3b29a858d89d   55d  443bf6               cmpl r14,rsi
0x3b29a858d8a0   560  76de                 jna 0x3b29a858d880  <+0x540>
0x3b29a858d8a2   562  8d34b0               leal rsi,[rax+rsi*4]
0x3b29a858d8a5   565  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x3b29a858d8ab   56b  be01000000           movl rsi,0x1
0x3b29a858d8b0   570  e908000000           jmp 0x3b29a858d8bd  <+0x57d>
0x3b29a858d8b5   575  33f6                 xorl rsi,rsi
0x3b29a858d8b7   577  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x3b29a858d8bd   57d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858d8c5   585  48894db0             REX.W movq [rbp-0x50],rcx
0x3b29a858d8c9   589  83fe01               cmpl rsi,0x1
0x3b29a858d8cc   58c  0f8568000000         jnz 0x3b29a858d93a  <+0x5fa>
0x3b29a858d8d2   592  438b742348           movl rsi,[r11+r12*1+0x48]
0x3b29a858d8d7   597  4339542348           cmpl [r11+r12*1+0x48],rdx
0x3b29a858d8dc   59c  0f853b000000         jnz 0x3b29a858d91d  <+0x5dd>
0x3b29a858d8e2   5a2  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858d8e6   5a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858d8ea   5aa  8bc3                 movl rax,rbx
0x3b29a858d8ec   5ac  b901000000           movl rcx,0x1
0x3b29a858d8f1   5b1  e80a64f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a858d8f6   5b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858d8fa   5ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858d901   5c1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858d909   5c9  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858d90d   5cd  8b4db0               movl rcx,[rbp-0x50]
0x3b29a858d910   5d0  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858d913   5d3  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858d916   5d6  8b45b8               movl rax,[rbp-0x48]
0x3b29a858d919   5d9  448b7598             movl r14,[rbp-0x68]
0x3b29a858d91d   5dd  8d7201               leal rsi,[rdx+0x1]
0x3b29a858d920   5e0  4389742350           movl [r11+r12*1+0x50],rsi
0x3b29a858d925   5e5  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x3b29a858d92a   5ea  8d1497               leal rdx,[rdi+rdx*4]
0x3b29a858d92d   5ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x3b29a858d933   5f3  8bd6                 movl rdx,rsi
0x3b29a858d935   5f5  e946ffffff           jmp 0x3b29a858d880  <+0x540>
0x3b29a858d93a   5fa  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x3b29a858d943   603  478b74232c           movl r14,[r11+r12*1+0x2c]
0x3b29a858d948   608  438b442328           movl rax,[r11+r12*1+0x28]
0x3b29a858d94d   60d  4183c754             addl r15,0x54
0x3b29a858d951   611  4c8975b8             REX.W movq [rbp-0x48],r14
0x3b29a858d955   615  488945c0             REX.W movq [rbp-0x40],rax
0x3b29a858d959   619  4c897dd8             REX.W movq [rbp-0x28],r15
0x3b29a858d95d   61d  33d2                 xorl rdx,rdx
0x3b29a858d95f   61f  8b5da0               movl rbx,[rbp-0x60]
0x3b29a858d962   622  660f1f840000000000   nop
0x3b29a858d96b   62b  660f1f840000000000   nop
0x3b29a858d974   634  660f1f840000000000   nop
0x3b29a858d97d   63d  0f1f00               nop
0x3b29a858d980   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858d984   644  0f8609210000         jna 0x3b29a858fa93  <+0x2753>
0x3b29a858d98a   64a  3b9d60ffffff         cmpl rbx,[rbp-0xa0]
0x3b29a858d990   650  0f841f000000         jz 0x3b29a858d9b5  <+0x675>
0x3b29a858d996   656  418b0c1b             movl rcx,[r11+rbx*1]
0x3b29a858d99a   65a  83c304               addl rbx,0x4
0x3b29a858d99d   65d  443bf1               cmpl r14,rcx
0x3b29a858d9a0   660  76de                 jna 0x3b29a858d980  <+0x640>
0x3b29a858d9a2   662  8d0c88               leal rcx,[rax+rcx*4]
0x3b29a858d9a5   665  c4c17a101c0b         vmovss xmm3,[r11+rcx*1]
0x3b29a858d9ab   66b  b901000000           movl rcx,0x1
0x3b29a858d9b0   670  e908000000           jmp 0x3b29a858d9bd  <+0x67d>
0x3b29a858d9b5   675  33c9                 xorl rcx,rcx
0x3b29a858d9b7   677  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x3b29a858d9bd   67d  48895da0             REX.W movq [rbp-0x60],rbx
0x3b29a858d9c1   681  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858d9c9   689  83f901               cmpl rcx,0x1
0x3b29a858d9cc   68c  0f8566000000         jnz 0x3b29a858da38  <+0x6f8>
0x3b29a858d9d2   692  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x3b29a858d9d7   697  4339542354           cmpl [r11+r12*1+0x54],rdx
0x3b29a858d9dc   69c  0f8539000000         jnz 0x3b29a858da1b  <+0x6db>
0x3b29a858d9e2   6a2  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858d9e6   6a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858d9ea   6aa  418bc7               movl rax,r15
0x3b29a858d9ed   6ad  b901000000           movl rcx,0x1
0x3b29a858d9f2   6b2  e80963f2ff           call 0x3b29a84b3d00  (jump table)
0x3b29a858d9f7   6b7  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858d9fb   6bb  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858da02   6c2  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858da05   6c5  8b5da0               movl rbx,[rbp-0x60]
0x3b29a858da08   6c8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858da10   6d0  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858da14   6d4  8b45c0               movl rax,[rbp-0x40]
0x3b29a858da17   6d7  448b75b8             movl r14,[rbp-0x48]
0x3b29a858da1b   6db  8d4a01               leal rcx,[rdx+0x1]
0x3b29a858da1e   6de  43894c235c           movl [r11+r12*1+0x5c],rcx
0x3b29a858da23   6e3  438b742358           movl rsi,[r11+r12*1+0x58]
0x3b29a858da28   6e8  8d1496               leal rdx,[rsi+rdx*4]
0x3b29a858da2b   6eb  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x3b29a858da31   6f1  8bd1                 movl rdx,rcx
0x3b29a858da33   6f3  e948ffffff           jmp 0x3b29a858d980  <+0x640>
0x3b29a858da38   6f8  478b7c2338           movl r15,[r11+r12*1+0x38]
0x3b29a858da3d   6fd  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x3b29a858da44   704  c4817a6f1c23         vmovdqu xmm3,[r11+r12*1]
0x3b29a858da4a   70a  c4817a7f5c2330       vmovdqu [r11+r12*1+0x30],xmm3
0x3b29a858da51   711  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x3b29a858da57   717  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x3b29a858da5e   71e  c4817a6f642310       vmovdqu xmm4,[r11+r12*1+0x10]
0x3b29a858da65   725  c4817a7f642340       vmovdqu [r11+r12*1+0x40],xmm4
0x3b29a858da6c   72c  478b742310           movl r14,[r11+r12*1+0x10]
0x3b29a858da71   731  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x3b29a858da78   738  4b8b442354           REX.W movq rax,[r11+r12*1+0x54]
0x3b29a858da7d   73d  438b5c2350           movl rbx,[r11+r12*1+0x50]
0x3b29a858da82   742  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x3b29a858da89   749  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x3b29a858da90   750  438954232c           movl [r11+r12*1+0x2c],rdx
0x3b29a858da95   755  438b542320           movl rdx,[r11+r12*1+0x20]
0x3b29a858da9a   75a  43895c2320           movl [r11+r12*1+0x20],rbx
0x3b29a858da9f   75f  4b89442324           REX.W movq [r11+r12*1+0x24],rax
0x3b29a858daa4   764  4c897dd8             REX.W movq [rbp-0x28],r15
0x3b29a858daa8   768  4c8975b0             REX.W movq [rbp-0x50],r14
0x3b29a858daac   76c  4585ff               testl r15,r15
0x3b29a858daaf   76f  0f8516000000         jnz 0x3b29a858dacb  <+0x78b>
0x3b29a858dab5   775  8b5de0               movl rbx,[rbp-0x20]
0x3b29a858dab8   778  448d9b00020000       leal r11,[rbx+0x200]
0x3b29a858dabf   77f  488b45e8             REX.W movq rax,[rbp-0x18]
0x3b29a858dac3   783  448918               movl [rax],r11
0x3b29a858dac6   786  488be5               REX.W movq rsp,rbp
0x3b29a858dac9   789  5d                   pop rbp
0x3b29a858daca   78a  c3                   retl
0x3b29a858dacb   78b  c4e37916c002         vpextrd rax,xmm0,0x2
0x3b29a858dad1   791  c4e37916e303         vpextrd rbx,xmm4,0x3
0x3b29a858dad7   797  c4e37916d901         vpextrd rcx,xmm3,0x1
0x3b29a858dadd   79d  c4e37916c603         vpextrd rsi,xmm0,0x3
0x3b29a858dae3   7a3  c4e37916e701         vpextrd rdi,xmm4,0x1
0x3b29a858dae9   7a9  c4c37916d802         vpextrd r8,xmm3,0x2
0x3b29a858daef   7af  458bc8               movl r9,r8
0x3b29a858daf2   7b2  413bf8               cmpl rdi,r8
0x3b29a858daf5   7b5  440f42cf             cmovcl r9,rdi
0x3b29a858daf9   7b9  418bf9               movl rdi,r9
0x3b29a858dafc   7bc  413bd1               cmpl rdx,r9
0x3b29a858daff   7bf  0f42fa               cmovcl rdi,rdx
0x3b29a858db02   7c2  8bd7                 movl rdx,rdi
0x3b29a858db04   7c4  3bf7                 cmpl rsi,rdi
0x3b29a858db06   7c6  0f42d6               cmovcl rdx,rsi
0x3b29a858db09   7c9  c4817a108423a4000000 vmovss xmm0,[r11+r12*1+0xa4]
0x3b29a858db13   7d3  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x3b29a858db17   7d7  c4e27918d8           vbroadcastss xmm3,xmm0
0x3b29a858db1c   7dc  c4817a10a423a0000000 vmovss xmm4,[r11+r12*1+0xa0]
0x3b29a858db26   7e6  c5da59e4             vmulss xmm4,xmm4,xmm4
0x3b29a858db2a   7ea  c4e27918ec           vbroadcastss xmm5,xmm4
0x3b29a858db2f   7ef  488945c0             REX.W movq [rbp-0x40],rax
0x3b29a858db33   7f3  48895db8             REX.W movq [rbp-0x48],rbx
0x3b29a858db37   7f7  48894da8             REX.W movq [rbp-0x58],rcx
0x3b29a858db3b   7fb  488955a0             REX.W movq [rbp-0x60],rdx
0x3b29a858db3f   7ff  c5fb118508ffffff     vmovsd [rbp-0xf8],xmm0
0x3b29a858db47   807  c5f8119d60feffff     vmovups [rbp-0x1a0],xmm3
0x3b29a858db4f   80f  c5fb11a510ffffff     vmovsd [rbp-0xf0],xmm4
0x3b29a858db57   817  c5f811ad70feffff     vmovups [rbp-0x190],xmm5
0x3b29a858db5f   81f  33ff                 xorl rdi,rdi
0x3b29a858db61   821  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3b29a858db66   826  c4c13972f019         vpslld xmm8,xmm8,25
0x3b29a858db6c   82c  c4c13972d002         vpsrld xmm8,xmm8,2
0x3b29a858db72   832  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3b29a858db76   836  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x3b29a858db7e   83e  488bf7               REX.W movq rsi,rdi
0x3b29a858db81   841  660f1f840000000000   nop
0x3b29a858db8a   84a  660f1f840000000000   nop
0x3b29a858db93   853  660f1f840000000000   nop
0x3b29a858db9c   85c  660f1f840000000000   nop
0x3b29a858dba5   865  660f1f840000000000   nop
0x3b29a858dbae   86e  660f1f840000000000   nop
0x3b29a858dbb7   877  660f1f840000000000   nop
0x3b29a858dbc0   880  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858dbc4   884  0f86071f0000         jna 0x3b29a858fad1  <+0x2791>
0x3b29a858dbca   88a  478b442308           movl r8,[r11+r12*1+0x8]
0x3b29a858dbcf   88f  4c8985f0fdffff       REX.W movq [rbp-0x210],r8
0x3b29a858dbd6   896  443bc6               cmpl r8,rsi
0x3b29a858dbd9   899  0f86581d0000         jna 0x3b29a858f937  <+0x25f7>
0x3b29a858dbdf   89f  478b4c2314           movl r9,[r11+r12*1+0x14]
0x3b29a858dbe4   8a4  4c898da0fcffff       REX.W movq [rbp-0x360],r9
0x3b29a858dbeb   8ab  443bce               cmpl r9,rsi
0x3b29a858dbee   8ae  0f86431d0000         jna 0x3b29a858f937  <+0x25f7>
0x3b29a858dbf4   8b4  478b7c2320           movl r15,[r11+r12*1+0x20]
0x3b29a858dbf9   8b9  4c89bd98fcffff       REX.W movq [rbp-0x368],r15
0x3b29a858dc00   8c0  443bfe               cmpl r15,rsi
0x3b29a858dc03   8c3  0f862e1d0000         jna 0x3b29a858f937  <+0x25f7>
0x3b29a858dc09   8c9  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3b29a858dc0e   8ce  4c89bda8fcffff       REX.W movq [rbp-0x358],r15
0x3b29a858dc15   8d5  443bfe               cmpl r15,rsi
0x3b29a858dc18   8d8  0f86191d0000         jna 0x3b29a858f937  <+0x25f7>
0x3b29a858dc1e   8de  478b7c2304           movl r15,[r11+r12*1+0x4]
0x3b29a858dc23   8e3  458d34b7             leal r14,[r15+rsi*4]
0x3b29a858dc27   8e7  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x3b29a858dc2d   8ed  478b742310           movl r14,[r11+r12*1+0x10]
0x3b29a858dc32   8f2  4c89bd90feffff       REX.W movq [rbp-0x170],r15
0x3b29a858dc39   8f9  458d3cb6             leal r15,[r14+rsi*4]
0x3b29a858dc3d   8fd  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x3b29a858dc43   903  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3b29a858dc48   908  4c89b510feffff       REX.W movq [rbp-0x1f0],r14
0x3b29a858dc4f   90f  458d34b7             leal r14,[r15+rsi*4]
0x3b29a858dc53   913  c4017a101c33         vmovss xmm11,[r11+r14*1]
0x3b29a858dc59   919  478b742328           movl r14,[r11+r12*1+0x28]
0x3b29a858dc5e   91e  4c89bd00feffff       REX.W movq [rbp-0x200],r15
0x3b29a858dc65   925  458d3cb6             leal r15,[r14+rsi*4]
0x3b29a858dc69   929  4c89b508feffff       REX.W movq [rbp-0x1f8],r14
0x3b29a858dc70   930  c4017a10243b         vmovss xmm12,[r11+r15*1]
0x3b29a858dc76   936  448b75e0             movl r14,[rbp-0x20]
0x3b29a858dc7a   93a  c4017a1164330c       vmovss [r11+r14*1+0xc],xmm12
0x3b29a858dc81   941  c4017a115c3308       vmovss [r11+r14*1+0x8],xmm11
0x3b29a858dc88   948  c4017a11543304       vmovss [r11+r14*1+0x4],xmm10
0x3b29a858dc8f   94f  c4017a110c33         vmovss [r11+r14*1],xmm9
0x3b29a858dc95   955  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x3b29a858dc9e   95e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x3b29a858dca7   967  c44121efdb           vpxor xmm11,xmm11,xmm11
0x3b29a858dcac   96c  c4017a7f5c3310       vmovdqu [r11+r14*1+0x10],xmm11
0x3b29a858dcb3   973  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x3b29a858dcbb   97b  4c89bd70fcffff       REX.W movq [rbp-0x390],r15
0x3b29a858dcc2   982  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x3b29a858dcca   98a  c4017a109c2384000000 vmovss xmm11,[r11+r12*1+0x84]
0x3b29a858dcd4   994  458d5e40             leal r11,[r14+0x40]
0x3b29a858dcd8   998  4989e2               REX.W movq r10,rsp
0x3b29a858dcdb   99b  4883ec08             REX.W subq rsp,0x8
0x3b29a858dcdf   99f  4883e4f0             REX.W andq rsp,0xf0
0x3b29a858dce3   9a3  4c891424             REX.W movq [rsp],r10
0x3b29a858dce7   9a7  488975d0             REX.W movq [rbp-0x30],rsi
0x3b29a858dceb   9ab  c57b118df8feffff     vmovsd [rbp-0x108],xmm9
0x3b29a858dcf3   9b3  c57b119500ffffff     vmovsd [rbp-0x100],xmm10
0x3b29a858dcfb   9bb  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x3b29a858dd02   9c2  c57b119d78ffffff     vmovsd [rbp-0x88],xmm11
0x3b29a858dd0a   9ca  4c895d98             REX.W movq [rbp-0x68],r11
0x3b29a858dd0e   9ce  488bf7               REX.W movq rsi,rdi
0x3b29a858dd11   9d1  488bcf               REX.W movq rcx,rdi
0x3b29a858dd14   9d4  488b7df0             REX.W movq rdi,[rbp-0x10]
0x3b29a858dd18   9d8  418bd3               movl rdx,r11
0x3b29a858dd1b   9db  41b8c0010000         movl r8,0x1c0
0x3b29a858dd21   9e1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3b29a858dd2b   9eb  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3b29a858dd32   9f2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3b29a858dd39   9f9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3b29a858dd40   a00  ffd0                 call rax
0x3b29a858dd42   a02  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3b29a858dd4d   a0d  488b2424             REX.W movq rsp,[rsp]
0x3b29a858dd51   a11  85c0                 testl rax,rax
0x3b29a858dd53   a13  0f841d200000         jz 0x3b29a858fd76  <+0x2a36>
0x3b29a858dd59   a19  4533db               xorl r11,r11
0x3b29a858dd5c   a1c  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x3b29a858dd63   a23  410f95c3             setnzl r11l
0x3b29a858dd67   a27  448ba568ffffff       movl r12,[rbp-0x98]
0x3b29a858dd6e   a2e  452be3               subl r12,r11
0x3b29a858dd71   a31  c5fb108500ffffff     vmovsd xmm0,[rbp-0x100]
0x3b29a858dd79   a39  c5fa599d78ffffff     vmulss xmm3,xmm0,[rbp-0x88]
0x3b29a858dd81   a41  c5f82edb             vucomiss xmm3,xmm3
0x3b29a858dd85   a45  7a06                 jpe 0x3b29a858dd8d  <+0xa4d>
0x3b29a858dd87   a47  0f8404000000         jz 0x3b29a858dd91  <+0xa51>
0x3b29a858dd8d   a4d  c5e057db             vxorps xmm3,xmm3,xmm3
0x3b29a858dd91   a51  c5d857e4             vxorps xmm4,xmm4,xmm4
0x3b29a858dd95   a55  c5f82edc             vucomiss xmm3,xmm4
0x3b29a858dd99   a59  0f8704000000         ja 0x3b29a858dda3  <+0xa63>
0x3b29a858dd9f   a5f  c5f928dc             vmovapd xmm3,xmm4
0x3b29a858dda3   a63  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x3b29a858dda7   a67  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x3b29a858ddad   a6d  c57b2cde             vcvttsd2si r11,xmm6
0x3b29a858ddb1   a71  4585db               testl r11,r11
0x3b29a858ddb4   a74  0f8927000000         jns 0x3b29a858dde1  <+0xaa1>
0x3b29a858ddba   a7a  4c8b15c4f6ffff       REX.W movq r10,[rip+0xfffff6c4]
0x3b29a858ddc1   a81  c441f96efa           vmovq xmm15,r10
0x3b29a858ddc6   a86  c50358fe             vaddsd xmm15,xmm15,xmm6
0x3b29a858ddca   a8a  c4417b2cdf           vcvttsd2si r11,xmm15
0x3b29a858ddcf   a8f  4585db               testl r11,r11
0x3b29a858ddd2   a92  0f8809000000         js 0x3b29a858dde1  <+0xaa1>
0x3b29a858ddd8   a98  41ba00000080         movl r10,0x80000000
0x3b29a858ddde   a9e  450bda               orl r11,r10
0x3b29a858dde1   aa1  458bd3               movl r10,r11
0x3b29a858dde4   aa4  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x3b29a858dde9   aa9  c5f92efe             vucomisd xmm7,xmm6
0x3b29a858dded   aad  0f8a451d0000         jpe 0x3b29a858fb38  <+0x27f8>
0x3b29a858ddf3   ab3  0f853f1d0000         jnz 0x3b29a858fb38  <+0x27f8>
0x3b29a858ddf9   ab9  458bfb               movl r15,r11
0x3b29a858ddfc   abc  453be3               cmpl r12,r11
0x3b29a858ddff   abf  450f42fc             cmovcl r15,r12
0x3b29a858de03   ac3  41ba0000804f         movl r10,0x4f800000
0x3b29a858de09   ac9  c4c1796eea           vmovd xmm5,r10
0x3b29a858de0e   ace  4533db               xorl r11,r11
0x3b29a858de11   ad1  c5f82eeb             vucomiss xmm5,xmm3
0x3b29a858de15   ad5  450f47df             cmoval r11,r15
0x3b29a858de19   ad9  4533ff               xorl r15,r15
0x3b29a858de1c   adc  4585db               testl r11,r11
0x3b29a858de1f   adf  410f95c7             setnzl r15l
0x3b29a858de23   ae3  458bf3               movl r14,r11
0x3b29a858de26   ae6  452bf7               subl r14,r15
0x3b29a858de29   ae9  4183c301             addl r11,0x1
0x3b29a858de2d   aed  458bfb               movl r15,r11
0x3b29a858de30   af0  453be3               cmpl r12,r11
0x3b29a858de33   af3  450f42fc             cmovcl r15,r12
0x3b29a858de37   af7  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x3b29a858de3e   afe  453bfe               cmpl r15,r14
0x3b29a858de41   b01  0f8292190000         jc 0x3b29a858f7d9  <+0x2499>
0x3b29a858de47   b07  4533db               xorl r11,r11
0x3b29a858de4a   b0a  83bd70fcffff00       cmpl [rbp-0x390],0x0
0x3b29a858de51   b11  410f95c3             setnzl r11l
0x3b29a858de55   b15  448ba570fcffff       movl r12,[rbp-0x390]
0x3b29a858de5c   b1c  452be3               subl r12,r11
0x3b29a858de5f   b1f  c5fb109d78ffffff     vmovsd xmm3,[rbp-0x88]
0x3b29a858de67   b27  c5e2599df8feffff     vmulss xmm3,xmm3,[rbp-0x108]
0x3b29a858de6f   b2f  c5f82edb             vucomiss xmm3,xmm3
0x3b29a858de73   b33  7a06                 jpe 0x3b29a858de7b  <+0xb3b>
0x3b29a858de75   b35  0f8404000000         jz 0x3b29a858de7f  <+0xb3f>
0x3b29a858de7b   b3b  c5f928dc             vmovapd xmm3,xmm4
0x3b29a858de7f   b3f  c5f82edc             vucomiss xmm3,xmm4
0x3b29a858de83   b43  0f8704000000         ja 0x3b29a858de8d  <+0xb4d>
0x3b29a858de89   b49  c5f928dc             vmovapd xmm3,xmm4
0x3b29a858de8d   b4d  c5e25af3             vcvtss2sd xmm6,xmm3,xmm3
0x3b29a858de91   b51  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x3b29a858de97   b57  c57b2cdf             vcvttsd2si r11,xmm7
0x3b29a858de9b   b5b  4585db               testl r11,r11
0x3b29a858de9e   b5e  0f8927000000         jns 0x3b29a858decb  <+0xb8b>
0x3b29a858dea4   b64  4c8b15daf5ffff       REX.W movq r10,[rip+0xfffff5da]
0x3b29a858deab   b6b  c441f96efa           vmovq xmm15,r10
0x3b29a858deb0   b70  c50358ff             vaddsd xmm15,xmm15,xmm7
0x3b29a858deb4   b74  c4417b2cdf           vcvttsd2si r11,xmm15
0x3b29a858deb9   b79  4585db               testl r11,r11
0x3b29a858debc   b7c  0f8809000000         js 0x3b29a858decb  <+0xb8b>
0x3b29a858dec2   b82  41ba00000080         movl r10,0x80000000
0x3b29a858dec8   b88  450bda               orl r11,r10
0x3b29a858decb   b8b  458bd3               movl r10,r11
0x3b29a858dece   b8e  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x3b29a858ded3   b93  c5792ec7             vucomisd xmm8,xmm7
0x3b29a858ded7   b97  0f8a7e1c0000         jpe 0x3b29a858fb5b  <+0x281b>
0x3b29a858dedd   b9d  0f85781c0000         jnz 0x3b29a858fb5b  <+0x281b>
0x3b29a858dee3   ba3  418bc3               movl rax,r11
0x3b29a858dee6   ba6  453be3               cmpl r12,r11
0x3b29a858dee9   ba9  410f42c4             cmovcl rax,r12
0x3b29a858deed   bad  4533db               xorl r11,r11
0x3b29a858def0   bb0  c5f82eeb             vucomiss xmm5,xmm3
0x3b29a858def4   bb4  440f47d8             cmoval r11,rax
0x3b29a858def8   bb8  33c0                 xorl rax,rax
0x3b29a858defa   bba  4585db               testl r11,r11
0x3b29a858defd   bbd  0f95c0               setnzl al
0x3b29a858df00   bc0  418bdb               movl rbx,r11
0x3b29a858df03   bc3  2bd8                 subl rbx,rax
0x3b29a858df05   bc5  8b9598fcffff         movl rdx,[rbp-0x368]
0x3b29a858df0b   bcb  8b85a8fcffff         movl rax,[rbp-0x358]
0x3b29a858df11   bd1  3b95a8fcffff         cmpl rdx,[rbp-0x358]
0x3b29a858df17   bd7  0f42c2               cmovcl rax,rdx
0x3b29a858df1a   bda  8bb5a0fcffff         movl rsi,[rbp-0x360]
0x3b29a858df20   be0  8bc8                 movl rcx,rax
0x3b29a858df22   be2  3bf0                 cmpl rsi,rax
0x3b29a858df24   be4  0f42ce               cmovcl rcx,rsi
0x3b29a858df27   be7  4183c301             addl r11,0x1
0x3b29a858df2b   beb  418bc3               movl rax,r11
0x3b29a858df2e   bee  453be3               cmpl r12,r11
0x3b29a858df31   bf1  410f42c4             cmovcl rax,r12
0x3b29a858df35   bf5  448d5801             leal r11,[rax+0x1]
0x3b29a858df39   bf9  c5fb109df8feffff     vmovsd xmm3,[rbp-0x108]
0x3b29a858df41   c01  c4e27918eb           vbroadcastss xmm5,xmm3
0x3b29a858df46   c06  c4e27918f0           vbroadcastss xmm6,xmm0
0x3b29a858df4b   c0b  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x3b29a858df52   c12  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x3b29a858df56   c16  418b7c0464           movl rdi,[r12+rax*1+0x64]
0x3b29a858df5b   c1b  458b440468           movl r8,[r12+rax*1+0x68]
0x3b29a858df60   c20  448b4de0             movl r9,[rbp-0x20]
0x3b29a858df64   c24  c4817a6fbc0c70010000 vmovdqu xmm7,[r12+r9*1+0x170]
0x3b29a858df6e   c2e  c4017a6f840c30010000 vmovdqu xmm8,[r12+r9*1+0x130]
0x3b29a858df78   c38  c4017a6f8c0cf0000000 vmovdqu xmm9,[r12+r9*1+0xf0]
0x3b29a858df82   c42  c4017a6f940cb0000000 vmovdqu xmm10,[r12+r9*1+0xb0]
0x3b29a858df8c   c4c  c4017a6f5c0c70       vmovdqu xmm11,[r12+r9*1+0x70]
0x3b29a858df93   c53  c4017a6fa40cf0010000 vmovdqu xmm12,[r12+r9*1+0x1f0]
0x3b29a858df9d   c5d  c4017a6fac0cb0010000 vmovdqu xmm13,[r12+r9*1+0x1b0]
0x3b29a858dfa7   c67  c4017a6fb40c60010000 vmovdqu xmm14,[r12+r9*1+0x160]
0x3b29a858dfb1   c71  c4817a6f8c0c20010000 vmovdqu xmm1,[r12+r9*1+0x120]
0x3b29a858dfbb   c7b  c4817a6f940ce0000000 vmovdqu xmm2,[r12+r9*1+0xe0]
0x3b29a858dfc5   c85  c4817a6f840ca0000000 vmovdqu xmm0,[r12+r9*1+0xa0]
0x3b29a858dfcf   c8f  c4817a6f5c0c60       vmovdqu xmm3,[r12+r9*1+0x60]
0x3b29a858dfd6   c96  c5f811ad50feffff     vmovups [rbp-0x1b0],xmm5
0x3b29a858dfde   c9e  c4817a6fac0ce0010000 vmovdqu xmm5,[r12+r9*1+0x1e0]
0x3b29a858dfe8   ca8  c5f811b540feffff     vmovups [rbp-0x1c0],xmm6
0x3b29a858dff0   cb0  c4817a6fb40ca0010000 vmovdqu xmm6,[r12+r9*1+0x1a0]
0x3b29a858dffa   cba  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x3b29a858e002   cc2  c4817a6f840c50010000 vmovdqu xmm0,[r12+r9*1+0x150]
0x3b29a858e00c   ccc  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x3b29a858e014   cd4  c4817a6f840c10010000 vmovdqu xmm0,[r12+r9*1+0x110]
0x3b29a858e01e   cde  c5f81185b0feffff     vmovups [rbp-0x150],xmm0
0x3b29a858e026   ce6  c4817a6f840cd0000000 vmovdqu xmm0,[r12+r9*1+0xd0]
0x3b29a858e030   cf0  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x3b29a858e038   cf8  c4817a6f840c90000000 vmovdqu xmm0,[r12+r9*1+0x90]
0x3b29a858e042   d02  c5f81185d0fcffff     vmovups [rbp-0x330],xmm0
0x3b29a858e04a   d0a  c4817a6f440c50       vmovdqu xmm0,[r12+r9*1+0x50]
0x3b29a858e051   d11  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x3b29a858e059   d19  c4817a6f840cd0010000 vmovdqu xmm0,[r12+r9*1+0x1d0]
0x3b29a858e063   d23  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x3b29a858e06b   d2b  c4817a6f840c90010000 vmovdqu xmm0,[r12+r9*1+0x190]
0x3b29a858e075   d35  c5f81185f0fbffff     vmovups [rbp-0x410],xmm0
0x3b29a858e07d   d3d  c4817a6f840c40010000 vmovdqu xmm0,[r12+r9*1+0x140]
0x3b29a858e087   d47  c5f8118500fcffff     vmovups [rbp-0x400],xmm0
0x3b29a858e08f   d4f  c4817a6f840c00010000 vmovdqu xmm0,[r12+r9*1+0x100]
0x3b29a858e099   d59  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x3b29a858e0a1   d61  c4817a6f840cc0000000 vmovdqu xmm0,[r12+r9*1+0xc0]
0x3b29a858e0ab   d6b  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x3b29a858e0b3   d73  c4817a6f840c80000000 vmovdqu xmm0,[r12+r9*1+0x80]
0x3b29a858e0bd   d7d  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x3b29a858e0c5   d85  c4817a6f440c40       vmovdqu xmm0,[r12+r9*1+0x40]
0x3b29a858e0cc   d8c  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x3b29a858e0d4   d94  c4817a6f840cc0010000 vmovdqu xmm0,[r12+r9*1+0x1c0]
0x3b29a858e0de   d9e  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x3b29a858e0e6   da6  c4817a6f840c80010000 vmovdqu xmm0,[r12+r9*1+0x180]
0x3b29a858e0f0   db0  48899d78fcffff       REX.W movq [rbp-0x388],rbx
0x3b29a858e0f7   db7  48898df8fdffff       REX.W movq [rbp-0x208],rcx
0x3b29a858e0fe   dbe  4c899d80fcffff       REX.W movq [rbp-0x380],r11
0x3b29a858e105   dc5  4889bd90fcffff       REX.W movq [rbp-0x370],rdi
0x3b29a858e10c   dcc  4c898588fcffff       REX.W movq [rbp-0x378],r8
0x3b29a858e113   dd3  c57810bd60fcffff     vmovups xmm15,[rbp-0x3a0]
0x3b29a858e11b   ddb  c57811bd50ffffff     vmovups [rbp-0xb0],xmm15
0x3b29a858e123   de3  c5fb11a568ffffff     vmovsd [rbp-0x98],xmm4
0x3b29a858e12b   deb  c5fb11a560ffffff     vmovsd [rbp-0xa0],xmm4
0x3b29a858e133   df3  c5fb11a540ffffff     vmovsd [rbp-0xc0],xmm4
0x3b29a858e13b   dfb  c5fb11a538ffffff     vmovsd [rbp-0xc8],xmm4
0x3b29a858e143   e03  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x3b29a858e14b   e0b  c57928c8             vmovapd xmm9,xmm0
0x3b29a858e14f   e0f  33c0                 xorl rax,rax
0x3b29a858e151   e11  8b8df0fdffff         movl rcx,[rbp-0x210]
0x3b29a858e157   e17  c5fb11a530ffffff     vmovsd [rbp-0xd0],xmm4
0x3b29a858e15f   e1f  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x3b29a858e167   e27  c578118520fdffff     vmovups [rbp-0x2e0],xmm8
0x3b29a858e16f   e2f  c578119540fdffff     vmovups [rbp-0x2c0],xmm10
0x3b29a858e177   e37  c5f811b5d0fdffff     vmovups [rbp-0x230],xmm6
0x3b29a858e17f   e3f  c5f811adc0fdffff     vmovups [rbp-0x240],xmm5
0x3b29a858e187   e47  c5f8119db0fdffff     vmovups [rbp-0x250],xmm3
0x3b29a858e18f   e4f  c5f81195a0fdffff     vmovups [rbp-0x260],xmm2
0x3b29a858e197   e57  c5f8118d90fdffff     vmovups [rbp-0x270],xmm1
0x3b29a858e19f   e5f  c57811b580fdffff     vmovups [rbp-0x280],xmm14
0x3b29a858e1a7   e67  c57811ad70fdffff     vmovups [rbp-0x290],xmm13
0x3b29a858e1af   e6f  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x3b29a858e1b7   e77  c578119d50fdffff     vmovups [rbp-0x2b0],xmm11
0x3b29a858e1bf   e7f  e98d000000           jmp 0x3b29a858e251  <+0xf11>
0x3b29a858e1c4   e84  660f1f840000000000   nop
0x3b29a858e1cd   e8d  660f1f840000000000   nop
0x3b29a858e1d6   e96  660f1f840000000000   nop
0x3b29a858e1df   e9f  660f1f840000000000   nop
0x3b29a858e1e8   ea8  660f1f840000000000   nop
0x3b29a858e1f1   eb1  660f1f840000000000   nop
0x3b29a858e1fa   eba  660f1f440000         nop
0x3b29a858e200   ec0  8b9d78fcffff         movl rbx,[rbp-0x388]
0x3b29a858e206   ec6  458bf3               movl r14,r11
0x3b29a858e209   ec9  448b9d80fcffff       movl r11,[rbp-0x380]
0x3b29a858e210   ed0  448b8588fcffff       movl r8,[rbp-0x378]
0x3b29a858e217   ed7  8bbd90fcffff         movl rdi,[rbp-0x370]
0x3b29a858e21d   edd  8b9598fcffff         movl rdx,[rbp-0x368]
0x3b29a858e223   ee3  c578108de0fdffff     vmovups xmm9,[rbp-0x220]
0x3b29a858e22b   eeb  418bcf               movl rcx,r15
0x3b29a858e22e   eee  4c8be6               REX.W movq r12,rsi
0x3b29a858e231   ef1  c57811ad60fdffff     vmovups [rbp-0x2a0],xmm13
0x3b29a858e239   ef9  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x3b29a858e241   f01  c57811a580fdffff     vmovups [rbp-0x280],xmm12
0x3b29a858e249   f09  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x3b29a858e251   f11  c578109550fcffff     vmovups xmm10,[rbp-0x3b0]
0x3b29a858e259   f19  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x3b29a858e261   f21  c57810a530fcffff     vmovups xmm12,[rbp-0x3d0]
0x3b29a858e269   f29  c57810ad20fcffff     vmovups xmm13,[rbp-0x3e0]
0x3b29a858e271   f31  c57810b510fcffff     vmovups xmm14,[rbp-0x3f0]
0x3b29a858e279   f39  c5f8108d00fcffff     vmovups xmm1,[rbp-0x400]
0x3b29a858e281   f41  c5f81095f0fbffff     vmovups xmm2,[rbp-0x410]
0x3b29a858e289   f49  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x3b29a858e291   f51  448bbd90feffff       movl r15,[rbp-0x170]
0x3b29a858e298   f58  448b8d00feffff       movl r9,[rbp-0x200]
0x3b29a858e29f   f5f  4c89b578ffffff       REX.W movq [rbp-0x88],r14
0x3b29a858e2a6   f66  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858e2aa   f6a  0f86ce180000         jna 0x3b29a858fb7e  <+0x283e>
0x3b29a858e2b0   f70  8bb570fcffff         movl rsi,[rbp-0x390]
0x3b29a858e2b6   f76  410faff6             imull rsi,r14
0x3b29a858e2ba   f7a  448d3433             leal r14,[rbx+rsi*1]
0x3b29a858e2be   f7e  453bc6               cmpl r8,r14
0x3b29a858e2c1   f81  0f8629000000         jna 0x3b29a858e2f0  <+0xfb0>
0x3b29a858e2c7   f87  4103f3               addl rsi,r11
0x3b29a858e2ca   f8a  443bc6               cmpl r8,rsi
0x3b29a858e2cd   f8d  0f861d000000         jna 0x3b29a858e2f0  <+0xfb0>
0x3b29a858e2d3   f93  8d34b7               leal rsi,[rdi+rsi*4]
0x3b29a858e2d6   f96  418b3434             movl rsi,[r12+rsi*1]
0x3b29a858e2da   f9a  468d34b7             leal r14,[rdi+r14*4]
0x3b29a858e2de   f9e  478b3434             movl r14,[r12+r14*1]
0x3b29a858e2e2   fa2  458bd6               movl r10,r14
0x3b29a858e2e5   fa5  448bf6               movl r14,rsi
0x3b29a858e2e8   fa8  418bf2               movl rsi,r10
0x3b29a858e2eb   fab  e906000000           jmp 0x3b29a858e2f6  <+0xfb6>
0x3b29a858e2f0   fb0  4c8bf0               REX.W movq r14,rax
0x3b29a858e2f3   fb3  488bf0               REX.W movq rsi,rax
0x3b29a858e2f6   fb6  458d1cb7             leal r11,[r15+rsi*4]
0x3b29a858e2fa   fba  418bde               movl rbx,r14
0x3b29a858e2fd   fbd  2bde                 subl rbx,rsi
0x3b29a858e2ff   fbf  33ff                 xorl rdi,rdi
0x3b29a858e301   fc1  413bce               cmpl rcx,r14
0x3b29a858e304   fc4  400f92c7             setcl dil
0x3b29a858e308   fc8  4533c0               xorl r8,r8
0x3b29a858e30b   fcb  443bf6               cmpl r14,rsi
0x3b29a858e30e   fce  410f92c0             setcl r8l
0x3b29a858e312   fd2  4c8bff               REX.W movq r15,rdi
0x3b29a858e315   fd5  450bf8               orl r15,r8
0x3b29a858e318   fd8  8bcb                 movl rcx,rbx
0x3b29a858e31a   fda  4585ff               testl r15,r15
0x3b29a858e31d   fdd  0f45c8               cmovnzl rcx,rax
0x3b29a858e320   fe0  4c89b518feffff       REX.W movq [rbp-0x1e8],r14
0x3b29a858e327   fe7  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x3b29a858e32e   fee  4889bd08fdffff       REX.W movq [rbp-0x2f8],rdi
0x3b29a858e335   ff5  4c8985a0feffff       REX.W movq [rbp-0x160],r8
0x3b29a858e33c   ffc  48898de0feffff       REX.W movq [rbp-0x120],rcx
0x3b29a858e343  1003  443bf6               cmpl r14,rsi
0x3b29a858e346  1006  0f82b3000000         jc 0x3b29a858e3ff  <+0x10bf>
0x3b29a858e34c  100c  458d3cb1             leal r15,[r9+rsi*4]
0x3b29a858e350  1010  b904000000           movl rcx,0x4
0x3b29a858e355  1015  413bd6               cmpl rdx,r14
0x3b29a858e358  1018  440f42f9             cmovcl r15,rcx
0x3b29a858e35c  101c  448bcb               movl r9,rbx
0x3b29a858e35f  101f  413bd6               cmpl rdx,r14
0x3b29a858e362  1022  440f42c8             cmovcl r9,rax
0x3b29a858e366  1026  418bd1               movl rdx,r9
0x3b29a858e369  1029  81e2f0ffff1f         andl rdx,0x1ffffff0
0x3b29a858e36f  102f  418d1497             leal rdx,[r15+rdx*4]
0x3b29a858e373  1033  448ba510feffff       movl r12,[rbp-0x1f0]
0x3b29a858e37a  103a  458d1cb4             leal r11,[r12+rsi*4]
0x3b29a858e37e  103e  448ba5a0fcffff       movl r12,[rbp-0x360]
0x3b29a858e385  1045  453be6               cmpl r12,r14
0x3b29a858e388  1048  440f42d9             cmovcl r11,rcx
0x3b29a858e38c  104c  8bfb                 movl rdi,rbx
0x3b29a858e38e  104e  453be6               cmpl r12,r14
0x3b29a858e391  1051  0f42f8               cmovcl rdi,rax
0x3b29a858e394  1054  448be7               movl r12,rdi
0x3b29a858e397  1057  4181e4f0ffff1f       andl r12,0x1ffffff0
0x3b29a858e39e  105e  478d24a3             leal r12,[r11+r12*4]
0x3b29a858e3a2  1062  458bc1               movl r8,r9
0x3b29a858e3a5  1065  41c1e804             shrl r8, 4
0x3b29a858e3a9  1069  4183e10f             andl r9,0xf
0x3b29a858e3ad  106d  4c899df0fcffff       REX.W movq [rbp-0x310],r11
0x3b29a858e3b4  1074  448bdf               movl r11,rdi
0x3b29a858e3b7  1077  41c1eb04             shrl r11, 4
0x3b29a858e3bb  107b  83e70f               andl rdi,0xf
0x3b29a858e3be  107e  4c899d00fdffff       REX.W movq [rbp-0x300],r11
0x3b29a858e3c5  1085  448b9da8fcffff       movl r11,[rbp-0x358]
0x3b29a858e3cc  108c  453bde               cmpl r11,r14
0x3b29a858e3cf  108f  0f821c000000         jc 0x3b29a858e3f1  <+0x10b1>
0x3b29a858e3d5  1095  448b9d08feffff       movl r11,[rbp-0x1f8]
0x3b29a858e3dc  109c  418d34b3             leal rsi,[r11+rsi*4]
0x3b29a858e3e0  10a0  458bd7               movl r10,r15
0x3b29a858e3e3  10a3  448bfb               movl r15,rbx
0x3b29a858e3e6  10a6  418bda               movl rbx,r10
0x3b29a858e3e9  10a9  448bde               movl r11,rsi
0x3b29a858e3ec  10ac  e939000000           jmp 0x3b29a858e42a  <+0x10ea>
0x3b29a858e3f1  10b1  418bdf               movl rbx,r15
0x3b29a858e3f4  10b4  4c8bf8               REX.W movq r15,rax
0x3b29a858e3f7  10b7  4c8bd9               REX.W movq r11,rcx
0x3b29a858e3fa  10ba  e92b000000           jmp 0x3b29a858e42a  <+0x10ea>
0x3b29a858e3ff  10bf  4c8bf8               REX.W movq r15,rax
0x3b29a858e402  10c2  b904000000           movl rcx,0x4
0x3b29a858e407  10c7  488bf8               REX.W movq rdi,rax
0x3b29a858e40a  10ca  48898500fdffff       REX.W movq [rbp-0x300],rax
0x3b29a858e411  10d1  4c8bc8               REX.W movq r9,rax
0x3b29a858e414  10d4  4c8bc0               REX.W movq r8,rax
0x3b29a858e417  10d7  488bd1               REX.W movq rdx,rcx
0x3b29a858e41a  10da  488bd9               REX.W movq rbx,rcx
0x3b29a858e41d  10dd  4c8bd9               REX.W movq r11,rcx
0x3b29a858e420  10e0  4c8be1               REX.W movq r12,rcx
0x3b29a858e423  10e3  48898df0fcffff       REX.W movq [rbp-0x310],rcx
0x3b29a858e42a  10ea  488bb5a0feffff       REX.W movq rsi,[rbp-0x160]
0x3b29a858e431  10f1  0bb508fdffff         orl rsi,[rbp-0x2f8]
0x3b29a858e437  10f7  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x3b29a858e43e  10fe  448ba518ffffff       movl r12,[rbp-0xe8]
0x3b29a858e445  1105  85f6                 testl rsi,rsi
0x3b29a858e447  1107  440f45e1             cmovnzl r12,rcx
0x3b29a858e44b  110b  8b8de0feffff         movl rcx,[rbp-0x120]
0x3b29a858e451  1111  83e10f               andl rcx,0xf
0x3b29a858e454  1114  418bf7               movl rsi,r15
0x3b29a858e457  1117  c1ee04               shrl rsi, 4
0x3b29a858e45a  111a  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x3b29a858e461  1121  8b95e0feffff         movl rdx,[rbp-0x120]
0x3b29a858e467  1127  c1ea04               shrl rdx, 4
0x3b29a858e46a  112a  4c898da8feffff       REX.W movq [rbp-0x158],r9
0x3b29a858e471  1131  448b8d00fdffff       movl r9,[rbp-0x300]
0x3b29a858e478  1138  4c89bd20ffffff       REX.W movq [rbp-0xe0],r15
0x3b29a858e47f  113f  448bfa               movl r15,rdx
0x3b29a858e482  1142  443bca               cmpl r9,rdx
0x3b29a858e485  1145  450f42f9             cmovcl r15,r9
0x3b29a858e489  1149  418bd7               movl rdx,r15
0x3b29a858e48c  114c  453bc7               cmpl r8,r15
0x3b29a858e48f  114f  410f42d0             cmovcl rdx,r8
0x3b29a858e493  1153  448bfa               movl r15,rdx
0x3b29a858e496  1156  3bf2                 cmpl rsi,rdx
0x3b29a858e498  1158  440f42fe             cmovcl r15,rsi
0x3b29a858e49c  115c  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x3b29a858e4a3  1163  4889bd98feffff       REX.W movq [rbp-0x168],rdi
0x3b29a858e4aa  116a  4c89a518ffffff       REX.W movq [rbp-0xe8],r12
0x3b29a858e4b1  1171  4585ff               testl r15,r15
0x3b29a858e4b4  1174  0f856b000000         jnz 0x3b29a858e525  <+0x11e5>
0x3b29a858e4ba  117a  c4c17928d9           vmovapd xmm3,xmm9
0x3b29a858e4bf  117f  c4c17928f2           vmovapd xmm6,xmm10
0x3b29a858e4c4  1184  c4c17928c3           vmovapd xmm0,xmm11
0x3b29a858e4c9  1189  c4417928cc           vmovapd xmm9,xmm12
0x3b29a858e4ce  118e  c4417928d5           vmovapd xmm10,xmm13
0x3b29a858e4d3  1193  c4c17928e6           vmovapd xmm4,xmm14
0x3b29a858e4d8  1198  c5f928f9             vmovapd xmm7,xmm1
0x3b29a858e4dc  119c  c57928c2             vmovapd xmm8,xmm2
0x3b29a858e4e0  11a0  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x3b29a858e4e8  11a8  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x3b29a858e4f0  11b0  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x3b29a858e4f8  11b8  488b75c8             REX.W movq rsi,[rbp-0x38]
0x3b29a858e4fc  11bc  448b4de0             movl r9,[rbp-0x20]
0x3b29a858e500  11c0  c57810ad60fdffff     vmovups xmm13,[rbp-0x2a0]
0x3b29a858e508  11c8  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x3b29a858e510  11d0  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x3b29a858e518  11d8  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x3b29a858e520  11e0  e981060000           jmp 0x3b29a858eba6  <+0x1866>
0x3b29a858e525  11e5  c578118de0fdffff     vmovups [rbp-0x220],xmm9
0x3b29a858e52d  11ed  c578119550fcffff     vmovups [rbp-0x3b0],xmm10
0x3b29a858e535  11f5  c578119d40fcffff     vmovups [rbp-0x3c0],xmm11
0x3b29a858e53d  11fd  c57811a530fcffff     vmovups [rbp-0x3d0],xmm12
0x3b29a858e545  1205  c57811ad20fcffff     vmovups [rbp-0x3e0],xmm13
0x3b29a858e54d  120d  c57811b510fcffff     vmovups [rbp-0x3f0],xmm14
0x3b29a858e555  1215  c5f8118d00fcffff     vmovups [rbp-0x400],xmm1
0x3b29a858e55d  121d  c5f81195f0fbffff     vmovups [rbp-0x410],xmm2
0x3b29a858e565  1225  448b85f0fcffff       movl r8,[rbp-0x310]
0x3b29a858e56c  122c  488b75c8             REX.W movq rsi,[rbp-0x38]
0x3b29a858e570  1230  448b4de0             movl r9,[rbp-0x20]
0x3b29a858e574  1234  488bd0               REX.W movq rdx,rax
0x3b29a858e577  1237  e962000000           jmp 0x3b29a858e5de  <+0x129e>
0x3b29a858e57c  123c  0f1f4000             nop
0x3b29a858e580  1240  c5f811a550fdffff     vmovups [rbp-0x2b0],xmm4
0x3b29a858e588  1248  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x3b29a858e590  1250  448ba518ffffff       movl r12,[rbp-0xe8]
0x3b29a858e597  1257  448b9d28ffffff       movl r11,[rbp-0xd8]
0x3b29a858e59e  125e  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x3b29a858e5a6  1266  c57811a520fdffff     vmovups [rbp-0x2e0],xmm12
0x3b29a858e5ae  126e  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x3b29a858e5b6  1276  c5f8118540fdffff     vmovups [rbp-0x2c0],xmm0
0x3b29a858e5be  127e  c5f8119d60fdffff     vmovups [rbp-0x2a0],xmm3
0x3b29a858e5c6  1286  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x3b29a858e5ce  128e  c578119580fdffff     vmovups [rbp-0x280],xmm10
0x3b29a858e5d6  1296  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x3b29a858e5de  129e  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858e5e2  12a2  0f8669160000         jna 0x3b29a858fc51  <+0x2911>
0x3b29a858e5e8  12a8  8d3c1a               leal rdi,[rdx+rbx*1]
0x3b29a858e5eb  12ab  c57a6f1c3e           vmovdqu xmm11,[rsi+rdi*1]
0x3b29a858e5f0  12b0  428d041a             leal rax,[rdx+r11*1]
0x3b29a858e5f4  12b4  c57a6f1406           vmovdqu xmm10,[rsi+rax*1]
0x3b29a858e5f9  12b9  468d1c02             leal r11,[rdx+r8*1]
0x3b29a858e5fd  12bd  c4217a6f0c1e         vmovdqu xmm9,[rsi+r11*1]
0x3b29a858e603  12c3  c441585ce1           vsubps xmm12,xmm4,xmm9
0x3b29a858e608  12c8  468d3422             leal r14,[rdx+r12*1]
0x3b29a858e60c  12cc  c4217a6f2c36         vmovdqu xmm13,[rsi+r14*1]
0x3b29a858e612  12d2  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x3b29a858e61a  12da  c4c1085ccd           vsubps xmm1,xmm14,xmm13
0x3b29a858e61f  12df  c5f059d1             vmulps xmm2,xmm1,xmm1
0x3b29a858e623  12e3  c4c11859c4           vmulps xmm0,xmm12,xmm12
0x3b29a858e628  12e8  c5e858c0             vaddps xmm0,xmm2,xmm0
0x3b29a858e62c  12ec  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x3b29a858e634  12f4  c5f8c2da01           vcmpps xmm3,xmm0,xmm2, (lt)
0x3b29a858e639  12f9  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x3b29a858e641  1301  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x3b29a858e645  1305  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x3b29a858e649  1309  c51859e3             vmulps xmm12,xmm12,xmm3
0x3b29a858e64d  130d  c5f810b550fcffff     vmovups xmm6,[rbp-0x3b0]
0x3b29a858e655  1315  c4c14858f4           vaddps xmm6,xmm6,xmm12
0x3b29a858e65a  131a  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x3b29a858e664  1324  c5f059db             vmulps xmm3,xmm1,xmm3
0x3b29a858e668  1328  c57810a5e0fdffff     vmovups xmm12,[rbp-0x220]
0x3b29a858e670  1330  c59858db             vaddps xmm3,xmm12,xmm3
0x3b29a858e674  1334  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x3b29a858e67e  133e  c568c2e002           vcmpps xmm12,xmm2,xmm0, (le)
0x3b29a858e683  1343  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x3b29a858e68b  134b  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x3b29a858e693  1353  c5f8c2d901           vcmpps xmm3,xmm0,xmm1, (lt)
0x3b29a858e698  1358  c599dbdb             vpand xmm3,xmm12,xmm3
0x3b29a858e69c  135c  c44119efe4           vpxor xmm12,xmm12,xmm12
0x3b29a858e6a1  1361  c598c2c001           vcmpps xmm0,xmm12,xmm0, (lt)
0x3b29a858e6a6  1366  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x3b29a858e6aa  136a  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x3b29a858e6ae  136e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x3b29a858e6b2  1372  c5f8109d00fcffff     vmovups xmm3,[rbp-0x400]
0x3b29a858e6ba  137a  c5f858db             vaddps xmm3,xmm0,xmm3
0x3b29a858e6be  137e  c4a17a7f9c0e40010000 vmovdqu [rsi+r9*1+0x140],xmm3
0x3b29a858e6c8  1388  c52859d0             vmulps xmm10,xmm10,xmm0
0x3b29a858e6cc  138c  c5f8119d00fcffff     vmovups [rbp-0x400],xmm3
0x3b29a858e6d4  1394  c5f8109d10fcffff     vmovups xmm3,[rbp-0x3f0]
0x3b29a858e6dc  139c  c5a858db             vaddps xmm3,xmm10,xmm3
0x3b29a858e6e0  13a0  c4a17a7f9c0e00010000 vmovdqu [rsi+r9*1+0x100],xmm3
0x3b29a858e6ea  13aa  c52059d0             vmulps xmm10,xmm11,xmm0
0x3b29a858e6ee  13ae  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x3b29a858e6f6  13b6  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858e6fb  13bb  c4217a7f940ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm10
0x3b29a858e705  13c5  c53059c8             vmulps xmm9,xmm9,xmm0
0x3b29a858e709  13c9  c578109d30fcffff     vmovups xmm11,[rbp-0x3d0]
0x3b29a858e711  13d1  c4413058cb           vaddps xmm9,xmm9,xmm11
0x3b29a858e716  13d6  c4217a7f8c0e80000000 vmovdqu [rsi+r9*1+0x80],xmm9
0x3b29a858e720  13e0  c59059c0             vmulps xmm0,xmm13,xmm0
0x3b29a858e724  13e4  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x3b29a858e72c  13ec  c5a058c0             vaddps xmm0,xmm11,xmm0
0x3b29a858e730  13f0  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x3b29a858e737  13f7  448d6710             leal r12,[rdi+0x10]
0x3b29a858e73b  13fb  c4217a6f1c26         vmovdqu xmm11,[rsi+r12*1]
0x3b29a858e741  1401  448d6010             leal r12,[rax+0x10]
0x3b29a858e745  1405  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x3b29a858e74b  140b  458d6310             leal r12,[r11+0x10]
0x3b29a858e74f  140f  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x3b29a858e757  1417  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x3b29a858e75d  141d  c5f8119d10fcffff     vmovups [rbp-0x3f0],xmm3
0x3b29a858e765  1425  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x3b29a858e769  1429  458d6610             leal r12,[r14+0x10]
0x3b29a858e76d  142d  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x3b29a858e775  1435  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x3b29a858e77b  143b  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x3b29a858e783  1443  c5085cce             vsubps xmm9,xmm14,xmm6
0x3b29a858e787  1447  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x3b29a858e78f  144f  c4413059d1           vmulps xmm10,xmm9,xmm9
0x3b29a858e794  1454  c5e059fb             vmulps xmm7,xmm3,xmm3
0x3b29a858e798  1458  c5a858ff             vaddps xmm7,xmm10,xmm7
0x3b29a858e79c  145c  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x3b29a858e7a1  1461  c529dbd5             vpand xmm10,xmm10,xmm5
0x3b29a858e7a5  1465  c441785bd2           vcvtdq2ps xmm10,xmm10
0x3b29a858e7aa  146a  c4c16059da           vmulps xmm3,xmm3,xmm10
0x3b29a858e7af  146f  c5781085b0fcffff     vmovups xmm8,[rbp-0x350]
0x3b29a858e7b7  1477  c5b858db             vaddps xmm3,xmm8,xmm3
0x3b29a858e7bb  147b  c4a17a7f9c0ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm3
0x3b29a858e7c5  1485  c4413059c2           vmulps xmm8,xmm9,xmm10
0x3b29a858e7ca  148a  c578108df0fbffff     vmovups xmm9,[rbp-0x410]
0x3b29a858e7d2  1492  c4413058c0           vaddps xmm8,xmm9,xmm8
0x3b29a858e7d7  1497  c4217a7f840e90010000 vmovdqu [rsi+r9*1+0x190],xmm8
0x3b29a858e7e1  14a1  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x3b29a858e7e6  14a6  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x3b29a858e7eb  14ab  c44131dbca           vpand xmm9,xmm9,xmm10
0x3b29a858e7f0  14b0  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x3b29a858e7f5  14b5  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x3b29a858e7f9  14b9  c5f85bff             vcvtdq2ps xmm7,xmm7
0x3b29a858e7fd  14bd  c5b1dbff             vpand xmm7,xmm9,xmm7
0x3b29a858e801  14c1  c578108dc0feffff     vmovups xmm9,[rbp-0x140]
0x3b29a858e809  14c9  c4414058c9           vaddps xmm9,xmm7,xmm9
0x3b29a858e80e  14ce  c4217a7f8c0e50010000 vmovdqu [rsi+r9*1+0x150],xmm9
0x3b29a858e818  14d8  c51059d7             vmulps xmm10,xmm13,xmm7
0x3b29a858e81c  14dc  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x3b29a858e824  14e4  c4412858d5           vaddps xmm10,xmm10,xmm13
0x3b29a858e829  14e9  c4217a7f940e10010000 vmovdqu [rsi+r9*1+0x110],xmm10
0x3b29a858e833  14f3  c52059df             vmulps xmm11,xmm11,xmm7
0x3b29a858e837  14f7  c57810ade0fcffff     vmovups xmm13,[rbp-0x320]
0x3b29a858e83f  14ff  c4412058dd           vaddps xmm11,xmm11,xmm13
0x3b29a858e844  1504  c4217a7f9c0ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm11
0x3b29a858e84e  150e  c5f859c7             vmulps xmm0,xmm0,xmm7
0x3b29a858e852  1512  c57810add0fcffff     vmovups xmm13,[rbp-0x330]
0x3b29a858e85a  151a  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x3b29a858e85f  151f  c4a17a7f840e90000000 vmovdqu [rsi+r9*1+0x90],xmm0
0x3b29a858e869  1529  c5c859f7             vmulps xmm6,xmm6,xmm7
0x3b29a858e86d  152d  c5f810bdc0fcffff     vmovups xmm7,[rbp-0x340]
0x3b29a858e875  1535  c5c058f6             vaddps xmm6,xmm7,xmm6
0x3b29a858e879  1539  c4a17a7f740e50       vmovdqu [rsi+r9*1+0x50],xmm6
0x3b29a858e880  1540  448d6720             leal r12,[rdi+0x20]
0x3b29a858e884  1544  c4a17a6f3c26         vmovdqu xmm7,[rsi+r12*1]
0x3b29a858e88a  154a  448d6020             leal r12,[rax+0x20]
0x3b29a858e88e  154e  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x3b29a858e894  1554  458d6320             leal r12,[r11+0x20]
0x3b29a858e898  1558  c5f81185d0fcffff     vmovups [rbp-0x330],xmm0
0x3b29a858e8a0  1560  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x3b29a858e8a6  1566  c5f8119db0fcffff     vmovups [rbp-0x350],xmm3
0x3b29a858e8ae  156e  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x3b29a858e8b2  1572  458d6620             leal r12,[r14+0x20]
0x3b29a858e8b6  1576  c5f811b5c0fcffff     vmovups [rbp-0x340],xmm6
0x3b29a858e8be  157e  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x3b29a858e8c4  1584  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x3b29a858e8cc  158c  c5085cc6             vsubps xmm8,xmm14,xmm6
0x3b29a858e8d0  1590  c578118dc0feffff     vmovups [rbp-0x140],xmm9
0x3b29a858e8d8  1598  c4413859c8           vmulps xmm9,xmm8,xmm8
0x3b29a858e8dd  159d  c5781195b0feffff     vmovups [rbp-0x150],xmm10
0x3b29a858e8e5  15a5  c56059d3             vmulps xmm10,xmm3,xmm3
0x3b29a858e8e9  15a9  c4413058ca           vaddps xmm9,xmm9,xmm10
0x3b29a858e8ee  15ae  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x3b29a858e8f3  15b3  c529dbd5             vpand xmm10,xmm10,xmm5
0x3b29a858e8f7  15b7  c441785bd2           vcvtdq2ps xmm10,xmm10
0x3b29a858e8fc  15bc  c4c16059da           vmulps xmm3,xmm3,xmm10
0x3b29a858e901  15c1  c578119de0fcffff     vmovups [rbp-0x320],xmm11
0x3b29a858e909  15c9  c578109dc0fdffff     vmovups xmm11,[rbp-0x240]
0x3b29a858e911  15d1  c5a058db             vaddps xmm3,xmm11,xmm3
0x3b29a858e915  15d5  c4a17a7f9c0ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm3
0x3b29a858e91f  15df  c4413859c2           vmulps xmm8,xmm8,xmm10
0x3b29a858e924  15e4  c5781095d0fdffff     vmovups xmm10,[rbp-0x230]
0x3b29a858e92c  15ec  c4412858c0           vaddps xmm8,xmm10,xmm8
0x3b29a858e931  15f1  c4217a7f840ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm8
0x3b29a858e93b  15fb  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x3b29a858e941  1601  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x3b29a858e946  1606  c44129dbd3           vpand xmm10,xmm10,xmm11
0x3b29a858e94b  160b  c44118c2c901         vcmpps xmm9,xmm12,xmm9, (lt)
0x3b29a858e951  1611  c531dbcd             vpand xmm9,xmm9,xmm5
0x3b29a858e955  1615  c441785bc9           vcvtdq2ps xmm9,xmm9
0x3b29a858e95a  161a  c44129dbc9           vpand xmm9,xmm10,xmm9
0x3b29a858e95f  161f  c578109580fdffff     vmovups xmm10,[rbp-0x280]
0x3b29a858e967  1627  c4413058d2           vaddps xmm10,xmm9,xmm10
0x3b29a858e96c  162c  c4217a7f940e60010000 vmovdqu [rsi+r9*1+0x160],xmm10
0x3b29a858e976  1636  c4411059d9           vmulps xmm11,xmm13,xmm9
0x3b29a858e97b  163b  c57810ad90fdffff     vmovups xmm13,[rbp-0x270]
0x3b29a858e983  1643  c4412058dd           vaddps xmm11,xmm11,xmm13
0x3b29a858e988  1648  c4217a7f9c0e20010000 vmovdqu [rsi+r9*1+0x120],xmm11
0x3b29a858e992  1652  c4c14059f9           vmulps xmm7,xmm7,xmm9
0x3b29a858e997  1657  c57810ada0fdffff     vmovups xmm13,[rbp-0x260]
0x3b29a858e99f  165f  c4c14058fd           vaddps xmm7,xmm7,xmm13
0x3b29a858e9a4  1664  c4a17a7fbc0ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm7
0x3b29a858e9ae  166e  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x3b29a858e9b3  1673  c57810add0feffff     vmovups xmm13,[rbp-0x130]
0x3b29a858e9bb  167b  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x3b29a858e9c0  1680  c4a17a7f840ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm0
0x3b29a858e9ca  168a  c4c14859f1           vmulps xmm6,xmm6,xmm9
0x3b29a858e9cf  168f  c578108db0fdffff     vmovups xmm9,[rbp-0x250]
0x3b29a858e9d7  1697  c5b058f6             vaddps xmm6,xmm9,xmm6
0x3b29a858e9db  169b  c4a17a7f740e60       vmovdqu [rsi+r9*1+0x60],xmm6
0x3b29a858e9e2  16a2  448d6730             leal r12,[rdi+0x30]
0x3b29a858e9e6  16a6  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x3b29a858e9ec  16ac  448d6030             leal r12,[rax+0x30]
0x3b29a858e9f0  16b0  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x3b29a858e9f6  16b6  4183c330             addl r11,0x30
0x3b29a858e9fa  16ba  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x3b29a858ea02  16c2  c4a17a6f041e         vmovdqu xmm0,[rsi+r11*1]
0x3b29a858ea08  16c8  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x3b29a858ea10  16d0  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x3b29a858ea14  16d4  458d5e30             leal r11,[r14+0x30]
0x3b29a858ea18  16d8  c4a17a6f241e         vmovdqu xmm4,[rsi+r11*1]
0x3b29a858ea1e  16de  c5f811b5b0fdffff     vmovups [rbp-0x250],xmm6
0x3b29a858ea26  16e6  c5885cf4             vsubps xmm6,xmm14,xmm4
0x3b29a858ea2a  16ea  c54859f6             vmulps xmm14,xmm6,xmm6
0x3b29a858ea2e  16ee  c5f811bda0fdffff     vmovups [rbp-0x260],xmm7
0x3b29a858ea36  16f6  c5e059fb             vmulps xmm7,xmm3,xmm3
0x3b29a858ea3a  16fa  c58858ff             vaddps xmm7,xmm14,xmm7
0x3b29a858ea3e  16fe  c540c2f201           vcmpps xmm14,xmm7,xmm2, (lt)
0x3b29a858ea43  1703  c509dbf5             vpand xmm14,xmm14,xmm5
0x3b29a858ea47  1707  c441785bf6           vcvtdq2ps xmm14,xmm14
0x3b29a858ea4c  170c  c4c16059de           vmulps xmm3,xmm3,xmm14
0x3b29a858ea51  1711  c5781185d0fdffff     vmovups [rbp-0x230],xmm8
0x3b29a858ea59  1719  c578108560fdffff     vmovups xmm8,[rbp-0x2a0]
0x3b29a858ea61  1721  c5b858db             vaddps xmm3,xmm8,xmm3
0x3b29a858ea65  1725  c4a17a7f9c0ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm3
0x3b29a858ea6f  172f  c4c14859f6           vmulps xmm6,xmm6,xmm14
0x3b29a858ea74  1734  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x3b29a858ea7c  173c  c50858f6             vaddps xmm14,xmm14,xmm6
0x3b29a858ea80  1740  c4217a7fb40eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm14
0x3b29a858ea8a  174a  c5e8c2f702           vcmpps xmm6,xmm2,xmm7, (le)
0x3b29a858ea8f  174f  c540c2c101           vcmpps xmm8,xmm7,xmm1, (lt)
0x3b29a858ea94  1754  c4c149dbf0           vpand xmm6,xmm6,xmm8
0x3b29a858ea99  1759  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x3b29a858ea9e  175e  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x3b29a858eaa2  1762  c5f85bff             vcvtdq2ps xmm7,xmm7
0x3b29a858eaa6  1766  c5c9dbf7             vpand xmm6,xmm6,xmm7
0x3b29a858eaaa  176a  c5f810bd10fdffff     vmovups xmm7,[rbp-0x2f0]
0x3b29a858eab2  1772  c5c858ff             vaddps xmm7,xmm6,xmm7
0x3b29a858eab6  1776  c4a17a7fbc0e70010000 vmovdqu [rsi+r9*1+0x170],xmm7
0x3b29a858eac0  1780  c51059c6             vmulps xmm8,xmm13,xmm6
0x3b29a858eac4  1784  c57810a520fdffff     vmovups xmm12,[rbp-0x2e0]
0x3b29a858eacc  178c  c4413858e4           vaddps xmm12,xmm8,xmm12
0x3b29a858ead1  1791  c4217a7fa40e30010000 vmovdqu [rsi+r9*1+0x130],xmm12
0x3b29a858eadb  179b  c53059c6             vmulps xmm8,xmm9,xmm6
0x3b29a858eadf  179f  c578108d30fdffff     vmovups xmm9,[rbp-0x2d0]
0x3b29a858eae7  17a7  c4413858c9           vaddps xmm9,xmm8,xmm9
0x3b29a858eaec  17ac  c4217a7f8c0ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm9
0x3b29a858eaf6  17b6  c5f859c6             vmulps xmm0,xmm0,xmm6
0x3b29a858eafa  17ba  c578108540fdffff     vmovups xmm8,[rbp-0x2c0]
0x3b29a858eb02  17c2  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x3b29a858eb07  17c7  c4a17a7f840eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm0
0x3b29a858eb11  17d1  c5d859e6             vmulps xmm4,xmm4,xmm6
0x3b29a858eb15  17d5  c5f810b550fdffff     vmovups xmm6,[rbp-0x2b0]
0x3b29a858eb1d  17dd  c5c858e4             vaddps xmm4,xmm6,xmm4
0x3b29a858eb21  17e1  c4a17a7f640e70       vmovdqu [rsi+r9*1+0x70],xmm4
0x3b29a858eb28  17e8  83c240               addl rdx,0x40
0x3b29a858eb2b  17eb  4183c7ff             addl r15,0xff
0x3b29a858eb2f  17ef  0f854bfaffff         jnz 0x3b29a858e580  <+0x1240>
0x3b29a858eb35  17f5  c57928eb             vmovapd xmm13,xmm3
0x3b29a858eb39  17f9  c5f8109de0fdffff     vmovups xmm3,[rbp-0x220]
0x3b29a858eb41  1801  c5f810b550fcffff     vmovups xmm6,[rbp-0x3b0]
0x3b29a858eb49  1809  c5f8118540fdffff     vmovups [rbp-0x2c0],xmm0
0x3b29a858eb51  1811  c5f8108540fcffff     vmovups xmm0,[rbp-0x3c0]
0x3b29a858eb59  1819  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x3b29a858eb61  1821  c578108d30fcffff     vmovups xmm9,[rbp-0x3d0]
0x3b29a858eb69  1829  c57811a520fdffff     vmovups [rbp-0x2e0],xmm12
0x3b29a858eb71  1831  c4417928e2           vmovapd xmm12,xmm10
0x3b29a858eb76  1836  c578109520fcffff     vmovups xmm10,[rbp-0x3e0]
0x3b29a858eb7e  183e  c5f811a550fdffff     vmovups [rbp-0x2b0],xmm4
0x3b29a858eb86  1846  c5f810a510fcffff     vmovups xmm4,[rbp-0x3f0]
0x3b29a858eb8e  184e  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x3b29a858eb96  1856  c5f810bd00fcffff     vmovups xmm7,[rbp-0x400]
0x3b29a858eb9e  185e  c5781085f0fbffff     vmovups xmm8,[rbp-0x410]
0x3b29a858eba6  1866  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x3b29a858ebae  186e  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x3b29a858ebb6  1876  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x3b29a858ebbe  187e  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x3b29a858ebc6  1886  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x3b29a858ebce  188e  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x3b29a858ebd6  1896  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x3b29a858ebde  189e  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x3b29a858ebe6  18a6  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x3b29a858ebee  18ae  c57811a580fdffff     vmovups [rbp-0x280],xmm12
0x3b29a858ebf6  18b6  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x3b29a858ebfe  18be  c57811ad60fdffff     vmovups [rbp-0x2a0],xmm13
0x3b29a858ec06  18c6  85c9                 testl rcx,rcx
0x3b29a858ec08  18c8  0f850e000000         jnz 0x3b29a858ec1c  <+0x18dc>
0x3b29a858ec0e  18ce  448bbdf0fdffff       movl r15,[rbp-0x210]
0x3b29a858ec15  18d5  33c0                 xorl rax,rax
0x3b29a858ec17  18d7  e96c090000           jmp 0x3b29a858f588  <+0x2248>
0x3b29a858ec1c  18dc  448bb518feffff       movl r14,[rbp-0x1e8]
0x3b29a858ec23  18e3  458d5ef0             leal r11,[r14-0x10]
0x3b29a858ec27  18e7  458be3               movl r12,r11
0x3b29a858ec2a  18ea  33c0                 xorl rax,rax
0x3b29a858ec2c  18ec  453bf3               cmpl r14,r11
0x3b29a858ec2f  18ef  440f42e0             cmovcl r12,rax
0x3b29a858ec33  18f3  458d5c2410           leal r11,[r12+0x10]
0x3b29a858ec38  18f8  448bbdf0fdffff       movl r15,[rbp-0x210]
0x3b29a858ec3f  18ff  453bfb               cmpl r15,r11
0x3b29a858ec42  1902  0f8240090000         jc 0x3b29a858f588  <+0x2248>
0x3b29a858ec48  1908  8b9df8fdffff         movl rbx,[rbp-0x208]
0x3b29a858ec4e  190e  413bdb               cmpl rbx,r11
0x3b29a858ec51  1911  0f8231090000         jc 0x3b29a858f588  <+0x2248>
0x3b29a858ec57  1917  448b9d00feffff       movl r11,[rbp-0x200]
0x3b29a858ec5e  191e  438d14a3             leal rdx,[r11+r12*4]
0x3b29a858ec62  1922  c57a6f3416           vmovdqu xmm14,[rsi+rdx*1]
0x3b29a858ec67  1927  8bbd08feffff         movl rdi,[rbp-0x1f8]
0x3b29a858ec6d  192d  468d04a7             leal r8,[rdi+r12*4]
0x3b29a858ec71  1931  c4217a6f2c06         vmovdqu xmm13,[rsi+r8*1]
0x3b29a858ec77  1937  8b8510feffff         movl rax,[rbp-0x1f0]
0x3b29a858ec7d  193d  468d1ca0             leal r11,[rax+r12*4]
0x3b29a858ec81  1941  c4217a6f1c1e         vmovdqu xmm11,[rsi+r11*1]
0x3b29a858ec87  1947  c57810a540feffff     vmovups xmm12,[rbp-0x1c0]
0x3b29a858ec8f  194f  c441185cc3           vsubps xmm8,xmm12,xmm11
0x3b29a858ec94  1954  4529e6               subl r14,r12
0x3b29a858ec97  1957  4533ff               xorl r15,r15
0x3b29a858ec9a  195a  443bf1               cmpl r14,rcx
0x3b29a858ec9d  195d  410f94c7             setzl r15l
0x3b29a858eca1  1961  c441796ee7           vmovd xmm12,r15
0x3b29a858eca6  1966  c4417970e400         vpshufd xmm12,xmm12,0x0
0x3b29a858ecac  196c  4533ff               xorl r15,r15
0x3b29a858ecaf  196f  4183fe01             cmpl r14,0x1
0x3b29a858ecb3  1973  410f97c7             setal r15l
0x3b29a858ecb7  1977  418bc6               movl rax,r14
0x3b29a858ecba  197a  2bc1                 subl rax,rcx
0x3b29a858ecbc  197c  33c9                 xorl rcx,rcx
0x3b29a858ecbe  197e  83f802               cmpl rax,0x2
0x3b29a858ecc1  1981  0f92c1               setcl cl
0x3b29a858ecc4  1984  4123cf               andl rcx,r15
0x3b29a858ecc7  1987  c4631922e101         vpinsrd xmm12,xmm12,rcx,0x1
0x3b29a858eccd  198d  4533ff               xorl r15,r15
0x3b29a858ecd0  1990  4183fe02             cmpl r14,0x2
0x3b29a858ecd4  1994  410f97c7             setal r15l
0x3b29a858ecd8  1998  33c9                 xorl rcx,rcx
0x3b29a858ecda  199a  83f803               cmpl rax,0x3
0x3b29a858ecdd  199d  0f92c1               setcl cl
0x3b29a858ece0  19a0  4123cf               andl rcx,r15
0x3b29a858ece3  19a3  c4631922e102         vpinsrd xmm12,xmm12,rcx,0x2
0x3b29a858ece9  19a9  4533ff               xorl r15,r15
0x3b29a858ecec  19ac  4183fe03             cmpl r14,0x3
0x3b29a858ecf0  19b0  410f97c7             setal r15l
0x3b29a858ecf4  19b4  33c9                 xorl rcx,rcx
0x3b29a858ecf6  19b6  83f804               cmpl rax,0x4
0x3b29a858ecf9  19b9  0f92c1               setcl cl
0x3b29a858ecfc  19bc  4123cf               andl rcx,r15
0x3b29a858ecff  19bf  c4631922e103         vpinsrd xmm12,xmm12,rcx,0x3
0x3b29a858ed05  19c5  c441785be4           vcvtdq2ps xmm12,xmm12
0x3b29a858ed0a  19ca  448bbd90feffff       movl r15,[rbp-0x170]
0x3b29a858ed11  19d1  478d24a7             leal r12,[r15+r12*4]
0x3b29a858ed15  19d5  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x3b29a858ed1b  19db  c578119d20feffff     vmovups [rbp-0x1e0],xmm11
0x3b29a858ed23  19e3  c578108d50feffff     vmovups xmm9,[rbp-0x1b0]
0x3b29a858ed2b  19eb  c5305cd8             vsubps xmm11,xmm9,xmm0
0x3b29a858ed2f  19ef  c4412059cb           vmulps xmm9,xmm11,xmm11
0x3b29a858ed34  19f4  c5f8118530feffff     vmovups [rbp-0x1d0],xmm0
0x3b29a858ed3c  19fc  c4c13859c0           vmulps xmm0,xmm8,xmm8
0x3b29a858ed41  1a01  c5b058c0             vaddps xmm0,xmm9,xmm0
0x3b29a858ed45  1a05  c578c2ca01           vcmpps xmm9,xmm0,xmm2, (lt)
0x3b29a858ed4a  1a0a  c531dbcd             vpand xmm9,xmm9,xmm5
0x3b29a858ed4e  1a0e  c441785bc9           vcvtdq2ps xmm9,xmm9
0x3b29a858ed53  1a13  c4411859c9           vmulps xmm9,xmm12,xmm9
0x3b29a858ed58  1a18  c4413859c1           vmulps xmm8,xmm8,xmm9
0x3b29a858ed5d  1a1d  c4c14858f0           vaddps xmm6,xmm6,xmm8
0x3b29a858ed62  1a22  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x3b29a858ed6c  1a2c  c4412059c1           vmulps xmm8,xmm11,xmm9
0x3b29a858ed71  1a31  c4c16058d8           vaddps xmm3,xmm3,xmm8
0x3b29a858ed76  1a36  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x3b29a858ed80  1a40  c568c2c002           vcmpps xmm8,xmm2,xmm0, (le)
0x3b29a858ed85  1a45  c578c2c901           vcmpps xmm9,xmm0,xmm1, (lt)
0x3b29a858ed8a  1a4a  c44139dbc1           vpand xmm8,xmm8,xmm9
0x3b29a858ed8f  1a4f  c44131efc9           vpxor xmm9,xmm9,xmm9
0x3b29a858ed94  1a54  c5b0c2c001           vcmpps xmm0,xmm9,xmm0, (lt)
0x3b29a858ed99  1a59  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x3b29a858ed9d  1a5d  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x3b29a858eda1  1a61  c5b9dbc0             vpand xmm0,xmm8,xmm0
0x3b29a858eda5  1a65  c4c17859c4           vmulps xmm0,xmm0,xmm12
0x3b29a858edaa  1a6a  c5f858ff             vaddps xmm7,xmm0,xmm7
0x3b29a858edae  1a6e  c4a17a7fbc0e40010000 vmovdqu [rsi+r9*1+0x140],xmm7
0x3b29a858edb8  1a78  c51059c0             vmulps xmm8,xmm13,xmm0
0x3b29a858edbc  1a7c  c5b858e4             vaddps xmm4,xmm8,xmm4
0x3b29a858edc0  1a80  c4a17a7fa40e00010000 vmovdqu [rsi+r9*1+0x100],xmm4
0x3b29a858edca  1a8a  c50859c0             vmulps xmm8,xmm14,xmm0
0x3b29a858edce  1a8e  c4413858c2           vaddps xmm8,xmm8,xmm10
0x3b29a858edd3  1a93  c4217a7f840ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm8
0x3b29a858eddd  1a9d  c578109520feffff     vmovups xmm10,[rbp-0x1e0]
0x3b29a858ede5  1aa5  c52859d0             vmulps xmm10,xmm10,xmm0
0x3b29a858ede9  1aa9  c578109d30fcffff     vmovups xmm11,[rbp-0x3d0]
0x3b29a858edf1  1ab1  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858edf6  1ab6  c4217a7f940e80000000 vmovdqu [rsi+r9*1+0x80],xmm10
0x3b29a858ee00  1ac0  c578109d30feffff     vmovups xmm11,[rbp-0x1d0]
0x3b29a858ee08  1ac8  c5a059c0             vmulps xmm0,xmm11,xmm0
0x3b29a858ee0c  1acc  c57810a540fcffff     vmovups xmm12,[rbp-0x3c0]
0x3b29a858ee14  1ad4  c59858c0             vaddps xmm0,xmm12,xmm0
0x3b29a858ee18  1ad8  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x3b29a858ee1f  1adf  c57a6f5c1610         vmovdqu xmm11,[rsi+rdx*1+0x10]
0x3b29a858ee25  1ae5  c4217a6f640610       vmovdqu xmm12,[rsi+r8*1+0x10]
0x3b29a858ee2c  1aec  c4217a6f6c1e10       vmovdqu xmm13,[rsi+r11*1+0x10]
0x3b29a858ee33  1af3  c57810b540feffff     vmovups xmm14,[rbp-0x1c0]
0x3b29a858ee3b  1afb  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x3b29a858ee43  1b03  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x3b29a858ee48  1b08  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x3b29a858ee50  1b10  49ba0000000005000000 REX.W movq r10,0x500000000
0x3b29a858ee5a  1b1a  c4c1f96eda           vmovq xmm3,r10
0x3b29a858ee5f  1b1f  49ba0000000000000000 REX.W movq r10,(nil)
0x3b29a858ee69  1b29  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x3b29a858ee6f  1b2f  c4e36122d800         vpinsrd xmm3,xmm3,rax,0x0
0x3b29a858ee75  1b35  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x3b29a858ee7d  1b3d  41ba05000000         movl r10,0x5
0x3b29a858ee83  1b43  c4c1796ee2           vmovd xmm4,r10
0x3b29a858ee88  1b48  4c8b15d2ffffff       REX.W movq r10,[rip+0xffffffd2]
0x3b29a858ee8f  1b4f  c4c3d922e201         vpinsrq xmm4,xmm4,r10,0x1
0x3b29a858ee95  1b55  c4c35922e601         vpinsrd xmm4,xmm4,r14,0x1
0x3b29a858ee9b  1b5b  c4e2593fe3           vpmaxud xmm4,xmm4,xmm3
0x3b29a858eea0  1b60  c5d976e3             vpcmpeqd xmm4,xmm4,xmm3
0x3b29a858eea4  1b64  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858eea9  1b69  c4c159efe7           vpxor xmm4,xmm4,xmm15
0x3b29a858eeae  1b6e  c5e176db             vpcmpeqd xmm3,xmm3,xmm3
0x3b29a858eeb2  1b72  c5e173f33e           vpsllq xmm3,xmm3,62
0x3b29a858eeb7  1b77  c5e173d31d           vpsrlq xmm3,xmm3,29
0x3b29a858eebc  1b7c  4c8b159effffff       REX.W movq r10,[rip+0xffffff9e]
0x3b29a858eec3  1b83  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x3b29a858eec9  1b89  c4c36122de00         vpinsrd xmm3,xmm3,r14,0x0
0x3b29a858eecf  1b8f  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x3b29a858eed7  1b97  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x3b29a858eedb  1b9b  c5c973f63f           vpsllq xmm6,xmm6,63
0x3b29a858eee0  1ba0  c5c973d63d           vpsrlq xmm6,xmm6,61
0x3b29a858eee5  1ba5  4c8b1575ffffff       REX.W movq r10,[rip+0xffffff75]
0x3b29a858eeec  1bac  c4c3c922f201         vpinsrq xmm6,xmm6,r10,0x1
0x3b29a858eef2  1bb2  c4e34922f001         vpinsrd xmm6,xmm6,rax,0x1
0x3b29a858eef8  1bb8  c4e2613fde           vpmaxud xmm3,xmm3,xmm6
0x3b29a858eefd  1bbd  c5e176de             vpcmpeqd xmm3,xmm3,xmm6
0x3b29a858ef01  1bc1  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858ef06  1bc6  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x3b29a858ef0b  1bcb  c5d9dbdb             vpand xmm3,xmm4,xmm3
0x3b29a858ef0f  1bcf  c4e27925db           vpmovsxdq xmm3,xmm3
0x3b29a858ef14  1bd4  c5f970db08           vpshufd xmm3,xmm3,0x8
0x3b29a858ef19  1bd9  33c9                 xorl rcx,rcx
0x3b29a858ef1b  1bdb  4183fe06             cmpl r14,0x6
0x3b29a858ef1f  1bdf  0f97c1               setal cl
0x3b29a858ef22  1be2  4533ff               xorl r15,r15
0x3b29a858ef25  1be5  83f807               cmpl rax,0x7
0x3b29a858ef28  1be8  410f92c7             setcl r15l
0x3b29a858ef2c  1bec  4423f9               andl r15,rcx
0x3b29a858ef2f  1bef  c4c36122df02         vpinsrd xmm3,xmm3,r15,0x2
0x3b29a858ef35  1bf5  4533ff               xorl r15,r15
0x3b29a858ef38  1bf8  4183fe07             cmpl r14,0x7
0x3b29a858ef3c  1bfc  410f97c7             setal r15l
0x3b29a858ef40  1c00  33c9                 xorl rcx,rcx
0x3b29a858ef42  1c02  83f808               cmpl rax,0x8
0x3b29a858ef45  1c05  0f92c1               setcl cl
0x3b29a858ef48  1c08  4123cf               andl rcx,r15
0x3b29a858ef4b  1c0b  c4e36122d903         vpinsrd xmm3,xmm3,rcx,0x3
0x3b29a858ef51  1c11  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x3b29a858ef55  1c15  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x3b29a858ef59  1c19  c4a17a6f642610       vmovdqu xmm4,[rsi+r12*1+0x10]
0x3b29a858ef60  1c20  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x3b29a858ef68  1c28  c5f810b550feffff     vmovups xmm6,[rbp-0x1b0]
0x3b29a858ef70  1c30  c5c85cfc             vsubps xmm7,xmm6,xmm4
0x3b29a858ef74  1c34  c578118520fcffff     vmovups [rbp-0x3e0],xmm8
0x3b29a858ef7c  1c3c  c54059c7             vmulps xmm8,xmm7,xmm7
0x3b29a858ef80  1c40  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x3b29a858ef88  1c48  c57859d0             vmulps xmm10,xmm0,xmm0
0x3b29a858ef8c  1c4c  c4413858c2           vaddps xmm8,xmm8,xmm10
0x3b29a858ef91  1c51  c538c2d201           vcmpps xmm10,xmm8,xmm2, (lt)
0x3b29a858ef96  1c56  c529dbd5             vpand xmm10,xmm10,xmm5
0x3b29a858ef9a  1c5a  c441785bd2           vcvtdq2ps xmm10,xmm10
0x3b29a858ef9f  1c5f  c4416059d2           vmulps xmm10,xmm3,xmm10
0x3b29a858efa4  1c64  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x3b29a858efa9  1c69  c5f810b5b0fcffff     vmovups xmm6,[rbp-0x350]
0x3b29a858efb1  1c71  c5c858c0             vaddps xmm0,xmm6,xmm0
0x3b29a858efb5  1c75  c4a17a7f840ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm0
0x3b29a858efbf  1c7f  c4c14059f2           vmulps xmm6,xmm7,xmm10
0x3b29a858efc4  1c84  c5f810bdf0fbffff     vmovups xmm7,[rbp-0x410]
0x3b29a858efcc  1c8c  c5c058f6             vaddps xmm6,xmm7,xmm6
0x3b29a858efd0  1c90  c4a17a7fb40e90010000 vmovdqu [rsi+r9*1+0x190],xmm6
0x3b29a858efda  1c9a  c4c168c2f802         vcmpps xmm7,xmm2,xmm8, (le)
0x3b29a858efe0  1ca0  c538c2d101           vcmpps xmm10,xmm8,xmm1, (lt)
0x3b29a858efe5  1ca5  c4c141dbfa           vpand xmm7,xmm7,xmm10
0x3b29a858efea  1caa  c44130c2c001         vcmpps xmm8,xmm9,xmm8, (lt)
0x3b29a858eff0  1cb0  c539dbc5             vpand xmm8,xmm8,xmm5
0x3b29a858eff4  1cb4  c441785bc0           vcvtdq2ps xmm8,xmm8
0x3b29a858eff9  1cb9  c4c141dbf8           vpand xmm7,xmm7,xmm8
0x3b29a858effe  1cbe  c5c059db             vmulps xmm3,xmm7,xmm3
0x3b29a858f002  1cc2  c5781085c0feffff     vmovups xmm8,[rbp-0x140]
0x3b29a858f00a  1cca  c4c16058f8           vaddps xmm7,xmm3,xmm8
0x3b29a858f00f  1ccf  c4a17a7fbc0e50010000 vmovdqu [rsi+r9*1+0x150],xmm7
0x3b29a858f019  1cd9  c51859c3             vmulps xmm8,xmm12,xmm3
0x3b29a858f01d  1cdd  c5781095b0feffff     vmovups xmm10,[rbp-0x150]
0x3b29a858f025  1ce5  c4413858c2           vaddps xmm8,xmm8,xmm10
0x3b29a858f02a  1cea  c4217a7f840e10010000 vmovdqu [rsi+r9*1+0x110],xmm8
0x3b29a858f034  1cf4  c52059d3             vmulps xmm10,xmm11,xmm3
0x3b29a858f038  1cf8  c578109de0fcffff     vmovups xmm11,[rbp-0x320]
0x3b29a858f040  1d00  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858f045  1d05  c4217a7f940ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm10
0x3b29a858f04f  1d0f  c51059db             vmulps xmm11,xmm13,xmm3
0x3b29a858f053  1d13  c57810add0fcffff     vmovups xmm13,[rbp-0x330]
0x3b29a858f05b  1d1b  c4412058dd           vaddps xmm11,xmm11,xmm13
0x3b29a858f060  1d20  c4217a7f9c0e90000000 vmovdqu [rsi+r9*1+0x90],xmm11
0x3b29a858f06a  1d2a  c5d859db             vmulps xmm3,xmm4,xmm3
0x3b29a858f06e  1d2e  c5f810a5c0fcffff     vmovups xmm4,[rbp-0x340]
0x3b29a858f076  1d36  c5d858db             vaddps xmm3,xmm4,xmm3
0x3b29a858f07a  1d3a  c4a17a7f5c0e50       vmovdqu [rsi+r9*1+0x50],xmm3
0x3b29a858f081  1d41  c5fa6f641620         vmovdqu xmm4,[rsi+rdx*1+0x20]
0x3b29a858f087  1d47  c4217a6f640620       vmovdqu xmm12,[rsi+r8*1+0x20]
0x3b29a858f08e  1d4e  c4217a6f6c1e20       vmovdqu xmm13,[rsi+r11*1+0x20]
0x3b29a858f095  1d55  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x3b29a858f09d  1d5d  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x3b29a858f0a2  1d62  c5f8119dc0fcffff     vmovups [rbp-0x340],xmm3
0x3b29a858f0aa  1d6a  49ba0000000009000000 REX.W movq r10,0x900000000
0x3b29a858f0b4  1d74  c4c1f96eda           vmovq xmm3,r10
0x3b29a858f0b9  1d79  4c8b15a1fdffff       REX.W movq r10,[rip+0xfffffda1]
0x3b29a858f0c0  1d80  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x3b29a858f0c6  1d86  c4e36122d800         vpinsrd xmm3,xmm3,rax,0x0
0x3b29a858f0cc  1d8c  c5f811b5f0fbffff     vmovups [rbp-0x410],xmm6
0x3b29a858f0d4  1d94  41ba09000000         movl r10,0x9
0x3b29a858f0da  1d9a  c4c1796ef2           vmovd xmm6,r10
0x3b29a858f0df  1d9f  4c8b157bfdffff       REX.W movq r10,[rip+0xfffffd7b]
0x3b29a858f0e6  1da6  c4c3c922f201         vpinsrq xmm6,xmm6,r10,0x1
0x3b29a858f0ec  1dac  c4c34922f601         vpinsrd xmm6,xmm6,r14,0x1
0x3b29a858f0f2  1db2  c4e2493ff3           vpmaxud xmm6,xmm6,xmm3
0x3b29a858f0f7  1db7  c5c976f3             vpcmpeqd xmm6,xmm6,xmm3
0x3b29a858f0fb  1dbb  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858f100  1dc0  c4c149eff7           vpxor xmm6,xmm6,xmm15
0x3b29a858f105  1dc5  49ba000000000a000000 REX.W movq r10,0xa00000000
0x3b29a858f10f  1dcf  c4c1f96eda           vmovq xmm3,r10
0x3b29a858f114  1dd4  4c8b1546fdffff       REX.W movq r10,[rip+0xfffffd46]
0x3b29a858f11b  1ddb  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x3b29a858f121  1de1  c4c36122de00         vpinsrd xmm3,xmm3,r14,0x0
0x3b29a858f127  1de7  c5f811bdc0feffff     vmovups [rbp-0x140],xmm7
0x3b29a858f12f  1def  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3b29a858f133  1df3  c5c173f73f           vpsllq xmm7,xmm7,63
0x3b29a858f138  1df8  c5c173d73c           vpsrlq xmm7,xmm7,60
0x3b29a858f13d  1dfd  4c8b151dfdffff       REX.W movq r10,[rip+0xfffffd1d]
0x3b29a858f144  1e04  c4c3c122fa01         vpinsrq xmm7,xmm7,r10,0x1
0x3b29a858f14a  1e0a  c4e34122f801         vpinsrd xmm7,xmm7,rax,0x1
0x3b29a858f150  1e10  c4e2613fdf           vpmaxud xmm3,xmm3,xmm7
0x3b29a858f155  1e15  c5e176df             vpcmpeqd xmm3,xmm3,xmm7
0x3b29a858f159  1e19  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858f15e  1e1e  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x3b29a858f163  1e23  c5c9dbdb             vpand xmm3,xmm6,xmm3
0x3b29a858f167  1e27  c4e27925db           vpmovsxdq xmm3,xmm3
0x3b29a858f16c  1e2c  c5f970db08           vpshufd xmm3,xmm3,0x8
0x3b29a858f171  1e31  4533ff               xorl r15,r15
0x3b29a858f174  1e34  4183fe0a             cmpl r14,0xa
0x3b29a858f178  1e38  410f97c7             setal r15l
0x3b29a858f17c  1e3c  33c9                 xorl rcx,rcx
0x3b29a858f17e  1e3e  83f80b               cmpl rax,0xb
0x3b29a858f181  1e41  0f92c1               setcl cl
0x3b29a858f184  1e44  4123cf               andl rcx,r15
0x3b29a858f187  1e47  c4e36122d902         vpinsrd xmm3,xmm3,rcx,0x2
0x3b29a858f18d  1e4d  4533ff               xorl r15,r15
0x3b29a858f190  1e50  4183fe0b             cmpl r14,0xb
0x3b29a858f194  1e54  410f97c7             setal r15l
0x3b29a858f198  1e58  33c9                 xorl rcx,rcx
0x3b29a858f19a  1e5a  83f80c               cmpl rax,0xc
0x3b29a858f19d  1e5d  0f92c1               setcl cl
0x3b29a858f1a0  1e60  4123cf               andl rcx,r15
0x3b29a858f1a3  1e63  c4e36122d903         vpinsrd xmm3,xmm3,rcx,0x3
0x3b29a858f1a9  1e69  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x3b29a858f1ad  1e6d  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x3b29a858f1b1  1e71  c4a17a6f742620       vmovdqu xmm6,[rsi+r12*1+0x20]
0x3b29a858f1b8  1e78  c5781185b0feffff     vmovups [rbp-0x150],xmm8
0x3b29a858f1c0  1e80  c5f810bd50feffff     vmovups xmm7,[rbp-0x1b0]
0x3b29a858f1c8  1e88  c5405cc6             vsubps xmm8,xmm7,xmm6
0x3b29a858f1cc  1e8c  c5781195e0fcffff     vmovups [rbp-0x320],xmm10
0x3b29a858f1d4  1e94  c4413859d0           vmulps xmm10,xmm8,xmm8
0x3b29a858f1d9  1e99  c578119dd0fcffff     vmovups [rbp-0x330],xmm11
0x3b29a858f1e1  1ea1  c57859d8             vmulps xmm11,xmm0,xmm0
0x3b29a858f1e5  1ea5  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858f1ea  1eaa  c528c2da01           vcmpps xmm11,xmm10,xmm2, (lt)
0x3b29a858f1ef  1eaf  c521dbdd             vpand xmm11,xmm11,xmm5
0x3b29a858f1f3  1eb3  c441785bdb           vcvtdq2ps xmm11,xmm11
0x3b29a858f1f8  1eb8  c4416059db           vmulps xmm11,xmm3,xmm11
0x3b29a858f1fd  1ebd  c4c17859c3           vmulps xmm0,xmm0,xmm11
0x3b29a858f202  1ec2  c5f810bdc0fdffff     vmovups xmm7,[rbp-0x240]
0x3b29a858f20a  1eca  c5c058c0             vaddps xmm0,xmm7,xmm0
0x3b29a858f20e  1ece  c4a17a7f840ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm0
0x3b29a858f218  1ed8  c4c13859fb           vmulps xmm7,xmm8,xmm11
0x3b29a858f21d  1edd  c5781085d0fdffff     vmovups xmm8,[rbp-0x230]
0x3b29a858f225  1ee5  c5b858ff             vaddps xmm7,xmm8,xmm7
0x3b29a858f229  1ee9  c4a17a7fbc0ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm7
0x3b29a858f233  1ef3  c44168c2c202         vcmpps xmm8,xmm2,xmm10, (le)
0x3b29a858f239  1ef9  c528c2d901           vcmpps xmm11,xmm10,xmm1, (lt)
0x3b29a858f23e  1efe  c44139dbc3           vpand xmm8,xmm8,xmm11
0x3b29a858f243  1f03  c44130c2d201         vcmpps xmm10,xmm9,xmm10, (lt)
0x3b29a858f249  1f09  c529dbd5             vpand xmm10,xmm10,xmm5
0x3b29a858f24d  1f0d  c441785bd2           vcvtdq2ps xmm10,xmm10
0x3b29a858f252  1f12  c44139dbc2           vpand xmm8,xmm8,xmm10
0x3b29a858f257  1f17  c5b859db             vmulps xmm3,xmm8,xmm3
0x3b29a858f25b  1f1b  c578108580fdffff     vmovups xmm8,[rbp-0x280]
0x3b29a858f263  1f23  c4416058c0           vaddps xmm8,xmm3,xmm8
0x3b29a858f268  1f28  c4217a7f840e60010000 vmovdqu [rsi+r9*1+0x160],xmm8
0x3b29a858f272  1f32  c51859d3             vmulps xmm10,xmm12,xmm3
0x3b29a858f276  1f36  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x3b29a858f27e  1f3e  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858f283  1f43  c4217a7f940e20010000 vmovdqu [rsi+r9*1+0x120],xmm10
0x3b29a858f28d  1f4d  c5d859e3             vmulps xmm4,xmm4,xmm3
0x3b29a858f291  1f51  c578109da0fdffff     vmovups xmm11,[rbp-0x260]
0x3b29a858f299  1f59  c4c15858e3           vaddps xmm4,xmm4,xmm11
0x3b29a858f29e  1f5e  c4a17a7fa40ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm4
0x3b29a858f2a8  1f68  c51059db             vmulps xmm11,xmm13,xmm3
0x3b29a858f2ac  1f6c  c57810a5d0feffff     vmovups xmm12,[rbp-0x130]
0x3b29a858f2b4  1f74  c4412058dc           vaddps xmm11,xmm11,xmm12
0x3b29a858f2b9  1f79  c4217a7f9c0ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm11
0x3b29a858f2c3  1f83  c5c859db             vmulps xmm3,xmm6,xmm3
0x3b29a858f2c7  1f87  c5f810b5b0fdffff     vmovups xmm6,[rbp-0x250]
0x3b29a858f2cf  1f8f  c5c858db             vaddps xmm3,xmm6,xmm3
0x3b29a858f2d3  1f93  c4a17a7f5c0e60       vmovdqu [rsi+r9*1+0x60],xmm3
0x3b29a858f2da  1f9a  c5fa6f741630         vmovdqu xmm6,[rsi+rdx*1+0x30]
0x3b29a858f2e0  1fa0  c4217a6f640630       vmovdqu xmm12,[rsi+r8*1+0x30]
0x3b29a858f2e7  1fa7  c4217a6f6c1e30       vmovdqu xmm13,[rsi+r11*1+0x30]
0x3b29a858f2ee  1fae  c5f81185c0fdffff     vmovups [rbp-0x240],xmm0
0x3b29a858f2f6  1fb6  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x3b29a858f2fb  1fbb  49ba000000000d000000 REX.W movq r10,0xd00000000
0x3b29a858f305  1fc5  c441f96ef2           vmovq xmm14,r10
0x3b29a858f30a  1fca  4c8b1550fbffff       REX.W movq r10,[rip+0xfffffb50]
0x3b29a858f311  1fd1  c4438922f201         vpinsrq xmm14,xmm14,r10,0x1
0x3b29a858f317  1fd7  c4630922f000         vpinsrd xmm14,xmm14,rax,0x0
0x3b29a858f31d  1fdd  c5f8119db0fdffff     vmovups [rbp-0x250],xmm3
0x3b29a858f325  1fe5  41ba0d000000         movl r10,0xd
0x3b29a858f32b  1feb  c4c1796eda           vmovd xmm3,r10
0x3b29a858f330  1ff0  4c8b152afbffff       REX.W movq r10,[rip+0xfffffb2a]
0x3b29a858f337  1ff7  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x3b29a858f33d  1ffd  c4c36122de01         vpinsrd xmm3,xmm3,r14,0x1
0x3b29a858f343  2003  c4c2613fde           vpmaxud xmm3,xmm3,xmm14
0x3b29a858f348  2008  c4c16176de           vpcmpeqd xmm3,xmm3,xmm14
0x3b29a858f34d  200d  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858f352  2012  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x3b29a858f357  2017  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x3b29a858f35c  201c  c4c10973f63d         vpsllq xmm14,xmm14,61
0x3b29a858f362  2022  c4c10973d61c         vpsrlq xmm14,xmm14,28
0x3b29a858f368  2028  4c8b15f2faffff       REX.W movq r10,[rip+0xfffffaf2]
0x3b29a858f36f  202f  c4438922f201         vpinsrq xmm14,xmm14,r10,0x1
0x3b29a858f375  2035  c4430922f600         vpinsrd xmm14,xmm14,r14,0x0
0x3b29a858f37b  203b  c5f811a5a0fdffff     vmovups [rbp-0x260],xmm4
0x3b29a858f383  2043  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x3b29a858f387  2047  c5d973f43e           vpsllq xmm4,xmm4,62
0x3b29a858f38c  204c  c5d973d43c           vpsrlq xmm4,xmm4,60
0x3b29a858f391  2051  4c8b15c9faffff       REX.W movq r10,[rip+0xfffffac9]
0x3b29a858f398  2058  c4c3d922e201         vpinsrq xmm4,xmm4,r10,0x1
0x3b29a858f39e  205e  c4e35922e001         vpinsrd xmm4,xmm4,rax,0x1
0x3b29a858f3a4  2064  c462093ff4           vpmaxud xmm14,xmm14,xmm4
0x3b29a858f3a9  2069  c50976f4             vpcmpeqd xmm14,xmm14,xmm4
0x3b29a858f3ad  206d  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3b29a858f3b2  2072  c44109eff7           vpxor xmm14,xmm14,xmm15
0x3b29a858f3b7  2077  c4c161dbde           vpand xmm3,xmm3,xmm14
0x3b29a858f3bc  207c  c4e27925db           vpmovsxdq xmm3,xmm3
0x3b29a858f3c1  2081  c5f970db08           vpshufd xmm3,xmm3,0x8
0x3b29a858f3c6  2086  4533db               xorl r11,r11
0x3b29a858f3c9  2089  4183fe0e             cmpl r14,0xe
0x3b29a858f3cd  208d  410f97c3             setal r11l
0x3b29a858f3d1  2091  4533ff               xorl r15,r15
0x3b29a858f3d4  2094  83f80f               cmpl rax,0xf
0x3b29a858f3d7  2097  410f92c7             setcl r15l
0x3b29a858f3db  209b  4523fb               andl r15,r11
0x3b29a858f3de  209e  c4c36122df02         vpinsrd xmm3,xmm3,r15,0x2
0x3b29a858f3e4  20a4  4533db               xorl r11,r11
0x3b29a858f3e7  20a7  4183fe0f             cmpl r14,0xf
0x3b29a858f3eb  20ab  410f97c3             setal r11l
0x3b29a858f3ef  20af  4533ff               xorl r15,r15
0x3b29a858f3f2  20b2  83f810               cmpl rax,0x10
0x3b29a858f3f5  20b5  410f92c7             setcl r15l
0x3b29a858f3f9  20b9  4523fb               andl r15,r11
0x3b29a858f3fc  20bc  c4c36122df03         vpinsrd xmm3,xmm3,r15,0x3
0x3b29a858f402  20c2  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x3b29a858f406  20c6  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x3b29a858f40a  20ca  c4a17a6f642630       vmovdqu xmm4,[rsi+r12*1+0x30]
0x3b29a858f411  20d1  c5f811bdd0fdffff     vmovups [rbp-0x230],xmm7
0x3b29a858f419  20d9  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x3b29a858f421  20e1  c5885cfc             vsubps xmm7,xmm14,xmm4
0x3b29a858f425  20e5  c578118580fdffff     vmovups [rbp-0x280],xmm8
0x3b29a858f42d  20ed  c54059c7             vmulps xmm8,xmm7,xmm7
0x3b29a858f431  20f1  c578119590fdffff     vmovups [rbp-0x270],xmm10
0x3b29a858f439  20f9  c57859d0             vmulps xmm10,xmm0,xmm0
0x3b29a858f43d  20fd  c4413858c2           vaddps xmm8,xmm8,xmm10
0x3b29a858f442  2102  c538c2d201           vcmpps xmm10,xmm8,xmm2, (lt)
0x3b29a858f447  2107  c529dbd5             vpand xmm10,xmm10,xmm5
0x3b29a858f44b  210b  c441785bd2           vcvtdq2ps xmm10,xmm10
0x3b29a858f450  2110  c4416059d2           vmulps xmm10,xmm3,xmm10
0x3b29a858f455  2115  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x3b29a858f45a  211a  c578119dd0feffff     vmovups [rbp-0x130],xmm11
0x3b29a858f462  2122  c578109d60fdffff     vmovups xmm11,[rbp-0x2a0]
0x3b29a858f46a  212a  c5a058c0             vaddps xmm0,xmm11,xmm0
0x3b29a858f46e  212e  c4a17a7f840ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm0
0x3b29a858f478  2138  c4c14059fa           vmulps xmm7,xmm7,xmm10
0x3b29a858f47d  213d  c578109570fdffff     vmovups xmm10,[rbp-0x290]
0x3b29a858f485  2145  c5a858ff             vaddps xmm7,xmm10,xmm7
0x3b29a858f489  2149  c4a17a7fbc0eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm7
0x3b29a858f493  2153  c44168c2d002         vcmpps xmm10,xmm2,xmm8, (le)
0x3b29a858f499  2159  c538c2d901           vcmpps xmm11,xmm8,xmm1, (lt)
0x3b29a858f49e  215e  c44129dbd3           vpand xmm10,xmm10,xmm11
0x3b29a858f4a3  2163  c44130c2c001         vcmpps xmm8,xmm9,xmm8, (lt)
0x3b29a858f4a9  2169  c539dbc5             vpand xmm8,xmm8,xmm5
0x3b29a858f4ad  216d  c441785bc0           vcvtdq2ps xmm8,xmm8
0x3b29a858f4b2  2172  c44129dbc0           vpand xmm8,xmm10,xmm8
0x3b29a858f4b7  2177  c5b859db             vmulps xmm3,xmm8,xmm3
0x3b29a858f4bb  217b  c578108d10fdffff     vmovups xmm9,[rbp-0x2f0]
0x3b29a858f4c3  2183  c4416058c1           vaddps xmm8,xmm3,xmm9
0x3b29a858f4c8  2188  c4217a7f840e70010000 vmovdqu [rsi+r9*1+0x170],xmm8
0x3b29a858f4d2  2192  c51859cb             vmulps xmm9,xmm12,xmm3
0x3b29a858f4d6  2196  c578109520fdffff     vmovups xmm10,[rbp-0x2e0]
0x3b29a858f4de  219e  c4413058ca           vaddps xmm9,xmm9,xmm10
0x3b29a858f4e3  21a3  c4217a7f8c0e30010000 vmovdqu [rsi+r9*1+0x130],xmm9
0x3b29a858f4ed  21ad  c5c859f3             vmulps xmm6,xmm6,xmm3
0x3b29a858f4f1  21b1  c578109530fdffff     vmovups xmm10,[rbp-0x2d0]
0x3b29a858f4f9  21b9  c4c14858f2           vaddps xmm6,xmm6,xmm10
0x3b29a858f4fe  21be  c4a17a7fb40ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm6
0x3b29a858f508  21c8  c51059d3             vmulps xmm10,xmm13,xmm3
0x3b29a858f50c  21cc  c578109d40fdffff     vmovups xmm11,[rbp-0x2c0]
0x3b29a858f514  21d4  c4412858d3           vaddps xmm10,xmm10,xmm11
0x3b29a858f519  21d9  c4217a7f940eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm10
0x3b29a858f523  21e3  c5d859db             vmulps xmm3,xmm4,xmm3
0x3b29a858f527  21e7  c578109d50fdffff     vmovups xmm11,[rbp-0x2b0]
0x3b29a858f52f  21ef  c52058db             vaddps xmm11,xmm11,xmm3
0x3b29a858f533  21f3  c4217a7f5c0e70       vmovdqu [rsi+r9*1+0x70],xmm11
0x3b29a858f53a  21fa  33c0                 xorl rax,rax
0x3b29a858f53c  21fc  448bbdf0fdffff       movl r15,[rbp-0x210]
0x3b29a858f543  2203  c578118510fdffff     vmovups [rbp-0x2f0],xmm8
0x3b29a858f54b  220b  c578118d20fdffff     vmovups [rbp-0x2e0],xmm9
0x3b29a858f553  2213  c5f811b530fdffff     vmovups [rbp-0x2d0],xmm6
0x3b29a858f55b  221b  c578119540fdffff     vmovups [rbp-0x2c0],xmm10
0x3b29a858f563  2223  c578119d50fdffff     vmovups [rbp-0x2b0],xmm11
0x3b29a858f56b  222b  c57928e8             vmovapd xmm13,xmm0
0x3b29a858f56f  222f  c57928f7             vmovapd xmm14,xmm7
0x3b29a858f573  2233  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x3b29a858f57b  223b  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x3b29a858f583  2243  e9f5010000           jmp 0x3b29a858f77d  <+0x243d>
0x3b29a858f588  2248  448b9d20ffffff       movl r11,[rbp-0xe0]
0x3b29a858f58f  224f  4183e30f             andl r11,0xf
0x3b29a858f593  2253  448be1               movl r12,rcx
0x3b29a858f596  2256  8bbd98feffff         movl rdi,[rbp-0x168]
0x3b29a858f59c  225c  3bf9                 cmpl rdi,rcx
0x3b29a858f59e  225e  440f42e7             cmovcl r12,rdi
0x3b29a858f5a2  2262  4589e6               movl r14,r12
0x3b29a858f5a5  2265  8b9da8feffff         movl rbx,[rbp-0x158]
0x3b29a858f5ab  226b  4439e3               cmpl rbx,r12
0x3b29a858f5ae  226e  440f42f3             cmovcl r14,rbx
0x3b29a858f5b2  2272  458be6               movl r12,r14
0x3b29a858f5b5  2275  453bde               cmpl r11,r14
0x3b29a858f5b8  2278  450f42e3             cmovcl r12,r11
0x3b29a858f5bc  227c  4585e4               testl r12,r12
0x3b29a858f5bf  227f  0f8545000000         jnz 0x3b29a858f60a  <+0x22ca>
0x3b29a858f5c5  2285  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x3b29a858f5cd  228d  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x3b29a858f5d5  2295  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x3b29a858f5dd  229d  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x3b29a858f5e5  22a5  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x3b29a858f5ed  22ad  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x3b29a858f5f5  22b5  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x3b29a858f5fd  22bd  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x3b29a858f605  22c5  e973010000           jmp 0x3b29a858f77d  <+0x243d>
0x3b29a858f60a  22ca  8b8de0feffff         movl rcx,[rbp-0x120]
0x3b29a858f610  22d0  81e1f0ffff1f         andl rcx,0x1ffffff0
0x3b29a858f616  22d6  448b9d18ffffff       movl r11,[rbp-0xe8]
0x3b29a858f61d  22dd  458d1c8b             leal r11,[r11+rcx*4]
0x3b29a858f621  22e1  448bb520ffffff       movl r14,[rbp-0xe0]
0x3b29a858f628  22e8  4181e6f0ffff1f       andl r14,0x1ffffff0
0x3b29a858f62f  22ef  8b9d28ffffff         movl rbx,[rbp-0xd8]
0x3b29a858f635  22f5  468d34b3             leal r14,[rbx+r14*4]
0x3b29a858f639  22f9  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x3b29a858f641  2301  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x3b29a858f649  2309  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x3b29a858f651  2311  c5d857e4             vxorps xmm4,xmm4,xmm4
0x3b29a858f655  2315  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x3b29a858f659  2319  c5c972f619           vpslld xmm6,xmm6,25
0x3b29a858f65e  231e  c5c972d602           vpsrld xmm6,xmm6,2
0x3b29a858f663  2323  418bdb               movl rbx,r11
0x3b29a858f666  2326  448b9de8feffff       movl r11,[rbp-0x118]
0x3b29a858f66d  232d  8b95f0feffff         movl rdx,[rbp-0x110]
0x3b29a858f673  2333  660f1f840000000000   nop
0x3b29a858f67c  233c  0f1f4000             nop
0x3b29a858f680  2340  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x3b29a858f688  2348  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x3b29a858f690  2350  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3b29a858f694  2354  0f861b060000         jna 0x3b29a858fcb5  <+0x2975>
0x3b29a858f69a  235a  c5fa103c1e           vmovss xmm7,[rsi+rbx*1]
0x3b29a858f69f  235f  c5725cc7             vsubss xmm8,xmm1,xmm7
0x3b29a858f6a3  2363  c4c13a59c8           vmulss xmm1,xmm8,xmm8
0x3b29a858f6a8  2368  c4217a100c1e         vmovss xmm9,[rsi+r11*1]
0x3b29a858f6ae  236e  c4416a5cd1           vsubss xmm10,xmm2,xmm9
0x3b29a858f6b3  2373  c4c12a59d2           vmulss xmm2,xmm10,xmm10
0x3b29a858f6b8  2378  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x3b29a858f6bc  237c  c5f82ec1             vucomiss xmm0,xmm1
0x3b29a858f6c0  2380  0f8757000000         ja 0x3b29a858f71d  <+0x23dd>
0x3b29a858f6c6  2386  c5f82ed9             vucomiss xmm3,xmm1
0x3b29a858f6ca  238a  0f8675000000         jna 0x3b29a858f745  <+0x2405>
0x3b29a858f6d0  2390  c5f82ecc             vucomiss xmm1,xmm4
0x3b29a858f6d4  2394  0f866b000000         jna 0x3b29a858f745  <+0x2405>
0x3b29a858f6da  239a  c4e27918ff           vbroadcastss xmm7,xmm7
0x3b29a858f6df  239f  c4c34121f910         vinsertps xmm7,xmm7,xmm9,0x10
0x3b29a858f6e5  23a5  c57a100416           vmovss xmm8,[rsi+rdx*1]
0x3b29a858f6ea  23aa  c4c34121f820         vinsertps xmm7,xmm7,xmm8,0x20
0x3b29a858f6f0  23b0  c4217a100436         vmovss xmm8,[rsi+r14*1]
0x3b29a858f6f6  23b6  c4c34121f830         vinsertps xmm7,xmm7,xmm8,0x30
0x3b29a858f6fc  23bc  c5d058ef             vaddps xmm5,xmm5,xmm7
0x3b29a858f700  23c0  c5ca58bd68ffffff     vaddss xmm7,xmm6,[rbp-0x98]
0x3b29a858f708  23c8  c5fb11bd40ffffff     vmovsd [rbp-0xc0],xmm7
0x3b29a858f710  23d0  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x3b29a858f718  23d8  e928000000           jmp 0x3b29a858f745  <+0x2405>
0x3b29a858f71d  23dd  c5aa58bd30ffffff     vaddss xmm7,xmm10,[rbp-0xd0]
0x3b29a858f725  23e5  c53a588560ffffff     vaddss xmm8,xmm8,[rbp-0xa0]
0x3b29a858f72d  23ed  c5fb11bd30ffffff     vmovsd [rbp-0xd0],xmm7
0x3b29a858f735  23f5  c57b118538ffffff     vmovsd [rbp-0xc8],xmm8
0x3b29a858f73d  23fd  c57b118560ffffff     vmovsd [rbp-0xa0],xmm8
0x3b29a858f745  2405  83c304               addl rbx,0x4
0x3b29a858f748  2408  4183c304             addl r11,0x4
0x3b29a858f74c  240c  83c204               addl rdx,0x4
0x3b29a858f74f  240f  4183c604             addl r14,0x4
0x3b29a858f753  2413  4183c4ff             addl r12,0xff
0x3b29a858f757  2417  0f8523ffffff         jnz 0x3b29a858f680  <+0x2340>
0x3b29a858f75d  241d  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x3b29a858f765  2425  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x3b29a858f76d  242d  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x3b29a858f775  2435  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x3b29a858f77d  243d  448bb578ffffff       movl r14,[rbp-0x88]
0x3b29a858f784  2444  458d5e01             leal r11,[r14+0x1]
0x3b29a858f788  2448  448ba570ffffff       movl r12,[rbp-0x90]
0x3b29a858f78f  244f  453be6               cmpl r12,r14
0x3b29a858f792  2452  0f8568eaffff         jnz 0x3b29a858e200  <+0xec0>
0x3b29a858f798  2458  c57b108530ffffff     vmovsd xmm8,[rbp-0xd0]
0x3b29a858f7a0  2460  c4217a11440e28       vmovss [rsi+r9*1+0x28],xmm8
0x3b29a858f7a7  2467  c5fb10bd38ffffff     vmovsd xmm7,[rbp-0xc8]
0x3b29a858f7af  246f  c4a17a117c0e24       vmovss [rsi+r9*1+0x24],xmm7
0x3b29a858f7b6  2476  c5fb10b540ffffff     vmovsd xmm6,[rbp-0xc0]
0x3b29a858f7be  247e  c4a17a11740e20       vmovss [rsi+r9*1+0x20],xmm6
0x3b29a858f7c5  2485  c5f8108550ffffff     vmovups xmm0,[rbp-0xb0]
0x3b29a858f7cd  248d  c4a17a7f440e10       vmovdqu [rsi+r9*1+0x10],xmm0
0x3b29a858f7d4  2494  e906000000           jmp 0x3b29a858f7df  <+0x249f>
0x3b29a858f7d9  2499  448b4de0             movl r9,[rbp-0x20]
0x3b29a858f7dd  249d  33c0                 xorl rax,rax
0x3b29a858f7df  249f  418d5110             leal rdx,[r9+0x10]
0x3b29a858f7e3  24a3  4c8bd8               REX.W movq r11,rax
0x3b29a858f7e6  24a6  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x3b29a858f7ed  24ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858f7f1  24b1  8b4598               movl rax,[rbp-0x68]
0x3b29a858f7f4  24b4  e84745f2ff           call 0x3b29a84b3d40  (jump table)
0x3b29a858f7f9  24b9  8b5de0               movl rbx,[rbp-0x20]
0x3b29a858f7fc  24bc  8d4b30               leal rcx,[rbx+0x30]
0x3b29a858f7ff  24bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858f803  24c3  8b4598               movl rax,[rbp-0x68]
0x3b29a858f806  24c6  8b5590               movl rdx,[rbp-0x70]
0x3b29a858f809  24c9  c5fb104d88           vmovsd xmm1,[rbp-0x78]
0x3b29a858f80e  24ce  c5fb105580           vmovsd xmm2,[rbp-0x80]
0x3b29a858f813  24d3  448b8d78ffffff       movl r9,[rbp-0x88]
0x3b29a858f81a  24da  e82945f2ff           call 0x3b29a84b3d48  (jump table)
0x3b29a858f81f  24df  448b5da0             movl r11,[rbp-0x60]
0x3b29a858f823  24e3  443b5dd0             cmpl r11,[rbp-0x30]
0x3b29a858f827  24e7  0f86b1000000         jna 0x3b29a858f8de  <+0x259e>
0x3b29a858f82d  24ed  8b75d0               movl rsi,[rbp-0x30]
0x3b29a858f830  24f0  448b65a8             movl r12,[rbp-0x58]
0x3b29a858f834  24f4  458d3cb4             leal r15,[r12+rsi*4]
0x3b29a858f838  24f8  448b75e0             movl r14,[rbp-0x20]
0x3b29a858f83c  24fc  488b45c8             REX.W movq rax,[rbp-0x38]
0x3b29a858f840  2500  c4a17a10443040       vmovss xmm0,[rax+r14*1+0x40]
0x3b29a858f847  2507  c4a17a110438         vmovss [rax+r15*1],xmm0
0x3b29a858f84d  250d  448b7db0             movl r15,[rbp-0x50]
0x3b29a858f851  2511  418d1cb7             leal rbx,[r15+rsi*4]
0x3b29a858f855  2515  c4a17a10443044       vmovss xmm0,[rax+r14*1+0x44]
0x3b29a858f85c  251c  c5fa110418           vmovss [rax+rbx*1],xmm0
0x3b29a858f861  2521  8b5db8               movl rbx,[rbp-0x48]
0x3b29a858f864  2524  8d14b3               leal rdx,[rbx+rsi*4]
0x3b29a858f867  2527  c4a17a10443048       vmovss xmm0,[rax+r14*1+0x48]
0x3b29a858f86e  252e  c5fa110410           vmovss [rax+rdx*1],xmm0
0x3b29a858f873  2533  8b55c0               movl rdx,[rbp-0x40]
0x3b29a858f876  2536  8d0cb2               leal rcx,[rdx+rsi*4]
0x3b29a858f879  2539  c4a17a1044304c       vmovss xmm0,[rax+r14*1+0x4c]
0x3b29a858f880  2540  c5fa110408           vmovss [rax+rcx*1],xmm0
0x3b29a858f885  2545  458bd3               movl r10,r11
0x3b29a858f888  2548  4c8bd8               REX.W movq r11,rax
0x3b29a858f88b  254b  8bc2                 movl rax,rdx
0x3b29a858f88d  254d  418bd2               movl rdx,r10
0x3b29a858f890  2550  4489e1               movl rcx,r12
0x3b29a858f893  2553  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3b29a858f898  2558  c4c13972f019         vpslld xmm8,xmm8,25
0x3b29a858f89e  255e  c4c13972d002         vpsrld xmm8,xmm8,2
0x3b29a858f8a4  2564  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3b29a858f8a8  2568  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x3b29a858f8b0  2570  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x3b29a858f8b8  2578  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x3b29a858f8c0  2580  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x3b29a858f8c8  2588  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x3b29a858f8d0  2590  33ff                 xorl rdi,rdi
0x3b29a858f8d2  2592  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858f8d9  2599  e959000000           jmp 0x3b29a858f937  <+0x25f7>
0x3b29a858f8de  259e  8b75d0               movl rsi,[rbp-0x30]
0x3b29a858f8e1  25a1  418bd3               movl rdx,r11
0x3b29a858f8e4  25a4  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858f8e8  25a8  8b45c0               movl rax,[rbp-0x40]
0x3b29a858f8eb  25ab  8b5db8               movl rbx,[rbp-0x48]
0x3b29a858f8ee  25ae  8b4da8               movl rcx,[rbp-0x58]
0x3b29a858f8f1  25b1  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3b29a858f8f6  25b6  c4c13972f019         vpslld xmm8,xmm8,25
0x3b29a858f8fc  25bc  c4c13972d002         vpsrld xmm8,xmm8,2
0x3b29a858f902  25c2  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3b29a858f906  25c6  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x3b29a858f90e  25ce  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x3b29a858f916  25d6  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x3b29a858f91e  25de  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x3b29a858f926  25e6  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x3b29a858f92e  25ee  33ff                 xorl rdi,rdi
0x3b29a858f930  25f0  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858f937  25f7  83c601               addl rsi,0x1
0x3b29a858f93a  25fa  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858f93e  25fe  443bfe               cmpl r15,rsi
0x3b29a858f941  2601  0f8579e2ffff         jnz 0x3b29a858dbc0  <+0x880>
0x3b29a858f947  2607  448b5de0             movl r11,[rbp-0x20]
0x3b29a858f94b  260b  4181c300020000       addl r11,0x200
0x3b29a858f952  2612  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x3b29a858f956  2616  45891c24             movl [r12],r11
0x3b29a858f95a  261a  488be5               REX.W movq rsp,rbp
0x3b29a858f95d  261d  5d                   pop rbp
0x3b29a858f95e  261e  c3                   retl
0x3b29a858f95f  261f  e86c4bf2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858f964  2624  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858f968  2628  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3b29a858f96c  262c  8b45d8               movl rax,[rbp-0x28]
0x3b29a858f96f  262f  e9f0d9ffff           jmp 0x3b29a858d364  <+0x24>
0x3b29a858f974  2634  c5f92ef6             vucomisd xmm6,xmm6
0x3b29a858f978  2638  0f8b0a000000         jpo 0x3b29a858f988  <+0x2648>
0x3b29a858f97e  263e  33d2                 xorl rdx,rdx
0x3b29a858f980  2640  4c8bf2               REX.W movq r14,rdx
0x3b29a858f983  2643  e945dbffff           jmp 0x3b29a858d4cd  <+0x18d>
0x3b29a858f988  2648  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3b29a858f98c  264c  c5f82ef5             vucomiss xmm6,xmm5
0x3b29a858f990  2650  0f870b000000         ja 0x3b29a858f9a1  <+0x2661>
0x3b29a858f996  2656  41beffffffff         movl r14,0xffffffff
0x3b29a858f99c  265c  e92cdbffff           jmp 0x3b29a858d4cd  <+0x18d>
0x3b29a858f9a1  2661  4533f6               xorl r14,r14
0x3b29a858f9a4  2664  e924dbffff           jmp 0x3b29a858d4cd  <+0x18d>
0x3b29a858f9a9  2669  c5f92eff             vucomisd xmm7,xmm7
0x3b29a858f9ad  266d  0f8b08000000         jpo 0x3b29a858f9bb  <+0x267b>
0x3b29a858f9b3  2673  4533f6               xorl r14,r14
0x3b29a858f9b6  2676  e979dbffff           jmp 0x3b29a858d534  <+0x1f4>
0x3b29a858f9bb  267b  c5c057ff             vxorps xmm7,xmm7,xmm7
0x3b29a858f9bf  267f  c5f82efe             vucomiss xmm7,xmm6
0x3b29a858f9c3  2683  77ee                 ja 0x3b29a858f9b3  <+0x2673>
0x3b29a858f9c5  2685  41beffffffff         movl r14,0xffffffff
0x3b29a858f9cb  268b  e964dbffff           jmp 0x3b29a858d534  <+0x1f4>
0x3b29a858f9d0  2690  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858f9d8  2698  4c8945d0             REX.W movq [rbp-0x30],r8
0x3b29a858f9dc  269c  48897db0             REX.W movq [rbp-0x50],rdi
0x3b29a858f9e0  26a0  e8eb4af2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858f9e5  26a5  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858f9e9  26a9  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858f9f0  26b0  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858f9f4  26b4  8b7db0               movl rdi,[rbp-0x50]
0x3b29a858f9f7  26b7  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858f9ff  26bf  8b75a8               movl rsi,[rbp-0x58]
0x3b29a858fa02  26c2  8b4db8               movl rcx,[rbp-0x48]
0x3b29a858fa05  26c5  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858fa08  26c8  448b45d0             movl r8,[rbp-0x30]
0x3b29a858fa0c  26cc  e979dcffff           jmp 0x3b29a858d68a  <+0x34a>
0x3b29a858fa11  26d1  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858fa19  26d9  48894db8             REX.W movq [rbp-0x48],rcx
0x3b29a858fa1d  26dd  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858fa21  26e1  e8aa4af2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fa26  26e6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858fa2a  26ea  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858fa31  26f1  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858fa35  26f5  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858fa38  26f8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858fa40  2700  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858fa43  2703  8b45a8               movl rax,[rbp-0x58]
0x3b29a858fa46  2706  448b75b0             movl r14,[rbp-0x50]
0x3b29a858fa4a  270a  8b4db8               movl rcx,[rbp-0x48]
0x3b29a858fa4d  270d  e938ddffff           jmp 0x3b29a858d78a  <+0x44a>
0x3b29a858fa52  2712  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858fa5a  271a  48894db0             REX.W movq [rbp-0x50],rcx
0x3b29a858fa5e  271e  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858fa62  2722  e8694af2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fa67  2727  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858fa6b  272b  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858fa72  2732  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858fa76  2736  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858fa79  2739  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858fa81  2741  8b5dc0               movl rbx,[rbp-0x40]
0x3b29a858fa84  2744  8b45b8               movl rax,[rbp-0x48]
0x3b29a858fa87  2747  448b7598             movl r14,[rbp-0x68]
0x3b29a858fa8b  274b  8b4db0               movl rcx,[rbp-0x50]
0x3b29a858fa8e  274e  e9f7ddffff           jmp 0x3b29a858d88a  <+0x54a>
0x3b29a858fa93  2753  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x3b29a858fa9b  275b  48895da0             REX.W movq [rbp-0x60],rbx
0x3b29a858fa9f  275f  488955d0             REX.W movq [rbp-0x30],rdx
0x3b29a858faa3  2763  e8284af2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858faa8  2768  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858faac  276c  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858fab3  2773  8b55d0               movl rdx,[rbp-0x30]
0x3b29a858fab6  2776  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x3b29a858fabe  277e  448b7dd8             movl r15,[rbp-0x28]
0x3b29a858fac2  2782  8b45c0               movl rax,[rbp-0x40]
0x3b29a858fac5  2785  448b75b8             movl r14,[rbp-0x48]
0x3b29a858fac9  2789  8b5da0               movl rbx,[rbp-0x60]
0x3b29a858facc  278c  e9b9deffff           jmp 0x3b29a858d98a  <+0x64a>
0x3b29a858fad1  2791  488975d0             REX.W movq [rbp-0x30],rsi
0x3b29a858fad5  2795  e8f649f2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fada  279a  8b75d0               movl rsi,[rbp-0x30]
0x3b29a858fadd  279d  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x3b29a858fae1  27a1  8b45c0               movl rax,[rbp-0x40]
0x3b29a858fae4  27a4  8b5db8               movl rbx,[rbp-0x48]
0x3b29a858fae7  27a7  8b4da8               movl rcx,[rbp-0x58]
0x3b29a858faea  27aa  8b55a0               movl rdx,[rbp-0x60]
0x3b29a858faed  27ad  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3b29a858faf2  27b2  c4c13972f019         vpslld xmm8,xmm8,25
0x3b29a858faf8  27b8  c4c13972d002         vpsrld xmm8,xmm8,2
0x3b29a858fafe  27be  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3b29a858fb02  27c2  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x3b29a858fb0a  27ca  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x3b29a858fb12  27d2  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x3b29a858fb1a  27da  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x3b29a858fb22  27e2  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x3b29a858fb2a  27ea  33ff                 xorl rdi,rdi
0x3b29a858fb2c  27ec  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3b29a858fb33  27f3  e992e0ffff           jmp 0x3b29a858dbca  <+0x88a>
0x3b29a858fb38  27f8  c5f92eed             vucomisd xmm5,xmm5
0x3b29a858fb3c  27fc  0f8b08000000         jpo 0x3b29a858fb4a  <+0x280a>
0x3b29a858fb42  2802  4533db               xorl r11,r11
0x3b29a858fb45  2805  e9afe2ffff           jmp 0x3b29a858ddf9  <+0xab9>
0x3b29a858fb4a  280a  c5f82ee3             vucomiss xmm4,xmm3
0x3b29a858fb4e  280e  77f2                 ja 0x3b29a858fb42  <+0x2802>
0x3b29a858fb50  2810  41bbffffffff         movl r11,0xffffffff
0x3b29a858fb56  2816  e99ee2ffff           jmp 0x3b29a858ddf9  <+0xab9>
0x3b29a858fb5b  281b  c5f92ef6             vucomisd xmm6,xmm6
0x3b29a858fb5f  281f  0f8b08000000         jpo 0x3b29a858fb6d  <+0x282d>
0x3b29a858fb65  2825  4533db               xorl r11,r11
0x3b29a858fb68  2828  e976e3ffff           jmp 0x3b29a858dee3  <+0xba3>
0x3b29a858fb6d  282d  c5f82ee3             vucomiss xmm4,xmm3
0x3b29a858fb71  2831  77f2                 ja 0x3b29a858fb65  <+0x2825>
0x3b29a858fb73  2833  41bbffffffff         movl r11,0xffffffff
0x3b29a858fb79  2839  e965e3ffff           jmp 0x3b29a858dee3  <+0xba3>
0x3b29a858fb7e  283e  c578118de0fdffff     vmovups [rbp-0x220],xmm9
0x3b29a858fb86  2846  c578119550fcffff     vmovups [rbp-0x3b0],xmm10
0x3b29a858fb8e  284e  c578119d40fcffff     vmovups [rbp-0x3c0],xmm11
0x3b29a858fb96  2856  c57811a530fcffff     vmovups [rbp-0x3d0],xmm12
0x3b29a858fb9e  285e  c57811ad20fcffff     vmovups [rbp-0x3e0],xmm13
0x3b29a858fba6  2866  c57811b510fcffff     vmovups [rbp-0x3f0],xmm14
0x3b29a858fbae  286e  c5f8118d00fcffff     vmovups [rbp-0x400],xmm1
0x3b29a858fbb6  2876  c5f81195f0fbffff     vmovups [rbp-0x410],xmm2
0x3b29a858fbbe  287e  e80d49f2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fbc3  2883  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x3b29a858fbc7  2887  448bb578ffffff       movl r14,[rbp-0x88]
0x3b29a858fbce  288e  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x3b29a858fbd6  2896  448bbd90feffff       movl r15,[rbp-0x170]
0x3b29a858fbdd  289d  448b8d00feffff       movl r9,[rbp-0x200]
0x3b29a858fbe4  28a4  8b8df0fdffff         movl rcx,[rbp-0x210]
0x3b29a858fbea  28aa  33c0                 xorl rax,rax
0x3b29a858fbec  28ac  c578108de0fdffff     vmovups xmm9,[rbp-0x220]
0x3b29a858fbf4  28b4  c578109550fcffff     vmovups xmm10,[rbp-0x3b0]
0x3b29a858fbfc  28bc  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x3b29a858fc04  28c4  c57810a530fcffff     vmovups xmm12,[rbp-0x3d0]
0x3b29a858fc0c  28cc  c57810ad20fcffff     vmovups xmm13,[rbp-0x3e0]
0x3b29a858fc14  28d4  c57810b510fcffff     vmovups xmm14,[rbp-0x3f0]
0x3b29a858fc1c  28dc  c5f8108d00fcffff     vmovups xmm1,[rbp-0x400]
0x3b29a858fc24  28e4  c5f81095f0fbffff     vmovups xmm2,[rbp-0x410]
0x3b29a858fc2c  28ec  8b9598fcffff         movl rdx,[rbp-0x368]
0x3b29a858fc32  28f2  8bbd90fcffff         movl rdi,[rbp-0x370]
0x3b29a858fc38  28f8  448b8588fcffff       movl r8,[rbp-0x378]
0x3b29a858fc3f  28ff  448b9d80fcffff       movl r11,[rbp-0x380]
0x3b29a858fc46  2906  8b9d78fcffff         movl rbx,[rbp-0x388]
0x3b29a858fc4c  290c  e95fe6ffff           jmp 0x3b29a858e2b0  <+0xf70>
0x3b29a858fc51  2911  48898da0feffff       REX.W movq [rbp-0x160],rcx
0x3b29a858fc58  2918  4c89bd08fdffff       REX.W movq [rbp-0x2f8],r15
0x3b29a858fc5f  291f  48899500fdffff       REX.W movq [rbp-0x300],rdx
0x3b29a858fc66  2926  48899df8fcffff       REX.W movq [rbp-0x308],rbx
0x3b29a858fc6d  292d  e85e48f2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fc72  2932  448b4de0             movl r9,[rbp-0x20]
0x3b29a858fc76  2936  488b75c8             REX.W movq rsi,[rbp-0x38]
0x3b29a858fc7a  293a  448b9d28ffffff       movl r11,[rbp-0xd8]
0x3b29a858fc81  2941  448ba518ffffff       movl r12,[rbp-0xe8]
0x3b29a858fc88  2948  8b8da0feffff         movl rcx,[rbp-0x160]
0x3b29a858fc8e  294e  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x3b29a858fc96  2956  448bbd08fdffff       movl r15,[rbp-0x2f8]
0x3b29a858fc9d  295d  8b9500fdffff         movl rdx,[rbp-0x300]
0x3b29a858fca3  2963  448b85f0fcffff       movl r8,[rbp-0x310]
0x3b29a858fcaa  296a  8b9df8fcffff         movl rbx,[rbp-0x308]
0x3b29a858fcb0  2970  e933e9ffff           jmp 0x3b29a858e5e8  <+0x12a8>
0x3b29a858fcb5  2975  4c89a528ffffff       REX.W movq [rbp-0xd8],r12
0x3b29a858fcbc  297c  4c89b520ffffff       REX.W movq [rbp-0xe0],r14
0x3b29a858fcc3  2983  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x3b29a858fcca  298a  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x3b29a858fcd1  2991  48899d18ffffff       REX.W movq [rbp-0xe8],rbx
0x3b29a858fcd8  2998  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x3b29a858fce0  29a0  e8eb47f2ff           call 0x3b29a84b44d0  (jump table)
0x3b29a858fce5  29a5  448b4de0             movl r9,[rbp-0x20]
0x3b29a858fce9  29a9  488b75c8             REX.W movq rsi,[rbp-0x38]
0x3b29a858fced  29ad  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x3b29a858fcf5  29b5  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x3b29a858fcfd  29bd  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x3b29a858fd05  29c5  c57810ad60fdffff     vmovups xmm13,[rbp-0x2a0]
0x3b29a858fd0d  29cd  448ba528ffffff       movl r12,[rbp-0xd8]
0x3b29a858fd14  29d4  448bb520ffffff       movl r14,[rbp-0xe0]
0x3b29a858fd1b  29db  8b95f0feffff         movl rdx,[rbp-0x110]
0x3b29a858fd21  29e1  448b9de8feffff       movl r11,[rbp-0x118]
0x3b29a858fd28  29e8  8b9d18ffffff         movl rbx,[rbp-0xe8]
0x3b29a858fd2e  29ee  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x3b29a858fd36  29f6  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x3b29a858fd3a  29fa  c5c972f619           vpslld xmm6,xmm6,25
0x3b29a858fd3f  29ff  c5c972d602           vpsrld xmm6,xmm6,2
0x3b29a858fd44  2a04  c5d857e4             vxorps xmm4,xmm4,xmm4
0x3b29a858fd48  2a08  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x3b29a858fd50  2a10  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x3b29a858fd58  2a18  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x3b29a858fd60  2a20  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x3b29a858fd68  2a28  448bbdf0fdffff       movl r15,[rbp-0x210]
0x3b29a858fd6f  2a2f  33c0                 xorl rax,rax
0x3b29a858fd71  2a31  e924f9ffff           jmp 0x3b29a858f69a  <+0x235a>
0x3b29a858fd76  2a36  e89544f2ff           call 0x3b29a84b4210  (jump table)
0x3b29a858fd7b  2a3b  90                   nop

Protected instructions:
 pc offset
        41         
        62         
       10f         
       24d         
       253         
       25b         
       260         
       268         
       271         
       276         
       27b         
       280         
       2aa         
       2be         
       2c3         
       2cf         
       2d4         
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
       5e0         
       5e5         
       5ed         
       5fa         
       603         
       608         
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
       7dc         
       88a         
       89f         
       8b4         
       8c9         
       8de         
       8e7         
       8ed         
       8fd         
       903         
       913         
       919         
       930         
       93a         
       941         
       948         
       94f         
       955         
       95e         
       96c         
       973         
       982         
       98a         
       c16         
       c1b         
       c24         
       c2e         
       c38         
       c42         
       c4c         
       c53         
       c5d         
       c67         
       c71         
       c7b         
       c85         
       c8f         
       c9e         
       cb0         
       cc2         
       cd4         
       ce6         
       cf8         
       d0a         
       d19         
       d2b         
       d3d         
       d4f         
       d61         
       d73         
       d85         
       d94         
       da6         
       f96         
       f9e         
      12ab         
      12b4         
      12bd         
      12cc         
      131a         
      1334         
      137e         
      13a0         
      13bb         
      13d6         
      13f0         
      13fb         
      1405         
      1417         
      1435         
      147b         
      1497         
      14ce         
      14e9         
      1504         
      151f         
      1539         
      1544         
      154e         
      1560         
      157e         
      15d5         
      15f1         
      162c         
      1648         
      1664         
      1680         
      169b         
      16a6         
      16b0         
      16c2         
      16d8         
      1725         
      1740         
      1776         
      1791         
      17ac         
      17c7         
      17e1         
      1922         
      1931         
      1941         
      19d5         
      1a22         
      1a36         
      1a6e         
      1a80         
      1a93         
      1ab6         
      1ad8         
      1adf         
      1ae5         
      1aec         
      1c19         
      1c75         
      1c90         
      1ccf         
      1cea         
      1d05         
      1d20         
      1d3a         
      1d41         
      1d47         
      1d4e         
      1e71         
      1ece         
      1ee9         
      1f28         
      1f43         
      1f5e         
      1f79         
      1f93         
      1f9a         
      1fa0         
      1fa7         
      20ca         
      212e         
      2149         
      2188         
      21a3         
      21be         
      21d9         
      21f3         
      235a         
      2368         
      23a5         
      23b0         
      2460         
      246f         
      247e         
      248d         
      2500         
      2507         
      2515         
      251c         
      2527         
      252e         
      2539         
      2540         

Source positions:
 pc offset  position
        41        78
        62       115
       10f       184
       24d       297
       253       307
       25b       311
       260       318
       268       322
       271       333
       276       338
       27b       343
       280       348
       285       351
       29f       365
       2be       378
       2c3       385
       2cf       397
       2d4       404
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
       5e0       883
       5e5       888
       5ed       899
       5fa       918
       603       923
       608       930
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
       7dc      1306
       88a      1333
       89f      1345
       8b4      1357
       8c9      1369
       8de      1379
       8e7      1392
       8ed      1399
       8fd      1407
       903      1414
       913      1422
       919      1431
       929      1439
       936      1442
       941      1449
       948      1456
       94f      1463
       955      1470
       95e      1477
       96c      1500
       973      1506
       97b      1514
       98a      1522
       998      1539
       c0b      1776
       c1b      1783
       c20      1797
       c2e      1806
       c38      1815
       c42      1824
       c4c      1833
       c53      1841
       c5d      1850
       c67      1859
       c71      1868
       c7b      1877
       c85      1886
       c8f      1895
       c96      1903
       ca8      1912
       cba      1921
       ccc      1930
       cde      1939
       cf0      1948
       d02      1957
       d11      1965
       d23      1974
       d35      1983
       d47      1992
       d59      2001
       d6b      2010
       d7d      2019
       d8c      2027
       d9e      2036
       f96      2138
       f9e      2151
      12ab      2447
      12b4      2460
      12bd      2479
      12cc      2499
      131a      2548
      1334      2569
      137e      2632
      13a0      2653
      13bb      2674
      13d6      2695
      13f0      2716
      13fb      2725
      1405      2736
      140f      2753
      142d      2771
      147b      2820
      1497      2841
      14ce      2886
      14e9      2907
      1504      2928
      151f      2949
      1539      2970
      1544      2979
      154e      2990
      1558      3007
      1576      3025
      15d5      3074
      15f1      3095
      162c      3140
      1648      3161
      1664      3182
      1680      3203
      169b      3224
      16a6      3233
      16b0      3244
      16ba      3261
      16d8      3279
      1725      3328
      1740      3349
      1776      3394
      1791      3415
      17ac      3436
      17c7      3457
      17e1      3478
      1922      3556
      1931      3569
      1941      3588
      19d5      3672
      1a22      3724
      1a36      3745
      1a6e      3813
      1a80      3834
      1a93      3855
      1ab6      3876
      1ad8      3897
      1adf      3903
      1ae5      3911
      1aec      3925
      1c19      4098
      1c75      4150
      1c90      4171
      1ccf      4221
      1cea      4242
      1d05      4263
      1d20      4284
      1d3a      4305
      1d41      4311
      1d47      4319
      1d4e      4333
      1e71      4506
      1ece      4558
      1ee9      4579
      1f28      4629
      1f43      4650
      1f5e      4671
      1f79      4692
      1f93      4713
      1f9a      4719
      1fa0      4727
      1fa7      4741
      20ca      4914
      212e      4966
      2149      4987
      2188      5037
      21a3      5058
      21be      5079
      21d9      5100
      21f3      5121
      235a      5212
      2368      5227
      23a5      5278
      23b0      5286
      2458      5387
      2467      5394
      2476      5401
      2485      5408
      24a3      5424
      24bf      5454
      24f8      5474
      2507      5477
      2515      5487
      251c      5490
      2527      5500
      252e      5503
      2539      5513
      2540      5516
      261f         0
      2690       420
      26d1       595
      2712       771
      2753       943
      2791      1325
      283e      2075
      2911      2438
      2975      5202
      2a36      1539

Safepoints (stack slots = 132, entries = 1, byte size = 31)
0x3b29a858d5df    29f  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 58)
0x3b29a858d5db  internal wasm call
0x3b29a858d6fe  internal wasm call
0x3b29a858d7f2  internal wasm call
0x3b29a858d8f2  internal wasm call
0x3b29a858d9f3  internal wasm call
0x3b29a858dd23  external reference (0x193f2f0)
0x3b29a858f7f5  internal wasm call
0x3b29a858f81b  internal wasm call
0x3b29a858f960  wasm stub call  (0x3b29a84b44d0)
0x3b29a858f9e1  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fa22  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fa63  wasm stub call  (0x3b29a84b44d0)
0x3b29a858faa4  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fad6  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fbbf  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fc6e  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fce1  wasm stub call  (0x3b29a84b44d0)
0x3b29a858fd77  wasm stub call  (0x3b29a84b4210)
