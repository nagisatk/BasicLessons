#include<stdio.h>

void expand(char s1[], char s2[]) {
    int left, right, i, j;
    left = right = i = j = 0;
    while(s1[i] == '-') s2[j++] = s1[i++];
    left = s1[i];
    while(s1[i]) {
        if(s1[i] != '-') {
            if(s1[i + 1] == '-' && s1[i-1] != '-')
                left = s1[i];
            else if(s1[i - 1] == '-' && s1[i + 1] != '-')
                right = s1[i];
        }
        if(left && right) {
            for(;left <= right; left ++)
                s2[j++] = left;
            left = right = 0;
        }
        i ++;
    }
    if(s1[i - 1] == '-')
        s2[j++] = '-';
    s2[j] = 0;
}

int main() {
    char s1[] = "a-z";
    char s2[100];
    expand(s1, s2);
    printf(s2);
    putchar('\n');
    char s3[] = "a-zA-Z";
    expand(s3, s2);
    printf(s2);
    putchar('\n');
    char s4[] = "-a-g";
    expand(s4, s2);
    printf(s2);
    putchar('\n');
    char s5[] = "a-c-f";
    expand(s5, s2);
    printf(s2);
    putchar('\n');
    char s6[] = "-a-g-u0-9-";
    expand(s6, s2);
    printf(s2);
}
