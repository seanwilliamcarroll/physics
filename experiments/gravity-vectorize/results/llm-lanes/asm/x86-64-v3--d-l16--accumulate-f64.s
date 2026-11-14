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
	sub rsp, 728
	.cfi_def_cfa_offset 784
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rcx
	mov r8, qword ptr [rsi + 16]
	lea rbx, [8*r8]
	mov rax, r8
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB148_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	test rbx, rbx
	mov qword ptr [rsp + 48], r13
	mov qword ptr [rsp + 56], rdi
	je .LBB148_2
	mov qword ptr [rsp + 16], r8
	mov r15, rdx
	mov r14, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_100
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_19
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_98
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_27
	mov rsi, r14
	mov rdx, r15
	mov rcx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	jmp .LBB148_3
.LBB148_2:
	mov ebp, 8
	mov ecx, 8
	mov r12d, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 64], r8
	mov r13, rcx
	mov qword ptr [rsp + 72], rcx
	mov qword ptr [rsp + 80], 0
	mov qword ptr [rsp + 88], r8
	mov qword ptr [rsp + 96], r12
	mov qword ptr [rsp + 104], 0
	mov qword ptr [rsp + 112], r8
	mov qword ptr [rsp + 120], rbp
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r8
	mov qword ptr [rsp + 144], rax
	mov qword ptr [rsp + 152], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB148_4
	mov qword ptr [rsp + 16], r8
	mov r14, qword ptr [rsi + 8]
	mov rbp, qword ptr [rsi + 56]
	add r14, 8
	xor r15d, r15d
	jmp .LBB148_40
	.p2align	4
.LBB148_51:
	mov rax, qword ptr [rsp + 144]
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 152], r12
	add r14, 16
	cmp qword ptr [rsp + 16], r15
	je .LBB148_5
.LBB148_40:
	vmovsd xmm0, qword ptr [r14 - 8]
	vmovsd qword ptr [rsp], xmm0
	vmovsd xmm0, qword ptr [r14]
	vmovsd qword ptr [rsp + 24], xmm0
	vmovsd xmm0, qword ptr [rbp + 8*r15]
	vmovsd qword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 64]
	mov rax, r13
	jne .LBB148_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 64]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 72]
.LBB148_43:
	mov r13, rax
	vmovsd xmm0, qword ptr [rsp]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 80], r15
	mov rax, qword ptr [rsp + 104]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 88]
	jne .LBB148_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 88]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_45:
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 176], rax
	vmovsd xmm0, qword ptr [rsp + 24]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 24], rbx
	mov qword ptr [rsp + 104], rbx
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp + 8]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp], xmm1
	vucomisd xmm0, xmm2
	jne .LBB148_46
	jp .LBB148_46
	mov rbx, qword ptr [rsp + 128]
	cmp rbx, qword ptr [rsp + 112]
	je .LBB148_48
	jmp .LBB148_49
	.p2align	4
.LBB148_46:
	vmovsd xmm0, qword ptr [rip + .LCPI148_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp], xmm0
	mov rbx, qword ptr [rsp + 128]
	cmp rbx, qword ptr [rsp + 112]
	jne .LBB148_49
.LBB148_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_49:
	mov rax, qword ptr [rsp + 120]
	mov qword ptr [rsp + 168], rax
	vmovsd xmm0, qword ptr [rsp]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 128], rbx
	mov r12, qword ptr [rsp + 152]
	cmp r12, qword ptr [rsp + 136]
	jne .LBB148_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_51
.LBB148_4:
	mov qword ptr [rsp + 168], rbp
	mov qword ptr [rsp + 176], r12
	mov qword ptr [rsp + 24], 0
	xor ebx, ebx
	xor r12d, r12d
	xor r15d, r15d
