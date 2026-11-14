<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception49
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
	sub rsp, 408
	.cfi_def_cfa_offset 464
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r15, qword ptr [rsi + 16]
	movabs rax, 4611686018427387888
	mov r12, rcx
	movabs rcx, 9223372036854775805
	add rax, 15
	lea rbp, [4*r15]
	cmp r15, rax
	setbe al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB147_1
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	mov qword ptr [rsp + 88], rdi
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 64], rdx
	mov qword ptr [rsp + 56], r12
	mov qword ptr [rsp + 32], rbp
	test rbp, rbp
	je .LBB147_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rbx, rsi
	call r14
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB147_97
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB147_9
	mov rdi, rbp
	mov r12, rax
	call r14
	mov rsi, rbp
	test rax, rax
	je .LBB147_95
	mov rdi, rsi
	mov rbp, rax
	call r14
	test rax, rax
	je .LBB147_17
	mov rdx, qword ptr [rsp + 8]
	mov rsi, rbx
	jmp .LBB147_3
.LBB147_2:
	mov ebp, 4
	mov edx, 4
	mov r12d, 4
	mov eax, 4
.LBB147_3:
	mov rdi, qword ptr [rsi + 64]
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], rdx
	mov qword ptr [rsp + 136], r15
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 160], r15
	mov qword ptr [rsp + 168], rbp
	mov qword ptr [rsp + 184], r15
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 200], 0
	cmp rdi, r15
	cmovae rdi, r15
	mov qword ptr [rsp + 72], rdi
	test rdi, rdi
	je .LBB147_4
	mov rax, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 8]
	mov rbp, rdx
	xor r13d, r13d
	mov qword ptr [rsp + 208], rax
	jmp .LBB147_30
	.p2align	4
.LBB147_41:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 200], rbx
	cmp qword ptr [rsp + 72], r13
	je .LBB147_5
.LBB147_30:
	vmovss xmm0, dword ptr [r15 + 8*r13]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r15 + 8*r13 + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 208]
	vmovss xmm0, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp + 8], xmm0
	cmp r13, qword ptr [rsp + 112]
	jne .LBB147_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rbp, qword ptr [rsp + 120]
.LBB147_33:
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rbp + 4*r13], xmm0
	inc r13
	mov r12, qword ptr [rsp + 152]
	mov qword ptr [rsp + 128], r13
	cmp r12, qword ptr [rsp + 136]
	jne .LBB147_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_35:
	mov rax, qword ptr [rsp + 144]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	mov qword ptr [rsp + 96], rax
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss xmm3, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm1
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	vucomiss xmm3, xmm2
	mov qword ptr [rsp + 152], r12
	jne .LBB147_36
	jp .LBB147_36
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	je .LBB147_38
	jmp .LBB147_39
	.p2align	4
.LBB147_36:
	vmovss xmm0, dword ptr [rip + .LCPI147_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm0
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	jne .LBB147_39
.LBB147_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov rbx, qword ptr [rsp + 200]
	mov qword ptr [rsp + 176], r14
	cmp rbx, qword ptr [rsp + 184]
	jne .LBB147_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_41
.LBB147_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 96], r12
	xor r14d, r14d
	xor ebx, ebx
	xor r12d, r12d
	xor r13d, r13d
.LBB147_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 61
	je .LBB147_42
	xor edi, edi
.LBB147_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_42:
	mov rdx, qword ptr [rsp + 88]
	vmovss xmm0, dword ptr [rdx]
	vmovss xmm1, dword ptr [rdx + 4]
	mov edx, 4
	vmovss dword ptr [rsp + 108], xmm0
	vmovss dword ptr [rsp + 104], xmm1
	mov qword ptr [rsp + 48], rdx
	mov r15, qword ptr [rsp + 64]
	mov qword ptr [rsp + 224], rax
	test rcx, rcx
	je .LBB147_49
	mov rbp, qword ptr [rsp + 32]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbp
	call rax
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB147_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbp
	call rax
	test rax, rax
	je .LBB147_68
	mov rdx, rax
	mov rax, qword ptr [rsp + 224]
.LBB147_49:
	mov qword ptr [rsp + 72], rbx
	mov qword ptr [rsp + 232], rdx
	mov qword ptr [rsp + 240], rax
	mov rsi, qword ptr [rsp + 120]
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 344], rsi
	mov rbx, qword ptr [rsp + 56]
	jmp .LBB147_50
	.p2align	4
