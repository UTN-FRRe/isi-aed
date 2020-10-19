//Programa que crea nodos en una LISTA DOBLE enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox, *ant;
} nodo_t;

typedef struct prim_ult {    
    struct nodo *pr, *ul;
} nodo_pu;

nodo_pu *crea_lista(nodo_t *prim, nodo_t *ult){
    //Defino punteros a NODO para la creación
    nodo_t *q = NULL, *p = NULL;
    nodo_pu *sal = NULL;

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
        //Caso 1
        if (prim == NULL){
            
            prim = q;   
            ult = q;   
            q->prox = NULL;    
            q->ant = NULL;    
                
        }

        else {

            //Busco el lugar para insercion
            p = prim;            
            while (p != NULL && p->val < valor){
                
                p = p->prox;

            }

            //Caso 2 -- ANTES del PRIMERO
            if (p == prim){
                            
                q->prox = p;
                p->ant = q;
                q->ant = NULL;
                prim = q;
                
            }
            else if (p == NULL) { //Caso 4 -- DESPUES DEL ULTIMO
                
                ult->prox = q;
                q->ant = ult;
                q->prox = NULL;
                ult = q;

            }
                else { //Caso 3 -- MEDIO

                    q->ant = p->ant;
                    q->prox = p;
                    p->ant->prox = q; // *(*p.ant).prox
                    p->ant = q;

                }
        
        }
        
    }

    //printf("Direccion de prim %p \t Direccion de ULT %p \n", prim, ult);

    //Genero el registro de salida con los punteros extremos
    //solicito memoria para el nodo
    sal = (nodo_pu *) malloc(sizeof(nodo_pu));

    sal->pr = prim;
    sal->ul = ult;

    return sal;
}

void imprime_lista(nodo_t *prim) {
    nodo_t *p = prim;

    printf("CONTENIDO DE LA LISTA \n");

    //printf("PRIM: %p \n", p);

    while (p != NULL) {
        printf("Valor: %d \n", p->val);
        //printf("Valor: %d \t Dir del NODO %p \t Dir del PROX %p \t Dir del ANT %p \n", p->val, p, p->prox, p->ant);
        p = p->prox;
    }
}

void imprime_lista_reversa(nodo_t *ult) {
    nodo_t *p = ult;

    printf("CONTENIDO DE LA LISTA -- REVERSA \n");

    //printf("ULT: %p \n", p);

    while (p != NULL) {
        printf("Valor: %d \n", p->val);
        //printf("Valor: %d \t Dir del NODO %p \t Dir del PROX %p \t Dir del ANT %p \n", p->val, p, p->prox, p->ant);
        p = p->ant;
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
    nodo_t *prim = NULL, *ult = NULL;
    nodo_pu *rec = NULL;

    //printf("Valor inicial de PRIM antes de cargar ... %p\n", prim);

    //Creo la lista con valores enviados desde el teclado    
    //Al terminar de crear retorno el puntero PRIM que se generó en la carga
    rec = crea_lista(prim, ult);

    //printf("Valor de PRIM luego de cargar ... %p\n", rec->pr);
    //printf("Valor de ULT luego de cargar ... %p\n", rec->ul);

    //Asigno los valores generados
    prim = rec->pr;
    ult = rec->ul;

    //Muestro la lista creada
    imprime_lista(prim);

    //Muestro la lista creada
    imprime_lista_reversa(ult);
    
    //Libero recursos
    libera_lista(prim);

    return 0;
}