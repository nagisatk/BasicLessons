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

unsigned int rightrot(unsigned int x, int n) {
    unsigned int t = x << (INT_BIT - n);
    x = (x >> n) | t;
    return x;
}

int main() {
    unsigned int a = 134;
    unsigned int b = 3011116356;
    unsigned int x = rightrot(a, 12);
    binary_print(a);
    binary_print(x);
    putchar('\n');
    unsigned int y = rightrot(b, 11);
    binary_print(b);
    binary_print(y);
}


