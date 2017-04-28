#include<stdio.h>
#include<string.h>

#include<limits.h>


void reverse(char s[]) {
    int c, i, j;
    for(i = 0, j = strlen(s) - 1; i < j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

void itoa(long n, char s[]) {
    int i, sign, flag = 0;
    if(n == LONG_MIN) {
        flag = 1;
        n = LONG_MAX;
    } else if((sign = n) < 0)
        n = -n;
    i = 0;
    do {
        s[i++] = n % 10 + '0';
    } while(n /= 10);
    if(flag) {
        s[0] = s[0] + 1;
        s[i++] = '-';
    } else if(sign < 0)
        s[i++] = '-';
    s[i] = '\0';
    reverse(s);
}

int main() {
    int i = INT_MIN;
    char s[24];
    itoa(i, s);
    printf("%s\n", s);
    printf("%d\n", INT_MIN);
    long j = LONG_MIN;
    itoa(j, s);
    printf("%s\n", s);
    printf("%ld\n", LONG_MIN);
}
