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
	mov rbx, rcx
	movabs rax, 4611686018427387888
	mov r13, qword ptr [rsi + 16]
	lea r12, [4*r13]
	add rax, 15
	cmp r13, rax
	setbe al
	movabs rcx, 9223372036854775805
	cmp r12, rcx
	setb cl
	test al, cl
	jne .LBB149_1
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	test r12, r12
	mov qword ptr [rsp + 24], r13
	mov qword ptr [rsp + 32], rdi
	je .LBB149_2
	mov qword ptr [rsp + 16], rsi
	mov r14, rdx
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB149_99
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_9
	mov r15, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_97
	mov rbp, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_17
	mov rdx, r14
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB149_3
.LBB149_2:
	mov ebp, 4
	mov ecx, 4
	mov r15d, 4
	mov eax, 4
.LBB149_3:
	mov qword ptr [rsp + 192], r12
	mov qword ptr [rsp + 72], rbx
	mov qword ptr [rsp + 296], rdx
	mov rdx, r13
	mov qword ptr [rsp + 96], r13
	mov qword ptr [rsp + 104], rcx
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r13
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r13
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov r13, qword ptr [rsi + 64]
	cmp r13, rdx
	cmovae r13, rdx
	test r13, r13
	je .LBB149_4
	mov r12, rcx
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 56], rax
	xor r15d, r15d
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	mov rax, qword ptr [rsp + 176]
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp r13, r15
	je .LBB149_5
.LBB149_30:
	vmovss xmm0, dword ptr [rbp + 8*r15]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rbp + 8*r15 + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 56]
	vmovss xmm0, dword ptr [rax + 4*r15]
	vmovss dword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 96]
	mov rax, r12
	jne .LBB149_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB149_33:
	mov r12, rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 112], r15
	mov rax, qword ptr [rsp + 136]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB149_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	mov rcx, rbx
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rcx
	mov rbx, rcx
	mov qword ptr [rsp + 136], rcx
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp + 8]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 16], xmm1
	vucomiss xmm0, xmm2
	jne .LBB149_36
	jp .LBB149_36
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm0
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 160], r14
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB149_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 80], r15
	mov qword ptr [rsp + 16], 0
	xor r14d, r14d
	xor ebx, ebx
	xor r15d, r15d
.LBB149_5:
	mov rdx, qword ptr [rsp + 24]
	mov rcx, rdx
	shr rcx, 61
	je .LBB149_42
	xor edi, edi
.LBB149_45:
	mov rsi, qword ptr [rsp + 192]
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_42:
	mov rcx, qword ptr [rsp + 32]
	vmovss xmm0, dword ptr [rcx]
	vmovss dword ptr [rsp + 92], xmm0
	vmovss xmm0, dword ptr [rcx + 4]
	vmovss dword ptr [rsp + 88], xmm0
	mov ecx, 4
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 32], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 40]
	mov qword ptr [rsp + 280], rax
	je .LBB149_49
	mov esi, 1
	mov r13, qword ptr [rsp + 192]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB149_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB149_69
	mov rax, qword ptr [rsp + 280]
.LBB149_49:
	mov rcx, qword ptr [rsp + 104]
	mov qword ptr [rsp + 288], rax
	mov qword ptr [rsp + 56], rbp
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rsp + 320], rcx
	mov qword ptr [rsp + 8], rcx
	mov r13, qword ptr [rsp + 16]
	mov r12, qword ptr [rsp + 72]
	jmp .LBB149_50
	.p2align	4
.LBB149_93:
	mov esi, 4
	lea rdi, [rsp + 208]
	call engine::force::tree_sum::<f32>
	vbroadcastss xmm1, dword ptr [rsp + 192]
	vmovaps xmm2, xmmword ptr [rsp + 384]
	vinsertps xmm0, xmm2, xmm0, 16
	vmulps xmm0, xmm1, xmm0
	mov rax, qword ptr [rsp + 328]
	vmovsd xmm1, qword ptr [rax]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [rax], xmm0
	mov r13, qword ptr [rsp + 16]
	mov r10, qword ptr [rsp + 336]
