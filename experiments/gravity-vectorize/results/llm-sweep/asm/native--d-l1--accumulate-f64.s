<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception48
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
	sub rsp, 264
	.cfi_def_cfa_offset 320
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r8, qword ptr [rsi + 16]
	mov r12, rcx
	movabs rcx, 9223372036854775801
	lea rbx, [8*r8]
	mov rax, r8
	shr rax, 61
	sete al
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 48], rdi
	test rbx, rbx
	je .LBB146_2
	mov r14, rsi
	mov qword ptr [rsp + 16], r8
	.cfi_escape 0x2e, 0x00
	mov r15, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbx
	call r15
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB146_105
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB146_19
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB146_103
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB146_27
	mov rdi, qword ptr [rsp]
	mov r8, qword ptr [rsp + 16]
	mov rsi, r14
	jmp .LBB146_3
.LBB146_2:
	mov ebp, 8
	mov edi, 8
	mov r13d, 8
	mov eax, 8
.LBB146_3:
	mov rcx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 80], r8
	mov qword ptr [rsp + 104], r8
	mov qword ptr [rsp + 128], r8
	mov qword ptr [rsp + 152], r8
	mov qword ptr [rsp + 88], rdi
	mov qword ptr [rsp + 112], r13
	mov qword ptr [rsp + 136], rbp
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 56], r12
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 120], 0
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 168], 0
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB146_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 16], r8
	mov rbp, rdi
	xor r14d, r14d
	add r15, 8
	mov qword ptr [rsp + 64], rax
	jmp .LBB146_40
	.p2align	4
.LBB146_51:
	vmovsd xmm0, qword ptr [rsp]
	mov rax, qword ptr [rsp + 160]
	add r15, 16
	vmovsd qword ptr [rax + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 168], r13
	cmp qword ptr [rsp + 16], r14
	je .LBB146_5
.LBB146_40:
	vmovsd xmm0, qword ptr [r15 - 8]
	vmovsd qword ptr [rsp + 32], xmm0
	vmovsd xmm0, qword ptr [r15]
	vmovsd qword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 64]
	vmovsd xmm0, qword ptr [rax + 8*r14]
	mov rax, rbp
	vmovsd qword ptr [rsp], xmm0
	cmp r14, qword ptr [rsp + 80]
	jne .LBB146_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 88]
.LBB146_43:
	vmovsd xmm0, qword ptr [rsp + 32]
	mov rbp, rax
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov r12, qword ptr [rsp + 120]
	mov qword ptr [rsp + 96], r14
	cmp r12, qword ptr [rsp + 104]
	jne .LBB146_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 104]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_45:
	mov rax, qword ptr [rsp + 112]
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
	mov qword ptr [rsp + 72], rax
	vmovsd xmm0, qword ptr [rsp + 40]
	vmovsd xmm3, qword ptr [rsp]
	vmovsd qword ptr [rsp + 32], xmm1
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	vucomisd xmm3, xmm2
	mov qword ptr [rsp + 120], r12
	jne .LBB146_46
	jp .LBB146_46
	mov rbx, qword ptr [rsp + 144]
	cmp rbx, qword ptr [rsp + 128]
	je .LBB146_48
	jmp .LBB146_49
	.p2align	4
.LBB146_46:
	vmovsd xmm0, qword ptr [rip + .LCPI146_0]
	vdivsd xmm0, xmm0, qword ptr [rsp]
	vmovsd qword ptr [rsp + 32], xmm0
	mov rbx, qword ptr [rsp + 144]
	cmp rbx, qword ptr [rsp + 128]
	jne .LBB146_49
.LBB146_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_49:
	mov rax, qword ptr [rsp + 136]
	mov qword ptr [rsp + 40], rax
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov r13, qword ptr [rsp + 168]
	mov qword ptr [rsp + 144], rbx
	cmp r13, qword ptr [rsp + 152]
	jne .LBB146_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_51
.LBB146_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 72], r13
	xor r12d, r12d
	xor ebx, ebx
	xor r13d, r13d
	xor r14d, r14d
.LBB146_5:
	mov qword ptr [rsp + 184], rax
	mov rbp, qword ptr [rsp + 56]
	lea r15, [8*rbp]
	mov qword ptr [rsp + 176], r15
	test rbp, rbp
	je .LBB146_6
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, r15
	call rax
	test rax, rax
	je .LBB146_67
	cmp rbp, 5
	jae .LBB146_55
	xor edi, edi
	jmp .LBB146_62
.LBB146_6:
	mov r11d, 8
	mov eax, 8
	mov qword ptr [rsp + 24], rax
	jmp .LBB146_7
.LBB146_55:
	cmp rbp, 33
	jae .LBB146_59
	xor edi, edi
	jmp .LBB146_57
