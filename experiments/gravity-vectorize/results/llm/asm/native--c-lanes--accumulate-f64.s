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
	sub rsp, 424
	.cfi_def_cfa_offset 480
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r15, qword ptr [rsi + 16]
	mov r12, rcx
	movabs rcx, 9223372036854775801
	lea rbp, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	mov qword ptr [rsp + 80], rdi
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 48], r12
	mov qword ptr [rsp + 24], rbp
	test rbp, rbp
	je .LBB146_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rbx, rsi
	call r14
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB146_97
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB146_9
	mov rdi, rbp
	mov r12, rax
	call r14
	mov rsi, rbp
	test rax, rax
	je .LBB146_95
	mov rdi, rsi
	mov rbp, rax
	call r14
	test rax, rax
	je .LBB146_17
	mov rdx, qword ptr [rsp]
	mov rsi, rbx
	jmp .LBB146_3
.LBB146_2:
	mov ebp, 8
	mov edx, 8
	mov r12d, 8
	mov eax, 8
.LBB146_3:
	mov rdi, qword ptr [rsi + 64]
	mov qword ptr [rsp + 96], r15
	mov qword ptr [rsp + 104], rdx
	mov qword ptr [rsp + 120], r15
	mov qword ptr [rsp + 128], r12
	mov qword ptr [rsp + 144], r15
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 168], r15
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 184], 0
	cmp rdi, r15
	cmovae rdi, r15
	mov qword ptr [rsp + 64], rdi
	test rdi, rdi
	je .LBB146_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov rbp, rdx
	xor r13d, r13d
	add r15, 8
	mov qword ptr [rsp + 192], rax
	jmp .LBB146_30
	.p2align	4
.LBB146_41:
	vmovsd xmm0, qword ptr [rsp]
	mov rax, qword ptr [rsp + 176]
	add r15, 16
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 184], rbx
	cmp qword ptr [rsp + 64], r13
	je .LBB146_5
.LBB146_30:
	vmovsd xmm0, qword ptr [r15 - 8]
	vmovsd qword ptr [rsp + 8], xmm0
	vmovsd xmm0, qword ptr [r15]
	vmovsd qword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 192]
	vmovsd xmm0, qword ptr [rax + 8*r13]
	vmovsd qword ptr [rsp], xmm0
	cmp r13, qword ptr [rsp + 96]
	jne .LBB146_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rbp, qword ptr [rsp + 104]
.LBB146_33:
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rbp + 8*r13], xmm0
	inc r13
	mov r12, qword ptr [rsp + 136]
	mov qword ptr [rsp + 112], r13
	cmp r12, qword ptr [rsp + 120]
	jne .LBB146_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_35:
	mov rax, qword ptr [rsp + 128]
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
	mov qword ptr [rsp + 88], rax
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd xmm3, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm1
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	vucomisd xmm3, xmm2
	mov qword ptr [rsp + 136], r12
	jne .LBB146_36
	jp .LBB146_36
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	je .LBB146_38
	jmp .LBB146_39
	.p2align	4
.LBB146_36:
	vmovsd xmm0, qword ptr [rip + .LCPI146_0]
	vdivsd xmm0, xmm0, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm0
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	jne .LBB146_39
.LBB146_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 32], rax
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov rbx, qword ptr [rsp + 184]
	mov qword ptr [rsp + 160], r14
	cmp rbx, qword ptr [rsp + 168]
	jne .LBB146_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_41
.LBB146_4:
	mov qword ptr [rsp + 32], rbp
	mov qword ptr [rsp + 88], r12
	xor r14d, r14d
	xor r12d, r12d
	xor r13d, r13d
	xor ebx, ebx
.LBB146_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 60
	je .LBB146_42
	xor edi, edi
