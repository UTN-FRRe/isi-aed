Program PROCEDIMIENTO2;
uses crt;

var
	n1, n2: Integer; {<-- variables globales}

Procedure Intercambio (var num1, num2: Integer);
	var
		aux: Integer;  {<-- variable local}

	Begin

		aux := num1;
		num1 := num2;
		num2 := aux;

	End;


Begin	
	
	writeln('Ingrese valores para elintercambio...');
	readln(n1, n2);

	writeln('************************************');

	writeln('N1: ', n1);
	writeln('N2: ', n2);

	{Llamo al procedimiento que hace el cambio...}
	Intercambio(n1, n2);

	writeln('************************************');

	writeln('Intercambio realizado...');
	writeln('N1: ', n1);
	writeln('N2: ', n2);

End.