def ackermann(m, n):
    if m == 0:
        return n + 1
    elif n == 0:
        return ackermann(m - 1, 1)
    else:
        return ackermann(m - 1, ackermann(m, n - 1))

def main():
    m = int(input("Primer argumento para la funcion Ackermann (m): "))
    n = int(input("Segundo argumento para la funcion Ackermann (n): "))
    print(f"Ackermann ({m},{n}) = {ackermann(m, n)}")

if __name__ == "__main__":
    main()
