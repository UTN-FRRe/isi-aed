program SUBSECUENCIA;
uses crt;

var
	sec: text;
	v: char;
	i: Integer;

Procedure InicializarSecuencia(VAR sec_local: text);
	
	begin

		assign(sec_local, 'datos_secuencia.txt');

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

			//Leo el nombre
			while v <> '-' do
				begin
					read(Sec, v);

					write(v);
				end;

			//Linea de separacion
			writeln;

			//Leo el DNI
			for i := 1 to 8 do 
				begin
					read(Sec, v);

					write(v);
				end;						

			//Linea de separacion
			writeln;
			writeln('***********************************');

		end;
		
	close(Sec);
end.