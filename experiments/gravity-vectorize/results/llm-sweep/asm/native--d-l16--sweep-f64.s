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
	sub rsp, 168
	.cfi_def_cfa_offset 224
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov qword ptr [rsp - 120], rdi
	mov r11, qword ptr [rsp + 248]
	mov rdi, qword ptr [rsp + 232]
	mov r14, rcx
	mov rcx, r9
	mov r10, r14
	shr rcx, 4
	shr r14, 4
	mov r15d, r9d
	mov qword ptr [rsp - 128], r9
	and r15d, 15
	mov r9, qword ptr [rsp + 280]
	mov rbx, qword ptr [rsp + 264]
	mov r12, qword ptr [rsp + 256]
	mov rbp, qword ptr [rsp + 240]
	vxorpd xmm1, xmm1, xmm1
	vmovupd zmmword ptr [rsp - 24], zmm1
	vmovupd zmmword ptr [rsp + 48], zmm1
	vmovupd zmmword ptr [rsp - 80], zmm1
	vmovupd zmmword ptr [rsp + 104], zmm1
	mov r13d, edi
	mov eax, r11d
	and r13d, 15
	shr rdi, 4
	and eax, 15
	shr r11, 4
	cmp rcx, r14
	cmovb r14, rcx
	mov rcx, rbx
	cmp rdi, r14
	cmovb r14, rdi
	mov rdi, qword ptr [rsp + 224]
	cmp r11, r14
	cmovb r14, r11
	mov r11, r9
	shr rcx, 4
	shr r11, 4
	cmp r11, rcx
	cmovae r11, rcx
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 272]
	test r11, r11
	je .LBB29_1
	vmovupd xmm2, xmmword ptr [rsi]
	vbroadcastsd zmm4, qword ptr [rsi + 16]
	vbroadcastsd zmm5, qword ptr [rsi + 8]
	vbroadcastsd zmm6, qword ptr [rsi]
	vmovapd zmm31, zmmword ptr [rip + .LCPI29_0]
	vbroadcasti64x4 zmm11, ymmword ptr [rip + .LCPI29_1]
	vmovapd zmm15, zmmword ptr [rip + .LCPI29_2]
	vbroadcasti64x4 zmm16, ymmword ptr [rip + .LCPI29_3]
	vbroadcastsd zmm3, xmm0
	shl r11, 7
	vmovapd xmmword ptr [rsp - 112], xmm0
	vxorpd xmm7, xmm7, xmm7
	vxorpd xmm0, xmm0, xmm0
	xor ecx, ecx
	vxorpd xmm17, xmm17, xmm17
	vxorpd xmm18, xmm18, xmm18
	vxorpd xmm19, xmm19, xmm19
	vxorpd xmm12, xmm12, xmm12
	vxorpd xmm13, xmm13, xmm13
	vxorpd xmm14, xmm14, xmm14
	vxorpd xmm10, xmm10, xmm10
	vpermpd ymm2, ymm2, 65
	.p2align	4