.LBB146_59:
	vmovapd zmm0, zmmword ptr [rip + .LCPI146_1]
	mov edx, ebp
	and edx, 31
	mov ecx, 32
	mov rdi, rbp
	cmovne rcx, rdx
	mov rdx, qword ptr [rsp + 8]
	xor esi, esi
	sub rdi, rcx
	add rdx, 384
	.p2align	4
.LBB146_60:
	vmovupd zmm1, zmmword ptr [rdx - 384]
	vmovupd zmm2, zmmword ptr [rdx - 256]
	vmovupd zmm3, zmmword ptr [rdx - 128]
	vmovupd zmm4, zmmword ptr [rdx]
	vpermt2pd zmm1, zmm0, zmmword ptr [rdx - 320]
	vpermt2pd zmm2, zmm0, zmmword ptr [rdx - 192]
	vpermt2pd zmm3, zmm0, zmmword ptr [rdx - 64]
	vpermt2pd zmm4, zmm0, zmmword ptr [rdx + 64]
	add rdx, 512
	vmovupd zmmword ptr [rax + 8*rsi], zmm1
	vmovupd zmmword ptr [rax + 8*rsi + 64], zmm2
	vmovupd zmmword ptr [rax + 8*rsi + 128], zmm3
	vmovupd zmmword ptr [rax + 8*rsi + 192], zmm4
	add rsi, 32
	cmp rdi, rsi
	jne .LBB146_60
	cmp ecx, 4
	jbe .LBB146_62
.LBB146_57:
	vmovapd ymm0, ymmword ptr [rip + .LCPI146_2]
	mov esi, ebp
	and esi, 3
	mov edx, 4
	mov rcx, rdi
	mov rdi, rbp
	cmovne rdx, rsi
	sub rdi, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, qword ptr [rsp + 8]
	.p2align	4
.LBB146_58:
	vpermpd zmm1, zmm0, zmmword ptr [rdx]
	add rdx, 64
	vmovupd ymmword ptr [rax + 8*rcx], ymm1
	add rcx, 4
	cmp rdi, rcx
	jne .LBB146_58
.LBB146_62:
	mov rcx, rdi
	shl rcx, 4
	add rcx, qword ptr [rsp + 8]
	.p2align	4
.LBB146_63:
	vmovsd xmm0, qword ptr [rcx]
	add rcx, 16
	vmovsd qword ptr [rax + 8*rdi], xmm0
	inc rdi
	cmp rbp, rdi
	jne .LBB146_63
	mov r15, rax
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	lea rdi, [8*rbp]
	vzeroupper
	call rax
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB146_78
	mov r11, r15
	cmp rbp, 5
	jae .LBB146_69
	mov rdi, qword ptr [rsp + 24]
	xor eax, eax
	jmp .LBB146_76
.LBB146_69:
	mov rdi, qword ptr [rsp + 24]
	cmp rbp, 33
	jae .LBB146_73
	xor eax, eax
	jmp .LBB146_71
.LBB146_73:
	vmovapd zmm0, zmmword ptr [rip + .LCPI146_1]
	mov rdx, qword ptr [rsp + 8]
	mov eax, ebp
	and eax, 31
	mov ecx, 32
	cmovne rcx, rax
	mov rax, rbp
	xor esi, esi
	sub rax, rcx
	add rdx, 392
	.p2align	4
.LBB146_74:
	vmovupd zmm1, zmmword ptr [rdx - 384]
	vmovupd zmm2, zmmword ptr [rdx - 256]
	vmovupd zmm3, zmmword ptr [rdx - 128]
	vmovupd zmm4, zmmword ptr [rdx]
	vpermt2pd zmm1, zmm0, zmmword ptr [rdx - 320]
	vpermt2pd zmm2, zmm0, zmmword ptr [rdx - 192]
	vpermt2pd zmm3, zmm0, zmmword ptr [rdx - 64]
	vpermt2pd zmm4, zmm0, zmmword ptr [rdx + 64]
	add rdx, 512
	vmovupd zmmword ptr [rdi + 8*rsi], zmm1
	vmovupd zmmword ptr [rdi + 8*rsi + 64], zmm2
	vmovupd zmmword ptr [rdi + 8*rsi + 128], zmm3
	vmovupd zmmword ptr [rdi + 8*rsi + 192], zmm4
	add rsi, 32
	cmp rax, rsi
	jne .LBB146_74
	cmp ecx, 4
	jbe .LBB146_76
.LBB146_71:
	vmovapd ymm0, ymmword ptr [rip + .LCPI146_2]
	mov rsi, qword ptr [rsp + 8]
	mov rcx, rax
	mov eax, ebp
	and eax, 3
	mov edx, 4
	cmovne rdx, rax
	mov rax, rbp
	sub rax, rdx
	mov rdx, rcx
	shl rdx, 4
	lea rdx, [rdx + rsi + 8]
	.p2align	4
