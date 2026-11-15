engine::force::sweep::<f64>:
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
	sub rsp, 136
	.cfi_def_cfa_offset 192
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rcx
	mov r11, qword ptr [rsp + 216]
	mov r10, qword ptr [rsp + 200]
	mov ebp, r9d
	and ebp, 7
	mov qword ptr [rsp + 40], r9
	mov rcx, r9
	shr rcx, 3
	mov eax, r10d
	and eax, 7
	mov r9, r10
	shr r9, 3
	mov r14d, r11d
	and r14d, 7
	mov r10, r11
	shr r10, 3
	mov qword ptr [rsp + 56], rbx
	shr rbx, 3
	cmp rcx, rbx
	cmovb rbx, rcx
	mov qword ptr [rsp + 48], rdi
	cmp r9, rbx
	cmovb rbx, r9
	mov r9, qword ptr [rsp + 248]
	cmp r10, rbx
	cmovb rbx, r10
	mov r11, qword ptr [rsp + 232]
	mov rcx, r11
	shr rcx, 3
	mov r10, r9
	shr r10, 3
	cmp r10, rcx
	cmovae r10, rcx
	cmp r10, rbx
	cmovae r10, rbx
	mov rbx, qword ptr [rsp + 240]
	mov r15, qword ptr [rsp + 224]
	mov r13, qword ptr [rsp + 208]
	mov r12, qword ptr [rsp + 192]
	test r10, r10
	movapd xmmword ptr [rsp - 16], xmm0
	je .LBB29_1
	movupd xmm1, xmmword ptr [rsi]
	movapd xmm2, xmm1
	shufpd xmm2, xmm1, 1
	movapd xmmword ptr [rsp + 112], xmm2
	movapd xmm2, xmm1
	unpcklpd xmm2, xmm1
	movapd xmmword ptr [rsp + 96], xmm2
	unpcklpd xmm0, xmm0
	movapd xmmword ptr [rsp + 80], xmm0
	movsd xmm0, qword ptr [rsi + 16]
	unpcklpd xmm0, xmm0
	movapd xmmword ptr [rsp + 64], xmm0
	unpckhpd xmm1, xmm1
	movapd xmmword ptr [rsp - 128], xmm1
	shl r10, 6
	xor ecx, ecx
	xorpd xmm12, xmm12
	xorpd xmm10, xmm10
	xorpd xmm11, xmm11
	xorpd xmm1, xmm1
	xorpd xmm9, xmm9
	xorpd xmm4, xmm4
	xorpd xmm6, xmm6
	xorpd xmm5, xmm5
	.p2align	4
