--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creacion de sinonimos para el sitio 1

--Sucursal
create or replace synonym sucursal_f1 for sucursal_f1_drf_s1;
create or replace synonym sucursal_f2 for sucursal_f2_mved_s2@mved_s1.fi.unam;
create or replace synonym sucursal_f3 for sucursal_f3_drf_s3@fdlrsbd_s2;
create or replace synonym sucursal_f4 for sucursal_f4_mved_s4@mved_s2.fi.unam;

--sucursal taller
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_drf_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_mved_s2@mved_s1.fi.unam;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_drf_s3@fdlrsbd_s2;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_mved_s4@mved_s2.fi.unam;

--sucursal venta
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_drf_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_mved_s2@mved_s1.fi.unam;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_drf_s3@fdlrsbd_s2;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_mved_s4@mved_s2.fi.unam;

--laptop
create or replace synonym laptop_f1 for laptop_f1_mved_s4@mved_s2.fi.unam;
create or replace synonym laptop_f2 for laptop_f2_drf_s1;
create or replace synonym laptop_f3 for laptop_f3_mved_s2@mved_s1.fi.unam;
create or replace synonym laptop_f4 for laptop_f4_drf_s3@fdlrsbd_s2;
create or replace synonym laptop_f5 for laptop_f5_mved_s4@mved_s2.fi.unam;

--laptop inventario
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_drf_s3@fdlrsbd_s2;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_drf_s1;

--historico status laptop
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_mved_s2@mved_s1.fi.unam;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_drf_s1;

--servicio laptop
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_drf_s1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_mved_s2@mved_s1.fi.unam;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_drf_s3@fdlrsbd_s2;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_mved_s4@mved_s2.fi.unam;

