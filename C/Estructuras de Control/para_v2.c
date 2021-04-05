//ejemplo for loop
//Controlado por 2 variables

#include <stdio.h>

int main ()
{
    int a, b;
    for (a = 1, b = 4; a < b; a++, b--)
    {
        printf("a = %d \n", a);
        printf("b = %d \n", b);
    }
}