%include "syscall.inc"
%include "clone.inc"
%include "futex.inc"
%include "errno.inc"

global TLS_SIZE

TLS_ERRNO_OFFSET equ 0;8
TLS_THIS_THREAD_OFFSET equ 8;8
TLS_PROG_PTR_OFFSET equ 16;8
TLS_SIZE equ (8 + 8 + 8)

struc thread
    .tid: resq 1
    .lock: resq 1
    .stack: resq 1
    .stack_size: resq 1
    .retval: resq 1
endstruc

global __errno_location
__errno_location:
    rdfsbase rax
    add rax, TLS_ERRNO_OFFSET
    ret

global __tls_ptr_location
__tls_ptr_location:
    rdfsbase rax
    add rax, TLS_PROG_PTR_OFFSET
    ret

global __this_thread_location
__this_thread_location:
    rdfsbase rax
    add rax, TLS_THIS_THREAD_OFFSET
    ret

%define stack_size_default 0x10000000
%define stack_size_min 0x10000
THREAD_JOIN_VALUE equ 42
extern malloc
extern free

global thread_exit
thread_exit:
    call __this_thread_location
    cmp QWORD [rax], 0
    je .main

    mov rax, rdi
    jmp thread_create.child_exit

.main:
    mov rax, SYS_exit_group
    syscall

global thread_join
thread_join:
    call __this_thread_location
    cmp QWORD [rax], rdi
    je .err

    push rdi
    add rdi, thread.lock
    mov rsi, FUTEX_WAIT
    mov rdx, THREAD_JOIN_VALUE
    mov r10, 0
    mov rax, SYS_futex
    syscall

    pop rdi
    push rdi
    add rdi, thread.lock
    mov rsi, FUTEX_WAKE
    mov rdx, 1
    mov r10, 0
    mov rax, SYS_futex
    syscall

    pop rax
    mov rax, QWORD [rax+thread.retval]
    ret

.err:
    call __errno_location
    mov QWORD [rax], EDEADLK
    mov rax, -1
    ret

global thread_join_multiple
thread_join_multiple:
    cmp rsi, 0
    je .end

    push rdi
    push rsi
    mov rdi, QWORD [rdi]
    call thread_join
    pop rsi
    sub rsi, 1
    pop rdi
    add rdi, 8
    jmp thread_join_multiple
.end:
    ret

global thread_create
thread_create:;QWORD thread_pointer thread_create(QWORD stack_size, QWORD thread_func, QWORD thread_arg)
    cmp rdi, 0;stack_size == 0
    jne .check_stack_size

    mov rdi, stack_size_default;stack_size = stack_size_default
.check_stack_size:
    cmp rdi, stack_size_min;stack_size >= stack_size_min
    jae .got_stack_size

    call __errno_location
    mov QWORD [rax], EINVAL
    mov rax, 0
    ret
.got_stack_size:
    push rsi;thread_func
    push rdx;thread_arg
    push rdi;stack_size

    mov rdi, thread_size
    call malloc

    pop rdi;stack_size
    mov QWORD [rax+thread.stack_size], rdi
    push rax;thread_location

    mov rsi, rdi
    mov rdi, 0
    mov rdx, 0x3;(PROT_READ|PROT_WRITE)
    mov r10, 0x22;(MAP_PRIVATE|MAP_ANONYMOUS)
    mov r8, -1
    mov r9, 0
    mov rax, SYS_mmap
    syscall

    mov rdi, rax;stack_location
    pop rax;thread_location
    mov QWORD [rax+thread.stack], rdi
    add rdi, QWORD [rax+thread.stack_size]
    sub rdi, 8
    pop rsi;thread_arg
    mov QWORD [rdi], rsi
    pop rsi;thread_func
    sub rdi, 8
    mov QWORD [rdi], rsi
    sub rdi, 8
    mov QWORD [rdi], rax
    push rax;thread_location

    push rax;thread_location
    push rdi;stack_for_thread

    mov rdi, TLS_SIZE
    call malloc

    mov r8, rax
    pop rsi
    pop rdx
    mov r10, rdx
    add rdx, thread.tid
    add r10, thread.lock
    mov QWORD [r10], THREAD_JOIN_VALUE
    mov rdi, (CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID)
    mov rax, SYS_clone
    syscall

    cmp rax, 0
    jne .parent

    call __errno_location
    mov QWORD [rax], -1

    pop rdi;thread_location
    call __this_thread_location
    mov QWORD [rax], rdi
    pop rax;thread_func
    pop rdi;thread_arg
    call rax
.child_exit:
    mov rdi, rax
    call __this_thread_location
    mov rax, QWORD [rax]
    mov QWORD [rax+thread.retval], rdi
    mov r12, rdi
    push rax

    rdfsbase rdi
    call free

    pop rax
    mov rdi, QWORD [rax+thread.stack]
    mov rsi, QWORD [rax+thread.stack_size]
    mov rax, SYS_munmap
    syscall

    mov rdi, r12
    mov rax, SYS_exit
    syscall
.parent:
    pop rax
    ret

global thread_destroy
thread_destroy:
    mov rax, QWORD [rdi+thread.lock]
    cmp rax, 0
    jne .not_finished

    call free
    mov rax, 1
    ret

.not_finished:
    mov rax, 0
    ret