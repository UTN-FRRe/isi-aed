# Esquemas genéricos de acciones en Pseudocódigo

---

## [ACCION SECUENCIAL]

```
ACCION [NOMBRE] ES;

AMBIENTE
[DEFINICION DE VARIABLES Y CONSTANTES]

PROCESO
    [SECUECIALES DE ASIGNACIÓN Y LLAMADAS]

FIN_ACCION.
```

---

## [ACCIONES DE ENTRADA SALIDA]

```
LEER(VARIABLES)
ESCRIBIR(PARAMETROS = VARIABLES, CONSTANTES, FUNCIONES)
```

*Se pueden combinar múltiples instrucciones `LEER` y `ESCRIBIR` dentro del bloque `PROCESO`.*

---

## [CONDICIONAL]

```
SI [CONDICIÓN] ENTONCES
    [ACCIONES]
FIN_SI;
```

*Se pueden anidar condicionales y usar `SINO` o `SINO SI` según el dialecto.*

---

## [REPETITIVAS]

### Mientras

```
MIENTRAS [CONDICIÓN] HACER
    [ACCIONES]
FIN_MIENTRAS;
```

### Repetir

```
REPETIR
    [ACCIONES]
HASTA QUE [CONDICIÓN];
```

### Para

```
PARA [VARIABLE] := [INICIO] HASTA [FIN] [PASO] HACER
    [ACCIONES]
FIN_PARA;
```

---

## [SEGUN] (CASE)

```
SEGUN [EXPRESIÓN] HACER
    [VALOR 1]: [ACCIONES];
    [VALOR 2]: [ACCIONES];
    ...
    CONTRARIO
        [ACCIONES POR DEFECTO];
FIN_SEGUN;
```

---

## [FUNCION] (opcional)

```
FUNCIÓN [NOMBRE]([PARÁMETROS]): [TIPO_DEVO];
    AMBIENTE
        [DEFINICIONES LOCALES];
    ALGORITMO
        [CUERPO];
        [NOMBRE] := [VALOR_DE_RETORNO];
    FIN;
```

---

*Estos esquemas pueden combinarse dentro del bloque `PROCESO` de una acción según la lógica del algoritmo.*
--- 

## [MANEJO DE ARCHIVOS]

### Creación de archivo
```
ABRIRs(archivo);
```
*Abre el archivo para escritura (crea si no existe).*

### Lectura de archivo
```
ABRIRe(archivo);
LEER(archivo, registro);
```
*ABRIRe abre para lectura; LEER obtiene un registro.*

### Escritura en archivo
```
ESCRIBIR(archivo, registro);
```
*Escribe el registro en el archivo abierto previamente.*

### Cierre de archivo
```
CERRAR(archivo);
```
*Libera el recurso asociado al archivo.*

### Inicialización de archivo (opcional)
```
InicializarArchivo(archivo);
```
*Crea o vacía el archivo antes de usarlo.*

--- 

## [ARREGlos]

### Declaración
```
NOMBRE: ARREGLO[LÍMITE_INF..LÍMITE_SUP] de TIPO;
```
*Ejemplo: `V: ARREGLO[1..10] de ENTERO;`*

### Arreglos multidimensionales
```
MATRIZ: ARREGLO[FILAS_INF..FILAS_SUP, COLUMNAS_INF..COLUMNAS_SUP] de TIPO;
```

### Acceso a elemento
```
NOMBRE[ÍNDICE]
```
*Para multidimensional: `MATRIZ[FILA, COLUMNA]`*

### Carga por teclado (vector)
```
PARA i := LÍMITE_INF HASTA LÍMITE_SUP HACER
    ESCRIBIR('Ingrese valor para posición ', i, ': ');
    LEER(NOMBRE[i]);
Fin_Para;
```

### Carga por teclado (matriz)
```
PARA i := FILAS_INF HASTA FILAS_SUP HACER
    PARA j := COLUMNAS_INF HASTA COLUMNAS_SUP HACER
        ESCRIBIR('Ingrese valor para posición - Fila ', i, ', Col ', j, ': ');
        LEER(MATRIZ[i, j]);
    Fin_Para;
Fin_Para;
```

### Lectura/escritura de valor
```
LEER(NOMBRE[i]);        // obtener valor
NOMBRE[i] := EXPRESIÓN; // asignar valor
ESCRIBIR(NOMBRE[i]);    // mostrar valor
``` 

--- 

## [CORTE DE CONTROL (CONTROL BREAK)]

