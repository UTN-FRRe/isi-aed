#include <stdio.h>
 
//function for factorial
long int factorial(int n)
{   
    
    //printf("%d\n", n);   

    if(n == 0) {        
        //printf("%d! = 1\n", n);   
        return 1;        
    }
    else {             
        //printf("%d * %d!\n", n, n-1);   
        return n * factorial(n-1);                    
    }    

}

int main()
{
    int num;
    long int fact=0;
     
    printf("Ingrese un numero entero: ");
    scanf("%d",&num);
     
    fact = factorial(num);

    printf("Factorial de %d es = %ld",num,fact);

    printf("\n");   
    
    return 0;
}