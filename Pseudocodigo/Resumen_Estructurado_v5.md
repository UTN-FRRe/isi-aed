# Resumen Estructurado de Pseudocodigo (v5)

## Tabla resumen de acciones

| Archivo | AcciÃ³n | Tiene E/S | Tiene Condicional |
|---------|--------|-----------|-------------------|
| ACT INDEX [TEMPLATE].txt | ACT_INDEX_1 | True | True |
| ACT INDEX BAJA FIS [TEMPLATE].txt | ACT_INDEX_2 | True | True |
| ACTUALIZACION INC LOTE [TEMPLATE].txt | ACT_INC | True | True |
| ACTUALIZACION INC UNI [TEMPLATE].txt | ACT_INC | True | True |
| ARCHIVO_CREAR.txt | REGISTRO | True | False |
| ARCHIVO_LEER.txt | REGISTRO | True | False |
| ARREGLOS_Conceptos.txt | ARR_DEF_CONCEPT | True | False |
| CORTE DE CONTROL [TEMPLATE Rev2].txt | archivo_corte | True | False |
| CORTE DE CONTROL [TEMPLATE].txt | archivo_corte | True | False |
| CORTE DE CONTROL LIBROS.txt | archivo_corte | True | False |
| CORTE DE CONTROL.txt | archivo_corte | True | False |
| FUNCION.txt | FUNCION | True | False |
| MEZCLA EXC [TEMPLATE].txt | MEZCLA_EXC | True | True |
| MEZCLA INC [TEMPLATE].txt | MEZCLA_INC | True | True |
| Mientras.txt | MIENTRAS | True | False |
| Para.txt | PARA | True | False |
| PROCEDIMIENTO1.txt | PROCEDIMIENTO | True | False |
| REGISTRO.txt | REGISTRO | True | False |
| Repetir.txt | REPETIR | True | False |
| SECUENCIA.txt | SECUENCIA | True | False |
| SECUENCIA_NUM.txt | SECUENCIA | True | False |
| Segun.txt | SEGUN | True | True |
| Si.txt | SI | True | True |
| Sino.txt | SINO | True | True |
| SUB SECUENCIA JER.txt | SECUENCIA | True | False |
| SUBSECUENCIA.txt | SECUENCIA | True | False |

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

### Asignaciones
reg_mae.Baja := '*';
reg_mae.Campo1 := Campo1;
reg_mae.Campo2 := Campo2;
reg_mae.Campo4 := Campo4;
reg_mae.Baja := '-';

### Bucles
MIENTRAS (op = 'S') HACER

### Llamadas a procedimientos
Procedimiento MODIF_BAJA(TipoMov: caracter);
ESC('Ingrese clave');
//Leo en el archivo MAESTRO
SINO
ESC('Ingrese Campo1: ');
FIN_SI;
ESC('Ingrese Campo2: ');
FIN_SI;
[...]
ESC('Ingrese Campo4: ');
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
//Leo en el archivo MAESTRO
ESC('ERROR, REGISTRO YA EXISTE!!!');
SINO
ESC('Ingrese Campo1: ');
ESC('Ingrese Campo2: ');
[...]
ESC('Ingrese Campo4: ');
FIN_SI;
Fin_Proc;
PROCESO
ABRIR E/S(arch_mae);
ESC('Ingrese opciÃ³n para continuar S/N');
ESC('Ingrese accion A/B/M');
'A': ALTA;
'B', 'M': MODIF_BAJA(acc);
CONTRARIO:
ESC('Accion INCORRECTA');
FIN_SEGUN;
ESC('Ingrese opciÃ³n para continuar S/N');
FIN_MIENTRAS;
CERRAR(arch_mae);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

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

### Asignaciones
reg_mae.Campo1 := Campo1;
reg_mae.Campo2 := Campo2;
reg_mae.Campo4 := Campo4;

### Bucles
MIENTRAS (op = 'S') HACER

