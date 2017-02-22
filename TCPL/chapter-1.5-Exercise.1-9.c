#include<stdio.h>

int main() {
    int flag = 1, c;
    while((c = getchar()) != EOF) {
        if(c != ' ') {
            putchar(c);
            flag = 1;
        } else if(flag) {
            putchar(c);
            flag = 0;
        }
    }
}
