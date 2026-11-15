engine::force::pass_one::<f64>:
	.cfi_startproc
	mov rax, qword ptr [rsi + 8]
	mov r9, qword ptr [rsi + 24]
	mov r10, qword ptr [rsi + 40]
	cmp r9, rax
	cmovb rax, r9
	mov r9, qword ptr [rsi + 56]
	cmp r10, rax
	cmovb rax, r10
	mov r10, qword ptr [r8 + 8]
	cmp r9, rax
	cmovb rax, r9
	mov r9, qword ptr [r8 + 24]
	cmp r9, r10
	cmovb r10, r9
	cmp rax, rcx
	cmovae rax, rcx
	cmp r10, rax
	cmovb rax, r10
	test rax, rax
	je .LBB31_9
	push r14
	.cfi_def_cfa_offset 16
	push rbx
	.cfi_def_cfa_offset 24
	.cfi_offset rbx, -24
	.cfi_offset r14, -16
	vmovsd xmm0, qword ptr [rdi]
	vmovsd xmm1, qword ptr [rdi + 8]
	vmovsd xmm2, qword ptr [rdi + 16]
	vmovsd xmm3, qword ptr [rdi + 24]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r10, qword ptr [r8]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 8
	jb .LBB31_2
	vmovq xmm4, r9
	vmovq xmm5, rdi
	vpunpcklqdq xmm4, xmm5, xmm4
	vmovq xmm5, rcx
	vmovq xmm6, r10
	vpbroadcastq xmm6, xmm6
	vpunpcklqdq xmm7, xmm6, xmm5
	vinserti128 ymm7, ymm7, xmm4, 1
	vmovq xmm8, rsi
	vpunpcklqdq xmm5, xmm8, xmm5
	vinserti128 ymm4, ymm5, xmm4, 1
	vmovq xmm5, r8
	vpbroadcastq xmm5, xmm5
	vpunpcklqdq xmm8, xmm6, xmm5
	vinserti128 ymm8, ymm8, xmm5, 1
	vpsubq ymm4, ymm4, ymm8
	vpunpcklqdq xmm5, xmm5, xmm6
	vinserti128 ymm5, ymm5, xmm6, 1
	vpsubq ymm5, ymm7, ymm5
	mov r11, rsi
	sub r11, r8
	cmp r11, -31
	setae r11b
	vpbroadcastq ymm6, qword ptr [rip + .LCPI31_0]
	vpxor ymm4, ymm4, ymm6
	vpbroadcastq ymm7, qword ptr [rip + .LCPI31_1]
	vpcmpgtq ymm4, ymm4, ymm7
	vpxor ymm5, ymm5, ymm6
	vpcmpgtq ymm5, ymm5, ymm7
	vpackssdw ymm4, ymm5, ymm4
	vtestps ymm4, ymm4
	setne bl
	or bl, r11b
	je .LBB31_5
.LBB31_2:
	xor r11d, r11d
.LBB31_10:
	lea r8, [r8 + 8*r11]
	lea r10, [r10 + 8*r11]
	lea rsi, [rsi + 8*r11]
	lea r9, [r9 + 8*r11]
	lea rdi, [rdi + 8*r11]
	lea rcx, [rcx + 8*r11]
	sub rax, r11
	shl r11, 4
	add rdx, r11
	add rdx, 8
	xor r11d, r11d
	jmp .LBB31_12
	.p2align	4
.LBB31_11:
	vmovsd xmm7, qword ptr [rsi + r11]
	vmulsd xmm4, xmm4, xmm6
	vmulsd xmm5, xmm5, xmm6
	vmulsd xmm6, xmm7, xmm4
	vmovsd xmm8, qword ptr [rdx + 2*r11 - 8]
	vsubsd xmm6, xmm8, xmm6
	vmovsd xmm8, qword ptr [rdx + 2*r11]
	vmovsd qword ptr [rdx + 2*r11 - 8], xmm6
	vmulsd xmm6, xmm7, xmm5
	vsubsd xmm6, xmm8, xmm6
	vmovsd qword ptr [rdx + 2*r11], xmm6
	vmovsd qword ptr [r10 + r11], xmm4
	vmovsd qword ptr [r8 + r11], xmm5
	add r11, 8
	dec rax
	je .LBB31_8
