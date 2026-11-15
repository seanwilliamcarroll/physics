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
	sub rsp, 312
	.cfi_def_cfa_offset 368
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
	jne .LBB148_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 64], rdi
	test rbx, rbx
	je .LBB148_2
	mov r14, rsi
	mov qword ptr [rsp + 16], r8
	.cfi_escape 0x2e, 0x00
	mov r15, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbx
	call r15
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_106
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB148_19
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB148_104
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call r15
	test rax, rax
	je .LBB148_27
	mov rdx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	mov rsi, r14
	jmp .LBB148_3
.LBB148_2:
	mov ebp, 8
	mov edx, 8
	mov r13d, 8
	mov eax, 8
.LBB148_3:
	mov rcx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 88], r8
	mov qword ptr [rsp + 112], r8
	mov qword ptr [rsp + 136], r8
	mov qword ptr [rsp + 160], r8
	mov qword ptr [rsp + 96], rdx
	mov qword ptr [rsp + 120], r13
	mov qword ptr [rsp + 144], rbp
	mov qword ptr [rsp + 168], rax
	mov qword ptr [rsp + 80], r12
	mov qword ptr [rsp + 104], 0
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB148_4
	mov r14, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 16], r8
	mov r13, rdx
	xor r12d, r12d
	add r14, 8
	mov qword ptr [rsp + 48], rax
	jmp .LBB148_40
	.p2align	4
.LBB148_51:
	vmovsd xmm0, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 168]
	add r14, 16
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 176], r15
	cmp qword ptr [rsp + 16], r12
	je .LBB148_5
.LBB148_40:
	mov rax, qword ptr [rsp + 48]
	vmovsd xmm0, qword ptr [r14 - 8]
	vmovsd xmm2, qword ptr [r14]
	vmovsd xmm1, qword ptr [rax + 8*r12]
	vmovsd qword ptr [rsp + 32], xmm0
	vmovsd qword ptr [rsp + 56], xmm2
	vmovsd qword ptr [rsp + 8], xmm1
	cmp r12, qword ptr [rsp + 88]
	jne .LBB148_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 88]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov r13, qword ptr [rsp + 96]
.LBB148_43:
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd qword ptr [r13 + 8*r12], xmm0
	inc r12
	mov rbx, qword ptr [rsp + 128]
	mov qword ptr [rsp + 104], r12
	cmp rbx, qword ptr [rsp + 112]
	jne .LBB148_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_45:
	vmovsd xmm0, qword ptr [rsp + 56]
	vmovsd xmm3, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 120]
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 32], xmm1
	mov qword ptr [rsp + 184], rax
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	vucomisd xmm3, xmm2
	mov qword ptr [rsp + 128], rbx
	jne .LBB148_46
	jp .LBB148_46
	mov rbp, qword ptr [rsp + 152]
	cmp rbp, qword ptr [rsp + 136]
	je .LBB148_48
	jmp .LBB148_49
	.p2align	4
.LBB148_46:
	vmovsd xmm0, qword ptr [rip + .LCPI148_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp + 32], xmm0
	mov rbp, qword ptr [rsp + 152]
	cmp rbp, qword ptr [rsp + 136]
	jne .LBB148_49
.LBB148_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_49:
	vmovsd xmm0, qword ptr [rsp + 32]
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 56], rax
	vmovsd qword ptr [rax + 8*rbp], xmm0
	inc rbp
	mov r15, qword ptr [rsp + 176]
	mov qword ptr [rsp + 152], rbp
	cmp r15, qword ptr [rsp + 160]
	jne .LBB148_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_51
.LBB148_4:
	mov qword ptr [rsp + 56], rbp
	mov qword ptr [rsp + 184], r13
	xor ebx, ebx
	xor ebp, ebp
	xor r15d, r15d
	xor r12d, r12d
.LBB148_5:
	mov r13, qword ptr [rsp + 80]
	mov qword ptr [rsp + 48], rax
	lea rdi, [8*r13]
	mov qword ptr [rsp + 72], rdi
	test r13, r13
	je .LBB148_6
	.cfi_escape 0x2e, 0x00
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	call r14
	test rax, rax
	je .LBB148_67
	cmp r13, 5
	jae .LBB148_55
	xor edi, edi
	jmp .LBB148_62
.LBB148_6:
	mov eax, 8
	mov r11d, 8
	mov qword ptr [rsp + 40], rax
	jmp .LBB148_7
