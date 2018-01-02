#include <stdio.h>
#include <stdlib.h>

#ifdef _WIN32
#include <string.h>

/* Declare a buffer for user input of size 2048 */
static char buffer[2048];

char* readline(char *prompt) {
    fputs(prompt, stdout);
    fgets(buffer, 2048, stdin);
    char *cpy = malloc(strlen(buffer) + 1);
    strcpy(cpy, buffer);
    cpy[strlen(cpy) - 1] = '\0';
    return cpy;
}

// Fake add_history function
void add_history(char *unused) {}

// Otherwise include the editline headers

#else
#include <editline/readline.h>
#include <editline/history.h>
#endif


int main(int argc, char** argv) {
    // print version and Exit information
    puts("Lispy version 0.0.0.0.1");
    puts("Press Ctrl+c to Exit\n");

    // In a never ending loop
    while(1) {
        char *input = readline("lisp> ");
        add_history(input);
        printf("No you're a %s\n", input);
        free(input);
    }
    return 0;
}