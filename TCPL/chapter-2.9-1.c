#include<stdio.h>

/* getbits: get n bits from position p */
unsigned getbits(unsigned x, int p, int n) {
    return (x >> (p+1-n)) & ~(~0 << n);
}

int main() {
    printf("%d\n", getbits(0xaa, 5, 3));
    return 0;
}