.LBB146_72:
	vpermpd zmm1, zmm0, zmmword ptr [rdx]
	add rdx, 64
	vmovupd ymmword ptr [rdi + 8*rcx], ymm1
	add rcx, 4
	cmp rax, rcx
	jne .LBB146_72
.LBB146_76:
	mov rdx, qword ptr [rsp + 8]
	mov rcx, rax
	shl rcx, 4
	lea rcx, [rcx + rdx + 8]
	.p2align	4
.LBB146_77:
	vmovsd xmm0, qword ptr [rcx]
	add rcx, 16
	vmovsd qword ptr [rdi + 8*rax], xmm0
	inc rax
	cmp rbp, rax
	jne .LBB146_77
.LBB146_7:
	test r14, r14
	je .LBB146_14
	mov rax, qword ptr [rsp + 88]
	xor ebp, ebp
	xor r15d, r15d
	mov qword ptr [rsp + 200], rax
	mov rax, qword ptr [rsp + 48]
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rax + 8]
	vmovsd qword ptr [rsp + 192], xmm0
	vmovsd qword ptr [rsp + 48], xmm1
	mov qword ptr [rsp + 216], r12
	mov qword ptr [rsp + 208], rbx
	.p2align	4
.LBB146_9:
	mov rax, r12
	add rax, r15
	je .LBB146_14
	mov rax, rbx
	add rax, r15
	je .LBB146_14
	mov rax, r13
	add rax, r15
	je .LBB146_14
	cmp qword ptr [rsp + 176], rbp
	je .LBB146_14
	mov rsi, qword ptr [rsp + 72]
	lea r10, [rbx + r15 - 1]
	mov rax, qword ptr [rsp + 200]
	lea r9, [r12 + r15 - 1]
	mov r12, r11
	lea r11, [r11 + rbp + 8]
	lea rcx, [r14 + r15 - 1]
	mov qword ptr [rsp + 32], r10
	lea r8, [rsi + rbp + 8]
	vmovsd xmm1, qword ptr [rsi + rbp]
	mov rsi, qword ptr [rsp + 40]
	lea rdx, [rax + rbp + 8]
	lea rax, [rax + rbp]
	vmovsd xmm0, qword ptr [rax]
	lea rax, [rsi + rbp + 8]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 184]
	vmovsd xmm2, qword ptr [rax + rbp]
	lea rax, [rax + rbp + 8]
	vmovsd qword ptr [rsp], xmm2
	mov qword ptr [rsp + 64], rax
	vmovsd xmm2, qword ptr [rsp + 192]
	mov rax, qword ptr [rsp + 56]
	mov rbx, qword ptr [rsp + 24]
	vmulsd xmm2, xmm2, qword ptr [rsi + rbp]
	vmovsd qword ptr [rsp + 240], xmm0
	vmovsd qword ptr [rsp + 248], xmm1
	lea r10, [rax + r15 - 1]
	lea rax, [rbx + rbp + 8]
	vmovsd qword ptr [rsp + 256], xmm2
	.cfi_escape 0x2e, 0x40
	vmovsd xmm0, qword ptr [rsp + 48]
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 240]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [r13 + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 104]
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 80]
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f64>
	mov r11, r12
	mov r12, qword ptr [rsp + 280]
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	vmovsd xmm1, qword ptr [rsp]
	dec r15
	mov rax, r14
	vmulsd xmm0, xmm1, qword ptr [rsp + 224]
	vmulsd xmm1, xmm1, qword ptr [rsp + 232]
	vaddsd xmm0, xmm0, qword ptr [r11 + rbp]
	vmovsd qword ptr [r11 + rbp], xmm0
	vaddsd xmm0, xmm1, qword ptr [rbx + rbp]
	vmovsd qword ptr [rbx + rbp], xmm0
	mov rbx, qword ptr [rsp + 208]
	add rbp, 8
	add rax, r15
	jne .LBB146_9
.LBB146_14:
	mov r9, qword ptr [rsp + 56]
	mov r14, qword ptr [rsp + 72]
	test r9, r9
	je .LBB146_92
	cmp r9, 4
	jae .LBB146_80
	mov r8, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 24]
	xor eax, eax
	jmp .LBB146_89
.LBB146_80:
	mov r8, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 24]
	movabs rcx, 576460752303423472
	cmp r9, 16
	jae .LBB146_82
	xor eax, eax
	jmp .LBB146_86
.LBB146_82:
	vmovapd zmm0, zmmword ptr [rip + .LCPI146_3]
	vmovapd zmm1, zmmword ptr [rip + .LCPI146_4]
	mov rdx, r9
	shr rdx, 4
	mov rax, r9
	and rax, rcx
	xor esi, esi
	shl rdx, 7
	.p2align	4
