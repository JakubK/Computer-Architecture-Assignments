.data
bufor dq 256 dup (?)
.code
Decode PROC
    ;dekodowanie jest funkcją nxor stanu aktualnego bitu nrzi oraz poprzedniego
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push edx
    ;256 qword = 256 * 8 bytes = 2048 bytes
    ;1qword = 2 * dword = 2 * 32bit = 8bytes

    mov esi, dword ptr offset bufor
    mov edi, dword ptr offset bufor
    add edi, 2048

    ;ignorujemy bajt z bitem inicjującym
    mov ecx, 0
    ptl:
        push ecx
        cmp ecx, 0
        je pierwszyKrok

            ;zakładamy że w carry przyszedł bit poprzedni
            mov dh, 0
            adc dh, 0
            mov bl, byte ptr [esi + ecx];NRZI
            mov ecx, 7;zaczynamy od najstarszego bitu
            mov dl, 0
            jmp bitowe
        pierwszyKrok:
            ;przepisujemy najstarszy bit do dl
            mov dh, 0
            adc dh, 0
            mov dl, 0
            mov bl, byte ptr [esi + ecx];NRZI
            movzx ebx, bl
            mov ecx, 7;zaczynamy od najstarszego bitu
            bt ebx, ecx
            adc dl, 0
            shl dl, 1
            dec ecx
            jmp bitowe
        bitowe:
            movzx ebx, bl
            bt ebx, ecx
            cmp bl, dh
            je jedynka
            ;zero
                add dl, 0
                shl dl, 1
                clc
            jmp dalej
                jedynka:    
                add dl, 0
                shl dl, 1
                stc
            dalej:
                ;bit został obliczony i ustawiony w dl
                ;kolejny bit do obliczeń trafia do carry - również międzybajtowo
            dec ecx
            cmp ecx, -1
            jne bitowe
        pop ecx
            ;chcemy odłożyć bajt dl
            mov byte ptr [edi + ecx], dl
    inc ecx
    cmp ecx, 2048
    jbe ptl


    pop edx
    pop ecx
    pop ebx
    pop edi
    pop esi
    ret
    pop ebp
Decode ENDP
END