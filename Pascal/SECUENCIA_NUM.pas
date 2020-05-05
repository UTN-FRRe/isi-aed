program SECUENCIA;
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
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;


begin
	
	InicializarSecuencia(sec);
	
	while not eof(sec) do
		begin
			read(Sec, v);

			writeln(v);
		end;

	//Escribo una líena en blanco para separar
	writeln;
	
	close(Sec);
end.