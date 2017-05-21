/* 最大子序列和问题的解 */

#include<stdio.h>
#include<time.h>

// Algorithm 1
int MaxSubsequenceSum1(const int A[], int N) {
    int thissum, maxsum, i, j, k;
    
    maxsum = 0;
    for(i = 0; i < N; i++)
        for(j=i; j < N; j++) {
            thissum = 0;
            for(k = i; k <= j; k++)
                thissum += A[k];
            
            if(thissum > maxsum)
                maxsum = thissum;
        }
    return maxsum;
}

int MaxSubsequenceSum2(const int a[], int n) {
    int thissum, maxsum, i, j;
    maxsum = 0;
    for(i = 0; i < n; i++) {
        thissum = 0;
        for(j = i; j < n; j ++) {
            thissum += a[j];
            if(thissum > maxsum)
                maxsum = thissum;
        }
    }
    return maxsum;
}

int Max3(int a, int b, int c) {
    a = a > b ? a : b;
    return a > c ? a : c;
}

int MaxSubSum(const int a[], int left, int right) {
    int maxleftsum, maxrightsum;
    int maxleftbordersum, maxrightbordersum;
    int leftbordersum, rightbordersum;
    int center, i;
    if(left == right)
        if(a[left] > 0)
            return a[left];
        else
            return 0;
    center = (left + right) / 2;
    maxleftsum = MaxSubSum(a, left, center);
    maxrightsum = MaxSubSum(a, center + 1, right);

    maxleftbordersum = leftbordersum = 0;
    for(i = center; i >= left; i--) {
        leftbordersum += a[i];
        if(leftbordersum > maxleftbordersum)
            maxleftbordersum = leftbordersum;
    }
    maxrightbordersum = rightbordersum = 0;
    for(i = center + 1; i <= right; i++) {
        rightbordersum += a[i];
        if(rightbordersum > maxrightbordersum)
            maxrightbordersum = rightbordersum;
    }
    return Max3(maxleftsum, maxrightsum, maxleftbordersum + maxrightbordersum);
}

int MaxSubsequenceSum3(const int a[], int n) {
    return MaxSubSum(a, 0, n-1);
}

int MaxSubsequenceSum4(int a[], int n) {
    int thissum, maxsum, j;
    thissum = maxsum = 0;
    for(j = 0; j < n; j++) {
        thissum += a[j];
        if(thissum > maxsum)
            maxsum = thissum;
        else if(thissum < 0)
            thissum = 0;
    }
    return maxsum;
}

#define NUMS 10000
int main() {
    int a[NUMS];
    FILE *rf = fopen("random.txt", "r");
    for(int i = 0; i < NUMS; i++) {
        fscanf(rf, "%d ", &a[i]);
    }
    clock_t start, end;
    start = clock();
    int max = MaxSubsequenceSum4(a, NUMS);
    end = clock();
    printf("max sum is %d\n, cost time is %10.6f\n", max, (double)(end - start));
    start = clock();
    max = MaxSubsequenceSum2(a, NUMS);
    end = clock();
    printf("max sum is %d\n, cost time is %10.6f\n", max, (double)(end - start));
}
