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