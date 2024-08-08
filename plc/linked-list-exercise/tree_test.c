#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <tree_node.h>

int main (int argc, char const* argv[])
{
  Tree_t* tree = tree_create();
  printf("Testing Tree_t...%p\n", tree);
  tree_dump(tree);

  srand(time(NULL));
  int i;

  printf("DEBUG: Inserting values: ");
  int v;
  for(i = 0; i < 20; ++i){
    v = rand() % 50;
    printf("%d,", v);
    tree_insert(tree, v);
  }
  putchar('\n');

  tree_dump(tree);
  tree_balance(tree);
  tree_destroy(tree);
  return 0;
}
