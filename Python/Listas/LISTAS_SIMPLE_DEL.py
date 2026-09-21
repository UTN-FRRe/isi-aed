class Nodo:
    def __init__(self, val):
        self.val = val
        self.prox = None

def crea_lista():
    prim = None
    while True:
        try:
            valor = int(input("Ingrese valor para el nodo (-1 para salir):"))
        if valor == -1:
            break
        q = Nodo(valor)
        if prim is None:
            prim = q
            q.prox = None
        else:
            p = prim
            ant = None
            while p is not None and p.val < valor:
                ant = p
                p = p.prox
            if p == prim:
                prim = q
            else:
                ant.prox = q
            q.prox = p
    return prim

def imprime_lista(prim):
    print("CONTENIDO DE LA LISTA")
    p = prim
    while p:
        print(f"Valor: {p.val}")
        # print(f"Dirección (id) del nodo: {id(p)}")
        p = p.prox

def borra_lista(prim):
    if prim is None:
        print("ERROR - LISTA VACIA!!!!")
        return prim
    valor = int(input("Ingrese valor a eliminar:"))
    p = prim
    ant = None
    while p is not None and p.val != valor:
        ant = p
        p = p.prox
    if p is None:
        print("SIN EXITO .. NO SE ENCUENTRA VALOR EN LA LISTA.")
        return prim
    if p == prim:
        prim = p.prox
    else:
        ant.prox = p.prox
    return prim

def libera_lista(prim):
    p = prim
    while p:
        prox = p.prox
        p = prox

def main():
    prim = crea_lista()
    imprime_lista(prim)
    prim = borra_lista(prim)
    imprime_lista(prim)
    libera_lista(prim)

if __name__ == "__main__":
    main()
