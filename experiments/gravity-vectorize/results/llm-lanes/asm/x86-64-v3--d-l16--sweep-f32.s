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
	sub rsp, 376
	.cfi_def_cfa_offset 432
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov rcx, rsi
	mov qword ptr [rsp - 104], rdi
	mov r11, qword ptr [rsp + 456]
	mov r10, qword ptr [rsp + 440]
	mov r15d, r9d
	and r15d, 15
	mov qword ptr [rsp - 120], r9
	mov rsi, r9
	shr rsi, 4
	mov r13d, r10d
	and r13d, 15
	mov rdi, r10
	shr rdi, 4
	mov eax, r11d
	and eax, 15
	mov r9, r11
	shr r9, 4
	mov qword ptr [rsp - 128], r14
	shr r14, 4
	cmp rsi, r14
	cmovb r14, rsi
	mov rsi, qword ptr [rsp + 488]
	cmp rdi, r14
	cmovb r14, rdi
	mov rbx, qword ptr [rsp + 472]
	cmp r9, r14
	cmovb r14, r9
	mov rdi, rbx
	shr rdi, 4
	mov r11, rsi
	shr r11, 4
	cmp r11, rdi
	cmovae r11, rdi
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 480]
	vxorps xmm4, xmm4, xmm4
	vmovups ymmword ptr [rsp - 64], ymm4
	vmovups ymmword ptr [rsp - 92], ymm4
	vmovups ymmword ptr [rsp - 28], ymm4
	vmovups ymmword ptr [rsp], ymm4
	mov r12, qword ptr [rsp + 464]
	mov rbp, qword ptr [rsp + 448]
	mov rdi, qword ptr [rsp + 432]
	test r11, r11
	mov qword ptr [rsp - 112], rcx
	je .LBB30_1
	vmovsd xmm1, qword ptr [rcx]
	vshufps xmm2, xmm1, xmm1, 65
	vmovaps xmmword ptr [rsp + 80], xmm2
	vmovaps xmmword ptr [rsp + 32], xmm0
	vbroadcastss ymm0, xmm0
	vmovups ymmword ptr [rsp + 304], ymm0
	vbroadcastss ymm0, dword ptr [rcx + 8]
	vmovups ymmword ptr [rsp + 272], ymm0
	vshufps xmm0, xmm1, xmm1, 85
	vmovaps xmmword ptr [rsp + 64], xmm0
	vbroadcastss ymm0, xmm1
	vmovups ymmword ptr [rsp + 240], ymm0
	vmovshdup xmm0, xmm1
	vmovaps xmmword ptr [rsp + 48], xmm0
	vbroadcastss ymm0, xmm0
	vmovups ymmword ptr [rsp + 208], ymm0
	shl r11, 6
	xor r9d, r9d
	vbroadcastf128 ymm0, xmmword ptr [rip + .LCPI30_0]
	vmovups ymmword ptr [rsp + 176], ymm0
	vxorps xmm1, xmm1, xmm1
	vxorps xmm0, xmm0, xmm0
	vxorps xmm2, xmm2, xmm2
	vxorps xmm5, xmm5, xmm5
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
	vxorps xmm3, xmm3, xmm3
	.p2align	4
