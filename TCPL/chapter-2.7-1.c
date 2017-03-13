#include<stdio.h>

/* atoi : convert s to integer */
int atoi(char s[]) {
    int i, n;
    n = 0;
    for(i = 0; s[i] >= '0' && s[i] <= '9'; i++)
        n = 10 * n + (s[i] - '0');
    return n;
}

int main() {
    int c, i = 0;
    char s[100];
    while((c = getchar()) != EOF && c != '\n')
        s[i++] = c;
    printf("The input integer is %d.\n", atoi(s));
}
