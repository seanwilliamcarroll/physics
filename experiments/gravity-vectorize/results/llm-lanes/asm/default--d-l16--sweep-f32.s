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
	sub rsp, 280
	.cfi_def_cfa_offset 336
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov r10, rsi
	mov rsi, qword ptr [rsp + 360]
	mov rcx, qword ptr [rsp + 344]
	mov r15d, r9d
	and r15d, 15
	mov qword ptr [rsp - 96], r9
	mov rax, r9
	shr rax, 4
	mov r12d, ecx
	and r12d, 15
	shr rcx, 4
	mov r13d, esi
	and r13d, 15
	shr rsi, 4
	mov qword ptr [rsp - 120], r14
	shr r14, 4
	cmp rax, r14
	cmovb r14, rax
	mov r9, qword ptr [rsp + 392]
	cmp rcx, r14
	cmovb r14, rcx
	mov rbx, qword ptr [rsp + 376]
	cmp rsi, r14
	cmovb r14, rsi
	mov rax, rbx
	shr rax, 4
	mov r11, r9
	shr r11, 4
	cmp r11, rax
	cmovae r11, rax
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 384]
	xorps xmm1, xmm1
	movups xmmword ptr [rsp - 32], xmm1
	movups xmmword ptr [rsp - 44], xmm1
	movups xmmword ptr [rsp - 60], xmm1
	movups xmmword ptr [rsp - 76], xmm1
	movups xmmword ptr [rsp - 12], xmm1
	movups xmmword ptr [rsp + 4], xmm1
	movups xmmword ptr [rsp + 20], xmm1
	movups xmmword ptr [rsp + 32], xmm1
	mov rbp, qword ptr [rsp + 368]
	mov rax, qword ptr [rsp + 352]
	mov rsi, qword ptr [rsp + 336]
	test r11, r11
	mov qword ptr [rsp - 88], r10
	je .LBB30_1
	movsd xmm1, qword ptr [r10]
	movaps xmm2, xmm1
	movlhps xmm2, xmm1
	movaps xmmword ptr [rsp + 112], xmm2
	movaps xmm2, xmm1
	shufps xmm2, xmm1, 0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmmword ptr [rsp + 48], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [r10 + 8]
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 64], xmm0
	shufps xmm1, xmm1, 85
	movaps xmmword ptr [rsp + 128], xmm1
	shl r11, 6
	xor ecx, ecx
	xorps xmm14, xmm14
	xorps xmm15, xmm15
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp - 112], xmm0
	xorps xmm5, xmm5
	xorps xmm13, xmm13
	xorps xmm4, xmm4
	xorps xmm1, xmm1
	xorps xmm3, xmm3
	.p2align	4
