#include<stdio.h>
#include<time.h>
#define MAX_ELEMENT 500000

int binsearch(int x, int v[], int n) {
    int low, high, mid;
    low = 0;
    high = n - 1;
    while(low <= high) {
        mid = (low + high) / 2;
        if(x < v[mid])
            high = mid - 1;
        else if(x > v[mid])
            low = mid + 1;
        else
            return mid;
    }
    return -1;
}

int binsearch2(int x, int v[], int n) {
    int low = 0;
    int high = n - 1;
    while(low < high) {
        int mid = (low + high) / 2;
        // printf("%d %d %d\n", high, mid, low);
        if(v[mid] >= x)
            high = mid;
        else
            low = mid + 1;
    }
    if(v[low] == x)
        return low;
    else
        return -1;
}

int main() {
    int v[MAX_ELEMENT];
    for(int i = 0; i < MAX_ELEMENT; i ++)
        v[i] = i;
    int i;
    clock_t time_taken;
    for(i = 0, time_taken = clock(); i < 3000000; i ++)
        binsearch(i, v, MAX_ELEMENT);
    time_taken = clock() - time_taken;
    printf("%lu, %lu\n", time_taken, time_taken / CLOCKS_PER_SEC);
    for(i = 0, time_taken = clock(); i < 3000000; i ++)
        binsearch2(i, v, MAX_ELEMENT);
    time_taken = clock() - time_taken;
    printf("%lu, %lu\n", time_taken, time_taken / CLOCKS_PER_SEC);
}
