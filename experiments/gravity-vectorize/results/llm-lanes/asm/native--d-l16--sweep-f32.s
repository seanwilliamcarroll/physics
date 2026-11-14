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
	sub rsp, 56
	.cfi_def_cfa_offset 112
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r11, qword ptr [rsp + 136]
	mov r10, qword ptr [rsp + 120]
	mov r14, rcx
	mov rcx, r9
	mov qword ptr [rsp - 112], r14
	shr rcx, 4
	shr r14, 4
	mov r15d, r9d
	mov qword ptr [rsp - 104], rdi
	mov qword ptr [rsp - 128], r9
	and r15d, 15
	mov rbx, qword ptr [rsp + 152]
	mov r12, qword ptr [rsp + 144]
	mov rbp, qword ptr [rsp + 128]
	vxorps xmm1, xmm1, xmm1
	vmovups ymmword ptr [rsp - 64], ymm1
	vmovups ymmword ptr [rsp - 28], ymm1
	vmovups ymmword ptr [rsp - 92], ymm1
	vmovups ymmword ptr [rsp], ymm1
	mov qword ptr [rsp - 120], rsi
	mov r13d, r10d
	mov eax, r11d
	mov r9, r11
	mov rdi, r10
	and r13d, 15
	shr rdi, 4
	and eax, 15
	shr r9, 4
	cmp rcx, r14
	mov r11, qword ptr [rsp + 168]
	cmovb r14, rcx
	cmp rdi, r14
	cmovb r14, rdi
	mov rdi, rbx
	cmp r9, r14
	cmovb r14, r9
	shr rdi, 4
	shr r11, 4
	cmp r11, rdi
	cmovae r11, rdi
	mov rdi, qword ptr [rsp + 112]
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 160]
	test r11, r11
	je .LBB30_1
	vmovsd xmm7, qword ptr [rsi]
	vbroadcastss ymm4, dword ptr [rsi + 8]
	vpmovsxbd xmm12, dword ptr [rip + .LCPI30_8]
	vbroadcasti32x4 zmm13, xmmword ptr [rip + .LCPI30_3]
	vmovaps ymm15, ymmword ptr [rip + .LCPI30_4]
	vmovaps zmm19, zmmword ptr [rip + .LCPI30_5]
	mov cx, -32767
	vbroadcastss ymm3, xmm0
	shl r11, 6
	vmovaps xmmword ptr [rsp + 32], xmm0
	vxorps xmm9, xmm9, xmm9
	xor r9d, r9d
	vxorps xmm20, xmm20, xmm20
	vxorps xmm21, xmm21, xmm21
	vxorps xmm22, xmm22, xmm22
	vxorps xmm16, xmm16, xmm16
	vxorps xmm17, xmm17, xmm17
	vxorps xmm18, xmm18, xmm18
	vxorps xmm14, xmm14, xmm14
	kmovd k1, ecx
	mov cx, -32768
	kmovd k2, ecx
	vshufps xmm2, xmm7, xmm7, 65
	vshufps xmm5, xmm7, xmm7, 85
	vbroadcastss ymm6, xmm7
	vmovshdup xmm7, xmm7
	vbroadcastss ymm8, xmm7
	.p2align	4
