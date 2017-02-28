#include<stdio.h>
#define MAXLINE 1000    /* maximum input line length */

int getline(char line[], int maxline);
int copy(char to[], char from[]);

/* print the longest line */
int main() {
    int len;    /* current line length */
    int max = 0;    /* maximum length seen so far */
    char line[MAXLINE];  /* current input line */
    char longestline[MAXLINE];
    char c;
    while((len = getline(line, MAXLINE)) > 0) {
        if(len > 0)
            len = copy(longestline, line);
        if(len > 0) {
            printf("%s", longestline);
            if(longestline[len-1] != '\n')
                putchar('\n');
            printf("length = %d\n", len);
        }
    }
    return 0;
}

/* getline: read a line into s, return length */
int getline(char s[], int lim) {
    int c, i;
    for(i = 0; i < lim-1 && (c = getchar()) != EOF && c != '\n'; i++)
        s[i] = c;
    if(c == '\n') {
        s[i] = c;
        ++i;
    }
    s[i] = '\0';
    return i;
}

/* copy: copy 'from' into 'to'; assume to is big enough */
int copy(char to[], char from[]) {
    int i;
    i = 0;
    while((to[i] = from[i]) != '\0')
        ++i;
    i--;
    while(to[--i] == ' ' || to[i] == '\t')
        to[i] = '\0';
    return ++i;
}
