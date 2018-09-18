#include "svpng.inc"

void test_rgb(void) {
    unsigned char rgb[500 * 500 * 3], *p = rgb;
    unsigned x, y;
    FILE *fp = fopen("rgb.png", "wb");
    for (y = 0; y < 500; y++)
        for (x = 0; x < 500; x++) {
            *p++ = (unsigned char)x;    /* R */
            *p++ = (unsigned char)y;    /* G */
            *p++ = 128;                 /* B */
        }
    svpng(fp, 500, 500, rgb, 0);
    fclose(fp);
}

void test_rgba(void) {
    unsigned char rgba[500 * 500 * 4], *p = rgba;
    unsigned x, y;
    FILE* fp = fopen("rgba.png", "wb");
    for (y = 0; y < 500; y++)
        for (x = 0; x < 500; x++) {
            *p++ = (unsigned char)x;                /* R */
            *p++ = (unsigned char)y;                /* G */
            *p++ = 128;                             /* B */
            *p++ = (unsigned char)((x + y) / 2);    /* A */
        }
    svpng(fp, 500, 500, rgba, 1);
    fclose(fp);
}

int main(void) {
    test_rgb();
    test_rgba();
    return 0;
}
