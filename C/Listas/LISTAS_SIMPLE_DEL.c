//Programa que crea una COLA, utilizando una lista enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox;
} nodo_t;

nodo_t *crea_lista(nodo_t *prim){
    //Defino punteros a NODO para la creación
    nodo_t *q = NULL, *p = NULL, *ant = NULL;

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

nodo_t *borra_lista(nodo_t *prim) {
    nodo_t  *ant = prim, 
            *p = prim;

    int valor;

    //Si es el pirmer nodo cargo al inicio, sino al final
    if (prim == NULL){
        printf("ERROR - LISTA VACIA!!!!");    
    }
    else
    {
        printf("Ingrese valor a eliminar:");
        scanf("%d", &valor);  

        //Busco el lugar para insercion
        p = prim, ant = NULL;            
        while (p != NULL && p->val != valor){

            ant = p;
            p = p->prox;

        }

        if (p == NULL){
            printf("SIN EXITO .. NO SE ENCUENTRA VALOR EN LA LISTA.\n");    
        }
        else
        {
            //Casos 1 y 2
            if (p == prim){
                
                prim = p->prox;
                
            }
            else { //Casos 3 y 4
                
                ant->prox = p->prox;
            }

            free(p);            
        }

    }

    return prim;
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

    //printf("Valor inicial de PRIM antes de cargar ... %p\n", prim);

    //Creo la lista con valores enviados desde el teclado    
    //Al terminar de crear retorno el puntero PRIM que se generó en la carga
    prim = crea_lista(prim);
    
    //printf("Valor de PRIM luego de cargar ... %p\n", prim);

    //lista recien cargada
    imprime_lista(prim);
    
    //elimino selectivamente
    prim = borra_lista(prim);

    //Veo como queda con el nodo eliminado
    imprime_lista(prim);

    //Libero recursos
    libera_lista(prim);

    return 0;
}