.LBB29_3:
	movapd xmmword ptr [rsp - 112], xmm9
	movapd xmmword ptr [rsp - 80], xmm11
	movapd xmmword ptr [rsp - 48], xmm10
	movapd xmmword ptr [rsp - 96], xmm12
	movapd xmmword ptr [rsp - 32], xmm4
	movapd xmmword ptr [rsp - 64], xmm1
	movapd xmmword ptr [rsp], xmm5
	movapd xmmword ptr [rsp + 16], xmm6
	movupd xmm1, xmmword ptr [rdx + rcx]
	movupd xmm0, xmmword ptr [rdx + rcx + 16]
	movupd xmm14, xmmword ptr [rdx + rcx + 32]
	movupd xmm3, xmmword ptr [rdx + rcx + 48]
	movapd xmm11, xmmword ptr [rsp + 96]
	subpd xmm1, xmm11
	movupd xmm9, xmmword ptr [r8 + rcx]
	movupd xmm5, xmmword ptr [r8 + rcx + 16]
	movupd xmm4, xmmword ptr [r8 + rcx + 32]
	movapd xmm13, xmmword ptr [rsp - 128]
	subpd xmm9, xmm13
	movapd xmm2, xmm1
	mulpd xmm2, xmm1
	movapd xmm15, xmm9
	mulpd xmm15, xmm9
	addpd xmm15, xmm2
	movapd xmm10, xmmword ptr [rsp + 80]
	addpd xmm15, xmm10
	movupd xmm7, xmmword ptr [r12 + rcx]
	movupd xmm2, xmmword ptr [r12 + rcx + 16]
	movupd xmm6, xmmword ptr [r12 + rcx + 32]
	movapd xmm12, xmmword ptr [rsp + 64]
	mulpd xmm7, xmm12
	sqrtpd xmm8, xmm15
	mulpd xmm8, xmm15
	divpd xmm7, xmm8
	xorpd xmm8, xmm8
	cmpneqpd xmm15, xmm8
	andpd xmm15, xmm7
	subpd xmm0, xmm11
	subpd xmm5, xmm13
	movapd xmm7, xmm0
	mulpd xmm7, xmm0
	movapd xmm8, xmm5
	mulpd xmm8, xmm5
	addpd xmm8, xmm7
	addpd xmm8, xmm10
	mulpd xmm2, xmm12
	sqrtpd xmm7, xmm8
	mulpd xmm7, xmm8
	divpd xmm2, xmm7
	xorpd xmm7, xmm7
	cmpneqpd xmm8, xmm7
	andpd xmm8, xmm2
	subpd xmm14, xmm11
	movapd xmm11, xmmword ptr [rsp - 80]
	subpd xmm4, xmm13
	movapd xmm7, xmm14
	mulpd xmm7, xmm14
	movapd xmm2, xmm4
	mulpd xmm2, xmm4
	addpd xmm2, xmm7
	addpd xmm2, xmm10
	mulpd xmm6, xmm12
	sqrtpd xmm7, xmm2
	mulpd xmm7, xmm2
	divpd xmm6, xmm7
	movupd xmm7, xmmword ptr [r8 + rcx + 48]
	xorpd xmm13, xmm13
	cmpneqpd xmm2, xmm13
	andpd xmm2, xmm6
	movupd xmm6, xmmword ptr [r12 + rcx + 48]
	mulpd xmm1, xmm15
	mulpd xmm0, xmm8
	mulpd xmm14, xmm2
	mulpd xmm15, xmm9
	mulpd xmm8, xmm5
	mulpd xmm2, xmm4
	movapd xmm5, xmm7
	unpckhpd xmm5, xmm3
	unpcklpd xmm7, xmm3
	movapd xmm3, xmmword ptr [rsp + 112]
	subpd xmm7, xmm3
	subpd xmm5, xmm3
	movapd xmm3, xmm5
	mulpd xmm3, xmm5
	movapd xmm9, xmm7
	mulpd xmm9, xmm7
	movapd xmm4, xmm9
	unpckhpd xmm4, xmm3
	unpcklpd xmm9, xmm3
	addpd xmm9, xmm4
	addpd xmm9, xmm10
	movapd xmm10, xmmword ptr [rsp - 48]
	mulpd xmm6, xmm12
	movapd xmm12, xmmword ptr [rsp - 96]
	sqrtpd xmm3, xmm9
	mulpd xmm3, xmm9
	divpd xmm6, xmm3
	cmpneqpd xmm9, xmm13
	andpd xmm9, xmm6
	pshufd xmm4, xmm9, 68
	pshufd xmm3, xmm9, 238
	mulpd xmm3, xmm5
	mulpd xmm4, xmm7
	movupd xmm5, xmmword ptr [r13 + rcx]
	addpd xmm12, xmm1
	mulpd xmm1, xmm5
	movupd xmm6, xmmword ptr [r15 + rcx]
	subpd xmm6, xmm1
	movupd xmm1, xmmword ptr [r15 + rcx + 16]
	movupd xmmword ptr [r15 + rcx], xmm6
	movupd xmm6, xmmword ptr [r13 + rcx + 16]
	addpd xmm10, xmm0
	mulpd xmm0, xmm6
	subpd xmm1, xmm0
	movupd xmmword ptr [r15 + rcx + 16], xmm1
	movupd xmm0, xmmword ptr [r15 + rcx + 32]
	movupd xmm1, xmmword ptr [r13 + rcx + 32]
	addpd xmm11, xmm14
	mulpd xmm14, xmm1
	subpd xmm0, xmm14
	movupd xmmword ptr [r15 + rcx + 32], xmm0
	movupd xmm0, xmmword ptr [r15 + rcx + 48]
	movupd xmm7, xmmword ptr [r13 + rcx + 48]
	movapd xmm9, xmm4
	unpckhpd xmm9, xmm3
	mulpd xmm9, xmm7
	subpd xmm0, xmm9
	movupd xmmword ptr [r15 + rcx + 48], xmm0
	mulpd xmm5, xmm15
	movupd xmm0, xmmword ptr [rbx + rcx]
	subpd xmm0, xmm5
	movupd xmm5, xmmword ptr [rbx + rcx + 16]
	movupd xmm9, xmmword ptr [rbx + rcx + 32]
	movupd xmm14, xmmword ptr [rbx + rcx + 48]
	movupd xmmword ptr [rbx + rcx], xmm0
	mulpd xmm6, xmm8
	subpd xmm5, xmm6
	movapd xmm6, xmmword ptr [rsp + 16]
	movupd xmmword ptr [rbx + rcx + 16], xmm5
	movapd xmm5, xmmword ptr [rsp]
	mulpd xmm1, xmm2
	subpd xmm9, xmm1
	movapd xmm1, xmmword ptr [rsp - 64]
	movupd xmmword ptr [rbx + rcx + 32], xmm9
	movapd xmm9, xmmword ptr [rsp - 112]
	addpd xmm5, xmm4
	unpcklpd xmm4, xmm3
	mulpd xmm4, xmm7
	subpd xmm14, xmm4
	movupd xmmword ptr [rbx + rcx + 48], xmm14
	movapd xmm4, xmmword ptr [rsp - 32]
	addpd xmm4, xmm8
	addpd xmm9, xmm15
	addpd xmm1, xmm2
	addpd xmm6, xmm3
	add rcx, 64
	cmp r10, rcx
	jne .LBB29_3
	jmp .LBB29_4
