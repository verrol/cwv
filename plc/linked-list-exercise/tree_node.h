#ifndef __TREE_NODE_H_
#define __TREE_NODE_H_

typedef struct TreeNode{
  struct TreeNode* left;
  struct TreeNode* right;
  struct TreeNode* parent;
  int val;
}TreeNode_t;

typedef struct Tree{
  TreeNode_t *root;
  unsigned int size;
}Tree_t;

Tree_t* tree_create();
void tree_destroy(Tree_t* tree);

void tree_insert(Tree_t* tree, int v);
void tree_balance(Tree_t* tree);
void tree_dump(Tree_t* tree);

inline unsigned int tree_size(Tree_t* tree)
{
  if(!tree){
    return 0;
  }

  return tree->size;
}

#endif // __TREE_NODE_H_
