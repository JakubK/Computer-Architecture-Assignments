#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <xmmintrin.h>

__m128 mul_at_once(__m128 one, __m128 two);

int main() {
    __m128* one = (__m128*)malloc(sizeof(__m128));
    __m128* two = (__m128*)malloc(sizeof(__m128));
    for (int i = 0; i < 4; i++) {
        scanf("%d", &one->m128_i32[i]);
    }
    for (int i = 0; i < 4; i++) {
        scanf("%d", &two->m128_i32[i]);
    }

    __m128 result = mul_at_once(*one, *two);
    for (int i = 0; i < 4; i++) {
        printf("%d\n", result.m128_i32[i]);
    }

    return 0;
}