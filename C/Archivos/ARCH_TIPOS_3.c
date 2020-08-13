#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER 255

struct Ventas 
{
   int id;
   char tipo[7]; //C: Contado, T: Cta Cte
   int fecha; //aaaammdd
   char cliente[50];
   int vendedor; //1..15
   float monto;
};

int main () 
{
    FILE *ent, *sal;
    struct Ventas reg;

    if ((sal = fopen ("datos.dat", "w")) == NULL) 
    {
      fprintf(stderr, "\nError al abrir el archivo de salida...\n");
      exit (1);
    }

    if ((ent = fopen ("Origen_2.csv", "r")) == NULL) 
    {
      fprintf(stderr, "\nError al abrir el archivo de entrada...\n");
      exit (1);
    }

    int regs;    
    //char linea[BUFFER];    
    int row_count = 0;
    int field_count = 0;

    char* linea = malloc(BUFFER);

    //Proceso el archivo csv
    while (fgets(linea, BUFFER, ent) != NULL) 
    {
      //printf ("%s\n", linea);

      field_count = 0;
      row_count++;

      char* field = strtok(linea, ",");

      while (field) 
      {
          switch (field_count) 
          {
            case 0:
              reg.id = atoi(field);
              break;
            case 1:
              strcpy(reg.tipo, field);
              break;
            case 2:
              reg.fecha = atoi(field);
              break;
            case 3:
              strcpy(reg.cliente, field);
              break;            
            case 4:
              reg.vendedor = atoi(field);
              break;
            case 5:
              reg.monto = atof(field);
              break;
          }

          //printf("%d %s\n", field_count, field);

          field = strtok(NULL, ",");
          
          //Cuento los campos procesados
          field_count++;
      }

      //Muestro que estoy por guardar
      printf ("Almacenando ... %d %s %d %s %d %f\n", reg.id, reg.tipo, reg.fecha, reg.cliente, reg.vendedor, reg.monto);

      //Guardo el registro en la salida
      regs = fwrite(&reg, sizeof(reg), 1, sal);
      
      if(regs == 0)
        printf("Error al guardar!\n");

      //free(linea);
      //linea[0] = 0;
    }

    printf("Registros almacenados: %d \n", row_count);

    fclose (sal);
    fclose (ent);

    /*
    //abro para leer        
    sal = fopen ("datos.dat", "r");

    if (sal == NULL) 
    {
      fprintf(stderr, "\nError al abrir para leer el archivo...\n");
      exit (1);
    }

    while(fread(&reg, sizeof(reg), 1, sal) == 1)
    {      
      printf ("%d  %s  %d  %s  %d  %f\n", reg.id, reg.tipo, reg.fecha, reg.cliente, reg.vendedor, reg.monto);      
    }

    fclose (sal);
    */

    return 0;
}