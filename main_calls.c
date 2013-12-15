/*
 * This code is used for the reverse engineering malicous code
 * presentation.
 * https://docs.google.com/presentation/d/1iaBToAf3TLl-fapybHYfTjRzEvJ7Bfo6h4K2BEZcLSc/edit?usp=sharing
 */



#include <stdio.h>

int myadd(int a, int b) {
	int c;
	c=a+b;
	return c;
}

int main(int argc, char *argv[]) {

	int i = 1;
	int j = 2;
	int sum;

	sum = myadd(i,j);
	printf("sum = %d\n",sum);

	return sum;
}



