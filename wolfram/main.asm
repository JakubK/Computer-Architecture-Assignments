.data
starting_row db 0h, 0h, 80h, 0h
next_rows db 15*4 dup(?)
.code

mov ecx, 0; numer wiersza
rows:

mov ebx, offset starting_row
lea ebx, [ebx + 16*ecx - ecx] w ebx znajduje się adres wiersza
mov edi, ebx ;edi - adres wiersza
mov ebx, dword ptr [edi] ;w ebx znajduje się wiersz

mov ah, 0;licznik bitów w wierszu
kolumny:
    push ebx
    ;wypełniamy od lewej do prawej
    ;obliczamy o ile shrnąć wiersz 
    by wydobyć tylko interesujące bity i wyrównać je do prawej
    mov dh, 29
    sub dh, ah ;zmniejszamy dh, im bliżej jesteśmy tym mniej chcemy się przesuwać
    shr ebx, dh
    and ebx, 00000008h ;zachowujemy tylko 3 najmłodsze bity

    ;z minimalizacji funkcji bitowej którą realizuje automat wynika
    ;że jeśli liczba bitowa złożona z 3 bitów z poprzedniego wiersza zawiera się
    ;<1,4>) to ustawiamy 1, w przeciwnym razie 0

    cmp ebx, 1
    jb zero
    cmp ebx, 4
    ja zero

    ;tutaj ustawiamy 1
        mov ebx, dword ptr [edi]
        push ecx
        ;ustawiamy ecx na odpowiedni bit
        mov ecx, 0
        mov ch, 31
        sub ch, ah
        bts ebx, ecx
        ;odesłanie wiersza do pamięci
        pop ecx
        jmp dalej

    zero:
        ;tutaj ustawiamy 0
        mov ebx, dword ptr [edi]
        push ecx
        ;ustawiamy ecx na odpowiedni bit
        mov ecx, 0
        mov ch, 31
        sub ch, ah
        btr ebx, ecx
        ;odesłanie wiersza do pamięci
        pop ecx

    dalej:
    mov dword ptr [edi], ebx
    pop ebx
    inc ah
    cmp ah, 32
    jne kolumny





inc ecx
cmp ecx, 15
jne rows

