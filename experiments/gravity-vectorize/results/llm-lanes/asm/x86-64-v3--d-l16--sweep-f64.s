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
	sub rsp, 680
	.cfi_def_cfa_offset 736
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov r10, rsi
	mov rsi, qword ptr [rsp + 760]
	mov rcx, qword ptr [rsp + 744]
	mov r15d, r9d
	and r15d, 15
	mov qword ptr [rsp - 96], r9
	mov rax, r9
	shr rax, 4
	mov r12d, ecx
	and r12d, 15
	shr rcx, 4
	mov r13d, esi
	and r13d, 15
	shr rsi, 4
	mov qword ptr [rsp - 120], r14
	shr r14, 4
	cmp rax, r14
	cmovb r14, rax
	mov r9, qword ptr [rsp + 792]
	cmp rcx, r14
	cmovb r14, rcx
	mov rbx, qword ptr [rsp + 776]
	cmp rsi, r14
	cmovb r14, rsi
	mov rax, rbx
	shr rax, 4
	mov r11, r9
	shr r11, 4
	cmp r11, rax
	cmovae r11, rax
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 784]
	vxorpd xmm9, xmm9, xmm9
	vmovupd ymmword ptr [rsp + 128], ymm9
	vmovupd ymmword ptr [rsp + 104], ymm9
	vmovupd ymmword ptr [rsp + 72], ymm9
	vmovupd ymmword ptr [rsp + 40], ymm9
	vmovupd ymmword ptr [rsp + 168], ymm9
	vmovupd ymmword ptr [rsp + 200], ymm9
	vmovupd ymmword ptr [rsp + 232], ymm9
	vmovupd ymmword ptr [rsp + 256], ymm9
	mov rbp, qword ptr [rsp + 768]
	mov rax, qword ptr [rsp + 752]
	mov rsi, qword ptr [rsp + 736]
	test r11, r11
	mov qword ptr [rsp - 88], r10
	je .LBB29_1
	vbroadcastf128 ymm1, xmmword ptr [r10]
	vbroadcastsd ymm2, xmm1
	vmovupd ymmword ptr [rsp + 416], ymm2
	vmovaps xmmword ptr [rsp - 80], xmm0
	vbroadcastsd ymm0, xmm0
	vmovups ymmword ptr [rsp + 384], ymm0
	vbroadcastsd ymm0, qword ptr [r10 + 16]
	vmovups ymmword ptr [rsp + 352], ymm0
	vpermpd ymm0, ymm1, 85
	vmovupd ymmword ptr [rsp + 320], ymm0
	vmovupd ymmword ptr [rsp + 448], ymm1
	vshufpd xmm0, xmm1, xmm1, 3
	vmovapd xmmword ptr [rsp - 64], xmm0
	shl r11, 7
	xor ecx, ecx
	vxorpd xmm11, xmm11, xmm11
	vpxor xmm7, xmm7, xmm7
	vxorpd xmm12, xmm12, xmm12
	vpxor xmm6, xmm6, xmm6
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm3, xmm3, xmm3
	vxorpd xmm4, xmm4, xmm4
	vxorpd xmm0, xmm0, xmm0
	.p2align	4
