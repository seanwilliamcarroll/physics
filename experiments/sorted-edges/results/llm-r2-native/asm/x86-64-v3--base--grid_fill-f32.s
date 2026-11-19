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
	mov r15, rsi
	mov r10, rdi
	mov r12, qword ptr [rdi + 80]
	imul r12, qword ptr [rdi + 72]
	mov qword ptr [rdi + 16], 0
	mov r13, r12
	inc r13
	mov qword ptr [rsp], rdi
	mov qword ptr [rsp + 16], rdx
	jne .LBB1933_2
	xor ebp, ebp
	jmp .LBB1933_8
.LBB1933_2:
	cmp r13, qword ptr [r10]
	ja .LBB1933_4
	xor ebp, ebp
	mov rax, qword ptr [r10 + 8]
	lea rdi, [rax + 4*rbp]
	test r12, r12
	je .LBB1933_7
.LBB1933_6:
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
.LBB1933_7:
	mov dword ptr [rdi], 0
	inc rbp
.LBB1933_8:
	mov qword ptr [r10 + 16], rbp
	cmp rbx, rdx
	cmovae rbx, rdx
	test rbx, rbx
	je .LBB1933_9
	mov rax, qword ptr [r10 + 8]
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [r10 + 72]
	vmovss xmm0, dword ptr [r10 + 88]
	xor ecx, ecx
	mov rdx, rax
	sub rdx, 1
	cmovb rdx, rcx
	mov rsi, qword ptr [r10 + 80]
	sub rsi, 1
	cmovb rsi, rcx
	vxorps xmm1, xmm1, xmm1
	vmovsd xmm2, qword ptr [rip + .LCPI1933_0]
	vxorpd xmm3, xmm3, xmm3
	vmovsd xmm4, qword ptr [rip + .LCPI1933_1]
	mov rdi, -1
	vmovss xmm5, dword ptr [rip + .LCPI1933_2]
	mov r8d, 1
	xor r9d, r9d
	jmp .LBB1933_20
	.p2align	4
.LBB1933_26:
	inc r9
	cmp rbx, r9
	je .LBB1933_27
.LBB1933_20:
	vmulss xmm6, xmm0, dword ptr [r15 + 4*r9]
	vmaxss xmm6, xmm6, xmm1
	vroundss xmm6, xmm6, xmm6, 9
	vcvtss2sd xmm7, xmm6, xmm6
	vcvttsd2si r10, xmm7
	mov r12, r10
	sar r12, 63
	vsubsd xmm8, xmm7, xmm2
	vcvttsd2si r11, xmm8
	and r11, r12
	or r11, r10
	vucomisd xmm7, xmm3
	cmovb r11, rcx
	vucomisd xmm7, xmm4
	cmova r11, rdi
	mov r10, rdx
	cmp rdx, r11
	jb .LBB1933_22
	mov r10, r11
.LBB1933_22:
	vmulss xmm7, xmm0, dword ptr [r14 + 4*r9]
	vmaxss xmm7, xmm7, xmm1
	vroundss xmm7, xmm7, xmm7, 9
	vcvtss2sd xmm8, xmm7, xmm7
	vcvttsd2si r13, xmm8
	mov r11, r13
	sar r11, 63
	vsubsd xmm9, xmm8, xmm2
	vcvttsd2si r12, xmm9
	and r12, r11
	or r12, r13
	vucomisd xmm8, xmm3
	cmovb r12, rcx
	vucomisd xmm8, xmm4
	cmova r12, rdi
	mov r11, rsi
	cmp rsi, r12
	jb .LBB1933_24
	mov r11, r12
.LBB1933_24:
	vucomiss xmm7, xmm5
	cmovae r11, rcx
	imul r11, rax
	inc r10
	vucomiss xmm6, xmm5
	cmovae r10, r8
	add r10, r11
	cmp r10, rbp
	jae .LBB1933_26
	mov r11, qword ptr [rsp + 8]
	inc dword ptr [r11 + 4*r10]
	jmp .LBB1933_26
.LBB1933_27:
	mov r10, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	test rbp, rbp
	je .LBB1933_28
.LBB1933_11:
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
	jb .LBB1933_15
	and rdx, -8
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 8]
	.p2align	4
.LBB1933_13:
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
	jne .LBB1933_13
	test rax, rax
	je .LBB1933_17
.LBB1933_15:
	xor edx, edx
	.p2align	4
.LBB1933_16:
	add ecx, dword ptr [rsi + 4*rdx]
	mov dword ptr [rsi + 4*rdx], ecx
	inc rdx
	cmp rax, rdx
	jne .LBB1933_16
.LBB1933_17:
	mov qword ptr [r10 + 40], 0
	cmp rbp, qword ptr [r10 + 24]
	ja .LBB1933_29
	xor r12d, r12d
