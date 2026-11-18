<swarm::flock::Flock>::step_sorted:
	.cfi_startproc
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
	mov rbx, rdi
	vmovsd xmm3, qword ptr [rbx + 288]
	vmovss xmm0, dword ptr [rip + .LCPI1950_0]
	vmovss xmm2, dword ptr [rbx + 316]
	lea rax, [rdi + 316]
	mov rsi, qword ptr [rbx + 8]
	mov rdx, qword ptr [rbx + 16]
	mov rcx, qword ptr [rbx + 32]
	mov r8, qword ptr [rbx + 40]
	xor r15d, r15d
	mov r9, -1
	mov qword ptr [rsp + 232], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 296], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm1, xmm3, xmm0
	vmovaps xmmword ptr [rsp + 128], xmm2
	vmovaps xmmword ptr [rsp + 384], xmm3
	vcmpunordss k1, xmm1, xmm1
	vmaxss xmm1, xmm2, xmm1
	mov qword ptr [rsp + 288], rax
	vmovss xmm1 {k1}, xmm1, xmm2
	vmovshdup xmm2, xmm3
	vmulss xmm0, xmm2, xmm0
	vmovaps xmmword ptr [rsp + 368], xmm2
	vmaxss xmm2, xmm1, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm2 {k1}, xmm2, xmm1
	vmulss xmm0, xmm2, dword ptr [rip + .LCPI1950_1]
	vmovss xmm1, dword ptr [rip + .LCPI1950_2]
	vxorps xmm2, xmm2, xmm2
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rbx + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmulps xmm0, xmm3, xmm0
	vmovsd xmm3, qword ptr [rip + .LCPI1950_4]
	vroundps xmm0, xmm0, 10
	vcmpltps k1, xmm0, dword ptr [rip + .LCPI1950_3]{1to4}
	vcvtps2pd xmm1, xmm0
	vcmpleps k0, xmm2, xmm0
	vxorps xmm0, xmm0, xmm0
	vucomisd xmm1, xmm0
	vcvttsd2usi rax, xmm1
	kandw k1, k0, k1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	vshufpd xmm1, xmm1, xmm1, 1
	cmova rax, r9
	vucomisd xmm1, xmm0
	vmovq xmm2, rax
	vcvttsd2usi rax, xmm1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	cmova rax, r9
	vmovq xmm0, rax
	vpunpcklqdq xmm0, xmm2, xmm0
	vpbroadcastq xmm2, qword ptr [rip + .LCPI1950_5]
	vpmaxuq xmm2 {k1}, xmm0, xmm2
	vmovdqu xmmword ptr [rbx + 264], xmm2
	call <swarm::grid::Grid>::fill
	mov r14, qword ptr [rbx + 248]
	mov rax, qword ptr [rbx + 256]
	mov rbp, qword ptr [rbx + 8]
	mov r12, qword ptr [rbx + 16]
	mov rcx, rbx
	mov qword ptr [rbx + 112], 0
	mov qword ptr [rsp + 8], rcx
	lea rbx, [r14 + 4*rax]
	lea rax, [rcx + 96]
	mov r13, r14
	mov qword ptr [rsp + 40], rax
	jmp .LBB1950_2
.LBB1950_5:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1950_8
.LBB1950_6:
	cmp r15, qword ptr [rcx + 96]
	je .LBB1950_7
.LBB1950_1:
	mov rax, qword ptr [rcx + 104]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 112], r15
	.p2align	4
.LBB1950_2:
	cmp r13, rbx
	je .LBB1950_5
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r12, rax
	jbe .LBB1950_2
	vmovd xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_8
.LBB1950_7:
	mov rdi, qword ptr [rsp + 40]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	lea rax, [rcx + 120]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 40], rax
	jmp .LBB1950_10
.LBB1950_13:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_16
.LBB1950_14:
	cmp r15, qword ptr [rcx + 120]
	je .LBB1950_15
.LBB1950_9:
	mov rax, qword ptr [rcx + 128]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 136], r15
	.p2align	4
.LBB1950_10:
	cmp rbp, rbx
	je .LBB1950_13
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_10
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_14
	jmp .LBB1950_16
