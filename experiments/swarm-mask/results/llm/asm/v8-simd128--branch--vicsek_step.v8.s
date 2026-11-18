name: _RNvMs0_NtCskbGeSEnUfEA_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 5632 = 5592 + 40 padding)
Instructions (size = 5572)
0x1a0148a36980     0  55                   push rbp
0x1a0148a36981     1  4889e5               REX.W movq rbp,rsp
0x1a0148a36984     4  6a08                 push 0x8
0x1a0148a36986     6  56                   push rsi
0x1a0148a36987     7  4881ec50010000       REX.W subq rsp,0x150
0x1a0148a3698e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x1a0148a36992    12  48897dd8             REX.W movq [rbp-0x28],rdi
0x1a0148a36996    16  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a3699a    1a  0f86cb110000         jna 0x1a0148a37b6b  <+0x11eb>
0x1a0148a369a0    20  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x1a0148a369a4    24  458b18               movl r11,[r8]
0x1a0148a369a7    27  4183eb50             subl r11,0x50
0x1a0148a369ab    2b  458918               movl [r8],r11
0x1a0148a369ae    2e  448be0               movl r12,rax
0x1a0148a369b1    31  c4a17a108427ac000000 vmovss xmm0,[rdi+r12*1+0xac]
0x1a0148a369bb    3b  c4a17a109427a8000000 vmovss xmm2,[rdi+r12*1+0xa8]
0x1a0148a369c5    45  428b4c2708           movl rcx,[rdi+r12*1+0x8]
0x1a0148a369ca    4a  460fb6bc27b8000000   movzxbl r15,[rdi+r12*1+0xb8]
0x1a0148a369d3    53  4c8945e8             REX.W movq [rbp-0x18],r8
0x1a0148a369d7    57  4c895de0             REX.W movq [rbp-0x20],r11
0x1a0148a369db    5b  4c8965d0             REX.W movq [rbp-0x30],r12
0x1a0148a369df    5f  c5fb1145c0           vmovsd [rbp-0x40],xmm0
0x1a0148a369e4    64  c5fb119528ffffff     vmovsd [rbp-0xd8],xmm2
0x1a0148a369ec    6c  48894dc8             REX.W movq [rbp-0x38],rcx
0x1a0148a369f0    70  4280bc27b800000000   cmpb [rdi+r12*1+0xb8],0x0
0x1a0148a369f9    79  0f8534010000         jnz 0x1a0148a36b33  <+0x1b3>
0x1a0148a369ff    7f  41ba0020803f         movl r10,0x3f802000
0x1a0148a36a05    85  c4c1796eda           vmovd xmm3,r10
0x1a0148a36a0a    8a  c5e259d8             vmulss xmm3,xmm3,xmm0
0x1a0148a36a0e    8e  c5ea5edb             vdivss xmm3,xmm2,xmm3
0x1a0148a36a12    92  c5f828db             vmovaps xmm3,xmm3
0x1a0148a36a16    96  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x1a0148a36a1c    9c  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1a0148a36a20    a0  c5f82edc             vucomiss xmm3,xmm4
0x1a0148a36a24    a4  0f8308000000         jnc 0x1a0148a36a32  <+0xb2>
0x1a0148a36a2a    aa  4533ff               xorl r15,r15
0x1a0148a36a2d    ad  e908010000           jmp 0x1a0148a36b3a  <+0x1ba>
0x1a0148a36a32    b2  41ba0000804f         movl r10,0x4f800000
0x1a0148a36a38    b8  c4c1796eea           vmovd xmm5,r10
0x1a0148a36a3d    bd  c5f82eeb             vucomiss xmm5,xmm3
0x1a0148a36a41    c1  0f8708000000         ja 0x1a0148a36a4f  <+0xcf>
0x1a0148a36a47    c7  4533ff               xorl r15,r15
0x1a0148a36a4a    ca  e9eb000000           jmp 0x1a0148a36b3a  <+0x1ba>
0x1a0148a36a4f    cf  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x1a0148a36a53    d3  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x1a0148a36a59    d9  c57b2cfe             vcvttsd2si r15,xmm6
0x1a0148a36a5d    dd  4585ff               testl r15,r15
0x1a0148a36a60    e0  0f892a000000         jns 0x1a0148a36a90  <+0x110>
0x1a0148a36a66    e6  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x1a0148a36a70    f0  c441f96efa           vmovq xmm15,r10
0x1a0148a36a75    f5  c50358fe             vaddsd xmm15,xmm15,xmm6
0x1a0148a36a79    f9  c4417b2cff           vcvttsd2si r15,xmm15
0x1a0148a36a7e    fe  4585ff               testl r15,r15
0x1a0148a36a81   101  0f8809000000         js 0x1a0148a36a90  <+0x110>
0x1a0148a36a87   107  41ba00000080         movl r10,0x80000000
0x1a0148a36a8d   10d  450bfa               orl r15,r10
0x1a0148a36a90   110  458bd7               movl r10,r15
0x1a0148a36a93   113  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x1a0148a36a98   118  c5f92efe             vucomisd xmm7,xmm6
0x1a0148a36a9c   11c  0f8ae2100000         jpe 0x1a0148a37b84  <+0x1204>
0x1a0148a36aa2   122  0f85dc100000         jnz 0x1a0148a37b84  <+0x1204>
0x1a0148a36aa8   128  4183ff03             cmpl r15,0x3
0x1a0148a36aac   12c  7299                 jc 0x1a0148a36a47  <+0xc7>
0x1a0148a36aae   12e  468b4c2714           movl r9,[rdi+r12*1+0x14]
0x1a0148a36ab3   133  428b5c2710           movl rbx,[rdi+r12*1+0x10]
0x1a0148a36ab8   138  428b542704           movl rdx,[rdi+r12*1+0x4]
0x1a0148a36abd   13d  41be00040000         movl r14,0x400
0x1a0148a36ac3   143  4181ff00040000       cmpl r15,0x400
0x1a0148a36aca   14a  450f42f7             cmovcl r14,r15
0x1a0148a36ace   14e  4689b4278c000000     movl [rdi+r12*1+0x8c],r14
0x1a0148a36ad6   156  4689b42788000000     movl [rdi+r12*1+0x88],r14
0x1a0148a36ade   15e  458bd6               movl r10,r14
0x1a0148a36ae1   161  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0x1a0148a36ae6   166  c5e25eda             vdivss xmm3,xmm3,xmm2
0x1a0148a36aea   16a  c5f828db             vmovaps xmm3,xmm3
0x1a0148a36aee   16e  c4a17a119c2784000000 vmovss [rdi+r12*1+0x84],xmm3
0x1a0148a36af8   178  83c060               addl rax,0x60
0x1a0148a36afb   17b  e8f871edff           call 0x1a014890dcf8  (jump table)
0x1a0148a36b00   180  c5fb1045c0           vmovsd xmm0,[rbp-0x40]
0x1a0148a36b05   185  41bf01000000         movl r15,0x1
0x1a0148a36b0b   18b  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x1a0148a36b0f   18f  448b5de0             movl r11,[rbp-0x20]
0x1a0148a36b13   193  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a36b17   197  4c8b65d0             REX.W movq r12,[rbp-0x30]
0x1a0148a36b1b   19b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a36b1f   19f  8b4dc8               movl rcx,[rbp-0x38]
0x1a0148a36b22   1a2  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1a0148a36b26   1a6  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0x1a0148a36b2e   1ae  e907000000           jmp 0x1a0148a36b3a  <+0x1ba>
0x1a0148a36b33   1b3  4533ff               xorl r15,r15
0x1a0148a36b36   1b6  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1a0148a36b3a   1ba  4c89bdd8feffff       REX.W movq [rbp-0x128],r15
0x1a0148a36b41   1c1  85c9                 testl rcx,rcx
0x1a0148a36b43   1c3  0f84ae0f0000         jz 0x1a0148a37af7  <+0x1177>
0x1a0148a36b49   1c9  468b74275c           movl r14,[rdi+r12*1+0x5c]
0x1a0148a36b4e   1ce  428b442750           movl rax,[rdi+r12*1+0x50]
0x1a0148a36b53   1d3  428b5c2744           movl rbx,[rdi+r12*1+0x44]
0x1a0148a36b58   1d8  428b542738           movl rdx,[rdi+r12*1+0x38]
0x1a0148a36b5d   1dd  448bca               movl r9,rdx
0x1a0148a36b60   1e0  3bda                 cmpl rbx,rdx
0x1a0148a36b62   1e2  440f42cb             cmovcl r9,rbx
0x1a0148a36b66   1e6  418bd9               movl rbx,r9
0x1a0148a36b69   1e9  413bc1               cmpl rax,r9
0x1a0148a36b6c   1ec  0f42d8               cmovcl rbx,rax
0x1a0148a36b6f   1ef  448bcb               movl r9,rbx
0x1a0148a36b72   1f2  443bf3               cmpl r14,rbx
0x1a0148a36b75   1f5  450f42ce             cmovcl r9,r14
0x1a0148a36b79   1f9  41ba000000bf         movl r10,0xbf000000
0x1a0148a36b7f   1ff  c4c1796eda           vmovd xmm3,r10
0x1a0148a36b84   204  c5e259da             vmulss xmm3,xmm3,xmm2
0x1a0148a36b88   208  c5d176ed             vpcmpeqd xmm5,xmm5,xmm5
0x1a0148a36b8c   20c  c5d172f51a           vpslld xmm5,xmm5,26
0x1a0148a36b91   211  c5d172d502           vpsrld xmm5,xmm5,2
0x1a0148a36b96   216  c5d259ea             vmulss xmm5,xmm5,xmm2
0x1a0148a36b9a   21a  468b742758           movl r14,[rdi+r12*1+0x58]
0x1a0148a36b9f   21f  428b5c274c           movl rbx,[rdi+r12*1+0x4c]
0x1a0148a36ba4   224  428b442740           movl rax,[rdi+r12*1+0x40]
0x1a0148a36ba9   229  428b542734           movl rdx,[rdi+r12*1+0x34]
0x1a0148a36bae   22e  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x1a0148a36bb2   232  4c894d88             REX.W movq [rbp-0x78],r9
0x1a0148a36bb6   236  c5fb119d20ffffff     vmovsd [rbp-0xe0],xmm3
0x1a0148a36bbe   23e  c5fb11ad18ffffff     vmovsd [rbp-0xe8],xmm5
0x1a0148a36bc6   246  4c8975a8             REX.W movq [rbp-0x58],r14
0x1a0148a36bca   24a  48895da0             REX.W movq [rbp-0x60],rbx
0x1a0148a36bce   24e  48894598             REX.W movq [rbp-0x68],rax
0x1a0148a36bd2   252  48895590             REX.W movq [rbp-0x70],rdx
0x1a0148a36bd6   256  c5fb118530ffffff     vmovsd [rbp-0xd0],xmm0
0x1a0148a36bde   25e  4533db               xorl r11,r11
0x1a0148a36be1   261  c57928fa             vmovapd xmm15,xmm2
0x1a0148a36be5   265  c5f928d4             vmovapd xmm2,xmm4
0x1a0148a36be9   269  c4c17928e7           vmovapd xmm4,xmm15
0x1a0148a36bee   26e  660f1f840000000000   nop
0x1a0148a36bf7   277  660f1f840000000000   nop
0x1a0148a36c00   280  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a36c04   284  0f869d0f0000         jna 0x1a0148a37ba7  <+0x1227>
0x1a0148a36c0a   28a  468b742708           movl r14,[rdi+r12*1+0x8]
0x1a0148a36c0f   28f  4c89b5c0feffff       REX.W movq [rbp-0x140],r14
0x1a0148a36c16   296  453bf3               cmpl r14,r11
0x1a0148a36c19   299  0f86880e0000         jna 0x1a0148a37aa7  <+0x1127>
0x1a0148a36c1f   29f  428b5c2714           movl rbx,[rdi+r12*1+0x14]
0x1a0148a36c24   2a4  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x1a0148a36c2b   2ab  413bdb               cmpl rbx,r11
0x1a0148a36c2e   2ae  0f86730e0000         jna 0x1a0148a37aa7  <+0x1127>
0x1a0148a36c34   2b4  428b742720           movl rsi,[rdi+r12*1+0x20]
0x1a0148a36c39   2b9  488975b0             REX.W movq [rbp-0x50],rsi
0x1a0148a36c3d   2bd  413bf3               cmpl rsi,r11
0x1a0148a36c40   2c0  0f86610e0000         jna 0x1a0148a37aa7  <+0x1127>
0x1a0148a36c46   2c6  468b4c272c           movl r9,[rdi+r12*1+0x2c]
0x1a0148a36c4b   2cb  4c894db8             REX.W movq [rbp-0x48],r9
0x1a0148a36c4f   2cf  453bcb               cmpl r9,r11
0x1a0148a36c52   2d2  0f864f0e0000         jna 0x1a0148a37aa7  <+0x1127>
0x1a0148a36c58   2d8  468b442704           movl r8,[rdi+r12*1+0x4]
0x1a0148a36c5d   2dd  438d0498             leal rax,[r8+r11*4]
0x1a0148a36c61   2e1  c5fa103407           vmovss xmm6,[rdi+rax*1]
0x1a0148a36c66   2e6  428b442728           movl rax,[rdi+r12*1+0x28]
0x1a0148a36c6b   2eb  428d1498             leal rdx,[rax+r11*4]
0x1a0148a36c6f   2ef  c5fa103c17           vmovss xmm7,[rdi+rdx*1]
0x1a0148a36c74   2f4  428b54271c           movl rdx,[rdi+r12*1+0x1c]
0x1a0148a36c79   2f9  4c898510ffffff       REX.W movq [rbp-0xf0],r8
0x1a0148a36c80   300  468d049a             leal r8,[rdx+r11*4]
0x1a0148a36c84   304  c4217a100407         vmovss xmm8,[rdi+r8*1]
0x1a0148a36c8a   30a  468b442710           movl r8,[rdi+r12*1+0x10]
0x1a0148a36c8f   30f  478d2498             leal r12,[r8+r11*4]
0x1a0148a36c93   313  c4217a100c27         vmovss xmm9,[rdi+r12*1]
0x1a0148a36c99   319  4c895dc0             REX.W movq [rbp-0x40],r11
0x1a0148a36c9d   31d  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0x1a0148a36ca5   325  488985f8feffff       REX.W movq [rbp-0x108],rax
0x1a0148a36cac   32c  c5fb11bd78ffffff     vmovsd [rbp-0x88],xmm7
0x1a0148a36cb4   334  48899500ffffff       REX.W movq [rbp-0x100],rdx
0x1a0148a36cbb   33b  c57b118568ffffff     vmovsd [rbp-0x98],xmm8
0x1a0148a36cc3   343  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0x1a0148a36cca   34a  c57b114d80           vmovsd [rbp-0x80],xmm9
0x1a0148a36ccf   34f  83bdd8feffff00       cmpl [rbp-0x128],0x0
0x1a0148a36cd6   356  0f85aa010000         jnz 0x1a0148a36e86  <+0x506>
0x1a0148a36cdc   35c  448be3               movl r12,rbx
0x1a0148a36cdf   35f  443bf3               cmpl r14,rbx
0x1a0148a36ce2   362  450f42e6             cmovcl r12,r14
0x1a0148a36ce6   366  458bf1               movl r14,r9
0x1a0148a36ce9   369  413bf1               cmpl rsi,r9
0x1a0148a36cec   36c  440f42f6             cmovcl r14,rsi
0x1a0148a36cf0   370  418bde               movl rbx,r14
0x1a0148a36cf3   373  453be6               cmpl r12,r14
0x1a0148a36cf6   376  410f42dc             cmovcl rbx,r12
0x1a0148a36cfa   37a  c57928d2             vmovapd xmm10,xmm2
0x1a0148a36cfe   37e  c57928da             vmovapd xmm11,xmm2
0x1a0148a36d02   382  4531e4               xorl r12,r12
0x1a0148a36d05   385  448bb510ffffff       movl r14,[rbp-0xf0]
0x1a0148a36d0c   38c  e936000000           jmp 0x1a0148a36d47  <+0x3c7>
0x1a0148a36d11   391  660f1f840000000000   nop
0x1a0148a36d1a   39a  660f1f840000000000   nop
0x1a0148a36d23   3a3  660f1f840000000000   nop
0x1a0148a36d2c   3ac  660f1f840000000000   nop
0x1a0148a36d35   3b5  660f1f840000000000   nop
0x1a0148a36d3e   3be  6690                 nop
0x1a0148a36d40   3c0  458be1               movl r12,r9
0x1a0148a36d43   3c3  c57928d9             vmovapd xmm11,xmm1
0x1a0148a36d47   3c7  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a36d4b   3cb  0f868c0e0000         jna 0x1a0148a37bdd  <+0x125d>
0x1a0148a36d51   3d1  33f6                 xorl rsi,rsi
0x1a0148a36d53   3d3  4439e3               cmpl rbx,r12
0x1a0148a36d56   3d6  400f96c6             setnal sil
0x1a0148a36d5a   3da  4589e1               movl r9,r12
0x1a0148a36d5d   3dd  660f1f840000000000   nop
0x1a0148a36d66   3e6  660f1f840000000000   nop
0x1a0148a36d6f   3ef  660f1f840000000000   nop
0x1a0148a36d78   3f8  0f1f840000000000     nop
0x1a0148a36d80   400  4183c101             addl r9,0x1
0x1a0148a36d84   404  85f6                 testl rsi,rsi
0x1a0148a36d86   406  0f843f000000         jz 0x1a0148a36dcb  <+0x44b>
0x1a0148a36d8c   40c  443b4dc8             cmpl r9,[rbp-0x38]
0x1a0148a36d90   410  0f836c0a0000         jnc 0x1a0148a37802  <+0xe82>
0x1a0148a36d96   416  4183c101             addl r9,0x1
0x1a0148a36d9a   41a  443b4dc8             cmpl r9,[rbp-0x38]
0x1a0148a36d9e   41e  0f835e0a0000         jnc 0x1a0148a37802  <+0xe82>
0x1a0148a36da4   424  4183c101             addl r9,0x1
0x1a0148a36da8   428  443b4dc8             cmpl r9,[rbp-0x38]
0x1a0148a36dac   42c  0f83500a0000         jnc 0x1a0148a37802  <+0xe82>
0x1a0148a36db2   432  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a36db6   436  0f86b10e0000         jna 0x1a0148a37c6d  <+0x12ed>
0x1a0148a36dbc   43c  4183c101             addl r9,0x1
0x1a0148a36dc0   440  443b4dc8             cmpl r9,[rbp-0x38]
0x1a0148a36dc4   444  72ba                 jc 0x1a0148a36d80  <+0x400>
0x1a0148a36dc6   446  e9370a0000           jmp 0x1a0148a37802  <+0xe82>
0x1a0148a36dcb   44b  428d34a0             leal rsi,[rax+r12*4]
0x1a0148a36dcf   44f  468d1ca2             leal r11,[rdx+r12*4]
0x1a0148a36dd3   453  478d3ca0             leal r15,[r8+r12*4]
0x1a0148a36dd7   457  c4217a10243f         vmovss xmm12,[rdi+r15*1]
0x1a0148a36ddd   45d  478d24a6             leal r12,[r14+r12*4]
0x1a0148a36de1   461  c4214a5c2c27         vsubss xmm13,xmm6,[rdi+r12*1]
0x1a0148a36de7   467  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0x1a0148a36def   46f  0f8715000000         ja 0x1a0148a36e0a  <+0x48a>
0x1a0148a36df5   475  c4c1782edd           vucomiss xmm3,xmm13
0x1a0148a36dfa   47a  0f860e000000         jna 0x1a0148a36e0e  <+0x48e>
0x1a0148a36e00   480  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x1a0148a36e05   485  e904000000           jmp 0x1a0148a36e0e  <+0x48e>
0x1a0148a36e0a   48a  c5125cec             vsubss xmm13,xmm13,xmm4
0x1a0148a36e0e   48e  c57a103437           vmovss xmm14,[rdi+rsi*1]
0x1a0148a36e13   493  c4a17a100c1f         vmovss xmm1,[rdi+r11*1]
0x1a0148a36e19   499  c441325ce4           vsubss xmm12,xmm9,xmm12
0x1a0148a36e1e   49e  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0x1a0148a36e26   4a6  0f8715000000         ja 0x1a0148a36e41  <+0x4c1>
0x1a0148a36e2c   4ac  c4c1782edc           vucomiss xmm3,xmm12
0x1a0148a36e31   4b1  0f860e000000         jna 0x1a0148a36e45  <+0x4c5>
0x1a0148a36e37   4b7  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x1a0148a36e3c   4bc  e904000000           jmp 0x1a0148a36e45  <+0x4c5>
0x1a0148a36e41   4c1  c51a5ce4             vsubss xmm12,xmm12,xmm4
0x1a0148a36e45   4c5  c4c17258cb           vaddss xmm1,xmm1,xmm11
0x1a0148a36e4a   4ca  c4411259ed           vmulss xmm13,xmm13,xmm13
0x1a0148a36e4f   4cf  c4411a59e4           vmulss xmm12,xmm12,xmm12
0x1a0148a36e54   4d4  c4411a58e5           vaddss xmm12,xmm12,xmm13
0x1a0148a36e59   4d9  c4c1782ec4           vucomiss xmm0,xmm12
0x1a0148a36e5e   4de  0f870a000000         ja 0x1a0148a36e6e  <+0x4ee>
0x1a0148a36e64   4e4  c4c17928cb           vmovapd xmm1,xmm11
0x1a0148a36e69   4e9  e905000000           jmp 0x1a0148a36e73  <+0x4f3>
0x1a0148a36e6e   4ee  c4410a58d2           vaddss xmm10,xmm14,xmm10
0x1a0148a36e73   4f3  443b4dc8             cmpl r9,[rbp-0x38]
0x1a0148a36e77   4f7  0f82c3feffff         jc 0x1a0148a36d40  <+0x3c0>
0x1a0148a36e7d   4fd  c57928d9             vmovapd xmm11,xmm1
0x1a0148a36e81   501  e97c090000           jmp 0x1a0148a37802  <+0xe82>
0x1a0148a36e86   506  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x1a0148a36e8a   50a  468b9c3f8c000000     movl r11,[rdi+r15*1+0x8c]
0x1a0148a36e92   512  33c9                 xorl rcx,rcx
0x1a0148a36e94   514  4585db               testl r11,r11
0x1a0148a36e97   517  0f94c1               setzl cl
0x1a0148a36e9a   51a  448ba510ffffff       movl r12,[rbp-0xf0]
0x1a0148a36ea1   521  4585db               testl r11,r11
0x1a0148a36ea4   524  0f84130c0000         jz 0x1a0148a37abd  <+0x113d>
0x1a0148a36eaa   52a  468ba43f88000000     movl r12,[rdi+r15*1+0x88]
0x1a0148a36eb2   532  4533c0               xorl r8,r8
0x1a0148a36eb5   535  4585e4               testl r12,r12
0x1a0148a36eb8   538  410f94c0             setzl r8l
0x1a0148a36ebc   53c  4c89a5c8feffff       REX.W movq [rbp-0x138],r12
0x1a0148a36ec3   543  4585e4               testl r12,r12
0x1a0148a36ec6   546  0f840a0c0000         jz 0x1a0148a37ad6  <+0x1156>
0x1a0148a36ecc   54c  428b743f64           movl rsi,[rdi+r15*1+0x64]
0x1a0148a36ed1   551  85c9                 testl rcx,rcx
0x1a0148a36ed3   553  0f94c1               setzl cl
0x1a0148a36ed6   556  0fb6c9               movzxbl rcx,rcx
0x1a0148a36ed9   559  458bcb               movl r9,r11
0x1a0148a36edc   55c  442bc9               subl r9,rcx
0x1a0148a36edf   55f  c4217a10943f84000000 vmovss xmm10,[rdi+r15*1+0x84]
0x1a0148a36ee9   569  c4413259da           vmulss xmm11,xmm9,xmm10
0x1a0148a36eee   56e  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0x1a0148a36ef4   574  c441782edb           vucomiss xmm11,xmm11
0x1a0148a36ef9   579  7a06                 jpe 0x1a0148a36f01  <+0x581>
0x1a0148a36efb   57b  0f8404000000         jz 0x1a0148a36f05  <+0x585>
0x1a0148a36f01   581  c57928da             vmovapd xmm11,xmm2
0x1a0148a36f05   585  c5782eda             vucomiss xmm11,xmm2
0x1a0148a36f09   589  0f8704000000         ja 0x1a0148a36f13  <+0x593>
0x1a0148a36f0f   58f  c57928da             vmovapd xmm11,xmm2
0x1a0148a36f13   593  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0x1a0148a36f18   598  c443110bec0b         vroundsd xmm13,xmm13,xmm12,0xb
0x1a0148a36f1e   59e  c4c17b2ccd           vcvttsd2si rcx,xmm13
0x1a0148a36f23   5a3  85c9                 testl rcx,rcx
0x1a0148a36f25   5a5  0f8927000000         jns 0x1a0148a36f52  <+0x5d2>
0x1a0148a36f2b   5ab  4c8b1536fbffff       REX.W movq r10,[rip+0xfffffb36]
0x1a0148a36f32   5b2  c441f96efa           vmovq xmm15,r10
0x1a0148a36f37   5b7  c4410358fd           vaddsd xmm15,xmm15,xmm13
0x1a0148a36f3c   5bc  c4c17b2ccf           vcvttsd2si rcx,xmm15
0x1a0148a36f41   5c1  85c9                 testl rcx,rcx
0x1a0148a36f43   5c3  0f8809000000         js 0x1a0148a36f52  <+0x5d2>
0x1a0148a36f49   5c9  41ba00000080         movl r10,0x80000000
0x1a0148a36f4f   5cf  410bca               orl rcx,r10
0x1a0148a36f52   5d2  448bd1               movl r10,rcx
0x1a0148a36f55   5d5  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0x1a0148a36f5a   5da  c441792ef5           vucomisd xmm14,xmm13
0x1a0148a36f5f   5df  0f8ab40d0000         jpe 0x1a0148a37d19  <+0x1399>
0x1a0148a36f65   5e5  0f85ae0d0000         jnz 0x1a0148a37d19  <+0x1399>
0x1a0148a36f6b   5eb  448bf1               movl r14,rcx
0x1a0148a36f6e   5ee  443bc9               cmpl r9,rcx
0x1a0148a36f71   5f1  450f42f1             cmovcl r14,r9
0x1a0148a36f75   5f5  41ba0000804f         movl r10,0x4f800000
0x1a0148a36f7b   5fb  c441796ee2           vmovd xmm12,r10
0x1a0148a36f80   600  33c9                 xorl rcx,rcx
0x1a0148a36f82   602  c441782ee3           vucomiss xmm12,xmm11
0x1a0148a36f87   607  410f47ce             cmoval rcx,r14
0x1a0148a36f8b   60b  458d340b             leal r14,[r11+rcx*1]
0x1a0148a36f8f   60f  418d4eff             leal rcx,[r14-0x1]
0x1a0148a36f93   613  448bd1               movl r10,rcx
0x1a0148a36f96   616  8bc8                 movl rcx,rax
0x1a0148a36f98   618  418bc2               movl rax,r10
0x1a0148a36f9b   61b  448bca               movl r9,rdx
0x1a0148a36f9e   61e  33d2                 xorl rdx,rdx
0x1a0148a36fa0   620  41f7f3               divl r11
0x1a0148a36fa3   623  410fafd4             imull rdx,r12
0x1a0148a36fa7   627  4585c0               testl r8,r8
0x1a0148a36faa   62a  410f94c0             setzl r8l
0x1a0148a36fae   62e  450fb6c0             movzxbl r8,r8
0x1a0148a36fb2   632  4489e0               movl rax,r12
0x1a0148a36fb5   635  412bc0               subl rax,r8
0x1a0148a36fb8   638  c52a59d6             vmulss xmm10,xmm10,xmm6
0x1a0148a36fbc   63c  c443290ad209         vroundss xmm10,xmm10,xmm10,0x9
0x1a0148a36fc2   642  4c89b558ffffff       REX.W movq [rbp-0xa8],r14
0x1a0148a36fc9   649  c441782ed2           vucomiss xmm10,xmm10
0x1a0148a36fce   64e  7a06                 jpe 0x1a0148a36fd6  <+0x656>
0x1a0148a36fd0   650  0f8404000000         jz 0x1a0148a36fda  <+0x65a>
0x1a0148a36fd6   656  c57928d2             vmovapd xmm10,xmm2
0x1a0148a36fda   65a  c5782ed2             vucomiss xmm10,xmm2
0x1a0148a36fde   65e  0f8704000000         ja 0x1a0148a36fe8  <+0x668>
0x1a0148a36fe4   664  c57928d2             vmovapd xmm10,xmm2
0x1a0148a36fe8   668  c4412a5ada           vcvtss2sd xmm11,xmm10,xmm10
0x1a0148a36fed   66d  c443110beb0b         vroundsd xmm13,xmm13,xmm11,0xb
0x1a0148a36ff3   673  c4417b2cc5           vcvttsd2si r8,xmm13
0x1a0148a36ff8   678  4585c0               testl r8,r8
0x1a0148a36ffb   67b  0f8928000000         jns 0x1a0148a37029  <+0x6a9>
0x1a0148a37001   681  4c8b1560faffff       REX.W movq r10,[rip+0xfffffa60]
0x1a0148a37008   688  c441f96efa           vmovq xmm15,r10
0x1a0148a3700d   68d  c4410358fd           vaddsd xmm15,xmm15,xmm13
0x1a0148a37012   692  c4417b2cc7           vcvttsd2si r8,xmm15
0x1a0148a37017   697  4585c0               testl r8,r8
0x1a0148a3701a   69a  0f8809000000         js 0x1a0148a37029  <+0x6a9>
0x1a0148a37020   6a0  41ba00000080         movl r10,0x80000000
0x1a0148a37026   6a6  450bc2               orl r8,r10
0x1a0148a37029   6a9  458bd0               movl r10,r8
0x1a0148a3702c   6ac  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0x1a0148a37031   6b1  c441792ef5           vucomisd xmm14,xmm13
0x1a0148a37036   6b6  0f8a000d0000         jpe 0x1a0148a37d3c  <+0x13bc>
0x1a0148a3703c   6bc  0f85fa0c0000         jnz 0x1a0148a37d3c  <+0x13bc>
0x1a0148a37042   6c2  458bc8               movl r9,r8
0x1a0148a37045   6c5  413bc0               cmpl rax,r8
0x1a0148a37048   6c8  440f42c8             cmovcl r9,rax
0x1a0148a3704c   6cc  4533c0               xorl r8,r8
0x1a0148a3704f   6cf  c441782ee2           vucomiss xmm12,xmm10
0x1a0148a37054   6d4  450f47c1             cmoval r8,r9
0x1a0148a37058   6d8  4501e0               addl r8,r12
0x1a0148a3705b   6db  418d40ff             leal rax,[r8-0x1]
0x1a0148a3705f   6df  448bca               movl r9,rdx
0x1a0148a37062   6e2  33d2                 xorl rdx,rdx
0x1a0148a37064   6e4  41f7f4               divl r12
0x1a0148a37067   6e7  428d040a             leal rax,[rdx+r9*1]
0x1a0148a3706b   6eb  428b4c3f68           movl rcx,[rdi+r15*1+0x68]
0x1a0148a37070   6f0  48899550ffffff       REX.W movq [rbp-0xb0],rdx
0x1a0148a37077   6f7  3bc1                 cmpl rax,rcx
0x1a0148a37079   6f9  0f8209000000         jc 0x1a0148a37088  <+0x708>
0x1a0148a3707f   6ff  33c0                 xorl rax,rax
0x1a0148a37081   701  8bd8                 movl rbx,rax
0x1a0148a37083   703  e94b000000           jmp 0x1a0148a370d3  <+0x753>
0x1a0148a37088   708  8d5801               leal rbx,[rax+0x1]
0x1a0148a3708b   70b  3bcb                 cmpl rcx,rbx
0x1a0148a3708d   70d  76f0                 jna 0x1a0148a3707f  <+0x6ff>
0x1a0148a3708f   70f  8d1c9e               leal rbx,[rsi+rbx*4]
0x1a0148a37092   712  8b1c1f               movl rbx,[rdi+rbx*1]
0x1a0148a37095   715  8d0486               leal rax,[rsi+rax*4]
0x1a0148a37098   718  8b0407               movl rax,[rdi+rax*1]
0x1a0148a3709b   71b  3bd8                 cmpl rbx,rax
0x1a0148a3709d   71d  0f8223000000         jc 0x1a0148a370c6  <+0x746>
0x1a0148a370a3   723  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x1a0148a370ab   72b  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0x1a0148a370b3   733  0f831a000000         jnc 0x1a0148a370d3  <+0x753>
0x1a0148a370b9   739  41be04000000         movl r14,0x4
0x1a0148a370bf   73f  33db                 xorl rbx,rbx
0x1a0148a370c1   741  e918000000           jmp 0x1a0148a370de  <+0x75e>
0x1a0148a370c6   746  33db                 xorl rbx,rbx
0x1a0148a370c8   748  41be04000000         movl r14,0x4
0x1a0148a370ce   74e  e90b000000           jmp 0x1a0148a370de  <+0x75e>
0x1a0148a370d3   753  2bd8                 subl rbx,rax
0x1a0148a370d5   755  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x1a0148a370da   75a  458d3486             leal r14,[r14+rax*4]
0x1a0148a370de   75e  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0x1a0148a370e5   765  448bf2               movl r14,rdx
0x1a0148a370e8   768  418bc0               movl rax,r8
0x1a0148a370eb   76b  33d2                 xorl rdx,rdx
0x1a0148a370ed   76d  41f7f4               divl r12
0x1a0148a370f0   770  418d0411             leal rax,[r9+rdx*1]
0x1a0148a370f4   774  48899db0feffff       REX.W movq [rbp-0x150],rbx
0x1a0148a370fb   77b  3bc1                 cmpl rax,rcx
0x1a0148a370fd   77d  0f8209000000         jc 0x1a0148a3710c  <+0x78c>
0x1a0148a37103   783  33c0                 xorl rax,rax
0x1a0148a37105   785  8bd8                 movl rbx,rax
0x1a0148a37107   787  e94b000000           jmp 0x1a0148a37157  <+0x7d7>
0x1a0148a3710c   78c  8d5801               leal rbx,[rax+0x1]
0x1a0148a3710f   78f  3bcb                 cmpl rcx,rbx
0x1a0148a37111   791  76f0                 jna 0x1a0148a37103  <+0x783>
0x1a0148a37113   793  8d1c9e               leal rbx,[rsi+rbx*4]
0x1a0148a37116   796  8b1c1f               movl rbx,[rdi+rbx*1]
0x1a0148a37119   799  8d0486               leal rax,[rsi+rax*4]
0x1a0148a3711c   79c  8b0407               movl rax,[rdi+rax*1]
0x1a0148a3711f   79f  3bd8                 cmpl rbx,rax
0x1a0148a37121   7a1  0f8223000000         jc 0x1a0148a3714a  <+0x7ca>
0x1a0148a37127   7a7  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x1a0148a3712f   7af  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0x1a0148a37137   7b7  0f831a000000         jnc 0x1a0148a37157  <+0x7d7>
0x1a0148a3713d   7bd  41be04000000         movl r14,0x4
0x1a0148a37143   7c3  33db                 xorl rbx,rbx
0x1a0148a37145   7c5  e918000000           jmp 0x1a0148a37162  <+0x7e2>
0x1a0148a3714a   7ca  33db                 xorl rbx,rbx
0x1a0148a3714c   7cc  41be04000000         movl r14,0x4
0x1a0148a37152   7d2  e90b000000           jmp 0x1a0148a37162  <+0x7e2>
0x1a0148a37157   7d7  2bd8                 subl rbx,rax
0x1a0148a37159   7d9  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x1a0148a3715e   7de  458d3486             leal r14,[r14+rax*4]
0x1a0148a37162   7e2  418d4001             leal rax,[r8+0x1]
0x1a0148a37166   7e6  448bc2               movl r8,rdx
0x1a0148a37169   7e9  33d2                 xorl rdx,rdx
0x1a0148a3716b   7eb  41f7f4               divl r12
0x1a0148a3716e   7ee  418d0411             leal rax,[r9+rdx*1]
0x1a0148a37172   7f2  4c89b5a8feffff       REX.W movq [rbp-0x158],r14
0x1a0148a37179   7f9  48899da0feffff       REX.W movq [rbp-0x160],rbx
0x1a0148a37180   800  3bc1                 cmpl rax,rcx
0x1a0148a37182   802  0f820a000000         jc 0x1a0148a37192  <+0x812>
0x1a0148a37188   808  33c0                 xorl rax,rax
0x1a0148a3718a   80a  448bc8               movl r9,rax
0x1a0148a3718d   80d  e952000000           jmp 0x1a0148a371e4  <+0x864>
0x1a0148a37192   812  448d4801             leal r9,[rax+0x1]
0x1a0148a37196   816  413bc9               cmpl rcx,r9
0x1a0148a37199   819  76ed                 jna 0x1a0148a37188  <+0x808>
0x1a0148a3719b   81b  468d0c8e             leal r9,[rsi+r9*4]
0x1a0148a3719f   81f  468b0c0f             movl r9,[rdi+r9*1]
0x1a0148a371a3   823  8d0486               leal rax,[rsi+rax*4]
0x1a0148a371a6   826  8b0407               movl rax,[rdi+rax*1]
0x1a0148a371a9   829  443bc8               cmpl r9,rax
0x1a0148a371ac   82c  0f8224000000         jc 0x1a0148a371d6  <+0x856>
0x1a0148a371b2   832  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x1a0148a371ba   83a  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x1a0148a371c2   842  0f831c000000         jnc 0x1a0148a371e4  <+0x864>
0x1a0148a371c8   848  41be04000000         movl r14,0x4
0x1a0148a371ce   84e  4533c9               xorl r9,r9
0x1a0148a371d1   851  e91a000000           jmp 0x1a0148a371f0  <+0x870>
0x1a0148a371d6   856  4533c9               xorl r9,r9
0x1a0148a371d9   859  41be04000000         movl r14,0x4
0x1a0148a371df   85f  e90c000000           jmp 0x1a0148a371f0  <+0x870>
0x1a0148a371e4   864  442bc8               subl r9,rax
0x1a0148a371e7   867  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x1a0148a371ec   86c  458d3486             leal r14,[r14+rax*4]
0x1a0148a371f0   870  8bda                 movl rbx,rdx
0x1a0148a371f2   872  8b8558ffffff         movl rax,[rbp-0xa8]
0x1a0148a371f8   878  33d2                 xorl rdx,rdx
0x1a0148a371fa   87a  41f7f3               divl r11
0x1a0148a371fd   87d  410fafd4             imull rdx,r12
0x1a0148a37201   881  4c89b5d0feffff       REX.W movq [rbp-0x130],r14
0x1a0148a37208   888  8b8550ffffff         movl rax,[rbp-0xb0]
0x1a0148a3720e   88e  448d3410             leal r14,[rax+rdx*1]
0x1a0148a37212   892  4c898de8feffff       REX.W movq [rbp-0x118],r9
0x1a0148a37219   899  443bf1               cmpl r14,rcx
0x1a0148a3721c   89c  0f820b000000         jc 0x1a0148a3722d  <+0x8ad>
0x1a0148a37222   8a2  4533c9               xorl r9,r9
0x1a0148a37225   8a5  458bf1               movl r14,r9
0x1a0148a37228   8a8  e954000000           jmp 0x1a0148a37281  <+0x901>
0x1a0148a3722d   8ad  458d4e01             leal r9,[r14+0x1]
0x1a0148a37231   8b1  413bc9               cmpl rcx,r9
0x1a0148a37234   8b4  76ec                 jna 0x1a0148a37222  <+0x8a2>
0x1a0148a37236   8b6  468d0c8e             leal r9,[rsi+r9*4]
0x1a0148a3723a   8ba  468b0c0f             movl r9,[rdi+r9*1]
0x1a0148a3723e   8be  468d34b6             leal r14,[rsi+r14*4]
0x1a0148a37242   8c2  468b3437             movl r14,[rdi+r14*1]
0x1a0148a37246   8c6  453bce               cmpl r9,r14
0x1a0148a37249   8c9  0f8224000000         jc 0x1a0148a37273  <+0x8f3>
0x1a0148a3724f   8cf  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x1a0148a37257   8d7  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x1a0148a3725f   8df  0f831c000000         jnc 0x1a0148a37281  <+0x901>
0x1a0148a37265   8e5  41bc04000000         movl r12,0x4
0x1a0148a3726b   8eb  4533c9               xorl r9,r9
0x1a0148a3726e   8ee  e91a000000           jmp 0x1a0148a3728d  <+0x90d>
0x1a0148a37273   8f3  4533c9               xorl r9,r9
0x1a0148a37276   8f6  41bc04000000         movl r12,0x4
0x1a0148a3727c   8fc  e90c000000           jmp 0x1a0148a3728d  <+0x90d>
0x1a0148a37281   901  452bce               subl r9,r14
0x1a0148a37284   904  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x1a0148a37289   909  478d24b4             leal r12,[r12+r14*4]
0x1a0148a3728d   90d  458d3410             leal r14,[r8+rdx*1]
0x1a0148a37291   911  4c89a5e0feffff       REX.W movq [rbp-0x120],r12
0x1a0148a37298   918  4c898df0feffff       REX.W movq [rbp-0x110],r9
0x1a0148a3729f   91f  443bf1               cmpl r14,rcx
0x1a0148a372a2   922  0f820b000000         jc 0x1a0148a372b3  <+0x933>
0x1a0148a372a8   928  4531e4               xorl r12,r12
0x1a0148a372ab   92b  4589e6               movl r14,r12
0x1a0148a372ae   92e  e954000000           jmp 0x1a0148a37307  <+0x987>
0x1a0148a372b3   933  458d6601             leal r12,[r14+0x1]
0x1a0148a372b7   937  4439e1               cmpl rcx,r12
0x1a0148a372ba   93a  76ec                 jna 0x1a0148a372a8  <+0x928>
0x1a0148a372bc   93c  468d24a6             leal r12,[rsi+r12*4]
0x1a0148a372c0   940  468b2427             movl r12,[rdi+r12*1]
0x1a0148a372c4   944  468d34b6             leal r14,[rsi+r14*4]
0x1a0148a372c8   948  468b3437             movl r14,[rdi+r14*1]
0x1a0148a372cc   94c  453be6               cmpl r12,r14
0x1a0148a372cf   94f  0f8224000000         jc 0x1a0148a372f9  <+0x979>
0x1a0148a372d5   955  468b8c3f80000000     movl r9,[rdi+r15*1+0x80]
0x1a0148a372dd   95d  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0x1a0148a372e5   965  0f831c000000         jnc 0x1a0148a37307  <+0x987>
0x1a0148a372eb   96b  41bc04000000         movl r12,0x4
0x1a0148a372f1   971  4533f6               xorl r14,r14
0x1a0148a372f4   974  e923000000           jmp 0x1a0148a3731c  <+0x99c>
0x1a0148a372f9   979  4533f6               xorl r14,r14
0x1a0148a372fc   97c  41bc04000000         movl r12,0x4
0x1a0148a37302   982  e915000000           jmp 0x1a0148a3731c  <+0x99c>
0x1a0148a37307   987  452be6               subl r12,r14
0x1a0148a3730a   98a  468b4c3f7c           movl r9,[rdi+r15*1+0x7c]
0x1a0148a3730f   98f  478d34b1             leal r14,[r9+r14*4]
0x1a0148a37313   993  458bd6               movl r10,r14
0x1a0148a37316   996  4589e6               movl r14,r12
0x1a0148a37319   999  458be2               movl r12,r10
0x1a0148a3731c   99c  03d3                 addl rdx,rbx
0x1a0148a3731e   99e  4c89a548ffffff       REX.W movq [rbp-0xb8],r12
0x1a0148a37325   9a5  4c89b538ffffff       REX.W movq [rbp-0xc8],r14
0x1a0148a3732c   9ac  3bd1                 cmpl rdx,rcx
0x1a0148a3732e   9ae  0f820a000000         jc 0x1a0148a3733e  <+0x9be>
0x1a0148a37334   9b4  33d2                 xorl rdx,rdx
0x1a0148a37336   9b6  448bca               movl r9,rdx
0x1a0148a37339   9b9  e952000000           jmp 0x1a0148a37390  <+0xa10>
0x1a0148a3733e   9be  448d4a01             leal r9,[rdx+0x1]
0x1a0148a37342   9c2  413bc9               cmpl rcx,r9
0x1a0148a37345   9c5  76ed                 jna 0x1a0148a37334  <+0x9b4>
0x1a0148a37347   9c7  468d0c8e             leal r9,[rsi+r9*4]
0x1a0148a3734b   9cb  468b0c0f             movl r9,[rdi+r9*1]
0x1a0148a3734f   9cf  8d1496               leal rdx,[rsi+rdx*4]
0x1a0148a37352   9d2  8b1417               movl rdx,[rdi+rdx*1]
0x1a0148a37355   9d5  443bca               cmpl r9,rdx
0x1a0148a37358   9d8  0f8224000000         jc 0x1a0148a37382  <+0xa02>
0x1a0148a3735e   9de  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x1a0148a37366   9e6  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x1a0148a3736e   9ee  0f831c000000         jnc 0x1a0148a37390  <+0xa10>
0x1a0148a37374   9f4  41bc04000000         movl r12,0x4
0x1a0148a3737a   9fa  4533c9               xorl r9,r9
0x1a0148a3737d   9fd  e91a000000           jmp 0x1a0148a3739c  <+0xa1c>
0x1a0148a37382   a02  4533c9               xorl r9,r9
0x1a0148a37385   a05  41bc04000000         movl r12,0x4
0x1a0148a3738b   a0b  e90c000000           jmp 0x1a0148a3739c  <+0xa1c>
0x1a0148a37390   a10  442bca               subl r9,rdx
0x1a0148a37393   a13  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x1a0148a37398   a18  458d2494             leal r12,[r12+rdx*4]
0x1a0148a3739c   a1c  8b9558ffffff         movl rdx,[rbp-0xa8]
0x1a0148a373a2   a22  83c201               addl rdx,0x1
0x1a0148a373a5   a25  448bf0               movl r14,rax
0x1a0148a373a8   a28  8bc2                 movl rax,rdx
0x1a0148a373aa   a2a  33d2                 xorl rdx,rdx
0x1a0148a373ac   a2c  41f7f3               divl r11
0x1a0148a373af   a2f  448b9dc8feffff       movl r11,[rbp-0x138]
0x1a0148a373b6   a36  440fafda             imull r11,rdx
0x1a0148a373ba   a3a  4503f3               addl r14,r11
0x1a0148a373bd   a3d  4c89a540ffffff       REX.W movq [rbp-0xc0],r12
0x1a0148a373c4   a44  443bf1               cmpl r14,rcx
0x1a0148a373c7   a47  0f820a000000         jc 0x1a0148a373d7  <+0xa57>
0x1a0148a373cd   a4d  33c0                 xorl rax,rax
0x1a0148a373cf   a4f  448bf0               movl r14,rax
0x1a0148a373d2   a52  e94f000000           jmp 0x1a0148a37426  <+0xaa6>
0x1a0148a373d7   a57  418d4601             leal rax,[r14+0x1]
0x1a0148a373db   a5b  3bc8                 cmpl rcx,rax
0x1a0148a373dd   a5d  76ee                 jna 0x1a0148a373cd  <+0xa4d>
0x1a0148a373df   a5f  8d0486               leal rax,[rsi+rax*4]
0x1a0148a373e2   a62  8b0407               movl rax,[rdi+rax*1]
0x1a0148a373e5   a65  468d34b6             leal r14,[rsi+r14*4]
0x1a0148a373e9   a69  468b3437             movl r14,[rdi+r14*1]
0x1a0148a373ed   a6d  413bc6               cmpl rax,r14
0x1a0148a373f0   a70  0f8223000000         jc 0x1a0148a37419  <+0xa99>
0x1a0148a373f6   a76  428b943f80000000     movl rdx,[rdi+r15*1+0x80]
0x1a0148a373fe   a7e  4239843f80000000     cmpl [rdi+r15*1+0x80],rax
0x1a0148a37406   a86  0f831a000000         jnc 0x1a0148a37426  <+0xaa6>
0x1a0148a3740c   a8c  41be04000000         movl r14,0x4
0x1a0148a37412   a92  33c0                 xorl rax,rax
0x1a0148a37414   a94  e919000000           jmp 0x1a0148a37432  <+0xab2>
0x1a0148a37419   a99  33c0                 xorl rax,rax
0x1a0148a3741b   a9b  41be04000000         movl r14,0x4
0x1a0148a37421   aa1  e90c000000           jmp 0x1a0148a37432  <+0xab2>
0x1a0148a37426   aa6  412bc6               subl rax,r14
0x1a0148a37429   aa9  428b543f7c           movl rdx,[rdi+r15*1+0x7c]
0x1a0148a3742e   aae  468d34b2             leal r14,[rdx+r14*4]
0x1a0148a37432   ab2  4503c3               addl r8,r11
0x1a0148a37435   ab5  443bc1               cmpl r8,rcx
0x1a0148a37438   ab8  0f820a000000         jc 0x1a0148a37448  <+0xac8>
0x1a0148a3743e   abe  33d2                 xorl rdx,rdx
0x1a0148a37440   ac0  448bc2               movl r8,rdx
0x1a0148a37443   ac3  e94f000000           jmp 0x1a0148a37497  <+0xb17>
0x1a0148a37448   ac8  418d5001             leal rdx,[r8+0x1]
0x1a0148a3744c   acc  3bca                 cmpl rcx,rdx
0x1a0148a3744e   ace  76ee                 jna 0x1a0148a3743e  <+0xabe>
0x1a0148a37450   ad0  8d1496               leal rdx,[rsi+rdx*4]
0x1a0148a37453   ad3  8b1417               movl rdx,[rdi+rdx*1]
0x1a0148a37456   ad6  468d0486             leal r8,[rsi+r8*4]
0x1a0148a3745a   ada  468b0407             movl r8,[rdi+r8*1]
0x1a0148a3745e   ade  413bd0               cmpl rdx,r8
0x1a0148a37461   ae1  0f8223000000         jc 0x1a0148a3748a  <+0xb0a>
0x1a0148a37467   ae7  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x1a0148a3746f   aef  4239943f80000000     cmpl [rdi+r15*1+0x80],rdx
0x1a0148a37477   af7  0f831a000000         jnc 0x1a0148a37497  <+0xb17>
0x1a0148a3747d   afd  41b804000000         movl r8,0x4
0x1a0148a37483   b03  33d2                 xorl rdx,rdx
0x1a0148a37485   b05  e919000000           jmp 0x1a0148a374a3  <+0xb23>
0x1a0148a3748a   b0a  33d2                 xorl rdx,rdx
0x1a0148a3748c   b0c  41b804000000         movl r8,0x4
0x1a0148a37492   b12  e90c000000           jmp 0x1a0148a374a3  <+0xb23>
0x1a0148a37497   b17  412bd0               subl rdx,r8
0x1a0148a3749a   b1a  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x1a0148a3749f   b1f  478d0484             leal r8,[r12+r8*4]
0x1a0148a374a3   b23  4403db               addl r11,rbx
0x1a0148a374a6   b26  443bd9               cmpl r11,rcx
0x1a0148a374a9   b29  0f820b000000         jc 0x1a0148a374ba  <+0xb3a>
0x1a0148a374af   b2f  4533db               xorl r11,r11
0x1a0148a374b2   b32  458be3               movl r12,r11
0x1a0148a374b5   b35  e954000000           jmp 0x1a0148a3750e  <+0xb8e>
0x1a0148a374ba   b3a  458d6301             leal r12,[r11+0x1]
0x1a0148a374be   b3e  4439e1               cmpl rcx,r12
0x1a0148a374c1   b41  76ec                 jna 0x1a0148a374af  <+0xb2f>
0x1a0148a374c3   b43  468d24a6             leal r12,[rsi+r12*4]
0x1a0148a374c7   b47  468b2427             movl r12,[rdi+r12*1]
0x1a0148a374cb   b4b  468d1c9e             leal r11,[rsi+r11*4]
0x1a0148a374cf   b4f  468b1c1f             movl r11,[rdi+r11*1]
0x1a0148a374d3   b53  453be3               cmpl r12,r11
0x1a0148a374d6   b56  0f8224000000         jc 0x1a0148a37500  <+0xb80>
0x1a0148a374dc   b5c  428b9c3f80000000     movl rbx,[rdi+r15*1+0x80]
0x1a0148a374e4   b64  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0x1a0148a374ec   b6c  0f831c000000         jnc 0x1a0148a3750e  <+0xb8e>
0x1a0148a374f2   b72  41bb04000000         movl r11,0x4
0x1a0148a374f8   b78  4531e4               xorl r12,r12
0x1a0148a374fb   b7b  e91a000000           jmp 0x1a0148a3751a  <+0xb9a>
0x1a0148a37500   b80  4531e4               xorl r12,r12
0x1a0148a37503   b83  41bb04000000         movl r11,0x4
0x1a0148a37509   b89  e90c000000           jmp 0x1a0148a3751a  <+0xb9a>
0x1a0148a3750e   b8e  452be3               subl r12,r11
0x1a0148a37511   b91  428b5c3f7c           movl rbx,[rdi+r15*1+0x7c]
0x1a0148a37516   b96  468d1c9b             leal r11,[rbx+r11*4]
0x1a0148a3751a   b9a  8b5de0               movl rbx,[rbp-0x20]
0x1a0148a3751d   b9d  4489641f4c           movl [rdi+rbx*1+0x4c],r12
0x1a0148a37522   ba2  44895c1f48           movl [rdi+rbx*1+0x48],r11
0x1a0148a37527   ba7  89541f44             movl [rdi+rbx*1+0x44],rdx
0x1a0148a3752b   bab  4489441f40           movl [rdi+rbx*1+0x40],r8
0x1a0148a37530   bb0  89441f3c             movl [rdi+rbx*1+0x3c],rax
0x1a0148a37534   bb4  4489741f38           movl [rdi+rbx*1+0x38],r14
0x1a0148a37539   bb9  44894c1f34           movl [rdi+rbx*1+0x34],r9
0x1a0148a3753e   bbe  448ba540ffffff       movl r12,[rbp-0xc0]
0x1a0148a37545   bc5  4489641f30           movl [rdi+rbx*1+0x30],r12
0x1a0148a3754a   bca  448ba538ffffff       movl r12,[rbp-0xc8]
0x1a0148a37551   bd1  4489641f2c           movl [rdi+rbx*1+0x2c],r12
0x1a0148a37556   bd6  448ba548ffffff       movl r12,[rbp-0xb8]
0x1a0148a3755d   bdd  4489641f28           movl [rdi+rbx*1+0x28],r12
0x1a0148a37562   be2  448b8df0feffff       movl r9,[rbp-0x110]
0x1a0148a37569   be9  44894c1f24           movl [rdi+rbx*1+0x24],r9
0x1a0148a3756e   bee  448ba5e0feffff       movl r12,[rbp-0x120]
0x1a0148a37575   bf5  4489641f20           movl [rdi+rbx*1+0x20],r12
0x1a0148a3757a   bfa  448b8de8feffff       movl r9,[rbp-0x118]
0x1a0148a37581   c01  44894c1f1c           movl [rdi+rbx*1+0x1c],r9
0x1a0148a37586   c06  448bb5d0feffff       movl r14,[rbp-0x130]
0x1a0148a3758d   c0d  4489741f18           movl [rdi+rbx*1+0x18],r14
0x1a0148a37592   c12  448b85a0feffff       movl r8,[rbp-0x160]
0x1a0148a37599   c19  4489441f14           movl [rdi+rbx*1+0x14],r8
0x1a0148a3759e   c1e  448bb5a8feffff       movl r14,[rbp-0x158]
0x1a0148a375a5   c25  4489741f10           movl [rdi+rbx*1+0x10],r14
0x1a0148a375aa   c2a  448b85b0feffff       movl r8,[rbp-0x150]
0x1a0148a375b1   c31  4489441f0c           movl [rdi+rbx*1+0xc],r8
0x1a0148a375b6   c36  448bb5b8feffff       movl r14,[rbp-0x148]
0x1a0148a375bd   c3d  4489741f08           movl [rdi+rbx*1+0x8],r14
0x1a0148a375c2   c42  49b80000000009000000 REX.W movq r8,0x900000000
0x1a0148a375cc   c4c  4c89041f             REX.W movq [rdi+rbx*1],r8
0x1a0148a375d0   c50  448b8560ffffff       movl r8,[rbp-0xa0]
0x1a0148a375d7   c57  448b9dc0feffff       movl r11,[rbp-0x140]
0x1a0148a375de   c5e  443b9d60ffffff       cmpl r11,[rbp-0xa0]
0x1a0148a375e5   c65  450f42c3             cmovcl r8,r11
0x1a0148a375e9   c69  448b4db8             movl r9,[rbp-0x48]
0x1a0148a375ed   c6d  448b5db0             movl r11,[rbp-0x50]
0x1a0148a375f1   c71  443b5db8             cmpl r11,[rbp-0x48]
0x1a0148a375f5   c75  450f42cb             cmovcl r9,r11
0x1a0148a375f9   c79  458bd9               movl r11,r9
0x1a0148a375fc   c7c  453bc1               cmpl r8,r9
0x1a0148a375ff   c7f  450f42d8             cmovcl r11,r8
0x1a0148a37603   c83  4c899d48ffffff       REX.W movq [rbp-0xb8],r11
0x1a0148a3760a   c8a  c57928d2             vmovapd xmm10,xmm2
0x1a0148a3760e   c8e  c57928da             vmovapd xmm11,xmm2
0x1a0148a37612   c92  4533c0               xorl r8,r8
0x1a0148a37615   c95  8b9510ffffff         movl rdx,[rbp-0xf0]
0x1a0148a3761b   c9b  8b8508ffffff         movl rax,[rbp-0xf8]
0x1a0148a37621   ca1  448bb500ffffff       movl r14,[rbp-0x100]
0x1a0148a37628   ca8  448ba5f8feffff       movl r12,[rbp-0x108]
0x1a0148a3762f   caf  e90f000000           jmp 0x1a0148a37643  <+0xcc3>
0x1a0148a37634   cb4  660f1f840000000000   nop
0x1a0148a3763d   cbd  0f1f00               nop
0x1a0148a37640   cc0  8b5de0               movl rbx,[rbp-0x20]
0x1a0148a37643   cc3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a37647   cc7  0f8614070000         jna 0x1a0148a37d61  <+0x13e1>
0x1a0148a3764d   ccd  428d4cc308           leal rcx,[rbx+r8*8+0x8]
0x1a0148a37652   cd2  8b740f04             movl rsi,[rdi+rcx*1+0x4]
0x1a0148a37656   cd6  85f6                 testl rsi,rsi
0x1a0148a37658   cd8  0f8496010000         jz 0x1a0148a377f4  <+0xe74>
0x1a0148a3765e   cde  8b0c0f               movl rcx,[rdi+rcx*1]
0x1a0148a37661   ce1  8d34b1               leal rsi,[rcx+rsi*4]
0x1a0148a37664   ce4  e922000000           jmp 0x1a0148a3768b  <+0xd0b>
0x1a0148a37669   ce9  660f1f840000000000   nop
0x1a0148a37672   cf2  660f1f840000000000   nop
0x1a0148a3767b   cfb  0f1f440000           nop
0x1a0148a37680   d00  448b9d48ffffff       movl r11,[rbp-0xb8]
0x1a0148a37687   d07  c57928d9             vmovapd xmm11,xmm1
0x1a0148a3768b   d0b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a3768f   d0f  0f8659070000         jna 0x1a0148a37dee  <+0x146e>
0x1a0148a37695   d15  660f1f840000000000   nop
0x1a0148a3769e   d1e  660f1f840000000000   nop
0x1a0148a376a7   d27  660f1f840000000000   nop
0x1a0148a376b0   d30  660f1f840000000000   nop
0x1a0148a376b9   d39  0f1f8000000000       nop
0x1a0148a376c0   d40  448d4904             leal r9,[rcx+0x4]
0x1a0148a376c4   d44  8b0c0f               movl rcx,[rdi+rcx*1]
0x1a0148a376c7   d47  443bd9               cmpl r11,rcx
0x1a0148a376ca   d4a  0f8760000000         ja 0x1a0148a37730  <+0xdb0>
0x1a0148a376d0   d50  443bce               cmpl r9,rsi
0x1a0148a376d3   d53  0f841b010000         jz 0x1a0148a377f4  <+0xe74>
0x1a0148a376d9   d59  418d4904             leal rcx,[r9+0x4]
0x1a0148a376dd   d5d  468b0c0f             movl r9,[rdi+r9*1]
0x1a0148a376e1   d61  453bd9               cmpl r11,r9
0x1a0148a376e4   d64  0f874f000000         ja 0x1a0148a37739  <+0xdb9>
0x1a0148a376ea   d6a  3bce                 cmpl rcx,rsi
0x1a0148a376ec   d6c  0f8402010000         jz 0x1a0148a377f4  <+0xe74>
0x1a0148a376f2   d72  448d4904             leal r9,[rcx+0x4]
0x1a0148a376f6   d76  8b0c0f               movl rcx,[rdi+rcx*1]
0x1a0148a376f9   d79  443bd9               cmpl r11,rcx
0x1a0148a376fc   d7c  0f872e000000         ja 0x1a0148a37730  <+0xdb0>
0x1a0148a37702   d82  443bce               cmpl r9,rsi
0x1a0148a37705   d85  0f84e9000000         jz 0x1a0148a377f4  <+0xe74>
0x1a0148a3770b   d8b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x1a0148a3770f   d8f  0f867d070000         jna 0x1a0148a37e92  <+0x1512>
0x1a0148a37715   d95  418d4904             leal rcx,[r9+0x4]
0x1a0148a37719   d99  468b0c0f             movl r9,[rdi+r9*1]
0x1a0148a3771d   d9d  453bd9               cmpl r11,r9
0x1a0148a37720   da0  0f8713000000         ja 0x1a0148a37739  <+0xdb9>
0x1a0148a37726   da6  3bce                 cmpl rcx,rsi
0x1a0148a37728   da8  0f84c6000000         jz 0x1a0148a377f4  <+0xe74>
0x1a0148a3772e   dae  eb90                 jmp 0x1a0148a376c0  <+0xd40>
0x1a0148a37730   db0  448bd1               movl r10,rcx
0x1a0148a37733   db3  418bc9               movl rcx,r9
0x1a0148a37736   db6  458bca               movl r9,r10
0x1a0148a37739   db9  438d1c8c             leal rbx,[r12+r9*4]
0x1a0148a3773d   dbd  478d3c8e             leal r15,[r14+r9*4]
0x1a0148a37741   dc1  468d1c88             leal r11,[rax+r9*4]
0x1a0148a37745   dc5  c4217a10241f         vmovss xmm12,[rdi+r11*1]
0x1a0148a3774b   dcb  468d1c8a             leal r11,[rdx+r9*4]
0x1a0148a3774f   dcf  c4214a5c2c1f         vsubss xmm13,xmm6,[rdi+r11*1]
0x1a0148a37755   dd5  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0x1a0148a3775d   ddd  0f8715000000         ja 0x1a0148a37778  <+0xdf8>
0x1a0148a37763   de3  c4c1782edd           vucomiss xmm3,xmm13
0x1a0148a37768   de8  0f860e000000         jna 0x1a0148a3777c  <+0xdfc>
0x1a0148a3776e   dee  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x1a0148a37773   df3  e904000000           jmp 0x1a0148a3777c  <+0xdfc>
0x1a0148a37778   df8  c5125cec             vsubss xmm13,xmm13,xmm4
0x1a0148a3777c   dfc  c57a10341f           vmovss xmm14,[rdi+rbx*1]
0x1a0148a37781   e01  c4a17a100c3f         vmovss xmm1,[rdi+r15*1]
0x1a0148a37787   e07  c441325ce4           vsubss xmm12,xmm9,xmm12
0x1a0148a3778c   e0c  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0x1a0148a37794   e14  0f8715000000         ja 0x1a0148a377af  <+0xe2f>
0x1a0148a3779a   e1a  c4c1782edc           vucomiss xmm3,xmm12
0x1a0148a3779f   e1f  0f860e000000         jna 0x1a0148a377b3  <+0xe33>
0x1a0148a377a5   e25  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x1a0148a377aa   e2a  e904000000           jmp 0x1a0148a377b3  <+0xe33>
0x1a0148a377af   e2f  c51a5ce4             vsubss xmm12,xmm12,xmm4
0x1a0148a377b3   e33  c4c17258cb           vaddss xmm1,xmm1,xmm11
0x1a0148a377b8   e38  c4411259ed           vmulss xmm13,xmm13,xmm13
0x1a0148a377bd   e3d  c4411a59e4           vmulss xmm12,xmm12,xmm12
0x1a0148a377c2   e42  c4411a58e5           vaddss xmm12,xmm12,xmm13
0x1a0148a377c7   e47  c4c1782ec4           vucomiss xmm0,xmm12
0x1a0148a377cc   e4c  0f870a000000         ja 0x1a0148a377dc  <+0xe5c>
0x1a0148a377d2   e52  c4c17928cb           vmovapd xmm1,xmm11
0x1a0148a377d7   e57  e905000000           jmp 0x1a0148a377e1  <+0xe61>
0x1a0148a377dc   e5c  c4410a58d2           vaddss xmm10,xmm14,xmm10
0x1a0148a377e1   e61  3bf1                 cmpl rsi,rcx
0x1a0148a377e3   e63  0f8597feffff         jnz 0x1a0148a37680  <+0xd00>
0x1a0148a377e9   e69  448b9d48ffffff       movl r11,[rbp-0xb8]
0x1a0148a377f0   e70  c57928d9             vmovapd xmm11,xmm1
0x1a0148a377f4   e74  4183c001             addl r8,0x1
0x1a0148a377f8   e78  4183f809             cmpl r8,0x9
0x1a0148a377fc   e7c  0f853efeffff         jnz 0x1a0148a37640  <+0xcc0>
0x1a0148a37802   e82  c4412259e3           vmulss xmm12,xmm11,xmm11
0x1a0148a37807   e87  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x1a0148a3780c   e8c  c4411258e4           vaddss xmm12,xmm13,xmm12
0x1a0148a37811   e91  c5782ee2             vucomiss xmm12,xmm2
0x1a0148a37815   e95  0f8726000000         ja 0x1a0148a37841  <+0xec1>
0x1a0148a3781b   e9b  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x1a0148a3781f   e9f  4e8b843fa0000000     REX.W movq r8,[rdi+r15*1+0xa0]
0x1a0148a37827   ea7  4983c001             REX.W addq r8,0x1
0x1a0148a3782b   eab  4e89843fa0000000     REX.W movq [rdi+r15*1+0xa0],r8
0x1a0148a37833   eb3  c4417928d8           vmovapd xmm11,xmm8
0x1a0148a37838   eb8  c57928d7             vmovapd xmm10,xmm7
0x1a0148a3783c   ebc  e91d000000           jmp 0x1a0148a3785e  <+0xede>
0x1a0148a37841   ec1  f3450f51e4           sqrtss xmm12,xmm12
0x1a0148a37846   ec6  c4412a5ed4           vdivss xmm10,xmm10,xmm12
0x1a0148a3784b   ecb  c4417828d2           vmovaps xmm10,xmm10
0x1a0148a37850   ed0  c441225edc           vdivss xmm11,xmm11,xmm12
0x1a0148a37855   ed5  c4417828db           vmovaps xmm11,xmm11
0x1a0148a3785a   eda  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x1a0148a3785e   ede  4e8b843f90000000     REX.W movq r8,[rdi+r15*1+0x90]
0x1a0148a37866   ee6  49b8157c4a7fb979379e REX.W movq r8,0x9e3779b97f4a7c15
0x1a0148a37870   ef0  4e03843f90000000     REX.W addq r8,[rdi+r15*1+0x90]
0x1a0148a37878   ef8  4e89843f90000000     REX.W movq [rdi+r15*1+0x90],r8
0x1a0148a37880   f00  4d8bd8               REX.W movq r11,r8
0x1a0148a37883   f03  49c1eb1e             REX.W shrq r11, 30
0x1a0148a37887   f07  4d33c3               REX.W xorq r8,r11
0x1a0148a3788a   f0a  49bbb9e5e41c6d4758bf REX.W movq r11,0xbf58476d1ce4e5b9
0x1a0148a37894   f14  4d0fafd8             REX.W imulq r11,r8
0x1a0148a37898   f18  4d8bc3               REX.W movq r8,r11
0x1a0148a3789b   f1b  49c1e81b             REX.W shrq r8, 27
0x1a0148a3789f   f1f  4d33d8               REX.W xorq r11,r8
0x1a0148a378a2   f22  49b8eb113113bb49d094 REX.W movq r8,0x94d049bb133111eb
0x1a0148a378ac   f2c  4d0fafc3             REX.W imulq r8,r11
0x1a0148a378b0   f30  4d8bd8               REX.W movq r11,r8
0x1a0148a378b3   f33  49c1eb2b             REX.W shrq r11, 43
0x1a0148a378b7   f37  49c1e80c             REX.W shrq r8, 12
0x1a0148a378bb   f3b  4d33c3               REX.W xorq r8,r11
0x1a0148a378be   f3e  49bb000000000000f03f REX.W movq r11,0x3ff0000000000000
0x1a0148a378c8   f48  4d0bd8               REX.W orq r11,r8
0x1a0148a378cb   f4b  c441f96ee3           vmovq xmm12,r11
0x1a0148a378d0   f50  49ba000000000000f0bf REX.W movq r10,0xbff0000000000000
0x1a0148a378da   f5a  c441f96eea           vmovq xmm13,r10
0x1a0148a378df   f5f  c4411358e4           vaddsd xmm12,xmm13,xmm12
0x1a0148a378e4   f64  49ba000000000000e0bf REX.W movq r10,0xbfe0000000000000
0x1a0148a378ee   f6e  c441f96eea           vmovq xmm13,r10
0x1a0148a378f3   f73  c4411358e4           vaddsd xmm12,xmm13,xmm12
0x1a0148a378f8   f78  c4217a10ac3fb4000000 vmovss xmm13,[rdi+r15*1+0xb4]
0x1a0148a37902   f82  c441125aed           vcvtss2sd xmm13,xmm13,xmm13
0x1a0148a37907   f87  c4411359e4           vmulsd xmm12,xmm13,xmm12
0x1a0148a3790c   f8c  c4c11b5acc           vcvtsd2ss xmm1,xmm12,xmm12
0x1a0148a37911   f91  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37916   f96  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a3791b   f9b  c5fb118d60ffffff     vmovsd [rbp-0xa0],xmm1
0x1a0148a37923   fa3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a37927   fa7  e8cc54edff           call 0x1a014890cdf8  (jump table)
0x1a0148a3792c   fac  c5fb118d58ffffff     vmovsd [rbp-0xa8],xmm1
0x1a0148a37934   fb4  c5fb108d60ffffff     vmovsd xmm1,[rbp-0xa0]
0x1a0148a3793c   fbc  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a37940   fc0  e8bb54edff           call 0x1a014890ce00  (jump table)
0x1a0148a37945   fc5  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37949   fc9  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x1a0148a3794d   fcd  c4a17a108407b0000000 vmovss xmm0,[rdi+r8*1+0xb0]
0x1a0148a37957   fd7  c5fb109568ffffff     vmovsd xmm2,[rbp-0x98]
0x1a0148a3795f   fdf  c5ea59d0             vmulss xmm2,xmm2,xmm0
0x1a0148a37963   fe3  c5ea589570ffffff     vaddss xmm2,xmm2,[rbp-0x90]
0x1a0148a3796b   feb  c4a17a109c07a8000000 vmovss xmm3,[rdi+r8*1+0xa8]
0x1a0148a37975   ff5  c5f82ed3             vucomiss xmm2,xmm3
0x1a0148a37979   ff9  0f8317000000         jnc 0x1a0148a37996  <+0x1016>
0x1a0148a3797f   fff  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1a0148a37983  1003  c5f82ee2             vucomiss xmm4,xmm2
0x1a0148a37987  1007  0f8611000000         jna 0x1a0148a3799e  <+0x101e>
0x1a0148a3798d  100d  c5e258d2             vaddss xmm2,xmm3,xmm2
0x1a0148a37991  1011  e908000000           jmp 0x1a0148a3799e  <+0x101e>
0x1a0148a37996  1016  c5ea5cd3             vsubss xmm2,xmm2,xmm3
0x1a0148a3799a  101a  c5d857e4             vxorps xmm4,xmm4,xmm4
0x1a0148a3799e  101e  c5fa598578ffffff     vmulss xmm0,xmm0,[rbp-0x88]
0x1a0148a379a6  1026  c5fa584580           vaddss xmm0,xmm0,[rbp-0x80]
0x1a0148a379ab  102b  c5f82ec3             vucomiss xmm0,xmm3
0x1a0148a379af  102f  0f8313000000         jnc 0x1a0148a379c8  <+0x1048>
0x1a0148a379b5  1035  c5f82ee0             vucomiss xmm4,xmm0
0x1a0148a379b9  1039  0f860d000000         jna 0x1a0148a379cc  <+0x104c>
0x1a0148a379bf  103f  c5e258c0             vaddss xmm0,xmm3,xmm0
0x1a0148a379c3  1043  e904000000           jmp 0x1a0148a379cc  <+0x104c>
0x1a0148a379c8  1048  c5fa5cc3             vsubss xmm0,xmm0,xmm3
0x1a0148a379cc  104c  448b5d88             movl r11,[rbp-0x78]
0x1a0148a379d0  1050  443b5dc0             cmpl r11,[rbp-0x40]
0x1a0148a379d4  1054  0f86aa000000         jna 0x1a0148a37a84  <+0x1104>
0x1a0148a379da  105a  448b65c0             movl r12,[rbp-0x40]
0x1a0148a379de  105e  448b7d90             movl r15,[rbp-0x70]
0x1a0148a379e2  1062  478d34a7             leal r14,[r15+r12*4]
0x1a0148a379e6  1066  c5f82ed3             vucomiss xmm2,xmm3
0x1a0148a379ea  106a  0f8204000000         jc 0x1a0148a379f4  <+0x1074>
0x1a0148a379f0  1070  c5f928d4             vmovapd xmm2,xmm4
0x1a0148a379f4  1074  c4a17a111437         vmovss [rdi+r14*1],xmm2
0x1a0148a379fa  107a  448b7598             movl r14,[rbp-0x68]
0x1a0148a379fe  107e  438d04a6             leal rax,[r14+r12*4]
0x1a0148a37a02  1082  c5f82ec3             vucomiss xmm0,xmm3
0x1a0148a37a06  1086  0f8204000000         jc 0x1a0148a37a10  <+0x1090>
0x1a0148a37a0c  108c  c5f928c4             vmovapd xmm0,xmm4
0x1a0148a37a10  1090  c5fa110407           vmovss [rdi+rax*1],xmm0
0x1a0148a37a15  1095  8b45a0               movl rax,[rbp-0x60]
0x1a0148a37a18  1098  428d1ca0             leal rbx,[rax+r12*4]
0x1a0148a37a1c  109c  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37a21  10a1  c5a259c1             vmulss xmm0,xmm11,xmm1
0x1a0148a37a25  10a5  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37a2a  10aa  c5aa599558ffffff     vmulss xmm2,xmm10,[rbp-0xa8]
0x1a0148a37a32  10b2  c5fa5cc2             vsubss xmm0,xmm0,xmm2
0x1a0148a37a36  10b6  c5fa11041f           vmovss [rdi+rbx*1],xmm0
0x1a0148a37a3b  10bb  8b5da8               movl rbx,[rbp-0x58]
0x1a0148a37a3e  10be  428d14a3             leal rdx,[rbx+r12*4]
0x1a0148a37a42  10c2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x1a0148a37a4a  10ca  c4c17a59c3           vmulss xmm0,xmm0,xmm11
0x1a0148a37a4f  10cf  c4c17259d2           vmulss xmm2,xmm1,xmm10
0x1a0148a37a54  10d4  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x1a0148a37a58  10d8  c5fa110417           vmovss [rdi+rdx*1],xmm0
0x1a0148a37a5d  10dd  4589e3               movl r11,r12
0x1a0148a37a60  10e0  4d8be0               REX.W movq r12,r8
0x1a0148a37a63  10e3  c5f928d4             vmovapd xmm2,xmm4
0x1a0148a37a67  10e7  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37a6f  10ef  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37a77  10f7  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37a7f  10ff  e923000000           jmp 0x1a0148a37aa7  <+0x1127>
0x1a0148a37a84  1104  4d8be0               REX.W movq r12,r8
0x1a0148a37a87  1107  448b5dc0             movl r11,[rbp-0x40]
0x1a0148a37a8b  110b  c5f928d4             vmovapd xmm2,xmm4
0x1a0148a37a8f  110f  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37a97  1117  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37a9f  111f  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37aa7  1127  4183c301             addl r11,0x1
0x1a0148a37aab  112b  448b45c8             movl r8,[rbp-0x38]
0x1a0148a37aaf  112f  453bc3               cmpl r8,r11
0x1a0148a37ab2  1132  0f8437000000         jz 0x1a0148a37aef  <+0x116f>
0x1a0148a37ab8  1138  e943f1ffff           jmp 0x1a0148a36c00  <+0x280>
0x1a0148a37abd  113d  b8c8301600           movl rax,0x1630c8
0x1a0148a37ac2  1142  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a37ac6  1146  e8ad3bedff           call 0x1a014890b678  (jump table)
0x1a0148a37acb  114b  33ff                 xorl rdi,rdi
0x1a0148a37acd  114d  85ff                 testl rdi,rdi
0x1a0148a37acf  114f  0f8467040000         jz 0x1a0148a37f3c  <+0x15bc>
0x1a0148a37ad5  1155  cc                   int3l
0x1a0148a37ad6  1156  b8c8301600           movl rax,0x1630c8
0x1a0148a37adb  115b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a37adf  115f  e8943bedff           call 0x1a014890b678  (jump table)
0x1a0148a37ae4  1164  33ff                 xorl rdi,rdi
0x1a0148a37ae6  1166  85ff                 testl rdi,rdi
0x1a0148a37ae8  1168  0f8449040000         jz 0x1a0148a37f37  <+0x15b7>
0x1a0148a37aee  116e  cc                   int3l
0x1a0148a37aef  116f  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x1a0148a37af3  1173  448b5de0             movl r11,[rbp-0x20]
0x1a0148a37af7  1177  c4a17a6f442730       vmovdqu xmm0,[rdi+r12*1+0x30]
0x1a0148a37afe  117e  c4a17a6f1427         vmovdqu xmm2,[rdi+r12*1]
0x1a0148a37b04  1184  c4a17a7f542730       vmovdqu [rdi+r12*1+0x30],xmm2
0x1a0148a37b0b  118b  c4a17a7f0427         vmovdqu [rdi+r12*1],xmm0
0x1a0148a37b11  1191  c4a17a6f442740       vmovdqu xmm0,[rdi+r12*1+0x40]
0x1a0148a37b18  1198  c4a17a6f542710       vmovdqu xmm2,[rdi+r12*1+0x10]
0x1a0148a37b1f  119f  c4a17a7f542740       vmovdqu [rdi+r12*1+0x40],xmm2
0x1a0148a37b26  11a6  c4a17a7f442710       vmovdqu [rdi+r12*1+0x10],xmm0
0x1a0148a37b2d  11ad  c4a17a6f442750       vmovdqu xmm0,[rdi+r12*1+0x50]
0x1a0148a37b34  11b4  c4a17a6f542720       vmovdqu xmm2,[rdi+r12*1+0x20]
0x1a0148a37b3b  11bb  c4a17a7f542750       vmovdqu [rdi+r12*1+0x50],xmm2
0x1a0148a37b42  11c2  c4a17a7f442720       vmovdqu [rdi+r12*1+0x20],xmm0
0x1a0148a37b49  11c9  4e8bbc2798000000     REX.W movq r15,[rdi+r12*1+0x98]
0x1a0148a37b51  11d1  4983c701             REX.W addq r15,0x1
0x1a0148a37b55  11d5  4e89bc2798000000     REX.W movq [rdi+r12*1+0x98],r15
0x1a0148a37b5d  11dd  418bfb               movl rdi,r11
0x1a0148a37b60  11e0  83c750               addl rdi,0x50
0x1a0148a37b63  11e3  418938               movl [r8],rdi
0x1a0148a37b66  11e6  488be5               REX.W movq rsp,rbp
0x1a0148a37b69  11e9  5d                   pop rbp
0x1a0148a37b6a  11ea  c3                   retl
0x1a0148a37b6b  11eb  488945b0             REX.W movq [rbp-0x50],rax
0x1a0148a37b6f  11ef  e85c69edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37b74  11f4  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37b78  11f8  488b75f0             REX.W movq rsi,[rbp-0x10]
0x1a0148a37b7c  11fc  8b45b0               movl rax,[rbp-0x50]
0x1a0148a37b7f  11ff  e91ceeffff           jmp 0x1a0148a369a0  <+0x20>
0x1a0148a37b84  1204  c5f92eed             vucomisd xmm5,xmm5
0x1a0148a37b88  1208  0f8b08000000         jpo 0x1a0148a37b96  <+0x1216>
0x1a0148a37b8e  120e  4533ff               xorl r15,r15
0x1a0148a37b91  1211  e912efffff           jmp 0x1a0148a36aa8  <+0x128>
0x1a0148a37b96  1216  c5f82ee3             vucomiss xmm4,xmm3
0x1a0148a37b9a  121a  77f2                 ja 0x1a0148a37b8e  <+0x120e>
0x1a0148a37b9c  121c  41bfffffffff         movl r15,0xffffffff
0x1a0148a37ba2  1222  e901efffff           jmp 0x1a0148a36aa8  <+0x128>
0x1a0148a37ba7  1227  4c895dc0             REX.W movq [rbp-0x40],r11
0x1a0148a37bab  122b  e82069edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37bb0  1230  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37bb4  1234  4c8b65d0             REX.W movq r12,[rbp-0x30]
0x1a0148a37bb8  1238  448b5dc0             movl r11,[rbp-0x40]
0x1a0148a37bbc  123c  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37bc0  1240  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37bc8  1248  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37bd0  1250  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37bd8  1258  e92df0ffff           jmp 0x1a0148a36c0a  <+0x28a>
0x1a0148a37bdd  125d  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37be2  1262  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a37be7  1267  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x1a0148a37bee  126e  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x1a0148a37bf5  1275  e8d668edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37bfa  127a  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37bfe  127e  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37c02  1282  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x1a0148a37c07  1287  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x1a0148a37c0f  128f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x1a0148a37c17  1297  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x1a0148a37c1f  129f  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37c24  12a4  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37c29  12a9  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37c31  12b1  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37c39  12b9  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37c41  12c1  448bb510ffffff       movl r14,[rbp-0xf0]
0x1a0148a37c48  12c8  448b8508ffffff       movl r8,[rbp-0xf8]
0x1a0148a37c4f  12cf  8b9500ffffff         movl rdx,[rbp-0x100]
0x1a0148a37c55  12d5  8b85f8feffff         movl rax,[rbp-0x108]
0x1a0148a37c5b  12db  448ba558ffffff       movl r12,[rbp-0xa8]
0x1a0148a37c62  12e2  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x1a0148a37c68  12e8  e9e4f0ffff           jmp 0x1a0148a36d51  <+0x3d1>
0x1a0148a37c6d  12ed  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37c72  12f2  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a37c77  12f7  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x1a0148a37c7e  12fe  4c898d48ffffff       REX.W movq [rbp-0xb8],r9
0x1a0148a37c85  1305  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0x1a0148a37c8c  130c  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x1a0148a37c93  1313  e83868edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37c98  1318  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37c9c  131c  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37ca0  1320  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x1a0148a37ca5  1325  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x1a0148a37cad  132d  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x1a0148a37cb5  1335  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x1a0148a37cbd  133d  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37cc2  1342  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37cc7  1347  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37ccf  134f  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37cd7  1357  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37cdf  135f  448bb510ffffff       movl r14,[rbp-0xf0]
0x1a0148a37ce6  1366  448b8508ffffff       movl r8,[rbp-0xf8]
0x1a0148a37ced  136d  8b9500ffffff         movl rdx,[rbp-0x100]
0x1a0148a37cf3  1373  8b85f8feffff         movl rax,[rbp-0x108]
0x1a0148a37cf9  1379  448ba558ffffff       movl r12,[rbp-0xa8]
0x1a0148a37d00  1380  448b8d48ffffff       movl r9,[rbp-0xb8]
0x1a0148a37d07  1387  488bb550ffffff       REX.W movq rsi,[rbp-0xb0]
0x1a0148a37d0e  138e  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x1a0148a37d14  1394  e9a3f0ffff           jmp 0x1a0148a36dbc  <+0x43c>
0x1a0148a37d19  1399  c441792ee4           vucomisd xmm12,xmm12
0x1a0148a37d1e  139e  0f8b07000000         jpo 0x1a0148a37d2b  <+0x13ab>
0x1a0148a37d24  13a4  33c9                 xorl rcx,rcx
0x1a0148a37d26  13a6  e940f2ffff           jmp 0x1a0148a36f6b  <+0x5eb>
0x1a0148a37d2b  13ab  c4c1782ed3           vucomiss xmm2,xmm11
0x1a0148a37d30  13b0  77f2                 ja 0x1a0148a37d24  <+0x13a4>
0x1a0148a37d32  13b2  b9ffffffff           movl rcx,0xffffffff
0x1a0148a37d37  13b7  e92ff2ffff           jmp 0x1a0148a36f6b  <+0x5eb>
0x1a0148a37d3c  13bc  c441792edb           vucomisd xmm11,xmm11
0x1a0148a37d41  13c1  0f8b08000000         jpo 0x1a0148a37d4f  <+0x13cf>
0x1a0148a37d47  13c7  4533c0               xorl r8,r8
0x1a0148a37d4a  13ca  e9f3f2ffff           jmp 0x1a0148a37042  <+0x6c2>
0x1a0148a37d4f  13cf  c4c1782ed2           vucomiss xmm2,xmm10
0x1a0148a37d54  13d4  77f1                 ja 0x1a0148a37d47  <+0x13c7>
0x1a0148a37d56  13d6  41b8ffffffff         movl r8,0xffffffff
0x1a0148a37d5c  13dc  e9e1f2ffff           jmp 0x1a0148a37042  <+0x6c2>
0x1a0148a37d61  13e1  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x1a0148a37d68  13e8  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37d6d  13ed  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a37d72  13f2  e85967edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37d77  13f7  8b5de0               movl rbx,[rbp-0x20]
0x1a0148a37d7a  13fa  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37d7e  13fe  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37d82  1402  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x1a0148a37d87  1407  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x1a0148a37d8f  140f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x1a0148a37d97  1417  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x1a0148a37d9f  141f  448b8560ffffff       movl r8,[rbp-0xa0]
0x1a0148a37da6  1426  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37dab  142b  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37db0  1430  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37db8  1438  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37dc0  1440  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37dc8  1448  8b9510ffffff         movl rdx,[rbp-0xf0]
0x1a0148a37dce  144e  8b8508ffffff         movl rax,[rbp-0xf8]
0x1a0148a37dd4  1454  448bb500ffffff       movl r14,[rbp-0x100]
0x1a0148a37ddb  145b  448ba5f8feffff       movl r12,[rbp-0x108]
0x1a0148a37de2  1462  448b9d48ffffff       movl r11,[rbp-0xb8]
0x1a0148a37de9  1469  e95ff8ffff           jmp 0x1a0148a3764d  <+0xccd>
0x1a0148a37dee  146e  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x1a0148a37df5  1475  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37dfa  147a  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a37dff  147f  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0x1a0148a37e06  1486  48898d50ffffff       REX.W movq [rbp-0xb0],rcx
0x1a0148a37e0d  148d  e8be66edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37e12  1492  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37e16  1496  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37e1a  149a  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x1a0148a37e1f  149f  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x1a0148a37e27  14a7  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x1a0148a37e2f  14af  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x1a0148a37e37  14b7  448b8560ffffff       movl r8,[rbp-0xa0]
0x1a0148a37e3e  14be  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37e43  14c3  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37e48  14c8  8bb558ffffff         movl rsi,[rbp-0xa8]
0x1a0148a37e4e  14ce  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37e56  14d6  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37e5e  14de  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37e66  14e6  8b9510ffffff         movl rdx,[rbp-0xf0]
0x1a0148a37e6c  14ec  8b8508ffffff         movl rax,[rbp-0xf8]
0x1a0148a37e72  14f2  448bb500ffffff       movl r14,[rbp-0x100]
0x1a0148a37e79  14f9  448ba5f8feffff       movl r12,[rbp-0x108]
0x1a0148a37e80  1500  448b9d48ffffff       movl r11,[rbp-0xb8]
0x1a0148a37e87  1507  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x1a0148a37e8d  150d  e92ef8ffff           jmp 0x1a0148a376c0  <+0xd40>
0x1a0148a37e92  1512  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x1a0148a37e99  1519  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x1a0148a37e9e  151e  c57b115db0           vmovsd [rbp-0x50],xmm11
0x1a0148a37ea3  1523  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0x1a0148a37eaa  152a  4c898d50ffffff       REX.W movq [rbp-0xb0],r9
0x1a0148a37eb1  1531  e81a66edff           call 0x1a014890e4d0  (jump table)
0x1a0148a37eb6  1536  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x1a0148a37eba  153a  c5e857d2             vxorps xmm2,xmm2,xmm2
0x1a0148a37ebe  153e  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x1a0148a37ec3  1543  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x1a0148a37ecb  154b  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x1a0148a37ed3  1553  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x1a0148a37edb  155b  448b8560ffffff       movl r8,[rbp-0xa0]
0x1a0148a37ee2  1562  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x1a0148a37ee7  1567  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x1a0148a37eec  156c  8bb558ffffff         movl rsi,[rbp-0xa8]
0x1a0148a37ef2  1572  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x1a0148a37efa  157a  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x1a0148a37f02  1582  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x1a0148a37f0a  158a  8b9510ffffff         movl rdx,[rbp-0xf0]
0x1a0148a37f10  1590  8b8508ffffff         movl rax,[rbp-0xf8]
0x1a0148a37f16  1596  448bb500ffffff       movl r14,[rbp-0x100]
0x1a0148a37f1d  159d  448ba5f8feffff       movl r12,[rbp-0x108]
0x1a0148a37f24  15a4  448b8d50ffffff       movl r9,[rbp-0xb0]
0x1a0148a37f2b  15ab  448b9d48ffffff       movl r11,[rbp-0xb8]
0x1a0148a37f32  15b2  e9def7ffff           jmp 0x1a0148a37715  <+0xd95>
0x1a0148a37f37  15b7  e8c462edff           call 0x1a014890e200  (jump table)
0x1a0148a37f3c  15bc  e8bf62edff           call 0x1a014890e200  (jump table)
0x1a0148a37f41  15c1  90                   nop
0x1a0148a37f42  15c2  6690                 nop

