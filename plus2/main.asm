_plus2 PROC
    push ebp
    mov ebp, esp
    pusha
    ;[ebp+8] float
    mov eax, dword ptr [ebp+8]
    mov ebx, eax
    rol ebx, 9;w bl wykladnik
    cmp bl, 150
    ja koniec;znaczna utrata bitów mantysy, wykonanie operacji zakończy się niepoprawnym wynikiem

    mov edx, 2;dwójka do przesuniecia
    and eax, 7FFFFFh;0111 1111 1|111 1111 1111 1111 1111 1111 - maska dla przechowania mantysy
    or eax,  800000h;   0000 0000 1|000 0000 0000 0000 0000 0000 - przywrocenie niejawnego bitu mantysy
    cmp bl, 127
    jae jedynka_w_lewo

    ;Wykładnik < 127
    mov cl, 127
    sub cl, bl
    inc cl ;zwiększenie o 1 pozycji pod którą normalnie miałaby być dodana jedynka
    shr eax, cl
    adc eax, 0
    mov bl, 128;po zwiększeniu liczby o 2 liczba musi mieć wykładnik 128
    jmp dalej

    jedynka_w_lewo:
    mov cl, 150
    sub cl, bl;cl to liczba miejsc o którą należy przesunąć jedynkę
    shl edx, cl

    add eax, edx
    bt eax, 24
    jnc dalej

    ;jedynka na bicie niejawnej jedynki może spowodować problem konwersji
    ;należy przesunąć mantysę i skompensować utratę jedynki
    shr eax, 1; Przesunięcie mantysy o 1 w prawo
    adc eax, 0; kompensacja utraconego bitu
    add bl, 1; zwiększenie wykładnika o 1

    dalej:
    and eax, 7FFFFFh;Maska przechowująca mantysę
    and ebx, 0FFh;maska przechowująca wykładnik
    ror ebx, 9; rotacja wykładnika by nie kolidował z mantysą
    or eax, ebx
    koniec:

    ;obliczenia zakończone, należy umieścić EAX jako float na wierzchołku koprocesora
    finit
    push eax
    fld dword ptr [esp]
    add esp, 4
    popa
    pop ebp
    ret
_plus2 ENDP