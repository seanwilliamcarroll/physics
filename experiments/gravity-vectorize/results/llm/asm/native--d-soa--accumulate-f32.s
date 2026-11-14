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
	mov r8, qword ptr [rsi + 16]
	mov r14, rdx
	movabs rdx, 9223372036854775805
	lea rbp, [4*r8]
	mov rax, r8
	shr rax, 62
	sete al
	cmp rbp, rdx
	setb dl
	test al, dl
	jne .LBB147_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	mov qword ptr [rsp + 40], rcx
	mov qword ptr [rsp + 48], rdi
	test rbp, rbp
	je .LBB147_2
	mov rbx, rsi
	mov qword ptr [rsp + 16], r8
	.cfi_escape 0x2e, 0x00
	mov r15, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB147_102
	mov qword ptr [rsp + 8], rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB147_20
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB147_100
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB147_28
	mov rcx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	mov rsi, rbx
	jmp .LBB147_3
.LBB147_2:
	mov r13d, 4
	mov ecx, 4
	mov r12d, 4
	mov eax, 4
.LBB147_3:
	mov rdx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 80], r8
	mov qword ptr [rsp + 112], r8
	mov qword ptr [rsp + 136], r8
	mov qword ptr [rsp + 160], r8
	mov qword ptr [rsp + 88], rcx
	mov qword ptr [rsp + 120], r12
	mov qword ptr [rsp + 144], r13
	mov qword ptr [rsp + 168], rax
	mov rbx, rcx
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	cmp rdx, r8
	cmovb r8, rdx
	test r8, r8
	je .LBB147_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 16], r8
	xor r12d, r12d
	mov qword ptr [rsp + 56], rax
	jmp .LBB147_41
	.p2align	4
.LBB147_52:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 168]
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
	mov rax, rbx
	vmovss dword ptr [rsp + 8], xmm0
	cmp r12, qword ptr [rsp + 80]
	jne .LBB147_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 88]
.LBB147_44:
	vmovss xmm0, dword ptr [rsp + 24]
	mov rbx, rax
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 96], r12
	mov r13, rax
	cmp rax, qword ptr [rsp + 112]
	jne .LBB147_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_46:
	mov rax, qword ptr [rsp + 120]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	mov qword ptr [rsp + 72], rax
	vmovss xmm0, dword ptr [rsp + 32]
	vmovss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 32], r13
	mov qword ptr [rsp + 128], r13
	vmovss xmm0, dword ptr [rsp + 8]
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
	mov rbp, qword ptr [rsp + 176]
	mov qword ptr [rsp + 152], r13
	cmp rbp, qword ptr [rsp + 160]
	jne .LBB147_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_52
.LBB147_4:
	mov qword ptr [rsp + 64], r13
	mov qword ptr [rsp + 72], r12
	mov qword ptr [rsp + 32], 0
	xor r13d, r13d
	xor ebp, ebp
	xor r12d, r12d
.LBB147_5:
	mov qword ptr [rsp + 192], rax
	mov rbx, qword ptr [rsp + 40]
	lea r15, [4*rbx]
	mov qword ptr [rsp + 184], r15
	test rbx, rbx
	je .LBB147_6
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, r15
	call rax
	test rax, rax
	je .LBB147_68
	cmp rbx, 9
	jae .LBB147_61
	xor esi, esi
	jmp .LBB147_56
.LBB147_6:
	mov r11d, 4
	mov r8d, 4
	jmp .LBB147_7
.LBB147_61:
	cmp rbx, 65
	jae .LBB147_63
	xor esi, esi
	jmp .LBB147_66
.LBB147_63:
	vmovaps zmm0, zmmword ptr [rip + .LCPI147_1]
	mov edx, ebx
	and edx, 63
	mov ecx, 64
	mov rsi, rbx
	cmovne rcx, rdx
	xor edx, edx
	sub rsi, rcx
	.p2align	4
.LBB147_64:
	vmovups zmm1, zmmword ptr [r14 + 8*rdx]
	vmovups zmm2, zmmword ptr [r14 + 8*rdx + 128]
	vmovups zmm3, zmmword ptr [r14 + 8*rdx + 256]
	vmovups zmm4, zmmword ptr [r14 + 8*rdx + 384]
	vpermt2ps zmm1, zmm0, zmmword ptr [r14 + 8*rdx + 64]
	vpermt2ps zmm2, zmm0, zmmword ptr [r14 + 8*rdx + 192]
	vpermt2ps zmm3, zmm0, zmmword ptr [r14 + 8*rdx + 320]
	vpermt2ps zmm4, zmm0, zmmword ptr [r14 + 8*rdx + 448]
	vmovups zmmword ptr [rax + 4*rdx], zmm1
	vmovups zmmword ptr [rax + 4*rdx + 64], zmm2
	vmovups zmmword ptr [rax + 4*rdx + 128], zmm3
	vmovups zmmword ptr [rax + 4*rdx + 192], zmm4
	add rdx, 64
	cmp rsi, rdx
	jne .LBB147_64
	cmp ecx, 8
	jbe .LBB147_56
