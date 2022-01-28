_wypelnijTabliceKodowa PROC
  push ebp
  mov ebp, esp
  pusha
  mov eax, dword ptr [ebp+8];node
  mov ebx, dword ptr [eax];lewy
  cmp ebx, dword ptr [eax+4]
  je koniec ;pusty korzeń
  push 0 ;dlugosc
  push 0 ;symbol
  push ebx ;node
  call _wyp_rek ;lewy
  mov [esp], dword ptr [eax+4]
  call _wyp_rek ;prawy
  add esp, 12
  koniec:
  popa
  pop ebp
  ret
_wypelnijTabliceKodowa ENDP

_wyp_rek PROC
  push ebp
  mov ebp, esp
  pusha

  mov ecx, dword ptr [ebp+16]
  inc ecx
  mov eax, dword ptr [ebp+8]
  mov esi, dword ptr [eax];lewy
  cmp esi, dword ptr [eax+4]
  jne rek
  ;liść
  ;należy wstawić znak:symbol:dlugosc
  mov esi, liczba_wierszy
  lea esi, [2*esi + liczba_wierszy]
  mov edi, tablica_kodowa
  mov edi, [edi + esi]
  mov [edi+2], cl
  push ecx
  mov ecx, dword ptr [ebp+12];symbol
  mov [edi+1], cl
  mov cl, [eax+8]
  mov [edi], cl
  pop ecx
  add liczba_wierszy, 1
  jmp koniec2
  rek: ;przygotowujemy parametry do rekurencji
  push ecx
  mov ebx, dword ptr [ebp+12]
  shl ebx, 1
  push dword ptr [eax]
  call _wyp_rek
  add esp, 12
  push ecx
  bts ebx, 0
  push ebx
  push dword ptr [eax+4]
  call _wyp_rek
  add esp, 12
  koniec2:
  popa
  pop ebp
  ret
_wyp_rek ENDP