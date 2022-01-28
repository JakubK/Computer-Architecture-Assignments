_float_to_FP24 PROC
  push ebp
  mov ebp, esp

  push ebx
  push esi
  mov eax, 0
  mov esi, dword ptr [ebp+8]
  bt esi, 31;skopiowanie znaku
  adc eax, 0
  shl eax, 23;ustawienie znaku na 23 pozycji licząc od 0
  mov ebx, esi
  and ebx, 7F800000h;maska która pozostawia wykładnik float
  shr ebx, 23;wykładnik w bl
  sub bl, 127
  add bl, 63; przekodowanie wykładnika
  shl ebx, 16
  or eax, ebx;doklejenie nowego wykładnika
  and esi, 007FFFFFh;zachowanie 23bitów mantysy
  shr esi, 7; wytracenie 7 najmniej znaczących bitów mantysy
  or eax, esi

  pop esi
  pop ebx

  pop ebp
  ret
_float_to_FP24 ENDP