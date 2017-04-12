#include<stdio.h>

void escape(char s[], char t[]) {
    int i = 0, k = 0;
    while(t[i] != 0) {
        char c = t[i];
        switch(c) {
            case '\t':
                s[k++] = '\\';
                s[k++] = 't';
                break;
            case '\n':
                s[k++] = '\\';
                s[k++] = 'n';
            default:
                s[k++] = c;
                break;
        }
        i++;
    }
    s[k] = 0;
}

void descape(char t[], char s[]) {
    int i = 0, k = 0;
    while(s[i] != 0) {
        if(s[i] == '\\') {
            if(s[i + 1] == 't') {
                t[k++] = '\t';
                i += 2;
            } else if(s[i + 1] == 'n') {
                t[k++] = '\n';
                i += 2;
            } else {
                t[k++] = s[i++];
            }
        } else {
            t[k++] = s[i++];
        }
    }
    t[k] = 0;
}

int main() {
    char s[] = "Hello, World. I will\ttake it.\n";
    char t[30];
    printf(s);
    escape(t, s);
    printf(t);
    int i = 0;
    putchar('\n');
    do {
        printf("1%d", s[i]);
    } while(s[i++] != 0);
    putchar('\n');
    char a[] = "Hello\\t\\nrrr";
    char b[30];
    printf(a);
    descape(b, a);
    printf(b);
    putchar('\n');
    return 0;
}
