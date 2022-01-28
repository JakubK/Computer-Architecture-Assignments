_znajdz_symbol PROC ;IN:na stos znak bajtowy;OUT: ch-symbol, cl-dlugosc
  push ebp
  mov ebp, esp
  push eax
  push esi
  mov al, dword ptr [ebp+8];znak
  mov ecx, 0
  mov esi, tablica_kodowa
  szukaj:
    cmp al, [esi]
    je znaleziono
    add esi, 3
    jmp szukaj
  znaleziono:
  mov ch, [esi+1];symbol
  mov cl, [esi+2];dlugosc
  pop esi
  pop eax
  pop ebp
  ret
_znajdz_symbol ENDP

_kompresuj PROC
  push ebp
  mov ebp, esp

  push ecx
  push edx
  push esi
  push edi

  mov eax, 0
  mov esi, dword ptr[ebp+8];wejscie
  mov edi, dword ptr[ebp+16];wyjscie
  mov edx,0; dl - kody, dh- dlugosc
  mov ecx, 0;licznik bajtowy
  ptl:
    mov bl, dword ptr [esi + ecx]
    push ecx
    sub esp, 1
    mov [esp], bl
    call _znajdz_symbol
    add esp, 1
    add dh, cl
    cmp dh, 8
    ja przesun
    mieszcz:
    ;bity symbolu sie zmieszczą
    add al, cl
    shl dl, cl
    or dl, ch
    jmp dalej
    przesun:
    mov dh, 0;zerujemy dlugosc
    mov [edi], dl;odsyłamy to co do tej pory było
    inc edi
    mov dl, 0
    jmp mieszcz
    dalej:
    pop ecx
    inc ecx
    cmp ecx, dword ptr [ebp+12]
    jne ptl

  pop edi
  pop esi
  pop edx
  pop ecx

  pop ebp
  ret
_kompresuj ENDP