.LBB1950_15:
	mov rdi, qword ptr [rsp + 40]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	lea rax, [rcx + 144]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 40], rax
	jmp .LBB1950_18
.LBB1950_21:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_24
.LBB1950_22:
	cmp r15, qword ptr [rcx + 144]
	je .LBB1950_23
.LBB1950_17:
	mov rax, qword ptr [rcx + 152]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 160], r15
	.p2align	4
.LBB1950_18:
	cmp rbp, rbx
	je .LBB1950_21
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_18
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_22
	jmp .LBB1950_24
.LBB1950_23:
	mov rdi, qword ptr [rsp + 40]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_17
.LBB1950_24:
	mov r13, qword ptr [rcx + 80]
	mov r12, qword ptr [rcx + 88]
	lea rbp, [rcx + 168]
	xor r15d, r15d
	mov qword ptr [rcx + 184], 0
	jmp .LBB1950_26
.LBB1950_29:
	xor eax, eax
	mov r14, rbx
	cmp eax, 1
	jne .LBB1950_32
.LBB1950_30:
	cmp r15, qword ptr [rcx + 168]
	je .LBB1950_31
.LBB1950_25:
	mov rax, qword ptr [rcx + 176]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 184], r15
	.p2align	4
.LBB1950_26:
	cmp r14, rbx
	je .LBB1950_29
	mov eax, dword ptr [r14]
	add r14, 4
	cmp r12, rax
	jbe .LBB1950_26
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_30
	jmp .LBB1950_32
.LBB1950_31:
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_25
.LBB1950_32:
	mov rdx, qword ptr [rcx + 56]
	vmovups zmm0, zmmword ptr [rcx + 96]
	vmovdqu64 zmm1, zmmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov rdi, qword ptr [rcx + 32]
	mov rsi, qword ptr [rcx + 112]
	mov r8, qword ptr [rsp + 8]
	mov qword ptr [rsp + 192], rdx
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 200], rdi
	mov rdi, qword ptr [rsp + 8]
	vmovups zmmword ptr [rcx], zmm0
	vmovdqu64 zmmword ptr [rcx + 96], zmm1
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rdx + 64]
	mov rdx, qword ptr [rsp + 8]
	vmovdqu ymm0, ymmword ptr [rdi + 64]
	mov rdi, qword ptr [rsp + 8]
	mov rcx, qword ptr [rcx + 176]
	vmovups xmm2, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp + 8]
	vmovups xmmword ptr [rdx + 64], xmm2
	mov rdx, qword ptr [r8 + 80]
	mov qword ptr [rdi + 80], rcx
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rcx + 88], r15
	mov qword ptr [rsp + 184], rdx
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_102
	vmovss xmm2, dword ptr [rcx + 320]
	vextracti128 xmm3, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm31, zmmword ptr [rip + .LCPI1950_7]
	vextracti128 xmm0, ymm0, 1
	vxorps xmm29, xmm29, xmm29
	mov qword ptr [rsp + 224], rsi
	vmovq rdx, xmm3
	vpextrq rcx, xmm1, 1
	vpextrq r8, xmm0, 1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp + 8]
	cmp rax, rdx
	cmovb rdx, rax
	cmp r8, rdx
	cmovb rdx, r8
	xor edi, edi
	vmulss xmm26, xmm2, xmm2
	vmovaps xmm2, xmmword ptr [rsp + 128]
	mov qword ptr [rsp + 216], rdx
	vbroadcastss ymm0, xmm26
	vmovaps xmmword ptr [rsp + 352], xmm26
	vmovups ymmword ptr [rsp + 48], ymm0
	vmulss xmm27, xmm2, xmm2
	vbroadcastss ymm28, xmm27
	vmovaps xmmword ptr [rsp + 336], xmm27
	vmovups ymmword ptr [rsp + 400], ymm28
	jmp .LBB1950_36
.LBB1950_34:
	vmovaps xmm26, xmmword ptr [rsp + 352]
	vmovaps xmm27, xmmword ptr [rsp + 336]
	vmovups ymm28, ymmword ptr [rsp + 400]
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm31, zmmword ptr [rip + .LCPI1950_7]
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 224]
	vxorps xmm29, xmm29, xmm29
	.p2align	4
