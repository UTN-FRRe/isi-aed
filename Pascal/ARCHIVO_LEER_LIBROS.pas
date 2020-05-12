program archivo_leer;
uses crt;

type

	fecha = record
		dia, mes, anio: integer;
	end;

	libro = record
		pcia: integer;
		loc: integer;
		suc: string;
		fechaventa: fecha;		
		nombre: string;
		precio: longint;
		cant: longint;
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_libros = file of libro;

var
	reg: libro;
	arch: archivo_libros; //Uso el tipo de dato definido
	RecordCount: integer;

Procedure InicializarArchivo(VAR arch_local: archivo_libros);
	
	begin

		assign(arch_local, 'datos_libro.dat');

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
	writeln('Provincia --  Ciudad -- Sucursal -- Libro -- Precio -- Cantidad ');

	while not eof(arch) do
		begin

			read(arch, reg);

			writeln(reg.pcia, ' -- ', reg.loc, ' -- ', reg.suc, ' -- ', reg.nombre, ' -- ', reg.precio, ' -- ', reg.cant);

			//Pausa para ver registros procesados
			RecordCount := RecordCount + 1;			
			if RecordCount mod 100 = 0 then delay(1000);
		end;

	close(arch);

end.