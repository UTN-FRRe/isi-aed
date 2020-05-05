program archivo_corte_2;
uses crt, sysutils;

type

	auto = record
		prov: string[50];
		dpto: integer;
		ciu: integer;
		dominio: string[7];
		modelo: integer;
		tipo: string[50];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_autos = file of auto;

var
	reg: auto;
	arch: archivo_autos; //Uso el tipo de dato definido

	autos_mas_5_ciu, autos_mas_5_dpto, autos_mas_5_prov, autos_mas_5_tot: integer;
	autos_menos_5_ciu, autos_menos_5_dpto, autos_menos_5_prov, autos_menos_5_tot: integer;
	resg_prov: string[50];
	resg_ciu, resg_dpto: integer;
	RecordCount, Anio_Actual: integer;

Procedure InicializarArchivo(VAR arch_local: archivo_autos);
	
	begin

		assign(arch_local, 'datos_auto.dat');

		//Control de acciones sobre el archivo
		{$I-}				
			reset(arch_local);				
		{$I+}

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure Inicializar;
	begin
		autos_mas_5_ciu := 0; autos_mas_5_dpto := 0; autos_mas_5_prov := 0; autos_mas_5_tot := 0;
		autos_menos_5_ciu := 0; autos_menos_5_dpto := 0; autos_menos_5_prov := 0; autos_menos_5_tot := 0;
	end;

Procedure EmitirTotalesGenerales;
	begin
		writeln('***************************************************');
		writeln('Total PAIS -- Autos: ', autos_mas_5_tot + autos_menos_5_tot);
		writeln('Total PAIS -- Autos menos de 5 anios: ', autos_menos_5_tot);
		writeln('Total PAIS -- Autos mas o igual a 5 anios: ', autos_mas_5_tot);
		writeln('***************************************************');
	end;

Procedure CorteCiudad;
	begin
		//Escribo totales parciales		
		writeln('Total ciudad: ', resg_ciu, ' -- Autos: ', autos_mas_5_ciu + autos_menos_5_ciu);
		writeln('Total ciudad -- Autos menos de 5 anios: ', autos_menos_5_ciu);
		writeln('Total ciudad -- Autos mas o igual a 5 anios: ', autos_mas_5_ciu);
		writeln('---------------------------------------------');
		//Acumulo a nivel superior
		autos_mas_5_dpto := autos_mas_5_dpto + autos_mas_5_ciu;
		autos_menos_5_dpto := autos_menos_5_dpto + autos_menos_5_ciu;
		//Pongo cero los acumuladores de provincia
		autos_mas_5_ciu := 0;
		autos_menos_5_ciu := 0;
		//Resguardo las clasves
		resg_ciu := reg.ciu;
		//Freno para ver
		delay(2500);
	end;

Procedure CorteDpto;
	begin
		//Lamo al corte inferior
		CorteCiudad;		
		//Escribo totales parciales		
		writeln('Total dpto: ', resg_dpto, ' -- Autos: ', autos_mas_5_dpto + autos_menos_5_dpto);
		writeln('Total dpto -- Autos menos de 5 anios: ', autos_menos_5_dpto);
		writeln('Total dpto -- Autos mas o igual a 5 anios: ', autos_mas_5_dpto);
		writeln('---------------------------------------------');
		//Acumulo a nivel superior
		autos_mas_5_prov := autos_mas_5_prov + autos_mas_5_dpto;
		autos_menos_5_prov := autos_menos_5_prov + autos_menos_5_dpto;
		//Pongo cero los acumuladores de provincia
		autos_mas_5_dpto := 0;
		autos_menos_5_dpto := 0;
		//Resguardo las clasves
		resg_dpto := reg.dpto;
		//Freno para ver
		delay(2500);
	end;

Procedure CorteProvincia;
	begin
		//Lamo al corte inferior
		CorteDpto;		
		//Escribo totales parciales		
		writeln('Total provincia: ', resg_prov, ' -- Autos: ', autos_mas_5_prov + autos_menos_5_prov);
		writeln('Total provincia -- Autos menos de 5 anios: ', autos_menos_5_prov);
		writeln('Total provincia -- Autos mas o igual a 5 anios: ', autos_mas_5_prov);
		writeln('---------------------------------------------');
		//Acumulo a nivel superior
		autos_mas_5_tot := autos_mas_5_tot + autos_mas_5_prov;
		autos_menos_5_tot := autos_menos_5_tot + autos_menos_5_prov;
		//Pongo cero los acumuladores de provincia
		autos_mas_5_prov := 0;
		autos_menos_5_prov := 0;
		//Resguardo las clasves
		resg_prov := reg.prov;
		//Freno para ver
		delay(2500);
	end;

begin
	//Creo el archivo vacion
	InicializarArchivo(arch);

	//Inicializar variables
	Inicializar;

	Anio_Actual := 2020;
	RecordCount := 0;

	while not eof(arch) do
		begin
			read(arch, reg);

			RecordCount := RecordCount + 1;

			//Controlo que no ingrese con el primer registro al corte
			if RecordCount > 1 then
				begin
					if Trim(UpperCase(resg_prov)) <> Trim(UpperCase(reg.prov)) then
						CorteProvincia
					else if resg_dpto <> reg.dpto then
							CorteDpto
						 else if resg_ciu <> reg.ciu then
						 		CorteCiudad;
				end
			else
				begin
					//Hago el primer resguardo
					resg_prov := reg.prov;
					resg_dpto := reg.dpto;
					resg_ciu := reg.ciu;
				end;

			if Anio_Actual - reg.modelo <= 5 then
				autos_menos_5_ciu := autos_menos_5_ciu + 1
			else
				autos_mas_5_ciu := autos_mas_5_ciu + 1;				

			writeln('(Reg ', RecordCount, ') ********', reg.prov, ' -- ', reg.dpto, ' -- ', reg.ciu, ' -- ', reg.dominio, ' -- ', reg.modelo, ' -- ', reg.tipo);			
		end;

	CorteProvincia;
	EmitirTotalesGenerales;
	close(arch);

end.