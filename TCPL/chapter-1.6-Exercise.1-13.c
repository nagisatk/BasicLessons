#include<stdio.h>

#define MAX 10
#define IN 1
#define OUT 0
int main() {
    int c, i, state = OUT;
    int words[MAX];
    for(i = 0; i < MAX; i++)
        words[i] = 0;
    i = 0;
    while((c = getchar()) != EOF && i < MAX) {
        if(c == ' ' || c == '\n' || c == 't') {
            if(state == IN)
                i++;
            state = OUT;
        } else {
            words[i]++;
            state = IN;
        }
    }
    int max = -1;
    for(i = 0; i < MAX; i++)
        if(max < words[i])
            max = words[i];
    for(;max > 0; max--) {
        for(i = 0; i < MAX; i++) {
            if(words[i] >= max)
                putchar('-');
            else
                putchar(' ');
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');
    for(i = 0; i < MAX; i++) {
        while(words[i]--)
            putchar('|');
        putchar('\n');
        putchar('\n');
    }
}
