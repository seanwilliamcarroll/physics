name: _RNvMs0_NtCskbGeSEnUfEA_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 5632 = 5592 + 40 padding)
Instructions (size = 5572)
0xde6dc3c94c0     0  55                   push rbp
0xde6dc3c94c1     1  4889e5               REX.W movq rbp,rsp
0xde6dc3c94c4     4  6a08                 push 0x8
0xde6dc3c94c6     6  56                   push rsi
0xde6dc3c94c7     7  4881ec50010000       REX.W subq rsp,0x150
0xde6dc3c94ce     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0xde6dc3c94d2    12  48897dd8             REX.W movq [rbp-0x28],rdi
0xde6dc3c94d6    16  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3c94da    1a  0f86cb110000         jna 0xde6dc3ca6ab  <+0x11eb>
0xde6dc3c94e0    20  4c8b462f             REX.W movq r8,[rsi+0x2f]
0xde6dc3c94e4    24  458b18               movl r11,[r8]
0xde6dc3c94e7    27  4183eb50             subl r11,0x50
0xde6dc3c94eb    2b  458918               movl [r8],r11
0xde6dc3c94ee    2e  448be0               movl r12,rax
0xde6dc3c94f1    31  c4a17a108427ac000000 vmovss xmm0,[rdi+r12*1+0xac]
0xde6dc3c94fb    3b  c4a17a109427a8000000 vmovss xmm2,[rdi+r12*1+0xa8]
0xde6dc3c9505    45  428b4c2708           movl rcx,[rdi+r12*1+0x8]
0xde6dc3c950a    4a  460fb6bc27b8000000   movzxbl r15,[rdi+r12*1+0xb8]
0xde6dc3c9513    53  4c8945e8             REX.W movq [rbp-0x18],r8
0xde6dc3c9517    57  4c895de0             REX.W movq [rbp-0x20],r11
0xde6dc3c951b    5b  4c8965d0             REX.W movq [rbp-0x30],r12
0xde6dc3c951f    5f  c5fb1145c0           vmovsd [rbp-0x40],xmm0
0xde6dc3c9524    64  c5fb119528ffffff     vmovsd [rbp-0xd8],xmm2
0xde6dc3c952c    6c  48894dc8             REX.W movq [rbp-0x38],rcx
0xde6dc3c9530    70  4280bc27b800000000   cmpb [rdi+r12*1+0xb8],0x0
0xde6dc3c9539    79  0f8534010000         jnz 0xde6dc3c9673  <+0x1b3>
0xde6dc3c953f    7f  41ba0020803f         movl r10,0x3f802000
0xde6dc3c9545    85  c4c1796eda           vmovd xmm3,r10
0xde6dc3c954a    8a  c5e259d8             vmulss xmm3,xmm3,xmm0
0xde6dc3c954e    8e  c5ea5edb             vdivss xmm3,xmm2,xmm3
0xde6dc3c9552    92  c5f828db             vmovaps xmm3,xmm3
0xde6dc3c9556    96  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0xde6dc3c955c    9c  c5d857e4             vxorps xmm4,xmm4,xmm4
0xde6dc3c9560    a0  c5f82edc             vucomiss xmm3,xmm4
0xde6dc3c9564    a4  0f8308000000         jnc 0xde6dc3c9572  <+0xb2>
0xde6dc3c956a    aa  4533ff               xorl r15,r15
0xde6dc3c956d    ad  e908010000           jmp 0xde6dc3c967a  <+0x1ba>
0xde6dc3c9572    b2  41ba0000804f         movl r10,0x4f800000
0xde6dc3c9578    b8  c4c1796eea           vmovd xmm5,r10
0xde6dc3c957d    bd  c5f82eeb             vucomiss xmm5,xmm3
0xde6dc3c9581    c1  0f8708000000         ja 0xde6dc3c958f  <+0xcf>
0xde6dc3c9587    c7  4533ff               xorl r15,r15
0xde6dc3c958a    ca  e9eb000000           jmp 0xde6dc3c967a  <+0x1ba>
0xde6dc3c958f    cf  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0xde6dc3c9593    d3  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0xde6dc3c9599    d9  c57b2cfe             vcvttsd2si r15,xmm6
0xde6dc3c959d    dd  4585ff               testl r15,r15
0xde6dc3c95a0    e0  0f892a000000         jns 0xde6dc3c95d0  <+0x110>
0xde6dc3c95a6    e6  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0xde6dc3c95b0    f0  c441f96efa           vmovq xmm15,r10
0xde6dc3c95b5    f5  c50358fe             vaddsd xmm15,xmm15,xmm6
0xde6dc3c95b9    f9  c4417b2cff           vcvttsd2si r15,xmm15
0xde6dc3c95be    fe  4585ff               testl r15,r15
0xde6dc3c95c1   101  0f8809000000         js 0xde6dc3c95d0  <+0x110>
0xde6dc3c95c7   107  41ba00000080         movl r10,0x80000000
0xde6dc3c95cd   10d  450bfa               orl r15,r10
0xde6dc3c95d0   110  458bd7               movl r10,r15
0xde6dc3c95d3   113  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0xde6dc3c95d8   118  c5f92efe             vucomisd xmm7,xmm6
0xde6dc3c95dc   11c  0f8ae2100000         jpe 0xde6dc3ca6c4  <+0x1204>
0xde6dc3c95e2   122  0f85dc100000         jnz 0xde6dc3ca6c4  <+0x1204>
0xde6dc3c95e8   128  4183ff03             cmpl r15,0x3
0xde6dc3c95ec   12c  7299                 jc 0xde6dc3c9587  <+0xc7>
0xde6dc3c95ee   12e  468b4c2714           movl r9,[rdi+r12*1+0x14]
0xde6dc3c95f3   133  428b5c2710           movl rbx,[rdi+r12*1+0x10]
0xde6dc3c95f8   138  428b542704           movl rdx,[rdi+r12*1+0x4]
0xde6dc3c95fd   13d  41be00040000         movl r14,0x400
0xde6dc3c9603   143  4181ff00040000       cmpl r15,0x400
0xde6dc3c960a   14a  450f42f7             cmovcl r14,r15
0xde6dc3c960e   14e  4689b4278c000000     movl [rdi+r12*1+0x8c],r14
0xde6dc3c9616   156  4689b42788000000     movl [rdi+r12*1+0x88],r14
0xde6dc3c961e   15e  458bd6               movl r10,r14
0xde6dc3c9621   161  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0xde6dc3c9626   166  c5e25eda             vdivss xmm3,xmm3,xmm2
0xde6dc3c962a   16a  c5f828db             vmovaps xmm3,xmm3
0xde6dc3c962e   16e  c4a17a119c2784000000 vmovss [rdi+r12*1+0x84],xmm3
0xde6dc3c9638   178  83c060               addl rax,0x60
0xde6dc3c963b   17b  e8b876edff           call 0xde6dc2a0cf8  (jump table)
0xde6dc3c9640   180  c5fb1045c0           vmovsd xmm0,[rbp-0x40]
0xde6dc3c9645   185  41bf01000000         movl r15,0x1
0xde6dc3c964b   18b  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xde6dc3c964f   18f  448b5de0             movl r11,[rbp-0x20]
0xde6dc3c9653   193  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3c9657   197  4c8b65d0             REX.W movq r12,[rbp-0x30]
0xde6dc3c965b   19b  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3c965f   19f  8b4dc8               movl rcx,[rbp-0x38]
0xde6dc3c9662   1a2  c5d857e4             vxorps xmm4,xmm4,xmm4
0xde6dc3c9666   1a6  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0xde6dc3c966e   1ae  e907000000           jmp 0xde6dc3c967a  <+0x1ba>
0xde6dc3c9673   1b3  4533ff               xorl r15,r15
0xde6dc3c9676   1b6  c5d857e4             vxorps xmm4,xmm4,xmm4
0xde6dc3c967a   1ba  4c89bdd8feffff       REX.W movq [rbp-0x128],r15
0xde6dc3c9681   1c1  85c9                 testl rcx,rcx
0xde6dc3c9683   1c3  0f84ae0f0000         jz 0xde6dc3ca637  <+0x1177>
0xde6dc3c9689   1c9  468b74275c           movl r14,[rdi+r12*1+0x5c]
0xde6dc3c968e   1ce  428b442750           movl rax,[rdi+r12*1+0x50]
0xde6dc3c9693   1d3  428b5c2744           movl rbx,[rdi+r12*1+0x44]
0xde6dc3c9698   1d8  428b542738           movl rdx,[rdi+r12*1+0x38]
0xde6dc3c969d   1dd  448bca               movl r9,rdx
0xde6dc3c96a0   1e0  3bda                 cmpl rbx,rdx
0xde6dc3c96a2   1e2  440f42cb             cmovcl r9,rbx
0xde6dc3c96a6   1e6  418bd9               movl rbx,r9
0xde6dc3c96a9   1e9  413bc1               cmpl rax,r9
0xde6dc3c96ac   1ec  0f42d8               cmovcl rbx,rax
0xde6dc3c96af   1ef  448bcb               movl r9,rbx
0xde6dc3c96b2   1f2  443bf3               cmpl r14,rbx
0xde6dc3c96b5   1f5  450f42ce             cmovcl r9,r14
0xde6dc3c96b9   1f9  41ba000000bf         movl r10,0xbf000000
0xde6dc3c96bf   1ff  c4c1796eda           vmovd xmm3,r10
0xde6dc3c96c4   204  c5e259da             vmulss xmm3,xmm3,xmm2
0xde6dc3c96c8   208  c5d176ed             vpcmpeqd xmm5,xmm5,xmm5
0xde6dc3c96cc   20c  c5d172f51a           vpslld xmm5,xmm5,26
0xde6dc3c96d1   211  c5d172d502           vpsrld xmm5,xmm5,2
0xde6dc3c96d6   216  c5d259ea             vmulss xmm5,xmm5,xmm2
0xde6dc3c96da   21a  468b742758           movl r14,[rdi+r12*1+0x58]
0xde6dc3c96df   21f  428b5c274c           movl rbx,[rdi+r12*1+0x4c]
0xde6dc3c96e4   224  428b442740           movl rax,[rdi+r12*1+0x40]
0xde6dc3c96e9   229  428b542734           movl rdx,[rdi+r12*1+0x34]
0xde6dc3c96ee   22e  c5fa59c0             vmulss xmm0,xmm0,xmm0
0xde6dc3c96f2   232  4c894d88             REX.W movq [rbp-0x78],r9
0xde6dc3c96f6   236  c5fb119d20ffffff     vmovsd [rbp-0xe0],xmm3
0xde6dc3c96fe   23e  c5fb11ad18ffffff     vmovsd [rbp-0xe8],xmm5
0xde6dc3c9706   246  4c8975a8             REX.W movq [rbp-0x58],r14
0xde6dc3c970a   24a  48895da0             REX.W movq [rbp-0x60],rbx
0xde6dc3c970e   24e  48894598             REX.W movq [rbp-0x68],rax
0xde6dc3c9712   252  48895590             REX.W movq [rbp-0x70],rdx
0xde6dc3c9716   256  c5fb118530ffffff     vmovsd [rbp-0xd0],xmm0
0xde6dc3c971e   25e  4533db               xorl r11,r11
0xde6dc3c9721   261  c57928fa             vmovapd xmm15,xmm2
0xde6dc3c9725   265  c5f928d4             vmovapd xmm2,xmm4
0xde6dc3c9729   269  c4c17928e7           vmovapd xmm4,xmm15
0xde6dc3c972e   26e  660f1f840000000000   nop
0xde6dc3c9737   277  660f1f840000000000   nop
0xde6dc3c9740   280  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3c9744   284  0f869d0f0000         jna 0xde6dc3ca6e7  <+0x1227>
0xde6dc3c974a   28a  468b742708           movl r14,[rdi+r12*1+0x8]
0xde6dc3c974f   28f  4c89b5c0feffff       REX.W movq [rbp-0x140],r14
0xde6dc3c9756   296  453bf3               cmpl r14,r11
0xde6dc3c9759   299  0f86880e0000         jna 0xde6dc3ca5e7  <+0x1127>
0xde6dc3c975f   29f  428b5c2714           movl rbx,[rdi+r12*1+0x14]
0xde6dc3c9764   2a4  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xde6dc3c976b   2ab  413bdb               cmpl rbx,r11
0xde6dc3c976e   2ae  0f86730e0000         jna 0xde6dc3ca5e7  <+0x1127>
0xde6dc3c9774   2b4  428b742720           movl rsi,[rdi+r12*1+0x20]
0xde6dc3c9779   2b9  488975b0             REX.W movq [rbp-0x50],rsi
0xde6dc3c977d   2bd  413bf3               cmpl rsi,r11
0xde6dc3c9780   2c0  0f86610e0000         jna 0xde6dc3ca5e7  <+0x1127>
0xde6dc3c9786   2c6  468b4c272c           movl r9,[rdi+r12*1+0x2c]
0xde6dc3c978b   2cb  4c894db8             REX.W movq [rbp-0x48],r9
0xde6dc3c978f   2cf  453bcb               cmpl r9,r11
0xde6dc3c9792   2d2  0f864f0e0000         jna 0xde6dc3ca5e7  <+0x1127>
0xde6dc3c9798   2d8  468b442704           movl r8,[rdi+r12*1+0x4]
0xde6dc3c979d   2dd  438d0498             leal rax,[r8+r11*4]
0xde6dc3c97a1   2e1  c5fa103407           vmovss xmm6,[rdi+rax*1]
0xde6dc3c97a6   2e6  428b442728           movl rax,[rdi+r12*1+0x28]
0xde6dc3c97ab   2eb  428d1498             leal rdx,[rax+r11*4]
0xde6dc3c97af   2ef  c5fa103c17           vmovss xmm7,[rdi+rdx*1]
0xde6dc3c97b4   2f4  428b54271c           movl rdx,[rdi+r12*1+0x1c]
0xde6dc3c97b9   2f9  4c898510ffffff       REX.W movq [rbp-0xf0],r8
0xde6dc3c97c0   300  468d049a             leal r8,[rdx+r11*4]
0xde6dc3c97c4   304  c4217a100407         vmovss xmm8,[rdi+r8*1]
0xde6dc3c97ca   30a  468b442710           movl r8,[rdi+r12*1+0x10]
0xde6dc3c97cf   30f  478d2498             leal r12,[r8+r11*4]
0xde6dc3c97d3   313  c4217a100c27         vmovss xmm9,[rdi+r12*1]
0xde6dc3c97d9   319  4c895dc0             REX.W movq [rbp-0x40],r11
0xde6dc3c97dd   31d  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0xde6dc3c97e5   325  488985f8feffff       REX.W movq [rbp-0x108],rax
0xde6dc3c97ec   32c  c5fb11bd78ffffff     vmovsd [rbp-0x88],xmm7
0xde6dc3c97f4   334  48899500ffffff       REX.W movq [rbp-0x100],rdx
0xde6dc3c97fb   33b  c57b118568ffffff     vmovsd [rbp-0x98],xmm8
0xde6dc3c9803   343  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0xde6dc3c980a   34a  c57b114d80           vmovsd [rbp-0x80],xmm9
0xde6dc3c980f   34f  83bdd8feffff00       cmpl [rbp-0x128],0x0
0xde6dc3c9816   356  0f85aa010000         jnz 0xde6dc3c99c6  <+0x506>
0xde6dc3c981c   35c  448be3               movl r12,rbx
0xde6dc3c981f   35f  443bf3               cmpl r14,rbx
0xde6dc3c9822   362  450f42e6             cmovcl r12,r14
0xde6dc3c9826   366  458bf1               movl r14,r9
0xde6dc3c9829   369  413bf1               cmpl rsi,r9
0xde6dc3c982c   36c  440f42f6             cmovcl r14,rsi
0xde6dc3c9830   370  418bde               movl rbx,r14
0xde6dc3c9833   373  453be6               cmpl r12,r14
0xde6dc3c9836   376  410f42dc             cmovcl rbx,r12
0xde6dc3c983a   37a  c57928d2             vmovapd xmm10,xmm2
0xde6dc3c983e   37e  c57928da             vmovapd xmm11,xmm2
0xde6dc3c9842   382  4531e4               xorl r12,r12
0xde6dc3c9845   385  448bb510ffffff       movl r14,[rbp-0xf0]
0xde6dc3c984c   38c  e936000000           jmp 0xde6dc3c9887  <+0x3c7>
0xde6dc3c9851   391  660f1f840000000000   nop
0xde6dc3c985a   39a  660f1f840000000000   nop
0xde6dc3c9863   3a3  660f1f840000000000   nop
0xde6dc3c986c   3ac  660f1f840000000000   nop
0xde6dc3c9875   3b5  660f1f840000000000   nop
0xde6dc3c987e   3be  6690                 nop
0xde6dc3c9880   3c0  458be1               movl r12,r9
0xde6dc3c9883   3c3  c57928d9             vmovapd xmm11,xmm1
0xde6dc3c9887   3c7  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3c988b   3cb  0f868c0e0000         jna 0xde6dc3ca71d  <+0x125d>
0xde6dc3c9891   3d1  33f6                 xorl rsi,rsi
0xde6dc3c9893   3d3  4439e3               cmpl rbx,r12
0xde6dc3c9896   3d6  400f96c6             setnal sil
0xde6dc3c989a   3da  4589e1               movl r9,r12
0xde6dc3c989d   3dd  660f1f840000000000   nop
0xde6dc3c98a6   3e6  660f1f840000000000   nop
0xde6dc3c98af   3ef  660f1f840000000000   nop
0xde6dc3c98b8   3f8  0f1f840000000000     nop
0xde6dc3c98c0   400  4183c101             addl r9,0x1
0xde6dc3c98c4   404  85f6                 testl rsi,rsi
0xde6dc3c98c6   406  0f843f000000         jz 0xde6dc3c990b  <+0x44b>
0xde6dc3c98cc   40c  443b4dc8             cmpl r9,[rbp-0x38]
0xde6dc3c98d0   410  0f836c0a0000         jnc 0xde6dc3ca342  <+0xe82>
0xde6dc3c98d6   416  4183c101             addl r9,0x1
0xde6dc3c98da   41a  443b4dc8             cmpl r9,[rbp-0x38]
0xde6dc3c98de   41e  0f835e0a0000         jnc 0xde6dc3ca342  <+0xe82>
0xde6dc3c98e4   424  4183c101             addl r9,0x1
0xde6dc3c98e8   428  443b4dc8             cmpl r9,[rbp-0x38]
0xde6dc3c98ec   42c  0f83500a0000         jnc 0xde6dc3ca342  <+0xe82>
0xde6dc3c98f2   432  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3c98f6   436  0f86b10e0000         jna 0xde6dc3ca7ad  <+0x12ed>
0xde6dc3c98fc   43c  4183c101             addl r9,0x1
0xde6dc3c9900   440  443b4dc8             cmpl r9,[rbp-0x38]
0xde6dc3c9904   444  72ba                 jc 0xde6dc3c98c0  <+0x400>
0xde6dc3c9906   446  e9370a0000           jmp 0xde6dc3ca342  <+0xe82>
0xde6dc3c990b   44b  428d34a0             leal rsi,[rax+r12*4]
0xde6dc3c990f   44f  468d1ca2             leal r11,[rdx+r12*4]
0xde6dc3c9913   453  478d3ca0             leal r15,[r8+r12*4]
0xde6dc3c9917   457  c4217a10243f         vmovss xmm12,[rdi+r15*1]
0xde6dc3c991d   45d  478d24a6             leal r12,[r14+r12*4]
0xde6dc3c9921   461  c4214a5c2c27         vsubss xmm13,xmm6,[rdi+r12*1]
0xde6dc3c9927   467  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0xde6dc3c992f   46f  0f8715000000         ja 0xde6dc3c994a  <+0x48a>
0xde6dc3c9935   475  c4c1782edd           vucomiss xmm3,xmm13
0xde6dc3c993a   47a  0f860e000000         jna 0xde6dc3c994e  <+0x48e>
0xde6dc3c9940   480  c4415a58ed           vaddss xmm13,xmm4,xmm13
0xde6dc3c9945   485  e904000000           jmp 0xde6dc3c994e  <+0x48e>
0xde6dc3c994a   48a  c5125cec             vsubss xmm13,xmm13,xmm4
0xde6dc3c994e   48e  c57a103437           vmovss xmm14,[rdi+rsi*1]
0xde6dc3c9953   493  c4a17a100c1f         vmovss xmm1,[rdi+r11*1]
0xde6dc3c9959   499  c441325ce4           vsubss xmm12,xmm9,xmm12
0xde6dc3c995e   49e  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0xde6dc3c9966   4a6  0f8715000000         ja 0xde6dc3c9981  <+0x4c1>
0xde6dc3c996c   4ac  c4c1782edc           vucomiss xmm3,xmm12
0xde6dc3c9971   4b1  0f860e000000         jna 0xde6dc3c9985  <+0x4c5>
0xde6dc3c9977   4b7  c4415a58e4           vaddss xmm12,xmm4,xmm12
0xde6dc3c997c   4bc  e904000000           jmp 0xde6dc3c9985  <+0x4c5>
0xde6dc3c9981   4c1  c51a5ce4             vsubss xmm12,xmm12,xmm4
0xde6dc3c9985   4c5  c4c17258cb           vaddss xmm1,xmm1,xmm11
0xde6dc3c998a   4ca  c4411259ed           vmulss xmm13,xmm13,xmm13
0xde6dc3c998f   4cf  c4411a59e4           vmulss xmm12,xmm12,xmm12
0xde6dc3c9994   4d4  c4411a58e5           vaddss xmm12,xmm12,xmm13
0xde6dc3c9999   4d9  c4c1782ec4           vucomiss xmm0,xmm12
0xde6dc3c999e   4de  0f870a000000         ja 0xde6dc3c99ae  <+0x4ee>
0xde6dc3c99a4   4e4  c4c17928cb           vmovapd xmm1,xmm11
0xde6dc3c99a9   4e9  e905000000           jmp 0xde6dc3c99b3  <+0x4f3>
0xde6dc3c99ae   4ee  c4410a58d2           vaddss xmm10,xmm14,xmm10
0xde6dc3c99b3   4f3  443b4dc8             cmpl r9,[rbp-0x38]
0xde6dc3c99b7   4f7  0f82c3feffff         jc 0xde6dc3c9880  <+0x3c0>
0xde6dc3c99bd   4fd  c57928d9             vmovapd xmm11,xmm1
0xde6dc3c99c1   501  e97c090000           jmp 0xde6dc3ca342  <+0xe82>
0xde6dc3c99c6   506  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xde6dc3c99ca   50a  468b9c3f8c000000     movl r11,[rdi+r15*1+0x8c]
0xde6dc3c99d2   512  33c9                 xorl rcx,rcx
0xde6dc3c99d4   514  4585db               testl r11,r11
0xde6dc3c99d7   517  0f94c1               setzl cl
0xde6dc3c99da   51a  448ba510ffffff       movl r12,[rbp-0xf0]
0xde6dc3c99e1   521  4585db               testl r11,r11
0xde6dc3c99e4   524  0f84130c0000         jz 0xde6dc3ca5fd  <+0x113d>
0xde6dc3c99ea   52a  468ba43f88000000     movl r12,[rdi+r15*1+0x88]
0xde6dc3c99f2   532  4533c0               xorl r8,r8
0xde6dc3c99f5   535  4585e4               testl r12,r12
0xde6dc3c99f8   538  410f94c0             setzl r8l
0xde6dc3c99fc   53c  4c89a5c8feffff       REX.W movq [rbp-0x138],r12
0xde6dc3c9a03   543  4585e4               testl r12,r12
0xde6dc3c9a06   546  0f840a0c0000         jz 0xde6dc3ca616  <+0x1156>
0xde6dc3c9a0c   54c  428b743f64           movl rsi,[rdi+r15*1+0x64]
0xde6dc3c9a11   551  85c9                 testl rcx,rcx
0xde6dc3c9a13   553  0f94c1               setzl cl
0xde6dc3c9a16   556  0fb6c9               movzxbl rcx,rcx
0xde6dc3c9a19   559  458bcb               movl r9,r11
0xde6dc3c9a1c   55c  442bc9               subl r9,rcx
0xde6dc3c9a1f   55f  c4217a10943f84000000 vmovss xmm10,[rdi+r15*1+0x84]
0xde6dc3c9a29   569  c4413259da           vmulss xmm11,xmm9,xmm10
0xde6dc3c9a2e   56e  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0xde6dc3c9a34   574  c441782edb           vucomiss xmm11,xmm11
0xde6dc3c9a39   579  7a06                 jpe 0xde6dc3c9a41  <+0x581>
0xde6dc3c9a3b   57b  0f8404000000         jz 0xde6dc3c9a45  <+0x585>
0xde6dc3c9a41   581  c57928da             vmovapd xmm11,xmm2
0xde6dc3c9a45   585  c5782eda             vucomiss xmm11,xmm2
0xde6dc3c9a49   589  0f8704000000         ja 0xde6dc3c9a53  <+0x593>
0xde6dc3c9a4f   58f  c57928da             vmovapd xmm11,xmm2
0xde6dc3c9a53   593  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0xde6dc3c9a58   598  c443110bec0b         vroundsd xmm13,xmm13,xmm12,0xb
0xde6dc3c9a5e   59e  c4c17b2ccd           vcvttsd2si rcx,xmm13
0xde6dc3c9a63   5a3  85c9                 testl rcx,rcx
0xde6dc3c9a65   5a5  0f8927000000         jns 0xde6dc3c9a92  <+0x5d2>
0xde6dc3c9a6b   5ab  4c8b1536fbffff       REX.W movq r10,[rip+0xfffffb36]
0xde6dc3c9a72   5b2  c441f96efa           vmovq xmm15,r10
0xde6dc3c9a77   5b7  c4410358fd           vaddsd xmm15,xmm15,xmm13
0xde6dc3c9a7c   5bc  c4c17b2ccf           vcvttsd2si rcx,xmm15
0xde6dc3c9a81   5c1  85c9                 testl rcx,rcx
0xde6dc3c9a83   5c3  0f8809000000         js 0xde6dc3c9a92  <+0x5d2>
0xde6dc3c9a89   5c9  41ba00000080         movl r10,0x80000000
0xde6dc3c9a8f   5cf  410bca               orl rcx,r10
0xde6dc3c9a92   5d2  448bd1               movl r10,rcx
0xde6dc3c9a95   5d5  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0xde6dc3c9a9a   5da  c441792ef5           vucomisd xmm14,xmm13
0xde6dc3c9a9f   5df  0f8ab40d0000         jpe 0xde6dc3ca859  <+0x1399>
0xde6dc3c9aa5   5e5  0f85ae0d0000         jnz 0xde6dc3ca859  <+0x1399>
0xde6dc3c9aab   5eb  448bf1               movl r14,rcx
0xde6dc3c9aae   5ee  443bc9               cmpl r9,rcx
0xde6dc3c9ab1   5f1  450f42f1             cmovcl r14,r9
0xde6dc3c9ab5   5f5  41ba0000804f         movl r10,0x4f800000
0xde6dc3c9abb   5fb  c441796ee2           vmovd xmm12,r10
0xde6dc3c9ac0   600  33c9                 xorl rcx,rcx
0xde6dc3c9ac2   602  c441782ee3           vucomiss xmm12,xmm11
0xde6dc3c9ac7   607  410f47ce             cmoval rcx,r14
0xde6dc3c9acb   60b  458d340b             leal r14,[r11+rcx*1]
0xde6dc3c9acf   60f  418d4eff             leal rcx,[r14-0x1]
0xde6dc3c9ad3   613  448bd1               movl r10,rcx
0xde6dc3c9ad6   616  8bc8                 movl rcx,rax
0xde6dc3c9ad8   618  418bc2               movl rax,r10
0xde6dc3c9adb   61b  448bca               movl r9,rdx
0xde6dc3c9ade   61e  33d2                 xorl rdx,rdx
0xde6dc3c9ae0   620  41f7f3               divl r11
0xde6dc3c9ae3   623  410fafd4             imull rdx,r12
0xde6dc3c9ae7   627  4585c0               testl r8,r8
0xde6dc3c9aea   62a  410f94c0             setzl r8l
0xde6dc3c9aee   62e  450fb6c0             movzxbl r8,r8
0xde6dc3c9af2   632  4489e0               movl rax,r12
0xde6dc3c9af5   635  412bc0               subl rax,r8
0xde6dc3c9af8   638  c52a59d6             vmulss xmm10,xmm10,xmm6
0xde6dc3c9afc   63c  c443290ad209         vroundss xmm10,xmm10,xmm10,0x9
0xde6dc3c9b02   642  4c89b558ffffff       REX.W movq [rbp-0xa8],r14
0xde6dc3c9b09   649  c441782ed2           vucomiss xmm10,xmm10
0xde6dc3c9b0e   64e  7a06                 jpe 0xde6dc3c9b16  <+0x656>
0xde6dc3c9b10   650  0f8404000000         jz 0xde6dc3c9b1a  <+0x65a>
0xde6dc3c9b16   656  c57928d2             vmovapd xmm10,xmm2
0xde6dc3c9b1a   65a  c5782ed2             vucomiss xmm10,xmm2
0xde6dc3c9b1e   65e  0f8704000000         ja 0xde6dc3c9b28  <+0x668>
0xde6dc3c9b24   664  c57928d2             vmovapd xmm10,xmm2
0xde6dc3c9b28   668  c4412a5ada           vcvtss2sd xmm11,xmm10,xmm10
0xde6dc3c9b2d   66d  c443110beb0b         vroundsd xmm13,xmm13,xmm11,0xb
0xde6dc3c9b33   673  c4417b2cc5           vcvttsd2si r8,xmm13
0xde6dc3c9b38   678  4585c0               testl r8,r8
0xde6dc3c9b3b   67b  0f8928000000         jns 0xde6dc3c9b69  <+0x6a9>
0xde6dc3c9b41   681  4c8b1560faffff       REX.W movq r10,[rip+0xfffffa60]
0xde6dc3c9b48   688  c441f96efa           vmovq xmm15,r10
0xde6dc3c9b4d   68d  c4410358fd           vaddsd xmm15,xmm15,xmm13
0xde6dc3c9b52   692  c4417b2cc7           vcvttsd2si r8,xmm15
0xde6dc3c9b57   697  4585c0               testl r8,r8
0xde6dc3c9b5a   69a  0f8809000000         js 0xde6dc3c9b69  <+0x6a9>
0xde6dc3c9b60   6a0  41ba00000080         movl r10,0x80000000
0xde6dc3c9b66   6a6  450bc2               orl r8,r10
0xde6dc3c9b69   6a9  458bd0               movl r10,r8
0xde6dc3c9b6c   6ac  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0xde6dc3c9b71   6b1  c441792ef5           vucomisd xmm14,xmm13
0xde6dc3c9b76   6b6  0f8a000d0000         jpe 0xde6dc3ca87c  <+0x13bc>
0xde6dc3c9b7c   6bc  0f85fa0c0000         jnz 0xde6dc3ca87c  <+0x13bc>
0xde6dc3c9b82   6c2  458bc8               movl r9,r8
0xde6dc3c9b85   6c5  413bc0               cmpl rax,r8
0xde6dc3c9b88   6c8  440f42c8             cmovcl r9,rax
0xde6dc3c9b8c   6cc  4533c0               xorl r8,r8
0xde6dc3c9b8f   6cf  c441782ee2           vucomiss xmm12,xmm10
0xde6dc3c9b94   6d4  450f47c1             cmoval r8,r9
0xde6dc3c9b98   6d8  4501e0               addl r8,r12
0xde6dc3c9b9b   6db  418d40ff             leal rax,[r8-0x1]
0xde6dc3c9b9f   6df  448bca               movl r9,rdx
0xde6dc3c9ba2   6e2  33d2                 xorl rdx,rdx
0xde6dc3c9ba4   6e4  41f7f4               divl r12
0xde6dc3c9ba7   6e7  428d040a             leal rax,[rdx+r9*1]
0xde6dc3c9bab   6eb  428b4c3f68           movl rcx,[rdi+r15*1+0x68]
0xde6dc3c9bb0   6f0  48899550ffffff       REX.W movq [rbp-0xb0],rdx
0xde6dc3c9bb7   6f7  3bc1                 cmpl rax,rcx
0xde6dc3c9bb9   6f9  0f8209000000         jc 0xde6dc3c9bc8  <+0x708>
0xde6dc3c9bbf   6ff  33c0                 xorl rax,rax
0xde6dc3c9bc1   701  8bd8                 movl rbx,rax
0xde6dc3c9bc3   703  e94b000000           jmp 0xde6dc3c9c13  <+0x753>
0xde6dc3c9bc8   708  8d5801               leal rbx,[rax+0x1]
0xde6dc3c9bcb   70b  3bcb                 cmpl rcx,rbx
0xde6dc3c9bcd   70d  76f0                 jna 0xde6dc3c9bbf  <+0x6ff>
0xde6dc3c9bcf   70f  8d1c9e               leal rbx,[rsi+rbx*4]
0xde6dc3c9bd2   712  8b1c1f               movl rbx,[rdi+rbx*1]
0xde6dc3c9bd5   715  8d0486               leal rax,[rsi+rax*4]
0xde6dc3c9bd8   718  8b0407               movl rax,[rdi+rax*1]
0xde6dc3c9bdb   71b  3bd8                 cmpl rbx,rax
0xde6dc3c9bdd   71d  0f8223000000         jc 0xde6dc3c9c06  <+0x746>
0xde6dc3c9be3   723  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xde6dc3c9beb   72b  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0xde6dc3c9bf3   733  0f831a000000         jnc 0xde6dc3c9c13  <+0x753>
0xde6dc3c9bf9   739  41be04000000         movl r14,0x4
0xde6dc3c9bff   73f  33db                 xorl rbx,rbx
0xde6dc3c9c01   741  e918000000           jmp 0xde6dc3c9c1e  <+0x75e>
0xde6dc3c9c06   746  33db                 xorl rbx,rbx
0xde6dc3c9c08   748  41be04000000         movl r14,0x4
0xde6dc3c9c0e   74e  e90b000000           jmp 0xde6dc3c9c1e  <+0x75e>
0xde6dc3c9c13   753  2bd8                 subl rbx,rax
0xde6dc3c9c15   755  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xde6dc3c9c1a   75a  458d3486             leal r14,[r14+rax*4]
0xde6dc3c9c1e   75e  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0xde6dc3c9c25   765  448bf2               movl r14,rdx
0xde6dc3c9c28   768  418bc0               movl rax,r8
0xde6dc3c9c2b   76b  33d2                 xorl rdx,rdx
0xde6dc3c9c2d   76d  41f7f4               divl r12
0xde6dc3c9c30   770  418d0411             leal rax,[r9+rdx*1]
0xde6dc3c9c34   774  48899db0feffff       REX.W movq [rbp-0x150],rbx
0xde6dc3c9c3b   77b  3bc1                 cmpl rax,rcx
0xde6dc3c9c3d   77d  0f8209000000         jc 0xde6dc3c9c4c  <+0x78c>
0xde6dc3c9c43   783  33c0                 xorl rax,rax
0xde6dc3c9c45   785  8bd8                 movl rbx,rax
0xde6dc3c9c47   787  e94b000000           jmp 0xde6dc3c9c97  <+0x7d7>
0xde6dc3c9c4c   78c  8d5801               leal rbx,[rax+0x1]
0xde6dc3c9c4f   78f  3bcb                 cmpl rcx,rbx
0xde6dc3c9c51   791  76f0                 jna 0xde6dc3c9c43  <+0x783>
0xde6dc3c9c53   793  8d1c9e               leal rbx,[rsi+rbx*4]
0xde6dc3c9c56   796  8b1c1f               movl rbx,[rdi+rbx*1]
0xde6dc3c9c59   799  8d0486               leal rax,[rsi+rax*4]
0xde6dc3c9c5c   79c  8b0407               movl rax,[rdi+rax*1]
0xde6dc3c9c5f   79f  3bd8                 cmpl rbx,rax
0xde6dc3c9c61   7a1  0f8223000000         jc 0xde6dc3c9c8a  <+0x7ca>
0xde6dc3c9c67   7a7  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xde6dc3c9c6f   7af  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0xde6dc3c9c77   7b7  0f831a000000         jnc 0xde6dc3c9c97  <+0x7d7>
0xde6dc3c9c7d   7bd  41be04000000         movl r14,0x4
0xde6dc3c9c83   7c3  33db                 xorl rbx,rbx
0xde6dc3c9c85   7c5  e918000000           jmp 0xde6dc3c9ca2  <+0x7e2>
0xde6dc3c9c8a   7ca  33db                 xorl rbx,rbx
0xde6dc3c9c8c   7cc  41be04000000         movl r14,0x4
0xde6dc3c9c92   7d2  e90b000000           jmp 0xde6dc3c9ca2  <+0x7e2>
0xde6dc3c9c97   7d7  2bd8                 subl rbx,rax
0xde6dc3c9c99   7d9  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xde6dc3c9c9e   7de  458d3486             leal r14,[r14+rax*4]
0xde6dc3c9ca2   7e2  418d4001             leal rax,[r8+0x1]
0xde6dc3c9ca6   7e6  448bc2               movl r8,rdx
0xde6dc3c9ca9   7e9  33d2                 xorl rdx,rdx
0xde6dc3c9cab   7eb  41f7f4               divl r12
0xde6dc3c9cae   7ee  418d0411             leal rax,[r9+rdx*1]
0xde6dc3c9cb2   7f2  4c89b5a8feffff       REX.W movq [rbp-0x158],r14
0xde6dc3c9cb9   7f9  48899da0feffff       REX.W movq [rbp-0x160],rbx
0xde6dc3c9cc0   800  3bc1                 cmpl rax,rcx
0xde6dc3c9cc2   802  0f820a000000         jc 0xde6dc3c9cd2  <+0x812>
0xde6dc3c9cc8   808  33c0                 xorl rax,rax
0xde6dc3c9cca   80a  448bc8               movl r9,rax
0xde6dc3c9ccd   80d  e952000000           jmp 0xde6dc3c9d24  <+0x864>
0xde6dc3c9cd2   812  448d4801             leal r9,[rax+0x1]
0xde6dc3c9cd6   816  413bc9               cmpl rcx,r9
0xde6dc3c9cd9   819  76ed                 jna 0xde6dc3c9cc8  <+0x808>
0xde6dc3c9cdb   81b  468d0c8e             leal r9,[rsi+r9*4]
0xde6dc3c9cdf   81f  468b0c0f             movl r9,[rdi+r9*1]
0xde6dc3c9ce3   823  8d0486               leal rax,[rsi+rax*4]
0xde6dc3c9ce6   826  8b0407               movl rax,[rdi+rax*1]
0xde6dc3c9ce9   829  443bc8               cmpl r9,rax
0xde6dc3c9cec   82c  0f8224000000         jc 0xde6dc3c9d16  <+0x856>
0xde6dc3c9cf2   832  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xde6dc3c9cfa   83a  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xde6dc3c9d02   842  0f831c000000         jnc 0xde6dc3c9d24  <+0x864>
0xde6dc3c9d08   848  41be04000000         movl r14,0x4
0xde6dc3c9d0e   84e  4533c9               xorl r9,r9
0xde6dc3c9d11   851  e91a000000           jmp 0xde6dc3c9d30  <+0x870>
0xde6dc3c9d16   856  4533c9               xorl r9,r9
0xde6dc3c9d19   859  41be04000000         movl r14,0x4
0xde6dc3c9d1f   85f  e90c000000           jmp 0xde6dc3c9d30  <+0x870>
0xde6dc3c9d24   864  442bc8               subl r9,rax
0xde6dc3c9d27   867  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xde6dc3c9d2c   86c  458d3486             leal r14,[r14+rax*4]
0xde6dc3c9d30   870  8bda                 movl rbx,rdx
0xde6dc3c9d32   872  8b8558ffffff         movl rax,[rbp-0xa8]
0xde6dc3c9d38   878  33d2                 xorl rdx,rdx
0xde6dc3c9d3a   87a  41f7f3               divl r11
0xde6dc3c9d3d   87d  410fafd4             imull rdx,r12
0xde6dc3c9d41   881  4c89b5d0feffff       REX.W movq [rbp-0x130],r14
0xde6dc3c9d48   888  8b8550ffffff         movl rax,[rbp-0xb0]
0xde6dc3c9d4e   88e  448d3410             leal r14,[rax+rdx*1]
0xde6dc3c9d52   892  4c898de8feffff       REX.W movq [rbp-0x118],r9
0xde6dc3c9d59   899  443bf1               cmpl r14,rcx
0xde6dc3c9d5c   89c  0f820b000000         jc 0xde6dc3c9d6d  <+0x8ad>
0xde6dc3c9d62   8a2  4533c9               xorl r9,r9
0xde6dc3c9d65   8a5  458bf1               movl r14,r9
0xde6dc3c9d68   8a8  e954000000           jmp 0xde6dc3c9dc1  <+0x901>
0xde6dc3c9d6d   8ad  458d4e01             leal r9,[r14+0x1]
0xde6dc3c9d71   8b1  413bc9               cmpl rcx,r9
0xde6dc3c9d74   8b4  76ec                 jna 0xde6dc3c9d62  <+0x8a2>
0xde6dc3c9d76   8b6  468d0c8e             leal r9,[rsi+r9*4]
0xde6dc3c9d7a   8ba  468b0c0f             movl r9,[rdi+r9*1]
0xde6dc3c9d7e   8be  468d34b6             leal r14,[rsi+r14*4]
0xde6dc3c9d82   8c2  468b3437             movl r14,[rdi+r14*1]
0xde6dc3c9d86   8c6  453bce               cmpl r9,r14
0xde6dc3c9d89   8c9  0f8224000000         jc 0xde6dc3c9db3  <+0x8f3>
0xde6dc3c9d8f   8cf  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xde6dc3c9d97   8d7  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xde6dc3c9d9f   8df  0f831c000000         jnc 0xde6dc3c9dc1  <+0x901>
0xde6dc3c9da5   8e5  41bc04000000         movl r12,0x4
0xde6dc3c9dab   8eb  4533c9               xorl r9,r9
0xde6dc3c9dae   8ee  e91a000000           jmp 0xde6dc3c9dcd  <+0x90d>
0xde6dc3c9db3   8f3  4533c9               xorl r9,r9
0xde6dc3c9db6   8f6  41bc04000000         movl r12,0x4
0xde6dc3c9dbc   8fc  e90c000000           jmp 0xde6dc3c9dcd  <+0x90d>
0xde6dc3c9dc1   901  452bce               subl r9,r14
0xde6dc3c9dc4   904  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xde6dc3c9dc9   909  478d24b4             leal r12,[r12+r14*4]
0xde6dc3c9dcd   90d  458d3410             leal r14,[r8+rdx*1]
0xde6dc3c9dd1   911  4c89a5e0feffff       REX.W movq [rbp-0x120],r12
0xde6dc3c9dd8   918  4c898df0feffff       REX.W movq [rbp-0x110],r9
0xde6dc3c9ddf   91f  443bf1               cmpl r14,rcx
0xde6dc3c9de2   922  0f820b000000         jc 0xde6dc3c9df3  <+0x933>
0xde6dc3c9de8   928  4531e4               xorl r12,r12
0xde6dc3c9deb   92b  4589e6               movl r14,r12
0xde6dc3c9dee   92e  e954000000           jmp 0xde6dc3c9e47  <+0x987>
0xde6dc3c9df3   933  458d6601             leal r12,[r14+0x1]
0xde6dc3c9df7   937  4439e1               cmpl rcx,r12
0xde6dc3c9dfa   93a  76ec                 jna 0xde6dc3c9de8  <+0x928>
0xde6dc3c9dfc   93c  468d24a6             leal r12,[rsi+r12*4]
0xde6dc3c9e00   940  468b2427             movl r12,[rdi+r12*1]
0xde6dc3c9e04   944  468d34b6             leal r14,[rsi+r14*4]
0xde6dc3c9e08   948  468b3437             movl r14,[rdi+r14*1]
0xde6dc3c9e0c   94c  453be6               cmpl r12,r14
0xde6dc3c9e0f   94f  0f8224000000         jc 0xde6dc3c9e39  <+0x979>
0xde6dc3c9e15   955  468b8c3f80000000     movl r9,[rdi+r15*1+0x80]
0xde6dc3c9e1d   95d  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0xde6dc3c9e25   965  0f831c000000         jnc 0xde6dc3c9e47  <+0x987>
0xde6dc3c9e2b   96b  41bc04000000         movl r12,0x4
0xde6dc3c9e31   971  4533f6               xorl r14,r14
0xde6dc3c9e34   974  e923000000           jmp 0xde6dc3c9e5c  <+0x99c>
0xde6dc3c9e39   979  4533f6               xorl r14,r14
0xde6dc3c9e3c   97c  41bc04000000         movl r12,0x4
0xde6dc3c9e42   982  e915000000           jmp 0xde6dc3c9e5c  <+0x99c>
0xde6dc3c9e47   987  452be6               subl r12,r14
0xde6dc3c9e4a   98a  468b4c3f7c           movl r9,[rdi+r15*1+0x7c]
0xde6dc3c9e4f   98f  478d34b1             leal r14,[r9+r14*4]
0xde6dc3c9e53   993  458bd6               movl r10,r14
0xde6dc3c9e56   996  4589e6               movl r14,r12
0xde6dc3c9e59   999  458be2               movl r12,r10
0xde6dc3c9e5c   99c  03d3                 addl rdx,rbx
0xde6dc3c9e5e   99e  4c89a548ffffff       REX.W movq [rbp-0xb8],r12
0xde6dc3c9e65   9a5  4c89b538ffffff       REX.W movq [rbp-0xc8],r14
0xde6dc3c9e6c   9ac  3bd1                 cmpl rdx,rcx
0xde6dc3c9e6e   9ae  0f820a000000         jc 0xde6dc3c9e7e  <+0x9be>
0xde6dc3c9e74   9b4  33d2                 xorl rdx,rdx
0xde6dc3c9e76   9b6  448bca               movl r9,rdx
0xde6dc3c9e79   9b9  e952000000           jmp 0xde6dc3c9ed0  <+0xa10>
0xde6dc3c9e7e   9be  448d4a01             leal r9,[rdx+0x1]
0xde6dc3c9e82   9c2  413bc9               cmpl rcx,r9
0xde6dc3c9e85   9c5  76ed                 jna 0xde6dc3c9e74  <+0x9b4>
0xde6dc3c9e87   9c7  468d0c8e             leal r9,[rsi+r9*4]
0xde6dc3c9e8b   9cb  468b0c0f             movl r9,[rdi+r9*1]
0xde6dc3c9e8f   9cf  8d1496               leal rdx,[rsi+rdx*4]
0xde6dc3c9e92   9d2  8b1417               movl rdx,[rdi+rdx*1]
0xde6dc3c9e95   9d5  443bca               cmpl r9,rdx
0xde6dc3c9e98   9d8  0f8224000000         jc 0xde6dc3c9ec2  <+0xa02>
0xde6dc3c9e9e   9de  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xde6dc3c9ea6   9e6  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xde6dc3c9eae   9ee  0f831c000000         jnc 0xde6dc3c9ed0  <+0xa10>
0xde6dc3c9eb4   9f4  41bc04000000         movl r12,0x4
0xde6dc3c9eba   9fa  4533c9               xorl r9,r9
0xde6dc3c9ebd   9fd  e91a000000           jmp 0xde6dc3c9edc  <+0xa1c>
0xde6dc3c9ec2   a02  4533c9               xorl r9,r9
0xde6dc3c9ec5   a05  41bc04000000         movl r12,0x4
0xde6dc3c9ecb   a0b  e90c000000           jmp 0xde6dc3c9edc  <+0xa1c>
0xde6dc3c9ed0   a10  442bca               subl r9,rdx
0xde6dc3c9ed3   a13  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xde6dc3c9ed8   a18  458d2494             leal r12,[r12+rdx*4]
0xde6dc3c9edc   a1c  8b9558ffffff         movl rdx,[rbp-0xa8]
0xde6dc3c9ee2   a22  83c201               addl rdx,0x1
0xde6dc3c9ee5   a25  448bf0               movl r14,rax
0xde6dc3c9ee8   a28  8bc2                 movl rax,rdx
0xde6dc3c9eea   a2a  33d2                 xorl rdx,rdx
0xde6dc3c9eec   a2c  41f7f3               divl r11
0xde6dc3c9eef   a2f  448b9dc8feffff       movl r11,[rbp-0x138]
0xde6dc3c9ef6   a36  440fafda             imull r11,rdx
0xde6dc3c9efa   a3a  4503f3               addl r14,r11
0xde6dc3c9efd   a3d  4c89a540ffffff       REX.W movq [rbp-0xc0],r12
0xde6dc3c9f04   a44  443bf1               cmpl r14,rcx
0xde6dc3c9f07   a47  0f820a000000         jc 0xde6dc3c9f17  <+0xa57>
0xde6dc3c9f0d   a4d  33c0                 xorl rax,rax
0xde6dc3c9f0f   a4f  448bf0               movl r14,rax
0xde6dc3c9f12   a52  e94f000000           jmp 0xde6dc3c9f66  <+0xaa6>
0xde6dc3c9f17   a57  418d4601             leal rax,[r14+0x1]
0xde6dc3c9f1b   a5b  3bc8                 cmpl rcx,rax
0xde6dc3c9f1d   a5d  76ee                 jna 0xde6dc3c9f0d  <+0xa4d>
0xde6dc3c9f1f   a5f  8d0486               leal rax,[rsi+rax*4]
0xde6dc3c9f22   a62  8b0407               movl rax,[rdi+rax*1]
0xde6dc3c9f25   a65  468d34b6             leal r14,[rsi+r14*4]
0xde6dc3c9f29   a69  468b3437             movl r14,[rdi+r14*1]
0xde6dc3c9f2d   a6d  413bc6               cmpl rax,r14
0xde6dc3c9f30   a70  0f8223000000         jc 0xde6dc3c9f59  <+0xa99>
0xde6dc3c9f36   a76  428b943f80000000     movl rdx,[rdi+r15*1+0x80]
0xde6dc3c9f3e   a7e  4239843f80000000     cmpl [rdi+r15*1+0x80],rax
0xde6dc3c9f46   a86  0f831a000000         jnc 0xde6dc3c9f66  <+0xaa6>
0xde6dc3c9f4c   a8c  41be04000000         movl r14,0x4
0xde6dc3c9f52   a92  33c0                 xorl rax,rax
0xde6dc3c9f54   a94  e919000000           jmp 0xde6dc3c9f72  <+0xab2>
0xde6dc3c9f59   a99  33c0                 xorl rax,rax
0xde6dc3c9f5b   a9b  41be04000000         movl r14,0x4
0xde6dc3c9f61   aa1  e90c000000           jmp 0xde6dc3c9f72  <+0xab2>
0xde6dc3c9f66   aa6  412bc6               subl rax,r14
0xde6dc3c9f69   aa9  428b543f7c           movl rdx,[rdi+r15*1+0x7c]
0xde6dc3c9f6e   aae  468d34b2             leal r14,[rdx+r14*4]
0xde6dc3c9f72   ab2  4503c3               addl r8,r11
0xde6dc3c9f75   ab5  443bc1               cmpl r8,rcx
0xde6dc3c9f78   ab8  0f820a000000         jc 0xde6dc3c9f88  <+0xac8>
0xde6dc3c9f7e   abe  33d2                 xorl rdx,rdx
0xde6dc3c9f80   ac0  448bc2               movl r8,rdx
0xde6dc3c9f83   ac3  e94f000000           jmp 0xde6dc3c9fd7  <+0xb17>
0xde6dc3c9f88   ac8  418d5001             leal rdx,[r8+0x1]
0xde6dc3c9f8c   acc  3bca                 cmpl rcx,rdx
0xde6dc3c9f8e   ace  76ee                 jna 0xde6dc3c9f7e  <+0xabe>
0xde6dc3c9f90   ad0  8d1496               leal rdx,[rsi+rdx*4]
0xde6dc3c9f93   ad3  8b1417               movl rdx,[rdi+rdx*1]
0xde6dc3c9f96   ad6  468d0486             leal r8,[rsi+r8*4]
0xde6dc3c9f9a   ada  468b0407             movl r8,[rdi+r8*1]
0xde6dc3c9f9e   ade  413bd0               cmpl rdx,r8
0xde6dc3c9fa1   ae1  0f8223000000         jc 0xde6dc3c9fca  <+0xb0a>
0xde6dc3c9fa7   ae7  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xde6dc3c9faf   aef  4239943f80000000     cmpl [rdi+r15*1+0x80],rdx
0xde6dc3c9fb7   af7  0f831a000000         jnc 0xde6dc3c9fd7  <+0xb17>
0xde6dc3c9fbd   afd  41b804000000         movl r8,0x4
0xde6dc3c9fc3   b03  33d2                 xorl rdx,rdx
0xde6dc3c9fc5   b05  e919000000           jmp 0xde6dc3c9fe3  <+0xb23>
0xde6dc3c9fca   b0a  33d2                 xorl rdx,rdx
0xde6dc3c9fcc   b0c  41b804000000         movl r8,0x4
0xde6dc3c9fd2   b12  e90c000000           jmp 0xde6dc3c9fe3  <+0xb23>
0xde6dc3c9fd7   b17  412bd0               subl rdx,r8
0xde6dc3c9fda   b1a  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xde6dc3c9fdf   b1f  478d0484             leal r8,[r12+r8*4]
0xde6dc3c9fe3   b23  4403db               addl r11,rbx
0xde6dc3c9fe6   b26  443bd9               cmpl r11,rcx
0xde6dc3c9fe9   b29  0f820b000000         jc 0xde6dc3c9ffa  <+0xb3a>
0xde6dc3c9fef   b2f  4533db               xorl r11,r11
0xde6dc3c9ff2   b32  458be3               movl r12,r11
0xde6dc3c9ff5   b35  e954000000           jmp 0xde6dc3ca04e  <+0xb8e>
0xde6dc3c9ffa   b3a  458d6301             leal r12,[r11+0x1]
0xde6dc3c9ffe   b3e  4439e1               cmpl rcx,r12
0xde6dc3ca001   b41  76ec                 jna 0xde6dc3c9fef  <+0xb2f>
0xde6dc3ca003   b43  468d24a6             leal r12,[rsi+r12*4]
0xde6dc3ca007   b47  468b2427             movl r12,[rdi+r12*1]
0xde6dc3ca00b   b4b  468d1c9e             leal r11,[rsi+r11*4]
0xde6dc3ca00f   b4f  468b1c1f             movl r11,[rdi+r11*1]
0xde6dc3ca013   b53  453be3               cmpl r12,r11
0xde6dc3ca016   b56  0f8224000000         jc 0xde6dc3ca040  <+0xb80>
0xde6dc3ca01c   b5c  428b9c3f80000000     movl rbx,[rdi+r15*1+0x80]
0xde6dc3ca024   b64  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0xde6dc3ca02c   b6c  0f831c000000         jnc 0xde6dc3ca04e  <+0xb8e>
0xde6dc3ca032   b72  41bb04000000         movl r11,0x4
0xde6dc3ca038   b78  4531e4               xorl r12,r12
0xde6dc3ca03b   b7b  e91a000000           jmp 0xde6dc3ca05a  <+0xb9a>
0xde6dc3ca040   b80  4531e4               xorl r12,r12
0xde6dc3ca043   b83  41bb04000000         movl r11,0x4
0xde6dc3ca049   b89  e90c000000           jmp 0xde6dc3ca05a  <+0xb9a>
0xde6dc3ca04e   b8e  452be3               subl r12,r11
0xde6dc3ca051   b91  428b5c3f7c           movl rbx,[rdi+r15*1+0x7c]
0xde6dc3ca056   b96  468d1c9b             leal r11,[rbx+r11*4]
0xde6dc3ca05a   b9a  8b5de0               movl rbx,[rbp-0x20]
0xde6dc3ca05d   b9d  4489641f4c           movl [rdi+rbx*1+0x4c],r12
0xde6dc3ca062   ba2  44895c1f48           movl [rdi+rbx*1+0x48],r11
0xde6dc3ca067   ba7  89541f44             movl [rdi+rbx*1+0x44],rdx
0xde6dc3ca06b   bab  4489441f40           movl [rdi+rbx*1+0x40],r8
0xde6dc3ca070   bb0  89441f3c             movl [rdi+rbx*1+0x3c],rax
0xde6dc3ca074   bb4  4489741f38           movl [rdi+rbx*1+0x38],r14
0xde6dc3ca079   bb9  44894c1f34           movl [rdi+rbx*1+0x34],r9
0xde6dc3ca07e   bbe  448ba540ffffff       movl r12,[rbp-0xc0]
0xde6dc3ca085   bc5  4489641f30           movl [rdi+rbx*1+0x30],r12
0xde6dc3ca08a   bca  448ba538ffffff       movl r12,[rbp-0xc8]
0xde6dc3ca091   bd1  4489641f2c           movl [rdi+rbx*1+0x2c],r12
0xde6dc3ca096   bd6  448ba548ffffff       movl r12,[rbp-0xb8]
0xde6dc3ca09d   bdd  4489641f28           movl [rdi+rbx*1+0x28],r12
0xde6dc3ca0a2   be2  448b8df0feffff       movl r9,[rbp-0x110]
0xde6dc3ca0a9   be9  44894c1f24           movl [rdi+rbx*1+0x24],r9
0xde6dc3ca0ae   bee  448ba5e0feffff       movl r12,[rbp-0x120]
0xde6dc3ca0b5   bf5  4489641f20           movl [rdi+rbx*1+0x20],r12
0xde6dc3ca0ba   bfa  448b8de8feffff       movl r9,[rbp-0x118]
0xde6dc3ca0c1   c01  44894c1f1c           movl [rdi+rbx*1+0x1c],r9
0xde6dc3ca0c6   c06  448bb5d0feffff       movl r14,[rbp-0x130]
0xde6dc3ca0cd   c0d  4489741f18           movl [rdi+rbx*1+0x18],r14
0xde6dc3ca0d2   c12  448b85a0feffff       movl r8,[rbp-0x160]
0xde6dc3ca0d9   c19  4489441f14           movl [rdi+rbx*1+0x14],r8
0xde6dc3ca0de   c1e  448bb5a8feffff       movl r14,[rbp-0x158]
0xde6dc3ca0e5   c25  4489741f10           movl [rdi+rbx*1+0x10],r14
0xde6dc3ca0ea   c2a  448b85b0feffff       movl r8,[rbp-0x150]
0xde6dc3ca0f1   c31  4489441f0c           movl [rdi+rbx*1+0xc],r8
0xde6dc3ca0f6   c36  448bb5b8feffff       movl r14,[rbp-0x148]
0xde6dc3ca0fd   c3d  4489741f08           movl [rdi+rbx*1+0x8],r14
0xde6dc3ca102   c42  49b80000000009000000 REX.W movq r8,0x900000000
0xde6dc3ca10c   c4c  4c89041f             REX.W movq [rdi+rbx*1],r8
0xde6dc3ca110   c50  448b8560ffffff       movl r8,[rbp-0xa0]
0xde6dc3ca117   c57  448b9dc0feffff       movl r11,[rbp-0x140]
0xde6dc3ca11e   c5e  443b9d60ffffff       cmpl r11,[rbp-0xa0]
0xde6dc3ca125   c65  450f42c3             cmovcl r8,r11
0xde6dc3ca129   c69  448b4db8             movl r9,[rbp-0x48]
0xde6dc3ca12d   c6d  448b5db0             movl r11,[rbp-0x50]
0xde6dc3ca131   c71  443b5db8             cmpl r11,[rbp-0x48]
0xde6dc3ca135   c75  450f42cb             cmovcl r9,r11
0xde6dc3ca139   c79  458bd9               movl r11,r9
0xde6dc3ca13c   c7c  453bc1               cmpl r8,r9
0xde6dc3ca13f   c7f  450f42d8             cmovcl r11,r8
0xde6dc3ca143   c83  4c899d48ffffff       REX.W movq [rbp-0xb8],r11
0xde6dc3ca14a   c8a  c57928d2             vmovapd xmm10,xmm2
0xde6dc3ca14e   c8e  c57928da             vmovapd xmm11,xmm2
0xde6dc3ca152   c92  4533c0               xorl r8,r8
0xde6dc3ca155   c95  8b9510ffffff         movl rdx,[rbp-0xf0]
0xde6dc3ca15b   c9b  8b8508ffffff         movl rax,[rbp-0xf8]
0xde6dc3ca161   ca1  448bb500ffffff       movl r14,[rbp-0x100]
0xde6dc3ca168   ca8  448ba5f8feffff       movl r12,[rbp-0x108]
0xde6dc3ca16f   caf  e90f000000           jmp 0xde6dc3ca183  <+0xcc3>
0xde6dc3ca174   cb4  660f1f840000000000   nop
0xde6dc3ca17d   cbd  0f1f00               nop
0xde6dc3ca180   cc0  8b5de0               movl rbx,[rbp-0x20]
0xde6dc3ca183   cc3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3ca187   cc7  0f8614070000         jna 0xde6dc3ca8a1  <+0x13e1>
0xde6dc3ca18d   ccd  428d4cc308           leal rcx,[rbx+r8*8+0x8]
0xde6dc3ca192   cd2  8b740f04             movl rsi,[rdi+rcx*1+0x4]
0xde6dc3ca196   cd6  85f6                 testl rsi,rsi
0xde6dc3ca198   cd8  0f8496010000         jz 0xde6dc3ca334  <+0xe74>
0xde6dc3ca19e   cde  8b0c0f               movl rcx,[rdi+rcx*1]
0xde6dc3ca1a1   ce1  8d34b1               leal rsi,[rcx+rsi*4]
0xde6dc3ca1a4   ce4  e922000000           jmp 0xde6dc3ca1cb  <+0xd0b>
0xde6dc3ca1a9   ce9  660f1f840000000000   nop
0xde6dc3ca1b2   cf2  660f1f840000000000   nop
0xde6dc3ca1bb   cfb  0f1f440000           nop
0xde6dc3ca1c0   d00  448b9d48ffffff       movl r11,[rbp-0xb8]
0xde6dc3ca1c7   d07  c57928d9             vmovapd xmm11,xmm1
0xde6dc3ca1cb   d0b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3ca1cf   d0f  0f8659070000         jna 0xde6dc3ca92e  <+0x146e>
0xde6dc3ca1d5   d15  660f1f840000000000   nop
0xde6dc3ca1de   d1e  660f1f840000000000   nop
0xde6dc3ca1e7   d27  660f1f840000000000   nop
0xde6dc3ca1f0   d30  660f1f840000000000   nop
0xde6dc3ca1f9   d39  0f1f8000000000       nop
0xde6dc3ca200   d40  448d4904             leal r9,[rcx+0x4]
0xde6dc3ca204   d44  8b0c0f               movl rcx,[rdi+rcx*1]
0xde6dc3ca207   d47  443bd9               cmpl r11,rcx
0xde6dc3ca20a   d4a  0f8760000000         ja 0xde6dc3ca270  <+0xdb0>
0xde6dc3ca210   d50  443bce               cmpl r9,rsi
0xde6dc3ca213   d53  0f841b010000         jz 0xde6dc3ca334  <+0xe74>
0xde6dc3ca219   d59  418d4904             leal rcx,[r9+0x4]
0xde6dc3ca21d   d5d  468b0c0f             movl r9,[rdi+r9*1]
0xde6dc3ca221   d61  453bd9               cmpl r11,r9
0xde6dc3ca224   d64  0f874f000000         ja 0xde6dc3ca279  <+0xdb9>
0xde6dc3ca22a   d6a  3bce                 cmpl rcx,rsi
0xde6dc3ca22c   d6c  0f8402010000         jz 0xde6dc3ca334  <+0xe74>
0xde6dc3ca232   d72  448d4904             leal r9,[rcx+0x4]
0xde6dc3ca236   d76  8b0c0f               movl rcx,[rdi+rcx*1]
0xde6dc3ca239   d79  443bd9               cmpl r11,rcx
0xde6dc3ca23c   d7c  0f872e000000         ja 0xde6dc3ca270  <+0xdb0>
0xde6dc3ca242   d82  443bce               cmpl r9,rsi
0xde6dc3ca245   d85  0f84e9000000         jz 0xde6dc3ca334  <+0xe74>
0xde6dc3ca24b   d8b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xde6dc3ca24f   d8f  0f867d070000         jna 0xde6dc3ca9d2  <+0x1512>
0xde6dc3ca255   d95  418d4904             leal rcx,[r9+0x4]
0xde6dc3ca259   d99  468b0c0f             movl r9,[rdi+r9*1]
0xde6dc3ca25d   d9d  453bd9               cmpl r11,r9
0xde6dc3ca260   da0  0f8713000000         ja 0xde6dc3ca279  <+0xdb9>
0xde6dc3ca266   da6  3bce                 cmpl rcx,rsi
0xde6dc3ca268   da8  0f84c6000000         jz 0xde6dc3ca334  <+0xe74>
0xde6dc3ca26e   dae  eb90                 jmp 0xde6dc3ca200  <+0xd40>
0xde6dc3ca270   db0  448bd1               movl r10,rcx
0xde6dc3ca273   db3  418bc9               movl rcx,r9
0xde6dc3ca276   db6  458bca               movl r9,r10
0xde6dc3ca279   db9  438d1c8c             leal rbx,[r12+r9*4]
0xde6dc3ca27d   dbd  478d3c8e             leal r15,[r14+r9*4]
0xde6dc3ca281   dc1  468d1c88             leal r11,[rax+r9*4]
0xde6dc3ca285   dc5  c4217a10241f         vmovss xmm12,[rdi+r11*1]
0xde6dc3ca28b   dcb  468d1c8a             leal r11,[rdx+r9*4]
0xde6dc3ca28f   dcf  c4214a5c2c1f         vsubss xmm13,xmm6,[rdi+r11*1]
0xde6dc3ca295   dd5  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0xde6dc3ca29d   ddd  0f8715000000         ja 0xde6dc3ca2b8  <+0xdf8>
0xde6dc3ca2a3   de3  c4c1782edd           vucomiss xmm3,xmm13
0xde6dc3ca2a8   de8  0f860e000000         jna 0xde6dc3ca2bc  <+0xdfc>
0xde6dc3ca2ae   dee  c4415a58ed           vaddss xmm13,xmm4,xmm13
0xde6dc3ca2b3   df3  e904000000           jmp 0xde6dc3ca2bc  <+0xdfc>
0xde6dc3ca2b8   df8  c5125cec             vsubss xmm13,xmm13,xmm4
0xde6dc3ca2bc   dfc  c57a10341f           vmovss xmm14,[rdi+rbx*1]
0xde6dc3ca2c1   e01  c4a17a100c3f         vmovss xmm1,[rdi+r15*1]
0xde6dc3ca2c7   e07  c441325ce4           vsubss xmm12,xmm9,xmm12
0xde6dc3ca2cc   e0c  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0xde6dc3ca2d4   e14  0f8715000000         ja 0xde6dc3ca2ef  <+0xe2f>
0xde6dc3ca2da   e1a  c4c1782edc           vucomiss xmm3,xmm12
0xde6dc3ca2df   e1f  0f860e000000         jna 0xde6dc3ca2f3  <+0xe33>
0xde6dc3ca2e5   e25  c4415a58e4           vaddss xmm12,xmm4,xmm12
0xde6dc3ca2ea   e2a  e904000000           jmp 0xde6dc3ca2f3  <+0xe33>
0xde6dc3ca2ef   e2f  c51a5ce4             vsubss xmm12,xmm12,xmm4
0xde6dc3ca2f3   e33  c4c17258cb           vaddss xmm1,xmm1,xmm11
0xde6dc3ca2f8   e38  c4411259ed           vmulss xmm13,xmm13,xmm13
0xde6dc3ca2fd   e3d  c4411a59e4           vmulss xmm12,xmm12,xmm12
0xde6dc3ca302   e42  c4411a58e5           vaddss xmm12,xmm12,xmm13
0xde6dc3ca307   e47  c4c1782ec4           vucomiss xmm0,xmm12
0xde6dc3ca30c   e4c  0f870a000000         ja 0xde6dc3ca31c  <+0xe5c>
0xde6dc3ca312   e52  c4c17928cb           vmovapd xmm1,xmm11
0xde6dc3ca317   e57  e905000000           jmp 0xde6dc3ca321  <+0xe61>
0xde6dc3ca31c   e5c  c4410a58d2           vaddss xmm10,xmm14,xmm10
0xde6dc3ca321   e61  3bf1                 cmpl rsi,rcx
0xde6dc3ca323   e63  0f8597feffff         jnz 0xde6dc3ca1c0  <+0xd00>
0xde6dc3ca329   e69  448b9d48ffffff       movl r11,[rbp-0xb8]
0xde6dc3ca330   e70  c57928d9             vmovapd xmm11,xmm1
0xde6dc3ca334   e74  4183c001             addl r8,0x1
0xde6dc3ca338   e78  4183f809             cmpl r8,0x9
0xde6dc3ca33c   e7c  0f853efeffff         jnz 0xde6dc3ca180  <+0xcc0>
0xde6dc3ca342   e82  c4412259e3           vmulss xmm12,xmm11,xmm11
0xde6dc3ca347   e87  c4412a59ea           vmulss xmm13,xmm10,xmm10
0xde6dc3ca34c   e8c  c4411258e4           vaddss xmm12,xmm13,xmm12
0xde6dc3ca351   e91  c5782ee2             vucomiss xmm12,xmm2
0xde6dc3ca355   e95  0f8726000000         ja 0xde6dc3ca381  <+0xec1>
0xde6dc3ca35b   e9b  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xde6dc3ca35f   e9f  4e8b843fa0000000     REX.W movq r8,[rdi+r15*1+0xa0]
0xde6dc3ca367   ea7  4983c001             REX.W addq r8,0x1
0xde6dc3ca36b   eab  4e89843fa0000000     REX.W movq [rdi+r15*1+0xa0],r8
0xde6dc3ca373   eb3  c4417928d8           vmovapd xmm11,xmm8
0xde6dc3ca378   eb8  c57928d7             vmovapd xmm10,xmm7
0xde6dc3ca37c   ebc  e91d000000           jmp 0xde6dc3ca39e  <+0xede>
0xde6dc3ca381   ec1  f3450f51e4           sqrtss xmm12,xmm12
0xde6dc3ca386   ec6  c4412a5ed4           vdivss xmm10,xmm10,xmm12
0xde6dc3ca38b   ecb  c4417828d2           vmovaps xmm10,xmm10
0xde6dc3ca390   ed0  c441225edc           vdivss xmm11,xmm11,xmm12
0xde6dc3ca395   ed5  c4417828db           vmovaps xmm11,xmm11
0xde6dc3ca39a   eda  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xde6dc3ca39e   ede  4e8b843f90000000     REX.W movq r8,[rdi+r15*1+0x90]
0xde6dc3ca3a6   ee6  49b8157c4a7fb979379e REX.W movq r8,0x9e3779b97f4a7c15
0xde6dc3ca3b0   ef0  4e03843f90000000     REX.W addq r8,[rdi+r15*1+0x90]
0xde6dc3ca3b8   ef8  4e89843f90000000     REX.W movq [rdi+r15*1+0x90],r8
0xde6dc3ca3c0   f00  4d8bd8               REX.W movq r11,r8
0xde6dc3ca3c3   f03  49c1eb1e             REX.W shrq r11, 30
0xde6dc3ca3c7   f07  4d33c3               REX.W xorq r8,r11
0xde6dc3ca3ca   f0a  49bbb9e5e41c6d4758bf REX.W movq r11,0xbf58476d1ce4e5b9
0xde6dc3ca3d4   f14  4d0fafd8             REX.W imulq r11,r8
0xde6dc3ca3d8   f18  4d8bc3               REX.W movq r8,r11
0xde6dc3ca3db   f1b  49c1e81b             REX.W shrq r8, 27
0xde6dc3ca3df   f1f  4d33d8               REX.W xorq r11,r8
0xde6dc3ca3e2   f22  49b8eb113113bb49d094 REX.W movq r8,0x94d049bb133111eb
0xde6dc3ca3ec   f2c  4d0fafc3             REX.W imulq r8,r11
0xde6dc3ca3f0   f30  4d8bd8               REX.W movq r11,r8
0xde6dc3ca3f3   f33  49c1eb2b             REX.W shrq r11, 43
0xde6dc3ca3f7   f37  49c1e80c             REX.W shrq r8, 12
0xde6dc3ca3fb   f3b  4d33c3               REX.W xorq r8,r11
0xde6dc3ca3fe   f3e  49bb000000000000f03f REX.W movq r11,0x3ff0000000000000
0xde6dc3ca408   f48  4d0bd8               REX.W orq r11,r8
0xde6dc3ca40b   f4b  c441f96ee3           vmovq xmm12,r11
0xde6dc3ca410   f50  49ba000000000000f0bf REX.W movq r10,0xbff0000000000000
0xde6dc3ca41a   f5a  c441f96eea           vmovq xmm13,r10
0xde6dc3ca41f   f5f  c4411358e4           vaddsd xmm12,xmm13,xmm12
0xde6dc3ca424   f64  49ba000000000000e0bf REX.W movq r10,0xbfe0000000000000
0xde6dc3ca42e   f6e  c441f96eea           vmovq xmm13,r10
0xde6dc3ca433   f73  c4411358e4           vaddsd xmm12,xmm13,xmm12
0xde6dc3ca438   f78  c4217a10ac3fb4000000 vmovss xmm13,[rdi+r15*1+0xb4]
0xde6dc3ca442   f82  c441125aed           vcvtss2sd xmm13,xmm13,xmm13
0xde6dc3ca447   f87  c4411359e4           vmulsd xmm12,xmm13,xmm12
0xde6dc3ca44c   f8c  c4c11b5acc           vcvtsd2ss xmm1,xmm12,xmm12
0xde6dc3ca451   f91  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca456   f96  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca45b   f9b  c5fb118d60ffffff     vmovsd [rbp-0xa0],xmm1
0xde6dc3ca463   fa3  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3ca467   fa7  e88c59edff           call 0xde6dc29fdf8  (jump table)
0xde6dc3ca46c   fac  c5fb118d58ffffff     vmovsd [rbp-0xa8],xmm1
0xde6dc3ca474   fb4  c5fb108d60ffffff     vmovsd xmm1,[rbp-0xa0]
0xde6dc3ca47c   fbc  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3ca480   fc0  e87b59edff           call 0xde6dc29fe00  (jump table)
0xde6dc3ca485   fc5  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca489   fc9  4c8b45d0             REX.W movq r8,[rbp-0x30]
0xde6dc3ca48d   fcd  c4a17a108407b0000000 vmovss xmm0,[rdi+r8*1+0xb0]
0xde6dc3ca497   fd7  c5fb109568ffffff     vmovsd xmm2,[rbp-0x98]
0xde6dc3ca49f   fdf  c5ea59d0             vmulss xmm2,xmm2,xmm0
0xde6dc3ca4a3   fe3  c5ea589570ffffff     vaddss xmm2,xmm2,[rbp-0x90]
0xde6dc3ca4ab   feb  c4a17a109c07a8000000 vmovss xmm3,[rdi+r8*1+0xa8]
0xde6dc3ca4b5   ff5  c5f82ed3             vucomiss xmm2,xmm3
0xde6dc3ca4b9   ff9  0f8317000000         jnc 0xde6dc3ca4d6  <+0x1016>
0xde6dc3ca4bf   fff  c5d857e4             vxorps xmm4,xmm4,xmm4
0xde6dc3ca4c3  1003  c5f82ee2             vucomiss xmm4,xmm2
0xde6dc3ca4c7  1007  0f8611000000         jna 0xde6dc3ca4de  <+0x101e>
0xde6dc3ca4cd  100d  c5e258d2             vaddss xmm2,xmm3,xmm2
0xde6dc3ca4d1  1011  e908000000           jmp 0xde6dc3ca4de  <+0x101e>
0xde6dc3ca4d6  1016  c5ea5cd3             vsubss xmm2,xmm2,xmm3
0xde6dc3ca4da  101a  c5d857e4             vxorps xmm4,xmm4,xmm4
0xde6dc3ca4de  101e  c5fa598578ffffff     vmulss xmm0,xmm0,[rbp-0x88]
0xde6dc3ca4e6  1026  c5fa584580           vaddss xmm0,xmm0,[rbp-0x80]
0xde6dc3ca4eb  102b  c5f82ec3             vucomiss xmm0,xmm3
0xde6dc3ca4ef  102f  0f8313000000         jnc 0xde6dc3ca508  <+0x1048>
0xde6dc3ca4f5  1035  c5f82ee0             vucomiss xmm4,xmm0
0xde6dc3ca4f9  1039  0f860d000000         jna 0xde6dc3ca50c  <+0x104c>
0xde6dc3ca4ff  103f  c5e258c0             vaddss xmm0,xmm3,xmm0
0xde6dc3ca503  1043  e904000000           jmp 0xde6dc3ca50c  <+0x104c>
0xde6dc3ca508  1048  c5fa5cc3             vsubss xmm0,xmm0,xmm3
0xde6dc3ca50c  104c  448b5d88             movl r11,[rbp-0x78]
0xde6dc3ca510  1050  443b5dc0             cmpl r11,[rbp-0x40]
0xde6dc3ca514  1054  0f86aa000000         jna 0xde6dc3ca5c4  <+0x1104>
0xde6dc3ca51a  105a  448b65c0             movl r12,[rbp-0x40]
0xde6dc3ca51e  105e  448b7d90             movl r15,[rbp-0x70]
0xde6dc3ca522  1062  478d34a7             leal r14,[r15+r12*4]
0xde6dc3ca526  1066  c5f82ed3             vucomiss xmm2,xmm3
0xde6dc3ca52a  106a  0f8204000000         jc 0xde6dc3ca534  <+0x1074>
0xde6dc3ca530  1070  c5f928d4             vmovapd xmm2,xmm4
0xde6dc3ca534  1074  c4a17a111437         vmovss [rdi+r14*1],xmm2
0xde6dc3ca53a  107a  448b7598             movl r14,[rbp-0x68]
0xde6dc3ca53e  107e  438d04a6             leal rax,[r14+r12*4]
0xde6dc3ca542  1082  c5f82ec3             vucomiss xmm0,xmm3
0xde6dc3ca546  1086  0f8204000000         jc 0xde6dc3ca550  <+0x1090>
0xde6dc3ca54c  108c  c5f928c4             vmovapd xmm0,xmm4
0xde6dc3ca550  1090  c5fa110407           vmovss [rdi+rax*1],xmm0
0xde6dc3ca555  1095  8b45a0               movl rax,[rbp-0x60]
0xde6dc3ca558  1098  428d1ca0             leal rbx,[rax+r12*4]
0xde6dc3ca55c  109c  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3ca561  10a1  c5a259c1             vmulss xmm0,xmm11,xmm1
0xde6dc3ca565  10a5  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3ca56a  10aa  c5aa599558ffffff     vmulss xmm2,xmm10,[rbp-0xa8]
0xde6dc3ca572  10b2  c5fa5cc2             vsubss xmm0,xmm0,xmm2
0xde6dc3ca576  10b6  c5fa11041f           vmovss [rdi+rbx*1],xmm0
0xde6dc3ca57b  10bb  8b5da8               movl rbx,[rbp-0x58]
0xde6dc3ca57e  10be  428d14a3             leal rdx,[rbx+r12*4]
0xde6dc3ca582  10c2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0xde6dc3ca58a  10ca  c4c17a59c3           vmulss xmm0,xmm0,xmm11
0xde6dc3ca58f  10cf  c4c17259d2           vmulss xmm2,xmm1,xmm10
0xde6dc3ca594  10d4  c5ea58c0             vaddss xmm0,xmm2,xmm0
0xde6dc3ca598  10d8  c5fa110417           vmovss [rdi+rdx*1],xmm0
0xde6dc3ca59d  10dd  4589e3               movl r11,r12
0xde6dc3ca5a0  10e0  4d8be0               REX.W movq r12,r8
0xde6dc3ca5a3  10e3  c5f928d4             vmovapd xmm2,xmm4
0xde6dc3ca5a7  10e7  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca5af  10ef  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca5b7  10f7  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca5bf  10ff  e923000000           jmp 0xde6dc3ca5e7  <+0x1127>
0xde6dc3ca5c4  1104  4d8be0               REX.W movq r12,r8
0xde6dc3ca5c7  1107  448b5dc0             movl r11,[rbp-0x40]
0xde6dc3ca5cb  110b  c5f928d4             vmovapd xmm2,xmm4
0xde6dc3ca5cf  110f  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca5d7  1117  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca5df  111f  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca5e7  1127  4183c301             addl r11,0x1
0xde6dc3ca5eb  112b  448b45c8             movl r8,[rbp-0x38]
0xde6dc3ca5ef  112f  453bc3               cmpl r8,r11
0xde6dc3ca5f2  1132  0f8437000000         jz 0xde6dc3ca62f  <+0x116f>
0xde6dc3ca5f8  1138  e943f1ffff           jmp 0xde6dc3c9740  <+0x280>
0xde6dc3ca5fd  113d  b8c8301600           movl rax,0x1630c8
0xde6dc3ca602  1142  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3ca606  1146  e86d40edff           call 0xde6dc29e678  (jump table)
0xde6dc3ca60b  114b  33ff                 xorl rdi,rdi
0xde6dc3ca60d  114d  85ff                 testl rdi,rdi
0xde6dc3ca60f  114f  0f8467040000         jz 0xde6dc3caa7c  <+0x15bc>
0xde6dc3ca615  1155  cc                   int3l
0xde6dc3ca616  1156  b8c8301600           movl rax,0x1630c8
0xde6dc3ca61b  115b  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3ca61f  115f  e85440edff           call 0xde6dc29e678  (jump table)
0xde6dc3ca624  1164  33ff                 xorl rdi,rdi
0xde6dc3ca626  1166  85ff                 testl rdi,rdi
0xde6dc3ca628  1168  0f8449040000         jz 0xde6dc3caa77  <+0x15b7>
0xde6dc3ca62e  116e  cc                   int3l
0xde6dc3ca62f  116f  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xde6dc3ca633  1173  448b5de0             movl r11,[rbp-0x20]
0xde6dc3ca637  1177  c4a17a6f442730       vmovdqu xmm0,[rdi+r12*1+0x30]
0xde6dc3ca63e  117e  c4a17a6f1427         vmovdqu xmm2,[rdi+r12*1]
0xde6dc3ca644  1184  c4a17a7f542730       vmovdqu [rdi+r12*1+0x30],xmm2
0xde6dc3ca64b  118b  c4a17a7f0427         vmovdqu [rdi+r12*1],xmm0
0xde6dc3ca651  1191  c4a17a6f442740       vmovdqu xmm0,[rdi+r12*1+0x40]
0xde6dc3ca658  1198  c4a17a6f542710       vmovdqu xmm2,[rdi+r12*1+0x10]
0xde6dc3ca65f  119f  c4a17a7f542740       vmovdqu [rdi+r12*1+0x40],xmm2
0xde6dc3ca666  11a6  c4a17a7f442710       vmovdqu [rdi+r12*1+0x10],xmm0
0xde6dc3ca66d  11ad  c4a17a6f442750       vmovdqu xmm0,[rdi+r12*1+0x50]
0xde6dc3ca674  11b4  c4a17a6f542720       vmovdqu xmm2,[rdi+r12*1+0x20]
0xde6dc3ca67b  11bb  c4a17a7f542750       vmovdqu [rdi+r12*1+0x50],xmm2
0xde6dc3ca682  11c2  c4a17a7f442720       vmovdqu [rdi+r12*1+0x20],xmm0
0xde6dc3ca689  11c9  4e8bbc2798000000     REX.W movq r15,[rdi+r12*1+0x98]
0xde6dc3ca691  11d1  4983c701             REX.W addq r15,0x1
0xde6dc3ca695  11d5  4e89bc2798000000     REX.W movq [rdi+r12*1+0x98],r15
0xde6dc3ca69d  11dd  418bfb               movl rdi,r11
0xde6dc3ca6a0  11e0  83c750               addl rdi,0x50
0xde6dc3ca6a3  11e3  418938               movl [r8],rdi
0xde6dc3ca6a6  11e6  488be5               REX.W movq rsp,rbp
0xde6dc3ca6a9  11e9  5d                   pop rbp
0xde6dc3ca6aa  11ea  c3                   retl
0xde6dc3ca6ab  11eb  488945b0             REX.W movq [rbp-0x50],rax
0xde6dc3ca6af  11ef  e81c6eedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca6b4  11f4  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca6b8  11f8  488b75f0             REX.W movq rsi,[rbp-0x10]
0xde6dc3ca6bc  11fc  8b45b0               movl rax,[rbp-0x50]
0xde6dc3ca6bf  11ff  e91ceeffff           jmp 0xde6dc3c94e0  <+0x20>
0xde6dc3ca6c4  1204  c5f92eed             vucomisd xmm5,xmm5
0xde6dc3ca6c8  1208  0f8b08000000         jpo 0xde6dc3ca6d6  <+0x1216>
0xde6dc3ca6ce  120e  4533ff               xorl r15,r15
0xde6dc3ca6d1  1211  e912efffff           jmp 0xde6dc3c95e8  <+0x128>
0xde6dc3ca6d6  1216  c5f82ee3             vucomiss xmm4,xmm3
0xde6dc3ca6da  121a  77f2                 ja 0xde6dc3ca6ce  <+0x120e>
0xde6dc3ca6dc  121c  41bfffffffff         movl r15,0xffffffff
0xde6dc3ca6e2  1222  e901efffff           jmp 0xde6dc3c95e8  <+0x128>
0xde6dc3ca6e7  1227  4c895dc0             REX.W movq [rbp-0x40],r11
0xde6dc3ca6eb  122b  e8e06dedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca6f0  1230  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca6f4  1234  4c8b65d0             REX.W movq r12,[rbp-0x30]
0xde6dc3ca6f8  1238  448b5dc0             movl r11,[rbp-0x40]
0xde6dc3ca6fc  123c  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca700  1240  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca708  1248  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca710  1250  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca718  1258  e92df0ffff           jmp 0xde6dc3c974a  <+0x28a>
0xde6dc3ca71d  125d  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca722  1262  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca727  1267  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0xde6dc3ca72e  126e  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xde6dc3ca735  1275  e8966dedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca73a  127a  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca73e  127e  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca742  1282  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xde6dc3ca747  1287  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xde6dc3ca74f  128f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3ca757  1297  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xde6dc3ca75f  129f  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3ca764  12a4  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3ca769  12a9  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca771  12b1  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca779  12b9  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca781  12c1  448bb510ffffff       movl r14,[rbp-0xf0]
0xde6dc3ca788  12c8  448b8508ffffff       movl r8,[rbp-0xf8]
0xde6dc3ca78f  12cf  8b9500ffffff         movl rdx,[rbp-0x100]
0xde6dc3ca795  12d5  8b85f8feffff         movl rax,[rbp-0x108]
0xde6dc3ca79b  12db  448ba558ffffff       movl r12,[rbp-0xa8]
0xde6dc3ca7a2  12e2  8b9d60ffffff         movl rbx,[rbp-0xa0]
0xde6dc3ca7a8  12e8  e9e4f0ffff           jmp 0xde6dc3c9891  <+0x3d1>
0xde6dc3ca7ad  12ed  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca7b2  12f2  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca7b7  12f7  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0xde6dc3ca7be  12fe  4c898d48ffffff       REX.W movq [rbp-0xb8],r9
0xde6dc3ca7c5  1305  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0xde6dc3ca7cc  130c  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xde6dc3ca7d3  1313  e8f86cedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca7d8  1318  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca7dc  131c  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca7e0  1320  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xde6dc3ca7e5  1325  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xde6dc3ca7ed  132d  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3ca7f5  1335  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xde6dc3ca7fd  133d  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3ca802  1342  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3ca807  1347  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca80f  134f  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca817  1357  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca81f  135f  448bb510ffffff       movl r14,[rbp-0xf0]
0xde6dc3ca826  1366  448b8508ffffff       movl r8,[rbp-0xf8]
0xde6dc3ca82d  136d  8b9500ffffff         movl rdx,[rbp-0x100]
0xde6dc3ca833  1373  8b85f8feffff         movl rax,[rbp-0x108]
0xde6dc3ca839  1379  448ba558ffffff       movl r12,[rbp-0xa8]
0xde6dc3ca840  1380  448b8d48ffffff       movl r9,[rbp-0xb8]
0xde6dc3ca847  1387  488bb550ffffff       REX.W movq rsi,[rbp-0xb0]
0xde6dc3ca84e  138e  8b9d60ffffff         movl rbx,[rbp-0xa0]
0xde6dc3ca854  1394  e9a3f0ffff           jmp 0xde6dc3c98fc  <+0x43c>
0xde6dc3ca859  1399  c441792ee4           vucomisd xmm12,xmm12
0xde6dc3ca85e  139e  0f8b07000000         jpo 0xde6dc3ca86b  <+0x13ab>
0xde6dc3ca864  13a4  33c9                 xorl rcx,rcx
0xde6dc3ca866  13a6  e940f2ffff           jmp 0xde6dc3c9aab  <+0x5eb>
0xde6dc3ca86b  13ab  c4c1782ed3           vucomiss xmm2,xmm11
0xde6dc3ca870  13b0  77f2                 ja 0xde6dc3ca864  <+0x13a4>
0xde6dc3ca872  13b2  b9ffffffff           movl rcx,0xffffffff
0xde6dc3ca877  13b7  e92ff2ffff           jmp 0xde6dc3c9aab  <+0x5eb>
0xde6dc3ca87c  13bc  c441792edb           vucomisd xmm11,xmm11
0xde6dc3ca881  13c1  0f8b08000000         jpo 0xde6dc3ca88f  <+0x13cf>
0xde6dc3ca887  13c7  4533c0               xorl r8,r8
0xde6dc3ca88a  13ca  e9f3f2ffff           jmp 0xde6dc3c9b82  <+0x6c2>
0xde6dc3ca88f  13cf  c4c1782ed2           vucomiss xmm2,xmm10
0xde6dc3ca894  13d4  77f1                 ja 0xde6dc3ca887  <+0x13c7>
0xde6dc3ca896  13d6  41b8ffffffff         movl r8,0xffffffff
0xde6dc3ca89c  13dc  e9e1f2ffff           jmp 0xde6dc3c9b82  <+0x6c2>
0xde6dc3ca8a1  13e1  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xde6dc3ca8a8  13e8  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca8ad  13ed  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca8b2  13f2  e8196cedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca8b7  13f7  8b5de0               movl rbx,[rbp-0x20]
0xde6dc3ca8ba  13fa  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca8be  13fe  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca8c2  1402  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xde6dc3ca8c7  1407  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xde6dc3ca8cf  140f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3ca8d7  1417  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xde6dc3ca8df  141f  448b8560ffffff       movl r8,[rbp-0xa0]
0xde6dc3ca8e6  1426  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3ca8eb  142b  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3ca8f0  1430  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca8f8  1438  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca900  1440  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca908  1448  8b9510ffffff         movl rdx,[rbp-0xf0]
0xde6dc3ca90e  144e  8b8508ffffff         movl rax,[rbp-0xf8]
0xde6dc3ca914  1454  448bb500ffffff       movl r14,[rbp-0x100]
0xde6dc3ca91b  145b  448ba5f8feffff       movl r12,[rbp-0x108]
0xde6dc3ca922  1462  448b9d48ffffff       movl r11,[rbp-0xb8]
0xde6dc3ca929  1469  e95ff8ffff           jmp 0xde6dc3ca18d  <+0xccd>
0xde6dc3ca92e  146e  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xde6dc3ca935  1475  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca93a  147a  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca93f  147f  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0xde6dc3ca946  1486  48898d50ffffff       REX.W movq [rbp-0xb0],rcx
0xde6dc3ca94d  148d  e87e6bedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca952  1492  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca956  1496  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca95a  149a  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xde6dc3ca95f  149f  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xde6dc3ca967  14a7  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3ca96f  14af  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xde6dc3ca977  14b7  448b8560ffffff       movl r8,[rbp-0xa0]
0xde6dc3ca97e  14be  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3ca983  14c3  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3ca988  14c8  8bb558ffffff         movl rsi,[rbp-0xa8]
0xde6dc3ca98e  14ce  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3ca996  14d6  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3ca99e  14de  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3ca9a6  14e6  8b9510ffffff         movl rdx,[rbp-0xf0]
0xde6dc3ca9ac  14ec  8b8508ffffff         movl rax,[rbp-0xf8]
0xde6dc3ca9b2  14f2  448bb500ffffff       movl r14,[rbp-0x100]
0xde6dc3ca9b9  14f9  448ba5f8feffff       movl r12,[rbp-0x108]
0xde6dc3ca9c0  1500  448b9d48ffffff       movl r11,[rbp-0xb8]
0xde6dc3ca9c7  1507  8b8d50ffffff         movl rcx,[rbp-0xb0]
0xde6dc3ca9cd  150d  e92ef8ffff           jmp 0xde6dc3ca200  <+0xd40>
0xde6dc3ca9d2  1512  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xde6dc3ca9d9  1519  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xde6dc3ca9de  151e  c57b115db0           vmovsd [rbp-0x50],xmm11
0xde6dc3ca9e3  1523  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0xde6dc3ca9ea  152a  4c898d50ffffff       REX.W movq [rbp-0xb0],r9
0xde6dc3ca9f1  1531  e8da6aedff           call 0xde6dc2a14d0  (jump table)
0xde6dc3ca9f6  1536  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xde6dc3ca9fa  153a  c5e857d2             vxorps xmm2,xmm2,xmm2
0xde6dc3ca9fe  153e  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xde6dc3caa03  1543  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xde6dc3caa0b  154b  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xde6dc3caa13  1553  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xde6dc3caa1b  155b  448b8560ffffff       movl r8,[rbp-0xa0]
0xde6dc3caa22  1562  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xde6dc3caa27  1567  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xde6dc3caa2c  156c  8bb558ffffff         movl rsi,[rbp-0xa8]
0xde6dc3caa32  1572  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xde6dc3caa3a  157a  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xde6dc3caa42  1582  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xde6dc3caa4a  158a  8b9510ffffff         movl rdx,[rbp-0xf0]
0xde6dc3caa50  1590  8b8508ffffff         movl rax,[rbp-0xf8]
0xde6dc3caa56  1596  448bb500ffffff       movl r14,[rbp-0x100]
0xde6dc3caa5d  159d  448ba5f8feffff       movl r12,[rbp-0x108]
0xde6dc3caa64  15a4  448b8d50ffffff       movl r9,[rbp-0xb0]
0xde6dc3caa6b  15ab  448b9d48ffffff       movl r11,[rbp-0xb8]
0xde6dc3caa72  15b2  e9def7ffff           jmp 0xde6dc3ca255  <+0xd95>
0xde6dc3caa77  15b7  e88467edff           call 0xde6dc2a1200  (jump table)
0xde6dc3caa7c  15bc  e87f67edff           call 0xde6dc2a1200  (jump table)
0xde6dc3caa81  15c1  90                   nop
0xde6dc3caa82  15c2  6690                 nop

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
0xde6dc3c9640    180  slots (sp->fp): 0000000000000000000000000000000000000000000000

RelocInfo (size = 39)
0xde6dc3c963c  internal wasm call
0xde6dc3ca468  internal wasm call
0xde6dc3ca481  internal wasm call
0xde6dc3ca607  internal wasm call
0xde6dc3ca620  internal wasm call
0xde6dc3ca6b0  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca6ec  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca736  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca7d4  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca8b3  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca94e  wasm stub call  (0xde6dc2a14d0)
0xde6dc3ca9f2  wasm stub call  (0xde6dc2a14d0)
0xde6dc3caa78  wasm stub call  (0xde6dc2a1200)
0xde6dc3caa7d  wasm stub call  (0xde6dc2a1200)
