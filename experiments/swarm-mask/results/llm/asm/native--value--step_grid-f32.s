<swarm::flock::Flock>::step_grid:
	.cfi_startproc
	push rbp
	.cfi_def_cfa_offset 16
	push r15
	.cfi_def_cfa_offset 24
	push r14
	.cfi_def_cfa_offset 32
	push r13
	.cfi_def_cfa_offset 40
	push r12
	.cfi_def_cfa_offset 48
	push rbx
	.cfi_def_cfa_offset 56
	sub rsp, 344
	.cfi_def_cfa_offset 400
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	vmovsd xmm3, qword ptr [r14 + 288]
	vmovss xmm1, dword ptr [rip + .LCPI1949_0]
	vmovss xmm0, dword ptr [r14 + 316]
	mov eax, dword ptr [rdi + 312]
	mov rsi, qword ptr [r14 + 8]
	mov rdx, qword ptr [r14 + 16]
	mov rcx, qword ptr [r14 + 32]
	mov r8, qword ptr [r14 + 40]
	xor r9d, r9d
	mov r10, -1
	mov dword ptr [rsp + 248], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm2, xmm3, xmm1
	vmovaps xmmword ptr [rsp + 320], xmm3
	mov qword ptr [rsp + 240], rax
	vcmpunordss k1, xmm2, xmm2
	vmaxss xmm2, xmm0, xmm2
	vmovss xmm2 {k1}, xmm2, xmm0
	vmovshdup xmm0, xmm3
	vmovaps xmmword ptr [rsp + 304], xmm0
	vmulss xmm0, xmm0, xmm1
	vmaxss xmm1, xmm2, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm1 {k1}, xmm1, xmm2
	vmulss xmm0, xmm1, dword ptr [rip + .LCPI1949_1]
	vmovss xmm1, dword ptr [rip + .LCPI1949_2]
	vxorps xmm2, xmm2, xmm2
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [r14 + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmulps xmm0, xmm3, xmm0
	vmovsd xmm3, qword ptr [rip + .LCPI1949_4]
	vroundps xmm0, xmm0, 10
	vcmpltps k1, xmm0, dword ptr [rip + .LCPI1949_3]{1to4}
	vcvtps2pd xmm1, xmm0
	vcmpleps k0, xmm2, xmm0
	vxorps xmm2, xmm2, xmm2
	vucomisd xmm1, xmm2
	vcvttsd2usi rax, xmm1
	kandw k1, k0, k1
	cmovb rax, r9
	vucomisd xmm1, xmm3
	vshufpd xmm1, xmm1, xmm1, 1
	cmova rax, r10
	vucomisd xmm1, xmm2
	vpbroadcastq xmm2, qword ptr [rip + .LCPI1949_5]
	vmovq xmm0, rax
	vcvttsd2usi rax, xmm1
	cmovb rax, r9
	vucomisd xmm1, xmm3
	cmova rax, r10
	vmovq xmm1, rax
	vpunpcklqdq xmm0, xmm0, xmm1
	vpmaxuq xmm2 {k1}, xmm0, xmm2
	vmovdqu xmmword ptr [r14 + 264], xmm2
	call <swarm::grid::Grid>::fill
	mov r15, qword ptr [r14 + 16]
	test r15, r15
	je .LBB1949_36
	mov rdx, qword ptr [r14 + 8]
	mov rcx, qword ptr [r14 + 32]
	mov rbp, qword ptr [r14 + 88]
	vmovdqu xmm0, xmmword ptr [r14 + 264]
	vpcmpeqd xmm2, xmm2, xmm2
	mov rbx, qword ptr [r14 + 40]
	mov rsi, qword ptr [r14 + 184]
	mov rdi, qword ptr [r14 + 104]
	lea rax, [r14 + 316]
	mov r13, qword ptr [r14 + 208]
	vxorps xmm17, xmm17, xmm17
	vpmaxuq xmm1, xmm0, qword ptr [rip + .LCPI1949_5]{1to2}
	mov qword ptr [rsp + 200], rax
	mov eax, 1
	mov qword ptr [rsp + 72], rdx
	mov rdx, qword ptr [r14 + 64]
	mov qword ptr [rsp + 64], rcx
	mov rcx, qword ptr [r14 + 80]
	mov qword ptr [rsp + 176], rdi
	mov rdi, qword ptr [r14 + 152]
	vpaddq xmm1, xmm1, xmm2
	vbroadcastss xmm2, dword ptr [r14 + 280]
	cmp rdx, rbp
	mov qword ptr [rsp + 56], rcx
	mov rcx, qword ptr [r14 + 264]
	vmovdqa xmmword ptr [rsp + 288], xmm1
	vmovss xmm1, dword ptr [r14 + 320]
	mov qword ptr [rsp + 160], rdi
	cmovb rbp, rdx
	mov rdx, qword ptr [r14 + 56]
	mov qword ptr [rsp + 232], rcx
	mov rcx, qword ptr [r14 + 256]
	mov qword ptr [rsp + 48], rdx
	mov rdx, qword ptr [r14 + 200]
	vmulss xmm15, xmm1, xmm1
	vmovss xmm1, dword ptr [r14 + 316]
	vmovaps xmmword ptr [rsp + 272], xmm2
	mov qword ptr [rsp + 104], rcx
	mov rcx, qword ptr [r14 + 136]
	mov qword ptr [rsp + 112], rdx
	mov rdx, qword ptr [r14 + 112]
	vmovss dword ptr [rsp + 84], xmm15
	cmp rcx, rdx
	vmulss xmm16, xmm1, xmm1
	vmovq xmm1, rax
	mov rax, qword ptr [r14 + 248]
	cmovb rdx, rcx
	mov rcx, qword ptr [r14 + 160]
	vpunpcklqdq xmm0, xmm1, xmm0
	vmovdqa xmmword ptr [rsp + 256], xmm0
	vmovss dword ptr [rsp + 80], xmm16
	mov qword ptr [rsp + 96], rax
	add rax, 4
	cmp rcx, rdx
	mov qword ptr [rsp + 88], rax
	cmovb rdx, rcx
	cmp rbx, rbp
	mov rcx, rbp
	cmovb rcx, rbx
	cmp rsi, rdx
	cmovb rdx, rsi
	mov rsi, qword ptr [r14 + 128]
	xor r12d, r12d
	mov qword ptr [rsp + 184], rcx
	mov qword ptr [rsp + 192], rdx
	mov qword ptr [rsp + 168], rsi
	mov rsi, qword ptr [r14 + 176]
	mov qword ptr [rsp + 152], rsi
	jmp .LBB1949_2
	.p2align	4
.LBB1949_34:
	vmovss xmm15, dword ptr [rsp + 84]
	vmovss xmm16, dword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 184]
	vxorps xmm17, xmm17, xmm17
