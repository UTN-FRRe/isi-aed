import sys
import struct

def mostrar_matriz(m):
    print("\n---------------------")
    print("Resultados: ")
    for i in range(len(m)):
        for j in range(len(m[i])):
            print(f"{m[i][j]:3.2f}\t", end='')
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
    estad = [[0.0]*16 for _ in range(3)]
    try:
        with open("datos.dat", "rb") as ent:
            while True:
                data = ent.read(4 + 7 + 4 + 50 + 4 + 4)
                if not data or len(data) < 4+7+4+50+4+4:
                    break
                id_, tipo_bytes, fecha, cliente_bytes, vendedor, monto = struct.unpack('i7s i 50s i f', data)
                tipo = tipo_bytes.decode('utf-8').rstrip('\x00')
                cliente = cliente_bytes.decode('utf-8').rstrip('\x00')
                reg = Ventas(id_, tipo, fecha, cliente, vendedor, monto)
                print(f"{reg.id}  {reg.tipo}  {reg.fecha}  {reg.cliente}  {reg.vendedor}  {reg.monto}")
                i = 0 if reg.tipo == "Contado" else 1
                j = reg.vendedor - 1
                estad[i][j] += reg.monto
                estad[2][j] += reg.monto          # total por vendedor
                estad[i][15] += reg.monto         # total por tipo
                estad[2][15] += reg.monto         # total general
    except FileNotFoundError:
        print("Error al abrir el archivo de entrada...")
        sys.exit(1)
    mostrar_matriz(estad)

if __name__ == "__main__":
    main()