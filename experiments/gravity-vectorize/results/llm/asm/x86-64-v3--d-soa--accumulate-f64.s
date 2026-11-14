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
	sub rsp, 296
	.cfi_def_cfa_offset 352
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r12, rcx
	mov r8, qword ptr [rsi + 16]
	lea rbx, [8*r8]
	mov rax, r8
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	test rbx, rbx
	mov qword ptr [rsp + 48], r12
	mov qword ptr [rsp + 56], rdi
	je .LBB146_2
	mov qword ptr [rsp + 8], r8
	mov r13, rdx
	mov r14, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB146_99
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_19
	mov r15, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_97
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_27
	mov rsi, r14
	mov rdx, r13
	mov rcx, qword ptr [rsp]
	mov r8, qword ptr [rsp + 8]
	jmp .LBB146_3
.LBB146_2:
	mov ebp, 8
	mov ecx, 8
	mov r15d, 8
	mov eax, 8
.LBB146_3:
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 80], r8
	mov r12, rcx
	mov qword ptr [rsp + 88], rcx
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 104], r8
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], 0
	mov qword ptr [rsp + 128], r8
	mov qword ptr [rsp + 136], rbp
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 152], r8
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 168], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB146_4
	mov qword ptr [rsp + 8], r8
	mov r15, qword ptr [rsi + 8]
	mov rbp, qword ptr [rsi + 56]
	add r15, 8
	xor r14d, r14d
	jmp .LBB146_40
	.p2align	4
.LBB146_51:
	mov rax, qword ptr [rsp + 160]
	vmovsd xmm0, qword ptr [rsp]
	vmovsd qword ptr [rax + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 168], r13
	add r15, 16
	cmp qword ptr [rsp + 8], r14
	je .LBB146_5
.LBB146_40:
	vmovsd xmm0, qword ptr [r15 - 8]
	vmovsd qword ptr [rsp + 16], xmm0
	vmovsd xmm0, qword ptr [r15]
	vmovsd qword ptr [rsp + 32], xmm0
	vmovsd xmm0, qword ptr [rbp + 8*r14]
	vmovsd qword ptr [rsp], xmm0
	cmp r14, qword ptr [rsp + 80]
	mov rax, r12
	jne .LBB146_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 88]
.LBB146_43:
	mov r12, rax
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 96], r14
	mov rax, qword ptr [rsp + 120]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 104]
	jne .LBB146_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 104]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_45:
	mov rax, qword ptr [rsp + 112]
	mov qword ptr [rsp + 72], rax
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 32], rbx
	mov qword ptr [rsp + 120], rbx
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 16], xmm1
	vucomisd xmm0, xmm2
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
	vmovsd qword ptr [rsp + 16], xmm0
	mov rbx, qword ptr [rsp + 144]
	cmp rbx, qword ptr [rsp + 128]
	jne .LBB146_49
.LBB146_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_49:
	mov rax, qword ptr [rsp + 136]
	mov qword ptr [rsp + 64], rax
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 144], rbx
	mov r13, qword ptr [rsp + 168]
	cmp r13, qword ptr [rsp + 152]
	jne .LBB146_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_51
.LBB146_4:
	mov qword ptr [rsp + 64], rbp
	mov qword ptr [rsp + 72], r15
	mov qword ptr [rsp + 32], 0
	xor ebx, ebx
	xor r13d, r13d
	xor r14d, r14d
.LBB146_5:
	mov qword ptr [rsp + 176], rax
	mov r12, qword ptr [rsp + 48]
	lea rdi, [8*r12]
	test r12, r12
	mov qword ptr [rsp + 40], rdi
	je .LBB146_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_67
	cmp r12, 5
	mov r8, qword ptr [rsp + 24]
	jae .LBB146_55
	xor edi, edi
	jmp .LBB146_62
.LBB146_6:
	mov r11d, 8
	mov r15d, 8
	jmp .LBB146_7
.LBB146_55:
	cmp r12, 17
	jae .LBB146_59
	xor edi, edi
	jmp .LBB146_57
.LBB146_59:
	mov edx, r12d
	and edx, 15
	mov ecx, 16
	cmovne rcx, rdx
	mov rdi, r12
	sub rdi, rcx
	lea rdx, [r8 + 192]
	xor esi, esi
	.p2align	4
.LBB146_60:
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
	jne .LBB146_60
	cmp ecx, 4
	jbe .LBB146_62
.LBB146_57:
	mov ecx, r12d
	and ecx, 3
	mov edx, 4
	cmovne rdx, rcx
	mov rcx, rdi
	mov rdi, r12
	sub rdi, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, r8
	.p2align	4
