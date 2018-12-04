--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Script main para triggers

clear screen
whenever sqlerror exit rollback;

Prompt ==============================
Prompt Creando triggers en fdlrsbd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@fdlrsbd_s1 
@s-06-ilap-sucursal-trigger.sql 
@s-06-ilap-fdlrs-s1-sucursal-taller-trigger.sql 
@s-06-ilap-fdlrs-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql 
@s-06-ilap-historico-status-laptop-trigger.sql 
@s-06-ilap-fdlrs-s1-servicio-laptop-trigger.sql

Prompt ============================== 
Prompt Creando triggers en mved_s1 
Prompt ============================== 
connect ilap_bdd/ilap_bdd@mved_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-mved-s2-sucursal-taller-trigger.sql 
@s-06-ilap-mved-s2-sucursal-venta-trigger.sql 
@s-06-ilap-laptop-trigger.sql 
@s-06-ilap-laptop-inventario-trigger.sql 
@s-06-ilap-laptop-inventario-trigger.sql 
@s-06-ilap-historico-status-laptop-trigger.sql 
@s-06-ilap-mved-s2-servicio-laptop-trigger.sql

Prompt ==============================
Prompt Creando triggers en fdlrsbd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@fdlrsbd_s2 
@s-06-ilap-sucursal-trigger.sql 
@s-06-ilap-fdlrs-s2-sucursal-taller-trigger.sql 
@s-06-ilap-fdlrs-s2-sucursal-venta-trigger.sql 
@s-06-ilap-laptop-trigger.sql 
@s-06-ilap-laptop-inventario-trigger.sql 
@s-06-ilap-historico-status-laptop-trigger.sql 
@s-06-ilap-fdlrs-s2-servicio-laptop-trigger.sql

Prompt ==============================
Prompt Creando triggers en mved_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@mved_s2 
@s-06-ilap-sucursal-trigger.sql 
@s-06-ilap-mved-s4-sucursal-taller-trigger.sql 
@s-06-ilap-mved-s4-sucursal-venta-trigger.sql 
@s-06-ilap-laptop-trigger.sql 
@s-06-ilap-laptop-inventario-trigger.sql 
@s-06-ilap-historico-status-laptop-trigger.sql 
@s-06-ilap-mved-s4-servicio-laptop-trigger.sql

Prompt Listo!
--exit;