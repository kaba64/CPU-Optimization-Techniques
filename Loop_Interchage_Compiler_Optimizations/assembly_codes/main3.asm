	.file	"main.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\n"
#NO_APP
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2538:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-65536(%rsp), %r11
	.cfi_def_cfa 11, 65584
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$16, %rsp
	.cfi_def_cfa_offset 65600
	movdqa	.LC0(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 65544(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	leaq	512(%rsp), %rbx
	leaq	66048(%rsp), %r12
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rdx, %rsi
	movq	%rcx, %rax
	subq	%rcx, %rsi
	andl	$16, %esi
	je	.L3
	leaq	16(%rcx), %rax
	movaps	%xmm0, (%rcx)
	cmpq	%rdx, %rax
	je	.L22
	.p2align 4,,10
	.p2align 3
.L3:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L3
.L22:
	leaq	512(%rax), %rdx
	addq	$512, %rcx
	cmpq	%r12, %rdx
	jne	.L2
	movl	2580(%rsp), %esi
	leaq	_ZSt4cout(%rip), %r14
	leaq	.LC1(%rip), %r13
	movq	%r14, %rdi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movdqa	.LC2(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rdx
	movq	%rbp, %rax
	subq	%rbp, %rdx
	andl	$16, %edx
	je	.L6
	leaq	16(%rbp), %rax
	movaps	%xmm0, 0(%rbp)
	cmpq	%rax, %rbx
	je	.L21
	.p2align 4,,10
	.p2align 3
.L6:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%rax, %rbx
	jne	.L6
.L21:
	addq	$512, %rbx
	addq	$512, %rbp
	cmpq	%r12, %rbx
	jne	.L5
	movl	4128(%rsp), %esi
	movq	%r14, %rdi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	65544(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L25
	addq	$65552, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE2538:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 13.1.0-8ubuntu1~22.04) 13.1.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
