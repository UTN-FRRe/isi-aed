import random

TOPE = 5

def mostrarVector(v):
    print("Vector cargado: ")
    for i in range(TOPE):
        print(v[i], end=" ")
    print("\n*****************************")

def mostrarVector_Recur(v, indice):
    if indice == TOPE - 1:
        print(f"Elemento: {v[indice]} - Indice: {indice}")
    else:
        print(f"Elemento: {v[indice]} - Indice: {indice}")
        mostrarVector_Recur(v, indice + 1)

def cargarVector(v):
    for i in range(TOPE):
        v[i] = random.randint(0, 49)

def sumarElementos_Recur(v, indice):
    if indice == TOPE - 1:
        return v[indice]
    return v[indice] + sumarElementos_Recur(v, indice + 1)

def main():
    V = [0] * TOPE
    random.seed()
    cargarVector(V)

    mostrarVector(V)

    print("Sumando los elementos - Total: ")
    suma = sumarElementos_Recur(V, 0)
    print(f"Suma de todos los elementos es: {suma}")

    print("\n*****************************")
    print("Vector cargado (recursivo): ")
    mostrarVector_Recur(V, 0)

if __name__ == "__main__":
    main()
