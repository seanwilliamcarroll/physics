<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
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
	push rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	movabs r13, 1152921504606846960
	movabs r8, 9223372036854775805
	cmp rax, r14
	cmovb r14, rax
	lea rax, [r13 + 15]
	mov rbx, r14
	shl rbx, 4
	cmp r14, rax
	setbe al
	cmp rbx, r8
	setb r8b
	test al, r8b
	jne .LBB145_1
	call alloc::raw_vec::capacity_overflow
.LBB145_1:
	mov r15, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 56]
	test rbx, rbx
	je .LBB145_2
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rdi
	mov rdi, rbx
	mov r13, rcx
	mov rbp, rdx
	call rax
	mov rdi, qword ptr [rsp]
	mov rcx, r13
	movabs r13, 1152921504606846960
	mov rdx, rbp
	mov rsi, r14
	test rax, rax
	je .LBB145_54
	test r14, r14
	jne .LBB145_5
	jmp .LBB145_42
.LBB145_2:
	mov eax, 4
	xor esi, esi
	test r14, r14
	je .LBB145_42
.LBB145_5:
	cmp r14, 4
	jae .LBB145_7
	xor r9d, r9d
.LBB145_18:
	mov r10d, r14d
	sub r10d, r9d
	mov r8, r9
	and r10d, 7
	je .LBB145_23
	vmovss xmm0, dword ptr [rip + .LCPI145_0]
	mov r8, r9
	shl r8, 4
	shl r10d, 4
	xor ebx, ebx
	lea r11, [r8 + rax + 12]
	mov r8, r9
	jmp .LBB145_20
	.p2align	4
.LBB145_22:
	vmovsd xmm3, qword ptr [r15 + 8*r8]
	inc r8
	vmovsd qword ptr [r11 + rbx - 12], xmm3
	vmovss dword ptr [r11 + rbx - 4], xmm2
	vmovss dword ptr [r11 + rbx], xmm1
	add rbx, 16
	cmp r10, rbx
	je .LBB145_23
.LBB145_20:
	vmovss xmm1, dword ptr [r12 + 4*r8]
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm1, xmm2
	jne .LBB145_21
	jnp .LBB145_22
.LBB145_21:
	vdivss xmm2, xmm0, xmm1
	jmp .LBB145_22
.LBB145_23:
	sub r9, r14
	cmp r9, -8
	jbe .LBB145_24
.LBB145_42:
	test rcx, rcx
	je .LBB145_45
	vmovss xmm0, dword ptr [rdi]
	vmovss xmm1, dword ptr [rdi + 4]
	lea rdi, [rcx - 1]
	lea r8, [r14 - 1]
	vxorps xmm2, xmm2, xmm2
	mov r9, rax
	jmp .LBB145_44
	.p2align	4
.LBB145_50:
	dec rdi
	dec r8
	vmovlps qword ptr [rdx], xmm3
	mov rdx, r11
	mov r9, r10
	test rcx, rcx
	je .LBB145_45
.LBB145_44:
	cmp rdi, r8
	mov rbx, r8
	cmovb rbx, rdi
	sub r14, 1
	jb .LBB145_45
	vmulss xmm5, xmm0, dword ptr [r9 + 8]
	vbroadcastss xmm6, dword ptr [r9 + 12]
	vmovsd xmm4, qword ptr [r9]
	vmovsd xmm3, qword ptr [rdx]
	dec rcx
	lea r11, [rdx + 8]
	lea r10, [r9 + 16]
	xor r15d, r15d
.LBB145_48:
	mov r12, r15
	shl r12, 4
	cmp r15, rbx
	mov rbp, rbx
	cmova rbp, r15
	.p2align	4
.LBB145_49:
	cmp rbp, r15
	je .LBB145_50
	vmovsd xmm7, qword ptr [r9 + r12 + 16]
	add r12, 16
	mov r13, r15
	inc r15
	vsubps xmm7, xmm7, xmm4
	vmulps xmm8, xmm7, xmm7
	vmovshdup xmm9, xmm8
	vaddss xmm8, xmm8, xmm9
	vaddss xmm8, xmm8, xmm1
	vucomiss xmm8, xmm2
	jne .LBB145_52
	jnp .LBB145_49