.LBB1950_35:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_102
.LBB1950_36:
	mov rbp, qword ptr [rcx + 16]
	cmp rdi, rbp
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 96], rax
	cmp rdi, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 64]
	mov rdx, qword ptr [rcx + 88]
	cmp rdi, rax
	mov qword ptr [rsp + 80], rdx
	mov qword ptr [rsp + 88], rax
	setb cl
	cmp rdi, rdx
	setb dl
	and dl, cl
	mov rcx, qword ptr [rsp + 8]
	cmp dl, 1
	jne .LBB1950_35
	mov rax, qword ptr [rcx + 8]
	mov r8, qword ptr [rcx + 32]
	mov rdx, qword ptr [rcx + 56]
	mov rsi, qword ptr [rcx + 80]
	vxorpd xmm6, xmm6, xmm6
	mov qword ptr [rsp + 240], rdi
	vmovss xmm7, dword ptr [rip + .LCPI1950_3]
	vxorps xmm8, xmm8, xmm8
	vmovss xmm25, dword ptr [rax + 4*rdi]
	vmovss xmm1, dword ptr [r8 + 4*rdi]
	vmovss xmm2, dword ptr [rdx + 4*rdi]
	vmovss xmm3, dword ptr [rsi + 4*rdi]
	mov qword ptr [rsp + 128], rax
	mov rdi, qword ptr [rcx + 264]
	mov qword ptr [rsp + 120], r8
	mov eax, 0
	mov qword ptr [rsp + 104], rsi
	mov rsi, -1
	mov qword ptr [rsp + 112], rdx
	mov rdx, qword ptr [rcx + 272]
	mov qword ptr [rsp + 280], rdi
	vmovss dword ptr [rsp + 152], xmm25
	vmovss dword ptr [rsp + 156], xmm1
	vmovss dword ptr [rsp + 160], xmm2
	vmovss dword ptr [rsp + 164], xmm3
	vmovss xmm3, dword ptr [rcx + 280]
	vxorps xmm2, xmm2, xmm2
	mov rcx, rdi
	vmulss xmm4, xmm25, xmm3
	vmulss xmm3, xmm1, xmm3
	vmaxss xmm4, xmm4, xmm2
	vmaxss xmm3, xmm3, xmm2
	vroundss xmm4, xmm4, xmm4, 9
	vcvtss2sd xmm5, xmm4, xmm4
	vmovsd xmm0, qword ptr [rip + .LCPI1950_4]
	vucomisd xmm5, xmm6
	vcvttsd2usi r8, xmm5
	cmovb r8, rax
	vucomisd xmm5, xmm0
	vroundss xmm3, xmm3, xmm3, 9
	cmova r8, rsi
	sub rcx, 1
	cmovb rcx, rax
	cmp rcx, r8
	cmovb r8, rcx
	vucomiss xmm4, xmm7
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2usi rdi, xmm4
	cmovae r8, rax
	vucomisd xmm4, xmm6
	cmovb rdi, rax
	vucomisd xmm4, xmm0
	vxorps xmm4, xmm4, xmm4
	cmova rdi, rsi
	sub rdx, 1
	mov rsi, r8
	cmovb rdx, rax
	cmp rdx, rdi
	cmovb rdi, rdx
	vucomiss xmm3, xmm7
	cmovae rdi, rax
	sub rsi, 1
	cmovb rsi, rax
	mov r14, rdi
	sub r14, 1
	cmovb r14, rax
	inc rdi
	mov qword ptr [rsp + 264], rsi
	cmp rdx, rdi
	cmovb rdi, rdx
	mov qword ptr [rsp + 272], rdi
	cmp r14, rdi
	ja .LBB1950_100
	mov rax, qword ptr [rsp + 88]
	mov rdx, qword ptr [rsp + 80]
	mov rsi, qword ptr [rsp + 96]
	inc r8
	vmovups ymm4, ymmword ptr [rsp + 48]
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vbroadcastss ymm13, xmm1
	vbroadcastss ymm14, xmm25
	vxorps xmm22, xmm22, xmm22
	vxorps xmm23, xmm23, xmm23
	vxorps xmm3, xmm3, xmm3
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm7, xmm7, xmm7
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	vxorps xmm10, xmm10, xmm10
	vxorps xmm9, xmm9, xmm9
	vxorps xmm24, xmm24, xmm24
	vxorps xmm21, xmm21, xmm21
	vxorps xmm0, xmm0, xmm0
	cmp rcx, r8
	cmovb r8, rcx
	cmp rax, rdx
	cmovb rdx, rax
	inc r8
	cmp rsi, rdx
	mov qword ptr [rsp + 32], r8
	cmovb rdx, rsi
	mov qword ptr [rsp + 248], rdx
	mov rdx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rdx + 208]
	mov rcx, qword ptr [rdx + 200]
	mov qword ptr [rsp + 256], rcx
	mov qword ptr [rsp + 16], rdi
	.p2align	4
