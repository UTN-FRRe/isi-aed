# Resumen Estructurado de Pseudocodigo
## ACT INDEX BAJA FIS [TEMPLATE].txt

**AcciÃ³n:** ACT_INDEX_2

[ACCIONES SECUENCIAL]
ACCION [ACT_INDEX_2] ES;

AMBIENTE
mae = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
	fin_registro;	

	reg_mae: mae;
	arch_mae: ARCHIVO de mae INDEXADO por clave;
	Campo1: AN(50);
	Campo2: AN(50);
	Campo3: AN(80);
	Campo4: Real;
	op, acc: caracter;

Procedimiento BAJA;
	ESC('Ingrese clave');
	LEER(reg_mae.clave);

	//Leo en el archivo MAESTRO
	LEER(arch_mae, reg_mae);

	SI EXISTE ENTONCES
		ELIMINAR(arch_mae, reg_mae);	
	SINO	
		ESC('ERROR, REGISTRO NO EXISTE!!!');
	FIN_SI	
Fin_Proc;

Procedimiento MODIFICACION;
	ESC('Ingrese clave');
	LEER(reg_mae.clave);

	//Leo en el archivo MAESTRO
	LEER(arch_mae, reg_mae);

	SI EXISTE ENTONCES

		ESC('Ingrese Campo1: ');
		LEER(Campo1);

		SI Campo1 <> '' ENTONCES
			reg_mae.Campo1 := Campo1;
		FIN_SI;

		ESC('Ingrese Campo2: ');
		LEER(Campo2);

		SI Campo2 <> '' ENTONCES
			reg_mae.Campo2 := Campo2;
		FIN_SI;

		[...]

		ESC('Ingrese Campo4: ');
		LEER(Campo4);

		SI Campo4 <> 0 ENTONCES
			reg_mae.Campo4 := Campo4;
		FIN_SI;		

		//Grabo en el MAESTRO el registro modificado
		RE-ESCRIBIR(arch_mae_act, reg_mae);

	SINO	
		ESC('ERROR, REGISTRO NO EXISTE!!!');
	FIN_SI
Fin_Proc;

Procedimiento ALTA;
	ESC('Ingrese clave');
	LEER(reg_mae.clave);

	//Leo en el archivo MAESTRO
	LEER(arch_mae, reg_mae);

	SI EXISTE ENTONCES
		ESC('ERROR, REGISTRO YA EXISTE!!!');
	SINO	
		ESC('Ingrese Campo1: ');
		LEER(reg_mae.Campo1);
		ESC('Ingrese Campo2: ');
		LEER(reg_mae.Campo2);
		[...]
		ESC('Ingrese Campo4: ');
		LEER(reg_mae.Campo4);

		ESCRIBIR(arch_mae, reg_mae);
	FIN_SI;
Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(op);
LEER(acc);
LEER(op);

[CONDICIONAL]
SEGUN acc HACER

FIN_ACCION.

---

## ACT INDEX [TEMPLATE].txt

**AcciÃ³n:** ACT_INDEX_1

[ACCIONES SECUENCIAL]
ACCION [ACT_INDEX_1] ES;

AMBIENTE
mae = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
		Baja: caracter;
	fin_registro;	

	reg_mae: mae;
	arch_mae: ARCHIVO de mae INDEXADO por clave;

	Campo1: AN(50);
	Campo2: AN(50);
	Campo3: AN(80);
	Campo4: Real;
	op, acc: caracter;

Procedimiento MODIF_BAJA(TipoMov: caracter);
	ESC('Ingrese clave');
	LEER(reg_mae.clave);

	//Leo en el archivo MAESTRO
	LEER(arch_mae, reg_mae);

	SI EXISTE ENTONCES

		SI TipoMov = 'B' ENTONCES
			reg_mae.Baja := '*';
		SINO			
			ESC('Ingrese Campo1: ');
			LEER(Campo1);

			SI Campo1 <> '' ENTONCES
				reg_mae.Campo1 := Campo1;
			FIN_SI;

			ESC('Ingrese Campo2: ');
			LEER(Campo2);

			SI Campo2 <> '' ENTONCES
				reg_mae.Campo2 := Campo2;
			FIN_SI;

			[...]

			ESC('Ingrese Campo4: ');
			LEER(Campo4);

			SI Campo4 <> 0 ENTONCES
				reg_mae.Campo4 := Campo4;
			FIN_SI;		

		FIN_SI;

		//Grabo en el MAESTRO el registro modificado
		RE-ESCRIBIR(arch_mae, reg_mae);

	SINO	
		ESC('ERROR, REGISTRO NO EXISTE!!!');
	FIN_SI
