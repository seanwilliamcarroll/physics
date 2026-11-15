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
	mov rcx, rsi
	mov r11, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov ebp, r9d
	and ebp, 1
	mov qword ptr [rsp - 24], r9
	mov rsi, r9
	shr rsi
	mov eax, r10d
	and eax, 1
	mov r9, r10
	shr r9
	mov r14d, r11d
	and r14d, 1
	mov r10, r11
	shr r10
	mov qword ptr [rsp - 8], rbx
	shr rbx
	cmp rsi, rbx
	cmovb rbx, rsi
	cmp r9, rbx
	cmovb rbx, r9
	mov rsi, qword ptr [rsp + 112]
	cmp r10, rbx
	cmovb rbx, r10
	mov r11, qword ptr [rsp + 96]
	mov r9, r11
	shr r9
	mov r10, rsi
	shr r10
	cmp r10, r9
	cmovae r10, r9
	cmp r10, rbx
	cmovae r10, rbx
	mov rbx, qword ptr [rsp + 104]
	mov r15, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	mov qword ptr [rsp - 16], rcx
	je .LBB29_1
	movupd xmm3, xmmword ptr [rcx]
	movapd xmm4, xmm0
	unpcklpd xmm4, xmm0
	movsd xmm5, qword ptr [rcx + 16]
	unpcklpd xmm5, xmm5
	shl r10, 4
	xorpd xmm6, xmm6
	xor r9d, r9d
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
	.p2align	4
.LBB29_3:
	movupd xmm7, xmmword ptr [rdx + r9]
	movupd xmm9, xmmword ptr [r8 + r9]
	movapd xmm8, xmm7
	unpckhpd xmm8, xmm9
	unpcklpd xmm7, xmm9
	subpd xmm7, xmm3
	subpd xmm8, xmm3
	movapd xmm9, xmm8
	mulpd xmm9, xmm8
	movapd xmm10, xmm7
	mulpd xmm10, xmm7
	movapd xmm11, xmm10
	unpcklpd xmm11, xmm9
	unpckhpd xmm10, xmm9
	addpd xmm10, xmm11
	addpd xmm10, xmm4
	movupd xmm9, xmmword ptr [r12 + r9]
	mulpd xmm9, xmm5
	sqrtpd xmm11, xmm10
	mulpd xmm11, xmm10
	divpd xmm9, xmm11
	cmpneqpd xmm10, xmm6
	andpd xmm10, xmm9
	pshufd xmm9, xmm10, 68
	pshufd xmm10, xmm10, 238
	mulpd xmm10, xmm8
	mulpd xmm9, xmm7
	movupd xmm7, xmmword ptr [r15 + r9]
	movupd xmm8, xmmword ptr [r13 + r9]
	movapd xmm11, xmm9
	unpcklpd xmm11, xmm10
	mulpd xmm11, xmm8
	subpd xmm7, xmm11
	movupd xmmword ptr [r15 + r9], xmm7
	movupd xmm7, xmmword ptr [rbx + r9]
	addpd xmm2, xmm9
	unpckhpd xmm9, xmm10
	mulpd xmm9, xmm8
	subpd xmm7, xmm9
	movupd xmmword ptr [rbx + r9], xmm7
	addpd xmm1, xmm10
	add r9, 16
	cmp r10, r9
	jne .LBB29_3
	jmp .LBB29_4
.LBB29_1:
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
.LBB29_4:
	mov rcx, qword ptr [rsp - 8]
	mov r9d, ecx
	and r9d, 1
	cmp rbp, r9
	cmovb r9, rbp
	cmp rax, r9
	cmovb r9, rax
	cmp r14, r9
	cmovb r9, r14
	mov eax, r11d
	and eax, 1
	mov r10d, esi
	and r10d, 1
	cmp r10, rax
	cmovb rax, r10
	cmp rax, r9
	cmovae rax, r9
	movapd xmm3, xmm2
	unpckhpd xmm3, xmm2
	test rax, rax
	je .LBB29_5
	movabs rax, 1152921504606846974
	movabs r9, 576460752303423486
	and rcx, rax
	mov r10, rcx
	mov rcx, qword ptr [rsp - 24]
	and rcx, rax
	mov r14, qword ptr [rsp + 80]
	and r14, rax
	and r11, r9
	and rsi, r9
	movsd xmm5, qword ptr [rdx + 8*r10]
	movsd xmm4, qword ptr [r8 + 8*rcx]
	mov rcx, qword ptr [rsp - 16]
	subsd xmm5, qword ptr [rcx]
	movsd xmm6, qword ptr [r13 + 8*r14]
	subsd xmm4, qword ptr [rcx + 8]
	movapd xmm7, xmm5
	mulsd xmm7, xmm5
	movapd xmm8, xmm4
	mulsd xmm8, xmm4
	addsd xmm8, xmm7
	addsd xmm0, xmm8
	xorpd xmm7, xmm7
	ucomisd xmm0, xmm7
	jne .LBB29_7
	jnp .LBB29_8
.LBB29_7:
	mov rdx, qword ptr [rsp + 64]
	and rdx, rax
	movsd xmm7, qword ptr [r12 + 8*rdx]
	mulsd xmm7, qword ptr [rcx + 16]
	xorps xmm8, xmm8
	sqrtsd xmm8, xmm0
	mulsd xmm8, xmm0
	divsd xmm7, xmm8
.LBB29_8:
	mulsd xmm5, xmm7
	mulsd xmm4, xmm7
	movapd xmm0, xmm6
	mulsd xmm0, xmm5
	movsd xmm7, qword ptr [r15 + 8*r11]
	subsd xmm7, xmm0
	movsd qword ptr [r15 + 8*r11], xmm7
	mulsd xmm6, xmm4
	movsd xmm0, qword ptr [rbx + 8*rsi]
	subsd xmm0, xmm6
	movsd qword ptr [rbx + 8*rsi], xmm0
	addsd xmm5, xmm2
	addsd xmm4, xmm3
	jmp .LBB29_9
.LBB29_5:
	movapd xmm4, xmm3
	movapd xmm5, xmm2
.LBB29_9:
	movsd qword ptr [rdi], xmm5
	movlpd qword ptr [rdi + 8], xmm1
	movsd qword ptr [rdi + 16], xmm4
	movhpd qword ptr [rdi + 24], xmm1
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
