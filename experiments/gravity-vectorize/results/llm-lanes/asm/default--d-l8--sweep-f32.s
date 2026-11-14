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
	mov r11, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov ebp, r9d
	and ebp, 7
	mov qword ptr [rsp - 24], r9
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
	mov qword ptr [rsp - 8], rbx
	shr rbx, 3
	cmp rcx, rbx
	cmovb rbx, rcx
	mov qword ptr [rsp - 16], rdi
	cmp r9, rbx
	cmovb rbx, r9
	mov r9, qword ptr [rsp + 112]
	cmp r10, rbx
	cmovb rbx, r10
	mov r11, qword ptr [rsp + 96]
	mov rcx, r11
	shr rcx, 3
	mov r10, r9
	shr r10, 3
	cmp r10, rcx
	cmovae r10, rcx
	cmp r10, rbx
	cmovae r10, rbx
	mov rbx, qword ptr [rsp + 104]
	mov r15, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	movaps xmmword ptr [rsp - 40], xmm0
	je .LBB30_1
	movsd xmm2, qword ptr [rsi]
	movaps xmm1, xmm2
	shufps xmm1, xmm2, 17
	movaps xmmword ptr [rsp - 56], xmm1
	movaps xmm8, xmm0
	shufps xmm8, xmm0, 0
	movaps xmm0, xmm2
	shufps xmm0, xmm2, 85
	movaps xmmword ptr [rsp - 72], xmm0
	movss xmm10, dword ptr [rsi + 8]
	shufps xmm10, xmm10, 0
	shufps xmm2, xmm2, 0
	movaps xmmword ptr [rsp - 88], xmm2
	shl r10, 5
	xor ecx, ecx
	xorps xmm7, xmm7
	xorps xmm6, xmm6
	xorps xmm15, xmm15
	xorps xmm13, xmm13
	xorps xmm1, xmm1
	xorps xmm4, xmm4
	.p2align	4
