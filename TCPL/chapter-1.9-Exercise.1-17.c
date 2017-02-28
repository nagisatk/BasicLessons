#include<stdio.h>
#define MAXLINE 1000    /* maximum input line length */
#define THRESHOLD 80

int getline(char line[], int maxline);

/* print the longest line */
int main() {
    int len;    /* current line length */
    char line[MAXLINE];  /* current input line */
    while((len = getline(line, MAXLINE)) > 0) {
        if(len > THRESHOLD) {
            printf("%s\n", line);
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
