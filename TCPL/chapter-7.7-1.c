#include<stdio.h>
#include<string.h>

char *Fgets(char *s, int n, FILE *iop) {
    register int c;
    register char *cs;

    cs = s;
    while(--n > 0 && (c = getc(iop)) != EOF)
        if((*cs++ = c) == '\n')
            break;
    *cs = '\0';
    return (c == EOF && cs == s) ? NULL : s;
}

int Fputs(char *s, FILE *iop) {
    int c;
    
    while(c = *s++)
        putc(c, iop);
    return ferror(iop) ? EOF : 0;
}

int getline(char *line, int max) {
    if(Fgets(line, max, stdin) == NULL)
        return 0;
    else
        return strlen(line);
}
int main() {
    char s[100];
    char *t;
    t = Fgets(s, 100, stdin);
    Fputs(t, stdout);
    printf("Length: %d\n", getline(s, 100));
    return 0;
}
