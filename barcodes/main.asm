.686
.model flat
.data
suma db ? ; place for control sum
znaki db 1,1,1,5 ;column 2 from table 1
      dw 0 ;column 3 from table 1
      db 1,1,2,4
      dw 15
      ;------------------;rest of the array
      db 5,1,1,1
      dw 10
.code

mov esi, OFFSET lancuch ;address of buffer containing string to encode
mov edi, OFFSET bufor;address of buffer for BC412 codes
mov ecx, 8 ;number of characters to be encoded
mov suma, 0;initial value for sum


nastepny_znak:
    ;place for your code
    mov al, byte ptr [edi + ecx]
    ;w AL znajduje sie znak
    mov ebx, 0; ebx będzie do znalezienia indeksu w tablic

    cmp al, 'O'
    ja prostsze ;P-Z
        ;0-9 i A-N
        cmp al, 'A'
        jb cyfra
            ;A-N
            mov bl, 'A'
            sub al, bl
            ;w al liczba o którą trzeba przeskoczyć + bl
            jmp dalej
        cyfra:
            ;0-9
            mov bl, '9'
            sub al, bl
            ;w al liczba o którą trzeba przeskoczyć
            mov bl, 0;zerujemy by zniwelować skok
            jmp dalej
    prostsze:
        mov bl, 'N'
        sub al, bl
        ;w al liczba o którą przeba przeskoczyć + bl
    dalej:
    
    mov dx, 0; w dx zostanie zakodowany wynik

    add al, bl; łączny skok
    mov ebx, offset znaki
    movzx eax, al
    ;skala 6 niemożliwa więc trzeba rozbić
    ;ebx + 6*eax = (ebx + 4*eax) + eax + eax
    lea ebx, [ebx + 4 * eax]
    add ebx ,eax
    add ebx ,eax

    ;ebx wskazuje na odpowiedni wiersz
    mov eax, 0; licznik bitów
    push ecx
    mov ecx, 4 ;tyle liczb jest w kolumnie
    cyfryptl:
        push ecx
        dec ecx
        movzx ecx, byte ptr [ebx + ecx]
        ;w ecx znajduje się liczba do zakodowania na dx
        kodowaniePTL:
        btr dx, ax
        inc eax
        dec ecx
        cmp ecx, 0
        jne kodowaniePTL
        bts dx, ax
        pop ecx
    dec ecx
    cmp ecx, -1
    jne cyfryptl
    pop ecx

    ;w dx znajduje się gotowy word do odstawienia w edi
    mov word ptr [edi], dx

    ;<ZADANIE 2>
    ;ebx nadal wskazuje na początek wiersza
    add ebx, 4;przeskakujemy 4 bajty
    mov bx, word ptr [ebx]
    add suma, bl
    ;</ZADANIE 2>

    loop nastepny_znak

    ;<ZADANIE 2>
    ;w sumie znajduje się suma do podzielenia modulo 35
    mov al, suma
    mov ah, 0
    div 35
    mov dl, ah
    ;w dl reszta
    mov eax, offset suma
    mov byte ptr [suma], dl
    ;</ZADANIE 2>
END
