

_uint48_float PROC
  push ebp
  mov ebp, esp
  pusha
  finit
  ;fild ładuje liczbę jako u2, musimy zbadać bit 47
  ;47%32 = 15
  mov eax, dword ptr [ebp+12];bierzemy starszą połowę liczby
  btr eax, 15
  setc bl
  ;jeśli jesteśmy tutaj to liczba ma najstarszy bit ustawiony
  ;fild potraktuje ją jako ujemną
  ;bl = 1
  fild qword ptr [ebp+8];zakładamy że liczba jest long intem
  fld qword ptr dzielnik
  ;st(0) = dzielnik
  ;st(1) = p
  fdivp
  ;st(0) = wynik
  cmp bl, 1
  je koniec
  ;aby skompensować najstarszy bit ładujemy dwójkę, mnożymy ją 30 razy przez 2
  ;sumujemy z dotychczasowym wynikiem
  fild dword ptr dwa
  mov ecx, 30
  ptl2:
  fimul dword ptr dwa
  loop ptl2
  fadd
  koniec:
  popa
  pop ebp
  ret
  dzielnik dq 65536.0 ;2^16
  dwa dd 2
_uint48_float ENDP