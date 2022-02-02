_obliczWysokosc PROC
  push ebp
  mov ebp, esp
  pusha
  mov eax, dword ptr [ebp+8]; tablicaD *
  mov ecx, dword ptr [ebp+16];numer wiersza
  cmp ecx, 0
  je znalezionoWiersz
  szukajWiersza:
  add eax, 640
  add eax, 640
  dec ecx
  cmp ecx, 0
  jne szukajWiersza
  znalezionoWiersz:
  mov ecx, dword ptr [ebp+12]
  lea eax, [eax + 2 * ecx]
  ;w eax znajduje sie adres komórki typu word
  ;zakładam że młodsza część to depth, a starsza to id gracza
  mov ax, word ptr [eax]
  shr ax, 3;wytracamy id gracza
  finit
  push eax
  fild dword ptr [esp] ;*** będę tak oznaczał załadowania na stos, by oczyścić go raz
  push dword ptr [ebp+12]
  fild dword ptr [esp] ;*** ;st(0) = y ;st(1) = d
  push dword ptr 480
  fild dword ptr [esp]; *** ;st(0) = ymax st(1) = y st(2) = d
  fdiv
  fld1
  fxch
  fsub
  fmul ;st(0) = d()
  push dword ptr 4000
  fild dword ptr [esp]; ***
  fadd
  push dword ptr 54
  fild dword ptr [esp]; ***
  fldpi
  push dword ptr 180
  fild dword ptr [esp]; ***
  fdiv
  fmul;st(0) = kąt w radianach, st(1) = reszta
  fld1
  fld1
  fadd
  fdiv
  fptan
  fdiv
  fmul;st(0) = wynik
  add esp, 24
  ret
  popa
  pop ebp
  ret
_obliczWysokosc ENDP