.LBB148_55:
	cmp r13, 33
	jae .LBB148_59
	xor edi, edi
	jmp .LBB148_57
.LBB148_59:
	vmovapd zmm0, zmmword ptr [rip + .LCPI148_1]
	mov edx, r13d
	and edx, 31
	mov ecx, 32
	mov rdi, r13
	cmovne rcx, rdx
	mov rdx, qword ptr [rsp + 24]
	xor esi, esi
	sub rdi, rcx
	add rdx, 384
	.p2align	4
.LBB148_60:
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
	jne .LBB148_60
	cmp ecx, 4
	jbe .LBB148_62
.LBB148_57:
	vmovapd ymm0, ymmword ptr [rip + .LCPI148_2]
	mov esi, r13d
	and esi, 3
	mov edx, 4
	mov rcx, rdi
	mov rdi, r13
	cmovne rdx, rsi
	sub rdi, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, qword ptr [rsp + 24]
	.p2align	4
.LBB148_58:
	vpermpd zmm1, zmm0, zmmword ptr [rdx]
	add rdx, 64
	vmovupd ymmword ptr [rax + 8*rcx], ymm1
	add rcx, 4
	cmp rdi, rcx
	jne .LBB148_58
.LBB148_62:
	mov rcx, rdi
	shl rcx, 4
	add rcx, qword ptr [rsp + 24]
	.p2align	4
.LBB148_63:
	vmovsd xmm0, qword ptr [rcx]
	add rcx, 16
	vmovsd qword ptr [rax + 8*rdi], xmm0
	inc rdi
	cmp r13, rdi
	jne .LBB148_63
	mov qword ptr [rsp + 40], rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [8*r13]
	vzeroupper
	call r14
	test rax, rax
	je .LBB148_78
	mov rdi, qword ptr [rsp + 24]
	mov r11, rax
	cmp r13, 5
	jae .LBB148_69
	xor eax, eax
	jmp .LBB148_76
.LBB148_69:
	cmp r13, 33
	jae .LBB148_73
	xor eax, eax
	jmp .LBB148_71
.LBB148_73:
	vmovapd zmm0, zmmword ptr [rip + .LCPI148_1]
	mov eax, r13d
	and eax, 31
	mov ecx, 32
	lea rdx, [rdi + 392]
	cmovne rcx, rax
	mov rax, r13
	xor esi, esi
	sub rax, rcx
	.p2align	4
.LBB148_74:
	vmovupd zmm1, zmmword ptr [rdx - 384]
	vmovupd zmm2, zmmword ptr [rdx - 256]
	vmovupd zmm3, zmmword ptr [rdx - 128]
	vmovupd zmm4, zmmword ptr [rdx]
	vpermt2pd zmm1, zmm0, zmmword ptr [rdx - 320]
	vpermt2pd zmm2, zmm0, zmmword ptr [rdx - 192]
	vpermt2pd zmm3, zmm0, zmmword ptr [rdx - 64]
	vpermt2pd zmm4, zmm0, zmmword ptr [rdx + 64]
	add rdx, 512
	vmovupd zmmword ptr [r11 + 8*rsi], zmm1
	vmovupd zmmword ptr [r11 + 8*rsi + 64], zmm2
	vmovupd zmmword ptr [r11 + 8*rsi + 128], zmm3
	vmovupd zmmword ptr [r11 + 8*rsi + 192], zmm4
	add rsi, 32
	cmp rax, rsi
	jne .LBB148_74
	cmp ecx, 4
	jbe .LBB148_76
.LBB148_71:
	vmovapd ymm0, ymmword ptr [rip + .LCPI148_2]
	mov rcx, rax
	mov eax, r13d
	and eax, 3
	mov edx, 4
	cmovne rdx, rax
	mov rax, r13
	sub rax, rdx
	mov rdx, rcx
	shl rdx, 4
	lea rdx, [rdx + rdi + 8]
	.p2align	4
.LBB148_72:
	vpermpd zmm1, zmm0, zmmword ptr [rdx]
	add rdx, 64
	vmovupd ymmword ptr [r11 + 8*rcx], ymm1
	add rcx, 4
	cmp rax, rcx
	jne .LBB148_72
.LBB148_76:
	mov rcx, rax
	shl rcx, 4
	lea rcx, [rcx + rdi + 8]
	.p2align	4
