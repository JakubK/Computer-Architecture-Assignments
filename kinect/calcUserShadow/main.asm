_wyznaczCienUzytkownika PROC
  push ebp
  mov ebp, esp

  push ebx
  push ecx
  push edx
  push esi
  push edi

  finit
  mov edx, 0
  mov eax, 640
  mov ebx, 480
  mul ebx ;w eax liczba elementów 4 bajtowych
  mov ebx, eax;w ebx liczba elementów 4 bajtowych
  lea eax, [4*eax];w eax liczba bajtow do alokacji
  mov edx, eax;kopia 
  push eax
  call _malloc
  add esp, 4;w eax adres bufora

  mov edi, eax;w edi adres bufora
  cld
  mov eax, 7F800000H ;+inf
  mov ecx, ebx;liczba elementów do zapisania
  rep stosd;bufor wypełniony +inf
  mov ecx, ebx;w ecx liczba elementow do zapisania
  mov eax, edx
  mov edx, dword ptr [ebp+8]
  ptl:
    mov bx,word ptr [edx + 2 * ecx];tutaj short z tablicyD
    and bx, 0FFF8h;bx = id gracza
    cmp bx, dword ptr [ebp+12]
    jne dalej
    mov bx,word ptr [edx + 2 * ecx];tutaj short z tablicyD
    shr bx, 3; w bx dystans
    cmp bx, dword ptr [ebp+16]
    jb dalej
    cmp bx, dword ptr [ebp+20]
    ja dalej
    ;teraz pozostaje przekonwertować na float i umieścić w 
    ;[eax + 4 * ecx]
    movzx ebx, bx
    push ebx
    fild dword ptr [esp]
    add esp, 4
    fstp dword ptr [eax + 4 * ecx]
    dalej:
    dec ecx
    cmp ecx, -1
    jne ptl

  pop edi
  pop esi
  pop edx
  pop ecx
  pop ebx

  pop ebp
  ret
_wyznaczCienUzytkownika ENDP