.LBB147_90:
	vmovshdup xmm2, xmm0
	mov qword ptr [rsp + 72], rbx
	vhaddps xmm1, xmm1, xmm1
	mov r14, r11
	mov rbx, rdi
	mov r15, rbp
	vaddps xmm0, xmm2, xmm0
	vbroadcastss xmm3, dword ptr [rsp + 208]
	mov rcx, qword ptr [rsp + 360]
	vshufpd xmm2, xmm0, xmm0, 1
	vaddps xmm0, xmm2, xmm0
	vmovshdup xmm2, xmm1
	vaddps xmm1, xmm2, xmm1
	vmovsd xmm2, qword ptr [r10]
	mov qword ptr [rsp + 16], rcx
	mov r9, qword ptr [rsp + 32]
	vunpcklps xmm0, xmm0, xmm1
	vmulps xmm0, xmm3, xmm0
	mov r12, r9
	vaddps xmm0, xmm0, xmm2
	vmovlps qword ptr [r10], xmm0
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rsp + 208], r10
	mov r8, qword ptr [rsp + 80]
	mov rdx, qword ptr [rsp + 352]
	mov r13, r8
	mov rsi, rdx
.LBB147_50:
	mov qword ptr [rsp + 64], r15
	lea rax, [r15 + 8]
	mov r15, rbx
	sub r15, 1
	mov r11, r8
	mov r8, rbx
	cmovae rdi, r15
	cmovae rbp, rax
	mov qword ptr [rsp + 56], rdi
	mov qword ptr [rsp + 80], rax
	mov qword ptr [rsp + 248], rbp
	mov rbp, r13
	sub rbp, 1
	lea rdi, [rsi + 4]
	mov rax, rsi
	cmovb rdi, rdx
	cmovb rbp, r11
	mov rdx, rdi
	mov rdi, qword ptr [rsp + 208]
	mov rsi, rdi
	lea r11, [rdi + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	cmovae r10, r11
	mov qword ptr [rsp + 32], r9
	mov qword ptr [rsp + 368], r11
	mov qword ptr [rsp + 88], r10
	mov r9, r14
	sub r9, 1
	mov rbx, qword ptr [rsp + 8]
	mov r11, qword ptr [rsp + 16]
	cmovae rbx, r9
	lea r10, [r11 + 4]
	mov qword ptr [rsp + 8], rbx
	cmovae rcx, r10
	mov rbx, qword ptr [rsp + 72]
	test rbx, rbx
	je .LBB147_58
	test r8, r8
	je .LBB147_58
	test r13, r13
	je .LBB147_58
	test rax, rax
	je .LBB147_58
	test r12, r12
	je .LBB147_58
	test rsi, rsi
	je .LBB147_58
	test r14, r14
	je .LBB147_58
	test r11, r11
	je .LBB147_58
	mov qword ptr [rsp + 360], rcx
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rsi]
	dec rbx
	lea rsi, [rsp + 272]
	lea r8, [rsp + 376]
	mov rax, qword ptr [rsp + 240]
	vmovss xmm2, dword ptr [rax]
	add rax, 4
	vmovaps xmmword ptr [rsp + 208], xmm2
	vmovss xmm2, dword ptr [rsp + 108]
	vmulss xmm2, xmm2, dword ptr [r11]
	vmovss dword ptr [rsp + 256], xmm0
	vmovss dword ptr [rsp + 260], xmm1
	vmovss xmm1, dword ptr [rsp + 104]
	mov qword ptr [rsp + 352], rdx
	mov qword ptr [rsp + 272], rdx
	mov qword ptr [rsp + 280], rbp
	mov rcx, qword ptr [rsp + 368]
	mov qword ptr [rsp + 240], rax
	mov r12, qword ptr [rsp + 48]
	mov r14, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 80]
	mov qword ptr [rsp + 288], rcx
	mov rcx, qword ptr [rsp + 232]
	mov qword ptr [rsp + 296], rdi
	lea rdi, [rsp + 256]
	mov qword ptr [rsp + 304], r10
	mov qword ptr [rsp + 312], r9
	mov qword ptr [rsp + 320], rax
	mov qword ptr [rsp + 328], rbx
	mov qword ptr [rsp + 376], r12
	mov qword ptr [rsp + 384], r14
	vmovss dword ptr [rsp + 264], xmm2
	vmovss dword ptr [rsp + 268], xmm1
	mov qword ptr [rsp + 392], rcx
	mov r13, rcx
	mov rcx, r15
	mov qword ptr [rsp + 400], r14
	vzeroupper
	call engine::force::pass_one::<f32>
	cmp r15, r14
	mov eax, 4
	mov ecx, 0
	mov rsi, r12
	movabs rdx, 4611686018427387888
	vxorps xmm1, xmm1, xmm1
	vmovaps xmmword ptr [rsp + 272], xmm1
	cmova rsi, rax
	mov rax, r15
	cmova rax, rcx
	lea rcx, [4*rax]
	and rcx, rdx
	je .LBB147_71
	lea rdi, [rcx - 16]
	vxorps xmm0, xmm0, xmm0
	mov rdx, rsi
	mov r8d, edi
	shr r8d, 4
	inc r8d
	and r8d, 7
	je .LBB147_74
	.p2align	4
.LBB147_73:
	vaddps xmm0, xmm0, xmmword ptr [rdx]
	add rdx, 16
	dec r8
	jne .LBB147_73
.LBB147_74:
	cmp rdi, 112
	jb .LBB147_77
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB147_76:
	vaddps xmm0, xmm0, xmmword ptr [rdx]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 48]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 64]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 80]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 96]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 112]
	sub rdx, -128
	cmp rdx, rdi
	jne .LBB147_76
