/*
 * This code is used for the reverse engineering malicous code
 * presentation.
 * https://docs.google.com/presentation/d/1iaBToAf3TLl-fapybHYfTjRzEvJ7Bfo6h4K2BEZcLSc/edit?usp=sharing
 */



#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int my_add(int a, int b) {
	int c;

	c=a+b;

	return c;
}

int main(int argc, char *argv[]) {

	int i;
	int j;
	int sum;

	i=1;
	j=2;
	sum = my_add(i,j);
	printf("sum = %d\n",sum);


	return 0;

}



