_palindrom PROC
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edx
  push esi
  push edi

  mov eax, dword ptr [ebp+8]
  mov ecx, 0
  zlokalizuj0:
    cmp [eax + 2 * ecx], word ptr 0
    je wyjdz
    inc ecx
    jmp zlokalizuj0
  znaleziono:
    ;1.zaczynamy poszukiwania od początku do początek+2
    ;2.następnie zwiększamy koniec o 2 tak długo aż przekroczy ecx
    ;3.wtedy posuwamy początek o 2 i wracamy do 1
  mov ebx, 0;licznik par
  mov esi, eax
  lea edi, [esi + 2];
  mov edx, 0
  poszukiwania:

    push edi
    push esi
    call _czy_palindrom
    ;w eax czy palindrom
    cmp eax, 1
    jne dalej
    ;znaleziono palindrom
    inc ebx
    lea eax, [eax + 2 * esi]
    push eax;odkładamy adres na wyższy adres
    mov eax, edi
    sub eax, esi
    push eax;odkładamy długość na niższy adres
    dalej:
    mov eax, esi
    add edi, 2
    cmp edi, ecx
    ja resetuj
    cmp esi, edi
    ja konczPoszukiwania
    resetuj:
      add edx, 2
      mov esi, dword ptr [ebp+8]
      add esi, edx
      mov edi, esi
      add edi, 2
    jmp poszukiwania
  konczPoszukiwania:
  ;ebx jest naszym licznikiem par
  mov eax, ebx
  lea eax, [8 * eax]
  push eax
  call _malloc
  add esp, 4
  ;teraz pozostaje przepisać wszystko
  mov ecx, 0
  mov esi, eax
  ptl:
    mov edx, dword ptr [esp];długość
    mov [esi + 4], edx
    mov edx, dword ptr [esp+4];adres
    mov [esi], edx

    add esp, 8;zdejmujem parę ze stosu
    inc ecx
    cmp ecx, ebx
    jne ptl

  pop edi
  pop esi
  pop edx
  pop ecx
  pop ebx

  pop ebp
  ret
_palindrom ENDP


_czy_palindrom PROC
  push ebp
  mov ebp, esp
  push esi
  push edi
  push ebx
  push ecx
  ;ebp+8 lewy ebp+12 prawy index
  mov esi, dword ptr [ebp+8]
  mov edi, dword ptr [ebp+12]
  mov ecx, edi
  sub ecx, esi;w ecx liczba znakow w domniemanym palindromie
  bt ecx, 0
  jnc niepal
  shr ecx, 1
  ptl:
    mov bx, word ptr [eax + 2 * esi]
    cmp bx, word ptr [eax + 2 * edi]
    jne niepal
    dec edi
    dec ecx
    cmp ecx, 0
    jne ptl
  mov eax, 1
  jmp koniec
  niepal:
  mov eax, 0
  koniec:
  pop ecx
  pop ebx
  pop edi
  pop esi
  pop ebp
  ret
_czy_palindrom ENDP