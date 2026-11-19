name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 9664 = 9644 + 20 padding)
Instructions (size = 9620)
0x3558f1e1be80     0  55                   push rbp
0x3558f1e1be81     1  4889e5               REX.W movq rbp,rsp
0x3558f1e1be84     4  6a08                 push 0x8
0x3558f1e1be86     6  56                   push rsi
0x3558f1e1be87     7  4881ec28020000       REX.W subq rsp,0x228
0x3558f1e1be8e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3558f1e1be92    12  488945d8             REX.W movq [rbp-0x28],rax
0x3558f1e1be96    16  4c895dc0             REX.W movq [rbp-0x40],r11
0x3558f1e1be9a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1be9e    1e  0f866d220000         jna 0x3558f1e1e111  <+0x2291>
0x3558f1e1bea4    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x3558f1e1bea8    28  458b3c24             movl r15,[r12]
0x3558f1e1beac    2c  418d9fc0feffff       leal rbx,[r15-0x140]
0x3558f1e1beb3    33  41891c24             movl [r12],rbx
0x3558f1e1beb7    37  448bf8               movl r15,rax
0x3558f1e1beba    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x3558f1e1bec1    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x3558f1e1bec7    47  c5fa16d0             vmovshdup xmm2,xmm0
0x3558f1e1becb    4b  41ba0000803a         movl r10,0x3a800000
0x3558f1e1bed1    51  c4c1796eea           vmovd xmm5,r10
0x3558f1e1bed6    56  c5ea59f5             vmulss xmm6,xmm2,xmm5
0x3558f1e1beda    5a  c5f828c8             vmovaps xmm1,xmm0
0x3558f1e1bede    5e  c5d259e9             vmulss xmm5,xmm5,xmm1
0x3558f1e1bee2    62  c4817a10bc3ba0000000 vmovss xmm7,[r11+r15*1+0xa0]
0x3558f1e1beec    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x3558f1e1bef0    70  48895de0             REX.W movq [rbp-0x20],rbx
0x3558f1e1bef4    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x3558f1e1befb    7b  c5fb119578ffffff     vmovsd [rbp-0x88],xmm2
0x3558f1e1bf03    83  c5fb114d80           vmovsd [rbp-0x80],xmm1
0x3558f1e1bf08    88  c5f82eff             vucomiss xmm7,xmm7
0x3558f1e1bf0c    8c  7a06                 jpe 0x3558f1e1bf14  <+0x94>
0x3558f1e1bf0e    8e  0f8404000000         jz 0x3558f1e1bf18  <+0x98>
0x3558f1e1bf14    94  c5f928fd             vmovapd xmm7,xmm5
0x3558f1e1bf18    98  c5f82eed             vucomiss xmm5,xmm5
0x3558f1e1bf1c    9c  7a06                 jpe 0x3558f1e1bf24  <+0xa4>
0x3558f1e1bf1e    9e  0f8404000000         jz 0x3558f1e1bf28  <+0xa8>
0x3558f1e1bf24    a4  c5f928ef             vmovapd xmm5,xmm7
0x3558f1e1bf28    a8  c5f82efd             vucomiss xmm7,xmm5
0x3558f1e1bf2c    ac  0f8704000000         ja 0x3558f1e1bf36  <+0xb6>
0x3558f1e1bf32    b2  c5f928fd             vmovapd xmm7,xmm5
0x3558f1e1bf36    b6  c5f82eff             vucomiss xmm7,xmm7
0x3558f1e1bf3a    ba  7a06                 jpe 0x3558f1e1bf42  <+0xc2>
0x3558f1e1bf3c    bc  0f8409000000         jz 0x3558f1e1bf4b  <+0xcb>
0x3558f1e1bf42    c2  c5f928ee             vmovapd xmm5,xmm6
0x3558f1e1bf46    c6  e904000000           jmp 0x3558f1e1bf4f  <+0xcf>
0x3558f1e1bf4b    cb  c5f928ef             vmovapd xmm5,xmm7
0x3558f1e1bf4f    cf  c5f82ef6             vucomiss xmm6,xmm6
0x3558f1e1bf53    d3  7a06                 jpe 0x3558f1e1bf5b  <+0xdb>
0x3558f1e1bf55    d5  0f8404000000         jz 0x3558f1e1bf5f  <+0xdf>
0x3558f1e1bf5b    db  c5f928f5             vmovapd xmm6,xmm5
0x3558f1e1bf5f    df  c5f82eee             vucomiss xmm5,xmm6
0x3558f1e1bf63    e3  0f8704000000         ja 0x3558f1e1bf6d  <+0xed>
0x3558f1e1bf69    e9  c5f928ee             vmovapd xmm5,xmm6
0x3558f1e1bf6d    ed  41ba0020803f         movl r10,0x3f802000
0x3558f1e1bf73    f3  c4c1796ef2           vmovd xmm6,r10
0x3558f1e1bf78    f8  c5ca59ed             vmulss xmm5,xmm6,xmm5
0x3558f1e1bf7c    fc  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x3558f1e1bf80   100  c5c972f619           vpslld xmm6,xmm6,25
0x3558f1e1bf85   105  c5c972d602           vpsrld xmm6,xmm6,2
0x3558f1e1bf8a   10a  c5ca5eed             vdivss xmm5,xmm6,xmm5
0x3558f1e1bf8e   10e  c5f828ed             vmovaps xmm5,xmm5
0x3558f1e1bf92   112  c4817a11ac3b84000000 vmovss [r11+r15*1+0x84],xmm5
0x3558f1e1bf9c   11c  c4e27918fd           vbroadcastss xmm7,xmm5
0x3558f1e1bfa1   121  c5f859c7             vmulps xmm0,xmm0,xmm7
0x3558f1e1bfa5   125  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x3558f1e1bfab   12b  c5f828f8             vmovaps xmm7,xmm0
0x3558f1e1bfaf   12f  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x3558f1e1bfb3   133  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x3558f1e1bfb9   139  c4417b2cf1           vcvttsd2si r14,xmm9
0x3558f1e1bfbe   13e  4585f6               testl r14,r14
0x3558f1e1bfc1   141  0f892b000000         jns 0x3558f1e1bff2  <+0x172>
0x3558f1e1bfc7   147  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3558f1e1bfd1   151  c441f96efa           vmovq xmm15,r10
0x3558f1e1bfd6   156  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x3558f1e1bfdb   15b  c4417b2cf7           vcvttsd2si r14,xmm15
0x3558f1e1bfe0   160  4585f6               testl r14,r14
0x3558f1e1bfe3   163  0f8809000000         js 0x3558f1e1bff2  <+0x172>
0x3558f1e1bfe9   169  41ba00000080         movl r10,0x80000000
0x3558f1e1bfef   16f  450bf2               orl r14,r10
0x3558f1e1bff2   172  458bd6               movl r10,r14
0x3558f1e1bff5   175  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x3558f1e1bffa   17a  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1c002   182  c441792ed1           vucomisd xmm10,xmm9
0x3558f1e1c007   187  0f8a19210000         jpe 0x3558f1e1e126  <+0x22a6>
0x3558f1e1c00d   18d  0f8513210000         jnz 0x3558f1e1e126  <+0x22a6>
0x3558f1e1c013   193  c4c1796efe           vmovd xmm7,r14
0x3558f1e1c018   198  c5f970ff00           vpshufd xmm7,xmm7,0x0
0x3558f1e1c01d   19d  c57a16c0             vmovshdup xmm8,xmm0
0x3558f1e1c021   1a1  c4413a5ac8           vcvtss2sd xmm9,xmm8,xmm8
0x3558f1e1c026   1a6  c443290bd10b         vroundsd xmm10,xmm10,xmm9,0xb
0x3558f1e1c02c   1ac  c4417b2cf2           vcvttsd2si r14,xmm10
0x3558f1e1c031   1b1  4585f6               testl r14,r14
0x3558f1e1c034   1b4  0f8928000000         jns 0x3558f1e1c062  <+0x1e2>
0x3558f1e1c03a   1ba  4c8b1588ffffff       REX.W movq r10,[rip+0xffffff88]
0x3558f1e1c041   1c1  c441f96efa           vmovq xmm15,r10
0x3558f1e1c046   1c6  c4410358fa           vaddsd xmm15,xmm15,xmm10
0x3558f1e1c04b   1cb  c4417b2cf7           vcvttsd2si r14,xmm15
0x3558f1e1c050   1d0  4585f6               testl r14,r14
0x3558f1e1c053   1d3  0f8809000000         js 0x3558f1e1c062  <+0x1e2>
0x3558f1e1c059   1d9  41ba00000080         movl r10,0x80000000
0x3558f1e1c05f   1df  450bf2               orl r14,r10
0x3558f1e1c062   1e2  458bd6               movl r10,r14
0x3558f1e1c065   1e5  c441832ada           vcvtqsi2sd xmm11,xmm15,r10
0x3558f1e1c06a   1ea  c441792eda           vucomisd xmm11,xmm10
0x3558f1e1c06f   1ef  0f8ae8200000         jpe 0x3558f1e1e15d  <+0x22dd>
0x3558f1e1c075   1f5  0f85e2200000         jnz 0x3558f1e1e15d  <+0x22dd>
0x3558f1e1c07b   1fb  c4c34122fe01         vpinsrd xmm7,xmm7,r14,0x1
0x3558f1e1c081   201  49ba0100000001000000 REX.W movq r10,0x100000001
0x3558f1e1c08b   20b  c441f96ec2           vmovq xmm8,r10
0x3558f1e1c090   210  c441396cc0           vpunpcklqdq xmm8,xmm8,xmm8
0x3558f1e1c095   215  c4c2413ff8           vpmaxud xmm7,xmm7,xmm8
0x3558f1e1c09a   21a  c44131efc9           vpxor xmm9,xmm9,xmm9
0x3558f1e1c09f   21f  c530c2d002           vcmpps xmm10,xmm9,xmm0, (le)
0x3558f1e1c0a4   224  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x3558f1e1c0ae   22e  c441f96eda           vmovq xmm11,r10
0x3558f1e1c0b3   233  c441216cdb           vpunpcklqdq xmm11,xmm11,xmm11
0x3558f1e1c0b8   238  c4c178c2c301         vcmpps xmm0,xmm0,xmm11, (lt)
0x3558f1e1c0be   23e  c5a9dbc0             vpand xmm0,xmm10,xmm0
0x3558f1e1c0c2   242  c44179dff8           vpandn xmm15,xmm0,xmm8
0x3558f1e1c0c7   247  c5c1dbc0             vpand xmm0,xmm7,xmm0
0x3558f1e1c0cb   24b  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x3558f1e1c0d0   250  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x3558f1e1c0d7   257  c4817813043e         vmovlps [r14+r15*1],xmm0
0x3558f1e1c0dd   25d  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x3558f1e1c0e5   265  4589741b38           movl [r11+rbx*1+0x38],r14
0x3558f1e1c0ea   26a  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x3558f1e1c0f2   272  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x3558f1e1c0f7   277  448d7060             leal r14,[rax+0x60]
0x3558f1e1c0fb   27b  438b543b04           movl rdx,[r11+r15*1+0x4]
0x3558f1e1c100   280  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x3558f1e1c105   285  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x3558f1e1c10a   28a  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x3558f1e1c10f   28f  c5781185b0feffff     vmovups [rbp-0x150],xmm8
0x3558f1e1c117   297  c578118d60ffffff     vmovups [rbp-0xa0],xmm9
0x3558f1e1c11f   29f  418bc6               movl rax,r14
0x3558f1e1c122   2a2  8bdf                 movl rbx,rdi
0x3558f1e1c124   2a4  e8cf6bf2ff           call 0x3558f1d42cf8  (jump table)
0x3558f1e1c129   2a9  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1c12d   2ad  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1c134   2b4  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x3558f1e1c13d   2bd  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1c141   2c1  418d97a0000000       leal rdx,[r15+0xa0]
0x3558f1e1c148   2c8  478b74237c           movl r14,[r11+r12*1+0x7c]
0x3558f1e1c14d   2cd  438b842380000000     movl rax,[r11+r12*1+0x80]
0x3558f1e1c155   2d5  418d0486             leal rax,[r14+rax*4]
0x3558f1e1c159   2d9  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x3558f1e1c15e   2de  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x3558f1e1c163   2e3  418d7730             leal rsi,[r15+0x30]
0x3558f1e1c167   2e7  48895588             REX.W movq [rbp-0x78],rdx
0x3558f1e1c16b   2eb  4c8975a0             REX.W movq [rbp-0x60],r14
0x3558f1e1c16f   2ef  48894590             REX.W movq [rbp-0x70],rax
0x3558f1e1c173   2f3  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1c177   2f7  48894db8             REX.W movq [rbp-0x48],rcx
0x3558f1e1c17b   2fb  488975a8             REX.W movq [rbp-0x58],rsi
0x3558f1e1c17f   2ff  458bc6               movl r8,r14
0x3558f1e1c182   302  33ff                 xorl rdi,rdi
0x3558f1e1c184   304  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1c18c   30c  660f1f840000000000   nop
0x3558f1e1c195   315  660f1f840000000000   nop
0x3558f1e1c19e   31e  660f1f840000000000   nop
0x3558f1e1c1a7   327  660f1f840000000000   nop
0x3558f1e1c1b0   330  660f1f840000000000   nop
0x3558f1e1c1b9   339  0f1f8000000000       nop
0x3558f1e1c1c0   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1c1c4   344  0f86bd1f0000         jna 0x3558f1e1e187  <+0x2307>
0x3558f1e1c1ca   34a  443b4590             cmpl r8,[rbp-0x70]
0x3558f1e1c1ce   34e  0f8422000000         jz 0x3558f1e1c1f6  <+0x376>
0x3558f1e1c1d4   354  478b0c03             movl r9,[r11+r8*1]
0x3558f1e1c1d8   358  4183c004             addl r8,0x4
0x3558f1e1c1dc   35c  413bd9               cmpl rbx,r9
0x3558f1e1c1df   35f  76df                 jna 0x3558f1e1c1c0  <+0x340>
0x3558f1e1c1e1   361  468d0c89             leal r9,[rcx+r9*4]
0x3558f1e1c1e5   365  c4817a102c0b         vmovss xmm5,[r11+r9*1]
0x3558f1e1c1eb   36b  41b901000000         movl r9,0x1
0x3558f1e1c1f1   371  e907000000           jmp 0x3558f1e1c1fd  <+0x37d>
0x3558f1e1c1f6   376  4533c9               xorl r9,r9
0x3558f1e1c1f9   379  448b4590             movl r8,[rbp-0x70]
0x3558f1e1c1fd   37d  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1c205   385  4c8945d0             REX.W movq [rbp-0x30],r8
0x3558f1e1c209   389  4183f901             cmpl r9,0x1
0x3558f1e1c20d   38d  0f856f000000         jnz 0x3558f1e1c282  <+0x402>
0x3558f1e1c213   393  478b4c2330           movl r9,[r11+r12*1+0x30]
0x3558f1e1c218   398  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x3558f1e1c21d   39d  0f8540000000         jnz 0x3558f1e1c263  <+0x3e3>
0x3558f1e1c223   3a3  b901000000           movl rcx,0x1
0x3558f1e1c228   3a8  48897db0             REX.W movq [rbp-0x50],rdi
0x3558f1e1c22c   3ac  8bc6                 movl rax,rsi
0x3558f1e1c22e   3ae  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1c232   3b2  8bd7                 movl rdx,rdi
0x3558f1e1c234   3b4  4c8bc9               REX.W movq r9,rcx
0x3558f1e1c237   3b7  e8c46af2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1c23c   3bc  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1c240   3c0  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1c247   3c7  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1c24b   3cb  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1c253   3d3  448b45d0             movl r8,[rbp-0x30]
0x3558f1e1c257   3d7  8b7db0               movl rdi,[rbp-0x50]
0x3558f1e1c25a   3da  8b75a8               movl rsi,[rbp-0x58]
0x3558f1e1c25d   3dd  8b4db8               movl rcx,[rbp-0x48]
0x3558f1e1c260   3e0  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1c263   3e3  448d7701             leal r14,[rdi+0x1]
0x3558f1e1c267   3e7  4789742338           movl [r11+r12*1+0x38],r14
0x3558f1e1c26c   3ec  438b442334           movl rax,[r11+r12*1+0x34]
0x3558f1e1c271   3f1  8d04b8               leal rax,[rax+rdi*4]
0x3558f1e1c274   3f4  c4c17a112c03         vmovss [r11+rax*1],xmm5
0x3558f1e1c27a   3fa  418bfe               movl rdi,r14
0x3558f1e1c27d   3fd  e93effffff           jmp 0x3558f1e1c1c0  <+0x340>
0x3558f1e1c282   402  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x3558f1e1c28b   40b  478b742314           movl r14,[r11+r12*1+0x14]
0x3558f1e1c290   410  438b442310           movl rax,[r11+r12*1+0x10]
0x3558f1e1c295   415  418d5f3c             leal rbx,[r15+0x3c]
0x3558f1e1c299   419  4c8975b0             REX.W movq [rbp-0x50],r14
0x3558f1e1c29d   41d  48894598             REX.W movq [rbp-0x68],rax
0x3558f1e1c2a1   421  48895da8             REX.W movq [rbp-0x58],rbx
0x3558f1e1c2a5   425  8b4da0               movl rcx,[rbp-0x60]
0x3558f1e1c2a8   428  33d2                 xorl rdx,rdx
0x3558f1e1c2aa   42a  660f1f840000000000   nop
0x3558f1e1c2b3   433  660f1f840000000000   nop
0x3558f1e1c2bc   43c  0f1f4000             nop
0x3558f1e1c2c0   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1c2c4   444  0f86fe1e0000         jna 0x3558f1e1e1c8  <+0x2348>
0x3558f1e1c2ca   44a  3b4d90               cmpl rcx,[rbp-0x70]
0x3558f1e1c2cd   44d  0f841f000000         jz 0x3558f1e1c2f2  <+0x472>
0x3558f1e1c2d3   453  418b340b             movl rsi,[r11+rcx*1]
0x3558f1e1c2d7   457  83c104               addl rcx,0x4
0x3558f1e1c2da   45a  443bf6               cmpl r14,rsi
0x3558f1e1c2dd   45d  76e1                 jna 0x3558f1e1c2c0  <+0x440>
0x3558f1e1c2df   45f  8d34b0               leal rsi,[rax+rsi*4]
0x3558f1e1c2e2   462  c4c17a102c33         vmovss xmm5,[r11+rsi*1]
0x3558f1e1c2e8   468  be01000000           movl rsi,0x1
0x3558f1e1c2ed   46d  e905000000           jmp 0x3558f1e1c2f7  <+0x477>
0x3558f1e1c2f2   472  33f6                 xorl rsi,rsi
0x3558f1e1c2f4   474  8b4d90               movl rcx,[rbp-0x70]
0x3558f1e1c2f7   477  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1c2ff   47f  48894db8             REX.W movq [rbp-0x48],rcx
0x3558f1e1c303   483  83fe01               cmpl rsi,0x1
0x3558f1e1c306   486  0f8568000000         jnz 0x3558f1e1c374  <+0x4f4>
0x3558f1e1c30c   48c  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x3558f1e1c311   491  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x3558f1e1c316   496  0f853b000000         jnz 0x3558f1e1c357  <+0x4d7>
0x3558f1e1c31c   49c  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1c320   4a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1c324   4a4  8bc3                 movl rax,rbx
0x3558f1e1c326   4a6  b901000000           movl rcx,0x1
0x3558f1e1c32b   4ab  e8d069f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1c330   4b0  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1c334   4b4  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1c33b   4bb  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1c33f   4bf  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1c347   4c7  8b4db8               movl rcx,[rbp-0x48]
0x3558f1e1c34a   4ca  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1c34d   4cd  8b5da8               movl rbx,[rbp-0x58]
0x3558f1e1c350   4d0  8b4598               movl rax,[rbp-0x68]
0x3558f1e1c353   4d3  448b75b0             movl r14,[rbp-0x50]
0x3558f1e1c357   4d7  8d7201               leal rsi,[rdx+0x1]
0x3558f1e1c35a   4da  4389742344           movl [r11+r12*1+0x44],rsi
0x3558f1e1c35f   4df  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x3558f1e1c364   4e4  8d1497               leal rdx,[rdi+rdx*4]
0x3558f1e1c367   4e7  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3558f1e1c36d   4ed  8bd6                 movl rdx,rsi
0x3558f1e1c36f   4ef  e94cffffff           jmp 0x3558f1e1c2c0  <+0x440>
0x3558f1e1c374   4f4  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x3558f1e1c37d   4fd  478b742320           movl r14,[r11+r12*1+0x20]
0x3558f1e1c382   502  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3558f1e1c387   507  418d5f48             leal rbx,[r15+0x48]
0x3558f1e1c38b   50b  4c897598             REX.W movq [rbp-0x68],r14
0x3558f1e1c38f   50f  488945b8             REX.W movq [rbp-0x48],rax
0x3558f1e1c393   513  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1c397   517  8b4da0               movl rcx,[rbp-0x60]
0x3558f1e1c39a   51a  33d2                 xorl rdx,rdx
0x3558f1e1c39c   51c  660f1f840000000000   nop
0x3558f1e1c3a5   525  660f1f840000000000   nop
0x3558f1e1c3ae   52e  660f1f840000000000   nop
0x3558f1e1c3b7   537  660f1f840000000000   nop
0x3558f1e1c3c0   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1c3c4   544  0f863f1e0000         jna 0x3558f1e1e209  <+0x2389>
0x3558f1e1c3ca   54a  3b4d90               cmpl rcx,[rbp-0x70]
0x3558f1e1c3cd   54d  0f841f000000         jz 0x3558f1e1c3f2  <+0x572>
0x3558f1e1c3d3   553  418b340b             movl rsi,[r11+rcx*1]
0x3558f1e1c3d7   557  83c104               addl rcx,0x4
0x3558f1e1c3da   55a  443bf6               cmpl r14,rsi
0x3558f1e1c3dd   55d  76e1                 jna 0x3558f1e1c3c0  <+0x540>
0x3558f1e1c3df   55f  8d34b0               leal rsi,[rax+rsi*4]
0x3558f1e1c3e2   562  c4c17a102c33         vmovss xmm5,[r11+rsi*1]
0x3558f1e1c3e8   568  be01000000           movl rsi,0x1
0x3558f1e1c3ed   56d  e905000000           jmp 0x3558f1e1c3f7  <+0x577>
0x3558f1e1c3f2   572  33f6                 xorl rsi,rsi
0x3558f1e1c3f4   574  8b4d90               movl rcx,[rbp-0x70]
0x3558f1e1c3f7   577  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1c3ff   57f  48894db0             REX.W movq [rbp-0x50],rcx
0x3558f1e1c403   583  83fe01               cmpl rsi,0x1
0x3558f1e1c406   586  0f8568000000         jnz 0x3558f1e1c474  <+0x5f4>
0x3558f1e1c40c   58c  438b742348           movl rsi,[r11+r12*1+0x48]
0x3558f1e1c411   591  4339542348           cmpl [r11+r12*1+0x48],rdx
0x3558f1e1c416   596  0f853b000000         jnz 0x3558f1e1c457  <+0x5d7>
0x3558f1e1c41c   59c  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1c420   5a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1c424   5a4  8bc3                 movl rax,rbx
0x3558f1e1c426   5a6  b901000000           movl rcx,0x1
0x3558f1e1c42b   5ab  e8d068f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1c430   5b0  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1c434   5b4  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1c43b   5bb  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1c443   5c3  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1c447   5c7  8b4db0               movl rcx,[rbp-0x50]
0x3558f1e1c44a   5ca  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1c44d   5cd  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1c450   5d0  8b45b8               movl rax,[rbp-0x48]
0x3558f1e1c453   5d3  448b7598             movl r14,[rbp-0x68]
0x3558f1e1c457   5d7  8d7201               leal rsi,[rdx+0x1]
0x3558f1e1c45a   5da  4389742350           movl [r11+r12*1+0x50],rsi
0x3558f1e1c45f   5df  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x3558f1e1c464   5e4  8d1497               leal rdx,[rdi+rdx*4]
0x3558f1e1c467   5e7  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3558f1e1c46d   5ed  8bd6                 movl rdx,rsi
0x3558f1e1c46f   5ef  e94cffffff           jmp 0x3558f1e1c3c0  <+0x540>
0x3558f1e1c474   5f4  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x3558f1e1c47d   5fd  478b74232c           movl r14,[r11+r12*1+0x2c]
0x3558f1e1c482   602  438b442328           movl rax,[r11+r12*1+0x28]
0x3558f1e1c487   607  4183c754             addl r15,0x54
0x3558f1e1c48b   60b  4c8975b8             REX.W movq [rbp-0x48],r14
0x3558f1e1c48f   60f  488945c8             REX.W movq [rbp-0x38],rax
0x3558f1e1c493   613  4c897dd8             REX.W movq [rbp-0x28],r15
0x3558f1e1c497   617  33d2                 xorl rdx,rdx
0x3558f1e1c499   619  8b5da0               movl rbx,[rbp-0x60]
0x3558f1e1c49c   61c  660f1f840000000000   nop
0x3558f1e1c4a5   625  660f1f840000000000   nop
0x3558f1e1c4ae   62e  660f1f840000000000   nop
0x3558f1e1c4b7   637  660f1f840000000000   nop
0x3558f1e1c4c0   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1c4c4   644  0f86801d0000         jna 0x3558f1e1e24a  <+0x23ca>
0x3558f1e1c4ca   64a  3b5d90               cmpl rbx,[rbp-0x70]
0x3558f1e1c4cd   64d  0f841f000000         jz 0x3558f1e1c4f2  <+0x672>
0x3558f1e1c4d3   653  418b0c1b             movl rcx,[r11+rbx*1]
0x3558f1e1c4d7   657  83c304               addl rbx,0x4
0x3558f1e1c4da   65a  443bf1               cmpl r14,rcx
0x3558f1e1c4dd   65d  76e1                 jna 0x3558f1e1c4c0  <+0x640>
0x3558f1e1c4df   65f  8d0c88               leal rcx,[rax+rcx*4]
0x3558f1e1c4e2   662  c4c17a102c0b         vmovss xmm5,[r11+rcx*1]
0x3558f1e1c4e8   668  b901000000           movl rcx,0x1
0x3558f1e1c4ed   66d  e905000000           jmp 0x3558f1e1c4f7  <+0x677>
0x3558f1e1c4f2   672  33c9                 xorl rcx,rcx
0x3558f1e1c4f4   674  8b5d90               movl rbx,[rbp-0x70]
0x3558f1e1c4f7   677  48895da0             REX.W movq [rbp-0x60],rbx
0x3558f1e1c4fb   67b  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1c503   683  83f901               cmpl rcx,0x1
0x3558f1e1c506   686  0f8566000000         jnz 0x3558f1e1c572  <+0x6f2>
0x3558f1e1c50c   68c  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x3558f1e1c511   691  4339542354           cmpl [r11+r12*1+0x54],rdx
0x3558f1e1c516   696  0f8539000000         jnz 0x3558f1e1c555  <+0x6d5>
0x3558f1e1c51c   69c  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1c520   6a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1c524   6a4  418bc7               movl rax,r15
0x3558f1e1c527   6a7  b901000000           movl rcx,0x1
0x3558f1e1c52c   6ac  e8cf67f2ff           call 0x3558f1d42d00  (jump table)
0x3558f1e1c531   6b1  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1c535   6b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1c53c   6bc  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1c53f   6bf  8b5da0               movl rbx,[rbp-0x60]
0x3558f1e1c542   6c2  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1c54a   6ca  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1c54e   6ce  8b45c8               movl rax,[rbp-0x38]
0x3558f1e1c551   6d1  448b75b8             movl r14,[rbp-0x48]
0x3558f1e1c555   6d5  8d4a01               leal rcx,[rdx+0x1]
0x3558f1e1c558   6d8  43894c235c           movl [r11+r12*1+0x5c],rcx
0x3558f1e1c55d   6dd  438b742358           movl rsi,[r11+r12*1+0x58]
0x3558f1e1c562   6e2  8d1496               leal rdx,[rsi+rdx*4]
0x3558f1e1c565   6e5  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3558f1e1c56b   6eb  8bd1                 movl rdx,rcx
0x3558f1e1c56d   6ed  e94effffff           jmp 0x3558f1e1c4c0  <+0x640>
0x3558f1e1c572   6f2  478b7c2338           movl r15,[r11+r12*1+0x38]
0x3558f1e1c577   6f7  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x3558f1e1c57e   6fe  c4817a6f2c23         vmovdqu xmm5,[r11+r12*1]
0x3558f1e1c584   704  c4817a7f6c2330       vmovdqu [r11+r12*1+0x30],xmm5
0x3558f1e1c58b   70b  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x3558f1e1c591   711  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x3558f1e1c598   718  c4817a6f6c2310       vmovdqu xmm5,[r11+r12*1+0x10]
0x3558f1e1c59f   71f  c4817a7f6c2340       vmovdqu [r11+r12*1+0x40],xmm5
0x3558f1e1c5a6   726  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x3558f1e1c5ad   72d  4f8b742350           REX.W movq r14,[r11+r12*1+0x50]
0x3558f1e1c5b2   732  438b442358           movl rax,[r11+r12*1+0x58]
0x3558f1e1c5b7   737  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x3558f1e1c5be   73e  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x3558f1e1c5c5   745  438b5c232c           movl rbx,[r11+r12*1+0x2c]
0x3558f1e1c5ca   74a  438954232c           movl [r11+r12*1+0x2c],rdx
0x3558f1e1c5cf   74f  4389442328           movl [r11+r12*1+0x28],rax
0x3558f1e1c5d4   754  4f89742320           REX.W movq [r11+r12*1+0x20],r14
0x3558f1e1c5d9   759  4c897dd8             REX.W movq [rbp-0x28],r15
0x3558f1e1c5dd   75d  4585ff               testl r15,r15
0x3558f1e1c5e0   760  0f8517000000         jnz 0x3558f1e1c5fd  <+0x77d>
0x3558f1e1c5e6   766  448b75e0             movl r14,[rbp-0x20]
0x3558f1e1c5ea   76a  458d9e40010000       leal r11,[r14+0x140]
0x3558f1e1c5f1   771  488b45e8             REX.W movq rax,[rbp-0x18]
0x3558f1e1c5f5   775  448918               movl [rax],r11
0x3558f1e1c5f8   778  488be5               REX.W movq rsp,rbp
0x3558f1e1c5fb   77b  5d                   pop rbp
0x3558f1e1c5fc   77c  c3                   retl
0x3558f1e1c5fd   77d  478b742350           movl r14,[r11+r12*1+0x50]
0x3558f1e1c602   782  438b442344           movl rax,[r11+r12*1+0x44]
0x3558f1e1c607   787  438b542338           movl rdx,[r11+r12*1+0x38]
0x3558f1e1c60c   78c  8bca                 movl rcx,rdx
0x3558f1e1c60e   78e  3bc2                 cmpl rax,rdx
0x3558f1e1c610   790  0f42c8               cmovcl rcx,rax
0x3558f1e1c613   793  8bc1                 movl rax,rcx
0x3558f1e1c615   795  443bf1               cmpl r14,rcx
0x3558f1e1c618   798  410f42c6             cmovcl rax,r14
0x3558f1e1c61c   79c  478b742358           movl r14,[r11+r12*1+0x58]
0x3558f1e1c621   7a1  438b54234c           movl rdx,[r11+r12*1+0x4c]
0x3558f1e1c626   7a6  438b4c2340           movl rcx,[r11+r12*1+0x40]
0x3558f1e1c62b   7ab  438b742334           movl rsi,[r11+r12*1+0x34]
0x3558f1e1c630   7b0  438b7c235c           movl rdi,[r11+r12*1+0x5c]
0x3558f1e1c635   7b5  c4817a108423a0000000 vmovss xmm0,[r11+r12*1+0xa0]
0x3558f1e1c63f   7bf  c5fa59d0             vmulss xmm2,xmm0,xmm0
0x3558f1e1c643   7c3  c4e27918c2           vbroadcastss xmm0,xmm2
0x3558f1e1c648   7c8  c4817a10ac23a4000000 vmovss xmm5,[r11+r12*1+0xa4]
0x3558f1e1c652   7d2  c5d259cd             vmulss xmm1,xmm5,xmm5
0x3558f1e1c656   7d6  c4e27918e9           vbroadcastss xmm5,xmm1
0x3558f1e1c65b   7db  48894598             REX.W movq [rbp-0x68],rax
0x3558f1e1c65f   7df  4c8975b8             REX.W movq [rbp-0x48],r14
0x3558f1e1c663   7e3  488955b0             REX.W movq [rbp-0x50],rdx
0x3558f1e1c667   7e7  48894da8             REX.W movq [rbp-0x58],rcx
0x3558f1e1c66b   7eb  488975a0             REX.W movq [rbp-0x60],rsi
0x3558f1e1c66f   7ef  4889bd70ffffff       REX.W movq [rbp-0x90],rdi
0x3558f1e1c676   7f6  c5fb119518ffffff     vmovsd [rbp-0xe8],xmm2
0x3558f1e1c67e   7fe  c5f81185a0feffff     vmovups [rbp-0x160],xmm0
0x3558f1e1c686   806  c5fb118d10ffffff     vmovsd [rbp-0xf0],xmm1
0x3558f1e1c68e   80e  c5f811ad90feffff     vmovups [rbp-0x170],xmm5
0x3558f1e1c696   816  4533c9               xorl r9,r9
0x3558f1e1c699   819  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1c69d   81d  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3558f1e1c6a1   821  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1c6a5   825  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1c6aa   82a  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1c6af   82f  c5781085b0feffff     vmovups xmm8,[rbp-0x150]
0x3558f1e1c6b7   837  498bd9               REX.W movq rbx,r9
0x3558f1e1c6ba   83a  660f1f440000         nop
0x3558f1e1c6c0   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1c6c4   844  0f86be1b0000         jna 0x3558f1e1e288  <+0x2408>
0x3558f1e1c6ca   84a  478b7c2308           movl r15,[r11+r12*1+0x8]
0x3558f1e1c6cf   84f  4c89bd38feffff       REX.W movq [rbp-0x1c8],r15
0x3558f1e1c6d6   856  443bfb               cmpl r15,rbx
0x3558f1e1c6d9   859  0f860a1a0000         jna 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1c6df   85f  478b7c2314           movl r15,[r11+r12*1+0x14]
0x3558f1e1c6e4   864  4c89bd00feffff       REX.W movq [rbp-0x200],r15
0x3558f1e1c6eb   86b  443bfb               cmpl r15,rbx
0x3558f1e1c6ee   86e  0f86f5190000         jna 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1c6f4   874  478b7c2320           movl r15,[r11+r12*1+0x20]
0x3558f1e1c6f9   879  4c89bdf8fdffff       REX.W movq [rbp-0x208],r15
0x3558f1e1c700   880  443bfb               cmpl r15,rbx
0x3558f1e1c703   883  0f86e0190000         jna 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1c709   889  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3558f1e1c70e   88e  4c89bdd8fdffff       REX.W movq [rbp-0x228],r15
0x3558f1e1c715   895  443bfb               cmpl r15,rbx
0x3558f1e1c718   898  0f86cb190000         jna 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1c71e   89e  478b7c2304           movl r15,[r11+r12*1+0x4]
0x3558f1e1c723   8a3  458d349f             leal r14,[r15+rbx*4]
0x3558f1e1c727   8a7  c4817a101c33         vmovss xmm3,[r11+r14*1]
0x3558f1e1c72d   8ad  478b742310           movl r14,[r11+r12*1+0x10]
0x3558f1e1c732   8b2  4c89bd48feffff       REX.W movq [rbp-0x1b8],r15
0x3558f1e1c739   8b9  458d3c9e             leal r15,[r14+rbx*4]
0x3558f1e1c73d   8bd  c4817a10243b         vmovss xmm4,[r11+r15*1]
0x3558f1e1c743   8c3  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3558f1e1c748   8c8  4c89b550feffff       REX.W movq [rbp-0x1b0],r14
0x3558f1e1c74f   8cf  458d349f             leal r14,[r15+rbx*4]
0x3558f1e1c753   8d3  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x3558f1e1c759   8d9  478b742328           movl r14,[r11+r12*1+0x28]
0x3558f1e1c75e   8de  4c89bd60feffff       REX.W movq [rbp-0x1a0],r15
0x3558f1e1c765   8e5  458d3c9e             leal r15,[r14+rbx*4]
0x3558f1e1c769   8e9  4c89b558feffff       REX.W movq [rbp-0x1a8],r14
0x3558f1e1c770   8f0  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x3558f1e1c776   8f6  448b75e0             movl r14,[rbp-0x20]
0x3558f1e1c77a   8fa  c4017a1154330c       vmovss [r11+r14*1+0xc],xmm10
0x3558f1e1c781   901  c4017a114c3308       vmovss [r11+r14*1+0x8],xmm9
0x3558f1e1c788   908  c4817a11643304       vmovss [r11+r14*1+0x4],xmm4
0x3558f1e1c78f   90f  c4817a111c33         vmovss [r11+r14*1],xmm3
0x3558f1e1c795   915  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x3558f1e1c79e   91e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x3558f1e1c7a7   927  c44131efc9           vpxor xmm9,xmm9,xmm9
0x3558f1e1c7ac   92c  c4017a7f4c3310       vmovdqu [r11+r14*1+0x10],xmm9
0x3558f1e1c7b3   933  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x3558f1e1c7bb   93b  4c89bdf0fdffff       REX.W movq [rbp-0x210],r15
0x3558f1e1c7c2   942  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x3558f1e1c7ca   94a  c4017a108c2384000000 vmovss xmm9,[r11+r12*1+0x84]
0x3558f1e1c7d4   954  458d5e40             leal r11,[r14+0x40]
0x3558f1e1c7d8   958  4989e2               REX.W movq r10,rsp
0x3558f1e1c7db   95b  4883ec08             REX.W subq rsp,0x8
0x3558f1e1c7df   95f  4883e4f0             REX.W andq rsp,0xf0
0x3558f1e1c7e3   963  4c891424             REX.W movq [rsp],r10
0x3558f1e1c7e7   967  48895dd0             REX.W movq [rbp-0x30],rbx
0x3558f1e1c7eb   96b  c5fb119d00ffffff     vmovsd [rbp-0x100],xmm3
0x3558f1e1c7f3   973  c5fb11a508ffffff     vmovsd [rbp-0xf8],xmm4
0x3558f1e1c7fb   97b  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x3558f1e1c802   982  c57b118d50ffffff     vmovsd [rbp-0xb0],xmm9
0x3558f1e1c80a   98a  4c895d90             REX.W movq [rbp-0x70],r11
0x3558f1e1c80e   98e  488b7df0             REX.W movq rdi,[rbp-0x10]
0x3558f1e1c812   992  498bf1               REX.W movq rsi,r9
0x3558f1e1c815   995  418bd3               movl rdx,r11
0x3558f1e1c818   998  498bc9               REX.W movq rcx,r9
0x3558f1e1c81b   99b  41b8e0000000         movl r8,0xe0
0x3558f1e1c821   9a1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3558f1e1c82b   9ab  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3558f1e1c832   9b2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3558f1e1c839   9b9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3558f1e1c840   9c0  ffd0                 call rax
0x3558f1e1c842   9c2  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3558f1e1c84d   9cd  488b2424             REX.W movq rsp,[rsp]
0x3558f1e1c851   9d1  85c0                 testl rax,rax
0x3558f1e1c853   9d3  0f84b21b0000         jz 0x3558f1e1e40b  <+0x258b>
0x3558f1e1c859   9d9  4533db               xorl r11,r11
0x3558f1e1c85c   9dc  83bd58ffffff00       cmpl [rbp-0xa8],0x0
0x3558f1e1c863   9e3  410f95c3             setnzl r11l
0x3558f1e1c867   9e7  448ba558ffffff       movl r12,[rbp-0xa8]
0x3558f1e1c86e   9ee  452be3               subl r12,r11
0x3558f1e1c871   9f1  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1c879   9f9  c5da598550ffffff     vmulss xmm0,xmm4,[rbp-0xb0]
0x3558f1e1c881   a01  c5f82ec0             vucomiss xmm0,xmm0
0x3558f1e1c885   a05  7a06                 jpe 0x3558f1e1c88d  <+0xa0d>
0x3558f1e1c887   a07  0f8404000000         jz 0x3558f1e1c891  <+0xa11>
0x3558f1e1c88d   a0d  c5f857c0             vxorps xmm0,xmm0,xmm0
0x3558f1e1c891   a11  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3558f1e1c895   a15  c5f82ec5             vucomiss xmm0,xmm5
0x3558f1e1c899   a19  0f8704000000         ja 0x3558f1e1c8a3  <+0xa23>
0x3558f1e1c89f   a1f  c5f928c5             vmovapd xmm0,xmm5
0x3558f1e1c8a3   a23  c5fa5af0             vcvtss2sd xmm6,xmm0,xmm0
0x3558f1e1c8a7   a27  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x3558f1e1c8ad   a2d  c57b2cdf             vcvttsd2si r11,xmm7
0x3558f1e1c8b1   a31  4585db               testl r11,r11
0x3558f1e1c8b4   a34  0f8927000000         jns 0x3558f1e1c8e1  <+0xa61>
0x3558f1e1c8ba   a3a  4c8b1508f7ffff       REX.W movq r10,[rip+0xfffff708]
0x3558f1e1c8c1   a41  c441f96efa           vmovq xmm15,r10
0x3558f1e1c8c6   a46  c50358ff             vaddsd xmm15,xmm15,xmm7
0x3558f1e1c8ca   a4a  c4417b2cdf           vcvttsd2si r11,xmm15
0x3558f1e1c8cf   a4f  4585db               testl r11,r11
0x3558f1e1c8d2   a52  0f8809000000         js 0x3558f1e1c8e1  <+0xa61>
0x3558f1e1c8d8   a58  41ba00000080         movl r10,0x80000000
0x3558f1e1c8de   a5e  450bda               orl r11,r10
0x3558f1e1c8e1   a61  458bd3               movl r10,r11
0x3558f1e1c8e4   a64  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x3558f1e1c8e9   a69  c5792ec7             vucomisd xmm8,xmm7
0x3558f1e1c8ed   a6d  0f8afa190000         jpe 0x3558f1e1e2ed  <+0x246d>
0x3558f1e1c8f3   a73  0f85f4190000         jnz 0x3558f1e1e2ed  <+0x246d>
0x3558f1e1c8f9   a79  458bfb               movl r15,r11
0x3558f1e1c8fc   a7c  453be3               cmpl r12,r11
0x3558f1e1c8ff   a7f  450f42fc             cmovcl r15,r12
0x3558f1e1c903   a83  41ba0000804f         movl r10,0x4f800000
0x3558f1e1c909   a89  c4c1796ef2           vmovd xmm6,r10
0x3558f1e1c90e   a8e  4533db               xorl r11,r11
0x3558f1e1c911   a91  c5f82ef0             vucomiss xmm6,xmm0
0x3558f1e1c915   a95  450f47df             cmoval r11,r15
0x3558f1e1c919   a99  4533ff               xorl r15,r15
0x3558f1e1c91c   a9c  4585db               testl r11,r11
0x3558f1e1c91f   a9f  410f95c7             setnzl r15l
0x3558f1e1c923   aa3  458bf3               movl r14,r11
0x3558f1e1c926   aa6  452bf7               subl r14,r15
0x3558f1e1c929   aa9  4183c301             addl r11,0x1
0x3558f1e1c92d   aad  458bfb               movl r15,r11
0x3558f1e1c930   ab0  453be3               cmpl r12,r11
0x3558f1e1c933   ab3  450f42fc             cmovcl r15,r12
0x3558f1e1c937   ab7  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x3558f1e1c93e   abe  453bf7               cmpl r14,r15
0x3558f1e1c941   ac1  0f8620000000         jna 0x3558f1e1c967  <+0xae7>
0x3558f1e1c947   ac7  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x3558f1e1c94b   acb  c5f928f5             vmovapd xmm6,xmm5
0x3558f1e1c94f   acf  448b5dc8             movl r11,[rbp-0x38]
0x3558f1e1c953   ad3  c5f8108560ffffff     vmovups xmm0,[rbp-0xa0]
0x3558f1e1c95b   adb  8b5de0               movl rbx,[rbp-0x20]
0x3558f1e1c95e   ade  c5f928e8             vmovapd xmm5,xmm0
0x3558f1e1c962   ae2  e9bc150000           jmp 0x3558f1e1df23  <+0x20a3>
0x3558f1e1c967   ae7  4533db               xorl r11,r11
0x3558f1e1c96a   aea  83bdf0fdffff00       cmpl [rbp-0x210],0x0
0x3558f1e1c971   af1  410f95c3             setnzl r11l
0x3558f1e1c975   af5  448ba5f0fdffff       movl r12,[rbp-0x210]
0x3558f1e1c97c   afc  452be3               subl r12,r11
0x3558f1e1c97f   aff  c5fb108550ffffff     vmovsd xmm0,[rbp-0xb0]
0x3558f1e1c987   b07  c5fa598500ffffff     vmulss xmm0,xmm0,[rbp-0x100]
0x3558f1e1c98f   b0f  c5f82ec0             vucomiss xmm0,xmm0
0x3558f1e1c993   b13  7a06                 jpe 0x3558f1e1c99b  <+0xb1b>
0x3558f1e1c995   b15  0f8404000000         jz 0x3558f1e1c99f  <+0xb1f>
0x3558f1e1c99b   b1b  c5f928c5             vmovapd xmm0,xmm5
0x3558f1e1c99f   b1f  c5f82ec5             vucomiss xmm0,xmm5
0x3558f1e1c9a3   b23  0f8704000000         ja 0x3558f1e1c9ad  <+0xb2d>
0x3558f1e1c9a9   b29  c5f928c5             vmovapd xmm0,xmm5
0x3558f1e1c9ad   b2d  c5fa5af8             vcvtss2sd xmm7,xmm0,xmm0
0x3558f1e1c9b1   b31  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x3558f1e1c9b7   b37  c4417b2cd8           vcvttsd2si r11,xmm8
0x3558f1e1c9bc   b3c  4585db               testl r11,r11
0x3558f1e1c9bf   b3f  0f8928000000         jns 0x3558f1e1c9ed  <+0xb6d>
0x3558f1e1c9c5   b45  4c8b15fdf5ffff       REX.W movq r10,[rip+0xfffff5fd]
0x3558f1e1c9cc   b4c  c441f96efa           vmovq xmm15,r10
0x3558f1e1c9d1   b51  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x3558f1e1c9d6   b56  c4417b2cdf           vcvttsd2si r11,xmm15
0x3558f1e1c9db   b5b  4585db               testl r11,r11
0x3558f1e1c9de   b5e  0f8809000000         js 0x3558f1e1c9ed  <+0xb6d>
0x3558f1e1c9e4   b64  41ba00000080         movl r10,0x80000000
0x3558f1e1c9ea   b6a  450bda               orl r11,r10
0x3558f1e1c9ed   b6d  458bd3               movl r10,r11
0x3558f1e1c9f0   b70  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x3558f1e1c9f5   b75  c441792ec8           vucomisd xmm9,xmm8
0x3558f1e1c9fa   b7a  0f8a10190000         jpe 0x3558f1e1e310  <+0x2490>
0x3558f1e1ca00   b80  0f850a190000         jnz 0x3558f1e1e310  <+0x2490>
0x3558f1e1ca06   b86  418bc3               movl rax,r11
0x3558f1e1ca09   b89  453be3               cmpl r12,r11
0x3558f1e1ca0c   b8c  410f42c4             cmovcl rax,r12
0x3558f1e1ca10   b90  4533db               xorl r11,r11
0x3558f1e1ca13   b93  c5f82ef0             vucomiss xmm6,xmm0
0x3558f1e1ca17   b97  440f47d8             cmoval r11,rax
0x3558f1e1ca1b   b9b  33c0                 xorl rax,rax
0x3558f1e1ca1d   b9d  4585db               testl r11,r11
0x3558f1e1ca20   ba0  0f95c0               setnzl al
0x3558f1e1ca23   ba3  418bdb               movl rbx,r11
0x3558f1e1ca26   ba6  2bd8                 subl rbx,rax
0x3558f1e1ca28   ba8  8b95f8fdffff         movl rdx,[rbp-0x208]
0x3558f1e1ca2e   bae  8b85d8fdffff         movl rax,[rbp-0x228]
0x3558f1e1ca34   bb4  3b95d8fdffff         cmpl rdx,[rbp-0x228]
0x3558f1e1ca3a   bba  0f42c2               cmovcl rax,rdx
0x3558f1e1ca3d   bbd  8bb500feffff         movl rsi,[rbp-0x200]
0x3558f1e1ca43   bc3  8bc8                 movl rcx,rax
0x3558f1e1ca45   bc5  3bf0                 cmpl rsi,rax
0x3558f1e1ca47   bc7  0f42ce               cmovcl rcx,rsi
0x3558f1e1ca4a   bca  4183c301             addl r11,0x1
0x3558f1e1ca4e   bce  418bc3               movl rax,r11
0x3558f1e1ca51   bd1  453be3               cmpl r12,r11
0x3558f1e1ca54   bd4  410f42c4             cmovcl rax,r12
0x3558f1e1ca58   bd8  448d5801             leal r11,[rax+0x1]
0x3558f1e1ca5c   bdc  c4e27918c4           vbroadcastss xmm0,xmm4
0x3558f1e1ca61   be1  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1ca69   be9  c4e27918f3           vbroadcastss xmm6,xmm3
0x3558f1e1ca6e   bee  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x3558f1e1ca75   bf5  4c8b65c0             REX.W movq r12,[rbp-0x40]
0x3558f1e1ca79   bf9  418b7c0464           movl rdi,[r12+rax*1+0x64]
0x3558f1e1ca7e   bfe  458b440468           movl r8,[r12+rax*1+0x68]
0x3558f1e1ca83   c03  c5c1efff             vpxor xmm7,xmm7,xmm7
0x3558f1e1ca87   c07  48899dd0fdffff       REX.W movq [rbp-0x230],rbx
0x3558f1e1ca8e   c0e  48898d40feffff       REX.W movq [rbp-0x1c0],rcx
0x3558f1e1ca95   c15  4c899d08feffff       REX.W movq [rbp-0x1f8],r11
0x3558f1e1ca9c   c1c  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x3558f1e1caa4   c24  c5f811b570feffff     vmovups [rbp-0x190],xmm6
0x3558f1e1caac   c2c  4889bde8fdffff       REX.W movq [rbp-0x218],rdi
0x3558f1e1cab3   c33  4c8985e0fdffff       REX.W movq [rbp-0x220],r8
0x3558f1e1caba   c3a  c57928cf             vmovapd xmm9,xmm7
0x3558f1e1cabe   c3e  c5f928fd             vmovapd xmm7,xmm5
0x3558f1e1cac2   c42  c5fb11ad40ffffff     vmovsd [rbp-0xc0],xmm5
0x3558f1e1caca   c4a  c5fb11ad28ffffff     vmovsd [rbp-0xd8],xmm5
0x3558f1e1cad2   c52  4533c9               xorl r9,r9
0x3558f1e1cad5   c55  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1cadd   c5d  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1cae5   c65  8b8538feffff         movl rax,[rbp-0x1c8]
0x3558f1e1caeb   c6b  e973000000           jmp 0x3558f1e1cb63  <+0xce3>
0x3558f1e1caf0   c70  660f1f840000000000   nop
0x3558f1e1caf9   c79  0f1f8000000000       nop
0x3558f1e1cb00   c80  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3558f1e1cb08   c88  8b9dd0fdffff         movl rbx,[rbp-0x230]
0x3558f1e1cb0e   c8e  c4c17928e1           vmovapd xmm4,xmm9
0x3558f1e1cb13   c93  c578108d30ffffff     vmovups xmm9,[rbp-0xd0]
0x3558f1e1cb1b   c9b  448b9d08feffff       movl r11,[rbp-0x1f8]
0x3558f1e1cb22   ca2  418bc6               movl rax,r14
0x3558f1e1cb25   ca5  4589e6               movl r14,r12
0x3558f1e1cb28   ca8  4c8be7               REX.W movq r12,rdi
0x3558f1e1cb2b   cab  c5f928dd             vmovapd xmm3,xmm5
0x3558f1e1cb2f   caf  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3558f1e1cb33   cb3  448b85e0fdffff       movl r8,[rbp-0x220]
0x3558f1e1cb3a   cba  c4c17928d4           vmovapd xmm2,xmm12
0x3558f1e1cb3f   cbf  c4c17928cb           vmovapd xmm1,xmm11
0x3558f1e1cb44   cc4  8bbde8fdffff         movl rdi,[rbp-0x218]
0x3558f1e1cb4a   cca  8b95f8fdffff         movl rdx,[rbp-0x208]
0x3558f1e1cb50   cd0  4d8bcf               REX.W movq r9,r15
0x3558f1e1cb53   cd3  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x3558f1e1cb5b   cdb  c5f810b570feffff     vmovups xmm6,[rbp-0x190]
0x3558f1e1cb63   ce3  c4412176db           vpcmpeqd xmm11,xmm11,xmm11
0x3558f1e1cb68   ce8  c4c12172f319         vpslld xmm11,xmm11,25
0x3558f1e1cb6e   cee  c4c12172d302         vpsrld xmm11,xmm11,2
0x3558f1e1cb74   cf4  c57810a5b0feffff     vmovups xmm12,[rbp-0x150]
0x3558f1e1cb7c   cfc  c57810b5a0feffff     vmovups xmm14,[rbp-0x160]
0x3558f1e1cb84   d04  c57810ad90feffff     vmovups xmm13,[rbp-0x170]
0x3558f1e1cb8c   d0c  8b8d60feffff         movl rcx,[rbp-0x1a0]
0x3558f1e1cb92   d12  448bbd48feffff       movl r15,[rbp-0x1b8]
0x3558f1e1cb99   d19  4c8975c8             REX.W movq [rbp-0x38],r14
0x3558f1e1cb9d   d1d  c5fb11bd50ffffff     vmovsd [rbp-0xb0],xmm7
0x3558f1e1cba5   d25  c578118d30ffffff     vmovups [rbp-0xd0],xmm9
0x3558f1e1cbad   d2d  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1cbb1   d31  0f867c170000         jna 0x3558f1e1e333  <+0x24b3>
0x3558f1e1cbb7   d37  8bb5f0fdffff         movl rsi,[rbp-0x210]
0x3558f1e1cbbd   d3d  410faff6             imull rsi,r14
0x3558f1e1cbc1   d41  448d3433             leal r14,[rbx+rsi*1]
0x3558f1e1cbc5   d45  453bc6               cmpl r8,r14
0x3558f1e1cbc8   d48  0f8629000000         jna 0x3558f1e1cbf7  <+0xd77>
0x3558f1e1cbce   d4e  4103f3               addl rsi,r11
0x3558f1e1cbd1   d51  443bc6               cmpl r8,rsi
0x3558f1e1cbd4   d54  0f861d000000         jna 0x3558f1e1cbf7  <+0xd77>
0x3558f1e1cbda   d5a  8d34b7               leal rsi,[rdi+rsi*4]
0x3558f1e1cbdd   d5d  418b3434             movl rsi,[r12+rsi*1]
0x3558f1e1cbe1   d61  468d34b7             leal r14,[rdi+r14*4]
0x3558f1e1cbe5   d65  478b3434             movl r14,[r12+r14*1]
0x3558f1e1cbe9   d69  458bd6               movl r10,r14
0x3558f1e1cbec   d6c  448bf6               movl r14,rsi
0x3558f1e1cbef   d6f  418bf2               movl rsi,r10
0x3558f1e1cbf2   d72  e906000000           jmp 0x3558f1e1cbfd  <+0xd7d>
0x3558f1e1cbf7   d77  4d8bf1               REX.W movq r14,r9
0x3558f1e1cbfa   d7a  498bf1               REX.W movq rsi,r9
0x3558f1e1cbfd   d7d  458d1cb7             leal r11,[r15+rsi*4]
0x3558f1e1cc01   d81  458be6               movl r12,r14
0x3558f1e1cc04   d84  442be6               subl r12,rsi
0x3558f1e1cc07   d87  4533ff               xorl r15,r15
0x3558f1e1cc0a   d8a  413bc6               cmpl rax,r14
0x3558f1e1cc0d   d8d  410f92c7             setcl r15l
0x3558f1e1cc11   d91  33c0                 xorl rax,rax
0x3558f1e1cc13   d93  443bf6               cmpl r14,rsi
0x3558f1e1cc16   d96  0f92c0               setcl al
0x3558f1e1cc19   d99  498bdf               REX.W movq rbx,r15
0x3558f1e1cc1c   d9c  0bd8                 orl rbx,rax
0x3558f1e1cc1e   d9e  4489e7               movl rdi,r12
0x3558f1e1cc21   da1  85db                 testl rbx,rbx
0x3558f1e1cc23   da3  410f45f9             cmovnzl rdi,r9
0x3558f1e1cc27   da7  4c89b568feffff       REX.W movq [rbp-0x198],r14
0x3558f1e1cc2e   dae  4c899df0feffff       REX.W movq [rbp-0x110],r11
0x3558f1e1cc35   db5  4c89bd30feffff       REX.W movq [rbp-0x1d0],r15
0x3558f1e1cc3c   dbc  488985c8feffff       REX.W movq [rbp-0x138],rax
0x3558f1e1cc43   dc3  4889bde8feffff       REX.W movq [rbp-0x118],rdi
0x3558f1e1cc4a   dca  443bf6               cmpl r14,rsi
0x3558f1e1cc4d   dcd  0f82a3000000         jc 0x3558f1e1ccf6  <+0xe76>
0x3558f1e1cc53   dd3  8d1cb1               leal rbx,[rcx+rsi*4]
0x3558f1e1cc56   dd6  b904000000           movl rcx,0x4
0x3558f1e1cc5b   ddb  413bd6               cmpl rdx,r14
0x3558f1e1cc5e   dde  0f42d9               cmovcl rbx,rcx
0x3558f1e1cc61   de1  4489e7               movl rdi,r12
0x3558f1e1cc64   de4  413bd6               cmpl rdx,r14
0x3558f1e1cc67   de7  410f42f9             cmovcl rdi,r9
0x3558f1e1cc6b   deb  8bd7                 movl rdx,rdi
0x3558f1e1cc6d   ded  81e2f8ffff1f         andl rdx,0x1ffffff8
0x3558f1e1cc73   df3  8d1493               leal rdx,[rbx+rdx*4]
0x3558f1e1cc76   df6  448b8550feffff       movl r8,[rbp-0x1b0]
0x3558f1e1cc7d   dfd  458d1cb0             leal r11,[r8+rsi*4]
0x3558f1e1cc81   e01  448b8500feffff       movl r8,[rbp-0x200]
0x3558f1e1cc88   e08  453bc6               cmpl r8,r14
0x3558f1e1cc8b   e0b  440f42d9             cmovcl r11,rcx
0x3558f1e1cc8f   e0f  4589e7               movl r15,r12
0x3558f1e1cc92   e12  453bc6               cmpl r8,r14
0x3558f1e1cc95   e15  450f42f9             cmovcl r15,r9
0x3558f1e1cc99   e19  458bc7               movl r8,r15
0x3558f1e1cc9c   e1c  4181e0f8ffff1f       andl r8,0x1ffffff8
0x3558f1e1cca3   e23  478d0483             leal r8,[r11+r8*4]
0x3558f1e1cca7   e27  8bc7                 movl rax,rdi
0x3558f1e1cca9   e29  c1e803               shrl rax, 3
0x3558f1e1ccac   e2c  83e707               andl rdi,0x7
0x3558f1e1ccaf   e2f  4c899d20feffff       REX.W movq [rbp-0x1e0],r11
0x3558f1e1ccb6   e36  458bdf               movl r11,r15
0x3558f1e1ccb9   e39  41c1eb03             shrl r11, 3
0x3558f1e1ccbd   e3d  4183e707             andl r15,0x7
0x3558f1e1ccc1   e41  4c899d28feffff       REX.W movq [rbp-0x1d8],r11
0x3558f1e1ccc8   e48  448b9dd8fdffff       movl r11,[rbp-0x228]
0x3558f1e1cccf   e4f  453bde               cmpl r11,r14
0x3558f1e1ccd2   e52  0f8213000000         jc 0x3558f1e1cceb  <+0xe6b>
0x3558f1e1ccd8   e58  448b9d58feffff       movl r11,[rbp-0x1a8]
0x3558f1e1ccdf   e5f  418d34b3             leal rsi,[r11+rsi*4]
0x3558f1e1cce3   e63  448bde               movl r11,rsi
0x3558f1e1cce6   e66  e936000000           jmp 0x3558f1e1cd21  <+0xea1>
0x3558f1e1cceb   e6b  4c8bd9               REX.W movq r11,rcx
0x3558f1e1ccee   e6e  4d8be1               REX.W movq r12,r9
0x3558f1e1ccf1   e71  e92b000000           jmp 0x3558f1e1cd21  <+0xea1>
0x3558f1e1ccf6   e76  b904000000           movl rcx,0x4
0x3558f1e1ccfb   e7b  4d8be1               REX.W movq r12,r9
0x3558f1e1ccfe   e7e  4d8bf9               REX.W movq r15,r9
0x3558f1e1cd01   e81  498bc1               REX.W movq rax,r9
0x3558f1e1cd04   e84  498bf9               REX.W movq rdi,r9
0x3558f1e1cd07   e87  4c898d28feffff       REX.W movq [rbp-0x1d8],r9
0x3558f1e1cd0e   e8e  488bd1               REX.W movq rdx,rcx
0x3558f1e1cd11   e91  488bd9               REX.W movq rbx,rcx
0x3558f1e1cd14   e94  4c8bc1               REX.W movq r8,rcx
0x3558f1e1cd17   e97  4c8bd9               REX.W movq r11,rcx
0x3558f1e1cd1a   e9a  48898d20feffff       REX.W movq [rbp-0x1e0],rcx
0x3558f1e1cd21   ea1  488bb5c8feffff       REX.W movq rsi,[rbp-0x138]
0x3558f1e1cd28   ea8  0bb530feffff         orl rsi,[rbp-0x1d0]
0x3558f1e1cd2e   eae  4c899de0feffff       REX.W movq [rbp-0x120],r11
0x3558f1e1cd35   eb5  448b9df0feffff       movl r11,[rbp-0x110]
0x3558f1e1cd3c   ebc  85f6                 testl rsi,rsi
0x3558f1e1cd3e   ebe  440f45d9             cmovnzl r11,rcx
0x3558f1e1cd42   ec2  8b8de8feffff         movl rcx,[rbp-0x118]
0x3558f1e1cd48   ec8  83e107               andl rcx,0x7
0x3558f1e1cd4b   ecb  4489e6               movl rsi,r12
0x3558f1e1cd4e   ece  c1ee03               shrl rsi, 3
0x3558f1e1cd51   ed1  4889bdd0feffff       REX.W movq [rbp-0x130],rdi
0x3558f1e1cd58   ed8  8bbde8feffff         movl rdi,[rbp-0x118]
0x3558f1e1cd5e   ede  c1ef03               shrl rdi, 3
0x3558f1e1cd61   ee1  4c89a5d8feffff       REX.W movq [rbp-0x128],r12
0x3558f1e1cd68   ee8  448ba528feffff       movl r12,[rbp-0x1d8]
0x3558f1e1cd6f   eef  4c899df0feffff       REX.W movq [rbp-0x110],r11
0x3558f1e1cd76   ef6  448bdf               movl r11,rdi
0x3558f1e1cd79   ef9  443be7               cmpl r12,rdi
0x3558f1e1cd7c   efc  450f42dc             cmovcl r11,r12
0x3558f1e1cd80   f00  458be3               movl r12,r11
0x3558f1e1cd83   f03  413bc3               cmpl rax,r11
0x3558f1e1cd86   f06  440f42e0             cmovcl r12,rax
0x3558f1e1cd8a   f0a  4589e3               movl r11,r12
0x3558f1e1cd8d   f0d  4439e6               cmpl rsi,r12
0x3558f1e1cd90   f10  440f42de             cmovcl r11,rsi
0x3558f1e1cd94   f14  48899520ffffff       REX.W movq [rbp-0xe0],rdx
0x3558f1e1cd9b   f1b  4c8985f8feffff       REX.W movq [rbp-0x108],r8
0x3558f1e1cda2   f22  4c89bdc0feffff       REX.W movq [rbp-0x140],r15
0x3558f1e1cda9   f29  48898dc8feffff       REX.W movq [rbp-0x138],rcx
0x3558f1e1cdb0   f30  4585db               testl r11,r11
0x3558f1e1cdb3   f33  0f8491020000         jz 0x3558f1e1d04a  <+0x11ca>
0x3558f1e1cdb9   f39  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1cdc0   f40  448ba5e0feffff       movl r12,[rbp-0x120]
0x3558f1e1cdc7   f47  8bb5f0feffff         movl rsi,[rbp-0x110]
0x3558f1e1cdcd   f4d  8b8520feffff         movl rax,[rbp-0x1e0]
0x3558f1e1cdd3   f53  e94f000000           jmp 0x3558f1e1ce27  <+0xfa7>
0x3558f1e1cdd8   f58  660f1f840000000000   nop
0x3558f1e1cde1   f61  660f1f840000000000   nop
0x3558f1e1cdea   f6a  660f1f840000000000   nop
0x3558f1e1cdf3   f73  660f1f840000000000   nop
0x3558f1e1cdfc   f7c  0f1f4000             nop
0x3558f1e1ce00   f80  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1ce07   f87  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1ce0f   f8f  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1ce17   f97  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1ce1f   f9f  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1ce27   fa7  4c89a528feffff       REX.W movq [rbp-0x1d8],r12
0x3558f1e1ce2e   fae  48899dc8fdffff       REX.W movq [rbp-0x238],rbx
0x3558f1e1ce35   fb5  48898520feffff       REX.W movq [rbp-0x1e0],rax
0x3558f1e1ce3c   fbc  4889b510feffff       REX.W movq [rbp-0x1f0],rsi
0x3558f1e1ce43   fc3  8bd6                 movl rdx,rsi
0x3558f1e1ce45   fc5  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1ce49   fc9  8bc8                 movl rcx,rax
0x3558f1e1ce4b   fcb  8b4590               movl rax,[rbp-0x70]
0x3558f1e1ce4e   fce  4589e1               movl r9,r12
0x3558f1e1ce51   fd1  e8ea5ef2ff           call 0x3558f1d42d40  (jump table)
0x3558f1e1ce56   fd6  8bb510feffff         movl rsi,[rbp-0x1f0]
0x3558f1e1ce5c   fdc  8d5620               leal rdx,[rsi+0x20]
0x3558f1e1ce5f   fdf  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3558f1e1ce66   fe6  418d4b20             leal rcx,[r11+0x20]
0x3558f1e1ce6a   fea  8b9dc8fdffff         movl rbx,[rbp-0x238]
0x3558f1e1ce70   ff0  83c320               addl rbx,0x20
0x3558f1e1ce73   ff3  448ba528feffff       movl r12,[rbp-0x1d8]
0x3558f1e1ce7a   ffa  458d4c2420           leal r9,[r12+0x20]
0x3558f1e1ce7f   fff  48899510feffff       REX.W movq [rbp-0x1f0],rdx
0x3558f1e1ce86  1006  48898d18feffff       REX.W movq [rbp-0x1e8],rcx
0x3558f1e1ce8d  100d  48899d20feffff       REX.W movq [rbp-0x1e0],rbx
0x3558f1e1ce94  1014  4c898d28feffff       REX.W movq [rbp-0x1d8],r9
0x3558f1e1ce9b  101b  4c8b9d30feffff       REX.W movq r11,[rbp-0x1d0]
0x3558f1e1cea2  1022  4183c3ff             addl r11,0xff
0x3558f1e1cea6  1026  0f8497010000         jz 0x3558f1e1d043  <+0x11c3>
0x3558f1e1ceac  102c  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1ceb3  1033  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1ceb7  1037  8b4590               movl rax,[rbp-0x70]
0x3558f1e1ceba  103a  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1cec2  1042  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1ceca  104a  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1ced2  1052  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1ceda  105a  e8615ef2ff           call 0x3558f1d42d40  (jump table)
0x3558f1e1cedf  105f  448b9d10feffff       movl r11,[rbp-0x1f0]
0x3558f1e1cee6  1066  418d5320             leal rdx,[r11+0x20]
0x3558f1e1ceea  106a  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3558f1e1cef1  1071  418d4b20             leal rcx,[r11+0x20]
0x3558f1e1cef5  1075  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3558f1e1cefc  107c  418d5b20             leal rbx,[r11+0x20]
0x3558f1e1cf00  1080  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3558f1e1cf07  1087  458d4b20             leal r9,[r11+0x20]
0x3558f1e1cf0b  108b  48899510feffff       REX.W movq [rbp-0x1f0],rdx
0x3558f1e1cf12  1092  48898d18feffff       REX.W movq [rbp-0x1e8],rcx
0x3558f1e1cf19  1099  48899d20feffff       REX.W movq [rbp-0x1e0],rbx
0x3558f1e1cf20  10a0  4c898d28feffff       REX.W movq [rbp-0x1d8],r9
0x3558f1e1cf27  10a7  4c8b9d30feffff       REX.W movq r11,[rbp-0x1d0]
0x3558f1e1cf2e  10ae  4183c3ff             addl r11,0xff
0x3558f1e1cf32  10b2  0f840b010000         jz 0x3558f1e1d043  <+0x11c3>
0x3558f1e1cf38  10b8  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1cf3f  10bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1cf43  10c3  8b4590               movl rax,[rbp-0x70]
0x3558f1e1cf46  10c6  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1cf4e  10ce  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1cf56  10d6  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1cf5e  10de  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1cf66  10e6  e8d55df2ff           call 0x3558f1d42d40  (jump table)
0x3558f1e1cf6b  10eb  448b9d10feffff       movl r11,[rbp-0x1f0]
0x3558f1e1cf72  10f2  418d5320             leal rdx,[r11+0x20]
0x3558f1e1cf76  10f6  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3558f1e1cf7d  10fd  418d4b20             leal rcx,[r11+0x20]
0x3558f1e1cf81  1101  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3558f1e1cf88  1108  418d5b20             leal rbx,[r11+0x20]
0x3558f1e1cf8c  110c  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3558f1e1cf93  1113  458d4b20             leal r9,[r11+0x20]
0x3558f1e1cf97  1117  48899510feffff       REX.W movq [rbp-0x1f0],rdx
0x3558f1e1cf9e  111e  48898d18feffff       REX.W movq [rbp-0x1e8],rcx
0x3558f1e1cfa5  1125  48899d20feffff       REX.W movq [rbp-0x1e0],rbx
0x3558f1e1cfac  112c  4c898d28feffff       REX.W movq [rbp-0x1d8],r9
0x3558f1e1cfb3  1133  4c8b9d30feffff       REX.W movq r11,[rbp-0x1d0]
0x3558f1e1cfba  113a  4183c3ff             addl r11,0xff
0x3558f1e1cfbe  113e  0f847f000000         jz 0x3558f1e1d043  <+0x11c3>
0x3558f1e1cfc4  1144  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1cfcb  114b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3558f1e1cfcf  114f  0f8613140000         jna 0x3558f1e1e3e8  <+0x2568>
0x3558f1e1cfd5  1155  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1cfd9  1159  8b4590               movl rax,[rbp-0x70]
0x3558f1e1cfdc  115c  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1cfe4  1164  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1cfec  116c  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1cff4  1174  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1cffc  117c  e83f5df2ff           call 0x3558f1d42d40  (jump table)
0x3558f1e1d001  1181  448b9d10feffff       movl r11,[rbp-0x1f0]
0x3558f1e1d008  1188  418d7320             leal rsi,[r11+0x20]
0x3558f1e1d00c  118c  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3558f1e1d013  1193  418d4320             leal rax,[r11+0x20]
0x3558f1e1d017  1197  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3558f1e1d01e  119e  418d5b20             leal rbx,[r11+0x20]
0x3558f1e1d022  11a2  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3558f1e1d029  11a9  458d6320             leal r12,[r11+0x20]
0x3558f1e1d02d  11ad  4c8b9d30feffff       REX.W movq r11,[rbp-0x1d0]
0x3558f1e1d034  11b4  4183c3ff             addl r11,0xff
0x3558f1e1d038  11b8  0f85c2fdffff         jnz 0x3558f1e1ce00  <+0xf80>
0x3558f1e1d03e  11be  e907000000           jmp 0x3558f1e1d04a  <+0x11ca>
0x3558f1e1d043  11c3  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3558f1e1d04a  11ca  83bdc8feffff00       cmpl [rbp-0x138],0x0
0x3558f1e1d051  11d1  0f850f000000         jnz 0x3558f1e1d066  <+0x11e6>
0x3558f1e1d057  11d7  448bb538feffff       movl r14,[rbp-0x1c8]
0x3558f1e1d05e  11de  4533ff               xorl r15,r15
0x3558f1e1d061  11e1  e9b8040000           jmp 0x3558f1e1d51e  <+0x169e>
0x3558f1e1d066  11e6  8bb568feffff         movl rsi,[rbp-0x198]
0x3558f1e1d06c  11ec  448d5ef8             leal r11,[rsi-0x8]
0x3558f1e1d070  11f0  458be3               movl r12,r11
0x3558f1e1d073  11f3  4533ff               xorl r15,r15
0x3558f1e1d076  11f6  413bf3               cmpl rsi,r11
0x3558f1e1d079  11f9  450f42e7             cmovcl r12,r15
0x3558f1e1d07d  11fd  458d5c2408           leal r11,[r12+0x8]
0x3558f1e1d082  1202  448bb538feffff       movl r14,[rbp-0x1c8]
0x3558f1e1d089  1209  453bf3               cmpl r14,r11
0x3558f1e1d08c  120c  0f828c040000         jc 0x3558f1e1d51e  <+0x169e>
0x3558f1e1d092  1212  8b8540feffff         movl rax,[rbp-0x1c0]
0x3558f1e1d098  1218  413bc3               cmpl rax,r11
0x3558f1e1d09b  121b  0f827a040000         jc 0x3558f1e1d51b  <+0x169b>
0x3558f1e1d0a1  1221  448b9d48feffff       movl r11,[rbp-0x1b8]
0x3558f1e1d0a8  1228  438d1ca3             leal rbx,[r11+r12*4]
0x3558f1e1d0ac  122c  8b9550feffff         movl rdx,[rbp-0x1b0]
0x3558f1e1d0b2  1232  428d0ca2             leal rcx,[rdx+r12*4]
0x3558f1e1d0b6  1236  8bbd58feffff         movl rdi,[rbp-0x1a8]
0x3558f1e1d0bc  123c  468d04a7             leal r8,[rdi+r12*4]
0x3558f1e1d0c0  1240  448b8d60feffff       movl r9,[rbp-0x1a0]
0x3558f1e1d0c7  1247  478d3ca1             leal r15,[r9+r12*4]
0x3558f1e1d0cb  124b  4429e6               subl rsi,r12
0x3558f1e1d0ce  124e  83fe08               cmpl rsi,0x8
0x3558f1e1d0d1  1251  0f8453010000         jz 0x3558f1e1d22a  <+0x13aa>
0x3558f1e1d0d7  1257  3bb5c8feffff         cmpl rsi,[rbp-0x138]
0x3558f1e1d0dd  125d  0f8409000000         jz 0x3558f1e1d0ec  <+0x126c>
0x3558f1e1d0e3  1263  c5f857c0             vxorps xmm0,xmm0,xmm0
0x3558f1e1d0e7  1267  e90e000000           jmp 0x3558f1e1d0fa  <+0x127a>
0x3558f1e1d0ec  126c  c5f976c0             vpcmpeqd xmm0,xmm0,xmm0
0x3558f1e1d0f0  1270  c5f972f019           vpslld xmm0,xmm0,25
0x3558f1e1d0f5  1275  c5f972d002           vpsrld xmm0,xmm0,2
0x3558f1e1d0fa  127a  448b65e0             movl r12,[rbp-0x20]
0x3558f1e1d0fe  127e  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1d102  1282  c4817a11842320010000 vmovss [r11+r12*1+0x120],xmm0
0x3558f1e1d10c  128c  4533f6               xorl r14,r14
0x3558f1e1d10f  128f  83fe07               cmpl rsi,0x7
0x3558f1e1d112  1292  410f97c6             setal r14l
0x3558f1e1d116  1296  8bc6                 movl rax,rsi
0x3558f1e1d118  1298  2b85c8feffff         subl rax,[rbp-0x138]
0x3558f1e1d11e  129e  33d2                 xorl rdx,rdx
0x3558f1e1d120  12a0  83f808               cmpl rax,0x8
0x3558f1e1d123  12a3  0f92c2               setcl dl
0x3558f1e1d126  12a6  4123d6               andl rdx,r14
0x3558f1e1d129  12a9  448bd2               movl r10,rdx
0x3558f1e1d12c  12ac  c4c1822aea           vcvtqsi2ss xmm5,xmm15,r10
0x3558f1e1d131  12b1  c4817a11ac233c010000 vmovss [r11+r12*1+0x13c],xmm5
0x3558f1e1d13b  12bb  4533f6               xorl r14,r14
0x3558f1e1d13e  12be  83fe06               cmpl rsi,0x6
0x3558f1e1d141  12c1  410f97c6             setal r14l
0x3558f1e1d145  12c5  33d2                 xorl rdx,rdx
0x3558f1e1d147  12c7  83f807               cmpl rax,0x7
0x3558f1e1d14a  12ca  0f92c2               setcl dl
0x3558f1e1d14d  12cd  4123d6               andl rdx,r14
0x3558f1e1d150  12d0  448bd2               movl r10,rdx
0x3558f1e1d153  12d3  c4c1822aea           vcvtqsi2ss xmm5,xmm15,r10
0x3558f1e1d158  12d8  c4817a11ac2338010000 vmovss [r11+r12*1+0x138],xmm5
0x3558f1e1d162  12e2  4533f6               xorl r14,r14
0x3558f1e1d165  12e5  83fe05               cmpl rsi,0x5
0x3558f1e1d168  12e8  410f97c6             setal r14l
0x3558f1e1d16c  12ec  33d2                 xorl rdx,rdx
0x3558f1e1d16e  12ee  83f806               cmpl rax,0x6
0x3558f1e1d171  12f1  0f92c2               setcl dl
0x3558f1e1d174  12f4  4123d6               andl rdx,r14
0x3558f1e1d177  12f7  448bd2               movl r10,rdx
0x3558f1e1d17a  12fa  c4c1822aea           vcvtqsi2ss xmm5,xmm15,r10
0x3558f1e1d17f  12ff  c4817a11ac2334010000 vmovss [r11+r12*1+0x134],xmm5
0x3558f1e1d189  1309  c5f96eee             vmovd xmm5,rsi
0x3558f1e1d18d  130d  c5f970ed00           vpshufd xmm5,xmm5,0x0
0x3558f1e1d192  1312  49ba0100000002000000 REX.W movq r10,0x200000001
0x3558f1e1d19c  131c  c4c1f96ef2           vmovq xmm6,r10
0x3558f1e1d1a1  1321  49ba0300000004000000 REX.W movq r10,0x400000003
0x3558f1e1d1ab  132b  c4c3c922f201         vpinsrq xmm6,xmm6,r10,0x1
0x3558f1e1d1b1  1331  c4e2513fee           vpmaxud xmm5,xmm5,xmm6
0x3558f1e1d1b6  1336  c5d176ee             vpcmpeqd xmm5,xmm5,xmm6
0x3558f1e1d1ba  133a  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3558f1e1d1bf  133f  c4c151efef           vpxor xmm5,xmm5,xmm15
0x3558f1e1d1c4  1344  c5f96ef0             vmovd xmm6,rax
0x3558f1e1d1c8  1348  c5f970f600           vpshufd xmm6,xmm6,0x0
0x3558f1e1d1cd  134d  49ba0200000003000000 REX.W movq r10,0x300000002
0x3558f1e1d1d7  1357  c4c1f96efa           vmovq xmm7,r10
0x3558f1e1d1dc  135c  49ba0400000005000000 REX.W movq r10,0x500000004
0x3558f1e1d1e6  1366  c4c3c122fa01         vpinsrq xmm7,xmm7,r10,0x1
0x3558f1e1d1ec  136c  c4e2413ffe           vpmaxud xmm7,xmm7,xmm6
0x3558f1e1d1f1  1371  c5c176fe             vpcmpeqd xmm7,xmm7,xmm6
0x3558f1e1d1f5  1375  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3558f1e1d1fa  137a  c4c141efff           vpxor xmm7,xmm7,xmm15
0x3558f1e1d1ff  137f  c5d1dbef             vpand xmm5,xmm5,xmm7
0x3558f1e1d203  1383  c5f810b5b0feffff     vmovups xmm6,[rbp-0x150]
0x3558f1e1d20b  138b  c5d1dbee             vpand xmm5,xmm5,xmm6
0x3558f1e1d20f  138f  c5f85bed             vcvtdq2ps xmm5,xmm5
0x3558f1e1d213  1393  c4817a7fac2324010000 vmovdqu [r11+r12*1+0x124],xmm5
0x3558f1e1d21d  139d  458db42420010000     leal r14,[r12+0x120]
0x3558f1e1d225  13a5  e93e000000           jmp 0x3558f1e1d268  <+0x13e8>
0x3558f1e1d22a  13aa  448ba5c8feffff       movl r12,[rbp-0x138]
0x3558f1e1d231  13b1  428d34a500000000     leal rsi,[r12*4+0x0]
0x3558f1e1d239  13b9  468d24a5c8311600     leal r12,[r12*4+0x1631c8]
0x3558f1e1d241  13c1  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1d245  13c5  c4c17a10ac33cc311600 vmovss xmm5,[r11+rsi*1+0x1631cc]
0x3558f1e1d24f  13cf  c4c17a108433c8311600 vmovss xmm0,[r11+rsi*1+0x1631c8]
0x3558f1e1d259  13d9  c5f810b5b0feffff     vmovups xmm6,[rbp-0x150]
0x3558f1e1d261  13e1  4589e6               movl r14,r12
0x3558f1e1d264  13e4  448b65e0             movl r12,[rbp-0x20]
0x3558f1e1d268  13e8  c4817a6fbc23e0000000 vmovdqu xmm7,[r11+r12*1+0xe0]
0x3558f1e1d272  13f2  c4417a6f041b         vmovdqu xmm8,[r11+rbx*1]
0x3558f1e1d278  13f8  c578108d70feffff     vmovups xmm9,[rbp-0x190]
0x3558f1e1d280  1400  c441305cd0           vsubps xmm10,xmm9,xmm8
0x3558f1e1d285  1405  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d28a  140a  c4e37921c510         vinsertps xmm0,xmm0,xmm5,0x10
0x3558f1e1d290  1410  498d4308             REX.W leaq rax,[r11+0x8]
0x3558f1e1d294  1414  c4a17b102c30         vmovsd xmm5,[rax+r14*1]
0x3558f1e1d29a  141a  c5f96cc5             vpunpcklqdq xmm0,xmm0,xmm5
0x3558f1e1d29e  141e  c4c12859ea           vmulps xmm5,xmm10,xmm10
0x3558f1e1d2a3  1423  c4417a6f1c0b         vmovdqu xmm11,[r11+rcx*1]
0x3558f1e1d2a9  1429  c57810a580feffff     vmovups xmm12,[rbp-0x180]
0x3558f1e1d2b1  1431  c441185ceb           vsubps xmm13,xmm12,xmm11
0x3558f1e1d2b6  1436  c4411059f5           vmulps xmm14,xmm13,xmm13
0x3558f1e1d2bb  143b  c4c15058ee           vaddps xmm5,xmm5,xmm14
0x3558f1e1d2c0  1440  c57810b590feffff     vmovups xmm14,[rbp-0x170]
0x3558f1e1d2c8  1448  c4c150c2ce01         vcmpps xmm1,xmm5,xmm14, (lt)
0x3558f1e1d2ce  144e  c5f1dbce             vpand xmm1,xmm1,xmm6
0x3558f1e1d2d2  1452  c5f85bc9             vcvtdq2ps xmm1,xmm1
0x3558f1e1d2d6  1456  c5f859c9             vmulps xmm1,xmm0,xmm1
0x3558f1e1d2da  145a  c52859d1             vmulps xmm10,xmm10,xmm1
0x3558f1e1d2de  145e  c4c14058fa           vaddps xmm7,xmm7,xmm10
0x3558f1e1d2e3  1463  c4817a7fbc23e0000000 vmovdqu [r11+r12*1+0xe0],xmm7
0x3558f1e1d2ed  146d  c4817a6fbc2300010000 vmovdqu xmm7,[r11+r12*1+0x100]
0x3558f1e1d2f7  1477  c51059d1             vmulps xmm10,xmm13,xmm1
0x3558f1e1d2fb  147b  c4c14058fa           vaddps xmm7,xmm7,xmm10
0x3558f1e1d300  1480  c4817a7fbc2300010000 vmovdqu [r11+r12*1+0x100],xmm7
0x3558f1e1d30a  148a  c588c2fd02           vcmpps xmm7,xmm14,xmm5, (le)
0x3558f1e1d30f  148f  c5781095a0feffff     vmovups xmm10,[rbp-0x160]
0x3558f1e1d317  1497  c44150c2ea01         vcmpps xmm13,xmm5,xmm10, (lt)
0x3558f1e1d31d  149d  c4c141dbfd           vpand xmm7,xmm7,xmm13
0x3558f1e1d322  14a2  c44111efed           vpxor xmm13,xmm13,xmm13
0x3558f1e1d327  14a7  c590c2ed01           vcmpps xmm5,xmm13,xmm5, (lt)
0x3558f1e1d32c  14ac  c5d1dbee             vpand xmm5,xmm5,xmm6
0x3558f1e1d330  14b0  c5f85bed             vcvtdq2ps xmm5,xmm5
0x3558f1e1d334  14b4  c5c1dbed             vpand xmm5,xmm7,xmm5
0x3558f1e1d338  14b8  c5f859c5             vmulps xmm0,xmm0,xmm5
0x3558f1e1d33c  14bc  c4817a6fac23c0000000 vmovdqu xmm5,[r11+r12*1+0xc0]
0x3558f1e1d346  14c6  c5f858ed             vaddps xmm5,xmm0,xmm5
0x3558f1e1d34a  14ca  c4817a7fac23c0000000 vmovdqu [r11+r12*1+0xc0],xmm5
0x3558f1e1d354  14d4  c4817a6f6c2340       vmovdqu xmm5,[r11+r12*1+0x40]
0x3558f1e1d35b  14db  c5b859f8             vmulps xmm7,xmm8,xmm0
0x3558f1e1d35f  14df  c5d058ef             vaddps xmm5,xmm5,xmm7
0x3558f1e1d363  14e3  c4817a7f6c2340       vmovdqu [r11+r12*1+0x40],xmm5
0x3558f1e1d36a  14ea  c5a059e8             vmulps xmm5,xmm11,xmm0
0x3558f1e1d36e  14ee  c4817a6f7c2360       vmovdqu xmm7,[r11+r12*1+0x60]
0x3558f1e1d375  14f5  c5d058ef             vaddps xmm5,xmm5,xmm7
0x3558f1e1d379  14f9  c4817a7f6c2360       vmovdqu [r11+r12*1+0x60],xmm5
0x3558f1e1d380  1500  c4817a6f2c3b         vmovdqu xmm5,[r11+r15*1]
0x3558f1e1d386  1506  c5d059e8             vmulps xmm5,xmm5,xmm0
0x3558f1e1d38a  150a  c4817a6fbc2380000000 vmovdqu xmm7,[r11+r12*1+0x80]
0x3558f1e1d394  1514  c5d058ef             vaddps xmm5,xmm5,xmm7
0x3558f1e1d398  1518  c4817a7fac2380000000 vmovdqu [r11+r12*1+0x80],xmm5
0x3558f1e1d3a2  1522  c4817a6f2c03         vmovdqu xmm5,[r11+r8*1]
0x3558f1e1d3a8  1528  c5d059c0             vmulps xmm0,xmm5,xmm0
0x3558f1e1d3ac  152c  c4817a6fac23a0000000 vmovdqu xmm5,[r11+r12*1+0xa0]
0x3558f1e1d3b6  1536  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1d3ba  153a  c4817a7f8423a0000000 vmovdqu [r11+r12*1+0xa0],xmm0
0x3558f1e1d3c4  1544  c4817a6f8423f0000000 vmovdqu xmm0,[r11+r12*1+0xf0]
0x3558f1e1d3ce  154e  c4c17a6f6c1b10       vmovdqu xmm5,[r11+rbx*1+0x10]
0x3558f1e1d3d5  1555  c5b05cfd             vsubps xmm7,xmm9,xmm5
0x3558f1e1d3d9  1559  c4017a6f443310       vmovdqu xmm8,[r11+r14*1+0x10]
0x3558f1e1d3e0  1560  c54059df             vmulps xmm11,xmm7,xmm7
0x3558f1e1d3e4  1564  c4c17a6f4c0b10       vmovdqu xmm1,[r11+rcx*1+0x10]
0x3558f1e1d3eb  156b  c5985cd1             vsubps xmm2,xmm12,xmm1
0x3558f1e1d3ef  156f  c5e859da             vmulps xmm3,xmm2,xmm2
0x3558f1e1d3f3  1573  c52058db             vaddps xmm11,xmm11,xmm3
0x3558f1e1d3f7  1577  c4c120c2de01         vcmpps xmm3,xmm11,xmm14, (lt)
0x3558f1e1d3fd  157d  c5e1dbde             vpand xmm3,xmm3,xmm6
0x3558f1e1d401  1581  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x3558f1e1d405  1585  c5b859db             vmulps xmm3,xmm8,xmm3
0x3558f1e1d409  1589  c5c059fb             vmulps xmm7,xmm7,xmm3
0x3558f1e1d40d  158d  c5f858c7             vaddps xmm0,xmm0,xmm7
0x3558f1e1d411  1591  c4817a7f8423f0000000 vmovdqu [r11+r12*1+0xf0],xmm0
0x3558f1e1d41b  159b  c4817a6f842310010000 vmovdqu xmm0,[r11+r12*1+0x110]
0x3558f1e1d425  15a5  c5e859fb             vmulps xmm7,xmm2,xmm3
0x3558f1e1d429  15a9  c5f858c7             vaddps xmm0,xmm0,xmm7
0x3558f1e1d42d  15ad  c4817a7f842310010000 vmovdqu [r11+r12*1+0x110],xmm0
0x3558f1e1d437  15b7  c4817a6f442350       vmovdqu xmm0,[r11+r12*1+0x50]
0x3558f1e1d43e  15be  c4c108c2fb02         vcmpps xmm7,xmm14,xmm11, (le)
0x3558f1e1d444  15c4  c4c120c2d201         vcmpps xmm2,xmm11,xmm10, (lt)
0x3558f1e1d44a  15ca  c5c1dbfa             vpand xmm7,xmm7,xmm2
0x3558f1e1d44e  15ce  c44110c2db01         vcmpps xmm11,xmm13,xmm11, (lt)
0x3558f1e1d454  15d4  c521dbde             vpand xmm11,xmm11,xmm6
0x3558f1e1d458  15d8  c441785bdb           vcvtdq2ps xmm11,xmm11
0x3558f1e1d45d  15dd  c4c141dbfb           vpand xmm7,xmm7,xmm11
0x3558f1e1d462  15e2  c5b859ff             vmulps xmm7,xmm8,xmm7
0x3558f1e1d466  15e6  c5d059ef             vmulps xmm5,xmm5,xmm7
0x3558f1e1d46a  15ea  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1d46e  15ee  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x3558f1e1d475  15f5  c5f059c7             vmulps xmm0,xmm1,xmm7
0x3558f1e1d479  15f9  c4817a6f6c2370       vmovdqu xmm5,[r11+r12*1+0x70]
0x3558f1e1d480  1600  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1d484  1604  c4817a7f442370       vmovdqu [r11+r12*1+0x70],xmm0
0x3558f1e1d48b  160b  c4817a6f443b10       vmovdqu xmm0,[r11+r15*1+0x10]
0x3558f1e1d492  1612  c5f859c7             vmulps xmm0,xmm0,xmm7
0x3558f1e1d496  1616  c4817a6fac2390000000 vmovdqu xmm5,[r11+r12*1+0x90]
0x3558f1e1d4a0  1620  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1d4a4  1624  c4817a7f842390000000 vmovdqu [r11+r12*1+0x90],xmm0
0x3558f1e1d4ae  162e  c4817a6f440310       vmovdqu xmm0,[r11+r8*1+0x10]
0x3558f1e1d4b5  1635  c5f859c7             vmulps xmm0,xmm0,xmm7
0x3558f1e1d4b9  1639  c4817a6fac23b0000000 vmovdqu xmm5,[r11+r12*1+0xb0]
0x3558f1e1d4c3  1643  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1d4c7  1647  c4817a7f8423b0000000 vmovdqu [r11+r12*1+0xb0],xmm0
0x3558f1e1d4d1  1651  c4817a6f8423d0000000 vmovdqu xmm0,[r11+r12*1+0xd0]
0x3558f1e1d4db  165b  c5c058c0             vaddps xmm0,xmm7,xmm0
0x3558f1e1d4df  165f  c4817a7f8423d0000000 vmovdqu [r11+r12*1+0xd0],xmm0
0x3558f1e1d4e9  1669  4533ff               xorl r15,r15
0x3558f1e1d4ec  166c  448bb538feffff       movl r14,[rbp-0x1c8]
0x3558f1e1d4f3  1673  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3558f1e1d4fb  167b  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3558f1e1d503  1683  498bfb               REX.W movq rdi,r11
0x3558f1e1d506  1686  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3558f1e1d50e  168e  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3558f1e1d516  1696  e9d6060000           jmp 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d51b  169b  8b5de0               movl rbx,[rbp-0x20]
0x3558f1e1d51e  169e  448b9dd8feffff       movl r11,[rbp-0x128]
0x3558f1e1d525  16a5  4183e307             andl r11,0x7
0x3558f1e1d529  16a9  448ba5c8feffff       movl r12,[rbp-0x138]
0x3558f1e1d530  16b0  8b85c0feffff         movl rax,[rbp-0x140]
0x3558f1e1d536  16b6  3b85c8feffff         cmpl rax,[rbp-0x138]
0x3558f1e1d53c  16bc  440f42e0             cmovcl r12,rax
0x3558f1e1d540  16c0  4489e0               movl rax,r12
0x3558f1e1d543  16c3  8bbdd0feffff         movl rdi,[rbp-0x130]
0x3558f1e1d549  16c9  4439e7               cmpl rdi,r12
0x3558f1e1d54c  16cc  0f42c7               cmovcl rax,rdi
0x3558f1e1d54f  16cf  448be0               movl r12,rax
0x3558f1e1d552  16d2  443bd8               cmpl r11,rax
0x3558f1e1d555  16d5  450f42e3             cmovcl r12,r11
0x3558f1e1d559  16d9  4585e4               testl r12,r12
0x3558f1e1d55c  16dc  0f8529000000         jnz 0x3558f1e1d58b  <+0x170b>
0x3558f1e1d562  16e2  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3558f1e1d56a  16ea  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3558f1e1d572  16f2  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3558f1e1d57a  16fa  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3558f1e1d582  1702  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x3558f1e1d586  1706  e966060000           jmp 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d58b  170b  448b9dd8feffff       movl r11,[rbp-0x128]
0x3558f1e1d592  1712  4181e3f8ffff1f       andl r11,0x1ffffff8
0x3558f1e1d599  1719  8bb5e0feffff         movl rsi,[rbp-0x120]
0x3558f1e1d59f  171f  468d1c9e             leal r11,[rsi+r11*4]
0x3558f1e1d5a3  1723  8b85e8feffff         movl rax,[rbp-0x118]
0x3558f1e1d5a9  1729  25f8ffff1f           and rax,0x1ffffff8
0x3558f1e1d5ae  172e  8b9df0feffff         movl rbx,[rbp-0x110]
0x3558f1e1d5b4  1734  8d0483               leal rax,[rbx+rax*4]
0x3558f1e1d5b7  1737  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x3558f1e1d5bb  173b  c5fa100407           vmovss xmm0,[rdi+rax*1]
0x3558f1e1d5c0  1740  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3558f1e1d5c8  1748  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1d5cc  174c  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1d5d0  1750  448b85f8feffff       movl r8,[rbp-0x108]
0x3558f1e1d5d7  1757  c4217a100407         vmovss xmm8,[rdi+r8*1]
0x3558f1e1d5dd  175d  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3558f1e1d5e5  1765  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1d5ea  176a  c4412a59da           vmulss xmm11,xmm10,xmm10
0x3558f1e1d5ef  176f  c5a258ff             vaddss xmm7,xmm11,xmm7
0x3558f1e1d5f3  1773  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3558f1e1d5fb  177b  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1d5ff  177f  0f8789000000         ja 0x3558f1e1d68e  <+0x180e>
0x3558f1e1d605  1785  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3558f1e1d60d  178d  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1d611  1791  0f869f000000         jna 0x3558f1e1d6b6  <+0x1836>
0x3558f1e1d617  1797  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1d61c  179c  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1d621  17a1  0f868f000000         jna 0x3558f1e1d6b6  <+0x1836>
0x3558f1e1d627  17a7  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3558f1e1d62f  17af  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x3558f1e1d634  17b4  c4c10972f619         vpslld xmm14,xmm14,25
0x3558f1e1d63a  17ba  c4c10972d602         vpsrld xmm14,xmm14,2
0x3558f1e1d640  17c0  c4c14258fe           vaddss xmm7,xmm7,xmm14
0x3558f1e1d645  17c5  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d64a  17ca  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1d650  17d0  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1d656  17d6  c5fa103417           vmovss xmm6,[rdi+rdx*1]
0x3558f1e1d65b  17db  c4e37921c620         vinsertps xmm0,xmm0,xmm6,0x20
0x3558f1e1d661  17e1  c4a17a10341f         vmovss xmm6,[rdi+r11*1]
0x3558f1e1d667  17e7  c4e37921c630         vinsertps xmm0,xmm0,xmm6,0x30
0x3558f1e1d66d  17ed  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1d675  17f5  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1d679  17f9  c5fb11bd50ffffff     vmovsd [rbp-0xb0],xmm7
0x3558f1e1d681  1801  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1d689  1809  e928000000           jmp 0x3558f1e1d6b6  <+0x1836>
0x3558f1e1d68e  180e  c52a589528ffffff     vaddss xmm10,xmm10,[rbp-0xd8]
0x3558f1e1d696  1816  c54a588540ffffff     vaddss xmm8,xmm6,[rbp-0xc0]
0x3558f1e1d69e  181e  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3558f1e1d6a6  1826  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1d6ae  182e  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1d6b6  1836  4183fc01             cmpl r12,0x1
0x3558f1e1d6ba  183a  0f8431050000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d6c0  1840  c5fa10440704         vmovss xmm0,[rdi+rax*1+0x4]
0x3558f1e1d6c6  1846  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1d6ca  184a  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1d6ce  184e  c4217a10440704       vmovss xmm8,[rdi+r8*1+0x4]
0x3558f1e1d6d5  1855  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1d6da  185a  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1d6df  185f  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1d6e3  1863  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1d6e7  1867  0f877f000000         ja 0x3558f1e1d76c  <+0x18ec>
0x3558f1e1d6ed  186d  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1d6f1  1871  0f869e000000         jna 0x3558f1e1d795  <+0x1915>
0x3558f1e1d6f7  1877  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1d6fc  187c  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1d701  1881  0f868e000000         jna 0x3558f1e1d795  <+0x1915>
0x3558f1e1d707  1887  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1d70b  188b  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1d710  1890  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1d715  1895  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1d71d  189d  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3558f1e1d721  18a1  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d726  18a6  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1d72c  18ac  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1d732  18b2  c57a10441704         vmovss xmm8,[rdi+rdx*1+0x4]
0x3558f1e1d738  18b8  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1d73e  18be  c4217a10441f04       vmovss xmm8,[rdi+r11*1+0x4]
0x3558f1e1d745  18c5  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1d74b  18cb  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1d753  18d3  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1d757  18d7  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1d75f  18df  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1d767  18e7  e929000000           jmp 0x3558f1e1d795  <+0x1915>
0x3558f1e1d76c  18ec  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1d774  18f4  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1d778  18f8  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1d780  1900  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1d785  1905  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1d78d  190d  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1d795  1915  4183fc02             cmpl r12,0x2
0x3558f1e1d799  1919  0f8452040000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d79f  191f  c5fa10440708         vmovss xmm0,[rdi+rax*1+0x8]
0x3558f1e1d7a5  1925  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1d7a9  1929  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1d7ad  192d  c4217a10440708       vmovss xmm8,[rdi+r8*1+0x8]
0x3558f1e1d7b4  1934  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1d7b9  1939  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1d7be  193e  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1d7c2  1942  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1d7c6  1946  0f877f000000         ja 0x3558f1e1d84b  <+0x19cb>
0x3558f1e1d7cc  194c  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1d7d0  1950  0f869e000000         jna 0x3558f1e1d874  <+0x19f4>
0x3558f1e1d7d6  1956  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1d7db  195b  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1d7e0  1960  0f868e000000         jna 0x3558f1e1d874  <+0x19f4>
0x3558f1e1d7e6  1966  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1d7ea  196a  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1d7ef  196f  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1d7f4  1974  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1d7fc  197c  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3558f1e1d800  1980  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d805  1985  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1d80b  198b  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1d811  1991  c57a10441708         vmovss xmm8,[rdi+rdx*1+0x8]
0x3558f1e1d817  1997  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1d81d  199d  c4217a10441f08       vmovss xmm8,[rdi+r11*1+0x8]
0x3558f1e1d824  19a4  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1d82a  19aa  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1d832  19b2  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1d836  19b6  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1d83e  19be  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1d846  19c6  e929000000           jmp 0x3558f1e1d874  <+0x19f4>
0x3558f1e1d84b  19cb  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1d853  19d3  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1d857  19d7  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1d85f  19df  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1d864  19e4  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1d86c  19ec  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1d874  19f4  4183fc03             cmpl r12,0x3
0x3558f1e1d878  19f8  0f8473030000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d87e  19fe  c5fa1044070c         vmovss xmm0,[rdi+rax*1+0xc]
0x3558f1e1d884  1a04  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1d888  1a08  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1d88c  1a0c  c4217a1044070c       vmovss xmm8,[rdi+r8*1+0xc]
0x3558f1e1d893  1a13  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1d898  1a18  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1d89d  1a1d  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1d8a1  1a21  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1d8a5  1a25  0f877f000000         ja 0x3558f1e1d92a  <+0x1aaa>
0x3558f1e1d8ab  1a2b  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1d8af  1a2f  0f869e000000         jna 0x3558f1e1d953  <+0x1ad3>
0x3558f1e1d8b5  1a35  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1d8ba  1a3a  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1d8bf  1a3f  0f868e000000         jna 0x3558f1e1d953  <+0x1ad3>
0x3558f1e1d8c5  1a45  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1d8c9  1a49  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1d8ce  1a4e  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1d8d3  1a53  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1d8db  1a5b  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3558f1e1d8df  1a5f  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d8e4  1a64  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1d8ea  1a6a  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1d8f0  1a70  c57a1044170c         vmovss xmm8,[rdi+rdx*1+0xc]
0x3558f1e1d8f6  1a76  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1d8fc  1a7c  c4217a10441f0c       vmovss xmm8,[rdi+r11*1+0xc]
0x3558f1e1d903  1a83  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1d909  1a89  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1d911  1a91  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1d915  1a95  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1d91d  1a9d  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1d925  1aa5  e929000000           jmp 0x3558f1e1d953  <+0x1ad3>
0x3558f1e1d92a  1aaa  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1d932  1ab2  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1d936  1ab6  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1d93e  1abe  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1d943  1ac3  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1d94b  1acb  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1d953  1ad3  4183fc04             cmpl r12,0x4
0x3558f1e1d957  1ad7  0f8494020000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1d95d  1add  c5fa10440710         vmovss xmm0,[rdi+rax*1+0x10]
0x3558f1e1d963  1ae3  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1d967  1ae7  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1d96b  1aeb  c4217a10440710       vmovss xmm8,[rdi+r8*1+0x10]
0x3558f1e1d972  1af2  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1d977  1af7  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1d97c  1afc  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1d980  1b00  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1d984  1b04  0f877f000000         ja 0x3558f1e1da09  <+0x1b89>
0x3558f1e1d98a  1b0a  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1d98e  1b0e  0f869e000000         jna 0x3558f1e1da32  <+0x1bb2>
0x3558f1e1d994  1b14  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1d999  1b19  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1d99e  1b1e  0f868e000000         jna 0x3558f1e1da32  <+0x1bb2>
0x3558f1e1d9a4  1b24  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1d9a8  1b28  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1d9ad  1b2d  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1d9b2  1b32  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1d9ba  1b3a  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3558f1e1d9be  1b3e  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1d9c3  1b43  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1d9c9  1b49  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1d9cf  1b4f  c57a10441710         vmovss xmm8,[rdi+rdx*1+0x10]
0x3558f1e1d9d5  1b55  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1d9db  1b5b  c4217a10441f10       vmovss xmm8,[rdi+r11*1+0x10]
0x3558f1e1d9e2  1b62  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1d9e8  1b68  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1d9f0  1b70  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1d9f4  1b74  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1d9fc  1b7c  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1da04  1b84  e929000000           jmp 0x3558f1e1da32  <+0x1bb2>
0x3558f1e1da09  1b89  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1da11  1b91  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1da15  1b95  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1da1d  1b9d  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1da22  1ba2  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1da2a  1baa  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1da32  1bb2  4183fc05             cmpl r12,0x5
0x3558f1e1da36  1bb6  0f84b5010000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1da3c  1bbc  c5fa10440714         vmovss xmm0,[rdi+rax*1+0x14]
0x3558f1e1da42  1bc2  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1da46  1bc6  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1da4a  1bca  c4217a10440714       vmovss xmm8,[rdi+r8*1+0x14]
0x3558f1e1da51  1bd1  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1da56  1bd6  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1da5b  1bdb  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1da5f  1bdf  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1da63  1be3  0f877f000000         ja 0x3558f1e1dae8  <+0x1c68>
0x3558f1e1da69  1be9  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1da6d  1bed  0f869e000000         jna 0x3558f1e1db11  <+0x1c91>
0x3558f1e1da73  1bf3  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1da78  1bf8  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1da7d  1bfd  0f868e000000         jna 0x3558f1e1db11  <+0x1c91>
0x3558f1e1da83  1c03  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1da87  1c07  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1da8c  1c0c  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1da91  1c11  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1da99  1c19  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3558f1e1da9d  1c1d  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1daa2  1c22  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1daa8  1c28  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1daae  1c2e  c57a10441714         vmovss xmm8,[rdi+rdx*1+0x14]
0x3558f1e1dab4  1c34  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1daba  1c3a  c4217a10441f14       vmovss xmm8,[rdi+r11*1+0x14]
0x3558f1e1dac1  1c41  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1dac7  1c47  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1dacf  1c4f  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1dad3  1c53  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1dadb  1c5b  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1dae3  1c63  e929000000           jmp 0x3558f1e1db11  <+0x1c91>
0x3558f1e1dae8  1c68  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1daf0  1c70  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1daf4  1c74  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1dafc  1c7c  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1db01  1c81  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1db09  1c89  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1db11  1c91  4183fc06             cmpl r12,0x6
0x3558f1e1db15  1c95  0f84d6000000         jz 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1db1b  1c9b  c5fa10440718         vmovss xmm0,[rdi+rax*1+0x18]
0x3558f1e1db21  1ca1  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3558f1e1db25  1ca5  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3558f1e1db29  1ca9  c4217a10440718       vmovss xmm8,[rdi+r8*1+0x18]
0x3558f1e1db30  1cb0  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3558f1e1db35  1cb5  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3558f1e1db3a  1cba  c59258ff             vaddss xmm7,xmm13,xmm7
0x3558f1e1db3e  1cbe  c5782edf             vucomiss xmm11,xmm7
0x3558f1e1db42  1cc2  0f8780000000         ja 0x3558f1e1dbc8  <+0x1d48>
0x3558f1e1db48  1cc8  c5782ee7             vucomiss xmm12,xmm7
0x3558f1e1db4c  1ccc  0f869f000000         jna 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1db52  1cd2  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3558f1e1db57  1cd7  c4c1782efd           vucomiss xmm7,xmm13
0x3558f1e1db5c  1cdc  0f868f000000         jna 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1db62  1ce2  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1db66  1ce6  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1db6b  1ceb  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1db70  1cf0  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3558f1e1db78  1cf8  c4c14258f6           vaddss xmm6,xmm7,xmm14
0x3558f1e1db7d  1cfd  c4e27918c0           vbroadcastss xmm0,xmm0
0x3558f1e1db82  1d02  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3558f1e1db88  1d08  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3558f1e1db8e  1d0e  c57a10441718         vmovss xmm8,[rdi+rdx*1+0x18]
0x3558f1e1db94  1d14  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3558f1e1db9a  1d1a  c4217a10441f18       vmovss xmm8,[rdi+r11*1+0x18]
0x3558f1e1dba1  1d21  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3558f1e1dba7  1d27  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3558f1e1dbaf  1d2f  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3558f1e1dbb3  1d33  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3558f1e1dbbb  1d3b  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3558f1e1dbc3  1d43  e929000000           jmp 0x3558f1e1dbf1  <+0x1d71>
0x3558f1e1dbc8  1d48  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3558f1e1dbd0  1d50  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3558f1e1dbd4  1d54  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1dbdc  1d5c  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3558f1e1dbe1  1d61  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3558f1e1dbe9  1d69  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3558f1e1dbf1  1d71  448b5dc8             movl r11,[rbp-0x38]
0x3558f1e1dbf5  1d75  458d6301             leal r12,[r11+0x1]
0x3558f1e1dbf9  1d79  8b8558ffffff         movl rax,[rbp-0xa8]
0x3558f1e1dbff  1d7f  413bc3               cmpl rax,r11
0x3558f1e1dc02  1d82  0f85f8eeffff         jnz 0x3558f1e1cb00  <+0xc80>
0x3558f1e1dc08  1d88  8b5de0               movl rbx,[rbp-0x20]
0x3558f1e1dc0b  1d8b  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3558f1e1dc13  1d93  c57a11441f24         vmovss [rdi+rbx*1+0x24],xmm8
0x3558f1e1dc19  1d99  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3558f1e1dc21  1da1  c5fa117c1f20         vmovss [rdi+rbx*1+0x20],xmm7
0x3558f1e1dc27  1da7  c5fa6f841fa0000000   vmovdqu xmm0,[rdi+rbx*1+0xa0]
0x3558f1e1dc30  1db0  c5fa6fac1f80000000   vmovdqu xmm5,[rdi+rbx*1+0x80]
0x3558f1e1dc39  1db9  c5fa6f741f60         vmovdqu xmm6,[rdi+rbx*1+0x60]
0x3558f1e1dc3f  1dbf  c5fa6f7c1f40         vmovdqu xmm7,[rdi+rbx*1+0x40]
0x3558f1e1dc45  1dc5  c57a6f841fb0000000   vmovdqu xmm8,[rdi+rbx*1+0xb0]
0x3558f1e1dc4e  1dce  c57a6f8c1f90000000   vmovdqu xmm9,[rdi+rbx*1+0x90]
0x3558f1e1dc57  1dd7  c57a6f541f70         vmovdqu xmm10,[rdi+rbx*1+0x70]
0x3558f1e1dc5d  1ddd  c57a6f6c1f50         vmovdqu xmm13,[rdi+rbx*1+0x50]
0x3558f1e1dc63  1de3  c57810b530ffffff     vmovups xmm14,[rbp-0xd0]
0x3558f1e1dc6b  1deb  c57a7f741f10         vmovdqu [rdi+rbx*1+0x10],xmm14
0x3558f1e1dc71  1df1  c57970fe00           vpshufd xmm15,xmm6,0x0
0x3558f1e1dc76  1df6  c5f970cf00           vpshufd xmm1,xmm7,0x0
0x3558f1e1dc7b  1dfb  c4c3710ecf0c         vpblendw xmm1,xmm1,xmm15,0xc
0x3558f1e1dc81  1e01  c57970f800           vpshufd xmm15,xmm0,0x0
0x3558f1e1dc86  1e06  c5f970d500           vpshufd xmm2,xmm5,0x0
0x3558f1e1dc8b  1e0b  c4c3690ed7c0         vpblendw xmm2,xmm2,xmm15,0xc0
0x3558f1e1dc91  1e11  c4e3710ecaf0         vpblendw xmm1,xmm1,xmm2,0xf0
0x3558f1e1dc97  1e17  c57970fe05           vpshufd xmm15,xmm6,0x5
0x3558f1e1dc9c  1e1c  c5f970d705           vpshufd xmm2,xmm7,0x5
0x3558f1e1dca1  1e21  c4c3690ed70c         vpblendw xmm2,xmm2,xmm15,0xc
0x3558f1e1dca7  1e27  c57970f850           vpshufd xmm15,xmm0,0x50
0x3558f1e1dcac  1e2c  c5f970dd50           vpshufd xmm3,xmm5,0x50
0x3558f1e1dcb1  1e31  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x3558f1e1dcb7  1e37  c4e3690ed3f0         vpblendw xmm2,xmm2,xmm3,0xf0
0x3558f1e1dcbd  1e3d  c5f058ca             vaddps xmm1,xmm1,xmm2
0x3558f1e1dcc1  1e41  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x3558f1e1dcc6  1e46  c5f970d70a           vpshufd xmm2,xmm7,0xa
0x3558f1e1dccb  1e4b  c4c3690ed70c         vpblendw xmm2,xmm2,xmm15,0xc
0x3558f1e1dcd1  1e51  c57970f8a0           vpshufd xmm15,xmm0,0xa0
0x3558f1e1dcd6  1e56  c5f970dda0           vpshufd xmm3,xmm5,0xa0
0x3558f1e1dcdb  1e5b  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x3558f1e1dce1  1e61  c4e3690ed3f0         vpblendw xmm2,xmm2,xmm3,0xf0
0x3558f1e1dce7  1e67  c5f058ca             vaddps xmm1,xmm1,xmm2
0x3558f1e1dceb  1e6b  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x3558f1e1dcf0  1e70  c5f970f70f           vpshufd xmm6,xmm7,0xf
0x3558f1e1dcf5  1e75  c4c3490ef70c         vpblendw xmm6,xmm6,xmm15,0xc
0x3558f1e1dcfb  1e7b  c57970f8f0           vpshufd xmm15,xmm0,0xf0
0x3558f1e1dd00  1e80  c5f970c5f0           vpshufd xmm0,xmm5,0xf0
0x3558f1e1dd05  1e85  c4c3790ec7c0         vpblendw xmm0,xmm0,xmm15,0xc0
0x3558f1e1dd0b  1e8b  c4e3490ec0f0         vpblendw xmm0,xmm6,xmm0,0xf0
0x3558f1e1dd11  1e91  c5f058c0             vaddps xmm0,xmm1,xmm0
0x3558f1e1dd15  1e95  c4417970fa00         vpshufd xmm15,xmm10,0x0
0x3558f1e1dd1b  1e9b  c4c17970ed00         vpshufd xmm5,xmm13,0x0
0x3558f1e1dd21  1ea1  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3558f1e1dd27  1ea7  c4417970f800         vpshufd xmm15,xmm8,0x0
0x3558f1e1dd2d  1ead  c4c17970f100         vpshufd xmm6,xmm9,0x0
0x3558f1e1dd33  1eb3  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3558f1e1dd39  1eb9  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3558f1e1dd3f  1ebf  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1dd43  1ec3  c4417970fa05         vpshufd xmm15,xmm10,0x5
0x3558f1e1dd49  1ec9  c4c17970ed05         vpshufd xmm5,xmm13,0x5
0x3558f1e1dd4f  1ecf  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3558f1e1dd55  1ed5  c4417970f850         vpshufd xmm15,xmm8,0x50
0x3558f1e1dd5b  1edb  c4c17970f150         vpshufd xmm6,xmm9,0x50
0x3558f1e1dd61  1ee1  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3558f1e1dd67  1ee7  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3558f1e1dd6d  1eed  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1dd71  1ef1  c4417970fa0a         vpshufd xmm15,xmm10,0xa
0x3558f1e1dd77  1ef7  c4c17970ed0a         vpshufd xmm5,xmm13,0xa
0x3558f1e1dd7d  1efd  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3558f1e1dd83  1f03  c4417970f8a0         vpshufd xmm15,xmm8,0xa0
0x3558f1e1dd89  1f09  c4c17970f1a0         vpshufd xmm6,xmm9,0xa0
0x3558f1e1dd8f  1f0f  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3558f1e1dd95  1f15  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3558f1e1dd9b  1f1b  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1dd9f  1f1f  c4417970fa0f         vpshufd xmm15,xmm10,0xf
0x3558f1e1dda5  1f25  c4c17970ed0f         vpshufd xmm5,xmm13,0xf
0x3558f1e1ddab  1f2b  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3558f1e1ddb1  1f31  c4417970f8f0         vpshufd xmm15,xmm8,0xf0
0x3558f1e1ddb7  1f37  c4c17970f1f0         vpshufd xmm6,xmm9,0xf0
0x3558f1e1ddbd  1f3d  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3558f1e1ddc3  1f43  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3558f1e1ddc9  1f49  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3558f1e1ddcd  1f4d  c4c17858c6           vaddps xmm0,xmm0,xmm14
0x3558f1e1ddd2  1f52  c5fa6fac1fc0000000   vmovdqu xmm5,[rdi+rbx*1+0xc0]
0x3558f1e1dddb  1f5b  c5fa6fb41fe0000000   vmovdqu xmm6,[rdi+rbx*1+0xe0]
0x3558f1e1dde4  1f64  c57970fe00           vpshufd xmm15,xmm6,0x0
0x3558f1e1dde9  1f69  c5f970fd00           vpshufd xmm7,xmm5,0x0
0x3558f1e1ddee  1f6e  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x3558f1e1ddf4  1f74  c57970fe05           vpshufd xmm15,xmm6,0x5
0x3558f1e1ddf9  1f79  c57970c505           vpshufd xmm8,xmm5,0x5
0x3558f1e1ddfe  1f7e  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3558f1e1de04  1f84  c4c14058f8           vaddps xmm7,xmm7,xmm8
0x3558f1e1de09  1f89  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x3558f1e1de0e  1f8e  c57970c50a           vpshufd xmm8,xmm5,0xa
0x3558f1e1de13  1f93  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3558f1e1de19  1f99  c4c14058f8           vaddps xmm7,xmm7,xmm8
0x3558f1e1de1e  1f9e  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x3558f1e1de23  1fa3  c5f970ed0f           vpshufd xmm5,xmm5,0xf
0x3558f1e1de28  1fa8  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3558f1e1de2e  1fae  c5c058ed             vaddps xmm5,xmm7,xmm5
0x3558f1e1de32  1fb2  c5fa6fb41fd0000000   vmovdqu xmm6,[rdi+rbx*1+0xd0]
0x3558f1e1de3b  1fbb  c5fa6fbc1ff0000000   vmovdqu xmm7,[rdi+rbx*1+0xf0]
0x3558f1e1de44  1fc4  c57970ff00           vpshufd xmm15,xmm7,0x0
0x3558f1e1de49  1fc9  c57970c600           vpshufd xmm8,xmm6,0x0
0x3558f1e1de4e  1fce  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3558f1e1de54  1fd4  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3558f1e1de59  1fd9  c57970ff05           vpshufd xmm15,xmm7,0x5
0x3558f1e1de5e  1fde  c57970c605           vpshufd xmm8,xmm6,0x5
0x3558f1e1de63  1fe3  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3558f1e1de69  1fe9  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3558f1e1de6e  1fee  c57970ff0a           vpshufd xmm15,xmm7,0xa
0x3558f1e1de73  1ff3  c57970c60a           vpshufd xmm8,xmm6,0xa
0x3558f1e1de78  1ff8  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3558f1e1de7e  1ffe  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3558f1e1de83  2003  c57970ff0f           vpshufd xmm15,xmm7,0xf
0x3558f1e1de88  2008  c5f970f60f           vpshufd xmm6,xmm6,0xf
0x3558f1e1de8d  200d  c4c3490ef70c         vpblendw xmm6,xmm6,xmm15,0xc
0x3558f1e1de93  2013  c5d058ee             vaddps xmm5,xmm5,xmm6
0x3558f1e1de97  2017  c5fa6f741f20         vmovdqu xmm6,[rdi+rbx*1+0x20]
0x3558f1e1de9d  201d  c5d058ee             vaddps xmm5,xmm5,xmm6
0x3558f1e1dea1  2021  c5fa10b41f04010000   vmovss xmm6,[rdi+rbx*1+0x104]
0x3558f1e1deaa  202a  c5fa10bc1f00010000   vmovss xmm7,[rdi+rbx*1+0x100]
0x3558f1e1deb3  2033  c57a10841f08010000   vmovss xmm8,[rdi+rbx*1+0x108]
0x3558f1e1debc  203c  c57a108c1f0c010000   vmovss xmm9,[rdi+rbx*1+0x10c]
0x3558f1e1dec5  2045  c57a10941f10010000   vmovss xmm10,[rdi+rbx*1+0x110]
0x3558f1e1dece  204e  c57a10ac1f14010000   vmovss xmm13,[rdi+rbx*1+0x114]
0x3558f1e1ded7  2057  c57a10b41f18010000   vmovss xmm14,[rdi+rbx*1+0x118]
0x3558f1e1dee0  2060  c5fa108c1f1c010000   vmovss xmm1,[rdi+rbx*1+0x11c]
0x3558f1e1dee9  2069  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0x3558f1e1def1  2071  c5fa11541f28         vmovss [rdi+rbx*1+0x28],xmm2
0x3558f1e1def7  2077  c5ca58f7             vaddss xmm6,xmm6,xmm7
0x3558f1e1defb  207b  c4c14a58f0           vaddss xmm6,xmm6,xmm8
0x3558f1e1df00  2080  c4c14a58f1           vaddss xmm6,xmm6,xmm9
0x3558f1e1df05  2085  c4c14a58f2           vaddss xmm6,xmm6,xmm10
0x3558f1e1df0a  208a  c4c14a58f5           vaddss xmm6,xmm6,xmm13
0x3558f1e1df0f  208f  c4c14a58f6           vaddss xmm6,xmm6,xmm14
0x3558f1e1df14  2094  c5ca58f1             vaddss xmm6,xmm6,xmm1
0x3558f1e1df18  2098  c5ca58f2             vaddss xmm6,xmm6,xmm2
0x3558f1e1df1c  209c  448b9d70ffffff       movl r11,[rbp-0x90]
0x3558f1e1df23  20a3  c5fa11741f28         vmovss [rdi+rbx*1+0x28],xmm6
0x3558f1e1df29  20a9  4c8d6720             REX.W leaq r12,[rdi+0x20]
0x3558f1e1df2d  20ad  c4c178132c1c         vmovlps [r12+rbx*1],xmm5
0x3558f1e1df33  20b3  c5fa7f441f10         vmovdqu [rdi+rbx*1+0x10],xmm0
0x3558f1e1df39  20b9  8d4b30               leal rcx,[rbx+0x30]
0x3558f1e1df3c  20bc  448d4b10             leal r9,[rbx+0x10]
0x3558f1e1df40  20c0  4c895dc8             REX.W movq [rbp-0x38],r11
0x3558f1e1df44  20c4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1df48  20c8  8b4590               movl rax,[rbp-0x70]
0x3558f1e1df4b  20cb  8b5588               movl rdx,[rbp-0x78]
0x3558f1e1df4e  20ce  c5fb104d80           vmovsd xmm1,[rbp-0x80]
0x3558f1e1df53  20d3  c5fb109578ffffff     vmovsd xmm2,[rbp-0x88]
0x3558f1e1df5b  20db  e8e84df2ff           call 0x3558f1d42d48  (jump table)
0x3558f1e1df60  20e0  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1df63  20e3  3b5dd0               cmpl rbx,[rbp-0x30]
0x3558f1e1df66  20e6  0f8622010000         jna 0x3558f1e1e08e  <+0x220e>
0x3558f1e1df6c  20ec  448b5d98             movl r11,[rbp-0x68]
0x3558f1e1df70  20f0  443b5dd0             cmpl r11,[rbp-0x30]
0x3558f1e1df74  20f4  0f86b4000000         jna 0x3558f1e1e02e  <+0x21ae>
0x3558f1e1df7a  20fa  448b65d0             movl r12,[rbp-0x30]
0x3558f1e1df7e  20fe  448b7da0             movl r15,[rbp-0x60]
0x3558f1e1df82  2102  478d34a7             leal r14,[r15+r12*4]
0x3558f1e1df86  2106  8b45e0               movl rax,[rbp-0x20]
0x3558f1e1df89  2109  488b55c0             REX.W movq rdx,[rbp-0x40]
0x3558f1e1df8d  210d  c5fa10440240         vmovss xmm0,[rdx+rax*1+0x40]
0x3558f1e1df93  2113  c4a17a110432         vmovss [rdx+r14*1],xmm0
0x3558f1e1df99  2119  448b75a8             movl r14,[rbp-0x58]
0x3558f1e1df9d  211d  438d0ca6             leal rcx,[r14+r12*4]
0x3558f1e1dfa1  2121  c5fa10440244         vmovss xmm0,[rdx+rax*1+0x44]
0x3558f1e1dfa7  2127  c5fa11040a           vmovss [rdx+rcx*1],xmm0
0x3558f1e1dfac  212c  8b4db0               movl rcx,[rbp-0x50]
0x3558f1e1dfaf  212f  428d34a1             leal rsi,[rcx+r12*4]
0x3558f1e1dfb3  2133  c5fa10440248         vmovss xmm0,[rdx+rax*1+0x48]
0x3558f1e1dfb9  2139  c5fa110432           vmovss [rdx+rsi*1],xmm0
0x3558f1e1dfbe  213e  8b75b8               movl rsi,[rbp-0x48]
0x3558f1e1dfc1  2141  428d3ca6             leal rdi,[rsi+r12*4]
0x3558f1e1dfc5  2145  c5fa1044024c         vmovss xmm0,[rdx+rax*1+0x4c]
0x3558f1e1dfcb  214b  c5fa11043a           vmovss [rdx+rdi*1],xmm0
0x3558f1e1dfd0  2150  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1dfd4  2154  4489e3               movl rbx,r12
0x3558f1e1dfd7  2157  418bc3               movl rax,r11
0x3558f1e1dfda  215a  4c8bda               REX.W movq r11,rdx
0x3558f1e1dfdd  215d  8bd1                 movl rdx,rcx
0x3558f1e1dfdf  215f  418bce               movl rcx,r14
0x3558f1e1dfe2  2162  418bf7               movl rsi,r15
0x3558f1e1dfe5  2165  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3558f1e1dfe9  2169  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1dfed  216d  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1dff2  2172  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1dff7  2177  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1dfff  217f  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1e007  2187  c5781085b0feffff     vmovups xmm8,[rbp-0x150]
0x3558f1e1e00f  218f  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3558f1e1e017  2197  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3558f1e1e01f  219f  4533c9               xorl r9,r9
0x3558f1e1e022  21a2  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e029  21a9  e9bb000000           jmp 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1e02e  21ae  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1e032  21b2  8b5dd0               movl rbx,[rbp-0x30]
0x3558f1e1e035  21b5  418bc3               movl rax,r11
0x3558f1e1e038  21b8  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e03c  21bc  8b55b0               movl rdx,[rbp-0x50]
0x3558f1e1e03f  21bf  8b4da8               movl rcx,[rbp-0x58]
0x3558f1e1e042  21c2  8b75a0               movl rsi,[rbp-0x60]
0x3558f1e1e045  21c5  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3558f1e1e049  21c9  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1e04d  21cd  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1e052  21d2  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1e057  21d7  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1e05f  21df  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1e067  21e7  c5781085b0feffff     vmovups xmm8,[rbp-0x150]
0x3558f1e1e06f  21ef  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3558f1e1e077  21f7  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3558f1e1e07f  21ff  4533c9               xorl r9,r9
0x3558f1e1e082  2202  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e089  2209  e95b000000           jmp 0x3558f1e1e0e9  <+0x2269>
0x3558f1e1e08e  220e  48895dc8             REX.W movq [rbp-0x38],rbx
0x3558f1e1e092  2212  8b5dd0               movl rbx,[rbp-0x30]
0x3558f1e1e095  2215  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e099  2219  8b55b0               movl rdx,[rbp-0x50]
0x3558f1e1e09c  221c  8b4da8               movl rcx,[rbp-0x58]
0x3558f1e1e09f  221f  8b75a0               movl rsi,[rbp-0x60]
0x3558f1e1e0a2  2222  8b4598               movl rax,[rbp-0x68]
0x3558f1e1e0a5  2225  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3558f1e1e0a9  2229  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1e0ad  222d  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1e0b2  2232  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1e0b7  2237  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1e0bf  223f  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1e0c7  2247  c5781085b0feffff     vmovups xmm8,[rbp-0x150]
0x3558f1e1e0cf  224f  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3558f1e1e0d7  2257  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3558f1e1e0df  225f  4533c9               xorl r9,r9
0x3558f1e1e0e2  2262  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e0e9  2269  83c301               addl rbx,0x1
0x3558f1e1e0ec  226c  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1e0f0  2270  443bfb               cmpl r15,rbx
0x3558f1e1e0f3  2273  0f85c7e5ffff         jnz 0x3558f1e1c6c0  <+0x840>
0x3558f1e1e0f9  2279  448b5de0             movl r11,[rbp-0x20]
0x3558f1e1e0fd  227d  4181c340010000       addl r11,0x140
0x3558f1e1e104  2284  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x3558f1e1e108  2288  45891c24             movl [r12],r11
0x3558f1e1e10c  228c  488be5               REX.W movq rsp,rbp
0x3558f1e1e10f  228f  5d                   pop rbp
0x3558f1e1e110  2290  c3                   retl
0x3558f1e1e111  2291  e8ba53f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e116  2296  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e11a  229a  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3558f1e1e11e  229e  8b45d8               movl rax,[rbp-0x28]
0x3558f1e1e121  22a1  e97eddffff           jmp 0x3558f1e1bea4  <+0x24>
0x3558f1e1e126  22a6  c441792ec0           vucomisd xmm8,xmm8
0x3558f1e1e12b  22ab  0f8b0a000000         jpo 0x3558f1e1e13b  <+0x22bb>
0x3558f1e1e131  22b1  33d2                 xorl rdx,rdx
0x3558f1e1e133  22b3  4c8bf2               REX.W movq r14,rdx
0x3558f1e1e136  22b6  e9d8deffff           jmp 0x3558f1e1c013  <+0x193>
0x3558f1e1e13b  22bb  c4413857c0           vxorps xmm8,xmm8,xmm8
0x3558f1e1e140  22c0  c5782ec7             vucomiss xmm8,xmm7
0x3558f1e1e144  22c4  0f870b000000         ja 0x3558f1e1e155  <+0x22d5>
0x3558f1e1e14a  22ca  41beffffffff         movl r14,0xffffffff
0x3558f1e1e150  22d0  e9bedeffff           jmp 0x3558f1e1c013  <+0x193>
0x3558f1e1e155  22d5  4533f6               xorl r14,r14
0x3558f1e1e158  22d8  e9b6deffff           jmp 0x3558f1e1c013  <+0x193>
0x3558f1e1e15d  22dd  c441792ec9           vucomisd xmm9,xmm9
0x3558f1e1e162  22e2  0f8b08000000         jpo 0x3558f1e1e170  <+0x22f0>
0x3558f1e1e168  22e8  4533f6               xorl r14,r14
0x3558f1e1e16b  22eb  e90bdfffff           jmp 0x3558f1e1c07b  <+0x1fb>
0x3558f1e1e170  22f0  c4413057c9           vxorps xmm9,xmm9,xmm9
0x3558f1e1e175  22f5  c441782ec8           vucomiss xmm9,xmm8
0x3558f1e1e17a  22fa  77ec                 ja 0x3558f1e1e168  <+0x22e8>
0x3558f1e1e17c  22fc  41beffffffff         movl r14,0xffffffff
0x3558f1e1e182  2302  e9f4deffff           jmp 0x3558f1e1c07b  <+0x1fb>
0x3558f1e1e187  2307  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1e18f  230f  4c8945d0             REX.W movq [rbp-0x30],r8
0x3558f1e1e193  2313  48897db0             REX.W movq [rbp-0x50],rdi
0x3558f1e1e197  2317  e83453f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e19c  231c  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e1a0  2320  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e1a7  2327  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1e1ab  232b  8b7db0               movl rdi,[rbp-0x50]
0x3558f1e1e1ae  232e  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1e1b6  2336  8b75a8               movl rsi,[rbp-0x58]
0x3558f1e1e1b9  2339  8b4db8               movl rcx,[rbp-0x48]
0x3558f1e1e1bc  233c  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1e1bf  233f  448b45d0             movl r8,[rbp-0x30]
0x3558f1e1e1c3  2343  e902e0ffff           jmp 0x3558f1e1c1ca  <+0x34a>
0x3558f1e1e1c8  2348  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1e1d0  2350  48894db8             REX.W movq [rbp-0x48],rcx
0x3558f1e1e1d4  2354  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1e1d8  2358  e8f352f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e1dd  235d  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e1e1  2361  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e1e8  2368  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1e1ec  236c  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1e1ef  236f  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1e1f7  2377  8b5da8               movl rbx,[rbp-0x58]
0x3558f1e1e1fa  237a  8b4598               movl rax,[rbp-0x68]
0x3558f1e1e1fd  237d  448b75b0             movl r14,[rbp-0x50]
0x3558f1e1e201  2381  8b4db8               movl rcx,[rbp-0x48]
0x3558f1e1e204  2384  e9c1e0ffff           jmp 0x3558f1e1c2ca  <+0x44a>
0x3558f1e1e209  2389  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1e211  2391  48894db0             REX.W movq [rbp-0x50],rcx
0x3558f1e1e215  2395  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1e219  2399  e8b252f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e21e  239e  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e222  23a2  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e229  23a9  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1e22d  23ad  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1e230  23b0  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1e238  23b8  8b5dc8               movl rbx,[rbp-0x38]
0x3558f1e1e23b  23bb  8b45b8               movl rax,[rbp-0x48]
0x3558f1e1e23e  23be  448b7598             movl r14,[rbp-0x68]
0x3558f1e1e242  23c2  8b4db0               movl rcx,[rbp-0x50]
0x3558f1e1e245  23c5  e980e1ffff           jmp 0x3558f1e1c3ca  <+0x54a>
0x3558f1e1e24a  23ca  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3558f1e1e252  23d2  48895da0             REX.W movq [rbp-0x60],rbx
0x3558f1e1e256  23d6  488955d0             REX.W movq [rbp-0x30],rdx
0x3558f1e1e25a  23da  e87152f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e25f  23df  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e263  23e3  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e26a  23ea  8b55d0               movl rdx,[rbp-0x30]
0x3558f1e1e26d  23ed  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3558f1e1e275  23f5  448b7dd8             movl r15,[rbp-0x28]
0x3558f1e1e279  23f9  8b45c8               movl rax,[rbp-0x38]
0x3558f1e1e27c  23fc  448b75b8             movl r14,[rbp-0x48]
0x3558f1e1e280  2400  8b5da0               movl rbx,[rbp-0x60]
0x3558f1e1e283  2403  e942e2ffff           jmp 0x3558f1e1c4ca  <+0x64a>
0x3558f1e1e288  2408  48895dd0             REX.W movq [rbp-0x30],rbx
0x3558f1e1e28c  240c  e83f52f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e291  2411  8b5dd0               movl rbx,[rbp-0x30]
0x3558f1e1e294  2414  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3558f1e1e298  2418  8b55b0               movl rdx,[rbp-0x50]
0x3558f1e1e29b  241b  8b4da8               movl rcx,[rbp-0x58]
0x3558f1e1e29e  241e  8b75a0               movl rsi,[rbp-0x60]
0x3558f1e1e2a1  2421  8b4598               movl rax,[rbp-0x68]
0x3558f1e1e2a4  2424  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3558f1e1e2a8  2428  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3558f1e1e2ac  242c  c5c172f719           vpslld xmm7,xmm7,25
0x3558f1e1e2b1  2431  c5c172d702           vpsrld xmm7,xmm7,2
0x3558f1e1e2b6  2436  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1e2be  243e  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1e2c6  2446  c5781085b0feffff     vmovups xmm8,[rbp-0x150]
0x3558f1e1e2ce  244e  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3558f1e1e2d6  2456  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3558f1e1e2de  245e  4533c9               xorl r9,r9
0x3558f1e1e2e1  2461  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3558f1e1e2e8  2468  e9dde3ffff           jmp 0x3558f1e1c6ca  <+0x84a>
0x3558f1e1e2ed  246d  c5f92ef6             vucomisd xmm6,xmm6
0x3558f1e1e2f1  2471  0f8b08000000         jpo 0x3558f1e1e2ff  <+0x247f>
0x3558f1e1e2f7  2477  4533db               xorl r11,r11
0x3558f1e1e2fa  247a  e9fae5ffff           jmp 0x3558f1e1c8f9  <+0xa79>
0x3558f1e1e2ff  247f  c5f82ee8             vucomiss xmm5,xmm0
0x3558f1e1e303  2483  77f2                 ja 0x3558f1e1e2f7  <+0x2477>
0x3558f1e1e305  2485  41bbffffffff         movl r11,0xffffffff
0x3558f1e1e30b  248b  e9e9e5ffff           jmp 0x3558f1e1c8f9  <+0xa79>
0x3558f1e1e310  2490  c5f92eff             vucomisd xmm7,xmm7
0x3558f1e1e314  2494  0f8b08000000         jpo 0x3558f1e1e322  <+0x24a2>
0x3558f1e1e31a  249a  4533db               xorl r11,r11
0x3558f1e1e31d  249d  e9e4e6ffff           jmp 0x3558f1e1ca06  <+0xb86>
0x3558f1e1e322  24a2  c5f82ee8             vucomiss xmm5,xmm0
0x3558f1e1e326  24a6  77f2                 ja 0x3558f1e1e31a  <+0x249a>
0x3558f1e1e328  24a8  41bbffffffff         movl r11,0xffffffff
0x3558f1e1e32e  24ae  e9d3e6ffff           jmp 0x3558f1e1ca06  <+0xb86>
0x3558f1e1e333  24b3  e89851f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e338  24b8  4c8b65c0             REX.W movq r12,[rbp-0x40]
0x3558f1e1e33c  24bc  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3558f1e1e340  24c0  448b75c8             movl r14,[rbp-0x38]
0x3558f1e1e344  24c4  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3558f1e1e34c  24cc  c578108d30ffffff     vmovups xmm9,[rbp-0xd0]
0x3558f1e1e354  24d4  c4412176db           vpcmpeqd xmm11,xmm11,xmm11
0x3558f1e1e359  24d9  c4c12172f319         vpslld xmm11,xmm11,25
0x3558f1e1e35f  24df  c4c12172d302         vpsrld xmm11,xmm11,2
0x3558f1e1e365  24e5  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3558f1e1e36d  24ed  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3558f1e1e375  24f5  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3558f1e1e37d  24fd  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3558f1e1e385  2505  c57810a5b0feffff     vmovups xmm12,[rbp-0x150]
0x3558f1e1e38d  250d  c57810b5a0feffff     vmovups xmm14,[rbp-0x160]
0x3558f1e1e395  2515  c57810ad90feffff     vmovups xmm13,[rbp-0x170]
0x3558f1e1e39d  251d  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x3558f1e1e3a5  2525  c5f810b570feffff     vmovups xmm6,[rbp-0x190]
0x3558f1e1e3ad  252d  8b8d60feffff         movl rcx,[rbp-0x1a0]
0x3558f1e1e3b3  2533  448bbd48feffff       movl r15,[rbp-0x1b8]
0x3558f1e1e3ba  253a  8b8538feffff         movl rax,[rbp-0x1c8]
0x3558f1e1e3c0  2540  4533c9               xorl r9,r9
0x3558f1e1e3c3  2543  8b95f8fdffff         movl rdx,[rbp-0x208]
0x3558f1e1e3c9  2549  8bbde8fdffff         movl rdi,[rbp-0x218]
0x3558f1e1e3cf  254f  448b85e0fdffff       movl r8,[rbp-0x220]
0x3558f1e1e3d6  2556  448b9d08feffff       movl r11,[rbp-0x1f8]
0x3558f1e1e3dd  255d  8b9dd0fdffff         movl rbx,[rbp-0x230]
0x3558f1e1e3e3  2563  e9cfe7ffff           jmp 0x3558f1e1cbb7  <+0xd37>
0x3558f1e1e3e8  2568  e8e350f2ff           call 0x3558f1d434d0  (jump table)
0x3558f1e1e3ed  256d  448b8d28feffff       movl r9,[rbp-0x1d8]
0x3558f1e1e3f4  2574  8b9d20feffff         movl rbx,[rbp-0x1e0]
0x3558f1e1e3fa  257a  8b8d18feffff         movl rcx,[rbp-0x1e8]
0x3558f1e1e400  2580  8b9510feffff         movl rdx,[rbp-0x1f0]
0x3558f1e1e406  2586  e9caebffff           jmp 0x3558f1e1cfd5  <+0x1155>
0x3558f1e1e40b  258b  e8004ef2ff           call 0x3558f1d43210  (jump table)
0x3558f1e1e410  2590  90                   nop
0x3558f1e1e411  2591  0f1f00               nop

