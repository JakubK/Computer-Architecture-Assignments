#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>

int * merge_reversed(int tab1[], int tab2[], int n);

int main() {
    int n;

    scanf("%d", &n);
    int* tab1 = (int*)malloc(sizeof(int) * n);
    int* tab2 = (int*)malloc(sizeof(int) * n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &tab1[i]);
    }

    for (int i = 0; i < n; i++)
    {
        scanf("%d", &tab2[n-1-i]);
    }

    int * result = merge_reversed(tab1,tab2,n);
    for (int i = 0;i < 2 * n;i++) {
        printf("%d", result[i]);
    }

    return 0;
}