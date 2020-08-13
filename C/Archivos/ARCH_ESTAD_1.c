#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Ventas 
{
   int id;
   char tipo[7]; //C: Contado, T: Cuenta Corriente
   int fecha; //aaaammdd
   char cliente[50];
   int vendedor; //1..15
   float monto;
};

void PONER_A_CERO_MATRIZ(float m[2][15]) {
  int i, j;

  for(i = 0; i < 2; ++i) 
  {
    for(j = 0; j < 15; ++j) 
    {
      m[i][j] = 0;      
    }
  }
}

void MOSTRAR_MATRIZ(float m[2][15]) {
  int i, j;

  printf("\n---------------------\n");
  printf("Resultados: \n");

  for(i = 0; i < 2; ++i) 
  {    
    for(j = 0; j < 15; ++j) 
    {
      printf("%f ", m[i][j]); 
    }
    printf("\n");
  }
}


int main () 
{
    FILE *ent;
    struct Ventas reg;
    float estad[2][15] = {{0}}; //Defino e inicializo en cero toda la matriz
    int i, j;

    if ((ent = fopen ("datos.dat", "r")) == NULL) 
    {
      fprintf(stderr, "\nError al abrir el archivo de entrada...\n");
      exit (1);
    }

    //Matriz para acumular - Se pone a cero
    //PONER_A_CERO_MATRIZ(estad);

    while(fread(&reg, sizeof(reg), 1, ent) == 1)
    {
      printf ("%d  %s  %d  %s  %d  %f\n", reg.id, reg.tipo, reg.fecha, reg.cliente, reg.vendedor, reg.monto);      

      //Mapeo tipo de venta
      if(strcmp(reg.tipo, "Contado")==0)
      {
        i = 0;
      }

      else
      {
        i = 1;
      }

      //Mapeo vendedor
      j = reg.vendedor - 1;

      estad[i][j] += reg.monto;
    }
    
    fclose (ent);

    //Muestro resultados antes de salir
    MOSTRAR_MATRIZ(estad);

    return 0;
}