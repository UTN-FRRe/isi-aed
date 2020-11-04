#include <stdio.h>
 
//funcion para calcualr la potencia
long int getPotencia(int b,int p)
{
    long int result = 1;

    if (p == 0) return result;

    result = b * (getPotencia(b, p-1));  //llamada funcion recursiva
}
int main()
{
    int base,potencia;
    long int resultado;
     
    printf("Ingrese valor de la base: ");
    scanf("%d",&base);
     
    printf("Ingrese valor de la potencia: ");
    scanf("%d",&potencia);
     
    resultado = getPotencia(base,potencia);
     
    printf("%d elevado a la %d es: %ld\n",base, potencia, resultado);
     
    return 0;
}