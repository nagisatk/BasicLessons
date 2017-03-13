#include<stdio.h>

int is_digit(char c) {
    return c >= '0' && c <= '9';
}

int lower(char c) {
    if(c >= 'A' && c <= 'Z')
        return c - 'A' + 'a';
    else
        return c;
}

int is_alpha(char c) {
    return c >= 'a' && c <= 'z';
}

int htoi(char s[]) {
    int i = 0;
    if(s[0] == '0' && lower(s[1]) == 'x')
        i += 2;
    int n = 0;
    for(;is_digit(s[i]) || is_alpha(lower(s[i])); i++) {
        n = n * 16;
        if(is_digit(s[i]))
            n += s[i] - '0';
        else
            n += 10 + lower(s[i]) - 'a';
    }
    return n;
}
int main() {
    char s[] = "0x10";
    printf("The hex %s is decimal %d.\n", s, htoi(s));
}
