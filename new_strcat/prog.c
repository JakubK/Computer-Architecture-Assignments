#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <malloc.h>
void nowy_strcat(char* wynik, char* zrodlo);
int main()
{
    char* wynik = (char*)malloc(sizeof(char) * 100);
    char* zrodlo = (char*)malloc(sizeof(char) * 7);
    scanf("%s", wynik);
    scanf("%s", zrodlo);
    nowy_strcat(wynik, zrodlo);

    printf("%s", wynik);

    return 0;
}