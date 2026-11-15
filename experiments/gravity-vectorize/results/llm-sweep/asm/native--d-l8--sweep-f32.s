engine::force::sweep::<f32>:
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
	mov r11, qword ptr [rsp + 80]
	mov r10, qword ptr [rsp + 64]
	mov r14, rcx
	mov rcx, r9
	mov qword ptr [rsp - 16], r14
	shr rcx, 3
	shr r14, 3
	mov r15d, r9d
	mov qword ptr [rsp - 8], rdi
	mov qword ptr [rsp - 32], r9
	and r15d, 7
	mov rbx, qword ptr [rsp + 96]
	mov r12, qword ptr [rsp + 88]
	mov rbp, qword ptr [rsp + 72]
	vxorps xmm1, xmm1, xmm1
	vmovups xmmword ptr [rsp - 80], xmm1
	vmovups xmmword ptr [rsp - 60], xmm1
	vmovups xmmword ptr [rsp - 92], xmm1
	vmovups xmmword ptr [rsp - 48], xmm1
	mov qword ptr [rsp - 24], rsi
	mov r13d, r10d
	mov eax, r11d
	mov r9, r11
	mov rdi, r10
	and r13d, 7
	shr rdi, 3
	and eax, 7
	shr r9, 3
	cmp rcx, r14
	mov r11, qword ptr [rsp + 112]
	cmovb r14, rcx
	cmp rdi, r14
	cmovb r14, rdi
	mov rdi, rbx
	cmp r9, r14
	cmovb r14, r9
	shr rdi, 3
	shr r11, 3
	cmp r11, rdi
	cmovae r11, rdi
	mov rdi, qword ptr [rsp + 56]
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 104]
	test r11, r11
	je .LBB30_1
	vmovsd xmm7, qword ptr [rsi]
	vbroadcastss xmm3, dword ptr [rsi + 8]
	vpmovsxbd xmm21, dword ptr [rip + .LCPI30_6]
	vpmovsxbd xmm10, dword ptr [rip + .LCPI30_7]
	vbroadcasti128 ymm11, xmmword ptr [rip + .LCPI30_2]
	vpmovsxbd xmm26, dword ptr [rip + .LCPI30_8]
	vmovaps ymm27, ymmword ptr [rip + .LCPI30_4]
	mov cl, -127
	vbroadcastss xmm4, xmm0
	shl r11, 5
	xor r9d, r9d
	vxorps xmm16, xmm16, xmm16
	vxorps xmm17, xmm17, xmm17
	vxorps xmm13, xmm13, xmm13
	vxorps xmm14, xmm14, xmm14
	vxorps xmm9, xmm9, xmm9
	kmovd k1, ecx
	vbroadcastss xmm6, xmm7
	vshufps xmm2, xmm7, xmm7, 65
	vshufps xmm5, xmm7, xmm7, 85
	vmovshdup xmm7, xmm7
	.p2align	4
