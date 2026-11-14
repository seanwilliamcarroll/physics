engine::force::sweep::<f32>:
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
	movaps xmmword ptr [rsp - 24], xmm0
	mov qword ptr [rsp - 56], r11
	je .LBB30_1
	movaps xmm7, xmm0
	movsd xmm4, qword ptr [r11]
	movaps xmm0, xmm4
	shufps xmm0, xmm4, 17
	movaps xmm6, xmm4
	shufps xmm6, xmm4, 0
	shufps xmm7, xmm7, 0
	movss xmm8, dword ptr [r11 + 8]
	shufps xmm8, xmm8, 0
	shufps xmm4, xmm4, 85
	shl r10, 4
	xorps xmm9, xmm9
	xor ecx, ecx
	xorps xmm3, xmm3
	xorps xmm2, xmm2
	xorps xmm1, xmm1
	.p2align	4
.LBB30_3:
	movsd xmm10, qword ptr [rdx + rcx]
	subps xmm10, xmm6
	movsd xmm11, qword ptr [rdx + rcx + 8]
	movsd xmm14, qword ptr [r8 + rcx]
	subps xmm14, xmm4
	movsd xmm12, qword ptr [r8 + rcx + 8]
	shufps xmm12, xmm11, 17
	movaps xmm13, xmm10
	mulps xmm13, xmm10
	movaps xmm11, xmm14
	mulps xmm11, xmm14
	addps xmm11, xmm13
	addps xmm11, xmm7
	movsd xmm15, qword ptr [r12 + rcx]
	movsd xmm13, qword ptr [r12 + rcx + 8]
	mulps xmm15, xmm8
	sqrtps xmm5, xmm11
	mulps xmm5, xmm11
	divps xmm15, xmm5
	cmpneqps xmm11, xmm9
	andps xmm11, xmm15
	mulps xmm10, xmm11
	mulps xmm11, xmm14
	shufps xmm12, xmm12, 216
	subps xmm12, xmm0
	movaps xmm5, xmm12
	mulps xmm5, xmm12
	movaps xmm14, xmm5
	shufps xmm14, xmm5, 231
	shufps xmm5, xmm5, 226
	addps xmm5, xmm14
	addps xmm5, xmm7
	mulps xmm13, xmm8
	sqrtps xmm14, xmm5
	mulps xmm14, xmm5
	divps xmm13, xmm14
	cmpneqps xmm5, xmm9
	andps xmm5, xmm13
	pshufd xmm5, xmm5, 5
	mulps xmm5, xmm12
	movups xmm12, xmmword ptr [r15 + rcx]
	movups xmm13, xmmword ptr [r13 + rcx]
	addps xmm3, xmm10
	shufps xmm10, xmm5, 116
	mulps xmm10, xmm13
	subps xmm12, xmm10
	movups xmmword ptr [r15 + rcx], xmm12
	movups xmm10, xmmword ptr [rbx + rcx]
	addps xmm2, xmm11
	shufps xmm11, xmm5, 36
	mulps xmm11, xmm13
	subps xmm10, xmm11
	movups xmmword ptr [rbx + rcx], xmm10
	addps xmm1, xmm5
	add rcx, 16
	cmp r10, rcx
	jne .LBB30_3
	jmp .LBB30_4
.LBB30_1:
	xorps xmm3, xmm3
	xorps xmm2, xmm2
	xorps xmm1, xmm1
.LBB30_4:
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
	movaps xmm4, xmm1
	unpckhpd xmm4, xmm1
	movaps xmm5, xmm1
	shufps xmm5, xmm1, 255
	test rax, rax
	je .LBB30_15
	movabs rcx, 2305843009213693948
	movabs r10, 1152921504606846972
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
	movss xmm8, dword ptr [r10]
	movss xmm7, dword ptr [r10 + 4]
	movss xmm6, dword ptr [r10 + 8]
	movss xmm9, dword ptr [rdx + 4*r9]
	movss xmm11, dword ptr [r8 + 4*rbp]
	movss xmm10, dword ptr [r13 + 4*r14]
	subss xmm9, xmm8
	subss xmm11, xmm7
	movaps xmm0, xmm9
	mulss xmm0, xmm9
	movaps xmm13, xmm11
	mulss xmm13, xmm11
	addss xmm13, xmm0
	movaps xmm14, xmmword ptr [rsp - 24]
	addss xmm13, xmm14
	xorps xmm12, xmm12
	ucomiss xmm13, xmm12
	jne .LBB30_6
	jnp .LBB30_7
.LBB30_6:
	movss xmm12, dword ptr [r12 + 4*r11]
	mulss xmm12, xmm6
	xorps xmm0, xmm0
	sqrtss xmm0, xmm13
	mulss xmm0, xmm13
	divss xmm12, xmm0
