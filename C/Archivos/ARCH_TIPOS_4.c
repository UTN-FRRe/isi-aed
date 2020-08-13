#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER 255

typedef struct ventas 
{
   int id;
   char tipo[7]; //C: Contado, T: Cta Cte
   int fecha; //aaaammdd
   char cliente[50];
   int vendedor; //1..15
   float monto;
} ventas;

int main () 
{
    FILE *ent, *sal;
    ventas temp[50];
    int regs;    
    int row_count = 0;
    int field_count = 0;
    char* field;

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

    char* linea = malloc(BUFFER);

    //Proceso el archivo csv
    while (fgets(linea, BUFFER, ent) != NULL)
    {
      //Comienzo a operar la linea separando por comas
      field = strtok(linea, ",");
      
      //Contador para campos
      field_count = 0;      

      while (field != NULL) 
      {
          switch (field_count) 
          {
            case 0:
              temp[row_count].id = atoi(field);
              break;
            case 1:
              strcpy(temp[row_count].tipo, field);
              break;
            case 2:
              temp[row_count].fecha = atoi(field);
              break;
            case 3:
              strcpy(temp[row_count].cliente, field);
              break;            
            case 4:
              temp[row_count].vendedor = atoi(field);
              break;
            case 5:
              temp[row_count].monto = atof(field);
              break;
          }

          //printf("%d %s\n", field_count, field);

          field = strtok(NULL, ",");
          
          //Cuento los campos procesados
          field_count++;
      }

      //Muestro que estoy por guardar
      printf ("Almacenando ... %d %s %d %s %d %f\n", temp[row_count].id, temp[row_count].tipo, temp[row_count].fecha, temp[row_count].cliente, temp[row_count].vendedor, temp[row_count].monto);

      //Cuento los registros guardados
      row_count++;
      
      //free(linea);
      //linea[0] = 0;
    }

    //Guardo el registro en la salida
    regs = fwrite(&temp, sizeof(temp), 1, sal);

    if(regs == 0)
      printf("Error al guardar!\n");

    printf("Registros almacenados: %d \n", row_count);

    fclose (sal);
    fclose (ent);

    return 0;
}