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

struct point makepoint(int x, int y) {
    struct point temp;
    temp.x = x;
    temp.y = y;
    return temp;
}

#define XMAX 1366
#define YMAX 768

struct point addpoint(struct point p1, struct point p2) {
    p1.x += p2.x;
    p1.y += p2.y;
    return p1;
}

int ptinrect(struct point p, struct rect r) {
    return p.x >= r.pt1.x && p.x <= r.pt2.x && p.y >= r.pt1.y && p.y <= r.pt2.y;
}

#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) > (b) ? (a) : (b))

struct rect canonrect(struct rect r) {
    struct rect t;
    t.pt1.x = min(r.pt1.x, r.pt2.x);
    t.pt1.y = min(r.pt1.y, r.pt2.y);
    t.pt2.x = max(r.pt1.x, r.pt2.x);
    t.pt2.y = max(r.pt1.y, r.pt2.y);
    return t;
}

void display_point(struct point p) {
    printf("(%d, %d)", p.x, p.y);
}

void display_rect(struct rect r) {
    printf("[");
    display_point(r.pt1);
    printf(", ");
    display_point(r.pt2);
    printf("]");
}

int main() {
    struct rect screen;
    struct point middle;
    screen.pt1 = makepoint(0, 0);
    screen.pt2 = makepoint(XMAX, YMAX);
    middle = makepoint((screen.pt1.x+screen.pt2.x)/2, (screen.pt1.y+screen.pt2.y)/2);
    display_rect(screen);
    putchar('\n');
    display_point(middle);
    putchar('\n');
    struct rect r;
    r.pt1 = makepoint(15, 3);
    r.pt2 = makepoint(4, 24);
    display_rect(r);
    putchar('\n');
    struct rect nr = canonrect(r);
    display_rect(nr);
    return 0;
}
