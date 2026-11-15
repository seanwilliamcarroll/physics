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
	sub rsp, 440
	.cfi_def_cfa_offset 496
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r15, qword ptr [rsi + 16]
	mov r13, rcx
	movabs rcx, 9223372036854775801
	lea rbp, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB148_1
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 104], rdx
	mov qword ptr [rsp + 88], r13
	mov qword ptr [rsp + 32], rbp
	mov qword ptr [rsp + 96], rdi
	test rbp, rbp
	je .LBB148_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov qword ptr [rsp + 16], rsi
	call r14
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_95
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB148_9
	mov rdi, rbp
	mov rbx, rax
	call r14
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB148_93
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB148_17
	mov rsi, qword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 48]
	mov rdx, qword ptr [rsp + 8]
	jmp .LBB148_3
.LBB148_2:
	mov ecx, 8
	mov edx, 8
	mov ebx, 8
	mov eax, 8
.LBB148_3:
	mov rdi, qword ptr [rsi + 64]
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], rdx
	mov qword ptr [rsp + 136], r15
	mov qword ptr [rsp + 144], rbx
	mov qword ptr [rsp + 160], r15
	mov qword ptr [rsp + 168], rcx
	mov qword ptr [rsp + 184], r15
	mov qword ptr [rsp + 192], rax
	mov r13, rdx
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 200], 0
	cmp rdi, r15
	cmovae rdi, r15
	mov qword ptr [rsp + 80], rdi
	test rdi, rdi
	je .LBB148_4
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	xor r12d, r12d
	add rbp, 8
	mov qword ptr [rsp + 40], rax
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	vmovsd xmm0, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 192]
	add rbp, 16
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 200], rbx
	cmp qword ptr [rsp + 80], r12
	je .LBB148_5
.LBB148_30:
	mov rax, qword ptr [rsp + 40]
	vmovsd xmm0, qword ptr [rbp - 8]
	vmovsd xmm2, qword ptr [rbp]
	vmovsd xmm1, qword ptr [rax + 8*r12]
	mov rax, r13
	vmovsd qword ptr [rsp + 16], xmm0
	vmovsd qword ptr [rsp + 48], xmm2
	vmovsd qword ptr [rsp + 8], xmm1
	cmp r12, qword ptr [rsp + 112]
	jne .LBB148_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB148_33:
	vmovsd xmm0, qword ptr [rsp + 16]
	mov r13, rax
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov r15, qword ptr [rsp + 152]
	mov qword ptr [rsp + 128], r12
	cmp r15, qword ptr [rsp + 136]
	jne .LBB148_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	vmovsd xmm0, qword ptr [rsp + 48]
	vmovsd xmm3, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 144]
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 16], xmm1
	mov qword ptr [rsp + 208], rax
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	vucomisd xmm3, xmm2
	mov qword ptr [rsp + 152], r15
	jne .LBB148_36
	jp .LBB148_36
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	vmovsd xmm0, qword ptr [rip + .LCPI148_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp + 16], xmm0
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	vmovsd xmm0, qword ptr [rsp + 16]
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 48], rax
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov rbx, qword ptr [rsp + 200]
	mov qword ptr [rsp + 176], r14
	cmp rbx, qword ptr [rsp + 184]
	jne .LBB148_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 208], rbx
	mov qword ptr [rsp + 48], rcx
	xor r14d, r14d
	xor r15d, r15d
	xor r12d, r12d
	xor ebx, ebx
.LBB148_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 60
	je .LBB148_42
	xor edi, edi
.LBB148_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rdx, qword ptr [rsp + 96]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd xmm1, qword ptr [rdx + 8]
	mov edx, 8
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 40], rdx
	vmovsd qword ptr [rsp + 328], xmm0
	vmovsd qword ptr [rsp + 320], xmm1
	test rcx, rcx
	je .LBB148_49
	mov rbp, rax
	mov r13, qword ptr [rsp + 32]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r13
	call rax
	mov qword ptr [rsp + 72], rax
	test rax, rax
	je .LBB148_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r13
	call rax
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB148_69
	mov rax, rbp
.LBB148_49:
	mov rcx, qword ptr [rsp + 120]
	mov rdx, qword ptr [rsp + 104]
	mov r13, qword ptr [rsp + 88]
	mov qword ptr [rsp + 8], rbx
	mov qword ptr [rsp + 312], rax
	mov qword ptr [rsp + 232], rax
	mov qword ptr [rsp + 32], rcx
	jmp .LBB148_50
	.p2align	4