.LBB30_3:
	movaps xmm3, xmm13
	movups xmm13, xmmword ptr [rdx + rcx]
	movaps xmm9, xmmword ptr [rsp - 88]
	subps xmm13, xmm9
	movups xmm5, xmmword ptr [r8 + rcx]
	movaps xmm2, xmmword ptr [rsp - 72]
	subps xmm5, xmm2
	movaps xmm0, xmm13
	mulps xmm0, xmm13
	movaps xmm12, xmm5
	mulps xmm12, xmm5
	addps xmm12, xmm0
	addps xmm12, xmm8
	movups xmm0, xmmword ptr [r12 + rcx]
	mulps xmm0, xmm10
	sqrtps xmm14, xmm12
	mulps xmm14, xmm12
	divps xmm0, xmm14
	cmpneqps xmm12, xmm4
	andps xmm12, xmm0
	mulps xmm13, xmm12
	movsd xmm11, qword ptr [rdx + rcx + 16]
	subps xmm11, xmm9
	movsd xmm0, qword ptr [r8 + rcx + 16]
	subps xmm0, xmm2
	movaps xmm9, xmm1
	movaps xmm1, xmm15
	movaps xmm15, xmm11
	mulps xmm15, xmm11
	movaps xmm14, xmm0
	mulps xmm14, xmm0
	addps xmm14, xmm15
	addps xmm14, xmm8
	movsd xmm15, qword ptr [r12 + rcx + 16]
	mulps xmm15, xmm10
	sqrtps xmm2, xmm14
	mulps xmm2, xmm14
	divps xmm15, xmm2
	cmpneqps xmm14, xmm4
	andps xmm14, xmm15
	mulps xmm11, xmm14
	mulps xmm12, xmm5
	mulps xmm14, xmm0
	movsd xmm0, qword ptr [rdx + rcx + 24]
	movsd xmm2, qword ptr [r8 + rcx + 24]
	shufps xmm2, xmm0, 17
	shufps xmm2, xmm2, 216
	subps xmm2, xmmword ptr [rsp - 56]
	movaps xmm0, xmm2
	mulps xmm0, xmm2
	movaps xmm5, xmm0
	shufps xmm5, xmm0, 231
	shufps xmm0, xmm0, 226
	addps xmm0, xmm5
	addps xmm0, xmm8
	movsd xmm5, qword ptr [r12 + rcx + 24]
	mulps xmm5, xmm10
	sqrtps xmm15, xmm0
	mulps xmm15, xmm0
	divps xmm5, xmm15
	movaps xmm15, xmm1
	movaps xmm1, xmm9
	cmpneqps xmm0, xmm4
	andps xmm0, xmm5
	pshufd xmm5, xmm0, 5
	mulps xmm5, xmm2
	movups xmm0, xmmword ptr [r13 + rcx]
	addps xmm7, xmm13
	mulps xmm13, xmm0
	movups xmm2, xmmword ptr [r15 + rcx]
	subps xmm2, xmm13
	movups xmm13, xmmword ptr [r15 + rcx + 16]
	movups xmmword ptr [r15 + rcx], xmm2
	movups xmm2, xmmword ptr [r13 + rcx + 16]
	addps xmm15, xmm11
	shufps xmm11, xmm5, 116
	mulps xmm11, xmm2
	subps xmm13, xmm11
	movups xmmword ptr [r15 + rcx + 16], xmm13
	movaps xmm13, xmm3
	mulps xmm0, xmm12
	movups xmm11, xmmword ptr [rbx + rcx]
	subps xmm11, xmm0
	movups xmm0, xmmword ptr [rbx + rcx + 16]
	movups xmmword ptr [rbx + rcx], xmm11
	addps xmm13, xmm14
	shufps xmm14, xmm5, 36
	mulps xmm14, xmm2
	subps xmm0, xmm14
	movups xmmword ptr [rbx + rcx + 16], xmm0
	addps xmm6, xmm12
	addps xmm1, xmm5
	add rcx, 32
	cmp r10, rcx
	jne .LBB30_3
	jmp .LBB30_4
.LBB30_1:
	xorps xmm7, xmm7
	xorps xmm6, xmm6
	xorps xmm15, xmm15
	xorps xmm13, xmm13
	xorps xmm1, xmm1
.LBB30_4:
	mov r9, qword ptr [rsp - 8]
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
	mov r14, qword ptr [rsp + 112]
	mov eax, r14d
	and eax, 7
	cmp rax, rdi
	cmovb rdi, rax
	cmp rdi, rcx
	cmovae rdi, rcx
	movaps xmm4, xmm1
	unpckhpd xmm4, xmm1
	movaps xmm5, xmm1
	shufps xmm5, xmm1, 255
	test rdi, rdi
	je .LBB30_5
	movaps xmm3, xmm15
	movaps xmmword ptr [rsp - 56], xmm13
	movabs rax, 2305843009213693944
	movabs rcx, 1152921504606846968
	and r9, rax
	mov rbp, r11
	mov r11, rsi
	mov rsi, qword ptr [rsp - 24]
	and rsi, rax
	mov r10, qword ptr [rsp + 64]
	and r10, rax
	mov qword ptr [rsp - 72], r10
	mov r10, qword ptr [rsp + 80]
	and r10, rax
	mov rax, r10
	and rbp, rcx
	and r14, rcx
	movss xmm10, dword ptr [r11]
	movss xmm9, dword ptr [r11 + 4]
	movss xmm0, dword ptr [r11 + 8]
	movss dword ptr [rsp - 88], xmm0
	movss xmm2, dword ptr [rdx + 4*r9]
	movss xmm15, dword ptr [r8 + 4*rsi]
	movss xmm0, dword ptr [r13 + 4*r10]
	movss xmm12, dword ptr [r15 + 4*rbp]
	movss xmm11, dword ptr [rbx + 4*r14]
	subss xmm2, xmm10
	movaps xmm13, xmmword ptr [rip + .LCPI30_0]
	movaps xmm14, xmm13
	movss xmm14, xmm2
	subss xmm15, xmm9
	movss xmm13, xmm15
	mulss xmm2, xmm2
	mulss xmm15, xmm15
	addss xmm15, xmm2
	addss xmm15, dword ptr [rsp - 40]
	xorps xmm8, xmm8
	ucomiss xmm15, xmm8
	jne .LBB30_7
	jnp .LBB30_8
