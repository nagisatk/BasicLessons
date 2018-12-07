#include "hashtable.h"
#include "prime.h"

#include <stdlib.h>
#include <string.h>

typedef struct kv {
    char *key;
    void *value;
    struct kv *next;
} kv;

typedef struct hash_table {
    struct kv **kvs;
    unsigned cnt;
    unsigned cap;
} hash_table;

#define ht_load(ht) (((ht)->cnt * 100) / (ht)->cap)

static unsigned times33(const char *key) {
    unsigned hash = 0;
    while (*key) {
        hash = (hash << 5) + hash + *key++;
    }
    return hash;
}

static unsigned ht_get_hash(const char *key, const unsigned sz) {
    unsigned h = times33(key) % sz;
    return h;
}

static void *packaged_malloc(size_t sz) {
    void *p = malloc(sz);
    if (p == NULL) {
        exit(1);
    }
    memset(p, 0, sz);
    return p;
}

static char *malloc_string_with_len(int len) {
    return packaged_malloc(len + 1);
}

static void ht_free_kv(struct kv *p) {
    if (p->next != NULL) {
        ht_free_kv(p->next);
    }
    free(p->key);
    free(p->value);
    free(p);
}

void ht_free_hash_table(struct hash_table *t) {
    if (t->cnt > 0) {
        for (int i = 0; i < t->cap; i++)
            if (t->kvs[i] != NULL)
                ht_free_kv(t->kvs[i]);
    }
    free(t->kvs);
    free(t);
}

static struct kv *ht_create_kv(const char *key, void *value) {
    struct kv *p = (struct kv *)packaged_malloc(sizeof(struct kv));
    int len = strlen(key);
    p->key = malloc_string_with_len(len);
    strcpy(p->key, key);
    p->value = value;
    p->next = NULL;
    return p;
}

static struct kv **ht_create_kvs(unsigned sz) {
    return packaged_malloc(sizeof(struct kv *) * sz);
}

static hash_table *ht_create_sized_hash_table(unsigned sz) {
    hash_table *t = packaged_malloc(sizeof(struct hash_table));
    t->kvs = ht_create_kvs(sz);
    t->cap = sz;
    t->cnt = 0;
    return t;
}

#define HT_BASE_SIZE (23)

hash_table *ht_create_hash_table() {
    return ht_create_sized_hash_table(HT_BASE_SIZE);
}

static void ht_kv_append(struct kv *head, struct kv *item) {
    while (head->next != NULL) {
        head = head->next;
    }
    head->next = item;
}

static void ht_insert_item(hash_table *t, struct kv *item) {
    unsigned index = ht_get_hash(item->key, t->cap);
    if (t->kvs[index] == NULL) {
        t->kvs[index] = item;
    } else {
        ht_kv_append(t->kvs[index], item);
    }
    t->cnt++;
}

static struct hash_table *ht_resize(hash_table *t, const unsigned new_size) {
    struct kv **kvs = t->kvs;
    unsigned cap = t->cap;
    unsigned cnt = t->cnt;
    t->kvs = ht_create_kvs(new_size);
    t->cnt = 0;
    t->cap = new_size;
    for (int i = 0; i < cap; i++) {
        if (kvs[i] != NULL) {
            struct kv *item = kvs[i];
            struct kv *tmp;
            do {
                tmp = item->next;
                item->next = NULL;
                ht_insert_item(t, item);
            } while ((item = tmp) != NULL);
            kvs[i] = NULL;
        }
    }
    free(kvs);
    return t;
}

static struct hash_table *ht_resize_up(hash_table *t) {
    return ht_resize(t, next_prime(t->cap * 2));
}

static struct hash_table *ht_resize_down(hash_table *t) {
    return ht_resize(t, next_prime(t->cap / 2));
}

#define UP_LOAD (70)

void ht_insert(hash_table *t, char *key, void *value) {
    unsigned index = ht_get_hash(key, t->cap);
    struct kv *tail = NULL, *iter = t->kvs[index];
    if (iter != NULL) {
        do {
            if (strcmp(iter->key, key) == 0) {
                free(iter->value);
                iter->value = value;
                return;
            }
            tail = iter;
            iter = iter->next;
        } while (iter != NULL);
    }

    struct kv *item = ht_create_kv(key, value);
    if (tail == NULL) {
        t->kvs[index] = item;
    } else {
        tail->next = item;
    }
    t->cnt++;

    if (ht_load(t) > UP_LOAD) {
        t = ht_resize_up(t);
    }
}

#define DOWN_LOAD (10)

void ht_delete(hash_table *t, char *key) {
    unsigned hash = ht_get_hash(key, t->cap);
    if (t->kvs[hash] != NULL) {
        struct kv *item = t->kvs[hash];
        if (strcmp(key, item->key) == 0) {
            t->kvs[hash] = item->next;
            item->next = NULL;
            ht_free_kv(item);
            t->cnt--;
            return;
        }
        struct kv *prev = item;
        while ((item = item->next) != NULL) {
            if (strcmp(key, item->key) == 0) {
                prev->next = item->next;
                item->next = NULL;
                ht_free_kv(item);
                t->cnt--;
                return;
            }
            prev = item;
        }
    }
}

void *ht_search(hash_table *t, char *key) {
    unsigned hash = ht_get_hash(key, t->cap);
    if (t->kvs[hash] != NULL) {
        struct kv *item = t->kvs[hash];
        do {
            if (strcmp(key, item->key) == 0) {
                return item->value;
            }
        } while ((item = item->next) != NULL);
    }
    return NULL;
}
