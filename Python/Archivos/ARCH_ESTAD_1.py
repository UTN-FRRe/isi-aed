import sys

def poner_a_cero_matriz(m):
    for i in range(2):
        for j in range(15):
            m[i][j] = 0.0

def mostrar_matriz(m):
    print("\n---------------------")
    print("Resultados: ")
    for i in range(2):
        for j in range(15):
            print(f"{m[i][j]} ", end='')
        print()

class Ventas:
    def __init__(self, id_, tipo, fecha, cliente, vendedor, monto):
        self.id = id_
        self.tipo = tipo
        self.fecha = fecha
        self.cliente = cliente
        self.vendedor = vendedor
        self.monto = monto

def main():
    estad = [[0.0]*15 for _ in range(2)]
    try:
        with open("datos.dat", "rb") as ent:
            # Assuming binary records matching struct Ventas: id(int), tipo[7], fecha(int), cliente[50], vendedor(int), monto(float)
            # We'll read fixed size
            while True:
                data = ent.read(4 + 7 + 4 + 50 + 4 + 4)  # sizes: int4, char7, int4, char50, int4, float4
                if not data or len(data) < 4+7+4+50+4+4:
                    break
                import struct
                id_, tipo_bytes, fecha, cliente_bytes, vendedor, monto = struct.unpack('i7s i 50s i f', data)
                tipo = tipo_bytes.decode('utf-8').rstrip('\x00')
                cliente = cliente_bytes.decode('utf-8').rstrip('\x00')
                reg = Ventas(id_, tipo, fecha, cliente, vendedor, monto)
                print(f"{reg.id}  {reg.tipo}  {reg.fecha}  {reg.cliente}  {reg.vendedor}  {reg.monto}")
                if reg.tipo == "Contado":
                    i = 0
                else:
                    i = 1
                j = reg.vendedor - 1
                estad[i][j] += reg.monto
    except FileNotFoundError:
        print("Error al abrir el archivo de entrada...")
        sys.exit(1)
    mostrar_matriz(estad)

if __name__ == "__main__":
    main()