<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
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
	movabs r8, 576460752303423486
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	cmp rax, r14
	cmovb r14, rax
	mov rbx, r14
	shl rbx, 5
	lea rax, [r8 + 1]
	cmp r14, rax
	setbe al
	movabs r8, 9223372036854775801
	cmp rbx, r8
	setb r8b
	test al, r8b
	jne .LBB144_1
	call alloc::raw_vec::capacity_overflow
.LBB144_1:
	mov r15, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 56]
	test rbx, rbx
	je .LBB144_2
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
	je .LBB144_28
	test r14, r14
	jne .LBB144_5
	jmp .LBB144_16
.LBB144_2:
	mov eax, 8
	xor esi, esi
	test r14, r14
	je .LBB144_16
.LBB144_5:
	cmp r14, 4
	jae .LBB144_7
	xor r8d, r8d
.LBB144_12:
	mov r9, r14
	sub r9, r8
	shl r8, 2
	movsd xmm0, qword ptr [rip + .LCPI144_1]
	jmp .LBB144_13
	.p2align	4
.LBB144_15:
	movupd xmm3, xmmword ptr [r15 + 4*r8]
	movupd xmmword ptr [rax + 8*r8], xmm3
	movsd qword ptr [rax + 8*r8 + 16], xmm2
	movsd qword ptr [rax + 8*r8 + 24], xmm1
	add r8, 4
	dec r9
	je .LBB144_16
.LBB144_13:
	movsd xmm1, qword ptr [r12 + 2*r8]
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	jne .LBB144_14
	jnp .LBB144_15
.LBB144_14:
	movapd xmm2, xmm0
	divsd xmm2, xmm1
	jmp .LBB144_15
.LBB144_7:
	add rbx, rax
	mov r8, r14
	shl r8, 4
	add r8, r15
	lea r9, [r12 + 8*r14]
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
	jne .LBB144_12
	and r9b, r10b
	jne .LBB144_12
	movabs r8, 576460752303423486
	and r8, r14
	xor r9d, r9d
	xorpd xmm0, xmm0
	movapd xmm1, xmmword ptr [rip + .LCPI144_0]
	mov r10, r8
	.p2align	4
.LBB144_10:
	movupd xmm2, xmmword ptr [r15 + 4*r9]
	movupd xmm3, xmmword ptr [r15 + 4*r9 + 16]
	movupd xmm4, xmmword ptr [r12 + 2*r9]
	movapd xmm5, xmm1
	divpd xmm5, xmm4
	movapd xmm6, xmm4
	cmpneqpd xmm6, xmm0
	andpd xmm6, xmm5
	movapd xmm5, xmm6
	unpcklpd xmm5, xmm4
	unpckhpd xmm6, xmm4
	movupd xmmword ptr [rax + 8*r9 + 32], xmm3
	movupd xmmword ptr [rax + 8*r9], xmm2
	movupd xmmword ptr [rax + 8*r9 + 48], xmm6
	movupd xmmword ptr [rax + 8*r9 + 16], xmm5
	add r9, 8
	add r10, -2
	jne .LBB144_10
	cmp r14, r8
	jne .LBB144_12
.LBB144_16:
	test rcx, rcx
	je .LBB144_19
	movabs r8, 1152921504606846975
	movsd xmm0, qword ptr [rdi]
	movsd xmm1, qword ptr [rdi + 8]
	lea rdi, [rcx - 1]
	lea r9, [r14 - 1]
	mov r10, rax
	jmp .LBB144_18
	.p2align	4
.LBB144_26:
	dec rcx
	add r10, 32
	movupd xmmword ptr [rdx], xmm2
	add rdx, 16
	dec rdi
	dec r9
	test rcx, rcx
	je .LBB144_19
.LBB144_18:
	cmp rdi, r9
	mov r11, r9
	cmovb r11, rdi
	sub r14, 1
	jb .LBB144_19
	movupd xmm2, xmmword ptr [rdx]
	lea rbx, [rcx + r8]
	and rbx, r8
	cmp r14, rbx
	cmovb rbx, r14
	test rbx, rbx
	je .LBB144_26
	movupd xmm3, xmmword ptr [r10]
	movsd xmm4, qword ptr [r10 + 16]
	mulsd xmm4, xmm0
	movsd xmm5, qword ptr [r10 + 24]
	unpcklpd xmm5, xmm5
	mov ebx, 16
	jmp .LBB144_23
	.p2align	4
.LBB144_25:
	movsd xmm8, qword ptr [r10 + 2*rbx + 24]
	unpcklpd xmm7, xmm7
	mulpd xmm6, xmm7
	movapd xmm7, xmm5
	mulpd xmm7, xmm6
	addpd xmm2, xmm7
	unpcklpd xmm8, xmm8
	mulpd xmm8, xmm6
	movupd xmm6, xmmword ptr [rdx + rbx]
	subpd xmm6, xmm8
	movupd xmmword ptr [rdx + rbx], xmm6
	add rbx, 16
	dec r11
	je .LBB144_26
.LBB144_23:
	movupd xmm6, xmmword ptr [r10 + 2*rbx]
	subpd xmm6, xmm3
	movapd xmm7, xmm6
	mulpd xmm7, xmm6
	movapd xmm8, xmm7
	unpckhpd xmm8, xmm7
	addpd xmm8, xmm7
	addsd xmm8, xmm1
	xorpd xmm7, xmm7
	ucomisd xmm8, xmm7
	jne .LBB144_24
	jnp .LBB144_25
.LBB144_24:
	movsd xmm7, qword ptr [r10 + 2*rbx + 16]
	mulsd xmm7, xmm4
	xorps xmm9, xmm9
	sqrtsd xmm9, xmm8
	mulsd xmm9, xmm8
	divsd xmm7, xmm9
	jmp .LBB144_25
.LBB144_19:
	test rsi, rsi
	je .LBB144_20
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
.LBB144_20:
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
.LBB144_28:
	.cfi_def_cfa_offset 64
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
