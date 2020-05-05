program SI;
uses crt; 

var 
	c: integer;

begin
	
	writeln('Ingrese un valor entero, vamos a verificar si es multiplo de 10...');
	readln(c);

	if c MOD 10 = 0 then

		writeln('Es multiplo de 10!!');		

end.