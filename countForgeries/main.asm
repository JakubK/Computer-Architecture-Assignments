;nalezy wejść w każdy element, policzyć xor każdego znaku ze sobą i z parametrem klucz
;jeśli xor jest różny od wartości szyfr, podbić licznik
;zwrócić licznik

_zlicz_falszerstwa PROC
    push ebp
    mov ebp, esp
    push esi
    push ebx
    push ecx
    push edx


    mov eax, 0;licznik fałszerstw
    mov esi, dword ptr [ebp+8]; *wejscie
    ;wejscie wskazuje na { pierwszego obiektu
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    mainPtl: ;pętla znajdująca { lub kończąca progam gdy napotka 0
        cmp [esi + ecx], byte ptr 0
        je koniec
        cmp ecx, '{'
        jne dalej
        ;mamy początek obiektu
        add ecx, 9; ustawiamy się na początek wartości tekst
        mov bl, byte ptr [esi + ecx]
        inc ecx
        xorPtl:
            cmp [esi + ecx], byte ptr ','
            je koniecxor
            xor bl, byte ptr [esi + ecx]
            inc ecx
            jmp xorPtl
        koniecxor:
        xor bl, byte ptr [ebp+12];robimy xor bl z kluczem
        ;teraz musimy przeskoczyć zawartość aż do wartości szyfr po x
        add ecx, 11
        konwersja:
        ;teraz musimy dokonać konwersji tekstowej bajtu do wartości
        mov dl, byte ptr [esi + ecx];pierwszy znak z lewej
        cmp dl, '9'

        jbe prostaKonwersja
        sub dl, 55
        jmp dalejdalej
        prostaKonwersja:
        sub dl, '0'

        dalejdalej:
        inc ebx
        inc ecx
        rol dx, 8
        cmp ebx, 2
        jne konwersja

        ;dh:dl mamy rozproszony bajt
        shl dl, 4
        shr dx, 4
        ;w dl mamy już cały bajt do porównania z kluczem
        cmp dl, bl
        jne dalej
        inc eax
        dalej:
        inc ecx
        jmp mainPtl
    koniec:

    pop edx
    pop ecx
    pop ebx
    pop esi

    pop ebp
    ret
_zlicz_falszerstwa ENDP