### Llamadas a procedimientos
Procedimiento BAJA;
ESC('Ingrese clave');
//Leo en el archivo MAESTRO
ELIMINAR(arch_mae, reg_mae);
SINO
ESC('ERROR, REGISTRO NO EXISTE!!!');
FIN_SI
Fin_Proc;
Procedimiento MODIFICACION;
ESC('Ingrese clave');
//Leo en el archivo MAESTRO
ESC('Ingrese Campo1: ');
FIN_SI;
ESC('Ingrese Campo2: ');
FIN_SI;
[...]
ESC('Ingrese Campo4: ');
FIN_SI;
//Grabo en el MAESTRO el registro modificado
RE-ESCRIBIR(arch_mae_act, reg_mae);
SINO
ESC('ERROR, REGISTRO NO EXISTE!!!');
FIN_SI
Fin_Proc;
Procedimiento ALTA;
ESC('Ingrese clave');
//Leo en el archivo MAESTRO
ESC('ERROR, REGISTRO YA EXISTE!!!');
SINO
ESC('Ingrese Campo1: ');
ESC('Ingrese Campo2: ');
[...]
ESC('Ingrese Campo4: ');
FIN_SI;
Fin_Proc;
PROCESO
ABRIRe/s(arch_mae);
ESC('Ingrese opciÃ³n para continuar S/N');
ESC('Ingrese accion A/B/M');
'A': ALTA;
'B': BAJA;
'M': MODIFICACION;
CONTRARIO:
ESC('Accion INCORRECTA');
FIN_SEGUN;
ESC('Ingrese opciÃ³n para continuar S/N');
FIN_MIENTRAS;
CERRAR(arch_mae);
CERRAR(arch_mae_act);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
reg_mae.clave := HV;
reg_mov.clave := HV;
aux_mae.Baja := '*';
aux_mae.Campo1 := reg_mov.Campo1;
aux_mae.Campo2 := reg_mov.Campo2;
aux_mae.Campo4 := reg_mov.Campo4;
aux_mae := reg_mae;
aux_mae.clave := reg_mov.clave;
aux_mae.Campo1 := reg_mov.Campo1;
aux_mae.Campo2 := reg_mov.Campo2;
aux_mae.Campo4 := reg_mov.Campo4;
aux_mae.Baja := '-';

### Bucles
MIENTRAS (aux_mae.clave = reg_mov.clave) HACER
MIENTRAS (reg_mae.clave <> HV) o (reg_mov.clave <> HV) HACER

### Llamadas a procedimientos
Procedimiento LEER_arch_mae;
FIN_SI;
Fin_Proc;
Procedimiento LEER_arch_mov;
FIN_SI;
Fin_Proc;
Procedimiento PASO_DIRECTO;
Fin_Proc;
Procedimiento IGUALES;
SINO
SINO
FIN_SI;
FIN_SI;
[...]
FIN_SI;
FIN_SI;
FIN_SI;
Fin_Proc;
Procedimiento LOTE;
IGUALES;
LEER_arch_mov;
FIN_MIENTRAS;
Fin_Proc;
PROCESO
ABRIRe(arch_mae); ABRIRe(arch_mov);
LEER_arch_mae; LEER_arch_mov;
PASO_DIRECTO;
LEER_arch_mae;
SINO
LOTE;
LEER_arch_mae;
SINO
//HAGO EL ALTA EN AUX...
[...]
LOTE;
FIN_SI;
FIN_SI;
FIN_MIENTRAS;
CERRAR(arch_mae); CERRAR(arch_mov);
CERRAR(arch_mae_act);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
reg_mae.clave := HV;
reg_mov.clave := HV;
reg_mae.Baja := '*';
reg_mae.Campo1 := reg_mov.Campo1;
reg_mae.Campo2 := reg_mov.Campo2;
reg_mae.Campo4 := reg_mov.Campo4;
reg_mae.Campo1 := reg_mov.Campo1;
reg_mae.Campo2 := reg_mov.Campo2;
reg_mae.Campo4 := reg_mov.Campo4;
reg_mae.Baja := '-';

### Bucles
MIENTRAS (reg_mae.clave <> HV) o (reg_mov.clave <> HV) HACER

### Llamadas a procedimientos
Procedimiento LEER_arch_mae;
FIN_SI;
Fin_Proc;
Procedimiento LEER_arch_mov;
FIN_SI;
Fin_Proc;
Procedimiento PASO_DIRECTO;
Fin_Proc;
Procedimiento IGUALES;
SINO
SINO
FIN_SI;
FIN_SI;
[...]
FIN_SI;
FIN_SI;
FIN_SI;
Fin_Proc;
Procedimiento DISTINTOS;
SINO
SINO
[...]
FIN_SI;
FIN_SI;
Fin_Proc;
PROCESO
ABRIRe(arch_mae); ABRIRe(arch_mov);
ABRIRs(arch_mae_act);
LEER_arch_mae; LEER_arch_mov;
PASO_DIRECTO;
LEER_arch_mae;
SINO
IGUALES;
LEER_arch_mae;
LEER_arch_mov;
SINO
DISTINTOS;
LEER_arch_mov;
FIN_SI;
FIN_SI;
FIN_MIENTRAS;
CERRAR(arch_mae); CERRAR(arch_mov);
CERRAR(arch_mae_act);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
opcion := "S"

