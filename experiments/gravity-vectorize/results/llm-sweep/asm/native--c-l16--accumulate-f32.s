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
	sub rsp, 392
	.cfi_def_cfa_offset 448
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r15, qword ptr [rsi + 16]
	mov rbp, rcx
	movabs rcx, 9223372036854775805
	lea r13, [4*r15]
	mov rax, r15
	shr rax, 62
	sete al
	cmp r13, rcx
	setb cl
	test al, cl
	jne .LBB151_1
	call alloc::raw_vec::capacity_overflow
.LBB151_1:
	mov qword ptr [rsp + 72], rdi
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 80], rdx
	mov qword ptr [rsp + 32], r13
	test r13, r13
	je .LBB151_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, r13
	mov rbx, rsi
	call r14
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB151_77
	mov rdi, r13
	call r14
	test rax, rax
	je .LBB151_9
	mov rdi, r13
	mov r12, rax
	call r14
	mov rsi, r13
	test rax, rax
	je .LBB151_75
	mov rdi, rsi
	mov r13, rax
	call r14
	test rax, rax
	je .LBB151_17
	mov rcx, qword ptr [rsp + 8]
	mov rsi, rbx
	jmp .LBB151_3
.LBB151_2:
	mov r13d, 4
	mov ecx, 4
	mov r12d, 4
	mov eax, 4
.LBB151_3:
	mov rdx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], rcx
	mov qword ptr [rsp + 136], r15
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 160], r15
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 184], r15
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 224], rbp
	mov rbx, rcx
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 200], 0
	cmp rdx, r15
	cmovae rdx, r15
	mov qword ptr [rsp + 48], rdx
	test rdx, rdx
	je .LBB151_4
	mov rax, qword ptr [rsi + 56]
	mov r12, qword ptr [rsi + 8]
	xor r13d, r13d
	mov qword ptr [rsp + 208], rax
	jmp .LBB151_30
	.p2align	4
.LBB151_41:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 200], r14
	cmp qword ptr [rsp + 48], r13
	je .LBB151_5
.LBB151_30:
	vmovss xmm0, dword ptr [r12 + 8*r13]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r12 + 8*r13 + 4]
	vmovss dword ptr [rsp + 56], xmm0
	mov rax, qword ptr [rsp + 208]
	vmovss xmm0, dword ptr [rax + 4*r13]
	mov rax, rbx
	vmovss dword ptr [rsp + 8], xmm0
	cmp r13, qword ptr [rsp + 112]
	jne .LBB151_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB151_33:
	vmovss xmm0, dword ptr [rsp + 16]
	mov rbx, rax
	vmovss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov r15, qword ptr [rsp + 152]
	mov qword ptr [rsp + 128], r13
	cmp r15, qword ptr [rsp + 136]
	jne .LBB151_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB151_35:
	mov rax, qword ptr [rsp + 144]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	mov qword ptr [rsp + 96], rax
	vmovss xmm0, dword ptr [rsp + 56]
	vmovss xmm3, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm1
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	vucomiss xmm3, xmm2
	mov qword ptr [rsp + 152], r15
	jne .LBB151_36
	jp .LBB151_36
	mov rbp, qword ptr [rsp + 176]
	cmp rbp, qword ptr [rsp + 160]
	je .LBB151_38
	jmp .LBB151_39
	.p2align	4
.LBB151_36:
	vmovss xmm0, dword ptr [rip + .LCPI151_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm0
	mov rbp, qword ptr [rsp + 176]
	cmp rbp, qword ptr [rsp + 160]
	jne .LBB151_39
.LBB151_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB151_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 88], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov r14, qword ptr [rsp + 200]
	mov qword ptr [rsp + 176], rbp
	cmp r14, qword ptr [rsp + 184]
	jne .LBB151_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB151_41
.LBB151_4:
	mov qword ptr [rsp + 88], r13
	mov qword ptr [rsp + 96], r12
	xor r14d, r14d
	xor ebp, ebp
	xor r15d, r15d
	xor r13d, r13d
.LBB151_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 61
	je .LBB151_42
	xor edi, edi
.LBB151_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_42:
	mov rdx, qword ptr [rsp + 72]
	vmovss xmm0, dword ptr [rdx]
	vmovss xmm1, dword ptr [rdx + 4]
	mov edx, 4
	vmovss dword ptr [rsp + 108], xmm0
	vmovss dword ptr [rsp + 104], xmm1
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 64], rdx
	mov r12, qword ptr [rsp + 80]
	mov qword ptr [rsp + 240], rax
	test rcx, rcx
	je .LBB151_49
	mov rbx, qword ptr [rsp + 32]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbx
	call rax
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB151_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, rbx
	call rax
	mov qword ptr [rsp + 64], rax
	test rax, rax
	je .LBB151_68
	mov rax, qword ptr [rsp + 240]
.LBB151_49:
	add rax, 4
	mov rdi, qword ptr [rsp + 120]
	dec r14
	mov qword ptr [rsp + 8], rax
	mov rcx, qword ptr [rsp + 88]
	mov qword ptr [rsp + 208], rcx
	mov rsi, qword ptr [rsp + 96]
	mov qword ptr [rsp + 264], rdi
	.p2align	4
