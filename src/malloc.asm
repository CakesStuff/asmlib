bits 64

%include "syscall.inc"

; Based on alloy_malloc by tay10r on stackexchange

%define MAGIC_NUM 299792458

extern memcpy

section .data
header:
.magic_num: dq 0
.allocations: dq 0
.allocation_count: dq 0
.heap_size: dq 0
.heap_addr: dq 0

section .text
single_bubblesort:
    enter $24, $0
    %define allocations QWORD [rbp - 8]
    %define allocation_count QWORD [rbp - 16]
    %define sorted QWORD [rbp - 24]

    mov allocations, rdi
    mov allocation_count, rsi
    add allocation_count, -1
    mov sorted, 0

    mov rax, 0
.for:
    cmp rax, allocation_count
    je .end

    mov rdi, allocations
    mov rsi, rdi
    add rsi, 16
    shl rax, 4
    add rsi, rax
    add rdi, rax
    shr rax, 4
    mov rdx, QWORD [rdi]
    cmp rdx, QWORD [rsi]
    ja .greater

    add rax, 1
    jmp .for

.greater:
    mov r10, QWORD [rsi]
    mov QWORD [rsi], rdx
    mov QWORD [rdi], r10
    add rsi, 8
    add rdi, 8
    mov rdx, QWORD [rdi]
    mov r10, QWORD [rsi]
    mov QWORD [rsi], rdx
    mov QWORD [rdi], r10

    mov sorted, 1
    add rax, 1
    jmp .for

.end:
    mov rax, sorted

    %undef allocations
    %undef allocation_count
    %undef sorted
    leave
    ret

sort_allocations:
    cmp QWORD [header.magic_num], MAGIC_NUM
    je .continue
    ret
.continue:
    mov rdi, QWORD [header.allocations]
    mov rsi, QWORD [header.allocation_count]
    call single_bubblesort
    cmp rax, 1
    je .continue
    ret

find_space_for:
    enter $8, $0
    %define size QWORD [rbp - 8]

    mov size, rdi

    cmp QWORD [header.magic_num], MAGIC_NUM
    je .next

    mov rax, size;because size is subtracted later
    jmp .end

.next:
    mov rax, QWORD [header.heap_addr]
    mov rdi, 0
    sub rax, size
.for:
    add rax, size
    cmp rdi, QWORD [header.allocation_count]
    je .while

    mov rsi, QWORD [header.allocations]
    shl rdi, 4
    add rsi, rdi
    shr rdi, 4
    mov r10, rsi
    mov rsi, [rsi]
    add rax, size
    cmp rax, rsi
    jbe .while

    mov rax, rsi
    mov rsi, r10
    add rsi, 8
    add rax, [rsi]
    add rdi, 1
    jmp .for

.while:
    mov rdi, QWORD [header.heap_addr]
    add rdi, QWORD [header.heap_size]
    cmp rax, rdi
    jbe .end

    mov rdi, QWORD [header.heap_size]
    shl rdi, 1
    mov QWORD [header.heap_size], rdi
    add rdi, QWORD [header.heap_addr]
    push rax
    mov rax, SYS_brk
    syscall
    pop rax
    jmp .while

.end:
    sub rax, size
    %undef size
    leave
    ret

binary_search:
    enter $32, $0
    %define allocations QWORD [rbp - 8]
    %define left_index QWORD [rbp - 16]
    %define right_index QWORD [rbp - 24]
    %define addr QWORD [rbp - 32]

    mov allocations, rdi
    mov left_index, rsi
    mov right_index, rdx
    mov addr, rcx

.while:
    mov rax, right_index
    cmp rax, left_index
    jl .next

    sub rax, left_index
    shr rax, 1
    add rax, left_index

    mov rdi, rax
    shl rax, 4
    add rax, allocations
    mov rsi, addr
    cmp QWORD [rax], rsi
    ja .else
    jb .else_if
    jmp .end

.else_if:
    add rdi, 1
    mov left_index, rdi
    jmp .while
.else:
    sub rdi, 1
    mov right_index, rdi
    jmp .while

.next:
    mov rax, 0
.end:
    %undef allocations
    %undef left_index
    %undef right_index
    %undef addr
    leave
    ret
    
find_allocation:
    cmp rdi, 0
    jne .next
    mov rax, 0
    ret
.next:
    mov rax, QWORD [header.magic_num];
    cmp rax, MAGIC_NUM
    je .next2
    mov rax, 0
    ret
.next2:
    mov rcx, rdi
    mov rdi, QWORD [header.allocations]
    mov rsi, 0
    mov rdx, QWORD [header.allocation_count]
    call binary_search
    ret

create_allocation:
    enter $16, $0
    %define next_allocations_size QWORD [rbp - 8]
    %define next_allocations QWORD [rbp - 16]

    mov rax, QWORD [header.magic_num]
    cmp rax, MAGIC_NUM
    je .next
    mov rax, 0
    jmp .end

