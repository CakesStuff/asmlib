bits 64

%include "syscall.inc"
%define PROT_READ 0x1
%define PROT_WRITE 0x2
%define MAP_PRIVATE 0x02
%define MAP_ANONYMOUS 0x20
%define ARCH_SET_FS 0x1002

global LIB_VERSION
LIB_VERSION equ 0x009

section .text
global _start
extern main
extern TLS_SIZE
extern __errno_location
extern __this_thread_location
extern __tls_ptr_location
extern malloc

_start:
    mov rdi, [rsp]
    mov rsi, rsp
    add rsi, 8
    push rdi
    push rsi

    mov rdi, TLS_SIZE
    call malloc

    mov rsi, rax
    mov rax, SYS_arch_prctl
    mov rdi, ARCH_SET_FS
    syscall

    call __errno_location
    mov QWORD [rax], -1
    call __this_thread_location
    mov QWORD [rax], 0
    call __tls_ptr_location
    mov QWORD [rax], 0

    pop rsi
    pop rdi

    call main

    mov rdi, rax
    mov rax, SYS_exit_group
    syscall