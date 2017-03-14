#include<stdio.h>

int any(const char s1[], const char s2[]) {
    int i = 0;
    while(s1[i] != '\0') {
        if(s1[i] == s2[0]) {
            int j = 0, k = i;
            while(s2[j] == s1[k] && s2[j] != '\0') {
                i++;
                k++;
            }
            if(s2[j] == '\0')
                return i;
        }
        i++;
    }
    return -1;
}

int main() {
    char s1[] = "abcdef";
    char s2[] = "cda";
    printf("%d\n", any(s1, s2));
    return 0;
}