.LBB146_45:
	mov rsi, qword ptr [rsp + 24]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_42:
	mov rdx, qword ptr [rsp + 80]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd xmm1, qword ptr [rdx + 8]
	mov edx, 8
	vmovsd qword ptr [rsp + 328], xmm0
	vmovsd qword ptr [rsp + 320], xmm1
	mov qword ptr [rsp + 40], rdx
	mov r15, qword ptr [rsp + 56]
	mov qword ptr [rsp + 208], rax
	test rcx, rcx
	je .LBB146_49
	mov rbp, qword ptr [rsp + 24]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbp
	call rax
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB146_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbp
	call rax
	test rax, rax
	je .LBB146_68
	mov rdx, rax
	mov rax, qword ptr [rsp + 208]
.LBB146_49:
	mov qword ptr [rsp + 64], rbx
	mov qword ptr [rsp + 216], rdx
	mov qword ptr [rsp + 224], rax
	mov rsi, qword ptr [rsp + 104]
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 312], rsi
	mov rbx, qword ptr [rsp + 48]
	jmp .LBB146_50
	.p2align	4
.LBB146_90:
	vshufpd xmm2, xmm0, xmm0, 1
	vshufpd ymm3, ymm0, ymm0, 4
	mov qword ptr [rsp + 64], rbx
	mov r14, r11
	mov rbx, rdi
	mov r15, rbp
	vaddpd ymm2, ymm2, ymm0
	vextractf128 xmm0, ymm0, 1
	vextractf128 xmm3, ymm3, 1
	mov rcx, qword ptr [rsp + 344]
	vaddpd xmm0, xmm3, xmm0
	vmovddup xmm3, qword ptr [rsp + 192]
	vaddpd ymm0, ymm0, ymm2
	vextractf128 xmm2, ymm1, 1
	mov qword ptr [rsp + 8], rcx
	mov r9, qword ptr [rsp + 24]
	vhaddpd xmm1, xmm1, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	mov r12, r9
	vaddpd xmm1, xmm2, xmm1
	vunpcklpd xmm0, xmm0, xmm1
	vmulpd xmm0, xmm3, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [r10]
	vmovupd xmmword ptr [r10], xmm0
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rsp + 192], r10
	mov r8, qword ptr [rsp + 72]
	mov rdx, qword ptr [rsp + 336]
	mov r13, r8
	mov rsi, rdx
