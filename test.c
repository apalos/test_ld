#include <stdio.h>

void  __attribute__((__weak__)) lost(void)
{
}
//extern void lost(void);

int main(void)
{
	lost();
	printf("Done\n");
}
