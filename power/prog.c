#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>

float potega(float x, unsigned int n);

int main()
{
	printf("%f", potega(5.1f, 10));
	return 0;
}