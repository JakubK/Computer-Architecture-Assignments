#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <xmmintrin.h>

__m128 quick_max(short int t1[], short int t2[]);

int main() {
    short int val1[8] = { 1, -1, 2, -2, 3, -3, 4, -4 };
    short int val2[8] = { -4, -3, -2, -1, 0, 1, 2, 3 };
    __m128 t1 = quick_max(val1, val2); // -> t1.m128_i16 = {1,-1,2,-1,3,1,4,3}
    for (int i = 0; i < 8; i++) {
        printf("%d\n", t1.m128_i16[i]);
    }

    return 0;
}