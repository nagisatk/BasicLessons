#include<stdio.h>
#include<stdlib.h>
#include<time.h>
// Shell sort : sort v[0]...v[n-1] into increasing order

void shellsort(int v[], int n) {
    int gap, i, j, temp;
    for(gap = n/2; gap > 0; gap /= 2)
        for(i = gap; i < n; i ++)
            for(j = i - gap; j >= 0 && v[j] > v[j + gap]; j -= gap) {
                temp = v[j];
                v[j] = v[j + gap];
                v[j + gap] = temp;
            }
}

int main() {
    int v[10];
    srand(time(NULL));
    for(int i = 0; i < 10; i ++) {
        v[i] = rand() % 100;
        printf("%d ", v[i]);
    }
    putchar('\n');
    shellsort(v, 10);
    for(int i = 0; i < 10; i ++)
        printf("%d ", v[i]);
}

