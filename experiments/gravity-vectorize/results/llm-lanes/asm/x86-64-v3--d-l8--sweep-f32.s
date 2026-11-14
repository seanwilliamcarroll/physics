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
	sub rsp, 72
	.cfi_def_cfa_offset 128
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	vmovaps xmm8, xmm0
	mov rbx, rsi
	mov qword ptr [rsp - 40], rdi
	mov rdi, qword ptr [rsp + 152]
	mov r14, qword ptr [rsp + 136]
	mov r13d, r9d
	and r13d, 7
	mov qword ptr [rsp - 56], r9
	mov rax, r9
	shr rax, 3
	mov ebp, r14d
	and ebp, 7
	mov rsi, r14
	shr rsi, 3
	mov r10d, edi
	and r10d, 7
	shr rdi, 3
	mov r11, rcx
	shr r11, 3
	cmp rax, r11
	cmovb r11, rax
	mov r15, qword ptr [rsp + 184]
	cmp rsi, r11
	cmovb r11, rsi
	mov r9, qword ptr [rsp + 168]
	cmp rdi, r11
	cmovb r11, rdi
	mov rax, r9
	shr rax, 3
	mov rsi, r15
	shr rsi, 3
	cmp rsi, rax
	cmovae rsi, rax
	cmp rsi, r11
	cmovae rsi, r11
	mov r11, qword ptr [rsp + 176]
	vxorps xmm0, xmm0, xmm0
	vmovups xmmword ptr [rsp - 104], xmm0
	vmovups xmmword ptr [rsp - 116], xmm0
	vmovups xmmword ptr [rsp - 84], xmm0
	vmovups xmmword ptr [rsp - 72], xmm0
	mov r15, qword ptr [rsp + 160]
	mov r12, qword ptr [rsp + 144]
	mov rdi, qword ptr [rsp + 128]
	test rsi, rsi
	mov qword ptr [rsp - 48], rbx
	je .LBB30_1
	vmovsd xmm0, qword ptr [rbx]
	vshufps xmm1, xmm0, xmm0, 65
	vmovaps xmmword ptr [rsp + 48], xmm1
	vmovaps xmmword ptr [rsp - 32], xmm8
	vbroadcastss xmm1, xmm8
	vmovaps xmmword ptr [rsp + 32], xmm1
	vshufps xmm1, xmm0, xmm0, 85
	vmovaps xmmword ptr [rsp + 16], xmm1
	vbroadcastss xmm5, dword ptr [rbx + 8]
	vbroadcastss xmm1, xmm0
	vmovaps xmmword ptr [rsp], xmm1
	vmovshdup xmm0, xmm0
	vmovaps xmmword ptr [rsp - 16], xmm0
	shl rsi, 5
	xor eax, eax
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm8, xmm8, xmm8
	vxorps xmm3, xmm3, xmm3
	.p2align	4
