#include<stdio.h>
#define MAXLINE 20    /* maximum input line length */

int getline(char line[], int maxline);
void copy(char to[], char from[]);

/* print the longest line */
int main() {
    int len;    /* current line length */
    int max = 0;    /* maximum length seen so far */
    char line[MAXLINE];  /* current input line */
    char longestline[MAXLINE];
    char c;
    while((len = getline(line, MAXLINE)) > 0) {
        if(line[len - 1] != '\n') {
            while((c = getchar()) != '\n')
                len++;
        }
        if(len > max) {
            max = len;
            copy(longestline, line);
        }
    }
    if(max > 0)
        printf("%s\n", longestline);
    printf("length = %d\n", max);
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
void copy(char to[], char from[]) {
    int i;
    i = 0;
    while((to[i] = from[i]) != '\0')
        ++i;
}
