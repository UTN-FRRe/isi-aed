//Para anidados  
#include <stdio.h>

int main ()
{
    int i, j;
    for (i = 0; i < 8; i++)
    {
        for (j = i; j < 8; j++)
            printf(".");
        
        printf("\n");
    }
}