.LBB151_50:
	mov qword ptr [rsp + 80], r12
	mov rcx, r8
	lea r8, [r12 + 8]
	mov rdx, rbx
	mov rbx, r13
	mov r12, qword ptr [rsp + 224]
	sub r12, 1
	cmovae r11, r12
	mov qword ptr [rsp + 280], r11
	mov r11, qword ptr [rsp + 48]
	mov qword ptr [rsp + 272], r8
	cmovae r11, r8
	sub rbx, 1
	mov r8, rdi
	lea rdi, [rdi + 4]
	cmovb rdi, rcx
	cmovb rbx, rdx
	lea rcx, [rsi + 4]
	mov rdx, rsi
	mov qword ptr [rsp + 56], rdi
	mov rdi, r15
	sub rdi, 1
	cmovae r9, rdi
	cmovae r10, rcx
	mov qword ptr [rsp + 72], r9
	mov qword ptr [rsp + 288], r10
	mov r9, qword ptr [rsp + 208]
	mov rsi, r9
	lea r10, [r9 + 4]
	mov r9, rbp
	sub r9, 1
	cmovae rax, r9
	mov qword ptr [rsp + 32], rax
	mov rax, qword ptr [rsp + 16]
	cmovae rax, r10
	cmp r14, -1
	je .LBB151_58
	cmp qword ptr [rsp + 224], 0
	je .LBB151_58
	test r13, r13
	je .LBB151_58
	test r8, r8
	je .LBB151_58
	test r15, r15
	je .LBB151_58
	test rdx, rdx
	je .LBB151_58
	test rbp, rbp
	je .LBB151_58
	test rsi, rsi
	je .LBB151_58
	mov r15, qword ptr [rsp + 8]
	vmovss xmm0, dword ptr [r8]
	lea r8, [rsp + 296]
	vbroadcastss xmm1, dword ptr [r15 - 4]
	vmovaps xmmword ptr [rsp + 224], xmm1
	mov qword ptr [rsp + 8], r15
	vmovss xmm1, dword ptr [rdx]
	vmovss xmm2, dword ptr [rsp + 108]
	mov rdx, qword ptr [rsp + 56]
	mov r13, qword ptr [rsp + 40]
	mov rbp, qword ptr [rsp + 64]
	vmulss xmm2, xmm2, dword ptr [rsi]
	vmovss dword ptr [rsp + 248], xmm0
	vmovss xmm0, dword ptr [rsp + 104]
	lea rsi, [rsp + 328]
	mov qword ptr [rsp + 328], rdx
	mov qword ptr [rsp + 336], rbx
	mov qword ptr [rsp + 344], rcx
	mov qword ptr [rsp + 352], rdi
	mov qword ptr [rsp + 360], r10
	mov qword ptr [rsp + 368], r9
	mov qword ptr [rsp + 376], r15
	mov r15, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 272]
	lea rdi, [rsp + 248]
	mov qword ptr [rsp + 296], r13
	mov rcx, r12
	mov qword ptr [rsp + 16], rax
	mov qword ptr [rsp + 384], r14
	mov qword ptr [rsp + 48], r11
	vmovss dword ptr [rsp + 252], xmm1
	mov qword ptr [rsp + 304], r15
	mov qword ptr [rsp + 312], rbp
	mov qword ptr [rsp + 320], r15
	vmovss dword ptr [rsp + 256], xmm2
	vmovss dword ptr [rsp + 260], xmm0
	call engine::force::pass_one::<f32>
	cmp r12, r15
	mov eax, 4
	mov ecx, 0
	mov rdi, r13
	cmova r12, rcx
	cmova rdi, rax
	cmova rbp, rax
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	vmovaps xmmword ptr [rsp + 208], xmm0
	mov rdi, rbp
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	vmovaps xmm1, xmmword ptr [rsp + 208]
	mov rax, qword ptr [rsp + 80]
	mov r8, qword ptr [rsp + 56]
	dec r14
	mov r13, rbx
	mov rdi, r8
	vinsertps xmm0, xmm1, xmm0, 16
	vmulps xmm0, xmm0, xmmword ptr [rsp + 224]
	vmovsd xmm1, qword ptr [rax]
	add qword ptr [rsp + 8], 4
	mov rcx, qword ptr [rsp + 16]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [rax], xmm0
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 208], rcx
	mov r11, qword ptr [rsp + 280]
	mov r9, qword ptr [rsp + 72]
	mov r10, qword ptr [rsp + 288]
	mov rbp, rax
	mov qword ptr [rsp + 224], r11
	mov r15, r9
	mov rsi, r10
	mov r12, qword ptr [rsp + 48]
	jmp .LBB151_50
.LBB151_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB151_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 64]
	call rbx
	mov rdi, qword ptr [rsp + 40]
	call rbx
.LBB151_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 96]
	mov r14, qword ptr [rsp + 88]
	je .LBB151_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 240]
	call rax
.LBB151_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB151_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call rax
.LBB151_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB151_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call rax
.LBB151_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB151_71
	mov rdi, qword ptr [rsp + 264]
	add rsp, 392
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB151_71:
	.cfi_def_cfa_offset 448
	add rsp, 392
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
.LBB151_77:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB151_9:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_75:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_17:
	mov rsi, qword ptr [rsp + 32]
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_44:
	mov edi, 4
	jmp .LBB151_45
.LBB151_68:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB151_46:
	ud2
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	mov r14, rax
	call rbx
	jmp .LBB151_20
	cmp qword ptr [rsp + 24], 0
	mov r14, rax
	je .LBB151_74
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call rax
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB151_11
	cmp qword ptr [rsp + 24], 0
	mov rcx, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB151_74
.LBB151_11:
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
	je .LBB151_74
	jmp .LBB151_73
	jmp .LBB151_19
.LBB151_19:
	mov r14, rax
.LBB151_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB151_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB151_23
.LBB151_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB151_25
.LBB151_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB151_27
.LBB151_74:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB151_21:
	mov rdi, qword ptr [rsp + 192]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 160], 0
	je .LBB151_24
.LBB151_23:
	mov rdi, qword ptr [rsp + 168]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB151_26
.LBB151_25:
	mov rdi, qword ptr [rsp + 144]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB151_74
.LBB151_27:
	mov rdi, qword ptr [rsp + 120]
.LBB151_73:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
