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
	mov rbx, qword ptr [rsp + 112]
	mov r11, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov r13d, r9d
	and r13d, 3
	mov qword ptr [rsp - 112], r9
	mov rax, r9
	shr rax, 2
	mov ebp, r10d
	and ebp, 3
	mov r9, r10
	shr r9, 2
	mov r10d, r11d
	and r10d, 3
	shr r11, 2
	mov qword ptr [rsp - 96], rcx
	mov r15, rcx
	shr r15, 2
	cmp rax, r15
	cmovb r15, rax
	mov r14, qword ptr [rsp + 96]
	cmp r9, r15
	cmovb r15, r9
	cmp r11, r15
	cmovb r15, r11
	mov rax, r14
	shr rax, 2
	shr rbx, 2
	cmp rbx, rax
	cmovae rbx, rax
	mov qword ptr [rsp - 104], rdi
	cmp rbx, r15
	cmovae rbx, r15
	mov r11, qword ptr [rsp + 104]
	vxorpd xmm1, xmm1, xmm1
	vmovupd xmmword ptr [rsp - 80], xmm1
	mov qword ptr [rsp - 64], 0
	vmovupd xmmword ptr [rsp - 48], xmm1
	mov qword ptr [rsp - 32], 0
	mov r15, qword ptr [rsp + 88]
	mov r12, qword ptr [rsp + 72]
	mov rax, qword ptr [rsp + 56]
	test rbx, rbx
	je .LBB29_1
	vbroadcastf128 ymm2, xmmword ptr [rsi]
	vmovapd xmmword ptr [rsp - 24], xmm0
	vmovddup xmm4, xmm0
	vmovddup xmm5, qword ptr [rsi + 16]
	vmovddup xmm6, xmm2
	vshufpd xmm7, xmm2, xmm2, 3
	shl rbx, 5
	vxorpd xmm3, xmm3, xmm3
	xor r9d, r9d
	vxorpd xmm9, xmm9, xmm9
	vxorpd xmm8, xmm8, xmm8
	vxorpd xmm0, xmm0, xmm0
	.p2align	4
