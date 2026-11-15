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
	sub rsp, 232
	.cfi_def_cfa_offset 288
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov rcx, rsi
	mov qword ptr [rsp - 104], rdi
	mov r11, qword ptr [rsp + 312]
	mov r10, qword ptr [rsp + 296]
	mov r15d, r9d
	and r15d, 7
	mov qword ptr [rsp - 120], r9
	mov rsi, r9
	shr rsi, 3
	mov r13d, r10d
	and r13d, 7
	mov rdi, r10
	shr rdi, 3
	mov eax, r11d
	and eax, 7
	mov r9, r11
	shr r9, 3
	mov qword ptr [rsp - 128], r14
	shr r14, 3
	cmp rsi, r14
	cmovb r14, rsi
	mov rsi, qword ptr [rsp + 344]
	cmp rdi, r14
	cmovb r14, rdi
	mov rbx, qword ptr [rsp + 328]
	cmp r9, r14
	cmovb r14, r9
	mov rdi, rbx
	shr rdi, 3
	mov r11, rsi
	shr r11, 3
	cmp r11, rdi
	cmovae r11, rdi
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 336]
	vxorpd xmm2, xmm2, xmm2
	vmovupd ymmword ptr [rsp - 64], ymm2
	vmovupd ymmword ptr [rsp - 88], ymm2
	vmovupd ymmword ptr [rsp - 24], ymm2
	vmovupd ymmword ptr [rsp], ymm2
	mov r12, qword ptr [rsp + 320]
	mov rbp, qword ptr [rsp + 304]
	mov rdi, qword ptr [rsp + 288]
	test r11, r11
	mov qword ptr [rsp - 112], rcx
	je .LBB29_1
	vbroadcastf128 ymm1, xmmword ptr [rcx]
	vbroadcastsd ymm3, xmm1
	vmovupd ymmword ptr [rsp + 160], ymm3
	vmovaps xmmword ptr [rsp + 32], xmm0
	vbroadcastsd ymm0, xmm0
	vmovups ymmword ptr [rsp + 96], ymm0
	vbroadcastsd ymm0, qword ptr [rcx + 16]
	vmovups ymmword ptr [rsp + 64], ymm0
	vpermpd ymm0, ymm1, 85
	vmovupd ymmword ptr [rsp + 128], ymm0
	vmovupd ymmword ptr [rsp + 192], ymm1
	vshufpd xmm0, xmm1, xmm1, 3
	vmovapd xmmword ptr [rsp + 48], xmm0
	shl r11, 6
	xor r9d, r9d
	vxorpd xmm12, xmm12, xmm12
	vxorpd xmm13, xmm13, xmm13
	vxorpd xmm4, xmm4, xmm4
	vxorpd xmm11, xmm11, xmm11
	vxorpd xmm8, xmm8, xmm8
	vmovupd ymm10, ymmword ptr [rsp + 64]
	.p2align	4
