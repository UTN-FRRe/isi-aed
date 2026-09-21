import sys
import csv
import struct

def main():
    try:
        with open("Origen_2.csv", "r", newline='', encoding='utf-8') as ent, \
             open("datos.dat", "wb") as sal:
            reader = csv.reader(ent)
            row_count = 0
            for row in reader:
                if len(row) < 6:
                    continue
                try:
                    reg_id = int(row[0])
                    tipo = row[1].strip()
                    fecha = int(row[2])
                    cliente = row[3].strip()
                    vendedor = int(row[4])
                    monto = float(row[5])
                except ValueError:
                    continue
                print(f"Almacenando ... {reg_id} {tipo} {fecha} {cliente} {vendedor} {monto}")
                # pack: id i, tipo[7], fecha i, cliente[50], vendedor i, monto f
                data = struct.pack('i7s i 50s i f',
                                   reg_id,
                                   tipo.encode('utf-8')[:7].ljust(7, b'\x00'),
                                   fecha,
                                   cliente.encode('utf-8')[:50].ljust(50, b'\x00'),
                                   vendedor,
                                   monto)
                sal.write(data)
                row_count += 1
    except FileNotFoundError as e:
        print(f"Error al abrir el archivo: {e}")
        sys.exit(1)
    print(f"Registros almacenados: {row_count}")

if __name__ == "__main__":
    main()