.LBB30_3:
	vmovups ymm23, ymmword ptr [rdx + r9 + 4]
	vmovups ymm24, ymmword ptr [r8 + r9 + 4]
	vmovups zmm0 {k1} {z}, zmmword ptr [rdi + r9]
	vsubps ymm26, ymm24, ymm8
	vsubps ymm23, ymm23, ymm6
	vmulps ymm24, ymm23, ymm23
	vmulps ymm25, ymm26, ymm26
	vaddps ymm24, ymm24, ymm25
	vmulps ymm25, ymm4, ymmword ptr [rdi + r9 + 4]
	vaddps ymm24, ymm3, ymm24
	vsqrtps ymm27, ymm24
	vcmpneqps k3, ymm24, ymm1
	vmulps ymm27, ymm24, ymm27
	vmovups xmm24, xmmword ptr [rdx + r9 + 36]
	vdivps ymm27 {k3} {z}, ymm25, ymm27
	vmovups xmm25, xmmword ptr [r8 + r9 + 36]
	vsubps xmm24, xmm24, xmm6
	vsubps xmm28, xmm25, xmm5
	vmulps xmm25, xmm24, xmm24
	vmulps xmm29, xmm28, xmm28
	vmulps ymm23, ymm23, ymm27
	vmulps ymm27, ymm26, ymm27
	vaddps xmm25, xmm25, xmm29
	vmulps xmm29, xmm4, xmmword ptr [rdi + r9 + 36]
	vaddps ymm16, ymm27, ymm16
	vaddps ymm20, ymm23, ymm20
	vaddps xmm25, xmm3, xmm25
	vsqrtps xmm30, xmm25
	vcmpneqps k3, xmm25, xmm9
	vmulps xmm30, xmm25, xmm30
	vmovsd xmm25, qword ptr [rdx + r9 + 52]
	vdivps xmm29 {k3} {z}, xmm29, xmm30
	vmovsd xmm30, qword ptr [r8 + r9 + 52]
	vsubps xmm25, xmm25, xmm6
	vsubps xmm30, xmm30, xmm7
	vmulps xmm31, xmm25, xmm25
	vmulps xmm10, xmm30, xmm30
	vmulps xmm24, xmm24, xmm29
	vmulps xmm28, xmm28, xmm29
	vaddps xmm10, xmm31, xmm10
	vaddps xmm17, xmm28, xmm17
	vaddps xmm21, xmm24, xmm21
	vaddps xmm10, xmm10, xmm3
	vsqrtps xmm31, xmm10
	vcmpneqps k3, xmm10, xmm9
	vmulps xmm31, xmm10, xmm31
	vmovsd xmm10, qword ptr [rdi + r9 + 52]
	vmulps xmm10, xmm10, xmm4
	vdivps xmm10 {k3} {z}, xmm10, xmm31
	vmulps xmm26, xmm30, xmm10
	vmulps xmm25, xmm25, xmm10
	vmovss xmm10, dword ptr [r8 + r9 + 60]
	vinsertps xmm10, xmm10, dword ptr [rdx + r9 + 60], 16
	vinsertps xmm10, xmm10, dword ptr [rdx + r9], 32
	vinsertps xmm10, xmm10, dword ptr [r8 + r9], 48
	vaddps xmm22, xmm25, xmm22
	vaddps xmm18, xmm26, xmm18
	vsubps xmm10, xmm10, xmm2
	vmulps xmm29, xmm10, xmm10
	vshufps xmm30, xmm29, xmm29, 230
	vshufps xmm29, xmm29, xmm29, 227
	vaddps xmm29, xmm30, xmm29
	vextractf64x4 ymm30, zmm0, 1
	vpermpd ymm11, ymm30, 255
	vpmovsxbd xmm30, dword ptr [rip + .LCPI30_9]
	vaddps xmm29, xmm3, xmm29
	vblendps xmm0, xmm0, xmm11, 2
	vmulps xmm0, xmm0, xmm4
	vsqrtps xmm11, xmm29
	vcmpneqps k3, xmm29, xmm9
	vmulps xmm11, xmm29, xmm11
	vdivps xmm0 {k3} {z}, xmm0, xmm11
	vbroadcastsd ymm11, xmm25
	vshufps xmm0, xmm0, xmm0, 5
	vmulps xmm29, xmm10, xmm0
	vshuff64x2 ymm10, ymm23, ymm24, 1
	vmovups zmm0, zmmword ptr [r12 + r9]
	vshufpd ymm10, ymm10, ymm24, 13
	vblendpd ymm10, ymm10, ymm11, 8
	vpermpd ymm11, ymm23, 148
	vaddps xmm14, xmm29, xmm14
	vinsertf64x4 zmm10, zmm11, ymm10, 1
	vmovaps xmm11, xmm29
	vpermt2ps xmm11, xmm30, xmm23
	vmovaps zmm30, zmmword ptr [rip + .LCPI30_1]
	vpermt2ps zmm10, zmm30, zmm11
	vmovups zmm11, zmmword ptr [rbp + r9]
	vextractf32x4 xmm30, ymm27, 1
	vmulps zmm10, zmm10, zmm11
	vpermt2ps ymm27, ymm15, ymm11
	vpermt2ps zmm11, zmm19, zmm29
	vsubps zmm0, zmm0, zmm10
	vmovaps xmm10, xmm28
	vpermt2ps zmm28, zmm13, zmm26
	vpermt2ps xmm10, xmm12, xmm30
	vmovups zmmword ptr [r12 + r9], zmm0
	vbroadcastss zmm28 {k2}, xmm29
	vinsertf64x4 zmm0, zmm28, ymm27, 0
	vinsertf32x4 zmm0, zmm0, xmm10, 2
	vmulps zmm0, zmm0, zmm11
	vmovups zmm11, zmmword ptr [r14 + r9]
	vsubps zmm0, zmm11, zmm0
	vmovups zmmword ptr [r14 + r9], zmm0
	add r9, 64
	cmp r11, r9
	jne .LBB30_3
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vshufpd xmm2, xmm14, xmm14, 1
	vshufps xmm1, xmm14, xmm14, 255
	vmovups ymmword ptr [rsp - 92], ymm20
	vmovups xmmword ptr [rsp - 60], xmm21
	vmovlps qword ptr [rsp - 44], xmm22
	vmovups ymmword ptr [rsp - 28], ymm16
	vmovups xmmword ptr [rsp + 4], xmm17
	vmovlps qword ptr [rsp + 20], xmm18
	vextractps dword ptr [rsp - 36], xmm14, 1
	vmovss dword ptr [rsp + 28], xmm14
	jmp .LBB30_5
