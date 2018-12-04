--Codigo borrado

--tipo procesador
create or replace synonym tipo_procesador_s1 for tipo_procesador_drf_s1;
create or replace synonym tipo_procesador_s2 for tipo_procesador_mved_s2@mved_s1.fi.unam;
create or replace synonym tipo_procesador_s3 for tipo_procesador_drf_s3@fdlrsbd_s2;
create or replace synonym tipo_procesador_s4 for tipo_procesador_mved_s4@mved_s2.fi.unam;

--tipo tarjeta de video
create or replace synonym tipo_tarjeta_video_s1 for tipo_tarjeta_video_drf_s1;
create or replace synonym tipo_tarjeta_video_s2 for tipo_tarjeta_video_mved_s2@mved_s1.fi.unam;
create or replace synonym tipo_tarjeta_video_s3 for tipo_tarjeta_video_drf_s3@fdlrsbd_s2;
create or replace synonym tipo_tarjeta_video_s4 for tipo_tarjeta_video_mved_s4@mved_s2.fi.unam;

--tipo almacenamiento
create or replace synonym tipo_almacenamiento_s1 for tipo_almacenamiento_drf_s1;
create or replace synonym tipo_almacenamiento_s2 for tipo_almacenamiento_mved_s2@mved_s1.fi.unam;
create or replace synonym tipo_almacenamiento_s3 for tipo_almacenamiento_drf_s3@fdlrsbd_s2;
create or replace synonym tipo_almacenamiento_s4 for tipo_almacenamiento_mved_s4@mved_s2.fi.unam;

--tipo monitor
create or replace synonym tipo_monitor_s1 for tipo_monitor_drf_s1;
create or replace synonym tipo_monitor_s2 for tipo_monitor_mved_s2@mved_s1.fi.unam;
create or replace synonym tipo_monitor_s3 for tipo_monitor_drf_s3@fdlrsbd_s2;
create or replace synonym tipo_monitor_s4 for tipo_monitor_mved_s4@mved_s2.fi.unam;

--status laptop
create or replace synonym status_laptop_s1 for status_laptop_drf_s1;
create or replace synonym status_laptop_s2 for status_laptop_mved_s2@mved_s1.fi.unam;
create or replace synonym status_laptop_s3 for status_laptop_drf_s3@fdlrsbd_s2;
create or replace synonym status_laptop_s4 for status_laptop_mved_s4@mved_s2.fi.unam;


Prompt validando sinonimos para tipo_procesador 
select count(*) from tipo_procesador_s1
union
select count(*) from tipo_procesador_s2
union
select count(*) from tipo_procesador_s3 
union
select count(*) from tipo_procesador_s4;

Prompt validando sinonimos para tipo_tarjeta_video 
select count(*) from tipo_tarjeta_video_s1
union
select count(*) from tipo_tarjeta_video_s2
union
select count(*) from tipo_tarjeta_video_s3 
union
select count(*) from tipo_tarjeta_video_s4;

Prompt validando sinonimos para tipo_almacenamiento 
select count(*) from tipo_almacenamiento_s1
union
select count(*) from tipo_almacenamiento_s2
union
select count(*) from tipo_almacenamiento_s3 
union
select count(*) from tipo_almacenamiento_s4;

Prompt validando sinonimos para tipo_monitor 
select count(*) from tipo_monitor_s1
union
select count(*) from tipo_monitor_s2
union
select count(*) from tipo_monitor_s3 
union
select count(*) from tipo_monitor_s4;

Prompt validando sinonimos para status_laptop 
select count(*) from status_laptop_s1
union
select count(*) from status_laptop_s2
union
select count(*) from status_laptop_s3 
union
select count(*) from status_laptop_s4;


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