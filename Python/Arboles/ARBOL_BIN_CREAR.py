import sys

class Nodo:
    def __init__(self, dato):
        self.dato = dato
        self.izq = None
        self.der = None

def crear(arr):
    if not arr:
        return None
    raiz = Nodo(arr[0])
    for val in arr[1:]:
        temp = raiz
        while True:
            if val < temp.dato:
                if temp.izq is not None:
                    temp = temp.izq
                    continue
                temp.izq = Nodo(val)
                break
            elif val > temp.dato:
                if temp.der is not None:
                    temp = temp.der
                    continue
                temp.der = Nodo(val)
                break
            else:
                # igual, no insertar (o podríamos decidir)
                break
    return raiz

def enorden(nodo):
    if nodo:
        enorden(nodo.izq)
        print(f"{nodo.dato}\t", end='')
        enorden(nodo.der)

def preorden(nodo):
    if nodo:
        print(f"{nodo.dato}\t", end='')
        preorden(nodo.izq)
        preorden(nodo.der)

def postorden(nodo):
    if nodo:
        postorden(nodo.izq)
        postorden(nodo.der)
        print(f"{nodo.dato}\t", end='')

def main():
    try:
        elem = int(input("Cuantos elementos se cargaran en el arbol de busqueda? "))
    except ValueError:
        print("Entrada no válida")
        return
    print("\nEl primer valor ingresado es la raiz.\nLos elementos siguientes se iran cargando en el arbol binario de acuerdo a su valor.")
    print(f"Ingrese {elem} elementos en el listado")
    arr = []
    for _ in range(elem):
        try:
            arr.append(int(input()))
        except ValueError:
            print("Valor no entero, se omite")
    raiz = crear(arr)
    print("\nArbol Binario de Busqueda creado!!!")
    print("\nEl recorrido EN ORDEN es el siguiente:")
    enorden(raiz)
    print()
    print("\nEl recorrido PRE ORDEN es el siguiente:")
    preorden(raiz)
    print()
    print("\nEl recorrido POST ORDEN es el siguiente:")
    postorden(raiz)
    print()

if __name__ == "__main__":
    main()