Program PROCEDIMIENTO;

uses crt;

var
	s: string;

Procedure Saludo (text: string);
	Begin
		writeln;
		writeln('-------------------------');
		writeln(text);
		writeln('*************************');
		writeln;
	End;


Begin	
	
	writeln('Ingrese texto para el saludo inicial...');
	readln(s);

	Saludo(s);
	
End.