.LBB30_7:
	mulss xmm9, xmm12
	mulss xmm11, xmm12
	movaps xmm0, xmm10
	mulss xmm0, xmm9
	movss xmm12, dword ptr [r15 + 4*rsi]
	subss xmm12, xmm0
	movss dword ptr [r15 + 4*rsi], xmm12
	mulss xmm10, xmm11
	movss xmm0, dword ptr [rbx + 4*rdi]
	subss xmm0, xmm10
	movss dword ptr [rbx + 4*rdi], xmm0
	movaps xmm10, xmm3
	addss xmm10, xmm9
	movaps xmm9, xmm2
	addss xmm9, xmm11
	cmp eax, 1
	jne .LBB30_9
	movaps xmm3, xmm10
	movaps xmm2, xmm9
	jmp .LBB30_15
.LBB30_9:
	movss xmm12, dword ptr [rdx + 4*r9 + 4]
	movss xmm11, dword ptr [r8 + 4*rbp + 4]
	movss xmm13, dword ptr [r13 + 4*r14 + 4]
	subss xmm12, xmm8
	subss xmm11, xmm7
	movaps xmm0, xmm12
	mulss xmm0, xmm12
	movaps xmm15, xmm11
	mulss xmm15, xmm11
	addss xmm15, xmm0
	addss xmm15, xmm14
	xorps xmm14, xmm14
	ucomiss xmm15, xmm14
	jne .LBB30_10
	jnp .LBB30_11
.LBB30_10:
	movss xmm14, dword ptr [r12 + 4*r11 + 4]
	mulss xmm14, xmm6
	xorps xmm0, xmm0
	sqrtss xmm0, xmm15
	mulss xmm0, xmm15
	divss xmm14, xmm0
.LBB30_11:
	mulss xmm12, xmm14
	mulss xmm11, xmm14
	movaps xmm0, xmm13
	mulss xmm0, xmm12
	movss xmm14, dword ptr [r15 + 4*rsi + 4]
	subss xmm14, xmm0
	movss dword ptr [r15 + 4*rsi + 4], xmm14
	mulss xmm13, xmm11
	movss xmm0, dword ptr [rbx + 4*rdi + 4]
	subss xmm0, xmm13
	movss dword ptr [rbx + 4*rdi + 4], xmm0
	shufps xmm3, xmm3, 85
	addss xmm3, xmm12
	shufps xmm2, xmm2, 85
	addss xmm2, xmm11
	movlhps xmm3, xmm10
	shufps xmm3, xmm10, 226
	movlhps xmm2, xmm9
	shufps xmm2, xmm9, 226
	cmp eax, 2
	je .LBB30_15
	movss xmm10, dword ptr [rdx + 4*r9 + 8]
	movss xmm9, dword ptr [r8 + 4*rbp + 8]
	movss xmm11, dword ptr [r13 + 4*r14 + 8]
	subss xmm10, xmm8
	subss xmm9, xmm7
	movaps xmm0, xmm10
	mulss xmm0, xmm10
	movaps xmm7, xmm9
	mulss xmm7, xmm9
	addss xmm7, xmm0
	movaps xmm8, xmmword ptr [rsp - 24]
	addss xmm8, xmm7
	xorps xmm7, xmm7
	ucomiss xmm8, xmm7
	jne .LBB30_13
	jnp .LBB30_14
.LBB30_13:
	mulss xmm6, dword ptr [r12 + 4*r11 + 8]
	xorps xmm0, xmm0
	sqrtss xmm0, xmm8
	mulss xmm0, xmm8
	divss xmm6, xmm0
	movaps xmm7, xmm6
.LBB30_14:
	mulss xmm10, xmm7
	mulss xmm9, xmm7
	movaps xmm0, xmm11
	mulss xmm0, xmm10
	movss xmm6, dword ptr [r15 + 4*rsi + 8]
	subss xmm6, xmm0
	movss dword ptr [r15 + 4*rsi + 8], xmm6
	mulss xmm11, xmm9
	movss xmm0, dword ptr [rbx + 4*rdi + 8]
	subss xmm0, xmm11
	movss dword ptr [rbx + 4*rdi + 8], xmm0
	addss xmm5, xmm10
	addss xmm4, xmm9
.LBB30_15:
	mov rax, qword ptr [rsp - 40]
	movlps qword ptr [rax], xmm3
	movss dword ptr [rax + 8], xmm5
	movaps xmm0, xmm1
	shufps xmm0, xmm1, 85
	movss dword ptr [rax + 12], xmm0
	movlps qword ptr [rax + 16], xmm2
	movss dword ptr [rax + 24], xmm4
	movss dword ptr [rax + 28], xmm1
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
