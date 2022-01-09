#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>

float new_exp(float x);

int main() {
	float x;
	scanf("%f", &x);
	float exp = new_exp(1);
	printf("%f", exp);

	return 0;
}