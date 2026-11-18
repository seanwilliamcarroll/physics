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
	mov r12, rdi
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 296], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 288], rax
	vmovss xmm0, dword ptr [rdi + 316]
	mov rsi, qword ptr [rdi + 8]
	mov rdx, qword ptr [rdi + 16]
	vmovsd xmm6, qword ptr [rdi + 288]
	vmovss xmm1, dword ptr [rip + .LCPI1950_0]
	vmulss xmm2, xmm6, xmm1
	vbroadcastss xmm3, dword ptr [rip + .LCPI1950_1]
	vorps xmm4, xmm0, xmm3
	vmaxss xmm5, xmm0, xmm2
	vandps xmm4, xmm4, xmm5
	vcmpunordss xmm5, xmm0, xmm0
	vblendvps xmm4, xmm4, xmm2, xmm5
	mov rcx, qword ptr [rdi + 32]
	vcmpunordss xmm2, xmm2, xmm2
	vblendvps xmm0, xmm4, xmm0, xmm2
	vmovshdup xmm2, xmm6
	vmovaps xmmword ptr [rsp + 304], xmm2
	vmulss xmm1, xmm2, xmm1
	vorps xmm2, xmm0, xmm3
	vmaxss xmm3, xmm0, xmm1
	vandps xmm2, xmm2, xmm3
	vcmpunordss xmm3, xmm0, xmm0
	vblendvps xmm2, xmm2, xmm1, xmm3
	mov r8, qword ptr [rdi + 40]
	vcmpunordss xmm1, xmm1, xmm1
	vblendvps xmm0, xmm2, xmm0, xmm1
	vmulss xmm0, xmm0, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [rip + .LCPI1950_3]
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rdi + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmovq xmm0, xmm0
	vmovaps xmmword ptr [rsp + 320], xmm6
	vmulps xmm0, xmm6, xmm0
	vroundps xmm1, xmm0, 10
	vmovshdup xmm0, xmm1
	vcvtss2sd xmm2, xmm0, xmm0
	vcvtss2sd xmm0, xmm1, xmm1
	add rdi, 192
	vxorps xmm4, xmm4, xmm4
	vcvttsd2si r9, xmm2
	mov r10, r9
	vmovsd xmm5, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm3, xmm2, xmm5
	vcvttsd2si rax, xmm3
	sar r10, 63
	and rax, r10
	or rax, r9
	xor r9d, r9d
	vxorps xmm6, xmm6, xmm6
	vucomisd xmm2, xmm6
	cmovb rax, r9
	vsubsd xmm3, xmm0, xmm5
	vcvttsd2si r10, xmm3
	vmovsd xmm3, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm2, xmm3
	vbroadcastss xmm2, dword ptr [rip + .LCPI1950_4]
	vcmpltps xmm2, xmm1, xmm2
	vcmpleps xmm1, xmm4, xmm1
	mov r14, -1
	cmova rax, r14
	vcvttsd2si r11, xmm0
	mov rbx, r11
	sar rbx, 63
	and r10, rbx
	or r10, r11
	vucomisd xmm0, xmm6
	cmovb r10, r9
	vucomisd xmm0, xmm3
	cmova r10, r14
	vandps xmm0, xmm1, xmm2
	vpmovsxdq xmm0, xmm0
	vmovq xmm1, r10
	vmovq xmm2, rax
	vpunpcklqdq xmm1, xmm1, xmm2
	vpcmpeqq xmm2, xmm1, xmm4
	vpsubq xmm1, xmm1, xmm2
	vmovddup xmm2, qword ptr [rip + .LCPI1950_8]
	vblendvpd xmm0, xmm2, xmm1, xmm0
	vmovupd xmmword ptr [r12 + 264], xmm0
	call <swarm::grid::Grid>::fill
	mov r15, qword ptr [r12 + 16]
	test r15, r15
	je .LBB1950_39
	lea rax, [r12 + 316]
	mov qword ptr [rsp + 264], rax
	mov rax, qword ptr [r12 + 8]
	mov qword ptr [rsp + 104], rax
	mov rax, qword ptr [r12 + 32]
	mov qword ptr [rsp + 96], rax
	mov rbx, qword ptr [r12 + 40]
	mov rax, qword ptr [r12 + 64]
	mov rbp, qword ptr [r12 + 88]
	cmp rax, rbp
	cmovb rbp, rax
	mov rax, qword ptr [r12 + 80]
	mov qword ptr [rsp + 88], rax
	mov rax, qword ptr [r12 + 56]
	mov qword ptr [rsp + 80], rax
	mov rax, qword ptr [r12 + 264]
	vmovss xmm0, dword ptr [r12 + 280]
	vmovss dword ptr [rsp + 116], xmm0
	xor r13d, r13d
	mov qword ptr [rsp + 160], rax
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 256], rax
	mov rax, qword ptr [r12 + 272]
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 248], rax
	vmovss xmm0, dword ptr [r12 + 320]
	vmulss xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 60], xmm0
	vmovss xmm0, dword ptr [r12 + 316]
	mov rax, qword ptr [r12 + 136]
	mov rcx, qword ptr [r12 + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov rax, qword ptr [r12 + 160]
	cmp rax, rcx
	cmovb rcx, rax
	vmulss xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 56], xmm0
	cmp rbx, rbp
	mov rdx, rbp
	cmovb rdx, rbx
	mov rax, qword ptr [r12 + 184]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 240], rcx
	mov r14, qword ptr [r12 + 208]
	mov rax, qword ptr [r12 + 200]
	mov qword ptr [rsp + 152], rax
	mov rax, qword ptr [r12 + 256]
	mov qword ptr [rsp + 144], rax
	mov rax, qword ptr [r12 + 248]
	mov rcx, qword ptr [r12 + 104]
	mov qword ptr [rsp + 224], rcx
	mov rcx, qword ptr [r12 + 128]
	mov qword ptr [rsp + 216], rcx
	mov rcx, qword ptr [r12 + 152]
	mov qword ptr [rsp + 208], rcx
	mov rcx, qword ptr [r12 + 176]
	mov qword ptr [rsp + 200], rcx
	mov qword ptr [rsp + 136], rax
	add rax, 4
	mov qword ptr [rsp + 128], rax
	mov qword ptr [rsp + 232], rdx
	jmp .LBB1950_2
	.p2align	4
