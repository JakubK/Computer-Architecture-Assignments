## Circle area

Following program in C reads radius `r` of circle from the keyboard, calculates it's area and prints out the result.

```c
#include <stdio.h>
void pole_kola (float * pr);
int main()
{
    float k;
    printf("\nProszę podać promień: ");
    scanf_s("%f", &k);
    pole_kola (&k);
    printf("\nPole koła wynosi %f\n",k);
    return 0;
}
```

Calculation of Circle fieldis performed by subroutine in x86 masm with the following C prototype.

```c
void pole_kola(float * pr);
```

Write subroutine `pole_kola` in x86 masm.