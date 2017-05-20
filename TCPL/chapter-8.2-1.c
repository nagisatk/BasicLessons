#if __linux
#include <sys/syscall.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <windows.h>
#endif

#define BUFSIZ 1024

int main() {
    char buf[BUFSIZ];
    int n;

    while((n = read(0, buf,BUFSIZ)) > 0)
        write(1, buf, n);
    return 0;
}
