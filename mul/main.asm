.686
.model flat
.code

_mul PROC
    push ebp
    mov ebp, esp
    pusha
        mov eax, dword ptr [ebp+8]
        mov eax, dword ptr [eax];val1

        mov ebx, dword ptr [ebp+12]
        mov ebx, dword ptr [ebx];val2

        mov edx, 0
        mul ebx

        ;wynik w edx:eax

        mov ebx, dword ptr [ebp+16]; *wynik
        ;odkładamy młodszą część wyniku
        mov dword ptr [ebx], eax
        mov dword ptr [ebx+4],edx
    popa
    pop ebp
    ret
_mul ENDP


END