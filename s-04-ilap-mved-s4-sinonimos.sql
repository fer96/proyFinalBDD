--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creación de sinonimos para el sitio 4

--sucursal
create or replace synonym sucursal_f1 for sucursal_f1_drf_s1@fdlrsbd_s1.unam.fi;
create or replace synonym sucursal_f2 for sucursal_f2_mved_s2@mved_s1;
create or replace synonym sucursal_f3 for sucursal_f3_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym sucursal_f4 for sucursal_f4_mved_s4;
--sucursal_taller
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_drf_s1@fdlrsbd_s1.unam.fi;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_mved_s2@mved_s1;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_mved_s4;
--sucursal_venta
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_drf_s1@fdlrsbd_s1.unam.fi;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_mved_s2@mved_s1;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_mved_s4;
--laptop
create or replace synonym laptop_f1 for laptop_f1_mved_s4;
create or replace synonym laptop_f2 for laptop_f2_drf_s1@fdlrsbd_s1.unam.fi;
create or replace synonym laptop_f3 for laptop_f3_mved_s2@mved_s1;
create or replace synonym laptop_f4 for laptop_f4_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym laptop_f5 for laptop_f5_mved_s4;
--laptop_inventario
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_drf_s1@fdlrsbd_s1.unam.fi;
--historico_status_laptop
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_mved_s2@mved_s1;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_drf_s1@fdlrsbd_s1.unam.fi;
--servicio_laptop
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_drf_s1@fdlrsbd_s1.unam.fi;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_mved_s2@mved_s1;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_drf_s3@fdlrsbd_s2.unam.fi;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_mved_s4;
