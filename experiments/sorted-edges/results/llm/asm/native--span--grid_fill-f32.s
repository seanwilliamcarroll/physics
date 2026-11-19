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
	mov r13, qword ptr [rdi + 80]
	mov rbx, rcx
	mov r14, rsi
	mov r12, rdi
	mov qword ptr [rsp], rdx
	imul r13, qword ptr [rdi + 72]
	mov qword ptr [rdi + 16], 0
	mov r15, r13
	inc r15
	jne .LBB1933_2
	xor ebp, ebp
	jmp .LBB1933_8
.LBB1933_2:
	cmp r15, qword ptr [r12]
	ja .LBB1933_4
	xor ebp, ebp
	mov rax, qword ptr [r12 + 8]
	lea rdi, [rax + 4*rbp]
	test r13, r13
	je .LBB1933_7
.LBB1933_6:
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rip + memset@GOTPCREL]
	lea rdx, [4*r15 - 4]
	xor esi, esi
	mov qword ptr [rsp + 8], r8
	call rax
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp]
	mov r8, qword ptr [rsp + 8]
	add r15, rbp
	add rbp, r13
	lea rdi, [rax + 4*r15 - 4]
.LBB1933_7:
	inc rbp
	mov dword ptr [rdi], 0
.LBB1933_8:
	cmp r8, rdx
	mov qword ptr [r12 + 16], rbp
	cmovae r8, rdx
	mov qword ptr [rsp + 8], r8
	test r8, r8
	je .LBB1933_9
	mov rax, qword ptr [r12 + 72]
	vmovss xmm0, dword ptr [r12 + 88]
	mov rcx, qword ptr [r12 + 80]
	mov r15, qword ptr [r12 + 8]
	xor esi, esi
	mov rdx, rax
	sub rdx, 1
	cmovb rdx, rsi
	sub rcx, 1
	cmovb rcx, rsi
	cmp r8, 1
	je .LBB1933_42
	vmovsd xmm3, qword ptr [rip + .LCPI1933_0]
	vmovss xmm4, dword ptr [rip + .LCPI1933_1]
	movabs rsi, 2305843009213693952
	mov r9d, 1
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
	lea rdi, [rsi - 2]
	xor esi, esi
	and rdi, r8
	xor r8d, r8d
	jmp .LBB1933_12
	.p2align	4
.LBB1933_40:
	add rsi, 2
	cmp rdi, rsi
	je .LBB1933_41
.LBB1933_12:
	vmulss xmm5, xmm0, dword ptr [r14 + 4*rsi]
	mov r10d, 0
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_13
	vucomisd xmm6, xmm3
	mov r11, -1
	mov r13, -1
	jbe .LBB1933_15
.LBB1933_16:
	mov r10, rdx
	cmp rdx, r13
	jb .LBB1933_18
.LBB1933_17:
	mov r10, r13
.LBB1933_18:
	vmulss xmm6, xmm0, dword ptr [rbx + 4*rsi]
	mov r13d, 0
	vmaxss xmm6, xmm6, xmm1
	vroundss xmm6, xmm6, xmm6, 9
	vcvtss2sd xmm7, xmm6, xmm6
	vucomisd xmm7, xmm2
	jae .LBB1933_19
	vucomisd xmm7, xmm3
	jbe .LBB1933_21
.LBB1933_22:
	mov r13, rcx
	cmp rcx, r11
	jb .LBB1933_24
.LBB1933_23:
	mov r13, r11
.LBB1933_24:
	vucomiss xmm6, xmm4
	cmovae r13, r8
	inc r10
	imul r13, rax
	vucomiss xmm5, xmm4
	cmovae r10, r9
	add r10, r13
	cmp r10, rbp
	jae .LBB1933_26
	inc dword ptr [r15 + 4*r10]
.LBB1933_26:
	vmulss xmm5, xmm0, dword ptr [r14 + 4*rsi + 4]
	mov r10d, 0
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_27
	vucomisd xmm6, xmm3
	mov r11, -1
	mov r13, -1
	jbe .LBB1933_29