Protected instructions:
 pc offset
        41         
        62         
       112         
       257         
       25d         
       265         
       26a         
       272         
       27b         
       280         
       285         
       28a         
       2b4         
       2c8         
       2cd         
       2d9         
       2de         
       354         
       365         
       393         
       3e7         
       3ec         
       3f4         
       402         
       40b         
       410         
       453         
       462         
       48c         
       4da         
       4df         
       4e7         
       4f4         
       4fd         
       502         
       553         
       562         
       58c         
       5da         
       5df         
       5e7         
       5f4         
       5fd         
       602         
       653         
       662         
       68c         
       6d8         
       6dd         
       6e5         
       6f2         
       6f7         
       6fe         
       704         
       70b         
       711         
       718         
       71f         
       726         
       72d         
       732         
       737         
       73e         
       745         
       74a         
       74f         
       754         
       77d         
       782         
       787         
       79c         
       7a1         
       7a6         
       7ab         
       7b0         
       7b5         
       7c8         
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
       bf9         
       bfe         
       d5d         
       d65         
      1282         
      12b1         
      12d8         
      12ff         
      1393         
      13c5         
      13cf         
      13e8         
      13f2         
      1414         
      1423         
      1463         
      146d         
      1480         
      14bc         
      14ca         
      14d4         
      14e3         
      14ee         
      14f9         
      1500         
      150a         
      1518         
      1522         
      152c         
      153a         
      1544         
      154e         
      1559         
      1564         
      1591         
      159b         
      15ad         
      15b7         
      15ee         
      15f9         
      1604         
      160b         
      1616         
      1624         
      162e         
      1639         
      1647         
      1651         
      165f         
      173b         
      1757         
      17d6         
      17e1         
      1840         
      184e         
      18b2         
      18be         
      191f         
      192d         
      1991         
      199d         
      19fe         
      1a0c         
      1a70         
      1a7c         
      1add         
      1aeb         
      1b4f         
      1b5b         
      1bbc         
      1bca         
      1c2e         
      1c3a         
      1c9b         
      1ca9         
      1d0e         
      1d1a         
      1d93         
      1da1         
      1da7         
      1db0         
      1db9         
      1dbf         
      1dc5         
      1dce         
      1dd7         
      1ddd         
      1deb         
      1f52         
      1f5b         
      1fb2         
      1fbb         
      2017         
      2021         
      202a         
      2033         
      203c         
      2045         
      204e         
      2057         
      2060         
      2071         
      20a3         
      20ad         
      20b3         
      210d         
      2113         
      2121         
      2127         
      2133         
      2139         
      2145         
      214b         

