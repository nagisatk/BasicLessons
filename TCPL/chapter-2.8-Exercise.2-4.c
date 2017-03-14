#include<stdio.h>

void squeeze(char s1[], const char s2[]) {
    int i = 0;
    while(s1[i] != '\0') {
        int j = 0;
        while(s2[j] != '\0') {
            if(s1[i] == s2[j])
                s1[i] = '\0';
            j++;
        }
        i++;
    }
    int l = 0;
    for(int k = 0; k < i; k++)
        if(s1[k] != '\0')
            s1[l++] = s1[k];
}

int main() {
    char s1[] = "abcdefabcdefabcdef";
    char s2[] = "cda";
    squeeze(s1, s2);
    printf(s1);
    putchar('\n');
    return 0;
}