.LBB146_50:
	mov qword ptr [rsp + 56], r15
	lea rax, [r15 + 16]
	mov r15, rbx
	sub r15, 1
	mov r11, r8
	mov r8, rbx
	cmovae rdi, r15
	cmovae rbp, rax
	mov qword ptr [rsp + 48], rdi
	mov qword ptr [rsp + 72], rax
	mov qword ptr [rsp + 232], rbp
	mov rbp, r13
	sub rbp, 1
	lea rdi, [rsi + 8]
	mov rax, rsi
	cmovb rdi, rdx
	cmovb rbp, r11
	mov rdx, rdi
	mov rdi, qword ptr [rsp + 192]
	mov rsi, rdi
	lea r11, [rdi + 8]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	cmovae r10, r11
	mov qword ptr [rsp + 24], r9
	mov qword ptr [rsp + 352], r11
	mov qword ptr [rsp + 80], r10
	mov r9, r14
	sub r9, 1
	mov rbx, qword ptr [rsp]
	mov r11, qword ptr [rsp + 8]
	cmovae rbx, r9
	lea r10, [r11 + 8]
	mov qword ptr [rsp], rbx
	cmovae rcx, r10
	mov rbx, qword ptr [rsp + 64]
	test rbx, rbx
	je .LBB146_58
	test r8, r8
	je .LBB146_58
	test r13, r13
	je .LBB146_58
	test rax, rax
	je .LBB146_58
	test r12, r12
	je .LBB146_58
	test rsi, rsi
	je .LBB146_58
	test r14, r14
	je .LBB146_58
	test r11, r11
	je .LBB146_58
	mov qword ptr [rsp + 344], rcx
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rsi]
	dec rbx
	lea rsi, [rsp + 240]
	lea r8, [rsp + 392]
	mov rax, qword ptr [rsp + 224]
	vmovsd xmm2, qword ptr [rax]
	add rax, 8
	vmovaps xmmword ptr [rsp + 192], xmm2
	vmovsd xmm2, qword ptr [rsp + 328]
	vmulsd xmm2, xmm2, qword ptr [r11]
	vmovsd qword ptr [rsp + 360], xmm0
	vmovsd qword ptr [rsp + 368], xmm1
	vmovsd xmm1, qword ptr [rsp + 320]
	mov qword ptr [rsp + 336], rdx
	mov qword ptr [rsp + 240], rdx
	mov qword ptr [rsp + 248], rbp
	mov rcx, qword ptr [rsp + 352]
	mov qword ptr [rsp + 224], rax
	mov r12, qword ptr [rsp + 40]
	mov r14, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 72]
	mov qword ptr [rsp + 256], rcx
	mov rcx, qword ptr [rsp + 216]
	mov qword ptr [rsp + 264], rdi
	lea rdi, [rsp + 360]
	mov qword ptr [rsp + 272], r10
	mov qword ptr [rsp + 280], r9
	mov qword ptr [rsp + 288], rax
	mov qword ptr [rsp + 296], rbx
	mov qword ptr [rsp + 392], r12
	mov qword ptr [rsp + 400], r14
	vmovsd qword ptr [rsp + 376], xmm2
	vmovsd qword ptr [rsp + 384], xmm1
	mov qword ptr [rsp + 408], rcx
	mov r13, rcx
	mov rcx, r15
	mov qword ptr [rsp + 416], r14
	vzeroupper
	call engine::force::pass_one::<f64>
	cmp r15, r14
	mov eax, 8
	mov ecx, 0
	mov rsi, r12
	movabs rdx, 4611686018427387872
	vxorpd xmm1, xmm1, xmm1
	vmovupd ymmword ptr [rsp + 240], ymm1
	cmova rsi, rax
	mov rax, r15
	cmova rax, rcx
	lea rcx, [8*rax]
	and rcx, rdx
	je .LBB146_71
	lea rdi, [rcx - 32]
	vxorpd xmm0, xmm0, xmm0
	mov rdx, rsi
	mov r8d, edi
	shr r8d, 5
	inc r8d
	and r8d, 7
	je .LBB146_74
	.p2align	4
.LBB146_73:
	vaddpd ymm0, ymm0, ymmword ptr [rdx]
	add rdx, 32
	dec r8
	jne .LBB146_73
.LBB146_74:
	cmp rdi, 224
	jb .LBB146_77
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB146_76:
	vaddpd ymm0, ymm0, ymmword ptr [rdx]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 96]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 128]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 160]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 192]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 224]
	add rdx, 256
	cmp rdx, rdi
	jne .LBB146_76
.LBB146_77:
	vmovupd ymmword ptr [rsp + 240], ymm0
	jmp .LBB146_78
	.p2align	4
.LBB146_71:
	vxorpd xmm0, xmm0, xmm0
.LBB146_78:
	movabs rdi, 576460752303423484
	mov rdx, rax
	and rdx, rdi
	and eax, 3
	je .LBB146_80
	lea rdi, [rax - 1]
	lea rsi, [rsi + 8*rdx]
	vpbroadcastq ymm0, rdi
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI146_1]
	vmovupd ymm0 {k1} {z}, ymmword ptr [rsi]
	vaddpd ymm0, ymm0, ymmword ptr [rsp + 240]
	vmovupd ymmword ptr [rsp + 240] {k1}, ymm0
	vmovupd ymm0, ymmword ptr [rsp + 240]
.LBB146_80:
	cmp r15, r14
	mov edi, 8
	mov rsi, r13
	mov qword ptr [rsp + 72], rbp
	vmovupd ymmword ptr [rsp + 240], ymm1
	cmova rsi, rdi
	test rcx, rcx
	je .LBB146_81
	mov r10, qword ptr [rsp + 56]
	mov rbp, qword ptr [rsp + 232]
	lea r8, [rcx - 32]
	vxorpd xmm1, xmm1, xmm1
	mov rdi, rsi
	mov r9d, r8d
	shr r9d, 5
	inc r9d
	and r9d, 7
	je .LBB146_84
	.p2align	4
