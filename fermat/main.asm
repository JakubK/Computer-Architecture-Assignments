;....
.data
liczba_sprawdz dq 0
tablica dq 2137 dup (?)
.code
;....
czy_calkowita PROC ;edi=1 jeśli całkowita, zakładamy że w segmencie danych statycznych jest zmienna liczba_sprawdz dq 64 bitowa
  push ebp
  mov ebp, esp
  push eax
  push ecx
  push edx
  mov edi, 0
  mov eax, offset liczba_sprawdz
  mov edx,dword ptr [eax + 4]
  mov eax,dword ptr [eax]
  or edi, edx
  shr edi, 20;zgubienie mantysy by zdobyc wykladnik
  cmp edi, 1023
  jb ulamek
  mov ecx, edi
  and edx, 000FFFFFh;zachowanie mantysy
  sub ecx, 1023;zgubienie biasu
  shrd eax, edx, cl
  shr edx, cl
  cmp edx, 0
  sete cl
  cmp eax, 0
  sete ch
  and ch, cl
  cmp ch, 1
  jne ulamek
  mov edi, 1
  jmp koniec
  ulamek:
  mov edi, 0

  koniec:
  pop edx
  pop ecx
  pop eax
  pop ebp
  ret
czy_calkowita ENDP

fermat PROC
  finit
  call fermat_rek
  ret
fermat ENDP

fermat_rek PROC
  push ebp
  mov ebp, esp
  pusha
 
  mov eax, offset liczba_sprawdz
  mov edx, [eax + 4]
  mov eax, [eax]
  fild qword ptr [esp] ;st(0) = p
  add esp, 8
  fld st(0) 
  fldcw 0B7FH;w górę
  fsqrt ;st(0) = x; st(1) = p
  fldcw 037FH;domyślne
  szukajx:
    fld st(0)
    fld st(0) ;st(0,1,2) = x st(3) = p
    fmul ;st(0) = x^2 st(1) = x st(2) = p
    fxch; x x^2 p
    fxch st(2); p x^2 x
    fsub ;st(0) = y^2 st(1) = x
    fsqrt ;st(0) = y st(1) = x
    fst qword ptr liczba_sprawdz
    call czy_calkowita
    cmp edi, 1
    je dalej
    ;należy dalej szukać
    fstp st(0);st(0) = x
    fld1
    fsub
    jmp szukajx
  dalej:
    ;tutaj obliczamy m i n
    ;st(0) = y st(1) = x
    fld st(0)
    fadd st(0), st(2) ;st(0) = m st(1) = y st(2) = x
    fxch st(2) ;x y m
    fxch
    fsub;n m
    fld1
    fcomi st(1)
    setne al ;czy n jest primary
    fcomi st(2)
    setne ah ;czy m jest primary
    fstp st(0)
    mov bl, al
    and bl, ah
    cmp bl, 1
    je rekurencja
    ;zwiększyć licznik
    mov ecx, offset tablica
    mov eax, [ecx]
    add eax, 1
    mov dword ptr [ecx], eax
    mov esi, offset tablica
    cmp al, 1
    je nprim
    ;tutaj m jest primary
    fxch
    fstp st(0)
    fstp qword ptr [esi + 8 * eax + 4] 
    jmp koniec
    nprim:
    fstp qword ptr [esi + 8 * eax + 4] 
    fstp st(0)
    jmp koniec
    rekurencja:
      sub esp, 16
      fstp qword ptr [esp]
      fstp qword ptr [esp+8]
      mov edx, esp
      mov liczba_sprawdz, qword ptr [edx]
      call fermat_rek
      add edx, 8
      mov liczba_sprawdz, qword [edx+8]
      call fermat_rek
      add esp, 16
    koniec:
  popa
  pop ebp
  ret
fermat_rek ENDP