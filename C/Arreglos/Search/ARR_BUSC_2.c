//BUSQUEDA LINEAL CON CENTINELA

#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 
#include <stdbool.h> 

int const N = 10;
int search;


void CARGA_VECTOR(int *v) 
{
	int i;

	//printf("%p\n", v);

	for(i = 0; i < N; ++i) 
	{		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
	}
}

void ORDENAR_VECTOR(int *v) 
{
	int j, aux;

	//printf("%p\n", v);

	bool cambios = true;

	while (cambios == true)
	{	
		//Esto se usa para la proxima vuelta, dentro del ciclo		
		cambios = false;

		for(j = 0; j < N; ++j) 
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

void BUSCAR_EN_VECTOR(int *v, int pSearch) 
{
	int j;

	j = 0;

	while (j < N && pSearch != v[j])
	{			
		j++;
	}

	if (pSearch == v[j]) 
		printf("%s %d\n", "Esta en la posicion: ", j+1);
	else
		printf("%s\n", "No se encuentra en el vector el valor buscado.");
}

int main() 
{	
	int i;
	int V[N];

	// Uso el tiempo actual para el generador de numeros 
    srand(time(0)); 

	CARGA_VECTOR(V);

	printf(" ---------------------\n");
	printf(" ----- RESULTADOS ----\n");
	printf(" ---------------------\n");

	printf("Vector origen: \n");

	//valores de los elementos del vector
	for(i = 0; i < N; ++i) {
		printf("%d ", V[i]);
	}

	printf("\n---------------------\n");

	//ORDENAR_VECTOR(V);
	//printf("Vector ordenado: \n");

	//valores de los elementos del vector
	/*
	for(i = 0; i < N; ++i) {
		printf("%d ", V[i]);
	}
	*/

	fflush(stdin);
	printf("Ingrese valor buscar: ");
	scanf("%d", &search);		

	BUSCAR_EN_VECTOR(V, search);

	return 0;
}
