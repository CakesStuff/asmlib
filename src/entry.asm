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

_start:
    mov rdi, [rsp]
    mov rsi, rsp
    add rsi, 8
    push rdi
    push rsi

    mov rax, SYS_mmap
    mov rdi, 0
    mov rsi, TLS_SIZE
    mov rdx, PROT_READ
    or rdx, PROT_WRITE
    mov r10, MAP_ANONYMOUS
    or r10, MAP_PRIVATE
    mov r8, -1
    mov r9, 0
    syscall

    mov rsi, rax
    mov rax, SYS_arch_prctl
    mov rdi, ARCH_SET_FS
    syscall

    call __errno_location
    mov QWORD [rax], -1

    pop rsi
    pop rdi

    call main

    mov rdi, rax
    mov rax, SYS_exit
    syscall