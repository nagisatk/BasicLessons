#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct nlist {
    struct nlist *next;
    char *name;
    char *defn;
};

#define HASHSIZE 101
static struct nlist *hashtab[HASHSIZE];

unsigned hash(char *s) {
    unsigned hashval;
    for(hashval = 0; *s != '\0'; s++)
        hashval = *s + 31 * hashval;
    return hashval % HASHSIZE;
}


struct nlist *lookup(char *s) {
    struct nlist *np;
    for(np = hashtab[hash(s)]; np != NULL; np = np->next)
        if(strcmp(s, np->name) == 0)
            return np;
    return NULL;
}

struct nlist *install(char *name, char *defn) {
    struct nlist *np;
    unsigned hashval;
    if((np = lookup(name)) == NULL) {
        np = (struct nlist *)malloc(sizeof(*np));
        if(np == NULL || (np->name = strdup(name)) == NULL)
            return NULL;
        hashval = hash(name);
        np->next = hashtab[hashval];
        hashtab[hashval] = np;
    } else
        free((void *) np->defn);
    if((np->defn = strdup(defn)) == NULL)
        return NULL;
    return np;
}

void display() {
    int i = 0;
    struct nlist *np;
    while (i < HASHSIZE) {
        np = hashtab[i];
        while (np != NULL) {
            printf("%s %s\n", np->name, np->defn);
            np = np->next;
        }
        i++;
    }
}

void display_nlist(struct nlist *np) {
        do {
            printf("%s %s\n", np->name, np->defn);
            np = np->next;
        } while(np != NULL);
}

int main() {
    struct nlist *np;
    np = install("name", "kuma");
    display_nlist(np);
    install("name1", "kuma1");
    install("name2", "kuma2");
    install("name3", "kuma3");
    install("name4", "kuma4");
    install("name5", "kuma5");
    install("name6", "kuma6");
    install("name7", "kuma7");
    install("name8", "kuma8");
    install("name9", "kuma9");
    install("name0", "kuma0");
    display();
}