### Bucles
MIENTRAS opcion = "S" HACER

### Llamadas a procedimientos
Algoritmo
ABRIRs(arch);
FinMientras;
CERRAR(arch);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
MIENTRAS NFDA(arch) HACER

### Llamadas a procedimientos
Algoritmo
ABRIRe(arch);
FinMientras;
CERRAR(arch);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
ESCRIBIR("Nombre --  Domicilio -- E-Mail -- Nacimiento: Dia / Mes / AÃ±o")
ESCRIBIR(reg.nombre, reg.dir, reg.mail, reg.fecha_nac.dia, "/", reg.fecha_nac.mes, "/", reg.fecha_nac.aÃ±o)
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
PARA i := 1 HASTA 10 HACER
PARA i := 1 HASTA 3 HACER
PARA j := 1 HASTA 3 HACER
PARA i := 1 HASTA 10 HACER
PARA i := 1 HASTA 3 HACER
PARA j := 1 HASTA 3 HACER

### Bucles
(ninguna)

### Llamadas a procedimientos
Procedimiento CARGA_TECLADO_VECTOR(var X: ARREGLO[1..10] de ENTERO);
Fin_Para;
Fin_Proc;
Procedimiento CARGA_TECLADO_MATRIZ(var X: ARREGLO[1..3, 1..3] de ENTERO);
Fin_Para;
Fin_Para;
Fin_Proc;
PROCESO
CARGA_TECLADO_VECTOR(V);
Fin_Para;
CARGA_TECLADO_MATRIZ(M);
Fin_Para;
Fin_Para;
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
resg_clave1 := reg.clave1;
resg_clave2 := reg.clave2;
resg_clave1 := reg.clave1;
resg_clave2 := reg.clave2;

### Bucles
MIENTRAS NFDA(arch) HACER

### Llamadas a procedimientos
Procedimiento Inicializar;
Proceso
[Inicializo CONTADORES y ACUMULADORES]
[Inicializo RESGUARDO INICIAL]
fin_proc;
Procedimiento EmitirTotalesGenerales;
Proceso
[TOTALES GENERALES]
fin_proc;
Procedimiento CorteClave1;
Proceso
//Lamo al corte inferior
CorteClave2;
//Escribo totales parciales
//Acumulo a nivel superior (TOTALES GENERALES)
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Procedimiento CorteClave2;
Proceso
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Proceso
//Abro el archivo solo lectura
ABRIRe(arch);
//Obtengo el 1er registro
//Inicializar variables y resguardos
Inicializar;
[TRATAR CORTE]
SI resg_clave1 <> reg.clave1 then
CorteClave1
SINO SI resg_clave2 <> reg.clave2 then
CorteClave2
FIN_SI;
[TRATAR REGISTRO]
FIN_MIENTRAS;
CorteClave1;
EmitirTotalesGenerales;
CERRAR(arch);
FIN_ACCION.

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
fecha = registro

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

### Asignaciones
resg_clave1 := reg.clave1;
resg_clave2 := reg.clave2;
resg_clave3 := reg.clave3;
resg_clave1 := reg.clave1;
resg_clave2 := reg.clave2;
resg_clave3 := reg.clave3;

### Bucles
MIENTRAS NFDA(arch) HACER

### Llamadas a procedimientos
Procedimiento Inicializar;
Proceso
[Inicializo CONTADORES y ACUMULADORES]
[Inicializo RESGUARDO INICIAL]
fin_proc;
Procedimiento EmitirTotalesGenerales;
Proceso
[TOTALES GENERALES]
fin_proc;
Procedimiento CorteClave1;
Proceso
//Lamo al corte inferior
CorteClave2;
//Escribo totales parciales
//Acumulo a nivel superior (TOTALES GENERALES)
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Procedimiento CorteClave2;
Proceso
//Lamo al corte inferior
CorteClave3;
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Procedimiento CorteClave3;
Proceso
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Proceso
//Abro el archivo solo lectura
ABRIRe(arch);
//Obtengo el 1er registro
//Inicializar variables y resguardos
Inicializar;
[TRATAR CORTE]
SI resg_clave1 <> reg.clave1 then
CorteClave1
SINO SI resg_clave2 <> reg.clave2 then
CorteClave2
SINO SI resg_clave3 <> reg.clave3 then
CorteClave3
FIN_Si;
FIN_SI;
FIN_SI;
[TRATAR REGISTRO]
FIN_MIENTRAS;
CorteClave1;
EmitirTotalesGenerales;
CERRAR(arch);
FIN_ACCION.

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
ejemplo = registro

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