Fin_Proc;

Procedimiento ALTA;
	ESC('Ingrese clave');
	LEER(reg_mae.clave);

	//Leo en el archivo MAESTRO
	LEER(arch_mae, reg_mae);

	SI EXISTE ENTONCES
		ESC('ERROR, REGISTRO YA EXISTE!!!');
	SINO	
		ESC('Ingrese Campo1: ');
		LEER(reg_mae.Campo1);
		ESC('Ingrese Campo2: ');
		LEER(reg_mae.Campo2);
		[...]
		ESC('Ingrese Campo4: ');
		LEER(reg_mae.Campo4);

		reg_mae.Baja := '-';		

		ESCRIBIR(arch_mae, reg_mae);
	FIN_SI;
Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(op);
LEER(acc);
LEER(op);

[CONDICIONAL]
SEGUN acc HACER

FIN_ACCION.

---

## ACTUALIZACION INC LOTE [TEMPLATE].txt

**AcciÃ³n:** ACT_INC

[ACCIONES SECUENCIAL]
ACCION [ACT_INC] ES;

AMBIENTE
HV = 99999999;

	mae = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
		Baja: Caracter;
	fin_registro;	

	mov = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
		TipoMov: ('A', 'B', 'M');
	fin_registro;	

	aux_mae, reg_mae: mae;
	arch_mae, arch_mae_act: ARCHIVO de mae;

	reg_mov: mov;
	arch_mov: ARCHIVO de mov;

Procedimiento LEER_arch_mae;
	LEER(arch_mae, reg_mae);
	SI FDA(arch_mae) ENTONCES
		reg_mae.clave := HV;
	FIN_SI;
Fin_Proc;

Procedimiento LEER_arch_mov;
	LEER(arch_mov, reg_mov);
	SI FDA(arch_mov) ENTONCES
		reg_mov.clave := HV;
	FIN_SI;
Fin_Proc;

Procedimiento PASO_DIRECTO;
	ESCRIBIR(arch_mae_act, reg_mae);
Fin_Proc;

Procedimiento IGUALES;
	SI reg_mov.TipoMov = 'A' ENTONCES
		ESCRIBIR('ERROR - ALTA');
	SINO
		SI reg_mov.TipoMov = 'B' ENTONCES
			aux_mae.Baja := '*';			
		SINO
			SI reg_mov.Campo1 <> '' ENTONCES
				aux_mae.Campo1 := reg_mov.Campo1;
			FIN_SI;

			SI reg_mov.Campo2 <> '' ENTONCES
				aux_mae.Campo2 := reg_mov.Campo2;
			FIN_SI;			

			[...]

			SI reg_mov.Campo4 <> 0 ENTONCES
				aux_mae.Campo4 := reg_mov.Campo4;
			FIN_SI;			

		FIN_SI;
	FIN_SI;
Fin_Proc;

Procedimiento LOTE;
	MIENTRAS (aux_mae.clave = reg_mov.clave) HACER
		IGUALES;
		LEER_arch_mov;
	FIN_MIENTRAS;

	ESCRIBIR(arch_mae_act, aux_mae);
Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
SI reg_mae.clave < reg_mov.clave ENTONCES
SI reg_mae.clave = reg_mov.clave ENTONCES

FIN_ACCION.

---

## ACTUALIZACION INC UNI [TEMPLATE].txt

**AcciÃ³n:** ACT_INC

[ACCIONES SECUENCIAL]
ACCION [ACT_INC] ES;

AMBIENTE
HV = 99999999;

	mae = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
		Baja: Caracter;
	fin_registro;	

	mov = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
		TipoMov: ('A', 'B', 'M');
	fin_registro;	

	reg_mae: mae;
	arch_mae, arch_mae_act: ARCHIVO de mae;

	reg_mov: mov;
	arch_mov: ARCHIVO de mov;

Procedimiento LEER_arch_mae;
	LEER(arch_mae, reg_mae);
	SI FDA(arch_mae) ENTONCES
		reg_mae.clave := HV;
	FIN_SI;
Fin_Proc;

Procedimiento LEER_arch_mov;
	LEER(arch_mov, reg_mov);
	SI FDA(arch_mov) ENTONCES
		reg_mov.clave := HV;
	FIN_SI;
