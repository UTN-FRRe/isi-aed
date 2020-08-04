#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 

void CARGA_TECLADO_VECTOR(int v[10]) {
	int i;

	//printf("%p\n", v);

	for(i = 0; i < 10; ++i) {		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
		}
}

void CARGA_TECLADO_MATRIZ(int m[5][5]) {
	int i, j;

	for(i = 0; i < 5; ++i) {
		for(j = 0; j < 5; ++j) {
			//Genero numeros entre 0 y 49
			m[i][j] = rand() % 50;
			}
		}
}

int main() {	
	int i, j;
	int V[10];
	int M[5][5];

	// Uso el tiempo actual para el generador de numeros 
    srand(time(0)); 

	CARGA_TECLADO_VECTOR(V);

	CARGA_TECLADO_MATRIZ(M);

	printf(" ---------------------\n");
	printf(" ----- RESULTADOS ----\n");
	printf(" ---------------------\n");

	printf("Vector: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	printf("\n---------------------\n");
	printf("Matriz: \n");

	for(i = 0; i < 5; ++i) {
		for(j = 0; j < 5; ++j) {
			printf("%d ", M[i][j]);
		}
		printf("\n");
	}

	//getchar();

	return 0;
}


