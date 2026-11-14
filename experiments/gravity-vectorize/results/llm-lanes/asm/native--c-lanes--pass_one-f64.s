engine::force::pass_one::<f64>:
	.cfi_startproc
	push r14
	.cfi_def_cfa_offset 16
	push rbx
	.cfi_def_cfa_offset 24
	.cfi_offset rbx, -24
	.cfi_offset r14, -16
	mov rax, qword ptr [rsi + 8]
	mov r9, qword ptr [rsi + 24]
	mov r10, qword ptr [rsi + 40]
	mov r11, qword ptr [rsi + 56]
	mov rbx, qword ptr [r8 + 8]
	mov r14, qword ptr [r8 + 24]
	cmp r9, rax
	cmovb rax, r9
	cmp r10, rax
	cmovb rax, r10
	cmp r11, rax
	cmovb rax, r11
	cmp r14, rbx
	cmovb rbx, r14
	cmp rax, rcx
	cmovae rax, rcx
	cmp rbx, rax
	cmovb rax, rbx
	test rax, rax
	je .LBB29_13
	vmovsd xmm0, qword ptr [rdi]
	vmovsd xmm1, qword ptr [rdi + 8]
	vmovsd xmm2, qword ptr [rdi + 16]
	vmovsd xmm3, qword ptr [rdi + 24]
	mov r10, qword ptr [r8]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 16
	jb .LBB29_2
	vmovdqa64 zmm7, zmmword ptr [rip + .LCPI29_0]
	vmovq xmm4, r9
	vmovq xmm5, rdi
	vmovq xmm6, r10
	vmovq xmm8, rsi
	mov r11, rsi
	sub r11, r8
	vpunpcklqdq xmm4, xmm5, xmm4
	vmovq xmm5, rcx
	cmp r11, -63
	vpunpcklqdq xmm5, xmm6, xmm5
	setae r11b
	vinserti128 ymm4, ymm5, xmm4, 1
	vmovq xmm5, r8
	vinserti32x4 zmm4, zmm4, xmm8, 2
	vpermq zmm4, zmm7, zmm4
	vmovdqa64 zmm7, zmmword ptr [rip + .LCPI29_1]
	vpermi2q zmm7, zmm6, zmm5
	vpsubq zmm4, zmm4, zmm7
	vpcmpnleuq k0, zmm4, qword ptr [rip + .LCPI29_2]{1to8}
	kortestb k0, k0
	setne bl
	or bl, r11b
	je .LBB29_5
.LBB29_2:
	xor r11d, r11d
.LBB29_8:
	lea rbx, [r11 + 1]
	test al, 1
	je .LBB29_12
	vmovsd xmm5, qword ptr [rcx + 8*r11]
	vmovsd xmm6, qword ptr [rdi + 8*r11]
	vmovsd xmm4, qword ptr [rsi + 8*r11]
	mov r14, r11
	shl r14, 4
	add r14, rdx
	vsubsd xmm5, xmm5, xmm0
	vsubsd xmm6, xmm6, xmm1
	vmulsd xmm7, xmm5, xmm5
	vmulsd xmm8, xmm6, xmm6
	vaddsd xmm7, xmm8, xmm7
	vaddsd xmm8, xmm3, xmm7
	vxorpd xmm7, xmm7, xmm7
	vucomisd xmm8, xmm7
	jne .LBB29_10
	jnp .LBB29_11
.LBB29_10:
	vsqrtsd xmm9, xmm8, xmm8
	vmulsd xmm7, xmm2, qword ptr [r9 + 8*r11]
	vmulsd xmm8, xmm8, xmm9
	vdivsd xmm7, xmm7, xmm8
.LBB29_11:
	vmovsd xmm8, qword ptr [r14]
	vmovsd xmm9, qword ptr [r14 + 8]
	vmulsd xmm5, xmm5, xmm7
	vmulsd xmm6, xmm6, xmm7
	vmulsd xmm7, xmm4, xmm5
	vmulsd xmm4, xmm4, xmm6
	vsubsd xmm7, xmm8, xmm7
	vsubsd xmm4, xmm9, xmm4
	vmovsd qword ptr [r14], xmm7
	vmovsd qword ptr [r14 + 8], xmm4
	vmovsd qword ptr [r10 + 8*r11], xmm5
	vmovsd qword ptr [r8 + 8*r11], xmm6
	mov r11, rbx
.LBB29_12:
	cmp rax, rbx
	je .LBB29_13
	lea r8, [r8 + 8*r11 + 8]
	lea r10, [r10 + 8*r11 + 8]
	lea rsi, [rsi + 8*r11 + 8]
	lea r9, [r9 + 8*r11 + 8]
	lea rdi, [rdi + 8*r11 + 8]
	sub rax, r11
	lea rcx, [rcx + 8*r11 + 8]
	shl r11, 4
	add rdx, r11
	xor r11d, r11d
	jmp .LBB29_16
	.p2align	4
.LBB29_15:
	vmovsd xmm10, qword ptr [rsi + r11]
	vmulsd xmm8, xmm8, xmm4
	vmulsd xmm4, xmm9, xmm4
	vmulsd xmm7, xmm5, xmm7
	vmulsd xmm5, xmm5, xmm6
	vmovupd ymm6, ymmword ptr [rdx + 2*r11]
	vunpcklpd xmm5, xmm5, xmm7
	vmulsd xmm9, xmm10, xmm4
	vmulsd xmm10, xmm10, xmm8
	vunpcklpd xmm9, xmm10, xmm9
	vinsertf128 ymm5, ymm5, xmm9, 1
	vsubpd ymm5, ymm6, ymm5
	vmovupd ymmword ptr [rdx + 2*r11], ymm5
	vmovsd qword ptr [r10 + r11], xmm8
	vmovsd qword ptr [r8 + r11], xmm4
	add r11, 16
	add rax, -2
	je .LBB29_13