.LBB148_77:
	vmovsd xmm0, qword ptr [rcx]
	add rcx, 16
	vmovsd qword ptr [r11 + 8*rax], xmm0
	inc rax
	cmp r13, rax
	jne .LBB148_77
.LBB148_7:
	test r12, r12
	je .LBB148_14
	mov rcx, qword ptr [rsp + 64]
	mov rax, qword ptr [rsp + 96]
	xor r13d, r13d
	xor r14d, r14d
	mov qword ptr [rsp + 248], rbx
	mov qword ptr [rsp + 240], r11
	vmovsd xmm0, qword ptr [rcx]
	vmovsd xmm1, qword ptr [rcx + 8]
	mov qword ptr [rsp + 232], rax
	vmovsd qword ptr [rsp + 224], xmm0
	vmovsd qword ptr [rsp + 64], xmm1
	.p2align	4
.LBB148_9:
	mov rax, rbx
	add rax, r14
	je .LBB148_14
	mov rax, rbp
	add rax, r14
	je .LBB148_14
	mov rax, r15
	add rax, r14
	je .LBB148_14
	cmp qword ptr [rsp + 72], r13
	je .LBB148_14
	mov r10, qword ptr [rsp + 48]
	mov rsi, qword ptr [rsp + 184]
	mov rax, qword ptr [rsp + 232]
	lea r9, [rbx + r14 - 1]
	mov rbx, qword ptr [rsp + 40]
	lea rcx, [r12 + r14 - 1]
	vmovsd xmm2, qword ptr [r10 + r13]
	lea r8, [rsi + r13 + 8]
	vmovsd xmm1, qword ptr [rsi + r13]
	mov rsi, qword ptr [rsp + 56]
	lea rdx, [rax + r13 + 8]
	lea rax, [rax + r13]
	vmovsd xmm0, qword ptr [rax]
	lea rax, [rsi + r13 + 8]
	mov qword ptr [rsp + 32], rax
	lea rax, [r10 + r13 + 8]
	vmovsd qword ptr [rsp + 8], xmm2
	vmovsd xmm2, qword ptr [rsp + 224]
	vmulsd xmm2, xmm2, qword ptr [rsi + r13]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 80]
	vmovsd qword ptr [rsp + 192], xmm0
	vmovsd qword ptr [rsp + 200], xmm1
	lea r10, [rax + r14 - 1]
	lea rax, [r11 + r13 + 8]
	lea r11, [rbx + r13 + 8]
	vmovsd qword ptr [rsp + 208], xmm2
	.cfi_escape 0x2e, 0x40
	vmovsd xmm0, qword ptr [rsp + 64]
	lea rdi, [rsp + 256]
	lea rsi, [rsp + 192]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [r15 + r14 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 56]
	.cfi_adjust_cfa_offset 8
	lea rax, [rbp + r14 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 88]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f64>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	vmovups xmm0, xmmword ptr [rsp + 256]
	lea rax, [rsp + 272]
	vmovaps xmmword ptr [rsp + 192], xmm0
	vmovupd xmm0, xmmword ptr [rax]
	vmovapd xmmword ptr [rsp + 288], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 192]
	call engine::force::tree_sum::<f64>
	vmulsd xmm0, xmm0, qword ptr [rsp + 8]
	vaddsd xmm0, xmm0, qword ptr [rbx + r13]
	vmovsd qword ptr [rbx + r13], xmm0
	mov rbx, qword ptr [rsp + 248]
	vmovapd xmm0, xmmword ptr [rsp + 288]
	vmovapd xmmword ptr [rsp + 256], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 256]
	call engine::force::tree_sum::<f64>
	mov r11, qword ptr [rsp + 240]
	vmulsd xmm0, xmm0, qword ptr [rsp + 8]
	dec r14
	mov rax, r12
	vaddsd xmm0, xmm0, qword ptr [r11 + r13]
	vmovsd qword ptr [r11 + r13], xmm0
	add r13, 8
	add rax, r14
	jne .LBB148_9
.LBB148_14:
	mov rdi, qword ptr [rsp + 80]
	test rdi, rdi
	je .LBB148_92
	cmp rdi, 4
	jae .LBB148_80
	mov r8, qword ptr [rsp + 24]
	mov r14, qword ptr [rsp + 40]
	xor eax, eax
	jmp .LBB148_89
