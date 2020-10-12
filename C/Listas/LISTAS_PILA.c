//Programa que crea una PILA, utilizando una lista enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox;
} nodo_t;

nodo_t *crea_lista(nodo_t *prim){
    //DEFINO mis punteros de soporte y el de inicio
    nodo_t *q = NULL;

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
        q = (nodo_t *) malloc(sizeof(nodo_t)); //NUEVO(Q)

        //Cargo los datos del nodo (valor y puntero)
        q->val = valor;
        q->prox = prim;

        //Reasigno prim al nuevo primer nodo
        prim = q;
        
    }

    return prim;    
}

void imprime_lista(nodo_t *prim) {
    nodo_t *p = prim;

    printf("CONTENIDO DE LA LISTA \n");

    while (p != NULL) {
        printf("Valor: %d \n", p->val);
        //printf("Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);
        p = p->prox;
    }
}

void libera_lista(nodo_t *prim) {
    nodo_t  *p = prim, 
            *prox = prim;

    while (p) {
        prox = p->prox;
        free(p);
        p = prox;
    }
}

int main(void) {    
    //DEFINO mis punteros de soporte y el de inicio
    nodo_t *prim = NULL;

    prim = crea_lista(prim);

    imprime_lista(prim);

    libera_lista(prim);

    return 0;
}