.LBB148_5:
	mov qword ptr [rsp + 160], rax
	mov r13, qword ptr [rsp + 48]
	lea rdi, [8*r13]
	test r13, r13
	mov qword ptr [rsp + 40], rdi
	je .LBB148_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_67
	cmp r13, 5
	mov rbp, qword ptr [rsp + 32]
	jae .LBB148_55
	xor edi, edi
	jmp .LBB148_62
.LBB148_6:
	mov eax, 8
	mov qword ptr [rsp], rax
	mov r14d, 8
	jmp .LBB148_7
.LBB148_55:
	cmp r13, 17
	jae .LBB148_59
	xor edi, edi
	jmp .LBB148_57
.LBB148_59:
	mov edx, r13d
	and edx, 15
	mov ecx, 16
	cmovne rcx, rdx
	mov rdi, r13
	sub rdi, rcx
	lea rdx, [rbp + 192]
	xor esi, esi
	.p2align	4
.LBB148_60:
	vmovupd ymm0, ymmword ptr [rdx - 192]
	vmovupd ymm1, ymmword ptr [rdx - 160]
	vmovupd ymm2, ymmword ptr [rdx - 128]
	vmovupd ymm3, ymmword ptr [rdx - 96]
	vperm2f128 ymm4, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm4
	vperm2f128 ymm1, ymm2, ymm3, 49
	vinsertf128 ymm2, ymm2, xmm3, 1
	vunpcklpd ymm1, ymm2, ymm1
	vmovupd ymm2, ymmword ptr [rdx - 32]
	vmovupd ymm3, ymmword ptr [rdx - 64]
	vperm2f128 ymm4, ymm3, ymm2, 49
	vinsertf128 ymm2, ymm3, xmm2, 1
	vunpcklpd ymm2, ymm2, ymm4
	vmovupd ymm3, ymmword ptr [rdx + 32]
	vmovupd ymm4, ymmword ptr [rdx]
	vperm2f128 ymm5, ymm4, ymm3, 49
	vinsertf128 ymm3, ymm4, xmm3, 1
	vunpcklpd ymm3, ymm3, ymm5
	vmovupd ymmword ptr [rax + 8*rsi], ymm0
	vmovupd ymmword ptr [rax + 8*rsi + 32], ymm1
	vmovupd ymmword ptr [rax + 8*rsi + 64], ymm2
	vmovupd ymmword ptr [rax + 8*rsi + 96], ymm3
	add rsi, 16
	add rdx, 256
	cmp rdi, rsi
	jne .LBB148_60
	cmp ecx, 4
	jbe .LBB148_62
.LBB148_57:
	mov ecx, r13d
	and ecx, 3
	mov edx, 4
	cmovne rdx, rcx
	mov rcx, rdi
	mov rdi, r13
	sub rdi, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, rbp
	.p2align	4
.LBB148_58:
	vmovupd ymm0, ymmword ptr [rdx]
	vmovupd ymm1, ymmword ptr [rdx + 32]
	vperm2f128 ymm2, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm2
	vmovupd ymmword ptr [rax + 8*rcx], ymm0
	add rcx, 4
	add rdx, 64
	cmp rdi, rcx
	jne .LBB148_58
.LBB148_62:
	mov rcx, rdi
	shl rcx, 4
	add rcx, rbp
	.p2align	4
.LBB148_63:
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [rax + 8*rdi], xmm0
	inc rdi
	add rcx, 16
	cmp r13, rdi
	jne .LBB148_63
	mov qword ptr [rsp], rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [8*r13]
	vzeroupper
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_78
	mov r14, rax
	cmp r13, 5
	lea rdi, [8*r13]
	jae .LBB148_69
	xor eax, eax
	jmp .LBB148_76
.LBB148_69:
	cmp r13, 17
	jae .LBB148_73
	xor eax, eax
	jmp .LBB148_71
.LBB148_73:
	mov eax, r13d
	and eax, 15
	mov ecx, 16
	cmovne rcx, rax
	mov rax, r13
	sub rax, rcx
	lea rdx, [rbp + 200]
	xor esi, esi
	.p2align	4
