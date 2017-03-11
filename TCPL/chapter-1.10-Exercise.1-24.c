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

void print_error(int ln, int col, char lack) {
    switch(lack) {
        case '(' : lack = ')';break;
        case '[' : lack = ']';break;
        case '{' : lack = '}';break;
    }
    printf("\nThere is a missing '%c' at Line %d, Col %d.\n", lack, ln, col);
}

int main() {
    char brackets[128] = {};
    brackets['('] = 0;
    brackets[')'] = 0;
    brackets['['] = 1;
    brackets[']'] = 1;
    brackets['{'] = 2;
    brackets['}'] = 2;
    char left[MAXLINE/2] = {};
    int current = -1;
    int ln = 0, col = 0;
    int len;
    while((len = getline()) > 0) {
        ln ++;
        col = 0;
        for(int i=0; i<len; i++) {
            col++;
            switch(line[i]) {
                case '(' :
                case '[' :
                case '{' : 
                    left[++current] = line[i];
                    break;
                case ')' : 
                case ']' : 
                case '}' : 
                    if(current == -1)
                        print_error(ln, col, left[current]);
                    else if(brackets[left[current]] != brackets[line[i]]) {
                        print_error(ln, col, left[current]);
                        current--;
                    } else {
                        current--;
                    }
            }
        }
    }
}
