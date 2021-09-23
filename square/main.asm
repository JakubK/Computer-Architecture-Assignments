square PROC
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp+8]; a
    cmp eax, 1
    jbe koniec


        ;obliczamy 4a - 4
        mov ebx, eax     
        lea ebx, [4*ebx - 4]

        ;(a-2)^2
        sub eax, 2
        push eax
        call square
        add esp, 4

    koniec:
    pop ebx
    pop ebp
    ret
square ENDP