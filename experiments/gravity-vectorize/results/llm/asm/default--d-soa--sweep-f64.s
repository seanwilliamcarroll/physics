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
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rcx
	mov r11, rsi
	mov rsi, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov ebp, r9d
	and ebp, 3
	mov qword ptr [rsp - 48], r9
	mov rcx, r9
	shr rcx, 2
	mov eax, r10d
	and eax, 3
	mov r9, r10
	shr r9, 2
	mov r14d, esi
	and r14d, 3
	mov r10, rsi
	shr r10, 2
	mov qword ptr [rsp - 32], rbx
	shr rbx, 2
	cmp rcx, rbx
	cmovb rbx, rcx
	mov qword ptr [rsp - 40], rdi
	cmp r9, rbx
	cmovb rbx, r9
	mov rdi, qword ptr [rsp + 112]
	cmp r10, rbx
	cmovb rbx, r10
	mov rsi, qword ptr [rsp + 96]
	mov rcx, rsi
	shr rcx, 2
	mov r10, rdi
	shr r10, 2
	cmp r10, rcx
	cmovae r10, rcx
	cmp r10, rbx
	cmovae r10, rbx
	mov rbx, qword ptr [rsp + 104]
	mov r15, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	movapd xmmword ptr [rsp - 24], xmm0
	mov qword ptr [rsp - 56], r11
	je .LBB29_1
	movupd xmm5, xmmword ptr [r11]
	movapd xmm6, xmm5
	shufpd xmm6, xmm5, 1
	movapd xmm1, xmm5
	unpcklpd xmm1, xmm5
	movapd xmmword ptr [rsp - 72], xmm1
	movapd xmm8, xmm0
	unpcklpd xmm8, xmm0
	movsd xmm9, qword ptr [r11 + 16]
	unpcklpd xmm9, xmm9
	unpckhpd xmm5, xmm5
	shl r10, 5
	xor ecx, ecx
	xorpd xmm3, xmm3
	xorpd xmm4, xmm4
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
	xorpd xmm7, xmm7
	.p2align	4
.LBB29_3:
	movupd xmm12, xmmword ptr [rdx + rcx]
	subpd xmm12, xmmword ptr [rsp - 72]
	movupd xmm13, xmmword ptr [rdx + rcx + 16]
	movupd xmm14, xmmword ptr [r8 + rcx]
	subpd xmm14, xmm5
	movupd xmm10, xmmword ptr [r8 + rcx + 16]
	movapd xmm15, xmm12
	mulpd xmm15, xmm12
	movapd xmm11, xmm14
	mulpd xmm11, xmm14
	addpd xmm11, xmm15
	addpd xmm11, xmm8
	movupd xmm15, xmmword ptr [r12 + rcx]
	mulpd xmm15, xmm9
	sqrtpd xmm0, xmm11
	mulpd xmm0, xmm11
	divpd xmm15, xmm0
	cmpneqpd xmm11, xmm7
	andpd xmm11, xmm15
	mulpd xmm12, xmm11
	mulpd xmm11, xmm14
	movapd xmm14, xmm10
	unpckhpd xmm14, xmm13
	unpcklpd xmm10, xmm13
	subpd xmm10, xmm6
	subpd xmm14, xmm6
	movapd xmm0, xmm14
	mulpd xmm0, xmm14
	movapd xmm13, xmm10
	mulpd xmm13, xmm10
	movapd xmm15, xmm13
	unpckhpd xmm15, xmm0
	unpcklpd xmm13, xmm0
	movupd xmm0, xmmword ptr [r12 + rcx + 16]
	addpd xmm13, xmm15
	addpd xmm13, xmm8
	mulpd xmm0, xmm9
	sqrtpd xmm15, xmm13
	mulpd xmm15, xmm13
	divpd xmm0, xmm15
	cmpneqpd xmm13, xmm7
	andpd xmm13, xmm0
	pshufd xmm15, xmm13, 68
	pshufd xmm13, xmm13, 238
	mulpd xmm13, xmm14
	mulpd xmm15, xmm10
	movupd xmm14, xmmword ptr [r13 + rcx]
	addpd xmm3, xmm12
	mulpd xmm12, xmm14
	movupd xmm0, xmmword ptr [r15 + rcx]
	subpd xmm0, xmm12
	movupd xmm10, xmmword ptr [r15 + rcx + 16]
	movupd xmmword ptr [r15 + rcx], xmm0
	movupd xmm0, xmmword ptr [r13 + rcx + 16]
	movapd xmm12, xmm15
	unpckhpd xmm12, xmm13
	mulpd xmm12, xmm0
	subpd xmm10, xmm12
	movupd xmmword ptr [r15 + rcx + 16], xmm10
	mulpd xmm14, xmm11
	movupd xmm10, xmmword ptr [rbx + rcx]
	subpd xmm10, xmm14
	movupd xmm12, xmmword ptr [rbx + rcx + 16]
	movupd xmmword ptr [rbx + rcx], xmm10
	addpd xmm2, xmm15
	unpcklpd xmm15, xmm13
	mulpd xmm15, xmm0
	subpd xmm12, xmm15
	movupd xmmword ptr [rbx + rcx + 16], xmm12
	addpd xmm4, xmm11
	addpd xmm1, xmm13
	add rcx, 32
	cmp r10, rcx
	jne .LBB29_3
	jmp .LBB29_4
