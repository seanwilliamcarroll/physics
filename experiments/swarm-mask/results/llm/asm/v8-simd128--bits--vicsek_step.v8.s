name: _RNvMs0_NtCskbGeSEnUfEA_5swarm6vicsekNtB5_6Vicsek4step
index: 38
kind: wasm function
compiler: TurboFan
Body (size = 5632 = 5592 + 40 padding)
Instructions (size = 5572)
0xc7090385c0     0  55                   push rbp
0xc7090385c1     1  4889e5               REX.W movq rbp,rsp
0xc7090385c4     4  6a08                 push 0x8
0xc7090385c6     6  56                   push rsi
0xc7090385c7     7  4881ec50010000       REX.W subq rsp,0x150
0xc7090385ce     e  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0xc7090385d2    12  48897dd8             REX.W movq [rbp-0x28],rdi
0xc7090385d6    16  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc7090385da    1a  0f86cb110000         jna 0xc7090397ab  <+0x11eb>
0xc7090385e0    20  4c8b462f             REX.W movq r8,[rsi+0x2f]
0xc7090385e4    24  458b18               movl r11,[r8]
0xc7090385e7    27  4183eb50             subl r11,0x50
0xc7090385eb    2b  458918               movl [r8],r11
0xc7090385ee    2e  448be0               movl r12,rax
0xc7090385f1    31  c4a17a108427ac000000 vmovss xmm0,[rdi+r12*1+0xac]
0xc7090385fb    3b  c4a17a109427a8000000 vmovss xmm2,[rdi+r12*1+0xa8]
0xc709038605    45  428b4c2708           movl rcx,[rdi+r12*1+0x8]
0xc70903860a    4a  460fb6bc27b8000000   movzxbl r15,[rdi+r12*1+0xb8]
0xc709038613    53  4c8945e8             REX.W movq [rbp-0x18],r8
0xc709038617    57  4c895de0             REX.W movq [rbp-0x20],r11
0xc70903861b    5b  4c8965d0             REX.W movq [rbp-0x30],r12
0xc70903861f    5f  c5fb1145c0           vmovsd [rbp-0x40],xmm0
0xc709038624    64  c5fb119528ffffff     vmovsd [rbp-0xd8],xmm2
0xc70903862c    6c  48894dc8             REX.W movq [rbp-0x38],rcx
0xc709038630    70  4280bc27b800000000   cmpb [rdi+r12*1+0xb8],0x0
0xc709038639    79  0f8534010000         jnz 0xc709038773  <+0x1b3>
0xc70903863f    7f  41ba0020803f         movl r10,0x3f802000
0xc709038645    85  c4c1796eda           vmovd xmm3,r10
0xc70903864a    8a  c5e259d8             vmulss xmm3,xmm3,xmm0
0xc70903864e    8e  c5ea5edb             vdivss xmm3,xmm2,xmm3
0xc709038652    92  c5f828db             vmovaps xmm3,xmm3
0xc709038656    96  c4e3610adb09         vroundss xmm3,xmm3,xmm3,0x9
0xc70903865c    9c  c5d857e4             vxorps xmm4,xmm4,xmm4
0xc709038660    a0  c5f82edc             vucomiss xmm3,xmm4
0xc709038664    a4  0f8308000000         jnc 0xc709038672  <+0xb2>
0xc70903866a    aa  4533ff               xorl r15,r15
0xc70903866d    ad  e908010000           jmp 0xc70903877a  <+0x1ba>
0xc709038672    b2  41ba0000804f         movl r10,0x4f800000
0xc709038678    b8  c4c1796eea           vmovd xmm5,r10
0xc70903867d    bd  c5f82eeb             vucomiss xmm5,xmm3
0xc709038681    c1  0f8708000000         ja 0xc70903868f  <+0xcf>
0xc709038687    c7  4533ff               xorl r15,r15
0xc70903868a    ca  e9eb000000           jmp 0xc70903877a  <+0x1ba>
0xc70903868f    cf  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0xc709038693    d3  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0xc709038699    d9  c57b2cfe             vcvttsd2si r15,xmm6
0xc70903869d    dd  4585ff               testl r15,r15
0xc7090386a0    e0  0f892a000000         jns 0xc7090386d0  <+0x110>
0xc7090386a6    e6  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0xc7090386b0    f0  c441f96efa           vmovq xmm15,r10
0xc7090386b5    f5  c50358fe             vaddsd xmm15,xmm15,xmm6
0xc7090386b9    f9  c4417b2cff           vcvttsd2si r15,xmm15
0xc7090386be    fe  4585ff               testl r15,r15
0xc7090386c1   101  0f8809000000         js 0xc7090386d0  <+0x110>
0xc7090386c7   107  41ba00000080         movl r10,0x80000000
0xc7090386cd   10d  450bfa               orl r15,r10
0xc7090386d0   110  458bd7               movl r10,r15
0xc7090386d3   113  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0xc7090386d8   118  c5f92efe             vucomisd xmm7,xmm6
0xc7090386dc   11c  0f8ae2100000         jpe 0xc7090397c4  <+0x1204>
0xc7090386e2   122  0f85dc100000         jnz 0xc7090397c4  <+0x1204>
0xc7090386e8   128  4183ff03             cmpl r15,0x3
0xc7090386ec   12c  7299                 jc 0xc709038687  <+0xc7>
0xc7090386ee   12e  468b4c2714           movl r9,[rdi+r12*1+0x14]
0xc7090386f3   133  428b5c2710           movl rbx,[rdi+r12*1+0x10]
0xc7090386f8   138  428b542704           movl rdx,[rdi+r12*1+0x4]
0xc7090386fd   13d  41be00040000         movl r14,0x400
0xc709038703   143  4181ff00040000       cmpl r15,0x400
0xc70903870a   14a  450f42f7             cmovcl r14,r15
0xc70903870e   14e  4689b4278c000000     movl [rdi+r12*1+0x8c],r14
0xc709038716   156  4689b42788000000     movl [rdi+r12*1+0x88],r14
0xc70903871e   15e  458bd6               movl r10,r14
0xc709038721   161  c4c1822ada           vcvtqsi2ss xmm3,xmm15,r10
0xc709038726   166  c5e25eda             vdivss xmm3,xmm3,xmm2
0xc70903872a   16a  c5f828db             vmovaps xmm3,xmm3
0xc70903872e   16e  c4a17a119c2784000000 vmovss [rdi+r12*1+0x84],xmm3
0xc709038738   178  83c060               addl rax,0x60
0xc70903873b   17b  e8b875edff           call 0xc708f0fcf8  (jump table)
0xc709038740   180  c5fb1045c0           vmovsd xmm0,[rbp-0x40]
0xc709038745   185  41bf01000000         movl r15,0x1
0xc70903874b   18b  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xc70903874f   18f  448b5de0             movl r11,[rbp-0x20]
0xc709038753   193  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc709038757   197  4c8b65d0             REX.W movq r12,[rbp-0x30]
0xc70903875b   19b  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc70903875f   19f  8b4dc8               movl rcx,[rbp-0x38]
0xc709038762   1a2  c5d857e4             vxorps xmm4,xmm4,xmm4
0xc709038766   1a6  c5fb109528ffffff     vmovsd xmm2,[rbp-0xd8]
0xc70903876e   1ae  e907000000           jmp 0xc70903877a  <+0x1ba>
0xc709038773   1b3  4533ff               xorl r15,r15
0xc709038776   1b6  c5d857e4             vxorps xmm4,xmm4,xmm4
0xc70903877a   1ba  4c89bdd8feffff       REX.W movq [rbp-0x128],r15
0xc709038781   1c1  85c9                 testl rcx,rcx
0xc709038783   1c3  0f84ae0f0000         jz 0xc709039737  <+0x1177>
0xc709038789   1c9  468b74275c           movl r14,[rdi+r12*1+0x5c]
0xc70903878e   1ce  428b442750           movl rax,[rdi+r12*1+0x50]
0xc709038793   1d3  428b5c2744           movl rbx,[rdi+r12*1+0x44]
0xc709038798   1d8  428b542738           movl rdx,[rdi+r12*1+0x38]
0xc70903879d   1dd  448bca               movl r9,rdx
0xc7090387a0   1e0  3bda                 cmpl rbx,rdx
0xc7090387a2   1e2  440f42cb             cmovcl r9,rbx
0xc7090387a6   1e6  418bd9               movl rbx,r9
0xc7090387a9   1e9  413bc1               cmpl rax,r9
0xc7090387ac   1ec  0f42d8               cmovcl rbx,rax
0xc7090387af   1ef  448bcb               movl r9,rbx
0xc7090387b2   1f2  443bf3               cmpl r14,rbx
0xc7090387b5   1f5  450f42ce             cmovcl r9,r14
0xc7090387b9   1f9  41ba000000bf         movl r10,0xbf000000
0xc7090387bf   1ff  c4c1796eda           vmovd xmm3,r10
0xc7090387c4   204  c5e259da             vmulss xmm3,xmm3,xmm2
0xc7090387c8   208  c5d176ed             vpcmpeqd xmm5,xmm5,xmm5
0xc7090387cc   20c  c5d172f51a           vpslld xmm5,xmm5,26
0xc7090387d1   211  c5d172d502           vpsrld xmm5,xmm5,2
0xc7090387d6   216  c5d259ea             vmulss xmm5,xmm5,xmm2
0xc7090387da   21a  468b742758           movl r14,[rdi+r12*1+0x58]
0xc7090387df   21f  428b5c274c           movl rbx,[rdi+r12*1+0x4c]
0xc7090387e4   224  428b442740           movl rax,[rdi+r12*1+0x40]
0xc7090387e9   229  428b542734           movl rdx,[rdi+r12*1+0x34]
0xc7090387ee   22e  c5fa59c0             vmulss xmm0,xmm0,xmm0
0xc7090387f2   232  4c894d88             REX.W movq [rbp-0x78],r9
0xc7090387f6   236  c5fb119d20ffffff     vmovsd [rbp-0xe0],xmm3
0xc7090387fe   23e  c5fb11ad18ffffff     vmovsd [rbp-0xe8],xmm5
0xc709038806   246  4c8975a8             REX.W movq [rbp-0x58],r14
0xc70903880a   24a  48895da0             REX.W movq [rbp-0x60],rbx
0xc70903880e   24e  48894598             REX.W movq [rbp-0x68],rax
0xc709038812   252  48895590             REX.W movq [rbp-0x70],rdx
0xc709038816   256  c5fb118530ffffff     vmovsd [rbp-0xd0],xmm0
0xc70903881e   25e  4533db               xorl r11,r11
0xc709038821   261  c57928fa             vmovapd xmm15,xmm2
0xc709038825   265  c5f928d4             vmovapd xmm2,xmm4
0xc709038829   269  c4c17928e7           vmovapd xmm4,xmm15
0xc70903882e   26e  660f1f840000000000   nop
0xc709038837   277  660f1f840000000000   nop
0xc709038840   280  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc709038844   284  0f869d0f0000         jna 0xc7090397e7  <+0x1227>
0xc70903884a   28a  468b742708           movl r14,[rdi+r12*1+0x8]
0xc70903884f   28f  4c89b5c0feffff       REX.W movq [rbp-0x140],r14
0xc709038856   296  453bf3               cmpl r14,r11
0xc709038859   299  0f86880e0000         jna 0xc7090396e7  <+0x1127>
0xc70903885f   29f  428b5c2714           movl rbx,[rdi+r12*1+0x14]
0xc709038864   2a4  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xc70903886b   2ab  413bdb               cmpl rbx,r11
0xc70903886e   2ae  0f86730e0000         jna 0xc7090396e7  <+0x1127>
0xc709038874   2b4  428b742720           movl rsi,[rdi+r12*1+0x20]
0xc709038879   2b9  488975b0             REX.W movq [rbp-0x50],rsi
0xc70903887d   2bd  413bf3               cmpl rsi,r11
0xc709038880   2c0  0f86610e0000         jna 0xc7090396e7  <+0x1127>
0xc709038886   2c6  468b4c272c           movl r9,[rdi+r12*1+0x2c]
0xc70903888b   2cb  4c894db8             REX.W movq [rbp-0x48],r9
0xc70903888f   2cf  453bcb               cmpl r9,r11
0xc709038892   2d2  0f864f0e0000         jna 0xc7090396e7  <+0x1127>
0xc709038898   2d8  468b442704           movl r8,[rdi+r12*1+0x4]
0xc70903889d   2dd  438d0498             leal rax,[r8+r11*4]
0xc7090388a1   2e1  c5fa103407           vmovss xmm6,[rdi+rax*1]
0xc7090388a6   2e6  428b442728           movl rax,[rdi+r12*1+0x28]
0xc7090388ab   2eb  428d1498             leal rdx,[rax+r11*4]
0xc7090388af   2ef  c5fa103c17           vmovss xmm7,[rdi+rdx*1]
0xc7090388b4   2f4  428b54271c           movl rdx,[rdi+r12*1+0x1c]
0xc7090388b9   2f9  4c898510ffffff       REX.W movq [rbp-0xf0],r8
0xc7090388c0   300  468d049a             leal r8,[rdx+r11*4]
0xc7090388c4   304  c4217a100407         vmovss xmm8,[rdi+r8*1]
0xc7090388ca   30a  468b442710           movl r8,[rdi+r12*1+0x10]
0xc7090388cf   30f  478d2498             leal r12,[r8+r11*4]
0xc7090388d3   313  c4217a100c27         vmovss xmm9,[rdi+r12*1]
0xc7090388d9   319  4c895dc0             REX.W movq [rbp-0x40],r11
0xc7090388dd   31d  c5fb11b570ffffff     vmovsd [rbp-0x90],xmm6
0xc7090388e5   325  488985f8feffff       REX.W movq [rbp-0x108],rax
0xc7090388ec   32c  c5fb11bd78ffffff     vmovsd [rbp-0x88],xmm7
0xc7090388f4   334  48899500ffffff       REX.W movq [rbp-0x100],rdx
0xc7090388fb   33b  c57b118568ffffff     vmovsd [rbp-0x98],xmm8
0xc709038903   343  4c898508ffffff       REX.W movq [rbp-0xf8],r8
0xc70903890a   34a  c57b114d80           vmovsd [rbp-0x80],xmm9
0xc70903890f   34f  83bdd8feffff00       cmpl [rbp-0x128],0x0
0xc709038916   356  0f85aa010000         jnz 0xc709038ac6  <+0x506>
0xc70903891c   35c  448be3               movl r12,rbx
0xc70903891f   35f  443bf3               cmpl r14,rbx
0xc709038922   362  450f42e6             cmovcl r12,r14
0xc709038926   366  458bf1               movl r14,r9
0xc709038929   369  413bf1               cmpl rsi,r9
0xc70903892c   36c  440f42f6             cmovcl r14,rsi
0xc709038930   370  418bde               movl rbx,r14
0xc709038933   373  453be6               cmpl r12,r14
0xc709038936   376  410f42dc             cmovcl rbx,r12
0xc70903893a   37a  c57928d2             vmovapd xmm10,xmm2
0xc70903893e   37e  c57928da             vmovapd xmm11,xmm2
0xc709038942   382  4531e4               xorl r12,r12
0xc709038945   385  448bb510ffffff       movl r14,[rbp-0xf0]
0xc70903894c   38c  e936000000           jmp 0xc709038987  <+0x3c7>
0xc709038951   391  660f1f840000000000   nop
0xc70903895a   39a  660f1f840000000000   nop
0xc709038963   3a3  660f1f840000000000   nop
0xc70903896c   3ac  660f1f840000000000   nop
0xc709038975   3b5  660f1f840000000000   nop
0xc70903897e   3be  6690                 nop
0xc709038980   3c0  458be1               movl r12,r9
0xc709038983   3c3  c57928d9             vmovapd xmm11,xmm1
0xc709038987   3c7  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc70903898b   3cb  0f868c0e0000         jna 0xc70903981d  <+0x125d>
0xc709038991   3d1  33f6                 xorl rsi,rsi
0xc709038993   3d3  4439e3               cmpl rbx,r12
0xc709038996   3d6  400f96c6             setnal sil
0xc70903899a   3da  4589e1               movl r9,r12
0xc70903899d   3dd  660f1f840000000000   nop
0xc7090389a6   3e6  660f1f840000000000   nop
0xc7090389af   3ef  660f1f840000000000   nop
0xc7090389b8   3f8  0f1f840000000000     nop
0xc7090389c0   400  4183c101             addl r9,0x1
0xc7090389c4   404  85f6                 testl rsi,rsi
0xc7090389c6   406  0f843f000000         jz 0xc709038a0b  <+0x44b>
0xc7090389cc   40c  443b4dc8             cmpl r9,[rbp-0x38]
0xc7090389d0   410  0f836c0a0000         jnc 0xc709039442  <+0xe82>
0xc7090389d6   416  4183c101             addl r9,0x1
0xc7090389da   41a  443b4dc8             cmpl r9,[rbp-0x38]
0xc7090389de   41e  0f835e0a0000         jnc 0xc709039442  <+0xe82>
0xc7090389e4   424  4183c101             addl r9,0x1
0xc7090389e8   428  443b4dc8             cmpl r9,[rbp-0x38]
0xc7090389ec   42c  0f83500a0000         jnc 0xc709039442  <+0xe82>
0xc7090389f2   432  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc7090389f6   436  0f86b10e0000         jna 0xc7090398ad  <+0x12ed>
0xc7090389fc   43c  4183c101             addl r9,0x1
0xc709038a00   440  443b4dc8             cmpl r9,[rbp-0x38]
0xc709038a04   444  72ba                 jc 0xc7090389c0  <+0x400>
0xc709038a06   446  e9370a0000           jmp 0xc709039442  <+0xe82>
0xc709038a0b   44b  428d34a0             leal rsi,[rax+r12*4]
0xc709038a0f   44f  468d1ca2             leal r11,[rdx+r12*4]
0xc709038a13   453  478d3ca0             leal r15,[r8+r12*4]
0xc709038a17   457  c4217a10243f         vmovss xmm12,[rdi+r15*1]
0xc709038a1d   45d  478d24a6             leal r12,[r14+r12*4]
0xc709038a21   461  c4214a5c2c27         vsubss xmm13,xmm6,[rdi+r12*1]
0xc709038a27   467  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0xc709038a2f   46f  0f8715000000         ja 0xc709038a4a  <+0x48a>
0xc709038a35   475  c4c1782edd           vucomiss xmm3,xmm13
0xc709038a3a   47a  0f860e000000         jna 0xc709038a4e  <+0x48e>
0xc709038a40   480  c4415a58ed           vaddss xmm13,xmm4,xmm13
0xc709038a45   485  e904000000           jmp 0xc709038a4e  <+0x48e>
0xc709038a4a   48a  c5125cec             vsubss xmm13,xmm13,xmm4
0xc709038a4e   48e  c57a103437           vmovss xmm14,[rdi+rsi*1]
0xc709038a53   493  c4a17a100c1f         vmovss xmm1,[rdi+r11*1]
0xc709038a59   499  c441325ce4           vsubss xmm12,xmm9,xmm12
0xc709038a5e   49e  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0xc709038a66   4a6  0f8715000000         ja 0xc709038a81  <+0x4c1>
0xc709038a6c   4ac  c4c1782edc           vucomiss xmm3,xmm12
0xc709038a71   4b1  0f860e000000         jna 0xc709038a85  <+0x4c5>
0xc709038a77   4b7  c4415a58e4           vaddss xmm12,xmm4,xmm12
0xc709038a7c   4bc  e904000000           jmp 0xc709038a85  <+0x4c5>
0xc709038a81   4c1  c51a5ce4             vsubss xmm12,xmm12,xmm4
0xc709038a85   4c5  c4c17258cb           vaddss xmm1,xmm1,xmm11
0xc709038a8a   4ca  c4411259ed           vmulss xmm13,xmm13,xmm13
0xc709038a8f   4cf  c4411a59e4           vmulss xmm12,xmm12,xmm12
0xc709038a94   4d4  c4411a58e5           vaddss xmm12,xmm12,xmm13
0xc709038a99   4d9  c4c1782ec4           vucomiss xmm0,xmm12
0xc709038a9e   4de  0f870a000000         ja 0xc709038aae  <+0x4ee>
0xc709038aa4   4e4  c4c17928cb           vmovapd xmm1,xmm11
0xc709038aa9   4e9  e905000000           jmp 0xc709038ab3  <+0x4f3>
0xc709038aae   4ee  c4410a58d2           vaddss xmm10,xmm14,xmm10
0xc709038ab3   4f3  443b4dc8             cmpl r9,[rbp-0x38]
0xc709038ab7   4f7  0f82c3feffff         jc 0xc709038980  <+0x3c0>
0xc709038abd   4fd  c57928d9             vmovapd xmm11,xmm1
0xc709038ac1   501  e97c090000           jmp 0xc709039442  <+0xe82>
0xc709038ac6   506  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xc709038aca   50a  468b9c3f8c000000     movl r11,[rdi+r15*1+0x8c]
0xc709038ad2   512  33c9                 xorl rcx,rcx
0xc709038ad4   514  4585db               testl r11,r11
0xc709038ad7   517  0f94c1               setzl cl
0xc709038ada   51a  448ba510ffffff       movl r12,[rbp-0xf0]
0xc709038ae1   521  4585db               testl r11,r11
0xc709038ae4   524  0f84130c0000         jz 0xc7090396fd  <+0x113d>
0xc709038aea   52a  468ba43f88000000     movl r12,[rdi+r15*1+0x88]
0xc709038af2   532  4533c0               xorl r8,r8
0xc709038af5   535  4585e4               testl r12,r12
0xc709038af8   538  410f94c0             setzl r8l
0xc709038afc   53c  4c89a5c8feffff       REX.W movq [rbp-0x138],r12
0xc709038b03   543  4585e4               testl r12,r12
0xc709038b06   546  0f840a0c0000         jz 0xc709039716  <+0x1156>
0xc709038b0c   54c  428b743f64           movl rsi,[rdi+r15*1+0x64]
0xc709038b11   551  85c9                 testl rcx,rcx
0xc709038b13   553  0f94c1               setzl cl
0xc709038b16   556  0fb6c9               movzxbl rcx,rcx
0xc709038b19   559  458bcb               movl r9,r11
0xc709038b1c   55c  442bc9               subl r9,rcx
0xc709038b1f   55f  c4217a10943f84000000 vmovss xmm10,[rdi+r15*1+0x84]
0xc709038b29   569  c4413259da           vmulss xmm11,xmm9,xmm10
0xc709038b2e   56e  c443210adb09         vroundss xmm11,xmm11,xmm11,0x9
0xc709038b34   574  c441782edb           vucomiss xmm11,xmm11
0xc709038b39   579  7a06                 jpe 0xc709038b41  <+0x581>
0xc709038b3b   57b  0f8404000000         jz 0xc709038b45  <+0x585>
0xc709038b41   581  c57928da             vmovapd xmm11,xmm2
0xc709038b45   585  c5782eda             vucomiss xmm11,xmm2
0xc709038b49   589  0f8704000000         ja 0xc709038b53  <+0x593>
0xc709038b4f   58f  c57928da             vmovapd xmm11,xmm2
0xc709038b53   593  c441225ae3           vcvtss2sd xmm12,xmm11,xmm11
0xc709038b58   598  c443110bec0b         vroundsd xmm13,xmm13,xmm12,0xb
0xc709038b5e   59e  c4c17b2ccd           vcvttsd2si rcx,xmm13
0xc709038b63   5a3  85c9                 testl rcx,rcx
0xc709038b65   5a5  0f8927000000         jns 0xc709038b92  <+0x5d2>
0xc709038b6b   5ab  4c8b1536fbffff       REX.W movq r10,[rip+0xfffffb36]
0xc709038b72   5b2  c441f96efa           vmovq xmm15,r10
0xc709038b77   5b7  c4410358fd           vaddsd xmm15,xmm15,xmm13
0xc709038b7c   5bc  c4c17b2ccf           vcvttsd2si rcx,xmm15
0xc709038b81   5c1  85c9                 testl rcx,rcx
0xc709038b83   5c3  0f8809000000         js 0xc709038b92  <+0x5d2>
0xc709038b89   5c9  41ba00000080         movl r10,0x80000000
0xc709038b8f   5cf  410bca               orl rcx,r10
0xc709038b92   5d2  448bd1               movl r10,rcx
0xc709038b95   5d5  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0xc709038b9a   5da  c441792ef5           vucomisd xmm14,xmm13
0xc709038b9f   5df  0f8ab40d0000         jpe 0xc709039959  <+0x1399>
0xc709038ba5   5e5  0f85ae0d0000         jnz 0xc709039959  <+0x1399>
0xc709038bab   5eb  448bf1               movl r14,rcx
0xc709038bae   5ee  443bc9               cmpl r9,rcx
0xc709038bb1   5f1  450f42f1             cmovcl r14,r9
0xc709038bb5   5f5  41ba0000804f         movl r10,0x4f800000
0xc709038bbb   5fb  c441796ee2           vmovd xmm12,r10
0xc709038bc0   600  33c9                 xorl rcx,rcx
0xc709038bc2   602  c441782ee3           vucomiss xmm12,xmm11
0xc709038bc7   607  410f47ce             cmoval rcx,r14
0xc709038bcb   60b  458d340b             leal r14,[r11+rcx*1]
0xc709038bcf   60f  418d4eff             leal rcx,[r14-0x1]
0xc709038bd3   613  448bd1               movl r10,rcx
0xc709038bd6   616  8bc8                 movl rcx,rax
0xc709038bd8   618  418bc2               movl rax,r10
0xc709038bdb   61b  448bca               movl r9,rdx
0xc709038bde   61e  33d2                 xorl rdx,rdx
0xc709038be0   620  41f7f3               divl r11
0xc709038be3   623  410fafd4             imull rdx,r12
0xc709038be7   627  4585c0               testl r8,r8
0xc709038bea   62a  410f94c0             setzl r8l
0xc709038bee   62e  450fb6c0             movzxbl r8,r8
0xc709038bf2   632  4489e0               movl rax,r12
0xc709038bf5   635  412bc0               subl rax,r8
0xc709038bf8   638  c52a59d6             vmulss xmm10,xmm10,xmm6
0xc709038bfc   63c  c443290ad209         vroundss xmm10,xmm10,xmm10,0x9
0xc709038c02   642  4c89b558ffffff       REX.W movq [rbp-0xa8],r14
0xc709038c09   649  c441782ed2           vucomiss xmm10,xmm10
0xc709038c0e   64e  7a06                 jpe 0xc709038c16  <+0x656>
0xc709038c10   650  0f8404000000         jz 0xc709038c1a  <+0x65a>
0xc709038c16   656  c57928d2             vmovapd xmm10,xmm2
0xc709038c1a   65a  c5782ed2             vucomiss xmm10,xmm2
0xc709038c1e   65e  0f8704000000         ja 0xc709038c28  <+0x668>
0xc709038c24   664  c57928d2             vmovapd xmm10,xmm2
0xc709038c28   668  c4412a5ada           vcvtss2sd xmm11,xmm10,xmm10
0xc709038c2d   66d  c443110beb0b         vroundsd xmm13,xmm13,xmm11,0xb
0xc709038c33   673  c4417b2cc5           vcvttsd2si r8,xmm13
0xc709038c38   678  4585c0               testl r8,r8
0xc709038c3b   67b  0f8928000000         jns 0xc709038c69  <+0x6a9>
0xc709038c41   681  4c8b1560faffff       REX.W movq r10,[rip+0xfffffa60]
0xc709038c48   688  c441f96efa           vmovq xmm15,r10
0xc709038c4d   68d  c4410358fd           vaddsd xmm15,xmm15,xmm13
0xc709038c52   692  c4417b2cc7           vcvttsd2si r8,xmm15
0xc709038c57   697  4585c0               testl r8,r8
0xc709038c5a   69a  0f8809000000         js 0xc709038c69  <+0x6a9>
0xc709038c60   6a0  41ba00000080         movl r10,0x80000000
0xc709038c66   6a6  450bc2               orl r8,r10
0xc709038c69   6a9  458bd0               movl r10,r8
0xc709038c6c   6ac  c441832af2           vcvtqsi2sd xmm14,xmm15,r10
0xc709038c71   6b1  c441792ef5           vucomisd xmm14,xmm13
0xc709038c76   6b6  0f8a000d0000         jpe 0xc70903997c  <+0x13bc>
0xc709038c7c   6bc  0f85fa0c0000         jnz 0xc70903997c  <+0x13bc>
0xc709038c82   6c2  458bc8               movl r9,r8
0xc709038c85   6c5  413bc0               cmpl rax,r8
0xc709038c88   6c8  440f42c8             cmovcl r9,rax
0xc709038c8c   6cc  4533c0               xorl r8,r8
0xc709038c8f   6cf  c441782ee2           vucomiss xmm12,xmm10
0xc709038c94   6d4  450f47c1             cmoval r8,r9
0xc709038c98   6d8  4501e0               addl r8,r12
0xc709038c9b   6db  418d40ff             leal rax,[r8-0x1]
0xc709038c9f   6df  448bca               movl r9,rdx
0xc709038ca2   6e2  33d2                 xorl rdx,rdx
0xc709038ca4   6e4  41f7f4               divl r12
0xc709038ca7   6e7  428d040a             leal rax,[rdx+r9*1]
0xc709038cab   6eb  428b4c3f68           movl rcx,[rdi+r15*1+0x68]
0xc709038cb0   6f0  48899550ffffff       REX.W movq [rbp-0xb0],rdx
0xc709038cb7   6f7  3bc1                 cmpl rax,rcx
0xc709038cb9   6f9  0f8209000000         jc 0xc709038cc8  <+0x708>
0xc709038cbf   6ff  33c0                 xorl rax,rax
0xc709038cc1   701  8bd8                 movl rbx,rax
0xc709038cc3   703  e94b000000           jmp 0xc709038d13  <+0x753>
0xc709038cc8   708  8d5801               leal rbx,[rax+0x1]
0xc709038ccb   70b  3bcb                 cmpl rcx,rbx
0xc709038ccd   70d  76f0                 jna 0xc709038cbf  <+0x6ff>
0xc709038ccf   70f  8d1c9e               leal rbx,[rsi+rbx*4]
0xc709038cd2   712  8b1c1f               movl rbx,[rdi+rbx*1]
0xc709038cd5   715  8d0486               leal rax,[rsi+rax*4]
0xc709038cd8   718  8b0407               movl rax,[rdi+rax*1]
0xc709038cdb   71b  3bd8                 cmpl rbx,rax
0xc709038cdd   71d  0f8223000000         jc 0xc709038d06  <+0x746>
0xc709038ce3   723  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xc709038ceb   72b  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0xc709038cf3   733  0f831a000000         jnc 0xc709038d13  <+0x753>
0xc709038cf9   739  41be04000000         movl r14,0x4
0xc709038cff   73f  33db                 xorl rbx,rbx
0xc709038d01   741  e918000000           jmp 0xc709038d1e  <+0x75e>
0xc709038d06   746  33db                 xorl rbx,rbx
0xc709038d08   748  41be04000000         movl r14,0x4
0xc709038d0e   74e  e90b000000           jmp 0xc709038d1e  <+0x75e>
0xc709038d13   753  2bd8                 subl rbx,rax
0xc709038d15   755  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xc709038d1a   75a  458d3486             leal r14,[r14+rax*4]
0xc709038d1e   75e  4c89b5b8feffff       REX.W movq [rbp-0x148],r14
0xc709038d25   765  448bf2               movl r14,rdx
0xc709038d28   768  418bc0               movl rax,r8
0xc709038d2b   76b  33d2                 xorl rdx,rdx
0xc709038d2d   76d  41f7f4               divl r12
0xc709038d30   770  418d0411             leal rax,[r9+rdx*1]
0xc709038d34   774  48899db0feffff       REX.W movq [rbp-0x150],rbx
0xc709038d3b   77b  3bc1                 cmpl rax,rcx
0xc709038d3d   77d  0f8209000000         jc 0xc709038d4c  <+0x78c>
0xc709038d43   783  33c0                 xorl rax,rax
0xc709038d45   785  8bd8                 movl rbx,rax
0xc709038d47   787  e94b000000           jmp 0xc709038d97  <+0x7d7>
0xc709038d4c   78c  8d5801               leal rbx,[rax+0x1]
0xc709038d4f   78f  3bcb                 cmpl rcx,rbx
0xc709038d51   791  76f0                 jna 0xc709038d43  <+0x783>
0xc709038d53   793  8d1c9e               leal rbx,[rsi+rbx*4]
0xc709038d56   796  8b1c1f               movl rbx,[rdi+rbx*1]
0xc709038d59   799  8d0486               leal rax,[rsi+rax*4]
0xc709038d5c   79c  8b0407               movl rax,[rdi+rax*1]
0xc709038d5f   79f  3bd8                 cmpl rbx,rax
0xc709038d61   7a1  0f8223000000         jc 0xc709038d8a  <+0x7ca>
0xc709038d67   7a7  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xc709038d6f   7af  42399c3f80000000     cmpl [rdi+r15*1+0x80],rbx
0xc709038d77   7b7  0f831a000000         jnc 0xc709038d97  <+0x7d7>
0xc709038d7d   7bd  41be04000000         movl r14,0x4
0xc709038d83   7c3  33db                 xorl rbx,rbx
0xc709038d85   7c5  e918000000           jmp 0xc709038da2  <+0x7e2>
0xc709038d8a   7ca  33db                 xorl rbx,rbx
0xc709038d8c   7cc  41be04000000         movl r14,0x4
0xc709038d92   7d2  e90b000000           jmp 0xc709038da2  <+0x7e2>
0xc709038d97   7d7  2bd8                 subl rbx,rax
0xc709038d99   7d9  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xc709038d9e   7de  458d3486             leal r14,[r14+rax*4]
0xc709038da2   7e2  418d4001             leal rax,[r8+0x1]
0xc709038da6   7e6  448bc2               movl r8,rdx
0xc709038da9   7e9  33d2                 xorl rdx,rdx
0xc709038dab   7eb  41f7f4               divl r12
0xc709038dae   7ee  418d0411             leal rax,[r9+rdx*1]
0xc709038db2   7f2  4c89b5a8feffff       REX.W movq [rbp-0x158],r14
0xc709038db9   7f9  48899da0feffff       REX.W movq [rbp-0x160],rbx
0xc709038dc0   800  3bc1                 cmpl rax,rcx
0xc709038dc2   802  0f820a000000         jc 0xc709038dd2  <+0x812>
0xc709038dc8   808  33c0                 xorl rax,rax
0xc709038dca   80a  448bc8               movl r9,rax
0xc709038dcd   80d  e952000000           jmp 0xc709038e24  <+0x864>
0xc709038dd2   812  448d4801             leal r9,[rax+0x1]
0xc709038dd6   816  413bc9               cmpl rcx,r9
0xc709038dd9   819  76ed                 jna 0xc709038dc8  <+0x808>
0xc709038ddb   81b  468d0c8e             leal r9,[rsi+r9*4]
0xc709038ddf   81f  468b0c0f             movl r9,[rdi+r9*1]
0xc709038de3   823  8d0486               leal rax,[rsi+rax*4]
0xc709038de6   826  8b0407               movl rax,[rdi+rax*1]
0xc709038de9   829  443bc8               cmpl r9,rax
0xc709038dec   82c  0f8224000000         jc 0xc709038e16  <+0x856>
0xc709038df2   832  468bb43f80000000     movl r14,[rdi+r15*1+0x80]
0xc709038dfa   83a  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xc709038e02   842  0f831c000000         jnc 0xc709038e24  <+0x864>
0xc709038e08   848  41be04000000         movl r14,0x4
0xc709038e0e   84e  4533c9               xorl r9,r9
0xc709038e11   851  e91a000000           jmp 0xc709038e30  <+0x870>
0xc709038e16   856  4533c9               xorl r9,r9
0xc709038e19   859  41be04000000         movl r14,0x4
0xc709038e1f   85f  e90c000000           jmp 0xc709038e30  <+0x870>
0xc709038e24   864  442bc8               subl r9,rax
0xc709038e27   867  468b743f7c           movl r14,[rdi+r15*1+0x7c]
0xc709038e2c   86c  458d3486             leal r14,[r14+rax*4]
0xc709038e30   870  8bda                 movl rbx,rdx
0xc709038e32   872  8b8558ffffff         movl rax,[rbp-0xa8]
0xc709038e38   878  33d2                 xorl rdx,rdx
0xc709038e3a   87a  41f7f3               divl r11
0xc709038e3d   87d  410fafd4             imull rdx,r12
0xc709038e41   881  4c89b5d0feffff       REX.W movq [rbp-0x130],r14
0xc709038e48   888  8b8550ffffff         movl rax,[rbp-0xb0]
0xc709038e4e   88e  448d3410             leal r14,[rax+rdx*1]
0xc709038e52   892  4c898de8feffff       REX.W movq [rbp-0x118],r9
0xc709038e59   899  443bf1               cmpl r14,rcx
0xc709038e5c   89c  0f820b000000         jc 0xc709038e6d  <+0x8ad>
0xc709038e62   8a2  4533c9               xorl r9,r9
0xc709038e65   8a5  458bf1               movl r14,r9
0xc709038e68   8a8  e954000000           jmp 0xc709038ec1  <+0x901>
0xc709038e6d   8ad  458d4e01             leal r9,[r14+0x1]
0xc709038e71   8b1  413bc9               cmpl rcx,r9
0xc709038e74   8b4  76ec                 jna 0xc709038e62  <+0x8a2>
0xc709038e76   8b6  468d0c8e             leal r9,[rsi+r9*4]
0xc709038e7a   8ba  468b0c0f             movl r9,[rdi+r9*1]
0xc709038e7e   8be  468d34b6             leal r14,[rsi+r14*4]
0xc709038e82   8c2  468b3437             movl r14,[rdi+r14*1]
0xc709038e86   8c6  453bce               cmpl r9,r14
0xc709038e89   8c9  0f8224000000         jc 0xc709038eb3  <+0x8f3>
0xc709038e8f   8cf  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xc709038e97   8d7  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xc709038e9f   8df  0f831c000000         jnc 0xc709038ec1  <+0x901>
0xc709038ea5   8e5  41bc04000000         movl r12,0x4
0xc709038eab   8eb  4533c9               xorl r9,r9
0xc709038eae   8ee  e91a000000           jmp 0xc709038ecd  <+0x90d>
0xc709038eb3   8f3  4533c9               xorl r9,r9
0xc709038eb6   8f6  41bc04000000         movl r12,0x4
0xc709038ebc   8fc  e90c000000           jmp 0xc709038ecd  <+0x90d>
0xc709038ec1   901  452bce               subl r9,r14
0xc709038ec4   904  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xc709038ec9   909  478d24b4             leal r12,[r12+r14*4]
0xc709038ecd   90d  458d3410             leal r14,[r8+rdx*1]
0xc709038ed1   911  4c89a5e0feffff       REX.W movq [rbp-0x120],r12
0xc709038ed8   918  4c898df0feffff       REX.W movq [rbp-0x110],r9
0xc709038edf   91f  443bf1               cmpl r14,rcx
0xc709038ee2   922  0f820b000000         jc 0xc709038ef3  <+0x933>
0xc709038ee8   928  4531e4               xorl r12,r12
0xc709038eeb   92b  4589e6               movl r14,r12
0xc709038eee   92e  e954000000           jmp 0xc709038f47  <+0x987>
0xc709038ef3   933  458d6601             leal r12,[r14+0x1]
0xc709038ef7   937  4439e1               cmpl rcx,r12
0xc709038efa   93a  76ec                 jna 0xc709038ee8  <+0x928>
0xc709038efc   93c  468d24a6             leal r12,[rsi+r12*4]
0xc709038f00   940  468b2427             movl r12,[rdi+r12*1]
0xc709038f04   944  468d34b6             leal r14,[rsi+r14*4]
0xc709038f08   948  468b3437             movl r14,[rdi+r14*1]
0xc709038f0c   94c  453be6               cmpl r12,r14
0xc709038f0f   94f  0f8224000000         jc 0xc709038f39  <+0x979>
0xc709038f15   955  468b8c3f80000000     movl r9,[rdi+r15*1+0x80]
0xc709038f1d   95d  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0xc709038f25   965  0f831c000000         jnc 0xc709038f47  <+0x987>
0xc709038f2b   96b  41bc04000000         movl r12,0x4
0xc709038f31   971  4533f6               xorl r14,r14
0xc709038f34   974  e923000000           jmp 0xc709038f5c  <+0x99c>
0xc709038f39   979  4533f6               xorl r14,r14
0xc709038f3c   97c  41bc04000000         movl r12,0x4
0xc709038f42   982  e915000000           jmp 0xc709038f5c  <+0x99c>
0xc709038f47   987  452be6               subl r12,r14
0xc709038f4a   98a  468b4c3f7c           movl r9,[rdi+r15*1+0x7c]
0xc709038f4f   98f  478d34b1             leal r14,[r9+r14*4]
0xc709038f53   993  458bd6               movl r10,r14
0xc709038f56   996  4589e6               movl r14,r12
0xc709038f59   999  458be2               movl r12,r10
0xc709038f5c   99c  03d3                 addl rdx,rbx
0xc709038f5e   99e  4c89a548ffffff       REX.W movq [rbp-0xb8],r12
0xc709038f65   9a5  4c89b538ffffff       REX.W movq [rbp-0xc8],r14
0xc709038f6c   9ac  3bd1                 cmpl rdx,rcx
0xc709038f6e   9ae  0f820a000000         jc 0xc709038f7e  <+0x9be>
0xc709038f74   9b4  33d2                 xorl rdx,rdx
0xc709038f76   9b6  448bca               movl r9,rdx
0xc709038f79   9b9  e952000000           jmp 0xc709038fd0  <+0xa10>
0xc709038f7e   9be  448d4a01             leal r9,[rdx+0x1]
0xc709038f82   9c2  413bc9               cmpl rcx,r9
0xc709038f85   9c5  76ed                 jna 0xc709038f74  <+0x9b4>
0xc709038f87   9c7  468d0c8e             leal r9,[rsi+r9*4]
0xc709038f8b   9cb  468b0c0f             movl r9,[rdi+r9*1]
0xc709038f8f   9cf  8d1496               leal rdx,[rsi+rdx*4]
0xc709038f92   9d2  8b1417               movl rdx,[rdi+rdx*1]
0xc709038f95   9d5  443bca               cmpl r9,rdx
0xc709038f98   9d8  0f8224000000         jc 0xc709038fc2  <+0xa02>
0xc709038f9e   9de  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xc709038fa6   9e6  46398c3f80000000     cmpl [rdi+r15*1+0x80],r9
0xc709038fae   9ee  0f831c000000         jnc 0xc709038fd0  <+0xa10>
0xc709038fb4   9f4  41bc04000000         movl r12,0x4
0xc709038fba   9fa  4533c9               xorl r9,r9
0xc709038fbd   9fd  e91a000000           jmp 0xc709038fdc  <+0xa1c>
0xc709038fc2   a02  4533c9               xorl r9,r9
0xc709038fc5   a05  41bc04000000         movl r12,0x4
0xc709038fcb   a0b  e90c000000           jmp 0xc709038fdc  <+0xa1c>
0xc709038fd0   a10  442bca               subl r9,rdx
0xc709038fd3   a13  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xc709038fd8   a18  458d2494             leal r12,[r12+rdx*4]
0xc709038fdc   a1c  8b9558ffffff         movl rdx,[rbp-0xa8]
0xc709038fe2   a22  83c201               addl rdx,0x1
0xc709038fe5   a25  448bf0               movl r14,rax
0xc709038fe8   a28  8bc2                 movl rax,rdx
0xc709038fea   a2a  33d2                 xorl rdx,rdx
0xc709038fec   a2c  41f7f3               divl r11
0xc709038fef   a2f  448b9dc8feffff       movl r11,[rbp-0x138]
0xc709038ff6   a36  440fafda             imull r11,rdx
0xc709038ffa   a3a  4503f3               addl r14,r11
0xc709038ffd   a3d  4c89a540ffffff       REX.W movq [rbp-0xc0],r12
0xc709039004   a44  443bf1               cmpl r14,rcx
0xc709039007   a47  0f820a000000         jc 0xc709039017  <+0xa57>
0xc70903900d   a4d  33c0                 xorl rax,rax
0xc70903900f   a4f  448bf0               movl r14,rax
0xc709039012   a52  e94f000000           jmp 0xc709039066  <+0xaa6>
0xc709039017   a57  418d4601             leal rax,[r14+0x1]
0xc70903901b   a5b  3bc8                 cmpl rcx,rax
0xc70903901d   a5d  76ee                 jna 0xc70903900d  <+0xa4d>
0xc70903901f   a5f  8d0486               leal rax,[rsi+rax*4]
0xc709039022   a62  8b0407               movl rax,[rdi+rax*1]
0xc709039025   a65  468d34b6             leal r14,[rsi+r14*4]
0xc709039029   a69  468b3437             movl r14,[rdi+r14*1]
0xc70903902d   a6d  413bc6               cmpl rax,r14
0xc709039030   a70  0f8223000000         jc 0xc709039059  <+0xa99>
0xc709039036   a76  428b943f80000000     movl rdx,[rdi+r15*1+0x80]
0xc70903903e   a7e  4239843f80000000     cmpl [rdi+r15*1+0x80],rax
0xc709039046   a86  0f831a000000         jnc 0xc709039066  <+0xaa6>
0xc70903904c   a8c  41be04000000         movl r14,0x4
0xc709039052   a92  33c0                 xorl rax,rax
0xc709039054   a94  e919000000           jmp 0xc709039072  <+0xab2>
0xc709039059   a99  33c0                 xorl rax,rax
0xc70903905b   a9b  41be04000000         movl r14,0x4
0xc709039061   aa1  e90c000000           jmp 0xc709039072  <+0xab2>
0xc709039066   aa6  412bc6               subl rax,r14
0xc709039069   aa9  428b543f7c           movl rdx,[rdi+r15*1+0x7c]
0xc70903906e   aae  468d34b2             leal r14,[rdx+r14*4]
0xc709039072   ab2  4503c3               addl r8,r11
0xc709039075   ab5  443bc1               cmpl r8,rcx
0xc709039078   ab8  0f820a000000         jc 0xc709039088  <+0xac8>
0xc70903907e   abe  33d2                 xorl rdx,rdx
0xc709039080   ac0  448bc2               movl r8,rdx
0xc709039083   ac3  e94f000000           jmp 0xc7090390d7  <+0xb17>
0xc709039088   ac8  418d5001             leal rdx,[r8+0x1]
0xc70903908c   acc  3bca                 cmpl rcx,rdx
0xc70903908e   ace  76ee                 jna 0xc70903907e  <+0xabe>
0xc709039090   ad0  8d1496               leal rdx,[rsi+rdx*4]
0xc709039093   ad3  8b1417               movl rdx,[rdi+rdx*1]
0xc709039096   ad6  468d0486             leal r8,[rsi+r8*4]
0xc70903909a   ada  468b0407             movl r8,[rdi+r8*1]
0xc70903909e   ade  413bd0               cmpl rdx,r8
0xc7090390a1   ae1  0f8223000000         jc 0xc7090390ca  <+0xb0a>
0xc7090390a7   ae7  468ba43f80000000     movl r12,[rdi+r15*1+0x80]
0xc7090390af   aef  4239943f80000000     cmpl [rdi+r15*1+0x80],rdx
0xc7090390b7   af7  0f831a000000         jnc 0xc7090390d7  <+0xb17>
0xc7090390bd   afd  41b804000000         movl r8,0x4
0xc7090390c3   b03  33d2                 xorl rdx,rdx
0xc7090390c5   b05  e919000000           jmp 0xc7090390e3  <+0xb23>
0xc7090390ca   b0a  33d2                 xorl rdx,rdx
0xc7090390cc   b0c  41b804000000         movl r8,0x4
0xc7090390d2   b12  e90c000000           jmp 0xc7090390e3  <+0xb23>
0xc7090390d7   b17  412bd0               subl rdx,r8
0xc7090390da   b1a  468b643f7c           movl r12,[rdi+r15*1+0x7c]
0xc7090390df   b1f  478d0484             leal r8,[r12+r8*4]
0xc7090390e3   b23  4403db               addl r11,rbx
0xc7090390e6   b26  443bd9               cmpl r11,rcx
0xc7090390e9   b29  0f820b000000         jc 0xc7090390fa  <+0xb3a>
0xc7090390ef   b2f  4533db               xorl r11,r11
0xc7090390f2   b32  458be3               movl r12,r11
0xc7090390f5   b35  e954000000           jmp 0xc70903914e  <+0xb8e>
0xc7090390fa   b3a  458d6301             leal r12,[r11+0x1]
0xc7090390fe   b3e  4439e1               cmpl rcx,r12
0xc709039101   b41  76ec                 jna 0xc7090390ef  <+0xb2f>
0xc709039103   b43  468d24a6             leal r12,[rsi+r12*4]
0xc709039107   b47  468b2427             movl r12,[rdi+r12*1]
0xc70903910b   b4b  468d1c9e             leal r11,[rsi+r11*4]
0xc70903910f   b4f  468b1c1f             movl r11,[rdi+r11*1]
0xc709039113   b53  453be3               cmpl r12,r11
0xc709039116   b56  0f8224000000         jc 0xc709039140  <+0xb80>
0xc70903911c   b5c  428b9c3f80000000     movl rbx,[rdi+r15*1+0x80]
0xc709039124   b64  4639a43f80000000     cmpl [rdi+r15*1+0x80],r12
0xc70903912c   b6c  0f831c000000         jnc 0xc70903914e  <+0xb8e>
0xc709039132   b72  41bb04000000         movl r11,0x4
0xc709039138   b78  4531e4               xorl r12,r12
0xc70903913b   b7b  e91a000000           jmp 0xc70903915a  <+0xb9a>
0xc709039140   b80  4531e4               xorl r12,r12
0xc709039143   b83  41bb04000000         movl r11,0x4
0xc709039149   b89  e90c000000           jmp 0xc70903915a  <+0xb9a>
0xc70903914e   b8e  452be3               subl r12,r11
0xc709039151   b91  428b5c3f7c           movl rbx,[rdi+r15*1+0x7c]
0xc709039156   b96  468d1c9b             leal r11,[rbx+r11*4]
0xc70903915a   b9a  8b5de0               movl rbx,[rbp-0x20]
0xc70903915d   b9d  4489641f4c           movl [rdi+rbx*1+0x4c],r12
0xc709039162   ba2  44895c1f48           movl [rdi+rbx*1+0x48],r11
0xc709039167   ba7  89541f44             movl [rdi+rbx*1+0x44],rdx
0xc70903916b   bab  4489441f40           movl [rdi+rbx*1+0x40],r8
0xc709039170   bb0  89441f3c             movl [rdi+rbx*1+0x3c],rax
0xc709039174   bb4  4489741f38           movl [rdi+rbx*1+0x38],r14
0xc709039179   bb9  44894c1f34           movl [rdi+rbx*1+0x34],r9
0xc70903917e   bbe  448ba540ffffff       movl r12,[rbp-0xc0]
0xc709039185   bc5  4489641f30           movl [rdi+rbx*1+0x30],r12
0xc70903918a   bca  448ba538ffffff       movl r12,[rbp-0xc8]
0xc709039191   bd1  4489641f2c           movl [rdi+rbx*1+0x2c],r12
0xc709039196   bd6  448ba548ffffff       movl r12,[rbp-0xb8]
0xc70903919d   bdd  4489641f28           movl [rdi+rbx*1+0x28],r12
0xc7090391a2   be2  448b8df0feffff       movl r9,[rbp-0x110]
0xc7090391a9   be9  44894c1f24           movl [rdi+rbx*1+0x24],r9
0xc7090391ae   bee  448ba5e0feffff       movl r12,[rbp-0x120]
0xc7090391b5   bf5  4489641f20           movl [rdi+rbx*1+0x20],r12
0xc7090391ba   bfa  448b8de8feffff       movl r9,[rbp-0x118]
0xc7090391c1   c01  44894c1f1c           movl [rdi+rbx*1+0x1c],r9
0xc7090391c6   c06  448bb5d0feffff       movl r14,[rbp-0x130]
0xc7090391cd   c0d  4489741f18           movl [rdi+rbx*1+0x18],r14
0xc7090391d2   c12  448b85a0feffff       movl r8,[rbp-0x160]
0xc7090391d9   c19  4489441f14           movl [rdi+rbx*1+0x14],r8
0xc7090391de   c1e  448bb5a8feffff       movl r14,[rbp-0x158]
0xc7090391e5   c25  4489741f10           movl [rdi+rbx*1+0x10],r14
0xc7090391ea   c2a  448b85b0feffff       movl r8,[rbp-0x150]
0xc7090391f1   c31  4489441f0c           movl [rdi+rbx*1+0xc],r8
0xc7090391f6   c36  448bb5b8feffff       movl r14,[rbp-0x148]
0xc7090391fd   c3d  4489741f08           movl [rdi+rbx*1+0x8],r14
0xc709039202   c42  49b80000000009000000 REX.W movq r8,0x900000000
0xc70903920c   c4c  4c89041f             REX.W movq [rdi+rbx*1],r8
0xc709039210   c50  448b8560ffffff       movl r8,[rbp-0xa0]
0xc709039217   c57  448b9dc0feffff       movl r11,[rbp-0x140]
0xc70903921e   c5e  443b9d60ffffff       cmpl r11,[rbp-0xa0]
0xc709039225   c65  450f42c3             cmovcl r8,r11
0xc709039229   c69  448b4db8             movl r9,[rbp-0x48]
0xc70903922d   c6d  448b5db0             movl r11,[rbp-0x50]
0xc709039231   c71  443b5db8             cmpl r11,[rbp-0x48]
0xc709039235   c75  450f42cb             cmovcl r9,r11
0xc709039239   c79  458bd9               movl r11,r9
0xc70903923c   c7c  453bc1               cmpl r8,r9
0xc70903923f   c7f  450f42d8             cmovcl r11,r8
0xc709039243   c83  4c899d48ffffff       REX.W movq [rbp-0xb8],r11
0xc70903924a   c8a  c57928d2             vmovapd xmm10,xmm2
0xc70903924e   c8e  c57928da             vmovapd xmm11,xmm2
0xc709039252   c92  4533c0               xorl r8,r8
0xc709039255   c95  8b9510ffffff         movl rdx,[rbp-0xf0]
0xc70903925b   c9b  8b8508ffffff         movl rax,[rbp-0xf8]
0xc709039261   ca1  448bb500ffffff       movl r14,[rbp-0x100]
0xc709039268   ca8  448ba5f8feffff       movl r12,[rbp-0x108]
0xc70903926f   caf  e90f000000           jmp 0xc709039283  <+0xcc3>
0xc709039274   cb4  660f1f840000000000   nop
0xc70903927d   cbd  0f1f00               nop
0xc709039280   cc0  8b5de0               movl rbx,[rbp-0x20]
0xc709039283   cc3  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc709039287   cc7  0f8614070000         jna 0xc7090399a1  <+0x13e1>
0xc70903928d   ccd  428d4cc308           leal rcx,[rbx+r8*8+0x8]
0xc709039292   cd2  8b740f04             movl rsi,[rdi+rcx*1+0x4]
0xc709039296   cd6  85f6                 testl rsi,rsi
0xc709039298   cd8  0f8496010000         jz 0xc709039434  <+0xe74>
0xc70903929e   cde  8b0c0f               movl rcx,[rdi+rcx*1]
0xc7090392a1   ce1  8d34b1               leal rsi,[rcx+rsi*4]
0xc7090392a4   ce4  e922000000           jmp 0xc7090392cb  <+0xd0b>
0xc7090392a9   ce9  660f1f840000000000   nop
0xc7090392b2   cf2  660f1f840000000000   nop
0xc7090392bb   cfb  0f1f440000           nop
0xc7090392c0   d00  448b9d48ffffff       movl r11,[rbp-0xb8]
0xc7090392c7   d07  c57928d9             vmovapd xmm11,xmm1
0xc7090392cb   d0b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc7090392cf   d0f  0f8659070000         jna 0xc709039a2e  <+0x146e>
0xc7090392d5   d15  660f1f840000000000   nop
0xc7090392de   d1e  660f1f840000000000   nop
0xc7090392e7   d27  660f1f840000000000   nop
0xc7090392f0   d30  660f1f840000000000   nop
0xc7090392f9   d39  0f1f8000000000       nop
0xc709039300   d40  448d4904             leal r9,[rcx+0x4]
0xc709039304   d44  8b0c0f               movl rcx,[rdi+rcx*1]
0xc709039307   d47  443bd9               cmpl r11,rcx
0xc70903930a   d4a  0f8760000000         ja 0xc709039370  <+0xdb0>
0xc709039310   d50  443bce               cmpl r9,rsi
0xc709039313   d53  0f841b010000         jz 0xc709039434  <+0xe74>
0xc709039319   d59  418d4904             leal rcx,[r9+0x4]
0xc70903931d   d5d  468b0c0f             movl r9,[rdi+r9*1]
0xc709039321   d61  453bd9               cmpl r11,r9
0xc709039324   d64  0f874f000000         ja 0xc709039379  <+0xdb9>
0xc70903932a   d6a  3bce                 cmpl rcx,rsi
0xc70903932c   d6c  0f8402010000         jz 0xc709039434  <+0xe74>
0xc709039332   d72  448d4904             leal r9,[rcx+0x4]
0xc709039336   d76  8b0c0f               movl rcx,[rdi+rcx*1]
0xc709039339   d79  443bd9               cmpl r11,rcx
0xc70903933c   d7c  0f872e000000         ja 0xc709039370  <+0xdb0>
0xc709039342   d82  443bce               cmpl r9,rsi
0xc709039345   d85  0f84e9000000         jz 0xc709039434  <+0xe74>
0xc70903934b   d8b  493b65a0             REX.W cmpq rsp,[r13-0x60]
0xc70903934f   d8f  0f867d070000         jna 0xc709039ad2  <+0x1512>
0xc709039355   d95  418d4904             leal rcx,[r9+0x4]
0xc709039359   d99  468b0c0f             movl r9,[rdi+r9*1]
0xc70903935d   d9d  453bd9               cmpl r11,r9
0xc709039360   da0  0f8713000000         ja 0xc709039379  <+0xdb9>
0xc709039366   da6  3bce                 cmpl rcx,rsi
0xc709039368   da8  0f84c6000000         jz 0xc709039434  <+0xe74>
0xc70903936e   dae  eb90                 jmp 0xc709039300  <+0xd40>
0xc709039370   db0  448bd1               movl r10,rcx
0xc709039373   db3  418bc9               movl rcx,r9
0xc709039376   db6  458bca               movl r9,r10
0xc709039379   db9  438d1c8c             leal rbx,[r12+r9*4]
0xc70903937d   dbd  478d3c8e             leal r15,[r14+r9*4]
0xc709039381   dc1  468d1c88             leal r11,[rax+r9*4]
0xc709039385   dc5  c4217a10241f         vmovss xmm12,[rdi+r11*1]
0xc70903938b   dcb  468d1c8a             leal r11,[rdx+r9*4]
0xc70903938f   dcf  c4214a5c2c1f         vsubss xmm13,xmm6,[rdi+r11*1]
0xc709039395   dd5  c5782ead18ffffff     vucomiss xmm13,[rbp-0xe8]
0xc70903939d   ddd  0f8715000000         ja 0xc7090393b8  <+0xdf8>
0xc7090393a3   de3  c4c1782edd           vucomiss xmm3,xmm13
0xc7090393a8   de8  0f860e000000         jna 0xc7090393bc  <+0xdfc>
0xc7090393ae   dee  c4415a58ed           vaddss xmm13,xmm4,xmm13
0xc7090393b3   df3  e904000000           jmp 0xc7090393bc  <+0xdfc>
0xc7090393b8   df8  c5125cec             vsubss xmm13,xmm13,xmm4
0xc7090393bc   dfc  c57a10341f           vmovss xmm14,[rdi+rbx*1]
0xc7090393c1   e01  c4a17a100c3f         vmovss xmm1,[rdi+r15*1]
0xc7090393c7   e07  c441325ce4           vsubss xmm12,xmm9,xmm12
0xc7090393cc   e0c  c5782ea518ffffff     vucomiss xmm12,[rbp-0xe8]
0xc7090393d4   e14  0f8715000000         ja 0xc7090393ef  <+0xe2f>
0xc7090393da   e1a  c4c1782edc           vucomiss xmm3,xmm12
0xc7090393df   e1f  0f860e000000         jna 0xc7090393f3  <+0xe33>
0xc7090393e5   e25  c4415a58e4           vaddss xmm12,xmm4,xmm12
0xc7090393ea   e2a  e904000000           jmp 0xc7090393f3  <+0xe33>
0xc7090393ef   e2f  c51a5ce4             vsubss xmm12,xmm12,xmm4
0xc7090393f3   e33  c4c17258cb           vaddss xmm1,xmm1,xmm11
0xc7090393f8   e38  c4411259ed           vmulss xmm13,xmm13,xmm13
0xc7090393fd   e3d  c4411a59e4           vmulss xmm12,xmm12,xmm12
0xc709039402   e42  c4411a58e5           vaddss xmm12,xmm12,xmm13
0xc709039407   e47  c4c1782ec4           vucomiss xmm0,xmm12
0xc70903940c   e4c  0f870a000000         ja 0xc70903941c  <+0xe5c>
0xc709039412   e52  c4c17928cb           vmovapd xmm1,xmm11
0xc709039417   e57  e905000000           jmp 0xc709039421  <+0xe61>
0xc70903941c   e5c  c4410a58d2           vaddss xmm10,xmm14,xmm10
0xc709039421   e61  3bf1                 cmpl rsi,rcx
0xc709039423   e63  0f8597feffff         jnz 0xc7090392c0  <+0xd00>
0xc709039429   e69  448b9d48ffffff       movl r11,[rbp-0xb8]
0xc709039430   e70  c57928d9             vmovapd xmm11,xmm1
0xc709039434   e74  4183c001             addl r8,0x1
0xc709039438   e78  4183f809             cmpl r8,0x9
0xc70903943c   e7c  0f853efeffff         jnz 0xc709039280  <+0xcc0>
0xc709039442   e82  c4412259e3           vmulss xmm12,xmm11,xmm11
0xc709039447   e87  c4412a59ea           vmulss xmm13,xmm10,xmm10
0xc70903944c   e8c  c4411258e4           vaddss xmm12,xmm13,xmm12
0xc709039451   e91  c5782ee2             vucomiss xmm12,xmm2
0xc709039455   e95  0f8726000000         ja 0xc709039481  <+0xec1>
0xc70903945b   e9b  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xc70903945f   e9f  4e8b843fa0000000     REX.W movq r8,[rdi+r15*1+0xa0]
0xc709039467   ea7  4983c001             REX.W addq r8,0x1
0xc70903946b   eab  4e89843fa0000000     REX.W movq [rdi+r15*1+0xa0],r8
0xc709039473   eb3  c4417928d8           vmovapd xmm11,xmm8
0xc709039478   eb8  c57928d7             vmovapd xmm10,xmm7
0xc70903947c   ebc  e91d000000           jmp 0xc70903949e  <+0xede>
0xc709039481   ec1  f3450f51e4           sqrtss xmm12,xmm12
0xc709039486   ec6  c4412a5ed4           vdivss xmm10,xmm10,xmm12
0xc70903948b   ecb  c4417828d2           vmovaps xmm10,xmm10
0xc709039490   ed0  c441225edc           vdivss xmm11,xmm11,xmm12
0xc709039495   ed5  c4417828db           vmovaps xmm11,xmm11
0xc70903949a   eda  4c8b7dd0             REX.W movq r15,[rbp-0x30]
0xc70903949e   ede  4e8b843f90000000     REX.W movq r8,[rdi+r15*1+0x90]
0xc7090394a6   ee6  49b8157c4a7fb979379e REX.W movq r8,0x9e3779b97f4a7c15
0xc7090394b0   ef0  4e03843f90000000     REX.W addq r8,[rdi+r15*1+0x90]
0xc7090394b8   ef8  4e89843f90000000     REX.W movq [rdi+r15*1+0x90],r8
0xc7090394c0   f00  4d8bd8               REX.W movq r11,r8
0xc7090394c3   f03  49c1eb1e             REX.W shrq r11, 30
0xc7090394c7   f07  4d33c3               REX.W xorq r8,r11
0xc7090394ca   f0a  49bbb9e5e41c6d4758bf REX.W movq r11,0xbf58476d1ce4e5b9
0xc7090394d4   f14  4d0fafd8             REX.W imulq r11,r8
0xc7090394d8   f18  4d8bc3               REX.W movq r8,r11
0xc7090394db   f1b  49c1e81b             REX.W shrq r8, 27
0xc7090394df   f1f  4d33d8               REX.W xorq r11,r8
0xc7090394e2   f22  49b8eb113113bb49d094 REX.W movq r8,0x94d049bb133111eb
0xc7090394ec   f2c  4d0fafc3             REX.W imulq r8,r11
0xc7090394f0   f30  4d8bd8               REX.W movq r11,r8
0xc7090394f3   f33  49c1eb2b             REX.W shrq r11, 43
0xc7090394f7   f37  49c1e80c             REX.W shrq r8, 12
0xc7090394fb   f3b  4d33c3               REX.W xorq r8,r11
0xc7090394fe   f3e  49bb000000000000f03f REX.W movq r11,0x3ff0000000000000
0xc709039508   f48  4d0bd8               REX.W orq r11,r8
0xc70903950b   f4b  c441f96ee3           vmovq xmm12,r11
0xc709039510   f50  49ba000000000000f0bf REX.W movq r10,0xbff0000000000000
0xc70903951a   f5a  c441f96eea           vmovq xmm13,r10
0xc70903951f   f5f  c4411358e4           vaddsd xmm12,xmm13,xmm12
0xc709039524   f64  49ba000000000000e0bf REX.W movq r10,0xbfe0000000000000
0xc70903952e   f6e  c441f96eea           vmovq xmm13,r10
0xc709039533   f73  c4411358e4           vaddsd xmm12,xmm13,xmm12
0xc709039538   f78  c4217a10ac3fb4000000 vmovss xmm13,[rdi+r15*1+0xb4]
0xc709039542   f82  c441125aed           vcvtss2sd xmm13,xmm13,xmm13
0xc709039547   f87  c4411359e4           vmulsd xmm12,xmm13,xmm12
0xc70903954c   f8c  c4c11b5acc           vcvtsd2ss xmm1,xmm12,xmm12
0xc709039551   f91  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc709039556   f96  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc70903955b   f9b  c5fb118d60ffffff     vmovsd [rbp-0xa0],xmm1
0xc709039563   fa3  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc709039567   fa7  e88c58edff           call 0xc708f0edf8  (jump table)
0xc70903956c   fac  c5fb118d58ffffff     vmovsd [rbp-0xa8],xmm1
0xc709039574   fb4  c5fb108d60ffffff     vmovsd xmm1,[rbp-0xa0]
0xc70903957c   fbc  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc709039580   fc0  e87b58edff           call 0xc708f0ee00  (jump table)
0xc709039585   fc5  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc709039589   fc9  4c8b45d0             REX.W movq r8,[rbp-0x30]
0xc70903958d   fcd  c4a17a108407b0000000 vmovss xmm0,[rdi+r8*1+0xb0]
0xc709039597   fd7  c5fb109568ffffff     vmovsd xmm2,[rbp-0x98]
0xc70903959f   fdf  c5ea59d0             vmulss xmm2,xmm2,xmm0
0xc7090395a3   fe3  c5ea589570ffffff     vaddss xmm2,xmm2,[rbp-0x90]
0xc7090395ab   feb  c4a17a109c07a8000000 vmovss xmm3,[rdi+r8*1+0xa8]
0xc7090395b5   ff5  c5f82ed3             vucomiss xmm2,xmm3
0xc7090395b9   ff9  0f8317000000         jnc 0xc7090395d6  <+0x1016>
0xc7090395bf   fff  c5d857e4             vxorps xmm4,xmm4,xmm4
0xc7090395c3  1003  c5f82ee2             vucomiss xmm4,xmm2
0xc7090395c7  1007  0f8611000000         jna 0xc7090395de  <+0x101e>
0xc7090395cd  100d  c5e258d2             vaddss xmm2,xmm3,xmm2
0xc7090395d1  1011  e908000000           jmp 0xc7090395de  <+0x101e>
0xc7090395d6  1016  c5ea5cd3             vsubss xmm2,xmm2,xmm3
0xc7090395da  101a  c5d857e4             vxorps xmm4,xmm4,xmm4
0xc7090395de  101e  c5fa598578ffffff     vmulss xmm0,xmm0,[rbp-0x88]
0xc7090395e6  1026  c5fa584580           vaddss xmm0,xmm0,[rbp-0x80]
0xc7090395eb  102b  c5f82ec3             vucomiss xmm0,xmm3
0xc7090395ef  102f  0f8313000000         jnc 0xc709039608  <+0x1048>
0xc7090395f5  1035  c5f82ee0             vucomiss xmm4,xmm0
0xc7090395f9  1039  0f860d000000         jna 0xc70903960c  <+0x104c>
0xc7090395ff  103f  c5e258c0             vaddss xmm0,xmm3,xmm0
0xc709039603  1043  e904000000           jmp 0xc70903960c  <+0x104c>
0xc709039608  1048  c5fa5cc3             vsubss xmm0,xmm0,xmm3
0xc70903960c  104c  448b5d88             movl r11,[rbp-0x78]
0xc709039610  1050  443b5dc0             cmpl r11,[rbp-0x40]
0xc709039614  1054  0f86aa000000         jna 0xc7090396c4  <+0x1104>
0xc70903961a  105a  448b65c0             movl r12,[rbp-0x40]
0xc70903961e  105e  448b7d90             movl r15,[rbp-0x70]
0xc709039622  1062  478d34a7             leal r14,[r15+r12*4]
0xc709039626  1066  c5f82ed3             vucomiss xmm2,xmm3
0xc70903962a  106a  0f8204000000         jc 0xc709039634  <+0x1074>
0xc709039630  1070  c5f928d4             vmovapd xmm2,xmm4
0xc709039634  1074  c4a17a111437         vmovss [rdi+r14*1],xmm2
0xc70903963a  107a  448b7598             movl r14,[rbp-0x68]
0xc70903963e  107e  438d04a6             leal rax,[r14+r12*4]
0xc709039642  1082  c5f82ec3             vucomiss xmm0,xmm3
0xc709039646  1086  0f8204000000         jc 0xc709039650  <+0x1090>
0xc70903964c  108c  c5f928c4             vmovapd xmm0,xmm4
0xc709039650  1090  c5fa110407           vmovss [rdi+rax*1],xmm0
0xc709039655  1095  8b45a0               movl rax,[rbp-0x60]
0xc709039658  1098  428d1ca0             leal rbx,[rax+r12*4]
0xc70903965c  109c  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc709039661  10a1  c5a259c1             vmulss xmm0,xmm11,xmm1
0xc709039665  10a5  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc70903966a  10aa  c5aa599558ffffff     vmulss xmm2,xmm10,[rbp-0xa8]
0xc709039672  10b2  c5fa5cc2             vsubss xmm0,xmm0,xmm2
0xc709039676  10b6  c5fa11041f           vmovss [rdi+rbx*1],xmm0
0xc70903967b  10bb  8b5da8               movl rbx,[rbp-0x58]
0xc70903967e  10be  428d14a3             leal rdx,[rbx+r12*4]
0xc709039682  10c2  c5fb108558ffffff     vmovsd xmm0,[rbp-0xa8]
0xc70903968a  10ca  c4c17a59c3           vmulss xmm0,xmm0,xmm11
0xc70903968f  10cf  c4c17259d2           vmulss xmm2,xmm1,xmm10
0xc709039694  10d4  c5ea58c0             vaddss xmm0,xmm2,xmm0
0xc709039698  10d8  c5fa110417           vmovss [rdi+rdx*1],xmm0
0xc70903969d  10dd  4589e3               movl r11,r12
0xc7090396a0  10e0  4d8be0               REX.W movq r12,r8
0xc7090396a3  10e3  c5f928d4             vmovapd xmm2,xmm4
0xc7090396a7  10e7  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc7090396af  10ef  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc7090396b7  10f7  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc7090396bf  10ff  e923000000           jmp 0xc7090396e7  <+0x1127>
0xc7090396c4  1104  4d8be0               REX.W movq r12,r8
0xc7090396c7  1107  448b5dc0             movl r11,[rbp-0x40]
0xc7090396cb  110b  c5f928d4             vmovapd xmm2,xmm4
0xc7090396cf  110f  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc7090396d7  1117  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc7090396df  111f  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc7090396e7  1127  4183c301             addl r11,0x1
0xc7090396eb  112b  448b45c8             movl r8,[rbp-0x38]
0xc7090396ef  112f  453bc3               cmpl r8,r11
0xc7090396f2  1132  0f8437000000         jz 0xc70903972f  <+0x116f>
0xc7090396f8  1138  e943f1ffff           jmp 0xc709038840  <+0x280>
0xc7090396fd  113d  b8c8301600           movl rax,0x1630c8
0xc709039702  1142  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc709039706  1146  e86d3fedff           call 0xc708f0d678  (jump table)
0xc70903970b  114b  33ff                 xorl rdi,rdi
0xc70903970d  114d  85ff                 testl rdi,rdi
0xc70903970f  114f  0f8467040000         jz 0xc709039b7c  <+0x15bc>
0xc709039715  1155  cc                   int3l
0xc709039716  1156  b8c8301600           movl rax,0x1630c8
0xc70903971b  115b  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc70903971f  115f  e8543fedff           call 0xc708f0d678  (jump table)
0xc709039724  1164  33ff                 xorl rdi,rdi
0xc709039726  1166  85ff                 testl rdi,rdi
0xc709039728  1168  0f8449040000         jz 0xc709039b77  <+0x15b7>
0xc70903972e  116e  cc                   int3l
0xc70903972f  116f  4c8b45e8             REX.W movq r8,[rbp-0x18]
0xc709039733  1173  448b5de0             movl r11,[rbp-0x20]
0xc709039737  1177  c4a17a6f442730       vmovdqu xmm0,[rdi+r12*1+0x30]
0xc70903973e  117e  c4a17a6f1427         vmovdqu xmm2,[rdi+r12*1]
0xc709039744  1184  c4a17a7f542730       vmovdqu [rdi+r12*1+0x30],xmm2
0xc70903974b  118b  c4a17a7f0427         vmovdqu [rdi+r12*1],xmm0
0xc709039751  1191  c4a17a6f442740       vmovdqu xmm0,[rdi+r12*1+0x40]
0xc709039758  1198  c4a17a6f542710       vmovdqu xmm2,[rdi+r12*1+0x10]
0xc70903975f  119f  c4a17a7f542740       vmovdqu [rdi+r12*1+0x40],xmm2
0xc709039766  11a6  c4a17a7f442710       vmovdqu [rdi+r12*1+0x10],xmm0
0xc70903976d  11ad  c4a17a6f442750       vmovdqu xmm0,[rdi+r12*1+0x50]
0xc709039774  11b4  c4a17a6f542720       vmovdqu xmm2,[rdi+r12*1+0x20]
0xc70903977b  11bb  c4a17a7f542750       vmovdqu [rdi+r12*1+0x50],xmm2
0xc709039782  11c2  c4a17a7f442720       vmovdqu [rdi+r12*1+0x20],xmm0
0xc709039789  11c9  4e8bbc2798000000     REX.W movq r15,[rdi+r12*1+0x98]
0xc709039791  11d1  4983c701             REX.W addq r15,0x1
0xc709039795  11d5  4e89bc2798000000     REX.W movq [rdi+r12*1+0x98],r15
0xc70903979d  11dd  418bfb               movl rdi,r11
0xc7090397a0  11e0  83c750               addl rdi,0x50
0xc7090397a3  11e3  418938               movl [r8],rdi
0xc7090397a6  11e6  488be5               REX.W movq rsp,rbp
0xc7090397a9  11e9  5d                   pop rbp
0xc7090397aa  11ea  c3                   retl
0xc7090397ab  11eb  488945b0             REX.W movq [rbp-0x50],rax
0xc7090397af  11ef  e81c6dedff           call 0xc708f104d0  (jump table)
0xc7090397b4  11f4  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc7090397b8  11f8  488b75f0             REX.W movq rsi,[rbp-0x10]
0xc7090397bc  11fc  8b45b0               movl rax,[rbp-0x50]
0xc7090397bf  11ff  e91ceeffff           jmp 0xc7090385e0  <+0x20>
0xc7090397c4  1204  c5f92eed             vucomisd xmm5,xmm5
0xc7090397c8  1208  0f8b08000000         jpo 0xc7090397d6  <+0x1216>
0xc7090397ce  120e  4533ff               xorl r15,r15
0xc7090397d1  1211  e912efffff           jmp 0xc7090386e8  <+0x128>
0xc7090397d6  1216  c5f82ee3             vucomiss xmm4,xmm3
0xc7090397da  121a  77f2                 ja 0xc7090397ce  <+0x120e>
0xc7090397dc  121c  41bfffffffff         movl r15,0xffffffff
0xc7090397e2  1222  e901efffff           jmp 0xc7090386e8  <+0x128>
0xc7090397e7  1227  4c895dc0             REX.W movq [rbp-0x40],r11
0xc7090397eb  122b  e8e06cedff           call 0xc708f104d0  (jump table)
0xc7090397f0  1230  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc7090397f4  1234  4c8b65d0             REX.W movq r12,[rbp-0x30]
0xc7090397f8  1238  448b5dc0             movl r11,[rbp-0x40]
0xc7090397fc  123c  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc709039800  1240  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc709039808  1248  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039810  1250  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc709039818  1258  e92df0ffff           jmp 0xc70903884a  <+0x28a>
0xc70903981d  125d  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc709039822  1262  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc709039827  1267  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0xc70903982e  126e  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xc709039835  1275  e8966cedff           call 0xc708f104d0  (jump table)
0xc70903983a  127a  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc70903983e  127e  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc709039842  1282  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xc709039847  1287  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xc70903984f  128f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xc709039857  1297  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xc70903985f  129f  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc709039864  12a4  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc709039869  12a9  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc709039871  12b1  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039879  12b9  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc709039881  12c1  448bb510ffffff       movl r14,[rbp-0xf0]
0xc709039888  12c8  448b8508ffffff       movl r8,[rbp-0xf8]
0xc70903988f  12cf  8b9500ffffff         movl rdx,[rbp-0x100]
0xc709039895  12d5  8b85f8feffff         movl rax,[rbp-0x108]
0xc70903989b  12db  448ba558ffffff       movl r12,[rbp-0xa8]
0xc7090398a2  12e2  8b9d60ffffff         movl rbx,[rbp-0xa0]
0xc7090398a8  12e8  e9e4f0ffff           jmp 0xc709038991  <+0x3d1>
0xc7090398ad  12ed  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc7090398b2  12f2  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc7090398b7  12f7  4c89a558ffffff       REX.W movq [rbp-0xa8],r12
0xc7090398be  12fe  4c898d48ffffff       REX.W movq [rbp-0xb8],r9
0xc7090398c5  1305  4889b550ffffff       REX.W movq [rbp-0xb0],rsi
0xc7090398cc  130c  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0xc7090398d3  1313  e8f86bedff           call 0xc708f104d0  (jump table)
0xc7090398d8  1318  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc7090398dc  131c  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc7090398e0  1320  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xc7090398e5  1325  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xc7090398ed  132d  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xc7090398f5  1335  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xc7090398fd  133d  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc709039902  1342  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc709039907  1347  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc70903990f  134f  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039917  1357  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc70903991f  135f  448bb510ffffff       movl r14,[rbp-0xf0]
0xc709039926  1366  448b8508ffffff       movl r8,[rbp-0xf8]
0xc70903992d  136d  8b9500ffffff         movl rdx,[rbp-0x100]
0xc709039933  1373  8b85f8feffff         movl rax,[rbp-0x108]
0xc709039939  1379  448ba558ffffff       movl r12,[rbp-0xa8]
0xc709039940  1380  448b8d48ffffff       movl r9,[rbp-0xb8]
0xc709039947  1387  488bb550ffffff       REX.W movq rsi,[rbp-0xb0]
0xc70903994e  138e  8b9d60ffffff         movl rbx,[rbp-0xa0]
0xc709039954  1394  e9a3f0ffff           jmp 0xc7090389fc  <+0x43c>
0xc709039959  1399  c441792ee4           vucomisd xmm12,xmm12
0xc70903995e  139e  0f8b07000000         jpo 0xc70903996b  <+0x13ab>
0xc709039964  13a4  33c9                 xorl rcx,rcx
0xc709039966  13a6  e940f2ffff           jmp 0xc709038bab  <+0x5eb>
0xc70903996b  13ab  c4c1782ed3           vucomiss xmm2,xmm11
0xc709039970  13b0  77f2                 ja 0xc709039964  <+0x13a4>
0xc709039972  13b2  b9ffffffff           movl rcx,0xffffffff
0xc709039977  13b7  e92ff2ffff           jmp 0xc709038bab  <+0x5eb>
0xc70903997c  13bc  c441792edb           vucomisd xmm11,xmm11
0xc709039981  13c1  0f8b08000000         jpo 0xc70903998f  <+0x13cf>
0xc709039987  13c7  4533c0               xorl r8,r8
0xc70903998a  13ca  e9f3f2ffff           jmp 0xc709038c82  <+0x6c2>
0xc70903998f  13cf  c4c1782ed2           vucomiss xmm2,xmm10
0xc709039994  13d4  77f1                 ja 0xc709039987  <+0x13c7>
0xc709039996  13d6  41b8ffffffff         movl r8,0xffffffff
0xc70903999c  13dc  e9e1f2ffff           jmp 0xc709038c82  <+0x6c2>
0xc7090399a1  13e1  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xc7090399a8  13e8  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc7090399ad  13ed  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc7090399b2  13f2  e8196bedff           call 0xc708f104d0  (jump table)
0xc7090399b7  13f7  8b5de0               movl rbx,[rbp-0x20]
0xc7090399ba  13fa  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc7090399be  13fe  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc7090399c2  1402  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xc7090399c7  1407  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xc7090399cf  140f  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xc7090399d7  1417  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xc7090399df  141f  448b8560ffffff       movl r8,[rbp-0xa0]
0xc7090399e6  1426  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc7090399eb  142b  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc7090399f0  1430  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc7090399f8  1438  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039a00  1440  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc709039a08  1448  8b9510ffffff         movl rdx,[rbp-0xf0]
0xc709039a0e  144e  8b8508ffffff         movl rax,[rbp-0xf8]
0xc709039a14  1454  448bb500ffffff       movl r14,[rbp-0x100]
0xc709039a1b  145b  448ba5f8feffff       movl r12,[rbp-0x108]
0xc709039a22  1462  448b9d48ffffff       movl r11,[rbp-0xb8]
0xc709039a29  1469  e95ff8ffff           jmp 0xc70903928d  <+0xccd>
0xc709039a2e  146e  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xc709039a35  1475  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc709039a3a  147a  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc709039a3f  147f  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0xc709039a46  1486  48898d50ffffff       REX.W movq [rbp-0xb0],rcx
0xc709039a4d  148d  e87e6aedff           call 0xc708f104d0  (jump table)
0xc709039a52  1492  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc709039a56  1496  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc709039a5a  149a  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xc709039a5f  149f  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xc709039a67  14a7  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xc709039a6f  14af  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xc709039a77  14b7  448b8560ffffff       movl r8,[rbp-0xa0]
0xc709039a7e  14be  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc709039a83  14c3  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc709039a88  14c8  8bb558ffffff         movl rsi,[rbp-0xa8]
0xc709039a8e  14ce  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc709039a96  14d6  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039a9e  14de  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc709039aa6  14e6  8b9510ffffff         movl rdx,[rbp-0xf0]
0xc709039aac  14ec  8b8508ffffff         movl rax,[rbp-0xf8]
0xc709039ab2  14f2  448bb500ffffff       movl r14,[rbp-0x100]
0xc709039ab9  14f9  448ba5f8feffff       movl r12,[rbp-0x108]
0xc709039ac0  1500  448b9d48ffffff       movl r11,[rbp-0xb8]
0xc709039ac7  1507  8b8d50ffffff         movl rcx,[rbp-0xb0]
0xc709039acd  150d  e92ef8ffff           jmp 0xc709039300  <+0xd40>
0xc709039ad2  1512  4c898560ffffff       REX.W movq [rbp-0xa0],r8
0xc709039ad9  1519  c57b1155b8           vmovsd [rbp-0x48],xmm10
0xc709039ade  151e  c57b115db0           vmovsd [rbp-0x50],xmm11
0xc709039ae3  1523  4889b558ffffff       REX.W movq [rbp-0xa8],rsi
0xc709039aea  152a  4c898d50ffffff       REX.W movq [rbp-0xb0],r9
0xc709039af1  1531  e8da69edff           call 0xc708f104d0  (jump table)
0xc709039af6  1536  488b7dd8             REX.W movq rdi,[rbp-0x28]
0xc709039afa  153a  c5e857d2             vxorps xmm2,xmm2,xmm2
0xc709039afe  153e  c57b104d80           vmovsd xmm9,[rbp-0x80]
0xc709039b03  1543  c5fb10bd78ffffff     vmovsd xmm7,[rbp-0x88]
0xc709039b0b  154b  c5fb10b570ffffff     vmovsd xmm6,[rbp-0x90]
0xc709039b13  1553  c57b108568ffffff     vmovsd xmm8,[rbp-0x98]
0xc709039b1b  155b  448b8560ffffff       movl r8,[rbp-0xa0]
0xc709039b22  1562  c57b1055b8           vmovsd xmm10,[rbp-0x48]
0xc709039b27  1567  c57b105db0           vmovsd xmm11,[rbp-0x50]
0xc709039b2c  156c  8bb558ffffff         movl rsi,[rbp-0xa8]
0xc709039b32  1572  c5fb108530ffffff     vmovsd xmm0,[rbp-0xd0]
0xc709039b3a  157a  c5fb10a528ffffff     vmovsd xmm4,[rbp-0xd8]
0xc709039b42  1582  c5fb109d20ffffff     vmovsd xmm3,[rbp-0xe0]
0xc709039b4a  158a  8b9510ffffff         movl rdx,[rbp-0xf0]
0xc709039b50  1590  8b8508ffffff         movl rax,[rbp-0xf8]
0xc709039b56  1596  448bb500ffffff       movl r14,[rbp-0x100]
0xc709039b5d  159d  448ba5f8feffff       movl r12,[rbp-0x108]
0xc709039b64  15a4  448b8d50ffffff       movl r9,[rbp-0xb0]
0xc709039b6b  15ab  448b9d48ffffff       movl r11,[rbp-0xb8]
0xc709039b72  15b2  e9def7ffff           jmp 0xc709039355  <+0xd95>
0xc709039b77  15b7  e88466edff           call 0xc708f10200  (jump table)
0xc709039b7c  15bc  e87f66edff           call 0xc708f10200  (jump table)
0xc709039b81  15c1  90                   nop
0xc709039b82  15c2  6690                 nop

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
0xc709038740    180  slots (sp->fp): 0000000000000000000000000000000000000000000000

RelocInfo (size = 39)
0xc70903873c  internal wasm call
0xc709039568  internal wasm call
0xc709039581  internal wasm call
0xc709039707  internal wasm call
0xc709039720  internal wasm call
0xc7090397b0  wasm stub call  (0xc708f104d0)
0xc7090397ec  wasm stub call  (0xc708f104d0)
0xc709039836  wasm stub call  (0xc708f104d0)
0xc7090398d4  wasm stub call  (0xc708f104d0)
0xc7090399b3  wasm stub call  (0xc708f104d0)
0xc709039a4e  wasm stub call  (0xc708f104d0)
0xc709039af2  wasm stub call  (0xc708f104d0)
0xc709039b78  wasm stub call  (0xc708f10200)
0xc709039b7d  wasm stub call  (0xc708f10200)