.LBB1933_30:
	mov r10, rdx
	cmp rdx, r13
	jb .LBB1933_32
.LBB1933_31:
	mov r10, r13
.LBB1933_32:
	vmulss xmm6, xmm0, dword ptr [rbx + 4*rsi + 4]
	mov r13d, 0
	vmaxss xmm6, xmm6, xmm1
	vroundss xmm6, xmm6, xmm6, 9
	vcvtss2sd xmm7, xmm6, xmm6
	vucomisd xmm7, xmm2
	jae .LBB1933_33
	vucomisd xmm7, xmm3
	jbe .LBB1933_35
.LBB1933_36:
	mov r13, rcx
	cmp rcx, r11
	jb .LBB1933_38
.LBB1933_37:
	mov r13, r11
.LBB1933_38:
	vucomiss xmm6, xmm4
	cmovae r13, r8
	inc r10
	imul r13, rax
	vucomiss xmm5, xmm4
	cmovae r10, r9
	add r10, r13
	cmp r10, rbp
	jae .LBB1933_40
	inc dword ptr [r15 + 4*r10]
	jmp .LBB1933_40
	.p2align	4
.LBB1933_13:
	vcvttsd2usi r10, xmm6
	vucomisd xmm6, xmm3
	mov r11, -1
	mov r13, -1
	ja .LBB1933_16
.LBB1933_15:
	mov r13, r10
	mov r10, rdx
	cmp rdx, r13
	jae .LBB1933_17
	jmp .LBB1933_18
	.p2align	4
.LBB1933_19:
	vcvttsd2usi r13, xmm7
	vucomisd xmm7, xmm3
	ja .LBB1933_22
.LBB1933_21:
	mov r11, r13
	mov r13, rcx
	cmp rcx, r11
	jae .LBB1933_23
	jmp .LBB1933_24
	.p2align	4
.LBB1933_27:
	vcvttsd2usi r10, xmm6
	vucomisd xmm6, xmm3
	mov r11, -1
	mov r13, -1
	ja .LBB1933_30
.LBB1933_29:
	mov r13, r10
	mov r10, rdx
	cmp rdx, r13
	jae .LBB1933_31
	jmp .LBB1933_32
	.p2align	4
.LBB1933_33:
	vcvttsd2usi r13, xmm7
	vucomisd xmm7, xmm3
	ja .LBB1933_36
.LBB1933_35:
	mov r11, r13
	mov r13, rcx
	cmp rcx, r11
	jae .LBB1933_37
	jmp .LBB1933_38
.LBB1933_9:
	mov r15, qword ptr [r12 + 8]
	test rbp, rbp
	jne .LBB1933_45
	jmp .LBB1933_106
.LBB1933_41:
	mov r8, qword ptr [rsp + 8]
	test r8b, 1
	je .LBB1933_43
.LBB1933_42:
	vmulss xmm1, xmm0, dword ptr [r14 + 4*rsi]
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm5, qword ptr [rip + .LCPI1933_0]
	xor r10d, r10d
	vxorps xmm4, xmm4, xmm4
	mov r9, -1
	vmaxss xmm1, xmm1, xmm2
	vroundss xmm1, xmm1, xmm1, 9
	vcvtss2sd xmm3, xmm1, xmm1
	vmulss xmm0, xmm0, dword ptr [rbx + 4*rsi]
	vucomisd xmm3, xmm4
	vcvttsd2usi rdi, xmm3
	cmovb rdi, r10
	vucomisd xmm3, xmm5
	vmovss xmm3, dword ptr [rip + .LCPI1933_1]
	vmaxss xmm0, xmm0, xmm2
	cmova rdi, r9
	vroundss xmm0, xmm0, xmm0, 9
	cmp rdx, rdi
	cmovb rdi, rdx
	vcvtss2sd xmm2, xmm0, xmm0
	vucomisd xmm2, xmm4
	vcvttsd2usi rdx, xmm2
	cmovb rdx, r10
	vucomisd xmm2, xmm5
	cmova rdx, r9
	cmp rcx, rdx
	cmovb rdx, rcx
	vucomiss xmm0, xmm3
	cmovae rdx, r10
	inc rdi
	imul rdx, rax
	vucomiss xmm1, xmm3
	mov eax, 1
	cmovb rax, rdi
	add rax, rdx
	cmp rax, rbp
	jae .LBB1933_43
	inc dword ptr [r15 + 4*rax]
	jmp .LBB1933_45
