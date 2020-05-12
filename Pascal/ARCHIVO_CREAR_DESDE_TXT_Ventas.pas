program archivo_crear;
uses crt, SysUtils, Math;

type

//Rubro;DIA;MES;ANIO;CodProducto;Producto;PrecioVenta;Cantidad
	fecha = record
		dia, mes, anio: integer;
	end;

	venta = record
		rubro: string[80];
		fechaventa: fecha;
		cod: longint;
		prod: string[80];
		precio: longint;
		cant: longint;
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_ventas = file of venta;
	archivo_origen = text;

var
	reg: venta;
	arch: archivo_ventas; //Uso el tipo de dato definido
	
	sec: archivo_origen;
	registro: string;

	RecordCount: integer;

function TratarPuntoFlotante(s: string): double;
	var
  		x: Double;
  		fs: TFormatSettings;

	begin

		x := NaN;
		fs := FormatSettings;
  		fs.DecimalSeparator := '.';
  		fs.ThousandSeparator := ',';

  		if not TryStrToFloat(s, x, fs) then 
			x := NaN;

  		if IsNaN(x) then
    		TratarPuntoFlotante := 0.0
  		else
    		TratarPuntoFlotante := StrToFloat(s);
	end;

Procedure InicializarArchivo(VAR arch_local: archivo_ventas);
	
	begin

		assign(arch_local, 'datos_venta.dat');

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

		assign(sec_local, 'Ventas1.csv');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(sec_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure tratarRegistroTxt(reg_txt_local: string; VAR reg_local: venta);
	var 
		i: integer;
		count: integer;
		field: string;

	begin
		//Para reales usar conversion StrToFloat()
		{ Inicializo variables
			rubro: integer;
			fechaventa: fecha;
			cod: integer;
			prod: string[80];
			precio: double;
			cant: double;
		}

		reg_local.rubro := '';
		reg_local.fechaventa.dia := 0;
		reg_local.fechaventa.dia := 0;
		reg_local.fechaventa.anio := 0;
		reg_local.cod := 0;
		reg_local.prod := '';
		reg_local.precio := 0;
		reg_local.cant := 0;

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
							1: reg_local.rubro := field;
							2: reg_local.fechaventa.dia := StrToInt(field);
							3: reg_local.fechaventa.dia := StrToInt(field);
							4: reg_local.fechaventa.anio := StrToInt(field);
							5: reg_local.cod := StrToInt(field);						
							6: reg_local.prod := field;						
							7: reg_local.precio := StrToInt(field); 
						end;

						field := '';
					end;

				//Trato el ultimo campo
				if i = Length(reg_txt_local) then
					begin
						reg_local.cant := StrToInt(field);
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