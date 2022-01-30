## Fermat

Write a fragment of x86 program in 32-bit mode that is decomposing 64bit number `p` with assumption that `p` > 1 and is odd number. Found elements are meant to be stored in array where first element is equal to number of found elements, next elements are 64bit primary numbers.

To achieve this goal you need to use Fermat's method.
Method is based on notice that if there are 2 natural numbers `x` and `y`, that:

p = x<sup>2</sup> - y<sup>y</sup> then p = (x+y)(x-y), so we seek m and n numbers:

m = x + y
n = x - y

Found m and n do not have to be primary so you need to use this method recursively for m and n. It is possible because `m` and `n` are odd too.

To find `x` and `y` the algorithm is using property p = x<sup>2</sup> - y<sup>2</sup>.
It starts looking for x equal to sqrt(p) rounded up to closest integral number. Next y<sup>2</sup> = x<sup>2</sup> - p is computed.

Next you need to check if y is integral number and if so then x and y were found. Calculated m and n if are different than 1 then there has to be recursion done for both m and n. If one of them is equal to 1 then second must be equal to p meaning p is primar number.

Because element must be less or equal to p, m = x + y <= p

When x + y exceeds the p, then there are no divisor left and algorithm can end with assumption that p is primary.