

_szukaj_elem_min PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

    mov eax, dword ptr [ebp + 8];*tab
    ;dword ptr [ebp + 12];n
    mov ecx, 0
    mov ebx, 0
    ptl:
        mov edx, dword ptr [eax + 4*ecx]
        cmp dword ptr [eax + 4*ebx], edx;porównanie lokalnego minimum z nowym elementem
        jbe dalej
            ;znaleziono nowe minimum
            inc ebx
    dalej:
    inc ecx
    cmp ecx, dword ptr [ebp+12]
    jne ptl
    
    ;w ebx znajduje się indeks
    ;przesuwamy wskaźnik o ebx*4 bajtów
    lea eax, [eax + 4*ebx]
    pop ebx
    pop ecx
    pop edx
    pop ebp
    ret
_szukaj_elem_min ENDP