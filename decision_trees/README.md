## Decision Trees

Implement using x86 assembly a function ready to be called from C with prototype:

```c
int traverse_tree(tnode* tree, int features[]);
```

which is going to classify test sample made of binary-feature array `features[]`, returning 0 or 1 for each feature according to given decision tree `tnode* tree`.

Assume that `tnode` type is defined in C language as follows:

```c
typedef struct tree_node {
    struct tree_node *no_child;
    struct tree_node *yes_child;
    int data; // feature index (non leaf)
    // class index (leaf)
} tnode;
```