.LBB30_1:
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB30_5:
	mov r11, qword ptr [rsp - 112]
	vmovss dword ptr [rsp - 96], xmm2
	vmovss dword ptr [rsp - 32], xmm1
	mov ecx, r11d
	and ecx, 15
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	mov r13, qword ptr [rsp + 168]
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, ebx
	and eax, 15
	mov r9d, r13d
	and r9d, 15
	cmp r9, rax
	cmovb rax, r9
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB30_7
	dec rax
	mov rsi, qword ptr [rsp - 128]
	movabs rcx, 2305843009213693936
	mov r15, qword ptr [rsp + 136]
	vpbroadcastq zmm1, rax
	vpcmpnltuq k0, zmm1, zmmword ptr [rip + .LCPI30_6]
	vpcmpnltuq k1, zmm1, zmmword ptr [rip + .LCPI30_7]
	mov rax, qword ptr [rsp - 120]
	and r11, rcx
	and r10, rcx
	lea r9, [rdx + 4*r11]
	lea rdi, [rdi + 4*r10]
	and rsi, rcx
	and r15, rcx
	movabs rcx, 1152921504606846960
	lea r8, [r8 + 4*rsi]
	lea r10, [rbp + 4*r15]
	and rbx, rcx
	and r13, rcx
	lea rdx, [r12 + 4*rbx]
	lea rcx, [r14 + 4*r13]
	kunpckbw k1, k1, k0
	vmovups zmm1 {k1} {z}, zmmword ptr [r8]
	vmovups zmm4 {k1} {z}, zmmword ptr [r9]
	vmovups zmm2 {k1} {z}, zmmword ptr [rdi]
	vmovups zmm3 {k1} {z}, zmmword ptr [r10]
	vsubps zmm7, zmm4, dword ptr [rax]{1to16}
	vsubps zmm1, zmm1, dword ptr [rax + 4]{1to16}
	vbroadcastss zmm4, xmm0
	vmulps zmm2, zmm2, dword ptr [rax + 8]{1to16}
	vmulps zmm5, zmm7, zmm7
	vmulps zmm6, zmm1, zmm1
	vaddps zmm5, zmm5, zmm6
	vxorps xmm6, xmm6, xmm6
	vaddps zmm4, zmm4, zmm5
	vsqrtps zmm5, zmm4
	vcmpneqps k2, zmm4, zmm6
	vmulps zmm5, zmm4, zmm5
	vdivps zmm2 {k2} {z}, zmm2, zmm5
	vmovups zmm5 {k1} {z}, zmmword ptr [rdx]
	vmulps zmm0, zmm7, zmm2
	vmulps zmm1, zmm1, zmm2
	vmulps zmm4, zmm3, zmm0
	vmulps zmm2, zmm3, zmm1
	vmovups zmm3 {k1} {z}, zmmword ptr [rcx]
	vaddps zmm0, zmm0, zmmword ptr [rsp - 96]
	vaddps zmm1, zmm1, zmmword ptr [rsp - 32]
	vsubps zmm4, zmm5, zmm4
	vmovups zmmword ptr [rdx] {k1}, zmm4
	vsubps zmm2, zmm3, zmm2
	vmovups zmmword ptr [rsp - 96] {k1}, zmm0
	vmovups zmmword ptr [rsp - 32] {k1}, zmm1
	vmovups zmmword ptr [rcx] {k1}, zmm2
.LBB30_7:
	vmovups zmm0, zmmword ptr [rsp - 96]
	vmovups zmm1, zmmword ptr [rsp - 32]
	mov rax, qword ptr [rsp - 104]
	vmovups zmmword ptr [rax], zmm0
	vmovups zmmword ptr [rax + 64], zmm1
	add rsp, 56
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
