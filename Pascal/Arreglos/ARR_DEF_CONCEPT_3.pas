program ARR_DEF_CONCEPT_3;

uses crt, SysUtils, Math;

type

	datos = record
		codigo: integer;
		nombre: string;
		descripcion: string;
	end;

	T_V = array[1..5] of datos;

var	
	
	V: T_V;
	
	i: integer;


Procedure CARGA_TECLADO_VECTOR(var X: T_V);
	begin	
		for i := 1 to 5 do
			begin
				write('Ingrese codigo - Pos ', i, ': ');
				readln(X[i].codigo);
				write('Ingrese nombre - Pos ', i, ': ');
				readln(X[i].nombre);
				write('Ingrese desc - Pos ', i, ': ');
				readln(X[i].descripcion);				
			end;
	end;


begin	
	
	CARGA_TECLADO_VECTOR(V);
	
	for i := 1 to 5 do
		begin
			write('Codigo - Posicion ', i, ': ', V[i].codigo);		
			writeln;
			write('Nombre - Posicion ', i, ': ', V[i].nombre);		
			writeln;
			write('Desc - Posicion ', i, ': ', V[i].descripcion);		
			writeln;						
		end;
	
	
end.