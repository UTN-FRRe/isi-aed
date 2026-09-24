# Resumen Estructurado de Pseudocodigo (v4)
## ACT INDEX BAJA FIS [TEMPLATE].txt

**AcciÃ³n:** ACT_INDEX_2

[ACCIONES SECUENCIAL]
ACCION [ACT_INDEX_2] ES;

AMBIENTE
Ambiente
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


PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(reg_mae.clave);
LEER(arch_mae, reg_mae);
LEER(reg_mae.clave);
LEER(arch_mae, reg_mae);
LEER(Campo1);
LEER(Campo2);
LEER(Campo4);
LEER(reg_mae.clave);
LEER(arch_mae, reg_mae);
LEER(reg_mae.Campo1);
LEER(reg_mae.Campo2);
LEER(reg_mae.Campo4);
ESCRIBIR(arch_mae, reg_mae);
LEER(op);
LEER(acc);
LEER(op);

[CONDICIONAL]
SI EXISTE ENTONCES
SI EXISTE ENTONCES
SI Campo1 <> '' ENTONCES
SI Campo2 <> '' ENTONCES
SI Campo4 <> 0 ENTONCES
SI EXISTE ENTONCES
SEGUN acc HACER

FIN_ACCION.

---

## ACT INDEX [TEMPLATE].txt

**AcciÃ³n:** ACT_INDEX_1

[ACCIONES SECUENCIAL]
ACCION [ACT_INDEX_1] ES;

AMBIENTE
Ambiente	
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


PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(reg_mae.clave);
LEER(arch_mae, reg_mae);
LEER(Campo1);
LEER(Campo2);
LEER(Campo4);
LEER(reg_mae.clave);
LEER(arch_mae, reg_mae);
LEER(reg_mae.Campo1);
LEER(reg_mae.Campo2);
LEER(reg_mae.Campo4);
ESCRIBIR(arch_mae, reg_mae);
LEER(op);
LEER(acc);
LEER(op);

[CONDICIONAL]
SI EXISTE ENTONCES
SI TipoMov = 'B' ENTONCES
SI Campo1 <> '' ENTONCES
SI Campo2 <> '' ENTONCES
SI Campo4 <> 0 ENTONCES
SI EXISTE ENTONCES
SEGUN acc HACER

FIN_ACCION.

---

## ACTUALIZACION INC LOTE [TEMPLATE].txt

**AcciÃ³n:** ACT_INC

[ACCIONES SECUENCIAL]
ACCION [ACT_INC] ES;

AMBIENTE
Ambiente
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


PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch_mae, reg_mae);
LEER(arch_mov, reg_mov);
ESCRIBIR(arch_mae_act, reg_mae);
ESCRIBIR('ERROR - ALTA');
ESCRIBIR(arch_mae_act, aux_mae);

[CONDICIONAL]
SI FDA(arch_mae) ENTONCES
SI FDA(arch_mov) ENTONCES
SI reg_mov.TipoMov = 'A' ENTONCES
SI reg_mov.TipoMov = 'B' ENTONCES
SI reg_mov.Campo1 <> '' ENTONCES
SI reg_mov.Campo2 <> '' ENTONCES
SI reg_mov.Campo4 <> 0 ENTONCES
SI reg_mae.clave < reg_mov.clave ENTONCES
SI reg_mae.clave = reg_mov.clave ENTONCES

FIN_ACCION.

---

## ACTUALIZACION INC UNI [TEMPLATE].txt

**AcciÃ³n:** ACT_INC

[ACCIONES SECUENCIAL]
ACCION [ACT_INC] ES;

AMBIENTE
Ambiente
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


PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch_mae, reg_mae);
LEER(arch_mov, reg_mov);
ESCRIBIR(arch_mae_act, reg_mae);
ESCRIBIR('ERROR - ALTA');
ESCRIBIR(arch_mae_act, reg_mae);
ESCRIBIR(arch_mae_act, reg_mae);
ESCRIBIR('ERROR - BAJA');
ESCRIBIR('ERROR - MODIFICACION');
ESCRIBIR(arch_mae_act, reg_mae);

[CONDICIONAL]
SI FDA(arch_mae) ENTONCES
SI FDA(arch_mov) ENTONCES
SI reg_mov.TipoMov = 'A' ENTONCES
SI reg_mov.TipoMov = 'B' ENTONCES
SI reg_mov.Campo1 <> '' ENTONCES
SI reg_mov.Campo2 <> '' ENTONCES
SI reg_mov.Campo4 <> 0 ENTONCES
SI reg_mov.TipoMov = 'B' ENTONCES
SI reg_mov.TipoMov = 'M' ENTONCES
SI reg_mae.clave < reg_mov.clave ENTONCES
SI reg_mae.clave = reg_mov.clave ENTONCES

FIN_ACCION.

---

## ARCHIVO_CREAR.txt

**AcciÃ³n:** REGISTRO

[ACCIONES SECUENCIAL]
ACCION [REGISTRO] ES;

AMBIENTE
Ambiente
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
Ambiente
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
Ambiente	
	
	V: ARREGLO[1..10] de ENTERO;
	M: ARREGLO[1..3, 1..3] de ENTERO;

	i, j : entero;



PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR('Ingrese valor para posicion ', i, ': ');
LEER(V[i]);
ESCRIBIR('Ingrese valor para posicion - Fila ', i, ', Col ', j, ': ');
LEER(M[i, j]);
ESCRIBIR('Valor en la posicion ', i, ': ', V[i]);
ESCRIBIR('Valor en la posicion - Fila ', i, ', Col ', j, ': ', M[i, j]);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL LIBROS.txt

**AcciÃ³n:** archivo_corte