.LBB30_3:
	vmovups xmm8, xmmword ptr [rdx + r9 + 4]
	vmovups xmm18, xmmword ptr [r8 + r9 + 4]
	vsubps xmm19, xmm18, xmm5
	vsubps xmm8, xmm8, xmm6
	vmulps xmm18, xmm8, xmm8
	vmulps xmm20, xmm19, xmm19
	vaddps xmm18, xmm18, xmm20
	vmulps xmm20, xmm3, xmmword ptr [rdi + r9 + 4]
	vaddps xmm18, xmm4, xmm18
	vsqrtps xmm22, xmm18
	vcmpneqps k2, xmm18, xmm1
	vmulps xmm22, xmm18, xmm22
	vmovsd xmm18, qword ptr [r8 + r9 + 20]
	vdivps xmm22 {k2} {z}, xmm20, xmm22
	vsubps xmm23, xmm18, xmm7
	vmulps xmm24, xmm23, xmm23
	vmulps xmm20, xmm8, xmm22
	vmovsd xmm8, qword ptr [rdx + r9 + 20]
	vaddps xmm16, xmm20, xmm16
	vsubps xmm8, xmm8, xmm6
	vmulps xmm18, xmm8, xmm8
	vaddps xmm18, xmm18, xmm24
	vmovsd xmm24, qword ptr [rdi + r9 + 20]
	vaddps xmm18, xmm4, xmm18
	vsqrtps xmm25, xmm18
	vcmpneqps k2, xmm18, xmm1
	vmulps xmm24, xmm24, xmm3
	vmulps xmm25, xmm18, xmm25
	vdivps xmm24 {k2} {z}, xmm24, xmm25
	vmulps xmm18, xmm8, xmm24
	vmulps xmm8, xmm19, xmm22
	vmovss xmm22, dword ptr [r8 + r9 + 28]
	vmulps xmm19, xmm23, xmm24
	vinsertps xmm22, xmm22, dword ptr [rdx + r9 + 28], 16
	vinsertps xmm22, xmm22, dword ptr [rdx + r9], 32
	vinsertps xmm22, xmm22, dword ptr [r8 + r9], 48
	vaddps xmm13, xmm8, xmm13
	vaddps xmm17, xmm18, xmm17
	vaddps xmm14, xmm19, xmm14
	vsubps xmm22, xmm22, xmm2
	vmulps xmm23, xmm22, xmm22
	vshufps xmm24, xmm23, xmm23, 230
	vshufps xmm23, xmm23, xmm23, 227
	vaddps xmm23, xmm24, xmm23
	vmovups ymm24 {k1} {z}, ymmword ptr [rdi + r9]
	vaddps xmm23, xmm4, xmm23
	vsqrtps xmm25, xmm23
	vcmpneqps k2, xmm23, xmm1
	vpermps ymm24, ymm21, ymm24
	vmulps xmm24, xmm24, xmm3
	vmulps xmm25, xmm23, xmm25
	vdivps xmm23 {k2} {z}, xmm24, xmm25
	vshufps xmm25, xmm20, xmm20, 144
	vpermt2ps xmm20, xmm10, xmm18
	vmovups ymm24, ymmword ptr [rbp + r9]
	vinsertf32x4 ymm12, ymm25, xmm20, 1
	vmovups ymm20, ymmword ptr [r14 + r9]
	vshufps xmm23, xmm23, xmm23, 5
	vmulps xmm22, xmm22, xmm23
	vmovups ymm23, ymmword ptr [r12 + r9]
	vpermpd ymm15, ymm22, 37
	vaddps xmm9, xmm22, xmm9
	vblendps ymm12, ymm12, ymm15, 129
	vmovaps xmm15, xmm8
	vpermt2ps xmm15, xmm10, xmm19
	vpermt2ps xmm8, xmm26, xmm24
	vmulps ymm12, ymm12, ymm24
	vpermt2ps ymm24, ymm27, ymm22
	vpermt2ps ymm15, ymm11, ymm22
	vsubps ymm12, ymm23, ymm12
	vblendps ymm8, ymm15, ymm8, 15
	vmovups ymmword ptr [r12 + r9], ymm12
	vmulps ymm8, ymm8, ymm24
	vsubps ymm8, ymm20, ymm8
	vmovups ymmword ptr [r14 + r9], ymm8
	add r9, 32
	cmp r11, r9
	jne .LBB30_3
	vshufpd xmm2, xmm9, xmm9, 1
	vshufps xmm1, xmm9, xmm9, 255
	vmovups xmmword ptr [rsp - 92], xmm16
	vmovlps qword ptr [rsp - 76], xmm17
	vmovups xmmword ptr [rsp - 60], xmm13
	vmovlps qword ptr [rsp - 44], xmm14
	vextractps dword ptr [rsp - 68], xmm9, 1
	vmovss dword ptr [rsp - 36], xmm9
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB30_5:
	mov r11, qword ptr [rsp - 16]
	vmovss dword ptr [rsp - 96], xmm2
	vmovss dword ptr [rsp - 64], xmm1
	mov ecx, r11d
	and ecx, 7
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	mov r13, qword ptr [rsp + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, ebx
	and eax, 7
	mov r9d, r13d
	and r9d, 7
	cmp r9, rax
	cmovb rax, r9
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB30_7
	dec rax
	mov rsi, qword ptr [rsp - 32]
	movabs rcx, 2305843009213693944
	vbroadcastss ymm0, xmm0
	mov r15, qword ptr [rsp + 80]
	vpbroadcastq zmm1, rax
	vpcmpnltuq k1, zmm1, zmmword ptr [rip + .LCPI30_5]
	mov rax, qword ptr [rsp - 24]
	and r11, rcx
	and r10, rcx
	lea r9, [rdx + 4*r11]
	lea rdi, [rdi + 4*r10]
	and rsi, rcx
	and r15, rcx
	movabs rcx, 1152921504606846968
	lea r8, [r8 + 4*rsi]
	lea r10, [rbp + 4*r15]
	and rbx, rcx
	and r13, rcx
	lea rdx, [r12 + 4*rbx]
	lea rcx, [r14 + 4*r13]
	vmovups ymm1 {k1} {z}, ymmword ptr [r9]
	vmovups ymm2 {k1} {z}, ymmword ptr [r8]
	vmovups ymm3 {k1} {z}, ymmword ptr [rdi]
	vmovups ymm4 {k1} {z}, ymmword ptr [r10]
	vsubps ymm1, ymm1, dword ptr [rax]{1to8}
	vsubps ymm2, ymm2, dword ptr [rax + 4]{1to8}
	vmulps ymm3, ymm3, dword ptr [rax + 8]{1to8}
	vmulps ymm5, ymm1, ymm1
	vmulps ymm6, ymm2, ymm2
	vaddps ymm5, ymm5, ymm6
	vxorps xmm6, xmm6, xmm6
	vaddps ymm0, ymm0, ymm5
	vsqrtps ymm5, ymm0
	vcmpneqps k2, ymm0, ymm6
	vmulps ymm5, ymm0, ymm5
	vdivps ymm0 {k2} {z}, ymm3, ymm5
	vmovups ymm5 {k1} {z}, ymmword ptr [rdx]
	vmulps ymm1, ymm1, ymm0
	vmulps ymm0, ymm2, ymm0
	vmulps ymm3, ymm4, ymm1
	vmulps ymm2, ymm4, ymm0
	vmovups ymm4 {k1} {z}, ymmword ptr [rcx]
	vaddps ymm1, ymm1, ymmword ptr [rsp - 96]
	vaddps ymm0, ymm0, ymmword ptr [rsp - 64]
	vsubps ymm3, ymm5, ymm3
	vmovups ymmword ptr [rdx] {k1}, ymm3
	vsubps ymm2, ymm4, ymm2
	vmovups ymmword ptr [rsp - 96] {k1}, ymm1
	vmovups ymmword ptr [rsp - 64] {k1}, ymm0
	vmovups ymmword ptr [rcx] {k1}, ymm2
.LBB30_7:
	vmovups ymm0, ymmword ptr [rsp - 96]
	vmovups ymm1, ymmword ptr [rsp - 64]
	mov rax, qword ptr [rsp - 8]
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