.LBB29_1:
	xorpd xmm12, xmm12
	xorpd xmm10, xmm10
	xorpd xmm11, xmm11
	xorpd xmm1, xmm1
	xorpd xmm9, xmm9
	xorpd xmm4, xmm4
	xorpd xmm6, xmm6
	xorpd xmm5, xmm5
.LBB29_4:
	movapd xmmword ptr [rsp - 48], xmm10
	movapd xmmword ptr [rsp - 80], xmm11
	mov r9, qword ptr [rsp + 56]
	mov ecx, r9d
	and ecx, 7
	cmp rbp, rcx
	cmovb rcx, rbp
	cmp rax, rcx
	cmovb rcx, rax
	cmp r14, rcx
	cmovb rcx, r14
	mov edi, r11d
	and edi, 7
	mov r14, qword ptr [rsp + 248]
	mov eax, r14d
	and eax, 7
	cmp rax, rdi
	cmovb rdi, rax
	cmp rdi, rcx
	cmovae rdi, rcx
	movapd xmm3, xmm5
	unpckhpd xmm3, xmm5
	test rdi, rdi
	je .LBB29_5
	movapd xmmword ptr [rsp - 96], xmm3
	movapd xmmword ptr [rsp - 32], xmm4
	movapd xmmword ptr [rsp - 64], xmm1
	movabs rax, 1152921504606846968
	movabs rcx, 576460752303423480
	and r9, rax
	mov rbp, r11
	mov r11, rsi
	mov rsi, qword ptr [rsp + 40]
	and rsi, rax
	mov r10, qword ptr [rsp + 200]
	and r10, rax
	mov qword ptr [rsp - 112], r10
	mov r10, qword ptr [rsp + 216]
	and r10, rax
	mov rax, r10
	and rbp, rcx
	and r14, rcx
	movsd xmm1, qword ptr [r11]
	movsd xmm4, qword ptr [r11 + 8]
	movsd xmm0, qword ptr [r11 + 16]
	movsd qword ptr [rsp - 128], xmm0
	movsd xmm8, qword ptr [rdx + 8*r9]
	movsd xmm14, qword ptr [r8 + 8*rsi]
	movsd xmm0, qword ptr [r13 + 8*r10]
	movapd xmm7, xmm1
	subsd xmm8, xmm1
	movapd xmm3, xmm8
	mulsd xmm3, xmm8
	movsd xmm2, qword ptr [r15 + 8*rbp]
	movsd xmm1, qword ptr [rbx + 8*r14]
	movapd xmm13, xmm4
	subsd xmm14, xmm4
	movapd xmm4, xmm14
	mulsd xmm4, xmm14
	addsd xmm4, xmm3
	movapd xmm15, xmmword ptr [rsp - 16]
	addsd xmm4, xmm15
	xorpd xmm3, xmm3
	ucomisd xmm4, xmm3
	movapd xmm10, xmm12
	movapd xmm11, xmm9
	jne .LBB29_7
	jnp .LBB29_8
