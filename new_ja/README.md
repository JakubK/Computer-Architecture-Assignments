## new_ja

In some assembly language, JA (jump if greater for unsigned values) was removed from the instruction set for unknown reasons. Write subroutine in x86 masm which is going to do this task without changing the normal program behaviour. Before calling the subroutine, an address of etiquette is being pushed to the stack. This address should be used when conditions for the jump are met. Subroutine should leave the flags register untouched, work according to the StdCall convention and the subroutine should not use JA instruction.

Left column of the given code shows how the JA is being used regularly and on the right side is the example usage of your working subroutine.

```x86asm

cmp eax, ebx        cmp eax,ebx
ja some_etiquette   push offset some_etiquette
                    call new_ja
```