.LBB30_7:
	mov rcx, qword ptr [rsp - 72]
	movss xmm8, dword ptr [r12 + 4*rcx]
	mulss xmm8, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm15
	mulss xmm2, xmm15
	divss xmm8, xmm2
.LBB30_8:
	movaps xmm2, xmmword ptr [rip + .LCPI30_1]
	movss xmm2, xmm8
	mulps xmm14, xmm2
	mulps xmm13, xmm2
	movaps xmm2, xmm0
	mulss xmm2, xmm14
	subss xmm12, xmm2
	movss dword ptr [r15 + 4*rbp], xmm12
	mulss xmm0, xmm13
	subss xmm11, xmm0
	movss dword ptr [rbx + 4*r14], xmm11
	addps xmm14, xmm7
	addps xmm13, xmm6
	cmp edi, 1
	jne .LBB30_10
	movaps xmm12, xmm14
	movaps xmm11, xmm13
	jmp .LBB30_13
.LBB30_5:
	movaps xmm12, xmm7
	movaps xmm11, xmm6
	jmp .LBB30_30
.LBB30_10:
	movss xmm11, dword ptr [rdx + 4*r9 + 4]
	movss xmm0, dword ptr [r8 + 4*rsi + 4]
	movss xmm12, dword ptr [r13 + 4*rax + 4]
	subss xmm11, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm11
	mulss xmm2, xmm11
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	addss xmm8, dword ptr [rsp - 40]
	xorps xmm15, xmm15
	ucomiss xmm8, xmm15
	jne .LBB30_11
	jnp .LBB30_12
.LBB30_11:
	mov rcx, qword ptr [rsp - 72]
	movss xmm15, dword ptr [r12 + 4*rcx + 4]
	mulss xmm15, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm8
	mulss xmm2, xmm8
	divss xmm15, xmm2
.LBB30_12:
	mulss xmm11, xmm15
	mulss xmm0, xmm15
	movaps xmm2, xmm12
	mulss xmm2, xmm11
	movss xmm8, dword ptr [r15 + 4*rbp + 4]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 4], xmm8
	mulss xmm12, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 4]
	subss xmm2, xmm12
	movss dword ptr [rbx + 4*r14 + 4], xmm2
	movaps xmm12, xmm7
	shufps xmm12, xmm7, 85
	addss xmm12, xmm11
	movaps xmm11, xmm6
	shufps xmm11, xmm6, 85
	addss xmm11, xmm0
	movlhps xmm12, xmm14
	shufps xmm12, xmm14, 226
	movlhps xmm11, xmm13
	shufps xmm11, xmm13, 226
	cmp edi, 2
	je .LBB30_13
	movss xmm13, dword ptr [rdx + 4*r9 + 8]
	movss xmm0, dword ptr [r8 + 4*rsi + 8]
	movss xmm14, dword ptr [r13 + 4*rax + 8]
	subss xmm13, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm13
	mulss xmm2, xmm13
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	addss xmm8, dword ptr [rsp - 40]
	xorps xmm15, xmm15
	ucomiss xmm8, xmm15
	jne .LBB30_15
	jnp .LBB30_16
.LBB30_15:
	mov rcx, qword ptr [rsp - 72]
	movss xmm15, dword ptr [r12 + 4*rcx + 8]
	mulss xmm15, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm8
	mulss xmm2, xmm8
	divss xmm15, xmm2