.LBB29_3:
	vmovupd zmm20, zmmword ptr [rdx + rcx + 8]
	vmovupd zmm21, zmmword ptr [r8 + rcx + 8]
	vsubpd zmm22, zmm21, zmm5
	vsubpd zmm20, zmm20, zmm6
	vmulpd zmm21, zmm20, zmm20
	vmulpd zmm23, zmm22, zmm22
	vaddpd zmm21, zmm21, zmm23
	vmulpd zmm23, zmm4, zmmword ptr [rdi + rcx + 8]
	vaddpd zmm21, zmm3, zmm21
	vsqrtpd zmm24, zmm21
	vcmpneqpd k1, zmm21, zmm1
	vmulpd zmm24, zmm21, zmm24
	vmovupd ymm21, ymmword ptr [r8 + rcx + 72]
	vdivpd zmm23 {k1} {z}, zmm23, zmm24
	vsubpd ymm26, ymm21, ymm5
	vmulpd ymm25, ymm26, ymm26
	vmulpd zmm24, zmm20, zmm23
	vmovupd ymm20, ymmword ptr [rdx + rcx + 72]
	vaddpd zmm17, zmm24, zmm17
	vsubpd ymm20, ymm20, ymm6
	vmulpd ymm21, ymm20, ymm20
	vaddpd ymm21, ymm21, ymm25
	vmulpd ymm25, ymm4, ymmword ptr [rdi + rcx + 72]
	vaddpd ymm21, ymm3, ymm21
	vsqrtpd ymm27, ymm21
	vcmpneqpd k1, ymm21, ymm0
	vmulpd ymm27, ymm21, ymm27
	vmovupd xmm21, xmmword ptr [rdx + rcx + 104]
	vdivpd ymm27 {k1} {z}, ymm25, ymm27
	vmovupd xmm25, xmmword ptr [r8 + rcx + 104]
	vsubpd xmm21, xmm21, xmm6
	vsubpd xmm28, xmm25, xmm5
	vmulpd xmm25, xmm21, xmm21
	vmulpd xmm29, xmm28, xmm28
	vmulpd ymm20, ymm20, ymm27
	vaddpd xmm25, xmm25, xmm29
	vmulpd xmm29, xmm4, xmmword ptr [rdi + rcx + 104]
	vaddpd ymm18, ymm20, ymm18
	vaddpd xmm25, xmm3, xmm25
	vsqrtpd xmm30, xmm25
	vcmpneqpd k1, xmm25, xmm7
	vmulpd xmm30, xmm25, xmm30
	vmovupd zmm25, zmmword ptr [r14 + rcx + 64]
	vdivpd xmm29 {k1} {z}, xmm29, xmm30
	vmulpd zmm30, zmm22, zmm23
	vmulpd ymm22, ymm26, ymm27
	vmovsd xmm26, qword ptr [rdx + rcx]
	vmovsd xmm27, qword ptr [r8 + rcx + 120]
	vmovhpd xmm26, xmm26, qword ptr [r8 + rcx]
	vmovhpd xmm27, xmm27, qword ptr [rdx + rcx + 120]
	vaddpd zmm12, zmm30, zmm12
	vaddpd ymm13, ymm22, ymm13
	vinsertf32x4 ymm26, ymm27, xmm26, 1
	vsubpd ymm26, ymm26, ymm2
	vmulpd xmm21, xmm21, xmm29
	vmulpd xmm23, xmm28, xmm29
	valignq zmm29, zmm22, zmm30, 7
	vmulpd ymm8, ymm26, ymm26
	vshuff64x2 ymm28, ymm20, ymm21, 1
	vaddpd xmm19, xmm21, xmm19
	vaddpd xmm14, xmm23, xmm14
	vextractf128 xmm9, ymm8, 1
	vshufpd ymm28, ymm28, ymm21, 13
	vhaddpd xmm8, xmm8, xmm9
	vmovsd xmm9, qword ptr [rdi + rcx + 120]
	vmovhpd xmm9, xmm9, qword ptr [rdi + rcx]
	vaddpd xmm8, xmm8, xmm3
	vsqrtpd xmm27, xmm8
	vcmpneqpd k1, xmm8, xmm7
	vmulpd xmm9, xmm9, xmm4
	vmulpd xmm27, xmm8, xmm27
	vdivpd xmm8 {k1} {z}, xmm9, xmm27
	vmovupd zmm9, zmmword ptr [rbp + rcx]
	valignq zmm27, zmm20, zmm24, 7
	vpermpd ymm8, ymm8, 80
	vmulpd ymm26, ymm26, ymm8
	vmovupd zmm8, zmmword ptr [r12 + rcx]
	vpermt2pd zmm24, zmm31, zmm26
	vpermt2pd zmm28, zmm11, zmm26
	vpermt2pd zmm30, zmm15, zmm26
	vaddpd ymm10, ymm26, ymm10
	vmulpd zmm24, zmm24, zmm9
	vshuff64x2 zmm27, zmm27, zmm28, 228
	vmovupd zmm28, zmmword ptr [r14 + rcx]
	vmulpd zmm9, zmm30, zmm9
	vsubpd zmm8, zmm8, zmm24
	vmovupd zmm24, zmmword ptr [rbp + rcx + 64]
	vmovupd zmmword ptr [r12 + rcx], zmm8
	vmovupd zmm8, zmmword ptr [r12 + rcx + 64]
	vsubpd zmm9, zmm28, zmm9
	vmulpd zmm27, zmm27, zmm24
	vmovupd zmmword ptr [r14 + rcx], zmm9
	vsubpd zmm8, zmm8, zmm27
	vshuff64x2 ymm27, ymm22, ymm23, 1
	vshufpd ymm9, ymm27, ymm23, 13
	vpermt2pd zmm9, zmm16, zmm26
	vmovupd zmmword ptr [r12 + rcx + 64], zmm8
	vshuff64x2 zmm8, zmm29, zmm9, 228
	vmulpd zmm8, zmm8, zmm24
	vsubpd zmm8, zmm25, zmm8
	vmovupd zmmword ptr [r14 + rcx + 64], zmm8
	sub rcx, -128
	cmp r11, rcx
	jne .LBB29_3
	vmovapd xmm0, xmmword ptr [rsp - 112]
	vextractf128 xmm2, ymm10, 1
	vmovupd zmmword ptr [rsp - 80], zmm17
	vmovupd ymmword ptr [rsp - 16], ymm18
	vmovupd xmmword ptr [rsp + 16], xmm19
	vmovupd zmmword ptr [rsp + 48], zmm12
	vmovupd ymmword ptr [rsp + 112], ymm13
	vmovupd xmmword ptr [rsp + 144], xmm14
	vmovhpd qword ptr [rsp + 32], xmm10
	vmovlpd qword ptr [rsp + 160], xmm10
	vshufpd xmm1, xmm2, xmm2, 1
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
.LBB29_5:
	mov ecx, r10d
	and ecx, 15
	mov r11d, ebx
	vmovsd qword ptr [rsp - 88], xmm2
	vmovsd qword ptr [rsp + 40], xmm1
	cmp r15, rcx
	cmovb rcx, r15
	cmp r13, rcx
	cmovb rcx, r13
	cmp rax, rcx
	cmovb rcx, rax
	mov eax, r9d
	and r11d, 15
	and eax, 15
	cmp rax, r11
	cmovb r11, rax
	cmp r11, rcx
	cmovae r11, rcx
	test r11, r11
	je .LBB29_8
	mov rcx, qword ptr [rsp - 128]
	mov r13, qword ptr [rsp + 232]
	mov r15, qword ptr [rsp + 248]
	vbroadcastsd zmm1, qword ptr [rsi]
	vbroadcastsd zmm2, qword ptr [rsi + 8]
	vbroadcastsd zmm4, qword ptr [rsi + 16]
	vmovdqa64 zmm5, zmmword ptr [rip + .LCPI29_4]
	vpbroadcastq zmm7, qword ptr [rip + .LCPI29_5]
	movabs rax, 1152921504606846960
	vbroadcastsd zmm0, xmm0
	xor esi, esi
	vxorpd xmm6, xmm6, xmm6
	and r10, rax
	and rcx, rax
	and r13, rax
	and r15, rax
	lea rax, [rdx + 8*r10]
	movabs r10, 576460752303423472
	and r9, r10
	and rbx, r10
	lea r10d, [r11 + 7]
	lea rcx, [r8 + 8*rcx]
	lea rdx, [rdi + 8*r13]
	dec r11
	lea rdi, [rbp + 8*r15]
	shr r10d, 3
	lea r8, [r12 + 8*rbx]
	lea r9, [r14 + 8*r9]
	vpbroadcastq zmm3, r11
	shl r10d, 6
	.p2align	4
