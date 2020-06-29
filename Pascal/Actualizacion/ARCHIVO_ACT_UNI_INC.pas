program archivo_act_uni_ext;
uses crt, SysUtils, Math;

const
	HV = 2147483647; //Mayor valor posible de un tipo de dato LONGINT

type

	mae = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
		Saldo: real;
		Baja: string[1];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_mae = file of mae;

	mov = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
		Saldo: real;
		TipoMov: string[1];
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_mov = file of mov;
	archivo_log = text;
var
	reg_mae: mae;
	reg_mov: mov;
	arch_mae: archivo_mae; 
	arch_mov: archivo_mov; 
	arch_mae_act: archivo_mae; 
	Action, RecordCount: integer;
	LOG: string;
	arch_log: archivo_log;

Procedure InicializarLog(VAR arch_local: archivo_log; nombre_arch: string; tipo: integer);
	
	begin

		assign(arch_local, nombre_arch);

		case tipo of
			1: 
				//Control de acciones sobre el archivo
				{$I-}				
					reset(arch_local);				
				{$I+}
			2: 
				//Control de acciones sobre el archivo
				{$I-}				
					rewrite(arch_local);				
				{$I+}
		end;

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure InicializarMae(VAR arch_local: archivo_mae; nombre_arch: string; tipo: integer);
	
	begin

		assign(arch_local, nombre_arch);

		case tipo of
			1: 
				//Control de acciones sobre el archivo
				{$I-}				
					reset(arch_local);				
				{$I+}
			2: 
				//Control de acciones sobre el archivo
				{$I-}				
					rewrite(arch_local);				
				{$I+}
		end;

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure InicializarMov(VAR arch_local: archivo_mov; nombre_arch: string; tipo: integer);
	
	begin

		assign(arch_local, nombre_arch);

		case tipo of
			1: 
				//Control de acciones sobre el archivo
				{$I-}				
					reset(arch_local);				
				{$I+}
			2: 
				//Control de acciones sobre el archivo
				{$I-}				
					rewrite(arch_local);				
				{$I+}
		end;

		//Verifico estado de la accion ejecutada
	  	if IOResult <> 0 then	  			  			
		      	writeln('No se pudo abrir el archivo... ERROR');	  	
		    

	end;

Procedure WriteLog(var arch_local: archivo_log; reg_local: string);
	begin
		//Paso maestro Directo
		writeln(reg_local);
		writeln(arch_local, reg_local);		
	end;

Procedure Directo(VAR arch_local: archivo_mae; reg_local: mae);
	begin
		LOG := '[DIR] ' + IntToStr(reg_local.Cuenta) + ' -- ' + reg_local.Denominacion + ' -- ' + reg_local.Domicilio + ' -- ' + FloatToStr(reg_local.Saldo);
		WriteLog(arch_log, LOG);

		//Paso maestro Directo
		write(arch_local, reg_local);		
	end;

Procedure Iguales(VAR arch_local: archivo_mae; reg_mae_local: mae; reg_mov_local: mov);
	begin
		if reg_mov_local.TipoMov = 'A' then
			begin
				LOG := 'ALTA ERROR - ' + IntToStr(reg_mov_local.Cuenta) + ' EXISTE EN MAE ACTUAL';
				WriteLog(arch_log, LOG);
			end	
		else
			if reg_mov_local.TipoMov = 'B' then
				begin
					LOG := '[BAJA] ' + IntToStr(reg_mov_local.Cuenta) + ' -- ' + reg_mov_local.Denominacion;
					WriteLog(arch_log, LOG);

					reg_mae_local.Baja := '*';

					//Paso registro actualizado
					write(arch_local, reg_mae_local);					
				end
			else
				begin
					LOG := '[MODIF] ' + IntToStr(reg_mov_local.Cuenta) + ' -- ' + reg_mov_local.Denominacion + ' -- ' + reg_mov_local.Domicilio + ' -- ' + FloatToStr(reg_mov_local.Saldo);
					WriteLog(arch_log, LOG);

					if length(reg_mov_local.Denominacion) > 0 then
						reg_mae_local.Denominacion := reg_mov_local.Denominacion;

					if length(reg_mov_local.Domicilio) > 0 then
						reg_mae_local.Domicilio := reg_mov_local.Domicilio;						

					if reg_mov_local.Saldo <> 0 then
						reg_mae_local.Saldo := reg_mae_local.Saldo + reg_mov_local.Saldo;						

					//Paso registro actualizado
					write(arch_local, reg_mae_local);
				end;

	end;

