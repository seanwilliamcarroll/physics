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
	sub rsp, 328
	.cfi_def_cfa_offset 384
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r12, rdi
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 280], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 272], rax
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
	vmovaps xmmword ptr [rsp + 288], xmm2
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
	vmovaps xmmword ptr [rsp + 304], xmm6
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
	je .LBB1950_53
	lea rax, [r12 + 316]
	mov qword ptr [rsp + 248], rax
	mov rax, qword ptr [r12 + 8]
	mov qword ptr [rsp + 88], rax
	mov rax, qword ptr [r12 + 32]
	mov qword ptr [rsp + 80], rax
	mov rax, qword ptr [r12 + 64]
	mov rbx, qword ptr [r12 + 88]
	cmp rax, rbx
	cmovb rbx, rax
	mov rbp, qword ptr [r12 + 40]
	mov rax, qword ptr [r12 + 80]
	mov qword ptr [rsp + 72], rax
	mov rax, qword ptr [r12 + 56]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [r12 + 264]
	xor r13d, r13d
	mov qword ptr [rsp + 144], rax
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 240], rax
	mov rax, qword ptr [r12 + 272]
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 232], rax
	vmovss xmm0, dword ptr [r12 + 280]
	vmovss dword ptr [rsp + 100], xmm0
	vmovss xmm0, dword ptr [r12 + 320]
	vmulss xmm15, xmm0, xmm0
	mov rax, qword ptr [r12 + 136]
	mov rcx, qword ptr [r12 + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov rax, qword ptr [r12 + 160]
	cmp rax, rcx
	cmovb rcx, rax
	vmovss xmm0, dword ptr [r12 + 316]
	cmp rbp, rbx
	mov rdx, rbx
	cmovb rdx, rbp
	mov rax, qword ptr [r12 + 184]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 224], rcx
	vmulss xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 60], xmm0
	mov r14, qword ptr [r12 + 208]
	mov rax, qword ptr [r12 + 200]
	mov qword ptr [rsp + 136], rax
	mov rax, qword ptr [r12 + 256]
	mov qword ptr [rsp + 128], rax
	mov rax, qword ptr [r12 + 248]
	mov rcx, qword ptr [r12 + 104]
	mov qword ptr [rsp + 208], rcx
	mov rcx, qword ptr [r12 + 128]
	mov qword ptr [rsp + 200], rcx
	mov rcx, qword ptr [r12 + 152]
	mov qword ptr [rsp + 192], rcx
	mov rcx, qword ptr [r12 + 176]
	mov qword ptr [rsp + 184], rcx
	mov qword ptr [rsp + 120], rax
	add rax, 4
	mov qword ptr [rsp + 112], rax
	vmovss dword ptr [rsp + 96], xmm15
	mov qword ptr [rsp + 216], rdx
	jmp .LBB1950_2
	.p2align	4
.LBB1950_51:
	vmovss xmm15, dword ptr [rsp + 96]
	mov rdx, qword ptr [rsp + 216]
.LBB1950_52:
	inc r13
	cmp r13, r15
	je .LBB1950_53
.LBB1950_2:
	cmp r13, rdx
	jae .LBB1950_52
	mov rax, qword ptr [rsp + 88]
	vmovss xmm1, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 80]
	vmovss xmm2, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 64]
	vmovss xmm0, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 72]
	vmovss xmm3, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp + 152], xmm1
	vmovss dword ptr [rsp + 156], xmm2
	vmovss dword ptr [rsp + 160], xmm0
	vmovss dword ptr [rsp + 164], xmm3
	vmovss xmm9, dword ptr [rsp + 100]
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
	mov r8, qword ptr [rsp + 240]
	cmp r8, rax
	cmovb rax, r8
	vmovss xmm10, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm3, xmm10
	cmovae rax, r12
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
	mov rdi, qword ptr [rsp + 232]
	cmp rdi, rcx
	cmovb rcx, rdi
	vucomiss xmm3, xmm10
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
	mov r8, qword ptr [rsp + 144]
	imul r8, rcx
	lea r10, [r8 + rax]
	inc r10
	add r8, rdx
	inc rax
	mov qword ptr [rsp + 264], r8
	cmp r8, r14
	setb r9b
	mov qword ptr [rsp + 256], r10
	cmp r10, r14
	setb dil
	and dil, r9b
	mov byte ptr [rsp + 15], dil
	vxorps xmm3, xmm3, xmm3
	vxorps xmm4, xmm4, xmm4
	vxorpd xmm5, xmm5, xmm5
	vxorpd xmm6, xmm6, xmm6
	vxorpd xmm7, xmm7, xmm7
	vxorpd xmm8, xmm8, xmm8
	xor r11d, r11d
