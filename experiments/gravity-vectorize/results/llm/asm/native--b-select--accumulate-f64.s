<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
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
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	mov qword ptr [rsp], rcx
	movabs rcx, 576460752303423480
	cmp rax, r14
	cmovb r14, rax
	lea rax, [rcx + 7]
	movabs rcx, 9223372036854775801
	mov rbx, r14
	shl rbx, 5
	cmp r14, rax
	setbe al
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB144_1
	call alloc::raw_vec::capacity_overflow
.LBB144_1:
	mov r15, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 56]
	test rbx, rbx
	je .LBB144_2
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov rbp, rdi
	mov rdi, rbx
	mov r13, rdx
	call rax
	mov rdi, rbp
	mov rdx, r13
	mov rcx, r14
	test rax, rax
	je .LBB144_44
	mov qword ptr [rsp + 16], rcx
	test r14, r14
	jne .LBB144_5
	jmp .LBB144_28
.LBB144_2:
	mov eax, 8
	xor ecx, ecx
	mov qword ptr [rsp + 16], rcx
	test r14, r14
	je .LBB144_28
.LBB144_5:
	cmp r14, 8
	jae .LBB144_7
	xor r11d, r11d
.LBB144_12:
	mov rsi, r14
	and rsi, 3
	mov r9, r11
	je .LBB144_17
	vmovsd xmm0, qword ptr [rip + .LCPI144_0]
	mov rcx, r11
	shl rcx, 5
	mov r8, r11
	shl r8, 4
	shl esi, 4
	xor r10d, r10d
	mov r9, r11
	lea rcx, [rcx + rax + 24]
	add r8, r15
	jmp .LBB144_14
	.p2align	4
.LBB144_16:
	vmovupd xmm3, xmmword ptr [r8 + r10]
	inc r9
	vmovupd xmmword ptr [rcx + 2*r10 - 24], xmm3
	vmovsd qword ptr [rcx + 2*r10 - 8], xmm2
	vmovsd qword ptr [rcx + 2*r10], xmm1
	add r10, 16
	cmp rsi, r10
	je .LBB144_17
.LBB144_14:
	vmovsd xmm1, qword ptr [r12 + 8*r9]
	vxorpd xmm2, xmm2, xmm2
	vucomisd xmm1, xmm2
	jne .LBB144_15
	jnp .LBB144_16
.LBB144_15:
	vdivsd xmm2, xmm0, xmm1
	jmp .LBB144_16
.LBB144_17:
	sub r11, r14
	cmp r11, -4
	ja .LBB144_28
	vmovsd xmm0, qword ptr [rip + .LCPI144_0]
	mov rcx, r14
	mov rsi, r9
	shl rsi, 5
	sub rcx, r9
	lea r8, [r12 + 8*r9]
	shl r9, 4
	add r15, r9
	add rsi, rax
	mov r9d, 12
	jmp .LBB144_19
	.p2align	4
.LBB144_27:
	vmovupd xmm3, xmmword ptr [r15 + 4*r9]
	vmovupd xmmword ptr [rsi + 8*r9], xmm3
	vmovsd qword ptr [rsi + 8*r9 + 16], xmm1
	vmovsd qword ptr [rsi + 8*r9 + 24], xmm2
	add r9, 16
	add rcx, -4
	je .LBB144_28
.LBB144_19:
	vmovsd xmm2, qword ptr [r8 + 2*r9 - 24]
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm3, xmm3, xmm3
	vucomisd xmm2, xmm1
	jne .LBB144_20
	jnp .LBB144_21
.LBB144_20:
	vdivsd xmm3, xmm0, xmm2
.LBB144_21:
	vmovups xmm4, xmmword ptr [r15 + 4*r9 - 48]
	vmovups xmmword ptr [rsi + 8*r9 - 96], xmm4
	vmovsd qword ptr [rsi + 8*r9 - 80], xmm3
	vmovsd qword ptr [rsi + 8*r9 - 72], xmm2
	vmovsd xmm2, qword ptr [r8 + 2*r9 - 16]
	vucomisd xmm2, xmm1
	jne .LBB144_22
	jnp .LBB144_23
.LBB144_22:
	vdivsd xmm1, xmm0, xmm2
.LBB144_23:
	vmovupd xmm3, xmmword ptr [r15 + 4*r9 - 32]
	vmovupd xmmword ptr [rsi + 8*r9 - 64], xmm3
	vmovsd qword ptr [rsi + 8*r9 - 48], xmm1
	vmovsd qword ptr [rsi + 8*r9 - 40], xmm2
	vxorpd xmm1, xmm1, xmm1
	vxorpd xmm3, xmm3, xmm3
	vmovsd xmm2, qword ptr [r8 + 2*r9 - 8]
	vucomisd xmm2, xmm1
	jne .LBB144_24
	jnp .LBB144_25
.LBB144_24:
	vdivsd xmm3, xmm0, xmm2
