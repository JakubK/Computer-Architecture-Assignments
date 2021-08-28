.686
.model flat

extern _ExitProcess@4 : PROC
extern _MessageBoxW@16 : PROC ;16 -> s�owa
public _main 

.data
caption dw "T","i","t","l","e", 0
bufor   db    50H, 6FH, 0C5H, 82H, 0C4H, 85H, 63H, 7AH, 65H, 6EH, 69H, 61H, 20H ; po��czenia (spacja)
        db    0F0H, 9FH, 9AH, 82H   ; parow�z
        db    20H, 20H, 6BH, 6FH, 6CH, 65H, 6AH, 6FH, 77H, 6FH, 20H ;(spacja)(spacja)kolejowo(spacja)
        db    0E2H, 80H, 93H ; p�pauza
        db    20H, 61H, 75H, 74H, 6FH, 62H, 75H, 73H, 6FH, 77H, 65H, 20H, 20H; (spacja)autobusowe(spacja)(spacja)
        db    0F0H,  9FH,  9AH,  8CH ; autobus
        db 0
wynik dw 48 dup (0)
.code
_main PROC
    ;esi - numer aktualnie przetwarzanego bajtu
    mov esi, 0

    mov edi, 0

    ;bl - aktualny bajt
    mov ebx, 0

    ;eax - pomocniczy rejestr przenoszenia znaku do pami�ci wynik
    mov eax, 0

    petla:
        mov ebx, 0
        mov bl, [bufor + esi] ;w bl kolejny bajt przetwarzanego utf-8

        cmp bl, 0
        je koniecptl

        cmp bl, 7Fh
        jbe jednobajtowy

        cmp bl, 0DFh;
        jbe dwubajtowy
        cmp bl, 0EFh
        jbe trybajtowy
        jmp czterobajtowy

        jednobajtowy:
            movzx ax, bl
            mov word ptr [wynik + edi], ax
            add esi, 1
            add edi, 2
            jmp petla

        dwubajtowy:
            mov bx, word ptr [bufor + esi]

            rol bx, 8 ;LE <-> BE
            shl bh, 3
            ror bh, 3
            shl bl, 2
            ror ebx, 2

            mov word ptr [wynik + edi], bx

            add esi, 2
            add edi, 2
            jmp petla

        trybajtowy:
            ;mov ebx, dword ptr[bufor + esi]
            shl bl, 4
            ror bl, 4

            mov cl, byte ptr[bufor + esi + 1]
            shl cl, 2
            ror cl, 2

            mov dl, byte ptr[bufor + esi + 2]
            shl dl, 2
            ror dl, 2

            rol ebx, 12
            mov ch, dl
            xchg ch,cl
            mov bl, cl

            mov byte ptr [wynik + edi+0], bl
            mov byte ptr [wynik + edi+1], bh

            add esi, 3
            add edi, 2
            jmp petla

        czterobajtowy:
            mov ebx, dword ptr [bufor + esi]
            bswap ebx ;LE <-> BE
            nop

            mov ax, bx
            nop

            shl ah, 2
            ror ah, 2
            shl al, 2
            ror eax, 2
            nop

            mov cx, ax

            bswap ebx
            rol bx, 8
            mov ax, bx

            shl ah, 5
            ror ah, 5
            shl al, 2
            ror eax, 2
           
            ;ax:cx
            rol eax, 16
            mov ax, cx
            rol ax, 4
            ror eax, 4

            ;konwersja na utf-16
            sub eax, 10000h
            shl eax, 6
            shr ax, 6
            or ax,1101110000000000b
            mov [wynik + edi + 2], ax
            shr eax, 16
            or ax,1101100000000000b
            mov [wynik + edi + 0], ax

            ;mov dword ptr [wynik + edi+0], eax


            add esi, 4
            add edi, 4
            jmp petla

    koniecptl:

    ;parametry od prawej do lewej
    push 0
    push offset caption
    push offset wynik
    push 0

    call _MessageBoxW@16
    add esp, 16

    push 0 ; kod powrotu programu
    call _ExitProcess@4
_main ENDP
END