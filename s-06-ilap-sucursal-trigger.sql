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
		if (:new.es_taller = 1 and :new.es_venta = 1) or substr(:new.clave,3,4) = 'NO' then
			insert into sucursal_f1_drf_s1 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,4) = 'EA' then
			insert into sucursal_f2_mved_s2 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,4) = 'WS' then
			insert into sucursal_f3_drf_s3 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,4) = 'SO' then
			insert into sucursal_f4_mved_s4 (sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
			values(:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre, :new.latitud, :new.longitud, :new.url);
		else
			raise_application_error(-20010,
			'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
		end if;
		when updating then --UPDATE
			raise_application_error(-20030,'Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		when deleting then --DELETE
		if (:old.es_taller = 1 and :old.es_venta = 1) or substr(:old.clave,3,4) = 'NO' then
			delete from sucursal_f1_drf_s1 where sucursal_id = :old.sucursal_id;
		elsif (:old.es_taller <> :old.es_venta) and substr(:old.clave,3,4) = 'EA' then
			delete from sucursal_f2_mved_s2 where sucursal_id = :old.sucursal_id;
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,4) = 'WS'
			delete from sucursal_f3_drf_s3 where sucursal_id = :old.sucursal_id;
		elsif (:new.es_taller <> :new.es_venta) and substr(:new.clave,3,4) = 'SO'
			delete from sucursal_f4_mved_s4 where sucursal_id = :old.sucursal_id;
		else
		raise_application_error(-20010,
		'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
		end if;
		end case;
	end;
/
show errors;
