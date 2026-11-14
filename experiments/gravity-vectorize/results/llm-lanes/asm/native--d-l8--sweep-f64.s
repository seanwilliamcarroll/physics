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
	sub rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov qword ptr [rsp - 112], rdi
	mov r11, qword ptr [rsp + 104]
	mov rdi, qword ptr [rsp + 88]
	mov r14, rcx
	mov rcx, r9
	mov qword ptr [rsp - 120], r14
	shr rcx, 3
	shr r14, 3
	mov r15d, r9d
	mov qword ptr [rsp - 128], r9
	and r15d, 7
	mov r9, qword ptr [rsp + 136]
	mov rbx, qword ptr [rsp + 120]
	mov r12, qword ptr [rsp + 112]
	mov rbp, qword ptr [rsp + 96]
	vxorpd xmm28, xmm28, xmm28
	vmovupd ymmword ptr [rsp - 72], ymm28
	vmovupd ymmword ptr [rsp - 32], ymm28
	vmovupd ymmword ptr [rsp - 96], ymm28
	vmovupd ymmword ptr [rsp - 8], ymm28
	mov r13d, edi
	mov eax, r11d
	and r13d, 7
	shr rdi, 3
	and eax, 7
	shr r11, 3
	cmp rcx, r14
	cmovb r14, rcx
	mov rcx, rbx
	cmp rdi, r14
	cmovb r14, rdi
	mov rdi, qword ptr [rsp + 80]
	cmp r11, r14
	cmovb r14, r11
	mov r11, r9
	shr rcx, 3
	shr r11, 3
	cmp r11, rcx
	cmovae r11, rcx
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 128]
	test r11, r11
	je .LBB29_1
	vmovupd xmm5, xmmword ptr [rsi]
	vbroadcastsd ymm2, qword ptr [rsi + 8]
	vbroadcastsd ymm3, qword ptr [rsi + 16]
	vbroadcastsd ymm4, qword ptr [rsi]
	vpmovsxbq xmm18, word ptr [rip + .LCPI29_5]
	vmovapd zmm26, zmmword ptr [rip + .LCPI29_1]
	vmovapd zmm27, zmmword ptr [rip + .LCPI29_2]
	vbroadcasti64x4 zmm11, ymmword ptr [rip + .LCPI29_3]
	mov r10b, -127
	vbroadcastsd ymm6, xmm0
	shl r11, 6
	vxorpd xmm7, xmm7, xmm7
	xor ecx, ecx
	vxorpd xmm15, xmm15, xmm15
	vxorpd xmm16, xmm16, xmm16
	vxorpd xmm13, xmm13, xmm13
	vxorpd xmm14, xmm14, xmm14
	vxorpd xmm12, xmm12, xmm12
	kmovd k1, r10d
	mov r10b, 1
	kmovd k2, r10d
	vpermpd ymm29, ymm5, 65
	.p2align	4
