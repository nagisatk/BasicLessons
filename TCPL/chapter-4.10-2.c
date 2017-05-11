#include<stdio.h>

void swap(int v[], int i, int j) {
    int temp = v[i];
    v[i] = v[j];
    v[j] = temp;
}

void qsort(int v[], int left, int right) {
    int i, last;
    void swap(int v[], int i, int j);
    if(left >= right)
        return;
    for(int i = 0; i < 10; i++)
        printf(i != 9 ? "%d " : "%d\n", v[i]);
    last = left;
    for(i = left + 1; i <= right; i ++)
        if(v[i] < v[left])
            swap(v, ++last, i);
    swap(v, left, last);
    qsort(v,     left, last - 1);
    qsort(v, last + 1,    right);
}

int main() {
    int v[] = {
         1,  4,  3, 34, 26,
        28,  2, 10,  9, 17
    };
    for(int i = 0; i < 10; i++)
        printf(i != 9 ? "%d " : "%d\n", v[i]);
    qsort(v, 0, 9);
    for(int i = 0; i < 10; i++)
        printf(i != 9 ? "%d " : "%d\n", v[i]);
}
