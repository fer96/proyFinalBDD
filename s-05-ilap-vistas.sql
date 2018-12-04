--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creacion de vistas son datos blob

--Sucursal
create or replace view sucursal as
	select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f1
	union all
	select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f2 
	union all
	select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f3 
	union all
	select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f4;

--Sucursal taller
create or replace view sucursal_taller as
	select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f1
	union all
	select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f2
	union all
	select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f3
	union all
	select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f4;

--Sucursal venta
create or replace view sucursal_venta as
	select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f1
	union all
	select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f2
	union all
	select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f3
	union all
	select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f4;

--laptop inventario
create or replace view laptop_inventario as
	select f1.laptop_id,f1.rfc_cliente,f1.num_tarjeta,f2.sucursal_id,f2.fecha_status,f2.status_laptop_id 
	from laptop_inventario_f1 f1
	join laptop_inventario_f2 f2
	on f1.laptop_id = f2.laptop_id;


--historico status laptop
create or replace view historico_status_laptop as
	select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f1
	union all
	select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f2;

--tipo procesador
create or replace view tipo_procesador as
	select distinct tipo_procesador_id,clave,descripcion from tipo_procesador_s1
	union all
	select distinct tipo_procesador_id,clave,descripcion from tipo_procesador_s2
	union all
	select distinct tipo_procesador_id,clave,descripcion from tipo_procesador_s3
	union all
	select distinct tipo_procesador_id,clave,descripcion from tipo_procesador_s4;

--tipo tarjeta_video
create or replace view tipo_tarjeta_video as
	select distinct tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_s1
	union all
	select distinct tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_s2
	union all
	select distinct tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_s3
	union all
	select distinct tipo_tarjeta_video_id,clave,descripcion from tipo_tarjeta_video_s4;

--tipo almacenamiento
create or replace view tipo_almacenamiento as
	select distinct tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_s1
	union all
	select distinct tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_s2
	union all
	select distinct tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_s3
	union all
	select distinct tipo_almacenamiento_id,clave,descripcion from tipo_almacenamiento_s4;

--tipo monitor
create or replace view tipo_monitor as
	select distinct tipo_monitor_id,clave,descripcion from tipo_monitor_s1
	union all
	select distinct tipo_monitor_id,clave,descripcion from tipo_monitor_s2
	union all
	select distinct tipo_monitor_id,clave,descripcion from tipo_monitor_s3
	union all
	select distinct tipo_monitor_id,clave,descripcion from tipo_monitor_s4;

--tipo status_laptop
create or replace view status_laptop as
	select distinct status_laptop_id,clave,descripcion from status_laptop_s1
	union all
	select distinct status_laptop_id,clave,descripcion from status_laptop_s2
	union all
	select distinct status_laptop_id,clave,descripcion from status_laptop_s3
	union all
	select distinct status_laptop_id,clave,descripcion from status_laptop_s4;
