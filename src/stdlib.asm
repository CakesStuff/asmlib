bits 64

section .text
global atoi
atoi:
    mov rsi, 0
    mov rax, 0
.loop:
    cmp BYTE [rdi], 0
    je .retz

    cmp BYTE [rdi], ' '
    jne .next

    add rdi, 1
    jmp .loop

.next:
    cmp BYTE [rdi], '+'
    jne .next2

    add rdi, 1
    jmp .parse

.next2:
    cmp BYTE [rdi], '-'
    jne .parse

    mov rsi, 1
    add rdi, 1
    jmp .parse

.retz:
    mov rax, 0
    ret

.parse:
    mov rdx, 0
    mov dl, BYTE [rdi]
    cmp dl, '0'
    jl .retn
    cmp dl, '9'
    jg .retn
    
    mov rcx, rax
    shl rax, 2
    add rax, rcx
    shl rax, 1

    sub dl, '0'
    add rax, rdx
    add rdi, 1
    jmp .parse

.retn:
    cmp rsi, 1
    je .negative
    ret
.negative:
    mov rsi, rax
    sub rax, rsi
    sub rax, rsi
    ret

global atol
atol:
    call atoi
    ret