.LBB148_80:
	mov r8, qword ptr [rsp + 24]
	mov r14, qword ptr [rsp + 40]
	movabs rcx, 576460752303423472
	cmp rdi, 16
	jae .LBB148_82
	xor eax, eax
	jmp .LBB148_86
.LBB148_82:
	vmovapd zmm0, zmmword ptr [rip + .LCPI148_3]
	vmovapd zmm1, zmmword ptr [rip + .LCPI148_4]
	mov rdx, rdi
	shr rdx, 4
	mov rax, rdi
	and rax, rcx
	xor esi, esi
	shl rdx, 7
	.p2align	4
.LBB148_83:
	vmovupd zmm2, zmmword ptr [r14 + rsi]
	vmovupd zmm3, zmmword ptr [r14 + rsi + 64]
	vmovupd zmm4, zmmword ptr [r11 + rsi]
	vmovupd zmm5, zmmword ptr [r11 + rsi + 64]
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
	jne .LBB148_83
	cmp rdi, rax
	je .LBB148_91
	test dil, 12
	je .LBB148_89
.LBB148_86:
	vmovapd zmm0, zmmword ptr [rip + .LCPI148_5]
	add rcx, 12
	mov rdx, rax
	mov rax, rcx
	mov rcx, rdx
	shl rcx, 4
	and rax, rdi
	add rcx, r8
	.p2align	4
.LBB148_87:
	vbroadcastf64x4 zmm1, ymmword ptr [r11 + 8*rdx]
	vbroadcastf64x4 zmm2, ymmword ptr [r14 + 8*rdx]
	add rdx, 4
	vpermt2pd zmm2, zmm0, zmm1
	vmovupd zmmword ptr [rcx], zmm2
	add rcx, 64
	cmp rax, rdx
	jne .LBB148_87
	cmp rdi, rax
	je .LBB148_91
.LBB148_89:
	mov rcx, rax
	shl rcx, 4
	lea rcx, [rcx + r8 + 8]
	.p2align	4
.LBB148_90:
	vmovsd xmm0, qword ptr [r14 + 8*rax]
	vmovsd xmm1, qword ptr [r11 + 8*rax]
	inc rax
	vmovsd qword ptr [rcx - 8], xmm0
	vmovsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp rdi, rax
	jne .LBB148_90
.LBB148_91:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r11
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call rbx
.LBB148_92:
	cmp qword ptr [rsp + 160], 0
	mov rdi, qword ptr [rsp + 48]
	je .LBB148_94
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB148_94:
	cmp qword ptr [rsp + 136], 0
	je .LBB148_96
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB148_96:
	cmp qword ptr [rsp + 112], 0
	je .LBB148_98
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB148_98:
	cmp qword ptr [rsp + 88], 0
	je .LBB148_100
	mov rdi, qword ptr [rsp + 96]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB148_100:
	add rsp, 312
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
.LBB148_106:
	.cfi_def_cfa_offset 368
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB148_19:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_68
.LBB148_104:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_68
.LBB148_27:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_68
.LBB148_67:
	.cfi_escape 0x2e, 0x00
	mov rsi, qword ptr [rsp + 72]
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB148_68
.LBB148_78:
	.cfi_escape 0x2e, 0x00
	mov rsi, qword ptr [rsp + 72]
	mov edi, 8
	call alloc::raw_vec::handle_error
.LBB148_68:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	call rax
	jmp .LBB148_30
	jmp .LBB148_29
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB148_103
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	jmp .LBB148_21
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB148_103
.LBB148_21:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call rax
	jmp .LBB148_102
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	jne .LBB148_102
	jmp .LBB148_103
.LBB148_29:
	mov rbx, rax
.LBB148_30:
	cmp qword ptr [rsp + 160], 0
	jne .LBB148_31
	cmp qword ptr [rsp + 136], 0
	jne .LBB148_33
.LBB148_34:
	cmp qword ptr [rsp + 112], 0
	jne .LBB148_35
.LBB148_36:
	cmp qword ptr [rsp + 88], 0
	jne .LBB148_37
	jmp .LBB148_103
.LBB148_31:
	mov rdi, qword ptr [rsp + 168]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB148_34
.LBB148_33:
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB148_36
.LBB148_35:
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 88], 0
	je .LBB148_103
.LBB148_37:
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 8], rax
.LBB148_102:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 8]
	call rax
.LBB148_103:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
