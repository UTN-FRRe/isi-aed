#include <stdio.h>
#include <stdlib.h>

//Declaro la funcion "moverDiscos"
void moverDiscos (int n, int origen, int destino, int aux);
 
int main(){
   //El usuario ingresa la cantidad de discos a utilizar
   int cantDiscos;
   printf("Ingrese la cantidad de discos a utilizar: ");
   scanf("%d", &cantDiscos);
  
   //Valido que sean 5 o menos para su correcto funcionamiento
   //Se puede hacer con cualquier cantidad de discos, pero un valor alto provocaria un volcado de memoria por la cantidad de llamadas recursivas que se utilizan
   if (cantDiscos > 5){
      printf ("\n\nPor favor, ingrese 5 discos o menos para su correcto funcionamiento\n\n\n");
      getchar();
      return 0;
   }
   printf ("\n");
  
   //Llamamos a la funcion recursiva "moverDiscos" resolver la Torre de Hanoi
   //La misma tiene 4 parametros, la cantidad de discos, la fila origen (1), la fila destino (2), la fila auxiliar (3)
   //Nuestra funcion recursiva nos dira todos los pasos a hacer para llevar todos los discos de la fila 1 a la fila 2, usando la fila 3 como auxiliar
   moverDiscos(cantDiscos, 1, 2, 3);
   printf ("\n\n");
   getchar();
 
   //Fin del programa
   return 0;
}
 
//Implemento la funcion "moverDiscos"
void moverDiscos (int n, int origen, int destino, int aux){
   
   //Mientras haya discos a ser movidos (n>0)
   if (n > 0){      
      //Llamo a la funcion moverDiscos (recursividad), pasandole como parametro un disco menos, la fila origen (1) como origen y fila auxiliar (3) como destino
      moverDiscos (n-1, origen, aux, destino);

      //Imprimo el movimiento del disco origen al destino
      printf("Muevo un disco de %d a %d\n", origen, destino);

      //Llamo a la funcion moverDiscos (recursividad), pasandole como parametro un disco menos, la fila auxiliar (3) como origen y fila destino (2) como destino
      moverDiscos (n-1, aux, destino, origen);
   }
}