.LBB149_50:
	mov r9, qword ptr [rsp + 296]
	mov r11, r12
	mov rsi, qword ptr [rsp + 8]
	mov rax, rsi
	mov qword ptr [rsp + 192], r15
	mov rcx, r10
	mov r8, rbx
	mov rdi, r15
	mov qword ptr [rsp + 328], r9
	mov rdx, rbx
	lea rbx, [r9 + 8]
	mov rbp, r12
	sub rbp, 1
	cmovae r12, rbp
	mov qword ptr [rsp + 72], r12
	mov qword ptr [rsp + 64], rbx
	cmovae r9, rbx
	mov qword ptr [rsp + 296], r9
	lea r9, [rsi + 4]
	sub r15, 1
	cmovb r15, rdi
	cmovb r9, rsi
	mov qword ptr [rsp + 8], r9
	lea rdi, [r10 + 4]
	mov rsi, r8
	sub rsi, 1
	cmovae rdx, rsi
	mov qword ptr [rsp + 344], rdx
	cmovae r10, rdi
	mov qword ptr [rsp + 336], r10
	mov r12, qword ptr [rsp + 56]
	mov r10, r12
	mov rbx, r13
	mov r9, r13
	sub r9, 1
	cmovae r13, r9
	mov qword ptr [rsp + 16], r13
	lea r13, [r12 + 4]
	cmovae r12, r13
	mov qword ptr [rsp + 56], r12
	test r14, r14
	je .LBB149_58
	test r11, r11
	je .LBB149_58
	cmp qword ptr [rsp + 192], 0
	je .LBB149_58
	test rax, rax
	je .LBB149_58
	test r8, r8
	je .LBB149_58
	test rcx, rcx
	je .LBB149_58
	test rbx, rbx
	je .LBB149_58
	test r10, r10
	je .LBB149_58
	dec r14
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rcx]
	mov rax, qword ptr [rsp + 288]
	vmovss xmm2, dword ptr [rax]
	vmovaps xmmword ptr [rsp + 192], xmm2
	add rax, 4
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [r10]
	vmovss dword ptr [rsp + 304], xmm0
	vmovss dword ptr [rsp + 308], xmm1
	vmovss dword ptr [rsp + 312], xmm2
	vmovss xmm0, dword ptr [rsp + 88]
	vmovss dword ptr [rsp + 316], xmm0
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 208], rcx
	mov qword ptr [rsp + 216], r15
	mov qword ptr [rsp + 224], rdi
	mov qword ptr [rsp + 232], rsi
	mov qword ptr [rsp + 240], r13
	mov qword ptr [rsp + 248], r9
	mov qword ptr [rsp + 288], rax
	mov qword ptr [rsp + 256], rax
	mov qword ptr [rsp + 264], r14
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 352], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 360], rbx
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 368], rax
	mov qword ptr [rsp + 376], rbx
	lea rdi, [rsp + 304]
	lea rsi, [rsp + 208]
	mov rdx, qword ptr [rsp + 64]
	mov rcx, rbp
	lea r8, [rsp + 352]
	call engine::force::pass_one::<f32>
	cmp rbp, rbx
	mov rax, r12
	mov ecx, 4
	cmova rax, rcx
	mov r12, rbp
	mov ecx, 0
	cmova r12, rcx
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 208], xmm0
	lea r13, [4*r12]
	movabs rcx, 4611686018427387888
	and r13, rcx
	je .LBB149_78
	lea rdx, [r13 - 16]
	mov esi, edx
	shr esi, 4
	inc esi
	mov rcx, rax
	and esi, 3
	je .LBB149_74
	.p2align	4
.LBB149_73:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	add rcx, 16
	dec rsi
	jne .LBB149_73
.LBB149_74:
	cmp rdx, 48
	jb .LBB149_77
	lea rdx, [rax + r13]
	.p2align	4
.LBB149_76:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 48]
	add rcx, 64
	cmp rcx, rdx
	jne .LBB149_76
