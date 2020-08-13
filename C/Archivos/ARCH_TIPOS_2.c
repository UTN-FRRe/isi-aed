#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Ventas {
   int id;
   char *tipo; //C: Contado, T: Cuenta Corriente
   int fecha; //aaaammdd
   char *cliente;
   int vendedor; //1..15
   float monto;
};

int main () {
   FILE *arch;
   struct Ventas reg;
   int regs;

   struct Ventas ventas[10] = {
                                {1, "C", 20200801, "Tina Turner", 12, 88.123},
                                {1, "C", 20200801, "Doña Laura", 8, 100.123},
                                {1, "T", 20200801, "Raul Montero", 12, 818.55},
                                {1, "C", 20200802, "Loquillo", 9, 258.23},
                                {1, "T", 20200802, "Condorito", 2, 456.9},
                                {1, "C", 20200802, "Lupin", 2, 859.25},
                                {1, "T", 20200803, "Nipur de Lagash", 9, 987.1},
                                {1, "T", 20200803, "Pepe Sanchez", 8, 1088.3},
                                {1, "C", 20200804, "Michael Jackson", 12, 800.0},
                                {1, "C", 20200804, "The Police", 2, 900.0}
                              };

   arch = fopen ("datos.dat", "w");

   if (arch == NULL) {
      fprintf(stderr, "\nError al abrir el archivo\n");
      exit (1);
   }

   regs = fwrite (ventas, sizeof(ventas), 1, arch);

   //printf("%d\n", regs);

   if(regs != 0)
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