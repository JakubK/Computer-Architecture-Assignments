;esi wskazuje na IN
;edi wskazuje na OUT


push ecx
push eax
push edx

mov edx, 0 ;licznik bajtów z ESI
mov ebx, 0 ;licznik bajtów z EDI
outerPtl:
    mov ecx, 7
    mov al, 0
    ptl: ;pętla przerabiająca 8 bajtów z ESI w 1 bajt z EDI
        add al, byte ptr [esi + edx]
        shl al, 1

        inc edx
        cmp edx, 1400
        je koniec
        dec ecx
        cmp ecx, -1
    jne ptl
    ;odłożenie bajtu pod edi
    mov [edi + ebx], al
inc ebx

pop edx
pop eax
pop ecx
