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
	shr rcx, 2
	shr r14, 2
	mov r15d, r9d
	mov qword ptr [rsp - 8], rdi
	mov qword ptr [rsp - 32], r9
	and r15d, 3
	mov rdi, qword ptr [rsp + 112]
	mov rbx, qword ptr [rsp + 96]
	mov r12, qword ptr [rsp + 88]
	mov rbp, qword ptr [rsp + 72]
	mov dword ptr [rsp - 60], 0
	mov qword ptr [rsp - 68], 0
	mov qword ptr [rsp - 52], 0
	mov dword ptr [rsp - 44], 0
	mov qword ptr [rsp - 24], rsi
	mov eax, r11d
	mov r13d, r10d
	mov r9, r10
	and r13d, 3
	shr r9, 2
	and eax, 3
	shr r11, 2
	cmp rcx, r14
	cmovb r14, rcx
	mov rcx, rbx
	cmp r9, r14
	cmovb r14, r9
	cmp r11, r14
	cmovb r14, r11
	mov r11, rdi
	shr rcx, 2
	shr r11, 2
	cmp r11, rcx
	cmovae r11, rcx
	mov rcx, qword ptr [rsp + 56]
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 104]
	test r11, r11
	je .LBB30_1
	vmovsd xmm5, qword ptr [rsi]
	vbroadcastss xmm4, dword ptr [rsi + 8]
	vpmovsxbd xmm8, dword ptr [rip + .LCPI30_3]
	vpmovsxbq xmm10, word ptr [rip + .LCPI30_4]
	lea rsi, [rcx + 4]
	mov cl, 9
	vbroadcastss xmm3, xmm0
	shl r11, 4
	vxorps xmm6, xmm6, xmm6
	xor r9d, r9d
	vxorps xmm11, xmm11, xmm11
	vxorps xmm9, xmm9, xmm9
	vxorps xmm7, xmm7, xmm7
	kmovd k1, ecx
	vbroadcastss xmm2, xmm5
	vshufps xmm1, xmm5, xmm5, 65
	vmovshdup xmm5, xmm5
	.p2align	4
