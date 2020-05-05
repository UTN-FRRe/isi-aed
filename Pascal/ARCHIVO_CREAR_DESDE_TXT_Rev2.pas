program archivo_crear;
uses crt, SysUtils;

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
	archivo_origen = text;

var
	reg: auto;
	arch: archivo_autos; //Uso el tipo de dato definido
	
	sec: archivo_origen;
	registro: string;

	RecordCount: integer;

Procedure InicializarArchivo(VAR arch_local: archivo_autos);
	
	begin

		assign(arch_local, 'datos_auto.dat');

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

		assign(sec_local, 'datos_para_corte.csv');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure tratarRegistroTxt(reg_txt_local: string; VAR reg_local: auto);
	var 
		i: integer;
		count: integer;
		field: string;

	begin
		//Inicializo variables
		reg_local.prov := '';
		reg_local.dpto := 0;
		reg_local.ciu := 0;
		reg_local.dominio := '';
		reg_local.modelo := 0;

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
							1: reg_local.prov := field; 							   
							2: reg_local.dpto := StrToInt(field);
							3: reg_local.ciu := StrToInt(field);
							4: reg_local.dominio := field;
							5: reg_local.modelo := StrToInt(field);						
						end;

						field := '';
					end;

				//Trato el ultimo campo
				if i = Length(reg_txt_local) then
					begin
						reg_local.tipo := field;							
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
			if RecordCount mod 10 = 0 then delay(1500);
		end;

	writeln('PROCESO TERMINADO!!!!');
	close(arch);

end.