.LBB30_3:
	vmovups xmm0, xmmword ptr [rdx + rax + 4]
	vmovaps xmm1, xmmword ptr [rsp]
	vsubps xmm2, xmm0, xmm1
	vmovups xmm0, xmmword ptr [r8 + rax + 4]
	vsubps xmm0, xmm0, xmmword ptr [rsp + 16]
	vmulps xmm4, xmm2, xmm2
	vmulps xmm13, xmm0, xmm0
	vaddps xmm4, xmm13, xmm4
	vmulps xmm13, xmm5, xmmword ptr [rdi + rax + 4]
	vmovaps xmm6, xmmword ptr [rsp + 32]
	vaddps xmm4, xmm6, xmm4
	vsqrtps xmm14, xmm4
	vmulps xmm14, xmm14, xmm4
	vdivps xmm13, xmm13, xmm14
	vcmpneqps xmm4, xmm4, xmm3
	vandps xmm15, xmm13, xmm4
	vmulps xmm13, xmm15, xmm2
	vmovsd xmm2, qword ptr [rdx + rax + 20]
	vsubps xmm14, xmm2, xmm1
	vmovsd xmm2, qword ptr [r8 + rax + 20]
	vsubps xmm2, xmm2, xmmword ptr [rsp - 16]
	vmulps xmm4, xmm14, xmm14
	vmulps xmm7, xmm2, xmm2
	vaddps xmm4, xmm4, xmm7
	vaddps xmm4, xmm6, xmm4
	vmovsd xmm7, qword ptr [rdi + rax + 20]
	vmulps xmm7, xmm7, xmm5
	vsqrtps xmm1, xmm4
	vmulps xmm1, xmm4, xmm1
	vdivps xmm1, xmm7, xmm1
	vcmpneqps xmm4, xmm4, xmm3
	vandps xmm4, xmm4, xmm1
	vmulps xmm14, xmm14, xmm4
	vmovss xmm1, dword ptr [r8 + rax + 28]
	vinsertps xmm1, xmm1, dword ptr [rdx + rax + 28], 16
	vinsertps xmm1, xmm1, dword ptr [rdx + rax], 32
	vmulps xmm15, xmm15, xmm0
	vinsertps xmm0, xmm1, dword ptr [r8 + rax], 48
	vsubps xmm0, xmm0, xmmword ptr [rsp + 48]
	vmulps xmm1, xmm0, xmm0
	vhaddps xmm1, xmm1, xmm1
	vaddps xmm1, xmm6, xmm1
	vmovss xmm7, dword ptr [rdi + rax + 28]
	vinsertps xmm7, xmm7, dword ptr [rdi + rax], 16
	vmulps xmm7, xmm7, xmm5
	vsqrtps xmm6, xmm1
	vmulps xmm6, xmm1, xmm6
	vdivps xmm6, xmm7, xmm6
	vcmpneqps xmm1, xmm1, xmm3
	vandps xmm1, xmm1, xmm6
	vshufps xmm1, xmm1, xmm1, 80
	vmulps xmm0, xmm0, xmm1
	vmovups ymm1, ymmword ptr [r15 + rax]
	vblendps xmm6, xmm13, xmm14, 3
	vshufps xmm6, xmm6, xmm6, 211
	vshufps xmm7, xmm13, xmm13, 144
	vinsertf128 ymm6, ymm7, xmm6, 1
	vpermpd ymm7, ymm0, 37
	vblendps ymm6, ymm6, ymm7, 129
	vmovups ymm7, ymmword ptr [r12 + rax]
	vmulps ymm6, ymm6, ymm7
	vsubps ymm1, ymm1, ymm6
	vmovups ymmword ptr [r15 + rax], ymm1
	vmulps xmm1, xmm2, xmm4
	vblendps xmm2, xmm15, xmm1, 3
	vshufps xmm2, xmm2, xmm2, 211
	vinsertf128 ymm2, ymm0, xmm2, 1
	vbroadcastss ymm4, xmm0
	vblendps ymm2, ymm2, ymm4, 128
	vmovlhps xmm4, xmm7, xmm15
	vshufps xmm4, xmm4, xmm15, 152
	vblendps ymm2, ymm2, ymm4, 15
	vshufps xmm4, xmm0, xmm0, 255
	vblendps ymm4, ymm7, ymm4, 1
	vmulps ymm2, ymm2, ymm4
	vmovups ymm4, ymmword ptr [r11 + rax]
	vsubps ymm2, ymm4, ymm2
	vmovups ymmword ptr [r11 + rax], ymm2
	vaddps xmm11, xmm13, xmm11
	vaddps xmm12, xmm14, xmm12
	vaddps xmm9, xmm15, xmm9
	vaddps xmm10, xmm10, xmm1
	vaddps xmm8, xmm8, xmm0
	add rax, 32
	cmp rsi, rax
	jne .LBB30_3
	vmovups xmmword ptr [rsp - 116], xmm11
	vmovlps qword ptr [rsp - 100], xmm12
	vextractps dword ptr [rsp - 92], xmm8, 1
	vmovups xmmword ptr [rsp - 84], xmm9
	vmovlps qword ptr [rsp - 68], xmm10
	vmovss dword ptr [rsp - 60], xmm8
	vshufpd xmm1, xmm8, xmm8, 1
	vshufps xmm0, xmm8, xmm8, 255
	vmovaps xmm8, xmmword ptr [rsp - 32]
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm0, xmm0, xmm0
	vxorpd xmm1, xmm1, xmm1
