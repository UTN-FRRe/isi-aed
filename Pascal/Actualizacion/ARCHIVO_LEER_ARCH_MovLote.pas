program archivo_leer;
uses crt;

type

	mov = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
		Saldo: real;
		TipoMov: string[1];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_movstro = file of mov;

var
	reg: mov;
	arch: archivo_movstro; //Uso el tipo de dato definido
	RecordCount: integer;
	
Procedure InicializarArchivo(VAR arch_local: archivo_movstro);
	
	begin

		assign(arch_local, 'datos_mov_lote.dat');

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
	writeln('Cuenta |  Denominacion | Domicilio | Sucursal | Saldo | TipoMov');

	while not eof(arch) do
		begin

			read(arch, reg);
			
			writeln(reg.Cuenta, ' | ', reg.Denominacion, ' | ', reg.Domicilio, ' | ', reg.SucursalId, ' | ', reg.Saldo:8:2, ' | ', reg.TipoMov);
			
			//Pausa para ver registro porcesados
			RecordCount := RecordCount + 1;
			if RecordCount mod 10 = 0 then delay(2000);
		end;

	close(arch);

end.