Source positions:
 pc offset  position
        41        72
        62       109
       112       178
       257       291
       25d       301
       265       305
       26a       312
       272       316
       27b       327
       280       332
       285       337
       28a       342
       28f       345
       2a9       359
       2c8       372
       2cd       379
       2d9       391
       2de       398
       354       440
       365       469
       393       498
       3a3       510
       3e7       526
       3ec       531
       3f4       542
       402       561
       40b       566
       410       573
       453       615
       462       644
       48c       673
       49c       685
       4da       701
       4df       706
       4e7       717
       4f4       736
       4fd       741
       502       748
       553       791
       562       820
       58c       849
       59c       861
       5da       877
       5df       882
       5e7       893
       5f4       912
       5fd       917
       602       924
       653       963
       662       992
       68c      1021
       69c      1033
       6d8      1049
       6dd      1054
       6e5      1065
       6f2      1078
       6f7      1085
       6fe      1095
       704      1099
       70b      1107
       711      1113
       718      1123
       71f      1127
       726      1135
       72d      1141
       732      1148
       737      1157
       73e      1161
       745      1167
       74a      1176
       74f      1183
       754      1190
       77d      1202
       782      1209
       787      1216
       79c      1239
       7a1      1246
       7a6      1253
       7ab      1260
       7b0      1267
       7b5      1274
       7c8      1291
       84a      1318
       85f      1330
       874      1342
       889      1354
       89e      1364
       8a7      1377
       8ad      1384
       8bd      1392
       8c3      1399
       8d3      1407
       8d9      1416
       8e9      1424
       8f6      1427
       901      1434
       908      1441
       90f      1448
       915      1455
       91e      1462
       92c      1485
       933      1491
       93b      1499
       94a      1507
       958      1524
       bee      1781
       bfe      1788
       d5d      1897
       d65      1910
       fa7      2225
      127a      2423
      12b1      2446
      12d8      2464
      12ff      2482
      1393      2547
      13c1      2380
      13cf      2391
      13e8      2572
      13f2      2581
      1414      2603
      1423      2638
      1463      2681
      146d      2690
      1480      2705
      14bc      2768
      14ca      2776
      14d4      2785
      14e3      2799
      14ee      2814
      14f9      2821
      1500      2829
      150a      2840
      1518      2848
      1522      2857
      152c      2868
      153a      2876
      1544      2885
      154e      2894
      1559      2907
      1564      2924
      1591      2967
      159b      2976
      15ad      2991
      15b7      3000
      15ee      3048
      15f9      3063
      1604      3070
      160b      3078
      1616      3089
      1624      3097
      162e      3106
      1639      3117
      1647      3125
      1651      3136
      165f      3144
      1737      3232
      1750      3247
      17d0      3308
      17e1      3316
      1840      3360
      184e      3375
      18ac      3436
      18be      3444
      191f      3488
      192d      3503
      198b      3564
      199d      3572
      19fe      3616
      1a0c      3631
      1a6a      3692
      1a7c      3700
      1add      3744
      1aeb      3759
      1b49      3820
      1b5b      3828
      1bbc      3872
      1bca      3887
      1c28      3948
      1c3a      3956
      1c9b      3998
      1ca9      4013
      1d08      4074
      1d1a      4082
      1d88      4130
      1d99      4137
      1da7      4142
      1db0      4151
      1db9      4160
      1dbf      4168
      1dc5      4176
      1dce      4185
      1dd7      4194
      1ddd      4202
      1de3      4212
      1f52      4742
      1f5b      4751
      1fb2      4853
      1fbb      4862
      2017      4967
      2021      4978
      202a      4986
      2033      4994
      203c      5002
      2045      5010
      204e      5018
      2057      5026
      2060      5034
      2069      5044
      20a3      5084
      20ad      5091
      20b3      5100
      20c0      5128
      2106      5155
      2113      5158
      2121      5168
      2127      5171
      2133      5181
      2139      5184
      2145      5194
      214b      5197
      2291         0
      2307       414
      2348       589
      2389       765
      23ca       937
      2408      1310
      24b3      1834
      2568      2201
      258b      1524

Safepoints (stack slots = 73, entries = 1, byte size = 24)
0x3558f1e1c129    2a9  slots (sp->fp): 0000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 67)
0x3558f1e1c125  internal wasm call
0x3558f1e1c238  internal wasm call
0x3558f1e1c32c  internal wasm call
0x3558f1e1c42c  internal wasm call
0x3558f1e1c52d  internal wasm call
0x3558f1e1c823  external reference (0x193f2f0)
0x3558f1e1ce52  internal wasm call
0x3558f1e1cedb  internal wasm call
0x3558f1e1cf67  internal wasm call
0x3558f1e1cffd  internal wasm call
0x3558f1e1df5c  internal wasm call
0x3558f1e1e112  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e198  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e1d9  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e21a  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e25b  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e28d  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e334  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e3e9  wasm stub call  (0x3558f1d434d0)
0x3558f1e1e40c  wasm stub call  (0x3558f1d43210)
