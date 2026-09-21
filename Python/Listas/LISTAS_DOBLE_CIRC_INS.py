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
            q.prox = q
            q.ant = q
        else:
            p = prim
            while p != ult and p.val < valor:
                p = p.prox
            if p == prim and p.val >= q.val:
                q.prox = p
                p.ant = q
                q.ant = ult
                prim = q
                ult.prox = q
            elif p == ult and p.val < q.val:
                ult.prox = q
                q.ant = ult
                q.prox = prim
                ult = q
                prim.ant = q
            else:
                q.ant = p.ant
                q.prox = p
                p.ant.prox = q
                p.ant = q
    return prim, ult

def imprime_lista(prim, ult):
    print("CONTENIDO DE LA LISTA")
    if prim is None:
        print("LISTA VACIA")
        return
    p = prim
    while p != ult:
        print(f"Valor: {p.val}")
        p = p.prox
    print(f"Valor: {p.val}")

def imprime_lista_reversa(prim, ult):
    print("CONTENIDO DE LA LISTA -- REVERSA")
    if prim is None:
        print("LISTA VACIA")
        return
    p = ult
    while p != prim:
        print(f"Valor: {p.val}")
        p = p.ant
    print(f"Valor: {p.val}")

def libera_lista(prim, ult):
    print("LIBERANDO LA LISTA")
    if prim is None:
        return
    p = prim
    while p != ult:
        prox = p.prox
        p = prox
    print("LISTO!!  -- LIBERANDO LA LISTA")

def main():
    prim, ult = crea_lista()
    imprime_lista(prim, ult)
    imprime_lista_reversa(prim, ult)
    libera_lista(prim, ult)

if __name__ == "__main__":
    main()
