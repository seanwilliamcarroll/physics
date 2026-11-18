
    Finished `release` profile [optimized] target(s) in 0.01s
.section .text.<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,"ax",@progbits
	.prefalign	4, .Lfunc_end6, nop
.type	<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,@function
<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception4
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
	sub rsp, 1112
	.cfi_def_cfa_offset 1168
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov qword ptr [rsp + 32], rsi
	mov byte ptr [rdi + 48], 1
	mov r15, qword ptr [rdi + 40]
	lea rcx, [r15 + 999]
	mov rax, rcx
	shr rax, 3
	movabs rdx, 2361183241434822607
	mul rdx
	mov qword ptr [rsp + 80], rdx
	cmp rcx, 999
	jbe .LBB6_70
	mov rbx, rdi
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 112], rax
	mov dword ptr [rsp + 72], edx
	mov qword ptr [rbx], 0
	mov qword ptr [rsp + 40], rbx
	mov dword ptr [rbx + 8], 0
	lea rax, [r15 - 1]
	cmp rax, 1000
	jae .LBB6_2
	mov rax, qword ptr [rsp + 32]
	movss xmm0, dword ptr [rax + 312]
	movss dword ptr [rsp + 28], xmm0
	lea rcx, [rax + 96]
	mov qword ptr [rsp + 64], rcx
	movups xmm0, xmmword ptr [rax + 288]
	movaps xmmword ptr [rsp + 96], xmm0
	mov rcx, qword ptr [rax + 304]
	mov qword ptr [rsp + 48], rcx
	movzx ecx, byte ptr [rax + 328]
	mov byte ptr [rsp + 12], cl
	lea rcx, [rax + 192]
	mov qword ptr [rsp + 56], rcx
	add rax, 316
	mov qword ptr [rsp + 16], rax
	lea r14, [rsp + 528]
	xor ebp, ebp
	xor ebx, ebx
	jmp .LBB6_6
	.p2align	4
.LBB6_23:
	inc r12
	add ebp, -1000000000
.LBB6_24:
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rax], r12
	mov dword ptr [rax + 8], ebp
	#APP
	#NO_APP
	mov edx, 336
	lea rbx, [rsp + 432]
	mov rdi, rbx
	lea rsi, [rsp + 768]
	call qword ptr [rip + memcpy@GOTPCREL]
	#APP
	#NO_APP
	mov rdi, rbx
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov rbx, r12
	dec r15
	je .LBB6_67
