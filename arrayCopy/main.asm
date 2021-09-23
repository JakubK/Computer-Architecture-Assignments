.686
.model flat
extern _malloc : PROC
.code

kopia_tablicy PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push edx

    mov edx, [ebp+8] ; * tab1


    ;alloc k-byte array
    ;k = 4*n
    mov ecx, dword ptr [ebp+12]; ecx = n
    lea ecx, [4*ecx]; ecx = 4*n
    push ecx
    call _malloc
    add esp, 4
    cmp eax, 0
    je koniec
    ;wynik w eax

    ;inicjalizacja pętli wypełniania nowej tablicy
    mov ecx, 0

    ptl:
    ;get [ecx] element of tab1
    mov ebx, dword ptr [edx + 4*ecx];w ebx element ze starej tablicy
    bt ecx, 0
    jnc parzysta
        ;liczba nieparzysta w ebx - wstawiamy zero
        mov ebx, 0
    parzysta:
        ;przepisujemy ebx do nowej tablicy
        mov dword ptr [eax + 4*ecx], ebx

        inc ecx
        cmp ecx, dword ptr [ebp+12]
        jne ptl

    koniec:
    pop edx
    pop ebx
    pop ecx
    pop ebp
    ret
kopia_tablicy ENDP

END