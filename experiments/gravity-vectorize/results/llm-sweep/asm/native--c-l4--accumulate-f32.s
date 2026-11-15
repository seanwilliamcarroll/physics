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
	jne .LBB149_1
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	mov qword ptr [rsp + 64], rdi
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 208], r12
	mov qword ptr [rsp + 32], rbp
	test rbp, rbp
	je .LBB149_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rbx, rsi
	call r14
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB149_95
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB149_9
	mov rdi, rbp
	mov r12, rax
	call r14
	mov rsi, rbp
	test rax, rax
	je .LBB149_93
	mov rdi, rsi
	mov rbp, rax
	call r14
	test rax, rax
	je .LBB149_17
	mov rdx, qword ptr [rsp + 8]
	mov rsi, rbx
	jmp .LBB149_3
.LBB149_2:
	mov ebp, 4
	mov edx, 4
	mov r12d, 4
	mov eax, 4
.LBB149_3:
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
	mov qword ptr [rsp + 40], rdi
	test rdi, rdi
	je .LBB149_4
	mov rax, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 8]
	mov rbp, rdx
	xor r13d, r13d
	mov qword ptr [rsp + 192], rax
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 176]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 184], rbx
	cmp qword ptr [rsp + 40], r13
	je .LBB149_5
.LBB149_30:
	mov rax, qword ptr [rsp + 192]
	vmovss xmm0, dword ptr [r15 + 8*r13]
	vmovss xmm2, dword ptr [r15 + 8*r13 + 4]
	vmovss xmm1, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp + 24], xmm0
	vmovss dword ptr [rsp + 48], xmm2
	vmovss dword ptr [rsp + 8], xmm1
	cmp r13, qword ptr [rsp + 96]
	jne .LBB149_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rbp, qword ptr [rsp + 104]
.LBB149_33:
	vmovss xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rbp + 4*r13], xmm0
	inc r13
	mov r12, qword ptr [rsp + 136]
	mov qword ptr [rsp + 112], r13
	cmp r12, qword ptr [rsp + 120]
	jne .LBB149_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_35:
	vmovss xmm0, dword ptr [rsp + 48]
	vmovss xmm3, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 128]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 24], xmm1
	mov qword ptr [rsp + 80], rax
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	vucomiss xmm3, xmm2
	mov qword ptr [rsp + 136], r12
	jne .LBB149_36
	jp .LBB149_36
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 24], xmm0
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	vmovss xmm0, dword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 48], rax
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov rbx, qword ptr [rsp + 184]
	mov qword ptr [rsp + 160], r14
	cmp rbx, qword ptr [rsp + 168]
	jne .LBB149_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 80], r12
	mov qword ptr [rsp + 48], rbp
	xor r14d, r14d
	xor ebx, ebx
	xor r12d, r12d
	xor r13d, r13d
.LBB149_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 61
	je .LBB149_42
	xor edi, edi
.LBB149_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_42:
	mov rdx, qword ptr [rsp + 64]
	mov rbp, qword ptr [rsp + 72]
	mov qword ptr [rsp + 224], rax
	vmovss xmm0, dword ptr [rdx]
	vmovss xmm1, dword ptr [rdx + 4]
	mov edx, 4
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 40], rdx
	vmovss dword ptr [rsp + 92], xmm0
	vmovss dword ptr [rsp + 88], xmm1
	test rcx, rcx
	je .LBB149_49
	mov r15, qword ptr [rsp + 32]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB149_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB149_69
	mov rax, qword ptr [rsp + 224]
.LBB149_49:
	mov qword ptr [rsp + 232], rax
	mov rax, qword ptr [rsp + 48]
	mov rsi, qword ptr [rsp + 104]
	mov qword ptr [rsp + 192], rax
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 320], rsi
	mov qword ptr [rsp + 32], rax
	jmp .LBB149_50
	.p2align	4