.LBB144_25:
	vmovupd xmm4, xmmword ptr [r15 + 4*r9 - 16]
	vmovupd xmmword ptr [rsi + 8*r9 - 32], xmm4
	vmovsd qword ptr [rsi + 8*r9 - 16], xmm3
	vmovsd qword ptr [rsi + 8*r9 - 8], xmm2
	vmovsd xmm2, qword ptr [r8 + 2*r9]
	vucomisd xmm2, xmm1
	jne .LBB144_26
	jnp .LBB144_27
.LBB144_26:
	vdivsd xmm1, xmm0, xmm2
	jmp .LBB144_27
.LBB144_7:
	mov rsi, r14
	shl rsi, 4
	add rbx, rax
	lea rcx, [r12 + 8*r14]
	add rsi, r15
	cmp rax, rsi
	setb r8b
	cmp r15, rbx
	setb r9b
	cmp rax, rcx
	setb cl
	cmp r12, rbx
	setb sil
	xor r11d, r11d
	test r8b, r9b
	jne .LBB144_12
	and cl, sil
	jne .LBB144_12
	vbroadcastsd zmm1, qword ptr [rip + .LCPI144_0]
	vmovapd zmm2, zmmword ptr [rip + .LCPI144_1]
	vmovapd zmm3, zmmword ptr [rip + .LCPI144_2]
	vmovapd zmm4, zmmword ptr [rip + .LCPI144_3]
	vmovapd zmm5, zmmword ptr [rip + .LCPI144_4]
	vmovapd zmm6, zmmword ptr [rip + .LCPI144_5]
	vmovapd zmm7, zmmword ptr [rip + .LCPI144_6]
	vmovapd zmm8, zmmword ptr [rip + .LCPI144_7]
	vmovapd zmm9, zmmword ptr [rip + .LCPI144_8]
	movabs r11, 576460752303423480
	xor ecx, ecx
	vxorpd xmm0, xmm0, xmm0
	and r11, r14
	mov rsi, r11
	.p2align	4
.LBB144_10:
	vmovupd zmm12, zmmword ptr [r12 + 2*rcx]
	vmovupd zmm10, zmmword ptr [r15 + 4*rcx]
	vmovupd zmm11, zmmword ptr [r15 + 4*rcx + 64]
	vcmpneqpd k1, zmm12, zmm0
	vmovapd zmm14, zmm10
	vmovapd zmm15, zmm11
	vdivpd zmm13 {k1} {z}, zmm1, zmm12
	vpermt2pd zmm14, zmm2, zmm13
	vpermt2pd zmm10, zmm4, zmm13
	vpermt2pd zmm15, zmm6, zmm13
	vpermt2pd zmm11, zmm8, zmm13
	vpermt2pd zmm14, zmm3, zmm12
	vpermt2pd zmm10, zmm5, zmm12
	vpermt2pd zmm15, zmm7, zmm12
	vpermt2pd zmm11, zmm9, zmm12
	vmovupd zmmword ptr [rax + 8*rcx + 128], zmm11
	vmovupd zmmword ptr [rax + 8*rcx + 192], zmm15
	vmovupd zmmword ptr [rax + 8*rcx], zmm10
	vmovupd zmmword ptr [rax + 8*rcx + 64], zmm14
	add rcx, 32
	add rsi, -8
	jne .LBB144_10
	cmp r14, r11
	jne .LBB144_12
.LBB144_28:
	mov qword ptr [rsp + 8], rax
	cmp qword ptr [rsp], 0
	je .LBB144_31
	mov r12, qword ptr [rsp]
	vmovddup xmm0, qword ptr [rdi + 8]
	vmovsd xmm1, qword ptr [rdi]
	movabs rax, 1152921504606846975
	lea rdi, [r14 - 1]
	mov r11b, 60
	xor ebx, ebx
	vxorpd xmm2, xmm2, xmm2
	mov r15, r14
	lea r9, [r12 + rax]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB144_30
	.p2align	4
.LBB144_39:
	vmovsd xmm5, qword ptr [rax + rcx + 24]
	vmulsd xmm8, xmm8, xmm9
	vmulsd xmm6, xmm9, xmm6
	shl rsi, 4
	add rsi, rdx
	vmulsd xmm9, xmm8, xmm4
	vmulsd xmm4, xmm4, xmm6
	vaddsd xmm3, xmm9, xmm3
	vaddsd xmm7, xmm7, xmm4
	vmovsd xmm9, qword ptr [rsi]
	vmulsd xmm4, xmm8, xmm5
	vmovsd xmm8, qword ptr [rsi + 8]
	vmulsd xmm5, xmm5, xmm6
	vsubsd xmm4, xmm9, xmm4
	vsubsd xmm5, xmm8, xmm5
	vmovsd qword ptr [rsi], xmm4
	vmovsd qword ptr [rsi + 8], xmm5
