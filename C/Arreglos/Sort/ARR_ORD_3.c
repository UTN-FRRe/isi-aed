//Insertion Sort

#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 


void CARGA_VECTOR(int *v) 
{
	int i;

	//printf("%p\n", v);

	for(i = 0; i < 10; ++i) {		
		//Genero numeros entre 0 y 49
		v[i] = rand() % 50;
		}
}


void ORDENAR_VECTOR(int *v) 
{
	int k, aux, j;  

    for (k = 1; k < 10; k++) 
    {  
        aux = v[k];  
        j = k - 1;  
  
        while (j >= 0 && v[j] > aux) 
        {  
            v[j + 1] = v[j];  
            j = j - 1;  
        }  
        
        v[j + 1] = aux;  
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

	printf("\n ---------------------\n");

	ORDENAR_VECTOR(V);

	printf("Vector ordenado: \n");

	//valores de los elementos del vector
	for(i = 0; i < 10; ++i) {
		printf("%d ", V[i]);
	}

	return 0;
}
