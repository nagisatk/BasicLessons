#ifndef _HASH_TABLE_H__
#define _HASH_TABLE_H__
typedef struct hash_table hash_table;

hash_table *ht_create_hash_table();
void ht_free_hash_table(hash_table *table);

void ht_insert(hash_table *table, char *key, void *value);
void ht_delete(hash_table *table, char *key);
void *ht_search(hash_table *table, char *key);

#endif