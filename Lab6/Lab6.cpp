#include "pch.h"
#include <iostream>
using namespace std;

extern "C" void p(int N, int *fkt);

int main()
{
	int z = 1, m = 5;
	p(m, &z);

	cout << m << "! = " << z << endl;
	system("pause");
	return 0;
}

