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
	sub rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, r8
	mov r14, rcx
	mov r10, rdi
	mov r12, qword ptr [rdi + 80]
	imul r12, qword ptr [rdi + 72]
	mov r15, rsi
	mov qword ptr [rdi + 16], 0
	mov r13, r12
	inc r13
	mov qword ptr [rsp], rdi
	mov qword ptr [rsp + 16], rdx
	jne .LBB1935_2
	xor ebp, ebp
	jmp .LBB1935_8
.LBB1935_2:
	cmp r13, qword ptr [r10]
	ja .LBB1935_4
	xor ebp, ebp
	mov rax, qword ptr [r10 + 8]
	lea rdi, [rax + 4*rbp]
	test r12, r12
	je .LBB1935_7
.LBB1935_6:
	lea rdx, [4*r13 - 4]
	xor esi, esi
	mov qword ptr [rsp + 8], rax
	call qword ptr [rip + memset@GOTPCREL]
	mov rdx, qword ptr [rsp + 16]
	mov r10, qword ptr [rsp]
	add r13, rbp
	mov rax, qword ptr [rsp + 8]
	lea rdi, [rax + 4*r13]
	add rdi, -4
	add rbp, r12
.LBB1935_7:
	mov dword ptr [rdi], 0
	inc rbp
.LBB1935_8:
	mov qword ptr [r10 + 16], rbp
	cmp rbx, rdx
	cmovae rbx, rdx
	test rbx, rbx
	je .LBB1935_9
	mov rax, qword ptr [r10 + 8]
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [r10 + 72]
	movss xmm0, dword ptr [r10 + 88]
	xor ecx, ecx
	mov rdx, rax
	sub rdx, 1
	cmovb rdx, rcx
	mov rsi, qword ptr [r10 + 80]
	sub rsi, 1
	cmovb rsi, rcx
	xorps xmm1, xmm1
	movsd xmm2, qword ptr [rip + .LCPI1935_0]
	xorpd xmm3, xmm3
	movsd xmm4, qword ptr [rip + .LCPI1935_1]
	mov rdi, -1
	movss xmm5, dword ptr [rip + .LCPI1935_2]
	mov r8d, 1
	xor r9d, r9d
	jmp .LBB1935_20
	.p2align	4
.LBB1935_26:
	inc r9
	cmp rbx, r9
	je .LBB1935_27
.LBB1935_20:
	movss xmm6, dword ptr [r15 + 4*r9]
	mulss xmm6, xmm0
	maxss xmm6, xmm1
	xorps xmm7, xmm7
	cvtss2sd xmm7, xmm6
	cvttsd2si r10, xmm7
	mov r12, r10
	sar r12, 63
	movapd xmm8, xmm7
	subsd xmm8, xmm2
	cvttsd2si r11, xmm8
	and r11, r12
	or r11, r10
	ucomisd xmm7, xmm3
	cmovb r11, rcx
	ucomisd xmm7, xmm4
	cmova r11, rdi
	mov r10, rdx
	cmp rdx, r11
	jb .LBB1935_22
	mov r10, r11
.LBB1935_22:
	movss xmm7, dword ptr [r14 + 4*r9]
	mulss xmm7, xmm0
	maxss xmm7, xmm1
	xorps xmm8, xmm8
	cvtss2sd xmm8, xmm7
	cvttsd2si r13, xmm8
	mov r11, r13
	sar r11, 63
	movapd xmm9, xmm8
	subsd xmm9, xmm2
	cvttsd2si r12, xmm9
	and r12, r11
	or r12, r13
	ucomisd xmm8, xmm3
	cmovb r12, rcx
	ucomisd xmm8, xmm4
	cmova r12, rdi
	mov r11, rsi
	cmp rsi, r12
	jb .LBB1935_24
	mov r11, r12
.LBB1935_24:
	ucomiss xmm7, xmm5
	cmovae r11, rcx
	imul r11, rax
	inc r10
	ucomiss xmm6, xmm5
	cmovae r10, r8
	add r10, r11
	cmp r10, rbp
	jae .LBB1935_26
	mov r11, qword ptr [rsp + 8]
	inc dword ptr [r11 + 4*r10]
	jmp .LBB1935_26
.LBB1935_27:
	mov r10, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	test rbp, rbp
	je .LBB1935_28
.LBB1935_11:
	lea r13, [4*rbp]
	lea rdi, [r13 - 4]
	mov rdx, rdi
	shr rdx, 2
	inc rdx
	mov eax, edx
	and eax, 7
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 8]
	cmp rdi, 28
	jb .LBB1935_15
	and rdx, -8
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 8]
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
	mov qword ptr [r10 + 40], 0
	cmp rbp, qword ptr [r10 + 24]
	ja .LBB1935_29
	xor r12d, r12d
.LBB1935_30:
	lea rdi, [4*r12]
	add rdi, qword ptr [r10 + 32]
	mov rsi, qword ptr [rsp + 8]
	mov rdx, r13
	call qword ptr [rip + memcpy@GOTPCREL]
	mov r10, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1935_31
.LBB1935_9:
	mov rax, qword ptr [r10 + 8]
	mov qword ptr [rsp + 8], rax
	test rbp, rbp
	jne .LBB1935_11
.LBB1935_28:
	xor r12d, r12d
