program SUBSECUENCIA;
uses crt;

const
	punto = #46;
	blanco = #32;
	voc = ['a', 'e', 'i', 'o', 'u'];

var
	sec: text;
	v: char;
	c, o: integer;

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
	o := 0;

	while not eof(sec) do
		begin			

		//Contador de oraciones
		o := o + 1;

		//Contador de palabras por oracion
		c := 0;

		repeat 
				//avanzo blancos
				while (v = blanco) do				
					read(Sec, v);							

				//Controlo el caracter con que comienza la palabra
				if v in voc then c := c + 1;

				//Escribo el primer caracter de la palabra
				write(v);
				
				//Avanzo la palabra
				repeat 
					
						read(Sec, v);

						write(v);

				until (v = blanco) or (v = punto);

			until (v = punto);

			//Escribo las oraciones en renglones diferentes
			writeln;

			//Palabras que comienzan con vocal en la oracion
			writeln('Oracion: ', o, ' - Palabras que comienzan con vocal: ', c);

			//Escribo las oraciones en renglones diferentes
			writeln;

			//Paso el punto de la oracion
			read(Sec, v);

		end;
		
	close(Sec);
end.