.LBB148_74:
	vmovupd ymm0, ymmword ptr [rdx - 192]
	vmovupd ymm1, ymmword ptr [rdx - 160]
	vmovupd ymm2, ymmword ptr [rdx - 128]
	vmovupd ymm3, ymmword ptr [rdx - 96]
	vperm2f128 ymm4, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm4
	vperm2f128 ymm1, ymm2, ymm3, 49
	vinsertf128 ymm2, ymm2, xmm3, 1
	vunpcklpd ymm1, ymm2, ymm1
	vmovupd ymm2, ymmword ptr [rdx - 32]
	vmovupd ymm3, ymmword ptr [rdx - 64]
	vperm2f128 ymm4, ymm3, ymm2, 49
	vinsertf128 ymm2, ymm3, xmm2, 1
	vunpcklpd ymm2, ymm2, ymm4
	vmovupd ymm3, ymmword ptr [rdx + 32]
	vmovupd ymm4, ymmword ptr [rdx]
	vperm2f128 ymm5, ymm4, ymm3, 49
	vinsertf128 ymm3, ymm4, xmm3, 1
	vunpcklpd ymm3, ymm3, ymm5
	vmovupd ymmword ptr [r14 + 8*rsi], ymm0
	vmovupd ymmword ptr [r14 + 8*rsi + 32], ymm1
	vmovupd ymmword ptr [r14 + 8*rsi + 64], ymm2
	vmovupd ymmword ptr [r14 + 8*rsi + 96], ymm3
	add rsi, 16
	add rdx, 256
	cmp rax, rsi
	jne .LBB148_74
	cmp ecx, 4
	jbe .LBB148_76
.LBB148_71:
	mov ecx, r13d
	and ecx, 3
	mov edx, 4
	cmovne rdx, rcx
	mov rcx, rax
	mov rax, r13
	sub rax, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, rbp
	add rdx, 8
	.p2align	4
.LBB148_72:
	vmovupd ymm0, ymmword ptr [rdx]
	vmovupd ymm1, ymmword ptr [rdx + 32]
	vperm2f128 ymm2, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm2
	vmovupd ymmword ptr [r14 + 8*rcx], ymm0
	add rcx, 4
	add rdx, 64
	cmp rax, rcx
	jne .LBB148_72
.LBB148_76:
	mov rcx, rax
	shl rcx, 4
	add rcx, rbp
	add rcx, 8
	.p2align	4
.LBB148_77:
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [r14 + 8*rax], xmm0
	inc rax
	add rcx, 16
	cmp r13, rax
	jne .LBB148_77
.LBB148_7:
	test r15, r15
	je .LBB148_14
	mov rax, qword ptr [rsp + 72]
	mov qword ptr [rsp + 200], rax
	mov rax, qword ptr [rsp + 56]
	vmovsd xmm0, qword ptr [rax]
	vmovsd qword ptr [rsp + 192], xmm0
	vmovsd xmm0, qword ptr [rax + 8]
	vmovsd qword ptr [rsp + 184], xmm0
	xor ebp, ebp
	xor r13d, r13d
	.p2align	4