.LBB29_1:
	xorpd xmm3, xmm3
	xorpd xmm4, xmm4
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
.LBB29_4:
	mov r9, qword ptr [rsp - 32]
	mov ecx, r9d
	and ecx, 3
	cmp rbp, rcx
	cmovb rcx, rbp
	cmp rax, rcx
	cmovb rcx, rax
	cmp r14, rcx
	cmovb rcx, r14
	mov eax, esi
	and eax, 3
	mov r10d, edi
	and r10d, 3
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rcx
	cmovae rax, rcx
	movapd xmm5, xmm2
	unpckhpd xmm5, xmm2
	test rax, rax
	je .LBB29_5
	movabs rcx, 1152921504606846972
	movabs r10, 576460752303423484
	and r9, rcx
	mov rbp, qword ptr [rsp - 48]
	and rbp, rcx
	mov r11, qword ptr [rsp + 64]
	and r11, rcx
	mov r14, qword ptr [rsp + 80]
	and r14, rcx
	and rsi, r10
	and rdi, r10
	mov r10, qword ptr [rsp - 56]
	movsd xmm10, qword ptr [r10]
	movsd xmm9, qword ptr [r10 + 8]
	movsd xmm6, qword ptr [r10 + 16]
	movsd xmm8, qword ptr [rdx + 8*r9]
	movsd xmm11, qword ptr [r8 + 8*rbp]
	movsd xmm7, qword ptr [r13 + 8*r14]
	subsd xmm8, xmm10
	subsd xmm11, xmm9
	movapd xmm0, xmm8
	mulsd xmm0, xmm8
	movapd xmm12, xmm11
	mulsd xmm12, xmm11
	addsd xmm12, xmm0
	movapd xmm15, xmmword ptr [rsp - 24]
	addsd xmm12, xmm15
	xorpd xmm0, xmm0
	ucomisd xmm12, xmm0
	jne .LBB29_7
	jnp .LBB29_8
.LBB29_7:
	movsd xmm0, qword ptr [r12 + 8*r11]
	mulsd xmm0, xmm6
	sqrtsd xmm13, xmm12
	mulsd xmm13, xmm12
	divsd xmm0, xmm13
.LBB29_8:
	mulsd xmm8, xmm0
	mulsd xmm11, xmm0
	movapd xmm0, xmm7
	mulsd xmm0, xmm8
	movsd xmm12, qword ptr [r15 + 8*rsi]
	subsd xmm12, xmm0
	movsd qword ptr [r15 + 8*rsi], xmm12
	mulsd xmm7, xmm11
	movsd xmm0, qword ptr [rbx + 8*rdi]
	subsd xmm0, xmm7
	movsd qword ptr [rbx + 8*rdi], xmm0
	movapd xmm7, xmm3
	addsd xmm7, xmm8
	movapd xmm8, xmm4
	addsd xmm8, xmm11
	cmp eax, 1
	je .LBB29_15
	movsd xmm12, qword ptr [rdx + 8*r9 + 8]
	movsd xmm11, qword ptr [r8 + 8*rbp + 8]
	movsd xmm13, qword ptr [r13 + 8*r14 + 8]
	subsd xmm12, xmm10
	subsd xmm11, xmm9
	movapd xmm0, xmm12
	mulsd xmm0, xmm12
	movapd xmm14, xmm11
	mulsd xmm14, xmm11
	addsd xmm14, xmm0
	addsd xmm14, xmm15
	xorpd xmm0, xmm0
	ucomisd xmm14, xmm0
	jne .LBB29_10
	jnp .LBB29_11
