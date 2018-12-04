--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla sucursal

---SUCURSAL---
create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
	declare
	--programar
	begin
		case
		when inserting then --INSERT
		if (:new.es_taller = 1 and :new.es_venta = 1) or substr(:new.clave,3,2) = 'NO' then
			insert into sucursal_f1 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,2) = 'EA' then
			insert into sucursal_f2 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,2) = 'WS' then
			insert into sucursal_f3 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,2) = 'SO' then
			insert into sucursal_f4 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		else
			raise_application_error(-20010,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
		end if;
		--UPDATE
		when updating then 
			raise_application_error(-20030,'Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		--DELETE
		when deleting then 
			if (:old.es_taller = 1 and :old.es_venta = 1) or substr(:old.clave,3,2) = 'NO' then
				delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
			elsif (:old.es_taller <> :old.es_venta) and substr(:old.clave,3,2) = 'EA' then
				delete from sucursal_f2 where sucursal_id = :old.sucursal_id;
			elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,2) = 'WS' THEN
				delete from sucursal_f3 where sucursal_id = :old.sucursal_id;
			elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,2) = 'SO' THEN
				delete from sucursal_f4 where sucursal_id = :old.sucursal_id;
			else
				raise_application_error(-20010,
				'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
			end if;
		end case;
	end;
/
show errors;