Protected instructions:
 pc offset
        31         
        3b         
        45         
        4a         
       12e         
       133         
       138         
       14e         
       156         
       16e         
       1c9         
       1ce         
       1d3         
       1d8         
       21a         
       21f         
       224         
       229         
       28a         
       29f         
       2b4         
       2c6         
       2d8         
       2e1         
       2e6         
       2ef         
       2f4         
       304         
       30a         
       313         
       457         
       461         
       48e         
       493         
       50a         
       52a         
       54c         
       55f         
       6eb         
       712         
       718         
       723         
       755         
       796         
       79c         
       7a7         
       7d9         
       81f         
       826         
       832         
       867         
       8ba         
       8c2         
       8cf         
       904         
       940         
       948         
       955         
       98a         
       9cb         
       9d2         
       9de         
       a13         
       a62         
       a69         
       a76         
       aa9         
       ad3         
       ada         
       ae7         
       b1a         
       b47         
       b4f         
       b5c         
       b91         
       b9d         
       ba2         
       ba7         
       bab         
       bb0         
       bb4         
       bb9         
       bc5         
       bd1         
       bdd         
       be9         
       bf5         
       c01         
       c0d         
       c19         
       c25         
       c31         
       c3d         
       c4c         
       cd2         
       cde         
       d44         
       d5d         
       d76         
       d99         
       dc5         
       dcf         
       dfc         
       e01         
       e9f         
       eab         
       ede         
       ef8         
       f78         
       fcd         
       feb         
      1074         
      1090         
      10b6         
      10d8         
      1177         
      117e         
      1184         
      118b         
      1191         
      1198         
      119f         
      11a6         
      11ad         
      11b4         
      11bb         
      11c2         
      11c9         
      11d5         

