## mse loss

Write in x86 masm subroutine with the following prototype:

```c
int mse_loss(int tab1[], int tab2[], int n);
```

Which is going to calculate mean square error of 2 given vectors `tab1` and `tab2`, both of size `n`.

Write client program in C presenting working subroutine.

$
MSE = \frac{1}{N}\sum_{i=1}^{N}(x_i - y_i)^2
$