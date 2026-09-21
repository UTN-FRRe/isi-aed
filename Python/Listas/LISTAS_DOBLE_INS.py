class Nodo:
    def __init__(self, val):
        self.val = val
        self.prox = None
        self.ant = None

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
            ult = q
            q.prox = None
            q.ant = None
        else:
            p = prim
            while p is not None and p.val < valor:
                p = p.prox
            if p == prim:
                q.prox = p
                p.ant = q
                q.ant = None
                prim = q
            elif p is None:
                ult.prox = q
                q.ant = ult
                q.prox = None
                ult = q
            else:
                q.ant = p.ant
                q.prox = p
                p.ant.prox = q
                p.ant = q
    return prim, ult

def imprime_lista(prim):
    print("CONTENIDO DE LA LISTA")
    p = prim
    while p:
        print(f"Valor: {p.val}")
        p = p.prox

def imprime_lista_reversa(ult):
    print("CONTENIDO DE LA LISTA -- REVERSA")
    p = ult
    while p:
        print(f"Valor: {p.val}")
        p = p.ant

def libera_lista(prim):
    p = prim
    while p:
        prox = p.prox
        p = prox

def main():
    prim, ult = crea_lista()
    imprime_lista(prim)
    imprime_lista_reversa(ult)
    libera_lista(prim)

if __name__ == "__main__":
    main()