### Estructura general
```
ACCION NOMBRE ES;
AMBIENTE
    -- Definición de registros y archivos
    REGISTRO_DEFINICION = REGISTRO
        CLAVE1: TIPO;
        CLAVE2: TIPO;
        ...
    fin_reg;
    
    EJEMPLO = REGISTRO
        CLAVE1: TIPO;
        CLAVE2: TIPO;
        DATOS: ...;
    fin_reg;
    
    REG: EJEMPLO;
    ARCH: ARCHIVO DE EJEMPLO;
    
    -- Acumuladores y contadores por nivel de corte
    ACUM_NIVEL1: TIPO;
    ACUM_NIVEL2: TIPO;
    ...
    RESG_NIVEL1: TIPO;   -- resguardo de clave anterior
    RESG_NIVEL2: TIPO;
    ...

PROCEDIMIENTO Inicializar;
    PROCESO
        -- Zerar acumuladores
        ACUM_NIVEL1 := 0;
        ACUM_NIVEL2 := 0;
        ...
        -- Capturar primeras claves como resguardo inicial
        RESG_NIVEL1 := REG.CLAVE1;
        RESG_NIVEL2 := REG.CLAVE2;
        ...
    FIN_PROCESO;
Fin_Proc;

PROCEDIMIENTO CorteNivel1;   // corte del nivel más alto
    PROCESO
        -- Llamada al corte inferior (si existe)
        CorteNivel2;
        -- Emisión de totales parciales del nivel 1
        ESCRIBIR('Total nivel 1: ', RESG_NIVEL1, ' = ', ACUM_NIVEL1);
        -- Acumular a nivel superior (si corresponde)
        -- (ejemplo: ACUM_NIVEL_SUPERIOR := ACUM_NIVEL_SUPERIOR + ACUM_NIVEL1)
        -- Zerar acumuladores de este nivel
        ACUM_NIVEL1 := 0;
        -- Actualizar resguardo
        RESG_NIVEL1 := REG.CLAVE1;
    FIN_PROCESO;
Fin_Proc;

-- (Se repiten procedimientos CorteNivel2, CorteNivel3, ... según la jerarquía)

PROCESO
    ABRIRe(ARCH);               // abrir archivo para lectura
    LEER(ARCH, REG);            // primer registro
    Inicializar;                // preparar contadores y resguardos

    MIENTRAS NFDA(ARCH) HACER
        -- Detectar cambio de corte en cada nivel, de mayor a menor
        SI RESG_NIVEL1 <> REG.CLAVE1 ENTONCES
            CorteNivel1;
        SINO SI RESG_NIVEL2 <> REG.CLAVE2 ENTONCES
            CorteNivel2;
            SINO SI RESG_NIVEL3 <> REG.CLAVE3 ENTONCES
                CorteNivel3;
                ...
            FIN_SI;
        FIN_SI;

        -- Acumular datos del registro actual
        ACUM_NIVEL1 := ACUM_NIVEL1 + REG.CAMPO_NUMERICO;
        ACUM_NIVEL2 := ACUM_NIVEL2 + REG.CAMPO_NUMERICO;
        ...

        LEER(ARCH, REG);        // leer siguiente registro
    FIN_MIENTRAS;

    -- Último corte
    CorteNivel1;
    -- Totales generales (opcional)
    EmitirTotalesGenerales;    // procedimiento que resume todos los niveles
    CERRAR(ARCH);
FinAccion.
``` 

--- 

## [MEZCLA (MERGE) EXCLUSIVA / INCLUSIVA]