.LBB30_16:
	mulss xmm13, xmm15
	mulss xmm0, xmm15
	movaps xmm2, xmm14
	mulss xmm2, xmm13
	movss xmm8, dword ptr [r15 + 4*rbp + 8]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 8], xmm8
	mulss xmm14, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 8]
	subss xmm2, xmm14
	movss dword ptr [rbx + 4*r14 + 8], xmm2
	movaps xmm2, xmm7
	unpckhpd xmm2, xmm7
	addss xmm2, xmm13
	movaps xmm8, xmm6
	unpckhpd xmm8, xmm6
	addss xmm8, xmm0
	shufps xmm2, xmm12, 48
	shufps xmm12, xmm2, 132
	shufps xmm8, xmm11, 48
	shufps xmm11, xmm8, 132
	cmp edi, 3
	je .LBB30_13
	movss xmm13, dword ptr [rdx + 4*r9 + 12]
	movss xmm0, dword ptr [r8 + 4*rsi + 12]
	movss xmm14, dword ptr [r13 + 4*rax + 12]
	subss xmm13, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm13
	mulss xmm2, xmm13
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	addss xmm8, dword ptr [rsp - 40]
	xorps xmm15, xmm15
	ucomiss xmm8, xmm15
	jne .LBB30_18
	jnp .LBB30_19
.LBB30_18:
	mov rcx, qword ptr [rsp - 72]
	movss xmm15, dword ptr [r12 + 4*rcx + 12]
	mulss xmm15, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm8
	mulss xmm2, xmm8
	divss xmm15, xmm2
.LBB30_19:
	mulss xmm13, xmm15
	mulss xmm0, xmm15
	movaps xmm2, xmm14
	mulss xmm2, xmm13
	movss xmm8, dword ptr [r15 + 4*rbp + 12]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 12], xmm8
	mulss xmm14, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 12]
	subss xmm2, xmm14
	movss dword ptr [rbx + 4*r14 + 12], xmm2
	shufps xmm7, xmm7, 255
	addss xmm7, xmm13
	shufps xmm6, xmm6, 255
	addss xmm6, xmm0
	shufps xmm7, xmm12, 228
	shufps xmm12, xmm7, 36
	shufps xmm6, xmm11, 228
	shufps xmm11, xmm6, 36
	cmp edi, 4
	jne .LBB30_20
.LBB30_13:
	movaps xmm13, xmmword ptr [rsp - 56]
	movaps xmm15, xmm3
.LBB30_30:
	mov rax, qword ptr [rsp - 16]
	movups xmmword ptr [rax], xmm12
	movlps qword ptr [rax + 16], xmm15
	movss dword ptr [rax + 24], xmm5
	movaps xmm0, xmm1
	shufps xmm0, xmm1, 85
	movss dword ptr [rax + 28], xmm0
	movups xmmword ptr [rax + 32], xmm11
	movlps qword ptr [rax + 48], xmm13
	movss dword ptr [rax + 56], xmm4
	movss dword ptr [rax + 60], xmm1
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
.LBB30_20:
	.cfi_def_cfa_offset 56
	movss xmm6, dword ptr [rdx + 4*r9 + 16]
	movss xmm0, dword ptr [r8 + 4*rsi + 16]
	movss xmm7, dword ptr [r13 + 4*rax + 16]
	subss xmm6, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm6
	mulss xmm2, xmm6
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	movaps xmm15, xmmword ptr [rsp - 40]
	addss xmm8, xmm15
	xorps xmm13, xmm13
	ucomiss xmm8, xmm13
	movaps xmm14, xmm3
	jne .LBB30_21
	jnp .LBB30_22
.LBB30_21:
	mov rcx, qword ptr [rsp - 72]
	movss xmm13, dword ptr [r12 + 4*rcx + 16]
	mulss xmm13, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm8
	mulss xmm2, xmm8
	divss xmm13, xmm2
