/* detab */
#include<stdio.h>

#define TABSTOP 8   //for Windows cmd

int main() {
    int index = 0;
    int c;
    int space = TABSTOP;
    while((c = getchar()) != EOF) {
        if(c != '\n') {
            if(c == '\t') {
                for(;space > 0; space--)
                    putchar(' ');
                space = TABSTOP;
            } else {
                putchar(c);
                if(space == 1)
                    space = TABSTOP;
                else
                    space--;
            }
        } else {
            space = TABSTOP;
        }
    }
}
