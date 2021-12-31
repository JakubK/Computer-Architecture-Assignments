

_Laplasjan PROC
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
        ;[ebp+8] *obraz
        ;[ebp+12] w
        ;[ebp+16] h
    mov ecx, 0; licznik przeliczonych pixeli
    mov edi, 0;wiersz
    perRow:
        mov esi, 0 ; licznik kolumna
        perCol:
            ;tutaj należy wykonać mnożenie
            pusha
            ;musimy wydobyć aktualny bajt
            ;w tym celu przeskoczyć w * edi bajtów by trafić w wiersz
            mov edx, 0
            mov eax, edi
            mul dword ptr [ebp+12]
            add eax, esi;ustawienie na odpowiedni pixel
            mov ecx, eax
            mov ebx, dword ptr [ebp+12]
            mov al, byte ptr [ebx + ecx]
            ;al należy przemnożyć przez -4
            movzx eax, al
            lea eax, [4 * eax]
            neg al
            cmp esi, 0
            jne obliczPoprzednik
            jmp dalej
            obliczPoprzednik:
            ;tutaj obliczamy element stojący przed al by go doliczyć
            mov ah, byte ptr[ebx + ecx - 1]
            add al, ah
            dalej:
            dec ebx
            cmp esi, ebx
            jne obliczNastepnik
            jmp dalejdalej
            obliczNastepnik:
            ;tutaj obliczamy nastepny element i doliczamy go do al
            mov ah, byte ptr[ebx + ecx + 1]
            add al, ah
            dalejdalej:
            ;tutaj odkładamy bajt al na swoje miejsce
            mov [ebx + ecx], al
            popa
            inc ecx
            inc esi
        cmp esi, dword ptr [ebp+12]
        jne perCol
    inc edi
    cmp edi, dword ptr [ebp+16]
    jne perRow

    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
_Laplasjan ENDP