.LBB1933_43:
	mov rdx, qword ptr [rsp]
	test rbp, rbp
	je .LBB1933_106
.LBB1933_45:
	lea r8, [4*rbp]
	xor ecx, ecx
	mov rsi, r15
	lea rdi, [r8 - 4]
	mov rdx, rdi
	shr rdx, 2
	inc rdx
	mov eax, edx
	and eax, 7
	cmp rdi, 28
	jb .LBB1933_49
	and rdx, -8
	xor ecx, ecx
	mov rsi, r15
	.p2align	4
.LBB1933_47:
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
	add rdx, -8
	mov dword ptr [rsi + 28], ecx
	lea rsi, [rsi + 32]
	jne .LBB1933_47
	test rax, rax
	je .LBB1933_51
.LBB1933_49:
	xor edx, edx
	.p2align	4
.LBB1933_50:
	add ecx, dword ptr [rsi + 4*rdx]
	mov dword ptr [rsi + 4*rdx], ecx
	inc rdx
	cmp rax, rdx
	jne .LBB1933_50
.LBB1933_51:
	mov qword ptr [r12 + 40], 0
	cmp rbp, qword ptr [r12 + 24]
	ja .LBB1933_53
	xor r13d, r13d
.LBB1933_54:
	lea rdi, [4*r13]
	add rdi, qword ptr [r12 + 32]
	mov rax, qword ptr [rip + memcpy@GOTPCREL]
	mov rsi, r15
	mov rdx, r8
	call rax
	mov r8, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp]
	jmp .LBB1933_55
.LBB1933_106:
	xor r13d, r13d
.LBB1933_55:
	add r13, rbp
	mov qword ptr [r12 + 40], r13
	mov qword ptr [r12 + 64], 0
	test rdx, rdx
	je .LBB1933_56
	cmp rdx, qword ptr [r12 + 48]
	ja .LBB1933_59
	xor r15d, r15d
	mov r13, qword ptr [r12 + 56]
	lea rdi, [r13 + 4*r15]
	cmp rdx, 1
	je .LBB1933_62
.LBB1933_61:
	mov rax, qword ptr [rip + memset@GOTPCREL]
	mov rbp, rdx
	lea rdx, [4*rdx - 4]
	xor esi, esi
	call rax
	mov r8, qword ptr [rsp + 8]
	lea rax, [r15 + rbp]
	lea r15, [r15 + rbp - 1]
	lea rdi, [r13 + 4*rax - 4]
.LBB1933_62:
	inc r15
	mov dword ptr [rdi], 0
	mov qword ptr [r12 + 64], r15
	test r8, r8
	jne .LBB1933_64
	jmp .LBB1933_104
.LBB1933_56:
	xor r15d, r15d
	mov qword ptr [r12 + 64], r15
	test r8, r8
	je .LBB1933_104
.LBB1933_64:
	mov rdx, qword ptr [r12 + 72]
	vmovss xmm0, dword ptr [r12 + 88]
	mov rsi, qword ptr [r12 + 80]
	mov r10, qword ptr [r12 + 56]
	mov rax, qword ptr [r12 + 32]
	mov rdi, qword ptr [r12 + 40]
	xor ecx, ecx
	mov r9, rdx
	sub r9, 1
	mov qword ptr [rsp], r10
	cmovb r9, rcx
	sub rsi, 1
	cmovb rsi, rcx
	cmp r8, 1
	je .LBB1933_100
	vmovsd xmm3, qword ptr [rip + .LCPI1933_0]
	vmovss xmm4, dword ptr [rip + .LCPI1933_1]
	movabs rcx, 2305843009213693952
	xor r10d, r10d
	vxorps xmm1, xmm1, xmm1
	vxorpd xmm2, xmm2, xmm2
	add rcx, -2
	and rcx, r8
	mov r8, rcx
	xor ecx, ecx
	jmp .LBB1933_66
	.p2align	4
