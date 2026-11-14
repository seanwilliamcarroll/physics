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
	movabs r8, 1152921504606846968
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	cmp rax, r14
	cmovb r14, rax
	mov rbx, r14
	shl rbx, 4
	lea rax, [r8 + 7]
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
	je .LBB145_35
	test r14, r14
	jne .LBB145_5
	jmp .LBB145_23
.LBB145_2:
	mov eax, 4
	xor esi, esi
	test r14, r14
	je .LBB145_23
.LBB145_5:
	cmp r14, 8
	jae .LBB145_7
	xor r8d, r8d
.LBB145_12:
	lea r9, [r8 + 1]
	test r14b, 1
	je .LBB145_16
	vmovss xmm0, dword ptr [r12 + 4*r8]
	vxorps xmm1, xmm1, xmm1
	vucomiss xmm0, xmm1
	jne .LBB145_14
	jnp .LBB145_15
.LBB145_14:
	vmovss xmm1, dword ptr [rip + .LCPI145_0]
	vdivss xmm1, xmm1, xmm0
.LBB145_15:
	vmovsd xmm2, qword ptr [r15 + 8*r8]
	shl r8, 4
	vmovsd qword ptr [rax + r8], xmm2
	vmovss dword ptr [rax + r8 + 8], xmm1
	vmovss dword ptr [rax + r8 + 12], xmm0
	mov r8, r9
.LBB145_16:
	cmp r14, r9
	je .LBB145_23
	mov r9, r8
	shl r9, 4
	add r9, rax
	add r9, 28
	vmovss xmm0, dword ptr [rip + .LCPI145_0]
	jmp .LBB145_18
	.p2align	4
.LBB145_22:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 8]
	add r8, 2
	vmovsd qword ptr [r9 - 12], xmm3
	vmovss dword ptr [r9 - 4], xmm1
	vmovss dword ptr [r9], xmm2
	add r9, 32
	cmp r14, r8
	je .LBB145_23
.LBB145_18:
	vmovss xmm2, dword ptr [r12 + 4*r8]
	vxorps xmm1, xmm1, xmm1
	vucomiss xmm2, xmm1
	vxorps xmm3, xmm3, xmm3
	jne .LBB145_19
	jnp .LBB145_20
.LBB145_19:
	vdivss xmm3, xmm0, xmm2
.LBB145_20:
	vmovsd xmm4, qword ptr [r15 + 8*r8]
	vmovsd qword ptr [r9 - 28], xmm4
	vmovss dword ptr [r9 - 20], xmm3
	vmovss dword ptr [r9 - 16], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 4]
	vucomiss xmm2, xmm1
	jne .LBB145_21
	jnp .LBB145_22
.LBB145_21:
	vdivss xmm1, xmm0, xmm2
	jmp .LBB145_22
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
	movabs r8, 1152921504606846968
	and r8, r14
	xor r9d, r9d
	vbroadcastss ymm1, dword ptr [rip + .LCPI145_0]
	vmovaps ymm2, ymmword ptr [rip + .LCPI145_1]
	vmovaps ymm3, ymmword ptr [rip + .LCPI145_2]
	vmovaps ymm4, ymmword ptr [rip + .LCPI145_3]
	vmovaps ymm5, ymmword ptr [rip + .LCPI145_4]
	vmovaps ymm6, ymmword ptr [rip + .LCPI145_5]
	vmovaps ymm7, ymmword ptr [rip + .LCPI145_6]
	vmovaps ymm8, ymmword ptr [rip + .LCPI145_7]
	vmovaps ymm9, ymmword ptr [rip + .LCPI145_8]
	mov r10, rax
	.p2align	4