.LBB30_3:
	vmovaps xmmword ptr [rsp + 112], xmm0
	vmovaps xmmword ptr [rsp + 128], xmm8
	vmovaps xmmword ptr [rsp + 144], xmm7
	vmovups ymmword ptr [rsp + 336], ymm5
	vmovaps xmmword ptr [rsp + 160], xmm3
	vmovups ymm3, ymmword ptr [rdx + r9 + 4]
	vmovups ymm10, ymmword ptr [rsp + 240]
	vsubps ymm3, ymm3, ymm10
	vmovups ymm5, ymmword ptr [r8 + r9 + 4]
	vsubps ymm6, ymm5, ymmword ptr [rsp + 208]
	vmulps ymm5, ymm3, ymm3
	vmulps ymm7, ymm6, ymm6
	vaddps ymm5, ymm5, ymm7
	vmovups ymm14, ymmword ptr [rsp + 304]
	vaddps ymm5, ymm14, ymm5
	vmovups ymm15, ymmword ptr [rsp + 272]
	vmulps ymm7, ymm15, ymmword ptr [rdi + r9 + 4]
	vsqrtps ymm8, ymm5
	vmulps ymm8, ymm8, ymm5
	vdivps ymm7, ymm7, ymm8
	vcmpneqps ymm5, ymm5, ymm4
	vandps ymm12, ymm5, ymm7
	vmulps ymm5, ymm12, ymm3
	vmovups xmm3, xmmword ptr [rdx + r9 + 36]
	vsubps xmm3, xmm3, xmm10
	vmovups xmm7, xmmword ptr [r8 + r9 + 36]
	vsubps xmm9, xmm7, xmmword ptr [rsp + 64]
	vmulps xmm7, xmm3, xmm3
	vmulps xmm8, xmm9, xmm9
	vaddps xmm7, xmm8, xmm7
	vaddps xmm7, xmm14, xmm7
	vmulps xmm8, xmm15, xmmword ptr [rdi + r9 + 36]
	vsqrtps xmm11, xmm7
	vmulps xmm11, xmm11, xmm7
	vdivps xmm8, xmm8, xmm11
	vxorps xmm0, xmm0, xmm0
	vcmpneqps xmm7, xmm7, xmm0
	vandps xmm4, xmm8, xmm7
	vmulps xmm8, xmm3, xmm4
	vmovsd xmm3, qword ptr [rdx + r9 + 52]
	vsubps xmm7, xmm3, xmm10
	vmovsd xmm3, qword ptr [r8 + r9 + 52]
	vsubps xmm11, xmm3, xmmword ptr [rsp + 48]
	vmulps xmm3, xmm7, xmm7
	vmulps xmm10, xmm11, xmm11
	vaddps xmm3, xmm10, xmm3
	vaddps xmm3, xmm14, xmm3
	vmovsd xmm10, qword ptr [rdi + r9 + 52]
	vmulps xmm10, xmm10, xmm15
	vsqrtps xmm13, xmm3
	vmulps xmm13, xmm13, xmm3
	vdivps xmm10, xmm10, xmm13
	vcmpneqps xmm3, xmm3, xmm0
	vandps xmm3, xmm10, xmm3
	vmulps xmm0, xmm7, xmm3
	vmovaps xmmword ptr [rsp + 96], xmm0
	vmulps ymm12, ymm12, ymm6
	vmovss xmm6, dword ptr [r8 + r9 + 60]
	vinsertps xmm6, xmm6, dword ptr [rdx + r9 + 60], 16
	vinsertps xmm6, xmm6, dword ptr [rdx + r9], 32
	vmulps xmm9, xmm9, xmm4
	vinsertps xmm4, xmm6, dword ptr [r8 + r9], 48
	vsubps xmm4, xmm4, xmmword ptr [rsp + 80]
	vmulps xmm6, xmm4, xmm4
	vhaddps xmm6, xmm6, xmm6
	vaddps xmm6, xmm14, xmm6
	vmovss xmm10, dword ptr [rdi + r9 + 60]
	vinsertps xmm10, xmm10, dword ptr [rdi + r9], 16
	vmulps xmm10, xmm10, xmm15
	vsqrtps xmm13, xmm6
	vmulps xmm13, xmm13, xmm6
	vdivps xmm10, xmm10, xmm13
	vxorps xmm7, xmm7, xmm7
	vcmpneqps xmm6, xmm6, xmm7
	vandps xmm6, xmm10, xmm6
	vshufps xmm6, xmm6, xmm6, 80
	vmulps xmm6, xmm4, xmm6
	vmovups ymm4, ymmword ptr [r12 + r9]
	vmovups ymm10, ymmword ptr [rbp + r9]
	vshufpd xmm13, xmm6, xmm5, 1
	vshufps xmm13, xmm13, xmm5, 152
	vmovups ymm14, ymmword ptr [rsp + 176]
	vpermps ymm7, ymm14, ymm5
	vblendps ymm7, ymm13, ymm7, 240
	vmulps ymm7, ymm10, ymm7
	vsubps ymm4, ymm4, ymm7
	vmovups ymmword ptr [r12 + r9], ymm4
	vmovups ymm4, ymmword ptr [r12 + r9 + 32]
	vblendps xmm7, xmm8, xmm0, 3
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vshufps xmm7, xmm7, xmm7, 211
	vinsertf128 ymm7, ymm0, xmm7, 1
	vbroadcastsd ymm13, xmm6
	vblendps ymm7, ymm7, ymm13, 128
	vblendps ymm13, ymm8, ymm5, 240
	vmovaps xmm15, xmmword ptr [rip + .LCPI30_1]
	vpermps ymm13, ymm15, ymm13
	vblendps ymm7, ymm13, ymm7, 240
	vmovups ymm13, ymmword ptr [rbp + r9 + 32]
	vmulps ymm7, ymm13, ymm7
	vsubps ymm4, ymm4, ymm7
	vmovups ymmword ptr [r12 + r9 + 32], ymm4
	vmulps xmm3, xmm11, xmm3
	vshufps xmm4, xmm6, xmm12, 199
	vshufps xmm4, xmm4, xmm12, 152
	vpermps ymm7, ymm14, ymm12
	vblendps ymm4, ymm4, ymm7, 240
	vmulps ymm4, ymm10, ymm4
	vmovups ymm7, ymmword ptr [r14 + r9]
	vsubps ymm4, ymm7, ymm4
	vmovups ymm7, ymmword ptr [r14 + r9 + 32]
	vmovups ymmword ptr [r14 + r9], ymm4
	vblendps xmm4, xmm9, xmm3, 3
	vshufps xmm4, xmm4, xmm4, 211
	vinsertf128 ymm4, ymm0, xmm4, 1
	vbroadcastss ymm10, xmm6
	vblendps ymm4, ymm4, ymm10, 128
	vblendps ymm10, ymm9, ymm12, 240
	vpermps ymm10, ymm15, ymm10
	vblendps ymm4, ymm10, ymm4, 240
	vmulps ymm4, ymm13, ymm4
	vsubps ymm4, ymm7, ymm4
	vmovaps xmm7, xmmword ptr [rsp + 144]
	vmovups ymmword ptr [r14 + r9 + 32], ymm4
	vxorps xmm4, xmm4, xmm4
	vaddps ymm1, ymm5, ymm1
	vmovups ymm5, ymmword ptr [rsp + 336]
	vaddps xmm0, xmm8, xmm0
	vmovaps xmm8, xmmword ptr [rsp + 128]
	vaddps xmm2, xmm2, xmmword ptr [rsp + 96]
	vaddps ymm5, ymm12, ymm5
	vaddps xmm7, xmm9, xmm7
	vaddps xmm8, xmm8, xmm3
	vmovaps xmm3, xmmword ptr [rsp + 160]
	vaddps xmm3, xmm6, xmm3
	add r9, 64
	cmp r11, r9
	jne .LBB30_3
	vmovups ymmword ptr [rsp - 92], ymm1
	vmovups xmmword ptr [rsp - 60], xmm0
	vmovlps qword ptr [rsp - 44], xmm2
	vextractps dword ptr [rsp - 36], xmm3, 1
	vmovups ymmword ptr [rsp - 28], ymm5
	vmovups xmmword ptr [rsp + 4], xmm7
	vmovlps qword ptr [rsp + 20], xmm8
	vmovss dword ptr [rsp + 28], xmm3
	vshufpd xmm1, xmm3, xmm3, 1
	vshufps xmm2, xmm3, xmm3, 255
	vmovaps xmm0, xmmword ptr [rsp + 32]
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
.LBB30_5:
	mov rcx, qword ptr [rsp - 128]
	vmovss dword ptr [rsp - 96], xmm1
	vmovss dword ptr [rsp - 32], xmm2
	mov r11d, ecx
	and r11d, 15
	cmp r15, r11
	cmovb r11, r15
	cmp r13, r11
	cmovb r11, r13
	cmp rax, r11
	cmovb r11, rax
	mov r9d, ebx
	and r9d, 15
	mov eax, esi
	and eax, 15
	cmp rax, r9
	cmovb r9, rax
	cmp r9, r11
	cmovae r9, r11
	test r9, r9
	je .LBB30_8
	movabs rax, 2305843009213693936
	and rcx, rax
	mov r11, rcx
	mov rcx, qword ptr [rsp - 120]
	and rcx, rax
	and r10, rax
	mov r15, qword ptr [rsp + 456]
	and r15, rax
	movabs rax, 1152921504606846960
	and rbx, rax
	and rsi, rax
	lea rax, [rdx + 4*r11]
	lea rdx, [r8 + 4*rcx]
	lea rdi, [rdi + 4*r10]
	lea rcx, [4*r15]
	add rcx, rbp
	lea r8, [r12 + 4*rbx]
	lea rsi, [r14 + 4*rsi]
	lea r10, [r9 - 1]
	vmovq xmm1, r10
	vpbroadcastq ymm7, xmm1
	mov r10, qword ptr [rsp - 112]
	vbroadcastss ymm4, dword ptr [r10]
	vbroadcastss ymm1, dword ptr [r10 + 4]
	vbroadcastss ymm2, dword ptr [r10 + 8]
	vbroadcastss ymm3, xmm0
	vmovaps ymm0, ymm4
	lea r9d, [4*r9 + 28]
	and r9d, -32
	vmovdqa ymm4, ymmword ptr [rip + .LCPI30_2]
	vmovdqa ymm5, ymmword ptr [rip + .LCPI30_3]
	xor r10d, r10d
	vpbroadcastq ymm6, qword ptr [rip + .LCPI30_4]
	vpxor ymm7, ymm7, ymm6
	vpbroadcastq ymm10, qword ptr [rip + .LCPI30_5]
	.p2align	4