[ACCIONES SECUENCIAL]
ACCION [archivo_corte] ES;

AMBIENTE
	fecha = registro
		dia, mes, aÃ±o: entero;
	fin_reg;

	ejemplo = registro
		Pcia: entero;
		Loc: entero;
		Suc: AN[50];
		fechaventa: fecha;
		Nombre: AN[80];
		Precio: real;
		Cantidad: entero;
	fin_reg;
	
	reg: ejemplo;
	arch: ARCHIVO DE ejemplo;

	acum_ciudad, acum_pcia: real;

	resg_pcia: entero;
	resg_ciu: entero;
	

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL [TEMPLATE Rev2].txt

**AcciÃ³n:** archivo_corte

[ACCIONES SECUENCIAL]
ACCION [archivo_corte] ES;

AMBIENTE
	fecha = registro
		dia, mes, aÃ±o: entero;
	fin_reg;

	ejemplo = registro
		clave1: entero;
		clave2: entero;
		Suc: AN[50];
		fechaventa: fecha;
		Nombre: AN[80];
		Precio: real;
		Cantidad: entero;
	fin_reg;
	
	reg: ejemplo;
	arch: ARCHIVO DE ejemplo;

	acum_clave1, acum_clave2: real;

	resg_pcia: entero;
	resg_ciu: entero;
	

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL [TEMPLATE].txt

**AcciÃ³n:** archivo_corte

[ACCIONES SECUENCIAL]
ACCION [archivo_corte] ES;

AMBIENTE
	ejemplo = registro
		clave1: AN[50];
		clave2: entero;
		clave3: entero;
		campo1: AN[7];
		campo2: entero;
		campo3: AN[50];
	fin_reg;
	
	reg: ejemplo;
	arch: ARCHIVO DE ejemplo;

	[CONTADORES Y ACUMULADORES]

	[RESGUARDOS];
	resg_clave1: AN[50];
	resg_clave2: entero;
	resg_clave3: entero;
	

PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## CORTE DE CONTROL.txt

**AcciÃ³n:** archivo_corte

[ACCIONES SECUENCIAL]
ACCION [archivo_corte] ES;

AMBIENTE
	auto = registro
		prov: AN[50];
		dpto: entero;
		ciu: entero;
		dominio: AN[7];
		modelo: entero;
		tipo: AN[50];
	fin_reg;
	
	reg: auto;
	arch: ARCHIVO DE auto;

	autos_mas_5_ciu, autos_mas_5_dpto, autos_mas_5_prov, autos_mas_5_tot: entero;
	autos_menos_5_ciu, autos_menos_5_dpto, autos_menos_5_prov, autos_menos_5_tot: entero;
	resg_prov: AN[50];
	resg_ciu, resg_dpto: entero;
	RecordCount, Anio_Actual: entero;


PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR('---------------------------------------------');
ESCRIBIR('Total PAIS -- Autos: ', autos_mas_5_tot + autos_menos_5_tot);
ESCRIBIR('Total PAIS -- Autos menos de 5 anios: ', autos_menos_5_tot);
ESCRIBIR('Total PAIS -- Autos mas o igual a 5 anios: ', autos_mas_5_tot);
ESCRIBIR('Total ciudad: ', resg_ciu, ' -- Autos: ', autos_mas_5_ciu + autos_menos_5_ciu);
ESCRIBIR('Total ciudad -- Autos menos de 5 anios: ', autos_menos_5_ciu);
ESCRIBIR('Total ciudad -- Autos mas o igual a 5 anios: ', autos_mas_5_ciu);
ESCRIBIR('Total dpto: ', resg_dpto, ' -- Autos: ', autos_mas_5_dpto + autos_menos_5_dpto);
ESCRIBIR('Total dpto -- Autos menos de 5 anios: ', autos_menos_5_dpto);
ESCRIBIR('Total dpto -- Autos mas o igual a 5 anios: ', autos_mas_5_dpto);
ESCRIBIR('---------------------------------------------');
ESCRIBIR('Total provincia: ', resg_prov, ' -- Autos: ', autos_mas_5_prov + autos_menos_5_prov);
ESCRIBIR('Total provincia -- Autos menos de 5 anios: ', autos_menos_5_prov);
ESCRIBIR('Total provincia -- Autos mas o igual a 5 anios: ', autos_mas_5_prov);
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

## FUNCION.txt

**AcciÃ³n:** FUNCION

[ACCIONES SECUENCIAL]
ACCION [FUNCION] ES;

AMBIENTE
Ambiente
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
Ambiente

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
Ambiente
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


PROCESO

[ACCIONES DE ENTRADA SALIDA]
LEER(arch1, reg1);
LEER(arch2, reg2);

[CONDICIONAL]
SI FDA(Arch1) ENTONCES
SI FDA(Arch2) ENTONCES
SI reg1.clave < reg2.clave ENTONCES
SI reg1.clave = reg2.clave ENTONCES

FIN_ACCION.

---

## Mientras.txt

**AcciÃ³n:** MIENTRAS

[ACCIONES SECUENCIAL]
ACCION [MIENTRAS] ES;

AMBIENTE
Ambiente
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
Ambiente
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
Ambiente
	s: alfanumerico(50);


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
Ambiente
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
Ambiente
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
Ambiente
	sec: SECUENCIA de caracter;

	v: caracter;


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
Ambiente
	sec: SECUENCIA de entero;
	v: entero;


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
Ambiente
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
Ambiente

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
Ambiente
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
Ambiente
	sec: SECUENCIA de caracter;
	v: caracter;
	i: entero;


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
Ambiente
	sec: SECUENCIA de caracter;
	v: caracter;
	i: entero;


PROCESO

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

---

