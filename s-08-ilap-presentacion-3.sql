--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripción: Archivo de carga inicial - fragmentos 

clear screen
set serveroutput on
--Para visualizar 
export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ====================================== 
Prompt Preparando carga de Datos
Prompt ======================================
Prompt => Seleccionar la PDB LOCAL para insertar datos
Prompt => Para seleccionar una PDB remota, asegurarse que los archivos existen.

connect ilap_bdd/ilap_bdd@&pdb
Prompt Personalizando el formato de fechas

alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

Prompt =>Al ocurrir un error se saldrá del programa y se hará rollback

whenever sqlerror exit rollback
Prompt =>Copiando imagenes (laptops y facturas) al directorio /tmp/bdd/proyecto-final
Prompt =>Creando directorio y actualizando permisos

!rm -rf /tmp/bdd/proyecto-final
!mkdir -p /tmp/bdd/proyecto-final/imagenes/facturas
!mkdir -p /tmp/bdd/proyecto-final/imagenes/laptops
!cp carga-inicial/facturas/fa*.png /tmp/bdd/proyecto-final/imagenes/facturas 
!cp carga-inicial/laptops/lap*.png /tmp/bdd/proyecto-final/imagenes/laptops 
!chmod -R 777 /tmp/bdd/proyecto-final
Prompt ================================================== 
Prompt Listo para Iniciar ?
Prompt ================================================== 
Pause Presionar Enter para Iniciar, Ctrl-C para cancelar 
Prompt Insertando datos ....

begin
	dbms_output.put_line('Insertando sucursales');
	--es_venta = 0, es_taller = 1 
	@carga-inicial/sucursal-1.sql
	--es_venta = 1, es_taller = 0 
	@carga-inicial/sucursal-2.sql
	--es_venta= 1, es_taller = 1
	@carga-inicial/sucursal-3.sql
	dbms_output.put_line('Insertando sucursales tipo taller'); 
	-- id 1 al 1000
	@carga-inicial/sucursal_taller-1.sql
	-- id 2001 al 3000
	@carga-inicial/sucursal_taller-2.sql
	dbms_output.put_line('Insertando sucursales tipo venta'); 
	-- id 1001 al 2000
	@carga-inicial/sucursal_venta-1.sql
	-- id 2001 al 3000
	@carga-inicial/sucursal_venta-2.sql
	dbms_output.put_line('Insertando laptops'); 
	--laptops sin reemplazo 
	@carga-inicial/laptop-1.sql
	--Algunas de estas laptops tienen reemplazo
	@carga-inicial/laptop-2.sql 
	dbms_output.put_line('Insertando laptop inventario');
	@carga-inicial/laptop_inventario.sql
	dbms_output.put_line('Insertando historico'); 
	@carga-inicial/historico_status_laptop-1.sql 
	@carga-inicial/historico_status_laptop-2.sql
	dbms_output.put_line('Insertando servicio laptop'); 
	@carga-inicial/servicio_laptop-1.sql 
	@carga-inicial/servicio_laptop-2.sql
	dbms_output.put_line('Carga de datos completa. Haciendo commit!');
  commit;
exception
 	when others then
	dbms_output.put_line('Errores detectados al realizar la carga'); 
	dbms_output.put_line('Se hara rollback');
	rollback; 
	dbms_output.put_line(dbms_utility.format_error_backtrace);
	raise;
end;
/ 
show errors;
exit;