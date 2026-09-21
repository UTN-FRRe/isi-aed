def contarDigitos(num):
    if num > 0:
        return 1 + contarDigitos(num // 10)
    else:
        return 0

def contarDigitos_2(num):
    if num == 0:
        return 0
    else:
        return 1 + contarDigitos_2(num // 10)

def main():
    numero = int(input("Ingrese un numero entero positivo: "))
    cantidad = contarDigitos(numero)
    print(f"Cantidad total de digitos en {numero} es: {cantidad}")

    cantidad2 = contarDigitos_2(numero)
    print(f"Cantidad total de digitos (2) en {numero} es: {cantidad2}")

if __name__ == "__main__":
    main()
