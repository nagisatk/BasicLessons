#include<stdio.h>

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

int main() {
    int v[] = {2, 3, 5, 6, 10, 11, 13, 34, 89};
    printf("%d\n", binsearch(10, v, 9));
}
