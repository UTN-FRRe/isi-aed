def sumarDigitos(num):
    if num > 0:
        return (num % 10) + sumarDigitos(num // 10)
    else:
        return 0

def main():
    numero = int(input("Ingrese un numero entero positivo: "))
    suma = sumarDigitos(numero)
    print(f"Suma de todos los digitos es: {suma}")

if __name__ == "__main__":
    main()