.LBB29_16:
	vmovsd xmm4, qword ptr [rcx + r11 - 8]
	vmovsd xmm5, qword ptr [rdi + r11 - 8]
	vxorpd xmm8, xmm8, xmm8
	vsubsd xmm6, xmm4, xmm0
	vsubsd xmm7, xmm5, xmm1
	vmulsd xmm4, xmm6, xmm6
	vmulsd xmm5, xmm7, xmm7
	vaddsd xmm4, xmm4, xmm5
	vaddsd xmm5, xmm3, xmm4
	vxorpd xmm4, xmm4, xmm4
	vucomisd xmm5, xmm4
	jne .LBB29_17
	jnp .LBB29_18
.LBB29_17:
	vsqrtsd xmm9, xmm5, xmm5
	vmulsd xmm8, xmm2, qword ptr [r9 + r11 - 8]
	vmulsd xmm5, xmm9, xmm5
	vdivsd xmm8, xmm8, xmm5
.LBB29_18:
	vmulsd xmm6, xmm8, xmm6
	vmulsd xmm7, xmm8, xmm7
	vmovsd xmm5, qword ptr [rsi + r11 - 8]
	vmovsd qword ptr [r10 + r11 - 8], xmm6
	vmovsd qword ptr [r8 + r11 - 8], xmm7
	vmovsd xmm8, qword ptr [rcx + r11]
	vmovsd xmm9, qword ptr [rdi + r11]
	vsubsd xmm8, xmm8, xmm0
	vsubsd xmm9, xmm9, xmm1
	vmulsd xmm10, xmm8, xmm8
	vmulsd xmm11, xmm9, xmm9
	vaddsd xmm10, xmm10, xmm11
	vaddsd xmm10, xmm10, xmm3
	vucomisd xmm10, xmm4
	jne .LBB29_19
	jnp .LBB29_15
.LBB29_19:
	vsqrtsd xmm11, xmm10, xmm10
	vmulsd xmm4, xmm2, qword ptr [r9 + r11]
	vmulsd xmm10, xmm10, xmm11
	vdivsd xmm4, xmm4, xmm10
	jmp .LBB29_15
.LBB29_5:
	vmovapd zmm9, zmmword ptr [rip + .LCPI29_3]
	vmovapd zmm10, zmmword ptr [rip + .LCPI29_4]
	vmovapd zmm11, zmmword ptr [rip + .LCPI29_5]
	vmovapd zmm12, zmmword ptr [rip + .LCPI29_6]
	movabs r11, 576460752303423480
	mov rbx, rax
	shr rbx, 3
	vbroadcastsd zmm4, xmm0
	vbroadcastsd zmm5, xmm1
	vbroadcastsd zmm6, xmm3
	vbroadcastsd zmm7, xmm2
	xor r14d, r14d
	vpxor xmm8, xmm8, xmm8
	and r11, rax
	shl rbx, 6
	.p2align	4
.LBB29_6:
	vmovupd zmm13, zmmword ptr [rcx + r14]
	vmovupd zmm14, zmmword ptr [rdi + r14]
	vmovupd zmm15, zmmword ptr [rsi + r14]
	vsubpd zmm13, zmm13, zmm4
	vsubpd zmm14, zmm14, zmm5
	vmulpd zmm16, zmm13, zmm13
	vmulpd zmm17, zmm14, zmm14
	vaddpd zmm16, zmm16, zmm17
	vmulpd zmm17, zmm7, zmmword ptr [r9 + r14]
	vaddpd zmm16, zmm6, zmm16
	vsqrtpd zmm18, zmm16
	vcmpneqpd k1, zmm16, zmm8
	vmulpd zmm18, zmm16, zmm18
	vdivpd zmm16 {k1} {z}, zmm17, zmm18
	vmovupd zmm17, zmmword ptr [rdx + 2*r14]
	vmovupd zmm18, zmmword ptr [rdx + 2*r14 + 64]
	vmovapd zmm19, zmm17
	vpermt2pd zmm19, zmm9, zmm18
	vpermt2pd zmm17, zmm10, zmm18
	vmulpd zmm13, zmm13, zmm16
	vmulpd zmm14, zmm14, zmm16
	vmulpd zmm16, zmm15, zmm13
	vmulpd zmm15, zmm15, zmm14
	vsubpd zmm16, zmm19, zmm16
	vsubpd zmm15, zmm17, zmm15
	vmovapd zmm17, zmm16
	vpermt2pd zmm17, zmm11, zmm15
	vpermt2pd zmm16, zmm12, zmm15
	vmovupd zmmword ptr [rdx + 2*r14], zmm16
	vmovupd zmmword ptr [rdx + 2*r14 + 64], zmm17
	vmovupd zmmword ptr [r10 + r14], zmm13
	vmovupd zmmword ptr [r8 + r14], zmm14
	add r14, 64
	cmp rbx, r14
	jne .LBB29_6
	cmp rax, r11
	jne .LBB29_8
.LBB29_13:
	pop rbx
	.cfi_def_cfa_offset 16
	pop r14
	.cfi_def_cfa_offset 8
	vzeroupper
	ret
