#include <stdio.h>
#include <stdlib.h> 

void CARGA_TECLADO_VECTOR(int v[5]) {
	int i;

	for(i = 0; i < 5; ++i) {
		printf("Ingrese valor para posicion %d :", i+1);
		scanf("%d", &v[i]);		
		}
}

void CARGA_TECLADO_MATRIZ(int m[3][3]) {
	int i, j;

	for(i = 0; i < 3; ++i) {
		for(j = 0; j < 3; ++j) {
			printf("Ingrese valor para fila %d -- col %d :", i+1, j+1);
			scanf("%d", &m[i][j]);			
			}
		}
}

int main() {	
	int i, j;
	int V[5];
	int M[3][3];

	CARGA_TECLADO_VECTOR(V);

	CARGA_TECLADO_MATRIZ(M);

	printf(" ---------------------\n");
	printf(" ----- RESULTADOS ----\n");
	printf(" ---------------------\n");

	printf("Vector: \n");

	//valores de los elementos del vector
	for(i = 0; i < 5; ++i) {
		printf("%d ", V[i]);
	}

	printf("\n---------------------\n");
	printf("Matriz: \n");

	for(i = 0; i < 3; ++i) {
		for(j = 0; j < 3; ++j) {
			printf("%d ", M[i][j]);
		}
		printf("\n");
	}

	return 0;
}


