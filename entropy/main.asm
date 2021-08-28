.686
.model flat

extern _ExitProcess@4 : PROC

.data
.code

_entropy PROC
	push ebp
	mov ebp, esp
	push ebx
	push ecx
	push edx
	;[ebp+8] <-wsk probabilities
	;[ebp+12] <- unsigned int n

	finit
	mov ebx, [ebp+8];
	mov ecx, [ebp+12];

	fldz ;ST(0) = 0
	ptl:
		;sprawdz czy zero
		cmp [ebx], dword ptr 0
		je dalej

		;zamontuj probabilities[ecx] na stosie
		fld dword ptr [ebx]
		fld dword ptr [ebx]

		;ST(0),ST(1) <- p(i); ST(2) dotychczasowy wynik
		fyl2x
		fld dword ptr [ebx]
		;ST(0) <- p(i); ST(1) <- log; ST(2) dotychczasowy wynik

		fmul ST(1), ST(0)
		;ST(0) = logp(i) * p(i); ST(1) dotychczasowy wynik
		fadd ST(0), ST(1)
		;ST(0) <- nowy wynik; ST(1), stary wynik
		FXCH
		;ST(0) <- stary ;ST(1) <- nowy
		FSTP ST(0)
		
		dalej:
		add ebx, 4
		dec ecx
		cmp ecx, 0
		jne ptl

	;zaneguj wynik
	fldz
	;st(1) = wynik st(0) = 0 
	fsub st(1), st(0)
	;st(1) finalny wynik, st(0) 0
	FSTP st(0)

	pop edx
	pop ecx
	pop ebx
	pop ebp
	ret
_entropy ENDP

END