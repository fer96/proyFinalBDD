--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla sucursal taller sitio 3

create or replace trigger t_dml_sucursal_taller_s3
instead of insert or update or delete on sucursal_taller
declare
	v_count number;
begin
	case
		when inserting then
			select count(*) into v_count
			from sucursal_f3
			where sucursal_id =:new.sucursal_id;
			--insercion local
			if v_count > 0 then
				insert into sucursal_taller_f3(sucursal_id,dia_descanso,telefono_atencion)
				values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
			else
				select count(*) into v_count
				from sucursal_f1
				where sucursal_id =:new.sucursal_id;
				--insercion remota s2
				if v_count > 0 then
					insert into sucursal_taller_f1(sucursal_id,dia_descanso,telefono_atencion)
					values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
				else
					select count(*) into v_count
					from sucursal_f2
					where sucursal_id =:new.sucursal_id;
					--insercion remota s3
					if v_count > 0 then
						insert into sucursal_taller_f2(sucursal_id,dia_descanso,telefono_atencion)
						values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
					else 
						select count(*) into v_count
						from sucursal_f4
						where sucursal_id =:new.sucursal_id;
						--insercion remota s4
						if v_count > 0 then
							insert into sucursal_taller_f4(sucursal_id,dia_descanso,telefono_atencion)
							values(:new.sucursal_id,:new.dia_descanso,:new.telefono_atencion);
						else
							raise_application_error(-20020,'
								El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
						end if;
					end if;
				end if;
			end if;
		when updating then
			raise_application_error(-20030,'
				Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		when deleting then
			select count(*) into v_count
			from sucursal_f3
			where sucursal_id =:new.sucursal_id;
			--insercion local
			if v_count > 0 then
				delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
			else
				select count(*) into v_count
				from sucursal_f1
				where sucursal_id =:new.sucursal_id;
				--insercion remota s2
				if v_count > 0 then
					delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;
				else
					select count(*) into v_count
					from sucursal_f2
					where sucursal_id =:new.sucursal_id;
					--insercion remota s3
					if v_count > 0 then
						delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
					else 
						select count(*) into v_count
						from sucursal_f4
						where sucursal_id =:new.sucursal_id;
						--insercion remota s4
						if v_count > 0 then
							delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;
						else
							raise_application_error(-20020,'
								El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
						end if;
					end if;
				end if;
			end if;
	end case;
end;
/
show errors;