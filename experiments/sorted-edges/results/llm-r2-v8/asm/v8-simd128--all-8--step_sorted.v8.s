name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 9664 = 9612 + 52 padding)
Instructions (size = 9588)
0x3cfe68ef6e00     0  55                   push rbp
0x3cfe68ef6e01     1  4889e5               REX.W movq rbp,rsp
0x3cfe68ef6e04     4  6a08                 push 0x8
0x3cfe68ef6e06     6  56                   push rsi
0x3cfe68ef6e07     7  4881ec20020000       REX.W subq rsp,0x220
0x3cfe68ef6e0e     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x3cfe68ef6e12    12  488945d8             REX.W movq [rbp-0x28],rax
0x3cfe68ef6e16    16  4c895dc0             REX.W movq [rbp-0x40],r11
0x3cfe68ef6e1a    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef6e1e    1e  0f864d220000         jna 0x3cfe68ef9071  <+0x2271>
0x3cfe68ef6e24    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x3cfe68ef6e28    28  458b3c24             movl r15,[r12]
0x3cfe68ef6e2c    2c  418d9fe0feffff       leal rbx,[r15-0x120]
0x3cfe68ef6e33    33  41891c24             movl [r12],rbx
0x3cfe68ef6e37    37  448bf8               movl r15,rax
0x3cfe68ef6e3a    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x3cfe68ef6e41    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x3cfe68ef6e47    47  c5fa16d0             vmovshdup xmm2,xmm0
0x3cfe68ef6e4b    4b  41ba0000803a         movl r10,0x3a800000
0x3cfe68ef6e51    51  c4c1796eea           vmovd xmm5,r10
0x3cfe68ef6e56    56  c5ea59f5             vmulss xmm6,xmm2,xmm5
0x3cfe68ef6e5a    5a  c5f828c8             vmovaps xmm1,xmm0
0x3cfe68ef6e5e    5e  c5d259e9             vmulss xmm5,xmm5,xmm1
0x3cfe68ef6e62    62  c4817a10bc3ba0000000 vmovss xmm7,[r11+r15*1+0xa0]
0x3cfe68ef6e6c    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x3cfe68ef6e70    70  48895de0             REX.W movq [rbp-0x20],rbx
0x3cfe68ef6e74    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x3cfe68ef6e7b    7b  c5fb119578ffffff     vmovsd [rbp-0x88],xmm2
0x3cfe68ef6e83    83  c5fb114d80           vmovsd [rbp-0x80],xmm1
0x3cfe68ef6e88    88  c5f82eff             vucomiss xmm7,xmm7
0x3cfe68ef6e8c    8c  7a06                 jpe 0x3cfe68ef6e94  <+0x94>
0x3cfe68ef6e8e    8e  0f8404000000         jz 0x3cfe68ef6e98  <+0x98>
0x3cfe68ef6e94    94  c5f928fd             vmovapd xmm7,xmm5
0x3cfe68ef6e98    98  c5f82eed             vucomiss xmm5,xmm5
0x3cfe68ef6e9c    9c  7a06                 jpe 0x3cfe68ef6ea4  <+0xa4>
0x3cfe68ef6e9e    9e  0f8404000000         jz 0x3cfe68ef6ea8  <+0xa8>
0x3cfe68ef6ea4    a4  c5f928ef             vmovapd xmm5,xmm7
0x3cfe68ef6ea8    a8  c5f82efd             vucomiss xmm7,xmm5
0x3cfe68ef6eac    ac  0f8704000000         ja 0x3cfe68ef6eb6  <+0xb6>
0x3cfe68ef6eb2    b2  c5f928fd             vmovapd xmm7,xmm5
0x3cfe68ef6eb6    b6  c5f82eff             vucomiss xmm7,xmm7
0x3cfe68ef6eba    ba  7a06                 jpe 0x3cfe68ef6ec2  <+0xc2>
0x3cfe68ef6ebc    bc  0f8409000000         jz 0x3cfe68ef6ecb  <+0xcb>
0x3cfe68ef6ec2    c2  c5f928ee             vmovapd xmm5,xmm6
0x3cfe68ef6ec6    c6  e904000000           jmp 0x3cfe68ef6ecf  <+0xcf>
0x3cfe68ef6ecb    cb  c5f928ef             vmovapd xmm5,xmm7
0x3cfe68ef6ecf    cf  c5f82ef6             vucomiss xmm6,xmm6
0x3cfe68ef6ed3    d3  7a06                 jpe 0x3cfe68ef6edb  <+0xdb>
0x3cfe68ef6ed5    d5  0f8404000000         jz 0x3cfe68ef6edf  <+0xdf>
0x3cfe68ef6edb    db  c5f928f5             vmovapd xmm6,xmm5
0x3cfe68ef6edf    df  c5f82eee             vucomiss xmm5,xmm6
0x3cfe68ef6ee3    e3  0f8704000000         ja 0x3cfe68ef6eed  <+0xed>
0x3cfe68ef6ee9    e9  c5f928ee             vmovapd xmm5,xmm6
0x3cfe68ef6eed    ed  41ba0020803f         movl r10,0x3f802000
0x3cfe68ef6ef3    f3  c4c1796ef2           vmovd xmm6,r10
0x3cfe68ef6ef8    f8  c5ca59ed             vmulss xmm5,xmm6,xmm5
0x3cfe68ef6efc    fc  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x3cfe68ef6f00   100  c5c972f619           vpslld xmm6,xmm6,25
0x3cfe68ef6f05   105  c5c972d602           vpsrld xmm6,xmm6,2
0x3cfe68ef6f0a   10a  c5ca5eed             vdivss xmm5,xmm6,xmm5
0x3cfe68ef6f0e   10e  c5f828ed             vmovaps xmm5,xmm5
0x3cfe68ef6f12   112  c4817a11ac3b84000000 vmovss [r11+r15*1+0x84],xmm5
0x3cfe68ef6f1c   11c  c4e27918fd           vbroadcastss xmm7,xmm5
0x3cfe68ef6f21   121  c5f859c7             vmulps xmm0,xmm0,xmm7
0x3cfe68ef6f25   125  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x3cfe68ef6f2b   12b  c5f828f8             vmovaps xmm7,xmm0
0x3cfe68ef6f2f   12f  c5425ac7             vcvtss2sd xmm8,xmm7,xmm7
0x3cfe68ef6f33   133  c443310bc80b         vroundsd xmm9,xmm9,xmm8,0xb
0x3cfe68ef6f39   139  c4417b2cf1           vcvttsd2si r14,xmm9
0x3cfe68ef6f3e   13e  4585f6               testl r14,r14
0x3cfe68ef6f41   141  0f892b000000         jns 0x3cfe68ef6f72  <+0x172>
0x3cfe68ef6f47   147  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x3cfe68ef6f51   151  c441f96efa           vmovq xmm15,r10
0x3cfe68ef6f56   156  c4410358f9           vaddsd xmm15,xmm15,xmm9
0x3cfe68ef6f5b   15b  c4417b2cf7           vcvttsd2si r14,xmm15
0x3cfe68ef6f60   160  4585f6               testl r14,r14
0x3cfe68ef6f63   163  0f8809000000         js 0x3cfe68ef6f72  <+0x172>
0x3cfe68ef6f69   169  41ba00000080         movl r10,0x80000000
0x3cfe68ef6f6f   16f  450bf2               orl r14,r10
0x3cfe68ef6f72   172  458bd6               movl r10,r14
0x3cfe68ef6f75   175  c441832ad2           vcvtqsi2sd xmm10,xmm15,r10
0x3cfe68ef6f7a   17a  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef6f82   182  c441792ed1           vucomisd xmm10,xmm9
0x3cfe68ef6f87   187  0f8af9200000         jpe 0x3cfe68ef9086  <+0x2286>
0x3cfe68ef6f8d   18d  0f85f3200000         jnz 0x3cfe68ef9086  <+0x2286>
0x3cfe68ef6f93   193  c4c1796efe           vmovd xmm7,r14
0x3cfe68ef6f98   198  c5f970ff00           vpshufd xmm7,xmm7,0x0
0x3cfe68ef6f9d   19d  c57a16c0             vmovshdup xmm8,xmm0
0x3cfe68ef6fa1   1a1  c4413a5ac8           vcvtss2sd xmm9,xmm8,xmm8
0x3cfe68ef6fa6   1a6  c443290bd10b         vroundsd xmm10,xmm10,xmm9,0xb
0x3cfe68ef6fac   1ac  c4417b2cf2           vcvttsd2si r14,xmm10
0x3cfe68ef6fb1   1b1  4585f6               testl r14,r14
0x3cfe68ef6fb4   1b4  0f8928000000         jns 0x3cfe68ef6fe2  <+0x1e2>
0x3cfe68ef6fba   1ba  4c8b1588ffffff       REX.W movq r10,[rip+0xffffff88]
0x3cfe68ef6fc1   1c1  c441f96efa           vmovq xmm15,r10
0x3cfe68ef6fc6   1c6  c4410358fa           vaddsd xmm15,xmm15,xmm10
0x3cfe68ef6fcb   1cb  c4417b2cf7           vcvttsd2si r14,xmm15
0x3cfe68ef6fd0   1d0  4585f6               testl r14,r14
0x3cfe68ef6fd3   1d3  0f8809000000         js 0x3cfe68ef6fe2  <+0x1e2>
0x3cfe68ef6fd9   1d9  41ba00000080         movl r10,0x80000000
0x3cfe68ef6fdf   1df  450bf2               orl r14,r10
0x3cfe68ef6fe2   1e2  458bd6               movl r10,r14
0x3cfe68ef6fe5   1e5  c441832ada           vcvtqsi2sd xmm11,xmm15,r10
0x3cfe68ef6fea   1ea  c441792eda           vucomisd xmm11,xmm10
0x3cfe68ef6fef   1ef  0f8ac8200000         jpe 0x3cfe68ef90bd  <+0x22bd>
0x3cfe68ef6ff5   1f5  0f85c2200000         jnz 0x3cfe68ef90bd  <+0x22bd>
0x3cfe68ef6ffb   1fb  c4c34122fe01         vpinsrd xmm7,xmm7,r14,0x1
0x3cfe68ef7001   201  49ba0100000001000000 REX.W movq r10,0x100000001
0x3cfe68ef700b   20b  c441f96ec2           vmovq xmm8,r10
0x3cfe68ef7010   210  c441396cc0           vpunpcklqdq xmm8,xmm8,xmm8
0x3cfe68ef7015   215  c4c2413ff8           vpmaxud xmm7,xmm7,xmm8
0x3cfe68ef701a   21a  c44131efc9           vpxor xmm9,xmm9,xmm9
0x3cfe68ef701f   21f  c530c2d002           vcmpps xmm10,xmm9,xmm0, (le)
0x3cfe68ef7024   224  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x3cfe68ef702e   22e  c441f96eda           vmovq xmm11,r10
0x3cfe68ef7033   233  c441216cdb           vpunpcklqdq xmm11,xmm11,xmm11
0x3cfe68ef7038   238  c4c178c2c301         vcmpps xmm0,xmm0,xmm11, (lt)
0x3cfe68ef703e   23e  c5a9dbc0             vpand xmm0,xmm10,xmm0
0x3cfe68ef7042   242  c44179dff8           vpandn xmm15,xmm0,xmm8
0x3cfe68ef7047   247  c5c1dbc0             vpand xmm0,xmm7,xmm0
0x3cfe68ef704b   24b  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x3cfe68ef7050   250  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x3cfe68ef7057   257  c4817813043e         vmovlps [r14+r15*1],xmm0
0x3cfe68ef705d   25d  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x3cfe68ef7065   265  4589741b38           movl [r11+rbx*1+0x38],r14
0x3cfe68ef706a   26a  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x3cfe68ef7072   272  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x3cfe68ef7077   277  448d7060             leal r14,[rax+0x60]
0x3cfe68ef707b   27b  438b543b04           movl rdx,[r11+r15*1+0x4]
0x3cfe68ef7080   280  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x3cfe68ef7085   285  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x3cfe68ef708a   28a  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x3cfe68ef708f   28f  c5781185b0feffff     vmovups [rbp-0x150],xmm8
0x3cfe68ef7097   297  c578118d60ffffff     vmovups [rbp-0xa0],xmm9
0x3cfe68ef709f   29f  418bc6               movl rax,r14
0x3cfe68ef70a2   2a2  8bdf                 movl rbx,rdi
0x3cfe68ef70a4   2a4  e84f6cf2ff           call 0x3cfe68e1dcf8  (jump table)
0x3cfe68ef70a9   2a9  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef70ad   2ad  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef70b4   2b4  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x3cfe68ef70bd   2bd  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef70c1   2c1  418d97a0000000       leal rdx,[r15+0xa0]
0x3cfe68ef70c8   2c8  478b74237c           movl r14,[r11+r12*1+0x7c]
0x3cfe68ef70cd   2cd  438b842380000000     movl rax,[r11+r12*1+0x80]
0x3cfe68ef70d5   2d5  418d0486             leal rax,[r14+rax*4]
0x3cfe68ef70d9   2d9  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x3cfe68ef70de   2de  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x3cfe68ef70e3   2e3  418d7730             leal rsi,[r15+0x30]
0x3cfe68ef70e7   2e7  48895588             REX.W movq [rbp-0x78],rdx
0x3cfe68ef70eb   2eb  4c8975a0             REX.W movq [rbp-0x60],r14
0x3cfe68ef70ef   2ef  48894590             REX.W movq [rbp-0x70],rax
0x3cfe68ef70f3   2f3  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef70f7   2f7  48894db8             REX.W movq [rbp-0x48],rcx
0x3cfe68ef70fb   2fb  488975a8             REX.W movq [rbp-0x58],rsi
0x3cfe68ef70ff   2ff  458bc6               movl r8,r14
0x3cfe68ef7102   302  33ff                 xorl rdi,rdi
0x3cfe68ef7104   304  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef710c   30c  660f1f840000000000   nop
0x3cfe68ef7115   315  660f1f840000000000   nop
0x3cfe68ef711e   31e  660f1f840000000000   nop
0x3cfe68ef7127   327  660f1f840000000000   nop
0x3cfe68ef7130   330  660f1f840000000000   nop
0x3cfe68ef7139   339  0f1f8000000000       nop
0x3cfe68ef7140   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7144   344  0f869d1f0000         jna 0x3cfe68ef90e7  <+0x22e7>
0x3cfe68ef714a   34a  443b4590             cmpl r8,[rbp-0x70]
0x3cfe68ef714e   34e  0f8422000000         jz 0x3cfe68ef7176  <+0x376>
0x3cfe68ef7154   354  478b0c03             movl r9,[r11+r8*1]
0x3cfe68ef7158   358  4183c004             addl r8,0x4
0x3cfe68ef715c   35c  413bd9               cmpl rbx,r9
0x3cfe68ef715f   35f  76df                 jna 0x3cfe68ef7140  <+0x340>
0x3cfe68ef7161   361  468d0c89             leal r9,[rcx+r9*4]
0x3cfe68ef7165   365  c4817a102c0b         vmovss xmm5,[r11+r9*1]
0x3cfe68ef716b   36b  41b901000000         movl r9,0x1
0x3cfe68ef7171   371  e907000000           jmp 0x3cfe68ef717d  <+0x37d>
0x3cfe68ef7176   376  4533c9               xorl r9,r9
0x3cfe68ef7179   379  448b4590             movl r8,[rbp-0x70]
0x3cfe68ef717d   37d  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef7185   385  4c8945d0             REX.W movq [rbp-0x30],r8
0x3cfe68ef7189   389  4183f901             cmpl r9,0x1
0x3cfe68ef718d   38d  0f856f000000         jnz 0x3cfe68ef7202  <+0x402>
0x3cfe68ef7193   393  478b4c2330           movl r9,[r11+r12*1+0x30]
0x3cfe68ef7198   398  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x3cfe68ef719d   39d  0f8540000000         jnz 0x3cfe68ef71e3  <+0x3e3>
0x3cfe68ef71a3   3a3  b901000000           movl rcx,0x1
0x3cfe68ef71a8   3a8  48897db0             REX.W movq [rbp-0x50],rdi
0x3cfe68ef71ac   3ac  8bc6                 movl rax,rsi
0x3cfe68ef71ae   3ae  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef71b2   3b2  8bd7                 movl rdx,rdi
0x3cfe68ef71b4   3b4  4c8bc9               REX.W movq r9,rcx
0x3cfe68ef71b7   3b7  e8446bf2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef71bc   3bc  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef71c0   3c0  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef71c7   3c7  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef71cb   3cb  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef71d3   3d3  448b45d0             movl r8,[rbp-0x30]
0x3cfe68ef71d7   3d7  8b7db0               movl rdi,[rbp-0x50]
0x3cfe68ef71da   3da  8b75a8               movl rsi,[rbp-0x58]
0x3cfe68ef71dd   3dd  8b4db8               movl rcx,[rbp-0x48]
0x3cfe68ef71e0   3e0  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef71e3   3e3  448d7701             leal r14,[rdi+0x1]
0x3cfe68ef71e7   3e7  4789742338           movl [r11+r12*1+0x38],r14
0x3cfe68ef71ec   3ec  438b442334           movl rax,[r11+r12*1+0x34]
0x3cfe68ef71f1   3f1  8d04b8               leal rax,[rax+rdi*4]
0x3cfe68ef71f4   3f4  c4c17a112c03         vmovss [r11+rax*1],xmm5
0x3cfe68ef71fa   3fa  418bfe               movl rdi,r14
0x3cfe68ef71fd   3fd  e93effffff           jmp 0x3cfe68ef7140  <+0x340>
0x3cfe68ef7202   402  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x3cfe68ef720b   40b  478b742314           movl r14,[r11+r12*1+0x14]
0x3cfe68ef7210   410  438b442310           movl rax,[r11+r12*1+0x10]
0x3cfe68ef7215   415  418d5f3c             leal rbx,[r15+0x3c]
0x3cfe68ef7219   419  4c8975b0             REX.W movq [rbp-0x50],r14
0x3cfe68ef721d   41d  48894598             REX.W movq [rbp-0x68],rax
0x3cfe68ef7221   421  48895da8             REX.W movq [rbp-0x58],rbx
0x3cfe68ef7225   425  8b4da0               movl rcx,[rbp-0x60]
0x3cfe68ef7228   428  33d2                 xorl rdx,rdx
0x3cfe68ef722a   42a  660f1f840000000000   nop
0x3cfe68ef7233   433  660f1f840000000000   nop
0x3cfe68ef723c   43c  0f1f4000             nop
0x3cfe68ef7240   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7244   444  0f86de1e0000         jna 0x3cfe68ef9128  <+0x2328>
0x3cfe68ef724a   44a  3b4d90               cmpl rcx,[rbp-0x70]
0x3cfe68ef724d   44d  0f841f000000         jz 0x3cfe68ef7272  <+0x472>
0x3cfe68ef7253   453  418b340b             movl rsi,[r11+rcx*1]
0x3cfe68ef7257   457  83c104               addl rcx,0x4
0x3cfe68ef725a   45a  443bf6               cmpl r14,rsi
0x3cfe68ef725d   45d  76e1                 jna 0x3cfe68ef7240  <+0x440>
0x3cfe68ef725f   45f  8d34b0               leal rsi,[rax+rsi*4]
0x3cfe68ef7262   462  c4c17a102c33         vmovss xmm5,[r11+rsi*1]
0x3cfe68ef7268   468  be01000000           movl rsi,0x1
0x3cfe68ef726d   46d  e905000000           jmp 0x3cfe68ef7277  <+0x477>
0x3cfe68ef7272   472  33f6                 xorl rsi,rsi
0x3cfe68ef7274   474  8b4d90               movl rcx,[rbp-0x70]
0x3cfe68ef7277   477  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef727f   47f  48894db8             REX.W movq [rbp-0x48],rcx
0x3cfe68ef7283   483  83fe01               cmpl rsi,0x1
0x3cfe68ef7286   486  0f8568000000         jnz 0x3cfe68ef72f4  <+0x4f4>
0x3cfe68ef728c   48c  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x3cfe68ef7291   491  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x3cfe68ef7296   496  0f853b000000         jnz 0x3cfe68ef72d7  <+0x4d7>
0x3cfe68ef729c   49c  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef72a0   4a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef72a4   4a4  8bc3                 movl rax,rbx
0x3cfe68ef72a6   4a6  b901000000           movl rcx,0x1
0x3cfe68ef72ab   4ab  e8506af2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef72b0   4b0  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef72b4   4b4  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef72bb   4bb  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef72bf   4bf  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef72c7   4c7  8b4db8               movl rcx,[rbp-0x48]
0x3cfe68ef72ca   4ca  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef72cd   4cd  8b5da8               movl rbx,[rbp-0x58]
0x3cfe68ef72d0   4d0  8b4598               movl rax,[rbp-0x68]
0x3cfe68ef72d3   4d3  448b75b0             movl r14,[rbp-0x50]
0x3cfe68ef72d7   4d7  8d7201               leal rsi,[rdx+0x1]
0x3cfe68ef72da   4da  4389742344           movl [r11+r12*1+0x44],rsi
0x3cfe68ef72df   4df  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x3cfe68ef72e4   4e4  8d1497               leal rdx,[rdi+rdx*4]
0x3cfe68ef72e7   4e7  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3cfe68ef72ed   4ed  8bd6                 movl rdx,rsi
0x3cfe68ef72ef   4ef  e94cffffff           jmp 0x3cfe68ef7240  <+0x440>
0x3cfe68ef72f4   4f4  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x3cfe68ef72fd   4fd  478b742320           movl r14,[r11+r12*1+0x20]
0x3cfe68ef7302   502  438b44231c           movl rax,[r11+r12*1+0x1c]
0x3cfe68ef7307   507  418d5f48             leal rbx,[r15+0x48]
0x3cfe68ef730b   50b  4c897598             REX.W movq [rbp-0x68],r14
0x3cfe68ef730f   50f  488945b8             REX.W movq [rbp-0x48],rax
0x3cfe68ef7313   513  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef7317   517  8b4da0               movl rcx,[rbp-0x60]
0x3cfe68ef731a   51a  33d2                 xorl rdx,rdx
0x3cfe68ef731c   51c  660f1f840000000000   nop
0x3cfe68ef7325   525  660f1f840000000000   nop
0x3cfe68ef732e   52e  660f1f840000000000   nop
0x3cfe68ef7337   537  660f1f840000000000   nop
0x3cfe68ef7340   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7344   544  0f861f1e0000         jna 0x3cfe68ef9169  <+0x2369>
0x3cfe68ef734a   54a  3b4d90               cmpl rcx,[rbp-0x70]
0x3cfe68ef734d   54d  0f841f000000         jz 0x3cfe68ef7372  <+0x572>
0x3cfe68ef7353   553  418b340b             movl rsi,[r11+rcx*1]
0x3cfe68ef7357   557  83c104               addl rcx,0x4
0x3cfe68ef735a   55a  443bf6               cmpl r14,rsi
0x3cfe68ef735d   55d  76e1                 jna 0x3cfe68ef7340  <+0x540>
0x3cfe68ef735f   55f  8d34b0               leal rsi,[rax+rsi*4]
0x3cfe68ef7362   562  c4c17a102c33         vmovss xmm5,[r11+rsi*1]
0x3cfe68ef7368   568  be01000000           movl rsi,0x1
0x3cfe68ef736d   56d  e905000000           jmp 0x3cfe68ef7377  <+0x577>
0x3cfe68ef7372   572  33f6                 xorl rsi,rsi
0x3cfe68ef7374   574  8b4d90               movl rcx,[rbp-0x70]
0x3cfe68ef7377   577  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef737f   57f  48894db0             REX.W movq [rbp-0x50],rcx
0x3cfe68ef7383   583  83fe01               cmpl rsi,0x1
0x3cfe68ef7386   586  0f8568000000         jnz 0x3cfe68ef73f4  <+0x5f4>
0x3cfe68ef738c   58c  438b742348           movl rsi,[r11+r12*1+0x48]
0x3cfe68ef7391   591  4339542348           cmpl [r11+r12*1+0x48],rdx
0x3cfe68ef7396   596  0f853b000000         jnz 0x3cfe68ef73d7  <+0x5d7>
0x3cfe68ef739c   59c  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef73a0   5a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef73a4   5a4  8bc3                 movl rax,rbx
0x3cfe68ef73a6   5a6  b901000000           movl rcx,0x1
0x3cfe68ef73ab   5ab  e85069f2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef73b0   5b0  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef73b4   5b4  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef73bb   5bb  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef73c3   5c3  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef73c7   5c7  8b4db0               movl rcx,[rbp-0x50]
0x3cfe68ef73ca   5ca  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef73cd   5cd  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef73d0   5d0  8b45b8               movl rax,[rbp-0x48]
0x3cfe68ef73d3   5d3  448b7598             movl r14,[rbp-0x68]
0x3cfe68ef73d7   5d7  8d7201               leal rsi,[rdx+0x1]
0x3cfe68ef73da   5da  4389742350           movl [r11+r12*1+0x50],rsi
0x3cfe68ef73df   5df  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x3cfe68ef73e4   5e4  8d1497               leal rdx,[rdi+rdx*4]
0x3cfe68ef73e7   5e7  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3cfe68ef73ed   5ed  8bd6                 movl rdx,rsi
0x3cfe68ef73ef   5ef  e94cffffff           jmp 0x3cfe68ef7340  <+0x540>
0x3cfe68ef73f4   5f4  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x3cfe68ef73fd   5fd  478b74232c           movl r14,[r11+r12*1+0x2c]
0x3cfe68ef7402   602  438b442328           movl rax,[r11+r12*1+0x28]
0x3cfe68ef7407   607  4183c754             addl r15,0x54
0x3cfe68ef740b   60b  4c8975b8             REX.W movq [rbp-0x48],r14
0x3cfe68ef740f   60f  488945c8             REX.W movq [rbp-0x38],rax
0x3cfe68ef7413   613  4c897dd8             REX.W movq [rbp-0x28],r15
0x3cfe68ef7417   617  33d2                 xorl rdx,rdx
0x3cfe68ef7419   619  8b5da0               movl rbx,[rbp-0x60]
0x3cfe68ef741c   61c  660f1f840000000000   nop
0x3cfe68ef7425   625  660f1f840000000000   nop
0x3cfe68ef742e   62e  660f1f840000000000   nop
0x3cfe68ef7437   637  660f1f840000000000   nop
0x3cfe68ef7440   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7444   644  0f86601d0000         jna 0x3cfe68ef91aa  <+0x23aa>
0x3cfe68ef744a   64a  3b5d90               cmpl rbx,[rbp-0x70]
0x3cfe68ef744d   64d  0f841f000000         jz 0x3cfe68ef7472  <+0x672>
0x3cfe68ef7453   653  418b0c1b             movl rcx,[r11+rbx*1]
0x3cfe68ef7457   657  83c304               addl rbx,0x4
0x3cfe68ef745a   65a  443bf1               cmpl r14,rcx
0x3cfe68ef745d   65d  76e1                 jna 0x3cfe68ef7440  <+0x640>
0x3cfe68ef745f   65f  8d0c88               leal rcx,[rax+rcx*4]
0x3cfe68ef7462   662  c4c17a102c0b         vmovss xmm5,[r11+rcx*1]
0x3cfe68ef7468   668  b901000000           movl rcx,0x1
0x3cfe68ef746d   66d  e905000000           jmp 0x3cfe68ef7477  <+0x677>
0x3cfe68ef7472   672  33c9                 xorl rcx,rcx
0x3cfe68ef7474   674  8b5d90               movl rbx,[rbp-0x70]
0x3cfe68ef7477   677  48895da0             REX.W movq [rbp-0x60],rbx
0x3cfe68ef747b   67b  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef7483   683  83f901               cmpl rcx,0x1
0x3cfe68ef7486   686  0f8566000000         jnz 0x3cfe68ef74f2  <+0x6f2>
0x3cfe68ef748c   68c  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x3cfe68ef7491   691  4339542354           cmpl [r11+r12*1+0x54],rdx
0x3cfe68ef7496   696  0f8539000000         jnz 0x3cfe68ef74d5  <+0x6d5>
0x3cfe68ef749c   69c  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef74a0   6a0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef74a4   6a4  418bc7               movl rax,r15
0x3cfe68ef74a7   6a7  b901000000           movl rcx,0x1
0x3cfe68ef74ac   6ac  e84f68f2ff           call 0x3cfe68e1dd00  (jump table)
0x3cfe68ef74b1   6b1  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef74b5   6b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef74bc   6bc  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef74bf   6bf  8b5da0               movl rbx,[rbp-0x60]
0x3cfe68ef74c2   6c2  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef74ca   6ca  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef74ce   6ce  8b45c8               movl rax,[rbp-0x38]
0x3cfe68ef74d1   6d1  448b75b8             movl r14,[rbp-0x48]
0x3cfe68ef74d5   6d5  8d4a01               leal rcx,[rdx+0x1]
0x3cfe68ef74d8   6d8  43894c235c           movl [r11+r12*1+0x5c],rcx
0x3cfe68ef74dd   6dd  438b742358           movl rsi,[r11+r12*1+0x58]
0x3cfe68ef74e2   6e2  8d1496               leal rdx,[rsi+rdx*4]
0x3cfe68ef74e5   6e5  c4c17a112c13         vmovss [r11+rdx*1],xmm5
0x3cfe68ef74eb   6eb  8bd1                 movl rdx,rcx
0x3cfe68ef74ed   6ed  e94effffff           jmp 0x3cfe68ef7440  <+0x640>
0x3cfe68ef74f2   6f2  478b7c2338           movl r15,[r11+r12*1+0x38]
0x3cfe68ef74f7   6f7  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x3cfe68ef74fe   6fe  c4817a6f2c23         vmovdqu xmm5,[r11+r12*1]
0x3cfe68ef7504   704  c4817a7f6c2330       vmovdqu [r11+r12*1+0x30],xmm5
0x3cfe68ef750b   70b  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x3cfe68ef7511   711  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x3cfe68ef7518   718  c4817a6f6c2310       vmovdqu xmm5,[r11+r12*1+0x10]
0x3cfe68ef751f   71f  c4817a7f6c2340       vmovdqu [r11+r12*1+0x40],xmm5
0x3cfe68ef7526   726  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x3cfe68ef752d   72d  4f8b742350           REX.W movq r14,[r11+r12*1+0x50]
0x3cfe68ef7532   732  438b442358           movl rax,[r11+r12*1+0x58]
0x3cfe68ef7537   737  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x3cfe68ef753e   73e  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x3cfe68ef7545   745  438b5c232c           movl rbx,[r11+r12*1+0x2c]
0x3cfe68ef754a   74a  438954232c           movl [r11+r12*1+0x2c],rdx
0x3cfe68ef754f   74f  4389442328           movl [r11+r12*1+0x28],rax
0x3cfe68ef7554   754  4f89742320           REX.W movq [r11+r12*1+0x20],r14
0x3cfe68ef7559   759  4c897dd8             REX.W movq [rbp-0x28],r15
0x3cfe68ef755d   75d  4585ff               testl r15,r15
0x3cfe68ef7560   760  0f8517000000         jnz 0x3cfe68ef757d  <+0x77d>
0x3cfe68ef7566   766  448b75e0             movl r14,[rbp-0x20]
0x3cfe68ef756a   76a  458d9e20010000       leal r11,[r14+0x120]
0x3cfe68ef7571   771  488b45e8             REX.W movq rax,[rbp-0x18]
0x3cfe68ef7575   775  448918               movl [rax],r11
0x3cfe68ef7578   778  488be5               REX.W movq rsp,rbp
0x3cfe68ef757b   77b  5d                   pop rbp
0x3cfe68ef757c   77c  c3                   retl
0x3cfe68ef757d   77d  478b742350           movl r14,[r11+r12*1+0x50]
0x3cfe68ef7582   782  438b442344           movl rax,[r11+r12*1+0x44]
0x3cfe68ef7587   787  438b542338           movl rdx,[r11+r12*1+0x38]
0x3cfe68ef758c   78c  8bca                 movl rcx,rdx
0x3cfe68ef758e   78e  3bc2                 cmpl rax,rdx
0x3cfe68ef7590   790  0f42c8               cmovcl rcx,rax
0x3cfe68ef7593   793  8bc1                 movl rax,rcx
0x3cfe68ef7595   795  443bf1               cmpl r14,rcx
0x3cfe68ef7598   798  410f42c6             cmovcl rax,r14
0x3cfe68ef759c   79c  478b742358           movl r14,[r11+r12*1+0x58]
0x3cfe68ef75a1   7a1  438b54234c           movl rdx,[r11+r12*1+0x4c]
0x3cfe68ef75a6   7a6  438b4c2340           movl rcx,[r11+r12*1+0x40]
0x3cfe68ef75ab   7ab  438b742334           movl rsi,[r11+r12*1+0x34]
0x3cfe68ef75b0   7b0  438b7c235c           movl rdi,[r11+r12*1+0x5c]
0x3cfe68ef75b5   7b5  c4817a108423a0000000 vmovss xmm0,[r11+r12*1+0xa0]
0x3cfe68ef75bf   7bf  c5fa59d0             vmulss xmm2,xmm0,xmm0
0x3cfe68ef75c3   7c3  c4e27918c2           vbroadcastss xmm0,xmm2
0x3cfe68ef75c8   7c8  c4817a10ac23a4000000 vmovss xmm5,[r11+r12*1+0xa4]
0x3cfe68ef75d2   7d2  c5d259cd             vmulss xmm1,xmm5,xmm5
0x3cfe68ef75d6   7d6  c4e27918e9           vbroadcastss xmm5,xmm1
0x3cfe68ef75db   7db  48894598             REX.W movq [rbp-0x68],rax
0x3cfe68ef75df   7df  4c8975b8             REX.W movq [rbp-0x48],r14
0x3cfe68ef75e3   7e3  488955b0             REX.W movq [rbp-0x50],rdx
0x3cfe68ef75e7   7e7  48894da8             REX.W movq [rbp-0x58],rcx
0x3cfe68ef75eb   7eb  488975a0             REX.W movq [rbp-0x60],rsi
0x3cfe68ef75ef   7ef  4889bd70ffffff       REX.W movq [rbp-0x90],rdi
0x3cfe68ef75f6   7f6  c5fb119518ffffff     vmovsd [rbp-0xe8],xmm2
0x3cfe68ef75fe   7fe  c5f81185a0feffff     vmovups [rbp-0x160],xmm0
0x3cfe68ef7606   806  c5fb118d10ffffff     vmovsd [rbp-0xf0],xmm1
0x3cfe68ef760e   80e  c5f811ad90feffff     vmovups [rbp-0x170],xmm5
0x3cfe68ef7616   816  4533c9               xorl r9,r9
0x3cfe68ef7619   819  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef761d   81d  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3cfe68ef7621   821  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3cfe68ef7626   826  c4c13972f019         vpslld xmm8,xmm8,25
0x3cfe68ef762c   82c  c4c13972d002         vpsrld xmm8,xmm8,2
0x3cfe68ef7632   832  c5f810bdb0feffff     vmovups xmm7,[rbp-0x150]
0x3cfe68ef763a   83a  498bd9               REX.W movq rbx,r9
0x3cfe68ef763d   83d  0f1f00               nop
0x3cfe68ef7640   840  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7644   844  0f869e1b0000         jna 0x3cfe68ef91e8  <+0x23e8>
0x3cfe68ef764a   84a  478b7c2308           movl r15,[r11+r12*1+0x8]
0x3cfe68ef764f   84f  4c89bdd8fdffff       REX.W movq [rbp-0x228],r15
0x3cfe68ef7656   856  443bfb               cmpl r15,rbx
0x3cfe68ef7659   859  0f86ea190000         jna 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef765f   85f  478b7c2314           movl r15,[r11+r12*1+0x14]
0x3cfe68ef7664   864  4c89bde0fdffff       REX.W movq [rbp-0x220],r15
0x3cfe68ef766b   86b  443bfb               cmpl r15,rbx
0x3cfe68ef766e   86e  0f86d5190000         jna 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef7674   874  478b7c2320           movl r15,[r11+r12*1+0x20]
0x3cfe68ef7679   879  4c89bd08feffff       REX.W movq [rbp-0x1f8],r15
0x3cfe68ef7680   880  443bfb               cmpl r15,rbx
0x3cfe68ef7683   883  0f86c0190000         jna 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef7689   889  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x3cfe68ef768e   88e  4c89bdf8fdffff       REX.W movq [rbp-0x208],r15
0x3cfe68ef7695   895  443bfb               cmpl r15,rbx
0x3cfe68ef7698   898  0f86ab190000         jna 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef769e   89e  478b7c2304           movl r15,[r11+r12*1+0x4]
0x3cfe68ef76a3   8a3  458d349f             leal r14,[r15+rbx*4]
0x3cfe68ef76a7   8a7  c4817a101c33         vmovss xmm3,[r11+r14*1]
0x3cfe68ef76ad   8ad  478b742310           movl r14,[r11+r12*1+0x10]
0x3cfe68ef76b2   8b2  4c89bd48feffff       REX.W movq [rbp-0x1b8],r15
0x3cfe68ef76b9   8b9  458d3c9e             leal r15,[r14+rbx*4]
0x3cfe68ef76bd   8bd  c4817a10243b         vmovss xmm4,[r11+r15*1]
0x3cfe68ef76c3   8c3  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x3cfe68ef76c8   8c8  4c89b558feffff       REX.W movq [rbp-0x1a8],r14
0x3cfe68ef76cf   8cf  458d349f             leal r14,[r15+rbx*4]
0x3cfe68ef76d3   8d3  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x3cfe68ef76d9   8d9  478b742328           movl r14,[r11+r12*1+0x28]
0x3cfe68ef76de   8de  4c89bd60feffff       REX.W movq [rbp-0x1a0],r15
0x3cfe68ef76e5   8e5  458d3c9e             leal r15,[r14+rbx*4]
0x3cfe68ef76e9   8e9  4c89b568feffff       REX.W movq [rbp-0x198],r14
0x3cfe68ef76f0   8f0  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x3cfe68ef76f6   8f6  448b75e0             movl r14,[rbp-0x20]
0x3cfe68ef76fa   8fa  c4017a1154330c       vmovss [r11+r14*1+0xc],xmm10
0x3cfe68ef7701   901  c4017a114c3308       vmovss [r11+r14*1+0x8],xmm9
0x3cfe68ef7708   908  c4817a11643304       vmovss [r11+r14*1+0x4],xmm4
0x3cfe68ef770f   90f  c4817a111c33         vmovss [r11+r14*1],xmm3
0x3cfe68ef7715   915  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x3cfe68ef771e   91e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x3cfe68ef7727   927  c44131efc9           vpxor xmm9,xmm9,xmm9
0x3cfe68ef772c   92c  c4017a7f4c3310       vmovdqu [r11+r14*1+0x10],xmm9
0x3cfe68ef7733   933  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x3cfe68ef773b   93b  4c89bd00feffff       REX.W movq [rbp-0x200],r15
0x3cfe68ef7742   942  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x3cfe68ef774a   94a  c4017a108c2384000000 vmovss xmm9,[r11+r12*1+0x84]
0x3cfe68ef7754   954  458d5e40             leal r11,[r14+0x40]
0x3cfe68ef7758   958  4989e2               REX.W movq r10,rsp
0x3cfe68ef775b   95b  4883ec08             REX.W subq rsp,0x8
0x3cfe68ef775f   95f  4883e4f0             REX.W andq rsp,0xf0
0x3cfe68ef7763   963  4c891424             REX.W movq [rsp],r10
0x3cfe68ef7767   967  48895dd0             REX.W movq [rbp-0x30],rbx
0x3cfe68ef776b   96b  c5fb119d00ffffff     vmovsd [rbp-0x100],xmm3
0x3cfe68ef7773   973  c5fb11a508ffffff     vmovsd [rbp-0xf8],xmm4
0x3cfe68ef777b   97b  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x3cfe68ef7782   982  c57b118d50ffffff     vmovsd [rbp-0xb0],xmm9
0x3cfe68ef778a   98a  4c895d90             REX.W movq [rbp-0x70],r11
0x3cfe68ef778e   98e  488b7df0             REX.W movq rdi,[rbp-0x10]
0x3cfe68ef7792   992  498bf1               REX.W movq rsi,r9
0x3cfe68ef7795   995  418bd3               movl rdx,r11
0x3cfe68ef7798   998  498bc9               REX.W movq rcx,r9
0x3cfe68ef779b   99b  41b8e0000000         movl r8,0xe0
0x3cfe68ef77a1   9a1  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x3cfe68ef77ab   9ab  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x3cfe68ef77b2   9b2  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x3cfe68ef77b9   9b9  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x3cfe68ef77c0   9c0  ffd0                 call rax
0x3cfe68ef77c2   9c2  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x3cfe68ef77cd   9cd  488b2424             REX.W movq rsp,[rsp]
0x3cfe68ef77d1   9d1  85c0                 testl rax,rax
0x3cfe68ef77d3   9d3  0f84951b0000         jz 0x3cfe68ef936e  <+0x256e>
0x3cfe68ef77d9   9d9  4533db               xorl r11,r11
0x3cfe68ef77dc   9dc  83bd58ffffff00       cmpl [rbp-0xa8],0x0
0x3cfe68ef77e3   9e3  410f95c3             setnzl r11l
0x3cfe68ef77e7   9e7  448ba558ffffff       movl r12,[rbp-0xa8]
0x3cfe68ef77ee   9ee  452be3               subl r12,r11
0x3cfe68ef77f1   9f1  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef77f9   9f9  c5da598550ffffff     vmulss xmm0,xmm4,[rbp-0xb0]
0x3cfe68ef7801   a01  c5f82ec0             vucomiss xmm0,xmm0
0x3cfe68ef7805   a05  7a06                 jpe 0x3cfe68ef780d  <+0xa0d>
0x3cfe68ef7807   a07  0f8404000000         jz 0x3cfe68ef7811  <+0xa11>
0x3cfe68ef780d   a0d  c5f857c0             vxorps xmm0,xmm0,xmm0
0x3cfe68ef7811   a11  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3cfe68ef7815   a15  c5f82ec5             vucomiss xmm0,xmm5
0x3cfe68ef7819   a19  0f8704000000         ja 0x3cfe68ef7823  <+0xa23>
0x3cfe68ef781f   a1f  c5f928c5             vmovapd xmm0,xmm5
0x3cfe68ef7823   a23  c5fa5af0             vcvtss2sd xmm6,xmm0,xmm0
0x3cfe68ef7827   a27  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x3cfe68ef782d   a2d  c57b2cdf             vcvttsd2si r11,xmm7
0x3cfe68ef7831   a31  4585db               testl r11,r11
0x3cfe68ef7834   a34  0f8927000000         jns 0x3cfe68ef7861  <+0xa61>
0x3cfe68ef783a   a3a  4c8b1508f7ffff       REX.W movq r10,[rip+0xfffff708]
0x3cfe68ef7841   a41  c441f96efa           vmovq xmm15,r10
0x3cfe68ef7846   a46  c50358ff             vaddsd xmm15,xmm15,xmm7
0x3cfe68ef784a   a4a  c4417b2cdf           vcvttsd2si r11,xmm15
0x3cfe68ef784f   a4f  4585db               testl r11,r11
0x3cfe68ef7852   a52  0f8809000000         js 0x3cfe68ef7861  <+0xa61>
0x3cfe68ef7858   a58  41ba00000080         movl r10,0x80000000
0x3cfe68ef785e   a5e  450bda               orl r11,r10
0x3cfe68ef7861   a61  458bd3               movl r10,r11
0x3cfe68ef7864   a64  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x3cfe68ef7869   a69  c5792ec7             vucomisd xmm8,xmm7
0x3cfe68ef786d   a6d  0f8add190000         jpe 0x3cfe68ef9250  <+0x2450>
0x3cfe68ef7873   a73  0f85d7190000         jnz 0x3cfe68ef9250  <+0x2450>
0x3cfe68ef7879   a79  458bfb               movl r15,r11
0x3cfe68ef787c   a7c  453be3               cmpl r12,r11
0x3cfe68ef787f   a7f  450f42fc             cmovcl r15,r12
0x3cfe68ef7883   a83  41ba0000804f         movl r10,0x4f800000
0x3cfe68ef7889   a89  c4c1796ef2           vmovd xmm6,r10
0x3cfe68ef788e   a8e  4533db               xorl r11,r11
0x3cfe68ef7891   a91  c5f82ef0             vucomiss xmm6,xmm0
0x3cfe68ef7895   a95  450f47df             cmoval r11,r15
0x3cfe68ef7899   a99  4533ff               xorl r15,r15
0x3cfe68ef789c   a9c  4585db               testl r11,r11
0x3cfe68ef789f   a9f  410f95c7             setnzl r15l
0x3cfe68ef78a3   aa3  458bf3               movl r14,r11
0x3cfe68ef78a6   aa6  452bf7               subl r14,r15
0x3cfe68ef78a9   aa9  4183c301             addl r11,0x1
0x3cfe68ef78ad   aad  458bfb               movl r15,r11
0x3cfe68ef78b0   ab0  453be3               cmpl r12,r11
0x3cfe68ef78b3   ab3  450f42fc             cmovcl r15,r12
0x3cfe68ef78b7   ab7  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x3cfe68ef78be   abe  453bf7               cmpl r14,r15
0x3cfe68ef78c1   ac1  0f8620000000         jna 0x3cfe68ef78e7  <+0xae7>
0x3cfe68ef78c7   ac7  4c8b75c0             REX.W movq r14,[rbp-0x40]
0x3cfe68ef78cb   acb  c5f928f5             vmovapd xmm6,xmm5
0x3cfe68ef78cf   acf  448b5dc8             movl r11,[rbp-0x38]
0x3cfe68ef78d3   ad3  c5f8108560ffffff     vmovups xmm0,[rbp-0xa0]
0x3cfe68ef78db   adb  8b5de0               movl rbx,[rbp-0x20]
0x3cfe68ef78de   ade  c5f928e8             vmovapd xmm5,xmm0
0x3cfe68ef78e2   ae2  e991150000           jmp 0x3cfe68ef8e78  <+0x2078>
0x3cfe68ef78e7   ae7  4533db               xorl r11,r11
0x3cfe68ef78ea   aea  83bd00feffff00       cmpl [rbp-0x200],0x0
0x3cfe68ef78f1   af1  410f95c3             setnzl r11l
0x3cfe68ef78f5   af5  448ba500feffff       movl r12,[rbp-0x200]
0x3cfe68ef78fc   afc  452be3               subl r12,r11
0x3cfe68ef78ff   aff  c5fb108550ffffff     vmovsd xmm0,[rbp-0xb0]
0x3cfe68ef7907   b07  c5fa598500ffffff     vmulss xmm0,xmm0,[rbp-0x100]
0x3cfe68ef790f   b0f  c5f82ec0             vucomiss xmm0,xmm0
0x3cfe68ef7913   b13  7a06                 jpe 0x3cfe68ef791b  <+0xb1b>
0x3cfe68ef7915   b15  0f8404000000         jz 0x3cfe68ef791f  <+0xb1f>
0x3cfe68ef791b   b1b  c5f928c5             vmovapd xmm0,xmm5
0x3cfe68ef791f   b1f  c5f82ec5             vucomiss xmm0,xmm5
0x3cfe68ef7923   b23  0f8704000000         ja 0x3cfe68ef792d  <+0xb2d>
0x3cfe68ef7929   b29  c5f928c5             vmovapd xmm0,xmm5
0x3cfe68ef792d   b2d  c5fa5af8             vcvtss2sd xmm7,xmm0,xmm0
0x3cfe68ef7931   b31  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x3cfe68ef7937   b37  c4417b2cd8           vcvttsd2si r11,xmm8
0x3cfe68ef793c   b3c  4585db               testl r11,r11
0x3cfe68ef793f   b3f  0f8928000000         jns 0x3cfe68ef796d  <+0xb6d>
0x3cfe68ef7945   b45  4c8b15fdf5ffff       REX.W movq r10,[rip+0xfffff5fd]
0x3cfe68ef794c   b4c  c441f96efa           vmovq xmm15,r10
0x3cfe68ef7951   b51  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x3cfe68ef7956   b56  c4417b2cdf           vcvttsd2si r11,xmm15
0x3cfe68ef795b   b5b  4585db               testl r11,r11
0x3cfe68ef795e   b5e  0f8809000000         js 0x3cfe68ef796d  <+0xb6d>
0x3cfe68ef7964   b64  41ba00000080         movl r10,0x80000000
0x3cfe68ef796a   b6a  450bda               orl r11,r10
0x3cfe68ef796d   b6d  458bd3               movl r10,r11
0x3cfe68ef7970   b70  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x3cfe68ef7975   b75  c441792ec8           vucomisd xmm9,xmm8
0x3cfe68ef797a   b7a  0f8af3180000         jpe 0x3cfe68ef9273  <+0x2473>
0x3cfe68ef7980   b80  0f85ed180000         jnz 0x3cfe68ef9273  <+0x2473>
0x3cfe68ef7986   b86  418bc3               movl rax,r11
0x3cfe68ef7989   b89  453be3               cmpl r12,r11
0x3cfe68ef798c   b8c  410f42c4             cmovcl rax,r12
0x3cfe68ef7990   b90  4533db               xorl r11,r11
0x3cfe68ef7993   b93  c5f82ef0             vucomiss xmm6,xmm0
0x3cfe68ef7997   b97  440f47d8             cmoval r11,rax
0x3cfe68ef799b   b9b  33c0                 xorl rax,rax
0x3cfe68ef799d   b9d  4585db               testl r11,r11
0x3cfe68ef79a0   ba0  0f95c0               setnzl al
0x3cfe68ef79a3   ba3  418bdb               movl rbx,r11
0x3cfe68ef79a6   ba6  2bd8                 subl rbx,rax
0x3cfe68ef79a8   ba8  8b9508feffff         movl rdx,[rbp-0x1f8]
0x3cfe68ef79ae   bae  8b85f8fdffff         movl rax,[rbp-0x208]
0x3cfe68ef79b4   bb4  3b95f8fdffff         cmpl rdx,[rbp-0x208]
0x3cfe68ef79ba   bba  0f42c2               cmovcl rax,rdx
0x3cfe68ef79bd   bbd  8bb5e0fdffff         movl rsi,[rbp-0x220]
0x3cfe68ef79c3   bc3  8bc8                 movl rcx,rax
0x3cfe68ef79c5   bc5  3bf0                 cmpl rsi,rax
0x3cfe68ef79c7   bc7  0f42ce               cmovcl rcx,rsi
0x3cfe68ef79ca   bca  8bbdd8fdffff         movl rdi,[rbp-0x228]
0x3cfe68ef79d0   bd0  8bc1                 movl rax,rcx
0x3cfe68ef79d2   bd2  3bf9                 cmpl rdi,rcx
0x3cfe68ef79d4   bd4  0f42c7               cmovcl rax,rdi
0x3cfe68ef79d7   bd7  4183c301             addl r11,0x1
0x3cfe68ef79db   bdb  418bcb               movl rcx,r11
0x3cfe68ef79de   bde  453be3               cmpl r12,r11
0x3cfe68ef79e1   be1  410f42cc             cmovcl rcx,r12
0x3cfe68ef79e5   be5  448d5901             leal r11,[rcx+0x1]
0x3cfe68ef79e9   be9  c4e27918c4           vbroadcastss xmm0,xmm4
0x3cfe68ef79ee   bee  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef79f6   bf6  c4e27918f3           vbroadcastss xmm6,xmm3
0x3cfe68ef79fb   bfb  488b8d48ffffff       REX.W movq rcx,[rbp-0xb8]
0x3cfe68ef7a02   c02  4c8b65c0             REX.W movq r12,[rbp-0x40]
0x3cfe68ef7a06   c06  458b440c64           movl r8,[r12+rcx*1+0x64]
0x3cfe68ef7a0b   c0b  458b4c0c68           movl r9,[r12+rcx*1+0x68]
0x3cfe68ef7a10   c10  c5c1efff             vpxor xmm7,xmm7,xmm7
0x3cfe68ef7a14   c14  48899dd0fdffff       REX.W movq [rbp-0x230],rbx
0x3cfe68ef7a1b   c1b  48898540feffff       REX.W movq [rbp-0x1c0],rax
0x3cfe68ef7a22   c22  4c899d10feffff       REX.W movq [rbp-0x1f0],r11
0x3cfe68ef7a29   c29  c5f8118580feffff     vmovups [rbp-0x180],xmm0
0x3cfe68ef7a31   c31  c5f811b570feffff     vmovups [rbp-0x190],xmm6
0x3cfe68ef7a39   c39  4c8985f0fdffff       REX.W movq [rbp-0x210],r8
0x3cfe68ef7a40   c40  4c898de8fdffff       REX.W movq [rbp-0x218],r9
0x3cfe68ef7a47   c47  c57928cf             vmovapd xmm9,xmm7
0x3cfe68ef7a4b   c4b  c5f928fd             vmovapd xmm7,xmm5
0x3cfe68ef7a4f   c4f  c5fb11ad40ffffff     vmovsd [rbp-0xc0],xmm5
0x3cfe68ef7a57   c57  c5fb11ad28ffffff     vmovsd [rbp-0xd8],xmm5
0x3cfe68ef7a5f   c5f  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef7a67   c67  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef7a6f   c6f  e973000000           jmp 0x3cfe68ef7ae7  <+0xce7>
0x3cfe68ef7a74   c74  660f1f840000000000   nop
0x3cfe68ef7a7d   c7d  0f1f00               nop
0x3cfe68ef7a80   c80  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3cfe68ef7a88   c88  8b9dd0fdffff         movl rbx,[rbp-0x230]
0x3cfe68ef7a8e   c8e  c4c17928e1           vmovapd xmm4,xmm9
0x3cfe68ef7a93   c93  c578108d30ffffff     vmovups xmm9,[rbp-0xd0]
0x3cfe68ef7a9b   c9b  448b9d10feffff       movl r11,[rbp-0x1f0]
0x3cfe68ef7aa2   ca2  4d8bd6               REX.W movq r10,r14
0x3cfe68ef7aa5   ca5  4589e6               movl r14,r12
0x3cfe68ef7aa8   ca8  4d8be2               REX.W movq r12,r10
0x3cfe68ef7aab   cab  c5f928dd             vmovapd xmm3,xmm5
0x3cfe68ef7aaf   caf  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3cfe68ef7ab3   cb3  448b8de8fdffff       movl r9,[rbp-0x218]
0x3cfe68ef7aba   cba  c4c17928d4           vmovapd xmm2,xmm12
0x3cfe68ef7abf   cbf  c4c17928cb           vmovapd xmm1,xmm11
0x3cfe68ef7ac4   cc4  448b85f0fdffff       movl r8,[rbp-0x210]
0x3cfe68ef7acb   ccb  8bbdd8fdffff         movl rdi,[rbp-0x228]
0x3cfe68ef7ad1   cd1  8b9508feffff         movl rdx,[rbp-0x1f8]
0x3cfe68ef7ad7   cd7  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x3cfe68ef7adf   cdf  c5f810b570feffff     vmovups xmm6,[rbp-0x190]
0x3cfe68ef7ae7   ce7  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x3cfe68ef7aec   cec  c4c10972f619         vpslld xmm14,xmm14,25
0x3cfe68ef7af2   cf2  c4c10972d602         vpsrld xmm14,xmm14,2
0x3cfe68ef7af8   cf8  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x3cfe68ef7b00   d00  c57810a5a0feffff     vmovups xmm12,[rbp-0x160]
0x3cfe68ef7b08   d08  c578109d90feffff     vmovups xmm11,[rbp-0x170]
0x3cfe68ef7b10   d10  8b8d60feffff         movl rcx,[rbp-0x1a0]
0x3cfe68ef7b16   d16  8b8548feffff         movl rax,[rbp-0x1b8]
0x3cfe68ef7b1c   d1c  4533ff               xorl r15,r15
0x3cfe68ef7b1f   d1f  4c8975c8             REX.W movq [rbp-0x38],r14
0x3cfe68ef7b23   d23  c5fb11bd50ffffff     vmovsd [rbp-0xb0],xmm7
0x3cfe68ef7b2b   d2b  c578118d30ffffff     vmovups [rbp-0xd0],xmm9
0x3cfe68ef7b33   d33  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7b37   d37  0f8659170000         jna 0x3cfe68ef9296  <+0x2496>
0x3cfe68ef7b3d   d3d  8bb500feffff         movl rsi,[rbp-0x200]
0x3cfe68ef7b43   d43  410faff6             imull rsi,r14
0x3cfe68ef7b47   d47  448d3433             leal r14,[rbx+rsi*1]
0x3cfe68ef7b4b   d4b  453bce               cmpl r9,r14
0x3cfe68ef7b4e   d4e  0f862a000000         jna 0x3cfe68ef7b7e  <+0xd7e>
0x3cfe68ef7b54   d54  4103f3               addl rsi,r11
0x3cfe68ef7b57   d57  443bce               cmpl r9,rsi
0x3cfe68ef7b5a   d5a  0f861e000000         jna 0x3cfe68ef7b7e  <+0xd7e>
0x3cfe68ef7b60   d60  418d34b0             leal rsi,[r8+rsi*4]
0x3cfe68ef7b64   d64  418b3434             movl rsi,[r12+rsi*1]
0x3cfe68ef7b68   d68  478d34b0             leal r14,[r8+r14*4]
0x3cfe68ef7b6c   d6c  478b3434             movl r14,[r12+r14*1]
0x3cfe68ef7b70   d70  458bd6               movl r10,r14
0x3cfe68ef7b73   d73  448bf6               movl r14,rsi
0x3cfe68ef7b76   d76  418bf2               movl rsi,r10
0x3cfe68ef7b79   d79  e906000000           jmp 0x3cfe68ef7b84  <+0xd84>
0x3cfe68ef7b7e   d7e  4d8bf7               REX.W movq r14,r15
0x3cfe68ef7b81   d81  498bf7               REX.W movq rsi,r15
0x3cfe68ef7b84   d84  448d1cb0             leal r11,[rax+rsi*4]
0x3cfe68ef7b88   d88  458be6               movl r12,r14
0x3cfe68ef7b8b   d8b  442be6               subl r12,rsi
0x3cfe68ef7b8e   d8e  33c0                 xorl rax,rax
0x3cfe68ef7b90   d90  413bfe               cmpl rdi,r14
0x3cfe68ef7b93   d93  0f92c0               setcl al
0x3cfe68ef7b96   d96  33db                 xorl rbx,rbx
0x3cfe68ef7b98   d98  443bf6               cmpl r14,rsi
0x3cfe68ef7b9b   d9b  0f92c3               setcl bl
0x3cfe68ef7b9e   d9e  488bf8               REX.W movq rdi,rax
0x3cfe68ef7ba1   da1  0bfb                 orl rdi,rbx
0x3cfe68ef7ba3   da3  4589e0               movl r8,r12
0x3cfe68ef7ba6   da6  85ff                 testl rdi,rdi
0x3cfe68ef7ba8   da8  450f45c7             cmovnzl r8,r15
0x3cfe68ef7bac   dac  4c89b550feffff       REX.W movq [rbp-0x1b0],r14
0x3cfe68ef7bb3   db3  4c899df0feffff       REX.W movq [rbp-0x110],r11
0x3cfe68ef7bba   dba  48898538feffff       REX.W movq [rbp-0x1c8],rax
0x3cfe68ef7bc1   dc1  48899dc8feffff       REX.W movq [rbp-0x138],rbx
0x3cfe68ef7bc8   dc8  4c8985e8feffff       REX.W movq [rbp-0x118],r8
0x3cfe68ef7bcf   dcf  443bf6               cmpl r14,rsi
0x3cfe68ef7bd2   dd2  0f82a5000000         jc 0x3cfe68ef7c7d  <+0xe7d>
0x3cfe68ef7bd8   dd8  8d3cb1               leal rdi,[rcx+rsi*4]
0x3cfe68ef7bdb   ddb  b904000000           movl rcx,0x4
0x3cfe68ef7be0   de0  413bd6               cmpl rdx,r14
0x3cfe68ef7be3   de3  0f42f9               cmovcl rdi,rcx
0x3cfe68ef7be6   de6  4589e0               movl r8,r12
0x3cfe68ef7be9   de9  413bd6               cmpl rdx,r14
0x3cfe68ef7bec   dec  450f42c7             cmovcl r8,r15
0x3cfe68ef7bf0   df0  418bd0               movl rdx,r8
0x3cfe68ef7bf3   df3  81e2f8ffff1f         andl rdx,0x1ffffff8
0x3cfe68ef7bf9   df9  8d1497               leal rdx,[rdi+rdx*4]
0x3cfe68ef7bfc   dfc  448b8d58feffff       movl r9,[rbp-0x1a8]
0x3cfe68ef7c03   e03  458d1cb1             leal r11,[r9+rsi*4]
0x3cfe68ef7c07   e07  448b8de0fdffff       movl r9,[rbp-0x220]
0x3cfe68ef7c0e   e0e  453bce               cmpl r9,r14
0x3cfe68ef7c11   e11  440f42d9             cmovcl r11,rcx
0x3cfe68ef7c15   e15  4489e0               movl rax,r12
0x3cfe68ef7c18   e18  453bce               cmpl r9,r14
0x3cfe68ef7c1b   e1b  410f42c7             cmovcl rax,r15
0x3cfe68ef7c1f   e1f  448bc8               movl r9,rax
0x3cfe68ef7c22   e22  4181e1f8ffff1f       andl r9,0x1ffffff8
0x3cfe68ef7c29   e29  478d0c8b             leal r9,[r11+r9*4]
0x3cfe68ef7c2d   e2d  418bd8               movl rbx,r8
0x3cfe68ef7c30   e30  c1eb03               shrl rbx, 3
0x3cfe68ef7c33   e33  4183e007             andl r8,0x7
0x3cfe68ef7c37   e37  4c899d20feffff       REX.W movq [rbp-0x1e0],r11
0x3cfe68ef7c3e   e3e  448bd8               movl r11,rax
0x3cfe68ef7c41   e41  41c1eb03             shrl r11, 3
0x3cfe68ef7c45   e45  83e007               andl rax,0x7
0x3cfe68ef7c48   e48  4c899d30feffff       REX.W movq [rbp-0x1d0],r11
0x3cfe68ef7c4f   e4f  448b9df8fdffff       movl r11,[rbp-0x208]
0x3cfe68ef7c56   e56  453bde               cmpl r11,r14
0x3cfe68ef7c59   e59  0f8213000000         jc 0x3cfe68ef7c72  <+0xe72>
0x3cfe68ef7c5f   e5f  448b9d68feffff       movl r11,[rbp-0x198]
0x3cfe68ef7c66   e66  418d34b3             leal rsi,[r11+rsi*4]
0x3cfe68ef7c6a   e6a  448bde               movl r11,rsi
0x3cfe68ef7c6d   e6d  e936000000           jmp 0x3cfe68ef7ca8  <+0xea8>
0x3cfe68ef7c72   e72  4c8bd9               REX.W movq r11,rcx
0x3cfe68ef7c75   e75  4d8be7               REX.W movq r12,r15
0x3cfe68ef7c78   e78  e92b000000           jmp 0x3cfe68ef7ca8  <+0xea8>
0x3cfe68ef7c7d   e7d  b904000000           movl rcx,0x4
0x3cfe68ef7c82   e82  4d8be7               REX.W movq r12,r15
0x3cfe68ef7c85   e85  498bc7               REX.W movq rax,r15
0x3cfe68ef7c88   e88  498bdf               REX.W movq rbx,r15
0x3cfe68ef7c8b   e8b  4d8bc7               REX.W movq r8,r15
0x3cfe68ef7c8e   e8e  4c89bd30feffff       REX.W movq [rbp-0x1d0],r15
0x3cfe68ef7c95   e95  488bd1               REX.W movq rdx,rcx
0x3cfe68ef7c98   e98  488bf9               REX.W movq rdi,rcx
0x3cfe68ef7c9b   e9b  4c8bc9               REX.W movq r9,rcx
0x3cfe68ef7c9e   e9e  4c8bd9               REX.W movq r11,rcx
0x3cfe68ef7ca1   ea1  48898d20feffff       REX.W movq [rbp-0x1e0],rcx
0x3cfe68ef7ca8   ea8  488bb5c8feffff       REX.W movq rsi,[rbp-0x138]
0x3cfe68ef7caf   eaf  0bb538feffff         orl rsi,[rbp-0x1c8]
0x3cfe68ef7cb5   eb5  4c899de0feffff       REX.W movq [rbp-0x120],r11
0x3cfe68ef7cbc   ebc  448b9df0feffff       movl r11,[rbp-0x110]
0x3cfe68ef7cc3   ec3  85f6                 testl rsi,rsi
0x3cfe68ef7cc5   ec5  440f45d9             cmovnzl r11,rcx
0x3cfe68ef7cc9   ec9  8b8de8feffff         movl rcx,[rbp-0x118]
0x3cfe68ef7ccf   ecf  83e107               andl rcx,0x7
0x3cfe68ef7cd2   ed2  4489e6               movl rsi,r12
0x3cfe68ef7cd5   ed5  c1ee03               shrl rsi, 3
0x3cfe68ef7cd8   ed8  4c8985d0feffff       REX.W movq [rbp-0x130],r8
0x3cfe68ef7cdf   edf  448b85e8feffff       movl r8,[rbp-0x118]
0x3cfe68ef7ce6   ee6  41c1e803             shrl r8, 3
0x3cfe68ef7cea   eea  4c89a5d8feffff       REX.W movq [rbp-0x128],r12
0x3cfe68ef7cf1   ef1  448ba530feffff       movl r12,[rbp-0x1d0]
0x3cfe68ef7cf8   ef8  4c899df0feffff       REX.W movq [rbp-0x110],r11
0x3cfe68ef7cff   eff  458bd8               movl r11,r8
0x3cfe68ef7d02   f02  453be0               cmpl r12,r8
0x3cfe68ef7d05   f05  450f42dc             cmovcl r11,r12
0x3cfe68ef7d09   f09  458be3               movl r12,r11
0x3cfe68ef7d0c   f0c  413bdb               cmpl rbx,r11
0x3cfe68ef7d0f   f0f  440f42e3             cmovcl r12,rbx
0x3cfe68ef7d13   f13  4589e3               movl r11,r12
0x3cfe68ef7d16   f16  4439e6               cmpl rsi,r12
0x3cfe68ef7d19   f19  440f42de             cmovcl r11,rsi
0x3cfe68ef7d1d   f1d  48899520ffffff       REX.W movq [rbp-0xe0],rdx
0x3cfe68ef7d24   f24  4c898df8feffff       REX.W movq [rbp-0x108],r9
0x3cfe68ef7d2b   f2b  488985c0feffff       REX.W movq [rbp-0x140],rax
0x3cfe68ef7d32   f32  48898dc8feffff       REX.W movq [rbp-0x138],rcx
0x3cfe68ef7d39   f39  4585db               testl r11,r11
0x3cfe68ef7d3c   f3c  0f848b020000         jz 0x3cfe68ef7fcd  <+0x11cd>
0x3cfe68ef7d42   f42  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7d49   f49  448ba5e0feffff       movl r12,[rbp-0x120]
0x3cfe68ef7d50   f50  8b9df0feffff         movl rbx,[rbp-0x110]
0x3cfe68ef7d56   f56  498bf7               REX.W movq rsi,r15
0x3cfe68ef7d59   f59  448bbd20feffff       movl r15,[rbp-0x1e0]
0x3cfe68ef7d60   f60  e942000000           jmp 0x3cfe68ef7da7  <+0xfa7>
0x3cfe68ef7d65   f65  660f1f840000000000   nop
0x3cfe68ef7d6e   f6e  660f1f840000000000   nop
0x3cfe68ef7d77   f77  660f1f840000000000   nop
0x3cfe68ef7d80   f80  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7d87   f87  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef7d8f   f8f  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef7d97   f97  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef7d9f   f9f  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef7da7   fa7  4c89a530feffff       REX.W movq [rbp-0x1d0],r12
0x3cfe68ef7dae   fae  4889bd28feffff       REX.W movq [rbp-0x1d8],rdi
0x3cfe68ef7db5   fb5  4c89bd20feffff       REX.W movq [rbp-0x1e0],r15
0x3cfe68ef7dbc   fbc  48899d18feffff       REX.W movq [rbp-0x1e8],rbx
0x3cfe68ef7dc3   fc3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef7dc7   fc7  8b4590               movl rax,[rbp-0x70]
0x3cfe68ef7dca   fca  8bd3                 movl rdx,rbx
0x3cfe68ef7dcc   fcc  418bcf               movl rcx,r15
0x3cfe68ef7dcf   fcf  8bdf                 movl rbx,rdi
0x3cfe68ef7dd1   fd1  4589e1               movl r9,r12
0x3cfe68ef7dd4   fd4  e8675ff2ff           call 0x3cfe68e1dd40  (jump table)
0x3cfe68ef7dd9   fd9  8b9d18feffff         movl rbx,[rbp-0x1e8]
0x3cfe68ef7ddf   fdf  8d5320               leal rdx,[rbx+0x20]
0x3cfe68ef7de2   fe2  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3cfe68ef7de9   fe9  418d4b20             leal rcx,[r11+0x20]
0x3cfe68ef7ded   fed  8bbd28feffff         movl rdi,[rbp-0x1d8]
0x3cfe68ef7df3   ff3  8d5f20               leal rbx,[rdi+0x20]
0x3cfe68ef7df6   ff6  448ba530feffff       movl r12,[rbp-0x1d0]
0x3cfe68ef7dfd   ffd  458d4c2420           leal r9,[r12+0x20]
0x3cfe68ef7e02  1002  48899518feffff       REX.W movq [rbp-0x1e8],rdx
0x3cfe68ef7e09  1009  48898d20feffff       REX.W movq [rbp-0x1e0],rcx
0x3cfe68ef7e10  1010  48899d28feffff       REX.W movq [rbp-0x1d8],rbx
0x3cfe68ef7e17  1017  4c898d30feffff       REX.W movq [rbp-0x1d0],r9
0x3cfe68ef7e1e  101e  4c8b9d38feffff       REX.W movq r11,[rbp-0x1c8]
0x3cfe68ef7e25  1025  4183c3ff             addl r11,0xff
0x3cfe68ef7e29  1029  0f8497010000         jz 0x3cfe68ef7fc6  <+0x11c6>
0x3cfe68ef7e2f  102f  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7e36  1036  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef7e3a  103a  8b4590               movl rax,[rbp-0x70]
0x3cfe68ef7e3d  103d  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef7e45  1045  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef7e4d  104d  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef7e55  1055  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef7e5d  105d  e8de5ef2ff           call 0x3cfe68e1dd40  (jump table)
0x3cfe68ef7e62  1062  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3cfe68ef7e69  1069  418d5320             leal rdx,[r11+0x20]
0x3cfe68ef7e6d  106d  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3cfe68ef7e74  1074  418d4b20             leal rcx,[r11+0x20]
0x3cfe68ef7e78  1078  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3cfe68ef7e7f  107f  418d5b20             leal rbx,[r11+0x20]
0x3cfe68ef7e83  1083  448b9d30feffff       movl r11,[rbp-0x1d0]
0x3cfe68ef7e8a  108a  458d4b20             leal r9,[r11+0x20]
0x3cfe68ef7e8e  108e  48899518feffff       REX.W movq [rbp-0x1e8],rdx
0x3cfe68ef7e95  1095  48898d20feffff       REX.W movq [rbp-0x1e0],rcx
0x3cfe68ef7e9c  109c  48899d28feffff       REX.W movq [rbp-0x1d8],rbx
0x3cfe68ef7ea3  10a3  4c898d30feffff       REX.W movq [rbp-0x1d0],r9
0x3cfe68ef7eaa  10aa  4c8b9d38feffff       REX.W movq r11,[rbp-0x1c8]
0x3cfe68ef7eb1  10b1  4183c3ff             addl r11,0xff
0x3cfe68ef7eb5  10b5  0f840b010000         jz 0x3cfe68ef7fc6  <+0x11c6>
0x3cfe68ef7ebb  10bb  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7ec2  10c2  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef7ec6  10c6  8b4590               movl rax,[rbp-0x70]
0x3cfe68ef7ec9  10c9  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef7ed1  10d1  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef7ed9  10d9  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef7ee1  10e1  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef7ee9  10e9  e8525ef2ff           call 0x3cfe68e1dd40  (jump table)
0x3cfe68ef7eee  10ee  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3cfe68ef7ef5  10f5  418d5320             leal rdx,[r11+0x20]
0x3cfe68ef7ef9  10f9  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3cfe68ef7f00  1100  418d4b20             leal rcx,[r11+0x20]
0x3cfe68ef7f04  1104  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3cfe68ef7f0b  110b  418d5b20             leal rbx,[r11+0x20]
0x3cfe68ef7f0f  110f  448b9d30feffff       movl r11,[rbp-0x1d0]
0x3cfe68ef7f16  1116  458d4b20             leal r9,[r11+0x20]
0x3cfe68ef7f1a  111a  48899518feffff       REX.W movq [rbp-0x1e8],rdx
0x3cfe68ef7f21  1121  48898d20feffff       REX.W movq [rbp-0x1e0],rcx
0x3cfe68ef7f28  1128  48899d28feffff       REX.W movq [rbp-0x1d8],rbx
0x3cfe68ef7f2f  112f  4c898d30feffff       REX.W movq [rbp-0x1d0],r9
0x3cfe68ef7f36  1136  4c8b9d38feffff       REX.W movq r11,[rbp-0x1c8]
0x3cfe68ef7f3d  113d  4183c3ff             addl r11,0xff
0x3cfe68ef7f41  1141  0f847f000000         jz 0x3cfe68ef7fc6  <+0x11c6>
0x3cfe68ef7f47  1147  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7f4e  114e  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x3cfe68ef7f52  1152  0f86f3130000         jna 0x3cfe68ef934b  <+0x254b>
0x3cfe68ef7f58  1158  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef7f5c  115c  8b4590               movl rax,[rbp-0x70]
0x3cfe68ef7f5f  115f  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef7f67  1167  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef7f6f  116f  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef7f77  1177  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef7f7f  117f  e8bc5df2ff           call 0x3cfe68e1dd40  (jump table)
0x3cfe68ef7f84  1184  448b9d18feffff       movl r11,[rbp-0x1e8]
0x3cfe68ef7f8b  118b  418d5b20             leal rbx,[r11+0x20]
0x3cfe68ef7f8f  118f  448b9d20feffff       movl r11,[rbp-0x1e0]
0x3cfe68ef7f96  1196  458d7b20             leal r15,[r11+0x20]
0x3cfe68ef7f9a  119a  448b9d28feffff       movl r11,[rbp-0x1d8]
0x3cfe68ef7fa1  11a1  418d7b20             leal rdi,[r11+0x20]
0x3cfe68ef7fa5  11a5  448b9d30feffff       movl r11,[rbp-0x1d0]
0x3cfe68ef7fac  11ac  458d6320             leal r12,[r11+0x20]
0x3cfe68ef7fb0  11b0  4c8b9d38feffff       REX.W movq r11,[rbp-0x1c8]
0x3cfe68ef7fb7  11b7  4183c3ff             addl r11,0xff
0x3cfe68ef7fbb  11bb  0f85bffdffff         jnz 0x3cfe68ef7d80  <+0xf80>
0x3cfe68ef7fc1  11c1  e907000000           jmp 0x3cfe68ef7fcd  <+0x11cd>
0x3cfe68ef7fc6  11c6  4c899d38feffff       REX.W movq [rbp-0x1c8],r11
0x3cfe68ef7fcd  11cd  83bdc8feffff00       cmpl [rbp-0x138],0x0
0x3cfe68ef7fd4  11d4  0f846b040000         jz 0x3cfe68ef8445  <+0x1645>
0x3cfe68ef7fda  11da  8bb550feffff         movl rsi,[rbp-0x1b0]
0x3cfe68ef7fe0  11e0  448d5ef8             leal r11,[rsi-0x8]
0x3cfe68ef7fe4  11e4  458be3               movl r12,r11
0x3cfe68ef7fe7  11e7  4533ff               xorl r15,r15
0x3cfe68ef7fea  11ea  413bf3               cmpl rsi,r11
0x3cfe68ef7fed  11ed  450f42e7             cmovcl r12,r15
0x3cfe68ef7ff1  11f1  458d5c2408           leal r11,[r12+0x8]
0x3cfe68ef7ff6  11f6  448bb540feffff       movl r14,[rbp-0x1c0]
0x3cfe68ef7ffd  11fd  453bf3               cmpl r14,r11
0x3cfe68ef8000  1200  0f823f040000         jc 0x3cfe68ef8445  <+0x1645>
0x3cfe68ef8006  1206  8b5de0               movl rbx,[rbp-0x20]
0x3cfe68ef8009  1209  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef800d  120d  c4c17a6f841be0000000 vmovdqu xmm0,[r11+rbx*1+0xe0]
0x3cfe68ef8017  1217  8b8548feffff         movl rax,[rbp-0x1b8]
0x3cfe68ef801d  121d  428d14a0             leal rdx,[rax+r12*4]
0x3cfe68ef8021  1221  c4c17a6f2c13         vmovdqu xmm5,[r11+rdx*1]
0x3cfe68ef8027  1227  c5f810b570feffff     vmovups xmm6,[rbp-0x190]
0x3cfe68ef802f  122f  c5c85cfd             vsubps xmm7,xmm6,xmm5
0x3cfe68ef8033  1233  4429e6               subl rsi,r12
0x3cfe68ef8036  1236  33c9                 xorl rcx,rcx
0x3cfe68ef8038  1238  3bb5c8feffff         cmpl rsi,[rbp-0x138]
0x3cfe68ef803e  123e  0f94c1               setzl cl
0x3cfe68ef8041  1241  c5796ec1             vmovd xmm8,rcx
0x3cfe68ef8045  1245  c4417970c000         vpshufd xmm8,xmm8,0x0
0x3cfe68ef804b  124b  33c9                 xorl rcx,rcx
0x3cfe68ef804d  124d  83fe01               cmpl rsi,0x1
0x3cfe68ef8050  1250  0f97c1               setal cl
0x3cfe68ef8053  1253  8bfe                 movl rdi,rsi
0x3cfe68ef8055  1255  2bbdc8feffff         subl rdi,[rbp-0x138]
0x3cfe68ef805b  125b  4533c0               xorl r8,r8
0x3cfe68ef805e  125e  83ff02               cmpl rdi,0x2
0x3cfe68ef8061  1261  410f92c0             setcl r8l
0x3cfe68ef8065  1265  4423c1               andl r8,rcx
0x3cfe68ef8068  1268  c4433922c001         vpinsrd xmm8,xmm8,r8,0x1
0x3cfe68ef806e  126e  33c9                 xorl rcx,rcx
0x3cfe68ef8070  1270  83fe02               cmpl rsi,0x2
0x3cfe68ef8073  1273  0f97c1               setal cl
0x3cfe68ef8076  1276  4533c0               xorl r8,r8
0x3cfe68ef8079  1279  83ff03               cmpl rdi,0x3
0x3cfe68ef807c  127c  410f92c0             setcl r8l
0x3cfe68ef8080  1280  4423c1               andl r8,rcx
0x3cfe68ef8083  1283  c4433922c002         vpinsrd xmm8,xmm8,r8,0x2
0x3cfe68ef8089  1289  33c9                 xorl rcx,rcx
0x3cfe68ef808b  128b  83fe03               cmpl rsi,0x3
0x3cfe68ef808e  128e  0f97c1               setal cl
0x3cfe68ef8091  1291  4533c0               xorl r8,r8
0x3cfe68ef8094  1294  83ff04               cmpl rdi,0x4
0x3cfe68ef8097  1297  410f92c0             setcl r8l
0x3cfe68ef809b  129b  4423c1               andl r8,rcx
0x3cfe68ef809e  129e  c4433922c003         vpinsrd xmm8,xmm8,r8,0x3
0x3cfe68ef80a4  12a4  c54059cf             vmulps xmm9,xmm7,xmm7
0x3cfe68ef80a8  12a8  8b8d58feffff         movl rcx,[rbp-0x1a8]
0x3cfe68ef80ae  12ae  468d04a1             leal r8,[rcx+r12*4]
0x3cfe68ef80b2  12b2  c4017a6f1403         vmovdqu xmm10,[r11+r8*1]
0x3cfe68ef80b8  12b8  c578109d80feffff     vmovups xmm11,[rbp-0x180]
0x3cfe68ef80c0  12c0  c441205ce2           vsubps xmm12,xmm11,xmm10
0x3cfe68ef80c5  12c5  c4411859ec           vmulps xmm13,xmm12,xmm12
0x3cfe68ef80ca  12ca  c4413058cd           vaddps xmm9,xmm9,xmm13
0x3cfe68ef80cf  12cf  c57810ad90feffff     vmovups xmm13,[rbp-0x170]
0x3cfe68ef80d7  12d7  c44130c2f501         vcmpps xmm14,xmm9,xmm13, (lt)
0x3cfe68ef80dd  12dd  c44139dbf6           vpand xmm14,xmm8,xmm14
0x3cfe68ef80e2  12e2  c441785bf6           vcvtdq2ps xmm14,xmm14
0x3cfe68ef80e7  12e7  c4c14059fe           vmulps xmm7,xmm7,xmm14
0x3cfe68ef80ec  12ec  c5f858c7             vaddps xmm0,xmm0,xmm7
0x3cfe68ef80f0  12f0  c4c17a7f841be0000000 vmovdqu [r11+rbx*1+0xe0],xmm0
0x3cfe68ef80fa  12fa  c4c17a6f841b00010000 vmovdqu xmm0,[r11+rbx*1+0x100]
0x3cfe68ef8104  1304  c4c11859fe           vmulps xmm7,xmm12,xmm14
0x3cfe68ef8109  1309  c5f858c7             vaddps xmm0,xmm0,xmm7
0x3cfe68ef810d  130d  c4c17a7f841b00010000 vmovdqu [r11+rbx*1+0x100],xmm0
0x3cfe68ef8117  1317  c4c110c2c102         vcmpps xmm0,xmm13,xmm9, (le)
0x3cfe68ef811d  131d  c5f810bda0feffff     vmovups xmm7,[rbp-0x160]
0x3cfe68ef8125  1325  c530c2e701           vcmpps xmm12,xmm9,xmm7, (lt)
0x3cfe68ef812a  132a  c4c179dbc4           vpand xmm0,xmm0,xmm12
0x3cfe68ef812f  132f  c44119efe4           vpxor xmm12,xmm12,xmm12
0x3cfe68ef8134  1334  c44118c2c901         vcmpps xmm9,xmm12,xmm9, (lt)
0x3cfe68ef813a  133a  c57810b5b0feffff     vmovups xmm14,[rbp-0x150]
0x3cfe68ef8142  1342  c44131dbce           vpand xmm9,xmm9,xmm14
0x3cfe68ef8147  1347  c441785bc9           vcvtdq2ps xmm9,xmm9
0x3cfe68ef814c  134c  c4c179dbc1           vpand xmm0,xmm0,xmm9
0x3cfe68ef8151  1351  c441785bc0           vcvtdq2ps xmm8,xmm8
0x3cfe68ef8156  1356  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x3cfe68ef815b  135b  c4417a6f841bc0000000 vmovdqu xmm8,[r11+rbx*1+0xc0]
0x3cfe68ef8165  1365  c4417858c0           vaddps xmm8,xmm0,xmm8
0x3cfe68ef816a  136a  c4417a7f841bc0000000 vmovdqu [r11+rbx*1+0xc0],xmm8
0x3cfe68ef8174  1374  c4417a6f441b40       vmovdqu xmm8,[r11+rbx*1+0x40]
0x3cfe68ef817b  137b  c5d059e8             vmulps xmm5,xmm5,xmm0
0x3cfe68ef817f  137f  c5b858ed             vaddps xmm5,xmm8,xmm5
0x3cfe68ef8183  1383  c4c17a7f6c1b40       vmovdqu [r11+rbx*1+0x40],xmm5
0x3cfe68ef818a  138a  c5a859e8             vmulps xmm5,xmm10,xmm0
0x3cfe68ef818e  138e  c4417a6f441b60       vmovdqu xmm8,[r11+rbx*1+0x60]
0x3cfe68ef8195  1395  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3cfe68ef819a  139a  c4c17a7f6c1b60       vmovdqu [r11+rbx*1+0x60],xmm5
0x3cfe68ef81a1  13a1  448b8d60feffff       movl r9,[rbp-0x1a0]
0x3cfe68ef81a8  13a8  478d3ca1             leal r15,[r9+r12*4]
0x3cfe68ef81ac  13ac  c4817a6f2c3b         vmovdqu xmm5,[r11+r15*1]
0x3cfe68ef81b2  13b2  c5d059e8             vmulps xmm5,xmm5,xmm0
0x3cfe68ef81b6  13b6  c4417a6f841b80000000 vmovdqu xmm8,[r11+rbx*1+0x80]
0x3cfe68ef81c0  13c0  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3cfe68ef81c5  13c5  c4c17a7fac1b80000000 vmovdqu [r11+rbx*1+0x80],xmm5
0x3cfe68ef81cf  13cf  448bb568feffff       movl r14,[rbp-0x198]
0x3cfe68ef81d6  13d6  478d24a6             leal r12,[r14+r12*4]
0x3cfe68ef81da  13da  c4817a6f2c23         vmovdqu xmm5,[r11+r12*1]
0x3cfe68ef81e0  13e0  c5d059c0             vmulps xmm0,xmm5,xmm0
0x3cfe68ef81e4  13e4  c4c17a6fac1ba0000000 vmovdqu xmm5,[r11+rbx*1+0xa0]
0x3cfe68ef81ee  13ee  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3cfe68ef81f2  13f2  c4c17a7f841ba0000000 vmovdqu [r11+rbx*1+0xa0],xmm0
0x3cfe68ef81fc  13fc  c4c17a6f441b50       vmovdqu xmm0,[r11+rbx*1+0x50]
0x3cfe68ef8203  1403  c4c17a6fac1bf0000000 vmovdqu xmm5,[r11+rbx*1+0xf0]
0x3cfe68ef820d  140d  c4417a6f441310       vmovdqu xmm8,[r11+rdx*1+0x10]
0x3cfe68ef8214  1414  c441485cc8           vsubps xmm9,xmm6,xmm8
0x3cfe68ef8219  1419  49ba0000000005000000 REX.W movq r10,0x500000000
0x3cfe68ef8223  1423  c441f96ed2           vmovq xmm10,r10
0x3cfe68ef8228  1428  49ba0000000000000000 REX.W movq r10,(nil)
0x3cfe68ef8232  1432  c443a922d201         vpinsrq xmm10,xmm10,r10,0x1
0x3cfe68ef8238  1438  c4632922d700         vpinsrd xmm10,xmm10,rdi,0x0
0x3cfe68ef823e  143e  41ba05000000         movl r10,0x5
0x3cfe68ef8244  1444  c4c1796eca           vmovd xmm1,r10
0x3cfe68ef8249  1449  4c8b15daffffff       REX.W movq r10,[rip+0xffffffda]
0x3cfe68ef8250  1450  c4c3f122ca01         vpinsrq xmm1,xmm1,r10,0x1
0x3cfe68ef8256  1456  c4e37122ce01         vpinsrd xmm1,xmm1,rsi,0x1
0x3cfe68ef825c  145c  c4c2713fca           vpmaxud xmm1,xmm1,xmm10
0x3cfe68ef8261  1461  c4c17176ca           vpcmpeqd xmm1,xmm1,xmm10
0x3cfe68ef8266  1466  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3cfe68ef826b  146b  c4c171efcf           vpxor xmm1,xmm1,xmm15
0x3cfe68ef8270  1470  c4412976d2           vpcmpeqd xmm10,xmm10,xmm10
0x3cfe68ef8275  1475  c4c12973f23e         vpsllq xmm10,xmm10,62
0x3cfe68ef827b  147b  c4c12973d21d         vpsrlq xmm10,xmm10,29
0x3cfe68ef8281  1481  4c8b15a2ffffff       REX.W movq r10,[rip+0xffffffa2]
0x3cfe68ef8288  1488  c443a922d201         vpinsrq xmm10,xmm10,r10,0x1
0x3cfe68ef828e  148e  c4632922d600         vpinsrd xmm10,xmm10,rsi,0x0
0x3cfe68ef8294  1494  c5e976d2             vpcmpeqd xmm2,xmm2,xmm2
0x3cfe68ef8298  1498  c5e973f23f           vpsllq xmm2,xmm2,63
0x3cfe68ef829d  149d  c5e973d23d           vpsrlq xmm2,xmm2,61
0x3cfe68ef82a2  14a2  4c8b1581ffffff       REX.W movq r10,[rip+0xffffff81]
0x3cfe68ef82a9  14a9  c4c3e922d201         vpinsrq xmm2,xmm2,r10,0x1
0x3cfe68ef82af  14af  c4e36922d701         vpinsrd xmm2,xmm2,rdi,0x1
0x3cfe68ef82b5  14b5  c462293fd2           vpmaxud xmm10,xmm10,xmm2
0x3cfe68ef82ba  14ba  c52976d2             vpcmpeqd xmm10,xmm10,xmm2
0x3cfe68ef82be  14be  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x3cfe68ef82c3  14c3  c44129efd7           vpxor xmm10,xmm10,xmm15
0x3cfe68ef82c8  14c8  c44171dbd2           vpand xmm10,xmm1,xmm10
0x3cfe68ef82cd  14cd  c4427925d2           vpmovsxdq xmm10,xmm10
0x3cfe68ef82d2  14d2  c4417970d208         vpshufd xmm10,xmm10,0x8
0x3cfe68ef82d8  14d8  33d2                 xorl rdx,rdx
0x3cfe68ef82da  14da  83fe06               cmpl rsi,0x6
0x3cfe68ef82dd  14dd  0f97c2               setal dl
0x3cfe68ef82e0  14e0  4533f6               xorl r14,r14
0x3cfe68ef82e3  14e3  83ff07               cmpl rdi,0x7
0x3cfe68ef82e6  14e6  410f92c6             setcl r14l
0x3cfe68ef82ea  14ea  4423f2               andl r14,rdx
0x3cfe68ef82ed  14ed  c4432922d602         vpinsrd xmm10,xmm10,r14,0x2
0x3cfe68ef82f3  14f3  4533f6               xorl r14,r14
0x3cfe68ef82f6  14f6  83fe07               cmpl rsi,0x7
0x3cfe68ef82f9  14f9  410f97c6             setal r14l
0x3cfe68ef82fd  14fd  33d2                 xorl rdx,rdx
0x3cfe68ef82ff  14ff  83ff08               cmpl rdi,0x8
0x3cfe68ef8302  1502  0f92c2               setcl dl
0x3cfe68ef8305  1505  4123d6               andl rdx,r14
0x3cfe68ef8308  1508  c4632922d203         vpinsrd xmm10,xmm10,rdx,0x3
0x3cfe68ef830e  150e  c44129dbd6           vpand xmm10,xmm10,xmm14
0x3cfe68ef8313  1513  c4c13059c9           vmulps xmm1,xmm9,xmm9
0x3cfe68ef8318  1518  c4817a6f540310       vmovdqu xmm2,[r11+r8*1+0x10]
0x3cfe68ef831f  151f  c5a05cda             vsubps xmm3,xmm11,xmm2
0x3cfe68ef8323  1523  c5e059e3             vmulps xmm4,xmm3,xmm3
0x3cfe68ef8327  1527  c5f058cc             vaddps xmm1,xmm1,xmm4
0x3cfe68ef832b  152b  c4c170c2e501         vcmpps xmm4,xmm1,xmm13, (lt)
0x3cfe68ef8331  1531  c5a9dbe4             vpand xmm4,xmm10,xmm4
0x3cfe68ef8335  1535  c5f85be4             vcvtdq2ps xmm4,xmm4
0x3cfe68ef8339  1539  c53059cc             vmulps xmm9,xmm9,xmm4
0x3cfe68ef833d  153d  c4c15058e9           vaddps xmm5,xmm5,xmm9
0x3cfe68ef8342  1542  c4c17a7fac1bf0000000 vmovdqu [r11+rbx*1+0xf0],xmm5
0x3cfe68ef834c  154c  c4c17a6fac1b10010000 vmovdqu xmm5,[r11+rbx*1+0x110]
0x3cfe68ef8356  1556  c56059cc             vmulps xmm9,xmm3,xmm4
0x3cfe68ef835a  155a  c4c15058e9           vaddps xmm5,xmm5,xmm9
0x3cfe68ef835f  155f  c4c17a7fac1b10010000 vmovdqu [r11+rbx*1+0x110],xmm5
0x3cfe68ef8369  1569  c590c2e902           vcmpps xmm5,xmm13,xmm1, (le)
0x3cfe68ef836e  156e  c570c2cf01           vcmpps xmm9,xmm1,xmm7, (lt)
0x3cfe68ef8373  1573  c4c151dbe9           vpand xmm5,xmm5,xmm9
0x3cfe68ef8378  1578  c518c2c901           vcmpps xmm9,xmm12,xmm1, (lt)
0x3cfe68ef837d  157d  c44131dbce           vpand xmm9,xmm9,xmm14
0x3cfe68ef8382  1582  c441785bc9           vcvtdq2ps xmm9,xmm9
0x3cfe68ef8387  1587  c4c151dbe9           vpand xmm5,xmm5,xmm9
0x3cfe68ef838c  158c  c441785bca           vcvtdq2ps xmm9,xmm10
0x3cfe68ef8391  1591  c4c15059e9           vmulps xmm5,xmm5,xmm9
0x3cfe68ef8396  1596  c53859c5             vmulps xmm8,xmm8,xmm5
0x3cfe68ef839a  159a  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x3cfe68ef839f  159f  c4c17a7f441b50       vmovdqu [r11+rbx*1+0x50],xmm0
0x3cfe68ef83a6  15a6  c5e859c5             vmulps xmm0,xmm2,xmm5
0x3cfe68ef83aa  15aa  c4417a6f441b70       vmovdqu xmm8,[r11+rbx*1+0x70]
0x3cfe68ef83b1  15b1  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x3cfe68ef83b6  15b6  c4c17a7f441b70       vmovdqu [r11+rbx*1+0x70],xmm0
0x3cfe68ef83bd  15bd  c4817a6f443b10       vmovdqu xmm0,[r11+r15*1+0x10]
0x3cfe68ef83c4  15c4  c5f859c5             vmulps xmm0,xmm0,xmm5
0x3cfe68ef83c8  15c8  c4417a6f841b90000000 vmovdqu xmm8,[r11+rbx*1+0x90]
0x3cfe68ef83d2  15d2  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x3cfe68ef83d7  15d7  c4c17a7f841b90000000 vmovdqu [r11+rbx*1+0x90],xmm0
0x3cfe68ef83e1  15e1  c4817a6f442310       vmovdqu xmm0,[r11+r12*1+0x10]
0x3cfe68ef83e8  15e8  c5f859c5             vmulps xmm0,xmm0,xmm5
0x3cfe68ef83ec  15ec  c4417a6f841bb0000000 vmovdqu xmm8,[r11+rbx*1+0xb0]
0x3cfe68ef83f6  15f6  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x3cfe68ef83fb  15fb  c4c17a7f841bb0000000 vmovdqu [r11+rbx*1+0xb0],xmm0
0x3cfe68ef8405  1605  c4c17a6f841bd0000000 vmovdqu xmm0,[r11+rbx*1+0xd0]
0x3cfe68ef840f  160f  c5d058c0             vaddps xmm0,xmm5,xmm0
0x3cfe68ef8413  1613  c4c17a7f841bd0000000 vmovdqu [r11+rbx*1+0xd0],xmm0
0x3cfe68ef841d  161d  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3cfe68ef8425  1625  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3cfe68ef842d  162d  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3cfe68ef8435  1635  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3cfe68ef843d  163d  4d8bf3               REX.W movq r14,r11
0x3cfe68ef8440  1640  e9e7060000           jmp 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8445  1645  448b9dd8feffff       movl r11,[rbp-0x128]
0x3cfe68ef844c  164c  4183e307             andl r11,0x7
0x3cfe68ef8450  1650  448ba5c8feffff       movl r12,[rbp-0x138]
0x3cfe68ef8457  1657  8b85c0feffff         movl rax,[rbp-0x140]
0x3cfe68ef845d  165d  3b85c8feffff         cmpl rax,[rbp-0x138]
0x3cfe68ef8463  1663  440f42e0             cmovcl r12,rax
0x3cfe68ef8467  1667  4589e7               movl r15,r12
0x3cfe68ef846a  166a  448b85d0feffff       movl r8,[rbp-0x130]
0x3cfe68ef8471  1671  4539e0               cmpl r8,r12
0x3cfe68ef8474  1674  450f42f8             cmovcl r15,r8
0x3cfe68ef8478  1678  458be7               movl r12,r15
0x3cfe68ef847b  167b  453bdf               cmpl r11,r15
0x3cfe68ef847e  167e  450f42e3             cmovcl r12,r11
0x3cfe68ef8482  1682  4585e4               testl r12,r12
0x3cfe68ef8485  1685  0f8529000000         jnz 0x3cfe68ef84b4  <+0x16b4>
0x3cfe68ef848b  168b  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3cfe68ef8493  1693  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3cfe68ef849b  169b  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3cfe68ef84a3  16a3  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3cfe68ef84ab  16ab  4c8b75c0             REX.W movq r14,[rbp-0x40]
0x3cfe68ef84af  16af  e978060000           jmp 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef84b4  16b4  448b9dd8feffff       movl r11,[rbp-0x128]
0x3cfe68ef84bb  16bb  4181e3f8ffff1f       andl r11,0x1ffffff8
0x3cfe68ef84c2  16c2  8bb5e0feffff         movl rsi,[rbp-0x120]
0x3cfe68ef84c8  16c8  468d1c9e             leal r11,[rsi+r11*4]
0x3cfe68ef84cc  16cc  448bbde8feffff       movl r15,[rbp-0x118]
0x3cfe68ef84d3  16d3  4181e7f8ffff1f       andl r15,0x1ffffff8
0x3cfe68ef84da  16da  8b85f0feffff         movl rax,[rbp-0x110]
0x3cfe68ef84e0  16e0  468d3cb8             leal r15,[rax+r15*4]
0x3cfe68ef84e4  16e4  4c8b75c0             REX.W movq r14,[rbp-0x40]
0x3cfe68ef84e8  16e8  c4817a10043e         vmovss xmm0,[r14+r15*1]
0x3cfe68ef84ee  16ee  c5fb10ad00ffffff     vmovsd xmm5,[rbp-0x100]
0x3cfe68ef84f6  16f6  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef84fa  16fa  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef84fe  16fe  448b8df8feffff       movl r9,[rbp-0x108]
0x3cfe68ef8505  1705  c4017a10040e         vmovss xmm8,[r14+r9*1]
0x3cfe68ef850b  170b  c57b108d08ffffff     vmovsd xmm9,[rbp-0xf8]
0x3cfe68ef8513  1713  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef8518  1718  c4412a59da           vmulss xmm11,xmm10,xmm10
0x3cfe68ef851d  171d  c5a258ff             vaddss xmm7,xmm11,xmm7
0x3cfe68ef8521  1721  c57b109d10ffffff     vmovsd xmm11,[rbp-0xf0]
0x3cfe68ef8529  1729  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef852d  172d  0f878a000000         ja 0x3cfe68ef85bd  <+0x17bd>
0x3cfe68ef8533  1733  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3cfe68ef853b  173b  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef853f  173f  0f86a0000000         jna 0x3cfe68ef85e5  <+0x17e5>
0x3cfe68ef8545  1745  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef854a  174a  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef854f  174f  0f8690000000         jna 0x3cfe68ef85e5  <+0x17e5>
0x3cfe68ef8555  1755  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3cfe68ef855d  175d  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x3cfe68ef8562  1762  c4c10972f619         vpslld xmm14,xmm14,25
0x3cfe68ef8568  1768  c4c10972d602         vpsrld xmm14,xmm14,2
0x3cfe68ef856e  176e  c4c14258fe           vaddss xmm7,xmm7,xmm14
0x3cfe68ef8573  1773  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef8578  1778  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef857e  177e  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8584  1784  c4c17a103416         vmovss xmm6,[r14+rdx*1]
0x3cfe68ef858a  178a  c4e37921c620         vinsertps xmm0,xmm0,xmm6,0x20
0x3cfe68ef8590  1790  c4817a10341e         vmovss xmm6,[r14+r11*1]
0x3cfe68ef8596  1796  c4e37921c630         vinsertps xmm0,xmm0,xmm6,0x30
0x3cfe68ef859c  179c  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef85a4  17a4  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef85a8  17a8  c5fb11bd50ffffff     vmovsd [rbp-0xb0],xmm7
0x3cfe68ef85b0  17b0  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef85b8  17b8  e928000000           jmp 0x3cfe68ef85e5  <+0x17e5>
0x3cfe68ef85bd  17bd  c52a589528ffffff     vaddss xmm10,xmm10,[rbp-0xd8]
0x3cfe68ef85c5  17c5  c54a588540ffffff     vaddss xmm8,xmm6,[rbp-0xc0]
0x3cfe68ef85cd  17cd  c57b10a518ffffff     vmovsd xmm12,[rbp-0xe8]
0x3cfe68ef85d5  17d5  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef85dd  17dd  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef85e5  17e5  4183fc01             cmpl r12,0x1
0x3cfe68ef85e9  17e9  0f843d050000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef85ef  17ef  c4817a10443e04       vmovss xmm0,[r14+r15*1+0x4]
0x3cfe68ef85f6  17f6  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef85fa  17fa  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef85fe  17fe  c4017a10440e04       vmovss xmm8,[r14+r9*1+0x4]
0x3cfe68ef8605  1805  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef860a  180a  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef860f  180f  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef8613  1813  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef8617  1817  0f8780000000         ja 0x3cfe68ef869d  <+0x189d>
0x3cfe68ef861d  181d  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef8621  1821  0f869f000000         jna 0x3cfe68ef86c6  <+0x18c6>
0x3cfe68ef8627  1827  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef862c  182c  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef8631  1831  0f868f000000         jna 0x3cfe68ef86c6  <+0x18c6>
0x3cfe68ef8637  1837  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef863b  183b  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef8640  1840  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef8645  1845  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef864d  184d  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3cfe68ef8651  1851  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef8656  1856  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef865c  185c  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8662  1862  c4417a10441604       vmovss xmm8,[r14+rdx*1+0x4]
0x3cfe68ef8669  1869  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef866f  186f  c4017a10441e04       vmovss xmm8,[r14+r11*1+0x4]
0x3cfe68ef8676  1876  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef867c  187c  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8684  1884  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef8688  1888  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8690  1890  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef8698  1898  e929000000           jmp 0x3cfe68ef86c6  <+0x18c6>
0x3cfe68ef869d  189d  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef86a5  18a5  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef86a9  18a9  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef86b1  18b1  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef86b6  18b6  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef86be  18be  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef86c6  18c6  4183fc02             cmpl r12,0x2
0x3cfe68ef86ca  18ca  0f845c040000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef86d0  18d0  c4817a10443e08       vmovss xmm0,[r14+r15*1+0x8]
0x3cfe68ef86d7  18d7  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef86db  18db  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef86df  18df  c4017a10440e08       vmovss xmm8,[r14+r9*1+0x8]
0x3cfe68ef86e6  18e6  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef86eb  18eb  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef86f0  18f0  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef86f4  18f4  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef86f8  18f8  0f8780000000         ja 0x3cfe68ef877e  <+0x197e>
0x3cfe68ef86fe  18fe  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef8702  1902  0f869f000000         jna 0x3cfe68ef87a7  <+0x19a7>
0x3cfe68ef8708  1908  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef870d  190d  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef8712  1912  0f868f000000         jna 0x3cfe68ef87a7  <+0x19a7>
0x3cfe68ef8718  1918  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef871c  191c  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef8721  1921  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef8726  1926  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef872e  192e  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3cfe68ef8732  1932  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef8737  1937  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef873d  193d  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8743  1943  c4417a10441608       vmovss xmm8,[r14+rdx*1+0x8]
0x3cfe68ef874a  194a  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef8750  1950  c4017a10441e08       vmovss xmm8,[r14+r11*1+0x8]
0x3cfe68ef8757  1957  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef875d  195d  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8765  1965  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef8769  1969  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8771  1971  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef8779  1979  e929000000           jmp 0x3cfe68ef87a7  <+0x19a7>
0x3cfe68ef877e  197e  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef8786  1986  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef878a  198a  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8792  1992  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef8797  1997  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef879f  199f  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef87a7  19a7  4183fc03             cmpl r12,0x3
0x3cfe68ef87ab  19ab  0f847b030000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef87b1  19b1  c4817a10443e0c       vmovss xmm0,[r14+r15*1+0xc]
0x3cfe68ef87b8  19b8  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef87bc  19bc  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef87c0  19c0  c4017a10440e0c       vmovss xmm8,[r14+r9*1+0xc]
0x3cfe68ef87c7  19c7  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef87cc  19cc  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef87d1  19d1  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef87d5  19d5  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef87d9  19d9  0f8780000000         ja 0x3cfe68ef885f  <+0x1a5f>
0x3cfe68ef87df  19df  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef87e3  19e3  0f869f000000         jna 0x3cfe68ef8888  <+0x1a88>
0x3cfe68ef87e9  19e9  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef87ee  19ee  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef87f3  19f3  0f868f000000         jna 0x3cfe68ef8888  <+0x1a88>
0x3cfe68ef87f9  19f9  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef87fd  19fd  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef8802  1a02  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef8807  1a07  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef880f  1a0f  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3cfe68ef8813  1a13  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef8818  1a18  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef881e  1a1e  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8824  1a24  c4417a1044160c       vmovss xmm8,[r14+rdx*1+0xc]
0x3cfe68ef882b  1a2b  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef8831  1a31  c4017a10441e0c       vmovss xmm8,[r14+r11*1+0xc]
0x3cfe68ef8838  1a38  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef883e  1a3e  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8846  1a46  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef884a  1a4a  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8852  1a52  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef885a  1a5a  e929000000           jmp 0x3cfe68ef8888  <+0x1a88>
0x3cfe68ef885f  1a5f  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef8867  1a67  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef886b  1a6b  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8873  1a73  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef8878  1a78  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef8880  1a80  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef8888  1a88  4183fc04             cmpl r12,0x4
0x3cfe68ef888c  1a8c  0f849a020000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8892  1a92  c4817a10443e10       vmovss xmm0,[r14+r15*1+0x10]
0x3cfe68ef8899  1a99  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef889d  1a9d  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef88a1  1aa1  c4017a10440e10       vmovss xmm8,[r14+r9*1+0x10]
0x3cfe68ef88a8  1aa8  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef88ad  1aad  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef88b2  1ab2  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef88b6  1ab6  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef88ba  1aba  0f8780000000         ja 0x3cfe68ef8940  <+0x1b40>
0x3cfe68ef88c0  1ac0  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef88c4  1ac4  0f869f000000         jna 0x3cfe68ef8969  <+0x1b69>
0x3cfe68ef88ca  1aca  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef88cf  1acf  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef88d4  1ad4  0f868f000000         jna 0x3cfe68ef8969  <+0x1b69>
0x3cfe68ef88da  1ada  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef88de  1ade  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef88e3  1ae3  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef88e8  1ae8  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef88f0  1af0  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3cfe68ef88f4  1af4  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef88f9  1af9  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef88ff  1aff  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8905  1b05  c4417a10441610       vmovss xmm8,[r14+rdx*1+0x10]
0x3cfe68ef890c  1b0c  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef8912  1b12  c4017a10441e10       vmovss xmm8,[r14+r11*1+0x10]
0x3cfe68ef8919  1b19  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef891f  1b1f  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8927  1b27  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef892b  1b2b  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8933  1b33  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef893b  1b3b  e929000000           jmp 0x3cfe68ef8969  <+0x1b69>
0x3cfe68ef8940  1b40  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef8948  1b48  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef894c  1b4c  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8954  1b54  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef8959  1b59  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef8961  1b61  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef8969  1b69  4183fc05             cmpl r12,0x5
0x3cfe68ef896d  1b6d  0f84b9010000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8973  1b73  c4817a10443e14       vmovss xmm0,[r14+r15*1+0x14]
0x3cfe68ef897a  1b7a  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef897e  1b7e  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef8982  1b82  c4017a10440e14       vmovss xmm8,[r14+r9*1+0x14]
0x3cfe68ef8989  1b89  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef898e  1b8e  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef8993  1b93  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef8997  1b97  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef899b  1b9b  0f8780000000         ja 0x3cfe68ef8a21  <+0x1c21>
0x3cfe68ef89a1  1ba1  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef89a5  1ba5  0f869f000000         jna 0x3cfe68ef8a4a  <+0x1c4a>
0x3cfe68ef89ab  1bab  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef89b0  1bb0  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef89b5  1bb5  0f868f000000         jna 0x3cfe68ef8a4a  <+0x1c4a>
0x3cfe68ef89bb  1bbb  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef89bf  1bbf  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef89c4  1bc4  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef89c9  1bc9  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef89d1  1bd1  c58a58f7             vaddss xmm6,xmm14,xmm7
0x3cfe68ef89d5  1bd5  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef89da  1bda  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef89e0  1be0  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef89e6  1be6  c4417a10441614       vmovss xmm8,[r14+rdx*1+0x14]
0x3cfe68ef89ed  1bed  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef89f3  1bf3  c4017a10441e14       vmovss xmm8,[r14+r11*1+0x14]
0x3cfe68ef89fa  1bfa  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef8a00  1c00  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8a08  1c08  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef8a0c  1c0c  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8a14  1c14  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef8a1c  1c1c  e929000000           jmp 0x3cfe68ef8a4a  <+0x1c4a>
0x3cfe68ef8a21  1c21  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef8a29  1c29  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef8a2d  1c2d  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8a35  1c35  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef8a3a  1c3a  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef8a42  1c42  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef8a4a  1c4a  4183fc06             cmpl r12,0x6
0x3cfe68ef8a4e  1c4e  0f84d8000000         jz 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8a54  1c54  c4817a10443e18       vmovss xmm0,[r14+r15*1+0x18]
0x3cfe68ef8a5b  1c5b  c5d25cf0             vsubss xmm6,xmm5,xmm0
0x3cfe68ef8a5f  1c5f  c5ca59fe             vmulss xmm7,xmm6,xmm6
0x3cfe68ef8a63  1c63  c4017a10440e18       vmovss xmm8,[r14+r9*1+0x18]
0x3cfe68ef8a6a  1c6a  c441325cd0           vsubss xmm10,xmm9,xmm8
0x3cfe68ef8a6f  1c6f  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x3cfe68ef8a74  1c74  c59258ff             vaddss xmm7,xmm13,xmm7
0x3cfe68ef8a78  1c78  c5782edf             vucomiss xmm11,xmm7
0x3cfe68ef8a7c  1c7c  0f8781000000         ja 0x3cfe68ef8b03  <+0x1d03>
0x3cfe68ef8a82  1c82  c5782ee7             vucomiss xmm12,xmm7
0x3cfe68ef8a86  1c86  0f86a0000000         jna 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8a8c  1c8c  c4411057ed           vxorps xmm13,xmm13,xmm13
0x3cfe68ef8a91  1c91  c4c1782efd           vucomiss xmm7,xmm13
0x3cfe68ef8a96  1c96  0f8690000000         jna 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8a9c  1c9c  c5c176ff             vpcmpeqd xmm7,xmm7,xmm7
0x3cfe68ef8aa0  1ca0  c5c172f719           vpslld xmm7,xmm7,25
0x3cfe68ef8aa5  1ca5  c5c172d702           vpsrld xmm7,xmm7,2
0x3cfe68ef8aaa  1caa  c57b10b550ffffff     vmovsd xmm14,[rbp-0xb0]
0x3cfe68ef8ab2  1cb2  c4c14258f6           vaddss xmm6,xmm7,xmm14
0x3cfe68ef8ab7  1cb7  c4e27918c0           vbroadcastss xmm0,xmm0
0x3cfe68ef8abc  1cbc  c4c37921c010         vinsertps xmm0,xmm0,xmm8,0x10
0x3cfe68ef8ac2  1cc2  8b9520ffffff         movl rdx,[rbp-0xe0]
0x3cfe68ef8ac8  1cc8  c4417a10441618       vmovss xmm8,[r14+rdx*1+0x18]
0x3cfe68ef8acf  1ccf  c4c37921c020         vinsertps xmm0,xmm0,xmm8,0x20
0x3cfe68ef8ad5  1cd5  c4017a10441e18       vmovss xmm8,[r14+r11*1+0x18]
0x3cfe68ef8adc  1cdc  c4c37921c030         vinsertps xmm0,xmm0,xmm8,0x30
0x3cfe68ef8ae2  1ce2  c578108530ffffff     vmovups xmm8,[rbp-0xd0]
0x3cfe68ef8aea  1cea  c5b858c0             vaddps xmm0,xmm8,xmm0
0x3cfe68ef8aee  1cee  c5fb11b550ffffff     vmovsd [rbp-0xb0],xmm6
0x3cfe68ef8af6  1cf6  c5f8118530ffffff     vmovups [rbp-0xd0],xmm0
0x3cfe68ef8afe  1cfe  e929000000           jmp 0x3cfe68ef8b2c  <+0x1d2c>
0x3cfe68ef8b03  1d03  c5fb108528ffffff     vmovsd xmm0,[rbp-0xd8]
0x3cfe68ef8b0b  1d0b  c52a58d0             vaddss xmm10,xmm10,xmm0
0x3cfe68ef8b0f  1d0f  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8b17  1d17  c4414a58c0           vaddss xmm8,xmm6,xmm8
0x3cfe68ef8b1c  1d1c  c57b119528ffffff     vmovsd [rbp-0xd8],xmm10
0x3cfe68ef8b24  1d24  c57b118540ffffff     vmovsd [rbp-0xc0],xmm8
0x3cfe68ef8b2c  1d2c  448b5dc8             movl r11,[rbp-0x38]
0x3cfe68ef8b30  1d30  458d6301             leal r12,[r11+0x1]
0x3cfe68ef8b34  1d34  448bbd58ffffff       movl r15,[rbp-0xa8]
0x3cfe68ef8b3b  1d3b  453bfb               cmpl r15,r11
0x3cfe68ef8b3e  1d3e  0f853cefffff         jnz 0x3cfe68ef7a80  <+0xc80>
0x3cfe68ef8b44  1d44  8b5de0               movl rbx,[rbp-0x20]
0x3cfe68ef8b47  1d47  c57b108540ffffff     vmovsd xmm8,[rbp-0xc0]
0x3cfe68ef8b4f  1d4f  c4417a11441e24       vmovss [r14+rbx*1+0x24],xmm8
0x3cfe68ef8b56  1d56  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3cfe68ef8b5e  1d5e  c4c17a117c1e20       vmovss [r14+rbx*1+0x20],xmm7
0x3cfe68ef8b65  1d65  c4c17a6f841ea0000000 vmovdqu xmm0,[r14+rbx*1+0xa0]
0x3cfe68ef8b6f  1d6f  c4c17a6fac1e80000000 vmovdqu xmm5,[r14+rbx*1+0x80]
0x3cfe68ef8b79  1d79  c4c17a6f741e60       vmovdqu xmm6,[r14+rbx*1+0x60]
0x3cfe68ef8b80  1d80  c4c17a6f7c1e40       vmovdqu xmm7,[r14+rbx*1+0x40]
0x3cfe68ef8b87  1d87  c4417a6f841eb0000000 vmovdqu xmm8,[r14+rbx*1+0xb0]
0x3cfe68ef8b91  1d91  c4417a6f8c1e90000000 vmovdqu xmm9,[r14+rbx*1+0x90]
0x3cfe68ef8b9b  1d9b  c4417a6f541e70       vmovdqu xmm10,[r14+rbx*1+0x70]
0x3cfe68ef8ba2  1da2  c4417a6f6c1e50       vmovdqu xmm13,[r14+rbx*1+0x50]
0x3cfe68ef8ba9  1da9  c57810b530ffffff     vmovups xmm14,[rbp-0xd0]
0x3cfe68ef8bb1  1db1  c4417a7f741e10       vmovdqu [r14+rbx*1+0x10],xmm14
0x3cfe68ef8bb8  1db8  c57970fe00           vpshufd xmm15,xmm6,0x0
0x3cfe68ef8bbd  1dbd  c5f970cf00           vpshufd xmm1,xmm7,0x0
0x3cfe68ef8bc2  1dc2  c4c3710ecf0c         vpblendw xmm1,xmm1,xmm15,0xc
0x3cfe68ef8bc8  1dc8  c57970f800           vpshufd xmm15,xmm0,0x0
0x3cfe68ef8bcd  1dcd  c5f970d500           vpshufd xmm2,xmm5,0x0
0x3cfe68ef8bd2  1dd2  c4c3690ed7c0         vpblendw xmm2,xmm2,xmm15,0xc0
0x3cfe68ef8bd8  1dd8  c4e3710ecaf0         vpblendw xmm1,xmm1,xmm2,0xf0
0x3cfe68ef8bde  1dde  c57970fe05           vpshufd xmm15,xmm6,0x5
0x3cfe68ef8be3  1de3  c5f970d705           vpshufd xmm2,xmm7,0x5
0x3cfe68ef8be8  1de8  c4c3690ed70c         vpblendw xmm2,xmm2,xmm15,0xc
0x3cfe68ef8bee  1dee  c57970f850           vpshufd xmm15,xmm0,0x50
0x3cfe68ef8bf3  1df3  c5f970dd50           vpshufd xmm3,xmm5,0x50
0x3cfe68ef8bf8  1df8  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x3cfe68ef8bfe  1dfe  c4e3690ed3f0         vpblendw xmm2,xmm2,xmm3,0xf0
0x3cfe68ef8c04  1e04  c5f058ca             vaddps xmm1,xmm1,xmm2
0x3cfe68ef8c08  1e08  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x3cfe68ef8c0d  1e0d  c5f970d70a           vpshufd xmm2,xmm7,0xa
0x3cfe68ef8c12  1e12  c4c3690ed70c         vpblendw xmm2,xmm2,xmm15,0xc
0x3cfe68ef8c18  1e18  c57970f8a0           vpshufd xmm15,xmm0,0xa0
0x3cfe68ef8c1d  1e1d  c5f970dda0           vpshufd xmm3,xmm5,0xa0
0x3cfe68ef8c22  1e22  c4c3610edfc0         vpblendw xmm3,xmm3,xmm15,0xc0
0x3cfe68ef8c28  1e28  c4e3690ed3f0         vpblendw xmm2,xmm2,xmm3,0xf0
0x3cfe68ef8c2e  1e2e  c5f058ca             vaddps xmm1,xmm1,xmm2
0x3cfe68ef8c32  1e32  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x3cfe68ef8c37  1e37  c5f970f70f           vpshufd xmm6,xmm7,0xf
0x3cfe68ef8c3c  1e3c  c4c3490ef70c         vpblendw xmm6,xmm6,xmm15,0xc
0x3cfe68ef8c42  1e42  c57970f8f0           vpshufd xmm15,xmm0,0xf0
0x3cfe68ef8c47  1e47  c5f970c5f0           vpshufd xmm0,xmm5,0xf0
0x3cfe68ef8c4c  1e4c  c4c3790ec7c0         vpblendw xmm0,xmm0,xmm15,0xc0
0x3cfe68ef8c52  1e52  c4e3490ec0f0         vpblendw xmm0,xmm6,xmm0,0xf0
0x3cfe68ef8c58  1e58  c5f058c0             vaddps xmm0,xmm1,xmm0
0x3cfe68ef8c5c  1e5c  c4417970fa00         vpshufd xmm15,xmm10,0x0
0x3cfe68ef8c62  1e62  c4c17970ed00         vpshufd xmm5,xmm13,0x0
0x3cfe68ef8c68  1e68  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3cfe68ef8c6e  1e6e  c4417970f800         vpshufd xmm15,xmm8,0x0
0x3cfe68ef8c74  1e74  c4c17970f100         vpshufd xmm6,xmm9,0x0
0x3cfe68ef8c7a  1e7a  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3cfe68ef8c80  1e80  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3cfe68ef8c86  1e86  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3cfe68ef8c8a  1e8a  c4417970fa05         vpshufd xmm15,xmm10,0x5
0x3cfe68ef8c90  1e90  c4c17970ed05         vpshufd xmm5,xmm13,0x5
0x3cfe68ef8c96  1e96  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3cfe68ef8c9c  1e9c  c4417970f850         vpshufd xmm15,xmm8,0x50
0x3cfe68ef8ca2  1ea2  c4c17970f150         vpshufd xmm6,xmm9,0x50
0x3cfe68ef8ca8  1ea8  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3cfe68ef8cae  1eae  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3cfe68ef8cb4  1eb4  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3cfe68ef8cb8  1eb8  c4417970fa0a         vpshufd xmm15,xmm10,0xa
0x3cfe68ef8cbe  1ebe  c4c17970ed0a         vpshufd xmm5,xmm13,0xa
0x3cfe68ef8cc4  1ec4  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3cfe68ef8cca  1eca  c4417970f8a0         vpshufd xmm15,xmm8,0xa0
0x3cfe68ef8cd0  1ed0  c4c17970f1a0         vpshufd xmm6,xmm9,0xa0
0x3cfe68ef8cd6  1ed6  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3cfe68ef8cdc  1edc  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3cfe68ef8ce2  1ee2  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3cfe68ef8ce6  1ee6  c4417970fa0f         vpshufd xmm15,xmm10,0xf
0x3cfe68ef8cec  1eec  c4c17970ed0f         vpshufd xmm5,xmm13,0xf
0x3cfe68ef8cf2  1ef2  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3cfe68ef8cf8  1ef8  c4417970f8f0         vpshufd xmm15,xmm8,0xf0
0x3cfe68ef8cfe  1efe  c4c17970f1f0         vpshufd xmm6,xmm9,0xf0
0x3cfe68ef8d04  1f04  c4c3490ef7c0         vpblendw xmm6,xmm6,xmm15,0xc0
0x3cfe68ef8d0a  1f0a  c4e3510eeef0         vpblendw xmm5,xmm5,xmm6,0xf0
0x3cfe68ef8d10  1f10  c5f858c5             vaddps xmm0,xmm0,xmm5
0x3cfe68ef8d14  1f14  c4c17858c6           vaddps xmm0,xmm0,xmm14
0x3cfe68ef8d19  1f19  c4c17a6fac1ec0000000 vmovdqu xmm5,[r14+rbx*1+0xc0]
0x3cfe68ef8d23  1f23  c4c17a6fb41ee0000000 vmovdqu xmm6,[r14+rbx*1+0xe0]
0x3cfe68ef8d2d  1f2d  c57970fe00           vpshufd xmm15,xmm6,0x0
0x3cfe68ef8d32  1f32  c5f970fd00           vpshufd xmm7,xmm5,0x0
0x3cfe68ef8d37  1f37  c4c3410eff0c         vpblendw xmm7,xmm7,xmm15,0xc
0x3cfe68ef8d3d  1f3d  c57970fe05           vpshufd xmm15,xmm6,0x5
0x3cfe68ef8d42  1f42  c57970c505           vpshufd xmm8,xmm5,0x5
0x3cfe68ef8d47  1f47  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3cfe68ef8d4d  1f4d  c4c14058f8           vaddps xmm7,xmm7,xmm8
0x3cfe68ef8d52  1f52  c57970fe0a           vpshufd xmm15,xmm6,0xa
0x3cfe68ef8d57  1f57  c57970c50a           vpshufd xmm8,xmm5,0xa
0x3cfe68ef8d5c  1f5c  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3cfe68ef8d62  1f62  c4c14058f8           vaddps xmm7,xmm7,xmm8
0x3cfe68ef8d67  1f67  c57970fe0f           vpshufd xmm15,xmm6,0xf
0x3cfe68ef8d6c  1f6c  c5f970ed0f           vpshufd xmm5,xmm5,0xf
0x3cfe68ef8d71  1f71  c4c3510eef0c         vpblendw xmm5,xmm5,xmm15,0xc
0x3cfe68ef8d77  1f77  c5c058ed             vaddps xmm5,xmm7,xmm5
0x3cfe68ef8d7b  1f7b  c4c17a6fb41ed0000000 vmovdqu xmm6,[r14+rbx*1+0xd0]
0x3cfe68ef8d85  1f85  c4c17a6fbc1ef0000000 vmovdqu xmm7,[r14+rbx*1+0xf0]
0x3cfe68ef8d8f  1f8f  c57970ff00           vpshufd xmm15,xmm7,0x0
0x3cfe68ef8d94  1f94  c57970c600           vpshufd xmm8,xmm6,0x0
0x3cfe68ef8d99  1f99  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3cfe68ef8d9f  1f9f  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3cfe68ef8da4  1fa4  c57970ff05           vpshufd xmm15,xmm7,0x5
0x3cfe68ef8da9  1fa9  c57970c605           vpshufd xmm8,xmm6,0x5
0x3cfe68ef8dae  1fae  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3cfe68ef8db4  1fb4  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3cfe68ef8db9  1fb9  c57970ff0a           vpshufd xmm15,xmm7,0xa
0x3cfe68ef8dbe  1fbe  c57970c60a           vpshufd xmm8,xmm6,0xa
0x3cfe68ef8dc3  1fc3  c443390ec70c         vpblendw xmm8,xmm8,xmm15,0xc
0x3cfe68ef8dc9  1fc9  c4c15058e8           vaddps xmm5,xmm5,xmm8
0x3cfe68ef8dce  1fce  c57970ff0f           vpshufd xmm15,xmm7,0xf
0x3cfe68ef8dd3  1fd3  c5f970f60f           vpshufd xmm6,xmm6,0xf
0x3cfe68ef8dd8  1fd8  c4c3490ef70c         vpblendw xmm6,xmm6,xmm15,0xc
0x3cfe68ef8dde  1fde  c5d058ee             vaddps xmm5,xmm5,xmm6
0x3cfe68ef8de2  1fe2  c4c17a6f741e20       vmovdqu xmm6,[r14+rbx*1+0x20]
0x3cfe68ef8de9  1fe9  c5d058ee             vaddps xmm5,xmm5,xmm6
0x3cfe68ef8ded  1fed  c4c17a10b41e04010000 vmovss xmm6,[r14+rbx*1+0x104]
0x3cfe68ef8df7  1ff7  c4c17a10bc1e00010000 vmovss xmm7,[r14+rbx*1+0x100]
0x3cfe68ef8e01  2001  c4417a10841e08010000 vmovss xmm8,[r14+rbx*1+0x108]
0x3cfe68ef8e0b  200b  c4417a108c1e0c010000 vmovss xmm9,[r14+rbx*1+0x10c]
0x3cfe68ef8e15  2015  c4417a10941e10010000 vmovss xmm10,[r14+rbx*1+0x110]
0x3cfe68ef8e1f  201f  c4417a10ac1e14010000 vmovss xmm13,[r14+rbx*1+0x114]
0x3cfe68ef8e29  2029  c4417a10b41e18010000 vmovss xmm14,[r14+rbx*1+0x118]
0x3cfe68ef8e33  2033  c4c17a108c1e1c010000 vmovss xmm1,[r14+rbx*1+0x11c]
0x3cfe68ef8e3d  203d  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0x3cfe68ef8e45  2045  c4c17a11541e28       vmovss [r14+rbx*1+0x28],xmm2
0x3cfe68ef8e4c  204c  c5ca58f7             vaddss xmm6,xmm6,xmm7
0x3cfe68ef8e50  2050  c4c14a58f0           vaddss xmm6,xmm6,xmm8
0x3cfe68ef8e55  2055  c4c14a58f1           vaddss xmm6,xmm6,xmm9
0x3cfe68ef8e5a  205a  c4c14a58f2           vaddss xmm6,xmm6,xmm10
0x3cfe68ef8e5f  205f  c4c14a58f5           vaddss xmm6,xmm6,xmm13
0x3cfe68ef8e64  2064  c4c14a58f6           vaddss xmm6,xmm6,xmm14
0x3cfe68ef8e69  2069  c5ca58f1             vaddss xmm6,xmm6,xmm1
0x3cfe68ef8e6d  206d  c5ca58f2             vaddss xmm6,xmm6,xmm2
0x3cfe68ef8e71  2071  448b9d70ffffff       movl r11,[rbp-0x90]
0x3cfe68ef8e78  2078  c4c17a11741e28       vmovss [r14+rbx*1+0x28],xmm6
0x3cfe68ef8e7f  207f  4d8d6620             REX.W leaq r12,[r14+0x20]
0x3cfe68ef8e83  2083  c4c178132c1c         vmovlps [r12+rbx*1],xmm5
0x3cfe68ef8e89  2089  c4c17a7f441e10       vmovdqu [r14+rbx*1+0x10],xmm0
0x3cfe68ef8e90  2090  8d4b30               leal rcx,[rbx+0x30]
0x3cfe68ef8e93  2093  448d4b10             leal r9,[rbx+0x10]
0x3cfe68ef8e97  2097  4c895dc8             REX.W movq [rbp-0x38],r11
0x3cfe68ef8e9b  209b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef8e9f  209f  8b4590               movl rax,[rbp-0x70]
0x3cfe68ef8ea2  20a2  8b5588               movl rdx,[rbp-0x78]
0x3cfe68ef8ea5  20a5  c5fb104d80           vmovsd xmm1,[rbp-0x80]
0x3cfe68ef8eaa  20aa  c5fb109578ffffff     vmovsd xmm2,[rbp-0x88]
0x3cfe68ef8eb2  20b2  e8914ef2ff           call 0x3cfe68e1dd48  (jump table)
0x3cfe68ef8eb7  20b7  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef8eba  20ba  3b5dd0               cmpl rbx,[rbp-0x30]
0x3cfe68ef8ebd  20bd  0f8628010000         jna 0x3cfe68ef8feb  <+0x21eb>
0x3cfe68ef8ec3  20c3  448b5d98             movl r11,[rbp-0x68]
0x3cfe68ef8ec7  20c7  443b5dd0             cmpl r11,[rbp-0x30]
0x3cfe68ef8ecb  20cb  0f86b7000000         jna 0x3cfe68ef8f88  <+0x2188>
0x3cfe68ef8ed1  20d1  448b65d0             movl r12,[rbp-0x30]
0x3cfe68ef8ed5  20d5  448b7da0             movl r15,[rbp-0x60]
0x3cfe68ef8ed9  20d9  478d34a7             leal r14,[r15+r12*4]
0x3cfe68ef8edd  20dd  8b45e0               movl rax,[rbp-0x20]
0x3cfe68ef8ee0  20e0  488b55c0             REX.W movq rdx,[rbp-0x40]
0x3cfe68ef8ee4  20e4  c5fa10440240         vmovss xmm0,[rdx+rax*1+0x40]
0x3cfe68ef8eea  20ea  c4a17a110432         vmovss [rdx+r14*1],xmm0
0x3cfe68ef8ef0  20f0  448b75a8             movl r14,[rbp-0x58]
0x3cfe68ef8ef4  20f4  438d0ca6             leal rcx,[r14+r12*4]
0x3cfe68ef8ef8  20f8  c5fa10440244         vmovss xmm0,[rdx+rax*1+0x44]
0x3cfe68ef8efe  20fe  c5fa11040a           vmovss [rdx+rcx*1],xmm0
0x3cfe68ef8f03  2103  8b4db0               movl rcx,[rbp-0x50]
0x3cfe68ef8f06  2106  428d34a1             leal rsi,[rcx+r12*4]
0x3cfe68ef8f0a  210a  c5fa10440248         vmovss xmm0,[rdx+rax*1+0x48]
0x3cfe68ef8f10  2110  c5fa110432           vmovss [rdx+rsi*1],xmm0
0x3cfe68ef8f15  2115  8b75b8               movl rsi,[rbp-0x48]
0x3cfe68ef8f18  2118  428d3ca6             leal rdi,[rsi+r12*4]
0x3cfe68ef8f1c  211c  c5fa1044024c         vmovss xmm0,[rdx+rax*1+0x4c]
0x3cfe68ef8f22  2122  c5fa11043a           vmovss [rdx+rdi*1],xmm0
0x3cfe68ef8f27  2127  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef8f2b  212b  4489e3               movl rbx,r12
0x3cfe68ef8f2e  212e  418bc3               movl rax,r11
0x3cfe68ef8f31  2131  4c8bda               REX.W movq r11,rdx
0x3cfe68ef8f34  2134  8bd1                 movl rdx,rcx
0x3cfe68ef8f36  2136  418bce               movl rcx,r14
0x3cfe68ef8f39  2139  418bf7               movl rsi,r15
0x3cfe68ef8f3c  213c  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3cfe68ef8f40  2140  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3cfe68ef8f45  2145  c4c13972f019         vpslld xmm8,xmm8,25
0x3cfe68ef8f4b  214b  c4c13972d002         vpsrld xmm8,xmm8,2
0x3cfe68ef8f51  2151  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef8f59  2159  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef8f61  2161  c5f810bdb0feffff     vmovups xmm7,[rbp-0x150]
0x3cfe68ef8f69  2169  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3cfe68ef8f71  2171  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3cfe68ef8f79  2179  4533c9               xorl r9,r9
0x3cfe68ef8f7c  217c  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef8f83  2183  e9c1000000           jmp 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef8f88  2188  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef8f8c  218c  8b5dd0               movl rbx,[rbp-0x30]
0x3cfe68ef8f8f  218f  418bc3               movl rax,r11
0x3cfe68ef8f92  2192  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef8f96  2196  8b55b0               movl rdx,[rbp-0x50]
0x3cfe68ef8f99  2199  8b4da8               movl rcx,[rbp-0x58]
0x3cfe68ef8f9c  219c  8b75a0               movl rsi,[rbp-0x60]
0x3cfe68ef8f9f  219f  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3cfe68ef8fa3  21a3  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3cfe68ef8fa8  21a8  c4c13972f019         vpslld xmm8,xmm8,25
0x3cfe68ef8fae  21ae  c4c13972d002         vpsrld xmm8,xmm8,2
0x3cfe68ef8fb4  21b4  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef8fbc  21bc  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef8fc4  21c4  c5f810bdb0feffff     vmovups xmm7,[rbp-0x150]
0x3cfe68ef8fcc  21cc  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3cfe68ef8fd4  21d4  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3cfe68ef8fdc  21dc  4533c9               xorl r9,r9
0x3cfe68ef8fdf  21df  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef8fe6  21e6  e95e000000           jmp 0x3cfe68ef9049  <+0x2249>
0x3cfe68ef8feb  21eb  48895dc8             REX.W movq [rbp-0x38],rbx
0x3cfe68ef8fef  21ef  8b5dd0               movl rbx,[rbp-0x30]
0x3cfe68ef8ff2  21f2  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef8ff6  21f6  8b55b0               movl rdx,[rbp-0x50]
0x3cfe68ef8ff9  21f9  8b4da8               movl rcx,[rbp-0x58]
0x3cfe68ef8ffc  21fc  8b75a0               movl rsi,[rbp-0x60]
0x3cfe68ef8fff  21ff  8b4598               movl rax,[rbp-0x68]
0x3cfe68ef9002  2202  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3cfe68ef9006  2206  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3cfe68ef900b  220b  c4c13972f019         vpslld xmm8,xmm8,25
0x3cfe68ef9011  2211  c4c13972d002         vpsrld xmm8,xmm8,2
0x3cfe68ef9017  2217  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef901f  221f  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef9027  2227  c5f810bdb0feffff     vmovups xmm7,[rbp-0x150]
0x3cfe68ef902f  222f  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3cfe68ef9037  2237  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3cfe68ef903f  223f  4533c9               xorl r9,r9
0x3cfe68ef9042  2242  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef9049  2249  83c301               addl rbx,0x1
0x3cfe68ef904c  224c  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef9050  2250  443bfb               cmpl r15,rbx
0x3cfe68ef9053  2253  0f85e7e5ffff         jnz 0x3cfe68ef7640  <+0x840>
0x3cfe68ef9059  2259  448b5de0             movl r11,[rbp-0x20]
0x3cfe68ef905d  225d  4181c320010000       addl r11,0x120
0x3cfe68ef9064  2264  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x3cfe68ef9068  2268  45891c24             movl [r12],r11
0x3cfe68ef906c  226c  488be5               REX.W movq rsp,rbp
0x3cfe68ef906f  226f  5d                   pop rbp
0x3cfe68ef9070  2270  c3                   retl
0x3cfe68ef9071  2271  e85a54f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9076  2276  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef907a  227a  488b75f0             REX.W movq rsi,[rbp-0x10]
0x3cfe68ef907e  227e  8b45d8               movl rax,[rbp-0x28]
0x3cfe68ef9081  2281  e99eddffff           jmp 0x3cfe68ef6e24  <+0x24>
0x3cfe68ef9086  2286  c441792ec0           vucomisd xmm8,xmm8
0x3cfe68ef908b  228b  0f8b0a000000         jpo 0x3cfe68ef909b  <+0x229b>
0x3cfe68ef9091  2291  33d2                 xorl rdx,rdx
0x3cfe68ef9093  2293  4c8bf2               REX.W movq r14,rdx
0x3cfe68ef9096  2296  e9f8deffff           jmp 0x3cfe68ef6f93  <+0x193>
0x3cfe68ef909b  229b  c4413857c0           vxorps xmm8,xmm8,xmm8
0x3cfe68ef90a0  22a0  c5782ec7             vucomiss xmm8,xmm7
0x3cfe68ef90a4  22a4  0f870b000000         ja 0x3cfe68ef90b5  <+0x22b5>
0x3cfe68ef90aa  22aa  41beffffffff         movl r14,0xffffffff
0x3cfe68ef90b0  22b0  e9dedeffff           jmp 0x3cfe68ef6f93  <+0x193>
0x3cfe68ef90b5  22b5  4533f6               xorl r14,r14
0x3cfe68ef90b8  22b8  e9d6deffff           jmp 0x3cfe68ef6f93  <+0x193>
0x3cfe68ef90bd  22bd  c441792ec9           vucomisd xmm9,xmm9
0x3cfe68ef90c2  22c2  0f8b08000000         jpo 0x3cfe68ef90d0  <+0x22d0>
0x3cfe68ef90c8  22c8  4533f6               xorl r14,r14
0x3cfe68ef90cb  22cb  e92bdfffff           jmp 0x3cfe68ef6ffb  <+0x1fb>
0x3cfe68ef90d0  22d0  c4413057c9           vxorps xmm9,xmm9,xmm9
0x3cfe68ef90d5  22d5  c441782ec8           vucomiss xmm9,xmm8
0x3cfe68ef90da  22da  77ec                 ja 0x3cfe68ef90c8  <+0x22c8>
0x3cfe68ef90dc  22dc  41beffffffff         movl r14,0xffffffff
0x3cfe68ef90e2  22e2  e914dfffff           jmp 0x3cfe68ef6ffb  <+0x1fb>
0x3cfe68ef90e7  22e7  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef90ef  22ef  4c8945d0             REX.W movq [rbp-0x30],r8
0x3cfe68ef90f3  22f3  48897db0             REX.W movq [rbp-0x50],rdi
0x3cfe68ef90f7  22f7  e8d453f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef90fc  22fc  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef9100  2300  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef9107  2307  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef910b  230b  8b7db0               movl rdi,[rbp-0x50]
0x3cfe68ef910e  230e  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef9116  2316  8b75a8               movl rsi,[rbp-0x58]
0x3cfe68ef9119  2319  8b4db8               movl rcx,[rbp-0x48]
0x3cfe68ef911c  231c  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef911f  231f  448b45d0             movl r8,[rbp-0x30]
0x3cfe68ef9123  2323  e922e0ffff           jmp 0x3cfe68ef714a  <+0x34a>
0x3cfe68ef9128  2328  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef9130  2330  48894db8             REX.W movq [rbp-0x48],rcx
0x3cfe68ef9134  2334  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef9138  2338  e89353f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef913d  233d  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef9141  2341  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef9148  2348  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef914c  234c  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef914f  234f  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef9157  2357  8b5da8               movl rbx,[rbp-0x58]
0x3cfe68ef915a  235a  8b4598               movl rax,[rbp-0x68]
0x3cfe68ef915d  235d  448b75b0             movl r14,[rbp-0x50]
0x3cfe68ef9161  2361  8b4db8               movl rcx,[rbp-0x48]
0x3cfe68ef9164  2364  e9e1e0ffff           jmp 0x3cfe68ef724a  <+0x44a>
0x3cfe68ef9169  2369  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef9171  2371  48894db0             REX.W movq [rbp-0x50],rcx
0x3cfe68ef9175  2375  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef9179  2379  e85253f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef917e  237e  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef9182  2382  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef9189  2389  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef918d  238d  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef9190  2390  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef9198  2398  8b5dc8               movl rbx,[rbp-0x38]
0x3cfe68ef919b  239b  8b45b8               movl rax,[rbp-0x48]
0x3cfe68ef919e  239e  448b7598             movl r14,[rbp-0x68]
0x3cfe68ef91a2  23a2  8b4db0               movl rcx,[rbp-0x50]
0x3cfe68ef91a5  23a5  e9a0e1ffff           jmp 0x3cfe68ef734a  <+0x54a>
0x3cfe68ef91aa  23aa  c5fb11ad70ffffff     vmovsd [rbp-0x90],xmm5
0x3cfe68ef91b2  23b2  48895da0             REX.W movq [rbp-0x60],rbx
0x3cfe68ef91b6  23b6  488955d0             REX.W movq [rbp-0x30],rdx
0x3cfe68ef91ba  23ba  e81153f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef91bf  23bf  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef91c3  23c3  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef91ca  23ca  8b55d0               movl rdx,[rbp-0x30]
0x3cfe68ef91cd  23cd  c5fb10ad70ffffff     vmovsd xmm5,[rbp-0x90]
0x3cfe68ef91d5  23d5  448b7dd8             movl r15,[rbp-0x28]
0x3cfe68ef91d9  23d9  8b45c8               movl rax,[rbp-0x38]
0x3cfe68ef91dc  23dc  448b75b8             movl r14,[rbp-0x48]
0x3cfe68ef91e0  23e0  8b5da0               movl rbx,[rbp-0x60]
0x3cfe68ef91e3  23e3  e962e2ffff           jmp 0x3cfe68ef744a  <+0x64a>
0x3cfe68ef91e8  23e8  48895dd0             REX.W movq [rbp-0x30],rbx
0x3cfe68ef91ec  23ec  e8df52f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef91f1  23f1  8b5dd0               movl rbx,[rbp-0x30]
0x3cfe68ef91f4  23f4  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x3cfe68ef91f8  23f8  8b55b0               movl rdx,[rbp-0x50]
0x3cfe68ef91fb  23fb  8b4da8               movl rcx,[rbp-0x58]
0x3cfe68ef91fe  23fe  8b75a0               movl rsi,[rbp-0x60]
0x3cfe68ef9201  2401  8b4598               movl rax,[rbp-0x68]
0x3cfe68ef9204  2404  c5c857f6             vxorps xmm6,xmm6,xmm6
0x3cfe68ef9208  2408  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x3cfe68ef920d  240d  c4c13972f019         vpslld xmm8,xmm8,25
0x3cfe68ef9213  2413  c4c13972d002         vpsrld xmm8,xmm8,2
0x3cfe68ef9219  2419  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef9221  2421  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef9229  2429  c5f810bdb0feffff     vmovups xmm7,[rbp-0x150]
0x3cfe68ef9231  2431  c5f81085a0feffff     vmovups xmm0,[rbp-0x160]
0x3cfe68ef9239  2439  c5f810ad90feffff     vmovups xmm5,[rbp-0x170]
0x3cfe68ef9241  2441  4533c9               xorl r9,r9
0x3cfe68ef9244  2444  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x3cfe68ef924b  244b  e9fae3ffff           jmp 0x3cfe68ef764a  <+0x84a>
0x3cfe68ef9250  2450  c5f92ef6             vucomisd xmm6,xmm6
0x3cfe68ef9254  2454  0f8b08000000         jpo 0x3cfe68ef9262  <+0x2462>
0x3cfe68ef925a  245a  4533db               xorl r11,r11
0x3cfe68ef925d  245d  e917e6ffff           jmp 0x3cfe68ef7879  <+0xa79>
0x3cfe68ef9262  2462  c5f82ee8             vucomiss xmm5,xmm0
0x3cfe68ef9266  2466  77f2                 ja 0x3cfe68ef925a  <+0x245a>
0x3cfe68ef9268  2468  41bbffffffff         movl r11,0xffffffff
0x3cfe68ef926e  246e  e906e6ffff           jmp 0x3cfe68ef7879  <+0xa79>
0x3cfe68ef9273  2473  c5f92eff             vucomisd xmm7,xmm7
0x3cfe68ef9277  2477  0f8b08000000         jpo 0x3cfe68ef9285  <+0x2485>
0x3cfe68ef927d  247d  4533db               xorl r11,r11
0x3cfe68ef9280  2480  e901e7ffff           jmp 0x3cfe68ef7986  <+0xb86>
0x3cfe68ef9285  2485  c5f82ee8             vucomiss xmm5,xmm0
0x3cfe68ef9289  2489  77f2                 ja 0x3cfe68ef927d  <+0x247d>
0x3cfe68ef928b  248b  41bbffffffff         movl r11,0xffffffff
0x3cfe68ef9291  2491  e9f0e6ffff           jmp 0x3cfe68ef7986  <+0xb86>
0x3cfe68ef9296  2496  e83552f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef929b  249b  4c8b65c0             REX.W movq r12,[rbp-0x40]
0x3cfe68ef929f  249f  c5d057ed             vxorps xmm5,xmm5,xmm5
0x3cfe68ef92a3  24a3  448b75c8             movl r14,[rbp-0x38]
0x3cfe68ef92a7  24a7  c5fb10bd50ffffff     vmovsd xmm7,[rbp-0xb0]
0x3cfe68ef92af  24af  c578108d30ffffff     vmovups xmm9,[rbp-0xd0]
0x3cfe68ef92b7  24b7  c4410976f6           vpcmpeqd xmm14,xmm14,xmm14
0x3cfe68ef92bc  24bc  c4c10972f619         vpslld xmm14,xmm14,25
0x3cfe68ef92c2  24c2  c4c10972d602         vpsrld xmm14,xmm14,2
0x3cfe68ef92c8  24c8  c5fb109518ffffff     vmovsd xmm2,[rbp-0xe8]
0x3cfe68ef92d0  24d0  c5fb108d10ffffff     vmovsd xmm1,[rbp-0xf0]
0x3cfe68ef92d8  24d8  c5fb10a508ffffff     vmovsd xmm4,[rbp-0xf8]
0x3cfe68ef92e0  24e0  c5fb109d00ffffff     vmovsd xmm3,[rbp-0x100]
0x3cfe68ef92e8  24e8  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x3cfe68ef92f0  24f0  c57810a5a0feffff     vmovups xmm12,[rbp-0x160]
0x3cfe68ef92f8  24f8  c578109d90feffff     vmovups xmm11,[rbp-0x170]
0x3cfe68ef9300  2500  c5f8108580feffff     vmovups xmm0,[rbp-0x180]
0x3cfe68ef9308  2508  c5f810b570feffff     vmovups xmm6,[rbp-0x190]
0x3cfe68ef9310  2510  8b8d60feffff         movl rcx,[rbp-0x1a0]
0x3cfe68ef9316  2516  8b8548feffff         movl rax,[rbp-0x1b8]
0x3cfe68ef931c  251c  4533ff               xorl r15,r15
0x3cfe68ef931f  251f  8b9508feffff         movl rdx,[rbp-0x1f8]
0x3cfe68ef9325  2525  8bbdd8fdffff         movl rdi,[rbp-0x228]
0x3cfe68ef932b  252b  448b85f0fdffff       movl r8,[rbp-0x210]
0x3cfe68ef9332  2532  448b8de8fdffff       movl r9,[rbp-0x218]
0x3cfe68ef9339  2539  448b9d10feffff       movl r11,[rbp-0x1f0]
0x3cfe68ef9340  2540  8b9dd0fdffff         movl rbx,[rbp-0x230]
0x3cfe68ef9346  2546  e9f2e7ffff           jmp 0x3cfe68ef7b3d  <+0xd3d>
0x3cfe68ef934b  254b  e88051f2ff           call 0x3cfe68e1e4d0  (jump table)
0x3cfe68ef9350  2550  448b8d30feffff       movl r9,[rbp-0x1d0]
0x3cfe68ef9357  2557  8b9d28feffff         movl rbx,[rbp-0x1d8]
0x3cfe68ef935d  255d  8b8d20feffff         movl rcx,[rbp-0x1e0]
0x3cfe68ef9363  2563  8b9518feffff         movl rdx,[rbp-0x1e8]
0x3cfe68ef9369  2569  e9eaebffff           jmp 0x3cfe68ef7f58  <+0x1158>
0x3cfe68ef936e  256e  e89d4ef2ff           call 0x3cfe68e1e210  (jump table)
0x3cfe68ef9373  2573  90                   nop

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
       c06         
       c0b         
       d64         
       d6c         
      120d         
      1221         
      12b2         
      12f0         
      12fa         
      130d         
      135b         
      136a         
      1374         
      1383         
      138e         
      139a         
      13ac         
      13b6         
      13c5         
      13da         
      13e4         
      13f2         
      13fc         
      1403         
      140d         
      1518         
      1542         
      154c         
      155f         
      159f         
      15aa         
      15b6         
      15bd         
      15c8         
      15d7         
      15e1         
      15ec         
      15fb         
      1605         
      1613         
      16e8         
      1705         
      1784         
      1790         
      17ef         
      17fe         
      1862         
      186f         
      18d0         
      18df         
      1943         
      1950         
      19b1         
      19c0         
      1a24         
      1a31         
      1a92         
      1aa1         
      1b05         
      1b12         
      1b73         
      1b82         
      1be6         
      1bf3         
      1c54         
      1c63         
      1cc8         
      1cd5         
      1d4f         
      1d5e         
      1d65         
      1d6f         
      1d79         
      1d80         
      1d87         
      1d91         
      1d9b         
      1da2         
      1db1         
      1f19         
      1f23         
      1f7b         
      1f85         
      1fe2         
      1fed         
      1ff7         
      2001         
      200b         
      2015         
      201f         
      2029         
      2033         
      2045         
      2078         
      2083         
      2089         
      20e4         
      20ea         
      20f8         
      20fe         
      210a         
      2110         
      211c         
      2122         

