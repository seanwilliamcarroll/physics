name: _RNvMNtNtCskbGeSEnUfEA_5swarm5flock6sortedNtB4_5Flock11step_sorted
index: 1468
kind: wasm function
compiler: TurboFan
Body (size = 10624 = 10600 + 24 padding)
Instructions (size = 10568)
0x290ee9ff21c0     0  55                   push rbp
0x290ee9ff21c1     1  4889e5               REX.W movq rbp,rsp
0x290ee9ff21c4     4  6a08                 push 0x8
0x290ee9ff21c6     6  56                   push rsi
0x290ee9ff21c7     7  4881ec00040000       REX.W subq rsp,0x400
0x290ee9ff21ce     e  4c8b5e1f             REX.W movq r11,[rsi+0x1f]
0x290ee9ff21d2    12  488945d8             REX.W movq [rbp-0x28],rax
0x290ee9ff21d6    16  4c895dc8             REX.W movq [rbp-0x38],r11
0x290ee9ff21da    1a  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff21de    1e  0f8607250000         jna 0x290ee9ff46eb  <+0x252b>
0x290ee9ff21e4    24  4c8b662f             REX.W movq r12,[rsi+0x2f]
0x290ee9ff21e8    28  458b3c24             movl r15,[r12]
0x290ee9ff21ec    2c  418d9fc0fdffff       leal rbx,[r15-0x240]
0x290ee9ff21f3    33  41891c24             movl [r12],rbx
0x290ee9ff21f7    37  448bf8               movl r15,rax
0x290ee9ff21fa    3a  4d8db390000000       REX.W leaq r14,[r11+0x90]
0x290ee9ff2201    41  c4817b10043e         vmovsd xmm0,[r14+r15*1]
0x290ee9ff2207    47  c5fa16d0             vmovshdup xmm2,xmm0
0x290ee9ff220b    4b  41ba0000803a         movl r10,0x3a800000
0x290ee9ff2211    51  c4c1796eda           vmovd xmm3,r10
0x290ee9ff2216    56  c5ea59e3             vmulss xmm4,xmm2,xmm3
0x290ee9ff221a    5a  c5f828c8             vmovaps xmm1,xmm0
0x290ee9ff221e    5e  c5e259d9             vmulss xmm3,xmm3,xmm1
0x290ee9ff2222    62  c4817a10ac3ba0000000 vmovss xmm5,[r11+r15*1+0xa0]
0x290ee9ff222c    6c  4c8965e8             REX.W movq [rbp-0x18],r12
0x290ee9ff2230    70  48895de0             REX.W movq [rbp-0x20],rbx
0x290ee9ff2234    74  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x290ee9ff223b    7b  c5fb115580           vmovsd [rbp-0x80],xmm2
0x290ee9ff2240    80  c5fb114d88           vmovsd [rbp-0x78],xmm1
0x290ee9ff2245    85  c5f82eed             vucomiss xmm5,xmm5
0x290ee9ff2249    89  7a06                 jpe 0x290ee9ff2251  <+0x91>
0x290ee9ff224b    8b  0f8404000000         jz 0x290ee9ff2255  <+0x95>
0x290ee9ff2251    91  c5f928eb             vmovapd xmm5,xmm3
0x290ee9ff2255    95  c5f82edb             vucomiss xmm3,xmm3
0x290ee9ff2259    99  7a06                 jpe 0x290ee9ff2261  <+0xa1>
0x290ee9ff225b    9b  0f8404000000         jz 0x290ee9ff2265  <+0xa5>
0x290ee9ff2261    a1  c5f928dd             vmovapd xmm3,xmm5
0x290ee9ff2265    a5  c5f82eeb             vucomiss xmm5,xmm3
0x290ee9ff2269    a9  0f8704000000         ja 0x290ee9ff2273  <+0xb3>
0x290ee9ff226f    af  c5f928eb             vmovapd xmm5,xmm3
0x290ee9ff2273    b3  c5f82eed             vucomiss xmm5,xmm5
0x290ee9ff2277    b7  7a06                 jpe 0x290ee9ff227f  <+0xbf>
0x290ee9ff2279    b9  0f8409000000         jz 0x290ee9ff2288  <+0xc8>
0x290ee9ff227f    bf  c5f928dc             vmovapd xmm3,xmm4
0x290ee9ff2283    c3  e904000000           jmp 0x290ee9ff228c  <+0xcc>
0x290ee9ff2288    c8  c5f928dd             vmovapd xmm3,xmm5
0x290ee9ff228c    cc  c5f82ee4             vucomiss xmm4,xmm4
0x290ee9ff2290    d0  7a06                 jpe 0x290ee9ff2298  <+0xd8>
0x290ee9ff2292    d2  0f8404000000         jz 0x290ee9ff229c  <+0xdc>
0x290ee9ff2298    d8  c5f928e3             vmovapd xmm4,xmm3
0x290ee9ff229c    dc  c5f82edc             vucomiss xmm3,xmm4
0x290ee9ff22a0    e0  0f8704000000         ja 0x290ee9ff22aa  <+0xea>
0x290ee9ff22a6    e6  c5f928dc             vmovapd xmm3,xmm4
0x290ee9ff22aa    ea  41ba0020803f         movl r10,0x3f802000
0x290ee9ff22b0    f0  c4c1796ee2           vmovd xmm4,r10
0x290ee9ff22b5    f5  c5da59db             vmulss xmm3,xmm4,xmm3
0x290ee9ff22b9    f9  c5d976e4             vpcmpeqd xmm4,xmm4,xmm4
0x290ee9ff22bd    fd  c5d972f419           vpslld xmm4,xmm4,25
0x290ee9ff22c2   102  c5d972d402           vpsrld xmm4,xmm4,2
0x290ee9ff22c7   107  c5da5edb             vdivss xmm3,xmm4,xmm3
0x290ee9ff22cb   10b  c5f828db             vmovaps xmm3,xmm3
0x290ee9ff22cf   10f  c4817a119c3b84000000 vmovss [r11+r15*1+0x84],xmm3
0x290ee9ff22d9   119  c4e27918eb           vbroadcastss xmm5,xmm3
0x290ee9ff22de   11e  c5f859c5             vmulps xmm0,xmm0,xmm5
0x290ee9ff22e2   122  c4e37908c00a         vroundps xmm0,xmm0,0xa
0x290ee9ff22e8   128  c5f828e8             vmovaps xmm5,xmm0
0x290ee9ff22ec   12c  c5d25af5             vcvtss2sd xmm6,xmm5,xmm5
0x290ee9ff22f0   130  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x290ee9ff22f6   136  c57b2cf7             vcvttsd2si r14,xmm7
0x290ee9ff22fa   13a  4585f6               testl r14,r14
0x290ee9ff22fd   13d  0f892a000000         jns 0x290ee9ff232d  <+0x16d>
0x290ee9ff2303   143  49ba000000000000e0c1 REX.W movq r10,0xc1e0000000000000
0x290ee9ff230d   14d  c441f96efa           vmovq xmm15,r10
0x290ee9ff2312   152  c50358ff             vaddsd xmm15,xmm15,xmm7
0x290ee9ff2316   156  c4417b2cf7           vcvttsd2si r14,xmm15
0x290ee9ff231b   15b  4585f6               testl r14,r14
0x290ee9ff231e   15e  0f8809000000         js 0x290ee9ff232d  <+0x16d>
0x290ee9ff2324   164  41ba00000080         movl r10,0x80000000
0x290ee9ff232a   16a  450bf2               orl r14,r10
0x290ee9ff232d   16d  458bd6               movl r10,r14
0x290ee9ff2330   170  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x290ee9ff2335   175  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff233d   17d  c5792ec7             vucomisd xmm8,xmm7
0x290ee9ff2341   181  0f8ab9230000         jpe 0x290ee9ff4700  <+0x2540>
0x290ee9ff2347   187  0f85b3230000         jnz 0x290ee9ff4700  <+0x2540>
0x290ee9ff234d   18d  c4c1796eee           vmovd xmm5,r14
0x290ee9ff2352   192  c5f970ed00           vpshufd xmm5,xmm5,0x0
0x290ee9ff2357   197  c5fa16f0             vmovshdup xmm6,xmm0
0x290ee9ff235b   19b  c5ca5afe             vcvtss2sd xmm7,xmm6,xmm6
0x290ee9ff235f   19f  c463390bc70b         vroundsd xmm8,xmm8,xmm7,0xb
0x290ee9ff2365   1a5  c4417b2cf0           vcvttsd2si r14,xmm8
0x290ee9ff236a   1aa  4585f6               testl r14,r14
0x290ee9ff236d   1ad  0f8928000000         jns 0x290ee9ff239b  <+0x1db>
0x290ee9ff2373   1b3  4c8b158bffffff       REX.W movq r10,[rip+0xffffff8b]
0x290ee9ff237a   1ba  c441f96efa           vmovq xmm15,r10
0x290ee9ff237f   1bf  c4410358f8           vaddsd xmm15,xmm15,xmm8
0x290ee9ff2384   1c4  c4417b2cf7           vcvttsd2si r14,xmm15
0x290ee9ff2389   1c9  4585f6               testl r14,r14
0x290ee9ff238c   1cc  0f8809000000         js 0x290ee9ff239b  <+0x1db>
0x290ee9ff2392   1d2  41ba00000080         movl r10,0x80000000
0x290ee9ff2398   1d8  450bf2               orl r14,r10
0x290ee9ff239b   1db  458bd6               movl r10,r14
0x290ee9ff239e   1de  c441832aca           vcvtqsi2sd xmm9,xmm15,r10
0x290ee9ff23a3   1e3  c441792ec8           vucomisd xmm9,xmm8
0x290ee9ff23a8   1e8  0f8a87230000         jpe 0x290ee9ff4735  <+0x2575>
0x290ee9ff23ae   1ee  0f8581230000         jnz 0x290ee9ff4735  <+0x2575>
0x290ee9ff23b4   1f4  c4c35122ee01         vpinsrd xmm5,xmm5,r14,0x1
0x290ee9ff23ba   1fa  49ba0100000001000000 REX.W movq r10,0x100000001
0x290ee9ff23c4   204  c4c1f96ef2           vmovq xmm6,r10
0x290ee9ff23c9   209  c5c96cf6             vpunpcklqdq xmm6,xmm6,xmm6
0x290ee9ff23cd   20d  c4e2513fee           vpmaxud xmm5,xmm5,xmm6
0x290ee9ff23d2   212  c5c1efff             vpxor xmm7,xmm7,xmm7
0x290ee9ff23d6   216  c540c2c002           vcmpps xmm8,xmm7,xmm0, (le)
0x290ee9ff23db   21b  49ba0000804f0000804f REX.W movq r10,0x4f8000004f800000
0x290ee9ff23e5   225  c441f96eca           vmovq xmm9,r10
0x290ee9ff23ea   22a  c441316cc9           vpunpcklqdq xmm9,xmm9,xmm9
0x290ee9ff23ef   22f  c4c178c2c101         vcmpps xmm0,xmm0,xmm9, (lt)
0x290ee9ff23f5   235  c5b9dbc0             vpand xmm0,xmm8,xmm0
0x290ee9ff23f9   239  c579dffe             vpandn xmm15,xmm0,xmm6
0x290ee9ff23fd   23d  c5d1dbc0             vpand xmm0,xmm5,xmm0
0x290ee9ff2401   241  c4c179ebc7           vpor xmm0,xmm0,xmm15
0x290ee9ff2406   246  4d8db388000000       REX.W leaq r14,[r11+0x88]
0x290ee9ff240d   24d  c4817813043e         vmovlps [r14+r15*1],xmm0
0x290ee9ff2413   253  478bb43bcc000000     movl r14,[r11+r15*1+0xcc]
0x290ee9ff241b   25b  4589741b38           movl [r11+rbx*1+0x38],r14
0x290ee9ff2420   260  4f8bb43bc4000000     REX.W movq r14,[r11+r15*1+0xc4]
0x290ee9ff2428   268  4d89741b30           REX.W movq [r11+rbx*1+0x30],r14
0x290ee9ff242d   26d  448d7060             leal r14,[rax+0x60]
0x290ee9ff2431   271  438b543b04           movl rdx,[r11+r15*1+0x4]
0x290ee9ff2436   276  438b4c3b08           movl rcx,[r11+r15*1+0x8]
0x290ee9ff243b   27b  438b7c3b10           movl rdi,[r11+r15*1+0x10]
0x290ee9ff2440   280  478b4c3b14           movl r9,[r11+r15*1+0x14]
0x290ee9ff2445   285  c5f811b580feffff     vmovups [rbp-0x180],xmm6
0x290ee9ff244d   28d  c5f811bd60fcffff     vmovups [rbp-0x3a0],xmm7
0x290ee9ff2455   295  418bc6               movl rax,r14
0x290ee9ff2458   298  8bdf                 movl rbx,rdi
0x290ee9ff245a   29a  e89968f2ff           call 0x290ee9f18cf8  (jump table)
0x290ee9ff245f   29f  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff2463   2a3  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff246a   2aa  43c744233800000000   movl [r11+r12*1+0x38],0x0
0x290ee9ff2473   2b3  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff2477   2b7  418d97a0000000       leal rdx,[r15+0xa0]
0x290ee9ff247e   2be  478b74237c           movl r14,[r11+r12*1+0x7c]
0x290ee9ff2483   2c3  438b842380000000     movl rax,[r11+r12*1+0x80]
0x290ee9ff248b   2cb  418d0486             leal rax,[r14+rax*4]
0x290ee9ff248f   2cf  438b5c2308           movl rbx,[r11+r12*1+0x8]
0x290ee9ff2494   2d4  438b4c2304           movl rcx,[r11+r12*1+0x4]
0x290ee9ff2499   2d9  418d7730             leal rsi,[r15+0x30]
0x290ee9ff249d   2dd  48895590             REX.W movq [rbp-0x70],rdx
0x290ee9ff24a1   2e1  4c8975a0             REX.W movq [rbp-0x60],r14
0x290ee9ff24a5   2e5  48898560ffffff       REX.W movq [rbp-0xa0],rax
0x290ee9ff24ac   2ec  48895dc0             REX.W movq [rbp-0x40],rbx
0x290ee9ff24b0   2f0  48894db8             REX.W movq [rbp-0x48],rcx
0x290ee9ff24b4   2f4  488975a8             REX.W movq [rbp-0x58],rsi
0x290ee9ff24b8   2f8  458bc6               movl r8,r14
0x290ee9ff24bb   2fb  33ff                 xorl rdi,rdi
0x290ee9ff24bd   2fd  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff24c5   305  660f1f840000000000   nop
0x290ee9ff24ce   30e  660f1f840000000000   nop
0x290ee9ff24d7   317  660f1f840000000000   nop
0x290ee9ff24e0   320  660f1f840000000000   nop
0x290ee9ff24e9   329  660f1f840000000000   nop
0x290ee9ff24f2   332  660f1f840000000000   nop
0x290ee9ff24fb   33b  0f1f440000           nop
0x290ee9ff2500   340  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff2504   344  0f8652220000         jna 0x290ee9ff475c  <+0x259c>
0x290ee9ff250a   34a  443b8560ffffff       cmpl r8,[rbp-0xa0]
0x290ee9ff2511   351  0f8422000000         jz 0x290ee9ff2539  <+0x379>
0x290ee9ff2517   357  478b0c03             movl r9,[r11+r8*1]
0x290ee9ff251b   35b  4183c004             addl r8,0x4
0x290ee9ff251f   35f  413bd9               cmpl rbx,r9
0x290ee9ff2522   362  76dc                 jna 0x290ee9ff2500  <+0x340>
0x290ee9ff2524   364  468d0c89             leal r9,[rcx+r9*4]
0x290ee9ff2528   368  c4817a101c0b         vmovss xmm3,[r11+r9*1]
0x290ee9ff252e   36e  41b901000000         movl r9,0x1
0x290ee9ff2534   374  e90a000000           jmp 0x290ee9ff2543  <+0x383>
0x290ee9ff2539   379  4533c9               xorl r9,r9
0x290ee9ff253c   37c  448b8560ffffff       movl r8,[rbp-0xa0]
0x290ee9ff2543   383  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff254b   38b  4c8945d0             REX.W movq [rbp-0x30],r8
0x290ee9ff254f   38f  4183f901             cmpl r9,0x1
0x290ee9ff2553   393  0f856f000000         jnz 0x290ee9ff25c8  <+0x408>
0x290ee9ff2559   399  478b4c2330           movl r9,[r11+r12*1+0x30]
0x290ee9ff255e   39e  43397c2330           cmpl [r11+r12*1+0x30],rdi
0x290ee9ff2563   3a3  0f8540000000         jnz 0x290ee9ff25a9  <+0x3e9>
0x290ee9ff2569   3a9  b901000000           movl rcx,0x1
0x290ee9ff256e   3ae  48897db0             REX.W movq [rbp-0x50],rdi
0x290ee9ff2572   3b2  8bc6                 movl rax,rsi
0x290ee9ff2574   3b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff2578   3b8  8bd7                 movl rdx,rdi
0x290ee9ff257a   3ba  4c8bc9               REX.W movq r9,rcx
0x290ee9ff257d   3bd  e87e67f2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff2582   3c2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff2586   3c6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff258d   3cd  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff2591   3d1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff2599   3d9  448b45d0             movl r8,[rbp-0x30]
0x290ee9ff259d   3dd  8b7db0               movl rdi,[rbp-0x50]
0x290ee9ff25a0   3e0  8b75a8               movl rsi,[rbp-0x58]
0x290ee9ff25a3   3e3  8b4db8               movl rcx,[rbp-0x48]
0x290ee9ff25a6   3e6  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff25a9   3e9  448d7701             leal r14,[rdi+0x1]
0x290ee9ff25ad   3ed  4789742338           movl [r11+r12*1+0x38],r14
0x290ee9ff25b2   3f2  438b442334           movl rax,[r11+r12*1+0x34]
0x290ee9ff25b7   3f7  8d04b8               leal rax,[rax+rdi*4]
0x290ee9ff25ba   3fa  c4c17a111c03         vmovss [r11+rax*1],xmm3
0x290ee9ff25c0   400  418bfe               movl rdi,r14
0x290ee9ff25c3   403  e938ffffff           jmp 0x290ee9ff2500  <+0x340>
0x290ee9ff25c8   408  43c744234400000000   movl [r11+r12*1+0x44],0x0
0x290ee9ff25d1   411  478b742314           movl r14,[r11+r12*1+0x14]
0x290ee9ff25d6   416  438b442310           movl rax,[r11+r12*1+0x10]
0x290ee9ff25db   41b  418d5f3c             leal rbx,[r15+0x3c]
0x290ee9ff25df   41f  4c8975b0             REX.W movq [rbp-0x50],r14
0x290ee9ff25e3   423  488945a8             REX.W movq [rbp-0x58],rax
0x290ee9ff25e7   427  48895dc0             REX.W movq [rbp-0x40],rbx
0x290ee9ff25eb   42b  8b4da0               movl rcx,[rbp-0x60]
0x290ee9ff25ee   42e  33d2                 xorl rdx,rdx
0x290ee9ff25f0   430  660f1f840000000000   nop
0x290ee9ff25f9   439  0f1f8000000000       nop
0x290ee9ff2600   440  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff2604   444  0f8693210000         jna 0x290ee9ff479d  <+0x25dd>
0x290ee9ff260a   44a  3b8d60ffffff         cmpl rcx,[rbp-0xa0]
0x290ee9ff2610   450  0f841f000000         jz 0x290ee9ff2635  <+0x475>
0x290ee9ff2616   456  418b340b             movl rsi,[r11+rcx*1]
0x290ee9ff261a   45a  83c104               addl rcx,0x4
0x290ee9ff261d   45d  443bf6               cmpl r14,rsi
0x290ee9ff2620   460  76de                 jna 0x290ee9ff2600  <+0x440>
0x290ee9ff2622   462  8d34b0               leal rsi,[rax+rsi*4]
0x290ee9ff2625   465  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x290ee9ff262b   46b  be01000000           movl rsi,0x1
0x290ee9ff2630   470  e908000000           jmp 0x290ee9ff263d  <+0x47d>
0x290ee9ff2635   475  33f6                 xorl rsi,rsi
0x290ee9ff2637   477  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x290ee9ff263d   47d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff2645   485  48894db8             REX.W movq [rbp-0x48],rcx
0x290ee9ff2649   489  83fe01               cmpl rsi,0x1
0x290ee9ff264c   48c  0f8568000000         jnz 0x290ee9ff26ba  <+0x4fa>
0x290ee9ff2652   492  438b74233c           movl rsi,[r11+r12*1+0x3c]
0x290ee9ff2657   497  433954233c           cmpl [r11+r12*1+0x3c],rdx
0x290ee9ff265c   49c  0f853b000000         jnz 0x290ee9ff269d  <+0x4dd>
0x290ee9ff2662   4a2  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff2666   4a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff266a   4aa  8bc3                 movl rax,rbx
0x290ee9ff266c   4ac  b901000000           movl rcx,0x1
0x290ee9ff2671   4b1  e88a66f2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff2676   4b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff267a   4ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff2681   4c1  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff2685   4c5  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff268d   4cd  8b4db8               movl rcx,[rbp-0x48]
0x290ee9ff2690   4d0  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff2693   4d3  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff2696   4d6  8b45a8               movl rax,[rbp-0x58]
0x290ee9ff2699   4d9  448b75b0             movl r14,[rbp-0x50]
0x290ee9ff269d   4dd  8d7201               leal rsi,[rdx+0x1]
0x290ee9ff26a0   4e0  4389742344           movl [r11+r12*1+0x44],rsi
0x290ee9ff26a5   4e5  438b7c2340           movl rdi,[r11+r12*1+0x40]
0x290ee9ff26aa   4ea  8d1497               leal rdx,[rdi+rdx*4]
0x290ee9ff26ad   4ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x290ee9ff26b3   4f3  8bd6                 movl rdx,rsi
0x290ee9ff26b5   4f5  e946ffffff           jmp 0x290ee9ff2600  <+0x440>
0x290ee9ff26ba   4fa  43c744235000000000   movl [r11+r12*1+0x50],0x0
0x290ee9ff26c3   503  478b742320           movl r14,[r11+r12*1+0x20]
0x290ee9ff26c8   508  438b44231c           movl rax,[r11+r12*1+0x1c]
0x290ee9ff26cd   50d  418d5f48             leal rbx,[r15+0x48]
0x290ee9ff26d1   511  4c897598             REX.W movq [rbp-0x68],r14
0x290ee9ff26d5   515  488945b8             REX.W movq [rbp-0x48],rax
0x290ee9ff26d9   519  48895dc0             REX.W movq [rbp-0x40],rbx
0x290ee9ff26dd   51d  8b4da0               movl rcx,[rbp-0x60]
0x290ee9ff26e0   520  33d2                 xorl rdx,rdx
0x290ee9ff26e2   522  660f1f840000000000   nop
0x290ee9ff26eb   52b  660f1f840000000000   nop
0x290ee9ff26f4   534  660f1f840000000000   nop
0x290ee9ff26fd   53d  0f1f00               nop
0x290ee9ff2700   540  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff2704   544  0f86d4200000         jna 0x290ee9ff47de  <+0x261e>
0x290ee9ff270a   54a  3b8d60ffffff         cmpl rcx,[rbp-0xa0]
0x290ee9ff2710   550  0f841f000000         jz 0x290ee9ff2735  <+0x575>
0x290ee9ff2716   556  418b340b             movl rsi,[r11+rcx*1]
0x290ee9ff271a   55a  83c104               addl rcx,0x4
0x290ee9ff271d   55d  443bf6               cmpl r14,rsi
0x290ee9ff2720   560  76de                 jna 0x290ee9ff2700  <+0x540>
0x290ee9ff2722   562  8d34b0               leal rsi,[rax+rsi*4]
0x290ee9ff2725   565  c4c17a101c33         vmovss xmm3,[r11+rsi*1]
0x290ee9ff272b   56b  be01000000           movl rsi,0x1
0x290ee9ff2730   570  e908000000           jmp 0x290ee9ff273d  <+0x57d>
0x290ee9ff2735   575  33f6                 xorl rsi,rsi
0x290ee9ff2737   577  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x290ee9ff273d   57d  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff2745   585  48894db0             REX.W movq [rbp-0x50],rcx
0x290ee9ff2749   589  83fe01               cmpl rsi,0x1
0x290ee9ff274c   58c  0f8568000000         jnz 0x290ee9ff27ba  <+0x5fa>
0x290ee9ff2752   592  438b742348           movl rsi,[r11+r12*1+0x48]
0x290ee9ff2757   597  4339542348           cmpl [r11+r12*1+0x48],rdx
0x290ee9ff275c   59c  0f853b000000         jnz 0x290ee9ff279d  <+0x5dd>
0x290ee9ff2762   5a2  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff2766   5a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff276a   5aa  8bc3                 movl rax,rbx
0x290ee9ff276c   5ac  b901000000           movl rcx,0x1
0x290ee9ff2771   5b1  e88a65f2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff2776   5b6  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff277a   5ba  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff2781   5c1  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff2789   5c9  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff278d   5cd  8b4db0               movl rcx,[rbp-0x50]
0x290ee9ff2790   5d0  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff2793   5d3  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff2796   5d6  8b45b8               movl rax,[rbp-0x48]
0x290ee9ff2799   5d9  448b7598             movl r14,[rbp-0x68]
0x290ee9ff279d   5dd  8d7201               leal rsi,[rdx+0x1]
0x290ee9ff27a0   5e0  4389742350           movl [r11+r12*1+0x50],rsi
0x290ee9ff27a5   5e5  438b7c234c           movl rdi,[r11+r12*1+0x4c]
0x290ee9ff27aa   5ea  8d1497               leal rdx,[rdi+rdx*4]
0x290ee9ff27ad   5ed  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x290ee9ff27b3   5f3  8bd6                 movl rdx,rsi
0x290ee9ff27b5   5f5  e946ffffff           jmp 0x290ee9ff2700  <+0x540>
0x290ee9ff27ba   5fa  43c744235c00000000   movl [r11+r12*1+0x5c],0x0
0x290ee9ff27c3   603  478b74232c           movl r14,[r11+r12*1+0x2c]
0x290ee9ff27c8   608  438b442328           movl rax,[r11+r12*1+0x28]
0x290ee9ff27cd   60d  4183c754             addl r15,0x54
0x290ee9ff27d1   611  4c8975b8             REX.W movq [rbp-0x48],r14
0x290ee9ff27d5   615  488945c0             REX.W movq [rbp-0x40],rax
0x290ee9ff27d9   619  4c897dd8             REX.W movq [rbp-0x28],r15
0x290ee9ff27dd   61d  33d2                 xorl rdx,rdx
0x290ee9ff27df   61f  8b5da0               movl rbx,[rbp-0x60]
0x290ee9ff27e2   622  660f1f840000000000   nop
0x290ee9ff27eb   62b  660f1f840000000000   nop
0x290ee9ff27f4   634  660f1f840000000000   nop
0x290ee9ff27fd   63d  0f1f00               nop
0x290ee9ff2800   640  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff2804   644  0f8615200000         jna 0x290ee9ff481f  <+0x265f>
0x290ee9ff280a   64a  3b9d60ffffff         cmpl rbx,[rbp-0xa0]
0x290ee9ff2810   650  0f841f000000         jz 0x290ee9ff2835  <+0x675>
0x290ee9ff2816   656  418b0c1b             movl rcx,[r11+rbx*1]
0x290ee9ff281a   65a  83c304               addl rbx,0x4
0x290ee9ff281d   65d  443bf1               cmpl r14,rcx
0x290ee9ff2820   660  76de                 jna 0x290ee9ff2800  <+0x640>
0x290ee9ff2822   662  8d0c88               leal rcx,[rax+rcx*4]
0x290ee9ff2825   665  c4c17a101c0b         vmovss xmm3,[r11+rcx*1]
0x290ee9ff282b   66b  b901000000           movl rcx,0x1
0x290ee9ff2830   670  e908000000           jmp 0x290ee9ff283d  <+0x67d>
0x290ee9ff2835   675  33c9                 xorl rcx,rcx
0x290ee9ff2837   677  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x290ee9ff283d   67d  48895da0             REX.W movq [rbp-0x60],rbx
0x290ee9ff2841   681  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff2849   689  83f901               cmpl rcx,0x1
0x290ee9ff284c   68c  0f8566000000         jnz 0x290ee9ff28b8  <+0x6f8>
0x290ee9ff2852   692  438b4c2354           movl rcx,[r11+r12*1+0x54]
0x290ee9ff2857   697  4339542354           cmpl [r11+r12*1+0x54],rdx
0x290ee9ff285c   69c  0f8539000000         jnz 0x290ee9ff289b  <+0x6db>
0x290ee9ff2862   6a2  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff2866   6a6  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff286a   6aa  418bc7               movl rax,r15
0x290ee9ff286d   6ad  b901000000           movl rcx,0x1
0x290ee9ff2872   6b2  e88964f2ff           call 0x290ee9f18d00  (jump table)
0x290ee9ff2877   6b7  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff287b   6bb  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff2882   6c2  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff2885   6c5  8b5da0               movl rbx,[rbp-0x60]
0x290ee9ff2888   6c8  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff2890   6d0  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff2894   6d4  8b45c0               movl rax,[rbp-0x40]
0x290ee9ff2897   6d7  448b75b8             movl r14,[rbp-0x48]
0x290ee9ff289b   6db  8d4a01               leal rcx,[rdx+0x1]
0x290ee9ff289e   6de  43894c235c           movl [r11+r12*1+0x5c],rcx
0x290ee9ff28a3   6e3  438b742358           movl rsi,[r11+r12*1+0x58]
0x290ee9ff28a8   6e8  8d1496               leal rdx,[rsi+rdx*4]
0x290ee9ff28ab   6eb  c4c17a111c13         vmovss [r11+rdx*1],xmm3
0x290ee9ff28b1   6f1  8bd1                 movl rdx,rcx
0x290ee9ff28b3   6f3  e948ffffff           jmp 0x290ee9ff2800  <+0x640>
0x290ee9ff28b8   6f8  478b7c2338           movl r15,[r11+r12*1+0x38]
0x290ee9ff28bd   6fd  c4817a6f442330       vmovdqu xmm0,[r11+r12*1+0x30]
0x290ee9ff28c4   704  c4817a6f1c23         vmovdqu xmm3,[r11+r12*1]
0x290ee9ff28ca   70a  c4817a7f5c2330       vmovdqu [r11+r12*1+0x30],xmm3
0x290ee9ff28d1   711  c4817a7f0423         vmovdqu [r11+r12*1],xmm0
0x290ee9ff28d7   717  c4817a6f442340       vmovdqu xmm0,[r11+r12*1+0x40]
0x290ee9ff28de   71e  c4817a6f642310       vmovdqu xmm4,[r11+r12*1+0x10]
0x290ee9ff28e5   725  c4817a7f642340       vmovdqu [r11+r12*1+0x40],xmm4
0x290ee9ff28ec   72c  478b742310           movl r14,[r11+r12*1+0x10]
0x290ee9ff28f1   731  c4817a7f442310       vmovdqu [r11+r12*1+0x10],xmm0
0x290ee9ff28f8   738  4b8b442354           REX.W movq rax,[r11+r12*1+0x54]
0x290ee9ff28fd   73d  438b5c2350           movl rbx,[r11+r12*1+0x50]
0x290ee9ff2902   742  c4817a6f442320       vmovdqu xmm0,[r11+r12*1+0x20]
0x290ee9ff2909   749  c4817a7f442350       vmovdqu [r11+r12*1+0x50],xmm0
0x290ee9ff2910   750  438954232c           movl [r11+r12*1+0x2c],rdx
0x290ee9ff2915   755  438b542320           movl rdx,[r11+r12*1+0x20]
0x290ee9ff291a   75a  43895c2320           movl [r11+r12*1+0x20],rbx
0x290ee9ff291f   75f  4b89442324           REX.W movq [r11+r12*1+0x24],rax
0x290ee9ff2924   764  4c897dd8             REX.W movq [rbp-0x28],r15
0x290ee9ff2928   768  4c8975b0             REX.W movq [rbp-0x50],r14
0x290ee9ff292c   76c  4585ff               testl r15,r15
0x290ee9ff292f   76f  0f8516000000         jnz 0x290ee9ff294b  <+0x78b>
0x290ee9ff2935   775  8b5de0               movl rbx,[rbp-0x20]
0x290ee9ff2938   778  448d9b40020000       leal r11,[rbx+0x240]
0x290ee9ff293f   77f  488b45e8             REX.W movq rax,[rbp-0x18]
0x290ee9ff2943   783  448918               movl [rax],r11
0x290ee9ff2946   786  488be5               REX.W movq rsp,rbp
0x290ee9ff2949   789  5d                   pop rbp
0x290ee9ff294a   78a  c3                   retl
0x290ee9ff294b   78b  c4e37916c002         vpextrd rax,xmm0,0x2
0x290ee9ff2951   791  c4e37916e303         vpextrd rbx,xmm4,0x3
0x290ee9ff2957   797  c4e37916d901         vpextrd rcx,xmm3,0x1
0x290ee9ff295d   79d  c4e37916c603         vpextrd rsi,xmm0,0x3
0x290ee9ff2963   7a3  c4e37916e701         vpextrd rdi,xmm4,0x1
0x290ee9ff2969   7a9  c4c37916d802         vpextrd r8,xmm3,0x2
0x290ee9ff296f   7af  458bc8               movl r9,r8
0x290ee9ff2972   7b2  413bf8               cmpl rdi,r8
0x290ee9ff2975   7b5  440f42cf             cmovcl r9,rdi
0x290ee9ff2979   7b9  418bf9               movl rdi,r9
0x290ee9ff297c   7bc  413bd1               cmpl rdx,r9
0x290ee9ff297f   7bf  0f42fa               cmovcl rdi,rdx
0x290ee9ff2982   7c2  8bd7                 movl rdx,rdi
0x290ee9ff2984   7c4  3bf7                 cmpl rsi,rdi
0x290ee9ff2986   7c6  0f42d6               cmovcl rdx,rsi
0x290ee9ff2989   7c9  c4817a108423a4000000 vmovss xmm0,[r11+r12*1+0xa4]
0x290ee9ff2993   7d3  c5fa59c0             vmulss xmm0,xmm0,xmm0
0x290ee9ff2997   7d7  c4e27918d8           vbroadcastss xmm3,xmm0
0x290ee9ff299c   7dc  c4817a10a423a0000000 vmovss xmm4,[r11+r12*1+0xa0]
0x290ee9ff29a6   7e6  c5da59e4             vmulss xmm4,xmm4,xmm4
0x290ee9ff29aa   7ea  c4e27918ec           vbroadcastss xmm5,xmm4
0x290ee9ff29af   7ef  488945c0             REX.W movq [rbp-0x40],rax
0x290ee9ff29b3   7f3  48895db8             REX.W movq [rbp-0x48],rbx
0x290ee9ff29b7   7f7  48894da8             REX.W movq [rbp-0x58],rcx
0x290ee9ff29bb   7fb  488955a0             REX.W movq [rbp-0x60],rdx
0x290ee9ff29bf   7ff  c5fb118508ffffff     vmovsd [rbp-0xf8],xmm0
0x290ee9ff29c7   807  c5f8119d60feffff     vmovups [rbp-0x1a0],xmm3
0x290ee9ff29cf   80f  c5fb11a510ffffff     vmovsd [rbp-0xf0],xmm4
0x290ee9ff29d7   817  c5f811ad70feffff     vmovups [rbp-0x190],xmm5
0x290ee9ff29df   81f  33ff                 xorl rdi,rdi
0x290ee9ff29e1   821  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x290ee9ff29e6   826  c4c13972f019         vpslld xmm8,xmm8,25
0x290ee9ff29ec   82c  c4c13972d002         vpsrld xmm8,xmm8,2
0x290ee9ff29f2   832  c5c857f6             vxorps xmm6,xmm6,xmm6
0x290ee9ff29f6   836  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x290ee9ff29fe   83e  488bf7               REX.W movq rsi,rdi
0x290ee9ff2a01   841  660f1f840000000000   nop
0x290ee9ff2a0a   84a  660f1f840000000000   nop
0x290ee9ff2a13   853  660f1f840000000000   nop
0x290ee9ff2a1c   85c  660f1f840000000000   nop
0x290ee9ff2a25   865  660f1f840000000000   nop
0x290ee9ff2a2e   86e  660f1f840000000000   nop
0x290ee9ff2a37   877  660f1f840000000000   nop
0x290ee9ff2a40   880  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff2a44   884  0f86131e0000         jna 0x290ee9ff485d  <+0x269d>
0x290ee9ff2a4a   88a  478b442308           movl r8,[r11+r12*1+0x8]
0x290ee9ff2a4f   88f  4c8985f0fdffff       REX.W movq [rbp-0x210],r8
0x290ee9ff2a56   896  443bc6               cmpl r8,rsi
0x290ee9ff2a59   899  0f86641c0000         jna 0x290ee9ff46c3  <+0x2503>
0x290ee9ff2a5f   89f  478b4c2314           movl r9,[r11+r12*1+0x14]
0x290ee9ff2a64   8a4  4c898da0fcffff       REX.W movq [rbp-0x360],r9
0x290ee9ff2a6b   8ab  443bce               cmpl r9,rsi
0x290ee9ff2a6e   8ae  0f864f1c0000         jna 0x290ee9ff46c3  <+0x2503>
0x290ee9ff2a74   8b4  478b7c2320           movl r15,[r11+r12*1+0x20]
0x290ee9ff2a79   8b9  4c89bd98fcffff       REX.W movq [rbp-0x368],r15
0x290ee9ff2a80   8c0  443bfe               cmpl r15,rsi
0x290ee9ff2a83   8c3  0f863a1c0000         jna 0x290ee9ff46c3  <+0x2503>
0x290ee9ff2a89   8c9  478b7c232c           movl r15,[r11+r12*1+0x2c]
0x290ee9ff2a8e   8ce  4c89bda8fcffff       REX.W movq [rbp-0x358],r15
0x290ee9ff2a95   8d5  443bfe               cmpl r15,rsi
0x290ee9ff2a98   8d8  0f86251c0000         jna 0x290ee9ff46c3  <+0x2503>
0x290ee9ff2a9e   8de  478b7c2304           movl r15,[r11+r12*1+0x4]
0x290ee9ff2aa3   8e3  458d34b7             leal r14,[r15+rsi*4]
0x290ee9ff2aa7   8e7  c4017a100c33         vmovss xmm9,[r11+r14*1]
0x290ee9ff2aad   8ed  478b742310           movl r14,[r11+r12*1+0x10]
0x290ee9ff2ab2   8f2  4c89bd00feffff       REX.W movq [rbp-0x200],r15
0x290ee9ff2ab9   8f9  458d3cb6             leal r15,[r14+rsi*4]
0x290ee9ff2abd   8fd  c4017a10143b         vmovss xmm10,[r11+r15*1]
0x290ee9ff2ac3   903  478b7c231c           movl r15,[r11+r12*1+0x1c]
0x290ee9ff2ac8   908  4c89b508feffff       REX.W movq [rbp-0x1f8],r14
0x290ee9ff2acf   90f  458d34b7             leal r14,[r15+rsi*4]
0x290ee9ff2ad3   913  c4017a101c33         vmovss xmm11,[r11+r14*1]
0x290ee9ff2ad9   919  478b742328           movl r14,[r11+r12*1+0x28]
0x290ee9ff2ade   91e  4c89bd18feffff       REX.W movq [rbp-0x1e8],r15
0x290ee9ff2ae5   925  458d3cb6             leal r15,[r14+rsi*4]
0x290ee9ff2ae9   929  4c89b510feffff       REX.W movq [rbp-0x1f0],r14
0x290ee9ff2af0   930  c4017a10243b         vmovss xmm12,[r11+r15*1]
0x290ee9ff2af6   936  448b75e0             movl r14,[rbp-0x20]
0x290ee9ff2afa   93a  c4017a1164330c       vmovss [r11+r14*1+0xc],xmm12
0x290ee9ff2b01   941  c4017a115c3308       vmovss [r11+r14*1+0x8],xmm11
0x290ee9ff2b08   948  c4017a11543304       vmovss [r11+r14*1+0x4],xmm10
0x290ee9ff2b0f   94f  c4017a110c33         vmovss [r11+r14*1],xmm9
0x290ee9ff2b15   955  43c744332800000000   movl [r11+r14*1+0x28],0x0
0x290ee9ff2b1e   95e  4bc744332000000000   REX.W movq [r11+r14*1+0x20],0x0
0x290ee9ff2b27   967  c44121efdb           vpxor xmm11,xmm11,xmm11
0x290ee9ff2b2c   96c  c4017a7f5c3310       vmovdqu [r11+r14*1+0x10],xmm11
0x290ee9ff2b33   973  478bbc2388000000     movl r15,[r11+r12*1+0x88]
0x290ee9ff2b3b   97b  4c89bd70fcffff       REX.W movq [rbp-0x390],r15
0x290ee9ff2b42   982  478bbc238c000000     movl r15,[r11+r12*1+0x8c]
0x290ee9ff2b4a   98a  c4017a109c2384000000 vmovss xmm11,[r11+r12*1+0x84]
0x290ee9ff2b54   994  458d9e80000000       leal r11,[r14+0x80]
0x290ee9ff2b5b   99b  4989e2               REX.W movq r10,rsp
0x290ee9ff2b5e   99e  4883ec08             REX.W subq rsp,0x8
0x290ee9ff2b62   9a2  4883e4f0             REX.W andq rsp,0xf0
0x290ee9ff2b66   9a6  4c891424             REX.W movq [rsp],r10
0x290ee9ff2b6a   9aa  488975d0             REX.W movq [rbp-0x30],rsi
0x290ee9ff2b6e   9ae  c57b118df8feffff     vmovsd [rbp-0x108],xmm9
0x290ee9ff2b76   9b6  c57b119500ffffff     vmovsd [rbp-0x100],xmm10
0x290ee9ff2b7e   9be  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x290ee9ff2b85   9c5  c57b119d78ffffff     vmovsd [rbp-0x88],xmm11
0x290ee9ff2b8d   9cd  4c895d98             REX.W movq [rbp-0x68],r11
0x290ee9ff2b91   9d1  488bf7               REX.W movq rsi,rdi
0x290ee9ff2b94   9d4  488bcf               REX.W movq rcx,rdi
0x290ee9ff2b97   9d7  488b7df0             REX.W movq rdi,[rbp-0x10]
0x290ee9ff2b9b   9db  418bd3               movl rdx,r11
0x290ee9ff2b9e   9de  41b8c0010000         movl r8,0x1c0
0x290ee9ff2ba4   9e4  48b8f0f2930100000000 REX.W movq rax,0x193f2f0
0x290ee9ff2bae   9ee  4c8d1510000000       REX.W leaq r10,[rip+0x10]
0x290ee9ff2bb5   9f5  4d8995a0000000       REX.W movq [r13+0xa0],r10
0x290ee9ff2bbc   9fc  4989ada8000000       REX.W movq [r13+0xa8],rbp
0x290ee9ff2bc3   a03  ffd0                 call rax
0x290ee9ff2bc5   a05  49c785a800000000000000 REX.W movq [r13+0xa8],0x0
0x290ee9ff2bd0   a10  488b2424             REX.W movq rsp,[rsp]
0x290ee9ff2bd4   a14  85c0                 testl rax,rax
0x290ee9ff2bd6   a16  0f84261f0000         jz 0x290ee9ff4b02  <+0x2942>
0x290ee9ff2bdc   a1c  4533db               xorl r11,r11
0x290ee9ff2bdf   a1f  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x290ee9ff2be6   a26  410f95c3             setnzl r11l
0x290ee9ff2bea   a2a  448ba568ffffff       movl r12,[rbp-0x98]
0x290ee9ff2bf1   a31  452be3               subl r12,r11
0x290ee9ff2bf4   a34  c5fb108500ffffff     vmovsd xmm0,[rbp-0x100]
0x290ee9ff2bfc   a3c  c5fa599d78ffffff     vmulss xmm3,xmm0,[rbp-0x88]
0x290ee9ff2c04   a44  c5f82edb             vucomiss xmm3,xmm3
0x290ee9ff2c08   a48  7a06                 jpe 0x290ee9ff2c10  <+0xa50>
0x290ee9ff2c0a   a4a  0f8404000000         jz 0x290ee9ff2c14  <+0xa54>
0x290ee9ff2c10   a50  c5e057db             vxorps xmm3,xmm3,xmm3
0x290ee9ff2c14   a54  c5d857e4             vxorps xmm4,xmm4,xmm4
0x290ee9ff2c18   a58  c5f82edc             vucomiss xmm3,xmm4
0x290ee9ff2c1c   a5c  0f8704000000         ja 0x290ee9ff2c26  <+0xa66>
0x290ee9ff2c22   a62  c5f928dc             vmovapd xmm3,xmm4
0x290ee9ff2c26   a66  c5e25aeb             vcvtss2sd xmm5,xmm3,xmm3
0x290ee9ff2c2a   a6a  c4e3490bf50b         vroundsd xmm6,xmm6,xmm5,0xb
0x290ee9ff2c30   a70  c57b2cde             vcvttsd2si r11,xmm6
0x290ee9ff2c34   a74  4585db               testl r11,r11
0x290ee9ff2c37   a77  0f8927000000         jns 0x290ee9ff2c64  <+0xaa4>
0x290ee9ff2c3d   a7d  4c8b15c1f6ffff       REX.W movq r10,[rip+0xfffff6c1]
0x290ee9ff2c44   a84  c441f96efa           vmovq xmm15,r10
0x290ee9ff2c49   a89  c50358fe             vaddsd xmm15,xmm15,xmm6
0x290ee9ff2c4d   a8d  c4417b2cdf           vcvttsd2si r11,xmm15
0x290ee9ff2c52   a92  4585db               testl r11,r11
0x290ee9ff2c55   a95  0f8809000000         js 0x290ee9ff2c64  <+0xaa4>
0x290ee9ff2c5b   a9b  41ba00000080         movl r10,0x80000000
0x290ee9ff2c61   aa1  450bda               orl r11,r10
0x290ee9ff2c64   aa4  458bd3               movl r10,r11
0x290ee9ff2c67   aa7  c4c1832afa           vcvtqsi2sd xmm7,xmm15,r10
0x290ee9ff2c6c   aac  c5f92efe             vucomisd xmm7,xmm6
0x290ee9ff2c70   ab0  0f8a4e1c0000         jpe 0x290ee9ff48c4  <+0x2704>
0x290ee9ff2c76   ab6  0f85481c0000         jnz 0x290ee9ff48c4  <+0x2704>
0x290ee9ff2c7c   abc  458bfb               movl r15,r11
0x290ee9ff2c7f   abf  453be3               cmpl r12,r11
0x290ee9ff2c82   ac2  450f42fc             cmovcl r15,r12
0x290ee9ff2c86   ac6  41ba0000804f         movl r10,0x4f800000
0x290ee9ff2c8c   acc  c4c1796eea           vmovd xmm5,r10
0x290ee9ff2c91   ad1  4533db               xorl r11,r11
0x290ee9ff2c94   ad4  c5f82eeb             vucomiss xmm5,xmm3
0x290ee9ff2c98   ad8  450f47df             cmoval r11,r15
0x290ee9ff2c9c   adc  4533ff               xorl r15,r15
0x290ee9ff2c9f   adf  4585db               testl r11,r11
0x290ee9ff2ca2   ae2  410f95c7             setnzl r15l
0x290ee9ff2ca6   ae6  458bf3               movl r14,r11
0x290ee9ff2ca9   ae9  452bf7               subl r14,r15
0x290ee9ff2cac   aec  4183c301             addl r11,0x1
0x290ee9ff2cb0   af0  458bfb               movl r15,r11
0x290ee9ff2cb3   af3  453be3               cmpl r12,r11
0x290ee9ff2cb6   af6  450f42fc             cmovcl r15,r12
0x290ee9ff2cba   afa  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x290ee9ff2cc1   b01  453bfe               cmpl r15,r14
0x290ee9ff2cc4   b04  0f828f180000         jc 0x290ee9ff4559  <+0x2399>
0x290ee9ff2cca   b0a  4533db               xorl r11,r11
0x290ee9ff2ccd   b0d  83bd70fcffff00       cmpl [rbp-0x390],0x0
0x290ee9ff2cd4   b14  410f95c3             setnzl r11l
0x290ee9ff2cd8   b18  448ba570fcffff       movl r12,[rbp-0x390]
0x290ee9ff2cdf   b1f  452be3               subl r12,r11
0x290ee9ff2ce2   b22  c5fb109d78ffffff     vmovsd xmm3,[rbp-0x88]
0x290ee9ff2cea   b2a  c5e2599df8feffff     vmulss xmm3,xmm3,[rbp-0x108]
0x290ee9ff2cf2   b32  c5f82edb             vucomiss xmm3,xmm3
0x290ee9ff2cf6   b36  7a06                 jpe 0x290ee9ff2cfe  <+0xb3e>
0x290ee9ff2cf8   b38  0f8404000000         jz 0x290ee9ff2d02  <+0xb42>
0x290ee9ff2cfe   b3e  c5f928dc             vmovapd xmm3,xmm4
0x290ee9ff2d02   b42  c5f82edc             vucomiss xmm3,xmm4
0x290ee9ff2d06   b46  0f8704000000         ja 0x290ee9ff2d10  <+0xb50>
0x290ee9ff2d0c   b4c  c5f928dc             vmovapd xmm3,xmm4
0x290ee9ff2d10   b50  c5e25af3             vcvtss2sd xmm6,xmm3,xmm3
0x290ee9ff2d14   b54  c4e3410bfe0b         vroundsd xmm7,xmm7,xmm6,0xb
0x290ee9ff2d1a   b5a  c57b2cdf             vcvttsd2si r11,xmm7
0x290ee9ff2d1e   b5e  4585db               testl r11,r11
0x290ee9ff2d21   b61  0f8927000000         jns 0x290ee9ff2d4e  <+0xb8e>
0x290ee9ff2d27   b67  4c8b15d7f5ffff       REX.W movq r10,[rip+0xfffff5d7]
0x290ee9ff2d2e   b6e  c441f96efa           vmovq xmm15,r10
0x290ee9ff2d33   b73  c50358ff             vaddsd xmm15,xmm15,xmm7
0x290ee9ff2d37   b77  c4417b2cdf           vcvttsd2si r11,xmm15
0x290ee9ff2d3c   b7c  4585db               testl r11,r11
0x290ee9ff2d3f   b7f  0f8809000000         js 0x290ee9ff2d4e  <+0xb8e>
0x290ee9ff2d45   b85  41ba00000080         movl r10,0x80000000
0x290ee9ff2d4b   b8b  450bda               orl r11,r10
0x290ee9ff2d4e   b8e  458bd3               movl r10,r11
0x290ee9ff2d51   b91  c441832ac2           vcvtqsi2sd xmm8,xmm15,r10
0x290ee9ff2d56   b96  c5792ec7             vucomisd xmm8,xmm7
0x290ee9ff2d5a   b9a  0f8a871b0000         jpe 0x290ee9ff48e7  <+0x2727>
0x290ee9ff2d60   ba0  0f85811b0000         jnz 0x290ee9ff48e7  <+0x2727>
0x290ee9ff2d66   ba6  418bc3               movl rax,r11
0x290ee9ff2d69   ba9  453be3               cmpl r12,r11
0x290ee9ff2d6c   bac  410f42c4             cmovcl rax,r12
0x290ee9ff2d70   bb0  4533db               xorl r11,r11
0x290ee9ff2d73   bb3  c5f82eeb             vucomiss xmm5,xmm3
0x290ee9ff2d77   bb7  440f47d8             cmoval r11,rax
0x290ee9ff2d7b   bbb  33c0                 xorl rax,rax
0x290ee9ff2d7d   bbd  4585db               testl r11,r11
0x290ee9ff2d80   bc0  0f95c0               setnzl al
0x290ee9ff2d83   bc3  418bdb               movl rbx,r11
0x290ee9ff2d86   bc6  2bd8                 subl rbx,rax
0x290ee9ff2d88   bc8  8b9598fcffff         movl rdx,[rbp-0x368]
0x290ee9ff2d8e   bce  8b85a8fcffff         movl rax,[rbp-0x358]
0x290ee9ff2d94   bd4  3b95a8fcffff         cmpl rdx,[rbp-0x358]
0x290ee9ff2d9a   bda  0f42c2               cmovcl rax,rdx
0x290ee9ff2d9d   bdd  8bb5a0fcffff         movl rsi,[rbp-0x360]
0x290ee9ff2da3   be3  8bc8                 movl rcx,rax
0x290ee9ff2da5   be5  3bf0                 cmpl rsi,rax
0x290ee9ff2da7   be7  0f42ce               cmovcl rcx,rsi
0x290ee9ff2daa   bea  4183c301             addl r11,0x1
0x290ee9ff2dae   bee  418bc3               movl rax,r11
0x290ee9ff2db1   bf1  453be3               cmpl r12,r11
0x290ee9ff2db4   bf4  410f42c4             cmovcl rax,r12
0x290ee9ff2db8   bf8  448d5801             leal r11,[rax+0x1]
0x290ee9ff2dbc   bfc  c5fb109df8feffff     vmovsd xmm3,[rbp-0x108]
0x290ee9ff2dc4   c04  c4e27918eb           vbroadcastss xmm5,xmm3
0x290ee9ff2dc9   c09  c4e27918f0           vbroadcastss xmm6,xmm0
0x290ee9ff2dce   c0e  488b8548ffffff       REX.W movq rax,[rbp-0xb8]
0x290ee9ff2dd5   c15  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x290ee9ff2dd9   c19  418b7c0464           movl rdi,[r12+rax*1+0x64]
0x290ee9ff2dde   c1e  458b440468           movl r8,[r12+rax*1+0x68]
0x290ee9ff2de3   c23  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff2de7   c27  c4817a6fbc0cb0010000 vmovdqu xmm7,[r12+r9*1+0x1b0]
0x290ee9ff2df1   c31  c4017a6f840c70010000 vmovdqu xmm8,[r12+r9*1+0x170]
0x290ee9ff2dfb   c3b  c4017a6f8c0c30010000 vmovdqu xmm9,[r12+r9*1+0x130]
0x290ee9ff2e05   c45  c4017a6f940cf0000000 vmovdqu xmm10,[r12+r9*1+0xf0]
0x290ee9ff2e0f   c4f  c4017a6f9c0cb0000000 vmovdqu xmm11,[r12+r9*1+0xb0]
0x290ee9ff2e19   c59  c4017a6fa40c30020000 vmovdqu xmm12,[r12+r9*1+0x230]
0x290ee9ff2e23   c63  c4017a6fac0cf0010000 vmovdqu xmm13,[r12+r9*1+0x1f0]
0x290ee9ff2e2d   c6d  c4017a6fb40ca0010000 vmovdqu xmm14,[r12+r9*1+0x1a0]
0x290ee9ff2e37   c77  c4817a6f8c0c60010000 vmovdqu xmm1,[r12+r9*1+0x160]
0x290ee9ff2e41   c81  c4817a6f940c20010000 vmovdqu xmm2,[r12+r9*1+0x120]
0x290ee9ff2e4b   c8b  c4817a6f840ce0000000 vmovdqu xmm0,[r12+r9*1+0xe0]
0x290ee9ff2e55   c95  c4817a6f9c0ca0000000 vmovdqu xmm3,[r12+r9*1+0xa0]
0x290ee9ff2e5f   c9f  c5f811ad50feffff     vmovups [rbp-0x1b0],xmm5
0x290ee9ff2e67   ca7  c4817a6fac0c20020000 vmovdqu xmm5,[r12+r9*1+0x220]
0x290ee9ff2e71   cb1  c5f811b540feffff     vmovups [rbp-0x1c0],xmm6
0x290ee9ff2e79   cb9  c4817a6fb40ce0010000 vmovdqu xmm6,[r12+r9*1+0x1e0]
0x290ee9ff2e83   cc3  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x290ee9ff2e8b   ccb  c4817a6f840c90010000 vmovdqu xmm0,[r12+r9*1+0x190]
0x290ee9ff2e95   cd5  c5f81185c0feffff     vmovups [rbp-0x140],xmm0
0x290ee9ff2e9d   cdd  c4817a6f840c50010000 vmovdqu xmm0,[r12+r9*1+0x150]
0x290ee9ff2ea7   ce7  c5f81185b0feffff     vmovups [rbp-0x150],xmm0
0x290ee9ff2eaf   cef  c4817a6f840c10010000 vmovdqu xmm0,[r12+r9*1+0x110]
0x290ee9ff2eb9   cf9  c5f81185e0fcffff     vmovups [rbp-0x320],xmm0
0x290ee9ff2ec1   d01  c4817a6f840cd0000000 vmovdqu xmm0,[r12+r9*1+0xd0]
0x290ee9ff2ecb   d0b  c5f81185d0fcffff     vmovups [rbp-0x330],xmm0
0x290ee9ff2ed3   d13  c4817a6f840c90000000 vmovdqu xmm0,[r12+r9*1+0x90]
0x290ee9ff2edd   d1d  c5f81185c0fcffff     vmovups [rbp-0x340],xmm0
0x290ee9ff2ee5   d25  c4817a6f840c10020000 vmovdqu xmm0,[r12+r9*1+0x210]
0x290ee9ff2eef   d2f  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x290ee9ff2ef7   d37  c4817a6f840cd0010000 vmovdqu xmm0,[r12+r9*1+0x1d0]
0x290ee9ff2f01   d41  c5f81185f0fbffff     vmovups [rbp-0x410],xmm0
0x290ee9ff2f09   d49  c4817a6f840c80010000 vmovdqu xmm0,[r12+r9*1+0x180]
0x290ee9ff2f13   d53  c5f8118500fcffff     vmovups [rbp-0x400],xmm0
0x290ee9ff2f1b   d5b  c4817a6f840c40010000 vmovdqu xmm0,[r12+r9*1+0x140]
0x290ee9ff2f25   d65  c5f8118510fcffff     vmovups [rbp-0x3f0],xmm0
0x290ee9ff2f2d   d6d  c4817a6f840c00010000 vmovdqu xmm0,[r12+r9*1+0x100]
0x290ee9ff2f37   d77  c5f8118520fcffff     vmovups [rbp-0x3e0],xmm0
0x290ee9ff2f3f   d7f  c4817a6f840cc0000000 vmovdqu xmm0,[r12+r9*1+0xc0]
0x290ee9ff2f49   d89  c5f8118530fcffff     vmovups [rbp-0x3d0],xmm0
0x290ee9ff2f51   d91  c4817a6f840c80000000 vmovdqu xmm0,[r12+r9*1+0x80]
0x290ee9ff2f5b   d9b  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x290ee9ff2f63   da3  c4817a6f840c00020000 vmovdqu xmm0,[r12+r9*1+0x200]
0x290ee9ff2f6d   dad  c5f8118550fcffff     vmovups [rbp-0x3b0],xmm0
0x290ee9ff2f75   db5  c4817a6f840cc0010000 vmovdqu xmm0,[r12+r9*1+0x1c0]
0x290ee9ff2f7f   dbf  48899d78fcffff       REX.W movq [rbp-0x388],rbx
0x290ee9ff2f86   dc6  48898df8fdffff       REX.W movq [rbp-0x208],rcx
0x290ee9ff2f8d   dcd  4c899d80fcffff       REX.W movq [rbp-0x380],r11
0x290ee9ff2f94   dd4  4889bd90fcffff       REX.W movq [rbp-0x370],rdi
0x290ee9ff2f9b   ddb  4c898588fcffff       REX.W movq [rbp-0x378],r8
0x290ee9ff2fa2   de2  c57810bd60fcffff     vmovups xmm15,[rbp-0x3a0]
0x290ee9ff2faa   dea  c57811bd50ffffff     vmovups [rbp-0xb0],xmm15
0x290ee9ff2fb2   df2  c5fb11a568ffffff     vmovsd [rbp-0x98],xmm4
0x290ee9ff2fba   dfa  c5fb11a560ffffff     vmovsd [rbp-0xa0],xmm4
0x290ee9ff2fc2   e02  c5fb11a540ffffff     vmovsd [rbp-0xc0],xmm4
0x290ee9ff2fca   e0a  c5fb11a538ffffff     vmovsd [rbp-0xc8],xmm4
0x290ee9ff2fd2   e12  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x290ee9ff2fda   e1a  c57928c8             vmovapd xmm9,xmm0
0x290ee9ff2fde   e1e  33c0                 xorl rax,rax
0x290ee9ff2fe0   e20  8b8df0fdffff         movl rcx,[rbp-0x210]
0x290ee9ff2fe6   e26  c5fb11a530ffffff     vmovsd [rbp-0xd0],xmm4
0x290ee9ff2fee   e2e  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x290ee9ff2ff6   e36  c578118520fdffff     vmovups [rbp-0x2e0],xmm8
0x290ee9ff2ffe   e3e  c578119540fdffff     vmovups [rbp-0x2c0],xmm10
0x290ee9ff3006   e46  c5f811b5d0fdffff     vmovups [rbp-0x230],xmm6
0x290ee9ff300e   e4e  c5f811adc0fdffff     vmovups [rbp-0x240],xmm5
0x290ee9ff3016   e56  c5f8119db0fdffff     vmovups [rbp-0x250],xmm3
0x290ee9ff301e   e5e  c5f81195a0fdffff     vmovups [rbp-0x260],xmm2
0x290ee9ff3026   e66  c5f8118d90fdffff     vmovups [rbp-0x270],xmm1
0x290ee9ff302e   e6e  c57811b580fdffff     vmovups [rbp-0x280],xmm14
0x290ee9ff3036   e76  c57811ad70fdffff     vmovups [rbp-0x290],xmm13
0x290ee9ff303e   e7e  c57811a560fdffff     vmovups [rbp-0x2a0],xmm12
0x290ee9ff3046   e86  c578119d50fdffff     vmovups [rbp-0x2b0],xmm11
0x290ee9ff304e   e8e  e97e000000           jmp 0x290ee9ff30d1  <+0xf11>
0x290ee9ff3053   e93  660f1f840000000000   nop
0x290ee9ff305c   e9c  660f1f840000000000   nop
0x290ee9ff3065   ea5  660f1f840000000000   nop
0x290ee9ff306e   eae  660f1f840000000000   nop
0x290ee9ff3077   eb7  660f1f840000000000   nop
0x290ee9ff3080   ec0  8b9d78fcffff         movl rbx,[rbp-0x388]
0x290ee9ff3086   ec6  458bf3               movl r14,r11
0x290ee9ff3089   ec9  448b9d80fcffff       movl r11,[rbp-0x380]
0x290ee9ff3090   ed0  448b8588fcffff       movl r8,[rbp-0x378]
0x290ee9ff3097   ed7  8bbd90fcffff         movl rdi,[rbp-0x370]
0x290ee9ff309d   edd  8b9598fcffff         movl rdx,[rbp-0x368]
0x290ee9ff30a3   ee3  c578108de0fdffff     vmovups xmm9,[rbp-0x220]
0x290ee9ff30ab   eeb  418bcf               movl rcx,r15
0x290ee9ff30ae   eee  4c8be6               REX.W movq r12,rsi
0x290ee9ff30b1   ef1  c57811ad60fdffff     vmovups [rbp-0x2a0],xmm13
0x290ee9ff30b9   ef9  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x290ee9ff30c1   f01  c57811a580fdffff     vmovups [rbp-0x280],xmm12
0x290ee9ff30c9   f09  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x290ee9ff30d1   f11  c578109550fcffff     vmovups xmm10,[rbp-0x3b0]
0x290ee9ff30d9   f19  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x290ee9ff30e1   f21  c57810a530fcffff     vmovups xmm12,[rbp-0x3d0]
0x290ee9ff30e9   f29  c57810ad20fcffff     vmovups xmm13,[rbp-0x3e0]
0x290ee9ff30f1   f31  c57810b510fcffff     vmovups xmm14,[rbp-0x3f0]
0x290ee9ff30f9   f39  c5f8108d00fcffff     vmovups xmm1,[rbp-0x400]
0x290ee9ff3101   f41  c5f81095f0fbffff     vmovups xmm2,[rbp-0x410]
0x290ee9ff3109   f49  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x290ee9ff3111   f51  448b8d18feffff       movl r9,[rbp-0x1e8]
0x290ee9ff3118   f58  448bbd00feffff       movl r15,[rbp-0x200]
0x290ee9ff311f   f5f  4c89b578ffffff       REX.W movq [rbp-0x88],r14
0x290ee9ff3126   f66  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff312a   f6a  0f86da170000         jna 0x290ee9ff490a  <+0x274a>
0x290ee9ff3130   f70  8bb570fcffff         movl rsi,[rbp-0x390]
0x290ee9ff3136   f76  410faff6             imull rsi,r14
0x290ee9ff313a   f7a  448d3433             leal r14,[rbx+rsi*1]
0x290ee9ff313e   f7e  453bc6               cmpl r8,r14
0x290ee9ff3141   f81  0f8629000000         jna 0x290ee9ff3170  <+0xfb0>
0x290ee9ff3147   f87  4103f3               addl rsi,r11
0x290ee9ff314a   f8a  443bc6               cmpl r8,rsi
0x290ee9ff314d   f8d  0f861d000000         jna 0x290ee9ff3170  <+0xfb0>
0x290ee9ff3153   f93  8d34b7               leal rsi,[rdi+rsi*4]
0x290ee9ff3156   f96  418b3434             movl rsi,[r12+rsi*1]
0x290ee9ff315a   f9a  468d34b7             leal r14,[rdi+r14*4]
0x290ee9ff315e   f9e  478b3434             movl r14,[r12+r14*1]
0x290ee9ff3162   fa2  458bd6               movl r10,r14
0x290ee9ff3165   fa5  448bf6               movl r14,rsi
0x290ee9ff3168   fa8  418bf2               movl rsi,r10
0x290ee9ff316b   fab  e906000000           jmp 0x290ee9ff3176  <+0xfb6>
0x290ee9ff3170   fb0  4c8bf0               REX.W movq r14,rax
0x290ee9ff3173   fb3  488bf0               REX.W movq rsi,rax
0x290ee9ff3176   fb6  458d1cb7             leal r11,[r15+rsi*4]
0x290ee9ff317a   fba  418bde               movl rbx,r14
0x290ee9ff317d   fbd  2bde                 subl rbx,rsi
0x290ee9ff317f   fbf  33ff                 xorl rdi,rdi
0x290ee9ff3181   fc1  413bce               cmpl rcx,r14
0x290ee9ff3184   fc4  400f92c7             setcl dil
0x290ee9ff3188   fc8  4533c0               xorl r8,r8
0x290ee9ff318b   fcb  443bf6               cmpl r14,rsi
0x290ee9ff318e   fce  410f92c0             setcl r8l
0x290ee9ff3192   fd2  4c8bff               REX.W movq r15,rdi
0x290ee9ff3195   fd5  450bf8               orl r15,r8
0x290ee9ff3198   fd8  8bcb                 movl rcx,rbx
0x290ee9ff319a   fda  4585ff               testl r15,r15
0x290ee9ff319d   fdd  0f45c8               cmovnzl rcx,rax
0x290ee9ff31a0   fe0  4c89b590feffff       REX.W movq [rbp-0x170],r14
0x290ee9ff31a7   fe7  4c899d18ffffff       REX.W movq [rbp-0xe8],r11
0x290ee9ff31ae   fee  4889bd08fdffff       REX.W movq [rbp-0x2f8],rdi
0x290ee9ff31b5   ff5  4c8985a0feffff       REX.W movq [rbp-0x160],r8
0x290ee9ff31bc   ffc  48898de0feffff       REX.W movq [rbp-0x120],rcx
0x290ee9ff31c3  1003  443bf6               cmpl r14,rsi
0x290ee9ff31c6  1006  0f82b3000000         jc 0x290ee9ff327f  <+0x10bf>
0x290ee9ff31cc  100c  458d3cb1             leal r15,[r9+rsi*4]
0x290ee9ff31d0  1010  b904000000           movl rcx,0x4
0x290ee9ff31d5  1015  413bd6               cmpl rdx,r14
0x290ee9ff31d8  1018  440f42f9             cmovcl r15,rcx
0x290ee9ff31dc  101c  448bcb               movl r9,rbx
0x290ee9ff31df  101f  413bd6               cmpl rdx,r14
0x290ee9ff31e2  1022  440f42c8             cmovcl r9,rax
0x290ee9ff31e6  1026  418bd1               movl rdx,r9
0x290ee9ff31e9  1029  81e2f0ffff1f         andl rdx,0x1ffffff0
0x290ee9ff31ef  102f  418d1497             leal rdx,[r15+rdx*4]
0x290ee9ff31f3  1033  448ba508feffff       movl r12,[rbp-0x1f8]
0x290ee9ff31fa  103a  458d1cb4             leal r11,[r12+rsi*4]
0x290ee9ff31fe  103e  448ba5a0fcffff       movl r12,[rbp-0x360]
0x290ee9ff3205  1045  453be6               cmpl r12,r14
0x290ee9ff3208  1048  440f42d9             cmovcl r11,rcx
0x290ee9ff320c  104c  8bfb                 movl rdi,rbx
0x290ee9ff320e  104e  453be6               cmpl r12,r14
0x290ee9ff3211  1051  0f42f8               cmovcl rdi,rax
0x290ee9ff3214  1054  448be7               movl r12,rdi
0x290ee9ff3217  1057  4181e4f0ffff1f       andl r12,0x1ffffff0
0x290ee9ff321e  105e  478d24a3             leal r12,[r11+r12*4]
0x290ee9ff3222  1062  458bc1               movl r8,r9
0x290ee9ff3225  1065  41c1e804             shrl r8, 4
0x290ee9ff3229  1069  4183e10f             andl r9,0xf
0x290ee9ff322d  106d  4c899df0fcffff       REX.W movq [rbp-0x310],r11
0x290ee9ff3234  1074  448bdf               movl r11,rdi
0x290ee9ff3237  1077  41c1eb04             shrl r11, 4
0x290ee9ff323b  107b  83e70f               andl rdi,0xf
0x290ee9ff323e  107e  4c899d00fdffff       REX.W movq [rbp-0x300],r11
0x290ee9ff3245  1085  448b9da8fcffff       movl r11,[rbp-0x358]
0x290ee9ff324c  108c  453bde               cmpl r11,r14
0x290ee9ff324f  108f  0f821c000000         jc 0x290ee9ff3271  <+0x10b1>
0x290ee9ff3255  1095  448b9d10feffff       movl r11,[rbp-0x1f0]
0x290ee9ff325c  109c  418d34b3             leal rsi,[r11+rsi*4]
0x290ee9ff3260  10a0  458bd7               movl r10,r15
0x290ee9ff3263  10a3  448bfb               movl r15,rbx
0x290ee9ff3266  10a6  418bda               movl rbx,r10
0x290ee9ff3269  10a9  448bde               movl r11,rsi
0x290ee9ff326c  10ac  e939000000           jmp 0x290ee9ff32aa  <+0x10ea>
0x290ee9ff3271  10b1  418bdf               movl rbx,r15
0x290ee9ff3274  10b4  4c8bf8               REX.W movq r15,rax
0x290ee9ff3277  10b7  4c8bd9               REX.W movq r11,rcx
0x290ee9ff327a  10ba  e92b000000           jmp 0x290ee9ff32aa  <+0x10ea>
0x290ee9ff327f  10bf  4c8bf8               REX.W movq r15,rax
0x290ee9ff3282  10c2  b904000000           movl rcx,0x4
0x290ee9ff3287  10c7  488bf8               REX.W movq rdi,rax
0x290ee9ff328a  10ca  48898500fdffff       REX.W movq [rbp-0x300],rax
0x290ee9ff3291  10d1  4c8bc8               REX.W movq r9,rax
0x290ee9ff3294  10d4  4c8bc0               REX.W movq r8,rax
0x290ee9ff3297  10d7  488bd1               REX.W movq rdx,rcx
0x290ee9ff329a  10da  488bd9               REX.W movq rbx,rcx
0x290ee9ff329d  10dd  4c8bd9               REX.W movq r11,rcx
0x290ee9ff32a0  10e0  4c8be1               REX.W movq r12,rcx
0x290ee9ff32a3  10e3  48898df0fcffff       REX.W movq [rbp-0x310],rcx
0x290ee9ff32aa  10ea  488bb5a0feffff       REX.W movq rsi,[rbp-0x160]
0x290ee9ff32b1  10f1  0bb508fdffff         orl rsi,[rbp-0x2f8]
0x290ee9ff32b7  10f7  4c89a5e8feffff       REX.W movq [rbp-0x118],r12
0x290ee9ff32be  10fe  448ba518ffffff       movl r12,[rbp-0xe8]
0x290ee9ff32c5  1105  85f6                 testl rsi,rsi
0x290ee9ff32c7  1107  440f45e1             cmovnzl r12,rcx
0x290ee9ff32cb  110b  8b8de0feffff         movl rcx,[rbp-0x120]
0x290ee9ff32d1  1111  83e10f               andl rcx,0xf
0x290ee9ff32d4  1114  418bf7               movl rsi,r15
0x290ee9ff32d7  1117  c1ee04               shrl rsi, 4
0x290ee9ff32da  111a  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x290ee9ff32e1  1121  8b95e0feffff         movl rdx,[rbp-0x120]
0x290ee9ff32e7  1127  c1ea04               shrl rdx, 4
0x290ee9ff32ea  112a  4c898da8feffff       REX.W movq [rbp-0x158],r9
0x290ee9ff32f1  1131  448b8d00fdffff       movl r9,[rbp-0x300]
0x290ee9ff32f8  1138  4c89bd20ffffff       REX.W movq [rbp-0xe0],r15
0x290ee9ff32ff  113f  448bfa               movl r15,rdx
0x290ee9ff3302  1142  443bca               cmpl r9,rdx
0x290ee9ff3305  1145  450f42f9             cmovcl r15,r9
0x290ee9ff3309  1149  418bd7               movl rdx,r15
0x290ee9ff330c  114c  453bc7               cmpl r8,r15
0x290ee9ff330f  114f  410f42d0             cmovcl rdx,r8
0x290ee9ff3313  1153  448bfa               movl r15,rdx
0x290ee9ff3316  1156  3bf2                 cmpl rsi,rdx
0x290ee9ff3318  1158  440f42fe             cmovcl r15,rsi
0x290ee9ff331c  115c  4c899d28ffffff       REX.W movq [rbp-0xd8],r11
0x290ee9ff3323  1163  4889bd98feffff       REX.W movq [rbp-0x168],rdi
0x290ee9ff332a  116a  4c89a518ffffff       REX.W movq [rbp-0xe8],r12
0x290ee9ff3331  1171  4585ff               testl r15,r15
0x290ee9ff3334  1174  0f856b000000         jnz 0x290ee9ff33a5  <+0x11e5>
0x290ee9ff333a  117a  c4c17928d9           vmovapd xmm3,xmm9
0x290ee9ff333f  117f  c4c17928f2           vmovapd xmm6,xmm10
0x290ee9ff3344  1184  c4c17928c3           vmovapd xmm0,xmm11
0x290ee9ff3349  1189  c4417928cc           vmovapd xmm9,xmm12
0x290ee9ff334e  118e  c4417928d5           vmovapd xmm10,xmm13
0x290ee9ff3353  1193  c4c17928e6           vmovapd xmm4,xmm14
0x290ee9ff3358  1198  c5f928f9             vmovapd xmm7,xmm1
0x290ee9ff335c  119c  c57928c2             vmovapd xmm8,xmm2
0x290ee9ff3360  11a0  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x290ee9ff3368  11a8  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x290ee9ff3370  11b0  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x290ee9ff3378  11b8  488b75c8             REX.W movq rsi,[rbp-0x38]
0x290ee9ff337c  11bc  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff3380  11c0  c57810ad60fdffff     vmovups xmm13,[rbp-0x2a0]
0x290ee9ff3388  11c8  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x290ee9ff3390  11d0  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x290ee9ff3398  11d8  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x290ee9ff33a0  11e0  e98d060000           jmp 0x290ee9ff3a32  <+0x1872>
0x290ee9ff33a5  11e5  c578118de0fdffff     vmovups [rbp-0x220],xmm9
0x290ee9ff33ad  11ed  c578119550fcffff     vmovups [rbp-0x3b0],xmm10
0x290ee9ff33b5  11f5  c578119d40fcffff     vmovups [rbp-0x3c0],xmm11
0x290ee9ff33bd  11fd  c57811a530fcffff     vmovups [rbp-0x3d0],xmm12
0x290ee9ff33c5  1205  c57811ad20fcffff     vmovups [rbp-0x3e0],xmm13
0x290ee9ff33cd  120d  c57811b510fcffff     vmovups [rbp-0x3f0],xmm14
0x290ee9ff33d5  1215  c5f8118d00fcffff     vmovups [rbp-0x400],xmm1
0x290ee9ff33dd  121d  c5f81195f0fbffff     vmovups [rbp-0x410],xmm2
0x290ee9ff33e5  1225  448b85f0fcffff       movl r8,[rbp-0x310]
0x290ee9ff33ec  122c  488b75c8             REX.W movq rsi,[rbp-0x38]
0x290ee9ff33f0  1230  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff33f4  1234  488bd0               REX.W movq rdx,rax
0x290ee9ff33f7  1237  e962000000           jmp 0x290ee9ff345e  <+0x129e>
0x290ee9ff33fc  123c  0f1f4000             nop
0x290ee9ff3400  1240  c5f811a550fdffff     vmovups [rbp-0x2b0],xmm4
0x290ee9ff3408  1248  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x290ee9ff3410  1250  448ba518ffffff       movl r12,[rbp-0xe8]
0x290ee9ff3417  1257  448b9d28ffffff       movl r11,[rbp-0xd8]
0x290ee9ff341e  125e  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x290ee9ff3426  1266  c57811a520fdffff     vmovups [rbp-0x2e0],xmm12
0x290ee9ff342e  126e  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x290ee9ff3436  1276  c5f8118540fdffff     vmovups [rbp-0x2c0],xmm0
0x290ee9ff343e  127e  c5f8119d60fdffff     vmovups [rbp-0x2a0],xmm3
0x290ee9ff3446  1286  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x290ee9ff344e  128e  c578119580fdffff     vmovups [rbp-0x280],xmm10
0x290ee9ff3456  1296  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x290ee9ff345e  129e  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff3462  12a2  0f8675150000         jna 0x290ee9ff49dd  <+0x281d>
0x290ee9ff3468  12a8  8d3c1a               leal rdi,[rdx+rbx*1]
0x290ee9ff346b  12ab  c57a6f1c3e           vmovdqu xmm11,[rsi+rdi*1]
0x290ee9ff3470  12b0  428d041a             leal rax,[rdx+r11*1]
0x290ee9ff3474  12b4  c57a6f1406           vmovdqu xmm10,[rsi+rax*1]
0x290ee9ff3479  12b9  468d1c02             leal r11,[rdx+r8*1]
0x290ee9ff347d  12bd  c4217a6f0c1e         vmovdqu xmm9,[rsi+r11*1]
0x290ee9ff3483  12c3  c441585ce1           vsubps xmm12,xmm4,xmm9
0x290ee9ff3488  12c8  468d3422             leal r14,[rdx+r12*1]
0x290ee9ff348c  12cc  c4217a6f2c36         vmovdqu xmm13,[rsi+r14*1]
0x290ee9ff3492  12d2  c57810b550feffff     vmovups xmm14,[rbp-0x1b0]
0x290ee9ff349a  12da  c4c1085ccd           vsubps xmm1,xmm14,xmm13
0x290ee9ff349f  12df  c5f059d1             vmulps xmm2,xmm1,xmm1
0x290ee9ff34a3  12e3  c4c11859c4           vmulps xmm0,xmm12,xmm12
0x290ee9ff34a8  12e8  c5e858c0             vaddps xmm0,xmm2,xmm0
0x290ee9ff34ac  12ec  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x290ee9ff34b4  12f4  c5f8c2da01           vcmpps xmm3,xmm0,xmm2, (lt)
0x290ee9ff34b9  12f9  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x290ee9ff34c1  1301  c5e1dbdd             vpand xmm3,xmm3,xmm5
0x290ee9ff34c5  1305  c5f85bdb             vcvtdq2ps xmm3,xmm3
0x290ee9ff34c9  1309  c51859e3             vmulps xmm12,xmm12,xmm3
0x290ee9ff34cd  130d  c5f810b550fcffff     vmovups xmm6,[rbp-0x3b0]
0x290ee9ff34d5  1315  c4c14858f4           vaddps xmm6,xmm6,xmm12
0x290ee9ff34da  131a  c4a17a7fb40e00020000 vmovdqu [rsi+r9*1+0x200],xmm6
0x290ee9ff34e4  1324  c5f059db             vmulps xmm3,xmm1,xmm3
0x290ee9ff34e8  1328  c57810a5e0fdffff     vmovups xmm12,[rbp-0x220]
0x290ee9ff34f0  1330  c59858db             vaddps xmm3,xmm12,xmm3
0x290ee9ff34f4  1334  c4a17a7f9c0ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm3
0x290ee9ff34fe  133e  c568c2e002           vcmpps xmm12,xmm2,xmm0, (le)
0x290ee9ff3503  1343  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x290ee9ff350b  134b  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x290ee9ff3513  1353  c5f8c2d901           vcmpps xmm3,xmm0,xmm1, (lt)
0x290ee9ff3518  1358  c599dbdb             vpand xmm3,xmm12,xmm3
0x290ee9ff351c  135c  c44119efe4           vpxor xmm12,xmm12,xmm12
0x290ee9ff3521  1361  c598c2c001           vcmpps xmm0,xmm12,xmm0, (lt)
0x290ee9ff3526  1366  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x290ee9ff352a  136a  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x290ee9ff352e  136e  c5e1dbc0             vpand xmm0,xmm3,xmm0
0x290ee9ff3532  1372  c5f8109d00fcffff     vmovups xmm3,[rbp-0x400]
0x290ee9ff353a  137a  c5f858db             vaddps xmm3,xmm0,xmm3
0x290ee9ff353e  137e  c4a17a7f9c0e80010000 vmovdqu [rsi+r9*1+0x180],xmm3
0x290ee9ff3548  1388  c52859d0             vmulps xmm10,xmm10,xmm0
0x290ee9ff354c  138c  c5f8119d00fcffff     vmovups [rbp-0x400],xmm3
0x290ee9ff3554  1394  c5f8109d10fcffff     vmovups xmm3,[rbp-0x3f0]
0x290ee9ff355c  139c  c5a858db             vaddps xmm3,xmm10,xmm3
0x290ee9ff3560  13a0  c4a17a7f9c0e40010000 vmovdqu [rsi+r9*1+0x140],xmm3
0x290ee9ff356a  13aa  c52059d0             vmulps xmm10,xmm11,xmm0
0x290ee9ff356e  13ae  c578109d20fcffff     vmovups xmm11,[rbp-0x3e0]
0x290ee9ff3576  13b6  c4412858d3           vaddps xmm10,xmm10,xmm11
0x290ee9ff357b  13bb  c4217a7f940e00010000 vmovdqu [rsi+r9*1+0x100],xmm10
0x290ee9ff3585  13c5  c53059c8             vmulps xmm9,xmm9,xmm0
0x290ee9ff3589  13c9  c578109d30fcffff     vmovups xmm11,[rbp-0x3d0]
0x290ee9ff3591  13d1  c4413058cb           vaddps xmm9,xmm9,xmm11
0x290ee9ff3596  13d6  c4217a7f8c0ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm9
0x290ee9ff35a0  13e0  c59059c0             vmulps xmm0,xmm13,xmm0
0x290ee9ff35a4  13e4  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x290ee9ff35ac  13ec  c5a058c0             vaddps xmm0,xmm11,xmm0
0x290ee9ff35b0  13f0  c4a17a7f840e80000000 vmovdqu [rsi+r9*1+0x80],xmm0
0x290ee9ff35ba  13fa  448d6710             leal r12,[rdi+0x10]
0x290ee9ff35be  13fe  c4217a6f1c26         vmovdqu xmm11,[rsi+r12*1]
0x290ee9ff35c4  1404  448d6010             leal r12,[rax+0x10]
0x290ee9ff35c8  1408  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x290ee9ff35ce  140e  458d6310             leal r12,[r11+0x10]
0x290ee9ff35d2  1412  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x290ee9ff35da  141a  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x290ee9ff35e0  1420  c5f8119d10fcffff     vmovups [rbp-0x3f0],xmm3
0x290ee9ff35e8  1428  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x290ee9ff35ec  142c  458d6610             leal r12,[r14+0x10]
0x290ee9ff35f0  1430  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x290ee9ff35f8  1438  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x290ee9ff35fe  143e  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x290ee9ff3606  1446  c5085cce             vsubps xmm9,xmm14,xmm6
0x290ee9ff360a  144a  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x290ee9ff3612  1452  c4413059d1           vmulps xmm10,xmm9,xmm9
0x290ee9ff3617  1457  c5e059fb             vmulps xmm7,xmm3,xmm3
0x290ee9ff361b  145b  c5a858ff             vaddps xmm7,xmm10,xmm7
0x290ee9ff361f  145f  c540c2d201           vcmpps xmm10,xmm7,xmm2, (lt)
0x290ee9ff3624  1464  c529dbd5             vpand xmm10,xmm10,xmm5
0x290ee9ff3628  1468  c441785bd2           vcvtdq2ps xmm10,xmm10
0x290ee9ff362d  146d  c4c16059da           vmulps xmm3,xmm3,xmm10
0x290ee9ff3632  1472  c5781085b0fcffff     vmovups xmm8,[rbp-0x350]
0x290ee9ff363a  147a  c5b858db             vaddps xmm3,xmm8,xmm3
0x290ee9ff363e  147e  c4a17a7f9c0e10020000 vmovdqu [rsi+r9*1+0x210],xmm3
0x290ee9ff3648  1488  c4413059c2           vmulps xmm8,xmm9,xmm10
0x290ee9ff364d  148d  c578108df0fbffff     vmovups xmm9,[rbp-0x410]
0x290ee9ff3655  1495  c4413058c0           vaddps xmm8,xmm9,xmm8
0x290ee9ff365a  149a  c4217a7f840ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm8
0x290ee9ff3664  14a4  c568c2cf02           vcmpps xmm9,xmm2,xmm7, (le)
0x290ee9ff3669  14a9  c540c2d101           vcmpps xmm10,xmm7,xmm1, (lt)
0x290ee9ff366e  14ae  c44131dbca           vpand xmm9,xmm9,xmm10
0x290ee9ff3673  14b3  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x290ee9ff3678  14b8  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x290ee9ff367c  14bc  c5f85bff             vcvtdq2ps xmm7,xmm7
0x290ee9ff3680  14c0  c5b1dbff             vpand xmm7,xmm9,xmm7
0x290ee9ff3684  14c4  c578108dc0feffff     vmovups xmm9,[rbp-0x140]
0x290ee9ff368c  14cc  c4414058c9           vaddps xmm9,xmm7,xmm9
0x290ee9ff3691  14d1  c4217a7f8c0e90010000 vmovdqu [rsi+r9*1+0x190],xmm9
0x290ee9ff369b  14db  c51059d7             vmulps xmm10,xmm13,xmm7
0x290ee9ff369f  14df  c57810adb0feffff     vmovups xmm13,[rbp-0x150]
0x290ee9ff36a7  14e7  c4412858d5           vaddps xmm10,xmm10,xmm13
0x290ee9ff36ac  14ec  c4217a7f940e50010000 vmovdqu [rsi+r9*1+0x150],xmm10
0x290ee9ff36b6  14f6  c52059df             vmulps xmm11,xmm11,xmm7
0x290ee9ff36ba  14fa  c57810ade0fcffff     vmovups xmm13,[rbp-0x320]
0x290ee9ff36c2  1502  c4412058dd           vaddps xmm11,xmm11,xmm13
0x290ee9ff36c7  1507  c4217a7f9c0e10010000 vmovdqu [rsi+r9*1+0x110],xmm11
0x290ee9ff36d1  1511  c5f859c7             vmulps xmm0,xmm0,xmm7
0x290ee9ff36d5  1515  c57810add0fcffff     vmovups xmm13,[rbp-0x330]
0x290ee9ff36dd  151d  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x290ee9ff36e2  1522  c4a17a7f840ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm0
0x290ee9ff36ec  152c  c5c859f7             vmulps xmm6,xmm6,xmm7
0x290ee9ff36f0  1530  c5f810bdc0fcffff     vmovups xmm7,[rbp-0x340]
0x290ee9ff36f8  1538  c5c058f6             vaddps xmm6,xmm7,xmm6
0x290ee9ff36fc  153c  c4a17a7fb40e90000000 vmovdqu [rsi+r9*1+0x90],xmm6
0x290ee9ff3706  1546  448d6720             leal r12,[rdi+0x20]
0x290ee9ff370a  154a  c4a17a6f3c26         vmovdqu xmm7,[rsi+r12*1]
0x290ee9ff3710  1550  448d6020             leal r12,[rax+0x20]
0x290ee9ff3714  1554  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x290ee9ff371a  155a  458d6320             leal r12,[r11+0x20]
0x290ee9ff371e  155e  c5f81185d0fcffff     vmovups [rbp-0x330],xmm0
0x290ee9ff3726  1566  c4a17a6f0426         vmovdqu xmm0,[rsi+r12*1]
0x290ee9ff372c  156c  c5f8119db0fcffff     vmovups [rbp-0x350],xmm3
0x290ee9ff3734  1574  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x290ee9ff3738  1578  458d6620             leal r12,[r14+0x20]
0x290ee9ff373c  157c  c5f811b5c0fcffff     vmovups [rbp-0x340],xmm6
0x290ee9ff3744  1584  c4a17a6f3426         vmovdqu xmm6,[rsi+r12*1]
0x290ee9ff374a  158a  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x290ee9ff3752  1592  c5085cc6             vsubps xmm8,xmm14,xmm6
0x290ee9ff3756  1596  c578118dc0feffff     vmovups [rbp-0x140],xmm9
0x290ee9ff375e  159e  c4413859c8           vmulps xmm9,xmm8,xmm8
0x290ee9ff3763  15a3  c5781195b0feffff     vmovups [rbp-0x150],xmm10
0x290ee9ff376b  15ab  c56059d3             vmulps xmm10,xmm3,xmm3
0x290ee9ff376f  15af  c4413058ca           vaddps xmm9,xmm9,xmm10
0x290ee9ff3774  15b4  c530c2d201           vcmpps xmm10,xmm9,xmm2, (lt)
0x290ee9ff3779  15b9  c529dbd5             vpand xmm10,xmm10,xmm5
0x290ee9ff377d  15bd  c441785bd2           vcvtdq2ps xmm10,xmm10
0x290ee9ff3782  15c2  c4c16059da           vmulps xmm3,xmm3,xmm10
0x290ee9ff3787  15c7  c578119de0fcffff     vmovups [rbp-0x320],xmm11
0x290ee9ff378f  15cf  c578109dc0fdffff     vmovups xmm11,[rbp-0x240]
0x290ee9ff3797  15d7  c5a058db             vaddps xmm3,xmm11,xmm3
0x290ee9ff379b  15db  c4a17a7f9c0e20020000 vmovdqu [rsi+r9*1+0x220],xmm3
0x290ee9ff37a5  15e5  c4413859c2           vmulps xmm8,xmm8,xmm10
0x290ee9ff37aa  15ea  c5781095d0fdffff     vmovups xmm10,[rbp-0x230]
0x290ee9ff37b2  15f2  c4412858c0           vaddps xmm8,xmm10,xmm8
0x290ee9ff37b7  15f7  c4217a7f840ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm8
0x290ee9ff37c1  1601  c44168c2d102         vcmpps xmm10,xmm2,xmm9, (le)
0x290ee9ff37c7  1607  c530c2d901           vcmpps xmm11,xmm9,xmm1, (lt)
0x290ee9ff37cc  160c  c44129dbd3           vpand xmm10,xmm10,xmm11
0x290ee9ff37d1  1611  c44118c2c901         vcmpps xmm9,xmm12,xmm9, (lt)
0x290ee9ff37d7  1617  c531dbcd             vpand xmm9,xmm9,xmm5
0x290ee9ff37db  161b  c441785bc9           vcvtdq2ps xmm9,xmm9
0x290ee9ff37e0  1620  c44129dbc9           vpand xmm9,xmm10,xmm9
0x290ee9ff37e5  1625  c578109580fdffff     vmovups xmm10,[rbp-0x280]
0x290ee9ff37ed  162d  c4413058d2           vaddps xmm10,xmm9,xmm10
0x290ee9ff37f2  1632  c4217a7f940ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm10
0x290ee9ff37fc  163c  c4411059d9           vmulps xmm11,xmm13,xmm9
0x290ee9ff3801  1641  c57810ad90fdffff     vmovups xmm13,[rbp-0x270]
0x290ee9ff3809  1649  c4412058dd           vaddps xmm11,xmm11,xmm13
0x290ee9ff380e  164e  c4217a7f9c0e60010000 vmovdqu [rsi+r9*1+0x160],xmm11
0x290ee9ff3818  1658  c4c14059f9           vmulps xmm7,xmm7,xmm9
0x290ee9ff381d  165d  c57810ada0fdffff     vmovups xmm13,[rbp-0x260]
0x290ee9ff3825  1665  c4c14058fd           vaddps xmm7,xmm7,xmm13
0x290ee9ff382a  166a  c4a17a7fbc0e20010000 vmovdqu [rsi+r9*1+0x120],xmm7
0x290ee9ff3834  1674  c4c17859c1           vmulps xmm0,xmm0,xmm9
0x290ee9ff3839  1679  c57810add0feffff     vmovups xmm13,[rbp-0x130]
0x290ee9ff3841  1681  c4c17858c5           vaddps xmm0,xmm0,xmm13
0x290ee9ff3846  1686  c4a17a7f840ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm0
0x290ee9ff3850  1690  c4c14859f1           vmulps xmm6,xmm6,xmm9
0x290ee9ff3855  1695  c578108db0fdffff     vmovups xmm9,[rbp-0x250]
0x290ee9ff385d  169d  c5b058f6             vaddps xmm6,xmm9,xmm6
0x290ee9ff3861  16a1  c4a17a7fb40ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm6
0x290ee9ff386b  16ab  448d6730             leal r12,[rdi+0x30]
0x290ee9ff386f  16af  c4217a6f0c26         vmovdqu xmm9,[rsi+r12*1]
0x290ee9ff3875  16b5  448d6030             leal r12,[rax+0x30]
0x290ee9ff3879  16b9  c4217a6f2c26         vmovdqu xmm13,[rsi+r12*1]
0x290ee9ff387f  16bf  4183c330             addl r11,0x30
0x290ee9ff3883  16c3  c5f81185d0feffff     vmovups [rbp-0x130],xmm0
0x290ee9ff388b  16cb  c4a17a6f041e         vmovdqu xmm0,[rsi+r11*1]
0x290ee9ff3891  16d1  c5f8119dc0fdffff     vmovups [rbp-0x240],xmm3
0x290ee9ff3899  16d9  c5d85cd8             vsubps xmm3,xmm4,xmm0
0x290ee9ff389d  16dd  458d5e30             leal r11,[r14+0x30]
0x290ee9ff38a1  16e1  c4a17a6f241e         vmovdqu xmm4,[rsi+r11*1]
0x290ee9ff38a7  16e7  c5f811b5b0fdffff     vmovups [rbp-0x250],xmm6
0x290ee9ff38af  16ef  c5885cf4             vsubps xmm6,xmm14,xmm4
0x290ee9ff38b3  16f3  c54859f6             vmulps xmm14,xmm6,xmm6
0x290ee9ff38b7  16f7  c5f811bda0fdffff     vmovups [rbp-0x260],xmm7
0x290ee9ff38bf  16ff  c5e059fb             vmulps xmm7,xmm3,xmm3
0x290ee9ff38c3  1703  c58858ff             vaddps xmm7,xmm14,xmm7
0x290ee9ff38c7  1707  c540c2f201           vcmpps xmm14,xmm7,xmm2, (lt)
0x290ee9ff38cc  170c  c509dbf5             vpand xmm14,xmm14,xmm5
0x290ee9ff38d0  1710  c441785bf6           vcvtdq2ps xmm14,xmm14
0x290ee9ff38d5  1715  c4c16059de           vmulps xmm3,xmm3,xmm14
0x290ee9ff38da  171a  c5781185d0fdffff     vmovups [rbp-0x230],xmm8
0x290ee9ff38e2  1722  c578108560fdffff     vmovups xmm8,[rbp-0x2a0]
0x290ee9ff38ea  172a  c5b858db             vaddps xmm3,xmm8,xmm3
0x290ee9ff38ee  172e  c4a17a7f9c0e30020000 vmovdqu [rsi+r9*1+0x230],xmm3
0x290ee9ff38f8  1738  c4c14859f6           vmulps xmm6,xmm6,xmm14
0x290ee9ff38fd  173d  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x290ee9ff3905  1745  c50858f6             vaddps xmm14,xmm14,xmm6
0x290ee9ff3909  1749  c4217a7fb40ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm14
0x290ee9ff3913  1753  c5e8c2f702           vcmpps xmm6,xmm2,xmm7, (le)
0x290ee9ff3918  1758  c540c2c101           vcmpps xmm8,xmm7,xmm1, (lt)
0x290ee9ff391d  175d  c4c149dbf0           vpand xmm6,xmm6,xmm8
0x290ee9ff3922  1762  c598c2ff01           vcmpps xmm7,xmm12,xmm7, (lt)
0x290ee9ff3927  1767  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x290ee9ff392b  176b  c5f85bff             vcvtdq2ps xmm7,xmm7
0x290ee9ff392f  176f  c5c9dbf7             vpand xmm6,xmm6,xmm7
0x290ee9ff3933  1773  c5f810bd10fdffff     vmovups xmm7,[rbp-0x2f0]
0x290ee9ff393b  177b  c5c858ff             vaddps xmm7,xmm6,xmm7
0x290ee9ff393f  177f  c4a17a7fbc0eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm7
0x290ee9ff3949  1789  c51059c6             vmulps xmm8,xmm13,xmm6
0x290ee9ff394d  178d  c57810a520fdffff     vmovups xmm12,[rbp-0x2e0]
0x290ee9ff3955  1795  c4413858e4           vaddps xmm12,xmm8,xmm12
0x290ee9ff395a  179a  c4217a7fa40e70010000 vmovdqu [rsi+r9*1+0x170],xmm12
0x290ee9ff3964  17a4  c53059c6             vmulps xmm8,xmm9,xmm6
0x290ee9ff3968  17a8  c578108d30fdffff     vmovups xmm9,[rbp-0x2d0]
0x290ee9ff3970  17b0  c4413858c9           vaddps xmm9,xmm8,xmm9
0x290ee9ff3975  17b5  c4217a7f8c0e30010000 vmovdqu [rsi+r9*1+0x130],xmm9
0x290ee9ff397f  17bf  c5f859c6             vmulps xmm0,xmm0,xmm6
0x290ee9ff3983  17c3  c578108540fdffff     vmovups xmm8,[rbp-0x2c0]
0x290ee9ff398b  17cb  c4c17858c0           vaddps xmm0,xmm0,xmm8
0x290ee9ff3990  17d0  c4a17a7f840ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm0
0x290ee9ff399a  17da  c5d859e6             vmulps xmm4,xmm4,xmm6
0x290ee9ff399e  17de  c5f810b550fdffff     vmovups xmm6,[rbp-0x2b0]
0x290ee9ff39a6  17e6  c5c858e4             vaddps xmm4,xmm6,xmm4
0x290ee9ff39aa  17ea  c4a17a7fa40eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm4
0x290ee9ff39b4  17f4  83c240               addl rdx,0x40
0x290ee9ff39b7  17f7  4183c7ff             addl r15,0xff
0x290ee9ff39bb  17fb  0f853ffaffff         jnz 0x290ee9ff3400  <+0x1240>
0x290ee9ff39c1  1801  c57928eb             vmovapd xmm13,xmm3
0x290ee9ff39c5  1805  c5f8109de0fdffff     vmovups xmm3,[rbp-0x220]
0x290ee9ff39cd  180d  c5f810b550fcffff     vmovups xmm6,[rbp-0x3b0]
0x290ee9ff39d5  1815  c5f8118540fdffff     vmovups [rbp-0x2c0],xmm0
0x290ee9ff39dd  181d  c5f8108540fcffff     vmovups xmm0,[rbp-0x3c0]
0x290ee9ff39e5  1825  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x290ee9ff39ed  182d  c578108d30fcffff     vmovups xmm9,[rbp-0x3d0]
0x290ee9ff39f5  1835  c57811a520fdffff     vmovups [rbp-0x2e0],xmm12
0x290ee9ff39fd  183d  c4417928e2           vmovapd xmm12,xmm10
0x290ee9ff3a02  1842  c578109520fcffff     vmovups xmm10,[rbp-0x3e0]
0x290ee9ff3a0a  184a  c5f811a550fdffff     vmovups [rbp-0x2b0],xmm4
0x290ee9ff3a12  1852  c5f810a510fcffff     vmovups xmm4,[rbp-0x3f0]
0x290ee9ff3a1a  185a  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x290ee9ff3a22  1862  c5f810bd00fcffff     vmovups xmm7,[rbp-0x400]
0x290ee9ff3a2a  186a  c5781085f0fbffff     vmovups xmm8,[rbp-0x410]
0x290ee9ff3a32  1872  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x290ee9ff3a3a  187a  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x290ee9ff3a42  1882  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x290ee9ff3a4a  188a  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x290ee9ff3a52  1892  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x290ee9ff3a5a  189a  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x290ee9ff3a62  18a2  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x290ee9ff3a6a  18aa  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x290ee9ff3a72  18b2  c578119d90fdffff     vmovups [rbp-0x270],xmm11
0x290ee9ff3a7a  18ba  c57811a580fdffff     vmovups [rbp-0x280],xmm12
0x290ee9ff3a82  18c2  c57811b570fdffff     vmovups [rbp-0x290],xmm14
0x290ee9ff3a8a  18ca  c57811ad60fdffff     vmovups [rbp-0x2a0],xmm13
0x290ee9ff3a92  18d2  85c9                 testl rcx,rcx
0x290ee9ff3a94  18d4  0f850e000000         jnz 0x290ee9ff3aa8  <+0x18e8>
0x290ee9ff3a9a  18da  448bbdf0fdffff       movl r15,[rbp-0x210]
0x290ee9ff3aa1  18e1  33c0                 xorl rax,rax
0x290ee9ff3aa3  18e3  e94e080000           jmp 0x290ee9ff42f6  <+0x2136>
0x290ee9ff3aa8  18e8  448bb590feffff       movl r14,[rbp-0x170]
0x290ee9ff3aaf  18ef  458d5ef0             leal r11,[r14-0x10]
0x290ee9ff3ab3  18f3  458be3               movl r12,r11
0x290ee9ff3ab6  18f6  33c0                 xorl rax,rax
0x290ee9ff3ab8  18f8  453bf3               cmpl r14,r11
0x290ee9ff3abb  18fb  440f42e0             cmovcl r12,rax
0x290ee9ff3abf  18ff  458d5c2410           leal r11,[r12+0x10]
0x290ee9ff3ac4  1904  448bbdf0fdffff       movl r15,[rbp-0x210]
0x290ee9ff3acb  190b  453bfb               cmpl r15,r11
0x290ee9ff3ace  190e  0f8222080000         jc 0x290ee9ff42f6  <+0x2136>
0x290ee9ff3ad4  1914  8b9df8fdffff         movl rbx,[rbp-0x208]
0x290ee9ff3ada  191a  413bdb               cmpl rbx,r11
0x290ee9ff3add  191d  0f8213080000         jc 0x290ee9ff42f6  <+0x2136>
0x290ee9ff3ae3  1923  448b9d00feffff       movl r11,[rbp-0x200]
0x290ee9ff3aea  192a  438d14a3             leal rdx,[r11+r12*4]
0x290ee9ff3aee  192e  448b8508feffff       movl r8,[rbp-0x1f8]
0x290ee9ff3af5  1935  438d04a0             leal rax,[r8+r12*4]
0x290ee9ff3af9  1939  8bbd10feffff         movl rdi,[rbp-0x1f0]
0x290ee9ff3aff  193f  468d1ca7             leal r11,[rdi+r12*4]
0x290ee9ff3b03  1943  448bbd18feffff       movl r15,[rbp-0x1e8]
0x290ee9ff3b0a  194a  438d1ca7             leal rbx,[r15+r12*4]
0x290ee9ff3b0e  194e  4529e6               subl r14,r12
0x290ee9ff3b11  1951  4183fe10             cmpl r14,0x10
0x290ee9ff3b15  1955  0f8419020000         jz 0x290ee9ff3d34  <+0x1b74>
0x290ee9ff3b1b  195b  c441796ef6           vmovd xmm14,r14
0x290ee9ff3b20  1960  c4417970f600         vpshufd xmm14,xmm14,0x0
0x290ee9ff3b26  1966  49ba0c0000000d000000 REX.W movq r10,0xd0000000c
0x290ee9ff3b30  1970  c441f96eea           vmovq xmm13,r10
0x290ee9ff3b35  1975  49ba0e0000000f000000 REX.W movq r10,0xf0000000e
0x290ee9ff3b3f  197f  c4439122ea01         vpinsrq xmm13,xmm13,r10,0x1
0x290ee9ff3b45  1985  c4417928de           vmovapd xmm11,xmm14
0x290ee9ff3b4a  198a  c442213fdd           vpmaxud xmm11,xmm11,xmm13
0x290ee9ff3b4f  198f  c4412176dd           vpcmpeqd xmm11,xmm11,xmm13
0x290ee9ff3b54  1994  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3b59  1999  c44121efdf           vpxor xmm11,xmm11,xmm15
0x290ee9ff3b5e  199e  458be6               movl r12,r14
0x290ee9ff3b61  19a1  442be1               subl r12,rcx
0x290ee9ff3b64  19a4  c441796eec           vmovd xmm13,r12
0x290ee9ff3b69  19a9  c4417970ed00         vpshufd xmm13,xmm13,0x0
0x290ee9ff3b6f  19af  49ba0d0000000e000000 REX.W movq r10,0xe0000000d
0x290ee9ff3b79  19b9  c441f96ee2           vmovq xmm12,r10
0x290ee9ff3b7e  19be  49ba0f00000010000000 REX.W movq r10,0x100000000f
0x290ee9ff3b88  19c8  c4439922e201         vpinsrq xmm12,xmm12,r10,0x1
0x290ee9ff3b8e  19ce  c442193fe5           vpmaxud xmm12,xmm12,xmm13
0x290ee9ff3b93  19d3  c4411976e5           vpcmpeqd xmm12,xmm12,xmm13
0x290ee9ff3b98  19d8  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3b9d  19dd  c44119efe7           vpxor xmm12,xmm12,xmm15
0x290ee9ff3ba2  19e2  c44121dbdc           vpand xmm11,xmm11,xmm12
0x290ee9ff3ba7  19e7  c521dbdd             vpand xmm11,xmm11,xmm5
0x290ee9ff3bab  19eb  c441785bdb           vcvtdq2ps xmm11,xmm11
0x290ee9ff3bb0  19f0  c4217a7f5c0e70       vmovdqu [rsi+r9*1+0x70],xmm11
0x290ee9ff3bb7  19f7  49ba0800000009000000 REX.W movq r10,0x900000008
0x290ee9ff3bc1  1a01  c441f96eda           vmovq xmm11,r10
0x290ee9ff3bc6  1a06  49ba0a0000000b000000 REX.W movq r10,0xb0000000a
0x290ee9ff3bd0  1a10  c443a122da01         vpinsrq xmm11,xmm11,r10,0x1
0x290ee9ff3bd6  1a16  c4417928e6           vmovapd xmm12,xmm14
0x290ee9ff3bdb  1a1b  c442193fe3           vpmaxud xmm12,xmm12,xmm11
0x290ee9ff3be0  1a20  c4411976e3           vpcmpeqd xmm12,xmm12,xmm11
0x290ee9ff3be5  1a25  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3bea  1a2a  c44119efe7           vpxor xmm12,xmm12,xmm15
0x290ee9ff3bef  1a2f  49ba090000000a000000 REX.W movq r10,0xa00000009
0x290ee9ff3bf9  1a39  c441f96eda           vmovq xmm11,r10
0x290ee9ff3bfe  1a3e  49ba0b0000000c000000 REX.W movq r10,0xc0000000b
0x290ee9ff3c08  1a48  c443a122da01         vpinsrq xmm11,xmm11,r10,0x1
0x290ee9ff3c0e  1a4e  c442213fdd           vpmaxud xmm11,xmm11,xmm13
0x290ee9ff3c13  1a53  c4412176dd           vpcmpeqd xmm11,xmm11,xmm13
0x290ee9ff3c18  1a58  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3c1d  1a5d  c44121efdf           vpxor xmm11,xmm11,xmm15
0x290ee9ff3c22  1a62  c44119dbdb           vpand xmm11,xmm12,xmm11
0x290ee9ff3c27  1a67  c521dbdd             vpand xmm11,xmm11,xmm5
0x290ee9ff3c2b  1a6b  c441785bdb           vcvtdq2ps xmm11,xmm11
0x290ee9ff3c30  1a70  c4217a7f5c0e60       vmovdqu [rsi+r9*1+0x60],xmm11
0x290ee9ff3c37  1a77  49ba0400000005000000 REX.W movq r10,0x500000004
0x290ee9ff3c41  1a81  c441f96eda           vmovq xmm11,r10
0x290ee9ff3c46  1a86  49ba0600000007000000 REX.W movq r10,0x700000006
0x290ee9ff3c50  1a90  c443a122da01         vpinsrq xmm11,xmm11,r10,0x1
0x290ee9ff3c56  1a96  c442093ff3           vpmaxud xmm14,xmm14,xmm11
0x290ee9ff3c5b  1a9b  c4410976f3           vpcmpeqd xmm14,xmm14,xmm11
0x290ee9ff3c60  1aa0  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3c65  1aa5  c44109eff7           vpxor xmm14,xmm14,xmm15
0x290ee9ff3c6a  1aaa  49ba0500000006000000 REX.W movq r10,0x600000005
0x290ee9ff3c74  1ab4  c441f96eda           vmovq xmm11,r10
0x290ee9ff3c79  1ab9  49ba0700000008000000 REX.W movq r10,0x800000007
0x290ee9ff3c83  1ac3  c443a122da01         vpinsrq xmm11,xmm11,r10,0x1
0x290ee9ff3c89  1ac9  c442213fdd           vpmaxud xmm11,xmm11,xmm13
0x290ee9ff3c8e  1ace  c4412176dd           vpcmpeqd xmm11,xmm11,xmm13
0x290ee9ff3c93  1ad3  c4410176ff           vpcmpeqd xmm15,xmm15,xmm15
0x290ee9ff3c98  1ad8  c44121efdf           vpxor xmm11,xmm11,xmm15
0x290ee9ff3c9d  1add  c44109dbdb           vpand xmm11,xmm14,xmm11
0x290ee9ff3ca2  1ae2  c521dbdd             vpand xmm11,xmm11,xmm5
0x290ee9ff3ca6  1ae6  c441785bdb           vcvtdq2ps xmm11,xmm11
0x290ee9ff3cab  1aeb  c4217a7f5c0e50       vmovdqu [rsi+r9*1+0x50],xmm11
0x290ee9ff3cb2  1af2  443bf1               cmpl r14,rcx
0x290ee9ff3cb5  1af5  0f94c1               setzl cl
0x290ee9ff3cb8  1af8  0fb6c9               movzxbl rcx,rcx
0x290ee9ff3cbb  1afb  c5796ed9             vmovd xmm11,rcx
0x290ee9ff3cbf  1aff  c4417970db00         vpshufd xmm11,xmm11,0x0
0x290ee9ff3cc5  1b05  33c9                 xorl rcx,rcx
0x290ee9ff3cc7  1b07  4183fe01             cmpl r14,0x1
0x290ee9ff3ccb  1b0b  0f97c1               setal cl
0x290ee9ff3cce  1b0e  4533ff               xorl r15,r15
0x290ee9ff3cd1  1b11  4183fc02             cmpl r12,0x2
0x290ee9ff3cd5  1b15  410f92c7             setcl r15l
0x290ee9ff3cd9  1b19  4423f9               andl r15,rcx
0x290ee9ff3cdc  1b1c  c4432122df01         vpinsrd xmm11,xmm11,r15,0x1
0x290ee9ff3ce2  1b22  4533ff               xorl r15,r15
0x290ee9ff3ce5  1b25  4183fe02             cmpl r14,0x2
0x290ee9ff3ce9  1b29  410f97c7             setal r15l
0x290ee9ff3ced  1b2d  33c9                 xorl rcx,rcx
0x290ee9ff3cef  1b2f  4183fc03             cmpl r12,0x3
0x290ee9ff3cf3  1b33  0f92c1               setcl cl
0x290ee9ff3cf6  1b36  4123cf               andl rcx,r15
0x290ee9ff3cf9  1b39  c4632122d902         vpinsrd xmm11,xmm11,rcx,0x2
0x290ee9ff3cff  1b3f  4533ff               xorl r15,r15
0x290ee9ff3d02  1b42  4183fe03             cmpl r14,0x3
0x290ee9ff3d06  1b46  410f97c7             setal r15l
0x290ee9ff3d0a  1b4a  4183fc04             cmpl r12,0x4
0x290ee9ff3d0e  1b4e  410f92c4             setcl r12l
0x290ee9ff3d12  1b52  450fb6e4             movzxbl r12,r12
0x290ee9ff3d16  1b56  4523e7               andl r12,r15
0x290ee9ff3d19  1b59  c4432122dc03         vpinsrd xmm11,xmm11,r12,0x3
0x290ee9ff3d1f  1b5f  c441785bdb           vcvtdq2ps xmm11,xmm11
0x290ee9ff3d24  1b64  c4217a7f5c0e40       vmovdqu [rsi+r9*1+0x40],xmm11
0x290ee9ff3d2b  1b6b  458d6140             leal r12,[r9+0x40]
0x290ee9ff3d2f  1b6f  e908000000           jmp 0x290ee9ff3d3c  <+0x1b7c>
0x290ee9ff3d34  1b74  448d248da8311600     leal r12,[rcx*4+0x1631a8]
0x290ee9ff3d3c  1b7c  c57a6f1c1e           vmovdqu xmm11,[rsi+rbx*1]
0x290ee9ff3d41  1b81  c4217a6f241e         vmovdqu xmm12,[rsi+r11*1]
0x290ee9ff3d47  1b87  c57a6f2c06           vmovdqu xmm13,[rsi+rax*1]
0x290ee9ff3d4c  1b8c  c57810b540feffff     vmovups xmm14,[rbp-0x1c0]
0x290ee9ff3d54  1b94  c441085cc5           vsubps xmm8,xmm14,xmm13
0x290ee9ff3d59  1b99  c4217a6f3426         vmovdqu xmm14,[rsi+r12*1]
0x290ee9ff3d5f  1b9f  c5fa6f0416           vmovdqu xmm0,[rsi+rdx*1]
0x290ee9ff3d64  1ba4  c57811ad20feffff     vmovups [rbp-0x1e0],xmm13
0x290ee9ff3d6c  1bac  c578108d50feffff     vmovups xmm9,[rbp-0x1b0]
0x290ee9ff3d74  1bb4  c5305ce8             vsubps xmm13,xmm9,xmm0
0x290ee9ff3d78  1bb8  c4411059cd           vmulps xmm9,xmm13,xmm13
0x290ee9ff3d7d  1bbd  c5f8118530feffff     vmovups [rbp-0x1d0],xmm0
0x290ee9ff3d85  1bc5  c4c13859c0           vmulps xmm0,xmm8,xmm8
0x290ee9ff3d8a  1bca  c5b058c0             vaddps xmm0,xmm9,xmm0
0x290ee9ff3d8e  1bce  c578c2ca01           vcmpps xmm9,xmm0,xmm2, (lt)
0x290ee9ff3d93  1bd3  c531dbcd             vpand xmm9,xmm9,xmm5
0x290ee9ff3d97  1bd7  c441785bc9           vcvtdq2ps xmm9,xmm9
0x290ee9ff3d9c  1bdc  c4410859c9           vmulps xmm9,xmm14,xmm9
0x290ee9ff3da1  1be1  c4413859c1           vmulps xmm8,xmm8,xmm9
0x290ee9ff3da6  1be6  c4c14858f0           vaddps xmm6,xmm6,xmm8
0x290ee9ff3dab  1beb  c4a17a7fb40e00020000 vmovdqu [rsi+r9*1+0x200],xmm6
0x290ee9ff3db5  1bf5  c4411059c1           vmulps xmm8,xmm13,xmm9
0x290ee9ff3dba  1bfa  c4c16058d8           vaddps xmm3,xmm3,xmm8
0x290ee9ff3dbf  1bff  c4a17a7f9c0ec0010000 vmovdqu [rsi+r9*1+0x1c0],xmm3
0x290ee9ff3dc9  1c09  c568c2c002           vcmpps xmm8,xmm2,xmm0, (le)
0x290ee9ff3dce  1c0e  c578c2c901           vcmpps xmm9,xmm0,xmm1, (lt)
0x290ee9ff3dd3  1c13  c44139dbc1           vpand xmm8,xmm8,xmm9
0x290ee9ff3dd8  1c18  c44131efc9           vpxor xmm9,xmm9,xmm9
0x290ee9ff3ddd  1c1d  c5b0c2c001           vcmpps xmm0,xmm9,xmm0, (lt)
0x290ee9ff3de2  1c22  c5f9dbc5             vpand xmm0,xmm0,xmm5
0x290ee9ff3de6  1c26  c5f85bc0             vcvtdq2ps xmm0,xmm0
0x290ee9ff3dea  1c2a  c5b9dbc0             vpand xmm0,xmm8,xmm0
0x290ee9ff3dee  1c2e  c58859c0             vmulps xmm0,xmm14,xmm0
0x290ee9ff3df2  1c32  c5f858ff             vaddps xmm7,xmm0,xmm7
0x290ee9ff3df6  1c36  c4a17a7fbc0e80010000 vmovdqu [rsi+r9*1+0x180],xmm7
0x290ee9ff3e00  1c40  c51859c0             vmulps xmm8,xmm12,xmm0
0x290ee9ff3e04  1c44  c5b858e4             vaddps xmm4,xmm8,xmm4
0x290ee9ff3e08  1c48  c4a17a7fa40e40010000 vmovdqu [rsi+r9*1+0x140],xmm4
0x290ee9ff3e12  1c52  c52059c0             vmulps xmm8,xmm11,xmm0
0x290ee9ff3e16  1c56  c4413858c2           vaddps xmm8,xmm8,xmm10
0x290ee9ff3e1b  1c5b  c4217a7f840e00010000 vmovdqu [rsi+r9*1+0x100],xmm8
0x290ee9ff3e25  1c65  c578109520feffff     vmovups xmm10,[rbp-0x1e0]
0x290ee9ff3e2d  1c6d  c52859d0             vmulps xmm10,xmm10,xmm0
0x290ee9ff3e31  1c71  c578109d30fcffff     vmovups xmm11,[rbp-0x3d0]
0x290ee9ff3e39  1c79  c4412858d3           vaddps xmm10,xmm10,xmm11
0x290ee9ff3e3e  1c7e  c4217a7f940ec0000000 vmovdqu [rsi+r9*1+0xc0],xmm10
0x290ee9ff3e48  1c88  c578109d30feffff     vmovups xmm11,[rbp-0x1d0]
0x290ee9ff3e50  1c90  c5a059c0             vmulps xmm0,xmm11,xmm0
0x290ee9ff3e54  1c94  c57810a540fcffff     vmovups xmm12,[rbp-0x3c0]
0x290ee9ff3e5c  1c9c  c59858c0             vaddps xmm0,xmm12,xmm0
0x290ee9ff3e60  1ca0  c4a17a7f840e80000000 vmovdqu [rsi+r9*1+0x80],xmm0
0x290ee9ff3e6a  1caa  c57a6f5c1e10         vmovdqu xmm11,[rsi+rbx*1+0x10]
0x290ee9ff3e70  1cb0  c4217a6f641e10       vmovdqu xmm12,[rsi+r11*1+0x10]
0x290ee9ff3e77  1cb7  c57a6f6c0610         vmovdqu xmm13,[rsi+rax*1+0x10]
0x290ee9ff3e7d  1cbd  c57810b540feffff     vmovups xmm14,[rbp-0x1c0]
0x290ee9ff3e85  1cc5  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x290ee9ff3e8d  1ccd  c4c1085cc5           vsubps xmm0,xmm14,xmm13
0x290ee9ff3e92  1cd2  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x290ee9ff3e9a  1cda  c4a17a6f5c2610       vmovdqu xmm3,[rsi+r12*1+0x10]
0x290ee9ff3ea1  1ce1  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x290ee9ff3ea9  1ce9  c5fa6f641610         vmovdqu xmm4,[rsi+rdx*1+0x10]
0x290ee9ff3eaf  1cef  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x290ee9ff3eb7  1cf7  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x290ee9ff3ebf  1cff  c5f810b550feffff     vmovups xmm6,[rbp-0x1b0]
0x290ee9ff3ec7  1d07  c5c85cfc             vsubps xmm7,xmm6,xmm4
0x290ee9ff3ecb  1d0b  c578118520fcffff     vmovups [rbp-0x3e0],xmm8
0x290ee9ff3ed3  1d13  c54059c7             vmulps xmm8,xmm7,xmm7
0x290ee9ff3ed7  1d17  c578119530fcffff     vmovups [rbp-0x3d0],xmm10
0x290ee9ff3edf  1d1f  c57859d0             vmulps xmm10,xmm0,xmm0
0x290ee9ff3ee3  1d23  c4413858c2           vaddps xmm8,xmm8,xmm10
0x290ee9ff3ee8  1d28  c538c2d201           vcmpps xmm10,xmm8,xmm2, (lt)
0x290ee9ff3eed  1d2d  c529dbd5             vpand xmm10,xmm10,xmm5
0x290ee9ff3ef1  1d31  c441785bd2           vcvtdq2ps xmm10,xmm10
0x290ee9ff3ef6  1d36  c4416059d2           vmulps xmm10,xmm3,xmm10
0x290ee9ff3efb  1d3b  c4c17859c2           vmulps xmm0,xmm0,xmm10
0x290ee9ff3f00  1d40  c57810b5b0fcffff     vmovups xmm14,[rbp-0x350]
0x290ee9ff3f08  1d48  c58858c0             vaddps xmm0,xmm14,xmm0
0x290ee9ff3f0c  1d4c  c4a17a7f840e10020000 vmovdqu [rsi+r9*1+0x210],xmm0
0x290ee9ff3f16  1d56  c4c14059fa           vmulps xmm7,xmm7,xmm10
0x290ee9ff3f1b  1d5b  c5781095f0fbffff     vmovups xmm10,[rbp-0x410]
0x290ee9ff3f23  1d63  c5a858ff             vaddps xmm7,xmm10,xmm7
0x290ee9ff3f27  1d67  c4a17a7fbc0ed0010000 vmovdqu [rsi+r9*1+0x1d0],xmm7
0x290ee9ff3f31  1d71  c44168c2d002         vcmpps xmm10,xmm2,xmm8, (le)
0x290ee9ff3f37  1d77  c538c2f101           vcmpps xmm14,xmm8,xmm1, (lt)
0x290ee9ff3f3c  1d7c  c44129dbd6           vpand xmm10,xmm10,xmm14
0x290ee9ff3f41  1d81  c44130c2c001         vcmpps xmm8,xmm9,xmm8, (lt)
0x290ee9ff3f47  1d87  c539dbc5             vpand xmm8,xmm8,xmm5
0x290ee9ff3f4b  1d8b  c441785bc0           vcvtdq2ps xmm8,xmm8
0x290ee9ff3f50  1d90  c44129dbc0           vpand xmm8,xmm10,xmm8
0x290ee9ff3f55  1d95  c4c16059d8           vmulps xmm3,xmm3,xmm8
0x290ee9ff3f5a  1d9a  c5781085c0feffff     vmovups xmm8,[rbp-0x140]
0x290ee9ff3f62  1da2  c4416058c0           vaddps xmm8,xmm3,xmm8
0x290ee9ff3f67  1da7  c4217a7f840e90010000 vmovdqu [rsi+r9*1+0x190],xmm8
0x290ee9ff3f71  1db1  c51859d3             vmulps xmm10,xmm12,xmm3
0x290ee9ff3f75  1db5  c57810a5b0feffff     vmovups xmm12,[rbp-0x150]
0x290ee9ff3f7d  1dbd  c4412858d4           vaddps xmm10,xmm10,xmm12
0x290ee9ff3f82  1dc2  c4217a7f940e50010000 vmovdqu [rsi+r9*1+0x150],xmm10
0x290ee9ff3f8c  1dcc  c52059db             vmulps xmm11,xmm11,xmm3
0x290ee9ff3f90  1dd0  c57810a5e0fcffff     vmovups xmm12,[rbp-0x320]
0x290ee9ff3f98  1dd8  c4412058dc           vaddps xmm11,xmm11,xmm12
0x290ee9ff3f9d  1ddd  c4217a7f9c0e10010000 vmovdqu [rsi+r9*1+0x110],xmm11
0x290ee9ff3fa7  1de7  c51059e3             vmulps xmm12,xmm13,xmm3
0x290ee9ff3fab  1deb  c57810add0fcffff     vmovups xmm13,[rbp-0x330]
0x290ee9ff3fb3  1df3  c4411858e5           vaddps xmm12,xmm12,xmm13
0x290ee9ff3fb8  1df8  c4217a7fa40ed0000000 vmovdqu [rsi+r9*1+0xd0],xmm12
0x290ee9ff3fc2  1e02  c5d859db             vmulps xmm3,xmm4,xmm3
0x290ee9ff3fc6  1e06  c5f810a5c0fcffff     vmovups xmm4,[rbp-0x340]
0x290ee9ff3fce  1e0e  c5d858db             vaddps xmm3,xmm4,xmm3
0x290ee9ff3fd2  1e12  c4a17a7f9c0e90000000 vmovdqu [rsi+r9*1+0x90],xmm3
0x290ee9ff3fdc  1e1c  c4a17a6f641e20       vmovdqu xmm4,[rsi+r11*1+0x20]
0x290ee9ff3fe3  1e23  c57a6f6c1e20         vmovdqu xmm13,[rsi+rbx*1+0x20]
0x290ee9ff3fe9  1e29  c57a6f741620         vmovdqu xmm14,[rsi+rdx*1+0x20]
0x290ee9ff3fef  1e2f  c5f81185b0fcffff     vmovups [rbp-0x350],xmm0
0x290ee9ff3ff7  1e37  c4c1485cc6           vsubps xmm0,xmm6,xmm14
0x290ee9ff3ffc  1e3c  c5f8119dc0fcffff     vmovups [rbp-0x340],xmm3
0x290ee9ff4004  1e44  c4a17a6f5c2620       vmovdqu xmm3,[rsi+r12*1+0x20]
0x290ee9ff400b  1e4b  c5f811bdf0fbffff     vmovups [rbp-0x410],xmm7
0x290ee9ff4013  1e53  c5f859f8             vmulps xmm7,xmm0,xmm0
0x290ee9ff4017  1e57  c5781185c0feffff     vmovups [rbp-0x140],xmm8
0x290ee9ff401f  1e5f  c57a6f440620         vmovdqu xmm8,[rsi+rax*1+0x20]
0x290ee9ff4025  1e65  c5781195b0feffff     vmovups [rbp-0x150],xmm10
0x290ee9ff402d  1e6d  c578119de0fcffff     vmovups [rbp-0x320],xmm11
0x290ee9ff4035  1e75  c578109540feffff     vmovups xmm10,[rbp-0x1c0]
0x290ee9ff403d  1e7d  c441285cd8           vsubps xmm11,xmm10,xmm8
0x290ee9ff4042  1e82  c57811a5d0fcffff     vmovups [rbp-0x330],xmm12
0x290ee9ff404a  1e8a  c4412059e3           vmulps xmm12,xmm11,xmm11
0x290ee9ff404f  1e8f  c4c14058fc           vaddps xmm7,xmm7,xmm12
0x290ee9ff4054  1e94  c540c2e201           vcmpps xmm12,xmm7,xmm2, (lt)
0x290ee9ff4059  1e99  c519dbe5             vpand xmm12,xmm12,xmm5
0x290ee9ff405d  1e9d  c441785be4           vcvtdq2ps xmm12,xmm12
0x290ee9ff4062  1ea2  c4416059e4           vmulps xmm12,xmm3,xmm12
0x290ee9ff4067  1ea7  c4c17859c4           vmulps xmm0,xmm0,xmm12
0x290ee9ff406c  1eac  c5f810b5d0fdffff     vmovups xmm6,[rbp-0x230]
0x290ee9ff4074  1eb4  c5c858f0             vaddps xmm6,xmm6,xmm0
0x290ee9ff4078  1eb8  c4a17a7fb40ee0010000 vmovdqu [rsi+r9*1+0x1e0],xmm6
0x290ee9ff4082  1ec2  c4c12059c4           vmulps xmm0,xmm11,xmm12
0x290ee9ff4087  1ec7  c578109dc0fdffff     vmovups xmm11,[rbp-0x240]
0x290ee9ff408f  1ecf  c5a058c0             vaddps xmm0,xmm11,xmm0
0x290ee9ff4093  1ed3  c4a17a7f840e20020000 vmovdqu [rsi+r9*1+0x220],xmm0
0x290ee9ff409d  1edd  c568c2df02           vcmpps xmm11,xmm2,xmm7, (le)
0x290ee9ff40a2  1ee2  c540c2e101           vcmpps xmm12,xmm7,xmm1, (lt)
0x290ee9ff40a7  1ee7  c44121dbdc           vpand xmm11,xmm11,xmm12
0x290ee9ff40ac  1eec  c5b0c2ff01           vcmpps xmm7,xmm9,xmm7, (lt)
0x290ee9ff40b1  1ef1  c5c1dbfd             vpand xmm7,xmm7,xmm5
0x290ee9ff40b5  1ef5  c5f85bff             vcvtdq2ps xmm7,xmm7
0x290ee9ff40b9  1ef9  c5a1dbff             vpand xmm7,xmm11,xmm7
0x290ee9ff40bd  1efd  c5e059df             vmulps xmm3,xmm3,xmm7
0x290ee9ff40c1  1f01  c5f810bd80fdffff     vmovups xmm7,[rbp-0x280]
0x290ee9ff40c9  1f09  c5e058ff             vaddps xmm7,xmm3,xmm7
0x290ee9ff40cd  1f0d  c4a17a7fbc0ea0010000 vmovdqu [rsi+r9*1+0x1a0],xmm7
0x290ee9ff40d7  1f17  c50859db             vmulps xmm11,xmm14,xmm3
0x290ee9ff40db  1f1b  c57810a5b0fdffff     vmovups xmm12,[rbp-0x250]
0x290ee9ff40e3  1f23  c4411858db           vaddps xmm11,xmm12,xmm11
0x290ee9ff40e8  1f28  c4217a7f9c0ea0000000 vmovdqu [rsi+r9*1+0xa0],xmm11
0x290ee9ff40f2  1f32  c53859c3             vmulps xmm8,xmm8,xmm3
0x290ee9ff40f6  1f36  c57810a5d0feffff     vmovups xmm12,[rbp-0x130]
0x290ee9ff40fe  1f3e  c4413858c4           vaddps xmm8,xmm8,xmm12
0x290ee9ff4103  1f43  c4217a7f840ee0000000 vmovdqu [rsi+r9*1+0xe0],xmm8
0x290ee9ff410d  1f4d  c51059e3             vmulps xmm12,xmm13,xmm3
0x290ee9ff4111  1f51  c57810ada0fdffff     vmovups xmm13,[rbp-0x260]
0x290ee9ff4119  1f59  c4411858e5           vaddps xmm12,xmm12,xmm13
0x290ee9ff411e  1f5e  c4217a7fa40e20010000 vmovdqu [rsi+r9*1+0x120],xmm12
0x290ee9ff4128  1f68  c5d859db             vmulps xmm3,xmm4,xmm3
0x290ee9ff412c  1f6c  c5f810a590fdffff     vmovups xmm4,[rbp-0x270]
0x290ee9ff4134  1f74  c5e058dc             vaddps xmm3,xmm3,xmm4
0x290ee9ff4138  1f78  c4a17a7f9c0e60010000 vmovdqu [rsi+r9*1+0x160],xmm3
0x290ee9ff4142  1f82  c5fa6f641e30         vmovdqu xmm4,[rsi+rbx*1+0x30]
0x290ee9ff4148  1f88  c4217a6f6c1e30       vmovdqu xmm13,[rsi+r11*1+0x30]
0x290ee9ff414f  1f8f  c57a6f740630         vmovdqu xmm14,[rsi+rax*1+0x30]
0x290ee9ff4155  1f95  c5f81185c0fdffff     vmovups [rbp-0x240],xmm0
0x290ee9ff415d  1f9d  c4c1285cc6           vsubps xmm0,xmm10,xmm14
0x290ee9ff4162  1fa2  c4217a6f542630       vmovdqu xmm10,[rsi+r12*1+0x30]
0x290ee9ff4169  1fa9  c5f8119d90fdffff     vmovups [rbp-0x270],xmm3
0x290ee9ff4171  1fb1  c5fa6f5c1630         vmovdqu xmm3,[rsi+rdx*1+0x30]
0x290ee9ff4177  1fb7  c5f811b5d0fdffff     vmovups [rbp-0x230],xmm6
0x290ee9ff417f  1fbf  c5f811bd80fdffff     vmovups [rbp-0x280],xmm7
0x290ee9ff4187  1fc7  c5f810b550feffff     vmovups xmm6,[rbp-0x1b0]
0x290ee9ff418f  1fcf  c5c85cfb             vsubps xmm7,xmm6,xmm3
0x290ee9ff4193  1fd3  c5c059f7             vmulps xmm6,xmm7,xmm7
0x290ee9ff4197  1fd7  c5781185d0feffff     vmovups [rbp-0x130],xmm8
0x290ee9ff419f  1fdf  c57859c0             vmulps xmm8,xmm0,xmm0
0x290ee9ff41a3  1fe3  c4c14858f0           vaddps xmm6,xmm6,xmm8
0x290ee9ff41a8  1fe8  c548c2c201           vcmpps xmm8,xmm6,xmm2, (lt)
0x290ee9ff41ad  1fed  c539dbc5             vpand xmm8,xmm8,xmm5
0x290ee9ff41b1  1ff1  c441785bc0           vcvtdq2ps xmm8,xmm8
0x290ee9ff41b6  1ff6  c4412859c0           vmulps xmm8,xmm10,xmm8
0x290ee9ff41bb  1ffb  c4c17859c0           vmulps xmm0,xmm0,xmm8
0x290ee9ff41c0  2000  c57811a5a0fdffff     vmovups [rbp-0x260],xmm12
0x290ee9ff41c8  2008  c57810a560fdffff     vmovups xmm12,[rbp-0x2a0]
0x290ee9ff41d0  2010  c51858e0             vaddps xmm12,xmm12,xmm0
0x290ee9ff41d4  2014  c4217a7fa40e30020000 vmovdqu [rsi+r9*1+0x230],xmm12
0x290ee9ff41de  201e  c4c14059c0           vmulps xmm0,xmm7,xmm8
0x290ee9ff41e3  2023  c5f810bd70fdffff     vmovups xmm7,[rbp-0x290]
0x290ee9ff41eb  202b  c5c058c0             vaddps xmm0,xmm7,xmm0
0x290ee9ff41ef  202f  c4a17a7f840ef0010000 vmovdqu [rsi+r9*1+0x1f0],xmm0
0x290ee9ff41f9  2039  c5e8c2fe02           vcmpps xmm7,xmm2,xmm6, (le)
0x290ee9ff41fe  203e  c548c2c101           vcmpps xmm8,xmm6,xmm1, (lt)
0x290ee9ff4203  2043  c4c141dbf8           vpand xmm7,xmm7,xmm8
0x290ee9ff4208  2048  c5b0c2f601           vcmpps xmm6,xmm9,xmm6, (lt)
0x290ee9ff420d  204d  c5c9dbf5             vpand xmm6,xmm6,xmm5
0x290ee9ff4211  2051  c5f85bf6             vcvtdq2ps xmm6,xmm6
0x290ee9ff4215  2055  c5c1dbf6             vpand xmm6,xmm7,xmm6
0x290ee9ff4219  2059  c5a859f6             vmulps xmm6,xmm10,xmm6
0x290ee9ff421d  205d  c578108d10fdffff     vmovups xmm9,[rbp-0x2f0]
0x290ee9ff4225  2065  c4c14858f9           vaddps xmm7,xmm6,xmm9
0x290ee9ff422a  206a  c4a17a7fbc0eb0010000 vmovdqu [rsi+r9*1+0x1b0],xmm7
0x290ee9ff4234  2074  c51059c6             vmulps xmm8,xmm13,xmm6
0x290ee9ff4238  2078  c578109520fdffff     vmovups xmm10,[rbp-0x2e0]
0x290ee9ff4240  2080  c4413858c2           vaddps xmm8,xmm8,xmm10
0x290ee9ff4245  2085  c4217a7f840e70010000 vmovdqu [rsi+r9*1+0x170],xmm8
0x290ee9ff424f  208f  c5d859e6             vmulps xmm4,xmm4,xmm6
0x290ee9ff4253  2093  c578108d30fdffff     vmovups xmm9,[rbp-0x2d0]
0x290ee9ff425b  209b  c4415858c9           vaddps xmm9,xmm4,xmm9
0x290ee9ff4260  20a0  c4217a7f8c0e30010000 vmovdqu [rsi+r9*1+0x130],xmm9
0x290ee9ff426a  20aa  c58859e6             vmulps xmm4,xmm14,xmm6
0x290ee9ff426e  20ae  c578109540fdffff     vmovups xmm10,[rbp-0x2c0]
0x290ee9ff4276  20b6  c4415858d2           vaddps xmm10,xmm4,xmm10
0x290ee9ff427b  20bb  c4217a7f940ef0000000 vmovdqu [rsi+r9*1+0xf0],xmm10
0x290ee9ff4285  20c5  c5e059de             vmulps xmm3,xmm3,xmm6
0x290ee9ff4289  20c9  c5f810b550fdffff     vmovups xmm6,[rbp-0x2b0]
0x290ee9ff4291  20d1  c5c858db             vaddps xmm3,xmm6,xmm3
0x290ee9ff4295  20d5  c4a17a7f9c0eb0000000 vmovdqu [rsi+r9*1+0xb0],xmm3
0x290ee9ff429f  20df  33c0                 xorl rax,rax
0x290ee9ff42a1  20e1  448bbdf0fdffff       movl r15,[rbp-0x210]
0x290ee9ff42a8  20e8  c5f811bd10fdffff     vmovups [rbp-0x2f0],xmm7
0x290ee9ff42b0  20f0  c578118520fdffff     vmovups [rbp-0x2e0],xmm8
0x290ee9ff42b8  20f8  c578118d30fdffff     vmovups [rbp-0x2d0],xmm9
0x290ee9ff42c0  2100  c578119540fdffff     vmovups [rbp-0x2c0],xmm10
0x290ee9ff42c8  2108  c5f8119d50fdffff     vmovups [rbp-0x2b0],xmm3
0x290ee9ff42d0  2110  c4417928ec           vmovapd xmm13,xmm12
0x290ee9ff42d5  2115  c57928f0             vmovapd xmm14,xmm0
0x290ee9ff42d9  2119  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x290ee9ff42e1  2121  c578119db0fdffff     vmovups [rbp-0x250],xmm11
0x290ee9ff42e9  2129  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x290ee9ff42f1  2131  e907020000           jmp 0x290ee9ff44fd  <+0x233d>
0x290ee9ff42f6  2136  448b9d20ffffff       movl r11,[rbp-0xe0]
0x290ee9ff42fd  213d  4183e30f             andl r11,0xf
0x290ee9ff4301  2141  448be1               movl r12,rcx
0x290ee9ff4304  2144  8bbd98feffff         movl rdi,[rbp-0x168]
0x290ee9ff430a  214a  3bf9                 cmpl rdi,rcx
0x290ee9ff430c  214c  440f42e7             cmovcl r12,rdi
0x290ee9ff4310  2150  4589e6               movl r14,r12
0x290ee9ff4313  2153  8b9da8feffff         movl rbx,[rbp-0x158]
0x290ee9ff4319  2159  4439e3               cmpl rbx,r12
0x290ee9ff431c  215c  440f42f3             cmovcl r14,rbx
0x290ee9ff4320  2160  458be6               movl r12,r14
0x290ee9ff4323  2163  453bde               cmpl r11,r14
0x290ee9ff4326  2166  450f42e3             cmovcl r12,r11
0x290ee9ff432a  216a  4585e4               testl r12,r12
0x290ee9ff432d  216d  0f8545000000         jnz 0x290ee9ff4378  <+0x21b8>
0x290ee9ff4333  2173  c5781185f0fbffff     vmovups [rbp-0x410],xmm8
0x290ee9ff433b  217b  c5f811bd00fcffff     vmovups [rbp-0x400],xmm7
0x290ee9ff4343  2183  c5f811a510fcffff     vmovups [rbp-0x3f0],xmm4
0x290ee9ff434b  218b  c578119520fcffff     vmovups [rbp-0x3e0],xmm10
0x290ee9ff4353  2193  c578118d30fcffff     vmovups [rbp-0x3d0],xmm9
0x290ee9ff435b  219b  c5f8119de0fdffff     vmovups [rbp-0x220],xmm3
0x290ee9ff4363  21a3  c5f811b550fcffff     vmovups [rbp-0x3b0],xmm6
0x290ee9ff436b  21ab  c5f8118540fcffff     vmovups [rbp-0x3c0],xmm0
0x290ee9ff4373  21b3  e985010000           jmp 0x290ee9ff44fd  <+0x233d>
0x290ee9ff4378  21b8  8b8de0feffff         movl rcx,[rbp-0x120]
0x290ee9ff437e  21be  81e1f0ffff1f         andl rcx,0x1ffffff0
0x290ee9ff4384  21c4  448b9d18ffffff       movl r11,[rbp-0xe8]
0x290ee9ff438b  21cb  458d1c8b             leal r11,[r11+rcx*4]
0x290ee9ff438f  21cf  448bb520ffffff       movl r14,[rbp-0xe0]
0x290ee9ff4396  21d6  4181e6f0ffff1f       andl r14,0x1ffffff0
0x290ee9ff439d  21dd  8b9d28ffffff         movl rbx,[rbp-0xd8]
0x290ee9ff43a3  21e3  468d34b3             leal r14,[rbx+r14*4]
0x290ee9ff43a7  21e7  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x290ee9ff43af  21ef  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x290ee9ff43b7  21f7  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x290ee9ff43bf  21ff  c5d857e4             vxorps xmm4,xmm4,xmm4
0x290ee9ff43c3  2203  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x290ee9ff43c7  2207  c5c972f619           vpslld xmm6,xmm6,25
0x290ee9ff43cc  220c  c5c972d602           vpsrld xmm6,xmm6,2
0x290ee9ff43d1  2211  418bdb               movl rbx,r11
0x290ee9ff43d4  2214  448b9de8feffff       movl r11,[rbp-0x118]
0x290ee9ff43db  221b  8b95f0feffff         movl rdx,[rbp-0x110]
0x290ee9ff43e1  2221  660f1f840000000000   nop
0x290ee9ff43ea  222a  660f1f840000000000   nop
0x290ee9ff43f3  2233  660f1f840000000000   nop
0x290ee9ff43fc  223c  0f1f4000             nop
0x290ee9ff4400  2240  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x290ee9ff4408  2248  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x290ee9ff4410  2250  493b65a0             REX.W cmpq rsp,[r13-0x60]
0x290ee9ff4414  2254  0f8627060000         jna 0x290ee9ff4a41  <+0x2881>
0x290ee9ff441a  225a  c5fa103c1e           vmovss xmm7,[rsi+rbx*1]
0x290ee9ff441f  225f  c5725cc7             vsubss xmm8,xmm1,xmm7
0x290ee9ff4423  2263  c4c13a59c8           vmulss xmm1,xmm8,xmm8
0x290ee9ff4428  2268  c4217a100c1e         vmovss xmm9,[rsi+r11*1]
0x290ee9ff442e  226e  c4416a5cd1           vsubss xmm10,xmm2,xmm9
0x290ee9ff4433  2273  c4c12a59d2           vmulss xmm2,xmm10,xmm10
0x290ee9ff4438  2278  c5ea58c9             vaddss xmm1,xmm2,xmm1
0x290ee9ff443c  227c  c5f82ec1             vucomiss xmm0,xmm1
0x290ee9ff4440  2280  0f8757000000         ja 0x290ee9ff449d  <+0x22dd>
0x290ee9ff4446  2286  c5f82ed9             vucomiss xmm3,xmm1
0x290ee9ff444a  228a  0f8675000000         jna 0x290ee9ff44c5  <+0x2305>
0x290ee9ff4450  2290  c5f82ecc             vucomiss xmm1,xmm4
0x290ee9ff4454  2294  0f866b000000         jna 0x290ee9ff44c5  <+0x2305>
0x290ee9ff445a  229a  c4e27918ff           vbroadcastss xmm7,xmm7
0x290ee9ff445f  229f  c4c34121f910         vinsertps xmm7,xmm7,xmm9,0x10
0x290ee9ff4465  22a5  c57a100416           vmovss xmm8,[rsi+rdx*1]
0x290ee9ff446a  22aa  c4c34121f820         vinsertps xmm7,xmm7,xmm8,0x20
0x290ee9ff4470  22b0  c4217a100436         vmovss xmm8,[rsi+r14*1]
0x290ee9ff4476  22b6  c4c34121f830         vinsertps xmm7,xmm7,xmm8,0x30
0x290ee9ff447c  22bc  c5d058ef             vaddps xmm5,xmm5,xmm7
0x290ee9ff4480  22c0  c5ca58bd68ffffff     vaddss xmm7,xmm6,[rbp-0x98]
0x290ee9ff4488  22c8  c5fb11bd40ffffff     vmovsd [rbp-0xc0],xmm7
0x290ee9ff4490  22d0  c5fb11bd68ffffff     vmovsd [rbp-0x98],xmm7
0x290ee9ff4498  22d8  e928000000           jmp 0x290ee9ff44c5  <+0x2305>
0x290ee9ff449d  22dd  c5aa58bd30ffffff     vaddss xmm7,xmm10,[rbp-0xd0]
0x290ee9ff44a5  22e5  c53a588560ffffff     vaddss xmm8,xmm8,[rbp-0xa0]
0x290ee9ff44ad  22ed  c5fb11bd30ffffff     vmovsd [rbp-0xd0],xmm7
0x290ee9ff44b5  22f5  c57b118538ffffff     vmovsd [rbp-0xc8],xmm8
0x290ee9ff44bd  22fd  c57b118560ffffff     vmovsd [rbp-0xa0],xmm8
0x290ee9ff44c5  2305  83c304               addl rbx,0x4
0x290ee9ff44c8  2308  4183c304             addl r11,0x4
0x290ee9ff44cc  230c  83c204               addl rdx,0x4
0x290ee9ff44cf  230f  4183c604             addl r14,0x4
0x290ee9ff44d3  2313  4183c4ff             addl r12,0xff
0x290ee9ff44d7  2317  0f8523ffffff         jnz 0x290ee9ff4400  <+0x2240>
0x290ee9ff44dd  231d  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x290ee9ff44e5  2325  c5f8109560feffff     vmovups xmm2,[rbp-0x1a0]
0x290ee9ff44ed  232d  c5f8108d70feffff     vmovups xmm1,[rbp-0x190]
0x290ee9ff44f5  2335  c5f810ad80feffff     vmovups xmm5,[rbp-0x180]
0x290ee9ff44fd  233d  448bb578ffffff       movl r14,[rbp-0x88]
0x290ee9ff4504  2344  458d5e01             leal r11,[r14+0x1]
0x290ee9ff4508  2348  448ba570ffffff       movl r12,[rbp-0x90]
0x290ee9ff450f  234f  453be6               cmpl r12,r14
0x290ee9ff4512  2352  0f8568ebffff         jnz 0x290ee9ff3080  <+0xec0>
0x290ee9ff4518  2358  c57b108530ffffff     vmovsd xmm8,[rbp-0xd0]
0x290ee9ff4520  2360  c4217a11440e28       vmovss [rsi+r9*1+0x28],xmm8
0x290ee9ff4527  2367  c5fb10bd38ffffff     vmovsd xmm7,[rbp-0xc8]
0x290ee9ff452f  236f  c4a17a117c0e24       vmovss [rsi+r9*1+0x24],xmm7
0x290ee9ff4536  2376  c5fb10b540ffffff     vmovsd xmm6,[rbp-0xc0]
0x290ee9ff453e  237e  c4a17a11740e20       vmovss [rsi+r9*1+0x20],xmm6
0x290ee9ff4545  2385  c5f8108550ffffff     vmovups xmm0,[rbp-0xb0]
0x290ee9ff454d  238d  c4a17a7f440e10       vmovdqu [rsi+r9*1+0x10],xmm0
0x290ee9ff4554  2394  e906000000           jmp 0x290ee9ff455f  <+0x239f>
0x290ee9ff4559  2399  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff455d  239d  33c0                 xorl rax,rax
0x290ee9ff455f  239f  418d5110             leal rdx,[r9+0x10]
0x290ee9ff4563  23a3  4c8bd8               REX.W movq r11,rax
0x290ee9ff4566  23a6  48899578ffffff       REX.W movq [rbp-0x88],rdx
0x290ee9ff456d  23ad  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff4571  23b1  8b4598               movl rax,[rbp-0x68]
0x290ee9ff4574  23b4  e8c747f2ff           call 0x290ee9f18d40  (jump table)
0x290ee9ff4579  23b9  8b5de0               movl rbx,[rbp-0x20]
0x290ee9ff457c  23bc  8d4b30               leal rcx,[rbx+0x30]
0x290ee9ff457f  23bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff4583  23c3  8b4598               movl rax,[rbp-0x68]
0x290ee9ff4586  23c6  8b5590               movl rdx,[rbp-0x70]
0x290ee9ff4589  23c9  c5fb104d88           vmovsd xmm1,[rbp-0x78]
0x290ee9ff458e  23ce  c5fb105580           vmovsd xmm2,[rbp-0x80]
0x290ee9ff4593  23d3  448b8d78ffffff       movl r9,[rbp-0x88]
0x290ee9ff459a  23da  e8a947f2ff           call 0x290ee9f18d48  (jump table)
0x290ee9ff459f  23df  448b5da0             movl r11,[rbp-0x60]
0x290ee9ff45a3  23e3  443b5dd0             cmpl r11,[rbp-0x30]
0x290ee9ff45a7  23e7  0f86bd000000         jna 0x290ee9ff466a  <+0x24aa>
0x290ee9ff45ad  23ed  8b75d0               movl rsi,[rbp-0x30]
0x290ee9ff45b0  23f0  448b65a8             movl r12,[rbp-0x58]
0x290ee9ff45b4  23f4  458d3cb4             leal r15,[r12+rsi*4]
0x290ee9ff45b8  23f8  448b75e0             movl r14,[rbp-0x20]
0x290ee9ff45bc  23fc  488b45c8             REX.W movq rax,[rbp-0x38]
0x290ee9ff45c0  2400  c4a17a10843080000000 vmovss xmm0,[rax+r14*1+0x80]
0x290ee9ff45ca  240a  c4a17a110438         vmovss [rax+r15*1],xmm0
0x290ee9ff45d0  2410  448b7db0             movl r15,[rbp-0x50]
0x290ee9ff45d4  2414  418d1cb7             leal rbx,[r15+rsi*4]
0x290ee9ff45d8  2418  c4a17a10843084000000 vmovss xmm0,[rax+r14*1+0x84]
0x290ee9ff45e2  2422  c5fa110418           vmovss [rax+rbx*1],xmm0
0x290ee9ff45e7  2427  8b5db8               movl rbx,[rbp-0x48]
0x290ee9ff45ea  242a  8d14b3               leal rdx,[rbx+rsi*4]
0x290ee9ff45ed  242d  c4a17a10843088000000 vmovss xmm0,[rax+r14*1+0x88]
0x290ee9ff45f7  2437  c5fa110410           vmovss [rax+rdx*1],xmm0
0x290ee9ff45fc  243c  8b55c0               movl rdx,[rbp-0x40]
0x290ee9ff45ff  243f  8d0cb2               leal rcx,[rdx+rsi*4]
0x290ee9ff4602  2442  c4a17a1084308c000000 vmovss xmm0,[rax+r14*1+0x8c]
0x290ee9ff460c  244c  c5fa110408           vmovss [rax+rcx*1],xmm0
0x290ee9ff4611  2451  458bd3               movl r10,r11
0x290ee9ff4614  2454  4c8bd8               REX.W movq r11,rax
0x290ee9ff4617  2457  8bc2                 movl rax,rdx
0x290ee9ff4619  2459  418bd2               movl rdx,r10
0x290ee9ff461c  245c  4489e1               movl rcx,r12
0x290ee9ff461f  245f  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x290ee9ff4624  2464  c4c13972f019         vpslld xmm8,xmm8,25
0x290ee9ff462a  246a  c4c13972d002         vpsrld xmm8,xmm8,2
0x290ee9ff4630  2470  c5c857f6             vxorps xmm6,xmm6,xmm6
0x290ee9ff4634  2474  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x290ee9ff463c  247c  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x290ee9ff4644  2484  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x290ee9ff464c  248c  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x290ee9ff4654  2494  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x290ee9ff465c  249c  33ff                 xorl rdi,rdi
0x290ee9ff465e  249e  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff4665  24a5  e959000000           jmp 0x290ee9ff46c3  <+0x2503>
0x290ee9ff466a  24aa  8b75d0               movl rsi,[rbp-0x30]
0x290ee9ff466d  24ad  418bd3               movl rdx,r11
0x290ee9ff4670  24b0  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff4674  24b4  8b45c0               movl rax,[rbp-0x40]
0x290ee9ff4677  24b7  8b5db8               movl rbx,[rbp-0x48]
0x290ee9ff467a  24ba  8b4da8               movl rcx,[rbp-0x58]
0x290ee9ff467d  24bd  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x290ee9ff4682  24c2  c4c13972f019         vpslld xmm8,xmm8,25
0x290ee9ff4688  24c8  c4c13972d002         vpsrld xmm8,xmm8,2
0x290ee9ff468e  24ce  c5c857f6             vxorps xmm6,xmm6,xmm6
0x290ee9ff4692  24d2  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x290ee9ff469a  24da  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x290ee9ff46a2  24e2  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x290ee9ff46aa  24ea  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x290ee9ff46b2  24f2  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x290ee9ff46ba  24fa  33ff                 xorl rdi,rdi
0x290ee9ff46bc  24fc  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff46c3  2503  83c601               addl rsi,0x1
0x290ee9ff46c6  2506  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff46ca  250a  443bfe               cmpl r15,rsi
0x290ee9ff46cd  250d  0f856de3ffff         jnz 0x290ee9ff2a40  <+0x880>
0x290ee9ff46d3  2513  448b5de0             movl r11,[rbp-0x20]
0x290ee9ff46d7  2517  4181c340020000       addl r11,0x240
0x290ee9ff46de  251e  4c8b65e8             REX.W movq r12,[rbp-0x18]
0x290ee9ff46e2  2522  45891c24             movl [r12],r11
0x290ee9ff46e6  2526  488be5               REX.W movq rsp,rbp
0x290ee9ff46e9  2529  5d                   pop rbp
0x290ee9ff46ea  252a  c3                   retl
0x290ee9ff46eb  252b  e8e04df2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff46f0  2530  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff46f4  2534  488b75f0             REX.W movq rsi,[rbp-0x10]
0x290ee9ff46f8  2538  8b45d8               movl rax,[rbp-0x28]
0x290ee9ff46fb  253b  e9e4daffff           jmp 0x290ee9ff21e4  <+0x24>
0x290ee9ff4700  2540  c5f92ef6             vucomisd xmm6,xmm6
0x290ee9ff4704  2544  0f8b0a000000         jpo 0x290ee9ff4714  <+0x2554>
0x290ee9ff470a  254a  33d2                 xorl rdx,rdx
0x290ee9ff470c  254c  4c8bf2               REX.W movq r14,rdx
0x290ee9ff470f  254f  e939dcffff           jmp 0x290ee9ff234d  <+0x18d>
0x290ee9ff4714  2554  c5c857f6             vxorps xmm6,xmm6,xmm6
0x290ee9ff4718  2558  c5f82ef5             vucomiss xmm6,xmm5
0x290ee9ff471c  255c  0f870b000000         ja 0x290ee9ff472d  <+0x256d>
0x290ee9ff4722  2562  41beffffffff         movl r14,0xffffffff
0x290ee9ff4728  2568  e920dcffff           jmp 0x290ee9ff234d  <+0x18d>
0x290ee9ff472d  256d  4533f6               xorl r14,r14
0x290ee9ff4730  2570  e918dcffff           jmp 0x290ee9ff234d  <+0x18d>
0x290ee9ff4735  2575  c5f92eff             vucomisd xmm7,xmm7
0x290ee9ff4739  2579  0f8b08000000         jpo 0x290ee9ff4747  <+0x2587>
0x290ee9ff473f  257f  4533f6               xorl r14,r14
0x290ee9ff4742  2582  e96ddcffff           jmp 0x290ee9ff23b4  <+0x1f4>
0x290ee9ff4747  2587  c5c057ff             vxorps xmm7,xmm7,xmm7
0x290ee9ff474b  258b  c5f82efe             vucomiss xmm7,xmm6
0x290ee9ff474f  258f  77ee                 ja 0x290ee9ff473f  <+0x257f>
0x290ee9ff4751  2591  41beffffffff         movl r14,0xffffffff
0x290ee9ff4757  2597  e958dcffff           jmp 0x290ee9ff23b4  <+0x1f4>
0x290ee9ff475c  259c  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff4764  25a4  4c8945d0             REX.W movq [rbp-0x30],r8
0x290ee9ff4768  25a8  48897db0             REX.W movq [rbp-0x50],rdi
0x290ee9ff476c  25ac  e85f4df2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff4771  25b1  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff4775  25b5  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff477c  25bc  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff4780  25c0  8b7db0               movl rdi,[rbp-0x50]
0x290ee9ff4783  25c3  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff478b  25cb  8b75a8               movl rsi,[rbp-0x58]
0x290ee9ff478e  25ce  8b4db8               movl rcx,[rbp-0x48]
0x290ee9ff4791  25d1  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff4794  25d4  448b45d0             movl r8,[rbp-0x30]
0x290ee9ff4798  25d8  e96dddffff           jmp 0x290ee9ff250a  <+0x34a>
0x290ee9ff479d  25dd  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff47a5  25e5  48894db8             REX.W movq [rbp-0x48],rcx
0x290ee9ff47a9  25e9  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff47ad  25ed  e81e4df2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff47b2  25f2  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff47b6  25f6  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff47bd  25fd  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff47c1  2601  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff47c4  2604  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff47cc  260c  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff47cf  260f  8b45a8               movl rax,[rbp-0x58]
0x290ee9ff47d2  2612  448b75b0             movl r14,[rbp-0x50]
0x290ee9ff47d6  2616  8b4db8               movl rcx,[rbp-0x48]
0x290ee9ff47d9  2619  e92cdeffff           jmp 0x290ee9ff260a  <+0x44a>
0x290ee9ff47de  261e  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff47e6  2626  48894db0             REX.W movq [rbp-0x50],rcx
0x290ee9ff47ea  262a  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff47ee  262e  e8dd4cf2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff47f3  2633  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff47f7  2637  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff47fe  263e  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff4802  2642  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff4805  2645  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff480d  264d  8b5dc0               movl rbx,[rbp-0x40]
0x290ee9ff4810  2650  8b45b8               movl rax,[rbp-0x48]
0x290ee9ff4813  2653  448b7598             movl r14,[rbp-0x68]
0x290ee9ff4817  2657  8b4db0               movl rcx,[rbp-0x50]
0x290ee9ff481a  265a  e9ebdeffff           jmp 0x290ee9ff270a  <+0x54a>
0x290ee9ff481f  265f  c5fb119d70ffffff     vmovsd [rbp-0x90],xmm3
0x290ee9ff4827  2667  48895da0             REX.W movq [rbp-0x60],rbx
0x290ee9ff482b  266b  488955d0             REX.W movq [rbp-0x30],rdx
0x290ee9ff482f  266f  e89c4cf2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff4834  2674  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff4838  2678  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff483f  267f  8b55d0               movl rdx,[rbp-0x30]
0x290ee9ff4842  2682  c5fb109d70ffffff     vmovsd xmm3,[rbp-0x90]
0x290ee9ff484a  268a  448b7dd8             movl r15,[rbp-0x28]
0x290ee9ff484e  268e  8b45c0               movl rax,[rbp-0x40]
0x290ee9ff4851  2691  448b75b8             movl r14,[rbp-0x48]
0x290ee9ff4855  2695  8b5da0               movl rbx,[rbp-0x60]
0x290ee9ff4858  2698  e9addfffff           jmp 0x290ee9ff280a  <+0x64a>
0x290ee9ff485d  269d  488975d0             REX.W movq [rbp-0x30],rsi
0x290ee9ff4861  26a1  e86a4cf2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff4866  26a6  8b75d0               movl rsi,[rbp-0x30]
0x290ee9ff4869  26a9  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x290ee9ff486d  26ad  8b45c0               movl rax,[rbp-0x40]
0x290ee9ff4870  26b0  8b5db8               movl rbx,[rbp-0x48]
0x290ee9ff4873  26b3  8b4da8               movl rcx,[rbp-0x58]
0x290ee9ff4876  26b6  8b55a0               movl rdx,[rbp-0x60]
0x290ee9ff4879  26b9  c4413976c0           vpcmpeqd xmm8,xmm8,xmm8
0x290ee9ff487e  26be  c4c13972f019         vpslld xmm8,xmm8,25
0x290ee9ff4884  26c4  c4c13972d002         vpsrld xmm8,xmm8,2
0x290ee9ff488a  26ca  c5c857f6             vxorps xmm6,xmm6,xmm6
0x290ee9ff488e  26ce  c5fb10a510ffffff     vmovsd xmm4,[rbp-0xf0]
0x290ee9ff4896  26d6  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x290ee9ff489e  26de  c5f810bd80feffff     vmovups xmm7,[rbp-0x180]
0x290ee9ff48a6  26e6  c5f810ad70feffff     vmovups xmm5,[rbp-0x190]
0x290ee9ff48ae  26ee  c5f8109d60feffff     vmovups xmm3,[rbp-0x1a0]
0x290ee9ff48b6  26f6  33ff                 xorl rdi,rdi
0x290ee9ff48b8  26f8  4c8ba548ffffff       REX.W movq r12,[rbp-0xb8]
0x290ee9ff48bf  26ff  e986e1ffff           jmp 0x290ee9ff2a4a  <+0x88a>
0x290ee9ff48c4  2704  c5f92eed             vucomisd xmm5,xmm5
0x290ee9ff48c8  2708  0f8b08000000         jpo 0x290ee9ff48d6  <+0x2716>
0x290ee9ff48ce  270e  4533db               xorl r11,r11
0x290ee9ff48d1  2711  e9a6e3ffff           jmp 0x290ee9ff2c7c  <+0xabc>
0x290ee9ff48d6  2716  c5f82ee3             vucomiss xmm4,xmm3
0x290ee9ff48da  271a  77f2                 ja 0x290ee9ff48ce  <+0x270e>
0x290ee9ff48dc  271c  41bbffffffff         movl r11,0xffffffff
0x290ee9ff48e2  2722  e995e3ffff           jmp 0x290ee9ff2c7c  <+0xabc>
0x290ee9ff48e7  2727  c5f92ef6             vucomisd xmm6,xmm6
0x290ee9ff48eb  272b  0f8b08000000         jpo 0x290ee9ff48f9  <+0x2739>
0x290ee9ff48f1  2731  4533db               xorl r11,r11
0x290ee9ff48f4  2734  e96de4ffff           jmp 0x290ee9ff2d66  <+0xba6>
0x290ee9ff48f9  2739  c5f82ee3             vucomiss xmm4,xmm3
0x290ee9ff48fd  273d  77f2                 ja 0x290ee9ff48f1  <+0x2731>
0x290ee9ff48ff  273f  41bbffffffff         movl r11,0xffffffff
0x290ee9ff4905  2745  e95ce4ffff           jmp 0x290ee9ff2d66  <+0xba6>
0x290ee9ff490a  274a  c578118de0fdffff     vmovups [rbp-0x220],xmm9
0x290ee9ff4912  2752  c578119550fcffff     vmovups [rbp-0x3b0],xmm10
0x290ee9ff491a  275a  c578119d40fcffff     vmovups [rbp-0x3c0],xmm11
0x290ee9ff4922  2762  c57811a530fcffff     vmovups [rbp-0x3d0],xmm12
0x290ee9ff492a  276a  c57811ad20fcffff     vmovups [rbp-0x3e0],xmm13
0x290ee9ff4932  2772  c57811b510fcffff     vmovups [rbp-0x3f0],xmm14
0x290ee9ff493a  277a  c5f8118d00fcffff     vmovups [rbp-0x400],xmm1
0x290ee9ff4942  2782  c5f81195f0fbffff     vmovups [rbp-0x410],xmm2
0x290ee9ff494a  278a  e8814bf2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff494f  278f  4c8b65c8             REX.W movq r12,[rbp-0x38]
0x290ee9ff4953  2793  448bb578ffffff       movl r14,[rbp-0x88]
0x290ee9ff495a  279a  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x290ee9ff4962  27a2  448b8d18feffff       movl r9,[rbp-0x1e8]
0x290ee9ff4969  27a9  448bbd00feffff       movl r15,[rbp-0x200]
0x290ee9ff4970  27b0  8b8df0fdffff         movl rcx,[rbp-0x210]
0x290ee9ff4976  27b6  33c0                 xorl rax,rax
0x290ee9ff4978  27b8  c578108de0fdffff     vmovups xmm9,[rbp-0x220]
0x290ee9ff4980  27c0  c578109550fcffff     vmovups xmm10,[rbp-0x3b0]
0x290ee9ff4988  27c8  c578109d40fcffff     vmovups xmm11,[rbp-0x3c0]
0x290ee9ff4990  27d0  c57810a530fcffff     vmovups xmm12,[rbp-0x3d0]
0x290ee9ff4998  27d8  c57810ad20fcffff     vmovups xmm13,[rbp-0x3e0]
0x290ee9ff49a0  27e0  c57810b510fcffff     vmovups xmm14,[rbp-0x3f0]
0x290ee9ff49a8  27e8  c5f8108d00fcffff     vmovups xmm1,[rbp-0x400]
0x290ee9ff49b0  27f0  c5f81095f0fbffff     vmovups xmm2,[rbp-0x410]
0x290ee9ff49b8  27f8  8b9598fcffff         movl rdx,[rbp-0x368]
0x290ee9ff49be  27fe  8bbd90fcffff         movl rdi,[rbp-0x370]
0x290ee9ff49c4  2804  448b8588fcffff       movl r8,[rbp-0x378]
0x290ee9ff49cb  280b  448b9d80fcffff       movl r11,[rbp-0x380]
0x290ee9ff49d2  2812  8b9d78fcffff         movl rbx,[rbp-0x388]
0x290ee9ff49d8  2818  e953e7ffff           jmp 0x290ee9ff3130  <+0xf70>
0x290ee9ff49dd  281d  48898da0feffff       REX.W movq [rbp-0x160],rcx
0x290ee9ff49e4  2824  4c89bd08fdffff       REX.W movq [rbp-0x2f8],r15
0x290ee9ff49eb  282b  48899500fdffff       REX.W movq [rbp-0x300],rdx
0x290ee9ff49f2  2832  48899df8fcffff       REX.W movq [rbp-0x308],rbx
0x290ee9ff49f9  2839  e8d24af2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff49fe  283e  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff4a02  2842  488b75c8             REX.W movq rsi,[rbp-0x38]
0x290ee9ff4a06  2846  448b9d28ffffff       movl r11,[rbp-0xd8]
0x290ee9ff4a0d  284d  448ba518ffffff       movl r12,[rbp-0xe8]
0x290ee9ff4a14  2854  8b8da0feffff         movl rcx,[rbp-0x160]
0x290ee9ff4a1a  285a  c5f810a540feffff     vmovups xmm4,[rbp-0x1c0]
0x290ee9ff4a22  2862  448bbd08fdffff       movl r15,[rbp-0x2f8]
0x290ee9ff4a29  2869  8b9500fdffff         movl rdx,[rbp-0x300]
0x290ee9ff4a2f  286f  448b85f0fcffff       movl r8,[rbp-0x310]
0x290ee9ff4a36  2876  8b9df8fcffff         movl rbx,[rbp-0x308]
0x290ee9ff4a3c  287c  e927eaffff           jmp 0x290ee9ff3468  <+0x12a8>
0x290ee9ff4a41  2881  4c89a528ffffff       REX.W movq [rbp-0xd8],r12
0x290ee9ff4a48  2888  4c89b520ffffff       REX.W movq [rbp-0xe0],r14
0x290ee9ff4a4f  288f  488995f0feffff       REX.W movq [rbp-0x110],rdx
0x290ee9ff4a56  2896  4c899de8feffff       REX.W movq [rbp-0x118],r11
0x290ee9ff4a5d  289d  48899d18ffffff       REX.W movq [rbp-0xe8],rbx
0x290ee9ff4a64  28a4  c5f811ad50ffffff     vmovups [rbp-0xb0],xmm5
0x290ee9ff4a6c  28ac  e85f4af2ff           call 0x290ee9f194d0  (jump table)
0x290ee9ff4a71  28b1  448b4de0             movl r9,[rbp-0x20]
0x290ee9ff4a75  28b5  488b75c8             REX.W movq rsi,[rbp-0x38]
0x290ee9ff4a79  28b9  c578109d90fdffff     vmovups xmm11,[rbp-0x270]
0x290ee9ff4a81  28c1  c57810a580fdffff     vmovups xmm12,[rbp-0x280]
0x290ee9ff4a89  28c9  c57810b570fdffff     vmovups xmm14,[rbp-0x290]
0x290ee9ff4a91  28d1  c57810ad60fdffff     vmovups xmm13,[rbp-0x2a0]
0x290ee9ff4a99  28d9  448ba528ffffff       movl r12,[rbp-0xd8]
0x290ee9ff4aa0  28e0  448bb520ffffff       movl r14,[rbp-0xe0]
0x290ee9ff4aa7  28e7  8b95f0feffff         movl rdx,[rbp-0x110]
0x290ee9ff4aad  28ed  448b9de8feffff       movl r11,[rbp-0x118]
0x290ee9ff4ab4  28f4  8b9d18ffffff         movl rbx,[rbp-0xe8]
0x290ee9ff4aba  28fa  c5f810ad50ffffff     vmovups xmm5,[rbp-0xb0]
0x290ee9ff4ac2  2902  c5c976f6             vpcmpeqd xmm6,xmm6,xmm6
0x290ee9ff4ac6  2906  c5c972f619           vpslld xmm6,xmm6,25
0x290ee9ff4acb  290b  c5c972d602           vpsrld xmm6,xmm6,2
0x290ee9ff4ad0  2910  c5d857e4             vxorps xmm4,xmm4,xmm4
0x290ee9ff4ad4  2914  c5fb109d10ffffff     vmovsd xmm3,[rbp-0xf0]
0x290ee9ff4adc  291c  c5fb108508ffffff     vmovsd xmm0,[rbp-0xf8]
0x290ee9ff4ae4  2924  c5fb109500ffffff     vmovsd xmm2,[rbp-0x100]
0x290ee9ff4aec  292c  c5fb108df8feffff     vmovsd xmm1,[rbp-0x108]
0x290ee9ff4af4  2934  448bbdf0fdffff       movl r15,[rbp-0x210]
0x290ee9ff4afb  293b  33c0                 xorl rax,rax
0x290ee9ff4afd  293d  e918f9ffff           jmp 0x290ee9ff441a  <+0x225a>
0x290ee9ff4b02  2942  e80947f2ff           call 0x290ee9f19210  (jump table)
0x290ee9ff4b07  2947  90                   nop

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
       c19         
       c1e         
       c27         
       c31         
       c3b         
       c45         
       c4f         
       c59         
       c63         
       c6d         
       c77         
       c81         
       c8b         
       c95         
       ca7         
       cb9         
       ccb         
       cdd         
       cef         
       d01         
       d13         
       d25         
       d37         
       d49         
       d5b         
       d6d         
       d7f         
       d91         
       da3         
       db5         
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
      13fe         
      1408         
      141a         
      1438         
      147e         
      149a         
      14d1         
      14ec         
      1507         
      1522         
      153c         
      154a         
      1554         
      1566         
      1584         
      15db         
      15f7         
      1632         
      164e         
      166a         
      1686         
      16a1         
      16af         
      16b9         
      16cb         
      16e1         
      172e         
      1749         
      177f         
      179a         
      17b5         
      17d0         
      17ea         
      19f0         
      1a70         
      1aeb         
      1b64         
      1b7c         
      1b81         
      1b87         
      1b99         
      1b9f         
      1beb         
      1bff         
      1c36         
      1c48         
      1c5b         
      1c7e         
      1ca0         
      1caa         
      1cb0         
      1cb7         
      1cda         
      1ce9         
      1d4c         
      1d67         
      1da7         
      1dc2         
      1ddd         
      1df8         
      1e12         
      1e1c         
      1e23         
      1e29         
      1e44         
      1e5f         
      1eb8         
      1ed3         
      1f0d         
      1f28         
      1f43         
      1f5e         
      1f78         
      1f82         
      1f88         
      1f8f         
      1fa2         
      1fb1         
      2014         
      202f         
      206a         
      2085         
      20a0         
      20bb         
      20d5         
      225a         
      2268         
      22a5         
      22b0         
      2360         
      236f         
      237e         
      238d         
      2400         
      240a         
      2418         
      2422         
      242d         
      2437         
      2442         
      244c         

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
       99b      1539
       c0e      1776
       c1e      1783
       c23      1797
       c31      1806
       c3b      1815
       c45      1824
       c4f      1833
       c59      1842
       c63      1851
       c6d      1860
       c77      1869
       c81      1878
       c8b      1887
       c95      1896
       c9f      1905
       cb1      1914
       cc3      1923
       cd5      1932
       ce7      1941
       cf9      1950
       d0b      1959
       d1d      1968
       d2f      1977
       d41      1986
       d53      1995
       d65      2004
       d77      2013
       d89      2022
       d9b      2031
       dad      2040
       f96      2142
       f9e      2155
      12ab      2451
      12b4      2464
      12bd      2483
      12cc      2503
      131a      2552
      1334      2573
      137e      2636
      13a0      2657
      13bb      2678
      13d6      2699
      13f0      2720
      13fe      2730
      1408      2741
      1412      2758
      1430      2776
      147e      2825
      149a      2846
      14d1      2891
      14ec      2912
      1507      2933
      1522      2954
      153c      2975
      154a      2985
      1554      2996
      155e      3013
      157c      3031
      15db      3080
      15f7      3101
      1632      3146
      164e      3167
      166a      3188
      1686      3209
      16a1      3230
      16af      3240
      16b9      3251
      16c3      3268
      16e1      3286
      172e      3335
      1749      3356
      177f      3401
      179a      3422
      17b5      3443
      17d0      3464
      17ea      3485
      19f0      3686
      1a70      3745
      1aeb      3804
      1b64      3862
      1b7c      3877
      1b81      3885
      1b87      3899
      1b99      3912
      1b9f      3922
      1beb      3974
      1bff      3995
      1c36      4063
      1c48      4084
      1c5b      4105
      1c7e      4126
      1ca0      4147
      1caa      4154
      1cb0      4162
      1cb7      4176
      1cd2      4189
      1ce1      4199
      1d4c      4251
      1d67      4272
      1da7      4322
      1dc2      4343
      1ddd      4364
      1df8      4385
      1e12      4406
      1e1c      4413
      1e23      4421
      1e29      4435
      1e3c      4448
      1e57      4465
      1eb8      4510
      1ed3      4531
      1f0d      4581
      1f28      4602
      1f43      4623
      1f5e      4644
      1f78      4665
      1f82      4672
      1f88      4680
      1f8f      4694
      1fa2      4707
      1fa9      4717
      2014      4769
      202f      4790
      206a      4840
      2085      4861
      20a0      4882
      20bb      4903
      20d5      4924
      225a      5016
      2268      5031
      22a5      5082
      22b0      5090
      2358      5191
      2367      5198
      2376      5205
      2385      5212
      23a3      5228
      23bf      5258
      23f8      5278
      240a      5282
      2418      5292
      2422      5296
      242d      5306
      2437      5310
      2442      5320
      244c      5324
      252b         0
      259c       420
      25dd       595
      261e       771
      265f       943
      269d      1325
      274a      2079
      281d      2442
      2881      5006
      2942      1539

