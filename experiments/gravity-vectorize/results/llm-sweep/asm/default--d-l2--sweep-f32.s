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
	mov rbx, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov eax, r9d
	and eax, 1
	mov qword ptr [rsp - 24], rax
	mov qword ptr [rsp - 40], r9
	mov rax, r9
	shr rax
	mov ebp, r10d
	and ebp, 1
	mov r11, r10
	shr r11
	mov r15d, ebx
	and r15d, 1
	mov r10, rbx
	shr r10
	mov qword ptr [rsp - 16], rcx
	mov r9, rcx
	shr r9
	cmp rax, r9
	cmovb r9, rax
	mov qword ptr [rsp - 8], rdi
	cmp r11, r9
	cmovb r9, r11
	mov rcx, qword ptr [rsp + 112]
	cmp r10, r9
	cmovb r9, r10
	mov rax, qword ptr [rsp + 96]
	shr rax
	mov r10, rcx
	shr r10
	cmp r10, rax
	cmovae r10, rax
	cmp r10, r9
	cmovae r10, r9
	mov rbx, qword ptr [rsp + 104]
	mov r14, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	mov qword ptr [rsp - 32], rsi
	je .LBB30_1
	movsd xmm2, qword ptr [rsi]
	movss xmm3, dword ptr [rsi + 8]
	shufps xmm3, xmm3, 0
	movaps xmm4, xmm0
	shufps xmm4, xmm0, 0
	xorps xmm1, xmm1
	xor r9d, r9d
	xorps xmm5, xmm5
	.p2align	4
.LBB30_3:
	mov rax, qword ptr [rdx + 8*r9]
	mov rcx, qword ptr [r8 + 8*r9]
	movsd xmm9, qword ptr [r12 + 8*r9]
	mulps xmm9, xmm3
	movss xmm6, dword ptr [r13 + 8*r9]
	movd xmm7, ecx
	movd xmm11, eax
	punpckldq xmm11, xmm7
	shr rax, 32
	shr rcx, 32
	movd xmm7, ecx
	movd xmm12, eax
	punpckldq xmm12, xmm7
	subps xmm11, xmm2
	subps xmm12, xmm2
	movaps xmm8, xmm11
	mulps xmm8, xmm11
	movaps xmm7, xmm12
	mulps xmm7, xmm12
	movaps xmm10, xmm8
	unpcklps xmm10, xmm7
	shufps xmm7, xmm8, 17
	shufps xmm7, xmm8, 226
	movss xmm8, dword ptr [r13 + 8*r9 + 4]
	addps xmm7, xmm10
	addps xmm7, xmm4
	sqrtps xmm10, xmm7
	mulps xmm10, xmm7
	divps xmm9, xmm10
	movaps xmm10, xmm7
	shufps xmm10, xmm7, 85
	cmpeqss xmm7, xmm5
	andnps xmm7, xmm9
	shufps xmm9, xmm9, 85
	cmpeqss xmm10, xmm5
	andnps xmm10, xmm9
	movss xmm9, dword ptr [r14 + 8*r9]
	shufps xmm7, xmm7, 0
	mulps xmm7, xmm11
	movss xmm11, dword ptr [r14 + 8*r9 + 4]
	shufps xmm10, xmm10, 0
	mulps xmm10, xmm12
	movaps xmm12, xmm7
	mulss xmm12, xmm6
	subss xmm9, xmm12
	movaps xmm12, xmm10
	mulss xmm12, xmm8
	subss xmm11, xmm12
	movd ecx, xmm9
	movd eax, xmm11
	movaps xmm9, xmm7
	shufps xmm9, xmm7, 85
	mulss xmm9, xmm6
	movss xmm6, dword ptr [rbx + 8*r9]
	subss xmm6, xmm9
	unpcklps xmm7, xmm10
	shufps xmm10, xmm10, 85
	mulss xmm10, xmm8
	movss xmm8, dword ptr [rbx + 8*r9 + 4]
	subss xmm8, xmm10
	movd edi, xmm6
	movd r11d, xmm8
	addps xmm1, xmm7
	shl rax, 32
	or rcx, rax
	mov qword ptr [r14 + 8*r9], rcx
	shl r11, 32
	or rdi, r11
	mov qword ptr [rbx + 8*r9], rdi
	inc r9
	cmp r10, r9
	jne .LBB30_3
	jmp .LBB30_4
.LBB30_1:
	xorps xmm1, xmm1
.LBB30_4:
	mov r10, qword ptr [rsp - 16]
	mov eax, r10d
	and eax, 1
	mov rcx, qword ptr [rsp - 24]
	cmp rcx, rax
	cmovb rax, rcx
	cmp rbp, rax
	cmovb rax, rbp
	cmp r15, rax
	cmovb rax, r15
	pshufd xmm2, xmm1, 232
	mov r11, qword ptr [rsp + 96]
	mov ecx, r11d
	and ecx, 1
	mov rsi, qword ptr [rsp + 112]
	mov edi, esi
	and edi, 1
	cmp rdi, rcx
	cmovb rcx, rdi
	cmp rcx, rax
	cmovae rcx, rax
	test rcx, rcx
	je .LBB30_8
	movabs r9, 2305843009213693950
	movabs rax, 1152921504606846974
	and r10, r9
	mov rcx, qword ptr [rsp - 40]
	and rcx, r9
	mov rdi, qword ptr [rsp + 80]
	and rdi, r9
	and r11, rax
	and rsi, rax
	movss xmm4, dword ptr [r13 + 4*rdi]
	movss xmm6, dword ptr [r14 + 4*r11]
	movss xmm3, dword ptr [rbx + 4*rsi]
	mov rax, qword ptr [rsp - 32]
	movsd xmm7, qword ptr [rax]
	movss xmm8, dword ptr [r8 + 4*rcx]
	movss xmm5, dword ptr [rdx + 4*r10]
	unpcklps xmm5, xmm8
	subps xmm5, xmm7
	movaps xmm7, xmm5
	mulps xmm7, xmm5
	movaps xmm8, xmm7
	shufps xmm8, xmm7, 85
	addps xmm8, xmm7
	addss xmm0, xmm8
	xorps xmm7, xmm7
	ucomiss xmm0, xmm7
	jne .LBB30_6
	jnp .LBB30_7
.LBB30_6:
	mov rcx, qword ptr [rsp + 64]
	and rcx, r9
	movss xmm7, dword ptr [r12 + 4*rcx]
	mulss xmm7, dword ptr [rax + 8]
	xorps xmm8, xmm8
	sqrtss xmm8, xmm0
	mulss xmm8, xmm0
	divss xmm7, xmm8
.LBB30_7:
	shufps xmm7, xmm7, 0
	mulps xmm5, xmm7
	movaps xmm0, xmm4
	mulss xmm0, xmm5
	subss xmm6, xmm0
	movss dword ptr [r14 + 4*r11], xmm6
	movaps xmm0, xmm5
	shufps xmm0, xmm5, 85
	mulss xmm0, xmm4
	subss xmm3, xmm0
	movss dword ptr [rbx + 4*rsi], xmm3
	addps xmm2, xmm5
.LBB30_8:
	pshufd xmm0, xmm1, 237
	unpcklps xmm2, xmm0
	mov rax, qword ptr [rsp - 8]
	movups xmmword ptr [rax], xmm2
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
