#include<stdio.h>

#define ALLOCSIZE 10000

static char allocbuf[ALLOCSIZE];
static char *allocp = allocbuf;

char *alloc(int n) {
    if(allocbuf + ALLOCSIZE - allocp >= n) {
        allocp += n;
        return allocp - n;
    } else {
        return 0;
    }
}

void afree(char *p) {
    if(p >= allocbuf && p < allocbuf + ALLOCSIZE)
        allocp = p;
}

int main() {
    printf("address of allocbuf is : %d.\n", (unsigned int)allocbuf);
    printf("address of allocp   is : %d.\n", (unsigned int)allocp);
    char *s = alloc(sizeof(char) * 100);
    printf("address of s        is : %d.\n", (unsigned int)s);
    printf("address of allocp   is : %d.\n", (unsigned int)allocp);
    afree(s);
    printf("address of allocp   is : %d.\n", (unsigned int)allocp);
}