.LBB30_22:
	mulss xmm6, xmm13
	mulss xmm0, xmm13
	movaps xmm2, xmm7
	mulss xmm2, xmm6
	movss xmm8, dword ptr [r15 + 4*rbp + 16]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 16], xmm8
	mulss xmm7, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 16]
	subss xmm2, xmm7
	movss dword ptr [rbx + 4*r14 + 16], xmm2
	movaps xmm7, xmm14
	addss xmm7, xmm6
	movaps xmm6, xmmword ptr [rsp - 56]
	addss xmm6, xmm0
	cmp edi, 5
	jne .LBB30_24
	movaps xmm15, xmm7
	movaps xmm13, xmm6
	jmp .LBB30_30
.LBB30_24:
	movss xmm13, dword ptr [rdx + 4*r9 + 20]
	movss xmm0, dword ptr [r8 + 4*rsi + 20]
	movss xmm14, dword ptr [r13 + 4*rax + 20]
	subss xmm13, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm13
	mulss xmm2, xmm13
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	addss xmm8, xmm15
	xorps xmm15, xmm15
	ucomiss xmm8, xmm15
	jne .LBB30_25
	jnp .LBB30_26
.LBB30_25:
	mov rcx, qword ptr [rsp - 72]
	movss xmm15, dword ptr [r12 + 4*rcx + 20]
	mulss xmm15, dword ptr [rsp - 88]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm8
	mulss xmm2, xmm8
	divss xmm15, xmm2
.LBB30_26:
	mulss xmm13, xmm15
	mulss xmm0, xmm15
	movaps xmm2, xmm14
	mulss xmm2, xmm13
	movss xmm8, dword ptr [r15 + 4*rbp + 20]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 20], xmm8
	mulss xmm14, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 20]
	subss xmm2, xmm14
	movss dword ptr [rbx + 4*r14 + 20], xmm2
	movaps xmm15, xmm3
	shufps xmm15, xmm3, 85
	addss xmm15, xmm13
	movaps xmm13, xmmword ptr [rsp - 56]
	shufps xmm13, xmm13, 85
	addss xmm13, xmm0
	movlhps xmm15, xmm7
	shufps xmm15, xmm7, 226
	movlhps xmm13, xmm6
	shufps xmm13, xmm6, 226
	cmp edi, 6
	je .LBB30_30
	movss xmm6, dword ptr [rdx + 4*r9 + 24]
	movss xmm0, dword ptr [r8 + 4*rsi + 24]
	movss xmm7, dword ptr [r13 + 4*rax + 24]
	subss xmm6, xmm10
	subss xmm0, xmm9
	movaps xmm2, xmm6
	mulss xmm2, xmm6
	movaps xmm8, xmm0
	mulss xmm8, xmm0
	addss xmm8, xmm2
	movaps xmm3, xmmword ptr [rsp - 40]
	addss xmm3, xmm8
	xorps xmm8, xmm8
	ucomiss xmm3, xmm8
	jne .LBB30_28
	jnp .LBB30_29
.LBB30_28:
	mov rax, qword ptr [rsp - 72]
	movss xmm8, dword ptr [rsp - 88]
	mulss xmm8, dword ptr [r12 + 4*rax + 24]
	xorps xmm2, xmm2
	sqrtss xmm2, xmm3
	mulss xmm2, xmm3
	divss xmm8, xmm2
.LBB30_29:
	mulss xmm6, xmm8
	mulss xmm0, xmm8
	movaps xmm2, xmm7
	mulss xmm2, xmm6
	movss xmm8, dword ptr [r15 + 4*rbp + 24]
	subss xmm8, xmm2
	movss dword ptr [r15 + 4*rbp + 24], xmm8
	mulss xmm7, xmm0
	movss xmm2, dword ptr [rbx + 4*r14 + 24]
	subss xmm2, xmm7
	movss dword ptr [rbx + 4*r14 + 24], xmm2
	addss xmm5, xmm6
	addss xmm4, xmm0
	jmp .LBB30_30
