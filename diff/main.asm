roznica PROC
    push ebp
    mov ebp, esp
    ;ebp - esp
    ;ebp+4 - ślad
    ;ebp+8 *odjemna
    ;ebp+12 **odjemnik
    push ebx

    mov eax, dword ptr [ebp+8]
    mov eax, dword ptr [eax]

    mov ebx, dword ptr[ebp+12]
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [ebx]

    sub eax, ebx


    pop ebx
    pop ebp
    ret
roznica ENDP