.LBB146_83:
	vmovupd zmm2, zmmword ptr [r11 + rsi]
	vmovupd zmm3, zmmword ptr [r11 + rsi + 64]
	vmovupd zmm4, zmmword ptr [rdi + rsi]
	vmovupd zmm5, zmmword ptr [rdi + rsi + 64]
	vmovapd zmm6, zmm2
	vpermt2pd zmm6, zmm0, zmm4
	vpermt2pd zmm2, zmm1, zmm4
	vmovapd zmm4, zmm3
	vpermt2pd zmm4, zmm0, zmm5
	vpermt2pd zmm3, zmm1, zmm5
	vmovupd zmmword ptr [r8 + 2*rsi + 64], zmm2
	vmovupd zmmword ptr [r8 + 2*rsi], zmm6
	vmovupd zmmword ptr [r8 + 2*rsi + 192], zmm3
	vmovupd zmmword ptr [r8 + 2*rsi + 128], zmm4
	sub rsi, -128
	cmp rdx, rsi
	jne .LBB146_83
	cmp r9, rax
	je .LBB146_91
	test r9b, 12
	je .LBB146_89
.LBB146_86:
	vmovapd zmm0, zmmword ptr [rip + .LCPI146_5]
	add rcx, 12
	mov rdx, rax
	mov rax, rcx
	mov rcx, rdx
	shl rcx, 4
	and rax, r9
	add rcx, r8
	.p2align	4
.LBB146_87:
	vbroadcastf64x4 zmm1, ymmword ptr [rdi + 8*rdx]
	vbroadcastf64x4 zmm2, ymmword ptr [r11 + 8*rdx]
	add rdx, 4
	vpermt2pd zmm2, zmm0, zmm1
	vmovupd zmmword ptr [rcx], zmm2
	add rcx, 64
	cmp rax, rdx
	jne .LBB146_87
	cmp r9, rax
	je .LBB146_91
.LBB146_89:
	mov rcx, rax
	shl rcx, 4
	lea rcx, [rcx + r8 + 8]
	.p2align	4
.LBB146_90:
	vmovsd xmm0, qword ptr [r11 + 8*rax]
	vmovsd xmm1, qword ptr [rdi + 8*rax]
	inc rax
	vmovsd qword ptr [rcx - 8], xmm0
	vmovsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp r9, rax
	jne .LBB146_90
.LBB146_91:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov r15, r11
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call rbx
.LBB146_92:
	cmp qword ptr [rsp + 152], 0
	mov rdi, qword ptr [rsp + 184]
	je .LBB146_94
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB146_94:
	cmp qword ptr [rsp + 128], 0
	je .LBB146_96
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	vzeroupper
	call rax
.LBB146_96:
	cmp qword ptr [rsp + 104], 0
	je .LBB146_98
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	vzeroupper
	call rax
.LBB146_98:
	cmp qword ptr [rsp + 80], 0
	je .LBB146_99
	mov rdi, qword ptr [rsp + 88]
	add rsp, 264
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
.LBB146_99:
	.cfi_def_cfa_offset 320
	add rsp, 264
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
.LBB146_105:
	.cfi_def_cfa_offset 320
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB146_19:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_68
.LBB146_103:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_68
.LBB146_27:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_68
.LBB146_67:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, r15
	call alloc::raw_vec::handle_error
	jmp .LBB146_68
.LBB146_78:
	.cfi_escape 0x2e, 0x00
	mov rsi, qword ptr [rsp + 176]
	mov edi, 8
	call alloc::raw_vec::handle_error
.LBB146_68:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r15
	call rax
	jmp .LBB146_30
	jmp .LBB146_29
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB146_102
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	jmp .LBB146_21
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB146_102
.LBB146_21:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call rax
	jmp .LBB146_101
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	jne .LBB146_101
	jmp .LBB146_102
.LBB146_29:
	mov rbx, rax
.LBB146_30:
	cmp qword ptr [rsp + 152], 0
	jne .LBB146_31
	cmp qword ptr [rsp + 128], 0
	jne .LBB146_33
.LBB146_34:
	cmp qword ptr [rsp + 104], 0
	jne .LBB146_35
.LBB146_36:
	cmp qword ptr [rsp + 80], 0
	jne .LBB146_37
	jmp .LBB146_102
.LBB146_31:
	mov rdi, qword ptr [rsp + 160]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 128], 0
	je .LBB146_34
.LBB146_33:
	mov rdi, qword ptr [rsp + 136]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 104], 0
	je .LBB146_36
.LBB146_35:
	mov rdi, qword ptr [rsp + 112]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 80], 0
	je .LBB146_102
.LBB146_37:
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp], rax
.LBB146_101:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp]
	call rax
.LBB146_102:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