.LBB1933_30:
	lea rdi, [4*r12]
	add rdi, qword ptr [r10 + 32]
	mov rsi, qword ptr [rsp + 8]
	mov rdx, r13
	call qword ptr [rip + memcpy@GOTPCREL]
	mov r10, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1933_31
.LBB1933_9:
	mov rax, qword ptr [r10 + 8]
	mov qword ptr [rsp + 8], rax
	test rbp, rbp
	jne .LBB1933_11
.LBB1933_28:
	xor r12d, r12d
.LBB1933_31:
	add r12, rbp
	mov qword ptr [r10 + 40], r12
	mov qword ptr [r10 + 64], 0
	test rdx, rdx
	je .LBB1933_32
	cmp rdx, qword ptr [r10 + 48]
	ja .LBB1933_35
	xor ecx, ecx
	mov r12, qword ptr [r10 + 56]
	lea rdi, [r12 + 4*rcx]
	cmp rdx, 1
	je .LBB1933_38
.LBB1933_37:
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
.LBB1933_38:
	mov dword ptr [rdi], 0
	inc rcx
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [r10 + 64], rcx
	test rbx, rbx
	jne .LBB1933_40
	jmp .LBB1933_50
.LBB1933_32:
	xor ecx, ecx
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [r10 + 64], rcx
	test rbx, rbx
	je .LBB1933_50
.LBB1933_40:
	mov rax, qword ptr [r10 + 72]
	vmovss xmm0, dword ptr [r10 + 88]
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
	vxorps xmm1, xmm1, xmm1
	vmovsd xmm2, qword ptr [rip + .LCPI1933_0]
	vxorpd xmm3, xmm3, xmm3
	vmovsd xmm4, qword ptr [rip + .LCPI1933_1]
	mov r10, -1
	vmovss xmm5, dword ptr [rip + .LCPI1933_2]
	xor r11d, r11d
	jmp .LBB1933_41
	.p2align	4
.LBB1933_48:
	inc r12d
	mov dword ptr [rdi + 4*rsi], r12d
.LBB1933_49:
	inc r11
	cmp rbx, r11
	je .LBB1933_50
.LBB1933_41:
	vmulss xmm6, xmm0, dword ptr [r15 + 4*r11]
	vmaxss xmm6, xmm6, xmm1
	vroundss xmm6, xmm6, xmm6, 9
	vcvtss2sd xmm7, xmm6, xmm6
	vcvttsd2si rsi, xmm7
	mov r12, rsi
	sar r12, 63
	vsubsd xmm8, xmm7, xmm2
	vcvttsd2si rbp, xmm8
	and rbp, r12
	or rbp, rsi
	vucomisd xmm7, xmm3
	cmovb rbp, rcx
	vucomisd xmm7, xmm4
	cmova rbp, r10
	mov r12, rdx
	cmp rdx, rbp
	jb .LBB1933_43
	mov r12, rbp
.LBB1933_43:
	vucomiss xmm6, xmm5
	cmovae r12, rcx
	vmulss xmm6, xmm0, dword ptr [r14 + 4*r11]
	vmaxss xmm6, xmm6, xmm1
	vroundss xmm6, xmm6, xmm6, 9
	vcvtss2sd xmm7, xmm6, xmm6
	vcvttsd2si r13, xmm7
	mov rsi, r13
	sar rsi, 63
	vsubsd xmm8, xmm7, xmm2
	vcvttsd2si rbp, xmm8
	and rbp, rsi
	or rbp, r13
	vucomisd xmm7, xmm3
	cmovb rbp, rcx
	vucomisd xmm7, xmm4
	cmova rbp, r10
	mov rsi, r9
	cmp r9, rbp
	jb .LBB1933_45
	mov rsi, rbp
.LBB1933_45:
	vucomiss xmm6, xmm5
	cmovae rsi, rcx
	imul rsi, rax
	add rsi, r12
	cmp rsi, r8
	jae .LBB1933_49
	mov r12d, dword ptr [rdi + 4*rsi]
	cmp qword ptr [rsp + 8], r12
	jbe .LBB1933_48
	mov r13, qword ptr [rsp]
	mov dword ptr [r13 + 4*r12], r11d
	mov r12d, dword ptr [rdi + 4*rsi]
	jmp .LBB1933_48
.LBB1933_50:
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
.LBB1933_29:
	.cfi_def_cfa_offset 80
	lea rdi, [r10 + 24]
	xor esi, esi
	mov rdx, rbp
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r10, qword ptr [rsp]
	mov r12, qword ptr [r10 + 40]
	jmp .LBB1933_30
.LBB1933_35:
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
	jne .LBB1933_37
	jmp .LBB1933_38
.LBB1933_4:
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
	jne .LBB1933_6
	jmp .LBB1933_7