.LBB146_83:
	vaddpd ymm1, ymm1, ymmword ptr [rdi]
	add rdi, 32
	dec r9
	jne .LBB146_83
.LBB146_84:
	cmp r8, 224
	jb .LBB146_87
	add rcx, rsi
	.p2align	4
.LBB146_86:
	vaddpd ymm1, ymm1, ymmword ptr [rdi]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 32]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 64]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 96]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 128]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 160]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 192]
	vaddpd ymm1, ymm1, ymmword ptr [rdi + 224]
	add rdi, 256
	cmp rdi, rcx
	jne .LBB146_86
.LBB146_87:
	mov r11, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 48]
	vmovupd ymmword ptr [rsp + 240], ymm1
	test rax, rax
	jne .LBB146_89
	jmp .LBB146_90
	.p2align	4
.LBB146_81:
	mov r10, qword ptr [rsp + 56]
	mov r11, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 48]
	mov rbp, qword ptr [rsp + 232]
	vxorpd xmm1, xmm1, xmm1
	test rax, rax
	je .LBB146_90
.LBB146_89:
	dec rax
	lea rcx, [rsi + 8*rdx]
	vpbroadcastq ymm1, rax
	vpcmpnltuq k1, ymm1, ymmword ptr [rip + .LCPI146_1]
	vmovupd ymm1 {k1} {z}, ymmword ptr [rcx]
	vaddpd ymm1, ymm1, ymmword ptr [rsp + 240]
	vmovupd ymmword ptr [rsp + 240] {k1}, ymm1
	vmovupd ymm1, ymmword ptr [rsp + 240]
	jmp .LBB146_90
.LBB146_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB146_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 216]
	vzeroupper
	call rbx
	mov rdi, qword ptr [rsp + 40]
	call rbx
.LBB146_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 88]
	mov r14, qword ptr [rsp + 32]
	je .LBB146_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 208]
	vzeroupper
	call rax
.LBB146_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB146_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	vzeroupper
	call rax
.LBB146_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB146_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	vzeroupper
	call rax
.LBB146_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB146_91
	mov rdi, qword ptr [rsp + 312]
	add rsp, 424
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
.LBB146_91:
	.cfi_def_cfa_offset 480
	add rsp, 424
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
.LBB146_97:
	.cfi_def_cfa_offset 480
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB146_9:
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_95:
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_17:
	mov rsi, qword ptr [rsp + 24]
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_44:
	mov edi, 8
	jmp .LBB146_45
.LBB146_68:
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB146_46:
	ud2
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	mov r14, rax
	call rbx
	jmp .LBB146_20
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	je .LBB146_94
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	mov rcx, qword ptr [rsp]
	jmp .LBB146_11
	cmp qword ptr [rsp + 16], 0
	mov rcx, qword ptr [rsp]
	mov r14, rax
	je .LBB146_94
.LBB146_11:
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	mov rbx, rcx
	call rax
	mov rdi, rbx
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	mov r14, rax
	je .LBB146_94
	jmp .LBB146_93
	jmp .LBB146_19
.LBB146_19:
	mov r14, rax
.LBB146_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB146_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB146_23
.LBB146_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB146_25
.LBB146_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB146_27
.LBB146_94:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB146_21:
	mov rdi, qword ptr [rsp + 176]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 144], 0
	je .LBB146_24
.LBB146_23:
	mov rdi, qword ptr [rsp + 152]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 120], 0
	je .LBB146_26
.LBB146_25:
	mov rdi, qword ptr [rsp + 128]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 96], 0
	je .LBB146_94
.LBB146_27:
	mov rdi, qword ptr [rsp + 104]
.LBB146_93:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
