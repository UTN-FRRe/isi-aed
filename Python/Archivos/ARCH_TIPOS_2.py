import sys
import struct

class Ventas:
    def __init__(self, id_, tipo, fecha, cliente, vendedor, monto):
        self.id = id_
        self.tipo = tipo
        self.fecha = fecha
        self.cliente = cliente
        self.vendedor = vendedor
        self.monto = monto

def main():
    ventas = [
        Ventas(1, "C", 20200801, "Tina Turner", 12, 88.123),
        Ventas(1, "C", 20200801, "Do�a Laura", 8, 100.123),
        Ventas(1, "T", 20200801, "Raul Montero", 12, 818.55),
        Ventas(1, "C", 20200802, "Loquillo", 9, 258.23),
        Ventas(1, "T", 20200802, "Condorito", 2, 456.9),
        Ventas(1, "C", 20200802, "Lupin", 2, 859.25),
        Ventas(1, "T", 20200803, "Nipur de Lagash", 9, 987.1),
        Ventas(1, "T", 20200803, "Pepe Sanchez", 8, 1088.3),
        Ventas(1, "C", 20200804, "Michael Jackson", 12, 800.0),
        Ventas(1, "C", 20200804, "The Police", 2, 900.0)
    ]
    try:
        with open("datos.dat", "wb") as arch:
            for v in ventas:
                data = struct.pack('i c i 50s i f', v.id, v.tipo.encode(), v.fecha,
                                   v.cliente.encode().ljust(50)[:50], v.vendedor, v.monto)
                arch.write(data)
    except IOError as e:
        print(f"Error al abrir el archivo: {e}")
        sys.exit(1)
    print("Se han guardado correctamente los datos!")
    try:
        with open("datos.dat", "rb") as arch:
            while True:
                data = arch.read(struct.calcsize('i c i 50s i f'))
                if not data:
                    break
                id_, tipo_bytes, fecha, cliente_bytes, vendedor, monto = struct.unpack('i c i 50s i f', data)
                tipo = tipo_bytes.decode().rstrip('\x00')
                cliente = cliente_bytes.decode().rstrip('\x00')
                print(f"Id = {id_} Fecha = {fecha} Nombre = {cliente} Monto = {monto}")
    except IOError as e:
        print(f"Error al abrir para leer el archivo: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
