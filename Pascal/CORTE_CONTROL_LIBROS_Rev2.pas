program archivo_corte_2;
uses crt, sysutils;

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

	acum_total, acum_loc, acum_pcia: longint; 

	resg_pcia: integer;
	resg_loc: integer;

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

Procedure Inicializar;
	begin
		acum_loc := 0;
		acum_pcia := 0;
	end;


Procedure CorteCiudad;
	begin
		//Escribo totales parciales		
		writeln('---------------------------------------------');
		writeln('Total ciudad: ', resg_loc, ' -- total ventas: ', acum_loc);
		writeln('---------------------------------------------');
		
		//Acumulo a nivel superior
		acum_pcia := acum_pcia + acum_loc;

		//Pongo cero los acumuladores de provincia
		acum_loc := 0;

		//Resguardo las clasves
		resg_loc := reg.loc;
		
		//Freno para ver
		delay(2500);
	end;

Procedure CorteProvincia;
	begin
		//Lamo al corte inferior
		CorteCiudad;		

		//Escribo totales parciales		
		writeln('****************************************');
		writeln('Total provincia: ', resg_pcia, ' -- Total ventas: ', acum_pcia);
		writeln('****************************************');

		//Acumulo a nivel gral
		acum_total := acum_total + acum_pcia;

		//Pongo cero los acumuladores de provincia
		acum_pcia := 0;

		//Resguardo las clasves
		resg_pcia := reg.pcia;
		
		//Freno para ver
		delay(2500);
	end;

begin
	//Creo el archivo vacion
	InicializarArchivo(arch);

	//Inicializar variables
	Inicializar;

	RecordCount := 0;

	while not eof(arch) do
		begin
			read(arch, reg);

			RecordCount := RecordCount + 1;

			//Controlo que no ingrese con el primer registro al corte
			if RecordCount > 1 then
				begin
					if resg_pcia <> reg.pcia then
						CorteProvincia
					else if resg_loc <> reg.loc then
							CorteCiudad;
				end
			else
				begin
					//Hago el primer resguardo
					resg_pcia := reg.pcia;
					resg_loc := reg.loc;
				end;

			acum_loc := acum_loc + (reg.Precio * reg.Cant);			

			writeln('(Reg ', RecordCount, ') ********', reg.nombre, ' -- ', reg.precio, ' -- ', reg.cant);			
		end;

	CorteProvincia;

	//Veo total gral
	writeln('****************************************');
	writeln('TOTAL GENERAL: $', acum_total);			
	writeln('****************************************');

	close(arch);

end.