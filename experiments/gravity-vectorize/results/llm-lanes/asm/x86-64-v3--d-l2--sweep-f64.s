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
	mov rbx, rsi
	mov qword ptr [rsp - 8], rdi
	mov r10, qword ptr [rsp + 80]
	mov rdi, qword ptr [rsp + 64]
	mov ebp, r9d
	and ebp, 1
	mov qword ptr [rsp - 24], r9
	mov rsi, r9
	mov r14, rcx
	shr rsi
	mov eax, edi
	and eax, 1
	shr rdi
	mov r11d, r10d
	and r11d, 1
	shr r10
	shr r14
	cmp rsi, r14
	cmovb r14, rsi
	mov rsi, qword ptr [rsp + 112]
	cmp rdi, r14
	cmovb r14, rdi
	mov r9, qword ptr [rsp + 96]
	cmp r10, r14
	cmovb r14, r10
	mov rdi, r9
	shr rdi
	mov r10, rsi
	shr r10
	cmp r10, rdi
	cmovae r10, rdi
	cmp r10, r14
	cmovae r10, r14
	mov r14, qword ptr [rsp + 104]
	mov r15, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	mov qword ptr [rsp - 16], rbx
	je .LBB29_1
	vbroadcastf128 ymm2, xmmword ptr [rbx]
	vmovddup xmm3, xmm0
	vmovddup xmm4, qword ptr [rbx + 16]
	vmovddup xmm5, xmm2
	shl r10, 4
	vxorpd xmm1, xmm1, xmm1
	xor edi, edi
	vxorpd xmm6, xmm6, xmm6
	.p2align	4
.LBB29_3:
	vbroadcastf128 ymm7, xmmword ptr [r8 + rdi]
	vbroadcastf128 ymm8, xmmword ptr [rdx + rdi]
	vshufpd ymm7, ymm8, ymm7, 3
	vsubpd ymm7, ymm7, ymm2
	vsubpd xmm8, xmm8, xmm5
	vmulpd xmm8, xmm8, xmm8
	vmulpd ymm9, ymm7, ymm7
	vpermpd ymm9, ymm9, 231
	vaddpd xmm8, xmm8, xmm9
	vaddpd xmm8, xmm8, xmm3
	vmulpd xmm9, xmm4, xmmword ptr [r12 + rdi]
	vsqrtpd xmm10, xmm8
	vmulpd xmm10, xmm8, xmm10
	vdivpd xmm9, xmm9, xmm10
	vcmpneqpd xmm8, xmm8, xmm6
	vandpd xmm8, xmm8, xmm9
	vpermpd ymm8, ymm8, 5
	vmulpd ymm7, ymm8, ymm7
	vpermpd ymm8, ymm7, 231
	vpermpd ymm9, ymm7, 226
	vmovupd xmm10, xmmword ptr [r15 + rdi]
	vmovupd xmm11, xmmword ptr [r13 + rdi]
	vmulpd xmm9, xmm11, xmm9
	vsubpd xmm9, xmm10, xmm9
	vmovupd xmmword ptr [r15 + rdi], xmm9
	vmovupd xmm9, xmmword ptr [r14 + rdi]
	vmulpd xmm8, xmm11, xmm8
	vsubpd xmm8, xmm9, xmm8
	vmovupd xmmword ptr [r14 + rdi], xmm8
	vaddpd ymm1, ymm7, ymm1
	add rdi, 16
	cmp r10, rdi
	jne .LBB29_3
	jmp .LBB29_4
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
.LBB29_4:
	mov edi, ecx
	and edi, 1
	cmp rbp, rdi
	cmovb rdi, rbp
	cmp rax, rdi
	cmovb rdi, rax
	cmp r11, rdi
	cmovb rdi, r11
	mov eax, r9d
	and eax, 1
	mov r10d, esi
	and r10d, 1
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rdi
	cmovae rax, rdi
	vextractf128 xmm3, ymm1, 1
	vshufpd xmm2, xmm3, xmm3, 1
	test rax, rax
	je .LBB29_8
	movabs rax, 1152921504606846974
	movabs rdi, 576460752303423486
	mov r10, rcx
	and r10, rax
	mov rcx, qword ptr [rsp - 24]
	and rcx, rax
	mov r11, qword ptr [rsp + 80]
	and r11, rax
	and r9, rdi
	and rsi, rdi
	vmovsd xmm5, qword ptr [rdx + 8*r10]
	vmovsd xmm7, qword ptr [r8 + 8*rcx]
	vmovsd xmm4, qword ptr [r13 + 8*r11]
	mov rcx, qword ptr [rsp - 16]
	vsubsd xmm6, xmm5, qword ptr [rcx]
	vsubsd xmm5, xmm7, qword ptr [rcx + 8]
	vmulsd xmm7, xmm6, xmm6
	vmulsd xmm8, xmm5, xmm5
	vaddsd xmm7, xmm8, xmm7
	vaddsd xmm7, xmm0, xmm7
	vxorpd xmm0, xmm0, xmm0
	vucomisd xmm7, xmm0
	jne .LBB29_6
	jnp .LBB29_7
.LBB29_6:
	mov rdx, qword ptr [rsp + 64]
	and rdx, rax
	vmovsd xmm0, qword ptr [r12 + 8*rdx]
	vmulsd xmm0, xmm0, qword ptr [rcx + 16]
	vsqrtsd xmm8, xmm7, xmm7
	vmulsd xmm7, xmm8, xmm7
	vdivsd xmm0, xmm0, xmm7
.LBB29_7:
	vmulsd xmm6, xmm6, xmm0
	vmulsd xmm7, xmm4, xmm6
	vmovsd xmm8, qword ptr [r15 + 8*r9]
	vsubsd xmm7, xmm8, xmm7
	vmovsd qword ptr [r15 + 8*r9], xmm7
	vmulsd xmm0, xmm5, xmm0
	vmulsd xmm4, xmm4, xmm0
	vmovsd xmm5, qword ptr [r14 + 8*rsi]
	vsubsd xmm4, xmm5, xmm4
	vmovsd qword ptr [r14 + 8*rsi], xmm4
	vaddsd xmm3, xmm3, xmm6
	vaddsd xmm2, xmm2, xmm0
.LBB29_8:
	mov rax, qword ptr [rsp - 8]
	vmovsd qword ptr [rax], xmm3
	vmovlpd qword ptr [rax + 8], xmm1
	vmovsd qword ptr [rax + 16], xmm2
	vmovhpd qword ptr [rax + 24], xmm1
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