.LBB146_58:
	vmovupd ymm0, ymmword ptr [rdx]
	vmovupd ymm1, ymmword ptr [rdx + 32]
	vperm2f128 ymm2, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm2
	vmovupd ymmword ptr [rax + 8*rcx], ymm0
	add rcx, 4
	add rdx, 64
	cmp rdi, rcx
	jne .LBB146_58
.LBB146_62:
	mov rcx, rdi
	shl rcx, 4
	add rcx, r8
	.p2align	4
.LBB146_63:
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [rax + 8*rdi], xmm0
	inc rdi
	add rcx, 16
	cmp r12, rdi
	jne .LBB146_63
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [8*r12]
	vzeroupper
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_78
	mov r15, rax
	cmp r12, 5
	mov r11, rbp
	lea rdi, [8*r12]
	jae .LBB146_69
	xor eax, eax
	mov r8, qword ptr [rsp + 24]
	jmp .LBB146_76
.LBB146_69:
	cmp r12, 17
	mov r8, qword ptr [rsp + 24]
	jae .LBB146_73
	xor eax, eax
	jmp .LBB146_71
.LBB146_73:
	mov eax, r12d
	and eax, 15
	mov ecx, 16
	cmovne rcx, rax
	mov rax, r12
	sub rax, rcx
	lea rdx, [r8 + 200]
	xor esi, esi
	.p2align	4
.LBB146_74:
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
	vmovupd ymmword ptr [r15 + 8*rsi], ymm0
	vmovupd ymmword ptr [r15 + 8*rsi + 32], ymm1
	vmovupd ymmword ptr [r15 + 8*rsi + 64], ymm2
	vmovupd ymmword ptr [r15 + 8*rsi + 96], ymm3
	add rsi, 16
	add rdx, 256
	cmp rax, rsi
	jne .LBB146_74
	cmp ecx, 4
	jbe .LBB146_76
.LBB146_71:
	mov ecx, r12d
	and ecx, 3
	mov edx, 4
	cmovne rdx, rcx
	mov rcx, rax
	mov rax, r12
	sub rax, rdx
	mov rdx, rcx
	shl rdx, 4
	add rdx, r8
	add rdx, 8
	.p2align	4
.LBB146_72:
	vmovupd ymm0, ymmword ptr [rdx]
	vmovupd ymm1, ymmword ptr [rdx + 32]
	vperm2f128 ymm2, ymm0, ymm1, 49
	vinsertf128 ymm0, ymm0, xmm1, 1
	vunpcklpd ymm0, ymm0, ymm2
	vmovupd ymmword ptr [r15 + 8*rcx], ymm0
	add rcx, 4
	add rdx, 64
	cmp rax, rcx
	jne .LBB146_72
.LBB146_76:
	mov rcx, rax
	shl rcx, 4
	add rcx, r8
	add rcx, 8
	.p2align	4
.LBB146_77:
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [r15 + 8*rax], xmm0
	inc rax
	add rcx, 16
	cmp r12, rax
	jne .LBB146_77
.LBB146_7:
	test r14, r14
	je .LBB146_14
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 200], rax
	mov rax, qword ptr [rsp + 56]
	vmovsd xmm0, qword ptr [rax]
	vmovsd qword ptr [rsp + 192], xmm0
	vmovsd xmm0, qword ptr [rax + 8]
	vmovsd qword ptr [rsp + 184], xmm0
	xor ebp, ebp
	xor r12d, r12d
	mov qword ptr [rsp], r11
	.p2align	4
