program archivo_leer;
uses crt;

type

	fecha = record
		dia: 1..31;
		mes: 1..12;
		anio: 1900..9999;		
	end;

	persona = record
		nombre: string[50];
		dir: string[50];
		mail: string[80];
		fecha_nac: fecha;
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_personas = file of persona;

var
	reg: persona;
	arch: archivo_personas; //Uso el tipo de dato definido
	RecordCount: integer;
	
Procedure InicializarArchivo(VAR arch_local: archivo_personas);
	
	begin

		assign(arch_local, 'datos.dat');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(arch_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

begin
	//Creo el archivo vacion
	InicializarArchivo(arch);
	RecordCount := 0;
	writeln('Nombre --  Domicilio -- E-Mail -- Nacimiento: Dia / Mes / Año');

	while not eof(arch) do
		begin

			read(arch, reg);
			
			writeln(reg.nombre, ' -- ', reg.dir, ' -- ', reg.mail, ' -- ', reg.fecha_nac.dia, '/', reg.fecha_nac.mes, '/', reg.fecha_nac.anio);
			
			//Pausa para ver registro porcesados
			RecordCount := RecordCount + 1;
			if RecordCount mod 10 = 0 then delay(2000);
		end;

	close(arch);

end.