.LBB1950_41:
	mov rcx, qword ptr [rsp + 280]
	mov rax, qword ptr [rsp + 264]
	mov qword ptr [rsp + 24], r14
	imul rcx, r14
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_44
	add rcx, r8
	mov r11d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_45
	mov rax, qword ptr [rsp + 256]
	mov edx, dword ptr [rax + 4*rsi]
	mov r11d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_45
	.p2align	4
.LBB1950_44:
	xor r11d, r11d
	xor edx, edx
.LBB1950_45:
	mov rax, qword ptr [rsp + 128]
	mov r13, r11
	sub r13, rdx
	mov r14, rbp
	mov r9, qword ptr [rsp + 112]
	setb r8b
	cmp r11, rbp
	mov ebp, 0
	mov rsi, r13
	mov r15, r13
	seta cl
	or cl, r8b
	cmovne rsi, rbp
	lea rdi, [rax + 4*rdx]
	mov eax, 4
	lea r9, [r9 + 4*rdx]
	cmovne rdi, rax
	cmp r11, qword ptr [rsp + 96]
	seta cl
	or cl, r8b
	mov rcx, qword ptr [rsp + 120]
	cmovne r15, rbp
	mov rbx, r15
	lea rcx, [rcx + 4*rdx]
	cmovne rcx, rax
	shr rbx, 3
	cmp r11, qword ptr [rsp + 88]
	seta r10b
	or r10b, r8b
	mov r10, r13
	cmovne r10, rbp
	cmovne r9, rax
	mov qword ptr [rsp + 40], r10
	shr r10, 3
	cmp r11, qword ptr [rsp + 80]
	seta r12b
	or r12b, r8b
	mov r8, qword ptr [rsp + 104]
	cmovne r13, rbp
	lea r12, [r8 + 4*rdx]
	mov r8, rsi
	mov rdx, r13
	cmovne r12, rax
	shr r8, 3
	shr rdx, 3
	cmp rbx, r8
	cmovb r8, rbx
	cmp r10, r8
	cmovb r8, r10
	cmp rdx, r8
	cmovb r8, rdx
	test r8, r8
	je .LBB1950_48
	shl r8, 5
	xor edx, edx
	.p2align	4
.LBB1950_47:
	vmovups ymm15, ymmword ptr [rdi + rdx]
	vmovups ymm16, ymmword ptr [rcx + rdx]
	vsubps ymm17, ymm14, ymm15
	vsubps ymm18, ymm13, ymm16
	vmulps ymm19, ymm17, ymm17
	vmulps ymm20, ymm18, ymm18
	vaddps ymm5, ymm19, ymm20
	vcmpltps ymm8, ymm5, ymm4
	vcmpleps k1, ymm4, ymm5
	vandps ymm8, ymm8, ymm2
	vcmpltps k1 {k1}, ymm5, ymm28
	vcmpltps ymm5, ymm0, ymm5
	vmulps ymm17, ymm17, ymm8
	vmulps ymm8, ymm18, ymm8
	vandps ymm5 {k1} {z}, ymm5, ymm2
	vaddps ymm7, ymm5, ymm7
	vaddps ymm6, ymm6, ymm17
	vmulps ymm17, ymm15, ymm5
	vmulps ymm15, ymm16, ymm5
	vmulps ymm16, ymm5, ymmword ptr [r9 + rdx]
	vaddps ymm3, ymm8, ymm3
	vaddps ymm10, ymm15, ymm10
	vmulps ymm15, ymm5, ymmword ptr [r12 + rdx]
	vaddps ymm9, ymm9, ymm17
	add rdx, 32
	vaddps ymm12, ymm16, ymm12
	vaddps ymm11, ymm15, ymm11
	cmp r8, rdx
	jne .LBB1950_47