.LBB1950_37:
	mov rdx, qword ptr [rsp + 232]
.LBB1950_38:
	inc r13
	cmp r13, r15
	je .LBB1950_39
.LBB1950_2:
	cmp r13, rdx
	jae .LBB1950_38
	mov rax, qword ptr [rsp + 104]
	vmovss xmm1, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 96]
	vmovss xmm2, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 80]
	vmovss xmm0, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 88]
	vmovss xmm3, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp + 168], xmm1
	vmovss dword ptr [rsp + 172], xmm2
	vmovss dword ptr [rsp + 176], xmm0
	vmovss dword ptr [rsp + 180], xmm3
	vmovss xmm9, dword ptr [rsp + 116]
	vmovss dword ptr [rsp + 68], xmm1
	vmulss xmm0, xmm9, xmm1
	vroundss xmm3, xmm0, xmm0, 9
	vxorps xmm0, xmm0, xmm0
	vmaxss xmm3, xmm3, xmm0
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rcx, xmm4
	mov rdx, rcx
	sar rdx, 63
	vmovsd xmm6, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm5, xmm4, xmm6
	vcvttsd2si rax, xmm5
	and rax, rdx
	or rax, rcx
	xor r12d, r12d
	vxorpd xmm7, xmm7, xmm7
	vucomisd xmm4, xmm7
	cmovb rax, r12
	vmovsd xmm8, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm4, xmm8
	mov rdi, -1
	cmova rax, rdi
	mov r8, qword ptr [rsp + 256]
	cmp r8, rax
	cmovb rax, r8
	vmovss xmm1, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm3, xmm1
	cmovae rax, r12
	vmovss dword ptr [rsp + 64], xmm2
	vmulss xmm3, xmm9, xmm2
	vroundss xmm3, xmm3, xmm3, 9
	vmaxss xmm3, xmm3, xmm0
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rdx, xmm4
	mov rsi, rdx
	sar rsi, 63
	vsubsd xmm5, xmm4, xmm6
	vcvttsd2si rcx, xmm5
	and rcx, rsi
	or rcx, rdx
	vucomisd xmm4, xmm7
	cmovb rcx, r12
	vucomisd xmm4, xmm8
	cmova rcx, rdi
	mov rdi, qword ptr [rsp + 248]
	cmp rdi, rcx
	cmovb rcx, rdi
	vucomiss xmm3, xmm1
	cmovae rcx, r12
	mov rdx, rax
	sub rdx, 1
	cmovb rdx, r12
	inc rax
	cmp r8, rax
	cmovb rax, r8
	mov rsi, rcx
	sub rsi, 1
	cmovb rsi, r12
	inc rcx
	cmp rdi, rcx
	cmovb rcx, rdi
	vxorps xmm3, xmm3, xmm3
	vmovups xmmword ptr [rsp + 28], xmm3
	vmovaps xmmword ptr [rsp + 16], xmm3
	mov r8, qword ptr [rsp + 160]
	imul r8, rcx
	lea r10, [r8 + rax]
	inc r10
	add r8, rdx
	inc rax
	mov qword ptr [rsp + 280], r8
	cmp r8, r14
	setb r9b
	mov qword ptr [rsp + 272], r10
	cmp r10, r14
	setb dil
	and dil, r9b
	mov byte ptr [rsp + 15], dil
	xor r11d, r11d
	vxorpd xmm5, xmm5, xmm5
	vxorpd xmm7, xmm7, xmm7
	vxorps xmm3, xmm3, xmm3
	vxorps xmm4, xmm4, xmm4
	vxorpd xmm6, xmm6, xmm6
	vxorpd xmm8, xmm8, xmm8
	test r11, r11
	je .LBB1950_12
