program MIENTRAS;
uses crt;

var
	c: integer;

begin
	ClrScr; {Limpio la pantalla}

	c:= 1;
	
	while c <= 10 do
		begin

			writeln(c);
		
			c := c + 1;

		end;

end.
