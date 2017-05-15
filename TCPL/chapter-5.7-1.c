#include<stdio.h>

static char daytab[2][13] = {
    { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 },
    { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
};


int day_of_year(int year, int month, int day) {
    int i, leap;
    leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
    for(i = 1; i < month; i ++)
        day += daytab[leap][i];
    return day;
}

int month_day(int year, int yearday, int *pmonth, int *pday) {
    int leap, i;
    leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
    for(i = 1; yearday > daytab[leap][i]; i ++)
        yearday -= daytab[leap][i];
    *pmonth = i;
    *pday = yearday;

}

int main() {
    int month = 0;
    int day   = 0;
    printf("2000/3/1 is %d(th) day in the year.\n", day_of_year(2000, 3, 1));
    printf("2001/3/1 is %d(th) day in the year.\n", day_of_year(2001, 3, 1));
    char *months[13] = {
        "", "Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."
    };
    
    month_day(2000, 62, &month, &day);
    printf("The 62th day in 2000 is on %s, %dth day.\n", months[month], day);
    month_day(2003, 62, &month, &day);
    printf("The 62th day in 2003 is on %s, %dth day.\n", months[month], day);
}
