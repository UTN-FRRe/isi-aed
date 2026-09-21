def inicializar_arreglo(tamano, valor_inicial=0):
    return [valor_inicial] * tamano

def mostrar_arreglo(arr):
    print("Arreglo:", arr)

def buscar_arreglo(arr, valor):
    try:
        indice = arr.index(valor)
        return indice
    except ValueError:
        return -1

def insertar_arreglo(arr, indice, valor):
    arr.insert(indice, valor)
    return arr

def eliminar_arreglo(arr, valor):
    if valor in arr:
        arr.remove(valor)
    return arr

def main():
    tam = 5
    arr = inicializar_arreglo(tam, -1)
    mostrar_arreglo(arr)
    # asignar valores
    for i in range(tam):
        arr[i] = i * 10
    mostrar_arreglo(arr)
    print("Buscar 20:", buscar_arreglo(arr, 20))
    insertar_arreglo(arr, 2, 99)
    mostrar_arreglo(arr)
    eliminar_arreglo(arr, 99)
    mostrar_arreglo(arr)

if __name__ == "__main__":
    main()