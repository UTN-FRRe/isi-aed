import random

def Swap(a, b, i, j):
    a[i], b[j] = b[j], a[i]

def CARGA_VECTOR(v):
    for i in range(len(v)):
        v[i] = random.randint(0, 49)

def ORDENAR_VECTOR(v):
    n = len(v)
    for j in range(n-1):
        Min = j
        for k in range(j+1, n):
            if v[k] < v[Min]:
                Min = k
        # swap
        v[j], v[Min] = v[Min], v[j]

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
    ORDENAR_VECTOR(V)
    print("Vector ordenado: ")
    for val in V:
        print(val, end=' ')
    print()

if __name__ == "__main":
    main()
