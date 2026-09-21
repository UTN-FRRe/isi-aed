class Nodo:
    def __init__(self, valor):
        self.valor = valor
        self.izquierda = None
        self.derecha = None

class ArbolBinario:
    def __init__(self):
        self.raiz = None

    def insertar(self, valor):
        if self.raiz is None:
            self.raiz = Nodo(valor)
        else:
            self._insertar_recursivo(self.raiz, valor)

    def _insertar_recursivo(self, nodo, valor):
        if valor < nodo.valor:
            if nodo.izquierda is None:
                nodo.izquierda = Nodo(valor)
            else:
                self._insertar_recursivo(nodo.izquierda, valor)
        else:
            if nodo.derecha is None:
                nodo.derecha = Nodo(valor)
            else:
                self._insertar_recursivo(nodo.derecha, valor)

    def inorden(self, nodo):
        if nodo:
            self.inorden(nodo.izquierda)
            print(nodo.valor, end=' ')
            self.inorden(nodo.derecha)

    def preorden(self, nodo):
        if nodo:
            print(nodo.valor, end=' ')
            self.preorden(nodo.izquierda)
            self.preorden(nodo.derecha)

    def postorden(self, nodo):
        if nodo:
            self.postorden(nodo.izquierda)
            self.postorden(nodo.derecha)
            print(nodo.valor, end=' ')

def main():
    arbol = ArbolBinario()
    datos = [50, 30, 70, 20, 40, 60, 80]
    for d in datos:
        arbol.insertar(d)
    print("Inorden: ", end='')
    arbol.inorden(arbol.raiz)
    print("\nPreorden: ", end='')
    arbol.preorden(arbol.raiz)
    print("\nPostorden: ", end='')
    arbol.postorden(arbol.raiz)
    print()

if __name__ == "__main__":
    main()