Procedure Distintos(VAR arch_local: archivo_mae; reg_mov_local: mov);
	var
		reg_mae_local: mae;

	begin
		if reg_mov_local.TipoMov = 'B' then
			begin
				LOG := 'BAJA ERROR - ' + IntToStr(reg_mov_local.Cuenta) + ' NO EXISTE EN MAE ACTUAL';
				WriteLog(arch_log, LOG);
			end	
		else
			if reg_mov_local.TipoMov = 'M' then
				begin
					LOG := 'MODIF ERROR - ' + IntToStr(reg_mov_local.Cuenta) + ' NO EXISTE EN MAE ACTUAL';
					WriteLog(arch_log, LOG);
				end
			else
				begin
					LOG := '[ALTA] ' + IntToStr(reg_mov_local.Cuenta) + ' -- ' + reg_mov_local.Denominacion + ' -- ' + reg_mov_local.Domicilio + ' -- ' + FloatToStr(reg_mov_local.Saldo);
					WriteLog(arch_log, LOG);

					reg_mae_local.Cuenta := reg_mov_local.Cuenta;
					reg_mae_local.Denominacion := reg_mov_local.Denominacion;
					reg_mae_local.Domicilio := reg_mov_local.Domicilio;						
					reg_mae_local.SucursalId := reg_mov_local.SucursalId;
					reg_mae_local.Saldo := reg_mov_local.Saldo;
					reg_mae_local.Baja := '-';

					//Paso registro actualizado
					write(arch_local, reg_mae_local);
				end;

	end;

Procedure LeerArchMae(var arch_mae_act_local: archivo_mae; var arch_mae_local: archivo_mae; VAR reg_local: mae);
	begin

		read(arch_mae_local, reg_local);

		if eof(arch_mae_local) then
			begin
				
				Directo(arch_mae_act_local, reg_local);
				
				reg_local.Cuenta := HV;	

			end;

	end;

Procedure LeerArchMov(var arch_mae_act_local: archivo_mae; var arch_mov_local: archivo_mov; VAR reg_local: mov);
	begin

		read(arch_mov_local, reg_local);

		if eof(arch_mov_local) then
			begin
				
				Distintos(arch_mae_act_local, reg_local);
				
				reg_local.Cuenta := HV;	
				
			end;

	end;

begin
	//Inicializo los archivos
	InicializarMae(arch_mae, 'datos_mae.dat', 1);
	InicializarMov(arch_mov, 'datos_mov.dat', 1);
	InicializarMae(arch_mae_act, 'datos_mae_act.dat', 2);
	InicializarLog(arch_log, 'LOG.txt', 2);

	reg_mae.Cuenta := 0;
	reg_mov.Cuenta := 0;

	RecordCount := 1;
	Action := 2;
	
	while (reg_mae.Cuenta <> HV) or (reg_mov.Cuenta <> HV) do
		begin

			case action of
				1: LeerArchMae(arch_mae_act, arch_mae, reg_mae);
				3: LeerArchMov(arch_mae_act, arch_mov, reg_mov);
			else
				LeerArchMae(arch_mae_act, arch_mae, reg_mae);
				LeerArchMov(arch_mae_act, arch_mov, reg_mov);
			end;

			LOG := 'Mae: ' + IntToStr(reg_mae.Cuenta) + ' | Mov: ' + IntToStr(reg_mov.Cuenta);
			WriteLog(arch_log, LOG);
			
			if reg_mae.Cuenta < reg_mov.Cuenta then
				begin
					Directo(arch_mae_act, reg_mae);

					Action := 1;
				end
			else
				if reg_mae.Cuenta = reg_mov.Cuenta then
					begin
						Iguales(arch_mae_act, reg_mae, reg_mov);

						Action := 2;
					end
				else
					if reg_mae.Cuenta > reg_mov.Cuenta then
						begin
							Distintos(arch_mae_act, reg_mov);

							Action := 3;
						end;

			//Pausa para ver registro porcesados
			RecordCount := RecordCount + 1;
			if RecordCount mod 10 = 0 then delay(2000);
		end;

	
	close(arch_mae);
	close(arch_mov);
	close(arch_mae_act);
	close(arch_log)

end.