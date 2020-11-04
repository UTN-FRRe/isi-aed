#include <stdio.h>
#include <stdlib.h> 
#include <time.h> 


#define TOPE 5 

void mostrarVector(int *v) {
    int i;

    printf("Vector cargado: \n");

    //valores de los elementos del vector
    for(i = 0; i < TOPE; ++i) {
        printf("%d ", v[i]);
    }

    printf("\n*****************************\n");
}

//Alternativa de recorrido - Usando recursividad
void mostrarVector_Recur(int *v, int indice) {

    if (indice == TOPE - 1){

        printf("Elemento: %d - Indice: %d \n", v[indice], indice);

    }
    else
    {        
        
        printf("Elemento: %d - Indice: %d \n", v[indice], indice);

        mostrarVector_Recur(v, indice + 1);
        

    }        
}

void cargarVector(int *v) {
    int i;

    //printf("%p\n", v);

    for(i = 0; i < TOPE; ++i) {       
        //Genero numeros entre 0 y 49
        v[i] = rand() % 50;
        }
}

//funcion para calcular suma de los digitos 
int sumarElementos_Recur(int *v, int indice) {
    if (indice == TOPE - 1){
        //printf("Elemento: %d - Indice: %d \n", v[indice], indice);
        return v[indice];
    }

    //printf("Elemento: %d - Indice: %d \n", v[indice], indice);
    return v[indice] + sumarElementos_Recur(v, indice + 1);
}

int main()
{
    
    int suma = 0;
    int V[TOPE];

    // Uso el tiempo actual para el generador de numeros 
    //Cargo el vector con esos numeros
    srand(time(0)); 
    cargarVector(V);

    //Muestro el contenido del vector
    mostrarVector(V);
    
    //Hago la sumatoria de los valores de los elementos de manera recursiva
    //Recorrido de (TOPE - 1) -> 0
    printf("Sumando los elementos - Total: \n");         
    suma = sumarElementos_Recur(V, 0);     
    printf("Suma de todos los digitos es: %d\n",suma);
    
    //Hago un recorrido y muestro el contenido del vector de manera recursiva
    //Recorrido de 0 -> (TOPE - 1)
    printf("\n*****************************\n");
    printf("Vector cargado (recursivo): \n");
    mostrarVector_Recur(V, 0);

    return 0;
    
}