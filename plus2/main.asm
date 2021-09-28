
;2 in IEEE754 =
;0100 0000 0000 0000 0000 0000 0000 0000

;4 0 0 0  0 0 0 0


plus2 PROC
    push ebp
    mov ebp, esp

        mov ebx, 40000000h ;2
        mov edi, 40000000h ;2
        mov esi, eax;zapamiętujemy eax w esi

        ;równamy wykładniki do prawej
        shl eax, 23
        shl ebx, 23
        cmp eax, ebx
        jb zwiekszEAX
        ja zwiekszEBX
        je rowne

        zwiekszEBX:
            mov eax, esi
            mov ebx, 40000000h;2
            
            ;obliczamy eax - ebx => ecx
            mov ecx, eax
            sub ecx, ebx

            ;o tyle należy przesunąć mantysę ebx, wykładnik skopiujemy z eax
            mov edx, ebx
            and edx, 007FFFFFFh;zerujemy znak i wykładnik
            bts edx, 23
            rcr edx, ecx
            ;edx ma poprawną mantysę
            and ebx, FF8000000h
            or ebx, eax

            ;esi musi zawierać poprawne eax
            ;edi musi zawierać poprawne 0.25
            mov esi, eax
            mov edi, ebx
            jmp rowne
        zwiekszEAX:
            mov eax, esi
            mov ebx, 40000000h;2
            
            ;obliczamy ebx - eax => ecx
            mov ecx, ebx
            sub ecx, eax

            ;o tyle należy przesunąć mantysę eax, wykładnik skopiujemy z ebx
            mov edx, eax
            and edx, 007FFFFFFh;zerujemy znak i wykładnik
            bts edx, 23;ustawiamy niejawną jedynkę
            rcr edx, ecx
            ;edx ma poprawną mantysę
            and eax, FF8000000h
            or eax, edx

            ;esi musi zawierać poprawne eax
            ;edi musi zawierać poprawne 0.25
            mov esi, eax
            mov edi, 40000000h
        rowne:
            mov eax, esi
            mov ebx, edi
            ;wykladniki i znaki są w porządku, należy zsumować arytmetycznie mantysy
            mov edx, eax
            and edx, 007FFFFFh ;zerujemy znak i wykładnik
            and ebx, 007FFFFFh ;zerujemy znak i wykładnik
            and edx, ebx ;poprawna mantysa w edx
            and eax, FF800000h;tracimy mantysę eax
            or eax, edx
    pop ebp
    ret
plus2 ENDP