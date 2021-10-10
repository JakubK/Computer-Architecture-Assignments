#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
void mul(int* val1, int* val2, __int64* wynik);

int main() {
    int* val1 = (int*)malloc(sizeof(int));
    int* val2 = (int*)malloc(sizeof(int));

    __int64* wynik = (__int64*)malloc(sizeof(__int64));

    scanf("%d", val1);
    scanf("%d", val2);

    mul(val1, val2, wynik);

    printf("%d", *wynik);

    return 0;
}