.LBB29_7:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm3, qword ptr [r12 + 8*rcx]
	mulsd xmm3, qword ptr [rsp - 128]
	movapd xmm12, xmm15
	movapd xmm15, xmm5
	sqrtsd xmm5, xmm4
	mulsd xmm5, xmm4
	divsd xmm3, xmm5
	movapd xmm5, xmm15
	movapd xmm15, xmm12
.LBB29_8:
	mulsd xmm8, xmm3
	mulsd xmm14, xmm3
	movapd xmm3, xmm0
	mulsd xmm3, xmm8
	subsd xmm2, xmm3
	movsd qword ptr [r15 + 8*rbp], xmm2
	mulsd xmm0, xmm14
	subsd xmm1, xmm0
	movsd qword ptr [rbx + 8*r14], xmm1
	shufpd xmm14, xmmword ptr [rip + .LCPI29_0], 2
	addsd xmm8, xmm10
	addpd xmm14, xmm11
	shufpd xmm8, xmm10, 2
	cmp edi, 1
	je .LBB29_9
	movsd xmm1, qword ptr [rdx + 8*r9 + 8]
	movsd xmm0, qword ptr [r8 + 8*rsi + 8]
	movsd xmm2, qword ptr [r13 + 8*rax + 8]
	movapd xmm12, xmm7
	subsd xmm1, xmm7
	movapd xmm9, xmm13
	subsd xmm0, xmm13
	movapd xmm3, xmm1
	mulsd xmm3, xmm1
	movapd xmm4, xmm0
	mulsd xmm4, xmm0
	addsd xmm4, xmm3
	addsd xmm4, xmm15
	xorpd xmm3, xmm3
	ucomisd xmm4, xmm3
	jne .LBB29_11
	jnp .LBB29_12
.LBB29_11:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm3, qword ptr [r12 + 8*rcx + 8]
	mulsd xmm3, qword ptr [rsp - 128]
	movapd xmm12, xmm15
	movapd xmm15, xmm5
	xorps xmm5, xmm5
	sqrtsd xmm5, xmm4
	mulsd xmm5, xmm4
	divsd xmm3, xmm5
	movapd xmm5, xmm15
	movapd xmm15, xmm12
	movapd xmm12, xmm7
.LBB29_12:
	mulsd xmm1, xmm3
	mulsd xmm0, xmm3
	movapd xmm3, xmm2
	mulsd xmm3, xmm1
	movsd xmm4, qword ptr [r15 + 8*rbp + 8]
	subsd xmm4, xmm3
	movsd qword ptr [r15 + 8*rbp + 8], xmm4
	mulsd xmm2, xmm0
	movsd xmm3, qword ptr [rbx + 8*r14 + 8]
	subsd xmm3, xmm2
	movsd qword ptr [rbx + 8*r14 + 8], xmm3
	unpckhpd xmm10, xmm10
	addsd xmm10, xmm1
	unpckhpd xmm11, xmm11
	addsd xmm11, xmm0
	unpcklpd xmm8, xmm10
	unpcklpd xmm14, xmm11
	cmp edi, 2
	jne .LBB29_13
