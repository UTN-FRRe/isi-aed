program archivo_crear;
uses crt;

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

var
	reg: persona;
	arch: archivo_personas; //Uso el tipo de dato definido
	opcion: char;

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

begin
	//Creo el archivo vacion
	InicializarArchivo(arch);

	opcion := 'S';

	while upcase(opcion) = 'S' do
		begin
			writeln('Ingrese los datos de la persona...');

			writeln('Ingrese Nombre...');		
			readln(reg.nombre);

			writeln('Ingrese Domicilio...');		
			readln(reg.dir);

			writeln('Ingrese E-Mail...');		
			readln(reg.mail);

			writeln('Ingrese Fecha de Nacimiento...');		
			writeln('Ingrese Dia...');		
			readln(reg.fecha_nac.dia);

			writeln('Ingrese mes...');		
			readln(reg.fecha_nac.mes);

			writeln('Ingrese Año...');		
			readln(reg.fecha_nac.anio);

			write(arch, reg);			

			ClrScr; //limpio pantalla
			writeln('Ingresa otra persona? S/N...');
			readln(opcion);
		end;

	close(arch);

end.