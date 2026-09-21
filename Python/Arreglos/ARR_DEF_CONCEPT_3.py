import random

def CARGA_TECLADO_VECTOR(v):
    for i in range(len(v)):
        v[i] = random.randint(0, 49)

def main():
    random.seed()
    V = [0]*10
    CARGA_TECLADO_VECTOR(V)
    print(" ---------------------")
    print(" ----- RESULTADOS ----")
    print(" ---------------------")
    print("Vector: ")
    for val in V:
        print(val, end=' ')
    print()
if __name__ == "__main__":
    main()