.LBB29_9:
	movapd xmm15, xmmword ptr [rsp - 48]
	movapd xmm0, xmmword ptr [rsp - 80]
	movapd xmm1, xmmword ptr [rsp - 64]
	movapd xmm10, xmmword ptr [rsp - 32]
	movapd xmm3, xmmword ptr [rsp - 96]
	jmp .LBB29_32
.LBB29_5:
	movapd xmm8, xmm12
	movapd xmm15, xmmword ptr [rsp - 48]
	movapd xmm0, xmmword ptr [rsp - 80]
	movapd xmm14, xmm9
	movapd xmm10, xmm4
.LBB29_32:
	mov rax, qword ptr [rsp + 48]
	movupd xmmword ptr [rax], xmm8
	movupd xmmword ptr [rax + 16], xmm15
	movupd xmmword ptr [rax + 32], xmm0
	movsd qword ptr [rax + 48], xmm3
	movhpd qword ptr [rax + 56], xmm6
	movupd xmmword ptr [rax + 64], xmm14
	movupd xmmword ptr [rax + 80], xmm10
	movupd xmmword ptr [rax + 96], xmm1
	movsd qword ptr [rax + 112], xmm5
	movlpd qword ptr [rax + 120], xmm6
	add rsp, 136
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
.LBB29_13:
	.cfi_def_cfa_offset 192
	movsd xmm0, qword ptr [rdx + 8*r9 + 16]
	movsd xmm10, qword ptr [r8 + 8*rsi + 16]
	movsd xmm1, qword ptr [r13 + 8*rax + 16]
	subsd xmm0, xmm12
	subsd xmm10, xmm9
	movapd xmm2, xmm0
	mulsd xmm2, xmm0
	movapd xmm3, xmm10
	mulsd xmm3, xmm10
	addsd xmm3, xmm2
	addsd xmm3, xmm15
	xorpd xmm2, xmm2
	ucomisd xmm3, xmm2
	movapd xmm11, xmmword ptr [rsp - 48]
	jne .LBB29_14
	jnp .LBB29_15
.LBB29_14:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm2, qword ptr [r12 + 8*rcx + 16]
	mulsd xmm2, qword ptr [rsp - 128]
	xorps xmm4, xmm4
	sqrtsd xmm4, xmm3
	mulsd xmm4, xmm3
	divsd xmm2, xmm4
.LBB29_15:
	mulsd xmm0, xmm2
	mulsd xmm10, xmm2
	movapd xmm2, xmm1
	mulsd xmm2, xmm0
	movsd xmm3, qword ptr [r15 + 8*rbp + 16]
	subsd xmm3, xmm2
	movsd qword ptr [r15 + 8*rbp + 16], xmm3
	mulsd xmm1, xmm10
	movsd xmm2, qword ptr [rbx + 8*r14 + 16]
	subsd xmm2, xmm1
	movsd qword ptr [rbx + 8*r14 + 16], xmm2
	movapd xmm15, xmm11
	addsd xmm15, xmm0
	cmp edi, 3
	jne .LBB29_17
	movapd xmm2, xmmword ptr [rsp - 32]
	addsd xmm2, xmm10
	movapd xmm0, xmmword ptr [rsp - 80]
	movapd xmm1, xmmword ptr [rsp - 64]
	movapd xmm10, xmm2
	movapd xmm3, xmmword ptr [rsp - 96]
	jmp .LBB29_32
.LBB29_17:
	movapd xmm13, xmmword ptr [rsp - 32]
	addsd xmm10, xmm13
	movsd xmm1, qword ptr [rdx + 8*r9 + 24]
	movsd xmm0, qword ptr [r8 + 8*rsi + 24]
	movsd xmm2, qword ptr [r13 + 8*rax + 24]
	subsd xmm1, xmm12
	subsd xmm0, xmm9
	movapd xmm3, xmm1
	mulsd xmm3, xmm1
	movapd xmm4, xmm0
	mulsd xmm4, xmm0
	addsd xmm4, xmm3
	addsd xmm4, qword ptr [rsp - 16]
	xorpd xmm3, xmm3
	ucomisd xmm4, xmm3
	jne .LBB29_18
	jnp .LBB29_19
