def crear_archivo(nombre, contenido):
    with open(nombre, 'w', encoding='utf-8') as f:
        f.write(contenido)

def leer_archivo(nombre):
    try:
        with open(nombre, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        return "Archivo no encontrado."

def main():
    nombre = "ejemplo.txt"
    contenido = "Hola, este es un archivo de ejemplo.\nSegunda línea."
    crear_archivo(nombre, contenido)
    print("Archivo creado.")
    print("Contenido del archivo:")
    print(leer_archivo(nombre))

if __name__ == "__main__":
    main()
