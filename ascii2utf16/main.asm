;ascii basic codes
;0xxx xxxx
;in utf-16
;0000 0000 0xxx xxxx

ASCII_na_UTF16 PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

        mov ebx, dword ptr [ebp+8]; *znaki
        mov ecx, dword ptr [ebp+12];n
        ;calculate 2 * n
        add ecx, ecx
        push ecx
        call malloc
        ;pointer to buffer in eax

        mov ecx, 0
        mov edx, 0

        ptl:
            movzx edx, byte ptr [ebx + ecx]; 0000 0000 0xxx xxxx in EDX
            ;send at [eax + 2*ecx]
            mov word ptr [eax + 2*ecx], edx

            inc ecx
            cmp ecx, dword ptr [ebp+12];n
            jb ptl

    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
ASCII_na_UTF16 ENDP