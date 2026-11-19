<swarm::grid::Grid>::fill:
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
	sub rsp, 88
	.cfi_def_cfa_offset 144
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov qword ptr [rsp + 24], r8
	mov qword ptr [rsp + 64], rcx
	mov r12, rdx
	mov rbp, rdi
	mov rbx, qword ptr [rdi + 80]
	imul rbx, qword ptr [rdi + 72]
	mov qword ptr [rsp + 56], rsi
	mov qword ptr [rdi + 16], 0
	mov r13, rbx
	inc r13
	jne .LBB1935_2
	xor r8d, r8d
	jmp .LBB1935_8
.LBB1935_2:
	cmp r13, qword ptr [rbp]
	ja .LBB1935_4
	xor r8d, r8d
	mov r14, qword ptr [rbp + 8]
	lea rdi, [r14 + 4*r8]
	test rbx, rbx
	je .LBB1935_7
.LBB1935_6:
	lea rdx, [4*r13 - 4]
	xor esi, esi
	mov r15, r8
	call qword ptr [rip + memset@GOTPCREL]
	mov r8, r15
	add r13, r15
	lea rdi, [r14 + 4*r13]
	add rdi, -4
	add r8, rbx
.LBB1935_7:
	mov dword ptr [rdi], 0
	inc r8
.LBB1935_8:
	mov qword ptr [rbp + 16], r8
	mov r15, qword ptr [rsp + 24]
	cmp r15, r12
	cmovae r15, r12
	mov qword ptr [rsp + 24], r15
	test r15, r15
	mov qword ptr [rsp + 32], r8
	je .LBB1935_9
	mov qword ptr [rsp + 72], r12
	mov rax, qword ptr [rbp + 8]
	mov qword ptr [rsp + 16], rax
	mov r13, qword ptr [rbp + 72]
	movss xmm0, dword ptr [rbp + 88]
	movss dword ptr [rsp + 12], xmm0
	xor r14d, r14d
	mov qword ptr [rsp + 40], r13
	sub r13, 1
	cmovb r13, r14
	mov qword ptr [rsp + 80], rbp
	mov r12, qword ptr [rbp + 80]
	sub r12, 1
	cmovb r12, r14
	mov rbp, -1
	xor ebx, ebx
	jmp .LBB1935_20
	.p2align	4
.LBB1935_26:
	inc rbx
	cmp qword ptr [rsp + 24], rbx
	je .LBB1935_27
.LBB1935_20:
	mov rax, qword ptr [rsp + 56]
	movss xmm0, dword ptr [rax + 4*rbx]
	mulss xmm0, dword ptr [rsp + 12]
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	call qword ptr [rip + floorf@GOTPCREL]
	movss dword ptr [rsp + 48], xmm0
	cvtss2sd xmm0, xmm0
	cvttsd2si rcx, xmm0
	mov rdx, rcx
	sar rdx, 63
	movapd xmm1, xmm0
	subsd xmm1, qword ptr [rip + .LCPI1935_0]
	cvttsd2si rax, xmm1
	and rax, rdx
	or rax, rcx
	xorpd xmm1, xmm1
	ucomisd xmm0, xmm1
	cmovb rax, r14
	ucomisd xmm0, qword ptr [rip + .LCPI1935_1]
	cmova rax, rbp
	mov r15, r13
	cmp r13, rax
	jb .LBB1935_22
	mov r15, rax
.LBB1935_22:
	mov rax, qword ptr [rsp + 64]
	movss xmm0, dword ptr [rax + 4*rbx]
	mulss xmm0, dword ptr [rsp + 12]
	xorpd xmm1, xmm1
	maxss xmm0, xmm1
	call qword ptr [rip + floorf@GOTPCREL]
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rdx, rax
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1935_0]
	cvttsd2si rcx, xmm2
	and rcx, rdx
	or rcx, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rcx, r14
	ucomisd xmm1, qword ptr [rip + .LCPI1935_1]
	cmova rcx, rbp
	mov rax, r12
	cmp r12, rcx
	jb .LBB1935_24
	mov rax, rcx
