program archivo_leer;
uses crt;

type

	mae = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
		Saldo: real;
		Baja: string[1];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_maestro = file of mae;

var
	reg: mae;
	arch: archivo_maestro; //Uso el tipo de dato definido
	RecordCount: integer;
	
Procedure InicializarArchivo(VAR arch_local: archivo_maestro);
	
	begin

		assign(arch_local, 'datos_mae.dat');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(arch_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

begin
	//Creo el archivo 
	InicializarArchivo(arch);
	RecordCount := 0;
	writeln('Cuenta |  Denominacion | Domicilio | Sucursal | Saldo | Baja');

	while not eof(arch) do
		begin

			read(arch, reg);
			
			writeln(reg.Cuenta, ' | ', reg.Denominacion, ' | ', reg.Domicilio, ' | ', reg.SucursalId, ' | ', reg.Saldo:8:2, ' | ', reg.Baja);
			
			//Pausa para ver registro porcesados
			RecordCount := RecordCount + 1;
			if RecordCount mod 10 = 0 then delay(2000);
		end;

	close(arch);

end.