.LBB148_9:
	mov rax, qword ptr [rsp + 24]
	add rax, r13
	je .LBB148_14
	mov rax, rbx
	add rax, r13
	je .LBB148_14
	mov rax, r12
	add rax, r13
	je .LBB148_14
	cmp rdi, rbp
	je .LBB148_14
	mov rcx, qword ptr [rsp + 200]
	lea rax, [rcx + rbp]
	lea rdx, [rcx + rbp]
	add rdx, 8
	lea rcx, [r15 + r13 - 1]
	mov rsi, qword ptr [rsp + 176]
	lea r8, [rsi + rbp + 8]
	mov rdi, qword ptr [rsp + 24]
	lea r9, [rdi + r13 - 1]
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rsi + rbp]
	mov rsi, qword ptr [rsp + 168]
	lea rax, [rsi + rbp + 8]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 160]
	vmovsd xmm2, qword ptr [rax + rbp]
	vmovsd qword ptr [rsp + 8], xmm2
	lea rax, [rax + rbp + 8]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rsp + 48]
	lea r10, [rax + r13 - 1]
	lea rax, [r14 + rbp + 8]
	mov rdi, qword ptr [rsp]
	lea r11, [rdi + rbp + 8]
	vmovsd xmm2, qword ptr [rsp + 192]
	vmulsd xmm2, xmm2, qword ptr [rsi + rbp]
	vmovsd qword ptr [rsp + 208], xmm0
	vmovsd qword ptr [rsp + 216], xmm1
	vmovsd qword ptr [rsp + 224], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 464]
	lea rsi, [rsp + 208]
	vmovsd xmm0, qword ptr [rsp + 184]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [r12 + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 96]
	.cfi_adjust_cfa_offset 8
	lea rax, [rbx + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f64>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	vmovups ymm0, ymmword ptr [rsp + 464]
	vmovups ymm1, ymmword ptr [rsp + 496]
	vmovups ymm2, ymmword ptr [rsp + 528]
	vmovups ymm3, ymmword ptr [rsp + 560]
	vmovups ymmword ptr [rsp + 304], ymm3
	vmovups ymmword ptr [rsp + 272], ymm2
	vmovups ymmword ptr [rsp + 240], ymm1
	vmovups ymmword ptr [rsp + 208], ymm0
	lea rax, [rsp + 592]
	vmovupd ymm0, ymmword ptr [rax]
	vmovups ymm1, ymmword ptr [rax + 32]
	vmovups ymm2, ymmword ptr [rax + 64]
	vmovups ymm3, ymmword ptr [rax + 96]
	vmovups ymmword ptr [rsp + 432], ymm3
	vmovups ymmword ptr [rsp + 400], ymm2
	vmovups ymmword ptr [rsp + 368], ymm1
	vmovupd ymmword ptr [rsp + 336], ymm0
	.cfi_escape 0x2e, 0x00
	mov esi, 16
	lea rdi, [rsp + 208]
	vzeroupper
	call engine::force::tree_sum::<f64>
	vmulsd xmm0, xmm0, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp]
	vaddsd xmm0, xmm0, qword ptr [rax + rbp]
	vmovsd qword ptr [rax + rbp], xmm0
	vmovupd ymm0, ymmword ptr [rsp + 336]
	vmovupd ymm1, ymmword ptr [rsp + 368]
	vmovupd ymm2, ymmword ptr [rsp + 400]
	vmovupd ymm3, ymmword ptr [rsp + 432]
	vmovupd ymmword ptr [rsp + 560], ymm3
	vmovupd ymmword ptr [rsp + 528], ymm2
	vmovupd ymmword ptr [rsp + 496], ymm1
	vmovupd ymmword ptr [rsp + 464], ymm0
	.cfi_escape 0x2e, 0x00
	mov esi, 16
	lea rdi, [rsp + 464]
	vzeroupper
	call engine::force::tree_sum::<f64>
	mov rdi, qword ptr [rsp + 40]
	vmulsd xmm0, xmm0, qword ptr [rsp + 8]
	vaddsd xmm0, xmm0, qword ptr [r14 + rbp]
	vmovsd qword ptr [r14 + rbp], xmm0
	dec r13
	add rbp, 8
	mov rax, r15
	add rax, r13
	jne .LBB148_9
.LBB148_14:
	mov rdx, qword ptr [rsp + 48]
	test rdx, rdx
	je .LBB148_86
	cmp rdx, 8
	jae .LBB148_80
	xor eax, eax
	mov rsi, qword ptr [rsp + 32]
	mov r15, qword ptr [rsp]
	jmp .LBB148_83
