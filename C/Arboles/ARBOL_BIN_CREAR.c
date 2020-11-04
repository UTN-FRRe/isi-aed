//binarysearcharbol.c
#include <stdio.h>
#include <stdlib.h>

#define max 20

struct arbol {
	int dato;
	struct arbol * der;
	struct arbol * izq;
};

//El desarrollo de las funciones o procedimientos se hace al final
//En este sector solo estan los encabezados para mejor legibilidad (ponele)

void crear(int Arr[], int elem);

struct arbol * hacerraiz(int val);

void hijoder(struct arbol *nodoRaiz, int val);

void hijoizq(struct arbol *nodoRaiz, int val);

void enorden(struct arbol *nodo);

void preorden(struct arbol *nodo);

void postorden(struct arbol *nodo);

int main() {
	int arr[max], i, elem;

	printf("Cuantos elementos se cargaran en el arbol de busqueda? ");
	scanf("%d", &elem);

	printf("\nEl primer valor ingresado es la raiz.\nLos elementos siguientes se iran cargando en el arbol binario de acuerdo a su valor.\n");

	printf("Ingrese %d elementos en el listado \n", elem);

	for (i = 0; i < elem; i++)
		scanf("%d", & arr[i]);

	crear(arr, elem);

	return 0;
}

void crear(int Arr[], int elem) {
	struct arbol * temp, * nodoRaiz;
	int j;
	
	//Primer valor del listado se hace raiz
	nodoRaiz = hacerraiz(Arr[0]);

	//al resto de los elementos se los ubica en el arbol de acuerdo a su valor
	//menor -> izq
	//mayor -> der
	for (j = 1; j < elem; j++) {
		temp = nodoRaiz;
		while (1) {

			if (Arr[j] < temp->dato) {

				if (temp->izq != NULL) {
				
					temp = temp->izq;
					continue;

				}

				hijoizq(temp, Arr[j]);
			}

			if (Arr[j] > temp->dato) {

				if (temp->der != NULL) {

					temp = temp->der;
					continue;
				}

				hijoder(temp, Arr[j]);
			}

			break;
		}
	}

	printf("Arbol Binario de Busqueda creado!!!\n");

	printf("El recorrido EN ORDEN es el siguiente:\n");

	enorden(nodoRaiz);

	printf("\n");

	printf("El recorrido PRE ORDEN es el siguiente:\n");

	preorden(nodoRaiz);

	printf("\n");

	printf("El recorrido POST ORDEN es el siguiente:\n");

	postorden(nodoRaiz);

	printf("\n");	
}

struct arbol * hacerraiz(int val) {
	
	struct arbol *nodoRaiz;
	
	nodoRaiz = (struct arbol * ) malloc(sizeof(struct arbol));
	nodoRaiz->dato = val;
	nodoRaiz->der = NULL;
	nodoRaiz->izq = NULL;

	return nodoRaiz;
}

void hijoizq(struct arbol *nodoRaiz, int val) {
	struct arbol *nuevonodo;

	nuevonodo = (struct arbol * ) malloc(sizeof(struct arbol));
	nuevonodo->dato = val;
	nuevonodo->izq = NULL;
	nuevonodo->der = NULL;
	nodoRaiz->izq = nuevonodo;
}

void hijoder(struct arbol *nodoRaiz, int val) {
	struct arbol *nuevonodo;

	nuevonodo = (struct arbol * ) malloc(sizeof(struct arbol));
	nuevonodo->dato = val;
	nuevonodo->izq = NULL;
	nuevonodo->der = NULL;
	nodoRaiz->der = nuevonodo;
}

void enorden(struct arbol *nodo) {
	if (nodo != NULL) {
		enorden(nodo->izq);
		printf("%d\t", nodo->dato);
		//printf("Valor: %d \t Dir del NODO %p \t Dir de IZQ %p \t Dir de DER %p \n", nodo->dato, nodo, nodo->izq, nodo->der);
		enorden(nodo->der);
	}
}

void preorden(struct arbol *nodo) {
	if (nodo != NULL) {
		printf("%d\t", nodo->dato);
		//printf("Valor: %d \t Dir del NODO %p \t Dir de IZQ %p \t Dir de DER %p \n", nodo->dato, nodo, nodo->izq, nodo->der);
		preorden(nodo->izq);		
		preorden(nodo->der);
	}
}

void postorden(struct arbol *nodo) {
	if (nodo != NULL) {		
		postorden(nodo->izq);		
		postorden(nodo->der);
		printf("%d\t", nodo->dato);
		//printf("Valor: %d \t Dir del NODO %p \t Dir de IZQ %p \t Dir de DER %p \n", nodo->dato, nodo, nodo->izq, nodo->der);
	}
}
