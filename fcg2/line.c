#include "svpng.inc"

unsigned char* white500()
{
    static unsigned char t[500 * 500 * 4];
    unsigned char *p2 = t;
    for (unsigned y = 0; y < 500; y++) {
        for (unsigned x = 0; x < 500; x++) {
            *p2++ = (unsigned char)~0;                /* R */
            *p2++ = (unsigned char)~0;                /* G */
            *p2++ = (unsigned char)~0;                /* B */
            *p2++ = (unsigned char)~0;                /* A */
        }
    }
    // printf("whit500: %x\n", (unsigned int)t);
    return t;
}

void png500(unsigned char* img)
{
    FILE* fp = fopen("white.png", "wb");
    svpng(fp, 500, 500, img, 1);
    fclose(fp);
}

void draw(unsigned char *img, unsigned x, unsigned y)
{
    img += (y * 500 + x) * 4;
    // printf("draw: %x\n", (unsigned int)img);
    *img++ = (unsigned char)0;
    *img++ = (unsigned char)0;
    *img++ = (unsigned char)0;
}

void swap(unsigned *a, unsigned *b) {
    unsigned t = *a;
    *a = *b;
    *b = t;
}

void line(unsigned char* img, unsigned x0, unsigned y0, unsigned x1, unsigned y1)
{
    if (x0 > x1) {
        swap(&x0, &x1);
        swap(&y0, &y1);
    }
    printf("%d, %d, %d, %d\n", x0, y0, x1, y1);
    // f(x, y) = (y0 - y1)x + (x1 - x0)y + x0*y1 - x1*y0 = 0
    // 2f(x, y) = 0
    // k = (y1 - y0) / (x1 - x0)
    // assume 0 < k <= 1, y1 > y0
    // (y1 >= y0) and (x1 - x0 > y1 - y0)
    int flag = 0;
    if (!((y1 >= y0) && (x1 - x0 > y1 - y0))) {
        swap(&x0, &y0);
        swap(&x1, &y1);
        flag = 1;
    }
    unsigned y = y0;
    unsigned x = x0;
    int d = 2 * (y0 - y1) * (x0 + 1) + (x1 - x0) * (2 * y0 + 1) + 2 * x0 * y1 - 2 * x1 * y0;
    for (; x < x1; x++) {
        if (flag)
            draw(img, y, x);
        else
            draw(img, x, y);
        // d = f(x+1, y+0.5) < 0
        // f(x+1, y) = f(x, y) + (y1 - y0)
        // f(x+1, y+1) = f(x, y) + (y1 - y0) + (x0 - x1)
        // f(x+1, y+0.5) = (y0 - y1)(x0 + 1) + (x1 - x0)(y0 + 0.5) + x0y1 - x1y0
        // d = 2*f(x+1, y+0.5) =
        //      2(y0 - y1)(x0 + 1) + (x1 - x0)(2y0 + 1) + 2x0y1 - 2x1y0
        if (d < 0) {
            y++;
            d += 2 * (x1 - x0) + 2 * (y0 - y1);
        } else {
            d += 2 * (y0 - y1);
        }
    }
}

int main()
{
    unsigned char* t = white500();
    line(t, 50, 150, 150, 100);
    png500(t);
    return 0;
}