.LBB30_3:
	movaps xmmword ptr [rsp + 144], xmm5
	movaps xmmword ptr [rsp + 160], xmm15
	movaps xmmword ptr [rsp + 176], xmm14
	movaps xmmword ptr [rsp + 192], xmm1
	movaps xmmword ptr [rsp + 208], xmm0
	movaps xmmword ptr [rsp + 224], xmm4
	movaps xmmword ptr [rsp + 240], xmm13
	movaps xmmword ptr [rsp + 256], xmm3
	movups xmm5, xmmword ptr [rdx + rcx + 4]
	movaps xmm13, xmmword ptr [rsp + 96]
	subps xmm5, xmm13
	movups xmm8, xmmword ptr [r8 + rcx + 4]
	movaps xmm11, xmmword ptr [rsp + 128]
	subps xmm8, xmm11
	movaps xmm0, xmm5
	mulps xmm0, xmm5
	movaps xmm4, xmm8
	mulps xmm4, xmm8
	addps xmm4, xmm0
	movaps xmm14, xmmword ptr [rsp + 80]
	addps xmm4, xmm14
	movups xmm0, xmmword ptr [rsi + rcx + 4]
	movaps xmm15, xmmword ptr [rsp + 64]
	mulps xmm0, xmm15
	sqrtps xmm1, xmm4
	mulps xmm1, xmm4
	divps xmm0, xmm1
	xorps xmm1, xmm1
	cmpneqps xmm4, xmm1
	xorps xmm3, xmm3
	andps xmm4, xmm0
	movups xmm7, xmmword ptr [rdx + rcx + 20]
	subps xmm7, xmm13
	movups xmm9, xmmword ptr [r8 + rcx + 20]
	subps xmm9, xmm11
	movaps xmm1, xmm7
	mulps xmm1, xmm7
	movaps xmm0, xmm9
	mulps xmm0, xmm9
	addps xmm0, xmm1
	addps xmm0, xmm14
	movups xmm1, xmmword ptr [rsi + rcx + 20]
	mulps xmm1, xmm15
	sqrtps xmm2, xmm0
	mulps xmm2, xmm0
	divps xmm1, xmm2
	cmpneqps xmm0, xmm3
	xorps xmm12, xmm12
	andps xmm0, xmm1
	movups xmm1, xmmword ptr [rdx + rcx + 36]
	subps xmm1, xmm13
	movups xmm10, xmmword ptr [r8 + rcx + 36]
	subps xmm10, xmm11
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm10
	mulps xmm2, xmm10
	addps xmm2, xmm3
	addps xmm2, xmm14
	movups xmm3, xmmword ptr [rsi + rcx + 36]
	mulps xmm3, xmm15
	sqrtps xmm6, xmm2
	mulps xmm6, xmm2
	divps xmm3, xmm6
	cmpneqps xmm2, xmm12
	andps xmm2, xmm3
	movsd xmm12, qword ptr [rdx + rcx + 52]
	subps xmm12, xmm13
	movsd xmm6, qword ptr [r8 + rcx + 52]
	subps xmm6, xmm11
	movaps xmm3, xmm12
	mulps xmm3, xmm12
	movaps xmm11, xmm6
	mulps xmm11, xmm6
	addps xmm11, xmm3
	addps xmm11, xmm14
	movsd xmm3, qword ptr [rsi + rcx + 52]
	mulps xmm3, xmm15
	sqrtps xmm13, xmm11
	mulps xmm13, xmm11
	divps xmm3, xmm13
	mulps xmm5, xmm4
	mulps xmm7, xmm0
	mulps xmm1, xmm2
	xorps xmm13, xmm13
	cmpneqps xmm11, xmm13
	andps xmm11, xmm3
	mulps xmm12, xmm11
	mulps xmm4, xmm8
	mulps xmm0, xmm9
	mulps xmm2, xmm10
	mulps xmm11, xmm6
	movss xmm3, dword ptr [r8 + rcx]
	movss xmm8, dword ptr [rdx + rcx]
	unpcklps xmm8, xmm3
	movss xmm3, dword ptr [r8 + rcx + 60]
	movss xmm6, dword ptr [rdx + rcx + 60]
	unpcklps xmm6, xmm3
	movlhps xmm6, xmm8
	subps xmm6, xmmword ptr [rsp + 112]
	movaps xmm3, xmm6
	mulps xmm3, xmm6
	movaps xmm8, xmm3
	shufps xmm8, xmm3, 232
	shufps xmm3, xmm3, 237
	addps xmm3, xmm8
	addps xmm3, xmm14
	movaps xmm14, xmmword ptr [rsp + 176]
	movss xmm8, dword ptr [rsi + rcx]
	movss xmm9, dword ptr [rsi + rcx + 60]
	unpcklps xmm9, xmm8
	mulps xmm9, xmm15
	movaps xmm15, xmmword ptr [rsp + 160]
	sqrtps xmm8, xmm3
	mulps xmm8, xmm3
	divps xmm9, xmm8
	cmpneqps xmm3, xmm13
	andps xmm3, xmm9
	pshufd xmm8, xmm3, 80
	mulps xmm8, xmm6
	movups xmm3, xmmword ptr [rbp + rcx]
	movups xmm10, xmmword ptr [rax + rcx]
	movaps xmm6, xmm8
	shufps xmm6, xmm5, 2
	shufps xmm6, xmm5, 152
	mulps xmm6, xmm10
	subps xmm3, xmm6
	movups xmmword ptr [rbp + rcx], xmm3
	movups xmm9, xmmword ptr [rax + rcx + 16]
	addps xmm14, xmm5
	shufps xmm5, xmm7, 3
	shufps xmm5, xmm7, 152
	mulps xmm5, xmm9
	movups xmm3, xmmword ptr [rbp + rcx + 16]
	subps xmm3, xmm5
	movups xmm6, xmmword ptr [rbp + rcx + 32]
	movups xmm13, xmmword ptr [rbp + rcx + 48]
	movups xmmword ptr [rbp + rcx + 16], xmm3
	movups xmm5, xmmword ptr [rax + rcx + 32]
	addps xmm15, xmm7
	shufps xmm7, xmm1, 3
	shufps xmm7, xmm1, 152
	mulps xmm7, xmm5
	subps xmm6, xmm7
	movaps xmm3, xmm8
	movups xmmword ptr [rbp + rcx + 32], xmm6
	movaps xmm6, xmm8
	movaps xmm7, xmmword ptr [rsp - 112]
	addps xmm7, xmm1
	movaps xmmword ptr [rsp - 112], xmm7
	movaps xmm7, xmm1
	shufps xmm7, xmm12, 3
	shufps xmm3, xmm12, 212
	shufps xmm7, xmm3, 40
	movups xmm1, xmmword ptr [rax + rcx + 48]
	mulps xmm7, xmm1
	subps xmm13, xmm7
	movups xmmword ptr [rbp + rcx + 48], xmm13
	movaps xmm13, xmmword ptr [rsp + 240]
	shufps xmm6, xmm4, 3
	shufps xmm6, xmm4, 152
	mulps xmm6, xmm10
	movups xmm3, xmmword ptr [r14 + rcx]
	subps xmm3, xmm6
	movups xmm7, xmmword ptr [r14 + rcx + 16]
	movups xmm10, xmmword ptr [r14 + rcx + 32]
	movups xmm6, xmmword ptr [r14 + rcx + 48]
	movups xmmword ptr [r14 + rcx], xmm3
	movaps xmm3, xmmword ptr [rsp + 256]
	addps xmm13, xmm4
	shufps xmm4, xmm0, 3
	shufps xmm4, xmm0, 152
	mulps xmm4, xmm9
	subps xmm7, xmm4
	movaps xmm4, xmmword ptr [rsp + 224]
	movups xmmword ptr [r14 + rcx + 16], xmm7
	addps xmm4, xmm0
	shufps xmm0, xmm2, 3
	shufps xmm0, xmm2, 152
	mulps xmm0, xmm5
	movaps xmm5, xmmword ptr [rsp + 144]
	subps xmm10, xmm0
	movaps xmm0, xmmword ptr [rsp + 208]
	movups xmmword ptr [r14 + rcx + 32], xmm10
	addps xmm3, xmm8
	addps xmm0, xmm2
	shufps xmm2, xmm11, 3
	shufps xmm8, xmm11, 85
	shufps xmm2, xmm8, 40
	mulps xmm2, xmm1
	movaps xmm1, xmmword ptr [rsp + 192]
	subps xmm6, xmm2
	movups xmmword ptr [r14 + rcx + 48], xmm6
	addps xmm5, xmm12
	addps xmm1, xmm11
	add rcx, 64
	cmp r11, rcx
	jne .LBB30_3
	movups xmmword ptr [rsp - 76], xmm14
	movups xmmword ptr [rsp - 60], xmm15
	movaps xmm2, xmmword ptr [rsp - 112]
	movups xmmword ptr [rsp - 44], xmm2
	movlps qword ptr [rsp - 28], xmm5
	movss dword ptr [rsp - 20], xmm3
	movups xmmword ptr [rsp - 12], xmm13
	movups xmmword ptr [rsp + 4], xmm4
	movups xmmword ptr [rsp + 20], xmm0
	movlps qword ptr [rsp + 36], xmm1
	movaps xmm0, xmm3
	shufps xmm0, xmm3, 85
	movss dword ptr [rsp + 44], xmm0
	movaps xmm1, xmm3
	unpckhpd xmm1, xmm3
	shufps xmm3, xmm3, 255
	movaps xmm0, xmmword ptr [rsp + 48]
	jmp .LBB30_5
