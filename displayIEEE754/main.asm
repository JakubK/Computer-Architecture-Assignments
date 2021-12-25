.686
.model flat
extern __write: PROC
extern _ExitProcess@4 : PROC
.data
obszar dt ?
mnoznik dd 10
.code
_main PROC
;load 1000 * PI on top for simulation purposes
mov cl, 3
finit 
fldpi
push ecx

ptl:
    fimul mnoznik
    dec cl
    cmp cl, 0
    jne ptl
pop ecx

fbstp obszar

;42 31 00 00 00 00 00 00 00 00
; ^
;obszar

;cel -> wyswietlić 3.142
;tyle ile zer w mnożniku, tyle miejsc po przecinku


;odwrócenie bajtów

;00 00 00 00 00 00 00 00 31 42
mov esi, 0
mov edi, 9
mov bl, 0;index cyfry
mov edx, 0
mov edx, offset obszar

byteOrder:
    mov al, byte ptr [edx + esi]
    mov ah, byte ptr [edx + edi]

    mov [edx + esi], ah
    mov [edx + edi], al

    dec edi
    inc esi
    cmp esi, 5;10/2
    jne byteOrder

;00 00 00 00 00 00 00 00 31 42
;^obszar

mov esi, 0
mov ebx,20;index kropki
sub ebx,ecx
mov edx, offset obszar

;obszar na wszystkie możliwe znaki
sub esp, 21
mov edi, 0;index stosu
bajtowa:

cmp edi, ebx
jne dalej

mov [esp + edi], byte ptr '.'
inc edi

dalej:
mov al, byte ptr [edx + esi] ;xxxx yyyy | najpierw x

shr al, 4
add al, '0'
mov [esp + edi], al
inc edi

cmp edi, ebx
jne dalejdalej

mov [esp + edi], byte ptr '.'
inc edi

dalejdalej:
mov al, byte ptr [edx + esi]
shl al, 4
shr al, 4
add al, '0'
mov [esp + edi], al
inc edi

inc esi
cmp esi, 20
jne bajtowa


mov edx, esp
mov ch, 20;cyfry do wypisania
mov cl, 0; pominięte zera
sprawdzaj:
cmp [edx], byte ptr '0'
jne pisz
inc edx
inc cl
jmp sprawdzaj

pisz:
sub ch, cl
inc ch
movzx ecx, ch

push dword ptr ecx;znaki
push edx
push dword ptr 1
call __write
add esp, 12

add esp, 21


push 0
call _ExitProcess@4
_main ENDP

END