#include <stdio.h>
 
//function to count digits
int contarDigitos(int num)
{
    static int cant = 0;
     
    if(num > 0)
    {
        cant++;
        contarDigitos(num / 10);
    }
    else
    {
        return cant;
    }
}

int contarDigitos_2(int num)
{   
        
    if(num == 0) {        
        //printf("%d! = 1\n", n);   
        return 0;        
    }
    else {             
        //printf("%d\n", num);   
        return 1 + contarDigitos_2(num / 10);                    
    }    

}

int main()
{
    int numero;
    int cantidad = 0;
     
    printf("Ingrese un numero entero positivo: ");
    scanf("%d",&numero);
     
    cantidad = contarDigitos(numero);
     
    printf("Cantidad total de digitos en %d es: %d\n",numero, cantidad);

    cantidad = contarDigitos_2(numero);

    printf("Cantidad total de digitos (2) en %d es: %d\n",numero, cantidad);
     
    return 0;
}