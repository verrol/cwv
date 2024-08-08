#include <stdio.h>

int mirror_bits(int val);
void printbits(int val);

int main(int argc, char const *argv[])
{
  int val = 0x5;

  printf("Enter a number: ");
  scanf("%d", &val);
  printf("\nYou entered the number: %d\n", val);

  printbits(val);
  int res = mirror_bits(val);
  printbits(res);
  return 0;
}

int mirror_bits(int val)
{
  if (!val)
    return 0;

  char bit = 0;
  int res = 0;
  int count = 0;
  while (val)
  {
    bit = val & 0x1;
    res = (res << 1) | bit;
    val = val >> 1;
    count++;
  }

  for (; count < 32; count++)
  {
    res = res << 1;
    count++;
  }
  return res;
}

void printbits(int val)
{
#define BIT_COUNT (sizeof(int) * 8)

  int i = 0;
  while (val)
  {
    printf("%d", (val & 0x80000000) ? 1 : 0);
    val <<= 1;
    ++i;
  }

  for (int j = i; j < BIT_COUNT; ++j)
  {
    putchar('0');
  }
  putchar('\n');
}
