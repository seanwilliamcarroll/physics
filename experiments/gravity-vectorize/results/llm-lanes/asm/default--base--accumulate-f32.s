<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
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
	push rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	movabs r8, 1152921504606846972
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	cmp rax, r14
	cmovb r14, rax
	mov rbx, r14
	shl rbx, 4
	lea rax, [r8 + 3]
	cmp r14, rax
	setbe al
	movabs r8, 9223372036854775805
	cmp rbx, r8
	setb r8b
	test al, r8b
	jne .LBB145_1
	call alloc::raw_vec::capacity_overflow
.LBB145_1:
	mov r15, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 56]
	test rbx, rbx
	je .LBB145_2
	mov qword ptr [rsp], rdi
	mov rdi, rbx
	mov r13, rcx
	mov rbp, rdx
	call qword ptr [rip + malloc@GOTPCREL]
	mov rdi, qword ptr [rsp]
	mov rdx, rbp
	mov rcx, r13
	mov rsi, r14
	test rax, rax
	je .LBB145_28
	test r14, r14
	jne .LBB145_5
	jmp .LBB145_16
.LBB145_2:
	mov eax, 4
	xor esi, esi
	test r14, r14
	je .LBB145_16
.LBB145_5:
	cmp r14, 4
	jae .LBB145_7
	xor r8d, r8d
.LBB145_12:
	mov r9, r8
	shl r9, 4
	add r9, rax
	add r9, 12
	movss xmm0, dword ptr [rip + .LCPI145_1]
	jmp .LBB145_13
	.p2align	4
.LBB145_15:
	movsd xmm3, qword ptr [r15 + 8*r8]
	inc r8
	movsd qword ptr [r9 - 12], xmm3
	movss dword ptr [r9 - 4], xmm2
	movss dword ptr [r9], xmm1
	add r9, 16
	cmp r14, r8
	je .LBB145_16
.LBB145_13:
	movss xmm1, dword ptr [r12 + 4*r8]
	xorps xmm2, xmm2
	ucomiss xmm1, xmm2
	jne .LBB145_14
	jnp .LBB145_15
.LBB145_14:
	movaps xmm2, xmm0
	divss xmm2, xmm1
	jmp .LBB145_15
.LBB145_7:
	add rbx, rax
	lea r8, [r15 + 8*r14]
	lea r9, [r12 + 4*r14]
	cmp rax, r8
	setb r11b
	cmp r15, rbx
	setb bpl
	cmp rax, r9
	setb r9b
	cmp r12, rbx
	setb r10b
	xor r8d, r8d
	test r11b, bpl
	jne .LBB145_12
	and r9b, r10b
	jne .LBB145_12
	movabs r8, 1152921504606846972
	and r8, r14
	xor r9d, r9d
	xorps xmm0, xmm0
	movaps xmm1, xmmword ptr [rip + .LCPI145_0]
	mov r10, rax
	.p2align	4
.LBB145_10:
	movups xmm2, xmmword ptr [r15 + 8*r9]
	movups xmm3, xmmword ptr [r15 + 8*r9 + 16]
	movups xmm4, xmmword ptr [r12 + 4*r9]
	movaps xmm5, xmm1
	divps xmm5, xmm4
	movaps xmm6, xmm4
	cmpneqps xmm6, xmm0
	andps xmm6, xmm5
	movaps xmm5, xmm4
	shufps xmm5, xmm6, 85
	movaps xmm7, xmm2
	shufps xmm7, xmm5, 46
	movaps xmm5, xmm4
	movlhps xmm5, xmm6
	shufps xmm2, xmm5, 36
	movaps xmm5, xmm4
	shufps xmm5, xmm6, 255
	movaps xmm8, xmm3
	shufps xmm8, xmm5, 46
	movhlps xmm6, xmm4
	shufps xmm3, xmm6, 36
	movups xmmword ptr [r10 + 32], xmm3
	movups xmmword ptr [r10 + 48], xmm8
	movups xmmword ptr [r10], xmm2
	movups xmmword ptr [r10 + 16], xmm7
	add r9, 4
	add r10, 64
	cmp r8, r9
	jne .LBB145_10
	cmp r14, r8
	jne .LBB145_12
.LBB145_16:
	test rcx, rcx
	je .LBB145_19
	movss xmm0, dword ptr [rdi]
	movss xmm1, dword ptr [rdi + 4]
	lea rdi, [rcx - 1]
	lea r8, [r14 - 1]
	xorps xmm2, xmm2
	mov r9, rax
	jmp .LBB145_18
	.p2align	4
.LBB145_24:
	movlps qword ptr [rdx], xmm3
	dec rdi
	dec r8
	mov rdx, r11
	mov r9, r10
	test rcx, rcx
	je .LBB145_19
.LBB145_18:
	cmp rdi, r8
	mov rbx, r8
	cmovb rbx, rdi
	sub r14, 1
	jb .LBB145_19
	dec rcx
	lea r11, [rdx + 8]
	lea r10, [r9 + 16]
	movsd xmm4, qword ptr [r9]
	movsd xmm3, qword ptr [rdx]
	movss xmm5, dword ptr [r9 + 8]
	mulss xmm5, xmm0
	movss xmm6, dword ptr [r9 + 12]
	shufps xmm6, xmm6, 0
	xor r15d, r15d
.LBB145_22:
	mov r13, r15
	shl r13, 4
	cmp r15, rbx
	mov rbp, rbx
	cmova rbp, r15
	.p2align	4
.LBB145_23:
	cmp rbp, r15
	je .LBB145_24
	mov r12, r15
	inc r15
	movsd xmm7, qword ptr [r9 + r13 + 16]
	subps xmm7, xmm4
	movaps xmm9, xmm7
	mulps xmm9, xmm7
	movaps xmm8, xmm9
	shufps xmm8, xmm9, 85
	addss xmm8, xmm9
	addss xmm8, xmm1
	add r13, 16
	ucomiss xmm8, xmm2
	jne .LBB145_26
	jnp .LBB145_23
.LBB145_26:
	movss xmm9, dword ptr [r9 + r13 + 8]
	mulss xmm9, xmm5
	xorps xmm10, xmm10
	sqrtss xmm10, xmm8
	mulss xmm10, xmm8
	divss xmm9, xmm10
	shufps xmm9, xmm9, 0
	mulps xmm7, xmm9
	movaps xmm8, xmm6
	mulps xmm8, xmm7
	addps xmm3, xmm8
	movss xmm8, dword ptr [r9 + r13 + 12]
	unpcklps xmm8, xmm8
	mulps xmm8, xmm7
	movsd xmm7, qword ptr [r11 + 8*r12]
	subps xmm7, xmm8
	movlps qword ptr [r11 + 8*r12], xmm7
	jmp .LBB145_22
.LBB145_19:
	test rsi, rsi
	je .LBB145_20
	mov rdi, rax
	add rsp, 8
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB145_20:
	.cfi_def_cfa_offset 64
	add rsp, 8
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
.LBB145_28:
	.cfi_def_cfa_offset 64
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
