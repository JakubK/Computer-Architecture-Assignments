

_szyfruj PROC
    push ebp
    mov ebp, esp
        pusha
        mov edx, 52525252h ;wektor inicjujący
        mov ecx, 0
        mov eax, dword ptr [ebp+8] ;*tekst
        szyfruj:
            mov bl, byte ptr [eax + ecx];pobieramy bajt
            cmp bl, 0
            je koniec ;jeśli 0 to bajt kończący ciąg \0

            ;w przeciwnym wypadku poprawny znak ascii
            ;zakładamy tu że nasza losowa liczba jest już policzona
            ;więc chcemy wydobyć jej najmłodsze 8 bitów
            ;szczęśliwie mieszczą się już w dl
            xor bl, dl
            mov byte ptr [eax + ecx], bl

            ;teraz musimy tylko wyznaczyć kolejną liczbę losową i umieścić ją w edx
            mov bl, 0
            bt edx, 30
            adc bl, 0   
            bt edx, 31
            adc bl, 0
            ;w bl znajduje się liczba jedynek, jeśli bl=1 to ustawiamy bh, jeśli nie to resetujemy
            cmp bl, 1
            sete bh
            ;robimy shift 
            shl edx, 1
            or dl, bh
            inc ecx
            jmp szyfruj
        koniec:
        popa
    pop ebp
    ret
_szyfruj ENDP