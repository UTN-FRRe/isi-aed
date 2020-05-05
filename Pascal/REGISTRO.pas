program REGISTRO;
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

var
	reg: persona;


begin
	
	writeln('Ingrese los datos de la persona...');
	writeln('-----------------------------------');

	writeln('Nombre:');
	readln(reg.nombre);

	writeln('Direccion:');
	readln(reg.dir);

	writeln('Correo electronico:');
	readln(reg.mail);

	writeln('Fecha de nacimiento:');
	readln(reg.fecha_nac.dia, reg.fecha_nac.mes, reg.fecha_nac.anio);

	writeln('******************************************');

	writeln('Datos ingresados:');
	writeln(reg.nombre, ' // ',  reg.dir, ' // ', reg.mail, ' // ', reg.fecha_nac.dia, '/', reg.fecha_nac.mes, '/', reg.fecha_nac.anio);

end.