import random

def CARGA_VECTOR(v):
    for i in range(len(v)):
        v[i] = random.randint(0, 49)

def ORDENAR_VECTOR(v):
    for k in range(1, len(v)):
        aux = v[k]
        j = k - 1
        while j >= 0 and v[j] > aux:
            v[j + 1] = v[j]
            j -= 1
        v[j + 1] = aux

def main():
    V = [0]*10
    random.seed()
    CARGA_VECTOR(V)
    print(" ---------------------")
    print(" ----- RESULTADOS ----")
    print(" ---------------------")
    print("Vector origen: ")
    for val in V:
        print(val, end=' ')
    print()
    print(" ---------------------")
    ORDENAR_VECTOR(V)
    print("Vector ordenado: ")
    for val in V:
        print(val, end=' ')
    print()

if __name__ == "__main__":
    main()