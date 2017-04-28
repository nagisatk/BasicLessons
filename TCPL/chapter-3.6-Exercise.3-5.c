#include<stdio.h>
#include<string.h>

#include<limits.h>

char hex(int i) {
    switch(i) {
        case  0 : case  1 : case  2 : case  3 :
        case  4 : case  5 : case  6 : case  7 :
        case  8 : case  9 : return i + '0';
        
        case 10 : case 11 : case 12 : case 13 : 
        case 14 : case 15 : return i + 'A' - 10;
    }
}

int dehex(char a) {
    switch(a) {
        case '0' : case '1' : case '2' : case '3' :
        case '4' : case '5' : case '6' : case '7' :
        case '8' : case '9' : return a - '0';
        
        case 'A' : case 'B' : case 'C' : case 'D' :
        case 'E' : case 'F' : return a - 'A' + 10;
    }
}

void reverse(char s[]) {
    int c, i, j;
    for(i = 0, j = strlen(s) - 1; i < j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

// b <= 16
void itoa(long n, char s[], int b) {
    int i, sign, flag = 0;
    if(n == LONG_MIN) {
        flag = 1;
        n = LONG_MAX;
    } else if((sign = n) < 0)
        n = -n;
    i = 0;
    do {
        s[i++] = hex(n % b);
    } while(n /= b);
    if(flag) {
        int ti = 0;
        while(ti < i && s[ti] == hex(b - 1)) {
            s[ti] = '0';
            ti++;
        }
        if(ti == i)
            s[i++] = '1';
        else
            s[ti] = hex(dehex(s[ti]) + 1);
        s[i++] = '-';
    } else if(sign < 0)
        s[i++] = '-';
    s[i] = '\0';
    reverse(s);
}

int main() {
    int i = LONG_MIN;
    char s[24];
    itoa(i, s, 8);
    printf("%s\n", s);
    printf("%d\n", LONG_MIN);
    long j = LONG_MIN;
    itoa(j, s, 16);
    printf("%s\n", s);
    printf("%ld\n", LONG_MIN);
    long k = 256;
    itoa(k, s, 16);
    printf("%s\n", s);
    printf("%ld\n", k);
    long l = -65535;
    itoa(l, s, 16);
    printf("%s\n", s);
    printf("%ld\n", l);
}
