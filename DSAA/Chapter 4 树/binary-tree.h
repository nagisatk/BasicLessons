#ifndef _BINARY_TREE_H__
#define _BINARY_TREE_H__

typedef int tree_value;

typedef struct binary_tree binary_tree;

binary_tree *make_empty(binary_tree *root);
binary_tree *find(tree_value val, binary_tree *tree);
binary_tree *find_max(binary_tree *tree);
binary_tree *find_min(binary_tree *tree);
binary_tree *insert_value(tree_value val, binary_tree *tree);
binary_tree *delete_value(tree_value val, binary_tree *tree);
tree_value retrieve(binary_tree *node);

#endif // !_BINARY_TREE_H__