.LBB145_52:
	vsqrtss xmm10, xmm8, xmm8
	vmulss xmm9, xmm5, dword ptr [r9 + r12 + 8]
	vmulss xmm8, xmm8, xmm10
	vdivss xmm8, xmm9, xmm8
	vmovsd xmm9, qword ptr [r11 + 8*r13]
	vbroadcastss xmm8, xmm8
	vmulps xmm7, xmm8, xmm7
	vmulps xmm8, xmm6, xmm7
	vmulps xmm7, xmm7, dword ptr [r9 + r12 + 12]{1to4}
	vaddps xmm3, xmm8, xmm3
	vsubps xmm7, xmm9, xmm7
	vmovlps qword ptr [r11 + 8*r13], xmm7
	jmp .LBB145_48
.LBB145_45:
	test rsi, rsi
	je .LBB145_46
	mov rdi, rax
	add rsp, 8
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
.LBB145_46:
	.cfi_def_cfa_offset 64
	add rsp, 8
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
.LBB145_7:
	.cfi_def_cfa_offset 64
	lea r8, [r15 + 8*r14]
	add rbx, rax
	lea r9, [r12 + 4*r14]
	cmp rax, r8
	setb r11b
	cmp r15, rbx
	setb bpl
	cmp rax, r9
	setb r8b
	cmp r12, rbx
	setb r10b
	xor r9d, r9d
	test r11b, bpl
	jne .LBB145_18
	and r8b, r10b
	jne .LBB145_18
	cmp r14, 16
	jae .LBB145_11
	xor r9d, r9d
	jmp .LBB145_15
.LBB145_24:
	vmovss xmm0, dword ptr [rip + .LCPI145_0]
	mov r9, r8
	shl r9, 4
	lea r9, [r9 + rax + 124]
	jmp .LBB145_25
	.p2align	4
.LBB145_41:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 56]
	add r8, 8
	vmovsd qword ptr [r9 - 12], xmm3
	vmovss dword ptr [r9 - 4], xmm1
	vmovss dword ptr [r9], xmm2
	sub r9, -128
	cmp r14, r8
	je .LBB145_42
.LBB145_25:
	vmovss xmm2, dword ptr [r12 + 4*r8]
	vxorps xmm1, xmm1, xmm1
	vxorps xmm3, xmm3, xmm3
	vucomiss xmm2, xmm1
	jne .LBB145_26
	jnp .LBB145_27
.LBB145_26:
	vdivss xmm3, xmm0, xmm2
.LBB145_27:
	vmovsd xmm4, qword ptr [r15 + 8*r8]
	vmovsd qword ptr [r9 - 124], xmm4
	vmovss dword ptr [r9 - 116], xmm3
	vmovss dword ptr [r9 - 112], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 4]
	vucomiss xmm2, xmm1
	jne .LBB145_28
	jnp .LBB145_29
.LBB145_28:
	vdivss xmm1, xmm0, xmm2
.LBB145_29:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 8]
	vmovsd qword ptr [r9 - 108], xmm3
	vmovss dword ptr [r9 - 100], xmm1
	vmovss dword ptr [r9 - 96], xmm2
	vxorps xmm1, xmm1, xmm1
	vxorps xmm3, xmm3, xmm3
	vmovss xmm2, dword ptr [r12 + 4*r8 + 8]
	vucomiss xmm2, xmm1
	jne .LBB145_30
	jnp .LBB145_31
.LBB145_30:
	vdivss xmm3, xmm0, xmm2
.LBB145_31:
	vmovsd xmm4, qword ptr [r15 + 8*r8 + 16]
	vmovsd qword ptr [r9 - 92], xmm4
	vmovss dword ptr [r9 - 84], xmm3
	vmovss dword ptr [r9 - 80], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 12]
	vucomiss xmm2, xmm1
	jne .LBB145_32
	jnp .LBB145_33
.LBB145_32:
	vdivss xmm1, xmm0, xmm2
.LBB145_33:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 24]
	vmovsd qword ptr [r9 - 76], xmm3
	vmovss dword ptr [r9 - 68], xmm1
	vmovss dword ptr [r9 - 64], xmm2
	vxorps xmm1, xmm1, xmm1
	vxorps xmm3, xmm3, xmm3
	vmovss xmm2, dword ptr [r12 + 4*r8 + 16]
	vucomiss xmm2, xmm1
	jne .LBB145_34
	jnp .LBB145_35
.LBB145_34:
	vdivss xmm3, xmm0, xmm2
.LBB145_35:
	vmovsd xmm4, qword ptr [r15 + 8*r8 + 32]
	vmovsd qword ptr [r9 - 60], xmm4
	vmovss dword ptr [r9 - 52], xmm3
	vmovss dword ptr [r9 - 48], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 20]
	vucomiss xmm2, xmm1
	jne .LBB145_36
	jnp .LBB145_37
