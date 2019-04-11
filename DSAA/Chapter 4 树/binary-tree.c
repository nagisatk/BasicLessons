#include "binary-tree.h"
#include <stdlib.h>
#include <stdio.h>

struct binary_tree {
    struct binary_tree *left;
    struct binary_tree *right;
    tree_value val;
};

binary_tree *make_empty(binary_tree *root) {
    if (root != NULL) {
        make_empty(root->left);
        make_empty(root->right);
        free(root);
    }
    return NULL;
}

binary_tree *find(tree_value val, binary_tree *tree) {
    if (tree == NULL)
        return NULL;

    if (val < tree->val)
        return find(val, tree->left);
    else if (val > tree->val)
        return find(val, tree->right);
    
    return tree;
}

binary_tree *find_min(binary_tree *tree) {
    if (tree == NULL)
        return NULL;
    if (tree->left == NULL)
        return tree;
    return find_min(tree->left);
}

binary_tree *find_max(binary_tree *tree) {
    if (tree == NULL)
        return NULL;
    if (tree->right == NULL)
        return tree;
    return find_max(tree->right);
}

static void error_exit(const char *err_msg) {
    printf("%s\n", err_msg);
    exit(1);
}

binary_tree *insert_value(tree_value x, binary_tree *tree) {
    if (tree == NULL) {
        // create and return a one-node tree
        tree = malloc(sizeof (struct binary_tree));
        if (tree == NULL) {
            error_exit("out of space");
        } else {
            tree->val = x;
            return tree;
        }
    }

    if (x < tree->val)
        return insert_value(x, tree->left);
    else if (x > tree->val)
        return insert_value(x, tree->right);
    // else x is in the tree already; we'll do nothing
    return tree;
}

binary_tree *delete_value(tree_value x, binary_tree *tree) {
    binary_tree *temp_cell;

    if (tree == NULL)
        error_exit("element not found.");
    
    if (x < tree->val)
        tree->left = delete_value(x, tree->right);
    else if (x > tree->val)
        tree->right = delete_value(x, tree->left);
    else if (tree->left && tree->right) {
        // two children

        // replace with smallest in right subtree
        temp_cell = find_min(tree->right);
        tree->val = temp_cell->val;
        tree->right = delete_value(tree->val, tree->right);
    } else {
        temp_cell = tree;
        if (tree->left == NULL) // also handle one children
            tree = tree->right;
        else if (tree->right == NULL) 
            tree = tree->left;
        free(temp_cell);
    }

    return tree;
}

