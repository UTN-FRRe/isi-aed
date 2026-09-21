import random

N = 20
search = 0

def CARGA_VECTOR(v):
    for i in range(N):
        v[i] = random.randint(0, 49)

def ORDENAR_VECTOR(v):
    cambios = True
    while cambios:
        cambios = False
        for j in range(N-1):
            if v[j] > v[j+1]:
                v[j], v[j+1] = v[j+1], v[j]
                cambios = True

def BUSCAR_EN_VECTOR(v, pSearch):
    ini = 0
    fin = N - 1
    med = (ini + fin) // 2
    while ini <= fin:
        if v[med] < pSearch:
            ini = med + 1
        elif v[med] == pSearch:
            print(f"{pSearch} se encontro en la posicion {med+1}.")
            break
        else:
            fin = med - 1
            med = (ini + fin) // 2
    if ini > fin:
        print(f"No se encontro {pSearch} no esta presente en el arreglo.")

def main():
    V = [0]*N
    random.seed()
    CARGA_VECTOR(V)
    print(" ---------------------")
    print(" ----- RESULTADOS ----")
    print(" ---------------------")
    print("Vector origen: ")
    for val in V:
        print(val, end=' ')
    print()
    print("---------------------")
    ORDENAR_VECTOR(V)
    print("Vector ordenado: ")
    for val in V:
        print(val, end=' ')
    print()
    print("---------------------")
    try:
        search = int(input("Ingrese valor buscar: "))
    except ValueError:
        print("Entrada no válida")
        return
    BUSCAR_EN_VECTOR(V, search)

if __name__ == "__main__":
    main()
