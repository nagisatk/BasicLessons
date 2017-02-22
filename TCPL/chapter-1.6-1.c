#include<stdio.h>

int main() {
    int c, i, nwhite, nothers;
    int ndigits[10];
    nwhite = nothers = 0;
    for(i = 0; i <= 10; ++i)
        ndigits[i] = 0;

    while((c = getchar()) != EOF)
        if(c >= '0' && c <= '9')
            ++ndigits[c-'0'];
        else if(c == ' ' || c == '\t' || c == '\n')
            ++nwhite;
        else
            ++nothers;

    printf("digits =");
    for(i = 0; i < 10; ++i)
        printf(" %d", ndigits[i]);
    printf(", white space = %d, other = %d\n", nwhite, nothers);
}
