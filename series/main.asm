.data
.code
szereg PROC
    push ebp
    mov ebp, esp
        push eax
        ;[ebp+8] = n
        finit
        ;calculate 1/(n+1)
        fld1
        fild dword ptr [ebp+8]
        ;st(0)=n;st(1)=1
        fadd st(1), st(0)
        ;st(0)=n+1;st(1)=1
        fdivp
        ;st(0)=1/(n+1)

        mov eax, dword ptr [ebp+8]
        cmp eax, 1
        je koniec

        dec eax
        push eax
        call szereg
        add esp, 4
        faddp
        koniec:
        pop eax
    pop ebp
    ret
szereg ENDP
END
