program SECUENCIA_CREAR;
uses crt;

type
	sec_numero = file of integer;

var
	sec: sec_numero;
	v: integer;

Procedure InicializarSecuencia(VAR sec_local: sec_numero);
	
	begin
		assign(sec_local, 'datos_secuencia_num.dat');

		//Control de acciones sobre el archivo
		{$I-}				
			rewrite(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then
		      writeln('No se pudo crear el archivo...ERROR');	  	

	end;


begin
	
	InicializarSecuencia(sec);
	
	writeln('Ingrese cada valor separado de un ENTER...(-1 para salir)');

	//Bucle de CARGA
	repeat
	
		readln(v);

		case v of		 		
			-1 : WriteLn('saliendo...');
		else
			//Guardo en la secuencia a medida que escribo
			write(sec, v);			
		end;

	until v=-1; {Si ingreso -1 salgo...}
		
	close(Sec);
end.