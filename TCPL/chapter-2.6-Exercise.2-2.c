#include<stdio.h>

int main() {
    int i, c, lim = 100;
    char s[100];
    for(i=0; i < lim-1 && (c = getchar()) != '\n' && c != EOF; ++i) {
        s[i] = c;
    }
    printf(s);
    int flag = 1;
    i = 0;
    while(flag) {
        if(i > lim-1)
            flag = 0;
        else {
            c = getchar();
            if(c == '\n')
                flag = 0;
            else if(c == EOF)
                flag = 0;
            else
                s[i++] = c;
        }
    }
    printf(s);
}