.LBB1935_24:
	movss xmm1, dword ptr [rip + .LCPI1935_2]
	ucomiss xmm0, xmm1
	cmovae rax, r14
	imul rax, qword ptr [rsp + 40]
	inc r15
	movss xmm0, dword ptr [rsp + 48]
	ucomiss xmm0, xmm1
	mov ecx, 1
	cmovae r15, rcx
	add r15, rax
	mov r8, qword ptr [rsp + 32]
	cmp r15, r8
	jae .LBB1935_26
	mov rax, qword ptr [rsp + 16]
	inc dword ptr [rax + 4*r15]
	jmp .LBB1935_26
.LBB1935_27:
	mov rbp, qword ptr [rsp + 80]
	mov r12, qword ptr [rsp + 72]
	test r8, r8
	je .LBB1935_28
.LBB1935_11:
	lea r14, [4*r8]
	lea rdi, [r14 - 4]
	mov rdx, rdi
	shr rdx, 2
	inc rdx
	mov eax, edx
	and eax, 7
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 16]
	cmp rdi, 28
	jb .LBB1935_15
	and rdx, -8
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 16]
	.p2align	4
.LBB1935_13:
	add ecx, dword ptr [rsi]
	mov dword ptr [rsi], ecx
	add ecx, dword ptr [rsi + 4]
	mov dword ptr [rsi + 4], ecx
	add ecx, dword ptr [rsi + 8]
	mov dword ptr [rsi + 8], ecx
	add ecx, dword ptr [rsi + 12]
	mov dword ptr [rsi + 12], ecx
	add ecx, dword ptr [rsi + 16]
	mov dword ptr [rsi + 16], ecx
	add ecx, dword ptr [rsi + 20]
	mov dword ptr [rsi + 20], ecx
	add ecx, dword ptr [rsi + 24]
	mov dword ptr [rsi + 24], ecx
	add ecx, dword ptr [rsi + 28]
	mov dword ptr [rsi + 28], ecx
	add rsi, 32
	add rdx, -8
	jne .LBB1935_13
	test rax, rax
	je .LBB1935_17
.LBB1935_15:
	xor edx, edx
	.p2align	4
.LBB1935_16:
	add ecx, dword ptr [rsi + 4*rdx]
	mov dword ptr [rsi + 4*rdx], ecx
	inc rdx
	cmp rax, rdx
	jne .LBB1935_16
.LBB1935_17:
	mov qword ptr [rbp + 40], 0
	cmp r8, qword ptr [rbp + 24]
	ja .LBB1935_29
	xor ebx, ebx
.LBB1935_30:
	lea rdi, [4*rbx]
	add rdi, qword ptr [rbp + 32]
	mov rsi, qword ptr [rsp + 16]
	mov rdx, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov r8, qword ptr [rsp + 32]
	jmp .LBB1935_31
.LBB1935_9:
	mov rax, qword ptr [rbp + 8]
	mov qword ptr [rsp + 16], rax
	test r8, r8
	jne .LBB1935_11
.LBB1935_28:
	xor ebx, ebx
.LBB1935_31:
	add rbx, r8
	mov qword ptr [rbp + 40], rbx
	mov qword ptr [rbp + 64], 0
	test r12, r12
	je .LBB1935_32
	cmp r12, qword ptr [rbp + 48]
	ja .LBB1935_35
	xor r14d, r14d
	mov rbx, qword ptr [rbp + 56]
	lea rdi, [rbx + 4*r14]
	cmp r12, 1
	je .LBB1935_38
.LBB1935_37:
	lea rdx, [4*r12 - 4]
	xor esi, esi
	call qword ptr [rip + memset@GOTPCREL]
	lea rax, [r14 + r12]
	lea rdi, [rbx + 4*rax]
	add rdi, -4
	add r14, r12
	dec r14
.LBB1935_38:
	mov dword ptr [rdi], 0
	inc r14
	mov qword ptr [rsp + 40], r14
	mov qword ptr [rbp + 64], r14
	cmp qword ptr [rsp + 24], 0
	jne .LBB1935_40
	jmp .LBB1935_50
