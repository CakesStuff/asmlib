%include "syscall.inc"
%include "thread.inc"
%include "errno.inc"

%macro nsysc 1
global %1
%1:
    mov rax, SYS_%1
    mov r10, rcx
    syscall

    cmp rax, 0
    jl .err
    ret

.err:
    mov rdi, rax
    call __errno_location
    mov QWORD [rax], 0
    sub QWORD [rax], rdi
    mov rax, -1
    ret
%endmacro

global syscall
syscall:
    mov rax, rdi
    mov rdi, rsi
    mov rsi, rdx
    mov rdx, rcx
    mov r10, r8
    mov r8, r9
    mov r9, QWORD [rsp + 8]
    syscall
    ;No errno because different system calls have different errno behaviour
    ret

global exit
exit:
    mov rax, SYS_exit_group
    syscall

global _exit
_exit:
    mov rax, SYS_exit
    syscall

nsysc read
nsysc write