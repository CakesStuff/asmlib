bits 64
%include "syscall.inc"

stdin equ 0
stdout equ 1
stderr equ 2

extern strlen

section .data
newline: db 0x0A

section .text
global puts
puts:
    enter $8, $0
    %define str QWORD [rbp - 8]

    mov str, rdi
    call strlen

    mov rsi, str
    mov edx, eax
    mov rax, SYS_write
    mov rdi, stdout
    syscall

    mov rax, SYS_write
    mov rdi, stdout
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 0
    %undef str
    leave
    ret

global putchar
putchar:
    enter $1, $0
    %define c BYTE [rbp - 1]

    mov c, dil
    mov rax, SYS_write
    mov rdi, stdout
    mov rsi, rbp
    add rsi, -1
    mov rdx, 1
    syscall

    mov rax, 0
    %undef c
    leave
    ret

section .data
hexChars: db "0123456789ABCDEF"

section .text
printf_unsigned:
    enter $56, $0
    %define pos DWORD [rbp - 24]
    %define number QWORD [rbp - 16]
    %define radix QWORD [rbp - 8]

    mov pos, 0
    mov number, rdi
    mov radix, rsi

.while:
    mov rax, number
    mov rdx, 0
    div radix
    
    mov number, rax
    mov rax, hexChars
    add rax, rdx
    mov al, BYTE [rax]
    mov rdx, rbp
    add rdx, -56
    mov rsi, 0
    mov esi, pos
    add rdx, rsi
    mov BYTE [rdx], al
    mov edx, pos
    add edx, 1
    mov pos, edx

    mov rax, number
    cmp rax, 0
    jg .while

.loop:
    mov eax, pos
    add eax, -1
    cmp eax, 0
    jl .done
    mov pos, eax
    add rax, rbp
    add rax, -56
    mov dil, BYTE [rax]
    call putchar
    jmp .loop

.done:
    mov rax, 0
    %undef pos
    %undef number
    %undef radix
    leave
    ret

printf_signed:
    cmp rdi, 0
    jge .else
    push rsi
    push rdi
    mov dil, '-'
    call putchar
    pop rdx
    pop rsi
    mov rdi, 0
    sub rdi, rdx
.else:
    call printf_unsigned
    mov rax, 0
    ret

%define PRINTF_STATE_NORMAL 0
%define PRINTF_STATE_SPEC 1

global printf
printf:
    %define argsize 56
    enter argsize, $0
    %define va_list QWORD [rbp - 8]
    %define va_index QWORD [rbp - 16]
    %define state DWORD [rbp - 24]
    %define radix QWORD [rbp - 32]
    %define sign DWORD [rbp - 40]
    %define number DWORD [rbp - 48]
    %define fmt QWORD [rbp - 56]

    mov va_list, rsp
    add va_list, 16 + argsize
    mov va_index, 0
    mov state, PRINTF_STATE_NORMAL
    mov radix, 10
    mov sign, 0
    mov number, 0
    mov fmt, rdi

.while:
    mov rdi, fmt
    cmp BYTE [rdi], 0
    je .done

    cmp state, PRINTF_STATE_NORMAL
    jne .spec

    cmp BYTE [rdi], '%'
    jne .default1

    mov state, PRINTF_STATE_SPEC
    jmp .continue

.default1:
    mov dil, [rdi]
    call putchar
    jmp .continue

.spec:
    mov rdi, fmt
    cmp BYTE [rdi], 'c'
    jne .next

    mov rdi, va_list
    add rdi, va_index
    mov dil, BYTE [rdi]
    call putchar
    mov rdi, va_index
    add rdi, 8
    mov va_index, rdi
    jmp .spec_after

.next:
    cmp BYTE [rdi], 's'
    jne .next2

    mov rdi, va_list
    add rdi, va_index
    mov rdi, [rdi]
    push rdi
    call strlen
    pop rsi
    mov rdx, rax
    mov rax, SYS_write
    mov rdi, stdout
    syscall
    mov rdi, va_index
    add rdi, 8
    mov va_index, rdi
    jmp .spec_after

.next2:
    cmp BYTE [rdi], '%'
    jne .next3

    mov dil, '%'
    call putchar
    jmp .spec_after

.next3:
    cmp BYTE [rdi], 'd'
    jne .next4

    mov radix, 10
    mov sign, 1
    mov number, 1
    jmp .spec_after

.next4:
    cmp BYTE [rdi], 'u'
    jne .next5

    mov radix, 10
    mov sign, 0
    mov number, 1
    jmp .spec_after

.next5:
    cmp BYTE [rdi], 'x'
    jne .next6

    mov radix, 16
    mov sign, 0
    mov number, 1
    jmp .spec_after

.next6:
    cmp BYTE [rdi], 'o'
    jne .default2

    mov radix, 8
    mov sign, 0
    mov number, 1
    jmp .spec_after

.default2:
.spec_after:
    cmp number, 0
    je .spec_end

    mov rdi, va_list
    add rdi, va_index
    mov rdi, [rdi]
    mov rsi, radix
    cmp sign, 0
    je .unsigned
    call printf_signed
    jmp .sign_end
.unsigned:
    call printf_unsigned
.sign_end:
    mov rdi, va_index
    add rdi, 8
    mov va_index, rdi

.spec_end:
    mov state, PRINTF_STATE_NORMAL
    mov radix, 10
    mov sign, 0
    mov number, 0

.continue:
    mov rdi, fmt
    add rdi, 1
    mov fmt, rdi
    jmp .while

.done:
    mov rax, 0
    mov rdi, va_index

    %undef va_list
    %undef va_index
    %undef state
    %undef radix
    %undef sign
    %undef number
    %undef fmt
    %undef argsize
    leave
    pop rsi
    add rsp, rdi
    push rsi
    ret