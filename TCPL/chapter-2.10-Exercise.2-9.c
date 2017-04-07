#include<stdio.h>

int bitcount(unsigned x) {
    if(x == 0)
        return 0;
    int b = 1;
    while(x &= (x-1))
        b++;
    return b;
}

int main() {
    printf("%d\n", bitcount(1));
}