Safepoints (stack slots = 132, entries = 1, byte size = 31)
0x290ee9ff245f    29f  slots (sp->fp): 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

RelocInfo (size = 58)
0x290ee9ff245b  internal wasm call
0x290ee9ff257e  internal wasm call
0x290ee9ff2672  internal wasm call
0x290ee9ff2772  internal wasm call
0x290ee9ff2873  internal wasm call
0x290ee9ff2ba6  external reference (0x193f2f0)
0x290ee9ff4575  internal wasm call
0x290ee9ff459b  internal wasm call
0x290ee9ff46ec  wasm stub call  (0x290ee9f194d0)
0x290ee9ff476d  wasm stub call  (0x290ee9f194d0)
0x290ee9ff47ae  wasm stub call  (0x290ee9f194d0)
0x290ee9ff47ef  wasm stub call  (0x290ee9f194d0)
0x290ee9ff4830  wasm stub call  (0x290ee9f194d0)
0x290ee9ff4862  wasm stub call  (0x290ee9f194d0)
0x290ee9ff494b  wasm stub call  (0x290ee9f194d0)
0x290ee9ff49fa  wasm stub call  (0x290ee9f194d0)
0x290ee9ff4a6d  wasm stub call  (0x290ee9f194d0)
0x290ee9ff4b03  wasm stub call  (0x290ee9f19210)
