NWD PROC
    push ebp
    mov ebp, esp
    push ebx
    push edx

        mov ebx, dword ptr [ebp+8] ;a
        mov edx, dword ptr [ebp+12] ;b

        cmp ebx, edx
        jne nierowne

        mov eax, ebx;wyn = a
        jmp koniec
        nierowne:
            cmp ebx, edx
            ja aWieksze
                ;b > a
                sub edx, ebx;b=b-a
                push edx
                push ebx
                jmp rekursja
            aWieksze:
                ;a > b
                sub ebx, edx;a = a-b
                push edx
                push ebx
                rekursja:
                    call NWD
                    add esp, 8
    koniec:
    pop edx
    pop ebx
    pop ebp
    ret
NWD ENDP