.LBB1950_48:
	mov r8d, esi
	and r8d, 7
	mov r10, r11
	sub r10, 8
	mov edx, 0
	mov rbp, r14
	cmovae rdx, r10
	test r8, r8
	je .LBB1950_52
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1950_52
	cmp rbx, qword ptr [rsp + 248]
	ja .LBB1950_52
	mov rsi, qword ptr [rsp + 128]
	mov rcx, qword ptr [rsp + 120]
	add r8, rdx
	mov rax, r11
	sub rax, rdx
	vxorps xmm0, xmm0, xmm0
	sub r11, r8
	vpbroadcastq zmm5, rax
	mov rax, qword ptr [rsp + 112]
	mov r8, qword ptr [rsp + 32]
	vpbroadcastq zmm8, r11
	vpcmpltuq k1, zmm8, zmm30
	vpcmpnleuq k1 {k1}, zmm5, zmm31
	vmovups ymm15, ymmword ptr [rsi + 4*rdx]
	vmovups ymm16, ymmword ptr [rcx + 4*rdx]
	vsubps ymm5, ymm14, ymm15
	vsubps ymm8, ymm13, ymm16
	vmulps ymm17, ymm5, ymm5
	vmulps ymm18, ymm8, ymm8
	vaddps ymm2, ymm17, ymm18
	vcmpltps ymm4, ymm2, ymmword ptr [rsp + 48]
	vcmpgeps k2, ymm2, ymmword ptr [rsp + 48]
	vcmpltps ymm0, ymm0, ymm2
	vandps ymm4 {k1} {z}, ymm4, dword ptr [rip + .LCPI1950_2]{1to8}
	vcmpltps k0 {k2}, ymm2, ymm28
	kandb k1, k1, k0
	vandps ymm0 {k1} {z}, ymm0, dword ptr [rip + .LCPI1950_2]{1to8}
	vmulps ymm2, ymm5, ymm4
	vaddps ymm7, ymm0, ymm7
	vaddps ymm6, ymm2, ymm6
	vmulps ymm2, ymm8, ymm4
	vmovups ymm4, ymmword ptr [rsp + 48]
	vaddps ymm3, ymm2, ymm3
	vmulps ymm2, ymm15, ymm0
	vaddps ymm9, ymm9, ymm2
	vmulps ymm2, ymm16, ymm0
	vaddps ymm10, ymm10, ymm2
	vmulps ymm2, ymm0, ymmword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsp + 104]
	vaddps ymm12, ymm12, ymm2
	vmulps ymm2, ymm0, ymmword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsp + 24]
	vxorps xmm0, xmm0, xmm0
	vaddps ymm11, ymm11, ymm2
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	jmp .LBB1950_92
	.p2align	4
.LBB1950_52:
	mov rbx, qword ptr [rsp + 40]
	mov edx, r15d
	and edx, 7
	mov r11d, r13d
	and r11d, 7
	mov rax, qword ptr [rsp + 24]
	mov r10d, ebx
	and r10d, 7
	cmp rdx, r8
	cmovb r8, rdx
	cmp r10, r8
	cmovb r8, r10
	cmp r11, r8
	cmovb r8, r11
	test r8, r8
	je .LBB1950_55
	and esi, -8
	and r15d, -8
	and ebx, -8
	and r13d, -8
	vmovss xmm15, dword ptr [rdi + 4*rsi]
	vmovss xmm16, dword ptr [rcx + 4*r15]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_56
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_59
	.p2align	4
.LBB1950_55:
	mov r8, qword ptr [rsp + 32]
	jmp .LBB1950_92
	.p2align	4