.LBB1950_4:
	test r11, r11
	je .LBB1950_13
	mov qword ptr [rsp + 48], r10
	cmp r11, r10
	jne .LBB1950_9
	jmp .LBB1950_13
	.p2align	4
.LBB1950_14:
	cmp rsi, rcx
	ja .LBB1950_48
	cmp rsi, rcx
	jb .LBB1950_16
	jmp .LBB1950_26
	.p2align	4
.LBB1950_24:
	cmp rsi, rcx
	je .LBB1950_25
.LBB1950_16:
	mov r8, rsi
	inc rsi
	imul r8, qword ptr [rsp + 144]
	lea r9, [r8 + rdx]
	cmp r9, r14
	jae .LBB1950_24
	add r8, rax
	cmp r8, r14
	jae .LBB1950_24
	mov rdi, qword ptr [rsp + 136]
	mov r9d, dword ptr [rdi + 4*r9]
	mov r8d, dword ptr [rdi + 4*r8]
	cmp r8d, r9d
	jb .LBB1950_24
	cmp qword ptr [rsp + 128], r8
	jb .LBB1950_24
	cmp r8d, r9d
	je .LBB1950_24
	sub r8, r9
	mov rdi, qword ptr [rsp + 120]
	lea rdi, [rdi + 4*r9]
	lea rdi, [rdi + 4*r8]
	mov qword ptr [rsp + 48], rdi
	shl r8, 2
	mov rdi, qword ptr [rsp + 112]
	lea r11, [rdi + 4*r9]
	.p2align	4
.LBB1950_22:
	mov r9d, dword ptr [r11 - 4]
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r12b
	cmp rbp, r9
	seta r10b
	and r10b, r12b
	and r10b, dil
	cmp rbx, r9
	seta dil
	test r10b, dil
	jne .LBB1950_41
	add r11, 4
	add r8, -4
	jne .LBB1950_22
	jmp .LBB1950_24
	.p2align	4
.LBB1950_41:
	mov rdi, qword ptr [rsp + 88]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 80]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	vsubss xmm11, xmm1, xmm10
	vsubss xmm12, xmm2, xmm9
	vmulss xmm13, xmm11, xmm11
	vmulss xmm14, xmm12, xmm12
	vaddss xmm13, xmm13, xmm14
	vucomiss xmm15, xmm13
	jbe .LBB1950_42
	vaddss xmm3, xmm11, xmm3
	vaddss xmm0, xmm12, xmm0
	mov r8, qword ptr [rsp + 48]
	jmp .LBB1950_7
	.p2align	4
.LBB1950_42:
	vmovss xmm11, dword ptr [rsp + 60]
	vucomiss xmm11, xmm13
	mov r8, qword ptr [rsp + 48]
	jbe .LBB1950_7
	vxorps xmm11, xmm11, xmm11
	vucomiss xmm13, xmm11
	jbe .LBB1950_7
	vaddss xmm8, xmm8, xmm10
	mov rdi, qword ptr [rsp + 64]
	vaddss xmm6, xmm6, dword ptr [rdi + 4*r9]
	vaddss xmm7, xmm9, xmm7
	mov rdi, qword ptr [rsp + 72]
	vaddss xmm5, xmm5, dword ptr [rdi + 4*r9]
	vaddss xmm4, xmm4, dword ptr [rip + .LCPI1950_3]
