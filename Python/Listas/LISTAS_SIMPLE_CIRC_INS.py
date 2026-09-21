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
            ult = q
            q.prox = prim
        else:
            p = prim
            ant = None
            while p.prox != prim and p.val < valor:
                ant = p
                p = p.prox
            if p == prim and p.val >= q.val:
                q.prox = prim
                prim = q
                ult.prox = q
            elif p.prox == prim and p.val < q.val:
                p.prox = q
                q.prox = prim
                ult = q
            else:
                ant.prox = q
                q.prox = p
    return prim

def imprime_lista(prim):
    print("CONTENIDO DE LA LISTA")
    if prim is None:
        print("LISTA VACIA")
        return
    p = prim
    while p.prox != prim:
        print(f"Valor: {p.val} \t Direccion del NODO {id(p)} \t Direccion del PROX {id(p.prox)}")
        # print(f"Dirección (id) del nodo: {id(p)}")
        p = p.prox
    print(f"Valor: {p.val} \t Direccion del NODO {id(p)} \t Direccion del PROX {id(p.prox)}")
    # print(f"Dirección (id) del nodo: {id(p)}")

def libera_lista(prim):
    print("LIBERANDO LA LISTA")
    if prim is None:
        return
    p = prim
    while p.prox != prim:
        prox = p.prox
        p = prox
    print("LISTO!!  -- LIBERANDO LA LISTA")

def main():
    prim = crea_lista()
    imprime_lista(prim)
    libera_lista(prim)

if __name__ == "__main__":
    main()
