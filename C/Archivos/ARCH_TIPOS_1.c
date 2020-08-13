#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Ventas {
   int id;
   char *tipo; //C: Contado, T: Cuenta Corriente
   int fecha; //aaaammdd
   char *cliente;
   int vendedor; //1..30
   float monto;
};

int main () {
   FILE *arch;
   struct Ventas reg;
   int regs;

   arch = fopen ("datos.dat", "w");

   if (arch == NULL) {
      fprintf(stderr, "\nError al abrir el archivo\n");
      exit (1);
   }

   reg.id = 1;
   reg.tipo = "C"; //C: Contado, T: Cuenta Corriente
   reg.fecha = 20200801; //aaaammdd
   reg.cliente = "Don Carlos";
   reg.vendedor = 1; //1..30
   reg.monto = 5000.50;

   regs = fwrite (&reg, sizeof(struct Ventas), 1, arch);

   reg.id = 2;
   reg.tipo = "T"; //C: Contado, T: Cuenta Corriente
   reg.fecha = 20200801; //aaaammdd
   reg.cliente = "Anibal Lecter";
   reg.vendedor = 3; //1..30
   reg.monto = 4500.50;

   regs += fwrite (&reg, sizeof(struct Ventas), 1, arch);

   if(regs == 2)
      printf("Se han guardado correctamente los datos!\n");
   else
      printf("Error al guardar!\n");

   fclose (arch);

   //abro para leer
   //FILE *inf;

   arch = fopen ("datos.dat", "r");
   if (arch == NULL) {
      fprintf(stderr, "\nError al abrir para leer el archivo...\n");
      exit (1);
   }

   while(fread(&reg, sizeof(struct Ventas), 1, arch))
      printf ("Id = %d Fecha = %d Nombre = %s Monto = %f\n", reg.id, reg.fecha, reg.cliente, reg.monto);

   fclose (arch);

   return 0;
}