.LBB1950_5:
	mov qword ptr [rsp + 72], r10
	cmp r11, r10
	jne .LBB1950_8
	jmp .LBB1950_12
	.p2align	4
.LBB1950_13:
	cmp rsi, rcx
	ja .LBB1950_32
	cmp rsi, rcx
	jb .LBB1950_15
	jmp .LBB1950_25
	.p2align	4
.LBB1950_23:
	cmp rsi, rcx
	je .LBB1950_24
.LBB1950_15:
	mov r8, rsi
	inc rsi
	imul r8, qword ptr [rsp + 160]
	lea r9, [r8 + rdx]
	cmp r9, r14
	jae .LBB1950_23
	add r8, rax
	cmp r8, r14
	jae .LBB1950_23
	mov rdi, qword ptr [rsp + 152]
	mov r9d, dword ptr [rdi + 4*r9]
	mov r8d, dword ptr [rdi + 4*r8]
	cmp r8d, r9d
	jb .LBB1950_23
	cmp qword ptr [rsp + 144], r8
	jb .LBB1950_23
	cmp r8d, r9d
	je .LBB1950_23
	sub r8, r9
	mov rdi, qword ptr [rsp + 136]
	lea rdi, [rdi + 4*r9]
	lea rdi, [rdi + 4*r8]
	mov qword ptr [rsp + 72], rdi
	shl r8, 2
	mov rdi, qword ptr [rsp + 128]
	lea r11, [rdi + 4*r9]
	.p2align	4
.LBB1950_21:
	mov r9d, dword ptr [r11 - 4]
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r12b
	cmp rbx, r9
	seta r10b
	and r10b, r12b
	and r10b, dil
	cmp rbp, r9
	seta dil
	test r10b, dil
	jne .LBB1950_6
	add r11, 4
	add r8, -4
	jne .LBB1950_21
	jmp .LBB1950_23
	.p2align	4