.LBB145_10:
	vmovups ymm10, ymmword ptr [r15 + 8*r9]
	vmovups ymm11, ymmword ptr [r15 + 8*r9 + 32]
	vmovups ymm12, ymmword ptr [r12 + 4*r9]
	vdivps ymm13, ymm1, ymm12
	vxorps xmm0, xmm0, xmm0
	vcmpneqps ymm14, ymm12, ymm0
	vandps ymm13, ymm14, ymm13
	vblendps ymm14, ymm10, ymm13, 15
	vpermps ymm14, ymm2, ymm14
	vpermps ymm15, ymm3, ymm12
	vblendps ymm14, ymm14, ymm15, 136
	vpermps ymm15, ymm4, ymm13
	vpermpd ymm10, ymm10, 212
	vblendps ymm10, ymm10, ymm15, 204
	vpermps ymm15, ymm5, ymm12
	vblendps ymm10, ymm10, ymm15, 136
	vpermps ymm15, ymm6, ymm13
	vpermpd ymm0, ymm11, 246
	vblendps ymm0, ymm0, ymm15, 204
	vpermps ymm15, ymm7, ymm12
	vblendps ymm0, ymm0, ymm15, 136
	vblendps ymm11, ymm11, ymm13, 240
	vpermps ymm11, ymm8, ymm11
	vpermps ymm12, ymm9, ymm12
	vblendps ymm11, ymm11, ymm12, 136
	vmovups ymmword ptr [r10 + 64], ymm11
	vmovups ymmword ptr [r10 + 96], ymm0
	vmovups ymmword ptr [r10], ymm10
	vmovups ymmword ptr [r10 + 32], ymm14
	add r9, 8
	sub r10, -128
	cmp r8, r9
	jne .LBB145_10
	cmp r14, r8
	jne .LBB145_12
.LBB145_23:
	test rcx, rcx
	je .LBB145_26
	vmovss xmm0, dword ptr [rdi]
	vmovss xmm1, dword ptr [rdi + 4]
	lea rdi, [rcx - 1]
	lea r8, [r14 - 1]
	mov r9b, 61
	mov r10, rax
	jmp .LBB145_25
	.p2align	4
.LBB145_33:
	dec rcx
	add r10, 16
	vmovlps qword ptr [rdx], xmm2
	add rdx, 8
	dec rdi
	dec r8
	test rcx, rcx
	je .LBB145_26
.LBB145_25:
	cmp rdi, r8
	mov r11, r8
	cmovb r11, rdi
	sub r14, 1
	jb .LBB145_26
	vmovsd xmm2, qword ptr [rdx]
	lea rbx, [rcx - 1]
	bzhi rbx, rbx, r9
	cmp r14, rbx
	cmovb rbx, r14
	test rbx, rbx
	je .LBB145_33
	vmovsd xmm3, qword ptr [r10]
	vmulss xmm4, xmm0, dword ptr [r10 + 8]
	vbroadcastss xmm5, dword ptr [r10 + 12]
	mov ebx, 8
	jmp .LBB145_30
	.p2align	4
.LBB145_32:
	vmovss xmm8, dword ptr [r10 + 2*rbx + 12]
	vbroadcastss xmm7, xmm7
	vmulps xmm6, xmm6, xmm7
	vmulps xmm7, xmm5, xmm6
	vaddps xmm2, xmm2, xmm7
	vbroadcastss xmm7, xmm8
	vmulps xmm6, xmm7, xmm6
	vmovsd xmm7, qword ptr [rdx + rbx]
	vsubps xmm6, xmm7, xmm6
	vmovlps qword ptr [rdx + rbx], xmm6
	add rbx, 8
	dec r11
	je .LBB145_33
.LBB145_30:
	vmovsd xmm6, qword ptr [r10 + 2*rbx]
	vsubps xmm6, xmm6, xmm3
	vmulps xmm7, xmm6, xmm6
	vmovshdup xmm8, xmm7
	vaddps xmm7, xmm8, xmm7
	vaddss xmm8, xmm7, xmm1
	vxorps xmm7, xmm7, xmm7
	vucomiss xmm8, xmm7
	jne .LBB145_31
	jnp .LBB145_32
.LBB145_31:
	vmulss xmm7, xmm4, dword ptr [r10 + 2*rbx + 8]
	vsqrtss xmm9, xmm8, xmm8
	vmulss xmm8, xmm8, xmm9
	vdivss xmm7, xmm7, xmm8
	jmp .LBB145_32
.LBB145_26:
	test rsi, rsi
	je .LBB145_27
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
.LBB145_27:
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
.LBB145_35:
	.cfi_def_cfa_offset 64
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
