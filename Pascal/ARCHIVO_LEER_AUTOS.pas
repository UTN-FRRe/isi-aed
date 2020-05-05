program archivo_leer;
uses crt;

type

	auto = record
		prov: string[50];
		dpto: integer;
		ciu: integer;
		dominio: string[7];
		modelo: integer;
		tipo: string[50];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_autos = file of auto;

var
	reg: auto;
	arch: archivo_autos; //Uso el tipo de dato definido
	RecordCount: integer;

Procedure InicializarArchivo(VAR arch_local: archivo_autos);
	
	begin

		assign(arch_local, 'datos_auto.dat');

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
	writeln('Provincia --  Dpto -- Ciudad -- Dominio -- Modelo -- Tipo');

	while not eof(arch) do
		begin

			read(arch, reg);

			writeln(reg.prov, ' -- ', reg.dpto, ' -- ', reg.ciu, ' -- ', reg.dominio, ' -- ', reg.modelo, ' -- ', reg.tipo);

			//Pausa para ver registros procesados
			RecordCount := RecordCount + 1;			
			if RecordCount mod 10 = 0 then delay(1500);
		end;

	close(arch);

end.