.LBB148_80:
	movabs rax, 576460752303423480
	and rax, rdx
	and rdi, -64
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 32]
	mov r15, qword ptr [rsp]
	.p2align	4
.LBB148_81:
	vmovupd ymm0, ymmword ptr [r15 + rcx]
	vmovupd ymm1, ymmword ptr [r15 + rcx + 32]
	vmovupd ymm2, ymmword ptr [r14 + rcx]
	vmovupd ymm3, ymmword ptr [r14 + rcx + 32]
	vpermpd ymm4, ymm2, 96
	vpermpd ymm5, ymm0, 212
	vblendpd ymm4, ymm5, ymm4, 10
	vpermpd ymm2, ymm2, 230
	vpermpd ymm0, ymm0, 230
	vshufpd ymm0, ymm0, ymm2, 12
	vmovupd ymmword ptr [rsi + 2*rcx + 32], ymm0
	vmovupd ymmword ptr [rsi + 2*rcx], ymm4
	vpermpd ymm0, ymm3, 96
	vpermpd ymm2, ymm1, 212
	vblendpd ymm0, ymm2, ymm0, 10
	vpermpd ymm2, ymm3, 230
	vpermpd ymm1, ymm1, 230
	vshufpd ymm1, ymm1, ymm2, 12
	vmovupd ymmword ptr [rsi + 2*rcx + 96], ymm1
	vmovupd ymmword ptr [rsi + 2*rcx + 64], ymm0
	add rcx, 64
	cmp rdi, rcx
	jne .LBB148_81
	cmp rdx, rax
	je .LBB148_85
.LBB148_83:
	mov rcx, rax
	shl rcx, 4
	add rcx, rsi
	add rcx, 8
	.p2align	4
.LBB148_84:
	vmovsd xmm0, qword ptr [r15 + 8*rax]
	vmovsd xmm1, qword ptr [r14 + 8*rax]
	inc rax
	vmovsd qword ptr [rcx - 8], xmm0
	vmovsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp rdx, rax
	jne .LBB148_84
.LBB148_85:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call rbx
.LBB148_86:
	cmp qword ptr [rsp + 136], 0
	mov rdi, qword ptr [rsp + 160]
	je .LBB148_88
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_88:
	cmp qword ptr [rsp + 112], 0
	je .LBB148_90
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_90:
	cmp qword ptr [rsp + 88], 0
	je .LBB148_92
	mov rdi, qword ptr [rsp + 96]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_92:
	cmp qword ptr [rsp + 64], 0
	je .LBB148_94
	mov rdi, qword ptr [rsp + 72]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_94:
	add rsp, 728
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
.LBB148_100:
	.cfi_def_cfa_offset 784
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
.LBB148_98:
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
	mov edi, 8
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
	jmp .LBB148_68
.LBB148_78:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
.LBB148_68:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_30
	jmp .LBB148_29
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_97
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_21
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_97
.LBB148_21:
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_96
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB148_96
	jmp .LBB148_97
.LBB148_29:
	mov rbx, rax
.LBB148_30:
	cmp qword ptr [rsp + 136], 0
	jne .LBB148_31
	cmp qword ptr [rsp + 112], 0
	jne .LBB148_33
.LBB148_34:
	cmp qword ptr [rsp + 88], 0
	jne .LBB148_35
.LBB148_36:
	cmp qword ptr [rsp + 64], 0
	jne .LBB148_37
	jmp .LBB148_97
.LBB148_31:
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB148_34
.LBB148_33:
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 88], 0
	je .LBB148_36
.LBB148_35:
	mov rdi, qword ptr [rsp + 96]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 64], 0
	je .LBB148_97
.LBB148_37:
	mov rax, qword ptr [rsp + 72]
	mov qword ptr [rsp + 8], rax
.LBB148_96:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_97:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