Source positions:
 pc offset  position
        31        61
        3b        69
        45        77
        4a        90
       12e       144
       133       151
       138       158
       14e       179
       156       187
       16e       199
       17b       217
       1c9       237
       1ce       244
       1d3       251
       1d8       258
       21a       309
       21f       316
       224       323
       229       330
       28a       361
       29f       373
       2b4       385
       2c6       397
       2d8       407
       2e1       420
       2e6       427
       2ef       435
       2f4       442
       304       450
       30a       457
       313       465
       457       582
       461       598
       48e       637
       493       644
       506       751
       52a       764
       54c       775
       55f       809
       6eb       968
       712      1015
       718      1028
       723      1040
       755      1057
       796      1135
       79c      1148
       7a7      1160
       7d9      1177
       81f      1258
       826      1271
       832      1283
       867      1300
       8ba      1381
       8c2      1394
       8cf      1406
       904      1423
       940      1496
       948      1509
       955      1521
       98a      1538
       9cb      1611
       9d2      1624
       9de      1636
       a13      1653
       a62      1737
       a69      1750
       a76      1762
       aa9      1779
       ad3      1852
       ada      1865
       ae7      1877
       b1a      1894
       b47      1967
       b4f      1980
       b5c      1992
       b91      2009
       b9a      2025
       ba2      2032
       ba7      2039
       bab      2046
       bb0      2053
       bb4      2060
       bb9      2067
       bbe      2074
       bca      2081
       bd6      2088
       be2      2095
       bee      2102
       bfa      2109
       c06      2116
       c12      2123
       c1e      2130
       c2a      2137
       c36      2144
       c42      2156
       cd2      2223
       cde      2233
       d44      2269
       dc5      2303
       dcf      2315
       dfc      2369
       e01      2376
       e9b      2543
       eab      2550
       ede      2587
       ef8      2605
       f78      2694
       f91      2703
       fac      2713
       fc5      2731
       feb      2743
      1074      2854
      1090      2875
      10b6      2894
      10d8      2913
      113d      2506
      1156      2492
      1177      2933
      117e      2943
      1184      2947
      118b      2955
      1191      2961
      1198      2971
      119f      2975
      11a6      2983
      11ad      2989
      11b4      2999
      11bb      3003
      11c2      3011
      11c9      3019
      11d5      3026
      11eb         0
      1227       353
      125d       528
      12ed       543
      13e1      2209
      146e      2246
      1512      2256
      15b7      2498
      15bc      2512

Safepoints (stack slots = 46, entries = 1, byte size = 20)
0x1a0148a36b00    180  slots (sp->fp): 0000000000000000000000000000000000000000000000

RelocInfo (size = 39)
0x1a0148a36afc  internal wasm call
0x1a0148a37928  internal wasm call
0x1a0148a37941  internal wasm call
0x1a0148a37ac7  internal wasm call
0x1a0148a37ae0  internal wasm call
0x1a0148a37b70  wasm stub call  (0x1a014890e4d0)
0x1a0148a37bac  wasm stub call  (0x1a014890e4d0)
0x1a0148a37bf6  wasm stub call  (0x1a014890e4d0)
0x1a0148a37c94  wasm stub call  (0x1a014890e4d0)
0x1a0148a37d73  wasm stub call  (0x1a014890e4d0)
0x1a0148a37e0e  wasm stub call  (0x1a014890e4d0)
0x1a0148a37eb2  wasm stub call  (0x1a014890e4d0)
0x1a0148a37f38  wasm stub call  (0x1a014890e200)
0x1a0148a37f3d  wasm stub call  (0x1a014890e200)