.LBB6_6:
	lea rdi, [rsp + 336]
	mov rsi, qword ptr [rsp + 32]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	lea rdi, [rsp + 240]
	mov rsi, qword ptr [rsp + 64]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	lea rdi, [rsp + 144]
	mov rsi, qword ptr [rsp + 56]
	call <swarm::grid::Grid as core::clone::Clone>::clone
	lea r12, [rsp + 768]
	mov rcx, qword ptr [rsp + 16]
	mov eax, dword ptr [rcx + 8]
	lea rdx, [rsp + 1084]
	mov dword ptr [rdx + 8], eax
	mov rax, qword ptr [rcx]
	mov qword ptr [rdx], rax
	movups xmm0, xmmword ptr [rsp + 416]
	movaps xmmword ptr [rsp + 512], xmm0
	movups xmm0, xmmword ptr [rsp + 400]
	movaps xmmword ptr [rsp + 496], xmm0
	movups xmm0, xmmword ptr [rsp + 336]
	movups xmm1, xmmword ptr [rsp + 352]
	movups xmm2, xmmword ptr [rsp + 368]
	movups xmm3, xmmword ptr [rsp + 384]
	movaps xmmword ptr [rsp + 480], xmm3
	movaps xmmword ptr [rsp + 464], xmm2
	movaps xmmword ptr [rsp + 448], xmm1
	movaps xmmword ptr [rsp + 432], xmm0
	movups xmm0, xmmword ptr [rsp + 320]
	movups xmmword ptr [r14 + 80], xmm0
	movups xmm0, xmmword ptr [rsp + 304]
	movups xmmword ptr [r14 + 64], xmm0
	movups xmm0, xmmword ptr [rsp + 240]
	movups xmm1, xmmword ptr [rsp + 256]
	movups xmm2, xmmword ptr [rsp + 272]
	movups xmm3, xmmword ptr [rsp + 288]
	movups xmmword ptr [r14 + 48], xmm3
	movups xmmword ptr [r14 + 32], xmm2
	movups xmmword ptr [r14 + 16], xmm1
	movups xmmword ptr [r14], xmm0
	movups xmm0, xmmword ptr [rsp + 224]
	movups xmmword ptr [r14 + 176], xmm0
	movups xmm0, xmmword ptr [rsp + 208]
	movups xmmword ptr [r14 + 160], xmm0
	movups xmm0, xmmword ptr [rsp + 144]
	movups xmm1, xmmword ptr [rsp + 160]
	movups xmm2, xmmword ptr [rsp + 176]
	movups xmm3, xmmword ptr [rsp + 192]
	movups xmmword ptr [r14 + 144], xmm3
	movups xmmword ptr [r14 + 128], xmm2
	movups xmmword ptr [r14 + 112], xmm1
	movups xmmword ptr [r14 + 96], xmm0
	mov edx, 288
	mov rdi, r12
	lea rsi, [rsp + 432]
	call qword ptr [rip + memcpy@GOTPCREL]
	movaps xmm0, xmmword ptr [rsp + 96]
	movups xmmword ptr [rsp + 1056], xmm0
	mov rax, qword ptr [rsp + 48]
	mov qword ptr [rsp + 1072], rax
	movss xmm0, dword ptr [rsp + 28]
	movss dword ptr [rsp + 1080], xmm0
	movzx eax, byte ptr [rsp + 12]
	mov byte ptr [rsp + 1096], al
	#APP
	#NO_APP
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov rdi, r12
	mov r12, rax
	mov r13d, edx
	call <swarm::vicsek::Vicsek>::step
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 240], rax
	mov dword ptr [rsp + 248], edx
	mov qword ptr [rsp + 144], r12
	mov dword ptr [rsp + 152], r13d
	lea rdi, [rsp + 432]
	lea rsi, [rsp + 240]
	lea rdx, [rsp + 144]
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	movzx eax, byte ptr [rsp + 432]
	test al, al
	jne .LBB6_13
	mov r12, qword ptr [rsp + 440]
	jmp .LBB6_20
	.p2align	4
.LBB6_13:
	xor r12d, r12d
.LBB6_20:
	add r12, rbx
	jb .LBB6_25
	test al, al
	mov eax, dword ptr [rsp + 448]
	mov ecx, 0
	cmovne eax, ecx
	add ebp, eax
	cmp ebp, 1000000000
	jb .LBB6_24
	cmp r12, -1
	jne .LBB6_23
.LBB6_25:
	lea rdi, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.691]
	lea rdx, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.692]
	mov esi, 30
	call core::option::expect_failed
	jmp .LBB6_26
.LBB6_2:
	shr qword ptr [rsp + 80], 4
	lea rbx, [rsp + 528]
	mov rax, qword ptr [rsp + 32]
	movss xmm0, dword ptr [rax + 312]
	movss dword ptr [rsp + 28], xmm0
	lea rcx, [rax + 96]
	mov qword ptr [rsp + 64], rcx
	movups xmm0, xmmword ptr [rax + 288]
	movaps xmmword ptr [rsp + 96], xmm0
	mov rcx, qword ptr [rax + 304]
	mov qword ptr [rsp + 48], rcx
	movzx ebp, byte ptr [rax + 328]
	lea rcx, [rax + 192]
	mov qword ptr [rsp + 56], rcx
	lea r14, [rax + 316]
	xor ecx, ecx
	mov qword ptr [rsp + 88], 0
	xor edx, edx
	mov qword ptr [rsp + 120], r15
	jmp .LBB6_3
	.p2align	4
.LBB6_66:
	mov rdx, qword ptr [rsp + 128]
	add rdx, r13
	mov r15, qword ptr [rsp + 120]
	cmp rdx, r15
	mov ecx, dword ptr [rsp + 12]
	jae .LBB6_67
.LBB6_3:
	mov r13, r15
	sub r13, rdx
	mov rax, qword ptr [rsp + 80]
	cmp r13, rax
	cmovae r13, rax
	cmp r15, rdx
	mov dword ptr [rsp + 12], ecx
	mov qword ptr [rsp + 128], rdx
	jne .LBB6_30
	mov r15d, 8
	xor eax, eax
	jmp .LBB6_31
	.p2align	4
.LBB6_30:
	imul r12, r13, 336
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	mov r15, rax
	mov rax, r13
	test r15, r15
	je .LBB6_71
