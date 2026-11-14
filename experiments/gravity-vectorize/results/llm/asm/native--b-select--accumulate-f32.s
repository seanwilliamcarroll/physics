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
	sub rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r11, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 64]
	movabs r14, 1152921504606846960
	movabs r8, 9223372036854775805
	cmp rax, r11
	cmovb r11, rax
	lea rax, [r14 + 15]
	mov rbx, r11
	shl rbx, 4
	cmp r11, rax
	setbe al
	cmp rbx, r8
	setb r8b
	test al, r8b
	jne .LBB145_1
	call alloc::raw_vec::capacity_overflow
.LBB145_1:
	mov r15, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 56]
	mov qword ptr [rsp], r11
	test rbx, rbx
	je .LBB145_2
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov r14, rdi
	mov rdi, rbx
	mov rbp, rcx
	mov r13, rdx
	call rax
	mov r11, qword ptr [rsp]
	mov rdi, r14
	movabs r14, 1152921504606846960
	mov rdx, r13
	mov rcx, rbp
	mov rsi, r11
	test rax, rax
	je .LBB145_58
	mov qword ptr [rsp + 16], rsi
	test r11, r11
	jne .LBB145_5
	jmp .LBB145_42
.LBB145_2:
	mov eax, 4
	xor esi, esi
	mov qword ptr [rsp + 16], rsi
	test r11, r11
	je .LBB145_42
.LBB145_5:
	cmp r11, 4
	jae .LBB145_7
	xor r9d, r9d
.LBB145_18:
	mov ebx, r11d
	sub ebx, r9d
	mov r8, r9
	and ebx, 7
	je .LBB145_23
	vmovss xmm0, dword ptr [rip + .LCPI145_0]
	mov rsi, r9
	shl rsi, 4
	shl ebx, 4
	xor r10d, r10d
	mov r8, r9
	lea rsi, [rsi + rax + 12]
	jmp .LBB145_20
	.p2align	4
.LBB145_22:
	vmovsd xmm3, qword ptr [r15 + 8*r8]
	inc r8
	vmovsd qword ptr [rsi + r10 - 12], xmm3
	vmovss dword ptr [rsi + r10 - 4], xmm2
	vmovss dword ptr [rsi + r10], xmm1
	add r10, 16
	cmp rbx, r10
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
	sub r9, r11
	cmp r9, -8
	jbe .LBB145_24
.LBB145_42:
	mov qword ptr [rsp + 8], rax
	test rcx, rcx
	je .LBB145_45
	vbroadcastss xmm0, dword ptr [rdi + 4]
	vmovss xmm1, dword ptr [rdi]
	mov rax, qword ptr [rsp + 8]
	mov r12, qword ptr [rsp]
	movabs rsi, 2305843009213693951
	mov bl, 61
	xor r15d, r15d
	vxorps xmm2, xmm2, xmm2
	mov r13, rcx
	lea r10, [rcx + rsi]
	lea r14, [rax + 16]
	lea r8, [r12 - 1]
	jmp .LBB145_44
	.p2align	4
.LBB145_53:
	vmovss xmm5, dword ptr [rax + rsi + 12]
	vmulss xmm8, xmm8, xmm9
	vmulss xmm6, xmm9, xmm6
	vmulss xmm9, xmm8, xmm4
	vmulss xmm4, xmm4, xmm6
	vaddss xmm3, xmm9, xmm3
	vaddss xmm7, xmm7, xmm4
	vmovss xmm9, dword ptr [rdx + 8*r9]
	vmulss xmm4, xmm8, xmm5
	vmovss xmm8, dword ptr [rdx + 8*r9 + 4]
	vmulss xmm5, xmm5, xmm6
	vsubss xmm4, xmm9, xmm4
	vsubss xmm5, xmm8, xmm5
	vmovss dword ptr [rdx + 8*r9], xmm4
	vmovss dword ptr [rdx + 8*r9 + 4], xmm5
.LBB145_54:
	movabs rsi, 2305843009213693951
	dec r13
	inc r15
	add r14, 16
	dec r8
	vmovss dword ptr [rbp], xmm3
	vmovss dword ptr [rbp + 4], xmm7
	add r10, rsi
	test r13, r13
	je .LBB145_45
