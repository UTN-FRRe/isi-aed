//BUSQUEDA LINEAL CON CENTINELA

#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 
#include <stdbool.h> 

int const N = 20;
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
			//Comparo par de posiciones dentro del v
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
	int ini = 0;
  	int fin = N - 1;
  	int med = (ini+fin)/2;

	while (ini <= fin) 
	{
		if (v[med] < pSearch)
			ini = med + 1;
		else if (v[med] == pSearch) 
		{
			printf("%d se encontro en la posicion %d.\n", pSearch, med+1);
			//Dejo de buscar
			break;
		}
		else
	  		fin = med - 1;

	  	//Nuevo medio
		med = (ini + fin)/2;
	}

	if (ini > fin)
		printf("No se encontro %d no esta presente en el arreglo.\n", pSearch);
	
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

	ORDENAR_VECTOR(V);
	printf("Vector ordenado: \n");

	//valores de los elementos del vector
	for(i = 0; i < N; ++i) {
		printf("%d ", V[i]);
	}

	//Renglon espacio
	printf("\n---------------------\n");


	//Hago la busqueda
	fflush(stdin);
	printf("Ingrese valor buscar: ");
	scanf("%d", &search);		

	BUSCAR_EN_VECTOR(V, search);

	return 0;
}
