--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creacion funciones datos blob

Prompt creando funcion para extraer dato BLOB de foto_f1

create or replace function get_remote_foto_f1_by_id(p_laptop_id in number)
  return blob is
  pragma autonomous_transaction;
  v_temp_pdf blob;
begin
	--asegura que no haya registros
	delete from ts_laptop_f1;
	--inserta los datos obtenidos del fragmento remoto a la tabla temporal. 
	insert into ts_laptop_f1
  	select laptop_id,foto
  	from laptop_f1
  	where laptop_id = p_laptop_id;
	--obtiene el registro de la tabla temporal y lo regresa como blob
	select foto into v_temp_pdf
	from ts_laptop_f1
	where laptop_id = p_laptop_id;
	--elimina los registros de la tabla temporal una vez que han sido obtenidos. 
	delete from ts_laptop_f1;
	--termina txn autónoma.
	commit;
  return v_temp_pdf;
	exception
  	when others then
		--si ocurre error, termina la txn autónoma.
		rollback;
	raise; 
end;
/
show errors;

Prompt creando funcion para extraer dato BLOB de servicio_laptop_f1

create or replace function get_remote_serv_lap_f1_by_id(p_num_servicio in number, p_laptop_id in number) 
	return blob is
	pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --asegura que no haya registros
	delete from ts_servicio_laptop_f1;
	--inserta los datos obtenidos del fragmento remoto a la tabla temporal. 
	insert into ts_servicio_laptop_f1(num_servicio,laptop_id,factura)
		select num_servicio,laptop_id,factura 
		from servicio_laptop_f1
		where num_servicio = p_num_servicio 
		and laptop_id = p_laptop_id;
	--obtiene el registro de la tabla temporal y lo regresa como blob
	select factura into v_temp_pdf
	from ts_servicio_laptop_f1
	where num_servicio = p_num_servicio
	and laptop_id = p_laptop_id;
	--elimina los registros de la tabla temporal 
	delete from ts_servicio_laptop_f1;
  --termina txn autónoma
	exception
  	when others then
		--si ocurre error, termina la txn autónoma.
    rollback;
  raise;
end;
/
show errors;

Prompt creando funcion para extraer dato BLOB de servicio_laptop_f2

create or replace function get_remote_serv_lap_f2_by_id(p_num_servicio in number, p_laptop_id in number) 
	return blob is
	pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --asegura que no haya registros
	delete from ts_servicio_laptop_f2;
	--inserta los datos obtenidos del fragmento remoto a la tabla temporal. 
	insert into ts_servicio_laptop_f2(num_servicio,laptop_id,factura)
		select num_servicio,laptop_id,factura 
		from servicio_laptop_f2
		where num_servicio = p_num_servicio 
		and laptop_id = p_laptop_id;
	--obtiene el registro de la tabla temporal y lo regresa como blob
	select factura into v_temp_pdf
	from ts_servicio_laptop_f2
	where num_servicio = p_num_servicio
	and laptop_id = p_laptop_id;
	--elimina los registros de la tabla temporal 
	delete from ts_servicio_laptop_f2;
  --termina txn autónoma
	exception
  	when others then
		--si ocurre error, termina la txn autónoma.
    rollback;
  raise;
end;
/
show errors;

Prompt creando funcion para extraer dato BLOB de servicio_laptop_f3

create or replace function get_remote_serv_lap_f3_by_id(p_num_servicio in number, p_laptop_id in number) 
	return blob is
	pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --asegura que no haya registros
	delete from ts_servicio_laptop_f3;
	--inserta los datos obtenidos del fragmento remoto a la tabla temporal. 
	insert into ts_servicio_laptop_f3(num_servicio,laptop_id,factura)
		select num_servicio,laptop_id,factura 
		from servicio_laptop_f3
		where num_servicio = p_num_servicio 
		and laptop_id = p_laptop_id;
	--obtiene el registro de la tabla temporal y lo regresa como blob
	select factura into v_temp_pdf
	from ts_servicio_laptop_f3
	where num_servicio = p_num_servicio
	and laptop_id = p_laptop_id;
	--elimina los registros de la tabla temporal 
	delete from ts_servicio_laptop_f3;
  --termina txn autónoma
	exception
  	when others then
		--si ocurre error, termina la txn autónoma.
    rollback;
  raise;
end;
/
show errors;

Prompt creando funcion para extraer dato BLOB de servicio_laptop_f4

create or replace function get_remote_serv_lap_f4_by_id(p_num_servicio in number, p_laptop_id in number) 
	return blob is
	pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --asegura que no haya registros
	delete from ts_servicio_laptop_f4;
	--inserta los datos obtenidos del fragmento remoto a la tabla temporal. 
	insert into ts_servicio_laptop_f4(num_servicio,laptop_id,factura)
		select num_servicio,laptop_id,factura 
		from servicio_laptop_f4
		where num_servicio = p_num_servicio 
		and laptop_id = p_laptop_id;
	--obtiene el registro de la tabla temporal y lo regresa como blob
	select factura into v_temp_pdf
	from ts_servicio_laptop_f4
	where num_servicio = p_num_servicio
	and laptop_id = p_laptop_id;
	--elimina los registros de la tabla temporal 
	delete from ts_servicio_laptop_f4;
  --termina txn autónoma
	exception
  	when others then
		--si ocurre error, termina la txn autónoma.
    rollback;
  raise;
end;
/
show errors;