.LBB29_3:
	vmovupd ymm0, ymmword ptr [rdx + r9 + 8]
	vmovupd ymm3, ymmword ptr [rsp + 160]
	vsubpd ymm6, ymm0, ymm3
	vmovupd ymm0, ymmword ptr [r8 + r9 + 8]
	vsubpd ymm0, ymm0, ymmword ptr [rsp + 128]
	vmulpd ymm1, ymm6, ymm6
	vmulpd ymm14, ymm0, ymm0
	vaddpd ymm1, ymm14, ymm1
	vmulpd ymm14, ymm10, ymmword ptr [rdi + r9 + 8]
	vmovupd ymm5, ymmword ptr [rsp + 96]
	vaddpd ymm1, ymm5, ymm1
	vsqrtpd ymm15, ymm1
	vmulpd ymm15, ymm15, ymm1
	vdivpd ymm14, ymm14, ymm15
	vcmpneqpd ymm1, ymm1, ymm2
	vandpd ymm1, ymm14, ymm1
	vmulpd ymm14, ymm6, ymm1
	vmovupd xmm6, xmmword ptr [rdx + r9 + 40]
	vsubpd xmm6, xmm6, xmm3
	vmovupd xmm15, xmmword ptr [r8 + r9 + 40]
	vsubpd xmm7, xmm15, xmmword ptr [rsp + 48]
	vmulpd xmm15, xmm6, xmm6
	vmulpd xmm9, xmm7, xmm7
	vaddpd xmm9, xmm15, xmm9
	vmulpd xmm15, xmm10, xmmword ptr [rdi + r9 + 40]
	vaddpd xmm9, xmm9, xmm5
	vsqrtpd xmm2, xmm9
	vmulpd xmm2, xmm9, xmm2
	vdivpd xmm2, xmm15, xmm2
	vxorpd xmm3, xmm3, xmm3
	vcmpneqpd xmm9, xmm9, xmm3
	vmovsd xmm15, qword ptr [rdx + r9]
	vmovhpd xmm3, xmm15, qword ptr [r8 + r9]
	vandpd xmm2, xmm9, xmm2
	vmovsd xmm9, qword ptr [rdx + r9 + 56]
	vmovhpd xmm9, xmm9, qword ptr [r8 + r9 + 56]
	vmulpd xmm15, xmm6, xmm2
	vinsertf128 ymm3, ymm9, xmm3, 1
	vsubpd ymm3, ymm3, ymmword ptr [rsp + 192]
	vmulpd ymm6, ymm3, ymm3
	vextractf128 xmm9, ymm6, 1
	vhaddpd xmm6, xmm6, xmm9
	vmulpd ymm1, ymm0, ymm1
	vmulpd xmm0, xmm7, xmm2
	vaddpd xmm2, xmm5, xmm6
	vmovsd xmm6, qword ptr [rdi + r9 + 56]
	vmovhpd xmm6, xmm6, qword ptr [rdi + r9]
	vmulpd xmm6, xmm10, xmm6
	vsqrtpd xmm7, xmm2
	vmulpd xmm7, xmm2, xmm7
	vdivpd xmm6, xmm6, xmm7
	vxorpd xmm5, xmm5, xmm5
	vcmpneqpd xmm2, xmm2, xmm5
	vandpd xmm2, xmm2, xmm6
	vpermpd ymm2, ymm2, 80
	vmulpd ymm6, ymm3, ymm2
	vmovupd ymm2, ymmword ptr [rbp + r9]
	vperm2f128 ymm3, ymm6, ymm14, 33
	vshufpd ymm3, ymm3, ymm14, 4
	vmulpd ymm3, ymm3, ymm2
	vmovupd ymm7, ymmword ptr [r12 + r9]
	vsubpd ymm3, ymm7, ymm3
	vmovupd ymm7, ymmword ptr [r12 + r9 + 32]
	vmovupd ymmword ptr [r12 + r9], ymm3
	vperm2f128 ymm3, ymm14, ymm15, 33
	vshufpd ymm3, ymm3, ymm15, 13
	vbroadcastsd ymm9, xmm6
	vblendpd ymm3, ymm3, ymm9, 8
	vmovupd ymm9, ymmword ptr [rbp + r9 + 32]
	vmulpd ymm3, ymm9, ymm3
	vsubpd ymm3, ymm7, ymm3
	vmovupd ymmword ptr [r12 + r9 + 32], ymm3
	vperm2f128 ymm3, ymm6, ymm1, 33
	vshufpd ymm3, ymm3, ymm1, 5
	vmulpd ymm2, ymm3, ymm2
	vmovupd ymm3, ymmword ptr [r14 + r9]
	vsubpd ymm2, ymm3, ymm2
	vmovupd ymm3, ymmword ptr [r14 + r9 + 32]
	vmovupd ymmword ptr [r14 + r9], ymm2
	vperm2f128 ymm2, ymm1, ymm0, 33
	vmovddup xmm7, xmm0
	vinsertf128 ymm7, ymm7, xmm6, 1
	vunpckhpd ymm2, ymm2, ymm7
	vmulpd ymm2, ymm9, ymm2
	vsubpd ymm2, ymm3, ymm2
	vmovupd ymmword ptr [r14 + r9 + 32], ymm2
	vxorpd xmm2, xmm2, xmm2
	vaddpd ymm12, ymm14, ymm12
	vaddpd xmm13, xmm15, xmm13
	vaddpd ymm4, ymm1, ymm4
	vaddpd xmm11, xmm11, xmm0
	vaddpd ymm8, ymm8, ymm6
	add r9, 64
	cmp r11, r9
	jne .LBB29_3
	vmovupd ymmword ptr [rsp - 88], ymm12
	vmovupd xmmword ptr [rsp - 56], xmm13
	vmovlpd qword ptr [rsp - 40], xmm8
	vmovupd ymmword ptr [rsp - 24], ymm4
	vmovupd xmmword ptr [rsp + 8], xmm11
	vmovhpd qword ptr [rsp + 24], xmm8
	vextractf128 xmm1, ymm8, 1
	vshufpd xmm2, xmm1, xmm1, 1
	vmovapd xmm0, xmmword ptr [rsp + 32]
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
.LBB29_5:
	mov rcx, qword ptr [rsp - 128]
	vmovsd qword ptr [rsp - 96], xmm1
	vmovsd qword ptr [rsp - 32], xmm2
	mov r11d, ecx
	and r11d, 7
	cmp r15, r11
	cmovb r11, r15
	cmp r13, r11
	cmovb r11, r13
	cmp rax, r11
	cmovb r11, rax
	mov r9d, ebx
	and r9d, 7
	mov eax, esi
	and eax, 7
	cmp rax, r9
	cmovb r9, rax
	cmp r9, r11
	cmovae r9, r11
	test r9, r9
	je .LBB29_8
	movabs rax, 1152921504606846968
	and rcx, rax
	mov r11, rcx
	mov rcx, qword ptr [rsp - 120]
	and rcx, rax
	and r10, rax
	mov r15, qword ptr [rsp + 312]
	and r15, rax
	movabs rax, 576460752303423480
	and rbx, rax
	and rsi, rax
	lea rax, [rdx + 8*r11]
	lea rdx, [r8 + 8*rcx]
	lea rdi, [rdi + 8*r10]
	lea rcx, [8*r15]
	add rcx, rbp
	lea r8, [r12 + 8*rbx]
	lea rsi, [r14 + 8*rsi]
	lea r10, [r9 - 1]
	vmovq xmm1, r10
	vpbroadcastq ymm6, xmm1
	mov r10, qword ptr [rsp - 112]
	vbroadcastsd ymm1, qword ptr [r10]
	vbroadcastsd ymm2, qword ptr [r10 + 8]
	vbroadcastsd ymm3, qword ptr [r10 + 16]
	vbroadcastsd ymm0, xmm0
	lea r9d, [8*r9 + 24]
	and r9d, -32
	vmovdqa ymm4, ymmword ptr [rip + .LCPI29_0]
	xor r10d, r10d
	vpbroadcastq ymm5, qword ptr [rip + .LCPI29_1]
	vpxor ymm6, ymm6, ymm5
	vxorpd xmm8, xmm8, xmm8
	vpbroadcastq ymm9, qword ptr [rip + .LCPI29_2]
	.p2align	4
