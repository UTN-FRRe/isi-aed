#include <stdio.h>
#include <stdlib.h> 


typedef struct nodo {
    int val;
    struct nodo * prox;
} nodo_t;

void print_list(nodo_t * prim) {
    nodo_t * current = prim;

    while (current != NULL) {
        printf("%d\n", current->val);
        current = current->prox;
    }
}

int pop(nodo_t ** prim) {
    int retval = -1;
    nodo_t * prox_nodo = NULL;

    if (*prim == NULL) {
        return -1;
    }

    prox_nodo = (*prim)->prox;
    retval = (*prim)->val;
    free(*prim);
    *prim = prox_nodo;

    return retval;
}

int remove_by_value(nodo_t ** prim, int val) {
    nodo_t *previous, *current;

    if (*prim == NULL) {
        return -1;
    }

    if ((*prim)->val == val) {
        return pop(prim);
    }

    previous = current = (*prim)->prox;
    while (current) {
        if (current->val == val) {
            previous->prox = current->prox;
            free(current);
            return val;
        }

        previous = current;
        current  = current->prox;
    }
    return -1;
}

void delete_list(nodo_t *prim) {
    nodo_t  *current = prim, 
            *prox = prim;

    while (current) {
        prox = current->prox;
        free(current);
        current = prox;
    }
}

int main(void) 
{
	//NUEVO NODO
    nodo_t * test_list = (nodo_t *) malloc(sizeof(nodo_t));

    test_list->val = 1;
    test_list->prox = NULL;


    test_list->prox->val = 2;
    test_list->prox->prox = (nodo_t *) malloc(sizeof(nodo_t));
    test_list->prox->prox->val = 3;
    test_list->prox->prox->prox = (nodo_t *) malloc(sizeof(nodo_t));
    test_list->prox->prox->prox->val = 4;
    test_list->prox->prox->prox->prox = NULL;

    remove_by_value(&test_list, 3);

    print_list(test_list);
    delete_list(test_list);

    return EXIT_SUCCESS;
}