def moverDiscos(n, origen, destino, aux):
    if n > 0:
        moverDiscos(n-1, origen, aux, destino)
        print(f"Muevo un disco de {origen} a {destino}")
        moverDiscos(n-1, aux, destino, origen)

def main():
    cantDiscos = int(input("Ingrese la cantidad de discos a utilizar: "))
    if cantDiscos > 5:
        print("\n\nPor favor, ingrese 5 discos o menos para su correcto funcionamiento\n\n\n")
        return
    print()
    moverDiscos(cantDiscos, 1, 2, 3)
    print("\n\n")

if __name__ == "__main__":
    main()