.LBB147_77:
	vmovaps xmmword ptr [rsp + 272], xmm0
	jmp .LBB147_78
	.p2align	4
.LBB147_71:
	vxorps xmm0, xmm0, xmm0
.LBB147_78:
	movabs rdi, 1152921504606846972
	mov rdx, rax
	and rdx, rdi
	and eax, 3
	je .LBB147_80
	lea rdi, [rax - 1]
	lea rsi, [rsi + 4*rdx]
	vpbroadcastq ymm0, rdi
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI147_1]
	vmovups xmm0 {k1} {z}, xmmword ptr [rsi]
	vaddps xmm0, xmm0, xmmword ptr [rsp + 272]
	vmovaps xmmword ptr [rsp + 272] {k1}, xmm0
	vmovaps xmm0, xmmword ptr [rsp + 272]
.LBB147_80:
	cmp r15, r14
	mov edi, 4
	mov rsi, r13
	mov qword ptr [rsp + 80], rbp
	vmovaps xmmword ptr [rsp + 272], xmm1
	cmova rsi, rdi
	test rcx, rcx
	je .LBB147_81
	mov r10, qword ptr [rsp + 64]
	mov rbp, qword ptr [rsp + 248]
	lea r8, [rcx - 16]
	vxorps xmm1, xmm1, xmm1
	mov rdi, rsi
	mov r9d, r8d
	shr r9d, 4
	inc r9d
	and r9d, 7
	je .LBB147_84
	.p2align	4
.LBB147_83:
	vaddps xmm1, xmm1, xmmword ptr [rdi]
	add rdi, 16
	dec r9
	jne .LBB147_83
.LBB147_84:
	cmp r8, 112
	jb .LBB147_87
	add rcx, rsi
	.p2align	4
.LBB147_86:
	vaddps xmm1, xmm1, xmmword ptr [rdi]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 16]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 32]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 48]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 64]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 80]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 96]
	vaddps xmm1, xmm1, xmmword ptr [rdi + 112]
	sub rdi, -128
	cmp rdi, rcx
	jne .LBB147_86
.LBB147_87:
	mov r11, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 56]
	vmovaps xmmword ptr [rsp + 272], xmm1
	test rax, rax
	jne .LBB147_89
	jmp .LBB147_90
	.p2align	4
.LBB147_81:
	mov r10, qword ptr [rsp + 64]
	mov r11, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 56]
	mov rbp, qword ptr [rsp + 248]
	vxorps xmm1, xmm1, xmm1
	test rax, rax
	je .LBB147_90
.LBB147_89:
	dec rax
	lea rcx, [rsi + 4*rdx]
	vpbroadcastq ymm1, rax
	vpcmpnltuq k1, ymm1, ymmword ptr [rip + .LCPI147_1]
	vmovups xmm1 {k1} {z}, xmmword ptr [rcx]
	vaddps xmm1, xmm1, xmmword ptr [rsp + 272]
	vmovaps xmmword ptr [rsp + 272] {k1}, xmm1
	vmovaps xmm1, xmmword ptr [rsp + 272]
	jmp .LBB147_90
.LBB147_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB147_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 232]
	vzeroupper
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB147_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 96]
	mov r14, qword ptr [rsp + 40]
	je .LBB147_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 224]
	vzeroupper
	call rax
.LBB147_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB147_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	vzeroupper
	call rax
.LBB147_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB147_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	vzeroupper
	call rax
.LBB147_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB147_91
	mov rdi, qword ptr [rsp + 344]
	add rsp, 408
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
.LBB147_91:
	.cfi_def_cfa_offset 464
	add rsp, 408
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
.LBB147_97:
	.cfi_def_cfa_offset 464
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB147_9:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_95:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_17:
	mov rsi, qword ptr [rsp + 32]
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_44:
	mov edi, 4
	jmp .LBB147_45
.LBB147_68:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB147_46:
	ud2
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 48]
	mov r14, rax
	call rbx
	jmp .LBB147_20
	cmp qword ptr [rsp + 24], 0
	mov r14, rax
	je .LBB147_94
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB147_11
	cmp qword ptr [rsp + 24], 0
	mov rcx, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB147_94
.LBB147_11:
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	mov rbx, rcx
	call rax
	mov rdi, rbx
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB147_94
	jmp .LBB147_93
	jmp .LBB147_19
.LBB147_19:
	mov r14, rax
.LBB147_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB147_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB147_23
.LBB147_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB147_25
.LBB147_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB147_27
.LBB147_94:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB147_21:
	mov rdi, qword ptr [rsp + 192]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 160], 0
	je .LBB147_24
.LBB147_23:
	mov rdi, qword ptr [rsp + 168]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB147_26
.LBB147_25:
	mov rdi, qword ptr [rsp + 144]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB147_94
.LBB147_27:
	mov rdi, qword ptr [rsp + 120]
.LBB147_93:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
