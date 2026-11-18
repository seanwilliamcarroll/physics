name: _RNvMs0_NtCskbGeSEnUfEA_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 5632 = 5592 + 40 padding)
Instructions (size = 5572)
0x35d3e841a580     0  55                   push rbp
0x35d3e841a581     1  4889e5               REX.W movq rbp,rsp
0x35d3e841a584     4  6a08                 push 0x8
0x35d3e841a586     6  56                   push rsi
0x35d3e841a587     7  4881ec50010000       REX.W subq rsp,0x150
0x35d3e841a58e     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x35d3e841a592    12  48897dd8             REX.W movq [rbp-0x28],rdi
0x35d3e841a596    16  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841a59a    1a  0f86cb110000         jna 0x35d3e841b76b  <+0x11eb>
0x35d3e841a5a0    20  4c8b462f             REX.W movq r8,[rsi+0x2f]
0x35d3e841a5a4    24  458b18               movl r11,[r8]
0x35d3e841a5a7    27  4183eb50             subl r11,0x50
0x35d3e841a5ab    2b  458918               movl [r8],r11
0x35d3e841a5ae    2e  448be0               movl r12,rax
0x35d3e841a5b1    31  c4a17a108427ac000000 vmovss xmm0,[rdi+r12*1+0xac]
0x35d3e841a5bb    3b  c4a17a109427a8000000 vmovss xmm2,[rdi+r12*1+0xa8]
0x35d3e841a5c5    45  428b4c2708           movl rcx,[rdi+r12*1+0x8]
0x35d3e841a5ca    4a  460fb6bc27b8000000   movzxbl r15,[rdi+r12*1+0xb8]
0x35d3e841a5d3    53  4c8945e8             REX.W movq [rbp-0x18],r8
0x35d3e841a5d7    57  4c895de0             REX.W movq [rbp-0x20],r11
0x35d3e841a5db    5b  4c8965d0             REX.W movq [rbp-0x30],r12
0x35d3e841a5df    5f  c5fb1145c0           vmovsd [rbp-0x40],xmm0
0x35d3e841a5e4    64  c5fb119528ffffff     vmovsd [rbp-0xd8],xmm2
0x35d3e841a5ec    6c  48894dc8             REX.W movq [rbp-0x38],rcx
0x35d3e841a5f0    70  4280bc27b800000000   cmpb [rdi+r12*1+0xb8],0x0
0x35d3e841a5f9    79  0f8534010000         jnz 0x35d3e841a733  <+0x1b3>
0x35d3e841a5ff    7f  41ba0020803f         movl r10,0x3f802000
0x35d3e841a605    85  c4c1796eda           vmovd xmm3,r10
0x35d3e841a60a    8a  c5e259d8             vmulss xmm3,xmm3,xmm0
0x35d3e841a60e    8e  c5ea5edb             vdivss xmm3,xmm2,xmm3
0x35d3e841a612    92  c5f828db             vmovaps xmm3,xmm3
0x35d3e841a616    96  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0x35d3e841a61c    9c  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e841a620    a0  c5f82edc             vucomiss xmm3,xmm4
0x35d3e841a624    a4  0f8308000000         jnc 0x35d3e841a632  <+0xb2>
0x35d3e841a62a    aa  4533ff               xorl r15,r15
0x35d3e841a62d    ad  e908010000           jmp 0x35d3e841a73a  <+0x1ba>
0x35d3e841a632    b2  41ba0000804f         movl r10,0x4f800000
0x35d3e841a638    b8  c4c1796eea           vmovd xmm5,r10
0x35d3e841a63d    bd  c5f82eeb             vucomiss xmm5,xmm3
0x35d3e841a641    c1  0f8708000000         ja 0x35d3e841a64f  <+0xcf>
0x35d3e841a647    c7  4533ff               xorl r15,r15
0x35d3e841a64a    ca  e9eb000000           jmp 0x35d3e841a73a  <+0x1ba>
0x35d3e841a64f    cf  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x35d3e841a653    d3  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x35d3e841a659    d9  c57b2cfe             vcvttsd2si r15,xmm6
0x35d3e841a65d    dd  4585ff               testl r15,r15
0x35d3e841a660    e0  0f892a000000         jns 0x35d3e841a690  <+0x110>
0x35d3e841a666    e6  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x35d3e841a670    f0  c441f96efa           vmovq xmm15,r10
0x35d3e841a675    f5  c50358fe             vaddsd xmm15,xmm15,xmm6
0x35d3e841a679    f9  c4417b2cff           vcvttsd2si r15,xmm15
0x35d3e841a67e    fe  4585ff               testl r15,r15
0x35d3e841a681   101  0f8809000000         js 0x35d3e841a690  <+0x110>
0x35d3e841a687   107  41ba00000080         movl r10,0x80000000
0x35d3e841a68d   10d  450bfa               orl r15,r10
0x35d3e841a690   110  458bd7               movl r10,r15
0x35d3e841a693   113  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x35d3e841a698   118  c5f92efe             vucomisd xmm7,xmm6
0x35d3e841a69c   11c  0f8ae2100000         jpe 0x35d3e841b784  <+0x1204>
0x35d3e841a6a2   122  0f85dc100000         jnz 0x35d3e841b784  <+0x1204>
0x35d3e841a6a8   128  4183ff03             cmpl r15,0x3
0x35d3e841a6ac   12c  7299                 jc 0x35d3e841a647  <+0xc7>
0x35d3e841a6ae   12e  468b4c2714           movl r9,[rdi+r12*1+0x14]
0x35d3e841a6b3   133  428b5c2710           movl rbx,[rdi+r12*1+0x10]
0x35d3e841a6b8   138  428b542704           movl rdx,[rdi+r12*1+0x4]
0x35d3e841a6bd   13d  41be00040000         movl r14,0x400
0x35d3e841a6c3   143  4181ff00040000       cmpl r15,0x400
0x35d3e841a6ca   14a  450f42f7             cmovcl r14,r15
0x35d3e841a6ce   14e  4689b4278c000000     movl [rdi+r12*1+0x8c],r14
0x35d3e841a6d6   156  4689b42788000000     movl [rdi+r12*1+0x88],r14
0x35d3e841a6de   15e  458bd6               movl r10,r14
0x35d3e841a6e1   161  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0x35d3e841a6e6   166  c5e25eda             vdivss xmm3,xmm3,xmm2
0x35d3e841a6ea   16a  c5f828db             vmovaps xmm3,xmm3
0x35d3e841a6ee   16e  c4a17a119c2784000000 vmovss [rdi+r12*1+0x84],xmm3
0x35d3e841a6f8   178  83c060               addl rax,0x60
0x35d3e841a6fb   17b  e8f875edff           call 0x35d3e82f1cf8  (jump table)
0x35d3e841a700   180  c5fb1045c0           vmovsd xmm0,[rbp-0x40]
0x35d3e841a705   185  41bf01000000         movl r15,0x1
0x35d3e841a70b   18b  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x35d3e841a70f   18f  448b5de0             movl r11,[rbp-0x20]
0x35d3e841a713   193  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841a717   197  4c8b65d0             REX.W movq r12,[rbp-0x30]
0x35d3e841a71b   19b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841a71f   19f  8b4dc8               movl rcx,[rbp-0x38]
0x35d3e841a722   1a2  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e841a726   1a6  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0x35d3e841a72e   1ae  e907000000           jmp 0x35d3e841a73a  <+0x1ba>
0x35d3e841a733   1b3  4533ff               xorl r15,r15
0x35d3e841a736   1b6  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e841a73a   1ba  4c89bdd8feffff       REX.W movq [rbp-0x128],r15
0x35d3e841a741   1c1  85c9                 testl rcx,rcx
0x35d3e841a743   1c3  0f84ae0f0000         jz 0x35d3e841b6f7  <+0x1177>
0x35d3e841a749   1c9  468b74275c           movl r14,[rdi+r12*1+0x5c]
0x35d3e841a74e   1ce  428b442750           movl rax,[rdi+r12*1+0x50]
0x35d3e841a753   1d3  428b5c2744           movl rbx,[rdi+r12*1+0x44]
0x35d3e841a758   1d8  428b542738           movl rdx,[rdi+r12*1+0x38]
0x35d3e841a75d   1dd  448bca               movl r9,rdx
0x35d3e841a760   1e0  3bda                 cmpl rbx,rdx
0x35d3e841a762   1e2  440f42cb             cmovcl r9,rbx
0x35d3e841a766   1e6  418bd9               movl rbx,r9
0x35d3e841a769   1e9  413bc1               cmpl rax,r9
0x35d3e841a76c   1ec  0f42d8               cmovcl rbx,rax
0x35d3e841a76f   1ef  448bcb               movl r9,rbx
0x35d3e841a772   1f2  443bf3               cmpl r14,rbx
0x35d3e841a775   1f5  450f42ce             cmovcl r9,r14
0x35d3e841a779   1f9  41ba000000bf         movl r10,0xbf000000
0x35d3e841a77f   1ff  c4c1796eda           vmovd xmm3,r10
0x35d3e841a784   204  c5e259da             vmulss xmm3,xmm3,xmm2
0x35d3e841a788   208  c5d176ed             vpcmpeqd xmm5,xmm5,xmm5
0x35d3e841a78c   20c  c5d172f51a           vpslld xmm5,xmm5,26
0x35d3e841a791   211  c5d172d502           vpsrld xmm5,xmm5,2
0x35d3e841a796   216  c5d259ea             vmulss xmm5,xmm5,xmm2
0x35d3e841a79a   21a  468b742758           movl r14,[rdi+r12*1+0x58]
0x35d3e841a79f   21f  428b5c274c           movl rbx,[rdi+r12*1+0x4c]
0x35d3e841a7a4   224  428b442740           movl rax,[rdi+r12*1+0x40]
0x35d3e841a7a9   229  428b542734           movl rdx,[rdi+r12*1+0x34]
0x35d3e841a7ae   22e  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x35d3e841a7b2   232  4c894d88             REX.W movq [rbp-0x78],r9
0x35d3e841a7b6   236  c5fb119d20ffffff     vmovsd [rbp-0xe0],xmm3
0x35d3e841a7be   23e  c5fb11ad18ffffff     vmovsd [rbp-0xe8],xmm5
0x35d3e841a7c6   246  4c8975a8             REX.W movq [rbp-0x58],r14
0x35d3e841a7ca   24a  48895da0             REX.W movq [rbp-0x60],rbx
0x35d3e841a7ce   24e  48894598             REX.W movq [rbp-0x68],rax
0x35d3e841a7d2   252  48895590             REX.W movq [rbp-0x70],rdx
0x35d3e841a7d6   256  c5fb118530ffffff     vmovsd [rbp-0xd0],xmm0
0x35d3e841a7de   25e  4533db               xorl r11,r11
0x35d3e841a7e1   261  c57928fa             vmovapd xmm15,xmm2
0x35d3e841a7e5   265  c5f928d4             vmovapd xmm2,xmm4
0x35d3e841a7e9   269  c4c17928e7           vmovapd xmm4,xmm15
0x35d3e841a7ee   26e  660f1f840000000000   nop
0x35d3e841a7f7   277  660f1f840000000000   nop
0x35d3e841a800   280  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841a804   284  0f869d0f0000         jna 0x35d3e841b7a7  <+0x1227>
0x35d3e841a80a   28a  468b742708           movl r14,[rdi+r12*1+0x8]
0x35d3e841a80f   28f  4c89b5c0feffff       REX.W movq [rbp-0x140],r14
0x35d3e841a816   296  453bf3               cmpl r14,r11
0x35d3e841a819   299  0f86880e0000         jna 0x35d3e841b6a7  <+0x1127>
0x35d3e841a81f   29f  428b5c2714           movl rbx,[rdi+r12*1+0x14]
0x35d3e841a824   2a4  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x35d3e841a82b   2ab  413bdb               cmpl rbx,r11
0x35d3e841a82e   2ae  0f86730e0000         jna 0x35d3e841b6a7  <+0x1127>
0x35d3e841a834   2b4  428b742720           movl rsi,[rdi+r12*1+0x20]
0x35d3e841a839   2b9  488975b0             REX.W movq [rbp-0x50],rsi
0x35d3e841a83d   2bd  413bf3               cmpl rsi,r11
0x35d3e841a840   2c0  0f86610e0000         jna 0x35d3e841b6a7  <+0x1127>
0x35d3e841a846   2c6  468b4c272c           movl r9,[rdi+r12*1+0x2c]
0x35d3e841a84b   2cb  4c894db8             REX.W movq [rbp-0x48],r9
0x35d3e841a84f   2cf  453bcb               cmpl r9,r11
0x35d3e841a852   2d2  0f864f0e0000         jna 0x35d3e841b6a7  <+0x1127>
0x35d3e841a858   2d8  468b442704           movl r8,[rdi+r12*1+0x4]
0x35d3e841a85d   2dd  438d0498             leal rax,[r8+r11*4]
0x35d3e841a861   2e1  c5fa103407           vmovss xmm6,[rdi+rax*1]
0x35d3e841a866   2e6  428b442728           movl rax,[rdi+r12*1+0x28]
0x35d3e841a86b   2eb  428d1498             leal rdx,[rax+r11*4]
0x35d3e841a86f   2ef  c5fa103c17           vmovss xmm7,[rdi+rdx*1]
0x35d3e841a874   2f4  428b54271c           movl rdx,[rdi+r12*1+0x1c]
0x35d3e841a879   2f9  4c898510ffffff       REX.W movq [rbp-0xf0],r8
0x35d3e841a880   300  468d049a             leal r8,[rdx+r11*4]
0x35d3e841a884   304  c4217a100407         vmovss xmm8,[rdi+r8*1]
0x35d3e841a88a   30a  468b442710           movl r8,[rdi+r12*1+0x10]
0x35d3e841a88f   30f  478d2498             leal r12,[r8+r11*4]
0x35d3e841a893   313  c4217a100c27         vmovss xmm9,[rdi+r12*1]
0x35d3e841a899   319  4c895dc0             REX.W movq [rbp-0x40],r11
0x35d3e841a89d   31d  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0x35d3e841a8a5   325  488985f8feffff       REX.W movq [rbp-0x108],rax
0x35d3e841a8ac   32c  c5fb11bd78ffffff     vmovsd [rbp-0x88],xmm7
0x35d3e841a8b4   334  48899500ffffff       REX.W movq [rbp-0x100],rdx
0x35d3e841a8bb   33b  c57b118568ffffff     vmovsd [rbp-0x98],xmm8
0x35d3e841a8c3   343  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0x35d3e841a8ca   34a  c57b114d80           vmovsd [rbp-0x80],xmm9
0x35d3e841a8cf   34f  83bdd8feffff00       cmpl [rbp-0x128],0x0
0x35d3e841a8d6   356  0f85aa010000         jnz 0x35d3e841aa86  <+0x506>
0x35d3e841a8dc   35c  448be3               movl r12,rbx
0x35d3e841a8df   35f  443bf3               cmpl r14,rbx
0x35d3e841a8e2   362  450f42e6             cmovcl r12,r14
0x35d3e841a8e6   366  458bf1               movl r14,r9
0x35d3e841a8e9   369  413bf1               cmpl rsi,r9
0x35d3e841a8ec   36c  440f42f6             cmovcl r14,rsi
0x35d3e841a8f0   370  418bde               movl rbx,r14
0x35d3e841a8f3   373  453be6               cmpl r12,r14
0x35d3e841a8f6   376  410f42dc             cmovcl rbx,r12
0x35d3e841a8fa   37a  c57928d2             vmovapd xmm10,xmm2
0x35d3e841a8fe   37e  c57928da             vmovapd xmm11,xmm2
0x35d3e841a902   382  4531e4               xorl r12,r12
0x35d3e841a905   385  448bb510ffffff       movl r14,[rbp-0xf0]
0x35d3e841a90c   38c  e936000000           jmp 0x35d3e841a947  <+0x3c7>
0x35d3e841a911   391  660f1f840000000000   nop
0x35d3e841a91a   39a  660f1f840000000000   nop
0x35d3e841a923   3a3  660f1f840000000000   nop
0x35d3e841a92c   3ac  660f1f840000000000   nop
0x35d3e841a935   3b5  660f1f840000000000   nop
0x35d3e841a93e   3be  6690                 nop
0x35d3e841a940   3c0  458be1               movl r12,r9
0x35d3e841a943   3c3  c57928d9             vmovapd xmm11,xmm1
0x35d3e841a947   3c7  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841a94b   3cb  0f868c0e0000         jna 0x35d3e841b7dd  <+0x125d>
0x35d3e841a951   3d1  33f6                 xorl rsi,rsi
0x35d3e841a953   3d3  4439e3               cmpl rbx,r12
0x35d3e841a956   3d6  400f96c6             setnal sil
0x35d3e841a95a   3da  4589e1               movl r9,r12
0x35d3e841a95d   3dd  660f1f840000000000   nop
0x35d3e841a966   3e6  660f1f840000000000   nop
0x35d3e841a96f   3ef  660f1f840000000000   nop
0x35d3e841a978   3f8  0f1f840000000000     nop
0x35d3e841a980   400  4183c101             addl r9,0x1
0x35d3e841a984   404  85f6                 testl rsi,rsi
0x35d3e841a986   406  0f843f000000         jz 0x35d3e841a9cb  <+0x44b>
0x35d3e841a98c   40c  443b4dc8             cmpl r9,[rbp-0x38]
0x35d3e841a990   410  0f836c0a0000         jnc 0x35d3e841b402  <+0xe82>
0x35d3e841a996   416  4183c101             addl r9,0x1
0x35d3e841a99a   41a  443b4dc8             cmpl r9,[rbp-0x38]
0x35d3e841a99e   41e  0f835e0a0000         jnc 0x35d3e841b402  <+0xe82>
0x35d3e841a9a4   424  4183c101             addl r9,0x1
0x35d3e841a9a8   428  443b4dc8             cmpl r9,[rbp-0x38]
0x35d3e841a9ac   42c  0f83500a0000         jnc 0x35d3e841b402  <+0xe82>
0x35d3e841a9b2   432  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841a9b6   436  0f86b10e0000         jna 0x35d3e841b86d  <+0x12ed>
0x35d3e841a9bc   43c  4183c101             addl r9,0x1
0x35d3e841a9c0   440  443b4dc8             cmpl r9,[rbp-0x38]
0x35d3e841a9c4   444  72ba                 jc 0x35d3e841a980  <+0x400>
0x35d3e841a9c6   446  e9370a0000           jmp 0x35d3e841b402  <+0xe82>
0x35d3e841a9cb   44b  428d34a0             leal rsi,[rax+r12*4]
0x35d3e841a9cf   44f  468d1ca2             leal r11,[rdx+r12*4]
0x35d3e841a9d3   453  478d3ca0             leal r15,[r8+r12*4]
0x35d3e841a9d7   457  c4217a10243f         vmovss xmm12,[rdi+r15*1]
0x35d3e841a9dd   45d  478d24a6             leal r12,[r14+r12*4]
0x35d3e841a9e1   461  c4214a5c2c27         vsubss xmm13,xmm6,[rdi+r12*1]
0x35d3e841a9e7   467  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0x35d3e841a9ef   46f  0f8715000000         ja 0x35d3e841aa0a  <+0x48a>
0x35d3e841a9f5   475  c4c1782edd           vucomiss xmm3,xmm13
0x35d3e841a9fa   47a  0f860e000000         jna 0x35d3e841aa0e  <+0x48e>
0x35d3e841aa00   480  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x35d3e841aa05   485  e904000000           jmp 0x35d3e841aa0e  <+0x48e>
0x35d3e841aa0a   48a  c5125cec             vsubss xmm13,xmm13,xmm4
0x35d3e841aa0e   48e  c57a103437           vmovss xmm14,[rdi+rsi*1]
0x35d3e841aa13   493  c4a17a100c1f         vmovss xmm1,[rdi+r11*1]
0x35d3e841aa19   499  c441325ce4           vsubss xmm12,xmm9,xmm12
0x35d3e841aa1e   49e  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0x35d3e841aa26   4a6  0f8715000000         ja 0x35d3e841aa41  <+0x4c1>
0x35d3e841aa2c   4ac  c4c1782edc           vucomiss xmm3,xmm12
0x35d3e841aa31   4b1  0f860e000000         jna 0x35d3e841aa45  <+0x4c5>
0x35d3e841aa37   4b7  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x35d3e841aa3c   4bc  e904000000           jmp 0x35d3e841aa45  <+0x4c5>
0x35d3e841aa41   4c1  c51a5ce4             vsubss xmm12,xmm12,xmm4
0x35d3e841aa45   4c5  c4c17258cb           vaddss xmm1,xmm1,xmm11
0x35d3e841aa4a   4ca  c4411259ed           vmulss xmm13,xmm13,xmm13
0x35d3e841aa4f   4cf  c4411a59e4           vmulss xmm12,xmm12,xmm12
0x35d3e841aa54   4d4  c4411a58e5           vaddss xmm12,xmm12,xmm13
0x35d3e841aa59   4d9  c4c1782ec4           vucomiss xmm0,xmm12
0x35d3e841aa5e   4de  0f870a000000         ja 0x35d3e841aa6e  <+0x4ee>
0x35d3e841aa64   4e4  c4c17928cb           vmovapd xmm1,xmm11
0x35d3e841aa69   4e9  e905000000           jmp 0x35d3e841aa73  <+0x4f3>
0x35d3e841aa6e   4ee  c4410a58d2           vaddss xmm10,xmm14,xmm10
0x35d3e841aa73   4f3  443b4dc8             cmpl r9,[rbp-0x38]
0x35d3e841aa77   4f7  0f82c3feffff         jc 0x35d3e841a940  <+0x3c0>
0x35d3e841aa7d   4fd  c57928d9             vmovapd xmm11,xmm1
0x35d3e841aa81   501  e97c090000           jmp 0x35d3e841b402  <+0xe82>
0x35d3e841aa86   506  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x35d3e841aa8a   50a  468b9c3f8c000000     movl r11,[rdi+r15*1+0x8c]
0x35d3e841aa92   512  33c9                 xorl rcx,rcx
0x35d3e841aa94   514  4585db               testl r11,r11
0x35d3e841aa97   517  0f94c1               setzl cl
0x35d3e841aa9a   51a  448ba510ffffff       movl r12,[rbp-0xf0]
0x35d3e841aaa1   521  4585db               testl r11,r11
0x35d3e841aaa4   524  0f84130c0000         jz 0x35d3e841b6bd  <+0x113d>
0x35d3e841aaaa   52a  468ba43f88000000     movl r12,[rdi+r15*1+0x88]
0x35d3e841aab2   532  4533c0               xorl r8,r8
0x35d3e841aab5   535  4585e4               testl r12,r12
0x35d3e841aab8   538  410f94c0             setzl r8l
0x35d3e841aabc   53c  4c89a5c8feffff       REX.W movq [rbp-0x138],r12
0x35d3e841aac3   543  4585e4               testl r12,r12
0x35d3e841aac6   546  0f840a0c0000         jz 0x35d3e841b6d6  <+0x1156>
0x35d3e841aacc   54c  428b743f64           movl rsi,[rdi+r15*1+0x64]
0x35d3e841aad1   551  85c9                 testl rcx,rcx
0x35d3e841aad3   553  0f94c1               setzl cl
0x35d3e841aad6   556  0fb6c9               movzxbl rcx,rcx
0x35d3e841aad9   559  458bcb               movl r9,r11
0x35d3e841aadc   55c  442bc9               subl r9,rcx
0x35d3e841aadf   55f  c4217a10943f84000000 vmovss xmm10,[rdi+r15*1+0x84]
0x35d3e841aae9   569  c4413259da           vmulss xmm11,xmm9,xmm10
0x35d3e841aaee   56e  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0x35d3e841aaf4   574  c441782edb           vucomiss xmm11,xmm11
0x35d3e841aaf9   579  7a06                 jpe 0x35d3e841ab01  <+0x581>
0x35d3e841aafb   57b  0f8404000000         jz 0x35d3e841ab05  <+0x585>
0x35d3e841ab01   581  c57928da             vmovapd xmm11,xmm2
0x35d3e841ab05   585  c5782eda             vucomiss xmm11,xmm2
0x35d3e841ab09   589  0f8704000000         ja 0x35d3e841ab13  <+0x593>
0x35d3e841ab0f   58f  c57928da             vmovapd xmm11,xmm2
0x35d3e841ab13   593  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0x35d3e841ab18   598  c443110bec0b         vroundsd xmm13,xmm13,xmm12,0xb
0x35d3e841ab1e   59e  c4c17b2ccd           vcvttsd2si rcx,xmm13
0x35d3e841ab23   5a3  85c9                 testl rcx,rcx
0x35d3e841ab25   5a5  0f8927000000         jns 0x35d3e841ab52  <+0x5d2>
0x35d3e841ab2b   5ab  4c8b1536fbffff       REX.W movq r10,[rip+0xfffffb36]
0x35d3e841ab32   5b2  c441f96efa           vmovq xmm15,r10
0x35d3e841ab37   5b7  c4410358fd           vaddsd xmm15,xmm15,xmm13
0x35d3e841ab3c   5bc  c4c17b2ccf           vcvttsd2si rcx,xmm15
0x35d3e841ab41   5c1  85c9                 testl rcx,rcx
0x35d3e841ab43   5c3  0f8809000000         js 0x35d3e841ab52  <+0x5d2>
0x35d3e841ab49   5c9  41ba00000080         movl r10,0x80000000
0x35d3e841ab4f   5cf  410bca               orl rcx,r10
0x35d3e841ab52   5d2  448bd1               movl r10,rcx
0x35d3e841ab55   5d5  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0x35d3e841ab5a   5da  c441792ef5           vucomisd xmm14,xmm13
0x35d3e841ab5f   5df  0f8ab40d0000         jpe 0x35d3e841b919  <+0x1399>
0x35d3e841ab65   5e5  0f85ae0d0000         jnz 0x35d3e841b919  <+0x1399>
0x35d3e841ab6b   5eb  448bf1               movl r14,rcx
0x35d3e841ab6e   5ee  443bc9               cmpl r9,rcx
0x35d3e841ab71   5f1  450f42f1             cmovcl r14,r9
0x35d3e841ab75   5f5  41ba0000804f         movl r10,0x4f800000
0x35d3e841ab7b   5fb  c441796ee2           vmovd xmm12,r10
0x35d3e841ab80   600  33c9                 xorl rcx,rcx
0x35d3e841ab82   602  c441782ee3           vucomiss xmm12,xmm11
0x35d3e841ab87   607  410f47ce             cmoval rcx,r14
0x35d3e841ab8b   60b  458d340b             leal r14,[r11+rcx*1]
0x35d3e841ab8f   60f  418d4eff             leal rcx,[r14-0x1]
0x35d3e841ab93   613  448bd1               movl r10,rcx
0x35d3e841ab96   616  8bc8                 movl rcx,rax
0x35d3e841ab98   618  418bc2               movl rax,r10
0x35d3e841ab9b   61b  448bca               movl r9,rdx
0x35d3e841ab9e   61e  33d2                 xorl rdx,rdx
0x35d3e841aba0   620  41f7f3               divl r11
0x35d3e841aba3   623  410fafd4             imull rdx,r12
0x35d3e841aba7   627  4585c0               testl r8,r8
0x35d3e841abaa   62a  410f94c0             setzl r8l
0x35d3e841abae   62e  450fb6c0             movzxbl r8,r8
0x35d3e841abb2   632  4489e0               movl rax,r12
0x35d3e841abb5   635  412bc0               subl rax,r8
0x35d3e841abb8   638  c52a59d6             vmulss xmm10,xmm10,xmm6
0x35d3e841abbc   63c  c443290ad209         vroundss xmm10,xmm10,xmm10,0x9
0x35d3e841abc2   642  4c89b558ffffff       REX.W movq [rbp-0xa8],r14
0x35d3e841abc9   649  c441782ed2           vucomiss xmm10,xmm10
0x35d3e841abce   64e  7a06                 jpe 0x35d3e841abd6  <+0x656>
0x35d3e841abd0   650  0f8404000000         jz 0x35d3e841abda  <+0x65a>
0x35d3e841abd6   656  c57928d2             vmovapd xmm10,xmm2
0x35d3e841abda   65a  c5782ed2             vucomiss xmm10,xmm2
0x35d3e841abde   65e  0f8704000000         ja 0x35d3e841abe8  <+0x668>
0x35d3e841abe4   664  c57928d2             vmovapd xmm10,xmm2
0x35d3e841abe8   668  c4412a5ada           vcvtss2sd xmm11,xmm10,xmm10
0x35d3e841abed   66d  c443110beb0b         vroundsd xmm13,xmm13,xmm11,0xb
0x35d3e841abf3   673  c4417b2cc5           vcvttsd2si r8,xmm13
0x35d3e841abf8   678  4585c0               testl r8,r8
0x35d3e841abfb   67b  0f8928000000         jns 0x35d3e841ac29  <+0x6a9>
0x35d3e841ac01   681  4c8b1560faffff       REX.W movq r10,[rip+0xfffffa60]
0x35d3e841ac08   688  c441f96efa           vmovq xmm15,r10
0x35d3e841ac0d   68d  c4410358fd           vaddsd xmm15,xmm15,xmm13
0x35d3e841ac12   692  c4417b2cc7           vcvttsd2si r8,xmm15
0x35d3e841ac17   697  4585c0               testl r8,r8
0x35d3e841ac1a   69a  0f8809000000         js 0x35d3e841ac29  <+0x6a9>
0x35d3e841ac20   6a0  41ba00000080         movl r10,0x80000000
0x35d3e841ac26   6a6  450bc2               orl r8,r10
0x35d3e841ac29   6a9  458bd0               movl r10,r8
0x35d3e841ac2c   6ac  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0x35d3e841ac31   6b1  c441792ef5           vucomisd xmm14,xmm13
0x35d3e841ac36   6b6  0f8a000d0000         jpe 0x35d3e841b93c  <+0x13bc>
0x35d3e841ac3c   6bc  0f85fa0c0000         jnz 0x35d3e841b93c  <+0x13bc>
0x35d3e841ac42   6c2  458bc8               movl r9,r8
0x35d3e841ac45   6c5  413bc0               cmpl rax,r8
0x35d3e841ac48   6c8  440f42c8             cmovcl r9,rax
0x35d3e841ac4c   6cc  4533c0               xorl r8,r8
0x35d3e841ac4f   6cf  c441782ee2           vucomiss xmm12,xmm10
0x35d3e841ac54   6d4  450f47c1             cmoval r8,r9
0x35d3e841ac58   6d8  4501e0               addl r8,r12
0x35d3e841ac5b   6db  418d40ff             leal rax,[r8-0x1]
0x35d3e841ac5f   6df  448bca               movl r9,rdx
0x35d3e841ac62   6e2  33d2                 xorl rdx,rdx
0x35d3e841ac64   6e4  41f7f4               divl r12
0x35d3e841ac67   6e7  428d040a             leal rax,[rdx+r9*1]
0x35d3e841ac6b   6eb  428b4c3f68           movl rcx,[rdi+r15*1+0x68]
0x35d3e841ac70   6f0  48899550ffffff       REX.W movq [rbp-0xb0],rdx
0x35d3e841ac77   6f7  3bc1                 cmpl rax,rcx
0x35d3e841ac79   6f9  0f8209000000         jc 0x35d3e841ac88  <+0x708>
0x35d3e841ac7f   6ff  33c0                 xorl rax,rax
0x35d3e841ac81   701  8bd8                 movl rbx,rax
0x35d3e841ac83   703  e94b000000           jmp 0x35d3e841acd3  <+0x753>
0x35d3e841ac88   708  8d5801               leal rbx,[rax+0x1]
0x35d3e841ac8b   70b  3bcb                 cmpl rcx,rbx
0x35d3e841ac8d   70d  76f0                 jna 0x35d3e841ac7f  <+0x6ff>
0x35d3e841ac8f   70f  8d1c9e               leal rbx,[rsi+rbx*4]
0x35d3e841ac92   712  8b1c1f               movl rbx,[rdi+rbx*1]
0x35d3e841ac95   715  8d0486               leal rax,[rsi+rax*4]
0x35d3e841ac98   718  8b0407               movl rax,[rdi+rax*1]
0x35d3e841ac9b   71b  3bd8                 cmpl rbx,rax
0x35d3e841ac9d   71d  0f8223000000         jc 0x35d3e841acc6  <+0x746>
0x35d3e841aca3   723  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x35d3e841acab   72b  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0x35d3e841acb3   733  0f831a000000         jnc 0x35d3e841acd3  <+0x753>
0x35d3e841acb9   739  41be04000000         movl r14,0x4
0x35d3e841acbf   73f  33db                 xorl rbx,rbx
0x35d3e841acc1   741  e918000000           jmp 0x35d3e841acde  <+0x75e>
0x35d3e841acc6   746  33db                 xorl rbx,rbx
0x35d3e841acc8   748  41be04000000         movl r14,0x4
0x35d3e841acce   74e  e90b000000           jmp 0x35d3e841acde  <+0x75e>
0x35d3e841acd3   753  2bd8                 subl rbx,rax
0x35d3e841acd5   755  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x35d3e841acda   75a  458d3486             leal r14,[r14+rax*4]
0x35d3e841acde   75e  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0x35d3e841ace5   765  448bf2               movl r14,rdx
0x35d3e841ace8   768  418bc0               movl rax,r8
0x35d3e841aceb   76b  33d2                 xorl rdx,rdx
0x35d3e841aced   76d  41f7f4               divl r12
0x35d3e841acf0   770  418d0411             leal rax,[r9+rdx*1]
0x35d3e841acf4   774  48899db0feffff       REX.W movq [rbp-0x150],rbx
0x35d3e841acfb   77b  3bc1                 cmpl rax,rcx
0x35d3e841acfd   77d  0f8209000000         jc 0x35d3e841ad0c  <+0x78c>
0x35d3e841ad03   783  33c0                 xorl rax,rax
0x35d3e841ad05   785  8bd8                 movl rbx,rax
0x35d3e841ad07   787  e94b000000           jmp 0x35d3e841ad57  <+0x7d7>
0x35d3e841ad0c   78c  8d5801               leal rbx,[rax+0x1]
0x35d3e841ad0f   78f  3bcb                 cmpl rcx,rbx
0x35d3e841ad11   791  76f0                 jna 0x35d3e841ad03  <+0x783>
0x35d3e841ad13   793  8d1c9e               leal rbx,[rsi+rbx*4]
0x35d3e841ad16   796  8b1c1f               movl rbx,[rdi+rbx*1]
0x35d3e841ad19   799  8d0486               leal rax,[rsi+rax*4]
0x35d3e841ad1c   79c  8b0407               movl rax,[rdi+rax*1]
0x35d3e841ad1f   79f  3bd8                 cmpl rbx,rax
0x35d3e841ad21   7a1  0f8223000000         jc 0x35d3e841ad4a  <+0x7ca>
0x35d3e841ad27   7a7  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x35d3e841ad2f   7af  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0x35d3e841ad37   7b7  0f831a000000         jnc 0x35d3e841ad57  <+0x7d7>
0x35d3e841ad3d   7bd  41be04000000         movl r14,0x4
0x35d3e841ad43   7c3  33db                 xorl rbx,rbx
0x35d3e841ad45   7c5  e918000000           jmp 0x35d3e841ad62  <+0x7e2>
0x35d3e841ad4a   7ca  33db                 xorl rbx,rbx
0x35d3e841ad4c   7cc  41be04000000         movl r14,0x4
0x35d3e841ad52   7d2  e90b000000           jmp 0x35d3e841ad62  <+0x7e2>
0x35d3e841ad57   7d7  2bd8                 subl rbx,rax
0x35d3e841ad59   7d9  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x35d3e841ad5e   7de  458d3486             leal r14,[r14+rax*4]
0x35d3e841ad62   7e2  418d4001             leal rax,[r8+0x1]
0x35d3e841ad66   7e6  448bc2               movl r8,rdx
0x35d3e841ad69   7e9  33d2                 xorl rdx,rdx
0x35d3e841ad6b   7eb  41f7f4               divl r12
0x35d3e841ad6e   7ee  418d0411             leal rax,[r9+rdx*1]
0x35d3e841ad72   7f2  4c89b5a8feffff       REX.W movq [rbp-0x158],r14
0x35d3e841ad79   7f9  48899da0feffff       REX.W movq [rbp-0x160],rbx
0x35d3e841ad80   800  3bc1                 cmpl rax,rcx
0x35d3e841ad82   802  0f820a000000         jc 0x35d3e841ad92  <+0x812>
0x35d3e841ad88   808  33c0                 xorl rax,rax
0x35d3e841ad8a   80a  448bc8               movl r9,rax
0x35d3e841ad8d   80d  e952000000           jmp 0x35d3e841ade4  <+0x864>
0x35d3e841ad92   812  448d4801             leal r9,[rax+0x1]
0x35d3e841ad96   816  413bc9               cmpl rcx,r9
0x35d3e841ad99   819  76ed                 jna 0x35d3e841ad88  <+0x808>
0x35d3e841ad9b   81b  468d0c8e             leal r9,[rsi+r9*4]
0x35d3e841ad9f   81f  468b0c0f             movl r9,[rdi+r9*1]
0x35d3e841ada3   823  8d0486               leal rax,[rsi+rax*4]
0x35d3e841ada6   826  8b0407               movl rax,[rdi+rax*1]
0x35d3e841ada9   829  443bc8               cmpl r9,rax
0x35d3e841adac   82c  0f8224000000         jc 0x35d3e841add6  <+0x856>
0x35d3e841adb2   832  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0x35d3e841adba   83a  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x35d3e841adc2   842  0f831c000000         jnc 0x35d3e841ade4  <+0x864>
0x35d3e841adc8   848  41be04000000         movl r14,0x4
0x35d3e841adce   84e  4533c9               xorl r9,r9
0x35d3e841add1   851  e91a000000           jmp 0x35d3e841adf0  <+0x870>
0x35d3e841add6   856  4533c9               xorl r9,r9
0x35d3e841add9   859  41be04000000         movl r14,0x4
0x35d3e841addf   85f  e90c000000           jmp 0x35d3e841adf0  <+0x870>
0x35d3e841ade4   864  442bc8               subl r9,rax
0x35d3e841ade7   867  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0x35d3e841adec   86c  458d3486             leal r14,[r14+rax*4]
0x35d3e841adf0   870  8bda                 movl rbx,rdx
0x35d3e841adf2   872  8b8558ffffff         movl rax,[rbp-0xa8]
0x35d3e841adf8   878  33d2                 xorl rdx,rdx
0x35d3e841adfa   87a  41f7f3               divl r11
0x35d3e841adfd   87d  410fafd4             imull rdx,r12
0x35d3e841ae01   881  4c89b5d0feffff       REX.W movq [rbp-0x130],r14
0x35d3e841ae08   888  8b8550ffffff         movl rax,[rbp-0xb0]
0x35d3e841ae0e   88e  448d3410             leal r14,[rax+rdx*1]
0x35d3e841ae12   892  4c898de8feffff       REX.W movq [rbp-0x118],r9
0x35d3e841ae19   899  443bf1               cmpl r14,rcx
0x35d3e841ae1c   89c  0f820b000000         jc 0x35d3e841ae2d  <+0x8ad>
0x35d3e841ae22   8a2  4533c9               xorl r9,r9
0x35d3e841ae25   8a5  458bf1               movl r14,r9
0x35d3e841ae28   8a8  e954000000           jmp 0x35d3e841ae81  <+0x901>
0x35d3e841ae2d   8ad  458d4e01             leal r9,[r14+0x1]
0x35d3e841ae31   8b1  413bc9               cmpl rcx,r9
0x35d3e841ae34   8b4  76ec                 jna 0x35d3e841ae22  <+0x8a2>
0x35d3e841ae36   8b6  468d0c8e             leal r9,[rsi+r9*4]
0x35d3e841ae3a   8ba  468b0c0f             movl r9,[rdi+r9*1]
0x35d3e841ae3e   8be  468d34b6             leal r14,[rsi+r14*4]
0x35d3e841ae42   8c2  468b3437             movl r14,[rdi+r14*1]
0x35d3e841ae46   8c6  453bce               cmpl r9,r14
0x35d3e841ae49   8c9  0f8224000000         jc 0x35d3e841ae73  <+0x8f3>
0x35d3e841ae4f   8cf  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x35d3e841ae57   8d7  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x35d3e841ae5f   8df  0f831c000000         jnc 0x35d3e841ae81  <+0x901>
0x35d3e841ae65   8e5  41bc04000000         movl r12,0x4
0x35d3e841ae6b   8eb  4533c9               xorl r9,r9
0x35d3e841ae6e   8ee  e91a000000           jmp 0x35d3e841ae8d  <+0x90d>
0x35d3e841ae73   8f3  4533c9               xorl r9,r9
0x35d3e841ae76   8f6  41bc04000000         movl r12,0x4
0x35d3e841ae7c   8fc  e90c000000           jmp 0x35d3e841ae8d  <+0x90d>
0x35d3e841ae81   901  452bce               subl r9,r14
0x35d3e841ae84   904  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x35d3e841ae89   909  478d24b4             leal r12,[r12+r14*4]
0x35d3e841ae8d   90d  458d3410             leal r14,[r8+rdx*1]
0x35d3e841ae91   911  4c89a5e0feffff       REX.W movq [rbp-0x120],r12
0x35d3e841ae98   918  4c898df0feffff       REX.W movq [rbp-0x110],r9
0x35d3e841ae9f   91f  443bf1               cmpl r14,rcx
0x35d3e841aea2   922  0f820b000000         jc 0x35d3e841aeb3  <+0x933>
0x35d3e841aea8   928  4531e4               xorl r12,r12
0x35d3e841aeab   92b  4589e6               movl r14,r12
0x35d3e841aeae   92e  e954000000           jmp 0x35d3e841af07  <+0x987>
0x35d3e841aeb3   933  458d6601             leal r12,[r14+0x1]
0x35d3e841aeb7   937  4439e1               cmpl rcx,r12
0x35d3e841aeba   93a  76ec                 jna 0x35d3e841aea8  <+0x928>
0x35d3e841aebc   93c  468d24a6             leal r12,[rsi+r12*4]
0x35d3e841aec0   940  468b2427             movl r12,[rdi+r12*1]
0x35d3e841aec4   944  468d34b6             leal r14,[rsi+r14*4]
0x35d3e841aec8   948  468b3437             movl r14,[rdi+r14*1]
0x35d3e841aecc   94c  453be6               cmpl r12,r14
0x35d3e841aecf   94f  0f8224000000         jc 0x35d3e841aef9  <+0x979>
0x35d3e841aed5   955  468b8c3f80000000     movl r9,[rdi+r15*1+0x80]
0x35d3e841aedd   95d  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0x35d3e841aee5   965  0f831c000000         jnc 0x35d3e841af07  <+0x987>
0x35d3e841aeeb   96b  41bc04000000         movl r12,0x4
0x35d3e841aef1   971  4533f6               xorl r14,r14
0x35d3e841aef4   974  e923000000           jmp 0x35d3e841af1c  <+0x99c>
0x35d3e841aef9   979  4533f6               xorl r14,r14
0x35d3e841aefc   97c  41bc04000000         movl r12,0x4
0x35d3e841af02   982  e915000000           jmp 0x35d3e841af1c  <+0x99c>
0x35d3e841af07   987  452be6               subl r12,r14
0x35d3e841af0a   98a  468b4c3f7c           movl r9,[rdi+r15*1+0x7c]
0x35d3e841af0f   98f  478d34b1             leal r14,[r9+r14*4]
0x35d3e841af13   993  458bd6               movl r10,r14
0x35d3e841af16   996  4589e6               movl r14,r12
0x35d3e841af19   999  458be2               movl r12,r10
0x35d3e841af1c   99c  03d3                 addl rdx,rbx
0x35d3e841af1e   99e  4c89a548ffffff       REX.W movq [rbp-0xb8],r12
0x35d3e841af25   9a5  4c89b538ffffff       REX.W movq [rbp-0xc8],r14
0x35d3e841af2c   9ac  3bd1                 cmpl rdx,rcx
0x35d3e841af2e   9ae  0f820a000000         jc 0x35d3e841af3e  <+0x9be>
0x35d3e841af34   9b4  33d2                 xorl rdx,rdx
0x35d3e841af36   9b6  448bca               movl r9,rdx
0x35d3e841af39   9b9  e952000000           jmp 0x35d3e841af90  <+0xa10>
0x35d3e841af3e   9be  448d4a01             leal r9,[rdx+0x1]
0x35d3e841af42   9c2  413bc9               cmpl rcx,r9
0x35d3e841af45   9c5  76ed                 jna 0x35d3e841af34  <+0x9b4>
0x35d3e841af47   9c7  468d0c8e             leal r9,[rsi+r9*4]
0x35d3e841af4b   9cb  468b0c0f             movl r9,[rdi+r9*1]
0x35d3e841af4f   9cf  8d1496               leal rdx,[rsi+rdx*4]
0x35d3e841af52   9d2  8b1417               movl rdx,[rdi+rdx*1]
0x35d3e841af55   9d5  443bca               cmpl r9,rdx
0x35d3e841af58   9d8  0f8224000000         jc 0x35d3e841af82  <+0xa02>
0x35d3e841af5e   9de  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x35d3e841af66   9e6  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0x35d3e841af6e   9ee  0f831c000000         jnc 0x35d3e841af90  <+0xa10>
0x35d3e841af74   9f4  41bc04000000         movl r12,0x4
0x35d3e841af7a   9fa  4533c9               xorl r9,r9
0x35d3e841af7d   9fd  e91a000000           jmp 0x35d3e841af9c  <+0xa1c>
0x35d3e841af82   a02  4533c9               xorl r9,r9
0x35d3e841af85   a05  41bc04000000         movl r12,0x4
0x35d3e841af8b   a0b  e90c000000           jmp 0x35d3e841af9c  <+0xa1c>
0x35d3e841af90   a10  442bca               subl r9,rdx
0x35d3e841af93   a13  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x35d3e841af98   a18  458d2494             leal r12,[r12+rdx*4]
0x35d3e841af9c   a1c  8b9558ffffff         movl rdx,[rbp-0xa8]
0x35d3e841afa2   a22  83c201               addl rdx,0x1
0x35d3e841afa5   a25  448bf0               movl r14,rax
0x35d3e841afa8   a28  8bc2                 movl rax,rdx
0x35d3e841afaa   a2a  33d2                 xorl rdx,rdx
0x35d3e841afac   a2c  41f7f3               divl r11
0x35d3e841afaf   a2f  448b9dc8feffff       movl r11,[rbp-0x138]
0x35d3e841afb6   a36  440fafda             imull r11,rdx
0x35d3e841afba   a3a  4503f3               addl r14,r11
0x35d3e841afbd   a3d  4c89a540ffffff       REX.W movq [rbp-0xc0],r12
0x35d3e841afc4   a44  443bf1               cmpl r14,rcx
0x35d3e841afc7   a47  0f820a000000         jc 0x35d3e841afd7  <+0xa57>
0x35d3e841afcd   a4d  33c0                 xorl rax,rax
0x35d3e841afcf   a4f  448bf0               movl r14,rax
0x35d3e841afd2   a52  e94f000000           jmp 0x35d3e841b026  <+0xaa6>
0x35d3e841afd7   a57  418d4601             leal rax,[r14+0x1]
0x35d3e841afdb   a5b  3bc8                 cmpl rcx,rax
0x35d3e841afdd   a5d  76ee                 jna 0x35d3e841afcd  <+0xa4d>
0x35d3e841afdf   a5f  8d0486               leal rax,[rsi+rax*4]
0x35d3e841afe2   a62  8b0407               movl rax,[rdi+rax*1]
0x35d3e841afe5   a65  468d34b6             leal r14,[rsi+r14*4]
0x35d3e841afe9   a69  468b3437             movl r14,[rdi+r14*1]
0x35d3e841afed   a6d  413bc6               cmpl rax,r14
0x35d3e841aff0   a70  0f8223000000         jc 0x35d3e841b019  <+0xa99>
0x35d3e841aff6   a76  428b943f80000000     movl rdx,[rdi+r15*1+0x80]
0x35d3e841affe   a7e  4239843f80000000     cmpl [rdi+r15*1+0x80],rax
0x35d3e841b006   a86  0f831a000000         jnc 0x35d3e841b026  <+0xaa6>
0x35d3e841b00c   a8c  41be04000000         movl r14,0x4
0x35d3e841b012   a92  33c0                 xorl rax,rax
0x35d3e841b014   a94  e919000000           jmp 0x35d3e841b032  <+0xab2>
0x35d3e841b019   a99  33c0                 xorl rax,rax
0x35d3e841b01b   a9b  41be04000000         movl r14,0x4
0x35d3e841b021   aa1  e90c000000           jmp 0x35d3e841b032  <+0xab2>
0x35d3e841b026   aa6  412bc6               subl rax,r14
0x35d3e841b029   aa9  428b543f7c           movl rdx,[rdi+r15*1+0x7c]
0x35d3e841b02e   aae  468d34b2             leal r14,[rdx+r14*4]
0x35d3e841b032   ab2  4503c3               addl r8,r11
0x35d3e841b035   ab5  443bc1               cmpl r8,rcx
0x35d3e841b038   ab8  0f820a000000         jc 0x35d3e841b048  <+0xac8>
0x35d3e841b03e   abe  33d2                 xorl rdx,rdx
0x35d3e841b040   ac0  448bc2               movl r8,rdx
0x35d3e841b043   ac3  e94f000000           jmp 0x35d3e841b097  <+0xb17>
0x35d3e841b048   ac8  418d5001             leal rdx,[r8+0x1]
0x35d3e841b04c   acc  3bca                 cmpl rcx,rdx
0x35d3e841b04e   ace  76ee                 jna 0x35d3e841b03e  <+0xabe>
0x35d3e841b050   ad0  8d1496               leal rdx,[rsi+rdx*4]
0x35d3e841b053   ad3  8b1417               movl rdx,[rdi+rdx*1]
0x35d3e841b056   ad6  468d0486             leal r8,[rsi+r8*4]
0x35d3e841b05a   ada  468b0407             movl r8,[rdi+r8*1]
0x35d3e841b05e   ade  413bd0               cmpl rdx,r8
0x35d3e841b061   ae1  0f8223000000         jc 0x35d3e841b08a  <+0xb0a>
0x35d3e841b067   ae7  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0x35d3e841b06f   aef  4239943f80000000     cmpl [rdi+r15*1+0x80],rdx
0x35d3e841b077   af7  0f831a000000         jnc 0x35d3e841b097  <+0xb17>
0x35d3e841b07d   afd  41b804000000         movl r8,0x4
0x35d3e841b083   b03  33d2                 xorl rdx,rdx
0x35d3e841b085   b05  e919000000           jmp 0x35d3e841b0a3  <+0xb23>
0x35d3e841b08a   b0a  33d2                 xorl rdx,rdx
0x35d3e841b08c   b0c  41b804000000         movl r8,0x4
0x35d3e841b092   b12  e90c000000           jmp 0x35d3e841b0a3  <+0xb23>
0x35d3e841b097   b17  412bd0               subl rdx,r8
0x35d3e841b09a   b1a  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0x35d3e841b09f   b1f  478d0484             leal r8,[r12+r8*4]
0x35d3e841b0a3   b23  4403db               addl r11,rbx
0x35d3e841b0a6   b26  443bd9               cmpl r11,rcx
0x35d3e841b0a9   b29  0f820b000000         jc 0x35d3e841b0ba  <+0xb3a>
0x35d3e841b0af   b2f  4533db               xorl r11,r11
0x35d3e841b0b2   b32  458be3               movl r12,r11
0x35d3e841b0b5   b35  e954000000           jmp 0x35d3e841b10e  <+0xb8e>
0x35d3e841b0ba   b3a  458d6301             leal r12,[r11+0x1]
0x35d3e841b0be   b3e  4439e1               cmpl rcx,r12
0x35d3e841b0c1   b41  76ec                 jna 0x35d3e841b0af  <+0xb2f>
0x35d3e841b0c3   b43  468d24a6             leal r12,[rsi+r12*4]
0x35d3e841b0c7   b47  468b2427             movl r12,[rdi+r12*1]
0x35d3e841b0cb   b4b  468d1c9e             leal r11,[rsi+r11*4]
0x35d3e841b0cf   b4f  468b1c1f             movl r11,[rdi+r11*1]
0x35d3e841b0d3   b53  453be3               cmpl r12,r11
0x35d3e841b0d6   b56  0f8224000000         jc 0x35d3e841b100  <+0xb80>
0x35d3e841b0dc   b5c  428b9c3f80000000     movl rbx,[rdi+r15*1+0x80]
0x35d3e841b0e4   b64  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0x35d3e841b0ec   b6c  0f831c000000         jnc 0x35d3e841b10e  <+0xb8e>
0x35d3e841b0f2   b72  41bb04000000         movl r11,0x4
0x35d3e841b0f8   b78  4531e4               xorl r12,r12
0x35d3e841b0fb   b7b  e91a000000           jmp 0x35d3e841b11a  <+0xb9a>
0x35d3e841b100   b80  4531e4               xorl r12,r12
0x35d3e841b103   b83  41bb04000000         movl r11,0x4
0x35d3e841b109   b89  e90c000000           jmp 0x35d3e841b11a  <+0xb9a>
0x35d3e841b10e   b8e  452be3               subl r12,r11
0x35d3e841b111   b91  428b5c3f7c           movl rbx,[rdi+r15*1+0x7c]
0x35d3e841b116   b96  468d1c9b             leal r11,[rbx+r11*4]
0x35d3e841b11a   b9a  8b5de0               movl rbx,[rbp-0x20]
0x35d3e841b11d   b9d  4489641f4c           movl [rdi+rbx*1+0x4c],r12
0x35d3e841b122   ba2  44895c1f48           movl [rdi+rbx*1+0x48],r11
0x35d3e841b127   ba7  89541f44             movl [rdi+rbx*1+0x44],rdx
0x35d3e841b12b   bab  4489441f40           movl [rdi+rbx*1+0x40],r8
0x35d3e841b130   bb0  89441f3c             movl [rdi+rbx*1+0x3c],rax
0x35d3e841b134   bb4  4489741f38           movl [rdi+rbx*1+0x38],r14
0x35d3e841b139   bb9  44894c1f34           movl [rdi+rbx*1+0x34],r9
0x35d3e841b13e   bbe  448ba540ffffff       movl r12,[rbp-0xc0]
0x35d3e841b145   bc5  4489641f30           movl [rdi+rbx*1+0x30],r12
0x35d3e841b14a   bca  448ba538ffffff       movl r12,[rbp-0xc8]
0x35d3e841b151   bd1  4489641f2c           movl [rdi+rbx*1+0x2c],r12
0x35d3e841b156   bd6  448ba548ffffff       movl r12,[rbp-0xb8]
0x35d3e841b15d   bdd  4489641f28           movl [rdi+rbx*1+0x28],r12
0x35d3e841b162   be2  448b8df0feffff       movl r9,[rbp-0x110]
0x35d3e841b169   be9  44894c1f24           movl [rdi+rbx*1+0x24],r9
0x35d3e841b16e   bee  448ba5e0feffff       movl r12,[rbp-0x120]
0x35d3e841b175   bf5  4489641f20           movl [rdi+rbx*1+0x20],r12
0x35d3e841b17a   bfa  448b8de8feffff       movl r9,[rbp-0x118]
0x35d3e841b181   c01  44894c1f1c           movl [rdi+rbx*1+0x1c],r9
0x35d3e841b186   c06  448bb5d0feffff       movl r14,[rbp-0x130]
0x35d3e841b18d   c0d  4489741f18           movl [rdi+rbx*1+0x18],r14
0x35d3e841b192   c12  448b85a0feffff       movl r8,[rbp-0x160]
0x35d3e841b199   c19  4489441f14           movl [rdi+rbx*1+0x14],r8
0x35d3e841b19e   c1e  448bb5a8feffff       movl r14,[rbp-0x158]
0x35d3e841b1a5   c25  4489741f10           movl [rdi+rbx*1+0x10],r14
0x35d3e841b1aa   c2a  448b85b0feffff       movl r8,[rbp-0x150]
0x35d3e841b1b1   c31  4489441f0c           movl [rdi+rbx*1+0xc],r8
0x35d3e841b1b6   c36  448bb5b8feffff       movl r14,[rbp-0x148]
0x35d3e841b1bd   c3d  4489741f08           movl [rdi+rbx*1+0x8],r14
0x35d3e841b1c2   c42  49b80000000009000000 REX.W movq r8,0x900000000
0x35d3e841b1cc   c4c  4c89041f             REX.W movq [rdi+rbx*1],r8
0x35d3e841b1d0   c50  448b8560ffffff       movl r8,[rbp-0xa0]
0x35d3e841b1d7   c57  448b9dc0feffff       movl r11,[rbp-0x140]
0x35d3e841b1de   c5e  443b9d60ffffff       cmpl r11,[rbp-0xa0]
0x35d3e841b1e5   c65  450f42c3             cmovcl r8,r11
0x35d3e841b1e9   c69  448b4db8             movl r9,[rbp-0x48]
0x35d3e841b1ed   c6d  448b5db0             movl r11,[rbp-0x50]
0x35d3e841b1f1   c71  443b5db8             cmpl r11,[rbp-0x48]
0x35d3e841b1f5   c75  450f42cb             cmovcl r9,r11
0x35d3e841b1f9   c79  458bd9               movl r11,r9
0x35d3e841b1fc   c7c  453bc1               cmpl r8,r9
0x35d3e841b1ff   c7f  450f42d8             cmovcl r11,r8
0x35d3e841b203   c83  4c899d48ffffff       REX.W movq [rbp-0xb8],r11
0x35d3e841b20a   c8a  c57928d2             vmovapd xmm10,xmm2
0x35d3e841b20e   c8e  c57928da             vmovapd xmm11,xmm2
0x35d3e841b212   c92  4533c0               xorl r8,r8
0x35d3e841b215   c95  8b9510ffffff         movl rdx,[rbp-0xf0]
0x35d3e841b21b   c9b  8b8508ffffff         movl rax,[rbp-0xf8]
0x35d3e841b221   ca1  448bb500ffffff       movl r14,[rbp-0x100]
0x35d3e841b228   ca8  448ba5f8feffff       movl r12,[rbp-0x108]
0x35d3e841b22f   caf  e90f000000           jmp 0x35d3e841b243  <+0xcc3>
0x35d3e841b234   cb4  660f1f840000000000   nop
0x35d3e841b23d   cbd  0f1f00               nop
0x35d3e841b240   cc0  8b5de0               movl rbx,[rbp-0x20]
0x35d3e841b243   cc3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841b247   cc7  0f8614070000         jna 0x35d3e841b961  <+0x13e1>
0x35d3e841b24d   ccd  428d4cc308           leal rcx,[rbx+r8*8+0x8]
0x35d3e841b252   cd2  8b740f04             movl rsi,[rdi+rcx*1+0x4]
0x35d3e841b256   cd6  85f6                 testl rsi,rsi
0x35d3e841b258   cd8  0f8496010000         jz 0x35d3e841b3f4  <+0xe74>
0x35d3e841b25e   cde  8b0c0f               movl rcx,[rdi+rcx*1]
0x35d3e841b261   ce1  8d34b1               leal rsi,[rcx+rsi*4]
0x35d3e841b264   ce4  e922000000           jmp 0x35d3e841b28b  <+0xd0b>
0x35d3e841b269   ce9  660f1f840000000000   nop
0x35d3e841b272   cf2  660f1f840000000000   nop
0x35d3e841b27b   cfb  0f1f440000           nop
0x35d3e841b280   d00  448b9d48ffffff       movl r11,[rbp-0xb8]
0x35d3e841b287   d07  c57928d9             vmovapd xmm11,xmm1
0x35d3e841b28b   d0b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841b28f   d0f  0f8659070000         jna 0x35d3e841b9ee  <+0x146e>
0x35d3e841b295   d15  660f1f840000000000   nop
0x35d3e841b29e   d1e  660f1f840000000000   nop
0x35d3e841b2a7   d27  660f1f840000000000   nop
0x35d3e841b2b0   d30  660f1f840000000000   nop
0x35d3e841b2b9   d39  0f1f8000000000       nop
0x35d3e841b2c0   d40  448d4904             leal r9,[rcx+0x4]
0x35d3e841b2c4   d44  8b0c0f               movl rcx,[rdi+rcx*1]
0x35d3e841b2c7   d47  443bd9               cmpl r11,rcx
0x35d3e841b2ca   d4a  0f8760000000         ja 0x35d3e841b330  <+0xdb0>
0x35d3e841b2d0   d50  443bce               cmpl r9,rsi
0x35d3e841b2d3   d53  0f841b010000         jz 0x35d3e841b3f4  <+0xe74>
0x35d3e841b2d9   d59  418d4904             leal rcx,[r9+0x4]
0x35d3e841b2dd   d5d  468b0c0f             movl r9,[rdi+r9*1]
0x35d3e841b2e1   d61  453bd9               cmpl r11,r9
0x35d3e841b2e4   d64  0f874f000000         ja 0x35d3e841b339  <+0xdb9>
0x35d3e841b2ea   d6a  3bce                 cmpl rcx,rsi
0x35d3e841b2ec   d6c  0f8402010000         jz 0x35d3e841b3f4  <+0xe74>
0x35d3e841b2f2   d72  448d4904             leal r9,[rcx+0x4]
0x35d3e841b2f6   d76  8b0c0f               movl rcx,[rdi+rcx*1]
0x35d3e841b2f9   d79  443bd9               cmpl r11,rcx
0x35d3e841b2fc   d7c  0f872e000000         ja 0x35d3e841b330  <+0xdb0>
0x35d3e841b302   d82  443bce               cmpl r9,rsi
0x35d3e841b305   d85  0f84e9000000         jz 0x35d3e841b3f4  <+0xe74>
0x35d3e841b30b   d8b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x35d3e841b30f   d8f  0f867d070000         jna 0x35d3e841ba92  <+0x1512>
0x35d3e841b315   d95  418d4904             leal rcx,[r9+0x4]
0x35d3e841b319   d99  468b0c0f             movl r9,[rdi+r9*1]
0x35d3e841b31d   d9d  453bd9               cmpl r11,r9
0x35d3e841b320   da0  0f8713000000         ja 0x35d3e841b339  <+0xdb9>
0x35d3e841b326   da6  3bce                 cmpl rcx,rsi
0x35d3e841b328   da8  0f84c6000000         jz 0x35d3e841b3f4  <+0xe74>
0x35d3e841b32e   dae  eb90                 jmp 0x35d3e841b2c0  <+0xd40>
0x35d3e841b330   db0  448bd1               movl r10,rcx
0x35d3e841b333   db3  418bc9               movl rcx,r9
0x35d3e841b336   db6  458bca               movl r9,r10
0x35d3e841b339   db9  438d1c8c             leal rbx,[r12+r9*4]
0x35d3e841b33d   dbd  478d3c8e             leal r15,[r14+r9*4]
0x35d3e841b341   dc1  468d1c88             leal r11,[rax+r9*4]
0x35d3e841b345   dc5  c4217a10241f         vmovss xmm12,[rdi+r11*1]
0x35d3e841b34b   dcb  468d1c8a             leal r11,[rdx+r9*4]
0x35d3e841b34f   dcf  c4214a5c2c1f         vsubss xmm13,xmm6,[rdi+r11*1]
0x35d3e841b355   dd5  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0x35d3e841b35d   ddd  0f8715000000         ja 0x35d3e841b378  <+0xdf8>
0x35d3e841b363   de3  c4c1782edd           vucomiss xmm3,xmm13
0x35d3e841b368   de8  0f860e000000         jna 0x35d3e841b37c  <+0xdfc>
0x35d3e841b36e   dee  c4415a58ed           vaddss xmm13,xmm4,xmm13
0x35d3e841b373   df3  e904000000           jmp 0x35d3e841b37c  <+0xdfc>
0x35d3e841b378   df8  c5125cec             vsubss xmm13,xmm13,xmm4
0x35d3e841b37c   dfc  c57a10341f           vmovss xmm14,[rdi+rbx*1]
0x35d3e841b381   e01  c4a17a100c3f         vmovss xmm1,[rdi+r15*1]
0x35d3e841b387   e07  c441325ce4           vsubss xmm12,xmm9,xmm12
0x35d3e841b38c   e0c  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0x35d3e841b394   e14  0f8715000000         ja 0x35d3e841b3af  <+0xe2f>
0x35d3e841b39a   e1a  c4c1782edc           vucomiss xmm3,xmm12
0x35d3e841b39f   e1f  0f860e000000         jna 0x35d3e841b3b3  <+0xe33>
0x35d3e841b3a5   e25  c4415a58e4           vaddss xmm12,xmm4,xmm12
0x35d3e841b3aa   e2a  e904000000           jmp 0x35d3e841b3b3  <+0xe33>
0x35d3e841b3af   e2f  c51a5ce4             vsubss xmm12,xmm12,xmm4
0x35d3e841b3b3   e33  c4c17258cb           vaddss xmm1,xmm1,xmm11
0x35d3e841b3b8   e38  c4411259ed           vmulss xmm13,xmm13,xmm13
0x35d3e841b3bd   e3d  c4411a59e4           vmulss xmm12,xmm12,xmm12
0x35d3e841b3c2   e42  c4411a58e5           vaddss xmm12,xmm12,xmm13
0x35d3e841b3c7   e47  c4c1782ec4           vucomiss xmm0,xmm12
0x35d3e841b3cc   e4c  0f870a000000         ja 0x35d3e841b3dc  <+0xe5c>
0x35d3e841b3d2   e52  c4c17928cb           vmovapd xmm1,xmm11
0x35d3e841b3d7   e57  e905000000           jmp 0x35d3e841b3e1  <+0xe61>
0x35d3e841b3dc   e5c  c4410a58d2           vaddss xmm10,xmm14,xmm10
0x35d3e841b3e1   e61  3bf1                 cmpl rsi,rcx
0x35d3e841b3e3   e63  0f8597feffff         jnz 0x35d3e841b280  <+0xd00>
0x35d3e841b3e9   e69  448b9d48ffffff       movl r11,[rbp-0xb8]
0x35d3e841b3f0   e70  c57928d9             vmovapd xmm11,xmm1
0x35d3e841b3f4   e74  4183c001             addl r8,0x1
0x35d3e841b3f8   e78  4183f809             cmpl r8,0x9
0x35d3e841b3fc   e7c  0f853efeffff         jnz 0x35d3e841b240  <+0xcc0>
0x35d3e841b402   e82  c4412259e3           vmulss xmm12,xmm11,xmm11
0x35d3e841b407   e87  c4412a59ea           vmulss xmm13,xmm10,xmm10
0x35d3e841b40c   e8c  c4411258e4           vaddss xmm12,xmm13,xmm12
0x35d3e841b411   e91  c5782ee2             vucomiss xmm12,xmm2
0x35d3e841b415   e95  0f8726000000         ja 0x35d3e841b441  <+0xec1>
0x35d3e841b41b   e9b  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x35d3e841b41f   e9f  4e8b843fa0000000     REX.W movq r8,[rdi+r15*1+0xa0]
0x35d3e841b427   ea7  4983c001             REX.W addq r8,0x1
0x35d3e841b42b   eab  4e89843fa0000000     REX.W movq [rdi+r15*1+0xa0],r8
0x35d3e841b433   eb3  c4417928d8           vmovapd xmm11,xmm8
0x35d3e841b438   eb8  c57928d7             vmovapd xmm10,xmm7
0x35d3e841b43c   ebc  e91d000000           jmp 0x35d3e841b45e  <+0xede>
0x35d3e841b441   ec1  f3450f51e4           sqrtss xmm12,xmm12
0x35d3e841b446   ec6  c4412a5ed4           vdivss xmm10,xmm10,xmm12
0x35d3e841b44b   ecb  c4417828d2           vmovaps xmm10,xmm10
0x35d3e841b450   ed0  c441225edc           vdivss xmm11,xmm11,xmm12
0x35d3e841b455   ed5  c4417828db           vmovaps xmm11,xmm11
0x35d3e841b45a   eda  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0x35d3e841b45e   ede  4e8b843f90000000     REX.W movq r8,[rdi+r15*1+0x90]
0x35d3e841b466   ee6  49b8157c4a7fb979379e REX.W movq r8,0x9e3779b97f4a7c15
0x35d3e841b470   ef0  4e03843f90000000     REX.W addq r8,[rdi+r15*1+0x90]
0x35d3e841b478   ef8  4e89843f90000000     REX.W movq [rdi+r15*1+0x90],r8
0x35d3e841b480   f00  4d8bd8               REX.W movq r11,r8
0x35d3e841b483   f03  49c1eb1e             REX.W shrq r11, 30
0x35d3e841b487   f07  4d33c3               REX.W xorq r8,r11
0x35d3e841b48a   f0a  49bbb9e5e41c6d4758bf REX.W movq r11,0xbf58476d1ce4e5b9
0x35d3e841b494   f14  4d0fafd8             REX.W imulq r11,r8
0x35d3e841b498   f18  4d8bc3               REX.W movq r8,r11
0x35d3e841b49b   f1b  49c1e81b             REX.W shrq r8, 27
0x35d3e841b49f   f1f  4d33d8               REX.W xorq r11,r8
0x35d3e841b4a2   f22  49b8eb113113bb49d094 REX.W movq r8,0x94d049bb133111eb
0x35d3e841b4ac   f2c  4d0fafc3             REX.W imulq r8,r11
0x35d3e841b4b0   f30  4d8bd8               REX.W movq r11,r8
0x35d3e841b4b3   f33  49c1eb2b             REX.W shrq r11, 43
0x35d3e841b4b7   f37  49c1e80c             REX.W shrq r8, 12
0x35d3e841b4bb   f3b  4d33c3               REX.W xorq r8,r11
0x35d3e841b4be   f3e  49bb000000000000f03f REX.W movq r11,0x3ff0000000000000
0x35d3e841b4c8   f48  4d0bd8               REX.W orq r11,r8
0x35d3e841b4cb   f4b  c441f96ee3           vmovq xmm12,r11
0x35d3e841b4d0   f50  49ba000000000000f0bf REX.W movq r10,0xbff0000000000000
0x35d3e841b4da   f5a  c441f96eea           vmovq xmm13,r10
0x35d3e841b4df   f5f  c4411358e4           vaddsd xmm12,xmm13,xmm12
0x35d3e841b4e4   f64  49ba000000000000e0bf REX.W movq r10,0xbfe0000000000000
0x35d3e841b4ee   f6e  c441f96eea           vmovq xmm13,r10
0x35d3e841b4f3   f73  c4411358e4           vaddsd xmm12,xmm13,xmm12
0x35d3e841b4f8   f78  c4217a10ac3fb4000000 vmovss xmm13,[rdi+r15*1+0xb4]
0x35d3e841b502   f82  c441125aed           vcvtss2sd xmm13,xmm13,xmm13
0x35d3e841b507   f87  c4411359e4           vmulsd xmm12,xmm13,xmm12
0x35d3e841b50c   f8c  c4c11b5acc           vcvtsd2ss xmm1,xmm12,xmm12
0x35d3e841b511   f91  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841b516   f96  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841b51b   f9b  c5fb118d60ffffff     vmovsd [rbp-0xa0],xmm1
0x35d3e841b523   fa3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841b527   fa7  e8cc58edff           call 0x35d3e82f0df8  (jump table)
0x35d3e841b52c   fac  c5fb118d58ffffff     vmovsd [rbp-0xa8],xmm1
0x35d3e841b534   fb4  c5fb108d60ffffff     vmovsd xmm1,[rbp-0xa0]
0x35d3e841b53c   fbc  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841b540   fc0  e8bb58edff           call 0x35d3e82f0e00  (jump table)
0x35d3e841b545   fc5  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b549   fc9  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x35d3e841b54d   fcd  c4a17a108407b0000000 vmovss xmm0,[rdi+r8*1+0xb0]
0x35d3e841b557   fd7  c5fb109568ffffff     vmovsd xmm2,[rbp-0x98]
0x35d3e841b55f   fdf  c5ea59d0             vmulss xmm2,xmm2,xmm0
0x35d3e841b563   fe3  c5ea589570ffffff     vaddss xmm2,xmm2,[rbp-0x90]
0x35d3e841b56b   feb  c4a17a109c07a8000000 vmovss xmm3,[rdi+r8*1+0xa8]
0x35d3e841b575   ff5  c5f82ed3             vucomiss xmm2,xmm3
0x35d3e841b579   ff9  0f8317000000         jnc 0x35d3e841b596  <+0x1016>
0x35d3e841b57f   fff  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e841b583  1003  c5f82ee2             vucomiss xmm4,xmm2
0x35d3e841b587  1007  0f8611000000         jna 0x35d3e841b59e  <+0x101e>
0x35d3e841b58d  100d  c5e258d2             vaddss xmm2,xmm3,xmm2
0x35d3e841b591  1011  e908000000           jmp 0x35d3e841b59e  <+0x101e>
0x35d3e841b596  1016  c5ea5cd3             vsubss xmm2,xmm2,xmm3
0x35d3e841b59a  101a  c5d857e4             vxorps xmm4,xmm4,xmm4
0x35d3e841b59e  101e  c5fa598578ffffff     vmulss xmm0,xmm0,[rbp-0x88]
0x35d3e841b5a6  1026  c5fa584580           vaddss xmm0,xmm0,[rbp-0x80]
0x35d3e841b5ab  102b  c5f82ec3             vucomiss xmm0,xmm3
0x35d3e841b5af  102f  0f8313000000         jnc 0x35d3e841b5c8  <+0x1048>
0x35d3e841b5b5  1035  c5f82ee0             vucomiss xmm4,xmm0
0x35d3e841b5b9  1039  0f860d000000         jna 0x35d3e841b5cc  <+0x104c>
0x35d3e841b5bf  103f  c5e258c0             vaddss xmm0,xmm3,xmm0
0x35d3e841b5c3  1043  e904000000           jmp 0x35d3e841b5cc  <+0x104c>
0x35d3e841b5c8  1048  c5fa5cc3             vsubss xmm0,xmm0,xmm3
0x35d3e841b5cc  104c  448b5d88             movl r11,[rbp-0x78]
0x35d3e841b5d0  1050  443b5dc0             cmpl r11,[rbp-0x40]
0x35d3e841b5d4  1054  0f86aa000000         jna 0x35d3e841b684  <+0x1104>
0x35d3e841b5da  105a  448b65c0             movl r12,[rbp-0x40]
0x35d3e841b5de  105e  448b7d90             movl r15,[rbp-0x70]
0x35d3e841b5e2  1062  478d34a7             leal r14,[r15+r12*4]
0x35d3e841b5e6  1066  c5f82ed3             vucomiss xmm2,xmm3
0x35d3e841b5ea  106a  0f8204000000         jc 0x35d3e841b5f4  <+0x1074>
0x35d3e841b5f0  1070  c5f928d4             vmovapd xmm2,xmm4
0x35d3e841b5f4  1074  c4a17a111437         vmovss [rdi+r14*1],xmm2
0x35d3e841b5fa  107a  448b7598             movl r14,[rbp-0x68]
0x35d3e841b5fe  107e  438d04a6             leal rax,[r14+r12*4]
0x35d3e841b602  1082  c5f82ec3             vucomiss xmm0,xmm3
0x35d3e841b606  1086  0f8204000000         jc 0x35d3e841b610  <+0x1090>
0x35d3e841b60c  108c  c5f928c4             vmovapd xmm0,xmm4
0x35d3e841b610  1090  c5fa110407           vmovss [rdi+rax*1],xmm0
0x35d3e841b615  1095  8b45a0               movl rax,[rbp-0x60]
0x35d3e841b618  1098  428d1ca0             leal rbx,[rax+r12*4]
0x35d3e841b61c  109c  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841b621  10a1  c5a259c1             vmulss xmm0,xmm11,xmm1
0x35d3e841b625  10a5  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841b62a  10aa  c5aa599558ffffff     vmulss xmm2,xmm10,[rbp-0xa8]
0x35d3e841b632  10b2  c5fa5cc2             vsubss xmm0,xmm0,xmm2
0x35d3e841b636  10b6  c5fa11041f           vmovss [rdi+rbx*1],xmm0
0x35d3e841b63b  10bb  8b5da8               movl rbx,[rbp-0x58]
0x35d3e841b63e  10be  428d14a3             leal rdx,[rbx+r12*4]
0x35d3e841b642  10c2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0x35d3e841b64a  10ca  c4c17a59c3           vmulss xmm0,xmm0,xmm11
0x35d3e841b64f  10cf  c4c17259d2           vmulss xmm2,xmm1,xmm10
0x35d3e841b654  10d4  c5ea58c0             vaddss xmm0,xmm2,xmm0
0x35d3e841b658  10d8  c5fa110417           vmovss [rdi+rdx*1],xmm0
0x35d3e841b65d  10dd  4589e3               movl r11,r12
0x35d3e841b660  10e0  4d8be0               REX.W movq r12,r8
0x35d3e841b663  10e3  c5f928d4             vmovapd xmm2,xmm4
0x35d3e841b667  10e7  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b66f  10ef  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b677  10f7  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b67f  10ff  e923000000           jmp 0x35d3e841b6a7  <+0x1127>
0x35d3e841b684  1104  4d8be0               REX.W movq r12,r8
0x35d3e841b687  1107  448b5dc0             movl r11,[rbp-0x40]
0x35d3e841b68b  110b  c5f928d4             vmovapd xmm2,xmm4
0x35d3e841b68f  110f  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b697  1117  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b69f  111f  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b6a7  1127  4183c301             addl r11,0x1
0x35d3e841b6ab  112b  448b45c8             movl r8,[rbp-0x38]
0x35d3e841b6af  112f  453bc3               cmpl r8,r11
0x35d3e841b6b2  1132  0f8437000000         jz 0x35d3e841b6ef  <+0x116f>
0x35d3e841b6b8  1138  e943f1ffff           jmp 0x35d3e841a800  <+0x280>
0x35d3e841b6bd  113d  b8c8301600           movl rax,0x1630c8
0x35d3e841b6c2  1142  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841b6c6  1146  e8ad3fedff           call 0x35d3e82ef678  (jump table)
0x35d3e841b6cb  114b  33ff                 xorl rdi,rdi
0x35d3e841b6cd  114d  85ff                 testl rdi,rdi
0x35d3e841b6cf  114f  0f8467040000         jz 0x35d3e841bb3c  <+0x15bc>
0x35d3e841b6d5  1155  cc                   int3l
0x35d3e841b6d6  1156  b8c8301600           movl rax,0x1630c8
0x35d3e841b6db  115b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841b6df  115f  e8943fedff           call 0x35d3e82ef678  (jump table)
0x35d3e841b6e4  1164  33ff                 xorl rdi,rdi
0x35d3e841b6e6  1166  85ff                 testl rdi,rdi
0x35d3e841b6e8  1168  0f8449040000         jz 0x35d3e841bb37  <+0x15b7>
0x35d3e841b6ee  116e  cc                   int3l
0x35d3e841b6ef  116f  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x35d3e841b6f3  1173  448b5de0             movl r11,[rbp-0x20]
0x35d3e841b6f7  1177  c4a17a6f442730       vmovdqu xmm0,[rdi+r12*1+0x30]
0x35d3e841b6fe  117e  c4a17a6f1427         vmovdqu xmm2,[rdi+r12*1]
0x35d3e841b704  1184  c4a17a7f542730       vmovdqu [rdi+r12*1+0x30],xmm2
0x35d3e841b70b  118b  c4a17a7f0427         vmovdqu [rdi+r12*1],xmm0
0x35d3e841b711  1191  c4a17a6f442740       vmovdqu xmm0,[rdi+r12*1+0x40]
0x35d3e841b718  1198  c4a17a6f542710       vmovdqu xmm2,[rdi+r12*1+0x10]
0x35d3e841b71f  119f  c4a17a7f542740       vmovdqu [rdi+r12*1+0x40],xmm2
0x35d3e841b726  11a6  c4a17a7f442710       vmovdqu [rdi+r12*1+0x10],xmm0
0x35d3e841b72d  11ad  c4a17a6f442750       vmovdqu xmm0,[rdi+r12*1+0x50]
0x35d3e841b734  11b4  c4a17a6f542720       vmovdqu xmm2,[rdi+r12*1+0x20]
0x35d3e841b73b  11bb  c4a17a7f542750       vmovdqu [rdi+r12*1+0x50],xmm2
0x35d3e841b742  11c2  c4a17a7f442720       vmovdqu [rdi+r12*1+0x20],xmm0
0x35d3e841b749  11c9  4e8bbc2798000000     REX.W movq r15,[rdi+r12*1+0x98]
0x35d3e841b751  11d1  4983c701             REX.W addq r15,0x1
0x35d3e841b755  11d5  4e89bc2798000000     REX.W movq [rdi+r12*1+0x98],r15
0x35d3e841b75d  11dd  418bfb               movl rdi,r11
0x35d3e841b760  11e0  83c750               addl rdi,0x50
0x35d3e841b763  11e3  418938               movl [r8],rdi
0x35d3e841b766  11e6  488be5               REX.W movq rsp,rbp
0x35d3e841b769  11e9  5d                   pop rbp
0x35d3e841b76a  11ea  c3                   retl
0x35d3e841b76b  11eb  488945b0             REX.W movq [rbp-0x50],rax
0x35d3e841b76f  11ef  e85c6dedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841b774  11f4  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b778  11f8  488b75f0             REX.W movq rsi,[rbp-0x10]
0x35d3e841b77c  11fc  8b45b0               movl rax,[rbp-0x50]
0x35d3e841b77f  11ff  e91ceeffff           jmp 0x35d3e841a5a0  <+0x20>
0x35d3e841b784  1204  c5f92eed             vucomisd xmm5,xmm5
0x35d3e841b788  1208  0f8b08000000         jpo 0x35d3e841b796  <+0x1216>
0x35d3e841b78e  120e  4533ff               xorl r15,r15
0x35d3e841b791  1211  e912efffff           jmp 0x35d3e841a6a8  <+0x128>
0x35d3e841b796  1216  c5f82ee3             vucomiss xmm4,xmm3
0x35d3e841b79a  121a  77f2                 ja 0x35d3e841b78e  <+0x120e>
0x35d3e841b79c  121c  41bfffffffff         movl r15,0xffffffff
0x35d3e841b7a2  1222  e901efffff           jmp 0x35d3e841a6a8  <+0x128>
0x35d3e841b7a7  1227  4c895dc0             REX.W movq [rbp-0x40],r11
0x35d3e841b7ab  122b  e8206dedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841b7b0  1230  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b7b4  1234  4c8b65d0             REX.W movq r12,[rbp-0x30]
0x35d3e841b7b8  1238  448b5dc0             movl r11,[rbp-0x40]
0x35d3e841b7bc  123c  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841b7c0  1240  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b7c8  1248  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b7d0  1250  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b7d8  1258  e92df0ffff           jmp 0x35d3e841a80a  <+0x28a>
0x35d3e841b7dd  125d  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841b7e2  1262  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841b7e7  1267  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x35d3e841b7ee  126e  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x35d3e841b7f5  1275  e8d66cedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841b7fa  127a  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b7fe  127e  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841b802  1282  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x35d3e841b807  1287  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x35d3e841b80f  128f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e841b817  1297  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x35d3e841b81f  129f  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841b824  12a4  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841b829  12a9  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b831  12b1  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b839  12b9  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b841  12c1  448bb510ffffff       movl r14,[rbp-0xf0]
0x35d3e841b848  12c8  448b8508ffffff       movl r8,[rbp-0xf8]
0x35d3e841b84f  12cf  8b9500ffffff         movl rdx,[rbp-0x100]
0x35d3e841b855  12d5  8b85f8feffff         movl rax,[rbp-0x108]
0x35d3e841b85b  12db  448ba558ffffff       movl r12,[rbp-0xa8]
0x35d3e841b862  12e2  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x35d3e841b868  12e8  e9e4f0ffff           jmp 0x35d3e841a951  <+0x3d1>
0x35d3e841b86d  12ed  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841b872  12f2  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841b877  12f7  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0x35d3e841b87e  12fe  4c898d48ffffff       REX.W movq [rbp-0xb8],r9
0x35d3e841b885  1305  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0x35d3e841b88c  130c  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x35d3e841b893  1313  e8386cedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841b898  1318  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b89c  131c  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841b8a0  1320  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x35d3e841b8a5  1325  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x35d3e841b8ad  132d  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e841b8b5  1335  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x35d3e841b8bd  133d  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841b8c2  1342  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841b8c7  1347  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b8cf  134f  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b8d7  1357  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b8df  135f  448bb510ffffff       movl r14,[rbp-0xf0]
0x35d3e841b8e6  1366  448b8508ffffff       movl r8,[rbp-0xf8]
0x35d3e841b8ed  136d  8b9500ffffff         movl rdx,[rbp-0x100]
0x35d3e841b8f3  1373  8b85f8feffff         movl rax,[rbp-0x108]
0x35d3e841b8f9  1379  448ba558ffffff       movl r12,[rbp-0xa8]
0x35d3e841b900  1380  448b8d48ffffff       movl r9,[rbp-0xb8]
0x35d3e841b907  1387  488bb550ffffff       REX.W movq rsi,[rbp-0xb0]
0x35d3e841b90e  138e  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x35d3e841b914  1394  e9a3f0ffff           jmp 0x35d3e841a9bc  <+0x43c>
0x35d3e841b919  1399  c441792ee4           vucomisd xmm12,xmm12
0x35d3e841b91e  139e  0f8b07000000         jpo 0x35d3e841b92b  <+0x13ab>
0x35d3e841b924  13a4  33c9                 xorl rcx,rcx
0x35d3e841b926  13a6  e940f2ffff           jmp 0x35d3e841ab6b  <+0x5eb>
0x35d3e841b92b  13ab  c4c1782ed3           vucomiss xmm2,xmm11
0x35d3e841b930  13b0  77f2                 ja 0x35d3e841b924  <+0x13a4>
0x35d3e841b932  13b2  b9ffffffff           movl rcx,0xffffffff
0x35d3e841b937  13b7  e92ff2ffff           jmp 0x35d3e841ab6b  <+0x5eb>
0x35d3e841b93c  13bc  c441792edb           vucomisd xmm11,xmm11
0x35d3e841b941  13c1  0f8b08000000         jpo 0x35d3e841b94f  <+0x13cf>
0x35d3e841b947  13c7  4533c0               xorl r8,r8
0x35d3e841b94a  13ca  e9f3f2ffff           jmp 0x35d3e841ac42  <+0x6c2>
0x35d3e841b94f  13cf  c4c1782ed2           vucomiss xmm2,xmm10
0x35d3e841b954  13d4  77f1                 ja 0x35d3e841b947  <+0x13c7>
0x35d3e841b956  13d6  41b8ffffffff         movl r8,0xffffffff
0x35d3e841b95c  13dc  e9e1f2ffff           jmp 0x35d3e841ac42  <+0x6c2>
0x35d3e841b961  13e1  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x35d3e841b968  13e8  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841b96d  13ed  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841b972  13f2  e8596bedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841b977  13f7  8b5de0               movl rbx,[rbp-0x20]
0x35d3e841b97a  13fa  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841b97e  13fe  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841b982  1402  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x35d3e841b987  1407  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x35d3e841b98f  140f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e841b997  1417  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x35d3e841b99f  141f  448b8560ffffff       movl r8,[rbp-0xa0]
0x35d3e841b9a6  1426  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841b9ab  142b  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841b9b0  1430  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841b9b8  1438  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841b9c0  1440  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841b9c8  1448  8b9510ffffff         movl rdx,[rbp-0xf0]
0x35d3e841b9ce  144e  8b8508ffffff         movl rax,[rbp-0xf8]
0x35d3e841b9d4  1454  448bb500ffffff       movl r14,[rbp-0x100]
0x35d3e841b9db  145b  448ba5f8feffff       movl r12,[rbp-0x108]
0x35d3e841b9e2  1462  448b9d48ffffff       movl r11,[rbp-0xb8]
0x35d3e841b9e9  1469  e95ff8ffff           jmp 0x35d3e841b24d  <+0xccd>
0x35d3e841b9ee  146e  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x35d3e841b9f5  1475  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841b9fa  147a  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841b9ff  147f  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0x35d3e841ba06  1486  48898d50ffffff       REX.W movq [rbp-0xb0],rcx
0x35d3e841ba0d  148d  e8be6aedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841ba12  1492  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841ba16  1496  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841ba1a  149a  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x35d3e841ba1f  149f  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x35d3e841ba27  14a7  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e841ba2f  14af  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x35d3e841ba37  14b7  448b8560ffffff       movl r8,[rbp-0xa0]
0x35d3e841ba3e  14be  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841ba43  14c3  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841ba48  14c8  8bb558ffffff         movl rsi,[rbp-0xa8]
0x35d3e841ba4e  14ce  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841ba56  14d6  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841ba5e  14de  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841ba66  14e6  8b9510ffffff         movl rdx,[rbp-0xf0]
0x35d3e841ba6c  14ec  8b8508ffffff         movl rax,[rbp-0xf8]
0x35d3e841ba72  14f2  448bb500ffffff       movl r14,[rbp-0x100]
0x35d3e841ba79  14f9  448ba5f8feffff       movl r12,[rbp-0x108]
0x35d3e841ba80  1500  448b9d48ffffff       movl r11,[rbp-0xb8]
0x35d3e841ba87  1507  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x35d3e841ba8d  150d  e92ef8ffff           jmp 0x35d3e841b2c0  <+0xd40>
0x35d3e841ba92  1512  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0x35d3e841ba99  1519  c57b1155b8           vmovsd [rbp-0x48],xmm10
0x35d3e841ba9e  151e  c57b115db0           vmovsd [rbp-0x50],xmm11
0x35d3e841baa3  1523  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0x35d3e841baaa  152a  4c898d50ffffff       REX.W movq [rbp-0xb0],r9
0x35d3e841bab1  1531  e81a6aedff           call 0x35d3e82f24d0  (jump table)
0x35d3e841bab6  1536  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x35d3e841baba  153a  c5e857d2             vxorps xmm2,xmm2,xmm2
0x35d3e841babe  153e  c57b104d80           vmovsd xmm9,[rbp-0x80]
0x35d3e841bac3  1543  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0x35d3e841bacb  154b  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0x35d3e841bad3  1553  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0x35d3e841badb  155b  448b8560ffffff       movl r8,[rbp-0xa0]
0x35d3e841bae2  1562  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0x35d3e841bae7  1567  c57b105db0           vmovsd xmm11,[rbp-0x50]
0x35d3e841baec  156c  8bb558ffffff         movl rsi,[rbp-0xa8]
0x35d3e841baf2  1572  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0x35d3e841bafa  157a  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0x35d3e841bb02  1582  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0x35d3e841bb0a  158a  8b9510ffffff         movl rdx,[rbp-0xf0]
0x35d3e841bb10  1590  8b8508ffffff         movl rax,[rbp-0xf8]
0x35d3e841bb16  1596  448bb500ffffff       movl r14,[rbp-0x100]
0x35d3e841bb1d  159d  448ba5f8feffff       movl r12,[rbp-0x108]
0x35d3e841bb24  15a4  448b8d50ffffff       movl r9,[rbp-0xb0]
0x35d3e841bb2b  15ab  448b9d48ffffff       movl r11,[rbp-0xb8]
0x35d3e841bb32  15b2  e9def7ffff           jmp 0x35d3e841b315  <+0xd95>
0x35d3e841bb37  15b7  e8c466edff           call 0x35d3e82f2200  (jump table)
0x35d3e841bb3c  15bc  e8bf66edff           call 0x35d3e82f2200  (jump table)
0x35d3e841bb41  15c1  90                   nop
0x35d3e841bb42  15c2  6690                 nop

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
0x35d3e841a700    180  slots (sp->fp): 0000000000000000000000000000000000000000000000

RelocInfo (size = 39)
0x35d3e841a6fc  internal wasm call
0x35d3e841b528  internal wasm call
0x35d3e841b541  internal wasm call
0x35d3e841b6c7  internal wasm call
0x35d3e841b6e0  internal wasm call
0x35d3e841b770  wasm stub call  (0x35d3e82f24d0)
0x35d3e841b7ac  wasm stub call  (0x35d3e82f24d0)
0x35d3e841b7f6  wasm stub call  (0x35d3e82f24d0)
0x35d3e841b894  wasm stub call  (0x35d3e82f24d0)
0x35d3e841b973  wasm stub call  (0x35d3e82f24d0)
0x35d3e841ba0e  wasm stub call  (0x35d3e82f24d0)
0x35d3e841bab2  wasm stub call  (0x35d3e82f24d0)
0x35d3e841bb38  wasm stub call  (0x35d3e82f2200)
0x35d3e841bb3d  wasm stub call  (0x35d3e82f2200)