.LBB1949_35:
	inc r12
	cmp r12, r15
	je .LBB1949_36
.LBB1949_2:
	cmp r12, rcx
	jae .LBB1949_35
	mov rax, qword ptr [rsp + 72]
	vmovsd xmm5, qword ptr [rip + .LCPI1949_4]
	xor r14d, r14d
	vxorpd xmm4, xmm4, xmm4
	mov rdx, -1
	vxorps xmm7, xmm7, xmm7
	vxorps xmm6, xmm6, xmm6
	vxorps xmm8, xmm8, xmm8
	vmovss xmm0, dword ptr [rax + 4*r12]
	mov rax, qword ptr [rsp + 64]
	vmovss xmm1, dword ptr [rax + 4*r12]
	mov rax, qword ptr [rsp + 48]
	vmovss xmm2, dword ptr [rax + 4*r12]
	mov rax, qword ptr [rsp + 56]
	vmovss xmm3, dword ptr [rax + 4*r12]
	vmovss dword ptr [rsp + 120], xmm0
	vmovss dword ptr [rsp + 124], xmm1
	vmovss dword ptr [rsp + 128], xmm2
	vinsertps xmm2, xmm0, xmm1, 16
	vmulps xmm2, xmm2, xmmword ptr [rsp + 272]
	vmovss dword ptr [rsp + 132], xmm3
	vxorps xmm3, xmm3, xmm3
	vmovups xmmword ptr [rsp + 28], xmm3
	vmovaps xmmword ptr [rsp + 16], xmm3
	vroundps xmm2, xmm2, 9
	vmaxps xmm2, xmm2, xmm3
	vcmpltps k1, xmm2, dword ptr [rip + .LCPI1949_3]{1to4}
	vcvtps2pd xmm3, xmm2
	vucomisd xmm3, xmm4
	vcvttsd2usi rax, xmm3
	vshufpd xmm2, xmm3, xmm3, 1
	vcvttsd2usi rcx, xmm2
	cmovb rax, r14
	vucomisd xmm3, xmm5
	cmova rax, rdx
	vucomisd xmm2, xmm4
	vmovdqa xmm4, xmmword ptr [rsp + 288]
	cmovb rcx, r14
	vucomisd xmm2, xmm5
	vmovq xmm2, rax
	vxorpd xmm5, xmm5, xmm5
	cmova rcx, rdx
	vmovq xmm3, rcx
	vpunpcklqdq xmm2, xmm2, xmm3
	vpcmpeqd xmm3, xmm3, xmm3
	vpminuq xmm2 {k1} {z}, xmm4, xmm2
	vmovq rax, xmm2
	vpextrq rcx, xmm2, 1
	vpsubq xmm2, xmm2, xmm3
	vpminuq xmm2, xmm4, xmm2
	vmovdqa xmm4, xmmword ptr [rsp + 256]
	sub rax, 1
	cmovb rax, r14
	sub rcx, 1
	cmovb rcx, r14
	vpextrq r9, xmm2, 1
	vpmullq xmm3, xmm4, xmm2
	vpaddq xmm4, xmm4, xmm2
	vpxor xmm2, xmm2, xmm2
	vmovq rdx, xmm4
	vpxor xmm4, xmm4, xmm4
	mov qword ptr [rsp + 224], rdx
	vpextrq rsi, xmm3, 1
	vpxor xmm3, xmm3, xmm3
	lea rdi, [rsi + rax]
	add rsi, rdx
	cmp rdi, r13
	mov qword ptr [rsp + 208], rdi
	mov qword ptr [rsp + 216], rsi
	setb r8b
	cmp rsi, r13
	setb dl
	xor r11d, r11d
	and dl, r8b
	mov byte ptr [rsp + 15], dl
	test r11, r11
	je .LBB1949_6
	.p2align	4
