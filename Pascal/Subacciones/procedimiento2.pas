program proc_1;
uses crt;

var
	texto: string;
	

procedure saludar(saludo: string);
	var
		encabezado_local: string;

	begin
		{
		 Voy a usar la combinación de estos caracteres especiales: #13#10 (CR + LF = Retorno de carro)
		 para dejar una linea en blanco de separación. Seria similar a escribir un WRITELN() sin 
		 parámetros. 
		}

		encabezado_local := '<TEXTO>: ';

		writeln('***************************'#13#10); 		
		writeln(encabezado_local, saludo,#13#10); 
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