.LBB30_7:
	vpxor ymm11, ymm5, ymm6
	vpcmpgtq ymm11, ymm11, ymm7
	vpxor ymm12, ymm4, ymm6
	vpcmpgtq ymm12, ymm12, ymm7
	vpackssdw ymm11, ymm11, ymm12
	vpcmpeqd ymm8, ymm8, ymm8
	vpxor ymm11, ymm11, ymm8
	vextracti128 xmm12, ymm11, 1
	vpackssdw xmm11, xmm11, xmm12
	vpshufd xmm11, xmm11, 216
	vpmovzxwd ymm11, xmm11
	vpslld ymm11, ymm11, 31
	vmaskmovps ymm12, ymm11, ymmword ptr [rax + r10]
	vmaskmovps ymm13, ymm11, ymmword ptr [rdx + r10]
	vsubps ymm12, ymm12, ymm0
	vmaskmovps ymm14, ymm11, ymmword ptr [rdi + r10]
	vsubps ymm13, ymm13, ymm1
	vmaskmovps ymm15, ymm11, ymmword ptr [rcx + r10]
	vmulps ymm14, ymm14, ymm2
	vmulps ymm8, ymm12, ymm12
	vmulps ymm9, ymm13, ymm13
	vaddps ymm8, ymm8, ymm9
	vaddps ymm8, ymm8, ymm3
	vsqrtps ymm9, ymm8
	vmulps ymm9, ymm8, ymm9
	vdivps ymm9, ymm14, ymm9
	vxorps xmm14, xmm14, xmm14
	vcmpneqps ymm8, ymm8, ymm14
	vandps ymm8, ymm8, ymm9
	vmulps ymm9, ymm12, ymm8
	vmulps ymm12, ymm15, ymm9
	vmaskmovps ymm14, ymm11, ymmword ptr [r8 + r10]
	vsubps ymm12, ymm14, ymm12
	vmaskmovps ymmword ptr [r8 + r10], ymm11, ymm12
	vmulps ymm8, ymm13, ymm8
	vmulps ymm12, ymm15, ymm8
	vmaskmovps ymm13, ymm11, ymmword ptr [rsi + r10]
	vsubps ymm12, ymm13, ymm12
	vmaskmovps ymmword ptr [rsi + r10], ymm11, ymm12
	vmaskmovps ymm12, ymm11, ymmword ptr [rsp + r10 - 96]
	vaddps ymm9, ymm12, ymm9
	vmaskmovps ymmword ptr [rsp + r10 - 96], ymm11, ymm9
	vmaskmovps ymm9, ymm11, ymmword ptr [rsp + r10 - 32]
	vaddps ymm8, ymm9, ymm8
	vmaskmovps ymmword ptr [rsp + r10 - 32], ymm11, ymm8
	vpaddq ymm5, ymm10, ymm5
	vpaddq ymm4, ymm10, ymm4
	add r10, 32
	cmp r9, r10
	jne .LBB30_7
.LBB30_8:
	vmovups ymm0, ymmword ptr [rsp - 96]
	vmovups ymm1, ymmword ptr [rsp - 64]
	mov rax, qword ptr [rsp - 104]
	vmovups ymmword ptr [rax + 32], ymm1
	vmovups ymmword ptr [rax], ymm0
	vmovups ymm0, ymmword ptr [rsp - 32]
	vmovups ymm1, ymmword ptr [rsp]
	vmovups ymmword ptr [rax + 64], ymm0
	vmovups ymmword ptr [rax + 96], ymm1
	add rsp, 376
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
