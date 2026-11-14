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
	mov qword ptr [rsp - 72], rdi
	mov r10, qword ptr [rsp + 80]
	mov rdi, qword ptr [rsp + 64]
	mov r14, rcx
	mov rcx, r9
	mov qword ptr [rsp - 104], r14
	shr rcx, 2
	shr r14, 2
	mov r15d, r9d
	and r15d, 3
	mov r11, qword ptr [rsp + 112]
	mov rbx, qword ptr [rsp + 96]
	mov r12, qword ptr [rsp + 88]
	mov rbp, qword ptr [rsp + 72]
	vxorpd xmm1, xmm1, xmm1
	vmovupd xmmword ptr [rsp - 56], xmm1
	mov qword ptr [rsp - 40], 0
	vmovupd xmmword ptr [rsp - 24], xmm1
	mov qword ptr [rsp - 8], 0
	mov qword ptr [rsp - 80], rdx
	mov r13d, edi
	mov eax, r10d
	and r13d, 3
	shr rdi, 2
	and eax, 3
	shr r10, 2
	cmp rcx, r14
	cmovb r14, rcx
	mov rcx, rbx
	cmp rdi, r14
	cmovb r14, rdi
	cmp r10, r14
	cmovb r14, r10
	shr rcx, 2
	shr r11, 2
	cmp r11, rcx
	cmovae r11, rcx
	mov rcx, qword ptr [rsp + 56]
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 104]
	test r11, r11
	je .LBB29_1
	vmovupd xmm2, xmmword ptr [rsi]
	vmovddup xmm3, qword ptr [rsi]
	vmovddup xmm6, qword ptr [rsi + 16]
	vmovddup xmm7, qword ptr [rsi + 8]
	vmovapd ymm17, ymmword ptr [rip + .LCPI29_0]
	mov r10b, 9
	vmovddup xmm4, xmm0
	mov qword ptr [rsp - 96], r9
	lea rdi, [rcx + 8]
	lea r9, [rdx + 8]
	shl r11, 5
	mov qword ptr [rsp - 88], rsi
	vxorpd xmm5, xmm5, xmm5
	xor ecx, ecx
	vxorpd xmm10, xmm10, xmm10
	vxorpd xmm8, xmm8, xmm8
	kmovd k1, r10d
	vpermpd ymm2, ymm2, 65
	.p2align	4
