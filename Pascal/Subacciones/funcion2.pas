program func_1;
uses crt;

var
	valor1: longint;
	

function suma(var sum1: longint): longint;

	begin
		sum1 := sum1 + 10;

		suma := sum1;
	end;

begin

	{
		 Voy a usar la combinación de estos caracteres especiales: #13#10 (CR + LF = Retorno de carro)
		 para dejar una linea en blanco de separación. Seria similar a escribir un WRITELN() sin 
		 parámetros. 
	}

	//Pruebo el parametro pasando un valor variable leido por teclado...
	writeln('Ingrese numero entero para realizar la operacion: ');
	readln(valor1);

	writeln(#13#10'El valor original = ', valor1);
	writeln(#13#10'El resultado de la funcion = ', suma(valor1));
	writeln(#13#10'El valor original luego de la funcion = ', valor1);

end.