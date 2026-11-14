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
	sub rsp, 264
	.cfi_def_cfa_offset 320
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdx
	mov r8, qword ptr [rsi + 16]
	lea rbp, [4*r8]
	mov rax, r8
	shr rax, 62
	sete al
	movabs rdx, 9223372036854775805
	cmp rbp, rdx
	setb dl
	test al, dl
	jne .LBB147_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	test rbp, rbp
	mov qword ptr [rsp + 40], rcx
	je .LBB147_2
	mov qword ptr [rsp + 16], r8
	mov r13, rdi
	mov rbx, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB147_102
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_20
	mov r15, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_100
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_28
	mov rsi, rbx
	mov rdi, r13
	mov rbx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	jmp .LBB147_3
.LBB147_2:
	mov r12d, 4
	mov ebx, 4
	mov r15d, 4
	mov eax, 4
.LBB147_3:
	mov qword ptr [rsp + 48], rdi
	mov qword ptr [rsp + 80], r8
	mov qword ptr [rsp + 88], rbx
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 112], r8
	mov qword ptr [rsp + 120], r15
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r8
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 160], r8
	mov qword ptr [rsp + 168], rax
	mov qword ptr [rsp + 176], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB147_4
	mov qword ptr [rsp + 16], r8
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 56], rax
	xor r12d, r12d
	jmp .LBB147_41
	.p2align	4
.LBB147_52:
	mov rax, qword ptr [rsp + 168]
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 176], rbp
	cmp qword ptr [rsp + 16], r12
	je .LBB147_5
.LBB147_41:
	vmovss xmm0, dword ptr [r15 + 8*r12]
	vmovss dword ptr [rsp + 24], xmm0
	vmovss xmm0, dword ptr [r15 + 8*r12 + 4]
	vmovss dword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 56]
	vmovss xmm0, dword ptr [rax + 4*r12]
	vmovss dword ptr [rsp + 8], xmm0
	cmp r12, qword ptr [rsp + 80]
	mov rax, rbx
	jne .LBB147_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 88]
.LBB147_44:
	mov rbx, rax
	vmovss xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 96], r12
	mov rax, qword ptr [rsp + 128]
	mov r13, rax
	cmp rax, qword ptr [rsp + 112]
	jne .LBB147_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_46:
	mov rax, qword ptr [rsp + 120]
	mov qword ptr [rsp + 72], rax
	vmovss xmm0, dword ptr [rsp + 32]
	vmovss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 32], r13
	mov qword ptr [rsp + 128], r13
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp + 8]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 24], xmm1
	vucomiss xmm0, xmm2
	jne .LBB147_47
	jp .LBB147_47
	mov r13, qword ptr [rsp + 152]
	cmp r13, qword ptr [rsp + 136]
	je .LBB147_49
	jmp .LBB147_50
	.p2align	4
.LBB147_47:
	vmovss xmm0, dword ptr [rip + .LCPI147_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 24], xmm0
	mov r13, qword ptr [rsp + 152]
	cmp r13, qword ptr [rsp + 136]
	jne .LBB147_50
.LBB147_49:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_50:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 64], rax
	vmovss xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 152], r13
	mov rbp, qword ptr [rsp + 176]
	cmp rbp, qword ptr [rsp + 160]
	jne .LBB147_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_52
.LBB147_4:
	mov qword ptr [rsp + 64], r12
	mov qword ptr [rsp + 72], r15
	mov qword ptr [rsp + 32], 0
	xor r13d, r13d
	xor ebp, ebp
	xor r12d, r12d
.LBB147_5:
	mov qword ptr [rsp + 192], rax
	mov rbx, qword ptr [rsp + 40]
	lea r15, [4*rbx]
	test rbx, rbx
	mov qword ptr [rsp + 184], r15
	je .LBB147_6
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_68
	cmp rbx, 5
	jae .LBB147_61
	xor esi, esi
	jmp .LBB147_56
.LBB147_6:
	mov r11d, 4
	mov r8d, 4
	jmp .LBB147_7
.LBB147_61:
	cmp rbx, 33
	jae .LBB147_63
	xor esi, esi
	jmp .LBB147_66
.LBB147_63:
	mov edx, ebx
	and edx, 31
	mov ecx, 32
	cmovne rcx, rdx
	mov rsi, rbx
	sub rsi, rcx
	xor edx, edx
	.p2align	4
