merge_reversed PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

    mov eax, 0
    cmp dword ptr [ebp+16], 32
    jae koniec

    mov eax, offset tablica

    mov ecx, 0
    ptl: 
        mov ebx, dword ptr [ebp+8]
        mov ebx, dword ptr[ebx + 4*ecx];tab1 element
        ;obliczenie N-1-ecx
        mov edx, ecx
        push ecx
        mov ecx, dword ptr [ebp+16]
        sub ecx, edx
        dec ecx
        mov edx, dword ptr [ebp+8]
        mov edx, dword ptr[edx + 4*ecx];tab2 element
        pop ecx

        ;tab1E > tab2E => zamiana
        cmp ebx, edx
        ja zamiana

        jmp dalej
        zamiana:
        xchg ebx, edx
        dalej:
        ;tutaj odkładamy ebx i edx
        mov dword ptr [eax + ecx], ebx
        mov dword ptr [eax + 4*ecx], edx

        inc ecx
        cmp ecx, dword ptr [ebp+12]
        jne ptl

    koniec:

    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
merge_reversed ENDP