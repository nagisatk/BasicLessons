#include<stdio.h>
#include<string.h>

void reverse(char s[]) {
    int c, i, j;
    for(i = 0, j = strlen(s) - 1; i < j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

// itoa : convert n to charactors in s
void itoa(int n, char s[]) {
    int i, sign;
    if((sign = n) < 0)
        n = -n;
    i = 0;
    do {
        s[i++] = n % 10 + '0';
    } while(n /= 10);
    if(sign < 0)
        s[i++] = '-';
    s[i] = '\0';
    reverse(s);
}

int main() {
    int a = -1234;
    int b = 5678;
    char s[10];
    itoa(a, s);
    printf("%s\n", s);
    itoa(b, s);
    printf("%s\n", s);
}
