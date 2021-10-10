.686
.model flat
.code

_dot_product PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi


    mov ecx, 0;licznik elementów

    mov edi, 0;tutaj będzie całościowy wynik

    mov esi, dword ptr [ebp+8]; *tab1
    mov ebx, dword ptr [ebp+12]; *tab2

    ptl:
        push edi
        mov edx, 0
        mov eax, dword ptr [esi + 4*ecx]
        mov edi, dword ptr [ebx + 4*ecx]
        mul edi
        pop edi
        ;wynik cząstkowy w eax
        add edi, eax
    inc ecx
    cmp ecx, dword ptr [ebp+16]
    jne ptl

    ;przepisujemy wynik
    mov eax, edi

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
_dot_product ENDP


END