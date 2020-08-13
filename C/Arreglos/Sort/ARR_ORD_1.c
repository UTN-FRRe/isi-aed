//Bubble Sort

#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 
#include <stdbool.h> 

void CARGA_VECTOR(int *v) {
	int i;

	//printf("%p\n", v);

	for(i = 0; i < 10; ++i) {		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
		}
}

void ORDENAR_VECTOR(int *v) {
	int j, aux;

	//printf("%p\n", v);

	bool cambios = true;

	while (cambios == true)
	{	
		//Esto se usa para la proxima vuelta, dentro del ciclo		
		cambios = false;

		for(j = 0; j < 9; ++j) 
		{		
			//Comparo par de posiciones dentro del array
			if (v[j] > v[j + 1])
			{	
				//Control los cambios
				//printf("SWAP %d %d \n", v[j], v[j + 1]);

				//Hago el intercambio
				aux = v[j];
				v[j] = v[j + 1];
				v[j + 1] = aux;

				//Cambio el valor de verdad
				cambios = true;				
			}
		}
		
		//Control los cambios
		//printf("Cambios luego del FOR: ... %d \n", cambios);

	}
}

void ORDENAR_VECTOR_2(int *v) {
	int j, k, aux;

	//printf("%p\n", v);

	for(k = 0; k < 9; ++k) 
	{
		for(j = 0; j < 9 - k; ++j) 
		{		
			//Comparo par de posiciones dentro del array
			if (v[j] > v[j + 1])
			{
				aux = v[j];
				v[j] = v[j + 1];
				v[j + 1] = aux;			
			}
		}

	}
}

void ORDENAR_VECTOR_3(int *v) {
	int j, aux;

	//printf("%p\n", v);

	bool cambios = true;

	while (1)
	{	
		//Esto se usa para la proxima vuelta, dentro del ciclo		
		cambios = false;

		for(j = 0; j < 9; ++j) 
		{		
			//Comparo par de posiciones dentro del array
			if (v[j] > v[j + 1])
			{	
				//Control los cambios
				//printf("SWAP %d %d \n", v[j], v[j + 1]);

				//Hago el intercambio
				aux = v[j];
				v[j] = v[j + 1];
				v[j + 1] = aux;

				//Cambio el valor de verdad
				cambios = true;				
			}
		}

		if (!cambios) 
		{
			break;
		}

		//Control los cambios
		//printf("Cambios luego del FOR: ... %d \n", cambios);

	}
}


int main() {	
	int i;
	int V[10];

	// Uso el tiempo actual para el generador de numeros 
    srand(time(0)); 

	CARGA_VECTOR(V);

	printf(" ---------------------\n");
	printf(" ----- RESULTADOS ----\n");
	printf(" ---------------------\n");

	printf("Vector origen: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	printf("\n---------------------\n");

	ORDENAR_VECTOR_3(V);

	printf("Vector ordenado: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	return 0;
}


