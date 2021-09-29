

;nie wykonujemy żadnych manipulacji na floatach poza sprawdzaniem czy element jest zerem
;które szczęśliwie w IEEE754 jest kodowane tak samo jak w liczbach całkowitych, więc bez rozkazów
;x87 prototyp zostanie spełniony
sparse_to_dense PROC
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push edi

        ;[ebp+8] cols
        ;[ebp+12] size_A
        ;[ebp+16] *A
        ;[ebp+20] size_IA
        ;[ebp+24] *IA
        ;[ebp+28] size_JA
        ;[ebp+32] *JA

    mov ebx, dword ptr [ebp+8];cols

    ;macierz ma cols kolumn oraz (size_IA-1) wierszy
    mov eax, dword ptr [ebp+12]
    dec eax

    mov edx, 0
    mul ebx
    mov edx, eax
    push eax;w eax (cols * (size_IA-1)) * 4
    push malloc
    add esp, 4

    ;eax wskazuje na macierz wynikową
    ;indexowanie będzie się odbywać poprzez
    ;[eax + 4*edx + x]
    ;gdzie eax to początek wektora, edx to number wiersza a x to numer kolumny pomnożony przez 4

    ;najpierw chcemy wyzerować macierz
    mov ecx, edx ;ecx ma liczbe elementów
    zeruj:
    mov dword ptr [eax + 4*ecx], 0
    dec ecx
    cmp ecx, -1
    jne zeruj

    ;tutaj macierz wynikowa już jest wyzerowana
    ;JA wskazuje nam na kolumne w której istnieje element z A
    ;z IA musimy zinterpretować kolumnę
    mov ecx, 0
    mov edx, dword ptr [ebp+24]
    add edx, 4;przeskakujemy IA[0]
    czytajKolumne:
        mov ebx, dword ptr [ebp+28];ja
        mov ebx, [ebx + 4*ecx] ;index kolumny
        mov edi, 0;wybór wiersza
        wiersz:
            cmp dword ptr [edx + 4*edi], 0
            jne dalej
            inc edi
        dalej:
            ;w edi znajduje się poprawny wiersz

        ;teraz trzeba wypełnić macierz M
        ;edi to index wiersza, ebx to index kolumny, wartość znajduje się w A[ecx]
        lea ebx, [4*ebx]
        add ebx, edi

        mov edi, dword ptr [ebp+16];macierz A
        mov edi, dword ptr [edi+ecx];A[ecx]

        mov dword ptr [eax + ebx], edi

        inc ecx
        cmp ecx, dword ptr [ebp+28]
        jne czytajKolumne

    push edi
    push edx
    push ecx
    push ebx

    pop ebp
    ret
sparse_to_dense ENDP