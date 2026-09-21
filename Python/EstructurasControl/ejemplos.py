# Secuencia simple
def secuencia():
    print("Secuencia:")
    a = 5
    b = 10
    c = a + b
    print(f"{a} + {b} = {c}")

# Selección (if-else)
def seleccion():
    print("\nSelección:")
    num = int(input("Ingrese un número: "))
    if num > 0:
        print("Positivo")
    elif num < 0:
        print("Negativo")
    else:
        print("Cero")

# Iteración (while)
def bucle_while():
    print("\nBucle while:")
    i = 1
    while i <= 5:
        print(i, end=' ')
        i += 1
    print()

# Iteración (for)
def bucle_for():
    print("\nBucle for:")
    for i in range(1, 6):
        print(i, end=' ')
    print()

# Iteración (do-while emulado)
def bucle_do_while():
    print("\nBucle do-while (simulado):")
    i = 1
    while True:
        print(i, end=' ')
        i += 1
        if i > 5:
            break
    print()

def main():
    secuencia()
    seleccion()
    bucle_while()
    bucle_for()
    bucle_do_while()

if __name__ == "__main__":
    main()