.LBB1950_56:
	vucomiss xmm27, xmm19
	jbe .LBB1950_59
	vucomiss xmm19, xmm29
	jbe .LBB1950_59
	vmovss xmm0, dword ptr [r9 + 4*rbx]
	vmovss xmm2, dword ptr [r12 + 4*r13]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_59:
	cmp r8d, 1
	je .LBB1950_90
	vmovss xmm15, dword ptr [rdi + 4*rsi + 4]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 4]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_62
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_65
.LBB1950_62:
	vucomiss xmm27, xmm19
	jbe .LBB1950_65
	vucomiss xmm19, xmm29
	jbe .LBB1950_65
	vmovss xmm0, dword ptr [r9 + 4*rbx + 4]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 4]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_65:
	cmp r8d, 2
	je .LBB1950_90
	vmovss xmm15, dword ptr [rdi + 4*rsi + 8]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 8]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_68
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_71
.LBB1950_68:
	vucomiss xmm27, xmm19
	jbe .LBB1950_71
	vucomiss xmm19, xmm29
	jbe .LBB1950_71
	vmovss xmm0, dword ptr [r9 + 4*rbx + 8]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 8]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_71:
	cmp r8d, 3
	je .LBB1950_90
	vmovss xmm15, dword ptr [rdi + 4*rsi + 12]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 12]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_74
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_77
.LBB1950_74:
	vucomiss xmm27, xmm19
	jbe .LBB1950_77
	vucomiss xmm19, xmm29
	jbe .LBB1950_77
	vmovss xmm0, dword ptr [r9 + 4*rbx + 12]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 12]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_77:
	cmp r8d, 4
	je .LBB1950_90
	vmovss xmm15, dword ptr [rdi + 4*rsi + 16]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 16]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_80
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_83
.LBB1950_80:
	vucomiss xmm27, xmm19
	jbe .LBB1950_83
	vucomiss xmm19, xmm29
	jbe .LBB1950_83
	vmovss xmm0, dword ptr [r9 + 4*rbx + 16]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 16]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_83:
	cmp r8d, 5
	je .LBB1950_90
	vmovss xmm15, dword ptr [rdi + 4*rsi + 20]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 20]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_86
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_89
.LBB1950_86:
	vucomiss xmm27, xmm19
	jbe .LBB1950_89
	vucomiss xmm19, xmm29
	jbe .LBB1950_89
	vmovss xmm0, dword ptr [r9 + 4*rbx + 20]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 20]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm4, xmm15, xmm16, 16
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vaddps xmm22, xmm22, xmm0
.LBB1950_89:
	cmp r8d, 6
	jne .LBB1950_94
	.p2align	4
.LBB1950_90:
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	mov r8, qword ptr [rsp + 32]
.LBB1950_91:
	vxorps xmm0, xmm0, xmm0
.LBB1950_92:
	mov rdi, qword ptr [rsp + 16]
.LBB1950_93:
	lea r14, [rax + 1]
	cmp rax, qword ptr [rsp + 272]
	jne .LBB1950_41
	jmp .LBB1950_99
.LBB1950_94:
	vmovss xmm15, dword ptr [rdi + 4*rsi + 24]
	vmovss xmm16, dword ptr [rcx + 4*r15 + 24]
	mov r8, qword ptr [rsp + 32]
	vsubss xmm17, xmm25, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm0, xmm17, xmm17
	vmulss xmm2, xmm18, xmm18
	vaddss xmm19, xmm0, xmm2
	vucomiss xmm26, xmm19
	jbe .LBB1950_96
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_91
.LBB1950_96:
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	mov rdi, qword ptr [rsp + 16]
	vucomiss xmm27, xmm19
	vxorps xmm0, xmm0, xmm0
	jbe .LBB1950_93
	vucomiss xmm19, xmm29
	jbe .LBB1950_93
	vmovss xmm0, dword ptr [r9 + 4*rbx + 24]
	vmovss xmm2, dword ptr [r12 + 4*r13 + 24]
	vinsertps xmm4, xmm15, xmm16, 16
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm0, xmm4, xmm0, 32
	vmovups ymm4, ymmword ptr [rsp + 48]
	vinsertps xmm0, xmm0, xmm2, 48
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vaddps xmm22, xmm22, xmm0
	vxorps xmm0, xmm0, xmm0
	jmp .LBB1950_93