.LBB30_5:
	mov rbx, qword ptr [rsp + 184]
	vmovss dword ptr [rsp - 120], xmm1
	vmovss dword ptr [rsp - 88], xmm0
	mov esi, ecx
	and esi, 7
	cmp r13, rsi
	cmovb rsi, r13
	cmp rbp, rsi
	cmovb rsi, rbp
	cmp r10, rsi
	cmovb rsi, r10
	mov eax, r9d
	and eax, 7
	mov r10d, ebx
	and r10d, 7
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rsi
	cmovae rax, rsi
	test rax, rax
	je .LBB30_7
	movabs rsi, 2305843009213693944
	and rcx, rsi
	mov r13, qword ptr [rsp - 56]
	and r13, rsi
	and r14, rsi
	mov r10, qword ptr [rsp + 152]
	and r10, rsi
	lea rsi, [rdx + 4*rcx]
	lea rdx, [r8 + 4*r13]
	lea rcx, [rdi + 4*r14]
	dec rax
	vmovq xmm0, rax
	vpbroadcastq ymm0, xmm0
	vpbroadcastq ymm1, qword ptr [rip + .LCPI30_0]
	vpxor ymm0, ymm0, ymm1
	vmovdqa ymm1, ymmword ptr [rip + .LCPI30_1]
	vpcmpgtq ymm1, ymm1, ymm0
	vmovdqa ymm2, ymmword ptr [rip + .LCPI30_2]
	vpcmpgtq ymm0, ymm2, ymm0
	vpackssdw ymm0, ymm0, ymm1
	vpcmpeqd ymm1, ymm1, ymm1
	vpxor ymm0, ymm0, ymm1
	vextracti128 xmm1, ymm0, 1
	vpackssdw xmm0, xmm0, xmm1
	vpshufd xmm0, xmm0, 216
	vpmovzxwd ymm0, xmm0
	vpslld ymm0, ymm0, 31
	vmaskmovps ymm1, ymm0, ymmword ptr [rsi]
	lea rax, [r12 + 4*r10]
	vmaskmovps ymm2, ymm0, ymmword ptr [rdx]
	vmaskmovps ymm3, ymm0, ymmword ptr [rcx]
	movabs rcx, 1152921504606846968
	and r9, rcx
	lea rdx, [r15 + 4*r9]
	mov rsi, qword ptr [rsp - 48]
	vbroadcastss ymm4, dword ptr [rsi + 8]
	vbroadcastss ymm5, dword ptr [rsi + 4]
	vbroadcastss ymm6, dword ptr [rsi]
	vmaskmovps ymm7, ymm0, ymmword ptr [rax]
	vsubps ymm1, ymm1, ymm6
	vbroadcastss ymm6, xmm8
	vsubps ymm2, ymm2, ymm5
	vmulps ymm3, ymm3, ymm4
	vmulps ymm4, ymm1, ymm1
	vmulps ymm5, ymm2, ymm2
	vaddps ymm4, ymm4, ymm5
	vaddps ymm4, ymm6, ymm4
	vsqrtps ymm5, ymm4
	vmulps ymm5, ymm4, ymm5
	vdivps ymm3, ymm3, ymm5
	vxorps xmm5, xmm5, xmm5
	vcmpneqps ymm4, ymm4, ymm5
	vandps ymm3, ymm4, ymm3
	vmulps ymm1, ymm1, ymm3
	vmulps ymm4, ymm7, ymm1
	vmaskmovps ymm5, ymm0, ymmword ptr [rdx]
	vsubps ymm4, ymm5, ymm4
	vmaskmovps ymmword ptr [rdx], ymm0, ymm4
	and rbx, rcx
	lea rax, [r11 + 4*rbx]
	vmulps ymm2, ymm2, ymm3
	vmulps ymm3, ymm7, ymm2
	vmaskmovps ymm4, ymm0, ymmword ptr [rax]
	vsubps ymm3, ymm4, ymm3
	vmaskmovps ymmword ptr [rax], ymm0, ymm3
	vaddps ymm1, ymm1, ymmword ptr [rsp - 120]
	vmaskmovps ymmword ptr [rsp - 120], ymm0, ymm1
	vaddps ymm1, ymm2, ymmword ptr [rsp - 88]
	vmaskmovps ymmword ptr [rsp - 88], ymm0, ymm1
.LBB30_7:
	vmovups ymm0, ymmword ptr [rsp - 120]
	mov rax, qword ptr [rsp - 40]
	vmovups ymmword ptr [rax], ymm0
	vmovups ymm0, ymmword ptr [rsp - 88]
	vmovups ymmword ptr [rax + 32], ymm0
	add rsp, 72
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
