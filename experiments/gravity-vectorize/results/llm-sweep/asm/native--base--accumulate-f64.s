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
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	movabs r8, 576460752303423480
	cmp rax, r14
	cmovb r14, rax
	lea rax, [r8 + 7]
	movabs r8, 9223372036854775801
	mov rbx, r14
	shl rbx, 5
	cmp r14, rax
	setbe al
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
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rdi
	mov rdi, rbx
	mov r13, rcx
	mov rbp, rdx
	call rax
	mov rdi, qword ptr [rsp]
	mov rdx, rbp
	mov rcx, r13
	mov rsi, r14
	test rax, rax
	je .LBB144_40
	test r14, r14
	jne .LBB144_5
	jmp .LBB144_28
.LBB144_2:
	mov eax, 8
	xor esi, esi
	test r14, r14
	je .LBB144_28
.LBB144_5:
	cmp r14, 8
	jae .LBB144_7
	xor r8d, r8d
.LBB144_12:
	mov r9, r14
	and r9, 3
	mov r11, r8
	je .LBB144_17
	vmovsd xmm0, qword ptr [rip + .LCPI144_0]
	mov r10, r8
	shl r10, 5
	mov rbx, r8
	shl rbx, 4
	shl r9d, 4
	xor r13d, r13d
	mov r11, r8
	lea r10, [r10 + rax + 24]
	add rbx, r15
	jmp .LBB144_14
	.p2align	4
.LBB144_16:
	vmovupd xmm3, xmmword ptr [rbx + r13]
	inc r11
	vmovupd xmmword ptr [r10 + 2*r13 - 24], xmm3
	vmovsd qword ptr [r10 + 2*r13 - 8], xmm2
	vmovsd qword ptr [r10 + 2*r13], xmm1
	add r13, 16
	cmp r9, r13
	je .LBB144_17
.LBB144_14:
	vmovsd xmm1, qword ptr [r12 + 8*r11]
	vxorpd xmm2, xmm2, xmm2
	vucomisd xmm1, xmm2
	jne .LBB144_15
	jnp .LBB144_16
.LBB144_15:
	vdivsd xmm2, xmm0, xmm1
	jmp .LBB144_16
.LBB144_17:
	sub r8, r14
	cmp r8, -4
	ja .LBB144_28
	vmovsd xmm0, qword ptr [rip + .LCPI144_0]
	mov r8, r14
	mov r9, r11
	shl r9, 5
	sub r8, r11
	lea r10, [r12 + 8*r11]
	shl r11, 4
	add r15, r11
	add r9, rax
	mov r11d, 12
	jmp .LBB144_19
	.p2align	4
.LBB144_27:
	vmovupd xmm3, xmmword ptr [r15 + 4*r11]
	vmovupd xmmword ptr [r9 + 8*r11], xmm3
	vmovsd qword ptr [r9 + 8*r11 + 16], xmm1
	vmovsd qword ptr [r9 + 8*r11 + 24], xmm2
	add r11, 16
	add r8, -4
	je .LBB144_28
.LBB144_19:
	vmovsd xmm2, qword ptr [r10 + 2*r11 - 24]
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm3, xmm3, xmm3
	vucomisd xmm2, xmm1
	jne .LBB144_20
	jnp .LBB144_21
.LBB144_20:
	vdivsd xmm3, xmm0, xmm2
.LBB144_21:
	vmovups xmm4, xmmword ptr [r15 + 4*r11 - 48]
	vmovups xmmword ptr [r9 + 8*r11 - 96], xmm4
	vmovsd qword ptr [r9 + 8*r11 - 80], xmm3
	vmovsd qword ptr [r9 + 8*r11 - 72], xmm2
	vmovsd xmm2, qword ptr [r10 + 2*r11 - 16]
	vucomisd xmm2, xmm1
	jne .LBB144_22
	jnp .LBB144_23
.LBB144_22:
	vdivsd xmm1, xmm0, xmm2
.LBB144_23:
	vmovupd xmm3, xmmword ptr [r15 + 4*r11 - 32]
	vmovupd xmmword ptr [r9 + 8*r11 - 64], xmm3
	vmovsd qword ptr [r9 + 8*r11 - 48], xmm1
	vmovsd qword ptr [r9 + 8*r11 - 40], xmm2
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm3, xmm3, xmm3
	vmovsd xmm2, qword ptr [r10 + 2*r11 - 8]
	vucomisd xmm2, xmm1
	jne .LBB144_24
	jnp .LBB144_25
.LBB144_24:
	vdivsd xmm3, xmm0, xmm2
.LBB144_25:
	vmovupd xmm4, xmmword ptr [r15 + 4*r11 - 16]
	vmovupd xmmword ptr [r9 + 8*r11 - 32], xmm4
	vmovsd qword ptr [r9 + 8*r11 - 16], xmm3
	vmovsd qword ptr [r9 + 8*r11 - 8], xmm2
	vmovsd xmm2, qword ptr [r10 + 2*r11]
	vucomisd xmm2, xmm1
	jne .LBB144_26
	jnp .LBB144_27
.LBB144_26:
	vdivsd xmm1, xmm0, xmm2
	jmp .LBB144_27
