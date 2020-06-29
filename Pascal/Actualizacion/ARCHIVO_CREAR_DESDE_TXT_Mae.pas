program archivo_crear;
uses crt, SysUtils, Math;

type

//Cuenta;Denominacion;Domicilio;SucursalId

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
	archivo_origen = text;

var
	reg: mae;
	arch: archivo_maestro; //Uso el tipo de dato definido
	
	sec: archivo_origen;
	registro: string;

	RecordCount: integer;


Procedure InicializarArchivo(VAR arch_local: archivo_maestro);
	
	begin

		assign(arch_local, 'datos_mae.dat');

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

		assign(sec_local, 'CuentasMae.csv');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure tratarRegistroTxt(reg_txt_local: string; VAR reg_local: mae);
	var 
		i: integer;
		count: integer;
		field: string;

	begin
		//Para reales usar conversion StrToFloat()
		{ Inicializo variables
		mae = record
			Cuenta: longint;
			Denominacion: string[80];
			Domicilio: string[80];
			SucursalId: integer;
			Saldo: real;
			Baja: string[1];
		end;
		}

		reg_local.Cuenta := 0;
		reg_local.Denominacion := '';
		reg_local.Domicilio := '';
		reg_local.SucursalId := 0;
		reg_local.Saldo := 0.0;
		reg_local.Baja := '';

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
							4: reg_local.SucursalId := StrToInt(field);
							5: reg_local.Saldo := StrToFloat(field);
						end;

						field := '';
					end;

				//Trato el ultimo campo
				if i = Length(reg_txt_local) then
					begin
						reg_local.Baja := field;
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