.LBB29_3:
	vmovdqa xmmword ptr [rsp - 112], xmm6
	vmovupd ymmword ptr [rsp + 512], ymm12
	vmovdqu ymmword ptr [rsp - 32], ymm7
	vmovupd ymmword ptr [rsp + 544], ymm11
	vmovapd xmmword ptr [rsp - 48], xmm4
	vmovupd ymmword ptr [rsp + 576], ymm3
	vmovupd ymmword ptr [rsp + 608], ymm2
	vmovupd ymmword ptr [rsp], ymm1
	vmovupd ymmword ptr [rsp + 640], ymm0
	vmovupd ymm0, ymmword ptr [rdx + rcx + 8]
	vmovupd ymm11, ymmword ptr [rsp + 416]
	vsubpd ymm0, ymm0, ymm11
	vmovupd ymm1, ymmword ptr [r8 + rcx + 8]
	vmovupd ymm8, ymmword ptr [rsp + 320]
	vsubpd ymm2, ymm1, ymm8
	vmovupd ymmword ptr [rsp + 480], ymm2
	vmulpd ymm1, ymm0, ymm0
	vmulpd ymm2, ymm2, ymm2
	vaddpd ymm1, ymm1, ymm2
	vmovupd ymm3, ymmword ptr [rsp + 352]
	vmulpd ymm2, ymm3, ymmword ptr [rsi + rcx + 8]
	vmovupd ymm15, ymmword ptr [rsp + 384]
	vaddpd ymm1, ymm15, ymm1
	vsqrtpd ymm4, ymm1
	vmulpd ymm4, ymm1, ymm4
	vdivpd ymm2, ymm2, ymm4
	vmovupd ymm5, ymmword ptr [r8 + rcx + 40]
	vmovupd ymm6, ymmword ptr [r8 + rcx + 72]
	vcmpneqpd ymm1, ymm9, ymm1
	vandpd ymm4, ymm1, ymm2
	vmovupd ymm1, ymmword ptr [rdx + rcx + 40]
	vsubpd ymm1, ymm1, ymm11
	vsubpd ymm10, ymm5, ymm8
	vmulpd ymm2, ymm1, ymm1
	vmulpd ymm5, ymm10, ymm10
	vaddpd ymm2, ymm2, ymm5
	vmulpd ymm5, ymm3, ymmword ptr [rsi + rcx + 40]
	vaddpd ymm2, ymm15, ymm2
	vsqrtpd ymm7, ymm2
	vmulpd ymm7, ymm2, ymm7
	vdivpd ymm5, ymm5, ymm7
	vmulpd ymm0, ymm0, ymm4
	vmovupd ymmword ptr [rsp + 288], ymm0
	vcmpneqpd ymm0, ymm9, ymm2
	vandpd ymm13, ymm0, ymm5
	vmulpd ymm7, ymm13, ymm1
	vmovupd ymm0, ymmword ptr [rdx + rcx + 72]
	vsubpd ymm0, ymm0, ymm11
	vsubpd ymm5, ymm6, ymm8
	vmulpd ymm1, ymm0, ymm0
	vmulpd ymm6, ymm5, ymm5
	vaddpd ymm1, ymm1, ymm6
	vmulpd ymm6, ymm3, ymmword ptr [rsi + rcx + 72]
	vaddpd ymm1, ymm15, ymm1
	vsqrtpd ymm8, ymm1
	vmulpd ymm8, ymm8, ymm1
	vdivpd ymm6, ymm6, ymm8
	vcmpneqpd ymm1, ymm9, ymm1
	vandpd ymm12, ymm1, ymm6
	vmulpd ymm2, ymm12, ymm0
	vmovupd xmm0, xmmword ptr [rdx + rcx + 104]
	vsubpd xmm0, xmm0, xmm11
	vmovupd xmm6, xmmword ptr [r8 + rcx + 104]
	vsubpd xmm11, xmm6, xmmword ptr [rsp - 64]
	vmulpd xmm6, xmm0, xmm0
	vmulpd xmm8, xmm11, xmm11
	vaddpd xmm6, xmm8, xmm6
	vmulpd xmm8, xmm3, xmmword ptr [rsi + rcx + 104]
	vaddpd xmm6, xmm15, xmm6
	vsqrtpd xmm9, xmm6
	vmulpd xmm9, xmm9, xmm6
	vdivpd xmm8, xmm8, xmm9
	vxorpd xmm1, xmm1, xmm1
	vcmpneqpd xmm6, xmm6, xmm1
	vmovsd xmm9, qword ptr [rdx + rcx]
	vmovhpd xmm9, xmm9, qword ptr [r8 + rcx]
	vandpd xmm8, xmm8, xmm6
	vmovsd xmm6, qword ptr [rdx + rcx + 120]
	vmovhpd xmm14, xmm6, qword ptr [r8 + rcx + 120]
	vmulpd xmm6, xmm8, xmm0
	vinsertf128 ymm0, ymm14, xmm9, 1
	vsubpd ymm0, ymm0, ymmword ptr [rsp + 448]
	vmulpd ymm9, ymm0, ymm0
	vextractf128 xmm14, ymm9, 1
	vhaddpd xmm9, xmm9, xmm14
	vmulpd ymm1, ymm4, ymmword ptr [rsp + 480]
	vmulpd ymm4, ymm10, ymm13
	vaddpd xmm9, xmm15, xmm9
	vmovsd xmm10, qword ptr [rsi + rcx + 120]
	vmovhpd xmm10, xmm10, qword ptr [rsi + rcx]
	vmulpd xmm10, xmm10, xmm3
	vmovupd ymm3, ymmword ptr [rsp + 576]
	vsqrtpd xmm13, xmm9
	vmulpd xmm13, xmm9, xmm13
	vdivpd xmm10, xmm10, xmm13
	vxorpd xmm13, xmm13, xmm13
	vcmpneqpd xmm9, xmm9, xmm13
	vandpd xmm9, xmm9, xmm10
	vpermpd ymm9, ymm9, 80
	vmulpd ymm10, ymm9, ymm0
	vmovupd ymm9, ymmword ptr [rbp + rcx]
	vmovupd ymm0, ymmword ptr [rax + rcx]
	vmovupd ymm14, ymmword ptr [rsp + 288]
	vperm2f128 ymm13, ymm10, ymm14, 33
	vshufpd ymm13, ymm13, ymm14, 4
	vmulpd ymm13, ymm13, ymm0
	vsubpd ymm9, ymm9, ymm13
	vmovupd ymmword ptr [rbp + rcx], ymm9
	vmovupd ymm13, ymmword ptr [rax + rcx + 32]
	vperm2f128 ymm9, ymm14, ymm7, 33
	vshufpd ymm9, ymm9, ymm7, 5
	vmulpd ymm9, ymm9, ymm13
	vmovupd ymm14, ymmword ptr [rbp + rcx + 32]
	vsubpd ymm9, ymm14, ymm9
	vmovupd ymm14, ymmword ptr [rbp + rcx + 64]
	vmovupd ymm15, ymmword ptr [rbp + rcx + 96]
	vmovupd ymmword ptr [rbp + rcx + 32], ymm9
	vmulpd ymm5, ymm12, ymm5
	vmovupd ymm12, ymmword ptr [rax + rcx + 64]
	vperm2f128 ymm9, ymm7, ymm2, 33
	vshufpd ymm9, ymm9, ymm2, 5
	vmulpd ymm9, ymm9, ymm12
	vsubpd ymm9, ymm14, ymm9
	vmovupd ymmword ptr [rbp + rcx + 64], ymm9
	vmulpd xmm8, xmm11, xmm8
	vmovupd ymm11, ymmword ptr [rax + rcx + 96]
	vperm2f128 ymm9, ymm2, ymm6, 33
	vshufpd ymm9, ymm9, ymm6, 13
	vbroadcastsd ymm14, xmm10
	vblendpd ymm9, ymm9, ymm14, 8
	vmulpd ymm9, ymm9, ymm11
	vsubpd ymm9, ymm15, ymm9
	vmovupd ymmword ptr [rbp + rcx + 96], ymm9
	vperm2f128 ymm9, ymm10, ymm1, 33
	vshufpd ymm9, ymm9, ymm1, 5
	vmulpd ymm0, ymm9, ymm0
	vmovupd ymm9, ymmword ptr [r14 + rcx]
	vsubpd ymm0, ymm9, ymm0
	vmovupd ymm9, ymmword ptr [r14 + rcx + 32]
	vmovupd ymm14, ymmword ptr [r14 + rcx + 64]
	vmovupd ymm15, ymmword ptr [r14 + rcx + 96]
	vmovupd ymmword ptr [r14 + rcx], ymm0
	vperm2f128 ymm0, ymm1, ymm4, 33
	vshufpd ymm0, ymm0, ymm4, 5
	vmulpd ymm0, ymm13, ymm0
	vsubpd ymm0, ymm9, ymm0
	vmovupd ymmword ptr [r14 + rcx + 32], ymm0
	vperm2f128 ymm0, ymm4, ymm5, 33
	vshufpd ymm0, ymm0, ymm5, 5
	vmulpd ymm0, ymm12, ymm0
	vsubpd ymm0, ymm14, ymm0
	vmovupd ymmword ptr [r14 + rcx + 64], ymm0
	vperm2f128 ymm0, ymm5, ymm8, 33
	vmovddup xmm9, xmm8
	vinsertf128 ymm9, ymm9, xmm10, 1
	vunpckhpd ymm0, ymm0, ymm9
	vxorpd xmm9, xmm9, xmm9
	vmulpd ymm0, ymm11, ymm0
	vmovupd ymm11, ymmword ptr [rsp + 544]
	vsubpd ymm0, ymm15, ymm0
	vmovupd ymmword ptr [r14 + rcx + 96], ymm0
	vmovupd ymm0, ymmword ptr [rsp + 640]
	vaddpd ymm11, ymm11, ymmword ptr [rsp + 288]
	vmovupd ymm12, ymmword ptr [rsp - 32]
	vaddpd ymm12, ymm12, ymm7
	vmovupd ymmword ptr [rsp - 32], ymm12
	vmovupd ymm12, ymmword ptr [rsp + 512]
	vmovdqu ymm7, ymmword ptr [rsp - 32]
	vaddpd ymm12, ymm12, ymm2
	vmovapd xmm2, xmmword ptr [rsp - 112]
	vaddpd xmm2, xmm6, xmm2
	vmovapd xmmword ptr [rsp - 112], xmm2
	vmovdqa xmm6, xmmword ptr [rsp - 112]
	vmovupd ymm2, ymmword ptr [rsp]
	vaddpd ymm2, ymm1, ymm2
	vmovupd ymmword ptr [rsp], ymm2
	vmovupd ymm2, ymmword ptr [rsp + 608]
	vmovupd ymm1, ymmword ptr [rsp]
	vaddpd ymm2, ymm4, ymm2
	vmovapd xmm4, xmmword ptr [rsp - 48]
	vaddpd ymm3, ymm5, ymm3
	vaddpd xmm4, xmm8, xmm4
	vaddpd ymm0, ymm10, ymm0
	sub rcx, -128
	cmp r11, rcx
	jne .LBB29_3
	vmovupd ymmword ptr [rsp + 40], ymm11
	vmovdqu ymmword ptr [rsp + 72], ymm7
	vmovupd ymmword ptr [rsp + 104], ymm12
	vmovdqu xmmword ptr [rsp + 136], xmm6
	vmovlpd qword ptr [rsp + 152], xmm0
	vmovupd ymmword ptr [rsp + 168], ymm1
	vmovupd ymmword ptr [rsp + 200], ymm2
	vmovupd ymmword ptr [rsp + 232], ymm3
	vmovupd xmmword ptr [rsp + 264], xmm4
	vmovhpd qword ptr [rsp + 280], xmm0
	vextractf128 xmm1, ymm0, 1
	vshufpd xmm2, xmm1, xmm1, 1
	vmovapd xmm0, xmmword ptr [rsp - 80]
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
.LBB29_5:
	mov r10, qword ptr [rsp - 120]
	vmovsd qword ptr [rsp + 32], xmm1
	vmovsd qword ptr [rsp + 160], xmm2
	mov ecx, r10d
	and ecx, 15
	cmp r15, rcx
	cmovb rcx, r15
	cmp r12, rcx
	cmovb rcx, r12
	cmp r13, rcx
	cmovb rcx, r13
	mov r11d, ebx
	and r11d, 15
	mov r15d, r9d
	and r15d, 15
	cmp r15, r11
	cmovb r11, r15
	cmp r11, rcx
	cmovae r11, rcx
	test r11, r11
	je .LBB29_8
	movabs rcx, 1152921504606846960
	and r10, rcx
	mov r15, r10
	mov r10, qword ptr [rsp - 96]
	and r10, rcx
	mov r13, qword ptr [rsp + 744]
	and r13, rcx
	mov r12, qword ptr [rsp + 760]
	and r12, rcx
	movabs rcx, 576460752303423472
	and rbx, rcx
	and r9, rcx
	lea rcx, [rdx + 8*r15]
	lea rdx, [r8 + 8*r10]
	lea rsi, [rsi + 8*r13]
	lea rax, [rax + 8*r12]
	lea r8, [rbp + 8*rbx]
	lea r9, [r14 + 8*r9]
	lea r10, [r11 - 1]
	vmovq xmm1, r10
	vpbroadcastq ymm6, xmm1
	mov r10, qword ptr [rsp - 88]
	vbroadcastsd ymm8, qword ptr [r10]
	vbroadcastsd ymm1, qword ptr [r10 + 8]
	vbroadcastsd ymm2, qword ptr [r10 + 16]
	vbroadcastsd ymm3, xmm0
	lea r10d, [8*r11 + 24]
	and r10d, -32
	vmovdqa ymm4, ymmword ptr [rip + .LCPI29_0]
	xor r11d, r11d
	vpbroadcastq ymm5, qword ptr [rip + .LCPI29_1]
	vpxor ymm6, ymm6, ymm5
	vxorpd xmm0, xmm0, xmm0
	vpbroadcastq ymm9, qword ptr [rip + .LCPI29_2]
	.p2align	4