.LBB1933_97:
	inc r11d
	mov dword ptr [rax + 4*rbp], r11d
.LBB1933_98:
	add rcx, 2
	cmp r8, rcx
	je .LBB1933_99
.LBB1933_66:
	vmulss xmm5, xmm0, dword ptr [r14 + 4*rcx]
	mov r11d, 0
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_67
	vucomisd xmm6, xmm3
	mov r12, -1
	mov r13, -1
	jbe .LBB1933_69
.LBB1933_70:
	mov r11, r9
	cmp r9, r13
	jb .LBB1933_72
.LBB1933_71:
	mov r11, r13
.LBB1933_72:
	vucomiss xmm5, xmm4
	vmulss xmm5, xmm0, dword ptr [rbx + 4*rcx]
	mov r13d, 0
	cmovae r11, r10
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_73
	vucomisd xmm6, xmm3
	jbe .LBB1933_75
.LBB1933_76:
	mov rbp, rsi
	cmp rsi, r12
	jb .LBB1933_78
.LBB1933_77:
	mov rbp, r12
.LBB1933_78:
	vucomiss xmm5, xmm4
	cmovae rbp, r10
	imul rbp, rdx
	add rbp, r11
	cmp rbp, rdi
	jae .LBB1933_82
	mov r11d, dword ptr [rax + 4*rbp]
	cmp r15, r11
	jbe .LBB1933_81
	mov r12, qword ptr [rsp]
	mov dword ptr [r12 + 4*r11], ecx
	mov r11d, dword ptr [rax + 4*rbp]
.LBB1933_81:
	inc r11d
	mov dword ptr [rax + 4*rbp], r11d
.LBB1933_82:
	vmulss xmm5, xmm0, dword ptr [r14 + 4*rcx + 4]
	mov r11d, 0
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_83
	vucomisd xmm6, xmm3
	mov r12, -1
	mov r13, -1
	jbe .LBB1933_85
.LBB1933_86:
	mov r11, r9
	cmp r9, r13
	jb .LBB1933_88
.LBB1933_87:
	mov r11, r13
.LBB1933_88:
	vucomiss xmm5, xmm4
	vmulss xmm5, xmm0, dword ptr [rbx + 4*rcx + 4]
	mov r13d, 0
	cmovae r11, r10
	vmaxss xmm5, xmm5, xmm1
	vroundss xmm5, xmm5, xmm5, 9
	vcvtss2sd xmm6, xmm5, xmm5
	vucomisd xmm6, xmm2
	jae .LBB1933_89
	vucomisd xmm6, xmm3
	jbe .LBB1933_91
.LBB1933_92:
	mov rbp, rsi
	cmp rsi, r12
	jb .LBB1933_94
.LBB1933_93:
	mov rbp, r12
.LBB1933_94:
	vucomiss xmm5, xmm4
	cmovae rbp, r10
	imul rbp, rdx
	add rbp, r11
	cmp rbp, rdi
	jae .LBB1933_98
	mov r11d, dword ptr [rax + 4*rbp]
	cmp r15, r11
	jbe .LBB1933_97
	mov r13, qword ptr [rsp]
	lea r12, [rcx + 1]
	mov dword ptr [r13 + 4*r11], r12d
	mov r11d, dword ptr [rax + 4*rbp]
	jmp .LBB1933_97
	.p2align	4
.LBB1933_67:
	vcvttsd2usi r11, xmm6
	vucomisd xmm6, xmm3
	mov r12, -1
	mov r13, -1
	ja .LBB1933_70
.LBB1933_69:
	mov r13, r11
	mov r11, r9
	cmp r9, r13
	jae .LBB1933_71
	jmp .LBB1933_72
	.p2align	4
.LBB1933_73:
	vcvttsd2usi r13, xmm6
	vucomisd xmm6, xmm3
	ja .LBB1933_76
