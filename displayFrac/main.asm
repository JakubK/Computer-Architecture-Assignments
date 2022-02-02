_displayFrac PROC
  push ebp
  mov ebp, esp
  pusha
  sub esp, 100;rezerwacja przestrzeni na znaki do wyświetlenia
  mov edi, esp
  mov esi, eax
  mov edx, 0
  mov ebx, 100
  mul ebx
  shr eax, 12;wytracenie części ułamkowej
  mov edx, 0
  mov ecx, 0;ecx będzie licznikiem znaków
  ptl:
    div ebx
    inc ecx
    push edx;odkładamy resztę na stos
    mov edx, 0
  cmp eax, 0
  jne ptl
  ;w ecx liczba cyfr, zwiększymy ją o 1 by wstawić kropke
  inc ecx
  mov ebx, 0;znaki wpisane
  ptl2:
    pop edx
    add dx, '0'
    mov [edi + 2*ebx], dx
    dec ecx
    inc ebx
    cmp ecx, 2;jeśli zostały 2 znaki do pokazania, wstawiamy kropke
    jne dalej
    mov [edi + 2*ebx], word ptr '.'
    dec ecx
    inc ebx
    dalej:
    cmp ecx, 0
  jne ptl2
  ;wstawienie bajtu 0 na koniec
  mov [edi + 2*ebx], word ptr 0
  push 0
  push edi
  push edi
  push 0
  call _MessageBoxW@16;winapi, nie trzeba sprzątać
  add esp, 100
  popa
  pop ebp
  ret
_displayFrac ENDP