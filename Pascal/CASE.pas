program SEGUN;
uses crt; 

var 
	c: integer;

begin
	
	writeln('Ingrese un valor entero de 1 a 7 y deterinamos el dia de la semana correspondiente...');
	readln(c);
	
	case c of
		1: Writeln ('LUNES');		
		2: Writeln ('MARTES');		
		3: Writeln ('MIERCOLES');		
		4: Writeln ('JUEVES');		
		5: Writeln ('VIERNES');		
		6: Writeln ('SABADO');		
		7: Writeln ('DOMINGO');
	else
		Writeln ('Entre 1 y 7!!!!!!');
	end;
end.