.LBB149_77:
	vmovaps xmmword ptr [rsp + 208], xmm0
.LBB149_78:
	mov rdx, r12
	movabs rcx, 1152921504606846972
	and rdx, rcx
	and r12d, 3
	je .LBB149_82
	vmovss xmm0, dword ptr [rax + 4*rdx]
	vaddss xmm0, xmm0, dword ptr [rsp + 208]
	vmovss dword ptr [rsp + 208], xmm0
	cmp r12d, 1
	je .LBB149_82
	vmovss xmm0, dword ptr [rax + 4*rdx + 4]
	vaddss xmm0, xmm0, dword ptr [rsp + 212]
	vmovss dword ptr [rsp + 212], xmm0
	cmp r12d, 2
	je .LBB149_82
	vmovss xmm0, dword ptr [rax + 4*rdx + 8]
	vaddss xmm0, xmm0, dword ptr [rsp + 216]
	vmovss dword ptr [rsp + 216], xmm0
	.p2align	4
.LBB149_82:
	mov qword ptr [rsp + 64], rdx
	mov esi, 4
	lea rdi, [rsp + 208]
	call engine::force::tree_sum::<f32>
	mov rdi, r12
	cmp rbp, rbx
	mov rax, qword ptr [rsp + 32]
	mov ecx, 4
	cmova rax, rcx
	vmovaps xmmword ptr [rsp + 384], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 208], xmm0
	test r13, r13
	mov rbx, qword ptr [rsp + 344]
	je .LBB149_89
	lea rdx, [r13 - 16]
	mov esi, edx
	shr esi, 4
	inc esi
	mov rcx, rax
	and esi, 3
	je .LBB149_85
	.p2align	4
.LBB149_84:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	add rcx, 16
	dec rsi
	jne .LBB149_84
.LBB149_85:
	cmp rdx, 48
	jb .LBB149_88
	add r13, rax
	.p2align	4
.LBB149_87:
	vaddps xmm0, xmm0, xmmword ptr [rcx]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rcx + 48]
	add rcx, 64
	cmp rcx, r13
	jne .LBB149_87
.LBB149_88:
	vmovaps xmmword ptr [rsp + 208], xmm0
.LBB149_89:
	test rdi, rdi
	mov r12, qword ptr [rsp + 72]
	mov rcx, qword ptr [rsp + 64]
	je .LBB149_93
	vmovss xmm0, dword ptr [rax + 4*rcx]
	vaddss xmm0, xmm0, dword ptr [rsp + 208]
	vmovss dword ptr [rsp + 208], xmm0
	cmp edi, 1
	je .LBB149_93
	vmovss xmm0, dword ptr [rax + 4*rcx + 4]
	vaddss xmm0, xmm0, dword ptr [rsp + 212]
	vmovss dword ptr [rsp + 212], xmm0
	cmp edi, 2
	je .LBB149_93
	vmovss xmm0, dword ptr [rax + 4*rcx + 8]
	vaddss xmm0, xmm0, dword ptr [rsp + 216]
	vmovss dword ptr [rsp + 216], xmm0
	jmp .LBB149_93
.LBB149_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 40]
	je .LBB149_62
	mov rdi, qword ptr [rsp + 280]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB149_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB149_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB149_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_68
	mov rdi, qword ptr [rsp + 320]
	call qword ptr [rip + free@GOTPCREL]
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
.LBB149_99:
	.cfi_def_cfa_offset 464
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_97:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_17:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_44:
	mov edi, 4
	jmp .LBB149_45
.LBB149_69:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB149_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 48]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_20
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB149_96
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r13, qword ptr [rsp + 8]
	jmp .LBB149_11
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r13, qword ptr [rsp + 8]
	je .LBB149_96
.LBB149_11:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB149_96
	jmp .LBB149_95
	jmp .LBB149_19
.LBB149_19:
	mov rbx, rax
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
.LBB149_96:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB149_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB149_24
.LBB149_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB149_26
.LBB149_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB149_96
.LBB149_27:
	mov rdi, qword ptr [rsp + 104]
.LBB149_95:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
