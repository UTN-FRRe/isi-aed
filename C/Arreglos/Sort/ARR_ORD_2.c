//Selection Sort

#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 

void Swap(int *a, int *b) 
{
   int temp = *a;
   *a = *b;
   *b = temp;
}

void CARGA_VECTOR(int *v) 
{
	int i;

	//printf("%p\n", v);

	for(i = 0; i < 10; ++i) 
	{		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
	}
}


void ORDENAR_VECTOR(int *v) 
{
	int j, k;

	for (j = 0; j < 9; j++)
	{

		int Min = j;
		
		//Busco un nuevo Min
		for (k = j + 1; k < 9; k++)
		{
			if (v[k] < v[Min])
			{
				Min = k;
			}
		}

		//Si encuentro un nuevo min lo cambio
		//if (Min != j) 
		//{
			Swap(&v[j], &v[Min]);
		//}
	}	
}


int main() 
{	
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

	ORDENAR_VECTOR(V);

	printf("Vector ordenado: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	return 0;
}
