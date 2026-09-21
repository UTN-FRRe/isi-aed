def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    num = int(input("Ingrese un numero entero: "))
    fact = factorial(num)
    print(f"Factorial de {num} es = {fact}")

if __name__ == "__main__":
    main()