.LBB145_36:
	vdivss xmm1, xmm0, xmm2
.LBB145_37:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 40]
	vmovsd qword ptr [r9 - 44], xmm3
	vmovss dword ptr [r9 - 36], xmm1
	vmovss dword ptr [r9 - 32], xmm2
	vxorps xmm1, xmm1, xmm1
	vxorps xmm3, xmm3, xmm3
	vmovss xmm2, dword ptr [r12 + 4*r8 + 24]
	vucomiss xmm2, xmm1
	jne .LBB145_38
	jnp .LBB145_39
.LBB145_38:
	vdivss xmm3, xmm0, xmm2
.LBB145_39:
	vmovsd xmm4, qword ptr [r15 + 8*r8 + 48]
	vmovsd qword ptr [r9 - 28], xmm4
	vmovss dword ptr [r9 - 20], xmm3
	vmovss dword ptr [r9 - 16], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 28]
	vucomiss xmm2, xmm1
	jne .LBB145_40
	jnp .LBB145_41
.LBB145_40:
	vdivss xmm1, xmm0, xmm2
	jmp .LBB145_41
.LBB145_11:
	vbroadcastss zmm1, dword ptr [rip + .LCPI145_0]
	vmovaps zmm2, zmmword ptr [rip + .LCPI145_1]
	vmovaps zmm3, zmmword ptr [rip + .LCPI145_2]
	vmovaps zmm4, zmmword ptr [rip + .LCPI145_3]
	vmovaps zmm5, zmmword ptr [rip + .LCPI145_4]
	vmovaps zmm6, zmmword ptr [rip + .LCPI145_5]
	vmovaps zmm7, zmmword ptr [rip + .LCPI145_6]
	vmovaps zmm8, zmmword ptr [rip + .LCPI145_7]
	vmovaps zmm9, zmmword ptr [rip + .LCPI145_8]
	mov r9, r14
	and r9, r13
	xor r8d, r8d
	vxorps xmm0, xmm0, xmm0
	mov r10, rax
	.p2align	4
.LBB145_12:
	vmovups zmm12, zmmword ptr [r12 + 4*r8]
	vmovups zmm10, zmmword ptr [r15 + 8*r8]
	vmovups zmm11, zmmword ptr [r15 + 8*r8 + 64]
	add r8, 16
	vcmpneqps k1, zmm12, zmm0
	vmovaps zmm14, zmm10
	vmovaps zmm15, zmm11
	vdivps zmm13 {k1} {z}, zmm1, zmm12
	vpermt2ps zmm14, zmm2, zmm13
	vpermt2ps zmm10, zmm4, zmm13
	vpermt2ps zmm15, zmm6, zmm13
	vpermt2ps zmm11, zmm8, zmm13
	vpermt2ps zmm14, zmm3, zmm12
	vpermt2ps zmm10, zmm5, zmm12
	vpermt2ps zmm15, zmm7, zmm12
	vpermt2ps zmm11, zmm9, zmm12
	vmovups zmmword ptr [r10 + 128], zmm11
	vmovups zmmword ptr [r10 + 192], zmm15
	vmovups zmmword ptr [r10], zmm10
	vmovups zmmword ptr [r10 + 64], zmm14
	add r10, 256
	cmp r9, r8
	jne .LBB145_12
	cmp r14, r9
	je .LBB145_42
	test r14b, 12
	je .LBB145_18
.LBB145_15:
	vbroadcastss xmm1, dword ptr [rip + .LCPI145_0]
	vmovaps zmm2, zmmword ptr [rip + .LCPI145_9]
	mov r8, r9
	mov r10, r8
	shl r10, 4
	add r13, 12
	vxorps xmm0, xmm0, xmm0
	mov r9, r13
	and r9, r14
	add r10, rax
	.p2align	4
.LBB145_16:
	vmovups xmm4, xmmword ptr [r12 + 4*r8]
	vmovups ymm3, ymmword ptr [r15 + 8*r8]
	add r8, 4
	vcmpneqps k1, xmm4, xmm0
	vdivps xmm5 {k1} {z}, xmm1, xmm4
	vinsertf128 ymm4, ymm5, xmm4, 1
	vpermt2ps zmm3, zmm2, zmm4
	vmovups zmmword ptr [r10], zmm3
	add r10, 64
	cmp r9, r8
	jne .LBB145_16
	cmp r14, r9
	jne .LBB145_18
	jmp .LBB145_42
.LBB145_54:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
