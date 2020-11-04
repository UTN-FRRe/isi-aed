 #include <stdio.h>

int ackermann(int,int);

int main(){

 int m,n;

 printf("Primer argumento para la funcion Ackermann (m): ");
 scanf("%d", &m);

 printf("Segundo argumento para la funcion Ackermann (n): ");
 scanf("%d", &n);

 printf("Ackermann (%d,%d) = %d\n", m,n,ackermann(m,n));
 return 0;
}

int ackermann(int m, int n){
     if(m == 0) {
      
      return n + 1;

     }
     else if (n == 0) {
      
      return ackermann(m-1, 1);

     }
     else {
      
      return ackermann(m-1, ackermann(m, n-1));

     } 
}