Fin_Proc;

Procedimiento PASO_DIRECTO;
	ESCRIBIR(arch_mae_act, reg_mae);
Fin_Proc;

Procedimiento IGUALES;
	SI reg_mov.TipoMov = 'A' ENTONCES
		ESCRIBIR('ERROR - ALTA');
	SINO
		SI reg_mov.TipoMov = 'B' ENTONCES
			reg_mae.Baja := '*';
			ESCRIBIR(arch_mae_act, reg_mae);
		SINO
			SI reg_mov.Campo1 <> '' ENTONCES
				reg_mae.Campo1 := reg_mov.Campo1;
			FIN_SI;

			SI reg_mov.Campo2 <> '' ENTONCES
				reg_mae.Campo2 := reg_mov.Campo2;
			FIN_SI;			

			[...]

			SI reg_mov.Campo4 <> 0 ENTONCES
				reg_mae.Campo4 := reg_mov.Campo4;
			FIN_SI;			

			ESCRIBIR(arch_mae_act, reg_mae);
		FIN_SI;
	FIN_SI;
Fin_Proc;

Procedimiento DISTINTOS;
	SI reg_mov.TipoMov = 'B' ENTONCES
		ESCRIBIR('ERROR - BAJA');
	SINO
		SI reg_mov.TipoMov = 'M' ENTONCES
			ESCRIBIR('ERROR - MODIFICACION');
		SINO
			reg_mae.Campo1 := reg_mov.Campo1;
			reg_mae.Campo2 := reg_mov.Campo2;			
			[...]
			reg_mae.Campo4 := reg_mov.Campo4;
			reg_mae.Baja := '-';

			ESCRIBIR(arch_mae_act, reg_mae);
		FIN_SI;
	FIN_SI;
Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
SI reg_mae.clave < reg_mov.clave ENTONCES
SI reg_mae.clave = reg_mov.clave ENTONCES

FIN_ACCION.

---

## ARCHIVO_CREAR.txt

**AcciÃ³n:** REGISTRO

[ACCIONES SECUENCIAL]
ACCION [REGISTRO] ES;

AMBIENTE
fecha = REGISTRO
			dia: 1..31;
			mes: 1..12;
			aÃ±o: 1900..9999;
	fin_registro;	

	persona = REGISTRO
		nombre: AN(50);
		dir: AN(50);
		mail: AN(80);
		fecha_nac: fecha;
	fin_registro;

	arch: ARCHIVO de persona;
	reg: persona;

	opcion: caracer;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR('Ingrese los datos de la persona...');
ESCRIBIR('Ingrese Nombre...');
LEER(reg.nombre);
ESCRIBIR('Ingrese Domicilio...');
LEER(reg.dir);
ESCRIBIR('Ingrese E-Mail...');
LEER(reg.mail);
ESCRIBIR('Ingrese Fecha de Nacimiento...');
ESCRIBIR('Ingrese Dia...');
LEER(reg.fecha_nac.dia);
ESCRIBIR('Ingrese mes...');
LEER(reg.fecha_nac.mes);
ESCRIBIR('Ingrese AÃ±o...');
LEER(reg.fecha_nac.aÃ±o);
ESCRIBIR(arch, reg);
ESCRIBIR('DESEA CONTINUAR CARGANDO REGISTROS? S/N..');
LEER(opcion);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## ARCHIVO_LEER.txt

**AcciÃ³n:** REGISTRO

[ACCIONES SECUENCIAL]
ACCION [REGISTRO] ES;

AMBIENTE
fecha = REGISTRO
			dia: 1..31;
			mes: 1..12;
			aÃ±o: 1900..9999;
	fin_registro;	

	persona = REGISTRO
		nombre: AN(50);
		dir: AN(50);
		mail: AN(80);
		fecha_nac: fecha;
	fin_registro;

	reg: persona;
	arch: ARCHIVO de persona;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
ESCRIBIR("Nombre --  Domicilio -- E-Mail -- Nacimiento: Dia / Mes / AÃ±o")
ESCRIBIR(reg.nombre, reg.dir, reg.mail, reg.fecha_nac.dia, "/", reg.fecha_nac.mes, "/", reg.fecha_nac.aÃ±o)
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## ARREGLOS_Conceptos.txt

**AcciÃ³n:** ARR_DEF_CONCEPT

[ACCIONES SECUENCIAL]
ACCION [ARR_DEF_CONCEPT] ES;