.LBB30_1:
	xorps xmm3, xmm3
	xorps xmm1, xmm1
.LBB30_5:
	mov r10, qword ptr [rsp - 120]
	mov r11d, r10d
	and r11d, 15
	cmp r15, r11
	cmovb r11, r15
	cmp r12, r11
	cmovb r11, r12
	movss dword ptr [rsp - 80], xmm1
	cmp r13, r11
	cmovb r11, r13
	movss dword ptr [rsp - 16], xmm3
	mov ecx, ebx
	and ecx, 15
	mov r15d, r9d
	and r15d, 15
	cmp r15, rcx
	cmovb rcx, r15
	cmp rcx, r11
	cmovae rcx, r11
	test rcx, rcx
	je .LBB30_10
	movabs r11, 2305843009213693936
	and r10, r11
	mov r12, r10
	mov r10, qword ptr [rsp - 96]
	and r10, r11
	mov r13, qword ptr [rsp + 344]
	mov r15, rdi
	mov rdi, r9
	mov r9, r13
	and r9, r11
	mov r13, qword ptr [rsp + 360]
	and r13, r11
	movabs r11, 1152921504606846960
	and rbx, r11
	and rdi, r11
	lea rdx, [rdx + 4*r12]
	lea r8, [r8 + 4*r10]
	lea rsi, [rsi + 4*r9]
	lea rax, [rax + 4*r13]
	lea r10, [rbp + 4*rbx]
	lea r9, [r14 + 4*rdi]
	mov rdi, r15
	mov r11, qword ptr [rsp - 88]
	movss xmm8, dword ptr [r11]
	movss xmm1, dword ptr [r11 + 4]
	movss xmm2, dword ptr [r11 + 8]
	xor r11d, r11d
	jmp .LBB30_7
	.p2align	4