.LBB147_66:
	mov rcx, rsi
	mov esi, ebx
	and esi, 7
	mov edx, 8
	cmovne rdx, rsi
	mov rsi, rbx
	sub rsi, rdx
	.p2align	4
.LBB147_67:
	vmovups ymm0, ymmword ptr [r14 + 8*rcx]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rcx + 32], 136
	vpermpd ymm0, ymm0, 216
	vmovups ymmword ptr [rax + 4*rcx], ymm0
	add rcx, 8
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
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	lea rdi, [4*rbx]
	vzeroupper
	call rax
	test rax, rax
	je .LBB147_77
	mov r8, rax
	mov r11, r15
	cmp rbx, 9
	jae .LBB147_70
	xor eax, eax
	jmp .LBB147_60
.LBB147_70:
	cmp rbx, 65
	jae .LBB147_72
	xor eax, eax
	jmp .LBB147_75
.LBB147_72:
	vmovaps zmm0, zmmword ptr [rip + .LCPI147_1]
	mov eax, ebx
	and eax, 63
	mov ecx, 64
	cmovne rcx, rax
	mov rax, rbx
	xor edx, edx
	sub rax, rcx
	.p2align	4
.LBB147_73:
	vmovups zmm1, zmmword ptr [r14 + 8*rdx + 4]
	vmovups zmm2, zmmword ptr [r14 + 8*rdx + 132]
	vmovups zmm3, zmmword ptr [r14 + 8*rdx + 260]
	vmovups zmm4, zmmword ptr [r14 + 8*rdx + 388]
	vpermt2ps zmm1, zmm0, zmmword ptr [r14 + 8*rdx + 68]
	vpermt2ps zmm2, zmm0, zmmword ptr [r14 + 8*rdx + 196]
	vpermt2ps zmm3, zmm0, zmmword ptr [r14 + 8*rdx + 324]
	vpermt2ps zmm4, zmm0, zmmword ptr [r14 + 8*rdx + 452]
	vmovups zmmword ptr [r8 + 4*rdx], zmm1
	vmovups zmmword ptr [r8 + 4*rdx + 64], zmm2
	vmovups zmmword ptr [r8 + 4*rdx + 128], zmm3
	vmovups zmmword ptr [r8 + 4*rdx + 192], zmm4
	add rdx, 64
	cmp rax, rdx
	jne .LBB147_73
	cmp ecx, 8
	jbe .LBB147_60
.LBB147_75:
	mov rcx, rax
	mov eax, ebx
	and eax, 7
	mov edx, 8
	cmovne rdx, rax
	mov rax, rbx
	sub rax, rdx
	.p2align	4
.LBB147_76:
	vmovups ymm0, ymmword ptr [r14 + 8*rcx + 4]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rcx + 36], 136
	vpermpd ymm0, ymm0, 216
	vmovups ymmword ptr [r8 + 4*rcx], ymm0
	add rcx, 8
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
	xor r15d, r15d
	xor ebx, ebx
	mov qword ptr [rsp + 216], rax
	mov rax, qword ptr [rsp + 48]
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rax + 4]
	vmovss dword ptr [rsp + 108], xmm0
	vmovss dword ptr [rsp + 104], xmm1
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
	mov rsi, qword ptr [rsp + 72]
	mov rax, qword ptr [rsp + 216]
	mov rdi, qword ptr [rsp + 32]
	lea rcx, [r12 + rbx - 1]
	lea r8, [rsi + r15 + 4]
	vmovss xmm1, dword ptr [rsi + r15]
	mov rsi, qword ptr [rsp + 64]
	lea rdx, [rax + r15 + 4]
	add rax, r15
	lea r9, [rdi + rbx - 1]
	vmovss xmm0, dword ptr [rax]
	lea rax, [rsi + r15 + 4]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rsp + 192]
	vmovss xmm2, dword ptr [rax + r15]
	lea rax, [rax + r15 + 4]
	vmovss dword ptr [rsp + 16], xmm2
	mov qword ptr [rsp + 48], rax
	mov rax, qword ptr [rsp + 40]
	mov rdi, qword ptr [rsp + 24]
	vmovss xmm2, dword ptr [rsp + 108]
	vmulss xmm2, xmm2, dword ptr [rsi + r15]
	vmovss dword ptr [rsp + 204], xmm0
	vmovss dword ptr [rsp + 208], xmm1
	lea r10, [rax + rbx - 1]
	lea rax, [rdi + r15 + 4]
	mov rdi, qword ptr [rsp + 8]
	lea r11, [rdi + r15 + 4]
	vmovss dword ptr [rsp + 212], xmm2
	.cfi_escape 0x2e, 0x40
	vmovss xmm0, dword ptr [rsp + 104]
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 204]
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
	vmovss xmm3, dword ptr [rsp + 16]
	dec rbx
	mov rax, r12
	vaddps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [rsp + 244]
	vmovshdup xmm2, xmm0
	vaddss xmm0, xmm0, xmm2
	vpermilps xmm2, xmmword ptr [rsp + 240], 236
	vmulss xmm0, xmm3, xmm0
	vaddss xmm0, xmm0, dword ptr [r11 + r15]
	vaddps xmm1, xmm1, xmm2
	vmovss dword ptr [r11 + r15], xmm0
	vmovshdup xmm0, xmm1
	vaddss xmm0, xmm1, xmm0
	vmulss xmm0, xmm3, xmm0
	vaddss xmm0, xmm0, dword ptr [r8 + r15]
	vmovss dword ptr [r8 + r15], xmm0
	add r15, 4
	add rax, rbx
	jne .LBB147_9