.LBB1950_7:
	cmp r11, r8
	je .LBB1950_14
	vmovss dword ptr [rsp + 16], xmm8
	vmovss dword ptr [rsp + 20], xmm7
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm5
	vmovss dword ptr [rsp + 32], xmm4
	vmovss dword ptr [rsp + 36], xmm3
	vmovss dword ptr [rsp + 40], xmm0
	xor r12d, r12d
	jmp .LBB1950_9
	.p2align	4
.LBB1950_25:
	mov rsi, rcx
.LBB1950_26:
	vmovss dword ptr [rsp + 16], xmm8
	vmovss dword ptr [rsp + 20], xmm7
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm5
	vmovss dword ptr [rsp + 32], xmm4
	vmovss dword ptr [rsp + 36], xmm3
	vmovss dword ptr [rsp + 40], xmm0
	cmp byte ptr [rsp + 15], 0
	je .LBB1950_49
	mov rdi, qword ptr [rsp + 136]
	mov r8, qword ptr [rsp + 264]
	mov r9d, dword ptr [rdi + 4*r8]
	mov r8, qword ptr [rsp + 256]
	mov r8d, dword ptr [rdi + 4*r8]
	cmp r8d, r9d
	jb .LBB1950_49
	cmp qword ptr [rsp + 128], r8
	jb .LBB1950_49
	cmp r8d, r9d
	je .LBB1950_49
	sub r8, r9
	mov rdi, qword ptr [rsp + 120]
	lea rdi, [rdi + 4*r9]
	lea rdi, [rdi + 4*r8]
	mov qword ptr [rsp + 48], rdi
	shl r8, 2
	mov rdi, qword ptr [rsp + 112]
	lea r11, [rdi + 4*r9]
	.p2align	4
.LBB1950_31:
	mov r9d, dword ptr [r11 - 4]
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r10b
	cmp rbp, r9
	seta r12b
	and r12b, r10b
	and r12b, dil
	cmp rbx, r9
	seta dil
	test r12b, dil
	jne .LBB1950_37
	add r11, 4
	add r8, -4
	jne .LBB1950_31
	jmp .LBB1950_49
	.p2align	4
.LBB1950_37:
	mov rdi, qword ptr [rsp + 88]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 80]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	vsubss xmm12, xmm1, xmm10
	vsubss xmm11, xmm2, xmm9
	vmulss xmm13, xmm12, xmm12
	vmulss xmm14, xmm11, xmm11
	vaddss xmm13, xmm13, xmm14
	vucomiss xmm15, xmm13
	jbe .LBB1950_38
	vaddss xmm3, xmm12, xmm3
	vmovss dword ptr [rsp + 36], xmm3
	vaddss xmm0, xmm11, xmm0
	vmovss dword ptr [rsp + 40], xmm0
	mov r8, qword ptr [rsp + 48]
	jmp .LBB1950_47
.LBB1950_38:
	vmovss xmm11, dword ptr [rsp + 60]
	vucomiss xmm11, xmm13
	mov r8, qword ptr [rsp + 48]
	jbe .LBB1950_47
	vxorps xmm11, xmm11, xmm11
	vucomiss xmm13, xmm11
	jbe .LBB1950_47
	mov rdi, qword ptr [rsp + 72]
	vmovss xmm11, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 64]
	vmovss xmm12, dword ptr [rdi + 4*r9]
	vaddss xmm8, xmm8, xmm10
	vmovss dword ptr [rsp + 16], xmm8
	vaddss xmm7, xmm9, xmm7
	vmovss dword ptr [rsp + 20], xmm7
	vaddss xmm6, xmm12, xmm6
	vmovss dword ptr [rsp + 24], xmm6
	vaddss xmm5, xmm11, xmm5
	vmovss dword ptr [rsp + 28], xmm5
	vaddss xmm4, xmm4, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 32], xmm4
.LBB1950_47:
	mov r12b, 1
	cmp r11, r8
	je .LBB1950_49
.LBB1950_9:
	mov qword ptr [rsp + 104], r12
	mov r10, qword ptr [rsp + 48]
	.p2align	4