.LBB1950_6:
	mov rdi, qword ptr [rsp + 104]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 96]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	vmovss xmm1, dword ptr [rsp + 68]
	vsubss xmm11, xmm1, xmm9
	vmovss xmm1, dword ptr [rsp + 64]
	vsubss xmm12, xmm1, xmm10
	vmulss xmm13, xmm11, xmm11
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vmovss xmm1, dword ptr [rsp + 60]
	vcmpless xmm14, xmm1, xmm13
	vcmpltss xmm15, xmm13, dword ptr [rsp + 56]
	vmovss xmm2, dword ptr [rip + .LCPI1950_3]
	vandps xmm15, xmm15, xmm2
	vandps xmm14, xmm14, xmm15
	vxorps xmm15, xmm15, xmm15
	vcmpltss xmm15, xmm15, xmm13
	vandps xmm14, xmm15, xmm14
	vcmpltss xmm13, xmm13, xmm1
	vandps xmm13, xmm13, xmm2
	vmulss xmm11, xmm11, xmm13
	vaddss xmm7, xmm11, xmm7
	vmulss xmm11, xmm12, xmm13
	vaddss xmm5, xmm11, xmm5
	vmulss xmm9, xmm9, xmm14
	vaddss xmm0, xmm9, xmm0
	vmulss xmm9, xmm10, xmm14
	vaddss xmm8, xmm8, xmm9
	mov rdi, qword ptr [rsp + 80]
	vmulss xmm9, xmm14, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 88]
	vmulss xmm10, xmm14, dword ptr [rdi + 4*r9]
	vaddss xmm6, xmm9, xmm6
	vaddss xmm4, xmm10, xmm4
	vaddss xmm3, xmm14, xmm3
	cmp r11, qword ptr [rsp + 72]
	je .LBB1950_13
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	xor r12d, r12d
	jmp .LBB1950_8
	.p2align	4
.LBB1950_24:
	mov rsi, rcx
.LBB1950_25:
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	cmp byte ptr [rsp + 15], 0
	je .LBB1950_35
	mov rdi, qword ptr [rsp + 152]
	mov r8, qword ptr [rsp + 280]
	mov r9d, dword ptr [rdi + 4*r8]
	mov r8, qword ptr [rsp + 272]
	mov r8d, dword ptr [rdi + 4*r8]
	cmp r8d, r9d
	jb .LBB1950_35
	cmp qword ptr [rsp + 144], r8
	jb .LBB1950_35
	cmp r8d, r9d
	je .LBB1950_35
	sub r8, r9
	mov rdi, qword ptr [rsp + 136]
	lea rdi, [rdi + 4*r9]
	lea rdi, [rdi + 4*r8]
	mov qword ptr [rsp + 72], rdi
	shl r8, 2
	mov rdi, qword ptr [rsp + 128]
	lea r11, [rdi + 4*r9]
	.p2align	4
.LBB1950_30:
	mov r9d, dword ptr [r11 - 4]
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r10b
	cmp rbx, r9
	seta r12b
	and r12b, r10b
	and r12b, dil
	cmp rbp, r9
	seta dil
	test r12b, dil
	jne .LBB1950_34
	add r11, 4
	add r8, -4
	jne .LBB1950_30
	jmp .LBB1950_35
	.p2align	4
.LBB1950_34:
	mov rdi, qword ptr [rsp + 104]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 96]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	vmovss xmm1, dword ptr [rsp + 68]
	vsubss xmm11, xmm1, xmm9
	vmovss xmm1, dword ptr [rsp + 64]
	vsubss xmm12, xmm1, xmm10
	vmulss xmm13, xmm11, xmm11
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vmovss xmm1, dword ptr [rsp + 60]
	vcmpless xmm14, xmm1, xmm13
	vcmpltss xmm15, xmm13, dword ptr [rsp + 56]
	vmovss xmm2, dword ptr [rip + .LCPI1950_3]
	vandps xmm15, xmm15, xmm2
	vandps xmm14, xmm14, xmm15
	vxorps xmm15, xmm15, xmm15
	vcmpltss xmm15, xmm15, xmm13
	vandps xmm14, xmm15, xmm14
	vcmpltss xmm13, xmm13, xmm1
	vandps xmm13, xmm13, xmm2
	vmulss xmm11, xmm11, xmm13
	vaddss xmm7, xmm11, xmm7
	vmulss xmm11, xmm12, xmm13
	vaddss xmm5, xmm11, xmm5
	vmulss xmm9, xmm9, xmm14
	vaddss xmm0, xmm9, xmm0
	vmulss xmm9, xmm10, xmm14
	vaddss xmm8, xmm8, xmm9
	mov rdi, qword ptr [rsp + 80]
	vmulss xmm9, xmm14, dword ptr [rdi + 4*r9]
	vaddss xmm6, xmm9, xmm6
	mov rdi, qword ptr [rsp + 88]
	vmulss xmm9, xmm14, dword ptr [rdi + 4*r9]
	vaddss xmm4, xmm9, xmm4
	vaddss xmm3, xmm14, xmm3
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	mov r12b, 1
	cmp r11, qword ptr [rsp + 72]
	je .LBB1950_35
