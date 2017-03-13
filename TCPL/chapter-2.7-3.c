#include<stdio.h>

unsigned long int next = 1;

/* rand : return pseudo-random inter on 0..32767 */
int rand(void) {
    next = next * 1103515245 + 12345;
    return (unsigned int)(next/65535) % 32768;
}

/* srand : set seed for rand  */
void srand(unsigned int seed) {
    next = seed;
}

int main() {
    printf("a random intger: %d.\n", rand());
    srand(1233);
    printf("another random integer: %d.\n", rand());
}
