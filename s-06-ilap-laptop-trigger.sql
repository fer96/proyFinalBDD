--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla laptop

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
declare
begin
	case
		when inserting then
			--Manejo blobs
			insert into ti_laptop_f1(laptop_id,foto)
			values(:new.laptop_id,:new.foto);
			insert into laptop_f1
			select * from ti_laptop_f1
			where laptop_id = :new.laptop_id;
			delete from ti_laptop_f1
			where laptop_id = :new.laptop_id;
			--Datos normales
			if (substr(:new.num_serie,1,1) in ('0','1')) then
				insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,
					:new.laptop_reemplazo_id);
			elsif (substr(:new.num_serie,1,1) in ('2','3')) then
				insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,
					:new.laptop_reemplazo_id);
			elsif (substr(:new.num_serie,1,1) in ('4','5')) then
				insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,
					:new.laptop_reemplazo_id);
			elsif (substr(:new.num_serie,1,1) in ('6','7','8','9')) then
				insert into laptop_f5(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
					tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,
					laptop_reemplazo_id)
				values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
					:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,
					:new.laptop_reemplazo_id);
			else
				raise_application_error(-20010,
					'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
			end if;
		when updating then
			raise_application_error(-20030,'Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		when deleting then
			delete from laptop_f1 where laptop_id = :old.laptop_id;
			if (substr(:old.num_serie,1,1) in ('0','1')) then
				delete from laptop_f2 where laptop_id = :old.laptop_id;
			elsif (substr(:old.num_serie,1,1) in ('2','3')) then
				delete from laptop_f3 where laptop_id = :old.laptop_id;
			elsif (substr(:old.num_serie,1,1) in ('4','5')) then
				delete from laptop_f4 where laptop_id = :old.laptop_id;
			elsif (substr(:old.num_serie,1,1) in ('6','7','8','9')) then
				delete from laptop_f5 where laptop_id = :old.laptop_id;
			else
				raise_application_error(-20010,
					'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
			end if;
	end case;
end;
/
show errors;