.LBB1933_75:
	mov r12, r13
	mov rbp, rsi
	cmp rsi, r12
	jae .LBB1933_77
	jmp .LBB1933_78
	.p2align	4
.LBB1933_83:
	vcvttsd2usi r11, xmm6
	vucomisd xmm6, xmm3
	mov r12, -1
	mov r13, -1
	ja .LBB1933_86
.LBB1933_85:
	mov r13, r11
	mov r11, r9
	cmp r9, r13
	jae .LBB1933_87
	jmp .LBB1933_88
	.p2align	4
.LBB1933_89:
	vcvttsd2usi r13, xmm6
	vucomisd xmm6, xmm3
	ja .LBB1933_92
.LBB1933_91:
	mov r12, r13
	mov rbp, rsi
	cmp rsi, r12
	jae .LBB1933_93
	jmp .LBB1933_94
.LBB1933_99:
	test byte ptr [rsp + 8], 1
	je .LBB1933_104
.LBB1933_100:
	vmulss xmm1, xmm0, dword ptr [r14 + 4*rcx]
	vxorps xmm2, xmm2, xmm2
	vmovsd xmm5, qword ptr [rip + .LCPI1933_0]
	xor r11d, r11d
	vxorpd xmm4, xmm4, xmm4
	vmovss xmm6, dword ptr [rip + .LCPI1933_1]
	mov r14, -1
	vmaxss xmm1, xmm1, xmm2
	vroundss xmm1, xmm1, xmm1, 9
	vcvtss2sd xmm3, xmm1, xmm1
	vmulss xmm0, xmm0, dword ptr [rbx + 4*rcx]
	vucomisd xmm3, xmm4
	vcvttsd2usi r10, xmm3
	cmovb r10, r11
	vucomisd xmm3, xmm5
	vmaxss xmm0, xmm0, xmm2
	cmova r10, r14
	vroundss xmm0, xmm0, xmm0, 9
	cmp r9, r10
	cmovb r10, r9
	vucomiss xmm1, xmm6
	vcvtss2sd xmm1, xmm0, xmm0
	cmovae r10, r11
	vucomisd xmm1, xmm4
	vcvttsd2usi r9, xmm1
	cmovb r9, r11
	vucomisd xmm1, xmm5
	cmova r9, r14
	cmp rsi, r9
	cmovb r9, rsi
	vucomiss xmm0, xmm6
	cmovae r9, r11
	imul r9, rdx
	add r9, r10
	cmp r9, rdi
	jae .LBB1933_104
	mov edx, dword ptr [rax + 4*r9]
	cmp r15, rdx
	jbe .LBB1933_103
	mov rsi, qword ptr [rsp]
	mov dword ptr [rsi + 4*rdx], ecx
	mov edx, dword ptr [rax + 4*r9]
.LBB1933_103:
	inc edx
	mov dword ptr [rax + 4*r9], edx
.LBB1933_104:
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
.LBB1933_53:
	.cfi_def_cfa_offset 80
	lea rdi, [r12 + 24]
	xor esi, esi
	mov rdx, rbp
	mov r13, r8
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r8, r13
	mov r13, qword ptr [r12 + 40]
	jmp .LBB1933_54
.LBB1933_59:
	mov rdx, qword ptr [rsp]
	lea rdi, [r12 + 48]
	xor esi, esi
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov rdx, qword ptr [rsp]
	mov r8, qword ptr [rsp + 8]
	mov r15, qword ptr [r12 + 64]
	mov r13, qword ptr [r12 + 56]
	lea rdi, [r13 + 4*r15]
	cmp rdx, 1
	jne .LBB1933_61
	jmp .LBB1933_62
.LBB1933_4:
	mov rdi, r12
	xor esi, esi
	mov rdx, r15
	mov rbp, r8
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov r8, rbp
	mov rdx, qword ptr [rsp]
	mov rbp, qword ptr [r12 + 16]
	mov rax, qword ptr [r12 + 8]
	lea rdi, [rax + 4*rbp]
	test r13, r13
	jne .LBB1933_6
	jmp .LBB1933_7
