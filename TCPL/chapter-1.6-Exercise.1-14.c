#include<stdio.h>

int main() {
    int c, i, nwhite, nothers, max = -1;
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

    printf("horizontal histogram:\n");
    printf("charactor frequencies\n");
    
    for(i=0; i < 10; i++) {
        printf(" digit %d: ", i);
        for(int j = 0; j < ndigits[i]; j++)
            putchar('|');
        printf("\n\n");
    }
    printf(" white  : ");
    for(i = 0; i < nwhite; i++)
        putchar('|');
    printf("\n\n");
    printf(" other  : ");
    for(i = 0; i < nothers; i++)
        putchar('|');
    printf("\n\n");
    printf("vertical histogram:\n");
    
    for(int i = 0; i < 10; i++)
        if(ndigits[i] > max)
            max = ndigits[i];
    
    if(nwhite > max)
        max = nwhite;
    if(nothers > max)
        max = nothers;
    for(;max > 0; max--) {
        for(i = 0; i < 10; i++) {
            if(ndigits[i] >= max)
                putchar('-');
            else
                putchar(' ');
            putchar(' ');
        }
        if(nwhite >= max)
            printf("-     ");
        else
            printf("      ");
        if(nothers >= max)
            printf("-     ");
        else
            printf("      ");
        putchar('\n');
    }
    
    printf("0 1 2 3 4 5 6 7 8 9 white other\n");
}