.LBB29_3:
	vmovupd xmm12, xmmword ptr [r9 + rcx]
	vmovupd xmm13, xmmword ptr [r8 + rcx + 8]
	vmovupd ymm11 {k1} {z}, ymmword ptr [r9 + rcx - 8]
	vmovupd ymm18, ymmword ptr [r14 + rcx]
	vsubpd xmm12, xmm12, xmm3
	vsubpd xmm13, xmm13, xmm7
	vpermpd ymm11, ymm11, 204
	vmulpd xmm14, xmm12, xmm12
	vmulpd xmm15, xmm13, xmm13
	vaddpd xmm14, xmm14, xmm15
	vmulpd xmm15, xmm6, xmmword ptr [rdi + rcx]
	vaddpd xmm14, xmm14, xmm4
	vsqrtpd xmm16, xmm14
	vcmpneqpd k2, xmm14, xmm1
	vmulpd xmm16, xmm14, xmm16
	vdivpd xmm14 {k2} {z}, xmm15, xmm16
	vmulpd xmm12, xmm12, xmm14
	vmulpd xmm13, xmm13, xmm14
	vmovsd xmm14, qword ptr [r8 + rcx + 24]
	vaddpd xmm10, xmm12, xmm10
	vaddpd xmm8, xmm13, xmm8
	vblendpd ymm11, ymm11, ymm14, 1
	vbroadcastsd ymm14, qword ptr [r8 + rcx]
	vblendpd ymm11, ymm11, ymm14, 8
	vsubpd ymm11, ymm11, ymm2
	vmulpd ymm14, ymm11, ymm11
	vextractf128 xmm15, ymm14, 1
	vhaddpd xmm14, xmm15, xmm14
	vmovupd ymm15 {k1} {z}, ymmword ptr [rdi + rcx - 8]
	vaddpd xmm14, xmm14, xmm4
	vsqrtpd xmm16, xmm14
	vcmpneqpd k2, xmm14, xmm1
	vpermpd ymm15, ymm15, 236
	vmulpd xmm15, xmm15, xmm6
	vmulpd xmm16, xmm14, xmm16
	vdivpd xmm14 {k2} {z}, xmm15, xmm16
	vmovupd ymm15, ymmword ptr [rbp + rcx]
	vpermpd ymm14, ymm14, 5
	vmulpd ymm11, ymm11, ymm14
	vmovupd ymm14, ymmword ptr [r12 + rcx]
	vbroadcastsd ymm9, xmm11
	vshuff64x2 ymm16, ymm11, ymm15, 3
	vaddpd ymm5, ymm11, ymm5
	vpermt2pd ymm11, ymm17, ymm12
	vmulpd ymm11, ymm11, ymm15
	vsubpd ymm11, ymm14, ymm11
	vpermpd ymm14, ymm13, 208
	vblendpd ymm14, ymm14, ymm15, 1
	vblendpd ymm9, ymm14, ymm9, 8
	vshufpd ymm14, ymm16, ymm15, 11
	vmovupd ymmword ptr [r12 + rcx], ymm11
	vmulpd ymm9, ymm9, ymm14
	vsubpd ymm9, ymm18, ymm9
	vmovupd ymmword ptr [r14 + rcx], ymm9
	add rcx, 32
	cmp r11, rcx
	jne .LBB29_3
	mov rsi, qword ptr [rsp - 88]
	mov r9, qword ptr [rsp - 96]
	vextractf128 xmm2, ymm5, 1
	vmovupd xmmword ptr [rsp - 56], xmm10
	vmovupd xmmword ptr [rsp - 24], xmm8
	vmovhpd qword ptr [rsp - 40], xmm5
	vmovlpd qword ptr [rsp - 8], xmm5
	vshufpd xmm1, xmm2, xmm2, 1
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB29_5:
	mov r10, qword ptr [rsp - 104]
	mov rdx, qword ptr [rsp - 80]
	vmovsd qword ptr [rsp - 64], xmm2
	vmovsd qword ptr [rsp - 32], xmm1
	mov ecx, r10d
	and ecx, 3
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	mov r13, qword ptr [rsp + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, ebx
	and eax, 3
	mov edi, r13d
	and edi, 3
	cmp rdi, rax
	cmovb rax, rdi
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB29_7
	dec rax
	movabs rcx, 1152921504606846972
	vbroadcastsd ymm0, xmm0
	mov r11, qword ptr [rsp + 64]
	mov rdi, qword ptr [rsp + 80]
	vpbroadcastq ymm1, rax
	vpcmpnltuq k1, ymm1, ymmword ptr [rip + .LCPI29_1]
	and r10, rcx
	and r9, rcx
	lea r15, [rdx + 8*r10]
	lea r8, [r8 + 8*r9]
	and rdi, rcx
	and r11, rcx
	movabs rcx, 576460752303423484
	and rbx, rcx
	and r13, rcx
	mov rcx, qword ptr [rsp + 56]
	lea r10, [rbp + 8*rdi]
	lea rdi, [r12 + 8*rbx]
	vmovupd ymm1 {k1} {z}, ymmword ptr [r15]
	vmovupd ymm2 {k1} {z}, ymmword ptr [r8]
	vmovupd ymm4 {k1} {z}, ymmword ptr [r10]
	vsubpd ymm1, ymm1, qword ptr [rsi]{1to4}
	vsubpd ymm2, ymm2, qword ptr [rsi + 8]{1to4}
	lea r11, [rcx + 8*r11]
	lea rcx, [r14 + 8*r13]
	vmovupd ymm3 {k1} {z}, ymmword ptr [r11]
	vmulpd ymm3, ymm3, qword ptr [rsi + 16]{1to4}
	vmulpd ymm5, ymm1, ymm1
	vmulpd ymm6, ymm2, ymm2
	vaddpd ymm5, ymm5, ymm6
	vxorpd xmm6, xmm6, xmm6
	vaddpd ymm0, ymm0, ymm5
	vsqrtpd ymm5, ymm0
	vcmpneqpd k2, ymm0, ymm6
	vmulpd ymm5, ymm0, ymm5
	vdivpd ymm0 {k2} {z}, ymm3, ymm5
	vmovupd ymm5 {k1} {z}, ymmword ptr [rdi]
	vmulpd ymm1, ymm1, ymm0
	vmulpd ymm0, ymm2, ymm0
	vmulpd ymm3, ymm4, ymm1
	vmulpd ymm2, ymm4, ymm0
	vmovupd ymm4 {k1} {z}, ymmword ptr [rcx]
	vaddpd ymm1, ymm1, ymmword ptr [rsp - 64]
	vaddpd ymm0, ymm0, ymmword ptr [rsp - 32]
	vsubpd ymm3, ymm5, ymm3
	vmovupd ymmword ptr [rdi] {k1}, ymm3
	vsubpd ymm2, ymm4, ymm2
	vmovupd ymmword ptr [rsp - 64] {k1}, ymm1
	vmovupd ymmword ptr [rsp - 32] {k1}, ymm0
	vmovupd ymmword ptr [rcx] {k1}, ymm2
.LBB29_7:
	vmovups ymm0, ymmword ptr [rsp - 64]
	vmovups ymm1, ymmword ptr [rsp - 32]
	mov rax, qword ptr [rsp - 72]
	vmovups ymmword ptr [rax], ymm0
	vmovups ymmword ptr [rax + 32], ymm1
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
