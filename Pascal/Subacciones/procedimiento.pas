program proc_1;
uses crt;

var
	texto: string;
	

procedure saludar(saludo: string);
	
	begin
		writeln('***************************');
		writeln(saludo);
		writeln('***************************');
	end;


begin
	//Invoco al procedimiento pasando un valor constante...
	saludar('PRUEBA CON TEXTO CONSTANTE...');

	//Solicito que se ingrese un texto arbitrario por teclado...
	writeln('Ingrese texto para saludar: ');
	readln(texto);

	//Invoco al procedimiento pasando la variable asignada desde el teclado
	saludar(texto);

end.