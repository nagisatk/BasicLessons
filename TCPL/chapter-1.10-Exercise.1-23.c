#include <stdio.h>
#define MAXLINE 1000

char line[MAXLINE];

int getline(void) {
    int c, i;
    extern char line[];
    for ( i=0; i<MAXLINE-1 && ( c=getchar()) != EOF && c != '\n'; ++i)
        line[i] = c;
    if(c == '\n') {
        line[i] = c;
        ++i;
    }
    line[i] = '\0';
    return i;
}

int main() {
    int comment = 0;
    int doubleslash = 0;
    int len;
    while((len = getline()) > 0) {
        for(int i=0; i<len-1; i++) {
            if(comment) {
                if(doubleslash == 0 && line[i] == '*' && line[i+1] == '/') {
                    comment = 0;
                    i++;
                }
            } else {
                if(line[i] == '\\') {
                    putchar(line[i]);
                    putchar(line[++i]);
                } else {
                    if(line[i] == '/' && line[i+1] == '*') {
                        comment = 1;
                        i++;
                    } else if(line[i] == '/' && line[i+1] == '/') {
                        comment = 1;
                        doubleslash = 1;
                        i++;
                    } else {
                        putchar(line[i]);
                    }
                }
            }
        }
        if(!comment)
            putchar(line[len-1]);
        if(doubleslash) {
            doubleslash = 0;
            comment = 0;
            putchar(line[len-1]);
        }
    }
}
