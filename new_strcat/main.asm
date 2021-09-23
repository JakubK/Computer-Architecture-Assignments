

_nowy_strcat PROC
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push edx


    mov eax, dword ptr [ebp+8] ;wynik
    mov ebx, dword ptr [ebp+12];zrodlo

    findZero:
        cmp byte ptr [eax], 0
        je dalej
        inc eax
        jmp findZero
    dalej: ;eax is set at 0 byte of 'wynik', we can start placing from 'zrodlo'

    moveChars:
        mov dh, byte ptr [ebx]
        mov byte ptr [eax], dh
        cmp edx, 0
        je koniec
        inc eax
        inc ebx
        jmp moveChars
    koniec:

    pop edx
    pop ebx
    pop eax
    pop ebp
    ret
_nowy_strcat ENDP