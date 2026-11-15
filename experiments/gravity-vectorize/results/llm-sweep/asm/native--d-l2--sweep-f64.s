engine::force::sweep::<f64>:
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
	mov r14, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov rbx, rsi
	mov rsi, r9
	mov r15, rcx
	shr rsi
	shr r15
	mov ebp, r9d
	mov qword ptr [rsp - 8], rdi
	mov qword ptr [rsp - 24], r9
	and ebp, 1
	mov rdi, qword ptr [rsp + 112]
	mov r9, qword ptr [rsp + 96]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	mov qword ptr [rsp - 16], rbx
	mov eax, r10d
	mov r11d, r14d
	and eax, 1
	shr r10
	and r11d, 1
	shr r14
	cmp rsi, r15
	cmovb r15, rsi
	mov rsi, r9
	cmp r10, r15
	cmovb r15, r10
	mov r10, rdi
	cmp r14, r15
	cmovb r15, r14
	shr rsi
	shr r10
	mov r14, qword ptr [rsp + 104]
	cmp r10, rsi
	cmovae r10, rsi
	cmp r10, r15
	cmovae r10, r15
	mov r15, qword ptr [rsp + 88]
	test r10, r10
	je .LBB29_1
	vmovupd xmm1, xmmword ptr [rbx]
	vmovddup xmm4, qword ptr [rbx + 16]
	vmovddup xmm5, qword ptr [rbx + 8]
	vmovddup xmm3, xmm0
	shl r10, 4
	xor esi, esi
	vxorpd xmm6, xmm6, xmm6
	vpermpd ymm2, ymm1, 17
	vxorpd xmm1, xmm1, xmm1
	.p2align	4
.LBB29_3:
	vbroadcastf128 ymm7, xmmword ptr [rdx + rsi]
	vbroadcastf128 ymm8, xmmword ptr [r8 + rsi]
	vmovupd xmm11, xmmword ptr [r13 + rsi]
	vshufpd ymm7, ymm8, ymm7, 3
	vsubpd xmm8, xmm8, xmm5
	vsubpd ymm7, ymm7, ymm2
	vmulpd xmm8, xmm8, xmm8
	vmulpd ymm9, ymm7, ymm7
	vpermpd ymm9, ymm9, 231
	vaddpd xmm8, xmm9, xmm8
	vmulpd xmm9, xmm4, xmmword ptr [r12 + rsi]
	vaddpd xmm8, xmm8, xmm3
	vsqrtpd xmm10, xmm8
	vcmpneqpd k1, xmm8, xmm6
	vmulpd xmm10, xmm8, xmm10
	vdivpd xmm8 {k1} {z}, xmm9, xmm10
	vmovupd xmm10, xmmword ptr [r15 + rsi]
	vpermpd ymm8, ymm8, 5
	vmulpd ymm7, ymm8, ymm7
	vpermpd ymm9, ymm7, 231
	vpermpd ymm8, ymm7, 226
	vaddpd ymm1, ymm7, ymm1
	vmulpd xmm9, xmm11, xmm9
	vmulpd xmm8, xmm11, xmm8
	vsubpd xmm9, xmm10, xmm9
	vmovupd xmm10, xmmword ptr [r14 + rsi]
	vmovupd xmmword ptr [r15 + rsi], xmm9
	vsubpd xmm8, xmm10, xmm8
	vmovupd xmmword ptr [r14 + rsi], xmm8
	add rsi, 16
	cmp r10, rsi
	jne .LBB29_3
	jmp .LBB29_4
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
.LBB29_4:
	mov esi, ecx
	and esi, 1
	mov r10d, edi
	vextractf128 xmm2, ymm1, 1
	cmp rbp, rsi
	cmovb rsi, rbp
	vshufpd xmm3, xmm2, xmm2, 1
	cmp rax, rsi
	cmovb rsi, rax
	mov eax, r9d
	cmp r11, rsi
	cmovb rsi, r11
	and eax, 1
	and r10d, 1
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rsi
	cmovae rax, rsi
	test rax, rax
	je .LBB29_8
	mov r10, rcx
	mov rcx, qword ptr [rsp - 24]
	movabs rax, 1152921504606846974
	mov r11, qword ptr [rsp + 80]
	movabs rsi, 576460752303423486
	and r10, rax
	and r9, rsi
	and rdi, rsi
	vmovsd xmm5, qword ptr [rdx + 8*r10]
	and rcx, rax
	and r11, rax
	vmovsd xmm6, qword ptr [r8 + 8*rcx]
	mov rcx, qword ptr [rsp - 16]
	vmovsd xmm4, qword ptr [r13 + 8*r11]
	vsubsd xmm5, xmm5, qword ptr [rcx]
	vsubsd xmm6, xmm6, qword ptr [rcx + 8]
	vmulsd xmm7, xmm5, xmm5
	vmulsd xmm8, xmm6, xmm6
	vaddsd xmm7, xmm8, xmm7
	vaddsd xmm0, xmm0, xmm7
	vxorpd xmm7, xmm7, xmm7
	vucomisd xmm0, xmm7
	jne .LBB29_6
	jnp .LBB29_7
.LBB29_6:
	vsqrtsd xmm8, xmm0, xmm0
	mov rdx, qword ptr [rsp + 64]
	and rdx, rax
	vmovsd xmm7, qword ptr [r12 + 8*rdx]
	vmulsd xmm7, xmm7, qword ptr [rcx + 16]
	vmulsd xmm0, xmm8, xmm0
	vdivsd xmm7, xmm7, xmm0
.LBB29_7:
	vmulsd xmm0, xmm5, xmm7
	vmulsd xmm5, xmm6, xmm7
	vmovsd xmm7, qword ptr [r15 + 8*r9]
	vmulsd xmm6, xmm4, xmm0
	vmulsd xmm4, xmm4, xmm5
	vaddsd xmm3, xmm3, xmm0
	vaddsd xmm2, xmm2, xmm5
	vsubsd xmm6, xmm7, xmm6
	vmovsd xmm7, qword ptr [r14 + 8*rdi]
	vmovsd qword ptr [r15 + 8*r9], xmm6
	vsubsd xmm4, xmm7, xmm4
	vmovsd qword ptr [r14 + 8*rdi], xmm4
.LBB29_8:
	mov rax, qword ptr [rsp - 8]
	vmovsd qword ptr [rax], xmm3
	vmovhpd qword ptr [rax + 8], xmm1
	vmovsd qword ptr [rax + 16], xmm2
	vmovlpd qword ptr [rax + 24], xmm1
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
