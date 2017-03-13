#include<stdio.h>
#include<limits.h>

int main() {
    printf("The MAX_VALUE of   signed char  is %d.\n", CHAR_MAX);
    printf("The MIN_VALUE of   signed char  is %d.\n", CHAR_MIN);
    printf("The MAX_VALUE of unsigned char  is %d.\n", UCHAR_MAX);
    
    printf("The MAX_VALUE of   signed short is %d.\n", SHRT_MAX);
    printf("The MIN_VALUE of   signed short is %d.\n", SHRT_MIN);
    // use %u to print unsigned numbers
    printf("The MAX_VALUE of unsigned short is %u.\n", USHRT_MAX);
    
    printf("The MAX_VALUE of   signed int   is %d.\n", INT_MAX);
    printf("The MIN_VALUE of   signed int   is %d.\n", INT_MIN);
    printf("The MAX_VALUE of unsigned int   is %u.\n", UINT_MAX);
    
    printf("The MAX_VALUE of   signed long  is %d.\n", LONG_MAX);
    printf("The MIN_VALUE of   signed long  is %d.\n", LONG_MIN);
    printf("The MAX_VALUE of unsigned long  is %u.\n", ULONG_MAX);
}