.LBB29_10:
	movsd xmm0, qword ptr [r12 + 8*r11 + 8]
	mulsd xmm0, xmm6
	movsd qword ptr [rsp - 72], xmm6
	movapd xmm6, xmm15
	xorps xmm15, xmm15
	sqrtsd xmm15, xmm14
	mulsd xmm15, xmm14
	divsd xmm0, xmm15
	movapd xmm15, xmm6
	movsd xmm6, qword ptr [rsp - 72]
.LBB29_11:
	mulsd xmm12, xmm0
	mulsd xmm11, xmm0
	movapd xmm0, xmm13
	mulsd xmm0, xmm12
	movsd xmm14, qword ptr [r15 + 8*rsi + 8]
	subsd xmm14, xmm0
	movsd qword ptr [r15 + 8*rsi + 8], xmm14
	mulsd xmm13, xmm11
	movsd xmm0, qword ptr [rbx + 8*rdi + 8]
	subsd xmm0, xmm13
	movsd qword ptr [rbx + 8*rdi + 8], xmm0
	unpckhpd xmm3, xmm3
	addsd xmm3, xmm12
	unpckhpd xmm4, xmm4
	addsd xmm4, xmm11
	unpcklpd xmm7, xmm3
	unpcklpd xmm8, xmm4
	cmp eax, 2
	je .LBB29_15
	movsd xmm4, qword ptr [rdx + 8*r9 + 16]
	movsd xmm3, qword ptr [r8 + 8*rbp + 16]
	movsd xmm11, qword ptr [r13 + 8*r14 + 16]
	subsd xmm4, xmm10
	subsd xmm3, xmm9
	movapd xmm0, xmm4
	mulsd xmm0, xmm4
	movapd xmm9, xmm3
	mulsd xmm9, xmm3
	addsd xmm9, xmm0
	addsd xmm15, xmm9
	xorpd xmm0, xmm0
	ucomisd xmm15, xmm0
	jne .LBB29_13
	jnp .LBB29_14
.LBB29_13:
	mulsd xmm6, qword ptr [r12 + 8*r11 + 16]
	xorps xmm0, xmm0
	sqrtsd xmm0, xmm15
	mulsd xmm0, xmm15
	divsd xmm6, xmm0
	movapd xmm0, xmm6
.LBB29_14:
	mulsd xmm4, xmm0
	mulsd xmm3, xmm0
	movapd xmm0, xmm11
	mulsd xmm0, xmm4
	movsd xmm6, qword ptr [r15 + 8*rsi + 16]
	subsd xmm6, xmm0
	movsd qword ptr [r15 + 8*rsi + 16], xmm6
	mulsd xmm11, xmm3
	movsd xmm0, qword ptr [rbx + 8*rdi + 16]
	subsd xmm0, xmm11
	movsd qword ptr [rbx + 8*rdi + 16], xmm0
	addsd xmm5, xmm4
	addsd xmm2, xmm3
	jmp .LBB29_15
.LBB29_5:
	movapd xmm7, xmm3
	movapd xmm8, xmm4
.LBB29_15:
	mov rax, qword ptr [rsp - 40]
	movupd xmmword ptr [rax], xmm7
	movsd qword ptr [rax + 16], xmm5
	movhpd qword ptr [rax + 24], xmm1
	movupd xmmword ptr [rax + 32], xmm8
	movsd qword ptr [rax + 48], xmm2
	movlpd qword ptr [rax + 56], xmm1
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
