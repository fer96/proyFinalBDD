--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla historico status laptop

create or replace trigger t_dml_historico_status_laptop
instead of insert or update or delete on historico_status_laptop
declare
begin
	case
		when inserting then
			if (to_string(fecha_status,'YYYY')>'2009') then
				insert into historico_status_laptop_f1(historico_status_laptop_id,fecha_status,
					status_laptop_id,laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,
					:new.status_laptop_id,:new.laptop_id);
			elsif (to_string(fecha_status,'YYYY')<='2009') then
				insert into historico_status_laptop_f2(historico_status_laptop_id,fecha_status,
					status_laptop_id,laptop_id)
				values(:new.historico_status_laptop_id,:new.fecha_status,
					:new.status_laptop_id,:new.laptop_id);
			else
				raise_application_error(-20010,
					'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
			end if;
		when updating then
			raise_application_error(-20030,'Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		when deleting then
			if (to_string(fecha_status,'YYYY')>'2009') then
				delete from historico_status_laptop_f1 where historico_status_laptop_id = :old.historico_status_laptop_id;
			elsif (to_string(fecha_status,'YYYY')<='2009') then
				delete from historico_status_laptop_f1 where historico_status_laptop_id = :old.historico_status_laptop_id;
			else
				raise_application_error(-20010,
					'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
			end if;
	end case;
end;