### Asignaciones
acum_ciudad := 0;
acum_pcia: real := 0;
resg_clave1 := reg.Pcia;
resg_clave2 := reg.Loc;
acum_pcia := 0;
resg_clave1 := reg.Pcia;
acum_pcia := acum_pcia + acum_loc;
acum_loc := 0;
resg_clave2 := reg.clave2;
acum_loc := acum_loc + (reg.Precio * reg.Cant);

### Bucles
MIENTRAS NFDA(arch) HACER

### Llamadas a procedimientos
Procedimiento Inicializar;
Proceso
fin_proc;
Procedimiento CorteClave1;
Proceso
//Lamo al corte inferior
CorteClave2;
//Escribo totales parciales
ESC("Total pcia:", resg_clave1, " = ", acum_pcia);
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Procedimiento CorteClave2;
Proceso
//Escribo totales parciales
ESC("Total loc:", resg_clave2, " = ", acum_loc);
//Acumulo a nivel superior
//Pongo cero los acumuladores de clave1
//Resguardo las claves
fin_proc;
Proceso
ABRIRe(arch);
Inicializar;
SI resg_clave1 <> reg.pcia then
CorteClave1
SINO SI resg_clave2 <> reg.loc then
CorteClave2
FIN_SI;
FIN_MIENTRAS;
CorteClave1;
CERRAR(arch);
FIN_ACCION.

[ACCIONES DE ENTRADA SALIDA]
LEER(arch, reg);
LEER(arch, reg);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
fecha = registro

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

### Asignaciones
autos_mas_5_ciu := 0; autos_mas_5_dpto := 0; autos_mas_5_prov := 0;
autos_mas_5_tot := 0;
autos_menos_5_ciu := 0; autos_menos_5_dpto := 0; autos_menos_5_prov := 0;
autos_menos_5_tot := 0;
resg_prov := reg.prov;
resg_dpto := reg.dpto;
resg_ciu := reg.ciu;
autos_mas_5_dpto := autos_mas_5_dpto + autos_mas_5_ciu;
autos_menos_5_dpto := autos_menos_5_dpto + autos_menos_5_ciu;
autos_mas_5_ciu := 0;
autos_menos_5_ciu := 0;
resg_ciu := reg.ciu;
autos_mas_5_prov := autos_mas_5_prov + autos_mas_5_dpto;
autos_menos_5_prov := autos_menos_5_prov + autos_menos_5_dpto;
autos_mas_5_dpto := 0;
autos_menos_5_dpto := 0;
resg_dpto := reg.dpto;
autos_mas_5_tot := autos_mas_5_tot + autos_mas_5_prov;
autos_menos_5_tot := autos_menos_5_tot + autos_menos_5_prov;
autos_mas_5_prov := 0;
autos_menos_5_prov := 0;
resg_prov := reg.prov;
Anio_Actual := 2020;
autos_menos_5_ciu := autos_menos_5_ciu + 1
autos_mas_5_ciu := autos_mas_5_ciu + 1;

### Bucles
MIENTRAS NFDA(arch) HACER

### Llamadas a procedimientos
Procedimiento Inicializar;
Proceso
//Hago el primer resguardo
fin_proc;
Procedimiento EmitirTotalesGenerales;
Proceso
fin_proc;
Procedimiento CorteCiudad;
Proceso
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de provincia
//Resguardo las claves
fin_proc;
Procedimiento CorteDpto;
Proceso
//Lamo al corte inferior
CorteCiudad;
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de provincia
//Resguardo las claves
fin_proc;
Procedimiento CorteProvincia;
Proceso
//Lamo al corte inferior
CorteDpto;
//Escribo totales parciales
//Acumulo a nivel superior
//Pongo cero los acumuladores de provincia
//Resguardo las claves
fin_proc;
Proceso
//Creo el archivo vacion
InicializarArchivo(arch);
//Inicializar variables y resguardos
Inicializar;
SI resg_prov <> reg.prov then
CorteProvincia
SINO SI resg_dpto <> reg.dpto then
CorteDpto
SINO SI resg_ciu <> reg.ciu then
CorteCiudad
FIN_Si;
FIN_SI;
FIN_SI;
//Tratar registro
SI Anio_Actual - reg.modelo <= 5 then
SINO
FIN_SI;
FIN_MIENTRAS;
CorteProvincia;
EmitirTotalesGenerales;
CERRAR(arch);
FIN_ACCION.

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