.LBB148_89:
	mov esi, 4
	lea rdi, [rsp + 240]
	vzeroupper
	call engine::force::tree_sum::<f64>
	vmovapd xmm2, xmmword ptr [rsp + 48]
	vmovddup xmm1, qword ptr [rsp + 208]
	mov r10, qword ptr [rsp + 352]
	mov r11, qword ptr [rsp + 344]
	mov rax, qword ptr [rsp + 336]
	mov rdi, qword ptr [rsp + 96]
	mov rsi, qword ptr [rsp + 16]
	mov r9, qword ptr [rsp + 80]
	mov r8, qword ptr [rsp + 88]
	mov rdx, rbp
	mov r14, r10
	mov qword ptr [rsp + 48], r11
	mov r15, rax
	mov qword ptr [rsp + 208], rdi
	mov r12, rsi
	mov qword ptr [rsp + 32], r9
	vunpcklpd xmm0, xmm2, xmm0
	vmulpd xmm0, xmm1, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [r13]
	vmovupd xmmword ptr [r13], xmm0
	mov r13, r8
.LBB148_50:
	mov rbx, r13
	sub rbx, 1
	mov qword ptr [rsp + 104], rdx
	lea rdx, [rdx + 16]
	mov rcx, rsi
	cmovae r8, rbx
	cmovae rbp, rdx
	mov qword ptr [rsp + 360], rdx
	mov qword ptr [rsp + 88], r8
	mov r8, qword ptr [rsp + 32]
	mov qword ptr [rsp + 368], rbp
	mov rsi, r8
	lea rbp, [r8 + 8]
	mov r8, r12
	sub r8, 1
	cmovb rbp, r9
	mov r9, qword ptr [rsp + 208]
	cmovb r8, rcx
	mov rcx, r15
	sub rcx, 1
	mov qword ptr [rsp + 80], rbp
	mov rbp, qword ptr [rsp + 48]
	mov qword ptr [rsp + 16], r8
	cmovae rax, rcx
	lea rdx, [r9 + 8]
	cmovae rdi, rdx
	lea r8, [rbp + 8]
	mov qword ptr [rsp + 96], rdi
	mov rdi, r14
	sub rdi, 1
	cmovae r10, rdi
	cmovae r11, r8
	cmp qword ptr [rsp + 8], 0
	je .LBB148_58
	test r13, r13
	je .LBB148_58
	test r12, r12
	je .LBB148_58
	test rsi, rsi
	je .LBB148_58
	test r15, r15
	je .LBB148_58
	test r9, r9
	je .LBB148_58
	test r14, r14
	je .LBB148_58
	test rbp, rbp
	je .LBB148_58
	vmovsd xmm0, qword ptr [rsi]
	mov rsi, qword ptr [rsp + 232]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rsp + 336], rax
	mov rax, qword ptr [rsp + 8]
	vmovsd xmm1, qword ptr [r9]
	mov r15, qword ptr [rsp + 72]
	mov r14, qword ptr [rsp + 24]
	mov qword ptr [rsp + 344], r11
	vmovsd xmm2, qword ptr [rsi]
	dec rax
	add rsi, 8
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 232], rsi
	vmovaps xmmword ptr [rsp + 208], xmm2
	vmovsd xmm2, qword ptr [rsp + 328]
	vmulsd xmm2, xmm2, qword ptr [rbp]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rsp + 16]
	vmovsd qword ptr [rsp + 376], xmm0
	vmovsd xmm0, qword ptr [rsp + 320]
	vmovsd qword ptr [rsp + 384], xmm1
	mov qword ptr [rsp + 408], r15
	mov qword ptr [rsp + 416], r14
	mov qword ptr [rsp + 248], r10
	mov qword ptr [rsp + 256], rdx
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 272], r8
	mov qword ptr [rsp + 280], rdi
	mov qword ptr [rsp + 288], rsi
	mov qword ptr [rsp + 296], rax
	mov rax, qword ptr [rsp + 40]
	mov rdx, qword ptr [rsp + 360]
	lea rdi, [rsp + 376]
	lea rsi, [rsp + 240]
	lea r8, [rsp + 408]
	mov rcx, rbx
	vmovsd qword ptr [rsp + 392], xmm2
	mov qword ptr [rsp + 424], rax
	vmovsd qword ptr [rsp + 400], xmm0
	mov qword ptr [rsp + 432], r14
	call engine::force::pass_one::<f64>
	cmp rbx, r14
	mov ecx, 8
	mov rax, r15
	mov r14, rbx
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 240], ymm0
	cmova rax, rcx
	mov ecx, 0
	cmova r14, rcx
	movabs rcx, 4611686018427387872
	lea r15, [8*r14]
	and r15, rcx
	je .LBB148_78
	lea rdx, [r15 - 32]
	mov rcx, rax
	mov esi, edx
	shr esi, 5
	inc esi
	and esi, 7
	je .LBB148_74
	.p2align	4
