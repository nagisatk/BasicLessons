/* entab */
#include<stdio.h>

#define TABSTOP 8   //for Windows cmd

void print_tab(int space, int tab) {
    if(space >= tab) {
        putchar('\t');
        space -= tab;
    }
    for(; space >= TABSTOP; space -= TABSTOP)
        putchar('\t');
    for(; space > 0; space--)
        putchar(' ');
}

int main() {
    int c;
    int space = 0;
    int index = 0;
    int tab = TABSTOP;
    while((c = getchar()) != EOF) {
        if(c == '\n') {
            if(space > 0)
                print_tab(space, tab);
            index = 0;
            space = 0;
        } else {
            if(c == ' ') {
                space++;
            } else {
                if(space > 0) {
                    // tab = 
                    print_tab(space, TABSTOP - (index-space)%TABSTOP);
                }
                // printf("%d",space);
                // printf("%d",TABSTOP - (index-space)%TABSTOP);
                space = 0;
                putchar(c);
            }
            index++;
        }
    }
}
