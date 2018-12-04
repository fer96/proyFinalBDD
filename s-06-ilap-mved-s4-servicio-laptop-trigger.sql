--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Creacion de trigger para la tabla servicio_laptop en sitio 4

create or replace trigger t_dml_servicio_laptop_s4
instead of insert or delete on servicio_laptop
declare
v_count number;
begin
	case
		when inserting then
			select count(*) into v_count
			from laptop_f5
			where laptop_id = :new.laptop_id;
			--inserción local
			if v_count > 0 then
				insert into ti_servicio_laptop_f4(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
				values (:new.laptop_id,:new.num_servicio,:new.sucursal_id,:new.importe,:new.diagnostico,:new.factura);
				insert into servicio_laptop_f4(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
				select laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura from ti_servicio_laptop_f4
				where laptop_id = :new.laptop_id
				and num_servicio = :new.num_servicio;
				delete from ti_servicio_laptop_f4 where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
			else
				select count(*) into v_count
				from laptop_f2
				where laptop_id = :new.laptop_id;
				--inserción local servicio_laptop_f1
				if v_count > 0 then
					insert into ti_servicio_laptop_f1(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
					values (:new.laptop_id,:new.num_servicio,:new.sucursal_id,:new.importe,:new.diagnostico,:new.factura);
					insert into servicio_laptop_f1(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
					select laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura from ti_servicio_laptop_f1
					where laptop_id = :new.laptop_id
					and num_servicio = :new.num_servicio;
					delete from ti_servicio_laptop_f1 where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
				else
					select count(*) into v_count
					from laptop_f4
					where laptop_id = :new.laptop_id;
					--inserción local servicio_laptop_f3
					if v_count > 0 then
						insert into ti_servicio_laptop_f3(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
						values (:new.laptop_id,:new.num_servicio,:new.sucursal_id,:new.importe,:new.diagnostico,:new.factura);
						insert into servicio_laptop_f3(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
						select laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura from ti_servicio_laptop_f3
						where laptop_id = :new.laptop_id
						and num_servicio = :new.num_servicio;
						delete from ti_servicio_laptop_f3 where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
					else
						select count(*) into v_count
						from laptop_f3
						where laptop_id = :new.laptop_id;
						--inserción local servicio_laptop_f2
						if v_count > 0 then
							insert into ti_servicio_laptop_f2(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
							values (:new.laptop_id,:new.num_servicio,:new.sucursal_id,:new.importe,:new.diagnostico,:new.factura);
							insert into servicio_laptop_f2(laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura)
							select laptop_id,num_servicio,sucursal_id,importe,diagnostico,factura from ti_servicio_laptop_f2
							where laptop_id = :new.laptop_id
							and num_servicio = :new.num_servicio;
							delete from ti_servicio_laptop_f2 where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
						else
						raise_application_error(-20020,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
						end if;
					end if;
				end if;
			end if;

		when updating then
			raise_application_error(-20030,'Se intentó realizar una operación update. Para proósitos del proyecto, esta operación no estará implementada.');
		when deleting then
			select count(*) into v_count
			from laptop_f5
			where laptop_id = :old.laptop_id;
			--inserción local
			if v_count > 0 then
				delete from servicio_laptop_f4 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
			else
				select count(*) into v_count
				from laptop_f2
				where laptop_id = :old.laptop_id;
				--inserción local servicio_laptop_f1
				if v_count > 0 then
					delete from servicio_laptop_f1 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
				else
					select count(*) into v_count
					from laptop_f4
					where laptop_id = :old.laptop_id;
					--inserción local servicio_laptop_f3
					if v_count > 0 then
						delete from servicio_laptop_f3 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
					else
						select count(*) into v_count
						from laptop_f3
						where laptop_id = :old.laptop_id;
						--inserción local servicio_laptop_f4
						if v_count > 0 then
							delete from servicio_laptop_f2 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
						else
						raise_application_error(-20020,'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
						end if;
					end if;
				end if;
			end if;
	end case;
end;
/
show errors;