.LBB148_73:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	add rcx, 32
	dec rsi
	jne .LBB148_73
.LBB148_74:
	cmp rdx, 224
	jb .LBB148_77
	lea rdx, [rax + r15]
	.p2align	4
.LBB148_76:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 96]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 128]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 160]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 192]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 224]
	add rcx, 256
	cmp rcx, rdx
	jne .LBB148_76
.LBB148_77:
	vmovupd ymmword ptr [rsp + 240], ymm0
.LBB148_78:
	movabs rcx, 576460752303423484
	mov r12, r14
	and r12, rcx
	and r14d, 3
	je .LBB148_80
	lea rcx, [r14 - 1]
	lea rax, [rax + 8*r12]
	vpbroadcastq ymm0, rcx
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI148_1]
	vmovupd ymm0 {k1} {z}, ymmword ptr [rax]
	vaddpd ymm0, ymm0, ymmword ptr [rsp + 240]
	vmovupd ymmword ptr [rsp + 240] {k1}, ymm0
.LBB148_80:
	mov esi, 4
	lea rdi, [rsp + 240]
	vzeroupper
	call engine::force::tree_sum::<f64>
	cmp rbx, qword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 40]
	mov r13, qword ptr [rsp + 104]
	mov rbp, qword ptr [rsp + 368]
	mov ecx, 8
	vmovapd xmmword ptr [rsp + 48], xmm0
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 240], ymm0
	cmova rax, rcx
	test r15, r15
	je .LBB148_87
	lea rdx, [r15 - 32]
	mov rcx, rax
	mov esi, edx
	shr esi, 5
	inc esi
	and esi, 7
	je .LBB148_83
	.p2align	4
.LBB148_82:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	add rcx, 32
	dec rsi
	jne .LBB148_82
.LBB148_83:
	cmp rdx, 224
	jb .LBB148_86
	add r15, rax
	.p2align	4
.LBB148_85:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 96]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 128]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 160]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 192]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 224]
	add rcx, 256
	cmp rcx, r15
	jne .LBB148_85
.LBB148_86:
	vmovupd ymmword ptr [rsp + 240], ymm0
.LBB148_87:
	test r14, r14
	je .LBB148_89
	dec r14
	lea rax, [rax + 8*r12]
	vpbroadcastq ymm0, r14
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI148_1]
	vmovupd ymm0 {k1} {z}, ymmword ptr [rax]
	vaddpd ymm0, ymm0, ymmword ptr [rsp + 240]
	vmovupd ymmword ptr [rsp + 240] {k1}, ymm0
	jmp .LBB148_89
.LBB148_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	call rbx
	mov rdi, qword ptr [rsp + 72]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 184], 0
	je .LBB148_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 312]
	call rax
.LBB148_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 168]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
.LBB148_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 144]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
.LBB148_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 120]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
.LBB148_68:
	add rsp, 440
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
.LBB148_95:
	.cfi_def_cfa_offset 496
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_93:
	mov edi, 8
	mov rsi, rbp
	mov r14, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_17:
	mov rsi, qword ptr [rsp + 32]
	mov edi, 8
	mov r14, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_44:
	mov edi, 8
	jmp .LBB148_45
.LBB148_69:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov r14, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 72]
	mov rbx, rax
	call r14
	jmp .LBB148_20
	cmp qword ptr [rsp + 24], 0
	mov rbx, rax
	je .LBB148_92
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 48]
	call rax
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB148_11
	cmp qword ptr [rsp + 24], 0
	mov rcx, qword ptr [rsp + 8]
	mov rbx, rax
	je .LBB148_92
.LBB148_11:
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	mov r15, rcx
	call rax
	mov rdi, r15
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, rbx
	call _Unwind_Resume@PLT
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	mov rbx, rax
	je .LBB148_92
	jmp .LBB148_91
	jmp .LBB148_19
.LBB148_19:
	mov rbx, rax
.LBB148_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB148_27
.LBB148_92:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 192]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 160], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 168]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 144]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB148_92
.LBB148_27:
	mov rdi, qword ptr [rsp + 120]
.LBB148_91:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, rbx
	call _Unwind_Resume@PLT
