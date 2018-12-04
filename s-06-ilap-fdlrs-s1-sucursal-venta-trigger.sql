--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla sucursal venta sitio 1

create or replace trigger t_dml_sucursal_venta_s1
instead of insert or update or delete on sucursal_venta
declare
	v_count number;
begin
	case
		when inserting then
			select count(*) into v_count
			from sucursal_f1
			where sucursal_id =:new.sucursal_id;
			--insercion local
			if v_count > 0 then
				insert into sucursal_venta_f1(sucursal_id,hora_apertura,hora_cierre)
				values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
			else
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id =:new.sucursal_id;
				--insercion remota s2
				if v_count > 0 then
					insert into sucursal_venta_f2(sucursal_id,hora_apertura,hora_cierre)
					values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
				else
					select count(*) into v_count
					from sucursal_f3
					where sucursal_id =:new.sucursal_id;
					--insercion remota s3
					if v_count > 0 then
						insert into sucursal_venta_f3(sucursal_id,hora_apertura,hora_cierre)
						values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
					else 
						select count(*) into v_count
						from sucursal_f4
						where sucursal_id =:new.sucursal_id;
						--insercion remota s4
						if v_count > 0 then
							insert into sucursal_venta_f4(sucursal_id,hora_apertura,hora_cierre)
							values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
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
			from sucursal_f1
			where sucursal_id =:old.sucursal_id;
			--insercion local
			if v_count > 0 then
				delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;
			else
				select count(*) into v_count
				from sucursal_f2
				where sucursal_id =:old.sucursal_id;
				--insercion remota s2
				if v_count > 0 then
					delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;
				else
					select count(*) into v_count
					from sucursal_f3
					where sucursal_id =:old.sucursal_id;
					--insercion remota s3
					if v_count > 0 then
						delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;
					else 
						select count(*) into v_count
						from sucursal_f4
						where sucursal_id =:old.sucursal_id;
						--insercion remota s4
						if v_count > 0 then
							delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;
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