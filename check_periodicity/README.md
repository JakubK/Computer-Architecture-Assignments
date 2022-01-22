## Check Periodicity

Implement given function in x86 masm ready to be called from C language with the following prototype:

```c
float sprawdz_okresowosc(float * do_sprawdzenia);
```

Which is going to decide if given time series is periodical. Assume that values from array `do_sprawdzenia` are from range <10,15>, array is finished with 0 and can contain 256 elements in total. To calculate periodicity there's autocorelate function given with formula:


$$ r_k = \frac{ \sum_{t=k+1}^{T}(y_t - avg(y))(y_t-_k - avg(y))}{ \sum_{t=1}^{T}(y_t - avg(y))^2} $$

where $ r_k $ is factor of autocorelation for $k$ delay (calculate for k = <20,100>), $ y_i $ is value in time $ t $, $ avg(y) $ is average value for whole series.

To calculate $ avg(y) $ you can use following function in C using following prototype in stdcall:

```c
float avg(float * tablica, short liczba_elementow_tablicy);
```

Time series is periodical if any factor $ r_k $ exceeds level of 0.2.
`sprawdz_okresowosc` subroutine should return first found level over 0.2. If the signal is aperiodical it should return -1.