.LBB144_7:
	mov r8, r14
	shl r8, 4
	add rbx, rax
	lea r9, [r12 + 8*r14]
	add r8, r15
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
	vbroadcastsd zmm1, qword ptr [rip + .LCPI144_0]
	vmovapd zmm2, zmmword ptr [rip + .LCPI144_1]
	vmovapd zmm3, zmmword ptr [rip + .LCPI144_2]
	vmovapd zmm4, zmmword ptr [rip + .LCPI144_3]
	vmovapd zmm5, zmmword ptr [rip + .LCPI144_4]
	vmovapd zmm6, zmmword ptr [rip + .LCPI144_5]
	vmovapd zmm7, zmmword ptr [rip + .LCPI144_6]
	vmovapd zmm8, zmmword ptr [rip + .LCPI144_7]
	vmovapd zmm9, zmmword ptr [rip + .LCPI144_8]
	movabs r8, 576460752303423480
	xor r9d, r9d
	vxorpd xmm0, xmm0, xmm0
	and r8, r14
	mov r10, r8
	.p2align	4
.LBB144_10:
	vmovupd zmm12, zmmword ptr [r12 + 2*r9]
	vmovupd zmm10, zmmword ptr [r15 + 4*r9]
	vmovupd zmm11, zmmword ptr [r15 + 4*r9 + 64]
	vcmpneqpd k1, zmm12, zmm0
	vmovapd zmm14, zmm10
	vmovapd zmm15, zmm11
	vdivpd zmm13 {k1} {z}, zmm1, zmm12
	vpermt2pd zmm14, zmm2, zmm13
	vpermt2pd zmm10, zmm4, zmm13
	vpermt2pd zmm15, zmm6, zmm13
	vpermt2pd zmm11, zmm8, zmm13
	vpermt2pd zmm14, zmm3, zmm12
	vpermt2pd zmm10, zmm5, zmm12
	vpermt2pd zmm15, zmm7, zmm12
	vpermt2pd zmm11, zmm9, zmm12
	vmovupd zmmword ptr [rax + 8*r9 + 128], zmm11
	vmovupd zmmword ptr [rax + 8*r9 + 192], zmm15
	vmovupd zmmword ptr [rax + 8*r9], zmm10
	vmovupd zmmword ptr [rax + 8*r9 + 64], zmm14
	add r9, 32
	add r10, -8
	jne .LBB144_10
	cmp r14, r8
	jne .LBB144_12
.LBB144_28:
	test rcx, rcx
	je .LBB144_31
	vmovsd xmm0, qword ptr [rdi]
	vmovsd xmm1, qword ptr [rdi + 8]
	lea rdi, [rcx - 1]
	lea r8, [r14 - 1]
	vxorpd xmm2, xmm2, xmm2
	mov r9, rax
	jmp .LBB144_30
	.p2align	4
.LBB144_36:
	dec rdi
	dec r8
	vmovupd xmmword ptr [rdx], xmm3
	mov rdx, r11
	mov r9, r10
	test rcx, rcx
	je .LBB144_31
.LBB144_30:
	cmp rdi, r8
	mov rbx, r8
	cmovb rbx, rdi
	sub r14, 1
	jb .LBB144_31
	vmulsd xmm5, xmm0, qword ptr [r9 + 16]
	vmovupd xmm4, xmmword ptr [r9]
	vmovupd xmm3, xmmword ptr [rdx]
	vmovddup xmm6, qword ptr [r9 + 24]
	dec rcx
	lea r11, [rdx + 16]
	lea r10, [r9 + 32]
	xor r15d, r15d
.LBB144_34:
	mov r12, r15
	shl r12, 5
	cmp r15, rbx
	mov rbp, rbx
	cmova rbp, r15
	.p2align	4
.LBB144_35:
	cmp rbp, r15
	je .LBB144_36
	vmovupd xmm7, xmmword ptr [r9 + r12 + 32]
	add r12, 32
	mov r13, r15
	inc r15
	vsubpd xmm7, xmm7, xmm4
	vmulpd xmm8, xmm7, xmm7
	vshufpd xmm9, xmm8, xmm8, 1
	vaddsd xmm8, xmm8, xmm9
	vaddsd xmm8, xmm8, xmm1
	vucomisd xmm8, xmm2
	jne .LBB144_38
	jnp .LBB144_35
.LBB144_38:
	vsqrtsd xmm10, xmm8, xmm8
	vmulsd xmm9, xmm5, qword ptr [r9 + r12 + 16]
	shl r13, 4
	vmulsd xmm8, xmm8, xmm10
	vdivsd xmm8, xmm9, xmm8
	vmovupd xmm9, xmmword ptr [r11 + r13]
	vmovddup xmm8, xmm8
	vmulpd xmm7, xmm8, xmm7
	vmulpd xmm8, xmm6, xmm7
	vmulpd xmm7, xmm7, qword ptr [r9 + r12 + 24]{1to2}
	vaddpd xmm3, xmm8, xmm3
	vsubpd xmm7, xmm9, xmm7
	vmovupd xmmword ptr [r11 + r13], xmm7
	jmp .LBB144_34
.LBB144_31:
	test rsi, rsi
	je .LBB144_32
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
.LBB144_32:
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
.LBB144_40:
	.cfi_def_cfa_offset 64
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
