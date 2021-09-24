;Mantisa stays the same
;Exponent has to be recalculated

;[ESI] -> Input starting address (LE)
;[EDI] -> Output starting address (LE)

;float
;sign|byte for exponent|23 bits for mantissa

;double
;sign|11bits for exponent|52bits for mantissa

mov eax, dword ptr [esi]
;extract exponent only
mov ecx, 0
bt eax, 31
adc ecx, 0
shl ecx, 31;store sign bit


shl eax, 1
shr eax, 23
;right part of eax contains exponent
;remove bias from it; bias = 127 for float, 1023 for double
sub eax, 127
add eax, 1023;eax contains exponent without sign bit
shl eax, 23
btr eax, 31

or eax, ecx;restore sign bit

;12 oldest bits of eax taken, mantissa 23 bits has to be rewritten
;rewrite 20 of them to eax, remaining 3 will be oldest of ebx

mov ebx, dword ptr [esi]
shl ebx, 9
shr ebx, 12
or eax, ebx

mov ebx, dword ptr [esi]
shl ebx, 29

;eax:ebx
mov dword ptr [edi], ebx
mov dword ptr [edi+4], eax
