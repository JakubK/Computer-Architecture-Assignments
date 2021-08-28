.686
.model flat

extern _ExitProcess@4 : PROC
 
.data
	pierwszywiersz db "B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9"
	drugiwiersz	   db 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
.code

_shl_128 PROC
	push ebp
	mov ebp, esp
	push edi
	cmp dword ptr [ebp+12], 0
	je koniec

	;[ebp+8] <- wsk in
	;[ebp+12] <- n
	mov edi, [ebp+8]

	ptl:
	cmp dword ptr [ebp+12], 0
	je koniec

	shl dword ptr [edi] ,1
	rcl dword ptr [edi+4],1
	rcl dword ptr [edi+8], 1
	rcl dword ptr [edi+12], 1

	dec dword ptr[ebp+12]
	jmp ptl

	koniec:
	pop edi
	pop ebp
	ret
_shl_128 ENDP

_mul_24 PROC
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	;[ebp+8] * in
	;[ebp+12] * out

	;przepisanie in na out
	mov esi, [ebp+8];in
	mov edi, [ebp+12];out

	mov ebx, [esi]
	mov [edi], ebx

	mov ebx, [esi+4]
	mov [edi+4], ebx

	mov ebx, [esi+8]
	mov [edi+8], ebx
	;out = in

	push dword ptr 4 ;char n
	push [ebp+12]; *a
	call _shl_128

	;out = 16 * in

	;dodanie 8*in do out
	;out = 16*in + 8*in
	mov ecx, 8
	dodaj8:

	mov ebx, [esi]
	add [edi], ebx

	mov ebx, [esi+4]
	adc [edi+4], ebx

	mov ebx, [esi+8]
	adc [edi+12], ebx

	mov ebx, [esi+12]
	adc [edi+12], ebx

	loop dodaj8

	pop ebx
	pop edi
	pop esi
	pop ebp
	ret
_mul_24 ENDP

;#3

;w [ebp+8] ascii
;w eax wartosc liczbowa znaku
_wartosc_znaku PROC
	push ebp
	mov ebp, esp
	push ecx
	push edx
	;[ebp+8] ;znak 
	mov ecx, 0
	ptl:

	mov edx,dword ptr [pierwszywiersz + ecx]
	cmp edx,dword ptr [ebp+8]
	je koniec

	inc ecx
	cmp ecx, 24
	jne ptl
	koniec:

	mov eax,dword ptr [drugiwiersz + ecx]

	pop edx
	pop ecx
	pop ebp
	ret
_wartosc_znaku ENDP

_get_RPK PROC
	push ebp
	mov ebp, esp
	push esi
	push edi
	push edx
	push ebx
	;[ebp+8] * pk
	;[esi] pk

	;eax - rejestr z wynikiem
	;esi - rejestr z pk
	;edi - rejestr z indeksem
	;ecx - rejestr wyk³adnika

	;ebx in
	;eax out
	mov eax, 0
	mov esi, [ebp+8] ;* pk
	mov edi, 0
	mov ecx, 24

	sub esp, 128
	mov ebx, esp

	sub esp, 128
	mov eax, 128

	ptl:

	mov edx, [esi + edi];w EDX znajduje siê ascii znaku PK
	cmp edx, '-'
	je myslnik
	cmp edx, 0
	je koniec

	;edx np 'F'
	push eax
	push edx
	call _wartosc_znaku
	;w eax wartosc znaku
	add [ebx], eax
	add esp, 4
	pop eax

	push eax ;out
	push ebx ;in
	call _mul_24
	add esp, 8
	;w out znajduje siê wynik

	dec ecx
	myslnik:
	add edi, 4
	jmp ptl
	koniec:
	;w eax znajduje siê wynik 16 bajtowy
	;nale¿y wybraæ bajty 8-5 i przekonwertowaæ na BE
	mov eax, dword ptr [eax + 20]
	bswap eax

	add esp, 256

	push ebx
	push edx
	push edi
	push esi
	pop ebp
	ret
_get_RPK ENDP

END