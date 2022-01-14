## Benford Distribution

Write subroutine in x86 masm prepared to be called from C language as a function with the following prototype:

```c
float * create_benford_distribution_asm();
```

which as a result should return filled array with probabilities from benford distribution for next signs from input alphabet (from '1' to '9').
Subroutine cannot rely on static data segment.

Tips: <br>
- To calculate distribution use `FYL2X` instruction
    which calculates:
  

  $$ ST(1) = ST(1) * \log_2({ST(0)}) $$

  and shifts `ST(0)`<br>

- $$ \log_b{x} = \frac{\log_2{x}}{\log_2{b}}   $$ 


For memory allocation use function from `WinAPI` VirtualAlloc with the following prototype:

```c
LPVOID VirtualAlloc(LPVOID lpAddress, DWORD dwSize, DWORD flAllocationType,DWORD flProtect);
```

Params should take following values:

lpAddress = 0<br>
flAllocationType = 1000h<br>
flProtect=1<br>
`dwSize` is memory size to be allocated expressed in bytes. Function returns an address to the memory which was allocated. Assume that this function will always run with success.
