#include<stdio.h>

int main() {
    int c;
    while((c = getchar()) != EOF) {
        if(c == '\b')
            printf("\\b");
        else if(c == '\t')
            printf("\\t");
        else if(c == '\\')
            printf("\\\\");
        else
            putchar(c);
    }
}
