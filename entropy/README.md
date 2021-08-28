## Entropy

Using x86 Assembly Language implement a function ready to be called from C with following prototype:

```c
float entropy(float probabilities[], unsigned int n);
```

which is going to calculate the entropy of the probability distribution `n` events present in `probabilities`.

Entropy formula:

$$entropy =-\sum_{i}^{n} p{_i} log{_2} {p{_i}}$$

1.  Skip $$ p{_i} = 0 $$ or else the result will be `NaN`
2. Assume that `n > 0`
3. Use `FYL2X` instruction to calculate log2(x)