.LBB1949_5:
	cmp r11, r10
	je .LBB1949_6
.LBB1949_18:
	mov r8d, dword ptr [r11]
	add r11, 4
	cmp r12, r8
	setne dl
	cmp r15, r8
	seta sil
	cmp rbx, r8
	seta dil
	and dil, sil
	and dil, dl
	cmp rbp, r8
	seta dl
	test dil, dl
	je .LBB1949_5
	mov rdx, qword ptr [rsp + 72]
	mov rdi, qword ptr [rsp + 48]
	vmovss xmm9, dword ptr [rdx + 4*r8]
	mov rdx, qword ptr [rsp + 64]
	vmovss xmm10, dword ptr [rdx + 4*r8]
	vsubss xmm11, xmm0, xmm9
	vmulss xmm13, xmm11, xmm11
	vsubss xmm12, xmm1, xmm10
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vucomiss xmm15, xmm13
	vcmpltss k0, xmm13, xmm16
	seta dl
	vucomiss xmm13, xmm17
	kmovd k1, edx
	vmovss xmm11 {k1} {z}, xmm11, xmm11
	vaddss xmm7, xmm11, xmm7
	vmovss xmm11 {k1} {z}, xmm12, xmm12
	vcmpless k1, xmm15, xmm13
	seta sil
	vaddss xmm5, xmm11, xmm5
	kandw k0, k1, k0
	kmovd edx, k0
	and sil, dl
	kmovd k1, esi
	mov rsi, qword ptr [rsp + 56]
	vmovss xmm9 {k1} {z}, xmm9, xmm9
	vmovss xmm12 {k1} {z}, dword ptr [rdi + 4*r8]
	vaddss xmm2, xmm9, xmm2
	vmovss xmm9 {k1} {z}, xmm10, xmm10
	vaddss xmm8, xmm8, xmm9
	vmovss xmm9 {k1} {z}, dword ptr [rip + .LCPI1949_2]
	vmovss xmm13 {k1} {z}, dword ptr [rsi + 4*r8]
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm2
	vmovss dword ptr [rsp + 20], xmm8
	vaddss xmm6, xmm12, xmm6
	vaddss xmm3, xmm9, xmm3
	vmovss dword ptr [rsp + 24], xmm6
	vaddss xmm4, xmm13, xmm4
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	test r11, r11
	jne .LBB1949_5
.LBB1949_6:
	test r14b, r14b
	je .LBB1949_7
	jmp .LBB1949_32
	.p2align	4
