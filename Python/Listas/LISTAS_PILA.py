class Nodo:
    def __init__(self, val):
        self.val = val
        self.prox = None

def crea_lista():
    prim = None
    while True:
        try:
            valor = int(input("Ingrese valor para el nodo (-1 para salir):"))
        except ValueError:
            continue
        if valor == -1:
            break
        q = Nodo(valor)
        q.prox = prim
        prim = q
    return prim

def imprime_lista(prim):
    print("CONTENIDO DE LA LISTA")
    p = prim
    while p:
        print(f"Valor: {p.val}")
        p = p.prox

def libera_lista(prim):
    p = prim
    while p:
        prox = p.prox
        p = prox

def main():
    prim = crea_lista()
    imprime_lista(prim)
    libera_lista(prim)

if __name__ == "__main__":
    main()