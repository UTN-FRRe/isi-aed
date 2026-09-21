import random

def CARGA_VECTOR(v):
    for i in range(len(v)):
        v[i] = random.randint(0, 49)

def ORDENAR_VECTOR(v):
    cambios = True
    n = len(v)
    while cambios:
        cambios = False
        for j in range(n-1):
            if v[j] > v[j+1]:
                v[j], v[j+1] = v[j+1], v[j]
                cambios = True

def ORDENAR_VECTOR_2(v):
    n = len(v)
    for k in range(n-1):
        for j in range(n-1 - k):
            if v[j] > v[j+1]:
                v[j], v[j+1] = v[j+1], v[j]

def ORDENAR_VECTOR_3(v):
    cambios = True
    n = len(v)
    while cambios:
        cambios = False
        for j in range(n-1):
            if v[j] > v[j+1]:
                v[j], v[j+1] = v[j+1], v[j]
                cambios = True

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
    print("---------------------")
    ORDENAR_VECTOR_3(V)
    print("Vector ordenado: ")
    for val in V:
        print(val, end=' ')
    print()

if __name__ == "__main__":
    main()
