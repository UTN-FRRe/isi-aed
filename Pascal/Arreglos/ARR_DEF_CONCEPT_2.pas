program ARR_DEF_CONCEPT_2;

uses crt, SysUtils, Math;

type
	T_V = array[1..10] of integer;
	T_M = array[1..3, 1..3] of integer;

var	
	
	V: T_V;
	M: T_M;

	i, j: integer;
	suma: integer;

Procedure CARGA_RANDOM_VECTOR(var X: T_V);
	begin	
		for i := 1 to 10 do
			X[i] := random(50) + 1;
	end;

Procedure CARGA_RANDOM_MATRIZ(var X: T_M);
	begin
		for i := 1 to 3 do
			for j := 1 to 3 do
				X[i, j] := random(50) + 1;				
	end;

begin	
	//Creo numeros aleatorios
	randomize;

	CARGA_RANDOM_VECTOR(V);
	
	suma := 0;

	for i := 1 to 10 do
		begin
			write('Posicion ', i, ': ', V[i]);		
			suma := suma + V[i];
			writeln;
		end;
	
	writeln('Suma total = ', suma);		

	CARGA_RANDOM_MATRIZ(M);
	
	for i := 1 to 3 do
		for j := 1 to 3 do
			begin
				write('Posicion - Fila ', i, ', Col ', j, ': ', M[i, j]);			
				writeln;
			end;	
end.