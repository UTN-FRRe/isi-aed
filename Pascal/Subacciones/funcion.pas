program func_1;
uses crt;

var
	resultado, valor1, valor2: longint;
	

function suma(sum1, sum2: longint): longint;
	var
		result: longint;

	begin
		result := sum1 + sum2;

		suma := result;
	end;

function division(dividendo, divisor: longint): longint;
	var
		result: longint;

	begin
		if divisor = 0 then
			result := -1
		else
			result := dividendo div divisor;

		division := result;
	end;

begin

	{
		 Voy a usar la combinación de estos caracteres especiales: #13#10 (CR + LF = Retorno de carro)
		 para dejar una linea en blanco de separación. Seria similar a escribir un WRITELN() sin 
		 parámetros. 
	}

	//Pruebo el parametro pasando un valor variable leido por teclado...
	writeln('Ingrese dos numeros enteros para realizar la operacion'#13#10'suma y division (el segundo numero debe ser distinto a cero): ');
	readln(valor1, valor2);

	//Invoco a la funion suma() dentro del ESCRIBIR()
	writeln(#13#10'El resultado de la suma es = ', suma(valor1, valor2));

	{
		Invoco a la funcion division y asigno el resultado a una variable.
		Utilizo una variable ya que debo evaluar previamente a emitir un mensaje de resultado...
		Si lo desarrollo asì evito una llamada extra a la funcion
	}
	resultado := division(valor1, valor2);

	if resultado = -1 then
		writeln(#13#10'ERROR division por 0...')
	else
		writeln(#13#10'El resultado de la division es = ', resultado);

end.