.LBB149_89:
	mov esi, 4
	lea rdi, [rsp + 256]
	vzeroupper
	call engine::force::tree_sum::<f32>
	vmovaps xmm2, xmmword ptr [rsp + 192]
	vbroadcastss xmm1, dword ptr [rsp + 208]
	mov r11, qword ptr [rsp + 336]
	mov rcx, qword ptr [rsp + 64]
	mov r9, qword ptr [rsp + 368]
	mov r10, qword ptr [rsp + 360]
	mov r8, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 352]
	mov r15, qword ptr [rsp + 328]
	mov r14, r11
	mov qword ptr [rsp + 192], rcx
	mov r12, r9
	mov qword ptr [rsp + 32], r10
	mov r13, r8
	mov rsi, rdi
	mov qword ptr [rsp + 208], rdx
	vinsertps xmm0, xmm2, xmm0, 16
	vmovsd xmm2, qword ptr [rbp]
	vmulps xmm0, xmm1, xmm0
	vaddps xmm0, xmm0, xmm2
	vmovlps qword ptr [rbp], xmm0
	mov rbp, r15
.LBB149_50:
	lea rax, [rbp + 8]
	mov qword ptr [rsp + 72], rbp
	mov rbp, qword ptr [rsp + 208]
	mov qword ptr [rsp + 344], rax
	sub rbp, 1
	cmovae rdx, rbp
	cmovae r15, rax
	mov rax, rsi
	add rsi, 4
	mov qword ptr [rsp + 352], rdx
	mov rdx, r13
	sub rdx, 1
	cmovb rdx, r8
	cmovb rsi, rdi
	mov rdi, r12
	sub rdi, 1
	mov qword ptr [rsp + 8], rdx
	mov rdx, qword ptr [rsp + 32]
	mov qword ptr [rsp + 24], rsi
	mov rsi, rax
	mov rax, qword ptr [rsp + 192]
	cmovae r9, rdi
	mov qword ptr [rsp + 368], r9
	mov r9, r14
	lea r8, [rdx + 4]
	cmovae r10, r8
	sub r9, 1
	mov qword ptr [rsp + 360], r10
	lea r10, [rax + 4]
	cmovae r11, r9
	cmovae rcx, r10
	mov qword ptr [rsp + 64], rcx
	test rbx, rbx
	je .LBB149_58
	cmp qword ptr [rsp + 208], 0
	je .LBB149_58
	test r13, r13
	je .LBB149_58
	test rsi, rsi
	je .LBB149_58
	test r12, r12
	je .LBB149_58
	test rdx, rdx
	je .LBB149_58
	test r14, r14
	je .LBB149_58
	mov rcx, rax
	test rax, rax
	je .LBB149_58
	mov rax, qword ptr [rsp + 232]
	vmovss xmm0, dword ptr [rsi]
	vmovss xmm1, dword ptr [rdx]
	mov rsi, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 8]
	mov r12, qword ptr [rsp + 56]
	mov r14, qword ptr [rsp + 16]
	dec rbx
	mov qword ptr [rsp + 328], r15
	mov qword ptr [rsp + 336], r11
	vmovss xmm2, dword ptr [rax]
	add rax, 4
	mov qword ptr [rsp + 232], rax
	vmovaps xmmword ptr [rsp + 208], xmm2
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [rcx]
	vmovss dword ptr [rsp + 240], xmm0
	vmovss xmm0, dword ptr [rsp + 88]
	mov qword ptr [rsp + 256], rsi
	mov qword ptr [rsp + 264], rdx
	mov rcx, qword ptr [rsp + 40]
	mov rdx, qword ptr [rsp + 344]
	mov qword ptr [rsp + 272], r8
	mov qword ptr [rsp + 280], rdi
	lea rdi, [rsp + 240]
	lea rsi, [rsp + 256]
	lea r8, [rsp + 376]
	vmovss dword ptr [rsp + 244], xmm1
	mov qword ptr [rsp + 288], r10
	mov qword ptr [rsp + 296], r9
	mov qword ptr [rsp + 304], rax
	mov qword ptr [rsp + 376], r12
	mov qword ptr [rsp + 384], r14
	mov qword ptr [rsp + 312], rbx
	mov qword ptr [rsp + 392], rcx
	mov rcx, rbp
	mov qword ptr [rsp + 400], r14
	vmovss dword ptr [rsp + 248], xmm2
	vmovss dword ptr [rsp + 252], xmm0
	call engine::force::pass_one::<f32>
	cmp rbp, r14
	mov ecx, 4
	mov rax, r12
	mov r14, rbp
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 256], xmm0
	cmova rax, rcx
	mov ecx, 0
	cmova r14, rcx
	movabs rcx, 4611686018427387888
	lea r12, [4*r14]
	and r12, rcx
	je .LBB149_78
	lea rdx, [r12 - 16]
	mov rcx, rax
	mov esi, edx
	shr esi, 4
	inc esi
	and esi, 7
	je .LBB149_74
	.p2align	4
