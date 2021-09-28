szereg PROC
    push ebp
    push ecx
    mov ebp, esp
        finit
        fld0;st(0) = 0

        mov ecx, 2

        ptl:
            ;st(0) previous sum | new sum

            push ecx
            fild dword ptr esp
            add esp, 4

            ;st(0) = element
            ;st(1) = previous sum 
            fld1

            ;st(0) 1
            ;st(1) element
            ;st(2) prev_sum
            fxch
            fdivp

            ;st(0) 1/element
            ;st(1) prev_sum
            faddp
            ;st(0) new_sum
        inc ecx
        cmp ecx, dword ptr [ebp+8]
        jbe ptl
    pop ecx
    pop ebp
    ret
szereg ENDP