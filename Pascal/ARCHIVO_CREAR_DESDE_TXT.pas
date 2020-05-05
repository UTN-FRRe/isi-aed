program archivo_crear;
uses crt, SysUtils;

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
	archivo_origen = text;


var
	reg: persona;
	arch: archivo_personas; //Uso el tipo de dato definido
	
	sec: archivo_origen;
	registro: string;


Procedure InicializarArchivo(VAR arch_local: archivo_personas);
	
	begin

		assign(arch_local, 'datos.dat');

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

		assign(sec_local, 'datos.txt');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure tratarRegistroTxt(reg_txt_local: string; VAR reg_local: persona);
	var 
		i: integer;
		count: integer;
		field: string;

	begin

		field := '';
		count := 0;

		writeln(reg_txt_local);

		for i := 1 to Length(reg_txt_local) do
			begin

				if reg_txt_local[i] <> ';' then
					field := field + reg_txt_local[i];
				
				if reg_txt_local[i] = ';' then
					begin
						count := count + 1;

						case count of
							1: reg_local.nombre := field;
							2: reg_local.dir := field;
							3: reg_local.mail := field;
							4: reg_local.fecha_nac.dia := StrToInt(field);
							5: reg_local.fecha_nac.mes := StrToInt(field);						
						end;

						field := '';
					end;

				//Trato el ultimo campo
				if i = Length(reg_txt_local) then
					begin
						reg_local.fecha_nac.anio := StrToInt(field);							
						field := '';
					end;
			end;
	end;


begin
	//Creo el archivo destino
	InicializarArchivo(arch);

	//Abro la secuencia de origen	
	InicializarOrigen(sec);


	while not eof(sec) do
		begin
			readln(sec, registro);

			tratarRegistroTxt(registro, reg);

			write(arch, reg);			
		end;

	writeln('PROCESO TERMINADO!!!!');
	close(arch);

end.