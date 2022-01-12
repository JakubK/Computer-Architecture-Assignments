

wyrownaj PROC
    push ebp
    mov ebp, esp
        ;n to liczba elementów każde po 128bitów
        ;128b = 16B

        ptl:
        mov eax, dword ptr [ebp+12]
        lea eax, [16*eax]
        push eax
        call _malloc
        add esp, 4
        ;w eax znajduje się teraz adres nowej tablicy
        ;najpierw sprawdźmy czy eax dzieli się przez parametr wyrownanie
        mov edx, 0
        div dword ptr [ebp+16]
        cmp edx, 0
        jne ptl

        ;jeśli tu jesteśmy to udało się w końcu zaalokować odpowiedni obszar, teraz musimy przepisać dane
        push dword ptr 0
        mov ecx, dword ptr [ebp+8]
        przepisanie:
            ;edx:ebx:esi:edi
            mov edi, dword ptr[16*ecx]
            mov esi, dword ptr[16*ecx + 4]
            mov ebx, dword ptr[16*ecx + 8]
            mov edx, dword ptr[16*ecx + 12]

            mov dword ptr [16*eax], edi
            mov dword ptr [16*eax+4], esi
            mov dword ptr [16*eax+8], ebx
            mov dword ptr [16*eax+12], edx

            mov ebx, dword ptr [ebp+12]
            inc dword ptr [esp]
            cmp dword ptr [esp], ebx
            jne przepisanie

    pop ebp
    ret
wyrownaj ENDP