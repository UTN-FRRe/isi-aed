Program FUNCION;
uses crt;

Var
	b, c: Integer;

Function Suma (x, y: Integer): Integer;
	Var
		Total: Integer;

	Begin

		Total := x + y;

		{Asigno el valor a retornar}
		Suma := Total;
	End;


Function EsPar (n: Integer): Boolean;
	Begin

		if n MOD 2 = 0 then
			{Asigno el valor a retornar}
			EsPar := True
		else
			{Asigno el valor a retornar}
			EsPar := False;
	End;


Begin	
	
	writeln('Ingrese dos valores enteros a sumar:');
	readln(b, c);
	
	writeln('La suma es: ', Suma(b, c));

	writeln;
	writeln('********************************************');
	writeln;

	if EsPar(b) then
		writeln('El primer valor es PAR...')
	else
		writeln('El primer valor es IMPAR...');

End.