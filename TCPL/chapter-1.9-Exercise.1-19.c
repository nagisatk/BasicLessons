#include<stdio.h>
#define MAXLINE 1000    /* maximum input line length */

int getline(char line[], int maxline);
void reverse(char in[], char out[], int len);

/* print the longest line */
int main() {
    int len;    /* current line length */
    int max;    /* maximum length seen so far */
    char line[MAXLINE];  /* current input line */
    char out[MAXLINE];
    max = 0;
    while((len = getline(line, MAXLINE)) > 0)
        if(len > 0) {
            reverse(line, out, len);
            printf("%s\n", out);
        }
    return 0;
}

/* getline: read a line into s, return length */
int getline(char s[], int lim) {
    int c, i;
    for(i = 0; i < lim-1 && (c = getchar()) != EOF && c != '\n'; i++)
        s[i] = c;
    s[i] = '\0';
    return i;
}

void reverse(char in[], char out[], int len) {
    int temp = len;
    int i = 0;
    while(--temp >= 0)
        out[i++] = in[temp];
    out[len] = '\0';
}
