_potega PROC
  push ebp
  mov ebp, esp
  finit
  push dword ptr [ebp+12]
  push dword ptr [ebp+8]
  call _potega_rek
  add esp, 8
  pop ebp
  ret
_potega ENDP

_potega_rek PROC
  push ebp
  mov ebp, esp
  pusha
  cmp dword ptr [ebp+12], 0
  je jeden
  mov eax, dword ptr [ebp+12]
  bt eax, 0
  jc mnoz
  ;ostatni przypadek
  shr eax, 1;podzielenie n przez 2
  push eax
  push dword ptr [ebp+8]
  call _potega_rek
  add esp, 8
  fld st(0)
  fmul
  jmp koniec
  mnoz:
  dec eax
  push eax
  push dword ptr [ebp+8]
  call _potega_rek
  add esp, 8
  fld dword ptr [ebp+8]
  fmul
  jmp koniec
  jeden:
  fld1
  koniec:
  popa
  pop ebp
  ret
_potega_rek ENDP
