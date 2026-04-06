section .bss
    memory resb 4096
    V resb 16
    pc resw 1

section .text
    global _start

_start:
    mov word [pc], 0

main_loop:
    mov bx, [pc]
    mov al, [memory + rbx]

    cmp al, 1
    je add_instruction

    add word [pc], 1
    jmp main_loop

add_instruction:
    inc byte [V]
    add word [pc], 1
    jmp main_loop