.LBB147_14:
	mov rdi, qword ptr [rsp + 40]
	mov r15, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 64]
	test rdi, rdi
	je .LBB147_89
	cmp rdi, 8
	jae .LBB147_79
	xor eax, eax
	jmp .LBB147_17
.LBB147_79:
	movabs rcx, 1152921504606846944
	cmp rdi, 32
	jae .LBB147_81
	xor eax, eax
	jmp .LBB147_85
.LBB147_81:
	vmovaps zmm0, zmmword ptr [rip + .LCPI147_2]
	vmovaps zmm1, zmmword ptr [rip + .LCPI147_3]
	mov rdx, rdi
	shr rdx, 5
	mov rax, rdi
	and rax, rcx
	xor esi, esi
	shl rdx, 6
	.p2align	4
.LBB147_82:
	vmovups zmm2, zmmword ptr [r11 + 2*rsi]
	vmovups zmm3, zmmword ptr [r11 + 2*rsi + 64]
	vmovups zmm4, zmmword ptr [r8 + 2*rsi]
	vmovups zmm5, zmmword ptr [r8 + 2*rsi + 64]
	vmovaps zmm6, zmm2
	vpermt2ps zmm6, zmm0, zmm4
	vpermt2ps zmm2, zmm1, zmm4
	vmovaps zmm4, zmm3
	vpermt2ps zmm4, zmm0, zmm5
	vpermt2ps zmm3, zmm1, zmm5
	vmovups zmmword ptr [r14 + 4*rsi + 64], zmm2
	vmovups zmmword ptr [r14 + 4*rsi], zmm6
	vmovups zmmword ptr [r14 + 4*rsi + 192], zmm3
	vmovups zmmword ptr [r14 + 4*rsi + 128], zmm4
	add rsi, 64
	cmp rdx, rsi
	jne .LBB147_82
	cmp rdi, rax
	je .LBB147_88
	test dil, 24
	je .LBB147_17
.LBB147_85:
	vmovaps zmm0, zmmword ptr [rip + .LCPI147_4]
	add rcx, 24
	mov rdx, rax
	mov rax, rcx
	and rax, rdi
	.p2align	4
.LBB147_86:
	vbroadcastf64x4 zmm1, ymmword ptr [r8 + 4*rdx]
	vbroadcastf64x4 zmm2, ymmword ptr [r11 + 4*rdx]
	vpermt2ps zmm2, zmm0, zmm1
	vmovups zmmword ptr [r14 + 8*rdx], zmm2
	add rdx, 8
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
	mov rsi, qword ptr [rsp + 184]
	mov edi, 4
	call alloc::raw_vec::handle_error
.LBB147_69:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r15
	call rax
	jmp .LBB147_31
	jmp .LBB147_30
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB147_99
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call rax
	jmp .LBB147_22
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
	je .LBB147_99
.LBB147_22:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	call rax
	jmp .LBB147_98
	cmp qword ptr [rsp + 16], 0
	mov rbx, rax
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
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB147_35
.LBB147_34:
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB147_37
.LBB147_36:
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 80], 0
	je .LBB147_99
.LBB147_38:
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 8], rax
.LBB147_98:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 8]
	call rax
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
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB147_91:
	cmp qword ptr [rsp + 136], 0
	je .LBB147_93
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	vzeroupper
	call rax
.LBB147_93:
	cmp qword ptr [rsp + 112], 0
	je .LBB147_95
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r15
	vzeroupper
	call rax
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
