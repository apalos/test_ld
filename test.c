#include <stdio.h>

extern void lost(void);
void __attribute__((__weak__)) lost(void)
{
}

int main(void)
{
	lost();
	printf("Done\n");
}