.LBB29_3:
	vmovupd xmm10, xmmword ptr [rdx + r9 + 8]
	vsubpd xmm10, xmm10, xmm6
	vmovupd xmm11, xmmword ptr [r8 + r9 + 8]
	vsubpd xmm11, xmm11, xmm7
	vmulpd xmm12, xmm10, xmm10
	vmulpd xmm13, xmm11, xmm11
	vaddpd xmm12, xmm12, xmm13
	vaddpd xmm12, xmm12, xmm4
	vmulpd xmm13, xmm5, xmmword ptr [rax + r9 + 8]
	vsqrtpd xmm14, xmm12
	vmulpd xmm14, xmm12, xmm14
	vdivpd xmm13, xmm13, xmm14
	vcmpneqpd xmm12, xmm12, xmm0
	vandpd xmm12, xmm12, xmm13
	vmulpd xmm10, xmm10, xmm12
	vmovsd xmm13, qword ptr [rdx + r9]
	vmovhpd xmm13, xmm13, qword ptr [r8 + r9]
	vmulpd xmm11, xmm11, xmm12
	vmovsd xmm12, qword ptr [rdx + r9 + 24]
	vmovhpd xmm12, xmm12, qword ptr [r8 + r9 + 24]
	vinsertf128 ymm12, ymm12, xmm13, 1
	vsubpd ymm12, ymm12, ymm2
	vmulpd ymm13, ymm12, ymm12
	vextractf128 xmm14, ymm13, 1
	vhaddpd xmm13, xmm13, xmm14
	vaddpd xmm13, xmm13, xmm4
	vmovsd xmm14, qword ptr [rax + r9 + 24]
	vmovhpd xmm14, xmm14, qword ptr [rax + r9]
	vmulpd xmm14, xmm14, xmm5
	vsqrtpd xmm15, xmm13
	vmulpd xmm15, xmm13, xmm15
	vdivpd xmm14, xmm14, xmm15
	vcmpneqpd xmm13, xmm13, xmm0
	vandpd xmm13, xmm13, xmm14
	vpermpd ymm13, ymm13, 80
	vmulpd ymm12, ymm12, ymm13
	vmovupd ymm13, ymmword ptr [r15 + r9]
	vmovupd ymm14, ymmword ptr [r12 + r9]
	vperm2f128 ymm15, ymm12, ymm10, 33
	vinsertf128 ymm1, ymm10, xmm12, 1
	vshufpd ymm1, ymm15, ymm1, 4
	vmulpd ymm1, ymm14, ymm1
	vsubpd ymm1, ymm13, ymm1
	vmovupd ymmword ptr [r15 + r9], ymm1
	vmovupd ymm1, ymmword ptr [r11 + r9]
	vpermpd ymm13, ymm11, 208
	vblendpd ymm15, ymm13, ymm14, 1
	vinsertf128 ymm13, ymm13, xmm12, 1
	vblendpd ymm13, ymm15, ymm13, 10
	vpermpd ymm15, ymm12, 255
	vblendpd ymm14, ymm14, ymm15, 1
	vmulpd ymm13, ymm13, ymm14
	vsubpd ymm1, ymm1, ymm13
	vmovupd ymmword ptr [r11 + r9], ymm1
	vaddpd xmm9, xmm10, xmm9
	vaddpd xmm8, xmm11, xmm8
	vaddpd ymm3, ymm12, ymm3
	add r9, 32
	cmp rbx, r9
	jne .LBB29_3
	vmovupd xmmword ptr [rsp - 80], xmm9
	vmovlpd qword ptr [rsp - 64], xmm3
	vmovupd xmmword ptr [rsp - 48], xmm8
	vmovhpd qword ptr [rsp - 32], xmm3
	vextractf128 xmm2, ymm3, 1
	vshufpd xmm1, xmm2, xmm2, 1
	vmovapd xmm0, xmmword ptr [rsp - 24]
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB29_5:
	vmovsd qword ptr [rsp - 88], xmm2
	vmovsd qword ptr [rsp - 56], xmm1
	mov rcx, qword ptr [rsp - 96]
	mov ebx, ecx
	and ebx, 3
	cmp r13, rbx
	cmovb rbx, r13
	cmp rbp, rbx
	cmovb rbx, rbp
	cmp r10, rbx
	cmovb rbx, r10
	mov r9d, r14d
	and r9d, 3
	mov rdi, qword ptr [rsp + 112]
	mov r10d, edi
	and r10d, 3
	cmp r10, r9
	cmovb r9, r10
	cmp r9, rbx
	cmovae r9, rbx
	test r9, r9
	je .LBB29_7
	movabs r10, 1152921504606846972
	and rcx, r10
	mov rbp, qword ptr [rsp - 112]
	and rbp, r10
	mov rbx, qword ptr [rsp + 64]
	mov r13, r14
	mov r14, rbx
	and r14, r10
	mov rbx, qword ptr [rsp + 80]
	and rbx, r10
	lea rdx, [rdx + 8*rcx]
	lea r8, [r8 + 8*rbp]
	lea rax, [rax + 8*r14]
	dec r9
	vmovq xmm1, r9
	vpbroadcastq ymm2, xmm1
	vpbroadcastq ymm1, qword ptr [rip + .LCPI29_0]
	vpxor ymm2, ymm2, ymm1
	vmovdqa ymm1, ymmword ptr [rip + .LCPI29_1]
	vpcmpgtq ymm2, ymm1, ymm2
	vpcmpeqd ymm1, ymm1, ymm1
	vpxor ymm1, ymm2, ymm1
	vmaskmovpd ymm8, ymm1, ymmword ptr [rdx]
	lea rcx, [r12 + 8*rbx]
	vmaskmovpd ymm2, ymm1, ymmword ptr [r8]
	vmaskmovpd ymm3, ymm1, ymmword ptr [rax]
	movabs rax, 576460752303423484
	and r13, rax
	lea rdx, [r15 + 8*r13]
	vbroadcastsd ymm4, qword ptr [rsi + 16]
	vbroadcastsd ymm5, qword ptr [rsi + 8]
	vbroadcastsd ymm6, qword ptr [rsi]
	vmaskmovpd ymm7, ymm1, ymmword ptr [rcx]
	vsubpd ymm8, ymm8, ymm6
	vbroadcastsd ymm6, xmm0
	vsubpd ymm2, ymm2, ymm5
	vmulpd ymm3, ymm3, ymm4
	vmulpd ymm4, ymm8, ymm8
	vmulpd ymm5, ymm2, ymm2
	vaddpd ymm4, ymm4, ymm5
	vaddpd ymm4, ymm6, ymm4
	vsqrtpd ymm5, ymm4
	vmulpd ymm5, ymm4, ymm5
	vdivpd ymm3, ymm3, ymm5
	vxorpd xmm5, xmm5, xmm5
	vcmpneqpd ymm4, ymm4, ymm5
	vandpd ymm3, ymm4, ymm3
	vmulpd ymm0, ymm8, ymm3
	vmulpd ymm4, ymm7, ymm0
	vmaskmovpd ymm5, ymm1, ymmword ptr [rdx]
	vsubpd ymm4, ymm5, ymm4
	vmaskmovpd ymmword ptr [rdx], ymm1, ymm4
	and rdi, rax
	lea rax, [r11 + 8*rdi]
	vmulpd ymm2, ymm2, ymm3
	vmulpd ymm3, ymm7, ymm2
	vmaskmovpd ymm4, ymm1, ymmword ptr [rax]
	vsubpd ymm3, ymm4, ymm3
	vmaskmovpd ymmword ptr [rax], ymm1, ymm3
	vaddpd ymm0, ymm0, ymmword ptr [rsp - 88]
	vmaskmovpd ymmword ptr [rsp - 88], ymm1, ymm0
	vaddpd ymm0, ymm2, ymmword ptr [rsp - 56]
	vmaskmovpd ymmword ptr [rsp - 56], ymm1, ymm0
.LBB29_7:
	vmovups ymm0, ymmword ptr [rsp - 88]
	mov rax, qword ptr [rsp - 104]
	vmovups ymmword ptr [rax], ymm0
	vmovups ymm0, ymmword ptr [rsp - 56]
	vmovups ymmword ptr [rax + 32], ymm0
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
