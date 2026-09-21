def getPotencia(b, p):
    if p == 0:
        return 1
    return b * getPotencia(b, p-1)

def main():
    base = int(input("Ingrese valor de la base: "))
    potencia = int(input("Ingrese valor de la potencia: "))
    resultado = getPotencia(base, potencia)
    print(f"{base} elevado a la {potencia} es: {resultado}")

if __name__ == "__main__":
    main()