.LBB146_9:
	mov rax, qword ptr [rsp + 32]
	add rax, r12
	je .LBB146_14
	mov rax, rbx
	add rax, r12
	je .LBB146_14
	mov rax, r13
	add rax, r12
	je .LBB146_14
	cmp rdi, rbp
	je .LBB146_14
	mov rcx, qword ptr [rsp + 200]
	lea rax, [rcx + rbp]
	lea rdx, [rcx + rbp]
	add rdx, 8
	lea rcx, [r14 + r12 - 1]
	mov rsi, qword ptr [rsp + 72]
	lea r8, [rsi + rbp + 8]
	mov rdi, qword ptr [rsp + 32]
	lea r9, [rdi + r12 - 1]
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rsi + rbp]
	mov rsi, qword ptr [rsp + 64]
	lea rax, [rsi + rbp + 8]
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [rsp + 176]
	vmovsd xmm2, qword ptr [rax + rbp]
	vmovsd qword ptr [rsp + 16], xmm2
	lea rax, [rax + rbp + 8]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rsp + 48]
	lea r10, [rax + r12 - 1]
	lea rax, [r15 + rbp + 8]
	mov rdi, qword ptr [rsp]
	lea r11, [rdi + rbp + 8]
	vmovsd xmm2, qword ptr [rsp + 192]
	vmulsd xmm2, xmm2, qword ptr [rsi + rbp]
	vmovsd qword ptr [rsp + 208], xmm0
	vmovsd qword ptr [rsp + 216], xmm1
	vmovsd qword ptr [rsp + 224], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 232]
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
	lea rax, [r13 + r12 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 96]
	.cfi_adjust_cfa_offset 8
	lea rax, [rbx + r12 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 64]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f64>
	mov rdi, qword ptr [rsp + 104]
	mov r11, qword ptr [rsp + 64]
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	vmovupd xmm0, xmmword ptr [rsp + 248]
	vblendpd xmm0, xmm0, xmmword ptr [rsp + 232], 1
	vaddpd xmm0, xmm0, xmmword ptr [rsp + 240]
	vmovupd xmm1, xmmword ptr [rsp + 280]
	vshufpd xmm2, xmm0, xmm0, 1
	vaddsd xmm0, xmm0, xmm2
	vmovsd xmm2, qword ptr [rsp + 16]
	vmulsd xmm0, xmm2, xmm0
	vblendpd xmm1, xmm1, xmmword ptr [rsp + 264], 1
	vaddpd xmm1, xmm1, xmmword ptr [rsp + 272]
	vaddsd xmm0, xmm0, qword ptr [r11 + rbp]
	vmovsd qword ptr [r11 + rbp], xmm0
	vshufpd xmm0, xmm1, xmm1, 1
	vaddsd xmm0, xmm1, xmm0
	vmulsd xmm0, xmm2, xmm0
	vaddsd xmm0, xmm0, qword ptr [r15 + rbp]
	vmovsd qword ptr [r15 + rbp], xmm0
	dec r12
	add rbp, 8
	mov rax, r14
	add rax, r12
	jne .LBB146_9
.LBB146_14:
	mov rdx, qword ptr [rsp + 48]
	test rdx, rdx
	mov r14, qword ptr [rsp + 64]
	je .LBB146_86
	cmp rdx, 8
	jae .LBB146_80
	xor eax, eax
	mov rsi, qword ptr [rsp + 24]
	jmp .LBB146_83
.LBB146_80:
	movabs rax, 576460752303423480
	and rax, rdx
	and rdi, -64
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 24]
	.p2align	4
.LBB146_81:
	vmovupd ymm0, ymmword ptr [r11 + rcx]
	vmovupd ymm1, ymmword ptr [r11 + rcx + 32]
	vmovupd ymm2, ymmword ptr [r15 + rcx]
	vmovupd ymm3, ymmword ptr [r15 + rcx + 32]
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
	jne .LBB146_81
	cmp rdx, rax
	je .LBB146_85
.LBB146_83:
	mov rcx, rax
	shl rcx, 4
	add rcx, rsi
	add rcx, 8
	.p2align	4
.LBB146_84:
	vmovsd xmm0, qword ptr [r11 + 8*rax]
	vmovsd xmm1, qword ptr [r15 + 8*rax]
	inc rax
	vmovsd qword ptr [rcx - 8], xmm0
	vmovsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp rdx, rax
	jne .LBB146_84
.LBB146_85:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r15
	mov r15, r11
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call rbx
.LBB146_86:
	cmp qword ptr [rsp + 152], 0
	mov rdi, qword ptr [rsp + 176]
	je .LBB146_88
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_88:
	cmp qword ptr [rsp + 128], 0
	mov rbx, qword ptr [rsp + 72]
	je .LBB146_90
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_90:
	cmp qword ptr [rsp + 104], 0
	je .LBB146_92
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_92:
	cmp qword ptr [rsp + 80], 0
	je .LBB146_93
	mov rdi, qword ptr [rsp + 88]
	add rsp, 296
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
.LBB146_93:
	.cfi_def_cfa_offset 352
	add rsp, 296
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
.LBB146_99:
	.cfi_def_cfa_offset 352
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
.LBB146_97:
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
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
	jmp .LBB146_68
.LBB146_78:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
.LBB146_68:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_30
	jmp .LBB146_29
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	je .LBB146_96
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_21
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	je .LBB146_96
.LBB146_21:
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_95
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	jne .LBB146_95
	jmp .LBB146_96
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
	jmp .LBB146_96
.LBB146_31:
	mov rdi, qword ptr [rsp + 160]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 128], 0
	je .LBB146_34
.LBB146_33:
	mov rdi, qword ptr [rsp + 136]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 104], 0
	je .LBB146_36
.LBB146_35:
	mov rdi, qword ptr [rsp + 112]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 80], 0
	je .LBB146_96
.LBB146_37:
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp], rax
.LBB146_95:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp]
	call qword ptr [rip + free@GOTPCREL]
.LBB146_96:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
