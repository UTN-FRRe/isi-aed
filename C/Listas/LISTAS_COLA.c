//Programa que crea una COLA, utilizando una lista enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox;
} nodo_t;

void imprime_lista(nodo_t *prim) {
    nodo_t *current = prim;

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
    nodo_t *prim = NULL, *q = NULL, *ult = NULL;

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
                
        }
        else {

            ult->prox = q;
        
        }

        ult = q;
        q->prox = NULL;
        
    }


    imprime_lista(prim);
    borrar_lista(prim);

    return 0;
}