.LBB1949_16:
	mov rdx, qword ptr [rsp + 72]
	vmovss xmm9, dword ptr [rdx + 4*r8]
	mov rdx, qword ptr [rsp + 64]
	vmovss xmm10, dword ptr [rdx + 4*r8]
	vsubss xmm11, xmm0, xmm9
	vmulss xmm13, xmm11, xmm11
	vsubss xmm12, xmm1, xmm10
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vucomiss xmm15, xmm13
	vcmpltss k0, xmm13, xmm16
	seta dl
	vucomiss xmm13, xmm17
	kmovd k1, edx
	vmovss xmm11 {k1} {z}, xmm11, xmm11
	vaddss xmm7, xmm11, xmm7
	vmovss xmm11 {k1} {z}, xmm12, xmm12
	vcmpless k1, xmm15, xmm13
	seta sil
	vaddss xmm5, xmm11, xmm5
	kandw k0, k1, k0
	kmovd edx, k0
	and sil, dl
	mov rdx, qword ptr [rsp + 56]
	kmovd k1, esi
	mov rsi, qword ptr [rsp + 48]
	vmovss xmm9 {k1} {z}, xmm9, xmm9
	vaddss xmm2, xmm9, xmm2
	vmovss xmm9 {k1} {z}, xmm10, xmm10
	vaddss xmm8, xmm8, xmm9
	vmovss xmm9 {k1} {z}, dword ptr [rsi + 4*r8]
	vaddss xmm6, xmm9, xmm6
	vmovss xmm9 {k1} {z}, dword ptr [rdx + 4*r8]
	vaddss xmm4, xmm9, xmm4
	vmovss xmm9 {k1} {z}, dword ptr [rip + .LCPI1949_2]
	vaddss xmm3, xmm9, xmm3
	cmp r11, r10
	jne .LBB1949_17
.LBB1949_7:
	cmp rcx, r9
	ja .LBB1949_30
	cmp rcx, r9
	jb .LBB1949_9
	jmp .LBB1949_23
	.p2align	4
.LBB1949_21:
	cmp rcx, r9
	je .LBB1949_22
.LBB1949_9:
	mov rsi, rcx
	imul rsi, qword ptr [rsp + 232]
	inc rcx
	lea r8, [rsi + rax]
	cmp r8, r13
	jae .LBB1949_21
	add rsi, qword ptr [rsp + 224]
	cmp rsi, r13
	jae .LBB1949_21
	mov rdx, qword ptr [rsp + 112]
	mov r8d, dword ptr [rdx + 4*r8]
	mov esi, dword ptr [rdx + 4*rsi]
	cmp esi, r8d
	jb .LBB1949_21
	cmp qword ptr [rsp + 104], rsi
	jb .LBB1949_21
	cmp esi, r8d
	je .LBB1949_21
	mov rdx, qword ptr [rsp + 96]
	mov rdi, qword ptr [rsp + 88]
	sub rsi, r8
	lea rdx, [rdx + 4*r8]
	lea r11, [rdi + 4*r8]
	lea r10, [rdx + 4*rsi]
	shl rsi, 2
	.p2align	4
.LBB1949_15:
	mov r8d, dword ptr [r11 - 4]
	cmp r12, r8
	setne dl
	cmp r15, r8
	seta dil
	cmp rbx, r8
	seta r14b
	and r14b, dil
	and r14b, dl
	cmp rbp, r8
	seta dl
	test r14b, dl
	jne .LBB1949_16
	add r11, 4
	add rsi, -4
	jne .LBB1949_15
	jmp .LBB1949_21
	.p2align	4
.LBB1949_22:
	mov rcx, r9
.LBB1949_23:
	cmp byte ptr [rsp + 15], 0
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm2
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	je .LBB1949_32
	mov rdx, qword ptr [rsp + 112]
	mov rsi, qword ptr [rsp + 208]
	mov r8d, dword ptr [rdx + 4*rsi]
	mov rsi, qword ptr [rsp + 216]
	mov esi, dword ptr [rdx + 4*rsi]
	cmp esi, r8d
	jb .LBB1949_32
	cmp qword ptr [rsp + 104], rsi
	jb .LBB1949_32
	cmp esi, r8d
	je .LBB1949_32
	mov rdx, qword ptr [rsp + 96]
	mov rdi, qword ptr [rsp + 88]
	sub rsi, r8
	lea rdx, [rdx + 4*r8]
	lea r11, [rdi + 4*r8]
	lea r10, [rdx + 4*rsi]
	shl rsi, 2
	.p2align	4
