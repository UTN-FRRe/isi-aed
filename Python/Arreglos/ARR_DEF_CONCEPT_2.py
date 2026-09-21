import random

def CARGA_TECLADO_VECTOR(v):
    for i in range(len(v)):
        v[i] = random.randint(0, 49)

def CARGA_TECLADO_MATRIZ(m):
    for i in range(len(m)):
        for j in range(len(m[i])):
            m[i][j] = random.randint(0, 49)

def main():
    random.seed()
    V = [0]*10
    M = [[0]*5 for _ in range(5)]
    CARGA_TECLADO_VECTOR(V)
    CARGA_TECLADO_MATRIZ(M)
    print(" ---------------------")
    print(" ----- RESULTADOS ----")
    print(" ---------------------")
    print("Vector: ")
    for val in V:
        print(val, end=' ')
    print()
    print("---------------------")
    print("Matriz: ")
    for fila in M:
        for val in fila:
            print(val, end=' ')
        print()
if __name__ == "__main__":
    main()