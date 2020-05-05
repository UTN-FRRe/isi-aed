program SINO;
uses crt; 

var 
	c: integer;

begin
	
	writeln('Ingrese un valor entero, vamos a verificar si es par o impar...');
	readln(c);
	
	if c MOD 2 = 0 then

		writeln('Es PAR!!')

	else
	
		writeln('Es IMPAR!!');				

end.