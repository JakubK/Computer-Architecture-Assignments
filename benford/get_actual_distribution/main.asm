_get_actual_distribution PROC
  push ebp
  mov ebp, esp

  push ebx
  push ecx
  push esi


  mov eax, 9;tyle znaków mamy w alfabecie
  lea eax, [4*eax];tyle bajtów potrzebujemy by pomieścić rozkład
  push eax
  call build_table
  add esp, 4
  ;w eax znajduje się adres obszaru
  mov ecx, 0
  mov esi, dword ptr [ebp+8]
  ptl:
  ;elementy są upakowane po 2 bajty
  mov bx, word ptr [esi + 2*ecx];załadowanie 
  cmp bx, word ptr 0
  je dalej
  cmp bx, word ptr ','
  je kontynuuj
  ;tutaj mamy doczynienia z cyfrą w bx
  ;należy inkrementować bajt
  sub bx, word ptr '0'
  movzx ebx, bx
  ;w ebx znajduje się index
  add [esi + 4*ebx],dword ptr 1

  inc ecx
  kontynuuj:
  cmp ecx, dword ptr [ebp+12];porównanie z len
  jne ptl
  dalej:
  ;jeśli jesteśmy tutaj, to 
  ;w zaalokowanej tablicy powinny być już zliczone wystąpienia
  ;teraz należy przeiterować się ponownie i podzielić je przez len
  ;+konwersja na float
  mov ecx, 0
  ptl2:
  fild dword ptr [esi + 4*ecx]
  fild dword ptr [ebp+12] ;st(0)=len;st(1)=wystąpienia
  fdiv
  ;na wierzchołku iloraz który należy odesłać do pamięci
  fstp dword ptr [esi + 4*ecx]
  inc ecx
  cmp ecx, dword ptr [ebp+12]
  jne ptl2


  pop esi
  pop ecx
  pop ebx


  pop ebp
  ret
_get_actual_distribution ENDP