name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 8704 = 8704 + 0 padding)
Instructions (size = 8668)
0x177442cbc2c0     0  55                   push rbp
0x177442cbc2c1     1  4889e5               REX.W movq rbp,rsp
0x177442cbc2c4     4  6a08                 push 0x8
0x177442cbc2c6     6  56                   push rsi
0x177442cbc2c7     7  4881ecb0040000       REX.W subq rsp,0x4b0
0x177442cbc2ce     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x177442cbc2d2    12  488945d8             REX.W movq [rbp-0x28],rax
0x177442cbc2d6    16  4c895dc8             REX.W movq [rbp-0x38],r11
0x177442cbc2da    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbc2de    1e  0f86931d0000         jna 0x177442cbe077  <+0x1db7>
0x177442cbc2e4    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x177442cbc2e8    28  458b3c24             movl r15,[r12]
0x177442cbc2ec    2c  418d9f00feffff       leal rbx,[r15-0x200]
0x177442cbc2f3    33  41891c24             movl [r12],rbx
0x177442cbc2f7    37  448bf8               movl r15,rax
0x177442cbc2fa    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x177442cbc301    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x177442cbc307    47  c5fa16d0             vmovshdup xmm2,xmm0
0x177442cbc30b    4b  41ba0000803a         movl r10,0x3a800000
0x177442cbc311    51  c4c1796eda           vmovd xmm3,r10
0x177442cbc316    56  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x177442cbc31a    5a  c5f828c8             vmovaps xmm1,xmm0
0x177442cbc31e    5e  c5e259d9             vmulss xmm3,xmm3,xmm1
0x177442cbc322    62  c4817a10ac3ba0000000 vmovss xmm5,[r11+r15*1+0xa0]
0x177442cbc32c    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x177442cbc330    70  48895de0             REX.W movq [rbp-0x20],rbx
0x177442cbc334    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x177442cbc33b    7b  c5fb115580           vmovsd [rbp-0x80],xmm2
0x177442cbc340    80  c5fb114d88           vmovsd [rbp-0x78],xmm1
0x177442cbc345    85  c5fb116dd0           vmovsd [rbp-0x30],xmm5
0x177442cbc34a    8a  c5f82eed             vucomiss xmm5,xmm5
0x177442cbc34e    8e  7a06                 jpe 0x177442cbc356  <+0x96>
0x177442cbc350    90  0f8409000000         jz 0x177442cbc35f  <+0x9f>
0x177442cbc356    96  c5f928f3             vmovapd xmm6,xmm3
0x177442cbc35a    9a  e904000000           jmp 0x177442cbc363  <+0xa3>
0x177442cbc35f    9f  c5f928f5             vmovapd xmm6,xmm5
0x177442cbc363    a3  c5f82edb             vucomiss xmm3,xmm3
0x177442cbc367    a7  7a06                 jpe 0x177442cbc36f  <+0xaf>
0x177442cbc369    a9  0f8404000000         jz 0x177442cbc373  <+0xb3>
0x177442cbc36f    af  c5f928de             vmovapd xmm3,xmm6
0x177442cbc373    b3  c5f82ef3             vucomiss xmm6,xmm3
0x177442cbc377    b7  0f8704000000         ja 0x177442cbc381  <+0xc1>
0x177442cbc37d    bd  c5f928f3             vmovapd xmm6,xmm3
0x177442cbc381    c1  c5f82ef6             vucomiss xmm6,xmm6
0x177442cbc385    c5  7a06                 jpe 0x177442cbc38d  <+0xcd>
0x177442cbc387    c7  0f8409000000         jz 0x177442cbc396  <+0xd6>
0x177442cbc38d    cd  c5f928dc             vmovapd xmm3,xmm4
0x177442cbc391    d1  e904000000           jmp 0x177442cbc39a  <+0xda>
0x177442cbc396    d6  c5f928de             vmovapd xmm3,xmm6
0x177442cbc39a    da  c5f82ee4             vucomiss xmm4,xmm4
0x177442cbc39e    de  7a06                 jpe 0x177442cbc3a6  <+0xe6>
0x177442cbc3a0    e0  0f8404000000         jz 0x177442cbc3aa  <+0xea>
0x177442cbc3a6    e6  c5f928e3             vmovapd xmm4,xmm3
0x177442cbc3aa    ea  c5f82edc             vucomiss xmm3,xmm4
0x177442cbc3ae    ee  0f8704000000         ja 0x177442cbc3b8  <+0xf8>
0x177442cbc3b4    f4  c5f928dc             vmovapd xmm3,xmm4
0x177442cbc3b8    f8  41ba0020803f         movl r10,0x3f802000
0x177442cbc3be    fe  c4c1796ee2           vmovd xmm4,r10
0x177442cbc3c3   103  c5da59db             vmulss xmm3,xmm4,xmm3
0x177442cbc3c7   107  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x177442cbc3cb   10b  c5d972f419           vpslld xmm4,xmm4,25
0x177442cbc3d0   110  c5d972d402           vpsrld xmm4,xmm4,2
0x177442cbc3d5   115  c5da5edb             vdivss xmm3,xmm4,xmm3
0x177442cbc3d9   119  c5f828db             vmovaps xmm3,xmm3
0x177442cbc3dd   11d  c4817a119c3b84000000 vmovss [r11+r15*1+0x84],xmm3
0x177442cbc3e7   127  c4e27918f3           vbroadcastss xmm6,xmm3
0x177442cbc3ec   12c  c5f859c6             vmulps xmm0,xmm0,xmm6
0x177442cbc3f0   130  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x177442cbc3f6   136  c5f828f0             vmovaps xmm6,xmm0
0x177442cbc3fa   13a  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x177442cbc3fe   13e  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x177442cbc404   144  c4417b2cf0           vcvttsd2si r14,xmm8
0x177442cbc409   149  4585f6               testl r14,r14
0x177442cbc40c   14c  0f892b000000         jns 0x177442cbc43d  <+0x17d>
0x177442cbc412   152  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x177442cbc41c   15c  c441f96efa           vmovq xmm15,r10
0x177442cbc421   161  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x177442cbc426   166  c4417b2cf7           vcvttsd2si r14,xmm15
0x177442cbc42b   16b  4585f6               testl r14,r14
0x177442cbc42e   16e  0f8809000000         js 0x177442cbc43d  <+0x17d>
0x177442cbc434   174  41ba00000080         movl r10,0x80000000
0x177442cbc43a   17a  450bf2               orl r14,r10
0x177442cbc43d   17d  458bd6               movl r10,r14
0x177442cbc440   180  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x177442cbc445   185  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbc44d   18d  c441792ec8           vucomisd xmm9,xmm8
0x177442cbc452   192  0f8a341c0000         jpe 0x177442cbe08c  <+0x1dcc>
0x177442cbc458   198  0f852e1c0000         jnz 0x177442cbe08c  <+0x1dcc>
0x177442cbc45e   19e  c4c1796ef6           vmovd xmm6,r14
0x177442cbc463   1a3  c5f970f600           vpshufd xmm6,xmm6,0x0
0x177442cbc468   1a8  c5fa16f8             vmovshdup xmm7,xmm0
0x177442cbc46c   1ac  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x177442cbc470   1b0  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x177442cbc476   1b6  c4417b2cf1           vcvttsd2si r14,xmm9
0x177442cbc47b   1bb  4585f6               testl r14,r14
0x177442cbc47e   1be  0f8928000000         jns 0x177442cbc4ac  <+0x1ec>
0x177442cbc484   1c4  4c8b1589ffffff       REX.W movq r10,[rip+0xffffff89]
0x177442cbc48b   1cb  c441f96efa           vmovq xmm15,r10
0x177442cbc490   1d0  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x177442cbc495   1d5  c4417b2cf7           vcvttsd2si r14,xmm15
0x177442cbc49a   1da  4585f6               testl r14,r14
0x177442cbc49d   1dd  0f8809000000         js 0x177442cbc4ac  <+0x1ec>
0x177442cbc4a3   1e3  41ba00000080         movl r10,0x80000000
0x177442cbc4a9   1e9  450bf2               orl r14,r10
0x177442cbc4ac   1ec  458bd6               movl r10,r14
0x177442cbc4af   1ef  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x177442cbc4b4   1f4  c441792ed1           vucomisd xmm10,xmm9
0x177442cbc4b9   1f9  0f8a021c0000         jpe 0x177442cbe0c1  <+0x1e01>
0x177442cbc4bf   1ff  0f85fc1b0000         jnz 0x177442cbe0c1  <+0x1e01>
0x177442cbc4c5   205  c4c34922f601         vpinsrd xmm6,xmm6,r14,0x1
0x177442cbc4cb   20b  49ba0100000001000000 REX.W movq r10,0x100000001
0x177442cbc4d5   215  c4c1f96efa           vmovq xmm7,r10
0x177442cbc4da   21a  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x177442cbc4de   21e  c4e2493ff7           vpmaxud xmm6,xmm6,xmm7
0x177442cbc4e3   223  c44139efc0           vpxor xmm8,xmm8,xmm8
0x177442cbc4e8   228  c538c2c802           vcmpps xmm9,xmm8,xmm0, (le)
0x177442cbc4ed   22d  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x177442cbc4f7   237  c441f96ed2           vmovq xmm10,r10
0x177442cbc4fc   23c  c441296cd2           vpunpcklqdq xmm10,xmm10,xmm10
0x177442cbc501   241  c4c178c2c201         vcmpps xmm0,xmm0,xmm10, (lt)
0x177442cbc507   247  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x177442cbc50b   24b  c579dfff             vpandn xmm15,xmm0,xmm7
0x177442cbc50f   24f  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x177442cbc513   253  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x177442cbc518   258  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x177442cbc51f   25f  c4817813043e         vmovlps [r14+r15*1],xmm0
0x177442cbc525   265  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x177442cbc52d   26d  4589741b38           movl [r11+rbx*1+0x38],r14
0x177442cbc532   272  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x177442cbc53a   27a  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x177442cbc53f   27f  448d7060             leal r14,[rax+0x60]
0x177442cbc543   283  438b543b04           movl rdx,[r11+r15*1+0x4]
0x177442cbc548   288  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x177442cbc54d   28d  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x177442cbc552   292  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x177442cbc557   297  c5f811bd80fdffff     vmovups [rbp-0x280],xmm7
0x177442cbc55f   29f  c5781185c0fbffff     vmovups [rbp-0x440],xmm8
0x177442cbc567   2a7  418bc6               movl rax,r14
0x177442cbc56a   2aa  8bdf                 movl rbx,rdi
0x177442cbc56c   2ac  e88777f2ff           call 0x177442be3cf8  (jump table)
0x177442cbc571   2b1  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbc575   2b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbc57c   2bc  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x177442cbc585   2c5  448b7dd8             movl r15,[rbp-0x28]
0x177442cbc589   2c9  418d97a0000000       leal rdx,[r15+0xa0]
0x177442cbc590   2d0  478b74237c           movl r14,[r11+r12*1+0x7c]
0x177442cbc595   2d5  438b842380000000     movl rax,[r11+r12*1+0x80]
0x177442cbc59d   2dd  418d0486             leal rax,[r14+rax*4]
0x177442cbc5a1   2e1  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x177442cbc5a6   2e6  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x177442cbc5ab   2eb  418d7730             leal rsi,[r15+0x30]
0x177442cbc5af   2ef  48895590             REX.W movq [rbp-0x70],rdx
0x177442cbc5b3   2f3  4c897598             REX.W movq [rbp-0x68],r14
0x177442cbc5b7   2f7  48898578ffffff       REX.W movq [rbp-0x88],rax
0x177442cbc5be   2fe  48895dc0             REX.W movq [rbp-0x40],rbx
0x177442cbc5c2   302  48894db8             REX.W movq [rbp-0x48],rcx
0x177442cbc5c6   306  488975b0             REX.W movq [rbp-0x50],rsi
0x177442cbc5ca   30a  458bc6               movl r8,r14
0x177442cbc5cd   30d  33ff                 xorl rdi,rdi
0x177442cbc5cf   30f  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbc5d7   317  660f1f840000000000   nop
0x177442cbc5e0   320  660f1f840000000000   nop
0x177442cbc5e9   329  660f1f840000000000   nop
0x177442cbc5f2   332  660f1f840000000000   nop
0x177442cbc5fb   33b  0f1f440000           nop
0x177442cbc600   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbc604   344  0f86e01a0000         jna 0x177442cbe0ea  <+0x1e2a>
0x177442cbc60a   34a  443b8578ffffff       cmpl r8,[rbp-0x88]
0x177442cbc611   351  0f8422000000         jz 0x177442cbc639  <+0x379>
0x177442cbc617   357  478b0c03             movl r9,[r11+r8*1]
0x177442cbc61b   35b  4183c004             addl r8,0x4
0x177442cbc61f   35f  413bd9               cmpl rbx,r9
0x177442cbc622   362  76dc                 jna 0x177442cbc600  <+0x340>
0x177442cbc624   364  468d0c89             leal r9,[rcx+r9*4]
0x177442cbc628   368  c4817a101c0b         vmovss xmm3,[r11+r9*1]
0x177442cbc62e   36e  41b901000000         movl r9,0x1
0x177442cbc634   374  e90a000000           jmp 0x177442cbc643  <+0x383>
0x177442cbc639   379  4533c9               xorl r9,r9
0x177442cbc63c   37c  448b8578ffffff       movl r8,[rbp-0x88]
0x177442cbc643   383  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbc64b   38b  4c8945a8             REX.W movq [rbp-0x58],r8
0x177442cbc64f   38f  4183f901             cmpl r9,0x1
0x177442cbc653   393  0f856f000000         jnz 0x177442cbc6c8  <+0x408>
0x177442cbc659   399  478b4c2330           movl r9,[r11+r12*1+0x30]
0x177442cbc65e   39e  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x177442cbc663   3a3  0f8540000000         jnz 0x177442cbc6a9  <+0x3e9>
0x177442cbc669   3a9  b901000000           movl rcx,0x1
0x177442cbc66e   3ae  48897da0             REX.W movq [rbp-0x60],rdi
0x177442cbc672   3b2  8bc6                 movl rax,rsi
0x177442cbc674   3b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbc678   3b8  8bd7                 movl rdx,rdi
0x177442cbc67a   3ba  4c8bc9               REX.W movq r9,rcx
0x177442cbc67d   3bd  e87e76f2ff           call 0x177442be3d00  (jump table)
0x177442cbc682   3c2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbc686   3c6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbc68d   3cd  448b7dd8             movl r15,[rbp-0x28]
0x177442cbc691   3d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbc699   3d9  448b45a8             movl r8,[rbp-0x58]
0x177442cbc69d   3dd  8b7da0               movl rdi,[rbp-0x60]
0x177442cbc6a0   3e0  8b75b0               movl rsi,[rbp-0x50]
0x177442cbc6a3   3e3  8b4db8               movl rcx,[rbp-0x48]
0x177442cbc6a6   3e6  8b5dc0               movl rbx,[rbp-0x40]
0x177442cbc6a9   3e9  448d7701             leal r14,[rdi+0x1]
0x177442cbc6ad   3ed  4789742338           movl [r11+r12*1+0x38],r14
0x177442cbc6b2   3f2  438b442334           movl rax,[r11+r12*1+0x34]
0x177442cbc6b7   3f7  8d04b8               leal rax,[rax+rdi*4]
0x177442cbc6ba   3fa  c4c17a111c03         vmovss [r11+rax*1],xmm3
0x177442cbc6c0   400  418bfe               movl rdi,r14
0x177442cbc6c3   403  e938ffffff           jmp 0x177442cbc600  <+0x340>
0x177442cbc6c8   408  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x177442cbc6d1   411  478b742314           movl r14,[r11+r12*1+0x14]
0x177442cbc6d6   416  438b442310           movl rax,[r11+r12*1+0x10]
0x177442cbc6db   41b  418d5f3c             leal rbx,[r15+0x3c]
0x177442cbc6df   41f  4c8975b0             REX.W movq [rbp-0x50],r14
0x177442cbc6e3   423  488945a8             REX.W movq [rbp-0x58],rax
0x177442cbc6e7   427  48895da0             REX.W movq [rbp-0x60],rbx
0x177442cbc6eb   42b  8b4d98               movl rcx,[rbp-0x68]
0x177442cbc6ee   42e  33d2                 xorl rdx,rdx
0x177442cbc6f0   430  660f1f840000000000   nop
0x177442cbc6f9   439  0f1f8000000000       nop
0x177442cbc700   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbc704   444  0f86211a0000         jna 0x177442cbe12b  <+0x1e6b>
0x177442cbc70a   44a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x177442cbc710   450  0f841f000000         jz 0x177442cbc735  <+0x475>
0x177442cbc716   456  418b340b             movl rsi,[r11+rcx*1]
0x177442cbc71a   45a  83c104               addl rcx,0x4
0x177442cbc71d   45d  443bf6               cmpl r14,rsi
0x177442cbc720   460  76de                 jna 0x177442cbc700  <+0x440>
0x177442cbc722   462  8d34b0               leal rsi,[rax+rsi*4]
0x177442cbc725   465  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x177442cbc72b   46b  be01000000           movl rsi,0x1
0x177442cbc730   470  e908000000           jmp 0x177442cbc73d  <+0x47d>
0x177442cbc735   475  33f6                 xorl rsi,rsi
0x177442cbc737   477  8b8d78ffffff         movl rcx,[rbp-0x88]
0x177442cbc73d   47d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbc745   485  48894db8             REX.W movq [rbp-0x48],rcx
0x177442cbc749   489  83fe01               cmpl rsi,0x1
0x177442cbc74c   48c  0f8568000000         jnz 0x177442cbc7ba  <+0x4fa>
0x177442cbc752   492  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x177442cbc757   497  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x177442cbc75c   49c  0f853b000000         jnz 0x177442cbc79d  <+0x4dd>
0x177442cbc762   4a2  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbc766   4a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbc76a   4aa  8bc3                 movl rax,rbx
0x177442cbc76c   4ac  b901000000           movl rcx,0x1
0x177442cbc771   4b1  e88a75f2ff           call 0x177442be3d00  (jump table)
0x177442cbc776   4b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbc77a   4ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbc781   4c1  448b7dd8             movl r15,[rbp-0x28]
0x177442cbc785   4c5  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbc78d   4cd  8b4db8               movl rcx,[rbp-0x48]
0x177442cbc790   4d0  8b55c0               movl rdx,[rbp-0x40]
0x177442cbc793   4d3  8b5da0               movl rbx,[rbp-0x60]
0x177442cbc796   4d6  8b45a8               movl rax,[rbp-0x58]
0x177442cbc799   4d9  448b75b0             movl r14,[rbp-0x50]
0x177442cbc79d   4dd  8d7201               leal rsi,[rdx+0x1]
0x177442cbc7a0   4e0  4389742344           movl [r11+r12*1+0x44],rsi
0x177442cbc7a5   4e5  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x177442cbc7aa   4ea  8d1497               leal rdx,[rdi+rdx*4]
0x177442cbc7ad   4ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x177442cbc7b3   4f3  8bd6                 movl rdx,rsi
0x177442cbc7b5   4f5  e946ffffff           jmp 0x177442cbc700  <+0x440>
0x177442cbc7ba   4fa  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x177442cbc7c3   503  478b742320           movl r14,[r11+r12*1+0x20]
0x177442cbc7c8   508  438b44231c           movl rax,[r11+r12*1+0x1c]
0x177442cbc7cd   50d  418d5f48             leal rbx,[r15+0x48]
0x177442cbc7d1   511  4c8975a0             REX.W movq [rbp-0x60],r14
0x177442cbc7d5   515  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x177442cbc7dc   51c  48895db8             REX.W movq [rbp-0x48],rbx
0x177442cbc7e0   520  8b4d98               movl rcx,[rbp-0x68]
0x177442cbc7e3   523  33d2                 xorl rdx,rdx
0x177442cbc7e5   525  660f1f840000000000   nop
0x177442cbc7ee   52e  660f1f840000000000   nop
0x177442cbc7f7   537  660f1f840000000000   nop
0x177442cbc800   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbc804   544  0f8662190000         jna 0x177442cbe16c  <+0x1eac>
0x177442cbc80a   54a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x177442cbc810   550  0f841f000000         jz 0x177442cbc835  <+0x575>
0x177442cbc816   556  418b340b             movl rsi,[r11+rcx*1]
0x177442cbc81a   55a  83c104               addl rcx,0x4
0x177442cbc81d   55d  443bf6               cmpl r14,rsi
0x177442cbc820   560  76de                 jna 0x177442cbc800  <+0x540>
0x177442cbc822   562  8d34b0               leal rsi,[rax+rsi*4]
0x177442cbc825   565  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x177442cbc82b   56b  be01000000           movl rsi,0x1
0x177442cbc830   570  e908000000           jmp 0x177442cbc83d  <+0x57d>
0x177442cbc835   575  33f6                 xorl rsi,rsi
0x177442cbc837   577  8b8d78ffffff         movl rcx,[rbp-0x88]
0x177442cbc83d   57d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbc845   585  48894da8             REX.W movq [rbp-0x58],rcx
0x177442cbc849   589  83fe01               cmpl rsi,0x1
0x177442cbc84c   58c  0f856b000000         jnz 0x177442cbc8bd  <+0x5fd>
0x177442cbc852   592  438b742348           movl rsi,[r11+r12*1+0x48]
0x177442cbc857   597  4339542348           cmpl [r11+r12*1+0x48],rdx
0x177442cbc85c   59c  0f853e000000         jnz 0x177442cbc8a0  <+0x5e0>
0x177442cbc862   5a2  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbc866   5a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbc86a   5aa  8bc3                 movl rax,rbx
0x177442cbc86c   5ac  b901000000           movl rcx,0x1
0x177442cbc871   5b1  e88a74f2ff           call 0x177442be3d00  (jump table)
0x177442cbc876   5b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbc87a   5ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbc881   5c1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbc889   5c9  448b7dd8             movl r15,[rbp-0x28]
0x177442cbc88d   5cd  8b4da8               movl rcx,[rbp-0x58]
0x177442cbc890   5d0  8b55c0               movl rdx,[rbp-0x40]
0x177442cbc893   5d3  8b5db8               movl rbx,[rbp-0x48]
0x177442cbc896   5d6  8b8560ffffff         movl rax,[rbp-0xa0]
0x177442cbc89c   5dc  448b75a0             movl r14,[rbp-0x60]
0x177442cbc8a0   5e0  8d7201               leal rsi,[rdx+0x1]
0x177442cbc8a3   5e3  4389742350           movl [r11+r12*1+0x50],rsi
0x177442cbc8a8   5e8  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x177442cbc8ad   5ed  8d1497               leal rdx,[rdi+rdx*4]
0x177442cbc8b0   5f0  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x177442cbc8b6   5f6  8bd6                 movl rdx,rsi
0x177442cbc8b8   5f8  e943ffffff           jmp 0x177442cbc800  <+0x540>
0x177442cbc8bd   5fd  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x177442cbc8c6   606  478b74232c           movl r14,[r11+r12*1+0x2c]
0x177442cbc8cb   60b  438b442328           movl rax,[r11+r12*1+0x28]
0x177442cbc8d0   610  4183c754             addl r15,0x54
0x177442cbc8d4   614  4c8975b0             REX.W movq [rbp-0x50],r14
0x177442cbc8d8   618  488945b8             REX.W movq [rbp-0x48],rax
0x177442cbc8dc   61c  4c897dd8             REX.W movq [rbp-0x28],r15
0x177442cbc8e0   620  33d2                 xorl rdx,rdx
0x177442cbc8e2   622  8b5d98               movl rbx,[rbp-0x68]
0x177442cbc8e5   625  660f1f840000000000   nop
0x177442cbc8ee   62e  660f1f840000000000   nop
0x177442cbc8f7   637  660f1f840000000000   nop
0x177442cbc900   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbc904   644  0f86a6180000         jna 0x177442cbe1b0  <+0x1ef0>
0x177442cbc90a   64a  3b9d78ffffff         cmpl rbx,[rbp-0x88]
0x177442cbc910   650  0f841f000000         jz 0x177442cbc935  <+0x675>
0x177442cbc916   656  418b0c1b             movl rcx,[r11+rbx*1]
0x177442cbc91a   65a  83c304               addl rbx,0x4
0x177442cbc91d   65d  443bf1               cmpl r14,rcx
0x177442cbc920   660  76de                 jna 0x177442cbc900  <+0x640>
0x177442cbc922   662  8d0c88               leal rcx,[rax+rcx*4]
0x177442cbc925   665  c4c17a101c0b         vmovss xmm3,[r11+rcx*1]
0x177442cbc92b   66b  b901000000           movl rcx,0x1
0x177442cbc930   670  e908000000           jmp 0x177442cbc93d  <+0x67d>
0x177442cbc935   675  33c9                 xorl rcx,rcx
0x177442cbc937   677  8b9d78ffffff         movl rbx,[rbp-0x88]
0x177442cbc93d   67d  48895d98             REX.W movq [rbp-0x68],rbx
0x177442cbc941   681  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbc949   689  83f901               cmpl rcx,0x1
0x177442cbc94c   68c  0f8566000000         jnz 0x177442cbc9b8  <+0x6f8>
0x177442cbc952   692  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x177442cbc957   697  4339542354           cmpl [r11+r12*1+0x54],rdx
0x177442cbc95c   69c  0f8539000000         jnz 0x177442cbc99b  <+0x6db>
0x177442cbc962   6a2  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbc966   6a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbc96a   6aa  418bc7               movl rax,r15
0x177442cbc96d   6ad  b901000000           movl rcx,0x1
0x177442cbc972   6b2  e88973f2ff           call 0x177442be3d00  (jump table)
0x177442cbc977   6b7  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbc97b   6bb  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbc982   6c2  8b55c0               movl rdx,[rbp-0x40]
0x177442cbc985   6c5  8b5d98               movl rbx,[rbp-0x68]
0x177442cbc988   6c8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbc990   6d0  448b7dd8             movl r15,[rbp-0x28]
0x177442cbc994   6d4  8b45b8               movl rax,[rbp-0x48]
0x177442cbc997   6d7  448b75b0             movl r14,[rbp-0x50]
0x177442cbc99b   6db  8d4a01               leal rcx,[rdx+0x1]
0x177442cbc99e   6de  43894c235c           movl [r11+r12*1+0x5c],rcx
0x177442cbc9a3   6e3  438b742358           movl rsi,[r11+r12*1+0x58]
0x177442cbc9a8   6e8  8d1496               leal rdx,[rsi+rdx*4]
0x177442cbc9ab   6eb  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x177442cbc9b1   6f1  8bd1                 movl rdx,rcx
0x177442cbc9b3   6f3  e948ffffff           jmp 0x177442cbc900  <+0x640>
0x177442cbc9b8   6f8  478b7c2338           movl r15,[r11+r12*1+0x38]
0x177442cbc9bd   6fd  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x177442cbc9c4   704  c4817a6f1c23         vmovdqu xmm3,[r11+r12*1]
0x177442cbc9ca   70a  c4817a7f5c2330       vmovdqu [r11+r12*1+0x30],xmm3
0x177442cbc9d1   711  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x177442cbc9d7   717  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x177442cbc9de   71e  c4817a6f642310       vmovdqu xmm4,[r11+r12*1+0x10]
0x177442cbc9e5   725  c4817a7f642340       vmovdqu [r11+r12*1+0x40],xmm4
0x177442cbc9ec   72c  478b742310           movl r14,[r11+r12*1+0x10]
0x177442cbc9f1   731  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x177442cbc9f8   738  4b8b442354           REX.W movq rax,[r11+r12*1+0x54]
0x177442cbc9fd   73d  438b5c2350           movl rbx,[r11+r12*1+0x50]
0x177442cbca02   742  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x177442cbca09   749  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x177442cbca10   750  438954232c           movl [r11+r12*1+0x2c],rdx
0x177442cbca15   755  438b542320           movl rdx,[r11+r12*1+0x20]
0x177442cbca1a   75a  43895c2320           movl [r11+r12*1+0x20],rbx
0x177442cbca1f   75f  4b89442324           REX.W movq [r11+r12*1+0x24],rax
0x177442cbca24   764  4c897dd8             REX.W movq [rbp-0x28],r15
0x177442cbca28   768  4c8975b0             REX.W movq [rbp-0x50],r14
0x177442cbca2c   76c  4585ff               testl r15,r15
0x177442cbca2f   76f  0f8516000000         jnz 0x177442cbca4b  <+0x78b>
0x177442cbca35   775  8b5de0               movl rbx,[rbp-0x20]
0x177442cbca38   778  448d9b00020000       leal r11,[rbx+0x200]
0x177442cbca3f   77f  488b45e8             REX.W movq rax,[rbp-0x18]
0x177442cbca43   783  448918               movl [rax],r11
0x177442cbca46   786  488be5               REX.W movq rsp,rbp
0x177442cbca49   789  5d                   pop rbp
0x177442cbca4a   78a  c3                   retl
0x177442cbca4b   78b  c4e37916c002         vpextrd rax,xmm0,0x2
0x177442cbca51   791  c4e37916e303         vpextrd rbx,xmm4,0x3
0x177442cbca57   797  c4e37916d901         vpextrd rcx,xmm3,0x1
0x177442cbca5d   79d  c4e37916c603         vpextrd rsi,xmm0,0x3
0x177442cbca63   7a3  c4e37916e701         vpextrd rdi,xmm4,0x1
0x177442cbca69   7a9  c4c37916d802         vpextrd r8,xmm3,0x2
0x177442cbca6f   7af  458bc8               movl r9,r8
0x177442cbca72   7b2  413bf8               cmpl rdi,r8
0x177442cbca75   7b5  440f42cf             cmovcl r9,rdi
0x177442cbca79   7b9  418bf9               movl rdi,r9
0x177442cbca7c   7bc  413bd1               cmpl rdx,r9
0x177442cbca7f   7bf  0f42fa               cmovcl rdi,rdx
0x177442cbca82   7c2  8bd7                 movl rdx,rdi
0x177442cbca84   7c4  3bf7                 cmpl rsi,rdi
0x177442cbca86   7c6  0f42d6               cmovcl rdx,rsi
0x177442cbca89   7c9  c4817a108423a4000000 vmovss xmm0,[r11+r12*1+0xa4]
0x177442cbca93   7d3  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x177442cbca97   7d7  c4e27918d8           vbroadcastss xmm3,xmm0
0x177442cbca9c   7dc  c5fb1065d0           vmovsd xmm4,[rbp-0x30]
0x177442cbcaa1   7e1  c5da59e4             vmulss xmm4,xmm4,xmm4
0x177442cbcaa5   7e5  c4e27918ec           vbroadcastss xmm5,xmm4
0x177442cbcaaa   7ea  488945c0             REX.W movq [rbp-0x40],rax
0x177442cbcaae   7ee  48895db8             REX.W movq [rbp-0x48],rbx
0x177442cbcab2   7f2  48894da8             REX.W movq [rbp-0x58],rcx
0x177442cbcab6   7f6  488955a0             REX.W movq [rbp-0x60],rdx
0x177442cbcaba   7fa  c5fb118508ffffff     vmovsd [rbp-0xf8],xmm0
0x177442cbcac2   802  c5f8119d70fdffff     vmovups [rbp-0x290],xmm3
0x177442cbcaca   80a  c5fb11a510ffffff     vmovsd [rbp-0xf0],xmm4
0x177442cbcad2   812  c5f811ad90fcffff     vmovups [rbp-0x370],xmm5
0x177442cbcada   81a  33ff                 xorl rdi,rdi
0x177442cbcadc   81c  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x177442cbcae1   821  c4c13972f019         vpslld xmm8,xmm8,25
0x177442cbcae7   827  c4c13972d002         vpsrld xmm8,xmm8,2
0x177442cbcaed   82d  c5c857f6             vxorps xmm6,xmm6,xmm6
0x177442cbcaf1   831  c5f810bd80fdffff     vmovups xmm7,[rbp-0x280]
0x177442cbcaf9   839  488bf7               REX.W movq rsi,rdi
0x177442cbcafc   83c  0f1f4000             nop
0x177442cbcb00   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbcb04   844  0f86e4160000         jna 0x177442cbe1ee  <+0x1f2e>
0x177442cbcb0a   84a  478b442308           movl r8,[r11+r12*1+0x8]
0x177442cbcb0f   84f  4c898500fcffff       REX.W movq [rbp-0x400],r8
0x177442cbcb16   856  443bc6               cmpl r8,rsi
0x177442cbcb19   859  0f8630150000         jna 0x177442cbe04f  <+0x1d8f>
0x177442cbcb1f   85f  478b4c2314           movl r9,[r11+r12*1+0x14]
0x177442cbcb24   864  4c898d20fcffff       REX.W movq [rbp-0x3e0],r9
0x177442cbcb2b   86b  443bce               cmpl r9,rsi
0x177442cbcb2e   86e  0f861b150000         jna 0x177442cbe04f  <+0x1d8f>
0x177442cbcb34   874  478b7c2320           movl r15,[r11+r12*1+0x20]
0x177442cbcb39   879  4c89bd10fcffff       REX.W movq [rbp-0x3f0],r15
0x177442cbcb40   880  443bfe               cmpl r15,rsi
0x177442cbcb43   883  0f8606150000         jna 0x177442cbe04f  <+0x1d8f>
0x177442cbcb49   889  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x177442cbcb4e   88e  4c89bd28fcffff       REX.W movq [rbp-0x3d8],r15
0x177442cbcb55   895  443bfe               cmpl r15,rsi
0x177442cbcb58   898  0f86f1140000         jna 0x177442cbe04f  <+0x1d8f>
0x177442cbcb5e   89e  478b7c2304           movl r15,[r11+r12*1+0x4]
0x177442cbcb63   8a3  458d34b7             leal r14,[r15+rsi*4]
0x177442cbcb67   8a7  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x177442cbcb6d   8ad  478b742310           movl r14,[r11+r12*1+0x10]
0x177442cbcb72   8b2  4c89bdf8fbffff       REX.W movq [rbp-0x408],r15
0x177442cbcb79   8b9  458d3cb6             leal r15,[r14+rsi*4]
0x177442cbcb7d   8bd  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x177442cbcb83   8c3  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x177442cbcb88   8c8  4c89b518fcffff       REX.W movq [rbp-0x3e8],r14
0x177442cbcb8f   8cf  458d34b7             leal r14,[r15+rsi*4]
0x177442cbcb93   8d3  c4017a101c33         vmovss xmm11,[r11+r14*1]
0x177442cbcb99   8d9  478b742328           movl r14,[r11+r12*1+0x28]
0x177442cbcb9e   8de  4c89bd08fcffff       REX.W movq [rbp-0x3f8],r15
0x177442cbcba5   8e5  458d3cb6             leal r15,[r14+rsi*4]
0x177442cbcba9   8e9  4c89b530fcffff       REX.W movq [rbp-0x3d0],r14
0x177442cbcbb0   8f0  c4017a10243b         vmovss xmm12,[r11+r15*1]
0x177442cbcbb6   8f6  448b75e0             movl r14,[rbp-0x20]
0x177442cbcbba   8fa  c4017a1164330c       vmovss [r11+r14*1+0xc],xmm12
0x177442cbcbc1   901  c4017a115c3308       vmovss [r11+r14*1+0x8],xmm11
0x177442cbcbc8   908  c4017a11543304       vmovss [r11+r14*1+0x4],xmm10
0x177442cbcbcf   90f  c4017a110c33         vmovss [r11+r14*1],xmm9
0x177442cbcbd5   915  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x177442cbcbde   91e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x177442cbcbe7   927  c44121efdb           vpxor xmm11,xmm11,xmm11
0x177442cbcbec   92c  c4017a7f5c3310       vmovdqu [r11+r14*1+0x10],xmm11
0x177442cbcbf3   933  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x177442cbcbfb   93b  4c89bdd0fbffff       REX.W movq [rbp-0x430],r15
0x177442cbcc02   942  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x177442cbcc0a   94a  c4017a109c2384000000 vmovss xmm11,[r11+r12*1+0x84]
0x177442cbcc14   954  458d5e40             leal r11,[r14+0x40]
0x177442cbcc18   958  4989e2               REX.W movq r10,rsp
0x177442cbcc1b   95b  4883ec08             REX.W subq rsp,0x8
0x177442cbcc1f   95f  4883e4f0             REX.W andq rsp,0xf0
0x177442cbcc23   963  4c891424             REX.W movq [rsp],r10
0x177442cbcc27   967  488975d0             REX.W movq [rbp-0x30],rsi
0x177442cbcc2b   96b  c57b118df8feffff     vmovsd [rbp-0x108],xmm9
0x177442cbcc33   973  c57b119500ffffff     vmovsd [rbp-0x100],xmm10
0x177442cbcc3b   97b  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x177442cbcc42   982  c57b119d78ffffff     vmovsd [rbp-0x88],xmm11
0x177442cbcc4a   98a  4c895d98             REX.W movq [rbp-0x68],r11
0x177442cbcc4e   98e  488bf7               REX.W movq rsi,rdi
0x177442cbcc51   991  488bcf               REX.W movq rcx,rdi
0x177442cbcc54   994  488b7df0             REX.W movq rdi,[rbp-0x10]
0x177442cbcc58   998  418bd3               movl rdx,r11
0x177442cbcc5b   99b  41b8c0010000         movl r8,0x1c0
0x177442cbcc61   9a1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x177442cbcc6b   9ab  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x177442cbcc72   9b2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x177442cbcc79   9b9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x177442cbcc80   9c0  ffd0                 call rax
0x177442cbcc82   9c2  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x177442cbcc8d   9cd  488b2424             REX.W movq rsp,[rsp]
0x177442cbcc91   9d1  85c0                 testl rax,rax
0x177442cbcc93   9d3  0f84fc170000         jz 0x177442cbe495  <+0x21d5>
0x177442cbcc99   9d9  4533db               xorl r11,r11
0x177442cbcc9c   9dc  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x177442cbcca3   9e3  410f95c3             setnzl r11l
0x177442cbcca7   9e7  448ba568ffffff       movl r12,[rbp-0x98]
0x177442cbccae   9ee  452be3               subl r12,r11
0x177442cbccb1   9f1  c5fb108500ffffff     vmovsd xmm0,[rbp-0x100]
0x177442cbccb9   9f9  c5fa599d78ffffff     vmulss xmm3,xmm0,[rbp-0x88]
0x177442cbccc1   a01  c5f82edb             vucomiss xmm3,xmm3
0x177442cbccc5   a05  7a06                 jpe 0x177442cbcccd  <+0xa0d>
0x177442cbccc7   a07  0f8404000000         jz 0x177442cbccd1  <+0xa11>
0x177442cbcccd   a0d  c5e057db             vxorps xmm3,xmm3,xmm3
0x177442cbccd1   a11  c5d857e4             vxorps xmm4,xmm4,xmm4
0x177442cbccd5   a15  c5f82edc             vucomiss xmm3,xmm4
0x177442cbccd9   a19  0f8704000000         ja 0x177442cbcce3  <+0xa23>
0x177442cbccdf   a1f  c5f928dc             vmovapd xmm3,xmm4
0x177442cbcce3   a23  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x177442cbcce9   a29  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x177442cbcced   a2d  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x177442cbccf3   a33  c57b2cde             vcvttsd2si r11,xmm6
0x177442cbccf7   a37  4585db               testl r11,r11
0x177442cbccfa   a3a  0f8927000000         jns 0x177442cbcd27  <+0xa67>
0x177442cbcd00   a40  4c8b150df7ffff       REX.W movq r10,[rip+0xfffff70d]
0x177442cbcd07   a47  c441f96efa           vmovq xmm15,r10
0x177442cbcd0c   a4c  c50358fe             vaddsd xmm15,xmm15,xmm6
0x177442cbcd10   a50  c4417b2cdf           vcvttsd2si r11,xmm15
0x177442cbcd15   a55  4585db               testl r11,r11
0x177442cbcd18   a58  0f8809000000         js 0x177442cbcd27  <+0xa67>
0x177442cbcd1e   a5e  41ba00000080         movl r10,0x80000000
0x177442cbcd24   a64  450bda               orl r11,r10
0x177442cbcd27   a67  458bd3               movl r10,r11
0x177442cbcd2a   a6a  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x177442cbcd2f   a6f  c5f92efe             vucomisd xmm7,xmm6
0x177442cbcd33   a73  0f8a1c150000         jpe 0x177442cbe255  <+0x1f95>
0x177442cbcd39   a79  0f8516150000         jnz 0x177442cbe255  <+0x1f95>
0x177442cbcd3f   a7f  458bfb               movl r15,r11
0x177442cbcd42   a82  453be3               cmpl r12,r11
0x177442cbcd45   a85  450f42fc             cmovcl r15,r12
0x177442cbcd49   a89  41ba0000804f         movl r10,0x4f800000
0x177442cbcd4f   a8f  c4c1796eea           vmovd xmm5,r10
0x177442cbcd54   a94  4533db               xorl r11,r11
0x177442cbcd57   a97  c5f82eeb             vucomiss xmm5,xmm3
0x177442cbcd5b   a9b  450f47df             cmoval r11,r15
0x177442cbcd5f   a9f  4533ff               xorl r15,r15
0x177442cbcd62   aa2  4585db               testl r11,r11
0x177442cbcd65   aa5  410f95c7             setnzl r15l
0x177442cbcd69   aa9  458bf3               movl r14,r11
0x177442cbcd6c   aac  452bf7               subl r14,r15
0x177442cbcd6f   aaf  4183c301             addl r11,0x1
0x177442cbcd73   ab3  458bfb               movl r15,r11
0x177442cbcd76   ab6  453be3               cmpl r12,r11
0x177442cbcd79   ab9  450f42fc             cmovcl r15,r12
0x177442cbcd7d   abd  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x177442cbcd84   ac4  453bfe               cmpl r15,r14
0x177442cbcd87   ac7  0f8269110000         jc 0x177442cbdef6  <+0x1c36>
0x177442cbcd8d   acd  4533db               xorl r11,r11
0x177442cbcd90   ad0  83bdd0fbffff00       cmpl [rbp-0x430],0x0
0x177442cbcd97   ad7  410f95c3             setnzl r11l
0x177442cbcd9b   adb  448ba5d0fbffff       movl r12,[rbp-0x430]
0x177442cbcda2   ae2  452be3               subl r12,r11
0x177442cbcda5   ae5  c5fb109d78ffffff     vmovsd xmm3,[rbp-0x88]
0x177442cbcdad   aed  c5e2599df8feffff     vmulss xmm3,xmm3,[rbp-0x108]
0x177442cbcdb5   af5  c5f82edb             vucomiss xmm3,xmm3
0x177442cbcdb9   af9  7a06                 jpe 0x177442cbcdc1  <+0xb01>
0x177442cbcdbb   afb  0f8404000000         jz 0x177442cbcdc5  <+0xb05>
0x177442cbcdc1   b01  c5f928dc             vmovapd xmm3,xmm4
0x177442cbcdc5   b05  c5f82edc             vucomiss xmm3,xmm4
0x177442cbcdc9   b09  0f8704000000         ja 0x177442cbcdd3  <+0xb13>
0x177442cbcdcf   b0f  c5f928dc             vmovapd xmm3,xmm4
0x177442cbcdd3   b13  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x177442cbcdd9   b19  c5e25af3             vcvtss2sd xmm6,xmm3,xmm3
0x177442cbcddd   b1d  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x177442cbcde3   b23  c57b2cdf             vcvttsd2si r11,xmm7
0x177442cbcde7   b27  4585db               testl r11,r11
0x177442cbcdea   b2a  0f8927000000         jns 0x177442cbce17  <+0xb57>
0x177442cbcdf0   b30  4c8b151df6ffff       REX.W movq r10,[rip+0xfffff61d]
0x177442cbcdf7   b37  c441f96efa           vmovq xmm15,r10
0x177442cbcdfc   b3c  c50358ff             vaddsd xmm15,xmm15,xmm7
0x177442cbce00   b40  c4417b2cdf           vcvttsd2si r11,xmm15
0x177442cbce05   b45  4585db               testl r11,r11
0x177442cbce08   b48  0f8809000000         js 0x177442cbce17  <+0xb57>
0x177442cbce0e   b4e  41ba00000080         movl r10,0x80000000
0x177442cbce14   b54  450bda               orl r11,r10
0x177442cbce17   b57  458bd3               movl r10,r11
0x177442cbce1a   b5a  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x177442cbce1f   b5f  c5792ec7             vucomisd xmm8,xmm7
0x177442cbce23   b63  0f8a4f140000         jpe 0x177442cbe278  <+0x1fb8>
0x177442cbce29   b69  0f8549140000         jnz 0x177442cbe278  <+0x1fb8>
0x177442cbce2f   b6f  418bc3               movl rax,r11
0x177442cbce32   b72  453be3               cmpl r12,r11
0x177442cbce35   b75  410f42c4             cmovcl rax,r12
0x177442cbce39   b79  4533db               xorl r11,r11
0x177442cbce3c   b7c  c5f82eeb             vucomiss xmm5,xmm3
0x177442cbce40   b80  440f47d8             cmoval r11,rax
0x177442cbce44   b84  33c0                 xorl rax,rax
0x177442cbce46   b86  4585db               testl r11,r11
0x177442cbce49   b89  0f95c0               setnzl al
0x177442cbce4c   b8c  418bdb               movl rbx,r11
0x177442cbce4f   b8f  2bd8                 subl rbx,rax
0x177442cbce51   b91  4183c301             addl r11,0x1
0x177442cbce55   b95  418bc3               movl rax,r11
0x177442cbce58   b98  453be3               cmpl r12,r11
0x177442cbce5b   b9b  410f42c4             cmovcl rax,r12
0x177442cbce5f   b9f  448d5801             leal r11,[rax+0x1]
0x177442cbce63   ba3  c5fb109df8feffff     vmovsd xmm3,[rbp-0x108]
0x177442cbce6b   bab  c4e27918eb           vbroadcastss xmm5,xmm3
0x177442cbce70   bb0  c4e27918f0           vbroadcastss xmm6,xmm0
0x177442cbce75   bb5  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x177442cbce7c   bbc  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x177442cbce80   bc0  418b540464           movl rdx,[r12+rax*1+0x64]
0x177442cbce85   bc5  418b4c0468           movl rcx,[r12+rax*1+0x68]
0x177442cbce8a   bca  8b75e0               movl rsi,[rbp-0x20]
0x177442cbce8d   bcd  c4c17a6fbc3470010000 vmovdqu xmm7,[r12+rsi*1+0x170]
0x177442cbce97   bd7  c4417a6f843430010000 vmovdqu xmm8,[r12+rsi*1+0x130]
0x177442cbcea1   be1  c4417a6f8c34f0000000 vmovdqu xmm9,[r12+rsi*1+0xf0]
0x177442cbceab   beb  c4417a6f9434b0000000 vmovdqu xmm10,[r12+rsi*1+0xb0]
0x177442cbceb5   bf5  c4417a6f5c3470       vmovdqu xmm11,[r12+rsi*1+0x70]
0x177442cbcebc   bfc  c4417a6fa434f0010000 vmovdqu xmm12,[r12+rsi*1+0x1f0]
0x177442cbcec6   c06  c4417a6fac34b0010000 vmovdqu xmm13,[r12+rsi*1+0x1b0]
0x177442cbced0   c10  c4417a6fb43460010000 vmovdqu xmm14,[r12+rsi*1+0x160]
0x177442cbceda   c1a  c4c17a6f8c3420010000 vmovdqu xmm1,[r12+rsi*1+0x120]
0x177442cbcee4   c24  c4c17a6f9434e0000000 vmovdqu xmm2,[r12+rsi*1+0xe0]
0x177442cbceee   c2e  c4c17a6f8434a0000000 vmovdqu xmm0,[r12+rsi*1+0xa0]
0x177442cbcef8   c38  c4c17a6f5c3460       vmovdqu xmm3,[r12+rsi*1+0x60]
0x177442cbceff   c3f  c5f811b580fcffff     vmovups [rbp-0x380],xmm6
0x177442cbcf07   c47  c4c17a6fb434e0010000 vmovdqu xmm6,[r12+rsi*1+0x1e0]
0x177442cbcf11   c51  c5f811ad70fcffff     vmovups [rbp-0x390],xmm5
0x177442cbcf19   c59  c4c17a6fac34a0010000 vmovdqu xmm5,[r12+rsi*1+0x1a0]
0x177442cbcf23   c63  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x177442cbcf2b   c6b  c4c17a6f843450010000 vmovdqu xmm0,[r12+rsi*1+0x150]
0x177442cbcf35   c75  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x177442cbcf3d   c7d  c4c17a6f843410010000 vmovdqu xmm0,[r12+rsi*1+0x110]
0x177442cbcf47   c87  c5f81185b0feffff     vmovups [rbp-0x150],xmm0
0x177442cbcf4f   c8f  c4c17a6f8434d0000000 vmovdqu xmm0,[r12+rsi*1+0xd0]
0x177442cbcf59   c99  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x177442cbcf61   ca1  c4c17a6f843490000000 vmovdqu xmm0,[r12+rsi*1+0x90]
0x177442cbcf6b   cab  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x177442cbcf73   cb3  c4c17a6f443450       vmovdqu xmm0,[r12+rsi*1+0x50]
0x177442cbcf7a   cba  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x177442cbcf82   cc2  c4c17a6f8434d0010000 vmovdqu xmm0,[r12+rsi*1+0x1d0]
0x177442cbcf8c   ccc  c5f8118540fbffff     vmovups [rbp-0x4c0],xmm0
0x177442cbcf94   cd4  c4c17a6f843490010000 vmovdqu xmm0,[r12+rsi*1+0x190]
0x177442cbcf9e   cde  c5f8118550fbffff     vmovups [rbp-0x4b0],xmm0
0x177442cbcfa6   ce6  c4c17a6f843440010000 vmovdqu xmm0,[r12+rsi*1+0x140]
0x177442cbcfb0   cf0  c5f8118560fbffff     vmovups [rbp-0x4a0],xmm0
0x177442cbcfb8   cf8  c4c17a6f843400010000 vmovdqu xmm0,[r12+rsi*1+0x100]
0x177442cbcfc2   d02  c5f8118570fbffff     vmovups [rbp-0x490],xmm0
0x177442cbcfca   d0a  c4c17a6f8434c0000000 vmovdqu xmm0,[r12+rsi*1+0xc0]
0x177442cbcfd4   d14  c5f8118580fbffff     vmovups [rbp-0x480],xmm0
0x177442cbcfdc   d1c  c4c17a6f843480000000 vmovdqu xmm0,[r12+rsi*1+0x80]
0x177442cbcfe6   d26  c5f8118590fbffff     vmovups [rbp-0x470],xmm0
0x177442cbcfee   d2e  c4c17a6f443440       vmovdqu xmm0,[r12+rsi*1+0x40]
0x177442cbcff5   d35  c5f81185a0fbffff     vmovups [rbp-0x460],xmm0
0x177442cbcffd   d3d  c4c17a6f8434c0010000 vmovdqu xmm0,[r12+rsi*1+0x1c0]
0x177442cbd007   d47  c5f81185b0fbffff     vmovups [rbp-0x450],xmm0
0x177442cbd00f   d4f  c4c17a6f843480010000 vmovdqu xmm0,[r12+rsi*1+0x180]
0x177442cbd019   d59  48899dd8fbffff       REX.W movq [rbp-0x428],rbx
0x177442cbd020   d60  4c899de0fbffff       REX.W movq [rbp-0x420],r11
0x177442cbd027   d67  488995f0fbffff       REX.W movq [rbp-0x410],rdx
0x177442cbd02e   d6e  48898de8fbffff       REX.W movq [rbp-0x418],rcx
0x177442cbd035   d75  c57810bdc0fbffff     vmovups xmm15,[rbp-0x440]
0x177442cbd03d   d7d  c57811bd50ffffff     vmovups [rbp-0xb0],xmm15
0x177442cbd045   d85  c5fb11a568ffffff     vmovsd [rbp-0x98],xmm4
0x177442cbd04d   d8d  c5fb11a560ffffff     vmovsd [rbp-0xa0],xmm4
0x177442cbd055   d95  c5fb11a540ffffff     vmovsd [rbp-0xc0],xmm4
0x177442cbd05d   d9d  c5fb11a538ffffff     vmovsd [rbp-0xc8],xmm4
0x177442cbd065   da5  c578118de0fdffff     vmovups [rbp-0x220],xmm9
0x177442cbd06d   dad  c57928c8             vmovapd xmm9,xmm0
0x177442cbd071   db1  c5fb11a530ffffff     vmovsd [rbp-0xd0],xmm4
0x177442cbd079   db9  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbd081   dc1  c578119d00feffff     vmovups [rbp-0x200],xmm11
0x177442cbd089   dc9  c578109da0fbffff     vmovups xmm11,[rbp-0x460]
0x177442cbd091   dd1  c57811a510feffff     vmovups [rbp-0x1f0],xmm12
0x177442cbd099   dd9  c57810a590fbffff     vmovups xmm12,[rbp-0x470]
0x177442cbd0a1   de1  c57811ad20feffff     vmovups [rbp-0x1e0],xmm13
0x177442cbd0a9   de9  c57810ad80fbffff     vmovups xmm13,[rbp-0x480]
0x177442cbd0b1   df1  c57811b530feffff     vmovups [rbp-0x1d0],xmm14
0x177442cbd0b9   df9  c57810b570fbffff     vmovups xmm14,[rbp-0x490]
0x177442cbd0c1   e01  c5f8118d40feffff     vmovups [rbp-0x1c0],xmm1
0x177442cbd0c9   e09  c5f8108d60fbffff     vmovups xmm1,[rbp-0x4a0]
0x177442cbd0d1   e11  c5f811ad80feffff     vmovups [rbp-0x180],xmm5
0x177442cbd0d9   e19  c5f811b570feffff     vmovups [rbp-0x190],xmm6
0x177442cbd0e1   e21  c5f8119d60feffff     vmovups [rbp-0x1a0],xmm3
0x177442cbd0e9   e29  c5f811bdc0fdffff     vmovups [rbp-0x240],xmm7
0x177442cbd0f1   e31  c5781195f0fdffff     vmovups [rbp-0x210],xmm10
0x177442cbd0f9   e39  c5781185d0fdffff     vmovups [rbp-0x230],xmm8
0x177442cbd101   e41  e9ab000000           jmp 0x177442cbd1b1  <+0xef1>
0x177442cbd106   e46  660f1f840000000000   nop
0x177442cbd10f   e4f  660f1f840000000000   nop
0x177442cbd118   e58  660f1f840000000000   nop
0x177442cbd121   e61  660f1f840000000000   nop
0x177442cbd12a   e6a  660f1f840000000000   nop
0x177442cbd133   e73  660f1f840000000000   nop
0x177442cbd13c   e7c  0f1f4000             nop
0x177442cbd140   e80  4c8be3               REX.W movq r12,rbx
0x177442cbd143   e83  8b9dd8fbffff         movl rbx,[rbp-0x428]
0x177442cbd149   e89  458bf3               movl r14,r11
0x177442cbd14c   e8c  448b9de0fbffff       movl r11,[rbp-0x420]
0x177442cbd153   e93  8b8de8fbffff         movl rcx,[rbp-0x418]
0x177442cbd159   e99  8b95f0fbffff         movl rdx,[rbp-0x410]
0x177442cbd15f   e9f  c578118d40feffff     vmovups [rbp-0x1c0],xmm9
0x177442cbd167   ea7  c578108d90feffff     vmovups xmm9,[rbp-0x170]
0x177442cbd16f   eaf  c578119d70feffff     vmovups [rbp-0x190],xmm11
0x177442cbd177   eb7  c4417928d8           vmovapd xmm11,xmm8
0x177442cbd17c   ebc  c57811a510feffff     vmovups [rbp-0x1f0],xmm12
0x177442cbd184   ec4  c4417928e2           vmovapd xmm12,xmm10
0x177442cbd189   ec9  c5f811bd60feffff     vmovups [rbp-0x1a0],xmm7
0x177442cbd191   ed1  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x177442cbd199   ed9  c5f811ad40fcffff     vmovups [rbp-0x3c0],xmm5
0x177442cbd1a1   ee1  c5f8119d50fcffff     vmovups [rbp-0x3b0],xmm3
0x177442cbd1a9   ee9  c5f811b5b0feffff     vmovups [rbp-0x150],xmm6
0x177442cbd1b1   ef1  c5781095b0fbffff     vmovups xmm10,[rbp-0x450]
0x177442cbd1b9   ef9  c5f8119550feffff     vmovups [rbp-0x1b0],xmm2
0x177442cbd1c1   f01  c5f8109550fbffff     vmovups xmm2,[rbp-0x4b0]
0x177442cbd1c9   f09  33ff                 xorl rdi,rdi
0x177442cbd1cb   f0b  8bb510fcffff         movl rsi,[rbp-0x3f0]
0x177442cbd1d1   f11  8b8508fcffff         movl rax,[rbp-0x3f8]
0x177442cbd1d7   f17  448b8d00fcffff       movl r9,[rbp-0x400]
0x177442cbd1de   f1e  448b85f8fbffff       movl r8,[rbp-0x408]
0x177442cbd1e5   f25  4c89b578ffffff       REX.W movq [rbp-0x88],r14
0x177442cbd1ec   f2c  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbd1f0   f30  0f86a5100000         jna 0x177442cbe29b  <+0x1fdb>
0x177442cbd1f6   f36  448bbdd0fbffff       movl r15,[rbp-0x430]
0x177442cbd1fd   f3d  450faffe             imull r15,r14
0x177442cbd201   f41  468d343b             leal r14,[rbx+r15*1]
0x177442cbd205   f45  413bce               cmpl rcx,r14
0x177442cbd208   f48  0f862a000000         jna 0x177442cbd238  <+0xf78>
0x177442cbd20e   f4e  4503fb               addl r15,r11
0x177442cbd211   f51  413bcf               cmpl rcx,r15
0x177442cbd214   f54  0f861e000000         jna 0x177442cbd238  <+0xf78>
0x177442cbd21a   f5a  468d3cba             leal r15,[rdx+r15*4]
0x177442cbd21e   f5e  478b3c3c             movl r15,[r12+r15*1]
0x177442cbd222   f62  468d34b2             leal r14,[rdx+r14*4]
0x177442cbd226   f66  478b3434             movl r14,[r12+r14*1]
0x177442cbd22a   f6a  458bd6               movl r10,r14
0x177442cbd22d   f6d  458bf7               movl r14,r15
0x177442cbd230   f70  458bfa               movl r15,r10
0x177442cbd233   f73  e906000000           jmp 0x177442cbd23e  <+0xf7e>
0x177442cbd238   f78  4c8bf7               REX.W movq r14,rdi
0x177442cbd23b   f7b  4c8bff               REX.W movq r15,rdi
0x177442cbd23e   f7e  478d1cb8             leal r11,[r8+r15*4]
0x177442cbd242   f82  418bde               movl rbx,r14
0x177442cbd245   f85  412bdf               subl rbx,r15
0x177442cbd248   f88  33d2                 xorl rdx,rdx
0x177442cbd24a   f8a  453bce               cmpl r9,r14
0x177442cbd24d   f8d  0f92c2               setcl dl
0x177442cbd250   f90  33c9                 xorl rcx,rcx
0x177442cbd252   f92  453bf7               cmpl r14,r15
0x177442cbd255   f95  0f92c1               setcl cl
0x177442cbd258   f98  4c8bc2               REX.W movq r8,rdx
0x177442cbd25b   f9b  440bc1               orl r8,rcx
0x177442cbd25e   f9e  448bcb               movl r9,rbx
0x177442cbd261   fa1  4585c0               testl r8,r8
0x177442cbd264   fa4  440f45cf             cmovnzl r9,rdi
0x177442cbd268   fa8  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x177442cbd26f   faf  488995b0fdffff       REX.W movq [rbp-0x250],rdx
0x177442cbd276   fb6  48898db8fdffff       REX.W movq [rbp-0x248],rcx
0x177442cbd27d   fbd  4c898de0feffff       REX.W movq [rbp-0x120],r9
0x177442cbd284   fc4  453bf7               cmpl r14,r15
0x177442cbd287   fc7  0f82a6000000         jc 0x177442cbd333  <+0x1073>
0x177442cbd28d   fcd  468d04b8             leal r8,[rax+r15*4]
0x177442cbd291   fd1  b804000000           movl rax,0x4
0x177442cbd296   fd6  413bf6               cmpl rsi,r14
0x177442cbd299   fd9  440f42c0             cmovcl r8,rax
0x177442cbd29d   fdd  448bcb               movl r9,rbx
0x177442cbd2a0   fe0  413bf6               cmpl rsi,r14
0x177442cbd2a3   fe3  440f42cf             cmovcl r9,rdi
0x177442cbd2a7   fe7  418bf1               movl rsi,r9
0x177442cbd2aa   fea  81e6f0ffff1f         andl rsi,0x1ffffff0
0x177442cbd2b0   ff0  418d34b0             leal rsi,[r8+rsi*4]
0x177442cbd2b4   ff4  448ba518fcffff       movl r12,[rbp-0x3e8]
0x177442cbd2bb   ffb  478d1cbc             leal r11,[r12+r15*4]
0x177442cbd2bf   fff  448ba520fcffff       movl r12,[rbp-0x3e0]
0x177442cbd2c6  1006  453be6               cmpl r12,r14
0x177442cbd2c9  1009  440f42d8             cmovcl r11,rax
0x177442cbd2cd  100d  8bd3                 movl rdx,rbx
0x177442cbd2cf  100f  453be6               cmpl r12,r14
0x177442cbd2d2  1012  0f42d7               cmovcl rdx,rdi
0x177442cbd2d5  1015  448be2               movl r12,rdx
0x177442cbd2d8  1018  4181e4f0ffff1f       andl r12,0x1ffffff0
0x177442cbd2df  101f  478d24a3             leal r12,[r11+r12*4]
0x177442cbd2e3  1023  418bc9               movl rcx,r9
0x177442cbd2e6  1026  c1e904               shrl rcx, 4
0x177442cbd2e9  1029  4183e10f             andl r9,0xf
0x177442cbd2ed  102d  4c899da0fcffff       REX.W movq [rbp-0x360],r11
0x177442cbd2f4  1034  448bda               movl r11,rdx
0x177442cbd2f7  1037  41c1eb04             shrl r11, 4
0x177442cbd2fb  103b  83e20f               andl rdx,0xf
0x177442cbd2fe  103e  4c899d38fcffff       REX.W movq [rbp-0x3c8],r11
0x177442cbd305  1045  448b9d28fcffff       movl r11,[rbp-0x3d8]
0x177442cbd30c  104c  453bde               cmpl r11,r14
0x177442cbd30f  104f  0f8213000000         jc 0x177442cbd328  <+0x1068>
0x177442cbd315  1055  448bb530fcffff       movl r14,[rbp-0x3d0]
0x177442cbd31c  105c  478d3cbe             leal r15,[r14+r15*4]
0x177442cbd320  1060  448bf3               movl r14,rbx
0x177442cbd323  1063  e936000000           jmp 0x177442cbd35e  <+0x109e>
0x177442cbd328  1068  4c8bf7               REX.W movq r14,rdi
0x177442cbd32b  106b  4c8bf8               REX.W movq r15,rax
0x177442cbd32e  106e  e92b000000           jmp 0x177442cbd35e  <+0x109e>
0x177442cbd333  1073  4c8bf7               REX.W movq r14,rdi
0x177442cbd336  1076  4c8bcf               REX.W movq r9,rdi
0x177442cbd339  1079  b804000000           movl rax,0x4
0x177442cbd33e  107e  488bd7               REX.W movq rdx,rdi
0x177442cbd341  1081  4889bd38fcffff       REX.W movq [rbp-0x3c8],rdi
0x177442cbd348  1088  488bcf               REX.W movq rcx,rdi
0x177442cbd34b  108b  488bf0               REX.W movq rsi,rax
0x177442cbd34e  108e  4c8bc0               REX.W movq r8,rax
0x177442cbd351  1091  4c8be0               REX.W movq r12,rax
0x177442cbd354  1094  4c8bf8               REX.W movq r15,rax
0x177442cbd357  1097  488985a0fcffff       REX.W movq [rbp-0x360],rax
0x177442cbd35e  109e  488b9db8fdffff       REX.W movq rbx,[rbp-0x248]
0x177442cbd365  10a5  0b9db0fdffff         orl rbx,[rbp-0x250]
0x177442cbd36b  10ab  448b9d18ffffff       movl r11,[rbp-0xe8]
0x177442cbd372  10b2  85db                 testl rbx,rbx
0x177442cbd374  10b4  440f45d8             cmovnzl r11,rax
0x177442cbd378  10b8  418bc6               movl rax,r14
0x177442cbd37b  10bb  c1e804               shrl rax, 4
0x177442cbd37e  10be  8b9de0feffff         movl rbx,[rbp-0x120]
0x177442cbd384  10c4  c1eb04               shrl rbx, 4
0x177442cbd387  10c7  4889b5f0feffff       REX.W movq [rbp-0x110],rsi
0x177442cbd38e  10ce  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x177442cbd395  10d5  8bb538fcffff         movl rsi,[rbp-0x3c8]
0x177442cbd39b  10db  448be3               movl r12,rbx
0x177442cbd39e  10de  3bf3                 cmpl rsi,rbx
0x177442cbd3a0  10e0  440f42e6             cmovcl r12,rsi
0x177442cbd3a4  10e4  4489e3               movl rbx,r12
0x177442cbd3a7  10e7  4439e1               cmpl rcx,r12
0x177442cbd3aa  10ea  0f42d9               cmovcl rbx,rcx
0x177442cbd3ad  10ed  448be3               movl r12,rbx
0x177442cbd3b0  10f0  3bc3                 cmpl rax,rbx
0x177442cbd3b2  10f2  440f42e0             cmovcl r12,rax
0x177442cbd3b6  10f6  4c89b520ffffff       REX.W movq [rbp-0xe0],r14
0x177442cbd3bd  10fd  4585e4               testl r12,r12
0x177442cbd3c0  1100  0f8573000000         jnz 0x177442cbd439  <+0x1179>
0x177442cbd3c6  1106  c578118d90feffff     vmovups [rbp-0x170],xmm9
0x177442cbd3ce  110e  c5781195b0fbffff     vmovups [rbp-0x450],xmm10
0x177442cbd3d6  1116  c4417928c3           vmovapd xmm8,xmm11
0x177442cbd3db  111b  c4417928d4           vmovapd xmm10,xmm12
0x177442cbd3e0  1120  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x177442cbd3e4  1124  c57810a510feffff     vmovups xmm12,[rbp-0x1f0]
0x177442cbd3ec  112c  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x177442cbd3f4  1134  c5f8119550fbffff     vmovups [rbp-0x4b0],xmm2
0x177442cbd3fc  113c  c5f8109550feffff     vmovups xmm2,[rbp-0x1b0]
0x177442cbd404  1144  c5f810ad40fcffff     vmovups xmm5,[rbp-0x3c0]
0x177442cbd40c  114c  c5f8109d50fcffff     vmovups xmm3,[rbp-0x3b0]
0x177442cbd414  1154  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x177442cbd41c  115c  c5f810b5b0feffff     vmovups xmm6,[rbp-0x150]
0x177442cbd424  1164  c578109d70feffff     vmovups xmm11,[rbp-0x190]
0x177442cbd42c  116c  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x177442cbd434  1174  e946060000           jmp 0x177442cbda7f  <+0x17bf>
0x177442cbd439  1179  c578118d90feffff     vmovups [rbp-0x170],xmm9
0x177442cbd441  1181  c5781195b0fbffff     vmovups [rbp-0x450],xmm10
0x177442cbd449  1189  c578119da0fbffff     vmovups [rbp-0x460],xmm11
0x177442cbd451  1191  c57811a590fbffff     vmovups [rbp-0x470],xmm12
0x177442cbd459  1199  c57811ad80fbffff     vmovups [rbp-0x480],xmm13
0x177442cbd461  11a1  c57811b570fbffff     vmovups [rbp-0x490],xmm14
0x177442cbd469  11a9  c5f8118d60fbffff     vmovups [rbp-0x4a0],xmm1
0x177442cbd471  11b1  c5f8119550fbffff     vmovups [rbp-0x4b0],xmm2
0x177442cbd479  11b9  8b8da0fcffff         movl rcx,[rbp-0x360]
0x177442cbd47f  11bf  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x177442cbd483  11c3  488bc7               REX.W movq rax,rdi
0x177442cbd486  11c6  e9a5000000           jmp 0x177442cbd530  <+0x1270>
0x177442cbd48b  11cb  660f1f840000000000   nop
0x177442cbd494  11d4  660f1f840000000000   nop
0x177442cbd49d  11dd  660f1f840000000000   nop
0x177442cbd4a6  11e6  660f1f840000000000   nop
0x177442cbd4af  11ef  660f1f840000000000   nop
0x177442cbd4b8  11f8  0f1f840000000000     nop
0x177442cbd4c0  1200  c5f811a550fbffff     vmovups [rbp-0x4b0],xmm4
0x177442cbd4c8  1208  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbd4d0  1210  c5f8118db0fbffff     vmovups [rbp-0x450],xmm1
0x177442cbd4d8  1218  c57811a510feffff     vmovups [rbp-0x1f0],xmm12
0x177442cbd4e0  1220  c578118d40feffff     vmovups [rbp-0x1c0],xmm9
0x177442cbd4e8  1228  c5f8119550feffff     vmovups [rbp-0x1b0],xmm2
0x177442cbd4f0  1230  c57811ad70fbffff     vmovups [rbp-0x490],xmm13
0x177442cbd4f8  1238  c5f811bd60feffff     vmovups [rbp-0x1a0],xmm7
0x177442cbd500  1240  c578118540fbffff     vmovups [rbp-0x4c0],xmm8
0x177442cbd508  1248  c5f811ad40fcffff     vmovups [rbp-0x3c0],xmm5
0x177442cbd510  1250  c5f8119d50fcffff     vmovups [rbp-0x3b0],xmm3
0x177442cbd518  1258  c578119d70feffff     vmovups [rbp-0x190],xmm11
0x177442cbd520  1260  c5f811b5b0feffff     vmovups [rbp-0x150],xmm6
0x177442cbd528  1268  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x177442cbd530  1270  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbd534  1274  0f86330e0000         jna 0x177442cbe36d  <+0x20ad>
0x177442cbd53a  127a  428d3418             leal rsi,[rax+r11*1]
0x177442cbd53e  127e  c5fa6f1433           vmovdqu xmm2,[rbx+rsi*1]
0x177442cbd543  1283  c5585cca             vsubps xmm9,xmm4,xmm2
0x177442cbd547  1287  c4413059d1           vmulps xmm10,xmm9,xmm9
0x177442cbd54c  128c  8d3c08               leal rdi,[rax+rcx*1]
0x177442cbd54f  128f  c57a6f1c3b           vmovdqu xmm11,[rbx+rdi*1]
0x177442cbd554  1294  c57810ad80fcffff     vmovups xmm13,[rbp-0x380]
0x177442cbd55c  129c  c441105ce3           vsubps xmm12,xmm13,xmm11
0x177442cbd561  12a1  c4411859f4           vmulps xmm14,xmm12,xmm12
0x177442cbd566  12a6  c4412858d6           vaddps xmm10,xmm10,xmm14
0x177442cbd56b  12ab  c578118d00fdffff     vmovups [rbp-0x300],xmm9
0x177442cbd573  12b3  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x177442cbd57b  12bb  c44108c2ca02         vcmpps xmm9,xmm14,xmm10, (le)
0x177442cbd581  12c1  c57811a5f0fcffff     vmovups [rbp-0x310],xmm12
0x177442cbd589  12c9  c5f8108d90fcffff     vmovups xmm1,[rbp-0x370]
0x177442cbd591  12d1  c528c2e101           vcmpps xmm12,xmm10,xmm1, (lt)
0x177442cbd596  12d6  c44131dbcc           vpand xmm9,xmm9,xmm12
0x177442cbd59b  12db  c44119efe4           vpxor xmm12,xmm12,xmm12
0x177442cbd5a0  12e0  c4c118c2c201         vcmpps xmm0,xmm12,xmm10, (lt)
0x177442cbd5a6  12e6  c5781195e0fcffff     vmovups [rbp-0x320],xmm10
0x177442cbd5ae  12ee  c578109580fdffff     vmovups xmm10,[rbp-0x280]
0x177442cbd5b6  12f6  c4c179dbc2           vpand xmm0,xmm0,xmm10
0x177442cbd5bb  12fb  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x177442cbd5bf  12ff  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x177442cbd5c3  1303  c578108d60fbffff     vmovups xmm9,[rbp-0x4a0]
0x177442cbd5cb  130b  c4417858c9           vaddps xmm9,xmm0,xmm9
0x177442cbd5d0  1310  448d7630             leal r14,[rsi+0x30]
0x177442cbd5d4  1314  c578118d60fbffff     vmovups [rbp-0x4a0],xmm9
0x177442cbd5dc  131c  c4217a6f0c33         vmovdqu xmm9,[rbx+r14*1]
0x177442cbd5e2  1322  c4c1585cd9           vsubps xmm3,xmm4,xmm9
0x177442cbd5e7  1327  c5e059eb             vmulps xmm5,xmm3,xmm3
0x177442cbd5eb  132b  448d7730             leal r14,[rdi+0x30]
0x177442cbd5ef  132f  c5f8119d30fdffff     vmovups [rbp-0x2d0],xmm3
0x177442cbd5f7  1337  c4a17a6f1c33         vmovdqu xmm3,[rbx+r14*1]
0x177442cbd5fd  133d  c5905cf3             vsubps xmm6,xmm13,xmm3
0x177442cbd601  1341  c5c859fe             vmulps xmm7,xmm6,xmm6
0x177442cbd605  1345  c5d058ef             vaddps xmm5,xmm5,xmm7
0x177442cbd609  1349  c588c2fd02           vcmpps xmm7,xmm14,xmm5, (le)
0x177442cbd60e  134e  c5f811b520fdffff     vmovups [rbp-0x2e0],xmm6
0x177442cbd616  1356  c5d0c2f101           vcmpps xmm6,xmm5,xmm1, (lt)
0x177442cbd61b  135b  c5c1dbf6             vpand xmm6,xmm7,xmm6
0x177442cbd61f  135f  c598c2fd01           vcmpps xmm7,xmm12,xmm5, (lt)
0x177442cbd624  1364  c4c141dbfa           vpand xmm7,xmm7,xmm10
0x177442cbd629  1369  c5f85bff             vcvtdq2ps xmm7,xmm7
0x177442cbd62d  136d  c5c9dbf7             vpand xmm6,xmm6,xmm7
0x177442cbd631  1371  c5f810bdc0fdffff     vmovups xmm7,[rbp-0x240]
0x177442cbd639  1379  c5c858ff             vaddps xmm7,xmm6,xmm7
0x177442cbd63d  137d  448d7620             leal r14,[rsi+0x20]
0x177442cbd641  1381  c5f811bdc0fdffff     vmovups [rbp-0x240],xmm7
0x177442cbd649  1389  c4a17a6f3c33         vmovdqu xmm7,[rbx+r14*1]
0x177442cbd64f  138f  c5f811ad10fdffff     vmovups [rbp-0x2f0],xmm5
0x177442cbd657  1397  c5d85cef             vsubps xmm5,xmm4,xmm7
0x177442cbd65b  139b  c5f811bdc0fcffff     vmovups [rbp-0x340],xmm7
0x177442cbd663  13a3  c5d059fd             vmulps xmm7,xmm5,xmm5
0x177442cbd667  13a7  448d7720             leal r14,[rdi+0x20]
0x177442cbd66b  13ab  c5f811ad60fdffff     vmovups [rbp-0x2a0],xmm5
0x177442cbd673  13b3  c4a17a6f2c33         vmovdqu xmm5,[rbx+r14*1]
0x177442cbd679  13b9  c5105cc5             vsubps xmm8,xmm13,xmm5
0x177442cbd67d  13bd  c5f811adb0fcffff     vmovups [rbp-0x350],xmm5
0x177442cbd685  13c5  c4c13859e8           vmulps xmm5,xmm8,xmm8
0x177442cbd68a  13ca  c5c058ed             vaddps xmm5,xmm7,xmm5
0x177442cbd68e  13ce  c588c2fd02           vcmpps xmm7,xmm14,xmm5, (le)
0x177442cbd693  13d3  c578118550fdffff     vmovups [rbp-0x2b0],xmm8
0x177442cbd69b  13db  c550c2c101           vcmpps xmm8,xmm5,xmm1, (lt)
0x177442cbd6a0  13e0  c4c141dbf8           vpand xmm7,xmm7,xmm8
0x177442cbd6a5  13e5  c518c2c501           vcmpps xmm8,xmm12,xmm5, (lt)
0x177442cbd6aa  13ea  c44139dbc2           vpand xmm8,xmm8,xmm10
0x177442cbd6af  13ef  c441785bc0           vcvtdq2ps xmm8,xmm8
0x177442cbd6b4  13f4  c4c141dbf8           vpand xmm7,xmm7,xmm8
0x177442cbd6b9  13f9  c578108530feffff     vmovups xmm8,[rbp-0x1d0]
0x177442cbd6c1  1401  c4414058c0           vaddps xmm8,xmm7,xmm8
0x177442cbd6c6  1406  448d7610             leal r14,[rsi+0x10]
0x177442cbd6ca  140a  c578118530feffff     vmovups [rbp-0x1d0],xmm8
0x177442cbd6d2  1412  c4217a6f0433         vmovdqu xmm8,[rbx+r14*1]
0x177442cbd6d8  1418  c5f811ad40fdffff     vmovups [rbp-0x2c0],xmm5
0x177442cbd6e0  1420  c4c1585ce8           vsubps xmm5,xmm4,xmm8
0x177442cbd6e5  1425  c5d059e5             vmulps xmm4,xmm5,xmm5
0x177442cbd6e9  1429  448d7710             leal r14,[rdi+0x10]
0x177442cbd6ed  142d  c5f811ada0fdffff     vmovups [rbp-0x260],xmm5
0x177442cbd6f5  1435  c4a17a6f2c33         vmovdqu xmm5,[rbx+r14*1]
0x177442cbd6fb  143b  c5781185d0fcffff     vmovups [rbp-0x330],xmm8
0x177442cbd703  1443  c5105cc5             vsubps xmm8,xmm13,xmm5
0x177442cbd707  1447  c4413859e8           vmulps xmm13,xmm8,xmm8
0x177442cbd70c  144c  c4c15858e5           vaddps xmm4,xmm4,xmm13
0x177442cbd711  1451  c508c2ec02           vcmpps xmm13,xmm14,xmm4, (le)
0x177442cbd716  1456  c578118590fdffff     vmovups [rbp-0x270],xmm8
0x177442cbd71e  145e  c558c2c101           vcmpps xmm8,xmm4,xmm1, (lt)
0x177442cbd723  1463  c44111dbc0           vpand xmm8,xmm13,xmm8
0x177442cbd728  1468  c518c2e401           vcmpps xmm12,xmm12,xmm4, (lt)
0x177442cbd72d  146d  c44119dbe2           vpand xmm12,xmm12,xmm10
0x177442cbd732  1472  c441785be4           vcvtdq2ps xmm12,xmm12
0x177442cbd737  1477  c44139dbc4           vpand xmm8,xmm8,xmm12
0x177442cbd73c  147c  c57810a5c0feffff     vmovups xmm12,[rbp-0x140]
0x177442cbd744  1484  c4413858e4           vaddps xmm12,xmm8,xmm12
0x177442cbd749  1489  468d3438             leal r14,[rax+r15*1]
0x177442cbd74d  148d  c4217a6f2c33         vmovdqu xmm13,[rbx+r14*1]
0x177442cbd753  1493  c51059e8             vmulps xmm13,xmm13,xmm0
0x177442cbd757  1497  c5f8108d70fbffff     vmovups xmm1,[rbp-0x490]
0x177442cbd75f  149f  c51058e9             vaddps xmm13,xmm13,xmm1
0x177442cbd763  14a3  428d3400             leal rsi,[rax+r8*1]
0x177442cbd767  14a7  c5fa6f0c33           vmovdqu xmm1,[rbx+rsi*1]
0x177442cbd76c  14ac  c5f059c8             vmulps xmm1,xmm1,xmm0
0x177442cbd770  14b0  c57811a5c0feffff     vmovups [rbp-0x140],xmm12
0x177442cbd778  14b8  c57810a580fbffff     vmovups xmm12,[rbp-0x480]
0x177442cbd780  14c0  c4417058e4           vaddps xmm12,xmm1,xmm12
0x177442cbd785  14c5  c52059d8             vmulps xmm11,xmm11,xmm0
0x177442cbd789  14c9  c5f8108d90fbffff     vmovups xmm1,[rbp-0x470]
0x177442cbd791  14d1  c52058d9             vaddps xmm11,xmm11,xmm1
0x177442cbd795  14d5  c5e859c0             vmulps xmm0,xmm2,xmm0
0x177442cbd799  14d9  c5f8108da0fbffff     vmovups xmm1,[rbp-0x460]
0x177442cbd7a1  14e1  c5f058c0             vaddps xmm0,xmm1,xmm0
0x177442cbd7a5  14e5  418d7e30             leal rdi,[r14+0x30]
0x177442cbd7a9  14e9  c5fa6f0c3b           vmovdqu xmm1,[rbx+rdi*1]
0x177442cbd7ae  14ee  c5f059ce             vmulps xmm1,xmm1,xmm6
0x177442cbd7b2  14f2  c5f81095d0fdffff     vmovups xmm2,[rbp-0x230]
0x177442cbd7ba  14fa  c5f058ca             vaddps xmm1,xmm1,xmm2
0x177442cbd7be  14fe  8d7e30               leal rdi,[rsi+0x30]
0x177442cbd7c1  1501  c5fa6f143b           vmovdqu xmm2,[rbx+rdi*1]
0x177442cbd7c6  1506  c5e859d6             vmulps xmm2,xmm2,xmm6
0x177442cbd7ca  150a  c5f81185a0fbffff     vmovups [rbp-0x460],xmm0
0x177442cbd7d2  1512  c5f81085e0fdffff     vmovups xmm0,[rbp-0x220]
0x177442cbd7da  151a  c5e858c0             vaddps xmm0,xmm2,xmm0
0x177442cbd7de  151e  c5e059de             vmulps xmm3,xmm3,xmm6
0x177442cbd7e2  1522  c5f81095f0fdffff     vmovups xmm2,[rbp-0x210]
0x177442cbd7ea  152a  c5e058da             vaddps xmm3,xmm3,xmm2
0x177442cbd7ee  152e  c5b059f6             vmulps xmm6,xmm9,xmm6
0x177442cbd7f2  1532  c578108d00feffff     vmovups xmm9,[rbp-0x200]
0x177442cbd7fa  153a  c5b058f6             vaddps xmm6,xmm9,xmm6
0x177442cbd7fe  153e  418d7e20             leal rdi,[r14+0x20]
0x177442cbd802  1542  c57a6f0c3b           vmovdqu xmm9,[rbx+rdi*1]
0x177442cbd807  1547  c53059cf             vmulps xmm9,xmm9,xmm7
0x177442cbd80b  154b  c5f8109540feffff     vmovups xmm2,[rbp-0x1c0]
0x177442cbd813  1553  c53058ca             vaddps xmm9,xmm9,xmm2
0x177442cbd817  1557  8d7e20               leal rdi,[rsi+0x20]
0x177442cbd81a  155a  c5fa6f143b           vmovdqu xmm2,[rbx+rdi*1]
0x177442cbd81f  155f  c5e859d7             vmulps xmm2,xmm2,xmm7
0x177442cbd823  1563  c5f81185e0fdffff     vmovups [rbp-0x220],xmm0
0x177442cbd82b  156b  c5f8108550feffff     vmovups xmm0,[rbp-0x1b0]
0x177442cbd833  1573  c5e858d0             vaddps xmm2,xmm2,xmm0
0x177442cbd837  1577  c5f81085b0fcffff     vmovups xmm0,[rbp-0x350]
0x177442cbd83f  157f  c5f859c7             vmulps xmm0,xmm0,xmm7
0x177442cbd843  1583  c5f8119df0fdffff     vmovups [rbp-0x210],xmm3
0x177442cbd84b  158b  c5f8109dd0feffff     vmovups xmm3,[rbp-0x130]
0x177442cbd853  1593  c5f858c3             vaddps xmm0,xmm0,xmm3
0x177442cbd857  1597  c5f8109dc0fcffff     vmovups xmm3,[rbp-0x340]
0x177442cbd85f  159f  c5e059df             vmulps xmm3,xmm3,xmm7
0x177442cbd863  15a3  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x177442cbd86b  15ab  c5c058fb             vaddps xmm7,xmm7,xmm3
0x177442cbd86f  15af  4183c610             addl r14,0x10
0x177442cbd873  15b3  c4a17a6f1c33         vmovdqu xmm3,[rbx+r14*1]
0x177442cbd879  15b9  c4c16059d8           vmulps xmm3,xmm3,xmm8
0x177442cbd87e  15be  c5f811b500feffff     vmovups [rbp-0x200],xmm6
0x177442cbd886  15c6  c5f810b5b0feffff     vmovups xmm6,[rbp-0x150]
0x177442cbd88e  15ce  c5e058f6             vaddps xmm6,xmm3,xmm6
0x177442cbd892  15d2  448d7610             leal r14,[rsi+0x10]
0x177442cbd896  15d6  c4a17a6f1c33         vmovdqu xmm3,[rbx+r14*1]
0x177442cbd89c  15dc  c4c16059d8           vmulps xmm3,xmm3,xmm8
0x177442cbd8a1  15e1  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x177442cbd8a9  15e9  c5f8108560fcffff     vmovups xmm0,[rbp-0x3a0]
0x177442cbd8b1  15f1  c5e058c0             vaddps xmm0,xmm3,xmm0
0x177442cbd8b5  15f5  c4c15059d8           vmulps xmm3,xmm5,xmm8
0x177442cbd8ba  15fa  c5f810ad50fcffff     vmovups xmm5,[rbp-0x3b0]
0x177442cbd8c2  1602  c5e058dd             vaddps xmm3,xmm3,xmm5
0x177442cbd8c6  1606  c5f810add0fcffff     vmovups xmm5,[rbp-0x330]
0x177442cbd8ce  160e  c4c15059e8           vmulps xmm5,xmm5,xmm8
0x177442cbd8d3  1613  c578108540fcffff     vmovups xmm8,[rbp-0x3c0]
0x177442cbd8db  161b  c5b858ed             vaddps xmm5,xmm8,xmm5
0x177442cbd8df  161f  c5781085e0fcffff     vmovups xmm8,[rbp-0x320]
0x177442cbd8e7  1627  c44138c2c601         vcmpps xmm8,xmm8,xmm14, (lt)
0x177442cbd8ed  162d  c44139dbc2           vpand xmm8,xmm8,xmm10
0x177442cbd8f2  1632  c441785bc0           vcvtdq2ps xmm8,xmm8
0x177442cbd8f7  1637  c5f8118560fcffff     vmovups [rbp-0x3a0],xmm0
0x177442cbd8ff  163f  c5f81085f0fcffff     vmovups xmm0,[rbp-0x310]
0x177442cbd907  1647  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd90c  164c  c5f8118dd0fdffff     vmovups [rbp-0x230],xmm1
0x177442cbd914  1654  c5f8108db0fbffff     vmovups xmm1,[rbp-0x450]
0x177442cbd91c  165c  c5f058c8             vaddps xmm1,xmm1,xmm0
0x177442cbd920  1660  c5f8108500fdffff     vmovups xmm0,[rbp-0x300]
0x177442cbd928  1668  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd92d  166d  c578108590feffff     vmovups xmm8,[rbp-0x170]
0x177442cbd935  1675  c5b858c0             vaddps xmm0,xmm8,xmm0
0x177442cbd939  1679  c578108510fdffff     vmovups xmm8,[rbp-0x2f0]
0x177442cbd941  1681  c44138c2c601         vcmpps xmm8,xmm8,xmm14, (lt)
0x177442cbd947  1687  c44139dbc2           vpand xmm8,xmm8,xmm10
0x177442cbd94c  168c  c441785bc0           vcvtdq2ps xmm8,xmm8
0x177442cbd951  1691  c5f8118590feffff     vmovups [rbp-0x170],xmm0
0x177442cbd959  1699  c5f8108520fdffff     vmovups xmm0,[rbp-0x2e0]
0x177442cbd961  16a1  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd966  16a6  c57811a580fbffff     vmovups [rbp-0x480],xmm12
0x177442cbd96e  16ae  c57810a510feffff     vmovups xmm12,[rbp-0x1f0]
0x177442cbd976  16b6  c51858e0             vaddps xmm12,xmm12,xmm0
0x177442cbd97a  16ba  c5f8108530fdffff     vmovups xmm0,[rbp-0x2d0]
0x177442cbd982  16c2  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd987  16c7  c578108520feffff     vmovups xmm8,[rbp-0x1e0]
0x177442cbd98f  16cf  c5b858c0             vaddps xmm0,xmm8,xmm0
0x177442cbd993  16d3  c578108540fdffff     vmovups xmm8,[rbp-0x2c0]
0x177442cbd99b  16db  c44138c2c601         vcmpps xmm8,xmm8,xmm14, (lt)
0x177442cbd9a1  16e1  c44139dbc2           vpand xmm8,xmm8,xmm10
0x177442cbd9a6  16e6  c441785bc0           vcvtdq2ps xmm8,xmm8
0x177442cbd9ab  16eb  c5f8118520feffff     vmovups [rbp-0x1e0],xmm0
0x177442cbd9b3  16f3  c5f8108550fdffff     vmovups xmm0,[rbp-0x2b0]
0x177442cbd9bb  16fb  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd9c0  1700  c578119d90fbffff     vmovups [rbp-0x470],xmm11
0x177442cbd9c8  1708  c578109d70feffff     vmovups xmm11,[rbp-0x190]
0x177442cbd9d0  1710  c52058d8             vaddps xmm11,xmm11,xmm0
0x177442cbd9d4  1714  c5f8108560fdffff     vmovups xmm0,[rbp-0x2a0]
0x177442cbd9dc  171c  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x177442cbd9e1  1721  c578108580feffff     vmovups xmm8,[rbp-0x180]
0x177442cbd9e9  1729  c5b858c0             vaddps xmm0,xmm8,xmm0
0x177442cbd9ed  172d  c4c158c2e601         vcmpps xmm4,xmm4,xmm14, (lt)
0x177442cbd9f3  1733  c4c159dbe2           vpand xmm4,xmm4,xmm10
0x177442cbd9f8  1738  c5f85be4             vcvtdq2ps xmm4,xmm4
0x177442cbd9fc  173c  c578108590fdffff     vmovups xmm8,[rbp-0x270]
0x177442cbda04  1744  c53859c4             vmulps xmm8,xmm8,xmm4
0x177442cbda08  1748  c578109540fbffff     vmovups xmm10,[rbp-0x4c0]
0x177442cbda10  1750  c4412858c0           vaddps xmm8,xmm10,xmm8
0x177442cbda15  1755  c5781095a0fdffff     vmovups xmm10,[rbp-0x260]
0x177442cbda1d  175d  c5a859e4             vmulps xmm4,xmm10,xmm4
0x177442cbda21  1761  c578109550fbffff     vmovups xmm10,[rbp-0x4b0]
0x177442cbda29  1769  c5a858e4             vaddps xmm4,xmm10,xmm4
0x177442cbda2d  176d  83c040               addl rax,0x40
0x177442cbda30  1770  4183c4ff             addl r12,0xff
0x177442cbda34  1774  0f8586faffff         jnz 0x177442cbd4c0  <+0x1200>
0x177442cbda3a  177a  c5f811a550fbffff     vmovups [rbp-0x4b0],xmm4
0x177442cbda42  1782  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbda4a  178a  c5f8118db0fbffff     vmovups [rbp-0x450],xmm1
0x177442cbda52  1792  c578118540fbffff     vmovups [rbp-0x4c0],xmm8
0x177442cbda5a  179a  c5781085a0fbffff     vmovups xmm8,[rbp-0x460]
0x177442cbda62  17a2  c578109590fbffff     vmovups xmm10,[rbp-0x470]
0x177442cbda6a  17aa  c4417928f5           vmovapd xmm14,xmm13
0x177442cbda6f  17af  c57810ad80fbffff     vmovups xmm13,[rbp-0x480]
0x177442cbda77  17b7  c5f8108d60fbffff     vmovups xmm1,[rbp-0x4a0]
0x177442cbda7f  17bf  448bb520ffffff       movl r14,[rbp-0xe0]
0x177442cbda86  17c6  4183e60f             andl r14,0xf
0x177442cbda8a  17ca  448ba5e0feffff       movl r12,[rbp-0x120]
0x177442cbda91  17d1  4183e40f             andl r12,0xf
0x177442cbda95  17d5  4489e0               movl rax,r12
0x177442cbda98  17d8  4439e2               cmpl rdx,r12
0x177442cbda9b  17db  0f42c2               cmovcl rax,rdx
0x177442cbda9e  17de  448be0               movl r12,rax
0x177442cbdaa1  17e1  443bc8               cmpl r9,rax
0x177442cbdaa4  17e4  450f42e1             cmovcl r12,r9
0x177442cbdaa8  17e8  4489e0               movl rax,r12
0x177442cbdaab  17eb  4539e6               cmpl r14,r12
0x177442cbdaae  17ee  410f42c6             cmovcl rax,r14
0x177442cbdab2  17f2  c5f811bd60feffff     vmovups [rbp-0x1a0],xmm7
0x177442cbdaba  17fa  c5f8119550feffff     vmovups [rbp-0x1b0],xmm2
0x177442cbdac2  1802  c578118d40feffff     vmovups [rbp-0x1c0],xmm9
0x177442cbdaca  180a  c57811a510feffff     vmovups [rbp-0x1f0],xmm12
0x177442cbdad2  1812  c5f811ad40fcffff     vmovups [rbp-0x3c0],xmm5
0x177442cbdada  181a  c5f8119d50fcffff     vmovups [rbp-0x3b0],xmm3
0x177442cbdae2  1822  c5f811b5b0feffff     vmovups [rbp-0x150],xmm6
0x177442cbdaea  182a  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x177442cbdaf2  1832  c578119d70feffff     vmovups [rbp-0x190],xmm11
0x177442cbdafa  183a  c5781185a0fbffff     vmovups [rbp-0x460],xmm8
0x177442cbdb02  1842  c578119590fbffff     vmovups [rbp-0x470],xmm10
0x177442cbdb0a  184a  c57811ad80fbffff     vmovups [rbp-0x480],xmm13
0x177442cbdb12  1852  c57811b570fbffff     vmovups [rbp-0x490],xmm14
0x177442cbdb1a  185a  85c0                 testl rax,rax
0x177442cbdb1c  185c  0f84e3010000         jz 0x177442cbdd05  <+0x1a45>
0x177442cbdb22  1862  448b8de0feffff       movl r9,[rbp-0x120]
0x177442cbdb29  1869  4181e1f0ffff1f       andl r9,0x1ffffff0
0x177442cbdb30  1870  478d1c8b             leal r11,[r11+r9*4]
0x177442cbdb34  1874  448bb520ffffff       movl r14,[rbp-0xe0]
0x177442cbdb3b  187b  4181e6f0ffff1f       andl r14,0x1ffffff0
0x177442cbdb42  1882  478d24b7             leal r12,[r15+r14*4]
0x177442cbdb46  1886  c5f810bd50ffffff     vmovups xmm7,[rbp-0xb0]
0x177442cbdb4e  188e  c5fb1095f8feffff     vmovsd xmm2,[rbp-0x108]
0x177442cbdb56  1896  c57b108d00ffffff     vmovsd xmm9,[rbp-0x100]
0x177442cbdb5e  189e  c57b10a508ffffff     vmovsd xmm12,[rbp-0xf8]
0x177442cbdb66  18a6  c5fb10ad10ffffff     vmovsd xmm5,[rbp-0xf0]
0x177442cbdb6e  18ae  c5e057db             vxorps xmm3,xmm3,xmm3
0x177442cbdb72  18b2  8bb5f0feffff         movl rsi,[rbp-0x110]
0x177442cbdb78  18b8  458bfb               movl r15,r11
0x177442cbdb7b  18bb  448b9de8feffff       movl r11,[rbp-0x118]
0x177442cbdb82  18c2  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x177442cbdb86  18c6  c5c972f619           vpslld xmm6,xmm6,25
0x177442cbdb8b  18cb  c5c972d602           vpsrld xmm6,xmm6,2
0x177442cbdb90  18d0  660f1f840000000000   nop
0x177442cbdb99  18d9  660f1f840000000000   nop
0x177442cbdba2  18e2  660f1f840000000000   nop
0x177442cbdbab  18eb  660f1f840000000000   nop
0x177442cbdbb4  18f4  660f1f840000000000   nop
0x177442cbdbbd  18fd  0f1f00               nop
0x177442cbdbc0  1900  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x177442cbdbc4  1904  0f861f080000         jna 0x177442cbe3e9  <+0x2129>
0x177442cbdbca  190a  c4a17a10043b         vmovss xmm0,[rbx+r15*1]
0x177442cbdbd0  1910  c56a5cd8             vsubss xmm11,xmm2,xmm0
0x177442cbdbd4  1914  c4412259c3           vmulss xmm8,xmm11,xmm11
0x177442cbdbd9  1919  c4217a10141b         vmovss xmm10,[rbx+r11*1]
0x177442cbdbdf  191f  c441325cea           vsubss xmm13,xmm9,xmm10
0x177442cbdbe4  1924  c4411259f5           vmulss xmm14,xmm13,xmm13
0x177442cbdbe9  1929  c4410a58c0           vaddss xmm8,xmm14,xmm8
0x177442cbdbee  192e  c441782ee0           vucomiss xmm12,xmm8
0x177442cbdbf3  1933  0f875c000000         ja 0x177442cbdc55  <+0x1995>
0x177442cbdbf9  1939  c4c1782ee8           vucomiss xmm5,xmm8
0x177442cbdbfe  193e  0f8679000000         jna 0x177442cbdc7d  <+0x19bd>
0x177442cbdc04  1944  c5782ec3             vucomiss xmm8,xmm3
0x177442cbdc08  1948  0f866f000000         jna 0x177442cbdc7d  <+0x19bd>
0x177442cbdc0e  194e  c4e27918c0           vbroadcastss xmm0,xmm0
0x177442cbdc13  1953  c4c37921c210         vinsertps xmm0,xmm0,xmm10,0x10
0x177442cbdc19  1959  c57a100433           vmovss xmm8,[rbx+rsi*1]
0x177442cbdc1e  195e  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x177442cbdc24  1964  c4217a100423         vmovss xmm8,[rbx+r12*1]
0x177442cbdc2a  196a  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x177442cbdc30  1970  c5c058c0             vaddps xmm0,xmm7,xmm0
0x177442cbdc34  1974  c5ca58bd68ffffff     vaddss xmm7,xmm6,[rbp-0x98]
0x177442cbdc3c  197c  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x177442cbdc44  1984  c5fb11bd40ffffff     vmovsd [rbp-0xc0],xmm7
0x177442cbdc4c  198c  c5f928f8             vmovapd xmm7,xmm0
0x177442cbdc50  1990  e928000000           jmp 0x177442cbdc7d  <+0x19bd>
0x177442cbdc55  1995  c512588530ffffff     vaddss xmm8,xmm13,[rbp-0xd0]
0x177442cbdc5d  199d  c5a2588560ffffff     vaddss xmm0,xmm11,[rbp-0xa0]
0x177442cbdc65  19a5  c57b118530ffffff     vmovsd [rbp-0xd0],xmm8
0x177442cbdc6d  19ad  c5fb118538ffffff     vmovsd [rbp-0xc8],xmm0
0x177442cbdc75  19b5  c5fb118560ffffff     vmovsd [rbp-0xa0],xmm0
0x177442cbdc7d  19bd  4183c704             addl r15,0x4
0x177442cbdc81  19c1  4183c304             addl r11,0x4
0x177442cbdc85  19c5  83c604               addl rsi,0x4
0x177442cbdc88  19c8  4183c404             addl r12,0x4
0x177442cbdc8c  19cc  83c0ff               addl rax,0xff
0x177442cbdc8f  19cf  0f852bffffff         jnz 0x177442cbdbc0  <+0x1900>
0x177442cbdc95  19d5  c5f811bd50ffffff     vmovups [rbp-0xb0],xmm7
0x177442cbdc9d  19dd  c57810b570fbffff     vmovups xmm14,[rbp-0x490]
0x177442cbdca5  19e5  c57810ad80fbffff     vmovups xmm13,[rbp-0x480]
0x177442cbdcad  19ed  c578109590fbffff     vmovups xmm10,[rbp-0x470]
0x177442cbdcb5  19f5  c5781085a0fbffff     vmovups xmm8,[rbp-0x460]
0x177442cbdcbd  19fd  c578109d70feffff     vmovups xmm11,[rbp-0x190]
0x177442cbdcc5  1a05  c5f810bd60feffff     vmovups xmm7,[rbp-0x1a0]
0x177442cbdccd  1a0d  c5f8109550feffff     vmovups xmm2,[rbp-0x1b0]
0x177442cbdcd5  1a15  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x177442cbdcdd  1a1d  c57810a510feffff     vmovups xmm12,[rbp-0x1f0]
0x177442cbdce5  1a25  c5f810ad40fcffff     vmovups xmm5,[rbp-0x3c0]
0x177442cbdced  1a2d  c5f8109d50fcffff     vmovups xmm3,[rbp-0x3b0]
0x177442cbdcf5  1a35  c5f810b5b0feffff     vmovups xmm6,[rbp-0x150]
0x177442cbdcfd  1a3d  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x177442cbdd05  1a45  448bb578ffffff       movl r14,[rbp-0x88]
0x177442cbdd0c  1a4c  458d5e01             leal r11,[r14+0x1]
0x177442cbdd10  1a50  448ba570ffffff       movl r12,[rbp-0x90]
0x177442cbdd17  1a57  453be6               cmpl r12,r14
0x177442cbdd1a  1a5a  0f8520f4ffff         jnz 0x177442cbd140  <+0xe80>
0x177442cbdd20  1a60  448b5de0             movl r11,[rbp-0x20]
0x177442cbdd24  1a64  c5f810a5b0fbffff     vmovups xmm4,[rbp-0x450]
0x177442cbdd2c  1a6c  c4a17a7fa41bc0010000 vmovdqu [rbx+r11*1+0x1c0],xmm4
0x177442cbdd36  1a76  c5f810a590feffff     vmovups xmm4,[rbp-0x170]
0x177442cbdd3e  1a7e  c4a17a7fa41b80010000 vmovdqu [rbx+r11*1+0x180],xmm4
0x177442cbdd48  1a88  c5f810a540fbffff     vmovups xmm4,[rbp-0x4c0]
0x177442cbdd50  1a90  c4a17a7fa41bd0010000 vmovdqu [rbx+r11*1+0x1d0],xmm4
0x177442cbdd5a  1a9a  c5f810a550fbffff     vmovups xmm4,[rbp-0x4b0]
0x177442cbdd62  1aa2  c4a17a7fa41b90010000 vmovdqu [rbx+r11*1+0x190],xmm4
0x177442cbdd6c  1aac  c4a17a7f8c1b40010000 vmovdqu [rbx+r11*1+0x140],xmm1
0x177442cbdd76  1ab6  c4217a7fb41b00010000 vmovdqu [rbx+r11*1+0x100],xmm14
0x177442cbdd80  1ac0  c4217a7fac1bc0000000 vmovdqu [rbx+r11*1+0xc0],xmm13
0x177442cbdd8a  1aca  c4217a7f941b80000000 vmovdqu [rbx+r11*1+0x80],xmm10
0x177442cbdd94  1ad4  c4217a7f441b40       vmovdqu [rbx+r11*1+0x40],xmm8
0x177442cbdd9b  1adb  c4217a7f9c1be0010000 vmovdqu [rbx+r11*1+0x1e0],xmm11
0x177442cbdda5  1ae5  c4a17a7f841ba0010000 vmovdqu [rbx+r11*1+0x1a0],xmm0
0x177442cbddaf  1aef  c5f81085c0feffff     vmovups xmm0,[rbp-0x140]
0x177442cbddb7  1af7  c4a17a7f841b50010000 vmovdqu [rbx+r11*1+0x150],xmm0
0x177442cbddc1  1b01  c5f928c6             vmovapd xmm0,xmm6
0x177442cbddc5  1b05  c4a17a7f841b10010000 vmovdqu [rbx+r11*1+0x110],xmm0
0x177442cbddcf  1b0f  c5f8108560fcffff     vmovups xmm0,[rbp-0x3a0]
0x177442cbddd7  1b17  c4a17a7f841bd0000000 vmovdqu [rbx+r11*1+0xd0],xmm0
0x177442cbdde1  1b21  c5f928c3             vmovapd xmm0,xmm3
0x177442cbdde5  1b25  c4a17a7f841b90000000 vmovdqu [rbx+r11*1+0x90],xmm0
0x177442cbddef  1b2f  c5f928c5             vmovapd xmm0,xmm5
0x177442cbddf3  1b33  c4a17a7f441b50       vmovdqu [rbx+r11*1+0x50],xmm0
0x177442cbddfa  1b3a  c4217a7fa41bf0010000 vmovdqu [rbx+r11*1+0x1f0],xmm12
0x177442cbde04  1b44  c57810ad20feffff     vmovups xmm13,[rbp-0x1e0]
0x177442cbde0c  1b4c  c4217a7fac1bb0010000 vmovdqu [rbx+r11*1+0x1b0],xmm13
0x177442cbde16  1b56  c57810b530feffff     vmovups xmm14,[rbp-0x1d0]
0x177442cbde1e  1b5e  c4217a7fb41b60010000 vmovdqu [rbx+r11*1+0x160],xmm14
0x177442cbde28  1b68  c4c17928c9           vmovapd xmm1,xmm9
0x177442cbde2d  1b6d  c4a17a7f8c1b20010000 vmovdqu [rbx+r11*1+0x120],xmm1
0x177442cbde37  1b77  c4a17a7f941be0000000 vmovdqu [rbx+r11*1+0xe0],xmm2
0x177442cbde41  1b81  c5f81085d0feffff     vmovups xmm0,[rbp-0x130]
0x177442cbde49  1b89  c4a17a7f841ba0000000 vmovdqu [rbx+r11*1+0xa0],xmm0
0x177442cbde53  1b93  c5f928df             vmovapd xmm3,xmm7
0x177442cbde57  1b97  c4a17a7f5c1b60       vmovdqu [rbx+r11*1+0x60],xmm3
0x177442cbde5e  1b9e  c5f810bdc0fdffff     vmovups xmm7,[rbp-0x240]
0x177442cbde66  1ba6  c4a17a7fbc1b70010000 vmovdqu [rbx+r11*1+0x170],xmm7
0x177442cbde70  1bb0  c5781085d0fdffff     vmovups xmm8,[rbp-0x230]
0x177442cbde78  1bb8  c4217a7f841b30010000 vmovdqu [rbx+r11*1+0x130],xmm8
0x177442cbde82  1bc2  c578108de0fdffff     vmovups xmm9,[rbp-0x220]
0x177442cbde8a  1bca  c4217a7f8c1bf0000000 vmovdqu [rbx+r11*1+0xf0],xmm9
0x177442cbde94  1bd4  c5781095f0fdffff     vmovups xmm10,[rbp-0x210]
0x177442cbde9c  1bdc  c4217a7f941bb0000000 vmovdqu [rbx+r11*1+0xb0],xmm10
0x177442cbdea6  1be6  c578109d00feffff     vmovups xmm11,[rbp-0x200]
0x177442cbdeae  1bee  c4217a7f5c1b70       vmovdqu [rbx+r11*1+0x70],xmm11
0x177442cbdeb5  1bf5  c5f8108550ffffff     vmovups xmm0,[rbp-0xb0]
0x177442cbdebd  1bfd  c4a17a7f441b10       vmovdqu [rbx+r11*1+0x10],xmm0
0x177442cbdec4  1c04  c5fb10b540ffffff     vmovsd xmm6,[rbp-0xc0]
0x177442cbdecc  1c0c  c4a17a11741b20       vmovss [rbx+r11*1+0x20],xmm6
0x177442cbded3  1c13  c5fb10bd38ffffff     vmovsd xmm7,[rbp-0xc8]
0x177442cbdedb  1c1b  c4a17a117c1b24       vmovss [rbx+r11*1+0x24],xmm7
0x177442cbdee2  1c22  c57b108530ffffff     vmovsd xmm8,[rbp-0xd0]
0x177442cbdeea  1c2a  c4217a11441b28       vmovss [rbx+r11*1+0x28],xmm8
0x177442cbdef1  1c31  e904000000           jmp 0x177442cbdefa  <+0x1c3a>
0x177442cbdef6  1c36  448b5de0             movl r11,[rbp-0x20]
0x177442cbdefa  1c3a  418d5310             leal rdx,[r11+0x10]
0x177442cbdefe  1c3e  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x177442cbdf05  1c45  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbdf09  1c49  8b4598               movl rax,[rbp-0x68]
0x177442cbdf0c  1c4c  e82f5ef2ff           call 0x177442be3d40  (jump table)
0x177442cbdf11  1c51  8b5de0               movl rbx,[rbp-0x20]
0x177442cbdf14  1c54  8d4b30               leal rcx,[rbx+0x30]
0x177442cbdf17  1c57  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbdf1b  1c5b  8b4598               movl rax,[rbp-0x68]
0x177442cbdf1e  1c5e  8b5590               movl rdx,[rbp-0x70]
0x177442cbdf21  1c61  c5fb104d88           vmovsd xmm1,[rbp-0x78]
0x177442cbdf26  1c66  c5fb105580           vmovsd xmm2,[rbp-0x80]
0x177442cbdf2b  1c6b  448b8d78ffffff       movl r9,[rbp-0x88]
0x177442cbdf32  1c72  e8115ef2ff           call 0x177442be3d48  (jump table)
0x177442cbdf37  1c77  448b5da0             movl r11,[rbp-0x60]
0x177442cbdf3b  1c7b  443b5dd0             cmpl r11,[rbp-0x30]
0x177442cbdf3f  1c7f  0f86b1000000         jna 0x177442cbdff6  <+0x1d36>
0x177442cbdf45  1c85  8b75d0               movl rsi,[rbp-0x30]
0x177442cbdf48  1c88  448b65a8             movl r12,[rbp-0x58]
0x177442cbdf4c  1c8c  458d3cb4             leal r15,[r12+rsi*4]
0x177442cbdf50  1c90  448b75e0             movl r14,[rbp-0x20]
0x177442cbdf54  1c94  488b45c8             REX.W movq rax,[rbp-0x38]
0x177442cbdf58  1c98  c4a17a10443040       vmovss xmm0,[rax+r14*1+0x40]
0x177442cbdf5f  1c9f  c4a17a110438         vmovss [rax+r15*1],xmm0
0x177442cbdf65  1ca5  448b7db0             movl r15,[rbp-0x50]
0x177442cbdf69  1ca9  418d1cb7             leal rbx,[r15+rsi*4]
0x177442cbdf6d  1cad  c4a17a10443044       vmovss xmm0,[rax+r14*1+0x44]
0x177442cbdf74  1cb4  c5fa110418           vmovss [rax+rbx*1],xmm0
0x177442cbdf79  1cb9  8b5db8               movl rbx,[rbp-0x48]
0x177442cbdf7c  1cbc  8d14b3               leal rdx,[rbx+rsi*4]
0x177442cbdf7f  1cbf  c4a17a10443048       vmovss xmm0,[rax+r14*1+0x48]
0x177442cbdf86  1cc6  c5fa110410           vmovss [rax+rdx*1],xmm0
0x177442cbdf8b  1ccb  8b55c0               movl rdx,[rbp-0x40]
0x177442cbdf8e  1cce  8d0cb2               leal rcx,[rdx+rsi*4]
0x177442cbdf91  1cd1  c4a17a1044304c       vmovss xmm0,[rax+r14*1+0x4c]
0x177442cbdf98  1cd8  c5fa110408           vmovss [rax+rcx*1],xmm0
0x177442cbdf9d  1cdd  458bd3               movl r10,r11
0x177442cbdfa0  1ce0  4c8bd8               REX.W movq r11,rax
0x177442cbdfa3  1ce3  8bc2                 movl rax,rdx
0x177442cbdfa5  1ce5  418bd2               movl rdx,r10
0x177442cbdfa8  1ce8  4489e1               movl rcx,r12
0x177442cbdfab  1ceb  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x177442cbdfb0  1cf0  c4c13972f019         vpslld xmm8,xmm8,25
0x177442cbdfb6  1cf6  c4c13972d002         vpsrld xmm8,xmm8,2
0x177442cbdfbc  1cfc  c5c857f6             vxorps xmm6,xmm6,xmm6
0x177442cbdfc0  1d00  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x177442cbdfc8  1d08  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x177442cbdfd0  1d10  c5f810bd80fdffff     vmovups xmm7,[rbp-0x280]
0x177442cbdfd8  1d18  c5f8109d70fdffff     vmovups xmm3,[rbp-0x290]
0x177442cbdfe0  1d20  c5f810ad90fcffff     vmovups xmm5,[rbp-0x370]
0x177442cbdfe8  1d28  33ff                 xorl rdi,rdi
0x177442cbdfea  1d2a  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbdff1  1d31  e959000000           jmp 0x177442cbe04f  <+0x1d8f>
0x177442cbdff6  1d36  8b75d0               movl rsi,[rbp-0x30]
0x177442cbdff9  1d39  418bd3               movl rdx,r11
0x177442cbdffc  1d3c  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe000  1d40  8b45c0               movl rax,[rbp-0x40]
0x177442cbe003  1d43  8b5db8               movl rbx,[rbp-0x48]
0x177442cbe006  1d46  8b4da8               movl rcx,[rbp-0x58]
0x177442cbe009  1d49  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x177442cbe00e  1d4e  c4c13972f019         vpslld xmm8,xmm8,25
0x177442cbe014  1d54  c4c13972d002         vpsrld xmm8,xmm8,2
0x177442cbe01a  1d5a  c5c857f6             vxorps xmm6,xmm6,xmm6
0x177442cbe01e  1d5e  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x177442cbe026  1d66  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x177442cbe02e  1d6e  c5f810bd80fdffff     vmovups xmm7,[rbp-0x280]
0x177442cbe036  1d76  c5f8109d70fdffff     vmovups xmm3,[rbp-0x290]
0x177442cbe03e  1d7e  c5f810ad90fcffff     vmovups xmm5,[rbp-0x370]
0x177442cbe046  1d86  33ff                 xorl rdi,rdi
0x177442cbe048  1d88  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe04f  1d8f  83c601               addl rsi,0x1
0x177442cbe052  1d92  448b7dd8             movl r15,[rbp-0x28]
0x177442cbe056  1d96  443bfe               cmpl r15,rsi
0x177442cbe059  1d99  0f85a1eaffff         jnz 0x177442cbcb00  <+0x840>
0x177442cbe05f  1d9f  448b5de0             movl r11,[rbp-0x20]
0x177442cbe063  1da3  4181c300020000       addl r11,0x200
0x177442cbe06a  1daa  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x177442cbe06e  1dae  45891c24             movl [r12],r11
0x177442cbe072  1db2  488be5               REX.W movq rsp,rbp
0x177442cbe075  1db5  5d                   pop rbp
0x177442cbe076  1db6  c3                   retl
0x177442cbe077  1db7  e85464f2ff           call 0x177442be44d0  (jump table)
0x177442cbe07c  1dbc  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe080  1dc0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x177442cbe084  1dc4  8b45d8               movl rax,[rbp-0x28]
0x177442cbe087  1dc7  e958e2ffff           jmp 0x177442cbc2e4  <+0x24>
0x177442cbe08c  1dcc  c5f92eff             vucomisd xmm7,xmm7
0x177442cbe090  1dd0  0f8b0a000000         jpo 0x177442cbe0a0  <+0x1de0>
0x177442cbe096  1dd6  33d2                 xorl rdx,rdx
0x177442cbe098  1dd8  4c8bf2               REX.W movq r14,rdx
0x177442cbe09b  1ddb  e9bee3ffff           jmp 0x177442cbc45e  <+0x19e>
0x177442cbe0a0  1de0  c5c057ff             vxorps xmm7,xmm7,xmm7
0x177442cbe0a4  1de4  c5f82efe             vucomiss xmm7,xmm6
0x177442cbe0a8  1de8  0f870b000000         ja 0x177442cbe0b9  <+0x1df9>
0x177442cbe0ae  1dee  41beffffffff         movl r14,0xffffffff
0x177442cbe0b4  1df4  e9a5e3ffff           jmp 0x177442cbc45e  <+0x19e>
0x177442cbe0b9  1df9  4533f6               xorl r14,r14
0x177442cbe0bc  1dfc  e99de3ffff           jmp 0x177442cbc45e  <+0x19e>
0x177442cbe0c1  1e01  c441792ec0           vucomisd xmm8,xmm8
0x177442cbe0c6  1e06  0f8b08000000         jpo 0x177442cbe0d4  <+0x1e14>
0x177442cbe0cc  1e0c  4533f6               xorl r14,r14
0x177442cbe0cf  1e0f  e9f1e3ffff           jmp 0x177442cbc4c5  <+0x205>
0x177442cbe0d4  1e14  c4413857c0           vxorps xmm8,xmm8,xmm8
0x177442cbe0d9  1e19  c5782ec7             vucomiss xmm8,xmm7
0x177442cbe0dd  1e1d  77ed                 ja 0x177442cbe0cc  <+0x1e0c>
0x177442cbe0df  1e1f  41beffffffff         movl r14,0xffffffff
0x177442cbe0e5  1e25  e9dbe3ffff           jmp 0x177442cbc4c5  <+0x205>
0x177442cbe0ea  1e2a  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbe0f2  1e32  4c8945a8             REX.W movq [rbp-0x58],r8
0x177442cbe0f6  1e36  48897da0             REX.W movq [rbp-0x60],rdi
0x177442cbe0fa  1e3a  e8d163f2ff           call 0x177442be44d0  (jump table)
0x177442cbe0ff  1e3f  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe103  1e43  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe10a  1e4a  448b7dd8             movl r15,[rbp-0x28]
0x177442cbe10e  1e4e  8b7da0               movl rdi,[rbp-0x60]
0x177442cbe111  1e51  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbe119  1e59  8b75b0               movl rsi,[rbp-0x50]
0x177442cbe11c  1e5c  8b4db8               movl rcx,[rbp-0x48]
0x177442cbe11f  1e5f  8b5dc0               movl rbx,[rbp-0x40]
0x177442cbe122  1e62  448b45a8             movl r8,[rbp-0x58]
0x177442cbe126  1e66  e9dfe4ffff           jmp 0x177442cbc60a  <+0x34a>
0x177442cbe12b  1e6b  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbe133  1e73  48894db8             REX.W movq [rbp-0x48],rcx
0x177442cbe137  1e77  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbe13b  1e7b  e89063f2ff           call 0x177442be44d0  (jump table)
0x177442cbe140  1e80  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe144  1e84  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe14b  1e8b  448b7dd8             movl r15,[rbp-0x28]
0x177442cbe14f  1e8f  8b55c0               movl rdx,[rbp-0x40]
0x177442cbe152  1e92  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbe15a  1e9a  8b5da0               movl rbx,[rbp-0x60]
0x177442cbe15d  1e9d  8b45a8               movl rax,[rbp-0x58]
0x177442cbe160  1ea0  448b75b0             movl r14,[rbp-0x50]
0x177442cbe164  1ea4  8b4db8               movl rcx,[rbp-0x48]
0x177442cbe167  1ea7  e99ee5ffff           jmp 0x177442cbc70a  <+0x44a>
0x177442cbe16c  1eac  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbe174  1eb4  48894da8             REX.W movq [rbp-0x58],rcx
0x177442cbe178  1eb8  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbe17c  1ebc  e84f63f2ff           call 0x177442be44d0  (jump table)
0x177442cbe181  1ec1  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe185  1ec5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe18c  1ecc  448b7dd8             movl r15,[rbp-0x28]
0x177442cbe190  1ed0  8b55c0               movl rdx,[rbp-0x40]
0x177442cbe193  1ed3  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbe19b  1edb  8b5db8               movl rbx,[rbp-0x48]
0x177442cbe19e  1ede  8b8560ffffff         movl rax,[rbp-0xa0]
0x177442cbe1a4  1ee4  448b75a0             movl r14,[rbp-0x60]
0x177442cbe1a8  1ee8  8b4da8               movl rcx,[rbp-0x58]
0x177442cbe1ab  1eeb  e95ae6ffff           jmp 0x177442cbc80a  <+0x54a>
0x177442cbe1b0  1ef0  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x177442cbe1b8  1ef8  48895d98             REX.W movq [rbp-0x68],rbx
0x177442cbe1bc  1efc  488955c0             REX.W movq [rbp-0x40],rdx
0x177442cbe1c0  1f00  e80b63f2ff           call 0x177442be44d0  (jump table)
0x177442cbe1c5  1f05  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe1c9  1f09  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe1d0  1f10  8b55c0               movl rdx,[rbp-0x40]
0x177442cbe1d3  1f13  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x177442cbe1db  1f1b  448b7dd8             movl r15,[rbp-0x28]
0x177442cbe1df  1f1f  8b45b8               movl rax,[rbp-0x48]
0x177442cbe1e2  1f22  448b75b0             movl r14,[rbp-0x50]
0x177442cbe1e6  1f26  8b5d98               movl rbx,[rbp-0x68]
0x177442cbe1e9  1f29  e91ce7ffff           jmp 0x177442cbc90a  <+0x64a>
0x177442cbe1ee  1f2e  488975d0             REX.W movq [rbp-0x30],rsi
0x177442cbe1f2  1f32  e8d962f2ff           call 0x177442be44d0  (jump table)
0x177442cbe1f7  1f37  8b75d0               movl rsi,[rbp-0x30]
0x177442cbe1fa  1f3a  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x177442cbe1fe  1f3e  8b45c0               movl rax,[rbp-0x40]
0x177442cbe201  1f41  8b5db8               movl rbx,[rbp-0x48]
0x177442cbe204  1f44  8b4da8               movl rcx,[rbp-0x58]
0x177442cbe207  1f47  8b55a0               movl rdx,[rbp-0x60]
0x177442cbe20a  1f4a  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x177442cbe20f  1f4f  c4c13972f019         vpslld xmm8,xmm8,25
0x177442cbe215  1f55  c4c13972d002         vpsrld xmm8,xmm8,2
0x177442cbe21b  1f5b  c5c857f6             vxorps xmm6,xmm6,xmm6
0x177442cbe21f  1f5f  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x177442cbe227  1f67  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x177442cbe22f  1f6f  c5f810bd80fdffff     vmovups xmm7,[rbp-0x280]
0x177442cbe237  1f77  c5f8109d70fdffff     vmovups xmm3,[rbp-0x290]
0x177442cbe23f  1f7f  c5f810ad90fcffff     vmovups xmm5,[rbp-0x370]
0x177442cbe247  1f87  33ff                 xorl rdi,rdi
0x177442cbe249  1f89  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x177442cbe250  1f90  e9b5e8ffff           jmp 0x177442cbcb0a  <+0x84a>
0x177442cbe255  1f95  c5f92eed             vucomisd xmm5,xmm5
0x177442cbe259  1f99  0f8b08000000         jpo 0x177442cbe267  <+0x1fa7>
0x177442cbe25f  1f9f  4533db               xorl r11,r11
0x177442cbe262  1fa2  e9d8eaffff           jmp 0x177442cbcd3f  <+0xa7f>
0x177442cbe267  1fa7  c5f82ee3             vucomiss xmm4,xmm3
0x177442cbe26b  1fab  77f2                 ja 0x177442cbe25f  <+0x1f9f>
0x177442cbe26d  1fad  41bbffffffff         movl r11,0xffffffff
0x177442cbe273  1fb3  e9c7eaffff           jmp 0x177442cbcd3f  <+0xa7f>
0x177442cbe278  1fb8  c5f92ef6             vucomisd xmm6,xmm6
0x177442cbe27c  1fbc  0f8b08000000         jpo 0x177442cbe28a  <+0x1fca>
0x177442cbe282  1fc2  4533db               xorl r11,r11
0x177442cbe285  1fc5  e9a5ebffff           jmp 0x177442cbce2f  <+0xb6f>
0x177442cbe28a  1fca  c5f82ee3             vucomiss xmm4,xmm3
0x177442cbe28e  1fce  77f2                 ja 0x177442cbe282  <+0x1fc2>
0x177442cbe290  1fd0  41bbffffffff         movl r11,0xffffffff
0x177442cbe296  1fd6  e994ebffff           jmp 0x177442cbce2f  <+0xb6f>
0x177442cbe29b  1fdb  c578118d90feffff     vmovups [rbp-0x170],xmm9
0x177442cbe2a3  1fe3  c5781195b0fbffff     vmovups [rbp-0x450],xmm10
0x177442cbe2ab  1feb  c578119da0fbffff     vmovups [rbp-0x460],xmm11
0x177442cbe2b3  1ff3  c57811a590fbffff     vmovups [rbp-0x470],xmm12
0x177442cbe2bb  1ffb  c57811ad80fbffff     vmovups [rbp-0x480],xmm13
0x177442cbe2c3  2003  c57811b570fbffff     vmovups [rbp-0x490],xmm14
0x177442cbe2cb  200b  c5f8118d60fbffff     vmovups [rbp-0x4a0],xmm1
0x177442cbe2d3  2013  c5f8119550fbffff     vmovups [rbp-0x4b0],xmm2
0x177442cbe2db  201b  e8f061f2ff           call 0x177442be44d0  (jump table)
0x177442cbe2e0  2020  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x177442cbe2e4  2024  448bb578ffffff       movl r14,[rbp-0x88]
0x177442cbe2eb  202b  c578108d90feffff     vmovups xmm9,[rbp-0x170]
0x177442cbe2f3  2033  c5781095b0fbffff     vmovups xmm10,[rbp-0x450]
0x177442cbe2fb  203b  c578109da0fbffff     vmovups xmm11,[rbp-0x460]
0x177442cbe303  2043  c57810a590fbffff     vmovups xmm12,[rbp-0x470]
0x177442cbe30b  204b  c57810ad80fbffff     vmovups xmm13,[rbp-0x480]
0x177442cbe313  2053  c57810b570fbffff     vmovups xmm14,[rbp-0x490]
0x177442cbe31b  205b  c5f8108d60fbffff     vmovups xmm1,[rbp-0x4a0]
0x177442cbe323  2063  c5f8109550fbffff     vmovups xmm2,[rbp-0x4b0]
0x177442cbe32b  206b  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbe333  2073  33ff                 xorl rdi,rdi
0x177442cbe335  2075  8bb510fcffff         movl rsi,[rbp-0x3f0]
0x177442cbe33b  207b  8b8508fcffff         movl rax,[rbp-0x3f8]
0x177442cbe341  2081  448b8d00fcffff       movl r9,[rbp-0x400]
0x177442cbe348  2088  448b85f8fbffff       movl r8,[rbp-0x408]
0x177442cbe34f  208f  8b95f0fbffff         movl rdx,[rbp-0x410]
0x177442cbe355  2095  8b8de8fbffff         movl rcx,[rbp-0x418]
0x177442cbe35b  209b  448b9de0fbffff       movl r11,[rbp-0x420]
0x177442cbe362  20a2  8b9dd8fbffff         movl rbx,[rbp-0x428]
0x177442cbe368  20a8  e989eeffff           jmp 0x177442cbd1f6  <+0xf36>
0x177442cbe36d  20ad  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0x177442cbe374  20b4  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x177442cbe37b  20bb  4c898da8feffff       REX.W movq [rbp-0x158],r9
0x177442cbe382  20c2  488995a0feffff       REX.W movq [rbp-0x160],rdx
0x177442cbe389  20c9  4c89a5b8fdffff       REX.W movq [rbp-0x248],r12
0x177442cbe390  20d0  488985b0fdffff       REX.W movq [rbp-0x250],rax
0x177442cbe397  20d7  4c8985a8fcffff       REX.W movq [rbp-0x358],r8
0x177442cbe39e  20de  e82d61f2ff           call 0x177442be44d0  (jump table)
0x177442cbe3a3  20e3  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x177442cbe3a7  20e7  448bbd28ffffff       movl r15,[rbp-0xd8]
0x177442cbe3ae  20ee  448b9d18ffffff       movl r11,[rbp-0xe8]
0x177442cbe3b5  20f5  448b8da8feffff       movl r9,[rbp-0x158]
0x177442cbe3bc  20fc  8b95a0feffff         movl rdx,[rbp-0x160]
0x177442cbe3c2  2102  448ba5b8fdffff       movl r12,[rbp-0x248]
0x177442cbe3c9  2109  8b85b0fdffff         movl rax,[rbp-0x250]
0x177442cbe3cf  210f  448b85a8fcffff       movl r8,[rbp-0x358]
0x177442cbe3d6  2116  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbe3de  211e  8b8da0fcffff         movl rcx,[rbp-0x360]
0x177442cbe3e4  2124  e951f1ffff           jmp 0x177442cbd53a  <+0x127a>
0x177442cbe3e9  2129  c5f8118d60fbffff     vmovups [rbp-0x4a0],xmm1
0x177442cbe3f1  2131  48898528ffffff       REX.W movq [rbp-0xd8],rax
0x177442cbe3f8  2138  4c89a520ffffff       REX.W movq [rbp-0xe0],r12
0x177442cbe3ff  213f  4889b5f0feffff       REX.W movq [rbp-0x110],rsi
0x177442cbe406  2146  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x177442cbe40d  214d  4c89bd18ffffff       REX.W movq [rbp-0xe8],r15
0x177442cbe414  2154  c5f811bd50ffffff     vmovups [rbp-0xb0],xmm7
0x177442cbe41c  215c  e8af60f2ff           call 0x177442be44d0  (jump table)
0x177442cbe421  2161  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x177442cbe425  2165  c5f8108d60fbffff     vmovups xmm1,[rbp-0x4a0]
0x177442cbe42d  216d  8b8528ffffff         movl rax,[rbp-0xd8]
0x177442cbe433  2173  448ba520ffffff       movl r12,[rbp-0xe0]
0x177442cbe43a  217a  8bb5f0feffff         movl rsi,[rbp-0x110]
0x177442cbe440  2180  448b9de8feffff       movl r11,[rbp-0x118]
0x177442cbe447  2187  448bbd18ffffff       movl r15,[rbp-0xe8]
0x177442cbe44e  218e  c5f810bd50ffffff     vmovups xmm7,[rbp-0xb0]
0x177442cbe456  2196  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x177442cbe45a  219a  c5c972f619           vpslld xmm6,xmm6,25
0x177442cbe45f  219f  c5c972d602           vpsrld xmm6,xmm6,2
0x177442cbe464  21a4  c5e057db             vxorps xmm3,xmm3,xmm3
0x177442cbe468  21a8  c5fb10ad10ffffff     vmovsd xmm5,[rbp-0xf0]
0x177442cbe470  21b0  c57b10a508ffffff     vmovsd xmm12,[rbp-0xf8]
0x177442cbe478  21b8  c57b108d00ffffff     vmovsd xmm9,[rbp-0x100]
0x177442cbe480  21c0  c5fb1095f8feffff     vmovsd xmm2,[rbp-0x108]
0x177442cbe488  21c8  c5f810a570fcffff     vmovups xmm4,[rbp-0x390]
0x177442cbe490  21d0  e935f7ffff           jmp 0x177442cbdbca  <+0x190a>
0x177442cbe495  21d5  e8765df2ff           call 0x177442be4210  (jump table)
0x177442cbe49a  21da  90                   nop
0x177442cbe49b  21db  90                   nop

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
       bc0         
       bc5         
       bcd         
       bd7         
       be1         
       beb         
       bf5         
       bfc         
       c06         
       c10         
       c1a         
       c24         
       c2e         
       c38         
       c47         
       c59         
       c6b         
       c7d         
       c8f         
       ca1         
       cb3         
       cc2         
       cd4         
       ce6         
       cf8         
       d0a         
       d1c         
       d2e         
       d3d         
       d4f         
       f5e         
       f66         
      127e         
      128f         
      131c         
      1337         
      1389         
      13b3         
      1412         
      1435         
      148d         
      14a7         
      14e9         
      1501         
      1542         
      155a         
      15b3         
      15d6         
      190a         
      1919         
      1959         
      1964         
      1a6c         
      1a7e         
      1a90         
      1aa2         
      1aac         
      1ab6         
      1ac0         
      1aca         
      1ad4         
      1adb         
      1ae5         
      1af7         
      1b05         
      1b17         
      1b25         
      1b33         
      1b3a         
      1b4c         
      1b5e         
      1b6d         
      1b77         
      1b89         
      1b97         
      1ba6         
      1bb8         
      1bca         
      1bdc         
      1bee         
      1bfd         
      1c0c         
      1c1b         
      1c2a         
      1c98         
      1c9f         
      1cad         
      1cb4         
      1cbf         
      1cc6         
      1cd1         
      1cd8         

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
       bb5      1750
       bc5      1757
       bca      1771
       bd7      1780
       be1      1789
       beb      1798
       bf5      1807
       bfc      1815
       c06      1824
       c10      1833
       c1a      1842
       c24      1851
       c2e      1860
       c38      1869
       c3f      1877
       c51      1886
       c63      1895
       c75      1904
       c87      1913
       c99      1922
       cab      1931
       cba      1939
       ccc      1948
       cde      1957
       cf0      1966
       d02      1975
       d14      1984
       d26      1993
       d35      2001
       d47      2010
       f5e      2112
       f66      2125
      127e      2416
      128f      2441
      1314      2523
      132f      2546
      1381      2610
      13ab      2633
      140a      2697
      142d      2720
      148d      2784
      14a7      2807
      14e9      2856
      1501      2877
      1542      2926
      155a      2947
      15b3      2996
      15d6      3017
      190a      3335
      1919      3350
      1959      3401
      1964      3409
      1a60      3510
      1a76      3519
      1a88      3528
      1a9a      3537
      1aac      3546
      1ab6      3555
      1ac0      3564
      1aca      3573
      1ad4      3582
      1adb      3590
      1ae5      3599
      1aef      3608
      1b01      3617
      1b0f      3626
      1b21      3635
      1b2f      3644
      1b3a      3652
      1b44      3661
      1b56      3670
      1b68      3679
      1b77      3688
      1b81      3697
      1b93      3706
      1b9e      3714
      1bb0      3723
      1bc2      3732
      1bd4      3741
      1be6      3750
      1bf5      3758
      1c04      3766
      1c13      3773
      1c22      3780
      1c3e      3795
      1c57      3825
      1c90      3845
      1c9f      3848
      1cad      3858
      1cb4      3861
      1cbf      3871
      1cc6      3874
      1cd1      3884
      1cd8      3887
      1db7         0
      1e2a       420
      1e6b       595
      1eac       771
      1ef0       943
      1f2e      1319
      1fdb      2049
      20ad      2405
      2129      3325
      21d5      1533

Safepoints (stack slots = 154, entries = 1, byte size = 34)
0x177442cbc571    2b1  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 58)
0x177442cbc56d  internal wasm call
0x177442cbc67e  internal wasm call
0x177442cbc772  internal wasm call
0x177442cbc872  internal wasm call
0x177442cbc973  internal wasm call
0x177442cbcc63  external reference (0x193f2f0)
0x177442cbdf0d  internal wasm call
0x177442cbdf33  internal wasm call
0x177442cbe078  wasm stub call  (0x177442be44d0)
0x177442cbe0fb  wasm stub call  (0x177442be44d0)
0x177442cbe13c  wasm stub call  (0x177442be44d0)
0x177442cbe17d  wasm stub call  (0x177442be44d0)
0x177442cbe1c1  wasm stub call  (0x177442be44d0)
0x177442cbe1f3  wasm stub call  (0x177442be44d0)
0x177442cbe2dc  wasm stub call  (0x177442be44d0)
0x177442cbe39f  wasm stub call  (0x177442be44d0)
0x177442cbe41d  wasm stub call  (0x177442be44d0)
0x177442cbe496  wasm stub call  (0x177442be4210)
