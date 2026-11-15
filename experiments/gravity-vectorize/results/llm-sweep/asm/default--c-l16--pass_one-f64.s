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
	push rbp
	.cfi_def_cfa_offset 16
	push r14
	.cfi_def_cfa_offset 24
	push rbx
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	.cfi_offset rbp, -16
	movsd xmm0, qword ptr [rdi]
	movsd xmm1, qword ptr [rdi + 8]
	movsd xmm2, qword ptr [rdi + 16]
	movsd xmm3, qword ptr [rdi + 24]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r10, qword ptr [r8]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 4
	jb .LBB31_2
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
	movsd xmm7, qword ptr [rsi + r11]
	mulsd xmm4, xmm6
	mulsd xmm5, xmm6
	movapd xmm6, xmm7
	mulsd xmm6, xmm4
	movsd xmm8, qword ptr [rdx + 2*r11 - 8]
	subsd xmm8, xmm6
	movsd xmm6, qword ptr [rdx + 2*r11]
	movsd qword ptr [rdx + 2*r11 - 8], xmm8
	mulsd xmm7, xmm5
	subsd xmm6, xmm7
	movsd qword ptr [rdx + 2*r11], xmm6
	movsd qword ptr [r10 + r11], xmm4
	movsd qword ptr [r8 + r11], xmm5
	add r11, 8
	dec rax
	je .LBB31_8
.LBB31_12:
	movsd xmm4, qword ptr [rcx + r11]
	movsd xmm5, qword ptr [rdi + r11]
	subsd xmm4, xmm0
	subsd xmm5, xmm1
	movapd xmm6, xmm4
	mulsd xmm6, xmm4
	movapd xmm7, xmm5
	mulsd xmm7, xmm5
	addsd xmm7, xmm6
	addsd xmm7, xmm3
	xorpd xmm6, xmm6
	ucomisd xmm7, xmm6
	jne .LBB31_13
	jnp .LBB31_11
.LBB31_13:
	movsd xmm6, qword ptr [r9 + r11]
	mulsd xmm6, xmm2
	xorps xmm8, xmm8
	sqrtsd xmm8, xmm7
	mulsd xmm8, xmm7
	divsd xmm6, xmm8
	jmp .LBB31_11
.LBB31_5:
	movabs r11, 576460752303423486
	and r11, rax
	movapd xmm4, xmm0
	unpcklpd xmm4, xmm0
	movapd xmm5, xmm1
	unpcklpd xmm5, xmm1
	movapd xmm6, xmm3
	unpcklpd xmm6, xmm3
	movapd xmm7, xmm2
	unpcklpd xmm7, xmm2
	lea rbx, [8*rax]
	and rbx, -16
	xor r14d, r14d
	xorpd xmm8, xmm8
	.p2align	4
.LBB31_6:
	movupd xmm9, xmmword ptr [rcx + r14]
	subpd xmm9, xmm4
	movupd xmm12, xmmword ptr [rdi + r14]
	subpd xmm12, xmm5
	movupd xmm13, xmmword ptr [r9 + r14]
	mulpd xmm13, xmm7
	movupd xmm11, xmmword ptr [rsi + r14]
	movapd xmm14, xmm9
	mulpd xmm14, xmm9
	movapd xmm10, xmm12
	mulpd xmm10, xmm12
	addpd xmm10, xmm14
	addpd xmm10, xmm6
	sqrtpd xmm14, xmm10
	mulpd xmm14, xmm10
	divpd xmm13, xmm14
	cmpneqpd xmm10, xmm8
	andpd xmm10, xmm13
	mulpd xmm9, xmm10
	mulpd xmm10, xmm12
	movapd xmm12, xmm11
	mulpd xmm12, xmm9
	movupd xmm13, xmmword ptr [rdx + 2*r14]
	movupd xmm14, xmmword ptr [rdx + 2*r14 + 16]
	movapd xmm15, xmm13
	unpcklpd xmm15, xmm14
	subpd xmm15, xmm12
	unpckhpd xmm13, xmm14
	mulpd xmm11, xmm10
	subpd xmm13, xmm11
	movapd xmm11, xmm15
	unpckhpd xmm11, xmm13
	unpcklpd xmm15, xmm13
	movupd xmmword ptr [rdx + 2*r14], xmm15
	movupd xmmword ptr [rdx + 2*r14 + 16], xmm11
	movupd xmmword ptr [r10 + r14], xmm9
	movupd xmmword ptr [r8 + r14], xmm10
	add r14, 16
	cmp rbx, r14
	jne .LBB31_6
	cmp rax, r11
	jne .LBB31_10
.LBB31_8:
	pop rbx
	.cfi_def_cfa_offset 24
	pop r14
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r14
	.cfi_restore rbp
.LBB31_9:
	ret