AMBIENTE
V: ARREGLO[1..10] de ENTERO;
	M: ARREGLO[1..3, 1..3] de ENTERO;

	i, j : entero;


Procedimiento CARGA_TECLADO_VECTOR(var X: ARREGLO[1..10] de ENTERO);
	
	PARA i := 1 HASTA 10 HACER
		ESCRIBIR('Ingrese valor para posicion ', i, ': ');
		LEER(V[i]);
	Fin_Para;

Fin_Proc;

Procedimiento CARGA_TECLADO_MATRIZ(var X: ARREGLO[1..3, 1..3] de ENTERO);
	
	PARA i := 1 HASTA 3 HACER
		PARA j := 1 HASTA 3 HACER
			ESCRIBIR('Ingrese valor para posicion - Fila ', i, ', Col ', j, ': ');
			LEER(M[i, j]);
		Fin_Para;
	Fin_Para;

Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR('Valor en la posicion ', i, ': ', V[i]);
ESCRIBIR('Valor en la posicion - Fila ', i, ', Col ', j, ': ', M[i, j]);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL LIBROS.txt

**AcciÃ³n:** DESCONOCIDO

[ACCIONES SECUENCIAL]
ACCION [DESCONOCIDO] ES;

AMBIENTE
(vacÃ­o)

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL [TEMPLATE Rev2].txt

**AcciÃ³n:** DESCONOCIDO

[ACCIONES SECUENCIAL]
ACCION [DESCONOCIDO] ES;

AMBIENTE
(vacÃ­o)

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL [TEMPLATE].txt

**AcciÃ³n:** DESCONOCIDO

[ACCIONES SECUENCIAL]
ACCION [DESCONOCIDO] ES;

AMBIENTE
(vacÃ­o)

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL.txt

**AcciÃ³n:** DESCONOCIDO

[ACCIONES SECUENCIAL]
ACCION [DESCONOCIDO] ES;

AMBIENTE
(vacÃ­o)

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## FUNCION.txt

**AcciÃ³n:** FUNCION

[ACCIONES SECUENCIAL]
ACCION [FUNCION] ES;

AMBIENTE
b, c: entero;

Funcion Suma (x, y: Entero): Entero;
	Ambiente
		Total: Entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese dos valores enteros a sumar:');
Leer(b, c);
Escribir('La suma es: ', Suma(b, c));

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## MEZCLA EXC [TEMPLATE].txt

**AcciÃ³n:** MEZCLA_EXC

[ACCIONES SECUENCIAL]
ACCION [MEZCLA_EXC] ES;

AMBIENTE
ejemplo = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
	fin_registro;

	reg1, reg2: ejemplo;
	arch1, arch2: ARCHIVO de ejemplo;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch1, reg1); LEER(arch2, reg2);
LEER(arch1, reg1);
LEER(arch1, reg1);
LEER(arch2, reg2);
LEER(arch2, reg2);
LEER(arch1, reg1);
LEER(arch2, reg2);

[CONDICIONAL]
SI reg1.clave < reg2.clave ENTONCES
SI reg1.clave = reg2.clave ENTONCES

FIN_ACCION.

---

## MEZCLA INC [TEMPLATE].txt

**AcciÃ³n:** MEZCLA_INC

[ACCIONES SECUENCIAL]
ACCION [MEZCLA_INC] ES;

AMBIENTE
HV = 99999999;

	ejemplo = REGISTRO
		clave: Entero;
		Campo1: AN(50);
		Campo2: AN(50);
		Campo3: AN(80);
		Campo4: Real;
	fin_registro;	

	reg1, reg2: ejemplo;
	arch1, arch2: ARCHIVO de ejemplo;

Procedimiento LEER_ARCH1;
	LEER(arch1, reg1);
	SI FDA(Arch1) ENTONCES
		reg1.clave := HV;
	FIN_SI;
Fin_Proc;

Procedimiento LEER_ARCH2;
	LEER(arch2, reg2);
	SI FDA(Arch2) ENTONCES
		reg2.clave := HV;
	FIN_SI;
Fin_Proc;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
(ninguna)

[CONDICIONAL]
SI reg1.clave < reg2.clave ENTONCES
SI reg1.clave = reg2.clave ENTONCES

FIN_ACCION.

---

## Mientras.txt

**AcciÃ³n:** MIENTRAS

[ACCIONES SECUENCIAL]
ACCION [MIENTRAS] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## Para.txt