.LBB144_40:
	movabs rcx, 1152921504606846975
	dec r12
	inc rbx
	dec rdi
	vmovsd qword ptr [r13], xmm3
	vmovsd qword ptr [r13 + 8], xmm7
	add r9, rcx
	test r12, r12
	je .LBB144_31
.LBB144_30:
	bzhi r8, r9, r11
	mov rbp, rax
	mov rax, rbx
	mov r10, rbx
	not r10
	cmp rdi, r8
	cmovb r8, rdi
	sub rax, qword ptr [rsp]
	add r10, r14
	not rax
	bzhi rax, rax, r11
	cmp r10, rax
	cmovae r10, rax
	sub r15, 1
	jb .LBB144_31
	mov r13, rdx
	vmovupd xmm3, xmmword ptr [r13]
	vmovsd xmm7, qword ptr [r13 + 8]
	lea rcx, [r12 - 1]
	add rdx, 16
	lea rax, [rbp + 32]
	bzhi rcx, rcx, r11
	cmp r15, rcx
	cmovb rcx, r15
	test rcx, rcx
	je .LBB144_40
	vmulsd xmm5, xmm1, qword ptr [rbp + 16]
	vbroadcastf128 ymm6, xmmword ptr [rbp]
	vmovsd xmm4, qword ptr [rbp + 24]
	cmp r10, 1
	jne .LBB144_41
	xor esi, esi
	jmp .LBB144_37
	.p2align	4
.LBB144_41:
	movabs rcx, 1152921504606846974
	vmovddup xmm7, xmm5
	vmovddup xmm8, xmm4
	xor esi, esi
	and r8, rcx
	mov ecx, 16
	.p2align	4
.LBB144_42:
	vmovupd ymm9, ymmword ptr [rbp + 2*rcx + 32]
	vmovupd ymm10, ymmword ptr [rbp + 2*rcx]
	add rsi, 2
	vperm2f128 ymm11, ymm10, ymm9, 32
	vperm2f128 ymm9, ymm10, ymm9, 49
	vmovupd ymm10, ymmword ptr [r13 + rcx]
	vsubpd ymm11, ymm11, ymm6
	vshufpd ymm9, ymm9, ymm9, 15
	vmulpd ymm12, ymm11, ymm11
	vextractf128 xmm13, ymm12, 1
	vhaddpd xmm12, xmm12, xmm13
	vmovupd xmm13, xmmword ptr [rbp + 2*rcx + 16]
	vunpcklpd xmm13, xmm13, xmmword ptr [rbp + 2*rcx + 48]
	vaddpd xmm12, xmm12, xmm0
	vsqrtpd xmm14, xmm12
	vcmpneqpd k1, xmm12, xmm2
	vmulpd xmm13, xmm13, xmm7
	vmulpd xmm14, xmm12, xmm14
	vdivpd xmm12 {k1} {z}, xmm13, xmm14
	vpermpd ymm12, ymm12, 80
	vmulpd ymm11, ymm11, ymm12
	vmulpd xmm12, xmm8, xmm11
	vmulpd ymm9, ymm9, ymm11
	vaddpd xmm3, xmm12, xmm3
	vextractf128 xmm12, ymm11, 1
	vsubpd ymm9, ymm10, ymm9
	vmulpd xmm12, xmm8, xmm12
	vmovupd ymmword ptr [r13 + rcx], ymm9
	add rcx, 32
	vaddpd xmm3, xmm12, xmm3
	cmp r8, rsi
	jne .LBB144_42
	vshufpd xmm7, xmm3, xmm3, 1
	test r10b, 1
	je .LBB144_40
.LBB144_37:
	mov rcx, rsi
	shl rcx, 5
	vmovsd xmm8, qword ptr [rax + rcx]
	vmovsd xmm9, qword ptr [rax + rcx + 8]
	vsubsd xmm8, xmm8, xmm6
	vshufpd xmm6, xmm6, xmm6, 1
	vsubsd xmm6, xmm9, xmm6
	vmulsd xmm9, xmm8, xmm8
	vmulsd xmm10, xmm6, xmm6
	vaddsd xmm9, xmm9, xmm10
	vaddsd xmm10, xmm9, xmm0
	vxorpd xmm9, xmm9, xmm9
	vucomisd xmm10, xmm9
	jne .LBB144_38
	jnp .LBB144_39
.LBB144_38:
	vsqrtsd xmm9, xmm10, xmm10
	vmulsd xmm5, xmm5, qword ptr [rax + rcx + 16]
	vmulsd xmm9, xmm10, xmm9
	vdivsd xmm9, xmm5, xmm9
	jmp .LBB144_39
.LBB144_31:
	cmp qword ptr [rsp + 16], 0
	je .LBB144_32
	mov rdi, qword ptr [rsp + 8]
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB144_32:
	.cfi_def_cfa_offset 80
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
.LBB144_44:
	.cfi_def_cfa_offset 80
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
