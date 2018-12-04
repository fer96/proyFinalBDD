--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Script valida sinonimos

Prompt validando sinonimos para sucursal 
select count(*) from sucursal_f1
union
select count(*) from sucursal_f2
union
select count(*) from sucursal_f3 
union
select count(*) from sucursal_f4;

Prompt validando sinonimos para sucursal_taller 
select count(*) from sucursal_taller_f1
union
select count(*) from sucursal_taller_f2
union
select count(*) from sucursal_taller_f3 
union
select count(*) from sucursal_taller_f4;

Prompt validando sinonimos para sucursal_venta 
select count(*) from sucursal_venta_f1
union
select count(*) from sucursal_venta_f2
union
select count(*) from sucursal_venta_f3 
union
select count(*) from sucursal_venta_f4;

Prompt validando sinonimos para laptop 
select count(*) from laptop_f1
union
select count(*) from laptop_f2
union
select count(*) from laptop_f3 
union
select count(*) from laptop_f4
union
select count(*) from laptop_f5;

Prompt validando sinonimos para laptop_inventario 
select count(*) from laptop_inventario_f1
union
select count(*) from laptop_inventario_f2;

Prompt validando sinonimos para historico_status_laptop 
select count(*) from historico_status_laptop_f1
union
select count(*) from historico_status_laptop_f2;

Prompt validando sinonimos para servicio_laptop 
select count(*) from servicio_laptop_f1
union
select count(*) from servicio_laptop_f2
union
select count(*) from servicio_laptop_f3 
union
select count(*) from servicio_laptop_f4;