**AcciÃ³n:** PARA

[ACCIONES SECUENCIAL]
ACCION [PARA] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## PROCEDIMIENTO1.txt

**AcciÃ³n:** PROCEDIMIENTO

[ACCIONES SECUENCIAL]
ACCION [PROCEDIMIENTO] ES;

AMBIENTE
s: alfanumerico(50);

Procedimiento Saludo (text: alfanumerico(50));

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir('**************************');
Escribir(text);
Escribir('**************************');
Escribir('Ingrese texto para el saludo inicial...');
Leer(s);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## REGISTRO.txt

**AcciÃ³n:** REGISTRO

[ACCIONES SECUENCIAL]
ACCION [REGISTRO] ES;

AMBIENTE
fecha = REGISTRO
			dia: 1..31;   
			mes: 1..12;
			aÃ±o: 1900..2999;
	fin_registro;	

	persona = REGISTRO
		nombre: AN(50);
		dir: AN(50);
		mail: AN(80);
		fecha_nac: fecha;
		fecha_mat: fecha;
	fin_registro;

	auto = REGISTRO
		dom: AN(7);
		modelo: N(4);
		tipo, marca: AN(80);
		fecha_fab: fecha;
	fin_registro;

	reg_persona: persona;
	reg_auto: auto;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR('Ingrese los datos de la persona...');
ESCRIBIR('Nombre:');
LEER(reg.nombre);
ESCRIBIR('Direccion:');
LEER(reg.dir);
ESCRIBIR('Correo electronico:');
LEER(reg.mail);
ESCRIBIR('Fecha de nacimiento:');
LEER(reg.fecha_nac.dia, reg.fecha_nac.mes, reg.fecha_nac.aÃ±o);
ESCRIBIR('******************************************');
ESCRIBIR('Datos ingresados:');
ESCRIBIR(reg.nombre, ' ',  reg.dir, ' ', reg.mail, ' ', reg.fecha_nac.dia, '/', reg.fecha_nac.mes, '/', reg.fecha_nac.aÃ±o);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## Repetir.txt

**AcciÃ³n:** REPETIR

[ACCIONES SECUENCIAL]
ACCION [REPETIR] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## SECUENCIA.txt

**AcciÃ³n:** SECUENCIA

[ACCIONES SECUENCIAL]
ACCION [SECUENCIA] ES;

AMBIENTE
sec: SECUENCIA de caracter;

	v: caracter;

Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## SECUENCIA_NUM.txt

**AcciÃ³n:** SECUENCIA

[ACCIONES SECUENCIAL]
ACCION [SECUENCIA] ES;

AMBIENTE
sec: SECUENCIA de entero;
	v: entero;

Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de entero);

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## Segun.txt

**AcciÃ³n:** SEGUN

[ACCIONES SECUENCIAL]
ACCION [SEGUN] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero de 1 a 7 y deterinamos el dia de la semana correspondiente...')
Leer(c);
Escribir('Entre 1 y 7!!!!!!');

[CONDICIONAL]
Segun c Hacer

FIN_ACCION.

---

## Si.txt

**AcciÃ³n:** SI

[ACCIONES SECUENCIAL]
ACCION [SI] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero, vamos a verificar si es multiplo de 10...')
Leer(c);
Escribir ('Es multiplo de 10!!');

[CONDICIONAL]
Si c MOD 10 = 0 Entonces

FIN_ACCION.

---

## Sino.txt

**AcciÃ³n:** SINO

[ACCIONES SECUENCIAL]
ACCION [SINO] ES;

AMBIENTE
c: entero;

PROCESO

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero, vamos a verificar si es par o impar...')
Leer(c);
Escribir ('Es PAR!!'');
Escribir ('Es IMPAR!!'');

[CONDICIONAL]
Si c MOD 2 = 0 Entonces

FIN_ACCION.

---

## SUB SECUENCIA JER.txt

**AcciÃ³n:** SECUENCIA

[ACCIONES SECUENCIAL]
ACCION [SECUENCIA] ES;

AMBIENTE
sec: SECUENCIA de caracter;
	v: caracter;
	i: entero;

Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## SUBSECUENCIA.txt

**AcciÃ³n:** SECUENCIA

[ACCIONES SECUENCIAL]
ACCION [SECUENCIA] ES;

AMBIENTE
sec: SECUENCIA de caracter;
	v: caracter;
	i: entero;

Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);

PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

