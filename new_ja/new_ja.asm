_new_ja PROC
  push ebp
  mov ebp, esp
  push eax
  pushf
  setne al ;AL = 1 if operands are not equal (first operand was not equal to second)
  setnc ah ;AH = 1 if carry was not present (first operand was not less than second)
  and al, ah ;execute JA equivalent only when both conditions were met
  cmp al, 1
  jne koniec
  mov eax, dword ptr [ebp+8]
  mov [ebp+4], eax
  koniec:
  popf
  pop eax
  pop ebp
  ret 4
_new_ja ENDP