.next:
    mov rax, QWORD [header.allocation_count]
    add rax, 1
    shl rax, 4
    mov next_allocations_size, rax

    mov rdi, rax
    call find_space_for
    mov next_allocations, rax

    mov rdi, QWORD [header.allocations]
    call find_allocation
    mov rdi, next_allocations
    mov QWORD [rax], rdi
    mov rdi, next_allocations_size
    add rax, 8
    mov QWORD [rax], rdi
    call sort_allocations

    mov rdi, next_allocations
    mov rsi, QWORD [header.allocations]
    mov rdx, next_allocations_size
    call memcpy

    mov QWORD [header.allocations], rax
    add QWORD [header.allocation_count], 1

    mov rdi, QWORD [header.allocation_count]
    sub rdi, 1
    shl rdi, 4
    add rax, rdi
    mov QWORD [rax], -1
.end:
    %undef next_allocations_size
    %undef next_allocations
    leave
    ret

remove_invalid_allocation_if_present:
    mov rax, QWORD [header.magic_num]
    cmp rax, MAGIC_NUM
    je .next
    ret
.next:
    mov rax, QWORD [header.allocation_count]
    cmp rax, 0
    jg .next2
    ret
.next2:
    sub rax, 1
    shl rax, 4
    add rax, QWORD [header.allocations]
    cmp QWORD [rax], -1
    jne .end
    sub QWORD [header.allocation_count], 1
.end:
    ret

init_heap:
    mov rax, SYS_brk
    mov rdi, 0
    syscall

    mov QWORD [header.heap_addr], rax

    mov QWORD [header.heap_size], (128 * 4096)

    mov rdi, rax
    add rdi, QWORD [header.heap_size]
    mov rax, SYS_brk
    syscall

    mov rax, QWORD [header.heap_addr]
    mov QWORD [rax], rax
    add rax, 8
    mov QWORD [rax], 16

    mov QWORD [header.magic_num], MAGIC_NUM
    mov rax, QWORD [header.heap_addr]
    mov QWORD [header.allocations], rax
    mov QWORD [header.allocation_count], 1
    ret

global malloc
malloc:
    cmp rdi, 0
    je .retz

    mov rsi, rdi
    mov rdi, 0
    call realloc
    ret
.retz:
    mov rax, 0
    ret

global realloc
realloc:
    cmp rsi, 0
    jne .start

    call free
    mov rax, 0
    ret

.start:
    enter $40, $0
    %define ptr QWORD [rbp - 8]
    %define size QWORD [rbp - 16]
    %define dst_entry QWORD [rbp - 24]
    %define existing_entry QWORD [rbp - 32]
    %define next_addr QWORD [rbp - 40]

    mov ptr, rdi
    mov size, rsi

    mov rax, QWORD [header.magic_num]
    cmp rax, MAGIC_NUM
    je .next
    call init_heap
.next:
    mov dst_entry, 0
    mov rdi, ptr
    call find_allocation
    mov existing_entry, rax
    cmp rax, 0
    jne .next2
    
    call create_allocation

.next2:
    mov dst_entry, rax

    mov rax, size
    add rax, 15
    shr rax, 4
    shl rax, 4
    mov size, rax

    mov rdi, rax
    call find_space_for
    mov next_addr, rax

    cmp rax, 0
    jne .next3
    
    call remove_invalid_allocation_if_present
    mov rax, 0
    jmp .end

.next3:
    cmp existing_entry, 0
    je .next4

    mov rdi, next_addr
    mov rsi, existing_entry
    mov rdx, rsi
    mov rsi, [rsi]
    add rdx, 8
    mov rdx, [rdx]
    call memcpy

.next4:
    mov rax, dst_entry
    mov rdi, next_addr
    mov QWORD [rax], rdi
    add rax, 8
    mov rdi, size
    mov QWORD [rax], rdi

    call sort_allocations

    mov rax, next_addr

.end:
    %undef ptr
    %undef size
    %undef dst_entry
    %undef existing_entry
    %undef next_addr
    leave
    ret

global free
free:
    mov rax, QWORD [header.magic_num]
    cmp rax, MAGIC_NUM
    je .next
    ret

.next:
    call find_allocation
    cmp rax, 0
    jne .next2
    ret

.next2:
    mov QWORD [rax], -1
    call sort_allocations
    sub QWORD [header.allocation_count], 1

.while:
    mov rax, QWORD [header.allocation_count]
    sub rax, 1
    shl rax, 4
    add rax, QWORD [header.allocations]
    mov rdi, rax
    mov rax, QWORD [rax]
    add rdi, 8
    add rax, QWORD [rdi]
    sub rax, QWORD [header.heap_addr]
    shl rax, 2
    cmp rax, QWORD [header.heap_size]
    jae .end

    mov rax, QWORD [header.heap_size]
    shr rax, 1
    mov QWORD [header.heap_size], rax
    add rax, QWORD [header.heap_addr]
    mov rdi, rax
    mov rax, SYS_brk
    syscall
    jmp .while

.end:
    ret