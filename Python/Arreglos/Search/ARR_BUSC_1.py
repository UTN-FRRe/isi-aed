import random

N = 10
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
    k = 0
    for j in range(N):
        if pSearch == v[j]:
            print(f"Esta en la posicion: {j+1}")
            k += 1
    if k == 0:
        print("No se encuentra en el vector el valor buscado.")

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
    # ORDENAR_VECTOR(V)  # comentado como en C
    # print("Vector ordenado: ")
    # for val in V:
    #     print(val, end=' ')
    # print()
    try:
        search = int(input("Ingrese valor buscar: "))
    except ValueError:
        print("Entrada no válida")
        return
    BUSCAR_EN_VECTOR(V, search)

if __name__ == "__main__":
    main()