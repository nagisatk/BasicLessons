/**
 * 做练习时脑子抽风不用数组
 * 看了答案发现自己想得太复杂了
 * 不过就这样吧
 * 顺便把答案中的代码拷到另一个文件中了
 */

#include<stdio.h>
#define N 10
#define IN  1 
#define OUT 0

int main() {
    int spaces = 0;
    int status = OUT;
    int cnum = 0;
    int c;
    int lastchar = 0, lastchar2 = 0;
    while((c = getchar()) != EOF) {
        cnum++;
        if(cnum == N+1) {
            if(c == '\n' || c == ' ') {
                cnum = 0;
                printf("%c%c\n", lastchar2,lastchar);
            } else {
                cnum = 1;
                if(lastchar == ' ')
                    printf("%c\n", lastchar2);
                else if(lastchar2 == ' ') {
                    printf("\n%c", lastchar);
                } else {
                    printf("%c-\n%c", lastchar2,lastchar);
                }
                putchar(c);
            }
            lastchar = lastchar2 = 0;
        } else if(cnum == N){
            if(c == '\n') {
                putchar(lastchar2);
                putchar(c);
                cnum = 0;
                lastchar2 = 0;
            } else
                lastchar = c;
        } else if(cnum == N-1){
            if(c == '\n') {
                putchar(c);
                cnum = 0;
            } else
                lastchar2 = c;
        } else {
            putchar(c);
        }
        if(c == '\n') {
            cnum = 0;
        }
    }
}