.LBB1950_99:
	vpmovsxbd xmm2, dword ptr [rip + .LCPI1950_10]
	vunpcklps xmm0, xmm9, xmm10
	vinsertps xmm1, xmm10, xmm9, 76
	vextractf128 xmm5, ymm12, 1
	vextractf128 xmm8, ymm11, 1
	vmovlhps xmm0, xmm0, xmm12
	vshufps xmm1, xmm1, xmm12, 212
	vinsertps xmm0, xmm0, xmm11, 48
	vinsertps xmm1, xmm1, xmm11, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm9, xmm10
	vmovsd xmm1, xmm12, xmm1
	vinsertps xmm1, xmm1, xmm11, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm9
	vpermt2ps xmm1, xmm2, xmm10
	vextractf128 xmm2, ymm9, 1
	vshufps xmm1, xmm1, xmm12, 244
	vblendps xmm1, xmm1, xmm11, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm10, 1
	vunpcklps xmm4, xmm2, xmm1
	vmovlhps xmm4, xmm4, xmm5
	vinsertps xmm4, xmm4, xmm8, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vunpckhps xmm1, xmm2, xmm1
	vextractf128 xmm2, ymm7, 1
	vshufps xmm4, xmm4, xmm5, 212
	vmovsd xmm1, xmm5, xmm1
	vinsertps xmm4, xmm4, xmm8, 112
	vinsertps xmm1, xmm1, xmm8, 176
	vaddps xmm0, xmm0, xmm4
	vaddps xmm0, xmm0, xmm1
	vpmovsxbd xmm1, dword ptr [rip + .LCPI1950_11]
	vpermt2ps ymm9, ymm1, ymm10
	vshufps xmm1, xmm9, xmm5, 244
	vblendps xmm1, xmm1, xmm8, 8
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm7, xmm7, 1
	vinsertps xmm1, xmm1, xmm6, 156
	vaddps xmm8, xmm22, xmm0
	vhaddps xmm0, xmm7, xmm6
	vshufps xmm0, xmm0, xmm0, 232
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm6, xmm6, 1
	vinsertps xmm1, xmm1, xmm7, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm6, 1
	vinsertps xmm4, xmm2, xmm1, 28
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vaddps xmm0, xmm0, xmm4
	vshufpd xmm4, xmm2, xmm2, 1
	vinsertps xmm4, xmm4, xmm1, 156
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm2, 204
	vaddps xmm0, xmm0, xmm4
	vaddps xmm0, xmm0, xmm1
	vinsertps xmm1, xmm21, xmm24, 16
	vaddps xmm4, xmm1, xmm0
	vmovshdup xmm0, xmm3
	vshufpd xmm1, xmm3, xmm3, 1
	vaddss xmm0, xmm3, xmm0
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm3, xmm3, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm3, 1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm2
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm23, xmm0
.LBB1950_100:
	vmovaps xmm0, xmmword ptr [rsp + 384]
	vmovdqa xmm1, xmmword ptr [rsp + 368]
	mov rsi, qword ptr [rsp + 232]
	lea rdi, [rsp + 168]
	lea rdx, [rsp + 288]
	lea rcx, [rsp + 152]
	lea r8, [rsp + 304]
	vmovaps xmmword ptr [rsp + 304], xmm8
	vmovlps qword ptr [rsp + 320], xmm4
	vmovss dword ptr [rsp + 328], xmm2
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 240]
	cmp rdi, qword ptr [rsp + 216]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 168]
	vmovd xmm1, dword ptr [rsp + 172]
	mov rax, qword ptr [rsp + 208]
	mov rcx, qword ptr [rsp + 200]
	vmovss xmm2, dword ptr [rsp + 176]
	vmovss xmm3, dword ptr [rsp + 180]
	mov rdx, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*rdi], xmm0
	vmovd dword ptr [rcx + 4*rdi], xmm1
	mov rcx, qword ptr [rsp + 184]
	vmovss dword ptr [rdx + 4*rdi], xmm2
	vmovss dword ptr [rcx + 4*rdi], xmm3
	jmp .LBB1950_34
.LBB1950_102:
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
	vzeroupper
	ret
