#include "pch.h"
#include <iostream>
#include <stdio.h>

extern "C" void STRCOPYASM(char* p1, char *p2, int l);

int main()
{
	char a[80] = "1234567890";
	char b[80] = { 0 };

	printf("Source:\n%s\n%s\n\n", a, b);

	STRCOPYASM(a, a+5, 4);

	printf("Result:\n%s\n%s\n\n", a, b);

	getchar();
	return 0;
}