.LBB147_64:
	vmovups ymm0, ymmword ptr [r14 + 8*rdx]
	vmovups ymm1, ymmword ptr [r14 + 8*rdx + 64]
	vmovups ymm2, ymmword ptr [r14 + 8*rdx + 128]
	vmovups ymm3, ymmword ptr [r14 + 8*rdx + 192]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rdx + 32], 136
	vpermpd ymm0, ymm0, 216
	vshufps ymm1, ymm1, ymmword ptr [r14 + 8*rdx + 96], 136
	vpermpd ymm1, ymm1, 216
	vshufps ymm2, ymm2, ymmword ptr [r14 + 8*rdx + 160], 136
	vshufps ymm3, ymm3, ymmword ptr [r14 + 8*rdx + 224], 136
	vpermpd ymm2, ymm2, 216
	vpermpd ymm3, ymm3, 216
	vmovups ymmword ptr [rax + 4*rdx], ymm0
	vmovups ymmword ptr [rax + 4*rdx + 32], ymm1
	vmovups ymmword ptr [rax + 4*rdx + 64], ymm2
	vmovups ymmword ptr [rax + 4*rdx + 96], ymm3
	add rdx, 32
	cmp rsi, rdx
	jne .LBB147_64
	cmp ecx, 4
	jbe .LBB147_56
.LBB147_66:
	mov rcx, rsi
	mov esi, ebx
	and esi, 3
	mov edx, 4
	cmovne rdx, rsi
	mov rsi, rbx
	sub rsi, rdx
	.p2align	4
.LBB147_67:
	vmovups xmm0, xmmword ptr [r14 + 8*rcx]
	vshufps xmm0, xmm0, xmmword ptr [r14 + 8*rcx + 16], 136
	vmovups xmmword ptr [rax + 4*rcx], xmm0
	add rcx, 4
	cmp rsi, rcx
	jne .LBB147_67
	.p2align	4
.LBB147_56:
	vmovss xmm0, dword ptr [r14 + 8*rsi]
	vmovss dword ptr [rax + 4*rsi], xmm0
	inc rsi
	cmp rbx, rsi
	jne .LBB147_56
	mov r15, rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [4*rbx]
	vzeroupper
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_77
	mov r8, rax
	cmp rbx, 5
	mov r11, r15
	jae .LBB147_70
	xor eax, eax
	jmp .LBB147_60
.LBB147_70:
	cmp rbx, 33
	jae .LBB147_72
	xor eax, eax
	jmp .LBB147_75
.LBB147_72:
	mov eax, ebx
	and eax, 31
	mov ecx, 32
	cmovne rcx, rax
	mov rax, rbx
	sub rax, rcx
	xor edx, edx
	.p2align	4
.LBB147_73:
	vmovups ymm0, ymmword ptr [r14 + 8*rdx + 4]
	vmovups ymm1, ymmword ptr [r14 + 8*rdx + 68]
	vmovups ymm2, ymmword ptr [r14 + 8*rdx + 132]
	vmovups ymm3, ymmword ptr [r14 + 8*rdx + 196]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rdx + 36], 136
	vpermpd ymm0, ymm0, 216
	vshufps ymm1, ymm1, ymmword ptr [r14 + 8*rdx + 100], 136
	vpermpd ymm1, ymm1, 216
	vshufps ymm2, ymm2, ymmword ptr [r14 + 8*rdx + 164], 136
	vshufps ymm3, ymm3, ymmword ptr [r14 + 8*rdx + 228], 136
	vpermpd ymm2, ymm2, 216
	vpermpd ymm3, ymm3, 216
	vmovups ymmword ptr [r8 + 4*rdx], ymm0
	vmovups ymmword ptr [r8 + 4*rdx + 32], ymm1
	vmovups ymmword ptr [r8 + 4*rdx + 64], ymm2
	vmovups ymmword ptr [r8 + 4*rdx + 96], ymm3
	add rdx, 32
	cmp rax, rdx
	jne .LBB147_73
	cmp ecx, 4
	jbe .LBB147_60
.LBB147_75:
	mov rcx, rax
	mov eax, ebx
	and eax, 3
	mov edx, 4
	cmovne rdx, rax
	mov rax, rbx
	sub rax, rdx
	.p2align	4
.LBB147_76:
	vmovups xmm0, xmmword ptr [r14 + 8*rcx + 4]
	vshufps xmm0, xmm0, xmmword ptr [r14 + 8*rcx + 20], 136
	vmovups xmmword ptr [r8 + 4*rcx], xmm0
	add rcx, 4
	cmp rax, rcx
	jne .LBB147_76
	.p2align	4
