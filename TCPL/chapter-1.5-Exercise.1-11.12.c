#include<stdio.h>

#define OUT 0
#define IN 1
int main() {
    // Exercise 1-11
    // How would you test the word count program? What kinds of input 
    // are most likely to uncover bugs if there are any?
    // Numbers?
    // Exercise 1-12
    int c, state = 0;
    while((c = getchar()) != EOF) {
        if(state == IN && (c == ' ' || c == '\t' || c == '\n')) {
            putchar('\n');
            state = OUT;
        } else {
            putchar(c);
            state = IN;
        }
    }
}