.LBB145_44:
	bzhi rsi, r10, rbx
	mov r11, r15
	not r11
	mov rdi, rax
	mov rax, r15
	cmp r8, rsi
	cmovb rsi, r8
	add r11, qword ptr [rsp]
	sub rax, rcx
	not rax
	bzhi rax, rax, rbx
	cmp r11, rax
	cmovae r11, rax
	sub r12, 1
	jb .LBB145_45
	mov rbp, rdx
	vmovsd xmm3, qword ptr [rbp]
	vmovss xmm7, dword ptr [rbp + 4]
	lea r9, [r13 - 1]
	add rdx, 8
	lea rax, [rdi + 16]
	bzhi r9, r9, rbx
	cmp r12, r9
	cmovb r9, r12
	test r9, r9
	je .LBB145_54
	vmulss xmm5, xmm1, dword ptr [rdi + 8]
	vmovddup xmm6, qword ptr [rdi]
	vmovss xmm4, dword ptr [rdi + 12]
	cmp r11, 1
	jne .LBB145_55
	xor r9d, r9d
	jmp .LBB145_51
	.p2align	4
.LBB145_55:
	movabs rdi, 2305843009213693950
	vbroadcastss xmm7, xmm5
	vbroadcastss xmm8, xmm4
	xor r9d, r9d
	and rsi, rdi
	mov rdi, r14
	.p2align	4
.LBB145_56:
	vmovups xmm9, xmmword ptr [rdi]
	vmovups xmm10, xmmword ptr [rdi + 16]
	add rdi, 32
	vmovlhps xmm11, xmm9, xmm10
	vunpckhps xmm13, xmm9, xmm10
	vshufps xmm9, xmm9, xmm10, 255
	vmovups xmm10, xmmword ptr [rbp + 8*r9 + 8]
	vsubps xmm11, xmm11, xmm6
	vmulps xmm13, xmm13, xmm7
	vmulps xmm12, xmm11, xmm11
	vhaddps xmm12, xmm12, xmm12
	vaddps xmm12, xmm12, xmm0
	vsqrtps xmm14, xmm12
	vcmpneqps k1, xmm12, xmm2
	vmulps xmm14, xmm12, xmm14
	vdivps xmm12 {k1} {z}, xmm13, xmm14
	vshufps xmm12, xmm12, xmm12, 80
	vmulps xmm11, xmm11, xmm12
	vmulps xmm9, xmm9, xmm11
	vsubps xmm9, xmm10, xmm9
	vmovups xmmword ptr [rbp + 8*r9 + 8], xmm9
	vmulps xmm9, xmm8, xmm11
	add r9, 2
	vaddps xmm3, xmm9, xmm3
	vshufpd xmm9, xmm11, xmm11, 1
	vmulps xmm9, xmm8, xmm9
	vaddps xmm3, xmm9, xmm3
	cmp rsi, r9
	jne .LBB145_56
	vmovshdup xmm7, xmm3
	test r11b, 1
	je .LBB145_54
.LBB145_51:
	mov rsi, r9
	shl rsi, 4
	vmovss xmm8, dword ptr [rax + rsi]
	vmovss xmm9, dword ptr [rax + rsi + 4]
	vsubss xmm8, xmm8, xmm6
	vmovshdup xmm6, xmm6
	vsubss xmm6, xmm9, xmm6
	vmulss xmm9, xmm8, xmm8
	vmulss xmm10, xmm6, xmm6
	vaddss xmm9, xmm9, xmm10
	vaddss xmm10, xmm9, xmm0
	vxorps xmm9, xmm9, xmm9
	vucomiss xmm10, xmm9
	jne .LBB145_52
	jnp .LBB145_53
.LBB145_52:
	vsqrtss xmm9, xmm10, xmm10
	vmulss xmm5, xmm5, dword ptr [rax + rsi + 8]
	vmulss xmm9, xmm10, xmm9
	vdivss xmm9, xmm5, xmm9
	jmp .LBB145_53
.LBB145_45:
	cmp qword ptr [rsp + 16], 0
	je .LBB145_46
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
.LBB145_46:
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
.LBB145_7:
	.cfi_def_cfa_offset 80
	lea r8, [r15 + 8*r11]
	add rbx, rax
	lea rsi, [r12 + 4*r11]
	cmp rax, r8
	setb r8b
	cmp r15, rbx
	setb r10b
	cmp rax, rsi
	setb bpl
	cmp r12, rbx
	setb sil
	xor r9d, r9d
	test r8b, r10b
	jne .LBB145_18
	and bpl, sil
	jne .LBB145_18
	cmp r11, 16
	jae .LBB145_11
	xor r9d, r9d
	jmp .LBB145_15
