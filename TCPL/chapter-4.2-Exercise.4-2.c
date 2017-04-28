#include<stdio.h>
#include<ctype.h>
#define MAXLINE 1000

double atof(char s[]) {
    double val, power;
    int i, sign, idx;
    for(i = 0; isspace(s[i]); i++);
    sign = (s[i] == '-') ? -1 : 1;
    if(s[i] == '-' || s[i] == '+')
        i ++;
    for(val = 0.0; isdigit(s[i]); i++)
        val = 10 * val + s[i] - '0';
    if(s[i] == '.') i ++;
    for(power = 1.0; isdigit(s[i]); i++) {
        val = 10.0 * val + s[i] - '0';
        power *= 10;
    }
    val = sign * val / power;
    if(s[i] == 'e' || s[i] == 'E')
        i++;
    sign = (s[i] == '-') ? -1 : 1;
    if(s[i] == '-' || s[i] == '+')
        i ++;
    for(idx = 0; isdigit(s[i]); i++)
        idx = 10 * idx + s[i] - '0';
    power = 10;
    while(--idx)
        power *= 10;
    printf("%d\n", sign);
    if(sign == 1)
        return val * power;
    else
        return val / power;
}

int getline(char s[], int lim) {
    int c, i;
    i = 0;
    while(--lim > 0 && (c = getchar()) != EOF && c != '\n')
        s[i++] = c;
    if(c == '\n')
        s[i++] = '\n';
    s[i] = '\0';
    return i;
}

int main() {
    double sum, atof(char []);
    char line[MAXLINE];
    int getline(char line[], int max);

    sum = 0;
    while(getline(line, MAXLINE) > 0)
        printf("\t%f\n", atof(line));
    return 0;
}
