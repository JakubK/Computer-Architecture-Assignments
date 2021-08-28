.686
.model flat

extern _ExitProcess@4 : PROC
 
.data
.code

_traverse_tree PROC
	push ebp
	mov esp, ebp
	push ebx
	push ecx
	;[ebp] esp
	;[ebp+4] slad
	;[ebp+8] wsk na tree
	;[ebp+12] wsk na features
	mov ecx, 0 ;licznik dzieci

	mov ebx, [ebp+8];<- wartosc wskaznika
	mov ebx, [ebx]; <- nochild

	or ecx, ebx

	mov ebx, [ebp+8];<- wartosc wskaznika
	mov ebx, [ebx+4]; <- yeschild
	
	or ecx, ebx
	cmp ecx, 0

	jne jestemyWWezle
	;brak dzieci -> zwracamy data
	mov eax, [ebp+8]
	mov eax, [eax + 8];data
	jmp koniec

	jestemyWWezle:

	;pobieramy features[data]
	mov ecx, [ebp+8]
	mov ecx, [ecx+8];<-data

	mov ebx, [ebp+12];wsk na features
	mov ebx, [4*ecx + ebx];w ebx znajdzie siê features[data]

	cmp ebx, 1
	je takdziecko
		;nie
		mov ecx, ebp
		add edx, 12

		push ecx;features

		mov ecx, [ebp+8]
		mov ecx, [ecx];no_child

		push ecx;nochild
		
		jmp rekursja

	takdziecko:
		;tak
		mov ecx, ebp
		add edx, 12

		push ecx;features

		mov ecx, [ebp+8]
		mov ecx, [ecx+4];yes_child

		push ecx;nochild
		
		jmp rekursja
	rekursja:
		
		call _traverse_tree
		add esp, 8
		;w eax wynik

	koniec:
	pop ecx
	pop ebx
	pop ebp
	ret
_traverse_tree ENDP

END