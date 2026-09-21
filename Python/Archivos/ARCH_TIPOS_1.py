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
    # escribir
    try:
        with open("datos.dat", "wb") as arch:
            reg1 = Ventas(1, "C", 20200801, "Don Carlos", 1, 5000.50)
            reg2 = Ventas(2, "T", 20200801, "Anibal Lecter", 3, 4500.50)
            # pack each record: id i, tipo char, fecha i, cliente string (we'll use fixed 50?), vendedor i, monto f
            # For simplicity, we'll write as text? but original C writes binary struct with pointers (dangerous).
            # We'll mimic by writing fixed-length fields: tipo 1 char, cliente 50 chars.
            data1 = struct.pack('i c i 50s i f', reg1.id, reg1.tipo.encode(), reg1.fecha,
                                reg1.cliente.encode().ljust(50)[:50], reg1.vendedor, reg1.monto)
            data2 = struct.pack('i c i 50s i f', reg2.id, reg2.tipo.encode(), reg2.fecha,
                                reg2.cliente.encode().ljust(50)[:50], reg2.vendedor, reg2.monto)
            arch.write(data1)
            arch.write(data2)
    except IOError as e:
        print(f"Error al abrir el archivo: {e}")
        sys.exit(1)
    print("Se han guardado correctamente los datos!")
    # leer
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
