


sortowanie PROC
    push ebp
    mov ebp, esp
    push ecx
    push edi
    push esi
    ;chcemy posortować tablicę algorytmem bąbelkowym
    ;edx:eax 1 liczba
    ;esi:edi 2 liczba

    ;ecx do indeksowania
    ;zmniejszamy n o 1, dla łatwiejszego manipulowania pętlą
    mov ecx, dword ptr [ebp+12]
    
    dec ecx
    mov dword ptr [ebp+12], ecx
    ;od teraz n = n-1
    mov ecx, 0
    outer:
        push ecx
        mov ecx, 0
            inner:
                ;teraz musimy poprawnie wypełnić rejestry edx:eax
                ;oraz esi:edi

                ;jeden dword to pół liczby, 32 bity
                ;musimy więc skakać o dwa podwójne słowa, czyli o 8 bajtów
                ;eax to najmłodsza część, potem edx, potem edi i na końcu esi                
                mov eax, dword ptr [8*ecx]
                mov edx, dword ptr [8*ecx + 4]
                mov edi, dword ptr [8*ecx + 8]
                mov esi, dword ptr [8*ecx + 12]
                ;zakładamy że powyżej się wszystko udało poprawnie
                ;edx:eax
                ;esi:edi
                ;edx jest wcześniej, więc jeśli jest większe to zamiana
                cmp edx, esi
                ja zamiana
                jb dalej
                cmp eax, edi
                ja zamiana
                jmp dalej
                zamiana:
                    ;odkładamy rejestry w odwrotnej kolejności
                    mov dword ptr [8*ecx], edi
                    mov dword ptr [8*ecx + 4], esi
                    mov dword ptr [8*ecx + 8], eax
                    mov dword ptr [8*ecx + 12], edx
                dalej:
                inc ecx
                cmp ecx, dword ptr[ebp+12]
                jb inner
        pop ecx
    inc ecx
    cmp ecx, dword ptr [ebp+12]
    jbe outer

    ;największy element powinien być zwrócony jako edx:eax
    ;przy czym edx to starsze podwójne słowo
    ;eax to młodsze podwójne słowo
    ;bierzemy od końca
    mov ecx, dword ptr [ebp+12]
    mov eax, dword ptr [8*ecx]
    mov eax, dword ptr [8*ecx+4]

    pop esi
    pop edi
    pop ecx
    pop ebp
    ret
sortowanie ENDP