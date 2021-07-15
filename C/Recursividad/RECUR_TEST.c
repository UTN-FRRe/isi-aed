#include <stdio.h>
 
#define TOPE 255

//function for factorial
void secuencia(int val, n, *v)
{   
        
    if(n != 0) {        

        scanf("Ingrese valor: %d", &v[n]);         

        secuencia(v, n + 1);                   

        printf("Elemento: %d \n", v[n], n);
    }    

}

int main()
{
    int num = 0, valor = 0;

    int V[TOPE];

    secuencia(valor, num, V);
    
    printf("\n");   
    
    return 0;
}