.LBB31_12:
	vmovsd xmm4, qword ptr [rcx + r11]
	vmovsd xmm5, qword ptr [rdi + r11]
	vsubsd xmm4, xmm4, xmm0
	vsubsd xmm5, xmm5, xmm1
	vmulsd xmm6, xmm4, xmm4
	vmulsd xmm7, xmm5, xmm5
	vaddsd xmm6, xmm6, xmm7
	vaddsd xmm7, xmm3, xmm6
	vxorpd xmm6, xmm6, xmm6
	vucomisd xmm7, xmm6
	jne .LBB31_13
	jnp .LBB31_11
.LBB31_13:
	vmulsd xmm6, xmm2, qword ptr [r9 + r11]
	vsqrtsd xmm8, xmm7, xmm7
	vmulsd xmm7, xmm8, xmm7
	vdivsd xmm6, xmm6, xmm7
	jmp .LBB31_11
.LBB31_5:
	movabs r11, 576460752303423484
	and r11, rax
	vbroadcastsd ymm4, xmm0
	vbroadcastsd ymm5, xmm1
	vbroadcastsd ymm6, xmm3
	vbroadcastsd ymm7, xmm2
	lea rbx, [8*rax]
	and rbx, -32
	xor r14d, r14d
	vpxor xmm8, xmm8, xmm8
	.p2align	4
.LBB31_6:
	vmovupd ymm9, ymmword ptr [rcx + r14]
	vsubpd ymm9, ymm9, ymm4
	vmovupd ymm10, ymmword ptr [rdi + r14]
	vsubpd ymm10, ymm10, ymm5
	vmulpd ymm11, ymm9, ymm9
	vmulpd ymm12, ymm10, ymm10
	vaddpd ymm11, ymm11, ymm12
	vmulpd ymm12, ymm7, ymmword ptr [r9 + r14]
	vaddpd ymm11, ymm11, ymm6
	vsqrtpd ymm13, ymm11
	vmulpd ymm13, ymm11, ymm13
	vdivpd ymm12, ymm12, ymm13
	vmovupd ymm13, ymmword ptr [rsi + r14]
	vcmpneqpd ymm11, ymm11, ymm8
	vandpd ymm11, ymm11, ymm12
	vmulpd ymm9, ymm9, ymm11
	vmulpd ymm10, ymm10, ymm11
	vmulpd ymm11, ymm13, ymm9
	vmovupd ymm12, ymmword ptr [rdx + 2*r14]
	vmovupd ymm14, ymmword ptr [rdx + 2*r14 + 32]
	vperm2f128 ymm15, ymm12, ymm14, 49
	vinsertf128 ymm12, ymm12, xmm14, 1
	vunpcklpd ymm14, ymm12, ymm15
	vsubpd ymm11, ymm14, ymm11
	vunpckhpd ymm12, ymm12, ymm15
	vmulpd ymm13, ymm13, ymm10
	vsubpd ymm12, ymm12, ymm13
	vpermpd ymm13, ymm12, 230
	vpermpd ymm14, ymm11, 230
	vshufpd ymm13, ymm14, ymm13, 12
	vpermpd ymm12, ymm12, 96
	vpermpd ymm11, ymm11, 212
	vblendpd ymm11, ymm11, ymm12, 10
	vmovupd ymmword ptr [rdx + 2*r14], ymm11
	vmovupd ymmword ptr [rdx + 2*r14 + 32], ymm13
	vmovupd ymmword ptr [r10 + r14], ymm9
	vmovupd ymmword ptr [r8 + r14], ymm10
	add r14, 32
	cmp rbx, r14
	jne .LBB31_6
	cmp rax, r11
	jne .LBB31_10
.LBB31_8:
	pop rbx
	.cfi_def_cfa_offset 16
	pop r14
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r14
.LBB31_9:
	vzeroupper
	ret
