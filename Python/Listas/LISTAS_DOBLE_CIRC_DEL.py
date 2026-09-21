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
            # find insertion point to keep list sorted ascending
            while p != ult and p.val < valor:
                p = p.prox
            # Case 2: before first
            if p == prim and p.val >= q.val:
                q.prox = p
                p.ant = q
                q.ant = ult
                prim = q
                ult.prox = q
            # Case 4: after last
            elif p == ult and p.val < q.val:
                ult.prox = q
                q.ant = ult
                q.prox = prim
                ult = q
                prim.ant = q
            # Case 3: middle
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
        # In Python, just let reference go
        p = prox
    # last node
    print("LISTO!!  -- LIBERANDO LA LISTA")

def borra_lista(prim, ult):
    if prim is None:
        print("ERROR - LISTA VACIA!!!!")
        return prim, ult
    try:
        valor = int(input("Ingrese valor a eliminar:"))
    except ValueError:
        return prim, ult
    p = prim
    while p is not None and p.val != valor:
        p = p.prox
    if p is None:
        print("SIN EXITO .. NO SE ENCUENTRA VALOR EN LA LISTA.")
        return prim, ult
    # Case 1: single node
    if prim == ult:
        prim = None
        ult = None
    # Case 2: delete first
    elif p == prim:
        prim = p.prox
        prim.ant = ult
        ult.prox = prim
    # Case 4: delete last
    elif p == ult:
        ult = p.ant
        ult.prox = prim
        prim.ant = ult
    # Case 3: middle
    else:
        p.ant.prox = p.prox
        p.prox.ant = p.ant
    # In Python, node will be GC'd
    return prim, ult

def main():
    prim, ult = crea_lista()
    imprime_lista(prim, ult)
    prim, ult = borra_lista(prim, ult)
    imprime_lista(prim, ult)
    imprime_lista_reversa(prim, ult)
    libera_lista(prim, ult)

if __name__ == "__main__":
    main()