.LBB1949_28:
	mov r8d, dword ptr [r11 - 4]
	cmp r12, r8
	setne dl
	cmp r15, r8
	seta dil
	cmp rbx, r8
	seta r14b
	and r14b, dil
	and r14b, dl
	cmp rbp, r8
	seta dl
	test r14b, dl
	jne .LBB1949_31
	add r11, 4
	add rsi, -4
	jne .LBB1949_28
	jmp .LBB1949_32
	.p2align	4
.LBB1949_31:
	mov rdx, qword ptr [rsp + 72]
	mov rdi, qword ptr [rsp + 48]
	mov r14b, 1
	vmovss xmm9, dword ptr [rdx + 4*r8]
	mov rdx, qword ptr [rsp + 64]
	vmovss xmm10, dword ptr [rdx + 4*r8]
	vsubss xmm11, xmm0, xmm9
	vmulss xmm13, xmm11, xmm11
	vsubss xmm12, xmm1, xmm10
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vucomiss xmm15, xmm13
	vcmpltss k0, xmm13, xmm16
	seta sil
	vucomiss xmm13, xmm17
	kmovd k1, esi
	vmovss xmm11 {k1} {z}, xmm11, xmm11
	vaddss xmm7, xmm11, xmm7
	vmovss xmm11 {k1} {z}, xmm12, xmm12
	vcmpless k1, xmm15, xmm13
	seta dl
	vaddss xmm5, xmm11, xmm5
	kandw k0, k1, k0
	kmovd esi, k0
	and dl, sil
	mov rsi, qword ptr [rsp + 56]
	kmovd k1, edx
	vmovss xmm9 {k1} {z}, xmm9, xmm9
	vmovss xmm12 {k1} {z}, dword ptr [rdi + 4*r8]
	vaddss xmm2, xmm9, xmm2
	vmovss xmm9 {k1} {z}, xmm10, xmm10
	vaddss xmm8, xmm8, xmm9
	vmovss xmm9 {k1} {z}, dword ptr [rip + .LCPI1949_2]
	vmovss xmm13 {k1} {z}, dword ptr [rsi + 4*r8]
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm2
	vmovss dword ptr [rsp + 20], xmm8
	vaddss xmm6, xmm12, xmm6
	vaddss xmm3, xmm9, xmm3
	vaddss xmm4, xmm13, xmm4
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	cmp r11, r10
	jne .LBB1949_18
	jmp .LBB1949_32
	.p2align	4
.LBB1949_17:
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm2
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	xor r14d, r14d
	vmovss dword ptr [rsp + 32], xmm3
	jmp .LBB1949_18
.LBB1949_30:
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm2
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	.p2align	4
.LBB1949_32:
	vmovdqa xmm0, xmmword ptr [rsp + 320]
	vmovdqa xmm1, xmmword ptr [rsp + 304]
	mov rsi, qword ptr [rsp + 200]
	lea rdi, [rsp + 136]
	lea rdx, [rsp + 240]
	lea rcx, [rsp + 120]
	lea r8, [rsp + 16]
	call swarm::rules::finish
	cmp r12, qword ptr [rsp + 192]
	jae .LBB1949_34
	vmovd xmm0, dword ptr [rsp + 136]
	vmovd xmm1, dword ptr [rsp + 140]
	mov rax, qword ptr [rsp + 176]
	mov rcx, qword ptr [rsp + 168]
	vmovss xmm2, dword ptr [rsp + 144]
	vmovss xmm3, dword ptr [rsp + 148]
	mov rdx, qword ptr [rsp + 160]
	vmovd dword ptr [rax + 4*r12], xmm0
	vmovd dword ptr [rcx + 4*r12], xmm1
	mov rcx, qword ptr [rsp + 152]
	vmovss dword ptr [rdx + 4*r12], xmm2
	vmovss dword ptr [rcx + 4*r12], xmm3
	jmp .LBB1949_34
.LBB1949_36:
	add rsp, 344
	.cfi_def_cfa_offset 56
	pop rbx
	.cfi_def_cfa_offset 48
	pop r12
	.cfi_def_cfa_offset 40
	pop r13
	.cfi_def_cfa_offset 32
	pop r14
	.cfi_def_cfa_offset 24
	pop r15
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	ret