.LBB1950_10:
	mov r9d, dword ptr [r11]
	add r11, 4
	cmp r13, r9
	setne dil
	cmp r15, r9
	seta r8b
	cmp rbp, r9
	seta r12b
	and r12b, r8b
	and r12b, dil
	cmp rbx, r9
	seta dil
	test r12b, dil
	jne .LBB1950_33
	cmp r11, r10
	jne .LBB1950_10
	mov r12, qword ptr [rsp + 104]
.LBB1950_13:
	test r12b, r12b
	je .LBB1950_14
	jmp .LBB1950_49
	.p2align	4
.LBB1950_33:
	mov rdi, qword ptr [rsp + 88]
	vmovss xmm10, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 80]
	vmovss xmm9, dword ptr [rdi + 4*r9]
	vsubss xmm13, xmm1, xmm10
	vsubss xmm12, xmm2, xmm9
	vmulss xmm11, xmm13, xmm13
	vmulss xmm14, xmm12, xmm12
	vaddss xmm11, xmm11, xmm14
	vucomiss xmm15, xmm11
	mov r12, qword ptr [rsp + 104]
	jbe .LBB1950_34
	vaddss xmm3, xmm13, xmm3
	vmovss dword ptr [rsp + 36], xmm3
	vaddss xmm0, xmm12, xmm0
	vmovss dword ptr [rsp + 40], xmm0
	jmp .LBB1950_4
	.p2align	4
.LBB1950_34:
	vmovss xmm12, dword ptr [rsp + 60]
	vucomiss xmm12, xmm11
	jbe .LBB1950_4
	vxorps xmm12, xmm12, xmm12
	vucomiss xmm11, xmm12
	jbe .LBB1950_4
	mov rdi, qword ptr [rsp + 72]
	vmovss xmm11, dword ptr [rdi + 4*r9]
	mov rdi, qword ptr [rsp + 64]
	vmovss xmm12, dword ptr [rdi + 4*r9]
	vaddss xmm8, xmm8, xmm10
	vmovss dword ptr [rsp + 16], xmm8
	vaddss xmm7, xmm9, xmm7
	vmovss dword ptr [rsp + 20], xmm7
	vaddss xmm6, xmm12, xmm6
	vmovss dword ptr [rsp + 24], xmm6
	vaddss xmm5, xmm11, xmm5
	vmovss dword ptr [rsp + 28], xmm5
	vaddss xmm4, xmm4, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 32], xmm4
	jmp .LBB1950_4
.LBB1950_48:
	vmovss dword ptr [rsp + 16], xmm8
	vmovss dword ptr [rsp + 20], xmm7
	vmovss dword ptr [rsp + 24], xmm6
	vmovss dword ptr [rsp + 28], xmm5
	vmovss dword ptr [rsp + 32], xmm4
	vmovss dword ptr [rsp + 36], xmm3
	vmovss dword ptr [rsp + 40], xmm0
	.p2align	4
.LBB1950_49:
	lea rdi, [rsp + 168]
	mov rsi, qword ptr [rsp + 248]
	vmovaps xmm0, xmmword ptr [rsp + 304]
	vmovapd xmm1, xmmword ptr [rsp + 288]
	lea rdx, [rsp + 272]
	lea rcx, [rsp + 152]
	lea r8, [rsp + 16]
	call swarm::rules::finish
	cmp r13, qword ptr [rsp + 224]
	jae .LBB1950_51
	vmovss xmm0, dword ptr [rsp + 168]
	vmovss xmm1, dword ptr [rsp + 172]
	vmovss xmm2, dword ptr [rsp + 176]
	vmovss xmm3, dword ptr [rsp + 180]
	mov rax, qword ptr [rsp + 208]
	vmovss dword ptr [rax + 4*r13], xmm0
	mov rax, qword ptr [rsp + 200]
	vmovss dword ptr [rax + 4*r13], xmm1
	mov rax, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*r13], xmm2
	mov rax, qword ptr [rsp + 184]
	vmovss dword ptr [rax + 4*r13], xmm3
	jmp .LBB1950_51
.LBB1950_53:
	add rsp, 328
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
