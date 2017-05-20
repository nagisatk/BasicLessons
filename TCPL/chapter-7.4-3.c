#include<stdio.h>

int getline(char s[], int lim) {
    int c, i;
    for (i = 0; i < lim - 1 && (c = getchar()) != EOF && c != '\n'; i++)
        s[i] = c;
    if (c == '\n') {
        s[i] = c;
        ++i;
    }
    s[i] = '\0';
    return i;
}

int main() {
    char line[20], monthname[10];
    int day, month, year;
    while(getline(line ,sizeof(line)) > 0) {
        if(sscanf(line, "%d %s %d", &day, monthname, &year) == 3)
            printf("valid: %s\n", line);
        else if(sscanf(line, "%d/%d/%d", &month, &day, &year) == 3)
            printf("valid: %s\n", line);
        else
            printf("invalid: %s\n", line);
    }
}
