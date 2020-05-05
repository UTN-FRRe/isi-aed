program SECUENCIA_CREAR;
uses crt;

var
	sec: TEXT;
	v: char;

Procedure InicializarSecuencia(VAR sec_local: TEXT);
	
	begin
		assign(sec_local, 'datos_secuencia.txt');

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
	
	//Bucle de CARGA
	repeat
		v:=ReadKey;
		case v of		 
			#27 : WriteLn('ESC');
		else
			begin
				//Guardo en la secuencia a medida que escribo
				write(sec, v);

				//Muestro por pantalla lo que voy escribiendo
				write(v);
			end; 
		end;
	until v=#27; {Si presiono ESC salgo...}
		
	close(Sec);
end.