#include<stdio.h>

/* strlen : return length of s */
int strlen(char s[]) {
    int i;
    while(s[i] != '\0')
        i++;
    return i;
}

int main() {
    // Page 46 says that "String constants can be concatenated at compile time."
    // So a long string can be defined as below:
    // it's great.
    char s[] = "This is the way the world ends\n"
               "This is the way the world ends\n"
               "This is the way the world ends\n"
               "Not with a bang but a whimper.\n";
    printf(s);
    printf("Above string's length is %d.\n'", strlen(s));

    // About enum
    enum boolean {
        NO, YES
    };
    enum escapes {
        BELL = '\a', BACKSPACE = '\b', TAB = '\t', NEWLINE = '\n', VTAB = '\v', RETURN = '\r'
    };
    enum months {
        JAN = 1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
    };
    printf("The value of enum YES is %d.\n", YES);
    printf("The value of enum TAB is %d.\n", TAB);
    printf("The value of enum JUL is %d.\n", JUL);
}