### Ejemplo de uso
auto = registro

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

### Asignaciones
Total := x + y;
Suma := Total;

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
{Asigno el valor a retornar}
Fin;
Algoritmo
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese dos valores enteros a sumar:');
Leer(b, c);
Escribir('La suma es: ', Suma(b, c));

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
MIENTRAS NoFDA(arch1) y NoFDA(arch2) HACER
MIENTRAS NoFDA(arch1) HACER
MIENTRAS NoFDA(arch2) HACER

### Llamadas a procedimientos
PROCESO
ABRIRe(arch1); ABRIRe(arch2);
[ACCIONES_ARCH1];
SINO
[ACCIONES_ARCH1];
[ACCIONES_ARCH2];
SINO
[ACCIONES_ARCH2];
FIN_SI;
FIN_MIENTRAS;
[ACCIONES_ARCH1];
FIN_MIENTRAS;
[ACCIONES_ARCH2];
FIN_MIENTRAS;
CERRAR(arch1); CERRAR(arch2);
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
reg1.clave := HV;
reg2.clave := HV;

### Bucles
MIENTRAS (reg1.clave <> HV) o (reg2.clave <> HV) HACER

### Llamadas a procedimientos
Procedimiento LEER_ARCH1;
FIN_SI;
Fin_Proc;
Procedimiento LEER_ARCH2;
FIN_SI;
Fin_Proc;
PROCESO
ABRIRe(arch1); ABRIRe(arch2);
LEER_ARCH1; LEER_ARCH2;
[ACCIONES_ARCH1];
LEER_ARCH1;
SINO
[ACCIONES_ARCH1];
LEER_ARCH1;
[ACCIONES_ARCH2];
LEER_ARCH2;
SINO
[ACCIONES_ARCH2];
LEER_ARCH2;
FIN_SI;
FIN_SI;
FIN_MIENTRAS;
CERRAR(arch1); CERRAR(arch2);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
LEER(arch1, reg1);
LEER(arch2, reg2);

[CONDICIONAL]
SI FDA(Arch1) ENTONCES
SI FDA(Arch2) ENTONCES
SI reg1.clave < reg2.clave ENTONCES
SI reg1.clave = reg2.clave ENTONCES

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Mientras.txt

**AcciÃ³n:** MIENTRAS

[ACCIONES SECUENCIAL]
ACCION [MIENTRAS] ES;

AMBIENTE
Ambiente
	c: entero;


PROCESO

### Asignaciones
c:= 1;
c := c + 1;

### Bucles
Mientras c <= 10 hacer

### Llamadas a procedimientos
Algoritmo
FinMientras;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Para.txt

**AcciÃ³n:** PARA

[ACCIONES SECUENCIAL]
ACCION [PARA] ES;

AMBIENTE
Ambiente
	c: entero;


PROCESO

### Asignaciones
{no necesito hacer: c := 1}
Para c := 1 hasta 10, 1 hacer

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
FinPara;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## PROCEDIMIENTO1.txt

**AcciÃ³n:** PROCEDIMIENTO

[ACCIONES SECUENCIAL]
ACCION [PROCEDIMIENTO] ES;

AMBIENTE
Ambiente
	s: alfanumerico(50);


PROCESO

### Asignaciones
(ninguna)

### Bucles
(ninguna)

### Llamadas a procedimientos
Procedimiento Saludo (text: alfanumerico(50));
Proceso
Fin;
Proceso
Saludo(s);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir('**************************');
Escribir(text);
Escribir('**************************');
Escribir('Ingrese texto para el saludo inicial...');
Leer(s);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
FinAccion.

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

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Repetir.txt

**AcciÃ³n:** REPETIR

[ACCIONES SECUENCIAL]
ACCION [REPETIR] ES;

AMBIENTE
Ambiente
	c: entero;


PROCESO

### Asignaciones
c:= 1;
c := c + 1;

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
Repetir
Hasta que c > 10;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir (c);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
MIENTRAS NFDS(sec) HACER

