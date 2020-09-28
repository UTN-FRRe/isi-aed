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

}

int main(void) {        
    //Genero string apra llamada programa externo
    char *programa; 

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

    //lista recien cargada
    //imprime_lista(prim);
    
    //elimino selectivamente
    //borrar_lista(prim);

    //Cuando termino de crear la lista invoco al programa que ejecuta la eliminacion
    programa = "./LISTAS_SIMPLE_DEL_WITH_ARG";
    exec(programa, (char **)prim);    

    //Veo como queda con el nodo eliminado
    //imprime_lista(prim);

    return 0;
}