.LBB30_3:
	vmovsd xmm12, qword ptr [rdx + r9 + 4]
	vmovsd xmm13, qword ptr [r8 + r9 + 4]
	vsubps xmm12, xmm12, xmm2
	vsubps xmm13, xmm13, xmm5
	vmulps xmm14, xmm12, xmm12
	vmulps xmm15, xmm13, xmm13
	vaddps xmm14, xmm14, xmm15
	vmovsd xmm15, qword ptr [rsi + r9]
	vaddps xmm14, xmm14, xmm3
	vsqrtps xmm16, xmm14
	vcmpneqps k2, xmm14, xmm6
	vmulps xmm15, xmm15, xmm4
	vmulps xmm16, xmm14, xmm16
	vdivps xmm14 {k2} {z}, xmm15, xmm16
	vmulps xmm12, xmm12, xmm14
	vmulps xmm13, xmm13, xmm14
	vmovss xmm14, dword ptr [r8 + r9 + 12]
	vinsertps xmm14, xmm14, dword ptr [rdx + r9 + 12], 16
	vinsertps xmm14, xmm14, dword ptr [rdx + r9], 32
	vinsertps xmm14, xmm14, dword ptr [r8 + r9], 48
	vaddps xmm9, xmm13, xmm9
	vaddps xmm11, xmm12, xmm11
	vsubps xmm14, xmm14, xmm1
	vmulps xmm15, xmm14, xmm14
	vshufps xmm16, xmm15, xmm15, 230
	vshufps xmm15, xmm15, xmm15, 227
	vaddps xmm15, xmm16, xmm15
	vmovups xmm16 {k1} {z}, xmmword ptr [rsi + r9 - 4]
	vaddps xmm15, xmm15, xmm3
	vsqrtps xmm17, xmm15
	vcmpneqps k2, xmm15, xmm6
	vshufps xmm16, xmm16, xmm16, 236
	vmulps xmm16, xmm16, xmm4
	vmulps xmm17, xmm15, xmm17
	vdivps xmm15 {k2} {z}, xmm16, xmm17
	vmovups xmm16, xmmword ptr [rbp + r9]
	vpermt2ps xmm13, xmm10, xmm16
	vshufps xmm15, xmm15, xmm15, 5
	vmulps xmm14, xmm14, xmm15
	vmovups xmm15, xmmword ptr [r12 + r9]
	vinsertps xmm13, xmm13, xmm14, 48
	vinsertps xmm17, xmm16, xmm14, 192
	vaddps xmm7, xmm14, xmm7
	vpermt2ps xmm14, xmm8, xmm12
	vmulps xmm13, xmm13, xmm17
	vmulps xmm14, xmm14, xmm16
	vsubps xmm14, xmm15, xmm14
	vmovups xmm15, xmmword ptr [r14 + r9]
	vmovups xmmword ptr [r12 + r9], xmm14
	vsubps xmm13, xmm15, xmm13
	vmovups xmmword ptr [r14 + r9], xmm13
	add r9, 16
	cmp r11, r9
	jne .LBB30_3
	vshufpd xmm2, xmm7, xmm7, 1
	vshufps xmm1, xmm7, xmm7, 255
	vmovlps qword ptr [rsp - 68], xmm11
	vmovlps qword ptr [rsp - 52], xmm9
	vextractps dword ptr [rsp - 60], xmm7, 1
	vmovss dword ptr [rsp - 44], xmm7
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB30_5:
	mov r11, qword ptr [rsp - 16]
	mov esi, edi
	vmovss dword ptr [rsp - 72], xmm2
	vmovss dword ptr [rsp - 56], xmm1
	mov ecx, r11d
	and ecx, 3
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, ebx
	and eax, 3
	and esi, 3
	cmp rsi, rax
	cmovb rax, rsi
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB30_7
	dec rax
	mov r9, qword ptr [rsp - 32]
	movabs rcx, 2305843009213693948
	mov r15, qword ptr [rsp + 80]
	vbroadcastss xmm0, xmm0
	vpbroadcastq ymm1, rax
	vpcmpnltuq k1, ymm1, ymmword ptr [rip + .LCPI30_2]
	mov rax, qword ptr [rsp - 24]
	and r11, rcx
	and r10, rcx
	lea rsi, [rdx + 4*r11]
	and r9, rcx
	and r15, rcx
	movabs rcx, 1152921504606846972
	lea r8, [r8 + 4*r9]
	and rbx, rcx
	and rdi, rcx
	mov rcx, qword ptr [rsp + 56]
	lea rdx, [r12 + 4*rbx]
	vmovups xmm1 {k1} {z}, xmmword ptr [rsi]
	vmovups xmm2 {k1} {z}, xmmword ptr [r8]
	vsubps xmm1, xmm1, dword ptr [rax]{1to4}
	vsubps xmm2, xmm2, dword ptr [rax + 4]{1to4}
	lea r9, [rcx + 4*r10]
	lea r10, [rbp + 4*r15]
	lea rcx, [r14 + 4*rdi]
	vmovups xmm3 {k1} {z}, xmmword ptr [r9]
	vmovups xmm4 {k1} {z}, xmmword ptr [r10]
	vmulps xmm3, xmm3, dword ptr [rax + 8]{1to4}
	vmulps xmm5, xmm1, xmm1
	vmulps xmm6, xmm2, xmm2
	vaddps xmm5, xmm5, xmm6
	vxorps xmm6, xmm6, xmm6
	vaddps xmm0, xmm0, xmm5
	vsqrtps xmm5, xmm0
	vcmpneqps k2, xmm0, xmm6
	vmulps xmm5, xmm0, xmm5
	vdivps xmm0 {k2} {z}, xmm3, xmm5
	vmovups xmm5 {k1} {z}, xmmword ptr [rdx]
	vmulps xmm1, xmm1, xmm0
	vmulps xmm0, xmm2, xmm0
	vmulps xmm3, xmm4, xmm1
	vmulps xmm2, xmm4, xmm0
	vmovups xmm4 {k1} {z}, xmmword ptr [rcx]
	vaddps xmm1, xmm1, xmmword ptr [rsp - 72]
	vaddps xmm0, xmm0, xmmword ptr [rsp - 56]
	vsubps xmm3, xmm5, xmm3
	vmovups xmmword ptr [rdx] {k1}, xmm3
	vsubps xmm2, xmm4, xmm2
	vmovaps xmmword ptr [rsp - 72] {k1}, xmm1
	vmovaps xmmword ptr [rsp - 56] {k1}, xmm0
	vmovups xmmword ptr [rcx] {k1}, xmm2
.LBB30_7:
	vmovaps xmm0, xmmword ptr [rsp - 72]
	vmovaps xmm1, xmmword ptr [rsp - 56]
	mov rax, qword ptr [rsp - 8]
	vmovups xmmword ptr [rax], xmm0
	vmovups xmmword ptr [rax + 16], xmm1
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
