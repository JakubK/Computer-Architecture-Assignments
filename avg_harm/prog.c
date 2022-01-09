#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>

float avg_harm(float * tab, unsigned int n);

int main() {
  int n;
  scanf("%d", &n);
  float * tab = (float*)malloc(sizeof(float) * n); 
  for(int i = 0;i < n;i++) {
    scanf("%f", &tab[i]);
  }

  float avg = avg_harm(tab, n);
  printf("%f", avg);

  return 0;
}