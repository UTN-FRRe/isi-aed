program ARR_DEF_CONCEPT;

uses crt, SysUtils, Math;

type
	T_V = array[1..10] of integer;
	T_M = array[1..3, 1..3] of integer;

var	
	
	V: T_V;
	M: T_M;

	i, j: integer;


Procedure CARGA_TECLADO_VECTOR(var X: T_V);
	begin	
		for i := 1 to 10 do
			begin
				write('Ingrese valor para posicion ', i, ': ');
				readln(X[i]);
			end;
	end;

Procedure CARGA_TECLADO_MATRIZ(var X: T_M);
	begin
		for i := 1 to 3 do
			for j := 1 to 3 do
				begin
					write('Ingrese valor para posicion - Fila ', i, ', Col ', j, ': ');
					readln(X[i, j]);
				end;	
	end;

begin	
	
	CARGA_TECLADO_VECTOR(V);
	
	for i := 1 to 10 do
		begin
			write('Posicion ', i, ': ', V[i]);		
			writeln;
		end;
	
	CARGA_TECLADO_MATRIZ(M);
	
	for i := 1 to 3 do
		for j := 1 to 3 do
			begin
				write('Posicion - Fila ', i, ', Col ', j, ': ', M[i, j]);			
				writeln;
			end;	
end.