.LBB6_31:
	mov qword ptr [rsp + 336], rax
	mov qword ptr [rsp + 344], r15
	add r15, 328
	xor r12d, r12d
	.p2align	4
.LBB6_32:
	lea rdi, [rsp + 240]
	mov rsi, qword ptr [rsp + 32]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	lea rdi, [rsp + 144]
	mov rsi, qword ptr [rsp + 64]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	lea rdi, [rsp + 768]
	mov rsi, qword ptr [rsp + 56]
	call <swarm::grid::Grid as core::clone::Clone>::clone
	inc r12
	movups xmm0, xmmword ptr [rsp + 320]
	movaps xmmword ptr [rsp + 512], xmm0
	movups xmm0, xmmword ptr [rsp + 304]
	movaps xmmword ptr [rsp + 496], xmm0
	movups xmm0, xmmword ptr [rsp + 240]
	movups xmm1, xmmword ptr [rsp + 256]
	movups xmm2, xmmword ptr [rsp + 272]
	movups xmm3, xmmword ptr [rsp + 288]
	movaps xmmword ptr [rsp + 480], xmm3
	movaps xmmword ptr [rsp + 464], xmm2
	movaps xmmword ptr [rsp + 448], xmm1
	movaps xmmword ptr [rsp + 432], xmm0
	movups xmm0, xmmword ptr [rsp + 224]
	movups xmmword ptr [rbx + 80], xmm0
	movups xmm0, xmmword ptr [rsp + 208]
	movups xmmword ptr [rbx + 64], xmm0
	movups xmm0, xmmword ptr [rsp + 144]
	movups xmm1, xmmword ptr [rsp + 160]
	movups xmm2, xmmword ptr [rsp + 176]
	movups xmm3, xmmword ptr [rsp + 192]
	movups xmmword ptr [rbx + 48], xmm3
	movups xmmword ptr [rbx + 32], xmm2
	movups xmmword ptr [rbx + 16], xmm1
	movups xmmword ptr [rbx], xmm0
	movups xmm0, xmmword ptr [rsp + 848]
	movups xmmword ptr [rbx + 176], xmm0
	movups xmm0, xmmword ptr [rsp + 832]
	movups xmmword ptr [rbx + 160], xmm0
	movups xmm0, xmmword ptr [rsp + 768]
	movups xmm1, xmmword ptr [rsp + 784]
	movups xmm2, xmmword ptr [rsp + 800]
	movups xmm3, xmmword ptr [rsp + 816]
	movups xmmword ptr [rbx + 144], xmm3
	movups xmmword ptr [rbx + 128], xmm2
	movups xmmword ptr [rbx + 112], xmm1
	movups xmmword ptr [rbx + 96], xmm0
	lea rdi, [r15 - 328]
	mov edx, 288
	lea rsi, [rsp + 432]
	call qword ptr [rip + memcpy@GOTPCREL]
	movaps xmm0, xmmword ptr [rsp + 96]
	movups xmmword ptr [r15 - 40], xmm0
	mov rax, qword ptr [rsp + 48]
	mov qword ptr [r15 - 24], rax
	movss xmm0, dword ptr [rsp + 28]
	movss dword ptr [r15 - 16], xmm0
	mov rax, qword ptr [r14]
	mov qword ptr [r15 - 12], rax
	mov eax, dword ptr [r14 + 8]
	mov dword ptr [r15 - 4], eax
	mov byte ptr [r15], bpl
	add r15, 336
	cmp r13, r12
	jne .LBB6_32
	movups xmm0, xmmword ptr [rsp + 336]
	movaps xmmword ptr [rsp + 768], xmm0
	mov qword ptr [rsp + 784], r13
	lea rax, [rsp + 768]
	#APP
	#NO_APP
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 136], rax
	mov dword ptr [rsp + 76], edx
	mov rax, qword ptr [rsp + 784]
	mov qword ptr [rsp + 16], rax
	test rax, rax
	je .LBB6_41
	mov r12, qword ptr [rsp + 776]
	mov r15, qword ptr [rsp + 16]
	.p2align	4
.LBB6_39:
	mov rdi, r12
	call <swarm::vicsek::Vicsek>::step
	add r12, 336
	dec r15
	jne .LBB6_39