.LBB1950_8:
	mov qword ptr [rsp + 120], r12
	mov r10, qword ptr [rsp + 72]
	.p2align	4
.LBB1950_9:
	mov r9d, dword ptr [r11]
	add r11, 4
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r8b
	cmp rbx, r9
	seta r12b
	and r12b, r8b
	and r12b, dil
	cmp rbp, r9
	seta dil
	test r12b, dil
	jne .LBB1950_33
	cmp r11, r10
	jne .LBB1950_9
	mov r12, qword ptr [rsp + 120]
.LBB1950_12:
	test r12b, r12b
	je .LBB1950_13
	jmp .LBB1950_35
	.p2align	4
.LBB1950_33:
	mov rdi, qword ptr [rsp + 104]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 96]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	vmovss xmm1, dword ptr [rsp + 68]
	vsubss xmm11, xmm1, xmm9
	vmovss xmm1, dword ptr [rsp + 64]
	vsubss xmm12, xmm1, xmm10
	vmulss xmm13, xmm11, xmm11
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vmovss xmm1, dword ptr [rsp + 60]
	vcmpless xmm14, xmm1, xmm13
	vcmpltss xmm15, xmm13, dword ptr [rsp + 56]
	vmovss xmm2, dword ptr [rip + .LCPI1950_3]
	vandps xmm15, xmm15, xmm2
	vandps xmm14, xmm14, xmm15
	vxorps xmm15, xmm15, xmm15
	vcmpltss xmm15, xmm15, xmm13
	vandps xmm14, xmm15, xmm14
	vcmpltss xmm13, xmm13, xmm1
	vandps xmm13, xmm13, xmm2
	vmulss xmm11, xmm11, xmm13
	vaddss xmm7, xmm11, xmm7
	vmulss xmm11, xmm12, xmm13
	vaddss xmm5, xmm11, xmm5
	vmulss xmm9, xmm9, xmm14
	vaddss xmm0, xmm9, xmm0
	mov rdi, qword ptr [rsp + 80]
	vmulss xmm9, xmm14, dword ptr [rdi + 4*r9]
	vmulss xmm10, xmm10, xmm14
	vaddss xmm8, xmm8, xmm10
	vaddss xmm6, xmm9, xmm6
	mov rdi, qword ptr [rsp + 88]
	vmulss xmm9, xmm14, dword ptr [rdi + 4*r9]
	vaddss xmm4, xmm9, xmm4
	vaddss xmm3, xmm14, xmm3
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	mov r12, qword ptr [rsp + 120]
	test r11, r11
	jne .LBB1950_5
	jmp .LBB1950_12
.LBB1950_32:
	vmovss dword ptr [rsp + 36], xmm7
	vmovss dword ptr [rsp + 40], xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm4
	vmovss dword ptr [rsp + 32], xmm3
	.p2align	4
.LBB1950_35:
	lea rdi, [rsp + 184]
	mov rsi, qword ptr [rsp + 264]
	vmovaps xmm0, xmmword ptr [rsp + 320]
	vmovapd xmm1, xmmword ptr [rsp + 304]
	lea rdx, [rsp + 288]
	lea rcx, [rsp + 168]
	lea r8, [rsp + 16]
	call swarm::rules::finish
	cmp r13, qword ptr [rsp + 240]
	jae .LBB1950_37
	vmovss xmm0, dword ptr [rsp + 184]
	vmovss xmm1, dword ptr [rsp + 188]
	vmovss xmm2, dword ptr [rsp + 192]
	vmovss xmm3, dword ptr [rsp + 196]
	mov rax, qword ptr [rsp + 224]
	vmovss dword ptr [rax + 4*r13], xmm0
	mov rax, qword ptr [rsp + 216]
	vmovss dword ptr [rax + 4*r13], xmm1
	mov rax, qword ptr [rsp + 208]
	vmovss dword ptr [rax + 4*r13], xmm2
	mov rax, qword ptr [rsp + 200]
	vmovss dword ptr [rax + 4*r13], xmm3
	jmp .LBB1950_37
.LBB1950_39:
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
