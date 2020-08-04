program ARR_DEF_CONCEPT_2;

uses crt, SysUtils, Math;

type
	T_V = array[1..5] of integer;

var	
	
	V: T_V;

	i, j: integer;


Procedure INICIALIZAR_VECTOR(var X: T_V);
	begin	
		//Pongo a 0 cada elemento del vector apra usarlo como acumulador
		for i := 1 to 5 do
			X[i] := 0;
	end;

Procedure SUMA_RANDOM_VECTOR(var X: T_V);	
	var
		valor: integer;

	begin	

		//Iteraciones para acumular
		for j := 1 to 3 do
			//Recorro el vector (recorrido total)
			for i := 1 to 5 do
				begin	
					//Genero numero aleatorio			
					valor := random(10) + 1;

					//Muestro por pantalla el valor a acumular
					writeln('Iteracion:', j, ' -- Pos: ', i, ' -- Acumulando (RND): ', valor);
						
					//Acumulo valor en posicion actual (segun valor del indice i)
					X[i] := X[i] + valor;

				end;

	end;

Procedure MOSTRAR_VECTOR(X: T_V);
	begin
		//Muestro contenido total del vector
		for i := 1 to 5 do
			begin
				write('Posicion ', i, ': ', X[i]);		
				writeln;
			end;
	end;

begin	
	//Inicializa generador de numeros aleatorios
	randomize;

	//Pongo a cero los elementos del vector
	INICIALIZAR_VECTOR(V);

	//Genero suma con valroes aleatorios
	SUMA_RANDOM_VECTOR(V);
	
	//Muestro contenido del vector
	MOSTRAR_VECTOR(V);
	
end.