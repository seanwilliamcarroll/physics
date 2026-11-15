engine::force::pass_one::<f32>:
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
	je .LBB30_9
	push rbp
	.cfi_def_cfa_offset 16
	push r14
	.cfi_def_cfa_offset 24
	push rbx
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	.cfi_offset rbp, -16
	movss xmm0, dword ptr [rdi]
	movss xmm1, dword ptr [rdi + 4]
	movss xmm2, dword ptr [rdi + 8]
	movss xmm3, dword ptr [rdi + 12]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r10, qword ptr [r8]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 8
	jb .LBB30_2
	mov r11, r10
	sub r11, r8
	cmp r11, -15
	setae r11b
	mov rbx, rcx
	sub rbx, r10
	cmp rbx, -15
	setae bl
	or bl, r11b
	mov r11, rdi
	sub r11, r10
	cmp r11, -15
	setae r11b
	mov r14, r9
	sub r14, r10
	cmp r14, -15
	setae bpl
	or bpl, r11b
	or bpl, bl
	mov r11, rsi
	sub r11, r10
	cmp r11, -15
	setae r11b
	mov rbx, rcx
	sub rbx, r8
	cmp rbx, -15
	setae bl
	or bl, r11b
	mov r11, rdi
	sub r11, r8
	cmp r11, -15
	setae r11b
	or r11b, bl
	or r11b, bpl
	mov rbx, r9
	sub rbx, r8
	cmp rbx, -15
	setae bl
	mov r14, rsi
	sub r14, r8
	cmp r14, -15
	setae bpl
	or bpl, bl
	or bpl, r11b
	test bpl, 1
	je .LBB30_5
.LBB30_2:
	xor r11d, r11d
.LBB30_10:
	lea r8, [r8 + 4*r11]
	lea r10, [r10 + 4*r11]
	lea rsi, [rsi + 4*r11]
	lea r9, [r9 + 4*r11]
	lea rdi, [rdi + 4*r11]
	lea rcx, [rcx + 4*r11]
	lea rdx, [rdx + 8*r11]
	add rdx, 4
	sub rax, r11
	xor r11d, r11d
	jmp .LBB30_12
	.p2align	4
.LBB30_11:
	movss xmm7, dword ptr [rsi + 4*r11]
	mulss xmm4, xmm6
	mulss xmm5, xmm6
	movaps xmm6, xmm7
	mulss xmm6, xmm4
	movss xmm8, dword ptr [rdx + 8*r11 - 4]
	subss xmm8, xmm6
	movss xmm6, dword ptr [rdx + 8*r11]
	movss dword ptr [rdx + 8*r11 - 4], xmm8
	mulss xmm7, xmm5
	subss xmm6, xmm7
	movss dword ptr [rdx + 8*r11], xmm6
	movss dword ptr [r10 + 4*r11], xmm4
	movss dword ptr [r8 + 4*r11], xmm5
	inc r11
	cmp rax, r11
	je .LBB30_8
.LBB30_12:
	movss xmm4, dword ptr [rcx + 4*r11]
	movss xmm5, dword ptr [rdi + 4*r11]
	subss xmm4, xmm0
	subss xmm5, xmm1
	movaps xmm6, xmm4
	mulss xmm6, xmm4
	movaps xmm7, xmm5
	mulss xmm7, xmm5
	addss xmm7, xmm6
	addss xmm7, xmm3
	xorps xmm6, xmm6
	ucomiss xmm7, xmm6
	jne .LBB30_13
	jnp .LBB30_11
.LBB30_13:
	movss xmm6, dword ptr [r9 + 4*r11]
	mulss xmm6, xmm2
	xorps xmm8, xmm8
	sqrtss xmm8, xmm7
	mulss xmm8, xmm7
	divss xmm6, xmm8
	jmp .LBB30_11
.LBB30_5:
	movabs r11, 1152921504606846972
	and r11, rax
	movaps xmm4, xmm0
	shufps xmm4, xmm0, 0
	movaps xmm5, xmm1
	shufps xmm5, xmm1, 0
	movaps xmm6, xmm3
	shufps xmm6, xmm3, 0
	movaps xmm7, xmm2
	shufps xmm7, xmm2, 0
	lea rbx, [4*rax]
	and rbx, -16
	xor r14d, r14d
	xorps xmm8, xmm8
	.p2align	4
.LBB30_6:
	movups xmm9, xmmword ptr [rcx + r14]
	subps xmm9, xmm4
	movups xmm12, xmmword ptr [rdi + r14]
	subps xmm12, xmm5
	movups xmm13, xmmword ptr [r9 + r14]
	mulps xmm13, xmm7
	movups xmm11, xmmword ptr [rsi + r14]
	movaps xmm14, xmm9
	mulps xmm14, xmm9
	movaps xmm10, xmm12
	mulps xmm10, xmm12
	addps xmm10, xmm14
	addps xmm10, xmm6
	sqrtps xmm14, xmm10
	mulps xmm14, xmm10
	divps xmm13, xmm14
	cmpneqps xmm10, xmm8
	andps xmm10, xmm13
	mulps xmm9, xmm10
	mulps xmm10, xmm12
	movaps xmm12, xmm11
	mulps xmm12, xmm9
	movups xmm13, xmmword ptr [rdx + 2*r14]
	movups xmm14, xmmword ptr [rdx + 2*r14 + 16]
	movaps xmm15, xmm13
	shufps xmm15, xmm14, 136
	subps xmm15, xmm12
	shufps xmm13, xmm14, 221
	mulps xmm11, xmm10
	subps xmm13, xmm11
	movaps xmm11, xmm15
	unpckhps xmm11, xmm13
	unpcklps xmm15, xmm13
	movups xmmword ptr [rdx + 2*r14], xmm15
	movups xmmword ptr [rdx + 2*r14 + 16], xmm11
	movups xmmword ptr [r10 + r14], xmm9
	movups xmmword ptr [r8 + r14], xmm10
	add r14, 16
	cmp rbx, r14
	jne .LBB30_6
	cmp rax, r11
	jne .LBB30_10
.LBB30_8:
	pop rbx
	.cfi_def_cfa_offset 24
	pop r14
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r14
	.cfi_restore rbp
.LBB30_9:
	ret