.LBB29_7:
	vpcmpleuq k1, zmm5, zmm3
	vpaddq zmm5, zmm5, zmm7
	vmovupd zmm8 {k1} {z}, zmmword ptr [rax + rsi]
	vmovupd zmm9 {k1} {z}, zmmword ptr [rcx + rsi]
	vmovupd zmm10 {k1} {z}, zmmword ptr [rdx + rsi]
	vmovupd zmm11 {k1} {z}, zmmword ptr [rdi + rsi]
	vsubpd zmm8, zmm8, zmm1
	vsubpd zmm9, zmm9, zmm2
	vmulpd zmm10, zmm10, zmm4
	vmulpd zmm12, zmm8, zmm8
	vmulpd zmm13, zmm9, zmm9
	vaddpd zmm12, zmm12, zmm13
	vaddpd zmm12, zmm0, zmm12
	vsqrtpd zmm13, zmm12
	vcmpneqpd k2, zmm12, zmm6
	vmulpd zmm13, zmm12, zmm13
	vmovupd zmm12 {k1} {z}, zmmword ptr [r8 + rsi]
	vdivpd zmm10 {k2} {z}, zmm10, zmm13
	vmulpd zmm8, zmm8, zmm10
	vmulpd zmm9, zmm9, zmm10
	vmulpd zmm10, zmm11, zmm8
	vmulpd zmm13, zmm11, zmm9
	vmovupd zmm11 {k1} {z}, zmmword ptr [rsp + rsi - 88]
	vsubpd zmm10, zmm12, zmm10
	vmovupd zmm12 {k1} {z}, zmmword ptr [r9 + rsi]
	vmovupd zmmword ptr [r8 + rsi] {k1}, zmm10
	vaddpd zmm8, zmm11, zmm8
	vsubpd zmm10, zmm12, zmm13
	vmovupd zmmword ptr [rsp + rsi - 88] {k1}, zmm8
	vmovupd zmmword ptr [r9 + rsi] {k1}, zmm10
	vmovupd zmm10 {k1} {z}, zmmword ptr [rsp + rsi + 40]
	vaddpd zmm8, zmm10, zmm9
	vmovupd zmmword ptr [rsp + rsi + 40] {k1}, zmm8
	add rsi, 64
	cmp r10, rsi
	jne .LBB29_7
.LBB29_8:
	vmovups zmm1, zmmword ptr [rsp - 24]
	mov rax, qword ptr [rsp - 120]
	vmovups zmm0, zmmword ptr [rsp - 88]
	vmovups zmm2, zmmword ptr [rsp + 40]
	vmovups zmmword ptr [rax + 64], zmm1
	vmovups zmm1, zmmword ptr [rsp + 104]
	vmovups zmmword ptr [rax], zmm0
	vmovups zmmword ptr [rax + 128], zmm2
	vmovups zmmword ptr [rax + 192], zmm1
	add rsp, 168
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
