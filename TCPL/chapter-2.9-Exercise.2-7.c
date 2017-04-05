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

unsigned int invert(int x, int p, int n) {
    unsigned int t = ~0;
    binary_print(x);
    t >>= n;
    t = ~t;
    t >>= p;
    binary_print(t);
    x ^= t;
    binary_print(x);
    return x;
}

int main() {
    unsigned int a = 134;
    unsigned int b = 3011116356;
    unsigned int x = invert(a, 12, 5);
    binary_print(a);
    binary_print(x);
    putchar('\n');
    unsigned int y = invert(b, 11, 7);
    binary_print(b);
    binary_print(y);
}