### Llamadas a procedimientos
Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);
Proceso
ARR(sec_local);
Fin;
Proceso
InicializarSecuencia(sec);
AVZ(Sec, v);
AVZ(Sec, v);
FIN_MIENTRAS;
CERRAR(Sec);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
MIENTRAS NFDS(sec) HACER

### Llamadas a procedimientos
Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de entero);
Proceso
ARR(sec_local);
Fin;
Proceso
InicializarSecuencia(sec);
AVZ(Sec, v);
AVZ(Sec, v);
FIN_MIENTRAS;
CERRAR(Sec);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Segun.txt

**AcciÃ³n:** SEGUN

[ACCIONES SECUENCIAL]
ACCION [SEGUN] ES;

AMBIENTE
Ambiente
	c: entero;


PROCESO

### Asignaciones
(ninguna)

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
1: Escribir ('LUNES');
2: Escribir ('MARTES');
3: Escribir ('MIERCOLES');
4: Escribir ('JUEVES');
5: Escribir ('VIERNES');
6: Escribir ('SABADO');
7: Escribir ('DOMINGO');
Contrario
FinSegun;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero de 1 a 7 y deterinamos el dia de la semana correspondiente...')
Leer(c);
Escribir('Entre 1 y 7!!!!!!');

[CONDICIONAL]
Segun c Hacer

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Si.txt

**AcciÃ³n:** SI

[ACCIONES SECUENCIAL]
ACCION [SI] ES;

AMBIENTE
Ambiente

	c: entero;


PROCESO

### Asignaciones
(ninguna)

### Bucles
(ninguna)

### Llamadas a procedimientos
Proceso
FinSi;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero, vamos a verificar si es multiplo de 10...')
Leer(c);
Escribir ('Es multiplo de 10!!');

[CONDICIONAL]
Si c MOD 10 = 0 Entonces

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

## Sino.txt

**AcciÃ³n:** SINO

[ACCIONES SECUENCIAL]
ACCION [SINO] ES;

AMBIENTE
Ambiente
	c: entero;
	

PROCESO

### Asignaciones
(ninguna)

### Bucles
(ninguna)

### Llamadas a procedimientos
Algoritmo
Contrario
FinSi;
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
Escribir('Ingrese un valor entero, vamos a verificar si es par o impar...')
Leer(c);
Escribir ('Es PAR!!'');
Escribir ('Es IMPAR!!'');

[CONDICIONAL]
Si c MOD 2 = 0 Entonces

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
(ninguna)

### Bucles
MIENTRAS NFDS(sec) HACER
MIENTRAS v <> '.' HACER
MIENTRAS v = ' ' HACER
MIENTRAS (v <> ' ') y (v <> '.')  HACER

### Llamadas a procedimientos
Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);
Algoritmo
ARR(sec_local);
Fin;
Algoritmo
InicializarSecuencia(sec);
AVZ(Sec, v);
AVZ(Sec, v);
FIN_MIENTRAS;
AVZ(Sec, v);
FIN_MIENTRAS;
FIN_MIENTRAS;
AVZ(sec, v);
FIN_MIENTRAS;
CERRAR(Sec);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

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

### Asignaciones
PARA i := 1 HASTA 8, 1 HACER

### Bucles
MIENTRAS v <> '-' HACER
MIENTRAS NFDS(sec) HACER

### Llamadas a procedimientos
Procedimiento InicializarSecuencia(VAR sec_local: SECUENCIA de caracter);
Algoritmo
ARR(sec_local);
Fin;
Procedimiento TratarNombre(VAR sec_local: SECUENCIA de caracter, v: caracter);
Algoritmo
AVZ(sec_local, v);
FIN_MIENTRAS;
Fin;
Procedimiento TratarDNI(VAR sec_local: SECUENCIA de caracter, v: caracter);
Algoritmo
AVZ(sec_local, v);
FIN_MIENTRAS;
Fin;
Algoritmo
InicializarSecuencia(sec);
AVZ(Sec, v);
TratarNombre(sec, v);
{Avanzo el guiÃ³n}
AVZ(sec, v);
TratarDNI(sec, v);
FIN_MIENTRAS;
CERRAR(Sec);
FinAccion.

[ACCIONES DE ENTRADA SALIDA]
ESCRIBIR(v);
ESCRIBIR(v);

[CONDICIONAL]
(ninguna)

FIN_ACCION.

### Ejemplo de uso
(no se encontrÃ³ descripciÃ³n)

---

