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
	movabs r8, 576460752303423484
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	cmp rax, r14
	cmovb r14, rax
	mov rbx, r14
	shl rbx, 5
	lea rax, [r8 + 3]
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
	mov rbp, rdi
	mov rdi, rbx
	mov r13, rcx
	mov qword ptr [rsp], r12
	mov r12, rdx
	call qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rdx, r12
	mov r12, qword ptr [rsp]
	mov rcx, r13
	mov rsi, r14
	test rax, rax
	je .LBB144_35
	test r14, r14
	jne .LBB144_5
	jmp .LBB144_23
.LBB144_2:
	mov eax, 8
	xor esi, esi
	test r14, r14
	je .LBB144_23
.LBB144_5:
	cmp r14, 4
	jae .LBB144_7
	xor r8d, r8d
.LBB144_12:
	lea r9, [r8 + 1]
	test r14b, 1
	je .LBB144_16
	mov r10, r8
	shl r10, 4
	add r10, r15
	vmovsd xmm0, qword ptr [r12 + 8*r8]
	vxorpd xmm1, xmm1, xmm1
	vucomisd xmm0, xmm1
	jne .LBB144_14
	jnp .LBB144_15
.LBB144_14:
	vmovsd xmm1, qword ptr [rip + .LCPI144_0]
	vdivsd xmm1, xmm1, xmm0
.LBB144_15:
	shl r8, 5
	vmovupd xmm2, xmmword ptr [r10]
	vmovupd xmmword ptr [rax + r8], xmm2
	vmovsd qword ptr [rax + r8 + 16], xmm1
	vmovsd qword ptr [rax + r8 + 24], xmm0
	mov r8, r9
.LBB144_16:
	cmp r14, r9
	je .LBB144_23
	mov r9, r14
	sub r9, r8
	mov r10, r8
	shl r10, 5
	add r10, rax
	lea r11, [r12 + 8*r8]
	shl r8, 4
	add r15, r8
	mov r8d, 4
	vmovsd xmm0, qword ptr [rip + .LCPI144_0]
	jmp .LBB144_18
	.p2align	4
.LBB144_22:
	vmovupd xmm3, xmmword ptr [r15 + 4*r8]
	vmovupd xmmword ptr [r10 + 8*r8], xmm3
	vmovsd qword ptr [r10 + 8*r8 + 16], xmm1
	vmovsd qword ptr [r10 + 8*r8 + 24], xmm2
	add r8, 8
	add r9, -2
	je .LBB144_23
.LBB144_18:
	vmovsd xmm2, qword ptr [r11 + 2*r8 - 8]
	vxorpd xmm1, xmm1, xmm1
	vucomisd xmm2, xmm1
	vxorpd xmm3, xmm3, xmm3
	jne .LBB144_19
	jnp .LBB144_20
.LBB144_19:
	vdivsd xmm3, xmm0, xmm2
.LBB144_20:
	vmovupd xmm4, xmmword ptr [r15 + 4*r8 - 16]
	vmovupd xmmword ptr [r10 + 8*r8 - 32], xmm4
	vmovsd qword ptr [r10 + 8*r8 - 16], xmm3
	vmovsd qword ptr [r10 + 8*r8 - 8], xmm2
	vmovsd xmm2, qword ptr [r11 + 2*r8]
	vucomisd xmm2, xmm1
	jne .LBB144_21
	jnp .LBB144_22
.LBB144_21:
	vdivsd xmm1, xmm0, xmm2
	jmp .LBB144_22
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
	movabs r8, 576460752303423484
	and r8, r14
	xor r9d, r9d
	vxorpd xmm0, xmm0, xmm0
	vbroadcastsd ymm1, qword ptr [rip + .LCPI144_0]
	mov r10, r8
	.p2align	4