.LBB147_60:
	vmovss xmm0, dword ptr [r14 + 8*rax + 4]
	vmovss dword ptr [r8 + 4*rax], xmm0
	inc rax
	cmp rbx, rax
	jne .LBB147_60
.LBB147_7:
	test r12, r12
	je .LBB147_14
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 216], rax
	mov rax, qword ptr [rsp + 48]
	vmovss xmm0, dword ptr [rax]
	vmovss dword ptr [rsp + 108], xmm0
	vmovss xmm0, dword ptr [rax + 4]
	vmovss dword ptr [rsp + 104], xmm0
	xor r15d, r15d
	xor ebx, ebx
	mov qword ptr [rsp + 8], r11
	mov qword ptr [rsp + 24], r8
	.p2align	4
.LBB147_9:
	mov rax, qword ptr [rsp + 32]
	add rax, rbx
	je .LBB147_14
	mov rax, r13
	add rax, rbx
	je .LBB147_14
	mov rax, rbp
	add rax, rbx
	je .LBB147_14
	cmp qword ptr [rsp + 184], r15
	je .LBB147_14
	mov rcx, qword ptr [rsp + 216]
	lea rax, [rcx + r15]
	lea rdx, [rcx + r15]
	add rdx, 4
	lea rcx, [r12 + rbx - 1]
	mov rsi, qword ptr [rsp + 72]
	lea r8, [rsi + r15 + 4]
	mov rdi, qword ptr [rsp + 32]
	lea r9, [rdi + rbx - 1]
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rsi + r15]
	mov rsi, qword ptr [rsp + 64]
	lea rax, [rsi + r15 + 4]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rsp + 192]
	vmovss xmm2, dword ptr [rax + r15]
	vmovss dword ptr [rsp + 16], xmm2
	lea rax, [rax + r15 + 4]
	mov qword ptr [rsp + 48], rax
	mov rax, qword ptr [rsp + 40]
	lea r10, [rax + rbx - 1]
	mov rax, qword ptr [rsp + 24]
	lea rax, [rax + r15 + 4]
	mov rdi, qword ptr [rsp + 8]
	lea r11, [rdi + r15 + 4]
	vmovss xmm2, dword ptr [rsp + 108]
	vmulss xmm2, xmm2, dword ptr [rsi + r15]
	vmovss dword ptr [rsp + 204], xmm0
	vmovss dword ptr [rsp + 208], xmm1
	vmovss dword ptr [rsp + 212], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 204]
	vmovss xmm0, dword ptr [rsp + 104]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [rbp + rbx - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 88]
	.cfi_adjust_cfa_offset 8
	lea rax, [r13 + rbx - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 112]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f32>
	mov r8, qword ptr [rsp + 88]
	mov r11, qword ptr [rsp + 72]
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	vpermilps xmm0, xmmword ptr [rsp + 224], 236
	vmovsd xmm1, qword ptr [rsp + 228]
	vaddps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [rsp + 244]
	vmovshdup xmm2, xmm0
	vaddss xmm0, xmm0, xmm2
	vmovss xmm3, dword ptr [rsp + 16]
	vmulss xmm0, xmm3, xmm0
	vpermilps xmm2, xmmword ptr [rsp + 240], 236
	vaddss xmm0, xmm0, dword ptr [r11 + r15]
	vmovss dword ptr [r11 + r15], xmm0
	vaddps xmm0, xmm1, xmm2
	vmovshdup xmm1, xmm0
	vaddss xmm0, xmm0, xmm1
	vmulss xmm0, xmm3, xmm0
	vaddss xmm0, xmm0, dword ptr [r8 + r15]
	vmovss dword ptr [r8 + r15], xmm0
	dec rbx
	add r15, 4
	mov rax, r12
	add rax, rbx
	jne .LBB147_9
.LBB147_14:
	mov rdi, qword ptr [rsp + 40]
	test rdi, rdi
	mov r15, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 64]
	je .LBB147_89
	cmp rdi, 4
	jae .LBB147_79
	xor eax, eax
	jmp .LBB147_17
.LBB147_79:
	movabs rcx, 1152921504606846960
	cmp rdi, 16
	jae .LBB147_81
	xor eax, eax
	jmp .LBB147_85
