mse_loss PROC
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx

    mov ecx, 0
    mov eax, 0 ;akumulator sumy
    ptl:
        mov ebx,dword ptr [ebp+8]
        mov ebx,dword ptr [ebx + ecx];x

        mov edx,dword ptr [ebp+12]
        mov edx,dword ptr [edx + ecx];y

        sub ebx, edx
        mov edx ,0
        push eax
        mov eax, ebx
        mul ebx
        mov ebx, eax
        pop eax
        
        add eax, ebx
        inc ecx
        cmp ecx, dword ptr [ebp+12]
        jne ptl
    
    ;w eax suma do podzielenia przez N
    mov edx, 0
    div dword ptr [ebp+12]

    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
mse_loss ENDP