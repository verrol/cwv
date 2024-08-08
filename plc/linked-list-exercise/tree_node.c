#include <tree_node.h>
#include <stdlib.h>
#include <stdio.h>

static void node_free(TreeNode_t* node);
static void print_inorder(const TreeNode_t* node);
static TreeNode_t* tree_to_array(Tree_t* tree);
inline TreeNode_t* left_most(TreeNode_t* node);


void tree_balance(Tree_t* tree)
{
  TreeNode_t* elements = tree_to_array(tree);

  if(!elements){
    return;
  }

  free(elements);
}

TreeNode_t* tree_to_array(Tree_t* tree)
{
  if(!tree){
    return 0;
  }

  TreeNode_t** elements = malloc(sizeof(TreeNode_t*)*tree->size);

  if(!elements){
    return 0;
  }

  int i;

  TreeNode_t* node = tree->root;
  TreeNode_t* parent = 0; // node->parent;
  TreeNode_t* left = 0;
  TreeNode_t* right = 0;

  while(node != parent){
    left = left_most(node);
    if(left){
      printf("%d,", left->val);
    }

    // elements[i++] = node;
    printf("%d,", node->val);

    if(node->right){
      parent = node;
      node = parent->right;
    }
    else{
      parent = node->parent;
      node = parent->right;
    }
  }

  return elements;
}

inline TreeNode_t* left_most(TreeNode_t* node){
  if(!node->left){
    return 0;
  }

  while(node->left){
    node = node->left;
  }

  return node;
}

static void insert(TreeNode_t* parent, TreeNode_t* node)
{
  TreeNode_t* place = parent;
  TreeNode_t* temp;

  while(place){
    if(place->val < node->val){
      temp = place->right;
      if(!temp){
        place->right = node;
        break;
      }
    }
    else{
      temp = place->left;
      if(!temp){
        place->left = node;
        break;
      }
    }
    place = temp;
  }

  node->parent = temp;
}

void tree_insert(Tree_t* tree, int v)
{
  if(!tree)
  {
    return;
  }

  TreeNode_t* node = malloc(sizeof(TreeNode_t));
  if(!node){
    return;
  }

  node->val = v;
  node->left = node->right = node->parent = 0;

  if(tree->root){
    insert(tree->root, node);
  }
  else{
    tree->root = node;
  }
}

void print_inorder(const TreeNode_t* node)
{
  if(node)
  {
    print_inorder(node->left);
    printf("%d,", node->val);
    print_inorder(node->right);
  }
}

void tree_dump(Tree_t* tree)
{
  if(!tree || !tree->root){
    printf("Tree_t is empty...\n");
    return;
  }

  print_inorder(tree->root);
  printf("\n");
}

void node_free(TreeNode_t* node)
{
  if(!node) return;

  node_free(node->left);
  node_free(node->right);
  free(node);
}

void tree_destroy(Tree_t* tree)
{
  if(!tree || !tree->root){
    return;
  }

  node_free(tree->root);
  tree->root = 0;
  tree->size = 0;
  free(tree);
}

Tree_t* tree_create()
{
  Tree_t* t = malloc(sizeof(TreeNode_t));
  t->root = 0;
  t->size = 0;
  return t;
}
