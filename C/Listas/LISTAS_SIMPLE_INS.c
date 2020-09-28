//Programa que crea una COLA, utilizando una lista enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox;
} nodo_t;

void imprime_lista(nodo_t *prim) {
    nodo_t *current = prim;

    printf("CONTENIDO DE LA LISTA \n");

    while (current != NULL) {
        printf("%d\n", current->val);
        current = current->prox;
    }
}


void borrar_lista(nodo_t *prim) {
    nodo_t  *current = prim, 
            *prox = prim;

    while (current) {
        prox = current->prox;
        free(current);
        current = prox;
    }
}

int main(void) {    
    //DEFINO mis punteros de soporte y el de inicio
    nodo_t *prim = NULL, *q = NULL, *p = NULL, *ant = NULL;

    //Variable para carga
    int valor;

    while (1) {

        printf("Ingrese valor para el nodo (-1 para salir):");
        scanf("%d", &valor);  

        //Salgo dl bucle si ingresa -1
        if (valor == -1){
            break;
        }

        //solicito memoria para el nodo
        q = (nodo_t *) malloc(sizeof(nodo_t));

        //Cargo los datos del nodo (valor y puntero)
        q->val = valor;

        //Si es el pirmer nodo cargo al inicio, sino al final
        if (prim == NULL){
            
            prim = q;   
            q->prox = NULL;    

                
        }

        else {

            //Busco el lugar para insercion
            p = prim, ant = NULL;            
            while (p != NULL && p->val < valor){

                ant = p;
                p = p->prox;

            }

            //Casos 1 y 2
            if (p == prim){
                
                prim = q;
                
            }
            else { //Casos 3 y 4
                
                ant->prox = q;
            }

            q->prox = p;
        
        }
        
    }


    imprime_lista(prim);
    borrar_lista(prim);

    return 0;
}