#include <stdio.h>
 
//funcion para calcular suma de los digitos 
int sumarDigitos(int num)
{
    static int sum = 0;

    if (num > 0)
    {
        
        sum += (num % 10); //suma el digito -- usa el resto de la division entera

        sumarDigitos(num / 10);

    }    
    else
    {
     
        return sum;

    }
}
int main()
{
    
    int numero,suma;
     
    printf("Ingrese un numero entero positivo: ");
    scanf("%d", &numero);
     
    suma = sumarDigitos(numero);
     
    printf("Suma de todos los digitos es: %d\n",suma);
 
    return 0;
    
}