.LBB6_41:
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 240], rax
	mov dword ptr [rsp + 248], edx
	mov rax, qword ptr [rsp + 136]
	mov qword ptr [rsp + 144], rax
	mov eax, dword ptr [rsp + 76]
	mov dword ptr [rsp + 152], eax
	lea rdi, [rsp + 432]
	lea rsi, [rsp + 240]
	lea rdx, [rsp + 144]
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	movzx eax, byte ptr [rsp + 432]
	test al, al
	jne .LBB6_44
	mov rcx, qword ptr [rsp + 440]
	jmp .LBB6_57
	.p2align	4
.LBB6_44:
	xor ecx, ecx
.LBB6_57:
	mov rdx, qword ptr [rsp + 88]
	add rdx, rcx
	jb .LBB6_68
	test al, al
	mov eax, dword ptr [rsp + 448]
	mov ecx, 0
	cmovne eax, ecx
	mov ecx, dword ptr [rsp + 12]
	add ecx, eax
	cmp ecx, 1000000000
	jb .LBB6_61
	cmp rdx, -1
	je .LBB6_68
	inc rdx
	add ecx, -1000000000
.LBB6_61:
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 88], rdx
	mov qword ptr [rax], rdx
	mov dword ptr [rsp + 12], ecx
	mov dword ptr [rax + 8], ecx
	mov qword ptr [rsp + 432], 0
	mov qword ptr [rsp + 440], 1
	mov rax, qword ptr [rsp + 16]
	mov qword ptr [rsp + 448], rax
	lea rax, [rsp + 432]
	#APP
	#NO_APP
	mov rax, qword ptr [rsp + 776]
	mov qword ptr [rsp + 16], rax
	mov r15, qword ptr [rsp + 784]
	test r15, r15
	je .LBB6_64
	mov r12, qword ptr [rsp + 16]
	.p2align	4
.LBB6_63:
	mov rdi, r12
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	add r12, 336
	dec r15
	jne .LBB6_63
.LBB6_64:
	cmp qword ptr [rsp + 768], 0
	je .LBB6_66
	mov rdi, qword ptr [rsp + 16]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB6_66
.LBB6_67:
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 144], rax
	mov dword ptr [rsp + 152], edx
	mov rax, qword ptr [rsp + 112]
	mov qword ptr [rsp + 768], rax
	mov eax, dword ptr [rsp + 72]
	mov dword ptr [rsp + 776], eax
	lea rdi, [rsp + 432]
	lea rsi, [rsp + 144]
	lea rdx, [rsp + 768]
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	xor eax, eax
	cmp byte ptr [rsp + 432], 0
	mov ecx, dword ptr [rsp + 448]
	cmovne ecx, eax
	cmove rax, qword ptr [rsp + 440]
	mov rdx, qword ptr [rsp + 40]
	mov qword ptr [rdx + 16], rax
	mov dword ptr [rdx + 24], ecx
	add rsp, 1112
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
.LBB6_68:
	.cfi_def_cfa_offset 1168
	lea rdi, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.691]
	lea rdx, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.692]
	mov esi, 30
	call core::option::expect_failed
.LBB6_26:
	ud2
.LBB6_70:
	lea rdi, [rip + .Lanon.c430ce33a94608f4541cbd7c9bf04936.6]
	lea rdx, [rip + .Lanon.c430ce33a94608f4541cbd7c9bf04936.8]
	mov esi, 57
	call core::panicking::panic_fmt
.LBB6_71:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB6_53
	mov rbx, rax
	lea rdi, [rsp + 336]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	lea rdi, [rsp + 240]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	lea rdi, [rsp + 336]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	mov rdi, rbx
	call _Unwind_Resume@PLT
	jmp .LBB6_29
	jmp .LBB6_29
	jmp .LBB6_53
	jmp .LBB6_29
	jmp .LBB6_53
	mov rbx, rax
	lea rdi, [rsp + 144]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	jmp .LBB6_46
	mov rbx, rax
	jmp .LBB6_49
	mov rbx, rax
.LBB6_46:
	lea rdi, [rsp + 240]
	call core::ptr::drop_glue::<swarm::flock::Boids>
.LBB6_49:
	mov qword ptr [rsp + 352], r12
	lea rdi, [rsp + 336]
	call core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB6_53:
	mov rbx, rax
	lea rdi, [rsp + 768]
	call core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB6_29:
	mov rbx, rax
	lea rdi, [rsp + 768]
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov rdi, rbx
	call _Unwind_Resume@PLT
