_merge_reversed PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    push esi

    mov eax, 0
    mov ecx, dword ptr [ebp+16]
    cmp ecx, 32
    jae koniec

    mov eax, offset tablica

    mov edi, ecx
    dec edi ;n-1
    mov esi, 0


    mov ecx, 0
    ptl: 
        mov ebx, dword ptr [ebp+8]
        mov ebx, dword ptr[ebx + 4*esi];tab1 element
        ;obliczenie N-1-ecx
        mov edx, dword ptr [ebp+12]
        mov edx, dword ptr[edx + 4*edi];tab2 element

        ;tab1E > tab2E => zamiana
        cmp ebx, edx
        ja zamiana
        jmp dalej
        zamiana:
        dec edi
        mov dword ptr [eax + 4*ecx], edx
        jmp dalejdalej
        dalej:
        inc esi
        mov dword ptr [eax + 4*ecx], ebx


        dalejdalej:
        inc ecx
        push eax
        mov eax, dword ptr [ebp+16]
        lea eax, [2*eax]
        cmp ecx, eax
        pop eax
        jne ptl

    koniec:

    pop esi
    pop edi

    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
_merge_reversed ENDP