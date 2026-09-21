class Nodo:
    def __init__(self, val):
        self.val = val
        self.prox = None

def crea_lista():
    prim = None
    ult = None
    while True:
        try:
            valor = int(input("Ingrese valor para el nodo (-1 para salir):"))
        except ValueError:
            continue
        if valor == -1:
            break
        q = Nodo(valor)
        if prim is None:
            prim = q
        else:
            ult.prox = q
        ult = q
        q.prox = None
    return prim

def imprime_lista(prim):
    print("CONTENIDO DE LA LISTA")
    current = prim
    while current:
        print(f"Valor: {current.val}")
        # print(f"Dirección (id) del nodo: {id(current)}")
        current = current.prox

def borra_lista(prim):
    current = prim
    while current:
        prox = current.prox
        # In Python, garbage collection handles free
        current = prox

def main():
    prim = crea_lista()
    imprime_lista(prim)
    borra_lista(prim)

if __name__ == "__main__":
    main()
