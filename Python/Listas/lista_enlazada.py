class Nodo:
    def __init__(self, dato):
        self.dato = dato
        self.siguiente = None

class ListaEnlazada:
    def __init__(self):
        self.cabeza = None

    def insertar_al_final(self, dato):
        nuevo = Nodo(dato)
        if not self.cabeza:
            self.cabeza = nuevo
            return
        actual = self.cabeza
        while actual.siguiente:
            actual = actual.siguiente
        actual.siguiente = nuevo

    def insertar_al_inicio(self, dato):
        nuevo = Nodo(dato)
        nuevo.siguiente = self.cabeza
        self.cabeza = nuevo

    def eliminar(self, dato):
        actual = self.cabeza
        previo = None
        while actual:
            if actual.dato == dato:
                if previo:
                    previo.siguiente = actual.siguiente
                else:
                    self.cabeza = actual.siguiente
                return True
            previo = actual
            actual = actual.siguiente
        return False

    def mostrar(self):
        actual = self.cabeza
        elementos = []
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        print("Lista:", " -> ".join(elementos) if elementos else "vacía")

def main():
    lista = ListaEnlazada()
    lista.insertar_al_final(10)
    lista.insertar_al_final(20)
    lista.insertar_al_inicio(5)
    lista.mostrar()
    lista.eliminar(20)
    lista.mostrar()
    lista.eliminar(5)
    lista.mostrar()
    lista.eliminar(10)
    lista.mostrar()

if __name__ == "__main__":
    main()