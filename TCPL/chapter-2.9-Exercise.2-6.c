#include<stdio.h>
#define INT_BIT 32

void binary_print(unsigned int a) {
    int ar[32] = {};
    for(int i = 31; i >= 0; i--) {
        ar[i] = a%2;
        a /= 2;
    }
    for(int i = 0; i < INT_BIT; i++)
        printf("%d", ar[i]);
    putchar('\n');
}

int setbits(int x, int p, int n, int y) {
    unsigned int cover = 0;
    cover = ~(~((~cover) >> n) >> p);
    unsigned int right = ~((~(unsigned int)0) << n);
    unsigned int new_right = ~right | y;
    new_right = ~(~new_right << (INT_BIT - n - p));
    x = x & new_right;
    return x;
}
int main() {
    unsigned int a = 134;
    unsigned int b = 3011116356;
    binary_print(a);
    binary_print(b);
    unsigned int x = setbits(b, 8, 4, a);
    binary_print(x);
}


