program SECUENCIA;
uses crt;

var
	sec: text;
	v: char;
	cont: integer;

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
	cont := 0;

	while not eof(sec) do
		begin
			read(Sec, v);

			cont := cont + 1;

			write(v);
		end;

	//Escribo una líena en blanco para separar
	writeln;
	
	writeln('Cantidad de caracteres: ', cont);

	close(Sec);
end.