.LBB29_18:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm3, qword ptr [r12 + 8*rcx + 24]
	mulsd xmm3, qword ptr [rsp - 128]
	movapd xmm11, xmm5
	sqrtsd xmm5, xmm4
	mulsd xmm5, xmm4
	divsd xmm3, xmm5
	movapd xmm5, xmm11
	movapd xmm11, xmmword ptr [rsp - 48]
.LBB29_19:
	mulsd xmm1, xmm3
	mulsd xmm0, xmm3
	movapd xmm3, xmm2
	mulsd xmm3, xmm1
	movsd xmm4, qword ptr [r15 + 8*rbp + 24]
	subsd xmm4, xmm3
	movsd qword ptr [r15 + 8*rbp + 24], xmm4
	mulsd xmm2, xmm0
	movsd xmm3, qword ptr [rbx + 8*r14 + 24]
	subsd xmm3, xmm2
	movsd qword ptr [rbx + 8*r14 + 24], xmm3
	unpckhpd xmm11, xmm11
	addsd xmm11, xmm1
	unpckhpd xmm13, xmm13
	addsd xmm13, xmm0
	unpcklpd xmm10, xmm13
	unpcklpd xmm15, xmm11
	cmp edi, 4
	jne .LBB29_21
	movapd xmm0, xmmword ptr [rsp - 80]
	movapd xmm1, xmmword ptr [rsp - 64]
	movapd xmm3, xmmword ptr [rsp - 96]
	jmp .LBB29_32
.LBB29_21:
	movsd xmm1, qword ptr [rdx + 8*r9 + 32]
	movsd xmm2, qword ptr [r8 + 8*rsi + 32]
	movsd xmm0, qword ptr [r13 + 8*rax + 32]
	subsd xmm1, xmm12
	subsd xmm2, xmm9
	movapd xmm3, xmm1
	mulsd xmm3, xmm1
	movapd xmm4, xmm2
	mulsd xmm4, xmm2
	addsd xmm4, xmm3
	addsd xmm4, qword ptr [rsp - 16]
	xorpd xmm3, xmm3
	ucomisd xmm4, xmm3
	jne .LBB29_22
	jnp .LBB29_23
.LBB29_22:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm3, qword ptr [r12 + 8*rcx + 32]
	mulsd xmm3, qword ptr [rsp - 128]
	movapd xmm11, xmm5
	xorps xmm5, xmm5
	sqrtsd xmm5, xmm4
	mulsd xmm5, xmm4
	divsd xmm3, xmm5
	movapd xmm5, xmm11
.LBB29_23:
	mulsd xmm1, xmm3
	mulsd xmm2, xmm3
	movapd xmm3, xmm0
	mulsd xmm3, xmm1
	movsd xmm4, qword ptr [r15 + 8*rbp + 32]
	subsd xmm4, xmm3
	movsd qword ptr [r15 + 8*rbp + 32], xmm4
	mulsd xmm0, xmm2
	movsd xmm3, qword ptr [rbx + 8*r14 + 32]
	subsd xmm3, xmm0
	movsd qword ptr [rbx + 8*r14 + 32], xmm3
	movapd xmm0, xmmword ptr [rsp - 80]
	addsd xmm0, xmm1
	movapd xmm1, xmmword ptr [rsp - 64]
	addsd xmm1, xmm2
	cmp edi, 5
	jne .LBB29_25
	movapd xmm3, xmmword ptr [rsp - 96]
	jmp .LBB29_32
