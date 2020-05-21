program archivo_crear;
uses crt, SysUtils, Math;

type

//Cuenta;Denominacion;Domicilio;SucursalId

	cliente = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_clientes = file of cliente;
	archivo_origen = text;

var
	reg: cliente;
	arch: archivo_clientes; //Uso el tipo de dato definido
	
	sec: archivo_origen;
	registro: string;

	RecordCount: integer;


Procedure InicializarArchivo(VAR arch_local: archivo_clientes);
	
	begin

		assign(arch_local, 'datos_cliente_suc2.dat');

		//Control de acciones sobre el archivo
		{$I-}				
			rewrite(arch_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure InicializarOrigen(VAR sec_local: archivo_origen);
	
	begin

		assign(sec_local, 'datos_mezcla_suc2.csv');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure tratarRegistroTxt(reg_txt_local: string; VAR reg_local: cliente);
	var 
		i: integer;
		count: integer;
		field: string;

	begin
		//Para reales usar conversion StrToFloat()
		{ Inicializo variables
		cliente = record
			Cuenta: longint;
			Denominacion: string[80];
			Domicilio: string[80];
			SucursalId: integer;
		end;
		}

		reg_local.Cuenta := 0;
		reg_local.Denominacion := '';
		reg_local.Domicilio := '';
		reg_local.SucursalId := 0;

		field := '';
		count := 0;

		for i := 1 to Length(reg_txt_local) do
			begin

				if reg_txt_local[i] <> ';' then
					field := field + reg_txt_local[i];
				
				if reg_txt_local[i] = ';' then
					begin
						count := count + 1;

						case count of
							1: reg_local.Cuenta := StrToInt(field);
							2: reg_local.Denominacion := field;						
							3: reg_local.Domicilio := field;													
						end;

						field := '';
					end;

				//Trato el ultimo campo
				if i = Length(reg_txt_local) then
					begin
						reg_local.SucursalId := StrToInt(field);
						field := '';
					end;
			end;
	end;


begin
	//Creo el archivo destino
	InicializarArchivo(arch);

	//Abro la secuencia de origen	
	InicializarOrigen(sec);

	RecordCount := 0;

	//Inicializo la variable que utilizo para leer la linea
	registro := '';

	while not eof(sec) do
		begin
			readln(sec, registro);

			writeln(registro);

			tratarRegistroTxt(registro, reg);

			write(arch, reg);			

			//Pauso para ver los registros que se tratan
			RecordCount := RecordCount + 1;
			if RecordCount mod 100 = 0 then delay(1000);
		end;

	writeln('PROCESO TERMINADO!!!!');
	close(arch);

end.