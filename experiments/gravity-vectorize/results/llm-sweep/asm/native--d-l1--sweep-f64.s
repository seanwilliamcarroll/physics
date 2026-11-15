engine::force::sweep::<f64>:
	.cfi_startproc
	push rbx
	.cfi_def_cfa_offset 16
	.cfi_offset rbx, -16
	mov rbx, qword ptr [rsp + 24]
	mov r10, qword ptr [rsp + 40]
	cmp r9, rcx
	mov r11, qword ptr [rsp + 56]
	mov rax, qword ptr [rsp + 72]
	cmovb rcx, r9
	cmp rbx, rcx
	cmovb rcx, rbx
	cmp r10, rcx
	cmovb rcx, r10
	cmp rax, r11
	cmovb r11, rax
	cmp r11, rcx
	cmovae r11, rcx
	test r11, r11
	je .LBB29_1
	vmovsd xmm5, qword ptr [rsi]
	vmovsd xmm4, qword ptr [rsi + 8]
	vmovsd xmm3, qword ptr [rsi + 16]
	mov rax, qword ptr [rsp + 64]
	mov rcx, qword ptr [rsp + 48]
	mov r9, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 16]
	vxorpd xmm2, xmm2, xmm2
	cmp r11, 1
	jne .LBB29_4
	xor esi, esi
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm6, xmm6, xmm6
	jmp .LBB29_7
.LBB29_1:
	vxorpd xmm6, xmm6, xmm6
	vxorpd xmm1, xmm1, xmm1
.LBB29_10:
	vmovsd qword ptr [rdi], xmm1
	vmovsd qword ptr [rdi + 8], xmm6
	pop rbx
	.cfi_def_cfa_offset 8
	ret
.LBB29_4:
	.cfi_def_cfa_offset 16
	movabs rbx, 576460752303423486
	vmovddup xmm6, xmm5
	vmovddup xmm7, xmm0
	vmovddup xmm8, xmm4
	vmovddup xmm9, xmm3
	vxorpd xmm10, xmm10, xmm10
	xor esi, esi
	vxorpd xmm1, xmm1, xmm1
	and rbx, r11
	.p2align	4
.LBB29_5:
	vmovupd xmm11, xmmword ptr [rdx + 8*rsi]
	vmovupd xmm12, xmmword ptr [r8 + 8*rsi]
	vsubpd xmm11, xmm11, xmm6
	vsubpd xmm12, xmm12, xmm8
	vmulpd xmm13, xmm11, xmm11
	vmulpd xmm14, xmm12, xmm12
	vaddpd xmm13, xmm13, xmm14
	vmulpd xmm14, xmm9, xmmword ptr [r10 + 8*rsi]
	vaddpd xmm13, xmm13, xmm7
	vsqrtpd xmm15, xmm13
	vcmpneqpd k1, xmm13, xmm10
	vmulpd xmm15, xmm13, xmm15
	vdivpd xmm13 {k1} {z}, xmm14, xmm15
	vmovupd xmm14, xmmword ptr [r9 + 8*rsi]
	vmovupd xmm15, xmmword ptr [rcx + 8*rsi]
	vmulpd xmm11, xmm11, xmm13
	vmulpd xmm12, xmm12, xmm13
	vmovupd xmm13, xmmword ptr [rax + 8*rsi]
	vmulpd xmm16, xmm14, xmm11
	vmulpd xmm14, xmm14, xmm12
	vsubpd xmm15, xmm15, xmm16
	vsubpd xmm13, xmm13, xmm14
	vunpcklpd xmm14, xmm11, xmm12
	vunpckhpd xmm11, xmm11, xmm12
	vaddpd xmm1, xmm14, xmm1
	vmovupd xmmword ptr [rcx + 8*rsi], xmm15
	vmovupd xmmword ptr [rax + 8*rsi], xmm13
	add rsi, 2
	vaddpd xmm1, xmm11, xmm1
	cmp rbx, rsi
	jne .LBB29_5
	vshufpd xmm6, xmm1, xmm1, 1
	test r11b, 1
	je .LBB29_10
.LBB29_7:
	vmovsd xmm7, qword ptr [rdx + 8*rsi]
	vsubsd xmm5, xmm7, xmm5
	vmovsd xmm7, qword ptr [r8 + 8*rsi]
	vsubsd xmm4, xmm7, xmm4
	vmulsd xmm7, xmm5, xmm5
	vmulsd xmm8, xmm4, xmm4
	vaddsd xmm7, xmm8, xmm7
	vaddsd xmm0, xmm0, xmm7
	vucomisd xmm0, xmm2
	jne .LBB29_8
	jnp .LBB29_9
.LBB29_8:
	vsqrtsd xmm7, xmm0, xmm0
	vmulsd xmm2, xmm3, qword ptr [r10 + 8*rsi]
	vmulsd xmm0, xmm0, xmm7
	vdivsd xmm2, xmm2, xmm0
.LBB29_9:
	vmulsd xmm0, xmm5, xmm2
	vmulsd xmm2, xmm4, xmm2
	vmovsd xmm4, qword ptr [r9 + 8*rsi]
	vmovsd xmm3, qword ptr [rcx + 8*rsi]
	vaddsd xmm1, xmm1, xmm0
	vaddsd xmm6, xmm2, xmm6
	vmulsd xmm5, xmm4, xmm0
	vmulsd xmm4, xmm4, xmm2
	vsubsd xmm3, xmm3, xmm5
	vmovsd qword ptr [rcx + 8*rsi], xmm3
	vmovsd xmm3, qword ptr [rax + 8*rsi]
	vsubsd xmm3, xmm3, xmm4
	vmovsd qword ptr [rax + 8*rsi], xmm3
	vmovsd qword ptr [rdi], xmm1
	vmovsd qword ptr [rdi + 8], xmm6
	pop rbx
	.cfi_def_cfa_offset 8
	ret
