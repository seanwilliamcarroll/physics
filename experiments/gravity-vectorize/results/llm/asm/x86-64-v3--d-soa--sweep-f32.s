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
	mov rax, r9
	mov rbx, rsi
	mov qword ptr [rsp - 8], rdi
	mov rdi, qword ptr [rsp + 80]
	mov r9, qword ptr [rsp + 64]
	mov r13d, eax
	and r13d, 3
	mov qword ptr [rsp - 24], rax
	shr rax, 2
	mov ebp, r9d
	and ebp, 3
	mov rsi, r9
	shr rsi, 2
	mov r10d, edi
	and r10d, 3
	shr rdi, 2
	mov r11, rcx
	shr r11, 2
	cmp rax, r11
	cmovb r11, rax
	mov r15, qword ptr [rsp + 112]
	cmp rsi, r11
	cmovb r11, rsi
	mov r14, qword ptr [rsp + 96]
	cmp rdi, r11
	cmovb r11, rdi
	mov rax, r14
	shr rax, 2
	mov rsi, r15
	shr rsi, 2
	cmp rsi, rax
	cmovae rsi, rax
	cmp rsi, r11
	cmovae rsi, r11
	mov r11, qword ptr [rsp + 104]
	mov dword ptr [rsp - 44], 0
	mov qword ptr [rsp - 52], 0
	mov qword ptr [rsp - 36], 0
	mov dword ptr [rsp - 28], 0
	mov r15, qword ptr [rsp + 88]
	mov r12, qword ptr [rsp + 72]
	mov rdi, qword ptr [rsp + 56]
	test rsi, rsi
	mov qword ptr [rsp - 16], rbx
	je .LBB30_1
	vmovsd xmm5, qword ptr [rbx]
	vshufps xmm1, xmm5, xmm5, 65
	vbroadcastss xmm2, xmm5
	vbroadcastss xmm3, xmm0
	vbroadcastss xmm4, dword ptr [rbx + 8]
	vmovshdup xmm5, xmm5
	shl rsi, 4
	vxorps xmm7, xmm7, xmm7
	xor eax, eax
	vxorps xmm9, xmm9, xmm9
	vxorps xmm8, xmm8, xmm8
	vxorps xmm6, xmm6, xmm6
	.p2align	4
