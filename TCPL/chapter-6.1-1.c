#include<stdio.h>
#include<math.h>

struct point {
    int x;
    int y;
};

struct rect {
    struct point pt1;
    struct point pt2;
};

int main() {
    struct point pt = {3, 4};
    double dist = sqrt((double)pt.x*pt.x + (double)pt.y*pt.y);
    printf("%lf\n", dist);
    struct rect screen = { {0, 0}, {1366, 768}};
    printf("%d\n", (screen.pt1.x-screen.pt2.x)*(screen.pt1.y-screen.pt2.y));
    return 0;
}
