#include<stdio.h>

/* lower : convert c to lower case; ASCII only */
int lower(int c) {
    if(c >= 'A' && c <= 'Z')
        return c - 'A' + 'a';
    else
        return c;
}

int main() {
    int a = 'A';
    for(; a <= 'Z'; a++)
        printf("%c", lower(a));
}
