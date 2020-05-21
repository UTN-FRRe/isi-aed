program archivo_leer;
uses crt;

const
	HV = 2147483647; //Mayor valor posible de un tipo de dato LONGINT

type

	cliente = record
		Cuenta: longint;
		Denominacion: string[80];
		Domicilio: string[80];
		SucursalId: integer;
	end;
	
	//Creo un tipo de dato para poder usar en los parametros
	archivo_clientes = file of cliente;	

var
	reg_suc1: cliente;
	reg_suc2: cliente;
	arch_suc1: archivo_clientes; 
	arch_suc2: archivo_clientes; 
	arch_sal: archivo_clientes; 
	RecordCount: integer;
	
Procedure InicializarArchivo(VAR arch_local: archivo_clientes; nombre_arch: string; tipo: integer);
	
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

Procedure LeerArch(var arch_local: archivo_clientes; VAR reg_local: cliente);
	
	begin

		read(arch_local, reg_local);

		if eof(arch_local) then
			reg_local.Cuenta := HV;	

	end;

begin
	//Inicializo los archivos
	InicializarArchivo(arch_suc1, 'datos_cliente_suc1.dat', 1);
	InicializarArchivo(arch_suc2, 'datos_cliente_suc2.dat', 1);
	InicializarArchivo(arch_sal, 'datos_cliente_sal.dat', 2);

	reg_suc1.Cuenta := 0;
	reg_suc2.Cuenta := 0;

	RecordCount := 1;
	writeln('Cuenta --  Denominacion -- Domicilio -- Sucursal');

	while (reg_suc1.Cuenta <> HV) or (reg_suc2.Cuenta <> HV) do
		begin

			if RecordCount = 1 then
				begin
					LeerArch(arch_suc1, reg_suc1);
					LeerArch(arch_suc2, reg_suc2);
				end;

			if reg_suc1.Cuenta < reg_suc2.Cuenta then
				begin
					//Paso registro archivo 1
					writeln('Reg 1 MENOR ... Paso Reg 1');
					writeln(reg_suc1.Cuenta, ' -- ', reg_suc1.Denominacion, ' -- ', reg_suc1.Domicilio, ' -- ', reg_suc1.SucursalId);
					write(arch_sal, reg_suc1);

					LeerArch(arch_suc1, reg_suc1);					
				end
			else
				if reg_suc1.Cuenta = reg_suc2.Cuenta then
					begin
						writeln('Reg 1 = Reg 2 ... Paso Reg 1 y 2');
						//Paso registro archivo 1 -- en primer lugar
						writeln(reg_suc1.Cuenta, ' -- ', reg_suc1.Denominacion, ' -- ', reg_suc1.Domicilio, ' -- ', reg_suc1.SucursalId);
						write(arch_sal, reg_suc1);
						//Paso registro archivo 2 -- en segundo lugar
						writeln(reg_suc2.Cuenta, ' -- ', reg_suc2.Denominacion, ' -- ', reg_suc2.Domicilio, ' -- ', reg_suc2.SucursalId);
						write(arch_sal, reg_suc2);

						LeerArch(arch_suc1, reg_suc1);
						LeerArch(arch_suc2, reg_suc2);
					end
				else
					//reg_suc1.Cuenta > reg_suc2.Cuenta
					begin
						writeln('Reg 1 MAYOR ... Paso Reg 2');
						//Paso registro archivo 2 -- en segundo lugar
						writeln(reg_suc2.Cuenta, ' -- ', reg_suc2.Denominacion, ' -- ', reg_suc2.Domicilio, ' -- ', reg_suc2.SucursalId);
						write(arch_sal, reg_suc2);

						LeerArch(arch_suc2, reg_suc2);
					end;


			//Pausa para ver registro porcesados
			RecordCount := RecordCount + 1;
			if RecordCount mod 10 = 0 then delay(2000);
		end;

	
	close(arch_suc1);
	close(arch_suc2);
	close(arch_sal);

end.