.LBB30_3:
	vmovsd xmm10, qword ptr [rdx + rax + 4]
	vsubps xmm10, xmm10, xmm2
	vmovsd xmm11, qword ptr [r8 + rax + 4]
	vsubps xmm11, xmm11, xmm5
	vmulps xmm12, xmm10, xmm10
	vmulps xmm13, xmm11, xmm11
	vaddps xmm12, xmm12, xmm13
	vaddps xmm12, xmm12, xmm3
	vmovsd xmm13, qword ptr [rdi + rax + 4]
	vmulps xmm13, xmm13, xmm4
	vsqrtps xmm14, xmm12
	vmulps xmm14, xmm12, xmm14
	vdivps xmm13, xmm13, xmm14
	vcmpneqps xmm12, xmm12, xmm7
	vmovss xmm14, dword ptr [r8 + rax + 12]
	vinsertps xmm14, xmm14, dword ptr [rdx + rax + 12], 16
	vinsertps xmm14, xmm14, dword ptr [rdx + rax], 32
	vandps xmm12, xmm12, xmm13
	vinsertps xmm13, xmm14, dword ptr [r8 + rax], 48
	vsubps xmm13, xmm13, xmm1
	vmulps xmm14, xmm13, xmm13
	vhaddps xmm14, xmm14, xmm14
	vmulps xmm10, xmm10, xmm12
	vmulps xmm11, xmm11, xmm12
	vaddps xmm12, xmm14, xmm3
	vmovss xmm14, dword ptr [rdi + rax + 12]
	vinsertps xmm14, xmm14, dword ptr [rdi + rax], 16
	vmulps xmm14, xmm14, xmm4
	vsqrtps xmm15, xmm12
	vmulps xmm15, xmm12, xmm15
	vdivps xmm14, xmm14, xmm15
	vcmpneqps xmm12, xmm12, xmm7
	vandps xmm12, xmm12, xmm14
	vshufps xmm12, xmm12, xmm12, 80
	vmulps xmm12, xmm13, xmm12
	vmovups xmm13, xmmword ptr [r15 + rax]
	vmovups xmm14, xmmword ptr [r12 + rax]
	vshufps xmm15, xmm12, xmm10, 70
	vshufps xmm15, xmm15, xmm15, 120
	vmulps xmm15, xmm15, xmm14
	vsubps xmm13, xmm13, xmm15
	vmovups xmmword ptr [r15 + rax], xmm13
	vmovups xmm13, xmmword ptr [r11 + rax]
	vmovlhps xmm15, xmm14, xmm11
	vshufps xmm15, xmm15, xmm11, 216
	vinsertps xmm15, xmm15, xmm12, 48
	vinsertps xmm14, xmm14, xmm12, 192
	vmulps xmm14, xmm15, xmm14
	vsubps xmm13, xmm13, xmm14
	vmovups xmmword ptr [r11 + rax], xmm13
	vaddps xmm9, xmm10, xmm9
	vaddps xmm8, xmm11, xmm8
	vaddps xmm6, xmm12, xmm6
	add rax, 16
	cmp rsi, rax
	jne .LBB30_3
	vmovlps qword ptr [rsp - 52], xmm9
	vextractps dword ptr [rsp - 44], xmm6, 1
	vmovlps qword ptr [rsp - 36], xmm8
	vmovss dword ptr [rsp - 28], xmm6
	vshufpd xmm2, xmm6, xmm6, 1
	vshufps xmm1, xmm6, xmm6, 255
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB30_5:
	mov rbx, qword ptr [rsp + 112]
	vmovss dword ptr [rsp - 56], xmm2
	vmovss dword ptr [rsp - 40], xmm1
	mov esi, ecx
	and esi, 3
	cmp r13, rsi
	cmovb rsi, r13
	cmp rbp, rsi
	cmovb rsi, rbp
	cmp r10, rsi
	cmovb rsi, r10
	mov eax, r14d
	and eax, 3
	mov r10d, ebx
	and r10d, 3
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rsi
	cmovae rax, rsi
	test rax, rax
	je .LBB30_7
	movabs rsi, 2305843009213693948
	and rcx, rsi
	mov r13, qword ptr [rsp - 24]
	and r13, rsi
	and r9, rsi
	mov r10, qword ptr [rsp + 80]
	and r10, rsi
	lea rcx, [rdx + 4*rcx]
	lea rdx, [r8 + 4*r13]
	lea rsi, [rdi + 4*r9]
	dec rax
	vmovq xmm1, rax
	vpbroadcastq ymm1, xmm1
	vpbroadcastq ymm2, qword ptr [rip + .LCPI30_0]
	vpxor ymm1, ymm1, ymm2
	vmovdqa ymm2, ymmword ptr [rip + .LCPI30_1]
	vpcmpgtq ymm1, ymm2, ymm1
	vpcmpeqd ymm2, ymm2, ymm2
	vpxor ymm1, ymm1, ymm2
	vextracti128 xmm2, ymm1, 1
	vpackssdw xmm1, xmm1, xmm2
	vmaskmovps xmm2, xmm1, xmmword ptr [rcx]
	lea rax, [r12 + 4*r10]
	vmaskmovps xmm3, xmm1, xmmword ptr [rdx]
	vmaskmovps xmm4, xmm1, xmmword ptr [rsi]
	movabs rcx, 1152921504606846972
	and r14, rcx
	lea rdx, [r15 + 4*r14]
	mov rsi, qword ptr [rsp - 16]
	vbroadcastss xmm5, dword ptr [rsi + 8]
	vbroadcastss xmm6, dword ptr [rsi + 4]
	vbroadcastss xmm7, dword ptr [rsi]
	vmaskmovps xmm8, xmm1, xmmword ptr [rax]
	vsubps xmm2, xmm2, xmm7
	vbroadcastss xmm0, xmm0
	vsubps xmm3, xmm3, xmm6
	vmulps xmm4, xmm4, xmm5
	vmulps xmm5, xmm2, xmm2
	vmulps xmm6, xmm3, xmm3
	vaddps xmm5, xmm5, xmm6
	vaddps xmm0, xmm0, xmm5
	vsqrtps xmm5, xmm0
	vmulps xmm5, xmm0, xmm5
	vdivps xmm4, xmm4, xmm5
	vxorps xmm5, xmm5, xmm5
	vcmpneqps xmm0, xmm0, xmm5
	vandps xmm0, xmm0, xmm4
	vmulps xmm2, xmm2, xmm0
	vmulps xmm4, xmm8, xmm2
	vmaskmovps xmm5, xmm1, xmmword ptr [rdx]
	vsubps xmm4, xmm5, xmm4
	vmaskmovps xmmword ptr [rdx], xmm1, xmm4
	and rbx, rcx
	lea rax, [r11 + 4*rbx]
	vmulps xmm0, xmm3, xmm0
	vmulps xmm3, xmm8, xmm0
	vmaskmovps xmm4, xmm1, xmmword ptr [rax]
	vsubps xmm3, xmm4, xmm3
	vmaskmovps xmmword ptr [rax], xmm1, xmm3
	vaddps xmm2, xmm2, xmmword ptr [rsp - 56]
	vmaskmovps xmmword ptr [rsp - 56], xmm1, xmm2
	vaddps xmm0, xmm0, xmmword ptr [rsp - 40]
	vmaskmovps xmmword ptr [rsp - 40], xmm1, xmm0
.LBB30_7:
	vmovaps xmm0, xmmword ptr [rsp - 56]
	mov rax, qword ptr [rsp - 8]
	vmovups xmmword ptr [rax], xmm0
	vmovaps xmm0, xmmword ptr [rsp - 40]
	vmovups xmmword ptr [rax + 16], xmm0
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
