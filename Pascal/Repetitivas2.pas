program REPETIR;
uses crt;

var
	c: integer;

begin
	ClrScr; {Limpio la pantalla}
	c:= 1;
	
	repeat

		writeln(c);

		c := c + 1;

	until c > 0;
	
end.
