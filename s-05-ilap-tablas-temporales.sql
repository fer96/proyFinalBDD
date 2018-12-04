--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creacion tablas temporales 

Prompt eliminando tablas en caso de existir

declare
	cursor cur_tablas is
		select table_name
		from user_tables
		where table_name in ('TI_LAPTOP_F1','TS_LAPTOP_F1')
		or table_name like 'T%_SERVICIO_LAPTOP_F_%';
begin
  for r in cur_tablas loop
		execute immediate 'drop table ' || r.table_name; 
	end loop;
end; 
/
 
Prompt tablas temporales para la tabla laptop 

create global temporary table ti_laptop_f1(
	laptop_id number(10,0) constraint ti_laptop_f1_pk primary key,
 	foto blob not null
) on commit preserve rows;
create global temporary table ts_laptop_f1(
	laptop_id number(10,0) constraint ts_laptop_f1_pk primary key,
	foto blob not null
) on commit preserve rows;

Prompt tablas temporales para la tabla servicio_laptop 

create global temporary table ti_servicio_laptop_f1(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ti_servicio_laptop_f1_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;
create global temporary table ts_servicio_laptop_f1(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ts_servicio_laptop_f1_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ti_servicio_laptop_f2(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ti_servicio_laptop_f2_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;
create global temporary table ts_servicio_laptop_f2(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ts_servicio_laptop_f2_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ti_servicio_laptop_f3(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ti_servicio_laptop_f3_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;
create global temporary table ts_servicio_laptop_f3(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ts_servicio_laptop_f3_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ti_servicio_laptop_f4(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ti_servicio_laptop_f4_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;
create global temporary table ts_servicio_laptop_f4(
	num_servicio number(10, 0) not null, laptop_id number(10, 0) not null,
	importe number(8,2) not null, diagnostico varchar2(2000) not null,
	factura blob, sucursal_id number(10,0) not null,
	constraint ts_servicio_laptop_f4_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;