.LBB30_9:
	movss xmm6, dword ptr [rax + 4*r11]
	mulss xmm3, xmm5
	mulss xmm4, xmm5
	movaps xmm5, xmm6
	mulss xmm5, xmm3
	movss xmm7, dword ptr [r10 + 4*r11]
	subss xmm7, xmm5
	movss dword ptr [r10 + 4*r11], xmm7
	mulss xmm6, xmm4
	movss xmm5, dword ptr [r9 + 4*r11]
	subss xmm5, xmm6
	addss xmm3, dword ptr [rsp + 4*r11 - 80]
	movss dword ptr [r9 + 4*r11], xmm5
	movss dword ptr [rsp + 4*r11 - 80], xmm3
	addss xmm4, dword ptr [rsp + 4*r11 - 16]
	movss dword ptr [rsp + 4*r11 - 16], xmm4
	inc r11
	cmp rcx, r11
	je .LBB30_10
.LBB30_7:
	movss xmm3, dword ptr [rdx + 4*r11]
	subss xmm3, xmm8
	movss xmm4, dword ptr [r8 + 4*r11]
	subss xmm4, xmm1
	movaps xmm5, xmm3
	mulss xmm5, xmm3
	movaps xmm6, xmm4
	mulss xmm6, xmm4
	addss xmm6, xmm5
	addss xmm6, xmm0
	xorps xmm5, xmm5
	ucomiss xmm6, xmm5
	jne .LBB30_8
	jnp .LBB30_9
.LBB30_8:
	movss xmm5, dword ptr [rsi + 4*r11]
	mulss xmm5, xmm2
	xorps xmm7, xmm7
	sqrtss xmm7, xmm6
	mulss xmm7, xmm6
	divss xmm5, xmm7
	jmp .LBB30_9
.LBB30_10:
	movups xmm0, xmmword ptr [rsp - 80]
	movups xmm1, xmmword ptr [rsp - 64]
	movups xmm2, xmmword ptr [rsp - 48]
	movups xmm3, xmmword ptr [rsp - 32]
	movups xmmword ptr [rdi + 48], xmm3
	movups xmmword ptr [rdi + 32], xmm2
	movups xmmword ptr [rdi + 16], xmm1
	movups xmmword ptr [rdi], xmm0
	movups xmm0, xmmword ptr [rsp - 16]
	movups xmm1, xmmword ptr [rsp]
	movups xmm2, xmmword ptr [rsp + 16]
	movups xmm3, xmmword ptr [rsp + 32]
	movups xmmword ptr [rdi + 64], xmm0
	movups xmmword ptr [rdi + 80], xmm1
	movups xmmword ptr [rdi + 96], xmm2
	movups xmmword ptr [rdi + 112], xmm3
	add rsp, 280
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
