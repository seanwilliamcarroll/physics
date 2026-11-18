name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 10560 = 10532 + 28 padding)
Instructions (size = 10500)
0x1863c40f3c80     0  55                   push rbp
0x1863c40f3c81     1  4889e5               REX.W movq rbp,rsp
0x1863c40f3c84     4  6a08                 push 0x8
0x1863c40f3c86     6  56                   push rsi
0x1863c40f3c87     7  4881ec20040000       REX.W subq rsp,0x420
0x1863c40f3c8e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x1863c40f3c92    12  488945d8             REX.W movq [rbp-0x28],rax
0x1863c40f3c96    16  4c895dc8             REX.W movq [rbp-0x38],r11
0x1863c40f3c9a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f3c9e    1e  0f86bb240000         jna 0x1863c40f615f  <+0x24df>
0x1863c40f3ca4    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x1863c40f3ca8    28  458b3c24             movl r15,[r12]
0x1863c40f3cac    2c  418d9f00feffff       leal rbx,[r15-0x200]
0x1863c40f3cb3    33  41891c24             movl [r12],rbx
0x1863c40f3cb7    37  448bf8               movl r15,rax
0x1863c40f3cba    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x1863c40f3cc1    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x1863c40f3cc7    47  c5fa16d0             vmovshdup xmm2,xmm0
0x1863c40f3ccb    4b  41ba0000803a         movl r10,0x3a800000
0x1863c40f3cd1    51  c4c1796eda           vmovd xmm3,r10
0x1863c40f3cd6    56  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x1863c40f3cda    5a  c5f828c8             vmovaps xmm1,xmm0
0x1863c40f3cde    5e  c5e259d9             vmulss xmm3,xmm3,xmm1
0x1863c40f3ce2    62  c4817a10ac3ba0000000 vmovss xmm5,[r11+r15*1+0xa0]
0x1863c40f3cec    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x1863c40f3cf0    70  48895de0             REX.W movq [rbp-0x20],rbx
0x1863c40f3cf4    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x1863c40f3cfb    7b  c5fb115580           vmovsd [rbp-0x80],xmm2
0x1863c40f3d00    80  c5fb114d88           vmovsd [rbp-0x78],xmm1
0x1863c40f3d05    85  c5fb116dd0           vmovsd [rbp-0x30],xmm5
0x1863c40f3d0a    8a  c5f82eed             vucomiss xmm5,xmm5
0x1863c40f3d0e    8e  7a06                 jpe 0x1863c40f3d16  <+0x96>
0x1863c40f3d10    90  0f8409000000         jz 0x1863c40f3d1f  <+0x9f>
0x1863c40f3d16    96  c5f928f3             vmovapd xmm6,xmm3
0x1863c40f3d1a    9a  e904000000           jmp 0x1863c40f3d23  <+0xa3>
0x1863c40f3d1f    9f  c5f928f5             vmovapd xmm6,xmm5
0x1863c40f3d23    a3  c5f82edb             vucomiss xmm3,xmm3
0x1863c40f3d27    a7  7a06                 jpe 0x1863c40f3d2f  <+0xaf>
0x1863c40f3d29    a9  0f8404000000         jz 0x1863c40f3d33  <+0xb3>
0x1863c40f3d2f    af  c5f928de             vmovapd xmm3,xmm6
0x1863c40f3d33    b3  c5f82ef3             vucomiss xmm6,xmm3
0x1863c40f3d37    b7  0f8704000000         ja 0x1863c40f3d41  <+0xc1>
0x1863c40f3d3d    bd  c5f928f3             vmovapd xmm6,xmm3
0x1863c40f3d41    c1  c5f82ef6             vucomiss xmm6,xmm6
0x1863c40f3d45    c5  7a06                 jpe 0x1863c40f3d4d  <+0xcd>
0x1863c40f3d47    c7  0f8409000000         jz 0x1863c40f3d56  <+0xd6>
0x1863c40f3d4d    cd  c5f928dc             vmovapd xmm3,xmm4
0x1863c40f3d51    d1  e904000000           jmp 0x1863c40f3d5a  <+0xda>
0x1863c40f3d56    d6  c5f928de             vmovapd xmm3,xmm6
0x1863c40f3d5a    da  c5f82ee4             vucomiss xmm4,xmm4
0x1863c40f3d5e    de  7a06                 jpe 0x1863c40f3d66  <+0xe6>
0x1863c40f3d60    e0  0f8404000000         jz 0x1863c40f3d6a  <+0xea>
0x1863c40f3d66    e6  c5f928e3             vmovapd xmm4,xmm3
0x1863c40f3d6a    ea  c5f82edc             vucomiss xmm3,xmm4
0x1863c40f3d6e    ee  0f8704000000         ja 0x1863c40f3d78  <+0xf8>
0x1863c40f3d74    f4  c5f928dc             vmovapd xmm3,xmm4
0x1863c40f3d78    f8  41ba0020803f         movl r10,0x3f802000
0x1863c40f3d7e    fe  c4c1796ee2           vmovd xmm4,r10
0x1863c40f3d83   103  c5da59db             vmulss xmm3,xmm4,xmm3
0x1863c40f3d87   107  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x1863c40f3d8b   10b  c5d972f419           vpslld xmm4,xmm4,25
0x1863c40f3d90   110  c5d972d402           vpsrld xmm4,xmm4,2
0x1863c40f3d95   115  c5da5edb             vdivss xmm3,xmm4,xmm3
0x1863c40f3d99   119  c5f828db             vmovaps xmm3,xmm3
0x1863c40f3d9d   11d  c4817a119c3b84000000 vmovss [r11+r15*1+0x84],xmm3
0x1863c40f3da7   127  c4e27918f3           vbroadcastss xmm6,xmm3
0x1863c40f3dac   12c  c5f859c6             vmulps xmm0,xmm0,xmm6
0x1863c40f3db0   130  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x1863c40f3db6   136  c5f828f0             vmovaps xmm6,xmm0
0x1863c40f3dba   13a  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x1863c40f3dbe   13e  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x1863c40f3dc4   144  c4417b2cf0           vcvttsd2si r14,xmm8
0x1863c40f3dc9   149  4585f6               testl r14,r14
0x1863c40f3dcc   14c  0f892b000000         jns 0x1863c40f3dfd  <+0x17d>
0x1863c40f3dd2   152  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x1863c40f3ddc   15c  c441f96efa           vmovq xmm15,r10
0x1863c40f3de1   161  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x1863c40f3de6   166  c4417b2cf7           vcvttsd2si r14,xmm15
0x1863c40f3deb   16b  4585f6               testl r14,r14
0x1863c40f3dee   16e  0f8809000000         js 0x1863c40f3dfd  <+0x17d>
0x1863c40f3df4   174  41ba00000080         movl r10,0x80000000
0x1863c40f3dfa   17a  450bf2               orl r14,r10
0x1863c40f3dfd   17d  458bd6               movl r10,r14
0x1863c40f3e00   180  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x1863c40f3e05   185  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f3e0d   18d  c441792ec8           vucomisd xmm9,xmm8
0x1863c40f3e12   192  0f8a5c230000         jpe 0x1863c40f6174  <+0x24f4>
0x1863c40f3e18   198  0f8556230000         jnz 0x1863c40f6174  <+0x24f4>
0x1863c40f3e1e   19e  c4c1796ef6           vmovd xmm6,r14
0x1863c40f3e23   1a3  c5f970f600           vpshufd xmm6,xmm6,0x0
0x1863c40f3e28   1a8  c5fa16f8             vmovshdup xmm7,xmm0
0x1863c40f3e2c   1ac  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x1863c40f3e30   1b0  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x1863c40f3e36   1b6  c4417b2cf1           vcvttsd2si r14,xmm9
0x1863c40f3e3b   1bb  4585f6               testl r14,r14
0x1863c40f3e3e   1be  0f8928000000         jns 0x1863c40f3e6c  <+0x1ec>
0x1863c40f3e44   1c4  4c8b1589ffffff       REX.W movq r10,[rip+0xffffff89]
0x1863c40f3e4b   1cb  c441f96efa           vmovq xmm15,r10
0x1863c40f3e50   1d0  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x1863c40f3e55   1d5  c4417b2cf7           vcvttsd2si r14,xmm15
0x1863c40f3e5a   1da  4585f6               testl r14,r14
0x1863c40f3e5d   1dd  0f8809000000         js 0x1863c40f3e6c  <+0x1ec>
0x1863c40f3e63   1e3  41ba00000080         movl r10,0x80000000
0x1863c40f3e69   1e9  450bf2               orl r14,r10
0x1863c40f3e6c   1ec  458bd6               movl r10,r14
0x1863c40f3e6f   1ef  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x1863c40f3e74   1f4  c441792ed1           vucomisd xmm10,xmm9
0x1863c40f3e79   1f9  0f8a2a230000         jpe 0x1863c40f61a9  <+0x2529>
0x1863c40f3e7f   1ff  0f8524230000         jnz 0x1863c40f61a9  <+0x2529>
0x1863c40f3e85   205  c4c34922f601         vpinsrd xmm6,xmm6,r14,0x1
0x1863c40f3e8b   20b  49ba0100000001000000 REX.W movq r10,0x100000001
0x1863c40f3e95   215  c4c1f96efa           vmovq xmm7,r10
0x1863c40f3e9a   21a  c5c16cff             vpunpcklqdq xmm7,xmm7,xmm7
0x1863c40f3e9e   21e  c4e2493ff7           vpmaxud xmm6,xmm6,xmm7
0x1863c40f3ea3   223  c44139efc0           vpxor xmm8,xmm8,xmm8
0x1863c40f3ea8   228  c538c2c802           vcmpps xmm9,xmm8,xmm0, (le)
0x1863c40f3ead   22d  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x1863c40f3eb7   237  c441f96ed2           vmovq xmm10,r10
0x1863c40f3ebc   23c  c441296cd2           vpunpcklqdq xmm10,xmm10,xmm10
0x1863c40f3ec1   241  c4c178c2c201         vcmpps xmm0,xmm0,xmm10, (lt)
0x1863c40f3ec7   247  c5b1dbc0             vpand xmm0,xmm9,xmm0
0x1863c40f3ecb   24b  c579dfff             vpandn xmm15,xmm0,xmm7
0x1863c40f3ecf   24f  c5c9dbc0             vpand xmm0,xmm6,xmm0
0x1863c40f3ed3   253  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x1863c40f3ed8   258  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x1863c40f3edf   25f  c4817813043e         vmovlps [r14+r15*1],xmm0
0x1863c40f3ee5   265  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x1863c40f3eed   26d  4589741b38           movl [r11+rbx*1+0x38],r14
0x1863c40f3ef2   272  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x1863c40f3efa   27a  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x1863c40f3eff   27f  448d7060             leal r14,[rax+0x60]
0x1863c40f3f03   283  438b543b04           movl rdx,[r11+r15*1+0x4]
0x1863c40f3f08   288  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x1863c40f3f0d   28d  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x1863c40f3f12   292  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x1863c40f3f17   297  c5f811bd80feffff     vmovups [rbp-0x180],xmm7
0x1863c40f3f1f   29f  c578118540fcffff     vmovups [rbp-0x3c0],xmm8
0x1863c40f3f27   2a7  418bc6               movl rax,r14
0x1863c40f3f2a   2aa  8bdf                 movl rbx,rdi
0x1863c40f3f2c   2ac  e8c75df2ff           call 0x1863c4019cf8  (jump table)
0x1863c40f3f31   2b1  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f3f35   2b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f3f3c   2bc  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x1863c40f3f45   2c5  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f3f49   2c9  418d97a0000000       leal rdx,[r15+0xa0]
0x1863c40f3f50   2d0  478b74237c           movl r14,[r11+r12*1+0x7c]
0x1863c40f3f55   2d5  438b842380000000     movl rax,[r11+r12*1+0x80]
0x1863c40f3f5d   2dd  418d0486             leal rax,[r14+rax*4]
0x1863c40f3f61   2e1  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x1863c40f3f66   2e6  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x1863c40f3f6b   2eb  418d7730             leal rsi,[r15+0x30]
0x1863c40f3f6f   2ef  48895590             REX.W movq [rbp-0x70],rdx
0x1863c40f3f73   2f3  4c897598             REX.W movq [rbp-0x68],r14
0x1863c40f3f77   2f7  48898578ffffff       REX.W movq [rbp-0x88],rax
0x1863c40f3f7e   2fe  48895dc0             REX.W movq [rbp-0x40],rbx
0x1863c40f3f82   302  48894db8             REX.W movq [rbp-0x48],rcx
0x1863c40f3f86   306  488975b0             REX.W movq [rbp-0x50],rsi
0x1863c40f3f8a   30a  458bc6               movl r8,r14
0x1863c40f3f8d   30d  33ff                 xorl rdi,rdi
0x1863c40f3f8f   30f  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f3f97   317  660f1f840000000000   nop
0x1863c40f3fa0   320  660f1f840000000000   nop
0x1863c40f3fa9   329  660f1f840000000000   nop
0x1863c40f3fb2   332  660f1f840000000000   nop
0x1863c40f3fbb   33b  0f1f440000           nop
0x1863c40f3fc0   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f3fc4   344  0f8608220000         jna 0x1863c40f61d2  <+0x2552>
0x1863c40f3fca   34a  443b8578ffffff       cmpl r8,[rbp-0x88]
0x1863c40f3fd1   351  0f8422000000         jz 0x1863c40f3ff9  <+0x379>
0x1863c40f3fd7   357  478b0c03             movl r9,[r11+r8*1]
0x1863c40f3fdb   35b  4183c004             addl r8,0x4
0x1863c40f3fdf   35f  413bd9               cmpl rbx,r9
0x1863c40f3fe2   362  76dc                 jna 0x1863c40f3fc0  <+0x340>
0x1863c40f3fe4   364  468d0c89             leal r9,[rcx+r9*4]
0x1863c40f3fe8   368  c4817a101c0b         vmovss xmm3,[r11+r9*1]
0x1863c40f3fee   36e  41b901000000         movl r9,0x1
0x1863c40f3ff4   374  e90a000000           jmp 0x1863c40f4003  <+0x383>
0x1863c40f3ff9   379  4533c9               xorl r9,r9
0x1863c40f3ffc   37c  448b8578ffffff       movl r8,[rbp-0x88]
0x1863c40f4003   383  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f400b   38b  4c8945a8             REX.W movq [rbp-0x58],r8
0x1863c40f400f   38f  4183f901             cmpl r9,0x1
0x1863c40f4013   393  0f856f000000         jnz 0x1863c40f4088  <+0x408>
0x1863c40f4019   399  478b4c2330           movl r9,[r11+r12*1+0x30]
0x1863c40f401e   39e  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x1863c40f4023   3a3  0f8540000000         jnz 0x1863c40f4069  <+0x3e9>
0x1863c40f4029   3a9  b901000000           movl rcx,0x1
0x1863c40f402e   3ae  48897da0             REX.W movq [rbp-0x60],rdi
0x1863c40f4032   3b2  8bc6                 movl rax,rsi
0x1863c40f4034   3b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f4038   3b8  8bd7                 movl rdx,rdi
0x1863c40f403a   3ba  4c8bc9               REX.W movq r9,rcx
0x1863c40f403d   3bd  e8be5cf2ff           call 0x1863c4019d00  (jump table)
0x1863c40f4042   3c2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f4046   3c6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f404d   3cd  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f4051   3d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f4059   3d9  448b45a8             movl r8,[rbp-0x58]
0x1863c40f405d   3dd  8b7da0               movl rdi,[rbp-0x60]
0x1863c40f4060   3e0  8b75b0               movl rsi,[rbp-0x50]
0x1863c40f4063   3e3  8b4db8               movl rcx,[rbp-0x48]
0x1863c40f4066   3e6  8b5dc0               movl rbx,[rbp-0x40]
0x1863c40f4069   3e9  448d7701             leal r14,[rdi+0x1]
0x1863c40f406d   3ed  4789742338           movl [r11+r12*1+0x38],r14
0x1863c40f4072   3f2  438b442334           movl rax,[r11+r12*1+0x34]
0x1863c40f4077   3f7  8d04b8               leal rax,[rax+rdi*4]
0x1863c40f407a   3fa  c4c17a111c03         vmovss [r11+rax*1],xmm3
0x1863c40f4080   400  418bfe               movl rdi,r14
0x1863c40f4083   403  e938ffffff           jmp 0x1863c40f3fc0  <+0x340>
0x1863c40f4088   408  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x1863c40f4091   411  478b742314           movl r14,[r11+r12*1+0x14]
0x1863c40f4096   416  438b442310           movl rax,[r11+r12*1+0x10]
0x1863c40f409b   41b  418d5f3c             leal rbx,[r15+0x3c]
0x1863c40f409f   41f  4c8975b0             REX.W movq [rbp-0x50],r14
0x1863c40f40a3   423  488945a8             REX.W movq [rbp-0x58],rax
0x1863c40f40a7   427  48895da0             REX.W movq [rbp-0x60],rbx
0x1863c40f40ab   42b  8b4d98               movl rcx,[rbp-0x68]
0x1863c40f40ae   42e  33d2                 xorl rdx,rdx
0x1863c40f40b0   430  660f1f840000000000   nop
0x1863c40f40b9   439  0f1f8000000000       nop
0x1863c40f40c0   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f40c4   444  0f8649210000         jna 0x1863c40f6213  <+0x2593>
0x1863c40f40ca   44a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x1863c40f40d0   450  0f841f000000         jz 0x1863c40f40f5  <+0x475>
0x1863c40f40d6   456  418b340b             movl rsi,[r11+rcx*1]
0x1863c40f40da   45a  83c104               addl rcx,0x4
0x1863c40f40dd   45d  443bf6               cmpl r14,rsi
0x1863c40f40e0   460  76de                 jna 0x1863c40f40c0  <+0x440>
0x1863c40f40e2   462  8d34b0               leal rsi,[rax+rsi*4]
0x1863c40f40e5   465  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x1863c40f40eb   46b  be01000000           movl rsi,0x1
0x1863c40f40f0   470  e908000000           jmp 0x1863c40f40fd  <+0x47d>
0x1863c40f40f5   475  33f6                 xorl rsi,rsi
0x1863c40f40f7   477  8b8d78ffffff         movl rcx,[rbp-0x88]
0x1863c40f40fd   47d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f4105   485  48894db8             REX.W movq [rbp-0x48],rcx
0x1863c40f4109   489  83fe01               cmpl rsi,0x1
0x1863c40f410c   48c  0f8568000000         jnz 0x1863c40f417a  <+0x4fa>
0x1863c40f4112   492  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x1863c40f4117   497  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x1863c40f411c   49c  0f853b000000         jnz 0x1863c40f415d  <+0x4dd>
0x1863c40f4122   4a2  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f4126   4a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f412a   4aa  8bc3                 movl rax,rbx
0x1863c40f412c   4ac  b901000000           movl rcx,0x1
0x1863c40f4131   4b1  e8ca5bf2ff           call 0x1863c4019d00  (jump table)
0x1863c40f4136   4b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f413a   4ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f4141   4c1  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f4145   4c5  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f414d   4cd  8b4db8               movl rcx,[rbp-0x48]
0x1863c40f4150   4d0  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f4153   4d3  8b5da0               movl rbx,[rbp-0x60]
0x1863c40f4156   4d6  8b45a8               movl rax,[rbp-0x58]
0x1863c40f4159   4d9  448b75b0             movl r14,[rbp-0x50]
0x1863c40f415d   4dd  8d7201               leal rsi,[rdx+0x1]
0x1863c40f4160   4e0  4389742344           movl [r11+r12*1+0x44],rsi
0x1863c40f4165   4e5  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x1863c40f416a   4ea  8d1497               leal rdx,[rdi+rdx*4]
0x1863c40f416d   4ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x1863c40f4173   4f3  8bd6                 movl rdx,rsi
0x1863c40f4175   4f5  e946ffffff           jmp 0x1863c40f40c0  <+0x440>
0x1863c40f417a   4fa  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x1863c40f4183   503  478b742320           movl r14,[r11+r12*1+0x20]
0x1863c40f4188   508  438b44231c           movl rax,[r11+r12*1+0x1c]
0x1863c40f418d   50d  418d5f48             leal rbx,[r15+0x48]
0x1863c40f4191   511  4c8975a0             REX.W movq [rbp-0x60],r14
0x1863c40f4195   515  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x1863c40f419c   51c  48895db8             REX.W movq [rbp-0x48],rbx
0x1863c40f41a0   520  8b4d98               movl rcx,[rbp-0x68]
0x1863c40f41a3   523  33d2                 xorl rdx,rdx
0x1863c40f41a5   525  660f1f840000000000   nop
0x1863c40f41ae   52e  660f1f840000000000   nop
0x1863c40f41b7   537  660f1f840000000000   nop
0x1863c40f41c0   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f41c4   544  0f868a200000         jna 0x1863c40f6254  <+0x25d4>
0x1863c40f41ca   54a  3b8d78ffffff         cmpl rcx,[rbp-0x88]
0x1863c40f41d0   550  0f841f000000         jz 0x1863c40f41f5  <+0x575>
0x1863c40f41d6   556  418b340b             movl rsi,[r11+rcx*1]
0x1863c40f41da   55a  83c104               addl rcx,0x4
0x1863c40f41dd   55d  443bf6               cmpl r14,rsi
0x1863c40f41e0   560  76de                 jna 0x1863c40f41c0  <+0x540>
0x1863c40f41e2   562  8d34b0               leal rsi,[rax+rsi*4]
0x1863c40f41e5   565  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x1863c40f41eb   56b  be01000000           movl rsi,0x1
0x1863c40f41f0   570  e908000000           jmp 0x1863c40f41fd  <+0x57d>
0x1863c40f41f5   575  33f6                 xorl rsi,rsi
0x1863c40f41f7   577  8b8d78ffffff         movl rcx,[rbp-0x88]
0x1863c40f41fd   57d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f4205   585  48894da8             REX.W movq [rbp-0x58],rcx
0x1863c40f4209   589  83fe01               cmpl rsi,0x1
0x1863c40f420c   58c  0f856b000000         jnz 0x1863c40f427d  <+0x5fd>
0x1863c40f4212   592  438b742348           movl rsi,[r11+r12*1+0x48]
0x1863c40f4217   597  4339542348           cmpl [r11+r12*1+0x48],rdx
0x1863c40f421c   59c  0f853e000000         jnz 0x1863c40f4260  <+0x5e0>
0x1863c40f4222   5a2  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f4226   5a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f422a   5aa  8bc3                 movl rax,rbx
0x1863c40f422c   5ac  b901000000           movl rcx,0x1
0x1863c40f4231   5b1  e8ca5af2ff           call 0x1863c4019d00  (jump table)
0x1863c40f4236   5b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f423a   5ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f4241   5c1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f4249   5c9  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f424d   5cd  8b4da8               movl rcx,[rbp-0x58]
0x1863c40f4250   5d0  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f4253   5d3  8b5db8               movl rbx,[rbp-0x48]
0x1863c40f4256   5d6  8b8560ffffff         movl rax,[rbp-0xa0]
0x1863c40f425c   5dc  448b75a0             movl r14,[rbp-0x60]
0x1863c40f4260   5e0  8d7201               leal rsi,[rdx+0x1]
0x1863c40f4263   5e3  4389742350           movl [r11+r12*1+0x50],rsi
0x1863c40f4268   5e8  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x1863c40f426d   5ed  8d1497               leal rdx,[rdi+rdx*4]
0x1863c40f4270   5f0  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x1863c40f4276   5f6  8bd6                 movl rdx,rsi
0x1863c40f4278   5f8  e943ffffff           jmp 0x1863c40f41c0  <+0x540>
0x1863c40f427d   5fd  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x1863c40f4286   606  478b74232c           movl r14,[r11+r12*1+0x2c]
0x1863c40f428b   60b  438b442328           movl rax,[r11+r12*1+0x28]
0x1863c40f4290   610  4183c754             addl r15,0x54
0x1863c40f4294   614  4c8975b0             REX.W movq [rbp-0x50],r14
0x1863c40f4298   618  488945b8             REX.W movq [rbp-0x48],rax
0x1863c40f429c   61c  4c897dd8             REX.W movq [rbp-0x28],r15
0x1863c40f42a0   620  33d2                 xorl rdx,rdx
0x1863c40f42a2   622  8b5d98               movl rbx,[rbp-0x68]
0x1863c40f42a5   625  660f1f840000000000   nop
0x1863c40f42ae   62e  660f1f840000000000   nop
0x1863c40f42b7   637  660f1f840000000000   nop
0x1863c40f42c0   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f42c4   644  0f86ce1f0000         jna 0x1863c40f6298  <+0x2618>
0x1863c40f42ca   64a  3b9d78ffffff         cmpl rbx,[rbp-0x88]
0x1863c40f42d0   650  0f841f000000         jz 0x1863c40f42f5  <+0x675>
0x1863c40f42d6   656  418b0c1b             movl rcx,[r11+rbx*1]
0x1863c40f42da   65a  83c304               addl rbx,0x4
0x1863c40f42dd   65d  443bf1               cmpl r14,rcx
0x1863c40f42e0   660  76de                 jna 0x1863c40f42c0  <+0x640>
0x1863c40f42e2   662  8d0c88               leal rcx,[rax+rcx*4]
0x1863c40f42e5   665  c4c17a101c0b         vmovss xmm3,[r11+rcx*1]
0x1863c40f42eb   66b  b901000000           movl rcx,0x1
0x1863c40f42f0   670  e908000000           jmp 0x1863c40f42fd  <+0x67d>
0x1863c40f42f5   675  33c9                 xorl rcx,rcx
0x1863c40f42f7   677  8b9d78ffffff         movl rbx,[rbp-0x88]
0x1863c40f42fd   67d  48895d98             REX.W movq [rbp-0x68],rbx
0x1863c40f4301   681  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f4309   689  83f901               cmpl rcx,0x1
0x1863c40f430c   68c  0f8566000000         jnz 0x1863c40f4378  <+0x6f8>
0x1863c40f4312   692  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x1863c40f4317   697  4339542354           cmpl [r11+r12*1+0x54],rdx
0x1863c40f431c   69c  0f8539000000         jnz 0x1863c40f435b  <+0x6db>
0x1863c40f4322   6a2  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f4326   6a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f432a   6aa  418bc7               movl rax,r15
0x1863c40f432d   6ad  b901000000           movl rcx,0x1
0x1863c40f4332   6b2  e8c959f2ff           call 0x1863c4019d00  (jump table)
0x1863c40f4337   6b7  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f433b   6bb  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f4342   6c2  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f4345   6c5  8b5d98               movl rbx,[rbp-0x68]
0x1863c40f4348   6c8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f4350   6d0  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f4354   6d4  8b45b8               movl rax,[rbp-0x48]
0x1863c40f4357   6d7  448b75b0             movl r14,[rbp-0x50]
0x1863c40f435b   6db  8d4a01               leal rcx,[rdx+0x1]
0x1863c40f435e   6de  43894c235c           movl [r11+r12*1+0x5c],rcx
0x1863c40f4363   6e3  438b742358           movl rsi,[r11+r12*1+0x58]
0x1863c40f4368   6e8  8d1496               leal rdx,[rsi+rdx*4]
0x1863c40f436b   6eb  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x1863c40f4371   6f1  8bd1                 movl rdx,rcx
0x1863c40f4373   6f3  e948ffffff           jmp 0x1863c40f42c0  <+0x640>
0x1863c40f4378   6f8  478b7c2338           movl r15,[r11+r12*1+0x38]
0x1863c40f437d   6fd  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x1863c40f4384   704  c4817a6f1c23         vmovdqu xmm3,[r11+r12*1]
0x1863c40f438a   70a  c4817a7f5c2330       vmovdqu [r11+r12*1+0x30],xmm3
0x1863c40f4391   711  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x1863c40f4397   717  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x1863c40f439e   71e  c4817a6f642310       vmovdqu xmm4,[r11+r12*1+0x10]
0x1863c40f43a5   725  c4817a7f642340       vmovdqu [r11+r12*1+0x40],xmm4
0x1863c40f43ac   72c  478b742310           movl r14,[r11+r12*1+0x10]
0x1863c40f43b1   731  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x1863c40f43b8   738  4b8b442354           REX.W movq rax,[r11+r12*1+0x54]
0x1863c40f43bd   73d  438b5c2350           movl rbx,[r11+r12*1+0x50]
0x1863c40f43c2   742  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x1863c40f43c9   749  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x1863c40f43d0   750  438954232c           movl [r11+r12*1+0x2c],rdx
0x1863c40f43d5   755  438b542320           movl rdx,[r11+r12*1+0x20]
0x1863c40f43da   75a  43895c2320           movl [r11+r12*1+0x20],rbx
0x1863c40f43df   75f  4b89442324           REX.W movq [r11+r12*1+0x24],rax
0x1863c40f43e4   764  4c897dd8             REX.W movq [rbp-0x28],r15
0x1863c40f43e8   768  4c8975b0             REX.W movq [rbp-0x50],r14
0x1863c40f43ec   76c  4585ff               testl r15,r15
0x1863c40f43ef   76f  0f8516000000         jnz 0x1863c40f440b  <+0x78b>
0x1863c40f43f5   775  8b5de0               movl rbx,[rbp-0x20]
0x1863c40f43f8   778  448d9b00020000       leal r11,[rbx+0x200]
0x1863c40f43ff   77f  488b45e8             REX.W movq rax,[rbp-0x18]
0x1863c40f4403   783  448918               movl [rax],r11
0x1863c40f4406   786  488be5               REX.W movq rsp,rbp
0x1863c40f4409   789  5d                   pop rbp
0x1863c40f440a   78a  c3                   retl
0x1863c40f440b   78b  c4e37916c002         vpextrd rax,xmm0,0x2
0x1863c40f4411   791  c4e37916e303         vpextrd rbx,xmm4,0x3
0x1863c40f4417   797  c4e37916d901         vpextrd rcx,xmm3,0x1
0x1863c40f441d   79d  c4e37916c603         vpextrd rsi,xmm0,0x3
0x1863c40f4423   7a3  c4e37916e701         vpextrd rdi,xmm4,0x1
0x1863c40f4429   7a9  c4c37916d802         vpextrd r8,xmm3,0x2
0x1863c40f442f   7af  458bc8               movl r9,r8
0x1863c40f4432   7b2  413bf8               cmpl rdi,r8
0x1863c40f4435   7b5  440f42cf             cmovcl r9,rdi
0x1863c40f4439   7b9  418bf9               movl rdi,r9
0x1863c40f443c   7bc  413bd1               cmpl rdx,r9
0x1863c40f443f   7bf  0f42fa               cmovcl rdi,rdx
0x1863c40f4442   7c2  8bd7                 movl rdx,rdi
0x1863c40f4444   7c4  3bf7                 cmpl rsi,rdi
0x1863c40f4446   7c6  0f42d6               cmovcl rdx,rsi
0x1863c40f4449   7c9  c4817a108423a4000000 vmovss xmm0,[r11+r12*1+0xa4]
0x1863c40f4453   7d3  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x1863c40f4457   7d7  c4e27918d8           vbroadcastss xmm3,xmm0
0x1863c40f445c   7dc  c5fb1065d0           vmovsd xmm4,[rbp-0x30]
0x1863c40f4461   7e1  c5da59e4             vmulss xmm4,xmm4,xmm4
0x1863c40f4465   7e5  c4e27918ec           vbroadcastss xmm5,xmm4
0x1863c40f446a   7ea  488945c0             REX.W movq [rbp-0x40],rax
0x1863c40f446e   7ee  48895db8             REX.W movq [rbp-0x48],rbx
0x1863c40f4472   7f2  48894da8             REX.W movq [rbp-0x58],rcx
0x1863c40f4476   7f6  488955a0             REX.W movq [rbp-0x60],rdx
0x1863c40f447a   7fa  c5fb118508ffffff     vmovsd [rbp-0xf8],xmm0
0x1863c40f4482   802  c5f8119d60feffff     vmovups [rbp-0x1a0],xmm3
0x1863c40f448a   80a  c5fb11a510ffffff     vmovsd [rbp-0xf0],xmm4
0x1863c40f4492   812  c5f811ad70feffff     vmovups [rbp-0x190],xmm5
0x1863c40f449a   81a  33ff                 xorl rdi,rdi
0x1863c40f449c   81c  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x1863c40f44a1   821  c4c13972f019         vpslld xmm8,xmm8,25
0x1863c40f44a7   827  c4c13972d002         vpsrld xmm8,xmm8,2
0x1863c40f44ad   82d  c5c857f6             vxorps xmm6,xmm6,xmm6
0x1863c40f44b1   831  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x1863c40f44b9   839  488bf7               REX.W movq rsi,rdi
0x1863c40f44bc   83c  0f1f4000             nop
0x1863c40f44c0   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f44c4   844  0f860c1e0000         jna 0x1863c40f62d6  <+0x2656>
0x1863c40f44ca   84a  478b442308           movl r8,[r11+r12*1+0x8]
0x1863c40f44cf   84f  4c8985d0fdffff       REX.W movq [rbp-0x230],r8
0x1863c40f44d6   856  443bc6               cmpl r8,rsi
0x1863c40f44d9   859  0f86581c0000         jna 0x1863c40f6137  <+0x24b7>
0x1863c40f44df   85f  478b4c2314           movl r9,[r11+r12*1+0x14]
0x1863c40f44e4   864  4c898d80fcffff       REX.W movq [rbp-0x380],r9
0x1863c40f44eb   86b  443bce               cmpl r9,rsi
0x1863c40f44ee   86e  0f86431c0000         jna 0x1863c40f6137  <+0x24b7>
0x1863c40f44f4   874  478b7c2320           movl r15,[r11+r12*1+0x20]
0x1863c40f44f9   879  4c89bd78fcffff       REX.W movq [rbp-0x388],r15
0x1863c40f4500   880  443bfe               cmpl r15,rsi
0x1863c40f4503   883  0f862e1c0000         jna 0x1863c40f6137  <+0x24b7>
0x1863c40f4509   889  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x1863c40f450e   88e  4c89bd88fcffff       REX.W movq [rbp-0x378],r15
0x1863c40f4515   895  443bfe               cmpl r15,rsi
0x1863c40f4518   898  0f86191c0000         jna 0x1863c40f6137  <+0x24b7>
0x1863c40f451e   89e  478b7c2304           movl r15,[r11+r12*1+0x4]
0x1863c40f4523   8a3  458d34b7             leal r14,[r15+rsi*4]
0x1863c40f4527   8a7  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x1863c40f452d   8ad  478b742310           movl r14,[r11+r12*1+0x10]
0x1863c40f4532   8b2  4c89bd90feffff       REX.W movq [rbp-0x170],r15
0x1863c40f4539   8b9  458d3cb6             leal r15,[r14+rsi*4]
0x1863c40f453d   8bd  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x1863c40f4543   8c3  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x1863c40f4548   8c8  4c89b5f0fdffff       REX.W movq [rbp-0x210],r14
0x1863c40f454f   8cf  458d34b7             leal r14,[r15+rsi*4]
0x1863c40f4553   8d3  c4017a101c33         vmovss xmm11,[r11+r14*1]
0x1863c40f4559   8d9  478b742328           movl r14,[r11+r12*1+0x28]
0x1863c40f455e   8de  4c89bde0fdffff       REX.W movq [rbp-0x220],r15
0x1863c40f4565   8e5  458d3cb6             leal r15,[r14+rsi*4]
0x1863c40f4569   8e9  4c89b5e8fdffff       REX.W movq [rbp-0x218],r14
0x1863c40f4570   8f0  c4017a10243b         vmovss xmm12,[r11+r15*1]
0x1863c40f4576   8f6  448b75e0             movl r14,[rbp-0x20]
0x1863c40f457a   8fa  c4017a1164330c       vmovss [r11+r14*1+0xc],xmm12
0x1863c40f4581   901  c4017a115c3308       vmovss [r11+r14*1+0x8],xmm11
0x1863c40f4588   908  c4017a11543304       vmovss [r11+r14*1+0x4],xmm10
0x1863c40f458f   90f  c4017a110c33         vmovss [r11+r14*1],xmm9
0x1863c40f4595   915  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x1863c40f459e   91e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x1863c40f45a7   927  c44121efdb           vpxor xmm11,xmm11,xmm11
0x1863c40f45ac   92c  c4017a7f5c3310       vmovdqu [r11+r14*1+0x10],xmm11
0x1863c40f45b3   933  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x1863c40f45bb   93b  4c89bd50fcffff       REX.W movq [rbp-0x3b0],r15
0x1863c40f45c2   942  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x1863c40f45ca   94a  c4017a109c2384000000 vmovss xmm11,[r11+r12*1+0x84]
0x1863c40f45d4   954  458d5e40             leal r11,[r14+0x40]
0x1863c40f45d8   958  4989e2               REX.W movq r10,rsp
0x1863c40f45db   95b  4883ec08             REX.W subq rsp,0x8
0x1863c40f45df   95f  4883e4f0             REX.W andq rsp,0xf0
0x1863c40f45e3   963  4c891424             REX.W movq [rsp],r10
0x1863c40f45e7   967  488975d0             REX.W movq [rbp-0x30],rsi
0x1863c40f45eb   96b  c57b118df8feffff     vmovsd [rbp-0x108],xmm9
0x1863c40f45f3   973  c57b119500ffffff     vmovsd [rbp-0x100],xmm10
0x1863c40f45fb   97b  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x1863c40f4602   982  c57b119d78ffffff     vmovsd [rbp-0x88],xmm11
0x1863c40f460a   98a  4c895d98             REX.W movq [rbp-0x68],r11
0x1863c40f460e   98e  488bf7               REX.W movq rsi,rdi
0x1863c40f4611   991  488bcf               REX.W movq rcx,rdi
0x1863c40f4614   994  488b7df0             REX.W movq rdi,[rbp-0x10]
0x1863c40f4618   998  418bd3               movl rdx,r11
0x1863c40f461b   99b  41b8c0010000         movl r8,0x1c0
0x1863c40f4621   9a1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x1863c40f462b   9ab  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x1863c40f4632   9b2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x1863c40f4639   9b9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x1863c40f4640   9c0  ffd0                 call rax
0x1863c40f4642   9c2  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x1863c40f464d   9cd  488b2424             REX.W movq rsp,[rsp]
0x1863c40f4651   9d1  85c0                 testl rax,rax
0x1863c40f4653   9d3  0f84221f0000         jz 0x1863c40f657b  <+0x28fb>
0x1863c40f4659   9d9  4533db               xorl r11,r11
0x1863c40f465c   9dc  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x1863c40f4663   9e3  410f95c3             setnzl r11l
0x1863c40f4667   9e7  448ba568ffffff       movl r12,[rbp-0x98]
0x1863c40f466e   9ee  452be3               subl r12,r11
0x1863c40f4671   9f1  c5fb108500ffffff     vmovsd xmm0,[rbp-0x100]
0x1863c40f4679   9f9  c5fa599d78ffffff     vmulss xmm3,xmm0,[rbp-0x88]
0x1863c40f4681   a01  c5f82edb             vucomiss xmm3,xmm3
0x1863c40f4685   a05  7a06                 jpe 0x1863c40f468d  <+0xa0d>
0x1863c40f4687   a07  0f8404000000         jz 0x1863c40f4691  <+0xa11>
0x1863c40f468d   a0d  c5e057db             vxorps xmm3,xmm3,xmm3
0x1863c40f4691   a11  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1863c40f4695   a15  c5f82edc             vucomiss xmm3,xmm4
0x1863c40f4699   a19  0f8704000000         ja 0x1863c40f46a3  <+0xa23>
0x1863c40f469f   a1f  c5f928dc             vmovapd xmm3,xmm4
0x1863c40f46a3   a23  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x1863c40f46a7   a27  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x1863c40f46ad   a2d  c57b2cde             vcvttsd2si r11,xmm6
0x1863c40f46b1   a31  4585db               testl r11,r11
0x1863c40f46b4   a34  0f8927000000         jns 0x1863c40f46e1  <+0xa61>
0x1863c40f46ba   a3a  4c8b1513f7ffff       REX.W movq r10,[rip+0xfffff713]
0x1863c40f46c1   a41  c441f96efa           vmovq xmm15,r10
0x1863c40f46c6   a46  c50358fe             vaddsd xmm15,xmm15,xmm6
0x1863c40f46ca   a4a  c4417b2cdf           vcvttsd2si r11,xmm15
0x1863c40f46cf   a4f  4585db               testl r11,r11
0x1863c40f46d2   a52  0f8809000000         js 0x1863c40f46e1  <+0xa61>
0x1863c40f46d8   a58  41ba00000080         movl r10,0x80000000
0x1863c40f46de   a5e  450bda               orl r11,r10
0x1863c40f46e1   a61  458bd3               movl r10,r11
0x1863c40f46e4   a64  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x1863c40f46e9   a69  c5f92efe             vucomisd xmm7,xmm6
0x1863c40f46ed   a6d  0f8a4a1c0000         jpe 0x1863c40f633d  <+0x26bd>
0x1863c40f46f3   a73  0f85441c0000         jnz 0x1863c40f633d  <+0x26bd>
0x1863c40f46f9   a79  458bfb               movl r15,r11
0x1863c40f46fc   a7c  453be3               cmpl r12,r11
0x1863c40f46ff   a7f  450f42fc             cmovcl r15,r12
0x1863c40f4703   a83  41ba0000804f         movl r10,0x4f800000
0x1863c40f4709   a89  c4c1796eea           vmovd xmm5,r10
0x1863c40f470e   a8e  4533db               xorl r11,r11
0x1863c40f4711   a91  c5f82eeb             vucomiss xmm5,xmm3
0x1863c40f4715   a95  450f47df             cmoval r11,r15
0x1863c40f4719   a99  4533ff               xorl r15,r15
0x1863c40f471c   a9c  4585db               testl r11,r11
0x1863c40f471f   a9f  410f95c7             setnzl r15l
0x1863c40f4723   aa3  458bf3               movl r14,r11
0x1863c40f4726   aa6  452bf7               subl r14,r15
0x1863c40f4729   aa9  4183c301             addl r11,0x1
0x1863c40f472d   aad  458bfb               movl r15,r11
0x1863c40f4730   ab0  453be3               cmpl r12,r11
0x1863c40f4733   ab3  450f42fc             cmovcl r15,r12
0x1863c40f4737   ab7  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x1863c40f473e   abe  453bfe               cmpl r15,r14
0x1863c40f4741   ac1  0f8292180000         jc 0x1863c40f5fd9  <+0x2359>
0x1863c40f4747   ac7  4533db               xorl r11,r11
0x1863c40f474a   aca  83bd50fcffff00       cmpl [rbp-0x3b0],0x0
0x1863c40f4751   ad1  410f95c3             setnzl r11l
0x1863c40f4755   ad5  448ba550fcffff       movl r12,[rbp-0x3b0]
0x1863c40f475c   adc  452be3               subl r12,r11
0x1863c40f475f   adf  c5fb109d78ffffff     vmovsd xmm3,[rbp-0x88]
0x1863c40f4767   ae7  c5e2599df8feffff     vmulss xmm3,xmm3,[rbp-0x108]
0x1863c40f476f   aef  c5f82edb             vucomiss xmm3,xmm3
0x1863c40f4773   af3  7a06                 jpe 0x1863c40f477b  <+0xafb>
0x1863c40f4775   af5  0f8404000000         jz 0x1863c40f477f  <+0xaff>
0x1863c40f477b   afb  c5f928dc             vmovapd xmm3,xmm4
0x1863c40f477f   aff  c5f82edc             vucomiss xmm3,xmm4
0x1863c40f4783   b03  0f8704000000         ja 0x1863c40f478d  <+0xb0d>
0x1863c40f4789   b09  c5f928dc             vmovapd xmm3,xmm4
0x1863c40f478d   b0d  c5e25af3             vcvtss2sd xmm6,xmm3,xmm3
0x1863c40f4791   b11  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x1863c40f4797   b17  c57b2cdf             vcvttsd2si r11,xmm7
0x1863c40f479b   b1b  4585db               testl r11,r11
0x1863c40f479e   b1e  0f8927000000         jns 0x1863c40f47cb  <+0xb4b>
0x1863c40f47a4   b24  4c8b1529f6ffff       REX.W movq r10,[rip+0xfffff629]
0x1863c40f47ab   b2b  c441f96efa           vmovq xmm15,r10
0x1863c40f47b0   b30  c50358ff             vaddsd xmm15,xmm15,xmm7
0x1863c40f47b4   b34  c4417b2cdf           vcvttsd2si r11,xmm15
0x1863c40f47b9   b39  4585db               testl r11,r11
0x1863c40f47bc   b3c  0f8809000000         js 0x1863c40f47cb  <+0xb4b>
0x1863c40f47c2   b42  41ba00000080         movl r10,0x80000000
0x1863c40f47c8   b48  450bda               orl r11,r10
0x1863c40f47cb   b4b  458bd3               movl r10,r11
0x1863c40f47ce   b4e  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x1863c40f47d3   b53  c5792ec7             vucomisd xmm8,xmm7
0x1863c40f47d7   b57  0f8a831b0000         jpe 0x1863c40f6360  <+0x26e0>
0x1863c40f47dd   b5d  0f857d1b0000         jnz 0x1863c40f6360  <+0x26e0>
0x1863c40f47e3   b63  418bc3               movl rax,r11
0x1863c40f47e6   b66  453be3               cmpl r12,r11
0x1863c40f47e9   b69  410f42c4             cmovcl rax,r12
0x1863c40f47ed   b6d  4533db               xorl r11,r11
0x1863c40f47f0   b70  c5f82eeb             vucomiss xmm5,xmm3
0x1863c40f47f4   b74  440f47d8             cmoval r11,rax
0x1863c40f47f8   b78  33c0                 xorl rax,rax
0x1863c40f47fa   b7a  4585db               testl r11,r11
0x1863c40f47fd   b7d  0f95c0               setnzl al
0x1863c40f4800   b80  418bdb               movl rbx,r11
0x1863c40f4803   b83  2bd8                 subl rbx,rax
0x1863c40f4805   b85  8b9578fcffff         movl rdx,[rbp-0x388]
0x1863c40f480b   b8b  8b8588fcffff         movl rax,[rbp-0x378]
0x1863c40f4811   b91  3b9588fcffff         cmpl rdx,[rbp-0x378]
0x1863c40f4817   b97  0f42c2               cmovcl rax,rdx
0x1863c40f481a   b9a  8bb580fcffff         movl rsi,[rbp-0x380]
0x1863c40f4820   ba0  8bc8                 movl rcx,rax
0x1863c40f4822   ba2  3bf0                 cmpl rsi,rax
0x1863c40f4824   ba4  0f42ce               cmovcl rcx,rsi
0x1863c40f4827   ba7  4183c301             addl r11,0x1
0x1863c40f482b   bab  418bc3               movl rax,r11
0x1863c40f482e   bae  453be3               cmpl r12,r11
0x1863c40f4831   bb1  410f42c4             cmovcl rax,r12
0x1863c40f4835   bb5  448d5801             leal r11,[rax+0x1]
0x1863c40f4839   bb9  c5fb109df8feffff     vmovsd xmm3,[rbp-0x108]
0x1863c40f4841   bc1  c4e27918eb           vbroadcastss xmm5,xmm3
0x1863c40f4846   bc6  c4e27918f0           vbroadcastss xmm6,xmm0
0x1863c40f484b   bcb  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x1863c40f4852   bd2  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x1863c40f4856   bd6  418b7c0464           movl rdi,[r12+rax*1+0x64]
0x1863c40f485b   bdb  458b440468           movl r8,[r12+rax*1+0x68]
0x1863c40f4860   be0  448b4de0             movl r9,[rbp-0x20]
0x1863c40f4864   be4  c4817a6fbc0c70010000 vmovdqu xmm7,[r12+r9*1+0x170]
0x1863c40f486e   bee  c4017a6f840c30010000 vmovdqu xmm8,[r12+r9*1+0x130]
0x1863c40f4878   bf8  c4017a6f8c0cf0000000 vmovdqu xmm9,[r12+r9*1+0xf0]
0x1863c40f4882   c02  c4017a6f940cb0000000 vmovdqu xmm10,[r12+r9*1+0xb0]
0x1863c40f488c   c0c  c4017a6f5c0c70       vmovdqu xmm11,[r12+r9*1+0x70]
0x1863c40f4893   c13  c4017a6fa40cf0010000 vmovdqu xmm12,[r12+r9*1+0x1f0]
0x1863c40f489d   c1d  c4017a6fac0cb0010000 vmovdqu xmm13,[r12+r9*1+0x1b0]
0x1863c40f48a7   c27  c4017a6fb40c60010000 vmovdqu xmm14,[r12+r9*1+0x160]
0x1863c40f48b1   c31  c4817a6f8c0c20010000 vmovdqu xmm1,[r12+r9*1+0x120]
0x1863c40f48bb   c3b  c4817a6f940ce0000000 vmovdqu xmm2,[r12+r9*1+0xe0]
0x1863c40f48c5   c45  c4817a6f840ca0000000 vmovdqu xmm0,[r12+r9*1+0xa0]
0x1863c40f48cf   c4f  c4817a6f5c0c60       vmovdqu xmm3,[r12+r9*1+0x60]
0x1863c40f48d6   c56  c5f811ad50feffff     vmovups [rbp-0x1b0],xmm5
0x1863c40f48de   c5e  c4817a6fac0ce0010000 vmovdqu xmm5,[r12+r9*1+0x1e0]
0x1863c40f48e8   c68  c5f811b520feffff     vmovups [rbp-0x1e0],xmm6
0x1863c40f48f0   c70  c4817a6fb40ca0010000 vmovdqu xmm6,[r12+r9*1+0x1a0]
0x1863c40f48fa   c7a  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x1863c40f4902   c82  c4817a6f840c50010000 vmovdqu xmm0,[r12+r9*1+0x150]
0x1863c40f490c   c8c  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x1863c40f4914   c94  c4817a6f840c10010000 vmovdqu xmm0,[r12+r9*1+0x110]
0x1863c40f491e   c9e  c5f81185b0feffff     vmovups [rbp-0x150],xmm0
0x1863c40f4926   ca6  c4817a6f840cd0000000 vmovdqu xmm0,[r12+r9*1+0xd0]
0x1863c40f4930   cb0  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x1863c40f4938   cb8  c4817a6f840c90000000 vmovdqu xmm0,[r12+r9*1+0x90]
0x1863c40f4942   cc2  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x1863c40f494a   cca  c4817a6f440c50       vmovdqu xmm0,[r12+r9*1+0x50]
0x1863c40f4951   cd1  c5f81185a0fcffff     vmovups [rbp-0x360],xmm0
0x1863c40f4959   cd9  c4817a6f840cd0010000 vmovdqu xmm0,[r12+r9*1+0x1d0]
0x1863c40f4963   ce3  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x1863c40f496b   ceb  c4817a6f840c90010000 vmovdqu xmm0,[r12+r9*1+0x190]
0x1863c40f4975   cf5  c5f81185d0fbffff     vmovups [rbp-0x430],xmm0
0x1863c40f497d   cfd  c4817a6f840c40010000 vmovdqu xmm0,[r12+r9*1+0x140]
0x1863c40f4987   d07  c5f81185e0fbffff     vmovups [rbp-0x420],xmm0
0x1863c40f498f   d0f  c4817a6f840c00010000 vmovdqu xmm0,[r12+r9*1+0x100]
0x1863c40f4999   d19  c5f81185f0fbffff     vmovups [rbp-0x410],xmm0
0x1863c40f49a1   d21  c4817a6f840cc0000000 vmovdqu xmm0,[r12+r9*1+0xc0]
0x1863c40f49ab   d2b  c5f8118500fcffff     vmovups [rbp-0x400],xmm0
0x1863c40f49b3   d33  c4817a6f840c80000000 vmovdqu xmm0,[r12+r9*1+0x80]
0x1863c40f49bd   d3d  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x1863c40f49c5   d45  c4817a6f440c40       vmovdqu xmm0,[r12+r9*1+0x40]
0x1863c40f49cc   d4c  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x1863c40f49d4   d54  c4817a6f840cc0010000 vmovdqu xmm0,[r12+r9*1+0x1c0]
0x1863c40f49de   d5e  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x1863c40f49e6   d66  c4817a6f840c80010000 vmovdqu xmm0,[r12+r9*1+0x180]
0x1863c40f49f0   d70  48899d58fcffff       REX.W movq [rbp-0x3a8],rbx
0x1863c40f49f7   d77  48898dd8fdffff       REX.W movq [rbp-0x228],rcx
0x1863c40f49fe   d7e  4c899d60fcffff       REX.W movq [rbp-0x3a0],r11
0x1863c40f4a05   d85  4889bd70fcffff       REX.W movq [rbp-0x390],rdi
0x1863c40f4a0c   d8c  4c898568fcffff       REX.W movq [rbp-0x398],r8
0x1863c40f4a13   d93  c57810bd40fcffff     vmovups xmm15,[rbp-0x3c0]
0x1863c40f4a1b   d9b  c57811bd50ffffff     vmovups [rbp-0xb0],xmm15
0x1863c40f4a23   da3  c5fb11a568ffffff     vmovsd [rbp-0x98],xmm4
0x1863c40f4a2b   dab  c5fb11a560ffffff     vmovsd [rbp-0xa0],xmm4
0x1863c40f4a33   db3  c5fb11a540ffffff     vmovsd [rbp-0xc0],xmm4
0x1863c40f4a3b   dbb  c5fb11a538ffffff     vmovsd [rbp-0xc8],xmm4
0x1863c40f4a43   dc3  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x1863c40f4a4b   dcb  c57928c8             vmovapd xmm9,xmm0
0x1863c40f4a4f   dcf  33c0                 xorl rax,rax
0x1863c40f4a51   dd1  8b8dd0fdffff         movl rcx,[rbp-0x230]
0x1863c40f4a57   dd7  c5fb11a530ffffff     vmovsd [rbp-0xd0],xmm4
0x1863c40f4a5f   ddf  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x1863c40f4a67   de7  c578118500fdffff     vmovups [rbp-0x300],xmm8
0x1863c40f4a6f   def  c578119520fdffff     vmovups [rbp-0x2e0],xmm10
0x1863c40f4a77   df7  c5f811b5b0fdffff     vmovups [rbp-0x250],xmm6
0x1863c40f4a7f   dff  c5f811ada0fdffff     vmovups [rbp-0x260],xmm5
0x1863c40f4a87   e07  c5f8119d90fdffff     vmovups [rbp-0x270],xmm3
0x1863c40f4a8f   e0f  c5f8119580fdffff     vmovups [rbp-0x280],xmm2
0x1863c40f4a97   e17  c5f8118d70fdffff     vmovups [rbp-0x290],xmm1
0x1863c40f4a9f   e1f  c57811b560fdffff     vmovups [rbp-0x2a0],xmm14
0x1863c40f4aa7   e27  c57811ad50fdffff     vmovups [rbp-0x2b0],xmm13
0x1863c40f4aaf   e2f  c57811a540fdffff     vmovups [rbp-0x2c0],xmm12
0x1863c40f4ab7   e37  c578119d30fdffff     vmovups [rbp-0x2d0],xmm11
0x1863c40f4abf   e3f  e98d000000           jmp 0x1863c40f4b51  <+0xed1>
0x1863c40f4ac4   e44  660f1f840000000000   nop
0x1863c40f4acd   e4d  660f1f840000000000   nop
0x1863c40f4ad6   e56  660f1f840000000000   nop
0x1863c40f4adf   e5f  660f1f840000000000   nop
0x1863c40f4ae8   e68  660f1f840000000000   nop
0x1863c40f4af1   e71  660f1f840000000000   nop
0x1863c40f4afa   e7a  660f1f440000         nop
0x1863c40f4b00   e80  8b9d58fcffff         movl rbx,[rbp-0x3a8]
0x1863c40f4b06   e86  458bf3               movl r14,r11
0x1863c40f4b09   e89  448b9d60fcffff       movl r11,[rbp-0x3a0]
0x1863c40f4b10   e90  448b8568fcffff       movl r8,[rbp-0x398]
0x1863c40f4b17   e97  8bbd70fcffff         movl rdi,[rbp-0x390]
0x1863c40f4b1d   e9d  8b9578fcffff         movl rdx,[rbp-0x388]
0x1863c40f4b23   ea3  c578108dc0fdffff     vmovups xmm9,[rbp-0x240]
0x1863c40f4b2b   eab  418bcf               movl rcx,r15
0x1863c40f4b2e   eae  4c8be6               REX.W movq r12,rsi
0x1863c40f4b31   eb1  c57811ad40fdffff     vmovups [rbp-0x2c0],xmm13
0x1863c40f4b39   eb9  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x1863c40f4b41   ec1  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x1863c40f4b49   ec9  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x1863c40f4b51   ed1  c578109530fcffff     vmovups xmm10,[rbp-0x3d0]
0x1863c40f4b59   ed9  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x1863c40f4b61   ee1  c57810a510fcffff     vmovups xmm12,[rbp-0x3f0]
0x1863c40f4b69   ee9  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x1863c40f4b71   ef1  c57810b5f0fbffff     vmovups xmm14,[rbp-0x410]
0x1863c40f4b79   ef9  c5f8108de0fbffff     vmovups xmm1,[rbp-0x420]
0x1863c40f4b81   f01  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x1863c40f4b89   f09  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x1863c40f4b91   f11  448bbd90feffff       movl r15,[rbp-0x170]
0x1863c40f4b98   f18  448b8de0fdffff       movl r9,[rbp-0x220]
0x1863c40f4b9f   f1f  4c89b578ffffff       REX.W movq [rbp-0x88],r14
0x1863c40f4ba6   f26  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f4baa   f2a  0f86d3170000         jna 0x1863c40f6383  <+0x2703>
0x1863c40f4bb0   f30  8bb550fcffff         movl rsi,[rbp-0x3b0]
0x1863c40f4bb6   f36  410faff6             imull rsi,r14
0x1863c40f4bba   f3a  448d3433             leal r14,[rbx+rsi*1]
0x1863c40f4bbe   f3e  453bc6               cmpl r8,r14
0x1863c40f4bc1   f41  0f8629000000         jna 0x1863c40f4bf0  <+0xf70>
0x1863c40f4bc7   f47  4103f3               addl rsi,r11
0x1863c40f4bca   f4a  443bc6               cmpl r8,rsi
0x1863c40f4bcd   f4d  0f861d000000         jna 0x1863c40f4bf0  <+0xf70>
0x1863c40f4bd3   f53  8d34b7               leal rsi,[rdi+rsi*4]
0x1863c40f4bd6   f56  418b3434             movl rsi,[r12+rsi*1]
0x1863c40f4bda   f5a  468d34b7             leal r14,[rdi+r14*4]
0x1863c40f4bde   f5e  478b3434             movl r14,[r12+r14*1]
0x1863c40f4be2   f62  458bd6               movl r10,r14
0x1863c40f4be5   f65  448bf6               movl r14,rsi
0x1863c40f4be8   f68  418bf2               movl rsi,r10
0x1863c40f4beb   f6b  e906000000           jmp 0x1863c40f4bf6  <+0xf76>
0x1863c40f4bf0   f70  4c8bf0               REX.W movq r14,rax
0x1863c40f4bf3   f73  488bf0               REX.W movq rsi,rax
0x1863c40f4bf6   f76  458d1cb7             leal r11,[r15+rsi*4]
0x1863c40f4bfa   f7a  418bde               movl rbx,r14
0x1863c40f4bfd   f7d  2bde                 subl rbx,rsi
0x1863c40f4bff   f7f  33ff                 xorl rdi,rdi
0x1863c40f4c01   f81  413bce               cmpl rcx,r14
0x1863c40f4c04   f84  400f92c7             setcl dil
0x1863c40f4c08   f88  4533c0               xorl r8,r8
0x1863c40f4c0b   f8b  443bf6               cmpl r14,rsi
0x1863c40f4c0e   f8e  410f92c0             setcl r8l
0x1863c40f4c12   f92  4c8bff               REX.W movq r15,rdi
0x1863c40f4c15   f95  450bf8               orl r15,r8
0x1863c40f4c18   f98  8bcb                 movl rcx,rbx
0x1863c40f4c1a   f9a  4585ff               testl r15,r15
0x1863c40f4c1d   f9d  0f45c8               cmovnzl rcx,rax
0x1863c40f4c20   fa0  4c89b5f8fdffff       REX.W movq [rbp-0x208],r14
0x1863c40f4c27   fa7  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x1863c40f4c2e   fae  4889bde8fcffff       REX.W movq [rbp-0x318],rdi
0x1863c40f4c35   fb5  4c8985a0feffff       REX.W movq [rbp-0x160],r8
0x1863c40f4c3c   fbc  48898de0feffff       REX.W movq [rbp-0x120],rcx
0x1863c40f4c43   fc3  443bf6               cmpl r14,rsi
0x1863c40f4c46   fc6  0f82b3000000         jc 0x1863c40f4cff  <+0x107f>
0x1863c40f4c4c   fcc  458d3cb1             leal r15,[r9+rsi*4]
0x1863c40f4c50   fd0  b904000000           movl rcx,0x4
0x1863c40f4c55   fd5  413bd6               cmpl rdx,r14
0x1863c40f4c58   fd8  440f42f9             cmovcl r15,rcx
0x1863c40f4c5c   fdc  448bcb               movl r9,rbx
0x1863c40f4c5f   fdf  413bd6               cmpl rdx,r14
0x1863c40f4c62   fe2  440f42c8             cmovcl r9,rax
0x1863c40f4c66   fe6  418bd1               movl rdx,r9
0x1863c40f4c69   fe9  81e2f0ffff1f         andl rdx,0x1ffffff0
0x1863c40f4c6f   fef  418d1497             leal rdx,[r15+rdx*4]
0x1863c40f4c73   ff3  448ba5f0fdffff       movl r12,[rbp-0x210]
0x1863c40f4c7a   ffa  458d1cb4             leal r11,[r12+rsi*4]
0x1863c40f4c7e   ffe  448ba580fcffff       movl r12,[rbp-0x380]
0x1863c40f4c85  1005  453be6               cmpl r12,r14
0x1863c40f4c88  1008  440f42d9             cmovcl r11,rcx
0x1863c40f4c8c  100c  8bfb                 movl rdi,rbx
0x1863c40f4c8e  100e  453be6               cmpl r12,r14
0x1863c40f4c91  1011  0f42f8               cmovcl rdi,rax
0x1863c40f4c94  1014  448be7               movl r12,rdi
0x1863c40f4c97  1017  4181e4f0ffff1f       andl r12,0x1ffffff0
0x1863c40f4c9e  101e  478d24a3             leal r12,[r11+r12*4]
0x1863c40f4ca2  1022  458bc1               movl r8,r9
0x1863c40f4ca5  1025  41c1e804             shrl r8, 4
0x1863c40f4ca9  1029  4183e10f             andl r9,0xf
0x1863c40f4cad  102d  4c899dd0fcffff       REX.W movq [rbp-0x330],r11
0x1863c40f4cb4  1034  448bdf               movl r11,rdi
0x1863c40f4cb7  1037  41c1eb04             shrl r11, 4
0x1863c40f4cbb  103b  83e70f               andl rdi,0xf
0x1863c40f4cbe  103e  4c899de0fcffff       REX.W movq [rbp-0x320],r11
0x1863c40f4cc5  1045  448b9d88fcffff       movl r11,[rbp-0x378]
0x1863c40f4ccc  104c  453bde               cmpl r11,r14
0x1863c40f4ccf  104f  0f821c000000         jc 0x1863c40f4cf1  <+0x1071>
0x1863c40f4cd5  1055  448b9de8fdffff       movl r11,[rbp-0x218]
0x1863c40f4cdc  105c  418d34b3             leal rsi,[r11+rsi*4]
0x1863c40f4ce0  1060  458bd7               movl r10,r15
0x1863c40f4ce3  1063  448bfb               movl r15,rbx
0x1863c40f4ce6  1066  418bda               movl rbx,r10
0x1863c40f4ce9  1069  448bde               movl r11,rsi
0x1863c40f4cec  106c  e939000000           jmp 0x1863c40f4d2a  <+0x10aa>
0x1863c40f4cf1  1071  418bdf               movl rbx,r15
0x1863c40f4cf4  1074  4c8bf8               REX.W movq r15,rax
0x1863c40f4cf7  1077  4c8bd9               REX.W movq r11,rcx
0x1863c40f4cfa  107a  e92b000000           jmp 0x1863c40f4d2a  <+0x10aa>
0x1863c40f4cff  107f  4c8bf8               REX.W movq r15,rax
0x1863c40f4d02  1082  b904000000           movl rcx,0x4
0x1863c40f4d07  1087  488bf8               REX.W movq rdi,rax
0x1863c40f4d0a  108a  488985e0fcffff       REX.W movq [rbp-0x320],rax
0x1863c40f4d11  1091  4c8bc8               REX.W movq r9,rax
0x1863c40f4d14  1094  4c8bc0               REX.W movq r8,rax
0x1863c40f4d17  1097  488bd1               REX.W movq rdx,rcx
0x1863c40f4d1a  109a  488bd9               REX.W movq rbx,rcx
0x1863c40f4d1d  109d  4c8bd9               REX.W movq r11,rcx
0x1863c40f4d20  10a0  4c8be1               REX.W movq r12,rcx
0x1863c40f4d23  10a3  48898dd0fcffff       REX.W movq [rbp-0x330],rcx
0x1863c40f4d2a  10aa  488bb5a0feffff       REX.W movq rsi,[rbp-0x160]
0x1863c40f4d31  10b1  0bb5e8fcffff         orl rsi,[rbp-0x318]
0x1863c40f4d37  10b7  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x1863c40f4d3e  10be  448ba518ffffff       movl r12,[rbp-0xe8]
0x1863c40f4d45  10c5  85f6                 testl rsi,rsi
0x1863c40f4d47  10c7  440f45e1             cmovnzl r12,rcx
0x1863c40f4d4b  10cb  8b8de0feffff         movl rcx,[rbp-0x120]
0x1863c40f4d51  10d1  83e10f               andl rcx,0xf
0x1863c40f4d54  10d4  418bf7               movl rsi,r15
0x1863c40f4d57  10d7  c1ee04               shrl rsi, 4
0x1863c40f4d5a  10da  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x1863c40f4d61  10e1  8b95e0feffff         movl rdx,[rbp-0x120]
0x1863c40f4d67  10e7  c1ea04               shrl rdx, 4
0x1863c40f4d6a  10ea  4c898da8feffff       REX.W movq [rbp-0x158],r9
0x1863c40f4d71  10f1  448b8de0fcffff       movl r9,[rbp-0x320]
0x1863c40f4d78  10f8  4c89bd20ffffff       REX.W movq [rbp-0xe0],r15
0x1863c40f4d7f  10ff  448bfa               movl r15,rdx
0x1863c40f4d82  1102  443bca               cmpl r9,rdx
0x1863c40f4d85  1105  450f42f9             cmovcl r15,r9
0x1863c40f4d89  1109  418bd7               movl rdx,r15
0x1863c40f4d8c  110c  453bc7               cmpl r8,r15
0x1863c40f4d8f  110f  410f42d0             cmovcl rdx,r8
0x1863c40f4d93  1113  448bfa               movl r15,rdx
0x1863c40f4d96  1116  3bf2                 cmpl rsi,rdx
0x1863c40f4d98  1118  440f42fe             cmovcl r15,rsi
0x1863c40f4d9c  111c  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x1863c40f4da3  1123  4889bd98feffff       REX.W movq [rbp-0x168],rdi
0x1863c40f4daa  112a  4c89a518ffffff       REX.W movq [rbp-0xe8],r12
0x1863c40f4db1  1131  4585ff               testl r15,r15
0x1863c40f4db4  1134  0f856b000000         jnz 0x1863c40f4e25  <+0x11a5>
0x1863c40f4dba  113a  c4c17928d9           vmovapd xmm3,xmm9
0x1863c40f4dbf  113f  c4c17928f2           vmovapd xmm6,xmm10
0x1863c40f4dc4  1144  c4c17928c3           vmovapd xmm0,xmm11
0x1863c40f4dc9  1149  c4417928cc           vmovapd xmm9,xmm12
0x1863c40f4dce  114e  c4417928d5           vmovapd xmm10,xmm13
0x1863c40f4dd3  1153  c4c17928e6           vmovapd xmm4,xmm14
0x1863c40f4dd8  1158  c5f928f9             vmovapd xmm7,xmm1
0x1863c40f4ddc  115c  c57928c2             vmovapd xmm8,xmm2
0x1863c40f4de0  1160  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x1863c40f4de8  1168  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x1863c40f4df0  1170  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x1863c40f4df8  1178  488b75c8             REX.W movq rsi,[rbp-0x38]
0x1863c40f4dfc  117c  448b4de0             movl r9,[rbp-0x20]
0x1863c40f4e00  1180  c57810ad40fdffff     vmovups xmm13,[rbp-0x2c0]
0x1863c40f4e08  1188  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x1863c40f4e10  1190  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x1863c40f4e18  1198  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x1863c40f4e20  11a0  e981060000           jmp 0x1863c40f54a6  <+0x1826>
0x1863c40f4e25  11a5  c578118dc0fdffff     vmovups [rbp-0x240],xmm9
0x1863c40f4e2d  11ad  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x1863c40f4e35  11b5  c578119d20fcffff     vmovups [rbp-0x3e0],xmm11
0x1863c40f4e3d  11bd  c57811a510fcffff     vmovups [rbp-0x3f0],xmm12
0x1863c40f4e45  11c5  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x1863c40f4e4d  11cd  c57811b5f0fbffff     vmovups [rbp-0x410],xmm14
0x1863c40f4e55  11d5  c5f8118de0fbffff     vmovups [rbp-0x420],xmm1
0x1863c40f4e5d  11dd  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x1863c40f4e65  11e5  448b85d0fcffff       movl r8,[rbp-0x330]
0x1863c40f4e6c  11ec  488b75c8             REX.W movq rsi,[rbp-0x38]
0x1863c40f4e70  11f0  448b4de0             movl r9,[rbp-0x20]
0x1863c40f4e74  11f4  488bd0               REX.W movq rdx,rax
0x1863c40f4e77  11f7  e962000000           jmp 0x1863c40f4ede  <+0x125e>
0x1863c40f4e7c  11fc  0f1f4000             nop
0x1863c40f4e80  1200  c5f811a530fdffff     vmovups [rbp-0x2d0],xmm4
0x1863c40f4e88  1208  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x1863c40f4e90  1210  448ba518ffffff       movl r12,[rbp-0xe8]
0x1863c40f4e97  1217  448b9d28ffffff       movl r11,[rbp-0xd8]
0x1863c40f4e9e  121e  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x1863c40f4ea6  1226  c57811a500fdffff     vmovups [rbp-0x300],xmm12
0x1863c40f4eae  122e  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x1863c40f4eb6  1236  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x1863c40f4ebe  123e  c5f8119d40fdffff     vmovups [rbp-0x2c0],xmm3
0x1863c40f4ec6  1246  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x1863c40f4ece  124e  c578119560fdffff     vmovups [rbp-0x2a0],xmm10
0x1863c40f4ed6  1256  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x1863c40f4ede  125e  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f4ee2  1262  0f866e150000         jna 0x1863c40f6456  <+0x27d6>
0x1863c40f4ee8  1268  8d3c1a               leal rdi,[rdx+rbx*1]
0x1863c40f4eeb  126b  c57a6f1c3e           vmovdqu xmm11,[rsi+rdi*1]
0x1863c40f4ef0  1270  428d041a             leal rax,[rdx+r11*1]
0x1863c40f4ef4  1274  c57a6f1406           vmovdqu xmm10,[rsi+rax*1]
0x1863c40f4ef9  1279  468d1c02             leal r11,[rdx+r8*1]
0x1863c40f4efd  127d  c4217a6f0c1e         vmovdqu xmm9,[rsi+r11*1]
0x1863c40f4f03  1283  c441585ce1           vsubps xmm12,xmm4,xmm9
0x1863c40f4f08  1288  468d3422             leal r14,[rdx+r12*1]
0x1863c40f4f0c  128c  c4217a6f2c36         vmovdqu xmm13,[rsi+r14*1]
0x1863c40f4f12  1292  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x1863c40f4f1a  129a  c4c1085ccd           vsubps xmm1,xmm14,xmm13
0x1863c40f4f1f  129f  c5f059d1             vmulps xmm2,xmm1,xmm1
0x1863c40f4f23  12a3  c4c11859c4           vmulps xmm0,xmm12,xmm12
0x1863c40f4f28  12a8  c5e858c0             vaddps xmm0,xmm2,xmm0
0x1863c40f4f2c  12ac  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x1863c40f4f34  12b4  c5f8c2da01           vcmpps xmm3,xmm0,xmm2, (lt)
0x1863c40f4f39  12b9  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x1863c40f4f41  12c1  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x1863c40f4f45  12c5  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x1863c40f4f49  12c9  c51859e3             vmulps xmm12,xmm12,xmm3
0x1863c40f4f4d  12cd  c5f810b530fcffff     vmovups xmm6,[rbp-0x3d0]
0x1863c40f4f55  12d5  c4c14858f4           vaddps xmm6,xmm6,xmm12
0x1863c40f4f5a  12da  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x1863c40f4f64  12e4  c5f059db             vmulps xmm3,xmm1,xmm3
0x1863c40f4f68  12e8  c57810a5c0fdffff     vmovups xmm12,[rbp-0x240]
0x1863c40f4f70  12f0  c59858db             vaddps xmm3,xmm12,xmm3
0x1863c40f4f74  12f4  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x1863c40f4f7e  12fe  c568c2e002           vcmpps xmm12,xmm2,xmm0, (le)
0x1863c40f4f83  1303  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x1863c40f4f8b  130b  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x1863c40f4f93  1313  c5f8c2d901           vcmpps xmm3,xmm0,xmm1, (lt)
0x1863c40f4f98  1318  c599dbdb             vpand xmm3,xmm12,xmm3
0x1863c40f4f9c  131c  c44119efe4           vpxor xmm12,xmm12,xmm12
0x1863c40f4fa1  1321  c598c2c001           vcmpps xmm0,xmm12,xmm0, (lt)
0x1863c40f4fa6  1326  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x1863c40f4faa  132a  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x1863c40f4fae  132e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x1863c40f4fb2  1332  c5f8109de0fbffff     vmovups xmm3,[rbp-0x420]
0x1863c40f4fba  133a  c5f858db             vaddps xmm3,xmm0,xmm3
0x1863c40f4fbe  133e  c4a17a7f9c0e40010000 vmovdqu [rsi+r9*1+0x140],xmm3
0x1863c40f4fc8  1348  c52859d0             vmulps xmm10,xmm10,xmm0
0x1863c40f4fcc  134c  c5f8119de0fbffff     vmovups [rbp-0x420],xmm3
0x1863c40f4fd4  1354  c5f8109df0fbffff     vmovups xmm3,[rbp-0x410]
0x1863c40f4fdc  135c  c5a858db             vaddps xmm3,xmm10,xmm3
0x1863c40f4fe0  1360  c4a17a7f9c0e00010000 vmovdqu [rsi+r9*1+0x100],xmm3
0x1863c40f4fea  136a  c52059d0             vmulps xmm10,xmm11,xmm0
0x1863c40f4fee  136e  c578109d00fcffff     vmovups xmm11,[rbp-0x400]
0x1863c40f4ff6  1376  c4412858d3           vaddps xmm10,xmm10,xmm11
0x1863c40f4ffb  137b  c4217a7f940ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm10
0x1863c40f5005  1385  c53059c8             vmulps xmm9,xmm9,xmm0
0x1863c40f5009  1389  c578109d10fcffff     vmovups xmm11,[rbp-0x3f0]
0x1863c40f5011  1391  c4413058cb           vaddps xmm9,xmm9,xmm11
0x1863c40f5016  1396  c4217a7f8c0e80000000 vmovdqu [rsi+r9*1+0x80],xmm9
0x1863c40f5020  13a0  c59059c0             vmulps xmm0,xmm13,xmm0
0x1863c40f5024  13a4  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x1863c40f502c  13ac  c5a058c0             vaddps xmm0,xmm11,xmm0
0x1863c40f5030  13b0  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x1863c40f5037  13b7  448d6710             leal r12,[rdi+0x10]
0x1863c40f503b  13bb  c4217a6f1c26         vmovdqu xmm11,[rsi+r12*1]
0x1863c40f5041  13c1  448d6010             leal r12,[rax+0x10]
0x1863c40f5045  13c5  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x1863c40f504b  13cb  458d6310             leal r12,[r11+0x10]
0x1863c40f504f  13cf  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x1863c40f5057  13d7  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x1863c40f505d  13dd  c5f8119df0fbffff     vmovups [rbp-0x410],xmm3
0x1863c40f5065  13e5  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x1863c40f5069  13e9  458d6610             leal r12,[r14+0x10]
0x1863c40f506d  13ed  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x1863c40f5075  13f5  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x1863c40f507b  13fb  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x1863c40f5083  1403  c5085cce             vsubps xmm9,xmm14,xmm6
0x1863c40f5087  1407  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x1863c40f508f  140f  c4413059d1           vmulps xmm10,xmm9,xmm9
0x1863c40f5094  1414  c5e059fb             vmulps xmm7,xmm3,xmm3
0x1863c40f5098  1418  c5a858ff             vaddps xmm7,xmm10,xmm7
0x1863c40f509c  141c  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x1863c40f50a1  1421  c529dbd5             vpand xmm10,xmm10,xmm5
0x1863c40f50a5  1425  c441785bd2           vcvtdq2ps xmm10,xmm10
0x1863c40f50aa  142a  c4c16059da           vmulps xmm3,xmm3,xmm10
0x1863c40f50af  142f  c578108590fcffff     vmovups xmm8,[rbp-0x370]
0x1863c40f50b7  1437  c5b858db             vaddps xmm3,xmm8,xmm3
0x1863c40f50bb  143b  c4a17a7f9c0ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm3
0x1863c40f50c5  1445  c4413059c2           vmulps xmm8,xmm9,xmm10
0x1863c40f50ca  144a  c578108dd0fbffff     vmovups xmm9,[rbp-0x430]
0x1863c40f50d2  1452  c4413058c0           vaddps xmm8,xmm9,xmm8
0x1863c40f50d7  1457  c4217a7f840e90010000 vmovdqu [rsi+r9*1+0x190],xmm8
0x1863c40f50e1  1461  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x1863c40f50e6  1466  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x1863c40f50eb  146b  c44131dbca           vpand xmm9,xmm9,xmm10
0x1863c40f50f0  1470  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x1863c40f50f5  1475  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x1863c40f50f9  1479  c5f85bff             vcvtdq2ps xmm7,xmm7
0x1863c40f50fd  147d  c5b1dbff             vpand xmm7,xmm9,xmm7
0x1863c40f5101  1481  c578108dc0feffff     vmovups xmm9,[rbp-0x140]
0x1863c40f5109  1489  c4414058c9           vaddps xmm9,xmm7,xmm9
0x1863c40f510e  148e  c4217a7f8c0e50010000 vmovdqu [rsi+r9*1+0x150],xmm9
0x1863c40f5118  1498  c51059d7             vmulps xmm10,xmm13,xmm7
0x1863c40f511c  149c  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x1863c40f5124  14a4  c4412858d5           vaddps xmm10,xmm10,xmm13
0x1863c40f5129  14a9  c4217a7f940e10010000 vmovdqu [rsi+r9*1+0x110],xmm10
0x1863c40f5133  14b3  c52059df             vmulps xmm11,xmm11,xmm7
0x1863c40f5137  14b7  c57810adc0fcffff     vmovups xmm13,[rbp-0x340]
0x1863c40f513f  14bf  c4412058dd           vaddps xmm11,xmm11,xmm13
0x1863c40f5144  14c4  c4217a7f9c0ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm11
0x1863c40f514e  14ce  c5f859c7             vmulps xmm0,xmm0,xmm7
0x1863c40f5152  14d2  c57810adb0fcffff     vmovups xmm13,[rbp-0x350]
0x1863c40f515a  14da  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x1863c40f515f  14df  c4a17a7f840e90000000 vmovdqu [rsi+r9*1+0x90],xmm0
0x1863c40f5169  14e9  c5c859f7             vmulps xmm6,xmm6,xmm7
0x1863c40f516d  14ed  c5f810bda0fcffff     vmovups xmm7,[rbp-0x360]
0x1863c40f5175  14f5  c5c058f6             vaddps xmm6,xmm7,xmm6
0x1863c40f5179  14f9  c4a17a7f740e50       vmovdqu [rsi+r9*1+0x50],xmm6
0x1863c40f5180  1500  448d6720             leal r12,[rdi+0x20]
0x1863c40f5184  1504  c4a17a6f3c26         vmovdqu xmm7,[rsi+r12*1]
0x1863c40f518a  150a  448d6020             leal r12,[rax+0x20]
0x1863c40f518e  150e  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x1863c40f5194  1514  458d6320             leal r12,[r11+0x20]
0x1863c40f5198  1518  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x1863c40f51a0  1520  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x1863c40f51a6  1526  c5f8119d90fcffff     vmovups [rbp-0x370],xmm3
0x1863c40f51ae  152e  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x1863c40f51b2  1532  458d6620             leal r12,[r14+0x20]
0x1863c40f51b6  1536  c5f811b5a0fcffff     vmovups [rbp-0x360],xmm6
0x1863c40f51be  153e  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x1863c40f51c4  1544  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x1863c40f51cc  154c  c5085cc6             vsubps xmm8,xmm14,xmm6
0x1863c40f51d0  1550  c578118dc0feffff     vmovups [rbp-0x140],xmm9
0x1863c40f51d8  1558  c4413859c8           vmulps xmm9,xmm8,xmm8
0x1863c40f51dd  155d  c5781195b0feffff     vmovups [rbp-0x150],xmm10
0x1863c40f51e5  1565  c56059d3             vmulps xmm10,xmm3,xmm3
0x1863c40f51e9  1569  c4413058ca           vaddps xmm9,xmm9,xmm10
0x1863c40f51ee  156e  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x1863c40f51f3  1573  c529dbd5             vpand xmm10,xmm10,xmm5
0x1863c40f51f7  1577  c441785bd2           vcvtdq2ps xmm10,xmm10
0x1863c40f51fc  157c  c4c16059da           vmulps xmm3,xmm3,xmm10
0x1863c40f5201  1581  c578119dc0fcffff     vmovups [rbp-0x340],xmm11
0x1863c40f5209  1589  c578109da0fdffff     vmovups xmm11,[rbp-0x260]
0x1863c40f5211  1591  c5a058db             vaddps xmm3,xmm11,xmm3
0x1863c40f5215  1595  c4a17a7f9c0ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm3
0x1863c40f521f  159f  c4413859c2           vmulps xmm8,xmm8,xmm10
0x1863c40f5224  15a4  c5781095b0fdffff     vmovups xmm10,[rbp-0x250]
0x1863c40f522c  15ac  c4412858c0           vaddps xmm8,xmm10,xmm8
0x1863c40f5231  15b1  c4217a7f840ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm8
0x1863c40f523b  15bb  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x1863c40f5241  15c1  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x1863c40f5246  15c6  c44129dbd3           vpand xmm10,xmm10,xmm11
0x1863c40f524b  15cb  c44118c2c901         vcmpps xmm9,xmm12,xmm9, (lt)
0x1863c40f5251  15d1  c531dbcd             vpand xmm9,xmm9,xmm5
0x1863c40f5255  15d5  c441785bc9           vcvtdq2ps xmm9,xmm9
0x1863c40f525a  15da  c44129dbc9           vpand xmm9,xmm10,xmm9
0x1863c40f525f  15df  c578109560fdffff     vmovups xmm10,[rbp-0x2a0]
0x1863c40f5267  15e7  c4413058d2           vaddps xmm10,xmm9,xmm10
0x1863c40f526c  15ec  c4217a7f940e60010000 vmovdqu [rsi+r9*1+0x160],xmm10
0x1863c40f5276  15f6  c4411059d9           vmulps xmm11,xmm13,xmm9
0x1863c40f527b  15fb  c57810ad70fdffff     vmovups xmm13,[rbp-0x290]
0x1863c40f5283  1603  c4412058dd           vaddps xmm11,xmm11,xmm13
0x1863c40f5288  1608  c4217a7f9c0e20010000 vmovdqu [rsi+r9*1+0x120],xmm11
0x1863c40f5292  1612  c4c14059f9           vmulps xmm7,xmm7,xmm9
0x1863c40f5297  1617  c57810ad80fdffff     vmovups xmm13,[rbp-0x280]
0x1863c40f529f  161f  c4c14058fd           vaddps xmm7,xmm7,xmm13
0x1863c40f52a4  1624  c4a17a7fbc0ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm7
0x1863c40f52ae  162e  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x1863c40f52b3  1633  c57810add0feffff     vmovups xmm13,[rbp-0x130]
0x1863c40f52bb  163b  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x1863c40f52c0  1640  c4a17a7f840ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm0
0x1863c40f52ca  164a  c4c14859f1           vmulps xmm6,xmm6,xmm9
0x1863c40f52cf  164f  c578108d90fdffff     vmovups xmm9,[rbp-0x270]
0x1863c40f52d7  1657  c5b058f6             vaddps xmm6,xmm9,xmm6
0x1863c40f52db  165b  c4a17a7f740e60       vmovdqu [rsi+r9*1+0x60],xmm6
0x1863c40f52e2  1662  448d6730             leal r12,[rdi+0x30]
0x1863c40f52e6  1666  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x1863c40f52ec  166c  448d6030             leal r12,[rax+0x30]
0x1863c40f52f0  1670  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x1863c40f52f6  1676  4183c330             addl r11,0x30
0x1863c40f52fa  167a  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x1863c40f5302  1682  c4a17a6f041e         vmovdqu xmm0,[rsi+r11*1]
0x1863c40f5308  1688  c5f8119da0fdffff     vmovups [rbp-0x260],xmm3
0x1863c40f5310  1690  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x1863c40f5314  1694  458d5e30             leal r11,[r14+0x30]
0x1863c40f5318  1698  c4a17a6f241e         vmovdqu xmm4,[rsi+r11*1]
0x1863c40f531e  169e  c5f811b590fdffff     vmovups [rbp-0x270],xmm6
0x1863c40f5326  16a6  c5885cf4             vsubps xmm6,xmm14,xmm4
0x1863c40f532a  16aa  c54859f6             vmulps xmm14,xmm6,xmm6
0x1863c40f532e  16ae  c5f811bd80fdffff     vmovups [rbp-0x280],xmm7
0x1863c40f5336  16b6  c5e059fb             vmulps xmm7,xmm3,xmm3
0x1863c40f533a  16ba  c58858ff             vaddps xmm7,xmm14,xmm7
0x1863c40f533e  16be  c540c2f201           vcmpps xmm14,xmm7,xmm2, (lt)
0x1863c40f5343  16c3  c509dbf5             vpand xmm14,xmm14,xmm5
0x1863c40f5347  16c7  c441785bf6           vcvtdq2ps xmm14,xmm14
0x1863c40f534c  16cc  c4c16059de           vmulps xmm3,xmm3,xmm14
0x1863c40f5351  16d1  c5781185b0fdffff     vmovups [rbp-0x250],xmm8
0x1863c40f5359  16d9  c578108540fdffff     vmovups xmm8,[rbp-0x2c0]
0x1863c40f5361  16e1  c5b858db             vaddps xmm3,xmm8,xmm3
0x1863c40f5365  16e5  c4a17a7f9c0ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm3
0x1863c40f536f  16ef  c4c14859f6           vmulps xmm6,xmm6,xmm14
0x1863c40f5374  16f4  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x1863c40f537c  16fc  c50858f6             vaddps xmm14,xmm14,xmm6
0x1863c40f5380  1700  c4217a7fb40eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm14
0x1863c40f538a  170a  c5e8c2f702           vcmpps xmm6,xmm2,xmm7, (le)
0x1863c40f538f  170f  c540c2c101           vcmpps xmm8,xmm7,xmm1, (lt)
0x1863c40f5394  1714  c4c149dbf0           vpand xmm6,xmm6,xmm8
0x1863c40f5399  1719  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x1863c40f539e  171e  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x1863c40f53a2  1722  c5f85bff             vcvtdq2ps xmm7,xmm7
0x1863c40f53a6  1726  c5c9dbf7             vpand xmm6,xmm6,xmm7
0x1863c40f53aa  172a  c5f810bdf0fcffff     vmovups xmm7,[rbp-0x310]
0x1863c40f53b2  1732  c5c858ff             vaddps xmm7,xmm6,xmm7
0x1863c40f53b6  1736  c4a17a7fbc0e70010000 vmovdqu [rsi+r9*1+0x170],xmm7
0x1863c40f53c0  1740  c51059c6             vmulps xmm8,xmm13,xmm6
0x1863c40f53c4  1744  c57810a500fdffff     vmovups xmm12,[rbp-0x300]
0x1863c40f53cc  174c  c4413858e4           vaddps xmm12,xmm8,xmm12
0x1863c40f53d1  1751  c4217a7fa40e30010000 vmovdqu [rsi+r9*1+0x130],xmm12
0x1863c40f53db  175b  c53059c6             vmulps xmm8,xmm9,xmm6
0x1863c40f53df  175f  c578108d10fdffff     vmovups xmm9,[rbp-0x2f0]
0x1863c40f53e7  1767  c4413858c9           vaddps xmm9,xmm8,xmm9
0x1863c40f53ec  176c  c4217a7f8c0ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm9
0x1863c40f53f6  1776  c5f859c6             vmulps xmm0,xmm0,xmm6
0x1863c40f53fa  177a  c578108520fdffff     vmovups xmm8,[rbp-0x2e0]
0x1863c40f5402  1782  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x1863c40f5407  1787  c4a17a7f840eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm0
0x1863c40f5411  1791  c5d859e6             vmulps xmm4,xmm4,xmm6
0x1863c40f5415  1795  c5f810b530fdffff     vmovups xmm6,[rbp-0x2d0]
0x1863c40f541d  179d  c5c858e4             vaddps xmm4,xmm6,xmm4
0x1863c40f5421  17a1  c4a17a7f640e70       vmovdqu [rsi+r9*1+0x70],xmm4
0x1863c40f5428  17a8  83c240               addl rdx,0x40
0x1863c40f542b  17ab  4183c7ff             addl r15,0xff
0x1863c40f542f  17af  0f854bfaffff         jnz 0x1863c40f4e80  <+0x1200>
0x1863c40f5435  17b5  c57928eb             vmovapd xmm13,xmm3
0x1863c40f5439  17b9  c5f8109dc0fdffff     vmovups xmm3,[rbp-0x240]
0x1863c40f5441  17c1  c5f810b530fcffff     vmovups xmm6,[rbp-0x3d0]
0x1863c40f5449  17c9  c5f8118520fdffff     vmovups [rbp-0x2e0],xmm0
0x1863c40f5451  17d1  c5f8108520fcffff     vmovups xmm0,[rbp-0x3e0]
0x1863c40f5459  17d9  c578118d10fdffff     vmovups [rbp-0x2f0],xmm9
0x1863c40f5461  17e1  c578108d10fcffff     vmovups xmm9,[rbp-0x3f0]
0x1863c40f5469  17e9  c57811a500fdffff     vmovups [rbp-0x300],xmm12
0x1863c40f5471  17f1  c4417928e2           vmovapd xmm12,xmm10
0x1863c40f5476  17f6  c578109500fcffff     vmovups xmm10,[rbp-0x400]
0x1863c40f547e  17fe  c5f811a530fdffff     vmovups [rbp-0x2d0],xmm4
0x1863c40f5486  1806  c5f810a5f0fbffff     vmovups xmm4,[rbp-0x410]
0x1863c40f548e  180e  c5f811bdf0fcffff     vmovups [rbp-0x310],xmm7
0x1863c40f5496  1816  c5f810bde0fbffff     vmovups xmm7,[rbp-0x420]
0x1863c40f549e  181e  c5781085d0fbffff     vmovups xmm8,[rbp-0x430]
0x1863c40f54a6  1826  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x1863c40f54ae  182e  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x1863c40f54b6  1836  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x1863c40f54be  183e  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x1863c40f54c6  1846  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x1863c40f54ce  184e  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x1863c40f54d6  1856  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x1863c40f54de  185e  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x1863c40f54e6  1866  c578119d70fdffff     vmovups [rbp-0x290],xmm11
0x1863c40f54ee  186e  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x1863c40f54f6  1876  c57811b550fdffff     vmovups [rbp-0x2b0],xmm14
0x1863c40f54fe  187e  c57811ad40fdffff     vmovups [rbp-0x2c0],xmm13
0x1863c40f5506  1886  85c9                 testl rcx,rcx
0x1863c40f5508  1888  0f850e000000         jnz 0x1863c40f551c  <+0x189c>
0x1863c40f550e  188e  448bbdd0fdffff       movl r15,[rbp-0x230]
0x1863c40f5515  1895  33c0                 xorl rax,rax
0x1863c40f5517  1897  e947080000           jmp 0x1863c40f5d63  <+0x20e3>
0x1863c40f551c  189c  448bb5f8fdffff       movl r14,[rbp-0x208]
0x1863c40f5523  18a3  458d5ef0             leal r11,[r14-0x10]
0x1863c40f5527  18a7  458be3               movl r12,r11
0x1863c40f552a  18aa  33c0                 xorl rax,rax
0x1863c40f552c  18ac  453bf3               cmpl r14,r11
0x1863c40f552f  18af  440f42e0             cmovcl r12,rax
0x1863c40f5533  18b3  458d5c2410           leal r11,[r12+0x10]
0x1863c40f5538  18b8  448bbdd0fdffff       movl r15,[rbp-0x230]
0x1863c40f553f  18bf  453bfb               cmpl r15,r11
0x1863c40f5542  18c2  0f821b080000         jc 0x1863c40f5d63  <+0x20e3>
0x1863c40f5548  18c8  8b9dd8fdffff         movl rbx,[rbp-0x228]
0x1863c40f554e  18ce  413bdb               cmpl rbx,r11
0x1863c40f5551  18d1  0f820c080000         jc 0x1863c40f5d63  <+0x20e3>
0x1863c40f5557  18d7  448b9de0fdffff       movl r11,[rbp-0x220]
0x1863c40f555e  18de  438d14a3             leal rdx,[r11+r12*4]
0x1863c40f5562  18e2  c57a6f3416           vmovdqu xmm14,[rsi+rdx*1]
0x1863c40f5567  18e7  8bbde8fdffff         movl rdi,[rbp-0x218]
0x1863c40f556d  18ed  468d04a7             leal r8,[rdi+r12*4]
0x1863c40f5571  18f1  c4217a6f2c06         vmovdqu xmm13,[rsi+r8*1]
0x1863c40f5577  18f7  8b85f0fdffff         movl rax,[rbp-0x210]
0x1863c40f557d  18fd  468d1ca0             leal r11,[rax+r12*4]
0x1863c40f5581  1901  c4217a6f1c1e         vmovdqu xmm11,[rsi+r11*1]
0x1863c40f5587  1907  c57810a520feffff     vmovups xmm12,[rbp-0x1e0]
0x1863c40f558f  190f  c441185cc3           vsubps xmm8,xmm12,xmm11
0x1863c40f5594  1914  4401e1               addl rcx,r12
0x1863c40f5597  1917  458bfe               movl r15,r14
0x1863c40f559a  191a  442bf9               subl r15,rcx
0x1863c40f559d  191d  c441796ee7           vmovd xmm12,r15
0x1863c40f55a2  1922  c4417970e400         vpshufd xmm12,xmm12,0x0
0x1863c40f55a8  1928  49ba0100000002000000 REX.W movq r10,0x200000001
0x1863c40f55b2  1932  c4c1f96ec2           vmovq xmm0,r10
0x1863c40f55b7  1937  49ba0300000004000000 REX.W movq r10,0x400000003
0x1863c40f55c1  1941  c4c3f922c201         vpinsrq xmm0,xmm0,r10,0x1
0x1863c40f55c7  1947  c4c2793fc4           vpmaxud xmm0,xmm0,xmm12
0x1863c40f55cc  194c  c4c17976c4           vpcmpeqd xmm0,xmm0,xmm12
0x1863c40f55d1  1951  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f55d6  1956  c4c179efc7           vpxor xmm0,xmm0,xmm15
0x1863c40f55db  195b  4529e6               subl r14,r12
0x1863c40f55de  195e  c57811a530feffff     vmovups [rbp-0x1d0],xmm12
0x1863c40f55e6  1966  c441796ee6           vmovd xmm12,r14
0x1863c40f55eb  196b  c4417970e400         vpshufd xmm12,xmm12,0x0
0x1863c40f55f1  1971  c57811a540feffff     vmovups [rbp-0x1c0],xmm12
0x1863c40f55f9  1979  c4411976e4           vpcmpeqd xmm12,xmm12,xmm12
0x1863c40f55fe  197e  c4c11973f43f         vpsllq xmm12,xmm12,63
0x1863c40f5604  1984  c4c11973d41f         vpsrlq xmm12,xmm12,31
0x1863c40f560a  198a  49ba0200000003000000 REX.W movq r10,0x300000002
0x1863c40f5614  1994  c4439922e201         vpinsrq xmm12,xmm12,r10,0x1
0x1863c40f561a  199a  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x1863c40f5622  19a2  c442313fcc           vpmaxud xmm9,xmm9,xmm12
0x1863c40f5627  19a7  c4413176cc           vpcmpeqd xmm9,xmm9,xmm12
0x1863c40f562c  19ac  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f5631  19b1  c44131efcf           vpxor xmm9,xmm9,xmm15
0x1863c40f5636  19b6  c4c179dbc1           vpand xmm0,xmm0,xmm9
0x1863c40f563b  19bb  448bbd90feffff       movl r15,[rbp-0x170]
0x1863c40f5642  19c2  478d24a7             leal r12,[r15+r12*4]
0x1863c40f5646  19c6  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x1863c40f564c  19cc  c578119d00feffff     vmovups [rbp-0x200],xmm11
0x1863c40f5654  19d4  c57810a550feffff     vmovups xmm12,[rbp-0x1b0]
0x1863c40f565c  19dc  c441185cd9           vsubps xmm11,xmm12,xmm9
0x1863c40f5661  19e1  c4412059e3           vmulps xmm12,xmm11,xmm11
0x1863c40f5666  19e6  c578118d10feffff     vmovups [rbp-0x1f0],xmm9
0x1863c40f566e  19ee  c4413859c8           vmulps xmm9,xmm8,xmm8
0x1863c40f5673  19f3  c4411858c9           vaddps xmm9,xmm12,xmm9
0x1863c40f5678  19f8  c530c2e201           vcmpps xmm12,xmm9,xmm2, (lt)
0x1863c40f567d  19fd  c519dbe5             vpand xmm12,xmm12,xmm5
0x1863c40f5681  1a01  c441785be4           vcvtdq2ps xmm12,xmm12
0x1863c40f5686  1a06  c44179dbe4           vpand xmm12,xmm0,xmm12
0x1863c40f568b  1a0b  c4413859c4           vmulps xmm8,xmm8,xmm12
0x1863c40f5690  1a10  c5b858f6             vaddps xmm6,xmm8,xmm6
0x1863c40f5694  1a14  c4a17a7fb40ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm6
0x1863c40f569e  1a1e  c4412059c4           vmulps xmm8,xmm11,xmm12
0x1863c40f56a3  1a23  c5b858db             vaddps xmm3,xmm8,xmm3
0x1863c40f56a7  1a27  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x1863c40f56b1  1a31  c44168c2c102         vcmpps xmm8,xmm2,xmm9, (le)
0x1863c40f56b7  1a37  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x1863c40f56bc  1a3c  c44139dbc3           vpand xmm8,xmm8,xmm11
0x1863c40f56c1  1a41  c4c179dbc0           vpand xmm0,xmm0,xmm8
0x1863c40f56c6  1a46  c5f972f01f           vpslld xmm0,xmm0,31
0x1863c40f56cb  1a4b  c5f972e01f           vpsrad xmm0,xmm0,31
0x1863c40f56d0  1a50  c44139efc0           vpxor xmm8,xmm8,xmm8
0x1863c40f56d5  1a55  c44138c2c901         vcmpps xmm9,xmm8,xmm9, (lt)
0x1863c40f56db  1a5b  c531dbcd             vpand xmm9,xmm9,xmm5
0x1863c40f56df  1a5f  c441785bc9           vcvtdq2ps xmm9,xmm9
0x1863c40f56e4  1a64  c4c179dbc1           vpand xmm0,xmm0,xmm9
0x1863c40f56e9  1a69  c5f858ff             vaddps xmm7,xmm0,xmm7
0x1863c40f56ed  1a6d  c4a17a7fbc0e40010000 vmovdqu [rsi+r9*1+0x140],xmm7
0x1863c40f56f7  1a77  c51059c8             vmulps xmm9,xmm13,xmm0
0x1863c40f56fb  1a7b  c5b058e4             vaddps xmm4,xmm9,xmm4
0x1863c40f56ff  1a7f  c4a17a7fa40e00010000 vmovdqu [rsi+r9*1+0x100],xmm4
0x1863c40f5709  1a89  c50859c8             vmulps xmm9,xmm14,xmm0
0x1863c40f570d  1a8d  c4413058ca           vaddps xmm9,xmm9,xmm10
0x1863c40f5712  1a92  c4217a7f8c0ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm9
0x1863c40f571c  1a9c  c578109500feffff     vmovups xmm10,[rbp-0x200]
0x1863c40f5724  1aa4  c52859d0             vmulps xmm10,xmm10,xmm0
0x1863c40f5728  1aa8  c578109d10fcffff     vmovups xmm11,[rbp-0x3f0]
0x1863c40f5730  1ab0  c4412858d3           vaddps xmm10,xmm10,xmm11
0x1863c40f5735  1ab5  c4217a7f940e80000000 vmovdqu [rsi+r9*1+0x80],xmm10
0x1863c40f573f  1abf  c578109d10feffff     vmovups xmm11,[rbp-0x1f0]
0x1863c40f5747  1ac7  c5a059c0             vmulps xmm0,xmm11,xmm0
0x1863c40f574b  1acb  c57810a520fcffff     vmovups xmm12,[rbp-0x3e0]
0x1863c40f5753  1ad3  c4c17858c4           vaddps xmm0,xmm0,xmm12
0x1863c40f5758  1ad8  c4a17a7f440e40       vmovdqu [rsi+r9*1+0x40],xmm0
0x1863c40f575f  1adf  c57a6f5c1610         vmovdqu xmm11,[rsi+rdx*1+0x10]
0x1863c40f5765  1ae5  c4217a6f640610       vmovdqu xmm12,[rsi+r8*1+0x10]
0x1863c40f576c  1aec  c4217a6f6c1e10       vmovdqu xmm13,[rsi+r11*1+0x10]
0x1863c40f5773  1af3  c57810b520feffff     vmovups xmm14,[rbp-0x1e0]
0x1863c40f577b  1afb  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x1863c40f5783  1b03  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x1863c40f5788  1b08  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x1863c40f5790  1b10  49ba0500000006000000 REX.W movq r10,0x600000005
0x1863c40f579a  1b1a  c4c1f96eda           vmovq xmm3,r10
0x1863c40f579f  1b1f  49ba0700000008000000 REX.W movq r10,0x800000007
0x1863c40f57a9  1b29  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x1863c40f57af  1b2f  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x1863c40f57b7  1b37  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x1863c40f57bf  1b3f  c4e2613fdc           vpmaxud xmm3,xmm3,xmm4
0x1863c40f57c4  1b44  c5e176dc             vpcmpeqd xmm3,xmm3,xmm4
0x1863c40f57c8  1b48  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f57cd  1b4d  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x1863c40f57d2  1b52  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x1863c40f57da  1b5a  49ba0400000005000000 REX.W movq r10,0x500000004
0x1863c40f57e4  1b64  c4c1f96ef2           vmovq xmm6,r10
0x1863c40f57e9  1b69  49ba0600000007000000 REX.W movq r10,0x700000006
0x1863c40f57f3  1b73  c4c3c922f201         vpinsrq xmm6,xmm6,r10,0x1
0x1863c40f57f9  1b79  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x1863c40f5801  1b81  c5f810bd40feffff     vmovups xmm7,[rbp-0x1c0]
0x1863c40f5809  1b89  c4e2413ffe           vpmaxud xmm7,xmm7,xmm6
0x1863c40f580e  1b8e  c5c176fe             vpcmpeqd xmm7,xmm7,xmm6
0x1863c40f5812  1b92  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f5817  1b97  c4c141efff           vpxor xmm7,xmm7,xmm15
0x1863c40f581c  1b9c  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x1863c40f5820  1ba0  c4a17a6f742610       vmovdqu xmm6,[rsi+r12*1+0x10]
0x1863c40f5827  1ba7  c578118d00fcffff     vmovups [rbp-0x400],xmm9
0x1863c40f582f  1baf  c5f810bd50feffff     vmovups xmm7,[rbp-0x1b0]
0x1863c40f5837  1bb7  c5405cce             vsubps xmm9,xmm7,xmm6
0x1863c40f583b  1bbb  c578119510fcffff     vmovups [rbp-0x3f0],xmm10
0x1863c40f5843  1bc3  c4413059d1           vmulps xmm10,xmm9,xmm9
0x1863c40f5848  1bc8  c5f859f8             vmulps xmm7,xmm0,xmm0
0x1863c40f584c  1bcc  c5a858ff             vaddps xmm7,xmm10,xmm7
0x1863c40f5850  1bd0  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x1863c40f5855  1bd5  c529dbd5             vpand xmm10,xmm10,xmm5
0x1863c40f5859  1bd9  c441785bd2           vcvtdq2ps xmm10,xmm10
0x1863c40f585e  1bde  c44161dbd2           vpand xmm10,xmm3,xmm10
0x1863c40f5863  1be3  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x1863c40f5868  1be8  c5f810a590fcffff     vmovups xmm4,[rbp-0x370]
0x1863c40f5870  1bf0  c5f858c4             vaddps xmm0,xmm0,xmm4
0x1863c40f5874  1bf4  c4a17a7f840ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm0
0x1863c40f587e  1bfe  c4c13059e2           vmulps xmm4,xmm9,xmm10
0x1863c40f5883  1c03  c578108dd0fbffff     vmovups xmm9,[rbp-0x430]
0x1863c40f588b  1c0b  c4c15858e1           vaddps xmm4,xmm4,xmm9
0x1863c40f5890  1c10  c4a17a7fa40e90010000 vmovdqu [rsi+r9*1+0x190],xmm4
0x1863c40f589a  1c1a  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x1863c40f589f  1c1f  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x1863c40f58a4  1c24  c44131dbca           vpand xmm9,xmm9,xmm10
0x1863c40f58a9  1c29  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x1863c40f58ae  1c2e  c5e172f31f           vpslld xmm3,xmm3,31
0x1863c40f58b3  1c33  c5e172e31f           vpsrad xmm3,xmm3,31
0x1863c40f58b8  1c38  c5b8c2ff01           vcmpps xmm7,xmm8,xmm7, (lt)
0x1863c40f58bd  1c3d  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x1863c40f58c1  1c41  c5f85bff             vcvtdq2ps xmm7,xmm7
0x1863c40f58c5  1c45  c5e1dbdf             vpand xmm3,xmm3,xmm7
0x1863c40f58c9  1c49  c5f810bdc0feffff     vmovups xmm7,[rbp-0x140]
0x1863c40f58d1  1c51  c5e058ff             vaddps xmm7,xmm3,xmm7
0x1863c40f58d5  1c55  c4a17a7fbc0e50010000 vmovdqu [rsi+r9*1+0x150],xmm7
0x1863c40f58df  1c5f  c51859cb             vmulps xmm9,xmm12,xmm3
0x1863c40f58e3  1c63  c5781095b0feffff     vmovups xmm10,[rbp-0x150]
0x1863c40f58eb  1c6b  c4413058ca           vaddps xmm9,xmm9,xmm10
0x1863c40f58f0  1c70  c4217a7f8c0e10010000 vmovdqu [rsi+r9*1+0x110],xmm9
0x1863c40f58fa  1c7a  c52059d3             vmulps xmm10,xmm11,xmm3
0x1863c40f58fe  1c7e  c578109dc0fcffff     vmovups xmm11,[rbp-0x340]
0x1863c40f5906  1c86  c4412858d3           vaddps xmm10,xmm10,xmm11
0x1863c40f590b  1c8b  c4217a7f940ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm10
0x1863c40f5915  1c95  c51059db             vmulps xmm11,xmm13,xmm3
0x1863c40f5919  1c99  c57810adb0fcffff     vmovups xmm13,[rbp-0x350]
0x1863c40f5921  1ca1  c4412058dd           vaddps xmm11,xmm11,xmm13
0x1863c40f5926  1ca6  c4217a7f9c0e90000000 vmovdqu [rsi+r9*1+0x90],xmm11
0x1863c40f5930  1cb0  c5c859db             vmulps xmm3,xmm6,xmm3
0x1863c40f5934  1cb4  c5f810b5a0fcffff     vmovups xmm6,[rbp-0x360]
0x1863c40f593c  1cbc  c5e058de             vaddps xmm3,xmm3,xmm6
0x1863c40f5940  1cc0  c4a17a7f5c0e50       vmovdqu [rsi+r9*1+0x50],xmm3
0x1863c40f5947  1cc7  c5fa6f741620         vmovdqu xmm6,[rsi+rdx*1+0x20]
0x1863c40f594d  1ccd  c4217a6f640620       vmovdqu xmm12,[rsi+r8*1+0x20]
0x1863c40f5954  1cd4  c4217a6f6c1e20       vmovdqu xmm13,[rsi+r11*1+0x20]
0x1863c40f595b  1cdb  c5f8118590fcffff     vmovups [rbp-0x370],xmm0
0x1863c40f5963  1ce3  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x1863c40f5968  1ce8  c5f8119da0fcffff     vmovups [rbp-0x360],xmm3
0x1863c40f5970  1cf0  49ba090000000a000000 REX.W movq r10,0xa00000009
0x1863c40f597a  1cfa  c4c1f96eda           vmovq xmm3,r10
0x1863c40f597f  1cff  49ba0b0000000c000000 REX.W movq r10,0xc0000000b
0x1863c40f5989  1d09  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x1863c40f598f  1d0f  c5f811a5d0fbffff     vmovups [rbp-0x430],xmm4
0x1863c40f5997  1d17  c5f810a530feffff     vmovups xmm4,[rbp-0x1d0]
0x1863c40f599f  1d1f  c4e2613fdc           vpmaxud xmm3,xmm3,xmm4
0x1863c40f59a4  1d24  c5e176dc             vpcmpeqd xmm3,xmm3,xmm4
0x1863c40f59a8  1d28  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f59ad  1d2d  c4c161efdf           vpxor xmm3,xmm3,xmm15
0x1863c40f59b2  1d32  c5f811bdc0feffff     vmovups [rbp-0x140],xmm7
0x1863c40f59ba  1d3a  49ba0800000009000000 REX.W movq r10,0x900000008
0x1863c40f59c4  1d44  c4c1f96efa           vmovq xmm7,r10
0x1863c40f59c9  1d49  49ba0a0000000b000000 REX.W movq r10,0xb0000000a
0x1863c40f59d3  1d53  c4c3c122fa01         vpinsrq xmm7,xmm7,r10,0x1
0x1863c40f59d9  1d59  c578118db0feffff     vmovups [rbp-0x150],xmm9
0x1863c40f59e1  1d61  c578108d40feffff     vmovups xmm9,[rbp-0x1c0]
0x1863c40f59e9  1d69  c462313fcf           vpmaxud xmm9,xmm9,xmm7
0x1863c40f59ee  1d6e  c53176cf             vpcmpeqd xmm9,xmm9,xmm7
0x1863c40f59f2  1d72  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f59f7  1d77  c44131efcf           vpxor xmm9,xmm9,xmm15
0x1863c40f59fc  1d7c  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x1863c40f5a01  1d81  c4a17a6f7c2620       vmovdqu xmm7,[rsi+r12*1+0x20]
0x1863c40f5a08  1d88  c5781195c0fcffff     vmovups [rbp-0x340],xmm10
0x1863c40f5a10  1d90  c578108d50feffff     vmovups xmm9,[rbp-0x1b0]
0x1863c40f5a18  1d98  c5305cd7             vsubps xmm10,xmm9,xmm7
0x1863c40f5a1c  1d9c  c578119db0fcffff     vmovups [rbp-0x350],xmm11
0x1863c40f5a24  1da4  c4412859da           vmulps xmm11,xmm10,xmm10
0x1863c40f5a29  1da9  c57859c8             vmulps xmm9,xmm0,xmm0
0x1863c40f5a2d  1dad  c4412058c9           vaddps xmm9,xmm11,xmm9
0x1863c40f5a32  1db2  c530c2da01           vcmpps xmm11,xmm9,xmm2, (lt)
0x1863c40f5a37  1db7  c521dbdd             vpand xmm11,xmm11,xmm5
0x1863c40f5a3b  1dbb  c441785bdb           vcvtdq2ps xmm11,xmm11
0x1863c40f5a40  1dc0  c44161dbdb           vpand xmm11,xmm3,xmm11
0x1863c40f5a45  1dc5  c4c17859c3           vmulps xmm0,xmm0,xmm11
0x1863c40f5a4a  1dca  c5f810a5a0fdffff     vmovups xmm4,[rbp-0x260]
0x1863c40f5a52  1dd2  c5f858c4             vaddps xmm0,xmm0,xmm4
0x1863c40f5a56  1dd6  c4a17a7f840ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm0
0x1863c40f5a60  1de0  c4c12859e3           vmulps xmm4,xmm10,xmm11
0x1863c40f5a65  1de5  c5781095b0fdffff     vmovups xmm10,[rbp-0x250]
0x1863c40f5a6d  1ded  c4c15858e2           vaddps xmm4,xmm4,xmm10
0x1863c40f5a72  1df2  c4a17a7fa40ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm4
0x1863c40f5a7c  1dfc  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x1863c40f5a82  1e02  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x1863c40f5a87  1e07  c44129dbd3           vpand xmm10,xmm10,xmm11
0x1863c40f5a8c  1e0c  c4c161dbda           vpand xmm3,xmm3,xmm10
0x1863c40f5a91  1e11  c5e172f31f           vpslld xmm3,xmm3,31
0x1863c40f5a96  1e16  c5e172e31f           vpsrad xmm3,xmm3,31
0x1863c40f5a9b  1e1b  c44138c2c901         vcmpps xmm9,xmm8,xmm9, (lt)
0x1863c40f5aa1  1e21  c531dbcd             vpand xmm9,xmm9,xmm5
0x1863c40f5aa5  1e25  c441785bc9           vcvtdq2ps xmm9,xmm9
0x1863c40f5aaa  1e2a  c4c161dbd9           vpand xmm3,xmm3,xmm9
0x1863c40f5aaf  1e2f  c578108d60fdffff     vmovups xmm9,[rbp-0x2a0]
0x1863c40f5ab7  1e37  c4416058c9           vaddps xmm9,xmm3,xmm9
0x1863c40f5abc  1e3c  c4217a7f8c0e60010000 vmovdqu [rsi+r9*1+0x160],xmm9
0x1863c40f5ac6  1e46  c51859d3             vmulps xmm10,xmm12,xmm3
0x1863c40f5aca  1e4a  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x1863c40f5ad2  1e52  c4412858d3           vaddps xmm10,xmm10,xmm11
0x1863c40f5ad7  1e57  c4217a7f940e20010000 vmovdqu [rsi+r9*1+0x120],xmm10
0x1863c40f5ae1  1e61  c5c859f3             vmulps xmm6,xmm6,xmm3
0x1863c40f5ae5  1e65  c578109d80fdffff     vmovups xmm11,[rbp-0x280]
0x1863c40f5aed  1e6d  c4c14858f3           vaddps xmm6,xmm6,xmm11
0x1863c40f5af2  1e72  c4a17a7fb40ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm6
0x1863c40f5afc  1e7c  c51059db             vmulps xmm11,xmm13,xmm3
0x1863c40f5b00  1e80  c57810a5d0feffff     vmovups xmm12,[rbp-0x130]
0x1863c40f5b08  1e88  c4412058dc           vaddps xmm11,xmm11,xmm12
0x1863c40f5b0d  1e8d  c4217a7f9c0ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm11
0x1863c40f5b17  1e97  c5c059db             vmulps xmm3,xmm7,xmm3
0x1863c40f5b1b  1e9b  c5f810bd90fdffff     vmovups xmm7,[rbp-0x270]
0x1863c40f5b23  1ea3  c5e058df             vaddps xmm3,xmm3,xmm7
0x1863c40f5b27  1ea7  c4a17a7f5c0e60       vmovdqu [rsi+r9*1+0x60],xmm3
0x1863c40f5b2e  1eae  c5fa6f7c1630         vmovdqu xmm7,[rsi+rdx*1+0x30]
0x1863c40f5b34  1eb4  c4217a6f640630       vmovdqu xmm12,[rsi+r8*1+0x30]
0x1863c40f5b3b  1ebb  c4217a6f6c1e30       vmovdqu xmm13,[rsi+r11*1+0x30]
0x1863c40f5b42  1ec2  c5f81185a0fdffff     vmovups [rbp-0x260],xmm0
0x1863c40f5b4a  1eca  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x1863c40f5b4f  1ecf  49ba0d0000000e000000 REX.W movq r10,0xe0000000d
0x1863c40f5b59  1ed9  c441f96ef2           vmovq xmm14,r10
0x1863c40f5b5e  1ede  49ba0f00000010000000 REX.W movq r10,0x100000000f
0x1863c40f5b68  1ee8  c4438922f201         vpinsrq xmm14,xmm14,r10,0x1
0x1863c40f5b6e  1eee  c5f8119d90fdffff     vmovups [rbp-0x270],xmm3
0x1863c40f5b76  1ef6  c5f8109d30feffff     vmovups xmm3,[rbp-0x1d0]
0x1863c40f5b7e  1efe  c462093ff3           vpmaxud xmm14,xmm14,xmm3
0x1863c40f5b83  1f03  c50976f3             vpcmpeqd xmm14,xmm14,xmm3
0x1863c40f5b87  1f07  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f5b8c  1f0c  c44109eff7           vpxor xmm14,xmm14,xmm15
0x1863c40f5b91  1f11  49ba0c0000000d000000 REX.W movq r10,0xd0000000c
0x1863c40f5b9b  1f1b  c4c1f96eda           vmovq xmm3,r10
0x1863c40f5ba0  1f20  49ba0e0000000f000000 REX.W movq r10,0xf0000000e
0x1863c40f5baa  1f2a  c4c3e122da01         vpinsrq xmm3,xmm3,r10,0x1
0x1863c40f5bb0  1f30  c5f811a5b0fdffff     vmovups [rbp-0x250],xmm4
0x1863c40f5bb8  1f38  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x1863c40f5bc0  1f40  c4e2593fe3           vpmaxud xmm4,xmm4,xmm3
0x1863c40f5bc5  1f45  c5d976e3             vpcmpeqd xmm4,xmm4,xmm3
0x1863c40f5bc9  1f49  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x1863c40f5bce  1f4e  c4c159efe7           vpxor xmm4,xmm4,xmm15
0x1863c40f5bd3  1f53  c589dbdc             vpand xmm3,xmm14,xmm4
0x1863c40f5bd7  1f57  c4a17a6f642630       vmovdqu xmm4,[rsi+r12*1+0x30]
0x1863c40f5bde  1f5e  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x1863c40f5be6  1f66  c5f811b580fdffff     vmovups [rbp-0x280],xmm6
0x1863c40f5bee  1f6e  c5885cf4             vsubps xmm6,xmm14,xmm4
0x1863c40f5bf2  1f72  c578118d60fdffff     vmovups [rbp-0x2a0],xmm9
0x1863c40f5bfa  1f7a  c54859ce             vmulps xmm9,xmm6,xmm6
0x1863c40f5bfe  1f7e  c578119570fdffff     vmovups [rbp-0x290],xmm10
0x1863c40f5c06  1f86  c57859d0             vmulps xmm10,xmm0,xmm0
0x1863c40f5c0a  1f8a  c4413058ca           vaddps xmm9,xmm9,xmm10
0x1863c40f5c0f  1f8f  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x1863c40f5c14  1f94  c529dbd5             vpand xmm10,xmm10,xmm5
0x1863c40f5c18  1f98  c441785bd2           vcvtdq2ps xmm10,xmm10
0x1863c40f5c1d  1f9d  c44161dbd2           vpand xmm10,xmm3,xmm10
0x1863c40f5c22  1fa2  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x1863c40f5c27  1fa7  c578119dd0feffff     vmovups [rbp-0x130],xmm11
0x1863c40f5c2f  1faf  c578109d40fdffff     vmovups xmm11,[rbp-0x2c0]
0x1863c40f5c37  1fb7  c4c17858c3           vaddps xmm0,xmm0,xmm11
0x1863c40f5c3c  1fbc  c4a17a7f840ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm0
0x1863c40f5c46  1fc6  c4c14859f2           vmulps xmm6,xmm6,xmm10
0x1863c40f5c4b  1fcb  c578109550fdffff     vmovups xmm10,[rbp-0x2b0]
0x1863c40f5c53  1fd3  c4c14858f2           vaddps xmm6,xmm6,xmm10
0x1863c40f5c58  1fd8  c4a17a7fb40eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm6
0x1863c40f5c62  1fe2  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x1863c40f5c68  1fe8  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x1863c40f5c6d  1fed  c44129dbd3           vpand xmm10,xmm10,xmm11
0x1863c40f5c72  1ff2  c4c161dbda           vpand xmm3,xmm3,xmm10
0x1863c40f5c77  1ff7  c5e172f31f           vpslld xmm3,xmm3,31
0x1863c40f5c7c  1ffc  c5e172e31f           vpsrad xmm3,xmm3,31
0x1863c40f5c81  2001  c44138c2c101         vcmpps xmm8,xmm8,xmm9, (lt)
0x1863c40f5c87  2007  c539dbc5             vpand xmm8,xmm8,xmm5
0x1863c40f5c8b  200b  c441785bc0           vcvtdq2ps xmm8,xmm8
0x1863c40f5c90  2010  c4c161dbd8           vpand xmm3,xmm3,xmm8
0x1863c40f5c95  2015  c5781085f0fcffff     vmovups xmm8,[rbp-0x310]
0x1863c40f5c9d  201d  c4416058c0           vaddps xmm8,xmm3,xmm8
0x1863c40f5ca2  2022  c4217a7f840e70010000 vmovdqu [rsi+r9*1+0x170],xmm8
0x1863c40f5cac  202c  c51859cb             vmulps xmm9,xmm12,xmm3
0x1863c40f5cb0  2030  c578109500fdffff     vmovups xmm10,[rbp-0x300]
0x1863c40f5cb8  2038  c4413058ca           vaddps xmm9,xmm9,xmm10
0x1863c40f5cbd  203d  c4217a7f8c0e30010000 vmovdqu [rsi+r9*1+0x130],xmm9
0x1863c40f5cc7  2047  c5c059fb             vmulps xmm7,xmm7,xmm3
0x1863c40f5ccb  204b  c578109510fdffff     vmovups xmm10,[rbp-0x2f0]
0x1863c40f5cd3  2053  c4c14058fa           vaddps xmm7,xmm7,xmm10
0x1863c40f5cd8  2058  c4a17a7fbc0ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm7
0x1863c40f5ce2  2062  c51059d3             vmulps xmm10,xmm13,xmm3
0x1863c40f5ce6  2066  c578109d20fdffff     vmovups xmm11,[rbp-0x2e0]
0x1863c40f5cee  206e  c4412858d3           vaddps xmm10,xmm10,xmm11
0x1863c40f5cf3  2073  c4217a7f940eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm10
0x1863c40f5cfd  207d  c5d859db             vmulps xmm3,xmm4,xmm3
0x1863c40f5d01  2081  c578109d30fdffff     vmovups xmm11,[rbp-0x2d0]
0x1863c40f5d09  2089  c4416058db           vaddps xmm11,xmm3,xmm11
0x1863c40f5d0e  208e  c4217a7f5c0e70       vmovdqu [rsi+r9*1+0x70],xmm11
0x1863c40f5d15  2095  33c0                 xorl rax,rax
0x1863c40f5d17  2097  448bbdd0fdffff       movl r15,[rbp-0x230]
0x1863c40f5d1e  209e  c5781185f0fcffff     vmovups [rbp-0x310],xmm8
0x1863c40f5d26  20a6  c578118d00fdffff     vmovups [rbp-0x300],xmm9
0x1863c40f5d2e  20ae  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x1863c40f5d36  20b6  c578119520fdffff     vmovups [rbp-0x2e0],xmm10
0x1863c40f5d3e  20be  c578119d30fdffff     vmovups [rbp-0x2d0],xmm11
0x1863c40f5d46  20c6  c57928e8             vmovapd xmm13,xmm0
0x1863c40f5d4a  20ca  c57928f6             vmovapd xmm14,xmm6
0x1863c40f5d4e  20ce  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x1863c40f5d56  20d6  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x1863c40f5d5e  20de  e91a020000           jmp 0x1863c40f5f7d  <+0x22fd>
0x1863c40f5d63  20e3  448b9d20ffffff       movl r11,[rbp-0xe0]
0x1863c40f5d6a  20ea  4183e30f             andl r11,0xf
0x1863c40f5d6e  20ee  448be1               movl r12,rcx
0x1863c40f5d71  20f1  8bbd98feffff         movl rdi,[rbp-0x168]
0x1863c40f5d77  20f7  3bf9                 cmpl rdi,rcx
0x1863c40f5d79  20f9  440f42e7             cmovcl r12,rdi
0x1863c40f5d7d  20fd  4589e6               movl r14,r12
0x1863c40f5d80  2100  8b9da8feffff         movl rbx,[rbp-0x158]
0x1863c40f5d86  2106  4439e3               cmpl rbx,r12
0x1863c40f5d89  2109  440f42f3             cmovcl r14,rbx
0x1863c40f5d8d  210d  458be6               movl r12,r14
0x1863c40f5d90  2110  453bde               cmpl r11,r14
0x1863c40f5d93  2113  450f42e3             cmovcl r12,r11
0x1863c40f5d97  2117  4585e4               testl r12,r12
0x1863c40f5d9a  211a  0f8545000000         jnz 0x1863c40f5de5  <+0x2165>
0x1863c40f5da0  2120  c5781185d0fbffff     vmovups [rbp-0x430],xmm8
0x1863c40f5da8  2128  c5f811bde0fbffff     vmovups [rbp-0x420],xmm7
0x1863c40f5db0  2130  c5f811a5f0fbffff     vmovups [rbp-0x410],xmm4
0x1863c40f5db8  2138  c578119500fcffff     vmovups [rbp-0x400],xmm10
0x1863c40f5dc0  2140  c578118d10fcffff     vmovups [rbp-0x3f0],xmm9
0x1863c40f5dc8  2148  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x1863c40f5dd0  2150  c5f811b530fcffff     vmovups [rbp-0x3d0],xmm6
0x1863c40f5dd8  2158  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x1863c40f5de0  2160  e998010000           jmp 0x1863c40f5f7d  <+0x22fd>
0x1863c40f5de5  2165  8b8de0feffff         movl rcx,[rbp-0x120]
0x1863c40f5deb  216b  81e1f0ffff1f         andl rcx,0x1ffffff0
0x1863c40f5df1  2171  448b9d18ffffff       movl r11,[rbp-0xe8]
0x1863c40f5df8  2178  458d1c8b             leal r11,[r11+rcx*4]
0x1863c40f5dfc  217c  448bb520ffffff       movl r14,[rbp-0xe0]
0x1863c40f5e03  2183  4181e6f0ffff1f       andl r14,0x1ffffff0
0x1863c40f5e0a  218a  8b9d28ffffff         movl rbx,[rbp-0xd8]
0x1863c40f5e10  2190  468d34b3             leal r14,[rbx+r14*4]
0x1863c40f5e14  2194  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x1863c40f5e1c  219c  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x1863c40f5e24  21a4  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x1863c40f5e2c  21ac  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1863c40f5e30  21b0  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x1863c40f5e34  21b4  c5c972f619           vpslld xmm6,xmm6,25
0x1863c40f5e39  21b9  c5c972d602           vpsrld xmm6,xmm6,2
0x1863c40f5e3e  21be  418bdb               movl rbx,r11
0x1863c40f5e41  21c1  448b9de8feffff       movl r11,[rbp-0x118]
0x1863c40f5e48  21c8  8b95f0feffff         movl rdx,[rbp-0x110]
0x1863c40f5e4e  21ce  660f1f840000000000   nop
0x1863c40f5e57  21d7  660f1f840000000000   nop
0x1863c40f5e60  21e0  660f1f840000000000   nop
0x1863c40f5e69  21e9  660f1f840000000000   nop
0x1863c40f5e72  21f2  660f1f840000000000   nop
0x1863c40f5e7b  21fb  0f1f440000           nop
0x1863c40f5e80  2200  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x1863c40f5e88  2208  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x1863c40f5e90  2210  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1863c40f5e94  2214  0f8620060000         jna 0x1863c40f64ba  <+0x283a>
0x1863c40f5e9a  221a  c5fa103c1e           vmovss xmm7,[rsi+rbx*1]
0x1863c40f5e9f  221f  c5725cc7             vsubss xmm8,xmm1,xmm7
0x1863c40f5ea3  2223  c4c13a59c8           vmulss xmm1,xmm8,xmm8
0x1863c40f5ea8  2228  c4217a100c1e         vmovss xmm9,[rsi+r11*1]
0x1863c40f5eae  222e  c4416a5cd1           vsubss xmm10,xmm2,xmm9
0x1863c40f5eb3  2233  c4c12a59d2           vmulss xmm2,xmm10,xmm10
0x1863c40f5eb8  2238  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x1863c40f5ebc  223c  c5f82ec1             vucomiss xmm0,xmm1
0x1863c40f5ec0  2240  0f8757000000         ja 0x1863c40f5f1d  <+0x229d>
0x1863c40f5ec6  2246  c5f82ed9             vucomiss xmm3,xmm1
0x1863c40f5eca  224a  0f8675000000         jna 0x1863c40f5f45  <+0x22c5>
0x1863c40f5ed0  2250  c5f82ecc             vucomiss xmm1,xmm4
0x1863c40f5ed4  2254  0f866b000000         jna 0x1863c40f5f45  <+0x22c5>
0x1863c40f5eda  225a  c4e27918ff           vbroadcastss xmm7,xmm7
0x1863c40f5edf  225f  c4c34121f910         vinsertps xmm7,xmm7,xmm9,0x10
0x1863c40f5ee5  2265  c57a100416           vmovss xmm8,[rsi+rdx*1]
0x1863c40f5eea  226a  c4c34121f820         vinsertps xmm7,xmm7,xmm8,0x20
0x1863c40f5ef0  2270  c4217a100436         vmovss xmm8,[rsi+r14*1]
0x1863c40f5ef6  2276  c4c34121f830         vinsertps xmm7,xmm7,xmm8,0x30
0x1863c40f5efc  227c  c5d058ef             vaddps xmm5,xmm5,xmm7
0x1863c40f5f00  2280  c5ca58bd68ffffff     vaddss xmm7,xmm6,[rbp-0x98]
0x1863c40f5f08  2288  c5fb11bd40ffffff     vmovsd [rbp-0xc0],xmm7
0x1863c40f5f10  2290  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x1863c40f5f18  2298  e928000000           jmp 0x1863c40f5f45  <+0x22c5>
0x1863c40f5f1d  229d  c5aa58bd30ffffff     vaddss xmm7,xmm10,[rbp-0xd0]
0x1863c40f5f25  22a5  c53a588560ffffff     vaddss xmm8,xmm8,[rbp-0xa0]
0x1863c40f5f2d  22ad  c5fb11bd30ffffff     vmovsd [rbp-0xd0],xmm7
0x1863c40f5f35  22b5  c57b118538ffffff     vmovsd [rbp-0xc8],xmm8
0x1863c40f5f3d  22bd  c57b118560ffffff     vmovsd [rbp-0xa0],xmm8
0x1863c40f5f45  22c5  83c304               addl rbx,0x4
0x1863c40f5f48  22c8  4183c304             addl r11,0x4
0x1863c40f5f4c  22cc  83c204               addl rdx,0x4
0x1863c40f5f4f  22cf  4183c604             addl r14,0x4
0x1863c40f5f53  22d3  4183c4ff             addl r12,0xff
0x1863c40f5f57  22d7  0f8523ffffff         jnz 0x1863c40f5e80  <+0x2200>
0x1863c40f5f5d  22dd  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x1863c40f5f65  22e5  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x1863c40f5f6d  22ed  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x1863c40f5f75  22f5  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x1863c40f5f7d  22fd  448bb578ffffff       movl r14,[rbp-0x88]
0x1863c40f5f84  2304  458d5e01             leal r11,[r14+0x1]
0x1863c40f5f88  2308  448ba570ffffff       movl r12,[rbp-0x90]
0x1863c40f5f8f  230f  453be6               cmpl r12,r14
0x1863c40f5f92  2312  0f8568ebffff         jnz 0x1863c40f4b00  <+0xe80>
0x1863c40f5f98  2318  c57b108530ffffff     vmovsd xmm8,[rbp-0xd0]
0x1863c40f5fa0  2320  c4217a11440e28       vmovss [rsi+r9*1+0x28],xmm8
0x1863c40f5fa7  2327  c5fb10bd38ffffff     vmovsd xmm7,[rbp-0xc8]
0x1863c40f5faf  232f  c4a17a117c0e24       vmovss [rsi+r9*1+0x24],xmm7
0x1863c40f5fb6  2336  c5fb10b540ffffff     vmovsd xmm6,[rbp-0xc0]
0x1863c40f5fbe  233e  c4a17a11740e20       vmovss [rsi+r9*1+0x20],xmm6
0x1863c40f5fc5  2345  c5f8108550ffffff     vmovups xmm0,[rbp-0xb0]
0x1863c40f5fcd  234d  c4a17a7f440e10       vmovdqu [rsi+r9*1+0x10],xmm0
0x1863c40f5fd4  2354  e906000000           jmp 0x1863c40f5fdf  <+0x235f>
0x1863c40f5fd9  2359  448b4de0             movl r9,[rbp-0x20]
0x1863c40f5fdd  235d  33c0                 xorl rax,rax
0x1863c40f5fdf  235f  418d5110             leal rdx,[r9+0x10]
0x1863c40f5fe3  2363  4c8bd8               REX.W movq r11,rax
0x1863c40f5fe6  2366  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x1863c40f5fed  236d  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f5ff1  2371  8b4598               movl rax,[rbp-0x68]
0x1863c40f5ff4  2374  e8473df2ff           call 0x1863c4019d40  (jump table)
0x1863c40f5ff9  2379  8b5de0               movl rbx,[rbp-0x20]
0x1863c40f5ffc  237c  8d4b30               leal rcx,[rbx+0x30]
0x1863c40f5fff  237f  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f6003  2383  8b4598               movl rax,[rbp-0x68]
0x1863c40f6006  2386  8b5590               movl rdx,[rbp-0x70]
0x1863c40f6009  2389  c5fb104d88           vmovsd xmm1,[rbp-0x78]
0x1863c40f600e  238e  c5fb105580           vmovsd xmm2,[rbp-0x80]
0x1863c40f6013  2393  448b8d78ffffff       movl r9,[rbp-0x88]
0x1863c40f601a  239a  e8293df2ff           call 0x1863c4019d48  (jump table)
0x1863c40f601f  239f  448b5da0             movl r11,[rbp-0x60]
0x1863c40f6023  23a3  443b5dd0             cmpl r11,[rbp-0x30]
0x1863c40f6027  23a7  0f86b1000000         jna 0x1863c40f60de  <+0x245e>
0x1863c40f602d  23ad  8b75d0               movl rsi,[rbp-0x30]
0x1863c40f6030  23b0  448b65a8             movl r12,[rbp-0x58]
0x1863c40f6034  23b4  458d3cb4             leal r15,[r12+rsi*4]
0x1863c40f6038  23b8  448b75e0             movl r14,[rbp-0x20]
0x1863c40f603c  23bc  488b45c8             REX.W movq rax,[rbp-0x38]
0x1863c40f6040  23c0  c4a17a10443040       vmovss xmm0,[rax+r14*1+0x40]
0x1863c40f6047  23c7  c4a17a110438         vmovss [rax+r15*1],xmm0
0x1863c40f604d  23cd  448b7db0             movl r15,[rbp-0x50]
0x1863c40f6051  23d1  418d1cb7             leal rbx,[r15+rsi*4]
0x1863c40f6055  23d5  c4a17a10443044       vmovss xmm0,[rax+r14*1+0x44]
0x1863c40f605c  23dc  c5fa110418           vmovss [rax+rbx*1],xmm0
0x1863c40f6061  23e1  8b5db8               movl rbx,[rbp-0x48]
0x1863c40f6064  23e4  8d14b3               leal rdx,[rbx+rsi*4]
0x1863c40f6067  23e7  c4a17a10443048       vmovss xmm0,[rax+r14*1+0x48]
0x1863c40f606e  23ee  c5fa110410           vmovss [rax+rdx*1],xmm0
0x1863c40f6073  23f3  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f6076  23f6  8d0cb2               leal rcx,[rdx+rsi*4]
0x1863c40f6079  23f9  c4a17a1044304c       vmovss xmm0,[rax+r14*1+0x4c]
0x1863c40f6080  2400  c5fa110408           vmovss [rax+rcx*1],xmm0
0x1863c40f6085  2405  458bd3               movl r10,r11
0x1863c40f6088  2408  4c8bd8               REX.W movq r11,rax
0x1863c40f608b  240b  8bc2                 movl rax,rdx
0x1863c40f608d  240d  418bd2               movl rdx,r10
0x1863c40f6090  2410  4489e1               movl rcx,r12
0x1863c40f6093  2413  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x1863c40f6098  2418  c4c13972f019         vpslld xmm8,xmm8,25
0x1863c40f609e  241e  c4c13972d002         vpsrld xmm8,xmm8,2
0x1863c40f60a4  2424  c5c857f6             vxorps xmm6,xmm6,xmm6
0x1863c40f60a8  2428  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x1863c40f60b0  2430  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x1863c40f60b8  2438  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x1863c40f60c0  2440  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x1863c40f60c8  2448  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x1863c40f60d0  2450  33ff                 xorl rdi,rdi
0x1863c40f60d2  2452  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f60d9  2459  e959000000           jmp 0x1863c40f6137  <+0x24b7>
0x1863c40f60de  245e  8b75d0               movl rsi,[rbp-0x30]
0x1863c40f60e1  2461  418bd3               movl rdx,r11
0x1863c40f60e4  2464  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f60e8  2468  8b45c0               movl rax,[rbp-0x40]
0x1863c40f60eb  246b  8b5db8               movl rbx,[rbp-0x48]
0x1863c40f60ee  246e  8b4da8               movl rcx,[rbp-0x58]
0x1863c40f60f1  2471  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x1863c40f60f6  2476  c4c13972f019         vpslld xmm8,xmm8,25
0x1863c40f60fc  247c  c4c13972d002         vpsrld xmm8,xmm8,2
0x1863c40f6102  2482  c5c857f6             vxorps xmm6,xmm6,xmm6
0x1863c40f6106  2486  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x1863c40f610e  248e  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x1863c40f6116  2496  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x1863c40f611e  249e  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x1863c40f6126  24a6  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x1863c40f612e  24ae  33ff                 xorl rdi,rdi
0x1863c40f6130  24b0  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f6137  24b7  83c601               addl rsi,0x1
0x1863c40f613a  24ba  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f613e  24be  443bfe               cmpl r15,rsi
0x1863c40f6141  24c1  0f8579e3ffff         jnz 0x1863c40f44c0  <+0x840>
0x1863c40f6147  24c7  448b5de0             movl r11,[rbp-0x20]
0x1863c40f614b  24cb  4181c300020000       addl r11,0x200
0x1863c40f6152  24d2  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x1863c40f6156  24d6  45891c24             movl [r12],r11
0x1863c40f615a  24da  488be5               REX.W movq rsp,rbp
0x1863c40f615d  24dd  5d                   pop rbp
0x1863c40f615e  24de  c3                   retl
0x1863c40f615f  24df  e86c43f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f6164  24e4  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f6168  24e8  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1863c40f616c  24ec  8b45d8               movl rax,[rbp-0x28]
0x1863c40f616f  24ef  e930dbffff           jmp 0x1863c40f3ca4  <+0x24>
0x1863c40f6174  24f4  c5f92eff             vucomisd xmm7,xmm7
0x1863c40f6178  24f8  0f8b0a000000         jpo 0x1863c40f6188  <+0x2508>
0x1863c40f617e  24fe  33d2                 xorl rdx,rdx
0x1863c40f6180  2500  4c8bf2               REX.W movq r14,rdx
0x1863c40f6183  2503  e996dcffff           jmp 0x1863c40f3e1e  <+0x19e>
0x1863c40f6188  2508  c5c057ff             vxorps xmm7,xmm7,xmm7
0x1863c40f618c  250c  c5f82efe             vucomiss xmm7,xmm6
0x1863c40f6190  2510  0f870b000000         ja 0x1863c40f61a1  <+0x2521>
0x1863c40f6196  2516  41beffffffff         movl r14,0xffffffff
0x1863c40f619c  251c  e97ddcffff           jmp 0x1863c40f3e1e  <+0x19e>
0x1863c40f61a1  2521  4533f6               xorl r14,r14
0x1863c40f61a4  2524  e975dcffff           jmp 0x1863c40f3e1e  <+0x19e>
0x1863c40f61a9  2529  c441792ec0           vucomisd xmm8,xmm8
0x1863c40f61ae  252e  0f8b08000000         jpo 0x1863c40f61bc  <+0x253c>
0x1863c40f61b4  2534  4533f6               xorl r14,r14
0x1863c40f61b7  2537  e9c9dcffff           jmp 0x1863c40f3e85  <+0x205>
0x1863c40f61bc  253c  c4413857c0           vxorps xmm8,xmm8,xmm8
0x1863c40f61c1  2541  c5782ec7             vucomiss xmm8,xmm7
0x1863c40f61c5  2545  77ed                 ja 0x1863c40f61b4  <+0x2534>
0x1863c40f61c7  2547  41beffffffff         movl r14,0xffffffff
0x1863c40f61cd  254d  e9b3dcffff           jmp 0x1863c40f3e85  <+0x205>
0x1863c40f61d2  2552  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f61da  255a  4c8945a8             REX.W movq [rbp-0x58],r8
0x1863c40f61de  255e  48897da0             REX.W movq [rbp-0x60],rdi
0x1863c40f61e2  2562  e8e942f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f61e7  2567  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f61eb  256b  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f61f2  2572  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f61f6  2576  8b7da0               movl rdi,[rbp-0x60]
0x1863c40f61f9  2579  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f6201  2581  8b75b0               movl rsi,[rbp-0x50]
0x1863c40f6204  2584  8b4db8               movl rcx,[rbp-0x48]
0x1863c40f6207  2587  8b5dc0               movl rbx,[rbp-0x40]
0x1863c40f620a  258a  448b45a8             movl r8,[rbp-0x58]
0x1863c40f620e  258e  e9b7ddffff           jmp 0x1863c40f3fca  <+0x34a>
0x1863c40f6213  2593  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f621b  259b  48894db8             REX.W movq [rbp-0x48],rcx
0x1863c40f621f  259f  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f6223  25a3  e8a842f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f6228  25a8  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f622c  25ac  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f6233  25b3  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f6237  25b7  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f623a  25ba  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f6242  25c2  8b5da0               movl rbx,[rbp-0x60]
0x1863c40f6245  25c5  8b45a8               movl rax,[rbp-0x58]
0x1863c40f6248  25c8  448b75b0             movl r14,[rbp-0x50]
0x1863c40f624c  25cc  8b4db8               movl rcx,[rbp-0x48]
0x1863c40f624f  25cf  e976deffff           jmp 0x1863c40f40ca  <+0x44a>
0x1863c40f6254  25d4  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f625c  25dc  48894da8             REX.W movq [rbp-0x58],rcx
0x1863c40f6260  25e0  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f6264  25e4  e86742f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f6269  25e9  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f626d  25ed  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f6274  25f4  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f6278  25f8  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f627b  25fb  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f6283  2603  8b5db8               movl rbx,[rbp-0x48]
0x1863c40f6286  2606  8b8560ffffff         movl rax,[rbp-0xa0]
0x1863c40f628c  260c  448b75a0             movl r14,[rbp-0x60]
0x1863c40f6290  2610  8b4da8               movl rcx,[rbp-0x58]
0x1863c40f6293  2613  e932dfffff           jmp 0x1863c40f41ca  <+0x54a>
0x1863c40f6298  2618  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x1863c40f62a0  2620  48895d98             REX.W movq [rbp-0x68],rbx
0x1863c40f62a4  2624  488955c0             REX.W movq [rbp-0x40],rdx
0x1863c40f62a8  2628  e82342f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f62ad  262d  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f62b1  2631  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f62b8  2638  8b55c0               movl rdx,[rbp-0x40]
0x1863c40f62bb  263b  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x1863c40f62c3  2643  448b7dd8             movl r15,[rbp-0x28]
0x1863c40f62c7  2647  8b45b8               movl rax,[rbp-0x48]
0x1863c40f62ca  264a  448b75b0             movl r14,[rbp-0x50]
0x1863c40f62ce  264e  8b5d98               movl rbx,[rbp-0x68]
0x1863c40f62d1  2651  e9f4dfffff           jmp 0x1863c40f42ca  <+0x64a>
0x1863c40f62d6  2656  488975d0             REX.W movq [rbp-0x30],rsi
0x1863c40f62da  265a  e8f141f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f62df  265f  8b75d0               movl rsi,[rbp-0x30]
0x1863c40f62e2  2662  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x1863c40f62e6  2666  8b45c0               movl rax,[rbp-0x40]
0x1863c40f62e9  2669  8b5db8               movl rbx,[rbp-0x48]
0x1863c40f62ec  266c  8b4da8               movl rcx,[rbp-0x58]
0x1863c40f62ef  266f  8b55a0               movl rdx,[rbp-0x60]
0x1863c40f62f2  2672  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x1863c40f62f7  2677  c4c13972f019         vpslld xmm8,xmm8,25
0x1863c40f62fd  267d  c4c13972d002         vpsrld xmm8,xmm8,2
0x1863c40f6303  2683  c5c857f6             vxorps xmm6,xmm6,xmm6
0x1863c40f6307  2687  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x1863c40f630f  268f  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x1863c40f6317  2697  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x1863c40f631f  269f  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x1863c40f6327  26a7  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x1863c40f632f  26af  33ff                 xorl rdi,rdi
0x1863c40f6331  26b1  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x1863c40f6338  26b8  e98de1ffff           jmp 0x1863c40f44ca  <+0x84a>
0x1863c40f633d  26bd  c5f92eed             vucomisd xmm5,xmm5
0x1863c40f6341  26c1  0f8b08000000         jpo 0x1863c40f634f  <+0x26cf>
0x1863c40f6347  26c7  4533db               xorl r11,r11
0x1863c40f634a  26ca  e9aae3ffff           jmp 0x1863c40f46f9  <+0xa79>
0x1863c40f634f  26cf  c5f82ee3             vucomiss xmm4,xmm3
0x1863c40f6353  26d3  77f2                 ja 0x1863c40f6347  <+0x26c7>
0x1863c40f6355  26d5  41bbffffffff         movl r11,0xffffffff
0x1863c40f635b  26db  e999e3ffff           jmp 0x1863c40f46f9  <+0xa79>
0x1863c40f6360  26e0  c5f92ef6             vucomisd xmm6,xmm6
0x1863c40f6364  26e4  0f8b08000000         jpo 0x1863c40f6372  <+0x26f2>
0x1863c40f636a  26ea  4533db               xorl r11,r11
0x1863c40f636d  26ed  e971e4ffff           jmp 0x1863c40f47e3  <+0xb63>
0x1863c40f6372  26f2  c5f82ee3             vucomiss xmm4,xmm3
0x1863c40f6376  26f6  77f2                 ja 0x1863c40f636a  <+0x26ea>
0x1863c40f6378  26f8  41bbffffffff         movl r11,0xffffffff
0x1863c40f637e  26fe  e960e4ffff           jmp 0x1863c40f47e3  <+0xb63>
0x1863c40f6383  2703  c578118dc0fdffff     vmovups [rbp-0x240],xmm9
0x1863c40f638b  270b  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x1863c40f6393  2713  c578119d20fcffff     vmovups [rbp-0x3e0],xmm11
0x1863c40f639b  271b  c57811a510fcffff     vmovups [rbp-0x3f0],xmm12
0x1863c40f63a3  2723  c57811ad00fcffff     vmovups [rbp-0x400],xmm13
0x1863c40f63ab  272b  c57811b5f0fbffff     vmovups [rbp-0x410],xmm14
0x1863c40f63b3  2733  c5f8118de0fbffff     vmovups [rbp-0x420],xmm1
0x1863c40f63bb  273b  c5f81195d0fbffff     vmovups [rbp-0x430],xmm2
0x1863c40f63c3  2743  e80841f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f63c8  2748  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x1863c40f63cc  274c  448bb578ffffff       movl r14,[rbp-0x88]
0x1863c40f63d3  2753  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x1863c40f63db  275b  448bbd90feffff       movl r15,[rbp-0x170]
0x1863c40f63e2  2762  448b8de0fdffff       movl r9,[rbp-0x220]
0x1863c40f63e9  2769  8b8dd0fdffff         movl rcx,[rbp-0x230]
0x1863c40f63ef  276f  33c0                 xorl rax,rax
0x1863c40f63f1  2771  c578108dc0fdffff     vmovups xmm9,[rbp-0x240]
0x1863c40f63f9  2779  c578109530fcffff     vmovups xmm10,[rbp-0x3d0]
0x1863c40f6401  2781  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x1863c40f6409  2789  c57810a510fcffff     vmovups xmm12,[rbp-0x3f0]
0x1863c40f6411  2791  c57810ad00fcffff     vmovups xmm13,[rbp-0x400]
0x1863c40f6419  2799  c57810b5f0fbffff     vmovups xmm14,[rbp-0x410]
0x1863c40f6421  27a1  c5f8108de0fbffff     vmovups xmm1,[rbp-0x420]
0x1863c40f6429  27a9  c5f81095d0fbffff     vmovups xmm2,[rbp-0x430]
0x1863c40f6431  27b1  8b9578fcffff         movl rdx,[rbp-0x388]
0x1863c40f6437  27b7  8bbd70fcffff         movl rdi,[rbp-0x390]
0x1863c40f643d  27bd  448b8568fcffff       movl r8,[rbp-0x398]
0x1863c40f6444  27c4  448b9d60fcffff       movl r11,[rbp-0x3a0]
0x1863c40f644b  27cb  8b9d58fcffff         movl rbx,[rbp-0x3a8]
0x1863c40f6451  27d1  e95ae7ffff           jmp 0x1863c40f4bb0  <+0xf30>
0x1863c40f6456  27d6  48898da0feffff       REX.W movq [rbp-0x160],rcx
0x1863c40f645d  27dd  4c89bde8fcffff       REX.W movq [rbp-0x318],r15
0x1863c40f6464  27e4  488995e0fcffff       REX.W movq [rbp-0x320],rdx
0x1863c40f646b  27eb  48899dd8fcffff       REX.W movq [rbp-0x328],rbx
0x1863c40f6472  27f2  e85940f2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f6477  27f7  448b4de0             movl r9,[rbp-0x20]
0x1863c40f647b  27fb  488b75c8             REX.W movq rsi,[rbp-0x38]
0x1863c40f647f  27ff  448b9d28ffffff       movl r11,[rbp-0xd8]
0x1863c40f6486  2806  448ba518ffffff       movl r12,[rbp-0xe8]
0x1863c40f648d  280d  8b8da0feffff         movl rcx,[rbp-0x160]
0x1863c40f6493  2813  c5f810a520feffff     vmovups xmm4,[rbp-0x1e0]
0x1863c40f649b  281b  448bbde8fcffff       movl r15,[rbp-0x318]
0x1863c40f64a2  2822  8b95e0fcffff         movl rdx,[rbp-0x320]
0x1863c40f64a8  2828  448b85d0fcffff       movl r8,[rbp-0x330]
0x1863c40f64af  282f  8b9dd8fcffff         movl rbx,[rbp-0x328]
0x1863c40f64b5  2835  e92eeaffff           jmp 0x1863c40f4ee8  <+0x1268>
0x1863c40f64ba  283a  4c89a528ffffff       REX.W movq [rbp-0xd8],r12
0x1863c40f64c1  2841  4c89b520ffffff       REX.W movq [rbp-0xe0],r14
0x1863c40f64c8  2848  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x1863c40f64cf  284f  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x1863c40f64d6  2856  48899d18ffffff       REX.W movq [rbp-0xe8],rbx
0x1863c40f64dd  285d  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x1863c40f64e5  2865  e8e63ff2ff           call 0x1863c401a4d0  (jump table)
0x1863c40f64ea  286a  448b4de0             movl r9,[rbp-0x20]
0x1863c40f64ee  286e  488b75c8             REX.W movq rsi,[rbp-0x38]
0x1863c40f64f2  2872  c578109d70fdffff     vmovups xmm11,[rbp-0x290]
0x1863c40f64fa  287a  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x1863c40f6502  2882  c57810b550fdffff     vmovups xmm14,[rbp-0x2b0]
0x1863c40f650a  288a  c57810ad40fdffff     vmovups xmm13,[rbp-0x2c0]
0x1863c40f6512  2892  448ba528ffffff       movl r12,[rbp-0xd8]
0x1863c40f6519  2899  448bb520ffffff       movl r14,[rbp-0xe0]
0x1863c40f6520  28a0  8b95f0feffff         movl rdx,[rbp-0x110]
0x1863c40f6526  28a6  448b9de8feffff       movl r11,[rbp-0x118]
0x1863c40f652d  28ad  8b9d18ffffff         movl rbx,[rbp-0xe8]
0x1863c40f6533  28b3  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x1863c40f653b  28bb  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x1863c40f653f  28bf  c5c972f619           vpslld xmm6,xmm6,25
0x1863c40f6544  28c4  c5c972d602           vpsrld xmm6,xmm6,2
0x1863c40f6549  28c9  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1863c40f654d  28cd  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x1863c40f6555  28d5  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x1863c40f655d  28dd  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x1863c40f6565  28e5  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x1863c40f656d  28ed  448bbdd0fdffff       movl r15,[rbp-0x230]
0x1863c40f6574  28f4  33c0                 xorl rax,rax
0x1863c40f6576  28f6  e91ff9ffff           jmp 0x1863c40f5e9a  <+0x221a>
0x1863c40f657b  28fb  e8903cf2ff           call 0x1863c401a210  (jump table)
0x1863c40f6580  2900  90                   nop
0x1863c40f6581  2901  0f1f00               nop

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
       bd6         
       bdb         
       be4         
       bee         
       bf8         
       c02         
       c0c         
       c13         
       c1d         
       c27         
       c31         
       c3b         
       c45         
       c4f         
       c5e         
       c70         
       c82         
       c94         
       ca6         
       cb8         
       cca         
       cd9         
       ceb         
       cfd         
       d0f         
       d21         
       d33         
       d45         
       d54         
       d66         
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
       bcb      1770
       bdb      1777
       be0      1791
       bee      1800
       bf8      1809
       c02      1818
       c0c      1827
       c13      1835
       c1d      1844
       c27      1853
       c31      1862
       c3b      1871
       c45      1880
       c4f      1889
       c56      1897
       c68      1906
       c7a      1915
       c8c      1924
       c9e      1933
       cb0      1942
       cc2      1951
       cd1      1959
       ce3      1968
       cf5      1977
       d07      1986
       d19      1995
       d2b      2004
       d3d      2013
       d4c      2021
       d5e      2030
       f56      2132
       f5e      2145
      126b      2441
      1274      2454
      127d      2473
      128c      2493
      12da      2542
      12f4      2563
      133e      2626
      1360      2647
      137b      2668
      1396      2689
      13b0      2710
      13bb      2719
      13c5      2730
      13cf      2747
      13ed      2765
      143b      2814
      1457      2835
      148e      2880
      14a9      2901
      14c4      2922
      14df      2943
      14f9      2964
      1504      2973
      150e      2984
      1518      3001
      1536      3019
      1595      3068
      15b1      3089
      15ec      3134
      1608      3155
      1624      3176
      1640      3197
      165b      3218
      1666      3227
      1670      3238
      167a      3255
      1698      3273
      16e5      3322
      1700      3343
      1736      3388
      1751      3409
      176c      3430
      1787      3451
      17a1      3472
      18e2      3550
      18f1      3563
      1901      3580
      19c6      3665
      1a14      3718
      1a27      3739
      1a6d      3816
      1a7f      3837
      1a92      3858
      1ab5      3879
      1ad8      3900
      1adf      3906
      1ae5      3914
      1aec      3926
      1ba0      3989
      1bf4      4042
      1c10      4063
      1c55      4122
      1c70      4143
      1c8b      4164
      1ca6      4185
      1cc0      4206
      1cc7      4212
      1ccd      4220
      1cd4      4232
      1d81      4295
      1dd6      4348
      1df2      4369
      1e3c      4428
      1e57      4449
      1e72      4470
      1e8d      4491
      1ea7      4512
      1eae      4518
      1eb4      4526
      1ebb      4538
      1f57      4601
      1fbc      4654
      1fd8      4675
      2022      4734
      203d      4755
      2058      4776
      2073      4797
      208e      4818
      221a      4909
      2228      4924
      2265      4975
      2270      4983
      2318      5084
      2327      5091
      2336      5098
      2345      5105
      2363      5121
      237f      5151
      23b8      5171
      23c7      5174
      23d5      5184
      23dc      5187
      23e7      5197
      23ee      5200
      23f9      5210
      2400      5213
      24df         0
      2552       420
      2593       595
      25d4       771
      2618       943
      2656      1319
      2703      2069
      27d6      2432
      283a      4899
      28fb      1533

Safepoints (stack slots = 136, entries = 1, byte size = 31)
0x1863c40f3f31    2b1  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 58)
0x1863c40f3f2d  internal wasm call
0x1863c40f403e  internal wasm call
0x1863c40f4132  internal wasm call
0x1863c40f4232  internal wasm call
0x1863c40f4333  internal wasm call
0x1863c40f4623  external reference (0x193f2f0)
0x1863c40f5ff5  internal wasm call
0x1863c40f601b  internal wasm call
0x1863c40f6160  wasm stub call  (0x1863c401a4d0)
0x1863c40f61e3  wasm stub call  (0x1863c401a4d0)
0x1863c40f6224  wasm stub call  (0x1863c401a4d0)
0x1863c40f6265  wasm stub call  (0x1863c401a4d0)
0x1863c40f62a9  wasm stub call  (0x1863c401a4d0)
0x1863c40f62db  wasm stub call  (0x1863c401a4d0)
0x1863c40f63c4  wasm stub call  (0x1863c401a4d0)
0x1863c40f6473  wasm stub call  (0x1863c401a4d0)
0x1863c40f64e6  wasm stub call  (0x1863c401a4d0)
0x1863c40f657c  wasm stub call  (0x1863c401a210)