.LBB29_3:
	vmovupd zmm8 {k1} {z}, zmmword ptr [rdx + rcx]
	vmovsd xmm17, qword ptr [r8 + rcx + 56]
	vmovupd ymm19, ymmword ptr [r8 + rcx + 8]
	vbroadcastsd ymm9, qword ptr [r8 + rcx]
	vmovupd zmm1 {k1} {z}, zmmword ptr [rdi + rcx]
	vpermt2pd zmm8, zmm18, zmm17
	vmovupd ymm17, ymmword ptr [rdx + rcx + 8]
	vsubpd ymm19, ymm19, ymm2
	vextractf32x4 xmm5, zmm1, 3
	vmovsd xmm1, xmm5, xmm1
	vmulpd ymm21, ymm19, ymm19
	vmulpd xmm1, xmm1, xmm3
	vblendpd ymm8, ymm8, ymm9, 8
	vsubpd ymm8, ymm8, ymm29
	vsubpd ymm17, ymm17, ymm4
	vmulpd ymm9, ymm8, ymm8
	vmulpd ymm20, ymm17, ymm17
	vextractf128 xmm10, ymm9, 1
	vaddpd ymm20, ymm20, ymm21
	vmulpd ymm21, ymm3, ymmword ptr [rdi + rcx + 8]
	vhaddpd xmm9, xmm10, xmm9
	vaddpd ymm20, ymm6, ymm20
	vaddpd xmm9, xmm9, xmm6
	vsqrtpd ymm22, ymm20
	vcmpneqpd k3, ymm20, ymm28
	vsqrtpd xmm5, xmm9
	vmulpd ymm22, ymm20, ymm22
	vmovupd xmm20, xmmword ptr [r8 + rcx + 40]
	vmulpd xmm5, xmm9, xmm5
	vdivpd ymm21 {k3} {z}, ymm21, ymm22
	vsubpd xmm20, xmm20, xmm2
	vmulpd xmm24, xmm20, xmm20
	vmulpd ymm22, ymm17, ymm21
	vmovupd xmm17, xmmword ptr [rdx + rcx + 40]
	vmulpd ymm19, ymm19, ymm21
	vaddpd ymm15, ymm22, ymm15
	vaddpd ymm13, ymm19, ymm13
	vsubpd xmm17, xmm17, xmm4
	vmulpd xmm23, xmm17, xmm17
	vaddpd xmm23, xmm23, xmm24
	vmulpd xmm24, xmm3, xmmword ptr [rdi + rcx + 40]
	vaddpd xmm23, xmm6, xmm23
	vsqrtpd xmm25, xmm23
	vcmpneqpd k3, xmm23, xmm7
	vmulpd xmm25, xmm23, xmm25
	vdivpd xmm23 {k3} {z}, xmm24, xmm25
	vcmpneqpd k3, xmm9, xmm7
	vdivpd xmm1 {k3} {z}, xmm1, xmm5
	vmovupd zmm5, zmmword ptr [r12 + rcx]
	vmulpd xmm17, xmm17, xmm23
	vmulpd xmm10, xmm20, xmm23
	vpermpd ymm1, ymm1, 5
	vpermt2pd zmm22, zmm26, zmm17
	vshuff64x2 ymm20, ymm19, ymm10, 1
	vaddpd xmm16, xmm17, xmm16
	vaddpd xmm14, xmm10, xmm14
	vmulpd ymm1, ymm8, ymm1
	vmovupd zmm8, zmmword ptr [rbp + rcx]
	vpermpd ymm21, ymm1, 255
	vaddpd ymm12, ymm12, ymm1
	vpermt2pd zmm22, zmm27, zmm1
	vmulpd zmm9, zmm22, zmm8
	vsubpd zmm5, zmm5, zmm9
	vshufpd ymm9, ymm20, ymm10, 13
	vinsertf32x4 ymm20, ymm8, xmm19, 1
	vinsertf64x4 zmm8 {k2}, zmm0, ymm21, 0
	vpermt2pd zmm9, zmm11, zmm1
	vshufpd ymm20, ymm20, ymm19, 4
	vmovupd zmmword ptr [r12 + rcx], zmm5
	vmovupd zmm5, zmmword ptr [r14 + rcx]
	vinsertf64x4 zmm9, zmm9, ymm20, 0
	vmulpd zmm8, zmm9, zmm8
	vsubpd zmm5, zmm5, zmm8
	vmovupd zmmword ptr [r14 + rcx], zmm5
	add rcx, 64
	cmp r11, rcx
	jne .LBB29_3
	vextractf128 xmm2, ymm12, 1
	vmovupd ymmword ptr [rsp - 96], ymm15
	vmovupd xmmword ptr [rsp - 64], xmm16
	vmovupd ymmword ptr [rsp - 32], ymm13
	vmovupd xmmword ptr [rsp], xmm14
	vmovhpd qword ptr [rsp - 48], xmm12
	vmovlpd qword ptr [rsp + 16], xmm12
	vshufpd xmm1, xmm2, xmm2, 1
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB29_5:
	mov r11, qword ptr [rsp - 120]
	mov r10d, r9d
	vmovsd qword ptr [rsp - 104], xmm2
	vmovsd qword ptr [rsp - 40], xmm1
	mov ecx, r11d
	and ecx, 7
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, ebx
	and eax, 7
	and r10d, 7
	cmp r10, rax
	cmovb rax, r10
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB29_7
	movabs rcx, 1152921504606846968
	dec rax
	vbroadcastsd zmm0, xmm0
	mov r13, qword ptr [rsp + 88]
	mov r15, qword ptr [rsp + 104]
	and r11, rcx
	vpbroadcastq zmm1, rax
	vpcmpnltuq k1, zmm1, zmmword ptr [rip + .LCPI29_4]
	mov r10, r11
	mov r11, qword ptr [rsp - 128]
	lea r10, [rdx + 8*r10]
	and r13, rcx
	and r15, rcx
	lea rdi, [rdi + 8*r13]
	and r11, rcx
	movabs rcx, 576460752303423480
	lea r8, [r8 + 8*r11]
	lea r11, [rbp + 8*r15]
	and rbx, rcx
	and r9, rcx
	vmovupd zmm1 {k1} {z}, zmmword ptr [r10]
	vmovupd zmm3 {k1} {z}, zmmword ptr [rdi]
	lea rdx, [r12 + 8*rbx]
	lea rcx, [r14 + 8*r9]
	vmovupd zmm2 {k1} {z}, zmmword ptr [r8]
	vsubpd zmm1, zmm1, qword ptr [rsi]{1to8}
	vmulpd zmm3, zmm3, qword ptr [rsi + 16]{1to8}
	vmovupd zmm4 {k1} {z}, zmmword ptr [r11]
	vsubpd zmm2, zmm2, qword ptr [rsi + 8]{1to8}
	vmulpd zmm5, zmm1, zmm1
	vmulpd zmm6, zmm2, zmm2
	vaddpd zmm5, zmm5, zmm6
	vxorpd xmm6, xmm6, xmm6
	vaddpd zmm0, zmm0, zmm5
	vsqrtpd zmm5, zmm0
	vcmpneqpd k2, zmm0, zmm6
	vmulpd zmm5, zmm0, zmm5
	vdivpd zmm0 {k2} {z}, zmm3, zmm5
	vmovupd zmm5 {k1} {z}, zmmword ptr [rdx]
	vmulpd zmm1, zmm1, zmm0
	vmulpd zmm0, zmm2, zmm0
	vmulpd zmm3, zmm4, zmm1
	vmulpd zmm2, zmm4, zmm0
	vmovupd zmm4 {k1} {z}, zmmword ptr [rcx]
	vaddpd zmm1, zmm1, zmmword ptr [rsp - 104]
	vaddpd zmm0, zmm0, zmmword ptr [rsp - 40]
	vsubpd zmm3, zmm5, zmm3
	vmovupd zmmword ptr [rdx] {k1}, zmm3
	vsubpd zmm2, zmm4, zmm2
	vmovupd zmmword ptr [rsp - 104] {k1}, zmm1
	vmovupd zmmword ptr [rsp - 40] {k1}, zmm0
	vmovupd zmmword ptr [rcx] {k1}, zmm2
.LBB29_7:
	vmovups zmm0, zmmword ptr [rsp - 104]
	vmovups zmm1, zmmword ptr [rsp - 40]
	mov rax, qword ptr [rsp - 112]
	vmovups zmmword ptr [rax], zmm0
	vmovups zmmword ptr [rax + 64], zmm1
	add rsp, 24
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
