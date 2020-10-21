//Programa que crea nodos en una LISTA SIMPLE enlazada...

#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo *prox;
} nodo_t;

nodo_t *crea_lista(nodo_t *prim){
    //Defino punteros a NODO para la creación
    nodo_t *q = NULL, *p = NULL, *ant = NULL, *ult = NULL;

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
            q->prox = prim;    
                
        }

        else {

            //Busco el lugar para insercion
            p = prim, ant = NULL;            
            while (p->prox != prim && p->val < valor){

                ant = p;
                p = p->prox;

            }
            
            if (p == prim && p->val >= q->val){ //Caso 2
                
                q->prox = prim; 
                prim = q;
                ult->prox = q;                
                
            }
            else if (p->prox == prim && p->val < q->val) { //Caso 4

                p->prox = q;
                q->prox = prim;
                ult = q;

            }
            else { //Caso 3
                
                ant->prox = q;
                q->prox = p;                

            }
        
        }
        
    }
    
    return prim;
}

void imprime_lista(nodo_t *prim) {
    nodo_t *p = prim;

    printf("CONTENIDO DE LA LISTA \n");

    if (prim == NULL) {
        printf("LISTA VACIA \n");
        return;
    }

    while (p->prox != prim) {
        printf("Valor: %d \n", p->val);
        //printf("Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);
        p = p->prox;
    }

    //Trato el ultimo nodo fuera del ciclo
    printf("Valor: %d \n", p->val);
    //printf("Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);
}

nodo_t *borra_lista(nodo_t *prim) {
    nodo_t *ant = prim, *ult = NULL, *p = prim;

    int valor;

    //Si es el pirmer nodo cargo al inicio, sino al final
    if (prim == NULL){
        printf("ERROR - LISTA VACIA!!!!");    
    }
    else
    {
        
        //Recupero el ultimo para hacer los cambios
        p = prim;            
        while (p->prox != prim){
            
            p = p->prox;

        }
        //Asigno el valor recuperado
        ult = p;
        //printf("ULT - Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);

        printf("Ingrese valor a eliminar:");
        scanf("%d", &valor);  

        //Busco el lugar para insercion
        p = prim, ant = NULL;            
        while (p->prox != prim && p->val != valor){

            ant = p;
            p = p->prox;

        }

        if (p->val != valor){ //Pregunto asi porque estoy parado en el ultimo nodo, y puede ser el valor a borrar
            printf("SIN EXITO .. NO SE ENCUENTRA VALOR EN LA LISTA.\n");    
        }
        else
        {            
            
            //printf("EXITO - Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);

            if (prim == ult){ //Caso 1 
                //printf("Caso 1 -- Direccion de p %p \n", p);
                prim = NULL;
                ult = NULL;

            }            
            else if (p == prim){ //Caso 2
                
                //printf("Caso 2 -- Direccion de p %p \n", p);
                prim = p->prox;
                ult->prox = p->prox;
                
            }
            else if (p->prox == prim){ //Caso 4
                
                //printf("Caso 4 -- Direccion de p %p \n", p);
                ant->prox = p->prox;
                ult = ant;

            }
            else { //Caso 3
                
                //printf("Caso 3 -- Direccion de p %p \n", p);
                ant->prox = p->prox;
            }

            free(p);            
        }

    }

    //printf("SALGO BORRADO - Direccion de PRIM %p \n", prim);
    return prim;
}

void libera_lista(nodo_t *prim) {
    nodo_t  *p = prim, 
            *prox = prim;

    printf("LIBERANDO LA LISTA \n");

    while (p->prox != prim) {       
        //printf("Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);        

        prox = p->prox;            
        free(p);    
        p = prox;        

    }

    //Libero el ultimo afuera
    //printf("Valor: %d \t Direccion del NODO %p \t Direccion del PROX %p \n", p->val, p, p->prox);        
    free(p);    

    printf("LISTO!!  -- LIBERANDO LA LISTA \n");
}

int main(void) {    
    //DEFINO mis punteros de soporte y el de inicio
    nodo_t *prim = NULL;

    //printf("Valor inicial de PRIM antes de cargar ... %p\n", prim);

    //Creo la lista con valores enviados desde el teclado    
    //Al terminar de crear retorno el puntero PRIM que se generó en la carga
    prim = crea_lista(prim);

    //printf("Valor de PRIM luego de cargar ... %p\n", prim);

    //Muestro la lista creada
    imprime_lista(prim);

    //elimino selectivamente
    prim = borra_lista(prim);

    //Veo como queda con el nodo eliminado
    imprime_lista(prim);

    //Libero recursos
    libera_lista(prim);

    return 0;
}