.LBB29_25:
	movapd xmmword ptr [rsp], xmm5
	movapd xmmword ptr [rsp + 16], xmm6
	movsd xmm3, qword ptr [rdx + 8*r9 + 40]
	movsd xmm2, qword ptr [r8 + 8*rsi + 40]
	movsd xmm4, qword ptr [r13 + 8*rax + 40]
	subsd xmm3, xmm12
	subsd xmm2, xmm9
	movapd xmm5, xmm3
	mulsd xmm5, xmm3
	movapd xmm6, xmm2
	mulsd xmm6, xmm2
	addsd xmm6, xmm5
	addsd xmm6, qword ptr [rsp - 16]
	xorpd xmm5, xmm5
	ucomisd xmm6, xmm5
	jne .LBB29_26
	jnp .LBB29_27
.LBB29_26:
	mov rcx, qword ptr [rsp - 112]
	movsd xmm5, qword ptr [r12 + 8*rcx + 40]
	mulsd xmm5, qword ptr [rsp - 128]
	xorps xmm11, xmm11
	sqrtsd xmm11, xmm6
	mulsd xmm11, xmm6
	divsd xmm5, xmm11
.LBB29_27:
	mulsd xmm3, xmm5
	mulsd xmm2, xmm5
	movapd xmm5, xmm4
	mulsd xmm5, xmm3
	movsd xmm6, qword ptr [r15 + 8*rbp + 40]
	subsd xmm6, xmm5
	movsd qword ptr [r15 + 8*rbp + 40], xmm6
	mulsd xmm4, xmm2
	movsd xmm5, qword ptr [rbx + 8*r14 + 40]
	subsd xmm5, xmm4
	movsd qword ptr [rbx + 8*r14 + 40], xmm5
	movapd xmm4, xmmword ptr [rsp - 80]
	unpckhpd xmm4, xmm4
	addsd xmm4, xmm3
	movapd xmm3, xmmword ptr [rsp - 64]
	unpckhpd xmm3, xmm3
	addsd xmm3, xmm2
	unpcklpd xmm0, xmm4
	unpcklpd xmm1, xmm3
	cmp edi, 6
	jne .LBB29_29
	movapd xmm6, xmmword ptr [rsp + 16]
	movapd xmm5, xmmword ptr [rsp]
	movapd xmm3, xmmword ptr [rsp - 96]
	jmp .LBB29_32
.LBB29_29:
	movsd xmm3, qword ptr [rdx + 8*r9 + 48]
	movsd xmm2, qword ptr [r8 + 8*rsi + 48]
	movsd xmm4, qword ptr [r13 + 8*rax + 48]
	subsd xmm3, xmm12
	subsd xmm2, xmm9
	movapd xmm5, xmm3
	mulsd xmm5, xmm3
	movapd xmm6, xmm2
	mulsd xmm6, xmm2
	addsd xmm6, xmm5
	movapd xmm11, xmmword ptr [rsp - 16]
	addsd xmm11, xmm6
	xorpd xmm5, xmm5
	ucomisd xmm11, xmm5
	jne .LBB29_30
	jnp .LBB29_31
.LBB29_30:
	mov rax, qword ptr [rsp - 112]
	movsd xmm6, qword ptr [rsp - 128]
	mulsd xmm6, qword ptr [r12 + 8*rax + 48]
	xorps xmm5, xmm5
	sqrtsd xmm5, xmm11
	mulsd xmm5, xmm11
	divsd xmm6, xmm5
	movapd xmm5, xmm6
.LBB29_31:
	mulsd xmm3, xmm5
	mulsd xmm2, xmm5
	movapd xmm5, xmm4
	mulsd xmm5, xmm3
	movsd xmm6, qword ptr [r15 + 8*rbp + 48]
	subsd xmm6, xmm5
	movsd qword ptr [r15 + 8*rbp + 48], xmm6
	mulsd xmm4, xmm2
	movsd xmm5, qword ptr [rbx + 8*r14 + 48]
	subsd xmm5, xmm4
	movsd qword ptr [rbx + 8*r14 + 48], xmm5
	movapd xmm4, xmmword ptr [rsp - 96]
	addsd xmm4, xmm3
	movapd xmm3, xmm4
	movapd xmm5, xmmword ptr [rsp]
	addsd xmm5, xmm2
	movapd xmm6, xmmword ptr [rsp + 16]
	jmp .LBB29_32
