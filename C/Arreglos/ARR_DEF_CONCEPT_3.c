#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 

void CARGA_TECLADO_VECTOR(int *v) {
	int i;

	//printf("%p\n", v);

	for(i = 0; i < 10; ++i) {		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
		}
}


int main() {	
	int i;
	int V[10];
	
	// Uso el tiempo actual para el generador de numeros 
    srand(time(0)); 

	CARGA_TECLADO_VECTOR(V);

	printf(" ---------------------\n");
	printf(" ----- RESULTADOS ----\n");
	printf(" ---------------------\n");

	printf("Vector: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	return 0;
}

