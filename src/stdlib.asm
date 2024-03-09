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
    jne .retz

    mov rsi, 1
    add rdi, 1
    jmp .parse

.retz:
    mov rax, 0
    ret

.parse:
    cmp BYTE [rdi], 0
    je .retn

    mov rdx, rax
    shl rax, 2
    add rax, rdx
    shl rax, 1

    mov rdx, 0
    mov dl, BYTE [rdi]
    cmp dl, '0'
    jl .retn
    cmp dl, '9'
    jg .retn

    add rax, rdx
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