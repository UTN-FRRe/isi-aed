def CARGA_TECLADO_VECTOR(v):
    for i in range(len(v)):
        v[i] = int(input(f"Ingrese valor para posicion {i+1}: "))

def CARGA_TECLADO_MATRIZ(m):
    for i in range(len(m)):
        for j in range(len(m[i])):
            m[i][j] = int(input(f"Ingrese valor para fila {i+1} -- col {j+1}: "))

def main():
    V = [0]*5
    M = [[0]*3 for _ in range(3)]
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
