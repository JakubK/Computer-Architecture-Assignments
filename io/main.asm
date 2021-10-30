.686
.model flat
extern __read : PROC ; (dwa znaki podkreślenia)
extern __write : PROC ; (dwa znaki podkreślenia)
extern _MessageBoxW@16 : PROC
extern _ExitProcess@4 : PROC
.data
magazyn db 80 dup (0)
wynik db 80 dup (0)
messageboxbufor db 0,' ',0,0,0
.code
_main PROC

push 80
push OFFSET magazyn
push 0
call __read
add esp, 12

mov edi, 0;suma cyfr
mov ecx, 0;i-ty znak magazynu
mov esi, 0;i-ty znak wyniku
ptl:
	mov al, byte ptr [magazyn + ecx]
	cmp al, 0
	je koniec

	cmp al, '0'
	setae ah

	cmp al, '9'
	setbe bh

	and bh, ah
	cmp bh, 1

	je cyfra
	;tutaj znak do przepisania
	mov byte ptr [wynik + esi],al
	inc esi
	jmp dalej
	cyfra:
	movzx eax, al
	add edi, eax
	sub edi, '0'
	dalej:

inc ecx
cmp byte ptr [magazyn + ecx], 0
jne ptl

koniec:

push esi
push OFFSET wynik ; adres tekstu
push 1 ; nr urządzenia (tu: ekran - nr 1)

call __write ; wyświetlenie tekstu początkowego
add esp, 12

push 0
call _ExitProcess@4

_main ENDP

END