.LBB144_10:
	vmovupd ymm2, ymmword ptr [r15 + 4*r9]
	vmovupd ymm3, ymmword ptr [r15 + 4*r9 + 32]
	vmovupd ymm4, ymmword ptr [r12 + 2*r9]
	vdivpd ymm5, ymm1, ymm4
	vcmpneqpd ymm6, ymm4, ymm0
	vandpd ymm5, ymm6, ymm5
	vperm2f128 ymm6, ymm2, ymm3, 49
	vinsertf128 ymm2, ymm2, xmm3, 1
	vunpckhpd ymm3, ymm2, ymm6
	vunpcklpd ymm2, ymm2, ymm6
	vinsertf128 ymm6, ymm2, xmm5, 1
	vinsertf128 ymm7, ymm3, xmm4, 1
	vperm2f128 ymm2, ymm2, ymm5, 49
	vperm2f128 ymm3, ymm3, ymm4, 49
	vunpcklpd ymm4, ymm6, ymm7
	vunpcklpd ymm5, ymm2, ymm3
	vunpckhpd ymm6, ymm6, ymm7
	vunpckhpd ymm2, ymm2, ymm3
	vmovupd ymmword ptr [rax + 8*r9 + 64], ymm5
	vmovupd ymmword ptr [rax + 8*r9 + 96], ymm2
	vmovupd ymmword ptr [rax + 8*r9], ymm4
	vmovupd ymmword ptr [rax + 8*r9 + 32], ymm6
	add r9, 16
	add r10, -4
	jne .LBB144_10
	cmp r14, r8
	jne .LBB144_12
.LBB144_23:
	test rcx, rcx
	je .LBB144_26
	vmovsd xmm0, qword ptr [rdi]
	vmovsd xmm1, qword ptr [rdi + 8]
	lea rdi, [rcx - 1]
	lea r8, [r14 - 1]
	mov r9b, 60
	mov r10, rax
	jmp .LBB144_25
	.p2align	4
.LBB144_33:
	dec rcx
	add r10, 32
	vmovupd xmmword ptr [rdx], xmm2
	add rdx, 16
	dec rdi
	dec r8
	test rcx, rcx
	je .LBB144_26
.LBB144_25:
	cmp rdi, r8
	mov r11, r8
	cmovb r11, rdi
	sub r14, 1
	jb .LBB144_26
	vmovupd xmm2, xmmword ptr [rdx]
	lea rbx, [rcx - 1]
	bzhi rbx, rbx, r9
	cmp r14, rbx
	cmovb rbx, r14
	test rbx, rbx
	je .LBB144_33
	vmovupd xmm3, xmmword ptr [r10]
	vmulsd xmm4, xmm0, qword ptr [r10 + 16]
	vmovddup xmm5, qword ptr [r10 + 24]
	mov ebx, 16
	jmp .LBB144_30
	.p2align	4
.LBB144_32:
	vmovsd xmm8, qword ptr [r10 + 2*rbx + 24]
	vmovddup xmm7, xmm7
	vmulpd xmm6, xmm6, xmm7
	vmulpd xmm7, xmm5, xmm6
	vaddpd xmm2, xmm2, xmm7
	vmovddup xmm7, xmm8
	vmulpd xmm6, xmm7, xmm6
	vmovupd xmm7, xmmword ptr [rdx + rbx]
	vsubpd xmm6, xmm7, xmm6
	vmovupd xmmword ptr [rdx + rbx], xmm6
	add rbx, 16
	dec r11
	je .LBB144_33
.LBB144_30:
	vmovupd xmm6, xmmword ptr [r10 + 2*rbx]
	vsubpd xmm6, xmm6, xmm3
	vmulpd xmm7, xmm6, xmm6
	vshufpd xmm8, xmm7, xmm7, 1
	vaddpd xmm7, xmm8, xmm7
	vaddsd xmm8, xmm7, xmm1
	vxorpd xmm7, xmm7, xmm7
	vucomisd xmm8, xmm7
	jne .LBB144_31
	jnp .LBB144_32
.LBB144_31:
	vmulsd xmm7, xmm4, qword ptr [r10 + 2*rbx + 16]
	vsqrtsd xmm9, xmm8, xmm8
	vmulsd xmm8, xmm8, xmm9
	vdivsd xmm7, xmm7, xmm8
	jmp .LBB144_32
.LBB144_26:
	test rsi, rsi
	je .LBB144_27
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
	vzeroupper
	jmp qword ptr [rip + free@GOTPCREL]
.LBB144_27:
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
	vzeroupper
	ret
.LBB144_35:
	.cfi_def_cfa_offset 64
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
