--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripción: Script de eliminación de datos

Prompt Seleccionar la PDB para realizar la eliminación de datos

connect ilap_bdd/ilap_bdd@&pdb 
set serveroutput on
Prompt Eliminando datos ... 
begin
	dbms_output.put_line('eliminando datos de historico_status_laptop'); 
	delete from historico_status_laptop;
	dbms_output.put_line('eliminando datos de laptop_inventario'); 
	delete from laptop_inventario;
	dbms_output.put_line('eliminando datos de servicio_laptop'); 
	delete from servicio_laptop;
	dbms_output.put_line(' eliminando datos de sucursal_taller'); 
	delete from sucursal_taller;  
	dbms_output.put_line('eliminando datos de sucursal_venta'); 
	delete from sucursal_venta;
	dbms_output.put_line('eliminando datos de sucursal'); 
	delete from sucursal;
	dbms_output.put_line('eliminando datos de laptop'); 
	delete from laptop;
	dbms_output.put_line('Elimimacion concluida, haciendo commit'); 
	commit;
exception
	when others then
		dbms_output.put_line('Errores detectados al realizar la eliminacion'); 
		dbms_output.put_line('Se hara rollback');
		rollback;
		dbms_output.put_line(dbms_utility.format_error_backtrace);
		raise;
end;
/
show errors;
Prompt Listo!
exit;