.LBB149_73:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	add rcx, 16
	dec rsi
	jne .LBB149_73
.LBB149_74:
	cmp rdx, 112
	jb .LBB149_77
	lea rdx, [rax + r12]
	.p2align	4
.LBB149_76:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 48]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 64]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 80]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 96]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 112]
	sub rcx, -128
	cmp rcx, rdx
	jne .LBB149_76
.LBB149_77:
	vmovaps xmmword ptr [rsp + 256], xmm0
.LBB149_78:
	movabs rcx, 1152921504606846972
	mov r13, r14
	and r13, rcx
	and r14d, 3
	je .LBB149_80
	lea rcx, [r14 - 1]
	lea rax, [rax + 4*r13]
	vpbroadcastq ymm0, rcx
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI149_1]
	vmovups xmm0 {k1} {z}, xmmword ptr [rax]
	vaddps xmm0, xmm0, xmmword ptr [rsp + 256]
	vmovaps xmmword ptr [rsp + 256] {k1}, xmm0
.LBB149_80:
	mov esi, 4
	lea rdi, [rsp + 256]
	vzeroupper
	call engine::force::tree_sum::<f32>
	cmp rbp, qword ptr [rsp + 16]
	mov rax, qword ptr [rsp + 40]
	mov rbp, qword ptr [rsp + 72]
	mov ecx, 4
	vmovaps xmmword ptr [rsp + 192], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 256], xmm0
	cmova rax, rcx
	test r12, r12
	je .LBB149_87
	lea rdx, [r12 - 16]
	mov rcx, rax
	mov esi, edx
	shr esi, 4
	inc esi
	and esi, 7
	je .LBB149_83
	.p2align	4
.LBB149_82:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	add rcx, 16
	dec rsi
	jne .LBB149_82
.LBB149_83:
	cmp rdx, 112
	jb .LBB149_86
	add r12, rax
	.p2align	4
.LBB149_85:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 48]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 64]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 80]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 96]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 112]
	sub rcx, -128
	cmp rcx, r12
	jne .LBB149_85
.LBB149_86:
	vmovaps xmmword ptr [rsp + 256], xmm0
.LBB149_87:
	test r14, r14
	je .LBB149_89
	dec r14
	lea rax, [rax + 4*r13]
	vpbroadcastq ymm0, r14
	vpcmpnltuq k1, ymm0, ymmword ptr [rip + .LCPI149_1]
	vmovups xmm0 {k1} {z}, xmmword ptr [rax]
	vaddps xmm0, xmm0, xmmword ptr [rsp + 256]
	vmovaps xmmword ptr [rsp + 256] {k1}, xmm0
	jmp .LBB149_89
.LBB149_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 48]
	je .LBB149_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 224]
	call rax
.LBB149_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB149_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call rax
.LBB149_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call rax
.LBB149_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_68
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 320]
	call rax
.LBB149_68:
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
	ret
.LBB149_95:
	.cfi_def_cfa_offset 464
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_93:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_17:
	mov rsi, qword ptr [rsp + 32]
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_44:
	mov edi, 4
	jmp .LBB149_45
.LBB149_69:
	mov edi, 4
	mov rsi, r15
	call alloc::raw_vec::handle_error
.LBB149_46:
	ud2
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 56]
	mov r14, rax
	call rbx
	jmp .LBB149_20
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	je .LBB149_92
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB149_11
	cmp qword ptr [rsp + 16], 0
	mov rcx, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB149_92
.LBB149_11:
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
	mov rdi, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB149_92
	jmp .LBB149_91
	jmp .LBB149_19
.LBB149_19:
	mov r14, rax
.LBB149_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB149_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB149_23
.LBB149_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB149_25
.LBB149_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB149_27
.LBB149_92:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB149_21:
	mov rdi, qword ptr [rsp + 176]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 144], 0
	je .LBB149_24
.LBB149_23:
	mov rdi, qword ptr [rsp + 152]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 120], 0
	je .LBB149_26
.LBB149_25:
	mov rdi, qword ptr [rsp + 128]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 96], 0
	je .LBB149_92
.LBB149_27:
	mov rdi, qword ptr [rsp + 104]
.LBB149_91:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