.LBB1935_32:
	xor r14d, r14d
	mov qword ptr [rsp + 40], r14
	mov qword ptr [rbp + 64], r14
	cmp qword ptr [rsp + 24], 0
	je .LBB1935_50
.LBB1935_40:
	mov rbx, qword ptr [rbp + 72]
	xor r12d, r12d
	mov qword ptr [rsp + 48], rbx
	sub rbx, 1
	cmovb rbx, r12
	mov r14, qword ptr [rbp + 80]
	sub r14, 1
	cmovb r14, r12
	movss xmm0, dword ptr [rbp + 88]
	movss dword ptr [rsp + 12], xmm0
	mov r15, qword ptr [rbp + 32]
	mov rax, qword ptr [rbp + 40]
	mov qword ptr [rsp + 32], rax
	mov rax, qword ptr [rbp + 56]
	mov qword ptr [rsp + 16], rax
	xor r13d, r13d
	jmp .LBB1935_41
	.p2align	4
.LBB1935_48:
	inc ecx
	mov dword ptr [r15 + 4*rax], ecx
.LBB1935_49:
	inc r13
	cmp qword ptr [rsp + 24], r13
	je .LBB1935_50
.LBB1935_41:
	mov rax, qword ptr [rsp + 56]
	movss xmm0, dword ptr [rax + 4*r13]
	mulss xmm0, dword ptr [rsp + 12]
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	call qword ptr [rip + floorf@GOTPCREL]
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rcx, xmm1
	mov rdx, rcx
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1935_0]
	cvttsd2si rax, xmm2
	and rax, rdx
	or rax, rcx
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rax, r12
	ucomisd xmm1, qword ptr [rip + .LCPI1935_1]
	mov rcx, -1
	cmova rax, rcx
	mov rbp, rbx
	cmp rbx, rax
	jb .LBB1935_43
	mov rbp, rax
.LBB1935_43:
	ucomiss xmm0, dword ptr [rip + .LCPI1935_2]
	cmovae rbp, r12
	mov rax, qword ptr [rsp + 64]
	movss xmm0, dword ptr [rax + 4*r13]
	mulss xmm0, dword ptr [rsp + 12]
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	call qword ptr [rip + floorf@GOTPCREL]
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rdx, rax
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1935_0]
	cvttsd2si rcx, xmm2
	and rcx, rdx
	or rcx, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rcx, r12
	ucomisd xmm1, qword ptr [rip + .LCPI1935_1]
	mov rax, -1
	cmova rcx, rax
	mov rax, r14
	cmp r14, rcx
	jb .LBB1935_45
	mov rax, rcx
.LBB1935_45:
	ucomiss xmm0, dword ptr [rip + .LCPI1935_2]
	cmovae rax, r12
	imul rax, qword ptr [rsp + 48]
	add rax, rbp
	cmp rax, qword ptr [rsp + 32]
	jae .LBB1935_49
	mov ecx, dword ptr [r15 + 4*rax]
	cmp qword ptr [rsp + 40], rcx
	jbe .LBB1935_48
	mov rdx, qword ptr [rsp + 16]
	mov dword ptr [rdx + 4*rcx], r13d
	mov ecx, dword ptr [r15 + 4*rax]
	jmp .LBB1935_48
.LBB1935_50:
	add rsp, 88
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
	ret
.LBB1935_29:
	.cfi_def_cfa_offset 144
	lea rdi, [rbp + 24]
	xor esi, esi
	mov rdx, r8
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov rbx, qword ptr [rbp + 40]
	jmp .LBB1935_30
.LBB1935_35:
	lea rdi, [rbp + 48]
	xor esi, esi
	mov rdx, r12
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r14, qword ptr [rbp + 64]
	mov rbx, qword ptr [rbp + 56]
	lea rdi, [rbx + 4*r14]
	cmp r12, 1
	jne .LBB1935_37
	jmp .LBB1935_38
.LBB1935_4:
	mov rdi, rbp
	xor esi, esi
	mov rdx, r13
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r8, qword ptr [rbp + 16]
	mov r14, qword ptr [rbp + 8]
	lea rdi, [r14 + 4*r8]
	test rbx, rbx
	jne .LBB1935_6
	jmp .LBB1935_7
