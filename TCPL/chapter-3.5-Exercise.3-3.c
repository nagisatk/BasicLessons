#include<stdio.h>

#define TEST(str) expand(str, s);printf(s);putchar('\n');

void expand(char s1[], char s2[]) {
    int i, j, left, right;
    i = j = left = right = 0;
    if(s1[i] == '-')
        s2[j++] = s1[i++];
    while(s1[i]) {
        if(s1[i] == '-') {
            left = s1[i-1];
            right = s1[i+1];
        }
        if(left && right) {
            while(s2[j-1] == left)
                left++;
            for(;left <= right; left++)
                s2[j++] = left;
        }
        i++;
    }
    if(s1[i-1] == '-')
        s2[j++] = '-';
    s2[j] = 0;
}

int main() {
    char s[100];
    char s1[] = "a-z";
    char s2[] = "g-g";
    char s3[] = "a-zA-Z";
    char s4[] = "-a-g";
    char s5[] = "a-c-f";
    char s6[] = "-a-g-u0-9-";
    char s7[] = "-a-gg-u0-9-";
    TEST(s1);
    TEST(s2);
    TEST(s3);
    TEST(s4);
    TEST(s5);
    TEST(s6);
    TEST(s7);
}