.LBB147_81:
	mov rax, rdi
	and rax, rcx
	lea rdx, [rdi + rdi]
	and rdx, -32
	xor esi, esi
	.p2align	4
.LBB147_82:
	vmovups ymm0, ymmword ptr [r11 + 2*rsi]
	vmovups ymm1, ymmword ptr [r11 + 2*rsi + 32]
	vmovups ymm2, ymmword ptr [r8 + 2*rsi]
	vmovups ymm3, ymmword ptr [r8 + 2*rsi + 32]
	vunpckhps ymm4, ymm0, ymm2
	vunpcklps ymm0, ymm0, ymm2
	vinsertf128 ymm2, ymm0, xmm4, 1
	vperm2f128 ymm0, ymm0, ymm4, 49
	vmovups ymmword ptr [r14 + 4*rsi + 32], ymm0
	vmovups ymmword ptr [r14 + 4*rsi], ymm2
	vunpckhps ymm0, ymm1, ymm3
	vunpcklps ymm1, ymm1, ymm3
	vinsertf128 ymm2, ymm1, xmm0, 1
	vperm2f128 ymm0, ymm1, ymm0, 49
	vmovups ymmword ptr [r14 + 4*rsi + 96], ymm0
	vmovups ymmword ptr [r14 + 4*rsi + 64], ymm2
	add rsi, 32
	cmp rdx, rsi
	jne .LBB147_82
	cmp rdi, rax
	je .LBB147_88
	test dil, 12
	je .LBB147_17
.LBB147_85:
	mov rdx, rax
	add rcx, 12
	mov rax, rcx
	and rax, rdi
	vmovaps ymm0, ymmword ptr [rip + .LCPI147_1]
	vmovaps ymm1, ymmword ptr [rip + .LCPI147_2]
	.p2align	4
.LBB147_86:
	vbroadcastf128 ymm2, xmmword ptr [r8 + 4*rdx]
	vpermilps ymm2, ymm2, ymm0
	vbroadcastf128 ymm3, xmmword ptr [r11 + 4*rdx]
	vpermilps ymm3, ymm3, ymm1
	vblendps ymm2, ymm3, ymm2, 170
	vmovups ymmword ptr [r14 + 8*rdx], ymm2
	add rdx, 4
	cmp rax, rdx
	jne .LBB147_86
	jmp .LBB147_87
.LBB147_102:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB147_20:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB147_69
.LBB147_100:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB147_69
.LBB147_28:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB147_69
.LBB147_68:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, r15
	call alloc::raw_vec::handle_error
	jmp .LBB147_69
.LBB147_77:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 184]
	call alloc::raw_vec::handle_error
.LBB147_69:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_31
	jmp .LBB147_30
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_99
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_22
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_99
.LBB147_22:
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_98
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB147_98
	jmp .LBB147_99
.LBB147_30:
	mov rbx, rax
.LBB147_31:
	cmp qword ptr [rsp + 160], 0
	jne .LBB147_32
	cmp qword ptr [rsp + 136], 0
	jne .LBB147_34
.LBB147_35:
	cmp qword ptr [rsp + 112], 0
	jne .LBB147_36
.LBB147_37:
	cmp qword ptr [rsp + 80], 0
	jne .LBB147_38
	jmp .LBB147_99
.LBB147_32:
	mov rdi, qword ptr [rsp + 168]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 136], 0
	je .LBB147_35
.LBB147_34:
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB147_37
.LBB147_36:
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 80], 0
	je .LBB147_99
.LBB147_38:
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 8], rax
.LBB147_98:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_99:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB147_17:
	vmovss xmm0, dword ptr [r11 + 4*rax]
	vmovss xmm1, dword ptr [r8 + 4*rax]
	vmovss dword ptr [r14 + 8*rax], xmm0
	vmovss dword ptr [r14 + 8*rax + 4], xmm1
	inc rax
.LBB147_87:
	cmp rdi, rax
	jne .LBB147_17
.LBB147_88:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r8
	mov r14, r11
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call rbx
.LBB147_89:
	cmp qword ptr [rsp + 160], 0
	mov rdi, qword ptr [rsp + 192]
	je .LBB147_91
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB147_91:
	cmp qword ptr [rsp + 136], 0
	je .LBB147_93
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB147_93:
	cmp qword ptr [rsp + 112], 0
	je .LBB147_95
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB147_95:
	cmp qword ptr [rsp + 80], 0
	je .LBB147_96
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
.LBB147_96:
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
