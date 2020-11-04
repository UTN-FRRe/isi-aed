#include <stdio.h>

void hanoi(int n,int com, int aux, int fin);

void main(void){
	
	char com='A';
	char aux='B';
	char fin='C';

	int n;

	printf("\nN£mero de discos: ");
	scanf("%d",&n);
	fflush(stdin);

	printf("\n\nLos movimientos a realizar son: \n");
	hanoi(n,com,aux,fin);

}

 
void hanoi(int n,int com, int aux, int fin){

	if(n == 1){

		printf("%c->%c\n", com, fin);

	}

	else {

		hanoi(n-1, com, fin, aux);

		printf("%c->%c\n", com, fin);

		hanoi(n-1, aux, com, fin);

	}

}