.LBB29_7:
	vpxor ymm10, ymm4, ymm5
	vpcmpgtq ymm10, ymm10, ymm6
	vpcmpeqd ymm7, ymm7, ymm7
	vpxor ymm10, ymm10, ymm7
	vmaskmovpd ymm11, ymm10, ymmword ptr [rcx + r11]
	vmaskmovpd ymm12, ymm10, ymmword ptr [rdx + r11]
	vsubpd ymm11, ymm11, ymm8
	vmaskmovpd ymm13, ymm10, ymmword ptr [rsi + r11]
	vsubpd ymm12, ymm12, ymm1
	vmaskmovpd ymm14, ymm10, ymmword ptr [rax + r11]
	vmulpd ymm13, ymm13, ymm2
	vmulpd ymm15, ymm11, ymm11
	vmulpd ymm7, ymm12, ymm12
	vaddpd ymm7, ymm15, ymm7
	vaddpd ymm7, ymm3, ymm7
	vsqrtpd ymm15, ymm7
	vmulpd ymm15, ymm15, ymm7
	vdivpd ymm13, ymm13, ymm15
	vcmpneqpd ymm7, ymm7, ymm0
	vandpd ymm7, ymm13, ymm7
	vmulpd ymm11, ymm11, ymm7
	vmulpd ymm13, ymm14, ymm11
	vmaskmovpd ymm15, ymm10, ymmword ptr [r8 + r11]
	vsubpd ymm13, ymm15, ymm13
	vmaskmovpd ymmword ptr [r8 + r11], ymm10, ymm13
	vmulpd ymm7, ymm12, ymm7
	vmulpd ymm12, ymm14, ymm7
	vmaskmovpd ymm13, ymm10, ymmword ptr [r9 + r11]
	vsubpd ymm12, ymm13, ymm12
	vmaskmovpd ymmword ptr [r9 + r11], ymm10, ymm12
	vmaskmovpd ymm12, ymm10, ymmword ptr [rsp + r11 + 32]
	vaddpd ymm11, ymm12, ymm11
	vmaskmovpd ymmword ptr [rsp + r11 + 32], ymm10, ymm11
	vmaskmovpd ymm11, ymm10, ymmword ptr [rsp + r11 + 160]
	vaddpd ymm7, ymm11, ymm7
	vmaskmovpd ymmword ptr [rsp + r11 + 160], ymm10, ymm7
	vpaddq ymm4, ymm9, ymm4
	add r11, 32
	cmp r10, r11
	jne .LBB29_7
.LBB29_8:
	vmovups ymm0, ymmword ptr [rsp + 32]
	vmovups ymm1, ymmword ptr [rsp + 64]
	vmovups ymm2, ymmword ptr [rsp + 96]
	vmovups ymm3, ymmword ptr [rsp + 128]
	vmovups ymmword ptr [rdi + 96], ymm3
	vmovups ymmword ptr [rdi + 64], ymm2
	vmovups ymmword ptr [rdi + 32], ymm1
	vmovups ymmword ptr [rdi], ymm0
	vmovups ymm0, ymmword ptr [rsp + 160]
	vmovups ymm1, ymmword ptr [rsp + 192]
	vmovups ymm2, ymmword ptr [rsp + 224]
	vmovups ymm3, ymmword ptr [rsp + 256]
	vmovups ymmword ptr [rdi + 128], ymm0
	vmovups ymmword ptr [rdi + 160], ymm1
	vmovups ymmword ptr [rdi + 192], ymm2
	vmovups ymmword ptr [rdi + 224], ymm3
	add rsp, 680
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