### Estructura común
```
ACCION NOMBRE ES;
AMBIENTE
    -- Valor alto (centinela) para indicar fin de archivo
    HV = 99999999;   -- o cualquier valor fuera del rango real
    
    REGISTRO_DEFINICION = REGISTRO
        CLAVE: TIPO;
        CAMPO1: TIPO;
        CAMPO2: TIPO;
        ...;
    fin_reg;
    
    REG1, REG2: REGISTRO_DEFINICION;
    ARCH1, ARCH2: ARCHIVO DE REGISTRO_DEFINICION;
    
    -- Registros auxiliares para manejo de centinela
    AUX1, AUX2: REGISTRO_DEFINICION;

PROCEDIMIENTO LEER_ARCH1;
    PROCESO
        LEER(ARCH1, REG1);
        SI FDA(ARCH1) ENTONCES   -- Fin de archivo
            REG1.CLAVE := HV;      -- asignar centinela
        FIN_SI;
    FIN_PROCESO;
Fin_Proc;

PROCEDIMIENTO LEER_ARCH2;
    PROCESO
        LEER(ARCH2, REG2);
        SI FDA(ARCH2) ENTONCES
            REG2.CLAVE := HV;
        FIN_SI;
    FIN_PROCESO;
Fin_Proc;

PROCESO
    ABRIRe(ARCH1); ABRIRe(ARCH2);
    LEER_ARCH1; LEER_ARCH2;

    MIENTRAS (REG1.CLAVE <> HV) o (REG2.CLAVE <> HV) HACER
        SI REG1.CLAVE < REG2.CLAVE ENTONCES
            -- Procesar solo archivo 1
            [ACCIONES_ARCH1];
            LEER_ARCH1;
        SINO
            SI REG1.CLAVE = REG2.CLAVE ENTONCES
                -- Ambas claves iguales (según tipo de mezcla)
                [ACCIONES_ARCH1];
                LEER_ARCH1;
                [ACCIONES_ARCH2];
                LEER_ARCH2;
            SINO
                -- REG2.CLAVE < REG1.CLAVE
                [ACCIONES_ARCH2];
                LEER_ARCH2;
            FIN_SI;
        FIN_SI;
    FIN_MIENTRAS;

    -- Vaciar restos de cualquier archivo
    MIENTRAS NoFDA(ARCH1) HACER
        [ACCIONES_ARCH1];
        LEER_ARCH1;
    FIN_MIENTRAS;
    MIENTRAS NoFDA(ARCH2) HACER
        [ACCIONES_ARCH2];
        LEER_ARCH2;
    FIN_MIENTRAS;

    CERRAR(ARCH1); CERRAR(ARCH2);
FinAccion.

### Diferencia entre EXCLUSIVA e INCLUSIVA
- **EXCLUSIVA**: Cuando las claves son iguales, se procesa solo una vez (elige uno de los archivos o ninguno, según necesidad). En los ejemplos, la exclusiva procesa solo el archivo 1 y avanza ambos.
- **INCLUSIVA**: Cuando las claves son iguales, se procesan ambos archivos (se ejecuta el bloque de ambas acciones).

--- 

## [SUBSECUENCIA (ANÁLISIS DE CADENAS)]

### Estructura general
```
ACCION NOMBRE ES;
AMBIENTE
    SEC: SECUENCIA de TIPO;   -- secuencia a procesar (caracter o entero)
    V: TIPO;                  -- variable que recibe cada elemento
    I: ENTERO;                -- contador o índice auxiliar
    -- Otros registros o variables necesarios

PROCEDIMIENTO InicializarSecuencia(VAR SEC_LOCAL: SECUENCIA de TIPO);
    PROCESO
        ARR(SEC_LOCAL);       -- posicionar la secuencia al inicio
    FIN_PROCESO;
Fin;

-- Procedimientos de tratamiento específicos (ejemplo: nombre, DNI)
PROCEDIMIENTO TratarNombre(VAR SEC_LOCAL: SECUENCIA de TIPO, V: TIPO);
    PROCESO
        MIENTRAS V <> SEPARADOR HACER
            ESCRIBIR(V);            -- o almacenar/ procesar
            AVZ(SEC_LOCAL, V);      -- avanzar a siguiente carácter
        FIN_MIENTRAS;
    FIN_PROCESO;
Fin;

PROCEDIMIENTO TratarDNI(VAR SEC_LOCAL: SECUENCIA de TIPO, V: TIPO);
    PROCESO
        PARA I := 1 HASTA LONGITUD_ESPERADA, 1 HACER
            ESCRIBIR(V);
            AVZ(SEC_LOCAL, V);
        FIN_PARA;
    FIN_PROCESO;
Fin;

PROCESO
    InicializarSecuencia(SEC);
    AVZ(SEC, V);                -- obtener primer elemento

    MIENTRAS NFDS(SEC) HACER    -- mientras no sea fin de secuencia
        TratarNombre(SEC, V);
        AVZ(SEC, V);              -- avanzar el separador (ej: '-')
        TratarDNI(SEC, V);
        -- éventualmente otro AVZ si hay otro separador
        FIN_MIENTRAS;
    FIN_MIENTRAS;

    CERRAR(SEC);
FinAccion.
``` 

--- 

## [PROCEDIMIENTO (DEFINICIÓN Y LLAMADA)]

### Definición
```
PROCEDIMIENTO NOMBRE([PARÁMETROS]);
    -- opcional: bloque de ambiente local si el dialecto lo permite
    PROCESO
        [CUERPO DEL PROCEDIMIENTO];
    FIN;
Fin_Proc;
```

### Llamada
```
NOMBRE(ARGUMENTOS);
```
*Si el procedimiento modifica parámetros por referencia, usar `var` en la definición y pasar la variable correspondiente.*

--- 

*Estos esquemas pueden combinarse y anidarse dentro del bloque `PROCESO` de una acción según la lógica requerida.* 