.LBB145_24:
	vmovss xmm0, dword ptr [rip + .LCPI145_0]
	mov rsi, r8
	shl rsi, 4
	lea rsi, [rsi + rax + 124]
	jmp .LBB145_25
	.p2align	4
.LBB145_41:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 56]
	add r8, 8
	vmovsd qword ptr [rsi - 12], xmm3
	vmovss dword ptr [rsi - 4], xmm1
	vmovss dword ptr [rsi], xmm2
	sub rsi, -128
	cmp r11, r8
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
	vmovsd qword ptr [rsi - 124], xmm4
	vmovss dword ptr [rsi - 116], xmm3
	vmovss dword ptr [rsi - 112], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 4]
	vucomiss xmm2, xmm1
	jne .LBB145_28
	jnp .LBB145_29
.LBB145_28:
	vdivss xmm1, xmm0, xmm2
.LBB145_29:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 8]
	vmovsd qword ptr [rsi - 108], xmm3
	vmovss dword ptr [rsi - 100], xmm1
	vmovss dword ptr [rsi - 96], xmm2
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
	vmovsd qword ptr [rsi - 92], xmm4
	vmovss dword ptr [rsi - 84], xmm3
	vmovss dword ptr [rsi - 80], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 12]
	vucomiss xmm2, xmm1
	jne .LBB145_32
	jnp .LBB145_33
.LBB145_32:
	vdivss xmm1, xmm0, xmm2
.LBB145_33:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 24]
	vmovsd qword ptr [rsi - 76], xmm3
	vmovss dword ptr [rsi - 68], xmm1
	vmovss dword ptr [rsi - 64], xmm2
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
	vmovsd qword ptr [rsi - 60], xmm4
	vmovss dword ptr [rsi - 52], xmm3
	vmovss dword ptr [rsi - 48], xmm2
	vmovss xmm2, dword ptr [r12 + 4*r8 + 20]
	vucomiss xmm2, xmm1
	jne .LBB145_36
	jnp .LBB145_37
.LBB145_36:
	vdivss xmm1, xmm0, xmm2
.LBB145_37:
	vmovsd xmm3, qword ptr [r15 + 8*r8 + 40]
	vmovsd qword ptr [rsi - 44], xmm3
	vmovss dword ptr [rsi - 36], xmm1
	vmovss dword ptr [rsi - 32], xmm2
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
	vmovsd qword ptr [rsi - 28], xmm4
	vmovss dword ptr [rsi - 20], xmm3
	vmovss dword ptr [rsi - 16], xmm2
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
	mov r9, r11
	and r9, r14
	xor r8d, r8d
	vxorps xmm0, xmm0, xmm0
	mov rsi, rax
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
	vmovups zmmword ptr [rsi + 128], zmm11
	vmovups zmmword ptr [rsi + 192], zmm15
	vmovups zmmword ptr [rsi], zmm10
	vmovups zmmword ptr [rsi + 64], zmm14
	add rsi, 256
	cmp r9, r8
	jne .LBB145_12
	cmp r11, r9
	je .LBB145_42
	test r11b, 12
	je .LBB145_18
.LBB145_15:
	vbroadcastss xmm1, dword ptr [rip + .LCPI145_0]
	vmovaps zmm2, zmmword ptr [rip + .LCPI145_9]
	mov r8, r9
	mov rsi, r8
	shl rsi, 4
	add r14, 12
	vxorps xmm0, xmm0, xmm0
	mov r9, r14
	and r9, r11
	add rsi, rax
	.p2align	4
.LBB145_16:
	vmovups xmm4, xmmword ptr [r12 + 4*r8]
	vmovups ymm3, ymmword ptr [r15 + 8*r8]
	add r8, 4
	vcmpneqps k1, xmm4, xmm0
	vdivps xmm5 {k1} {z}, xmm1, xmm4
	vinsertf128 ymm4, ymm5, xmm4, 1
	vpermt2ps zmm3, zmm2, zmm4
	vmovups zmmword ptr [rsi], zmm3
	add rsi, 64
	cmp r9, r8
	jne .LBB145_16
	cmp r11, r9
	jne .LBB145_18
	jmp .LBB145_42
.LBB145_58:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
