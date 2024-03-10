# Changelog

## v0.07 *(stable)*

Added:
1. Stability display and changed order of version numbers.
1. strchr in [string.asm](src/string.asm)

## v0.06 *(stable)*

Fixed display of errno 0 and added this [changelog](changelog.md)

## v0.05 *(faulty)*

*Bugs:*
- *errno 0 is displayed incorrectly*

Fixed perror (errno was not inverted) and forgot NULL terminators for the errno strings.

## v0.04 *(unstable)*

*Bugs:*
- *errno is not inverted,  strerror strings are not **NULL** terminated and errno 0 was displayed incorrectly*

Added:
1. [errno.inc](src/errno.inc) with errno constants
1. [errno.asm](src/errno.asm) with strerror (would usually be in string.*) and perror with all strings needed

## v0.03 *(stable)*

added strtok in [string.asm](src/string.asm) and some more constants in [socket.inc](src/socket.inc)

## v0.02 *(stable)*

Just a fix for atoi

## v0.01 *(unstable)*

*Bugs:*
- *atoi does not work*

First commit with versions.  
Included:  
1. [Stats file](stats.txt) with section sizes and version number in the [Makefile](Makefile)
1. [syscall.inc](src/syscall.inc) with constants for all system calls
1. [entry.asm](src/entry.asm) with the entry point that calls main with argc and argv
1. [string.inc](src/string.inc)/[string.asm](src/string.asm) with strlen and strcmp
1. [stdlib.inc](src/stdlib.inc)/[stdlib.asm](src/stdlib.asm) with atoi
1. [stdio.inc](src/stdio.inc)/[stdio.asm](src/stdio.asm) with puts, putchar and printf
1. [socket.inc](src/socket.inc) with a few socket constants
1. [signal.inc](src/signal.inc) with all signal constants
1. [select.inc](src/select.inc) with FD_SETSIZE
1. [reg.inc](src/reg.inc) with the offsets needed for ptrace PEEK_USER
1. [ptrace.inc](src/ptrace.inc) with some ptrace constants
1. [memory.inc](src/memory.inc)/[memory.asm](src/memory.asm) with memcpy
1. [malloc.inc](src/malloc.inc)/[malloc.asm](src/malloc.asm) with malloc, realloc and free