.LBB1935_31:
	add r12, rbp
	mov qword ptr [r10 + 40], r12
	mov qword ptr [r10 + 64], 0
	test rdx, rdx
	je .LBB1935_32
	cmp rdx, qword ptr [r10 + 48]
	ja .LBB1935_35
	xor ecx, ecx
	mov r12, qword ptr [r10 + 56]
	lea rdi, [r12 + 4*rcx]
	cmp rdx, 1
	je .LBB1935_38
.LBB1935_37:
	mov r13, rdx
	lea rdx, [4*rdx - 4]
	xor esi, esi
	mov rbp, rcx
	call qword ptr [rip + memset@GOTPCREL]
	mov r10, qword ptr [rsp]
	mov rax, rbp
	add rax, r13
	lea rdi, [r12 + 4*rax]
	add rdi, -4
	lea rcx, [1*r13 - 1]
	add rcx, rbp
.LBB1935_38:
	mov dword ptr [rdi], 0
	inc rcx
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [r10 + 64], rcx
	test rbx, rbx
	jne .LBB1935_40
	jmp .LBB1935_50
.LBB1935_32:
	xor ecx, ecx
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [r10 + 64], rcx
	test rbx, rbx
	je .LBB1935_50
.LBB1935_40:
	mov rax, qword ptr [r10 + 72]
	movss xmm0, dword ptr [r10 + 88]
	xor ecx, ecx
	mov rdx, rax
	sub rdx, 1
	cmovb rdx, rcx
	mov r9, qword ptr [r10 + 80]
	sub r9, 1
	cmovb r9, rcx
	mov rdi, qword ptr [r10 + 32]
	mov r8, qword ptr [r10 + 40]
	mov rsi, qword ptr [r10 + 56]
	mov qword ptr [rsp], rsi
	xorps xmm1, xmm1
	movsd xmm2, qword ptr [rip + .LCPI1935_0]
	xorpd xmm3, xmm3
	movsd xmm4, qword ptr [rip + .LCPI1935_1]
	mov r10, -1
	movss xmm5, dword ptr [rip + .LCPI1935_2]
	xor r11d, r11d
	jmp .LBB1935_41
	.p2align	4
.LBB1935_48:
	inc r12d
	mov dword ptr [rdi + 4*rsi], r12d
.LBB1935_49:
	inc r11
	cmp rbx, r11
	je .LBB1935_50
.LBB1935_41:
	movss xmm6, dword ptr [r15 + 4*r11]
	mulss xmm6, xmm0
	maxss xmm6, xmm1
	xorps xmm7, xmm7
	cvtss2sd xmm7, xmm6
	cvttsd2si rsi, xmm7
	mov r12, rsi
	sar r12, 63
	movapd xmm8, xmm7
	subsd xmm8, xmm2
	cvttsd2si rbp, xmm8
	and rbp, r12
	or rbp, rsi
	ucomisd xmm7, xmm3
	cmovb rbp, rcx
	ucomisd xmm7, xmm4
	cmova rbp, r10
	mov r12, rdx
	cmp rdx, rbp
	jb .LBB1935_43
	mov r12, rbp
.LBB1935_43:
	ucomiss xmm6, xmm5
	cmovae r12, rcx
	movss xmm6, dword ptr [r14 + 4*r11]
	mulss xmm6, xmm0
	maxss xmm6, xmm1
	xorps xmm7, xmm7
	cvtss2sd xmm7, xmm6
	cvttsd2si r13, xmm7
	mov rsi, r13
	sar rsi, 63
	movapd xmm8, xmm7
	subsd xmm8, xmm2
	cvttsd2si rbp, xmm8
	and rbp, rsi
	or rbp, r13
	ucomisd xmm7, xmm3
	cmovb rbp, rcx
	ucomisd xmm7, xmm4
	cmova rbp, r10
	mov rsi, r9
	cmp r9, rbp
	jb .LBB1935_45
	mov rsi, rbp
.LBB1935_45:
	ucomiss xmm6, xmm5
	cmovae rsi, rcx
	imul rsi, rax
	add rsi, r12
	cmp rsi, r8
	jae .LBB1935_49
	mov r12d, dword ptr [rdi + 4*rsi]
	cmp qword ptr [rsp + 8], r12
	jbe .LBB1935_48
	mov r13, qword ptr [rsp]
	mov dword ptr [r13 + 4*r12], r11d
	mov r12d, dword ptr [rdi + 4*rsi]
	jmp .LBB1935_48
.LBB1935_50:
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
	ret
.LBB1935_29:
	.cfi_def_cfa_offset 80
	lea rdi, [r10 + 24]
	xor esi, esi
	mov rdx, rbp
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r10, qword ptr [rsp]
	mov r12, qword ptr [r10 + 40]
	jmp .LBB1935_30
.LBB1935_35:
	lea rdi, [r10 + 48]
	xor esi, esi
	mov rdx, qword ptr [rsp + 16]
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov rdx, qword ptr [rsp + 16]
	mov r10, qword ptr [rsp]
	mov rcx, qword ptr [r10 + 64]
	mov r12, qword ptr [r10 + 56]
	lea rdi, [r12 + 4*rcx]
	cmp rdx, 1
	jne .LBB1935_37
	jmp .LBB1935_38
.LBB1935_4:
	mov rdi, r10
	xor esi, esi
	mov rdx, r13
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov rdx, qword ptr [rsp + 16]
	mov r10, qword ptr [rsp]
	mov rbp, qword ptr [r10 + 16]
	mov rax, qword ptr [r10 + 8]
	lea rdi, [rax + 4*rbp]
	test r12, r12
	jne .LBB1935_6
	jmp .LBB1935_7
