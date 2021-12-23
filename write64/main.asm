.686
.model flat
extern __write : PROC
extern _ExitProcess@4 : PROC
.code
_write64 PROC
  mov ebp, esp
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
  mov ebx, 10;dzielnik

  ptl:
  push eax ;zapamiętanie młodszej części liczby
  mov eax, edx
  mov edx, 0
  div ebx ;podział starszej części ;edx - reszta, eax - wynik
  
  mov ecx, eax;zapamiętanie wyniku
  mov eax, dword ptr[esp]; sięgamy po młodszą część liczby
  div ebx; podział (reszta*2^32) + a0 ;w eax wynik ;w edx reszta do wypisania
  
  add edx, dword ptr '0'; konwersja do ascii
  mov [edi + esi], dl
  dec esi
  ;rekonstrukcja nowej liczby 64bitowej
  mov edx, ecx;rekonstrukcja starszej części, eax nie trzeba zmieniać
  add esp, 4
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
_write64 ENDP
_main PROC ;0DE0 B6B3 A764 0000 -> 1 000 000 000 000 000 000
  mov edx, 0DE0B6B3h;
  mov eax, 0A7640000h
  call _write64
  push 0
  call _ExitProcess@4
_main ENDP
END