.LBB29_7:
	vpxor ymm10, ymm4, ymm5
	vpcmpgtq ymm10, ymm10, ymm6
	vpcmpeqd ymm7, ymm7, ymm7
	vpxor ymm10, ymm10, ymm7
	vmaskmovpd ymm11, ymm10, ymmword ptr [rax + r10]
	vmaskmovpd ymm12, ymm10, ymmword ptr [rdx + r10]
	vsubpd ymm11, ymm11, ymm1
	vmaskmovpd ymm13, ymm10, ymmword ptr [rdi + r10]
	vsubpd ymm12, ymm12, ymm2
	vmaskmovpd ymm14, ymm10, ymmword ptr [rcx + r10]
	vmulpd ymm13, ymm13, ymm3
	vmulpd ymm15, ymm11, ymm11
	vmulpd ymm7, ymm12, ymm12
	vaddpd ymm7, ymm15, ymm7
	vaddpd ymm7, ymm0, ymm7
	vsqrtpd ymm15, ymm7
	vmulpd ymm15, ymm15, ymm7
	vdivpd ymm13, ymm13, ymm15
	vcmpneqpd ymm7, ymm8, ymm7
	vandpd ymm7, ymm13, ymm7
	vmulpd ymm11, ymm11, ymm7
	vmulpd ymm13, ymm14, ymm11
	vmaskmovpd ymm15, ymm10, ymmword ptr [r8 + r10]
	vsubpd ymm13, ymm15, ymm13
	vmaskmovpd ymmword ptr [r8 + r10], ymm10, ymm13
	vmulpd ymm7, ymm12, ymm7
	vmulpd ymm12, ymm14, ymm7
	vmaskmovpd ymm13, ymm10, ymmword ptr [rsi + r10]
	vsubpd ymm12, ymm13, ymm12
	vmaskmovpd ymmword ptr [rsi + r10], ymm10, ymm12
	vmaskmovpd ymm12, ymm10, ymmword ptr [rsp + r10 - 96]
	vaddpd ymm11, ymm12, ymm11
	vmaskmovpd ymmword ptr [rsp + r10 - 96], ymm10, ymm11
	vmaskmovpd ymm11, ymm10, ymmword ptr [rsp + r10 - 32]
	vaddpd ymm7, ymm11, ymm7
	vmaskmovpd ymmword ptr [rsp + r10 - 32], ymm10, ymm7
	vpaddq ymm4, ymm9, ymm4
	add r10, 32
	cmp r9, r10
	jne .LBB29_7
.LBB29_8:
	vmovups ymm0, ymmword ptr [rsp - 96]
	vmovups ymm1, ymmword ptr [rsp - 64]
	mov rax, qword ptr [rsp - 104]
	vmovups ymmword ptr [rax + 32], ymm1
	vmovups ymmword ptr [rax], ymm0
	vmovups ymm0, ymmword ptr [rsp - 32]
	vmovups ymm1, ymmword ptr [rsp]
	vmovups ymmword ptr [rax + 64], ymm0
	vmovups ymmword ptr [rax + 96], ymm1
	add rsp, 232
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