Source positions:
 pc offset  position
        41        74
        62       111
       112       180
       257       293
       25d       303
       265       307
       26a       314
       272       318
       27b       329
       280       334
       285       339
       28a       344
       28f       347
       2a9       361
       2c8       374
       2cd       381
       2d9       393
       2de       400
       354       442
       365       471
       393       500
       3a3       512
       3e7       528
       3ec       533
       3f4       544
       402       563
       40b       568
       410       575
       453       617
       462       646
       48c       675
       49c       687
       4da       703
       4df       708
       4e7       719
       4f4       738
       4fd       743
       502       750
       553       793
       562       822
       58c       851
       59c       863
       5da       879
       5df       884
       5e7       895
       5f4       914
       5fd       919
       602       926
       653       965
       662       994
       68c      1023
       69c      1035
       6d8      1051
       6dd      1056
       6e5      1067
       6f2      1080
       6f7      1087
       6fe      1097
       704      1101
       70b      1109
       711      1115
       718      1125
       71f      1129
       726      1137
       72d      1143
       732      1150
       737      1159
       73e      1163
       745      1169
       74a      1178
       74f      1185
       754      1192
       77d      1204
       782      1211
       787      1218
       79c      1241
       7a1      1248
       7a6      1255
       7ab      1262
       7b0      1269
       7b5      1276
       7c8      1293
       84a      1320
       85f      1332
       874      1344
       889      1356
       89e      1366
       8a7      1379
       8ad      1386
       8bd      1394
       8c3      1401
       8d3      1409
       8d9      1418
       8e9      1426
       8f6      1429
       901      1436
       908      1443
       90f      1450
       915      1457
       91e      1464
       92c      1487
       933      1493
       93b      1501
       94a      1509
       958      1526
       bfb      1793
       c0b      1800
       d64      1909
       d6c      1922
       fa7      2237
      1206      2320
      1221      2339
      12b2      2427
      12f0      2465
      12fa      2474
      130d      2489
      135b      2555
      136a      2563
      1374      2572
      1383      2586
      138e      2601
      139a      2608
      13ac      2621
      13b6      2632
      13c5      2640
      13da      2654
      13e4      2665
      13f2      2673
      13fc      2680
      1403      2690
      140d      2699
      1518      2876
      1542      2914
      154c      2923
      155f      2938
      159f      2994
      15aa      3009
      15b6      3016
      15bd      3024
      15c8      3035
      15d7      3043
      15e1      3052
      15ec      3063
      15fb      3071
      1605      3082
      1613      3090
      16e4      3178
      16fe      3193
      177e      3254
      1790      3262
      17ef      3306
      17fe      3321
      185c      3382
      186f      3390
      18d0      3434
      18df      3449
      193d      3510
      1950      3518
      19b1      3562
      19c0      3577
      1a1e      3638
      1a31      3646
      1a92      3690
      1aa1      3705
      1aff      3766
      1b12      3774
      1b73      3818
      1b82      3833
      1be0      3894
      1bf3      3902
      1c54      3944
      1c63      3959
      1cc2      4020
      1cd5      4028
      1d44      4076
      1d56      4083
      1d65      4088
      1d6f      4097
      1d79      4106
      1d80      4114
      1d87      4122
      1d91      4131
      1d9b      4140
      1da2      4148
      1da9      4158
      1f19      4688
      1f23      4697
      1f7b      4799
      1f85      4808
      1fe2      4913
      1fed      4924
      1ff7      4932
      2001      4940
      200b      4948
      2015      4956
      201f      4964
      2029      4972
      2033      4980
      203d      4990
      2078      5030
      2083      5037
      2089      5046
      2097      5074
      20dd      5101
      20ea      5104
      20f8      5114
      20fe      5117
      210a      5127
      2110      5130
      211c      5140
      2122      5143
      2271         0
      22e7       416
      2328       591
      2369       767
      23aa       939
      23e8      1312
      2496      1846
      254b      2213
      256e      1526

Safepoints (stack slots = 72, entries = 1, byte size = 23)
0x3cfe68ef70a9    2a9  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 67)
0x3cfe68ef70a5  internal wasm call
0x3cfe68ef71b8  internal wasm call
0x3cfe68ef72ac  internal wasm call
0x3cfe68ef73ac  internal wasm call
0x3cfe68ef74ad  internal wasm call
0x3cfe68ef77a3  external reference (0x193f2f0)
0x3cfe68ef7dd5  internal wasm call
0x3cfe68ef7e5e  internal wasm call
0x3cfe68ef7eea  internal wasm call
0x3cfe68ef7f80  internal wasm call
0x3cfe68ef8eb3  internal wasm call
0x3cfe68ef9072  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef90f8  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9139  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef917a  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef91bb  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef91ed  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef9297  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef934c  wasm stub call  (0x3cfe68e1e4d0)
0x3cfe68ef936f  wasm stub call  (0x3cfe68e1e210)
