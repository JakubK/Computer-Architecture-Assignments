


zamien_na_base12 PROC
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
        ;[ebp+8] liczba
        ;aby obliczyć ile cyfr (elementów tablicy) potrzebujemy
        ;musimy dzielić aż do zera
        mov eax, dword ptr [ebp+8]
        mov ebx, 12;dzielnik
        mov ecx, 0
        ptl:
            mov edx, 0
            div ebx
            ;w edx reszta
            ;w eax wynik
            ;tylko jeśli eax & edx = 0 to możemy przerwać
            and edx, eax
            inc ecx
            cmp edx, 0
            jne ptl

        ;teraz w ecx znajduje się liczba znaków jakich potrzebujemy
        mov eax, ecx
        add eax, eax;1 znak to 2 bajty więc podwajamy
        push eax
        call malloc
        add esp, 4
        cmp eax, 0
        je koniec
        mov esi, eax
        ;w esi znajduje się adres tablicy
        ;w ecx znajduje się liczba znaków
        ;teraz potrzujemy już tylko wypełnić tablicę resztami z dzielenia
        mov eax, dword ptr [ebp+8] ;liczba
        dec ecx;zmniejszamy ecx by ustawić się na odpowiedni index
        ptl2:
            mov edx, 0
            div ebx
            ;w edx reszta która nas interesuje
            cmp edx, 10
            jb konwersja09
            ;tutaj mamy doczynienia z 10 i 11
            add dx, 2180H
            jmp dalej
            konwersja09:
            ;tutaj mamy <0,9>
            add dx, 0030H
            dalej:
            ;tutaj musimy umiescic słowo w dobrym miejscu
            mov [esi + 2*ecx], word ptr dx
            dec ecx
            cmp ecx, -1
            jne ptl
        koniec:

    push esi
    push edx
    push ecx
    push ebx
    pop ebp
    ret
zamien_na_base12 ENDP