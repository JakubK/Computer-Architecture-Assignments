.686
.model flat
extern __write : PROC
extern _ExitProcess@4 : PROC
.code
_write96 PROC
  pusha
  sub esp, 100;alokacja przestrzeni na 100 znaków na stosie
  mov edi, esp
  mov esi, 0
  wyp:;wyzerowanie bufora
	mov [esp + esi], byte ptr 0
	inc esi
	cmp esi, 100
	jne wyp

  dec esi
  mov ebp, 10;dzielnik

  ptl: ;edx:ebx:eax

  push eax ;zapamiętanie a0
  
  mov eax, edx
  mov edx, 0
  div ebp ;a2/10 => edx=r2 eax=w2
  
  push eax ; zapamiętanie w2

  mov eax, ebx ;<- a1
  div ebp; (r2 * 2^32 + a1)/10 => edx=r1 eax =w1

  push eax ; zapamiętanie w1

  mov eax, dword ptr [esp+8]; <- a0
  div ebp; (r1 * 2^32 + a0)/10 => edx=r0 eax =w0

  
  add edx, dword ptr '0'; konwersja do ascii
  mov [edi + esi], dl
  dec esi
  ;rekonstrukcja nowej liczby 94bitowej, eax bez zmian, ebx w esp, edx w esp+4
  mov ebx, dword ptr[esp]
  mov edx, dword ptr[esp+4]
  add esp, 12
  ;sprawdz czy koniec -> edx & eax = 0
  mov ecx, 0
  or ecx, eax
  or ecx, edx
  cmp ecx, 0
  jne ptl

  push dword PTR 100;liczba znaków
  push edi;adres obszaru
  push dword ptr 1;numer urządzenia (ekran ma numer 1)
  call __write
  add esp, 112
  popa
  ret
_write96 ENDP
_main PROC
  mov edx, 0FFFFFFFFh
  mov ebx, 0FFFFFFFFh
  mov eax, 0FFFFFFFFh
  call _write96
  push 0
  call _ExitProcess@4
_main ENDP
END